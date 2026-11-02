import AudioKit
import ContentKit
import ContentModel
import Foundation
import LessonPlayer
import os

/// The content the app plays, and where it came from (SK-016).
struct AppContent: Sendable {
    enum Source: Equatable, Sendable {
        /// The pack of content-cli, checked against its manifest; has the voice clips.
        case pack(contentVersion: String)
        /// The schema fixtures, when the build has no pack (no audio).
        case fixtures
    }

    let library: ContentLibrary
    let source: Source
    /// `rules` of the pack manifest, or `rules.json` of the bundle with the fixtures.
    let rulesData: Data?
    /// The pack, for its clips and topic versions; `nil` with the fixtures.
    let pack: ContentPack?

    /// Scoring and XP rules of an age group (B4.4: never in code).
    func rules(for ageGroup: Topic.AgeGroup) -> LessonRules? {
        guard let rulesData else {
            BundledContent.log.error("no rules in the content")
            return nil
        }
        do {
            return try LessonRules.load(from: rulesData, ageGroup: ageGroup.rawValue)
        } catch {
            BundledContent.log.error("rules unreadable: \(String(describing: error), privacy: .public)")
            return nil
        }
    }

    /// `content_version` of an attempt at a lesson of this topic: the topic pack's version.
    func contentVersion(of topicID: UUID) -> String? {
        pack?.topicVersion(for: topicID)
    }

    /// The pack's clips for `SpeechPlayer`, checked asset by asset; `nil` with the fixtures.
    var clips: (any ClipLoader)? {
        pack.map(PackClips.init)
    }
}

/// Loading the content, then what the screens can show.
enum ContentState: Sendable {
    case loading
    case ready(AppContent)
    /// The pack is in the app but could not be used (checksum, unreadable manifest…). The reason
    /// goes to the log; the screen says it in words for parents.
    case failed(reason: String)

    var ready: AppContent? {
        if case .ready(let content) = self { return content }
        return nil
    }
}

/// The pack's assets as clips for `SpeechPlayer`: every clip read is checked first (size, sha256).
struct PackClips: ClipLoader {
    let pack: ContentPack

    func clipData(for hash: String) async throws -> Data {
        try await pack.assetData(for: hash)
    }
}

/// What the trial build bundles (SK-016):
/// - `pack/`: the content pack of content-cli (SK-015), copied by the "Embed content pack" build
///   phase when `content/.build/pack` exists. The app reads it through `ContentPack`, which checks
///   `pack.json` and each clip against the manifest.
/// - `valid/`: the schema fixtures (folder reference, SK-011), read only when the build has no
///   pack: the lesson plays, without audio. The build log then has a warning.
enum BundledContent {
    /// Name of the pack folder in the bundle (`scripts/embed-content-pack.sh`).
    static let packFolderName = "pack"
    /// Name of the fixtures folder reference in the bundle (the last path component in `project.yml`).
    static let folderName = "valid"

    static let log = Logger(subsystem: Bundle.main.bundleIdentifier ?? "ScienceKids", category: "content")

    /// The trial plays the Discoverer world whatever the grade (B18 #14: other worlds show
    /// "sắp ra mắt" and the child tries Discoverer). The profile still stores its own age group.
    static let world: Topic.AgeGroup = .discoverer

    /// Lessons a topic is planned to have, by topic id, while the content has no such field.
    /// Only the count: lesson titles are never made up (SK-011, open question 2 → default).
    ///
    /// TODO(SK-015/SK-016): proposal to dev/PM: the manifest's topic entry gets `lesson_count`
    /// (or the schema gets `topic.lesson_count`); then this table goes.
    static let plannedLessonCounts: [UUID: Int] = [
        // an-uong-lanh-manh: five lessons (content/discoverer/an-uong-lanh-manh/_topic.md, "Ghi chú").
        UUID(uuidString: "d3a514ef-02cd-4386-a358-f01e425a10f8")!: 5,
    ]

    /// The pack if the bundle has one, else the fixtures.
    ///
    /// A pack that is there but fails its checks is not replaced by the fixtures: the app says
    /// the lessons cannot open (`failed`). A topic of the pack that fails is left out with a log
    /// line; if no topic is left, that is a failure too.
    static func load(bundle: Bundle = .main) async -> ContentState {
        guard let root = bundle.url(forResource: packFolderName, withExtension: nil) else {
            log.warning("no content pack in the app: playing the schema fixtures, without audio")
            return .ready(fixtures(bundle: bundle))
        }
        let appVersion = bundle.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        do {
            let pack = try await ContentPack.load(from: DirectoryPackSource(root: root), appVersion: appVersion)
            if pack.library.topics.isEmpty, !pack.rejected.isEmpty {
                let reason = pack.rejected.map(\.description).joined(separator: "; ")
                log.error("content pack has no topic to open: \(reason, privacy: .public)")
                return .failed(reason: reason)
            }
            return .ready(AppContent(
                library: pack.library, source: .pack(contentVersion: pack.manifest.contentVersion),
                rulesData: pack.rulesData, pack: pack
            ))
        } catch {
            log.error("content pack not opened: \(error.description, privacy: .public)")
            return .failed(reason: error.description)
        }
    }

    /// The fixtures folder of the bundle, with `rules.json`.
    static func fixtures(bundle: Bundle = .main) -> AppContent {
        AppContent(library: loadFixtures(bundle: bundle), source: .fixtures, rulesData: bundledRules(bundle: bundle), pack: nil)
    }

    static func loadFixtures(bundle: Bundle = .main) -> ContentLibrary {
        guard let root = bundle.url(forResource: folderName, withExtension: nil) else {
            log.error("bundled content folder \(folderName, privacy: .public) missing")
            return .empty
        }
        return LocalContentLibrary.load(from: root).library
    }

    /// `content/rules.json` in the bundle (`project.yml`), for the fixtures.
    static func bundledRules(bundle: Bundle = .main) -> Data? {
        guard let url = bundle.url(forResource: "rules", withExtension: "json") else {
            log.error("rules.json missing from the bundle")
            return nil
        }
        return try? Data(contentsOf: url)
    }

    /// Number of lessons the topic shows: the planned count, never fewer than the lessons it has.
    static func lessonCount(of topic: TopicContent) -> Int {
        max(topic.lessons.count, plannedLessonCounts[topic.topic.id] ?? topic.lessons.count)
    }
}
