import Foundation
import SwiftUI

/// Geometry of the journey map (SK-034, `design/play-ui/journey-roadmap-spec.md` sections 4, 6, 7, 9).
/// Pure: from the list of items (stage posts, topic stops, finish flag), the map width and the
/// measured height of each item, it gives the frame of every item, the point the road passes
/// through, the scenery beside the road and the lesson ring of a stop. The app's map `Layout`
/// places its rows with `layout(...)` and draws the road through the same points, so one test
/// covers both.
///
/// Two drawings:
/// - `.winding` (A, Duy 10/11): stops left and right of the road in turn (x = 70 and W − 70), the
///   posts and the flag in the middle; text beside the disc, towards the middle;
/// - `.trail` (B): every stop near the left edge (x = 52 / 66), the text always on the right. The
///   app uses it from the accessibility text sizes on (spec 6, Dynamic Type).
public enum JourneyMapGeometry {
    public enum Style: Sendable, Equatable {
        /// Phương án A: the winding road.
        case winding
        /// Phương án B: the trail along the left edge.
        case trail
    }

    /// One item of the map, in reading order.
    public enum Item: Sendable, Equatable {
        /// The post of a stage ("Chặng n").
        case milestone
        /// A topic; `isCurrent`: the topic of "Học tiếp" (larger disc).
        case stop(isCurrent: Bool)
        /// The finish flag ("Về đích").
        case flag
    }

    /// Where the road passes through an item, from its frame.
    public enum Mark: Sendable, Equatable {
        /// The centre of a stop's disc of `diameter`, on the leading or trailing end of its row.
        case disc(leading: Bool, diameter: CGFloat)
        /// The foot point of a post (`postPoint` in its box).
        case milestone
        /// The foot of the flag's pole (`flagPoint` in its box).
        case flag
    }

    /// An item laid out on the map.
    public struct Placement: Sendable, Equatable {
        public let item: Item
        /// Place among the stops (0…), `nil` for posts and the flag.
        public let stopIndex: Int?
        /// The frame of the item's view (a stop: the whole row, disc and text).
        public let frame: CGRect
        /// Where the road passes: the disc centre, the post's foot, the flag's foot.
        public let point: CGPoint
        public let mark: Mark
    }

    /// The whole map: one placement per item, and the size of the map.
    public struct Map: Sendable, Equatable {
        public let placements: [Placement]
        public let size: CGSize

        public static let empty = Map(placements: [], size: .zero)

        /// The road's points, in order.
        public var roadPoints: [CGPoint] { placements.map(\.point) }
    }

    // MARK: Constants (spec 6 and 7)

    /// The box of a post (34 × 46) and its foot point in the box: the canvas draws the post with
    /// its top 26 above the point (`svg top = y − 26`).
    public static let postSize = CGSize(width: 34, height: 46)
    public static let postPoint = CGPoint(x: 17, y: 26)
    /// The box of the flag (44 × 56) and the foot of its pole in the box (`left = x − 10`, `top = y − 46`).
    public static let flagSize = CGSize(width: 44, height: 56)
    public static let flagPoint = CGPoint(x: 10, y: 46)
    /// Gap from the post box to its text (text at x = W/2 + 27, A), from the flag box to its text (x + 45).
    public static let postTextGap: CGFloat = 10
    public static let flagTextGap: CGFloat = 11
    /// Text of a post and of the flag starts this far below the top of its box (canvas `top + 6`).
    public static let markTextTop: CGFloat = 6
    /// Disc to text in a stop row (A).
    public static let stopTextGap: CGFloat = 14
    /// Margin kept free on the screen edge beyond the text (`W − 20`).
    public static let edgeMargin: CGFloat = 20
    /// Text of a stop is never wider than this (iPad, spec 11: "chữ rộng tối đa 300").
    public static let maxTextWidth: CGFloat = 300
    /// Widest map (iPad, spec 11: "Bề rộng bản đồ tối đa 600").
    public static let maxWidth: CGFloat = 600
    /// Road: a solid paper band (not an outline), 24 wide (A) or 20 (B).
    public static func roadWidth(_ style: Style) -> CGFloat {
        style == .winding ? 24 : 20
    }

    /// Share of the drop the road's control points take (tangents vertical at both ends).
    public static func roadTension(_ style: Style) -> CGFloat {
        style == .winding ? 0.52 : 0.5
    }

    /// Disc of a stop: A 64 (80 for the topic of "Học tiếp"), B 56 (68).
    public static func discDiameter(_ style: Style, isCurrent: Bool) -> CGFloat {
        switch style {
        case .winding: isCurrent ? 80 : 64
        case .trail: isCurrent ? 68 : 56
        }
    }

    /// A: the k-th stop sits left of the road when k is even, right when odd. B: always left.
    public static func discOnLeft(_ style: Style, stopIndex: Int) -> Bool {
        style == .trail || stopIndex % 2 == 0
    }

    /// Centre x of the k-th stop: A 70 or W − 70; B 52 / 66 in turn.
    public static func stopX(_ style: Style, stopIndex: Int, width: CGFloat) -> CGFloat {
        switch style {
        case .winding: stopIndex % 2 == 0 ? 70 : width - 70
        case .trail: stopIndex % 2 == 0 ? 52 : 66
        }
    }

    /// x of the posts and the flag: the middle (A), 59 (B).
    public static func markX(_ style: Style, width: CGFloat) -> CGFloat {
        style == .winding ? width / 2 : 59
    }

    /// Gap between the disc and the text of a stop: 14 (A); B lines every text up at x = 104.
    public static func textGap(_ style: Style, stopIndex: Int, isCurrent: Bool) -> CGFloat {
        switch style {
        case .winding:
            return stopTextGap
        case .trail:
            let disc = discDiameter(style, isCurrent: isCurrent)
            return max(104 - stopX(style, stopIndex: stopIndex, width: 0) - disc / 2, 4)
        }
    }

    /// Width of a stop's text: A `W − 20 − (x + r + 14)` (same on both sides), B `W − 124`, never
    /// wider than `maxTextWidth`.
    public static func textWidth(_ style: Style, isCurrent: Bool, width: CGFloat, maxTextWidth: CGFloat = maxTextWidth) -> CGFloat {
        let disc = discDiameter(style, isCurrent: isCurrent)
        let room: CGFloat = switch style {
        case .winding: width - edgeMargin - 70 - disc / 2 - stopTextGap
        case .trail: width - 124
        }
        return max(min(room, maxTextWidth), 0)
    }

    /// Width proposed to each item's view, before its height is known.
    public static func widths(_ items: [Item], width: CGFloat, style: Style, maxTextWidth: CGFloat = maxTextWidth) -> [CGFloat] {
        var stopIndex = 0
        return items.map { item in
            switch item {
            case .milestone:
                return max(width - edgeMargin - (markX(style, width: width) - postPoint.x), postSize.width)
            case .flag:
                return max(width - edgeMargin - (markX(style, width: width) - flagPoint.x), flagSize.width)
            case .stop(let isCurrent):
                defer { stopIndex += 1 }
                return discDiameter(style, isCurrent: isCurrent)
                    + textGap(style, stopIndex: stopIndex, isCurrent: isCurrent)
                    + textWidth(style, isCurrent: isCurrent, width: width, maxTextWidth: maxTextWidth)
            }
        }
    }

    /// Height of an item when its view is not measured: the disc, the post box, the flag box.
    public static func minimumHeight(_ item: Item, style: Style) -> CGFloat {
        switch item {
        case .milestone: postSize.height
        case .flag: flagSize.height
        case .stop(let isCurrent): discDiameter(style, isCurrent: isCurrent)
        }
    }

    // MARK: Vertical steps (spec 6, 7)

    /// y of the first item: the first post at 34 (A) or 26 (B).
    static func top(_ style: Style) -> CGFloat {
        style == .winding ? 34 : 26
    }

    /// Room under the flag: 54 (A), 44 (B).
    static func bottom(_ style: Style) -> CGFloat {
        style == .winding ? 54 : 44
    }

    /// The canvas's step from `a` to `b`, before any text is too tall for it.
    static func baseStep(_ style: Style, from a: Item, to b: Item) -> CGFloat {
        switch (style, a, b) {
        case (.winding, .milestone, .stop): 96
        case (.winding, .stop, .stop): 124
        case (.winding, .stop, .flag): 110
        case (.winding, _, _): 104
        case (.trail, .milestone, .stop): 70
        case (.trail, .stop(let x), .stop(let y)): x || y ? 94 : 86
        case (.trail, .stop, .flag): 76
        case (.trail, _, _): 74
        }
    }

    /// How far an item `h` tall reaches above and below its road point: a stop is centred on it,
    /// a post's box starts 26 above its point, the flag's 46 above.
    static func reach(_ item: Item, height h: CGFloat) -> (above: CGFloat, below: CGFloat) {
        switch item {
        case .stop: (h / 2, h / 2)
        case .milestone: (postPoint.y, h - postPoint.y)
        case .flag: (flagPoint.y, h - flagPoint.y)
        }
    }

    /// Step from the point of `a` (`ha` tall) to the point of `b` (`hb` tall): the canvas's step,
    /// grown when the text is taller (Dynamic Type, spec 6) so the two keep a clear gap: 46 between
    /// two stops of A (spec: "chiều cao hàng chữ + 46"; here the gap between the two rows' edges,
    /// so a tall row next to a short one moves less), 24 between two stops of B and next to a post
    /// or the flag on A, 2 there on B (the canvas's flag nearly touches the last disc).
    public static func step(_ style: Style, from a: Item, _ ha: CGFloat, to b: Item, _ hb: CGFloat) -> CGFloat {
        let gap: CGFloat = switch (style, a, b) {
        case (.winding, .stop, .stop): 46
        case (.winding, _, _): 24
        case (.trail, .stop, .stop): 24
        case (.trail, _, _): 2
        }
        return max(baseStep(style, from: a, to: b), reach(a, height: ha).below + reach(b, height: hb).above + gap)
    }

    // MARK: Layout

    /// The frame and road point of every item for `width`, with the measured `heights` (one per
    /// item; `nil` or a missing value: `minimumHeight`). Each height is at least the minimum.
    public static func layout(
        _ items: [Item], width: CGFloat, heights: [CGFloat]? = nil, style: Style = .winding,
        maxTextWidth: CGFloat = maxTextWidth
    ) -> Map {
        guard !items.isEmpty else { return .empty }
        let rowWidths = widths(items, width: width, style: style, maxTextWidth: maxTextWidth)
        let sizes = items.indices.map { index in
            max(heights?[safe: index] ?? 0, minimumHeight(items[index], style: style))
        }
        var placements: [Placement] = []
        var y = top(style)
        var stopIndex = 0
        for (index, item) in items.enumerated() {
            if index > 0 {
                y += step(style, from: items[index - 1], sizes[index - 1], to: item, sizes[index])
            }
            let h = sizes[index]
            let w = rowWidths[index]
            switch item {
            case .milestone:
                let x = markX(style, width: width)
                let frame = CGRect(x: x - postPoint.x, y: y - postPoint.y, width: w, height: h)
                placements.append(Placement(item: item, stopIndex: nil, frame: frame, point: CGPoint(x: x, y: y), mark: .milestone))
            case .flag:
                let x = markX(style, width: width)
                let frame = CGRect(x: x - flagPoint.x, y: y - flagPoint.y, width: w, height: h)
                placements.append(Placement(item: item, stopIndex: nil, frame: frame, point: CGPoint(x: x, y: y), mark: .flag))
            case .stop(let isCurrent):
                let x = stopX(style, stopIndex: stopIndex, width: width)
                let disc = discDiameter(style, isCurrent: isCurrent)
                let onLeft = discOnLeft(style, stopIndex: stopIndex)
                let minX = onLeft ? x - disc / 2 : x + disc / 2 - w
                let frame = CGRect(x: minX, y: y - h / 2, width: w, height: h)
                placements.append(Placement(
                    item: item, stopIndex: stopIndex, frame: frame, point: CGPoint(x: x, y: y),
                    mark: .disc(leading: onLeft, diameter: disc)
                ))
                stopIndex += 1
            }
        }
        let last = placements[placements.count - 1]
        let height: CGFloat = if case .flag = last.item {
            last.point.y + bottom(style)
        } else {
            last.frame.maxY + bottom(style) / 2
        }
        return Map(placements: placements, size: CGSize(width: width, height: height))
    }

    /// The road mark of each item: which end of a stop's row its disc is on, and how large.
    public static func marks(_ items: [Item], style: Style) -> [Mark] {
        var stopIndex = 0
        return items.map { item in
            switch item {
            case .milestone: return .milestone
            case .flag: return .flag
            case .stop(let isCurrent):
                defer { stopIndex += 1 }
                return .disc(leading: discOnLeft(style, stopIndex: stopIndex), diameter: discDiameter(style, isCurrent: isCurrent))
            }
        }
    }

    /// Gap from a post's box to its text: A puts the text at W/2 + 27, B at x = 104.
    public static func postGap(_ style: Style) -> CGFloat {
        style == .winding ? postTextGap : 104 - (markX(style, width: 0) - postPoint.x + postSize.width)
    }

    /// Where the road passes through an item whose view has `frame` (the inverse of `layout`'s
    /// frames: the app reads the frames of its rows and draws the road through these points).
    public static func roadPoint(_ mark: Mark, in frame: CGRect) -> CGPoint {
        switch mark {
        case .disc(let leading, let diameter):
            CGPoint(x: leading ? frame.minX + diameter / 2 : frame.maxX - diameter / 2, y: frame.midY)
        case .milestone:
            CGPoint(x: frame.minX + postPoint.x, y: frame.minY + postPoint.y)
        case .flag:
            CGPoint(x: frame.minX + flagPoint.x, y: frame.minY + flagPoint.y)
        }
    }

    /// The road through `points`: one cubic per pair, its control points straight below the
    /// first point and straight above the second (`tension` × the drop), so the road leaves and
    /// enters each disc vertically and never cuts through the text (spec 6).
    public static func road(through points: [CGPoint], tension: CGFloat = 0.52) -> Path {
        var road = Path()
        guard let first = points.first else { return road }
        road.move(to: first)
        for (a, b) in zip(points, points.dropFirst()) {
            let dy = b.y - a.y
            road.addCurve(
                to: b,
                control1: CGPoint(x: a.x, y: a.y + tension * dy),
                control2: CGPoint(x: b.x, y: b.y - tension * dy)
            )
        }
        return road
    }

    // MARK: Scenery (spec 6, A only)

    /// A small piece of scenery beside the road.
    public enum Scenery: Int, Sendable, CaseIterable {
        case hill
        case pond
        case bush
        case field
    }

    /// Scenery of map A: under every stop except one just before a post or the flag, on the
    /// stop's side (x = 44 or W − 44), 74 below its centre; hill, pond, bush, field in turn by the
    /// stop's place. None on map B. `points`: the road points of `items`.
    public static func scenery(
        _ items: [Item], points: [CGPoint], width: CGFloat, style: Style
    ) -> [(kind: Scenery, point: CGPoint)] {
        guard style == .winding, items.count == points.count else { return [] }
        var pieces: [(kind: Scenery, point: CGPoint)] = []
        var stopIndex = 0
        for (index, item) in items.enumerated() {
            guard case .stop = item else { continue }
            defer { stopIndex += 1 }
            guard let next = items[safe: index + 1], case .stop = next else { continue }
            let x = discOnLeft(style, stopIndex: stopIndex) ? 44 : width - 44
            pieces.append((Scenery(rawValue: stopIndex % 4) ?? .hill, CGPoint(x: x, y: points[index].y + 74)))
        }
        return pieces
    }

    /// `scenery(_:points:width:style:)` of a laid-out map.
    public static func scenery(_ map: Map, style: Style) -> [(kind: Scenery, point: CGPoint)] {
        scenery(map.placements.map(\.item), points: map.roadPoints, width: map.size.width, style: style)
    }

    // MARK: Lesson ring (spec 4)

    /// The pieces of a stop's lesson ring, one per written lesson, as angles in degrees
    /// (0 = 3 o'clock, growing clockwise on screen): piece i from −90 + i·360/n + gap/2 to
    /// −90 + (i+1)·360/n − gap/2, a 7° gap up to 12 lessons, 4° beyond.
    public static func ringSectors(count: Int) -> [ClosedRange<Double>] {
        guard count > 0 else { return [] }
        let gap = count > 12 ? 4.0 : 7.0
        let slice = 360.0 / Double(count)
        return (0..<count).map { index in
            (-90 + Double(index) * slice + gap / 2)...(-90 + Double(index + 1) * slice - gap / 2)
        }
    }

    // MARK: Reveal (spec 9)

    /// Delay of the i-th item of the map in the screen's reveal: 140 ms, then 70 ms more for each
    /// item, never more than 420 ms (the map is laid in about half a second).
    public static func revealDelay(index: Int) -> TimeInterval {
        min(0.14 + 0.07 * Double(max(index, 0)), 0.42)
    }
}

extension Array {
    fileprivate subscript(safe index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
