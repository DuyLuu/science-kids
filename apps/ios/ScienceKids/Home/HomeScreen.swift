import ContentKit
import ContentModel
import DesignSystem
import LessonPlayer
import Profiles
import SwiftUI

/// Màn 4 · Trang chủ (canvas `Discoverer-Home`): greeting, "Học tiếp" card, the journey of the
/// topics the content has (plus "Sắp có thêm chủ đề"), bottom strip. Cards, Badges and Words are
/// not built yet: their tabs show a "sắp có" page.
///
/// SK-013, regular width (canvas `Discoverer-Home-iPad`, layout A chosen by Duy 29/10): two
/// columns. The paper sidebar (`layout.home_sidebar_a`, 340) holds the four tabs and the journey;
/// the content column holds the greeting, chips and "Học tiếp", or the "sắp có" page of a tab.
/// Compact (iPhone, Split View 1/3, Slide Over) keeps the phone Home with its bottom strip.
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
                case .cards, .badges, .words:
                    ComingSoonPage(tab: app.homeTab)
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

    var body: some View {
        HStack(spacing: 0) {
            HomeSidebar(app: app, profile: profile)
                .frame(width: sidebarWidth)
                .zIndex(1)
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: ScreenMetrics.homeColumnGap) {
                    switch app.homeTab {
                    case .journey:
                        HomeHeader(app: app, profile: profile)
                            .reveal(order: 0)
                        if let target = LessonList.continueTarget(in: app.journeyTopics) {
                            ContinueCard(app: app, profile: profile, topic: target.topic, slot: target.slot, lesson: target.lesson)
                                .reveal(order: 1)
                        }
                    case .cards, .badges, .words:
                        ComingSoonContent(tab: app.homeTab)
                    }
                }
                .padding(ScreenMetrics.homeColumnPadding)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .scrollIndicators(.hidden)
            .environment(\.layoutMetrics, LayoutMetrics(widthClass: .compact, containerWidth: metrics.homeColumnWidth, ageGroup: metrics.ageGroup))
            .id(app.homeTab)
        }
        .foregroundStyle(Tokens.Role.textPrimary)
        .background(Tokens.Role.bgScreen.ignoresSafeArea())
    }
}

/// The paper sidebar of Trang chủ iPad (canvas layout A): the four tabs as rows, then the journey.
/// Torn along its trailing edge, with the frame's side shadow.
private struct HomeSidebar: View {
    @Bindable var app: AppModel
    let profile: ChildProfile

    var body: some View {
        let topics = app.journeyTopics
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
                        Text("home.journey.title \(Grade.ukYear(for: profile.grade))")
                            .typography(Tokens.Typography.title)
                            .accessibilityAddTraits(.isHeader)
                        Text("home.journey.count \(topics.count)")
                            .typography(Tokens.Typography.caption)
                            .foregroundStyle(Tokens.Role.textSecondary)
                    }
                    .reveal(order: 1)
                    if topics.isEmpty {
                        Text("home.empty")
                            .typography(Tokens.Typography.body)
                            .foregroundStyle(Tokens.Role.textSecondary)
                    }
                    VStack(alignment: .leading, spacing: ScreenMetrics.sidebarJourneyGap) {
                        ForEach(Array(topics.enumerated()), id: \.element.id) { index, topic in
                            JourneyTopicRow(topic: topic, index: index, isCurrent: index == 0, mode: profile.languageMode) {
                                app.openTopic(topic.id)
                            }
                            .reveal(order: 2 + index)
                        }
                        MoreTopicsRow(index: topics.count)
                            .reveal(order: 2 + topics.count)
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

    var body: some View {
        let topics = app.journeyTopics
        PaperFrame(scrolls: true) {
            VStack(alignment: .leading, spacing: ScreenMetrics.homeGap) {
                HomeHeader(app: app, profile: profile)
                    .reveal(order: 0)
                if let target = LessonList.continueTarget(in: topics) {
                    ContinueCard(app: app, profile: profile, topic: target.topic, slot: target.slot, lesson: target.lesson)
                        .reveal(order: 1)
                }
                HStack(alignment: .firstTextBaseline) {
                    Text("home.journey.title \(Grade.ukYear(for: profile.grade))")
                        .typography(Tokens.Typography.title)
                        .accessibilityAddTraits(.isHeader)
                    Spacer(minLength: Tokens.Space.s8)
                    Text("home.journey.count \(topics.count)")
                        .typography(Tokens.Typography.caption)
                        .foregroundStyle(Tokens.Role.textSecondary)
                }
                .reveal(order: 2)
                if topics.isEmpty {
                    Text("home.empty")
                        .typography(Tokens.Typography.body)
                        .foregroundStyle(Tokens.Role.textSecondary)
                }
                VStack(alignment: .leading, spacing: ScreenMetrics.journeyGap) {
                    ForEach(Array(topics.enumerated()), id: \.element.id) { index, topic in
                        JourneyTopicRow(
                            topic: topic,
                            index: index,
                            isCurrent: index == 0,
                            mode: profile.languageMode
                        ) {
                            app.openTopic(topic.id)
                        }
                        .reveal(order: 3 + index)
                    }
                    MoreTopicsRow(index: topics.count)
                        .reveal(order: 3 + topics.count)
                }
            }
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
        }
    }

    /// The world the trial plays (Discoverer), not the profile's own age group (B18 #14).
    private var worldName: LocalizedStringKey {
        switch BundledContent.world {
        case .explorer: "world.explorer"
        case .scientist: "world.scientist"
        default: "world.discoverer"
        }
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

/// "Học tiếp" card: topic, lesson n/count with its title, squares, minutes, play button (the
/// screen's one looping motion, `nudge`). Art: a plate with the topic glyph (no topic art yet).
private struct ContinueCard: View {
    let app: AppModel
    let profile: ChildProfile
    let topic: TopicContent
    let slot: LessonSlot
    let lesson: Lesson
    @Environment(\.ageGroup) private var ageGroup

    var body: some View {
        let mode = profile.languageMode
        let count = BundledContent.lessonCount(of: topic)
        let shape = RoundedRectangle(cornerRadius: ageGroup.radius, style: .continuous)
        VStack(alignment: .leading, spacing: ScreenMetrics.cardGap) {
            PaperTag(Text(topic.topic.isFree ? "home.continue_free" : "home.continue"), style: .cut(eyebrow: true))
            Text(verbatim: mode.name(topic.topic.title))
                .typography(Tokens.Typography.titleL)
                .padding(.trailing, ScreenMetrics.cardTitleTrailing)
                .fixedSize(horizontal: false, vertical: true)
            Text("home.continue.lesson \(slot.number) \(count) \(mode.name(lesson.title))")
                .typography(Tokens.Typography.bodyStrong)
                .foregroundStyle(Tokens.Role.textSecondary)
                .fixedSize(horizontal: false, vertical: true)
            HStack(spacing: Tokens.Space.s12) {
                VStack(alignment: .leading, spacing: Tokens.Space.s4) {
                    ProgressSquares(
                        count: count,
                        current: slot.number - 1,
                        squareSize: PaperMetrics.progressSquareSmall,
                        accessibilityLabel: Text("topic.progress_a11y \(slot.number) \(count)")
                    )
                    Text("home.continue.progress \(0) \(count) \(lesson.estMinutes)")
                        .typography(Tokens.Typography.caption)
                        .foregroundStyle(Tokens.Role.textSecondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Button {
                    app.openLesson(topicID: topic.id, lessonID: lesson.id)
                } label: {
                    PaperPlayDisc(size: PaperMetrics.playDiscLarge)
                }
                .buttonStyle(.paperPress)
                .accessibilityLabel(Text("home.continue.start \(slot.number)"))
                .accessibilityIdentifier("home.start_lesson")
                .motion(Tokens.Motion.Preset.nudge)
            }
            .padding(.top, Tokens.Space.s4)
        }
        .padding(ScreenMetrics.cardPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(alignment: .topTrailing) {
            TopicPlate(strand: topic.topic.strand, size: ScreenMetrics.cardArt)
                .offset(x: ScreenMetrics.cardArtOffset.width, y: ScreenMetrics.cardArtOffset.height)
        }
        .clipShape(shape)
        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper3, in: shape)
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("home.continue")
    }
}

/// A topic on the journey: tilted stop with the glyph, title, level and state. The whole row is
/// the button to the Topic screen.
private struct JourneyTopicRow: View {
    let topic: TopicContent
    let index: Int
    let isCurrent: Bool
    let mode: LanguageMode
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: ScreenMetrics.journeyRowGap) {
                PaperDisc(isCurrent ? .current : .open, tilt: PaperDisc<EmptyView>.tilt(at: index)) {
                    TopicGlyph(strand: topic.topic.strand, size: ScreenMetrics.journeyGlyphCurrent)
                }
                VStack(alignment: .leading, spacing: 1) {
                    Text(verbatim: mode.name(topic.topic.title))
                        .typography(Tokens.Typography.itemTitle)
                        .foregroundStyle(Tokens.Role.textPrimary)
                    Group {
                        if isCurrent {
                            Text("home.journey.current \(topic.topic.level)")
                                .foregroundStyle(Tokens.Role.textAccent)
                        } else {
                            Text("home.journey.open \(topic.topic.level)")
                                .foregroundStyle(Tokens.Role.textSecondary)
                        }
                    }
                    .typography(Tokens.Typography.captionS)
                }
                .multilineTextAlignment(.leading)
                Spacer(minLength: 0)
            }
            .frame(minHeight: PaperMetrics.journeyDisc)
            .padding(.leading, PaperDisc<EmptyView>.indent(at: index))
        }
        .buttonStyle(.paperPress)
        .accessibilityIdentifier("home.topic.\(topic.topic.slug)")
    }
}

/// Last stop while the pack has only some topics: locked, not a button (SK-011 default:
/// no made-up topic names).
private struct MoreTopicsRow: View {
    let index: Int

    var body: some View {
        HStack(spacing: ScreenMetrics.journeyRowGap) {
            PaperDisc(.locked, tilt: PaperDisc<EmptyView>.tilt(at: index)) {
                PaperIconView(.more, size: PaperMetrics.journeyGlyph, color: Tokens.Role.textSecondary)
            }
            Text("home.journey.more")
                .typography(Tokens.Typography.itemTitle)
                .foregroundStyle(Tokens.Role.textSecondary)
            Spacer(minLength: 0)
        }
        .frame(minHeight: PaperMetrics.journeyDisc)
        .padding(.leading, PaperDisc<EmptyView>.indent(at: index))
        .accessibilityElement(children: .combine)
        .accessibilityIdentifier("home.more_topics")
    }
}

// MARK: - Tabs not built yet

/// Cards, Badges, Words: title and a "sắp có" note, nothing to break (SK-011 scope).
private struct ComingSoonPage: View {
    let tab: HomeTab

    var body: some View {
        PaperFrame(scrolls: true) {
            ComingSoonContent(tab: tab)
        }
        .id(tab)
    }
}

/// The title and note of a tab not built yet (phone page, iPad content column).
private struct ComingSoonContent: View {
    let tab: HomeTab

    var body: some View {
            VStack(alignment: .leading, spacing: ScreenMetrics.homeGap) {
                Text(title)
                    .typography(Tokens.Typography.title)
                    .accessibilityAddTraits(.isHeader)
                    .accessibilityIdentifier("soon.title")
                    .reveal(order: 0)
                PaperCard {
                    VStack(alignment: .leading, spacing: Tokens.Space.s10) {
                        PaperTag(Text("soon.tag"), style: .cut(eyebrow: true))
                        Text(message)
                            .typography(Tokens.Typography.body)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .reveal(order: 1)
            }
    }

    private var title: LocalizedStringKey {
        switch tab {
        case .cards: "soon.cards.title"
        case .badges: "soon.badges.title"
        case .words, .journey: "soon.words.title"
        }
    }

    private var message: LocalizedStringKey {
        switch tab {
        case .cards: "soon.cards.body"
        case .badges: "soon.badges.body"
        case .words, .journey: "soon.words.body"
        }
    }
}
