import Foundation
import SwiftUI

/// Small icons of the canvas, redrawn from its SVG paths (style E allows strokes only in
/// small icons). Each icon is defined in its own view box and scaled to the requested size.
public enum PaperIcon: String, CaseIterable, Sendable {
    /// Filled check (seal "Đã xem", item in the tray). 24 box.
    case check
    /// Stroked tick on a done step of `ProgressSquares`. 22 box (one square).
    case tick
    /// Arrow pointing forward ("Tiếp", "Chơi: Xếp mâm cơm"). 24 box.
    case arrowForward
    /// Arrow pointing back (back to the journey). 24 box, the forward arrow mirrored.
    case arrowBack
    /// Speaker ("Nghe câu hỏi"). 24 box.
    case speaker
    /// Close cross ("Thoát quiz"). 16 box.
    case close
    /// Circular arrow ("Thử lại"). 24 box.
    case retry
    /// Padlock (locked lesson or topic). 24 box.
    case lock
    /// Shield with a check cut out (privacy note on the profile screen). 24 box.
    case shield
    /// Five-point star (stars chip on Home). 24 box.
    case star
    /// Flame, outer piece (streak chip on Home); draw `flameCore` on top in another colour. 24 box.
    case flame
    /// Inner piece of the flame. 24 box.
    case flameCore
    /// Folded map: tab "Hành trình". 24 box.
    case journey
    /// Two stacked cards: tab "Thẻ". 24 box.
    case cards
    /// Medal on a ribbon: tab "Huy hiệu". 24 box.
    case badge
    /// Book: tab "Từ vựng", topic words. 24 box.
    case book
    /// Three dots: more to come. 24 box.
    case more
    /// Leaf with its vein cut out: a rest day of the streak (Huy hiệu, SK-035). 24 box.
    case leaf
    /// Gear with its hub cut out: Cài đặt on Home (SK-042; no canvas yet, drawn like the others:
    /// one filled shape). 24 box.
    case gear

    /// Side of the SVG view box the path is written in.
    var viewBox: CGFloat {
        switch self {
        case .tick: 22
        case .close: 16
        default: 24
        }
    }

    /// Filled part, in view box units.
    func fillPath() -> Path {
        var p = Path()
        switch self {
        case .check:
            p.addLines([pt(3.5, 12.5), pt(5.9, 10.1), pt(9.8, 14), pt(18.1, 5.7), pt(20.5, 8.1), pt(9.8, 18.8)])
            p.closeSubpath()
        case .arrowForward, .arrowBack:
            p.addLines([
                pt(4, 10.5), pt(14.2, 10.5), pt(10.1, 6.4), pt(12.2, 4.3), pt(20, 12),
                pt(12.2, 19.7), pt(10.1, 17.6), pt(14.2, 13.5), pt(4, 13.5),
            ])
            p.closeSubpath()
            if self == .arrowBack {
                p = p.applying(CGAffineTransform(a: -1, b: 0, c: 0, d: 1, tx: viewBox, ty: 0))
            }
        case .speaker:
            p.addLines([pt(3, 9.5), pt(7.2, 9.5), pt(13, 4.8), pt(13, 19.2), pt(7.2, 14.5), pt(3, 14.5)])
            p.closeSubpath()
        case .retry:
            p.addLines([pt(3.2, 4.2), pt(3.2, 10.8), pt(9.8, 10.8)])
            p.closeSubpath()
        case .lock:
            // M7.5 11V8a4.5 4.5 0 0 1 9 0v3h-2.6V8a1.9 1.9 0 0 0-3.8 0v3z + rect 5,10.5 14×10.5 rx 2
            p.move(to: pt(7.5, 11))
            p.addLine(to: pt(7.5, 8))
            p.addRelativeArc(center: pt(12, 8), radius: 4.5, startAngle: .degrees(180), delta: .degrees(180))
            p.addLine(to: pt(16.5, 11))
            p.addLine(to: pt(13.9, 11))
            p.addLine(to: pt(13.9, 8))
            p.addRelativeArc(center: pt(12, 8), radius: 1.9, startAngle: .degrees(0), delta: .degrees(-180))
            p.addLine(to: pt(10.1, 11))
            p.closeSubpath()
            p.addRoundedRect(in: CGRect(x: 5, y: 10.5, width: 14, height: 10.5), cornerSize: CGSize(width: 2, height: 2))
        case .shield:
            // Shield M12 2.5l8 3v6c0 5-3.4 8.7-8 10-4.6-1.3-8-5-8-10v-6z, the check of `check` at
            // translate(6 5.6) scale(0.5) cut out (the canvas paints it in the screen colour).
            var shield = Path()
            shield.move(to: pt(12, 2.5))
            shield.addLine(to: pt(20, 5.5))
            shield.addLine(to: pt(20, 11.5))
            shield.addCurve(to: pt(12, 21.5), control1: pt(20, 16.5), control2: pt(16.6, 20.2))
            shield.addCurve(to: pt(4, 11.5), control1: pt(7.4, 20.2), control2: pt(4, 16.5))
            shield.addLine(to: pt(4, 5.5))
            shield.closeSubpath()
            let check = PaperIcon.check.fillPath()
                .applying(CGAffineTransform(a: 0.5, b: 0, c: 0, d: 0.5, tx: 6, ty: 5.6))
            p = shield.subtracting(check)
        case .star:
            p.addLines([
                pt(12, 2.5), pt(14.9, 8.5), pt(21.5, 9.3), pt(16.6, 13.9), pt(17.9, 20.5), pt(12, 17.3),
                pt(6.1, 20.5), pt(7.4, 13.9), pt(2.5, 9.3), pt(9.1, 8.5),
            ])
            p.closeSubpath()
        case .flame:
            p.move(to: pt(12, 22))
            p.addCurve(to: pt(19, 15), control1: pt(16, 22), control2: pt(19, 19))
            p.addCurve(to: pt(15, 5), control1: pt(19, 11), control2: pt(16, 9))
            p.addCurve(to: pt(12, 11), control1: pt(13, 7), control2: pt(12, 9))
            p.addCurve(to: pt(10, 7), control1: pt(11, 10), control2: pt(10, 9))
            p.addCurve(to: pt(5, 15), control1: pt(8, 9), control2: pt(5, 12))
            p.addCurve(to: pt(12, 22), control1: pt(5, 19), control2: pt(8, 22))
            p.closeSubpath()
        case .flameCore:
            p.move(to: pt(12, 21))
            p.addCurve(to: pt(15.8, 17.2), control1: pt(14.2, 21), control2: pt(15.8, 19.4))
            p.addCurve(to: pt(13.6, 11.8), control1: pt(15.8, 15), control2: pt(14.2, 13.9))
            p.addCurve(to: pt(12, 15.1), control1: pt(12.5, 12.9), control2: pt(12, 14))
            p.addCurve(to: pt(10.9, 12.9), control1: pt(11.4, 14.5), control2: pt(10.9, 14))
            p.addCurve(to: pt(8.2, 17.2), control1: pt(9.8, 14), control2: pt(8.2, 15.6))
            p.addCurve(to: pt(12, 21), control1: pt(8.2, 19.4), control2: pt(9.8, 21))
            p.closeSubpath()
        case .journey:
            p.addLines([pt(2.5, 6.2), pt(8.5, 4), pt(8.5, 18), pt(2.5, 20.2)])
            p.closeSubpath()
            p.addLines([pt(9.6, 4), pt(14.4, 6), pt(14.4, 20), pt(9.6, 18)])
            p.closeSubpath()
            p.addLines([pt(15.5, 6), pt(21.5, 3.8), pt(21.5, 17.8), pt(15.5, 20)])
            p.closeSubpath()
        case .cards:
            // Back card rotated 8° about (14.5, 10), cut by the front card's paper edge, plus the front card.
            var back = Path()
            back.addRoundedRect(in: CGRect(x: 8.5, y: 2.5, width: 12, height: 15.5), cornerSize: CGSize(width: 2, height: 2))
            let turn = CGAffineTransform(translationX: 14.5, y: 10).rotated(by: .pi * 8 / 180).translatedBy(x: -14.5, y: -10)
            back = back.applying(turn)
            var edge = Path()
            edge.addRoundedRect(in: CGRect(x: 2.3, y: 4.8, width: 15, height: 18.4), cornerSize: CGSize(width: 2.6, height: 2.6))
            var front = Path()
            front.addRoundedRect(in: CGRect(x: 3.5, y: 6, width: 12.6, height: 16), cornerSize: CGSize(width: 2, height: 2))
            p = back.subtracting(edge).union(front)
        case .badge:
            var ribbon = Path()
            ribbon.addLines([pt(8, 13.5), pt(6.5, 22.5), pt(12, 19.5), pt(17.5, 22.5), pt(16, 13.5)])
            ribbon.closeSubpath()
            let medal = Self.circle(12, 9, 6).subtracting(Self.circle(12, 9, 2.6))
            p = ribbon.subtracting(Self.circle(12, 9, 7)).union(medal)
        case .book:
            var cover = Path()
            cover.move(to: pt(4, 5.5))
            cover.addRelativeArc(center: pt(6.5, 5.5), radius: 2.5, startAngle: .degrees(180), delta: .degrees(90))
            cover.addLine(to: pt(20, 3))
            cover.addLine(to: pt(20, 17.5))
            cover.addLine(to: pt(6.5, 17.5))
            cover.addRelativeArc(center: pt(6.5, 20), radius: 2.5, startAngle: .degrees(270), delta: .degrees(-90))
            cover.closeSubpath()
            var page = Path()
            page.move(to: pt(6.5, 18.8))
            page.addLine(to: pt(20, 18.8))
            page.addLine(to: pt(20, 21))
            page.addLine(to: pt(6.5, 21))
            page.addRelativeArc(center: pt(6.5, 19.9), radius: 1.1, startAngle: .degrees(90), delta: .degrees(180))
            page.closeSubpath()
            var bar = Path()
            bar.addRoundedRect(in: CGRect(x: 8.5, y: 7, width: 8, height: 2.2), cornerSize: CGSize(width: 1.1, height: 1.1))
            p = cover.union(page).subtracting(bar)
        case .more:
            p = Self.circle(6, 12, 2.2).union(Self.circle(12, 12, 2.2)).union(Self.circle(18, 12, 2.2))
        case .leaf:
            // M5.5 18.5C5.5 10 10 5.5 18.5 5.5c0 8.5-4.5 13-13 13z, the vein M6.5 17.5l6.5-6.5
            // (stroke 1.8, round) cut out (the canvas paints it in paper).
            var leaf = Path()
            leaf.move(to: pt(5.5, 18.5))
            leaf.addCurve(to: pt(18.5, 5.5), control1: pt(5.5, 10), control2: pt(10, 5.5))
            leaf.addCurve(to: pt(5.5, 18.5), control1: pt(18.5, 14), control2: pt(14, 18.5))
            leaf.closeSubpath()
            var vein = Path()
            vein.move(to: pt(6.5, 17.5))
            vein.addLine(to: pt(13, 11))
            p = leaf.subtracting(vein.strokedPath(StrokeStyle(lineWidth: 1.8, lineCap: .round)))
        case .gear:
            // Eight square teeth around a disc of radius 7, hub of radius 3 cut out.
            var gear = Self.circle(12, 12, 7)
            for index in 0..<8 {
                let tooth = Path(roundedRect: CGRect(x: 10.2, y: 1.6, width: 3.6, height: 5), cornerSize: CGSize(width: 0.9, height: 0.9))
                let turn = CGAffineTransform(translationX: 12, y: 12)
                    .rotated(by: CGFloat(index) * .pi / 4)
                    .translatedBy(x: -12, y: -12)
                gear = gear.union(tooth.applying(turn))
            }
            p = gear.subtracting(Self.circle(12, 12, 3))
        case .tick, .close:
            break
        }
        return p
    }

    private static func circle(_ x: CGFloat, _ y: CGFloat, _ r: CGFloat) -> Path {
        Path(ellipseIn: CGRect(x: x - r, y: y - r, width: 2 * r, height: 2 * r))
    }

    /// Stroked part, in view box units, and its line width.
    func strokePath() -> (path: Path, lineWidth: CGFloat)? {
        var p = Path()
        switch self {
        case .tick:
            p.addLines([pt(6, 11.5), pt(9.6, 15.1), pt(16.2, 7.9)])
            return (p, 2.6)
        case .speaker:
            // a4.6 from (16.2, 8.6) and a8.4 from (18.8, 6): arcs centred left of their chords.
            p.addRelativeArc(center: pt(13.1, 12), radius: 4.6, startAngle: .degrees(-47.64), delta: .degrees(95.28))
            p.move(to: pt(18.8, 6))
            p.addRelativeArc(center: pt(12.92, 12), radius: 8.4, startAngle: .degrees(-45.58), delta: .degrees(91.16))
            return (p, 2.4)
        case .close:
            p.move(to: pt(0, 0))
            p.addLine(to: pt(16, 16))
            p.move(to: pt(16, 0))
            p.addLine(to: pt(0, 16))
            return (p, 3.4)
        case .retry:
            // A7 7 0 1 1 from (6.6, 8.4) to (5, 13).
            p.addRelativeArc(center: pt(12, 12.856), radius: 7, startAngle: .degrees(-140.5), delta: .degrees(319.3))
            return (p, 2.8)
        case .check, .arrowForward, .arrowBack, .lock, .shield, .star, .flame, .flameCore, .journey, .cards,
             .badge, .book, .more, .leaf, .gear:
            return nil
        }
    }

    private func pt(_ x: CGFloat, _ y: CGFloat) -> CGPoint { CGPoint(x: x, y: y) }
}

/// Draws a `PaperIcon` at `size` × `size` pt in `color`. Decorative: hidden from VoiceOver;
/// the button that holds it carries the label.
public struct PaperIconView: View {
    private let icon: PaperIcon
    private let size: CGFloat
    private let color: Color

    public init(_ icon: PaperIcon, size: CGFloat = PaperMetrics.iconSize, color: Color = Tokens.Role.textPrimary) {
        self.icon = icon
        self.size = size
        self.color = color
    }

    public var body: some View {
        let scale = size / icon.viewBox
        let transform = CGAffineTransform(scaleX: scale, y: scale)
        ZStack {
            ScaledPath(path: icon.fillPath().applying(transform))
                .fill(color)
            if let stroke = icon.strokePath() {
                ScaledPath(path: stroke.path.applying(transform))
                    .stroke(color, style: StrokeStyle(lineWidth: stroke.lineWidth * scale, lineCap: .round, lineJoin: .round))
            }
        }
        .frame(width: size, height: size)
        .accessibilityHidden(true)
    }
}

/// A fixed path as a `Shape` (already in the view's coordinates).
private struct ScaledPath: SwiftUI.Shape {
    let path: Path

    func path(in rect: CGRect) -> Path { path }
}
