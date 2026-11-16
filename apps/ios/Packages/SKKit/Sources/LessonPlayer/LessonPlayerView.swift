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

/// A whole lesson, step by step (B7.6: warmup → learn → play → quiz → reward; SK-047: Tổng kết
/// between the quiz and the reward). The screen of each
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
        case .recap:
            // SK-047: Tổng kết; the attempt is saved, closing skips the reward.
            RecapStep(session: session, onClose: onExit)
        case .reward:
            if let summary = session.summary {
                ExplorerRewardStep(session: session, summary: summary, onClose: onExit)
            }
        case .learn:
            // SK-043 hướng A: Học as a picture book.
            ExplorerLearnStep(session: session, onBack: exit)
        case .play:
            if let tray = session.tray {
                PlayStep(session: session, tray: tray) {
                    // SK-043 Explorer-A: back and the step squares.
                    ExplorerStepHeader(session: session, backLabel: Text("lesson.play.back"), onBack: session.backToLearn)
                }
            }
        }
    }

    /// Discoverer after A2 (SK-043, Duy 14/11): the picture-book screens of Explorer with the
    /// Discoverer look (touch 56, radius 12), XP kept; headers without words.
    @ViewBuilder private var discovererStepView: some View {
        switch session.step {
        case .warmup(let index):
            if let item = session.item(at: index, in: .warmup) {
                DiscovererQuestionStep(session: session, phase: .warmup, index: index, item: item,
                                       isLast: index == session.warmupItems.count - 1, onClose: exit)
                    .id(item.id)
            }
        case .learn:
            ExplorerLearnStep(session: session, onBack: exit)
        case .play:
            if let tray = session.tray {
                PlayStep(session: session, tray: tray) {
                    ExplorerStepHeader(session: session, backLabel: Text("lesson.play.back"), onBack: session.backToLearn)
                }
            }
        case .quiz(let index):
            if let item = session.item(at: index, in: .quiz) {
                DiscovererQuestionStep(session: session, phase: .quiz, index: index, item: item,
                                       isLast: index == session.quizItems.count - 1, onClose: exit)
                    .id(item.id)
            }
        case .recap:
            RecapStep(session: session, onClose: onExit)
        case .reward:
            if let summary = session.summary {
                RewardStep(session: session, summary: summary, heading: heading, onClose: onExit, onShowCards: onShowCards)
            }
        }
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
