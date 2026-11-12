import Foundation
import os

/// Words a child said "Đã nhớ" to on the Từ vựng tab (SK-035), on this device only: one file per
/// child profile, `Application Support/words/<child id>.json`, the ids of the `VocabTerm`s known.
/// Not sent to the server (SK-035 out of scope: a table comes with its own ticket). JSON written
/// atomically, like the lesson attempts (`AttemptStore`).
struct WordMemoryStore: Sendable {
    let directory: URL

    /// The file's shape. `child_id` repeats the file name, so a file copied to the wrong name is
    /// not read as another child's.
    private struct File: Codable {
        var childId: UUID
        var known: [UUID]

        enum CodingKeys: String, CodingKey {
            case childId = "child_id"
            case known
        }
    }

    /// The store in the app's Application Support directory.
    static func applicationSupport() throws -> WordMemoryStore {
        let base = try FileManager.default.url(
            for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true
        )
        return WordMemoryStore(directory: base.appendingPathComponent("words", isDirectory: true))
    }

    func url(childId: UUID) -> URL {
        directory.appendingPathComponent(childId.uuidString.lowercased() + ".json")
    }

    /// The child's known words; empty when none is saved, or when the file does not read (logged;
    /// the child starts the decks again, nothing else depends on it).
    func known(childId: UUID) -> Set<UUID> {
        guard let data = try? Data(contentsOf: url(childId: childId)) else { return [] }
        do {
            let file = try JSONDecoder().decode(File.self, from: data)
            return file.childId == childId ? Set(file.known) : []
        } catch {
            Logger(subsystem: Bundle.main.bundleIdentifier ?? "ScienceKids", category: "words")
                .error("known words unreadable, starting empty: \(String(describing: error), privacy: .public)")
            return []
        }
    }

    func save(_ known: Set<UUID>, childId: UUID) throws {
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        let file = File(childId: childId, known: known.sorted { $0.uuidString < $1.uuidString })
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        try encoder.encode(file).write(to: url(childId: childId), options: [.atomic])
    }
}
