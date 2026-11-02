import DesignSystem
import LessonPlayer
import SwiftUI

@main
struct ScienceKidsApp: App {
    /// Made once per process (the profile file is read, and with `-SKResetProfile` deleted, once).
    @State private var app = AppModel.live(options: .current)

    var body: some Scene {
        WindowGroup {
            RootView(options: .current, app: app)
        }
    }
}

/// Picks the first screen (B7.6) and sets what every screen reads: `LayoutMetrics` for the
/// window's width and size class (B7.10), the age group of the world being played, the Dynamic
/// Type cap (B7.8), and the voice player (SK-016). Opens the content once; the voice stops when
/// the app leaves the foreground.
struct RootView: View {
    let options: LaunchOptions
    let app: AppModel
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        firstScreen
            .layoutMetricsFromContainer()
            .environment(\.ageGroup, Tokens.AgeGroup(rawValue: BundledContent.world.rawValue) ?? .discoverer)
            .environment(\.reduceMotionOverride, options.reducesMotion)
            .environment(\.speechPlayer, app.speech)
            .dynamicTypeSize(...Tokens.Typography.DynamicType.maxCategory)
            .overlay(alignment: .topLeading) { probe }
            .task {
                await app.loadContent()
                await app.syncNow()
                #if DEBUG
                if options.resendLastAttempt > 0 { await app.resendLastAttempt(times: options.resendLastAttempt) }
                #endif
            }
            .onChange(of: scenePhase) { _, phase in
                if phase == .active {
                    Task { await app.syncNow() }
                } else {
                    app.speech.stop()
                }
            }
    }

    @ViewBuilder private var probe: some View {
        #if DEBUG
        if options.showsAudioProbe { AudioProbe(speech: app.speech) }
        if options.showsSyncProbe { SyncProbe(app: app) }
        #endif
    }

    @ViewBuilder private var firstScreen: some View {
        #if DEBUG
        if options.showsGallery {
            GalleryView(scrollTarget: options.galleryScrollTarget)
        } else {
            flow
        }
        #else
        flow
        #endif
    }

    /// No profile: Welcome → Profile. A profile: Home, once the content is open.
    @ViewBuilder private var flow: some View {
        if let profile = app.profile {
            switch app.content {
            case .ready:
                MainFlow(app: app, profile: profile)
            case .loading:
                // Reading the bundled pack takes a few milliseconds: a plain điệp screen.
                Tokens.Role.bgScreen.ignoresSafeArea()
            case .failed:
                ContentErrorScreen { Task { await app.loadContent() } }
            }
        } else {
            OnboardingFlow(model: app.onboarding) { try app.createProfile($0) }
        }
    }
}
