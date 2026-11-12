import ContentModel
import Foundation
import Testing
@testable import ContentKit

/// SK-035: what the Thẻ, Từ vựng and Huy hiệu tabs compute from the journey and the child's
/// progress. Topics built from copies of the fixture lesson (8 words, a `food` card):
///
/// - A (own group, humans_health): lessons 1, 2 written with a card, 3 not written;
/// - B (own group, earth_sky): four lessons, none written;
/// - C (own group, earth_sky): lesson 1 written, no card, no words;
/// - D, E (another group): one written lesson each, card set `dinosaurs`.
@Suite struct CollectionTests {
    static let a1 = UUID(uuidString: "aaaaaaaa-0000-4000-8000-0000000000a1")!
    static let a2 = UUID(uuidString: "aaaaaaaa-0000-4000-8000-0000000000a2")!
    static let c1 = UUID(uuidString: "cccccccc-0000-4000-8000-0000000000c1")!
    static let d1 = UUID(uuidString: "dddddddd-0000-4000-8000-0000000000d1")!
    static let e1 = UUID(uuidString: "eeeeeeee-0000-4000-8000-0000000000e1")!

    /// The fixture lesson with another id and order; `set` replaces its card's set, `card: false`
    /// drops the card, `words: false` the vocabulary.
    static func lesson(_ id: UUID, order: Int, set: String? = nil, card: Bool = true, words: Bool = true) throws -> Lesson {
        let url = ContentLibraryTests.fixturesValid.appendingPathComponent("discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json")
        var object = try #require(JSONSerialization.jsonObject(with: Data(contentsOf: url)) as? [String: Any])
        object["id"] = id.uuidString.lowercased()
        object["order"] = order
        var reward = object["reward"] as? [String: Any] ?? [:]
        if !card {
            reward.removeValue(forKey: "collectible")
        } else if let set, var collectible = reward["collectible"] as? [String: Any] {
            collectible["set"] = set
            reward["collectible"] = collectible
        }
        object["reward"] = reward
        if !words { object["vocab"] = [Any]() }
        return try ContentDecoder().decodeLesson(from: JSONSerialization.data(withJSONObject: object))
    }

    static func topic(
        _ key: String, group: Topic.AgeGroup = .discoverer, strand: Topic.Strand, _ lessons: [Lesson?]
    ) -> JourneyTopic {
        JourneyTopic(
            ageGroup: group, key: key, number: 1, title: Syllabus.Title(en: key, vi: nil), strand: strand, level: nil,
            content: nil,
            lessons: lessons.enumerated().map { index, lesson in
                JourneyLesson(number: index + 1, title: Syllabus.Title(en: "Lesson \(index + 1)", vi: nil), lesson: lesson)
            }
        )
    }

    static func own() throws -> [JourneyTopic] {
        [
            topic("a", strand: .humansHealth, [try lesson(a1, order: 1), try lesson(a2, order: 2), nil]),
            topic("b", strand: .earthSky, [nil, nil, nil, nil]),
            topic("c", strand: .earthSky, [try lesson(c1, order: 1, card: false, words: false)]),
        ]
    }

    static func others() throws -> [JourneyTopic] {
        [
            topic("d", group: .scientist, strand: .plantsAnimals, [try lesson(d1, order: 1, set: "dinosaurs")]),
            topic("e", group: .scientist, strand: .plantsAnimals, [try lesson(e1, order: 1, set: "dinosaurs")]),
        ]
    }

    // MARK: Cards

    /// Nothing played: the own group's sets only, every card face down; the unwritten lesson of A
    /// is a card to come in its set; B (nothing written, lessons to write) is a topic to come; C
    /// (written, no card, nothing left to write) is neither.
    @Test func cardsBeforeAnyLesson() throws {
        let cards = CardCollection(own: try Self.own(), others: try Self.others(), progress: .empty)
        #expect(cards.sets.map(\.id) == ["a"], "C has no card, B nothing written, D and E none won")
        #expect(cards.sets[0].set == "food")
        #expect(cards.sets[0].cards.map(\.lessonNumber) == [1, 2])
        #expect(cards.sets[0].cards.map(\.isEarned) == [false, false])
        #expect(cards.sets[0].comingCount == 1)
        #expect(cards.laterTopics == 1, "B only")
        #expect(cards.earnedCount == 0)
        #expect(cards.totalCount == 2)
    }

    /// A card is won when its lesson is done (a star), never while it is only under way; a set of
    /// another group shows once one of its cards is won, after the own group's.
    @Test func cardsWonByFinishedLessons() throws {
        let progress = LessonProgressSnapshot(bestStars: [Self.a2: 1, Self.e1: 3], inProgress: [Self.a1])
        let cards = CardCollection(own: try Self.own(), others: try Self.others(), progress: progress)
        #expect(cards.sets.map(\.id) == ["a", "e"])
        #expect(cards.sets[0].cards.map(\.isEarned) == [false, true], "lesson 1 only under way")
        #expect(cards.sets[1].set == "dinosaurs")
        #expect(cards.sets[1].earnedCount == 1)
        #expect(cards.earnedCount == 2)
        #expect(cards.totalCount == 3)
        #expect(Set(cards.sets.flatMap(\.cards).map(\.id)).count == 3, "one slot per lesson, the same card twice included")
    }

    // MARK: Words

    /// One deck per lesson done that has words, own group first; the distinct words counted once.
    @Test func decksOfTheLessonsDone() throws {
        let progress = LessonProgressSnapshot(bestStars: [Self.e1: 2, Self.a2: 1, Self.c1: 3], inProgress: [Self.a1])
        let decks = WordDecks.of(own: try Self.own(), others: try Self.others(), progress: progress)
        #expect(decks.map(\.id) == [Self.a2, Self.e1], "C has no words, A1 is not done")
        #expect(decks.map(\.lessonNumber) == [2, 1])
        #expect(decks[0].words.count == 8)
        #expect(WordDecks.of(own: try Self.own(), progress: .empty).isEmpty)

        let first = try #require(decks[0].words.first)
        #expect(decks[0].knownCount([first.id]) == 1)
        let count = WordDecks.count(decks, known: [first.id, UUID()])
        #expect(count.total == 8, "the copies share the fixture's word ids")
        #expect(count.known == 1)
    }

    /// A pass: the words not known first, in order; each mark moves on; "Đã nhớ" adds the word to
    /// the known ones, "Ôn lại" takes it out.
    @Test func reviewPutsWordsToPractiseFirst() throws {
        let words = try Self.lesson(Self.a1, order: 1).vocab
        let known: Set<UUID> = [words[0].id, words[2].id]
        var review = WordReview(words: words, known: known)
        #expect(review.words.map(\.key) == ["carbohydrate", "fat", "vitamin", "fibre", "energy", "healthy", "nutrient", "protein"])
        #expect(review.current?.key == "carbohydrate")
        #expect(review.index == 0 && !review.isDone)

        review.mark(.known)
        review.mark(.again)
        #expect(review.index == 2)
        #expect(review.current?.key == "vitamin")
        #expect(review.knownCount == 1 && review.againCount == 1)
        for _ in 2..<words.count { review.mark(.known) }
        #expect(review.isDone)
        #expect(review.current == nil)
        review.mark(.again)
        #expect(review.index == words.count, "nothing after the last word")
        #expect(review.knownCount == 7)

        let added = WordReview.applying(.known, to: words[1], known: known)
        #expect(added == known.union([words[1].id]))
        #expect(WordReview.applying(.again, to: words[0], known: added) == [words[1].id, words[2].id])
        #expect(WordReview(words: words, known: []).words == words, "nothing known: the content's order")
    }

    // MARK: Badges

    /// One badge per known strand with topics in the group, in the strands' order; progress is
    /// topics done over topics of the strand, written or not.
    @Test func badgesByStrand() throws {
        let topics = try Self.own()
        let none = StrandBadge.of(JourneyProgress(topics: topics, progress: .empty))
        #expect(none.map(\.strand) == [.humansHealth, .earthSky], "strands without a topic in the group left out")
        #expect(none.map(\.topicCount) == [1, 2])
        #expect(none.map(\.state) == [.notStarted, .notStarted])

        let started = StrandBadge.of(JourneyProgress(topics: topics, progress: LessonProgressSnapshot(bestStars: [Self.a1: 2])))
        #expect(started[0].state == .started)
        #expect(started[0].doneCount == 0)

        let done = LessonProgressSnapshot(bestStars: [Self.a1: 2, Self.a2: 1, Self.c1: 1])
        let badges = StrandBadge.of(JourneyProgress(topics: topics, progress: done))
        #expect(badges[0].state == .started, "A's two written lessons done, lesson 3 still to write: not done (SK-035)")
        #expect(badges[0].doneCount == 0)
        #expect(badges[1].state == .started, "C done, B has nothing written yet")
        #expect(badges[1].doneCount == 1 && badges[1].topicCount == 2)
        #expect(badges[1].stops.map(\.topic.key) == ["b", "c"])
        let onlyC = StrandBadge.of(JourneyProgress(topics: [topics[2]], progress: done))
        #expect(onlyC.map(\.state) == [.done], "every topic of the strand done, every lesson written")

        // A strand the app does not know: its topics share the last badge.
        let space = Self.topic("space", strand: Topic.Strand(rawValue: "space"), [nil])
        let withOther = StrandBadge.of(JourneyProgress(topics: topics + [space], progress: .empty))
        #expect(withOther.map(\.strand) == [.humansHealth, .earthSky, StrandBadge.otherStrand])
        #expect(withOther.last?.stops.map(\.topic.key) == ["space"])
    }
}
