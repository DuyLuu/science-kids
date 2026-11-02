import XCTest

/// SK-008: the DesignSystem gallery (`-SKGallery YES`) on the simulator.
/// - accessibility audit (what Accessibility Inspector's audit runs), section by section;
/// - every control is a button at least 56 × 56 pt with a label;
/// - with motion reduced, "Chạy lại motion" changes nothing on screen.
///
/// Set `SK_SCREENSHOT_DIR` (as `TEST_RUNNER_SK_SCREENSHOT_DIR` for xcodebuild) to also save the
/// gallery screenshots there, portrait and, on iPad, landscape.
@MainActor
final class GalleryUITests: XCTestCase {
    private static let sections = ["header", "shadows", "cards", "buttons", "tags", "progress", "choices", "motion"]

    override func setUp() async throws {
        continueAfterFailure = false
        XCUIDevice.shared.orientation = .portrait
    }

    override func tearDown() async throws {
        XCUIDevice.shared.orientation = .portrait
    }

    private func launchGallery(_ extra: [String] = []) -> XCUIApplication {
        let app = XCUIApplication()
        app.launchArguments = ["-SKGallery", "YES", "-SKSyncOff", "YES"] + extra
        app.launch()
        XCTAssertTrue(app.staticTexts["gallery.metrics"].waitForExistence(timeout: 15), "gallery did not open")
        // Let the system launch animation (window zooming in from the icon) finish.
        sleep(2)
        return app
    }

    // MARK: - Accessibility

    /// `performAccessibilityAudit` (contrast, hit regions, element descriptions, Dynamic Type,
    /// clipped text, traits) on every section. Motion off so each audit sees settled frames.
    /// Every issue is printed (`audit[section]: …`) and fails the test, except:
    /// - the Dynamic Type "partially unsupported" finding, which is the deliberate cap of B7.8:
    ///   text grows with the setting up to `typography.dynamic_type.max_category` and stops there
    ///   (`testTextGrowsWithDynamicTypeUpToTheCap` checks the growing part). With the cap removed
    ///   the audit drops this finding and reports clipped text instead (SK-008 experiment);
    /// - findings on an element cut by the screen edge or lying under the status bar (the audit
    ///   samples only what shows); each section opens at the top, so that element is audited whole
    ///   in its own section;
    /// - "Text clipped … may be clipped at larger Dynamic Type sizes" on the sample word "fish":
    ///   the only word the audit flags, in any grid position; at AccessibilityXXXL the cell shows
    ///   it whole (SK-008 screenshot `ax-choices.png`) and its ink stays inside its advance.
    func testAccessibilityAuditEverySection() throws {
        var failures: [String] = []
        // SK_AUDIT_SECTIONS=choices,motion audits only those (quicker while fixing).
        let only = ProcessInfo.processInfo.environment["SK_AUDIT_SECTIONS"].map { $0.split(separator: ",").map(String.init) }
        for section in only ?? Self.sections {
            let app = launchGallery(["-SKReduceMotion", "YES", "-SKGalleryScrollTo", section])
            // Visible part of the screen: below the status bar (content scrolled under it is
            // covered by the frame's điệp strip), above the bottom edge.
            let window = app.windows.firstMatch.frame
            let statusBar = XCUIApplication(bundleIdentifier: "com.apple.springboard").statusBars.firstMatch
            let top = statusBar.exists ? statusBar.frame.maxY : 0
            let screen = CGRect(x: window.minX, y: top, width: window.width, height: window.maxY - top).insetBy(dx: -1, dy: -1)
            print("audit[\(section)]: visible area \(screen)")
            // One audit type per pass: the Dynamic Type and clipped-text checks resize the text, and
            // run together with the contrast check they made it sample a resized screen (flaky).
            let passes: [XCUIAccessibilityAuditType] = [
                .contrast, .elementDetection, .hitRegion, .sufficientElementDescription, .trait, .textClipped, .dynamicType,
            ]
            for types in passes {
                try app.performAccessibilityAudit(for: types) { issue in
                    let line = "audit[\(section)]: \(issue.auditType.rawValue) \(issue.compactDescription) · "
                        + (issue.element.map { "\($0.elementType.rawValue) '\($0.label)' \($0.frame)" } ?? "-")
                    print(line + " | " + issue.detailedDescription)
                    if issue.auditType == .dynamicType, issue.compactDescription.contains("partially") {
                        return true
                    }
                    if issue.auditType == .textClipped, issue.element?.label == "fish" {
                        print("audit[\(section)]: allowed, checked by hand: \(line)")
                        return true
                    }
                    if let frame = issue.element?.frame, !screen.contains(frame) {
                        print("audit[\(section)]: skipped, element not fully visible: \(frame)")
                        return true
                    }
                    failures.append(line)
                    return true
                }
            }
            app.terminate()
        }
        XCTAssertEqual(failures, [], failures.joined(separator: "\n"))
    }

    /// Text in the gallery follows Dynamic Type up to the cap: the metrics line is taller at
    /// xxxLarge than at Large, and the same at accessibility sizes as at xxxLarge.
    func testTextGrowsWithDynamicTypeUpToTheCap() throws {
        func height(_ category: String) -> CGFloat {
            let app = launchGallery(["-SKReduceMotion", "YES", "-UIPreferredContentSizeCategoryName", category])
            let value = app.staticTexts["gallery.metrics"].frame.height
            app.terminate()
            return value
        }
        let large = height("UICTContentSizeCategoryL")
        let xxxLarge = height("UICTContentSizeCategoryXXXL")
        let accessibility = height("UICTContentSizeCategoryAccessibilityXXXL")
        XCTAssertGreaterThan(xxxLarge, large * 1.2, "text does not grow with Dynamic Type")
        XCTAssertEqual(accessibility, xxxLarge, accuracy: 1, "text grows past the cap")
    }

    /// Every control in the gallery is a real button of at least the Discoverer touch target
    /// (56 pt) and has a label; icon-only buttons carry their `accessibilityLabel`. A scroll view
    /// only exposes what is on screen, so each section is opened in turn.
    func testEveryButtonIsAtLeast56ptAndLabelled() throws {
        var seen: Set<String> = []
        for section in Self.sections {
            let app = launchGallery(["-SKReduceMotion", "YES", "-SKGalleryScrollTo", section])
            for button in app.buttons.allElementsBoundByIndex where button.isHittable {
                let frame = button.frame
                XCTAssertGreaterThanOrEqual(frame.width, 56, "\(button.label) is \(frame.width) wide")
                XCTAssertGreaterThanOrEqual(frame.height, 56, "\(button.label) is \(frame.height) tall")
                XCTAssertFalse(button.label.isEmpty, "button without label at \(frame)")
                seen.insert(button.label)
            }
            app.terminate()
        }
        print("buttons checked: \(seen.sorted())")
        XCTAssertGreaterThanOrEqual(seen.count, 15, "expected the gallery's buttons, saw \(seen.sorted())")
        for label in ["Thoát quiz", "Về hành trình", "Nghe câu hỏi"] {
            XCTAssertTrue(seen.contains(label), "icon-only button \(label) has no accessibilityLabel")
        }
    }

    // MARK: - Reduce Motion

    /// `-SKReduceMotion YES` (the app-level switch, same path as the system setting):
    /// tapping "Chạy lại motion" leaves every motion demo exactly as it was.
    func testReplayDoesNothingWhenMotionIsReduced() throws {
        let app = launchGallery(["-SKReduceMotion", "YES", "-SKGalleryScrollTo", "motion"])
        XCTAssertTrue(app.staticTexts["gallery.reduceMotion"].label.hasPrefix("Giảm chuyển động: bật"))
        try assertReplayIsStill(in: app)
    }

    /// The same check with the system setting (Settings › Accessibility › Motion › Reduce Motion).
    /// UI tests cannot flip it, so this test is skipped unless the simulator already has it on
    /// (`xcrun simctl spawn <udid> defaults write com.apple.Accessibility ReduceMotionEnabled -bool YES`).
    func testReplayDoesNothingWithSystemReduceMotion() throws {
        let app = launchGallery(["-SKGalleryScrollTo", "motion"])
        let line = app.staticTexts["gallery.reduceMotion"].label
        try XCTSkipUnless(line.contains("hệ thống bật"), "system Reduce Motion is off: \(line)")
        try assertReplayIsStill(in: app)

        // The same switch as the user sees it: Settings › Accessibility › Motion › Reduce Motion.
        let settings = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
        settings.launch()
        settings.staticTexts["Accessibility"].firstMatch.tap()
        settings.staticTexts["Motion"].firstMatch.tap()
        let toggle = settings.switches["Reduce Motion"].firstMatch
        XCTAssertTrue(toggle.waitForExistence(timeout: 5))
        XCTAssertEqual(toggle.value as? String, "1", "Settings shows Reduce Motion off")
        if let directory = ProcessInfo.processInfo.environment["SK_SCREENSHOT_DIR"], !directory.isEmpty {
            try XCUIScreen.main.screenshot().pngRepresentation
                .write(to: URL(fileURLWithPath: directory).appendingPathComponent("settings-reduce-motion.png"))
        }
        settings.terminate()
    }

    /// Control for the two tests above: with motion on, replay does change the screen.
    func testReplayAnimatesWhenMotionIsOn() throws {
        let app = launchGallery(["-SKGalleryScrollTo", "motion"])
        let line = app.staticTexts["gallery.reduceMotion"].label
        try XCTSkipIf(line.contains("hệ thống bật"), "system Reduce Motion is on")
        sleep(2)
        let settled = app.screenshot().pngRepresentation
        app.buttons["gallery.replayMotion"].tap()
        let during = app.screenshot().pngRepresentation
        sleep(2)
        let after = app.screenshot().pngRepresentation
        if let directory = ProcessInfo.processInfo.environment["SK_SCREENSHOT_DIR"], !directory.isEmpty {
            for (name, data) in [("settled", settled), ("during", during), ("after", after)] {
                try data.write(to: URL(fileURLWithPath: directory).appendingPathComponent("replay-\(name).png"))
            }
        }
        XCTAssertNotEqual(settled, during, "replay did not start any motion")
    }

    private func assertReplayIsStill(in app: XCUIApplication) throws {
        let demos = ["lay", "stamp", "rise", "pop", "fall"].map { app.otherElements["gallery.demo.\($0)"] }
        for demo in demos { XCTAssertTrue(demo.waitForExistence(timeout: 5), "missing \(demo)") }
        let before = demos.map { $0.screenshot().pngRepresentation }
        app.buttons["gallery.replayMotion"].tap()
        let justAfter = demos.map { $0.screenshot().pngRepresentation }
        sleep(1)
        let later = demos.map { $0.screenshot().pngRepresentation }
        for index in demos.indices {
            XCTAssertEqual(before[index], justAfter[index], "\(demos[index]) moved right after replay")
            XCTAssertEqual(before[index], later[index], "\(demos[index]) changed after replay")
        }
    }

    // MARK: - Screenshots

    /// Saves one screenshot per section (portrait; iPad also landscape) when SK_SCREENSHOT_DIR is set.
    func testGalleryScreenshots() throws {
        guard let directory = ProcessInfo.processInfo.environment["SK_SCREENSHOT_DIR"], !directory.isEmpty else {
            throw XCTSkip("set SK_SCREENSHOT_DIR (TEST_RUNNER_SK_SCREENSHOT_DIR) to save screenshots")
        }
        let isPad = UIDevice.current.userInterfaceIdiom == .pad
        let orientations: [(String, UIDeviceOrientation)] = isPad
            ? [("portrait", .portrait), ("landscape", .landscapeLeft)]
            : [("portrait", .portrait)]
        let device = isPad ? "ipad" : "iphone"
        for (name, orientation) in orientations {
            XCUIDevice.shared.orientation = orientation
            for section in Self.sections {
                let app = launchGallery(["-SKGalleryScrollTo", section])
                sleep(2)
                let data = XCUIScreen.main.screenshot().pngRepresentation
                let url = URL(fileURLWithPath: directory).appendingPathComponent("gallery-\(device)-\(name)-\(section).png")
                try data.write(to: url)
                let attachment = XCTAttachment(data: data, uniformTypeIdentifier: "public.png")
                attachment.name = url.lastPathComponent
                attachment.lifetime = .keepAlways
                add(attachment)
                app.terminate()
            }
        }
    }
}
