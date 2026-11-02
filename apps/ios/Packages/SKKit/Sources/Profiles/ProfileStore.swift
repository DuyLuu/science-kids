import Foundation

/// Keeps the one child profile of the device in a JSON file (SK-011 decision 1: a file, not
/// GRDB, until the sync queue arrives). Default place: `Library/Application Support/child_profile.json`.
///
/// The file is written atomically, pretty-printed with sorted keys so a tester can read it
/// (`xcrun simctl get_app_container booted <bundle id> data`). Reading a file that does not
/// exist gives `nil`; a file that does not decode throws.
public struct ProfileStore: Sendable {
    public static let defaultFileName = "child_profile.json"

    public let fileURL: URL

    public init(directory: URL, fileName: String = ProfileStore.defaultFileName) {
        fileURL = directory.appendingPathComponent(fileName, isDirectory: false)
    }

    /// The store in the app's Application Support directory (created when missing).
    public static func applicationSupport() throws -> ProfileStore {
        let directory = try FileManager.default.url(
            for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true
        )
        return ProfileStore(directory: directory)
    }

    /// The saved profile, or `nil` when none was saved.
    public func load() throws -> ChildProfile? {
        guard FileManager.default.fileExists(atPath: fileURL.path) else { return nil }
        let data = try Data(contentsOf: fileURL)
        return try JSONDecoder().decode(ChildProfile.self, from: data)
    }

    /// Writes `profile`, replacing the previous one.
    public func save(_ profile: ChildProfile) throws {
        try FileManager.default.createDirectory(
            at: fileURL.deletingLastPathComponent(), withIntermediateDirectories: true
        )
        try Self.encode(profile).write(to: fileURL, options: [.atomic])
    }

    /// A profile file that does not decode is renamed `child_profile.json.corrupt-<time>` before
    /// anything new is written there (SK-022): nothing in it is lost by creating a new profile.
    /// Returns the kept copy, or `nil` when there is no file.
    @discardableResult
    public func quarantineCorruptFile(now: Date = Date()) throws -> URL? {
        guard FileManager.default.fileExists(atPath: fileURL.path) else { return nil }
        return try CorruptFile.quarantine(fileURL, now: now)
    }

    /// Removes the saved profile; nothing happens when there is none.
    public func delete() throws {
        guard FileManager.default.fileExists(atPath: fileURL.path) else { return }
        try FileManager.default.removeItem(at: fileURL)
    }

    /// The file's bytes for `profile`.
    public static func encode(_ profile: ChildProfile) throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]
        return try encoder.encode(profile)
    }
}
