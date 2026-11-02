import Foundation
import SwiftUI

/// A sheet of paper holding content.
///
/// - `.paper`: bright paper (`surface_paper`) lifted off the screen by `shadow.paper_3`
///   (card, hint, answer cell).
/// - `.sunken`: a well pressed into the screen (`surface_sunken` + inset `shadow.sunken`):
///   group of toggle buttons, empty card slot, input well.
/// - `.inactive`: dull paper (`surface_inactive`, giấy lõm) for a locked tile or a step not reached,
///   with the light `shadow.paper_2`.
///
/// The corner radius follows the age group (Discoverer 10) unless given.
public enum PaperCardStyle: Sendable, CaseIterable {
    case paper
    case sunken
    case inactive

    public var fill: Color {
        switch self {
        case .paper: Tokens.Role.surfacePaper
        case .sunken: Tokens.Role.surfaceSunken
        case .inactive: Tokens.Role.surfaceInactive
        }
    }

    public var shadow: Tokens.Shadow {
        switch self {
        case .paper: Tokens.Shadow.paper3
        case .sunken: Tokens.Shadow.sunken
        case .inactive: Tokens.Shadow.paper2
        }
    }
}

/// A sheet of paper holding content, in one of the `PaperCardStyle`s.
public struct PaperCard<Content: View>: View {
    public typealias Style = PaperCardStyle

    private let style: Style
    private let padding: EdgeInsets
    private let cornerRadius: CGFloat?
    private let content: Content
    @Environment(\.ageGroup) private var ageGroup

    public init(
        _ style: Style = .paper,
        padding: EdgeInsets = EdgeInsets(
            top: Tokens.Space.s12, leading: Tokens.Space.s14, bottom: Tokens.Space.s12, trailing: Tokens.Space.s14
        ),
        cornerRadius: CGFloat? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.style = style
        self.padding = padding
        self.cornerRadius = cornerRadius
        self.content = content()
    }

    public var body: some View {
        content
            .padding(padding)
            .foregroundStyle(Tokens.Role.textPrimary)
            .paperSurface(style.fill, shadow: style.shadow, cornerRadius: cornerRadius ?? ageGroup.radius)
    }
}
