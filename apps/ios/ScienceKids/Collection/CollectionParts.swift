import ContentKit
import ContentModel
import DesignSystem
import LessonPlayer
import Profiles
import SwiftUI
import UIKit

/// Canvas sizes of the SK-035 tabs that have no design token (file and element on each line), so
/// the views write no raw numbers. Candidates for tokens are listed in SK-035 "ios-dev 10/11".
enum CollectionMetrics {
    // MARK: Shared

    /// Gap between the blocks of a tab (Cards `gap: 12px`, Words `14px`, Badges `10px`).
    static let pageGap: CGFloat = Tokens.Space.s12
    /// Count chip on the right of a tab's title (`height: 40px; padding: 0 11px 0 9px; gap: 5px`).
    static let chipHeight: CGFloat = 40
    static let chipPaddingLeading: CGFloat = 9
    static let chipPaddingTrailing: CGFloat = 11
    static let chipGap: CGFloat = 5
    static let chipIcon: CGFloat = 20
    /// The content of a tab in the iPad content column: as wide as the paper frame, centred
    /// (B7.10), like the journey map.
    static let columnMaxWidth: CGFloat = Tokens.Layout.paperFrameMax

    // MARK: Bộ thẻ (Discoverer-Cards)

    /// Card grid (`repeat(3, 1fr); gap: 10px 12px`); four columns from this content width on
    /// (the iPad column in landscape, B7.10: 3–4 columns).
    static let cardColumnGap: CGFloat = Tokens.Space.s12
    static let cardRowGap: CGFloat = Tokens.Space.s10
    static let cardWideFrom: CGFloat = 480
    /// A card in the grid (`height: 136px`), its picture well (`height: 72px`), padding
    /// (`7px 7px 9px`), its chàm backing (`left/right: -3px; top: -2px; bottom: -5px`, ±1.6°).
    static let cardTileHeight: CGFloat = 136
    static let cardTileArt: CGFloat = 72
    static let cardTilePadding = EdgeInsets(top: 7, leading: 7, bottom: 9, trailing: 7)
    static let cardBackingInsets = EdgeInsets(top: -2, leading: -3, bottom: -5, trailing: -3)
    static let cardTilt: Angle = .degrees(1.6)
    /// The "+N" card: its backing turned 4° (`left: 4px; right: -2px; top: 4px; bottom: -3px`).
    static let moreBackingInsets = EdgeInsets(top: 4, leading: 4, bottom: -3, trailing: -2)
    static let moreTilt: Angle = .degrees(4)
    /// The open card (dialog): `300 × 400`, padding 16 (front) and 20 (back), picture `196`,
    /// round picture on the back `84`; chàm backing (`-8px -6px -5px -9px`, 1.6°). In regular
    /// width a quarter bigger.
    static let detailCardSize = CGSize(width: 300, height: 400)
    static let detailRegularScale: CGFloat = 1.25
    static let detailFrontPadding: CGFloat = Tokens.Space.s16
    static let detailBackPadding: CGFloat = Tokens.Space.s20
    static let detailArt: CGFloat = 196
    static let detailBackArt: CGFloat = 84
    /// The picture inside those wells (the canvas art: `166` in the 196 well, `64` in the 84 disc).
    static let detailArtPicture: CGFloat = 166
    static let detailBackArtPicture: CGFloat = 64
    static let detailBackingInsets = EdgeInsets(top: -5, leading: -8, bottom: -9, trailing: -6)
    static let detailGap: CGFloat = 26

    // MARK: Từ vựng (Discoverer-Words)

    /// The flashcard (`330 × 320`, at `left: 10px; top: 8px` of a `344` stack), its paper layers
    /// (`rotate(4deg)`, `rotate(-3deg)`), its picture well (`136`), padding `26px 18px`.
    static let wordCardHeight: CGFloat = 320
    static let wordCardInset: CGFloat = Tokens.Space.s10
    static let wordLayerTilts: (Angle, Angle) = (.degrees(4), .degrees(-3))
    static let wordArt: CGFloat = 136
    static let wordFrontPadding = EdgeInsets(top: 26, leading: 18, bottom: 26, trailing: 18)
    static let wordBackPadding = EdgeInsets(top: 22, leading: 20, bottom: 20, trailing: 20)
    /// The example box on the back (`min-height: 76px; padding: 12px 74px 12px 14px`).
    static let exampleMinHeight: CGFloat = 76
    static let examplePadding = EdgeInsets(top: 12, leading: 14, bottom: 12, trailing: 14)
    /// The English word on the front (canvas Phudu 40/900) and its meaning on the back (30/900),
    /// set in Be Vietnam Pro 700 at the `title_xl` and `title_l` sizes: Phudu has capitals only,
    /// and a child learning a word must see how it is spelt ("fern", not "FERN").
    static let wordTypography = textTypography(like: Tokens.Typography.titleXl)
    static let meaningTypography = textTypography(like: Tokens.Typography.titleL)
    /// Progress segments (`height: 12px; gap: 6px`).
    static let segmentHeight: CGFloat = 12
    static let segmentGap: CGFloat = Tokens.Space.s6
    /// A deck on the list: `min-height` of the row, its number tile.
    static let deckRowPadding = EdgeInsets(top: Tokens.Space.s10, leading: Tokens.Space.s12, bottom: Tokens.Space.s10, trailing: Tokens.Space.s10)

    // MARK: Huy hiệu (Discoverer-Badges)

    /// Streak card (`padding: 12px 14px 14px; gap: 10px`), a day square (`36 × 36`, glyph 20),
    /// its tilts (−2°, 1.5°, −1°, 2°, −1.5°, 1°, −2°), the strip's gap (`gap: 4px`).
    static let dayGlyph: CGFloat = 20
    static let daySquare: CGFloat = 36
    static let dayTilts: [Double] = [-2, 1.5, -1, 2, -1.5, 1, -2]
    static let dayGap: CGFloat = Tokens.Space.s4
    /// The dash of a day missed (no canvas: tester 10/11 #7), 16 × 3.
    static let dayMissedMark = CGSize(width: 16, height: 3)
    static let flameIcon: CGFloat = 22
    /// A badge (`68 × 68`): ring from r 27 to 33 of 34, centre disc r 22 (23 when not started),
    /// "x/n" slip at `right: -7px; bottom: 0`; grid `repeat(3, 1fr); gap: 8px 6px`.
    static let badgeSize: CGFloat = 68
    static let badgeRingInner: CGFloat = 27 / 34
    static let badgeCentre: CGFloat = 22 / 34
    static let badgeIcon: CGFloat = 26
    static let badgeRingGap: Angle = .degrees(6)
    static let badgeSlipOffset = CGSize(width: 7, height: 0)
    static let badgeRowGap: CGFloat = Tokens.Space.s8
    static let badgeColumnGap: CGFloat = Tokens.Space.s6
    /// The selected badge: vàng hoè offset under its disc (`box-shadow: 4px 5px 0 vàng hoè`).
    static let badgeSelectedOffset = CGSize(width: 4, height: 5)
    /// The caption of the badge chosen (`padding: 10px 14px; gap: 3px`), its text under the dot
    /// (`padding-left: 15px`).
    static let captionPadding = EdgeInsets(top: Tokens.Space.s10, leading: Tokens.Space.s14, bottom: Tokens.Space.s10, trailing: Tokens.Space.s14)
    static let captionIndent: CGFloat = 15
    static let dot: CGFloat = 7

    /// Be Vietnam Pro 700 at the size and line height of a display role.
    private static func textTypography(like display: Tokens.Typography) -> Tokens.Typography {
        Tokens.Typography(
            family: Tokens.FontFamily.text, size: display.size, weight: Tokens.FontWeight.textBold,
            lineHeight: display.lineHeight, letterSpacing: 0, textCase: nil
        )
    }
}

// MARK: - Header

/// Title of a tab, its caption and a count chip on the right (canvas Cards, Words, Badges).
struct CollectionHeader<Chip: View>: View {
    let title: Text
    let caption: Text?
    let identifier: String
    @ViewBuilder let chip: Chip

    var body: some View {
        HStack(alignment: .center, spacing: Tokens.Space.s12) {
            VStack(alignment: .leading, spacing: Tokens.Space.s2) {
                title
                    .typography(Tokens.Typography.titleL)
                    .fixedSize(horizontal: false, vertical: true)
                    .accessibilityAddTraits(.isHeader)
                    .accessibilityIdentifier(identifier)
                if let caption {
                    caption
                        .typography(Tokens.Typography.caption)
                        .foregroundStyle(Tokens.Role.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            chip
        }
    }
}

/// A count on a paper slip ("3/12 thẻ", "128 sao"): an icon, the number, a word. Not a button;
/// VoiceOver reads `label`.
struct CountChip<Icon: View>: View {
    let value: String
    let unit: Text
    let label: Text
    let identifier: String
    @ViewBuilder let icon: Icon

    var body: some View {
        HStack(spacing: CollectionMetrics.chipGap) {
            icon
            Text(verbatim: value)
                .typography(Tokens.Typography.buttonS, fixedBox: true)
            unit
                .typography(Tokens.Typography.caption, fixedBox: true)
                .foregroundStyle(Tokens.Role.textSecondary)
        }
        .lineLimit(1)
        .padding(.leading, CollectionMetrics.chipPaddingLeading)
        .padding(.trailing, CollectionMetrics.chipPaddingTrailing)
        .frame(minHeight: CollectionMetrics.chipHeight)
        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.tag)
        .fixedSize()
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(label)
        .accessibilityIdentifier(identifier)
    }
}

// MARK: - Empty tab

/// A tab with nothing yet (no lesson done): what it will hold and the first lesson to play.
struct InviteCard: View {
    let app: AppModel
    let profile: ChildProfile
    let message: LocalizedStringKey

    var body: some View {
        PaperCard {
            VStack(alignment: .leading, spacing: Tokens.Space.s12) {
                PaperTag(Text("collection.empty.tag"), style: .cut(eyebrow: true))
                Text(message)
                    .typography(Tokens.Typography.body)
                    .fixedSize(horizontal: false, vertical: true)
                if let first = app.firstLesson(for: profile) {
                    TwoLayerButton("collection.empty.start", icon: .arrowForward) {
                        app.openLesson(topicID: first.topicID, lessonID: first.lessonID)
                    }
                    .accessibilityIdentifier("collection.empty.start")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("collection.empty")
    }
}

// MARK: - Page

/// A tab on the phone (and in Split View 1/3, Slide Over): the paper frame, scrolling.
struct CollectionPage<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        PaperFrame(scrolls: true) {
            content
        }
        // SK-060 (finding 4): scrolled to its end, the last item stops `s16` above the tab strip's
        // torn edge and shadow. The strip's `safeAreaInset` (HomeScreen) already lifts the scroll
        // content by `PaperMetrics.navStripHeight`, so only the gap is added here.
        .contentMargins(.bottom, Tokens.Space.s16, for: .scrollContent)
    }
}

extension View {
    /// A tab's content in the iPad content column: at most the paper frame's width, centred.
    func collectionColumn() -> some View {
        frame(maxWidth: CollectionMetrics.columnMaxWidth).frame(maxWidth: .infinity)
    }

    /// Lays `content` out unseen at this view's width, at its ideal height, and writes that height
    /// into `height`: the two sides of a flipping card take the taller side's height, so the
    /// spacers inside them spread at any text size (Dynamic Type up to its cap).
    func readingHeight<C: View>(of content: C, into height: Binding<CGFloat>) -> some View {
        overlay(alignment: .top) {
            content
                .fixedSize(horizontal: false, vertical: true)
                .hidden()
                .allowsHitTesting(false)
                .accessibilityHidden(true)
                .onGeometryChange(for: CGFloat.self) { proxy in
                    proxy.size.height
                } action: { newHeight in
                    height.wrappedValue = newHeight
                }
        }
    }
}

// MARK: - Speech

/// Content words inside an interface sentence, for VoiceOver (content-editor 10/11): an English
/// word in a Vietnamese label ("Thẻ từ reptile…") is marked English, so the Vietnamese voice does
/// not read it as Vietnamese.
///
/// SwiftUI has no attribute for it, so the text carries UIKit's speech language key
/// (`UIAccessibilitySpeechAttributeLanguage`) and Foundation's language identifier. Not heard with
/// VoiceOver yet (the simulator has none): if the voice ignores them, the label reads as before.
enum SpeechText {
    static func marked(_ text: String, _ language: ContentLanguage) -> AttributedString {
        var marked = AttributedString(text)
        let identifier = language == .en ? "en-US" : "vi-VN"
        marked[SpeechLanguageKey.self] = identifier
        marked.languageIdentifier = identifier
        return marked
    }

    /// A content sentence as the screen shows it (`language_mode`): its first line, then the other
    /// language unless Tiếng Anh trước hides it; each part in its own language.
    static func lines(_ spoken: Spoken, mode: LanguageMode) -> Text {
        let first = Text(marked(mode.sentence(spoken), mode.sentenceLanguage))
        guard !mode.hidesSentenceSecondLanguage else { return first }
        return first + Text(verbatim: " ") + Text(marked(mode.secondSentence(spoken), mode.sentenceSecondLanguage))
    }
}

/// UIKit's `accessibilitySpeechLanguage` attribute as an `AttributedString` key.
private enum SpeechLanguageKey: AttributedStringKey {
    typealias Value = String
    static var name: String { NSAttributedString.Key.accessibilitySpeechLanguage.rawValue }
}

// MARK: - Strands

/// The strands of the syllabus as the Huy hiệu tab names them: a big question per strand (canvas
/// "Câu hỏi lớn"; SK-035 drafts, content-editor reviews) and the strand's name
/// (syllabus-progression.md section 4).
enum StrandText {
    static func question(_ strand: Topic.Strand) -> LocalizedStringKey {
        switch strand {
        case .plantsAnimals: "strand.plants_animals.question"
        case .livingEnvironment: "strand.living_environment.question"
        case .humansHealth: "strand.humans_health.question"
        case .materials: "strand.materials.question"
        case .energyForces: "strand.energy_forces.question"
        case .earthSky: "strand.earth_sky.question"
        default: "strand.other.question"
        }
    }

    static func name(_ strand: Topic.Strand) -> LocalizedStringKey {
        switch strand {
        case .plantsAnimals: "strand.plants_animals.name"
        case .livingEnvironment: "strand.living_environment.name"
        case .humansHealth: "strand.humans_health.name"
        case .materials: "strand.materials.name"
        case .energyForces: "strand.energy_forces.name"
        case .earthSky: "strand.earth_sky.name"
        default: "strand.other.name"
        }
    }
}
