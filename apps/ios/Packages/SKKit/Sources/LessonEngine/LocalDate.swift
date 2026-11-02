import Foundation

/// A calendar date in the child's time zone (`local_date`, B5.1), written `YYYY-MM-DD`.
///
/// Plain proleptic Gregorian arithmetic. Turning an instant into a local date is
/// `localDate(at:timeZone:)` (SK-022), the only place the engine reads the time zone database.
public struct LocalDate: Hashable, Comparable, Sendable, CustomStringConvertible {
    public let year: Int
    public let month: Int
    public let day: Int

    /// `nil` when the date does not exist (2026-02-30) or a part is out of range.
    public init?(year: Int, month: Int, day: Int) {
        guard (1...9999).contains(year), (1...12).contains(month),
              (1...Self.daysIn(month: month, year: year)).contains(day)
        else { return nil }
        self.year = year
        self.month = month
        self.day = day
    }

    /// Parses exactly `YYYY-MM-DD`.
    public init?(_ text: String) {
        let parts = text.split(separator: "-", omittingEmptySubsequences: false)
        guard parts.count == 3, parts[0].count == 4, parts[1].count == 2, parts[2].count == 2,
              parts.allSatisfy({ $0.allSatisfy { $0.isASCII && $0.isNumber } }),
              let year = Int(parts[0]), let month = Int(parts[1]), let day = Int(parts[2])
        else { return nil }
        self.init(year: year, month: month, day: day)
    }

    public var description: String {
        func pad(_ value: Int, _ width: Int) -> String {
            let digits = String(value)
            return String(repeating: "0", count: max(0, width - digits.count)) + digits
        }
        return "\(pad(year, 4))-\(pad(month, 2))-\(pad(day, 2))"
    }

    /// Days since 1970-01-01 (days-from-civil).
    public var dayNumber: Int {
        let y = month <= 2 ? year - 1 : year
        let era = (y >= 0 ? y : y - 399) / 400
        let yearOfEra = y - era * 400
        let monthIndex = (month + 9) % 12
        let dayOfYear = (153 * monthIndex + 2) / 5 + day - 1
        let dayOfEra = yearOfEra * 365 + yearOfEra / 4 - yearOfEra / 100 + dayOfYear
        return era * 146_097 + dayOfEra - 719_468
    }

    /// Calendar days from `self` to `other` (negative when `other` is earlier).
    public func days(to other: LocalDate) -> Int {
        other.dayNumber - dayNumber
    }

    public static func < (lhs: LocalDate, rhs: LocalDate) -> Bool {
        (lhs.year, lhs.month, lhs.day) < (rhs.year, rhs.month, rhs.day)
    }

    static func daysIn(month: Int, year: Int) -> Int {
        switch month {
        case 2: (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 ? 29 : 28
        case 4, 6, 9, 11: 30
        default: 31
        }
    }
}

/// Why `localDate(at:timeZone:)` has no answer.
public enum LocalDateError: Error, Hashable, Sendable {
    /// Not an IANA time zone name the platform knows (`Asia/Ho_Chi_Minh`, `Europe/London`).
    case unknownTimeZone(String)

    public var code: String {
        switch self {
        case .unknownTimeZone: "unknown_timezone"
        }
    }
}

/// `local_date(completed_at, timezone)` (vector `local-date`, B5.1): the calendar date of an
/// instant in an IANA time zone, from the platform's time zone database (summer time included),
/// never a fixed offset. Same result as the server's `(completed_at AT TIME ZONE timezone)::date`.
public func localDate(at instant: Date, timeZone identifier: String) -> Result<LocalDate, LocalDateError> {
    guard let zone = TimeZone(identifier: identifier) else { return .failure(.unknownTimeZone(identifier)) }
    return .success(localDate(at: instant, in: zone))
}

/// `localDate(at:timeZone:)` for a `TimeZone` already in hand.
public func localDate(at instant: Date, in zone: TimeZone) -> LocalDate {
    var calendar = Calendar(identifier: .gregorian)
    calendar.timeZone = zone
    let parts = calendar.dateComponents([.year, .month, .day], from: instant)
    return LocalDate(year: parts.year ?? 1970, month: parts.month ?? 1, day: parts.day ?? 1)
        ?? LocalDate(year: 1970, month: 1, day: 1)!
}
