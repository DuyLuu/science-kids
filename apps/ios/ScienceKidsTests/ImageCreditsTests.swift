import ContentKit
import Foundation
import Testing
@testable import ScienceKids

/// SK-033: the app's side of the pictures. The pack's pictures go to the screens through
/// `AppContent.pictures`; "Nguồn hình" · "Image credits" lists their credits, as text only (no
/// parent gate yet), and Home links to it only when the pack has pictures.
@Suite struct ImageCreditsTests {
    @Test func fixturesHaveNoPictures() {
        let fixtures = BundledContent.fixtures()
        #expect(fixtures.pictures == nil, "no pack: every picture is the stand-in art")
        #expect(fixtures.imageCredits.isEmpty, "no pack: no credits link on Home")
    }

    /// The bundled pack (when the build has one) gives the screens its pictures, and the credits
    /// screen exactly the pack's image list.
    @Test(.enabled(if: BundledContentTests.hasPack)) func bundledPackGivesItsPictures() async throws {
        let content = try #require(await BundledContent.load().ready)
        let pack = try #require(content.pack)
        #expect(content.pictures != nil)
        let credited = content.imageCredits.map(\.sha256)
        let listed = pack.images.map(\.sha256)
        #expect(credited == listed)
        let allImages = content.imageCredits.allSatisfy(\.isImage)
        #expect(allImages)
    }

    @Test @MainActor func homeLinkNeedsPictures() {
        let app = AppModel(store: nil, library: BundledContent.fixtures().library)
        #expect(app.imageCredits.isEmpty)
        app.openImageCredits()
        #expect(app.path == [.imageCredits])
    }

    /// SK-052: one card per source picture. Two crops of one photo (same `source_url`) are one
    /// card with the first file's title and every change; a drawn picture stays its own card; a
    /// composed picture used twice is one card; a file without a credit stays on its own.
    @Test func creditsGroupedBySourcePicture() {
        func entry(_ sha: String, _ credit: PackManifest.ImageCredit?) -> PackManifest.AssetEntry {
            PackManifest.AssetEntry(sha256: sha, size: 1, kind: "image", path: "assets/\(sha).webp", credit: credit)
        }
        let page = "https://commons.wikimedia.org/wiki/File:Common_Carp.jpg"
        func carp(_ title: String, _ changes: [String]) -> PackManifest.ImageCredit {
            PackManifest.ImageCredit(
                title: title, author: "USFWS", license: "Public domain", licenseURL: page, source: "Wikimedia Commons",
                sourceURL: page, changes: changes
            )
        }
        let leaf = PackManifest.ImageCredit(title: "A leaf", author: "Science Kids", license: "Science Kids", source: "Science Kids", changes: ["drawn"])
        let part = PackManifest.ImageCredit.Part(title: "Globe", author: "Ann", license: "CC0 1.0", source: "Wikimedia Commons")
        let globe = PackManifest.ImageCredit(title: "Globe", author: "Science Kids", license: "CC0 1.0", source: "composed", changes: ["composed"], parts: [part])
        let entries = [
            entry("aaa", carp("Common carp", ["cropped"])),
            entry("bbb", leaf),
            entry("ccc", carp("Common carp, tail fin", ["cropped", "resized"])),
            entry("ddd", globe),
            entry("eee", nil),
            entry("fff", globe),
            entry("ggg", carp("Common carp", ["resized"])),
            entry("hhh", nil),
        ]
        let items = ImageCreditItem.group(entries)
        #expect(items.map(\.id) == ["aaa", "bbb", "ddd", "eee", "hhh"])
        #expect(items.map(\.files) == [3, 1, 2, 1, 1])
        let carpItem = items[0]
        #expect(carpItem.lines.title == "Common carp")
        #expect(carpItem.lines.author == "USFWS")
        #expect(carpItem.lines.license == "Public domain")
        #expect(carpItem.lines.source == "Wikimedia Commons")
        #expect(carpItem.lines.sourceURL == page)
        #expect(carpItem.lines.changes == [.cropped, .resized], "every change of the crops, once each")
        #expect(items[1].lines.changes == [.drawn])
        #expect(items[2].lines.changes == [.composed])
        #expect(items[2].lines.parts.count == 1)
    }

    /// The bundled pack (when the build has one): fewer cards than files, every file in one card.
    @Test(.enabled(if: BundledContentTests.hasPack)) func bundledPackCreditsGrouped() async throws {
        let content = try #require(await BundledContent.load().ready)
        let items = ImageCreditItem.group(content.imageCredits)
        #expect(items.count < content.imageCredits.count)
        #expect(items.map(\.files).reduce(0, +) == content.imageCredits.count)
        #expect(Set(items.map(\.id)).count == items.count)
    }

    /// SK-052: numbers in the app's language, not the device's region: "1,666" in English.
    @Test func numbersFollowTheInterfaceLanguage() {
        let en = AppLocale.interface(preferredLocalizations: ["en"])
        let vi = AppLocale.interface(preferredLocalizations: ["vi"])
        #expect(1666.formatted(.number.locale(en)) == "1,666")
        #expect(1666.formatted(.number.locale(vi)) == "1.666")
        #expect(AppLocale.interface(preferredLocalizations: []).identifier == "en")
        // `Text("credits.count \(n)")` formats `n` with the environment's locale, which RootView sets.
        let key = String(localized: "credits.count \(1666)", locale: en)
        #expect(key.contains("1,666"), "\(key)")
    }

    @Test func creditLines() {
        let credit = PackManifest.ImageCredit(
            title: "Volcano", author: "USGS", license: "Public domain", licenseURL: "https://www.usgs.gov/information-policies-and-instructions/copyrights-and-credits",
            source: "USGS", sourceURL: "https://www.usgs.gov/media/images/x"
        )
        let lines = ImageCreditLines(credit)
        #expect(lines.title == "Volcano")
        #expect(lines.author == "USGS")
        #expect(lines.license == "Public domain")
        #expect(lines.source == "USGS")
        #expect(lines.sourceURL == "https://www.usgs.gov/media/images/x")
        #expect(lines.licenseURL?.hasPrefix("https://www.usgs.gov/") == true)
        // An image listed without a credit: the card says "Untitled picture" and nothing else.
        #expect(ImageCreditLines(nil) == ImageCreditLines(PackManifest.ImageCredit()))
        #expect(ImageCreditLines(nil).title == nil)
        // No changes, no parts: no change line, no "Source images".
        #expect(lines.changes.isEmpty)
        #expect(lines.parts.isEmpty)
        #expect(ImageCreditLines(nil).changes.isEmpty && ImageCreditLines(nil).parts.isEmpty)
    }

    /// A composed picture (SK-033, 10/11): no "Source: composed" line, the change line starts with
    /// "Composed from several images", and each source picture has its own lines below.
    @Test func composedCreditLines() {
        let globe = PackManifest.ImageCredit.Part(
            title: "Old globe", author: "Ann", license: "CC BY 3.0", licenseURL: "https://creativecommons.org/licenses/by/3.0/",
            source: "Wikimedia Commons", sourceURL: "https://commons.wikimedia.org/wiki/File:Globe.jpg"
        )
        let hand = PackManifest.ImageCredit.Part(title: nil, author: "Pexels", license: "CC0 1.0", source: "Wikimedia Commons")
        let credit = PackManifest.ImageCredit(
            title: "Land and water on a globe", author: "Science Kids (ghép từ ảnh nguồn)", license: "CC BY 4.0",
            licenseURL: "https://creativecommons.org/licenses/by/4.0/", source: "composed",
            changes: ["composed", "cropped", "resized"], parts: [globe, hand]
        )
        let lines = ImageCreditLines(credit)
        #expect(lines.title == "Land and water on a globe")
        #expect(lines.author == "Science Kids (ghép từ ảnh nguồn)")
        #expect(lines.license == "CC BY 4.0")
        #expect(lines.source == nil, "`composed` is a marker, not a place")
        #expect(lines.licenseURL == "https://creativecommons.org/licenses/by/4.0/")
        #expect(lines.changes == [.composed, .cropped, .resized])
        #expect(lines.parts.count == 2)

        let first = lines.parts[0]
        #expect(first.title == "Old globe")
        #expect(first.author == "Ann")
        #expect(first.license == "CC BY 3.0")
        #expect(first.source == "Wikimedia Commons")
        #expect(first.sourceURL == "https://commons.wikimedia.org/wiki/File:Globe.jpg")
        #expect(first.licenseURL == "https://creativecommons.org/licenses/by/3.0/")
        #expect(first.changes.isEmpty && first.parts.isEmpty, "a source picture has no change line of its own")
        // A source without a title shows "Untitled picture", like a picture without credit.
        #expect(lines.parts[1].title == nil)
        #expect(lines.parts[1].author == "Pexels")
    }

    @Test func plainCreditChangeLine() {
        let credit = PackManifest.ImageCredit(
            title: "Sea", author: "Ann", license: "CC BY 4.0", source: "Wikimedia Commons", changes: ["cropped", "resized"]
        )
        let lines = ImageCreditLines(credit)
        #expect(lines.source == "Wikimedia Commons")
        #expect(lines.changes == [.cropped, .resized])
        #expect(lines.parts.isEmpty)
    }

    /// A picture Science Kids drew (SK-033 dev 10/11): `drawn` has its own label, not "Edited",
    /// and "Licence: Science Kids" is left out when the source says Science Kids too.
    @Test func drawnCreditLines() {
        let credit = PackManifest.ImageCredit(
            title: "Layers of the Earth", author: "Science Kids", license: "Science Kids", licenseURL: nil,
            source: "Science Kids", changes: ["drawn"]
        )
        let lines = ImageCreditLines(credit)
        #expect(lines.changes == [.drawn])
        #expect(ImageCreditChange(manifestValue: "Drawn") == .drawn)
        #expect(lines.license == nil, "no line repeating the source")
        #expect(lines.source == "Science Kids")
        #expect(lines.author == "Science Kids")
        #expect(lines.licenseURL == nil)
        // Another licence, or another source, keeps the licence line.
        let photo = PackManifest.ImageCredit(title: "Sea", author: "Science Kids", license: "CC BY 4.0", source: "Science Kids", changes: ["drawn"])
        #expect(ImageCreditLines(photo).license == "CC BY 4.0")
        let elsewhere = PackManifest.ImageCredit(title: "Sea", license: "Science Kids", source: "Wikimedia Commons")
        #expect(ImageCreditLines(elsewhere).license == "Science Kids")
        // A drawn source picture of a composed one: no licence line; the composed picture keeps its own.
        let globe = PackManifest.ImageCredit.Part(title: "Globe", author: "Science Kids", license: "Science Kids", source: "Science Kids")
        let composed = PackManifest.ImageCredit(title: "Globe and map", author: "Science Kids", license: "Science Kids", source: "composed", changes: ["composed"], parts: [globe])
        let composedLines = ImageCreditLines(composed)
        #expect(composedLines.license == "Science Kids", "source `composed`: the licence line stays")
        #expect(composedLines.parts.first?.license == nil)
        #expect(composedLines.parts.first?.source == "Science Kids")
    }

    @Test func changeLineRules() {
        // Manifest order, no repeats, names in any case.
        #expect(ImageCreditChange.lines(["resized", "Cropped", "resized"], composed: false) == [.resized, .cropped])
        // A value the app does not know is never hidden: one "Edited".
        #expect(ImageCreditChange.lines(["cropped", "recoloured", "flipped"], composed: false) == [.cropped, .edited])
        // Composed first, even when the manifest lists it later or not at all.
        #expect(ImageCreditChange.lines(["cropped", "composed"], composed: true) == [.composed, .cropped])
        #expect(ImageCreditChange.lines([], composed: true) == [.composed])
        #expect(ImageCreditChange.lines([], composed: false).isEmpty)
        // Parts without the `composed` source (or without changes) still say "Composed…".
        let partsOnly = PackManifest.ImageCredit(title: "Two rocks", source: "Wikimedia Commons", parts: [.init(title: "Rock")])
        #expect(ImageCreditLines(partsOnly).changes == [.composed])
        #expect(ImageCreditLines(partsOnly).source == "Wikimedia Commons")
        #expect(ImageCreditLines(PackManifest.ImageCredit(source: "Composed")).source == nil)
    }

    @Test(arguments: [
        ("en", "Composed from several images", "Drawn by Science Kids", "Cropped", "Resized", "Edited", "Source images"),
        ("vi", "Ghép từ nhiều ảnh", "Hình vẽ của Science Kids", "Đã cắt", "Đã thu nhỏ", "Đã chỉnh sửa", "Ảnh nguồn"),
    ])
    @MainActor func changeStrings(
        language: String, composed: String, drawn: String, cropped: String, resized: String, edited: String, parts: String
    ) throws {
        let bundle = try InfoPlistTests.bundle(language)
        func text(_ key: String) -> String { bundle.localizedString(forKey: key, value: "<missing>", table: nil) }
        let expected: [ImageCreditChange: String] = [
            .composed: composed, .drawn: drawn, .cropped: cropped, .resized: resized, .edited: edited,
        ]
        for change in ImageCreditChange.allCases {
            #expect(text(change.key) == expected[change], "\(language) \(change.key)")
        }
        #expect(text("credits.parts") == parts)
    }

    @Test(arguments: [
        ("en", "Image credits", "By Ann", "Licence: CC BY 4.0", "Source: NASA", "Page: https://x", "Pictures in this build: 3"),
        ("vi", "Nguồn hình", "Tác giả: Ann", "Giấy phép: CC BY 4.0", "Nguồn: NASA", "Trang gốc: https://x", "Số hình trong bản này: 3"),
    ])
    @MainActor func strings(language: String, title: String, author: String, license: String, source: String, page: String, count: String) throws {
        let bundle = try InfoPlistTests.bundle(language)
        func format(_ key: String, _ args: any CVarArg...) -> String {
            String(format: bundle.localizedString(forKey: key, value: "<missing>", table: nil), arguments: args)
        }
        #expect(format("credits.title") == title)
        #expect(format("credits.entry") == title)
        #expect(format("credits.author %@", "Ann") == author)
        #expect(format("credits.license %@", "CC BY 4.0") == license)
        #expect(format("credits.source %@", "NASA") == source)
        #expect(format("credits.page %@", "https://x") == page)
        #expect(format("credits.count %lld", 3) == count)
        for key in ["credits.back", "credits.intro", "credits.untitled", "credits.license_page %@"] {
            #expect(format(key, "x") != "<missing>", "\(language) \(key)")
        }
    }

    /// `-SKContentPack <path>` opens a pack built on the Mac (debug), to try one with pictures.
    @Test func contentPackOption() {
        #expect(LaunchOptions(arguments: ["app", "-SKContentPack", "/tmp/pack"]).contentPack == "/tmp/pack")
        #expect(LaunchOptions(arguments: ["app"]).contentPack == nil)
        #expect(LaunchOptions(arguments: ["app", "-SKContentPack"]).contentPack == nil, "value missing")
        #expect(LaunchOptions.current.contentPack == nil)
    }
}
