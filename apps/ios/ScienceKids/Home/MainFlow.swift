import ContentKit
import ContentModel
import DesignSystem
import LessonPlayer
import Profiles
import SwiftUI

/// The app once a profile exists (B7.6): Home → Topic → Lesson on one `NavigationStack`; Home's
/// Từ vựng tab → a lesson's flashcards (SK-035).
struct MainFlow: View {
    @Bindable var app: AppModel
    let profile: ChildProfile

    var body: some View {
        NavigationStack(path: $app.path) {
            // SK-013: Home picks its own layout (two columns in regular width, the phone Home in compact).
            HomeScreen(app: app, profile: profile)
                .toolbar(.hidden, for: .navigationBar)
                .navigationDestination(for: AppRoute.self) { route in
                    destination(route)
                        .toolbar(.hidden, for: .navigationBar)
                }
        }
    }

    @ViewBuilder private func destination(_ route: AppRoute) -> some View {
        switch route {
        case .topic(let key):
            // SK-030: every topic of the syllabus opens, written or not.
            if let topic = app.journeyTopic(key: key) {
                TopicScreen(app: app, topic: topic, profile: profile)
            } else {
                MissingContentScreen(onBack: app.goBack)
            }
        case .lesson(let topicID, let lessonID):
            // SK-012: warmup → learn → play → quiz → reward. SK-013: in regular width every step sits
            // in the 600pt paper frame (`PaperFrame`, `LayoutMetrics`), bigger cells, same columns.
            if let content = app.content.ready,
               let topic = content.library.topic(id: topicID),
               let lesson = topic.lessons.first(where: { $0.id == lessonID }),
               let rules = content.rules(for: topic.topic.ageGroup) {
                LessonRoute(
                    app: app, topic: topic, lesson: lesson, rules: rules,
                    contentVersion: content.contentVersion(of: topic.id),
                    place: content.journeyPlace(topicID: topic.id, lessonID: lesson.id), profile: profile
                )
            } else {
                MissingContentScreen(onBack: app.goBack)
            }
        case .settings:
            SettingsScreen(app: app, profile: profile)
        case .imageCredits:
            ImageCreditsScreen(credits: app.imageCredits, onBack: app.goBack)
        case .words(let lessonID):
            // SK-035: the flashcards of one lesson's words, from the Từ vựng tab.
            if let deck = app.wordDeck(lessonID: lessonID) {
                WordDeckScreen(app: app, deck: deck, profile: profile)
            } else {
                MissingContentScreen(onBack: app.goBack)
            }
        }
    }
}

/// The lesson player on the `.lesson` route. The session is made once, when the route first shows
/// (it reads and writes the attempt file), not each time SwiftUI rebuilds the view.
private struct LessonRoute: View {
    let app: AppModel
    let topic: TopicContent
    let lesson: Lesson
    let rules: LessonRules
    /// Version of the topic's pack (`nil` with the fixtures), written on the attempt (B4.3).
    let contentVersion: String?
    /// The lesson's number and its topic's lesson count on the journey (SK-030: "Bài 2/10");
    /// `nil` falls back to its place among the written lessons.
    let place: (number: Int, count: Int)?
    let profile: ChildProfile

    @State private var session: LessonSession?

    var body: some View {
        Group {
            if let session {
                LessonPlayerView(
                    session: session,
                    heading: LessonHeading(
                        topicTitle: topic.topic.title,
                        lessonNumber: place?.number ?? (topic.lessons.firstIndex(of: lesson) ?? 0) + 1,
                        lessonCount: place?.count ?? topic.lessons.count
                    ),
                    onExit: { exit(finished: session.summary != nil) },
                    onShowCards: { app.showTab(.cards) }
                )
            } else {
                Tokens.Role.bgScreen.ignoresSafeArea()
            }
        }
        .onChange(of: session?.summary?.record.id) { _, finished in
            // SK-022: the attempt is in the history; queue it for the server now.
            if finished != nil, let record = session?.summary?.record { app.lessonFinished(record) }
        }
        .onDisappear {
            // Home and Topic show the lesson done or under way ("Đang học") when the child is back.
            app.lessonClosed()
        }
        .onAppear {
            guard session == nil else { return }
            session = LessonSession(
                lesson: lesson,
                rules: rules,
                context: .init(
                    childId: profile.id,
                    timeZone: TimeZone(identifier: profile.timezone) ?? .current,
                    languageMode: profile.languageMode,
                    voiceMode: profile.voiceMode,
                    // SK-026, SK-040: the screens follow the topic's age group, not the profile's.
                    presentation: LessonPresentation(ageGroup: topic.topic.ageGroup.rawValue)
                ),
                store: app.attempts,
                contentVersion: contentVersion
            )
        }
    }

    /// Finished: back to the journey. Half way: back to where the child came from (topic or Home).
    private func exit(finished: Bool) {
        if finished { app.showTab(.journey) } else { app.goBack() }
    }
}

/// A route whose topic or lesson is not in the content (should not happen with bundled content).
private struct MissingContentScreen: View {
    let onBack: () -> Void

    var body: some View {
        PaperFrame {
            VStack(alignment: .leading, spacing: Tokens.Space.s16) {
                ScreenHeader(back: .init(label: Text("topic.back"), action: onBack), title: Text("home.empty"))
            }
        }
    }
}
