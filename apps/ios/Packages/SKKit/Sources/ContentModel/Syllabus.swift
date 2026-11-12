import Foundation

/// `content/syllabus.json` (SK-030): the approved syllabus as a list, every topic and lesson of the
/// three age groups in order, written or not. The app bundles it (like `content/rules.json`) and
/// lays the content it has over it (`ContentKit.Journey`): the topic of `topicId`, the lessons of
/// `lessonId`. Not in the content pack yet (later, with the CMS).
///
/// Read loosely like the content files: unknown fields are ignored (`source`, `oak_lessons`, which
/// the app never shows), `age_group` and `strand` are open enums. `title.vi` may be `null` while a
/// lesson title is not translated yet: show `en` then (`Syllabus.Title`).
public struct Syllabus: Codable, Hashable, Sendable {
    public let schemaVersion: Int
    /// Date of the approved syllabus, `2026-11-09`.
    public let syllabusVersion: String
    public let aiDraft: Bool
    public let groups: [Group]

    public init(schemaVersion: Int = 1, syllabusVersion: String, aiDraft: Bool = false, groups: [Group]) {
        self.schemaVersion = schemaVersion
        self.syllabusVersion = syllabusVersion
        self.aiDraft = aiDraft
        self.groups = groups
    }

    enum CodingKeys: String, CodingKey {
        case schemaVersion = "schema_version"
        case syllabusVersion = "syllabus_version"
        case aiDraft = "ai_draft"
        case groups
    }

    public init(from decoder: any Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        schemaVersion = try c.decode(Int.self, forKey: .schemaVersion)
        syllabusVersion = try c.decode(String.self, forKey: .syllabusVersion)
        aiDraft = try c.decodeIfPresent(Bool.self, forKey: .aiDraft) ?? false
        groups = try c.decode([Group].self, forKey: .groups)
    }

    /// The topics of one age group, by `number`; empty when the file has no such group.
    public func topics(for ageGroup: Topic.AgeGroup) -> [TopicEntry] {
        groups.first { $0.ageGroup == ageGroup }?.topics.sorted { $0.number < $1.number } ?? []
    }

    /// Decodes the file; a bad field throws with its JSON pointer, like the content files.
    public static func decode(from data: Data) throws(ContentDecodingError) -> Syllabus {
        try ContentDecoder.decode(Syllabus.self, from: data)
    }

    /// A name in the syllabus: `en` always, `vi` once translated (`null` until then).
    public struct Title: Codable, Hashable, Sendable {
        public let en: String
        public let vi: String?

        public init(en: String, vi: String?) {
            self.en = en
            self.vi = vi
        }

        /// The title of a content file, which always has both languages.
        public init(_ spoken: Spoken) {
            self.init(en: spoken.en, vi: spoken.vi)
        }
    }

    /// One age group: Explorer (Year 1–2), Discoverer (Year 3–4), Scientist (Year 5–6).
    public struct Group: Codable, Hashable, Sendable {
        public let ageGroup: Topic.AgeGroup
        /// UK school years of the group (`[1, 2]`), for reference.
        public let oakYears: [Int]
        public let topics: [TopicEntry]

        public init(ageGroup: Topic.AgeGroup, oakYears: [Int] = [], topics: [TopicEntry]) {
            self.ageGroup = ageGroup
            self.oakYears = oakYears
            self.topics = topics
        }

        enum CodingKeys: String, CodingKey {
            case ageGroup = "age_group"
            case oakYears = "oak_years"
            case topics
        }

        public init(from decoder: any Decoder) throws {
            let c = try decoder.container(keyedBy: CodingKeys.self)
            ageGroup = try c.decode(Topic.AgeGroup.self, forKey: .ageGroup)
            oakYears = try c.decodeIfPresent([Int].self, forKey: .oakYears) ?? []
            topics = try c.decode([TopicEntry].self, forKey: .topics)
        }
    }

    /// A topic of the syllabus. `topicId` only once the topic has written content.
    public struct TopicEntry: Codable, Hashable, Sendable {
        /// Oak unit slug, or `new-…` for a topic of our own; unique across the file.
        public let key: String
        /// Place in its group, 1…n.
        public let number: Int
        public let title: Title
        public let strand: Topic.Strand
        /// `nil` for a new topic not rated yet.
        public let level: Int?
        public let topicId: UUID?
        public let lessons: [LessonEntry]
        /// UK school year of the Oak unit (`source.year`); `nil` for a topic of our own (`new-…`).
        /// SK-034: the journey map groups topics that follow each other with the same year into
        /// one stage ("Chặng n").
        public let oakYear: Int?

        public init(
            key: String, number: Int, title: Title, strand: Topic.Strand, level: Int?,
            topicId: UUID? = nil, lessons: [LessonEntry], oakYear: Int? = nil
        ) {
            self.key = key
            self.number = number
            self.title = title
            self.strand = strand
            self.level = level
            self.topicId = topicId
            self.lessons = lessons
            self.oakYear = oakYear
        }

        enum CodingKeys: String, CodingKey {
            case key, number, title, strand, level
            case topicId = "topic_id"
            case lessons
            case source
        }

        /// `source` of the file: only the year is read (`kind`, `unit_slug`, `unit_index` are not).
        private struct Source: Codable, Hashable {
            let year: Int?
        }

        public init(from decoder: any Decoder) throws {
            let c = try decoder.container(keyedBy: CodingKeys.self)
            key = try c.decode(String.self, forKey: .key)
            number = try c.decode(Int.self, forKey: .number)
            title = try c.decode(Title.self, forKey: .title)
            strand = try c.decode(Topic.Strand.self, forKey: .strand)
            level = try c.decodeIfPresent(Int.self, forKey: .level)
            topicId = try c.decodeIfPresent(UUID.self, forKey: .topicId)
            lessons = try c.decode([LessonEntry].self, forKey: .lessons)
            oakYear = try c.decodeIfPresent(Source.self, forKey: .source)?.year
        }

        public func encode(to encoder: any Encoder) throws {
            var c = encoder.container(keyedBy: CodingKeys.self)
            try c.encode(key, forKey: .key)
            try c.encode(number, forKey: .number)
            try c.encode(title, forKey: .title)
            try c.encode(strand, forKey: .strand)
            try c.encode(level, forKey: .level)
            try c.encodeIfPresent(topicId, forKey: .topicId)
            try c.encode(lessons, forKey: .lessons)
            try c.encodeIfPresent(oakYear.map { Source(year: $0) }, forKey: .source)
        }
    }

    /// A lesson of a syllabus topic. `lessonId` only once the lesson is written.
    public struct LessonEntry: Codable, Hashable, Sendable {
        /// Place in its topic, 1…n.
        public let number: Int
        public let title: Title
        public let statutory: Bool
        /// Needs a parent's go-ahead once the Parent Area exists (B4).
        public let sensitive: Bool
        public let lessonId: UUID?

        public init(number: Int, title: Title, statutory: Bool = true, sensitive: Bool = false, lessonId: UUID? = nil) {
            self.number = number
            self.title = title
            self.statutory = statutory
            self.sensitive = sensitive
            self.lessonId = lessonId
        }

        enum CodingKeys: String, CodingKey {
            case number, title, statutory, sensitive
            case lessonId = "lesson_id"
        }

        public init(from decoder: any Decoder) throws {
            let c = try decoder.container(keyedBy: CodingKeys.self)
            number = try c.decode(Int.self, forKey: .number)
            title = try c.decode(Title.self, forKey: .title)
            statutory = try c.decodeIfPresent(Bool.self, forKey: .statutory) ?? true
            sensitive = try c.decodeIfPresent(Bool.self, forKey: .sensitive) ?? false
            lessonId = try c.decodeIfPresent(UUID.self, forKey: .lessonId)
        }
    }
}
