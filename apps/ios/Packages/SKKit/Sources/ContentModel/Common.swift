import Foundation

// Shared types of content schema v1 (`packages/content-schema/schema/common.schema.json`).
//
// Naming: the schema's `Text` and `Image` are `BilingualText` and `ContentImage` here, so that
// LessonPlayer can import SwiftUI and ContentModel together without `Text` / `Image` clashing
// (SK-009, decision recorded in the ticket).

/// `Key` of the schema (`^[a-z][a-z0-9_]{0,39}$`): references inside one file (`q5_egg`, `tray_carb`).
/// The app does not check the pattern; `content-cli validate` does.
public typealias Key = String

/// `AssetHash` of the schema: sha256 hex of an asset in the pack (`assets/<sha256>.<ext>`).
public typealias AssetHash = String

/// `Text` of the schema: `{ en, vi }`, no audio. Internal or parent-facing text.
public struct BilingualText: Codable, Hashable, Sendable {
    public let en: String
    public let vi: String

    public init(en: String, vi: String) {
        self.en = en
        self.vi = vi
    }
}

/// `SpokenAudio` of the schema: one clip per language, both optional while authoring.
public struct SpokenAudio: Codable, Hashable, Sendable {
    public let en: AssetHash?
    public let vi: AssetHash?

    public init(en: AssetHash? = nil, vi: AssetHash? = nil) {
        self.en = en
        self.vi = vi
    }
}

/// `Spoken` of the schema: every string a child sees or hears, `{ en, vi, audio? }`.
public struct Spoken: Codable, Hashable, Sendable {
    public let en: String
    public let vi: String
    public let audio: SpokenAudio?

    public init(en: String, vi: String, audio: SpokenAudio? = nil) {
        self.en = en
        self.vi = vi
        self.audio = audio
    }
}

/// `Image` of the schema: `{ alt, brief?, asset? }`. `alt` feeds VoiceOver; `brief` is for the illustrator.
public struct ContentImage: Codable, Hashable, Sendable {
    public let alt: BilingualText
    public let brief: String?
    public let asset: AssetHash?

    public init(alt: BilingualText, brief: String? = nil, asset: AssetHash? = nil) {
        self.alt = alt
        self.brief = brief
        self.asset = asset
    }
}

/// A string enum of the schema that may grow in a later pack (new colour, new strand…).
///
/// The app decodes any string so that a newer pack still opens on an older app (SK-009
/// decision 2: the app reads more loosely than the CLI). Known values are static constants;
/// `isKnown` tells the UI when to fall back.
public protocol OpenStringEnum: RawRepresentable, Codable, Hashable, Sendable where RawValue == String {
    init(rawValue: String)
    static var known: [Self] { get }
}

// Codable comes from the standard library's `RawRepresentable` defaults (a single string);
// `init(rawValue:)` never fails, so any string decodes.
extension OpenStringEnum {
    public var isKnown: Bool { Self.known.contains(self) }
}

/// `ColorToken` of the schema: style E colour names (temporary names, synced with design tokens later).
public struct ColorToken: OpenStringEnum {
    public let rawValue: String
    public init(rawValue: String) { self.rawValue = rawValue }

    public static let doSon = ColorToken(rawValue: "do_son")
    public static let vangHoe = ColorToken(rawValue: "vang_hoe")
    public static let giDong = ColorToken(rawValue: "gi_dong")
    public static let cham = ColorToken(rawValue: "cham")
    public static let nauDat = ColorToken(rawValue: "nau_dat")

    public static let known: [ColorToken] = [.doSon, .vangHoe, .giDong, .cham, .nauDat]
}

/// Common fields of every block (`BlockBase` in block.schema.json).
public protocol ContentBlock: Sendable {
    var id: UUID { get }
    var key: Key { get }
    var version: Int { get }
    /// Lowest app version that renders this block (`MAJOR.MINOR.PATCH`). The publish step uses it.
    var minAppVersion: String? { get }
}

/// Checks the root `kind` of a content file.
enum FileKind {
    static func expect<K: CodingKey>(
        _ expected: String,
        in container: KeyedDecodingContainer<K>,
        forKey key: K
    ) throws {
        let kind = try container.decode(String.self, forKey: key)
        guard kind == expected else {
            throw DecodingError.dataCorruptedError(
                forKey: key, in: container,
                debugDescription: "expected kind \"\(expected)\", found \"\(kind)\""
            )
        }
    }
}
