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
    /// it), then its row. `landing` is an element of the screen it should open on (a lesson left
    /// half way opens where it stopped). Leaving the lesson with its close button goes back to
    /// the topic, not to Home.
    @MainActor
    func open(in app: XCUIApplication, landing: String = "lesson.title", file: StaticString = #filePath, line: UInt = #line) {
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
