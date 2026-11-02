import Foundation
import Testing
@testable import LessonEngine

/// SK-022: the calendar helpers under `computeStreak` and `localDate`; the rules themselves are
/// checked by the shared vectors `streak` and `local-date` (VectorTests).
@Suite struct StreakHelperTests {
    static func date(_ text: String) -> LocalDate { LocalDate(text)! }

    @Test func dayArithmeticRoundTrips() {
        #expect(Self.date("1970-01-01").dayNumber == 0)
        #expect(LocalDate(dayNumber: 0) == Self.date("1970-01-01"))
        #expect(Self.date("2026-12-31").adding(days: 1) == Self.date("2027-01-01"))
        #expect(Self.date("2028-03-01").adding(days: -1) == Self.date("2028-02-29"), "leap year")
        #expect(Self.date("2026-03-01").adding(days: -1) == Self.date("2026-02-28"))
        for offset in stride(from: -40_000, through: 40_000, by: 997) {
            #expect(LocalDate(dayNumber: offset).dayNumber == offset)
        }
    }

    /// ISO weeks run Monday to Sunday; 2027-01-01 (Friday) is in 2026-W53 with 2026-12-28.
    @Test func isoWeeks() {
        #expect(Self.date("1970-01-01").isoWeekday == 4, "Thursday")
        #expect(Self.date("2026-11-02").isoWeekday == 1, "Monday")
        #expect(Self.date("2026-11-08").isoWeekday == 7, "Sunday")
        #expect(Self.date("2026-11-02").isoWeekMonday == Self.date("2026-11-08").isoWeekMonday)
        #expect(Self.date("2026-11-08").isoWeekMonday != Self.date("2026-11-09").isoWeekMonday)
        #expect(Self.date("2027-01-03").isoWeekMonday == Self.date("2026-12-28").dayNumber)
    }

    @Test func rulesDefaultToNoRestDay() throws {
        let rules = try JSONDecoder().decode(StreakRules.self, from: Data(#"{"max_tries": 2}"#.utf8))
        #expect(rules.restDaysPerWeek == 0)
        let one = try JSONDecoder().decode(StreakRules.self, from: Data(#"{"rest_days_per_week": 1}"#.utf8))
        #expect(one.restDaysPerWeek == 1)
    }

    @Test func unknownTimeZoneIsAnError() {
        #expect(localDate(at: Date(), timeZone: "Mars/Olympus_Mons") == .failure(.unknownTimeZone("Mars/Olympus_Mons")))
    }

    /// Studied dates after today (a device clock set back) never count.
    @Test func futureDatesAreIgnored() {
        let result = computeStreak(
            studiedDates: [Self.date("2026-11-07"), Self.date("2026-11-06")],
            today: Self.date("2026-11-06"), rules: StreakRules(restDaysPerWeek: 1)
        )
        #expect(result == StreakResult(studiedDays: 1, chainStart: Self.date("2026-11-06"), restDays: []))
    }
}
