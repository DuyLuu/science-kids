import Foundation
import SwiftUI

/// Stand-in for a content picture with no picture in the pack (SK-012; SK-033: screens draw
/// `ContentPicture`, which shows the pack's picture when `Image.asset` is in it, else this):
/// a tilted piece of paper in the group's colour with a small paper disc on it. With no colour
/// (a quiz option, which has no group; a Chơi shelf item, whose group must not show before the
/// pick, SK-031) the piece is giấy lõm. VoiceOver reads `accessibilityLabel`
/// (the picture's `alt`); without one the art is decorative.
public struct PlaceholderArt: View {
    private let color: Color?
    private let size: CGFloat
    private let label: Text?

    public init(color: Color?, size: CGFloat, accessibilityLabel: Text? = nil) {
        self.color = color
        self.size = size
        self.label = accessibilityLabel
    }

    public var body: some View {
        let art = ZStack {
            RoundedRectangle(cornerRadius: Tokens.Radius.tileL, style: .continuous)
                .fill(color ?? Tokens.Role.surfaceInactive)
                .frame(width: size * PaperMetrics.placeholderPiece, height: size * PaperMetrics.placeholderPiece)
                .rotationEffect(PaperMetrics.placeholderTilt)
            Circle()
                .fill(Tokens.Role.surfacePaper)
                .frame(width: size * PaperMetrics.placeholderDisc, height: size * PaperMetrics.placeholderDisc)
                .offset(x: size * PaperMetrics.placeholderDiscOffset, y: -size * PaperMetrics.placeholderDiscOffset)
        }
        .frame(width: size, height: size)
        .paperDropShadow(Tokens.Shadow.paper1)
        if let label {
            art
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(label)
                .accessibilityAddTraits(.isImage)
        } else {
            art.accessibilityHidden(true)
        }
    }
}

/// A sheet of bright paper with a hand-torn top edge (`shape.torn_edge_top`): the question sheet
/// (`shadow.drop_sheet`) and, `rising: true`, the result sheet that slides up from the bottom
/// (`shadow.drop_sheet_up`). Content padding is the canvas's `16px 14px 14px 16px`.
public struct TornSheet<Content: View>: View {
    private let rising: Bool
    private let padding: EdgeInsets
    private let content: Content

    public init(
        rising: Bool = false,
        padding: EdgeInsets = PaperMetrics.sheetPadding,
        @ViewBuilder content: () -> Content
    ) {
        self.rising = rising
        self.padding = padding
        self.content = content()
    }

    public var body: some View {
        content
            .foregroundStyle(Tokens.Role.textPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(padding)
            .background {
                TornEdgeTopShape()
                    .fill(Tokens.Role.surfacePaper)
                    .paperShadow(rising ? Tokens.Shadow.dropSheetUp : Tokens.Shadow.dropSheet, in: TornEdgeTopShape())
                    // A rising sheet sits at the bottom: its paper runs on into the home indicator area.
                    .ignoresSafeArea(edges: rising ? .bottom : [])
            }
    }
}
