import Foundation
import LessonEngine
import LessonPlayer
import Network
import os
import Profiles
import Sync

extension AttemptPayload {
    /// A finished attempt of the device (`lessons/history.json`, SK-012) as `submit_attempts` takes
    /// it. The answers' tries go as the engine stores them; no `local_date` (the server computes it).
    init(_ record: AttemptRecord) {
        self.init(
            id: record.id,
            childId: record.childId,
            lessonId: record.lessonId,
            contentVersion: record.contentVersion,
            startedAt: Self.timestamp(record.startedAt),
            completedAt: Self.timestamp(record.completedAt),
            durationS: record.durationS,
            score: record.score,
            maxScore: record.maxScore,
            xp: record.xp,
            clientCreatedAt: Self.timestamp(record.completedAt),
            answers: record.answers.map { answer in
                Answer(
                    itemId: answer.itemId, slot: answer.slot, correct: answer.correct, points: answer.points,
                    answer: (try? SyncJSON(encoding: answer.answer)) ?? .array([]),
                    hintUsed: answer.hintUsed, tries: answer.tries
                )
            }
        )
    }
}

/// Stars and day streak shown on Home (SK-022): computed on the device from the lesson history
/// (engine `computeStreak`, `localDate`), and replaced by the server's (`get_home`) once nothing waits
/// in the queue and the server's "today" is the child's today. The server settles; the device shows
/// at once, offline included.
struct HomeProgress: Equatable {
    enum Source: Equatable { case device, server }

    var streakDays: Int
    var stars: Int
    var source: Source

    static func compute(
        history: [AttemptRecord], childId: UUID, timeZone: String, rules: StreakRules,
        server: HomeData?, queued: Int, now: Date
    ) -> HomeProgress {
        let own = history.filter { $0.childId == childId }
        // Stars are the best of each lesson, summed (server `get_home.total_stars` = sum of
        // `lesson_progress.stars`). SK-052: the device's number counts the lessons the server
        // already has too (its last `get_home`), the higher of the two per lesson, as
        // `LessonProgressSnapshot` does: a lesson the server knows and this device does not (played
        // before a reinstall, on the adopted profile) is not lost while an attempt waits, so
        // finishing a lesson never shows fewer stars than before.
        var bestStars: [UUID: Int] = [:]
        for lesson in server?.lessons ?? [] { bestStars[lesson.lessonId] = max(bestStars[lesson.lessonId] ?? 0, lesson.stars) }
        for record in own { bestStars[record.lessonId] = max(bestStars[record.lessonId] ?? 0, record.stars) }
        let localStars = bestStars.values.reduce(0, +)
        let today = Self.today(at: now, timeZone: timeZone)
        let streak = computeStreak(studiedDates: own.compactMap { LocalDate($0.localDate) }, today: today, rules: rules)
        if queued == 0, let server, server.today == today.description {
            return HomeProgress(streakDays: server.streak?.studiedDays ?? streak.studiedDays, stars: server.totalStars, source: .server)
        }
        return HomeProgress(streakDays: streak.studiedDays, stars: localStars, source: .device)
    }

    /// The child's local date now: in the profile's time zone, the device's when that name is
    /// unknown. Shared with the week strip of Huy hiệu (`StreakWeek`, SK-035).
    static func today(at now: Date, timeZone: String) -> LocalDate {
        switch localDate(at: now, timeZone: timeZone) {
        case .success(let date): date
        case .failure: localDate(at: now, in: .current)
        }
    }
}

/// Calls `onBack` on the main actor when the network comes back after being away (B7.7: the queue
/// goes as soon as there is a network).
final class NetworkWatcher: @unchecked Sendable {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "vn.sciencekids.network")
    private var wasSatisfied: Bool?

    init(onBack: @escaping @MainActor @Sendable () -> Void) {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self else { return }
            let satisfied = path.status == .satisfied
            let cameBack = satisfied && self.wasSatisfied == false
            self.wasSatisfied = satisfied
            if cameBack { Task { @MainActor in onBack() } }
        }
        monitor.start(queue: queue)
    }

    deinit { monitor.cancel() }
}
