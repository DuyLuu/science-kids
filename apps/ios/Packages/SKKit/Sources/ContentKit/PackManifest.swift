import ContentModel
import Foundation

/// `catalog/v1/manifest.json` of a content pack (B4.3, format of SK-015). Keys the app does not
/// know are ignored, so a newer manifest still opens (GĐ 1 may add keys).
public struct PackManifest: Decodable, Sendable, Equatable {
    /// Path of the manifest from the pack root.
    public static let path = "catalog/v1/manifest.json"
    /// The manifest and `pack.json` versions this app reads.
    public static let supportedSchemaVersion = 1

    public let schemaVersion: Int
    /// Version of the whole catalog; changes with any topic. Not a cache key for a topic (use
    /// `TopicEntry.version`).
    public let contentVersion: String
    public let topics: [TopicEntry]
    public let assets: [AssetEntry]

    /// One topic of the catalog and where its `pack.json` is.
    public struct TopicEntry: Decodable, Sendable, Equatable {
        public let id: UUID
        public let slug: String
        public let ageGroup: Topic.AgeGroup
        public let order: Int
        public let title: Spoken
        public let isFree: Bool
        /// Version of this topic's pack: what a lesson attempt records as `content_version`.
        public let version: String
        public let path: String
        public let sha256: String
        public let size: Int
        /// Lowest app version that opens this topic (`MAJOR.MINOR.PATCH`).
        public let minAppVersion: String?

        enum CodingKeys: String, CodingKey {
            case id, slug, order, title, version, path, sha256, size
            case ageGroup = "age_group"
            case isFree = "is_free"
            case minAppVersion = "min_app_version"
        }
    }

    /// One file of `assets/`, named by the sha256 of its bytes.
    public struct AssetEntry: Decodable, Sendable, Equatable {
        public let sha256: String
        public let size: Int
        /// `audio` (m4a clips) for now; images later.
        public let kind: String
        /// Language of an audio clip (`en`, `vi`).
        public let lang: String?
        public let path: String
    }

    enum CodingKeys: String, CodingKey {
        case topics, assets
        case schemaVersion = "schema_version"
        case contentVersion = "content_version"
    }
}

/// `topics/<topic_id>/<version>/pack.json`: the topic and its lessons, schema v1 (SK-009 models).
/// Decoded part by part (`ContentPack`) so the decoder's JSON pointers and skip log stay those of
/// a topic or lesson file.
struct TopicPackHeader: Decodable {
    let schemaVersion: Int
    let topicId: UUID
    let version: String

    enum CodingKeys: String, CodingKey {
        case version
        case schemaVersion = "schema_version"
        case topicId = "topic_id"
    }
}

/// `MAJOR.MINOR.PATCH` compared number by number (`min_app_version`).
public struct AppVersion: Comparable, Sendable, CustomStringConvertible {
    public let parts: [Int]

    public init?(_ text: String) {
        let parts = text.split(separator: ".", omittingEmptySubsequences: false).map { Int($0) }
        guard !parts.isEmpty, parts.count <= 3, parts.allSatisfy({ $0 != nil && $0! >= 0 }) else { return nil }
        self.parts = parts.compactMap { $0 } + Array(repeating: 0, count: 3 - parts.count)
    }

    public static func < (lhs: AppVersion, rhs: AppVersion) -> Bool {
        lhs.parts.lexicographicallyPrecedes(rhs.parts)
    }

    public var description: String { parts.map(String.init).joined(separator: ".") }
}
