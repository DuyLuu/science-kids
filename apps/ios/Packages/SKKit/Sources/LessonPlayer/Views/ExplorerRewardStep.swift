import AudioKit
import ContentModel
import DesignSystem
import LessonEngine
import Profiles
import SwiftUI

/// Thưởng for Explorer (SK-040; canvas `Explorer-Reward`; SK-026 D1): "Great job!", the new
/// sticker (the lesson's collectible) to stick in with a tap, and the stars of `computeStars`.
/// Scored out of sight: no number right, no XP. The mascot says the sticker's name when the
/// screen opens (`autoplayUtterance`). Paper confetti falls once (`fall`, only on Thưởng).
struct ExplorerRewardStep: View {
    let session: LessonSession
    let summary: LessonSummary
    let onClose: () -> Void

    @State private var stuck = false
    @Environment(\.layoutMetrics) private var metrics
    @Environment(\.speechPlayer) private var speech

    private var mode: LanguageMode { session.languageMode }

    var body: some View {
        PaperFrame(scrolls: true) {
            content
                .background(alignment: .top) {
                    Confetti()
                        .frame(width: metrics.drawsPaperFrame ? metrics.frameWidth : metrics.containerWidth, height: LessonMetrics.confettiHeight)
                        .offset(y: -metrics.contentInsets.top)
                        .allowsHitTesting(false)
                }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            BottomBar {
                ExplorerNextButton(label: "lesson.reward.home", action: onClose)
                    .accessibilityIdentifier("lesson.reward.home")
            }
            .reveal(order: 7)
        }
    }

    private var content: some View {
        VStack(spacing: metrics.sectionGap) {
            HStack {
                PaperIconButton(.close, accessibilityLabel: Text("lesson.reward.close"), action: onClose)
                    .accessibilityIdentifier("lesson.back")
                Spacer()
            }
            Text("lesson.explorer.reward.title")
                .typography(Tokens.Typography.titleXl)
                .multilineTextAlignment(.center)
                .accessibilityAddTraits(.isHeader)
                .accessibilityIdentifier("lesson.reward.title")
                .reveal(order: 1)
            if let collectible = session.lesson.reward.collectible {
                sticker(collectible).reveal(order: 2)
            }
            stars
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: Sticker

    /// The sticker on its paper disc, tilted, with the vàng hoè offset ring; a tap sticks it in
    /// (the đỏ son seal) and the mascot says its name again.
    private func sticker(_ collectible: Collectible) -> some View {
        VStack(spacing: Tokens.Space.s10) {
            Button {
                stuck = true
                speech?.play(session.utterance("reward.card", collectible.name))
            } label: {
                ContentPicture(image: collectible.image, color: nil, size: metrics.illustration(ExplorerMetrics.stickerArt))
                    .frame(width: metrics.illustration(ExplorerMetrics.sticker), height: metrics.illustration(ExplorerMetrics.sticker))
                    .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.offsetAccent, in: Circle())
                    .overlay(alignment: .topTrailing) {
                        if stuck {
                            Seal(icon: .check, size: .large, tone: .mark)
                        }
                    }
                    .rotationEffect(ExplorerMetrics.stickerTilt)
            }
            .buttonStyle(.paperPress)
            .accessibilityLabel(Text("lesson.explorer.reward.sticker_a11y \(mode.sentence(collectible.name))"))
            .accessibilityValue(stuck ? Text("lesson.explorer.reward.stuck") : Text(verbatim: ""))
            .accessibilityIdentifier("lesson.reward.sticker")
            Text(verbatim: mode.name(collectible.name))
                .typography(Tokens.Typography.titleL)
                .multilineTextAlignment(.center)
                .accessibilityHidden(true)
        }
    }

    // MARK: Stars

    private var stars: some View {
        let count = summary.stars.stars
        return VStack(spacing: Tokens.Space.s6) {
            HStack(alignment: .bottom, spacing: Tokens.Space.s14) {
                ForEach(0..<3, id: \.self) { index in
                    let filled = index < count
                    PaperIconView(.star, size: metrics.illustration(ExplorerMetrics.star),
                                  color: filled ? Tokens.Role.stateCurrent : Tokens.Role.surfaceInactive)
                        .paperDropShadow(filled ? Tokens.Shadow.paper2 : Tokens.Shadow.paper1)
                        .motion(filled ? Tokens.Motion.Preset.stamp : Tokens.Motion.Preset.lay,
                                delay: Tokens.Motion.Stagger.maxDelay * Double(index + 2) / 3)
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Text("lesson.reward.stars_a11y \(count)"))
            .accessibilityIdentifier("lesson.reward.stars")
            // For the grown-up beside the child: what the next star needs, never the score.
            Text(starsHint)
                .typography(Tokens.Typography.caption)
                .foregroundStyle(Tokens.Role.textSecondary)
                .multilineTextAlignment(.center)
                .reveal(order: 5)
        }
    }

    private var starsHint: LocalizedStringKey {
        switch summary.stars.stars {
        case 3: return "lesson.reward.hint_mastered"
        case 2:
            let days = session.rules.scoring.masteryGapDays
            return days == 1 ? "lesson.reward.hint_tomorrow" : "lesson.reward.hint_days \(days)"
        default:
            return "lesson.explorer.reward.hint_again"
        }
    }
}
