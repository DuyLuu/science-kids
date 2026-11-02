/// XP earned by one lesson attempt, shown on the Reward screen.
///
/// Provisional (SK-010 decision 2): technical-plan B4.4 rules, no shared vector yet (SK-003 leaves
/// XP out until B18 #13), and the server settles XP at milestone 3.
public struct XPAward: Hashable, Sendable {
    /// `xp_per_correct` × quiz points (a question right only on a later try earns nothing).
    public var correct: Int
    /// `xp_game_complete` when the mini-game was finished.
    public var gameComplete: Int
    /// `xp_lesson_complete` when the lesson is completed (all quiz questions answered).
    public var lessonComplete: Int

    public init(correct: Int, gameComplete: Int, lessonComplete: Int) {
        self.correct = correct
        self.gameComplete = gameComplete
        self.lessonComplete = lessonComplete
    }

    public var total: Int { correct + gameComplete + lessonComplete }
}

/// XP of one quiz question, as the result sheet shows it ("+10 XP"): `xp_per_correct` × the
/// question's `points` from `scoreItem` (B4.4). The same rule `computeXP` sums for the lesson, so the
/// quiz screen and Thưởng never disagree (SK-012 tester L4). Warmup questions earn none: callers
/// pass quiz scores only.
public func computeItemXP(score: ItemScore, rules: XPRules) -> Int {
    max(0, score.points) * rules.perCorrect
}

/// XP of one lesson attempt (B4.4): only added, never taken off. Warmup earns no XP.
/// The B4.4 "review reaches mastery +20" rule has no rules key yet and is not counted.
public func computeXP(score: LessonScore, gameCompleted: Bool, rules: XPRules) -> XPAward {
    XPAward(
        correct: max(0, score.correct) * rules.perCorrect,
        gameComplete: gameCompleted ? rules.gameComplete : 0,
        lessonComplete: score.completed ? rules.lessonComplete : 0
    )
}
