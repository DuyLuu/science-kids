import AudioKit
import ContentModel
import DesignSystem
import LessonEngine
import Profiles
import SwiftUI

// The voice of a lesson (SK-016): which clips each listen button and each word plays, what plays
// by itself when a step opens, which clips to read ahead. AudioKit only plays clips; the choices
// from the content and the profile's `voice_mode` are made here, without SwiftUI state, so they
// are unit-tested.

extension Spoken {
    /// The clips of this string in a voice (B4.1): `en` the EN clip, `vi` the VI clip, `both` EN
    /// then VI. A clip the content does not have (VI before the voice is chosen) is left out.
    public func voiceClips(for voice: VoiceMode) -> [Utterance.Clip] {
        var clips: [Utterance.Clip] = []
        if voice != .vi, let en = audio?.en { clips.append(.init(hash: en, language: "en", text: self.en)) }
        if voice != .en, let vi = audio?.vi { clips.append(.init(hash: vi, language: "vi", text: self.vi)) }
        return clips
    }
}

extension Utterance {
    /// The strings in order, each in the voice (EN → VI per string for `both`).
    public init(id: String, _ spoken: [Spoken?], voice: VoiceMode) {
        self.init(id: id, clips: spoken.compactMap { $0 }.flatMap { $0.voiceClips(for: voice) })
    }
}

extension LessonSession {
    public var voiceMode: VoiceMode { context.voiceMode }

    /// What a listen button or a word plays, in the profile's voice.
    public func utterance(_ id: String, _ spoken: Spoken?...) -> Utterance {
        Utterance(id: id, spoken, voice: context.voiceMode)
    }

    public func utterance(_ id: String, list spoken: [Spoken?]) -> Utterance {
        Utterance(id: id, spoken, voice: context.voiceMode)
    }

    // MARK: Questions

    /// The question as its listen button reads it and as it plays when it opens: the instruction
    /// tag, then
    /// - `fill_blank_bank`: the prompt ("Pick the missing word"), then the sentence with its blank;
    /// - true/false with a `statement`: what the child of the story says, then the prompt
    ///   ("All fat is bad for you." "Is Na right?");
    /// - otherwise the prompt.
    public static func questionSpoken(_ item: QuizItem) -> [Spoken] {
        var spoken: [Spoken] = []
        if let instruction = item.instruction { spoken.append(instruction) }
        switch item.answer {
        case .fillBlankBank(let fill):
            spoken += [item.prompt, fill.sentence]
        case .trueFalse(let tf):
            if let statement = tf.statement { spoken.append(statement) }
            spoken.append(item.prompt)
        case .singleChoice, .multiChoice, .orderSequence, .pictureBarChart, .unknown:
            spoken.append(item.prompt)
        }
        return spoken
    }

    public func questionUtterance(_ item: QuizItem) -> Utterance {
        utterance("question.\(item.key)", list: Self.questionSpoken(item))
    }

    /// Answer words of a question (choices, bank words, the content's true/false labels).
    static func answerSpoken(_ item: QuizItem) -> [Spoken] {
        switch item.answer {
        case .singleChoice(let choice): choice.options.map(\.label)
        case .multiChoice(let choice): choice.options.map(\.label)
        case .fillBlankBank(let fill): fill.bank.map(\.label)
        case .trueFalse(let tf): tf.labels.map { [$0.trueLabel, $0.falseLabel] } ?? []
        case .orderSequence(let order): order.items.map(\.label)
        case .pictureBarChart(let chart): chart.chart.bars.map(\.label)
        case .unknown: []
        }
    }

    // MARK: Steps

    /// What plays by itself when a step opens (SK-016: the instruction and the question), never
    /// under VoiceOver (`SpeechPlayer.autoplay`):
    /// - Khởi động and Quiz: the question (`questionUtterance`);
    /// - Học: the instruction of `explore_groups` ("Tap each group");
    /// - Chơi: the mascot's message of the tray as it is ("Pick foods for a healthy tray.");
    /// - Tổng kết (SK-047): the first key point; the page reads the next ones after it
    ///   (`recapFirstPageReading`), and page 2 its own lines;
    /// - Thưởng: nothing (the screen celebrates; the card and its fact have a listen button).
    public func autoplayUtterance(for step: Step) -> Utterance? {
        switch step {
        case .warmup(let index):
            return item(at: index, in: .warmup).map(questionUtterance)
        case .quiz(let index):
            return item(at: index, in: .quiz).map(questionUtterance)
        case .learn:
            // Picture book (SK-043, Explorer and Discoverer A2): the page that opens reads itself
            // (the group shown).
            if let explore = exploreBlock,
               let group = explore.groups.first(where: { $0.key == progress.exploreSelected }) ?? explore.groups.first {
                return explorerGroupUtterance(group)
            }
            return nil
        case .play:
            // SK-040 lượt 2, A2: the game's instruction too, then the message.
            if let tray { return utterance("play.message", tray.prompt, trayMessage) }
            return nil
        case .recap:
            // Explorer and Discoverer read the key points one after the other; Scientist will
            // not (D5) once it has screens of its own (it plays as Discoverer for now).
            return recapFirstPageReading.first
        case .reward:
            // Explorer: the mascot names the new sticker (SK-040); Discoverer celebrates quietly.
            guard isExplorer, let collectible = lesson.reward.collectible else { return nil }
            return utterance("reward.card", collectible.name)
        }
    }

    /// Every content string a step shows, for reading its clips ahead (`preload`).
    public func spokenShown(on step: Step) -> [Spoken] {
        switch step {
        case .warmup(let index):
            return item(at: index, in: .warmup).map(Self.questionStrings) ?? []
        case .quiz(let index):
            return item(at: index, in: .quiz).map(Self.questionStrings) ?? []
        case .learn:
            var spoken: [Spoken] = [lesson.title, lesson.objective]
            if let explore = exploreBlock {
                spoken.append(explore.prompt)
                for group in explore.groups { spoken += [group.label, group.sentence] + group.examples }
            }
            if let list = wordList {
                if let title = list.title { spoken.append(title) }
                spoken += list.termKeys.compactMap { key in lesson.vocab.first { $0.key == key }?.term }
            }
            return spoken
        case .play:
            guard let tray else { return [] }
            let messages = tray.messages
            return [tray.prompt] + tray.groups.map(\.label) + tray.items.map(\.label)
                + [messages.start, messages.full, messages.balanced, messages.hasLimited]
                + tray.missingMessagesInGroupOrder.map(\.message)
        case .recap:
            let recap = recap
            var spoken = recap.keyPoints.map(\.text)
            if let myth = recap.myth { spoken += [myth.claim, myth.truth] }
            spoken += recap.words.map(\.term)
            spoken.append(recap.objective)
            return spoken
        case .reward:
            guard let collectible = lesson.reward.collectible else { return [lesson.title] }
            return [lesson.title, collectible.name, collectible.tag, collectible.fact].compactMap { $0 }
        }
    }

    static func questionStrings(_ item: QuizItem) -> [Spoken] {
        questionSpoken(item) + answerSpoken(item) + feedbackSpoken(item) + [item.hint, item.explanationCorrect, item.explanationWrong]
    }

    /// Every `feedback` of a question's options or bank words (SK-044), read ahead with the step.
    static func feedbackSpoken(_ item: QuizItem) -> [Spoken] {
        switch item.answer {
        case .singleChoice(let choice): choice.options.compactMap(\.feedback)
        case .multiChoice(let choice): choice.options.compactMap(\.feedback)
        case .pictureBarChart(let chart): chart.options.compactMap(\.feedback)
        case .fillBlankBank(let fill): fill.bank.compactMap(\.feedback)
        case .trueFalse(let tf): [tf.feedbackTrue, tf.feedbackFalse].compactMap { $0 }
        case .orderSequence, .unknown: []
        }
    }

    /// The step after `step`, if any.
    public func step(after step: Step) -> Step? {
        guard let index = steps.firstIndex(of: step), index + 1 < steps.count else { return nil }
        return steps[index + 1]
    }

    /// Clip hashes to keep read for `step`: its own and the next step's, in the profile's voice
    /// only (B4.1: only the language that is on is fetched ahead).
    public func clipsToPreload(at step: Step) -> Set<String> {
        let steps = [step] + (self.step(after: step).map { [$0] } ?? [])
        return Set(steps.flatMap(spokenShown(on:)).flatMap { $0.voiceClips(for: context.voiceMode) }.map(\.hash))
    }
}

// MARK: - Explorer (SK-040)

extension LessonSession {
    /// The name of a choice or sequence picture, read after the child taps it (SK-026 D4).
    public static func answerName(_ item: QuizItem, key: String) -> Spoken? {
        switch item.answer {
        case .singleChoice(let choice): choice.options.first { $0.key == key }?.label
        case .multiChoice(let choice): choice.options.first { $0.key == key }?.label
        case .orderSequence(let order): order.items.first { $0.key == key }?.label
        case .fillBlankBank(let fill): fill.bank.first { $0.key == key }?.label
        // `options[i]` answers `chart.bars[i]` (dev 14/11): the bar's name.
        case .pictureBarChart(let chart):
            chart.options.firstIndex { $0.key == key }.flatMap { chart.chart.bars.indices.contains($0) ? chart.chart.bars[$0].label : nil }
        case .trueFalse, .unknown: nil
        }
    }

    /// The content's own label of a true/false card, if it has one. Explorer content leaves
    /// `labels` out (TEMPLATE, luật Explorer 5): the nod and the shake are not named aloud then.
    public static func answerName(_ item: QuizItem, value: Bool) -> Spoken? {
        guard case .trueFalse(let tf) = item.answer, let labels = tf.labels else { return nil }
        return value ? labels.trueLabel : labels.falseLabel
    }

    /// What the mascot says about a question in its state, and what its bubble shows (SK-026,
    /// "Explorer: một câu không cần đọc"): the question while it is open, the hint after a wrong
    /// try with a try left, `explanation_correct` once right, `explanation_wrong` once out of tries.
    public static func explorerLine(_ item: QuizItem, status: QuestionStatus) -> [Spoken] {
        switch status {
        case .open: questionSpoken(item)
        case .retry(let last): retryLines(item, last: last)
        case .done(let correct, _, let last): resultLines(item, correct: correct, last: last)
        }
    }

    /// Once done: `explanation_correct`; out of tries, the `feedback` of what the last try picked
    /// (when it has one), then `explanation_wrong` (SK-044, main session 14/11: with one try for
    /// true / false the feedback must still be said; the two lines are written not to repeat).
    public static func resultLines(_ item: QuizItem, correct: Bool, last: Try) -> [Spoken] {
        if correct { return [item.explanationCorrect] }
        return [feedback(item, for: last), item.explanationWrong].compactMap { $0 }
    }

    /// SK-044: after a wrong try with a try left, what is said and shown: the `feedback` of the
    /// option (or bank word) just picked, when the content has one, then the `hint`.
    public static func retryLines(_ item: QuizItem, last: Try) -> [Spoken] {
        [feedback(item, for: last), item.hint].compactMap { $0 }
    }

    /// The `feedback` of what a try picked (single choice: its option; multi choice: the first
    /// wrong option picked; fill blank: the first wrong word placed; true/false: `feedback_true`
    /// or `feedback_false` by the side tapped). `nil` without one.
    public static func feedback(_ item: QuizItem, for attempt: Try) -> Spoken? {
        switch (item.answer, attempt) {
        case (.singleChoice(let choice), .selected(let key)):
            return choice.options.first { $0.key == key && !$0.correct }?.feedback
        case (.multiChoice(let choice), .selectedSet(let keys)):
            return choice.options.first { keys.contains($0.key) && !$0.correct && $0.feedback != nil }?.feedback
        case (.pictureBarChart(let chart), .selected(let key)):
            return chart.options.first { $0.key == key && !$0.correct }?.feedback
        case (.fillBlankBank(let fill), .filled(let keys)):
            for (index, key) in keys.enumerated() where fill.answers.indices.contains(index) && fill.answers[index] != key {
                if let feedback = fill.bank.first(where: { $0.key == key })?.feedback { return feedback }
            }
            return nil
        case (.trueFalse(let tf), .value(let value)):
            return tf.feedback(for: value)
        default:
            // order_sequence is checked as a whole chain: no feedback (SK-044, dev 13/11).
            return nil
        }
    }

    /// Discoverer (SK-044): what plays by itself after a check. A wrong try with a try left: the
    /// feedback then the hint; done: the explanation (out of tries: the feedback first). Explorer says the same lines
    /// through `explorerAnswerUtterance`. `name`: the word just tapped, said first in the same
    /// utterance (Khởi động answers on a tap), so the word is not cut off by the result.
    public func resultUtterance(_ item: QuizItem, status: QuestionStatus, name: Spoken? = nil) -> Utterance? {
        switch status {
        case .open: return nil
        case .retry(let last): return utterance("retry.\(item.key)", list: [name] + Self.retryLines(item, last: last))
        case .done(let correct, _, let last):
            return utterance("explanation.\(item.key).\(correct ? "correct" : "wrong")", list: [name] + Self.resultLines(item, correct: correct, last: last))
        }
    }

    /// The bubble's line as its listen button replays it.
    public func explorerLineUtterance(_ item: QuizItem, status: QuestionStatus) -> Utterance {
        let suffix: String
        switch status {
        case .open: return questionUtterance(item)
        case .retry: suffix = "hint"
        case .done(let correct, _, _): suffix = correct ? "correct" : "wrong"
        }
        return utterance("explorer.\(item.key).\(suffix)", list: Self.explorerLine(item, status: status))
    }

    /// After a tap: the picture's name, then what the mascot says about the try (hint or
    /// explanation), in one utterance so the two never overlap. `name` is `nil` for a card that
    /// has no name (true/false without `labels`).
    public func explorerAnswerUtterance(_ item: QuizItem, name: Spoken?, status: QuestionStatus) -> Utterance {
        let line: [Spoken] = status == .open ? [] : Self.explorerLine(item, status: status)
        return utterance("answer.\(item.key).\(tries(for: item, in: phaseOf(item)).count)", list: [name] + line)
    }

    /// Whether `item` is the first true/false question of the lesson: there the bubble also shows
    /// how to answer with the nod and the shake (SK-026, "Nhãn Đúng/Sai").
    public func isFirstTrueFalse(_ item: QuizItem) -> Bool {
        (warmupItems + quizItems).first { if case .trueFalse = $0.answer { true } else { false } }?.id == item.id
    }

    /// Học, Explorer: a page says the group's name, its sentence, then its examples (SK-043, A-final
    /// "Explorer · Học": the examples are not printed, the voice reads them after the sentence).
    public func explorerGroupUtterance(_ group: ExploreGroup) -> Utterance {
        utterance("learn.explore.\(group.key)", list: [group.label, group.sentence] + group.examples)
    }

    /// Chơi, Explorer: a tapped item says its name, then the mascot's new message (the engine's,
    /// after the tap), in one utterance. Call after `tapTrayItem`.
    public func explorerTrayTapUtterance(_ item: TrayItem) -> Utterance {
        utterance("play.tap.\(item.key).\(progress.tray.count)", item.label, trayMessage)
    }

    private func phaseOf(_ item: QuizItem) -> QuestionPhase {
        warmupItems.contains { $0.id == item.id } ? .warmup : .quiz
    }
}

// MARK: - Environment

private struct SpeechPlayerKey: EnvironmentKey {
    static let defaultValue: SpeechPlayer? = nil
}

extension EnvironmentValues {
    /// The app's voice player; `nil` in previews and in tests without audio (nothing plays).
    public var speechPlayer: SpeechPlayer? {
        get { self[SpeechPlayerKey.self] }
        set { self[SpeechPlayerKey.self] = newValue }
    }
}

// MARK: - Listen button

/// "Nghe câu hỏi" (canvas Discoverer 8, 9, 11, 12): the speaker on a paper disc at the end of a
/// sentence's row. Tapping again plays again from the start; another button stops this one.
/// Hidden when the profile's voice has no clip for it, so no button ever does nothing.
public struct ListenButton: View {
    private let utterance: Utterance
    private let label: LocalizedStringKey
    private let disc: PaperIconButton.Disc
    @Environment(\.speechPlayer) private var speech

    public init(_ utterance: Utterance, label: LocalizedStringKey = "lesson.listen", disc: PaperIconButton.Disc = .screen) {
        self.utterance = utterance
        self.label = label
        self.disc = disc
    }

    public var body: some View {
        if !utterance.isEmpty {
            // The VI button goes under the speaker, not beside it, so the sentence beside them
            // keeps its width (Chơi's bubble, the question sheet).
            VStack(spacing: Tokens.Space.s4) {
                PaperIconButton(.speaker, accessibilityLabel: Text(label, bundle: .main), disc: disc) {
                    speech?.play(utterance)
                }
                .accessibilityAddTraits(.startsMediaSession)
                .accessibilityIdentifier("listen.\(utterance.id)")
                // SK-042 (Duy 13/11): "Cả hai" plays English by itself; Vietnamese on request.
                SecondVoiceButton(utterance)
            }
        }
    }
}

/// SK-042 (Duy 13/11): in "Cả hai" the voice says only English by itself; this small button
/// next to it plays the Vietnamese clips of the same words. Hidden outside "Cả hai"
/// (`SpeechPlayer.firstLanguageOnly` is `nil`) and when there is no Vietnamese clip, so it never
/// does nothing. A small "VI" mark with the speaker, in the age group's touch target.
public struct SecondVoiceButton: View {
    private let utterance: Utterance
    @Environment(\.speechPlayer) private var speech
    @Environment(\.ageGroup) private var ageGroup

    public init(_ utterance: Utterance) {
        self.utterance = utterance
    }

    public var body: some View {
        if let speech, speech.secondVoice(of: utterance) != nil {
            Button {
                speech.playSecond(utterance)
            } label: {
                HStack(spacing: Tokens.Space.s2) {
                    PaperIconView(.speaker, size: PaperMetrics.headerChipIcon, color: Tokens.Palette.cham)
                    Text(verbatim: "VI")
                        .typography(Tokens.Typography.label, fixedBox: true)
                        .foregroundStyle(Tokens.Palette.cham)
                }
                .padding(.horizontal, Tokens.Space.s8)
                .frame(minHeight: PaperMetrics.chipHeight + Tokens.Space.s10)
                .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.tag)
                .frame(minWidth: ageGroup.touchTarget, minHeight: ageGroup.touchTarget)
                .contentShape(Rectangle())
            }
            .buttonStyle(.paperPress)
            .accessibilityLabel(Text("lesson.listen.vi", bundle: .main))
            .accessibilityAddTraits(.startsMediaSession)
            .accessibilityIdentifier("listen.vi.\(utterance.id)")
        }
    }
}
