import Foundation
@testable import LessonEngine

/// Reads `packages/content-schema/test-vectors/` straight from the repo, as its README says:
/// SwiftPM cannot declare resources outside the package, so walk up from `#filePath`.
enum TestVectors {
    static let directory: URL = {
        var dir = URL(fileURLWithPath: #filePath).deletingLastPathComponent()
        while dir.path != "/" {
            let candidate = dir.appendingPathComponent("packages/content-schema/test-vectors")
            if FileManager.default.fileExists(atPath: candidate.appendingPathComponent("vector.schema.json").path) {
                return candidate
            }
            dir.deleteLastPathComponent()
        }
        fatalError("packages/content-schema/test-vectors not found above \(#filePath)")
    }()

    static func data(_ suite: String) throws -> Data {
        try Data(contentsOf: directory.appendingPathComponent("\(suite).json"))
    }
}

/// One vector file, kept as JSON so tests can edit a copy in memory.
struct VectorSuite {
    let name: String
    var file: [String: JSONValue]

    static func load(_ name: String) throws -> VectorSuite {
        guard let file = try JSONValue.parse(TestVectors.data(name)).object else {
            throw HarnessError("\(name).json is not an object")
        }
        return VectorSuite(name: name, file: file)
    }

    var defaultRules: [String: JSONValue] {
        get { file["default_rules"]?.object ?? [:] }
        set { file["default_rules"] = .object(newValue) }
    }

    var cases: [[String: JSONValue]] {
        get { file["cases"]?.array?.compactMap(\.object) ?? [] }
        set { file["cases"] = .array(newValue.map(JSONValue.object)) }
    }

    /// Edits the case with `id` in this in-memory copy.
    mutating func editCase(_ id: String, _ edit: (inout [String: JSONValue]) -> Void) {
        cases = cases.map { item in
            guard item["id"]?.string == id else { return item }
            var copy = item
            edit(&copy)
            return copy
        }
    }
}

struct HarnessError: Error, CustomStringConvertible {
    let description: String
    init(_ description: String) { self.description = description }
}

struct CaseOutcome {
    let id: String
    let status: String
    let passed: Bool
    /// Why it failed: expected vs actual, or an input the harness could not read.
    let detail: String
}

struct SuiteReport {
    let suite: String
    let outcomes: [CaseOutcome]

    var total: Int { outcomes.count }
    var passed: Int { outcomes.filter(\.passed).count }
    var failedIDs: [String] { outcomes.filter { !$0.passed }.map(\.id) }

    func total(status: String) -> Int { outcomes.filter { $0.status == status }.count }
    func passed(status: String) -> Int { outcomes.filter { $0.status == status && $0.passed }.count }

    var summary: String {
        "\(suite): \(passed)/\(total) pass · confirmed \(passed(status: "confirmed"))/\(total(status: "confirmed"))"
            + " · proposed \(passed(status: "proposed"))/\(total(status: "proposed"))"
    }
}

/// Runs vector cases through LessonEngine, following the harness steps of test-vectors/README.md:
/// 1. rules = `default_rules` shallow-merged with `case.rules`;
/// 2. call the function with the `input` fields (plus rules);
/// 3. compare with `expected` exactly; errors are `{"error": "<code>"}`;
/// 4. `description`, `status`, `decision`, `derived` are ignored (`proposed` cases run too).
enum Harness {
    static func run(_ suite: VectorSuite) -> SuiteReport {
        let defaults = suite.defaultRules
        let outcomes = suite.cases.map { item in run(item, suite: suite.name, defaultRules: defaults) }
        return SuiteReport(suite: suite.name, outcomes: outcomes)
    }

    static func run(_ item: [String: JSONValue], suite: String, defaultRules: [String: JSONValue]) -> CaseOutcome {
        let id = item["id"]?.string ?? "<no id>"
        let status = item["status"]?.string ?? "<no status>"
        do {
            guard let input = item["input"]?.object, let expected = item["expected"] else {
                throw HarnessError("case has no input or expected")
            }
            let rules = JSONValue.object(defaultRules.merging(item["rules"]?.object ?? [:]) { $1 })
            let actual = try evaluate(suite: suite, input: input, rules: rules)
            let passed = actual == expected
            return CaseOutcome(
                id: id, status: status, passed: passed,
                detail: passed ? "" : "expected \(expected), got \(actual)"
            )
        } catch {
            return CaseOutcome(id: id, status: status, passed: false, detail: "harness: \(error)")
        }
    }

    static func evaluate(suite: String, input: [String: JSONValue], rules: JSONValue) throws -> JSONValue {
        switch suite {
        case "item-scoring":
            let item = try scoringItem(try field("item", in: input))
            let tries = try field("tries", in: input).decode([Try].self)
            return json(scoreItem(item: item, tries: tries, rules: try rules.decode(Rules.self)))
        case "lesson-score":
            let quiz = try field("quiz_results", in: input).decode([ItemResult].self)
            let warmup = try field("warmup_results", in: input).decode([ItemResult].self)
            return json(scoreLesson(quizResults: quiz, warmupResults: warmup))
        case "stars":
            let attempts = try (field("attempts", in: input).array ?? []).map(attempt)
            return json(computeStars(attempts: attempts, rules: try rules.decode(Rules.self)))
        case "build-tray":
            let block = try trayRules(try field("block", in: input))
            let tray = try strings(try field("tray", in: input))
            let taps = try strings(try field("taps", in: input))
            return json(buildTray(block: block, tray: tray, taps: taps))
        case "streak":
            let dates = try strings(try field("studied_dates", in: input)).map(localDate)
            let today = try localDate(try field("today", in: input).string ?? "")
            return json(computeStreak(studiedDates: dates, today: today, rules: try rules.decode(StreakRules.self)))
        case "local-date":
            guard let text = try field("completed_at", in: input).string, let instant = parseInstant(text) else {
                throw HarnessError("completed_at is not an ISO 8601 instant")
            }
            guard let zone = try field("timezone", in: input).string else { throw HarnessError("timezone missing") }
            switch LessonEngine.localDate(at: instant, timeZone: zone) {
            case .success(let date): return .string(date.description)
            case .failure(let error): return .object(["error": .string(error.code)])
            }
        default:
            throw HarnessError("no engine function for suite \(suite)")
        }
    }

    // MARK: Input: vector JSON → engine types

    static func field(_ key: String, in object: [String: JSONValue]) throws -> JSONValue {
        guard let value = object[key] else { throw HarnessError("input.\(key) missing") }
        return value
    }

    static func scoringItem(_ value: JSONValue) throws -> ScoringItem {
        guard let item = value.object, let format = item["format"]?.string else {
            throw HarnessError("item has no format")
        }
        func keys(_ key: String) throws -> [String] {
            guard let array = item[key]?.array else { throw HarnessError("item.\(key) missing") }
            return try array.map { element in
                if let text = element.string { return text }
                if let text = element["key"]?.string { return text }
                throw HarnessError("item.\(key) has an element without key")
            }
        }
        func options() throws -> [ScoringOption] {
            guard let array = item["options"]?.array else { throw HarnessError("item.options missing") }
            return try array.map { option in
                guard let key = option["key"]?.string, let correct = option["correct"]?.bool else {
                    throw HarnessError("option without key or correct")
                }
                return ScoringOption(key: key, correct: correct)
            }
        }
        switch format {
        case "single_choice": return .singleChoice(options: try options())
        case "multi_choice": return .multiChoice(options: try options())
        case "picture_bar_chart": return .pictureBarChart(options: try options())
        case "true_false":
            guard let answer = item["answer"]?.bool else { throw HarnessError("true_false without answer") }
            return .trueFalse(answer: answer)
        case "fill_blank_bank": return .fillBlankBank(bank: try keys("bank"), answers: try keys("answers"))
        case "order_sequence": return .orderSequence(items: try keys("items"), answer: try keys("answer"))
        default: throw HarnessError("unknown format \(format)")
        }
    }

    static func strings(_ value: JSONValue) throws -> [String] {
        guard let array = value.array else { throw HarnessError("expected an array of keys, got \(value)") }
        return try array.map { element in
            guard let text = element.string else { throw HarnessError("expected a key, got \(element)") }
            return text
        }
    }

    /// `input.block` of `build-tray`: `capacity`, `groups[].key/role`, `items[].key/group`.
    static func trayRules(_ value: JSONValue) throws -> TrayRules {
        guard let block = value.object, let capacity = block["capacity"]?.int,
              let groups = block["groups"]?.array, let items = block["items"]?.array
        else { throw HarnessError("block misses capacity, groups or items") }
        return TrayRules(
            capacity: capacity,
            groups: try groups.map { group in
                guard let key = group["key"]?.string, let role = group["role"]?.string else {
                    throw HarnessError("group without key or role")
                }
                return TrayRules.Group(key: key, role: TrayRules.Role(role))
            },
            items: try items.map { item in
                guard let key = item["key"]?.string, let group = item["group"]?.string else {
                    throw HarnessError("item without key or group")
                }
                return TrayRules.Item(key: key, group: group)
            }
        )
    }

    static func attempt(_ value: JSONValue) throws -> LessonAttempt {
        guard let object = value.object,
              let id = object["attempt_id"]?.string,
              let completed = object["completed"]?.bool,
              let correct = object["correct"]?.int,
              let max = object["max"]?.int
        else { throw HarnessError("attempt \(value) misses a field") }
        var completion: LessonAttempt.Completion?
        if completed {
            guard let at = object["completed_at"]?.string.flatMap(parseInstant),
                  let local = object["local_date"]?.string.flatMap(LocalDate.init)
            else { throw HarnessError("completed attempt \(id) without completed_at or local_date") }
            completion = .init(at: at, localDate: local)
        }
        return LessonAttempt(attemptId: id, completion: completion, correct: correct, max: max)
    }

    static func localDate(_ text: String) throws -> LocalDate {
        guard let date = LocalDate(text) else { throw HarnessError("not a YYYY-MM-DD date: \(text)") }
        return date
    }

    /// ISO 8601 with `Z`, with or without fractional seconds.
    static func parseInstant(_ text: String) -> Date? {
        let plain = ISO8601DateFormatter()
        plain.formatOptions = [.withInternetDateTime]
        if let date = plain.date(from: text) { return date }
        let fractional = ISO8601DateFormatter()
        fractional.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return fractional.date(from: text)
    }

    // MARK: Output: engine types → vector JSON

    static func json(_ streak: StreakResult) -> JSONValue {
        .object([
            "studied_days": .number(Double(streak.studiedDays)),
            "chain_start": streak.chainStart.map { .string($0.description) } ?? .null,
            "rest_days": .array(streak.restDays.map { .string($0.description) }),
        ])
    }

    static func json(_ result: Result<ItemScore, ScoringError>) -> JSONValue {
        switch result {
        case .success(let score):
            .object([
                "points": .number(Double(score.points)),
                "try_results": .array(score.tryResults.map(JSONValue.bool)),
                "final_correct": .bool(score.finalCorrect),
                "tries_used": .number(Double(score.triesUsed)),
            ])
        case .failure(let error): .object(["error": .string(error.code)])
        }
    }

    static func json(_ result: Result<LessonScore, ScoringError>) -> JSONValue {
        switch result {
        case .success(let score):
            .object([
                "correct": .number(Double(score.correct)),
                "max": .number(Double(score.max)),
                "completed": .bool(score.completed),
            ])
        case .failure(let error): .object(["error": .string(error.code)])
        }
    }

    static func json(_ result: Result<TrayState, TrayError>) -> JSONValue {
        switch result {
        case .success(let state):
            .object([
                "tray": .array(state.tray.map(JSONValue.string)),
                "full": .bool(state.full),
                "missing": .array(state.missing.map(JSONValue.string)),
                "has_limited": .bool(state.hasLimited),
                "success": .bool(state.success),
                "message": .string(state.message.code),
            ])
        case .failure(let error): .object(["error": .string(error.code)])
        }
    }

    static func json(_ result: StarsResult) -> JSONValue {
        .object([
            "stars": .number(Double(result.stars)),
            "first_pass_date": result.firstPassDate.map { .string($0.description) } ?? .null,
            "mastered_date": result.masteredDate.map { .string($0.description) } ?? .null,
        ])
    }
}
