import ContentKit
import ContentModel
import DesignSystem
import LessonPlayer
import Profiles
import SwiftUI

/// SK-034 · Hành trình as a road map (phương án A, Duy 10/11): `design/play-ui/journey-roadmap-spec.md`,
/// canvas `Discoverer-Home-Roadmap.dc.html` and `-Full`. The road winds down the page through every
/// topic of the group shown, a post at the start of each stage ("Chặng 1, 2, 3", no Year) and the
/// finish flag at the end. Each topic is a stop that opens its Topic screen, "Sắp có" too (nothing is
/// locked, SK-030); its state comes from `JourneyStop` (done, being learnt, not started, coming soon).
///
/// - Layout: `JourneyMapLayout` measures every row and places it with `JourneyMapGeometry.layout`
///   (unit-tested); the road and the scenery are drawn once behind the rows, through the points the
///   rows' frames give back (`JourneyMapGeometry.roadPoint`), so they always meet the discs.
/// - From the accessibility text sizes on (the setting, before the app's cap), the map is drawn as
///   phương án B (every stop on the left, the text on the right, no scenery), spec 6.
/// - Motion: the rows are laid in the screen's reveal (140 ms, +70 ms each, at most 420 ms); the
///   child's avatar pops once; a seal is stamped in only the first time Home shows that topic done
///   (`AppModel.freshlyDoneTopics`). No looping motion on the map. Reduce Motion: nothing moves.
/// - VoiceOver reads the rows top to bottom in journey order (the view tree's order): posts as
///   headers ("Chặng 2, 0 trên 6 chủ đề xong"), stops as buttons ("Hô hấp. Sắp có"); road, scenery,
///   icons, stars and avatar are hidden.
struct JourneyMap: View {
    let progress: JourneyProgress
    let mode: LanguageMode
    let avatar: AvatarChoice
    /// Topics whose seal is stamped in (first time Home shows them done).
    let freshlyDone: Set<String>
    let open: (String) -> Void

    @Environment(\.prefersAccessibilityTextLayout) private var accessibilityText

    /// Spec 6: from `accessibility1` on, phương án B. The app caps text at xxxLarge (B7.8), so the
    /// setting is read before the cap (`RootView`).
    private var style: JourneyMapGeometry.Style {
        accessibilityText ? .trail : .winding
    }

    var body: some View {
        let entries = JourneyMapEntry.entries(progress)
        let items = entries.map(\.item)
        let mapStyle = style
        JourneyMapLayout(items: items, style: mapStyle) {
            ForEach(entries) { entry in
                entryView(entry, style: mapStyle)
                    .motion(Tokens.Motion.Preset.lay, delay: JourneyMapGeometry.revealDelay(index: entry.index))
                    // Outside the reveal's transform: the road follows the rows' resting frames.
                    .anchorPreference(key: JourneyMapFrames.self, value: .bounds) { [entry.index: $0] }
            }
        }
        .backgroundPreferenceValue(JourneyMapFrames.self) { frames in
            JourneyRoad(items: items, frames: frames, style: mapStyle)
        }
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("home.journey.map")
    }

    @ViewBuilder private func entryView(_ entry: JourneyMapEntry, style: JourneyMapGeometry.Style) -> some View {
        switch entry.kind {
        case .milestone(let segment):
            MapMilestone(segment: segment, style: style)
                .id(JourneyMapEntry.segmentID(segment.number))
        case .stop(let stop, let stopIndex):
            MapStopRow(
                stop: stop, stopIndex: stopIndex, style: style, mode: mode, avatar: avatar,
                stampsSeal: freshlyDone.contains(stop.topic.key),
                revealDelay: JourneyMapGeometry.revealDelay(index: entry.index)
            ) {
                open(stop.topic.key)
            }
        case .flag(let topics, let done):
            MapFinish(topics: topics, done: done, style: style)
        }
    }
}

extension EnvironmentValues {
    /// The child's text size is one of the accessibility sizes (`accessibility1` and up), read
    /// before the app's Dynamic Type cap (SK-034: the journey map then takes layout B).
    var prefersAccessibilityTextLayout: Bool {
        get { self[AccessibilityTextLayoutKey.self] }
        set { self[AccessibilityTextLayoutKey.self] = newValue }
    }
}

private struct AccessibilityTextLayoutKey: EnvironmentKey {
    static let defaultValue = false
}

/// One item of the map in reading order: a stage's post, a topic's stop, the finish flag.
struct JourneyMapEntry: Identifiable {
    enum Kind {
        case milestone(JourneySegment)
        case stop(JourneyStop, stopIndex: Int)
        case flag(topics: Int, done: Int)
    }

    /// Place on the map (0…), the order of the reveal and of the road.
    let index: Int
    let kind: Kind

    var id: String {
        switch kind {
        case .milestone(let segment): Self.segmentID(segment.number)
        case .stop(let stop, _): "topic." + stop.topic.key
        case .flag: "finish"
        }
    }

    var item: JourneyMapGeometry.Item {
        switch kind {
        case .milestone: .milestone
        case .stop(let stop, _): .stop(isCurrent: stop.isCurrent)
        case .flag: .flag
        }
    }

    /// Scroll id of a stage's post (iPad sidebar: a stage scrolls the map to it).
    static func segmentID(_ number: Int) -> String { "journey.segment.\(number)" }

    /// The map of a journey: for each stage its post then its topics, then the flag. Empty when the
    /// group has no topic.
    static func entries(_ progress: JourneyProgress) -> [JourneyMapEntry] {
        guard !progress.stops.isEmpty else { return [] }
        var kinds: [Kind] = []
        for segment in progress.segments {
            kinds.append(.milestone(segment))
            for index in segment.stopRange {
                kinds.append(.stop(progress.stops[index], stopIndex: index))
            }
        }
        kinds.append(.flag(topics: progress.stops.count, done: progress.doneTopicCount))
        return kinds.enumerated().map { JourneyMapEntry(index: $0.offset, kind: $0.element) }
    }
}

/// Frames of the map's rows, by place, for the road behind them.
private struct JourneyMapFrames: PreferenceKey {
    static var defaultValue: [Int: Anchor<CGRect>] { [:] }

    static func reduce(value: inout [Int: Anchor<CGRect>], nextValue: () -> [Int: Anchor<CGRect>]) {
        value.merge(nextValue()) { $1 }
    }
}

/// Places the rows of the map where `JourneyMapGeometry.layout` puts them, with each row's height
/// measured at the width the geometry gives it. Map width: what the parent offers, at most 600.
struct JourneyMapLayout: Layout {
    let items: [JourneyMapGeometry.Item]
    let style: JourneyMapGeometry.Style

    struct Cache {
        var width: CGFloat?
        var map = JourneyMapGeometry.Map.empty
    }

    func makeCache(subviews: Subviews) -> Cache { Cache() }

    func updateCache(_ cache: inout Cache, subviews: Subviews) {
        cache = Cache()
    }

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout Cache) -> CGSize {
        let width = min(proposal.width ?? JourneyMapGeometry.maxWidth, JourneyMapGeometry.maxWidth)
        return map(width: width, subviews: subviews, cache: &cache).size
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout Cache) {
        let map = map(width: bounds.width, subviews: subviews, cache: &cache)
        for (subview, placement) in zip(subviews, map.placements) {
            subview.place(
                at: CGPoint(x: bounds.minX + placement.frame.minX, y: bounds.minY + placement.frame.minY),
                anchor: .topLeading,
                proposal: ProposedViewSize(placement.frame.size)
            )
        }
    }

    private func map(width: CGFloat, subviews: Subviews, cache: inout Cache) -> JourneyMapGeometry.Map {
        if cache.width == width { return cache.map }
        let widths = JourneyMapGeometry.widths(items, width: width, style: style)
        let heights = zip(subviews, widths).map { subview, rowWidth in
            subview.sizeThatFits(ProposedViewSize(width: rowWidth, height: nil)).height
        }
        let map = JourneyMapGeometry.layout(items, width: width, heights: heights, style: style)
        cache = Cache(width: width, map: map)
        return map
    }
}

/// The road (a solid paper band with its drop shadow, no outline) and the scenery beside it,
/// behind the rows: through the points of the rows' frames, drawn as one `Path`.
private struct JourneyRoad: View {
    let items: [JourneyMapGeometry.Item]
    let frames: [Int: Anchor<CGRect>]
    let style: JourneyMapGeometry.Style

    var body: some View {
        GeometryReader { proxy in
            let marks = JourneyMapGeometry.marks(items, style: style)
            let points = marks.indices.compactMap { index in
                frames[index].map { JourneyMapGeometry.roadPoint(marks[index], in: proxy[$0]) }
            }
            if points.count == marks.count {
                let scenery = JourneyMapGeometry.scenery(items, points: points, width: proxy.size.width, style: style)
                ZStack(alignment: .topLeading) {
                    ForEach(Array(scenery.enumerated()), id: \.offset) { _, piece in
                        RoadsideScenery(piece.kind)
                            .position(piece.point)
                    }
                    JourneyMapGeometry.road(through: points, tension: JourneyMapGeometry.roadTension(style))
                        .stroke(
                            Tokens.Role.surfacePaper,
                            style: StrokeStyle(lineWidth: JourneyMapGeometry.roadWidth(style), lineCap: .round)
                        )
                        .paperDropShadow(Tokens.Shadow.paper2)
                }
            }
        }
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }
}

// MARK: - Rows

/// A stage's post and its text: "Chặng 2" over "0/6 xong" (Duy 10/11: no Year). A header for
/// VoiceOver ("Chặng 2, 0 trên 6 chủ đề xong"), so the rotor jumps stage to stage.
private struct MapMilestone: View {
    let segment: JourneySegment
    let style: JourneyMapGeometry.Style

    var body: some View {
        HStack(alignment: .top, spacing: JourneyMapGeometry.postGap(style)) {
            MilestonePost(number: segment.number)
            VStack(alignment: .leading, spacing: ScreenMetrics.markLineGap) {
                Text("home.journey.segment \(segment.number)")
                    .typography(Tokens.Typography.number)
                Text("home.journey.segment_done \(segment.doneCount) \(segment.topicCount)")
                    .typography(ScreenMetrics.stopStatusStrong)
                    .foregroundStyle(Tokens.Role.textSecondary)
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding(.top, JourneyMapGeometry.markTextTop)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundStyle(Tokens.Role.textPrimary)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("home.journey.segment_a11y \(segment.number) \(segment.doneCount) \(segment.topicCount)"))
        .accessibilityAddTraits(.isHeader)
        .accessibilityIdentifier("home.segment.\(segment.number)")
    }
}

/// The finish flag: "Về đích" over "17 chủ đề · 1 đã xong".
private struct MapFinish: View {
    let topics: Int
    let done: Int
    let style: JourneyMapGeometry.Style

    var body: some View {
        HStack(alignment: .top, spacing: JourneyMapGeometry.flagTextGap) {
            FinishFlag()
            VStack(alignment: .leading, spacing: ScreenMetrics.markLineGap) {
                Text("home.journey.finish")
                    .typography(Tokens.Typography.number)
                (Text("home.journey.count \(topics)") + Text(verbatim: " · ") + Text("home.journey.finish_done \(done)"))
                    .typography(ScreenMetrics.stopStatusStrong)
                    .foregroundStyle(Tokens.Role.textSecondary)
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding(.top, JourneyMapGeometry.markTextTop)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundStyle(Tokens.Role.textPrimary)
        .accessibilityElement(children: .combine)
        .accessibilityIdentifier("home.journey.finish")
    }
}

/// A topic on the map: its disc and its text, one button to the Topic screen (spec 3, 6). On map
/// A the text is beside the disc towards the middle: left of a stop on the right, aligned right.
private struct MapStopRow: View {
    let stop: JourneyStop
    let stopIndex: Int
    let style: JourneyMapGeometry.Style
    let mode: LanguageMode
    let avatar: AvatarChoice
    let stampsSeal: Bool
    let revealDelay: TimeInterval
    let action: () -> Void

    private var topic: JourneyTopic { stop.topic }
    private var discOnLeft: Bool { JourneyMapGeometry.discOnLeft(style, stopIndex: stopIndex) }

    var body: some View {
        Button(action: action) {
            HStack(spacing: JourneyMapGeometry.textGap(style, stopIndex: stopIndex, isCurrent: stop.isCurrent)) {
                if discOnLeft {
                    disc
                    text
                } else {
                    text
                    disc
                }
            }
            .frame(
                maxWidth: .infinity,
                minHeight: style == .winding ? ScreenMetrics.stopRowMinHeight : ScreenMetrics.stopRowMinHeightTrail
            )
            .contentShape(Rectangle())
        }
        .buttonStyle(.paperPress)
        .accessibilityLabel(accessibilityText)
        .accessibilityIdentifier("home.topic.\(topic.key)")
    }

    private var disc: some View {
        StopDisc(
            stop: stop, style: style, discOnLeft: discOnLeft, avatar: avatar,
            stampsSeal: stampsSeal, revealDelay: revealDelay
        )
    }

    private var text: some View {
        VStack(alignment: discOnLeft ? .leading : .trailing, spacing: ScreenMetrics.stopTextGap) {
            Text(verbatim: mode.name(topic.title))
                .typography(Tokens.Typography.itemTitle)
                .foregroundStyle(stop.state == .comingSoon ? Tokens.Role.textSecondary : Tokens.Role.textPrimary)
                .fixedSize(horizontal: false, vertical: true)
            status
        }
        .multilineTextAlignment(discOnLeft ? .leading : .trailing)
        .frame(maxWidth: .infinity, alignment: discOnLeft ? .leading : .trailing)
    }

    /// Spec 3: "Đã xong · 5/5 bài" after the stars, bold, `text_primary` (lá tre on điệp is only
    /// 4.19:1, Duy 10/11: lá tre stays on the seal and the piece behind the disc); "Đang học · 3/5 bài"
    /// bold đỏ son on the topic of "Học tiếp", plain `text_secondary` on another topic under way;
    /// "Mức 2 · 0/2 bài" or "Chủ đề mới · 0/5 bài"; "Sắp có".
    @ViewBuilder private var status: some View {
        let done = stop.doneCount
        let total = stop.lessonCount
        switch stop.state {
        case .done:
            HStack(spacing: ScreenMetrics.stopStarGap) {
                TopicStars(count: stop.stars)
                Text("home.journey.done \(done) \(total)")
                    .padding(.leading, ScreenMetrics.stopStarTextGap)
            }
            .typography(ScreenMetrics.stopStatusStrong)
            .foregroundStyle(Tokens.Role.textPrimary)
        case .comingSoon:
            Text("home.journey.soon")
                .typography(Tokens.Typography.captionS)
                .foregroundStyle(Tokens.Role.textSecondary)
        case .inProgress, .notStarted:
            if stop.isCurrent {
                Text("home.journey.learning \(done) \(total)")
                    .typography(ScreenMetrics.stopStatusStrong)
                    .foregroundStyle(Tokens.Role.textAccent)
            } else if stop.isStarted {
                Text("home.journey.learning \(done) \(total)")
                    .typography(Tokens.Typography.captionS)
                    .foregroundStyle(Tokens.Role.textSecondary)
            } else if let level = topic.level {
                Text("home.journey.level \(level) \(done) \(total)")
                    .typography(Tokens.Typography.captionS)
                    .foregroundStyle(Tokens.Role.textSecondary)
            } else {
                Text("home.journey.new \(done) \(total)")
                    .typography(Tokens.Typography.captionS)
                    .foregroundStyle(Tokens.Role.textSecondary)
            }
        }
    }

    /// "Khủng long và Trái Đất thời xa xưa. Đã xong, 5 trên 5 bài, 3 sao" (spec 10).
    private var accessibilityText: Text {
        Text(verbatim: mode.name(topic.title) + ". ") + accessibilityState
    }

    private var accessibilityState: Text {
        let done = stop.doneCount
        let total = stop.lessonCount
        switch stop.state {
        case .done:
            return Text("home.journey.done_a11y \(done) \(total)") + Text(verbatim: ", ") + Text("home.journey.stars_a11y \(stop.stars)")
        case .comingSoon:
            return Text("home.journey.soon")
        case .inProgress, .notStarted:
            if stop.isCurrent || stop.isStarted {
                return Text("home.journey.learning_a11y \(done) \(total)")
            }
            if let level = topic.level {
                return Text("home.journey.level_a11y \(level) \(done) \(total)")
            }
            return Text("home.journey.new_a11y \(done) \(total)")
        }
    }
}

/// The disc of a stop (spec 3): paper (dull paper on "Sắp có") with the topic's icon; the lá tre
/// piece and the seal when done; the vàng hoè piece, the lesson ring and the child's avatar on the
/// topic of "Học tiếp"; the ring alone on another topic under way.
private struct StopDisc: View {
    let stop: JourneyStop
    let style: JourneyMapGeometry.Style
    let discOnLeft: Bool
    let avatar: AvatarChoice
    let stampsSeal: Bool
    let revealDelay: TimeInterval

    var body: some View {
        let diameter = JourneyMapGeometry.discDiameter(style, isCurrent: stop.isCurrent)
        ZStack {
            if showsRing {
                LessonRing(
                    pieces: stop.squareStates.map(Self.piece),
                    diameter: diameter,
                    thickness: stop.isCurrent ? ScreenMetrics.ringCurrent : ScreenMetrics.ringStarted
                )
            }
            TopicGlyph(key: stop.topic.key, strand: stop.topic.strand, size: iconSize, muted: stop.state == .comingSoon)
        }
        .frame(width: diameter, height: diameter)
        .paperSurface(fill, shadow: shadow, in: Circle())
        .overlay(alignment: .bottomTrailing) {
            if stop.state == .done {
                Seal(icon: .check, size: .medium, tone: .correct, animated: stampsSeal, delay: revealDelay + ScreenMetrics.stopSealDelay)
                    .offset(x: ScreenMetrics.stopSealOffset.width, y: ScreenMetrics.stopSealOffset.height)
                    .allowsHitTesting(false)
            }
        }
        .overlay(alignment: discOnLeft ? .topLeading : .topTrailing) {
            if stop.isCurrent {
                // "Em đang ở đây": on the screen-edge side of the disc, popped in once.
                AvatarArt(avatar: avatar, size: ScreenMetrics.stopAvatarArt)
                    .frame(width: ScreenMetrics.stopAvatarDisc, height: ScreenMetrics.stopAvatarDisc)
                    .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, in: Circle())
                    .offset(
                        x: discOnLeft ? -ScreenMetrics.stopAvatarOffset.width : ScreenMetrics.stopAvatarOffset.width,
                        y: -ScreenMetrics.stopAvatarOffset.height
                    )
                    .motion(Tokens.Motion.Preset.pop, delay: ScreenMetrics.stopAvatarDelay)
                    .allowsHitTesting(false)
            }
        }
        .accessibilityHidden(true)
    }

    private var showsRing: Bool {
        if stop.isCurrent { return true }
        if case .inProgress = stop.state { return true }
        return false
    }

    private var iconSize: CGFloat {
        let sizes = style == .winding ? ScreenMetrics.stopIcon : ScreenMetrics.stopIconTrail
        if stop.isCurrent { return sizes.current }
        if case .inProgress = stop.state { return sizes.started }
        return sizes.open
    }

    private var fill: Color {
        stop.state == .comingSoon ? Tokens.Role.surfaceInactive : Tokens.Role.surfacePaper
    }

    private var shadow: Tokens.Shadow {
        if stop.isCurrent { return Tokens.Shadow.offsetAccent }
        switch stop.state {
        case .done: return Tokens.Shadow.offsetCorrect
        case .comingSoon: return Tokens.Shadow.paper2
        case .inProgress, .notStarted: return Tokens.Shadow.paper3
        }
    }

    private static func piece(_ state: ProgressSquares.StepState) -> LessonRing.Piece {
        switch state {
        case .done: .done
        case .current: .next
        case .upcoming: .todo
        }
    }
}

/// The 0–3 stars of a topic done (13pt, vàng hoè for each one, giấy lõm deep for the rest).
/// Decorative: the row reads the count.
private struct TopicStars: View {
    let count: Int

    var body: some View {
        HStack(spacing: ScreenMetrics.stopStarGap) {
            ForEach(0..<3, id: \.self) { index in
                PaperIconView(
                    .star, size: ScreenMetrics.stopStar,
                    color: index < count ? Tokens.Role.stateCurrent : Tokens.Palette.giayLomDeep
                )
            }
        }
        .accessibilityHidden(true)
    }
}

// MARK: - iPad sidebar (spec 11)

/// The stages of the journey on the iPad sidebar ("Chặng 1 · 1/5 xong"): a stage scrolls the map in
/// the content column to its post.
struct JourneySegmentList: View {
    let segments: [JourneySegment]
    let select: (JourneySegment) -> Void
    @Environment(\.ageGroup) private var ageGroup

    var body: some View {
        VStack(alignment: .leading, spacing: ScreenMetrics.sidebarSegmentGap) {
            ForEach(segments) { segment in
                Button {
                    select(segment)
                } label: {
                    HStack(spacing: Tokens.Space.s12) {
                        MilestonePost(number: segment.number)
                        VStack(alignment: .leading, spacing: ScreenMetrics.markLineGap) {
                            Text("home.journey.segment \(segment.number)")
                                .typography(Tokens.Typography.itemTitle)
                            Text("home.journey.segment_done \(segment.doneCount) \(segment.topicCount)")
                                .typography(Tokens.Typography.captionS)
                                .foregroundStyle(Tokens.Role.textSecondary)
                        }
                        Spacer(minLength: 0)
                    }
                    .foregroundStyle(Tokens.Role.textPrimary)
                    .frame(maxWidth: .infinity, minHeight: ageGroup.touchTarget, alignment: .leading)
                    .contentShape(Rectangle())
                }
                .buttonStyle(.paperPress)
                .accessibilityLabel(Text("home.journey.segment_a11y \(segment.number) \(segment.doneCount) \(segment.topicCount)"))
                .accessibilityIdentifier("home.sidebar.segment.\(segment.number)")
            }
        }
    }
}
