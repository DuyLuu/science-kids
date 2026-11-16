import AudioKit
import ContentModel
import DesignSystem
import Profiles
import SwiftUI
import UIKit

/// Canvas sizes of Tổng kết with no token (SK-047, `Quiz-Dot1.html`, the `?shot=` id on each line).
enum RecapMetrics {
    /// `r-d1-a`: the key point picture (`136`, the 1 : 1 `learn_group` crop), at most 4 lines beside it.
    static let keyPointPicture: CGFloat = 136
    static let keyPointLines = 4
    /// `r-x1-a`: Explorer key point cards (`168`, two on top, one under them).
    static let explorerKeyPoint: CGFloat = 168
    /// `r-d2-a`: Na's face with the gỉ đồng arrows of the shake / nod around it (`img/na-shake.svg`,
    /// a 120 box with the face at 24, 25, 72 wide), drawn `72`; the round arrow between the two
    /// parts (`30`).
    static let face: CGFloat = 72
    static let joint: CGFloat = 30
    static let jointIcon: CGFloat = 18
    /// Designer 15/11 "rà bản dựng iOS" (`r-d2-a`, `r-d2-a-nod-bi`): the claim part (padding 8 top,
    /// 6 leading, 14 bottom, 76 trailing; face → claim 10), the truth part (18 top, 14 leading,
    /// 12 bottom, 14 trailing; "Cả hai": 80 trailing, at least 58 high), the speaker column pinned
    /// on the seam (its speaker ends 2 above it, the VI starts 2 under it), 10 from the right edge;
    /// the round arrow 27 from the left edge (under the face's centre).
    static let claimPadding = EdgeInsets(top: 8, leading: 6, bottom: 14, trailing: 76)
    static let claimGap: CGFloat = 10
    static let truthPadding = EdgeInsets(top: 18, leading: 14, bottom: 12, trailing: 14)
    static let truthTrailingWithVI: CGFloat = 80
    static let truthMinHeightWithVI: CGFloat = 58
    static let seamGap: CGFloat = 2
    static let jointLeading: CGFloat = 27
    /// Tổng kết page 2: between its blocks (`layout.section_gap`), the tag and the words (`10`).
    static let pageGap: CGFloat = Tokens.Layout.sectionGap
    /// Word cells: as many columns as words (2–4), gap `10`, padding `6`. Discoverer picture 3 : 4
    /// of the cell's inner width, at most `80`; Explorer `72` high, cells `18` round, pictures `12`.
    static let wordColumnsMax = 4
    static let wordGap: CGFloat = 10
    static let wordPadding: CGFloat = 6
    static let wordPictureMax: CGFloat = 80
    static let explorerWordPicture: CGFloat = 72
    static let explorerWordRadius: CGFloat = 18
    static let explorerWordPictureRadius: CGFloat = 12
    /// `r-x2-a`: the question's photo (`120` high, radius `14`), the shake on its bottom-left corner
    /// (`64`, inset `10`), the speaker (and "Cả hai" VI) on its bottom-right corner (inset `8`);
    /// the two lines under it (padding 10 / 10 / 8). `r-x2-none`: word rows (`140 × 92`).
    static let explorerPhoto: CGFloat = 120
    static let explorerPhotoRadius: CGFloat = 14
    static let explorerShake: CGFloat = 64
    static let explorerShakeInset: CGFloat = 10
    static let explorerControlsInset: CGFloat = 8
    static let explorerLinesPadding = EdgeInsets(top: 10, leading: 10, bottom: 8, trailing: 10)
    static let explorerWordRowPicture = CGSize(width: 140, height: 92)
    /// "I can…": Discoverer padding 10 / 14 / 10 / 10, "Cả hai" 8 top and 4 bottom (the VI's
    /// touch frame already has room under its chip); Explorer 10 / 14 / 10 / 10.
    static let goalPadding = EdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 10)
    static let goalPaddingWithVI = EdgeInsets(top: 8, leading: 14, bottom: 4, trailing: 10)
    /// The card being read lifts (`−4`) on its vàng hoè layer, `220 ms`.
    static let lift: CGFloat = 4
    static let liftDuration: TimeInterval = 0.22
}

/// Tổng kết (SK-047; Duy 15/11: phương án A for Discoverer `r-d1-a`, `r-d2-a`, `r-d2-a-nod` and
/// Explorer `r-x1-a`, `r-x2-a`, `r-x2-none`). Two pages after the last quiz question; the attempt
/// is already scored and saved (`LessonSession.advance`), nothing here is scored.
///
/// - Page 1 "Em đã học": the three key points as cards with a picture of the Học groups. They
///   read themselves one after the other; the card being read lifts on vàng hoè (Reduce Motion:
///   the layer only). A card's speaker (Explorer: a tap on its picture) reads that one again.
/// - Page 2 "Nhớ nhé": the "Ý sai → Ý đúng" card (Na wrong, Na right; Explorer only when the
///   claim is false), the new words (a tap says the word), the objective with its seal. The
///   card, then the objective, read themselves.
/// - The arrow goes on at any time and the voice stops; two taps reach the reward. No title is
///   printed (only for VoiceOver); nothing reads by itself under VoiceOver.
struct RecapStep: View {
    let session: LessonSession
    let onClose: () -> Void

    private let recap: LessonRecap
    @State private var page = 0
    @State private var forward = true
    /// What the page still reads by itself, in order; the first one is playing.
    @State private var reading: [Utterance] = []
    /// Explorer page 1: the key point in the mascot's bubble.
    @State private var selected = 0
    @ReducedMotion private var reduced
    @Environment(\.speechPlayer) private var speech
    @Environment(\.layoutMetrics) private var metrics
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    init(session: LessonSession, onClose: @escaping () -> Void) {
        self.session = session
        self.onClose = onClose
        recap = session.recap
    }

    private var mode: LanguageMode { session.languageMode }
    private var isExplorer: Bool { session.isExplorer }
    private var radius: CGFloat { isExplorer ? Tokens.Radius.explorer : Tokens.Radius.discoverer }

    var body: some View {
        PaperFrame(scrolls: true) {
            VStack(alignment: .leading, spacing: LessonMetrics.gap) {
                RecapHeader(title: page == 0 ? "lesson.recap.learned_a11y" : "lesson.recap.remember_a11y", onClose: onClose)
                    .reveal(order: 0)
                Group {
                    if page == 0 {
                        if isExplorer { explorerFirstPage } else { firstPage }
                    } else {
                        if isExplorer { explorerSecondPage } else { secondPage }
                    }
                }
                .id(page)
                .transition(transition)
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) { bottom }
        // The step opened with the first key point (`autoplayUtterance(for: .recap)`); the rest follow.
        .onAppear { reading = session.recapFirstPageReading }
        .onChange(of: speech?.speaking) { _, now in follow(now) }
    }

    private var transition: AnyTransition {
        if reduced { return .opacity }
        return .asymmetric(
            insertion: .move(edge: forward ? .trailing : .leading).combined(with: .opacity),
            removal: .move(edge: forward ? .leading : .trailing).combined(with: .opacity)
        )
    }

    // MARK: Reading

    /// Whether `id` is being said (its first voice or, in "Cả hai", its VI button).
    private func isReading(_ id: String) -> Bool {
        speech?.speaking.map { Self.says($0, id) } ?? false
    }

    /// The utterance playing (`speaking`) is `id`, in its first voice or its "VI" button's.
    static func says(_ speaking: String, _ id: String) -> Bool {
        speaking == id || speaking == id + ".second"
    }

    /// The page's own reading goes on when one line has played to its end; a tap on another
    /// speaker, the arrow or leaving stops it.
    private func follow(_ now: String?) {
        if let now, let index = recap.keyPoints.indices.first(where: { Self.says(now, session.recapKeyPointUtterance($0).id) }) {
            selected = index
        }
        guard let current = reading.first else { return }
        if now == current.id { return }
        if now == nil, speech?.stats.finished.last == current.id {
            reading.removeFirst()
            if let next = reading.first { speech?.autoplay(next) }
        } else {
            reading = []
        }
    }

    private func turn(to next: Int) {
        forward = next > page
        withAnimation(MotionPolicy.animation(.easeInOut(duration: Tokens.Motion.Preset.slide.duration), reduced: reduced)) {
            page = next
        }
        reading = next == 0 ? session.recapFirstPageReading : session.recapSecondPageReading
        if let first = reading.first {
            speech?.autoplay(first)
        } else {
            speech?.stop()
        }
    }

    // MARK: Discoverer · page 1 (`r-d1-a`)

    private var firstPage: some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s14) {
            ForEach(Array(recap.keyPoints.enumerated()), id: \.offset) { index, point in
                keyPointCard(index, point)
                    .reveal(order: 1 + index)
            }
        }
        .padding(.trailing, metrics.gridTrailingInset)
    }

    private func keyPointCard(_ index: Int, _ point: LessonRecap.KeyPoint) -> some View {
        let say = session.recapKeyPointUtterance(index)
        let side = metrics.illustration(RecapMetrics.keyPointPicture)
        return HStack(alignment: .top, spacing: Tokens.Space.s10) {
            ContentPicture(image: point.image, color: nil, size: side, box: .fillWidth)
                .frame(width: side, height: side)
                .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.discoverer - Tokens.Space.s2, style: .continuous))
            VStack(alignment: .leading, spacing: Tokens.Space.s8) {
                Text(verbatim: mode.sentence(point.text))
                    .typography(Tokens.Typography.itemTitle)
                    .lineLimit(RecapMetrics.keyPointLines)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .accessibilityIdentifier("lesson.recap.key_point.\(index + 1)")
                Spacer(minLength: 0)
                HStack(spacing: Tokens.Space.s8) {
                    Spacer(minLength: 0)
                    SecondVoiceButton(say)
                    RecapSpeaker(utterance: say, label: "lesson.listen.key_point", speaking: isReading(say.id))
                }
            }
            .frame(minHeight: side)
        }
        .padding(Tokens.Space.s8)
        .modifier(RecapPaper(lifted: isReading(say.id), radius: radius))
        .accessibilityElement(children: .contain)
        .accessibilityLabel(Text("lesson.recap.key_point_a11y \(index + 1) \(recap.keyPoints.count)"))
    }

    // MARK: Discoverer · page 2 (`r-d2-a`, `r-d2-a-nod`)

    private var secondPage: some View {
        VStack(alignment: .leading, spacing: RecapMetrics.pageGap) {
            if let myth = recap.myth {
                mythCard(myth).reveal(order: 1)
            }
            if !recap.words.isEmpty {
                VStack(alignment: .leading, spacing: RecapMetrics.wordGap) {
                    PaperTag(Text("lesson.learn.words_tag"), style: .cut(eyebrow: true))
                        .accessibilityAddTraits(.isHeader)
                    wordGrid
                }
                .reveal(order: 2)
            }
            objectiveCard.reveal(order: 3)
        }
        .padding(.trailing, metrics.gridTrailingInset)
    }

    /// Whether "Cả hai" gives this line a VI button (it then takes room in the card).
    private func hasSecondVoice(_ utterance: Utterance) -> Bool {
        speech?.secondVoice(of: utterance) != nil
    }

    /// One paper in two parts: what was claimed on top (giấy lõm and struck when it is not true),
    /// the truth under it, a round arrow between them; one speaker says both. Designer 15/11: the
    /// speaker column is pinned on the seam at the right, so neither part grows for it.
    private func mythCard(_ myth: LessonRecap.Myth) -> some View {
        let say = session.recapMythUtterance(myth)
        let wrong = !myth.claimIsTrue
        let withVI = hasSecondVoice(say)
        var truthPadding = RecapMetrics.truthPadding
        if withVI { truthPadding.trailing = RecapMetrics.truthTrailingWithVI }
        return VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: RecapMetrics.claimGap) {
                SpeakerBadge(speaker: myth.speaker, nods: myth.claimIsTrue)
                Text(verbatim: mode.sentence(myth.claim))
                    .typography(Tokens.Typography.itemTitle)
                    .foregroundStyle(wrong ? Tokens.Role.textSecondary : Tokens.Role.textPrimary)
                    .strikethrough(wrong, color: Tokens.Role.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .accessibilityIdentifier("lesson.recap.claim")
            }
            .padding(RecapMetrics.claimPadding)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(wrong ? Tokens.Role.surfaceSunken : Tokens.Role.surfacePaper)
            .alignmentGuide(.recapSeam) { $0[.bottom] }
            Text(verbatim: mode.sentence(myth.truth))
                .typography(Tokens.Typography.sentence)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(truthPadding)
                // "Cả hai": the part is at least as high as the VI's touch frame under the seam.
                .frame(minHeight: withVI ? RecapMetrics.truthMinHeightWithVI : nil, alignment: .topLeading)
                .accessibilityIdentifier("lesson.recap.truth")
        }
        .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
        // The round arrow on the seam, under the face's centre.
        .overlay(alignment: Alignment(horizontal: .leading, vertical: .recapSeam)) {
            ZStack {
                Circle().fill(Tokens.Role.surfacePaper).paperDropShadow(Tokens.Shadow.paper1)
                PaperIconView(.arrowForward, size: RecapMetrics.jointIcon, color: Tokens.Role.textSecondary)
                    .rotationEffect(.degrees(90))
            }
            .frame(width: RecapMetrics.joint, height: RecapMetrics.joint)
            .alignmentGuide(.recapSeam) { $0[VerticalAlignment.center] }
            .padding(.leading, RecapMetrics.jointLeading)
            .accessibilityHidden(true)
        }
        // The speaker 2 above the seam, the VI ("Cả hai") 2 under it, 10 from the right edge.
        .overlay(alignment: Alignment(horizontal: .trailing, vertical: .recapSeam)) {
            VStack(spacing: RecapMetrics.seamGap * 2) {
                RecapSpeaker(utterance: say, label: "lesson.listen.myth", speaking: isReading(say.id))
                SecondVoiceButton(say)
            }
            .alignmentGuide(.recapSeam) { _ in Tokens.TouchTarget.discoverer + RecapMetrics.seamGap }
            .padding(.trailing, Tokens.Space.s10)
            // VoiceOver: face, claim, truth, then the speaker and VI.
            .accessibilitySortPriority(-1)
        }
        .modifier(RecapPaper(lifted: isReading(say.id), radius: radius))
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("lesson.recap.myth")
    }

    /// "I can…" with its check seal. Discoverer: the speaker with the VI under it ("Cả hai").
    /// Explorer (`r-x2-a`): seal 42, [VI][speaker] in one row, so the card stays low.
    private var objectiveCard: some View {
        let say = session.recapObjectiveUtterance
        let withVI = hasSecondVoice(say)
        return HStack(alignment: .center, spacing: Tokens.Space.s12) {
            Seal(icon: .check, size: isExplorer ? .goal : .medium, tone: .correct, accessibilityLabel: Text("lesson.recap.goal_a11y"))
            Text(verbatim: mode.sentence(session.lesson.objective))
                .typography(isExplorer ? Tokens.Typography.itemTitle : Tokens.Typography.sentence)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .accessibilityIdentifier("lesson.recap.objective")
            if isExplorer {
                HStack(spacing: Tokens.Space.s4) {
                    SecondVoiceButton(say)
                    RecapSpeaker(utterance: say, label: "lesson.listen.objective", speaking: isReading(say.id))
                }
            } else {
                VStack(spacing: Tokens.Space.s4) {
                    RecapSpeaker(utterance: say, label: "lesson.listen.objective", speaking: isReading(say.id))
                    SecondVoiceButton(say)
                }
            }
        }
        .padding(!isExplorer && withVI ? RecapMetrics.goalPaddingWithVI : RecapMetrics.goalPadding)
        .modifier(RecapPaper(lifted: isReading(say.id), radius: radius))
        .accessibilityElement(children: .contain)
    }

    /// The new words in one row, as many columns as words (designer 15/11; more than four wrap).
    private var wordGrid: some View {
        // SK-047: a word that would not fit its cell even at the floor takes a column less.
        let words = recap.words.map { $0.term.en.uppercased() }
        let count = LabelWidths.recapWordColumns(count: recap.words.count, metrics: metrics) { width in
            words.allSatisfy { WordFit.rawFit($0, style: Tokens.Typography.title, width: width, dynamicTypeSize: dynamicTypeSize).scale >= WordFit.floor }
        }
        let cell = LabelWidths.recapWordCell(columns: count, metrics: metrics)
        let inner = LabelWidths.recapWordText(columns: count, metrics: metrics)
        let picture = isExplorer
            ? metrics.illustration(RecapMetrics.explorerWordPicture)
            : min(metrics.illustration(RecapMetrics.wordPictureMax), inner * 3 / 4)
        let rows = stride(from: 0, to: recap.words.count, by: count).map { Array(recap.words[$0..<min($0 + count, recap.words.count)]) }
        return VStack(alignment: .leading, spacing: RecapMetrics.wordGap) {
            ForEach(rows.indices, id: \.self) { row in
                HStack(alignment: .top, spacing: RecapMetrics.wordGap) {
                    ForEach(rows[row], id: \.key) { term in
                        wordCell(term, picture: picture, inner: inner)
                            .frame(width: cell)
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
            }
        }
    }

    /// A new word: its picture, the English word in capitals, the Vietnamese meaning under it (not
    /// in English mode). The whole cell says the word; no speaker mark (designer 15/11). The word
    /// fits its cell without "…" and never breaks inside a word (`WordFit`).
    private func wordCell(_ term: VocabTerm, picture: CGFloat, inner: CGFloat) -> some View {
        let say = session.utterance("word.\(term.key)", term.term)
        let word = term.term.en.uppercased()
        let cellRadius = isExplorer ? RecapMetrics.explorerWordRadius : radius
        let pictureRadius = isExplorer ? RecapMetrics.explorerWordPictureRadius : max(radius - Tokens.Space.s4, Tokens.Radius.tag)
        return Button {
            speech?.play(say)
        } label: {
            VStack(alignment: .leading, spacing: Tokens.Space.s4) {
                ContentPicture(image: term.image, color: nil, size: picture, box: .fillWidth)
                    .frame(height: picture)
                    .clipShape(RoundedRectangle(cornerRadius: pictureRadius, style: .continuous))
                WordFitText(word, style: Tokens.Typography.title, width: inner, alignment: .leading)
                if mode != .enFirst {
                    Text(verbatim: term.term.text(in: .vi))
                        .typography(Tokens.Typography.caption)
                        .foregroundStyle(Tokens.Role.textSecondary)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding(RecapMetrics.wordPadding)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: cellRadius)
        }
        .buttonStyle(.paperPress)
        .accessibilityLabel(Text(verbatim: mode == .enFirst ? term.term.en : "\(term.term.en), \(term.term.text(in: .vi))"))
        .accessibilityAddTraits(.startsMediaSession)
        .accessibilityIdentifier("lesson.recap.word.\(term.key)")
    }

    // MARK: Explorer · page 1 (`r-x1-a`)

    private var explorerFirstPage: some View {
        let points = recap.keyPoints
        let shown = points.indices.contains(selected) ? selected : 0
        let side = min(metrics.illustration(RecapMetrics.explorerKeyPoint), (metrics.contentWidth - metrics.gridTrailingInset - Tokens.Space.s14) / 2)
        return VStack(alignment: .leading, spacing: Tokens.Space.s14) {
            if points.indices.contains(shown) {
                ExplorerSpeechRow(
                    mood: .talk, lines: [points[shown].text], mode: mode, showsSecond: session.showsSecondLanguage,
                    listen: session.recapKeyPointUtterance(shown), sways: false
                )
                .reveal(order: 1)
            }
            VStack(spacing: Tokens.Space.s16) {
                HStack(spacing: Tokens.Space.s14) {
                    ForEach(Array(points.enumerated().prefix(2)), id: \.offset) { index, point in
                        explorerKeyPointCard(index, point, side: side)
                    }
                }
                HStack(spacing: Tokens.Space.s14) {
                    ForEach(Array(points.enumerated().dropFirst(2)), id: \.offset) { index, point in
                        explorerKeyPointCard(index, point, side: side)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .reveal(order: 2)
        }
        .padding(.trailing, metrics.gridTrailingInset)
    }

    private func explorerKeyPointCard(_ index: Int, _ point: LessonRecap.KeyPoint, side: CGFloat) -> some View {
        let say = session.recapKeyPointUtterance(index)
        return Button {
            selected = index
            speech?.play(say)
        } label: {
            ContentPicture(asset: point.image?.asset, color: nil, size: side - 2 * Tokens.Space.s6, box: .fillWidth, accessibilityLabel: nil)
                .frame(width: side - 2 * Tokens.Space.s6, height: side - 2 * Tokens.Space.s6)
                .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.explorer - Tokens.Space.s6, style: .continuous))
                .padding(Tokens.Space.s6)
                .modifier(RecapPaper(lifted: isReading(say.id), radius: Tokens.Radius.explorer))
        }
        .buttonStyle(.paperPress)
        .accessibilityLabel(Text("lesson.recap.key_point_a11y \(index + 1) \(recap.keyPoints.count)") + Text(verbatim: ": " + mode.sentence(point.text)))
        .accessibilityAddTraits(.startsMediaSession)
        .accessibilityIdentifier("lesson.recap.key_point.\(index + 1)")
    }

    // MARK: Explorer · page 2 (`r-x2-a`, `r-x2-none`)

    private var explorerSecondPage: some View {
        VStack(alignment: .leading, spacing: RecapMetrics.pageGap) {
            if let myth = recap.myth {
                explorerMythCard(myth).reveal(order: 1)
            }
            if !recap.words.isEmpty {
                Group {
                    if recap.myth != nil {
                        wordGrid
                    } else {
                        // `r-x2-none`: no card, so the words take rows, as on the Từ mới page.
                        VStack(spacing: Tokens.Space.s12) {
                            ForEach(recap.words, id: \.key) { term in explorerWordRow(term) }
                        }
                    }
                }
                .reveal(order: 2)
            }
            objectiveCard.reveal(order: 3)
        }
        .padding(.trailing, metrics.gridTrailingInset)
    }

    /// The question's photo (`120`) with the shake on its bottom-left corner and the speaker (and
    /// the "Cả hai" VI) on its bottom-right corner; under it the claim struck and the truth, the
    /// whole width (designer 15/11, `r-x2-a`, `r-x2-a-bi`). Without a photo: [shake][lines][speaker].
    private func explorerMythCard(_ myth: LessonRecap.Myth) -> some View {
        let say = session.recapMythUtterance(myth)
        let shake = Image("ArtExplorerShake", bundle: .main)
            .resizable()
            .scaledToFit()
            .frame(width: RecapMetrics.explorerShake, height: RecapMetrics.explorerShake)
            .paperDropShadow(Tokens.Shadow.dropTag)
            .accessibilityLabel(Text("lesson.recap.not_true_a11y"))
            .accessibilitySortPriority(3)
        let controls = HStack(spacing: Tokens.Space.s4) {
            SecondVoiceButton(say)
            RecapSpeaker(utterance: say, label: "lesson.listen.myth", speaking: isReading(say.id))
        }
        // VoiceOver: the shake, the two lines, then the speaker and VI (on the photo, read last).
        .accessibilitySortPriority(-1)
        let lines = VStack(alignment: .leading, spacing: Tokens.Space.s4) {
            Text(verbatim: mode.sentence(myth.claim))
                .typography(Tokens.Typography.bodyStrong)
                .foregroundStyle(Tokens.Role.textSecondary)
                .strikethrough(true, color: Tokens.Role.textSecondary)
                .fixedSize(horizontal: false, vertical: true)
                .accessibilityIdentifier("lesson.recap.claim")
            Text(verbatim: mode.sentence(myth.truth))
                .typography(Tokens.Typography.sentence)
                .fixedSize(horizontal: false, vertical: true)
                .accessibilityIdentifier("lesson.recap.truth")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .accessibilitySortPriority(2)
        return Group {
            if let image = myth.image {
                VStack(alignment: .leading, spacing: 0) {
                    ContentPicture(image: image, color: nil, size: metrics.illustration(RecapMetrics.explorerPhoto), box: .fillWidth)
                        .frame(maxWidth: .infinity)
                        .frame(height: metrics.illustration(RecapMetrics.explorerPhoto))
                        .clipShape(RoundedRectangle(cornerRadius: RecapMetrics.explorerPhotoRadius, style: .continuous))
                        .accessibilityHidden(true)
                        .overlay(alignment: .bottomLeading) { shake.padding(RecapMetrics.explorerShakeInset) }
                        .overlay(alignment: .bottomTrailing) { controls.padding(RecapMetrics.explorerControlsInset) }
                    lines.padding(RecapMetrics.explorerLinesPadding)
                }
            } else {
                HStack(alignment: .center, spacing: Tokens.Space.s10) {
                    shake
                    lines
                    controls
                }
                .padding(RecapMetrics.explorerLinesPadding)
            }
        }
        .padding(Tokens.Space.s6)
        .modifier(RecapPaper(lifted: isReading(say.id), radius: Tokens.Radius.explorer))
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("lesson.recap.myth")
    }

    private func explorerWordRow(_ term: VocabTerm) -> some View {
        let say = session.utterance("word.\(term.key)", term.term)
        let picture = RecapMetrics.explorerWordRowPicture
        return Button {
            speech?.play(say)
        } label: {
            HStack(spacing: Tokens.Space.s14) {
                ContentPicture(image: term.image, color: nil, size: picture.height, box: .fillWidth)
                    .frame(width: picture.width, height: picture.height)
                    .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.explorer - Tokens.Space.s6, style: .continuous))
                VStack(alignment: .leading, spacing: Tokens.Space.s2) {
                    // SK-047: one word shrinks on its line, a phrase breaks at its spaces only.
                    WordFitText(term.term.en.uppercased(), style: Tokens.Typography.title, width: nil, fixedBox: false, alignment: .leading)
                    if mode != .enFirst {
                        Text(verbatim: term.term.text(in: .vi))
                            .typography(Tokens.Typography.bodyStrong)
                            .foregroundStyle(Tokens.Role.textSecondary)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                PaperIconView(.speaker, size: PaperMetrics.headerChipIcon, color: Tokens.Role.textPrimary)
                    .accessibilityHidden(true)
            }
            .padding(Tokens.Space.s6)
            .padding(.trailing, Tokens.Space.s8)
            .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.explorer)
        }
        .buttonStyle(.paperPress)
        .accessibilityLabel(Text(verbatim: mode == .enFirst ? term.term.en : "\(term.term.en), \(term.term.text(in: .vi))"))
        .accessibilityAddTraits(.startsMediaSession)
        .accessibilityIdentifier("lesson.recap.word.\(term.key)")
    }

    // MARK: Bottom

    private var bottom: some View {
        BottomBar {
            VStack(spacing: Tokens.Space.s10) {
                RecapPageBar(current: page, count: 2)
                HStack(spacing: Tokens.Space.s12) {
                    if page > 0 {
                        PaperIconButton(.arrowBack, accessibilityLabel: Text("lesson.learn.prev_page")) { turn(to: page - 1) }
                            .accessibilityIdentifier("lesson.recap.prev")
                    }
                    if page == 0 {
                        next(label: "lesson.learn.next_page") { turn(to: 1) }
                            .accessibilityIdentifier("lesson.recap.next")
                    } else {
                        next(label: "lesson.recap.to_reward") {
                            reading = []
                            session.advance()
                        }
                        .accessibilityIdentifier("lesson.recap.to_reward")
                    }
                }
            }
        }
    }

    @ViewBuilder private func next(label: LocalizedStringKey, action: @escaping () -> Void) -> some View {
        if isExplorer {
            ExplorerNextButton(label: label, action: action)
        } else {
            ArrowButton(label: label, action: action)
        }
    }
}

// MARK: - Pieces

/// Close and the four step squares, all done (lá tre with a tick); the page's name is only a
/// VoiceOver heading ("Em đã học", "Nhớ nhé"), never printed nor read aloud.
private struct RecapHeader: View {
    let title: LocalizedStringKey
    let onClose: () -> Void
    @Environment(\.ageGroup) private var ageGroup

    var body: some View {
        HStack(spacing: Tokens.Space.s12) {
            // The attempt is saved: closing goes back to the journey, without the reward.
            PaperIconButton(.close, accessibilityLabel: Text("lesson.reward.close", bundle: .main), action: onClose)
                .accessibilityIdentifier("lesson.back")
            ProgressSquares(
                count: 4, current: 4,
                squareSize: ageGroup == .explorer ? ExplorerMetrics.pip : PaperMetrics.progressSquare,
                accessibilityLabel: Text("lesson.recap.steps_done_a11y")
            )
            .frame(maxWidth: .infinity)
            .accessibilityIdentifier("lesson.steps")
            Color.clear.frame(width: ageGroup.touchTarget, height: 1)
        }
        .overlay(alignment: .topLeading) {
            Color.clear
                .frame(width: 1, height: 1)
                .accessibilityElement()
                .accessibilityLabel(Text(title))
                .accessibilityAddTraits(.isHeader)
                .accessibilitySortPriority(1)
                .accessibilityIdentifier("lesson.recap.title")
        }
        .accessibilityElement(children: .contain)
    }
}

/// The paper of a Tổng kết card; lifted on its vàng hoè layer while it is read (Reduce Motion:
/// the layer only, no move).
private struct RecapPaper: ViewModifier {
    let lifted: Bool
    let radius: CGFloat
    @ReducedMotion private var reduced

    func body(content: Content) -> some View {
        let shape = RoundedRectangle(cornerRadius: radius, style: .continuous)
        content
            .background {
                shape
                    .fill(Tokens.Role.surfacePaper)
                    .paperShadow(lifted ? Tokens.Shadow.offsetAccent : Tokens.Shadow.paper2, in: shape)
            }
            .offset(y: lifted && !reduced ? -RecapMetrics.lift : 0)
            .animation(MotionPolicy.animation(.easeOut(duration: RecapMetrics.liftDuration), reduced: reduced), value: lifted)
    }
}

/// The speaker of a Tổng kết line: the Discoverer disc, or the Explorer gỉ đồng disc (vàng hoè
/// while it speaks). Hidden when the voice has no clip for it.
private struct RecapSpeaker: View {
    let utterance: Utterance
    let label: LocalizedStringKey
    let speaking: Bool
    @Environment(\.speechPlayer) private var speech
    @Environment(\.ageGroup) private var ageGroup

    var body: some View {
        if !utterance.isEmpty {
            Group {
                if ageGroup == .explorer {
                    Button {
                        speech?.play(utterance)
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
                    .accessibilityLabel(Text(label, bundle: .main))
                } else {
                    PaperIconButton(.speaker, accessibilityLabel: Text(label, bundle: .main), disc: .screen) {
                        speech?.play(utterance)
                    }
                }
            }
            .accessibilityAddTraits(.startsMediaSession)
            .accessibilityIdentifier("listen.\(utterance.id)")
        }
    }
}

/// Na's face between the gỉ đồng arrows of the shake (she was not right) or the nod (she was):
/// the designer's `img/na-shake.svg`, `img/na-nod.svg`, built from `ArtSpeakerNa` and the arrows
/// of `ArtExplorerShake` / `ArtExplorerNod` (no new art). Without a speaker, the shake or nod art.
/// VoiceOver: "Na said this. Na was (not) right".
private struct SpeakerBadge: View {
    let speaker: String?
    let nods: Bool

    var body: some View {
        let side = RecapMetrics.face
        Group {
            if let speaker {
                ZStack(alignment: .topLeading) {
                    Image("ArtSpeaker" + speaker.prefix(1).uppercased() + speaker.dropFirst(), bundle: .main)
                        .resizable()
                        .scaledToFit()
                        .frame(width: side * 0.6, height: side * 0.6)
                        .paperDropShadow(Tokens.Shadow.dropTag)
                        .offset(x: side * 0.2, y: side * 25 / 120)
                    HeadMoveArrows(nods: nods)
                        .fill(Tokens.Palette.giDong)
                }
            } else {
                Image(nods ? "ArtExplorerNod" : "ArtExplorerShake", bundle: .main)
                    .resizable()
                    .scaledToFit()
            }
        }
        .frame(width: side, height: side)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text(nods ? "lesson.recap.na_right_a11y" : "lesson.recap.na_wrong_a11y"))
        .accessibilityIdentifier(nods ? "lesson.recap.nod" : "lesson.recap.shake")
    }
}

/// The two chevrons of the shake (left and right) or the nod (up and down), in a 120 box.
private struct HeadMoveArrows: SwiftUI.Shape {
    let nods: Bool

    func path(in rect: CGRect) -> Path {
        let points: [[CGPoint]] = nods
            ? [[.init(x: 47, y: 22), .init(x: 60, y: 10), .init(x: 73, y: 22), .init(x: 67.5, y: 25.5), .init(x: 60, y: 18.5), .init(x: 52.5, y: 25.5)],
               [.init(x: 47, y: 100), .init(x: 60, y: 112), .init(x: 73, y: 100), .init(x: 67.5, y: 96.5), .init(x: 60, y: 103.5), .init(x: 52.5, y: 96.5)]]
            : [[.init(x: 20, y: 48), .init(x: 8, y: 61), .init(x: 20, y: 74), .init(x: 23.5, y: 68.5), .init(x: 16.5, y: 61), .init(x: 23.5, y: 53.5)],
               [.init(x: 100, y: 48), .init(x: 112, y: 61), .init(x: 100, y: 74), .init(x: 96.5, y: 68.5), .init(x: 103.5, y: 61), .init(x: 96.5, y: 53.5)]]
        let scale = CGAffineTransform(translationX: rect.minX, y: rect.minY).scaledBy(x: rect.width / 120, y: rect.height / 120)
        var path = Path()
        for chevron in points {
            path.addLines(chevron)
            path.closeSubpath()
        }
        return path.applying(scale)
    }
}

/// Two pieces, the current one long in vàng hoè (no "n/N").
private struct RecapPageBar: View {
    let current: Int
    let count: Int

    var body: some View {
        HStack(spacing: Tokens.Space.s6) {
            ForEach(0..<count, id: \.self) { index in
                RoundedRectangle(cornerRadius: Tokens.Radius.bar, style: .continuous)
                    .fill(index == current ? Tokens.Role.stateCurrent : Tokens.Role.surfaceInactive)
                    .frame(width: index == current ? PictureBookMetrics.pageDotCurrent : PictureBookMetrics.pageDot, height: PictureBookMetrics.pageDot)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("lesson.learn.page_a11y \(current + 1) \(count)"))
        .accessibilityIdentifier("lesson.recap.page")
    }
}


extension VerticalAlignment {
    /// The seam between the two parts of the "Ý sai → Ý đúng" card (Tổng kết, Discoverer).
    private enum RecapSeam: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat { context[.bottom] }
    }

    static let recapSeam = VerticalAlignment(RecapSeam.self)
}
