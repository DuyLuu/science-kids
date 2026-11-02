import Foundation
import os
import Profiles

/// Exponential backoff of the queue (B7.7): `base`, `2 × base`, `4 × base`… up to `cap`.
public struct Backoff: Hashable, Sendable {
    public var base: TimeInterval
    public var cap: TimeInterval

    public init(base: TimeInterval, cap: TimeInterval) {
        self.base = base
        self.cap = cap
    }

    /// 15 s, 30 s, 1 min, 2 min… at most 15 min between two tries of an attempt.
    public static let standard = Backoff(base: 15, cap: 15 * 60)

    /// Wait before the next try after `failures` failed tries in a row (1 → `base`).
    public func delay(afterFailures failures: Int) -> TimeInterval {
        guard failures > 0 else { return 0 }
        let exponent = Double(min(failures - 1, 30))
        return min(base * pow(2, exponent), cap)
    }
}

/// One attempt waiting for the server.
public struct QueuedAttempt: Codable, Hashable, Sendable {
    public var payload: AttemptPayload
    public var enqueuedAt: Date
    /// Failed sends in a row (network, server, or the attempt rejected).
    public var failures: Int
    /// Not sent before this time unless forced (app opened, network back).
    public var nextTryAt: Date
    public var lastError: String?

    enum CodingKeys: String, CodingKey {
        case payload, failures
        case enqueuedAt = "enqueued_at"
        case nextTryAt = "next_try_at"
        case lastError = "last_error"
    }
}

/// The offline queue of finished attempts (`sync/queue.json`), oldest first. Pure value: the
/// engine loads it, changes it, saves it.
public struct AttemptQueue: Codable, Hashable, Sendable {
    public private(set) var items: [QueuedAttempt] = []

    public init(items: [QueuedAttempt] = []) {
        self.items = items
    }

    public var ids: Set<UUID> { Set(items.map(\.payload.id)) }

    /// Adds an attempt not already queued; returns whether it was added.
    @discardableResult
    public mutating func enqueue(_ payload: AttemptPayload, now: Date) -> Bool {
        guard !ids.contains(payload.id) else { return false }
        items.append(QueuedAttempt(payload: payload, enqueuedAt: now, failures: 0, nextTryAt: now, lastError: nil))
        return true
    }

    /// Attempts to send now: those whose backoff is over, or all of them when `force`.
    public func due(now: Date, force: Bool) -> [QueuedAttempt] {
        items.filter { force || $0.nextTryAt <= now }
    }

    public mutating func remove(_ ids: Set<UUID>) {
        items.removeAll { ids.contains($0.payload.id) }
    }

    /// The send failed for `ids`: one more failure each, next try after the backoff.
    public mutating func failed(_ ids: Set<UUID>, error: String, now: Date, backoff: Backoff) {
        for index in items.indices where ids.contains(items[index].payload.id) {
            items[index].failures += 1
            items[index].lastError = error
            items[index].nextTryAt = now.addingTimeInterval(backoff.delay(afterFailures: items[index].failures))
        }
    }

    /// The earliest time an attempt may be tried again.
    public var nextTryAt: Date? { items.map(\.nextTryAt).min() }
}

/// The device's profile on the server.
public struct ProfileLink: Codable, Hashable, Sendable {
    public enum Status: String, Codable, Hashable, Sendable {
        /// On the server (`serverId`), same id as on the device.
        case linked
        /// The account already had its one profile (`profile_limit`, e.g. the app was deleted and
        /// installed again, the Keychain kept the guest): the device profile uses that server
        /// profile (`serverId`), no second one is made. Name and avatar stay as on the server.
        case adopted
        /// `profile_limit` and no active profile found to use: the app plays on the device
        /// profile; its attempts wait.
        case limit
        /// The server refused it for another reason (`error`).
        case refused
    }

    public var status: Status
    public var serverId: UUID?
    public var error: String?
    public var updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case status, error
        case serverId = "server_id"
        case updatedAt = "updated_at"
    }
}

/// What the device knows about the server (`sync/state.json`).
public struct SyncState: Codable, Hashable, Sendable {
    /// One per install (Application Support goes away with the app): `lesson_attempts.install_id`.
    public var installId: UUID
    /// The guest user the attempts belong to; a different one after sign-in resets the links.
    public var userId: String?
    /// Device child id (lower case) → its profile on the server.
    public var profiles: [String: ProfileLink]
    /// Attempts the server stored (`inserted` or `duplicate`) → stars of the lesson it settled.
    public var acknowledged: [String: Int]
    /// Attempts the server refused for good (`rejected` + `error_code`): out of the queue, kept
    /// here for the record (sending again would not pass).
    public var rejected: [String: String] = [:]
    /// Last `get_home` per device child id, for Home when offline.
    public var homes: [String: CachedHome]

    public struct CachedHome: Codable, Hashable, Sendable {
        public var data: HomeData
        public var fetchedAt: Date

        enum CodingKeys: String, CodingKey {
            case data
            case fetchedAt = "fetched_at"
        }
    }

    public init(installId: UUID = UUID()) {
        self.installId = installId
        profiles = [:]
        acknowledged = [:]
        homes = [:]
    }

    enum CodingKeys: String, CodingKey {
        case profiles, acknowledged, rejected, homes
        case installId = "install_id"
        case userId = "user_id"
    }

    public init(from decoder: any Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        installId = try c.decode(UUID.self, forKey: .installId)
        userId = try c.decodeIfPresent(String.self, forKey: .userId)
        profiles = try c.decodeIfPresent([String: ProfileLink].self, forKey: .profiles) ?? [:]
        acknowledged = try c.decodeIfPresent([String: Int].self, forKey: .acknowledged) ?? [:]
        rejected = try c.decodeIfPresent([String: String].self, forKey: .rejected) ?? [:]
        homes = try c.decodeIfPresent([String: CachedHome].self, forKey: .homes) ?? [:]
    }
}

/// `sync/state.json` and `sync/queue.json` in Application Support. A file that does not decode is
/// kept as `<name>.corrupt-<time>` (log line) and the store starts empty; the attempts are still in
/// the lesson history, so the next launch queues them again.
public struct SyncStore: Sendable {
    public let directory: URL
    private let log = Logger(subsystem: Bundle.main.bundleIdentifier ?? "ScienceKids", category: "sync")

    public init(directory: URL) {
        self.directory = directory
    }

    public static func applicationSupport() throws -> SyncStore {
        let base = try FileManager.default.url(
            for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true
        )
        return SyncStore(directory: base.appendingPathComponent("sync", isDirectory: true))
    }

    var stateURL: URL { directory.appendingPathComponent("state.json") }
    var queueURL: URL { directory.appendingPathComponent("queue.json") }

    public func loadState(now: Date = Date()) -> SyncState {
        load(SyncState.self, from: stateURL, now: now) ?? SyncState()
    }

    public func loadQueue(now: Date = Date()) -> AttemptQueue {
        load(AttemptQueue.self, from: queueURL, now: now) ?? AttemptQueue()
    }

    public func save(_ state: SyncState) {
        write(state, to: stateURL)
    }

    public func save(_ queue: AttemptQueue) {
        write(queue, to: queueURL)
    }

    private func load<T: Decodable>(_ type: T.Type, from url: URL, now: Date) -> T? {
        guard FileManager.default.fileExists(atPath: url.path) else { return nil }
        do {
            return try Self.decoder.decode(type, from: Data(contentsOf: url))
        } catch {
            let kept = try? CorruptFile.quarantine(url, now: now)
            log.error("\(url.lastPathComponent, privacy: .public) unreadable, kept as \(kept?.lastPathComponent ?? "-", privacy: .public), starting empty: \(String(describing: error), privacy: .public)")
            return nil
        }
    }

    private func write(_ value: some Encodable, to url: URL) {
        do {
            try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
            try Self.encoder.encode(value).write(to: url, options: [.atomic])
        } catch {
            log.error("\(url.lastPathComponent, privacy: .public) not written: \(String(describing: error), privacy: .public)")
        }
    }

    static var encoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]
        encoder.dateEncodingStrategy = .iso8601
        return encoder
    }

    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}
