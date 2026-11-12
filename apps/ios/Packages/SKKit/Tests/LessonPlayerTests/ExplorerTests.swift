import ContentModel
import Foundation
import LessonEngine
import Profiles
import Testing
@testable import LessonPlayer

/// SK-040: Explorer lessons. The lesson is the iOS test fixture `apps/ios/TestContent/explorer/
/// fixture-explorer-ios` (test data, passes `content-cli validate` with 0 errors), until the first
/// Explorer topic (SK-041) is in the pack; the rules are `content/rules.json` → `explorer`.
@MainActor
struct ExplorerTests {
    static let lessonURL = Repo.find("apps/ios/TestContent/explorer/fixture-explorer-ios/01-fixture-explorer-ios-lesson.json")

    static func lesson() throws -> Lesson {
        try ContentDecoder().decodeLesson(from: Data(contentsOf: lessonURL))
    }

    static func rules() throws -> LessonRules {
        try LessonRules.load(from: Data(contentsOf: Repo.rulesURL), ageGroup: "explorer")
    }

    let directory = FileManager.default.temporaryDirectory.appendingPathComponent("ExplorerTests-\(UUID().uuidString)")

    func session(_ presentation: LessonPresentation = .explorer) throws -> LessonSession {
        LessonSession(
            lesson: try Self.lesson(), rules: try Self.rules(),
            context: .init(childId: UUID(), timeZone: TimeZone(identifier: "Asia/Ho_Chi_Minh")!,
                           languageMode: .bilingual, voiceMode: .both, presentation: presentation),
            store: AttemptStore(directory: directory)
        )
    }

    // MARK: Presentation and formats

    @Test func presentationFollowsTheTopicAgeGroup() {
        #expect(LessonPresentation(ageGroup: "explorer") == .explorer)
        #expect(LessonPresentation(ageGroup: "discoverer") == .discoverer)
        #expect(LessonPresentation(ageGroup: "scientist") == .discoverer)
    }

    @Test func explorerShowsItsThreeFormatsOnly() throws {
        let lesson = try Self.lesson()
        func answer(_ format: String) -> QuizItem.Answer? { lesson.quiz.first { $0.format == format }?.answer }
        #expect(try #require(answer("single_choice")).hasRenderer(for: .explorer))
        #expect(try #require(answer("true_false")).hasRenderer(for: .explorer))
        #expect(try #require(answer("order_sequence")).hasRenderer(for: .explorer))
        #expect(QuizItem.Answer.unknown(format: "sort_into_groups").hasRenderer(for: .explorer) == false)
        // Discoverer is unchanged: no order renderer there yet.
        #expect(try #require(answer("order_sequence")).hasRenderer == false)
    }

    @Test func explorerSessionKeepsTheOrderQuestion() throws {
        let explorer = try session(.explorer)
        #expect(explorer.isExplorer)
        #expect(explorer.quizItems.count == 6)
        #expect(explorer.warmupItems.count == 2)
        #expect(explorer.steps.first == .warmup(index: 0))
        #expect(explorer.steps.contains(.learn))
        #expect(explorer.steps.contains(.play))
        #expect(explorer.steps.last == .reward)
        let discoverer = try session(.discoverer)
        #expect(discoverer.quizItems.count == 5)
    }

    // MARK: Order sequence scoring (engine, B4.4)

    @Test func orderSequenceRightOnACompleteMatchOnly() throws {
        let session = try session()
        let item = try #require(session.quizItems.first { $0.format == "order_sequence" })
        guard case .orderSequence(let order) = item.answer else { Issue.record("not an order"); return }
        var wrong = order.answer
        wrong.swapAt(0, 1)
        let afterWrong = session.submit(.order(wrong), for: item, in: .quiz)
        #expect(afterWrong.isRetry)
        let afterRight = session.submit(.order(order.answer), for: item, in: .quiz)
        #expect(afterRight == .done(correct: true, firstTry: false, last: .order(order.answer)))
        // Right on the second try earns no point (B4.4, partial_order_min null for Explorer).
        #expect(session.itemScore(of: item, in: .quiz)?.points == 0)
    }

    @Test func orderSequenceOutOfTriesAfterMaxTries() throws {
        let session = try session()
        let item = try #require(session.quizItems.first { $0.format == "order_sequence" })
        guard case .orderSequence(let order) = item.answer else { Issue.record("not an order"); return }
        let wrong = Array(order.answer.reversed())
        session.submit(.order(wrong), for: item, in: .quiz)
        let status = session.submit(.order(wrong), for: item, in: .quiz)
        #expect(status == .done(correct: false, firstTry: false, last: .order(wrong)))
        #expect(session.rules.scoring.maxTries == 2)
    }

    // MARK: Board

    @Test func boardPlacesMovesAndSwaps() {
        let empty: [String?] = [nil, nil, nil]
        let one = ExplorerOrderBoard.placing("egg", at: 0, in: empty)
        #expect(one == ["egg", nil, nil])
        // Moving a placed card empties its old place.
        #expect(ExplorerOrderBoard.placing("egg", at: 2, in: one!) == [nil, nil, "egg"])
        // Dropping on a full place sends the card there back to the pool.
        #expect(ExplorerOrderBoard.placing("hen", at: 0, in: ["egg", "chick", nil]) == ["hen", "chick", nil])
        #expect(ExplorerOrderBoard.placing("hen", at: 3, in: empty) == nil)
    }

    @Test func boardShowsDraftTryOrAnswer() {
        let answer = ["egg", "chick", "hen"]
        let wrong = ["hen", "egg", "chick"]
        let draft: [String?] = ["egg", nil, nil]
        #expect(ExplorerOrderBoard.shown(draft: draft, answer: answer, status: .open, lastTry: nil, naming: false) == draft)
        #expect(ExplorerOrderBoard.shown(draft: [nil, nil, nil], answer: answer, status: .retry(last: .order(wrong)), lastTry: wrong, naming: true) == wrong)
        #expect(ExplorerOrderBoard.shown(draft: [nil, nil, nil], answer: answer, status: .done(correct: false, firstTry: false, last: .order(wrong)), lastTry: wrong, naming: false) == answer)
        #expect(ExplorerOrderBoard.look(status: .done(correct: true, firstTry: true, last: .order(answer)), naming: false) == .right)
        #expect(ExplorerOrderBoard.look(status: .done(correct: false, firstTry: false, last: .order(wrong)), naming: false) == .answer)
    }

    // MARK: Card looks (Quiz-A states)

    @Test func cardLooksFollowTheCanvasStates() {
        let open = QuestionStatus.open
        #expect(ExplorerCardLook.of(key: "hen", tried: [], isCorrect: true, status: open, naming: nil) == .idle)
        // Just tapped: named, no result yet, even though the try is scored.
        let right = QuestionStatus.done(correct: true, firstTry: true, last: .selected("hen"))
        #expect(ExplorerCardLook.of(key: "hen", tried: ["hen"], isCorrect: true, status: right, naming: "hen") == .naming)
        #expect(ExplorerCardLook.of(key: "hen", tried: ["hen"], isCorrect: true, status: right, naming: nil) == .right)
        // Wrong with a try left: the tried card sinks, the others stay paper.
        let retry = QuestionStatus.retry(last: .selected("fish"))
        #expect(ExplorerCardLook.of(key: "fish", tried: ["fish"], isCorrect: false, status: retry, naming: nil) == .tried)
        #expect(ExplorerCardLook.of(key: "hen", tried: ["fish"], isCorrect: true, status: retry, naming: nil) == .idle)
        // Out of tries: the right card shows as the answer, both tried cards sunk.
        let out = QuestionStatus.done(correct: false, firstTry: false, last: .selected("dog"))
        #expect(ExplorerCardLook.of(key: "hen", tried: ["fish", "dog"], isCorrect: true, status: out, naming: nil) == .answer)
        #expect(ExplorerCardLook.of(key: "dog", tried: ["fish", "dog"], isCorrect: false, status: out, naming: nil) == .tried)
        // Right on the second try: the first wrong card stays sunk while the second is named.
        let secondRight = QuestionStatus.done(correct: true, firstTry: false, last: .selected("hen"))
        #expect(ExplorerCardLook.of(key: "fish", tried: ["fish", "hen"], isCorrect: false, status: secondRight, naming: "hen") == .tried)
    }

    @Test func triedKeysOfEachTryShape() {
        #expect(triedKeys([.selected("a"), .value(false), .order(["x", "y"])]) == ["a", "false", "x,y"])
    }

    // MARK: Voice and bubble

    @Test func mascotLineFollowsTheStatus() throws {
        let item = try #require(try session().quizItems.first)
        #expect(LessonSession.explorerLine(item, status: .open) == LessonSession.questionSpoken(item))
        #expect(LessonSession.explorerLine(item, status: .retry(last: .selected("x"))) == [item.hint])
        #expect(LessonSession.explorerLine(item, status: .done(correct: true, firstTry: true, last: .selected("x"))) == [item.explanationCorrect])
        #expect(LessonSession.explorerLine(item, status: .done(correct: false, firstTry: false, last: .selected("x"))) == [item.explanationWrong])
        #expect(ExplorerMood.of(status: .retry(last: .selected("x")), naming: false) == .think)
        #expect(ExplorerMood.of(status: .done(correct: true, firstTry: true, last: .selected("x")), naming: false) == .happy)
    }

    @Test func pictureNamesComeFromLabels() throws {
        let session = try session()
        let choice = try #require(session.quizItems.first { $0.format == "single_choice" })
        guard case .singleChoice(let options) = choice.answer else { return }
        #expect(LessonSession.answerName(choice, key: options.options[0].key) == options.options[0].label)
        let order = try #require(session.quizItems.first { $0.format == "order_sequence" })
        guard case .orderSequence(let sequence) = order.answer else { return }
        #expect(LessonSession.answerName(order, key: sequence.items[1].key) == sequence.items[1].label)
        // Explorer true/false has no labels: the nod and the shake are not named aloud.
        let tf = try #require(session.quizItems.first { $0.format == "true_false" })
        #expect(LessonSession.answerName(tf, value: true) == nil)
        // The order pictures' names are read ahead with the step.
        #expect(LessonSession.questionStrings(order).contains(sequence.items[0].label))
    }

    @Test func firstTrueFalseOfTheLessonGetsTheIntro() throws {
        let session = try session()
        let all = session.warmupItems + session.quizItems
        let trueFalse = all.filter { $0.format == "true_false" }
        #expect(trueFalse.count >= 2)
        #expect(session.isFirstTrueFalse(trueFalse[0]))
        #expect(!session.isFirstTrueFalse(trueFalse[1]))
    }

    // MARK: Học and Chơi (lượt 2)

    @Test func explorerReadsTheGameInstructionAndGroupSentences() throws {
        let session = try session()
        #expect(session.autoplayUtterance(for: .play)?.id == "play.message")
        let group = try #require(session.exploreBlock?.groups.first)
        #expect(session.explorerGroupUtterance(group).id == "learn.explore.\(group.key)")
        let tray = try #require(session.tray)
        session.tapTrayItem(tray.items[0].key)
        #expect(session.explorerTrayTapUtterance(tray.items[0]).id == "play.tap.\(tray.items[0].key).1")
    }

    /// Bài 4 of Explorer #1: `capacity: 2`, two required groups; the tray succeeds with one of each.
    @Test func twoPlaceTraySucceedsWithOneOfEachGroup() throws {
        var object = try #require(try JSONSerialization.jsonObject(with: Data(contentsOf: Self.lessonURL)) as? [String: Any])
        var play = try #require(object["play"] as? [String: Any])
        play["capacity"] = 2
        var groups = try #require(play["groups"] as? [[String: Any]])
        var second = groups[0]
        second["key"] = "tray_plant"
        second["label"] = ["en": "Plant", "vi": "Cây"]
        groups.append(second)
        play["groups"] = groups
        var items = try #require(play["items"] as? [[String: Any]])
        var plant = items[0]
        plant["key"] = "tray_grass"
        plant["label"] = ["en": "grass", "vi": "cỏ"]
        plant["group"] = "tray_plant"
        items.append(plant)
        play["items"] = items
        var messages = try #require(play["messages"] as? [String: Any])
        var missing = try #require(messages["missing"] as? [String: Any])
        missing["tray_plant"] = ["en": "Add a plant.", "vi": "Thêm một cây."]
        messages["missing"] = missing
        play["messages"] = messages
        object["play"] = play
        let lesson = try ContentDecoder().decodeLesson(from: JSONSerialization.data(withJSONObject: object))
        let session = LessonSession(
            lesson: lesson, rules: try Self.rules(),
            context: .init(childId: UUID(), timeZone: .current, languageMode: .bilingual, voiceMode: .both, presentation: .explorer),
            store: AttemptStore(directory: directory)
        )
        #expect(session.tray?.capacity == 2)
        session.tapTrayItem("tray_hen")
        #expect(session.trayState?.success == false)
        session.tapTrayItem("tray_grass")
        #expect(session.trayState?.success == true)
        #expect(session.trayState?.tray.count == 2)
    }

    // MARK: Reward (D1)

    @Test func rewardIsScoredOutOfSightWithStarsFromTheEngine() throws {
        let session = try session()
        while case .warmup = session.step { answerRight(session, phase: .warmup); session.advance() }
        while session.step == .learn || session.step == .play { session.advance() }
        while case .quiz = session.step { answerRight(session, phase: .quiz); session.advance() }
        #expect(session.step == .reward)
        let summary = try #require(session.summary)
        #expect(summary.score.correct == 6)
        #expect(summary.stars.stars >= 1)
        // D1: no XP, on the screen, on the attempt sent to the server, or per question, even
        // though rules.explorer.xp_* are not 0.
        #expect(session.rules.xp.perCorrect > 0)
        #expect(summary.xp.total == 0)
        #expect(summary.record.xp == 0)
        #expect(session.quizItems.allSatisfy { session.xpEarned(by: $0, in: .quiz) == nil })
        // The reward reads the sticker's name (Discoverer reads nothing there).
        #expect(session.autoplayUtterance(for: .reward)?.id == "reward.card")
    }

    private func answerRight(_ session: LessonSession, phase: QuestionPhase) {
        let index: Int
        switch session.step {
        case .warmup(let i), .quiz(let i): index = i
        default: return
        }
        guard let item = session.item(at: index, in: phase) else { return }
        session.submit(rightTry(item), for: item, in: phase)
    }
}
