import Foundation

/// One attempt of a child at a lesson (vector `stars` `attempts[]`, from `lesson_attempts`).
public struct LessonAttempt: Hashable, Sendable {
    public var attemptId: String
    /// `nil` while the attempt is not finished (`completed_at` is null).
    public var completion: Completion?
    /// `score` of the attempt (output of `scoreLesson`).
    public var correct: Int
    public var max: Int

    public struct Completion: Hashable, Sendable {
        /// `completed_at`, used to order attempts.
        public var at: Date
        /// `local_date(completed_at, timezone)`, used for the mastery gap.
        public var localDate: LocalDate

        public init(at: Date, localDate: LocalDate) {
            self.at = at
            self.localDate = localDate
        }
    }

    public init(attemptId: String, completion: Completion?, correct: Int, max: Int) {
        self.attemptId = attemptId
        self.completion = completion
        self.correct = correct
        self.max = max
    }

    public var isCompleted: Bool { completion != nil }
}

/// Result of `computeStars` (vector `expected`; `lesson_progress.stars`, `first_pass_at`, `mastered_at`).
public struct StarsResult: Hashable, Sendable {
    /// 0–3.
    public var stars: Int
    /// Local date of the first passing attempt.
    public var firstPassDate: LocalDate?
    /// Local date of the first later pass at least `masteryGapDays` after `firstPassDate`.
    public var masteredDate: LocalDate?

    public init(stars: Int, firstPassDate: LocalDate?, masteredDate: LocalDate?) {
        self.stars = stars
        self.firstPassDate = firstPassDate
        self.masteredDate = masteredDate
    }
}

/// Stars of one lesson from every attempt of one profile (B4.4, D3, D4).
///
/// - ⭐ once an attempt is completed, whatever the score; unfinished attempts never count.
/// - ⭐⭐ once a completed attempt passes `rules.passThreshold` (integer comparison).
/// - ⭐⭐⭐ once another pass comes `rules.masteryGapDays` calendar days or more after the
///   first pass (local dates, not 24-hour periods); the gap is measured from the first pass.
/// - Attempts are ordered by `completion.at`, not by array order; stars never go down because
///   they come from the whole history.
public func computeStars(attempts: [LessonAttempt], rules: Rules) -> StarsResult {
    let completed = attempts
        .compactMap { attempt in attempt.completion.map { (attempt, $0) } }
        .sorted { lhs, rhs in
            lhs.1.at != rhs.1.at ? lhs.1.at < rhs.1.at : lhs.0.attemptId < rhs.0.attemptId
        }
    guard !completed.isEmpty else {
        return StarsResult(stars: 0, firstPassDate: nil, masteredDate: nil)
    }

    let passes = completed.filter { attempt, _ in
        rules.passThreshold.isReached(correct: attempt.correct, max: attempt.max)
    }
    guard let firstPass = passes.first?.1.localDate else {
        return StarsResult(stars: 1, firstPassDate: nil, masteredDate: nil)
    }

    let mastered = passes.dropFirst().first { _, completion in
        firstPass.days(to: completion.localDate) >= rules.masteryGapDays
    }?.1.localDate
    return StarsResult(stars: mastered == nil ? 2 : 3, firstPassDate: firstPass, masteredDate: mastered)
}
