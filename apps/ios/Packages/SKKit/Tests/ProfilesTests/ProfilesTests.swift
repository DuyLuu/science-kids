import Foundation
import Testing
@testable import Profiles

// SK-011: the profile file (fields of `child_profiles`, B5.3), the language_mode → voice_mode
// suggestion (B4.1), grade → age group (canvas Discoverer 2) and the language rules of names
// and sentences.

@Suite struct VoiceSuggestionTests {
    @Test(arguments: [
        (LanguageMode.bilingual, VoiceMode.both),
        (LanguageMode.enFirst, VoiceMode.en),
        (LanguageMode.viFirst, VoiceMode.both),
    ])
    func discovererFollowsB41(mode: LanguageMode, voice: VoiceMode) {
        #expect(VoiceMode.suggested(for: mode, ageGroup: .discoverer) == voice)
        #expect(VoiceMode.suggested(for: mode, ageGroup: .scientist) == voice)
    }

    @Test(arguments: LanguageMode.allCases)
    func explorerIsAlwaysBoth(mode: LanguageMode) {
        #expect(VoiceMode.suggested(for: mode, ageGroup: .explorer) == .both)
    }

    /// The app's table must say what `content/rules.json` says (`default_voice_mode`, SK-015),
    /// until the app reads it from the manifest (SK-016). Reads the repo file through `#filePath`.
    @Test func matchesRulesJSON() throws {
        let url = try #require(RepoFiles.find("content/rules.json"), "content/rules.json not found above \(#filePath)")
        let rules = try #require(try JSONSerialization.jsonObject(with: Data(contentsOf: url)) as? [String: Any])
        for group in AgeGroup.allCases {
            let groupRules = try #require(rules[group.rawValue] as? [String: Any], "rules.\(group.rawValue)")
            let defaults = try #require(groupRules["default_voice_mode"] as? [String: String])
            #expect(Set(defaults.keys) == Set(LanguageMode.allCases.map(\.rawValue)), "language_mode keys of \(group)")
            for mode in LanguageMode.allCases {
                #expect(
                    defaults[mode.rawValue] == VoiceMode.suggested(for: mode, ageGroup: group).rawValue,
                    "rules.\(group.rawValue).default_voice_mode.\(mode.rawValue)"
                )
            }
        }
    }
}

@Suite struct GradeTests {
    @Test func canvasMapping() {
        #expect(Grade.ageGroup(for: 1) == .explorer)
        #expect(Grade.ageGroup(for: 2) == .discoverer)
        #expect(Grade.ageGroup(for: 3) == .discoverer)
        #expect(Grade.ageGroup(for: 4) == .scientist)
        #expect(Grade.ageGroup(for: 5) == .scientist)
        #expect(Grade.ageGroup(for: 0) == nil)
        #expect(Grade.ageGroup(for: 6) == nil)
        #expect(Grade.range == 1...5)
    }

    @Test func ukYear() {
        #expect(Grade.ukYear(for: 2) == 3, "canvas: Lớp 2 → Discoverer · Year 3")
        #expect(Grade.ukYear(for: 3) == 4)
    }
}

@Suite struct LanguageRuleTests {
    @Test func names() {
        #expect(LanguageMode.bilingual.nameLanguage == .vi)
        #expect(LanguageMode.bilingual.nameSecondLanguage == .en)
        #expect(LanguageMode.viFirst.nameLanguage == .vi)
        #expect(LanguageMode.viFirst.nameSecondLanguage == .en)
        #expect(LanguageMode.enFirst.nameLanguage == .en)
        #expect(LanguageMode.enFirst.nameSecondLanguage == nil)
    }

    @Test func sentences() {
        #expect(LanguageMode.bilingual.sentenceLanguage == .en)
        #expect(LanguageMode.bilingual.sentenceSecondLanguage == .vi)
        #expect(!LanguageMode.bilingual.hidesSentenceSecondLanguage)
        #expect(LanguageMode.enFirst.sentenceLanguage == .en)
        #expect(LanguageMode.enFirst.hidesSentenceSecondLanguage)
        #expect(LanguageMode.viFirst.sentenceLanguage == .vi)
        #expect(LanguageMode.viFirst.sentenceSecondLanguage == .en)
        #expect(!LanguageMode.viFirst.hidesSentenceSecondLanguage)
    }

    @Test func rawValuesAreDatabaseValues() {
        #expect(LanguageMode.allCases.map(\.rawValue) == ["bilingual", "en_first", "vi_first"])
        #expect(VoiceMode.allCases.map(\.rawValue) == ["en", "vi", "both"])
        #expect(AgeGroup.allCases.map(\.rawValue) == ["explorer", "discoverer", "scientist"])
    }
}

@Suite struct ChildProfileTests {
    static let now = Date(timeIntervalSince1970: 1_793_244_165.789) // 2026-10-29T03:22:45.789Z
    static let id = UUID(uuidString: "6F1C2B0E-5D3A-4C7B-9E21-0A6B4D8F3C10")!

    static func minh(mode: LanguageMode = .enFirst, voice: VoiceMode = .en) throws -> ChildProfile {
        try ChildProfile.create(
            displayName: "  Minh ",
            avatar: "ech",
            grade: 3,
            languageMode: mode,
            voiceMode: voice,
            timeZone: TimeZone(identifier: "Asia/Ho_Chi_Minh")!,
            now: now,
            id: id
        )
    }

    @Test func createNormalises() throws {
        let profile = try Self.minh()
        #expect(profile.displayName == "Minh")
        #expect(profile.ageGroup == .discoverer)
        #expect(profile.timezone == "Asia/Ho_Chi_Minh")
        #expect(profile.createdAt == Date(timeIntervalSince1970: 1_793_244_165), "whole seconds")
    }

    @Test func createRejectsBadInput() {
        #expect(throws: ProfileError.emptyName) {
            try ChildProfile.create(displayName: "   ", avatar: "ech", grade: 3, languageMode: .bilingual, voiceMode: .both)
        }
        #expect(throws: ProfileError.missingAvatar) {
            try ChildProfile.create(displayName: "Minh", avatar: "", grade: 3, languageMode: .bilingual, voiceMode: .both)
        }
        #expect(throws: ProfileError.invalidGrade(6)) {
            try ChildProfile.create(displayName: "Minh", avatar: "ech", grade: 6, languageMode: .bilingual, voiceMode: .both)
        }
    }

    @Test func nameRules() {
        #expect(ChildProfile.normalizedName(" An\n") == "An")
        #expect(ChildProfile.normalizedName("\t ") == nil)
        #expect(ChildProfile.normalizedName("Nguyễn Hoàng Bảo Ngọc Anh") == "Nguyễn Hoàng Bảo Ngọ", "20 characters")
        #expect(ChildProfile.normalizedName("Bảo Ngọc Anh Thư Lâm  Hà") == "Bảo Ngọc Anh Thư Lâm", "cut, then trimmed")
        #expect(ChildProfile.limitedNameInput(String(repeating: "ạ", count: 25)).count == 20)
    }

    /// The JSON has exactly the `child_profiles` names of the ticket, nothing else.
    @Test func jsonFieldsAreChildProfilesColumns() throws {
        let data = try ProfileStore.encode(try Self.minh())
        let object = try #require(try JSONSerialization.jsonObject(with: data) as? [String: Any])
        #expect(Set(object.keys) == [
            "id", "display_name", "avatar", "grade", "age_group", "language_mode", "voice_mode", "timezone", "created_at",
        ])
        #expect(Set(object.keys) == Set(ChildProfile.fieldNames))
        #expect(object["id"] as? String == "6f1c2b0e-5d3a-4c7b-9e21-0a6b4d8f3c10", "lower case UUID")
        #expect(object["display_name"] as? String == "Minh")
        #expect(object["avatar"] as? String == "ech")
        #expect(object["grade"] as? Int == 3)
        #expect(object["age_group"] as? String == "discoverer")
        #expect(object["language_mode"] as? String == "en_first")
        #expect(object["voice_mode"] as? String == "en")
        #expect(object["timezone"] as? String == "Asia/Ho_Chi_Minh")
        #expect(object["created_at"] as? String == "2026-10-29T03:22:45Z")
    }

    @Test func readsServerTimestamps() throws {
        #expect(ChildProfile.parseTimestamp("2026-10-29T03:22:45Z") == Date(timeIntervalSince1970: 1_793_244_165))
        #expect(ChildProfile.parseTimestamp("2026-10-29T10:22:45+07:00") == Date(timeIntervalSince1970: 1_793_244_165))
        #expect(ChildProfile.parseTimestamp("2026-10-29T03:22:45.500Z") == Date(timeIntervalSince1970: 1_793_244_165.5))
        #expect(ChildProfile.parseTimestamp("29/10/2026") == nil)
    }

    @Test func readsUpperCaseID() throws {
        let json = """
        {"id":"6F1C2B0E-5D3A-4C7B-9E21-0A6B4D8F3C10","display_name":"Minh","avatar":"ech","grade":3,
         "age_group":"discoverer","language_mode":"bilingual","voice_mode":"both",
         "timezone":"Asia/Ho_Chi_Minh","created_at":"2026-10-29T03:22:45Z"}
        """
        let profile = try JSONDecoder().decode(ChildProfile.self, from: Data(json.utf8))
        #expect(profile.id == Self.id)
        #expect(profile.languageMode == .bilingual)
    }
}

@Suite struct ProfileStoreTests {
    /// A fresh directory per test, removed afterwards.
    static func withStore(_ body: (ProfileStore) throws -> Void) throws {
        let dir = FileManager.default.temporaryDirectory
            .appendingPathComponent("ProfilesTests-\(UUID().uuidString)", isDirectory: true)
        defer { try? FileManager.default.removeItem(at: dir) }
        try body(ProfileStore(directory: dir.appendingPathComponent("Application Support", isDirectory: true)))
    }

    /// SK-022 (SK-011 tester): a broken file is kept as `.corrupt-<time>` before a new profile is
    /// written, never overwritten.
    @Test func brokenFileIsKeptAside() throws {
        try Self.withStore { store in
            try FileManager.default.createDirectory(at: store.fileURL.deletingLastPathComponent(), withIntermediateDirectories: true)
            try Data("{ \"id\": broken".utf8).write(to: store.fileURL)
            #expect(throws: (any Error).self) { try store.load() }
            let kept = try #require(try store.quarantineCorruptFile(now: Date(timeIntervalSince1970: 1_793_584_800)))
            #expect(kept.lastPathComponent == "child_profile.json.corrupt-20261102T020000Z")
            #expect(try String(contentsOf: kept, encoding: .utf8) == "{ \"id\": broken")
            #expect(try store.load() == nil, "the place is free for a new profile")
            try store.save(try ChildProfileTests.minh())
            #expect(FileManager.default.fileExists(atPath: kept.path), "the broken copy stays")
            #expect(try store.quarantineCorruptFile() != nil, "a second rename does not clash")
            #expect(try store.quarantineCorruptFile() == nil, "no file, nothing to keep")
        }
    }

    @Test func emptyStoreHasNoProfile() throws {
        try Self.withStore { store in
            #expect(try store.load() == nil)
            try store.delete() // no file: no error
        }
    }

    @Test func saveThenLoad() throws {
        try Self.withStore { store in
            let profile = try ChildProfileTests.minh()
            try store.save(profile)
            #expect(store.fileURL.lastPathComponent == "child_profile.json")
            #expect(try store.load() == profile)
            // A second store on the same directory (the app after a relaunch) reads the same.
            let reopened = ProfileStore(directory: store.fileURL.deletingLastPathComponent())
            #expect(try reopened.load() == profile)
        }
    }

    @Test func saveReplaces() throws {
        try Self.withStore { store in
            try store.save(try ChildProfileTests.minh(mode: .enFirst, voice: .en))
            var changed = try ChildProfileTests.minh(mode: .bilingual, voice: .both)
            changed.displayName = "An"
            try store.save(changed)
            #expect(try store.load() == changed)
        }
    }

    @Test func deleteRemovesTheFile() throws {
        try Self.withStore { store in
            try store.save(try ChildProfileTests.minh())
            try store.delete()
            #expect(!FileManager.default.fileExists(atPath: store.fileURL.path))
            #expect(try store.load() == nil)
        }
    }

    @Test func brokenFileThrows() throws {
        try Self.withStore { store in
            try FileManager.default.createDirectory(
                at: store.fileURL.deletingLastPathComponent(), withIntermediateDirectories: true
            )
            try Data("{\"id\": 1".utf8).write(to: store.fileURL)
            #expect(throws: (any Error).self) { try store.load() }
        }
    }

    @Test func fileIsReadableJSON() throws {
        try Self.withStore { store in
            try store.save(try ChildProfileTests.minh())
            let text = try String(contentsOf: store.fileURL, encoding: .utf8)
            #expect(text.hasPrefix("{\n"), "pretty-printed")
            #expect(text.contains("\"display_name\" : \"Minh\""))
            let keys = text.split(separator: "\n").compactMap { line -> String? in
                let parts = line.split(separator: "\"")
                return parts.count > 1 ? String(parts[1]) : nil
            }
            #expect(keys == keys.sorted(), "sorted keys")
        }
    }
}

/// Finds a file of the repo by walking up from this test file.
enum RepoFiles {
    static func find(_ relativePath: String, from file: String = #filePath) -> URL? {
        var dir = URL(fileURLWithPath: file).deletingLastPathComponent()
        while dir.path != "/" {
            let candidate = dir.appendingPathComponent(relativePath)
            if FileManager.default.fileExists(atPath: candidate.path) { return candidate }
            dir.deleteLastPathComponent()
        }
        return nil
    }
}
