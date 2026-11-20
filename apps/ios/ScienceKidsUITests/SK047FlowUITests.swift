import XCTest

/// SK-047 (tester 15/11): the lesson flow with Tổng kết, the hint button, the locked cards of
/// `order_sequence` and the chart names, played on one simulator with the built pack.
///
/// The lessons, their right answers and their texts come from `content/.build/pack` (the pack the
/// app embeds), never from the test. `LessonUITests` still assumes the pre-A2 screens (SK-043),
/// so this file drives the A2 screens on its own and does not touch it.
///
/// Screenshots go to `SK_SHOT_DIR` (`TEST_RUNNER_SK_SHOT_DIR` for xcodebuild).
@MainActor
final class SK047FlowUITests: XCTestCase {
    private var pack: Pack!

    override func setUp() async throws {
        continueAfterFailure = false
        XCUIDevice.shared.orientation = .portrait
        pack = try Pack.load()
    }

    // MARK: - Tests

    /// The golden flow of a Discoverer lesson: Khởi động → Học → Chơi → Quiz → Tổng kết (2 pages)
    /// → Thưởng, with the hint opened on q4 (SK-047: the point still counts).
    func testDiscovererGoldenFlowWithHintAndRecap() throws {
        let lesson = try pack.lesson("vi-sao-ta-phai-tho")
        let app = launch(openLesson: lesson.id)
        open(lesson, in: app)
        playWarmupLearnPlay(lesson, in: app)

        for item in lesson.quiz {
            if item.key == "q4" {
                let hint = app.buttons["lesson.hint.button"].firstMatch
                XCTAssertTrue(hint.waitForExistence(timeout: 10), "no hint button on q4")
                hint.tap()
                XCTAssertTrue(element(app, "lesson.hint.slip").waitForExistence(timeout: 5), "the hint slip did not open")
            }
            answerRight(item, in: app)
            tapNext(app)
        }

        // Tổng kết page 1: one card per key point, the title of the page is only for VoiceOver.
        XCTAssertTrue(element(app, "lesson.recap.key_point.1").waitForExistence(timeout: 10), "Tổng kết page 1 did not open after the last question")
        for index in lesson.keyPoints.indices {
            let card = element(app, "lesson.recap.key_point.\(index + 1)")
            XCTAssertTrue(card.exists, "no key point card \(index + 1)")
            XCTAssertEqual(card.label, lesson.keyPoints[index], "key point \(index + 1)")
        }
        XCTAssertFalse(element(app, "lesson.recap.key_point.\(lesson.keyPoints.count + 1)").exists, "one card too many")
        shot(app, "r-d1-ho-hap-01")

        app.buttons["lesson.recap.next"].firstMatch.tap()

        // Page 2: the myth card (Na's claim struck, the truth), the new words, the objective.
        XCTAssertTrue(element(app, "lesson.recap.myth").waitForExistence(timeout: 5), "no myth card on page 2")
        XCTAssertEqual(element(app, "lesson.recap.claim").label, lesson.statement(of: "q6"), "claim")
        XCTAssertEqual(element(app, "lesson.recap.truth").label, lesson.explanationCorrect(of: "q6"), "truth")
        for word in lesson.words {
            XCTAssertTrue(element(app, "lesson.recap.word.\(word)").exists, "no word \(word) in the strip")
        }
        XCTAssertEqual(element(app, "lesson.recap.objective").label, lesson.objective, "objective")
        shot(app, "r-d2-ho-hap-01")

        app.buttons["lesson.recap.to_reward"].firstMatch.tap()
        XCTAssertTrue(element(app, "lesson.reward.stars").waitForExistence(timeout: 10), "Thưởng did not open")
        shot(app, "reward-ho-hap-01")
    }

    /// Closing the app on Tổng kết page 1: the lesson is already scored and saved, so it opens
    /// again as a new attempt and the topic shows its stars (`history.json` checked outside).
    func testClosingAtRecapKeepsTheLesson() throws {
        let lesson = try pack.lesson("tho-khi-chay-nhay")
        // SK-060: fresh, or a lesson another test of this class left in the middle (B7.6) opens at
        // the second launch instead of Home.
        let app = launch(openLesson: lesson.id, reset: true)
        open(lesson, in: app)
        playWarmupLearnPlay(lesson, in: app)
        for item in lesson.quiz {
            answerRight(item, in: app)
            tapNext(app)
        }
        XCTAssertTrue(element(app, "lesson.recap.key_point.1").waitForExistence(timeout: 10), "Tổng kết did not open")
        // `ho-hap/03`: Na is right, so the card nods and nothing is struck.
        app.buttons["lesson.recap.next"].firstMatch.tap()
        XCTAssertTrue(element(app, "lesson.recap.nod").waitForExistence(timeout: 5), "the card should nod when Na is right")
        XCTAssertFalse(element(app, "lesson.recap.shake").exists, "nothing should shake when Na is right")
        shot(app, "r-d2-nod-ho-hap-03")
        app.buttons["lesson.recap.prev"].firstMatch.tap()
        XCTAssertTrue(element(app, "lesson.recap.key_point.1").waitForExistence(timeout: 5), "back to page 1")

        app.terminate()
        let again = launch()
        openTopic(of: lesson, in: again)
        shot(again, "topic-after-closing-at-recap")
        again.buttons["topic.lesson.\(try pack.number(of: lesson))"].firstMatch.tap()
        // A saved attempt would open where it stopped; the lesson starts again instead.
        XCTAssertTrue(element(again, "lesson.prompt").waitForExistence(timeout: 10) || element(again, "lesson.statement").waitForExistence(timeout: 1),
                      "the lesson did not open on its first question")
        XCTAssertFalse(element(again, "lesson.recap.key_point.1").exists, "it opened on Tổng kết again")
    }

    /// `order_sequence` (`da-va-dat/08` q4): a wrong try keeps the cards that are in their right
    /// place (locked) and sends the others back; the second try is right but earns no point.
    func testOrderSequenceLocksCardsInPlace() throws {
        let lesson = try pack.lesson("hoa-thach-hinh-thanh-the-nao")
        let app = launch(openLesson: lesson.id)
        open(lesson, in: app)
        playWarmupLearnPlay(lesson, in: app)

        for item in lesson.quiz {
            if item.format == "order_sequence" {
                let answer = item.answerOrder
                XCTAssertEqual(answer.count, 4, "the ticket's question has four cards")
                // Swap the two middle cards: places 1 and 4 are right, 2 and 3 are not.
                let wrong = [answer[0], answer[2], answer[1], answer[3]]
                for key in wrong { tapElement(app, "lesson.order.card.\(key)") }

                let locked = app.descendants(matching: .any)["lesson.order.place.1"].firstMatch
                XCTAssertTrue(locked.waitForExistence(timeout: 5), "no place 1 after the wrong try")
                shot(app, "o-d-retry-da-va-dat-08")
                XCTAssertEqual(locked.value as? String, "In the right place, locked", "place 1 should be locked")
                XCTAssertEqual(app.descendants(matching: .any)["lesson.order.place.4"].firstMatch.value as? String,
                               "In the right place, locked", "place 4 should be locked")
                // A tap on a locked place does nothing: its card stays (the button is there but
                // takes no hit, so `isHittable` is not the check).
                app.buttons["lesson.order.place.1"].firstMatch.tap()
                XCTAssertEqual(app.descendants(matching: .any)["lesson.order.place.1"].firstMatch.value as? String,
                               "In the right place, locked", "a tap took the locked card out")
                XCTAssertTrue(app.buttons["lesson.order.card.\(answer[1])"].firstMatch.exists, "the wrong card came back to the bank")
                XCTAssertTrue(app.buttons["lesson.order.card.\(answer[2])"].firstMatch.exists, "the wrong card came back to the bank")

                tapElement(app, "lesson.order.card.\(answer[1])")
                tapElement(app, "lesson.order.card.\(answer[2])")
                XCTAssertTrue(element(app, "lesson.result.explanation").waitForExistence(timeout: 10), "the second try was not scored")
                XCTAssertFalse(element(app, "lesson.result.xp").exists, "a question right on try 2 earns no XP")
                shot(app, "o-d-right-da-va-dat-08")
            } else {
                answerRight(item, in: app)
            }
            tapNext(app)
        }
        XCTAssertTrue(element(app, "lesson.recap.key_point.1").waitForExistence(timeout: 10), "Tổng kết did not open")
    }

    /// `picture_bar_chart` (`da-va-dat/14` q4): the names under the bars show from the start
    /// (the picture is checked on the screenshot: the names are hidden from VoiceOver by design).
    func testChartQuestionShowsItsBars() throws {
        let lesson = try pack.lesson("nuoc-tham-qua-dat-nao-nhanh-hon")
        let app = launch(openLesson: lesson.id)
        open(lesson, in: app)
        playWarmupLearnPlay(lesson, in: app)

        for item in lesson.quiz {
            if item.format == "picture_bar_chart" {
                XCTAssertTrue(element(app, "lesson.prompt").waitForExistence(timeout: 10))
                XCTAssertEqual(element(app, "lesson.prompt").label, item.prompt, "the chart question asks for data")
                for key in item.optionKeys {
                    XCTAssertTrue(app.buttons["lesson.bar.\(key)"].firstMatch.exists, "no bar \(key)")
                }
                shot(app, "c-ask-da-va-dat-14")
                tapElement(app, "lesson.bar.\(item.rightKeys[0])")
                XCTAssertTrue(element(app, "lesson.result.explanation").waitForExistence(timeout: 10), "the chart was not scored")
                shot(app, "c-right-da-va-dat-14")
            } else {
                answerRight(item, in: app)
            }
            tapNext(app)
        }
        XCTAssertTrue(element(app, "lesson.recap.key_point.1").waitForExistence(timeout: 10), "Tổng kết did not open")
        shot(app, "r-d1-da-va-dat-14")
    }

    /// Explorer: `/08` (q6 true / false, answer false) has the myth card, `/06` (q6 single choice)
    /// has none, and both pages 2 keep their words and their objective. Explorer has no hint button.
    func testExplorerRecapWithAndWithoutMythCard() throws {
        for (slug, hasMyth) in [("oc-bach-tuoc-va-con-vat-bien", true), ("con-vat-an-gi", false)] {
            let lesson = try pack.lesson(slug)
            let app = launch(openLesson: lesson.id)
            open(lesson, in: app)
            playWarmupLearnPlay(lesson, in: app)
            for item in lesson.quiz {
                if item.key == "q1" {
                    XCTAssertFalse(app.buttons["lesson.hint.button"].firstMatch.exists, "Explorer has no hint button (\(slug))")
                }
                answerRight(item, in: app)
                tapNext(app)
            }
            XCTAssertTrue(element(app, "lesson.recap.key_point.1").waitForExistence(timeout: 10), "Tổng kết page 1 (\(slug))")
            shot(app, "r-x1-\(slug)")
            app.buttons["lesson.recap.next"].firstMatch.tap()
            XCTAssertTrue(element(app, "lesson.recap.objective").waitForExistence(timeout: 5), "page 2 (\(slug))")
            XCTAssertEqual(element(app, "lesson.recap.myth").exists, hasMyth, "myth card on \(slug)")
            for word in lesson.words {
                XCTAssertTrue(element(app, "lesson.recap.word.\(word)").exists, "no word \(word) (\(slug))")
            }
            shot(app, "r-x2-\(slug)")
            app.buttons["lesson.recap.to_reward"].firstMatch.tap()
            XCTAssertTrue(element(app, "lesson.reward.stars").waitForExistence(timeout: 15), "Thưởng (\(slug))")
            app.terminate()
        }
    }

    /// One lesson of every other Discoverer topic: the shuffle, the hint and Tổng kết run on the
    /// content of this wave (the four topics not used by the tests above).
    func testOneLessonOfEveryOtherDiscovererTopic() throws {
        for slug in ["thuc-an-cho-ta-nhung-gi", "dat-va-nuoc-tren-trai-dat", "trai-dat-rat-lau-ve-truoc", "nao-dieu-khien-co-the", "nang-mua-gio-may"] {
            let lesson = try pack.lesson(slug)
            let app = launch(openLesson: lesson.id)
            open(lesson, in: app)
            playWarmupLearnPlay(lesson, in: app)
            for (index, item) in lesson.quiz.enumerated() {
                if index == 0 {
                    let hint = app.buttons["lesson.hint.button"].firstMatch
                    XCTAssertTrue(hint.waitForExistence(timeout: 10), "no hint button on q1 of \(slug)")
                    hint.tap()
                    XCTAssertTrue(element(app, "lesson.hint.slip").waitForExistence(timeout: 5), "no hint slip on q1 of \(slug)")
                }
                answerRight(item, in: app)
                tapNext(app)
            }
            XCTAssertTrue(element(app, "lesson.recap.key_point.1").waitForExistence(timeout: 10), "Tổng kết page 1 (\(slug))")
            shot(app, "r-d1-\(slug)")
            app.buttons["lesson.recap.next"].firstMatch.tap()
            XCTAssertTrue(element(app, "lesson.recap.objective").waitForExistence(timeout: 5), "page 2 (\(slug))")
            shot(app, "r-d2-\(slug)")
            app.buttons["lesson.recap.to_reward"].firstMatch.tap()
            XCTAssertTrue(element(app, "lesson.reward.stars").waitForExistence(timeout: 15), "Thưởng (\(slug))")
            app.terminate()
        }
    }

    // MARK: - Flow helpers

    /// English interface (the tests read a few interface labels), no server, motion off.
    /// `openLesson`: `-SKOpenLesson`, so a test does not have to find its lesson on the journey
    /// map (a lesson left half way reopens at launch, `AppModel.reopenCutOffLesson`, and then Home
    /// is not on the screen at all).
    /// SK-059: a tap on a shelf picture opens it big (the tray does not change) and the close
    /// button shuts it; a long press then a drag onto the tray picks it; a picked picture still
    /// opens big; a drop outside the tray changes nothing; a drag from the tray to the shelf takes
    /// it off.
    func testShelfTapZoomsAndDragPicks() throws {
        let lesson = try pack.lesson("vi-sao-ta-phai-tho")
        let app = launch(openLesson: lesson.id)
        open(lesson, in: app)
        playWarmupLearnPlay(lesson, in: app, stopAtPlay: true)
        let keys = lesson.trayOneOfEachGroup
        XCTAssertGreaterThanOrEqual(keys.count, 2)
        let first = keys[0], second = keys[1]

        tapElement(app, "lesson.shelf.\(first)")
        XCTAssertTrue(element(app, "lesson.play.zoom").waitForExistence(timeout: 3), "a tap opens the big view")
        XCTAssertFalse(app.buttons["lesson.tray.\(first)"].exists, "a tap does not pick")
        XCTAssertTrue(app.buttons["lesson.play.zoom.listen"].exists)
        tapElement(app, "lesson.play.zoom.close")
        XCTAssertTrue(element(app, "lesson.play.zoom").waitForNonExistence(timeout: 3), "close shuts the big view")

        PlayDrag.pick(app, first)
        tapElement(app, "lesson.shelf.\(first)")
        XCTAssertTrue(element(app, "lesson.play.zoom").waitForExistence(timeout: 3), "a picked picture opens big")
        tapElement(app, "lesson.play.zoom.close")
        XCTAssertTrue(app.buttons["lesson.tray.\(first)"].exists, "and stays picked")

        let shelfSecond = app.buttons["lesson.shelf.\(second)"].firstMatch
        shelfSecond.press(forDuration: 0.6, thenDragTo: app.buttons["lesson.shelf.\(first)"].firstMatch)
        XCTAssertFalse(app.buttons["lesson.tray.\(second)"].waitForExistence(timeout: 1.5), "a drop on the shelf does not pick")

        app.buttons["lesson.tray.\(first)"].firstMatch.press(forDuration: 0.6, thenDragTo: shelfSecond)
        XCTAssertTrue(app.buttons["lesson.tray.\(first)"].firstMatch.waitForNonExistence(timeout: 3), "a drag out of the tray takes it off")
    }

    /// `reset`: as after a fresh install (`-SKResetProfile`, then `-SKTestProfile` saves the test
    /// profile again), so a lesson another test left in the middle is not opened again at launch (B7.6).
    private func launch(openLesson: String? = nil, reset: Bool = false) -> XCUIApplication {
        let app = XCUIApplication()
        app.launchArguments = ["-AppleLanguages", "(en)", "-AppleLocale", "en_US", "-SKSyncOff", "YES", "-SKReduceMotion", "YES", "-SKTestProfile", "YES"] + PlayDrag.noHint
        if reset { app.launchArguments += ["-SKResetProfile", "YES"] }
        if let openLesson { app.launchArguments += ["-SKOpenLesson", openLesson] }
        app.launch()
        return app
    }

    private func element(_ app: XCUIApplication, _ identifier: String) -> XCUIElement {
        app.descendants(matching: .any)[identifier].firstMatch
    }

    /// The journey map scrolls to the child's place and draws its cards lazily, so a topic above
    /// or below that place is not in the hierarchy until the map is scrolled to it.
    private func openTopic(of lesson: Pack.Lesson, in app: XCUIApplication) {
        let key = (try? pack.topicKey(of: lesson)) ?? ""
        let topic = app.buttons["home.topic.\(key)"].firstMatch
        var swipes = 0
        while !topic.waitForExistence(timeout: swipes == 0 ? 20 : 1), swipes < 12 {
            // Down first (the lessons written so far are at the top of the journey), then up.
            swipes < 6 ? app.swipeDown() : app.swipeUp()
            swipes += 1
        }
        XCTAssertTrue(topic.waitForExistence(timeout: 5), "no topic \(key) on Home after \(swipes) swipes; on screen: \(screenNow(app))")
        for _ in 0..<3 where !topic.isHittable { app.swipeUp() }
        topic.tap()
    }

    /// The lesson is already open (`-SKOpenLesson`): waits for its first screen.
    private func open(_ lesson: Pack.Lesson, in app: XCUIApplication) {
        // Discoverer prints the question; Explorer says it in the mascot's bubble.
        let onScreen = app.descendants(matching: .any)["lesson.prompt"].firstMatch.waitForExistence(timeout: 20)
            || app.descendants(matching: .any)["lesson.statement"].firstMatch.exists
            || app.descendants(matching: .any)["lesson.explorer.bubble"].firstMatch.exists
            || app.buttons["lesson.back"].firstMatch.exists
        XCTAssertTrue(onScreen, "lesson \(lesson.slug) did not open; on screen: \(screenNow(app))")
    }

    /// Khởi động (every question right), the picture book (every page), and the tray (one food of
    /// every required group), up to the first quiz question.
    private func playWarmupLearnPlay(_ lesson: Pack.Lesson, in app: XCUIApplication, stopAtPlay: Bool = false) {
        for item in lesson.warmup {
            answerRight(item, in: app)
            tapNext(app)
        }
        var turns = 0
        while element(app, "lesson.learn.page").waitForExistence(timeout: turns == 0 ? 10 : 2), turns < 12 {
            app.buttons["lesson.explorer.next"].firstMatch.tap()
            turns += 1
        }
        if lesson.trayRequired.isEmpty { return }
        XCTAssertTrue(element(app, "lesson.play.message").waitForExistence(timeout: 10), "Chơi did not open (\(lesson.slug))")
        if stopAtPlay { return }
        for key in lesson.trayOneOfEachGroup { tapShelf(app, key) }
        let done = app.buttons["lesson.play.done"].firstMatch
        XCTAssertTrue(done.waitForExistence(timeout: 5), "the tray is not balanced (\(lesson.slug))")
        done.tap()
    }

    /// Answers one question right, in the order the content gives (the screen shuffles).
    private func answerRight(_ item: Pack.Item, in app: XCUIApplication) {
        switch item.format {
        case "true_false":
            tapElement(app, "lesson.tf.\(item.isTrue)")
        case "fill_blank_bank":
            for key in item.rightKeys { tapElement(app, "lesson.bank.\(key)") }
        case "order_sequence":
            for key in item.answerOrder { tapElement(app, "lesson.order.card.\(key)") }
        case "picture_bar_chart":
            tapElement(app, "lesson.bar.\(item.rightKeys[0])")
        case "multi_choice":
            for key in item.rightKeys { tapElement(app, "lesson.choice.\(key)") }
            tapElement(app, "lesson.check")
        default:
            tapElement(app, "lesson.choice.\(item.rightKeys[0])")
        }
    }

    /// The arrow of the result sheet (Discoverer) or of the Explorer screen.
    private func tapNext(_ app: XCUIApplication) {
        let discoverer = app.buttons["lesson.result.next"].firstMatch
        if discoverer.waitForExistence(timeout: 10) {
            discoverer.tap()
            return
        }
        let explorer = app.buttons["lesson.explorer.next"].firstMatch
        XCTAssertTrue(explorer.waitForExistence(timeout: 5), "no arrow after the question; on screen: \(screenNow(app))")
        explorer.tap()
    }

    /// Taps a button, scrolling it into view first when it is below the fold.
    private func tapElement(_ app: XCUIApplication, _ identifier: String, file: StaticString = #filePath, line: UInt = #line) {
        let target = app.buttons[identifier].firstMatch
        if !target.waitForExistence(timeout: 10) {
            XCTFail("no button \(identifier); on screen: \(screenNow(app))", file: file, line: line)
            return
        }
        // SK-047 (ios-dev 16/11): `isHittable` is true while only a sliver of the button shows,
        // and the bottom bar of Chơi covers the last ~100 pt, so a tap there lands on the bar.
        // Scroll until the whole frame sits above it.
        let bottom = app.windows.firstMatch.frame.maxY - 100
        var swipes = 0
        while swipes < 4, !target.isHittable || target.frame.maxY > bottom {
            app.swipeUp(velocity: .slow)
            swipes += 1
        }
        guard target.isHittable else {
            XCTFail("button \(identifier) never came into view", file: file, line: line)
            return
        }
        target.tap()
    }

    /// Taps a shelf item and checks it reached the tray (tapping one already on the tray takes
    /// it off again, so a missed tap must not pass unnoticed).
    private func tapShelf(_ app: XCUIApplication, _ key: String, file: StaticString = #filePath, line: UInt = #line) {
        // SK-059: a tap on the shelf opens the picture big; a drag picks it.
        PlayDrag.pick(app, key, file: file, line: line)
    }

    private func screenNow(_ app: XCUIApplication) -> String {
        let anchors = ["lesson.prompt", "lesson.statement", "lesson.learn.page", "lesson.play.message", "lesson.recap.title", "lesson.reward.title", "home.greeting"]
            .filter { element(app, $0).exists }
        return "anchors \(anchors), buttons \(app.buttons.allElementsBoundByIndex.prefix(30).map(\.identifier))"
    }

    private func shot(_ app: XCUIApplication, _ name: String) {
        let image = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: image)
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
        guard let dir = ProcessInfo.processInfo.environment["SK_SHOT_DIR"] else { return }
        try? FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true)
        try? image.pngRepresentation.write(to: URL(fileURLWithPath: dir).appendingPathComponent("\(name).png"))
    }
}

// MARK: - The pack

/// The lessons of the built pack (`content/.build/pack`), read from the repo through `#filePath`,
/// plus the syllabus place of each lesson (the topic button and the row on the topic screen).
struct Pack {
    struct Item {
        let raw: [String: Any]
        var key: String { raw["key"] as? String ?? "" }
        var format: String { raw["format"] as? String ?? "" }
        var prompt: String { (raw["prompt"] as? [String: Any])?["en"] as? String ?? "" }
        var isTrue: Bool { raw["answer"] as? Bool ?? false }
        var optionKeys: [String] { (raw["options"] as? [[String: Any]] ?? []).compactMap { $0["key"] as? String } }
        var rightKeys: [String] {
            switch format {
            case "fill_blank_bank": return raw["answers"] as? [String] ?? []
            default: return (raw["options"] as? [[String: Any]] ?? []).filter { $0["correct"] as? Bool == true }.compactMap { $0["key"] as? String }
            }
        }
        var answerOrder: [String] { raw["answer"] as? [String] ?? [] }
    }

    struct Lesson {
        let raw: [String: Any]
        var id: String { (raw["id"] as? String ?? "").lowercased() }
        var slug: String { raw["slug"] as? String ?? "" }
        var objective: String { (raw["objective"] as? [String: Any])?["en"] as? String ?? "" }
        var keyPoints: [String] { (raw["key_points"] as? [[String: Any]] ?? []).compactMap { $0["en"] as? String } }
        var warmup: [Item] { (raw["warmup"] as? [[String: Any]] ?? []).map(Item.init) }
        var quiz: [Item] { (raw["quiz"] as? [[String: Any]] ?? []).map(Item.init) }
        var learn: [[String: Any]] { raw["learn"] as? [[String: Any]] ?? [] }
        var words: [String] {
            guard let list = learn.first(where: { $0["type"] as? String == "word_list" }) else { return [] }
            return list["term_keys"] as? [String] ?? []
        }
        private var play: [String: Any]? { raw["play"] as? [String: Any] }
        var trayRequired: [String] {
            (play?["groups"] as? [[String: Any]] ?? []).filter { $0["role"] as? String == "required" }.compactMap { $0["key"] as? String }
        }
        /// One food of every required group: a balanced tray (`buildTray`).
        var trayOneOfEachGroup: [String] {
            let items = play?["items"] as? [[String: Any]] ?? []
            return trayRequired.compactMap { group in
                items.first { $0["group"] as? String == group }?["key"] as? String
            }
        }
        func item(_ key: String) -> Item? { (warmup + quiz).first { $0.key == key } }
        func statement(of key: String) -> String {
            guard let item = item(key) else { return "" }
            return (item.raw["statement"] as? [String: Any])?["en"] as? String ?? item.prompt
        }
        func explanationCorrect(of key: String) -> String {
            (item(key)?.raw["explanation_correct"] as? [String: Any])?["en"] as? String ?? ""
        }
    }

    private let lessons: [String: Lesson]
    private let places: [String: (topic: String, number: Int)]

    static func load(file: String = #filePath) throws -> Pack {
        let root = try repoRoot(from: file)
        let packDir = root.appendingPathComponent("content/.build/pack/topics")
        var lessons: [String: Lesson] = [:]
        guard let enumerator = FileManager.default.enumerator(at: packDir, includingPropertiesForKeys: nil) else {
            throw NSError(domain: "Pack", code: 5, userInfo: [NSLocalizedDescriptionKey: "cannot read \(packDir.path)"])
        }
        for case let url as URL in enumerator where url.lastPathComponent == "pack.json" {
            let json = try JSONSerialization.jsonObject(with: Data(contentsOf: url)) as? [String: Any] ?? [:]
            for raw in json["lessons"] as? [[String: Any]] ?? [] {
                let lesson = Lesson(raw: raw)
                lessons[lesson.slug] = lesson
            }
        }
        let syllabus = try JSONSerialization.jsonObject(with: Data(contentsOf: root.appendingPathComponent("content/syllabus.json"))) as? [String: Any] ?? [:]
        var places: [String: (topic: String, number: Int)] = [:]
        for group in syllabus["groups"] as? [[String: Any]] ?? [] {
            for topic in group["topics"] as? [[String: Any]] ?? [] {
                for entry in topic["lessons"] as? [[String: Any]] ?? [] {
                    guard let id = (entry["lesson_id"] as? String)?.lowercased() else { continue }
                    places[id] = (topic["key"] as? String ?? "", entry["number"] as? Int ?? 0)
                }
            }
        }
        guard !lessons.isEmpty else {
            throw NSError(domain: "Pack", code: 1, userInfo: [NSLocalizedDescriptionKey: "no pack.json under \(packDir.path): build the pack first"])
        }
        return Pack(lessons: lessons, places: places)
    }

    func lesson(_ slug: String) throws -> Lesson {
        guard let lesson = lessons[slug] else {
            throw NSError(domain: "Pack", code: 2, userInfo: [NSLocalizedDescriptionKey: "no lesson \(slug) in the pack"])
        }
        return lesson
    }

    func topicKey(of lesson: Lesson) throws -> String {
        guard let place = places[lesson.id] else {
            throw NSError(domain: "Pack", code: 3, userInfo: [NSLocalizedDescriptionKey: "lesson \(lesson.slug) is in no topic of syllabus.json"])
        }
        return place.topic
    }

    func number(of lesson: Lesson) throws -> Int {
        guard let place = places[lesson.id] else {
            throw NSError(domain: "Pack", code: 3, userInfo: [NSLocalizedDescriptionKey: "lesson \(lesson.slug) is in no topic of syllabus.json"])
        }
        return place.number
    }

    private static func repoRoot(from file: String) throws -> URL {
        var dir = URL(fileURLWithPath: file).deletingLastPathComponent()
        while dir.path != "/" {
            if FileManager.default.fileExists(atPath: dir.appendingPathComponent("content/syllabus.json").path) { return dir }
            dir.deleteLastPathComponent()
        }
        throw NSError(domain: "Pack", code: 4, userInfo: [NSLocalizedDescriptionKey: "no repo root above \(file)"])
    }
}
