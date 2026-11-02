import Foundation
import SwiftUI

/// Round icon-only button on a paper disc (back, close, "Nghe câu hỏi"). The touch target is the
/// age group's (56 for Discoverer), the disc 50 inside it. `accessibilityLabel` is required,
/// because the button has no visible text.
///
/// ```swift
/// PaperIconButton(.speaker, accessibilityLabel: Text("quiz.listen"), disc: .screen) { play() }
/// ```
public struct PaperIconButton: View {
    /// Colour of the disc: `.paper` on the screen background, `.screen` on a paper sheet.
    public enum Disc: Sendable {
        case paper
        case screen

        var fill: Color {
            switch self {
            case .paper: Tokens.Role.surfacePaper
            case .screen: Tokens.Role.bgScreen
            }
        }
    }

    private let icon: PaperIcon
    private let label: Text
    private let disc: Disc
    private let action: () -> Void

    public init(_ icon: PaperIcon, accessibilityLabel: Text, disc: Disc = .paper, action: @escaping () -> Void) {
        self.icon = icon
        self.label = accessibilityLabel
        self.disc = disc
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            DiscFace(icon: icon, fill: disc.fill)
        }
        .buttonStyle(.paperPress)
        .accessibilityLabel(label)
    }

    private struct DiscFace: View {
        let icon: PaperIcon
        let fill: Color
        @Environment(\.ageGroup) private var ageGroup

        var body: some View {
            let glyph = icon == .close ? PaperMetrics.closeGlyphSize : PaperMetrics.iconGlyphSize
            PaperIconView(icon, size: glyph)
                .frame(width: PaperMetrics.iconDiscDiameter, height: PaperMetrics.iconDiscDiameter)
                // filter paperE on the canvas disc: a soft drop shadow, closest token paper_2.
                .paperSurface(fill, shadow: Tokens.Shadow.paper2, in: Circle())
                .frame(width: ageGroup.touchTarget, height: ageGroup.touchTarget)
                .contentShape(Rectangle())
        }
    }
}
