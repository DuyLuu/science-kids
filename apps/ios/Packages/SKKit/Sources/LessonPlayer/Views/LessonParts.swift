import AudioKit
import ContentModel
import DesignSystem
import Profiles
import SwiftUI

/// Canvas sizes of the lesson screens with no token (file and element on each line), so the views
/// write no raw numbers. Proposed as tokens in SK-012 "Kết quả".
enum LessonMetrics {
    /// Screen gap (`gap: 12px`), Học (`gap: 10px`).
    static let gap: CGFloat = Tokens.Space.s12
    static let learnGap: CGFloat = Tokens.Space.s10
    /// Art in a question sheet (Warmup w2: `76 × 76`), in a Học sentence sheet (`76`), in a quiz cell (`50`).
    static let sheetArt: CGFloat = 76
    static let cellArt: CGFloat = 50
    /// Bank chip (`height: 56px`), its dot (`7 × 7`).
    static let bankDot: CGFloat = 7
    /// True / false card (Warmup `height: 76px`, QuizMyth `height: 100px`).
    static let trueFalseHeight: CGFloat = 76
    static let trueFalseHeightTall: CGFloat = 100
    /// Text-only answer (no picture): `min-height` of a list row.
    static let textChoiceMinHeight: CGFloat = 64
    /// Speaker figure of a statement (QuizMyth: `80 × 80`), bubble corner (`16px 16px 16px 4px`).
    static let speakerArt: CGFloat = 80
    /// Mascot beside the tray message (Play: `64 × 64`).
    static let mascot: CGFloat = 64
    /// Tray item disc (`padding: 5px`), its dot (`8 × 8`); shelf seal inset (`right: 5px; top: 5px`).
    static let trayDiscRing: CGFloat = 5
    static let trayDot: CGFloat = 8
    static let shelfSealInset: CGFloat = 5
    /// Learn group disc (`24 × 24`) is `PaperMetrics.groupDisc`; objective dot (`7 × 7`).
    static let dot: CGFloat = 7
    /// Reward: star (`48`), collectible card (`height: 176px`), its art well (`110 × 110`).
    static let star: CGFloat = 48
    static let cardHeight: CGFloat = 176
    static let cardArt: CGFloat = 110
    static let cardTilt: Angle = .degrees(-2)
    static let cardBackTilt: Angle = .degrees(1.6)
    static let confettiHeight: CGFloat = 270
    /// Meter chip (`height: 34px`), its check (`14`).
    static let meterHeight: CGFloat = 34
    static let meterCheck: CGFloat = 14
}

extension ContentPicture {
    /// The picture of a content `Image` (SK-033): the pack's picture when `image.asset` is in the
    /// pack, else the stand-in art; VoiceOver reads its `alt` (English, like the cells' labels).
    /// No `image`: decorative stand-in art.
    init(image: ContentImage?, color: Color?, size: CGFloat, box: Box = .square) {
        self.init(
            asset: image?.asset, color: color, size: size, box: box,
            accessibilityLabel: image.map { Text(verbatim: $0.alt.en) }
        )
    }
}

extension ColorToken {
    /// The style E colour of a content colour name; unknown names fall back to giấy lõm.
    var color: Color {
        switch self {
        case .doSon: Tokens.Palette.doSon
        case .vangHoe: Tokens.Palette.vangHoe
        case .giDong: Tokens.Palette.giDong
        case .cham: Tokens.Palette.cham
        case .nauDat: Tokens.Palette.nauDat
        default: Tokens.Role.surfaceInactive
        }
    }
}

/// A sentence of the content in its two lines by `language_mode`: the first line in `primary`,
/// the other language under it in `secondary` (hidden in Tiếng Anh trước until the child asks).
struct BilingualLines: View {
    let spoken: Spoken
    let mode: LanguageMode
    let showsSecond: Bool
    var primary: Tokens.Typography = Tokens.Typography.sentence
    var secondary: Tokens.Typography = Tokens.Typography.body
    var alignment: HorizontalAlignment = .leading
    var identifier: String?

    var body: some View {
        VStack(alignment: alignment, spacing: Tokens.Space.s4) {
            Text(verbatim: mode.sentence(spoken))
                .typography(primary)
                .fixedSize(horizontal: false, vertical: true)
                .accessibilityIdentifier(identifier ?? "")
            if showsSecond {
                Text(verbatim: mode.secondSentence(spoken))
                    .typography(secondary)
                    .foregroundStyle(Tokens.Role.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .multilineTextAlignment(alignment == .center ? .center : .leading)
    }
}

/// Header of Khởi động, Học, Chơi (canvas): round back button, title, caption, and the "VI" switch
/// in Tiếng Anh trước.
struct LessonHeader: View {
    let backIcon: PaperIcon
    let backLabel: Text
    let title: String
    let caption: String?
    let session: LessonSession
    let onBack: () -> Void
    var trailing: AnyView?

    var body: some View {
        HStack(spacing: Tokens.Space.s12) {
            PaperIconButton(backIcon, accessibilityLabel: backLabel, action: onBack)
                .accessibilityIdentifier("lesson.back")
            VStack(alignment: .leading, spacing: Tokens.Space.s2) {
                Text(verbatim: title)
                    .typography(Tokens.Typography.title)
                    .fixedSize(horizontal: false, vertical: true)
                    .accessibilityAddTraits(.isHeader)
                    .accessibilityIdentifier("lesson.title")
                if let caption {
                    Text(verbatim: caption)
                        .typography(Tokens.Typography.caption)
                        .foregroundStyle(Tokens.Role.textSecondary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            if let trailing { trailing }
            SecondLanguageSwitch(session: session)
        }
    }
}

/// A "VI" chip that showed or hid every Vietnamese line in Tiếng Anh trước. SK-042 (Duy 12/11):
/// English, Tiếng Việt and Cả hai are now picked on the Settings screen, and English shows
/// English only, so the chip is off (`isOffered`); kept for a later "show the other language" choice.
struct SecondLanguageSwitch: View {
    @Bindable var session: LessonSession
    @Environment(\.ageGroup) private var ageGroup

    static let isOffered = false

    var body: some View {
        if Self.isOffered, session.languageMode.hidesSentenceSecondLanguage {
            Button {
                session.showsSecondLanguage.toggle()
            } label: {
                Text(verbatim: "VI")
                    .typography(Tokens.Typography.label, fixedBox: true)
                    .foregroundStyle(Tokens.Role.textPrimary)
                    .frame(width: ageGroup.touchTarget, height: ageGroup.touchTarget)
                    .paperSurface(
                        session.showsSecondLanguage ? Tokens.Role.stateSelected : Tokens.Role.surfacePaper,
                        shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.tag
                    )
            }
            .buttonStyle(.paperPress)
            .accessibilityLabel(Text(session.showsSecondLanguage ? "lesson.vi.hide" : "lesson.vi.show"))
            .accessibilityAddTraits(session.showsSecondLanguage ? .isSelected : [])
            .accessibilityIdentifier("lesson.vi_switch")
        }
    }
}

/// The four parts of the lesson on labelled squares (Khởi động · Học · Chơi · Quiz).
struct StepSquares: View {
    let current: Int

    private static let labels: [LocalizedStringKey] = ["lesson.step.warmup", "lesson.step.learn", "lesson.step.play", "lesson.step.quiz"]

    var body: some View {
        ProgressSquares(
            count: Self.labels.count,
            current: current,
            labels: Self.labels.map { Text($0) },
            accessibilityLabel: Text("lesson.step_a11y \(current + 1) \(Self.labels.count) \(Text(Self.labels[min(current, Self.labels.count - 1)]))")
        )
        .accessibilityIdentifier("lesson.steps")
    }
}

/// The result that slides up from the bottom after an answer (canvas `e-rise`): the seal and
/// "Chính xác!" (right on the first try, with the XP), "Đúng rồi!" (right on a later try) or
/// "Cùng xem lại nhé" (wrong on the last try), the explanation, the button onward.
struct ResultSheet: View {
    let correct: Bool
    let firstTry: Bool
    let xp: Int?
    let explanation: Spoken
    let mode: LanguageMode
    let showsSecond: Bool
    /// What the explanation's listen button plays.
    let listen: Utterance
    let buttonTitle: LocalizedStringKey
    let action: () -> Void

    @Environment(\.layoutMetrics) private var metrics

    /// Phone padding of the canvas; in the paper frame the sides follow the frame padding so the
    /// button lines up with the content above (canvas iPad Quiz).
    private var padding: EdgeInsets {
        var padding = PaperMetrics.resultSheetPadding
        if metrics.drawsPaperFrame {
            padding.leading = metrics.contentInsets.leading
            padding.trailing = metrics.contentInsets.trailing
        }
        return padding
    }

    var body: some View {
        TornSheet(rising: true, padding: padding) {
            VStack(alignment: .leading, spacing: Tokens.Space.s12) {
                HStack(alignment: .top, spacing: Tokens.Space.s14) {
                    if correct {
                        Seal(Text("lesson.seal.correct"), tone: .correct, delay: Tokens.Motion.Stagger.step * 4)
                            .accessibilityHidden(true)
                    }
                    VStack(alignment: .leading, spacing: Tokens.Space.s2) {
                        HStack(alignment: .firstTextBaseline) {
                            Text(title)
                                .typography(Tokens.Typography.titleL)
                                // "Chính xác!" / "Đúng rồi!" in lá tre (Duy 29/10, `role.text_correct`).
                                .foregroundStyle(correct ? Tokens.Role.textCorrect : Tokens.Role.textPrimary)
                                .accessibilityAddTraits(.isHeader)
                                .accessibilityIdentifier("lesson.result.title")
                            Spacer(minLength: Tokens.Space.s8)
                            if let xp, xp > 0 {
                                Text("lesson.xp_plus \(xp)")
                                    .typography(Tokens.Typography.number)
                                    .accessibilityIdentifier("lesson.result.xp")
                            }
                        }
                        HStack(alignment: .center, spacing: Tokens.Space.s10) {
                            BilingualLines(
                                spoken: explanation, mode: mode, showsSecond: showsSecond,
                                primary: Tokens.Typography.itemTitle, secondary: Tokens.Typography.bodyS,
                                identifier: "lesson.result.explanation"
                            )
                            .frame(maxWidth: .infinity, alignment: .leading)
                            ListenButton(listen, label: "lesson.listen.explanation")
                        }
                    }
                }
                TwoLayerButton(buttonTitle, icon: .arrowForward, action: action)
                    .accessibilityIdentifier("lesson.result.next")
            }
        }
        .alignedToPaperFrame()
        .motion(Tokens.Motion.Preset.rise)
    }

    private var title: LocalizedStringKey {
        if !correct { return "lesson.result.wrong" }
        return firstTry ? "lesson.result.correct_first" : "lesson.result.correct_later"
    }
}

/// The note after a first wrong try: a folded slip with "Gần đúng!" and the question's hint, its
/// listen button beside it.
struct HintNote: View {
    let hint: Spoken
    let mode: LanguageMode
    let listen: Utterance

    var body: some View {
        HStack(alignment: .center, spacing: Tokens.Space.s10) {
            // Hints are mostly Vietnamese on the canvas (B4.1): one line in the name language.
            FoldNote(title: Text("lesson.retry.title"), message: Text(verbatim: mode.name(hint)))
                .accessibilityIdentifier("lesson.hint")
            ListenButton(listen, label: "lesson.listen.hint", disc: .paper)
        }
        .motion(Tokens.Motion.Preset.lay)
    }
}

/// Bottom area of a screen: the main button or the result, on điệp, full width.
struct BottomBar<Content: View>: View {
    @ViewBuilder let content: Content
    @Environment(\.layoutMetrics) private var metrics

    var body: some View {
        content
            .padding(.horizontal, metrics.contentInsets.leading)
            .padding(.vertical, Tokens.Space.s8)
            .frame(maxWidth: .infinity)
            .background(Tokens.Role.bgScreen)
            .alignedToPaperFrame()
    }
}
