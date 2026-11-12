import ContentModel
import Foundation
import Testing
@testable import ContentKit

/// SK-030: `Journey` lays the content over the syllabus. The real `content/syllabus.json` and the
/// schema fixtures (lesson 1 of Ăn uống lành mạnh only) are read from the repo through `#filePath`.
@Suite struct JourneyTests {
    static let syllabusURL: URL = {
        var dir = URL(fileURLWithPath: #filePath).deletingLastPathComponent()
        while dir.path != "/" {
            let candidate = dir.appendingPathComponent("content/syllabus.json")
            if FileManager.default.fileExists(atPath: candidate.path) { return candidate }
            dir.deleteLastPathComponent()
        }
        fatalError("content/syllabus.json not found above \(#filePath)")
    }()

    static let topicID = ContentLibraryTests.topicID
    static let lessonOne = ContentLibraryTests.lessonID
    static let mealLesson = UUID(uuidString: "23603940-87a2-435b-bf7d-c6c18f79e349")!

    static func syllabus() throws -> Syllabus {
        try Syllabus.decode(from: Data(contentsOf: syllabusURL))
    }

    static func fixtures() -> ContentLibrary {
        LocalContentLibrary.load(from: ContentLibraryTests.fixturesValid).library
    }

    /// Every topic of every group, by number; nothing hidden.
    @Test func everyTopicOfTheSyllabus() throws {
        let journeys = Journey.all(syllabus: try Self.syllabus(), library: Self.fixtures())
        #expect(journeys[.explorer]?.count == 12)
        #expect(journeys[.discoverer]?.count == 17)
        #expect(journeys[.scientist]?.count == 16)
        #expect(journeys.values.flatMap { $0 }.reduce(0) { $0 + $1.lessons.count } == 384)
        for (group, topics) in journeys {
            #expect(topics.map(\.number) == Array(1..<topics.count + 1), "\(group.rawValue)")
            #expect(topics.allSatisfy { $0.ageGroup == group })
        }
    }

    /// Discoverer #9 takes the written topic; lesson 2 is the written lesson with its content
    /// title; lesson 6 points at a lesson the fixtures do not have, so it stays unwritten.
    @Test func healthyEatingWithTheFixtures() throws {
        let topics = Journey.topics(for: .discoverer, syllabus: try Self.syllabus(), library: Self.fixtures())
        let topic = try #require(topics.first { $0.key == "healthy-eating" })
        #expect(topic.number == 9)
        #expect(topic.content?.id == Self.topicID)
        #expect(topic.title == Syllabus.Title(en: "Healthy eating", vi: "Ăn uống lành mạnh"))
        #expect(topic.level == 2, "the content's level")
        #expect(topic.lessons.map(\.number) == Array(1...10))
        #expect(topic.lessons.compactMap(\.lesson).map(\.id) == [Self.lessonOne])
        let two = topic.lessons[1]
        #expect(two.lesson?.id == Self.lessonOne)
        #expect(two.title == Syllabus.Title(en: "What does food give us?", vi: "Thức ăn cho ta những gì?"), "the content's title")
        #expect(topic.lessons[5].lesson == nil, "the meal lesson is not in the fixtures")
        #expect(topic.lessons[5].title.en == "Nutrient-rich meal", "the syllabus title")
        #expect(topic.firstPlayable?.number == 2)
        #expect(topic.wordCount == 8)
        // Every other topic has no content and nothing to play.
        #expect(topics.filter { $0.content != nil }.map(\.key) == ["healthy-eating"])
        #expect(topics.filter { $0.key != "healthy-eating" }.allSatisfy { $0.firstPlayable == nil && $0.wordCount == 0 })
    }

    /// With both lessons written (as in the pack), 2 and 6 are playable and nothing is appended.
    @Test func bothWrittenLessonsTakeTheirSlots() throws {
        let fixtures = Self.fixtures()
        let topic = try #require(fixtures.topic(id: Self.topicID))
        let one = try #require(topic.lessons.first)
        let meal = try Self.copyOfLessonOne(id: Self.mealLesson, order: 2)
        let library = ContentLibrary(topics: [TopicContent(topic: topic.topic, lessons: [one, meal])])
        let journey = Journey.topics(for: .discoverer, syllabus: try Self.syllabus(), library: library)
        let healthy = try #require(journey.first { $0.key == "healthy-eating" })
        #expect(healthy.lessons.count == 10)
        #expect(healthy.lessons.filter { $0.lesson != nil }.map(\.number) == [2, 6])
        #expect(journey.count == 17)
    }

    @Test func continueTargetIsTheFirstWrittenLesson() throws {
        let topics = Journey.topics(for: .discoverer, syllabus: try Self.syllabus(), library: Self.fixtures())
        let target = try #require(Journey.continueTarget(in: topics))
        #expect(target.topic.key == "healthy-eating")
        #expect(target.lesson.number == 2)
        #expect(target.lesson.lesson?.estMinutes == 8)
        #expect(Journey.continueTarget(in: Journey.topics(for: .explorer, syllabus: try Self.syllabus(), library: Self.fixtures())) == nil)
        #expect(Journey.continueTarget(in: []) == nil)
    }

    /// Untranslated lesson titles stay `vi: nil` (the app shows `en`). Since every Discoverer
    /// topic was rated (content/syllabus.json, 12/11), each has a level 1–5 (SK-040 lượt 2: was
    /// "new topics have no level").
    @Test func syllabusTitlesAndLevels() throws {
        let topics = Journey.topics(for: .discoverer, syllabus: try Self.syllabus(), library: .empty)
        let first = try #require(topics.first)
        #expect(first.content == nil)
        #expect(first.lessons.allSatisfy { $0.lesson == nil })
        #expect(topics.allSatisfy { ($0.level.map { (1...5).contains($0) }) ?? false }, "every Discoverer topic has a level 1–5")
        #expect(topics.flatMap(\.lessons).allSatisfy { !$0.title.en.isEmpty })
    }

    /// Without a syllabus the journey is the library alone, numbered in order.
    @Test func noSyllabusShowsTheContent() throws {
        let topics = Journey.topics(for: .discoverer, syllabus: nil, library: Self.fixtures())
        #expect(topics.map(\.key) == ["an-uong-lanh-manh"])
        #expect(topics.first?.number == 1)
        #expect(topics.first?.lessons.map(\.number) == [1])
        #expect(topics.first?.lessons.first?.lesson?.id == Self.lessonOne)
        #expect(Journey.topics(for: .explorer, syllabus: nil, library: Self.fixtures()).isEmpty)
    }

    /// Content the syllabus does not list is not hidden: an unlisted lesson comes after the
    /// topic's lessons, an unlisted topic after the group's topics. A lesson id the content does
    /// not have leaves its slot unwritten.
    @Test func unlistedContentComesLast() throws {
        let fixtures = Self.fixtures()
        let title = Syllabus.Title(en: "A", vi: nil)
        let listed = Syllabus(syllabusVersion: "test", groups: [
            Syllabus.Group(ageGroup: .discoverer, topics: [
                Syllabus.TopicEntry(key: "b", number: 2, title: title, strand: .materials, level: nil, lessons: []),
                Syllabus.TopicEntry(key: "a", number: 1, title: title, strand: .humansHealth, level: 1, topicId: Self.topicID, lessons: [
                    Syllabus.LessonEntry(number: 2, title: title, lessonId: UUID()),
                    Syllabus.LessonEntry(number: 1, title: title),
                ]),
            ]),
        ])
        let topics = Journey.topics(for: .discoverer, syllabus: listed, library: fixtures)
        #expect(topics.map(\.key) == ["a", "b"], "by number")
        let a = try #require(topics.first)
        #expect(a.lessons.map(\.number) == [1, 2, 3])
        #expect(a.lessons[0].lesson == nil && a.lessons[1].lesson == nil, "unknown lesson id: unwritten")
        #expect(a.lessons[2].lesson?.id == Self.lessonOne, "the unlisted written lesson, after")
        #expect(a.level == 2, "the content's level wins")

        let unlisted = Syllabus(syllabusVersion: "test", groups: [
            Syllabus.Group(ageGroup: .discoverer, topics: [
                Syllabus.TopicEntry(key: "only", number: 1, title: title, strand: .materials, level: 3, lessons: [
                    Syllabus.LessonEntry(number: 1, title: title),
                ]),
            ]),
        ])
        let withExtra = Journey.topics(for: .discoverer, syllabus: unlisted, library: fixtures)
        #expect(withExtra.map(\.key) == ["only", "an-uong-lanh-manh"])
        #expect(withExtra.map(\.number) == [1, 2])
        #expect(withExtra.last?.lessons.first?.lesson?.id == Self.lessonOne)
    }

    /// The fixture lesson with another id and order (the meal lesson is not a fixture).
    static func copyOfLessonOne(id: UUID, order: Int) throws -> Lesson {
        let url = ContentLibraryTests.fixturesValid.appendingPathComponent("discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json")
        var object = try #require(JSONSerialization.jsonObject(with: Data(contentsOf: url)) as? [String: Any])
        object["id"] = id.uuidString.lowercased()
        object["order"] = order
        return try ContentDecoder().decodeLesson(from: JSONSerialization.data(withJSONObject: object))
    }
}
