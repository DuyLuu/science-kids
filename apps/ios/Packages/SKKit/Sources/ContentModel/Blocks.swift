import Foundation

// Blocks of block.schema.json. Block fields sit flat next to `type` (SK-001 decision 1).
// A `type` the app does not know decodes as `.unknown`; `Lesson` drops it and `ContentDecoder` logs it.

private enum BlockTypeKey: String, CodingKey {
    case type, id
}

/// A block of `lesson.learn` (`LearnBlock` in the schema).
public enum LearnBlock: Codable, Hashable, Sendable {
    case exploreGroups(ExploreGroups)
    case sentenceCard(SentenceCard)
    case wordList(WordList)
    /// A `type` this app version cannot render (for example `hotspot_image`), or a play block placed in `learn`.
    case unknown(type: String, id: UUID?)

    public var type: String {
        switch self {
        case .exploreGroups: "explore_groups"
        case .sentenceCard: "sentence_card"
        case .wordList: "word_list"
        case .unknown(let type, _): type
        }
    }

    public var id: UUID? {
        switch self {
        case .exploreGroups(let block): block.id
        case .sentenceCard(let block): block.id
        case .wordList(let block): block.id
        case .unknown(_, let id): id
        }
    }

    public var isUnknown: Bool {
        if case .unknown = self { true } else { false }
    }

    public init(from decoder: any Decoder) throws {
        let c = try decoder.container(keyedBy: BlockTypeKey.self)
        let type = try c.decode(String.self, forKey: .type)
        switch type {
        case "explore_groups": self = .exploreGroups(try ExploreGroups(from: decoder))
        case "sentence_card": self = .sentenceCard(try SentenceCard(from: decoder))
        case "word_list": self = .wordList(try WordList(from: decoder))
        default: self = .unknown(type: type, id: try? c.decodeIfPresent(UUID.self, forKey: .id))
        }
    }

    public func encode(to encoder: any Encoder) throws {
        var c = encoder.container(keyedBy: BlockTypeKey.self)
        try c.encode(type, forKey: .type)
        switch self {
        case .exploreGroups(let block): try block.encode(to: encoder)
        case .sentenceCard(let block): try block.encode(to: encoder)
        case .wordList(let block): try block.encode(to: encoder)
        case .unknown(_, let id): try c.encodeIfPresent(id, forKey: .id)
        }
    }
}

/// The block of `lesson.play` (`PlayBlock` in the schema).
public enum PlayBlock: Codable, Hashable, Sendable {
    case buildTray(BuildTray)
    /// A mini-game this app version cannot run; LessonPlayer skips the Play step.
    case unknown(type: String, id: UUID?)

    public var type: String {
        switch self {
        case .buildTray: "build_tray"
        case .unknown(let type, _): type
        }
    }

    public var id: UUID? {
        switch self {
        case .buildTray(let block): block.id
        case .unknown(_, let id): id
        }
    }

    public var isUnknown: Bool {
        if case .unknown = self { true } else { false }
    }

    public init(from decoder: any Decoder) throws {
        let c = try decoder.container(keyedBy: BlockTypeKey.self)
        let type = try c.decode(String.self, forKey: .type)
        switch type {
        case "build_tray": self = .buildTray(try BuildTray(from: decoder))
        default: self = .unknown(type: type, id: try? c.decodeIfPresent(UUID.self, forKey: .id))
        }
    }

    public func encode(to encoder: any Encoder) throws {
        var c = encoder.container(keyedBy: BlockTypeKey.self)
        try c.encode(type, forKey: .type)
        switch self {
        case .buildTray(let block): try block.encode(to: encoder)
        case .unknown(_, let id): try c.encodeIfPresent(id, forKey: .id)
        }
    }
}

// MARK: - Learn blocks

/// Learn: tap each group; each group has a sentence and example foods (Discoverer Learn screen).
public struct ExploreGroups: ContentBlock, Codable, Hashable {
    public let id: UUID
    public let key: Key
    public let version: Int
    public let minAppVersion: String?
    public let prompt: Spoken
    public let groups: [ExploreGroup]
    /// `"all_seen"` in v1.
    public let completeWhen: String

    enum CodingKeys: String, CodingKey {
        case id, key, version
        case minAppVersion = "min_app_version"
        case prompt, groups
        case completeWhen = "complete_when"
    }
}

public struct ExploreGroup: Codable, Hashable, Sendable {
    public let key: Key
    public let label: Spoken
    public let color: ColorToken
    public let sentence: Spoken
    public let image: ContentImage?
    public let examples: [Spoken]
}

/// Learn: one sentence with a picture.
public struct SentenceCard: ContentBlock, Codable, Hashable {
    public let id: UUID
    public let key: Key
    public let version: Int
    public let minAppVersion: String?
    public let text: Spoken
    public let image: ContentImage?

    enum CodingKeys: String, CodingKey {
        case id, key, version
        case minAppVersion = "min_app_version"
        case text, image
    }
}

/// Learn: the New words box; `termKeys` point into `lesson.vocab`.
public struct WordList: ContentBlock, Codable, Hashable {
    public let id: UUID
    public let key: Key
    public let version: Int
    public let minAppVersion: String?
    public let title: Spoken?
    public let termKeys: [Key]

    enum CodingKeys: String, CodingKey {
        case id, key, version
        case minAppVersion = "min_app_version"
        case title
        case termKeys = "term_keys"
    }
}

// MARK: - Play blocks

/// Play: pick foods for the tray, with rules per group (Discoverer Play screen).
public struct BuildTray: ContentBlock, Codable, Hashable {
    public let id: UUID
    public let key: Key
    public let version: Int
    public let minAppVersion: String?
    public let prompt: Spoken
    /// Number of places on the tray.
    public let capacity: Int
    public let groups: [TrayGroup]
    public let items: [TrayItem]
    public let messages: TrayMessages
    /// `"all_required_and_no_limit"` in v1.
    public let successWhen: String

    enum CodingKeys: String, CodingKey {
        case id, key, version
        case minAppVersion = "min_app_version"
        case prompt, capacity, groups, items, messages
        case successWhen = "success_when"
    }

    /// A "missing group" prompt, paired with its group.
    public struct MissingMessage: Hashable, Sendable {
        public let group: TrayGroup
        public let message: Spoken
    }

    /// The `messages.missing` prompts in the order of `groups`, required groups only.
    ///
    /// `JSONDecoder` does not keep the key order of a JSON object, so the order in which the tray
    /// checks for a missing group comes from `groups` (SK-009 decision 1).
    public var missingMessagesInGroupOrder: [MissingMessage] {
        groups.compactMap { group in
            guard group.role == .required, let message = messages.missing[group.key] else { return nil }
            return MissingMessage(group: group, message: message)
        }
    }
}

public struct TrayGroup: Codable, Hashable, Sendable {
    public let key: Key
    public let label: Spoken
    public let color: ColorToken
    public let role: Role

    /// `required` = the tray must have it; `limit` = must not have it; `neutral` = either.
    public struct Role: OpenStringEnum {
        public let rawValue: String
        public init(rawValue: String) { self.rawValue = rawValue }

        public static let required = Role(rawValue: "required")
        public static let limit = Role(rawValue: "limit")
        public static let neutral = Role(rawValue: "neutral")

        public static let known: [Role] = [.required, .limit, .neutral]
    }
}

public struct TrayItem: Codable, Hashable, Sendable {
    public let key: Key
    public let label: Spoken
    /// Key of a group in `BuildTray.groups`.
    public let group: Key
    public let image: ContentImage?
}

public struct TrayMessages: Codable, Hashable, Sendable {
    public let start: Spoken
    public let full: Spoken
    public let balanced: Spoken
    public let hasLimited: Spoken
    /// Prompt per required group key. Unordered: use `BuildTray.missingMessagesInGroupOrder`.
    public let missing: [Key: Spoken]

    enum CodingKeys: String, CodingKey {
        case start, full, balanced
        case hasLimited = "has_limited"
        case missing
    }
}
