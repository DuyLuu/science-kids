import Foundation

/// Parameters of the day streak (`rules` of the manifest; `default_rules` of the vectors).
/// Decodes from the same flat JSON object as `content/rules.json`; a missing key means no rest day.
public struct StreakRules: Hashable, Sendable, Decodable {
    /// Days without study the chain may skip per ISO week (B4.4: "1 ngày nghỉ/tuần").
    public var restDaysPerWeek: Int

    public init(restDaysPerWeek: Int) {
        self.restDaysPerWeek = restDaysPerWeek
    }

    enum CodingKeys: String, CodingKey {
        case restDaysPerWeek = "rest_days_per_week"
    }

    public init(from decoder: any Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        restDaysPerWeek = try c.decodeIfPresent(Int.self, forKey: .restDaysPerWeek) ?? 0
    }
}

/// The day streak of a child (vector `streak`): days with study in the current chain, the first
/// of them, and the rest days the chain used after it.
public struct StreakResult: Hashable, Sendable {
    public var studiedDays: Int
    /// The earliest studied day of the chain; `nil` when the chain has no studied day.
    public var chainStart: LocalDate?
    /// Days without study the chain skipped, ascending, all after `chainStart`.
    public var restDays: [LocalDate]

    public init(studiedDays: Int, chainStart: LocalDate?, restDays: [LocalDate]) {
        self.studiedDays = studiedDays
        self.chainStart = chainStart
        self.restDays = restDays
    }

    public static let none = StreakResult(studiedDays: 0, chainStart: nil, restDays: [])
}

/// `compute_streak(studied_dates, today, rules)` (SK-003 D5, same as the server's SQL):
/// - today counts when studied; otherwise it is skipped, never a rest day;
/// - walk back from yesterday: a studied day adds one and moves `chainStart` there; a day without
///   study uses one rest day of its ISO week (Monday to Sunday) while any is left, else the chain
///   breaks;
/// - rest days before `chainStart` are dropped; studied dates after `today` are ignored.
///
/// `studiedDates`: local dates with at least one finished lesson, any order, duplicates allowed.
public func computeStreak(studiedDates: [LocalDate], today: LocalDate, rules: StreakRules) -> StreakResult {
    let studied = Set(studiedDates.filter { $0 <= today })
    guard let earliest = studied.min() else { return .none }

    var studiedDays = 0
    var chainStart: LocalDate?
    if studied.contains(today) {
        studiedDays = 1
        chainStart = today
    }

    var restUsed: [Int: Int] = [:] // Monday's day number → rest days used in that ISO week
    var rest: [LocalDate] = []
    var day = today.adding(days: -1)
    while day >= earliest {
        if studied.contains(day) {
            studiedDays += 1
            chainStart = day
        } else {
            let week = day.isoWeekMonday
            let used = restUsed[week, default: 0]
            if used >= rules.restDaysPerWeek { break }
            restUsed[week] = used + 1
            rest.append(day)
        }
        day = day.adding(days: -1)
    }

    let kept = chainStart.map { start in rest.filter { $0 > start }.sorted() } ?? []
    return StreakResult(studiedDays: studiedDays, chainStart: chainStart, restDays: kept)
}

extension LocalDate {
    /// The date `days` later (earlier when negative).
    public func adding(days: Int) -> LocalDate {
        LocalDate(dayNumber: dayNumber + days)
    }

    /// From days since 1970-01-01 (civil-from-days).
    public init(dayNumber: Int) {
        let z = dayNumber + 719_468
        let era = (z >= 0 ? z : z - 146_096) / 146_097
        let dayOfEra = z - era * 146_097
        let yearOfEra = (dayOfEra - dayOfEra / 1460 + dayOfEra / 36_524 - dayOfEra / 146_096) / 365
        let dayOfYear = dayOfEra - (365 * yearOfEra + yearOfEra / 4 - yearOfEra / 100)
        let monthIndex = (5 * dayOfYear + 2) / 153
        let day = dayOfYear - (153 * monthIndex + 2) / 5 + 1
        let month = monthIndex < 10 ? monthIndex + 3 : monthIndex - 9
        let year = yearOfEra + era * 400 + (month <= 2 ? 1 : 0)
        // In range by construction for the dates the app meets (years 1…9999).
        self = LocalDate(year: year, month: month, day: day) ?? LocalDate(year: 1970, month: 1, day: 1)!
    }

    /// ISO weekday: Monday 1 … Sunday 7 (1970-01-01 was a Thursday).
    public var isoWeekday: Int {
        ((dayNumber % 7) + 7 + 3) % 7 + 1
    }

    /// Day number of the Monday of this date's ISO week: one key per ISO week (`IYYY-IW`).
    var isoWeekMonday: Int {
        dayNumber - (isoWeekday - 1)
    }
}
