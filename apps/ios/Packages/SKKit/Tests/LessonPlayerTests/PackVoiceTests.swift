import ContentKit
import ContentModel
import Foundation
import Profiles
import Testing
@testable import LessonPlayer

/// SK-025 on the real pack (`content/.build/pack`, content-cli build of SK-024), when it is built on
/// this machine; skipped otherwise (the pack is not in git). Lesson 1 as the app plays it.
@MainActor
@Suite struct PackVoiceTests {
    static let lessonID = UUID(uuidString: "4b11eb40-9a47-4e5e-b4b5-bea60264ded3")!

    /// `content/.build/pack` above this file, if built.
    nonisolated static let builtPack: URL? = {
        var dir = URL(fileURLWithPath: #filePath).deletingLastPathComponent()
        while dir.path != "/" {
            let root = dir.appendingPathComponent("content/.build/pack")
            if FileManager.default.fileExists(atPath: root.appendingPathComponent("catalog/v1/manifest.json").path) { return root }
            dir.deleteLastPathComponent()
        }
        return nil
    }()

    static func open() async throws -> (ContentPack, Lesson) {
        let root = try #require(builtPack)
        let pack = try await ContentPack.load(from: DirectoryPackSource(root: root), appVersion: nil)
        #expect(pack.rejected.isEmpty, "\(pack.rejected)")
        let lesson = try #require(pack.library.lesson(id: lessonID)?.lesson, "lesson 1 in the pack")
        return (pack, lesson)
    }

    /// Every string shown on the six screens has an `audio.vi` clip that the pack holds and that
    /// passes its sha256 check, as `everyShownStringHasAnEnglishClip` (SK-016) does for EN.
    /// `both` then plays EN → VI for every one of them.
    @Test(.enabled(if: PackVoiceTests.builtPack != nil))
    func everyShownStringHasAVietnameseClipInThePack() async throws {
        let (pack, lesson) = try await Self.open()
        let harness = try SessionHarness(lesson: lesson)
        defer { harness.cleanUp() }
        let session = LessonSession(
            lesson: lesson, rules: harness.rules,
            context: .init(childId: harness.child, timeZone: TimeZone(identifier: "Asia/Ho_Chi_Minh")!, languageMode: .bilingual, voiceMode: .vi),
            store: harness.store
        )
        var strings = 0
        var checked = Set<String>()
        for step in session.steps {
            let shown = session.spokenShown(on: step)
            #expect(!shown.isEmpty, "\(step)")
            for spoken in shown {
                strings += 1
                let vi = try #require(spoken.audio?.vi, "\(step): no audio.vi for '\(spoken.vi)'")
                #expect(spoken.voiceClips(for: .vi).map(\.hash) == [vi], "\(step): \(spoken.vi)")
                #expect(spoken.voiceClips(for: .both).map(\.language) == ["en", "vi"], "\(step): \(spoken.en)")
                if checked.insert(vi).inserted {
                    _ = try await pack.assetURL(for: vi) // throws if missing or its sha256 does not match
                }
            }
        }
        print("pack voice: \(strings) strings shown on \(session.steps.count) steps, \(checked.count) different VI clips, all in the pack")
    }

    /// The `en` profile on the real pack: nothing VI is read ahead or played (unchanged from SK-016).
    @Test(.enabled(if: PackVoiceTests.builtPack != nil))
    func englishProfileHasNoVietnameseOnTheRealPack() async throws {
        let (pack, lesson) = try await Self.open()
        let viHashes = Set(pack.manifest.assets.filter { $0.lang == "vi" }.map(\.sha256))
        #expect(!viHashes.isEmpty, "the pack has VI clips")
        let harness = try SessionHarness(lesson: lesson)
        defer { harness.cleanUp() }
        let session = LessonSession(
            lesson: lesson, rules: harness.rules,
            context: .init(childId: harness.child, timeZone: TimeZone(identifier: "Asia/Ho_Chi_Minh")!, languageMode: .bilingual, voiceMode: .en),
            store: harness.store
        )
        for step in session.steps {
            #expect(session.clipsToPreload(at: step).isDisjoint(with: viHashes), "\(step)")
            #expect(session.autoplayUtterance(for: step)?.clips.allSatisfy { $0.language == "en" } ?? true, "\(step)")
        }
    }
}
