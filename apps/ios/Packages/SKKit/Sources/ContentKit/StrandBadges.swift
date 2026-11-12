import ContentModel
import Foundation

/// A badge of the Huy hiệu tab (SK-035): one per strand of the syllabus (syllabus-progression.md
/// section 4, "huy hiệu theo 6 mạch"), shown as the strand's big question. Its progress is the
/// topics of that strand done (`JourneyStop.State.done`, the journey's "Đã xong": every lesson of
/// the syllabus done) over the topics of that strand in the child's age group, written or not.
public struct StrandBadge: Sendable, Equatable, Identifiable {
    public enum State: Sendable, Equatable {
        /// No topic of the strand started.
        case notStarted
        /// A topic started or done, not all of them done.
        case started
        /// Every topic of the strand done.
        case done
    }

    public let strand: Topic.Strand
    /// The strand's topics, in journey order.
    public let stops: [JourneyStop]

    public var id: String { strand.rawValue }

    public var topicCount: Int { stops.count }

    public var doneCount: Int { stops.filter { $0.state == .done }.count }

    public var state: State {
        if topicCount > 0, doneCount == topicCount { return .done }
        return stops.contains(where: \.isStarted) ? .started : .notStarted
    }

    public init(strand: Topic.Strand, stops: [JourneyStop]) {
        self.strand = strand
        self.stops = stops
    }

    /// The strand of the badge that gathers topics of strands the app does not know yet.
    public static let otherStrand = Topic.Strand(rawValue: "other")

    /// The badges of a journey: the six known strands in their order (`Topic.Strand.known`), a
    /// strand with no topic in the group left out (Explorer has no "Năng lượng & lực"). Topics of
    /// strands the app does not know share one last badge (`otherStrand`, "Khoa học"), so every
    /// topic counts somewhere (tester 10/11 #12).
    public static func of(_ journey: JourneyProgress) -> [StrandBadge] {
        var badges = Topic.Strand.known.compactMap { strand in
            let stops = journey.stops.filter { $0.topic.strand == strand }
            return stops.isEmpty ? nil : StrandBadge(strand: strand, stops: stops)
        }
        let others = journey.stops.filter { !$0.topic.strand.isKnown }
        if !others.isEmpty { badges.append(StrandBadge(strand: otherStrand, stops: others)) }
        return badges
    }
}
