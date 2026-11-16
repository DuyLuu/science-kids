import ContentModel
import Foundation
import LessonEngine
import Profiles
import SwiftUI
import Testing
@testable import LessonPlayer

/// Repo files through `#filePath` (no copy in apps/ios): lesson 1 fixture and `content/rules.json`.
enum Repo {
    static func find(_ relative: String, from file: String = #filePath) -> URL {
        var dir = URL(fileURLWithPath: file).deletingLastPathComponent()
        while dir.path != "/" {
            let candidate = dir.appendingPathComponent(relative)
            if FileManager.default.fileExists(atPath: candidate.path) { return candidate }
            dir.deleteLastPathComponent()
        }
        fatalError("\(relative) not found above \(file)")
    }

    static let lessonURL = find("packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json")
    static let rulesURL = find("content/rules.json")

    static func lesson(edit: ((inout [String: Any]) -> Void)? = nil) throws -> Lesson {
        var data = try Data(contentsOf: lessonURL)
        if let edit {
            var object = try #require(try JSONSerialization.jsonObject(with: data) as? [String: Any])
            edit(&object)
            data = try JSONSerialization.data(withJSONObject: object)
        }
        return try ContentDecoder().decodeLesson(from: data)
    }

    static func rules() throws -> LessonRules {
        try LessonRules.load(from: Data(contentsOf: rulesURL), ageGroup: "discoverer")
    }
}

/// A clock the tests move by hand.
final class TestClock: @unchecked Sendable {
    var now: Date
    init(_ now: Date) { self.now = now }
}

@MainActor
struct SessionHarness {
    let lesson: Lesson
    let rules: LessonRules
    let store: AttemptStore
    let clock: TestClock
    let child = UUID()
    let directory: URL

    init(lesson: Lesson? = nil) throws {
        self.lesson = try lesson ?? Repo.lesson()
        rules = try Repo.rules()
        directory = FileManager.default.temporaryDirectory.appendingPathComponent("LessonSessionTests-\(UUID().uuidString)")
        store = AttemptStore(directory: directory)
        // 2026-10-29 03:00 UTC = 10:00 in Hồ Chí Minh.
        clock = TestClock(Date(timeIntervalSince1970: 1_793_242_800))
    }

    func session() -> LessonSession {
        let clock = clock
        return LessonSession(
            lesson: lesson, rules: rules,
            context: .init(childId: child, timeZone: TimeZone(identifier: "Asia/Ho_Chi_Minh")!, languageMode: .bilingual, voiceMode: .both),
            store: store, now: { clock.now }
        )
    }

    func cleanUp() { try? FileManager.default.removeItem(at: directory) }
}

/// The right try of a question, from its content.
func rightTry(_ item: QuizItem) -> Try {
    switch item.answer {
    case .singleChoice(let choice): .selected(choice.options.first { $0.correct }!.key)
    case .multiChoice(let choice): .selectedSet(choice.options.filter(\.correct).map(\.key))
    case .trueFalse(let tf): .value(tf.answer)
    case .fillBlankBank(let fill): .filled(fill.answers)
    case .orderSequence(let order): .order(order.answer)
    default: fatalError("no renderer for \(item.format)")
    }
}

/// A wrong try of a question (`variant` picks another wrong answer where there is one).
func wrongTry(_ item: QuizItem, variant: Int = 0) -> Try {
    switch item.answer {
    case .singleChoice(let choice):
        let wrong = choice.options.filter { !$0.correct }
        return .selected(wrong[variant % wrong.count].key)
    case .multiChoice(let choice):
        return .selectedSet(Array(choice.options.filter { !$0.correct }.prefix(variant + 1).map(\.key)))
    case .trueFalse(let tf): return .value(!tf.answer)
    case .fillBlankBank(let fill):
        let wrong = fill.bank.filter { !fill.answers.contains($0.key) }
        return .filled([wrong[variant % wrong.count].key])
    default: fatalError("no renderer for \(item.format)")
    }
}

/// Plays a session to the reward: warmup right, all groups seen, a balanced tray, `quizTries` per question.
@MainActor
func play(_ session: LessonSession, quizTries: (QuizItem) -> [Try]) {
    for (index, item) in session.warmupItems.enumerated() {
        #expect(session.step == .warmup(index: index))
        session.submit(rightTry(item), for: item, in: .warmup)
        session.advance()
    }
    #expect(session.step == .learn)
    for group in session.exploreBlock?.groups ?? [] { session.selectGroup(group.key) }
    #expect(session.learnComplete)
    session.advance()
    #expect(session.step == .play)
    if let tray = session.tray {
        for group in tray.groups where group.role == .required {
            session.tapTrayItem(tray.items.first { $0.group == group.key }!.key)
        }
    }
    #expect(session.trayState?.success == true)
    session.advance()
    for (index, item) in session.quizItems.enumerated() {
        #expect(session.step == .quiz(index: index))
        for attempt in quizTries(item) { session.submit(attempt, for: item, in: .quiz) }
        #expect(session.status(of: item, in: .quiz).isDone)
        session.advance()
    }
    // SK-047: Tổng kết comes first; the attempt is already finished there.
    #expect(session.step == .recap)
    #expect(session.summary != nil)
    session.advance()
    #expect(session.step == .reward)
}

@MainActor
@Suite struct LessonSessionTests {
    @Test func stepsOfLessonOne() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let session = harness.session()
        #expect(session.steps == [
            .warmup(index: 0), .warmup(index: 1), .learn, .play,
            .quiz(index: 0), .quiz(index: 1), .quiz(index: 2), .quiz(index: 3), .quiz(index: 4), .quiz(index: 5),
            .recap, .reward,
        ])
        #expect(session.step == .warmup(index: 0))
        #expect(session.quizItems.map(\.key) == ["q1", "q2", "q3", "q4", "q5", "q6"])
    }

    /// Criterion 3: what the Reward shows equals `scoreLesson`, `computeStars`, `computeXP` called
    /// directly on the same input. All right: 6/6, ⭐⭐, 6 × 10 + 10 + 20 XP.
    @Test func rewardMatchesTheEngineAllRight() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let session = harness.session()
        play(session) { [rightTry($0)] }
        let summary = try #require(session.summary)
        try expectMatchesEngine(summary, session: session, harness: harness)
        #expect(summary.score == LessonScore(correct: 6, max: 6, completed: true))
        #expect(summary.stars.stars == 2)
        #expect(summary.xp.total == 6 * harness.rules.xp.perCorrect + harness.rules.xp.gameComplete + harness.rules.xp.lessonComplete)
        #expect(summary.xp.total == 90)
    }

    /// q3 and q5 wrong twice: 4/6, ⭐ at the 5/6 threshold; still equal to the engine.
    @Test func rewardMatchesTheEngineFourOfSix() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let session = harness.session()
        play(session) { item in
            ["q3", "q5"].contains(item.key) ? [wrongTry(item), wrongTry(item, variant: 1)] : [rightTry(item)]
        }
        let summary = try #require(session.summary)
        try expectMatchesEngine(summary, session: session, harness: harness)
        #expect(summary.score.correct == 4)
        #expect(summary.stars.stars == 1)
        #expect(summary.xp.total == 4 * 10 + 10 + 20)
    }

    /// A right answer on the second try earns no point (B4.4) and no XP for that question.
    @Test func rightOnSecondTryEarnsNothing() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let session = harness.session()
        play(session) { item in item.key == "q1" ? [wrongTry(item), rightTry(item)] : [rightTry(item)] }
        let summary = try #require(session.summary)
        #expect(summary.score.correct == 5)
        #expect(summary.stars.stars == 2)
        let q1 = try #require(summary.record.answers.first { $0.slot == 1 })
        #expect(q1.correct && q1.points == 0 && q1.tries == 2)
    }

    /// SK-013 (SK-012 tester L4): the "+XP" of a question comes from the engine (`scoreItem` points ×
    /// `xp_per_correct`), and the questions' XP add up to the quiz part of Thưởng's XP.
    @Test func questionXPComesFromTheEngine() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let session = harness.session()
        play(session) { item in
            switch item.key {
            case "q1": [wrongTry(item), rightTry(item)]          // right on try 2: no point
            case "q2": [wrongTry(item), wrongTry(item, variant: 1)] // wrong twice
            default: [rightTry(item)]
            }
        }
        let summary = try #require(session.summary)
        var sum = 0
        for item in session.quizItems {
            let xp = try #require(session.xpEarned(by: item, in: .quiz), "\(item.key)")
            let score = try #require(session.itemScore(of: item, in: .quiz))
            #expect(xp == computeItemXP(score: score, rules: harness.rules.xp))
            #expect(xp == score.points * harness.rules.xp.perCorrect)
            switch item.key {
            case "q1", "q2": #expect(xp == 0, "\(item.key)")
            default: #expect(xp == harness.rules.xp.perCorrect, "\(item.key)")
            }
            sum += xp
        }
        #expect(sum == summary.xp.correct, "the quiz screen and Thưởng agree")
        // Warmup earns no XP, and an open question shows none.
        if let warmup = session.warmupItems.first {
            #expect(session.xpEarned(by: warmup, in: .warmup) == nil)
        }
    }

    @Test func itemXPRule() {
        let rules = XPRules(perCorrect: 10, lessonComplete: 20, gameComplete: 10)
        #expect(computeItemXP(score: ItemScore(points: 1, tryResults: [true], finalCorrect: true, triesUsed: 1), rules: rules) == 10)
        #expect(computeItemXP(score: ItemScore(points: 0, tryResults: [false, true], finalCorrect: true, triesUsed: 2), rules: rules) == 0)
        #expect(computeItemXP(score: ItemScore(points: -1, tryResults: [false], finalCorrect: false, triesUsed: 1), rules: rules) == 0)
    }

    private func expectMatchesEngine(_ summary: LessonSummary, session: LessonSession, harness: SessionHarness) throws {
        let quiz = session.quizItems.map { item in
            ItemResult(itemId: item.id.uuidString.lowercased(),
                       score: try! scoreItem(item: item.answer.scoringItem!, tries: session.tries(for: item, in: .quiz), rules: harness.rules.scoring).get())
        }
        let warmup = session.warmupItems.map { item in
            ItemResult(itemId: item.id.uuidString.lowercased(),
                       score: try! scoreItem(item: item.answer.scoringItem!, tries: session.tries(for: item, in: .warmup), rules: harness.rules.scoring).get())
        }
        let score = try scoreLesson(quizResults: quiz, warmupResults: warmup).get()
        #expect(summary.score == score)
        #expect(summary.xp == computeXP(score: score, gameCompleted: true, rules: harness.rules.xp))
        let attempt = LessonAttempt(
            attemptId: summary.record.id.uuidString.lowercased(),
            completion: .init(at: summary.record.completedAt, localDate: LocalDate(summary.record.localDate)!),
            correct: score.correct, max: score.max
        )
        #expect(summary.stars == computeStars(attempts: [attempt], rules: harness.rules.scoring))
        #expect(summary.record.score == score.correct && summary.record.maxScore == 6 && summary.record.xp == summary.xp.total)
        #expect(summary.record.localDate == "2026-10-29")
    }

    @Test func triesFollowMaxTries() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let session = harness.session()
        let w1 = session.warmupItems[0]
        #expect(session.status(of: w1, in: .warmup) == .open)
        #expect(session.submit(wrongTry(w1), for: w1, in: .warmup) == .retry(last: wrongTry(w1)))
        #expect(session.submit(wrongTry(w1, variant: 1), for: w1, in: .warmup)
                == .done(correct: false, firstTry: false, last: wrongTry(w1, variant: 1)))
        // Done: a further try is ignored.
        session.submit(rightTry(w1), for: w1, in: .warmup)
        #expect(session.tries(for: w1, in: .warmup).count == 2)
        // A try of another format is refused by the engine and not kept.
        let w2 = session.warmupItems[1]
        session.submit(.selected("nonsense"), for: w2, in: .warmup)
        #expect(session.tries(for: w2, in: .warmup).isEmpty)
    }

    @Test func learnStartsOnTheFirstGroup() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let session = harness.session()
        for item in session.warmupItems {
            session.submit(rightTry(item), for: item, in: .warmup)
            session.advance()
        }
        let groups = try #require(session.exploreBlock?.groups)
        #expect(session.progress.exploreSelected == groups[0].key)
        #expect(session.progress.exploreSeen == [groups[0].key])
        #expect(!session.learnComplete)
        for group in groups.dropFirst() { session.selectGroup(group.key) }
        #expect(session.learnComplete)
    }

    /// The tray goes through `buildTray`; messages come from the block's `messages`.
    @Test func trayUsesTheEngine() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let session = harness.session()
        let tray = try #require(session.tray)
        #expect(session.trayState?.message == .start)
        #expect(session.trayMessage == tray.messages.start)
        session.tapTrayItem("tray_rice")
        #expect(session.trayState?.message == .missing(group: "tray_protein"), "groups order: protein first (Duy 29/10)")
        #expect(session.trayMessage == tray.messages.missing["tray_protein"])
        for key in ["tray_fish", "tray_greens", "tray_candy", "tray_egg"] { session.tapTrayItem(key) }
        #expect(session.trayState?.full == true)
        #expect(session.trayState?.message == .full)
        #expect(session.trayMessage == tray.messages.full)
        #expect(session.progress.tray == ["tray_rice", "tray_fish", "tray_greens", "tray_candy"])
    }

    // MARK: Chơi shelf (SK-031, kệ trung tính)

    /// The shelf shows every item of the tray once, in the attempt's order; the app closed and
    /// opened again (same attempt) shows the same shelf.
    @Test func shelfKeepsItsOrderForTheAttempt() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let first = harness.session()
        let tray = try #require(first.tray)
        #expect(first.shelfItems.count == tray.items.count)
        #expect(Set(first.shelfItems.map(\.key)) == Set(tray.items.map(\.key)))
        #expect(first.shelfItems == ShelfOrder.shuffled(tray.items, seed: first.progress.attemptId))

        let again = harness.session()
        #expect(again.progress.attemptId == first.progress.attemptId)
        #expect(again.shelfItems == first.shelfItems)
    }

    /// The content's order (group by group in lesson 1: rice, bread, fish, egg…) is not the
    /// shelf's: each attempt id gives its own order, the same on every launch.
    @Test func shelfOrderComesFromTheAttemptNotTheContent() throws {
        let lesson = try Repo.lesson()
        guard case .buildTray(let tray) = lesson.play else {
            Issue.record("lesson 1 has no build_tray")
            return
        }
        let contentOrder = tray.items.map(\.key)
        let seeds = (1...8).map { UUID(uuidString: String(format: "00000000-0000-4000-8000-%012d", $0))! }
        let orders = seeds.map { ShelfOrder.shuffled(tray.items, seed: $0).map(\.key) }
        for (seed, order) in zip(seeds, orders) {
            #expect(order.count == contentOrder.count)
            #expect(Set(order) == Set(contentOrder))
            #expect(ShelfOrder.shuffled(tray.items, seed: seed).map(\.key) == order, "same seed, same shelf")
        }
        #expect(Set(orders).count > 1, "different attempts, different shelves")
        #expect(orders.contains { $0 != contentOrder })
    }

    // MARK: Stop and resume (B4.4)

    @Test func resumesAtTheSameQuestionWithItsTries() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let first = harness.session()
        let attemptId = first.progress.attemptId
        for item in first.warmupItems {
            first.submit(rightTry(item), for: item, in: .warmup)
            first.advance()
        }
        for group in first.exploreBlock!.groups { first.selectGroup(group.key) }
        first.advance()
        for key in ["tray_rice", "tray_fish", "tray_greens"] { first.tapTrayItem(key) }
        first.advance()
        let q1 = first.quizItems[0], q2 = first.quizItems[1], q3 = first.quizItems[2]
        first.submit(rightTry(q1), for: q1, in: .quiz)
        first.advance()
        first.submit(rightTry(q2), for: q2, in: .quiz)
        first.advance()
        first.submit(wrongTry(q3), for: q3, in: .quiz)

        // The app is closed; a new session on the same files.
        harness.clock.now += 3600
        let again = harness.session()
        #expect(again.progress.attemptId == attemptId)
        #expect(again.step == .quiz(index: 2))
        #expect(again.status(of: q1, in: .quiz) == .done(correct: true, firstTry: true, last: rightTry(q1)))
        #expect(again.status(of: q2, in: .quiz).isDone)
        #expect(again.status(of: q3, in: .quiz) == .retry(last: wrongTry(q3)))
        #expect(again.progress.playCompleted)
        #expect(again.trayState?.success == true)
    }

    @Test func pauseIsKeptAndClearedOnReturn() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let first = harness.session()
        first.pause()
        let saved = try #require(harness.store.inProgress(lessonId: harness.lesson.id, childId: harness.child, now: harness.clock.now))
        #expect(saved.isPaused)
        #expect(harness.store.allInProgress(childId: harness.child, now: harness.clock.now).count == 1)
        let again = harness.session()
        #expect(!again.progress.isPaused)
        #expect(harness.store.inProgress(lessonId: harness.lesson.id, childId: harness.child, now: harness.clock.now)?.isPaused == false)
    }

    /// An attempt left more than 7 days is dropped: the lesson starts over.
    @Test func attemptOlderThanSevenDaysStartsOver() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let first = harness.session()
        let w1 = first.warmupItems[0]
        first.submit(rightTry(w1), for: w1, in: .warmup)
        first.advance()
        harness.clock.now += 7 * 24 * 3600 - 60
        #expect(harness.session().step == .warmup(index: 1), "6 days 23 h 59: kept")
        harness.clock.now += 7 * 24 * 3600 + 60
        let fresh = harness.session()
        #expect(fresh.step == .warmup(index: 0))
        #expect(fresh.progress.attemptId != first.progress.attemptId)
    }

    @Test func finishingWritesTheHistoryOnceAndClearsTheProgress() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let session = harness.session()
        play(session) { [rightTry($0)] }
        #expect(harness.store.inProgress(lessonId: harness.lesson.id, childId: harness.child, now: harness.clock.now) == nil)
        let history = harness.store.history()
        #expect(history.count == 1)
        let record = try #require(history.first)
        #expect(record.id == session.progress.attemptId)
        #expect(record.answers.map(\.slot) == [1, 2, 3, 4, 5, 6])
        let allFirstTry = record.answers.allSatisfy { $0.correct && $0.points == 1 && $0.tries == 1 }
        #expect(allFirstTry)
        #expect(record.stars == 2)
        // Appending the same attempt again keeps one record (idempotent).
        try harness.store.append(record)
        #expect(harness.store.history().count == 1)
        // The next session is a new attempt.
        #expect(harness.session().progress.attemptId != record.id)
    }

    /// ⭐⭐⭐ needs a second pass a calendar day or more after the first (mastery gap from rules),
    /// computed from the history on the device.
    @Test func secondPassNextDayGivesThreeStars() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let first = harness.session()
        play(first) { [rightTry($0)] }
        #expect(first.summary?.stars.stars == 2)
        let sameDay = harness.session()
        play(sameDay) { [rightTry($0)] }
        #expect(sameDay.summary?.stars.stars == 2, "same day: no mastery")
        harness.clock.now += 24 * 3600
        let nextDay = harness.session()
        play(nextDay) { [rightTry($0)] }
        #expect(nextDay.summary?.stars.stars == 3)
        #expect(nextDay.summary?.stars.masteredDate?.description == "2026-10-30")
        #expect(harness.store.history().count == 3)
    }

    // MARK: Content this build cannot show (SK-009)

    @Test func questionWithoutRendererIsLeftOut() throws {
        let lesson = try Repo.lesson { object in
            var quiz = object["quiz"] as! [[String: Any]]
            // SK-043 A2: Discoverer now shows every v1 format; a format of a later schema is left out.
            quiz[2]["format"] = "label_diagram"
            object["quiz"] = quiz
        }
        let harness = try SessionHarness(lesson: lesson)
        defer { harness.cleanUp() }
        let session = harness.session()
        #expect(session.quizItems.map(\.key) == ["q1", "q2", "q4", "q5", "q6"])
        play(session) { [rightTry($0)] }
        // 5 results: not a completed attempt (SK-009 open question), so no star from it.
        #expect(session.summary?.score.completed == false)
        #expect(session.summary?.stars.stars == 0)
    }

    @Test func unknownGameSkipsChoi() throws {
        let lesson = try Repo.lesson { object in
            object["play"] = ["key": "mystery", "type": "hotspot_image", "id": "11111111-1111-4111-8111-111111111111", "version": 1]
        }
        let harness = try SessionHarness(lesson: lesson)
        defer { harness.cleanUp() }
        let session = harness.session()
        #expect(!session.steps.contains(.play))
        #expect(session.tray == nil)
    }
}

@Suite struct RulesAndContentTests {
    @Test func rulesFromContentRulesJSON() throws {
        let rules = try Repo.rules()
        #expect(rules.scoring.maxTries == 2)
        #expect(rules.scoring.passThreshold == Fraction(num: 5, den: 6))
        #expect(rules.scoring.masteryGapDays == 1)
        #expect(rules.xp == XPRules(perCorrect: 10, lessonComplete: 20, gameComplete: 10))
        let data = try Data(contentsOf: Repo.rulesURL)
        do {
            _ = try LessonRules.load(from: data, ageGroup: "martian")
            Issue.record("an age group without rules should throw")
        } catch {
            #expect(error == .noRules(ageGroup: "martian"))
        }
    }

    @Test func quizItemsBecomeScoringItems() throws {
        let lesson = try Repo.lesson()
        let q5 = try #require(lesson.quiz.first { $0.key == "q5" })
        #expect(q5.answer.scoringItem == .multiChoice(options: [
            ScoringOption(key: "q5_fish", correct: true), ScoringOption(key: "q5_rice", correct: false),
            ScoringOption(key: "q5_egg", correct: true), ScoringOption(key: "q5_banana", correct: false),
            ScoringOption(key: "q5_tofu", correct: true), ScoringOption(key: "q5_bread", correct: false),
        ]))
        let q2 = try #require(lesson.quiz.first { $0.key == "q2" })
        let expected = ScoringItem.fillBlankBank(bank: ["q2_nutrients", "q2_air", "q2_sunlight"], answers: ["q2_nutrients"])
        let actual = q2.answer.scoringItem
        #expect(actual == expected)
        let renderable = lesson.quiz.allSatisfy { $0.answer.hasRenderer }
        #expect(renderable)
        #expect(QuizItem.Answer.unknown(format: "label_diagram").scoringItem == nil)
    }

    /// The tray rules keep the block's group order; every message key has its text.
    @Test func trayRulesAndMessages() throws {
        let lesson = try Repo.lesson()
        guard case .buildTray(let tray) = lesson.play else {
            Issue.record("play should be build_tray")
            return
        }
        #expect(tray.trayRules.groups.map(\.key) == tray.groups.map(\.key))
        #expect(tray.trayRules.groups.map(\.role) == [.required, .required, .required, .limit])
        for message in [TrayMessage.start, .full, .balanced, .hasLimited] {
            #expect(tray.text(for: message) != nil, "\(message.code)")
        }
        for group in tray.groups where group.role == .required {
            #expect(tray.text(for: .missing(group: group.key)) != nil, "\(group.key)")
        }
        #expect(tray.text(for: .missing(group: "tray_sweet")) == nil)
    }

    /// Language rules shared with the app (moved from the app in SK-012).
    @Test func languageHelpers() {
        let spoken = Spoken(en: "Rice", vi: "Cơm", audio: SpokenAudio(en: "e", vi: nil))
        #expect(LanguageMode.bilingual.name(spoken) == "Cơm")
        #expect(LanguageMode.bilingual.sentence(spoken) == "Rice")
        #expect(LanguageMode.enFirst.secondName(spoken) == nil)
        #expect(LanguageMode.viFirst.sentence(spoken) == "Cơm")
        #expect(spoken.clips(for: .both) == ["e"])
        #expect(spoken.clips(for: .vi).isEmpty)
    }
}

@Suite struct AttemptStoreTests {
    @Test func progressRoundTrips() throws {
        let dir = FileManager.default.temporaryDirectory.appendingPathComponent("AttemptStoreTests-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: dir) }
        let store = AttemptStore(directory: dir)
        let now = Date(timeIntervalSince1970: 1_793_242_800.5)
        var progress = AttemptProgress(childId: UUID(), lessonId: UUID(), now: now, firstStep: .quiz(index: 2))
        progress.quizTries = ["q1": [.selected("a")], "q5": [.selectedSet(["x", "y"]), .selectedSet(["x"])]]
        progress.warmupTries = ["w2": [.value(false)]]
        progress.hintsUsed = ["q5"]
        progress.tray = ["tray_rice"]
        try store.save(progress)
        let read = try #require(store.inProgress(lessonId: progress.lessonId, childId: progress.childId, now: now))
        #expect(read == progress)
        #expect(store.inProgress(lessonId: progress.lessonId, childId: UUID(), now: now) == nil, "another child")
        let text = try String(contentsOf: store.inProgressURL(lessonId: progress.lessonId), encoding: .utf8)
        #expect(text.contains("\"step\" : {"))
        #expect(text.contains("\"name\" : \"quiz\""))
    }

    /// SK-022 (SK-012 tester L2): a history that does not decode is kept as `.corrupt-<time>`; the
    /// next finished attempt starts a new file instead of writing over it.
    @Test func brokenHistoryIsKeptAside() throws {
        let dir = FileManager.default.temporaryDirectory.appendingPathComponent("AttemptStoreTests-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: dir) }
        let store = AttemptStore(directory: dir)
        try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        try Data("[{\"broken\": true}".utf8).write(to: store.historyURL)
        #expect(store.history(now: Date(timeIntervalSince1970: 1_793_584_800)).isEmpty)
        let kept = dir.appendingPathComponent("history.json.corrupt-20261102T020000Z")
        #expect(try String(contentsOf: kept, encoding: .utf8) == "[{\"broken\": true}")
        let record = AttemptRecord(
            id: UUID(), childId: UUID(), lessonId: UUID(), contentVersion: "v1", startedAt: Date(timeIntervalSince1970: 0),
            completedAt: Date(timeIntervalSince1970: 60), score: 6, maxScore: 6, durationS: 60, xp: 90, stars: 2,
            localDate: "1970-01-01", answers: []
        )
        try store.append(record)
        #expect(store.history() == [record])
        #expect(FileManager.default.fileExists(atPath: kept.path))
        #expect(store.childIds() == [record.childId])
    }

    /// SK-022: the server's settled stars go into the history quietly; other records stay.
    @Test func settledStarsUpdateTheHistory() throws {
        let dir = FileManager.default.temporaryDirectory.appendingPathComponent("AttemptStoreTests-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: dir) }
        let store = AttemptStore(directory: dir)
        func record(_ stars: Int) -> AttemptRecord {
            AttemptRecord(
                id: UUID(), childId: UUID(), lessonId: UUID(), contentVersion: nil, startedAt: Date(timeIntervalSince1970: 0),
                completedAt: Date(timeIntervalSince1970: 60), score: 6, maxScore: 6, durationS: 60, xp: 90, stars: stars,
                localDate: "1970-01-01", answers: []
            )
        }
        let first = record(2)
        let second = record(1)
        try store.append(first)
        try store.append(second)
        try store.updateStars([first.id: 3, UUID(): 1])
        #expect(store.history().map(\.stars) == [3, 1])
    }

    @Test func brokenProgressFileIsDropped() throws {
        let dir = FileManager.default.temporaryDirectory.appendingPathComponent("AttemptStoreTests-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: dir) }
        let store = AttemptStore(directory: dir)
        let lesson = UUID()
        try FileManager.default.createDirectory(at: store.inProgressDirectory, withIntermediateDirectories: true)
        try Data("{".utf8).write(to: store.inProgressURL(lessonId: lesson))
        #expect(store.inProgress(lessonId: lesson, childId: UUID(), now: Date()) == nil)
        #expect(!FileManager.default.fileExists(atPath: store.inProgressURL(lessonId: lesson).path))
    }
}
