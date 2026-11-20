import Foundation
import SwiftUI

/// Paper labels of style E.
///
/// - `.cut`: a label cut at the four corners (`shape.tag_chamfer`), tilted `shape.tilt_tag`, with
///   `shadow.drop_tag`; đỏ son by default (a recall label, a question instruction).
///   `.cut(eyebrow: true)` is the small upper-case version ("HỌC TIẾP · MIỄN PHÍ").
/// - `.chip(dot:)`: a small flat slip with a colour dot, for a food group
///   or a food, on `bg_screen` with `shadow.paper_1`.
/// - `.label`: a section label without paper, in `text_accent` ("Từ mới · New words").
///
/// ```swift
/// PaperTag("Nhớ lại · từ Year 2")
/// PaperTag(Text("home.continue"), style: .cut(eyebrow: true))
/// PaperTag("Chất đạm", style: .chip(dot: Tokens.Role.FoodGroup.protein))
/// PaperTag("Từ mới · New words", style: .label)
/// ```
public struct PaperTag: View {
    public enum Style: Sendable, Equatable {
        /// `text`: the letters' colour; on a content colour pass its `text_on_content` (SK-060).
        case cut(fill: Color = Tokens.Role.actionPrimary, text: Color = Tokens.Role.textOnAccent, eyebrow: Bool = false)
        case chip(dot: Color)
        case label
    }

    private let text: Text
    private let style: Style

    public init(_ text: Text, style: Style = .cut()) {
        self.text = text
        self.style = style
    }

    public init<S: StringProtocol>(_ text: S, style: Style = .cut()) {
        self.init(Text(text), style: style)
    }

    public var body: some View {
        switch style {
        case .cut(let fill, let ink, let eyebrow):
            text
                .typography(eyebrow ? Tokens.Typography.eyebrow : Tokens.Typography.label)
                .foregroundStyle(ink)
                .padding(.vertical, Tokens.Space.s4)
                .padding(.horizontal, Tokens.Space.s10)
                .background(ChamferShape().fill(fill))
                .paperShadow(Tokens.Shadow.dropTag, in: ChamferShape())
                .rotationEffect(Tokens.Shape.tiltTag)
        case .chip(let dot):
            HStack(spacing: Tokens.Space.s6) {
                Circle()
                    .fill(dot)
                    .frame(width: PaperMetrics.chipDot, height: PaperMetrics.chipDot)
                    .accessibilityHidden(true)
                text
                    // Canvas 13/700; the closest text role is caption 13/600.
                    .typography(Tokens.Typography.caption)
            }
            .foregroundStyle(Tokens.Role.textPrimary)
            .padding(.leading, Tokens.Space.s8)
            .padding(.trailing, Tokens.Space.s10)
            .frame(minHeight: PaperMetrics.chipHeight)
            .paperSurface(Tokens.Role.bgScreen, shadow: Tokens.Shadow.paper1, cornerRadius: Tokens.Radius.tag)
        case .label:
            text
                .typography(Tokens.Typography.label)
                .foregroundStyle(Tokens.Role.textAccent)
                .accessibilityAddTraits(.isHeader)
        }
    }
}
