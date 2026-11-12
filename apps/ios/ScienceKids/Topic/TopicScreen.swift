import AudioKit
import ContentKit
import ContentModel
import DesignSystem
import LessonPlayer
import Profiles
import SwiftUI

/// Màn 5 · Chủ đề (canvas `Discoverer-Topic`): title, big question, level, lesson count and the
/// lesson list.
///
/// SK-030: every lesson of the syllabus shows, numbered, none locked. A written lesson opens the
/// lesson route; a lesson not written yet says "Chưa có nội dung" and, tapped, a short note. A
/// topic with no content has no big question and no words chip: title, count and the list. Words
/// of a written topic and its lessons come from the content; the others from the syllabus.
///
/// 10/11: the rows read the child's progress (`JourneyStop`). A lesson done has the lá tre seal on
/// its number, "Đã xong" and its best stars; one under way says "Đang học"; the first written
/// lesson not done (the topic's "Học tiếp") has the vàng hoè piece and the screen's one looping
/// motion. The squares are the written lessons; "x/n bài" counts every lesson of the syllabus
/// (SK-035: a topic is done once all of them are).
struct TopicScreen: View {
    let app: AppModel
    let topic: JourneyTopic
    let profile: ChildProfile

    /// The unwritten lesson last tapped: its row shows the "đang soạn" note.
    @State private var noticeLesson: Int?
    /// The words chip was tapped before any lesson of the topic is done: its note shows.
    @State private var showsWordsNote = false

    var body: some View {
        let mode = profile.languageMode
        let count = topic.lessons.count
        let stop = JourneyStop(topic: topic, progress: app.lessonProgress(for: profile))
        PaperFrame(scrolls: true) {
            VStack(alignment: .leading, spacing: ScreenMetrics.topicGap) {
                ScreenHeader(
                    back: .init(label: Text("topic.back"), action: app.goBack),
                    title: Text(verbatim: mode.name(topic.title)),
                    caption: caption(mode),
                    titleIdentifier: "topic.title"
                )
                .reveal(order: 0)
                if showsHero {
                    hero(mode).reveal(order: 1)
                }
                progress(stop)
                    .reveal(order: 2)
                VStack(alignment: .leading, spacing: ScreenMetrics.lessonGap) {
                    ForEach(Array(topic.lessons.enumerated()), id: \.element.id) { index, item in
                        Group {
                            if let lesson = item.lesson, let content = topic.content {
                                OpenLessonRow(
                                    number: item.number, title: mode.name(item.title), minutes: lesson.estMinutes,
                                    state: stop.lessonStates[index], isNext: item.number == stop.next?.number
                                ) {
                                    app.openLesson(topicID: content.id, lessonID: lesson.id)
                                }
                            } else {
                                ComingSoonLessonRow(
                                    number: item.number, title: mode.name(item.title),
                                    showsNote: noticeLesson == item.number
                                ) {
                                    noticeLesson = item.number
                                    AccessibilityNotification.Announcement(String(localized: "topic.lesson.soon_note")).post()
                                }
                            }
                        }
                        .reveal(order: 3 + index)
                    }
                }
                let words = topic.wordCount
                if words > 0 {
                    VStack(alignment: .leading, spacing: Tokens.Space.s6) {
                        WordsChip(count: words) { openWords() }
                        if showsWordsNote {
                            Text("topic.words.note")
                                .typography(Tokens.Typography.caption)
                                .foregroundStyle(Tokens.Role.textAccent)
                                .fixedSize(horizontal: false, vertical: true)
                                .motion(Tokens.Motion.Preset.pop)
                                .accessibilityIdentifier("topic.words.note")
                        }
                    }
                    .reveal(order: 3 + count)
                }
            }
        }
    }

    /// The words chip (SK-035, tester 10/11 #15): the Từ vựng tab lists the decks of the lessons
    /// done, so before a lesson of the topic is done it would open empty. Then the chip only says
    /// what to do (a note, read by VoiceOver).
    private func openWords() {
        if app.wordDecks(for: profile).contains(where: { $0.topic.key == topic.key }) {
            app.showTab(.words)
        } else {
            showsWordsNote = true
            AccessibilityNotification.Announcement(String(localized: "topic.words.note")).post()
        }
    }

    /// The hero holds the Free tag and the big question, both from the content: a topic without
    /// them shows none (no empty art block).
    private var showsHero: Bool {
        topic.content?.topic.question != nil || showsFreeTag
    }

    /// SK-030: off while the paid plan is (`AppFeatures.paidPlanEnabled`).
    private var showsFreeTag: Bool {
        AppFeatures.paidPlanEnabled && (topic.content?.topic.isFree ?? false)
    }

    /// Squares and "1/5 bài", read as one element (10/11): one square per written lesson, done,
    /// "Học tiếp" or still to do, and lessons done of the topic's lessons (SK-035). A topic with nothing
    /// written says "Sắp có".
    @ViewBuilder private func progress(_ stop: JourneyStop) -> some View {
        if stop.playableCount == 0 {
            Text("topic.progress_soon")
                .typography(Tokens.Typography.caption)
                .foregroundStyle(Tokens.Role.textSecondary)
                .accessibilityIdentifier("topic.progress")
        } else {
            HStack(spacing: Tokens.Space.s12) {
                LessonSquares(
                    states: stop.squareStates,
                    sizes: [PaperMetrics.progressSquare, PaperMetrics.progressSquareSmall],
                    accessibilityLabel: Text(verbatim: "")
                )
                Text("topic.progress \(stop.doneCount) \(stop.lessonCount)")
                    .typography(Tokens.Typography.caption)
                    .foregroundStyle(Tokens.Role.textSecondary)
                    .fixedSize()
                    .layoutPriority(1)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Text("progress.lessons_a11y \(stop.doneCount) \(stop.lessonCount)"))
            .accessibilityIdentifier("topic.progress")
        }
    }

    /// "<title in the other language> · Mức 2" (none in Tiếng Anh trước), as on the canvas. A new
    /// topic has no level yet, an untranslated title no second name: `nil` when neither is there.
    private func caption(_ mode: LanguageMode) -> Text? {
        let second = mode.secondName(topic.title)
        guard let level = topic.level else { return second.map { Text(verbatim: $0) } }
        let levelText = Text("topic.level \(level)")
        guard let second else { return levelText }
        return Text(verbatim: second + " · ") + levelText
    }

    /// Free tag and the big question on a tilted slip; the topic art (a plate, no art in the
    /// content yet) bleeds off the right edge as on the canvas.
    private func hero(_ mode: LanguageMode) -> some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s16) {
            if showsFreeTag {
                PaperTag(Text("topic.free"), style: .cut(eyebrow: true))
                    .padding(.top, Tokens.Space.s4)
            }
            if let question = topic.content?.topic.question {
                questionSlip(question, mode: mode)
            }
        }
        .frame(maxWidth: .infinity, minHeight: ScreenMetrics.topicHeroMinHeight, alignment: .topLeading)
        .background(alignment: .topLeading) {
            TopicPlate(key: topic.key, strand: topic.strand, size: ScreenMetrics.topicArt)
                .offset(x: ScreenMetrics.topicArtOrigin.x, y: ScreenMetrics.topicArtOrigin.y)
        }
    }

    private func questionSlip(_ question: Spoken, mode: LanguageMode) -> some View {
        let listen = Utterance(id: "topic.question", [question], voice: profile.voiceMode)
        return VStack(alignment: .leading, spacing: Tokens.Space.s4) {
            Text(verbatim: mode.sentence(question))
                .typography(Tokens.Typography.sentence)
                .fixedSize(horizontal: false, vertical: true)
                .accessibilityIdentifier("topic.question")
            HStack(spacing: Tokens.Space.s8) {
                // SK-042: English and Tiếng Việt show one language; only "Cả hai" shows the other line.
                if mode.hidesSentenceSecondLanguage {
                    Spacer(minLength: 0)
                } else {
                    Text(verbatim: mode.secondSentence(question))
                        .typography(Tokens.Typography.body)
                        .foregroundStyle(Tokens.Role.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                // SK-016: plays the question in the profile's voice; without a clip for that voice
                // (the fixtures, `vi` before the VI voice) the button is left out.
                ListenButton(listen, label: "topic.listen")
            }
        }
        .padding(ScreenMetrics.questionPadding)
        .frame(width: ScreenMetrics.questionWidth, alignment: .leading)
        .background(alignment: .topLeading) {
            Circle()
                .fill(Tokens.Role.textAccent)
                .frame(width: ScreenMetrics.bulletDot, height: ScreenMetrics.bulletDot)
                .offset(x: ScreenMetrics.bulletOrigin.x, y: ScreenMetrics.bulletOrigin.y)
                .accessibilityHidden(true)
        }
        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.tag)
        .rotationEffect(Tokens.Shape.tiltTag)
    }
}

/// A written lesson: number on a đỏ son tile, title, its state, play disc. The topic's "Học tiếp"
/// lesson (`isNext`, the first written one not done) has the vàng hoè piece behind and the
/// screen's one looping motion; the others sit on plain paper. A lesson done has the lá tre seal
/// on its number, "Đã xong" and its best stars; it still plays again.
private struct OpenLessonRow: View {
    let number: Int
    let title: String
    let minutes: Int
    let state: JourneyLessonState
    let isNext: Bool
    let action: () -> Void
    @Environment(\.ageGroup) private var ageGroup
    @Environment(\.layoutMetrics) private var metrics

    var body: some View {
        Button(action: action) {
            HStack(spacing: Tokens.Space.s12) {
                NumberTile(number: number, isOpen: true)
                    .overlay(alignment: .bottomTrailing) {
                        if case .done = state {
                            DoneSeal()
                                .offset(x: ScreenMetrics.doneSealOffset.width, y: ScreenMetrics.doneSealOffset.height)
                        }
                    }
                VStack(alignment: .leading, spacing: Tokens.Space.s2) {
                    Text(verbatim: title)
                        .typography(Tokens.Typography.itemTitle)
                        .fixedSize(horizontal: false, vertical: true)
                    status
                        .typography(Tokens.Typography.caption)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                if isNext {
                    PaperPlayDisc(size: PaperMetrics.playDiscSmall)
                        .motion(Tokens.Motion.Preset.nudge)
                } else {
                    PaperPlayDisc(size: PaperMetrics.playDiscSmall)
                }
            }
            .foregroundStyle(Tokens.Role.textPrimary)
            .padding(ScreenMetrics.openRowPadding)
            .frame(maxWidth: .infinity, minHeight: PaperMetrics.lessonRowMinHeight, alignment: .leading)
            .paperSurface(
                Tokens.Role.surfacePaper,
                shadow: isNext ? Tokens.Shadow.offsetAccent : Tokens.Shadow.paper2,
                cornerRadius: ageGroup.radius
            )
        }
        .buttonStyle(.paperPress)
        .padding(.trailing, metrics.gridTrailingInset)
        .accessibilityLabel(accessibilityText)
        .accessibilityIdentifier("topic.lesson.\(number)")
    }

    /// "Đã xong" and the stars (lá tre); "~8 phút · Đang học" (đỏ son); "~8 phút · Học tiếp" on
    /// the topic's next lesson; "~8 phút" on the others.
    @ViewBuilder private var status: some View {
        switch state {
        case .done(let stars):
            HStack(spacing: Tokens.Space.s6) {
                Text("topic.lesson.done").foregroundStyle(Tokens.Role.textCorrect)
                LessonStars(count: stars)
            }
        case .inProgress:
            Text("topic.lesson.current \(minutes)").foregroundStyle(Tokens.Role.textAccent)
        case .notStarted, .comingSoon:
            if isNext {
                Text("topic.lesson.next \(minutes)").foregroundStyle(Tokens.Role.textAccent)
            } else {
                Text("topic.lesson.ready \(minutes)").foregroundStyle(Tokens.Role.textSecondary)
            }
        }
    }

    private var accessibilityText: Text {
        switch state {
        case .done(let stars):
            Text("topic.lesson.done_a11y \(number) \(title) \(stars)")
        case .inProgress:
            Text("topic.lesson.open_a11y \(number) \(title) \(minutes)")
        case .notStarted, .comingSoon:
            isNext
                ? Text("topic.lesson.next_a11y \(number) \(title) \(minutes)")
                : Text("topic.lesson.ready_a11y \(number) \(title) \(minutes)")
        }
    }
}

/// A lesson of the syllabus not written yet (SK-030): dull sunken paper, number, title,
/// "Chưa có nội dung". A button, so a tap says so gently: the note below the title.
private struct ComingSoonLessonRow: View {
    let number: Int
    let title: String
    let showsNote: Bool
    let action: () -> Void
    @Environment(\.ageGroup) private var ageGroup
    @Environment(\.layoutMetrics) private var metrics

    var body: some View {
        Button(action: action) {
            HStack(spacing: Tokens.Space.s12) {
                NumberTile(number: number, isOpen: false)
                VStack(alignment: .leading, spacing: 1) {
                    Text(verbatim: title)
                        .typography(Tokens.Typography.bodyStrong)
                        .fixedSize(horizontal: false, vertical: true)
                    Text("topic.lesson.soon")
                        .typography(Tokens.Typography.captionS)
                    if showsNote {
                        Text("topic.lesson.soon_note")
                            .typography(Tokens.Typography.caption)
                            .foregroundStyle(Tokens.Role.textAccent)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.top, Tokens.Space.s4)
                            .motion(Tokens.Motion.Preset.pop)
                    }
                }
                .foregroundStyle(Tokens.Role.textSecondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
            }
            .padding(ScreenMetrics.soonRowPadding)
            .frame(maxWidth: .infinity, minHeight: ageGroup.touchTarget, alignment: .leading)
            .paperSurface(Tokens.Role.surfaceInactive, shadow: Tokens.Shadow.sunken, cornerRadius: ageGroup.radius)
        }
        .buttonStyle(.paperPress)
        .padding(.trailing, metrics.gridTrailingInset)
        .accessibilityLabel(Text("topic.lesson.soon_a11y \(number) \(title)"))
        .accessibilityIdentifier("topic.lesson.soon.\(number)")
    }
}

/// Lesson number on a small tilted tile: đỏ son when written, điệp when not yet.
private struct NumberTile: View {
    let number: Int
    let isOpen: Bool

    var body: some View {
        Text(verbatim: "\(number)")
            .typography(Tokens.Typography.title, fixedBox: true)
            .foregroundStyle(isOpen ? Tokens.Role.textOnAccent : Tokens.Role.textSecondary)
            .frame(width: PaperMetrics.lessonNumberTile, height: PaperMetrics.lessonNumberTile)
            .paperSurface(
                isOpen ? Tokens.Role.actionPrimary : Tokens.Role.bgScreen,
                shadow: isOpen ? Tokens.Shadow.paper2 : Tokens.Shadow.paper1,
                cornerRadius: Tokens.Radius.tag
            )
            .rotationEffect(Tokens.Shape.tiltStamp)
            .accessibilityHidden(true)
    }
}

/// "Từ vựng chủ đề · n từ": goes to the Words tab once a lesson of the topic is done (SK-035).
private struct WordsChip: View {
    let count: Int
    let action: () -> Void
    @Environment(\.ageGroup) private var ageGroup

    var body: some View {
        Button(action: action) {
            HStack(spacing: Tokens.Space.s8) {
                Circle()
                    .fill(Tokens.Role.textAccent)
                    .frame(width: ScreenMetrics.bulletDot, height: ScreenMetrics.bulletDot)
                PaperIconView(.book, size: ScreenMetrics.wordsIcon)
                Text("topic.words \(count)")
                    .typography(Tokens.Typography.bodyStrong)
                    .foregroundStyle(Tokens.Role.textPrimary)
                PaperIconView(.arrowForward, size: ScreenMetrics.wordsArrow)
            }
            .padding(.leading, Tokens.Space.s12)
            .padding(.trailing, Tokens.Space.s14)
            .frame(minHeight: ageGroup.touchTarget)
            .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.tag)
        }
        .buttonStyle(.paperPress)
        .accessibilityIdentifier("topic.words")
    }
}
