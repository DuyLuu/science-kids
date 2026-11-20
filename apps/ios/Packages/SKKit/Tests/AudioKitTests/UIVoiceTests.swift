import CryptoKit
import Foundation
import Testing
@testable import AudioKit

/// SK-059: the app-line clips (`ui-voice/manifest.json`, `science-kids/ui-voice@1`).
@Suite struct UIVoiceTests {
    private func folder(clip: Data, sha: String) throws -> URL {
        let dir = FileManager.default.temporaryDirectory.appendingPathComponent("UIVoice-\(UUID().uuidString)")
        try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        try clip.write(to: dir.appendingPathComponent("lesson.play.hint.first.explorer.en.m4a"))
        let manifest = """
        {"format":"science-kids/ui-voice@1","clips":{"lesson.play.hint.first.explorer":{
          "en":{"file":"lesson.play.hint.first.explorer.en.m4a","sha256":"\(sha)"},
          "vi":{"file":"missing.vi.m4a","sha256":"00"}}}}
        """
        try Data(manifest.utf8).write(to: dir.appendingPathComponent("manifest.json"))
        return dir
    }

    @Test func readsTheManifestAndChecksTheClip() async throws {
        let clip = Data("not really audio".utf8)
        let sha = SHA256.hash(data: clip).map { String(format: "%02x", $0) }.joined()
        let dir = try folder(clip: clip, sha: sha)
        defer { try? FileManager.default.removeItem(at: dir) }
        let catalog = try #require(UIVoiceCatalog(manifestURL: dir.appendingPathComponent("manifest.json")))
        #expect(catalog.hash(for: "lesson.play.hint.first.explorer", language: "en") == sha)
        #expect(catalog.hash(for: "lesson.play.hint.first.explorer", language: "vi") == nil, "file not in the folder: left out")
        let loader = UIVoiceClips(catalog: catalog, next: nil)
        #expect(try await loader.clipData(for: sha) == clip)
        await #expect(throws: (any Error).self) { try await loader.clipData(for: "abc") }
    }

    @Test func wrongChecksumIsRefused() async throws {
        let dir = try folder(clip: Data("x".utf8), sha: String(repeating: "a", count: 64))
        defer { try? FileManager.default.removeItem(at: dir) }
        let catalog = try #require(UIVoiceCatalog(manifestURL: dir.appendingPathComponent("manifest.json")))
        await #expect(throws: UIVoiceClips.Failure.self) {
            try await UIVoiceClips(catalog: catalog, next: nil).clipData(for: String(repeating: "a", count: 64))
        }
    }

    @Test func noFolderNoCatalog() {
        #expect(UIVoiceCatalog(manifestURL: URL(fileURLWithPath: "/nowhere/manifest.json")) == nil)
    }
}
