import XCTest

/// SK-022 against the real Supabase staging of the build (`Config/Local.xcconfig`): guest session,
/// profile, lesson attempts, `get_home`. Read through the debug probe (`-SKSyncProbe YES`: an
/// accessibility element `debug.sync`, JSON). Skipped when the build has no server.
///
/// These tests write test data to staging (a guest user, its profile, its attempts). The guest
/// session lives in the simulator's Keychain, so every run on one simulator is the same guest;
/// `xcrun simctl keychain <device> reset` starts a new one.
@MainActor
final class SyncUITests: XCTestCase {
    private var fixture: LessonFixture!

    override func setUp() async throws {
        continueAfterFailure = false
        XCUIDevice.shared.orientation = .portrait
        fixture = try LessonFixture.load()
    }

    struct Probe: Decodable, CustomStringConvertible {
        let phase: String
        let queued: Int
        let user: String?
        let profile: String?
        let profileSameId: Bool?
        let acknowledged: Int
        let rejected: Int
        let homeToday: String?
        let homeStars: Int?
        let homeStreak: Int?
        let homeAttempts: Int?
        let shownStars: Int?
        let shownStreak: Int?
        let shownSource: String?

        var description: String {
            "phase \(phase), queued \(queued), user \(user ?? "-"), profile \(profile ?? "-") sameId \(profileSameId.map(String.init) ?? "-"), "
                + "acknowledged \(acknowledged), rejected \(rejected), home today \(homeToday ?? "-") stars \(homeStars.map(String.init) ?? "-") "
                + "streak \(homeStreak.map(String.init) ?? "-") attempts \(homeAttempts.map(String.init) ?? "-"), "
                + "shown stars \(shownStars.map(String.init) ?? "-") streak \(shownStreak.map(String.init) ?? "-") from \(shownSource ?? "-")"
        }
    }

    private func probe(_ app: XCUIApplication) -> Probe? {
        let element = app.descendants(matching: .any)["debug.sync"].firstMatch
        guard element.waitForExistence(timeout: 5), let value = element.value as? String else { return nil }
        return try? JSONDecoder().decode(Probe.self, from: Data(value.utf8))
    }

    @discardableResult
    private func waitProbe(_ app: XCUIApplication, timeout: TimeInterval = 30, _ what: String, file: StaticString = #filePath, line: UInt = #line, until condition: (Probe) -> Bool) -> Probe? {
        let deadline = Date().addingTimeInterval(timeout)
        var last = probe(app)
        while Date() < deadline {
            if let last, condition(last) { return last }
            usleep(300_000)
            last = probe(app)
        }
        XCTFail("\(what): \(last.map(String.init(describing:)) ?? "no probe")", file: file, line: line)
        return last
    }

    private func launch(reset: Bool, extra: [String] = []) -> XCUIApplication {
        let app = XCUIApplication()
        var arguments = ["-AppleLanguages", "(vi)", "-AppleLocale", "vi_VN", "-SKReduceMotion", "YES", "-SKSyncProbe", "YES"]
        if reset { arguments += ["-SKResetProfile", "YES"] }
        app.launchArguments = arguments + extra
        app.launch()
        return app
    }

    private func requireServer(_ app: XCUIApplication) throws {
        let value = app.descendants(matching: .any)["debug.sync"].firstMatch
        guard value.waitForExistence(timeout: 10), let probe = probe(app), probe.phase != "off" else {
            throw XCTSkip("no Supabase URL and key in this build (Config/Local.xcconfig)")
        }
    }

    // MARK: Lesson driver (as LessonUITests)

    private func element(_ app: XCUIApplication, _ identifier: String) -> XCUIElement {
        app.descendants(matching: .any)[identifier].firstMatch
    }

    private func tap(_ app: XCUIApplication, _ identifier: String, file: StaticString = #filePath, line: UInt = #line) {
        let target = app.buttons[identifier].firstMatch
        XCTAssertTrue(target.waitForExistence(timeout: 5), "no button \(identifier)", file: file, line: line)
        target.tap()
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
        app.buttons["profile.voice.en"].tap()
        app.buttons["profile.start"].tap()
        XCTAssertTrue(app.staticTexts["home.greeting"].waitForExistence(timeout: 10), "Home did not open")
    }

    private func answer(_ question: LessonFixture.Question, check: Bool, in app: XCUIApplication) {
        for key in question.right {
            switch question.format {
            case "true_false": tap(app, "lesson.tf.\(key)")
            case "fill_blank_bank": tap(app, "lesson.word.\(key)")
            default: tap(app, "lesson.option.\(key)")
            }
        }
        if check { tap(app, "lesson.check") }
        tap(app, "lesson.result.next")
    }

    /// Lesson 1 all right on the first try; returns the stars label of Thưởng.
    private func playLesson(_ app: XCUIApplication) -> String {
        // SK-035 tester #1: the fixture lesson through its topic, not the Home card.
        fixture.open(in: app)
        for question in fixture.warmup { answer(question, check: false, in: app) }
        XCTAssertTrue(element(app, "lesson.learn.seen").waitForExistence(timeout: 5))
        for group in fixture.exploreGroups.dropFirst() { tap(app, "lesson.group.\(group)") }
        tap(app, "lesson.learn.next")
        for food in fixture.balancedTray { tap(app, "lesson.shelf.\(food)") }
        tap(app, "lesson.play.done")
        for question in fixture.quiz { answer(question, check: true, in: app) }
        XCTAssertTrue(element(app, "lesson.reward.title").waitForExistence(timeout: 5), "Thưởng did not open")
        return element(app, "lesson.reward.stars").label
    }

    private func stars(in label: String) -> Int? {
        // "Được 2 trên 3 sao"
        label.split(separator: " ").compactMap { Int($0) }.first
    }

    // MARK: Acceptance

    /// Criteria 2 and 3: a profile made on the device reaches the server; a lesson played online
    /// reaches it, with the stars Thưởng showed.
    func testProfileAndLessonReachTheServer() throws {
        let app = launch(reset: true)
        try requireServer(app)
        createProfile(app)
        let linked = waitProbe(app, "profile not on the server") {
            ($0.profile == "linked" || $0.profile == "adopted") && $0.homeAttempts != nil
        }
        print("sync after profile: \(linked.map(String.init(describing:)) ?? "-")")
        let before = linked?.homeAttempts ?? 0

        let starsLabel = playLesson(app)
        let shownStars = stars(in: starsLabel)
        print("sync reward: \(starsLabel)")
        tap(app, "lesson.reward.home")
        XCTAssertTrue(app.staticTexts["home.greeting"].waitForExistence(timeout: 5))
        let synced = waitProbe(app, "lesson not on the server") {
            $0.queued == 0 && $0.phase == "synced" && ($0.homeAttempts ?? 0) == before + 1
        }
        print("sync after lesson: \(synced.map(String.init(describing:)) ?? "-")")
        XCTAssertEqual(synced?.homeStars, shownStars, "server stars = Thưởng stars (one lesson played)")
        XCTAssertEqual(synced?.shownSource, "server", "Home shows the server's numbers once nothing waits")
        XCTAssertGreaterThanOrEqual(synced?.homeStreak ?? 0, 1)
        XCTAssertEqual(element(app, "home.stars").label.contains("\(synced?.shownStars ?? -1)"), true, element(app, "home.stars").label)
    }

    /// Criterion 4 (T2): no network → the lesson plays and Thưởng shows; network back, app opened
    /// again → the attempt reaches the server once; sent 3 more times → still once.
    func testOfflineThenOnlineThenResend() throws {
        let offline = launch(reset: true, extra: ["-SKSyncUnreachable", "YES"])
        try requireServer(offline)
        createProfile(offline)
        let starsLabel = playLesson(offline)
        XCTAssertNotNil(stars(in: starsLabel), "Thưởng shows its stars offline: \(starsLabel)")
        tap(offline, "lesson.reward.home")
        let waiting = waitProbe(offline, "attempt not queued") { $0.queued == 1 && $0.phase.hasPrefix("waiting") }
        print("sync offline: \(waiting.map(String.init(describing:)) ?? "-")")
        XCTAssertEqual(waiting?.shownSource, "device", "offline Home shows the device's numbers")
        offline.terminate()

        let online = launch(reset: false)
        let sent = waitProbe(online, "queued attempt not sent once online") { $0.queued == 0 && $0.phase == "synced" && $0.homeAttempts != nil }
        print("sync back online: \(sent.map(String.init(describing:)) ?? "-")")
        let attempts = sent?.homeAttempts
        let acknowledged = sent?.acknowledged
        online.terminate()

        let resend = launch(reset: false, extra: ["-SKResendLastAttempt", "3"])
        sleep(8)
        let after = waitProbe(resend, "resend did not settle") { $0.queued == 0 && $0.phase == "synced" }
        print("sync after 3 resends: \(after.map(String.init(describing:)) ?? "-")")
        XCTAssertEqual(after?.homeAttempts, attempts, "the same attempt 3 more times: still one row")
        XCTAssertEqual(after?.acknowledged, acknowledged)
    }
}
