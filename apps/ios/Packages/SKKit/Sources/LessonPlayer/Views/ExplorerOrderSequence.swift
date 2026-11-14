import ContentModel
import DesignSystem
import LessonEngine
import Profiles
import SwiftUI

/// `order_sequence` for Explorer (SK-040; SK-026: "3 thẻ hình, bé chạm lần lượt theo thứ tự; thẻ
/// bay vào ô 1, 2, 3; đặt xong thẻ thứ 3 thì chấm, đúng khi khớp hoàn toàn").
///
/// - A row of places, each marked by dots (one, two, three: no digit to read), and under it the
///   picture cards still to place.
/// - Tap a card: it goes to the first empty place and the app says its name. Tap a placed card:
///   it goes back. Or drag a card onto a place (a card already there goes back).
/// - The last card placed is the try (`{"order": [...]}`), scored by the engine (B4.4: right on a
///   complete match). Right: lá tre rings and one seal. Wrong with a try left: the cards come
///   back for another go while the hint plays. Out of tries: the places show the right order on
///   vàng hoè nhạt.
/// - VoiceOver: every card and place is a button ("Place 2: chick", "Place 3, empty").
struct ExplorerOrderSequence: View {
    let order: QuizItem.OrderSequence
    let status: QuestionStatus
    let tried: [Try]
    /// Set while the name of the last card is read: the places show the try, not the result yet.
    let naming: String?
    let mode: LanguageMode
    let onPlace: (String) -> Void
    let onComplete: ([String]) -> Void

    @State private var slots: [String?]
    @Environment(\.layoutMetrics) private var metrics

    init(
        order: QuizItem.OrderSequence, status: QuestionStatus, tried: [Try], naming: String?, mode: LanguageMode,
        onPlace: @escaping (String) -> Void, onComplete: @escaping ([String]) -> Void
    ) {
        self.order = order
        self.status = status
        self.tried = tried
        self.naming = naming
        self.mode = mode
        self.onPlace = onPlace
        self.onComplete = onComplete
        _slots = State(initialValue: Array(repeating: nil, count: order.items.count))
    }

    private var isEditing: Bool { naming == nil && !status.isDone }

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

    var body: some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s16) {
            places
            if isEditing {
                pool
            }
        }
        .padding(.trailing, metrics.gridTrailingInset)
        .padding(.bottom, Tokens.Space.s6)
        // A wrong try with a try left: the cards come back once the name has been read.
        .onChange(of: tried.count) { slots = Array(repeating: nil, count: order.items.count) }
    }

    private var cellWidth: CGFloat {
        let count = CGFloat(max(order.items.count, 1))
        // The places sit on a strip with `s8` padding on each side (Explorer-A).
        return max((metrics.contentWidth - metrics.gridTrailingInset - (count - 1) * Tokens.Space.s12 - 2 * Tokens.Space.s8) / count, 0)
    }

    private var art: CGFloat {
        min(metrics.illustration(ExplorerMetrics.choiceArt), cellWidth - Tokens.Space.s16)
    }

    // MARK: Places

    private var places: some View {
        HStack(alignment: .center, spacing: Tokens.Space.s12) {
            ForEach(Array(shown.enumerated()), id: \.offset) { index, key in
                // Explorer-A: each place numbered on a dark tag at its corner (an empty one shows
                // its number faintly), arrows between them, on a sunken strip.
                place(index: index, key: key)
                    .overlay {
                        if key == nil {
                            Text(verbatim: "\(index + 1)")
                                .typography(Tokens.Typography.titleXl, fixedBox: true)
                                .foregroundStyle(Tokens.Palette.giayLomDeep)
                                .allowsHitTesting(false)
                                .accessibilityHidden(true)
                        }
                    }
                    .overlay(alignment: .topLeading) {
                        if key != nil {
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
                    }
                    .frame(width: cellWidth)
            }
        }
        .padding(Tokens.Space.s8)
        .background(RoundedRectangle(cornerRadius: Tokens.Radius.explorer, style: .continuous).fill(Tokens.Role.surfaceSunken))
        .accessibilityElement(children: .contain)
        .accessibilityLabel(Text("lesson.explorer.order.places"))
    }

    @ViewBuilder private func place(index: Int, key: String?) -> some View {
        let height = metrics.illustration(ExplorerMetrics.slotHeight)
        if let key, let item = item(key) {
            Button {
                guard isEditing else { return }
                slots[index] = nil
            } label: {
                ExplorerCardFace(look: isEditing ? .idle : look, showsRetry: false, height: height,
                                 showsSeal: index == shown.count - 1) {
                    ContentPicture(asset: item.image?.asset, color: nil, size: height - 2 * Tokens.Space.s6, box: .fillWidth, accessibilityLabel: nil)
                        .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.explorer - Tokens.Space.s6, style: .continuous))
                        .padding(Tokens.Space.s6)
                }
            }
            .buttonStyle(.paperPress)
            .allowsHitTesting(isEditing)
            .draggable(key) { dragPreview(item) }
            .dropDestination(for: String.self) { keys, _ in drop(keys, at: index) }
            .accessibilityLabel(Text("lesson.explorer.order.place_filled \(index + 1) \(mode.sentence(item.label))"))
            .accessibilityValue(isEditing ? Text(verbatim: "") : (look.accessibilityValue ?? Text(verbatim: "")))
            .accessibilityHint(isEditing ? Text("lesson.explorer.order.take_out") : Text(verbatim: ""))
            .accessibilityIdentifier("lesson.order.place.\(index + 1)")
            .motion(Tokens.Motion.Preset.pop)
        } else {
            RoundedRectangle(cornerRadius: Tokens.Radius.explorer, style: .continuous)
                .fill(Tokens.Role.surfaceSunken)
                .paperShadow(Tokens.Shadow.sunken, cornerRadius: Tokens.Radius.explorer)
                .frame(height: height)
                .dropDestination(for: String.self) { keys, _ in drop(keys, at: index) }
                .accessibilityElement()
                .accessibilityLabel(Text("lesson.explorer.order.place_empty \(index + 1)"))
                .accessibilityIdentifier("lesson.order.place.\(index + 1)")
        }
    }

    // MARK: Cards to place

    private var pool: some View {
        let placed = Set(slots.compactMap { $0 })
        return HStack(alignment: .top, spacing: Tokens.Space.s12) {
            ForEach(Array(order.items.enumerated()), id: \.element.key) { offset, item in
                Group {
                    if placed.contains(item.key) {
                        // Keeps the card's room, so the row does not jump.
                        Color.clear.frame(height: metrics.illustration(ExplorerMetrics.choiceHeight))
                            .accessibilityHidden(true)
                    } else {
                        Button {
                            placeNext(item.key)
                        } label: {
                            ExplorerCardFace(look: .idle, showsRetry: false, height: metrics.illustration(ExplorerMetrics.choiceHeight)) {
                                ContentPicture(asset: item.image?.asset, color: nil, size: metrics.illustration(ExplorerMetrics.choiceHeight) - 2 * Tokens.Space.s6, box: .fillWidth, accessibilityLabel: nil)
                                    .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.explorer - Tokens.Space.s6, style: .continuous))
                                    .padding(Tokens.Space.s6)
                            }
                        }
                        .buttonStyle(.paperPress)
                        .draggable(item.key) { dragPreview(item) }
                        .accessibilityLabel(Text(verbatim: mode.sentence(item.label)))
                        .accessibilityHint(Text("lesson.explorer.order.put_hint"))
                        .accessibilityIdentifier("lesson.order.card.\(item.key)")
                        .reveal(order: 4 + offset, step: Tokens.Motion.Stagger.stepDense)
                    }
                }
                .frame(width: cellWidth)
            }
        }
    }

    private func dragPreview(_ item: QuizItem.OrderSequence.SequenceItem) -> some View {
        ContentPicture(asset: item.image?.asset, color: nil, size: art, accessibilityLabel: nil)
            .padding(Tokens.Space.s8)
            .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.offsetAccent, cornerRadius: Tokens.Radius.explorer)
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
        put(key, at: index)
        return true
    }

    private func put(_ key: String, at index: Int) {
        guard let next = ExplorerOrderBoard.placing(key, at: index, in: slots) else { return }
        slots = next
        onPlace(key)
        let filled = slots.compactMap { $0 }
        if filled.count == slots.count { onComplete(filled) }
    }
}

/// The rules of the order board, without SwiftUI (unit-tested).
enum ExplorerOrderBoard {
    /// `slots` with `key` put at `index`: taken out of the place it was in, and the card that was
    /// at `index` goes back to the pool. `nil` when `index` is not a place.
    static func placing(_ key: String, at index: Int, in slots: [String?]) -> [String?]? {
        guard slots.indices.contains(index) else { return nil }
        var next = slots.map { $0 == key ? nil : $0 }
        next[index] = key
        return next
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

/// One, two or three dots under a place: its position without a digit to read.
private struct PositionDots: View {
    let count: Int

    var body: some View {
        HStack(spacing: Tokens.Space.s4) {
            ForEach(0..<count, id: \.self) { _ in
                Circle()
                    .fill(Tokens.Palette.giayLomDeep)
                    .frame(width: ExplorerMetrics.slotDot, height: ExplorerMetrics.slotDot)
            }
        }
        .accessibilityHidden(true)
    }
}
