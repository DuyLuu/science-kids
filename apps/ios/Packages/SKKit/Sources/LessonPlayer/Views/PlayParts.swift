import AudioKit
import ContentModel
import DesignSystem
import Profiles
import SwiftUI

/// SK-059 designer round 2 (Duy 19/11: a shelf of ≤ 6 items is always 2 columns on iPhone, "Cả
/// hai" included, no scrolling): the part above the shelf is made compact. Canvas `x59-shelf2`,
/// `x59-shelf2-done`. Explorer on iPhone: header 72 (the companion 56 in its right slot), message
/// row 112, tray 88, chips 72, gaps 10: 384 pt above the shelf. Discoverer: header 56, message row
/// 64 (English only), tray 76, chips 56.
struct PlayLayout: Equatable {
    /// Between the blocks of the screen.
    var rowGap: CGFloat
    /// The companion in the header's right slot (bottom-aligned).
    var companion: CGFloat
    /// The bubble's least height (kept in one-language mode so the shelf does not jump).
    var bubbleMinHeight: CGFloat
    var speaker: CGFloat
    /// The "VI" button under the speaker ("Cả hai").
    var vi: CGSize
    var trayHeight: CGFloat
    /// A picked item's disc (photo + paper ring) and the empty place.
    var disc: CGFloat
    var discRing: CGFloat
    var emptySlot: CGFloat
    var slotGap: CGFloat
    /// The arrow to the quiz, at the tray's right once the tray succeeds.
    var arrow: CGSize
    var arrowGap: CGFloat
    var chipDot: CGFloat
    /// Under the shelf, above the home indicator.
    var bottomMargin: CGFloat

    static let bubbleRadius: CGFloat = 16
    /// The bubble's tail corner, top right, towards the companion in the header.
    static let bubbleTailRadius: CGFloat = 4
    static let bubbleInsets = EdgeInsets(top: 9, leading: 12, bottom: 10, trailing: 12)
    static let minimumScale: CGFloat = 0.85
    /// EN line of the bubble: Be Vietnam Pro 17/22 bold; VI line 15/20 regular, `chu_phu`.
    static let firstLine = Tokens.Typography(
        family: Tokens.FontFamily.text, size: 17, weight: Tokens.FontWeight.textBold, lineHeight: 22.0 / 17.0, letterSpacing: 0, textCase: nil
    )
    static let secondLine = Tokens.Typography(
        family: Tokens.FontFamily.text, size: 15, weight: Tokens.FontWeight.textRegular, lineHeight: 20.0 / 15.0, letterSpacing: 0, textCase: nil
    )

    static func of(_ ageGroup: Tokens.AgeGroup) -> PlayLayout {
        if ageGroup == .explorer {
            return PlayLayout(
                rowGap: 10, companion: 56, bubbleMinHeight: 112, speaker: ageGroup.touchTarget, vi: CGSize(width: 72, height: 36),
                trayHeight: 88, disc: 78, discRing: 5, emptySlot: 70, slotGap: 8,
                arrow: CGSize(width: 72, height: 80), arrowGap: 10, chipDot: 20, bottomMargin: 22
            )
        }
        return PlayLayout(
            rowGap: 10, companion: 56, bubbleMinHeight: 64, speaker: ageGroup.touchTarget, vi: CGSize(width: 56, height: 28),
            trayHeight: 76, disc: 64, discRing: 4, emptySlot: 58, slotGap: 8,
            arrow: CGSize(width: 56, height: 64), arrowGap: 10, chipDot: 20, bottomMargin: 22
        )
    }

    /// The tray's width for `capacity` places: the discs, their gaps, the capsule's inset.
    func trayWidth(capacity: Int) -> CGFloat {
        let count = CGFloat(max(capacity, 1))
        return count * disc + (count - 1) * slotGap + (trayHeight - disc)
    }
}

/// The message row of Chơi (round 2): the bubble (EN, then VI in "Cả hai", two lines each,
/// shrinking to 0.85), its tail up towards the companion in the header; the speaker and the
/// small "VI" button in a column on the right.
struct PlayBubbleRow: View {
    let text: Spoken
    let mode: LanguageMode
    let showsSecond: Bool
    let listen: Utterance
    let layout: PlayLayout
    /// The bubble's own identifier. SK-060 (finding 5): Chơi names its bubble here
    /// (`lesson.play.message`, `lesson.play.hint`), not on the whole row, so the speaker keeps
    /// `lesson.explorer.listen` and the "VI" button `listen.vi.<id>`.
    var bubbleIdentifier = "lesson.explorer.bubble"
    @Environment(\.speechPlayer) private var speech
    @Environment(\.ageGroup) private var ageGroup

    private var speaking: Bool { speech?.speaking != nil }

    var body: some View {
        HStack(alignment: .top, spacing: Tokens.Space.s8) {
            Button {
                speech?.play(listen)
            } label: {
                VStack(alignment: .leading, spacing: Tokens.Space.s2) {
                    Text(verbatim: mode.sentence(text))
                        .typography(PlayLayout.firstLine)
                        .foregroundStyle(Tokens.Role.textPrimary)
                        .lineLimit(2)
                        .minimumScaleFactor(PlayLayout.minimumScale)
                    if showsSecond {
                        Text(verbatim: mode.secondSentence(text))
                            .typography(PlayLayout.secondLine)
                            .foregroundStyle(Tokens.Role.textSecondary)
                            .lineLimit(2)
                            .minimumScaleFactor(PlayLayout.minimumScale)
                    }
                }
                .multilineTextAlignment(.leading)
                .padding(PlayLayout.bubbleInsets)
                .frame(maxWidth: .infinity, minHeight: layout.bubbleMinHeight, alignment: .topLeading)
                .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, in: UnevenRoundedRectangle(
                    topLeadingRadius: PlayLayout.bubbleRadius, bottomLeadingRadius: PlayLayout.bubbleRadius,
                    bottomTrailingRadius: PlayLayout.bubbleRadius, topTrailingRadius: PlayLayout.bubbleTailRadius, style: .continuous
                ))
            }
            .buttonStyle(.paperPress)
            .disabled(listen.isEmpty)
            .accessibilityLabel(Text(verbatim: mode.sentence(text)))
            .accessibilityAddTraits(.startsMediaSession)
            .accessibilityIdentifier(bubbleIdentifier)
            if !listen.isEmpty {
                VStack(spacing: Tokens.Space.s4) {
                    Button {
                        speech?.play(listen)
                    } label: {
                        ZStack {
                            Circle()
                                .fill(speaking ? Tokens.Role.stateCurrent : Tokens.Palette.giDong)
                                .paperDropShadow(Tokens.Shadow.paper2)
                            PaperIconView(.speaker, size: ExplorerMetrics.speakerGlyph, color: speaking ? Tokens.Role.textPrimary : Tokens.Role.textOnAccent)
                        }
                        .frame(width: layout.speaker, height: layout.speaker)
                    }
                    .buttonStyle(.paperPress)
                    .accessibilityLabel(Text("lesson.listen"))
                    .accessibilityAddTraits(.startsMediaSession)
                    .accessibilityIdentifier("lesson.explorer.listen")
                    if let speech, speech.secondVoice(of: listen) != nil {
                        Button {
                            speech.playSecond(listen)
                        } label: {
                            HStack(spacing: Tokens.Space.s2) {
                                PaperIconView(.speaker, size: PaperMetrics.headerChipIcon, color: Tokens.Palette.cham)
                                Text(verbatim: "VI")
                                    .typography(Tokens.Typography.label, fixedBox: true)
                                    .foregroundStyle(Tokens.Palette.cham)
                            }
                            .frame(width: layout.vi.width, height: layout.vi.height)
                            .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.tag)
                            // SK-060 (finding 7): the drawn chip keeps its size (56 × 28); the touch
                            // area is the age group's target, like `SecondVoiceButton`. Top-aligned
                            // so the chip stays right under the speaker.
                            .frame(minWidth: ageGroup.touchTarget, minHeight: ageGroup.touchTarget, alignment: .top)
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(.paperPress)
                        .accessibilityLabel(Text("lesson.listen.vi", bundle: .main))
                        .accessibilityAddTraits(.startsMediaSession)
                        .accessibilityIdentifier("listen.vi.\(listen.id)")
                    }
                }
            }
        }
    }
}

/// The tray of round 2: a capsule (radius = half its height) in gỉ đồng, its lower half darker.
struct PlayTrayCapsule: View {
    var body: some View {
        ZStack {
            Capsule().fill(Tokens.Palette.giDongDeep)
            Capsule().fill(Tokens.Palette.giDong).clipShape(TopHalf())
        }
    }

    private struct TopHalf: SwiftUI.Shape {
        func path(in rect: CGRect) -> Path {
            Path(CGRect(x: rect.minX, y: rect.minY, width: rect.width, height: rect.height / 2))
        }
    }
}
