import Foundation
import SwiftUI
import UIKit

// Paper pieces of the journey map (SK-034, `journey-roadmap-spec.md` sections 4 and 6, canvas
// `Discoverer-Home-Roadmap.dc.html`). All decorative: the rows and headers around them carry the
// labels. The canvas's torn edge (`filter: paperE`) is left out; its soft drop shadow stays.

/// The lesson ring of a stop being learnt (spec 4): one filled piece of an annulus per written
/// lesson, clockwise from the top, a gap between pieces. Done lessons lá tre, the topic's "Học
/// tiếp" lesson vàng hoè, the rest dull paper; coloured pieces lie on `shadow.paper_1`.
public struct LessonRing: View {
    public enum Piece: Sendable, Equatable {
        case done
        case next
        case todo
    }

    private let pieces: [Piece]
    private let diameter: CGFloat
    private let thickness: CGFloat

    /// `thickness`: 7 for the topic of "Học tiếp", 6 for another topic under way.
    public init(pieces: [Piece], diameter: CGFloat, thickness: CGFloat) {
        self.pieces = pieces
        self.diameter = diameter
        self.thickness = thickness
    }

    public var body: some View {
        let sectors = JourneyMapGeometry.ringSectors(count: pieces.count)
        ZStack {
            ForEach(Array(zip(pieces, sectors).enumerated()), id: \.offset) { _, pair in
                if pair.0 == .todo {
                    RingSector(degrees: pair.1, thickness: thickness).fill(Tokens.Role.surfaceInactive)
                }
            }
            ZStack {
                ForEach(Array(zip(pieces, sectors).enumerated()), id: \.offset) { _, pair in
                    if pair.0 != .todo {
                        RingSector(degrees: pair.1, thickness: thickness)
                            .fill(pair.0 == .done ? Tokens.Role.feedbackCorrect : Tokens.Role.stateCurrent)
                    }
                }
            }
            .paperDropShadow(Tokens.Shadow.paper1)
        }
        .frame(width: diameter, height: diameter)
        .accessibilityHidden(true)
    }
}

/// One piece of an annulus filling its square: outer radius half the side, inner `thickness` less,
/// from `degrees.lowerBound` to `.upperBound` (0 = 3 o'clock, growing clockwise on screen).
public struct RingSector: SwiftUI.Shape {
    public let degrees: ClosedRange<Double>
    public let thickness: CGFloat

    public init(degrees: ClosedRange<Double>, thickness: CGFloat) {
        self.degrees = degrees
        self.thickness = thickness
    }

    public func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let outer = min(rect.width, rect.height) / 2
        let inner = max(outer - thickness, 0)
        var path = Path()
        path.addScreenArc(center: center, radius: outer, from: degrees.lowerBound, to: degrees.upperBound, move: true)
        path.addScreenArc(center: center, radius: inner, from: degrees.upperBound, to: degrees.lowerBound, move: false)
        path.closeSubpath()
        return path
    }
}

extension Path {
    /// An arc as short lines, from `start` to `end` degrees (0 = 3 o'clock, angles growing
    /// clockwise on screen, as y grows downwards). Written out so the direction never depends on
    /// `addArc`'s `clockwise` flag in flipped coordinates.
    mutating func addScreenArc(center: CGPoint, radius: CGFloat, from start: Double, to end: Double, move: Bool) {
        let steps = max(Int((abs(end - start) / 2).rounded(.up)), 1)
        for step in 0...steps {
            let angle = (start + (end - start) * Double(step) / Double(steps)) * .pi / 180
            let point = CGPoint(x: center.x + radius * CGFloat(cos(angle)), y: center.y + radius * CGFloat(sin(angle)))
            if step == 0, move {
                self.move(to: point)
            } else {
                addLine(to: point)
            }
        }
    }
}

/// The post of a stage ("cột cây số", spec 6): a paper post with a đỏ son round cap, the stage's
/// number on it, its shadow of earth under the foot. Box `JourneyMapGeometry.postSize` (34 × 46);
/// the road passes through `postPoint`.
public struct MilestonePost: View {
    private let number: Int

    public init(number: Int) {
        self.number = number
    }

    public var body: some View {
        let size = JourneyMapGeometry.postSize
        ZStack(alignment: .topLeading) {
            Ellipse()
                .fill(Tokens.Palette.giayLomDeep)
                .frame(width: 30, height: 6.8)
                .position(x: 17, y: 43)
            PostBody()
                .fill(Tokens.Role.surfacePaper)
            PostCap()
                .fill(Tokens.Role.actionPrimary)
            Text(verbatim: "\(number)")
                .typography(Tokens.Typography.number, fixedBox: true)
                .foregroundStyle(Tokens.Role.textPrimary)
                .lineLimit(1)
                .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                .frame(width: 26, height: 22)
                .position(x: 17, y: 30)
        }
        .frame(width: size.width, height: size.height)
        .paperDropShadow(Tokens.Shadow.paper2)
        .accessibilityHidden(true)
    }

    /// `M3 16 A14 14 0 0 1 31 16 V41 C31 42.2 30.2 43 29 43 H5 C3.8 43 3 42.2 3 41 Z` in the 34 × 46 box.
    private struct PostBody: SwiftUI.Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.addScreenArc(center: CGPoint(x: 17, y: 16), radius: 14, from: 180, to: 360, move: true)
            path.addLine(to: CGPoint(x: 31, y: 41))
            path.addCurve(to: CGPoint(x: 29, y: 43), control1: CGPoint(x: 31, y: 42.2), control2: CGPoint(x: 30.2, y: 43))
            path.addLine(to: CGPoint(x: 5, y: 43))
            path.addCurve(to: CGPoint(x: 3, y: 41), control1: CGPoint(x: 3.8, y: 43), control2: CGPoint(x: 3, y: 42.2))
            path.closeSubpath()
            return path.offsetBy(dx: rect.minX, dy: rect.minY)
        }
    }

    /// `M3 16 A14 14 0 0 1 31 16 V18 H3 Z`: the round cap and a band of 2 under it.
    private struct PostCap: SwiftUI.Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.addScreenArc(center: CGPoint(x: 17, y: 16), radius: 14, from: 180, to: 360, move: true)
            path.addLine(to: CGPoint(x: 31, y: 18))
            path.addLine(to: CGPoint(x: 3, y: 18))
            path.closeSubpath()
            return path.offsetBy(dx: rect.minX, dy: rect.minY)
        }
    }
}

/// The finish flag ("Về đích", spec 6): a nâu đất pole, a đỏ son swallow-tail pennant, a vàng hoè
/// knob, its shadow of earth. Box `JourneyMapGeometry.flagSize` (44 × 56); the road ends at
/// `flagPoint`.
public struct FinishFlag: View {
    public init() {}

    public var body: some View {
        let size = JourneyMapGeometry.flagSize
        ZStack(alignment: .topLeading) {
            Ellipse()
                .fill(Tokens.Palette.giayLomDeep)
                .frame(width: 24, height: 6.4)
                .position(x: 10, y: 53)
            RoundedRectangle(cornerRadius: 2, style: .continuous)
                .fill(Tokens.Palette.nauDat)
                .frame(width: 4, height: 50)
                .position(x: 10, y: 29)
            Pennant()
                .fill(Tokens.Role.actionPrimary)
            Circle()
                .fill(Tokens.Role.stateCurrent)
                .frame(width: 7.2, height: 7.2)
                .position(x: 10, y: 4)
        }
        .frame(width: size.width, height: size.height)
        .paperDropShadow(Tokens.Shadow.paper2)
        .accessibilityHidden(true)
    }

    /// `M12 6 H42 L34 16 L42 26 H12 Z` in the 44 × 56 box.
    private struct Pennant: SwiftUI.Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint(x: 12, y: 6))
            path.addLine(to: CGPoint(x: 42, y: 6))
            path.addLine(to: CGPoint(x: 34, y: 16))
            path.addLine(to: CGPoint(x: 42, y: 26))
            path.addLine(to: CGPoint(x: 12, y: 26))
            path.closeSubpath()
            return path.offsetBy(dx: rect.minX, dy: rect.minY)
        }
    }
}

/// A small piece of scenery beside the road of map A (spec 6): hill, pond, bush or field, in the
/// tones of giấy lõm, drawn around its point (`JourneyMapGeometry.scenery`). 80 × 40 box centred
/// on the point; the shapes come from the canvas, relative to the point.
public struct RoadsideScenery: View {
    private let kind: JourneyMapGeometry.Scenery

    public init(_ kind: JourneyMapGeometry.Scenery) {
        self.kind = kind
    }

    /// Box of every piece, centred on its point.
    public static let box = CGSize(width: 80, height: 40)

    public var body: some View {
        ZStack {
            switch kind {
            case .hill:
                SceneryShape(kind: .hillSmall).fill(Tokens.Role.surfaceInactive)
                SceneryShape(kind: .hillLarge).fill(Tokens.Role.surfaceSunken)
            case .pond:
                SceneryShape(kind: .pond).fill(Self.pondWater)
                SceneryShape(kind: .reed).fill(Tokens.Palette.giayLomDeep)
            case .bush:
                SceneryShape(kind: .bushSides).fill(Tokens.Palette.giayLomDeep)
                SceneryShape(kind: .bushMiddle).fill(Tokens.Role.surfaceInactive)
                SceneryShape(kind: .bushTrunk).fill(Tokens.Palette.giayLomDeep)
            case .field:
                SceneryShape(kind: .fieldOdd).fill(Tokens.Role.surfaceInactive)
                SceneryShape(kind: .fieldEven).fill(Tokens.Role.surfaceSunken)
            }
        }
        .frame(width: Self.box.width, height: Self.box.height)
        .paperDropShadow(Tokens.Shadow.paper1)
        .accessibilityHidden(true)
    }

    /// Pond water: the canvas's `#CFDCD8` ("giấy 70% + gỉ đồng 30%", spec 8) made from the two
    /// tokens here, so no hex is written in a view; close to the canvas, a little greener.
    static let pondWater: Color = mix(Tokens.Palette.giay, Tokens.Palette.giDong, amount: 0.2)

    static func mix(_ a: Color, _ b: Color, amount: CGFloat) -> Color {
        var (ar, ag, ab, aa): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        var (br, bg, bb, ba): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        UIColor(a).getRed(&ar, green: &ag, blue: &ab, alpha: &aa)
        UIColor(b).getRed(&br, green: &bg, blue: &bb, alpha: &ba)
        func lerp(_ x: CGFloat, _ y: CGFloat) -> Double { Double(x + (y - x) * amount) }
        return Color(.sRGB, red: lerp(ar, br), green: lerp(ag, bg), blue: lerp(ab, bb), opacity: lerp(aa, ba))
    }

    /// The canvas shapes, relative to the piece's point (the centre of the box).
    private struct SceneryShape: SwiftUI.Shape {
        enum Kind {
            case hillSmall, hillLarge, pond, reed, bushSides, bushMiddle, bushTrunk, fieldOdd, fieldEven
        }

        let kind: Kind

        func path(in rect: CGRect) -> Path {
            var path = Path()
            switch kind {
            case .hillSmall:
                path.move(to: CGPoint(x: -34, y: 9))
                path.addCurve(to: CGPoint(x: -2, y: 9), control1: CGPoint(x: -26, y: -8), control2: CGPoint(x: -12, y: -10))
                path.closeSubpath()
            case .hillLarge:
                path.move(to: CGPoint(x: -14, y: 9))
                path.addCurve(to: CGPoint(x: 30, y: 9), control1: CGPoint(x: -4, y: -14), control2: CGPoint(x: 18, y: -14))
                path.closeSubpath()
            case .pond:
                path.addEllipse(in: CGRect(x: -26, y: 3 - 8, width: 52, height: 16))
            case .reed:
                path.move(to: CGPoint(x: 12, y: -1))
                path.addCurve(to: CGPoint(x: 24, y: -4), control1: CGPoint(x: 12, y: -12), control2: CGPoint(x: 22, y: -14))
                path.closeSubpath()
            case .bushSides:
                path.addEllipse(in: CGRect(x: -12 - 8, y: -8, width: 16, height: 16))
                path.addEllipse(in: CGRect(x: 12 - 7, y: 1 - 7, width: 14, height: 14))
            case .bushMiddle:
                path.addEllipse(in: CGRect(x: -10, y: -5 - 10, width: 20, height: 20))
            case .bushTrunk:
                path.addRect(CGRect(x: -1.5, y: 2, width: 3, height: 9))
            case .fieldOdd, .fieldEven:
                // Four slips 12 × 14 (rx 2) at x −30, −14, 2, 18, skewed −14° about the point.
                let skew = CGAffineTransform(a: 1, b: 0, c: CGFloat(tan(-14 * Double.pi / 180)), d: 1, tx: 0, ty: 0)
                let xs: [CGFloat] = kind == .fieldOdd ? [-30, 2] : [-14, 18]
                for x in xs {
                    path.addPath(Path(roundedRect: CGRect(x: x, y: -6, width: 12, height: 14), cornerRadius: 2).applying(skew))
                }
            }
            return path.offsetBy(dx: rect.midX, dy: rect.midY)
        }
    }
}
