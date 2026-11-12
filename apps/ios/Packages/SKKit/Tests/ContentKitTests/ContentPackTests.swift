import ContentModel
import Foundation
import Testing
@testable import ContentKit

/// SK-016: `ContentPack` on a copy of a pack in the test's temporary directory.
///
/// Two packs, the same checks:
/// - **built**: a copy of `content/.build/pack` (content-cli `build`, SK-015) when it exists on
///   this machine; the tests that need it are skipped otherwise (the pack is not in git);
/// - **made**: a small pack the test writes from the schema fixtures (fake clips, real sha256),
///   so the checks run on every machine.
@Suite struct ContentPackTests {
    static let topicID = UUID(uuidString: "d3a514ef-02cd-4386-a358-f01e425a10f8")!
    static let lessonID = UUID(uuidString: "4b11eb40-9a47-4e5e-b4b5-bea60264ded3")!

    // MARK: Criterion 1: a good pack opens

    @Test(.enabled(if: TestPack.builtPack != nil)) func builtPackOpens() async throws {
        let pack = try TestPack.copyOfBuiltPack()
        defer { pack.remove() }
        try await Self.expectOpens(pack.root)
    }

    @Test func madePackOpens() async throws {
        let pack = try TestPack.made()
        defer { pack.remove() }
        try await Self.expectOpens(pack.root)
    }

    static func expectOpens(_ root: URL) async throws {
        let pack = try await ContentPack.load(from: DirectoryPackSource(root: root), appVersion: "0.1.0")
        #expect(pack.rejected.isEmpty, "\(pack.rejected)")
        let topic = try #require(pack.library.topic(id: topicID))
        #expect(topic.topic.title.vi == "Ăn uống lành mạnh")
        // Lesson 1 first; the built pack may hold more (9/11: also "Mâm cơm cân bằng", SK-030).
        #expect(topic.lessons.first?.id == lessonID)
        #expect(pack.library.lesson(id: lessonID)?.lesson.title.en == "What does food give us?")
        #expect(pack.topicVersion(for: topicID) == pack.manifest.topics.first { $0.id == topicID }?.version)
        // Rules of the manifest, the shape of content/rules.json.
        let rules = try #require(pack.rulesData)
        let object = try #require(try JSONSerialization.jsonObject(with: rules) as? [String: Any])
        #expect(object["discoverer"] != nil)
        // Every clip of the lesson title opens and is what its name says.
        let hash = try #require(topic.lessons.first?.title.audio?.en)
        let clip = try await pack.assetData(for: hash)
        #expect(ContentPack.sha256Hex(clip) == hash)
        let url = try await pack.assetURL(for: hash)
        #expect(url.lastPathComponent.hasPrefix(hash))
    }

    // MARK: Criterion 2: one byte of a clip changed → that asset is refused

    @Test(.enabled(if: TestPack.builtPack != nil)) func builtPackRefusesAChangedClip() async throws {
        let pack = try TestPack.copyOfBuiltPack()
        defer { pack.remove() }
        try await Self.expectChangedClipRefused(pack.root)
    }

    @Test func madePackRefusesAChangedClip() async throws {
        let pack = try TestPack.made()
        defer { pack.remove() }
        try await Self.expectChangedClipRefused(pack.root)
    }

    static func expectChangedClipRefused(_ root: URL) async throws {
        let source = DirectoryPackSource(root: root)
        let before = try await ContentPack.load(from: source, appVersion: nil)
        let lesson = try #require(before.library.lesson(id: lessonID)?.lesson)
        let changed = try #require(lesson.title.audio?.en)
        let other = try #require(lesson.objective.audio?.en)
        #expect(changed != other)
        let entry = try #require(before.manifest.assets.first { $0.sha256 == changed })
        try TestPack.flipOneByte(of: root.appendingPathComponent(entry.path))

        let pack = try await ContentPack.load(from: source, appVersion: nil)
        // The topic still opens: only the asset is refused, when it is asked for.
        #expect(pack.rejected.isEmpty)
        #expect(pack.library.topic(id: topicID) != nil)
        do {
            _ = try await pack.assetData(for: changed)
            Issue.record("a changed clip was accepted")
        } catch {
            guard case .mismatch(let path, let expectedSize, let actualSize, let expectedSHA, let actualSHA) = error else {
                Issue.record("expected .mismatch, got \(error)")
                return
            }
            #expect(path == entry.path)
            #expect(expectedSize == actualSize, "one byte changed, same size")
            #expect(expectedSHA == changed)
            #expect(actualSHA != changed)
            #expect(error.description.contains("sha256"), "\(error.description)")
        }
        await #expect(throws: ContentPackError.self) { _ = try await pack.assetURL(for: changed) }
        // The other clips are still served.
        let fine = try await pack.assetData(for: other)
        #expect(ContentPack.sha256Hex(fine) == other)
    }

    // MARK: Criterion 3: pack.json changed → the whole topic is refused, with a clear error

    @Test(.enabled(if: TestPack.builtPack != nil)) func builtPackRefusesAChangedPackJSON() async throws {
        let pack = try TestPack.copyOfBuiltPack()
        defer { pack.remove() }
        try await Self.expectChangedPackJSONRefused(pack.root)
    }

    @Test func madePackRefusesAChangedPackJSON() async throws {
        let pack = try TestPack.made()
        defer { pack.remove() }
        try await Self.expectChangedPackJSONRefused(pack.root)
    }

    static func expectChangedPackJSONRefused(_ root: URL) async throws {
        let source = DirectoryPackSource(root: root)
        // Ăn uống lành mạnh by id: the built pack holds more topics, in any order.
        let entry = try #require(try await ContentPack.load(from: source, appVersion: nil).manifest.topics.first { $0.id == topicID })
        try TestPack.flipOneByte(of: root.appendingPathComponent(entry.path))

        let pack = try await ContentPack.load(from: source, appVersion: nil)
        // The built pack has more than one topic: only the changed one is left out.
        #expect(pack.library.topic(id: entry.id) == nil, "no lesson of a changed pack.json opens")
        #expect(pack.library.lesson(id: lessonID) == nil)
        let rejected = try #require(pack.rejected.first)
        #expect(pack.rejected.count == 1)
        #expect(rejected.topicID == topicID)
        guard case .mismatch(let path, _, _, let expectedSHA, let actualSHA) = rejected.error else {
            Issue.record("expected .mismatch, got \(rejected.error)")
            return
        }
        #expect(path == entry.path)
        #expect(expectedSHA == entry.sha256)
        #expect(actualSHA != entry.sha256)
        // The error says which file, and what does not match.
        #expect(rejected.description.contains("an-uong-lanh-manh"), "\(rejected)")
        #expect(rejected.description.contains("pack.json"), "\(rejected)")
        #expect(rejected.description.contains("sha256"), "\(rejected)")

        // A byte added (size differs) is caught too, by its size.
        let made = try TestPack.made()
        defer { made.remove() }
        let madeEntry = try #require(try await ContentPack.load(from: DirectoryPackSource(root: made.root), appVersion: nil).manifest.topics.first)
        let file = made.root.appendingPathComponent(madeEntry.path)
        try (try Data(contentsOf: file) + Data(" ".utf8)).write(to: file)
        let grown = try await ContentPack.load(from: DirectoryPackSource(root: made.root), appVersion: nil)
        #expect(grown.rejected.first?.description.contains("size") == true, "\(grown.rejected)")
    }

    // MARK: Other refusals

    @Test func unreadableManifestThrows() async throws {
        let pack = try TestPack.made()
        defer { pack.remove() }
        try Data("{ not json".utf8).write(to: pack.root.appendingPathComponent(PackManifest.path))
        await #expect(throws: ContentPackError.self) {
            _ = try await ContentPack.load(from: DirectoryPackSource(root: pack.root), appVersion: nil)
        }
    }

    @Test func missingManifestThrows() async throws {
        let dir = FileManager.default.temporaryDirectory.appendingPathComponent("ContentPackTests-\(UUID().uuidString)")
        do {
            _ = try await ContentPack.load(from: DirectoryPackSource(root: dir), appVersion: nil)
            Issue.record("loaded a pack with no manifest")
        } catch {
            #expect(error == .missingFile(path: PackManifest.path))
        }
    }

    @Test func newerSchemaThrows() async throws {
        let pack = try TestPack.made(manifestEdit: { $0["schema_version"] = 2 })
        defer { pack.remove() }
        do {
            _ = try await ContentPack.load(from: DirectoryPackSource(root: pack.root), appVersion: nil)
            Issue.record("loaded schema_version 2")
        } catch {
            #expect(error == .unsupportedSchema(path: PackManifest.path, found: 2))
        }
    }

    /// `min_app_version` above the app: the topic waits for an update; the rest of the pack opens.
    @Test func topicForANewerAppIsLeftOut() async throws {
        let pack = try TestPack.made(topicEdit: { $0["min_app_version"] = "9.0.0" })
        defer { pack.remove() }
        let opened = try await ContentPack.load(from: DirectoryPackSource(root: pack.root), appVersion: "0.1.0")
        #expect(opened.library.topics.isEmpty)
        #expect(opened.rejected.first?.error == .appTooOld(path: opened.manifest.topics[0].path, needs: "9.0.0", app: "0.1.0"))
        let unchecked = try await ContentPack.load(from: DirectoryPackSource(root: pack.root), appVersion: nil)
        #expect(unchecked.library.topics.count == 1, "no app version, no check")
    }

    @Test func pathsStayInsideThePack() async throws {
        let source = DirectoryPackSource(root: URL(fileURLWithPath: "/tmp"))
        for path in ["../etc/passwd", "/etc/passwd", "assets//x", "assets/./x", ""] {
            do {
                _ = try await source.fileURL(for: path)
                Issue.record("accepted \(path)")
            } catch let error as ContentPackError {
                #expect(error == .badPath(path))
            }
        }
    }

    @Test func unknownAssetIsRefused() async throws {
        let pack = try TestPack.made()
        defer { pack.remove() }
        let opened = try await ContentPack.load(from: DirectoryPackSource(root: pack.root), appVersion: nil)
        let hash = String(repeating: "0", count: 64)
        #expect(!opened.hasAsset(hash))
        do {
            _ = try await opened.assetData(for: hash)
            Issue.record("served an asset the manifest does not list")
        } catch {
            #expect(error == .unknownAsset(hash))
        }
    }

    @Test func appVersions() {
        #expect(AppVersion("0.1.0")! < AppVersion("0.2.0")!)
        #expect(AppVersion("0.10.0")! > AppVersion("0.9.9")!)
        #expect(AppVersion("1")! == AppVersion("1.0.0")!)
        #expect(AppVersion("1.x") == nil)
        #expect(AppVersion("") == nil)
    }
}

/// A pack in a fresh temporary folder.
struct TestPack {
    let root: URL

    func remove() { try? FileManager.default.removeItem(at: root.deletingLastPathComponent()) }

    static func repo(_ relative: String, from file: String = #filePath) -> URL? {
        var dir = URL(fileURLWithPath: file).deletingLastPathComponent()
        while dir.path != "/" {
            let candidate = dir.appendingPathComponent(relative)
            if FileManager.default.fileExists(atPath: candidate.path) { return candidate }
            dir.deleteLastPathComponent()
        }
        return nil
    }

    /// `content/.build/pack` when content-cli has built it on this machine.
    static let builtPack: URL? = repo("content/.build/pack/catalog/v1/manifest.json").map {
        $0.deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
    }

    static func freshDirectory() throws -> URL {
        let dir = FileManager.default.temporaryDirectory
            .appendingPathComponent("ContentPackTests-\(UUID().uuidString)")
            .appendingPathComponent("pack")
        try FileManager.default.createDirectory(at: dir.deletingLastPathComponent(), withIntermediateDirectories: true)
        return dir
    }

    static func copyOfBuiltPack() throws -> TestPack {
        let source = try #require(builtPack)
        let root = try freshDirectory()
        try FileManager.default.copyItem(at: source, to: root)
        return TestPack(root: root)
    }

    /// Changes one byte in the middle of a file (same size).
    static func flipOneByte(of url: URL) throws {
        var data = try Data(contentsOf: url)
        let index = data.count / 2
        data[index] = data[index] == 0x41 ? 0x42 : 0x41
        try data.write(to: url)
    }

    /// A picture to put in a made pack (SK-033): its bytes and the manifest's `credit` (`nil`: no
    /// `credit` key, as an old pack).
    struct Image {
        let data: Data
        let width: Int
        let height: Int
        let credit: [String: Any]?

        var sha256: String { ContentPack.sha256Hex(data) }
    }

    /// A pack written the way content-cli writes one (SK-015 format), from the schema fixtures:
    /// every string of the topic title, lesson title and objective gets a fake "clip" (some
    /// bytes) named by its sha256. SK-033: `images` go in as `assets/<sha256>.jpg`, `kind:
    /// "image"`, with `width`, `height` and `credit`; `lessonEdit` points the lesson's pictures at them.
    static func made(
        images: [Image] = [],
        manifestEdit: (inout [String: Any]) -> Void = { _ in },
        topicEdit: (inout [String: Any]) -> Void = { _ in },
        lessonEdit: (inout [String: Any]) throws -> Void = { _ in }
    ) throws -> TestPack {
        let fixtures = try #require(repo("packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh"))
        var topic = try object(fixtures.appendingPathComponent("topic.json"))
        var lesson = try object(fixtures.appendingPathComponent("01-thuc-an-cho-ta-nhung-gi.json"))
        let root = try freshDirectory()
        let fm = FileManager.default
        for dir in ["catalog/v1", "topics", "assets"] {
            try fm.createDirectory(at: root.appendingPathComponent(dir), withIntermediateDirectories: true)
        }

        var assets: [[String: Any]] = []
        func clip(for text: String) throws -> String {
            let data = Data("fake m4a: \(text)".utf8)
            let hash = ContentPack.sha256Hex(data)
            let path = "assets/\(hash).m4a"
            if !fm.fileExists(atPath: root.appendingPathComponent(path).path) {
                try data.write(to: root.appendingPathComponent(path))
                assets.append(["sha256": hash, "size": data.count, "kind": "audio", "lang": "en", "path": path])
            }
            return hash
        }
        func voiced(_ spoken: Any?) throws -> [String: Any] {
            var spoken = try #require(spoken as? [String: Any])
            spoken["audio"] = ["en": try clip(for: spoken["en"] as? String ?? "")]
            return spoken
        }
        topic["title"] = try voiced(topic["title"])
        lesson["title"] = try voiced(lesson["title"])
        lesson["objective"] = try voiced(lesson["objective"])
        for image in images {
            let path = "assets/\(image.sha256).jpg"
            try image.data.write(to: root.appendingPathComponent(path))
            var entry: [String: Any] = [
                "sha256": image.sha256, "size": image.data.count, "kind": "image", "path": path,
                "width": image.width, "height": image.height,
            ]
            entry["credit"] = image.credit
            assets.append(entry)
        }
        try lessonEdit(&lesson)

        let topicID = try #require(topic["id"] as? String)
        let version = "test0001"
        let packPath = "topics/\(topicID)/\(version)/pack.json"
        try fm.createDirectory(at: root.appendingPathComponent(packPath).deletingLastPathComponent(), withIntermediateDirectories: true)
        let packData = try JSONSerialization.data(
            withJSONObject: ["schema_version": 1, "topic_id": topicID, "version": version, "topic": topic, "lessons": [lesson]],
            options: [.sortedKeys]
        )
        try packData.write(to: root.appendingPathComponent(packPath))

        let rulesURL = try #require(repo("content/rules.json"))
        let rules = try object(rulesURL)
        var entry: [String: Any] = [
            "id": topicID, "slug": topic["slug"] ?? "", "age_group": topic["age_group"] ?? "", "order": topic["order"] ?? 1,
            "title": topic["title"] ?? [String: Any](), "is_free": true, "version": version, "path": packPath,
            "sha256": ContentPack.sha256Hex(packData), "size": packData.count, "min_app_version": "0.1.0",
        ]
        topicEdit(&entry)
        var manifest: [String: Any] = [
            "schema_version": 1, "generated_at": "2026-10-29T00:00:00Z", "content_version": "test",
            "topics": [entry], "rules": rules, "assets": assets,
        ]
        manifestEdit(&manifest)
        try JSONSerialization.data(withJSONObject: manifest, options: [.sortedKeys])
            .write(to: root.appendingPathComponent(PackManifest.path))
        return TestPack(root: root)
    }

    static func object(_ url: URL) throws -> [String: Any] {
        try #require(try JSONSerialization.jsonObject(with: Data(contentsOf: url)) as? [String: Any])
    }
}
