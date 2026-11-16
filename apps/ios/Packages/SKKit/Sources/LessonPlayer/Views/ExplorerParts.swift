import AudioKit
import ContentModel
import DesignSystem
import LessonEngine
import Profiles
import SwiftUI

// Pieces of the Explorer (5–7) screens (SK-040), after the chosen form of SK-026 D2 (Duy 2/11):
// frame A "Bạn kể chuyện" (mascot and speech bubble at the top, the whole bubble replays), the
// square bamboo seal and the peeled corner of B, the nod / shake icons for true / false.
// Canvas: `Explorer-Quiz-A`, `Explorer-QuizTF`, `Explorer-QuizTF-Icons`, `Explorer-Reward`.

/// Canvas sizes of the Explorer screens with no token (file and element on each line).
enum ExplorerMetrics {
    /// Mascot beside the bubble (Quiz-A: `96 × 96`), bubble `min-height: 96px`.
    /// SK-043 Explorer-A: a smaller mascot (`52`), the bubble at least `72` high.
    static let mascot: CGFloat = 52
    static let bubbleMinHeight: CGFloat = 72
    /// Speaker badge on the bubble's corner (`48 × 48`, `right: -10px; top: -14px`), its glyph.
    static let speakerBadge: CGFloat = 48
    static let speakerGlyph: CGFloat = 26
    static let speakerBadgeOffset = CGSize(width: 10, height: -14)
    /// Picture of the question (QuizTF: sheet `height: 214px`, art `196 × 196`).
    static let questionSheetHeight: CGFloat = 214
    /// SK-043 Explorer-A: the true / false photo (`336 × 250`).
    static let questionPhotoHeight: CGFloat = 250
    static let questionArt: CGFloat = 196
    /// With picture cards under it (choices, order) the question's picture is smaller, so the
    /// cards stay on a 390 × 844 screen without scrolling (no canvas: Quiz-A has no question
    /// picture; `validate` asks one on every Explorer question, SK-033).
    static let questionSheetHeightWithCards: CGFloat = 112
    static let questionArtWithCards: CGFloat = 96
    /// Picture card of a choice (Quiz-A: `height: 128px`).
    static let choiceHeight: CGFloat = 136
    /// SK-043 hướng A: with two picture choices each card is taller, so the cropped photo keeps
    /// the animal whole (the question picture is gone, the room is there).
    static let choiceHeightTwo: CGFloat = 200
    /// iPad (regular): the picture cards stand in one row, `170 × 300` (Explorer-A `ipad-q1`).
    static let choiceHeightRegular: CGFloat = 300
    /// True / false card (QuizTF: `height: 168px`), its icon (`132 × 132`).
    static let trueFalseHeight: CGFloat = 168
    static let trueFalseIcon: CGFloat = 132
    /// Peeled corner of a tried card (QuizTF: `64 × 64`), its retry arrow (`28`, inset `32px`).
    static let peel: CGFloat = 64
    static let retryIcon: CGFloat = 28
    static let retryInset: CGFloat = 32
    /// Seal on a right card (QuizTF: `right: -8px; top: -12px`).
    static let sealOffset = CGSize(width: 8, height: -12)
    /// Picture of a tried card (`filter: grayscale(1); opacity: 0.42`).
    static let triedOpacity: Double = 0.42
    /// Arrow on the next button (`48 × 48`).
    static let nextIcon: CGFloat = 48
    /// Question squares (`24 × 24`, current `30 × 30`, `gap: 9px`).
    static let pip: CGFloat = 24
    static let pipCurrent: CGFloat = 30
    static let pipGap: CGFloat = 9
    /// "Reading the name" beat after a tap, before the result shows (canvas `setTimeout(…, 900)`).
    static let nameBeat: Duration = .milliseconds(900)
    /// Reward: sticker disc (`172 × 172`, tilted −6°), its art; star (`56`).
    /// SK-043 Explorer-A: the reward's photo as a round sticker `250`.
    static let sticker: CGFloat = 250
    static let stickerArt: CGFloat = 232
    static let stickerTilt: Angle = .degrees(-6)
    static let star: CGFloat = 56
}

// MARK: - Card look

/// The look of one Explorer answer card (a picture, a nod / shake, a sequence picture).
enum ExplorerCardLook: Equatable {
    /// Paper, tappable.
    case idle
    /// Just tapped: the app reads its name (offset ring vàng hoè).
    case naming
    /// The right answer the child picked: lá tre ring and the square seal.
    case right
    /// A wrong try: sunken paper, grey picture, peeled corner (with the retry arrow while a try
    /// is left).
    case tried
    /// Out of tries: the right answer the child did not pick, on vàng hoè nhạt.
    case answer

    /// The look of card `key` from the tries so far (`tried`: the keys in try order), whether it
    /// is a right answer, the question's status and the card being named, if any.
    ///
    /// While a card is named the result is not shown yet: the try is already scored (D4: tap is
    /// the answer), but the cards keep the look they had before it.
    static func of(key: String, tried: [String], isCorrect: Bool, status: QuestionStatus, naming: String?) -> ExplorerCardLook {
        if let naming {
            if key == naming { return .naming }
            return tried.dropLast().contains(key) ? .tried : .idle
        }
        switch status {
        case .open:
            return .idle
        case .retry:
            return tried.contains(key) ? .tried : .idle
        case .done(let correct, _, _):
            if correct, isCorrect, tried.last == key { return .right }
            if !correct, isCorrect { return .answer }
            return tried.contains(key) ? .tried : .idle
        }
    }

    var fill: Color {
        switch self {
        case .idle, .naming, .right: Tokens.Role.surfacePaper
        case .tried: Tokens.Role.feedbackWrong
        case .answer: Tokens.Role.feedbackMissed
        }
    }

    var shadow: Tokens.Shadow {
        switch self {
        case .idle: Tokens.Shadow.paper2
        case .naming, .answer: Tokens.Shadow.offsetAccent
        case .right: Tokens.Shadow.offsetCorrect
        case .tried: Tokens.Shadow.sunken
        }
    }

    /// What VoiceOver adds after the card's name (string catalog), once it has a look.
    var accessibilityValue: Text? {
        switch self {
        case .idle: nil
        case .naming: Text("lesson.explorer.card.chosen")
        case .right: Text("lesson.mark.correct")
        case .tried: Text("lesson.mark.wrong")
        case .answer: Text("lesson.mark.answer")
        }
    }
}

/// The keys of a question's tries, in order: the picked key, `"true"` / `"false"`, or the last
/// key placed of an order.
func triedKeys(_ tries: [Try]) -> [String] {
    tries.map { attempt in
        switch attempt {
        case .selected(let key): key
        case .value(let value): String(value)
        case .selectedSet(let keys), .filled(let keys), .order(let keys): keys.joined(separator: ",")
        }
    }
}

// MARK: - Card

/// The paper of an answer card in its look: the peeled corner (with the retry arrow while a try
/// is left), the square bamboo seal on a right card. Sizes the content; the button is outside.
struct ExplorerCardFace<Content: View>: View {
    let look: ExplorerCardLook
    /// A try is left after this wrong one: the retry arrow sits under the peeled corner.
    let showsRetry: Bool
    let height: CGFloat
    /// The seal of a right card; off on the places of an order but the last (one seal a row).
    var showsSeal = true
    @ViewBuilder let content: Content

    var body: some View {
        let radius = Tokens.Radius.explorer
        let peeled = look == .tried
        ZStack {
            content
                .grayscale(peeled ? 1 : 0)
                .opacity(peeled ? ExplorerMetrics.triedOpacity : 1)
        }
        .frame(maxWidth: .infinity, minHeight: height, maxHeight: height)
        .background {
            PeeledCard(radius: radius, peel: peeled ? ExplorerMetrics.peel : 0)
                .fill(look.fill)
                .paperShadow(look.shadow, in: PeeledCard(radius: radius, peel: peeled ? ExplorerMetrics.peel : 0))
        }
        .overlay(alignment: .topTrailing) {
            if peeled {
                ZStack(alignment: .topTrailing) {
                    // The flap that came off, folded down (canvas: giấy lõm đậm triangle).
                    PeelFlap()
                        .fill(Tokens.Palette.giayLomDeep)
                        .frame(width: ExplorerMetrics.peel, height: ExplorerMetrics.peel)
                        .paperDropShadow(Tokens.Shadow.dropFold)
                    if showsRetry {
                        PaperIconView(.retry, size: ExplorerMetrics.retryIcon, color: Tokens.Role.textPrimary)
                            .padding(.top, ExplorerMetrics.retryInset)
                            .padding(.trailing, ExplorerMetrics.retryInset)
                            .motion(Tokens.Motion.Preset.pop, delay: Tokens.Motion.Stagger.stepDense)
                    }
                }
                .motion(Tokens.Motion.Preset.pop)
                .accessibilityHidden(true)
            }
        }
        .overlay(alignment: .topTrailing) {
            if look == .right, showsSeal {
                Seal(icon: .check, size: .large, tone: .correct, delay: Tokens.Motion.Stagger.step)
                    .offset(ExplorerMetrics.sealOffset)
            }
        }
        .paperStateAnimation(value: look)
    }
}

/// A rounded card whose top-right corner is cut off along the diagonal (`peel` long), as the
/// canvas' `clip-path` of a tried card. `peel` 0 is a plain rounded rectangle.
struct PeeledCard: SwiftUI.Shape {
    let radius: CGFloat
    let peel: CGFloat

    func path(in rect: CGRect) -> Path {
        guard peel > 0 else {
            return RoundedRectangle(cornerRadius: radius, style: .continuous).path(in: rect)
        }
        let r = min(radius, rect.height / 2, rect.width / 2)
        var path = Path()
        path.move(to: CGPoint(x: rect.minX + r, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - peel, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + peel))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - r))
        path.addArc(tangent1End: CGPoint(x: rect.maxX, y: rect.maxY), tangent2End: CGPoint(x: rect.maxX - r, y: rect.maxY), radius: r)
        path.addLine(to: CGPoint(x: rect.minX + r, y: rect.maxY))
        path.addArc(tangent1End: CGPoint(x: rect.minX, y: rect.maxY), tangent2End: CGPoint(x: rect.minX, y: rect.maxY - r), radius: r)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + r))
        path.addArc(tangent1End: CGPoint(x: rect.minX, y: rect.minY), tangent2End: CGPoint(x: rect.minX + r, y: rect.minY), radius: r)
        path.closeSubpath()
        return path
    }
}

/// The folded flap of the peeled corner: the lower-left half of its square.
struct PeelFlap: SwiftUI.Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

// MARK: - Mascot and bubble

/// The mascot's face for what it is saying.
enum ExplorerMood: Equatable {
    case talk, happy, think, idle

    /// Mascot art of the app bundle (from the canvas symbols, SK-040).
    var imageName: String {
        switch self {
        case .talk: "ArtMascotTalk"
        case .happy: "ArtMascotHappy"
        case .think: "ArtMascotThink"
        case .idle: "ArtMascot"
        }
    }

    static func of(status: QuestionStatus, naming: Bool) -> ExplorerMood {
        if naming { return .talk }
        switch status {
        case .open: return .talk
        case .retry: return .think
        case .done(let correct, _, _): return correct ? .happy : .idle
        }
    }
}

/// Frame A "Bạn kể chuyện": the mascot and its speech bubble. Everything the app says shows in
/// the bubble as a short subtitle (D2), and the whole bubble is the replay button. While the
/// voice plays, the speaker badge turns vàng hoè and the mascot sways (the screen's one loop,
/// unless another piece already loops: `sways` false).
struct ExplorerSpeechRow: View {
    let mood: ExplorerMood
    let lines: [Spoken]
    /// App line under the content's (the first true / false: how to answer), string catalog.
    var note: LocalizedStringKey?
    let mode: LanguageMode
    let showsSecond: Bool
    let listen: Utterance
    let sways: Bool
    @Environment(\.speechPlayer) private var speech
    @Environment(\.layoutMetrics) private var metrics
    @Environment(\.ageGroup) private var ageGroup

    private var speaking: Bool { speech?.speaking != nil }

    // SK-043 Explorer-A: a small mascot, the bubble, and the speaker as its own 72 disc on the right
    // (gỉ đồng, vàng hoè while it speaks), the VI speaker of "Cả hai" under it.
    var body: some View {
        HStack(alignment: .center, spacing: Tokens.Space.s8) {
            Image(mood.imageName, bundle: .main)
                .resizable()
                .scaledToFit()
                .frame(width: ExplorerMetrics.mascot, height: ExplorerMetrics.mascot)
                .paperDropShadow(Tokens.Shadow.dropTag)
                .modifier(LoopMotion(preset: Tokens.Motion.Preset.sway, active: sways && speaking))
                .accessibilityHidden(true)
            Button {
                speech?.play(listen)
            } label: {
                VStack(alignment: .leading, spacing: Tokens.Space.s2) {
                    ForEach(Array(lines.enumerated()), id: \.offset) { _, line in
                        Text(verbatim: mode.sentence(line))
                            .typography(Tokens.Typography.itemTitle)
                            .fixedSize(horizontal: false, vertical: true)
                        if showsSecond {
                            Text(verbatim: mode.secondSentence(line))
                                .typography(Tokens.Typography.bodyS)
                                .foregroundStyle(Tokens.Role.textSecondary)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    if let note {
                        Text(note)
                            .typography(Tokens.Typography.bodyS)
                            .foregroundStyle(Tokens.Role.textSecondary)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.top, Tokens.Space.s4)
                    }
                }
                .multilineTextAlignment(.leading)
                .padding(EdgeInsets(top: Tokens.Space.s12, leading: Tokens.Space.s14, bottom: Tokens.Space.s12, trailing: Tokens.Space.s14))
                .frame(maxWidth: .infinity, minHeight: ExplorerMetrics.bubbleMinHeight, alignment: .leading)
                .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, in: UnevenRoundedRectangle(
                    topLeadingRadius: Tokens.Radius.explorer, bottomLeadingRadius: Tokens.Radius.bubbleTail,
                    bottomTrailingRadius: Tokens.Radius.explorer, topTrailingRadius: Tokens.Radius.explorer, style: .continuous
                ))
            }
            .buttonStyle(.paperPress)
            .disabled(listen.isEmpty)
            .accessibilityLabel(Text(verbatim: (lines.map { mode.sentence($0) }).joined(separator: " ")))
            .accessibilityHint(listen.isEmpty ? Text(verbatim: "") : Text("lesson.explorer.bubble_hint"))
            .accessibilityAddTraits(.startsMediaSession)
            .accessibilityIdentifier("lesson.explorer.bubble")
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
                        .frame(width: ageGroup.touchTarget, height: ageGroup.touchTarget)
                    }
                    .buttonStyle(.paperPress)
                    .accessibilityLabel(Text("lesson.listen"))
                    .accessibilityAddTraits(.startsMediaSession)
                    .accessibilityIdentifier("lesson.explorer.listen")
                    SecondVoiceButton(listen)
                }
            }
        }
    }
}

/// A repeating preset (`sway`, `nudge`) only while `active`; off, the view stands still.
struct LoopMotion: ViewModifier {
    let preset: Tokens.KeyframeAnimation
    let active: Bool

    func body(content: Content) -> some View {
        if active {
            content.motion(preset)
        } else {
            content
        }
    }
}

// MARK: - Header

/// Close and the question squares (Quiz-A): squares done are all gỉ đồng without a tick, so the
/// row never shows right or wrong (D1); the current one vàng hoè and bigger; no "Câu 4/6".
struct ExplorerTopBar: View {
    let count: Int
    let current: Int
    let closeLabel: LocalizedStringKey
    let session: LessonSession
    let onClose: () -> Void

    var body: some View {
        HStack(spacing: Tokens.Space.s12) {
            PaperIconButton(.close, accessibilityLabel: Text(closeLabel, bundle: .main), action: onClose)
                .accessibilityIdentifier("lesson.back")
            HStack(spacing: ExplorerMetrics.pipGap) {
                ForEach(0..<max(count, 0), id: \.self) { index in
                    let size = index == current ? ExplorerMetrics.pipCurrent : ExplorerMetrics.pip
                    RoundedRectangle(cornerRadius: Tokens.Radius.bar, style: .continuous)
                        .fill(fill(index))
                        .frame(width: size, height: size)
                        .paperDropShadow(Tokens.Shadow.paper2)
                }
            }
            .frame(maxWidth: .infinity)
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Text("lesson.quiz.progress_a11y \(current + 1) \(count)"))
            .accessibilityIdentifier("lesson.explorer.progress")
            SecondLanguageSwitch(session: session)
        }
    }

    private func fill(_ index: Int) -> Color {
        if index < current { return Tokens.Palette.giDong }
        if index == current { return Tokens.Role.stateCurrent }
        return Tokens.Role.surfaceInactive
    }
}

// MARK: - Next

/// Big đỏ son button across the width with only an arrow (A): to the next question, or to the
/// reward after the last. It nudges, the screen's one loop once the question is done.
struct ExplorerNextButton: View {
    let label: LocalizedStringKey
    let action: () -> Void
    @Environment(\.ageGroup) private var ageGroup

    var body: some View {
        TwoLayerButton(role: .primary, action: action) {
            // Discoverer A2 uses the same arrow-only button with a smaller arrow.
            PaperIconView(.arrowForward, size: ageGroup == .explorer ? ExplorerMetrics.nextIcon : DiscovererMetrics.arrowIcon, color: Tokens.Role.textOnAccent)
        }
        .accessibilityLabel(Text(label, bundle: .main))
        .accessibilityIdentifier("lesson.explorer.next")
        .motion(Tokens.Motion.Preset.nudge)
    }
}
