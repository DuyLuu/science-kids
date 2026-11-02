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
    case topic(UUID)
    /// SK-012 puts the lesson player behind this route (`MainFlow.destination`).
    case lesson(topicID: UUID, lessonID: UUID)
}

/// Tabs of the bottom strip on Home. Only the journey is built; the others say "sắp có".
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

    @ObservationIgnored private let store: ProfileStore?
    /// Lesson attempts under way and finished (SK-012).
    @ObservationIgnored let attempts: AttemptStore?
    @ObservationIgnored private let log = Logger(subsystem: Bundle.main.bundleIdentifier ?? "ScienceKids", category: "profile")

    init(
        store: ProfileStore?, content: ContentState, attempts: AttemptStore? = nil,
        speech: SpeechPlayer = SpeechPlayer(), sync: SyncEngine? = nil, now: Date = Date()
    ) {
        self.store = store
        self.content = content
        self.attempts = attempts
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
    }

    /// Content already in hand (tests): the fixtures' shape, no pack, no audio.
    convenience init(store: ProfileStore?, library: ContentLibrary, attempts: AttemptStore? = nil, now: Date = Date()) {
        self.init(
            store: store,
            content: .ready(AppContent(library: library, source: .fixtures, rulesData: nil, pack: nil)),
            attempts: attempts, now: now
        )
    }

    /// The lessons on screen; empty while loading or after a failure.
    var library: ContentLibrary { content.ready?.library ?? .empty }

    /// Opens the bundled content (once at launch; again from the error screen's "Thử lại").
    func loadContent(bundle: Bundle = .main) async {
        if content.ready != nil { return }
        content = .loading
        let state = await BundledContent.load(bundle: bundle)
        content = state
        if let ready = state.ready { use(ready, now: Date()) }
    }

    private func use(_ ready: AppContent, now: Date) {
        speech.loader = ready.clips
        reopenCutOffLesson(now: now)
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
        if options.resetsProfile {
            // As after a fresh install: no profile, no lesson attempts.
            try? store?.delete()
            if let attempts { try? FileManager.default.removeItem(at: attempts.directory) }
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
            sync: syncStore.map { SyncEngine(transport: Self.transport(options: options), store: $0) }
        )
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
        profile = made
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

    /// Stars and day streak for Home (`HomeProgress`).
    func homeProgress(for profile: ChildProfile, now: Date = Date()) -> HomeProgress {
        _ = progressVersion
        let rules = content.ready?.rules(for: BundledContent.world)?.streak ?? StreakRules(restDaysPerWeek: 0)
        return HomeProgress.compute(
            history: attempts?.history(now: now) ?? [], childId: profile.id, timeZone: profile.timezone, rules: rules,
            server: sync?.home, queued: sync?.queuedCount ?? 0, now: now
        )
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

    /// Topics on the journey, easy → hard.
    var journeyTopics: [TopicContent] {
        library.topics(for: BundledContent.world)
    }

    // MARK: Navigation

    func openTopic(_ id: UUID) {
        path.append(.topic(id))
    }

    func openLesson(topicID: UUID, lessonID: UUID) {
        path.append(.lesson(topicID: topicID, lessonID: lessonID))
    }

    func goBack() {
        if !path.isEmpty { path.removeLast() }
    }

    /// Back to Home on `tab` (topic words → Từ vựng, streak chip → Huy hiệu).
    func showTab(_ tab: HomeTab) {
        path = []
        homeTab = tab
    }
}
