/// Scoring parameters (`rules` of the manifest; `default_rules` of the vectors).
///
/// Decodes from the same flat JSON object as `content/rules.json`; keys the engine does not use
/// yet (`rest_days_per_week`, `warmup`) are ignored.
public struct Rules: Hashable, Sendable, Decodable {
    /// Total tries per item, the first one included (D1). Default content value: 2.
    public var maxTries: Int
    /// `order_sequence` gets 1 point when try 1 has at least this many items in place (D2). `nil` = off.
    public var partialOrderMin: Int?
    /// Pass when `correct * den >= num * max` (D3).
    public var passThreshold: Fraction
    /// Calendar days between the first pass and a later pass for ⭐⭐⭐ (D4).
    public var masteryGapDays: Int

    public init(maxTries: Int, partialOrderMin: Int?, passThreshold: Fraction, masteryGapDays: Int) {
        self.maxTries = maxTries
        self.partialOrderMin = partialOrderMin
        self.passThreshold = passThreshold
        self.masteryGapDays = masteryGapDays
    }

    enum CodingKeys: String, CodingKey {
        case maxTries = "max_tries"
        case partialOrderMin = "partial_order_min"
        case passThreshold = "pass_threshold"
        case masteryGapDays = "mastery_gap_days"
    }

    public init(from decoder: any Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        maxTries = try c.decode(Int.self, forKey: .maxTries)
        partialOrderMin = try c.decodeIfPresent(Int.self, forKey: .partialOrderMin)
        passThreshold = try c.decode(Fraction.self, forKey: .passThreshold)
        masteryGapDays = try c.decode(Int.self, forKey: .masteryGapDays)
    }
}

/// A threshold written as a fraction `{num, den}` and compared with integers only (D3),
/// so Swift, Kotlin and SQL never differ by rounding.
public struct Fraction: Hashable, Sendable, Decodable {
    public var num: Int
    public var den: Int

    public init(num: Int, den: Int) {
        self.num = num
        self.den = den
    }

    /// `correct / max >= num / den`, as `correct * den >= num * max`.
    public func isReached(correct: Int, max: Int) -> Bool {
        correct * den >= num * max
    }
}

/// XP parameters of technical-plan B4.4 (`xp_per_correct`, `xp_lesson_complete`, `xp_game_complete`).
///
/// Separate from `Rules` because the vectors' `default_rules` do not carry XP keys yet
/// (SK-003 leaves XP out until B18 #13). Decodes from the same flat rules object.
public struct XPRules: Hashable, Sendable, Decodable {
    public var perCorrect: Int
    public var lessonComplete: Int
    public var gameComplete: Int

    public init(perCorrect: Int, lessonComplete: Int, gameComplete: Int) {
        self.perCorrect = perCorrect
        self.lessonComplete = lessonComplete
        self.gameComplete = gameComplete
    }

    enum CodingKeys: String, CodingKey {
        case perCorrect = "xp_per_correct"
        case lessonComplete = "xp_lesson_complete"
        case gameComplete = "xp_game_complete"
    }
}
