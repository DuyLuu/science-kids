#if DEBUG
import DesignSystem
import SwiftUI

/// SK-008 debug gallery: every DesignSystem component in each of its states, the paper shadows,
/// the motion presets and the current `LayoutMetrics`. Open it with the launch argument
/// `-SKGallery YES` (Debug builds only). "Chạy lại motion" plays every motion again; with
/// Reduce Motion on it does nothing.
///
/// Sample strings are written as is (`Text(verbatim:)`, `String` constants): this screen is
/// compiled out of Release and is not part of the string catalog.
struct GalleryView: View {
    /// Section to scroll to on open (`-SKGalleryScrollTo`), one of `GallerySection` raw values.
    var scrollTarget: String?
    @State private var replayID = 0

    var body: some View {
        ScrollViewReader { proxy in
            PaperFrame(scrolls: true) {
                VStack(alignment: .leading, spacing: GalleryMetrics.sectionSpacing) {
                    GalleryHeader(replay: { replayID += 1 })
                        .reveal(order: 0)
                        .id(GallerySection.header)
                    ShadowSection().reveal(order: 1).id(GallerySection.shadows)
                    CardSection().reveal(order: 2).id(GallerySection.cards)
                    ButtonSection().reveal(order: 3).id(GallerySection.buttons)
                    SealTagSection().reveal(order: 4).id(GallerySection.tags)
                    ProgressSection().reveal(order: 5).id(GallerySection.progress)
                    ChoiceSection().reveal(order: 6).id(GallerySection.choices)
                    MotionSection(replay: { replayID += 1 }).reveal(order: 7).id(GallerySection.motion)
                }
            }
            .onAppear {
                if let target = scrollTarget.flatMap(GallerySection.init(rawValue:)), target != .header {
                    proxy.scrollTo(target, anchor: .top)
                }
            }
        }
        .environment(\.motionReplayID, replayID)
    }
}

enum GallerySection: String, CaseIterable, Hashable {
    case header, shadows, cards, buttons, tags, progress, choices, motion
}

/// Gallery-only sizes (demo swatches); components take theirs from Tokens and PaperMetrics.
enum GalleryMetrics {
    static let sectionSpacing = Tokens.Space.s28
    static let swatch: CGFloat = 64
    /// Room under a swatch for its deepest shadow (button_under: 7pt layer, then y 9 blur 6).
    static let swatchCaptionGap = Tokens.Space.s18
    static let motionStage: CGFloat = 96
    static let confetti = CGSize(width: 10, height: 16)
    static let flipHeight: CGFloat = 120
}

// MARK: - Header and metrics

private struct GalleryHeader: View {
    let replay: () -> Void
    @Environment(\.layoutMetrics) private var metrics
    @Environment(\.accessibilityReduceMotion) private var systemReduceMotion
    @Environment(\.reduceMotionOverride) private var appReduceMotion
    @Environment(\.horizontalSizeClass) private var sizeClass

    var body: some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s10) {
            Text(verbatim: "DesignSystem · SK-008")
                .typography(Tokens.Typography.title)
                .accessibilityAddTraits(.isHeader)
            Text(verbatim: metricsLine)
                .typography(Tokens.Typography.caption)
                .foregroundStyle(Tokens.Role.textSecondary)
                .accessibilityIdentifier("gallery.metrics")
            Text(verbatim: motionLine)
                .typography(Tokens.Typography.caption)
                .foregroundStyle(Tokens.Role.textSecondary)
                .accessibilityIdentifier("gallery.reduceMotion")
            TwoLayerButton(GallerySample.replay, role: .secondary, icon: .retry, action: replay)
                .accessibilityIdentifier("gallery.replay")
        }
    }

    private var metricsLine: String {
        let grid = metrics.quizGrid
        let widthClass = metrics.isRegular ? "regular" : "compact"
        let system = sizeClass == .regular ? "regular" : "compact"
        return "\(widthClass) (size class \(system)) · rộng \(format(metrics.containerWidth)) · "
            + "khung \(format(metrics.frameWidth)) · nội dung \(format(metrics.contentWidth)) · "
            + "Quiz \(grid.columns) cột × \(format(grid.cellHeight)) · chạm \(format(metrics.touchTarget))"
    }

    private var motionLine: String {
        let reduced = MotionPolicy.isReduced(system: systemReduceMotion, override: appReduceMotion)
        return "Giảm chuyển động: \(reduced ? "bật" : "tắt") "
            + "(hệ thống \(systemReduceMotion ? "bật" : "tắt"), app \(appReduceMotion ? "bật" : "tắt"))"
    }

    private func format(_ value: CGFloat) -> String {
        value.rounded() == value ? String(Int(value)) : String(format: "%.1f", value)
    }
}

private struct SectionTitle: View {
    let text: String

    var body: some View {
        Text(verbatim: text)
            .typography(Tokens.Typography.titleS)
            .accessibilityAddTraits(.isHeader)
    }
}

private struct Caption: View {
    let text: String

    var body: some View {
        Text(verbatim: text)
            .typography(Tokens.Typography.captionS)
            .foregroundStyle(Tokens.Role.textSecondary)
    }
}

// MARK: - Shadows

private struct ShadowSection: View {
    private let shadows: [(String, Tokens.Shadow)] = [
        ("paper_1", Tokens.Shadow.paper1), ("paper_2", Tokens.Shadow.paper2), ("paper_3", Tokens.Shadow.paper3),
        ("stamp", Tokens.Shadow.stamp), ("drop_tag", Tokens.Shadow.dropTag), ("drop_sheet", Tokens.Shadow.dropSheet),
        ("drop_fold", Tokens.Shadow.dropFold), ("drop_sheet_up", Tokens.Shadow.dropSheetUp),
        ("offset_accent", Tokens.Shadow.offsetAccent), ("offset_correct", Tokens.Shadow.offsetCorrect),
        ("offset_wrong", Tokens.Shadow.offsetWrong), ("button_under", Tokens.Shadow.buttonUnder),
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s12) {
            SectionTitle(text: "Bóng giấy · .paperShadow")
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: Tokens.Space.s16), count: 3), spacing: Tokens.Space.s20) {
                ForEach(shadows, id: \.0) { name, shadow in
                    VStack(spacing: GalleryMetrics.swatchCaptionGap) {
                        Color.clear
                            .frame(height: GalleryMetrics.swatch)
                            .paperSurface(Tokens.Role.surfacePaper, shadow: shadow, cornerRadius: Tokens.Radius.discoverer)
                        Caption(text: name)
                    }
                }
                ForEach([("sunken", Tokens.Shadow.sunken), ("sunken_s", Tokens.Shadow.sunkenS)], id: \.0) { name, shadow in
                    VStack(spacing: GalleryMetrics.swatchCaptionGap) {
                        Color.clear
                            .frame(height: GalleryMetrics.swatch)
                            .paperSurface(Tokens.Role.surfaceSunken, shadow: shadow, cornerRadius: Tokens.Radius.discoverer)
                        Caption(text: name)
                    }
                }
                VStack(spacing: Tokens.Space.s8) {
                    Color.clear
                        .frame(height: GalleryMetrics.swatch)
                        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.onDark, cornerRadius: Tokens.Radius.discoverer)
                        .padding(Tokens.Space.s8)
                        .background(Tokens.Palette.cham, in: RoundedRectangle(cornerRadius: Tokens.Radius.discoverer))
                    Caption(text: "on_dark")
                }
            }
            .padding(.trailing, metrics.gridTrailingInset)
        }
    }

    @Environment(\.layoutMetrics) private var metrics
}

// MARK: - Cards

private struct CardSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s12) {
            SectionTitle(text: "PaperCard")
            ForEach(PaperCardStyle.allCases, id: \.self) { style in
                PaperCard(style) {
                    VStack(alignment: .leading, spacing: Tokens.Space.s2) {
                        Text(verbatim: GallerySample.cardEN)
                            .typography(Tokens.Typography.bodyStrong)
                        Text(verbatim: "\(GallerySample.cardVI) · .\(String(describing: style))")
                            .typography(Tokens.Typography.bodyS)
                            .foregroundStyle(Tokens.Role.textSecondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

// MARK: - Buttons

private struct ButtonSection: View {
    @State private var taps = 0

    var body: some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s14) {
            SectionTitle(text: "TwoLayerButton · chính")
            TwoLayerButton(GallerySample.check) { taps += 1 }
            Caption(text: "thường · bấm thử để thấy lún 3pt")
            TwoLayerButtonFace(role: .primary, isPressed: true, isEnabled: true) { Text(verbatim: GallerySample.check) }
                .accessibilityElement(children: .combine)
                .accessibilityLabel(Text(verbatim: "\(GallerySample.check), hình nút đang bấm"))
            Caption(text: "đang bấm (vẽ tĩnh)")
            TwoLayerButton(GallerySample.check) {}
                .disabled(true)
            Caption(text: "tắt")
            TwoLayerButton(GallerySample.next, icon: .arrowForward) { taps += 1 }
            TwoLayerButton(GallerySample.retry, icon: .retry) { taps += 1 }

            SectionTitle(text: "TwoLayerButton · phụ")
            HStack(spacing: Tokens.Space.s16) {
                TwoLayerButton(GallerySample.hint, role: .secondary) { taps += 1 }
                TwoLayerButtonFace(role: .secondary, isPressed: true, isEnabled: true) { Text(verbatim: GallerySample.hint) }
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel(Text(verbatim: "\(GallerySample.hint), hình nút đang bấm"))
                TwoLayerButton(GallerySample.hint, role: .secondary) {}
                    .disabled(true)
            }
            Caption(text: "thường · đang bấm · tắt")

            SectionTitle(text: "PaperIconButton")
            HStack(spacing: Tokens.Space.s12) {
                PaperIconButton(.close, accessibilityLabel: Text(verbatim: "Thoát quiz")) { taps += 1 }
                PaperIconButton(.arrowBack, accessibilityLabel: Text(verbatim: "Về hành trình")) { taps += 1 }
                PaperIconButton(.speaker, accessibilityLabel: Text(verbatim: "Nghe câu hỏi"), disc: .screen) { taps += 1 }
                    .padding(Tokens.Space.s4)
                    .paperSurface(Tokens.Role.surfacePaper, cornerRadius: Tokens.Radius.discoverer)
            }
            Caption(text: "đĩa giấy trên nền điệp · đĩa điệp trên tờ giấy · lần bấm: \(taps)")
        }
    }
}

// MARK: - Seal and tags

private struct SealTagSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s14) {
            SectionTitle(text: "Seal")
            HStack(alignment: .center, spacing: Tokens.Space.s24) {
                Seal(GallerySample.sealWord, tone: .correct)
                Seal(icon: .check, accessibilityLabel: Text(verbatim: "Đã xem"))
                Caption(text: "lớn 52 · nhỏ 22, hiện bằng stamp")
            }

            SectionTitle(text: "PaperTag")
            PaperTag(GallerySample.recallTag)
            PaperTag(GallerySample.chooseAllTag)
            PaperTag(GallerySample.eyebrowTag, style: .cut(eyebrow: true))
            FlowRow {
                PaperTag("carb", style: .chip(dot: Tokens.Role.FoodGroup.carb))
                PaperTag("protein", style: .chip(dot: Tokens.Role.FoodGroup.protein))
                PaperTag("fat", style: .chip(dot: Tokens.Role.FoodGroup.fat))
                PaperTag("vitamin", style: .chip(dot: Tokens.Role.FoodGroup.vitamin))
                PaperTag("sweet", style: .chip(dot: Tokens.Role.FoodGroup.sweet))
            }
            PaperTag(GallerySample.newWords, style: .label)
        }
    }
}

/// Wraps chips onto new lines (SwiftUI `Layout`).
private struct FlowRow: SwiftUI.Layout {
    var spacing: CGFloat = Tokens.Space.s8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let rows = arrange(width: proposal.width ?? .infinity, subviews: subviews)
        let height = rows.map(\.height).reduce(0, +) + spacing * CGFloat(max(rows.count - 1, 0))
        return CGSize(width: proposal.width ?? rows.map(\.width).max() ?? 0, height: height)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var y = bounds.minY
        for row in arrange(width: bounds.width, subviews: subviews) {
            var x = bounds.minX
            for index in row.indices {
                let size = subviews[index].sizeThatFits(.unspecified)
                subviews[index].place(at: CGPoint(x: x, y: y), proposal: ProposedViewSize(size))
                x += size.width + spacing
            }
            y += row.height + spacing
        }
    }

    private struct Row {
        var indices: [Int] = []
        var width: CGFloat = 0
        var height: CGFloat = 0
    }

    private func arrange(width: CGFloat, subviews: Subviews) -> [Row] {
        var rows = [Row()]
        for index in subviews.indices {
            let size = subviews[index].sizeThatFits(.unspecified)
            if !rows[rows.count - 1].indices.isEmpty, rows[rows.count - 1].width + spacing + size.width > width {
                rows.append(Row())
            }
            let gap = rows[rows.count - 1].indices.isEmpty ? 0 : spacing
            rows[rows.count - 1].indices.append(index)
            rows[rows.count - 1].width += gap + size.width
            rows[rows.count - 1].height = max(rows[rows.count - 1].height, size.height)
        }
        return rows
    }
}

// MARK: - Progress

private struct ProgressSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s14) {
            SectionTitle(text: "ProgressSquares")
            HStack {
                Spacer()
                ProgressSquares(count: 6, current: 4, accessibilityLabel: Text(verbatim: "Câu 5 trên 6"))
                Spacer()
            }
            Caption(text: "Quiz: 4 xong · câu 5 hiện tại · 1 chưa tới")
            ProgressSquares(
                count: 4,
                current: 1,
                labels: GallerySample.steps.map { Text(verbatim: $0) },
                accessibilityLabel: Text(verbatim: "Bước 2 trên 4: Học")
            )
            Caption(text: "Học: có nhãn bước")
        }
    }
}

// MARK: - Choices

private struct ChoiceSection: View {
    @State private var picked: Set<String> = ["fish"]
    @Environment(\.layoutMetrics) private var metrics

    private struct Item: Identifiable {
        let id: String
        let vi: String
        let fixed: ChoiceState?
        let mark: String?
        let dot: Color
    }

    private let items: [Item] = [
        Item(id: "fish", vi: "cá", fixed: nil, mark: nil, dot: Tokens.Role.FoodGroup.protein),
        Item(id: "rice", vi: "cơm", fixed: nil, mark: nil, dot: Tokens.Role.FoodGroup.carb),
        Item(id: "egg", vi: "trứng", fixed: .correct, mark: "Đúng", dot: Tokens.Role.FoodGroup.protein),
        Item(id: "banana", vi: "chuối", fixed: .wrong, mark: "Chưa đúng", dot: Tokens.Role.FoodGroup.carb),
        Item(id: "tofu", vi: "đậu phụ", fixed: .missed, mark: "Bỏ sót", dot: Tokens.Role.FoodGroup.protein),
        Item(id: "bread", vi: "bánh mì", fixed: nil, mark: nil, dot: Tokens.Role.FoodGroup.carb),
    ]

    var body: some View {
        let grid = metrics.quizGrid
        VStack(alignment: .leading, spacing: Tokens.Space.s14) {
            SectionTitle(text: "Lựa chọn · PaperChoiceStyle")
            Caption(text: "cá, cơm, bánh mì: chạm để chọn (viền giấy vàng hoè) · trứng đúng · chuối sai · đậu phụ bỏ sót")
            LazyVGrid(columns: metrics.gridColumns(for: grid), spacing: grid.rowGap) {
                ForEach(items) { item in
                    let state = item.fixed ?? (picked.contains(item.id) ? .selected : .idle)
                    Button {
                        guard item.fixed == nil else { return }
                        if picked.contains(item.id) { picked.remove(item.id) } else { picked.insert(item.id) }
                    } label: {
                        VStack(spacing: Tokens.Space.s2) {
                            Circle()
                                .fill(item.dot)
                                .frame(width: PaperMetrics.groupDisc, height: PaperMetrics.groupDisc)
                                .paperShadow(Tokens.Shadow.stamp, in: Circle())
                                .frame(maxHeight: .infinity)
                            Text(verbatim: item.id)
                                .typography(Tokens.Typography.itemTitle, fixedBox: true)
                            Text(verbatim: item.vi)
                                .typography(Tokens.Typography.captionS, fixedBox: true)
                                .foregroundStyle(Tokens.Role.textSecondary)
                        }
                        .padding(.top, Tokens.Space.s6)
                        .padding(.bottom, Tokens.Space.s10)
                        .frame(minHeight: grid.cellHeight)
                    }
                    .buttonStyle(PaperChoiceStyle(state: state, mark: item.mark.map { Text(verbatim: $0) }))
                    .accessibilityLabel(Text(verbatim: "\(item.id), \(item.vi)"))
                }
            }
            .padding(.trailing, metrics.gridTrailingInset)
            FoldNote(GallerySample.wrongTitle, message: GallerySample.wrongMessage)
            Caption(text: "báo sai: mẩu giấy gấp góc, không dấu X đỏ, không rung")
        }
    }
}

// MARK: - Motion

private struct MotionSection: View {
    let replay: () -> Void
    @State private var flipped = false

    var body: some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s16) {
            SectionTitle(text: "Motion")
            TwoLayerButton(GallerySample.replay, role: .secondary, icon: .retry, action: replay)
                .accessibilityIdentifier("gallery.replayMotion")

            demo("lay · đặt giấy theo thứ tự đọc (stagger 60 ms)") {
                HStack(spacing: Tokens.Space.s10) {
                    ForEach(0..<3, id: \.self) { index in
                        PaperCard { Caption(text: "khối \(index + 1)").frame(maxWidth: .infinity) }
                            .reveal(order: index)
                    }
                }
            }
            demo("stamp · đóng triện") {
                HStack(spacing: Tokens.Space.s24) {
                    Seal(GallerySample.sealWord, tone: .correct)
                    Seal(icon: .check, accessibilityLabel: Text(verbatim: "Đã xem"), delay: Tokens.Motion.Stagger.step)
                }
            }
            demo("rise · tờ giấy trượt lên") {
                Color.clear
                    .frame(height: GalleryMetrics.motionStage)
                    .overlay(alignment: .bottom) {
                        Text(verbatim: "Chính xác!")
                            .typography(Tokens.Typography.titleL)
                            .foregroundStyle(Tokens.Role.textCorrect)
                            .frame(maxWidth: .infinity, minHeight: GalleryMetrics.motionStage / 2)
                            .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.dropSheetUp, in: Rectangle())
                            .motion(Tokens.Motion.Preset.rise)
                    }
                    .paperSurface(Tokens.Role.surfaceSunken, shadow: Tokens.Shadow.sunken, cornerRadius: Tokens.Radius.discoverer)
                    .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.discoverer))
            }
            demo("pop · mảnh nhỏ bật ra") {
                HStack(spacing: Tokens.Space.s16) {
                    ForEach(Array([Tokens.Role.FoodGroup.carb, Tokens.Role.FoodGroup.protein, Tokens.Role.FoodGroup.vitamin].enumerated()), id: \.offset) { index, color in
                        Circle()
                            .fill(color)
                            .frame(width: PaperMetrics.sealLarge, height: PaperMetrics.sealLarge)
                            .paperShadow(Tokens.Shadow.paper2, in: Circle())
                            .motion(Tokens.Motion.Preset.pop, delay: MotionStagger.delay(order: index, step: Tokens.Motion.Stagger.stepDense))
                    }
                }
            }
            demo("fall · giấy vụn (chỉ màn Thưởng)") {
                HStack(alignment: .bottom, spacing: Tokens.Space.s18) {
                    ForEach(Array(GallerySample.confettiColors.enumerated()), id: \.offset) { index, color in
                        RoundedRectangle(cornerRadius: Tokens.Radius.bar)
                            .fill(color)
                            .frame(width: GalleryMetrics.confetti.width, height: GalleryMetrics.confetti.height)
                            .rotationEffect(.degrees(Double(index * 37 % 90) - 45))
                            .paperShadow(Tokens.Shadow.paper1, cornerRadius: Tokens.Radius.bar)
                            .motion(Tokens.Motion.Preset.fall, delay: Double(index) * Tokens.Motion.Stagger.step)
                    }
                }
                .frame(maxWidth: .infinity, minHeight: GalleryMetrics.motionStage, alignment: .bottom)
            }
            demo("flip · lật thẻ (chạm thẻ)") {
                Button { flipped.toggle() } label: {
                    FlipCard(isFlipped: flipped) {
                        flipFace(GallerySample.flipFront, fill: Tokens.Role.surfacePaper, text: Tokens.Role.textPrimary)
                    } back: {
                        flipFace(GallerySample.flipBack, fill: Tokens.Role.actionPrimary, text: Tokens.Role.textOnAccent)
                    }
                }
                .buttonStyle(.paperPress)
                .accessibilityLabel(Text(verbatim: flipped ? GallerySample.flipBack : GallerySample.flipFront))
                .accessibilityHint(Text(verbatim: "Chạm để lật"))
            }
        }
    }

    private func demo(_ title: String, @ViewBuilder content: () -> some View) -> some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s8) {
            Caption(text: title)
            content()
        }
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("gallery.demo.\(title.prefix { $0 != " " })")
    }

    private func flipFace(_ title: String, fill: Color, text: Color) -> some View {
        Text(verbatim: title)
            .typography(Tokens.Typography.sentence)
            .foregroundStyle(text)
            .frame(maxWidth: .infinity, minHeight: GalleryMetrics.flipHeight)
            .paperSurface(fill, shadow: Tokens.Shadow.paper3, cornerRadius: Tokens.Radius.discoverer)
    }
}

// MARK: - Sample strings

/// Sample text of the debug screen. Not lesson text: lesson words come from content only (SK-012).
enum GallerySample {
    static let replay = "Chạy lại motion"
    static let check = "Kiểm tra"
    static let next = "Tiếp"
    static let retry = "Thử lại"
    static let hint = "Gợi ý"
    static let sealWord = "ĐÚNG"
    static let recallTag = "Nhớ lại · từ Year 2"
    static let chooseAllTag = "Nhãn cắt góc · đỏ son"
    static let eyebrowTag = "Học tiếp · Miễn phí"
    static let newWords = "Từ mới · New words"
    // Keep these two about this long: with shorter lines `testAccessibilityAuditEverySection`
    // stops with "Audit failed to complete in time" on the next section (iPhone 16, SK-012).
    static let cardEN = "I can sort the toys on my shelf by size."
    static let cardVI = "Em xếp được đồ chơi trên kệ theo cỡ to nhỏ."
    static let steps = ["Khởi động", "Học", "Chơi", "Quiz"]
    static let wrongTitle = "Gần đúng!"
    static let wrongMessage = "Xem lại các ô được đánh dấu rồi thử lần nữa."
    static let flipFront = "mặt trước"
    static let flipBack = "mặt sau"
    static let confettiColors = [
        Tokens.Palette.doSon, Tokens.Palette.vangHoe, Tokens.Palette.giDong,
        Tokens.Palette.cham, Tokens.Palette.vangHoeLight, Tokens.Palette.doSon,
    ]
}
#endif
