import ContentKit
import ContentModel
import DesignSystem
import Foundation
import LessonEngine
import Profiles
import Testing
@testable import LessonPlayer

// SK-047 · Quiz Đợt 1 (ios-dev): shuffling, the locked cards of an order, the bar chart, "Gợi ý"
// and `hint_used`, Tổng kết. Lesson 1 fixture for the session rules; the embedded pack
// (`content/.build/pack`, not in git) for the lessons the ticket names, when it is built.

/// The embedded pack, read once per test that needs it.
enum EmbeddedPack {
    static var isBuilt: Bool { PackVoiceTests.builtPack != nil }

    static func library() async throws -> ContentLibrary {
        let root = try #require(PackVoiceTests.builtPack)
        return try await ContentPack.load(from: DirectoryPackSource(root: root), appVersion: nil).library
    }

    static func lesson(_ topic: String, _ slug: String, in library: ContentLibrary) throws -> Lesson {
        let topic = try #require(library.topics.first { $0.topic.slug == topic }, "topic \(topic)")
        return try #require(topic.lessons.first { $0.slug == slug }, "lesson \(slug)")
    }

    static func rules(_ ageGroup: String) throws -> LessonRules {
        try LessonRules.load(from: Data(contentsOf: Repo.rulesURL), ageGroup: ageGroup)
    }
}

@MainActor
func packSession(_ lesson: Lesson, presentation: LessonPresentation, directory: URL) throws -> LessonSession {
    LessonSession(
        lesson: lesson, rules: try EmbeddedPack.rules(presentation == .explorer ? "explorer" : "discoverer"),
        context: .init(childId: UUID(), timeZone: TimeZone(identifier: "Asia/Ho_Chi_Minh")!, languageMode: .bilingual,
                       voiceMode: .both, presentation: presentation),
        store: AttemptStore(directory: directory)
    )
}

// MARK: - Shuffling (việc 1)

@MainActor
@Suite struct SeededOrderTests {
    static let a = UUID(uuidString: "00000000-0000-4000-8000-000000000001")!
    static let b = UUID(uuidString: "9f2c4e1a-6b3d-4c5e-8f7a-0b1c2d3e4f50")!

    /// The algorithm of `SeededOrder`, checked against an independent implementation (Python,
    /// ios-dev 15/11), so Android and an analysis script can rebuild the order a child saw.
    @Test func goldenPermutations() {
        #expect(SeededOrder.fnv1a64("") == 0xCBF2_9CE4_8422_2325)
        #expect(SeededOrder.fnv1a64("q1") == 0x08D2_1307_B572_D497)
        var generator = SplitMix64(attemptId: Self.a, key: "q1")
        #expect([generator.next(), generator.next(), generator.next()] == [0x80F9_4D0D_8E44_3A9B, 0x22EA_F3AC_2CA4_61A6, 0xC4A4_FBBE_8E00_EB7F])
        let cases: [(UUID, String, Int, [Int])] = [
            (Self.a, "q1", 3, [1, 0, 2]), (Self.a, "q2", 3, [1, 2, 0]), (Self.a, "q2", 4, [2, 1, 0, 3]),
            (Self.a, "q4", 4, [3, 1, 2, 0]), (Self.a, "w1", 4, [1, 0, 3, 2]), (Self.a, "play", 4, [3, 1, 2, 0]),
            (Self.b, "q1", 3, [2, 1, 0]), (Self.b, "q1", 4, [2, 0, 3, 1]), (Self.b, "q2", 4, [2, 1, 3, 0]),
            (Self.b, "w1", 3, [0, 2, 1]), (Self.b, "play", 4, [0, 1, 2, 3]),
        ]
        for (attempt, key, count, expected) in cases {
            #expect(SeededOrder.permutation(count: count, attemptId: attempt, key: key) == expected, "\(attempt) \(key) \(count)")
        }
        #expect(SeededOrder.permutation(count: 1, attemptId: Self.a, key: "q1") == [0])
        #expect(SeededOrder.permutation(count: 0, attemptId: Self.a, key: "q1").isEmpty)
    }

    /// Criterion: two new attempts of `ho-hap/01` (two fixed attempt ids) → some single choice has
    /// its options in another order.
    @Test(.enabled(if: EmbeddedPack.isBuilt)) func twoAttemptsShowAnotherOrder() async throws {
        let lesson = try EmbeddedPack.lesson("ho-hap", "vi-sao-ta-phai-tho", in: try await EmbeddedPack.library())
        let singles = (lesson.warmup + lesson.quiz).compactMap { item -> (String, [String])? in
            guard case .singleChoice(let choice) = item.answer else { return nil }
            return (item.key, choice.options.map(\.key))
        }
        #expect(!singles.isEmpty)
        let differs = singles.contains { key, options in
            SeededOrder.shuffled(options, attemptId: Self.a, key: key) != SeededOrder.shuffled(options, attemptId: Self.b, key: key)
        }
        #expect(differs)
    }

    /// Criterion: in one attempt two questions with as many options are not forced into one
    /// permutation (the seed has the key).
    @Test func questionsOfOneAttemptHaveTheirOwnOrder() throws {
        let lesson = try Repo.lesson()
        let threes = (lesson.warmup + lesson.quiz).filter {
            if case .singleChoice(let choice) = $0.answer { return choice.options.count == 3 }
            return false
        }
        #expect(threes.count >= 2)
        let permutations = Set(threes.map { SeededOrder.permutation(count: 3, attemptId: Self.a, key: $0.key) })
        #expect(permutations.count > 1, "\(threes.map(\.key))")
    }

    /// Criterion: every `order_sequence` of the embedded pack, 1,000 random attempts each → the
    /// bank never shows the `answer` order.
    @Test(.enabled(if: EmbeddedPack.isBuilt)) func orderCardsNeverInAnswerOrder() async throws {
        let library = try await EmbeddedPack.library()
        var counts: [String: Int] = [:]
        for topic in library.topics {
            for lesson in topic.lessons {
                for item in lesson.warmup + lesson.quiz {
                    guard case .orderSequence(let order) = item.answer else { continue }
                    counts[topic.topic.ageGroup.rawValue, default: 0] += 1
                    for _ in 0..<1_000 {
                        let cards = SeededOrder.orderCards(order.items, answer: order.answer, attemptId: UUID(), key: item.key)
                        #expect(cards.map(\.key) != order.answer, "\(lesson.slug) \(item.key)")
                        #expect(Set(cards.map(\.key)) == Set(order.items.map(\.key)))
                    }
                }
            }
        }
        print("SK-047 order_sequence in the pack: \(counts)")
        #expect(counts.values.reduce(0, +) > 0)
    }

    /// Criterion: stopped at q3 and opened again → every question keeps its order, also the
    /// answered ones. True / false and bar charts keep the content's order.
    @Test func resumedAttemptKeepsItsOrders() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let first = harness.session()
        let items = first.warmupItems + first.quizItems
        let before = items.map { first.shownOptions($0).map(\.key) + first.shownBank($0).map(\.key) }
        for item in first.warmupItems {
            first.submit(rightTry(item), for: item, in: .warmup)
            first.advance()
        }
        first.advance()
        first.advance()
        first.submit(rightTry(first.quizItems[0]), for: first.quizItems[0], in: .quiz)
        first.advance()
        first.submit(rightTry(first.quizItems[1]), for: first.quizItems[1], in: .quiz)
        first.advance()
        #expect(first.step == .quiz(index: 2))

        let again = harness.session()
        #expect(again.progress.attemptId == first.progress.attemptId)
        #expect(items.map { again.shownOptions($0).map(\.key) + again.shownBank($0).map(\.key) } == before)
        for item in items {
            let shown = Set(again.shownOptions(item).map(\.key) + again.shownBank(item).map(\.key))
            switch item.answer {
            case .singleChoice(let choice): #expect(shown == Set(choice.options.map(\.key)))
            case .multiChoice(let choice): #expect(shown == Set(choice.options.map(\.key)))
            case .fillBlankBank(let fill): #expect(shown == Set(fill.bank.map(\.key)))
            case .trueFalse: #expect(shown.isEmpty, "true / false: two fixed cards")
            default: break
            }
        }
    }

    /// Scoring does not change: the right option at its new place is right, 1 point, and the
    /// history keeps the key, not the place.
    @Test func scoringUsesKeysNotPlaces() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let session = harness.session()
        var picked: [String: String] = [:]
        play(session) { item in
            guard case .singleChoice = item.answer else { return [rightTry(item)] }
            let right = session.shownOptions(item).first { $0.correct }!
            picked[item.key] = right.key
            return [.selected(right.key)]
        }
        let record = try #require(harness.store.history().first)
        #expect(record.answers.allSatisfy { $0.correct && $0.points == 1 })
        for (slot, item) in session.quizItems.enumerated() {
            guard let key = picked[item.key] else { continue }
            #expect(record.answers.first { $0.slot == slot + 1 }?.answer == [.selected(key)])
        }
    }

    @Test func chartKeepsBarsAndOptionsTogether() throws {
        let lesson = try Repo.lesson { object in
            var quiz = object["quiz"] as! [[String: Any]]
            quiz[3] = [
                "id": "4c7d2a10-7b3e-4f4a-9a51-0d2e5c6b7a81", "key": "q4", "format": "picture_bar_chart", "version": 1, "dok": 2,
                "prompt": ["en": "Which soil let the most water through?", "vi": "Đất nào cho nhiều nước chảy qua nhất?"],
                "hint": ["en": "Look at the tallest bar.", "vi": "Nhìn cột cao nhất."],
                "explanation_correct": ["en": "Sand.", "vi": "Cát."], "explanation_wrong": ["en": "Sand.", "vi": "Cát."],
                "chart": ["bars": [
                    ["key": "garden", "label": ["en": "garden soil", "vi": "đất vườn"], "value": 6],
                    ["key": "sand", "label": ["en": "sandy soil", "vi": "đất cát"], "value": 9],
                    ["key": "clay", "label": ["en": "clay soil", "vi": "đất sét"], "value": 2],
                ]],
                "options": [
                    ["key": "o_garden", "label": ["en": "garden soil", "vi": "đất vườn"], "correct": false],
                    ["key": "o_sand", "label": ["en": "sandy soil", "vi": "đất cát"], "correct": true],
                    ["key": "o_clay", "label": ["en": "clay soil", "vi": "đất sét"], "correct": false],
                ],
            ]
            object["quiz"] = quiz
        }
        let harness = try SessionHarness(lesson: lesson)
        defer { harness.cleanUp() }
        let session = harness.session()
        let chart = try #require(session.quizItems.first { $0.key == "q4" })
        guard case .pictureBarChart(let fields) = chart.answer else { Issue.record("q4 is not a chart"); return }
        #expect(session.shownOptions(chart) == fields.options, "options[i] answers bars[i]: never shuffled")
        #expect(BarChartLayout.usesBlocks(fields.chart.bars.map(\.value)))
    }
}

// MARK: - Order sequence (việc 2)

@MainActor
@Suite struct OrderLockTests {
    static let answer = ["q4_snail", "q4_decay", "q4_layers", "q4_found"]

    /// `da-va-dat/08` q4: snail, layers, decay, found → snail (place 1) and found (place 4) stay
    /// and are locked; decay and layers go back.
    @Test func rightPlacesLockAfterAWrongTry() {
        let wrong = ["q4_snail", "q4_layers", "q4_decay", "q4_found"]
        let status = QuestionStatus.retry(last: .order(wrong))
        let locked = ExplorerOrderBoard.locked(answer: Self.answer, status: status)
        #expect(locked == [0, 3])
        let draft = ExplorerOrderBoard.draft(answer: Self.answer, locked: locked)
        #expect(draft == ["q4_snail", nil, nil, "q4_found"])
        // A locked place takes no other card, a locked card does not move.
        #expect(ExplorerOrderBoard.placing("q4_decay", at: 0, in: draft, locked: locked) == nil)
        #expect(ExplorerOrderBoard.placing("q4_snail", at: 1, in: draft, locked: locked) == nil)
        // The free places fill as before; the second try is the whole order.
        let one = ExplorerOrderBoard.placing("q4_decay", at: 1, in: draft, locked: locked)
        #expect(one == ["q4_snail", "q4_decay", nil, "q4_found"])
        #expect(ExplorerOrderBoard.placing("q4_layers", at: 2, in: one!, locked: locked) == Self.answer)
        // Nothing is locked before a try, after the last one, or while the try's name is read.
        #expect(ExplorerOrderBoard.locked(answer: Self.answer, status: .open).isEmpty)
        #expect(ExplorerOrderBoard.locked(answer: Self.answer, status: .done(correct: false, firstTry: false, last: .order(wrong))).isEmpty)
    }

    /// Explorer `goi-ten-va-nhom-dong-vat/04` q4: eggs, frog, tadpole → eggs locked.
    @Test func explorerLocksTheEggs() {
        let answer = ["q4_eggs", "q4_tadpole", "q4_frog"]
        let locked = ExplorerOrderBoard.locked(answer: answer, status: .retry(last: .order(["q4_eggs", "q4_frog", "q4_tadpole"])))
        #expect(locked == [0])
        #expect(ExplorerOrderBoard.draft(answer: answer, locked: locked) == ["q4_eggs", nil, nil])
    }

    /// The session's scoring does not change: right on the second try is right with 0 points, and
    /// `answer` keeps both tries (`da-va-dat/08` when the pack is built).
    @Test(.enabled(if: EmbeddedPack.isBuilt)) func secondTryRightScoresAsBefore() async throws {
        let lesson = try EmbeddedPack.lesson("da-va-dat", "hoa-thach-hinh-thanh-the-nao", in: try await EmbeddedPack.library())
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent("OrderLockTests-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: directory) }
        let session = try packSession(lesson, presentation: .discoverer, directory: directory)
        let item = try #require(session.quizItems.first { $0.key == "q4" })
        guard case .orderSequence(let order) = item.answer else { Issue.record("q4 is not an order"); return }
        #expect(order.answer == Self.answer)
        #expect(session.shownOrderCards(item).map(\.key) != order.answer)
        let wrong = Try.order(["q4_snail", "q4_layers", "q4_decay", "q4_found"])
        #expect(session.submit(wrong, for: item, in: .quiz) == .retry(last: wrong))
        #expect(session.submit(.order(order.answer), for: item, in: .quiz) == .done(correct: true, firstTry: false, last: .order(order.answer)))
        let score = try #require(session.itemScore(of: item, in: .quiz))
        #expect(score.finalCorrect && score.points == 0)
        #expect(session.tries(for: item, in: .quiz) == [wrong, .order(order.answer)])
    }

    /// iPhone from 4 cards: two rows (4 → 2 + 2, 5 → 3 + 2), never narrower than the age
    /// group's touch target, never wider than the frame; 3 cards and iPad: one row. Phone widths
    /// of iPhone 16e (375 − 40), 16 / 16 Pro (≈ 353), 16 Pro Max (430 − 40); iPad frame 544.
    @Test(arguments: [335.0, 353.0, 390.0])
    func boardFitsThePhone(width: Double) {
        let content = CGFloat(width) - 5
        for count in 3...5 {
            let layout = OrderLayout(count: count, isRegular: false, width: content)
            #expect(layout.rows.flatMap { $0 } == Array(0..<count))
            #expect(layout.rows.count == (count >= 4 ? 2 : 1))
            if count == 4 { #expect(layout.rows == [[0, 1], [2, 3]]) }
            if count == 5 { #expect(layout.rows == [[0, 1, 2], [3, 4]]) }
            #expect(layout.place >= 72, "\(count) cards at \(width): \(layout.place) (Explorer 72, Discoverer 56)")
            #expect(layout.place <= OrderLayout.placeMax)
            for row in layout.rows {
                #expect(layout.rowWidth(row.count) + 2 * OrderLayout.stripPadding <= content + 0.5)
            }
        }
        let regular = OrderLayout(count: 4, isRegular: true, width: 544 - 5)
        #expect(regular.rows == [[0, 1, 2, 3]])
        #expect(regular.place >= 72 && regular.place <= OrderLayout.placeMaxRegular)
    }
}

// MARK: - Bar chart (việc 3)

@Suite struct BarChartLayoutTests {
    @Test func blocksOnlyForWholeNumbersUpToTen() {
        #expect(BarChartLayout.usesBlocks([6, 9, 2]))
        #expect(BarChartLayout.usesBlocks([0, 10]))
        #expect(!BarChartLayout.usesBlocks([6.5, 9, 2]), "one bar not whole: the whole chart is solid")
        #expect(!BarChartLayout.usesBlocks([11, 2]))
        #expect(!BarChartLayout.usesBlocks([]))
    }

    /// `min(28, (H − (top − 1) · 3) / top)`, H = 200.
    @Test func blockHeightFillsTheChart() {
        #expect(BarChartLayout.blockHeight(chartHeight: 200, top: 2) == 28)
        #expect(abs(BarChartLayout.blockHeight(chartHeight: 200, top: 9) - 176.0 / 9) < 0.001)
        #expect(abs(BarChartLayout.blockHeight(chartHeight: 200, top: 10) - 17.3) < 0.001)
        let top = 9.0, height = BarChartLayout.blockHeight(chartHeight: 200, top: top)
        #expect(height * top + 3 * (top - 1) <= 200.001)
    }
}

// MARK: - Gợi ý and hint_used (việc 4)

@MainActor
@Suite struct HintTests {
    /// Criterion: hint opened on q4, then right on the first try → q4 `points = 1`,
    /// `hint_used = true`; the others false; the total is the same as without the hint.
    @Test func openingTheHintMarksOnlyThatQuestion() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let session = harness.session()
        let q4 = session.quizItems[3]
        play(session) { item in
            if item.key == q4.key {
                session.markHintUsed(item, in: .quiz)
                #expect(session.hintOpened(item, in: .quiz))
            }
            return [rightTry(item)]
        }
        let record = try #require(harness.store.history().first)
        let q4Answer = try #require(record.answers.first { $0.slot == 4 })
        #expect(q4Answer.hintUsed && q4Answer.points == 1 && q4Answer.correct)
        #expect(record.answers.filter(\.hintUsed).map(\.slot) == [4])

        let plain = try SessionHarness(lesson: harness.lesson)
        defer { plain.cleanUp() }
        let without = plain.session()
        play(without) { [rightTry($0)] }
        #expect(without.summary?.score == session.summary?.score)
        #expect(without.summary?.xp == session.summary?.xp)
    }

    /// Criterion: a wrong try, then the hint the app reads by itself → `hint_used` stays false.
    /// The hint of a question already done is not counted; a Khởi động hint never marks a quiz key.
    @Test func onlyTheButtonBeforeTheEndCounts() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let session = harness.session()
        let w1 = session.warmupItems[0]
        session.markHintUsed(w1, in: .warmup)
        #expect(session.hintOpened(w1, in: .warmup))
        #expect(session.progress.hintsUsed == ["warmup/" + w1.key])
        play(session) { item in
            if item.key == "q1" { return [wrongTry(item), rightTry(item)] }
            return [rightTry(item)]
        }
        let record = try #require(harness.store.history().first)
        #expect(record.answers.allSatisfy { !$0.hintUsed })

        let other = try SessionHarness()
        defer { other.cleanUp() }
        let late = other.session()
        let q6 = late.quizItems[5]
        guard case .trueFalse = q6.answer else { Issue.record("q6 is not a true / false"); return }
        while late.step != .quiz(index: 5) {
            switch late.step {
            case .warmup(let index): late.submit(rightTry(late.warmupItems[index]), for: late.warmupItems[index], in: .warmup)
            case .learn: for group in late.exploreBlock?.groups ?? [] { late.selectGroup(group.key) }
            case .quiz(let index): late.submit(rightTry(late.quizItems[index]), for: late.quizItems[index], in: .quiz)
            default: break
            }
            late.advance()
        }
        late.submit(rightTry(q6), for: q6, in: .quiz)
        late.markHintUsed(q6, in: .quiz)
        #expect(!late.hintOpened(q6, in: .quiz), "done: the button is hidden and counts nothing")
    }
}

// MARK: - Tổng kết (việc 5)

@MainActor
@Suite struct RecapTests {
    /// Quiz → Tổng kết → Thưởng; the attempt is finished on the way into Tổng kết (history
    /// written once, progress removed), and going on to the reward adds nothing.
    @Test func recapFinishesTheAttemptOnce() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let session = harness.session()
        #expect(Array(session.steps.suffix(3)) == [.quiz(index: 5), .recap, .reward])
        #expect(session.step(after: .quiz(index: 5)) == .recap)
        play(session) { [rightTry($0)] }
        // `play` stops on Tổng kết, then goes on to the reward.
        #expect(harness.store.history().count == 1)
        #expect(harness.store.inProgress(lessonId: harness.lesson.id, childId: harness.child, now: harness.clock.now) == nil)
        let record = try #require(session.summary?.record)
        #expect(session.step == .reward)
        #expect(harness.store.history().map(\.id) == [record.id])
        #expect(session.summary?.record == record)
        #expect(session.phaseIndex == 3)
        // The next time the lesson opens it is a new attempt.
        #expect(harness.session().progress.attemptId != record.id)
    }

    /// The app killed on Tổng kết: the attempt is already in the history (once); opening the
    /// lesson starts a new attempt.
    @Test func killedOnTheRecapKeepsTheLesson() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let session = harness.session()
        playToRecap(session)
        #expect(session.step == .recap)
        let record = try #require(session.summary?.record)
        #expect(harness.store.history().map(\.id) == [record.id])
        // A new session (the app opened again) does not finish anything twice.
        let again = harness.session()
        #expect(again.progress.attemptId != record.id)
        #expect(again.step == .warmup(index: 0))
        #expect(harness.store.history().count == 1)
    }

    /// Criterion: an `in_progress/<lesson>.json` written before SK-047 (step `quiz`, index 5, all
    /// six answered) opens on the new app; `advance()` goes into Tổng kết with a summary.
    @Test func progressFileFromBeforeTheRecapOpens() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let lesson = harness.lesson
        let tries = lesson.quiz.map { item -> String in
            let attempt = try! JSONEncoder().encode([rightTry(item)])
            return "\"\(item.key)\" : \(String(decoding: attempt, as: UTF8.self))"
        }.joined(separator: ",\n    ")
        let attemptId = UUID()
        // As the pre-SK-047 encoder wrote it (`AttemptStore.encoder`: sorted keys, ISO 8601).
        let file = """
        {
          "attempt_id" : "\(attemptId.uuidString)",
          "child_id" : "\(harness.child.uuidString)",
          "explore_seen" : [ "carb", "protein" ],
          "explore_selected" : "carb",
          "hints_used" : [ ],
          "is_paused" : false,
          "lesson_id" : "\(lesson.id.uuidString)",
          "play_completed" : true,
          "quiz_tries" : {
            \(tries)
          },
          "started_at" : "2026-10-29T02:50:00Z",
          "step" : { "index" : 5, "name" : "quiz" },
          "tray" : [ ],
          "updated_at" : "2026-10-29T02:59:00Z",
          "warmup_tries" : { }
        }
        """
        let url = harness.store.inProgressURL(lessonId: lesson.id)
        try FileManager.default.createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true)
        try Data(file.utf8).write(to: url)

        let session = harness.session()
        #expect(session.progress.attemptId == attemptId)
        #expect(session.step == .quiz(index: 5))
        #expect(session.summary == nil)
        session.advance()
        #expect(session.step == .recap)
        let summary = try #require(session.summary)
        #expect(summary.record.id == attemptId)
        #expect(summary.score.correct == 6)
        #expect(harness.store.history().count == 1)
    }

    /// `recap` round-trips in the progress file (only an unfinished write could leave it there);
    /// a session opened on it finishes the attempt.
    @Test func recapStepRoundTrips() throws {
        let data = try AttemptStore.encoder.encode(AttemptProgress.Step.recap)
        #expect(String(decoding: data, as: UTF8.self).contains("\"recap\""))
        #expect(try AttemptStore.decoder.decode(AttemptProgress.Step.self, from: data) == .recap)
    }

    /// Lesson 1: three key points with the pictures of their Học groups; Na's line (q6, answer
    /// false) and its explanation; the words of `word_list`; the objective. What plays by itself.
    @Test func recapOfLessonOne() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let session = harness.session()
        let recap = session.recap
        #expect(recap.keyPoints.map(\.text) == harness.lesson.keyPoints)
        #expect(recap.keyPoints.allSatisfy { $0.image != nil })
        let q6 = harness.lesson.quiz[5]
        guard case .trueFalse(let tf) = q6.answer else { Issue.record("q6"); return }
        let myth = try #require(recap.myth)
        #expect(myth.claim == (tf.statement ?? q6.prompt))
        #expect(myth.truth == q6.explanationCorrect)
        #expect(myth.claimIsTrue == tf.answer)
        let termKeys = session.wordList?.termKeys ?? []
        #expect(recap.words.map(\.key) == termKeys)
        #expect(recap.objective == harness.lesson.objective)
        // The fixture has no clips: nothing to read by itself (the voiced test below has them).
        #expect(session.autoplayUtterance(for: .recap) == nil)
    }

    /// Criterion: a lesson without `word_list` → page 2 has no words, nothing breaks.
    @Test func lessonWithoutWordList() throws {
        let lesson = try Repo.lesson { object in
            object["learn"] = (object["learn"] as! [[String: Any]]).filter { $0["type"] as? String != "word_list" }
        }
        let harness = try SessionHarness(lesson: lesson)
        defer { harness.cleanUp() }
        let session = harness.session()
        #expect(session.wordList == nil)
        #expect(session.recap.words.isEmpty)
        #expect(!session.spokenShown(on: .recap).isEmpty)
        play(session) { [rightTry($0)] }
        #expect(session.summary != nil)
    }

    /// The voice of Tổng kết on the voiced fixture: page 1 reads the three key points in turn,
    /// page 2 the claim and the truth, then the objective; every shown line has its clip.
    @Test func recapReadsKeyPointsThenMythThenObjective() throws {
        let (session, harness) = try LessonSpeechTests.session(voice: .en)
        defer { harness.cleanUp() }
        #expect(session.recapFirstPageReading.map(\.id) == ["recap.key_point.0", "recap.key_point.1", "recap.key_point.2"])
        #expect(session.autoplayUtterance(for: .recap) == session.recapFirstPageReading.first)
        #expect(session.recapSecondPageReading.map(\.id) == ["recap.myth", "recap.objective"])
        let myth = try #require(session.recap.myth)
        #expect(session.recapMythUtterance(myth).clips.map(\.text) == [myth.claim.en, myth.truth.en])
        #expect(session.step(after: .recap) == .reward)
    }

    /// Criterion (pack): `ho-hap/01` Na wrong, words breathe, oxygen, chest (and gills since pack ceeb1eb6912a); `ho-hap/03` Na right;
    /// Explorer `/08` (q6 true / false, false) has the card, `/06` (q6 single choice) and `/07`
    /// (q6 true / false, true) have none.
    @Test(.enabled(if: EmbeddedPack.isBuilt)) func mythCardsOfTheTicketLessons() async throws {
        let library = try await EmbeddedPack.library()
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent("RecapTests-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: directory) }

        let breathe = try packSession(EmbeddedPack.lesson("ho-hap", "vi-sao-ta-phai-tho", in: library), presentation: .discoverer, directory: directory)
        let wrong = try #require(breathe.recap.myth)
        #expect(wrong.claim.en == "I breathe out the same air I breathe in.")
        #expect(wrong.truth.en == "Your breath out is warmer, wetter and has less oxygen.")
        #expect(!wrong.claimIsTrue && wrong.speaker == "na")
        // Pack ceeb1eb6912a (content-editor 15/11): `gills` joined the new words.
        #expect(breathe.recap.words.map(\.key) == ["breathe", "oxygen", "chest", "gills"])
        #expect(breathe.recap.objective.en == "I can say why my body needs air.")

        let running = try packSession(EmbeddedPack.lesson("ho-hap", "tho-khi-chay-nhay", in: library), presentation: .discoverer, directory: directory)
        #expect(running.recap.myth?.claimIsTrue == true)

        let animals = "goi-ten-va-nhom-dong-vat"
        let sea = try packSession(EmbeddedPack.lesson(animals, "oc-bach-tuoc-va-con-vat-bien", in: library), presentation: .explorer, directory: directory)
        #expect(sea.recap.myth?.claimIsTrue == false)
        #expect(sea.recap.myth?.image != nil)
        let food = try packSession(EmbeddedPack.lesson(animals, "con-vat-an-gi", in: library), presentation: .explorer, directory: directory)
        #expect(food.recap.myth == nil)
        #expect(food.recap.words.count == 3)
        let insects = try packSession(EmbeddedPack.lesson(animals, "con-trung-va-con-vat-nhieu-chan", in: library), presentation: .explorer, directory: directory)
        #expect(insects.recap.myth == nil)
        #expect(!insects.spokenShown(on: .recap).isEmpty)
    }

    private func playToRecap(_ session: LessonSession) {
        while session.step != .recap {
            switch session.step {
            case .warmup(let index): session.submit(rightTry(session.warmupItems[index]), for: session.warmupItems[index], in: .warmup)
            case .learn: for group in session.exploreBlock?.groups ?? [] { session.selectGroup(group.key) }
            case .play:
                if let tray = session.tray {
                    for group in tray.groups where group.role == .required {
                        session.tapTrayItem(tray.items.first { $0.group == group.key }!.key)
                    }
                }
            case .quiz(let index): session.submit(rightTry(session.quizItems[index]), for: session.quizItems[index], in: .quiz)
            case .recap, .reward: return
            }
            session.advance()
        }
    }
}

// MARK: - Key point pictures

@Suite struct KeyPointPicturesTests {
    /// The designer's table (`Quiz-Dot1.html`, "Hình thẻ ý chính", 15/11): the lessons whose
    /// key point n does not take group n, as 1-based group numbers. Every other lesson keeps 1, 2, 3.
    ///
    /// Tester 19/11 (SK-053, "Rà ảnh (tester 19/11, lượt 2)" and "lượt 3"): added the 18 Explorer
    /// lessons written since 15/11 (*Nơi sống trên Trái Đất* 4, *Thời tiết và các mùa* 3, *Cơ thể
    /// của em* 3, *Cây quanh em* 3, *Lớn lên* 5), each read line by line against the Học group it
    /// takes. The matcher was re-implemented outside Swift and reproduces all 34 old rows byte for
    /// byte, so the new rows are what the engine really does, not a guess.
    ///
    /// Two *Lớn lên* lessons matched wrongly at first (lượt 2, B6 and B7: the animal line took the
    /// *People* picture, and "the young start a new life cycle" took the old banyan tree). They
    /// were kept out of this table until content-editor reworded the two Học groups (lượt 3);
    /// they now take `[2, 1, 4]` and `[1, 4, 3]` and are in the table like the rest.
    static let table: [String: [Int]] = [
        "an-uong-lanh-manh/mam-com-can-bang": [2, 1, 3],
        "be-mat-trai-dat/dat-va-nuoc-tren-trai-dat": [1, 3, 2],
        "be-mat-trai-dat/cac-chau-luc-va-dai-duong": [1, 3, 5],
        "da-va-dat/lam-quen-voi-da": [1, 2, 4],
        "da-va-dat/da-nao-cung-hon": [1, 2, 4],
        "da-va-dat/da-nao-tham-nuoc": [1, 2, 4],
        "da-va-dat/da-dung-lam-gi": [1, 4, 3],
        "da-va-dat/hoa-thach-hinh-thanh-the-nao": [1, 2, 4],
        "da-va-dat/nhieu-cach-tao-thanh-hoa-thach": [1, 2, 4],
        "da-va-dat/mary-anning-nguoi-san-hoa-thach": [1, 2, 4],
        "da-va-dat/dat-gom-nhung-gi": [1, 4, 3],
        "da-va-dat/cac-loai-dat-o-viet-nam": [3, 1, 2],
        "da-va-dat/the-nao-la-dat-tot": [1, 2, 4],
        "da-va-dat/nha-dia-chat-lam-gi": [1, 3, 4],
        "ho-hap/giu-phoi-khoe": [2, 3, 4],
        "khung-long/hoa-thach-ke-chuyen-khung-long": [1, 3, 4],
        "nao-bo-va-giac-quan/nao-dieu-khien-co-the": [1, 2, 4],
        "nao-bo-va-giac-quan/day-than-kinh-truyen-tin": [1, 2, 4],
        "nao-bo-va-giac-quan/ngu-du-giac-va-doi-mu-bao-hiem": [1, 3, 4],
        "thoi-tiet-va-thien-tai/nang-mua-gio-may": [1, 3, 4],
        "thoi-tiet-va-thien-tai/mua-mua-bao": [1, 2, 4],
        "thoi-tiet-va-thien-tai/an-toan-khi-co-bao-lu": [1, 2, 4],
        "chuoi-thuc-an/con-vat-kiem-an-the-nao": [1, 2, 4],
        "chuoi-thuc-an/chuoi-thuc-an-la-gi": [1, 4, 3],
        "chuoi-thuc-an/moi-loai-mot-vai": [1, 2, 4],
        "chuoi-thuc-an/so-sanh-cac-chuoi-thuc-an": [1, 2, 4],
        "goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha": [2, 4, 3],
        "goi-ten-va-nhom-dong-vat/dong-vat-co-vu": [1, 2, 4],
        "goi-ten-va-nhom-dong-vat/chim-va-bo-sat": [1, 3, 4],
        "goi-ten-va-nhom-dong-vat/co-the-cac-con-vat": [1, 4, 3],
        "goi-ten-va-nhom-dong-vat/con-vat-an-gi": [1, 2, 4],
        "sinh-vat-song-o-dau/vat-song-hay-khong-song": [1, 2, 4],
        "sinh-vat-song-o-dau/vat-song-nao-cung-cu-dong": [1, 2, 4],
        "sinh-vat-song-o-dau/nhung-noi-song-nho-xiu": [1, 4, 3],
        // Added by the tester 19/11 (SK-053 lượt 2); each one read against its Học groups.
        "noi-song-tren-trai-dat/moi-con-vat-mot-noi-song": [2, 1, 3],
        "noi-song-tren-trai-dat/bien-va-dai-duong": [1, 2, 4],
        "noi-song-tren-trai-dat/bac-cuc": [1, 3, 2],
        "noi-song-tren-trai-dat/nam-cuc": [1, 3, 2],
        "thoi-tiet-va-cac-mua/thoi-tiet-hom-nay": [2, 1, 3],
        "thoi-tiet-va-cac-mua/mua-mua-va-mua-kho": [2, 1, 3],
        "thoi-tiet-va-cac-mua/mua-thu-va-mua-dong": [1, 2, 4],
        "co-the-cua-em/bo-phan-ben-ngoai-co-the": [1, 2, 4],
        "co-the-cua-em/nam-giac-quan-cua-em": [1, 2, 5],
        // Weak but not wrong: key point 1 names eyes, noses and ears and takes the nose group
        // (two shared words); key point 3 is a safety line that no group illustrates.
        "co-the-cua-em/nhin-ngui-va-nghe": [2, 4, 3],
        "cay-quanh-em/cay-co-hoa-re-than-la-hoa": [1, 3, 4],
        // Weak but not wrong: key point 3 ("do not pick them") has no group of its own and takes
        // the leftover one.
        "cay-quanh-em/hoa-nhieu-mau-nhieu-hinh": [1, 3, 2],
        "cay-quanh-em/rau-qua-ta-an-la-phan-nao-cua-cay": [1, 2, 4],
        "lon-len/vat-song-nao-cung-co-vong-doi": [1, 4, 3],
        "lon-len/con-vat-de-con": [1, 2, 4],
        "lon-len/con-vat-doi-hinh-dang": [1, 2, 4],
        "lon-len/vong-doi-cua-cay": [1, 2, 4],
        "lon-len/muon-lon-len-con-vat-can-gi": [2, 1, 4],
        // Added by the tester 19/11 (SK-058, "Rà ảnh (tester 19/11, lượt 2)"): *Núi, sông và biển*,
        // read against the Học group and the picture each one takes. *Đồng bằng và ruộng lúa* keeps
        // 1, 2, 3 after content-editor swapped its last two groups, so it is not in this table.
        "nui-song-va-bien/dat-lien-va-bien": [1, 2, 4],
        "nui-song-va-bien/nui-va-doi": [1, 2, 4],
        "nui-song-va-bien/song-va-ho": [1, 2, 4],
        // Key point 1 says beaches can be sandy *or* rocky and takes the sandy group (a tie with
        // the rocky one, broken by place); the recap card shows sand only. Written down in
        // `_topic.md`, "Ghép ý chính với ô Học".
        "nui-song-va-bien/bai-bien-dao-va-vinh": [1, 3, 4],
        "nui-song-va-bien/hang-dong": [1, 2, 4],
        // SK-061 (ios-dev 20/11): the six lessons of *Bầu trời ngày và đêm* all keep 1, 2, 3 (each
        // key point read against Học group n on the pack of 20/11), so none is in this table.
    ]

    @Test func wordsAndStems() {
        #expect(KeyPointPictures.stem("rocks") == "rock")
        #expect(KeyPointPictures.stem("bodies") == "body")
        #expect(KeyPointPictures.stem("breathes") == "breath")
        #expect(KeyPointPictures.stem("breathe") == "breath")
        #expect(KeyPointPictures.stem("dies") == "die", "no ending that leaves 3 letters but s")
        #expect(KeyPointPictures.stem("sleeping") == "sleep")
        #expect(KeyPointPictures.words("The Oceans are BIG, and it's wet.") == ["ocean", "big", "wet"])
    }

    @Test func groupsAreTakenByWordsThenByPlace() {
        let groups = [("Dust", "Dust can hurt your lungs."), ("Smoke", "Smoke from burning straw is bad."),
                      ("Mask", "A mask keeps dust out."), ("Tiny dust", "Tiny dust gets deep into lungs.")]
        let points = ["Smoke from burning straw hurts lungs.", "A mask keeps dust out of your nose.", "Tiny dust gets deep inside."]
        #expect(KeyPointPictures.match(keyPoints: points, groups: groups) == [1, 2, 3])
        #expect(KeyPointPictures.match(keyPoints: ["zzz", "yyy", "xxx"], groups: groups) == [0, 1, 2], "no shared word: by place")
        #expect(KeyPointPictures.match(keyPoints: ["a", "b", "c"], groups: []) == [nil, nil, nil])
    }

    /// Every lesson of the embedded pack against the designer's table.
    @Test(.enabled(if: EmbeddedPack.isBuilt)) func designerTableOnThePack() async throws {
        let library = try await EmbeddedPack.library()
        var moved = 0
        for topic in library.topics {
            for lesson in topic.lessons {
                let groups = lesson.learn.lazy.compactMap { block -> ExploreGroups? in
                    if case .exploreGroups(let explore) = block { return explore }
                    return nil
                }.first?.groups ?? []
                let matched = KeyPointPictures.match(keyPoints: lesson.keyPoints.map(\.en), groups: groups.map { ($0.label.en, $0.sentence.en) })
                let name = "\(topic.topic.slug)/\(lesson.slug)"
                let expected = Self.table[name] ?? Array(1...lesson.keyPoints.count)
                #expect(matched.map { ($0 ?? -1) + 1 } == expected, "\(name)")
                if matched != Array(0..<lesson.keyPoints.count).map(Optional.some) { moved += 1 }
            }
        }
        #expect(moved == Self.table.count)
    }
}

// MARK: - "ô-xi" (U+2011)

@Suite struct HyphenTests {
    @Test func vietnameseLoanWordsDoNotBreakAtTheirHyphen() {
        let oxygen = Spoken(en: "oxygen-rich air", vi: "khí ô-xi")
        #expect(oxygen.text(in: .vi) == "khí ô\u{2011}xi")
        #expect(oxygen.text(in: .en) == "oxygen-rich air", "English keeps its hyphen")
        #expect("các-bon và a-xít".keepingHyphenatedWords == "các\u{2011}bon và a\u{2011}xít")
        #expect("Cá - loài vật".keepingHyphenatedWords == "Cá - loài vật", "a dash between spaces stays")
        #expect("-xi".keepingHyphenatedWords == "-xi")
        #expect(LanguageMode.viFirst.sentence(oxygen) == "khí ô\u{2011}xi")
    }
}

// MARK: - New words on Tổng kết (designer 15/11, rà bản dựng)

@Suite struct WordFitTests {
    /// A stand-in measure: 10 pt a character (the real one is Phudu 900 at `title`).
    static func measure(_ text: String) -> CGFloat { CGFloat(text.count) * 10 }

    @Test func aWordThatFitsKeepsItsSize() {
        #expect(WordFit.fit("FAT", width: 100, measure: Self.measure) == .init(scale: 1, lines: 1))
        #expect(WordFit.fit("SEA SPONGE", width: 100, measure: Self.measure) == .init(scale: 1, lines: 1))
    }

    /// One word: one line, smaller, never cut ("CARBOHYDRATE" in four columns), down to the floor.
    @Test func oneWordShrinksOnOneLine() {
        let fit = WordFit.fit("CARBOHYDRATE", width: 66, measure: Self.measure)
        #expect(fit.lines == 1)
        #expect(abs(fit.scale - 0.55) < 0.001)
        #expect(WordFit.fit("PALAEONTOLOGISTS", width: 40, measure: Self.measure) == .init(scale: WordFit.floor, lines: 1))
    }

    /// Several words: one line down to 0.8, else two lines broken at the space, small enough for
    /// the longest word to fit its line.
    @Test func severalWordsShrinkThenBreakAtTheSpace() {
        #expect(WordFit.fit("SEA SPONGE", width: 85, measure: Self.measure) == .init(scale: 0.85, lines: 1))
        let pacific = WordFit.fit("PACIFIC OCEAN", width: 66, measure: Self.measure)
        #expect(pacific.lines == 2)
        #expect(abs(pacific.scale - 66.0 / 70) < 0.001)
        #expect(WordFit.fit("MAGNIFYING GLASS", width: 60, measure: Self.measure) == .init(scale: 0.6, lines: 2))
    }

    /// SK-047 (tester 16/11): a phrase breaks where SwiftUI breaks it (greedy, at the spaces), so
    /// its size is the one at which those lines fit, not only its longest word ("THI NGHIEM" is
    /// 100 wide: at 95 it needs 0.95, or the greedy break makes three lines and the last is cut).
    @Test func aPhraseFitsTheLinesSwiftUIBreaks() {
        #expect(WordFit.fit("THI NGHIEM CONG BANG", width: 95, measure: Self.measure) == .init(scale: 0.95, lines: 2))
        #expect(WordFit.fit("THI NGHIEM CONG BANG", width: 95, maxLines: 3, measure: Self.measure) == .init(scale: 0.95, lines: 2),
                "two lines at 0.8 or more beat three")
        let three = WordFit.fit("THI NGHIEM CONG BANG", width: 60, maxLines: 3, measure: Self.measure)
        #expect(three.lines == 3)
        #expect(abs(three.scale - 60.0 / 90) < 0.001)
        #expect(WordFit.lineCount(["THI", "NGHIEM", "CONG", "BANG"], lineWidth: 100, measure: Self.measure) == 2)
        #expect(WordFit.lineCount(["THI", "NGHIEM", "CONG", "BANG"], lineWidth: 90, measure: Self.measure) == 3)
        #expect(WordFit.lineCount(["PALAEONTOLOGY"], lineWidth: 50, measure: Self.measure) == nil, "a word wider than the line")
    }

    /// `rawFit` keeps a scale under the floor, so a card too narrow for its word shows in the tests.
    @Test func rawFitKeepsWhatTheFloorHides() {
        #expect(WordFit.rawFit("PALAEONTOLOGISTS", width: 40, measure: Self.measure) == .init(scale: 0.25, lines: 1))
        #expect(WordFit.fit("PALAEONTOLOGISTS", width: 40, measure: Self.measure).scale == WordFit.floor)
    }

    @Test func styleKeepsTheFaceAndShrinksTheSize() {
        let style = WordFit.Fit(scale: 0.5, lines: 1).style(Tokens.Typography.title)
        #expect(style.family == Tokens.Typography.title.family)
        #expect(style.weight == Tokens.Typography.title.weight)
        #expect(style.size == (Tokens.Typography.title.size * 0.5).rounded(.down))
    }
}

// MARK: - A lesson stopped on the old pack, opened on the new one

@MainActor
@Suite struct StaleProgressTests {
    /// SK-047 (dev's open point): lesson 1 stopped at q4 on the pack before content-editor's
    /// changes: q2 was answered with `q2_energy` (now `q2_nutrients`), q5 with an option that is
    /// gone. Opened on the new content: no crash, q2 and q5 open again with no try and no
    /// `hint_used`, the attempt goes back to q2, the answered questions that still fit stay, and the
    /// attempt can be finished complete.
    @Test func goneKeysOpenTheirQuestionsAgain() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let lesson = harness.lesson
        func tries(_ value: [Try]) -> String { String(decoding: try! JSONEncoder().encode(value), as: UTF8.self) }
        let q1 = lesson.quiz[0], q3 = lesson.quiz[2]
        let attemptId = UUID()
        let file = """
        {
          "attempt_id" : "\(attemptId.uuidString)",
          "child_id" : "\(harness.child.uuidString)",
          "explore_seen" : [ "explore_carb", "explore_gone" ],
          "explore_selected" : "explore_gone",
          "hints_used" : [ "q2", "q3" ],
          "is_paused" : true,
          "lesson_id" : "\(lesson.id.uuidString)",
          "play_completed" : true,
          "quiz_tries" : {
            "q1" : \(tries([rightTry(q1)])),
            "q2" : [ { "filled" : [ "q2_energy" ] } ],
            "q3" : \(tries([rightTry(q3)])),
            "q5" : [ { "selected" : [ "q5_fish", "q5_old_option" ] } ],
            "q9" : [ { "selected" : "gone" } ]
          },
          "started_at" : "2026-10-29T02:50:00Z",
          "step" : { "index" : 3, "name" : "quiz" },
          "tray" : [ "tray_rice", "tray_gone" ],
          "updated_at" : "2026-10-29T02:59:00Z",
          "warmup_tries" : { "w1" : [ { "filled" : [ "w1_old" ] } ] }
        }
        """
        let url = harness.store.inProgressURL(lessonId: lesson.id)
        try FileManager.default.createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true)
        try Data(file.utf8).write(to: url)

        let session = harness.session()
        #expect(session.progress.attemptId == attemptId, "the attempt is kept, not started over")
        #expect(session.step == .quiz(index: 1), "back to q2, the first question that opens again")
        let q2 = session.quizItems[1], q5 = session.quizItems[4]
        #expect(session.status(of: q2, in: .quiz) == .open)
        #expect(session.status(of: q5, in: .quiz) == .open)
        #expect(session.status(of: session.warmupItems[0], in: .warmup) == .open)
        #expect(session.status(of: q1, in: .quiz).isDone && session.status(of: q3, in: .quiz).isDone)
        #expect(session.progress.quizTries["q9"] == nil)
        #expect(session.progress.hintsUsed == ["q3"])
        #expect(session.progress.tray == ["tray_rice"])
        #expect(session.progress.exploreSeen == ["explore_carb"])
        #expect(session.progress.exploreSelected == nil)

        // The child answers what opened again, then the rest: a complete attempt.
        while case .quiz(let index) = session.step {
            let item = session.quizItems[index]
            if !session.status(of: item, in: .quiz).isDone { session.submit(rightTry(item), for: item, in: .quiz) }
            session.advance()
        }
        #expect(session.step == .recap)
        #expect(session.summary?.score == LessonScore(correct: 6, max: 6, completed: true))
    }

    /// Saved tries that still fit the content are left exactly as they were.
    @Test func triesThatFitAreKept() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        var saved = AttemptProgress(childId: harness.child, lessonId: harness.lesson.id, now: harness.clock.now, firstStep: .quiz(index: 2))
        saved.quizTries = ["q1": [rightTry(harness.lesson.quiz[0])], "q2": [wrongTry(harness.lesson.quiz[1])]]
        saved.hintsUsed = ["q2"]
        let checked = LessonSession.reconciled(
            saved, warmup: harness.lesson.warmup, quiz: harness.lesson.quiz, rules: harness.rules, trayItems: nil, groups: nil
        )
        #expect(checked.dropped.isEmpty)
        #expect(checked.progress == saved)
    }
}
