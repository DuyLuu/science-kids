import AudioKit
import ContentModel
import DesignSystem
import Profiles
import SwiftUI

/// Học, Explorer, as a picture book (SK-043 hướng A; A-final "Explorer · Học · trang 4/5"):
/// one `explore_groups` group per page, then a "Từ mới" page with the `word_list`.
///
/// - A page: the group's name on a cut tag, its picture as big as the screen allows (at most
///   380 high, cropped to fill), and the sentence in the mascot's bubble with its speaker. The
///   page reads itself when it opens: the name, the sentence, then the examples, which are not
///   printed (the child does not read yet; schema v1 has no picture for an example).
/// - Turning: an arrow-only button to the next page, a small back arrow to the page before, page
///   dots. Pages slide; with Reduce Motion they cross-fade.
/// - Opening a page marks its group seen (`complete_when: all_seen`); the button after the last
///   page goes to Chơi (or the quiz).
struct ExplorerLearnStep: View {
    let session: LessonSession
    let onBack: () -> Void

    enum Page: Hashable {
        case group(ExploreGroup)
        case words(WordList)
    }

    @State private var page: Int
    @State private var forward = true
    @ReducedMotion private var reduced
    @Environment(\.speechPlayer) private var speech
    @Environment(\.layoutMetrics) private var metrics

    init(session: LessonSession, onBack: @escaping () -> Void) {
        self.session = session
        self.onBack = onBack
        let groups = session.exploreBlock?.groups ?? []
        _page = State(initialValue: groups.firstIndex { $0.key == session.progress.exploreSelected } ?? 0)
    }

    private var mode: LanguageMode { session.languageMode }

    /// The pages of the lesson's Học, in order.
    static func pages(of session: LessonSession) -> [Page] {
        var pages = (session.exploreBlock?.groups ?? []).map(Page.group)
        if let list = session.wordList, !list.termKeys.isEmpty { pages.append(.words(list)) }
        return pages
    }

    var body: some View {
        let pages = Self.pages(of: session)
        let current = min(page, max(pages.count - 1, 0))
        PaperFrame {
            VStack(alignment: .leading, spacing: LessonMetrics.gap) {
                ExplorerStepHeader(session: session, backLabel: Text("lesson.back"), onBack: onBack)
                    .reveal(order: 0)
                if pages.indices.contains(current) {
                    pageView(pages[current])
                        .id(current)
                        .transition(transition)
                        .frame(maxHeight: .infinity, alignment: .top)
                }
                PageBar(colors: pages.map(\.color), current: current)
                    .frame(maxWidth: .infinity)
            }
            // Swipe left / right turns the page too (main session 13/11: buttons and swipe).
            .contentShape(Rectangle())
            .gesture(DragGesture(minimumDistance: Tokens.Space.s20 * 2).onEnded { drag in
                guard abs(drag.translation.width) > abs(drag.translation.height) else { return }
                turn(to: current + (drag.translation.width < 0 ? 1 : -1), pages: pages)
            })
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            BottomBar {
                HStack(spacing: Tokens.Space.s12) {
                    // "Trang trước": a round 72 button, not on the first page.
                    if current > 0 {
                        PaperIconButton(.arrowBack, accessibilityLabel: Text("lesson.learn.prev_page")) { turn(to: current - 1, pages: pages) }
                            .accessibilityIdentifier("lesson.learn.prev")
                    }
                    if current < pages.count - 1 {
                        ExplorerNextButton(label: "lesson.learn.next_page") { turn(to: current + 1, pages: pages) }
                    } else if session.learnComplete {
                        ExplorerNextButton(label: session.tray == nil ? "lesson.explorer.play.next" : "lesson.explorer.learn.next", action: session.advance)
                    }
                }
            }
        }
    }

    private var transition: AnyTransition {
        if reduced { return .opacity }
        return .asymmetric(
            insertion: .move(edge: forward ? .trailing : .leading).combined(with: .opacity),
            removal: .move(edge: forward ? .leading : .trailing).combined(with: .opacity)
        )
    }

    private func turn(to index: Int, pages: [Page]) {
        guard pages.indices.contains(index) else { return }
        forward = index > page
        withAnimation(MotionPolicy.animation(.easeInOut(duration: Tokens.Motion.Preset.slide.duration), reduced: reduced)) {
            page = index
        }
        switch pages[index] {
        case .group(let group):
            session.selectGroup(group.key)
            speech?.autoplay(session.explorerGroupUtterance(group))
        case .words:
            speech?.stop()
        }
    }

    // MARK: Pages

    @ViewBuilder private func pageView(_ page: Page) -> some View {
        switch page {
        case .group(let group):
            if session.isExplorer { groupPage(group) } else { discovererGroupPage(group) }
        case .words(let list):
            if session.isExplorer { wordsPage(list) } else { discovererWordsPage(list) }
        }
    }

    /// The page's picture on a piece of the group's colour, the group's name on a cut tag.
    private func pagePicture(_ group: ExploreGroup, name: String) -> some View {
        GeometryReader { proxy in
            let height = min(max(proxy.size.height, PictureBookMetrics.pagePictureMin), metrics.illustration(pictureMax))
            ContentPicture(image: group.image, color: nil, size: height - 2 * Tokens.Space.s8, box: .fillWidth)
                .clipShape(RoundedRectangle(cornerRadius: radius - Tokens.Space.s8, style: .continuous))
                .padding(Tokens.Space.s8)
                .frame(width: proxy.size.width - metrics.gridTrailingInset, height: height)
                .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: radius)
                .background {
                    RoundedRectangle(cornerRadius: radius, style: .continuous)
                        .fill(group.color.color)
                        .offset(x: Tokens.Space.s6, y: Tokens.Space.s8)
                }
                .overlay(alignment: .topLeading) {
                    PaperTag(Text(verbatim: name), style: .cut(fill: group.color.color))
                        .offset(x: -Tokens.Space.s6, y: -Tokens.Space.s10)
                        .accessibilityAddTraits(.isHeader)
                }
        }
        .frame(minHeight: PictureBookMetrics.pagePictureMin, maxHeight: metrics.illustration(pictureMax))
    }

    private var radius: CGFloat { session.isExplorer ? Tokens.Radius.explorer : Tokens.Radius.discoverer }
    private var pictureMax: CGFloat { session.isExplorer ? PictureBookMetrics.pagePictureMax : PictureBookMetrics.pagePictureMaxDiscoverer }

    /// Discoverer A2 (`learn-2`): the picture first, its sentence under it on its own paper with
    /// the speaker; the examples are read after the sentence, not printed (schema v1 has no
    /// picture for an example). "Cả hai" prints English only.
    private func discovererGroupPage(_ group: ExploreGroup) -> some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s14) {
            pagePicture(group, name: mode.sentence(group.label))
            HStack(alignment: .center, spacing: Tokens.Space.s10) {
                Text(verbatim: mode.sentence(group.sentence))
                    .typography(Tokens.Typography.itemTitle)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .accessibilityIdentifier("lesson.learn.sentence")
                ListenButton(session.explorerGroupUtterance(group), label: "lesson.listen")
            }
            .padding(EdgeInsets(top: Tokens.Space.s12, leading: Tokens.Space.s14, bottom: Tokens.Space.s12, trailing: Tokens.Space.s10))
            .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.discoverer)
            .padding(.trailing, metrics.gridTrailingInset)
        }
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("lesson.learn.group.\(group.key)")
    }

    /// Discoverer A2 (`learn-words`): "Từ mới", then one row per word: its picture, the English
    /// word in big letters and the Vietnamese meaning under it (SK-042; English only in the
    /// English mode), a speaker. The whole row says the word.
    private func discovererWordsPage(_ list: WordList) -> some View {
        let terms = list.termKeys.compactMap { key in session.lesson.vocab.first { $0.key == key } }
        return VStack(alignment: .leading, spacing: Tokens.Space.s12) {
            PaperTag(Text("lesson.learn.words_tag"), style: .cut(eyebrow: true))
                .accessibilityAddTraits(.isHeader)
            ForEach(terms, id: \.key) { term in
                let say = session.utterance("word.\(term.key)", term.term)
                HStack(spacing: Tokens.Space.s8) {
                    Button {
                        speech?.play(say)
                    } label: {
                        HStack(spacing: Tokens.Space.s14) {
                            // dev 14/11: vocab pictures are 4 : 3.
                            ContentPicture(image: term.image, color: nil, size: metrics.illustration(PictureBookMetrics.wordPicture) * 0.75, box: .fillWidth)
                                .frame(width: metrics.illustration(PictureBookMetrics.wordPicture), height: metrics.illustration(PictureBookMetrics.wordPicture) * 0.75)
                                .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.discoverer, style: .continuous))
                            VStack(alignment: .leading, spacing: Tokens.Space.s2) {
                                // A long word ("MAGNIFYING GLASS") breaks between words, never
                                // inside one: it shrinks a little first.
                                Text(verbatim: term.term.en.uppercased())
                                    .typography(Tokens.Typography.titleS)
                                    .lineLimit(2)
                                    .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                                if mode != .enFirst {
                                    Text(verbatim: term.term.vi)
                                        .typography(Tokens.Typography.bodyStrong)
                                        .foregroundStyle(Tokens.Role.textSecondary)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            PaperIconView(.speaker, size: PaperMetrics.headerChipIcon, color: Tokens.Role.textPrimary)
                                .accessibilityHidden(true)
                        }
                        .padding(Tokens.Space.s8)
                        .frame(maxWidth: .infinity)
                        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.discoverer)
                    }
                    .buttonStyle(.paperPress)
                    .accessibilityLabel(Text(verbatim: mode == .enFirst ? term.term.en : "\(term.term.en), \(term.term.vi)"))
                    .accessibilityAddTraits(.startsMediaSession)
                    .accessibilityIdentifier("lesson.word_list.\(term.key)")
                    SecondVoiceButton(say)
                }
            }
        }
        .padding(.trailing, metrics.gridTrailingInset)
    }

    private func groupPage(_ group: ExploreGroup) -> some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s14) {
            // Explorer-A: the bubble over the picture; the speaker 72 on its right.
            ExplorerSpeechRow(
                mood: .talk, lines: [group.sentence], mode: mode, showsSecond: session.showsSecondLanguage,
                listen: session.explorerGroupUtterance(group), sways: false
            )
            GeometryReader { proxy in
                let height = min(max(proxy.size.height, PictureBookMetrics.pagePictureMin), metrics.illustration(PictureBookMetrics.pagePictureMax))
                ContentPicture(image: group.image, color: nil, size: height - 2 * Tokens.Space.s8, box: .fillWidth)
                    .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.explorer - Tokens.Space.s8, style: .continuous))
                    .padding(Tokens.Space.s8)
                    .frame(width: proxy.size.width - metrics.gridTrailingInset, height: height)
                    .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.explorer)
                    // The paper sits on a piece of the group's colour (Explorer-A), not on vàng hoè.
                    .background {
                        RoundedRectangle(cornerRadius: Tokens.Radius.explorer, style: .continuous)
                            .fill(group.color.color)
                            .offset(x: Tokens.Space.s6, y: Tokens.Space.s8)
                    }
                    // The group's name: one word on a cut tag over the picture's corner.
                    .overlay(alignment: .topLeading) {
                        PaperTag(Text(verbatim: mode.name(group.label)), style: .cut(fill: group.color.color))
                            .offset(x: -Tokens.Space.s6, y: -Tokens.Space.s10)
                            .accessibilityAddTraits(.isHeader)
                    }
            }
            .frame(minHeight: PictureBookMetrics.pagePictureMin, maxHeight: metrics.illustration(PictureBookMetrics.pagePictureMax))
        }
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("lesson.learn.group.\(group.key)")
    }

    /// "Từ mới": the lesson's words as picture cards; a tap says the word (EN, then VI in Cả hai on
    /// its own button).
    private func wordsPage(_ list: WordList) -> some View {
        let terms = list.termKeys.compactMap { key in session.lesson.vocab.first { $0.key == key } }
        return VStack(alignment: .leading, spacing: Tokens.Space.s14) {
            // App line, no clip yet (subtitle only; SK-043 main session 13/11).
            ExplorerAppLineRow(line: "lesson.explorer.learn.words_intro")
            LazyVGrid(columns: [GridItem(.flexible(), spacing: Tokens.Space.s12), GridItem(.flexible())], spacing: Tokens.Space.s12) {
                ForEach(terms, id: \.key) { term in
                    let say = session.utterance("word.\(term.key)", term.term)
                    VStack(spacing: Tokens.Space.s4) {
                    Button {
                        speech?.play(say)
                    } label: {
                        VStack(spacing: Tokens.Space.s6) {
                            ContentPicture(image: term.image, color: nil, size: metrics.illustration(LessonMetrics.sheetArt), box: .fillWidth)
                            Text(verbatim: term.term.en)
                                .typography(Tokens.Typography.itemTitle, fixedBox: true)
                                .lineLimit(1)
                                .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                        }
                        .padding(Tokens.Space.s8)
                        .frame(maxWidth: .infinity)
                        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.explorer)
                    }
                    .buttonStyle(.paperPress)
                    .accessibilityLabel(Text(verbatim: term.term.en))
                    .accessibilityAddTraits(.startsMediaSession)
                    .accessibilityIdentifier("lesson.word_list.\(term.key)")
                    // Cả hai: the VI speaker under the card, not over its picture.
                    SecondVoiceButton(say)
                    }
                }
            }
            .padding(.trailing, metrics.gridTrailingInset)
        }
    }
}

extension ExplorerLearnStep.Page {
    /// The page's colour on the page bar: the group's, đỏ son for "Từ mới".
    var color: Color {
        switch self {
        case .group(let group): group.color.color
        case .words: Tokens.Role.actionPrimary
        }
    }
}
