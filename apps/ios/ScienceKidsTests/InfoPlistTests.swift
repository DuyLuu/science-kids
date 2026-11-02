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
        #expect(format(vi, "topic.lesson.locked %lld", 1) == "Mở sau bài 1")
        #expect(format(vi, "home.continue.lesson %lld %lld %@", 1, 5, "Thức ăn cho ta những gì?") == "Bài 1/5 · Thức ăn cho ta những gì?")
        #expect(format(en, "home.journey.count %lld", 1) == "1 topic · easy → hard")
        #expect(format(en, "home.journey.count %lld", 6) == "6 topics · easy → hard")
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
