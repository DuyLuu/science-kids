import Foundation
import SwiftUI

/// Sizes a screen needs for its width (technical-plan B7.10, SK-008), all from `Tokens.Layout`.
///
/// - **Compact** (iPhone, iPad Split View 1/3, Slide Over): the phone layout. The frame is the
///   whole width minus the screen margins (390 → 350); content fills it.
/// - **Regular** (iPad portrait and landscape, Split View 1/2): Học, Chơi, Quiz sit in a paper
///   frame at most `layout.paper_frame_max` (600) wide, centred, with its own padding (600 → 544).
///   Grids keep the phone's column count with bigger cells.
///
/// The width class follows the size class the system reports, never the device or orientation.
/// Touch targets follow the age group and never shrink on iPad.
public struct LayoutMetrics: Sendable, Equatable {
    public enum WidthClass: Sendable, Equatable {
        case compact
        case regular
    }

    public let widthClass: WidthClass
    /// Width of the container the screen is laid out in, pt.
    public let containerWidth: CGFloat
    public let ageGroup: Tokens.AgeGroup

    /// `horizontalSizeClass` from the environment; `nil` (unknown) is treated as compact.
    public init(
        horizontalSizeClass: UserInterfaceSizeClass?,
        containerWidth: CGFloat,
        ageGroup: Tokens.AgeGroup = .discoverer
    ) {
        self.init(
            widthClass: horizontalSizeClass == .regular ? .regular : .compact,
            containerWidth: containerWidth,
            ageGroup: ageGroup
        )
    }

    public init(widthClass: WidthClass, containerWidth: CGFloat, ageGroup: Tokens.AgeGroup = .discoverer) {
        self.widthClass = widthClass
        self.containerWidth = max(containerWidth, 0)
        self.ageGroup = ageGroup
    }

    /// The phone design frame (`layout.frame_width`), used until a real width is known.
    public static let phone = LayoutMetrics(widthClass: .compact, containerWidth: Tokens.Layout.frameWidth)

    public var isRegular: Bool { widthClass == .regular }

    // MARK: - Frame

    /// Compact: container minus the screen margins. Regular: the paper frame, at most 600.
    public var frameWidth: CGFloat {
        switch widthClass {
        case .compact: max(containerWidth - 2 * Tokens.Layout.screenPaddingX, 0)
        case .regular: min(Tokens.Layout.paperFrameMax, containerWidth)
        }
    }

    /// Left edge of the frame in the container (the frame is centred in regular width).
    public var frameMinX: CGFloat {
        switch widthClass {
        case .compact: Tokens.Layout.screenPaddingX
        case .regular: (containerWidth - frameWidth) / 2
        }
    }

    /// Whether the screen draws the paper frame (with its side shadows) behind the content.
    public var drawsPaperFrame: Bool { isRegular }

    /// Width left for content inside the frame: 350 on a 390 phone, 544 in the 600 frame.
    public var contentWidth: CGFloat {
        switch widthClass {
        case .compact: frameWidth
        case .regular: max(frameWidth - 2 * Tokens.Layout.paperFramePaddingX, 0)
        }
    }

    /// Padding from the frame edge to the content (compact: the screen margins).
    public var contentInsets: EdgeInsets {
        switch widthClass {
        case .compact:
            EdgeInsets(
                top: Tokens.Layout.screenPaddingTop,
                leading: Tokens.Layout.screenPaddingX,
                bottom: Tokens.Layout.screenPaddingBottom,
                trailing: Tokens.Layout.screenPaddingX
            )
        case .regular:
            EdgeInsets(
                top: Tokens.Layout.paperFramePaddingY,
                leading: Tokens.Layout.paperFramePaddingX,
                bottom: Tokens.Layout.paperFramePaddingY,
                trailing: Tokens.Layout.paperFramePaddingX
            )
        }
    }

    /// Gap between the main blocks of a screen.
    public var sectionGap: CGFloat {
        isRegular ? Tokens.Layout.paperFrameSectionGap : Tokens.Layout.sectionGap
    }

    // MARK: - Grids

    public var quizGrid: Tokens.GridSpec { isRegular ? Tokens.Layout.Grid.Quiz.regular : Tokens.Layout.Grid.Quiz.compact }
    public var playGrid: Tokens.GridSpec { isRegular ? Tokens.Layout.Grid.Play.regular : Tokens.Layout.Grid.Play.compact }
    public var foodGroupGrid: Tokens.GridSpec {
        isRegular ? Tokens.Layout.Grid.FoodGroup.regular : Tokens.Layout.Grid.FoodGroup.compact
    }

    /// Room a grid keeps on its trailing edge for the offset ring of a selected cell
    /// (canvas `padding-right: 5px` = x of `shadow.offset_accent`).
    public var gridTrailingInset: CGFloat {
        Tokens.Shadow.offsetAccent.layers.map(\.x).max() ?? 0
    }

    /// Width of one cell of `grid` in `contentWidth`.
    public func cellWidth(for grid: Tokens.GridSpec) -> CGFloat {
        let columns = CGFloat(max(grid.columns, 1))
        let gaps = (columns - 1) * grid.columnGap
        return max((contentWidth - gridTrailingInset - gaps) / columns, 0)
    }

    /// `LazyVGrid` columns for `grid`; pair with `spacing: grid.rowGap` and
    /// `.padding(.trailing, gridTrailingInset)`.
    public func gridColumns(for grid: Tokens.GridSpec) -> [GridItem] {
        Array(
            repeating: GridItem(.flexible(), spacing: grid.columnGap, alignment: .top),
            count: max(grid.columns, 1)
        )
    }

    // MARK: - Tray (Chơi)

    public var trayWidth: CGFloat { isRegular ? Tokens.Layout.Tray.widthRegular : Tokens.Layout.Tray.widthCompact }
    public var trayHeight: CGFloat { isRegular ? Tokens.Layout.Tray.heightRegular : Tokens.Layout.Tray.heightCompact }
    public var traySlot: CGFloat { isRegular ? Tokens.Layout.Tray.slotRegular : Tokens.Layout.Tray.slotCompact }

    // MARK: - Age group

    /// Minimum touch target of the age group (72 / 56 / 48), the same in every width.
    public var touchTarget: CGFloat { ageGroup.touchTarget }
    /// Corner radius of the age group's paper pieces.
    public var radius: CGFloat { ageGroup.radius }

    /// Largest scale for illustrations: 1 on the phone, `layout.illustration_max_scale` in the frame.
    public var illustrationMaxScale: CGFloat { isRegular ? Tokens.Layout.illustrationMaxScale : 1 }

    /// Size of a picture drawn `phoneSize` on the phone: `illustrationMaxScale` times bigger in
    /// the frame (SK-013: Học, Chơi, Quiz art).
    public func illustration(_ phoneSize: CGFloat) -> CGFloat {
        phoneSize * illustrationMaxScale
    }

    // MARK: - Home (SK-013)

    /// Regular width: Trang chủ in two columns, the paper sidebar (navigation and journey) at
    /// `layout.home_sidebar_a` (layout A, Duy 29/10) and the content column. `nil` in compact: the
    /// phone Home with its bottom strip.
    public var homeSidebarWidth: CGFloat? {
        isRegular ? min(Tokens.Layout.homeSidebarA, containerWidth / 2) : nil
    }

    /// Width of Trang chủ's content column (beside the sidebar in regular, the whole width in compact).
    public var homeColumnWidth: CGFloat {
        containerWidth - (homeSidebarWidth ?? 0)
    }
}

extension EnvironmentValues {
    /// Layout of the current screen. Set once near the root with `.layoutMetricsFromContainer()`.
    public var layoutMetrics: LayoutMetrics {
        get { self[LayoutMetricsKey.self] }
        set { self[LayoutMetricsKey.self] = newValue }
    }

    /// Age group of the child using the app (default Discoverer, the pilot).
    public var ageGroup: Tokens.AgeGroup {
        get { self[AgeGroupKey.self] }
        set { self[AgeGroupKey.self] = newValue }
    }
}

private struct LayoutMetricsKey: EnvironmentKey {
    static let defaultValue = LayoutMetrics.phone
}

private struct AgeGroupKey: EnvironmentKey {
    static let defaultValue = Tokens.AgeGroup.discoverer
}

extension View {
    /// Measures the width this view gets, reads `horizontalSizeClass` and `ageGroup`, and puts a
    /// `LayoutMetrics` in the environment for everything inside. Use once per window, at the root.
    public func layoutMetricsFromContainer() -> some View {
        modifier(LayoutMetricsReader())
    }
}

private struct LayoutMetricsReader: ViewModifier {
    @Environment(\.horizontalSizeClass) private var sizeClass
    @Environment(\.ageGroup) private var ageGroup

    func body(content: Content) -> some View {
        GeometryReader { proxy in
            content
                .frame(width: proxy.size.width, height: proxy.size.height)
                .environment(
                    \.layoutMetrics,
                    LayoutMetrics(horizontalSizeClass: sizeClass, containerWidth: proxy.size.width, ageGroup: ageGroup)
                )
        }
    }
}
