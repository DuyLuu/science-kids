import AudioKit
import ContentKit
import ContentModel
import DesignSystem
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
    /// `syllabus.json` of the bundle (SK-030); `nil` if missing or unreadable (logged): the
    /// journeys then show the content's topics alone.
    let syllabus: Syllabus?
    /// Every topic of each age group, the content laid over the syllabus (`Journey`), made once.
    let journeys: [Topic.AgeGroup: [JourneyTopic]]
    /// The pack's pictures, read, checked and decoded on demand (SK-033); `nil` with the fixtures
    /// (every picture draws its stand-in art).
    let pictures: PictureStore?

    init(library: ContentLibrary, source: Source, rulesData: Data?, pack: ContentPack?, syllabus: Syllabus?) {
        self.library = library
        self.source = source
        self.rulesData = rulesData
        self.pack = pack
        self.syllabus = syllabus
        self.journeys = Journey.all(syllabus: syllabus, library: library)
        self.pictures = pack.map { PictureStore(loader: PackPictures(pack: $0)) }
    }

    /// The journey of an age group, by topic number.
    func journey(for ageGroup: Topic.AgeGroup) -> [JourneyTopic] {
        journeys[ageGroup] ?? []
    }

    /// A journey topic by its key, in any group (the Topic route).
    func journeyTopic(key: String) -> JourneyTopic? {
        for group in Topic.AgeGroup.known {
            if let topic = journey(for: group).first(where: { $0.key == key }) { return topic }
        }
        return nil
    }

    /// Where a written lesson sits on the journey: its number and its topic's lesson count
    /// ("Bài 2/10" in the lesson header).
    func journeyPlace(topicID: UUID, lessonID: UUID) -> (number: Int, count: Int)? {
        for group in Topic.AgeGroup.known {
            for topic in journey(for: group) where topic.content?.id == topicID {
                if let lesson = topic.lessons.first(where: { $0.lesson?.id == lessonID }) {
                    return (lesson.number, topic.lessons.count)
                }
            }
        }
        return nil
    }

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

    /// Every picture of the pack with its credit, for the "Image credits" screen (SK-033); empty
    /// with the fixtures or a pack without pictures.
    var imageCredits: [PackManifest.AssetEntry] {
        pack?.images ?? []
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

/// The pack's images for `PictureStore` (SK-033): only assets of `kind: "image"`, each checked
/// first (size, sha256), like the clips.
struct PackPictures: PictureLoader {
    let pack: ContentPack

    func hasPicture(_ hash: String) -> Bool {
        pack.hasImage(hash)
    }

    func pictureData(for hash: String) async throws -> Data {
        try await pack.imageData(for: hash)
    }
}

/// What the trial build bundles (SK-016):
/// - `pack/`: the content pack of content-cli (SK-015), copied by the "Embed content pack" build
///   phase when `content/.build/pack` exists. The app reads it through `ContentPack`, which checks
///   `pack.json` and each clip against the manifest.
/// - `valid/`: the schema fixtures (folder reference, SK-011), read only when the build has no
///   pack: the lesson plays, without audio. The build log then has a warning.
/// - `syllabus.json`: every topic and lesson of the approved syllabus (SK-030), read in place from
///   `content/syllabus.json`; the journeys lay the pack (or the fixtures) over it.
enum BundledContent {
    /// Name of the pack folder in the bundle (`scripts/embed-content-pack.sh`).
    static let packFolderName = "pack"
    /// Name of the fixtures folder reference in the bundle (the last path component in `project.yml`).
    static let folderName = "valid"

    static let log = Logger(subsystem: Bundle.main.bundleIdentifier ?? "ScienceKids", category: "content")

    /// Name of the syllabus in the bundle (`content/syllabus.json`, `project.yml`).
    static let syllabusName = "syllabus"

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
        return await load(packAt: root, bundle: bundle)
    }

    /// The pack in the folder `root` (the bundle's `pack/`, or with `-SKContentPack` a pack built
    /// on the Mac), checked the same way, with the bundle's syllabus.
    static func load(packAt root: URL, bundle: Bundle = .main) async -> ContentState {
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
                rulesData: pack.rulesData, pack: pack, syllabus: bundledSyllabus(bundle: bundle)
            ))
        } catch {
            log.error("content pack not opened: \(error.description, privacy: .public)")
            return .failed(reason: error.description)
        }
    }

    /// The fixtures folder of the bundle, with `rules.json`.
    static func fixtures(bundle: Bundle = .main) -> AppContent {
        AppContent(
            library: loadFixtures(bundle: bundle), source: .fixtures, rulesData: bundledRules(bundle: bundle),
            pack: nil, syllabus: bundledSyllabus(bundle: bundle)
        )
    }

    /// Debug (`-SKContentFolder`): the content files of a folder, read like the fixtures (no
    /// pack, no audio), with the bundle's rules and syllabus.
    static func folder(_ root: URL, bundle: Bundle = .main) -> AppContent {
        log.notice("playing the content folder \(root.path, privacy: .public) (launch argument)")
        return AppContent(
            library: LocalContentLibrary.load(from: root).library, source: .fixtures,
            rulesData: bundledRules(bundle: bundle), pack: nil, syllabus: bundledSyllabus(bundle: bundle)
        )
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

    /// `content/syllabus.json` in the bundle (`project.yml`, SK-030). Missing or unreadable: `nil`
    /// with a log line, and the journeys show the content's topics alone (no crash).
    static func bundledSyllabus(bundle: Bundle = .main) -> Syllabus? {
        guard let url = bundle.url(forResource: syllabusName, withExtension: "json") else {
            log.error("syllabus.json missing from the bundle: the journey shows the content's topics only")
            return nil
        }
        do {
            return try Syllabus.decode(from: Data(contentsOf: url))
        } catch let error as ContentDecodingError {
            log.error("syllabus.json does not decode: \(error.description, privacy: .public)")
        } catch {
            log.error("syllabus.json unreadable: \(error.localizedDescription, privacy: .public)")
        }
        return nil
    }
}
