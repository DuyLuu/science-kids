import ContentModel
import Foundation

/// What one child has done on the lessons, by lesson id: the input of `JourneyProgress`. The app
/// builds it from the lesson history on the device (SK-012, `lessons/history.json`), the stars the
/// server settled (SK-022) and the attempts under way (`lessons/in_progress/`). Pure value.
public struct LessonProgressSnapshot: Sendable, Equatable {
    /// Best stars of each lesson played (0–3).
    public var bestStars: [UUID: Int]
    /// Lessons with an attempt under way (started, not finished, not expired).
    public var inProgress: Set<UUID>

    public init(bestStars: [UUID: Int] = [:], inProgress: Set<UUID> = []) {
        self.bestStars = bestStars
        self.inProgress = inProgress
    }

    /// Nothing played yet.
    public static let empty = LessonProgressSnapshot()

    /// Best stars of the lesson; 0 when never finished.
    public func stars(of lessonId: UUID) -> Int {
        bestStars[lessonId] ?? 0
    }

    /// "Bài xong": the lesson has at least one star, that is at least one completed attempt
    /// (B4.4, `computeStars`: ⭐ once an attempt is completed, whatever the score). The same rule
    /// as the stars; a later attempt never undoes it (stars come from the whole history).
    public func isDone(_ lessonId: UUID) -> Bool {
        stars(of: lessonId) >= 1
    }

    /// Started but not done: an attempt is under way and none has been completed yet.
    public func isInProgress(_ lessonId: UUID) -> Bool {
        !isDone(lessonId) && inProgress.contains(lessonId)
    }
}

/// Where the child stands on one lesson of a journey topic (the Topic screen's rows).
public enum JourneyLessonState: Sendable, Equatable {
    /// Finished at least once; its best stars (1–3).
    case done(stars: Int)
    /// An attempt under way, none finished ("Đang học").
    case inProgress
    /// Written, never started.
    case notStarted
    /// Not written yet ("Chưa có nội dung").
    case comingSoon
}

/// One topic of the journey with the child's progress on it (Home's stops, the Topic screen). The
/// state is all a drawing needs: the list of rows today, the road map of the designer later
/// (`design/play-ui/journey-roadmap-spec.md`) only changes how it is drawn.
public struct JourneyStop: Sendable, Equatable, Identifiable {
    public enum State: Sendable, Equatable {
        /// Every lesson of the topic is done ("Đã xong"): every lesson of the syllabus, so the
        /// topic is done only once nothing is left to write (SK-035, main session 10/11: writing
        /// more lessons never takes a topic done back to "Đang học").
        case done
        /// A lesson done or under way, not all: `done` of `total` lessons of the topic (the
        /// syllabus's, written or not).
        case inProgress(done: Int, total: Int)
        /// Written lessons, none done or started.
        case notStarted
        /// No written lesson ("Sắp có").
        case comingSoon
    }

    public let topic: JourneyTopic
    public let state: State
    /// State of each lesson, in `topic.lessons` order.
    public let lessonStates: [JourneyLessonState]
    /// The first written lesson not done, in order: where "Học tiếp" goes in this topic. `nil`
    /// when every written lesson is done or none is written.
    public let next: JourneyLesson?
    /// Lessons done ("x" of "x/n bài").
    public let doneCount: Int
    /// Written lessons, the ones the child can play (the squares; "Sắp có" when 0).
    public let playableCount: Int
    /// Lessons of the topic, written or not ("n" of "x/n bài", SK-035): the syllabus's count.
    public var lessonCount: Int { topic.lessons.count }
    /// The topic of the "Học tiếp" card: the one shown as being learnt on the journey.
    public let isCurrent: Bool

    public var id: String { topic.key }

    public init(topic: JourneyTopic, progress: LessonProgressSnapshot, isCurrent: Bool = false) {
        self.topic = topic
        self.isCurrent = isCurrent
        let states = topic.lessons.map { Self.state(of: $0, progress: progress) }
        lessonStates = states
        next = topic.nextLesson(progress)
        let playable = topic.lessons.filter { $0.lesson != nil }.count
        let done = states.filter { if case .done = $0 { true } else { false } }.count
        let started = states.contains(.inProgress)
        playableCount = playable
        doneCount = done
        state = if playable == 0 {
            .comingSoon
        } else if done == topic.lessons.count {
            .done
        } else if done > 0 || started {
            .inProgress(done: done, total: topic.lessons.count)
        } else {
            .notStarted
        }
    }

    /// State of one lesson of the topic.
    public static func state(of lesson: JourneyLesson, progress: LessonProgressSnapshot) -> JourneyLessonState {
        guard let id = lesson.lesson?.id else { return .comingSoon }
        if progress.isDone(id) { return .done(stars: progress.stars(of: id)) }
        if progress.isInProgress(id) { return .inProgress }
        return .notStarted
    }

    /// State of the lesson numbered `number` (`.comingSoon` for a number the topic does not have).
    public func state(ofLesson number: Int) -> JourneyLessonState {
        guard let index = topic.lessons.firstIndex(where: { $0.number == number }) else { return .comingSoon }
        return lessonStates[index]
    }

    /// The topic was started: a lesson done or under way.
    public var isStarted: Bool {
        switch state {
        case .done, .inProgress: true
        case .notStarted, .comingSoon: false
        }
    }

    /// Stars of the topic on the journey map, 0–3 (Duy 10/11, SK-034): the mean of the best
    /// stars of the lessons, rounded down; a lesson not done counts 0. Only for showing (the map
    /// draws them on a topic done, where every lesson is written); no server rule behind it. 0
    /// when nothing is written.
    public var stars: Int {
        guard playableCount > 0 else { return 0 }
        let total = lessonStates.reduce(0) { sum, state in
            if case .done(let stars) = state { return sum + min(max(stars, 0), 3) }
            return sum
        }
        return total / playableCount
    }
}

/// A stage of the journey map (SK-034, "Chặng n"): topics next to each other on the journey with
/// the same Oak year (every topic of our own, `oakYear == nil`, next to each other is one stage).
/// Discoverer: 1–5 (new topics), 6–11 (Year 3), 12–17 (Year 4). Pure value.
public struct JourneySegment: Sendable, Equatable, Identifiable {
    /// 1…n along the journey.
    public let number: Int
    /// The Oak year of its topics; `nil` for the topics of our own. Not shown (Duy 10/11: "Chặng 1,
    /// 2, 3", no Year).
    public let oakYear: Int?
    /// Indices of its topics in `JourneyProgress.stops`.
    public let stopRange: Range<Int>
    /// Topics done (`JourneyStop.State.done`).
    public let doneCount: Int

    public var id: Int { number }

    /// Topics in the stage.
    public var topicCount: Int { stopRange.count }

    /// Stages of `stops`, in order.
    public static func of(_ stops: [JourneyStop]) -> [JourneySegment] {
        var segments: [JourneySegment] = []
        var start = 0
        while start < stops.count {
            let year = stops[start].topic.oakYear
            var end = start + 1
            while end < stops.count, stops[end].topic.oakYear == year { end += 1 }
            let done = stops[start..<end].filter { $0.state == .done }.count
            segments.append(JourneySegment(number: segments.count + 1, oakYear: year, stopRange: start..<end, doneCount: done))
            start = end
        }
        return segments
    }
}

/// The journey of one age group with the child's progress: Home's stops, its "Học tiếp" card and
/// the count of started topics. Pure: no I/O.
public struct JourneyProgress: Sendable, Equatable {
    /// "Học tiếp": the first written lesson not done, in journey order.
    public struct Next: Sendable, Equatable {
        public let topic: JourneyTopic
        public let lesson: JourneyLesson
    }

    public let stops: [JourneyStop]
    /// `nil` when every written lesson is done, or none is written.
    public let next: Next?

    public init(topics: [JourneyTopic], progress: LessonProgressSnapshot) {
        let target = Journey.continueTarget(in: topics, progress: progress)
        next = target.map { Next(topic: $0.topic, lesson: $0.lesson) }
        stops = topics.map { JourneyStop(topic: $0, progress: progress, isCurrent: $0.key == target?.topic.key) }
    }

    /// The group has lessons to play.
    public var hasPlayable: Bool {
        stops.contains { $0.playableCount > 0 }
    }

    /// Every written lesson of the group is done: the card says so instead of "Học tiếp".
    public var allDone: Bool {
        hasPlayable && next == nil
    }

    /// Topics with a lesson done or under way ("17 chủ đề · 3 đã bắt đầu").
    public var startedCount: Int {
        stops.filter(\.isStarted).count
    }

    /// Topics done ("Về đích · 17 chủ đề · 1 đã xong", SK-034).
    public var doneTopicCount: Int {
        stops.filter { $0.state == .done }.count
    }

    /// The stages of the journey map (SK-034).
    public var segments: [JourneySegment] {
        JourneySegment.of(stops)
    }
}
