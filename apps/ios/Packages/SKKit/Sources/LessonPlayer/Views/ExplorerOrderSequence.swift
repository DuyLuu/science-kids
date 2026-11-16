import ContentModel
import DesignSystem
import LessonEngine
import Profiles
import SwiftUI

/// `order_sequence`, Explorer and Discoverer (SK-040; SK-026: "3 thẻ hình, bé chạm lần lượt theo
/// thứ tự; thẻ bay vào ô 1, 2, 3; đặt xong thẻ thứ 3 thì chấm, đúng khi khớp hoàn toàn"; SK-047
/// design `Quiz-Dot1.html` `o-d-ask`, `o-d-retry`, `o-x-retry`, `o-ipad`).
///
/// - Places on a sunken strip, numbered (an empty one shows its number faintly), with an arrow
///   between two places. iPhone (compact) with 4 cards or more: two rows (4 → 2 + 2, 5 → 3 + 2)
///   and a folded strip from the end of row 1 to the start of row 2. iPad: always one row.
/// - Under it the cards still to place, in the attempt's order (`LessonSession.shownOrderCards`,
///   never the answer's order); a placed card leaves a sunken hole.
/// - Tap a card: it goes to the first empty place and the app says its name. Tap a placed card:
///   it goes back. Or drag a card onto a place (a card already there goes back).
/// - The last card placed is the try (`{"order": [...]}`, every place), scored by the engine
///   (B4.4: right on a complete match). Right: lá tre rings and one seal. Wrong with a try left
///   (SK-047): a card in its right place stays and is locked (lá tre layer and a check seal; no
///   tap, no drag, no drop), the others go back to the bank as ordinary cards. Out of tries: the
///   places show the right order on vàng hoè nhạt.
/// - VoiceOver: every card and place is a button ("Place 2: chick", "Place 3, empty"); a locked
///   place says so and has no hint.
struct ExplorerOrderSequence: View {
    let order: QuizItem.OrderSequence
    /// The cards in the bank's order (shuffled per attempt).
    let cards: [QuizItem.OrderSequence.SequenceItem]
    let status: QuestionStatus
    let tried: [Try]
    /// Set while the name of the last card is read: the places show the try, not the result yet.
    let naming: String?
    let mode: LanguageMode
    let onPlace: (String) -> Void
    let onComplete: ([String]) -> Void

    @State private var slots: [String?]
    /// Cards that came back to the bank after a wrong try: they slide in instead of laying.
    @State private var returned: Set<String> = []
    @Environment(\.layoutMetrics) private var metrics
    @Environment(\.ageGroup) private var ageGroup

    init(
        order: QuizItem.OrderSequence, cards: [QuizItem.OrderSequence.SequenceItem], status: QuestionStatus, tried: [Try],
        naming: String?, mode: LanguageMode, onPlace: @escaping (String) -> Void, onComplete: @escaping ([String]) -> Void
    ) {
        self.order = order
        self.cards = cards
        self.status = status
        self.tried = tried
        self.naming = naming
        self.mode = mode
        self.onPlace = onPlace
        self.onComplete = onComplete
        // A lesson reopened on a retry keeps the locked cards in their places.
        _slots = State(initialValue: ExplorerOrderBoard.draft(answer: order.answer, locked: ExplorerOrderBoard.locked(answer: order.answer, status: status)))
    }

    private var isEditing: Bool { naming == nil && !status.isDone }

    /// Places locked by the last wrong try (only while another try is left).
    private var locked: Set<Int> {
        naming == nil ? ExplorerOrderBoard.locked(answer: order.answer, status: status) : []
    }

    /// Keys shown in the places now.
    private var shown: [String?] {
        ExplorerOrderBoard.shown(draft: slots, answer: order.answer, status: status, lastTry: lastTry, naming: naming != nil)
    }

    private var lastTry: [String]? {
        if case .order(let keys)? = tried.last { return keys }
        return nil
    }

    private var look: ExplorerCardLook {
        ExplorerOrderBoard.look(status: status, naming: naming != nil)
    }

    private var layout: OrderLayout {
        OrderLayout(count: order.items.count, isRegular: metrics.isRegular, width: metrics.contentWidth - metrics.gridTrailingInset)
    }

    private var radius: CGFloat { ageGroup == .explorer ? Tokens.Radius.explorer : Tokens.Radius.discoverer }

    var body: some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s16) {
            places
            if isEditing {
                pool
            }
        }
        .padding(.trailing, metrics.gridTrailingInset)
        .padding(.bottom, Tokens.Space.s6)
        // A wrong try with a try left: the cards in their right place stay, the others go back.
        .onChange(of: tried.count) {
            let next = ExplorerOrderBoard.draft(answer: order.answer, locked: ExplorerOrderBoard.locked(answer: order.answer, status: status))
            returned = Set(slots.compactMap { $0 }).subtracting(next.compactMap { $0 })
            slots = next
        }
    }

    // MARK: Places

    /// The whole order is right (A2 `ex-x-q4-order-right`, designer 15/11): one lá tre layer under
    /// the strip and one seal on its corner; the cards carry no seal of their own.
    private var rowRight: Bool { look == .right }

    private var places: some View {
        let layout = layout
        let strip = RoundedRectangle(cornerRadius: radius, style: .continuous)
        return VStack(spacing: 0) {
            ForEach(Array(layout.rows.enumerated()), id: \.offset) { row, indices in
                if row > 0 {
                    RowTurn(layout: layout)
                        .fill(Tokens.Role.textSecondary)
                        .frame(height: OrderLayout.turnHeight)
                        .accessibilityHidden(true)
                }
                HStack(spacing: 0) {
                    ForEach(Array(indices.enumerated()), id: \.element) { position, index in
                        if position > 0 {
                            PaperIconView(.arrowForward, size: OrderLayout.arrowIcon, color: Tokens.Role.textSecondary)
                                .frame(width: layout.arrowGap)
                        }
                        place(index: index, key: shown.indices.contains(index) ? shown[index] : nil)
                            .frame(width: layout.place, height: layout.place)
                    }
                }
                .frame(width: layout.rowWidth(indices.count), alignment: .leading)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(OrderLayout.stripPadding)
        .background {
            if rowRight {
                strip.fill(Tokens.Role.surfaceSunken).paperShadow(Tokens.Shadow.offsetCorrect, in: strip)
            } else {
                strip.fill(Tokens.Role.surfaceSunken)
            }
        }
        .overlay(alignment: .topTrailing) {
            if rowRight {
                Seal(icon: .check, size: .row, tone: .correct, accessibilityLabel: Text("lesson.mark.correct"))
                    .offset(x: Tokens.Space.s6, y: -Tokens.Space.s10)
            }
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel(Text("lesson.explorer.order.places"))
    }

    @ViewBuilder private func place(index: Int, key: String?) -> some View {
        if let key, let item = item(key) {
            let isLocked = locked.contains(index)
            Button {
                guard isEditing, !isLocked else { return }
                slots[index] = nil
            } label: {
                ExplorerCardFace(look: isLocked ? .right : (isEditing || rowRight ? .idle : look), showsRetry: false, height: layout.place,
                                 showsSeal: false) {
                    ContentPicture(asset: item.image?.asset, color: nil, size: layout.place - 2 * Tokens.Space.s6, box: .fillWidth, accessibilityLabel: nil)
                        .frame(maxWidth: max(layout.place - 2 * Tokens.Space.s6, 0))
                        .clipShape(RoundedRectangle(cornerRadius: max(radius - Tokens.Space.s6, Tokens.Radius.tag), style: .continuous))
                        .padding(Tokens.Space.s6)
                }
                .overlay(alignment: .topLeading) { numberTag(index) }
                .overlay(alignment: .topTrailing) {
                    if isLocked {
                        // `o-d-retry`: locked like a right card of A2, a check seal on its corner.
                        Seal(icon: .check, size: .medium, tone: .correct)
                            .offset(x: Tokens.Space.s6, y: -Tokens.Space.s6)
                    }
                }
            }
            .buttonStyle(.paperPress)
            .allowsHitTesting(isEditing && !isLocked)
            .modifier(OrderDrag(key: key, enabled: isEditing && !isLocked) { dragPreview(item) })
            .dropDestination(for: String.self) { keys, _ in isLocked ? false : drop(keys, at: index) }
            .accessibilityLabel(Text("lesson.explorer.order.place_filled \(index + 1) \(mode.sentence(item.label))"))
            .accessibilityValue(placeValue(locked: isLocked))
            .accessibilityHint(isEditing && !isLocked ? Text("lesson.explorer.order.take_out") : Text(verbatim: ""))
            .accessibilityIdentifier("lesson.order.place.\(index + 1)")
            .motion(Tokens.Motion.Preset.pop)
        } else {
            RoundedRectangle(cornerRadius: radius, style: .continuous)
                .fill(Tokens.Role.surfaceInactive)
                .paperShadow(Tokens.Shadow.sunken, cornerRadius: radius)
                .overlay {
                    Text(verbatim: "\(index + 1)")
                        .typography(Tokens.Typography.titleXl, fixedBox: true)
                        .foregroundStyle(Tokens.Palette.giayLomDeep)
                        .allowsHitTesting(false)
                        .accessibilityHidden(true)
                }
                .dropDestination(for: String.self) { keys, _ in drop(keys, at: index) }
                .accessibilityElement()
                .accessibilityLabel(Text("lesson.explorer.order.place_empty \(index + 1)"))
                .accessibilityIdentifier("lesson.order.place.\(index + 1)")
        }
    }

    private func placeValue(locked: Bool) -> Text {
        if locked { return Text("lesson.order.locked_a11y") }
        if isEditing { return Text(verbatim: "") }
        return look.accessibilityValue ?? Text(verbatim: "")
    }

    /// The place's number on a dark tag at its corner (Explorer-A).
    private func numberTag(_ index: Int) -> some View {
        Text(verbatim: "\(index + 1)")
            .typography(Tokens.Typography.label, fixedBox: true)
            .foregroundStyle(Tokens.Role.textOnAccent)
            .frame(width: PictureBookMetrics.orderTag, height: PictureBookMetrics.orderTag)
            .background(RoundedRectangle(cornerRadius: Tokens.Radius.tag, style: .continuous).fill(Tokens.Role.textPrimary))
            .rotationEffect(Tokens.Shape.tiltStamp)
            .offset(x: -Tokens.Space.s6, y: -Tokens.Space.s6)
            .allowsHitTesting(false)
            .accessibilityHidden(true)
    }

    // MARK: Cards to place

    private var cardWidth: CGFloat {
        let count = CGFloat(max(cards.count, 1))
        return max((metrics.contentWidth - metrics.gridTrailingInset - (count - 1) * Tokens.Space.s12) / count, 0)
    }

    private var cardHeight: CGFloat {
        metrics.isRegular || ageGroup == .explorer ? OrderLayout.cardHeightTall : OrderLayout.cardHeight
    }

    private var pool: some View {
        let placed = Set(slots.compactMap { $0 })
        return HStack(alignment: .top, spacing: Tokens.Space.s12) {
            ForEach(Array(cards.enumerated()), id: \.element.key) { offset, item in
                Group {
                    if placed.contains(item.key) {
                        // `o-d-retry`: the card's room stays as a sunken hole, so the row does not jump.
                        RoundedRectangle(cornerRadius: radius, style: .continuous)
                            .fill(Tokens.Role.surfaceSunken)
                            .paperShadow(Tokens.Shadow.sunkenS, cornerRadius: radius)
                            .frame(height: cardHeight)
                            .accessibilityHidden(true)
                    } else {
                        let card = Button {
                            placeNext(item.key)
                        } label: {
                            ExplorerCardFace(look: .idle, showsRetry: false, height: cardHeight) {
                                ContentPicture(asset: item.image?.asset, color: nil, size: cardHeight - 2 * Tokens.Space.s6, box: .fillWidth, accessibilityLabel: nil)
                                    // Never wider than the cell (a stand-in picture has a fixed size).
                                    .frame(maxWidth: max(cardWidth - 2 * Tokens.Space.s6, 0))
                                    .clipShape(RoundedRectangle(cornerRadius: max(radius - Tokens.Space.s6, Tokens.Radius.tag), style: .continuous))
                                    .padding(Tokens.Space.s6)
                            }
                        }
                        .buttonStyle(.paperPress)
                        .draggable(item.key) { dragPreview(item) }
                        .accessibilityLabel(Text(verbatim: mode.sentence(item.label)))
                        .accessibilityHint(Text("lesson.explorer.order.put_hint"))
                        .accessibilityIdentifier("lesson.order.card.\(item.key)")
                        if returned.contains(item.key) {
                            // A card back from a wrong place slides in (`slide`); Reduce Motion: it just shows.
                            card.motion(Tokens.Motion.Preset.slide)
                        } else {
                            card.reveal(order: 4 + offset, step: Tokens.Motion.Stagger.stepDense)
                        }
                    }
                }
                .frame(width: cardWidth)
            }
        }
    }

    private func dragPreview(_ item: QuizItem.OrderSequence.SequenceItem) -> some View {
        ContentPicture(asset: item.image?.asset, color: nil, size: min(layout.place, cardWidth) - Tokens.Space.s16, accessibilityLabel: nil)
            .padding(Tokens.Space.s8)
            .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.offsetAccent, cornerRadius: radius)
    }

    // MARK: Moves

    private func item(_ key: String) -> QuizItem.OrderSequence.SequenceItem? {
        order.items.first { $0.key == key }
    }

    private func placeNext(_ key: String) {
        guard isEditing, let free = slots.firstIndex(where: { $0 == nil }) else { return }
        put(key, at: free)
    }

    /// A card dropped on place `index`: from the pool or from another place.
    private func drop(_ keys: [String], at index: Int) -> Bool {
        guard isEditing, let key = keys.first, item(key) != nil else { return false }
        return put(key, at: index)
    }

    @discardableResult
    private func put(_ key: String, at index: Int) -> Bool {
        guard let next = ExplorerOrderBoard.placing(key, at: index, in: slots, locked: locked) else { return false }
        slots = next
        returned.remove(key)
        onPlace(key)
        let filled = slots.compactMap { $0 }
        if filled.count == slots.count { onComplete(filled) }
        return true
    }
}

/// A placed card can be dragged to another place, unless it is locked.
private struct OrderDrag<Preview: View>: ViewModifier {
    let key: String
    let enabled: Bool
    @ViewBuilder let preview: () -> Preview

    func body(content: Content) -> some View {
        if enabled {
            content.draggable(key) { preview() }
        } else {
            content
        }
    }
}

/// Sizes of the order board (SK-047 `o-d-ask`, `o-x-retry`, `o-ipad`), without SwiftUI.
struct OrderLayout: Equatable {
    /// Places in rows: compact width with 4 cards or more → two rows, the first one the longer
    /// (4 → 2 + 2, 5 → 3 + 2); otherwise one row.
    let rows: [[Int]]
    /// Side of a square place.
    let place: CGFloat
    /// Room between two places of a row, with the arrow in it.
    let arrowGap: CGFloat

    /// The strip's padding, the arrow glyph (`22`), the folded strip between two rows (`31`
    /// high, `5` thick).
    static let stripPadding: CGFloat = Tokens.Space.s8
    static let arrowIcon: CGFloat = 22
    static let turnHeight: CGFloat = 31
    static let turnThickness: CGFloat = 5
    /// `o-d-ask`: places at most `116` on the phone (`order_item` pictures are 1 : 1); `o-ipad`:
    /// at most `160`. Arrow room: `44` between two-row places, `32` in one phone row (designer
    /// 15/11: at `28` the arrow touched a locked card's lá tre layer), `36` on iPad.
    static let placeMax: CGFloat = 116
    static let placeMaxRegular: CGFloat = 160
    static let arrowGapTwoRows: CGFloat = 44
    static let arrowGapOneRow: CGFloat = 32
    static let arrowGapRegular: CGFloat = 36
    /// Bank cards: `104` high on the Discoverer phone, `150` for Explorer and on iPad.
    static let cardHeight: CGFloat = 104
    static let cardHeightTall: CGFloat = 150

    init(count: Int, isRegular: Bool, width: CGFloat) {
        let count = max(count, 0)
        if !isRegular, count >= 4 {
            let first = (count + 1) / 2
            rows = [Array(0..<first), Array(first..<count)]
        } else {
            rows = [Array(0..<count)]
        }
        arrowGap = isRegular ? Self.arrowGapRegular : (rows.count > 1 ? Self.arrowGapTwoRows : Self.arrowGapOneRow)
        let longest = CGFloat(max(rows.map(\.count).max() ?? 1, 1))
        let inner = width - 2 * Self.stripPadding
        place = max(min(isRegular ? Self.placeMaxRegular : Self.placeMax, (inner - (longest - 1) * arrowGap) / longest), 0)
    }

    /// Width of a row of `count` places with their arrows.
    func rowWidth(_ count: Int) -> CGFloat {
        CGFloat(count) * place + CGFloat(max(count - 1, 0)) * arrowGap
    }

    /// x of the centre of the last place of row 1 and of the first place of row 2, from the left
    /// of a row (both rows start at the same x).
    var turnFrom: CGFloat { rowWidth(rows.first?.count ?? 0) - place / 2 }
    var turnTo: CGFloat { place / 2 }
}

/// The folded strip from the end of row 1 down to the start of row 2 (`o-d-ask`): a solid
/// paper strip, not a line, ending in an arrow head. Drawn in the row's frame, centred.
private struct RowTurn: SwiftUI.Shape {
    let layout: OrderLayout

    func path(in rect: CGRect) -> Path {
        let left = rect.midX - layout.rowWidth(layout.rows.first?.count ?? 0) / 2
        let from = left + layout.turnFrom
        let to = left + layout.turnTo
        let thick = OrderLayout.turnThickness
        let middle = rect.minY + rect.height * 0.45
        let head = thick * 2.2
        var strip = Path()
        strip.move(to: CGPoint(x: from, y: rect.minY))
        strip.addLine(to: CGPoint(x: from, y: middle))
        strip.addLine(to: CGPoint(x: to, y: middle))
        strip.addLine(to: CGPoint(x: to, y: rect.maxY - head))
        var shape = strip.strokedPath(StrokeStyle(lineWidth: thick, lineCap: .butt, lineJoin: .miter))
        var arrow = Path()
        arrow.move(to: CGPoint(x: to - head, y: rect.maxY - head))
        arrow.addLine(to: CGPoint(x: to + head, y: rect.maxY - head))
        arrow.addLine(to: CGPoint(x: to, y: rect.maxY))
        arrow.closeSubpath()
        shape = shape.union(arrow)
        return shape
    }
}

/// The rules of the order board, without SwiftUI (unit-tested).
enum ExplorerOrderBoard {
    /// `slots` with `key` put at `index`: taken out of the place it was in, and the card that was
    /// at `index` goes back to the pool. `nil` when `index` is not a place, or when the place or
    /// the card is locked (SK-047).
    static func placing(_ key: String, at index: Int, in slots: [String?], locked: Set<Int> = []) -> [String?]? {
        guard slots.indices.contains(index), !locked.contains(index) else { return nil }
        if let from = slots.firstIndex(of: key), locked.contains(from) { return nil }
        var next = slots.map { $0 == key ? nil : $0 }
        next[index] = key
        return next
    }

    /// SK-047: after a wrong try with a try left, the places whose card matched `answer` there.
    static func locked(answer: [String], status: QuestionStatus) -> Set<Int> {
        guard case .retry(let last) = status, case .order(let keys) = last else { return [] }
        return Set(keys.indices.filter { answer.indices.contains($0) && answer[$0] == keys[$0] })
    }

    /// The places at the start of a try: the locked ones keep their right card, the rest are empty.
    static func draft(answer: [String], locked: Set<Int>) -> [String?] {
        answer.indices.map { locked.contains($0) ? answer[$0] : nil }
    }

    /// What the places show: the draft while the child places; the try while its last name is
    /// read; the try once right; the right order once out of tries.
    static func shown(draft: [String?], answer: [String], status: QuestionStatus, lastTry: [String]?, naming: Bool) -> [String?] {
        if naming, let lastTry { return lastTry }
        switch status {
        case .open, .retry: return draft
        case .done(let correct, _, _):
            if correct, let lastTry { return lastTry }
            return answer
        }
    }

    static func look(status: QuestionStatus, naming: Bool) -> ExplorerCardLook {
        if naming { return .naming }
        switch status {
        case .open, .retry: return .idle
        case .done(let correct, _, _): return correct ? .right : .answer
        }
    }
}
