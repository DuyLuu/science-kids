import XCTest

/// SK-011: Welcome → Profile → Home → Topic on the simulator, as the ticket's acceptance list:
/// - fresh start (`-SKResetProfile YES`, same as a new install) opens on Welcome;
/// - Tiếng Anh trước → voice defaults to Chỉ tiếng Anh; Song ngữ → Cả hai;
/// - "Minh", frog, Lớp 3 → Home says "Chào Minh!"; after a relaunch Home opens directly;
/// - Topic (SK-030): every lesson of the syllabus, none locked; a written lesson opens the lesson
///   route, an unwritten one says "Chưa có nội dung" and, tapped, a short note;
/// - Home (SK-030): every topic of the group, chips for the other two groups;
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

    /// Home keeps its scroll position when the child comes back from a topic (SK-030). After a topic
    /// far down the journey (#9), the "Học tiếp" card sits under the status bar: XCUITest then taps
    /// it without scrolling and the status bar takes the tap (tester 9/11). Scroll Home back to the
    /// top until `element` is clear of the top edge.
    private func scrollHomeToTop(_ app: XCUIApplication, showing element: XCUIElement) {
        let clearOfStatusBar = app.windows.firstMatch.frame.minY + 100
        var swipes = 0
        while element.exists, element.frame.minY < clearOfStatusBar, swipes < 5 {
            app.swipeDown()
            swipes += 1
        }
    }

    /// SK-060: the syllabus the app bundles (`content/syllabus.json`), read through `#filePath`, so
    /// the topic counts and "a topic with no lesson written" follow the content as it is written.
    private struct SyllabusGroup {
        let topics: [(key: String, lessons: Int, written: Bool)]
    }

    private static func syllabus(file: String = #filePath) throws -> [String: SyllabusGroup] {
        var dir = URL(fileURLWithPath: file).deletingLastPathComponent()
        while dir.path != "/", !FileManager.default.fileExists(atPath: dir.appendingPathComponent("content/syllabus.json").path) {
            dir.deleteLastPathComponent()
        }
        let data = try Data(contentsOf: dir.appendingPathComponent("content/syllabus.json"))
        let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] ?? [:]
        var groups: [String: SyllabusGroup] = [:]
        for group in json["groups"] as? [[String: Any]] ?? [] {
            let topics = (group["topics"] as? [[String: Any]] ?? []).map { topic in
                let lessons = topic["lessons"] as? [[String: Any]] ?? []
                return (key: topic["key"] as? String ?? "", lessons: lessons.count, written: lessons.contains { $0["lesson_id"] != nil })
            }
            groups[group["age_group"] as? String ?? ""] = SyllabusGroup(topics: topics)
        }
        return groups
    }

    /// The lesson opened from a topic row or the Home card: since SK-043 a lesson opens on its
    /// first question (Discoverer: the header squares; Explorer: its own squares), no title screen.
    private func lessonOpened(_ app: XCUIApplication, timeout: TimeInterval = 5) -> Bool {
        element(app, "lesson.progress").waitForExistence(timeout: timeout) || element(app, "lesson.explorer.progress").exists
    }

    private func openTopic(_ app: XCUIApplication) {
        // SK-030: Ăn uống lành mạnh is Discoverer #9 (the tap scrolls to it).
        app.buttons["home.topic.healthy-eating"].tap()
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
        XCTAssertTrue(again.buttons["home.topic.healthy-eating"].label.contains("Healthy eating"))
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
        // SK-060: Lớp 1 is Explorer, which has lessons since SK-045/046: no "học thử Discoverer".
        XCTAssertTrue(element(app, "profile.world").label.contains("Explorer"), element(app, "profile.world").label)
        XCTAssertFalse(element(app, "profile.world").label.contains("Discoverer"), element(app, "profile.world").label)
        // Lớp 5 is Scientist, which has no content yet: the card says the child tries Discoverer.
        app.buttons["profile.grade.5"].tap()
        XCTAssertTrue(start.isEnabled)
        XCTAssertTrue(element(app, "profile.world").label.contains("Scientist"), element(app, "profile.world").label)
        XCTAssertTrue(element(app, "profile.world").label.contains("Discoverer"), element(app, "profile.world").label)
    }

    /// Criterion 4, SK-030: Home → Topic: title, big question, 10 lessons, none locked. Lesson 2
    /// (written) opens; an unwritten lesson is a button that only shows a note.
    func testTopicListsEveryLessonNoneLocked() throws {
        let app = launch(reset: true)
        createProfile(app, mode: "bilingual")
        openTopic(app)
        XCTAssertEqual(app.staticTexts["topic.title"].label, "Ăn uống lành mạnh")
        XCTAssertEqual(app.staticTexts["topic.question"].label, "What should we eat to stay healthy?")
        XCTAssertTrue(app.staticTexts["Ta cần ăn gì để khoẻ mạnh?"].exists, "VI line under the question")
        let lesson = app.buttons["topic.lesson.2"]
        XCTAssertTrue(lesson.label.contains("Thức ăn cho ta những gì?"), lesson.label)
        // Lesson 6 is written in the pack (Mâm cơm cân bằng), not in the fixtures.
        XCTAssertTrue(app.buttons["topic.lesson.6"].exists || app.buttons["topic.lesson.soon.6"].exists, "lesson 6 row")
        if app.buttons["topic.lesson.6"].exists {
            XCTAssertTrue(app.buttons["topic.lesson.6"].label.contains("Mâm cơm cân bằng"), app.buttons["topic.lesson.6"].label)
        }
        for number in [1, 3, 4, 5, 7, 8, 9, 10] {
            let soon = app.buttons["topic.lesson.soon.\(number)"]
            XCTAssertTrue(soon.exists, "lesson \(number) row")
            XCTAssertTrue(soon.label.contains("Chưa có nội dung"), soon.label)
        }
        XCTAssertFalse(app.descendants(matching: .any).matching(NSPredicate(format: "identifier BEGINSWITH 'topic.lesson.locked'")).firstMatch.exists, "no locked lesson")
        XCTAssertFalse(app.staticTexts.matching(NSPredicate(format: "label CONTAINS[c] 'mở sau bài'")).firstMatch.exists)
        app.buttons["topic.lesson.soon.1"].tap()
        XCTAssertTrue(app.staticTexts["Bài này đang được soạn, sắp có nhé."].waitForExistence(timeout: 2), "the note")
        XCTAssertFalse(element(app, "lesson.progress").exists, "an unwritten lesson opened")
        XCTAssertTrue(app.staticTexts["topic.title"].exists)

        lesson.tap()
        // SK-043: the lesson opens on its first Khởi động question (no title screen).
        XCTAssertTrue(lessonOpened(app), "lesson 2 did not open")
        XCTAssertTrue(element(app, "lesson.warmup.tag").exists, "lesson 2 opens on Khởi động")
        app.buttons["lesson.back"].tap()
        app.buttons["header.back"].tap()
        XCTAssertTrue(app.staticTexts["home.greeting"].waitForExistence(timeout: 5))
        // The play button on the Home card opens the lesson the card names: the first written
        // lesson of the journey (SK-035 tester #1: which one moves as content is written, so it is
        // read from the card, not written here). Home is still scrolled down to topic #9: bring the
        // card back first.
        let start = app.buttons["home.start_lesson"]
        scrollHomeToTop(app, showing: start)
        XCTAssertGreaterThan(start.frame.minY, app.windows.firstMatch.frame.minY + 60, "the card is clear of the status bar")
        let named = app.otherElements["home.continue"].staticTexts.matching(NSPredicate(format: "label BEGINSWITH 'Bài '")).firstMatch
        XCTAssertTrue(named.exists, "the card names its lesson")
        print("Home card: '\(named.label)'")
        start.tap()
        // No title screen since SK-043 to compare the card's name with: the lesson opens.
        XCTAssertTrue(lessonOpened(app), "the Home card did not open a lesson")
    }

    /// SK-030: Home shows the Discoverer topics of a Lớp 3 profile; the chips show Explorer and
    /// Scientist, each with its topic count. A topic with no content opens with its lessons, no big
    /// question, no words chip. SK-060: the counts and the unwritten topic come from
    /// `content/syllabus.json` (Explorer has lessons since SK-045, Discoverer #5 since SK-051…).
    func testEveryGroupAndAnUnwrittenTopic() throws {
        let syllabus = try Self.syllabus()
        let discoverer = try XCTUnwrap(syllabus["discoverer"]), explorer = try XCTUnwrap(syllabus["explorer"]), scientist = try XCTUnwrap(syllabus["scientist"])
        let unwritten = try XCTUnwrap(discoverer.topics.first { !$0.written }, "every Discoverer topic has a lesson")
        let app = launch(reset: true)
        createProfile(app, mode: "bilingual")
        XCTAssertTrue(app.buttons["home.group.discoverer"].isSelected, "the profile's group by default")
        XCTAssertTrue(app.staticTexts["\(discoverer.topics.count) chủ đề"].exists)
        app.buttons["home.group.explorer"].tap()
        XCTAssertTrue(app.staticTexts["\(explorer.topics.count) chủ đề"].waitForExistence(timeout: 2))
        XCTAssertEqual(element(app, "home.journey.title").label, "Hành trình Explorer")
        XCTAssertEqual(app.buttons["home.start_lesson"].exists, explorer.topics.contains { $0.written }, "the card when Explorer has a lesson")
        app.buttons["home.group.scientist"].tap()
        XCTAssertTrue(app.staticTexts["\(scientist.topics.count) chủ đề"].waitForExistence(timeout: 2))
        app.buttons["home.group.discoverer"].tap()
        XCTAssertTrue(app.staticTexts["\(discoverer.topics.count) chủ đề"].waitForExistence(timeout: 2))
        // Lớp 3 is UK Year 4 (`Grade.ukYear`).
        XCTAssertEqual(element(app, "home.journey.title").label, "Hành trình Year 4")

        // The map draws its stops lazily: scroll to the unwritten topic.
        let stop = app.buttons["home.topic.\(unwritten.key)"]
        var swipes = 0
        while !stop.isHittable, swipes < 12 {
            swipes < 6 ? app.swipeUp() : app.swipeDown()
            swipes += 1
        }
        stop.tap()
        XCTAssertTrue(app.staticTexts["topic.title"].waitForExistence(timeout: 5), "an unwritten topic opens (\(unwritten.key))")
        for number in 1...unwritten.lessons {
            XCTAssertTrue(app.buttons["topic.lesson.soon.\(number)"].exists, "lesson \(number)")
        }
        XCTAssertFalse(app.buttons["topic.lesson.soon.\(unwritten.lessons + 1)"].exists)
        XCTAssertFalse(app.staticTexts["topic.question"].exists)
        XCTAssertFalse(app.buttons["topic.words"].exists)
        app.buttons["topic.lesson.soon.1"].tap()
        XCTAssertTrue(app.staticTexts["Bài này đang được soạn, sắp có nhé."].waitForExistence(timeout: 2))
        app.buttons["header.back"].tap()
        XCTAssertTrue(app.staticTexts["home.greeting"].waitForExistence(timeout: 5))
    }

    /// SK-035: a new profile's Thẻ, Huy hiệu and Từ vựng tabs are real pages, empty, each with
    /// the card that sends the child to the first lesson; no "Sắp có" left. Each tab passes the
    /// accessibility audit (tester 10/11 #2, #3: the badges not started and "hôm nay" failed it).
    /// The topic words chip says to finish a lesson first (tester #15: the tab would be empty);
    /// "Học bài đầu tiên" opens a lesson.
    func testCollectionTabsStartEmpty() throws {
        let app = launch(reset: true)
        createProfile(app, mode: "bilingual")
        var problems: [String] = []
        for (tab, id, title) in [("Thẻ", "cards.title", "Bộ thẻ"), ("Huy hiệu", "badges.title", "Huy hiệu và chuỗi ngày"), ("Từ vựng", "words.title", "Từ vựng")] {
            app.buttons[tab].tap()
            XCTAssertTrue(app.staticTexts[id].waitForExistence(timeout: 5), tab)
            XCTAssertEqual(app.staticTexts[id].label, title)
            XCTAssertTrue(app.buttons[tab].isSelected)
            XCTAssertTrue(app.otherElements["collection.empty"].exists || app.buttons["collection.empty.start"].exists, tab)
            XCTAssertFalse(app.staticTexts["Sắp có"].exists, tab)
            problems += try auditProblems(app, screen: id)
        }
        // SK-060 (lỗi 4, ios-dev 20/11): scrolled to its end, the last item of Thẻ and Huy hiệu
        // stops at least s16 (16 pt) above the tab strip's torn top edge.
        for tab in ["Thẻ", "Huy hiệu"] {
            app.buttons[tab].tap()
            problems += bottomGapProblem(app, tab: tab)
        }
        app.buttons["Huy hiệu"].tap()
        XCTAssertTrue(app.buttons["badges.badge.humans_health"].waitForExistence(timeout: 5))
        XCTAssertTrue(app.staticTexts["badges.streak"].exists)
        XCTAssertTrue(problems.isEmpty, problems.joined(separator: "\n"))
        app.buttons["Hành trình"].tap()
        XCTAssertTrue(app.staticTexts["home.greeting"].waitForExistence(timeout: 5))
        openTopic(app)
        app.buttons["topic.words"].tap()
        XCTAssertTrue(app.staticTexts["topic.words.note"].waitForExistence(timeout: 2), "no lesson done: the chip says so")
        XCTAssertTrue(app.staticTexts["topic.title"].exists, "the chip did not open an empty tab")
        app.buttons["header.back"].tap()
        app.buttons["Từ vựng"].tap()
        XCTAssertTrue(app.staticTexts["words.title"].waitForExistence(timeout: 5))
        app.buttons["collection.empty.start"].tap()
        XCTAssertTrue(lessonOpened(app), "Học bài đầu tiên did not open a lesson")
    }

    /// English (en_first, SK-042): English only, no Vietnamese line and no button to show it.
    func testEnglishFirstShowsEnglishOnly() throws {
        let app = launch(reset: true)
        createProfile(app, mode: "en_first")
        openTopic(app)
        XCTAssertEqual(app.staticTexts["topic.title"].label, "Healthy eating")
        XCTAssertFalse(app.staticTexts["Ta cần ăn gì để khoẻ mạnh?"].exists)
        XCTAssertFalse(app.buttons["topic.show_second_language"].exists)
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
        XCTAssertTrue(app.buttons["topic.lesson.soon.1"].label.contains("Coming soon"), app.buttons["topic.lesson.soon.1"].label)
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
        XCTAssertTrue(seen["home", default: []].contains { $0.hasPrefix("Bắt đầu bài ") }, "the Home card's play button has its label")
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
    /// SK-035: the three tabs keep the bottom strip's current tab (vàng hoè); Huy hiệu has the
    /// stars chip with its vàng hoè star, as Home.
    private static let contrastAllowed: [String: Set<String>] = [
        "profile": ["Cá", "Ếch", "Gà", "Mèo", "Chim sẻ", "Trâu"],
        "home": ["0", "Hành trình", "Thẻ", "Huy hiệu", "Từ vựng"],
        "cards.title": ["Hành trình", "Thẻ", "Huy hiệu", "Từ vựng"],
        "badges.title": ["Hành trình", "Thẻ", "Huy hiệu", "Từ vựng", "Tổng cộng 0 sao"],
        "words.title": ["Hành trình", "Thẻ", "Huy hiệu", "Từ vựng"],
    ]

    /// Every audit type on the screen showing, with the allowances above; the issues left, one
    /// line each (also printed).
    private func auditProblems(_ app: XCUIApplication, screen: String) throws -> [String] {
        var problems: [String] = []
        let window = app.windows.firstMatch.frame
        // SK-060 (lỗi 4, phiên chính chốt 20/11, cách a): the top of the tab strip's solid paper
        // (14 pt above its buttons); `nil` on a screen without the strip.
        let stripPaperTop = app.buttons.matching(NSPredicate(format: "identifier BEGINSWITH %@", "tab."))
            .allElementsBoundByIndex.map(\.frame.minY).min().map { $0 - 14 }
        for types: XCUIAccessibilityAuditType in [.contrast, .elementDetection, .hitRegion, .sufficientElementDescription, .trait, .textClipped, .dynamicType] {
            try app.performAccessibilityAudit(for: types) { issue in
                let line = "audit[\(screen)]: \(issue.auditType.rawValue) \(issue.compactDescription) · "
                    + (issue.element.map { "\($0.elementType.rawValue) '\($0.label)' \($0.frame)" } ?? "-")
                print(line + " | " + issue.detailedDescription)
                if issue.auditType == .dynamicType, issue.compactDescription.contains("partially") { return true }
                if let frame = issue.element?.frame, !window.insetBy(dx: -1, dy: -1).contains(frame) { return true }
                // SK-060 (lỗi 4, cách a): page text that runs below the top of the tab strip's paper
                // is sliding under solid paper (the child does not see it there); the audit measures
                // the paper and its shadow. Only contrast, only page items (not the strip's own tabs);
                // scrolled to the end those items stop ≥ 16 pt above it (`bottomGapProblem`).
                if issue.auditType == .contrast, let top = stripPaperTop, let element = issue.element,
                   !element.identifier.hasPrefix("tab."),
                   !["Hành trình", "Thẻ", "Huy hiệu", "Từ vựng"].contains(element.label), element.frame.maxY > top {
                    print("audit[\(screen)]: under the tab strip (paper top \(top)), not seen: '\(element.label)' \(element.frame)")
                    return true
                }
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
        return problems
    }

    /// SK-060 (lỗi 4, ios-dev 20/11): scrolls the tab to its end and measures the gap between the
    /// lowest item of the page and the top of the tab strip's paper (`PaperMetrics.navPadding.top`
    /// = 14 above the tab buttons). A problem line when the gap is under `Tokens.Space.s16` (16);
    /// what it measured is always printed, and the tab is left scrolled back to the top.
    private func bottomGapProblem(_ app: XCUIApplication, tab: String) -> [String] {
        var previous: [CGRect] = []
        var swipes = 0
        while swipes < 12 {
            let frames = app.staticTexts.allElementsBoundByIndex.map(\.frame)
            if !frames.isEmpty, frames == previous { break }
            previous = frames
            app.swipeUp()
            swipes += 1
            usleep(500_000)
        }
        defer { for _ in 0...swipes { app.swipeDown() } }
        let strip = app.buttons.matching(NSPredicate(format: "identifier BEGINSWITH %@", "tab."))
            .allElementsBoundByIndex.map(\.frame)
        guard let stripTop = strip.map(\.minY).min() else { return ["bottom gap[\(tab)]: no tab strip"] }
        let paperTop = stripTop - 14
        let window = app.windows.firstMatch.frame
        let tabNames: Set<String> = ["Hành trình", "Thẻ", "Huy hiệu", "Từ vựng"]
        var lowest: (maxY: CGFloat, what: String)?
        let candidates = app.staticTexts.allElementsBoundByIndex
            + app.images.allElementsBoundByIndex
            + app.buttons.allElementsBoundByIndex
        for element in candidates {
            let frame = element.frame
            // Items of the page only: not the strip's own buttons and labels, nothing page-sized,
            // nothing fully off screen. An item sliding under the strip still counts: that is the bug.
            guard frame.width > 0, frame.height > 0, frame.height < 400 else { continue }
            if element.identifier.hasPrefix("tab.") || tabNames.contains(element.label) { continue }
            if frame.minY > window.maxY { continue }
            if lowest == nil || frame.maxY > lowest!.maxY {
                lowest = (frame.maxY, "\(element.elementType.rawValue) '\(element.label)' \(element.identifier) \(frame)")
            }
        }
        guard let last = lowest else { return ["bottom gap[\(tab)]: nothing on the page"] }
        let gap = paperTop - last.maxY
        let line = "bottom gap[\(tab)]: \(String(format: "%.1f", gap)) pt after \(swipes) swipes · strip paper top \(paperTop) · last \(last.what)"
        print(line)
        return gap < 15.5 ? ["\(line) — under s16 (SK-060 lỗi 4)"] : []
    }

    func testAccessibilityAudit() throws {
        let app = launch(reset: true)
        var problems: [String] = []
        func audit(_ screen: String) throws {
            problems += try auditProblems(app, screen: screen)
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
        app.buttons["topic.lesson.2"].tap()
        XCTAssertTrue(lessonOpened(app))
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
