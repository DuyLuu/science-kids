import AudioKit
import ContentModel
import DesignSystem
import LessonEngine
import Profiles
import SwiftUI

/// One question of Khởi động (canvas Discoverer 8) or of the Quiz (canvas 11, 12).
///
/// - Quiz: pick → "Kiểm tra". Right → the result sheet rises ("Chính xác!" and the XP on the first
///   try). Wrong on the first try → marks on the picks, the hint on a folded slip, "Thử lại".
///   Wrong on the last try (`max_tries`) → the result sheet with `explanation_wrong` and the right
///   answers marked.
/// - Khởi động: no "Kiểm tra" (canvas): tapping an answer answers; after a wrong try the child
///   taps another answer. Same tries and texts, never scored.
struct QuestionStep<Header: View>: View {
    let session: LessonSession
    let phase: QuestionPhase
    let index: Int
    let item: QuizItem
    let isLast: Bool
    @ViewBuilder let header: Header

    @State private var draft = AnswerDraft()
    @State private var editingRetry = false
    @State private var showsHint = false
    @Environment(\.speechPlayer) private var speech

    private var mode: LanguageMode { session.languageMode }
    private var showsSecond: Bool { session.showsSecondLanguage }
    private var status: QuestionStatus { session.status(of: item, in: phase) }
    private var answersByTapping: Bool { phase == .warmup }

    private var display: AnswerDisplay {
        switch status {
        case .open:
            return .editing(draft)
        case .retry(let last):
            if answersByTapping { return .editing(draft, tried: .from(last)) }
            return editingRetry ? .editing(draft) : .afterFirstTry(.from(last))
        case .done(_, _, let last):
            return .final(.from(last))
        }
    }

    var body: some View {
        PaperFrame(scrolls: true) {
            VStack(alignment: .leading, spacing: LessonMetrics.gap) {
                header.reveal(order: 0)
                QuestionPrompt(
                    item: item, mode: mode, showsSecond: showsSecond,
                    listen: session.questionUtterance(item),
                    filled: shownKeys, blankState: blankState
                )
                .motion(Tokens.Motion.Preset.slide, delay: Tokens.Motion.Stagger.step * 2)
                if case .fillBlankBank = item.answer {
                    Text(verbatim: [mode.name(item.prompt), mode.secondName(item.prompt)].compactMap { $0 }.joined(separator: " · "))
                        .typography(Tokens.Typography.caption)
                        .foregroundStyle(Tokens.Role.textSecondary)
                        .reveal(order: 3)
                }
                AnswerArea(
                    item: item, display: display, mode: mode, showsSecond: showsSecond,
                    onTapKey: tap(key:), onTapValue: tap(value:)
                )
                if phase == .quiz, status == .open {
                    hint.reveal(order: 4)
                }
                if answersByTapping, case .retry = status {
                    HintNote(hint: item.hint, feedback: retryFeedback, mode: mode, listen: retryUtterance)
                }
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) { bottom }
    }

    // MARK: Taps

    /// A tapped answer word says itself (SK-016), then does what the tap does.
    private func tap(key: String) {
        let word = answerLabel(forKey: key)
        switch item.answer {
        case .singleChoice:
            draft.keys = [key]
            if answersByTapping { return submit(saying: word) }
        case .multiChoice:
            if let at = draft.keys.firstIndex(of: key) { draft.keys.remove(at: at) } else { draft.keys.append(key) }
        case .fillBlankBank(let fill):
            if let at = draft.keys.firstIndex(of: key) {
                draft.keys.remove(at: at)
            } else if draft.keys.count < fill.answers.count {
                draft.keys.append(key)
            }
            if answersByTapping, draft.keys.count == fill.answers.count { return submit(saying: word) }
        case .trueFalse, .orderSequence, .pictureBarChart, .unknown:
            break
        }
        speech?.play(session.utterance("word.\(key)", word))
    }

    private func tap(value: Bool) {
        let word = LessonSession.answerName(item, value: value)
        draft.bool = value
        if answersByTapping { return submit(saying: word) }
        if let word { speech?.play(session.utterance("word.\(item.key).\(value)", word)) }
    }

    /// Scores the draft. SK-044: says why at once (the tapped word first, when a tap answered):
    /// the option's feedback and the hint after a wrong try with a try left, the explanation once
    /// done (right or out of tries).
    private func submit(saying word: Spoken? = nil) {
        guard let attempt = draft.attempt(for: item.answer) else { return }
        let after = session.submit(attempt, for: item, in: phase)
        if let result = session.resultUtterance(item, status: after, name: word) {
            speech?.play(result)
        } else if let word {
            speech?.play(session.utterance("word.\(item.key)", word))
        }
        draft = AnswerDraft()
        editingRetry = false
    }

    /// The label of a choice or bank word, by key.
    private func answerLabel(forKey key: String) -> Spoken? {
        switch item.answer {
        case .singleChoice(let choice): choice.options.first { $0.key == key }?.label
        case .multiChoice(let choice): choice.options.first { $0.key == key }?.label
        case .fillBlankBank(let fill): fill.bank.first { $0.key == key }?.label
        case .trueFalse, .orderSequence, .pictureBarChart, .unknown: nil
        }
    }

    /// SK-044: the feedback of the option just tried, shown above the hint.
    private var retryFeedback: Spoken? {
        guard case .retry(let last) = status else { return nil }
        return LessonSession.feedback(item, for: last)
    }

    private var retryUtterance: Utterance {
        guard case .retry = status, let utterance = session.resultUtterance(item, status: status) else { return hintUtterance }
        return utterance
    }

    private var hintUtterance: Utterance {
        session.utterance("hint.\(item.key)", item.hint)
    }

    // MARK: Parts

    /// Words in the blanks: the draft while editing, else the last try.
    private var shownKeys: [String] {
        if case .editing(let draft, _) = display { return draft.keys }
        return status.lastTry.map { AnswerDraft.from($0).keys } ?? []
    }

    private var blankState: ChoiceState? {
        switch status {
        case .open: nil
        case .retry: answersByTapping || editingRetry ? nil : .wrong
        case .done(let correct, _, _): correct ? .correct : .wrong
        }
    }

    /// "Gợi ý" (canvas Quiz): opens the hint before the child answers; counts as `hint_used`.
    private var hint: some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s10) {
            TwoLayerButton("lesson.hint", role: .secondary) {
                showsHint.toggle()
                if showsHint { session.markHintUsed(item) }
            }
            .fixedSize()
            .accessibilityAddTraits(showsHint ? .isSelected : [])
            .accessibilityIdentifier("lesson.hint_button")
            if showsHint {
                HStack(alignment: .center, spacing: Tokens.Space.s10) {
                    Text(verbatim: mode.name(item.hint))
                        .typography(Tokens.Typography.body)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .accessibilityIdentifier("lesson.hint_text")
                    ListenButton(hintUtterance, label: "lesson.listen.hint")
                }
                .padding(EdgeInsets(top: Tokens.Space.s10, leading: Tokens.Space.s14, bottom: Tokens.Space.s10, trailing: Tokens.Space.s14))
                .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper3, cornerRadius: Tokens.Radius.discoverer)
                .motion(Tokens.Motion.Preset.slide)
            }
        }
    }

    @ViewBuilder private var bottom: some View {
        switch status {
        case .done(let correct, let firstTry, _):
            ResultSheet(
                correct: correct, firstTry: firstTry,
                xp: session.xpEarned(by: item, in: phase),
                explanation: correct ? item.explanationCorrect : item.explanationWrong,
                mode: mode, showsSecond: showsSecond,
                listen: session.utterance(
                    "explanation.\(item.key).\(correct ? "correct" : "wrong")",
                    correct ? item.explanationCorrect : item.explanationWrong
                ),
                buttonTitle: isLast ? (phase == .warmup ? "lesson.warmup.done" : "lesson.quiz.done") : "lesson.next",
                action: session.advance
            )
        case .retry(let last):
            if !answersByTapping {
                BottomBar {
                    VStack(spacing: Tokens.Space.s10) {
                        HintNote(hint: item.hint, feedback: retryFeedback, mode: mode, listen: retryUtterance)
                        if editingRetry {
                            checkButton
                        } else {
                            TwoLayerButton("lesson.retry", icon: .retry) {
                                if case .multiChoice = item.answer { draft = .from(last) } else { draft = AnswerDraft() }
                                editingRetry = true
                            }
                            .accessibilityIdentifier("lesson.retry")
                        }
                    }
                }
            }
        case .open:
            if !answersByTapping {
                BottomBar { checkButton }
            }
        }
    }

    private var checkButton: some View {
        TwoLayerButton("lesson.check", action: { submit() })
            .disabled(draft.attempt(for: item.answer) == nil)
            .accessibilityIdentifier("lesson.check")
    }
}

/// Khởi động: the label of the question's `recall_from` and the warmup squares (canvas row
/// "Nhớ lại · … · 2 câu nhanh").
struct WarmupTagRow: View {
    let item: QuizItem
    let index: Int
    let count: Int

    var body: some View {
        HStack(spacing: Tokens.Space.s10) {
            PaperTag(Text(recallLabel))
            Text("lesson.warmup.count \(count)")
                .typography(Tokens.Typography.caption)
                .foregroundStyle(Tokens.Role.textSecondary)
            Spacer(minLength: 0)
            ProgressSquares(
                count: count, current: index, squareSize: PaperMetrics.progressSquareSmall,
                accessibilityLabel: Text("lesson.warmup.progress_a11y \(index + 1) \(count)")
            )
        }
    }

    /// SK-002: "Nhớ lại · điều em đã biết" for prior knowledge, "Nhớ lại · bài trước" for a lesson.
    private var recallLabel: LocalizedStringKey {
        switch item.recallFrom {
        case .lesson: "lesson.warmup.recall_lesson"
        case .priorKnowledge, .unknown, nil: "lesson.warmup.recall_prior"
        }
    }
}

/// Quiz header (canvas): close, the question squares, "Câu n/6", the "VI" switch.
struct QuizHeader: View {
    let session: LessonSession
    let index: Int
    let currentDone: Bool
    let onClose: () -> Void

    var body: some View {
        let count = session.quizItems.count
        HStack(spacing: Tokens.Space.s12) {
            PaperIconButton(.close, accessibilityLabel: Text("lesson.quiz.close"), action: onClose)
                .accessibilityIdentifier("lesson.back")
            ProgressSquares(
                count: count, current: index + (currentDone ? 1 : 0),
                accessibilityLabel: Text("lesson.quiz.progress_a11y \(index + 1) \(count)")
            )
            .frame(maxWidth: .infinity)
            Text("lesson.quiz.counter \(index + 1) \(count)")
                .typography(Tokens.Typography.number)
                .accessibilityIdentifier("lesson.quiz.counter")
            SecondLanguageSwitch(session: session)
        }
    }
}
