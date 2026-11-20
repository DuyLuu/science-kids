import AudioKit
import ContentModel
import DesignSystem
import LessonEngine
import Profiles
import SwiftUI

/// SK-059 "xem to" (canvas `x59-zoom`, `x59-zoom-in`, `x59-ipad`, `d59-zoom`): a shelf picture
/// big on a sheet of paper over a than tre veil (66 %). The whole photo (never cropped), its
/// name (Explorer "Cả hai": EN then VI; Discoverer: EN), a speaker and a close button the age
/// group's touch target. A tap on the veil closes; the sheet itself does not. A picked item
/// carries the đỏ son check seal on the sheet's corner. VoiceOver: a modal; focus on the
/// picture (its label is the name), then the speaker, then close; the escape gesture closes.
struct PlayZoomSheet: View {
    let item: TrayItem
    let picked: Bool
    let isExplorer: Bool
    let mode: LanguageMode
    let showsSecond: Bool
    let onListen: () -> Void
    let onClose: () -> Void
    @Environment(\.layoutMetrics) private var metrics
    @Environment(\.ageGroup) private var ageGroup
    @AccessibilityFocusState private var pictureFocused: Bool

    var body: some View {
        GeometryReader { proxy in
            let maxWidth = min(metrics.isRegular ? PlayZoomMetrics.pictureMaxWidthRegular : PlayZoomMetrics.pictureMaxWidth,
                               proxy.size.width - 2 * PlayZoomMetrics.sideInset)
            let maxHeight = min(metrics.isRegular ? PlayZoomMetrics.pictureMaxHeightRegular : PlayZoomMetrics.pictureMaxHeight,
                                proxy.size.height - 2 * ageGroup.touchTarget - PlayZoomMetrics.textAndGaps)
            ZStack {
                Tokens.Palette.thanTre.opacity(PlayZoomMetrics.veilOpacity)
                    .ignoresSafeArea()
                    .contentShape(Rectangle())
                    .onTapGesture(perform: onClose)
                    .accessibilityHidden(true)
                // The sheet, centred in the safe area; nothing under it (designer round 2).
                sheet(maxWidth: maxWidth, maxHeight: max(maxHeight, PlayZoomMetrics.pictureMinHeight))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                // Close: the screen's top right corner, level with the step's back button.
                PaperIconButton(.close, accessibilityLabel: Text("lesson.play.a11y.zoom_close"), action: onClose)
                    .accessibilityIdentifier("lesson.play.zoom.close")
                    .padding(.top, metrics.contentInsets.top)
                    .padding(.trailing, metrics.contentInsets.trailing + metrics.frameMinX)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            }
        }
        .accessibilityElement(children: .contain)
        .accessibilityAddTraits(.isModal)
        .accessibilityAction(.escape, onClose)
        .accessibilityIdentifier("lesson.play.zoom")
        .onAppear { pictureFocused = true }
    }

    private var radius: CGFloat { isExplorer ? Tokens.Radius.explorer : Tokens.Radius.discoverer }

    /// The picture, then the name (left) with the speaker 72 at its right, in the sheet.
    private func sheet(maxWidth: CGFloat, maxHeight: CGFloat) -> some View {
        let shape = RoundedRectangle(cornerRadius: radius, style: .continuous)
        return VStack(alignment: .leading, spacing: Tokens.Space.s10) {
            ContentPicture(image: item.image, color: nil, size: maxWidth, box: .whole(maxHeight: maxHeight))
                .frame(maxWidth: .infinity)
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(Text(verbatim: mode.sentence(item.label)))
                .accessibilityValue(picked ? Text("lesson.play.a11y.picked") : Text(verbatim: ""))
                .accessibilityAddTraits(.isImage)
                .accessibilityFocused($pictureFocused)
            HStack(alignment: .center, spacing: Tokens.Space.s10) {
                VStack(alignment: .leading, spacing: Tokens.Space.s2) {
                    Text(verbatim: mode.sentence(item.label))
                        .typography(isExplorer || metrics.isRegular ? Tokens.Typography.titleXl : Tokens.Typography.titleL)
                        .fixedSize(horizontal: false, vertical: true)
                    if showsSecond, mode.secondSentence(item.label) != mode.sentence(item.label) {
                        Text(verbatim: mode.secondSentence(item.label))
                            .typography(Tokens.Typography.sentence)
                            .foregroundStyle(Tokens.Role.textSecondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .accessibilityHidden(true)
                Button(action: onListen) {
                    ZStack {
                        Circle().fill(Tokens.Palette.giDong).paperDropShadow(Tokens.Shadow.paper2)
                        PaperIconView(.speaker, size: ExplorerMetrics.speakerGlyph, color: Tokens.Role.textOnAccent)
                    }
                    .frame(width: ageGroup.touchTarget, height: ageGroup.touchTarget)
                }
                .buttonStyle(.paperPress)
                .accessibilityLabel(Text("lesson.play.a11y.zoom_speaker"))
                .accessibilityAddTraits(.startsMediaSession)
                .accessibilityIdentifier("lesson.play.zoom.listen")
            }
            .padding(.horizontal, Tokens.Space.s4)
        }
        .padding(PlayZoomMetrics.sheetPadding)
        .frame(width: maxWidth + 2 * PlayZoomMetrics.sheetPadding)
        .background(shape.fill(Tokens.Role.surfacePaper))
        .paperDropShadow(Tokens.Shadow.paper2)
        .background {
            // The layer under the sheet: gỉ đồng (Explorer) / nâu đất (Discoverer), (6, 8), 1.6°.
            shape.fill(isExplorer ? Tokens.Palette.giDong : Tokens.Palette.nauDat)
                .offset(x: PlayZoomMetrics.layerOffset.width, y: PlayZoomMetrics.layerOffset.height)
                .rotationEffect(.degrees(PlayZoomMetrics.layerTilt))
                .accessibilityHidden(true)
        }
        .overlay(alignment: .topTrailing) {
            // `x59-zoom-in`: the seal leans out of the corner when the item is already picked.
            if picked {
                Seal(icon: .check, size: .goal)
                    .rotationEffect(.degrees(PlayZoomMetrics.sealTilt))
                    .offset(x: PlayZoomMetrics.sealOutset.width, y: PlayZoomMetrics.sealOutset.height)
                    .accessibilityHidden(true)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {}  // a tap on the sheet does not close it
    }
}

/// Canvas numbers of the big view (designer 19/11).
enum PlayZoomMetrics {
    static let pictureMaxWidth: CGFloat = 330
    static let pictureMaxHeight: CGFloat = 460
    static let pictureMaxWidthRegular: CGFloat = 520
    static let pictureMaxHeightRegular: CGFloat = 640
    static let pictureMinHeight: CGFloat = 160
    /// Room for the name row, the gaps and the sheet's padding under the picture.
    static let textAndGaps: CGFloat = 120
    static let sideInset: CGFloat = 20
    static let sheetPadding: CGFloat = 10
    static let veilOpacity: Double = 0.66
    static let layerOffset = CGSize(width: 6, height: 8)
    static let layerTilt: Double = 1.6
    static let sealTilt: Double = -8
    static let sealOutset = CGSize(width: 9, height: -10)
}

/// The mascot's hint lines (content-editor 19/11, string catalog `lesson.play.hint.*`). They are
/// app lines, not lesson text, but follow the profile's language mode like the lesson's
/// messages, so both languages are read from their own `.lproj`, whatever the device language.
enum PlayHintText {
    static func key(_ line: PlayHintState.Line, explorer: Bool) -> String {
        "lesson.play.hint.\(line == .first ? "first" : "again").\(explorer ? "explorer" : "discoverer")"
    }

    static func spoken(_ line: PlayHintState.Line, explorer: Bool, bundle: Bundle = .main) -> Spoken {
        let key = key(line, explorer: explorer)
        // SK-059 (dev 19/11): the clips of `ui-voice/`, by the same key; none: printed only.
        let voice = UIVoiceCatalog.main
        let audio = SpokenAudio(en: voice?.hash(for: key, language: "en"), vi: voice?.hash(for: key, language: "vi"))
        return Spoken(en: text(key, language: "en", bundle: bundle), vi: text(key, language: "vi", bundle: bundle), audio: audio)
    }

    static func text(_ key: String, language: String, bundle: Bundle = .main) -> String {
        guard let path = bundle.path(forResource: language, ofType: "lproj"), let localized = Bundle(path: path) else {
            return bundle.localizedString(forKey: key, value: nil, table: nil)
        }
        return localized.localizedString(forKey: key, value: nil, table: nil)
    }

    /// The hint's voice in the profile's `voice_mode` (EN → VI for "Cả hai"), from the app-line
    /// clips; a build without `ui-voice/` has none and the bubble's speaker hides.
    @MainActor static func utterance(_ line: PlayHintState.Line, explorer: Bool, session: LessonSession) -> Utterance {
        session.utterance("play.hint.\(key(line, explorer: explorer))", spoken(line, explorer: explorer))
    }
}

/// The hint's hand (`ArtHintHand`, 68 × 89, iPad × 1.33; its fingertip at 26, 5; shadow baked
/// in): it taps the first shelf picture, then holds it and drags it to the tray, twice, then
/// fades (designer timings); the only repeating motion of the screen. Reduce Motion: still, on
/// the picture, with its tap ring.
struct PlayHintHand: View {
    let from: CGPoint
    let to: CGPoint
    let reduced: Bool
    let onDone: () -> Void
    @Environment(\.layoutMetrics) private var metrics
    @State private var position: CGPoint?
    @State private var pressed = false
    @State private var visible = true
    /// The step the hand shows (designer `x59-hint`): 1 = tap to see it big, 2 = hold and drag.
    @State private var step = 1

    private var scale: CGFloat { metrics.isRegular ? PlayHintMetrics.regularScale : 1 }

    var body: some View {
        let point = position ?? from
        let size = CGSize(width: PlayHintMetrics.hand.width * scale, height: PlayHintMetrics.hand.height * scale)
        ZStack {
            Circle()
                .fill(Tokens.Palette.vangHoe.opacity(PlayHintMetrics.ringOpacity))
                .frame(width: PlayHintMetrics.ring, height: PlayHintMetrics.ring)
                .scaleEffect(pressed || reduced ? 1 : 0.5)
                .opacity(pressed || reduced ? 1 : 0)
                .position(point)
            Image("ArtHintHand", bundle: .main)
                .resizable()
                .frame(width: size.width, height: size.height)
                .position(
                    x: point.x - PlayHintMetrics.fingertip.x * scale + size.width / 2,
                    y: point.y - PlayHintMetrics.fingertip.y * scale + size.height / 2
                )
            // The step's number on a than tre seal, beside the fingertip.
            Text(verbatim: "\(step)")
                .typography(Tokens.Typography.label, fixedBox: true)
                .foregroundStyle(Tokens.Role.textOnAccent)
                .frame(width: PlayHintMetrics.numberSeal, height: PlayHintMetrics.numberSeal)
                .background(RoundedRectangle(cornerRadius: Tokens.Radius.tag, style: .continuous).fill(Tokens.Palette.thanTre))
                .rotationEffect(.degrees(PlayHintMetrics.numberTilt))
                .position(x: point.x + PlayHintMetrics.numberOffset.width * scale, y: point.y + PlayHintMetrics.numberOffset.height * scale)
        }
        .opacity(visible ? 1 : 0)
        .task { await run() }
    }

    private func run() async {
        if reduced {
            step = 1
            try? await Task.sleep(for: .seconds(PlayHintMetrics.stillSeconds))
            onDone()
            return
        }
        for _ in 0..<PlayHintMetrics.rounds {
            position = from
            step = 1
            try? await Task.sleep(for: .milliseconds(400))
            withAnimation(.easeOut(duration: 0.15)) { pressed = true }
            try? await Task.sleep(for: .milliseconds(450))
            withAnimation(.easeIn(duration: 0.15)) { pressed = false }
            try? await Task.sleep(for: .milliseconds(350))
            step = 2
            withAnimation(.easeOut(duration: 0.3)) { pressed = true }
            try? await Task.sleep(for: .milliseconds(300))
            withAnimation(.easeInOut(duration: 1.0)) { position = to }
            try? await Task.sleep(for: .milliseconds(1000))
            withAnimation(.easeOut(duration: 0.4)) { pressed = false }
            try? await Task.sleep(for: .milliseconds(500))
            if Task.isCancelled { return }
        }
        withAnimation(.easeOut(duration: 0.3)) { visible = false }
        try? await Task.sleep(for: .milliseconds(300))
        onDone()
    }
}

enum PlayHintMetrics {
    static let hand = CGSize(width: 68, height: 89)
    static let fingertip = CGPoint(x: 26, y: 5)
    static let regularScale: CGFloat = 1.33
    static let ring: CGFloat = 56
    static let ringOpacity: Double = 0.55
    static let rounds = 2
    static let stillSeconds: Double = 6
    /// Than tre seal with the step's number (`30`), above right of the fingertip.
    static let numberSeal: CGFloat = 30
    static let numberOffset = CGSize(width: 34, height: -26)
    static let numberTilt: Double = -6
}
