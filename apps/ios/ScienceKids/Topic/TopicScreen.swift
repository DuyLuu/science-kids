import AudioKit
import ContentKit
import ContentModel
import DesignSystem
import LessonPlayer
import Profiles
import SwiftUI

/// Màn 5 · Chủ đề (canvas `Discoverer-Topic`): title, big question, level, lesson count and the
/// lesson list. Lesson 1 opens the lesson route; the others are locked ("Mở sau bài n") and are
/// not buttons. Every word of the topic and its lessons comes from the content.
struct TopicScreen: View {
    let app: AppModel
    let topic: TopicContent
    let profile: ChildProfile

    @State private var showsSecondLanguage = false

    var body: some View {
        let mode = profile.languageMode
        let count = BundledContent.lessonCount(of: topic)
        let slots = LessonList.slots(for: topic, count: count)
        PaperFrame(scrolls: true) {
            VStack(alignment: .leading, spacing: ScreenMetrics.topicGap) {
                ScreenHeader(
                    back: .init(label: Text("topic.back"), action: app.goBack),
                    title: Text(verbatim: mode.name(topic.topic.title)),
                    caption: caption(mode),
                    titleIdentifier: "topic.title"
                )
                .reveal(order: 0)
                hero(mode).reveal(order: 1)
                HStack(spacing: Tokens.Space.s12) {
                    ProgressSquares(
                        count: count,
                        current: 0,
                        accessibilityLabel: Text("topic.progress_a11y \(1) \(count)")
                    )
                    Text("topic.progress \(0) \(count)")
                        .typography(Tokens.Typography.caption)
                        .foregroundStyle(Tokens.Role.textSecondary)
                        .accessibilityHidden(true) // the squares say it
                }
                .reveal(order: 2)
                VStack(alignment: .leading, spacing: ScreenMetrics.lessonGap) {
                    ForEach(Array(slots.enumerated()), id: \.element.id) { index, slot in
                        Group {
                            if slot.isOpen, let lesson = slot.lesson {
                                OpenLessonRow(number: slot.number, lesson: lesson, mode: mode) {
                                    app.openLesson(topicID: topic.id, lessonID: lesson.id)
                                }
                            } else {
                                LockedLessonRow(slot: slot, mode: mode)
                            }
                        }
                        .reveal(order: 3 + index)
                    }
                }
                let words = LessonList.wordCount(of: topic)
                if words > 0 {
                    WordsChip(count: words) { app.showTab(.words) }
                        .reveal(order: 3 + slots.count)
                }
            }
        }
    }

    /// "<title in the other language> · Mức 2" (none in Tiếng Anh trước), as on the canvas.
    private func caption(_ mode: LanguageMode) -> Text {
        let level = Text("topic.level \(topic.topic.level)")
        guard let second = mode.secondName(topic.topic.title) else { return level }
        return Text(verbatim: second + " · ") + level
    }

    /// Free tag and the big question on a tilted slip; the topic art (a plate, no art in the
    /// content yet) bleeds off the right edge as on the canvas.
    private func hero(_ mode: LanguageMode) -> some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s16) {
            if topic.topic.isFree {
                PaperTag(Text("topic.free"), style: .cut(eyebrow: true))
                    .padding(.top, Tokens.Space.s4)
            }
            if let question = topic.topic.question {
                questionSlip(question, mode: mode)
            }
        }
        .frame(maxWidth: .infinity, minHeight: ScreenMetrics.topicHeroMinHeight, alignment: .topLeading)
        .background(alignment: .topLeading) {
            TopicPlate(strand: topic.topic.strand, size: ScreenMetrics.topicArt)
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
                if mode.hidesSentenceSecondLanguage && !showsSecondLanguage {
                    Button {
                        showsSecondLanguage = true
                    } label: {
                        Text("topic.show_vi")
                            .typography(Tokens.Typography.caption)
                            .foregroundStyle(Tokens.Role.link)
                            .frame(minHeight: PaperMetrics.journeyDisc, alignment: .leading)
                    }
                    .buttonStyle(.paperPress)
                    .accessibilityIdentifier("topic.show_second_language")
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

/// The lesson the child can start: number on a đỏ son tile, title, minutes, play disc (the
/// screen's one looping motion); vàng hoè piece behind (current lesson).
private struct OpenLessonRow: View {
    let number: Int
    let lesson: Lesson
    let mode: LanguageMode
    let action: () -> Void
    @Environment(\.ageGroup) private var ageGroup
    @Environment(\.layoutMetrics) private var metrics

    var body: some View {
        let title = mode.name(lesson.title)
        Button(action: action) {
            HStack(spacing: Tokens.Space.s12) {
                NumberTile(number: number, isOpen: true)
                VStack(alignment: .leading, spacing: Tokens.Space.s2) {
                    Text(verbatim: title)
                        .typography(Tokens.Typography.itemTitle)
                        .fixedSize(horizontal: false, vertical: true)
                    Text("topic.lesson.current \(lesson.estMinutes)")
                        .typography(Tokens.Typography.caption)
                        .foregroundStyle(Tokens.Role.textAccent)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                PaperPlayDisc(size: PaperMetrics.playDiscSmall)
                    .motion(Tokens.Motion.Preset.nudge)
            }
            .foregroundStyle(Tokens.Role.textPrimary)
            .padding(ScreenMetrics.openRowPadding)
            .frame(maxWidth: .infinity, minHeight: PaperMetrics.lessonRowMinHeight, alignment: .leading)
            .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.offsetAccent, cornerRadius: ageGroup.radius)
        }
        .buttonStyle(.paperPress)
        .padding(.trailing, metrics.gridTrailingInset)
        .accessibilityLabel(Text("topic.lesson.open_a11y \(number) \(title) \(lesson.estMinutes)"))
        .accessibilityIdentifier("topic.lesson.\(number)")
    }
}

/// A lesson not open yet: dull sunken paper, number, title from the content if the lesson
/// exists (else "Bài n"), "Mở sau bài n − 1", lock. Not a button.
private struct LockedLessonRow: View {
    let slot: LessonSlot
    let mode: LanguageMode
    @Environment(\.ageGroup) private var ageGroup
    @Environment(\.layoutMetrics) private var metrics

    var body: some View {
        let after = slot.unlocksAfter ?? slot.number - 1
        HStack(spacing: Tokens.Space.s12) {
            NumberTile(number: slot.number, isOpen: false)
            VStack(alignment: .leading, spacing: 1) {
                Group {
                    if let lesson = slot.lesson {
                        Text(verbatim: mode.name(lesson.title))
                    } else {
                        Text("topic.lesson.number \(slot.number)")
                    }
                }
                .typography(Tokens.Typography.bodyStrong)
                Text("topic.lesson.locked \(after)")
                    .typography(Tokens.Typography.captionS)
            }
            .foregroundStyle(Tokens.Role.textSecondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            PaperIconView(.lock, size: ScreenMetrics.lessonLock, color: Tokens.Role.textSecondary)
        }
        .padding(ScreenMetrics.lockedRowPadding)
        .frame(maxWidth: .infinity, minHeight: ageGroup.touchTarget, alignment: .leading)
        .paperSurface(Tokens.Role.surfaceInactive, shadow: Tokens.Shadow.sunken, cornerRadius: ageGroup.radius)
        .padding(.trailing, metrics.gridTrailingInset)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("topic.lesson.locked_a11y \(slot.number) \(after)"))
        .accessibilityIdentifier("topic.lesson.locked.\(slot.number)")
    }
}

/// Lesson number on a small tilted tile: đỏ son when open, điệp when locked.
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

/// "Từ vựng chủ đề · n từ": goes to the Words tab (not built yet: "sắp có").
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
