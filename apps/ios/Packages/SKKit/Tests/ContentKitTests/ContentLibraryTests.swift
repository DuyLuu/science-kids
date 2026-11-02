import ContentModel
import Foundation
import Testing
@testable import ContentKit

/// SK-011: `LocalContentLibrary` on the repo fixtures (read through `#filePath`, no copy in
/// apps/ios) and on a temporary folder with files it must leave out.
@Suite struct ContentLibraryTests {
    static let fixturesValid: URL = {
        var dir = URL(fileURLWithPath: #filePath).deletingLastPathComponent()
        while dir.path != "/" {
            let candidate = dir.appendingPathComponent("packages/content-schema/fixtures/valid")
            if FileManager.default.fileExists(atPath: candidate.path) { return candidate }
            dir.deleteLastPathComponent()
        }
        fatalError("packages/content-schema/fixtures/valid not found above \(#filePath)")
    }()

    static let topicID = UUID(uuidString: "d3a514ef-02cd-4386-a358-f01e425a10f8")!
    static let lessonID = UUID(uuidString: "4b11eb40-9a47-4e5e-b4b5-bea60264ded3")!

    @Test func loadsTheFixtures() throws {
        let (library, skipped) = LocalContentLibrary.load(from: Self.fixturesValid)
        #expect(skipped.isEmpty, "\(skipped)")
        let discoverer = library.topics(for: .discoverer)
        #expect(discoverer.count == 1)
        let topic = try #require(discoverer.first)
        #expect(topic.topic.id == Self.topicID)
        #expect(topic.topic.title.vi == "Ăn uống lành mạnh")
        #expect(topic.topic.question?.en == "What should we eat to stay healthy?")
        #expect(topic.topic.level == 2)
        #expect(topic.lessons.map(\.id) == [Self.lessonID])
        #expect(topic.lessons.first?.title.vi == "Thức ăn cho ta những gì?")
        #expect(library.topics(for: .explorer).isEmpty)
        #expect(library.topic(id: Self.topicID)?.id == Self.topicID)
        #expect(library.lesson(id: Self.lessonID)?.lesson.estMinutes == 8)
        #expect(library.lesson(id: UUID()) == nil)
    }

    /// Bad, orphan, archived and sensitive files are left out with a reason; nothing crashes.
    @Test func leavesOutWhatItCannotShow() throws {
        let dir = FileManager.default.temporaryDirectory.appendingPathComponent("ContentLibraryTests-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: dir) }
        let topicDir = dir.appendingPathComponent("discoverer/an-uong-lanh-manh")
        try FileManager.default.createDirectory(at: topicDir, withIntermediateDirectories: true)
        let fixtureTopic = Self.fixturesValid.appendingPathComponent("discoverer/an-uong-lanh-manh/topic.json")
        let fixtureLesson = Self.fixturesValid.appendingPathComponent("discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json")

        try FileManager.default.copyItem(at: fixtureTopic, to: topicDir.appendingPathComponent("topic.json"))
        try FileManager.default.copyItem(at: fixtureLesson, to: topicDir.appendingPathComponent("01.json"))
        // A lesson of an unknown topic.
        var orphan = try Self.object(fixtureLesson)
        orphan["id"] = "11111111-1111-4111-8111-111111111111"
        orphan["topic_id"] = "22222222-2222-4222-8222-222222222222"
        try Self.write(orphan, to: topicDir.appendingPathComponent("02-orphan.json"))
        // An archived lesson of the known topic.
        var archived = try Self.object(fixtureLesson)
        archived["id"] = "33333333-3333-4333-8333-333333333333"
        archived["order"] = 3
        archived["archived"] = true
        try Self.write(archived, to: topicDir.appendingPathComponent("03-archived.json"))
        // A lesson missing its title, and a file that is not JSON.
        var broken = try Self.object(fixtureLesson)
        broken.removeValue(forKey: "title")
        try Self.write(broken, to: topicDir.appendingPathComponent("04-broken.json"))
        try Data("not json".utf8).write(to: topicDir.appendingPathComponent("05-text.json"))
        // A sensitive topic.
        var sensitive = try Self.object(fixtureTopic)
        sensitive["id"] = "44444444-4444-4444-8444-444444444444"
        sensitive["slug"] = "nhay-cam"
        sensitive["sensitive"] = true
        try Self.write(sensitive, to: dir.appendingPathComponent("sensitive-topic.json"))

        let (library, skipped) = LocalContentLibrary.load(from: dir)
        #expect(library.topics.map(\.id) == [Self.topicID])
        #expect(library.topics.first?.lessons.map(\.id) == [Self.lessonID])
        let reasons = Dictionary(uniqueKeysWithValues: skipped.map { ($0.file, $0.reason) })
        #expect(reasons["discoverer/an-uong-lanh-manh/02-orphan.json"]?.contains("has no topic") == true)
        #expect(reasons["discoverer/an-uong-lanh-manh/03-archived.json"] == "lesson archived")
        #expect(reasons["discoverer/an-uong-lanh-manh/04-broken.json"]?.contains("/title") == true)
        #expect(reasons["discoverer/an-uong-lanh-manh/05-text.json"]?.contains("not a JSON object") == true)
        #expect(reasons["nhay-cam"] == "topic sensitive")
        #expect(skipped.count == 5)
    }

    @Test func missingFolderGivesAnEmptyLibrary() {
        let (library, skipped) = LocalContentLibrary.load(from: URL(fileURLWithPath: "/nonexistent-\(UUID().uuidString)"))
        #expect(library == .empty)
        #expect(skipped.isEmpty)
    }

    static func object(_ url: URL) throws -> [String: Any] {
        try #require(try JSONSerialization.jsonObject(with: Data(contentsOf: url)) as? [String: Any])
    }

    static func write(_ object: [String: Any], to url: URL) throws {
        try JSONSerialization.data(withJSONObject: object).write(to: url)
    }
}
