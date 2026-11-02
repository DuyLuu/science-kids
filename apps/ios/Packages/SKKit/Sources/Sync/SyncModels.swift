import Foundation

// What the app sends to and reads from the three RPCs of SK-021 (`database/supabase/schemas/50_rpc.sql`):
// `create_child_profile`, `submit_attempts`, `get_home`. Every RPC returns
// `{success, error_code, error, data}`. Keys are the server's snake_case, written out.

/// Any JSON value: the `answer` of a quiz answer (the engine's tries, sent as they are stored).
public enum SyncJSON: Codable, Hashable, Sendable {
    case null
    case bool(Bool)
    case number(Double)
    case string(String)
    case array([SyncJSON])
    case object([String: SyncJSON])

    public init(from decoder: any Decoder) throws {
        let c = try decoder.singleValueContainer()
        if c.decodeNil() { self = .null }
        else if let value = try? c.decode(Bool.self) { self = .bool(value) }
        else if let value = try? c.decode(Double.self) { self = .number(value) }
        else if let value = try? c.decode(String.self) { self = .string(value) }
        else if let value = try? c.decode([SyncJSON].self) { self = .array(value) }
        else { self = .object(try c.decode([String: SyncJSON].self)) }
    }

    public func encode(to encoder: any Encoder) throws {
        var c = encoder.singleValueContainer()
        switch self {
        case .null: try c.encodeNil()
        case .bool(let value): try c.encode(value)
        case .number(let value):
            if value.rounded() == value, abs(value) < 1e15 { try c.encode(Int64(value)) } else { try c.encode(value) }
        case .string(let value): try c.encode(value)
        case .array(let value): try c.encode(value)
        case .object(let value): try c.encode(value)
        }
    }

    /// Any `Encodable` value as JSON (the engine's `[Try]`).
    public init(encoding value: some Encodable) throws {
        let data = try JSONEncoder().encode(value)
        self = try JSONDecoder().decode(SyncJSON.self, from: data)
    }
}

/// `{success, error_code, error, data}` of every RPC.
public struct RPCResponse<Payload: Decodable & Sendable>: Decodable, Sendable {
    public let success: Bool
    public let errorCode: String?
    public let error: String?
    public let data: Payload?

    public init(success: Bool, errorCode: String? = nil, error: String? = nil, data: Payload? = nil) {
        self.success = success
        self.errorCode = errorCode
        self.error = error
        self.data = data
    }

    enum CodingKeys: String, CodingKey {
        case success, error, data
        case errorCode = "error_code"
    }

    public static func failure(_ code: String, _ message: String = "") -> RPCResponse {
        RPCResponse(success: false, errorCode: code, error: message)
    }
}

// MARK: create_child_profile

/// The child profile of the device, sent once (`create_child_profile`). `id` is the device's id:
/// the server keeps it, so the call is idempotent and attempts name the same child on both sides.
public struct ProfilePayload: Codable, Hashable, Sendable {
    public var id: UUID
    public var displayName: String
    public var avatar: String
    public var grade: Int
    public var languageMode: String
    public var voiceMode: String
    public var timezone: String

    public init(id: UUID, displayName: String, avatar: String, grade: Int, languageMode: String, voiceMode: String, timezone: String) {
        self.id = id
        self.displayName = displayName
        self.avatar = avatar
        self.grade = grade
        self.languageMode = languageMode
        self.voiceMode = voiceMode
        self.timezone = timezone
    }

    /// The RPC's parameters (`p_…`).
    enum CodingKeys: String, CodingKey {
        case id = "p_id"
        case displayName = "p_display_name"
        case avatar = "p_avatar"
        case grade = "p_grade"
        case languageMode = "p_language_mode"
        case voiceMode = "p_voice_mode"
        case timezone = "p_timezone"
    }
}

/// `data` of `create_child_profile` (`child_profile_json` + `created`).
public struct ServerProfile: Decodable, Hashable, Sendable {
    public let id: UUID
    public let voiceMode: String?
    public let timezone: String?
    /// `false` when the same `p_id` was already stored (a retried call).
    public let created: Bool?

    public init(id: UUID, voiceMode: String? = nil, timezone: String? = nil, created: Bool? = nil) {
        self.id = id
        self.voiceMode = voiceMode
        self.timezone = timezone
        self.created = created
    }

    enum CodingKeys: String, CodingKey {
        case id, timezone, created
        case voiceMode = "voice_mode"
    }
}

// MARK: submit_attempts

/// One finished lesson attempt as `submit_attempts` takes it (`lesson_attempts` + `quiz_answers`,
/// B5.3). Kept in the offline queue as it will be sent. Times are ISO 8601 UTC, whole seconds.
/// No `local_date`: the server computes it from `completed_at` and the profile's time zone (B5.1).
public struct AttemptPayload: Codable, Hashable, Sendable, Identifiable {
    public struct Answer: Codable, Hashable, Sendable {
        public var itemId: String
        /// 1-based position in the quiz (the server reads a number as a quiz slot).
        public var slot: Int
        public var correct: Bool
        public var points: Int
        public var answer: SyncJSON
        public var hintUsed: Bool
        public var tries: Int

        public init(itemId: String, slot: Int, correct: Bool, points: Int, answer: SyncJSON, hintUsed: Bool, tries: Int) {
            self.itemId = itemId
            self.slot = slot
            self.correct = correct
            self.points = points
            self.answer = answer
            self.hintUsed = hintUsed
            self.tries = tries
        }

        enum CodingKeys: String, CodingKey {
            case slot, correct, points, answer, tries
            case itemId = "item_id"
            case hintUsed = "hint_used"
        }
    }

    public var id: UUID
    public var childId: UUID
    public var lessonId: UUID
    public var contentVersion: String?
    public var startedAt: String
    public var completedAt: String?
    public var durationS: Int
    public var score: Int
    public var maxScore: Int
    public var xp: Int
    /// The app install that played it (`SyncState.installId`); filled by `SyncEngine`.
    public var installId: UUID?
    public var clientCreatedAt: String
    public var answers: [Answer]

    public init(
        id: UUID, childId: UUID, lessonId: UUID, contentVersion: String?, startedAt: String, completedAt: String?,
        durationS: Int, score: Int, maxScore: Int, xp: Int, installId: UUID? = nil, clientCreatedAt: String, answers: [Answer]
    ) {
        self.id = id
        self.childId = childId
        self.lessonId = lessonId
        self.contentVersion = contentVersion
        self.startedAt = startedAt
        self.completedAt = completedAt
        self.durationS = durationS
        self.score = score
        self.maxScore = maxScore
        self.xp = xp
        self.installId = installId
        self.clientCreatedAt = clientCreatedAt
        self.answers = answers
    }

    enum CodingKeys: String, CodingKey {
        case id, score, xp, answers
        case childId = "child_id"
        case lessonId = "lesson_id"
        case contentVersion = "content_version"
        case startedAt = "started_at"
        case completedAt = "completed_at"
        case durationS = "duration_s"
        case maxScore = "max_score"
        case installId = "install_id"
        case clientCreatedAt = "client_created_at"
    }

    /// ISO 8601 UTC, whole seconds (`2026-11-02T02:00:00Z`), as the app's files and the server write it.
    public static func timestamp(_ date: Date) -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime]
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter.string(from: Date(timeIntervalSince1970: date.timeIntervalSince1970.rounded(.down)))
    }
}

/// `data` of `submit_attempts`.
public struct SubmitResult: Decodable, Hashable, Sendable {
    /// The result of each attempt sent, in the order sent.
    public struct Item: Decodable, Hashable, Sendable {
        public enum Status: String, Decodable, Hashable, Sendable {
            /// Stored now.
            case inserted
            /// Stored before (a resend): nothing written again.
            case duplicate
            /// Not stored; `errorCode` says why. The other attempts of the call are stored.
            case rejected
        }

        public let index: Int
        public let id: String?
        public let status: Status
        public let errorCode: String?
        public let error: String?
        public let lessonId: UUID?
        public let score: Int?
        public let maxScore: Int?
        public let localDate: String?
        public let xp: Int?
        /// Stars of the lesson after the whole call (server-settled).
        public let stars: Int?

        public init(
            index: Int, id: String?, status: Status, errorCode: String? = nil, error: String? = nil, lessonId: UUID? = nil,
            score: Int? = nil, maxScore: Int? = nil, localDate: String? = nil, xp: Int? = nil, stars: Int? = nil
        ) {
            self.index = index
            self.id = id
            self.status = status
            self.errorCode = errorCode
            self.error = error
            self.lessonId = lessonId
            self.score = score
            self.maxScore = maxScore
            self.localDate = localDate
            self.xp = xp
            self.stars = stars
        }

        enum CodingKeys: String, CodingKey {
            case index, id, status, error, score, xp, stars
            case errorCode = "error_code"
            case lessonId = "lesson_id"
            case maxScore = "max_score"
            case localDate = "local_date"
        }
    }

    public let results: [Item]
    public let progress: [LessonProgress]

    public init(results: [Item], progress: [LessonProgress] = []) {
        self.results = results
        self.progress = progress
    }
}

/// `lesson_progress_json`: the settled progress of one lesson.
public struct LessonProgress: Codable, Hashable, Sendable {
    public let childId: UUID
    public let lessonId: UUID
    public let stars: Int
    public let bestScore: Int?
    public let attemptsCount: Int?

    public init(childId: UUID, lessonId: UUID, stars: Int, bestScore: Int? = nil, attemptsCount: Int? = nil) {
        self.childId = childId
        self.lessonId = lessonId
        self.stars = stars
        self.bestScore = bestScore
        self.attemptsCount = attemptsCount
    }

    enum CodingKeys: String, CodingKey {
        case stars
        case childId = "child_id"
        case lessonId = "lesson_id"
        case bestScore = "best_score"
        case attemptsCount = "attempts_count"
    }
}

// MARK: get_home

/// `data` of `get_home`: what Home shows, settled by the server.
public struct HomeData: Codable, Hashable, Sendable {
    public struct Streak: Codable, Hashable, Sendable {
        public let studiedDays: Int
        public let chainStart: String?
        public let restDays: [String]
        public let studiedToday: Bool?

        public init(studiedDays: Int, chainStart: String?, restDays: [String], studiedToday: Bool?) {
            self.studiedDays = studiedDays
            self.chainStart = chainStart
            self.restDays = restDays
            self.studiedToday = studiedToday
        }

        enum CodingKeys: String, CodingKey {
            case studiedDays = "studied_days"
            case chainStart = "chain_start"
            case restDays = "rest_days"
            case studiedToday = "studied_today"
        }
    }

    /// The child's local date on the server when it answered (`YYYY-MM-DD`).
    public let today: String
    public let lessons: [LessonProgress]
    public let totalStars: Int
    public let totalXP: Int
    public let lastLessonId: UUID?
    public let streak: Streak?
    public let minutesToday: Int?

    public init(today: String, lessons: [LessonProgress], totalStars: Int, totalXP: Int, lastLessonId: UUID?, streak: Streak?, minutesToday: Int?) {
        self.today = today
        self.lessons = lessons
        self.totalStars = totalStars
        self.totalXP = totalXP
        self.lastLessonId = lastLessonId
        self.streak = streak
        self.minutesToday = minutesToday
    }

    enum CodingKeys: String, CodingKey {
        case today, lessons, streak
        case totalStars = "total_stars"
        case totalXP = "total_xp"
        case lastLessonId = "last_lesson_id"
        case minutesToday = "minutes_today"
    }
}
