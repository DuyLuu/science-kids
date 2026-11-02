import SwiftUI
import Testing
@testable import DesignSystem

/// SK-008: `LayoutMetrics` from size class and real width (technical-plan B7.10).
@MainActor
struct LayoutMetricsTests {
    @Test("Compact 390: frame = width minus the screen margins, phone grids")
    func compactPhone() {
        let m = LayoutMetrics(horizontalSizeClass: .compact, containerWidth: 390)
        #expect(m.widthClass == .compact)
        #expect(m.frameWidth == 390 - 2 * Tokens.Layout.screenPaddingX)
        #expect(m.frameWidth == 350)
        #expect(m.frameMinX == 20)
        #expect(m.contentWidth == 350)
        #expect(m.contentWidth == Tokens.Layout.Tray.widthCompact)
        #expect(!m.drawsPaperFrame)
        #expect(m.contentInsets == EdgeInsets(top: 18, leading: 20, bottom: 22, trailing: 20))
        #expect(m.sectionGap == Tokens.Layout.sectionGap)
        #expect(m.quizGrid == Tokens.Layout.Grid.Quiz.compact)
        #expect(m.playGrid == Tokens.Layout.Grid.Play.compact)
        #expect(m.foodGroupGrid == Tokens.Layout.Grid.FoodGroup.compact)
        #expect(m.traySlot == Tokens.Layout.Tray.slotCompact)
        #expect(m.illustrationMaxScale == 1)
    }

    @Test("Regular 834 and 1194: frame 600, centred", arguments: [834.0, 1194.0])
    func regularIPad(width: Double) {
        let m = LayoutMetrics(horizontalSizeClass: .regular, containerWidth: CGFloat(width))
        #expect(m.widthClass == .regular)
        #expect(m.frameWidth == 600)
        #expect(m.frameWidth == Tokens.Layout.paperFrameMax)
        #expect(m.frameMinX == (CGFloat(width) - 600) / 2)
        #expect(m.frameMinX + m.frameWidth / 2 == CGFloat(width) / 2, "centred")
        #expect(m.contentWidth == 600 - 2 * Tokens.Layout.paperFramePaddingX)
        #expect(m.contentWidth == Tokens.Layout.Tray.widthRegular)
        #expect(m.drawsPaperFrame)
        #expect(m.contentInsets == EdgeInsets(top: 32, leading: 28, bottom: 32, trailing: 28))
        #expect(m.sectionGap == Tokens.Layout.paperFrameSectionGap)
        #expect(m.quizGrid == Tokens.Layout.Grid.Quiz.regular)
        #expect(m.quizGrid.columns == 3)
        #expect(m.quizGrid.cellHeight == 150)
        #expect(m.playGrid == Tokens.Layout.Grid.Play.regular)
        #expect(m.playGrid.columns == 4)
        #expect(m.traySlot == Tokens.Layout.Tray.slotRegular)
        #expect(m.illustrationMaxScale == Tokens.Layout.illustrationMaxScale)
    }

    @Test("Compact 320 (Split View 1/3, Slide Over): phone layout")
    func compactSplitView() {
        let m = LayoutMetrics(horizontalSizeClass: .compact, containerWidth: 320)
        #expect(m.widthClass == .compact)
        #expect(!m.drawsPaperFrame)
        #expect(m.frameWidth == 280)
        #expect(m.contentWidth == 280)
        #expect(m.quizGrid == Tokens.Layout.Grid.Quiz.compact)
        #expect(m.playGrid == Tokens.Layout.Grid.Play.compact)
        #expect(m.contentInsets == LayoutMetrics(horizontalSizeClass: .compact, containerWidth: 390).contentInsets)
    }

    @Test("The size class decides, not the width: wide compact stays phone, unknown is compact")
    func sizeClassDecides() {
        let wideCompact = LayoutMetrics(horizontalSizeClass: .compact, containerWidth: 1194)
        #expect(wideCompact.widthClass == .compact)
        #expect(wideCompact.frameWidth == CGFloat(1194 - 40))
        let unknown = LayoutMetrics(horizontalSizeClass: nil, containerWidth: 834)
        #expect(unknown.widthClass == .compact)
        // iPad mini portrait (SK-013) and a narrow regular window keep the frame inside the width.
        #expect(LayoutMetrics(horizontalSizeClass: .regular, containerWidth: 744).frameWidth == 600)
        #expect(LayoutMetrics(horizontalSizeClass: .regular, containerWidth: 560).frameWidth == 560)
    }

    @Test(
        "Touch target per age group, the same at every width",
        arguments: [(Tokens.AgeGroup.discoverer, 56.0), (.explorer, 72.0), (.scientist, 48.0)]
    )
    func touchTarget(group: Tokens.AgeGroup, expected: Double) {
        for (sizeClass, width) in [(UserInterfaceSizeClass.compact, 320.0), (.compact, 390), (.regular, 834), (.regular, 1194)] {
            let m = LayoutMetrics(horizontalSizeClass: sizeClass, containerWidth: CGFloat(width), ageGroup: group)
            #expect(m.touchTarget == CGFloat(expected), "\(group) at \(width)")
            #expect(m.radius == group.radius)
        }
    }

    @Test("Grid cell width leaves room for the selected ring on the trailing edge")
    func cellWidth() {
        let phone = LayoutMetrics(horizontalSizeClass: .compact, containerWidth: 390)
        #expect(phone.gridTrailingInset == 5)
        // (350 − 5 − 2 × 10) / 3
        #expect(abs(phone.cellWidth(for: phone.quizGrid) - 325.0 / 3) < 0.001)
        #expect(phone.gridColumns(for: phone.quizGrid).count == 3)
        #expect(phone.gridColumns(for: phone.playGrid).count == 4)
        let pad = LayoutMetrics(horizontalSizeClass: .regular, containerWidth: 834)
        // (544 − 5 − 2 × 12) / 3
        #expect(abs(pad.cellWidth(for: pad.quizGrid) - 515.0 / 3) < 0.001)
        // Cells never get narrower than the touch target in either width.
        #expect(phone.cellWidth(for: phone.playGrid) >= phone.touchTarget)
        #expect(pad.cellWidth(for: pad.playGrid) >= pad.touchTarget)
    }

    /// SK-013 acceptance: the four widths of the ticket. Heights do not change the layout (the size
    /// class and the width decide), so 834 × 1194 and 1194 × 834 differ only by width.
    @Test(
        "SK-013 widths: frame, columns, cells, tray, sidebar",
        arguments: [
            (UserInterfaceSizeClass.regular, 834.0, "iPad Pro 11 portrait 834×1194"),
            (.regular, 1194.0, "iPad Pro 11 landscape 1194×834"),
            (.regular, 744.0, "iPad mini portrait 744×1133"),
            (.compact, 320.0, "Split View 1/3 or Slide Over 320"),
        ]
    )
    func ticketWidths(sizeClass: UserInterfaceSizeClass, width: Double, name: String) {
        let m = LayoutMetrics(horizontalSizeClass: sizeClass, containerWidth: CGFloat(width))
        if sizeClass == .regular {
            #expect(m.frameWidth == 600, "\(name): paper frame ≤ 600")
            #expect(m.frameMinX == (CGFloat(width) - 600) / 2, "\(name): centred")
            #expect(m.contentWidth == 544, "\(name)")
            #expect(m.drawsPaperFrame)
            #expect(m.quizGrid.columns == 3 && m.quizGrid.cellHeight == 150, "\(name): Quiz 3 × 2, cell 104 → 150")
            #expect(m.playGrid.columns == 4 && m.playGrid.cellHeight == 124, "\(name): Chơi 4 × 2, cell 96 → 124")
            #expect(m.foodGroupGrid.columns == 2, "\(name): nhóm chất 2 × 2")
            #expect(m.trayWidth == 544, "\(name): mâm 544")
            #expect(m.traySlot == 96, "\(name): chỗ trong mâm 70 → 96")
            #expect(m.illustration(76) == 76 * 1.5, "\(name): pictures at most 1.5×")
            #expect(m.homeSidebarWidth == 340, "\(name): Trang chủ layout A, sidebar 340")
            #expect(m.homeColumnWidth == CGFloat(width) - 340)
            // Cells as wide as the frame allows: (544 − 5 − gaps) / columns.
            #expect(abs(m.cellWidth(for: m.quizGrid) - (544 - 5 - 2 * 12) / 3) < 0.001)
            #expect(abs(m.cellWidth(for: m.playGrid) - (544 - 5 - 3 * 12) / 4) < 0.001)
        } else {
            #expect(m.frameWidth == 280, "\(name): phone layout, 320 − 2 × 20")
            #expect(!m.drawsPaperFrame)
            #expect(m.quizGrid.columns == 3 && m.quizGrid.cellHeight == 104, "\(name)")
            #expect(m.playGrid.columns == 4 && m.playGrid.cellHeight == 96, "\(name)")
            #expect(m.traySlot == 70, "\(name)")
            #expect(m.illustration(76) == 76, "\(name): phone pictures")
            #expect(m.homeSidebarWidth == nil, "\(name): Trang chủ with the bottom strip")
            #expect(m.homeColumnWidth == CGFloat(width))
        }
        #expect(m.touchTarget == 56, "\(name): never smaller than 56")
        #expect(m.cellWidth(for: m.playGrid) >= m.touchTarget, "\(name)")
    }

    @Test("Environment default is the phone design frame")
    func environmentDefault() {
        #expect(EnvironmentValues().layoutMetrics == .phone)
        #expect(LayoutMetrics.phone.containerWidth == Tokens.Layout.frameWidth)
        #expect(EnvironmentValues().ageGroup == .discoverer)
    }
}
