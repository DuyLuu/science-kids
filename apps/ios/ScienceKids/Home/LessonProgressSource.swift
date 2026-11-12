import ContentKit
import Foundation
import LessonPlayer
import Sync

extension LessonProgressSnapshot {
    /// One child's progress for Home and Topic (10/11), from what the app already keeps:
    ///
    /// - the finished attempts on the device (`lessons/history.json`, SK-012), whose stars the
    ///   server settles quietly (SK-022 `updateStars`);
    /// - the server's lesson progress of the last `get_home` (SK-022), cached on the device: it
    ///   counts lessons this device no longer has in its history (app installed again);
    /// - the attempts under way (`lessons/in_progress/`, not expired).
    ///
    /// Best stars per lesson are the higher of the device and the server: stars never go down.
    static func of(
        childId: UUID, history: [AttemptRecord], inProgress: [AttemptProgress], server: [LessonProgress]?
    ) -> LessonProgressSnapshot {
        var best: [UUID: Int] = [:]
        for record in history where record.childId == childId {
            best[record.lessonId] = max(best[record.lessonId] ?? 0, record.stars)
        }
        for lesson in server ?? [] where lesson.childId == childId {
            best[lesson.lessonId] = max(best[lesson.lessonId] ?? 0, lesson.stars)
        }
        let started = inProgress.filter { $0.childId == childId }.map(\.lessonId)
        return LessonProgressSnapshot(bestStars: best, inProgress: Set(started))
    }
}
