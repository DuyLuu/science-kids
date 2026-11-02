import Foundation
import SwiftUI

/// Role of a paper button.
public enum PaperButtonRole: Sendable, CaseIterable {
    /// Main action ("Kiểm tra", "Tiếp"): two layers of paper, the đỏ son face over a deeper
    /// layer 7pt lower (`shadow.button_under`). Full width.
    case primary
    /// Other actions ("Gợi ý"): one sheet of bright paper with `shadow.paper_3`. The canvas has no
    /// two-layer secondary button, so this one follows the canvas, not the name.
    case secondary
}

/// The paper button of style E. Pressing moves it down 3pt (`press`); disabled turns it to
/// giấy lõm with the disabled lower layer. It is a real `Button`, at least the age group's touch
/// target tall.
///
/// ```swift
/// TwoLayerButton("lesson.check") { check() }                       // LocalizedStringKey
/// TwoLayerButton("lesson.next", icon: .arrowForward) { next() }
/// TwoLayerButton("quiz.hint", role: .secondary) { showHint() }
/// TwoLayerButton(role: .primary, action: retry) { Label… }         // any label
/// ```
public struct TwoLayerButton<Label: View>: View {
    private let role: PaperButtonRole
    private let action: () -> Void
    private let label: Label

    public init(role: PaperButtonRole = .primary, action: @escaping () -> Void, @ViewBuilder label: () -> Label) {
        self.role = role
        self.action = action
        self.label = label()
    }

    public var body: some View {
        Button(action: action) { label }
            .buttonStyle(TwoLayerButtonStyle(role: role))
    }
}

extension TwoLayerButton where Label == PaperButtonLabel {
    /// Title from the app's string catalog, with an optional icon after it.
    public init(_ titleKey: LocalizedStringKey, role: PaperButtonRole = .primary, icon: PaperIcon? = nil, action: @escaping () -> Void) {
        self.init(role: role, action: action) { PaperButtonLabel(Text(titleKey), icon: icon, leadingIcon: icon == .retry) }
    }

    /// Title shown as is (content strings, debug screens). Disfavoured, like SwiftUI's `Text`, so a
    /// string literal (`TwoLayerButton("welcome.next")`) is a catalog key, not shown verbatim (SK-011).
    @_disfavoredOverload
    public init<S: StringProtocol>(_ title: S, role: PaperButtonRole = .primary, icon: PaperIcon? = nil, action: @escaping () -> Void) {
        self.init(role: role, action: action) { PaperButtonLabel(Text(title), icon: icon, leadingIcon: icon == .retry) }
    }
}

/// Title plus optional icon, as on the canvas ("Tiếp →", "↻ Thử lại").
public struct PaperButtonLabel: View {
    private let title: Text
    private let icon: PaperIcon?
    private let leadingIcon: Bool

    public init(_ title: Text, icon: PaperIcon? = nil, leadingIcon: Bool = false) {
        self.title = title
        self.icon = icon
        self.leadingIcon = leadingIcon
    }

    public var body: some View {
        HStack(spacing: PaperMetrics.buttonIconGap) {
            if leadingIcon, let icon { IconInLabel(icon: icon) }
            title
            if !leadingIcon, let icon { IconInLabel(icon: icon) }
        }
    }
}

/// Icon drawn in the label's foreground colour.
private struct IconInLabel: View {
    let icon: PaperIcon
    @Environment(\.paperButtonForeground) private var foreground

    var body: some View {
        PaperIconView(icon, color: foreground)
    }
}

/// Draws a `TwoLayerButton`. Usable on its own with `.buttonStyle(TwoLayerButtonStyle(role:))`.
public struct TwoLayerButtonStyle: ButtonStyle {
    private let role: PaperButtonRole

    public init(role: PaperButtonRole = .primary) {
        self.role = role
    }

    public func makeBody(configuration: Configuration) -> some View {
        StyledFace(role: role, isPressed: configuration.isPressed) { configuration.label }
    }

    private struct StyledFace<L: View>: View {
        let role: PaperButtonRole
        let isPressed: Bool
        @ViewBuilder let label: L
        @Environment(\.isEnabled) private var isEnabled

        var body: some View {
            TwoLayerButtonFace(role: role, isPressed: isPressed, isEnabled: isEnabled) { label }
        }
    }
}

/// The look of a paper button for a given state, without the button. The gallery uses it to show
/// the pressed state still; screens use `TwoLayerButton`.
public struct TwoLayerButtonFace<Label: View>: View {
    private let role: PaperButtonRole
    private let isPressed: Bool
    private let isEnabled: Bool
    private let label: Label
    @Environment(\.ageGroup) private var ageGroup

    public init(role: PaperButtonRole, isPressed: Bool, isEnabled: Bool, @ViewBuilder label: () -> Label) {
        self.role = role
        self.isPressed = isPressed
        self.isEnabled = isEnabled
        self.label = label()
    }

    public var body: some View {
        let shape = RoundedRectangle(cornerRadius: ageGroup.radius, style: .continuous)
        switch role {
        case .primary:
            label
                .typography(Tokens.Typography.button, fixedBox: true)
                .lineLimit(1)
                .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                .foregroundStyle(foreground)
                .environment(\.paperButtonForeground, foreground)
                .padding(.horizontal, PaperMetrics.buttonPaddingX)
                .frame(maxWidth: .infinity, minHeight: max(PaperMetrics.buttonFaceHeight, ageGroup.touchTarget))
                .paperSurface(face, in: shape)
                .paperShadow(isEnabled ? Tokens.Shadow.buttonUnder : Tokens.Shadow.buttonUnderDisabled, in: shape)
                .padding(.bottom, underOffset)
                .contentShape(Rectangle())
                .pressEffect(isPressed && isEnabled)
                .paperStateAnimation(value: isEnabled)
        case .secondary:
            label
                .typography(Tokens.Typography.buttonS, fixedBox: true)
                .lineLimit(1)
                .foregroundStyle(foreground)
                .environment(\.paperButtonForeground, foreground)
                .padding(.leading, Tokens.Space.s14)
                .padding(.trailing, Tokens.Space.s18)
                .frame(minWidth: ageGroup.touchTarget, minHeight: ageGroup.touchTarget)
                .paperSurface(face, shadow: isEnabled ? Tokens.Shadow.paper3 : nil, in: shape)
                .contentShape(Rectangle())
                .pressEffect(isPressed && isEnabled)
                .paperStateAnimation(value: isEnabled)
        }
    }

    private var face: Color {
        switch (role, isEnabled) {
        case (.primary, true): Tokens.Role.actionPrimary
        case (.secondary, true): Tokens.Role.surfacePaper
        case (_, false): Tokens.Role.actionDisabled
        }
    }

    private var foreground: Color {
        switch (role, isEnabled) {
        case (.primary, true): Tokens.Role.textOnAccent
        case (.secondary, true): Tokens.Role.textPrimary
        case (_, false): Tokens.Role.textOnDisabled
        }
    }

    /// The lower layer sticks out below the face by the solid layer's y offset (7pt).
    private var underOffset: CGFloat {
        Tokens.Shadow.buttonUnder.layers.first { $0.blur == 0 }?.y ?? 0
    }
}

extension EnvironmentValues {
    /// Foreground colour of the paper button being drawn, for icons in its label.
    var paperButtonForeground: Color {
        get { self[PaperButtonForegroundKey.self] }
        set { self[PaperButtonForegroundKey.self] = newValue }
    }
}

private struct PaperButtonForegroundKey: EnvironmentKey {
    static let defaultValue = Tokens.Role.textPrimary
}
