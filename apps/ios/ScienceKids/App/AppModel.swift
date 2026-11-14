import AudioKit
import ContentKit
import ContentModel
import Foundation
import LessonEngine
import LessonPlayer
import Observation
import os
import Profiles
import Sync

/// Screens pushed on the main `NavigationStack` (B7.6: Home → Topic → Lesson).
enum AppRoute: Hashable {
    /// A journey topic by its key (SK-030: written or not, every topic opens).
    case topic(String)
    /// SK-012 puts the lesson player behind this route (`MainFlow.destination`).
    case lesson(topicID: UUID, lessonID: UUID)
    /// "Image credits" (SK-033): the credit of every picture in the pack.
    case imageCredits
    /// The flashcards of a lesson's words (SK-035, Từ vựng), by lesson id.
    case words(lessonID: UUID)
    /// Cài đặt (SK-042): the language of the profile in use.
    case settings
}

/// Tabs of the bottom strip on Home (the sidebar on iPad): the journey, then Thẻ, Huy hiệu and
/// Từ vựng (SK-035), all made from the lessons the child has done.
enum HomeTab: String, CaseIterable, Hashable, Sendable {
    case journey
    case cards
    case badges
    case words
}

/// State shared by the app's screens: the child profile, the content, the voice, where the child is.
///
/// - No profile → `OnboardingFlow` (Welcome → Profile); creating one saves the file and switches
///   to `MainFlow` (Home). With a profile at launch the app opens on Home (B7.6).
/// - `content` loads at launch (`loadContent()`, SK-016): the pack with its checks, or the
///   fixtures when the build has no pack. Home waits for it; a pack that fails shows
///   `ContentErrorScreen`.
/// - `sync` (SK-022) keeps the server in step: guest session, profile, attempt queue, Home data.
///   It runs after the content opens, after a profile is made, after each lesson, when the app
///   comes back to the foreground and when the network comes back. It never blocks a screen.
/// - `path` is the main `NavigationStack` path; `homeTab` the tab shown on Home.
@MainActor
@Observable
final class AppModel {
    private(set) var profile: ChildProfile?
    private(set) var content: ContentState
    /// The voice of the lessons; plays the pack's clips once the pack is open.
    let speech: SpeechPlayer
    /// What the parent picks on Welcome and Profile. Kept here, not in a view's `@State`, so the
    /// choices survive the onboarding views being re-created.
    let onboarding = OnboardingModel()
    var path: [AppRoute] = []
    var homeTab: HomeTab = .journey
    /// The age group whose journey Home shows; `nil`: the profile's own (SK-030). Kept here so the
    /// choice survives going into a topic and back.
    var journeyGroup: Topic.AgeGroup?
    /// Server sync; `nil` in tests that do not need it. Off (no transport) when the build has no
    /// Supabase URL and key.
    let sync: SyncEngine?
    /// Bumped when the lesson history changes (a lesson ends, the server settles stars), so Home
    /// reads its stars and streak again.
    private(set) var progressVersion = 0
    /// The child id of a profile file that broke (found in the lesson history): the next profile
    /// made on this device keeps it, so its attempts and its server profile stay its own.
    @ObservationIgnored private(set) var recoveredChildId: UUID?
    /// Sends the queue when the network comes back (B7.7).
    @ObservationIgnored private var network: NetworkWatcher?
    /// SK-034: topic keys Home has already shown as done, so the seal of a topic done is stamped
    /// in only the first time Home shows it (back from its last lesson); `nil` until Home first
    /// shows the journey (what is done then is taken as seen: no stamps at launch). Kept for the
    /// run of the app only; not observed, Home reads it while drawing.
    @ObservationIgnored private var doneShown: Set<String>?

    @ObservationIgnored private let store: ProfileStore?
    /// Lesson attempts under way and finished (SK-012).
    @ObservationIgnored let attempts: AttemptStore?
    /// Words each child knows on the Từ vựng tab (SK-035), on this device only.
    @ObservationIgnored private let words: WordMemoryStore?
    /// The known words read from `words`, by child id: read once per child, written through.
    @ObservationIgnored private var knownWordsCache: [UUID: Set<UUID>] = [:]
    /// Bumped when a child's known words change, so the Từ vựng tab reads them again.
    private(set) var wordsVersion = 0
    /// The lesson history and the attempts under way as last read, for the `progressVersion`
    /// they were read at (tester 10/11 #16: a screen reads them several times per drawing, and
    /// `history.json` grows with every lesson). Both change only with a bump of the version.
    @ObservationIgnored private var historyCache: (version: Int, records: [AttemptRecord])?
    @ObservationIgnored private var inProgressCache: (version: Int, child: UUID, attempts: [AttemptProgress])?
    @ObservationIgnored private let log = Logger(subsystem: Bundle.main.bundleIdentifier ?? "ScienceKids", category: "profile")
    /// Debug: a folder of content files read instead of the bundle (`-SKContentFolder`).
    @ObservationIgnored var contentFolder: URL?
    /// Debug: a content pack on the Mac opened instead of the bundle's (`-SKContentPack`, SK-033).
    @ObservationIgnored var contentPack: URL?
    /// Debug (`-SKOpenLesson`): the lesson to open once the content is ready.
    @ObservationIgnored var openLessonAtLaunch: UUID?

    init(
        store: ProfileStore?, content: ContentState, attempts: AttemptStore? = nil,
        speech: SpeechPlayer = SpeechPlayer(), sync: SyncEngine? = nil, words: WordMemoryStore? = nil, now: Date = Date()
    ) {
        self.store = store
        self.content = content
        self.attempts = attempts
        self.words = words
        self.speech = speech
        self.sync = sync
        do {
            profile = try store?.load()
        } catch {
            // A file that does not decode (SK-011 tester): keep it as `.corrupt-<time>` instead of
            // writing over it, and remember the child of the lessons played so the new profile
            // keeps that id (its attempts in progress and on the server stay its own).
            let kept = try? store?.quarantineCorruptFile(now: now)
            let children = attempts?.childIds(now: now) ?? []
            recoveredChildId = children.count == 1 ? children.first : nil
            log.error("profile file unreadable, kept as \(kept?.lastPathComponent ?? "-", privacy: .public); child id \(self.recoveredChildId == nil ? "not found" : "found", privacy: .public) in the lessons; showing Welcome: \(String(describing: error), privacy: .public)")
            profile = nil
        }
        sync?.onSettled = { [weak self] settled in self?.serverSettled(settled) }
        if let ready = content.ready { use(ready, now: now) }
        applyVoiceSplit()
    }

    /// SK-042 (Duy 13/11): "Cả hai" (`bilingual`) says English by itself and on the main listen
    /// buttons; Vietnamese plays on the small VI button next to each. English and Tiếng Việt play
    /// their one voice as before.
    func applyVoiceSplit() {
        speech.firstLanguageOnly = profile?.languageMode == .bilingual ? "en" : nil
    }

    /// Content already in hand (tests): the fixtures' shape, no pack, no audio.
    convenience init(
        store: ProfileStore?, library: ContentLibrary, syllabus: Syllabus? = nil, attempts: AttemptStore? = nil,
        words: WordMemoryStore? = nil, now: Date = Date()
    ) {
        self.init(
            store: store,
            content: .ready(AppContent(library: library, source: .fixtures, rulesData: nil, pack: nil, syllabus: syllabus)),
            attempts: attempts, words: words, now: now
        )
    }

    /// The lessons on screen; empty while loading or after a failure.
    var library: ContentLibrary { content.ready?.library ?? .empty }

    /// Opens the bundled content (once at launch; again from the error screen's "Thử lại").
    func loadContent(bundle: Bundle = .main) async {
        if content.ready != nil { return }
        content = .loading
        let state: ContentState
        if let contentFolder {
            state = .ready(BundledContent.folder(contentFolder, bundle: bundle))
        } else if let contentPack {
            BundledContent.log.notice("opening the content pack \(contentPack.path, privacy: .public) (launch argument)")
            state = await BundledContent.load(packAt: contentPack, bundle: bundle)
        } else {
            state = await BundledContent.load(bundle: bundle)
        }
        content = state
        if let ready = state.ready { use(ready, now: Date()) }
    }

    private func use(_ ready: AppContent, now: Date) {
        speech.loader = ready.clips
        onboarding.worldsWithLessons = Set(Topic.AgeGroup.known.filter { group in
            ready.journey(for: group).contains { $0.firstPlayable != nil }
        }.map(\.rawValue))
        reopenCutOffLesson(now: now)
        if profile != nil, let id = openLessonAtLaunch, let found = library.lesson(id: id) {
            path = [.lesson(topicID: found.topic.id, lessonID: found.lesson.id)]
        }
    }

    /// B7.6, B4.4: a lesson the app closed in the middle of opens again where it stopped. A lesson
    /// the child left with the close button waits on its topic until the child comes back.
    private func reopenCutOffLesson(now: Date) {
        guard let profile, let attempts else { return }
        let cutOff = attempts.allInProgress(childId: profile.id, now: now).first { !$0.isPaused }
        guard let progress = cutOff, let found = library.lesson(id: progress.lessonId) else { return }
        path = [.lesson(topicID: found.topic.id, lessonID: found.lesson.id)]
    }

    /// The app as launched: profile file in Application Support, content from the bundle.
    static func live(options: LaunchOptions) -> AppModel {
        let store: ProfileStore?
        do {
            store = try ProfileStore.applicationSupport()
        } catch {
            Logger(subsystem: Bundle.main.bundleIdentifier ?? "ScienceKids", category: "profile")
                .error("no Application Support directory: \(String(describing: error), privacy: .public)")
            store = nil
        }
        let attempts = try? AttemptStore.applicationSupport()
        let words = try? WordMemoryStore.applicationSupport()
        if options.resetsProfile {
            // As after a fresh install: no profile, no lesson attempts, no known words.
            try? store?.delete()
            if let attempts { try? FileManager.default.removeItem(at: attempts.directory) }
            if let words { try? FileManager.default.removeItem(at: words.directory) }
        }
        let syncStore = try? SyncStore.applicationSupport()
        if options.resetsProfile, let syncStore {
            // A fresh install has no queue either; the guest session stays in the Keychain, as it
            // does when the app is deleted and installed again.
            try? FileManager.default.removeItem(at: syncStore.directory)
        }
        let speech = SpeechPlayer()
        #if DEBUG
        if options.assumesVoiceOver { speech.isVoiceOverRunning = { true } }
        #endif
        let model = AppModel(
            store: store, content: .loading, attempts: attempts, speech: speech,
            sync: syncStore.map { SyncEngine(transport: Self.transport(options: options), store: $0) },
            words: words
        )
        model.contentFolder = options.contentFolder.map { URL(filePath: $0, directoryHint: .isDirectory) }
        model.contentPack = options.contentPack.map { URL(filePath: $0, directoryHint: .isDirectory) }
        model.openLessonAtLaunch = options.openLesson
        if model.sync?.phase != .off {
            model.network = NetworkWatcher { [weak model] in
                Task { await model?.syncNow() }
            }
        }
        return model
    }

    /// Supabase from Info.plist (`SKSupabaseURL`, `SKSupabasePublishableKey`, filled from the
    /// gitignored `Config/Local.xcconfig`); `nil` (sync off) without them, in hosted unit tests and
    /// with `-SKSyncOff YES`.
    static func transport(options: LaunchOptions, bundle: Bundle = .main) -> (any SyncTransport)? {
        let log = Logger(subsystem: bundle.bundleIdentifier ?? "ScienceKids", category: "sync")
        guard !options.syncOff else {
            log.notice("sync off (launch argument or unit test host)")
            return nil
        }
        guard let config = SyncConfig(info: bundle.infoDictionary ?? [:]) else {
            log.warning("sync off: no Supabase URL and publishable key in this build (Config/Local.xcconfig)")
            return nil
        }
        #if DEBUG
        if options.syncUnreachable, let nowhere = URL(string: "https://sync-unreachable.invalid") {
            log.notice("sync server unreachable on purpose (launch argument)")
            return SupabaseTransport(config: SyncConfig(url: nowhere, publishableKey: config.publishableKey))
        }
        #endif
        return SupabaseTransport(config: config)
    }

    /// Saves the new profile, then shows Home. Throws when the file cannot be written; the
    /// profile screen stays and says so.
    func createProfile(_ newProfile: ChildProfile) throws {
        guard let store else { throw CocoaError(.fileWriteUnknown) }
        var made = newProfile
        if let recovered = recoveredChildId {
            made = ChildProfile(
                id: recovered, displayName: newProfile.displayName, avatar: newProfile.avatar, grade: newProfile.grade,
                ageGroup: newProfile.ageGroup, languageMode: newProfile.languageMode, voiceMode: newProfile.voiceMode,
                timezone: newProfile.timezone, createdAt: newProfile.createdAt
            )
            log.notice("new profile keeps the child id found in the lessons")
        }
        try store.save(made)
        recoveredChildId = nil
        path = []
        homeTab = .journey
        journeyGroup = nil
        doneShown = nil
        profile = made
        applyVoiceSplit()
        Task { await syncNow() }
    }

    // MARK: Sync (SK-022)

    /// Sends what waits and reads Home: the profile once, the finished attempts the server has not
    /// confirmed (from the lesson history, so none is lost to a crash), then `get_home`.
    func syncNow(force: Bool = true) async {
        guard let sync, let profile else { return }
        let history = attempts?.history().filter { $0.childId == profile.id } ?? []
        await sync.sync(profile: ProfilePayload(profile), history: history.map(AttemptPayload.init), force: force)
        progressVersion += 1
    }

    /// A lesson just ended (its record is in the history): send it now.
    func lessonFinished(_ record: AttemptRecord) {
        progressVersion += 1
        guard let sync else { return }
        Task { await sync.attemptFinished(AttemptPayload(record)) }
    }

    /// The server stored attempts and settled their stars: write them into the history quietly
    /// (B7.7); the reward already shown is not taken back.
    private func serverSettled(_ settled: [SettledAttempt]) {
        var stars: [UUID: Int] = [:]
        for item in settled { stars[item.attemptId] = item.stars }
        do {
            try attempts?.updateStars(stars)
        } catch {
            log.error("settled stars not written: \(String(describing: error), privacy: .public)")
        }
        progressVersion += 1
    }

    /// A lesson route closed (finished or left half way): Home and Topic read the progress again
    /// (an attempt under way is saved without a change of `progressVersion`).
    func lessonClosed() {
        progressVersion += 1
    }

    /// What the child has done on the lessons (`LessonProgressSnapshot.of`): best stars, lessons
    /// under way. Read again when `progressVersion` changes.
    func lessonProgress(for profile: ChildProfile, now: Date = Date()) -> LessonProgressSnapshot {
        .of(
            childId: profile.id,
            history: history(now: now),
            inProgress: inProgress(for: profile, now: now),
            server: sync?.home?.lessons
        )
    }

    /// Finished attempts on the device, read once per `progressVersion`.
    private func history(now: Date) -> [AttemptRecord] {
        let version = progressVersion
        if let cache = historyCache, cache.version == version { return cache.records }
        let records = attempts?.history(now: now) ?? []
        historyCache = (version, records)
        return records
    }

    /// The child's attempts under way, read once per `progressVersion` (an attempt is saved under
    /// way without a bump, but Home and Topic only show while no lesson is open, and closing the
    /// lesson bumps it).
    private func inProgress(for profile: ChildProfile, now: Date) -> [AttemptProgress] {
        let version = progressVersion
        if let cache = inProgressCache, cache.version == version, cache.child == profile.id { return cache.attempts }
        let found = attempts?.allInProgress(childId: profile.id, now: now) ?? []
        inProgressCache = (version, profile.id, found)
        return found
    }

    /// The journey of `group` with the child's progress: Home's stops, "Học tiếp", the count of
    /// topics started.
    func journeyProgress(for group: Topic.AgeGroup, profile: ChildProfile) -> JourneyProgress {
        JourneyProgress(topics: journey(for: group), progress: lessonProgress(for: profile))
    }

    /// Topics done on `progress` that Home has not shown as done yet: their seal is stamped in
    /// (SK-034 spec 9). The first call takes every topic done as seen and returns none. Stable
    /// until `markDoneShown`, so a redraw keeps the same answer.
    func freshlyDoneTopics(in progress: JourneyProgress) -> Set<String> {
        let done = Self.doneKeys(progress)
        guard let shown = doneShown else {
            doneShown = done
            return []
        }
        return done.subtracting(shown)
    }

    /// Home leaves the journey (a topic opens, another tab or group shows): what was done there
    /// has been shown, its seals stand still from now on.
    func markDoneShown(_ progress: JourneyProgress) {
        doneShown = (doneShown ?? []).union(Self.doneKeys(progress))
    }

    private static func doneKeys(_ progress: JourneyProgress) -> Set<String> {
        Set(progress.stops.filter { $0.state == .done }.map(\.topic.key))
    }

    /// Stars and day streak for Home (`HomeProgress`).
    func homeProgress(for profile: ChildProfile, now: Date = Date()) -> HomeProgress {
        HomeProgress.compute(
            history: history(now: now), childId: profile.id, timeZone: profile.timezone,
            rules: streakRules(for: profile), server: sync?.home, queued: sync?.queuedCount ?? 0, now: now
        )
    }

    /// The streak rules of the child's own world (SK-030: no longer the Discoverer trial world).
    func streakRules(for profile: ChildProfile) -> StreakRules {
        content.ready?.rules(for: ownGroup(of: profile))?.streak ?? StreakRules(restDaysPerWeek: 0)
    }

    // MARK: Cards, Words, Badges (SK-035)

    /// The child's own age group (the profile's, not the one shown on Home).
    func ownGroup(of profile: ChildProfile) -> Topic.AgeGroup {
        Topic.AgeGroup(rawValue: profile.ageGroup.rawValue)
    }

    /// The journeys of the age groups other than the child's, in their order.
    private func otherJourneys(_ own: Topic.AgeGroup) -> [JourneyTopic] {
        Topic.AgeGroup.known.filter { $0 != own }.flatMap(journey(for:))
    }

    /// Bộ thẻ: the cards of the written lessons, won when the lesson is done.
    func cardCollection(for profile: ChildProfile) -> CardCollection {
        let own = ownGroup(of: profile)
        return CardCollection(own: journey(for: own), others: otherJourneys(own), progress: lessonProgress(for: profile))
    }

    /// Từ vựng: one deck per lesson done.
    func wordDecks(for profile: ChildProfile) -> [WordDeck] {
        let own = ownGroup(of: profile)
        return WordDecks.of(own: journey(for: own), others: otherJourneys(own), progress: lessonProgress(for: profile))
    }

    /// The deck of one lesson, done or not (the `.words` route).
    func wordDeck(lessonID: UUID) -> WordDeck? {
        for group in Topic.AgeGroup.known {
            for topic in journey(for: group) {
                if let item = topic.lessons.first(where: { $0.lesson?.id == lessonID }), let lesson = item.lesson {
                    return WordDeck(topic: topic, lessonNumber: item.number, lesson: lesson)
                }
            }
        }
        return nil
    }

    /// Huy hiệu: one badge per strand of the child's own age group.
    func strandBadges(for profile: ChildProfile) -> [StrandBadge] {
        StrandBadge.of(journeyProgress(for: ownGroup(of: profile), profile: profile))
    }

    /// Huy hiệu: this week's days for the streak card, the same source as Home's chip.
    func streakWeek(for profile: ChildProfile, now: Date = Date()) -> StreakWeek {
        StreakWeek.compute(
            history: history(now: now), childId: profile.id, timeZone: profile.timezone,
            rules: streakRules(for: profile), server: sync?.home, queued: sync?.queuedCount ?? 0, now: now
        )
    }

    /// The first written lesson not done of the child's own group: where the empty Thẻ, Từ vựng
    /// and Huy hiệu tabs send the child ("Học bài đầu tiên"). `nil` when nothing is written.
    func firstLesson(for profile: ChildProfile) -> (topicID: UUID, lessonID: UUID)? {
        guard let next = journeyProgress(for: ownGroup(of: profile), profile: profile).next,
              let topicID = next.topic.content?.id, let lessonID = next.lesson.lesson?.id else { return nil }
        return (topicID, lessonID)
    }

    /// Ids of the words the child knows (`VocabTerm.id`).
    func knownWords(for profile: ChildProfile) -> Set<UUID> {
        _ = wordsVersion
        if let cached = knownWordsCache[profile.id] { return cached }
        let known = words?.known(childId: profile.id) ?? []
        knownWordsCache[profile.id] = known
        return known
    }

    /// "Đã nhớ" or "Ôn lại" on a word: saved at once, so the count survives the app closing.
    /// The screen changes only once the file is written (tester 10/11 #4); when it cannot be
    /// written the known words stay as they were and `false` comes back, for a gentle note.
    @discardableResult
    func mark(_ mark: WordReview.Mark, word: VocabTerm, for profile: ChildProfile) -> Bool {
        let next = WordReview.applying(mark, to: word, known: knownWords(for: profile))
        do {
            try words?.save(next, childId: profile.id)
        } catch {
            log.error("known words not saved: \(String(describing: error), privacy: .public)")
            return false
        }
        knownWordsCache[profile.id] = next
        wordsVersion += 1
        return true
    }

    func openWordDeck(_ lessonID: UUID) {
        path.append(.words(lessonID: lessonID))
    }

    #if DEBUG
    /// `-SKResendLastAttempt <n>`: sends the last finished attempt `n` more times (SK-022 T2: the
    /// server must keep one row).
    func resendLastAttempt(times: Int) async {
        guard let sync, let profile,
              let last = attempts?.history().last(where: { $0.childId == profile.id }) else { return }
        for _ in 0..<times { await sync.resend(AttemptPayload(last)) }
    }
    #endif

    // MARK: Content shown

    /// The age group Home shows: the one picked on Home, else the profile's own.
    func shownGroup(for profile: ChildProfile) -> Topic.AgeGroup {
        journeyGroup ?? Topic.AgeGroup(rawValue: profile.ageGroup.rawValue)
    }

    /// Every topic of the group's syllabus, by number, with the content laid over it (SK-030).
    func journey(for group: Topic.AgeGroup) -> [JourneyTopic] {
        content.ready?.journey(for: group) ?? []
    }

    /// A journey topic of any group, by key (the Topic route).
    func journeyTopic(key: String) -> JourneyTopic? {
        content.ready?.journeyTopic(key: key)
    }

    // MARK: Navigation

    func openTopic(_ key: String) {
        path.append(.topic(key))
    }

    func openLesson(topicID: UUID, lessonID: UUID) {
        path.append(.lesson(topicID: topicID, lessonID: lessonID))
    }

    func goBack() {
        if !path.isEmpty { path.removeLast() }
    }

    func openSettings() {
        path.append(.settings)
    }

    /// SK-042: the language picked on Cài đặt for the profile in use, and the voice that goes with
    /// it (`VoiceMode.matching`), saved at once. `false` when the file cannot be written (the
    /// profile stays as it was). The server keeps the values it got when the profile was made:
    /// there is no RPC to change them yet (proposal for dev in SK-042).
    @discardableResult
    func setLanguage(_ mode: LanguageMode) -> Bool {
        guard var updated = profile, let store else { return false }
        updated.languageMode = mode
        updated.voiceMode = .matching(mode)
        guard updated != profile else { return true }
        do {
            try store.save(updated)
        } catch {
            log.error("language not saved: \(String(describing: error), privacy: .public)")
            return false
        }
        profile = updated
        applyVoiceSplit()
        speech.stop()
        return true
    }

    func openImageCredits() {
        path.append(.imageCredits)
    }

    /// Pictures of the content to credit (SK-033); empty without a pack or without pictures, and
    /// then Home shows no "Image credits" link.
    var imageCredits: [PackManifest.AssetEntry] {
        content.ready?.imageCredits ?? []
    }

    /// Back to Home on `tab` (topic words → Từ vựng, streak chip → Huy hiệu).
    func showTab(_ tab: HomeTab) {
        path = []
        homeTab = tab
    }
}
