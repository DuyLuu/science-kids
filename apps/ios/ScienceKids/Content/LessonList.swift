import ContentKit
import ContentModel
import Foundation

/// One line of the lesson list on the Topic screen (canvas Discoverer 5).
struct LessonSlot: Equatable, Identifiable {
    /// 1-based place in the topic.
    let number: Int
    /// The lesson, when the content has it; `nil` for a planned lesson not written yet.
    let lesson: Lesson?
    /// The child can start it. Until progress is kept (SK-012), only the first lesson is open.
    let isOpen: Bool

    var id: Int { number }

    /// The lesson that has to be finished first ("Mở sau bài n").
    var unlocksAfter: Int? { isOpen ? nil : number - 1 }
}

enum LessonList {
    /// The lessons of a topic in order, padded with planned lessons up to `count`.
    /// Lesson 1 is open; every later lesson is locked behind the one before it.
    ///
    /// TODO(SK-012): open lesson n + 1 once lesson n is passed (stored progress).
    static func slots(for topic: TopicContent, count: Int) -> [LessonSlot] {
        let total = max(count, topic.lessons.count)
        return (0..<total).map { index in
            LessonSlot(
                number: index + 1,
                lesson: index < topic.lessons.count ? topic.lessons[index] : nil,
                isOpen: index == 0 && !topic.lessons.isEmpty
            )
        }
    }

    /// What the "Học tiếp" card on Home points at: the first open lesson of the first topic that
    /// has one, in journey order.
    static func continueTarget(in topics: [TopicContent]) -> (topic: TopicContent, slot: LessonSlot, lesson: Lesson)? {
        for topic in topics {
            let slots = slots(for: topic, count: BundledContent.lessonCount(of: topic))
            if let slot = slots.first(where: \.isOpen), let lesson = slot.lesson {
                return (topic, slot, lesson)
            }
        }
        return nil
    }

    /// Distinct vocabulary terms of the lessons the topic has ("Từ vựng chủ đề · n từ").
    static func wordCount(of topic: TopicContent) -> Int {
        Set(topic.lessons.flatMap { $0.vocab.map(\.key) }).count
    }
}
