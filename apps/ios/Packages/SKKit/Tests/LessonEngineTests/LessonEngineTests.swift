import Foundation
import Testing
@testable import LessonEngine

@Test func moduleIsLinked() {
    #expect(LessonEngineModule.name == "LessonEngine")
}

/// B4.4 XP values, written here on purpose: XP has no shared vector yet (SK-003, B18 #13).
let b44XP = XPRules(perCorrect: 10, lessonComplete: 20, gameComplete: 10)

/// Rules of the vectors' `default_rules`, read from the file (not hard-coded).
func vectorDefaultRules() throws -> Rules {
    try JSONValue.object(VectorSuite.load("item-scoring").defaultRules).decode(Rules.self)
}

// MARK: - XP (provisional, waiting for vectors)

@Suite struct XPProvisional {
    func sixItems() -> [(id: String, item: ScoringItem, right: Try, wrong: Try)] {
        let fish = [ScoringOption(key: "fish", correct: true), ScoringOption(key: "rice", correct: false)]
        let pair = [
            ScoringOption(key: "fish", correct: true), ScoringOption(key: "egg", correct: true),
            ScoringOption(key: "rice", correct: false),
        ]
        return [
            ("q1", .singleChoice(options: fish), .selected("fish"), .selected("rice")),
            ("q2", .fillBlankBank(bank: ["energy", "air"], answers: ["energy"]), .filled(["energy"]), .filled(["air"])),
            ("q3", .singleChoice(options: fish), .selected("fish"), .selected("rice")),
            ("q4", .pictureBarChart(options: fish), .selected("fish"), .selected("rice")),
            ("q5", .multiChoice(options: pair), .selectedSet(["egg", "fish"]), .selectedSet(["fish"])),
            ("q6", .trueFalse(answer: false), .value(false), .value(true)),
        ]
    }

    /// 6/6 right on the first try, tray finished, lesson finished → 6×10 + 10 + 20 = 90.
    @Test func perfectLessonIs90() throws {
        let rules = try vectorDefaultRules()
        let results = try sixItems().map { entry in
            ItemResult(itemId: entry.id, score: try scoreItem(item: entry.item, tries: [entry.right], rules: rules).get())
        }
        let score = try scoreLesson(quizResults: results, warmupResults: []).get()
        #expect(score == LessonScore(correct: 6, max: 6, completed: true))
        let xp = computeXP(score: score, gameCompleted: true, rules: b44XP)
        #expect(xp == XPAward(correct: 60, gameComplete: 10, lessonComplete: 20))
        #expect(xp.total == 90)
    }

    /// q4 right only on try 2 → no `xp_per_correct` for it: 5×10 + 10 + 20 = 80.
    @Test func rightOnSecondTryEarnsNoCorrectXP() throws {
        let rules = try vectorDefaultRules()
        let results = try sixItems().map { entry in
            let tries = entry.id == "q4" ? [entry.wrong, entry.right] : [entry.right]
            return ItemResult(itemId: entry.id, score: try scoreItem(item: entry.item, tries: tries, rules: rules).get())
        }
        #expect(results[3].points == 0 && results[3].finalCorrect)
        let score = try scoreLesson(quizResults: results, warmupResults: []).get()
        let xp = computeXP(score: score, gameCompleted: true, rules: b44XP)
        #expect(xp.correct == 50)
        #expect(xp.total == 80)
    }

    /// Warmup never earns XP; an unfinished lesson or game earns no completion XP.
    @Test func warmupAndUnfinishedParts() throws {
        let warmup = [ItemResult(itemId: "w1", points: 1, finalCorrect: true)]
        let five = (1...5).map { ItemResult(itemId: "q\($0)", points: 1, finalCorrect: true) }
        let score = try scoreLesson(quizResults: five, warmupResults: warmup).get()
        #expect(!score.completed)
        let xp = computeXP(score: score, gameCompleted: false, rules: b44XP)
        #expect(xp == XPAward(correct: 50, gameComplete: 0, lessonComplete: 0))
    }

    /// XP values come from the rules object (same flat keys as content/rules.json).
    @Test func xpRulesDecodeFromRulesObject() throws {
        let json = #"{"max_tries": 2, "xp_per_correct": 15, "xp_lesson_complete": 30, "xp_game_complete": 5}"#
        let rules = try JSONDecoder().decode(XPRules.self, from: Data(json.utf8))
        #expect(rules == XPRules(perCorrect: 15, lessonComplete: 30, gameComplete: 5))
        let score = LessonScore(correct: 6, max: 6, completed: true)
        #expect(computeXP(score: score, gameCompleted: true, rules: rules).total == 6 * 15 + 5 + 30)
    }
}

// MARK: - Rules, Try, LocalDate

@Test func rulesDecodeFromVectorDefaults() throws {
    let rules = try vectorDefaultRules()
    #expect(rules == Rules(maxTries: 2, partialOrderMin: nil, passThreshold: Fraction(num: 5, den: 6), masteryGapDays: 1))
}

@Test func tryCodableMatchesVectorShape() throws {
    let tries: [Try] = [.selected("fish"), .selectedSet(["fish", "egg"]), .value(false), .filled(["air"]), .order(["a", "b"])]
    let data = try JSONEncoder().encode(tries)
    #expect(try JSONDecoder().decode([Try].self, from: data) == tries)
    let text = #"[{"selected":"fish"},{"selected":["fish","egg"]},{"value":false},{"filled":["air"]},{"order":["a","b"]}]"#
    #expect(try JSONDecoder().decode([Try].self, from: Data(text.utf8)) == tries)
    #expect(throws: DecodingError.self) {
        try JSONDecoder().decode(Try.self, from: Data(#"{"selected":"a","value":true}"#.utf8))
    }
}

@Test func tryShapeOfAnotherFormatIsInvalid() throws {
    let rules = try vectorDefaultRules()
    let options = [ScoringOption(key: "fish", correct: true), ScoringOption(key: "rice", correct: false)]
    #expect(scoreItem(item: .singleChoice(options: options), tries: [.value(true)], rules: rules) == .failure(.invalidAnswer))
    #expect(scoreItem(item: .multiChoice(options: options), tries: [.selected("fish")], rules: rules) == .failure(.invalidAnswer))
}

@Test func localDates() {
    #expect(LocalDate("2026-11-02")?.description == "2026-11-02")
    #expect(LocalDate("2026-02-30") == nil)
    #expect(LocalDate("2026-1-02") == nil)
    #expect(LocalDate("2028-02-29") != nil)
    #expect(LocalDate("2027-02-29") == nil)
    #expect(LocalDate("1970-01-01")?.dayNumber == 0)
    let pairs: [(String, String, Int)] = [
        ("2026-11-02", "2026-11-03", 1),
        ("2026-12-31", "2027-01-01", 1),
        ("2028-02-28", "2028-03-01", 2),
        ("2026-11-03", "2026-11-02", -1),
        ("2026-01-01", "2027-01-01", 365),
    ]
    for (from, to, days) in pairs {
        #expect(LocalDate(from)!.days(to: LocalDate(to)!) == days, "\(from) → \(to)")
    }
    #expect(LocalDate("2026-11-02")! < LocalDate("2026-11-10")!)
}
