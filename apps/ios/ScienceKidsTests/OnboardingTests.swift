import ContentKit
import ContentModel
import Foundation
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
        model.openTopic(topic)
        model.openLesson(topicID: topic, lessonID: lesson)
        #expect(model.path == [.topic(topic), .lesson(topicID: topic, lessonID: lesson)])
        model.goBack()
        #expect(model.path == [.topic(topic)])
        model.showTab(.words)
        #expect(model.path.isEmpty)
        #expect(model.homeTab == .words)
    }
}

@Suite struct BundledContentTests {
    static let topicID = UUID(uuidString: "d3a514ef-02cd-4386-a358-f01e425a10f8")!
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
        let topics = fixtures.library.topics(for: BundledContent.world)
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
        #expect(topic.lessons.count == 1)
        #expect(topic.topic.title.audio?.en != nil, "the pack's strings have audio")
        #expect(content.clips != nil)
        #expect(content.rules(for: .discoverer) != nil, "manifest rules")
        let pack = try #require(content.pack)
        #expect(content.contentVersion(of: Self.topicID) == pack.manifest.topics.first?.version)
        let hash = try #require(topic.lessons.first?.title.audio?.en)
        let clip = try await pack.assetData(for: hash)
        #expect(ContentPack.sha256Hex(clip) == hash)
    }

    /// Pack and fixtures carry the same lesson: what the UI tests read from the fixture
    /// (`LessonFixture`) is what the app shows.
    @Test(.enabled(if: hasPack)) func packMatchesTheFixtures() async throws {
        let packLesson = try #require(await Self.library().topic(id: Self.topicID)?.lessons.first)
        let fixtureLesson = try #require(BundledContent.loadFixtures().topic(id: Self.topicID)?.lessons.first)
        #expect(packLesson.id == fixtureLesson.id)
        #expect(packLesson.title.en == fixtureLesson.title.en)
        #expect(packLesson.quiz.map(\.key) == fixtureLesson.quiz.map(\.key))
        #expect(packLesson.quiz.map(\.prompt.en) == fixtureLesson.quiz.map(\.prompt.en))
    }

    /// Topic screen: 5 lessons, lesson 1 open with its content, 2–5 locked behind the one before,
    /// with no lesson (so no title is made up).
    @Test func lessonSlots() async throws {
        let topic = try #require(await Self.library().topic(id: Self.topicID))
        let count = BundledContent.lessonCount(of: topic)
        #expect(count == 5)
        let slots = LessonList.slots(for: topic, count: count)
        #expect(slots.map(\.number) == [1, 2, 3, 4, 5])
        #expect(slots.map(\.isOpen) == [true, false, false, false, false])
        #expect(slots.map(\.unlocksAfter) == [nil, 1, 2, 3, 4])
        #expect(slots[0].lesson?.title.vi == "Thức ăn cho ta những gì?")
        #expect(slots.dropFirst().allSatisfy { $0.lesson == nil })
    }

    @Test func continueCardPointsAtLessonOne() async throws {
        let target = try #require(LessonList.continueTarget(in: await Self.library().topics(for: .discoverer)))
        #expect(target.topic.id == Self.topicID)
        #expect(target.slot.number == 1)
        #expect(target.lesson.estMinutes == 8)
        #expect(LessonList.continueTarget(in: []) == nil)
    }

    @Test func topicWords() async throws {
        let topic = try #require(await Self.library().topic(id: Self.topicID))
        #expect(LessonList.wordCount(of: topic) == 8)
    }

    /// A count below the lessons the topic has never hides a lesson; no lesson, nothing open.
    @Test func neverFewerSlotsThanLessons() async throws {
        let topic = try #require(await Self.library().topic(id: Self.topicID))
        #expect(LessonList.slots(for: topic, count: 0).count == 1)
        #expect(LessonList.slots(for: TopicContent(topic: topic.topic, lessons: []), count: 5).allSatisfy { !$0.isOpen })
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
