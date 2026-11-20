import XCTest

/// SK-013: the iPad layouts (regular width) of Trang chủ, Học, Chơi, Quiz, the 600pt paper frame of
/// the other screens, rotation in the middle of a quiz. On iPhone the same tests check that the
/// phone layout is unchanged where it matters (frames, touch targets). Sync off (`-SKSyncOff`).
///
/// `SK_SCREENSHOT_DIR` (as `TEST_RUNNER_SK_SCREENSHOT_DIR`) saves `<device>-ipad-<screen>-<orientation>.png`.
@MainActor
final class IPadLayoutUITests: XCTestCase {
    private var fixture: LessonFixture!

    override func setUp() async throws {
        continueAfterFailure = false
        XCUIDevice.shared.orientation = .portrait
        fixture = try LessonFixture.load()
    }

    override func tearDown() async throws {
        XCUIDevice.shared.orientation = .portrait
    }

    private var isPad: Bool { UIDevice.current.userInterfaceIdiom == .pad }

    private func launch() -> XCUIApplication {
        let app = XCUIApplication()
        app.launchArguments = [
            "-AppleLanguages", "(vi)", "-AppleLocale", "vi_VN", "-SKResetProfile", "YES", "-SKReduceMotion", "YES", "-SKSyncOff", "YES",
        ] + PlayDrag.noHint
        app.launch()
        return app
    }

    private func element(_ app: XCUIApplication, _ identifier: String) -> XCUIElement {
        app.descendants(matching: .any)[identifier].firstMatch
    }

    private func tap(_ app: XCUIApplication, _ identifier: String, file: StaticString = #filePath, line: UInt = #line) {
        let target = app.buttons[identifier].firstMatch
        XCTAssertTrue(target.waitForExistence(timeout: 5), "no button \(identifier)", file: file, line: line)
        target.tap()
    }

    private func createProfile(_ app: XCUIApplication, shots: Bool = false) throws {
        XCTAssertTrue(app.buttons["welcome.mode.bilingual"].waitForExistence(timeout: 15), "Welcome did not open")
        if shots { try shot("01-welcome") }
        app.buttons["welcome.mode.bilingual"].tap()
        app.buttons["welcome.next"].tap()
        let field = app.textFields["profile.name"]
        XCTAssertTrue(field.waitForExistence(timeout: 5))
        field.tap()
        field.typeText("Minh")
        app.buttons["profile.avatar.ech"].tap()
        app.buttons["profile.grade.3"].tap()
        if shots { try shot("02-profile") }
        app.buttons["profile.start"].tap()
        XCTAssertTrue(app.staticTexts["home.greeting"].waitForExistence(timeout: 10), "Home did not open")
    }

    /// Right on the first try, then on to the next screen (SK-060: the tap is the answer since
    /// SK-043; multi choice has "Xong").
    private func answer(_ question: LessonFixture.Question, check: Bool, in app: XCUIApplication) {
        A2Lesson.answer(question, question.right, in: app)
        A2Lesson.next(app)
    }

    private func toLearn(_ app: XCUIApplication, shots: Bool = false) throws {
        // SK-035 tester #1: the fixture lesson through its topic ("Học tiếp" opens the journey's
        // first written lesson, another one).
        fixture.open(in: app)
        if shots {
            // Khởi động 1 answered right: the word in the blank and the result sheet.
            let w1 = fixture.warmup[0]
            A2Lesson.answer(w1, w1.right, in: app)
            A2Lesson.waitResult(app, "w1")
            try shot("08-warmup-right")
            A2Lesson.next(app)
            for question in fixture.warmup.dropFirst() { answer(question, check: false, in: app) }
        } else {
            for question in fixture.warmup { answer(question, check: false, in: app) }
        }
        XCTAssertTrue(element(app, "lesson.learn.page").waitForExistence(timeout: 5), "Học did not open")
    }

    private func toPlay(_ app: XCUIApplication) {
        A2Lesson.learn(app)
    }

    private func toQuiz(_ app: XCUIApplication) {
        for food in fixture.balancedTray { PlayDrag.pick(app, food) }
        tap(app, "lesson.play.done")
        A2Lesson.waitQuiz(app)
    }

    private func shot(_ name: String) throws {
        guard let directory = ProcessInfo.processInfo.environment["SK_SCREENSHOT_DIR"], !directory.isEmpty else { return }
        let device = (ProcessInfo.processInfo.environment["SIMULATOR_DEVICE_NAME"] ?? "device")
            .lowercased().replacingOccurrences(of: " ", with: "-")
            .replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")
        let orientation = XCUIDevice.shared.orientation.isLandscape ? "landscape" : "portrait"
        sleep(1)
        try XCUIScreen.main.screenshot().pngRepresentation
            .write(to: URL(fileURLWithPath: directory).appendingPathComponent("\(device)-ipad-\(name)-\(orientation).png"))
    }

    /// Portrait and, on iPad, landscape of the screen showing now.
    private func shotBothWays(_ name: String) throws {
        try shot(name)
        guard isPad else { return }
        XCUIDevice.shared.orientation = .landscapeLeft
        sleep(1)
        try shot(name)
        XCUIDevice.shared.orientation = .portrait
        sleep(1)
    }

    /// The frame of the screen's content: the lesson title (or another anchor) must sit inside the
    /// 600pt paper frame, centred, in regular width; across the phone in compact.
    private func checkPaperFrame(_ app: XCUIApplication, anchor: String, _ screen: String, file: StaticString = #filePath, line: UInt = #line) {
        let window = app.windows.firstMatch.frame
        let target = element(app, anchor)
        XCTAssertTrue(target.waitForExistence(timeout: 5), "\(screen): no \(anchor)", file: file, line: line)
        let frame = target.frame
        if isPad {
            let frameMinX = (window.width - 600) / 2
            XCTAssertGreaterThanOrEqual(frame.minX, frameMinX + 27, "\(screen): \(anchor) at \(frame) is left of the paper frame (window \(window.width))", file: file, line: line)
            XCTAssertLessThanOrEqual(frame.maxX, frameMinX + 600 - 27, "\(screen): \(anchor) at \(frame) is right of the paper frame", file: file, line: line)
        } else {
            XCTAssertGreaterThanOrEqual(frame.minX, 19, "\(screen): \(anchor) at \(frame)", file: file, line: line)
        }
    }

    // MARK: - Acceptance

    /// Trang chủ: the sidebar with the four tabs and the journey in regular width, the bottom strip
    /// in compact; then Học, Chơi, Quiz, Thưởng in the paper frame. Screenshots of each, both ways.
    func testScreensAndScreenshots() throws {
        let app = launch()
        try createProfile(app, shots: true)
        // Home.
        let journeyTab = app.buttons["tab.journey"]
        XCTAssertTrue(journeyTab.waitForExistence(timeout: 5))
        let window = app.windows.firstMatch.frame
        if isPad {
            XCTAssertLessThan(journeyTab.frame.minY, window.height / 2, "regular: the tabs are on the sidebar, at the top")
            XCTAssertLessThan(journeyTab.frame.maxX, 341, "regular: in the 340pt sidebar")
            XCTAssertGreaterThan(element(app, "home.greeting").frame.minX, 340, "regular: the greeting in the content column")
            // SK-034 spec 11: the map in the content column, the stages on the sidebar.
            XCTAssertGreaterThan(app.buttons["home.topic.healthy-eating"].frame.minX, 340, "regular: the journey map in the content column")
            XCTAssertLessThan(app.buttons["home.sidebar.segment.1"].frame.maxX, 341, "regular: the stages on the sidebar")
        } else {
            XCTAssertGreaterThan(journeyTab.frame.minY, window.height / 2, "compact: the bottom strip")
        }
        XCTAssertGreaterThanOrEqual(app.buttons["home.streak"].frame.height, 55.5, "chips raised to 56")
        try shotBothWays("04-home")
        // SK-035: the Thẻ tab stays in the content column.
        tap(app, "tab.cards")
        XCTAssertTrue(element(app, "cards.title").waitForExistence(timeout: 5))
        if isPad { XCTAssertGreaterThan(element(app, "cards.title").frame.minX, 340) }
        tap(app, "tab.journey")
        // Chủ đề: the phone layout in the paper frame.
        tap(app, "home.topic.healthy-eating")
        checkPaperFrame(app, anchor: "topic.title", "Chủ đề")
        try shot("05-topic")
        tap(app, "header.back")
        XCTAssertTrue(app.staticTexts["home.greeting"].waitForExistence(timeout: 5))

        try toLearn(app, shots: true)
        checkPaperFrame(app, anchor: "lesson.learn.sentence", "Học")
        try shotBothWays("09-learn")
        // SK-043: "Từ mới" is the last page of the picture book.
        let words = app.descendants(matching: .any).matching(NSPredicate(format: "identifier BEGINSWITH %@", "lesson.word_list."))
        for _ in 0..<fixture.exploreGroups.count where !words.firstMatch.exists {
            tap(app, "lesson.explorer.next")
            _ = words.firstMatch.waitForExistence(timeout: 2)
        }
        XCTAssertTrue(words.firstMatch.exists, "no Từ mới page")
        for word in words.allElementsBoundByIndex {
            XCTAssertGreaterThanOrEqual(word.frame.height, 55.5, "Từ mới \(word.identifier) raised to 56")
        }
        try shotBothWays("09-learn-words")
        toPlay(app)
        // SK-059: picked by a drag; a tap on the tray takes it off.
        PlayDrag.pick(app, "tray_rice")
        checkPaperFrame(app, anchor: "lesson.play.message", "Chơi")
        // SK-059: the shelf cell is 96–132 on a phone (`PlayShelf.compactCell…`), bigger on iPad.
        let cell = app.buttons["lesson.shelf.tray_bread"].frame
        if isPad {
            XCTAssertGreaterThanOrEqual(cell.height, 124, "shelf cell \(cell)")
        } else {
            XCTAssertTrue((95...133).contains(cell.height), "shelf cell \(cell)")
        }
        try shotBothWays("10-play")
        PlayDrag.unpick(app, "tray_rice")
        toQuiz(app)
        checkPaperFrame(app, anchor: "lesson.prompt", "Quiz")
        // A2 `q1-ask`: three picture cards, 136 high one under the other (iPad: one row, 200).
        let option = app.buttons.matching(NSPredicate(format: "identifier BEGINSWITH %@", "lesson.choice.")).firstMatch.frame
        XCTAssertEqual(option.height, isPad ? 200 : 136, accuracy: 1, "quiz cell \(option)")
        try shotBothWays("11-quiz")
        // The result sheet and its button line up with the frame.
        answer(fixture.quiz[0], check: true, in: app)
        let next = fixture.quiz[1]
        A2Lesson.answer(next, next.right, in: app)
        A2Lesson.waitResult(app, next.key)
        let button = app.buttons["lesson.result.next"].frame
        if isPad {
            XCTAssertEqual(button.width, 544, accuracy: 2, "result button as wide as the frame content: \(button)")
            XCTAssertEqual(button.midX, window.midX, accuracy: 2, "centred")
        }
        try shot("11-quiz-result")
        tap(app, "lesson.result.next")
        for question in fixture.quiz.dropFirst(2) { answer(question, check: true, in: app) }
        XCTAssertTrue(element(app, "lesson.recap.key_point.1").waitForExistence(timeout: 10), "Tổng kết did not open")
        checkPaperFrame(app, anchor: "lesson.recap.key_point.1", "Tổng kết")
        try shotBothWays("12-recap")
        A2Lesson.throughRecap(app)
        checkPaperFrame(app, anchor: "lesson.reward.score", "Thưởng")
        try shotBothWays("13-reward")
    }

    /// Ticket: at quiz question 5 with answers picked, turn the iPad from portrait to landscape and
    /// back: same question, the picks are still there.
    func testRotationKeepsTheQuizState() throws {
        try XCTSkipUnless(isPad, "iPhone is portrait only")
        let app = launch()
        try createProfile(app)
        try toLearn(app)
        toPlay(app)
        toQuiz(app)
        for question in fixture.quiz.prefix(4) { answer(question, check: true, in: app) }
        A2Lesson.waitQuiz(app)
        let counter = element(app, "lesson.progress")
        XCTAssertEqual(counter.label, "Câu 5 trên 6")
        let q5 = fixture.quiz[4]
        XCTAssertEqual(q5.format, "multi_choice")
        let picks = Array(q5.right.prefix(2))
        for key in picks { tap(app, "lesson.choice.\(key)") }
        for key in picks { XCTAssertTrue(app.buttons["lesson.choice.\(key)"].isSelected, "\(key) picked") }

        for orientation in [UIDeviceOrientation.landscapeLeft, .portrait, .landscapeRight, .portrait] {
            XCUIDevice.shared.orientation = orientation
            sleep(1)
            XCTAssertEqual(counter.label, "Câu 5 trên 6", "after turning to \(orientation.rawValue)")
            for key in picks {
                XCTAssertTrue(app.buttons["lesson.choice.\(key)"].isSelected, "\(key) still picked after turning to \(orientation.rawValue)")
            }
            let others = q5.right.dropFirst(2) + q5.wrongs[0]
            for key in others { XCTAssertFalse(app.buttons["lesson.choice.\(key)"].isSelected, "\(key) not picked") }
            checkPaperFrame(app, anchor: "lesson.prompt", "Quiz \(orientation.rawValue)")
        }
        print("rotation: 'Câu 5 trên 6' and picks \(picks) kept through landscape left, portrait, landscape right, portrait")
    }

    /// Every button ≥ 56 × 56 on Trang chủ in both orientations (sidebar rows, chips, journey).
    func testHomeTouchTargetsBothWays() throws {
        let app = launch()
        try createProfile(app)
        for orientation in isPad ? [UIDeviceOrientation.portrait, .landscapeLeft] : [.portrait] {
            XCUIDevice.shared.orientation = orientation
            sleep(1)
            var count = 0
            for button in app.buttons.allElementsBoundByIndex where button.isHittable {
                XCTAssertGreaterThanOrEqual(button.frame.width, 55.5, "'\(button.label)' \(button.frame)")
                XCTAssertGreaterThanOrEqual(button.frame.height, 55.5, "'\(button.label)' \(button.frame)")
                XCTAssertFalse(button.label.isEmpty)
                count += 1
            }
            print("home touch targets (\(orientation.isLandscape ? "landscape" : "portrait")): \(count) buttons ≥ 56pt")
        }
    }
}
