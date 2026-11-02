import DesignSystem
import SwiftUI

/// Header of a screen (canvas Profile, Topic): optional round back button, title and caption,
/// something on the trailing side (step squares).
struct ScreenHeader<Trailing: View>: View {
    struct Back {
        let label: Text
        let action: () -> Void
    }

    let back: Back?
    let title: Text
    let caption: Text?
    let titleIdentifier: String?
    @ViewBuilder let trailing: Trailing

    init(
        back: Back? = nil,
        title: Text,
        caption: Text? = nil,
        titleIdentifier: String? = nil,
        @ViewBuilder trailing: () -> Trailing = { EmptyView() }
    ) {
        self.back = back
        self.title = title
        self.caption = caption
        self.titleIdentifier = titleIdentifier
        self.trailing = trailing()
    }

    var body: some View {
        HStack(spacing: ScreenMetrics.headerGap) {
            if let back {
                PaperIconButton(.arrowBack, accessibilityLabel: back.label, action: back.action)
                    .accessibilityIdentifier("header.back")
            }
            VStack(alignment: .leading, spacing: ScreenMetrics.headerTextGap) {
                title
                    .typography(Tokens.Typography.title)
                    .fixedSize(horizontal: false, vertical: true)
                    .accessibilityAddTraits(.isHeader)
                    .accessibilityIdentifier(titleIdentifier ?? "header.title")
                if let caption {
                    caption
                        .typography(Tokens.Typography.caption)
                        .foregroundStyle(Tokens.Role.textSecondary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            trailing
        }
    }
}

/// A chip of the profile screen ("Lớp 3", "Chỉ tiếng Anh"): a flat slip (`radius.tag`), vàng hoè
/// when chosen, bright paper otherwise, pressed down while held. At least the touch target tall
/// (the canvas draws the grade chips 48pt; SK-011 raises them to 56).
struct PaperChipStyle: ButtonStyle {
    let isSelected: Bool
    @Environment(\.ageGroup) private var ageGroup

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(Tokens.Role.textPrimary)
            .multilineTextAlignment(.center)
            .padding(.horizontal, Tokens.Space.s4)
            .frame(maxWidth: .infinity, minHeight: ageGroup.touchTarget)
            .paperSurface(
                isSelected ? Tokens.Role.stateSelected : Tokens.Role.surfacePaper,
                shadow: Tokens.Shadow.paper2,
                cornerRadius: Tokens.Radius.tag
            )
            .contentShape(Rectangle())
            .pressEffect(configuration.isPressed)
            .paperStateAnimation(value: isSelected)
            .accessibilityAddTraits(isSelected ? .isSelected : [])
    }
}

/// The check seal on a chosen card (canvas: `top: -8px; right: -6px`), stamped in.
struct ChosenSeal: View {
    var body: some View {
        Seal(icon: .check)
            .offset(x: ScreenMetrics.sealOffset.width, y: ScreenMetrics.sealOffset.height)
            .allowsHitTesting(false)
    }
}
