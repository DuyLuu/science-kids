/// The answer part of a question, as the engine needs it (vector `item-scoring` `input.item`).
///
/// The engine's own type, not ContentModel's `QuizItem`: LessonPlayer converts. Display text
/// is left out; only keys and correctness remain.
public enum ScoringItem: Hashable, Sendable {
    case singleChoice(options: [ScoringOption])
    case multiChoice(options: [ScoringOption])
    case trueFalse(answer: Bool)
    /// `answers[i]` is the key of blank `{i+1}`; `bank` holds every word key.
    case fillBlankBank(bank: [String], answers: [String])
    /// `answer` is the right permutation of `items`.
    case orderSequence(items: [String], answer: [String])
    /// Scored like `singleChoice`.
    case pictureBarChart(options: [ScoringOption])
}

public struct ScoringOption: Hashable, Sendable {
    public var key: String
    public var correct: Bool

    public init(key: String, correct: Bool) {
        self.key = key
        self.correct = correct
    }
}

/// One answer of the child (vector `input.tries[i]`). Codable in the vector's shape, which is also
/// the proposed shape of `quiz_answers.answer` (B5.3): `{selected}`, `{value}`, `{filled}`, `{order}`.
public enum Try: Hashable, Sendable, Codable {
    /// `single_choice`, `picture_bar_chart`: `{"selected": "fish"}`.
    case selected(String)
    /// `multi_choice`: `{"selected": ["fish", "egg"]}`.
    case selectedSet([String])
    /// `true_false`: `{"value": false}`.
    case value(Bool)
    /// `fill_blank_bank`: `{"filled": ["air"]}`, one key per blank in blank order.
    case filled([String])
    /// `order_sequence`: `{"order": ["a", "b", "c"]}`.
    case order([String])

    enum CodingKeys: String, CodingKey {
        case selected, value, filled, order
    }

    public init(from decoder: any Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        guard c.allKeys.count == 1, let key = c.allKeys.first else {
            throw DecodingError.dataCorrupted(.init(
                codingPath: c.codingPath,
                debugDescription: "a try has exactly one of selected, value, filled, order"
            ))
        }
        switch key {
        case .selected:
            if let one = try? c.decode(String.self, forKey: .selected) {
                self = .selected(one)
            } else {
                self = .selectedSet(try c.decode([String].self, forKey: .selected))
            }
        case .value: self = .value(try c.decode(Bool.self, forKey: .value))
        case .filled: self = .filled(try c.decode([String].self, forKey: .filled))
        case .order: self = .order(try c.decode([String].self, forKey: .order))
        }
    }

    public func encode(to encoder: any Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .selected(let key): try c.encode(key, forKey: .selected)
        case .selectedSet(let keys): try c.encode(keys, forKey: .selected)
        case .value(let value): try c.encode(value, forKey: .value)
        case .filled(let keys): try c.encode(keys, forKey: .filled)
        case .order(let keys): try c.encode(keys, forKey: .order)
        }
    }
}

/// Result of `scoreItem` (vector `expected`).
public struct ItemScore: Hashable, Sendable {
    /// 1 when try 1 is right, or partial order credit (D2); otherwise 0.
    public var points: Int
    /// `tryResults[i]` is true when try `i` matches the answer completely.
    public var tryResults: [Bool]
    /// The last try is right.
    public var finalCorrect: Bool
    public var triesUsed: Int

    public init(points: Int, tryResults: [Bool], finalCorrect: Bool, triesUsed: Int) {
        self.points = points
        self.tryResults = tryResults
        self.finalCorrect = finalCorrect
        self.triesUsed = triesUsed
    }
}

/// Scores one question from all tries of the child (B4.4, D1, D2, T1–T3).
///
/// - 1 point only when try 1 is right; later tries never add points, and nothing is taken off.
/// - `multi_choice` is right when the picked set equals the right set (order does not matter).
/// - `fill_blank_bank` and `order_sequence` are right on a complete match only; `order_sequence`
///   may still earn 1 point when try 1 has `partialOrderMin` items in place.
/// - Broken data is not scored as wrong: empty `tries`, too many tries, a try after a right one,
///   or an answer that does not fit the item return an error.
public func scoreItem(item: ScoringItem, tries: [Try], rules: Rules) -> Result<ItemScore, ScoringError> {
    guard !tries.isEmpty else { return .failure(.noTries) }
    guard tries.count <= rules.maxTries else { return .failure(.tooManyTries) }

    var results: [Bool] = []
    for attempt in tries {
        guard let right = isRight(attempt, for: item) else { return .failure(.invalidAnswer) }
        results.append(right)
    }
    if results.dropLast().contains(true) { return .failure(.tryAfterCorrect) }

    var points = results[0] ? 1 : 0
    if points == 0, let minimum = rules.partialOrderMin,
       case .orderSequence(_, let answer) = item, case .order(let first) = tries[0] {
        let inPlace = zip(first, answer).filter { $0 == $1 }.count
        if inPlace >= minimum { points = 1 }
    }

    return .success(ItemScore(
        points: points,
        tryResults: results,
        finalCorrect: results[results.count - 1],
        triesUsed: tries.count
    ))
}

/// Whether one try matches the item completely; `nil` when the try does not fit the item (T3).
private func isRight(_ attempt: Try, for item: ScoringItem) -> Bool? {
    switch (item, attempt) {
    case (.singleChoice(let options), .selected(let key)),
         (.pictureBarChart(let options), .selected(let key)):
        guard let option = options.first(where: { $0.key == key }) else { return nil }
        return option.correct

    case (.multiChoice(let options), .selectedSet(let keys)):
        let picked = Set(keys)
        let known = Set(options.map(\.key))
        guard picked.count == keys.count, picked.isSubset(of: known) else { return nil }
        return picked == Set(options.filter(\.correct).map(\.key))

    case (.trueFalse(let answer), .value(let value)):
        return value == answer

    case (.fillBlankBank(let bank, let answers), .filled(let keys)):
        let known = Set(bank)
        guard keys.count == answers.count, keys.allSatisfy(known.contains) else { return nil }
        return keys == answers

    case (.orderSequence(let items, let answer), .order(let keys)):
        guard keys.count == items.count, Set(keys).count == keys.count, Set(keys) == Set(items) else { return nil }
        return keys == answer

    default:
        // The try has the shape of another format.
        return nil
    }
}
