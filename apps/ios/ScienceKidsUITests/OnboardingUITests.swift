import XCTest

/// SK-011: Welcome → Profile → Home → Topic on the simulator, as the ticket's acceptance list:
/// - fresh start (`-SKResetProfile YES`, same as a new install) opens on Welcome;
/// - Tiếng Anh trước → voice defaults to Chỉ tiếng Anh; Song ngữ → Cả hai;
/// - "Minh", frog, Lớp 3 → Home says "Chào Minh!"; after a relaunch Home opens directly;
/// - Topic: lesson 1 opens the lesson route, locked lessons are not buttons;
/// - every button ≥ 56 pt with a label; accessibility audit per screen; English interface.
///
/// Set `SK_SCREENSHOT_DIR` (as `TEST_RUNNER_SK_SCREENSHOT_DIR` for xcodebuild) to save the
/// screens for the canvas comparison (`testScreenshots`).
@MainActor
final class OnboardingUITests: XCTestCase {
    override func setUp() async throws {
        continueAfterFailure = false
        XCUIDevice.shared.orientation = .portrait
    }

    // MARK: - Helpers

    /// Vietnamese interface by default; motion off so every frame is settled.
    private func launch(reset: Bool, language: String = "vi", motion: Bool = false) -> XCUIApplication {
        let app = XCUIApplication()
        // No server in these tests (SK-022): SyncUITests covers it.
        var arguments = ["-AppleLanguages", "(\(language))", "-AppleLocale", language == "vi" ? "vi_VN" : "en_US", "-SKSyncOff", "YES"]
        if reset { arguments += ["-SKResetProfile", "YES"] }
        if !motion { arguments += ["-SKReduceMotion", "YES"] }
        app.launchArguments = arguments
        app.launch()
        return app
    }

    private func element(_ app: XCUIApplication, _ identifier: String) -> XCUIElement {
        app.descendants(matching: .any)[identifier].firstMatch
    }

    /// Welcome → Profile with `mode`, then fills name, frog, grade; returns on the profile screen.
    private func fillProfile(_ app: XCUIApplication, mode: String, name: String = "Minh", grade: Int = 3) {
        XCTAssertTrue(app.buttons["welcome.mode.\(mode)"].waitForExistence(timeout: 15), "Welcome did not open")
        app.buttons["welcome.mode.\(mode)"].tap()
        XCTAssertTrue(app.buttons["welcome.mode.\(mode)"].isSelected, "mode \(mode) not chosen")
        app.buttons["welcome.next"].tap()
        let field = app.textFields["profile.name"]
        XCTAssertTrue(field.waitForExistence(timeout: 5), "Profile did not open")
        field.tap()
        field.typeText(name)
        app.buttons["profile.avatar.ech"].tap()
        app.buttons["profile.grade.\(grade)"].tap()
    }

    private func createProfile(_ app: XCUIApplication, mode: String) {
        fillProfile(app, mode: mode)
        app.buttons["profile.start"].tap()
        XCTAssertTrue(app.staticTexts["home.greeting"].waitForExistence(timeout: 5), "Home did not open")
    }

    private func openTopic(_ app: XCUIApplication) {
        app.buttons["home.topic.an-uong-lanh-manh"].tap()
        XCTAssertTrue(app.staticTexts["topic.title"].waitForExistence(timeout: 5), "Topic did not open")
    }

    // MARK: - Acceptance

    /// Criteria 1 and 2: fresh start → Welcome; Tiếng Anh trước → Chỉ tiếng Anh; Minh, frog,
    /// Lớp 3, voice kept → "Chào Minh!"; relaunch → Home directly with the same name.
    func testEnglishFirstFlowAndRelaunch() throws {
        let app = launch(reset: true)
        XCTAssertTrue(app.buttons["welcome.mode.bilingual"].waitForExistence(timeout: 15), "fresh start shows Welcome")
        XCTAssertTrue(app.buttons["welcome.mode.bilingual"].isSelected, "Song ngữ is the default")
        fillProfile(app, mode: "en_first")
        XCTAssertTrue(app.buttons["profile.voice.en"].isSelected, "Tiếng Anh trước → Chỉ tiếng Anh")
        XCTAssertFalse(app.buttons["profile.voice.both"].isSelected)
        XCTAssertTrue(app.buttons["profile.avatar.ech"].isSelected)
        XCTAssertTrue(app.buttons["profile.grade.3"].isSelected)
        XCTAssertTrue(element(app, "profile.world").label.contains("Discoverer"))
        app.buttons["profile.start"].tap()
        let greeting = app.staticTexts["home.greeting"]
        XCTAssertTrue(greeting.waitForExistence(timeout: 5))
        XCTAssertEqual(greeting.label, "Chào Minh!")

        app.terminate()
        let again = launch(reset: false)
        XCTAssertTrue(again.staticTexts["home.greeting"].waitForExistence(timeout: 15), "relaunch opens Home")
        XCTAssertEqual(again.staticTexts["home.greeting"].label, "Chào Minh!")
        XCTAssertFalse(again.buttons["welcome.next"].exists, "no Welcome after a relaunch")
        // en_first: names in English on Home.
        XCTAssertTrue(again.buttons["home.topic.an-uong-lanh-manh"].label.contains("Healthy eating"))
    }

    /// Criterion 3: Song ngữ → Cả hai. Changing the mode back and forth follows it until the
    /// parent picks a voice.
    func testBilingualDefaultsToBoth() throws {
        let app = launch(reset: true)
        fillProfile(app, mode: "bilingual")
        XCTAssertTrue(app.buttons["profile.voice.both"].isSelected, "Song ngữ → Cả hai")
        app.buttons["header.back"].tap()
        app.buttons["welcome.mode.en_first"].tap()
        app.buttons["welcome.next"].tap()
        XCTAssertTrue(app.buttons["profile.voice.en"].waitForExistence(timeout: 5))
        XCTAssertTrue(app.buttons["profile.voice.en"].isSelected, "the suggestion follows the mode")
        app.buttons["profile.voice.vi"].tap()
        app.buttons["header.back"].tap()
        app.buttons["welcome.mode.bilingual"].tap()
        app.buttons["welcome.next"].tap()
        XCTAssertTrue(app.buttons["profile.voice.vi"].waitForExistence(timeout: 5))
        XCTAssertTrue(app.buttons["profile.voice.vi"].isSelected, "the parent's choice stays")
    }

    /// The start button waits for name, avatar and grade.
    func testStartNeedsNameAvatarAndGrade() throws {
        let app = launch(reset: true)
        XCTAssertTrue(app.buttons["welcome.next"].waitForExistence(timeout: 15))
        app.buttons["welcome.next"].tap()
        let start = app.buttons["profile.start"]
        XCTAssertTrue(start.waitForExistence(timeout: 5))
        XCTAssertFalse(start.isEnabled)
        app.textFields["profile.name"].tap()
        app.textFields["profile.name"].typeText("An")
        XCTAssertFalse(start.isEnabled)
        app.buttons["profile.avatar.ca"].tap()
        XCTAssertFalse(start.isEnabled)
        app.buttons["profile.grade.1"].tap()
        XCTAssertTrue(start.isEnabled)
        // Lớp 1 is Explorer, which has no content yet: the card says the child tries Discoverer.
        XCTAssertTrue(element(app, "profile.world").label.contains("Explorer"))
        XCTAssertTrue(element(app, "profile.world").label.contains("Discoverer"))
    }

    /// Criterion 4: Home → Topic: title, big question, lesson 1 opens, locked lessons do not.
    func testTopicOpensLessonOneOnly() throws {
        let app = launch(reset: true)
        createProfile(app, mode: "bilingual")
        openTopic(app)
        XCTAssertEqual(app.staticTexts["topic.title"].label, "Ăn uống lành mạnh")
        XCTAssertEqual(app.staticTexts["topic.question"].label, "What should we eat to stay healthy?")
        XCTAssertTrue(app.staticTexts["Ta cần ăn gì để khoẻ mạnh?"].exists, "VI line under the question")
        let lesson = app.buttons["topic.lesson.1"]
        XCTAssertTrue(lesson.label.contains("Thức ăn cho ta những gì?"), lesson.label)
        for number in 2...5 {
            let locked = element(app, "topic.lesson.locked.\(number)")
            XCTAssertTrue(locked.exists, "lesson \(number) row")
            XCTAssertEqual(locked.elementType, .other, "locked lesson \(number) is not a button")
            XCTAssertTrue(locked.label.contains("mở sau bài \(number - 1)"), locked.label)
            XCTAssertFalse(app.buttons["topic.lesson.locked.\(number)"].exists)
        }
        element(app, "topic.lesson.locked.2").tap()
        XCTAssertFalse(app.staticTexts["lesson.title"].waitForExistence(timeout: 1), "a locked lesson opened")
        XCTAssertTrue(app.staticTexts["topic.title"].exists)

        lesson.tap()
        XCTAssertTrue(app.staticTexts["lesson.title"].waitForExistence(timeout: 5), "lesson 1 did not open")
        XCTAssertEqual(app.staticTexts["lesson.title"].label, "Thức ăn cho ta những gì?")
        app.buttons["lesson.back"].tap()
        app.buttons["header.back"].tap()
        XCTAssertTrue(app.staticTexts["home.greeting"].waitForExistence(timeout: 5))
        // The play button on the Home card opens the same lesson.
        app.buttons["home.start_lesson"].tap()
        XCTAssertTrue(app.staticTexts["lesson.title"].waitForExistence(timeout: 5))
    }

    /// Tabs not built yet show "sắp có" and come back; the topic words chip opens Từ vựng.
    func testComingSoonTabs() throws {
        let app = launch(reset: true)
        createProfile(app, mode: "bilingual")
        for (tab, title) in [("Thẻ", "Bộ thẻ"), ("Huy hiệu", "Huy hiệu"), ("Từ vựng", "Từ vựng")] {
            app.buttons[tab].tap()
            XCTAssertTrue(app.staticTexts["soon.title"].waitForExistence(timeout: 5), tab)
            XCTAssertEqual(app.staticTexts["soon.title"].label, title)
            XCTAssertTrue(app.buttons[tab].isSelected)
        }
        app.buttons["Hành trình"].tap()
        XCTAssertTrue(app.staticTexts["home.greeting"].waitForExistence(timeout: 5))
        openTopic(app)
        app.buttons["topic.words"].tap()
        XCTAssertTrue(app.staticTexts["soon.title"].waitForExistence(timeout: 5))
        XCTAssertEqual(app.staticTexts["soon.title"].label, "Từ vựng")
    }

    /// Tiếng Anh trước: the VI line of the question is hidden until tapped.
    func testEnglishFirstHidesVietnameseUntilTapped() throws {
        let app = launch(reset: true)
        createProfile(app, mode: "en_first")
        openTopic(app)
        XCTAssertEqual(app.staticTexts["topic.title"].label, "Healthy eating")
        XCTAssertFalse(app.staticTexts["Ta cần ăn gì để khoẻ mạnh?"].exists)
        app.buttons["topic.show_second_language"].tap()
        XCTAssertTrue(app.staticTexts["Ta cần ăn gì để khoẻ mạnh?"].waitForExistence(timeout: 2))
    }

    /// Criterion 7: English device → English interface; lesson text still follows language_mode.
    func testEnglishInterface() throws {
        let app = launch(reset: true, language: "en")
        XCTAssertTrue(app.buttons["welcome.next"].waitForExistence(timeout: 15))
        XCTAssertEqual(app.buttons["welcome.next"].label, "Next")
        XCTAssertTrue(app.staticTexts["Which mode will your child learn in?"].exists)
        createProfile(app, mode: "bilingual")
        XCTAssertEqual(app.staticTexts["home.greeting"].label, "Hi Minh!")
        XCTAssertTrue(app.buttons["Journey"].exists)
        openTopic(app)
        // Song ngữ: the topic is named in Vietnamese, whatever the device language.
        XCTAssertEqual(app.staticTexts["topic.title"].label, "Ăn uống lành mạnh")
        XCTAssertTrue(element(app, "topic.lesson.locked.2").label.contains("opens after lesson 1"))
    }

    // MARK: - Touch targets and accessibility

    /// Criterion 6: on Welcome, Profile, Home and Topic every hittable button is ≥ 56 × 56 pt
    /// and has a label (icon-only ones included).
    func testEveryButtonIsAtLeast56ptAndLabelled() throws {
        let app = launch(reset: true)
        var seen: [String: Set<String>] = [:]
        func check(_ screen: String) {
            for button in app.buttons.allElementsBoundByIndex where button.isHittable {
                let frame = button.frame
                XCTAssertGreaterThanOrEqual(frame.width, 55.5, "\(screen): '\(button.label)' is \(frame.width) wide")
                XCTAssertGreaterThanOrEqual(frame.height, 55.5, "\(screen): '\(button.label)' is \(frame.height) tall")
                XCTAssertFalse(button.label.isEmpty, "\(screen): button without label at \(frame)")
                seen[screen, default: []].insert(button.label)
            }
        }
        XCTAssertTrue(app.buttons["welcome.next"].waitForExistence(timeout: 15))
        check("welcome")
        fillProfile(app, mode: "bilingual")
        check("profile")
        app.swipeUp()
        check("profile (scrolled)")
        app.buttons["profile.start"].tap()
        XCTAssertTrue(app.staticTexts["home.greeting"].waitForExistence(timeout: 5))
        check("home")
        openTopic(app)
        check("topic")
        app.swipeUp()
        check("topic (scrolled)")
        for (screen, labels) in seen.sorted(by: { $0.key < $1.key }) {
            print("buttons[\(screen)]: \(labels.sorted().joined(separator: " | "))")
        }
        XCTAssertTrue(seen["profile", default: []].contains("Quay lại chọn chế độ học"), "icon-only back button has its label")
        XCTAssertTrue(seen["topic", default: []].contains("Về hành trình"))
        XCTAssertTrue(seen["home", default: []].contains("Bắt đầu bài 1"))
    }

    /// `performAccessibilityAudit` on the four screens (what Accessibility Inspector's audit runs).
    /// Allowed, as in the SK-008 gallery test: Dynamic Type "partially unsupported" (the B7.8 cap)
    /// and elements cut by the screen edge (audited where they show whole). Also allowed, printed
    /// and reported to the designer in SK-011: "Contrast failed" on elements whose only weak pair
    /// is paper art or vàng hoè on giấy (2.0:1): the avatar cells (art in vàng hoè, cam, nâu), the
    /// stars chip (vàng hoè star) and the current tab (vàng hoè chip). Their text is than tre on
    /// giấy (≥ 15:1) and the state is also a trait (`isSelected`).
    /// Labels (Vietnamese interface) of the elements allowed above: avatar cells; the stars
    /// chip ("0") and the tabs (the current one sits on vàng hoè).
    private static let contrastAllowed: [String: Set<String>] = [
        "profile": ["Cá", "Ếch", "Gà", "Mèo", "Chim sẻ", "Trâu"],
        "home": ["0", "Hành trình", "Thẻ", "Huy hiệu", "Từ vựng"],
    ]

    func testAccessibilityAudit() throws {
        let app = launch(reset: true)
        var problems: [String] = []
        func audit(_ screen: String) throws {
            let window = app.windows.firstMatch.frame
            for types: XCUIAccessibilityAuditType in [.contrast, .elementDetection, .hitRegion, .sufficientElementDescription, .trait, .textClipped, .dynamicType] {
                try app.performAccessibilityAudit(for: types) { issue in
                    let line = "audit[\(screen)]: \(issue.auditType.rawValue) \(issue.compactDescription) · "
                        + (issue.element.map { "\($0.elementType.rawValue) '\($0.label)' \($0.frame)" } ?? "-")
                    print(line + " | " + issue.detailedDescription)
                    if issue.auditType == .dynamicType, issue.compactDescription.contains("partially") { return true }
                    if let frame = issue.element?.frame, !window.insetBy(dx: -1, dy: -1).contains(frame) { return true }
                    // The audit's element carries the visible text, not the identifier: match by label.
                    if issue.auditType == .contrast, let label = issue.element?.label,
                       Self.contrastAllowed[screen, default: []].contains(label) {
                        print("audit[\(screen)]: allowed (art or vàng hoè on giấy, see SK-011): '\(label)'")
                        return true
                    }
                    problems.append(line)
                    return true
                }
            }
        }
        XCTAssertTrue(app.buttons["welcome.next"].waitForExistence(timeout: 15))
        try audit("welcome")
        fillProfile(app, mode: "bilingual") // tapping the grade drops the keyboard
        try audit("profile")
        app.buttons["profile.start"].tap()
        XCTAssertTrue(app.staticTexts["home.greeting"].waitForExistence(timeout: 5))
        try audit("home")
        openTopic(app)
        try audit("topic")
        XCTAssertTrue(problems.isEmpty, problems.joined(separator: "\n"))
    }

    // MARK: - Screenshots

    /// Saves Welcome, Profile (top and bottom), Home, Topic, a coming-soon tab and the lesson's first screen
    /// as `<device>-<screen>.png` when SK_SCREENSHOT_DIR is set. Song ngữ, Vietnamese interface, as
    /// the canvas. Motion on, screens shot after it settles.
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
        XCTAssertTrue(app.buttons["welcome.next"].waitForExistence(timeout: 15))
        try shot("1-welcome")
        fillProfile(app, mode: "bilingual")
        try shot("2-profile")
        app.swipeUp()
        try shot("2-profile-bottom")
        app.buttons["profile.start"].tap()
        XCTAssertTrue(app.staticTexts["home.greeting"].waitForExistence(timeout: 5))
        try shot("4-home")
        openTopic(app)
        try shot("5-topic")
        app.swipeUp()
        try shot("5-topic-bottom")
        app.buttons["topic.lesson.1"].tap()
        XCTAssertTrue(app.staticTexts["lesson.title"].waitForExistence(timeout: 5))
        try shot("6-lesson-warmup")
        app.buttons["lesson.back"].tap()
        app.buttons["header.back"].tap()
        XCTAssertTrue(app.buttons["Thẻ"].waitForExistence(timeout: 5))
        app.buttons["Thẻ"].tap()
        try shot("4-home-tab-cards")
        if UIDevice.current.userInterfaceIdiom == .pad {
            XCUIDevice.shared.orientation = .landscapeLeft
            app.buttons["Hành trình"].tap()
            try shot("4-home-landscape")
            XCUIDevice.shared.orientation = .portrait
        }
    }
}
