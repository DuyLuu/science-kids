import AudioKit
import ContentModel
import DesignSystem
import LessonEngine
import Profiles
import SwiftUI

/// Thưởng (canvas Discoverer 13): stars from `computeStars`, the quiz score and XP from the engine,
/// paper confetti (`fall`, only on this screen), the collectible card that turns over (`flip`).
struct RewardStep: View {
    let session: LessonSession
    let summary: LessonSummary
    let heading: LessonHeading
    let onClose: () -> Void
    let onShowCards: () -> Void

    @State private var flipped = false
    /// The side shown once the turn has ended. The far side's words leave the screen (and
    /// VoiceOver) only then, so they never vanish while the card is still turning.
    @State private var settledFlipped = false
    @ReducedMotion private var reduced
    @Environment(\.layoutMetrics) private var metrics

    private var mode: LanguageMode { session.languageMode }
    private var showsSecond: Bool { session.showsSecondLanguage }

    var body: some View {
        PaperFrame(scrolls: true) {
            content
                // Behind the words, across the whole screen width (canvas z-index 0). A background
                // never sizes the content, so the wider layer cannot push the column sideways.
                .background(alignment: .top) {
                    // Canvas positions are measured from the frame's top edge, the content
                    // starts `contentInsets.top` lower.
                    // Regular: the confetti falls over the paper frame, scaled from the 390 canvas.
                    Confetti()
                        .frame(width: metrics.drawsPaperFrame ? metrics.frameWidth : metrics.containerWidth, height: LessonMetrics.confettiHeight)
                        .offset(y: -metrics.contentInsets.top)
                        .allowsHitTesting(false)
                }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            BottomBar {
                HStack(alignment: .top, spacing: Tokens.Space.s12) {
                    TwoLayerButton("lesson.reward.cards", role: .secondary, action: onShowCards)
                        .accessibilityIdentifier("lesson.reward.cards")
                    TwoLayerButton("lesson.reward.home", icon: .arrowForward, action: onClose)
                        .accessibilityIdentifier("lesson.reward.home")
                }
            }
            .reveal(order: 9)
        }
    }

    private var content: some View {
        VStack(spacing: LessonMetrics.gap) {
            HStack {
                Spacer()
                PaperIconButton(.close, accessibilityLabel: Text("lesson.reward.close"), action: onClose)
                    .accessibilityIdentifier("lesson.back")
            }
            VStack(spacing: Tokens.Space.s4) {
                Text("lesson.reward.title \(heading.lessonNumber)")
                    .typography(Tokens.Typography.titleXl)
                    .foregroundStyle(Tokens.Role.textAccent)
                    .accessibilityAddTraits(.isHeader)
                    .accessibilityIdentifier("lesson.reward.title")
                Text("lesson.reward.subtitle \(mode.name(session.lesson.title))")
                    .typography(Tokens.Typography.bodyStrong)
                    .foregroundStyle(Tokens.Role.textSecondary)
            }
            .multilineTextAlignment(.center)
            .reveal(order: 2)
            stars
            stats.reveal(order: 7)
            if let collectible = session.lesson.reward.collectible {
                card(collectible).reveal(order: 8)
            }
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: Stars

    private var stars: some View {
        let count = summary.stars.stars
        return VStack(spacing: Tokens.Space.s6) {
            HStack(alignment: .bottom, spacing: Tokens.Space.s10) {
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
            Text(starsHint)
                .typography(Tokens.Typography.caption)
                .foregroundStyle(Tokens.Role.textSecondary)
                .multilineTextAlignment(.center)
                .reveal(order: 6)
        }
    }

    /// What the next star needs (rules: pass threshold, mastery gap).
    private var starsHint: LocalizedStringKey {
        let threshold = session.rules.scoring.passThreshold
        switch summary.stars.stars {
        case 3: return "lesson.reward.hint_mastered"
        case 2:
            let days = session.rules.scoring.masteryGapDays
            return days == 1 ? "lesson.reward.hint_tomorrow" : "lesson.reward.hint_days \(days)"
        default:
            return "lesson.reward.hint_pass \(threshold.num) \(threshold.den)"
        }
    }

    // MARK: Numbers

    private var stats: some View {
        HStack(spacing: Tokens.Space.s10) {
            tile(value: Text("lesson.reward.score \(summary.score.correct) \(summary.score.max)"),
                 caption: Text("lesson.reward.score_caption"), accent: false, identifier: "lesson.reward.score")
            tile(value: Text("lesson.reward.xp \(summary.xp.total)"),
                 caption: Text(verbatim: "XP"), accent: true, identifier: "lesson.reward.xp")
        }
    }

    private func tile(value: Text, caption: Text, accent: Bool, identifier: String) -> some View {
        VStack(spacing: Tokens.Space.s2) {
            value
                .typography(Tokens.Typography.titleL, fixedBox: true)
                .foregroundStyle(accent ? Tokens.Role.textAccent : Tokens.Role.textPrimary)
            caption
                .typography(Tokens.Typography.captionS)
                .foregroundStyle(Tokens.Role.textSecondary)
        }
        .padding(EdgeInsets(top: Tokens.Space.s10, leading: Tokens.Space.s6, bottom: Tokens.Space.s10, trailing: Tokens.Space.s6))
        .frame(maxWidth: .infinity)
        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper3, cornerRadius: Tokens.Radius.discoverer)
        .accessibilityElement(children: .combine)
        .accessibilityIdentifier(identifier)
    }

    // MARK: Card

    private func card(_ collectible: Collectible) -> some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s10) {
            HStack(alignment: .center, spacing: Tokens.Space.s8) {
                Text("lesson.reward.card_label")
                    .typography(Tokens.Typography.number)
                    .frame(maxWidth: .infinity, alignment: .leading)
                // The side the child sees: the name and its tag, or "Em có biết?" on the back.
                ListenButton(
                    flipped
                        ? session.utterance("reward.fact", collectible.fact)
                        : session.utterance("reward.card", collectible.name, collectible.tag),
                    label: flipped ? "lesson.listen.fact" : "lesson.listen.card",
                    disc: .paper
                )
            }
            Button {
                flipped.toggle()
            } label: {
                FlipCard(isFlipped: flipped) {
                    cardFront(collectible, showsContent: !flipped || !settledFlipped)
                } back: {
                    cardBack(collectible, showsContent: flipped || settledFlipped)
                }
                .background {
                    RoundedRectangle(cornerRadius: Tokens.Radius.tileL, style: .continuous)
                        .fill(Tokens.Palette.cham)
                        .padding(-Tokens.Space.s6)
                        .rotationEffect(LessonMetrics.cardBackTilt)
                        .paperDropShadow(Tokens.Shadow.paper3)
                }
                .rotationEffect(LessonMetrics.cardTilt)
                .padding(Tokens.Space.s8)
            }
            .buttonStyle(.paperPress)
            .accessibilityLabel(Text("lesson.reward.card_a11y \(collectible.name.en)"))
            .accessibilityValue(flipped ? Text(verbatim: collectible.fact.en) : Text(verbatim: ""))
            .accessibilityIdentifier("lesson.reward.card")
            .task(id: flipped) {
                if !reduced { try? await Task.sleep(for: .seconds(Tokens.Motion.Preset.flip.duration)) }
                if !Task.isCancelled { settledFlipped = flipped }
            }
        }
    }

    private func cardFront(_ collectible: Collectible, showsContent: Bool) -> some View {
        HStack(spacing: Tokens.Space.s14) {
            ContentPicture(image: collectible.image, color: Tokens.Palette.giDong, size: metrics.illustration(LessonMetrics.cardArt) * 0.8)
                .frame(width: metrics.illustration(LessonMetrics.cardArt), height: metrics.illustration(LessonMetrics.cardArt))
                .paperSurface(Tokens.Role.bgScreen, shadow: Tokens.Shadow.sunken, cornerRadius: Tokens.Radius.discoverer)
            VStack(alignment: .leading, spacing: Tokens.Space.s4) {
                PaperTag(Text("lesson.reward.new"), style: .cut(eyebrow: true))
                Text(verbatim: mode.name(collectible.name))
                    .typography(Tokens.Typography.titleL, fixedBox: true)
                    .lineLimit(2)
                    .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                if let second = mode.secondName(collectible.name) {
                    Text(verbatim: second)
                        .typography(Tokens.Typography.bodyStrong, fixedBox: true)
                        .foregroundStyle(Tokens.Role.textSecondary)
                }
                if let tag = collectible.tag {
                    PaperTag(Text(verbatim: mode.name(tag)), style: .chip(dot: Tokens.Palette.giDong))
                }
                Text(LocalizedStringKey(CollectibleSetName.key(for: collectible.set)))
                    .typography(Tokens.Typography.captionS)
                    .foregroundStyle(Tokens.Role.textSecondary)
            }
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .opacity(showsContent ? 1 : 0)
        .accessibilityHidden(!showsContent)
        .padding(Tokens.Space.s14)
        .frame(maxWidth: .infinity, minHeight: LessonMetrics.cardHeight, alignment: .leading)
        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.onDark, cornerRadius: Tokens.Radius.discoverer)
    }

    private func cardBack(_ collectible: Collectible, showsContent: Bool) -> some View {
        Group {
            if showsContent {
                VStack(alignment: .leading, spacing: Tokens.Space.s6) {
                    PaperTag(Text("lesson.reward.fact"), style: .cut(eyebrow: true))
                    BilingualLines(spoken: collectible.fact, mode: mode, showsSecond: showsSecond, secondary: Tokens.Typography.bodyS)
                }
                .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(Tokens.Space.s14)
        .frame(maxWidth: .infinity, minHeight: LessonMetrics.cardHeight, alignment: .leading)
        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.onDark, cornerRadius: Tokens.Radius.discoverer)
    }
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
