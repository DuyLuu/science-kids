import AudioKit
import ContentModel
import DesignSystem
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
        case .pictureBarChart, .unknown: []
        }
    }

    // MARK: Steps

    /// What plays by itself when a step opens (SK-016: the instruction and the question), never
    /// under VoiceOver (`SpeechPlayer.autoplay`):
    /// - Khởi động and Quiz: the question (`questionUtterance`);
    /// - Học: the instruction of `explore_groups` ("Tap each group");
    /// - Chơi: the mascot's message of the tray as it is ("Pick foods for a healthy tray.");
    /// - Thưởng: nothing (the screen celebrates; the card and its fact have a listen button).
    public func autoplayUtterance(for step: Step) -> Utterance? {
        switch step {
        case .warmup(let index):
            return item(at: index, in: .warmup).map(questionUtterance)
        case .quiz(let index):
            return item(at: index, in: .quiz).map(questionUtterance)
        case .learn:
            return exploreBlock.map { utterance("learn.prompt", $0.prompt) }
        case .play:
            // Explorer (SK-040 lượt 2): the game's instruction too, then the message.
            if isExplorer, let tray { return utterance("play.message", tray.prompt, trayMessage) }
            return trayMessage.map { utterance("play.message", $0) }
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
        case .reward:
            guard let collectible = lesson.reward.collectible else { return [lesson.title] }
            return [lesson.title, collectible.name, collectible.tag, collectible.fact].compactMap { $0 }
        }
    }

    static func questionStrings(_ item: QuizItem) -> [Spoken] {
        questionSpoken(item) + answerSpoken(item) + [item.hint, item.explanationCorrect, item.explanationWrong]
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
        case .trueFalse, .pictureBarChart, .unknown: nil
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
        case .retry: [item.hint]
        case .done(let correct, _, _): [correct ? item.explanationCorrect : item.explanationWrong]
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

    /// Học, Explorer: a tapped group says its name, then its sentence (SK-040 lượt 2). The
    /// examples are not read by themselves (each is a short name under a picture the child can
    /// see; the sheet's listen button still reads them).
    public func explorerGroupUtterance(_ group: ExploreGroup) -> Utterance {
        utterance("learn.explore.\(group.key)", group.label, group.sentence)
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
            PaperIconButton(.speaker, accessibilityLabel: Text(label, bundle: .main), disc: disc) {
                speech?.play(utterance)
            }
            .accessibilityAddTraits(.startsMediaSession)
            .accessibilityIdentifier("listen.\(utterance.id)")
        }
    }
}
