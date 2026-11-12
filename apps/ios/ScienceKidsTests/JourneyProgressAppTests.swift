import ContentKit
import ContentModel
import DesignSystem
import Foundation
import LessonPlayer
import Profiles
import Sync
import Testing
@testable import ScienceKids

/// 10/11, app side of the journey progress: what the app reads (lesson history, server stars,
/// attempts under way) and what Home and Topic get from it.
@MainActor
@Suite struct JourneyProgressAppTests {
    static let child = SyncAppTests.child
    static let lessonOne = BundledContentTests.lessonOne

    /// Best stars per lesson from the child's own records and the server's, the higher of the two;
    /// another child's records and attempts are left out.
    @Test func snapshotFromHistoryServerAndAttemptsUnderWay() {
        let x = UUID(), y = UUID(), z = UUID(), w = UUID()
        let other = UUID()
        let history = [
            SyncAppTests.record(day: "2026-11-02", stars: 1, lesson: x),
            SyncAppTests.record(day: "2026-11-04", stars: 2, lesson: x),
            SyncAppTests.record(day: "2026-11-04", stars: 3, child: other, lesson: y),
        ]
        let server = [
            LessonProgress(childId: Self.child, lessonId: x, stars: 1),
            LessonProgress(childId: Self.child, lessonId: z, stars: 2),
            LessonProgress(childId: other, lessonId: w, stars: 3),
        ]
        let now = Date()
        let underWay = [
            AttemptProgress(childId: Self.child, lessonId: w, now: now, firstStep: .learn),
            AttemptProgress(childId: other, lessonId: y, now: now, firstStep: .learn),
        ]
        let snapshot = LessonProgressSnapshot.of(childId: Self.child, history: history, inProgress: underWay, server: server)
        #expect(snapshot.bestStars == [x: 2, z: 2])
        #expect(snapshot.inProgress == [w])
        #expect(snapshot.isDone(x) && snapshot.isDone(z))
        #expect(!snapshot.isDone(y), "another child's lesson")
        #expect(snapshot.isInProgress(w))
        #expect(LessonProgressSnapshot.of(childId: Self.child, history: [], inProgress: [], server: nil) == .empty)
    }

    /// The Home and Topic squares: one per written lesson, a lesson done out of order ticked, the
    /// topic's "Học tiếp" lesson vàng hoè.
    @Test func squaresFollowTheLessonsDone() throws {
        let topic = try #require(BundledContent.fixtures().journey(for: .discoverer).first { $0.key == "healthy-eating" })
        let lesson = try #require(topic.lessons[1].lesson)
        let meal = try Self.copyOfLessonOne(id: BundledContentTests.mealLesson)
        var lessons = topic.lessons
        lessons[5] = JourneyLesson(number: 6, title: lessons[5].title, lesson: meal)
        let two = JourneyTopic(
            ageGroup: topic.ageGroup, key: topic.key, number: topic.number, title: topic.title, strand: topic.strand,
            level: topic.level, content: topic.content, lessons: lessons
        )
        #expect(JourneyStop(topic: two, progress: .empty).squareStates == [.current, .upcoming])
        let mealDone = JourneyStop(topic: two, progress: LessonProgressSnapshot(bestStars: [meal.id: 2]))
        #expect(mealDone.squareStates == [.current, .done], "lesson 6 done, lesson 2 still next")
        let both = JourneyStop(topic: two, progress: LessonProgressSnapshot(bestStars: [lesson.id: 1, meal.id: 2]))
        #expect(both.squareStates == [.done, .done])
        #expect(both.state == .inProgress(done: 2, total: 10), "SK-035: 8 lessons of the syllabus still to write, not done")
    }

    /// The bundled fixture lesson with another id (the meal lesson is not a fixture).
    static func copyOfLessonOne(id: UUID) throws -> Lesson {
        let root = try #require(Bundle.main.url(forResource: BundledContent.folderName, withExtension: nil))
        let url = root.appendingPathComponent("discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json")
        var object = try #require(JSONSerialization.jsonObject(with: Data(contentsOf: url)) as? [String: Any])
        object["id"] = id.uuidString.lowercased()
        return try ContentDecoder().decodeLesson(from: JSONSerialization.data(withJSONObject: object))
    }

    /// The app reads the child's files: a lesson under way makes its topic "Đang học 0/10"; once
    /// finished, nothing else is written in the fixtures, so Home says all done instead of "Học
    /// tiếp", but the topic stays "Đang học 1/10" (SK-035: 9 lessons of the syllabus still to come).
    /// Another child's history changes nothing.
    @Test func appModelReadsTheChildsLessons() throws {
        let dir = FileManager.default.temporaryDirectory.appendingPathComponent("JourneyProgressAppTests-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: dir) }
        let store = ProfileStore(directory: dir)
        let attempts = AttemptStore(directory: dir.appendingPathComponent("lessons"))
        let profile = try AppModelTests.minh()
        try store.save(profile)
        let fixtures = BundledContent.fixtures()
        let model = AppModel(store: store, library: fixtures.library, syllabus: fixtures.syllabus, attempts: attempts)

        let fresh = model.journeyProgress(for: .discoverer, profile: profile)
        #expect(fresh.stops.count == 17)
        #expect(fresh.next?.lesson.lesson?.id == Self.lessonOne)
        #expect(fresh.startedCount == 0)
        let healthyIndex = try #require(fresh.stops.firstIndex { $0.topic.key == "healthy-eating" })
        #expect(fresh.stops[healthyIndex].state == .notStarted)
        #expect(fresh.stops[healthyIndex].isCurrent)

        try attempts.append(SyncAppTests.record(day: "2026-11-09", stars: 3, child: UUID(), lesson: Self.lessonOne))
        try attempts.save(AttemptProgress(childId: profile.id, lessonId: Self.lessonOne, now: Date(), firstStep: .learn))
        model.lessonClosed()
        let underWay = model.journeyProgress(for: .discoverer, profile: profile)
        #expect(underWay.stops[healthyIndex].state == .inProgress(done: 0, total: 10), "SK-035: every lesson of the syllabus counts")
        #expect(underWay.next?.lesson.lesson?.id == Self.lessonOne, "still the lesson to go on with")
        #expect(underWay.startedCount == 1)

        attempts.deleteInProgress(lessonId: Self.lessonOne)
        try attempts.append(SyncAppTests.record(day: "2026-11-10", stars: 1, child: profile.id, lesson: Self.lessonOne))
        model.lessonClosed()
        let done = model.journeyProgress(for: .discoverer, profile: profile)
        #expect(done.stops[healthyIndex].state == .inProgress(done: 1, total: 10), "its only written lesson done: not done yet (SK-035)")
        #expect(done.stops[healthyIndex].lessonStates[1] == .done(stars: 1))
        #expect(done.next == nil)
        #expect(done.allDone)
        #expect(done.startedCount == 1)
        #expect(model.journeyProgress(for: .explorer, profile: profile).allDone == false, "nothing written for Explorer")
    }
}
