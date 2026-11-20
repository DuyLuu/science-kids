import CryptoKit
import Foundation
import os

/// SK-059: the voice of the app's own lines (the Chơi hint first), not of a lesson. `dev` builds
/// the clips with `content-cli` (same voices as the lessons: Kokoro EN, Kim Thanh VI) into
/// `content/.build/ui-voice/`, the "Embed content pack" build phase copies them into the bundle
/// as `ui-voice/` (`manifest.json` + `<key>.<lang>.m4a`). A line is found by its string-catalog
/// key; a clip is played like a lesson clip, by its sha256 (`UIVoiceClips`). No folder or no
/// clip for a line: the line is only printed.
public struct UIVoiceCatalog: Sendable, Equatable {
    public struct Clip: Sendable, Equatable {
        public let sha256: String
        public let url: URL
    }

    /// key → language (`en`, `vi`) → clip.
    public let clips: [String: [String: Clip]]

    public init(clips: [String: [String: Clip]]) {
        self.clips = clips
    }

    /// The catalog of the app bundle, read once; `nil` when the build has no `ui-voice/`.
    public static let main: UIVoiceCatalog? = UIVoiceCatalog(bundle: .main)

    private static let log = Logger(subsystem: "vn.sciencekids.app", category: "audio")

    /// Reads `ui-voice/manifest.json` of `bundle` (`science-kids/ui-voice@1`). Clips whose file
    /// is not in the bundle are left out.
    public init?(bundle: Bundle, folder: String = "ui-voice") {
        guard let manifestURL = bundle.url(forResource: "manifest", withExtension: "json", subdirectory: folder) else { return nil }
        self.init(manifestURL: manifestURL)
    }

    public init?(manifestURL: URL) {
        struct Manifest: Decodable {
            struct Entry: Decodable {
                let file: String
                let sha256: String
            }
            let clips: [String: [String: Entry]]
        }
        guard let data = try? Data(contentsOf: manifestURL),
              let manifest = try? JSONDecoder().decode(Manifest.self, from: data) else {
            Self.log.error("ui-voice manifest unreadable")
            return nil
        }
        let folder = manifestURL.deletingLastPathComponent()
        var clips: [String: [String: Clip]] = [:]
        for (key, languages) in manifest.clips {
            for (language, entry) in languages {
                let url = folder.appendingPathComponent(entry.file)
                guard FileManager.default.fileExists(atPath: url.path) else { continue }
                clips[key, default: [:]][language] = Clip(sha256: entry.sha256.lowercased(), url: url)
            }
        }
        self.clips = clips
    }

    /// sha256 of the clip of `key` in `language`, `nil` when there is none.
    public func hash(for key: String, language: String) -> String? {
        clips[key]?[language]?.sha256
    }

    func url(forHash hash: String) -> URL? {
        let hash = hash.lowercased()
        for languages in clips.values {
            for clip in languages.values where clip.sha256 == hash { return clip.url }
        }
        return nil
    }
}

/// The app-line clips first, then the lesson pack's (`next`). An app clip is checked against its
/// sha256 before it plays, like a pack clip.
public struct UIVoiceClips: ClipLoader {
    public enum Failure: Error { case checksum }

    let catalog: UIVoiceCatalog?
    let next: (any ClipLoader)?

    public init(catalog: UIVoiceCatalog?, next: (any ClipLoader)?) {
        self.catalog = catalog
        self.next = next
    }

    public func clipData(for hash: String) async throws -> Data {
        if let url = catalog?.url(forHash: hash) {
            let data = try Data(contentsOf: url)
            let digest = SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined()
            guard digest == hash.lowercased() else { throw Failure.checksum }
            return data
        }
        guard let next else { throw CocoaError(.fileNoSuchFile) }
        return try await next.clipData(for: hash)
    }
}
