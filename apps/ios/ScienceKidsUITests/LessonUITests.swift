import XCTest

/// SK-012: lesson 1 played on the simulator, Home → Chủ đề → Khởi động → Học → Chơi → Quiz → Thưởng.
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
        app.launchArguments = arguments + PlayDrag.noHint
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
    private func screenNow(_ app: XCUIApplication) -> String { A2Lesson.screenNow(app) }

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

    /// Opens the fixture lesson through its topic (SK-035 tester #1: the Home card opens the
    /// journey's first written lesson, another one); `landing` is an element of the screen it
    /// should open on (SK-060: the first Khởi động question, no title screen since SK-043).
    private func startLesson(_ app: XCUIApplication, landing: String = "lesson.progress", file: StaticString = #filePath, line: UInt = #line) {
        fixture.open(in: app, landing: landing, file: file, line: line)
    }

    /// Taps the answer `keys` of a question (choices, bank words, or "true"/"false"). SK-060: the
    /// tap is the answer since SK-043; only multi choice has "Xong" (`lesson.check`), tapped when
    /// `check` is true.
    private func answer(_ question: LessonFixture.Question, _ keys: [String], check: Bool, in app: XCUIApplication) {
        A2Lesson.answer(question, keys, check: check, in: app)
    }

    private func next(_ app: XCUIApplication) {
        A2Lesson.next(app)
    }

    private func doWarmup(_ app: XCUIApplication) {
        for question in fixture.warmup {
            answer(question, question.right, check: true, in: app)
            next(app)
        }
        XCTAssertTrue(element(app, "lesson.learn.page").waitForExistence(timeout: 5), "Học did not open")
    }

    /// Học (SK-043): a picture book, one page per group then "Từ mới"; Chơi comes after the last page.
    private func doLearn(_ app: XCUIApplication) {
        XCTAssertEqual(element(app, "lesson.learn.page").label, "Trang 1 trên \(fixture.exploreGroups.count + 1)")
        A2Lesson.learn(app)
    }

    private func doPlay(_ app: XCUIApplication) {
        for food in fixture.balancedTray { PlayDrag.pick(app, food) }
        tap(app, "lesson.play.done")
        A2Lesson.waitQuiz(app)
    }

    /// Right on the first try: the result sheet with the ĐÚNG seal and the question's XP.
    private func answerRight(_ question: LessonFixture.Question, in app: XCUIApplication) {
        answer(question, question.right, check: true, in: app)
        A2Lesson.waitResult(app, question.key)
        XCTAssertTrue(element(app, "lesson.result.xp").exists, "\(question.key): right on the first try earns XP")
        if question.format == "fill_blank_bank" {
            expectWordMarks(app, question, [question.right[0]: "Đúng"])
        }
        next(app)
    }

    /// SK-013 (Duy 31/10): the mark of every bank word of a fill-in question, read as VoiceOver
    /// reads it (label, then value: "energy, Đúng"). Words not in `marks` carry no mark.
    private func expectWordMarks(_ app: XCUIApplication, _ question: LessonFixture.Question, _ marks: [String: String],
                                 file: StaticString = #filePath, line: UInt = #line) {
        let words = app.buttons.matching(NSPredicate(format: "identifier BEGINSWITH %@", "lesson.bank."))
        let found = words.allElementsBoundByIndex.map { ($0.identifier, $0.label, $0.value as? String ?? "") }
        XCTAssertFalse(found.isEmpty, "\(question.key): no bank words", file: file, line: line)
        print("\(question.key) word marks: " + found.map { "\($0.1), \($0.2.isEmpty ? "-" : $0.2)" }.joined(separator: " | "))
        for (identifier, label, value) in found {
            let key = String(identifier.dropFirst("lesson.bank.".count))
            XCTAssertFalse(label.isEmpty, "\(identifier) has a label", file: file, line: line)
            XCTAssertEqual(value, marks[key] ?? "", "\(question.key) \(key) ('\(label)') mark", file: file, line: line)
        }
    }

    private func expectedXP(correct: Int) -> Int {
        correct * fixture.xpPerCorrect + fixture.xpGameComplete + fixture.xpLessonComplete
    }

    /// SK-047: Tổng kết (two pages) comes between the last question and Thưởng.
    private func reward(_ app: XCUIApplication) -> (score: String, stars: String, xp: String) {
        A2Lesson.throughRecap(app)
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
        XCTAssertTrue(result.score.hasPrefix("Đúng 6 trên 6"), result.score)
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
            XCTAssertTrue(hint.waitForExistence(timeout: 8), "\(question.key): no hint after the first wrong try")
            // A2 point 4: the slip prints the option's feedback, or the hint without one (EN in Song ngữ).
            XCTAssertTrue(hint.label.contains(question.hintEN), "\(question.key) hint: \(hint.label)")
            print("\(question.key) try 1 wrong → hint '\(hint.label)'")
            // No "Thử lại" since SK-043: answer again. Multi choice keeps the right picks and a
            // tried card cannot be tapped again: tap only what the second wrong answer adds.
            let second = question.format == "multi_choice"
                ? question.wrongs[1].filter { !question.wrongs[0].contains($0) }
                : question.wrongs[1]
            answer(question, second, check: true, in: app)
            A2Lesson.waitResult(app, question.key)
            XCTAssertFalse(element(app, "lesson.result.xp").exists, "\(question.key): out of tries, no XP")
            let explanation = element(app, "lesson.result.explanation")
            XCTAssertTrue(explanation.label.contains(question.explanationWrongEN), "\(question.key): '\(explanation.label)'")
            print("\(question.key) try 2 wrong → '\(explanation.label)'")
            next(app)
        }
        let result = reward(app)
        print("4/6 reward: score '\(result.score)', stars '\(result.stars)', xp '\(result.xp)'")
        XCTAssertTrue(result.score.hasPrefix("Đúng 4 trên 6"), result.score)
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
        A2Lesson.waitQuiz(app)
        XCTAssertEqual(A2Lesson.quizCounter(app), "Câu 3 trên 6")
        app.terminate()

        let again = launch(reset: false)
        let counter = element(again, "lesson.progress")
        XCTAssertTrue(counter.waitForExistence(timeout: 15), "the app did not reopen the lesson")
        XCTAssertEqual(counter.label, "Câu 3 trên 6")
        print("relaunch → '\(counter.label)'")
        for question in fixture.quiz.dropFirst(2) { answerRight(question, in: again) }
        let result = reward(again)
        XCTAssertTrue(result.score.hasPrefix("Đúng 6 trên 6"), "q1–q2 kept: \(result.score)")
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
        // Back where it was opened from: the topic, then Home.
        XCTAssertTrue(app.staticTexts["topic.title"].waitForExistence(timeout: 5))
        tap(app, "header.back")
        XCTAssertTrue(app.staticTexts["home.greeting"].waitForExistence(timeout: 5))
        app.terminate()

        let again = launch(reset: false)
        XCTAssertTrue(again.staticTexts["home.greeting"].waitForExistence(timeout: 15), "a paused lesson waits on Home")
        startLesson(again, landing: "lesson.prompt")
        XCTAssertEqual(A2Lesson.quizCounter(again), "Câu 2 trên 6")
        XCTAssertTrue(element(again, "lesson.hint").exists, "the wrong first try of q2 is kept")
        // The tried word is peeled and cannot be tapped again; the others still can.
        XCTAssertEqual(again.buttons["lesson.bank.\(q2.wrongs[0][0])"].value as? String, "Chưa đúng")
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
        expect("prompt", after: "empty tray (A2 prints the prompt)")
        // SK-059: a drag onto the tray picks; a tap on the tray takes off.
        PlayDrag.pick(app, carb)
        expect("missing.tray_protein", after: "+ rice")
        PlayDrag.pick(app, fish)
        expect("missing.tray_veg", after: "+ braised fish")
        PlayDrag.pick(app, greens)
        expect("balanced", after: "+ water spinach")
        XCTAssertTrue(app.buttons["lesson.play.done"].exists, "balanced tray: the quiz button shows")
        PlayDrag.pick(app, candy)
        expect("has_limited", after: "+ sweets (tray full, 4/4)")
        PlayDrag.pick(app, egg, expectOnTray: false)
        expect("full", after: "+ egg refused (no room)")
        XCTAssertFalse(app.buttons["lesson.tray.\(egg)"].exists, "a full tray does not take the egg")
        PlayDrag.unpick(app, carb)
        expect("has_limited", after: "− rice")
        PlayDrag.unpick(app, candy)
        expect("missing.tray_carb", after: "− sweets")
        XCTAssertEqual(Set(seen).count, 7, "all seven messages: \(seen)")

        // Decision 3, T2: a balanced tray that is full keeps "Great!" when a fifth food is refused.
        PlayDrag.pick(app, carb)
        expect("balanced", after: "+ rice")
        PlayDrag.pick(app, bread)
        expect("balanced", after: "+ bread (tray full, 4/4)")
        PlayDrag.pick(app, egg, expectOnTray: false)
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
        XCTAssertTrue(element(app, "lesson.hint").waitForExistence(timeout: 5), "w1: no slip after a wrong try")
        check("warmup 1 after a wrong try")
        answer(w1, w1.right, check: false, in: app)
        A2Lesson.waitResult(app, "w1")
        check("warmup 1 result")
        next(app)
        check("warmup 2")
        answer(fixture.warmup[1], fixture.warmup[1].right, check: false, in: app)
        A2Lesson.waitResult(app, "w2")
        next(app)
        XCTAssertTrue(element(app, "lesson.learn.page").waitForExistence(timeout: 5), "Học did not open")
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
            A2Lesson.waitResult(app, question.key)
            check("quiz \(question.key) result")
            next(app)
        }
        XCTAssertTrue(element(app, "lesson.recap.key_point.1").waitForExistence(timeout: 10), "Tổng kết did not open")
        check("recap 1")
        tap(app, "lesson.recap.next")
        XCTAssertTrue(element(app, "lesson.recap.objective").waitForExistence(timeout: 5))
        check("recap 2")
        tap(app, "lesson.recap.to_reward")
        XCTAssertTrue(element(app, "lesson.reward.title").waitForExistence(timeout: 10), "Thưởng did not open")
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
                    if let reason = Self.allowed(issue.auditType, label: label, identifier: issue.element?.identifier ?? "", screen: screen,
                                                    groupLabels: self.fixture.trayGroupLabels) {
                        print("audit[\(screen)]: allowed (\(reason)): '\(label)'")
                        return true
                    }
                    problems.append(line)
                    // SK-060 (lỗi 2): a contrast issue left keeps a picture of the element and of
                    // the screen, so the colour the audit measured can be seen (designer 20/11).
                    if issue.auditType == .contrast, let element = issue.element {
                        self.saveContrastShot(element, screen: screen, label: label)
                    }
                    return true
                }
            }
            settle(app, after: "audit[\(screen)]")
        }
        try audit("warmup")
        doWarmup(app)
        // SK-060: Học is a picture book since SK-043; audit its first page and the "Từ mới" page
        // (the last), whose cards sit above the bottom bar on their own page.
        try saveAuditScreenshot("audit-learn")
        try audit("learn")
        let words = app.descendants(matching: .any).matching(NSPredicate(format: "identifier BEGINSWITH %@", "lesson.word_list."))
        for _ in 0..<fixture.exploreGroups.count where !words.firstMatch.exists {
            tap(app, "lesson.explorer.next")
            _ = words.firstMatch.waitForExistence(timeout: 2)
        }
        XCTAssertTrue(words.firstMatch.exists, "no Từ mới page; on screen: \(screenNow(app))")
        try saveAuditScreenshot("audit-learn-words")
        try audit("learn words")
        A2Lesson.learn(app)
        try audit("play")
        doPlay(app)
        for question in fixture.quiz {
            if question.key == "q5" || question.key == "q6" { try audit("quiz \(question.key)") }
            answer(question, question.right, check: true, in: app)
            A2Lesson.waitResult(app, question.key)
            next(app)
        }
        XCTAssertTrue(element(app, "lesson.recap.key_point.1").waitForExistence(timeout: 10), "Tổng kết did not open")
        try audit("recap")
        _ = reward(app)
        try audit("reward")
        XCTAssertTrue(problems.isEmpty, problems.joined(separator: "\n"))
    }

    /// SK-060 (lỗi 2): the element the contrast audit complains about, and the whole screen, kept in
    /// the result bundle and written to `SK_CONTRAST_SHOT_DIR` (as `TEST_RUNNER_SK_CONTRAST_SHOT_DIR`
    /// for xcodebuild) when it is set. Its own variable, so asking for these pictures does not turn
    /// the skipped screenshot tests on.
    private func saveContrastShot(_ element: XCUIElement, screen: String, label: String) {
        let name = "contrast-\(screen)-\(label)".replacingOccurrences(of: " ", with: "-")
            .replacingOccurrences(of: "/", with: "-")
        let shots = [(name, element.screenshot()), ("\(name)-screen", XCUIScreen.main.screenshot())]
        for (shotName, screenshot) in shots {
            let attachment = XCTAttachment(screenshot: screenshot)
            attachment.name = shotName
            attachment.lifetime = .keepAlways
            add(attachment)
            guard let directory = ProcessInfo.processInfo.environment["SK_CONTRAST_SHOT_DIR"], !directory.isEmpty else { continue }
            try? screenshot.pngRepresentation
                .write(to: URL(fileURLWithPath: directory).appendingPathComponent("\(shotName).png"))
        }
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
    /// - SK-060 (phiên chính 20/11, cách b): contrast on Chơi's "VI" button (`listen.vi.*`): its
    ///   touch area (56 × 56) is larger than the paper chip (56 × 28), so the audit compares the
    ///   chip's paper with the điệp under it; the letters, chàm on giấy, are 8.39:1;
    /// - SK-060 (cách b): contrast on the Chơi group chip "Carbohydrates" (`lesson.meter.*`): the
    ///   audit measures the vàng hoè dot on giấy (2.02:1), the pair SK-011 allows on Home; the
    ///   name is than tre on giấy (15.89:1).
    ///   The audit reports these as the text inside the button (type 48, label "VI" /
    ///   "Carbohydrates", no identifier), so each is matched on Chơi by its identifier when there is
    ///   one, else by that exact text.
    /// - SK-060 (phiên chính 20/11, cách b, B7.8 "Dynamic Type có giới hạn trên để không vỡ bố cục
    ///   giấy"): Dynamic Type "unsupported" on a Chơi group chip (`lesson.meter.*`, or with no id
    ///   one of the lesson's tray group names): a two-line name already fills its chip, so
    ///   `WordFit` keeps it at the same drawn size when the text grows.
    private static func allowed(
        _ type: XCUIAccessibilityAuditType, label: String, identifier: String, screen: String, groupLabels: Set<String>
    ) -> String? {
        if type == .contrast, label.contains("\u{2007}?\u{2007}") { return "empty blank, sunken background" }
        if type == .textClipped, label == "fish" { return "SK-008 known finding" }
        if type == .dynamicType, screen == "play",
           identifier.hasPrefix("lesson.meter.") || (identifier.isEmpty && groupLabels.contains(label)) {
            return "SK-060: group chip, Dynamic Type capped (B7.8)"
        }
        guard type == .contrast, screen == "play" else { return nil }
        if identifier.hasPrefix("listen.vi.") || (identifier.isEmpty && label == "VI") {
            return "SK-060: VI touch area larger than its paper chip"
        }
        if (identifier.hasPrefix("lesson.meter.") || identifier.isEmpty) && label == "Carbohydrates" {
            return "SK-060: vàng hoè dot on giấy, as SK-011"
        }
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
        XCTAssertTrue(element(app, "lesson.hint").waitForExistence(timeout: 5), "q2: no hint after the first wrong try")
        // SK-043 (A2): the wrong word peels on the bank and the blank empties for the next try
        // (no "Thử lại" button); the right word is not shown yet.
        XCTAssertTrue(prompt.label.contains("?"), "q2 try 1: the blank empties again: '\(prompt.label)'")
        print("q2 try 1 wrong: prompt '\(prompt.label)'")
        expectWordMarks(app, q2, [q2.wrongs[0][0]: "Chưa đúng"])
        try shot("11-quiz-q2-wrong")

        answer(q2, q2.wrongs[1], check: true, in: app)
        A2Lesson.waitResult(app, "q2 try 2")
        XCTAssertTrue(element(app, "lesson.result.explanation").label.contains(q2.explanationWrongEN), element(app, "lesson.result.explanation").label)
        print("q2 try 2 wrong: prompt '\(prompt.label)'")
        expectWordMarks(app, q2, [q2.wrongs[0][0]: "Chưa đúng", q2.wrongs[1][0]: "Chưa đúng", q2.right[0]: "Đáp án"])
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
        A2Lesson.learn(app)
        PlayDrag.pick(app, "tray_rice")
        try shot("10-play")
        PlayDrag.pick(app, "tray_candy")
        try shot("10-play-sweets")
        PlayDrag.unpick(app, "tray_candy")
        for food in fixture.balancedTray where food != "tray_rice" { PlayDrag.pick(app, food) }
        try shot("10-play-balanced")
        tap(app, "lesson.play.done")
        for question in fixture.quiz {
            if question.key == "q5" {
                try shot("11-quiz-q5")
                answer(question, question.wrongs[0], check: true, in: app)
                try shot("11-quiz-q5-wrong")
                for key in question.right where !question.wrongs[0].contains(key) { tap(app, "lesson.choice.\(key)") }
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
