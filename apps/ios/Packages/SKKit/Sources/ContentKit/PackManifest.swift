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
    ///
    /// SK-033 (image contract, 9/11): `kind: "image"` is a JPEG (`assets/<sha256>.jpg`) with its
    /// pixel `width`, `height` and the `credit` the "Image credits" screen lists. The three keys
    /// are optional: a pack built before images still opens, and a `credit` the app cannot read
    /// (wrong type) leaves that asset without credit instead of closing the pack.
    public struct AssetEntry: Decodable, Sendable, Equatable {
        public let sha256: String
        public let size: Int
        /// `audio` (m4a clips) or `image` (JPEG, SK-033).
        public let kind: String
        /// Language of an audio clip (`en`, `vi`).
        public let lang: String?
        public let path: String
        /// Pixel size of an image.
        public let width: Int?
        public let height: Int?
        /// Where an image comes from and under which licence.
        public let credit: ImageCredit?

        /// `kind` of a picture.
        public static let imageKind = "image"

        public var isImage: Bool { kind == Self.imageKind }

        enum CodingKeys: String, CodingKey {
            case sha256, size, kind, lang, path, width, height, credit
        }

        public init(
            sha256: String, size: Int, kind: String, lang: String? = nil, path: String,
            width: Int? = nil, height: Int? = nil, credit: ImageCredit? = nil
        ) {
            self.sha256 = sha256
            self.size = size
            self.kind = kind
            self.lang = lang
            self.path = path
            self.width = width
            self.height = height
            self.credit = credit
        }

        public init(from decoder: any Decoder) throws {
            let c = try decoder.container(keyedBy: CodingKeys.self)
            sha256 = try c.decode(String.self, forKey: .sha256)
            size = try c.decode(Int.self, forKey: .size)
            kind = try c.decode(String.self, forKey: .kind)
            lang = try c.decodeIfPresent(String.self, forKey: .lang)
            path = try c.decode(String.self, forKey: .path)
            // Image keys: read loosely, never a reason to refuse the manifest.
            width = (try? c.decodeIfPresent(Int.self, forKey: .width)) ?? nil
            height = (try? c.decodeIfPresent(Int.self, forKey: .height)) ?? nil
            credit = (try? c.decodeIfPresent(ImageCredit.self, forKey: .credit)) ?? nil
        }
    }

    /// `credit` of an image asset (SK-033): what a CC BY licence asks the app to show (title,
    /// author, licence, source, what was changed) and the pages behind them. Every field may be
    /// missing (a public domain picture may have no author); a field of the wrong type reads as
    /// missing.
    ///
    /// A composed picture (SK-033, 10/11: one picture made by Science Kids from several source
    /// pictures) has `source: "composed"`, `changes` with `"composed"`, and the credit of each
    /// source picture in `parts`. `changes` and `parts` are optional: a pack built before them
    /// still opens, with none.
    public struct ImageCredit: Decodable, Sendable, Hashable {
        public let title: String?
        public let author: String?
        /// `CC0 1.0`, `Public domain`, `PDM 1.0`, `CC BY 4.0`…
        public let license: String?
        public let licenseURL: String?
        /// `Wikimedia Commons`, `Openverse/Flickr`, `NASA`… or `composed` (`composedSource`).
        public let source: String?
        /// The picture's own page at its source.
        public let sourceURL: String?
        /// What was done to the source picture, as the manifest writes it: `cropped`, `resized`,
        /// `composed` (CC BY asks to say so). Blank or non-text entries are dropped; values the
        /// app does not know are kept, the screen decides how to show them.
        public let changes: [String]
        /// The source pictures of a composed picture, in the manifest's order. A part that is not
        /// an object, or has no field to show, is dropped.
        public let parts: [Part]

        /// `source` of a picture Science Kids composed from `parts`.
        public static let composedSource = "composed"

        /// Made by Science Kids from several source pictures: `source` is `composed`, or the credit
        /// lists its parts.
        public var isComposed: Bool {
            source?.caseInsensitiveCompare(Self.composedSource) == .orderedSame || !parts.isEmpty
        }

        /// The credit of one source picture of a composed picture.
        public struct Part: Decodable, Sendable, Hashable {
            public let title: String?
            public let author: String?
            public let license: String?
            public let licenseURL: String?
            public let source: String?
            public let sourceURL: String?

            enum CodingKeys: String, CodingKey {
                case title, author, license, source
                case licenseURL = "license_url"
                case sourceURL = "source_url"
            }

            public init(
                title: String? = nil, author: String? = nil, license: String? = nil, licenseURL: String? = nil,
                source: String? = nil, sourceURL: String? = nil
            ) {
                self.title = title
                self.author = author
                self.license = license
                self.licenseURL = licenseURL
                self.source = source
                self.sourceURL = sourceURL
            }

            public init(from decoder: any Decoder) throws {
                let c = try decoder.container(keyedBy: CodingKeys.self)
                title = c.looseText(.title)
                author = c.looseText(.author)
                license = c.looseText(.license)
                licenseURL = c.looseText(.licenseURL)
                source = c.looseText(.source)
                sourceURL = c.looseText(.sourceURL)
            }

            /// No field to show.
            public var isEmpty: Bool {
                [title, author, license, licenseURL, source, sourceURL].allSatisfy { $0 == nil }
            }
        }

        enum CodingKeys: String, CodingKey {
            case title, author, license, source, changes, parts
            case licenseURL = "license_url"
            case sourceURL = "source_url"
        }

        public init(
            title: String? = nil, author: String? = nil, license: String? = nil, licenseURL: String? = nil,
            source: String? = nil, sourceURL: String? = nil, changes: [String] = [], parts: [Part] = []
        ) {
            self.title = title
            self.author = author
            self.license = license
            self.licenseURL = licenseURL
            self.source = source
            self.sourceURL = sourceURL
            self.changes = changes
            self.parts = parts
        }

        public init(from decoder: any Decoder) throws {
            let c = try decoder.container(keyedBy: CodingKeys.self)
            title = c.looseText(.title)
            author = c.looseText(.author)
            license = c.looseText(.license)
            licenseURL = c.looseText(.licenseURL)
            source = c.looseText(.source)
            sourceURL = c.looseText(.sourceURL)
            // Both lists read loosely: a wrong type is no list, a bad entry is dropped.
            let changeEntries = (try? c.decodeIfPresent([Loose<String>].self, forKey: .changes)) ?? nil
            changes = (changeEntries ?? []).compactMap { entry in
                guard let value = entry.value?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty else { return nil }
                return value
            }
            let partEntries = (try? c.decodeIfPresent([Loose<Part>].self, forKey: .parts)) ?? nil
            parts = (partEntries ?? []).compactMap(\.value).filter { !$0.isEmpty }
        }

        /// No field to show.
        public var isEmpty: Bool {
            [title, author, license, licenseURL, source, sourceURL].allSatisfy { $0 == nil }
                && changes.isEmpty && parts.isEmpty
        }
    }

    /// One entry of a list read loosely: `nil` when it is not a `Value`, instead of failing the list.
    private struct Loose<Value: Decodable>: Decodable {
        let value: Value?

        init(from decoder: any Decoder) throws {
            value = try? Value(from: decoder)
        }
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

private extension KeyedDecodingContainer {
    /// A text field of a credit: trimmed; blank or of the wrong type reads as missing.
    func looseText(_ key: Key) -> String? {
        guard let value = (try? decodeIfPresent(String.self, forKey: key)) ?? nil else { return nil }
        let trimmed = value.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty ? nil : trimmed
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
