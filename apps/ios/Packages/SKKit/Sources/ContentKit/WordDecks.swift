import ContentModel
import Foundation

/// The words of one lesson the child has done (SK-035, canvas `Discoverer-Words`): a set of
/// flashcards, English word on the front, its meaning and example on the back.
public struct WordDeck: Sendable, Equatable, Identifiable {
    public let topic: JourneyTopic
    /// Place of the lesson in its topic ("Bài 1").
    public let lessonNumber: Int
    public let lesson: Lesson

    public var id: UUID { lesson.id }

    /// `lesson.vocab`, in the content's order.
    public var words: [VocabTerm] { lesson.vocab }

    public init(topic: JourneyTopic, lessonNumber: Int, lesson: Lesson) {
        self.topic = topic
        self.lessonNumber = lessonNumber
        self.lesson = lesson
    }

    /// Words of the deck in `known` (ids of `VocabTerm`).
    public func knownCount(_ known: Set<UUID>) -> Int {
        words.filter { known.contains($0.id) }.count
    }
}

/// Từ vựng (SK-035): one deck per lesson done. Pure: no I/O.
public enum WordDecks {
    /// The decks of the lessons done (`progress.isDone`) that have words: the child's own age
    /// group first, in journey order, then the other groups' (the child can play any group).
    public static func of(own: [JourneyTopic], others: [JourneyTopic] = [], progress: LessonProgressSnapshot) -> [WordDeck] {
        (own + others).flatMap { topic in
            topic.lessons.compactMap { item -> WordDeck? in
                guard let lesson = item.lesson, progress.isDone(lesson.id), !lesson.vocab.isEmpty else { return nil }
                return WordDeck(topic: topic, lessonNumber: item.number, lesson: lesson)
            }
        }
    }

    /// Distinct words of `decks`, and how many of them are in `known` ("12/20 từ").
    public static func count(_ decks: [WordDeck], known: Set<UUID>) -> (known: Int, total: Int) {
        let ids = Set(decks.flatMap { $0.words.map(\.id) })
        return (ids.intersection(known).count, ids.count)
    }
}

/// One pass through a deck (SK-035): each word once, the child says "Đã nhớ" or "Ôn lại".
///
/// No spaced repetition (out of scope): the words not known yet come first, in the content's
/// order, then the known ones; that is all "ôn lại sau" does. Pure value; the app saves each
/// mark (`known` set per child) as it is made.
public struct WordReview: Sendable, Equatable {
    public enum Mark: Sendable, Equatable {
        /// "Đã nhớ": the word joins the known words.
        case known
        /// "Ôn lại": the word leaves the known words, it comes first next time.
        case again
    }

    /// The words in the order of this pass.
    public let words: [VocabTerm]
    /// One mark per word passed, in order.
    public private(set) var marks: [Mark] = []

    /// A pass over `words`, the ones not in `known` first.
    public init(words: [VocabTerm], known: Set<UUID>) {
        self.words = words.filter { !known.contains($0.id) } + words.filter { known.contains($0.id) }
    }

    /// Index of the word shown (`words.count` once done).
    public var index: Int { marks.count }

    /// The word shown; `nil` once every word is marked.
    public var current: VocabTerm? { index < words.count ? words[index] : nil }

    public var isDone: Bool { index >= words.count }

    /// Words marked "Đã nhớ" in this pass.
    public var knownCount: Int { marks.filter { $0 == .known }.count }

    /// Words marked "Ôn lại" in this pass.
    public var againCount: Int { marks.filter { $0 == .again }.count }

    /// Marks the word shown and moves on; nothing once done.
    public mutating func mark(_ mark: Mark) {
        guard !isDone else { return }
        marks.append(mark)
    }

    /// `known` after `mark` on `word`.
    public static func applying(_ mark: Mark, to word: VocabTerm, known: Set<UUID>) -> Set<UUID> {
        var next = known
        switch mark {
        case .known: next.insert(word.id)
        case .again: next.remove(word.id)
        }
        return next
    }
}
