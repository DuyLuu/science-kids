import Foundation

/// A word of `lesson.vocab` (vocab-term.schema.json). `term.en` is the English word, `term.vi` its meaning.
public struct VocabTerm: Codable, Hashable, Sendable {
    public let id: UUID
    public let key: Key
    public let term: Spoken
    public let example: Spoken
    public let image: ContentImage?
    /// `core` when absent.
    public let tier: Tier

    /// `core` = a new word of the lesson, tested; `extra` = extra reading.
    public struct Tier: OpenStringEnum {
        public let rawValue: String
        public init(rawValue: String) { self.rawValue = rawValue }

        public static let core = Tier(rawValue: "core")
        public static let extra = Tier(rawValue: "extra")

        public static let known: [Tier] = [.core, .extra]
    }

    enum CodingKeys: String, CodingKey {
        case id, key, term, example, image, tier
    }

    public init(from decoder: any Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        id = try c.decode(UUID.self, forKey: .id)
        key = try c.decode(Key.self, forKey: .key)
        term = try c.decode(Spoken.self, forKey: .term)
        example = try c.decode(Spoken.self, forKey: .example)
        image = try c.decodeIfPresent(ContentImage.self, forKey: .image)
        tier = try c.decodeIfPresent(Tier.self, forKey: .tier) ?? .core
    }
}

/// A collectible card (collectible.schema.json).
public struct Collectible: Codable, Hashable, Sendable {
    public let id: UUID
    public let key: Key
    /// Card set, for example `food`.
    public let set: Key
    public let name: Spoken
    /// For example the food group of the card.
    public let tag: Spoken?
    public let image: ContentImage
    /// "Did you know?"
    public let fact: Spoken
    /// `common` when absent.
    public let rarity: Rarity

    public struct Rarity: OpenStringEnum {
        public let rawValue: String
        public init(rawValue: String) { self.rawValue = rawValue }

        public static let common = Rarity(rawValue: "common")
        public static let rare = Rarity(rawValue: "rare")

        public static let known: [Rarity] = [.common, .rare]
    }

    enum CodingKeys: String, CodingKey {
        case id, key, set, name, tag, image, fact, rarity
    }

    public init(from decoder: any Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        id = try c.decode(UUID.self, forKey: .id)
        key = try c.decode(Key.self, forKey: .key)
        set = try c.decode(Key.self, forKey: .set)
        name = try c.decode(Spoken.self, forKey: .name)
        tag = try c.decodeIfPresent(Spoken.self, forKey: .tag)
        image = try c.decode(ContentImage.self, forKey: .image)
        fact = try c.decode(Spoken.self, forKey: .fact)
        rarity = try c.decodeIfPresent(Rarity.self, forKey: .rarity) ?? .common
    }
}

/// `lesson.reward`.
public struct Reward: Codable, Hashable, Sendable {
    public let collectible: Collectible?
}
