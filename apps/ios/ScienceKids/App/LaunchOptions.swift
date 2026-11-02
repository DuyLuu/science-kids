import Foundation

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
