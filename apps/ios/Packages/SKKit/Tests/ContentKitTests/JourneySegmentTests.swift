import ContentModel
import Foundation
import Testing
@testable import ContentKit

/// SK-034: the stages of the journey map ("Chặng n": topics next to each other with the same Oak
/// year) and the 0–3 stars of a topic (Duy 10/11: the mean of its lessons' stars, rounded down).
@Suite struct JourneySegmentTests {
    /// The real syllabus: Discoverer 1–5 (new topics), 6–11 (Year 3), 12–17 (Year 4); Explorer
    /// 1–6 (Year 1), 7–12 (Year 2); Scientist 1–3 (new), 4–9 (Year 5), 10–16 (Year 6).
    @Test func stagesOfTheSyllabus() throws {
        let syllabus = try JourneyTests.syllabus()
        func stages(_ group: Topic.AgeGroup) -> [JourneySegment] {
            JourneyProgress(topics: Journey.topics(for: group, syllabus: syllabus, library: .empty), progress: .empty).segments
        }
        let discoverer = stages(.discoverer)
        #expect(discoverer.map(\.stopRange) == [0..<5, 5..<11, 11..<17])
        #expect(discoverer.map(\.oakYear) == [nil, 3, 4])
        #expect(discoverer.map(\.number) == [1, 2, 3])
        #expect(discoverer.map(\.topicCount) == [5, 6, 6])
        let explorer = stages(.explorer)
        #expect(explorer.map(\.stopRange) == [0..<6, 6..<12])
        #expect(explorer.map(\.oakYear) == [1, 2])
        let scientist = stages(.scientist)
        #expect(scientist.map(\.stopRange) == [0..<3, 3..<9, 9..<16])
        #expect(scientist.map(\.oakYear) == [nil, 5, 6])
    }

    /// The year of each topic comes from the syllabus (`source.year`); a topic only the content
    /// has gets none and joins the stage of the topics of our own next to it.
    @Test func yearOfEachTopic() throws {
        let topics = Journey.topics(for: .discoverer, syllabus: try JourneyTests.syllabus(), library: JourneyTests.fixtures())
        #expect(topics.first { $0.key == "new-earth-surface" }?.oakYear == nil)
        #expect(topics.first { $0.key == "healthy-eating" }?.oakYear == 3)
        #expect(topics.first { $0.key == "more-about-food-chains" }?.oakYear == 4)
        #expect(Journey.topics(for: .discoverer, syllabus: nil, library: JourneyTests.fixtures()).allSatisfy { $0.oakYear == nil })
    }

    /// Stages count the topics done in them; a journey with no topic has no stage. Years that
    /// come back after another year start a new stage.
    @Test func doneCountAndBreaks() throws {
        let base = try JourneyProgressTests.topics()
        func withYear(_ topic: JourneyTopic, _ year: Int?) -> JourneyTopic {
            JourneyTopic(
                ageGroup: topic.ageGroup, key: topic.key, number: topic.number, title: topic.title, strand: topic.strand,
                level: topic.level, content: topic.content, lessons: topic.lessons, oakYear: year
            )
        }
        // a, b: Year 3; c: Year 4; d: Year 3 again.
        let topics = [withYear(base[0], 3), withYear(base[1], 3), withYear(base[2], 4), withYear(base[3], 3)]
        // A's two written lessons done, but its lesson 3 is not written: A is not done (SK-035).
        let progress = LessonProgressSnapshot(bestStars: [
            JourneyProgressTests.a1: 3, JourneyProgressTests.a2: 2, JourneyProgressTests.b1: 2,
            JourneyProgressTests.d1: 1, JourneyProgressTests.d2: 1,
        ])
        let journey = JourneyProgress(topics: topics, progress: progress)
        let segments = journey.segments
        #expect(segments.map(\.stopRange) == [0..<2, 2..<3, 3..<4])
        #expect(segments.map(\.doneCount) == [1, 0, 1], "B and D done, A not")
        #expect(journey.doneTopicCount == 2)
        #expect(JourneyProgress(topics: [], progress: .empty).segments.isEmpty)
    }

    /// Stars of a topic: the mean of its written lessons' best stars, rounded down; a lesson not
    /// done counts 0; nothing written, 0.
    @Test func topicStarsRoundDown() throws {
        let topics = try JourneyProgressTests.topics()
        func stars(_ best: [UUID: Int], topic index: Int = 0) -> Int {
            JourneyStop(topic: topics[index], progress: LessonProgressSnapshot(bestStars: best)).stars
        }
        let a1 = JourneyProgressTests.a1, a2 = JourneyProgressTests.a2
        #expect(stars([a1: 3, a2: 3]) == 3)
        #expect(stars([a1: 3, a2: 2]) == 2, "2.5 → 2")
        #expect(stars([a1: 2, a2: 1]) == 1, "1.5 → 1")
        #expect(stars([a1: 1, a2: 1]) == 1)
        #expect(stars([a1: 1]) == 0, "lesson 2 not done counts 0: 0.5 → 0")
        #expect(stars([:]) == 0)
        #expect(stars([a1: 3], topic: 2) == 0, "nothing written")
        #expect(stars([JourneyProgressTests.b1: 3], topic: 1) == 3)
        // Five lessons 3, 3, 3, 3, 2 (the canvas's dinosaurs): 2.8 → 2.
        let five = try (1...5).map { number in
            JourneyLesson(
                number: number, title: Syllabus.Title(en: "L\(number)", vi: nil),
                lesson: try JourneyTests.copyOfLessonOne(id: UUID(), order: number)
            )
        }
        let dinosaurs = JourneyTopic(
            ageGroup: .discoverer, key: "new-dinosaurs", number: 2, title: Syllabus.Title(en: "Dinosaurs", vi: nil),
            strand: .earthSky, level: 4, content: nil, lessons: five
        )
        let best = Dictionary(uniqueKeysWithValues: five.enumerated().map { ($0.element.lesson!.id, $0.offset == 4 ? 2 : 3) })
        let stop = JourneyStop(topic: dinosaurs, progress: LessonProgressSnapshot(bestStars: best))
        #expect(stop.state == .done)
        #expect(stop.stars == 2)
    }
}
