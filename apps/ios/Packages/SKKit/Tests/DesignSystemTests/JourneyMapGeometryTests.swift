import SwiftUI
import Testing
@testable import DesignSystem

/// SK-034: geometry of the journey map (`journey-roadmap-spec.md` sections 4, 6, 7, 9), checked
/// against the numbers of the canvas `Discoverer-Home-Roadmap-Full.dc.html` (390 wide, map 2430 tall).
@Suite struct JourneyMapGeometryTests {
    typealias G = JourneyMapGeometry

    /// Discoverer as on the canvas: post, the topic of "Học tiếp" then 4 topics (stage 1), post,
    /// 6 topics (stage 2), post, 6 topics (stage 3), flag.
    static let discoverer: [G.Item] = {
        var items: [G.Item] = [.milestone, .stop(isCurrent: true)]
        items += Array(repeating: .stop(isCurrent: false), count: 4)
        items += [.milestone] + Array(repeating: .stop(isCurrent: false), count: 6)
        items += [.milestone] + Array(repeating: .stop(isCurrent: false), count: 6)
        return items + [.flag]
    }()

    /// The canvas's road points: `M 195 34 C … 70 130 … 320 254 …` down to the flag at 2376.
    @Test func canvasPointsAndHeight() {
        let map = G.layout(Self.discoverer, width: 390)
        #expect(map.placements.count == 21)
        let ys = map.roadPoints.map(\.y)
        #expect(ys == [
            34, 130, 254, 378, 502, 626,
            730, 826, 950, 1074, 1198, 1322, 1446,
            1550, 1646, 1770, 1894, 2018, 2142, 2266,
            2376,
        ])
        #expect(map.size == CGSize(width: 390, height: 2430), "flag + 54")
        let xs = map.roadPoints.map(\.x)
        #expect(xs[0] == 195 && xs[6] == 195 && xs[13] == 195 && xs[20] == 195, "posts and flag in the middle")
        // Stops alternate left, right from the first one, across the stages (posts not counted).
        let stopXs = map.placements.filter { $0.stopIndex != nil }.map(\.point.x)
        #expect(stopXs.count == 17)
        #expect(stopXs == (0..<17).map { $0 % 2 == 0 ? 70 : 320 })
        #expect(map.placements.compactMap(\.stopIndex) == Array(0..<17), "stops in journey order")
    }

    /// Frames of the canvas rows: the current stop at `left: 30` with 246 of text; a stop on the
    /// right at `right: 38` with 254 of text aligned right; the post at `left: 178; top: 8`; the flag
    /// at `left: 185; top: 2330`.
    @Test func canvasFrames() {
        let map = G.layout(Self.discoverer, width: 390)
        let current = map.placements[1]
        #expect(current.frame.minX == 30)
        #expect(current.frame.width == 340, "80 + 14 + 246")
        #expect(current.frame.midY == 130)
        let right = map.placements[2]
        #expect(right.frame.maxX == 352, "390 - 38")
        #expect(right.frame.width == 332, "64 + 14 + 254")
        #expect(right.mark == .disc(leading: false, diameter: 64))
        #expect(map.placements[0].frame.origin == CGPoint(x: 178, y: 8))
        #expect(map.placements[20].frame.origin == CGPoint(x: 185, y: 2330))
        #expect(G.textWidth(.winding, isCurrent: false, width: 390) == 254)
    }

    /// The road meets every item: the point read back from an item's frame is its road point.
    @Test(arguments: [G.Style.winding, .trail])
    func roadPointsComeBackFromFrames(style: G.Style) {
        let heights: [CGFloat] = Self.discoverer.indices.map { $0 % 3 == 0 ? 96 : 0 }
        let map = G.layout(Self.discoverer, width: 390, heights: heights, style: style)
        let marks = G.marks(Self.discoverer, style: style)
        for (placement, mark) in zip(map.placements, marks) {
            #expect(placement.mark == mark)
            #expect(G.roadPoint(mark, in: placement.frame) == placement.point)
        }
    }

    /// Dynamic Type: text taller than the canvas's rows pushes the next row down so the gap
    /// stays (46 between two stops of A), never closer than the canvas.
    @Test func tallTextGrowsTheStep() {
        let items: [G.Item] = [.milestone, .stop(isCurrent: false), .stop(isCurrent: false), .flag]
        let base = G.layout(items, width: 390, heights: [46, 78, 78, 56])
        #expect(base.roadPoints.map(\.y) == [34, 130, 254, 364], "3-line titles still fit the canvas steps")
        let tall = G.layout(items, width: 390, heights: [46, 140, 120, 56])
        let stopToStop: CGFloat = tall.roadPoints[2].y - tall.roadPoints[1].y
        let postToStop: CGFloat = tall.roadPoints[1].y - tall.roadPoints[0].y
        #expect(stopToStop == 176, "(140 + 120) / 2 + 46")
        #expect(postToStop == 114, "post foot 20 below its point, half the row 70, gap 24")
        #expect(tall.placements[1].frame.height == 140, "the measured height is kept")
        let short = G.layout(items, width: 390, heights: [10, 10, 10, 10])
        #expect(short.roadPoints.map(\.y) == base.roadPoints.map(\.y), "never smaller than the disc")
    }

    /// Phương án B (accessibility text sizes): x 52 / 66, posts and flag at 59, text at x = 104;
    /// steps 70, 86 (94 next to the current stop), 74, 76; height flag + 44.
    @Test func trailLayout() {
        let stop = G.Item.stop(isCurrent: false)
        let items: [G.Item] = [.milestone, .stop(isCurrent: true), stop, stop, .milestone, stop, .flag]
        let map = G.layout(items, width: 390, style: .trail)
        #expect(map.roadPoints.map(\.y) == [26, 96, 190, 276, 350, 420, 496])
        #expect(map.roadPoints.map(\.x) == [59, 52, 66, 52, 59, 66, 59])
        #expect(map.size.height == 540, "flag + 44")
        #expect(map.placements.allSatisfy { if case .disc(let leading, _) = $0.mark { leading } else { true } }, "text always right")
        // Text starts at 104 on every stop.
        for placement in map.placements {
            guard let k = placement.stopIndex, case .stop(let isCurrent) = placement.item else { continue }
            let disc = G.discDiameter(.trail, isCurrent: isCurrent)
            #expect(placement.frame.minX + disc + G.textGap(.trail, stopIndex: k, isCurrent: isCurrent) == 104)
        }
        #expect(G.textWidth(.trail, isCurrent: false, width: 390) == 266, "W - 124")
        #expect(G.postGap(.trail) == 28 && G.postGap(.winding) == 10)
    }

    /// iPad (spec 11): at most 300 of text in a 600 map.
    @Test func textNeverWiderThan300() {
        #expect(G.textWidth(.winding, isCurrent: false, width: 600) == 300)
        #expect(G.textWidth(.winding, isCurrent: true, width: 600) == 300)
        #expect(G.textWidth(.winding, isCurrent: false, width: 100) == 0)
        let map = G.layout(Self.discoverer, width: 600)
        #expect(map.placements[2].point.x == 530)
        #expect(map.placements[2].frame.maxX == 562)
    }

    /// The road: one cubic per pair of points, control points straight under and over the ends
    /// (vertical tangents, `0.52 × dy`).
    @Test func roadIsVerticalAtEveryStop() {
        let points = G.layout(Self.discoverer, width: 390).roadPoints
        let road = G.road(through: points, tension: G.roadTension(.winding))
        var curves: [(CGPoint, CGPoint, CGPoint)] = []
        var moves: [CGPoint] = []
        road.forEach { element in
            switch element {
            case .move(let to): moves.append(to)
            case .curve(let to, let c1, let c2): curves.append((to, c1, c2))
            default: break
            }
        }
        #expect(moves == [points[0]])
        #expect(curves.count == points.count - 1)
        for (index, curve) in curves.enumerated() {
            let a = points[index], b = points[index + 1]
            #expect(curve.0 == b)
            #expect(curve.1.x == a.x && abs(curve.1.y - (a.y + 0.52 * (b.y - a.y))) < 0.001)
            #expect(curve.2.x == b.x && abs(curve.2.y - (b.y - 0.52 * (b.y - a.y))) < 0.001)
        }
        // First segment of the canvas: C 195 83.9, 70 80.1, 70 130.
        #expect(abs(curves[0].1.y - 83.92) < 0.01 && abs(curves[0].2.y - 80.08) < 0.01)
        #expect(G.road(through: []).isEmpty)
    }

    /// Scenery (A only): under each stop not followed by a post or the flag, on its side, 74 below;
    /// hill, pond, bush, field in turn. Canvas: a hill at (44, 204) under the first stop, a pond at
    /// (346, 328) under the second, nothing under topic 5 (before the post of stage 2).
    @Test func sceneryBesideTheRoad() {
        let map = G.layout(Self.discoverer, width: 390)
        let pieces = G.scenery(map, style: .winding)
        #expect(pieces.count == 17 - 3)
        #expect(pieces[0].kind == .hill && pieces[0].point == CGPoint(x: 44, y: 204))
        #expect(pieces[1].kind == .pond && pieces[1].point == CGPoint(x: 346, y: 328))
        #expect(pieces[2].kind == .bush && pieces[3].kind == .field)
        #expect(pieces[4].kind == .pond && pieces[4].point == CGPoint(x: 346, y: 826 + 74), "stop 5 (right), first of stage 2")
        #expect(!pieces.contains { $0.point.y == 626 + 74 }, "none before a post")
        #expect(!pieces.contains { $0.point.y == 2266 + 74 }, "none before the flag")
        #expect(G.scenery(G.layout(Self.discoverer, width: 390, style: .trail), style: .trail).isEmpty)
    }

    /// Lesson ring (spec 4): n pieces clockwise from the top, a 7° gap up to 12 lessons, 4° beyond.
    @Test func ringSectors() {
        let five = G.ringSectors(count: 5)
        #expect(five.count == 5)
        #expect(five[0] == -86.5 ... -21.5)
        #expect(five[4].upperBound == 266.5)
        let thirteen = G.ringSectors(count: 13)
        #expect(abs((thirteen[1].lowerBound - thirteen[0].upperBound) - 4) < 0.0001)
        let twelve = G.ringSectors(count: 12)
        #expect(abs((twelve[1].lowerBound - twelve[0].upperBound) - 7) < 0.0001)
        #expect(G.ringSectors(count: 0).isEmpty)
    }

    /// Reveal (spec 9): 140 ms, +70 ms per item, at most 420 ms.
    @Test func revealDelays() {
        #expect(G.revealDelay(index: 0) == 0.14)
        #expect(abs(G.revealDelay(index: 1) - 0.21) < 0.0001)
        #expect(abs(G.revealDelay(index: 4) - 0.42) < 0.0001)
        #expect(G.revealDelay(index: 20) == 0.42)
    }

    @Test func emptyMap() {
        #expect(G.layout([], width: 390) == .empty)
        #expect(G.scenery(.empty, style: .winding).isEmpty)
    }
}
