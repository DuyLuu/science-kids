import XCTest

/// SK-047 (tester 16/11): screenshots of the screens changed in the 16/11 fix round, taken on one
/// simulator with the pack `e01f9e6a616d`. This file only drives and shoots; the few assertions
/// are waits, and `continueAfterFailure` is on so one missing screen does not hide the others.
///
/// It reuses `Pack` from `SK047FlowUITests` (same target). Shots go to `SK_SHOT_DIR`
/// (`TEST_RUNNER_SK_SHOT_DIR` for xcodebuild).
@MainActor
final class SK047ShotsUITests: XCTestCase {
    private var pack: Pack!

    override func setUp() async throws {
        continueAfterFailure = true
        XCUIDevice.shared.orientation = .portrait
        pack = try Pack.load()
    }

    // MARK: - Chữ và thẻ đổi 16/11

    /// `thoi-tiet-va-thien-tai/02`: the new q2 sentence, and the new hints of q5 and q6.
    func testWeather02() throws {
        try shootQuiz(of: "do-thoi-tiet", shots: ["q2": "w02-q2-1611b"], hints: ["q5": "w02-q5-hint-1611b", "q6": "w02-q6-hint-1611b"])
    }

    /// `ho-hap/03` q2: the chip `q2_jumps` now shows the hopscotch.
    func testBreathing03() throws {
        try shootQuiz(of: "tho-khi-chay-nhay", shots: ["q2": "hh03-q2-1611b"], hints: [:])
    }

    /// `ho-hap/04`: q4 has the schoolyard option, q5 the steam chip.
    func testBreathing04() throws {
        try shootQuiz(of: "giu-phoi-khoe", shots: ["q4": "hh04-q4-1611b", "q5": "hh04-q5-1611b"], hints: [:])
    }

    /// `da-va-dat/15` q2: the new hint, and the bank card "PALAEONTOLOGY" in full (`WordFitText`,
    /// ios-dev 16/11).
    func testRocks15() throws {
        try shootQuiz(of: "nha-dia-chat-lam-gi", shots: ["q2": "dd15-q2-1611b"], hints: ["q2": "dd15-q2-hint-1611b"])
    }

    /// The same question in Vietnamese (`-SKTestProfile vi_first`): "cổ sinh vật học" has to show
    /// on two lines, broken between words.
    func testRocks15Vietnamese() throws {
        try shootQuiz(of: "nha-dia-chat-lam-gi", shots: ["q2": "dd15-q2-vi-1611b"], hints: [:], profile: "vi_first")
    }

    // MARK: - Hình dựng lại 16/11

    /// `khung-long/01`: every Học page (the two rebuilt group pictures and the New words page with
    /// `million`), q4 with its three options, and Tổng kết page 1 (cards 2 and 3).
    func testDinosaurs01() throws {
        let lesson = try pack.lesson("trai-dat-rat-lau-ve-truoc")
        let app = launch(openLesson: lesson.id)
        open(lesson, in: app)
        playWarmup(lesson, in: app)
        shootLearnPages(lesson, in: app, prefix: "kl01")
        playTray(lesson, in: app)
        for item in lesson.quiz {
            if item.key == "q4" { waitForQuestion(app); shot(app, "kl01-q4-1611b") }
            answerRight(item, in: app)
            tapNext(app)
        }
        if element(app, "lesson.recap.key_point.1").waitForExistence(timeout: 15) {
            shot(app, "kl01-recap1-1611b")
        } else {
            XCTFail("Tổng kết màn 1 của khung-long/01 không mở")
        }
    }

    /// `da-va-dat/03`: the Học page with the rebuilt `explore_properties`.
    func testRocks03() throws {
        try shootLearn(of: "da-nao-cung-hon", prefix: "dd03")
    }

    /// `da-va-dat/14` q4: the new wide chart picture.
    func testRocks14Chart() throws {
        try shootQuiz(of: "nuoc-tham-qua-dat-nao-nhanh-hon", shots: ["q4": "dd14-q4-1611b"], hints: [:])
    }

    /// Explorer `chuoi-thuc-an` 02, 03, 04: the Học pages with the four rebuilt chain pictures.
    func testFoodChainLearnPages() throws {
        for (slug, prefix) in [("chuoi-thuc-an-la-gi", "ct02"), ("moi-loai-mot-vai", "ct03"), ("so-sanh-cac-chuoi-thuc-an", "ct04")] {
            try shootLearn(of: slug, prefix: prefix)
        }
    }

    // MARK: - Hai màn lượt trước chưa kiểm

    /// Explorer `/04` Tổng kết page 1 and `/07` Tổng kết page 2.
    func testExplorerRecapsNotSeenBefore() throws {
        for (slug, page, name) in [("ca-va-luong-cu", 1, "x04-recap1-1611b"), ("con-trung-va-con-vat-nhieu-chan", 2, "x07-recap2-1611b")] {
            let lesson = try pack.lesson(slug)
            let app = launch(openLesson: lesson.id)
            open(lesson, in: app)
            playWarmup(lesson, in: app)
            skipLearnPages(lesson, in: app)
            playTray(lesson, in: app)
            for item in lesson.quiz {
                answerRight(item, in: app)
                tapNext(app)
            }
            guard element(app, "lesson.recap.key_point.1").waitForExistence(timeout: 20) else {
                XCTFail("Tổng kết của \(slug) không mở")
                app.terminate()
                continue
            }
            if page == 2 {
                app.buttons["lesson.recap.next"].firstMatch.tap()
                _ = element(app, "lesson.recap.objective").waitForExistence(timeout: 10)
            }
            shot(app, name)
            app.terminate()
        }
    }

    // MARK: - Drivers

    /// Plays a lesson up to its quiz, shooting the given questions (and the given hints opened).
    private func shootQuiz(of slug: String, shots: [String: String], hints: [String: String], profile: String = "YES") throws {
        let lesson = try pack.lesson(slug)
        let app = launch(openLesson: lesson.id, profile: profile)
        open(lesson, in: app)
        playWarmup(lesson, in: app)
        skipLearnPages(lesson, in: app)
        playTray(lesson, in: app)
        for item in lesson.quiz {
            waitForQuestion(app)
            if let name = shots[item.key] { shot(app, name) }
            if let name = hints[item.key] {
                let hint = app.buttons["lesson.hint.button"].firstMatch
                if hint.waitForExistence(timeout: 10) {
                    hint.tap()
                    _ = element(app, "lesson.hint.slip").waitForExistence(timeout: 5)
                    shot(app, name)
                } else {
                    XCTFail("không có nút gợi ý ở \(slug) \(item.key)")
                }
            }
            answerRight(item, in: app)
            tapNext(app)
        }
        app.terminate()
    }

    /// Plays a lesson up to Học and shoots every page of the picture book.
    private func shootLearn(of slug: String, prefix: String) throws {
        let lesson = try pack.lesson(slug)
        let app = launch(openLesson: lesson.id)
        open(lesson, in: app)
        playWarmup(lesson, in: app)
        shootLearnPages(lesson, in: app, prefix: prefix)
        app.terminate()
    }

    private func shootLearnPages(_ lesson: Pack.Lesson, in app: XCUIApplication, prefix: String) {
        var page = 0
        while element(app, "lesson.learn.page").waitForExistence(timeout: page == 0 ? 15 : 3), page < 14 {
            page += 1
            shot(app, "\(prefix)-learn\(page)-1611b")
            app.buttons["lesson.explorer.next"].firstMatch.tap()
        }
        if page == 0 { XCTFail("không thấy trang Học của \(lesson.slug)") }
    }

    private func skipLearnPages(_ lesson: Pack.Lesson, in app: XCUIApplication) {
        var turns = 0
        while element(app, "lesson.learn.page").waitForExistence(timeout: turns == 0 ? 15 : 2), turns < 14 {
            app.buttons["lesson.explorer.next"].firstMatch.tap()
            turns += 1
        }
    }

    // MARK: - Helpers (same as SK047FlowUITests)

    /// `profile`: giá trị của `-SKTestProfile` (`YES` là Song ngữ). Khác `YES` thì thêm
    /// `-SKResetProfile YES` để hồ sơ cũ không thắng.
    private func launch(openLesson: String? = nil, profile: String = "YES") -> XCUIApplication {
        let app = XCUIApplication()
        app.launchArguments = ["-AppleLanguages", "(en)", "-AppleLocale", "en_US", "-SKSyncOff", "YES", "-SKReduceMotion", "YES", "-SKTestProfile", profile]
        if profile != "YES" { app.launchArguments += ["-SKResetProfile", "YES"] }
        if let openLesson { app.launchArguments += ["-SKOpenLesson", openLesson] }
        app.launch()
        return app
    }

    private func element(_ app: XCUIApplication, _ identifier: String) -> XCUIElement {
        app.descendants(matching: .any)[identifier].firstMatch
    }

    private func open(_ lesson: Pack.Lesson, in app: XCUIApplication) {
        let onScreen = app.descendants(matching: .any)["lesson.prompt"].firstMatch.waitForExistence(timeout: 25)
            || app.descendants(matching: .any)["lesson.statement"].firstMatch.exists
            || app.descendants(matching: .any)["lesson.explorer.bubble"].firstMatch.exists
            || app.buttons["lesson.back"].firstMatch.exists
        XCTAssertTrue(onScreen, "bài \(lesson.slug) không mở")
    }

    private func waitForQuestion(_ app: XCUIApplication) {
        _ = element(app, "lesson.prompt").waitForExistence(timeout: 10)
    }

    private func playWarmup(_ lesson: Pack.Lesson, in app: XCUIApplication) {
        for item in lesson.warmup {
            answerRight(item, in: app)
            tapNext(app)
        }
    }

    private func playTray(_ lesson: Pack.Lesson, in app: XCUIApplication) {
        if lesson.trayRequired.isEmpty { return }
        guard element(app, "lesson.play.message").waitForExistence(timeout: 15) else {
            XCTFail("Chơi không mở (\(lesson.slug))")
            return
        }
        for key in lesson.trayOneOfEachGroup { tapShelf(app, key) }
        let done = app.buttons["lesson.play.done"].firstMatch
        if done.waitForExistence(timeout: 5) { done.tap() } else { XCTFail("mâm chưa cân (\(lesson.slug))") }
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
        if discoverer.waitForExistence(timeout: 12) {
            discoverer.tap()
            return
        }
        let explorer = app.buttons["lesson.explorer.next"].firstMatch
        if explorer.waitForExistence(timeout: 5) { explorer.tap() } else { XCTFail("không có mũi tên sau câu hỏi") }
    }

    private func tapElement(_ app: XCUIApplication, _ identifier: String, file: StaticString = #filePath, line: UInt = #line) {
        let target = app.buttons[identifier].firstMatch
        if !target.waitForExistence(timeout: 12) {
            XCTFail("không có nút \(identifier)", file: file, line: line)
            return
        }
        // SK-047 (ios-dev 16/11): `isHittable` vẫn đúng khi nút mới lộ một phần, mà dải nền
        // thanh dưới che khoảng 100 pt cuối màn, nên cú chạm rơi vào dải nền. Cuộn tới khi cả
        // khung nút nằm trên thanh dưới.
        let bottom = app.windows.firstMatch.frame.maxY - 100
        var swipes = 0
        while swipes < 4, !target.isHittable || target.frame.maxY > bottom {
            app.swipeUp(velocity: .slow)
            swipes += 1
        }
        guard target.isHittable else {
            XCTFail("nút \(identifier) không vào được khung nhìn", file: file, line: line)
            return
        }
        target.tap()
    }

    /// Chạm một món trên kệ rồi kiểm món đã lên mâm (chạm lại món đã có trên mâm là bỏ nó ra,
    /// nên một cú chạm trượt không được lọt qua).
    private func tapShelf(_ app: XCUIApplication, _ key: String, file: StaticString = #filePath, line: UInt = #line) {
        tapElement(app, "lesson.shelf.\(key)", file: file, line: line)
        XCTAssertTrue(app.buttons["lesson.tray.\(key)"].firstMatch.waitForExistence(timeout: 3),
                      "món \(key) không lên mâm", file: file, line: line)
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
