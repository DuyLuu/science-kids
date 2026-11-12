import ContentModel
import CryptoKit
import Foundation
import os

/// Why a pack, a topic of it or one of its assets is not used. Each case says what to look at.
public enum ContentPackError: Error, Equatable, Sendable, CustomStringConvertible {
    /// The source has no file at this path.
    case missingFile(path: String)
    case unreadable(path: String, reason: String)
    /// A path in the manifest that leaves the pack (absolute, `..`, empty part).
    case badPath(String)
    /// The manifest is not JSON or misses a required key.
    case manifestUnreadable(reason: String)
    /// `schema_version` of the manifest or of a `pack.json` that this app does not read.
    case unsupportedSchema(path: String, found: Int)
    /// The bytes are not the ones the manifest lists: size or sha256 differs.
    case mismatch(path: String, expectedSize: Int, actualSize: Int, expectedSHA256: String, actualSHA256: String)
    /// `pack.json` passed its checksum but its topic does not decode.
    case packUnreadable(path: String, reason: String)
    /// `pack.json` holds another topic than its manifest entry.
    case wrongTopic(path: String, expected: UUID, found: UUID)
    /// The topic needs a newer app (`min_app_version`).
    case appTooOld(path: String, needs: String, app: String)
    /// An `AssetHash` the manifest does not list.
    case unknownAsset(String)

    public var description: String {
        switch self {
        case .missingFile(let path): "\(path): missing from the pack"
        case .unreadable(let path, let reason): "\(path): unreadable (\(reason))"
        case .badPath(let path): "\(path): not a path inside the pack"
        case .manifestUnreadable(let reason): "\(PackManifest.path): unreadable (\(reason))"
        case .unsupportedSchema(let path, let found): "\(path): schema_version \(found), this app reads \(PackManifest.supportedSchemaVersion)"
        case .mismatch(let path, let expectedSize, let actualSize, let expectedSHA, let actualSHA):
            if expectedSize != actualSize {
                "\(path): size \(actualSize) bytes, the manifest says \(expectedSize) (sha256 \(actualSHA.prefix(12))…, expected \(expectedSHA.prefix(12))…)"
            } else {
                "\(path): sha256 \(actualSHA.prefix(12))…, the manifest says \(expectedSHA.prefix(12))… (same size, \(actualSize) bytes)"
            }
        case .packUnreadable(let path, let reason): "\(path): does not decode (\(reason))"
        case .wrongTopic(let path, let expected, let found):
            "\(path): topic \(found.uuidString.lowercased()), the manifest says \(expected.uuidString.lowercased())"
        case .appTooOld(let path, let needs, let app): "\(path): needs app \(needs), this is \(app)"
        case .unknownAsset(let hash): "asset \(hash): not in the manifest"
        }
    }
}

/// A content pack opened and checked (B4.3, SK-016): the manifest, the topics whose `pack.json`
/// matched its `sha256` and `size`, the scoring rules, and verified access to the assets.
///
/// - `pack.json` that does not match: that whole topic is left out (`rejected`), with a log line.
/// - An asset that does not match: only that asset is refused when it is asked for
///   (`assetData(for:)` throws); the rest of the pack is used.
public struct ContentPack: Sendable {
    public let manifest: PackManifest
    /// Topics and lessons opened from the pack, as `LocalContentLibrary` gives them (archived and
    /// sensitive content left out).
    public let library: ContentLibrary
    /// Topics that were not opened, and why.
    public let rejected: [Rejected]
    /// The manifest's `rules` object as JSON: `{ "<age_group>": { … } }`, the shape of
    /// `content/rules.json` (`LessonRules.load(from:ageGroup:)`).
    public let rulesData: Data?

    let source: any PackSource
    let assets: [String: PackManifest.AssetEntry]
    let log: Logger

    public struct Rejected: Sendable, Equatable, CustomStringConvertible {
        public let topicID: UUID
        public let slug: String
        public let error: ContentPackError

        public var description: String { "topic \(slug): \(error)" }
    }

    /// Reads the manifest, then every topic's `pack.json` after checking its size and sha256.
    /// Throws only when the manifest itself cannot be used; a bad topic is in `rejected`.
    ///
    /// `appVersion` is the app's `CFBundleShortVersionString`; topics with a higher
    /// `min_app_version` are left out. `nil` skips the check.
    public static func load(
        from source: any PackSource,
        appVersion: String?,
        decoder: ContentDecoder = ContentDecoder(),
        log: Logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "ScienceKids", category: "content")
    ) async throws(ContentPackError) -> ContentPack {
        let manifestData: Data
        do {
            manifestData = try await source.data(at: PackManifest.path)
        } catch {
            throw Self.packError(error, path: PackManifest.path)
        }
        let manifest: PackManifest
        do {
            manifest = try JSONDecoder().decode(PackManifest.self, from: manifestData)
        } catch {
            throw .manifestUnreadable(reason: ContentDecodingError.describe(error))
        }
        guard manifest.schemaVersion == PackManifest.supportedSchemaVersion else {
            throw .unsupportedSchema(path: PackManifest.path, found: manifest.schemaVersion)
        }
        let rulesData = Self.rulesData(of: manifestData)

        var topics: [TopicContent] = []
        var rejected: [Rejected] = []
        for entry in manifest.topics.sorted(by: { ($0.order, $0.slug) < ($1.order, $1.slug) }) {
            do {
                if let topic = try await openTopic(entry, from: source, appVersion: appVersion, decoder: decoder, log: log) {
                    topics.append(topic)
                }
            } catch {
                let reason = Self.packError(error, path: entry.path)
                rejected.append(Rejected(topicID: entry.id, slug: entry.slug, error: reason))
                log.error("pack topic rejected: \(reason.description, privacy: .public)")
            }
        }

        var assets: [String: PackManifest.AssetEntry] = [:]
        for asset in manifest.assets { assets[asset.sha256.lowercased()] = asset }
        log.notice("pack opened: content_version \(manifest.contentVersion, privacy: .public), \(topics.count) topic(s), \(rejected.count) rejected, \(assets.count) asset(s)")
        return ContentPack(
            manifest: manifest, library: ContentLibrary(topics: topics), rejected: rejected,
            rulesData: rulesData, source: source, assets: assets, log: log
        )
    }

    /// Version of a topic's pack (`topics[].version`), for `content_version` of an attempt.
    public func topicVersion(for topicID: UUID) -> String? {
        manifest.topics.first { $0.id == topicID }?.version
    }

    /// The bytes of an asset, after checking them against the manifest (size, then sha256, which
    /// is also the asset's name). A mismatch refuses that asset only, with a log line.
    public func assetData(for hash: AssetHash) async throws(ContentPackError) -> Data {
        let key = hash.lowercased()
        guard let entry = assets[key] else {
            log.error("asset refused: \(ContentPackError.unknownAsset(hash).description, privacy: .public)")
            throw .unknownAsset(hash)
        }
        let data: Data
        do {
            data = try await source.data(at: entry.path)
        } catch {
            let reason = Self.packError(error, path: entry.path)
            log.error("asset refused: \(reason.description, privacy: .public)")
            throw reason
        }
        do {
            try Self.verify(data, path: entry.path, size: entry.size, sha256: key)
        } catch {
            log.error("asset refused: \(error.description, privacy: .public)")
            throw error
        }
        return data
    }

    /// A local file of an asset whose bytes were just checked (`assetData(for:)`).
    public func assetURL(for hash: AssetHash) async throws(ContentPackError) -> URL {
        _ = try await assetData(for: hash)
        do {
            // Checked above: the entry exists.
            return try await source.fileURL(for: assets[hash.lowercased()]!.path)
        } catch {
            throw Self.packError(error, path: hash)
        }
    }

    /// Whether the manifest lists `hash` (no file read).
    public func hasAsset(_ hash: AssetHash) -> Bool {
        assets[hash.lowercased()] != nil
    }

    // MARK: Images (SK-033)

    /// Whether the manifest lists `hash` as an image (`kind: "image"`; no file read). A content
    /// `Image` whose `asset` is not one draws its stand-in art.
    public func hasImage(_ hash: AssetHash) -> Bool {
        assets[hash.lowercased()]?.isImage == true
    }

    /// The bytes of an image, checked like a clip (size, then sha256). Reading and hashing run
    /// off the caller's actor (a nonisolated async function), never on the main thread.
    public func imageData(for hash: AssetHash) async throws(ContentPackError) -> Data {
        guard hasImage(hash) else {
            log.error("image refused: \(ContentPackError.unknownAsset(hash).description, privacy: .public)")
            throw .unknownAsset(hash)
        }
        return try await assetData(for: hash)
    }

    /// Every image of the pack, for the "Image credits" screen: by title (then author, then
    /// sha256), so the list reads the same on each launch. An image without credit is listed
    /// too (its title missing): the screen must not hide that it is there.
    public var images: [PackManifest.AssetEntry] {
        assets.values
            .filter(\.isImage)
            .sorted { lhs, rhs in
                let left = (lhs.credit?.title ?? "", lhs.credit?.author ?? "", lhs.sha256)
                let right = (rhs.credit?.title ?? "", rhs.credit?.author ?? "", rhs.sha256)
                let titles = left.0.localizedStandardCompare(right.0)
                if titles != .orderedSame { return titles == .orderedAscending }
                let authors = left.1.localizedStandardCompare(right.1)
                if authors != .orderedSame { return authors == .orderedAscending }
                return left.2 < right.2
            }
    }

    // MARK: Opening a topic

    private static func openTopic(
        _ entry: PackManifest.TopicEntry, from source: any PackSource, appVersion: String?,
        decoder: ContentDecoder, log: Logger
    ) async throws -> TopicContent? {
        if let needed = entry.minAppVersion, let appVersion,
           let need = AppVersion(needed), let app = AppVersion(appVersion), app < need {
            throw ContentPackError.appTooOld(path: entry.path, needs: needed, app: appVersion)
        }
        let data = try await source.data(at: entry.path)
        try verify(data, path: entry.path, size: entry.size, sha256: entry.sha256.lowercased())

        // Checked bytes: decode the header, then the topic and each lesson with the content decoder.
        let header: TopicPackHeader
        let root: [String: Any]
        do {
            header = try JSONDecoder().decode(TopicPackHeader.self, from: data)
            root = try JSONSerialization.jsonObject(with: data) as? [String: Any] ?? [:]
        } catch {
            throw ContentPackError.packUnreadable(path: entry.path, reason: ContentDecodingError.describe(error))
        }
        guard header.schemaVersion == PackManifest.supportedSchemaVersion else {
            throw ContentPackError.unsupportedSchema(path: entry.path, found: header.schemaVersion)
        }
        guard header.topicId == entry.id else {
            throw ContentPackError.wrongTopic(path: entry.path, expected: entry.id, found: header.topicId)
        }
        let topicData: Data
        do {
            topicData = try JSONSerialization.data(withJSONObject: root["topic"] ?? [String: Any]())
        } catch {
            throw ContentPackError.packUnreadable(path: entry.path, reason: "/topic: \(error.localizedDescription)")
        }
        let topic: Topic
        do {
            topic = try decoder.decodeTopic(from: topicData)
        } catch {
            throw ContentPackError.packUnreadable(path: entry.path, reason: "/topic\(error.path == "/" ? "" : error.path) \(error.message)")
        }
        guard topic.id == entry.id else {
            throw ContentPackError.wrongTopic(path: entry.path, expected: entry.id, found: topic.id)
        }
        if topic.archived || topic.sensitive {
            log.notice("pack topic \(entry.slug, privacy: .public) left out: \(topic.archived ? "archived" : "sensitive", privacy: .public)")
            return nil
        }

        var lessons: [Lesson] = []
        for (index, object) in (root["lessons"] as? [Any] ?? []).enumerated() {
            do {
                let lesson = try decoder.decodeLesson(from: JSONSerialization.data(withJSONObject: object))
                if lesson.topicId != topic.id {
                    log.notice("pack \(entry.path, privacy: .public) /lessons/\(index): topic_id of another topic, left out")
                } else if lesson.archived || lesson.sensitive {
                    log.notice("pack \(entry.path, privacy: .public) /lessons/\(index): \(lesson.archived ? "archived" : "sensitive", privacy: .public), left out")
                } else {
                    lessons.append(lesson)
                }
            } catch {
                // One lesson this app cannot read does not close the topic (SK-009: skip, log).
                log.error("pack \(entry.path, privacy: .public) /lessons/\(index) does not decode: \(String(describing: error), privacy: .public)")
            }
        }
        return TopicContent(topic: topic, lessons: lessons)
    }

    // MARK: Checks

    /// Size first (cheap), then sha256.
    static func verify(_ data: Data, path: String, size: Int, sha256 expected: String) throws(ContentPackError) {
        let actual = sha256Hex(data)
        guard data.count == size, actual == expected else {
            throw .mismatch(path: path, expectedSize: size, actualSize: data.count, expectedSHA256: expected, actualSHA256: actual)
        }
    }

    /// Lowercase hex of the sha256 of `data`, the way the manifest writes it.
    public static func sha256Hex(_ data: Data) -> String {
        SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined()
    }

    static func rulesData(of manifestData: Data) -> Data? {
        guard let root = try? JSONSerialization.jsonObject(with: manifestData) as? [String: Any],
              let rules = root["rules"] as? [String: Any]
        else { return nil }
        return try? JSONSerialization.data(withJSONObject: rules)
    }

    static func packError(_ error: any Error, path: String) -> ContentPackError {
        if let error = error as? ContentPackError { return error }
        return .unreadable(path: path, reason: String(describing: error))
    }
}

extension ContentDecodingError {
    /// A readable reason for any error of `JSONDecoder` / `JSONSerialization`.
    static func describe(_ error: any Error) -> String {
        if let error = error as? DecodingError { return ContentDecodingError(error).description }
        return error.localizedDescription
    }
}
