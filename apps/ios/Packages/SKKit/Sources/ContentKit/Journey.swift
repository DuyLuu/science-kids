import ContentModel
import Foundation

/// A topic on the journey (SK-030): its place in the syllabus, and the content the app has for it.
/// Every topic of the syllabus is here, written or not; none is locked.
public struct JourneyTopic: Sendable, Equatable, Identifiable {
    public let ageGroup: Topic.AgeGroup
    /// Syllabus key (`healthy-eating`), or the content slug of a topic the syllabus does not list.
    /// Unique across the groups: the Topic route uses it.
    public let key: String
    /// Place in the group, 1…n.
    public let number: Int
    /// The content's title when the topic is written, else the syllabus's.
    public let title: Syllabus.Title
    public let strand: Topic.Strand
    /// The content's level when written, else the syllabus's (`nil`: new topic, not rated yet).
    public let level: Int?
    /// The written topic, when the content has it.
    public let content: TopicContent?
    public let lessons: [JourneyLesson]
    /// UK school year of the syllabus's Oak unit; `nil` for a topic of our own (`new-…`) and for a
    /// topic only the content has. SK-034: stages of the journey map (`JourneyProgress.segments`).
    public let oakYear: Int?

    public init(
        ageGroup: Topic.AgeGroup, key: String, number: Int, title: Syllabus.Title, strand: Topic.Strand,
        level: Int?, content: TopicContent?, lessons: [JourneyLesson], oakYear: Int? = nil
    ) {
        self.ageGroup = ageGroup
        self.key = key
        self.number = number
        self.title = title
        self.strand = strand
        self.level = level
        self.content = content
        self.lessons = lessons
        self.oakYear = oakYear
    }

    public var id: String { key }

    /// The first lesson the child can play, in order; `nil` when no lesson of the topic is written.
    public var firstPlayable: JourneyLesson? {
        lessons.first { $0.lesson != nil }
    }

    /// The first written lesson not done (`progress`), in order: where "Học tiếp" goes in this
    /// topic; `nil` when every written lesson is done or none is written.
    public func nextLesson(_ progress: LessonProgressSnapshot) -> JourneyLesson? {
        lessons.first { lesson in
            guard let id = lesson.lesson?.id else { return false }
            return !progress.isDone(id)
        }
    }

    /// Distinct vocabulary terms of the written lessons ("Từ vựng chủ đề · n từ").
    public var wordCount: Int {
        Set(lessons.compactMap(\.lesson).flatMap { $0.vocab.map(\.key) }).count
    }
}

/// A lesson on a journey topic: its number and title, and the lesson itself when written.
public struct JourneyLesson: Sendable, Equatable, Identifiable {
    /// Place in the topic, 1…n.
    public let number: Int
    /// The content's title when written, else the syllabus's.
    public let title: Syllabus.Title
    /// The written lesson; `nil`: "Chưa có nội dung".
    public let lesson: Lesson?

    public init(number: Int, title: Syllabus.Title, lesson: Lesson?) {
        self.number = number
        self.title = title
        self.lesson = lesson
    }

    public var id: Int { number }
}

/// Lays the content over the syllabus (SK-030). Pure: no I/O.
///
/// - The syllabus gives the topics of a group by `number`, and the lessons of each topic by
///   `number`. A topic with `topic_id` takes that topic of the library; a lesson with `lesson_id`
///   takes that lesson of its topic. An id the content does not have leaves the slot unwritten.
/// - Content the syllabus does not list is not hidden: a written lesson of a listed topic comes
///   after the topic's syllabus lessons; a written topic of the group comes after the syllabus
///   topics, with its lessons in `lesson.order`. Without a syllabus (`nil`) the journey is the
///   library's topics alone.
public enum Journey {
    public static func topics(
        for ageGroup: Topic.AgeGroup, syllabus: Syllabus?, library: ContentLibrary
    ) -> [JourneyTopic] {
        var journey: [JourneyTopic] = []
        var listed = Set<UUID>()
        for entry in syllabus?.topics(for: ageGroup) ?? [] {
            let content = entry.topicId.flatMap(library.topic(id:))
            if let id = content?.id { listed.insert(id) }
            journey.append(topic(entry, ageGroup: ageGroup, content: content))
        }
        for content in library.topics(for: ageGroup) where !listed.contains(content.id) {
            journey.append(JourneyTopic(
                ageGroup: ageGroup, key: content.topic.slug, number: journey.count + 1,
                title: Syllabus.Title(content.topic.title), strand: content.topic.strand, level: content.topic.level,
                content: content, lessons: unlisted(content.lessons, after: 0)
            ))
        }
        return journey
    }

    /// The journeys of every known age group.
    public static func all(syllabus: Syllabus?, library: ContentLibrary) -> [Topic.AgeGroup: [JourneyTopic]] {
        var journeys: [Topic.AgeGroup: [JourneyTopic]] = [:]
        for group in Topic.AgeGroup.known {
            journeys[group] = topics(for: group, syllabus: syllabus, library: library)
        }
        return journeys
    }

    /// What the "Học tiếp" card points at: the first written lesson not done (`progress`), in
    /// journey order; `nil` when every written lesson is done or none is written. With no progress
    /// it is the first written lesson.
    public static func continueTarget(
        in topics: [JourneyTopic], progress: LessonProgressSnapshot = .empty
    ) -> (topic: JourneyTopic, lesson: JourneyLesson)? {
        for topic in topics {
            if let lesson = topic.nextLesson(progress) { return (topic, lesson) }
        }
        return nil
    }

    private static func topic(_ entry: Syllabus.TopicEntry, ageGroup: Topic.AgeGroup, content: TopicContent?) -> JourneyTopic {
        var lessons: [JourneyLesson] = []
        var used = Set<UUID>()
        for lesson in entry.lessons.sorted(by: { $0.number < $1.number }) {
            let written = lesson.lessonId.flatMap { id in content?.lessons.first { $0.id == id } }
            if let id = written?.id { used.insert(id) }
            lessons.append(JourneyLesson(
                number: lesson.number,
                title: written.map { Syllabus.Title($0.title) } ?? lesson.title,
                lesson: written
            ))
        }
        let extra = content?.lessons.filter { !used.contains($0.id) } ?? []
        lessons += unlisted(extra, after: lessons.map(\.number).max() ?? 0)
        return JourneyTopic(
            ageGroup: ageGroup, key: entry.key, number: entry.number,
            title: content.map { Syllabus.Title($0.topic.title) } ?? entry.title,
            strand: content?.topic.strand ?? entry.strand,
            level: content?.topic.level ?? entry.level,
            content: content, lessons: lessons, oakYear: entry.oakYear
        )
    }

    /// Written lessons the syllabus does not list, numbered on from `after`.
    private static func unlisted(_ lessons: [Lesson], after: Int) -> [JourneyLesson] {
        lessons.enumerated().map { index, lesson in
            JourneyLesson(number: after + index + 1, title: Syllabus.Title(lesson.title), lesson: lesson)
        }
    }
}
