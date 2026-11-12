import ContentKit
import ContentModel
import DesignSystem
import LessonPlayer
import Profiles
import SwiftUI

/// Tab Huy hiệu (SK-035, canvas `Discoverer-Badges`): the stars (best stars of each lesson), the
/// day streak with this week Monday to Sunday, and a badge per strand of the child's age group
/// ("Câu hỏi lớn"), its ring the topics of the strand done; a badge chosen shows its topics.
///
/// The stars and the streak are Home's (`HomeProgress`: the device's numbers, the server's once
/// it has settled them), so the tab and the Home chips always agree. No rule of its own. The
/// weekly challenge of the canvas is hidden (no rare card yet, SK-035).
struct BadgesTab: View {
    let app: AppModel
    let profile: ChildProfile
    /// The strand whose topics show under the badges; `nil`: the first started, else the first.
    @State private var selected: String?

    var body: some View {
        let home = app.homeProgress(for: profile)
        let badges = app.strandBadges(for: profile)
        let anyDone = app.lessonProgress(for: profile).bestStars.values.contains { $0 >= 1 }
        let chosen = badges.first { $0.id == selected } ?? badges.first { $0.state != .notStarted } ?? badges.first
        VStack(alignment: .leading, spacing: CollectionMetrics.pageGap) {
            CollectionHeader(title: Text("badges.title"), caption: nil, identifier: "badges.title") {
                CountChip(
                    value: "\(home.stars)",
                    unit: Text("badges.stars_unit"),
                    label: Text("badges.stars_a11y \(home.stars)"),
                    identifier: "badges.stars"
                ) {
                    PaperIconView(.star, size: CollectionMetrics.chipIcon, color: Tokens.Role.stateCurrent)
                }
            }
            .reveal(order: 0)
            if !anyDone {
                InviteCard(app: app, profile: profile, message: "badges.empty")
                    .reveal(order: 1)
            }
            StreakCard(
                days: home.streakDays, week: app.streakWeek(for: profile),
                restDaysPerWeek: app.streakRules(for: profile).restDaysPerWeek
            )
            .reveal(order: 2)
            HStack(alignment: .firstTextBaseline) {
                Text("badges.questions")
                    .typography(Tokens.Typography.title)
                    .accessibilityAddTraits(.isHeader)
                Spacer(minLength: Tokens.Space.s8)
                Text("badges.questions.hint")
                    .typography(Tokens.Typography.caption)
                    .foregroundStyle(Tokens.Role.textSecondary)
            }
            .reveal(order: 3)
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible(), spacing: CollectionMetrics.badgeColumnGap, alignment: .top), count: 3),
                spacing: CollectionMetrics.badgeRowGap
            ) {
                ForEach(Array(badges.enumerated()), id: \.element.id) { index, badge in
                    BadgeButton(badge: badge, isSelected: badge.id == chosen?.id) { selected = badge.id }
                        .reveal(order: 4 + index, step: Tokens.Motion.Stagger.stepDense)
                }
            }
            if let chosen {
                BadgeCaption(badge: chosen, mode: profile.languageMode)
                    .motion(Tokens.Motion.Preset.slide, delay: selected == nil ? Tokens.Motion.Stagger.maxDelay : 0)
                    .id(chosen.id)
            }
        }
    }
}

// MARK: - Streak

/// "Chuỗi 6 ngày", "Tuần này", the seven days, and the rest-day rule when the world has one.
private struct StreakCard: View {
    let days: Int
    let week: StreakWeek
    let restDaysPerWeek: Int

    var body: some View {
        PaperCard {
            VStack(alignment: .leading, spacing: Tokens.Space.s10) {
                HStack(spacing: Tokens.Space.s8) {
                    ZStack {
                        PaperIconView(.flame, size: CollectionMetrics.flameIcon, color: Tokens.Role.actionPrimary)
                        PaperIconView(.flameCore, size: CollectionMetrics.flameIcon, color: Tokens.Role.stateCurrent)
                    }
                    .paperDropShadow(Tokens.Shadow.paper1)
                    Group {
                        if days > 0 {
                            Text("badges.streak \(days)")
                        } else {
                            Text("badges.streak_none")
                        }
                    }
                    .typography(Tokens.Typography.title)
                    .accessibilityIdentifier("badges.streak")
                    Spacer(minLength: Tokens.Space.s8)
                    Text("badges.week")
                        .typography(Tokens.Typography.caption)
                        .foregroundStyle(Tokens.Role.textSecondary)
                }
                WeekStrip(week: week)
                if restDaysPerWeek > 0 {
                    Text("badges.week.rest_rule \(restDaysPerWeek)")
                        .typography(Tokens.Typography.caption)
                        .foregroundStyle(Tokens.Role.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

/// The seven days, Monday first: a tilted square per day, studied (đỏ son, tick), today (vàng
/// hoè, tick once studied), a rest day (paper, a leaf, "nghỉ"), missed (pressed in, a dash) or to
/// come (pressed in, empty).
/// One element for VoiceOver, every day read in order.
private struct WeekStrip: View {
    let week: StreakWeek

    var body: some View {
        HStack(alignment: .top, spacing: CollectionMetrics.dayGap) {
            ForEach(Array(week.days.enumerated()), id: \.element.id) { index, day in
                VStack(spacing: Tokens.Space.s2) {
                    square(day)
                        .rotationEffect(.degrees(CollectionMetrics.dayTilts[index % CollectionMetrics.dayTilts.count]))
                        .motion(Tokens.Motion.Preset.pop, delay: MotionStagger.delay(order: 3 + index, step: Tokens.Motion.Stagger.step))
                    Text(WeekdayText.short(day.weekday))
                        .typography(Tokens.Typography.captionS)
                        .foregroundStyle(day.isToday ? Tokens.Role.textPrimary : Tokens.Role.textSecondary)
                    // Its own width, past the day's column if need be ("hôm nay" is wider than a
                    // column on a phone; tester 10/11 #3: it was cut).
                    if day.isToday {
                        Text("badges.week.today")
                            .typography(ScreenMetrics.stopStatusStrong)
                            .fixedSize()
                            .frame(width: CollectionMetrics.daySquare)
                    } else if day.state == .rest {
                        Text("badges.week.rest")
                            .typography(ScreenMetrics.stopStatusStrong)
                            .foregroundStyle(Tokens.Palette.giDong)
                            .fixedSize()
                            .frame(width: CollectionMetrics.daySquare)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("badges.week_a11y \(spokenWeek)"))
        .accessibilityIdentifier("badges.week")
    }

    @ViewBuilder private func square(_ day: StreakWeek.Day) -> some View {
        let shape = RoundedRectangle(cornerRadius: Tokens.Radius.bar, style: .continuous)
        let side = CollectionMetrics.daySquare
        switch (day.state, day.isToday) {
        case (.studied, true):
            PaperIconView(.tick, size: CollectionMetrics.dayGlyph, color: Tokens.Role.textPrimary)
                .frame(width: side, height: side)
                .paperSurface(Tokens.Role.stateCurrent, shadow: Tokens.Shadow.paper2, in: shape)
        case (.studied, false):
            PaperIconView(.tick, size: CollectionMetrics.dayGlyph, color: Tokens.Role.textOnAccent)
                .frame(width: side, height: side)
                .paperSurface(Tokens.Role.actionPrimary, shadow: Tokens.Shadow.paper2, in: shape)
        case (_, true):
            Color.clear
                .frame(width: side, height: side)
                .paperSurface(Tokens.Role.stateCurrent, shadow: Tokens.Shadow.paper2, in: shape)
        case (.rest, false):
            PaperIconView(.leaf, size: CollectionMetrics.dayGlyph, color: Tokens.Palette.giDong)
                .frame(width: side, height: side)
                .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, in: shape)
        case (.missed, false):
            // A day gone by without a lesson has a short dash, so it differs from a day to come
            // by its shape, not only its paper (tester 10/11 #7).
            RoundedRectangle(cornerRadius: Tokens.Radius.bar, style: .continuous)
                .fill(Tokens.Role.textSecondary)
                .frame(width: CollectionMetrics.dayMissedMark.width, height: CollectionMetrics.dayMissedMark.height)
                .frame(width: side, height: side)
                .paperSurface(Tokens.Role.surfaceInactive, shadow: Tokens.Shadow.sunkenS, in: shape)
        case (.upcoming, false):
            Color.clear
                .frame(width: side, height: side)
                .paperSurface(Tokens.Role.surfaceSunken, shadow: Tokens.Shadow.sunkenS, in: shape)
        }
    }

    /// "thứ Hai: đã học; thứ Ba: chưa học; …; hôm nay, Chủ nhật: chưa tới".
    private var spokenWeek: String {
        week.days.map { day in
            let name = WeekdayText.long(day.weekday)
            let state: String = switch day.state {
            case .studied: String(localized: "badges.week.studied_a11y \(name)")
            case .rest: String(localized: "badges.week.rest_a11y \(name)")
            case .missed: String(localized: "badges.week.missed_a11y \(name)")
            case .upcoming: day.isToday
                ? String(localized: "badges.week.not_yet_a11y \(name)")
                : String(localized: "badges.week.upcoming_a11y \(name)")
            }
            return day.isToday ? String(localized: "badges.week.today_a11y \(state)") : state
        }
        .joined(separator: "; ")
    }
}

/// Names of the ISO weekdays (Monday 1 … Sunday 7) from the interface strings.
enum WeekdayText {
    static func short(_ weekday: Int) -> LocalizedStringKey {
        switch weekday {
        case 1: "badges.week.day.1"
        case 2: "badges.week.day.2"
        case 3: "badges.week.day.3"
        case 4: "badges.week.day.4"
        case 5: "badges.week.day.5"
        case 6: "badges.week.day.6"
        default: "badges.week.day.7"
        }
    }

    static func long(_ weekday: Int) -> String {
        switch weekday {
        case 1: String(localized: "badges.week.day_long.1")
        case 2: String(localized: "badges.week.day_long.2")
        case 3: String(localized: "badges.week.day_long.3")
        case 4: String(localized: "badges.week.day_long.4")
        case 5: String(localized: "badges.week.day_long.5")
        case 6: String(localized: "badges.week.day_long.6")
        default: String(localized: "badges.week.day_long.7")
        }
    }
}

// MARK: - Badges

/// A strand's badge: its disc with a ring of one piece per topic (vàng hoè when done), the
/// strand's icon, "x/n" once started, and its big question. A button: it shows the strand's
/// topics under the grid; the one chosen sits on a vàng hoè offset.
private struct BadgeButton: View {
    let badge: StrandBadge
    let isSelected: Bool
    let action: () -> Void
    @Environment(\.ageGroup) private var ageGroup

    var body: some View {
        Button(action: action) {
            VStack(spacing: Tokens.Space.s6) {
                BadgeDisc(badge: badge)
                    .background {
                        if isSelected {
                            Circle()
                                .fill(Tokens.Role.stateSelected)
                                .offset(CollectionMetrics.badgeSelectedOffset)
                        }
                    }
                    .overlay(alignment: .bottomTrailing) {
                        // On every badge, "0/n" before the strand is started too (SK-035 lượt 3).
                        Text(verbatim: "\(badge.doneCount)/\(badge.topicCount)")
                            .typography(PaperMetrics.markCorrectTypography, fixedBox: true)
                            .foregroundStyle(Tokens.Role.textOnAccent)
                            .padding(.horizontal, Tokens.Space.s4)
                            .padding(.vertical, Tokens.Space.s2)
                            .paperSurface(
                                badge.state == .done ? Tokens.Role.feedbackCorrect : Tokens.Role.stampMark,
                                shadow: Tokens.Shadow.stamp, cornerRadius: Tokens.Radius.tag
                            )
                            .rotationEffect(Tokens.Shape.tiltStamp)
                            .offset(CollectionMetrics.badgeSlipOffset)
                    }
                    .paperStateAnimation(value: isSelected)
                Text(StrandText.question(badge.strand))
                    .typography(Tokens.Typography.caption)
                    .foregroundStyle(Tokens.Role.textPrimary)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.vertical, Tokens.Space.s4)
            .frame(maxWidth: .infinity, minHeight: ageGroup.touchTarget)
            .contentShape(Rectangle())
        }
        .buttonStyle(.paperPress)
        .accessibilityLabel(Text(StrandText.question(badge.strand)) + Text(verbatim: ". ") + BadgeStatus.spoken(badge))
        .accessibilityAddTraits(isSelected ? .isSelected : [])
        .accessibilityIdentifier("badges.badge.\(badge.strand.rawValue)")
    }
}

/// The disc of a badge: paper, a ring of one piece per topic of the strand (vàng hoè when done),
/// the strand's icon on a paper centre. Before the strand is started it has no ring at all, and
/// the same paper disc and "0/n" slip (main session 10/11, SK-035 lượt 3: the giấy lõm disc and
/// faint icon of lượt 1–2 failed the contrast audit, tester #2). Filled pieces only, no stroke.
private struct BadgeDisc: View {
    let badge: StrandBadge

    var body: some View {
        let size = CollectionMetrics.badgeSize
        ZStack {
            Circle()
                .fill(Tokens.Role.surfacePaper)
                .paperDropShadow(Tokens.Shadow.paper2)
            if badge.state != .notStarted {
                ForEach(0..<badge.topicCount, id: \.self) { index in
                    RingPiece(index: index, count: badge.topicCount)
                        .fill(index < badge.doneCount ? Tokens.Role.stateCurrent : Tokens.Role.surfaceInactive)
                }
            }
            Circle()
                .fill(Tokens.Role.surfacePaper)
                .frame(width: size * CollectionMetrics.badgeCentre, height: size * CollectionMetrics.badgeCentre)
                .paperDropShadow(Tokens.Shadow.paper1)
            TopicGlyph(
                key: TopicIcon.strandIcons[badge.strand.rawValue] ?? badge.strand.rawValue,
                strand: badge.strand, size: CollectionMetrics.badgeIcon
            )
        }
        .frame(width: size, height: size)
        .accessibilityHidden(true)
    }
}

/// One piece of a badge's ring: the `index`-th of `count` equal arcs from the top, clockwise,
/// between the ring's inner and outer edge, with a small gap between pieces (none for one piece).
private struct RingPiece: SwiftUI.Shape {
    let index: Int
    let count: Int

    func path(in rect: CGRect) -> Path {
        let centre = CGPoint(x: rect.midX, y: rect.midY)
        let outer = min(rect.width, rect.height) / 2
        let inner = outer * CollectionMetrics.badgeRingInner
        let gap = count > 1 ? CollectionMetrics.badgeRingGap.radians : 0
        let sweep = 2 * Double.pi / Double(max(count, 1))
        let start = -Double.pi / 2 + sweep * Double(index) + gap / 2
        let end = start + sweep - gap
        var path = Path()
        path.addArc(center: centre, radius: outer, startAngle: .radians(start), endAngle: .radians(end), clockwise: false)
        path.addArc(center: centre, radius: inner, startAngle: .radians(end), endAngle: .radians(start), clockwise: true)
        path.closeSubpath()
        return path
    }
}

/// "Chưa bắt đầu", "Đang học · 1/2 chủ đề", "Đã xong · 2 chủ đề"; for VoiceOver without "·" and
/// "1/2", which it may read as a fraction or a date (content-editor 10/11).
enum BadgeStatus {
    static func text(_ badge: StrandBadge) -> Text {
        switch badge.state {
        case .notStarted: Text("badges.badge.not_started")
        case .started: Text("badges.badge.started \(badge.doneCount) \(badge.topicCount)")
        case .done: Text("badges.badge.done \(badge.topicCount)")
        }
    }

    static func spoken(_ badge: StrandBadge) -> Text {
        switch badge.state {
        case .notStarted: Text("badges.badge.not_started")
        case .started: Text("badges.badge.started_a11y \(badge.doneCount) \(badge.topicCount)")
        case .done: Text("badges.badge.done_a11y \(badge.topicCount)")
        }
    }
}

/// Under the grid: the badge chosen, its status, its strand's name and its topics (done ones in
/// lá tre), on a paper slip.
private struct BadgeCaption: View {
    let badge: StrandBadge
    let mode: LanguageMode

    var body: some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s4) {
            HStack(alignment: .firstTextBaseline, spacing: Tokens.Space.s8) {
                Circle()
                    .fill(Tokens.Role.textAccent)
                    .frame(width: CollectionMetrics.dot, height: CollectionMetrics.dot)
                    .alignmentGuide(.firstTextBaseline) { $0[.bottom] }
                Text(StrandText.question(badge.strand))
                    .typography(Tokens.Typography.itemTitle)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer(minLength: Tokens.Space.s8)
                BadgeStatus.text(badge)
                    .typography(ScreenMetrics.stopStatusStrong)
                    .foregroundStyle(badge.state == .notStarted ? Tokens.Role.textSecondary
                        : badge.state == .done ? Tokens.Role.textCorrect : Tokens.Role.textAccent)
                    .multilineTextAlignment(.trailing)
            }
            VStack(alignment: .leading, spacing: Tokens.Space.s2) {
                Text(StrandText.name(badge.strand))
                    .typography(Tokens.Typography.captionS)
                    .foregroundStyle(Tokens.Role.textSecondary)
                topics
                    .typography(Tokens.Typography.caption)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.leading, CollectionMetrics.captionIndent)
        }
        .padding(CollectionMetrics.captionPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.tag)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(
            Text(StrandText.question(badge.strand)) + Text(verbatim: ". ") + BadgeStatus.spoken(badge) + Text(verbatim: ". ")
                + Text(StrandText.name(badge.strand)) + Text(verbatim: ": ")
                + Text(verbatim: badge.stops.map { mode.name($0.topic.title) }.joined(separator: ", "))
        )
        .accessibilityIdentifier("badges.caption")
    }

    /// The strand's topic titles, " · " between them, the done ones in lá tre.
    private var topics: Text {
        badge.stops.enumerated().reduce(Text(verbatim: "")) { line, item in
            let (index, stop) = item
            let name = Text(verbatim: mode.name(stop.topic.title))
                .foregroundStyle(stop.state == .done ? Tokens.Role.textCorrect : Tokens.Role.textPrimary)
            return index == 0 ? name : line + Text(verbatim: " · ") + name
        }
    }
}
