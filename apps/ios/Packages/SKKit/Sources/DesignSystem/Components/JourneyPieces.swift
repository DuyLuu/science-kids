import Foundation
import SwiftUI

/// A stop on the journey (canvas Home, "Hành trình"): a square of paper with round corners
/// (`radius.tile_l`), tilted a little, holding the topic's glyph.
///
/// - `.current`: bright paper with the vàng hoè piece offset behind it (`shadow.offset_accent`),
///   the topic being learnt;
/// - `.open`: bright paper with `shadow.paper_3`;
/// - `.locked`: dull paper (`surface_inactive`, `shadow.paper_2`) with a lock badge on its corner.
///
/// Decorative: the row that holds it carries the label.
public struct PaperDisc<Content: View>: View {
    public enum Style: Sendable, Equatable {
        case current
        case open
        case locked
    }

    private let style: Style
    private let tilt: Angle
    private let content: Content

    public init(_ style: Style, tilt: Angle = .zero, @ViewBuilder content: () -> Content) {
        self.style = style
        self.tilt = tilt
        self.content = content()
    }

    public var body: some View {
        content
            .frame(width: PaperMetrics.journeyDisc, height: PaperMetrics.journeyDisc)
            .paperSurface(fill, shadow: shadow, cornerRadius: Tokens.Radius.tileL)
            .overlay(alignment: .bottomTrailing) {
                if style == .locked {
                    PaperIconView(.lock, size: PaperMetrics.journeyBadgeGlyph, color: Tokens.Role.textSecondary)
                        .frame(width: PaperMetrics.journeyBadge, height: PaperMetrics.journeyBadge)
                        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.stamp, in: Circle())
                        .offset(x: PaperMetrics.journeyBadgeOffset, y: PaperMetrics.journeyBadgeOffset)
                }
            }
            .rotationEffect(tilt)
            .accessibilityHidden(true)
    }

    private var fill: Color {
        style == .locked ? Tokens.Role.surfaceInactive : Tokens.Role.surfacePaper
    }

    private var shadow: Tokens.Shadow {
        switch style {
        case .current: Tokens.Shadow.offsetAccent
        case .open: Tokens.Shadow.paper3
        case .locked: Tokens.Shadow.paper2
        }
    }

    /// Tilt of the stop at `index` on the journey, from the canvas's sequence.
    public static func tilt(at index: Int) -> Angle {
        let tilts = PaperMetrics.journeyTilts
        return .degrees(tilts[((index % tilts.count) + tilts.count) % tilts.count])
    }

    /// Left indent of the stop at `index`: 0, 44, 88, 44, 0, 44… (the canvas zig-zag).
    public static func indent(at index: Int) -> CGFloat {
        let steps: [CGFloat] = [0, 1, 2, 1]
        return steps[index % steps.count] * PaperMetrics.journeyIndentStep
    }
}

/// The round play button of style E (Home "Bắt đầu bài 1", the open lesson row): a đỏ son disc
/// over a deeper one 6/64 lower, a paper triangle. Only the look; put it in a `Button` (or in a
/// row that is one) and give that the label.
public struct PaperPlayDisc: View {
    private let size: CGFloat

    /// `size`: the box, `PaperMetrics.playDiscLarge` (64) or `.playDiscSmall` (52).
    public init(size: CGFloat = PaperMetrics.playDiscLarge) {
        self.size = size
    }

    public var body: some View {
        // Canvas 64 box: under disc centre (32, 35), face disc centre (32, 29), both r = 27.
        let unit = size / 64
        let disc = 54 * unit
        ZStack {
            Circle()
                .fill(Tokens.Role.actionPrimaryUnder)
                .frame(width: disc, height: disc)
                .position(x: 32 * unit, y: 35 * unit)
            Circle()
                .fill(Tokens.Role.actionPrimary)
                .frame(width: disc, height: disc)
                .position(x: 32 * unit, y: 29 * unit)
            PlayTriangle()
                .fill(Tokens.Role.textOnAccent)
        }
        .frame(width: size, height: size)
        // filter paperE on the canvas discs: a soft drop shadow, closest token paper_2.
        .paperDropShadow(Tokens.Shadow.paper2)
        .accessibilityHidden(true)
    }

    /// `M26 18.5l16 10.5-16 10.5z` in the 64 box (the top disc's centre is at y 29).
    private struct PlayTriangle: SwiftUI.Shape {
        func path(in rect: CGRect) -> Path {
            let s = rect.width / 64
            var path = Path()
            path.move(to: CGPoint(x: rect.minX + 26 * s, y: rect.minY + 18.5 * s))
            path.addLine(to: CGPoint(x: rect.minX + 42 * s, y: rect.minY + 29 * s))
            path.addLine(to: CGPoint(x: rect.minX + 26 * s, y: rect.minY + 39.5 * s))
            path.closeSubpath()
            return path
        }
    }
}
