import Foundation
import Profiles
import Testing
@testable import Sync

@Test func moduleIsLinked() {
    #expect(SyncModule.name == "Sync")
}

// MARK: - Fakes

/// A clock the tests move by hand.
final class TestClock: @unchecked Sendable {
    private let lock = NSLock()
    private var current: Date
    init(_ start: Date) { current = start }
    var now: Date { lock.withLock { current } }
    func advance(_ seconds: TimeInterval) { lock.withLock { current = current.addingTimeInterval(seconds) } }
}

/// The server as the tests want it: stores attempts once by id (idempotent like `submit_attempts`),
/// can be offline, answer `success: false`, reject some attempts, or refuse the profile.
actor FakeServer: SyncTransport {
    enum Mode: Sendable {
        case online
        case offline
        case successFalse(String)
    }

    var mode: Mode = .online
    var profileError: String?
    /// What `SELECT child_profiles` returns (the guest's profiles made before, e.g. on a previous install).
    var existing: [ServerProfile] = []
    var rejected: Set<UUID> = []
    var user = "user-1"
    private(set) var rows: [UUID: AttemptPayload] = [:]
    private(set) var profiles: [UUID: ProfilePayload] = [:]
    private(set) var submitCalls: [[UUID]] = []
    private(set) var profileCalls = 0
    private(set) var homeCalls = 0

    func set(_ mode: Mode) { self.mode = mode }
    func setProfileError(_ code: String?) { profileError = code }
    func setExisting(_ profiles: [ServerProfile]) { existing = profiles }

    func activeProfiles() async throws -> [ServerProfile] {
        if case .offline = mode { throw SyncError.offline("test") }
        return existing
    }
    func reject(_ ids: Set<UUID>) { rejected = ids }
    func setUser(_ user: String) { self.user = user }

    func signIn() async throws -> String {
        if case .offline = mode { throw SyncError.offline("test") }
        return user
    }

    func createChildProfile(_ profile: ProfilePayload) async throws -> RPCResponse<ServerProfile> {
        if case .offline = mode { throw SyncError.offline("test") }
        profileCalls += 1
        if let profileError { return .failure(profileError) }
        let created = profiles[profile.id] == nil
        profiles[profile.id] = profile
        return RPCResponse(success: true, data: ServerProfile(id: profile.id, voiceMode: profile.voiceMode, timezone: profile.timezone, created: created))
    }

    func submitAttempts(_ attempts: [AttemptPayload]) async throws -> RPCResponse<SubmitResult> {
        switch mode {
        case .offline: throw SyncError.offline("test")
        case .successFalse(let code): return .failure(code, "test")
        case .online: break
        }
        submitCalls.append(attempts.map(\.id))
        var results: [SubmitResult.Item] = []
        for (index, attempt) in attempts.enumerated() {
            if rejected.contains(attempt.id) {
                results.append(.init(index: index, id: attempt.id.uuidString.lowercased(), status: .rejected, errorCode: "invalid_attempt"))
                continue
            }
            let duplicate = rows[attempt.id] != nil
            if !duplicate { rows[attempt.id] = attempt }
            results.append(.init(
                index: index, id: attempt.id.uuidString.lowercased(), status: duplicate ? .duplicate : .inserted,
                lessonId: attempt.lessonId, score: attempt.score, maxScore: attempt.maxScore, xp: attempt.xp,
                stars: attempt.score >= 5 ? 2 : 1
            ))
        }
        return RPCResponse(success: true, data: SubmitResult(results: results))
    }

    func getHome(childId: UUID) async throws -> RPCResponse<HomeData> {
        if case .offline = mode { throw SyncError.offline("test") }
        homeCalls += 1
        return RPCResponse(success: true, data: HomeData(
            today: "2026-11-02", lessons: [], totalStars: rows.isEmpty ? 0 : 2, totalXP: rows.values.map(\.xp).reduce(0, +),
            lastLessonId: rows.values.first?.lessonId,
            streak: .init(studiedDays: rows.isEmpty ? 0 : 1, chainStart: rows.isEmpty ? nil : "2026-11-02", restDays: [], studiedToday: !rows.isEmpty),
            minutesToday: 0
        ))
    }
}

// MARK: - Engine

@MainActor
@Suite struct SyncEngineTests {
    nonisolated static let child = ProfilePayload(
        id: UUID(), displayName: "Minh", avatar: "ech", grade: 3, languageMode: "bilingual", voiceMode: "en", timezone: "Asia/Ho_Chi_Minh"
    )
    nonisolated static let start = Date(timeIntervalSince1970: 1_793_584_800) // 2026-11-02 02:00 UTC

    static func attempt(child: UUID = child.id, score: Int = 6) -> AttemptPayload {
        AttemptPayload(
            id: UUID(), childId: child, lessonId: UUID(uuidString: "4b11eb40-9a47-4e5e-b4b5-bea60264ded3")!, contentVersion: "15880ff9df19",
            startedAt: "2026-11-02T01:50:00Z", completedAt: "2026-11-02T02:00:00Z", durationS: 600, score: score, maxScore: 6, xp: 90,
            clientCreatedAt: "2026-11-02T02:00:00Z",
            answers: [.init(itemId: UUID().uuidString.lowercased(), slot: 1, correct: true, points: 1, answer: .array([.object(["selected": .string("q1_orange")])]), hintUsed: false, tries: 1)]
        )
    }

    struct Harness {
        let server = FakeServer()
        let clock = TestClock(SyncEngineTests.start)
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent("SyncTests-\(UUID().uuidString)")

        @MainActor func engine() -> SyncEngine {
            let clock = clock
            return SyncEngine(
                transport: server, store: SyncStore(directory: directory), backoff: Backoff(base: 15, cap: 120),
                schedulesRetries: false, now: { clock.now }
            )
        }

        func cleanUp() { try? FileManager.default.removeItem(at: directory) }
    }

    /// Ticket: success → the attempt leaves the queue; the settled stars come back; the profile is
    /// sent once; Home is read.
    @Test func successEmptiesTheQueue() async {
        let h = Harness()
        defer { h.cleanUp() }
        let engine = h.engine()
        var settled: [SettledAttempt] = []
        engine.onSettled = { settled += $0 }
        let attempt = Self.attempt()
        await engine.sync(profile: Self.child, history: [attempt])
        #expect(engine.queuedCount == 0)
        #expect(engine.isAcknowledged(attempt.id))
        #expect(settled.map(\.attemptId) == [attempt.id])
        #expect(settled.first?.stars == 2)
        #expect(engine.phase == .synced)
        #expect(engine.profileLink?.status == .linked)
        #expect(engine.home?.streak?.studiedDays == 1)
        #expect(await h.server.rows.count == 1)
        #expect(await h.server.rows[attempt.id]?.installId == engine.installId, "install_id filled")
        #expect(await h.server.profileCalls == 1)

        // Launch again: the profile is not sent again, a stored attempt is not queued again.
        await engine.sync(profile: Self.child, history: [attempt])
        #expect(await h.server.profileCalls == 1)
        #expect(await h.server.submitCalls.count == 1)
    }

    /// Ticket: network error → stays queued, tried again after an exponential backoff.
    @Test func networkErrorRetriesWithBackoff() async {
        let h = Harness()
        defer { h.cleanUp() }
        let engine = h.engine()
        await engine.sync(profile: Self.child, history: [])           // profile linked while online
        await h.server.set(.offline)
        let attempt = Self.attempt()
        await engine.attemptFinished(attempt)
        #expect(engine.queuedCount == 1)
        guard case .waiting = engine.phase else { Issue.record("phase \(engine.phase)"); return }
        let store = SyncStore(directory: h.directory)
        #expect(store.loadQueue().items.first?.failures == 1)
        #expect(store.loadQueue().items.first?.nextTryAt == Self.start.addingTimeInterval(15))

        await h.server.set(.online)
        h.clock.advance(10)
        await engine.sync(profile: nil, force: false)                  // backoff not over: not sent
        #expect(await h.server.submitCalls.isEmpty)
        #expect(engine.queuedCount == 1)

        await h.server.set(.offline)
        h.clock.advance(6)                                              // t = 16 s: due, still offline
        await engine.sync(profile: nil, force: false)
        #expect(store.loadQueue().items.first?.failures == 2)
        #expect(store.loadQueue().items.first?.nextTryAt == Self.start.addingTimeInterval(16 + 30), "15 s, then 30 s")

        await h.server.set(.online)
        h.clock.advance(31)
        await engine.sync(profile: nil, force: false)
        #expect(engine.queuedCount == 0)
        #expect(await h.server.rows.count == 1)
    }

    /// Ticket: the server answers `success: false` → the attempt stays queued, with the code.
    @Test func successFalseKeepsTheAttempt() async {
        let h = Harness()
        defer { h.cleanUp() }
        let engine = h.engine()
        await engine.sync(profile: Self.child, history: [])
        await h.server.set(.successFalse("rules_missing"))
        await engine.attemptFinished(Self.attempt())
        #expect(engine.queuedCount == 1)
        let item = SyncStore(directory: h.directory).loadQueue().items.first
        #expect(item?.lastError == "rules_missing")
        #expect(item?.failures == 1)
        #expect(engine.phase == .waiting("submit_attempts: rules_missing"))
    }

    /// One attempt rejected, the others of the call stored. A rejected attempt would be rejected
    /// again (SK-021): it leaves the queue, logged and kept in the state, and is not queued again.
    @Test func rejectedAttemptLeavesTheQueue() async {
        let h = Harness()
        defer { h.cleanUp() }
        let engine = h.engine()
        let good = Self.attempt()
        let bad = Self.attempt()
        await h.server.reject([bad.id])
        await engine.sync(profile: Self.child, history: [good, bad])
        #expect(engine.queuedCount == 0)
        #expect(engine.isAcknowledged(good.id))
        #expect(engine.rejected[bad.id.uuidString.lowercased()] == "invalid_attempt")
        await engine.sync(profile: Self.child, history: [good, bad])   // next launch: not sent again
        #expect(await h.server.submitCalls.count == 1)
    }

    /// T2: the same attempt sent again three times stays one row on the server.
    @Test func resendingIsSafe() async {
        let h = Harness()
        defer { h.cleanUp() }
        let engine = h.engine()
        let attempt = Self.attempt()
        await engine.sync(profile: Self.child, history: [attempt])
        for _ in 0..<3 { await engine.resend(attempt) }
        #expect(await h.server.rows.count == 1)
        #expect(await h.server.submitCalls.count == 4)
        #expect(engine.queuedCount == 0)
    }

    /// Reinstall (Keychain kept the guest, the device made a new profile): `profile_limit` → the
    /// guest's server profile is used; no second profile; attempts go under the server id.
    @Test func profileLimitAdoptsTheExistingProfile() async {
        let h = Harness()
        defer { h.cleanUp() }
        let old = ServerProfile(id: UUID(), voiceMode: "en", timezone: "Asia/Ho_Chi_Minh")
        await h.server.setProfileError("profile_limit")
        await h.server.setExisting([old])
        let engine = h.engine()
        let attempt = Self.attempt()
        await engine.sync(profile: Self.child, history: [attempt])
        #expect(engine.profileLink?.status == .adopted)
        #expect(engine.profileLink?.serverId == old.id)
        #expect(await h.server.rows[attempt.id]?.childId == old.id, "sent as the server profile")
        #expect(engine.queuedCount == 0)
        #expect(await h.server.profiles.isEmpty, "no second profile")
    }

    /// `profile_limit` and no active profile to use: logged, the app goes on; attempts wait.
    @Test func profileLimitKeepsAttemptsWaiting() async {
        let h = Harness()
        defer { h.cleanUp() }
        await h.server.setProfileError("profile_limit")
        let engine = h.engine()
        await engine.sync(profile: Self.child, history: [Self.attempt()])
        #expect(engine.profileLink?.status == .limit)
        #expect(engine.queuedCount == 1)
        #expect(await h.server.submitCalls.isEmpty)
        await engine.sync(profile: Self.child)
        #expect(await h.server.profileCalls == 1, "a limit is not asked again at every launch")
    }

    /// Offline at the very first launch: nothing is lost; once online the profile then the attempt go.
    @Test func offlineFirstLaunchCatchesUp() async {
        let h = Harness()
        defer { h.cleanUp() }
        await h.server.set(.offline)
        let engine = h.engine()
        let attempt = Self.attempt()
        await engine.sync(profile: Self.child, history: [attempt])
        #expect(engine.profileLink == nil)
        #expect(engine.queuedCount == 1)
        await h.server.set(.online)
        await engine.sync(profile: Self.child, history: [attempt])   // app opened again
        #expect(engine.profileLink?.status == .linked)
        #expect(engine.queuedCount == 0)
        #expect(await h.server.rows.count == 1)
    }

    /// More than 50 waiting: several calls of at most 50.
    @Test func sendsInBatchesOfFifty() async {
        let h = Harness()
        defer { h.cleanUp() }
        let engine = h.engine()
        await engine.sync(profile: Self.child, history: (0..<120).map { _ in Self.attempt() })
        #expect(await h.server.submitCalls.map(\.count) == [50, 50, 20])
        #expect(engine.queuedCount == 0)
    }

    /// The queue and the state outlive the engine (a relaunch).
    @Test func queueSurvivesARelaunch() async {
        let h = Harness()
        defer { h.cleanUp() }
        await h.server.set(.offline)
        let first = h.engine()
        let attempt = Self.attempt()
        await first.sync(profile: Self.child, history: [attempt])
        let installId = first.installId
        await h.server.set(.online)
        let second = h.engine()
        #expect(second.queuedIds == [attempt.id])
        #expect(second.installId == installId)
        await second.sync(profile: Self.child)
        #expect(await h.server.rows.count == 1)
    }

    /// Another guest after sign-in (the old session was gone): links and receipts start over.
    @Test func newGuestLinksAgain() async {
        let h = Harness()
        defer { h.cleanUp() }
        let engine = h.engine()
        await engine.sync(profile: Self.child, history: [Self.attempt()])
        #expect(engine.userId == "user-1")
        await h.server.setUser("user-2")
        await engine.sync(profile: Self.child)
        #expect(engine.userId == "user-2")
        #expect(await h.server.profileCalls == 2)
    }

    /// No server in the build: the engine queues nothing it can send and stays off.
    @Test func noTransportIsOff() async {
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent("SyncTests-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: directory) }
        let engine = SyncEngine(transport: nil, store: SyncStore(directory: directory), schedulesRetries: false)
        await engine.sync(profile: Self.child, history: [Self.attempt()])
        #expect(engine.phase == .off)
    }
}

// MARK: - Pieces

@Suite struct SyncPiecesTests {
    @Test func backoffDoublesUpToTheCap() {
        let backoff = Backoff(base: 15, cap: 15 * 60)
        #expect((1...8).map { backoff.delay(afterFailures: $0) } == [15, 30, 60, 120, 240, 480, 900, 900])
        #expect(backoff.delay(afterFailures: 0) == 0)
        #expect(backoff.delay(afterFailures: 1000) == 900)
    }

    /// A queue or state file that does not decode is kept aside, never overwritten.
    @Test func corruptFilesAreKeptAside() throws {
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent("SyncTests-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: directory) }
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        try Data("{ broken".utf8).write(to: directory.appendingPathComponent("queue.json"))
        let store = SyncStore(directory: directory)
        #expect(store.loadQueue(now: Date(timeIntervalSince1970: 0)).items.isEmpty)
        let names = try FileManager.default.contentsOfDirectory(atPath: directory.path)
        #expect(names.contains("queue.json.corrupt-19700101T000000Z"), "\(names)")
        #expect(!names.contains("queue.json"))
    }

    @Test func configFromInfoPlist() {
        #expect(SyncConfig(info: [:]) == nil)
        #expect(SyncConfig(info: [SyncConfig.urlKey: "$(SK_SUPABASE_URL)", SyncConfig.keyKey: "k"]) == nil, "not configured")
        #expect(SyncConfig(info: [SyncConfig.urlKey: "http://example.test", SyncConfig.keyKey: "k"]) == nil, "https only")
        #expect(SyncConfig(info: [SyncConfig.urlKey: "https://example.test", SyncConfig.keyKey: ""]) == nil)
        let config = SyncConfig(info: [SyncConfig.urlKey: "https://example.test", SyncConfig.keyKey: "sb_publishable_test"])
        #expect(config?.url.host == "example.test")
    }

    /// The JSON keys the RPCs of SK-021 read.
    @MainActor
    @Test func payloadKeysMatchTheRPCs() throws {
        let profile = try JSONSerialization.jsonObject(with: JSONEncoder().encode(SyncEngineTests.child)) as? [String: Any]
        #expect(Set(profile?.keys.map { $0 } ?? []) == ["p_id", "p_display_name", "p_avatar", "p_grade", "p_language_mode", "p_voice_mode", "p_timezone"])
        var attempt = SyncEngineTests.attempt()
        attempt.installId = UUID()
        let object = try JSONSerialization.jsonObject(with: JSONEncoder().encode(attempt)) as? [String: Any]
        #expect(Set(object?.keys.map { $0 } ?? []) == [
            "id", "child_id", "lesson_id", "content_version", "started_at", "completed_at", "duration_s",
            "score", "max_score", "xp", "install_id", "client_created_at", "answers",
        ])
        let answer = (object?["answers"] as? [[String: Any]])?.first
        #expect(Set(answer?.keys.map { $0 } ?? []) == ["item_id", "slot", "correct", "points", "answer", "hint_used", "tries"])
        #expect(answer?["slot"] as? Int == 1)
        #expect(AttemptPayload.timestamp(Date(timeIntervalSince1970: 1_793_584_800.9)) == "2026-11-02T02:00:00Z")
    }

    /// Responses as SK-021 writes them decode.
    @Test func rpcResponsesDecode() throws {
        let submit = #"""
        {"success": true, "error_code": null, "error": null, "data": {"results": [
          {"index": 0, "id": "9b0c3c3e-6b8e-4b5e-9b1a-2f6f0f6a7c11", "status": "inserted", "error_code": null, "error": null,
           "child_id": "5311ce49-eed1-4380-94b5-6ffeee6e0d3b", "lesson_id": "4b11eb40-9a47-4e5e-b4b5-bea60264ded3",
           "score": 6, "max_score": 6, "completed": true, "local_date": "2026-11-02", "xp": 90, "stars": 2},
          {"index": 1, "id": "not-a-uuid", "status": "rejected", "error_code": "invalid_attempt", "error": "id is missing"}],
          "progress": [{"child_id": "5311ce49-eed1-4380-94b5-6ffeee6e0d3b", "lesson_id": "4b11eb40-9a47-4e5e-b4b5-bea60264ded3",
           "stars": 2, "best_score": 6, "attempts_count": 1, "first_pass_at": "2026-11-02T02:00:00Z", "mastered_at": null,
           "last_completed_at": "2026-11-02T02:00:00Z"}]}}
        """#
        let response = try JSONDecoder().decode(RPCResponse<SubmitResult>.self, from: Data(submit.utf8))
        #expect(response.data?.results.map(\.status) == [.inserted, .rejected])
        #expect(response.data?.results.first?.stars == 2)
        #expect(response.data?.progress.first?.stars == 2)

        let home = #"""
        {"success": true, "error_code": null, "error": null, "data": {"child": {"id": "5311ce49-eed1-4380-94b5-6ffeee6e0d3b"},
         "today": "2026-11-02", "lessons": [], "total_stars": 2, "total_xp": 90, "last_lesson_id": null,
         "streak": {"studied_days": 1, "chain_start": "2026-11-02", "rest_days": [], "studied_today": true}, "minutes_today": 10}}
        """#
        let decoded = try JSONDecoder().decode(RPCResponse<HomeData>.self, from: Data(home.utf8))
        #expect(decoded.data?.streak?.studiedDays == 1)
        #expect(decoded.data?.totalStars == 2)

        let refused = #"{"success": false, "error_code": "profile_limit", "error": "this account already has its active profile", "data": null}"#
        let limit = try JSONDecoder().decode(RPCResponse<ServerProfile>.self, from: Data(refused.utf8))
        #expect(!limit.success)
        #expect(limit.errorCode == "profile_limit")
        #expect(limit.data == nil)
    }
}
