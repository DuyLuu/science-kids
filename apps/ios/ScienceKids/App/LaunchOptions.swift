import Foundation
import Profiles

/// Debug switches read from launch arguments (`xcrun simctl launch … -SKGallery YES`).
/// Read from `ProcessInfo.arguments`, not `UserDefaults`, so no required-reason API is used
/// (PrivacyInfo.xcprivacy stays empty). Release builds ignore them.
struct LaunchOptions: Equatable {
    /// `-SKGallery YES`: open the DesignSystem gallery instead of the first screen (SK-008).
    var showsGallery = false
    /// `-SKReduceMotion YES`: turn every motion preset off, as the system Reduce Motion setting
    /// does (for UI tests, which cannot flip the system setting).
    var reducesMotion = false
    /// `-SKGalleryScrollTo <section>`: open the gallery scrolled to a section (`buttons`, `motion`…),
    /// so a screenshot can be taken from the command line.
    var galleryScrollTarget: String?
    /// `-SKResetProfile YES`: delete the saved child profile at launch, so the app opens on Welcome
    /// as after a fresh install (SK-011 UI tests, screenshots).
    var resetsProfile = false
    /// `-SKAudioProbe YES`: an invisible accessibility element `debug.audio` whose value is what
    /// the voice player did (JSON), for the SK-016 UI tests.
    var showsAudioProbe = false
    /// `-SKAssumeVoiceOver YES`: act as if VoiceOver were on (no autoplay); the simulator has no
    /// VoiceOver (SK-016).
    var assumesVoiceOver = false
    /// `-SKSyncOff YES`: no server (UI tests that are not about sync, so they make no guest
    /// users). Also on when the app is the host of the unit tests (SK-022).
    var syncOff = false
    /// `-SKResendLastAttempt <n>`: after the launch sync, send the last finished attempt `n` more
    /// times (SK-022 T2).
    var resendLastAttempt = 0
    /// `-SKSyncProbe YES`: an invisible accessibility element `debug.sync` with the sync state (JSON).
    var showsSyncProbe = false
    /// `-SKSyncUnreachable YES`: the server address is replaced by one that does not resolve, so
    /// every call fails like a device without network (SK-022 T2 on the simulator, which cannot
    /// cut its own network). The real Keychain session and queue are used.
    var syncUnreachable = false
    /// `-SKContentFolder <absolute path>`: play the content files of a folder on the Mac (the
    /// shape of `packages/content-schema/fixtures/valid`) instead of the bundle's pack or fixtures,
    /// without audio. For trying content the bundle does not have (SK-033: word cards with
    /// pictures) without touching `packages/`.
    var contentFolder: String?
    /// `-SKContentPack <absolute path>`: open a content pack built on the Mac (the folder that holds
    /// `catalog/v1/manifest.json`) instead of the bundle's, with every check of the bundled pack.
    /// For trying a pack with pictures (SK-033) before it is embedded. `-SKContentFolder` wins
    /// when both are given.
    var contentPack: String?
    /// `-SKOpenLesson <lesson id>`: once the content is open (and a profile exists), open that
    /// lesson as if picked on its topic. For screenshots and UI tests of a lesson the journey puts
    /// far down the map (SK-040: the Explorer test lesson of `apps/ios/TestContent`).
    var openLesson: UUID?
    /// `-SKTestProfile YES` (or a language mode: `bilingual`, `en_first`, `vi_first`): when the
    /// device has no child profile at launch, save a test profile (Lớp 3, Discoverer, that language;
    /// `YES` is Song ngữ) before the first screen, so a UI test on a fresh install skips Welcome and
    /// Profile (SK-047, tester 16/11). A saved profile is kept as it is. With `-SKResetProfile YES`
    /// every launch starts from a clean test profile.
    var testProfile: LanguageMode?

    init(arguments: [String], environment: [String: String] = [:]) {
        #if DEBUG
        showsGallery = Self.flag("-SKGallery", in: arguments)
        reducesMotion = Self.flag("-SKReduceMotion", in: arguments)
        galleryScrollTarget = Self.value("-SKGalleryScrollTo", in: arguments)
        resetsProfile = Self.flag("-SKResetProfile", in: arguments)
        showsAudioProbe = Self.flag("-SKAudioProbe", in: arguments)
        assumesVoiceOver = Self.flag("-SKAssumeVoiceOver", in: arguments)
        syncOff = Self.flag("-SKSyncOff", in: arguments) || environment["XCTestConfigurationFilePath"] != nil
        resendLastAttempt = Self.value("-SKResendLastAttempt", in: arguments).flatMap(Int.init) ?? 0
        showsSyncProbe = Self.flag("-SKSyncProbe", in: arguments)
        syncUnreachable = Self.flag("-SKSyncUnreachable", in: arguments)
        contentFolder = Self.value("-SKContentFolder", in: arguments)
        contentPack = Self.value("-SKContentPack", in: arguments)
        openLesson = Self.value("-SKOpenLesson", in: arguments).flatMap(UUID.init(uuidString:))
        testProfile = Self.value("-SKTestProfile", in: arguments).flatMap { value in
            Self.flag("-SKTestProfile", in: arguments) ? .bilingual : LanguageMode(rawValue: value.lowercased())
        }
        #endif
    }

    static let current = LaunchOptions(arguments: ProcessInfo.processInfo.arguments, environment: ProcessInfo.processInfo.environment)

    /// `-Name YES` (also `1`, `true`), the NSArgumentDomain spelling of a boolean default.
    static func flag(_ name: String, in arguments: [String]) -> Bool {
        guard let value = value(name, in: arguments) else { return false }
        return ["yes", "1", "true"].contains(value.lowercased())
    }

    /// The argument after `name`, if any.
    static func value(_ name: String, in arguments: [String]) -> String? {
        guard let index = arguments.firstIndex(of: name), index + 1 < arguments.count else { return nil }
        return arguments[index + 1]
    }
}
