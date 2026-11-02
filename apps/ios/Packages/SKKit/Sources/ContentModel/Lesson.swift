import Foundation

/// A lesson file (`<nn>-<slug>.json`, `kind: "lesson"`), lesson.schema.json.
///
/// Blocks and items the app does not know are dropped while decoding (technical-plan B4.2):
/// `learn`, `warmup` and `quiz` hold only what LessonPlayer can render, and `skipped` lists what
/// was dropped. `ContentDecoder` logs `skipped`. `play` keeps `.unknown` (there is exactly one
/// play block), so LessonPlayer can skip the Play step; it is listed in `skipped` too.
public struct Lesson: Codable, Hashable, Sendable {
    public let schemaVersion: Int
    public let id: UUID
    public let topicId: UUID
    public let slug: String
    public let order: Int
    public let stage: Stage
    public let title: Spoken
    /// "I can…"
    public let objective: Spoken
    /// Exactly 3 in v1.
    public let keyPoints: [Spoken]
    public let estMinutes: Int
    public let sensitive: Bool
    public let archived: Bool
    public let aiDraft: Bool
    /// Hand-written warmup items, known formats only.
    public let warmup: [QuizItem]
    /// Learn blocks, known types only.
    public let learn: [LearnBlock]
    public let play: PlayBlock
    /// Quiz items, known formats only (6 in a v1 lesson the app fully understands).
    public let quiz: [QuizItem]
    public let vocab: [VocabTerm]
    public let reward: Reward
    /// What decoding dropped, in file order. Not part of the file.
    public let skipped: [SkippedContent]

    public struct Stage: OpenStringEnum {
        public let rawValue: String
        public init(rawValue: String) { self.rawValue = rawValue }

        public static let opener = Stage(rawValue: "opener")
        public static let core = Stage(rawValue: "core")
        public static let apply = Stage(rawValue: "apply")
        public static let review = Stage(rawValue: "review")

        public static let known: [Stage] = [.opener, .core, .apply, .review]
    }

    enum CodingKeys: String, CodingKey {
        case kind
        case schemaVersion = "schema_version"
        case id
        case topicId = "topic_id"
        case slug, order, stage, title, objective
        case keyPoints = "key_points"
        case estMinutes = "est_minutes"
        case sensitive, archived
        case aiDraft = "ai_draft"
        case warmup, learn, play, quiz, vocab, reward
    }

    public init(from decoder: any Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        try FileKind.expect("lesson", in: c, forKey: .kind)
        schemaVersion = try c.decode(Int.self, forKey: .schemaVersion)
        id = try c.decode(UUID.self, forKey: .id)
        topicId = try c.decode(UUID.self, forKey: .topicId)
        slug = try c.decode(String.self, forKey: .slug)
        order = try c.decode(Int.self, forKey: .order)
        stage = try c.decode(Stage.self, forKey: .stage)
        title = try c.decode(Spoken.self, forKey: .title)
        objective = try c.decode(Spoken.self, forKey: .objective)
        keyPoints = try c.decode([Spoken].self, forKey: .keyPoints)
        estMinutes = try c.decode(Int.self, forKey: .estMinutes)
        sensitive = try c.decodeIfPresent(Bool.self, forKey: .sensitive) ?? false
        archived = try c.decodeIfPresent(Bool.self, forKey: .archived) ?? false
        aiDraft = try c.decodeIfPresent(Bool.self, forKey: .aiDraft) ?? false

        var skipped: [SkippedContent] = []

        let allWarmup = try c.decode([QuizItem].self, forKey: .warmup)
        warmup = Self.keepKnown(allWarmup, section: "warmup", skipped: &skipped)

        let allLearn = try c.decode([LearnBlock].self, forKey: .learn)
        var learn: [LearnBlock] = []
        for (index, block) in allLearn.enumerated() {
            if case .unknown(let type, let id) = block {
                skipped.append(SkippedContent(path: "/learn/\(index)", kind: .block(type: type), id: id))
            } else {
                learn.append(block)
            }
        }
        self.learn = learn

        play = try c.decode(PlayBlock.self, forKey: .play)
        if case .unknown(let type, let id) = play {
            skipped.append(SkippedContent(path: "/play", kind: .block(type: type), id: id))
        }

        let allQuiz = try c.decode([QuizItem].self, forKey: .quiz)
        quiz = Self.keepKnown(allQuiz, section: "quiz", skipped: &skipped)

        vocab = try c.decode([VocabTerm].self, forKey: .vocab)
        reward = try c.decode(Reward.self, forKey: .reward)
        self.skipped = skipped
    }

    private static func keepKnown(
        _ items: [QuizItem], section: String, skipped: inout [SkippedContent]
    ) -> [QuizItem] {
        var known: [QuizItem] = []
        for (index, item) in items.enumerated() {
            if item.isUnknown {
                skipped.append(SkippedContent(path: "/\(section)/\(index)", kind: .quizItem(format: item.format), id: item.id))
            } else {
                known.append(item)
            }
        }
        return known
    }

    /// Encodes what the app kept (dropped blocks and items are gone; `skipped` is not written).
    public func encode(to encoder: any Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encode("lesson", forKey: .kind)
        try c.encode(schemaVersion, forKey: .schemaVersion)
        try c.encode(id, forKey: .id)
        try c.encode(topicId, forKey: .topicId)
        try c.encode(slug, forKey: .slug)
        try c.encode(order, forKey: .order)
        try c.encode(stage, forKey: .stage)
        try c.encode(title, forKey: .title)
        try c.encode(objective, forKey: .objective)
        try c.encode(keyPoints, forKey: .keyPoints)
        try c.encode(estMinutes, forKey: .estMinutes)
        try c.encode(sensitive, forKey: .sensitive)
        try c.encode(archived, forKey: .archived)
        try c.encode(aiDraft, forKey: .aiDraft)
        try c.encode(warmup, forKey: .warmup)
        try c.encode(learn, forKey: .learn)
        try c.encode(play, forKey: .play)
        try c.encode(quiz, forKey: .quiz)
        try c.encode(vocab, forKey: .vocab)
        try c.encode(reward, forKey: .reward)
    }
}

/// A block or question that decoding dropped because this app version does not know it.
public struct SkippedContent: Hashable, Sendable, CustomStringConvertible {
    public enum Kind: Hashable, Sendable {
        case block(type: String)
        case quizItem(format: String)
    }

    /// JSON pointer of the dropped entry in the lesson file, for example `/learn/2` or `/quiz/2`.
    public let path: String
    public let kind: Kind
    public let id: UUID?

    public init(path: String, kind: Kind, id: UUID?) {
        self.path = path
        self.kind = kind
        self.id = id
    }

    public var description: String {
        let what = switch kind {
        case .block(let type): "block type \"\(type)\""
        case .quizItem(let format): "quiz format \"\(format)\""
        }
        return "\(path): unknown \(what), id \(id?.uuidString.lowercased() ?? "none")"
    }
}
