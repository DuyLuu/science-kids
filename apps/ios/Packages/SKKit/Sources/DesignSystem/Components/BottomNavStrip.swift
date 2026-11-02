import Foundation
import SwiftUI

/// One tab of a `BottomNavStrip`.
public struct BottomNavItem<ID: Hashable & Sendable>: Identifiable {
    public let id: ID
    public let icon: PaperIcon
    public let title: Text

    public init(id: ID, icon: PaperIcon, title: Text) {
        self.id = id
        self.icon = icon
        self.title = title
    }
}

/// Bottom navigation of style E (canvas Home): a strip of bright paper with a torn top edge
/// (`shape.torn_edge_top`, `shadow.drop_sheet_up`), equal columns, the current tab's icon on a
/// vàng hoè chip. Each tab is a `Button` at least `navItemMinHeight` (58) tall, marked selected
/// for VoiceOver. Put it at the bottom with `.safeAreaInset(edge: .bottom)`; the paper runs into
/// the home indicator area.
public struct BottomNavStrip<ID: Hashable & Sendable>: View {
    private let items: [BottomNavItem<ID>]
    @Binding private var selection: ID
    private let label: Text

    public init(items: [BottomNavItem<ID>], selection: Binding<ID>, accessibilityLabel: Text) {
        self.items = items
        _selection = selection
        label = accessibilityLabel
    }

    public var body: some View {
        HStack(spacing: 0) {
            ForEach(items) { item in
                let isCurrent = item.id == selection
                Button {
                    selection = item.id
                } label: {
                    VStack(spacing: Tokens.Space.s4) {
                        PaperIconView(item.icon, size: PaperMetrics.iconGlyphSize, color: Tokens.Role.textPrimary)
                            .frame(width: PaperMetrics.navChipWidth, height: PaperMetrics.navChipHeight)
                            .paperSurface(
                                isCurrent ? Tokens.Role.stateCurrent : .clear,
                                shadow: isCurrent ? Tokens.Shadow.paper2 : nil,
                                cornerRadius: Tokens.Radius.tag
                            )
                        item.title
                            .typography(Tokens.Typography.captionS, fixedBox: true)
                            .foregroundStyle(isCurrent ? Tokens.Role.textPrimary : Tokens.Role.textSecondary)
                            .lineLimit(1)
                            .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                    }
                    .frame(maxWidth: .infinity, minHeight: PaperMetrics.navItemMinHeight)
                }
                .buttonStyle(.paperPress)
                .accessibilityAddTraits(isCurrent ? .isSelected : [])
                .accessibilityIdentifier("tab.\(String(describing: item.id))")
            }
        }
        .padding(PaperMetrics.navPadding)
        .background {
            TornEdgeTopShape()
                .fill(Tokens.Role.surfacePaper)
                .paperShadow(Tokens.Shadow.dropSheetUp, in: TornEdgeTopShape())
                .ignoresSafeArea(edges: .bottom)
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel(label)
    }
}
