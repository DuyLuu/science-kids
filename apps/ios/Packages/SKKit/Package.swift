// swift-tools-version: 6.0
// SKKit: the in-house modules of the Science Kids iOS app (technical-plan B7.1).
// One package, one target per module, each with its own test target.
// One external dependency, approved in docs/ios-test-build.md section 5: supabase-swift, only its
// Auth and PostgREST products, used by `Sync` alone (SK-022). Pinned to an exact version; the
// resolved versions of its own dependencies are kept in apps/ios/Package.resolved (bootstrap.sh).
import PackageDescription

let package = Package(
    name: "SKKit",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "DesignSystem", targets: ["DesignSystem"]),
        .library(name: "ContentModel", targets: ["ContentModel"]),
        .library(name: "LessonEngine", targets: ["LessonEngine"]),
        .library(name: "ContentKit", targets: ["ContentKit"]),
        .library(name: "LessonPlayer", targets: ["LessonPlayer"]),
        .library(name: "AudioKit", targets: ["AudioKit"]),
        .library(name: "Profiles", targets: ["Profiles"]),
        .library(name: "Sync", targets: ["Sync"]),
    ],
    dependencies: [
        .package(url: "https://github.com/supabase/supabase-swift.git", exact: "2.55.4"),
    ],
    targets: [
        // Style E tokens, paper components, motion presets, LayoutMetrics (SK-007, SK-008).
        .target(name: "DesignSystem"),
        // Hand-written Codable models matching content schema v1 (SK-009).
        .target(name: "ContentModel"),
        // Pure scoring rules: no I/O, no dependencies; checked against shared test vectors (SK-010).
        .target(name: "LessonEngine"),
        // Reads content: a folder of schema files (SK-011) or a content pack checked against its
        // manifest, sha256 and size of pack.json and of each asset (SK-016).
        .target(name: "ContentKit", dependencies: ["ContentModel"]),
        // Plays a lesson step by step (SK-012).
        .target(
            name: "LessonPlayer",
            dependencies: ["DesignSystem", "ContentModel", "LessonEngine", "AudioKit", "Profiles"]
        ),
        // EN / VI clip playback: one utterance at a time, AVAudioPlayer, session .ambient for now,
        // no autoplay under VoiceOver, preloading (SK-016).
        .target(name: "AudioKit"),
        // Child profile on the device: fields of `child_profiles` (B5.3), JSON file store,
        // language_mode → voice_mode suggestion (B4.1). Foundation only (SK-011).
        .target(name: "Profiles"),
        // Guest session, child profile on the server, offline queue of lesson attempts, home data
        // (SK-022). The only module that talks to the network.
        .target(
            name: "Sync",
            dependencies: [
                "Profiles",
                .product(name: "Auth", package: "supabase-swift"),
                .product(name: "PostgREST", package: "supabase-swift"),
            ]
        ),

        .testTarget(name: "DesignSystemTests", dependencies: ["DesignSystem"]),
        .testTarget(name: "ContentModelTests", dependencies: ["ContentModel"]),
        .testTarget(name: "LessonEngineTests", dependencies: ["LessonEngine"]),
        .testTarget(name: "ContentKitTests", dependencies: ["ContentKit"]),
        .testTarget(name: "LessonPlayerTests", dependencies: ["LessonPlayer", "LessonEngine", "ContentModel", "ContentKit", "Profiles", "AudioKit", "DesignSystem"]),
        .testTarget(name: "AudioKitTests", dependencies: ["AudioKit"]),
        .testTarget(name: "ProfilesTests", dependencies: ["Profiles"]),
        .testTarget(name: "SyncTests", dependencies: ["Sync", "Profiles"]),
    ]
)
