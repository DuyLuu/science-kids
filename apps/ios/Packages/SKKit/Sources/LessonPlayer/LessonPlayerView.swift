import AudioKit
import ContentModel
import DesignSystem
import LessonEngine
import Profiles
import SwiftUI

/// Where the lesson sits in its topic, for the headers ("Ăn uống lành mạnh · Bài 1/5",
/// "Hoàn thành bài 1!").
public struct LessonHeading: Hashable, Sendable {
    public var topicTitle: Spoken
    public var lessonNumber: Int
    public var lessonCount: Int

    public init(topicTitle: Spoken, lessonNumber: Int, lessonCount: Int) {
        self.topicTitle = topicTitle
        self.lessonNumber = lessonNumber
        self.lessonCount = lessonCount
    }
}

/// A whole lesson, step by step (B7.6: warmup → learn → play → quiz → reward). The screen of each
/// step comes from a registry on the content's `type` and `format`: what has no renderer was left
/// out by `LessonSession` (SK-009).
///
/// `onExit`: the child leaves (back, close, "Về hành trình"); the attempt stays saved unless it is
/// finished. `onShowCards`: "Xem bộ thẻ" on the reward.
///
/// Voice (SK-016): each step that opens plays its instruction or question by itself
/// (`LessonSession.autoplayUtterance`, never under VoiceOver) and reads ahead the clips of this
/// step and the next; leaving the lesson stops the voice.
public struct LessonPlayerView: View {
    private let session: LessonSession
    private let heading: LessonHeading
    private let onExit: () -> Void
    private let onShowCards: () -> Void
    @Environment(\.speechPlayer) private var speech

    public init(session: LessonSession, heading: LessonHeading, onExit: @escaping () -> Void, onShowCards: @escaping () -> Void) {
        self.session = session
        self.heading = heading
        self.onExit = onExit
        self.onShowCards = onShowCards
    }

    public var body: some View {
        stepView
            .id(session.step)
            .modifier(PresentationLook(presentation: session.presentation))
            .onChange(of: session.step, initial: true) { _, step in
                speech?.preload(session.clipsToPreload(at: step))
                if let opening = session.autoplayUtterance(for: step) {
                    speech?.autoplay(opening)
                } else {
                    speech?.stop()
                }
            }
            .onDisappear { speech?.stop() }
    }

    private var mode: LanguageMode { session.languageMode }

    @ViewBuilder private var stepView: some View {
        if session.isExplorer {
            explorerStepView
        } else {
            discovererStepView
        }
    }

    /// Explorer (SK-040): its own question and reward screens; Học and Chơi are the Discoverer
    /// blocks (schema v1 has no Explorer block yet: `hotspot_image`, `sort_into_groups` are GĐ 2),
    /// without XP.
    @ViewBuilder private var explorerStepView: some View {
        switch session.step {
        case .warmup(let index):
            if let item = session.item(at: index, in: .warmup) {
                ExplorerQuestionStep(session: session, phase: .warmup, index: index, item: item,
                                     isLast: index == session.warmupItems.count - 1, onClose: exit)
                    .id(item.id)
            }
        case .quiz(let index):
            if let item = session.item(at: index, in: .quiz) {
                ExplorerQuestionStep(session: session, phase: .quiz, index: index, item: item,
                                     isLast: index == session.quizItems.count - 1, onClose: exit)
                    .id(item.id)
            }
        case .reward:
            if let summary = session.summary {
                ExplorerRewardStep(session: session, summary: summary, onClose: onExit)
            }
        case .learn, .play:
            discovererStepView
        }
    }

    @ViewBuilder private var discovererStepView: some View {
        switch session.step {
        case .warmup(let index):
            if let item = session.item(at: index, in: .warmup) {
                QuestionStep(session: session, phase: .warmup, index: index, item: item,
                             isLast: index == session.warmupItems.count - 1) {
                    VStack(alignment: .leading, spacing: LessonMetrics.gap) {
                        lessonHeader
                        StepSquares(current: session.phaseIndex)
                        WarmupTagRow(item: item, index: index, count: session.warmupItems.count)
                    }
                }
                .id(item.id)
            }
        case .learn:
            LearnStep(session: session) {
                VStack(alignment: .leading, spacing: LessonMetrics.gap) {
                    lessonHeader
                    StepSquares(current: session.phaseIndex)
                }
            }
        case .play:
            if let tray = session.tray {
                PlayStep(session: session, tray: tray) {
                    VStack(alignment: .leading, spacing: LessonMetrics.gap) {
                        LessonHeader(
                            backIcon: .arrowBack, backLabel: Text("lesson.play.back"),
                            title: mode.name(tray.prompt), caption: mode.secondName(tray.prompt),
                            session: session, onBack: session.backToLearn,
                            // Explorer has no XP (SK-026 D1).
                            trailing: session.isExplorer ? nil : AnyView(xpChip)
                        )
                        StepSquares(current: session.phaseIndex)
                    }
                }
            }
        case .quiz(let index):
            if let item = session.item(at: index, in: .quiz) {
                QuestionStep(session: session, phase: .quiz, index: index, item: item,
                             isLast: index == session.quizItems.count - 1) {
                    QuizHeader(session: session, index: index,
                               currentDone: session.status(of: item, in: .quiz).isDone,
                               onClose: exit)
                }
                .id(item.id)
            }
        case .reward:
            if let summary = session.summary {
                RewardStep(session: session, summary: summary, heading: heading, onClose: onExit, onShowCards: onShowCards)
            }
        }
    }

    private var lessonHeader: some View {
        LessonHeader(
            backIcon: .arrowBack, backLabel: Text("lesson.back"),
            title: mode.name(session.lesson.title),
            caption: String(localized: "lesson.caption \(mode.name(heading.topicTitle)) \(heading.lessonNumber) \(heading.lessonCount)"),
            session: session, onBack: exit
        )
    }

    /// "+10 XP" for finishing the game (`xp_game_complete`), as the canvas.
    private var xpChip: some View {
        HStack(spacing: Tokens.Space.s4) {
            PaperIconView(.star, size: PaperMetrics.headerChipIcon, color: Tokens.Role.stateCurrent)
            Text("lesson.xp_plus \(session.rules.xp.gameComplete)")
                .typography(Tokens.Typography.label, fixedBox: true)
        }
        .padding(.horizontal, Tokens.Space.s8)
        .frame(minHeight: PaperMetrics.chipHeight + Tokens.Space.s10)
        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.tag)
        .accessibilityElement(children: .combine)
    }

    private func exit() {
        session.pause()
        onExit()
    }
}

/// Explorer screens take the Explorer look of the design system (radius 20, touch targets 72pt,
/// never smaller on iPad), whatever world the rest of the app shows (SK-040).
private struct PresentationLook: ViewModifier {
    let presentation: LessonPresentation

    func body(content: Content) -> some View {
        switch presentation {
        case .discoverer:
            content
        case .explorer:
            content
                .environment(\.ageGroup, .explorer)
                .transformEnvironment(\.layoutMetrics) { metrics in
                    metrics = LayoutMetrics(widthClass: metrics.widthClass, containerWidth: metrics.containerWidth, ageGroup: .explorer)
                }
        }
    }
}
