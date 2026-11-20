import ContentKit
import ContentModel
import Foundation
import LessonPlayer
import Profiles
import Testing
import UIKit
@testable import ScienceKids

// SK-011: what the screens do with the profile and the content, without the UI.

@MainActor
@Suite struct OnboardingModelTests {
    /// B4.1: Song ngữ → cả hai, Tiếng Anh trước → chỉ EN, Tiếng Việt trước → cả hai.
    @Test func voiceFollowsTheLanguageMode() {
        let model = OnboardingModel()
        #expect(model.languageMode == .bilingual, "canvas default")
        #expect(model.voiceMode == .both)
        model.languageMode = .enFirst
        #expect(model.voiceMode == .en)
        model.languageMode = .viFirst
        #expect(model.voiceMode == .both)
        model.languageMode = .enFirst
        model.grade = 3
        #expect(model.voiceMode == .en, "Discoverer keeps the suggestion")
        model.grade = 1
        #expect(model.voiceMode == .both, "Explorer is always both (B4.1)")
    }

    /// Once the parent picks a voice, the mode and the grade no longer change it.
    @Test func parentChoiceSticks() {
        let model = OnboardingModel()
        model.languageMode = .enFirst
        model.chooseVoice(.vi)
        model.languageMode = .bilingual
        model.grade = 1
        #expect(model.voiceMode == .vi)
        #expect(model.parentChoseVoice)
    }

    @Test func needsNameAvatarAndGrade() throws {
        let model = OnboardingModel()
        #expect(!model.canCreate)
        model.name = "  "
        model.avatar = .ech
        model.grade = 3
        #expect(!model.canCreate, "blank name")
        model.name = "Minh"
        #expect(model.canCreate)
        model.avatar = nil
        #expect(!model.canCreate)
    }

    /// The acceptance path: Tiếng Anh trước, "Minh", ếch, lớp 3, voice kept.
    @Test func makesTheProfileOfTheTicket() throws {
        let model = OnboardingModel()
        model.languageMode = .enFirst
        model.name = "Minh"
        model.avatar = .ech
        model.grade = 3
        let tz = try #require(TimeZone(identifier: "Asia/Ho_Chi_Minh"))
        let profile = try model.makeProfile(now: Date(timeIntervalSince1970: 1_793_244_165), timeZone: tz)
        #expect(profile.displayName == "Minh")
        #expect(profile.avatar == "ech")
        #expect(profile.grade == 3)
        #expect(profile.ageGroup == .discoverer)
        #expect(profile.languageMode == .enFirst)
        #expect(profile.voiceMode == .en)
        #expect(profile.timezone == "Asia/Ho_Chi_Minh")
    }
}

@MainActor
@Suite struct AppModelTests {
    static func tempStore() -> (ProfileStore, URL) {
        let dir = FileManager.default.temporaryDirectory.appendingPathComponent("AppModelTests-\(UUID().uuidString)")
        return (ProfileStore(directory: dir), dir)
    }

    static func minh() throws -> ChildProfile {
        try ChildProfile.create(displayName: "Minh", avatar: "ech", grade: 3, languageMode: .enFirst, voiceMode: .en)
    }

    @Test func noFileMeansWelcome() {
        let (store, dir) = Self.tempStore()
        defer { try? FileManager.default.removeItem(at: dir) }
        #expect(AppModel(store: store, library: .empty).profile == nil)
    }

    /// Create, then "relaunch" (a new model on the same file): the profile is back, Home opens.
    @Test func createdProfileSurvivesARelaunch() throws {
        let (store, dir) = Self.tempStore()
        defer { try? FileManager.default.removeItem(at: dir) }
        let first = AppModel(store: store, library: .empty)
        let profile = try Self.minh()
        try first.createProfile(profile)
        #expect(first.profile == profile)
        #expect(FileManager.default.fileExists(atPath: store.fileURL.path))
        let relaunched = AppModel(store: store, library: .empty)
        #expect(relaunched.profile == profile)
    }

    /// SK-042: Cài đặt changes the language (and its voice) of the profile in use, saved at once,
    /// so a relaunch keeps it; the other fields stay.
    @Test func settingsLanguageIsSavedAndSurvivesARelaunch() throws {
        let (store, dir) = Self.tempStore()
        defer { try? FileManager.default.removeItem(at: dir) }
        let model = AppModel(store: store, library: .empty)
        let profile = try Self.minh()
        try model.createProfile(profile)
        #expect(model.setLanguage(.viFirst))
        #expect(model.profile?.languageMode == .viFirst)
        #expect(model.profile?.voiceMode == .vi)
        let relaunched = AppModel(store: store, library: .empty)
        #expect(relaunched.profile?.languageMode == .viFirst)
        #expect(relaunched.profile?.voiceMode == .vi)
        #expect(relaunched.profile?.id == profile.id)
        #expect(relaunched.profile?.displayName == profile.displayName)
        #expect(model.speech.firstLanguageOnly == nil, "Tiếng Việt: one voice, nothing split")
        #expect(model.setLanguage(.bilingual))
        #expect(AppModel(store: store, library: .empty).profile?.voiceMode == .both)
        // Duy 13/11: Cả hai says English by itself, Vietnamese on the VI button.
        #expect(model.speech.firstLanguageOnly == "en")
        #expect(AppModel(store: store, library: .empty).speech.firstLanguageOnly == "en")
    }

    /// SK-047 (tester 16/11, `-SKTestProfile`): no profile → the test profile is saved (Lớp 3,
    /// Discoverer, the mode asked) and Home opens; a saved profile is never replaced.
    @Test func testProfileOnlyWhenThereIsNone() throws {
        let (store, dir) = Self.tempStore()
        defer { try? FileManager.default.removeItem(at: dir) }
        let fresh = AppModel(store: store, library: .empty)
        #expect(fresh.makeTestProfileIfNone(languageMode: .bilingual))
        let made = try #require(fresh.profile)
        #expect(made.grade == 3)
        #expect(made.ageGroup == .discoverer)
        #expect(made.languageMode == .bilingual)
        #expect(made.voiceMode == .both)
        #expect(try store.load() == made, "saved, so a relaunch opens Home")

        let relaunched = AppModel(store: store, library: .empty)
        #expect(!relaunched.makeTestProfileIfNone(languageMode: .enFirst))
        #expect(relaunched.profile == made)

        let (other, otherDir) = Self.tempStore()
        defer { try? FileManager.default.removeItem(at: otherDir) }
        let minh = try Self.minh()
        try AppModel(store: other, library: .empty).createProfile(minh)
        let kept = AppModel(store: other, library: .empty)
        #expect(!kept.makeTestProfileIfNone(languageMode: .bilingual))
        #expect(kept.profile == minh)
    }

    @Test func settingsLanguageWithoutAFileChangesNothing() throws {
        let model = AppModel(store: nil, library: .empty)
        #expect(!model.setLanguage(.enFirst))
        #expect(model.profile == nil)
    }

    @Test func unreadableFileMeansWelcome() throws {
        let (store, dir) = Self.tempStore()
        defer { try? FileManager.default.removeItem(at: dir) }
        try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        try Data("not json".utf8).write(to: store.fileURL)
        #expect(AppModel(store: store, library: .empty).profile == nil)
    }

    @Test func noStoreCannotCreate() throws {
        let model = AppModel(store: nil, library: .empty)
        #expect(throws: (any Error).self) { try model.createProfile(try Self.minh()) }
        #expect(model.profile == nil)
    }

    /// SK-016: the content opens after launch (pack with its clips, or the fixtures), then Home shows it.
    @Test func contentLoadsAfterLaunch() async {
        let model = AppModel(store: nil, content: .loading)
        #expect(model.library == .empty)
        #expect(model.content.ready == nil)
        await model.loadContent()
        #expect(model.library.topic(id: BundledContentTests.topicID) != nil)
        #expect((model.speech.loader != nil) == BundledContentTests.hasPack, "clips only with the pack")
        await model.loadContent() // once open, stays open
        #expect(model.content.ready != nil)
    }

    @Test func navigation() {
        let model = AppModel(store: nil, library: .empty)
        let topic = UUID()
        let lesson = UUID()
        model.openTopic("healthy-eating")
        model.openLesson(topicID: topic, lessonID: lesson)
        #expect(model.path == [.topic("healthy-eating"), .lesson(topicID: topic, lessonID: lesson)])
        model.goBack()
        #expect(model.path == [.topic("healthy-eating")])
        model.showTab(.words)
        #expect(model.path.isEmpty)
        #expect(model.homeTab == .words)
    }

    /// SK-030: Home opens on the profile's own group; the chips show another one, kept while the
    /// child goes into a topic and back; a new profile starts on its own group again.
    @Test func journeyGroupDefaultsToTheProfile() throws {
        let (store, dir) = Self.tempStore()
        defer { try? FileManager.default.removeItem(at: dir) }
        let model = AppModel(store: store, library: BundledContent.loadFixtures(), syllabus: BundledContent.bundledSyllabus())
        let minh = try Self.minh() // Lớp 3: Discoverer
        try model.createProfile(minh)
        #expect(model.shownGroup(for: minh) == .discoverer)
        #expect(model.journey(for: .discoverer).count == 17)
        model.journeyGroup = .scientist
        #expect(model.shownGroup(for: minh) == .scientist)
        model.openTopic("new-water-air")
        #expect(model.journeyTopic(key: "new-water-air")?.ageGroup == .scientist)
        model.goBack()
        #expect(model.shownGroup(for: minh) == .scientist)
        let an = try ChildProfile.create(displayName: "An", avatar: "ca", grade: 1, languageMode: .bilingual, voiceMode: .both)
        try model.createProfile(an)
        #expect(model.shownGroup(for: an) == .explorer)
        #expect(model.journey(for: .explorer).count == 10, "SK-061")
    }

    /// Every topic opens, written or not (SK-030); an unknown key finds nothing.
    @Test func everyTopicKeyOpens() {
        let model = AppModel(store: nil, library: BundledContent.loadFixtures(), syllabus: BundledContent.bundledSyllabus())
        for group in Topic.AgeGroup.known {
            for topic in model.journey(for: group) {
                #expect(model.journeyTopic(key: topic.key) == topic, "\(topic.key)")
            }
        }
        #expect(model.journeyTopic(key: "no-such-topic") == nil)
        #expect(AppModel(store: nil, content: .loading).journey(for: .discoverer).isEmpty)
    }
}

@Suite struct BundledContentTests {
    static let topicID = UUID(uuidString: "d3a514ef-02cd-4386-a358-f01e425a10f8")!
    static let lessonOne = UUID(uuidString: "4b11eb40-9a47-4e5e-b4b5-bea60264ded3")!
    static let mealLesson = UUID(uuidString: "23603940-87a2-435b-bf7d-c6c18f79e349")!
    static let hasPack = Bundle.main.url(forResource: BundledContent.packFolderName, withExtension: nil) != nil

    /// What the app opens at launch: the pack when the build has one, else the fixtures.
    static func library() async -> ContentLibrary {
        await BundledContent.load().ready?.library ?? .empty
    }

    /// The fixtures are in the bundle as a folder reference (`valid/…`), and decode: the app's
    /// content when the build has no pack (SK-016).
    @Test func fixturesAreBundled() throws {
        let root = try #require(Bundle.main.url(forResource: BundledContent.folderName, withExtension: nil))
        #expect(FileManager.default.fileExists(atPath: root.appendingPathComponent("discoverer/an-uong-lanh-manh/topic.json").path))
        let fixtures = BundledContent.fixtures()
        let topics = fixtures.library.topics(for: .discoverer)
        #expect(topics.map(\.id) == [Self.topicID])
        #expect(topics.first?.lessons.count == 1)
        #expect(fixtures.source == .fixtures)
        #expect(fixtures.rules(for: .discoverer) != nil, "rules.json is bundled for the fixtures")
        #expect(fixtures.clips == nil, "no audio without the pack")
    }

    /// SK-016: with `content/.build/pack` built, the build embeds it as `pack/`; the app opens it
    /// (checksums pass), has the voice clips, reads the rules from the manifest, and gives the
    /// topic pack's version for `content_version`. Skipped when the build has no pack.
    @Test(.enabled(if: hasPack)) func packIsBundledAndOpens() async throws {
        let state = await BundledContent.load()
        let content = try #require(state.ready, "the bundled pack did not open")
        guard case .pack(let version) = content.source else {
            Issue.record("expected the pack, got \(content.source)")
            return
        }
        #expect(!version.isEmpty)
        let topic = try #require(content.library.topic(id: Self.topicID))
        #expect(topic.lessons.map(\.id).contains(Self.lessonOne))
        #expect(topic.topic.title.audio?.en != nil, "the pack's strings have audio")
        #expect(content.clips != nil)
        #expect(content.rules(for: .discoverer) != nil, "manifest rules")
        let pack = try #require(content.pack)
        #expect(content.contentVersion(of: Self.topicID) == pack.manifest.topics.first { $0.id == Self.topicID }?.version)
        let hash = try #require(topic.lessons.first { $0.id == Self.lessonOne }?.title.audio?.en)
        let clip = try await pack.assetData(for: hash)
        #expect(ContentPack.sha256Hex(clip) == hash)
    }

    /// Pack and fixtures carry the same lesson: what the UI tests read from the fixture
    /// (`LessonFixture`) is what the app shows.
    @Test(.enabled(if: hasPack)) func packMatchesTheFixtures() async throws {
        let packLesson = try #require(await Self.library().lesson(id: Self.lessonOne)?.lesson)
        let fixtureLesson = try #require(BundledContent.loadFixtures().topic(id: Self.topicID)?.lessons.first)
        #expect(packLesson.id == fixtureLesson.id)
        #expect(packLesson.title.en == fixtureLesson.title.en)
        #expect(packLesson.quiz.map(\.key) == fixtureLesson.quiz.map(\.key))
        #expect(packLesson.quiz.map(\.prompt.en) == fixtureLesson.quiz.map(\.prompt.en))
    }

    /// SK-030: `content/syllabus.json` is in the bundle and decodes.
    @Test func syllabusIsBundled() throws {
        #expect(Bundle.main.url(forResource: BundledContent.syllabusName, withExtension: "json") != nil)
        let syllabus = try #require(BundledContent.bundledSyllabus())
        #expect(syllabus.groups.map(\.topics.count) == [10, 17, 16], "SK-061")
        #expect(BundledContent.fixtures().syllabus == syllabus, "the fixtures get it too")
    }

    /// What the app opens at launch, laid over the syllabus: every topic of each group, none
    /// locked, numbered on in order. Topics get written over time (SK-031 Bề mặt Trái Đất is
    /// Discoverer #1, SK-032 Khủng long #2 next), so nothing here counts the written ones: every
    /// written topic of a group is on its journey with its content, a topic plays when it has a
    /// written lesson (an unwritten topic opens with nothing to play), and each written lesson
    /// sits in the topic that has it. Ăn uống lành mạnh (Discoverer #9, 10 lessons) keeps lesson 1
    /// in slot 2 (pack and fixtures) and, with the pack, "Mâm cơm cân bằng" in slot 6.
    @Test func journeyOfTheBundle() async throws {
        let content = try #require(await BundledContent.load().ready)
        let syllabus = try #require(content.syllabus)
        for group in Topic.AgeGroup.known {
            let topics = content.journey(for: group)
            let listed = syllabus.topics(for: group)
            #expect(topics.prefix(listed.count).map(\.key) == listed.map(\.key), "\(group): the syllabus topics first, in order")
            #expect(topics.map(\.number) == Array(1..<topics.count + 1), "\(group)")
            let written = Set(content.library.topics(for: group).map(\.id))
            #expect(Set(topics.compactMap { $0.content?.id }) == written, "\(group): every written topic is on the journey")
            for topic in topics {
                let playable = topic.lessons.contains { $0.lesson != nil }
                #expect((topic.firstPlayable != nil) == playable, "\(topic.key)")
                if topic.content == nil {
                    #expect(!playable, "\(topic.key): an unwritten topic opens, with nothing to play")
                }
                for lesson in topic.lessons.compactMap(\.lesson) {
                    #expect(topic.content?.lessons.contains { $0.id == lesson.id } == true, "\(topic.key): \(lesson.slug)")
                }
            }
        }
        let healthy = try #require(content.journey(for: .discoverer).first { $0.key == "healthy-eating" })
        #expect(healthy.number == 9)
        try #require(healthy.lessons.count == 10)
        #expect(healthy.lessons[1].lesson?.id == Self.lessonOne)
        #expect(healthy.lessons[1].title.vi == "Thức ăn cho ta những gì?")
        #expect(healthy.lessons[5].lesson?.id == (Self.hasPack ? Self.mealLesson : nil))
    }

    /// Both written lessons of the pack are in their slots with their Vietnamese titles and voice
    /// (SK-030 criterion: lesson 2 and lesson 6 play through with sound).
    @Test(.enabled(if: hasPack)) func packLessonsTakeTheirSlots() async throws {
        let content = try #require(await BundledContent.load().ready)
        let healthy = try #require(content.journeyTopic(key: "healthy-eating"))
        let two = try #require(healthy.lessons[1].lesson)
        let six = try #require(healthy.lessons[5].lesson)
        #expect(two.id == Self.lessonOne)
        #expect(six.id == Self.mealLesson)
        #expect(healthy.lessons[5].title.vi == "Mâm cơm cân bằng")
        #expect(two.title.audio?.vi != nil && six.title.audio?.vi != nil, "VI voice in the pack")
        #expect(content.rules(for: .discoverer) != nil)
    }

    /// The lesson header says "Bài 2/10" and "Bài 6/10": the journey's numbers, not the pack's order.
    @Test func lessonPlaceOnTheJourney() async throws {
        let content = try #require(await BundledContent.load().ready)
        let two = content.journeyPlace(topicID: Self.topicID, lessonID: Self.lessonOne)
        #expect(two?.number == 2)
        #expect(two?.count == 10)
        if Self.hasPack {
            let six = content.journeyPlace(topicID: Self.topicID, lessonID: Self.mealLesson)
            #expect(six?.number == 6)
            #expect(six?.count == 10)
        }
        #expect(content.journeyPlace(topicID: Self.topicID, lessonID: UUID()) == nil)
    }

    /// "Học tiếp" points at the first written lesson in journey order, whatever is written: no
    /// topic before its topic has a lesson to play, nor any lesson before it in its topic. A
    /// group with nothing written has no card. Discoverer always has one (Ăn uống lành mạnh
    /// lesson 2 is in the pack and the fixtures), at or before that topic.
    @Test func continueCardPointsAtTheFirstWrittenLesson() async throws {
        let content = try #require(await BundledContent.load().ready)
        for group in Topic.AgeGroup.known {
            let topics = content.journey(for: group)
            guard let target = Journey.continueTarget(in: topics) else {
                #expect(topics.allSatisfy { $0.firstPlayable == nil }, "\(group): lessons to play but no card")
                continue
            }
            let lesson = try #require(target.lesson.lesson, "\(group): the card points at an unwritten lesson")
            #expect(lesson.estMinutes > 0, "\(group)")
            let index = try #require(topics.firstIndex { $0.key == target.topic.key })
            #expect(topics[..<index].allSatisfy { $0.firstPlayable == nil }, "\(group): a topic before \(target.topic.key) has a lesson")
            #expect(
                target.topic.lessons.filter { $0.number < target.lesson.number }.allSatisfy { $0.lesson == nil },
                "\(group): a lesson before \(target.lesson.number) in \(target.topic.key) is written"
            )
        }
        let discoverer = try #require(Journey.continueTarget(in: content.journey(for: .discoverer)))
        let healthy = try #require(content.journeyTopic(key: "healthy-eating"))
        #expect(discoverer.topic.number <= healthy.number)
    }

    /// "Từ vựng chủ đề · n từ": the distinct vocabulary terms of a topic's written lessons; a
    /// written topic has some, an unwritten one 0. Checked on every topic of the bundle.
    @Test func topicWords() async throws {
        let content = try #require(await BundledContent.load().ready)
        for group in Topic.AgeGroup.known {
            for topic in content.journey(for: group) {
                let written = topic.lessons.compactMap(\.lesson)
                #expect(topic.wordCount == Set(written.flatMap { $0.vocab.map(\.key) }).count, "\(topic.key)")
                #expect((topic.wordCount > 0) == !written.isEmpty, "\(topic.key): \(topic.wordCount) words, \(written.count) lessons")
            }
        }
        let words = try #require(content.journeyTopic(key: "healthy-eating")).wordCount
        #expect(Self.hasPack ? words >= 8 : words == 8, "\(words)")
    }

    /// SK-030: the paid plan is off in the trial: no "Miễn phí" tag, every lesson open.
    @Test func paidPlanIsOff() {
        #expect(!AppFeatures.paidPlanEnabled)
    }
}

@Suite struct ContentTextTests {
    static let title = Spoken(en: "Healthy eating", vi: "Ăn uống lành mạnh")
    static let question = Spoken(en: "What should we eat to stay healthy?", vi: "Ta cần ăn gì để khoẻ mạnh?")

    @Test func bilingual() {
        let mode = LanguageMode.bilingual
        #expect(mode.name(Self.title) == "Ăn uống lành mạnh", "canvas: names in Vietnamese")
        #expect(mode.secondName(Self.title) == "Healthy eating")
        #expect(mode.sentence(Self.question) == "What should we eat to stay healthy?")
        #expect(mode.secondSentence(Self.question) == "Ta cần ăn gì để khoẻ mạnh?")
    }

    @Test func englishFirst() {
        let mode = LanguageMode.enFirst
        #expect(mode.name(Self.title) == "Healthy eating")
        #expect(mode.secondName(Self.title) == nil)
        #expect(mode.sentence(Self.question) == "What should we eat to stay healthy?")
        #expect(mode.hidesSentenceSecondLanguage)
    }

    @Test func vietnameseFirst() {
        let mode = LanguageMode.viFirst
        #expect(mode.name(Self.title) == "Ăn uống lành mạnh")
        #expect(mode.sentence(Self.question) == "Ta cần ăn gì để khoẻ mạnh?")
        #expect(mode.secondSentence(Self.question) == "What should we eat to stay healthy?")
        // SK-042: Tiếng Việt shows one language: no English caption, no English line.
        #expect(mode.secondName(Self.title) == nil)
        #expect(mode.hidesSentenceSecondLanguage)
    }

    /// SK-030: a syllabus title whose `vi` is not translated yet shows `en`, with no second name
    /// (it would repeat the English).
    @Test func syllabusTitleFallsBackToEnglish() {
        let untranslated = Syllabus.Title(en: "Types of food", vi: nil)
        let translated = Syllabus.Title(en: "Healthy eating", vi: "Ăn uống lành mạnh")
        for mode in LanguageMode.allCases {
            #expect(mode.name(untranslated) == "Types of food")
            #expect(mode.secondName(untranslated) == nil)
        }
        #expect(LanguageMode.bilingual.name(translated) == "Ăn uống lành mạnh")
        #expect(LanguageMode.bilingual.secondName(translated) == "Healthy eating")
        #expect(LanguageMode.enFirst.name(translated) == "Healthy eating")
        #expect(LanguageMode.enFirst.secondName(translated) == nil)
        #expect(LanguageMode.viFirst.name(translated) == "Ăn uống lành mạnh")
    }

    /// Clips follow `voice_mode`; none until the pack has audio (the speaker stays hidden).
    @Test func clipsByVoice() {
        let spoken = Spoken(en: "a", vi: "b", audio: SpokenAudio(en: "e1", vi: nil))
        #expect(spoken.clips(for: .en) == ["e1"])
        #expect(spoken.clips(for: .vi).isEmpty, "VI clip missing: skipped quietly")
        #expect(spoken.clips(for: .both) == ["e1"])
        #expect(Self.question.clips(for: .both).isEmpty)
    }
}

@Suite struct ArtTests {
    /// Every avatar and art piece is in the asset catalog (SVG, vector kept).
    @Test func assetsExist() {
        for avatar in AvatarChoice.allCases {
            #expect(UIImage(named: avatar.imageName) != nil, "\(avatar.imageName)")
        }
        for name in ["ArtBrandMark", "ArtWelcomeHills", "ArtMascot", "ArtTopicBowl"] {
            #expect(UIImage(named: name) != nil, "\(name)")
        }
    }

    @Test func avatarIDs() {
        #expect(AvatarChoice.allCases.map(\.rawValue) == ["ca", "ech", "ga", "meo", "chim", "trau"], "canvas ids")
        #expect(AvatarChoice.ech.imageName == "AvatarEch")
        #expect(AvatarChoice.of("unknown") == .ech)
    }
}
