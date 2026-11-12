import ContentKit
import ContentModel
import Foundation
import LessonEngine
import LessonPlayer
import Profiles
import Sync
import Testing
@testable import ScienceKids

/// SK-035, app side of the Thẻ, Từ vựng and Huy hiệu tabs: the known words on the device, the
/// week strip of the streak, and what each child profile sees.
@MainActor
@Suite struct CollectionAppTests {
    static let lessonOne = BundledContentTests.lessonOne

    static func tempDir() -> URL {
        FileManager.default.temporaryDirectory.appendingPathComponent("CollectionAppTests-\(UUID().uuidString)")
    }

    static func profile(_ name: String) throws -> ChildProfile {
        try ChildProfile.create(displayName: name, avatar: "ech", grade: 3, languageMode: .bilingual, voiceMode: .both)
    }

    // MARK: Known words

    /// One file per child; a missing, broken or misnamed file reads as nothing known.
    @Test func knownWordsPerChild() throws {
        let dir = Self.tempDir()
        defer { try? FileManager.default.removeItem(at: dir) }
        let store = WordMemoryStore(directory: dir)
        let a = UUID(), b = UUID(), w1 = UUID(), w2 = UUID()
        #expect(store.known(childId: a).isEmpty)
        try store.save([w1, w2], childId: a)
        try store.save([w2], childId: b)
        #expect(store.known(childId: a) == [w1, w2])
        #expect(store.known(childId: b) == [w2])

        let c = UUID()
        try FileManager.default.copyItem(at: store.url(childId: a), to: store.url(childId: c))
        #expect(store.known(childId: c).isEmpty, "a's file under c's name")
        try Data("{".utf8).write(to: store.url(childId: b))
        #expect(store.known(childId: b).isEmpty, "broken file")
    }

    /// "Đã nhớ" and "Ôn lại" are saved at once: a new model on the same files (the app opened
    /// again) has them; another child's words are its own.
    @Test func markedWordsSurviveARelaunch() throws {
        let dir = Self.tempDir()
        defer { try? FileManager.default.removeItem(at: dir) }
        let words = WordMemoryStore(directory: dir.appendingPathComponent("words"))
        let fixtures = BundledContent.fixtures()
        let minh = try Self.profile("Minh"), lan = try Self.profile("Lan")
        let model = AppModel(store: nil, library: fixtures.library, syllabus: fixtures.syllabus, words: words)
        let deck = try #require(model.wordDeck(lessonID: Self.lessonOne))
        #expect(deck.words.count == 8)
        let before = model.wordsVersion

        for word in deck.words { model.mark(.known, word: word, for: minh) }
        model.mark(.again, word: deck.words[0], for: minh)
        model.mark(.known, word: deck.words[1], for: lan)
        #expect(model.wordsVersion > before)
        #expect(deck.knownCount(model.knownWords(for: minh)) == 7)

        let relaunched = AppModel(store: nil, library: fixtures.library, syllabus: fixtures.syllabus, words: words)
        #expect(deck.knownCount(relaunched.knownWords(for: minh)) == 7)
        #expect(relaunched.knownWords(for: lan) == [deck.words[1].id])
        #expect(WordReview(words: deck.words, known: relaunched.knownWords(for: minh)).current == deck.words[0], "the word to practise comes first")
    }

    /// A mark that cannot be written leaves the known words as they were (tester 10/11 #4): the
    /// screen never shows a count the next launch would not have.
    @Test func unsavedMarkChangesNothing() throws {
        let dir = Self.tempDir()
        defer { try? FileManager.default.removeItem(at: dir) }
        // A file where the store's folder should be: every save fails.
        try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        let blocked = dir.appendingPathComponent("words")
        try Data().write(to: blocked)
        let fixtures = BundledContent.fixtures()
        let minh = try Self.profile("Minh")
        let model = AppModel(store: nil, library: fixtures.library, syllabus: fixtures.syllabus, words: WordMemoryStore(directory: blocked))
        let deck = try #require(model.wordDeck(lessonID: Self.lessonOne))
        let before = model.wordsVersion
        #expect(model.mark(.known, word: deck.words[0], for: minh) == false)
        #expect(model.knownWords(for: minh).isEmpty)
        #expect(model.wordsVersion == before)
    }

    // MARK: Each child its own tabs

    /// The tabs read the child's own lessons: Minh finished lesson 1 (card won, a deck of 8 words,
    /// stars and its strand started); Lan, on the same device, has nothing.
    @Test func tabsFollowTheChild() throws {
        let dir = Self.tempDir()
        defer { try? FileManager.default.removeItem(at: dir) }
        let attempts = AttemptStore(directory: dir.appendingPathComponent("lessons"))
        let fixtures = BundledContent.fixtures()
        let minh = try Self.profile("Minh"), lan = try Self.profile("Lan")
        let model = AppModel(store: nil, library: fixtures.library, syllabus: fixtures.syllabus, attempts: attempts)

        let empty = model.cardCollection(for: minh)
        #expect(empty.sets.map(\.id) == ["healthy-eating"])
        #expect(empty.earnedCount == 0 && empty.totalCount == 1)
        #expect(empty.laterTopics > 0, "the topics of the syllabus with nothing written")
        #expect(model.wordDecks(for: minh).isEmpty)
        #expect(model.firstLesson(for: minh)?.lessonID == Self.lessonOne)

        try attempts.append(SyncAppTests.record(day: "2026-11-10", stars: 2, child: minh.id, lesson: Self.lessonOne))
        model.lessonClosed()

        let cards = model.cardCollection(for: minh)
        #expect(cards.earnedCount == 1)
        #expect(cards.sets[0].cards.first?.collectible.set == "food")
        #expect(model.wordDecks(for: minh).map(\.id) == [Self.lessonOne])
        #expect(model.homeProgress(for: minh).stars == 2)
        let badges = model.strandBadges(for: minh)
        #expect(badges.count == 6, "Discoverer has topics in every strand")
        let health = try #require(badges.first { $0.strand == .humansHealth })
        #expect(health.state == .started || health.state == .done)
        #expect(health.topicCount == 5)

        #expect(model.cardCollection(for: lan).earnedCount == 0)
        #expect(model.wordDecks(for: lan).isEmpty)
        #expect(model.homeProgress(for: lan).stars == 0)
        #expect(model.strandBadges(for: lan).allSatisfy { $0.state == .notStarted })
    }

    // MARK: Week strip

    /// Monday to Sunday of today's ISO week: studied, a rest day, missed before today, today and
    /// after still to come.
    @Test func weekStripDays() throws {
        let today = try #require(LocalDate("2026-11-12")) // Thursday
        let week = StreakWeek.of(
            studied: [try #require(LocalDate("2026-11-09")), try #require(LocalDate("2026-11-11")), try #require(LocalDate("2026-11-05"))],
            rest: [try #require(LocalDate("2026-11-10"))],
            today: today
        )
        #expect(week.days.map(\.date.description) == ["2026-11-09", "2026-11-10", "2026-11-11", "2026-11-12", "2026-11-13", "2026-11-14", "2026-11-15"])
        #expect(week.days.map(\.weekday) == [1, 2, 3, 4, 5, 6, 7])
        #expect(week.days.map(\.state) == [.studied, .rest, .studied, .upcoming, .upcoming, .upcoming, .upcoming])
        #expect(week.days.map(\.isToday) == [false, false, false, true, false, false, false])

        let sunday = StreakWeek.of(studied: [today], rest: [], today: try #require(LocalDate("2026-11-15")))
        #expect(sunday.days.first?.date == LocalDate("2026-11-09"), "Sunday ends its ISO week")
        #expect(sunday.days.map(\.state) == [.missed, .missed, .missed, .studied, .missed, .missed, .upcoming])
    }

    /// From the device: the history's days and the rest day `computeStreak` used; from the server
    /// once nothing waits and its today is the child's: its rest days and its chain.
    @Test func weekStripFromDeviceAndServer() throws {
        let rules = StreakRules(restDaysPerWeek: 1)
        let now = try #require(ISO8601DateFormatter().date(from: "2026-11-12T05:00:00Z")) // Thursday in Hà Nội
        let history = [
            SyncAppTests.record(day: "2026-11-09", stars: 1),
            SyncAppTests.record(day: "2026-11-11", stars: 1),
            SyncAppTests.record(day: "2026-11-12", stars: 1),
            SyncAppTests.record(day: "2026-11-08", stars: 1, child: UUID()),
        ]
        let device = StreakWeek.compute(
            history: history, childId: SyncAppTests.child, timeZone: "Asia/Ho_Chi_Minh", rules: rules,
            server: nil, queued: 0, now: now
        )
        #expect(device.days.prefix(4).map(\.state) == [.studied, .rest, .studied, .studied])
        #expect(device.days[3].isToday)

        let server = HomeData(
            today: "2026-11-12", lessons: [], totalStars: 0, totalXP: 0, lastLessonId: nil,
            streak: .init(studiedDays: 3, chainStart: "2026-11-08", restDays: ["2026-11-10"], studiedToday: false),
            minutesToday: nil
        )
        let settled = StreakWeek.compute(
            history: [], childId: SyncAppTests.child, timeZone: "Asia/Ho_Chi_Minh", rules: rules,
            server: server, queued: 0, now: now
        )
        #expect(settled.days.prefix(4).map(\.state) == [.studied, .rest, .studied, .upcoming])
        // The server cut the chain to today: the device's days do not show (tester 10/11 #5).
        let cut = HomeData(
            today: "2026-11-12", lessons: [], totalStars: 0, totalXP: 0, lastLessonId: nil,
            streak: .init(studiedDays: 1, chainStart: "2026-11-12", restDays: [], studiedToday: true),
            minutesToday: nil
        )
        let serverWins = StreakWeek.compute(
            history: history, childId: SyncAppTests.child, timeZone: "Asia/Ho_Chi_Minh", rules: rules,
            server: cut, queued: 0, now: now
        )
        #expect(serverWins.days.prefix(4).map(\.state) == [.missed, .missed, .missed, .studied])
        let notToday = HomeData(
            today: "2026-11-12", lessons: [], totalStars: 0, totalXP: 0, lastLessonId: nil,
            streak: .init(studiedDays: 0, chainStart: nil, restDays: [], studiedToday: false), minutesToday: nil
        )
        let none = StreakWeek.compute(
            history: history, childId: SyncAppTests.child, timeZone: "Asia/Ho_Chi_Minh", rules: rules,
            server: notToday, queued: 0, now: now
        )
        #expect(none.days.allSatisfy { $0.state != .studied }, "studied_today false wins over the device")
        let waiting = StreakWeek.compute(
            history: [], childId: SyncAppTests.child, timeZone: "Asia/Ho_Chi_Minh", rules: rules,
            server: server, queued: 1, now: now
        )
        #expect(waiting.days.allSatisfy { $0.state != .studied }, "the queue is not empty: the device's (none)")
    }
}
