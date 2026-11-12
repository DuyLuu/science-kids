import Foundation
import LessonEngine
import LessonPlayer
import Sync

/// The week strip of Huy hiệu (SK-035, canvas `Discoverer-Badges`): Monday to Sunday of the
/// child's current ISO week (the streak's week, B4.4), each day studied, a rest day the streak
/// used, missed, or still to come. No rule of its own: the streak is `computeStreak` on the
/// device, settled by the server's `get_home` exactly when `HomeProgress` takes the server's
/// number, so the strip and the Home chip always agree.
struct StreakWeek: Equatable {
    enum State: Equatable {
        /// At least one lesson finished that day.
        case studied
        /// A day without study the streak skipped (`rest_days_per_week`).
        case rest
        /// A day gone by without study, not a rest day.
        case missed
        /// Today before a lesson is finished (it never breaks the streak), and the days after.
        case upcoming
    }

    struct Day: Equatable, Identifiable {
        let date: LocalDate
        let state: State
        let isToday: Bool

        /// ISO weekday: Monday 1 … Sunday 7.
        var weekday: Int { date.isoWeekday }
        var id: String { date.description }
    }

    let days: [Day]

    /// The week of `today`: a day in `studied` is studied, else in `rest` a rest day, else missed
    /// before today and to come from today on.
    static func of(studied: Set<LocalDate>, rest: Set<LocalDate>, today: LocalDate) -> StreakWeek {
        let monday = today.adding(days: 1 - today.isoWeekday)
        let days = (0..<7).map { offset -> Day in
            let date = monday.adding(days: offset)
            let state: State
            if studied.contains(date) {
                state = .studied
            } else if rest.contains(date) {
                state = .rest
            } else {
                state = date < today ? .missed : .upcoming
            }
            return Day(date: date, state: state, isToday: date == today)
        }
        return StreakWeek(days: days)
    }

    /// The strip from the device's lesson history (`localDate` of each finished attempt, rest days
    /// of `computeStreak`), or wholly from the server's streak on the same condition as
    /// `HomeProgress` (nothing waits in the queue and the server's today is the child's): its rest
    /// days, the days of its chain (every day from `chain_start` to yesterday that is not a rest
    /// day was studied) and `studied_today`. The device's days are then left out (tester 10/11
    /// #5), so the strip never shows more than the chip's number: a day before the chain shows
    /// as missed.
    static func compute(
        history: [AttemptRecord], childId: UUID, timeZone: String, rules: StreakRules,
        server: HomeData?, queued: Int, now: Date
    ) -> StreakWeek {
        let today = HomeProgress.today(at: now, timeZone: timeZone)
        if queued == 0, let server, server.today == today.description, let streak = server.streak {
            let rest = Set(streak.restDays.compactMap { LocalDate($0) })
            var studied = Set<LocalDate>()
            if let start = streak.chainStart.flatMap({ LocalDate($0) }) {
                var day = start
                while day < today {
                    if !rest.contains(day) { studied.insert(day) }
                    day = day.adding(days: 1)
                }
            }
            if streak.studiedToday == true { studied.insert(today) }
            return of(studied: studied, rest: rest.subtracting(studied), today: today)
        }
        let studied = Set(history.filter { $0.childId == childId }.compactMap { LocalDate($0.localDate) })
        let rest = Set(computeStreak(studiedDates: Array(studied), today: today, rules: rules).restDays)
        return of(studied: studied, rest: rest.subtracting(studied), today: today)
    }
}
