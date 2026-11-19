import Foundation
import LessonEngine
import LessonPlayer
import Profiles
import Sync
import Testing
@testable import ScienceKids

/// SK-022, app side: history → `submit_attempts` payload, Home stars and streak, a broken profile file.
@MainActor
@Suite struct SyncAppTests {
    static let child = UUID()
    static let lesson = UUID(uuidString: "4b11eb40-9a47-4e5e-b4b5-bea60264ded3")!

    static func record(day: String, stars: Int, child: UUID = child, lesson: UUID = lesson) -> AttemptRecord {
        let completed = ISO8601DateFormatter().date(from: "\(day)T03:00:00Z")!
        return AttemptRecord(
            id: UUID(), childId: child, lessonId: lesson, contentVersion: "15880ff9df19",
            startedAt: completed.addingTimeInterval(-480), completedAt: completed, score: 6, maxScore: 6, durationS: 480,
            xp: 90, stars: stars, localDate: day,
            answers: [.init(itemId: UUID().uuidString.lowercased(), slot: 1, correct: true, points: 1, answer: [.selected("q1_orange")], hintUsed: false, tries: 1)]
        )
    }

    /// The payload carries the record as SK-021's `submit_attempts` reads it (no `local_date`, no stars).
    @Test func historyRecordBecomesThePayload() throws {
        let record = Self.record(day: "2026-11-02", stars: 2)
        let payload = AttemptPayload(record)
        #expect(payload.id == record.id)
        #expect(payload.childId == record.childId)
        #expect(payload.startedAt == "2026-11-02T02:52:00Z")
        #expect(payload.completedAt == "2026-11-02T03:00:00Z")
        #expect(payload.contentVersion == "15880ff9df19")
        #expect(payload.answers.first?.slot == 1)
        #expect(payload.answers.first?.answer == .array([.object(["selected": .string("q1_orange")])]))
        let json = try JSONSerialization.jsonObject(with: JSONEncoder().encode(payload)) as? [String: Any]
        #expect(json?["local_date"] == nil)
        #expect(json?["stars"] == nil)
    }

    /// Home: the device's numbers (offline, or something still queued), the server's once settled.
    @Test func homeProgressSources() {
        let history = [
            Self.record(day: "2026-11-02", stars: 1),
            Self.record(day: "2026-11-03", stars: 2),
            Self.record(day: "2026-11-01", stars: 2, child: UUID()), // another child
        ]
        let now = ISO8601DateFormatter().date(from: "2026-11-03T05:00:00Z")! // 12:00 in Hồ Chí Minh
        let rules = StreakRules(restDaysPerWeek: 1)
        let device = HomeProgress.compute(history: history, childId: Self.child, timeZone: "Asia/Ho_Chi_Minh", rules: rules, server: nil, queued: 0, now: now)
        #expect(device == HomeProgress(streakDays: 2, stars: 2, source: .device))

        let server = HomeData(
            today: "2026-11-03", lessons: [], totalStars: 3, totalXP: 180, lastLessonId: Self.lesson,
            streak: .init(studiedDays: 5, chainStart: "2026-10-30", restDays: [], studiedToday: true), minutesToday: 8
        )
        let settled = HomeProgress.compute(history: history, childId: Self.child, timeZone: "Asia/Ho_Chi_Minh", rules: rules, server: server, queued: 0, now: now)
        #expect(settled == HomeProgress(streakDays: 5, stars: 3, source: .server))

        let waiting = HomeProgress.compute(history: history, childId: Self.child, timeZone: "Asia/Ho_Chi_Minh", rules: rules, server: server, queued: 1, now: now)
        #expect(waiting.source == .device, "an attempt still queued: the device knows more")

        let yesterday = HomeProgress.compute(
            history: history, childId: Self.child, timeZone: "Asia/Ho_Chi_Minh", rules: rules, server: server, queued: 0,
            now: now.addingTimeInterval(24 * 3600)
        )
        #expect(yesterday.source == .device, "the server's answer was for another day")
    }

    /// SK-052 (Explorer #7 run, 18/11): Home said 8 stars before and after a lesson won with 2.
    /// The server had 4 lessons × 2 (one of them never played on this device); the device had 3
    /// of them and the new one, still queued, so the device's own sum was 8 too. The device's
    /// number now counts the server's lessons as well, the best per lesson: 10.
    @Test func homeStarsKeepTheServersLessonsWhileAnAttemptWaits() {
        let a = UUID(), b = UUID(), c = UUID(), onlyOnServer = UUID(), played = UUID()
        let history = [
            Self.record(day: "2026-11-17", stars: 2, lesson: a),
            Self.record(day: "2026-11-17", stars: 2, lesson: b),
            Self.record(day: "2026-11-17", stars: 2, lesson: c),
            Self.record(day: "2026-11-18", stars: 2, lesson: played), // the Explorer lesson, queued
        ]
        let serverChild = UUID()
        let server = HomeData(
            today: "2026-11-18",
            lessons: [a, b, c, onlyOnServer].map { LessonProgress(childId: serverChild, lessonId: $0, stars: 2) },
            totalStars: 8, totalXP: 0, lastLessonId: c,
            streak: .init(studiedDays: 1, chainStart: "2026-11-18", restDays: [], studiedToday: true), minutesToday: 12
        )
        let now = ISO8601DateFormatter().date(from: "2026-11-18T10:31:00Z")!
        let rules = StreakRules(restDaysPerWeek: 1)
        let waiting = HomeProgress.compute(history: history, childId: Self.child, timeZone: "Asia/Ho_Chi_Minh", rules: rules, server: server, queued: 1, now: now)
        #expect(waiting.source == .device)
        #expect(waiting.stars == 10, "8 before the lesson, + 2")

        // A lesson played again with fewer stars does not take any away (best per lesson).
        let again = history + [Self.record(day: "2026-11-18", stars: 1, lesson: onlyOnServer)]
        #expect(HomeProgress.compute(history: again, childId: Self.child, timeZone: "Asia/Ho_Chi_Minh", rules: rules, server: server, queued: 1, now: now).stars == 10)

        // Settled: the server's total, which now has the lesson.
        let settledServer = HomeData(
            today: "2026-11-18",
            lessons: [a, b, c, onlyOnServer, played].map { LessonProgress(childId: serverChild, lessonId: $0, stars: 2) },
            totalStars: 10, totalXP: 0, lastLessonId: played,
            streak: .init(studiedDays: 1, chainStart: "2026-11-18", restDays: [], studiedToday: true), minutesToday: 12
        )
        let settled = HomeProgress.compute(history: history, childId: Self.child, timeZone: "Asia/Ho_Chi_Minh", rules: rules, server: settledServer, queued: 0, now: now)
        #expect(settled == HomeProgress(streakDays: 1, stars: 10, source: .server))
    }

    /// SK-011 tester: a broken profile file is kept aside; the child id of the lessons played is
    /// found, and the new profile keeps it.
    @Test func brokenProfileKeepsTheChildOfTheLessons() throws {
        let dir = FileManager.default.temporaryDirectory.appendingPathComponent("SyncAppTests-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: dir) }
        let store = ProfileStore(directory: dir)
        let attempts = AttemptStore(directory: dir.appendingPathComponent("lessons"))
        try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        try Data("not json".utf8).write(to: store.fileURL)
        try attempts.append(Self.record(day: "2026-11-02", stars: 2))

        let model = AppModel(store: store, library: .empty, attempts: attempts)
        #expect(model.profile == nil)
        #expect(model.recoveredChildId == Self.child)
        let names = try FileManager.default.contentsOfDirectory(atPath: dir.path)
        #expect(names.contains { $0.hasPrefix("child_profile.json.corrupt-") }, "\(names)")

        let made = try ChildProfile.create(displayName: "Minh", avatar: "ech", grade: 3, languageMode: .bilingual, voiceMode: .en)
        try model.createProfile(made)
        #expect(model.profile?.id == Self.child)
        #expect(model.profile?.displayName == "Minh")
        #expect(try store.load()?.id == Self.child)
    }

    /// Two children in the lessons (should not happen with one profile): nothing is guessed.
    @Test func brokenProfileWithTwoChildrenGuessesNothing() throws {
        let dir = FileManager.default.temporaryDirectory.appendingPathComponent("SyncAppTests-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: dir) }
        let store = ProfileStore(directory: dir)
        let attempts = AttemptStore(directory: dir.appendingPathComponent("lessons"))
        try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        try Data("not json".utf8).write(to: store.fileURL)
        try attempts.append(Self.record(day: "2026-11-02", stars: 2))
        try attempts.append(Self.record(day: "2026-11-02", stars: 2, child: UUID()))
        #expect(AppModel(store: store, library: .empty, attempts: attempts).recoveredChildId == nil)
    }

    /// `rest_days_per_week` reaches the streak from the bundled rules.
    @Test func streakRulesComeFromTheContent() async {
        let model = AppModel(store: nil, content: .loading)
        await model.loadContent()
        #expect(model.content.ready?.rules(for: .discoverer)?.streak.restDaysPerWeek == 1)
    }

    /// The hosted unit tests never talk to the server.
    @Test func unitTestHostHasNoSync() {
        #expect(LaunchOptions(arguments: ["app"], environment: ["XCTestConfigurationFilePath": "/x"]).syncOff)
        #expect(!LaunchOptions(arguments: ["app"], environment: [:]).syncOff)
        #expect(LaunchOptions(arguments: ["app", "-SKSyncOff", "YES"]).syncOff)
        #expect(AppModel.transport(options: LaunchOptions.current) == nil)
        #expect(LaunchOptions(arguments: ["app", "-SKResendLastAttempt", "3"]).resendLastAttempt == 3)
    }
}
