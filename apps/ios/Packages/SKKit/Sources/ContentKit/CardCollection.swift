import ContentModel
import Foundation

/// One card of the collection (SK-035, canvas `Discoverer-Cards`): the `reward.collectible` of a
/// written lesson, won or not.
public struct CardSlot: Sendable, Equatable, Identifiable {
    /// Place of the lesson in its topic ("Bài 2"): where a card not won yet comes from.
    public let lessonNumber: Int
    public let lessonId: UUID
    public let collectible: Collectible
    /// Won: the lesson was finished once. The rule of the Thưởng screen, which shows the card of
    /// every finished lesson (`LessonProgressSnapshot.isDone`: a completed attempt has a star).
    public let isEarned: Bool

    /// The lesson's id: two lessons never share a slot, even with the same card.
    public var id: UUID { lessonId }

    public init(lessonNumber: Int, lessonId: UUID, collectible: Collectible, isEarned: Bool) {
        self.lessonNumber = lessonNumber
        self.lessonId = lessonId
        self.collectible = collectible
        self.isEarned = isEarned
    }
}

/// The cards of one topic: one set per topic with a written lesson that has a card.
public struct CardSet: Sendable, Equatable, Identifiable {
    public let topic: JourneyTopic
    /// `collectible.set` of the topic's cards (the first card's when they differ): the app names
    /// the set from it (`collectible.set.<set>`).
    public let set: String
    /// The written lessons' cards, in lesson order.
    public let cards: [CardSlot]
    /// Lessons of the topic not written yet ("+N thẻ ở các bài sau"): the lessons of a topic that
    /// has cards each bring one so far.
    public let comingCount: Int

    public var id: String { topic.key }

    public var earnedCount: Int { cards.filter(\.isEarned).count }

    public init(topic: JourneyTopic, set: String, cards: [CardSlot], comingCount: Int) {
        self.topic = topic
        self.set = set
        self.cards = cards
        self.comingCount = comingCount
    }
}

/// Bộ thẻ (SK-035): every card of the written lessons, by topic, won or not. Pure: no I/O.
///
/// - The sets of the child's own age group come first, in journey order; a set of another group
///   (the child can play any group, SK-030) shows only once one of its cards is won, so a card
///   won never disappears.
/// - A written lesson without a card has no slot. A topic with no card has no set.
/// - Nothing is per topic: a new topic with cards in the pack is a new set.
public struct CardCollection: Sendable, Equatable {
    public let sets: [CardSet]
    /// Topics of the own group with no set yet that still have lessons to write: each may bring
    /// its own set ("Còn N chủ đề nữa…"). Topics, not cards (tester 10/11 #14): a lesson not
    /// written yet may come without a card, so the app does not promise a number of cards.
    public let laterTopics: Int

    /// `own`: the journey of the child's age group; `others`: the journeys of the other groups.
    public init(own: [JourneyTopic], others: [JourneyTopic] = [], progress: LessonProgressSnapshot) {
        let ownSets = own.compactMap { Self.set(of: $0, progress: progress) }
        let withSet = Set(ownSets.map(\.id))
        sets = ownSets + others.compactMap { Self.set(of: $0, progress: progress) }.filter { $0.earnedCount > 0 }
        // A topic written without any card counts too, as long as lessons are left to write
        // (tester 10/11 #13): it was in no number before.
        laterTopics = own.filter { topic in
            !withSet.contains(topic.key) && topic.lessons.contains { $0.lesson == nil }
        }.count
    }

    /// Cards won, in every set shown.
    public var earnedCount: Int { sets.reduce(0) { $0 + $1.earnedCount } }

    /// Cards of the written lessons, in every set shown ("3/12 thẻ").
    public var totalCount: Int { sets.reduce(0) { $0 + $1.cards.count } }

    private static func set(of topic: JourneyTopic, progress: LessonProgressSnapshot) -> CardSet? {
        let cards = topic.lessons.compactMap { item -> CardSlot? in
            guard let lesson = item.lesson, let card = lesson.reward.collectible else { return nil }
            return CardSlot(lessonNumber: item.number, lessonId: lesson.id, collectible: card, isEarned: progress.isDone(lesson.id))
        }
        guard let first = cards.first else { return nil }
        let coming = topic.lessons.filter { $0.lesson == nil }.count
        return CardSet(topic: topic, set: first.collectible.set, cards: cards, comingCount: coming)
    }
}
