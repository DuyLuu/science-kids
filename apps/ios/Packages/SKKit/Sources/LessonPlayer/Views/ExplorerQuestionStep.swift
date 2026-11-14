import AudioKit
import ContentModel
import DesignSystem
import LessonEngine
import Profiles
import SwiftUI

/// One Explorer question, in Khởi động or the Quiz (SK-040; SK-026 "Explorer: một câu không cần
/// đọc"; canvas `Explorer-Quiz-A`, `Explorer-QuizTF`).
///
/// 1. The question plays by itself when the step opens (`LessonPlayerView`), and its words show
///    in the mascot's bubble; the bubble replays it.
/// 2. Choices are pictures only (iPhone: one under the other; iPad: one row). True / false is the
///    nod and the shake. VoiceOver reads each card's `label`.
/// 3. A tap is the answer (D4): the try is scored at once, the app reads the picture's name and
///    then the hint or the explanation; the cards show the result after the name (0.9 s).
/// 4. Right: the square seal, `explanation_correct`, the arrow. Wrong with a try left: the card
///    sinks, its corner peels with the retry arrow, the hint plays. Out of tries: the right card
///    on vàng hoè nhạt, `explanation_wrong`, the arrow.
/// No step needs reading: no "Kiểm tra", no text on a card, no word on a button.
struct ExplorerQuestionStep: View {
    let session: LessonSession
    let phase: QuestionPhase
    let index: Int
    let item: QuizItem
    let isLast: Bool
    let onClose: () -> Void

    /// The card whose name is being read, before its result shows.
    @State private var naming: String?
    @Environment(\.speechPlayer) private var speech
    @Environment(\.layoutMetrics) private var metrics

    private var mode: LanguageMode { session.languageMode }
    private var status: QuestionStatus { session.status(of: item, in: phase) }
    private var tried: [String] { triedKeys(session.tries(for: item, in: phase)) }
    private var count: Int { phase == .warmup ? session.warmupItems.count : session.quizItems.count }
    /// Card height of `count` picture choices (phone: taller when there are two).
    private func cardHeight(_ count: Int) -> CGFloat {
        if metrics.isRegular { return ExplorerMetrics.choiceHeightRegular }
        return count <= 2 ? ExplorerMetrics.choiceHeightTwo : ExplorerMetrics.choiceHeight
    }

    private var showsQuestionPicture: Bool {
        switch item.answer {
        case .singleChoice(let choice): choice.options.contains { $0.image == nil }
        case .orderSequence(let order): order.items.contains { $0.image == nil }
        default: true
        }
    }

    private var isTrueFalse: Bool {
        if case .trueFalse = item.answer { return true }
        return false
    }

    /// The first true / false of the lesson, not answered yet: the bubble says how to answer and
    /// the nod card nudges (then it is the screen's loop, so the mascot does not sway).
    private var showsTrueFalseIntro: Bool {
        guard case .trueFalse = item.answer else { return false }
        return status == .open && naming == nil && session.isFirstTrueFalse(item)
    }

    var body: some View {
        PaperFrame(scrolls: true) {
            VStack(alignment: .leading, spacing: LessonMetrics.gap) {
                ExplorerTopBar(
                    count: count, current: index,
                    closeLabel: phase == .warmup ? "lesson.back" : "lesson.quiz.close",
                    session: session, onClose: onClose
                )
                .reveal(order: 0)
                ExplorerSpeechRow(
                    mood: ExplorerMood.of(status: status, naming: naming != nil),
                    lines: bubbleLines,
                    note: showsTrueFalseIntro ? "lesson.explorer.tf_intro" : nil,
                    mode: mode, showsSecond: session.showsSecondLanguage,
                    listen: naming == nil ? session.explorerLineUtterance(item, status: status) : Utterance(id: "naming", clips: []),
                    sways: !status.isDone && !showsTrueFalseIntro
                )
                .reveal(order: 1)
                // SK-043 hướng A: the question's picture only where the answers have none (true /
                // false); picture choices and orders carry the pictures themselves.
                if let image = item.image, showsQuestionPicture {
                    // Explorer-A: the photo fills its paper (true / false: 336 × 250), cropped.
                    let height = metrics.illustration(isTrueFalse ? ExplorerMetrics.questionPhotoHeight : ExplorerMetrics.questionSheetHeightWithCards)
                    ContentPicture(image: image, color: nil, size: height - 2 * Tokens.Space.s8, box: .fillWidth)
                        .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.explorer - Tokens.Space.s8, style: .continuous))
                        .padding(Tokens.Space.s8)
                        .frame(maxWidth: .infinity)
                        .frame(height: height)
                        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.explorer)
                        .reveal(order: 2)
                }
                answers
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            if status.isDone, naming == nil {
                BottomBar {
                    ExplorerNextButton(label: nextLabel, action: session.advance)
                }
                .motion(Tokens.Motion.Preset.rise)
            }
        }
        .task(id: naming) {
            guard naming != nil else { return }
            try? await Task.sleep(for: ExplorerMetrics.nameBeat)
            if !Task.isCancelled { naming = nil }
        }
    }

    /// The bubble: the tapped picture's name while it is read, else the line of the status.
    private var bubbleLines: [Spoken] {
        if let naming {
            if let name = name(of: naming) { return [name] }
        }
        return LessonSession.explorerLine(item, status: naming == nil ? status : .open)
    }

    private var nextLabel: LocalizedStringKey {
        guard isLast else { return "lesson.next" }
        return phase == .warmup ? "lesson.warmup.done" : "lesson.explorer.to_reward"
    }

    // MARK: Answers

    @ViewBuilder private var answers: some View {
        switch item.answer {
        case .singleChoice(let choice):
            choiceCards(choice.options)
        case .trueFalse(let tf):
            trueFalseCards(tf)
        case .orderSequence(let order):
            ExplorerOrderSequence(
                order: order, status: status, tried: session.tries(for: item, in: phase),
                naming: naming, mode: mode,
                onPlace: { key in speech?.play(session.utterance("word.\(key)", LessonSession.answerName(item, key: key))) },
                onComplete: { keys in answer(.order(keys), pick: keys.joined(separator: ","), name: keys.last.flatMap { LessonSession.answerName(item, key: $0) }) }
            )
            .reveal(order: 3)
        case .multiChoice, .fillBlankBank, .pictureBarChart, .unknown:
            EmptyView()
        }
    }

    /// iPhone: cards one under the other (canvas); iPad (regular): one row.
    private func choiceCards(_ options: [QuizItem.ChoiceOption]) -> some View {
        let layout = metrics.isRegular
            ? AnyLayout(HStackLayout(spacing: Tokens.Space.s12))
            : AnyLayout(VStackLayout(spacing: Tokens.Space.s12))
        return layout {
            ForEach(Array(options.enumerated()), id: \.element.key) { offset, option in
                let look = ExplorerCardLook.of(key: option.key, tried: tried, isCorrect: option.correct, status: status, naming: naming)
                Button {
                    answer(.selected(option.key), pick: option.key, name: option.label)
                } label: {
                    ExplorerCardFace(look: look, showsRetry: status.isRetry, height: cardHeight(options.count)) {
                        // SK-043 hướng A: the photo fills the card, cropped.
                        ContentPicture(
                            asset: option.image?.asset, color: nil,
                            size: cardHeight(options.count) - 2 * Tokens.Space.s8,
                            box: .fillWidth, accessibilityLabel: nil
                        )
                        .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.explorer - Tokens.Space.s8, style: .continuous))
                        .padding(Tokens.Space.s8)
                    }
                }
                .buttonStyle(.paperPress)
                .disabled(!canTap(option.key))
                .accessibilityLabel(Text(verbatim: mode.sentence(option.label)))
                .accessibilityValue(look.accessibilityValue ?? Text(verbatim: ""))
                .accessibilityAddTraits(look == .naming ? .isSelected : [])
                .accessibilityIdentifier("lesson.choice.\(option.key)")
                .reveal(order: 3 + offset, step: Tokens.Motion.Stagger.stepDense)
            }
        }
        .padding(.trailing, metrics.gridTrailingInset)
        .padding(.bottom, Tokens.Space.s6)
        .accessibilityElement(children: .contain)
        .accessibilityLabel(Text("lesson.explorer.choices"))
    }

    /// The nod (true) and the shake (false), side by side; no word on either (D2).
    private func trueFalseCards(_ tf: QuizItem.TrueFalse) -> some View {
        HStack(spacing: Tokens.Space.s12) {
            ForEach([true, false], id: \.self) { value in
                let key = String(value)
                let look = ExplorerCardLook.of(key: key, tried: tried, isCorrect: value == tf.answer, status: status, naming: naming)
                Button {
                    answer(.value(value), pick: key, name: LessonSession.answerName(item, value: value))
                } label: {
                    ExplorerCardFace(look: look, showsRetry: status.isRetry, height: metrics.illustration(ExplorerMetrics.trueFalseHeight)) {
                        Image(value ? "ArtExplorerNod" : "ArtExplorerShake", bundle: .main)
                            .resizable()
                            .scaledToFit()
                            .frame(width: metrics.illustration(ExplorerMetrics.trueFalseIcon), height: metrics.illustration(ExplorerMetrics.trueFalseIcon))
                            .paperDropShadow(Tokens.Shadow.paper1)
                            .modifier(LoopMotion(preset: Tokens.Motion.Preset.nudge, active: value && showsTrueFalseIntro))
                    }
                }
                .buttonStyle(.paperPress)
                .disabled(!canTap(key))
                .accessibilityLabel(Text(value ? "lesson.explorer.true" : "lesson.explorer.false"))
                .accessibilityValue(look.accessibilityValue ?? Text(verbatim: ""))
                .accessibilityIdentifier("lesson.tf.\(key)")
                .reveal(order: 3 + (value ? 0 : 1), step: Tokens.Motion.Stagger.stepDense)
            }
        }
        .padding(.trailing, metrics.gridTrailingInset)
        .padding(.bottom, Tokens.Space.s6)
        .accessibilityElement(children: .contain)
        .accessibilityLabel(Text("lesson.explorer.true_false"))
    }

    // MARK: Taps

    private func canTap(_ key: String) -> Bool {
        naming == nil && !status.isDone && !tried.contains(key)
    }

    /// A tap is the answer (D4): scored now; the name, then the hint or explanation, play as one.
    private func answer(_ attempt: Try, pick: String, name: Spoken?) {
        guard naming == nil, !status.isDone else { return }
        let triesBefore = session.tries(for: item, in: phase).count
        let after = session.submit(attempt, for: item, in: phase)
        // A try the engine refused (logged by the session) changes nothing on screen.
        guard session.tries(for: item, in: phase).count > triesBefore else { return }
        naming = pick
        speech?.play(session.explorerAnswerUtterance(item, name: name, status: after))
    }

    private func name(of pick: String) -> Spoken? {
        switch item.answer {
        case .trueFalse: LessonSession.answerName(item, value: pick == "true")
        case .orderSequence: pick.split(separator: ",").last.flatMap { LessonSession.answerName(item, key: String($0)) }
        default: LessonSession.answerName(item, key: pick)
        }
    }
}

extension QuestionStatus {
    var isRetry: Bool {
        if case .retry = self { return true }
        return false
    }
}
