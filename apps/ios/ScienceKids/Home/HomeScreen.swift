import ContentKit
import ContentModel
import DesignSystem
import LessonPlayer
import Profiles
import SwiftUI

/// Màn 4 · Trang chủ (canvas `Discoverer-Home`): greeting, "Học tiếp" card, the journey, bottom
/// strip. SK-035: the Thẻ, Huy hiệu and Từ vựng tabs (`CardsTab`, `BadgesTab`, `WordsTab`) show
/// what the child has won and learnt, in the same phone page and iPad content column.
///
/// SK-030: the journey is every topic of the syllabus of one age group, by number, written or
/// not, none locked; it opens on the profile's own group and three chips show the others.
///
/// 10/11 (Duy: a topic finished showed no sign of it): every stop reads the child's progress
/// (`JourneyProgress`): "x/n bài" of the topic's lessons (SK-035: every lesson of the syllabus,
/// written or not), "Đã xong" with a seal when all are done,
/// "Sắp có" on dull paper when none is written. "Học tiếp" points at the first written lesson not
/// done of the group shown; all done, the card says so; nothing written, no card.
///
/// SK-034 (Duy 10/11: "phải nhìn như road map", phương án A): the journey is a road map
/// (`JourneyMap`): a winding road through the topics, a post per stage, the finish flag; every
/// topic has its own icon (`TopicGlyph`), "Học tiếp" shows it on its plate.
///
/// SK-013, regular width (canvas `Discoverer-Home-iPad`, layout A chosen by Duy 29/10): two
/// columns. The paper sidebar (`layout.home_sidebar_a`, 340) holds the four tabs, the journey's
/// title, the group chips and its stages; the content column holds the greeting, "Học tiếp" and
/// the map (at most 600 wide, centred; SK-034 spec 11), or another tab's page (as wide). A stage on
/// the sidebar scrolls the map to its post. Compact (iPhone, Split View 1/3, Slide Over) keeps the
/// phone Home with its bottom strip.
struct HomeScreen: View {
    @Bindable var app: AppModel
    let profile: ChildProfile
    @Environment(\.layoutMetrics) private var metrics

    var body: some View {
        if let sidebar = metrics.homeSidebarWidth {
            RegularHome(app: app, profile: profile, sidebarWidth: sidebar)
        } else {
            Group {
                switch app.homeTab {
                case .journey:
                    JourneyPage(app: app, profile: profile)
                case .cards:
                    CollectionPage { CardsTab(app: app, profile: profile) }.id(HomeTab.cards)
                case .badges:
                    CollectionPage { BadgesTab(app: app, profile: profile) }.id(HomeTab.badges)
                case .words:
                    CollectionPage { WordsTab(app: app, profile: profile) }.id(HomeTab.words)
                }
            }
            .safeAreaInset(edge: .bottom, spacing: 0) {
                BottomNavStrip(items: Self.tabs, selection: $app.homeTab, accessibilityLabel: Text("tab.navigation"))
            }
        }
    }

    static let tabs: [BottomNavItem<HomeTab>] = [
        BottomNavItem(id: .journey, icon: .journey, title: Text("tab.journey")),
        BottomNavItem(id: .cards, icon: .cards, title: Text("tab.cards")),
        BottomNavItem(id: .badges, icon: .badge, title: Text("tab.badges")),
        BottomNavItem(id: .words, icon: .book, title: Text("tab.words")),
    ]
}

// MARK: - Regular width (iPad)

/// Sidebar and content column side by side. The column reads compact metrics of its own width,
/// so its pieces keep their phone layout.
private struct RegularHome: View {
    @Bindable var app: AppModel
    let profile: ChildProfile
    let sidebarWidth: CGFloat
    @Environment(\.layoutMetrics) private var metrics
    @ReducedMotion private var reducedMotion

    var body: some View {
        let group = app.shownGroup(for: profile)
        let progress = app.journeyProgress(for: group, profile: profile)
        ScrollViewReader { reader in
            HStack(spacing: 0) {
                HomeSidebar(app: app, profile: profile, progress: progress) { segment in
                    show(segment, reader: reader)
                }
                .frame(width: sidebarWidth)
                .zIndex(1)
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: ScreenMetrics.homeColumnGap) {
                        switch app.homeTab {
                        case .journey:
                            HomeHeader(app: app, profile: profile)
                                .reveal(order: 0)
                            ContinueSlot(app: app, profile: profile, progress: progress)
                                .reveal(order: 1)
                            HomeJourneyMap(app: app, profile: profile, progress: progress)
                                .id(group)
                        case .cards:
                            CardsTab(app: app, profile: profile).collectionColumn()
                        case .badges:
                            BadgesTab(app: app, profile: profile).collectionColumn()
                        case .words:
                            WordsTab(app: app, profile: profile).collectionColumn()
                        }
                    }
                    .padding(ScreenMetrics.homeColumnPadding)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .scrollIndicators(.hidden)
                .environment(\.layoutMetrics, LayoutMetrics(widthClass: .compact, containerWidth: metrics.homeColumnWidth, ageGroup: metrics.ageGroup))
                .id(app.homeTab)
            }
        }
        .foregroundStyle(Tokens.Role.textPrimary)
        .background(Tokens.Role.bgScreen.ignoresSafeArea())
    }

    /// A stage on the sidebar: the journey tab, scrolled to the stage's post.
    private func show(_ segment: JourneySegment, reader: ScrollViewProxy) {
        let id = JourneyMapEntry.segmentID(segment.number)
        let animation = MotionPolicy.animation(.default, reduced: reducedMotion)
        if app.homeTab != .journey {
            app.homeTab = .journey
            Task { @MainActor in reader.scrollTo(id, anchor: .top) }
        } else {
            withAnimation(animation) { reader.scrollTo(id, anchor: .top) }
        }
    }
}

/// The paper sidebar of Trang chủ iPad (canvas layout A): the four tabs as rows, then the journey's
/// title, the group chips and the stages (SK-034 spec 11). Torn along its trailing edge, with the
/// frame's side shadow.
private struct HomeSidebar: View {
    @Bindable var app: AppModel
    let profile: ChildProfile
    let progress: JourneyProgress
    let select: (JourneySegment) -> Void

    var body: some View {
        let group = app.shownGroup(for: profile)
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: ScreenMetrics.sidebarGap) {
                VStack(alignment: .leading, spacing: ScreenMetrics.sidebarNavGap) {
                    ForEach(HomeScreen.tabs) { item in
                        SidebarNavRow(item: item, isCurrent: app.homeTab == item.id) { app.homeTab = item.id }
                    }
                }
                .accessibilityElement(children: .contain)
                .accessibilityLabel(Text("tab.navigation"))
                .reveal(order: 0)
                VStack(alignment: .leading, spacing: ScreenMetrics.sidebarJourneyGap) {
                    VStack(alignment: .leading, spacing: Tokens.Space.s2) {
                        JourneyTitle(group: group, profile: profile)
                        JourneyCount(progress: progress)
                    }
                    .reveal(order: 1)
                    GroupPicker(app: app, shown: group)
                        .reveal(order: 2)
                    if progress.stops.isEmpty {
                        Text("home.empty")
                            .typography(Tokens.Typography.body)
                            .foregroundStyle(Tokens.Role.textSecondary)
                    }
                    JourneySegmentList(segments: progress.segments, select: select)
                        .reveal(order: 3)
                        .id(group)
                    // SK-033: the credits of the pack's pictures, under the journey.
                    if !app.imageCredits.isEmpty {
                        ImageCreditsLink(action: app.openImageCredits)
                    }
                }
            }
            .padding(ScreenMetrics.sidebarPadding)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .scrollIndicators(.hidden)
        .background {
            TornEdgeTrailingShape()
                .fill(Tokens.Role.surfacePaper)
                .paperShadow(Tokens.Shadow.frameSides, in: TornEdgeTrailingShape())
                .ignoresSafeArea()
        }
    }
}

/// One tab as a sidebar row: the icon on its chip (vàng hoè when current, as the bottom strip)
/// and the name at 16pt (mặc định tạm, SK-004 open question), at least `sidebarRowHeight` tall.
private struct SidebarNavRow: View {
    let item: BottomNavItem<HomeTab>
    let isCurrent: Bool
    let action: () -> Void
    @Environment(\.ageGroup) private var ageGroup

    var body: some View {
        Button(action: action) {
            HStack(spacing: Tokens.Space.s12) {
                PaperIconView(item.icon, size: PaperMetrics.iconGlyphSize, color: Tokens.Role.textPrimary)
                    .frame(width: PaperMetrics.navChipWidth, height: PaperMetrics.navChipHeight)
                    .paperSurface(
                        isCurrent ? Tokens.Role.stateCurrent : .clear,
                        shadow: isCurrent ? Tokens.Shadow.paper2 : nil,
                        cornerRadius: Tokens.Radius.tag
                    )
                item.title
                    .typography(Tokens.Typography.itemTitle)
                    .foregroundStyle(isCurrent ? Tokens.Role.textPrimary : Tokens.Role.textSecondary)
                    .lineLimit(1)
                    .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                Spacer(minLength: 0)
            }
            .padding(.horizontal, Tokens.Space.s8)
            .frame(maxWidth: .infinity, minHeight: max(ScreenMetrics.sidebarRowHeight, ageGroup.touchTarget), alignment: .leading)
            .contentShape(Rectangle())
        }
        .buttonStyle(.paperPress)
        .accessibilityAddTraits(isCurrent ? .isSelected : [])
        .accessibilityIdentifier("tab.\(item.id.rawValue)")
    }
}

// MARK: - Journey tab

private struct JourneyPage: View {
    let app: AppModel
    let profile: ChildProfile
    @Environment(\.layoutMetrics) private var metrics

    var body: some View {
        let group = app.shownGroup(for: profile)
        let progress = app.journeyProgress(for: group, profile: profile)
        PaperFrame(scrolls: true) {
            VStack(alignment: .leading, spacing: ScreenMetrics.homeGap) {
                HomeHeader(app: app, profile: profile)
                    .reveal(order: 0)
                ContinueSlot(app: app, profile: profile, progress: progress)
                    .reveal(order: 1)
                HStack(alignment: .firstTextBaseline) {
                    JourneyTitle(group: group, profile: profile)
                    Spacer(minLength: Tokens.Space.s8)
                    JourneyCount(progress: progress)
                }
                .reveal(order: 2)
                GroupPicker(app: app, shown: group)
                    .reveal(order: 3)
                if progress.stops.isEmpty {
                    Text("home.empty")
                        .typography(Tokens.Typography.body)
                        .foregroundStyle(Tokens.Role.textSecondary)
                }
                // SK-034: the map runs edge to edge (spec 6: W = the screen, not the frame).
                HomeJourneyMap(app: app, profile: profile, progress: progress)
                    .padding(.leading, -metrics.contentInsets.leading)
                    .padding(.trailing, -metrics.contentInsets.trailing)
                    .id(group)
                // SK-033: the credits of the pack's pictures, under the journey.
                if !app.imageCredits.isEmpty {
                    ImageCreditsLink(action: app.openImageCredits)
                }
            }
        }
    }
}

/// The journey map of the group shown (SK-034), at most 600 wide and centred. Seals of topics
/// done since Home last showed them are stamped in; leaving the map marks them as shown.
private struct HomeJourneyMap: View {
    let app: AppModel
    let profile: ChildProfile
    let progress: JourneyProgress

    var body: some View {
        JourneyMap(
            progress: progress,
            mode: profile.languageMode,
            avatar: .of(profile.avatar),
            freshlyDone: app.freshlyDoneTopics(in: progress)
        ) { key in
            app.openTopic(key)
        }
        .frame(maxWidth: JourneyMapGeometry.maxWidth)
        .frame(maxWidth: .infinity)
        .onDisappear { app.markDoneShown(progress) }
    }
}

/// "Hành trình Year 3" on the profile's own group; "Hành trình Explorer" on another one.
private struct JourneyTitle: View {
    let group: Topic.AgeGroup
    let profile: ChildProfile

    var body: some View {
        Group {
            if group.rawValue == profile.ageGroup.rawValue {
                Text("home.journey.title \(Grade.ukYear(for: profile.grade))")
            } else {
                Text("home.journey.title_group \(Text(WorldName.key(group)))")
            }
        }
        .typography(Tokens.Typography.title)
        .accessibilityAddTraits(.isHeader)
        .accessibilityIdentifier("home.journey.title")
    }
}

/// "17 chủ đề" and, once a topic is started, "· 3 đã bắt đầu" (10/11: was "· dễ → khó", wrong
/// since the syllabus follows Oak's order, SK-030).
private struct JourneyCount: View {
    let progress: JourneyProgress

    var body: some View {
        let topics = progress.stops.count
        let started = progress.startedCount
        Group {
            if started > 0 {
                Text("home.journey.count \(topics)") + Text(verbatim: " · ") + Text("home.journey.count_started \(started)")
            } else {
                Text("home.journey.count \(topics)")
            }
        }
        .typography(Tokens.Typography.caption)
        .foregroundStyle(Tokens.Role.textSecondary)
        .accessibilityIdentifier("home.journey.count")
    }
}

/// The three age groups as chips (the profile screen's grade chips), the one shown chosen
/// (SK-030: Duy can look at every group's syllabus; the profile's own is the default).
private struct GroupPicker: View {
    let app: AppModel
    let shown: Topic.AgeGroup

    var body: some View {
        HStack(spacing: ScreenMetrics.chipGap) {
            ForEach(Topic.AgeGroup.known, id: \.self) { group in
                Button {
                    app.journeyGroup = group
                } label: {
                    Text(WorldName.key(group))
                        .typography(Tokens.Typography.label, fixedBox: true)
                        .lineLimit(1)
                        .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                }
                .buttonStyle(PaperChipStyle(isSelected: group == shown))
                .accessibilityIdentifier("home.group.\(group.rawValue)")
            }
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel(Text("home.groups_a11y"))
    }
}

/// Name of a learning world ("Explorer"…), from the interface strings.
enum WorldName {
    static func key(_ group: Topic.AgeGroup) -> LocalizedStringKey {
        switch group {
        case .explorer: "world.explorer"
        case .scientist: "world.scientist"
        default: "world.discoverer"
        }
    }
}

/// Avatar, "Chào Minh!", world and year; streak and stars chips (SK-022: from the device's lesson
/// history, settled by the server's `get_home` once nothing waits to be sent).
private struct HomeHeader: View {
    let app: AppModel
    let profile: ChildProfile

    private var progress: HomeProgress { app.homeProgress(for: profile) }
    private var streakDays: Int { progress.streakDays }
    private var stars: Int { progress.stars }

    var body: some View {
        HStack(spacing: Tokens.Space.s10) {
            AvatarArt(
                avatar: .of(profile.avatar),
                size: ScreenMetrics.homeAvatar,
                accessibilityLabel: Text("home.avatar_a11y \(profile.displayName)")
            )
            VStack(alignment: .leading, spacing: 1) {
                Text("home.greeting \(profile.displayName)")
                    .typography(Tokens.Typography.title)
                    .lineLimit(2)
                    .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                    .accessibilityAddTraits(.isHeader)
                    .accessibilityIdentifier("home.greeting")
                Text("home.subtitle \(Text(worldName)) \(Grade.ukYear(for: profile.grade))")
                    .typography(Tokens.Typography.caption)
                    .foregroundStyle(Tokens.Role.textSecondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            HeaderChip(value: streakDays, label: Text("home.streak_a11y \(streakDays)"), identifier: "home.streak") {
                ZStack {
                    PaperIconView(.flame, size: PaperMetrics.headerChipIcon, color: Tokens.Role.actionPrimary)
                    PaperIconView(.flameCore, size: PaperMetrics.headerChipIcon, color: Tokens.Role.stateCurrent)
                }
            } action: {
                app.showTab(.badges)
            }
            HeaderChip(value: stars, label: Text("home.stars_a11y \(stars)"), identifier: "home.stars") {
                PaperIconView(.star, size: PaperMetrics.headerChipIcon, color: Tokens.Role.stateCurrent)
            } action: {
                app.showTab(.badges)
            }
            // SK-042: Cài đặt (language of the profile).
            PaperIconButton(.gear, accessibilityLabel: Text("settings.open"), action: app.openSettings)
                .accessibilityIdentifier("home.settings")
        }
    }

    /// The profile's own world (SK-030; was the Discoverer trial world).
    private var worldName: LocalizedStringKey {
        WorldName.key(Topic.AgeGroup(rawValue: profile.ageGroup.rawValue))
    }
}

/// A chip of the header: 56pt, the touch target itself (SK-013: the iPad spec of SK-004 raised it
/// from the phone canvas's 44px, on the phone too).
private struct HeaderChip<Icon: View>: View {
    let value: Int
    let label: Text
    let identifier: String
    @ViewBuilder let icon: Icon
    let action: () -> Void
    @Environment(\.ageGroup) private var ageGroup

    var body: some View {
        Button(action: action) {
            HStack(spacing: ScreenMetrics.chipIconGap) {
                icon
                Text(verbatim: "\(value)")
                    .typography(Tokens.Typography.buttonS, fixedBox: true)
                    .foregroundStyle(Tokens.Role.textPrimary)
            }
            .padding(.leading, ScreenMetrics.chipPaddingLeading)
            .padding(.trailing, ScreenMetrics.chipPaddingTrailing)
            // SK-013 (SK-004 iPad spec, phone too): the chip itself is the 56pt touch target.
            .frame(minWidth: ageGroup.touchTarget, minHeight: ageGroup.touchTarget)
            .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.tag)
        }
        .buttonStyle(.paperPress)
        .accessibilityLabel(label)
        .accessibilityIdentifier(identifier)
    }
}

/// Under the header: the "Học tiếp" card, or the "all done" card when every written lesson of the
/// group shown is done, or nothing when the group has nothing written.
private struct ContinueSlot: View {
    let app: AppModel
    let profile: ChildProfile
    let progress: JourneyProgress

    var body: some View {
        if let next = progress.next, let stop = progress.stops.first(where: { $0.topic.key == next.topic.key }) {
            ContinueCard(app: app, profile: profile, stop: stop, lesson: next.lesson)
        } else if progress.allDone {
            AllDoneCard()
        }
    }
}

/// "Học tiếp" card: topic, lesson n/count with its title, squares, minutes, play button (the
/// screen's one looping motion, `nudge`). Art: a plate with the topic's icon (SK-034).
/// 10/11: the lesson is the first written one not done on the journey shown (`JourneyProgress`);
/// the squares are the topic's written lessons, done ones ticked; "x/n bài" counts all its lessons.
private struct ContinueCard: View {
    let app: AppModel
    let profile: ChildProfile
    let stop: JourneyStop
    let lesson: JourneyLesson
    @Environment(\.ageGroup) private var ageGroup

    private var topic: JourneyTopic { stop.topic }

    var body: some View {
        let mode = profile.languageMode
        let count = topic.lessons.count
        let shape = RoundedRectangle(cornerRadius: ageGroup.radius, style: .continuous)
        let isFree = AppFeatures.paidPlanEnabled && (topic.content?.topic.isFree ?? false)
        VStack(alignment: .leading, spacing: ScreenMetrics.cardGap) {
            PaperTag(Text(isFree ? "home.continue_free" : "home.continue"), style: .cut(eyebrow: true))
            Text(verbatim: mode.name(topic.title))
                .typography(Tokens.Typography.titleL)
                .padding(.trailing, ScreenMetrics.cardTitleTrailing)
                .fixedSize(horizontal: false, vertical: true)
            Text("home.continue.lesson \(lesson.number) \(count) \(mode.name(lesson.title))")
                .typography(Tokens.Typography.bodyStrong)
                .foregroundStyle(Tokens.Role.textSecondary)
                .fixedSize(horizontal: false, vertical: true)
            HStack(spacing: Tokens.Space.s12) {
                VStack(alignment: .leading, spacing: Tokens.Space.s4) {
                    LessonSquares(
                        states: stop.squareStates,
                        sizes: [PaperMetrics.progressSquareSmall],
                        accessibilityLabel: Text("progress.lessons_a11y \(stop.doneCount) \(stop.lessonCount)")
                    )
                    Text("home.continue.progress \(stop.doneCount) \(stop.lessonCount) \(lesson.lesson?.estMinutes ?? 0)")
                        .typography(Tokens.Typography.caption)
                        .foregroundStyle(Tokens.Role.textSecondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Button {
                    if let topicID = topic.content?.id, let lessonID = lesson.lesson?.id {
                        app.openLesson(topicID: topicID, lessonID: lessonID)
                    }
                } label: {
                    PaperPlayDisc(size: PaperMetrics.playDiscLarge)
                }
                .buttonStyle(.paperPress)
                .accessibilityLabel(Text("home.continue.start \(lesson.number)"))
                .accessibilityIdentifier("home.start_lesson")
                .motion(Tokens.Motion.Preset.nudge)
            }
            .padding(.top, Tokens.Space.s4)
        }
        .padding(ScreenMetrics.cardPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(alignment: .topTrailing) {
            TopicPlate(key: topic.key, strand: topic.strand, size: ScreenMetrics.cardArt)
                .offset(x: ScreenMetrics.cardArtOffset.width, y: ScreenMetrics.cardArtOffset.height)
        }
        .clipShape(shape)
        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper3, in: shape)
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("home.continue")
    }
}

/// Every written lesson of the group shown is done (10/11): instead of "Học tiếp", a card that
/// says so, with the lá tre seal stamped in.
private struct AllDoneCard: View {
    var body: some View {
        PaperCard {
            HStack(alignment: .top, spacing: Tokens.Space.s12) {
                VStack(alignment: .leading, spacing: Tokens.Space.s10) {
                    PaperTag(Text("home.all_done.tag"), style: .cut(eyebrow: true))
                    Text("home.all_done.body")
                        .typography(Tokens.Typography.body)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Seal(icon: .check, size: .large, tone: .correct)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityIdentifier("home.all_done")
    }
}
