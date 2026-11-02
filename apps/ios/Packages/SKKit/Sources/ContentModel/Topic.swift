import Foundation

/// A topic file (`topic.json`, `kind: "topic"`), topic.schema.json.
public struct Topic: Codable, Hashable, Sendable {
    public let schemaVersion: Int
    public let id: UUID
    public let slug: String
    public let ageGroup: AgeGroup
    public let order: Int
    public let title: Spoken
    /// The big question on the Topic screen.
    public let question: Spoken?
    public let strand: Strand
    public let level: Int
    public let difficulty: Difficulty
    public let prerequisiteTopicIds: [UUID]
    public let isFree: Bool
    /// Internal only, never shown to a child.
    public let oakUnitRef: String?
    public let sensitive: Bool
    public let archived: Bool
    public let aiDraft: Bool
    public let misconceptions: [Misconception]

    public struct AgeGroup: OpenStringEnum {
        public let rawValue: String
        public init(rawValue: String) { self.rawValue = rawValue }

        public static let explorer = AgeGroup(rawValue: "explorer")
        public static let discoverer = AgeGroup(rawValue: "discoverer")
        public static let scientist = AgeGroup(rawValue: "scientist")

        public static let known: [AgeGroup] = [.explorer, .discoverer, .scientist]
    }

    public struct Strand: OpenStringEnum {
        public let rawValue: String
        public init(rawValue: String) { self.rawValue = rawValue }

        public static let plantsAnimals = Strand(rawValue: "plants_animals")
        public static let livingEnvironment = Strand(rawValue: "living_environment")
        public static let humansHealth = Strand(rawValue: "humans_health")
        public static let materials = Strand(rawValue: "materials")
        public static let energyForces = Strand(rawValue: "energy_forces")
        public static let earthSky = Strand(rawValue: "earth_sky")

        public static let known: [Strand] = [
            .plantsAnimals, .livingEnvironment, .humansHealth, .materials, .energyForces, .earthSky,
        ]
    }

    /// Rubric of syllabus-progression section 3, each cell 1–3.
    public struct Difficulty: Codable, Hashable, Sendable {
        public let abstraction: Int
        public let priorKnowledge: Int
        public let misconception: Int
        public let vocabulary: Int
        public let scienceSkill: Int

        enum CodingKeys: String, CodingKey {
            case abstraction
            case priorKnowledge = "prior_knowledge"
            case misconception
            case vocabulary
            case scienceSkill = "science_skill"
        }
    }

    enum CodingKeys: String, CodingKey {
        case kind
        case schemaVersion = "schema_version"
        case id, slug
        case ageGroup = "age_group"
        case order, title, question, strand, level, difficulty
        case prerequisiteTopicIds = "prerequisite_topic_ids"
        case isFree = "is_free"
        case oakUnitRef = "oak_unit_ref"
        case sensitive, archived
        case aiDraft = "ai_draft"
        case misconceptions
    }

    public init(from decoder: any Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        try FileKind.expect("topic", in: c, forKey: .kind)
        schemaVersion = try c.decode(Int.self, forKey: .schemaVersion)
        id = try c.decode(UUID.self, forKey: .id)
        slug = try c.decode(String.self, forKey: .slug)
        ageGroup = try c.decode(AgeGroup.self, forKey: .ageGroup)
        order = try c.decode(Int.self, forKey: .order)
        title = try c.decode(Spoken.self, forKey: .title)
        question = try c.decodeIfPresent(Spoken.self, forKey: .question)
        strand = try c.decode(Strand.self, forKey: .strand)
        level = try c.decode(Int.self, forKey: .level)
        difficulty = try c.decode(Difficulty.self, forKey: .difficulty)
        prerequisiteTopicIds = try c.decode([UUID].self, forKey: .prerequisiteTopicIds)
        isFree = try c.decode(Bool.self, forKey: .isFree)
        oakUnitRef = try c.decodeIfPresent(String.self, forKey: .oakUnitRef)
        sensitive = try c.decodeIfPresent(Bool.self, forKey: .sensitive) ?? false
        archived = try c.decodeIfPresent(Bool.self, forKey: .archived) ?? false
        aiDraft = try c.decodeIfPresent(Bool.self, forKey: .aiDraft) ?? false
        misconceptions = try c.decode([Misconception].self, forKey: .misconceptions)
    }

    public func encode(to encoder: any Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encode("topic", forKey: .kind)
        try c.encode(schemaVersion, forKey: .schemaVersion)
        try c.encode(id, forKey: .id)
        try c.encode(slug, forKey: .slug)
        try c.encode(ageGroup, forKey: .ageGroup)
        try c.encode(order, forKey: .order)
        try c.encode(title, forKey: .title)
        try c.encodeIfPresent(question, forKey: .question)
        try c.encode(strand, forKey: .strand)
        try c.encode(level, forKey: .level)
        try c.encode(difficulty, forKey: .difficulty)
        try c.encode(prerequisiteTopicIds, forKey: .prerequisiteTopicIds)
        try c.encode(isFree, forKey: .isFree)
        try c.encodeIfPresent(oakUnitRef, forKey: .oakUnitRef)
        try c.encode(sensitive, forKey: .sensitive)
        try c.encode(archived, forKey: .archived)
        try c.encode(aiDraft, forKey: .aiDraft)
        try c.encode(misconceptions, forKey: .misconceptions)
    }
}

/// A misconception of a topic; quiz items point at it by `misconception_id`.
public struct Misconception: Codable, Hashable, Sendable {
    public let id: UUID
    public let key: Key
    public let statement: BilingualText
    public let correction: BilingualText
    public let note: String?
}
