import Foundation
import Observation
import os
import Profiles

/// An attempt the server stored, with the reward it settled (B7.7: the app updates its own copy
/// quietly; nothing that already played on screen is taken back).
public struct SettledAttempt: Hashable, Sendable {
    public let attemptId: UUID
    public let lessonId: UUID?
    /// Stars of the lesson after this attempt, on the server.
    public let stars: Int
    public let xp: Int?
}

/// Keeps the device and the server in step (SK-022, B7.7): the guest session, the child profile on
/// the server, the offline queue of finished attempts, the settled Home data.
///
/// - `sync(profile:history:)` at launch, when the app comes back to the foreground, when the
///   network comes back, after the profile is made: signs in (Keychain session or a new guest),
///   sends the profile once (`create_child_profile`), queues the finished attempts the server has
///   not confirmed, sends the queue (`submit_attempts`, at most 50 per call), reads `get_home`.
/// - `attemptFinished(_:)` right after a lesson ends: queue it, send it.
/// - Failures never block the app: a call that does not get through, or that the server answers
///   with `success: false`, keeps the whole batch queued with exponential backoff (`Backoff`) and
///   a log line. In a call that went through, `inserted` and `duplicate` leave the queue; so does
///   `rejected` (SK-021: sending it again would not pass), logged and kept in `SyncState.rejected`.
///   Sending again is safe: `submit_attempts` is idempotent on the attempt `id`.
@MainActor
@Observable
public final class SyncEngine {
    public enum Phase: Hashable, Sendable {
        /// No server in this build (`Config/Local.xcconfig` missing).
        case off
        case idle
        case syncing
        /// Everything sent; Home data fresh.
        case synced
        /// Something waits (offline, server error, profile not on the server); `reason` for logs.
        case waiting(String)
    }

    public private(set) var phase: Phase
    /// Attempts waiting for the server.
    public private(set) var queuedCount: Int
    /// Last `get_home` of the current child (cached across launches).
    public private(set) var home: HomeData?
    public private(set) var homeFetchedAt: Date?
    /// The current child's profile on the server.
    public private(set) var profileLink: ProfileLink?

    /// Called on the main actor with every attempt the server stored.
    @ObservationIgnored public var onSettled: (@MainActor ([SettledAttempt]) -> Void)?

    @ObservationIgnored private let transport: (any SyncTransport)?
    @ObservationIgnored private let store: SyncStore
    @ObservationIgnored private let backoff: Backoff
    @ObservationIgnored private let now: @Sendable () -> Date
    @ObservationIgnored private let schedulesRetries: Bool
    @ObservationIgnored private var state: SyncState
    @ObservationIgnored private var queue: AttemptQueue
    @ObservationIgnored private var child: ProfilePayload?
    @ObservationIgnored private var running = false
    @ObservationIgnored private var rerun = false
    @ObservationIgnored private var retryTask: Task<Void, Never>?
    @ObservationIgnored private let log = Logger(subsystem: Bundle.main.bundleIdentifier ?? "ScienceKids", category: "sync")

    /// The maximum `submit_attempts` takes per call (SK-021).
    public static let batchSize = 50

    public init(
        transport: (any SyncTransport)?,
        store: SyncStore,
        backoff: Backoff = .standard,
        schedulesRetries: Bool = true,
        now: @escaping @Sendable () -> Date = { Date() }
    ) {
        self.transport = transport
        self.store = store
        self.backoff = backoff
        self.schedulesRetries = schedulesRetries
        self.now = now
        let date = now()
        state = store.loadState(now: date)
        queue = store.loadQueue(now: date)
        queuedCount = queue.items.count
        phase = transport == nil ? .off : .idle
        store.save(state) // keeps the install id from the first launch on
    }

    /// `lesson_attempts.install_id` of this install.
    public var installId: UUID { state.installId }
    /// The guest user's id, once signed in.
    public var userId: String? { state.userId }
    /// Attempts the server has stored.
    public func isAcknowledged(_ attemptId: UUID) -> Bool {
        state.acknowledged[attemptId.uuidString.lowercased()] != nil
    }
    /// Attempts the server has stored, as far as this install knows.
    public var acknowledgedCount: Int { state.acknowledged.count }
    /// Attempts the server refused for good, with the error code.
    public var rejected: [String: String] { state.rejected }
    public var queuedIds: Set<UUID> { queue.ids }

    // MARK: Sync

    /// Signs in, puts the profile on the server, queues `history` (finished attempts of the child;
    /// those already stored or queued are skipped), sends the queue, reads Home.
    /// `force` sends even attempts still in their backoff (launch, network back).
    public func sync(profile: ProfilePayload?, history: [AttemptPayload] = [], force: Bool = true) async {
        if let profile { setChild(profile) }
        enqueue(history)
        guard let transport else { return }
        if running {
            rerun = true
            return
        }
        running = true
        defer { running = false }
        var forced = force
        repeat {
            rerun = false
            await runOnce(transport, force: forced)
            forced = true
        } while rerun
        scheduleRetry()
    }

    /// A lesson just ended: queue its attempt and send it now.
    public func attemptFinished(_ attempt: AttemptPayload) async {
        await sync(profile: nil, history: [attempt], force: true)
    }

    /// Debug and tests: send an attempt again even if the server already has it (it must stay
    /// one row on the server: `submit_attempts` is idempotent).
    public func resend(_ attempt: AttemptPayload) async {
        // One real send per call: wait for a sync under way to end first.
        while running { try? await Task.sleep(for: .milliseconds(100)) }
        var payload = attempt
        payload.installId = payload.installId ?? state.installId
        queue.enqueue(payload, now: now())
        store.save(queue)
        queuedCount = queue.items.count
        await sync(profile: nil, history: [], force: true)
    }

    private func setChild(_ profile: ProfilePayload) {
        child = profile
        let key = profile.id.uuidString.lowercased()
        profileLink = state.profiles[key]
        if let cached = state.homes[key] {
            home = cached.data
            homeFetchedAt = cached.fetchedAt
        } else {
            home = nil
            homeFetchedAt = nil
        }
    }

    private func enqueue(_ attempts: [AttemptPayload]) {
        let date = now()
        var added = 0
        for attempt in attempts where !isAcknowledged(attempt.id) && state.rejected[attempt.id.uuidString.lowercased()] == nil {
            var payload = attempt
            payload.installId = payload.installId ?? state.installId
            if queue.enqueue(payload, now: date) { added += 1 }
        }
        if added > 0 {
            store.save(queue)
            log.notice("queued \(added) attempt(s), \(self.queue.items.count) waiting")
        }
        queuedCount = queue.items.count
    }

    private func runOnce(_ transport: any SyncTransport, force: Bool) async {
        phase = .syncing
        // 1. Session.
        do {
            let user = try await transport.signIn()
            if let previous = state.userId, previous != user {
                // Another guest than the one the profile and attempts were sent as: link again.
                log.error("signed-in user changed; the profile is sent again")
                state.profiles = [:]
                state.acknowledged = [:]
                state.rejected = [:]
                profileLink = nil
            }
            state.userId = user
            store.save(state)
        } catch {
            fail("sign in: \(error)")
            queue.failed(Set(queue.due(now: now(), force: force).map(\.payload.id)), error: "\(error)", now: now(), backoff: backoff)
            store.save(queue)
            return
        }

        // 2. Profile.
        if let child { await ensureProfile(child, transport) }

        // 3. Queue.
        let sent = await flush(transport, force: force)

        // 4. Home.
        if sent, let child, let serverId = state.profiles[child.id.uuidString.lowercased()]?.serverId {
            await refreshHome(child, serverId: serverId, transport)
        }
        if case .syncing = phase {
            phase = queue.items.isEmpty ? .synced : .waiting("\(queue.items.count) attempt(s) waiting")
        }
    }

    private func ensureProfile(_ profile: ProfilePayload, _ transport: any SyncTransport) async {
        let key = profile.id.uuidString.lowercased()
        if let link = state.profiles[key], link.status != .refused { return }
        do {
            let response = try await transport.createChildProfile(profile)
            let link: ProfileLink
            if response.success, let server = response.data {
                link = ProfileLink(status: .linked, serverId: server.id, error: nil, updatedAt: now())
                log.notice("profile on the server (\(server.created == false ? "already there" : "created", privacy: .public))")
            } else if response.errorCode == "profile_limit" {
                // The guest already has its profile (app installed again, Keychain kept the guest):
                // use that one rather than make a second (SK-021 note for SK-022).
                let existing = try await transport.activeProfiles()
                if existing.count == 1, let server = existing.first {
                    link = ProfileLink(status: .adopted, serverId: server.id, error: response.errorCode, updatedAt: now())
                    log.notice("profile_limit: using the guest's existing server profile for this device profile")
                } else {
                    link = ProfileLink(status: .limit, serverId: nil, error: response.errorCode, updatedAt: now())
                    log.error("profile_limit and \(existing.count) active server profile(s): playing on the device profile, its attempts wait")
                }
            } else {
                link = ProfileLink(status: .refused, serverId: nil, error: response.errorCode ?? "failed", updatedAt: now())
                log.error("create_child_profile refused: \(response.errorCode ?? "-", privacy: .public) \(response.error ?? "", privacy: .public)")
            }
            state.profiles[key] = link
            profileLink = link
            store.save(state)
        } catch {
            fail("create_child_profile: \(error)")
        }
    }

    /// Sends what is due, 50 per call. Returns false when a call did not get through.
    private func flush(_ transport: any SyncTransport, force: Bool) async -> Bool {
        let due = queue.due(now: now(), force: force)
        var sendable: [AttemptPayload] = []
        for item in due {
            guard let serverId = state.profiles[item.payload.childId.uuidString.lowercased()]?.serverId else { continue }
            var payload = item.payload
            payload.childId = serverId
            sendable.append(payload)
        }
        if sendable.count < due.count {
            // Not sendable before the profile is on the server: wait with the same backoff, so a
            // device offline at its first launch does not try again every second.
            let waiting = Set(due.map(\.payload.id)).subtracting(sendable.map(\.id))
            queue.failed(waiting, error: "profile not on the server", now: now(), backoff: backoff)
            store.save(queue)
            log.notice("\(waiting.count) attempt(s) wait for their profile on the server")
        }
        var start = 0
        while start < sendable.count {
            let batch = Array(sendable[start..<min(start + Self.batchSize, sendable.count)])
            start += Self.batchSize
            let ids = Set(batch.map(\.id))
            let response: RPCResponse<SubmitResult>
            do {
                response = try await transport.submitAttempts(batch)
            } catch {
                queue.failed(ids, error: "\(error)", now: now(), backoff: backoff)
                store.save(queue)
                queuedCount = queue.items.count
                fail("submit_attempts: \(error)")
                return false
            }
            guard response.success, let result = response.data else {
                queue.failed(ids, error: response.errorCode ?? "failed", now: now(), backoff: backoff)
                store.save(queue)
                log.error("submit_attempts success=false: \(response.errorCode ?? "-", privacy: .public) \(response.error ?? "", privacy: .public); \(batch.count) attempt(s) stay queued")
                phase = .waiting("submit_attempts: \(response.errorCode ?? "failed")")
                continue
            }
            var settled: [SettledAttempt] = []
            var answered: Set<UUID> = []
            var counts = (inserted: 0, duplicate: 0, rejected: 0)
            for item in result.results {
                guard let id = item.id.flatMap(UUID.init(uuidString:)) ?? (batch.indices.contains(item.index) ? batch[item.index].id : nil) else { continue }
                answered.insert(id)
                switch item.status {
                case .inserted, .duplicate:
                    if item.status == .inserted { counts.inserted += 1 } else { counts.duplicate += 1 }
                    queue.remove([id])
                    let stars = item.stars ?? 0
                    state.acknowledged[id.uuidString.lowercased()] = stars
                    settled.append(SettledAttempt(attemptId: id, lessonId: item.lessonId, stars: stars, xp: item.xp))
                case .rejected:
                    // For good: the same attempt would be rejected again (SK-021).
                    counts.rejected += 1
                    queue.remove([id])
                    state.rejected[id.uuidString.lowercased()] = item.errorCode ?? "rejected"
                    log.error("attempt \(id.uuidString.lowercased(), privacy: .public) rejected: \(item.errorCode ?? "-", privacy: .public) \(item.error ?? "", privacy: .public)")
                }
            }
            let missing = ids.subtracting(answered)
            if !missing.isEmpty {
                queue.failed(missing, error: "no result", now: now(), backoff: backoff)
            }
            store.save(queue)
            store.save(state)
            queuedCount = queue.items.count
            log.notice("submit_attempts: \(counts.inserted) new, \(counts.duplicate) already stored, \(counts.rejected) rejected, \(self.queue.items.count) still queued")
            if !settled.isEmpty { onSettled?(settled) }
        }
        return true
    }

    private func refreshHome(_ profile: ProfilePayload, serverId: UUID, _ transport: any SyncTransport) async {
        do {
            let response = try await transport.getHome(childId: serverId)
            guard response.success, let data = response.data else {
                log.error("get_home success=false: \(response.errorCode ?? "-", privacy: .public)")
                return
            }
            let fetched = now()
            state.homes[profile.id.uuidString.lowercased()] = .init(data: data, fetchedAt: fetched)
            store.save(state)
            if child?.id == profile.id {
                home = data
                homeFetchedAt = fetched
            }
        } catch {
            fail("get_home: \(error)")
        }
    }

    private func fail(_ reason: String) {
        phase = .waiting(reason)
        log.error("sync waits: \(reason, privacy: .public)")
    }

    /// While the app runs, try again when the next backoff ends.
    private func scheduleRetry() {
        retryTask?.cancel()
        guard schedulesRetries, transport != nil, let next = queue.nextTryAt else { return }
        let wait = max(1, next.timeIntervalSince(now()))
        retryTask = Task { [weak self] in
            try? await Task.sleep(for: .seconds(wait))
            guard !Task.isCancelled, let self else { return }
            await self.sync(profile: nil, history: [], force: false)
        }
    }
}

extension ProfilePayload {
    /// The device profile as `create_child_profile` takes it (SK-011 fields).
    public init(_ profile: ChildProfile) {
        self.init(
            id: profile.id, displayName: profile.displayName, avatar: profile.avatar, grade: profile.grade,
            languageMode: profile.languageMode.rawValue, voiceMode: profile.voiceMode.rawValue, timezone: profile.timezone
        )
    }
}
