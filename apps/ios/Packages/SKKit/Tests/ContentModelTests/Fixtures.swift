import Foundation

/// Reads `packages/content-schema/fixtures/` straight from the repo (no copy in apps/ios).
/// SwiftPM cannot declare resources outside the package, so the path comes from `#filePath`:
/// walk up until `packages/content-schema/fixtures` shows up.
enum Fixtures {
    static let root: URL = {
        var dir = URL(fileURLWithPath: #filePath).deletingLastPathComponent()
        while dir.path != "/" {
            let candidate = dir.appendingPathComponent("packages/content-schema/fixtures")
            if FileManager.default.fileExists(atPath: candidate.appendingPathComponent("valid").path) {
                return candidate
            }
            dir.deleteLastPathComponent()
        }
        fatalError("packages/content-schema/fixtures not found above \(#filePath)")
    }()

    static let valid = root.appendingPathComponent("valid")
    static let invalid = root.appendingPathComponent("invalid")

    static let lessonURL = valid.appendingPathComponent("discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json")
    static let topicURL = valid.appendingPathComponent("discoverer/an-uong-lanh-manh/topic.json")

    /// Every `*.json` under `dir`, recursively, sorted by path.
    static func jsonFiles(in dir: URL) -> [URL] {
        let enumerator = FileManager.default.enumerator(at: dir, includingPropertiesForKeys: nil)
        var files: [URL] = []
        while let url = enumerator?.nextObject() as? URL {
            if url.pathExtension == "json" { files.append(url) }
        }
        return files.sorted { $0.path < $1.path }
    }

    /// Path relative to the fixtures root, for messages.
    static func relative(_ url: URL) -> String {
        String(url.path.dropFirst(root.path.count + 1))
    }

    /// Root `kind` of a content file.
    static func kind(of data: Data) throws -> String? {
        let object = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        return object?["kind"] as? String
    }

    static func lessonData() throws -> Data { try Data(contentsOf: lessonURL) }
    static func topicData() throws -> Data { try Data(contentsOf: topicURL) }

    /// The lesson fixture as a mutable JSON object, to edit in memory.
    static func lessonObject() throws -> [String: Any] {
        try JSONSerialization.jsonObject(with: lessonData()) as! [String: Any]
    }

    static func data(_ object: [String: Any]) throws -> Data {
        try JSONSerialization.data(withJSONObject: object)
    }
}
