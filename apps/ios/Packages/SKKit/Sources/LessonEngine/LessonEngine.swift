/// `LessonEngine`: scoring rules of technical-plan B4.4 (SK-010).
///
/// Pure Swift: no I/O, no UI, no other SKKit module. Every parameter comes from `Rules`
/// (later `content/rules.json` in the manifest); nothing is hard-coded except the schema's fixed
/// quiz length. Checked against the shared vectors in `packages/content-schema/test-vectors/`,
/// so Android and the server compute the same results.
///
/// Functions (camelCase of the vector names): `scoreItem(item:tries:rules:)`,
/// `scoreLesson(quizResults:warmupResults:)`, `computeStars(attempts:rules:)`, plus
/// `computeXP(score:gameCompleted:rules:)` (provisional, no vector yet). Errors are returned as
/// `Result.failure(ScoringError)` with the vector's codes; nothing throws or traps.
public enum LessonEngineModule {
    public static let name = "LessonEngine"
}

/// Error codes of the vectors (`{"error": "<code>"}`).
public enum ScoringError: String, Error, Hashable, Sendable, CaseIterable {
    /// More tries than `rules.maxTries` (D1).
    case tooManyTries = "too_many_tries"
    /// A try after a correct try (T1).
    case tryAfterCorrect = "try_after_correct"
    /// No try at all (T2).
    case noTries = "no_tries"
    /// A key that is not in the item, a duplicate pick, wrong number of blanks, not a permutation (T3).
    case invalidAnswer = "invalid_answer"
    /// Duplicate `item_id` or more results than quiz items (T5).
    case invalidResults = "invalid_results"

    public var code: String { rawValue }
}
