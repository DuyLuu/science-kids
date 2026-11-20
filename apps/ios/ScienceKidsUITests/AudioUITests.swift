import XCTest

/// SK-016: the voice of lesson 1 on the simulator, read through the debug probe (`-SKAudioProbe
/// YES`: an accessibility element `debug.audio` whose value is the voice player's record as JSON).
/// The simulator plays the clips for real; a UI test cannot hear them, so it checks that each one
/// started (`sounded`), that none failed (missing, refused by the pack check, not decodable), and
/// that two never sounded at once (`maxPlaying`).
///
/// Needs the content pack in the build (`content/.build/pack`); skipped otherwise.
@MainActor
final class AudioUITests: XCTestCase {
    private var fixture: LessonFixture!

    override func setUp() async throws {
        continueAfterFailure = false
        XCUIDevice.shared.orientation = .portrait
        fixture = try LessonFixture.load()
    }

    // MARK: - Probe

    struct Probe: Decodable, CustomStringConvertible {
        struct Stats: Decodable {
            let requested: Int
            let sounded: [String]
            let finished: [String]
            let interrupted: [String]
            let heard: [String]
            let failed: [String]
            let autoplayed: [String]
            let autoplaySkipped: [String]
            let maxPlaying: Int
        }

        let speaking: String?
        let stats: Stats

        var description: String {
            // SK-060 finding 6: `requested` and `interrupted` tell a dropped tap (requested unchanged)
            // from a voice stopped before it sounded (the id in `interrupted`).
            "speaking \(speaking ?? "-"), requested \(stats.requested), sounded \(stats.sounded.suffix(5)), finished \(stats.finished.suffix(5)), "
                + "interrupted \(stats.interrupted.suffix(5)), failed \(stats.failed), autoplayed \(stats.autoplayed.suffix(3)), skipped \(stats.autoplaySkipped), maxPlaying \(stats.maxPlaying)"
        }
    }

    private func probe(_ app: XCUIApplication, file: StaticString = #filePath, line: UInt = #line) -> Probe {
        let element = app.descendants(matching: .any)["debug.audio"].firstMatch
        XCTAssertTrue(element.waitForExistence(timeout: 5), "no audio probe", file: file, line: line)
        let value = element.value as? String ?? ""
        do {
            return try JSONDecoder().decode(Probe.self, from: Data(value.utf8))
        } catch {
            XCTFail("probe value is not JSON: \(value)", file: file, line: line)
            return Probe(speaking: nil, stats: .init(requested: 0, sounded: [], finished: [], interrupted: [], heard: [], failed: [], autoplayed: [], autoplaySkipped: [], maxPlaying: 0))
        }
    }

    /// Polls the probe until `condition` holds.
    @discardableResult
    private func waitProbe(_ app: XCUIApplication, timeout: TimeInterval = 6, _ what: String, file: StaticString = #filePath, line: UInt = #line, until condition: (Probe) -> Bool) -> Probe {
        let deadline = Date().addingTimeInterval(timeout)
        var last = probe(app, file: file, line: line)
        while Date() < deadline {
            if condition(last) { return last }
            usleep(100_000)
            last = probe(app, file: file, line: line)
        }
        XCTFail("\(what): \(last)", file: file, line: line)
        return last
    }

    // MARK: - Flow helpers

    private func launch(reset: Bool = true, extra: [String] = []) throws -> XCUIApplication {
        let app = XCUIApplication()
        var arguments = ["-AppleLanguages", "(vi)", "-AppleLocale", "vi_VN", "-SKReduceMotion", "YES", "-SKAudioProbe", "YES", "-SKSyncOff", "YES"]
        if reset { arguments += ["-SKResetProfile", "YES"] }
        app.launchArguments = arguments + PlayDrag.noHint + extra
        app.launch()
        return app
    }

    private func element(_ app: XCUIApplication, _ identifier: String) -> XCUIElement {
        app.descendants(matching: .any)[identifier].firstMatch
    }

    /// Song ngữ, then the voice chip `voice` (`en`, `vi`, `both`).
    private func createProfile(_ app: XCUIApplication, voice: String) {
        XCTAssertTrue(app.buttons["welcome.mode.bilingual"].waitForExistence(timeout: 15), "Welcome did not open")
        app.buttons["welcome.mode.bilingual"].tap()
        app.buttons["welcome.next"].tap()
        let field = app.textFields["profile.name"]
        XCTAssertTrue(field.waitForExistence(timeout: 5))
        field.tap()
        field.typeText("Minh")
        app.buttons["profile.avatar.ech"].tap()
        app.buttons["profile.grade.3"].tap()
        app.buttons["profile.voice.\(voice)"].tap()
        XCTAssertTrue(app.buttons["profile.voice.\(voice)"].isSelected, "voice \(voice) not chosen")
        app.buttons["profile.start"].tap()
        XCTAssertTrue(app.staticTexts["home.greeting"].waitForExistence(timeout: 10), "Home did not open")
    }

    /// The fixture lesson, through its topic (SK-035 tester #1).
    private func startLesson(_ app: XCUIApplication, file: StaticString = #filePath, line: UInt = #line) {
        fixture.open(in: app, file: file, line: line)
    }

    /// The pack must be in the build: the first question has its listen button.
    private func requirePack(_ app: XCUIApplication) throws {
        guard app.buttons["listen.question.w1"].waitForExistence(timeout: 5) else {
            throw XCTSkip("no content pack in this build (content/.build/pack): no audio to test")
        }
    }

    /// The main button at the bottom covers the end of the scroll: scroll until `target` is clear of it.
    private func reveal(_ app: XCUIApplication, _ target: XCUIElement) {
        let window = app.windows.firstMatch.frame
        for _ in 0..<6 {
            if target.isHittable, target.frame.maxY < window.maxY - 150, target.frame.minY > window.minY + 40 { return }
            if target.frame.minY <= window.minY + 40 {
                app.swipeDown(velocity: .slow)
            } else {
                app.swipeUp(velocity: .slow)
            }
        }
    }

    private func tap(_ app: XCUIApplication, _ identifier: String, file: StaticString = #filePath, line: UInt = #line) {
        let target = app.buttons[identifier].firstMatch
        guard target.waitForExistence(timeout: 5) else {
            let shown = app.buttons.allElementsBoundByIndex.map { "\($0.identifier)『\($0.label)』" }
            XCTFail("no button \(identifier); buttons: \(shown)", file: file, line: line)
            return
        }
        reveal(app, target)
        target.tap()
    }

    private var listened: [String] = []
    private var words: [String] = []

    /// Taps a listen button and waits until its utterance sounds.
    /// `button`: the speaker's identifier when it is not `listen.<id>`. Chơi's bubble speaker is
    /// `lesson.explorer.listen`; `lesson.play.message` is the bubble itself (SK-060, app finding 5).
    private func listen(_ app: XCUIApplication, _ id: String, button: String? = nil, file: StaticString = #filePath, line: UInt = #line) {
        let before = probe(app).stats.sounded.count
        tap(app, button ?? "listen.\(id)", file: file, line: line)
        waitProbe(app, "listen.\(id) did not sound", file: file, line: line) { $0.stats.sounded.count > before && $0.stats.sounded.last == id }
        listened.append(id)
    }

    /// Every listen button on screen now, top to bottom (the "VI" second-voice buttons aside).
    private func listenToAll(_ app: XCUIApplication, required: Bool = true, file: StaticString = #filePath, line: UInt = #line) {
        let ids = app.buttons.matching(NSPredicate(format: "identifier BEGINSWITH %@", "listen."))
            .allElementsBoundByIndex.map { String($0.identifier.dropFirst("listen.".count)) }
            .filter { !$0.hasPrefix("vi.") }
        if required { XCTAssertFalse(ids.isEmpty, "no listen button here", file: file, line: line) }
        for id in ids { listen(app, id, file: file, line: line) }
    }

    /// SK-060, A2 (SK-043/044): a wrong try (a tap answers; multi choice: every card chosen says
    /// its name, then "Xong"), whose word and feedback play as `answer.<key>.1` and replay on the
    /// slip (`retry.<key>`); then the right answer (`answer.<key>.2`) and the explanation's speaker.
    private func answerAndListen(_ app: XCUIApplication, _ question: LessonFixture.Question, hintOpen: Bool = false, file: StaticString = #filePath, line: UInt = #line) {
        let key = question.key
        if question.format == "multi_choice" {
            let all = keys(app, prefix: "lesson.choice.")
            for option in all { say(app, button: "lesson.choice.\(option)", as: "word.\(option)", file: file, line: line) }
            for option in all where !question.right.contains(option) { tap(app, "lesson.choice.\(option)", file: file, line: line) }
            say(app, button: "lesson.check", as: "answer.\(key).1", file: file, line: line)
        } else if question.format == "true_false" {
            // One try for true/false (`rules.json` max_tries_by_format): the right tap says itself.
            say(app, button: A2Lesson.answerID(question.format, question.right[0]), as: "answer.\(key).1", file: file, line: line)
        } else {
            say(app, button: A2Lesson.answerID(question.format, question.wrongs[0][0]), as: "answer.\(key).1", file: file, line: line)
            if hintOpen {
                // SK-047 `h-sc-open`: with the hint open the slip shows only an option's `feedback`.
                if element(app, "lesson.hint").waitForExistence(timeout: 3) { listen(app, "retry.\(key)", file: file, line: line) }
            } else {
                XCTAssertTrue(element(app, "lesson.hint").waitForExistence(timeout: 10), "\(key): no slip after the wrong try", file: file, line: line)
                listen(app, "retry.\(key)", file: file, line: line)
            }
            say(app, button: A2Lesson.answerID(question.format, question.right[0]), as: "answer.\(key).2", file: file, line: line)
        }
        A2Lesson.waitResult(app, key, file: file, line: line)
        listen(app, "explanation.\(key).correct", file: file, line: line)
        A2Lesson.next(app, file: file, line: line)
    }

    /// Taps a word (answer, food, group, new word) and waits until it says itself.
    private func say(_ app: XCUIApplication, button identifier: String, as id: String, file: StaticString = #filePath, line: UInt = #line) {
        let before = probe(app).stats.sounded.count
        tap(app, identifier, file: file, line: line)
        waitProbe(app, "\(identifier) did not say \(id)", file: file, line: line) { $0.stats.sounded.count > before && $0.stats.sounded.last == id }
        words.append(id)
    }

    private func keys(_ app: XCUIApplication, prefix: String) -> [String] {
        app.buttons.matching(NSPredicate(format: "identifier BEGINSWITH %@", prefix))
            .allElementsBoundByIndex.map { String($0.identifier.dropFirst(prefix.count)) }
    }

    private func shot(_ name: String) throws {
        guard let directory = ProcessInfo.processInfo.environment["SK_SCREENSHOT_DIR"], !directory.isEmpty else { return }
        let device = (ProcessInfo.processInfo.environment["SIMULATOR_DEVICE_NAME"] ?? "device")
            .lowercased().replacingOccurrences(of: " ", with: "-")
            .replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")
        sleep(1)
        try XCUIScreen.main.screenshot().pngRepresentation
            .write(to: URL(fileURLWithPath: directory).appendingPathComponent("\(device)-audio-\(name).png"))
    }

    // MARK: - Acceptance

    /// Listen buttons of the `en` walk, for the `vi` walk to compare (tests run in name order:
    /// English before Vietnamese).
    private static var englishListenButtons: Set<String>?

    /// SK-016 criterion 2: voice `en`, the whole of lesson 1, every listen button and every word
    /// that says itself on the six screens. Each one sounds; no clip fails; never two voices at once.
    func testEveryListenButtonAndWordSpeaksEnglish() throws {
        let final = try walkLesson(voice: "en")
        XCTAssertTrue(final.stats.heard.allSatisfy { $0.hasPrefix("en:") }, "voice en plays English only")
        Self.englishListenButtons = Set(listened)
    }

    /// SK-025 criterion 3: voice `vi`, the same walk. Every clip that sounds is Vietnamese, none
    /// fails, there are as many listen buttons as for `en`, and "Từ mới" are buttons. Replaces
    /// `testViPlaysNothingAndKeepsTheText` (SK-016: no VI voice yet, so no listen button and nothing
    /// played), which no longer holds now that the pack has VI clips.
    func testEveryListenButtonAndWordSpeaksVietnamese() throws {
        let final = try walkLesson(voice: "vi")
        XCTAssertTrue(final.stats.heard.allSatisfy { $0.hasPrefix("vi:") }, "voice vi plays Vietnamese only: \(final.stats.heard.filter { !$0.hasPrefix("vi:") })")
        let expected = Self.englishListenButtons ?? []
        if expected.isEmpty {
            // The en walk did not run first: SK-016 counted 33 listen buttons.
            XCTAssertEqual(Set(listened).count, 33, "as many listen buttons as voice en (SK-016: 33)")
        } else {
            XCTAssertEqual(Set(listened), expected, "the same listen buttons as voice en")
        }
        XCTAssertFalse(newWords.isEmpty, "Từ mới are buttons that say themselves")
    }

    private var newWords: [String] = []

    /// Lesson 1 in voice `voice`, every listen button and every word that says itself on the six
    /// screens; returns the probe at the end. No clip fails; never two voices at once.
    private func walkLesson(voice: String) throws -> Probe {
        listened = []
        words = []
        newWords = []
        let app = try launch()
        createProfile(app, voice: voice)
        startLesson(app)
        try requirePack(app)

        // Khởi động opens and says its question by itself.
        waitProbe(app, "w1 did not play by itself") { $0.stats.autoplayed.contains("question.w1") }

        // Khởi động 1 (fill the blank, a tap answers): wrong → the word, then the feedback and the
        // hint in one utterance (SK-043/044: `answer.<key>.<try>`), the slip's speaker says them
        // again (`retry.<key>`); then right → the word and the explanation.
        let w1 = fixture.warmup[0]
        listenToAll(app)
        answerAndListen(app, w1)

        // Khởi động 2 (true/false with the app's nod and shake: no name, the line only).
        let w2 = fixture.warmup[1]
        waitProbe(app, "w2 did not play by itself") { $0.stats.autoplayed.contains("question.w2") }
        listenToAll(app)
        answerAndListen(app, w2)

        // Học (SK-043): a picture book; each page says its group (name, sentence, examples) by
        // itself and on its speaker; the last page has the new words, each says itself.
        XCTAssertTrue(element(app, "lesson.learn.page").waitForExistence(timeout: 5))
        try shot("\(voice)-09-learn")
        for group in fixture.exploreGroups {
            XCTAssertTrue(element(app, "lesson.learn.group.\(group)").waitForExistence(timeout: 5), "no Học page for \(group)")
            waitProbe(app, "Học page \(group) did not play by itself") { $0.stats.autoplayed.contains("learn.explore.\(group)") }
            listen(app, "learn.explore.\(group)")
            tap(app, "lesson.explorer.next")
        }
        for key in keys(app, prefix: "lesson.word_list.") {
            say(app, button: "lesson.word_list.\(key)", as: "word.\(key)")
            newWords.append(key)
        }
        try shot("\(voice)-09-learn-words")
        tap(app, "lesson.explorer.next")

        // Chơi: the mascot's message by itself and by its button; every food on the shelf and on the tray.
        XCTAssertTrue(element(app, "lesson.play.message").waitForExistence(timeout: 5))
        waitProbe(app, "Chơi message did not play by itself") { $0.stats.autoplayed.contains("play.message") }
        listen(app, "play.message", button: "lesson.explorer.listen")
        // SK-059: a tap on a shelf picture opens it big and says its name; the drag picks.
        for key in keys(app, prefix: "lesson.shelf.") {
            say(app, button: "lesson.shelf.\(key)", as: "play.name.\(key)")
            tap(app, "lesson.play.zoom.close")
        }
        for food in fixture.balancedTray { PlayDrag.pick(app, food) }
        listen(app, "play.message", button: "lesson.explorer.listen")
        try shot("\(voice)-10-play-balanced")
        tap(app, "lesson.play.done")

        // Quiz: the question by itself and by its button, "Gợi ý" (SK-047: the button says the hint), a
        // wrong try and the right one (multi choice: every card says its name as it is chosen), the
        // explanation.
        for question in fixture.quiz {
            A2Lesson.waitQuiz(app)
            waitProbe(app, "\(question.key) did not play by itself") { $0.stats.autoplayed.contains("question.\(question.key)") }
            listen(app, "question.\(question.key)")
            say(app, button: "lesson.hint.button", as: "hint.\(question.key)")
            // SK-047 `h-sc-open`: the slip has no speaker of its own (the button said it); only the
            // "VI" button in "Cả hai".
            XCTAssertTrue(element(app, "lesson.hint.slip").waitForExistence(timeout: 5), "\(question.key): the hint slip did not open")
            if question.key == "q6" { try shot("\(voice)-12-quiz-myth") }
            answerAndListen(app, question, hintOpen: true)
            if question.key == "q5" { try shot("\(voice)-11-quiz-result") }
        }

        // Tổng kết (SK-047): page 1 reads its key points by itself; every speaker on both pages.
        XCTAssertTrue(element(app, "lesson.recap.key_point.1").waitForExistence(timeout: 10), "Tổng kết did not open")
        waitProbe(app, "Tổng kết did not play by itself") { !$0.stats.autoplayed.filter { $0.hasPrefix("recap.") }.isEmpty }
        listenToAll(app, required: false)
        tap(app, "lesson.recap.next")
        XCTAssertTrue(element(app, "lesson.recap.objective").waitForExistence(timeout: 5))
        listenToAll(app, required: false)
        tap(app, "lesson.recap.to_reward")

        // Thưởng: nothing by itself; the card's speaker says its name and its fact.
        XCTAssertTrue(element(app, "lesson.reward.title").waitForExistence(timeout: 10))
        listen(app, "reward.card")
        try shot("\(voice)-13-reward")

        let final = probe(app)
        XCTAssertTrue(final.stats.failed.isEmpty, "clips that did not play: \(final.stats.failed)")
        XCTAssertEqual(final.stats.maxPlaying, 1, "two voices at once")
        let heard = Set(final.stats.heard)
        let languages = Dictionary(grouping: final.stats.heard) { String($0.prefix(while: { $0 != ":" })) }.mapValues(\.count)
        print("audio walk [\(voice)]: \(listened.count) listen taps (\(Set(listened).count) buttons), \(words.count) word taps (\(Set(words).count) words, \(newWords.count) new words), "
            + "\(final.stats.autoplayed.count) autoplays, \(final.stats.heard.count) clips started \(languages.sorted { $0.key < $1.key }), \(heard.count) different strings, "
            + "failed \(final.stats.failed.count), maxPlaying \(final.stats.maxPlaying)")
        print("audio walk [\(voice)] listen buttons: \(Set(listened).sorted().joined(separator: ", "))")
        print("audio walk [\(voice)] strings heard: \(heard.sorted().joined(separator: " | "))")
        return final
    }

    /// SK-025 criterion 4a, as SK-042 changed it (Duy 13/11): voice `both` ("Cả hai") says English
    /// by itself and on the main listen button ("Pick the missing word", then the sentence), then
    /// stops; Vietnamese plays only on the small "VI" button next to it. Nothing fails, never two
    /// voices at once.
    func testBothPlaysEnglishThenVietnamesePerString() throws {
        let app = try launch()
        createProfile(app, voice: "both")
        startLesson(app)
        try requirePack(app)
        func languages(_ probe: Probe) -> [String] { probe.stats.heard.map { String($0.prefix(while: { $0 != ":" })) } }
        let done = waitProbe(app, timeout: 40, "w1 did not finish") { $0.stats.finished.contains("question.w1") }
        XCTAssertTrue(done.stats.failed.isEmpty, "\(done.stats.failed)")
        XCTAssertEqual(languages(done), ["en", "en"], "\(done.stats.heard)")
        XCTAssertNil(done.speaking, "nothing after the last EN clip")
        XCTAssertEqual(done.stats.maxPlaying, 1)
        print("both w1 by itself: heard \(done.stats.heard), finished \(done.stats.finished), maxPlaying \(done.stats.maxPlaying)")
        listen(app, "question.w1")
        let again = waitProbe(app, timeout: 40, "w1 did not finish again") { $0.stats.finished.filter { $0 == "question.w1" }.count == 2 }
        XCTAssertTrue(again.stats.failed.isEmpty)
        XCTAssertEqual(languages(again), ["en", "en", "en", "en"], "the listen button plays the same two EN clips: \(again.stats.heard)")
        tap(app, "listen.vi.question.w1")
        let vi = waitProbe(app, timeout: 40, "the VI button did not play") { $0.stats.heard.count >= 6 && $0.speaking == nil }
        XCTAssertTrue(vi.stats.failed.isEmpty)
        XCTAssertEqual(Array(languages(vi).suffix(2)), ["vi", "vi"], "the VI button plays the two VI clips: \(vi.stats.heard)")
        XCTAssertEqual(vi.stats.maxPlaying, 1)
        print("both w1 VI button: \(vi)")
    }

    /// SK-016 criterion 4: five foods tapped fast (each says its name): only the last plays to its
    /// end, never two at once.
    func testFiveFastTapsPlayOnlyTheLast() throws {
        try fiveFastTaps(voice: "en")
    }

    /// SK-025 criterion 4b: the same with voice `both` (each food says EN then VI).
    func testBothFiveFastTapsPlayOnlyTheLast() throws {
        try fiveFastTaps(voice: "both")
    }

    private func fiveFastTaps(voice: String) throws {
        let app = try launch()
        createProfile(app, voice: voice)
        startLesson(app)
        try requirePack(app)
        for question in fixture.warmup {
            A2Lesson.answer(question, question.right, in: app)
            A2Lesson.next(app)
        }
        A2Lesson.learn(app)
        // Chơi: SK-059 a shelf tap opens a modal big view, so the fast taps go to the group chips
        // (each says its group's name): every chip, fast.
        XCTAssertTrue(element(app, "lesson.play.message").waitForExistence(timeout: 5))
        let chips = keys(app, prefix: "lesson.meter.")
        XCTAssertGreaterThanOrEqual(chips.count, 3)
        let five = chips
        for key in five { XCTAssertTrue(app.buttons["lesson.meter.\(key)"].isHittable, key) }
        let targets = five.map { app.buttons["lesson.meter.\($0)"].coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5)) }
        let before = probe(app)
        for target in targets { target.tap() }
        let last = "play.group.\(five[five.count - 1])"
        let after = waitProbe(app, timeout: 10, "the last word did not finish") { $0.stats.finished.last == last && $0.speaking == nil }
        let newFinished = Array(after.stats.finished.dropFirst(before.stats.finished.count))
        let earlier = Set(five.dropLast().map { "play.group.\($0)" })
        XCTAssertTrue(newFinished.allSatisfy { !earlier.contains($0) }, "an earlier tap played to its end: \(newFinished)")
        XCTAssertEqual(after.stats.maxPlaying, 1, "two voices at once")
        XCTAssertTrue(after.stats.failed.isEmpty)
        let newSounded = Array(after.stats.sounded.dropFirst(before.stats.sounded.count))
        print("five fast taps [\(voice)]: sounded \(newSounded), interrupted \(after.stats.interrupted.suffix(5)), finished \(newFinished), maxPlaying \(after.stats.maxPlaying)")
    }

    /// Criterion 5: VoiceOver on (forced: the simulator has no VoiceOver): screens open silent, the
    /// listen buttons still play.
    func testVoiceOverStopsAutoplayOnly() throws {
        let app = try launch(extra: ["-SKAssumeVoiceOver", "YES"])
        createProfile(app, voice: "en")
        startLesson(app)
        try requirePack(app)
        let opened = waitProbe(app, "w1 autoplay not skipped") { $0.stats.autoplaySkipped.contains("question.w1") }
        XCTAssertTrue(opened.stats.sounded.isEmpty, "something played by itself: \(opened)")
        XCTAssertTrue(opened.stats.autoplayed.isEmpty)
        listen(app, "question.w1")
        A2Lesson.answer(fixture.warmup[0], fixture.warmup[0].right, in: app)
        A2Lesson.next(app)
        let w2 = waitProbe(app, "w2 autoplay not skipped") { $0.stats.autoplaySkipped.contains("question.w2") }
        XCTAssertTrue(w2.stats.autoplayed.isEmpty)
        listen(app, "question.w2")
        print("VoiceOver: skipped \(w2.stats.autoplaySkipped), sounded \(probe(app).stats.sounded)")
    }
}
