import DesignSystem
import Profiles
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
        #expect(LaunchOptions.current.contentFolder == nil)
    }

    /// SK-033: `-SKContentFolder <path>` plays a folder of content files instead of the bundle.
    @Test func contentFolder() {
        let options = LaunchOptions(arguments: ["app", "-SKContentFolder", "/tmp/content/valid"])
        #expect(options.contentFolder == "/tmp/content/valid")
        #expect(LaunchOptions(arguments: ["app"]).contentFolder == nil)
        #expect(LaunchOptions(arguments: ["app", "-SKContentFolder"]).contentFolder == nil, "value missing")
    }

    /// SK-040: `-SKOpenLesson <lesson id>` opens a lesson once the content is ready.
    @Test func openLesson() {
        let id = "00000000-0000-4000-8000-0000000004B0"
        #expect(LaunchOptions(arguments: ["app", "-SKOpenLesson", id]).openLesson?.uuidString == id)
        #expect(LaunchOptions(arguments: ["app", "-SKOpenLesson", "not-an-id"]).openLesson == nil)
        #expect(LaunchOptions(arguments: ["app"]).openLesson == nil)
    }

    /// SK-047 (tester 16/11): `-SKTestProfile YES` or a language mode saves a test profile when
    /// there is none, so a UI test on a fresh install skips Welcome.
    @Test func testProfile() {
        #expect(LaunchOptions(arguments: ["app", "-SKTestProfile", "YES"]).testProfile == .bilingual)
        #expect(LaunchOptions(arguments: ["app", "-SKTestProfile", "1"]).testProfile == .bilingual)
        #expect(LaunchOptions(arguments: ["app", "-SKTestProfile", "en_first"]).testProfile == .enFirst)
        #expect(LaunchOptions(arguments: ["app", "-SKTestProfile", "vi_first"]).testProfile == .viFirst)
        #expect(LaunchOptions(arguments: ["app", "-SKTestProfile", "NO"]).testProfile == nil)
        #expect(LaunchOptions(arguments: ["app", "-SKTestProfile"]).testProfile == nil, "value missing")
        #expect(LaunchOptions(arguments: ["app"]).testProfile == nil)
        #expect(LaunchOptions.current.testProfile == nil)
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
