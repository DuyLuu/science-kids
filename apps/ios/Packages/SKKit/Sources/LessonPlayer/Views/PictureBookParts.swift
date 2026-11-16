import ContentModel
import DesignSystem
import Profiles
import SwiftUI

// SK-043 · hướng A "Sách tranh" (Duy 13/11): one idea per screen, big pictures, text only as a
// subtitle with a speaker. Design: design/play-ui/options/lesson-less-text/A-final.html. Shared
// pieces; the Explorer screens use them first (test topic *Gọi tên và nhóm động vật*),
// Discoverer follows in a later round.

/// Canvas sizes of the picture-book screens with no token.
enum PictureBookMetrics {
    /// Explorer · Học: the page picture (`322 × 380`, the only part that grows or shrinks).
    static let pagePictureMax: CGFloat = 380
    /// Discoverer A2 · Học (`learn-2`): the picture up to `440` (the sentence is under it).
    static let pagePictureMaxDiscoverer: CGFloat = 440
    /// Discoverer A2 · Từ mới (`learn-words`): the word's picture (`150 × 124`).
    static let wordPicture: CGFloat = 104
    static let pagePictureMin: CGFloat = 180
    /// Explorer · Chơi: a shelf cell (`110 × 96`), three columns; iPad four columns of `124`.
    static let shelfPicture: CGFloat = 96
    static let shelfColumns = 3
    static let shelfPictureRegular: CGFloat = 124
    static let shelfColumnsRegular = 4
    /// Explorer · Chơi: the group chips (`height: 40px`, dot `16`).
    static let chipHeight: CGFloat = 40
    static let chipDot: CGFloat = 16
    /// Explorer order: the number tag on a filled place (`24 × 24`).
    static let orderTag: CGFloat = 24
    /// Page dots (`10 × 10`, current `22 × 10`).
    static let pageDot: CGFloat = 10
    static let pageDotCurrent: CGFloat = 22
}

/// Explorer header (SK-043 Explorer-A, "header bước giữ như SK-040"): back and the four step
/// squares, no title (the child does not read it; the voice says what to do).
///
/// Discoverer A2 (SK-043, Duy 14/11): the same header, without the "VI" switch ("Cả hai" prints
/// English only; Vietnamese is on the speakers' "VI" button).
struct ExplorerStepHeader: View {
    let session: LessonSession
    let backLabel: Text
    let onBack: () -> Void
    @Environment(\.ageGroup) private var ageGroup

    var body: some View {
        HStack(spacing: Tokens.Space.s12) {
            PaperIconButton(.arrowBack, accessibilityLabel: backLabel, action: onBack)
                .accessibilityIdentifier("lesson.back")
            StepSquaresPlain(current: session.phaseIndex)
                .frame(maxWidth: .infinity)
            if session.isExplorer {
                SecondLanguageSwitch(session: session)
            }
            Color.clear.frame(width: ageGroup.touchTarget, height: 1)
        }
    }
}

/// The four steps as packed squares, no names (Explorer).
struct StepSquaresPlain: View {
    let current: Int
    private static let labels: [LocalizedStringKey] = ["lesson.step.warmup", "lesson.step.learn", "lesson.step.play", "lesson.step.quiz"]

    var body: some View {
        ProgressSquares(
            count: Self.labels.count, current: current,
            accessibilityLabel: Text("lesson.step_a11y \(current + 1) \(Self.labels.count) \(Text(Self.labels[min(current, Self.labels.count - 1)]))")
        )
        .accessibilityIdentifier("lesson.steps")
    }
}

/// The page bar of the picture book: one small piece per page in its colour, the current one long.
struct PageBar: View {
    let colors: [Color]
    let current: Int

    var body: some View {
        HStack(spacing: Tokens.Space.s6) {
            ForEach(colors.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: Tokens.Radius.bar, style: .continuous)
                    .fill(index <= current ? colors[index] : Tokens.Role.surfaceInactive)
                    .frame(width: index == current ? PictureBookMetrics.pageDotCurrent : PictureBookMetrics.pageDot, height: PictureBookMetrics.pageDot)
            }
            Text(verbatim: "\(current + 1)/\(colors.count)")
                .typography(Tokens.Typography.captionS, fixedBox: true)
                .foregroundStyle(Tokens.Role.textSecondary)
                .padding(.leading, Tokens.Space.s4)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("lesson.learn.page_a11y \(current + 1) \(colors.count)"))
        .accessibilityIdentifier("lesson.learn.page")
    }
}

/// The mascot saying an app line (string catalog, no clip yet): the bubble only.
struct ExplorerAppLineRow: View {
    let line: LocalizedStringKey

    var body: some View {
        HStack(alignment: .center, spacing: Tokens.Space.s8) {
            Image(ExplorerMood.talk.imageName, bundle: .main)
                .resizable()
                .scaledToFit()
                .frame(width: ExplorerMetrics.mascot, height: ExplorerMetrics.mascot)
                .paperDropShadow(Tokens.Shadow.dropTag)
                .accessibilityHidden(true)
            Text(line)
                .typography(Tokens.Typography.itemTitle)
                .fixedSize(horizontal: false, vertical: true)
                .padding(EdgeInsets(top: Tokens.Space.s12, leading: Tokens.Space.s14, bottom: Tokens.Space.s12, trailing: Tokens.Space.s14))
                .frame(maxWidth: .infinity, minHeight: ExplorerMetrics.bubbleMinHeight, alignment: .leading)
                .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, in: UnevenRoundedRectangle(
                    topLeadingRadius: Tokens.Radius.explorer, bottomLeadingRadius: Tokens.Radius.bubbleTail,
                    bottomTrailingRadius: Tokens.Radius.explorer, topTrailingRadius: Tokens.Radius.explorer, style: .continuous
                ))
        }
    }
}
