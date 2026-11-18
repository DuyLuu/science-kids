import ContentKit
import ContentModel
import DesignSystem
import Foundation
import Testing
import UIKit
@testable import ScienceKids

/// SK-034, app side of the journey map: the topic icons in the asset catalog, the icon picked for
/// a topic, the items of the map for each group, the seals stamped once.
@MainActor
@Suite struct JourneyMapAppTests {
    /// The 45 icons of the designer are in the catalog as `Topic-<key>`, one for every topic of the
    /// bundled syllabus (no more "•••" on the journey).
    @Test func everySyllabusTopicHasItsIcon() throws {
        let content = BundledContent.fixtures()
        let topics = Topic.AgeGroup.known.flatMap { content.journey(for: $0) }
        #expect(topics.count == 45)
        for topic in topics {
            #expect(UIImage(named: TopicIcon.assetName(key: topic.key)) != nil, "Topic-\(topic.key)")
            #expect(TopicIcon.name(key: topic.key, strand: topic.strand) == "Topic-\(topic.key)", "\(topic.key) uses its own icon")
        }
        for name in TopicIcon.strandIcons.values {
            #expect(UIImage(named: TopicIcon.assetName(key: name)) != nil, "strand icon \(name)")
        }
    }

    /// The icon of a topic: its own when the catalog has it, else its strand's, else none.
    @Test func iconFallsBackToTheStrand() {
        let catalog: Set<String> = ["Topic-new-dinosaurs", "Topic-healthy-eating", "Topic-earth-sun-and-moon"]
        let exists = { (name: String) in catalog.contains(name) }
        #expect(TopicIcon.name(key: "new-dinosaurs", strand: .earthSky, exists: exists) == "Topic-new-dinosaurs")
        #expect(TopicIcon.name(key: "a-topic-only-the-content-has", strand: .humansHealth, exists: exists) == "Topic-healthy-eating")
        #expect(TopicIcon.name(key: "another", strand: .earthSky, exists: exists) == "Topic-earth-sun-and-moon")
        #expect(TopicIcon.name(key: "another", strand: .materials, exists: exists) == nil, "strand icon missing")
        #expect(TopicIcon.name(key: "another", strand: Topic.Strand(rawValue: "future"), exists: exists) == nil, "unknown strand")
        #expect(TopicIcon.strandIcons.count == Topic.Strand.known.count)
    }

    /// The map of each group: a post per stage then its topics, the flag at the end; ids unique,
    /// topics in journey order. Discoverer 3 stages (5 + 6 + 6), Explorer 5 (1 + 2 + 2 + 3 + 4), Scientist 3.
    @Test func mapItemsOfEachGroup() throws {
        let content = BundledContent.fixtures()
        func entries(_ group: Topic.AgeGroup) -> [JourneyMapEntry] {
            JourneyMapEntry.entries(JourneyProgress(topics: content.journey(for: group), progress: .empty))
        }
        let discoverer = entries(.discoverer)
        #expect(discoverer.count == 3 + 17 + 1)
        #expect(discoverer.map(\.index) == Array(0..<21))
        #expect(Set(discoverer.map(\.id)).count == 21)
        let posts: [Int] = discoverer.enumerated().compactMap { offset, entry in
            if case .milestone = entry.kind { return offset }
            return nil
        }
        #expect(posts == [0, 6, 13])
        if case .flag(let topics, let done) = try #require(discoverer.last).kind {
            #expect(topics == 17 && done == 0)
        } else {
            Issue.record("the map ends on the flag")
        }
        let keys: [String] = discoverer.compactMap { entry in
            if case .stop(let stop, _) = entry.kind { return stop.topic.key }
            return nil
        }
        #expect(keys == content.journey(for: .discoverer).map(\.key))
        // On a new profile the first written topic is the one of "Học tiếp" (the fixtures: #9).
        let current: [String] = discoverer.compactMap { entry in
            if case .stop(let stop, _) = entry.kind, stop.isCurrent { return stop.topic.key }
            return nil
        }
        let firstWritten = content.journey(for: .discoverer).first { $0.firstPlayable != nil }?.key
        #expect(firstWritten != nil)
        #expect(current == [firstWritten].compactMap { $0 })
        // Explorer since SK-050 (Duy 17/11): five stages (Year 1, 2, new, 1, 2), 12 stops, the flag.
        #expect(entries(.explorer).count == 5 + 12 + 1)
        #expect(entries(.scientist).count == 3 + 16 + 1)
        #expect(JourneyMapEntry.entries(JourneyProgress(topics: [], progress: .empty)).isEmpty)
        // Laid out on a 390 phone, the map is the canvas's 2430 tall (rows at their minimum).
        let map = JourneyMapGeometry.layout(discoverer.map(\.item), width: 390)
        #expect(map.size.height == 2430)
    }

    /// A topic's seal is stamped in only the first time Home shows it done: nothing at the first
    /// look (launch), a topic done since then once, and not again after Home has shown it.
    @Test func sealStampsOnce() throws {
        let app = AppModel(store: nil, library: .empty)
        let a1 = UUID(), a2 = UUID(), b1 = UUID()
        func topic(_ key: String, _ number: Int, _ ids: [UUID]) throws -> JourneyTopic {
            let lessons = try ids.enumerated().map { index, id in
                JourneyLesson(
                    number: index + 1, title: Syllabus.Title(en: "Lesson \(index + 1)", vi: nil),
                    lesson: try JourneyProgressAppTests.copyOfLessonOne(id: id)
                )
            }
            return JourneyTopic(
                ageGroup: .discoverer, key: key, number: number, title: Syllabus.Title(en: key, vi: nil),
                strand: .earthSky, level: 3, content: nil, lessons: lessons
            )
        }
        let topics = [try topic("a", 1, [a1, a2]), try topic("b", 2, [b1])]
        let aDone = JourneyProgress(topics: topics, progress: LessonProgressSnapshot(bestStars: [a1: 3, a2: 3]))
        #expect(app.freshlyDoneTopics(in: aDone).isEmpty, "first look: what is done is taken as seen")
        let bDone = JourneyProgress(topics: topics, progress: LessonProgressSnapshot(bestStars: [a1: 3, a2: 3, b1: 2]))
        #expect(app.freshlyDoneTopics(in: bDone) == ["b"], "B done since")
        #expect(app.freshlyDoneTopics(in: bDone) == ["b"], "stable until Home leaves")
        app.markDoneShown(bDone)
        #expect(app.freshlyDoneTopics(in: bDone).isEmpty)
    }
}
