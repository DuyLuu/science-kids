import Foundation
import Testing
@testable import ContentModel

/// SK-030: `content/syllabus.json`, read straight from the repo (`#filePath`, no copy in apps/ios),
/// decodes into `Syllabus` with the counts of the approved syllabus (syllabus.md sections 3–5).
@Suite struct SyllabusTests {
    static let fileURL: URL = {
        var dir = URL(fileURLWithPath: #filePath).deletingLastPathComponent()
        while dir.path != "/" {
            let candidate = dir.appendingPathComponent("content/syllabus.json")
            if FileManager.default.fileExists(atPath: candidate.path) { return candidate }
            dir.deleteLastPathComponent()
        }
        fatalError("content/syllabus.json not found above \(#filePath)")
    }()

    static func syllabus() throws -> Syllabus {
        try Syllabus.decode(from: Data(contentsOf: fileURL))
    }

    @Test func decodesTheApprovedSyllabus() throws {
        let syllabus = try Self.syllabus()
        #expect(syllabus.schemaVersion == 1)
        #expect(!syllabus.syllabusVersion.isEmpty)
        #expect(syllabus.groups.map(\.ageGroup) == [.explorer, .discoverer, .scientist])
        #expect(syllabus.groups.map(\.topics.count) == [12, 17, 16])
        #expect(syllabus.groups.map { $0.topics.reduce(0) { $0 + $1.lessons.count } } == [73, 155, 156])
        #expect(syllabus.groups.flatMap(\.topics).allSatisfy { $0.strand.isKnown })
    }

    /// Numbers run 1…n in each group and each topic; keys are unique; every title has its English.
    @Test func numbersAndKeys() throws {
        let syllabus = try Self.syllabus()
        let keys = syllabus.groups.flatMap(\.topics).map(\.key)
        #expect(Set(keys).count == keys.count, "duplicate topic keys")
        for group in syllabus.groups {
            #expect(group.topics.map(\.number) == Array(1..<group.topics.count + 1), "\(group.ageGroup.rawValue)")
            for topic in group.topics {
                #expect(!topic.title.en.isEmpty && topic.title.vi?.isEmpty == false, "\(topic.key)")
                #expect(topic.lessons.map(\.number) == Array(1..<topic.lessons.count + 1), "\(topic.key)")
                #expect(topic.lessons.allSatisfy { !$0.title.en.isEmpty }, "\(topic.key)")
            }
        }
    }

    /// SK-034: the Oak year of each topic (`source.year`), `nil` for the topics of our own; it
    /// splits the journey map into stages. Encoding writes it back under `source`.
    @Test func oakYearOfEachTopic() throws {
        let syllabus = try Self.syllabus()
        #expect(syllabus.topics(for: .discoverer).map(\.oakYear) == [nil, nil, nil, nil, nil, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4])
        #expect(syllabus.topics(for: .explorer).map(\.oakYear) == Array(repeating: 1, count: 6) + Array(repeating: 2, count: 6))
        #expect(syllabus.topics(for: .scientist).prefix(3).allSatisfy { $0.oakYear == nil })
        let topic = try #require(syllabus.topics(for: .discoverer).first { $0.key == "healthy-eating" })
        let again = try JSONDecoder().decode(Syllabus.TopicEntry.self, from: JSONEncoder().encode(topic))
        #expect(again == topic)
    }

    /// Ăn uống lành mạnh is Discoverer #9 with its topic id; the two written lessons sit at 2 and 6.
    @Test func healthyEatingCarriesTheWrittenLessons() throws {
        let topics = try Self.syllabus().topics(for: .discoverer)
        let topic = try #require(topics.first { $0.key == "healthy-eating" })
        #expect(topic.number == 9)
        #expect(topic.topicId == UUID(uuidString: "d3a514ef-02cd-4386-a358-f01e425a10f8"))
        #expect(topic.title.vi == "Ăn uống lành mạnh")
        #expect(topic.lessons.count == 10)
        let written = topic.lessons.filter { $0.lessonId != nil }
        #expect(written.map(\.number) == [2, 6])
        #expect(written.map(\.lessonId) == [
            UUID(uuidString: "4b11eb40-9a47-4e5e-b4b5-bea60264ded3"),
            UUID(uuidString: "23603940-87a2-435b-bf7d-c6c18f79e349"),
        ])
        // More topics get written over time; a lesson id only ever sits in a topic that has its id.
        #expect(topics.allSatisfy { $0.topicId != nil || $0.lessons.allSatisfy { $0.lessonId == nil } })
    }

    /// The loose parts: `vi: null`, no `level`, no ids, unknown fields and an unknown age group.
    @Test func readsLoosely() throws {
        let json = """
        {"schema_version": 1, "syllabus_version": "2026-11-09", "ai_draft": true, "source": "x",
         "groups": [{"age_group": "future", "oak_years": [7], "topics": [
           {"key": "new-x", "number": 1, "title": {"en": "X", "vi": "Ích"}, "strand": "earth_sky",
            "level": null, "source": {"kind": "new"},
            "lessons": [{"number": 1, "title": {"en": "One", "vi": null}, "oak_lessons": [], "statutory": false}]}
         ]}]}
        """
        let syllabus = try Syllabus.decode(from: Data(json.utf8))
        let topic = try #require(syllabus.topics(for: Topic.AgeGroup(rawValue: "future")).first)
        #expect(topic.level == nil)
        #expect(topic.topicId == nil)
        #expect(topic.lessons.first?.title == Syllabus.Title(en: "One", vi: nil))
        #expect(topic.lessons.first?.sensitive == false)
        #expect(topic.lessons.first?.statutory == false)
        #expect(syllabus.topics(for: .explorer).isEmpty)
    }

    /// A missing required field fails with its JSON pointer, like the content files.
    @Test func badFileSaysWhere() {
        let json = #"{"schema_version": 1, "syllabus_version": "v", "groups": [{"age_group": "explorer", "topics": [{"key": "k", "number": 1, "strand": "materials", "lessons": []}]}]}"#
        #expect(throws: ContentDecodingError(path: "/groups/0/topics/0/title", message: "missing required field")) {
            try Syllabus.decode(from: Data(json.utf8))
        }
    }
}
