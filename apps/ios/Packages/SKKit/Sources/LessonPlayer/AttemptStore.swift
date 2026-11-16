import Foundation
import LessonEngine
import os
import Profiles

/// Where a lesson attempt stands (B4.4 "dừng giữa bài", B7.6): saved after every step and every
/// checked answer, so a lesson stopped half way opens again at the same place with the answers
/// already checked. One per lesson and child; removed when the attempt is finished.
public struct AttemptProgress: Codable, Hashable, Sendable {
    public enum Step: Hashable, Sendable {
        case warmup(index: Int)
        case learn
        case play
        case quiz(index: Int)
        /// Tổng kết (SK-047): two pages after the last quiz question, before the reward. The
        /// attempt is finished on the way in, so a progress file normally never holds it.
        case recap
        case reward
    }

    /// `lesson_attempts.id`: UUID v4 made when the child enters the lesson.
    public var attemptId: UUID
    public var childId: UUID
    public var lessonId: UUID
    public var startedAt: Date
    public var updatedAt: Date
    public var step: Step
    /// Tries per question key, in order (the engine's `Try`, also the shape of `quiz_answers.answer`).
    public var warmupTries: [String: [Try]]
    public var quizTries: [String: [Try]]
    /// Questions where the child opened "Gợi ý" before the question was done
    /// (`quiz_answers.hint_used`, SK-047): quiz questions by key, Khởi động ones as
    /// `warmup/<key>` (`LessonSession.hintKey`).
    public var hintsUsed: Set<String>
    /// Keys of the `explore_groups` groups the child has opened, and the one open now.
    public var exploreSeen: [String]
    public var exploreSelected: String?
    /// Item keys on the meal tray, in the order they were put on.
    public var tray: [String]
    /// The mini-game reached its goal (`xp_game_complete`).
    public var playCompleted: Bool
    /// The child left with the close button. A paused attempt waits for the child to come back;
    /// one that was cut off (app closed) opens again when the app opens.
    public var isPaused: Bool

    /// An attempt left this long without a change is dropped (B4.4: "bỏ dở quá 7 ngày thì huỷ").
    public static let maxIdle: TimeInterval = 7 * 24 * 60 * 60

    public init(attemptId: UUID = UUID(), childId: UUID, lessonId: UUID, now: Date, firstStep: Step) {
        self.attemptId = attemptId
        self.childId = childId
        self.lessonId = lessonId
        startedAt = now.wholeSeconds
        updatedAt = now.wholeSeconds
        step = firstStep
        warmupTries = [:]
        quizTries = [:]
        hintsUsed = []
        exploreSeen = []
        exploreSelected = nil
        tray = []
        playCompleted = false
        isPaused = false
    }

    public func isExpired(now: Date) -> Bool {
        now.timeIntervalSince(updatedAt) > Self.maxIdle
    }

    enum CodingKeys: String, CodingKey {
        case attemptId = "attempt_id"
        case childId = "child_id"
        case lessonId = "lesson_id"
        case startedAt = "started_at"
        case updatedAt = "updated_at"
        case step
        case warmupTries = "warmup_tries"
        case quizTries = "quiz_tries"
        case hintsUsed = "hints_used"
        case exploreSeen = "explore_seen"
        case exploreSelected = "explore_selected"
        case tray
        case playCompleted = "play_completed"
        case isPaused = "is_paused"
    }
}

extension AttemptProgress.Step: Codable {
    enum CodingKeys: String, CodingKey { case name, index }

    public init(from decoder: any Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        switch try c.decode(String.self, forKey: .name) {
        case "warmup": self = .warmup(index: try c.decode(Int.self, forKey: .index))
        case "learn": self = .learn
        case "play": self = .play
        case "quiz": self = .quiz(index: try c.decode(Int.self, forKey: .index))
        case "recap": self = .recap
        case "reward": self = .reward
        case let other:
            throw DecodingError.dataCorruptedError(forKey: .name, in: c, debugDescription: "unknown step \(other)")
        }
    }

    public func encode(to encoder: any Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .warmup(let index):
            try c.encode("warmup", forKey: .name)
            try c.encode(index, forKey: .index)
        case .learn: try c.encode("learn", forKey: .name)
        case .play: try c.encode("play", forKey: .name)
        case .quiz(let index):
            try c.encode("quiz", forKey: .name)
            try c.encode(index, forKey: .index)
        case .recap: try c.encode("recap", forKey: .name)
        case .reward: try c.encode("reward", forKey: .name)
        }
    }
}

/// A finished attempt, kept on the device for SK-022 to send (`lesson_attempts` + `quiz_answers`,
/// B5.3) and for the stars of later attempts (`computeStars` reads the whole history).
public struct AttemptRecord: Codable, Hashable, Sendable {
    public struct Answer: Codable, Hashable, Sendable {
        /// `QuizItem.id`, lower case.
        public var itemId: String
        /// 1-based position in the quiz.
        public var slot: Int
        /// `final_correct` of `scoreItem`.
        public var correct: Bool
        public var points: Int
        /// Every try, in order.
        public var answer: [Try]
        public var hintUsed: Bool
        public var tries: Int

        public init(itemId: String, slot: Int, correct: Bool, points: Int, answer: [Try], hintUsed: Bool, tries: Int) {
            self.itemId = itemId
            self.slot = slot
            self.correct = correct
            self.points = points
            self.answer = answer
            self.hintUsed = hintUsed
            self.tries = tries
        }

        enum CodingKeys: String, CodingKey {
            case itemId = "item_id"
            case slot, correct, points, answer
            case hintUsed = "hint_used"
            case tries
        }
    }

    public var id: UUID
    public var childId: UUID
    public var lessonId: UUID
    /// Version of the topic pack the attempt used (`topics[].version` of the manifest, SK-016);
    /// `nil` when the app played the fixtures.
    public var contentVersion: String?
    public var startedAt: Date
    public var completedAt: Date
    public var score: Int
    public var maxScore: Int
    public var durationS: Int
    public var xp: Int
    /// Stars of the lesson after this attempt (local; the server settles them later).
    public var stars: Int
    /// Calendar date of `completed_at` in the child's time zone (`local_date`), `YYYY-MM-DD`.
    public var localDate: String
    public var answers: [Answer]

    public init(
        id: UUID, childId: UUID, lessonId: UUID, contentVersion: String?, startedAt: Date, completedAt: Date,
        score: Int, maxScore: Int, durationS: Int, xp: Int, stars: Int, localDate: String, answers: [Answer]
    ) {
        self.id = id
        self.childId = childId
        self.lessonId = lessonId
        self.contentVersion = contentVersion
        self.startedAt = startedAt
        self.completedAt = completedAt
        self.score = score
        self.maxScore = maxScore
        self.durationS = durationS
        self.xp = xp
        self.stars = stars
        self.localDate = localDate
        self.answers = answers
    }

    enum CodingKeys: String, CodingKey {
        case id
        case childId = "child_id"
        case lessonId = "lesson_id"
        case contentVersion = "content_version"
        case startedAt = "started_at"
        case completedAt = "completed_at"
        case score
        case maxScore = "max_score"
        case durationS = "duration_s"
        case xp, stars
        case localDate = "local_date"
        case answers
    }
}

/// Files of the lesson attempts in one directory (default `Application Support/lessons/`):
/// `in_progress/<lesson id>.json` for an attempt under way, `history.json` for finished ones.
/// JSON written atomically, dates ISO 8601 (whole seconds). SK-012 decision 2: files, not GRDB.
public struct AttemptStore: Sendable {
    public let directory: URL

    public init(directory: URL) {
        self.directory = directory
    }

    /// The store in the app's Application Support directory.
    public static func applicationSupport() throws -> AttemptStore {
        let base = try FileManager.default.url(
            for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true
        )
        return AttemptStore(directory: base.appendingPathComponent("lessons", isDirectory: true))
    }

    var inProgressDirectory: URL { directory.appendingPathComponent("in_progress", isDirectory: true) }
    var historyURL: URL { directory.appendingPathComponent("history.json") }

    func inProgressURL(lessonId: UUID) -> URL {
        inProgressDirectory.appendingPathComponent(lessonId.uuidString.lowercased() + ".json")
    }

    // MARK: In progress

    /// The attempt under way for this lesson and child; an expired one (`maxIdle`) is deleted
    /// and `nil` comes back. A file that does not read is deleted too (the lesson starts over).
    public func inProgress(lessonId: UUID, childId: UUID, now: Date) -> AttemptProgress? {
        let url = inProgressURL(lessonId: lessonId)
        guard let data = try? Data(contentsOf: url) else { return nil }
        guard let progress = try? Self.decoder.decode(AttemptProgress.self, from: data) else {
            try? FileManager.default.removeItem(at: url)
            return nil
        }
        guard progress.childId == childId, progress.lessonId == lessonId else { return nil }
        if progress.isExpired(now: now) {
            try? FileManager.default.removeItem(at: url)
            return nil
        }
        return progress
    }

    /// Every attempt under way of the child that is not expired (to reopen a cut-off lesson).
    public func allInProgress(childId: UUID, now: Date) -> [AttemptProgress] {
        let files = (try? FileManager.default.contentsOfDirectory(at: inProgressDirectory, includingPropertiesForKeys: nil)) ?? []
        return files
            .filter { $0.pathExtension == "json" }
            .compactMap { url in UUID(uuidString: url.deletingPathExtension().lastPathComponent) }
            .compactMap { inProgress(lessonId: $0, childId: childId, now: now) }
            .sorted { $0.updatedAt > $1.updatedAt }
    }

    public func save(_ progress: AttemptProgress) throws {
        try FileManager.default.createDirectory(at: inProgressDirectory, withIntermediateDirectories: true)
        try Self.encoder.encode(progress).write(to: inProgressURL(lessonId: progress.lessonId), options: [.atomic])
    }

    public func deleteInProgress(lessonId: UUID) {
        try? FileManager.default.removeItem(at: inProgressURL(lessonId: lessonId))
    }

    // MARK: History

    /// Finished attempts, oldest first; empty when there are none.
    ///
    /// A history file that does not decode is renamed `history.json.corrupt-<time>` (log line) and
    /// the history starts empty, so the next `append` never writes over it (SK-012 tester L2).
    public func history(now: Date = Date()) -> [AttemptRecord] {
        guard let data = try? Data(contentsOf: historyURL) else { return [] }
        do {
            return try Self.decoder.decode([AttemptRecord].self, from: data)
        } catch {
            let kept = try? CorruptFile.quarantine(historyURL, now: now)
            Logger(subsystem: Bundle.main.bundleIdentifier ?? "ScienceKids", category: "lesson")
                .error("history.json unreadable, kept as \(kept?.lastPathComponent ?? "-", privacy: .public): \(String(describing: error), privacy: .public)")
            return []
        }
    }

    /// The stars the server settled for finished attempts (SK-022, B7.7): written into their
    /// records quietly. Records not in `stars` are left as they are.
    public func updateStars(_ stars: [UUID: Int]) throws {
        var records = history()
        var changed = false
        for index in records.indices {
            if let settled = stars[records[index].id], settled != records[index].stars {
                records[index].stars = settled
                changed = true
            }
        }
        guard changed else { return }
        try Self.encoder.encode(records).write(to: historyURL, options: [.atomic])
    }

    /// Child ids in the history and in the attempts under way (to find the child of a profile
    /// file that broke).
    public func childIds(now: Date = Date()) -> Set<UUID> {
        var ids = Set(history(now: now).map(\.childId))
        let files = (try? FileManager.default.contentsOfDirectory(at: inProgressDirectory, includingPropertiesForKeys: nil)) ?? []
        for url in files where url.pathExtension == "json" {
            if let data = try? Data(contentsOf: url), let progress = try? Self.decoder.decode(AttemptProgress.self, from: data) {
                ids.insert(progress.childId)
            }
        }
        return ids
    }

    /// Adds a finished attempt; the same attempt id twice is kept once (idempotent, like `submit_attempts`).
    public func append(_ record: AttemptRecord) throws {
        var records = history().filter { $0.id != record.id }
        records.append(record)
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        try Self.encoder.encode(records).write(to: historyURL, options: [.atomic])
    }

    // MARK: JSON

    static var encoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]
        encoder.dateEncodingStrategy = .iso8601
        return encoder
    }

    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}

extension Date {
    /// Cut to whole seconds, so a date written as ISO 8601 reads back equal.
    var wholeSeconds: Date { Date(timeIntervalSince1970: timeIntervalSince1970.rounded(.down)) }
}
