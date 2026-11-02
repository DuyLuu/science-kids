/// One scored question, from `scoreItem` (vector `lesson-score` `quiz_results[]`, `warmup_results[]`).
public struct ItemResult: Hashable, Sendable, Codable {
    /// `QuizItem.id`.
    public var itemId: String
    public var points: Int
    public var finalCorrect: Bool

    public init(itemId: String, points: Int, finalCorrect: Bool) {
        self.itemId = itemId
        self.points = points
        self.finalCorrect = finalCorrect
    }

    public init(itemId: String, score: ItemScore) {
        self.init(itemId: itemId, points: score.points, finalCorrect: score.finalCorrect)
    }

    enum CodingKeys: String, CodingKey {
        case itemId = "item_id"
        case points
        case finalCorrect = "final_correct"
    }
}

/// Result of `scoreLesson` (vector `expected`).
public struct LessonScore: Hashable, Sendable {
    /// Sum of quiz points.
    public var correct: Int
    /// Always `quizLength` (6).
    public var max: Int
    /// All quiz questions have a result (T4).
    public var completed: Bool

    public init(correct: Int, max: Int, completed: Bool) {
        self.correct = correct
        self.max = max
        self.completed = completed
    }
}

/// Number of quiz questions in a lesson: fixed by schema v1 (`quiz` has exactly 6 items), not a rule.
public let quizLength = 6

/// Lesson score (B4.4, T4, T5): `correct` adds the quiz points (not `finalCorrect`), `max` is 6,
/// `completed` means all 6 quiz questions have a result. Warmup never counts, whatever its results.
///
/// Broken results return `invalidResults`: a duplicate `itemId`, more than 6 results (T5), or a
/// result with points other than 0 or 1, so `correct` can never pass `max`. (The last guard is
/// not in the vectors yet; see SK-010.)
public func scoreLesson(quizResults: [ItemResult], warmupResults: [ItemResult]) -> Result<LessonScore, ScoringError> {
    guard quizResults.count <= quizLength,
          Set(quizResults.map(\.itemId)).count == quizResults.count,
          quizResults.allSatisfy({ (0...1).contains($0.points) })
    else { return .failure(.invalidResults) }

    return .success(LessonScore(
        correct: quizResults.reduce(0) { $0 + $1.points },
        max: quizLength,
        completed: quizResults.count == quizLength
    ))
}
