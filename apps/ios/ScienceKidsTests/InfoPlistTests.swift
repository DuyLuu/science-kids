import LessonPlayer
import Testing
import UIKit
@testable import ScienceKids

/// SK-005: what the installed bundle declares, read at run time on the simulator.
@MainActor
@Suite struct InfoPlistTests {
    private let info = Bundle.main.infoDictionary ?? [:]

    @Test func versionAndBuild() {
        let appInfo = AppInfo(bundle: .main)
        #expect(appInfo.version == "0.1.0")
        #expect(appInfo.build == "1")
        #expect(appInfo.versionLine.hasSuffix(" · \(appInfo.bundleID)"))
    }

    /// CFBundle resolves `~ipad` keys for the current device, so the same key
    /// gives the iPhone list on iPhone and the iPad list on iPad.
    @Test func orientationsFollowDevice() throws {
        let orientations = try #require(info["UISupportedInterfaceOrientations"] as? [String])
        if UIDevice.current.userInterfaceIdiom == .pad {
            #expect(Set(orientations) == [
                "UIInterfaceOrientationPortrait",
                "UIInterfaceOrientationPortraitUpsideDown",
                "UIInterfaceOrientationLandscapeLeft",
                "UIInterfaceOrientationLandscapeRight",
            ])
        } else {
            #expect(orientations == ["UIInterfaceOrientationPortrait"])
        }
    }

    /// Split View and Slide Over need the app not to require full screen.
    @Test func doesNotRequireFullScreen() {
        #expect(info["UIRequiresFullScreen"] == nil)
    }

    @Test func fontsDeclaredAndBundled() throws {
        let fonts = try #require(info["UIAppFonts"] as? [String])
        #expect(fonts.count == 4)
        for path in fonts {
            #expect(Bundle.main.url(forResource: path, withExtension: nil) != nil, "missing \(path)")
        }
        #expect(Bundle.main.url(forResource: "Phudu/OFL", withExtension: "txt") != nil)
        #expect(Bundle.main.url(forResource: "BeVietnamPro/OFL", withExtension: "txt") != nil)
    }

    @Test func privacyManifestBundled() throws {
        let url = try #require(Bundle.main.url(forResource: "PrivacyInfo", withExtension: "xcprivacy"))
        // SK-022: no tracking; what goes to the server is declared, for the app's function only.
        let plist = try #require(try PropertyListSerialization.propertyList(from: Data(contentsOf: url), format: nil) as? [String: Any])
        #expect(plist["NSPrivacyTracking"] as? Bool == false)
        let collected = plist["NSPrivacyCollectedDataTypes"] as? [[String: Any]] ?? []
        #expect(Set(collected.compactMap { $0["NSPrivacyCollectedDataType"] as? String }) == [
            "NSPrivacyCollectedDataTypeUserID", "NSPrivacyCollectedDataTypeName",
            "NSPrivacyCollectedDataTypeProductInteraction", "NSPrivacyCollectedDataTypeOtherDataTypes",
        ])
        #expect(collected.allSatisfy { $0["NSPrivacyCollectedDataTypeTracking"] as? Bool == false })
        #expect(collected.allSatisfy { ($0["NSPrivacyCollectedDataTypePurposes"] as? [String]) == ["NSPrivacyCollectedDataTypePurposeAppFunctionality"] })
    }

    /// SK-022: Info.plist carries the Supabase settings of the build (values never printed here).
    @Test func supabaseSettingsAreWired() {
        #expect(Bundle.main.object(forInfoDictionaryKey: "SKSupabaseURL") is String)
        #expect(Bundle.main.object(forInfoDictionaryKey: "SKSupabasePublishableKey") is String)
    }

    @Test func shipsEnglishAndVietnamese() {
        #expect(Set(Bundle.main.localizations).isSuperset(of: ["en", "vi"]))
    }

    /// The string catalog compiles to en.lproj and vi.lproj (SK-011 replaced the SK-005
    /// placeholder keys with the onboarding, Home and Topic strings).
    @Test(arguments: [
        ("en", "Next", "Start the journey", "Bilingual"),
        ("vi", "Tiếp", "Bắt đầu hành trình", "Song ngữ"),
    ])
    func interfaceStringsLocalized(language: String, next: String, start: String, bilingual: String) throws {
        let bundle = try Self.bundle(language)
        #expect(bundle.localizedString(forKey: "welcome.next", value: nil, table: nil) == next)
        #expect(bundle.localizedString(forKey: "profile.start", value: nil, table: nil) == start)
        #expect(bundle.localizedString(forKey: "welcome.mode.bilingual", value: nil, table: nil) == bilingual)
    }

    /// Every interface string exists in both languages, with a non-empty value
    /// (plural keys live in the English .stringsdict).
    @Test func everyKeyInBothLanguages() throws {
        let en = try Self.keys("en")
        let vi = try Self.keys("vi")
        #expect(en.count > 80, "\(en.count) keys")
        #expect(en == vi, "only en: \(en.subtracting(vi).sorted()), only vi: \(vi.subtracting(en).sorted())")
        let viBundle = try Self.bundle("vi")
        for key in vi {
            let value = viBundle.localizedString(forKey: key, value: "<missing>", table: nil)
            #expect(!value.isEmpty && value != "<missing>", "vi \(key)")
        }
    }

    @Test func formatsFillIn() throws {
        let en = try Self.bundle("en")
        let vi = try Self.bundle("vi")
        func format(_ bundle: Bundle, _ key: String, _ args: any CVarArg...) -> String {
            String(format: bundle.localizedString(forKey: key, value: nil, table: nil), arguments: args)
        }
        #expect(format(vi, "home.greeting %@", "Minh") == "Chào Minh!")
        #expect(format(en, "home.greeting %@", "Minh") == "Hi Minh!")
        #expect(format(vi, "topic.lesson.soon_a11y %lld %@", 3, "Fats in food") == "Bài 3: Fats in food. Chưa có nội dung")
        #expect(format(en, "home.journey.title_group %@", "Scientist") == "Scientist journey")
        // SK-030: nothing is locked any more.
        #expect(vi.localizedString(forKey: "topic.lesson.locked %lld", value: "<missing>", table: nil) == "<missing>")
        #expect(format(vi, "home.continue.lesson %lld %lld %@", 1, 5, "Thức ăn cho ta những gì?") == "Bài 1/5 · Thức ăn cho ta những gì?")
        // 10/11: no more "easy → hard" (the syllabus follows Oak's order); progress on the journey.
        #expect(format(en, "home.journey.count %lld", 1) == "1 topic")
        #expect(format(en, "home.journey.count %lld", 17) == "17 topics")
        #expect(format(vi, "home.journey.count %lld", 17) == "17 chủ đề")
        #expect(format(vi, "home.journey.count_started %lld", 3) == "3 đã bắt đầu")
        #expect(format(en, "home.journey.count_started %lld", 3) == "3 started")
        #expect(format(vi, "home.journey.done %lld %lld", 5, 5) == "Đã xong · 5/5 bài")
        #expect(format(en, "home.journey.done %lld %lld", 5, 5) == "Done · 5/5 lessons")
        #expect(format(vi, "home.journey.learning %lld %lld", 2, 5) == "Đang học · 2/5 bài")
        #expect(format(vi, "home.journey.level %lld %lld %lld", 3, 0, 2) == "Mức 3 · 0/2 bài")
        #expect(format(vi, "home.journey.soon") == "Sắp có")
        #expect(format(en, "home.journey.soon") == "Coming soon")
        #expect(format(vi, "topic.lesson.done_a11y %lld %@ %lld", 2, "Khủng long", 3) == "Bài 2: Khủng long. Đã xong, tốt nhất 3 trên 3 sao")
        #expect(format(vi, "progress.lessons_a11y %lld %lld", 1, 5) == "Đã xong 1 trên 5 bài")
    }

    /// SK-034: the strings of the journey map (spec 12; Duy 10/11: "Chặng n", no Year; SK-035
    /// content-editor 10/11: "đã xong" before the numbers read by VoiceOver).
    @Test func roadmapStringsFillIn() throws {
        let en = try Self.bundle("en")
        let vi = try Self.bundle("vi")
        func format(_ bundle: Bundle, _ key: String, _ args: any CVarArg...) -> String {
            String(format: bundle.localizedString(forKey: key, value: nil, table: nil), arguments: args)
        }
        #expect(format(vi, "home.journey.segment %lld", 2) == "Chặng 2")
        #expect(format(en, "home.journey.segment %lld", 2) == "Stage 2")
        #expect(format(vi, "home.journey.segment_done %lld %lld", 1, 5) == "1/5 xong")
        #expect(format(en, "home.journey.segment_done %lld %lld", 1, 5) == "1/5 done")
        #expect(format(vi, "home.journey.segment_a11y %lld %lld %lld", 2, 0, 6) == "Chặng 2, đã xong 0 trên 6 chủ đề")
        #expect(format(en, "home.journey.segment_a11y %lld %lld %lld", 2, 0, 6) == "Stage 2, 0 of 6 topics done")
        #expect(format(vi, "home.journey.finish") == "Về đích")
        #expect(format(en, "home.journey.finish") == "Finish")
        #expect(format(vi, "home.journey.finish_done %lld", 1) == "1 đã xong")
        #expect(format(en, "home.journey.finish_done %lld", 1) == "1 done")
        #expect(format(vi, "home.journey.stars_a11y %lld", 3) == "3 sao")
        #expect(format(en, "home.journey.stars_a11y %lld", 1) == "1 star")
        #expect(format(en, "home.journey.stars_a11y %lld", 3) == "3 stars")
        #expect(format(vi, "home.journey.done_a11y %lld %lld", 5, 5) == "Đã xong, 5 trên 5 bài")
        #expect(format(en, "home.journey.done_a11y %lld %lld", 5, 5) == "Done, 5 of 5 lessons")
        #expect(format(vi, "home.journey.learning_a11y %lld %lld", 3, 5) == "Đang học, đã xong 3 trên 5 bài")
        #expect(format(vi, "home.journey.level_a11y %lld %lld %lld", 2, 0, 2) == "Mức 2, đã xong 0 trên 2 bài")
        #expect(format(vi, "home.journey.new_a11y %lld %lld", 0, 5) == "Chủ đề mới, đã xong 0 trên 5 bài")
        for key in ["home.journey.segment_year_done %lld %lld %lld"] {
            #expect(vi.localizedString(forKey: key, value: "<missing>", table: nil) == "<missing>", "no Year on the stages")
        }
    }

    /// SK-031: the Play words fit every `build_tray` lesson (a meal, places with water…), so none
    /// names a tray, a dish or a balance; what the picks are comes from the content.
    @Test(arguments: ["en", "vi"])
    func playStringsAreGeneric(language: String) throws {
        let bundle = try Self.bundle(language)
        let keys = ["lesson.play.done", "lesson.play.tray_label", "lesson.play.remove %@", "lesson.play.tray_a11y %lld %lld",
                    "lesson.play.meter_ok", "lesson.play.meter_missing", "lesson.play.need %@", "lesson.play.mascot"]
        for key in keys {
            let value = bundle.localizedString(forKey: key, value: "<missing>", table: nil)
            #expect(value != "<missing>", "\(language) \(key)")
            for word in ["mâm", "món", "tray", "food", "balanced", "cân bằng", "thức ăn"] {
                #expect(!value.lowercased().contains(word), "\(language) \(key): \(value)")
            }
        }
    }

    @Test func playStringsFillIn() throws {
        let en = try Self.bundle("en")
        let vi = try Self.bundle("vi")
        func format(_ bundle: Bundle, _ key: String, _ args: any CVarArg...) -> String {
            String(format: bundle.localizedString(forKey: key, value: nil, table: nil), arguments: args)
        }
        #expect(format(en, "lesson.play.done") == "Done! Take the quiz")
        #expect(format(vi, "lesson.play.done") == "Xong rồi! Làm quiz")
        #expect(format(en, "lesson.play.tray_a11y %lld %lld", 2, 3) == "Your picks: 2 of 3 places filled")
        #expect(format(vi, "lesson.play.tray_a11y %lld %lld", 2, 3) == "Em đã chọn: 2 trên 3 chỗ")
        #expect(format(en, "lesson.play.remove %@", "Sea") == "Remove Sea")
        #expect(format(vi, "lesson.play.remove %@", "Sea, Biển") == "Bỏ chọn Sea, Biển")
    }

    /// SK-031: the card names its set (`collectible.set.<set>`); a set the app has no name for yet
    /// shows the generic "Cards" · "Thẻ", never the raw key. SK-032 (Duy 9/11) adds `dinosaurs`.
    @Test(arguments: [
        ("en", "Earth cards", "Food cards", "Dinosaur cards", "Cards"),
        ("vi", "Thẻ Trái Đất", "Thẻ thực phẩm", "Thẻ khủng long", "Thẻ"),
    ])
    func collectibleSetNames(language: String, earth: String, food: String, dinosaurs: String, generic: String) throws {
        let bundle = try Self.bundle(language)
        func name(_ set: String) -> String {
            bundle.localizedString(forKey: CollectibleSetName.key(for: set, in: bundle), value: "<missing>", table: nil)
        }
        #expect(CollectibleSetName.key(for: "earth", in: bundle) == "collectible.set.earth")
        #expect(name("earth") == earth)
        #expect(name("food") == food)
        #expect(CollectibleSetName.key(for: "dinosaurs", in: bundle) == "collectible.set.dinosaurs")
        #expect(name("dinosaurs") == dinosaurs)
        #expect(CollectibleSetName.key(for: "volcanoes", in: bundle) == CollectibleSetName.genericKey)
        #expect(name("volcanoes") == generic)
        #expect(name("") == generic)
    }

    static func bundle(_ language: String) throws -> Bundle {
        let path = try #require(Bundle.main.path(forResource: language, ofType: "lproj"))
        return try #require(Bundle(path: path))
    }

    /// Keys of a language: Localizable.strings plus Localizable.stringsdict.
    static func keys(_ language: String) throws -> Set<String> {
        let bundle = try bundle(language)
        var keys = Set<String>()
        for ext in ["strings", "stringsdict"] {
            if let url = bundle.url(forResource: "Localizable", withExtension: ext),
               let dict = NSDictionary(contentsOf: url) as? [String: Any] {
                keys.formUnion(dict.keys)
            }
        }
        return keys
    }
}
