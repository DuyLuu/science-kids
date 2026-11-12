import ContentModel
import Foundation
import Testing
@testable import ContentKit

/// 10/11 (Duy: a topic finished showed no sign of it): `JourneyProgress` and `JourneyStop` read
/// the child's progress over the journey. Four topics built from copies of the fixture lesson:
///
/// - A: lessons 1, 2 written, 3 not written;
/// - B: lesson 1 written;
/// - C: two lessons, none written;
/// - D: lessons 1, 2 written.
@Suite struct JourneyProgressTests {
    static let a1 = UUID(uuidString: "aaaaaaaa-0000-4000-8000-000000000001")!
    static let a2 = UUID(uuidString: "aaaaaaaa-0000-4000-8000-000000000002")!
    static let b1 = UUID(uuidString: "bbbbbbbb-0000-4000-8000-000000000001")!
    static let d1 = UUID(uuidString: "dddddddd-0000-4000-8000-000000000001")!
    static let d2 = UUID(uuidString: "dddddddd-0000-4000-8000-000000000002")!

    static func topics() throws -> [JourneyTopic] {
        func lesson(_ number: Int, _ id: UUID?) throws -> JourneyLesson {
            let written = try id.map { try JourneyTests.copyOfLessonOne(id: $0, order: number) }
            return JourneyLesson(number: number, title: Syllabus.Title(en: "Lesson \(number)", vi: nil), lesson: written)
        }
        func topic(_ key: String, _ number: Int, level: Int?, _ lessons: [JourneyLesson]) -> JourneyTopic {
            JourneyTopic(
                ageGroup: .discoverer, key: key, number: number, title: Syllabus.Title(en: key, vi: nil),
                strand: .earthSky, level: level, content: nil, lessons: lessons
            )
        }
        return [
            topic("a", 1, level: nil, [try lesson(1, a1), try lesson(2, a2), try lesson(3, nil)]),
            topic("b", 2, level: 2, [try lesson(1, b1)]),
            topic("c", 3, level: 3, [try lesson(1, nil), try lesson(2, nil)]),
            topic("d", 4, level: 3, [try lesson(1, d1), try lesson(2, d2)]),
        ]
    }

    /// Nothing played: "Học tiếp" is the first written lesson, the first written topic is current,
    /// every written topic is "0/n", the unwritten one "Sắp có", nothing started.
    @Test func notStarted() throws {
        let journey = JourneyProgress(topics: try Self.topics(), progress: .empty)
        #expect(journey.next?.topic.key == "a")
        #expect(journey.next?.lesson.number == 1)
        #expect(journey.stops.map(\.state) == [.notStarted, .notStarted, .comingSoon, .notStarted])
        #expect(journey.stops.map(\.isCurrent) == [true, false, false, false])
        #expect(journey.stops.map(\.playableCount) == [2, 1, 0, 2], "n counts the written lessons only")
        #expect(journey.stops.map(\.doneCount) == [0, 0, 0, 0])
        #expect(journey.startedCount == 0)
        #expect(journey.hasPlayable)
        #expect(!journey.allDone)
        #expect(journey.stops[0].lessonStates == [.notStarted, .notStarted, .comingSoon])
    }

    /// A: both written lessons done, lesson 3 not written yet, so A is "Đang học · 2/3" (SK-035:
    /// a topic is done once every lesson of the syllabus is); B under way, C nothing written, D
    /// not started. "Học tiếp" skips topic A (nothing left to play there) and points at B's
    /// lesson, the topic of the card is B.
    @Test func doneInProgressNotStartedComingSoon() throws {
        let progress = LessonProgressSnapshot(bestStars: [Self.a1: 2, Self.a2: 1], inProgress: [Self.b1])
        let journey = JourneyProgress(topics: try Self.topics(), progress: progress)
        #expect(journey.stops.map(\.state) == [.inProgress(done: 2, total: 3), .inProgress(done: 0, total: 1), .comingSoon, .notStarted])
        #expect(journey.stops.map(\.isCurrent) == [false, true, false, false])
        #expect(journey.next?.topic.key == "b")
        #expect(journey.next?.lesson.lesson?.id == Self.b1)
        #expect(journey.startedCount == 2, "A done and B under way")
        #expect(journey.stops[0].doneCount == 2 && journey.stops[0].playableCount == 2, "two written lessons done")
        #expect(journey.stops[0].lessonCount == 3, "2/3 bài: lesson 3 unwritten still counts")
        #expect(journey.stops[0].lessonStates == [.done(stars: 2), .done(stars: 1), .comingSoon])
        #expect(journey.stops[0].next == nil)
        #expect(journey.stops[1].lessonStates == [.inProgress])
        #expect(journey.stops[1].state(ofLesson: 1) == .inProgress)
        #expect(journey.stops[2].lessonStates == [.comingSoon, .comingSoon])
    }

    /// A topic partly done ("1/2 bài"): "Học tiếp" stays in it, on the lesson not done, even when
    /// that lesson comes before the one done.
    @Test func continueSkipsFinishedLessons() throws {
        let topics = try Self.topics()
        let secondDone = JourneyProgress(topics: topics, progress: LessonProgressSnapshot(bestStars: [Self.a2: 3]))
        #expect(secondDone.next?.topic.key == "a")
        #expect(secondDone.next?.lesson.number == 1, "lesson 1 not done, before the one done")
        #expect(secondDone.stops[0].state == .inProgress(done: 1, total: 3))
        #expect(secondDone.stops[0].lessonStates == [.notStarted, .done(stars: 3), .comingSoon])

        let firstDone = JourneyProgress(topics: topics, progress: LessonProgressSnapshot(bestStars: [Self.a1: 1]))
        #expect(firstDone.next?.lesson.lesson?.id == Self.a2)
        #expect(Journey.continueTarget(in: topics, progress: LessonProgressSnapshot(bestStars: [Self.a1: 1]))?.lesson.number == 2)
        #expect(Journey.continueTarget(in: topics)?.lesson.number == 1, "no progress: the first written lesson")

        // A and B done: the card goes on to D, past C (nothing written).
        let past = JourneyProgress(topics: topics, progress: LessonProgressSnapshot(bestStars: [Self.a1: 1, Self.a2: 1, Self.b1: 2]))
        #expect(past.next?.topic.key == "d")
        #expect(past.next?.lesson.lesson?.id == Self.d1)
        #expect(past.stops.map(\.isCurrent) == [false, false, false, true])
    }

    /// Every written lesson done: no "Học tiếp", the group is all done, no topic is current. A
    /// still has lesson 3 to write: "Đang học", not "Đã xong".
    @Test func everythingDone() throws {
        let all = LessonProgressSnapshot(bestStars: [Self.a1: 1, Self.a2: 2, Self.b1: 3, Self.d1: 1, Self.d2: 1])
        let journey = JourneyProgress(topics: try Self.topics(), progress: all)
        #expect(journey.next == nil)
        #expect(journey.allDone)
        #expect(journey.stops.map(\.state) == [.inProgress(done: 2, total: 3), .done, .comingSoon, .done])
        #expect(journey.stops.allSatisfy { !$0.isCurrent })
        #expect(journey.startedCount == 3)
    }

    /// A group with nothing written (Explorer today): no card, not "all done", every stop "Sắp có".
    @Test func nothingWritten() throws {
        let unwritten = try Self.topics().filter { $0.key == "c" }
        let journey = JourneyProgress(topics: unwritten, progress: LessonProgressSnapshot(bestStars: [Self.a1: 3]))
        #expect(journey.next == nil)
        #expect(!journey.hasPlayable)
        #expect(!journey.allDone)
        #expect(journey.stops.map(\.state) == [.comingSoon])
        #expect(JourneyProgress(topics: [], progress: .empty).stops.isEmpty)
    }

    /// "Bài xong" is the stars' rule: a star means a completed attempt. A lesson with 0 stars (an
    /// attempt recorded without a result) is not done; a lesson done and started again stays done.
    @Test func doneMeansAtLeastOneStar() throws {
        let progress = LessonProgressSnapshot(bestStars: [Self.a1: 0, Self.a2: 1], inProgress: [Self.a1, Self.a2])
        #expect(!progress.isDone(Self.a1))
        #expect(progress.isInProgress(Self.a1))
        #expect(progress.isDone(Self.a2))
        #expect(!progress.isInProgress(Self.a2), "done wins over a new attempt under way")
        let stop = JourneyStop(topic: try Self.topics()[0], progress: progress)
        #expect(stop.lessonStates == [.inProgress, .done(stars: 1), .comingSoon])
        #expect(stop.state == .inProgress(done: 1, total: 3))
        #expect(stop.next?.number == 1)
        #expect(stop.isStarted)
    }

    /// SK-035 (main session 10/11): a topic is done when every lesson of the syllabus is done.
    /// Writing a new lesson never takes a topic done back: a topic is never done while a lesson
    /// is still to write, and once all are written and done it stays done.
    @Test func topicDoneNeedsEveryLessonOfTheSyllabus() throws {
        let a = try Self.topics()[0]
        let twoDone = LessonProgressSnapshot(bestStars: [Self.a1: 3, Self.a2: 3])
        #expect(JourneyStop(topic: a, progress: twoDone).state == .inProgress(done: 2, total: 3))
        let a3 = UUID()
        var lessons = a.lessons
        lessons[2] = JourneyLesson(number: 3, title: lessons[2].title, lesson: try JourneyTests.copyOfLessonOne(id: a3, order: 3))
        let written = JourneyTopic(
            ageGroup: a.ageGroup, key: a.key, number: a.number, title: a.title, strand: a.strand,
            level: a.level, content: a.content, lessons: lessons
        )
        #expect(JourneyStop(topic: written, progress: twoDone).state == .inProgress(done: 2, total: 3), "lesson 3 written: still 2/3")
        let all = LessonProgressSnapshot(bestStars: [Self.a1: 3, Self.a2: 3, a3: 2])
        #expect(JourneyStop(topic: written, progress: all).state == .done)
    }
}
