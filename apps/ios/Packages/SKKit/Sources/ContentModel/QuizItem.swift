import Foundation

/// A question (quiz-item.schema.json): common fields plus answer fields by `format`.
///
/// Used for `lesson.quiz` and `lesson.warmup`. A `format` the app does not know decodes with
/// `answer == .unknown(format:)`; `Lesson` drops the item and `ContentDecoder` logs it.
/// The common fields are still required for an unknown format: they belong to `QuizBase`,
/// which every format shares.
public struct QuizItem: Codable, Hashable, Sendable {
    public let id: UUID
    public let key: Key
    public let version: Int
    /// 1–3.
    public let dok: Int
    public let prompt: Spoken
    public let instruction: Spoken?
    public let image: ContentImage?
    public let hint: Spoken
    public let explanationCorrect: Spoken
    public let explanationWrong: Spoken
    public let misconceptionId: UUID?
    /// Share of children who answer correctly, filled in after beta.
    public let pCorrect: Double?
    /// Required on warmup items, absent on quiz items. The app does not enforce it (the CLI does).
    public let recallFrom: RecallFrom?
    public let answer: Answer

    /// `format` as written in the file.
    public var format: String { answer.format }

    public var isUnknown: Bool {
        if case .unknown = answer { true } else { false }
    }

    /// Answer fields by `format`: all six v1 formats, so LessonEngine can score every one
    /// even though the trial UI renders only four (SK-009, SK-010 decision 1).
    public enum Answer: Hashable, Sendable {
        case singleChoice(SingleChoice)
        case multiChoice(MultiChoice)
        case trueFalse(TrueFalse)
        case fillBlankBank(FillBlankBank)
        case orderSequence(OrderSequence)
        case pictureBarChart(PictureBarChart)
        /// A format this app version cannot show (for example `label_diagram`).
        case unknown(format: String)

        public var format: String {
            switch self {
            case .singleChoice: "single_choice"
            case .multiChoice: "multi_choice"
            case .trueFalse: "true_false"
            case .fillBlankBank: "fill_blank_bank"
            case .orderSequence: "order_sequence"
            case .pictureBarChart: "picture_bar_chart"
            case .unknown(let format): format
            }
        }
    }

    enum CodingKeys: String, CodingKey {
        case id, key, format, version, dok, prompt, instruction, image, hint
        case explanationCorrect = "explanation_correct"
        case explanationWrong = "explanation_wrong"
        case misconceptionId = "misconception_id"
        case pCorrect = "p_correct"
        case recallFrom = "recall_from"
    }

    public init(from decoder: any Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        id = try c.decode(UUID.self, forKey: .id)
        key = try c.decode(Key.self, forKey: .key)
        version = try c.decode(Int.self, forKey: .version)
        dok = try c.decode(Int.self, forKey: .dok)
        prompt = try c.decode(Spoken.self, forKey: .prompt)
        instruction = try c.decodeIfPresent(Spoken.self, forKey: .instruction)
        image = try c.decodeIfPresent(ContentImage.self, forKey: .image)
        hint = try c.decode(Spoken.self, forKey: .hint)
        explanationCorrect = try c.decode(Spoken.self, forKey: .explanationCorrect)
        explanationWrong = try c.decode(Spoken.self, forKey: .explanationWrong)
        misconceptionId = try c.decodeIfPresent(UUID.self, forKey: .misconceptionId)
        pCorrect = try c.decodeIfPresent(Double.self, forKey: .pCorrect)
        recallFrom = try c.decodeIfPresent(RecallFrom.self, forKey: .recallFrom)

        let format = try c.decode(String.self, forKey: .format)
        switch format {
        case "single_choice": answer = .singleChoice(try SingleChoice(from: decoder))
        case "multi_choice": answer = .multiChoice(try MultiChoice(from: decoder))
        case "true_false": answer = .trueFalse(try TrueFalse(from: decoder))
        case "fill_blank_bank": answer = .fillBlankBank(try FillBlankBank(from: decoder))
        case "order_sequence": answer = .orderSequence(try OrderSequence(from: decoder))
        case "picture_bar_chart": answer = .pictureBarChart(try PictureBarChart(from: decoder))
        default: answer = .unknown(format: format)
        }
    }

    public func encode(to encoder: any Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encode(id, forKey: .id)
        try c.encode(key, forKey: .key)
        try c.encode(format, forKey: .format)
        try c.encode(version, forKey: .version)
        try c.encode(dok, forKey: .dok)
        try c.encode(prompt, forKey: .prompt)
        try c.encodeIfPresent(instruction, forKey: .instruction)
        try c.encodeIfPresent(image, forKey: .image)
        try c.encode(hint, forKey: .hint)
        try c.encode(explanationCorrect, forKey: .explanationCorrect)
        try c.encode(explanationWrong, forKey: .explanationWrong)
        try c.encodeIfPresent(misconceptionId, forKey: .misconceptionId)
        try c.encodeIfPresent(pCorrect, forKey: .pCorrect)
        try c.encodeIfPresent(recallFrom, forKey: .recallFrom)
        switch answer {
        case .singleChoice(let fields): try fields.encode(to: encoder)
        case .multiChoice(let fields): try fields.encode(to: encoder)
        case .trueFalse(let fields): try fields.encode(to: encoder)
        case .fillBlankBank(let fields): try fields.encode(to: encoder)
        case .orderSequence(let fields): try fields.encode(to: encoder)
        case .pictureBarChart(let fields): try fields.encode(to: encoder)
        case .unknown: break
        }
    }
}

/// Where a warmup item recalls from.
public enum RecallFrom: Codable, Hashable, Sendable {
    case priorKnowledge(note: BilingualText)
    case lesson(lessonId: UUID)
    /// A `kind` added after v1.
    case unknown(kind: String)

    enum CodingKeys: String, CodingKey {
        case kind, note
        case lessonId = "lesson_id"
    }

    public init(from decoder: any Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        let kind = try c.decode(String.self, forKey: .kind)
        switch kind {
        case "prior_knowledge": self = .priorKnowledge(note: try c.decode(BilingualText.self, forKey: .note))
        case "lesson": self = .lesson(lessonId: try c.decode(UUID.self, forKey: .lessonId))
        default: self = .unknown(kind: kind)
        }
    }

    public func encode(to encoder: any Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .priorKnowledge(let note):
            try c.encode("prior_knowledge", forKey: .kind)
            try c.encode(note, forKey: .note)
        case .lesson(let lessonId):
            try c.encode("lesson", forKey: .kind)
            try c.encode(lessonId, forKey: .lessonId)
        case .unknown(let kind):
            try c.encode(kind, forKey: .kind)
        }
    }
}

// MARK: - Answer fields by format

extension QuizItem {
    public struct ChoiceOption: Codable, Hashable, Sendable {
        public let key: Key
        public let label: Spoken
        public let image: ContentImage?
        public let correct: Bool
    }

    /// `single_choice`: exactly one option has `correct: true` (checked by the CLI).
    public struct SingleChoice: Codable, Hashable, Sendable {
        public let options: [ChoiceOption]
    }

    /// `multi_choice`: at least one right and one wrong option; right when the chosen set equals the right set.
    public struct MultiChoice: Codable, Hashable, Sendable {
        public let options: [ChoiceOption]
    }

    /// `true_false`: `statement` is a character's line (Na says…), `speaker` its key.
    public struct TrueFalse: Codable, Hashable, Sendable {
        public let answer: Bool
        public let statement: Spoken?
        public let speaker: Key?
        /// Without labels the app uses its own True/False strings (Localizable.xcstrings).
        public let labels: Labels?

        public struct Labels: Codable, Hashable, Sendable {
            public let trueLabel: Spoken
            public let falseLabel: Spoken

            enum CodingKeys: String, CodingKey {
                case trueLabel = "true"
                case falseLabel = "false"
            }
        }
    }

    /// `fill_blank_bank`: blanks `{1}`, `{2}`… in `sentence.en` (optional in `vi`); `answers[i]` fills `{i+1}`.
    public struct FillBlankBank: Codable, Hashable, Sendable {
        public let sentence: Spoken
        public let bank: [BankWord]
        public let answers: [Key]

        /// A word card of the bank. `image` is optional (SK-033, Duy 9/11): with it the card is a
        /// picture card, like a `single_choice` option with a picture.
        public struct BankWord: Codable, Hashable, Sendable {
            public let key: Key
            public let label: Spoken
            public let image: ContentImage?
        }

        /// Some word card has a picture: the bank is drawn as picture cards.
        public var hasPictures: Bool { bank.contains { $0.image != nil } }

        /// `sentence.en` split into text and blanks.
        public var segmentsEN: [SentenceSegment] { SentenceSegment.split(sentence.en) }
        /// `sentence.vi` split into text and blanks (may have no blank).
        public var segmentsVI: [SentenceSegment] { SentenceSegment.split(sentence.vi) }
    }

    /// `order_sequence`: `answer` is the right permutation of `items`, by key.
    public struct OrderSequence: Codable, Hashable, Sendable {
        public let items: [SequenceItem]
        public let answer: [Key]

        public struct SequenceItem: Codable, Hashable, Sendable {
            public let key: Key
            public let label: Spoken
            public let image: ContentImage?
        }
    }

    /// `picture_bar_chart`: read a picture bar chart, then answer like `single_choice`.
    public struct PictureBarChart: Codable, Hashable, Sendable {
        public let chart: BarChart
        public let options: [ChoiceOption]

        public struct BarChart: Codable, Hashable, Sendable {
            public let title: Spoken?
            public let unit: Spoken?
            public let bars: [Bar]
        }

        public struct Bar: Codable, Hashable, Sendable {
            public let key: Key
            public let label: Spoken
            public let image: ContentImage?
            /// ≥ 0.
            public let value: Double
        }
    }
}
