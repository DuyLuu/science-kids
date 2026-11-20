import AudioKit
import ContentModel
import DesignSystem
import LessonEngine
import Profiles
import SwiftUI

/// Canvas sizes of the Discoverer A2 screens with no token (SK-043; design
/// `design/play-ui/options/lesson-less-text/Discoverer-A2.html`, the `?shot=` id on each line).
enum DiscovererMetrics {
    /// `q1-ask`: picture cards one under the other, cropped to fill.
    static let choiceHeight: CGFloat = 136
    /// Two picture choices: taller cards (as Explorer).
    static let choiceHeightTwo: CGFloat = 200
    /// `q3-select`: the 2 × 2 grid of four choices (about 0.8 : 1).
    static let gridCardHeight: CGFloat = 200
    /// `ipad-q3`: 2 × 2 cells `265 × 330`; three choices on iPad stand in one row, landscape
    /// cells (`170 × 200`: Discoverer photos are mostly 4 : 3, a taller cell leaves them small).
    static let gridCardHeightRegular: CGFloat = 330
    static let rowCardHeightRegular: CGFloat = 200
    /// `q3-select`: the square of a multi_choice card (top right), its check.
    static let checkBox: CGFloat = 28
    static let checkIcon: CGFloat = 16
    /// `w2-ask`: the true / false nod and shake (`150`; Na `140`), the icon inside.
    static let trueFalseHeight: CGFloat = 150
    static let trueFalseHeightNa: CGFloat = 140
    static let trueFalseIcon: CGFloat = 86
    /// `w2-ask`: the question photo of a true / false (`336 × 240`), Na's two pictures (`200`).
    static let questionPhotoHeight: CGFloat = 240
    static let questionPhotoHeightNa: CGFloat = 200
    /// Question picture above text-only choices; above a bar chart (`chart-ask`, smaller).
    static let questionPictureWithCards: CGFloat = 160
    static let questionPictureChart: CGFloat = 120
    /// `q2-ask`: a word card of the bank (picture `4 : 3`, the word under it).
    static let bankPicture: CGFloat = 96
    /// `q1-retry`, `w2-out`: the mascot on the slip and on the result sheet (`44`).
    static let mascot: CGFloat = 44
    /// `q6-ask`: Na beside her bubble (`56`).
    static let speakerFace: CGFloat = 56
    /// The arrow of the main button (`32`).
    static let arrowIcon: CGFloat = 32
    /// `chart-ask`: the tallest bar (`200`), the lowest a bar gets, a bar's picture, the peeled
    /// corner of a tried bar.
    static let chartHeight: CGFloat = 200
    static let barMinHeight: CGFloat = 12
    static let barPicture: CGFloat = 44
    static let barPeel: CGFloat = 20
    /// SK-047 `c-ask`: a counted block (height at most `28`, `3` between blocks; the odd ones
    /// `1` to the left, cut by hand), the axis under the bars (`8`), the peeled corner of the top
    /// block of a tried bar (`16`); bars are blocks when every value is a whole number up to `10`.
    static let blockMaxHeight: CGFloat = 28
    static let blockGap: CGFloat = 3
    static let blockJog: CGFloat = 1
    static let blockMaxCount: Double = 10
    static let chartAxis: CGFloat = 8
    static let blockPeel: CGFloat = 16
    /// SK-047 `h-sc-open`: the bulb drawn 1.1× the speaker's glyph; the bulb square on the slip
    /// (`36`, tilted −4°).
    static let hintGlyphScale: CGFloat = 1.1
    static let hintMark: CGFloat = 36
    static let hintMarkTilt: Angle = .degrees(-4)
    /// Designer 15/11 (rà bản dựng): the question row is top-aligned, its first line level with
    /// the centre of the 56 buttons (`15` above the text), so the speaker never floats above it in
    /// "Cả hai" (VI under the speaker); the right bar's seal (`28`) on the top block's corner.
    static let promptTopInset: CGFloat = 15
    static let barSealOffset = CGSize(width: 7, height: -8)
}

/// One Discoverer question, in Khởi động or the Quiz, after A2 (SK-043, Duy 14/11).
///
/// - Header without words: close and the question squares.
/// - The question is one printed sentence with its speaker; it reads itself when the step opens
///   (`LessonPlayerView`). The instruction ("Chọn tất cả…", "Chọn từ còn thiếu", "Na nói đúng
///   không?") is only read. "Cả hai" prints the English only; Vietnamese is on the "VI" button.
/// - A tap is the answer (point 1) for single choice, true / false, Na and a one-blank fill;
///   multi choice has the arrow-only "Done" button; an order is checked once every place is full.
/// - Picture cards carry no name (point 2); the right answer's name shows on it once scored.
///   An option without a picture shows its name instead.
/// - Wrong with a try left: the card sinks with a peeled corner (no cross, no shake) and the folded
///   slip prints the option's `feedback` (or the hint without one); its speaker says the feedback
///   then the hint (point 4). Right or out of tries: the result sheet with the seal (or the
///   mascot), one sentence, its speaker, the XP and the arrow.
/// - SK-047: choices, bank words and order cards in the attempt's order (`shownOptions`…);
///   "Gợi ý" (the bulb left of the speaker; under it on Na's line) prints the hint under the
///   question and reads it, and marks `hint_used`; once the question is done the bulb hides and
///   keeps its room.
struct DiscovererQuestionStep: View {
    let session: LessonSession
    let phase: QuestionPhase
    let index: Int
    let item: QuizItem
    let isLast: Bool
    let onClose: () -> Void

    /// The card whose name is being read, before its result shows.
    @State private var naming: String?
    /// multi_choice: the cards chosen and not checked yet.
    @State private var chosen: [String] = []
    /// fill_blank_bank with several blanks: the words placed so far.
    @State private var placed: [String] = []
    @Environment(\.speechPlayer) private var speech
    @Environment(\.layoutMetrics) private var metrics
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    @Environment(\.ageGroup) private var ageGroup
    @ReducedMotion private var reduced

    private var mode: LanguageMode { session.languageMode }
    private var status: QuestionStatus { session.status(of: item, in: phase) }
    private var tries: [Try] { session.tries(for: item, in: phase) }
    private var tried: [String] { triedKeys(tries) }
    private var count: Int { phase == .warmup ? session.warmupItems.count : session.quizItems.count }
    private var isEditing: Bool { naming == nil && !status.isDone }

    /// Where the screen scrolls after a try: the slip after a wrong try with a try left, the
    /// bottom of the answers once done, so the result sheet never hides the card with the name.
    private enum ScrollMark: Hashable { case answers, slip }

    private var scrollTarget: ScrollMark? {
        guard naming == nil else { return nil }
        switch status {
        case .open: return nil
        case .retry: return .slip
        case .done: return .answers
        }
    }

    var body: some View {
        PaperFrame(scrolls: true) {
            ScrollViewReader { proxy in
            VStack(alignment: .leading, spacing: LessonMetrics.gap) {
                DiscovererTopBar(
                    count: count, current: index + (status.isDone && naming == nil ? 1 : 0),
                    closeLabel: phase == .warmup ? "lesson.back" : "lesson.quiz.close", onClose: onClose
                )
                .reveal(order: 0)
                if phase == .warmup {
                    PaperTag(Text("lesson.warmup.tag"), style: .cut(fill: Tokens.Palette.cham, eyebrow: true))
                        .accessibilityIdentifier("lesson.warmup.tag")
                        .reveal(order: 1)
                }
                question.reveal(order: 1)
                answers.id(ScrollMark.answers)
                if case .retry = status, naming == nil, showsRetrySlip {
                    FeedbackSlip(
                        line: retryLine, mode: mode,
                        listen: session.resultUtterance(item, status: status) ?? Utterance(id: "retry", clips: [])
                    )
                    .id(ScrollMark.slip)
                }
            }
            .onChange(of: scrollTarget) { _, target in
                guard let target else { return }
                Task { @MainActor in
                    // After the sheet or the slip is laid out, so the inset is known.
                    try? await Task.sleep(for: .milliseconds(80))
                    withAnimation(MotionPolicy.animation(.easeInOut(duration: Tokens.Motion.Preset.slide.duration), reduced: reduced)) {
                        proxy.scrollTo(target, anchor: .bottom)
                    }
                }
            }
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) { bottom }
        .task(id: naming) {
            guard naming != nil else { return }
            try? await Task.sleep(for: ExplorerMetrics.nameBeat)
            if !Task.isCancelled { naming = nil }
        }
    }

    /// SK-047 `h-sc-open`: with the hint already open, the folded slip prints only a `feedback`;
    /// without one it does not show (the hint is on the screen; the voice still says it).
    private var showsRetrySlip: Bool {
        guard hintOpened, case .retry(let last) = status else { return true }
        return LessonSession.feedback(item, for: last) != nil
    }

    /// What the slip prints after a wrong try: the option's `feedback`, else the hint.
    private var retryLine: Spoken {
        guard case .retry(let last) = status else { return item.hint }
        return LessonSession.feedback(item, for: last) ?? item.hint
    }

    // MARK: Question

    @ViewBuilder private var question: some View {
        switch item.answer {
        case .trueFalse(let tf) where tf.statement != nil:
            VStack(alignment: .leading, spacing: LessonMetrics.gap) {
                if let image = item.image {
                    questionPicture(image, height: DiscovererMetrics.questionPhotoHeightNa)
                }
                // `h-na-open`: on Na's line the bulb goes under the speaker (no room beside it).
                SpeakerLine(statement: tf.statement!, speaker: tf.speaker, mode: mode, listen: session.questionUtterance(item)) {
                    hintButton
                }
                hintSlip
            }
        case .fillBlankBank(let fill):
            VStack(alignment: .leading, spacing: LessonMetrics.gap) {
                HStack(alignment: .center, spacing: Tokens.Space.s10) {
                    FillBlankSentence(fill: fill, filled: blankKeys(fill), mode: mode, showsSecond: false, state: blankState)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(alignment: .top, spacing: Tokens.Space.s8) {
                        hintButton
                        ListenButton(session.questionUtterance(item), label: "lesson.listen.question")
                    }
                }
                .padding(EdgeInsets(top: Tokens.Space.s12, leading: Tokens.Space.s14, bottom: Tokens.Space.s12, trailing: Tokens.Space.s10))
                .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.discoverer)
                hintSlip
            }
        default:
            VStack(alignment: .leading, spacing: LessonMetrics.gap) {
                HStack(alignment: .top, spacing: Tokens.Space.s10) {
                    Text(verbatim: mode.sentence(item.prompt))
                        .typography(Tokens.Typography.itemTitle)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, DiscovererMetrics.promptTopInset)
                        .accessibilityAddTraits(.isHeader)
                        .accessibilityIdentifier("lesson.prompt")
                    HStack(alignment: .top, spacing: Tokens.Space.s8) {
                        hintButton
                        ListenButton(session.questionUtterance(item), label: "lesson.listen.question")
                    }
                }
                hintSlip
                if let image = item.image, let height = questionPictureHeight {
                    questionPicture(image, height: height)
                }
            }
        }
    }

    // MARK: Gợi ý (SK-047)

    /// The question has a hint to give (the schema requires one; an empty one gets no button).
    private var hasHint: Bool {
        !item.hint.en.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            || !item.hint.vi.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    private var hintOpened: Bool { session.hintOpened(item, in: phase) }

    private var hintUtterance: Utterance { session.utterance("hint.\(item.key)", item.hint) }

    @ViewBuilder private var hintButton: some View {
        if hasHint {
            HintButton(opened: hintOpened, hidden: status.isDone) {
                session.markHintUsed(item, in: phase)
                speech?.play(hintUtterance)
            }
        }
    }

    /// The hint printed under the question once opened; it stays, also after the question is done.
    @ViewBuilder private var hintSlip: some View {
        if hasHint, hintOpened {
            HintSlip(hint: item.hint, mode: mode, listen: hintUtterance)
        }
    }

    /// The question's picture only where the answers have none (true / false; text-only choices).
    private var questionPictureHeight: CGFloat? {
        switch item.answer {
        case .trueFalse: return DiscovererMetrics.questionPhotoHeight
        case .singleChoice(let choice) where choice.options.contains { $0.image == nil }:
            return DiscovererMetrics.questionPictureWithCards
        case .multiChoice(let choice) where choice.options.contains { $0.image == nil }:
            return DiscovererMetrics.questionPictureWithCards
        case .orderSequence(let order) where order.items.contains { $0.image == nil }:
            return DiscovererMetrics.questionPictureWithCards
        case .pictureBarChart:
            // A2 `chart-ask`: a small picture of what is asked ("sand") above the chart.
            return DiscovererMetrics.questionPictureChart
        default: return nil
        }
    }

    private func questionPicture(_ image: ContentImage, height: CGFloat) -> some View {
        let height = metrics.illustration(height)
        return ContentPicture(image: image, color: nil, size: height - 2 * Tokens.Space.s8, box: .fillWidth)
            .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.discoverer, style: .continuous))
            .padding(Tokens.Space.s8)
            .frame(maxWidth: .infinity)
            .frame(height: height)
            .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.discoverer)
            .padding(.trailing, metrics.gridTrailingInset)
    }

    // MARK: Answers

    @ViewBuilder private var answers: some View {
        switch item.answer {
        case .singleChoice:
            choiceCards(session.shownOptions(item), multiple: false)
        case .multiChoice:
            choiceCards(session.shownOptions(item), multiple: true)
        case .trueFalse(let tf):
            trueFalseCards(tf)
        case .fillBlankBank(let fill):
            bankCards(fill)
        case .orderSequence(let order):
            ExplorerOrderSequence(
                order: order, cards: session.shownOrderCards(item), status: status, tried: tries, naming: naming, mode: mode,
                onPlace: { key in speech?.play(session.utterance("word.\(key)", LessonSession.answerName(item, key: key))) },
                onComplete: { keys in answer(.order(keys), pick: keys.joined(separator: ","), name: keys.last.flatMap { LessonSession.answerName(item, key: $0) }) }
            )
            .reveal(order: 3)
        case .pictureBarChart(let chart):
            barChart(chart)
        case .unknown:
            EmptyView()
        }
    }

    /// `picture_bar_chart` (A2 `chart-ask`; dev 14/11; SK-047 `c-ask`): bars left to right in
    /// `bars` order; bar i is the button of `options[i]` (a tap answers, like a single choice).
    /// SK-047: every bar's name shows under the axis from the start (Duy 15/11, an exception to the
    /// A2 few-words rule), and when every value is a whole number up to 10 a bar is a stack of
    /// chàm blocks the child can count (`BarChartLayout`); else a solid bar as high as its value
    /// against the highest. No number, no scale.
    private func barChart(_ chart: QuizItem.PictureBarChart) -> some View {
        let bars = chart.chart.bars
        let values = bars.map(\.value)
        let top = max(values.max() ?? 1, 1)
        let height = metrics.illustration(DiscovererMetrics.chartHeight)
        let blocks = BarChartLayout.usesBlocks(values)
        let blockHeight = BarChartLayout.blockHeight(chartHeight: height, top: top)
        let columns = Array(bars.enumerated()).filter { chart.options.indices.contains($0.offset) }
        return VStack(spacing: 0) {
            HStack(alignment: .bottom, spacing: Tokens.Space.s14) {
                ForEach(columns, id: \.element.key) { index, bar in
                    let option = chart.options[index]
                    let look = ExplorerCardLook.of(key: option.key, tried: tried, isCorrect: option.correct, status: status, naming: naming)
                    Button {
                        answer(.selected(option.key), pick: option.key, name: bar.label)
                    } label: {
                        Group {
                            if blocks {
                                blockStack(count: Int(bar.value), blockHeight: blockHeight, look: look)
                            } else {
                                PeeledCard(radius: Tokens.Radius.tag, peel: look == .tried ? DiscovererMetrics.barPeel : 0)
                                    .fill(barFill(look))
                                    .paperShadow(look == .tried ? Tokens.Shadow.sunken : Tokens.Shadow.paper2,
                                                 in: PeeledCard(radius: Tokens.Radius.tag, peel: look == .tried ? DiscovererMetrics.barPeel : 0))
                                    .frame(height: max(height * CGFloat(bar.value / top), DiscovererMetrics.barMinHeight))
                            }
                        }
                        // `c-right`: the seal on the top block's corner, over its edge.
                        .overlay(alignment: .topTrailing) {
                            if look == .right {
                                Seal(icon: .check, size: .medium, tone: .correct)
                                    .offset(DiscovererMetrics.barSealOffset)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, Tokens.Space.s6)
                        .reveal(order: 3 + index, step: Tokens.Motion.Stagger.stepDense, preset: Tokens.Motion.Preset.grow)
                        .frame(height: height + Tokens.Space.s20, alignment: .bottom)
                        .background(alignment: .bottom) {
                            // Out of tries: vàng hoè nhạt behind the right bar.
                            if look == .answer {
                                RoundedRectangle(cornerRadius: Tokens.Radius.discoverer, style: .continuous)
                                    .fill(Tokens.Role.feedbackMissed)
                                    .frame(height: height + Tokens.Space.s12)
                            }
                        }
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.paperPress)
                    .disabled(!canTap(option.key, multiple: false))
                    .accessibilityLabel(Text(verbatim: barLabel(bar, unit: chart.chart.unit)))
                    .accessibilityValue(look.accessibilityValue ?? Text(verbatim: ""))
                    .accessibilityIdentifier("lesson.bar.\(option.key)")
                }
            }
            // The axis the bars stand on.
            Rectangle()
                .fill(Tokens.Role.textPrimary)
                .frame(height: DiscovererMetrics.chartAxis)
                .accessibilityHidden(true)
            // The names, always shown, each under its bar (same columns as the bars). A tap on a
            // name answers like a tap on its bar; VoiceOver reads the name on the bar.
            HStack(alignment: .top, spacing: Tokens.Space.s14) {
                ForEach(columns, id: \.element.key) { index, bar in
                    let option = chart.options[index]
                    Button {
                        answer(.selected(option.key), pick: option.key, name: bar.label)
                    } label: {
                        VStack(spacing: Tokens.Space.s4) {
                            if let image = bar.image {
                                ContentPicture(asset: image.asset, color: nil, size: DiscovererMetrics.barPicture, box: .fillWidth, accessibilityLabel: nil)
                                    .frame(height: DiscovererMetrics.barPicture)
                                    .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.tag, style: .continuous))
                            }
                            // SK-047 (tester 16/11): never cut, never broken inside a word.
                            WordFitText(
                                mode.sentence(bar.label), style: Tokens.Typography.bodyStrong,
                                width: LabelWidths.barName(count: columns.count, metrics: metrics), fixedBox: false
                            )
                        }
                        .frame(maxWidth: .infinity)
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    // Not `.disabled`: a disabled plain button greys its name, and the names
                    // stay in text_primary (`c-retry`).
                    .allowsHitTesting(canTap(option.key, multiple: false))
                    .accessibilityHidden(true)
                    .accessibilityIdentifier("lesson.bar.name.\(option.key)")
                }
            }
            .padding(.top, Tokens.Space.s8)
        }
        .padding(Tokens.Space.s14)
        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.discoverer)
        .padding(.trailing, metrics.gridTrailingInset)
        .accessibilityElement(children: .contain)
        .accessibilityLabel(Text(verbatim: chart.chart.title.map { mode.sentence($0) } ?? ""))
    }

    /// One bar as counted blocks (SK-047 `c-ask`): `count` paper blocks one on the other, the odd
    /// ones a point to the left (cut by hand). Tried: all sunken, the top one peeled (`c-retry`);
    /// right: lá tre (`c-right`).
    private func blockStack(count: Int, blockHeight: CGFloat, look: ExplorerCardLook) -> some View {
        let tried = look == .tried
        return VStack(spacing: DiscovererMetrics.blockGap) {
            ForEach(0..<max(count, 0), id: \.self) { row in
                let peel = tried && row == 0 ? DiscovererMetrics.blockPeel : 0
                PeeledCard(radius: Tokens.Radius.tag, peel: peel)
                    .fill(barFill(look))
                    .paperShadow(tried ? Tokens.Shadow.sunkenS : Tokens.Shadow.paper1, in: PeeledCard(radius: Tokens.Radius.tag, peel: peel))
                    .overlay(alignment: .topTrailing) {
                        if peel > 0 {
                            PeelFlap()
                                .fill(Tokens.Palette.giayLomDeep)
                                .frame(width: peel, height: peel)
                                .paperDropShadow(Tokens.Shadow.dropFold)
                        }
                    }
                    .frame(height: blockHeight)
                    // Counted from the bottom: the 1st, 3rd… block sits a point to the left.
                    .offset(x: (count - 1 - row) % 2 == 0 ? -DiscovererMetrics.blockJog : 0)
            }
        }
        .accessibilityHidden(true)
    }

    private func barFill(_ look: ExplorerCardLook) -> Color {
        switch look {
        case .idle: Tokens.Palette.cham
        case .naming: Tokens.Role.stateCurrent
        case .right: Tokens.Role.feedbackCorrect
        case .tried: Tokens.Role.feedbackWrong
        case .answer: Tokens.Palette.cham
        }
    }

    /// VoiceOver: the bar's name, its value and the unit ("sand, 3 cups").
    private func barLabel(_ bar: QuizItem.PictureBarChart.Bar, unit: Spoken?) -> String {
        let value = bar.value.rounded() == bar.value ? String(Int(bar.value)) : String(bar.value)
        return [mode.sentence(bar.label), [value, unit.map { mode.sentence($0) }].compactMap { $0 }.joined(separator: " ")].joined(separator: ", ")
    }

    /// Picture cards. iPhone: up to three one under the other, four or more in a 2 × 2 grid
    /// (always the grid for multi choice); iPad (regular): up to three in a row, else the grid.
    @ViewBuilder private func choiceCards(_ options: [QuizItem.ChoiceOption], multiple: Bool) -> some View {
        let grid = LabelWidths.choiceIsGrid(count: options.count, multiple: multiple)
        let height: CGFloat = {
            if grid { return metrics.isRegular ? DiscovererMetrics.gridCardHeightRegular : DiscovererMetrics.gridCardHeight }
            if metrics.isRegular { return DiscovererMetrics.rowCardHeightRegular }
            return options.count <= 2 ? DiscovererMetrics.choiceHeightTwo : DiscovererMetrics.choiceHeight
        }()
        Group {
            if grid {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: Tokens.Space.s12), GridItem(.flexible())], spacing: Tokens.Space.s12) {
                    ForEach(Array(options.enumerated()), id: \.element.key) { offset, option in
                        choiceCard(option, height: height, multiple: multiple, order: offset, count: options.count)
                    }
                }
            } else {
                let layout = metrics.isRegular
                    ? AnyLayout(HStackLayout(spacing: Tokens.Space.s12))
                    : AnyLayout(VStackLayout(spacing: Tokens.Space.s12))
                layout {
                    ForEach(Array(options.enumerated()), id: \.element.key) { offset, option in
                        choiceCard(option, height: height, multiple: multiple, order: offset, count: options.count)
                    }
                }
            }
        }
        .padding(.trailing, metrics.gridTrailingInset)
        .padding(.bottom, Tokens.Space.s6)
        .accessibilityElement(children: .contain)
        .accessibilityLabel(Text("lesson.explorer.choices"))
    }

    private func choiceCard(_ option: QuizItem.ChoiceOption, height: CGFloat, multiple: Bool, order: Int, count: Int) -> some View {
        let look = multiple ? multiLook(option) : ExplorerCardLook.of(key: option.key, tried: tried, isCorrect: option.correct, status: status, naming: naming)
        let showsName = option.image == nil || look == .right || look == .answer
        return Button {
            if multiple { toggle(option) } else { answer(.selected(option.key), pick: option.key, name: option.label) }
        } label: {
            ExplorerCardFace(look: look, showsRetry: status.isRetry, height: height, showsSeal: !multiple) {
                if let image = option.image {
                    ContentPicture(asset: image.asset, color: nil, size: height - 2 * Tokens.Space.s8, box: .fillWidth, accessibilityLabel: nil)
                        .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.discoverer, style: .continuous))
                        .padding(Tokens.Space.s8)
                } else {
                    // SK-047 (tester 16/11): never cut, never broken inside a word.
                    WordFitText(
                        mode.sentence(option.label), style: Tokens.Typography.title,
                        width: LabelWidths.choiceText(count: count, multiple: multiple, metrics: metrics),
                        maxLines: LabelWidths.choiceTextLines, fixedBox: false
                    )
                    .padding(Tokens.Space.s10)
                }
            }
            .overlay(alignment: .bottomLeading) {
                if showsName, option.image != nil {
                    NameLabel(text: mode.sentence(option.label), width: LabelWidths.nameLabelText(count: count, multiple: multiple, metrics: metrics))
                        .padding(Tokens.Space.s12)
                        .motion(Tokens.Motion.Preset.lay)
                        .accessibilityHidden(true)
                }
            }
            .overlay(alignment: .topTrailing) {
                if multiple { checkBox(look: look, chosen: chosen.contains(option.key)) }
            }
        }
        .buttonStyle(.paperPress)
        .disabled(!canTap(option.key, multiple: multiple))
        .accessibilityLabel(Text(verbatim: mode.sentence(option.label)))
        .accessibilityValue(look.accessibilityValue ?? Text(verbatim: ""))
        .accessibilityAddTraits(multiple && chosen.contains(option.key) ? .isSelected : [])
        .accessibilityIdentifier("lesson.choice.\(option.key)")
        .reveal(order: 3 + order, step: Tokens.Motion.Stagger.stepDense)
    }

    /// The square of a multi choice card: sunken while free, đỏ son with a check once chosen,
    /// lá tre on a right card after the check.
    private func checkBox(look: ExplorerCardLook, chosen: Bool) -> some View {
        let on = chosen || look == .right
        return ZStack {
            RoundedRectangle(cornerRadius: Tokens.Radius.bar, style: .continuous)
                .fill(look == .right ? Tokens.Role.feedbackCorrect : (on ? Tokens.Role.actionPrimary : Tokens.Role.surfaceSunken))
                .paperShadow(on ? Tokens.Shadow.paper1 : Tokens.Shadow.sunkenS, in: RoundedRectangle(cornerRadius: Tokens.Radius.bar, style: .continuous))
            if on {
                PaperIconView(.check, size: DiscovererMetrics.checkIcon, color: Tokens.Role.textOnAccent)
            }
        }
        .frame(width: DiscovererMetrics.checkBox, height: DiscovererMetrics.checkBox)
        .padding(Tokens.Space.s12)
        .opacity(look == .tried ? 0 : 1)
        .accessibilityHidden(true)
    }

    /// multi choice: chosen cards wear the vàng hoè ring while editing; after a wrong check only
    /// the wrong ones peel (the right ones stay chosen, the missing ones do not show); done: the
    /// right cards in lá tre, or on vàng hoè nhạt when out of tries.
    private func multiLook(_ option: QuizItem.ChoiceOption) -> ExplorerCardLook {
        let wrongTried = Set(tries.flatMap { attempt -> [String] in
            if case .selectedSet(let keys) = attempt { return keys } else { return [] }
        }).subtracting(rightKeys)
        switch status {
        case .done(let correct, _, _):
            if option.correct { return correct ? .right : .answer }
            return wrongTried.contains(option.key) ? .tried : .idle
        case .retry, .open:
            if wrongTried.contains(option.key) { return .tried }
            return chosen.contains(option.key) ? .naming : .idle
        }
    }

    private var rightKeys: Set<String> {
        if case .multiChoice(let choice) = item.answer { return Set(choice.options.filter(\.correct).map(\.key)) }
        return []
    }

    /// The nod (true) and the shake (false) with their one word: the content's labels ("Na đúng"),
    /// else the app's "Đúng" / "Sai" in the sentence language (A2 `w2-ask`, point 3).
    private func trueFalseCards(_ tf: QuizItem.TrueFalse) -> some View {
        let height = metrics.illustration(tf.statement == nil ? DiscovererMetrics.trueFalseHeight : DiscovererMetrics.trueFalseHeightNa)
        return HStack(spacing: Tokens.Space.s12) {
            ForEach([true, false], id: \.self) { value in
                let key = String(value)
                let look = ExplorerCardLook.of(key: key, tried: tried, isCorrect: value == tf.answer, status: status, naming: naming)
                Button {
                    answer(.value(value), pick: key, name: LessonSession.answerName(item, value: value))
                } label: {
                    ExplorerCardFace(look: look, showsRetry: status.isRetry, height: height) {
                        VStack(spacing: Tokens.Space.s6) {
                            Image(value ? "ArtExplorerNod" : "ArtExplorerShake", bundle: .main)
                                .resizable()
                                .scaledToFit()
                                .frame(width: metrics.illustration(DiscovererMetrics.trueFalseIcon), height: metrics.illustration(DiscovererMetrics.trueFalseIcon))
                                .paperDropShadow(Tokens.Shadow.paper1)
                            WordFitText(trueFalseWord(tf, value: value), style: Tokens.Typography.title, width: LabelWidths.trueFalseText(metrics: metrics))
                        }
                        .padding(Tokens.Space.s8)
                    }
                }
                .buttonStyle(.paperPress)
                .disabled(!canTap(key, multiple: false))
                .accessibilityLabel(Text(verbatim: trueFalseWord(tf, value: value)))
                .accessibilityValue(look.accessibilityValue ?? Text(verbatim: ""))
                .accessibilityIdentifier("lesson.tf.\(key)")
                .reveal(order: 3 + (value ? 0 : 1), step: Tokens.Motion.Stagger.stepDense)
            }
        }
        .padding(.trailing, metrics.gridTrailingInset)
        .padding(.bottom, Tokens.Space.s6)
    }

    private func trueFalseWord(_ tf: QuizItem.TrueFalse, value: Bool) -> String {
        if let labels = tf.labels { return mode.sentence(value ? labels.trueLabel : labels.falseLabel) }
        let key = "lesson.tf.\(value).\(mode.sentenceLanguage.rawValue)"
        return Bundle.main.localizedString(forKey: key, value: nil, table: nil)
    }

    /// The bank: word cards (picture, then the word in big letters; the word is what is learnt).
    /// One blank: the tap is the answer. Several: each tap fills the next blank, the last one
    /// checks; tapping a placed word takes it back.
    private func bankCards(_ fill: QuizItem.FillBlankBank) -> some View {
        // SK-047 (tester 16/11, "PALAEONTO…"): a word fits its card whole (`WordFitText`); a card
        // too narrow for a word even at the floor (Slide Over) takes a column less.
        let words = fill.bank.map { mode.sentence($0.label) }
        let count = LabelWidths.bankColumns(count: fill.bank.count, metrics: metrics) { width in
            words.allSatisfy { word in
                WordFit.rawFit(word, style: Tokens.Typography.title, width: width, maxLines: LabelWidths.bankLines,
                               dynamicTypeSize: dynamicTypeSize).scale >= WordFit.floor
            }
        }
        let textWidth = LabelWidths.bankText(columns: count, metrics: metrics)
        // One height for every card: as many lines as the longest label takes.
        let lines = words.map {
            WordFit.fit($0, style: Tokens.Typography.title, width: textWidth, maxLines: LabelWidths.bankLines, dynamicTypeSize: dynamicTypeSize).lines
        }.max() ?? 1
        let columns = Array(repeating: GridItem(.flexible(), spacing: Tokens.Space.s10), count: count)
        // While the try is named its result does not show yet.
        let wrong = wrongBankKeys(fill, tries: naming == nil ? tries : Array(tries.dropLast()))
        return LazyVGrid(columns: columns, spacing: Tokens.Space.s10) {
            ForEach(Array(session.shownBank(item).enumerated()), id: \.element.key) { offset, word in
                let look = bankLook(word.key, fill: fill, wrong: wrong)
                Button {
                    tapBank(word, fill: fill)
                } label: {
                    VStack(spacing: Tokens.Space.s6) {
                        if let image = word.image {
                            ContentPicture(asset: image.asset, color: nil, size: metrics.illustration(DiscovererMetrics.bankPicture), box: .fillWidth, accessibilityLabel: nil)
                                .frame(height: metrics.illustration(DiscovererMetrics.bankPicture))
                                .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.discoverer, style: .continuous))
                                .grayscale(look == .tried ? 1 : 0)
                                .opacity(look == .tried ? ExplorerMetrics.triedOpacity : 1)
                        }
                        WordFitText(mode.sentence(word.label), style: Tokens.Typography.title, width: textWidth,
                                    maxLines: LabelWidths.bankLines, reservedLines: lines)
                            .foregroundStyle(placed.contains(word.key) ? Tokens.Role.textSecondary : Tokens.Role.textPrimary)
                    }
                    .padding(Tokens.Space.s8)
                    // SK-060 (finding 1): a word card without a picture is still a full touch
                    // target (56pt Discoverer, B7.8), not just the word plus padding (42pt).
                    .frame(maxWidth: .infinity, minHeight: ageGroup.touchTarget)
                    .background {
                        PeeledCard(radius: Tokens.Radius.discoverer, peel: look == .tried ? ExplorerMetrics.peel / 2 : 0)
                            .fill(look.fill)
                            .paperShadow(look.shadow, in: PeeledCard(radius: Tokens.Radius.discoverer, peel: look == .tried ? ExplorerMetrics.peel / 2 : 0))
                    }
                    .overlay(alignment: .topTrailing) {
                        if look == .right {
                            Seal(icon: .check, tone: .correct).offset(ExplorerMetrics.sealOffset)
                        }
                    }
                    .paperStateAnimation(value: look)
                }
                .buttonStyle(.paperPress)
                .disabled(!isEditing || look == .tried)
                .accessibilityLabel(Text(verbatim: mode.sentence(word.label)))
                .accessibilityValue(look.accessibilityValue ?? Text(verbatim: ""))
                .accessibilityAddTraits(placed.contains(word.key) ? .isSelected : [])
                .accessibilityIdentifier("lesson.bank.\(word.key)")
                .reveal(order: 3 + offset, step: Tokens.Motion.Stagger.stepDense)
            }
        }
        .padding(.trailing, metrics.gridTrailingInset)
        .padding(.bottom, Tokens.Space.s6)
    }

    /// Words placed in a wrong blank in some try.
    private func wrongBankKeys(_ fill: QuizItem.FillBlankBank, tries: [Try]) -> Set<String> {
        var wrong = Set<String>()
        for attempt in tries {
            guard case .filled(let keys) = attempt else { continue }
            for (index, key) in keys.enumerated() where !fill.answers.indices.contains(index) || fill.answers[index] != key {
                wrong.insert(key)
            }
        }
        return wrong
    }

    private func bankLook(_ key: String, fill: QuizItem.FillBlankBank, wrong: Set<String>) -> ExplorerCardLook {
        if naming != nil { return lastFilled.contains(key) ? .naming : (wrong.contains(key) ? .tried : .idle) }
        switch status {
        case .open: return placed.contains(key) ? .naming : .idle
        case .retry: return wrong.contains(key) ? .tried : (placed.contains(key) ? .naming : .idle)
        case .done(let correct, _, _):
            if fill.answers.contains(key) { return correct ? .right : .answer }
            return wrong.contains(key) ? .tried : .idle
        }
    }

    private var lastFilled: [String] {
        if case .filled(let keys)? = tries.last { return keys }
        return []
    }

    /// The words in the blanks: the draft while editing, the try while it is named, the right
    /// words once done.
    private func blankKeys(_ fill: QuizItem.FillBlankBank) -> [String] {
        if naming != nil { return lastFilled }
        switch status {
        case .open, .retry: return placed
        case .done(let correct, _, _): return correct ? lastFilled : fill.answers
        }
    }

    private var blankState: ChoiceState? {
        guard naming == nil, case .done(let correct, _, _) = status else { return nil }
        return correct ? .correct : .missed
    }

    // MARK: Bottom

    @ViewBuilder private var bottom: some View {
        if case .done(let correct, _, let last) = status, naming == nil {
            DiscovererResultSheet(
                correct: correct,
                xp: session.xpEarned(by: item, in: phase),
                lines: LessonSession.resultLines(item, correct: correct, last: last),
                mode: mode,
                listen: session.resultUtterance(item, status: status) ?? Utterance(id: "result", clips: []),
                nextLabel: nextLabel,
                action: session.advance
            )
        } else if case .multiChoice = item.answer {
            BottomBar {
                ArrowButton(label: "lesson.multi.done") {
                    answer(.selectedSet(chosen), pick: "", name: nil)
                }
                .disabled(chosen.isEmpty || !isEditing)
                .accessibilityIdentifier("lesson.check")
            }
        }
    }

    private var nextLabel: LocalizedStringKey {
        // SK-047: after the last quiz question comes Tổng kết, not the result.
        guard isLast, phase == .warmup else { return "lesson.next" }
        return "lesson.warmup.done"
    }

    // MARK: Taps

    private func canTap(_ key: String, multiple: Bool) -> Bool {
        guard isEditing else { return false }
        if multiple { return !(multiLookKeyTried(key)) }
        return !tried.contains(key)
    }

    private func multiLookKeyTried(_ key: String) -> Bool {
        tries.contains { attempt in
            if case .selectedSet(let keys) = attempt { return keys.contains(key) && !rightKeys.contains(key) }
            return false
        }
    }

    private func toggle(_ option: QuizItem.ChoiceOption) {
        if let at = chosen.firstIndex(of: option.key) {
            chosen.remove(at: at)
        } else {
            chosen.append(option.key)
            speech?.play(session.utterance("word.\(option.key)", option.label))
        }
    }

    private func tapBank(_ word: QuizItem.FillBlankBank.BankWord, fill: QuizItem.FillBlankBank) {
        guard isEditing else { return }
        if let at = placed.firstIndex(of: word.key) {
            placed.remove(at: at)
            return
        }
        guard placed.count < fill.answers.count else { return }
        placed.append(word.key)
        if placed.count == fill.answers.count {
            answer(.filled(placed), pick: word.key, name: word.label)
        } else {
            speech?.play(session.utterance("word.\(word.key)", word.label))
        }
    }

    /// A try (D4: the tap is the answer): scored now; the name (when there is one), then the
    /// feedback and hint or the explanation, play as one utterance.
    private func answer(_ attempt: Try, pick: String, name: Spoken?) {
        guard isEditing else { return }
        let before = tries.count
        let after = session.submit(attempt, for: item, in: phase)
        // A try the engine refused (logged by the session) changes nothing on screen.
        guard session.tries(for: item, in: phase).count > before else { return }
        if name != nil { naming = pick }
        speech?.play(session.explorerAnswerUtterance(item, name: name, status: after))
        switch after {
        case .retry:
            // multi choice keeps the right cards chosen; a fill starts again from empty blanks.
            chosen = chosen.filter { rightKeys.contains($0) }
            placed = []
        case .done, .open:
            chosen = []
            placed = []
        }
    }
}

// MARK: - Pieces

/// How a bar chart is drawn (SK-047, designer 15/11 "khối đếm được"), without SwiftUI.
enum BarChartLayout {
    /// Blocks when every value is a whole number from 0 to 10 (the child counts them); else solid
    /// bars. One kind per chart.
    static func usesBlocks(_ values: [Double]) -> Bool {
        !values.isEmpty && values.allSatisfy { $0 >= 0 && $0 <= DiscovererMetrics.blockMaxCount && $0.rounded() == $0 }
    }

    /// A block's height: `min(28, (H − (top − 1) · 3) / top)`, so the highest bar fills the chart.
    static func blockHeight(chartHeight: CGFloat, top: Double) -> CGFloat {
        let count = CGFloat(max(top, 1))
        return min(DiscovererMetrics.blockMaxHeight, (chartHeight - (count - 1) * DiscovererMetrics.blockGap) / count)
    }
}

/// Close and the question squares, no word (A2): done squares in lá tre with a tick, the
/// current one vàng hoè.
struct DiscovererTopBar: View {
    let count: Int
    let current: Int
    let closeLabel: LocalizedStringKey
    let onClose: () -> Void
    @Environment(\.ageGroup) private var ageGroup

    var body: some View {
        HStack(spacing: Tokens.Space.s12) {
            PaperIconButton(.close, accessibilityLabel: Text(closeLabel, bundle: .main), action: onClose)
                .accessibilityIdentifier("lesson.back")
            ProgressSquares(count: count, current: current, accessibilityLabel: Text("lesson.quiz.progress_a11y \(min(current + 1, count)) \(count)"))
                .frame(maxWidth: .infinity)
                .accessibilityIdentifier("lesson.progress")
            Color.clear.frame(width: ageGroup.touchTarget, height: 1)
        }
    }
}

/// Na (or another child of the story) says the statement: her face, the bubble, the speaker
/// (and under it, SK-047, the hint's bulb: `below`).
struct SpeakerLine<Below: View>: View {
    let statement: Spoken
    let speaker: String?
    let mode: LanguageMode
    let listen: Utterance
    @ViewBuilder let below: Below

    init(statement: Spoken, speaker: String?, mode: LanguageMode, listen: Utterance, @ViewBuilder below: () -> Below = { EmptyView() }) {
        self.statement = statement
        self.speaker = speaker
        self.mode = mode
        self.listen = listen
        self.below = below()
    }

    var body: some View {
        // Designer 15/11: top-aligned, so Na and her bubble stay level with the speaker when the
        // column under it is long ("Cả hai": VI, then the bulb).
        HStack(alignment: .top, spacing: Tokens.Space.s10) {
            if let speaker {
                Image("ArtSpeaker" + speaker.prefix(1).uppercased() + speaker.dropFirst(), bundle: .main)
                    .resizable()
                    .scaledToFit()
                    .frame(width: DiscovererMetrics.speakerFace, height: DiscovererMetrics.speakerFace)
                    .paperDropShadow(Tokens.Shadow.dropTag)
                    .accessibilityLabel(Text(LocalizedStringKey("speaker." + speaker)))
            }
            Text(verbatim: mode.sentence(statement))
                .typography(Tokens.Typography.itemTitle)
                .fixedSize(horizontal: false, vertical: true)
                .padding(EdgeInsets(top: Tokens.Space.s12, leading: Tokens.Space.s14, bottom: Tokens.Space.s12, trailing: Tokens.Space.s14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, in: UnevenRoundedRectangle(
                    topLeadingRadius: Tokens.Radius.bubble, bottomLeadingRadius: Tokens.Radius.bubbleTail,
                    bottomTrailingRadius: Tokens.Radius.bubble, topTrailingRadius: Tokens.Radius.bubble, style: .continuous
                ))
                .accessibilityIdentifier("lesson.statement")
            VStack(spacing: Tokens.Space.s8) {
                ListenButton(listen, label: "lesson.listen.question")
                below
            }
        }
    }
}

/// "Gợi ý" (SK-047, `h-sc-ask`, `h-sc-open`): the bulb on a disc beside the speaker, icon only.
/// Opened, the disc turns vàng hoè and a tap reads the hint again. Once the question is done
/// (right or out of tries) the button hides but keeps its room, so the question does not move;
/// not dimmed, because a dim button looks broken to a child.
struct HintButton: View {
    let opened: Bool
    /// The question is done: hidden, not tappable, skipped by VoiceOver.
    let hidden: Bool
    let action: () -> Void
    @Environment(\.ageGroup) private var ageGroup

    var body: some View {
        Button(action: action) {
            PaperIconView(.hint, size: PaperMetrics.iconGlyphSize * DiscovererMetrics.hintGlyphScale, color: Tokens.Role.textPrimary)
                .frame(width: PaperMetrics.iconDiscDiameter, height: PaperMetrics.iconDiscDiameter)
                .paperSurface(opened ? Tokens.Role.stateSelected : Tokens.Role.bgScreen, shadow: Tokens.Shadow.paper2, in: Circle())
                .frame(width: ageGroup.touchTarget, height: ageGroup.touchTarget)
                .contentShape(Rectangle())
        }
        .buttonStyle(.paperPress)
        .accessibilityLabel(Text("lesson.hint.button", bundle: .main))
        .accessibilityValue(opened ? Text("lesson.hint.opened_a11y", bundle: .main) : Text(verbatim: ""))
        .accessibilityIdentifier("lesson.hint.button")
        .opacity(hidden ? 0 : 1)
        .disabled(hidden)
        .accessibilityHidden(hidden)
    }
}

/// The hint once opened (SK-047 `h-sc-open`): a paper slip under the question, not folded (the
/// folded corner means "wrong, try again" in A2), with a vàng hoè square repeating the bulb.
/// "Cả hai" prints English; the VI button plays the Vietnamese. It stays open.
struct HintSlip: View {
    let hint: Spoken
    let mode: LanguageMode
    let listen: Utterance

    var body: some View {
        HStack(alignment: .center, spacing: Tokens.Space.s10) {
            PaperIconView(.hint, size: PaperMetrics.iconGlyphSize, color: Tokens.Role.textPrimary)
                .frame(width: DiscovererMetrics.hintMark, height: DiscovererMetrics.hintMark)
                .paperSurface(Tokens.Role.stateSelected, shadow: Tokens.Shadow.paper1, cornerRadius: Tokens.Radius.tag)
                .rotationEffect(DiscovererMetrics.hintMarkTilt)
                .accessibilityHidden(true)
            Text(verbatim: mode.sentence(hint))
                .typography(Tokens.Typography.itemTitle)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .accessibilityIdentifier("lesson.hint.slip")
            SecondVoiceButton(listen)
        }
        .padding(EdgeInsets(top: Tokens.Space.s8, leading: Tokens.Space.s10, bottom: Tokens.Space.s8, trailing: Tokens.Space.s10))
        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper3, cornerRadius: Tokens.Radius.discoverer)
        .accessibilityElement(children: .contain)
        .motion(Tokens.Motion.Preset.lay)
    }
}

/// The folded slip after a wrong try with a try left (A2 `q1-retry`, point 4): the mascot, one
/// printed sentence (the option's `feedback`, or the hint), its speaker saying feedback then hint.
struct FeedbackSlip: View {
    let line: Spoken
    let mode: LanguageMode
    let listen: Utterance

    var body: some View {
        HStack(alignment: .center, spacing: Tokens.Space.s10) {
            Image(ExplorerMood.think.imageName, bundle: .main)
                .resizable()
                .scaledToFit()
                .frame(width: DiscovererMetrics.mascot, height: DiscovererMetrics.mascot)
                .accessibilityHidden(true)
            Text(verbatim: mode.sentence(line))
                .typography(Tokens.Typography.itemTitle)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .leading)
                .accessibilityIdentifier("lesson.hint")
            ListenButton(listen, label: "lesson.listen.hint", disc: .paper)
        }
        .padding(EdgeInsets(top: Tokens.Space.s12, leading: Tokens.Space.s12, bottom: Tokens.Space.s12, trailing: Tokens.Space.s20))
        .background {
            ZStack(alignment: .topTrailing) {
                FoldCornerShape().fill(Tokens.Role.surfacePaper)
                FoldFlapShape().fill(Tokens.Role.feedbackWrong)
            }
            .paperShadow(Tokens.Shadow.dropFold, in: FoldCornerShape())
        }
        .accessibilityElement(children: .contain)
        .motion(Tokens.Motion.Preset.lay)
    }
}

/// The result sheet (A2 `q1-right`, `w2-out`): the ĐÚNG seal (or the mascot when out of tries),
/// the explanation (out of tries: the feedback first) and its speaker on a row; under it the XP of a quiz question and the arrow.
struct DiscovererResultSheet: View {
    let correct: Bool
    let xp: Int?
    /// `explanation_correct`; out of tries the option's `feedback` (when written), then
    /// `explanation_wrong` (`LessonSession.resultLines`).
    let lines: [Spoken]
    let mode: LanguageMode
    let listen: Utterance
    let nextLabel: LocalizedStringKey
    let action: () -> Void
    @Environment(\.layoutMetrics) private var metrics

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
                HStack(alignment: .center, spacing: Tokens.Space.s12) {
                    if correct {
                        Seal(Text("lesson.seal.correct"), tone: .correct, accessibilityLabel: Text("lesson.mark.correct"), delay: Tokens.Motion.Stagger.step * 2)
                    } else {
                        Image(ExplorerMood.idle.imageName, bundle: .main)
                            .resizable()
                            .scaledToFit()
                            .frame(width: DiscovererMetrics.mascot, height: DiscovererMetrics.mascot)
                            .accessibilityHidden(true)
                    }
                    Text(verbatim: lines.map { mode.sentence($0) }.joined(separator: " "))
                        .typography(Tokens.Typography.itemTitle)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .accessibilityIdentifier("lesson.result.explanation")
                    ListenButton(listen, label: "lesson.listen.explanation")
                }
                HStack(spacing: Tokens.Space.s12) {
                    if let xp, xp > 0 {
                        HStack(spacing: Tokens.Space.s4) {
                            PaperIconView(.star, size: PaperMetrics.headerChipIcon, color: Tokens.Role.stateCurrent)
                            Text("lesson.reward.xp \(xp)")
                                .typography(Tokens.Typography.number, fixedBox: true)
                        }
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel(Text("lesson.xp_plus \(xp)"))
                        .accessibilityIdentifier("lesson.result.xp")
                    }
                    ArrowButton(label: nextLabel, action: action)
                        .accessibilityIdentifier("lesson.result.next")
                }
            }
        }
        .alignedToPaperFrame()
        .motion(Tokens.Motion.Preset.rise)
    }
}

/// The main button with only an arrow (A2: "nút chính chỉ có mũi tên"); its words are for VoiceOver.
struct ArrowButton: View {
    let label: LocalizedStringKey
    let action: () -> Void

    var body: some View {
        TwoLayerButton(role: .primary, action: action) {
            PaperIconView(.arrowForward, size: DiscovererMetrics.arrowIcon, color: Tokens.Role.textOnAccent)
        }
        .accessibilityLabel(Text(label, bundle: .main))
    }
}

/// The name pasted on a picture card once scored (A2 `q1-right`): a small paper label. SK-047
/// (tester 16/11): the name fits the card whole (`WordFitText`; a phrase on two lines at most).
struct NameLabel: View {
    let text: String
    /// Width the name may take (`LabelWidths.nameLabelText`).
    let width: CGFloat

    var body: some View {
        WordFitText(text, style: Tokens.Typography.bodyStrong, width: width, alignment: .leading)
            .padding(.horizontal, Tokens.Space.s8)
            .padding(.vertical, Tokens.Space.s4)
            .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.tag)
    }
}
