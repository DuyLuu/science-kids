import DesignSystem
import Testing
@testable import ScienceKids

/// SK-008: debug launch arguments (Debug configuration, which is what the test action builds).
@Suite struct LaunchOptionsTests {
    @Test func galleryNeedsTheArgument() {
        #expect(!LaunchOptions(arguments: ["ScienceKids"]).showsGallery)
        #expect(LaunchOptions(arguments: ["ScienceKids", "-SKGallery", "YES"]).showsGallery)
        #expect(LaunchOptions(arguments: ["ScienceKids", "-SKGallery", "1"]).showsGallery)
        #expect(!LaunchOptions(arguments: ["ScienceKids", "-SKGallery", "NO"]).showsGallery)
        #expect(!LaunchOptions(arguments: ["ScienceKids", "-SKGallery"]).showsGallery, "value missing")
    }

    @Test func reduceMotionAndScrollTarget() {
        let options = LaunchOptions(arguments: ["app", "-SKGallery", "YES", "-SKReduceMotion", "true", "-SKGalleryScrollTo", "motion"])
        #expect(options.reducesMotion)
        #expect(options.galleryScrollTarget == "motion")
        #expect(GallerySection(rawValue: "motion") == .motion)
        #expect(!LaunchOptions(arguments: ["app"]).reducesMotion)
        #expect(LaunchOptions(arguments: ["app"]).galleryScrollTarget == nil)
    }

    /// The test host runs without `-SKGallery`, so the app opens on its normal first screen.
    @Test func testHostOpensNormally() {
        #expect(!LaunchOptions.current.showsGallery)
        #expect(!LaunchOptions.current.reducesMotion)
        #expect(!LaunchOptions.current.resetsProfile)
    }

    /// SK-011: `-SKResetProfile YES` starts from Welcome as after a fresh install.
    @Test func resetProfile() {
        #expect(LaunchOptions(arguments: ["app", "-SKResetProfile", "YES"]).resetsProfile)
        #expect(!LaunchOptions(arguments: ["app", "-SKResetProfile", "NO"]).resetsProfile)
        #expect(!LaunchOptions(arguments: ["app"]).resetsProfile)
    }

    /// SK-016: the audio probe and "VoiceOver is on" are off unless asked.
    @Test func audioProbeAndVoiceOver() {
        let options = LaunchOptions(arguments: ["app", "-SKAudioProbe", "YES", "-SKAssumeVoiceOver", "1"])
        #expect(options.showsAudioProbe)
        #expect(options.assumesVoiceOver)
        #expect(!LaunchOptions(arguments: ["app"]).showsAudioProbe)
        #expect(!LaunchOptions(arguments: ["app"]).assumesVoiceOver)
        #expect(!LaunchOptions.current.showsAudioProbe)
        #expect(!LaunchOptions.current.assumesVoiceOver)
    }
}
