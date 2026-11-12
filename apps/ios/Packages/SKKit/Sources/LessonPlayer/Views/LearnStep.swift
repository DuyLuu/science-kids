import AudioKit
import ContentModel
import DesignSystem
import Profiles
import SwiftUI

/// Học (canvas Discoverer 9): the objective, `explore_groups` (tap each group: its sentence, its
/// example foods, the seen counter up to 4/4) and `word_list`. "Chơi" opens once every group has
/// been seen (`complete_when: all_seen`).
struct LearnStep<Header: View>: View {
    let session: LessonSession
    @ViewBuilder let header: Header
    @Environment(\.layoutMetrics) private var metrics
    @Environment(\.speechPlayer) private var speech
    @Environment(\.ageGroup) private var ageGroup

    private var mode: LanguageMode { session.languageMode }
    private var showsSecond: Bool { session.showsSecondLanguage }

    var body: some View {
        PaperFrame(scrolls: true) {
            VStack(alignment: .leading, spacing: LessonMetrics.learnGap) {
                header.reveal(order: 0)
                objective.reveal(order: 1)
                if let explore = session.exploreBlock {
                    exploreHeader(explore).reveal(order: 2)
                    groups(explore).reveal(order: 3)
                    if let group = selectedGroup(explore) {
                        groupSheet(group).reveal(order: 4)
                    }
                }
                if let list = session.wordList {
                    words(list).reveal(order: 5)
                }
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            BottomBar {
                if session.isExplorer {
                    // Explorer (SK-040 lượt 2): only the arrow, no word; it shows once every group is seen.
                    if session.learnComplete {
                        ExplorerNextButton(label: session.tray == nil ? "lesson.explorer.play.next" : "lesson.explorer.learn.next", action: session.advance)
                    }
                } else {
                    VStack(spacing: Tokens.Space.s6) {
                        if !session.learnComplete {
                            Text("lesson.learn.need_all")
                                .typography(Tokens.Typography.caption)
                                .foregroundStyle(Tokens.Role.textSecondary)
                        }
                        TwoLayerButton(session.tray == nil ? "lesson.learn.to_quiz" : "lesson.learn.to_play", icon: .arrowForward, action: session.advance)
                            .disabled(!session.learnComplete)
                            .accessibilityIdentifier("lesson.learn.next")
                    }
                }
            }
            .reveal(order: 6)
        }
    }

    /// "I can …" on a small paper card with a red dot, and its listen button.
    private var objective: some View {
        HStack(alignment: .center, spacing: Tokens.Space.s10) {
            HStack(alignment: .top, spacing: Tokens.Space.s10) {
                Circle()
                    .fill(Tokens.Role.textAccent)
                    .frame(width: LessonMetrics.dot, height: LessonMetrics.dot)
                    .padding(.top, LessonMetrics.dot)
                    .accessibilityHidden(true)
                BilingualLines(
                    spoken: session.lesson.objective, mode: mode, showsSecond: showsSecond,
                    primary: Tokens.Typography.bodyStrong, secondary: Tokens.Typography.caption
                )
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .accessibilityElement(children: .combine)
            ListenButton(session.utterance("learn.objective", session.lesson.objective), label: "lesson.listen.objective")
        }
        .padding(EdgeInsets(top: Tokens.Space.s8, leading: Tokens.Space.s12, bottom: Tokens.Space.s8, trailing: Tokens.Space.s12))
        .frame(maxWidth: .infinity, alignment: .leading)
        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.tag)
    }

    /// "Chạm từng nhóm · Tap each group", the seen count, the instruction's listen button.
    private func exploreHeader(_ explore: ExploreGroups) -> some View {
        HStack(alignment: .center, spacing: Tokens.Space.s8) {
            Text(verbatim: [mode.sentence(explore.prompt), showsSecond ? mode.secondSentence(explore.prompt) : nil].compactMap { $0 }.joined(separator: " · "))
                .typography(Tokens.Typography.itemTitle)
                .fixedSize(horizontal: false, vertical: true)
            Spacer(minLength: Tokens.Space.s8)
            let seen = explore.groups.filter { session.progress.exploreSeen.contains($0.key) }.count
            Text("lesson.learn.seen \(seen) \(explore.groups.count)")
                .typography(Tokens.Typography.number)
                .foregroundStyle(Tokens.Role.textSecondary)
                .accessibilityIdentifier("lesson.learn.seen")
            ListenButton(session.utterance("learn.prompt", explore.prompt), label: "lesson.listen.instruction", disc: .paper)
        }
    }

    private func groups(_ explore: ExploreGroups) -> some View {
        LazyVGrid(columns: metrics.gridColumns(for: metrics.foodGroupGrid), spacing: metrics.foodGroupGrid.rowGap) {
            ForEach(explore.groups, id: \.key) { group in
                let selected = session.progress.exploreSelected == group.key
                let seen = session.progress.exploreSeen.contains(group.key)
                Button {
                    // Explorer: the name, then the sentence (SK-040 lượt 2); Discoverer: the name.
                    speech?.play(session.isExplorer ? session.explorerGroupUtterance(group) : session.utterance("word.\(group.key)", group.label))
                    session.selectGroup(group.key)
                } label: {
                    HStack(spacing: Tokens.Space.s10) {
                        Circle()
                            .fill(group.color.color)
                            .frame(width: PaperMetrics.groupDisc, height: PaperMetrics.groupDisc)
                            .paperDropShadow(Tokens.Shadow.stamp)
                            .accessibilityHidden(true)
                        VStack(alignment: .leading, spacing: 1) {
                            Text(verbatim: mode.sentence(group.label))
                                .typography(Tokens.Typography.bodyStrong, fixedBox: true)
                                .lineLimit(2)
                                .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                            if showsSecond {
                                Text(verbatim: mode.secondSentence(group.label))
                                    .typography(Tokens.Typography.captionS, fixedBox: true)
                                    .foregroundStyle(Tokens.Role.textSecondary)
                                    .lineLimit(1)
                                    .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets(top: Tokens.Space.s8, leading: Tokens.Space.s10, bottom: Tokens.Space.s8, trailing: Tokens.Space.s10))
                    .frame(maxWidth: .infinity, minHeight: metrics.foodGroupGrid.cellHeight)
                }
                .buttonStyle(PaperChoiceStyle(state: selected ? .selected : .idle))
                .accessibilityLabel(Text(verbatim: group.label.en))
                .accessibilityValue(seen ? Text("lesson.learn.seen_mark") : Text(verbatim: ""))
                .accessibilityIdentifier("lesson.group.\(group.key)")
                .overlay(alignment: .topTrailing) {
                    if seen {
                        Seal(icon: .check)
                            .offset(x: Tokens.Space.s6, y: -Tokens.Space.s6)
                            .allowsHitTesting(false)
                    }
                }
            }
        }
        .padding(.trailing, metrics.gridTrailingInset)
        .padding(.bottom, metrics.gridTrailingInset)
    }

    private func selectedGroup(_ explore: ExploreGroups) -> ExploreGroup? {
        explore.groups.first { $0.key == session.progress.exploreSelected } ?? explore.groups.first
    }

    /// The open group on a torn sheet: its picture, its sentence, its example foods, and "Nghe câu
    /// này" at the end of the foods' row (canvas), which reads the sentence then the foods.
    private func groupSheet(_ group: ExploreGroup) -> some View {
        TornSheet {
            VStack(alignment: .leading, spacing: Tokens.Space.s10) {
                HStack(alignment: .center, spacing: Tokens.Space.s12) {
                    // SK-033: the pack's picture on a piece of the group's colour, or the stand-in art.
                    ContentPicture(image: group.image, color: group.color.color, size: metrics.illustration(LessonMetrics.sheetArt))
                        .motion(Tokens.Motion.Preset.pop)
                    BilingualLines(spoken: group.sentence, mode: mode, showsSecond: showsSecond, secondary: Tokens.Typography.bodyS, identifier: "lesson.group_sentence")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                HStack(alignment: .center, spacing: Tokens.Space.s8) {
                    FlowChips(labels: group.examples.map { mode.name($0) })
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ListenButton(
                        session.utterance("learn.group.\(group.key)", list: [group.sentence] + group.examples),
                        label: "lesson.listen.sentence"
                    )
                }
            }
        }
        .id(group.key)
    }

    private func words(_ list: WordList) -> some View {
        let terms = list.termKeys.compactMap { key in session.lesson.vocab.first { $0.key == key } }
        return VStack(alignment: .leading, spacing: Tokens.Space.s6) {
            if let title = list.title {
                PaperTag(Text(verbatim: [mode.name(title), mode.secondName(title)].compactMap { $0 }.joined(separator: " · ")), style: .label)
            }
            LazyVGrid(columns: [GridItem(.flexible(), spacing: Tokens.Space.s10), GridItem(.flexible())], spacing: Tokens.Space.s8) {
                ForEach(terms, id: \.key) { term in
                    wordChip(term)
                }
            }
        }
    }
}

extension LearnStep {
    /// A new word (canvas "Từ mới" buttons): tapping it says the word (SK-016). Without a clip in
    /// the profile's voice it is a plain slip, not a button that does nothing.
    @ViewBuilder fileprivate func wordChip(_ term: VocabTerm) -> some View {
        let say = session.utterance("word.\(term.key)", term.term)
        let face = HStack(spacing: Tokens.Space.s8) {
            Circle()
                .fill(Tokens.Role.textAccent)
                .frame(width: LessonMetrics.dot, height: LessonMetrics.dot)
                .accessibilityHidden(true)
            VStack(alignment: .leading, spacing: 0) {
                // A new word is an English word (SK-042: Tiếng Việt still shows it, with its meaning).
                Text(verbatim: term.term.en)
                    .typography(Tokens.Typography.bodyStrong)
                    .foregroundStyle(Tokens.Role.textPrimary)
                if showsSecond || mode == .viFirst {
                    Text(verbatim: term.term.vi)
                        .typography(Tokens.Typography.captionS)
                        .foregroundStyle(Tokens.Role.textSecondary)
                }
            }
            .multilineTextAlignment(.leading)
            Spacer(minLength: 0)
        }
        .padding(EdgeInsets(top: Tokens.Space.s4, leading: Tokens.Space.s10, bottom: Tokens.Space.s4, trailing: Tokens.Space.s10))
        // 56pt with or without a clip (SK-013, SK-004 iPad spec: "Từ mới" raised from 48, phone too).
        .frame(maxWidth: .infinity, minHeight: ageGroup.touchTarget, alignment: .leading)
        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.tag)

        if say.isEmpty {
            face
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(Text(verbatim: term.term.en))
                .accessibilityIdentifier("lesson.word_list.\(term.key)")
        } else {
            Button {
                speech?.play(say)
            } label: {
                face
            }
            .buttonStyle(.paperPress)
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Text(verbatim: term.term.en))
            .accessibilityAddTraits([.isButton, .startsMediaSession])
            .accessibilityIdentifier("lesson.word_list.\(term.key)")
        }
    }
}

/// Chips that wrap onto more lines (example foods), each a flat slip with a red dot.
struct FlowChips: View {
    let labels: [String]

    var body: some View {
        WrapLayout(spacing: Tokens.Space.s8) {
            ForEach(labels, id: \.self) { label in
                PaperTag(Text(verbatim: label), style: .chip(dot: Tokens.Role.textAccent))
            }
        }
    }
}

/// Lays its children out left to right, wrapping onto a new line when the width runs out.
struct WrapLayout: Layout {
    var spacing: CGFloat

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let width = proposal.width ?? .infinity
        let rows = arrange(subviews, width: width)
        let height = rows.last.map { $0.y + $0.height } ?? 0
        let used = rows.map(\.width).max() ?? 0
        return CGSize(width: proposal.width ?? used, height: height)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        for row in arrange(subviews, width: bounds.width) {
            var x = bounds.minX
            for index in row.indices {
                let size = subviews[index].sizeThatFits(.unspecified)
                subviews[index].place(at: CGPoint(x: x, y: bounds.minY + row.y), proposal: ProposedViewSize(size))
                x += size.width + spacing
            }
        }
    }

    private struct Row {
        var indices: [Int] = []
        var y: CGFloat = 0
        var width: CGFloat = 0
        var height: CGFloat = 0
    }

    private func arrange(_ subviews: Subviews, width: CGFloat) -> [Row] {
        var rows: [Row] = []
        var row = Row()
        for index in subviews.indices {
            let size = subviews[index].sizeThatFits(.unspecified)
            let needed = row.indices.isEmpty ? size.width : row.width + spacing + size.width
            if !row.indices.isEmpty, needed > width {
                rows.append(row)
                row = Row(y: row.y + row.height + spacing)
            }
            row.width = row.indices.isEmpty ? size.width : row.width + spacing + size.width
            row.height = max(row.height, size.height)
            row.indices.append(index)
        }
        if !row.indices.isEmpty { rows.append(row) }
        return rows
    }
}
