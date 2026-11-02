import XCTest

/// SK-012: lesson 1 played on the simulator, Home → Khởi động → Học → Chơi → Quiz → Thưởng.
/// Answers, tray foods and expected texts come from the bundled fixture and `content/rules.json`
/// (`LessonFixture`), not from the test.
///
/// Set `SK_SCREENSHOT_DIR` (as `TEST_RUNNER_SK_SCREENSHOT_DIR` for xcodebuild) to save the six
/// screens for the canvas comparison (`testScreenshots`).
@MainActor
final class LessonUITests: XCTestCase {
    private var fixture: LessonFixture!

    override func setUp() async throws {
        continueAfterFailure = false
        XCUIDevice.shared.orientation = .portrait
        fixture = try LessonFixture.load()
    }

    // MARK: - Flow helpers

    /// Vietnamese interface, Song ngữ profile; motion off unless asked (every frame settled).
    private func launch(reset: Bool, motion: Bool = false) -> XCUIApplication {
        let app = XCUIApplication()
        // No server in these tests (SK-022): SyncUITests covers it.
        var arguments = ["-AppleLanguages", "(vi)", "-AppleLocale", "vi_VN", "-SKSyncOff", "YES"]
        if reset { arguments += ["-SKResetProfile", "YES"] }
        if !motion { arguments += ["-SKReduceMotion", "YES"] }
        app.launchArguments = arguments
        app.launch()
        return app
    }

    private func element(_ app: XCUIApplication, _ identifier: String) -> XCUIElement {
        app.descendants(matching: .any)[identifier].firstMatch
    }

    private func tap(_ app: XCUIApplication, _ identifier: String, file: StaticString = #filePath, line: UInt = #line) {
        let target = app.buttons[identifier].firstMatch
        if !target.waitForExistence(timeout: 5) {
            // SK-013 (L1): say which screen is showing when a button never comes.
            XCTFail("no button \(identifier) after 5 s; on screen: \(screenNow(app))", file: file, line: line)
        }
        target.tap()
    }

    /// The lesson screen showing now, for failure messages: its anchors and the visible buttons.
    private func screenNow(_ app: XCUIApplication) -> String {
        let anchors = ["lesson.title", "lesson.quiz.counter", "lesson.learn.seen", "lesson.play.message", "lesson.result.title", "lesson.hint", "lesson.reward.title", "home.greeting"]
            .filter { app.descendants(matching: .any)[$0].firstMatch.exists }
        let prompt = app.descendants(matching: .any)["lesson.prompt"].firstMatch
        let buttons = app.buttons.allElementsBoundByIndex.prefix(40).map { "\($0.identifier)\($0.isHittable ? "" : "(not hittable)")" }
        return "anchors \(anchors), prompt '\(prompt.exists ? prompt.label : "-")', buttons \(buttons)"
    }

    private func createProfile(_ app: XCUIApplication) {
        XCTAssertTrue(app.buttons["welcome.mode.bilingual"].waitForExistence(timeout: 15), "Welcome did not open")
        app.buttons["welcome.mode.bilingual"].tap()
        app.buttons["welcome.next"].tap()
        let field = app.textFields["profile.name"]
        XCTAssertTrue(field.waitForExistence(timeout: 5))
        field.tap()
        field.typeText("Minh")
        app.buttons["profile.avatar.ech"].tap()
        app.buttons["profile.grade.3"].tap()
        app.buttons["profile.start"].tap()
        XCTAssertTrue(app.staticTexts["home.greeting"].waitForExistence(timeout: 5), "Home did not open")
    }

    /// Opens lesson 1 from the Home card; `landing` is an element of the screen it should open on.
    private func startLesson(_ app: XCUIApplication, landing: String = "lesson.title") {
        tap(app, "home.start_lesson")
        XCTAssertTrue(element(app, landing).waitForExistence(timeout: 5), "lesson did not open on \(landing)")
    }

    /// Taps the answer `keys` of a question (choices, bank words, or "true"/"false"), then "Kiểm tra" if asked.
    private func answer(_ question: LessonFixture.Question, _ keys: [String], check: Bool, in app: XCUIApplication) {
        for key in keys {
            switch question.format {
            case "true_false": tap(app, "lesson.tf.\(key)")
            case "fill_blank_bank": tap(app, "lesson.word.\(key)")
            default: tap(app, "lesson.option.\(key)")
            }
        }
        if check { tap(app, "lesson.check") }
    }

    private func next(_ app: XCUIApplication) {
        tap(app, "lesson.result.next")
    }

    private func doWarmup(_ app: XCUIApplication) {
        for question in fixture.warmup {
            answer(question, question.right, check: false, in: app)
            next(app)
        }
        XCTAssertTrue(element(app, "lesson.learn.seen").waitForExistence(timeout: 5), "Học did not open")
    }

    private func doLearn(_ app: XCUIApplication) {
        XCTAssertFalse(app.buttons["lesson.learn.next"].isEnabled, "Chơi opens only when every group is seen")
        for group in fixture.exploreGroups.dropFirst() { tap(app, "lesson.group.\(group)") }
        XCTAssertEqual(element(app, "lesson.learn.seen").label, "\(fixture.exploreGroups.count)/\(fixture.exploreGroups.count)")
        tap(app, "lesson.learn.next")
        XCTAssertTrue(element(app, "lesson.play.message").waitForExistence(timeout: 5), "Chơi did not open")
    }

    private func doPlay(_ app: XCUIApplication) {
        for food in fixture.balancedTray { tap(app, "lesson.shelf.\(food)") }
        tap(app, "lesson.play.done")
        XCTAssertTrue(element(app, "lesson.quiz.counter").waitForExistence(timeout: 5), "Quiz did not open")
    }

    private func answerRight(_ question: LessonFixture.Question, in app: XCUIApplication) {
        answer(question, question.right, check: true, in: app)
        XCTAssertEqual(element(app, "lesson.result.title").label, "Chính xác!", question.key)
        if question.format == "fill_blank_bank" {
            expectWordMarks(app, question, [question.right[0]: "Đúng"])
        }
        next(app)
    }

    /// SK-013 (Duy 31/10): the mark of every bank word of a fill-in question, read as VoiceOver
    /// reads it (label, then value: "energy, Đúng"). Words not in `marks` carry no mark.
    private func expectWordMarks(_ app: XCUIApplication, _ question: LessonFixture.Question, _ marks: [String: String],
                                 file: StaticString = #filePath, line: UInt = #line) {
        let words = app.buttons.matching(NSPredicate(format: "identifier BEGINSWITH %@", "lesson.word."))
        let found = words.allElementsBoundByIndex.map { ($0.identifier, $0.label, $0.value as? String ?? "") }
        XCTAssertFalse(found.isEmpty, "\(question.key): no bank words", file: file, line: line)
        print("\(question.key) word marks: " + found.map { "\($0.1), \($0.2.isEmpty ? "-" : $0.2)" }.joined(separator: " | "))
        for (identifier, label, value) in found {
            let key = String(identifier.dropFirst("lesson.word.".count))
            XCTAssertFalse(label.isEmpty, "\(identifier) has a label", file: file, line: line)
            XCTAssertEqual(value, marks[key] ?? "", "\(question.key) \(key) ('\(label)') mark", file: file, line: line)
        }
    }

    private func expectedXP(correct: Int) -> Int {
        correct * fixture.xpPerCorrect + fixture.xpGameComplete + fixture.xpLessonComplete
    }

    private func reward(_ app: XCUIApplication) -> (score: String, stars: String, xp: String) {
        XCTAssertTrue(element(app, "lesson.reward.title").waitForExistence(timeout: 5), "Thưởng did not open")
        return (element(app, "lesson.reward.score").label, element(app, "lesson.reward.stars").label, element(app, "lesson.reward.xp").label)
    }

    // MARK: - Acceptance

    /// Criterion 1: every answer right on the first try, balanced tray → 6/6, ⭐⭐, XP as the engine
    /// (6 × xp_per_correct + xp_game_complete + xp_lesson_complete).
    func testGoldenPathAllRight() throws {
        try playGoldenPath(launch(reset: true))
    }

    /// Criterion 8: with the system Reduce Motion switch on (and no app override), the lesson still
    /// plays through. Skipped unless the simulator has Reduce Motion on
    /// (`xcrun simctl spawn <udid> defaults write com.apple.Accessibility ReduceMotionEnabled -bool YES`).
    func testGoldenPathWithSystemReduceMotion() throws {
        try XCTSkipUnless(UIAccessibility.isReduceMotionEnabled, "system Reduce Motion is off")
        try playGoldenPath(launch(reset: true, motion: true))
    }

    private func playGoldenPath(_ app: XCUIApplication) throws {
        createProfile(app)
        startLesson(app)
        doWarmup(app)
        doLearn(app)
        doPlay(app)
        for question in fixture.quiz { answerRight(question, in: app) }
        let result = reward(app)
        print("golden path reward: score '\(result.score)', stars '\(result.stars)', xp '\(result.xp)'")
        XCTAssertTrue(result.score.hasPrefix("6/6"), result.score)
        XCTAssertEqual(result.stars, "Được 2 trên 3 sao")
        XCTAssertTrue(result.xp.hasPrefix("+\(expectedXP(correct: 6))"), result.xp)
        // Back to the journey.
        tap(app, "lesson.reward.home")
        XCTAssertTrue(app.staticTexts["home.greeting"].waitForExistence(timeout: 5))
    }

    /// Criterion 2: q3 and q5 wrong on both tries → 4/6, ⭐ (threshold 5/6). The hint shows after the
    /// first wrong try, the explanation after the second.
    func testFourOfSixOneStar() throws {
        let app = launch(reset: true)
        createProfile(app)
        startLesson(app)
        doWarmup(app)
        doLearn(app)
        doPlay(app)
        for question in fixture.quiz {
            guard ["q3", "q5"].contains(question.key) else {
                answerRight(question, in: app)
                continue
            }
            answer(question, question.wrongs[0], check: true, in: app)
            let hint = element(app, "lesson.hint")
            XCTAssertTrue(hint.waitForExistence(timeout: 3), "\(question.key): no hint after the first wrong try")
            XCTAssertTrue(hint.label.contains(question.hintVI), "\(question.key) hint: \(hint.label)")
            print("\(question.key) try 1 wrong → hint '\(hint.label)'")
            tap(app, "lesson.retry")
            // Multi choice keeps the picks (canvas): tap only what the second wrong answer adds.
            let second = question.format == "multi_choice"
                ? question.wrongs[1].filter { !question.wrongs[0].contains($0) }
                : question.wrongs[1]
            answer(question, second, check: true, in: app)
            XCTAssertEqual(element(app, "lesson.result.title").label, "Cùng xem lại nhé", question.key)
            let explanation = element(app, "lesson.result.explanation")
            XCTAssertEqual(explanation.label, question.explanationWrongEN, question.key)
            print("\(question.key) try 2 wrong → '\(explanation.label)'")
            next(app)
        }
        let result = reward(app)
        print("4/6 reward: score '\(result.score)', stars '\(result.stars)', xp '\(result.xp)'")
        XCTAssertTrue(result.score.hasPrefix("4/6"), result.score)
        XCTAssertEqual(result.stars, "Được 1 trên 3 sao")
        XCTAssertTrue(result.xp.hasPrefix("+\(expectedXP(correct: 4))"), result.xp)
        XCTAssertTrue(element(app, "lesson.reward.stars").exists)
    }

    /// Criterion 5: stop at quiz question 3 (app closed) → the app opens on question 3; the results
    /// of 1–2 are kept (the attempt still ends 6/6).
    func testCutOffAtQuestion3ResumesThere() throws {
        let app = launch(reset: true)
        createProfile(app)
        startLesson(app)
        doWarmup(app)
        doLearn(app)
        doPlay(app)
        for question in fixture.quiz.prefix(2) { answerRight(question, in: app) }
        XCTAssertEqual(element(app, "lesson.quiz.counter").label, "Câu 3/6")
        app.terminate()

        let again = launch(reset: false)
        let counter = element(again, "lesson.quiz.counter")
        XCTAssertTrue(counter.waitForExistence(timeout: 15), "the app did not reopen the lesson")
        XCTAssertEqual(counter.label, "Câu 3/6")
        print("relaunch → '\(counter.label)'")
        for question in fixture.quiz.dropFirst(2) { answerRight(question, in: again) }
        let result = reward(again)
        XCTAssertTrue(result.score.hasPrefix("6/6"), "q1–q2 kept: \(result.score)")
    }

    /// Leaving with the close button: the app opens on Home next time, and the lesson goes on at the
    /// same question; an answered first try is kept too.
    func testCloseButtonKeepsTheAttempt() throws {
        let app = launch(reset: true)
        createProfile(app)
        startLesson(app)
        doWarmup(app)
        doLearn(app)
        doPlay(app)
        answerRight(fixture.quiz[0], in: app)
        let q2 = fixture.quiz[1]
        answer(q2, q2.wrongs[0], check: true, in: app)
        XCTAssertTrue(element(app, "lesson.hint").waitForExistence(timeout: 3))
        tap(app, "lesson.back")
        XCTAssertTrue(app.staticTexts["home.greeting"].waitForExistence(timeout: 5))
        app.terminate()

        let again = launch(reset: false)
        XCTAssertTrue(again.staticTexts["home.greeting"].waitForExistence(timeout: 15), "a paused lesson waits on Home")
        startLesson(again, landing: "lesson.quiz.counter")
        XCTAssertEqual(element(again, "lesson.quiz.counter").label, "Câu 2/6")
        XCTAssertTrue(element(again, "lesson.hint").exists, "the wrong first try of q2 is kept")
        XCTAssertTrue(again.buttons["lesson.retry"].exists)
    }

    /// Criterion 4 (app part): the seven tray messages, in one sequence of taps. Missing groups follow
    /// the block's `groups` order (Duy 29/10); `balanced` > `full` > `has_limited` > `start` > `missing`.
    func testSevenTrayMessages() throws {
        let app = launch(reset: true)
        createProfile(app)
        startLesson(app)
        doWarmup(app)
        doLearn(app)

        var seen: [String] = []
        func expect(_ key: String, after step: String) {
            let message = element(app, "lesson.play.message")
            XCTAssertTrue(message.waitForExistence(timeout: 3))
            let text = fixture.trayMessagesEN[key] ?? "<no text for \(key)>"
            XCTAssertTrue(message.label.hasPrefix(text), "\(step): expected \(key) '\(text)', got '\(message.label)'")
            print("tray[\(seen.count + 1)] \(step) → \(key): \(message.label)")
            seen.append(key)
        }
        // Foods by group, from the fixture: carb, protein (two), veg, sweet.
        let carb = "tray_rice", bread = "tray_bread", fish = "tray_fish", egg = "tray_egg", greens = "tray_greens", candy = "tray_candy"
        expect("start", after: "empty tray")
        tap(app, "lesson.shelf.\(carb)")
        expect("missing.tray_protein", after: "+ rice")
        tap(app, "lesson.shelf.\(fish)")
        expect("missing.tray_veg", after: "+ braised fish")
        tap(app, "lesson.shelf.\(greens)")
        expect("balanced", after: "+ water spinach")
        XCTAssertTrue(app.buttons["lesson.play.done"].exists, "balanced tray: the quiz button shows")
        tap(app, "lesson.shelf.\(candy)")
        expect("has_limited", after: "+ sweets (tray full, 4/4)")
        tap(app, "lesson.shelf.\(egg)")
        expect("full", after: "+ egg refused (no room)")
        tap(app, "lesson.shelf.\(carb)")
        expect("has_limited", after: "− rice")
        tap(app, "lesson.shelf.\(candy)")
        expect("missing.tray_carb", after: "− sweets")
        XCTAssertEqual(Set(seen).count, 7, "all seven messages: \(seen)")

        // Decision 3, T2: a balanced tray that is full keeps "Great!" when a fifth food is refused.
        tap(app, "lesson.shelf.\(carb)")
        expect("balanced", after: "+ rice")
        tap(app, "lesson.shelf.\(bread)")
        expect("balanced", after: "+ bread (tray full, 4/4)")
        tap(app, "lesson.shelf.\(egg)")
        expect("balanced", after: "+ egg refused, tray balanced")
        XCTAssertFalse(app.buttons["lesson.tray.\(egg)"].exists, "the refused food stays on the shelf")
        XCTAssertTrue(app.buttons["lesson.play.done"].exists)
    }

    // MARK: - Touch targets and accessibility

    /// Every hittable button on the six screens is ≥ 56 × 56 pt and has a label.
    func testEveryButtonIsAtLeast56ptAndLabelled() throws {
        let app = launch(reset: true)
        createProfile(app)
        startLesson(app)
        var checked: [String] = []
        func check(_ screen: String) {
            for button in app.buttons.allElementsBoundByIndex where button.isHittable {
                let frame = button.frame
                XCTAssertGreaterThanOrEqual(frame.width, 55.5, "\(screen): '\(button.label)' is \(frame.width) wide")
                XCTAssertGreaterThanOrEqual(frame.height, 55.5, "\(screen): '\(button.label)' is \(frame.height) tall")
                XCTAssertFalse(button.label.isEmpty, "\(screen): button without label at \(frame)")
            }
            checked.append(screen)
        }
        check("warmup 1")
        let w1 = fixture.warmup[0]
        answer(w1, w1.wrongs[0], check: false, in: app)
        check("warmup 1 after a wrong try")
        answer(w1, w1.right, check: false, in: app)
        check("warmup 1 result")
        next(app)
        check("warmup 2")
        answer(fixture.warmup[1], fixture.warmup[1].right, check: false, in: app)
        next(app)
        check("learn")
        app.swipeUp()
        check("learn (scrolled)")
        app.swipeDown()
        doLearn(app)
        check("play")
        doPlay(app)
        for question in fixture.quiz {
            check("quiz \(question.key)")
            answer(question, question.right, check: true, in: app)
            check("quiz \(question.key) result")
            next(app)
        }
        _ = reward(app)
        check("reward")
        print("touch targets checked: \(checked.joined(separator: ", "))")
    }

    /// `performAccessibilityAudit` on the six screens. Allowed, as SK-008 and SK-011: Dynamic Type
    /// "partially unsupported" (the B7.8 cap), elements cut by the screen edge, and the two findings
    /// checked by hand in `allowed(_:label:)`.
    func testAccessibilityAudit() throws {
        let app = launch(reset: true)
        createProfile(app)
        startLesson(app)
        var problems: [String] = []
        func audit(_ screen: String) throws {
            let started = Date()
            defer { print("audit[\(screen)] took \(String(format: "%.1f", Date().timeIntervalSince(started))) s") }
            let window = app.windows.firstMatch.frame
            for types: XCUIAccessibilityAuditType in [.contrast, .elementDetection, .hitRegion, .sufficientElementDescription, .trait, .textClipped, .dynamicType] {
                try app.performAccessibilityAudit(for: types) { issue in
                    let label = issue.element?.label ?? "-"
                    let line = "audit[\(screen)]: \(issue.auditType.rawValue) \(issue.compactDescription) · "
                        + (issue.element.map { "\($0.elementType.rawValue) '\($0.label)' \($0.frame)" } ?? "-")
                    print(line + " | " + issue.detailedDescription)
                    if issue.auditType == .dynamicType, issue.compactDescription.contains("partially") { return true }
                    if let frame = issue.element?.frame, !window.insetBy(dx: -1, dy: -1).contains(frame) { return true }
                    if let reason = Self.allowed(issue.auditType, label: label) {
                        print("audit[\(screen)]: allowed (\(reason)): '\(label)'")
                        return true
                    }
                    problems.append(line)
                    return true
                }
            }
            settle(app, after: "audit[\(screen)]")
        }
        try audit("warmup")
        doWarmup(app)
        // SK-013 (Duy 31/10): audit Học with the whole "Từ mới" row above the bottom bar.
        guard scrollWordListAboveBottomBar(app) else { return }
        try saveAuditScreenshot("audit-learn")
        try audit("learn")
        app.swipeDown()
        app.swipeDown()
        doLearn(app)
        try audit("play")
        doPlay(app)
        for question in fixture.quiz {
            if question.key == "q5" || question.key == "q6" { try audit("quiz \(question.key)") }
            answer(question, question.right, check: true, in: app)
            next(app)
        }
        _ = reward(app)
        try audit("reward")
        XCTAssertTrue(problems.isEmpty, problems.joined(separator: "\n"))
    }

    /// SK-013 (Duy 31/10): on a phone, when Học opens, the "Từ mới" cards sit under the bottom bar
    /// ("Chạm hết các nhóm…" and "Chơi thôi"). The contrast audit then measured their text against
    /// the bar (iPhone 16 Pro, 31/10). Before auditing Học, drag the page up just enough for every
    /// card to sit wholly above the bar, and check it by frame. If they do not fit, the test fails
    /// with the numbers and Học is not audited. Nothing is added to `allowed(_:label:)`.
    ///
    /// What scrolls off the top is not audited on Học. That is the lesson header (back button,
    /// title, step squares), which the audits of Khởi động and Chơi cover, and possibly the top of
    /// the "I can" card. Elements outside the window are skipped by `audit`.
    private func scrollWordListAboveBottomBar(_ app: XCUIApplication, file: StaticString = #filePath, line: UInt = #line) -> Bool {
        let cards = app.descendants(matching: .any).matching(NSPredicate(format: "identifier BEGINSWITH %@", "lesson.word_list."))
        let hint = app.staticTexts["Chạm hết các nhóm để mở phần chơi."]
        let next = app.buttons["lesson.learn.next"]
        guard cards.firstMatch.waitForExistence(timeout: 5), next.waitForExistence(timeout: 5) else {
            XCTFail("Học: no Từ mới cards or no bottom bar; on screen: \(screenNow(app))", file: file, line: line)
            return false
        }
        let window = app.windows.firstMatch.frame
        // `BottomBar` pads its content by 8pt (`Tokens.Space.s8`) above the hint line.
        let barPadding: CGFloat = 8
        func barTop() -> CGFloat { (hint.exists ? min(hint.frame.minY, next.frame.minY) : next.frame.minY) - barPadding }
        func frames() -> [CGRect] { cards.allElementsBoundByIndex.map(\.frame) }
        func bottom() -> CGFloat { frames().map(\.maxY).max() ?? .infinity }
        func top() -> CGFloat { frames().map(\.minY).min() ?? 0 }
        print("audit[learn] scroll: before, cards \(frames()), bar top \(barTop())")
        var drags = 0
        while bottom() > barTop(), drags < 3 {
            // Drag (no fling) by what is missing, from the left of the group sheet (its picture, not a
            // button; a drag that starts on a button does not tap it anyway).
            let distance = bottom() - barTop() + 16
            let start = app.windows.firstMatch.coordinate(withNormalizedOffset: CGVector(dx: 0.25, dy: 0.62))
            start.press(forDuration: 0.1, thenDragTo: start.withOffset(CGVector(dx: 0, dy: -distance)),
                        withVelocity: .slow, thenHoldForDuration: 0.3)
            drags += 1
        }
        let measured = "cards \(frames()), cards bottom \(bottom()), bar top \(barTop()) "
            + "(hint \(hint.exists ? "\(hint.frame)" : "-"), button \(next.frame)), window \(window), after \(drags) drag(s)"
        print("audit[learn] scroll: " + measured)
        guard bottom() <= barTop(), top() >= window.minY else {
            XCTFail("Học: the Từ mới cards are not wholly between the top of the screen and the bottom bar: " + measured, file: file, line: line)
            return false
        }
        return true
    }

    /// The screen as it is audited: kept in the result bundle, and saved to SK_SCREENSHOT_DIR if set.
    private func saveAuditScreenshot(_ name: String) throws {
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
        guard let directory = ProcessInfo.processInfo.environment["SK_SCREENSHOT_DIR"], !directory.isEmpty else { return }
        let device = (ProcessInfo.processInfo.environment["SIMULATOR_DEVICE_NAME"] ?? "device")
            .lowercased().replacingOccurrences(of: " ", with: "-")
            .replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")
        try screenshot.pngRepresentation
            .write(to: URL(fileURLWithPath: directory).appendingPathComponent("\(device)-\(name).png"))
    }

    /// SK-013 (SK-012 tester L1): the `.dynamicType` audit cycles the text size and puts it back;
    /// the app then lays the screen out again. On a busy machine that takes a while, and a tap sent
    /// meanwhile can go to where a button was a moment ago (the run that failed on iPad Pro 13:
    /// "Tiếp" of Khởi động 1 existed, was tapped, and question 2 never came). So after each audit:
    /// wait until the buttons stop moving (same frames twice, 0.3 s apart), at most 10 s, and log how
    /// long it took. Not a longer timeout: a screen still moving after 10 s is a test failure
    /// (SK-013 tester L10), recorded with the screen's name and what is on it.
    private func settle(_ app: XCUIApplication, after what: String, file: StaticString = #filePath, line: UInt = #line) {
        let started = Date()
        var previous: [CGRect] = []
        while Date().timeIntervalSince(started) < 10 {
            let frames = app.buttons.allElementsBoundByIndex.map(\.frame)
            if !frames.isEmpty, frames == previous {
                print("\(what): screen settled after \(String(format: "%.1f", Date().timeIntervalSince(started))) s")
                return
            }
            previous = frames
            usleep(300_000)
        }
        let message = "\(what): screen still moving after 10 s; on screen: \(screenNow(app))"
        print(message)
        XCTFail(message, file: file, line: line)
    }

    /// Findings checked by hand and reported in SK-012 "Kết quả":
    /// - contrast on a sentence with an empty blank: the audit samples the sunken blank (điệp thẫm)
    ///   together with the text; text on paper is than tre / chữ phụ (≥ 7:1);
    /// - text clipped on "fish": the same finding as the SK-008 gallery (the word shows whole at
    ///   AccessibilityXXXL there).
    private static func allowed(_ type: XCUIAccessibilityAuditType, label: String) -> String? {
        if type == .contrast, label.contains("\u{2007}?\u{2007}") { return "empty blank, sunken background" }
        if type == .textClipped, label == "fish" { return "SK-008 known finding" }
        return nil
    }

    // MARK: - Screenshots

    /// SK-013 designer table, wrong states of a fill-in word: Quiz q2 wrong on the first try (the
    /// word stays in the sentence on giấy lõm, "Gần đúng!" with the hint), then "Thử lại" empties
    /// the blank, and wrong again on the last try ("Cùng xem lại nhé"). Saves screenshots when
    /// SK_SCREENSHOT_DIR is set.
    func testFillBlankWrongTwice() throws {
        let directory = ProcessInfo.processInfo.environment["SK_SCREENSHOT_DIR"] ?? ""
        let device = (ProcessInfo.processInfo.environment["SIMULATOR_DEVICE_NAME"] ?? "device")
            .lowercased().replacingOccurrences(of: " ", with: "-")
            .replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")
        func shot(_ name: String) throws {
            guard !directory.isEmpty else { return }
            sleep(2)
            try XCUIScreen.main.screenshot().pngRepresentation
                .write(to: URL(fileURLWithPath: directory).appendingPathComponent("\(device)-\(name).png"))
        }
        let app = launch(reset: true, motion: true)
        createProfile(app)
        startLesson(app)
        doWarmup(app)
        doLearn(app)
        doPlay(app)
        answerRight(fixture.quiz[0], in: app)
        let q2 = fixture.quiz[1]
        XCTAssertEqual(q2.format, "fill_blank_bank")
        let prompt = element(app, "lesson.prompt")
        XCTAssertTrue(prompt.waitForExistence(timeout: 5))
        XCTAssertTrue(prompt.label.contains("?"), "q2 starts with an empty blank: '\(prompt.label)'")

        answer(q2, q2.wrongs[0], check: true, in: app)
        XCTAssertTrue(element(app, "lesson.hint").waitForExistence(timeout: 3), "q2: no hint after the first wrong try")
        XCTAssertFalse(prompt.label.contains("?"), "q2 try 1: the wrong word stays in the blank: '\(prompt.label)'")
        print("q2 try 1 wrong: prompt '\(prompt.label)'")
        // Only the word put in is marked; the right word is not shown yet.
        expectWordMarks(app, q2, [q2.wrongs[0][0]: "Chưa đúng"])
        try shot("11-quiz-q2-wrong")

        tap(app, "lesson.retry")
        XCTAssertTrue(prompt.label.contains("?"), "q2 Thử lại empties the blank: '\(prompt.label)'")
        expectWordMarks(app, q2, [:])
        answer(q2, q2.wrongs[1], check: true, in: app)
        XCTAssertEqual(element(app, "lesson.result.title").label, "Cùng xem lại nhé")
        print("q2 try 2 wrong: prompt '\(prompt.label)'")
        expectWordMarks(app, q2, [q2.wrongs[1][0]: "Chưa đúng", q2.right[0]: "Đáp án"])
        try shot("11-quiz-q2-wrong-last")
    }

    /// The six screens (and their longest states) as `<device>-<n>-<screen>.png`, motion on.
    func testScreenshots() throws {
        guard let directory = ProcessInfo.processInfo.environment["SK_SCREENSHOT_DIR"], !directory.isEmpty else {
            throw XCTSkip("set SK_SCREENSHOT_DIR (TEST_RUNNER_SK_SCREENSHOT_DIR) to save screenshots")
        }
        let device = (ProcessInfo.processInfo.environment["SIMULATOR_DEVICE_NAME"] ?? "device")
            .lowercased().replacingOccurrences(of: " ", with: "-")
            .replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")
        func shot(_ name: String) throws {
            sleep(2)
            try XCUIScreen.main.screenshot().pngRepresentation
                .write(to: URL(fileURLWithPath: directory).appendingPathComponent("\(device)-\(name).png"))
        }
        let app = launch(reset: true, motion: true)
        createProfile(app)
        startLesson(app)
        try shot("08-warmup")
        let w1 = fixture.warmup[0]
        answer(w1, w1.wrongs[0], check: false, in: app)
        try shot("08-warmup-wrong")
        answer(w1, w1.right, check: false, in: app)
        try shot("08-warmup-right")
        next(app)
        // A choice card of Khởi động showing "Chưa đúng" astride its top edge (SK-013, Duy 31/10).
        let w2 = fixture.warmup[1]
        answer(w2, w2.wrongs[0], check: false, in: app)
        try shot("08-warmup-2-wrong")
        answer(w2, w2.right, check: false, in: app)
        try shot("08-warmup-2-right")
        next(app)
        try shot("09-learn")
        for group in fixture.exploreGroups.dropFirst() { tap(app, "lesson.group.\(group)") }
        try shot("09-learn-all-seen")
        app.swipeUp()
        try shot("09-learn-bottom")
        tap(app, "lesson.learn.next")
        tap(app, "lesson.shelf.tray_rice")
        try shot("10-play")
        tap(app, "lesson.shelf.tray_candy")
        try shot("10-play-sweets")
        tap(app, "lesson.shelf.tray_candy")
        for food in fixture.balancedTray where food != "tray_rice" { tap(app, "lesson.shelf.\(food)") }
        try shot("10-play-balanced")
        tap(app, "lesson.play.done")
        for question in fixture.quiz {
            if question.key == "q5" {
                try shot("11-quiz-q5")
                answer(question, question.wrongs[0], check: true, in: app)
                try shot("11-quiz-q5-wrong")
                tap(app, "lesson.retry")
                for key in question.right where !question.wrongs[0].contains(key) { tap(app, "lesson.option.\(key)") }
                tap(app, "lesson.option.\(question.wrongs[0][0])")
                tap(app, "lesson.check")
                try shot("11-quiz-q5-right-later")
                next(app)
                continue
            }
            if question.key == "q6" {
                try shot("12-quiz-myth")
                answer(question, question.right, check: true, in: app)
                try shot("12-quiz-myth-right")
                next(app)
                continue
            }
            if question.key == "q2" {
                // SK-013 designer table: the word in the blank while choosing, then right.
                answer(question, question.right, check: false, in: app)
                try shot("11-quiz-q2-chosen")
                tap(app, "lesson.check")
                try shot("11-quiz-q2-right")
                next(app)
                continue
            }
            if question.key == "q4" { try shot("11-quiz-q4") }
            answer(question, question.right, check: true, in: app)
            next(app)
        }
        _ = reward(app)
        try shot("13-reward")
        tap(app, "lesson.reward.card")
        try shot("13-reward-card-back")
        app.swipeUp()
        try shot("13-reward-bottom")
    }
}
