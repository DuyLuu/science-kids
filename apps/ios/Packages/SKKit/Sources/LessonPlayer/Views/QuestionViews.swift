import AudioKit
import ContentModel
import DesignSystem
import LessonEngine
import Profiles
import SwiftUI

/// The answer the child is building on screen, before it is checked.
struct AnswerDraft: Equatable {
    var keys: [String] = []
    var bool: Bool?

    /// The try to check, once the answer is complete; `nil` while something is missing.
    func attempt(for answer: QuizItem.Answer) -> Try? {
        switch answer {
        case .singleChoice: keys.first.map(Try.selected)
        case .multiChoice: keys.isEmpty ? nil : .selectedSet(keys)
        case .trueFalse: bool.map(Try.value)
        case .fillBlankBank(let fill): keys.count == fill.answers.count ? .filled(keys) : nil
        case .orderSequence, .pictureBarChart, .unknown: nil
        }
    }

    /// The draft that shows a try again (multi choice keeps the picks for "Thử lại", canvas).
    static func from(_ attempt: Try) -> AnswerDraft {
        switch attempt {
        case .selected(let key): AnswerDraft(keys: [key])
        case .selectedSet(let keys): AnswerDraft(keys: keys)
        case .value(let value): AnswerDraft(bool: value)
        case .filled(let keys), .order(let keys): AnswerDraft(keys: keys)
        }
    }

    var isEmpty: Bool { keys.isEmpty && bool == nil }
}

/// What the answer cells show: the draft being built (with the picks of a wrong try greyed out
/// in Khởi động, where the child answers by tapping), the marks of a wrong first try (right and
/// wrong picks only, so the second try still asks the child to think), or the final marks with
/// the right answers that were not picked ("Bỏ sót" / "Đáp án").
enum AnswerDisplay: Equatable {
    case editing(AnswerDraft, tried: AnswerDraft = AnswerDraft())
    case afterFirstTry(AnswerDraft)
    case final(AnswerDraft)

    func state(forKey key: String, correct: Bool) -> ChoiceState {
        switch self {
        case .editing(let draft, let tried):
            if draft.keys.contains(key) { return .selected }
            return tried.keys.contains(key) ? .wrong : .idle
        case .afterFirstTry(let picked):
            guard picked.keys.contains(key) else { return .idle }
            return correct ? .correct : .wrong
        case .final(let picked):
            if picked.keys.contains(key) { return correct ? .correct : .wrong }
            return correct ? .missed : .idle
        }
    }

    func state(forValue value: Bool, answer: Bool) -> ChoiceState {
        switch self {
        case .editing(let draft, let tried):
            if draft.bool == value { return .selected }
            return tried.bool == value ? .wrong : .idle
        case .afterFirstTry(let picked):
            guard picked.bool == value else { return .idle }
            return value == answer ? .correct : .wrong
        case .final(let picked):
            if picked.bool == value { return value == answer ? .correct : .wrong }
            return value == answer ? .missed : .idle
        }
    }

    var isEditing: Bool {
        if case .editing = self { return true }
        return false
    }

    /// A cell the child can tap now: while editing, except a pick of the wrong try before.
    func canTap(key: String) -> Bool {
        guard case .editing(_, let tried) = self else { return false }
        return !tried.keys.contains(key)
    }

    func canTap(value: Bool) -> Bool {
        guard case .editing(_, let tried) = self else { return false }
        return tried.bool != value
    }
}

/// String catalog key of the mark on a checked cell. Single answers call the right one they
/// missed "Đáp án"; multi choice calls it "Bỏ sót", as the canvas.
func markKey(for state: ChoiceState, multi: Bool) -> String? {
    switch state {
    case .correct: "lesson.mark.correct"
    case .wrong: "lesson.mark.wrong"
    case .missed: multi ? "lesson.mark.missed" : "lesson.mark.answer"
    case .idle, .selected: nil
    }
}

/// Text of the mark on a checked cell (string catalog), see `markKey(for:multi:)`.
func markText(for state: ChoiceState, multi: Bool) -> Text? {
    markKey(for: state, multi: multi).map { Text(LocalizedStringKey($0)) }
}

// MARK: - Prompt

/// The question on its torn sheet: instruction tag, speaker and statement (true/false with a
/// `statement`), the prompt in two lines with "Nghe câu hỏi" at the end of its row (canvas), the
/// picture of the question.
struct QuestionPrompt: View {
    let item: QuizItem
    let mode: LanguageMode
    let showsSecond: Bool
    /// What "Nghe câu hỏi" plays (`LessonSession.questionUtterance`); hidden when empty.
    var listen: Utterance = Utterance(id: "question", clips: [])
    /// `fill_blank_bank`: the words in the blanks now, and their look after a check.
    var filled: [String] = []
    var blankState: ChoiceState?
    @Environment(\.layoutMetrics) private var metrics

    var body: some View {
        TornSheet {
            VStack(alignment: .leading, spacing: Tokens.Space.s10) {
                if let instruction = item.instruction {
                    PaperTag(Text(verbatim: mode.name(instruction)))
                        .accessibilityIdentifier("lesson.instruction")
                }
                if case .trueFalse(let tf) = item.answer, let statement = tf.statement {
                    StatementBubble(statement: statement, speaker: tf.speaker, mode: mode, showsSecond: showsSecond)
                }
                HStack(alignment: .center, spacing: Tokens.Space.s12) {
                    if let image = item.image {
                        PlaceholderArt(color: nil, size: metrics.illustration(LessonMetrics.sheetArt), accessibilityLabel: Text(verbatim: image.alt.en))
                    }
                    if case .fillBlankBank(let fill) = item.answer {
                        FillBlankSentence(fill: fill, filled: filled, mode: mode, showsSecond: showsSecond, state: blankState)
                    } else {
                        BilingualLines(spoken: item.prompt, mode: mode, showsSecond: showsSecond, identifier: "lesson.prompt")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    ListenButton(listen, label: "lesson.listen.question")
                }
            }
        }
    }
}

/// A child of the story says something (`speaker`, `statement`): figure, name, speech bubble.
struct StatementBubble: View {
    let statement: Spoken
    let speaker: String?
    let mode: LanguageMode
    let showsSecond: Bool
    @Environment(\.layoutMetrics) private var metrics

    var body: some View {
        HStack(alignment: .center, spacing: Tokens.Space.s12) {
            if let speaker {
                VStack(spacing: Tokens.Space.s4) {
                    Image("ArtSpeaker" + speaker.prefix(1).uppercased() + speaker.dropFirst(), bundle: .main)
                        .resizable()
                        .scaledToFit()
                        .frame(width: metrics.illustration(LessonMetrics.speakerArt), height: metrics.illustration(LessonMetrics.speakerArt))
                        .paperDropShadow(Tokens.Shadow.dropTag)
                        .accessibilityHidden(true)
                    PaperTag(Text(LocalizedStringKey("speaker." + speaker)), style: .chip(dot: Tokens.Role.textAccent))
                }
            }
            BilingualLines(spoken: statement, mode: mode, showsSecond: showsSecond)
                .padding(EdgeInsets(top: Tokens.Space.s12, leading: Tokens.Space.s14, bottom: Tokens.Space.s12, trailing: Tokens.Space.s14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .paperSurface(Tokens.Role.bgScreen, shadow: Tokens.Shadow.paper2, in: UnevenRoundedRectangle(
                    topLeadingRadius: Tokens.Radius.bubble, bottomLeadingRadius: Tokens.Radius.bubbleTail,
                    bottomTrailingRadius: Tokens.Radius.bubble, topTrailingRadius: Tokens.Radius.bubble, style: .continuous
                ))
                .accessibilityElement(children: .combine)
                .accessibilityIdentifier("lesson.statement")
        }
    }
}

/// The sentence of `fill_blank_bank` with its blanks filled by `filled` (bank keys in blank order).
struct FillBlankSentence: View {
    let fill: QuizItem.FillBlankBank
    let filled: [String]
    let mode: LanguageMode
    let showsSecond: Bool
    /// Right / wrong look of the filled blanks after a check; `nil` while editing.
    let state: ChoiceState?

    var body: some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s4) {
            Text(attributed(mode.sentenceLanguage, line: Tokens.Typography.sentence))
                .typography(Tokens.Typography.sentence)
                .fixedSize(horizontal: false, vertical: true)
                .accessibilityIdentifier("lesson.prompt")
            if showsSecond {
                Text(attributed(mode.sentenceSecondLanguage, line: Tokens.Typography.body))
                    .typography(Tokens.Typography.body)
                    .foregroundStyle(Tokens.Role.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func attributed(_ language: ContentLanguage, line: Tokens.Typography) -> AttributedString {
        Self.sentence(fill, filled: filled, language: language, line: line, state: state)
    }

    /// The sentence in `language`, set in `line` (the text role of the line: `sentence` for the
    /// main line, `body` for the second), with its blanks.
    ///
    /// An empty blank is a sunken box: figure spaces around "?" keep it wide enough to see.
    ///
    /// A filled blank is the word alone (designer table, SK-013 "Từ điền chỗ trống không chip").
    /// It has no padding characters, no underline and no chip, so it sits between the sentence's
    /// own spaces and its punctuation (L9). Its look depends on the state, the same on both lines
    /// and in both languages:
    ///
    /// | State | Background | Text | Weight |
    /// | --- | --- | --- | --- |
    /// | choosing (`nil`, not checked yet) | `state_selected` (vàng hoè) | `text_primary` | 700 |
    /// | right (`.correct`) | none | `text_correct` (lá tre) | 700 |
    /// | wrong (`.wrong`, first try and last) | `feedback_wrong` (giấy lõm) | `text_secondary` | 400 |
    ///
    /// The background colour is the one of the paper behind the tapped word cell, so the child
    /// sees the same colour in the sentence and on the cell. Without colour the three states still
    /// differ: background + bold, plain bold, background + regular.
    ///
    /// The font keeps the line's family and size and changes only the weight, through
    /// `SKFont.font(_:)`. So it scales with Dynamic Type, under the cap that `.typography(_:)` puts on
    /// the whole `Text`, and the line height does not change. Spaces inside the word become
    /// no-break spaces, so the background of "năng lượng" is never cut in two at a line end.
    static func sentence(
        _ fill: QuizItem.FillBlankBank, filled: [String], language: ContentLanguage,
        line: Tokens.Typography, state: ChoiceState?
    ) -> AttributedString {
        let segments = language == .en ? fill.segmentsEN : fill.segmentsVI
        var result = AttributedString()
        for segment in segments {
            switch segment {
            case .text(let text):
                result += AttributedString(text)
            case .blank(let number):
                let index = number - 1
                let word = filled.indices.contains(index)
                    ? fill.bank.first { $0.key == filled[index] }.map { $0.label.text(in: language) }
                    : nil
                guard let word else {
                    var empty = AttributedString("\u{2007}\u{2007}?\u{2007}\u{2007}")
                    empty.backgroundColor = Tokens.Role.surfaceSunken
                    empty.foregroundColor = Tokens.Role.textSecondary
                    result += empty
                    continue
                }
                let look = FilledWordLook(state: state)
                var blank = AttributedString(word.replacingOccurrences(of: " ", with: "\u{00A0}"))
                blank.backgroundColor = look.background
                blank.foregroundColor = look.foreground
                blank.font = SKFont.font(look.style(line: line))
                result += blank
            }
        }
        return result
    }
}

/// Look of a word put in a blank, by state (see `FillBlankSentence.sentence`).
struct FilledWordLook: Equatable {
    let background: Color?
    let foreground: Color
    let weight: Int

    init(state: ChoiceState?) {
        switch state {
        case .correct?:
            background = nil
            foreground = Tokens.Role.textCorrect
            weight = Tokens.FontWeight.textBold
        case .wrong?:
            background = Tokens.Role.feedbackWrong
            foreground = Tokens.Role.textSecondary
            weight = Tokens.FontWeight.textRegular
        default:
            background = Tokens.Role.stateSelected
            foreground = Tokens.Role.textPrimary
            weight = Tokens.FontWeight.textBold
        }
    }

    /// The line's text role with this weight: same family, size, line height, spacing and case.
    func style(line: Tokens.Typography) -> Tokens.Typography {
        Tokens.Typography(
            family: line.family, size: line.size, weight: weight,
            lineHeight: line.lineHeight, letterSpacing: line.letterSpacing, textCase: line.textCase
        )
    }
}

// MARK: - Answers

/// The answer cells of a question in its format. `onTap` gets the key (choices, bank) or the
/// value (true/false) the child tapped; the screen decides whether it fills the draft or answers.
struct AnswerArea: View {
    let item: QuizItem
    let display: AnswerDisplay
    let mode: LanguageMode
    let showsSecond: Bool
    let onTapKey: (String) -> Void
    let onTapValue: (Bool) -> Void

    @Environment(\.layoutMetrics) private var metrics

    var body: some View {
        switch item.answer {
        case .singleChoice(let choice):
            ChoiceCells(options: choice.options, multi: false, display: display, mode: mode, showsSecond: showsSecond, onTap: onTapKey)
        case .multiChoice(let choice):
            ChoiceCells(options: choice.options, multi: true, display: display, mode: mode, showsSecond: showsSecond, onTap: onTapKey)
        case .trueFalse(let tf):
            TrueFalseCards(item: tf, tall: tf.statement != nil, display: display, mode: mode, onTap: onTapValue)
        case .fillBlankBank(let fill):
            BankChips(fill: fill, display: display, mode: mode, onTap: onTapKey)
        case .orderSequence, .pictureBarChart, .unknown:
            EmptyView()
        }
    }
}

/// Choice answers: a grid of picture cells (3 columns on the phone, `layout.grid.quiz`), or a list
/// of text cells when no option has a picture.
struct ChoiceCells: View {
    let options: [QuizItem.ChoiceOption]
    let multi: Bool
    let display: AnswerDisplay
    let mode: LanguageMode
    let showsSecond: Bool
    let onTap: (String) -> Void
    @Environment(\.layoutMetrics) private var metrics

    var body: some View {
        let pictures = options.contains { $0.image != nil }
        Group {
            if pictures {
                LazyVGrid(columns: metrics.gridColumns(for: metrics.quizGrid), spacing: metrics.quizGrid.rowGap) {
                    ForEach(Array(options.enumerated()), id: \.element.key) { index, option in
                        cell(option, height: metrics.quizGrid.cellHeight)
                            .reveal(order: index, step: Tokens.Motion.Stagger.stepDense)
                    }
                }
            } else {
                VStack(spacing: Tokens.Space.s10) {
                    ForEach(Array(options.enumerated()), id: \.element.key) { index, option in
                        cell(option, height: LessonMetrics.textChoiceMinHeight)
                            .reveal(order: index, step: Tokens.Motion.Stagger.stepDense)
                    }
                }
            }
        }
        // Room for the marks astride the top edge of the first row (SK-013, Duy 31/10).
        .padding(.top, PaperMetrics.markRoomAbove)
        .padding(.trailing, metrics.gridTrailingInset)
        .padding(.bottom, metrics.gridTrailingInset)
    }

    private func cell(_ option: QuizItem.ChoiceOption, height: CGFloat) -> some View {
        let state = display.state(forKey: option.key, correct: option.correct)
        return Button {
            onTap(option.key)
        } label: {
            VStack(spacing: Tokens.Space.s2) {
                if let image = option.image {
                    PlaceholderArt(color: nil, size: metrics.illustration(LessonMetrics.cellArt), accessibilityLabel: Text(verbatim: image.alt.en))
                        .frame(maxHeight: .infinity)
                }
                Text(verbatim: mode.sentence(option.label))
                    .typography(Tokens.Typography.itemTitle, fixedBox: true)
                    .lineLimit(2)
                    .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                if showsSecond {
                    Text(verbatim: mode.secondSentence(option.label))
                        .typography(Tokens.Typography.caption, fixedBox: true)
                        .foregroundStyle(Tokens.Role.textSecondary)
                        .lineLimit(1)
                        .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                }
            }
            .multilineTextAlignment(.center)
            .padding(EdgeInsets(top: Tokens.Space.s6, leading: Tokens.Space.s6, bottom: Tokens.Space.s10, trailing: Tokens.Space.s6))
            .frame(maxWidth: .infinity, minHeight: height)
        }
        .buttonStyle(PaperChoiceStyle(state: state, mark: markText(for: state, multi: multi)))
        .disabled(!display.canTap(key: option.key))
        .accessibilityLabel(Text(verbatim: option.label.en))
        .accessibilityIdentifier("lesson.option.\(option.key)")
    }
}

/// True / false as two big cards: the content's `labels` (what a speaker says) or the app's
/// Đúng · Sai / True · False, named like a name (canvas: Vietnamese first in Song ngữ).
struct TrueFalseCards: View {
    let item: QuizItem.TrueFalse
    let tall: Bool
    let display: AnswerDisplay
    let mode: LanguageMode
    let onTap: (Bool) -> Void
    @Environment(\.layoutMetrics) private var metrics

    var body: some View {
        HStack(spacing: Tokens.Space.s12) {
            card(true, label: item.labels?.trueLabel ?? Self.defaultLabel(true))
            card(false, label: item.labels?.falseLabel ?? Self.defaultLabel(false))
        }
        // Room for the marks astride the top edge (SK-013, Duy 31/10).
        .padding(.top, PaperMetrics.markRoomAbove)
        .padding(.trailing, metrics.gridTrailingInset)
        .padding(.bottom, metrics.gridTrailingInset)
    }

    /// Đúng · Sai / True · False from the string catalog (same text in every interface language:
    /// these are the content's two languages).
    static func defaultLabel(_ value: Bool) -> Spoken {
        value
            ? Spoken(en: String(localized: "lesson.tf.true.en"), vi: String(localized: "lesson.tf.true.vi"))
            : Spoken(en: String(localized: "lesson.tf.false.en"), vi: String(localized: "lesson.tf.false.vi"))
    }

    private func card(_ value: Bool, label: Spoken) -> some View {
        let state = display.state(forValue: value, answer: item.answer)
        return Button {
            onTap(value)
        } label: {
            VStack(spacing: Tokens.Space.s2) {
                Text(verbatim: mode.name(label))
                    .typography(Tokens.Typography.titleS, fixedBox: true)
                    .lineLimit(2)
                    .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                if let second = mode.secondName(label) {
                    Text(verbatim: second)
                        .typography(Tokens.Typography.bodyS, fixedBox: true)
                        .foregroundStyle(Tokens.Role.textSecondary)
                        .lineLimit(1)
                }
            }
            .multilineTextAlignment(.center)
            .padding(Tokens.Space.s8)
            .frame(maxWidth: .infinity, minHeight: tall ? LessonMetrics.trueFalseHeightTall : LessonMetrics.trueFalseHeight)
        }
        .buttonStyle(PaperChoiceStyle(state: state, mark: markText(for: state, multi: false)))
        .disabled(!display.canTap(value: value))
        .accessibilityLabel(Text(verbatim: label.en))
        .accessibilityIdentifier("lesson.tf.\(value)")
    }
}

/// The word bank of `fill_blank_bank`: one chip per word (3 columns), a dot and the word.
struct BankChips: View {
    let fill: QuizItem.FillBlankBank
    let display: AnswerDisplay
    let mode: LanguageMode
    let onTap: (String) -> Void
    @Environment(\.layoutMetrics) private var metrics
    @Environment(\.ageGroup) private var ageGroup

    var body: some View {
        LazyVGrid(columns: metrics.gridColumns(for: metrics.quizGrid), spacing: Tokens.Space.s10) {
            ForEach(Array(fill.bank.enumerated()), id: \.element.key) { index, word in
                chip(word).reveal(order: index, step: Tokens.Motion.Stagger.stepDense)
            }
        }
        // Room for the marks astride the top edge (SK-013, Duy 31/10).
        .padding(.top, PaperMetrics.markRoomAbove)
        .padding(.trailing, metrics.gridTrailingInset)
        .padding(.bottom, metrics.gridTrailingInset)
    }

    /// The mark on a bank word (SK-013, Duy 31/10, canvas `Discoverer-QuizFill`), only once the
    /// answer is checked:
    /// - right: "Đúng" on the word put in;
    /// - wrong, first try: "Chưa đúng" on the word put in, nothing on the others (the second try
    ///   still asks the child to think);
    /// - wrong, last try: "Chưa đúng" on the word put in, "Đáp án" on the right word.
    ///
    /// While the child is choosing there is no mark. That covers "Thử lại", where the marks go with
    /// the word in the blank, and Khởi động, where a tapped wrong word is only greyed out (canvas
    /// `Discoverer-Warmup`).
    static func wordMarkKey(display: AnswerDisplay, key: String, correct: Bool) -> String? {
        guard !display.isEditing else { return nil }
        return markKey(for: display.state(forKey: key, correct: correct), multi: false)
    }

    private func chip(_ word: QuizItem.FillBlankBank.BankWord) -> some View {
        let correct = fill.answers.contains(word.key)
        let state = display.state(forKey: word.key, correct: correct)
        let mark = Self.wordMarkKey(display: display, key: word.key, correct: correct).map { Text(LocalizedStringKey($0)) }
        let inactive = !display.canTap(key: word.key) && display.isEditing
        return Button {
            onTap(word.key)
        } label: {
            HStack(spacing: Tokens.Space.s8) {
                Circle()
                    .fill(inactive ? Tokens.Role.textSecondary : Tokens.Role.textAccent)
                    .frame(width: LessonMetrics.bankDot, height: LessonMetrics.bankDot)
                    .accessibilityHidden(true)
                Text(verbatim: mode.sentence(word.label))
                    .typography(Tokens.Typography.sentence, fixedBox: true)
                    .lineLimit(1)
                    .minimumScaleFactor(PaperMetrics.labelMinimumScale)
            }
            .padding(.horizontal, Tokens.Space.s8)
            .frame(maxWidth: .infinity, minHeight: ageGroup.touchTarget)
        }
        .buttonStyle(PaperChoiceStyle(state: state, mark: mark))
        .disabled(!display.canTap(key: word.key))
        .accessibilityLabel(Text(verbatim: word.label.en))
        // VoiceOver: "energy, Đúng", "air, Chưa đúng".
        .accessibilityValue(mark ?? Text(verbatim: ""))
        .accessibilityIdentifier("lesson.word.\(word.key)")
    }
}
