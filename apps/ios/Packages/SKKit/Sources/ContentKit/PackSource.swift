import Foundation

/// Where the files of a content pack come from (B4.3: `catalog/v1/manifest.json`,
/// `topics/<topic_id>/<version>/pack.json`, `assets/<sha256>.<ext>`), by their path from the pack
/// root as the manifest writes it.
///
/// The trial build reads the pack embedded in the app (`DirectoryPackSource`). GĐ 1 adds a source
/// that downloads into a cache and hands back the cached file; `ContentPack` does not change, and
/// it checks `sha256` and `size` of what any source returns.
public protocol PackSource: Sendable {
    /// A local file holding the bytes of `path` (downloading it first, for a network source).
    func fileURL(for path: String) async throws -> URL
}

extension PackSource {
    /// The bytes of `path`.
    func data(at path: String) async throws -> Data {
        let url = try await fileURL(for: path)
        do {
            return try Data(contentsOf: url)
        } catch {
            throw ContentPackError.unreadable(path: path, reason: error.localizedDescription)
        }
    }
}

/// A pack laid out in a local folder: the folder the app bundle embeds (`pack/`, SK-016), or a
/// copy in a test's temporary directory.
public struct DirectoryPackSource: PackSource {
    public let root: URL

    public init(root: URL) {
        self.root = root
    }

    public func fileURL(for path: String) async throws -> URL {
        try Self.checked(path)
        let url = root.appendingPathComponent(path, isDirectory: false)
        guard FileManager.default.fileExists(atPath: url.path) else {
            throw ContentPackError.missingFile(path: path)
        }
        return url
    }

    /// Paths come from the manifest: relative, inside the pack, no `..`. A network source will
    /// read the same paths from a server, so the check lives here and not only in the CLI.
    static func checked(_ path: String) throws {
        let parts = path.split(separator: "/", omittingEmptySubsequences: false)
        guard !path.isEmpty, !path.hasPrefix("/"), !parts.contains(where: { $0.isEmpty || $0 == "." || $0 == ".." }) else {
            throw ContentPackError.badPath(path)
        }
    }
}
