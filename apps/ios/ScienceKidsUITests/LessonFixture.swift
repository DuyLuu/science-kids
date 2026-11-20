import Foundation
import XCTest

/// Lesson 1 and the rules, read from the repo (`packages/content-schema/fixtures`, `content/rules.json`)
/// through `#filePath`, the files the app bundles. The tests take the right and wrong answers and
/// the expected texts from here, so no lesson text is written in the tests either.
///
/// SK-035 (tester 10/11 #1): the tests open this lesson through its topic (`open(in:)`), where the
/// syllabus (`content/syllabus.json`) puts it. "Học tiếp" on Home opens the first written lesson
/// of the journey, which is another lesson since SK-031 wrote Discoverer #1 and will move again as
/// content is written.
struct LessonFixture {
    struct Question {
        let key: String
        let format: String
        /// Keys (choices, bank words) or `"true"` / `"false"` that answer it right.
        let right: [String]
        /// Two different wrong answers, for two wrong tries.
        let wrongs: [[String]]
        let hintEN: String
        let hintVI: String
        let explanationWrongEN: String
    }

    let warmup: [Question]
    let quiz: [Question]
    /// One food per required group, in `groups` order: a balanced tray.
    let balancedTray: [String]
    /// Tray texts by message key (`start`, `full`, `balanced`, `has_limited`, `missing.<group>`), EN.
    let trayMessagesEN: [String: String]
    /// Keys of the explore groups.
    let exploreGroups: [String]
    /// Names of Chơi's tray groups, EN and VI (the group chips `lesson.meter.*` print one of them).
    let trayGroupLabels: Set<String>
    let xpPerCorrect: Int
    let xpLessonComplete: Int
    let xpGameComplete: Int
    let passNum: Int
    let passDen: Int
    /// The syllabus topic that holds the lesson (`healthy-eating`) and its number there (2).
    let topicKey: String
    let lessonNumber: Int

    static func load(file: String = #filePath) throws -> LessonFixture {
        let lessonURL = try find("packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json", from: file)
        let rulesURL = try find("content/rules.json", from: file)
        let lesson = try object(Data(contentsOf: lessonURL))
        let rules = try object(Data(contentsOf: rulesURL))
        let syllabus = try object(Data(contentsOf: try find("content/syllabus.json", from: file)))
        let lessonID = (lesson["id"] as? String ?? "").lowercased()
        var place: (topic: String, number: Int)?
        for group in syllabus["groups"] as? [[String: Any]] ?? [] {
            for topic in group["topics"] as? [[String: Any]] ?? [] {
                for entry in topic["lessons"] as? [[String: Any]] ?? []
                where (entry["lesson_id"] as? String)?.lowercased() == lessonID {
                    place = (topic["key"] as? String ?? "", entry["number"] as? Int ?? 0)
                }
            }
        }
        guard let place else {
            throw NSError(domain: "LessonFixture", code: 2, userInfo: [NSLocalizedDescriptionKey: "lesson \(lessonID) is in no topic of content/syllabus.json"])
        }
        let discoverer = rules["discoverer"] as? [String: Any] ?? [:]
        let play = lesson["play"] as? [String: Any] ?? [:]
        let groups = play["groups"] as? [[String: Any]] ?? []
        let items = play["items"] as? [[String: Any]] ?? []
        let balanced = groups.filter { $0["role"] as? String == "required" }.compactMap { group in
            items.first { $0["group"] as? String == group["key"] as? String }?["key"] as? String
        }
        let messages = play["messages"] as? [String: Any] ?? [:]
        var texts: [String: String] = [:]
        for key in ["start", "full", "balanced", "has_limited"] {
            texts[key] = (messages[key] as? [String: Any])?["en"] as? String
        }
        // Discoverer A2 (`play-start`): an empty tray prints the block's prompt, not `messages.start`.
        texts["prompt"] = (play["prompt"] as? [String: Any])?["en"] as? String
        for (group, text) in messages["missing"] as? [String: Any] ?? [:] {
            texts["missing.\(group)"] = (text as? [String: Any])?["en"] as? String
        }
        let explore = (lesson["learn"] as? [[String: Any]] ?? []).first { $0["type"] as? String == "explore_groups" }
        let threshold = discoverer["pass_threshold"] as? [String: Any] ?? [:]
        return LessonFixture(
            warmup: (lesson["warmup"] as? [[String: Any]] ?? []).map(question),
            quiz: (lesson["quiz"] as? [[String: Any]] ?? []).map(question),
            balancedTray: balanced,
            trayMessagesEN: texts,
            exploreGroups: (explore?["groups"] as? [[String: Any]] ?? []).compactMap { $0["key"] as? String },
            trayGroupLabels: Set(groups.flatMap { group -> [String] in
                let label = group["label"] as? [String: Any] ?? [:]
                return [label["en"] as? String, label["vi"] as? String].compactMap { $0 }
            }),
            xpPerCorrect: discoverer["xp_per_correct"] as? Int ?? 0,
            xpLessonComplete: discoverer["xp_lesson_complete"] as? Int ?? 0,
            xpGameComplete: discoverer["xp_game_complete"] as? Int ?? 0,
            passNum: threshold["num"] as? Int ?? 0,
            passDen: threshold["den"] as? Int ?? 1,
            topicKey: place.topic,
            lessonNumber: place.number
        )
    }

    private static func question(_ item: [String: Any]) -> Question {
        let format = item["format"] as? String ?? ""
        let options = item["options"] as? [[String: Any]] ?? []
        let rightOptions = options.filter { $0["correct"] as? Bool == true }.compactMap { $0["key"] as? String }
        let wrongOptions = options.filter { $0["correct"] as? Bool == false }.compactMap { $0["key"] as? String }
        var right: [String] = []
        var wrongs: [[String]] = []
        switch format {
        case "single_choice":
            right = Array(rightOptions.prefix(1))
            wrongs = wrongOptions.prefix(2).map { [$0] }
        case "multi_choice":
            right = rightOptions
            // Try 1: one wrong food alone; try 2: that food and another wrong one (still wrong).
            wrongs = [Array(wrongOptions.prefix(1)), Array(wrongOptions.prefix(2))]
        case "true_false":
            let answer = item["answer"] as? Bool ?? false
            right = [String(answer)]
            wrongs = [[String(!answer)], [String(!answer)]]
        case "fill_blank_bank":
            right = item["answers"] as? [String] ?? []
            let bank = (item["bank"] as? [[String: Any]] ?? []).compactMap { $0["key"] as? String }
            wrongs = bank.filter { !right.contains($0) }.prefix(2).map { [$0] }
        default:
            break
        }
        let hint = item["hint"] as? [String: Any] ?? [:]
        let wrongText = item["explanation_wrong"] as? [String: Any] ?? [:]
        return Question(
            key: item["key"] as? String ?? "", format: format, right: right, wrongs: wrongs,
            hintEN: hint["en"] as? String ?? "", hintVI: hint["vi"] as? String ?? "",
            explanationWrongEN: wrongText["en"] as? String ?? ""
        )
    }

    private static func object(_ data: Data) throws -> [String: Any] {
        try JSONSerialization.jsonObject(with: data) as? [String: Any] ?? [:]
    }

    private static func find(_ relative: String, from file: String) throws -> URL {
        var dir = URL(fileURLWithPath: file).deletingLastPathComponent()
        while dir.path != "/" {
            let candidate = dir.appendingPathComponent(relative)
            if FileManager.default.fileExists(atPath: candidate.path) { return candidate }
            dir.deleteLastPathComponent()
        }
        throw NSError(domain: "LessonFixture", code: 1, userInfo: [NSLocalizedDescriptionKey: "\(relative) not found above \(file)"])
    }
}

extension LessonFixture {
    /// Opens the fixture's lesson from Home: its topic on the journey (the tap scrolls the map to
    /// it), then its row. `landing` is an element of the screen it should open on: since SK-043
    /// (A2) a Discoverer lesson opens on its first Khởi động question, whose header carries
    /// `lesson.progress` (no title screen any more); a lesson left half way opens where it
    /// stopped. Leaving the lesson with its close button goes back to the topic, not to Home.
    @MainActor
    func open(in app: XCUIApplication, landing: String = "lesson.progress", file: StaticString = #filePath, line: UInt = #line) {
        let topic = app.buttons["home.topic.\(topicKey)"].firstMatch
        XCTAssertTrue(topic.waitForExistence(timeout: 10), "no topic \(topicKey) on Home", file: file, line: line)
        topic.tap()
        let row = app.buttons["topic.lesson.\(lessonNumber)"].firstMatch
        XCTAssertTrue(row.waitForExistence(timeout: 5), "no lesson \(lessonNumber) in \(topicKey)", file: file, line: line)
        row.tap()
        XCTAssertTrue(
            app.descendants(matching: .any)[landing].firstMatch.waitForExistence(timeout: 5),
            "lesson did not open on \(landing)", file: file, line: line
        )
    }
}

/// The Discoverer lesson screens after SK-043 (A2) and SK-047, for the UI tests written before
/// them (SK-060): the identifiers and the order of the screens, in one place.
///
/// - A question: `lesson.choice.<key>`, `lesson.bank.<key>`, `lesson.tf.<true|false>`; the tap is
///   the answer, except multi choice, which has the arrow-only "Xong" (`lesson.check`).
/// - Wrong with a try left: the folded slip (`lesson.hint`) prints the feedback or the hint; there
///   is no "Thử lại" button, the child just answers again (a tried card cannot be tapped).
/// - Right or out of tries: the result sheet, `lesson.result.explanation`, the XP of a quiz
///   question right on the first try (`lesson.result.xp`) and the arrow `lesson.result.next`.
/// - Học is a picture book: `lesson.learn.page`, the arrow `lesson.explorer.next` turns the pages
///   (each page marks its group seen) and, after the last, goes to Chơi.
/// - After the last quiz question, Tổng kết (two pages), then Thưởng.
@MainActor
enum A2Lesson {
    static func element(_ app: XCUIApplication, _ identifier: String) -> XCUIElement {
        app.descendants(matching: .any)[identifier].firstMatch
    }

    /// The identifier of the answer `key` of a question in `format`.
    static func answerID(_ format: String, _ key: String) -> String {
        switch format {
        case "true_false": "lesson.tf.\(key)"
        case "fill_blank_bank": "lesson.bank.\(key)"
        default: "lesson.choice.\(key)"
        }
    }

    /// Taps the answer `keys`; multi choice then "Xong" (`check: false` leaves it chosen only).
    static func answer(_ question: LessonFixture.Question, _ keys: [String], check: Bool = true, in app: XCUIApplication,
                       file: StaticString = #filePath, line: UInt = #line) {
        for key in keys { tap(app, answerID(question.format, key), file: file, line: line) }
        if check, question.format == "multi_choice" { tap(app, "lesson.check", file: file, line: line) }
    }

    /// The result sheet of the question showing (right, or out of tries).
    static func waitResult(_ app: XCUIApplication, _ what: String, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertTrue(app.buttons["lesson.result.next"].firstMatch.waitForExistence(timeout: 10),
                      "\(what): no result sheet; on screen: \(screenNow(app))", file: file, line: line)
    }

    static func next(_ app: XCUIApplication, file: StaticString = #filePath, line: UInt = #line) {
        tap(app, "lesson.result.next", timeout: 10, file: file, line: line)
    }

    /// Học: turns every page, then goes on to Chơi.
    static func learn(_ app: XCUIApplication, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertTrue(element(app, "lesson.learn.page").waitForExistence(timeout: 10), "Học did not open; on screen: \(screenNow(app))", file: file, line: line)
        var turns = 0
        while !element(app, "lesson.play.message").exists, turns < 12 {
            tap(app, "lesson.explorer.next", file: file, line: line)
            turns += 1
            _ = element(app, "lesson.play.message").waitForExistence(timeout: 1)
        }
        XCTAssertTrue(element(app, "lesson.play.message").waitForExistence(timeout: 5), "Chơi did not open", file: file, line: line)
    }

    /// The quiz question number read by VoiceOver on the header squares ("Câu 3 trên 6").
    static func quizCounter(_ app: XCUIApplication) -> String {
        element(app, "lesson.progress").label
    }

    /// A quiz question is on screen (not Khởi động, which carries its tag).
    static func waitQuiz(_ app: XCUIApplication, file: StaticString = #filePath, line: UInt = #line) {
        let shows = element(app, "lesson.prompt").waitForExistence(timeout: 10) || element(app, "lesson.statement").exists
        XCTAssertTrue(shows && !element(app, "lesson.warmup.tag").exists, "Quiz did not open; on screen: \(screenNow(app))", file: file, line: line)
    }

    /// Tổng kết, both pages, then Thưởng.
    static func throughRecap(_ app: XCUIApplication, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertTrue(element(app, "lesson.recap.key_point.1").waitForExistence(timeout: 10), "Tổng kết did not open; on screen: \(screenNow(app))", file: file, line: line)
        tap(app, "lesson.recap.next", file: file, line: line)
        tap(app, "lesson.recap.to_reward", file: file, line: line)
        XCTAssertTrue(element(app, "lesson.reward.title").waitForExistence(timeout: 10), "Thưởng did not open", file: file, line: line)
    }

    static func tap(_ app: XCUIApplication, _ identifier: String, timeout: TimeInterval = 5, file: StaticString = #filePath, line: UInt = #line) {
        let target = app.buttons[identifier].firstMatch
        guard target.waitForExistence(timeout: timeout) else {
            XCTFail("no button \(identifier) after \(Int(timeout)) s; on screen: \(screenNow(app))", file: file, line: line)
            return
        }
        // Below the fold (a long question, the bottom bar over the last cards): scroll it up.
        var swipes = 0
        while !target.isHittable, swipes < 3 {
            app.swipeUp(velocity: .slow)
            swipes += 1
        }
        target.tap()
    }

    static func screenNow(_ app: XCUIApplication) -> String {
        let anchors = ["lesson.warmup.tag", "lesson.progress", "lesson.prompt", "lesson.statement", "lesson.hint", "lesson.result.explanation",
                       "lesson.learn.page", "lesson.play.message", "lesson.recap.title", "lesson.reward.title", "home.greeting", "topic.title"]
            .filter { element(app, $0).exists }
        let buttons = app.buttons.allElementsBoundByIndex.prefix(40).map { "\($0.identifier)\($0.isHittable ? "" : "(not hittable)")" }
        return "anchors \(anchors), buttons \(buttons)"
    }
}
