import AudioKit
import ContentModel
import DesignSystem
import LessonEngine
import Profiles
import SwiftUI

/// Thưởng, Discoverer A2 (SK-043, Duy 14/11; `?shot=d-reward`): a two-word praise, the stars of
/// `computeStars`, the numbers as icon + number (their names only for VoiceOver), the new card
/// (the lesson's collectible: its picture, name and one-sentence fact with a speaker), paper
/// confetti (`fall`, only on this screen). Buttons with pictures only: the cards, the arrow home.
struct RewardStep: View {
    let session: LessonSession
    let summary: LessonSummary
    let heading: LessonHeading
    let onClose: () -> Void
    let onShowCards: () -> Void

    @Environment(\.layoutMetrics) private var metrics

    private var mode: LanguageMode { session.languageMode }

    var body: some View {
        PaperFrame(scrolls: true) {
            content
                // Behind the words, across the whole screen width (canvas z-index 0).
                .background(alignment: .top) {
                    Confetti()
                        .frame(width: metrics.drawsPaperFrame ? metrics.frameWidth : metrics.containerWidth, height: LessonMetrics.confettiHeight)
                        .offset(y: -metrics.contentInsets.top)
                        .allowsHitTesting(false)
                }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            BottomBar {
                HStack(alignment: .center, spacing: Tokens.Space.s12) {
                    PaperIconButton(.cards, accessibilityLabel: Text("lesson.reward.cards"), action: onShowCards)
                        .accessibilityIdentifier("lesson.reward.cards")
                    ArrowButton(label: "lesson.reward.home", action: onClose)
                        .accessibilityIdentifier("lesson.reward.home")
                }
            }
            .reveal(order: 9)
        }
    }

    private var content: some View {
        VStack(spacing: LessonMetrics.gap) {
            Text("lesson.reward.praise")
                .typography(Tokens.Typography.titleXl)
                .foregroundStyle(Tokens.Role.textAccent)
                .multilineTextAlignment(.center)
                .accessibilityAddTraits(.isHeader)
                .accessibilityIdentifier("lesson.reward.title")
                .padding(.top, Tokens.Space.s20)
                .reveal(order: 1)
            stars
            stats.reveal(order: 6)
            if let collectible = session.lesson.reward.collectible {
                card(collectible).reveal(order: 7)
            }
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: Stars

    private var stars: some View {
        let count = summary.stars.stars
        return HStack(alignment: .bottom, spacing: Tokens.Space.s10) {
            ForEach(0..<3, id: \.self) { index in
                let filled = index < count
                PaperIconView(.star, size: metrics.illustration(index == 1 ? LessonMetrics.star * 1.15 : LessonMetrics.star),
                              color: filled ? Tokens.Role.stateCurrent : Tokens.Role.surfaceInactive)
                    .paperDropShadow(filled ? Tokens.Shadow.paper2 : Tokens.Shadow.paper1)
                    .rotationEffect(.degrees(Double(index - 1) * 8))
                    .motion(filled ? Tokens.Motion.Preset.stamp : Tokens.Motion.Preset.lay,
                            delay: Tokens.Motion.Stagger.maxDelay * Double(index + 2) / 3)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("lesson.reward.stars_a11y \(count)"))
        .accessibilityIdentifier("lesson.reward.stars")
    }

    // MARK: Numbers

    /// Icon + number tiles: right answers, XP. (A2 also shows the day streak; the lesson screen
    /// does not know it yet.)
    private var stats: some View {
        HStack(spacing: Tokens.Space.s10) {
            tile(icon: .check, iconColor: Tokens.Role.feedbackCorrect,
                 value: Text("lesson.reward.score \(summary.score.correct) \(summary.score.max)"),
                 label: Text("lesson.reward.score_a11y \(summary.score.correct) \(summary.score.max)"),
                 identifier: "lesson.reward.score")
            tile(icon: .star, iconColor: Tokens.Role.stateCurrent,
                 value: Text("lesson.reward.xp \(summary.xp.total)"),
                 label: Text("lesson.xp_plus \(summary.xp.total)"),
                 identifier: "lesson.reward.xp")
        }
    }

    private func tile(icon: PaperIcon, iconColor: Color, value: Text, label: Text, identifier: String) -> some View {
        HStack(spacing: Tokens.Space.s8) {
            PaperIconView(icon, size: PaperMetrics.headerChipIcon * 1.4, color: iconColor)
            value
                .typography(Tokens.Typography.titleL, fixedBox: true)
        }
        .padding(.vertical, Tokens.Space.s10)
        .frame(maxWidth: .infinity)
        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.discoverer)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(label)
        .accessibilityIdentifier(identifier)
    }

    // MARK: Card

    /// The new card: "Thẻ mới" on a cut tag, the picture filling the card, the name, the fact
    /// (one sentence) and the speaker that says both.
    private func card(_ collectible: Collectible) -> some View {
        let say = session.utterance("reward.card", collectible.name, collectible.fact)
        return VStack(alignment: .leading, spacing: Tokens.Space.s10) {
            ContentPicture(image: collectible.image, color: Tokens.Palette.giDong, size: metrics.illustration(RewardMetrics.picture), box: .fillWidth)
                .frame(height: metrics.illustration(RewardMetrics.picture))
                .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.discoverer, style: .continuous))
            HStack(alignment: .center, spacing: Tokens.Space.s10) {
                VStack(alignment: .leading, spacing: Tokens.Space.s4) {
                    Text(verbatim: mode.sentence(collectible.name))
                        .typography(Tokens.Typography.title)
                        .fixedSize(horizontal: false, vertical: true)
                        .accessibilityIdentifier("lesson.reward.card.name")
                    Text(verbatim: mode.sentence(collectible.fact))
                        .typography(Tokens.Typography.bodyStrong)
                        .foregroundStyle(Tokens.Role.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                ListenButton(say, label: "lesson.listen.card")
            }
        }
        .padding(Tokens.Space.s8)
        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.discoverer)
        .background {
            RoundedRectangle(cornerRadius: Tokens.Radius.discoverer, style: .continuous)
                .fill(Tokens.Role.actionPrimary)
                .offset(x: Tokens.Space.s6, y: Tokens.Space.s8)
        }
        .overlay(alignment: .topLeading) {
            PaperTag(Text("lesson.reward.new_card"), style: .cut(eyebrow: true))
                .offset(x: -Tokens.Space.s6, y: -Tokens.Space.s10)
        }
        .padding(.trailing, metrics.gridTrailingInset)
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("lesson.reward.card")
    }
}

/// Canvas sizes of Thưởng A2 with no token.
enum RewardMetrics {
    /// The card's picture (`336 × 300`).
    static let picture: CGFloat = 260
}

/// Paper confetti falling once at the top of Thưởng (canvas positions, `fall` with a growing delay).
struct Confetti: View {
    private struct Piece {
        let x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, angle: Double, color: Color, triangle: Bool
    }

    private static let pieces: [Piece] = [
        Piece(x: 10, y: 44, width: 16, height: 10, angle: 20, color: Tokens.Palette.doSon, triangle: false),
        Piece(x: 284, y: 34, width: 16, height: 18, angle: 0, color: Tokens.Palette.vangHoe, triangle: true),
        Piece(x: 306, y: 166, width: 14, height: 9, angle: -25, color: Tokens.Palette.giDong, triangle: false),
        Piece(x: 58, y: 174, width: 14, height: 16, angle: 0, color: Tokens.Palette.cham, triangle: true),
        Piece(x: 196, y: 22, width: 12, height: 12, angle: 35, color: Tokens.Palette.vangHoe, triangle: false),
        Piece(x: 236, y: 48, width: 10, height: 16, angle: 15, color: Tokens.Palette.cham, triangle: false),
        Piece(x: 126, y: 38, width: 16, height: 16, angle: 0, color: Tokens.Palette.doSon, triangle: true),
        Piece(x: 14, y: 198, width: 14, height: 9, angle: -12, color: Tokens.Palette.giDong, triangle: false),
        Piece(x: 352, y: 206, width: 10, height: 14, angle: 28, color: Tokens.Palette.doSon, triangle: false),
        Piece(x: 62, y: 26, width: 14, height: 14, angle: 0, color: Tokens.Palette.giDong, triangle: true),
    ]

    var body: some View {
        GeometryReader { proxy in
            let scale = proxy.size.width / Tokens.Layout.frameWidth
            ZStack(alignment: .topLeading) {
                ForEach(Array(Self.pieces.enumerated()), id: \.offset) { index, piece in
                    Group {
                        if piece.triangle {
                            Triangle().fill(piece.color)
                        } else {
                            RoundedRectangle(cornerRadius: 1).fill(piece.color)
                        }
                    }
                    .frame(width: piece.width, height: piece.height)
                    .rotationEffect(.degrees(piece.angle))
                    .paperDropShadow(Tokens.Shadow.paper1)
                    .position(x: (piece.x + piece.width / 2) * scale, y: piece.y + piece.height / 2)
                    .motion(Tokens.Motion.Preset.fall, delay: Tokens.Motion.Stagger.stepDense * Double(index + 2))
                }
            }
        }
        .accessibilityHidden(true)
    }

    private struct Triangle: SwiftUI.Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.minX + rect.width * 0.15, y: rect.maxY))
            path.closeSubpath()
            return path
        }
    }
}

/// The interface name of a collectible set: the app's `collectible.set.<set>` string, or the
/// generic "Cards" · "Thẻ" (`collectible.set_generic`) when the app has no name for that set
/// yet, so a new `set` in the content never shows a raw key on the card (SK-031).
public enum CollectibleSetName {
    public static let genericKey = "collectible.set_generic"

    /// The string key to show for `set`, looked up in `bundle` (the app's string catalog).
    public static func key(for set: String, in bundle: Bundle = .main) -> String {
        let key = "collectible.set." + set
        let absent = "\u{1}collectible.set.absent"
        return bundle.localizedString(forKey: key, value: absent, table: nil) == absent ? genericKey : key
    }
}
