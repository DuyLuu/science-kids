import XCTest

/// SK-061 (ios-dev 20/11): the run-through of Explorer #10 "Bầu trời ngày và đêm" on the built
/// pack: the Explorer map (six stages, the last one #9–#10, the sky icon), lesson 3 "Mặt Trời mọc,
/// Mặt Trời lặn" played from Khởi động to Thưởng (tap to zoom and drag on the shelf, the order
/// question), the card in the "Sky cards" set, and the shelf of lesson 2 (owl, bat, firefly).
///
/// A run with screenshots, not part of the normal suite: skipped unless `SK_SHOT_DIR` is set
/// (`TEST_RUNNER_SK_SHOT_DIR=<dir> xcodebuild test … -only-testing:ScienceKidsUITests/SK061SkyRunUITests`).
@MainActor
final class SK061SkyRunUITests: XCTestCase {
    private var pack: Pack!
    private var dir: String!
    private let topicKey = "new-sky-day-and-night"

    override func setUp() async throws {
        guard let dir = ProcessInfo.processInfo.environment["SK_SHOT_DIR"], !dir.isEmpty else {
            throw XCTSkip("SK_SHOT_DIR not set")
        }
        self.dir = dir
        continueAfterFailure = true
        XCUIDevice.shared.orientation = .portrait
        pack = try Pack.load()
    }

    func testSkyTopicRun() throws {
        let app = XCUIApplication()
        app.launchArguments = ["-AppleLanguages", "(vi)", "-AppleLocale", "vi_VN", "-SKSyncOff", "YES",
                               "-SKReduceMotion", "YES", "-SKTestProfile", "YES", "-SKResetProfile", "YES"] + PlayDrag.noHint
        app.launch()

        // Explorer map.
        let chip = app.buttons["home.group.explorer"].firstMatch
        XCTAssertTrue(chip.waitForExistence(timeout: 20), "no Explorer chip; \(screenNow(app))")
        chip.tap()
        shot(app, "01-explorer-map-top")
        let sky = app.buttons["home.topic.\(topicKey)"].firstMatch
        var swipes = 0
        while !(sky.exists && sky.isHittable), swipes < 10 {
            app.swipeUp(velocity: .slow)
            swipes += 1
        }
        XCTAssertTrue(sky.exists, "no sky topic on the Explorer map")
        XCTAssertTrue(element(app, "home.segment.6").exists, "no stage 6")
        XCTAssertFalse(element(app, "home.segment.7").exists, "a stage 7")
        XCTAssertTrue(app.buttons["home.topic.new-mountains-rivers-and-seas"].exists, "#9 not on the map")
        XCTAssertFalse(app.buttons["home.topic.new-water-around-us"].exists, "#10 water still on the map")
        shot(app, "02-explorer-map-last-stage")
        for _ in 0..<3 { app.swipeUp(velocity: .slow) }
        let finish = element(app, "home.journey.finish")
        record("finish flag: \(finish.exists ? finish.label : "missing")")
        record("segment 6: \(element(app, "home.segment.6").label)")
        shot(app, "03-explorer-map-finish")
        for _ in 0..<2 where !sky.isHittable { app.swipeDown(velocity: .slow) }
        sky.tap()

        // Topic screen, lesson 3.
        let lesson3 = app.buttons["topic.lesson.3"].firstMatch
        XCTAssertTrue(lesson3.waitForExistence(timeout: 10), "topic screen; \(screenNow(app))")
        shot(app, "04-topic")
        lesson3.tap()
        let lesson = try pack.lesson("mat-troi-moc-mat-troi-lan")

        // Khởi động.
        for (index, item) in lesson.warmup.enumerated() {
            _ = element(app, "lesson.explorer.bubble").waitForExistence(timeout: 10)
            if index == 0 { shot(app, "05-warmup") }
            answerRight(item, in: app)
            if index == 0 { shot(app, "06-warmup-answered") }
            tapNext(app)
        }
        // Học.
        var turns = 0
        while element(app, "lesson.learn.page").waitForExistence(timeout: turns == 0 ? 10 : 2), turns < 12 {
            if turns < 2 { shot(app, "07-learn-\(turns + 1)") }
            app.buttons["lesson.explorer.next"].firstMatch.tap()
            turns += 1
        }
        record("learn pages: \(turns)")
        // Chơi.
        XCTAssertTrue(element(app, "lesson.play.message").waitForExistence(timeout: 10), "Chơi did not open; \(screenNow(app))")
        shot(app, "08-play-shelf")
        let keys = lesson.trayOneOfEachGroup
        record("tray keys: \(keys), shelf: \(app.buttons.matching(NSPredicate(format: "identifier BEGINSWITH 'lesson.shelf.'")).allElementsBoundByIndex.map(\.identifier))")
        if let first = keys.first {
            tapElement(app, "lesson.shelf.\(first)")
            XCTAssertTrue(element(app, "lesson.play.zoom").waitForExistence(timeout: 3), "a tap opens the big view")
            shot(app, "09-play-zoom")
            tapElement(app, "lesson.play.zoom.close")
            XCTAssertTrue(element(app, "lesson.play.zoom").waitForNonExistence(timeout: 3))
        }
        for key in keys { PlayDrag.pick(app, key) }
        shot(app, "10-play-tray-full")
        let done = app.buttons["lesson.play.done"].firstMatch
        XCTAssertTrue(done.waitForExistence(timeout: 5), "the tray is not balanced")
        done.tap()
        // Quiz.
        record("quiz formats: \(lesson.quiz.map { "\($0.key):\($0.format)" })")
        for (index, item) in lesson.quiz.enumerated() {
            _ = element(app, "lesson.explorer.bubble").waitForExistence(timeout: 10)
            if item.format == "order_sequence" || index == 0 { shot(app, "11-quiz-\(item.key)-\(item.format)") }
            answerRight(item, in: app)
            if item.format == "order_sequence" { shot(app, "12-quiz-\(item.key)-ordered") }
            tapNext(app)
        }
        // Tổng kết.
        if element(app, "lesson.recap.key_point.1").waitForExistence(timeout: 10) {
            shot(app, "13-recap-1")
            app.buttons["lesson.recap.next"].firstMatch.tap()
            _ = element(app, "lesson.recap.objective").waitForExistence(timeout: 5)
            shot(app, "14-recap-2")
            app.buttons["lesson.recap.to_reward"].firstMatch.tap()
        }
        // Thưởng.
        XCTAssertTrue(element(app, "lesson.reward.stars").waitForExistence(timeout: 15), "Thưởng; \(screenNow(app))")
        shot(app, "15-reward")
        let sticker = app.buttons["lesson.reward.sticker"].firstMatch
        if sticker.exists { record("sticker: \(sticker.label)"); sticker.tap() }
        shot(app, "16-reward-stuck")
        let home = app.buttons["lesson.reward.home"].firstMatch
        if home.waitForExistence(timeout: 5) { home.tap() }

        // The card in its set.
        let cards = app.buttons["tab.cards"].firstMatch
        if cards.waitForExistence(timeout: 10) {
            cards.tap()
            let setName = app.staticTexts["Thẻ bầu trời"].firstMatch
            var s = 0
            while !setName.exists, s < 10 { app.swipeUp(velocity: .slow); s += 1 }
            XCTAssertTrue(setName.exists, "no \"Thẻ bầu trời\" set on Thẻ; \(screenNow(app))")
            shot(app, "17-cards-sky-set")
        } else {
            XCTFail("no cards tab; \(screenNow(app))")
        }

        // Lesson 2: the shelf only.
        let lesson2 = try pack.lesson("ngay-va-dem")
        app.terminate()
        let again = XCUIApplication()
        again.launchArguments = ["-AppleLanguages", "(vi)", "-AppleLocale", "vi_VN", "-SKSyncOff", "YES",
                                 "-SKReduceMotion", "YES", "-SKTestProfile", "YES", "-SKOpenLesson", lesson2.id] + PlayDrag.noHint
        again.launch()
        for item in lesson2.warmup {
            _ = element(again, "lesson.explorer.bubble").waitForExistence(timeout: 15)
            answerRight(item, in: again)
            tapNext(again)
        }
        turns = 0
        while element(again, "lesson.learn.page").waitForExistence(timeout: turns == 0 ? 10 : 2), turns < 12 {
            again.buttons["lesson.explorer.next"].firstMatch.tap()
            turns += 1
        }
        XCTAssertTrue(element(again, "lesson.play.message").waitForExistence(timeout: 10), "Chơi of lesson 2; \(screenNow(again))")
        record("lesson 2 shelf: \(again.buttons.matching(NSPredicate(format: "identifier BEGINSWITH 'lesson.shelf.'")).allElementsBoundByIndex.map { "\($0.identifier)=\($0.label)" })")
        shot(again, "18-lesson2-shelf")
        again.swipeUp(velocity: .slow)
        shot(again, "19-lesson2-shelf-scrolled")
    }

    // MARK: - Helpers (as in SK047FlowUITests)

    private func record(_ line: String) {
        let path = URL(fileURLWithPath: dir).appendingPathComponent("notes.txt")
        try? FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true)
        let old = (try? String(contentsOf: path, encoding: .utf8)) ?? ""
        try? (old + line + "\n").write(to: path, atomically: true, encoding: .utf8)
    }

    private func element(_ app: XCUIApplication, _ identifier: String) -> XCUIElement {
        app.descendants(matching: .any)[identifier].firstMatch
    }

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

    private func tapNext(_ app: XCUIApplication) {
        let discoverer = app.buttons["lesson.result.next"].firstMatch
        if discoverer.waitForExistence(timeout: 3) {
            discoverer.tap()
            return
        }
        let explorer = app.buttons["lesson.explorer.next"].firstMatch
        XCTAssertTrue(explorer.waitForExistence(timeout: 8), "no arrow after the question; \(screenNow(app))")
        explorer.tap()
    }

    private func tapElement(_ app: XCUIApplication, _ identifier: String, file: StaticString = #filePath, line: UInt = #line) {
        let target = app.buttons[identifier].firstMatch
        if !target.waitForExistence(timeout: 10) {
            XCTFail("no button \(identifier); \(screenNow(app))", file: file, line: line)
            return
        }
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

    private func screenNow(_ app: XCUIApplication) -> String {
        "buttons \(app.buttons.allElementsBoundByIndex.prefix(30).map(\.identifier))"
    }

    private func shot(_ app: XCUIApplication, _ name: String) {
        let image = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: image)
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
        try? FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true)
        try? image.pngRepresentation.write(to: URL(fileURLWithPath: dir).appendingPathComponent("\(name).png"))
    }
}
