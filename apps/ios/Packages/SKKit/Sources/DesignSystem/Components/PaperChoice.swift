import Foundation
import SwiftUI

/// State of an answer cell (Quiz, food groups in Học, shelf in Chơi).
///
/// Selection is shown by a piece of vàng hoè paper offset behind the cell (`shadow.offset_accent`),
/// never by an outline. After checking: lá tre paper behind a right choice (`shadow.offset_correct`,
/// `feedback_correct`, Duy 29/10), giấy lõm behind a wrong one. Wrong answers get no red cross and
/// no shake (`motion.rules.wrong_answer_shake`).
public enum ChoiceState: Sendable, Equatable, CaseIterable {
    case idle
    case selected
    /// Chosen and right, after checking.
    case correct
    /// Chosen and wrong, after checking.
    case wrong
    /// Right but not chosen, after checking (marked "Bỏ sót", no ring).
    case missed

    public var shadow: Tokens.Shadow {
        switch self {
        case .idle, .missed: Tokens.Shadow.paper3
        case .selected: Tokens.Shadow.offsetAccent
        case .correct: Tokens.Shadow.offsetCorrect
        case .wrong: Tokens.Shadow.offsetWrong
        }
    }

    /// The cell counts as chosen (VoiceOver "selected", `aria-pressed`).
    public var isChosen: Bool {
        switch self {
        case .selected, .correct, .wrong: true
        case .idle, .missed: false
        }
    }

    /// The mark a checked cell shows in its top-right corner, if any.
    public var mark: ChoiceMark.Kind? {
        switch self {
        case .correct: .correct
        case .wrong: .wrong
        case .missed: .missed
        case .idle, .selected: nil
        }
    }
}

/// Answer cell: bright paper with the ring of its `ChoiceState`, pressed down while held,
/// the state change animated with the `press` companion timing. Put the content (picture,
/// EN word, VI word) in the label; give the mark text with `mark:` once checked.
///
/// ```swift
/// Button { toggle(item) } label: { FoodCell(item) }
///     .buttonStyle(PaperChoiceStyle(state: state(of: item), mark: markText(for: item)))
/// ```
public struct PaperChoiceStyle: ButtonStyle {
    private let state: ChoiceState
    private let mark: Text?

    public init(state: ChoiceState, mark: Text? = nil) {
        self.state = state
        self.mark = mark
    }

    public func makeBody(configuration: Configuration) -> some View {
        ChoiceFace(state: state, mark: mark, isPressed: configuration.isPressed) { configuration.label }
    }
}

/// The look of an answer cell for a state, without the button (gallery, custom cells).
public struct ChoiceFace<Label: View>: View {
    private let state: ChoiceState
    private let mark: Text?
    private let isPressed: Bool
    private let label: Label
    @Environment(\.ageGroup) private var ageGroup
    @Environment(\.layoutMetrics) private var metrics
    @Environment(\.isEnabled) private var isEnabled

    public init(state: ChoiceState, mark: Text? = nil, isPressed: Bool = false, @ViewBuilder label: () -> Label) {
        self.state = state
        self.mark = mark
        self.isPressed = isPressed
        self.label = label()
    }

    public var body: some View {
        let shape = RoundedRectangle(cornerRadius: ageGroup.radius, style: .continuous)
        let inset = metrics.isRegular ? PaperMetrics.markInsetRegular : PaperMetrics.markInsetCompact
        label
            .foregroundStyle(Tokens.Role.textPrimary)
            .frame(maxWidth: .infinity, minHeight: ageGroup.touchTarget)
            .paperSurface(Tokens.Role.surfacePaper, shadow: state.shadow, in: shape)
            .overlay(alignment: .topTrailing) {
                // The mark sits astride the cell's top edge, its middle on the edge, as on the canvas
                // `Discoverer-QuizFill` (`top: -10px`). So it covers neither the picture of a quiz
                // cell nor the word of a bank word. History: SK-012 tester L3; Duy chose it for every
                // answer cell on 31/10.
                //
                // The `if` sits inside a `ZStack`, and the alignment guide goes on the `ZStack`.
                // SwiftUI drops an alignment guide set inside the `if` branch of an overlay, and the
                // mark then sat inside the cell, top on the top edge. That is what happened from L3
                // until 31/10. `ChoiceMarkPlacementTests` renders the cell to keep this from coming
                // back. `offset`, not padding, so the mark's frame (VoiceOver, contrast audit) stays
                // the slip itself.
                ZStack {
                    if let kind = state.mark, let mark {
                        ChoiceMark(kind, text: mark)
                    }
                }
                .alignmentGuide(.top) { $0[VerticalAlignment.center] }
                .offset(x: -inset)
            }
            .contentShape(Rectangle())
            .pressEffect(isPressed && isEnabled)
            .paperStateAnimation(value: state)
            .accessibilityAddTraits(state.isChosen ? .isSelected : [])
            .accessibilityValue(state.mark != nil ? (mark ?? Text(verbatim: "")) : Text(verbatim: ""))
    }
}

/// Small mark on a checked cell. `correct`: a mini seal in lá tre (`feedback_correct`, the colour
/// of `Seal.Tone.correct`), tilted, upper case, `stamp` preset; `wrong`: a giấy lõm slip with a
/// folded corner (`shape.fold_corner_s`), no red, no cross; `missed`: a vàng hoè nhạt slip
/// (`feedback_missed`).
public struct ChoiceMark: View {
    public enum Kind: Sendable, CaseIterable {
        case correct
        case wrong
        case missed
    }

    private let kind: Kind
    private let text: Text

    public init(_ kind: Kind, text: Text) {
        self.kind = kind
        self.text = text
    }

    public var body: some View {
        switch kind {
        case .correct:
            text
                .typography(PaperMetrics.markCorrectTypography, fixedBox: true)
                .foregroundStyle(Tokens.Role.textOnAccent)
                .padding(PaperMetrics.markPadding)
                .paperSurface(Tokens.Role.feedbackCorrect, shadow: Tokens.Shadow.stamp, cornerRadius: Tokens.Radius.tag)
                .rotationEffect(Tokens.Shape.tiltStamp)
                .motion(Tokens.Motion.Preset.stamp)
        case .wrong:
            text
                .typography(PaperMetrics.markTypography, fixedBox: true)
                .foregroundStyle(Tokens.Role.textPrimary)
                .padding(PaperMetrics.markPadding)
                .padding(.trailing, Tokens.Space.s4) // canvas padding-right 11 = 7 + 4, clear of the 7pt fold
                .background(FoldCornerShape(fold: Tokens.Shape.foldCornerS).fill(Tokens.Role.feedbackWrong))
                .motion(Tokens.Motion.Preset.stamp)
        case .missed:
            text
                .typography(PaperMetrics.markTypography, fixedBox: true)
                .foregroundStyle(Tokens.Role.textPrimary)
                .padding(PaperMetrics.markPadding)
                .paperSurface(Tokens.Role.feedbackMissed, shadow: Tokens.Shadow.stamp, cornerRadius: Tokens.Radius.tag)
                .motion(Tokens.Motion.Preset.stamp)
        }
    }
}

/// Wrong-answer note: a slip of paper with its top-right corner folded (`shape.fold_corner`,
/// flap in `feedback_wrong`), `shadow.drop_fold`. Title in `title_s` ("Gần đúng!"), message below.
public struct FoldNote: View {
    private let title: Text
    private let message: Text?

    public init(title: Text, message: Text? = nil) {
        self.title = title
        self.message = message
    }

    public init<S: StringProtocol>(_ title: S, message: S? = nil) {
        self.init(title: Text(title), message: message.map { Text($0) })
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s2) {
            title
                .typography(Tokens.Typography.titleS)
                .accessibilityAddTraits(.isHeader)
            if let message {
                message
                    // Canvas 16/600/1.4; closest text role body_strong 15/700.
                    .typography(Tokens.Typography.bodyStrong)
            }
        }
        .foregroundStyle(Tokens.Role.textPrimary)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(PaperMetrics.foldNotePadding)
        .background {
            ZStack(alignment: .topTrailing) {
                FoldCornerShape().fill(Tokens.Role.surfacePaper)
                FoldFlapShape().fill(Tokens.Role.feedbackWrong)
            }
            .paperShadow(Tokens.Shadow.dropFold, in: FoldCornerShape())
        }
        .accessibilityElement(children: .combine)
    }
}
