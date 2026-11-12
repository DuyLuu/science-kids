import ContentModel
import CoreGraphics
import Foundation
import ImageIO
import Testing
import UniformTypeIdentifiers
@testable import ContentKit

/// SK-033 (image contract, 9/11): image assets in the manifest (`kind: "image"`, `width`,
/// `height`, `credit`) and their bytes read through `ContentPack`, checked like the clips.
@Suite struct ImageAssetTests {
    static let lessonID = ContentPackTests.lessonID

    static var fullCredit: [String: Any] { [
        "title": "Sweet potatoes at a market", "author": "Nguyen Van A", "license": "CC BY 4.0",
        "license_url": "https://creativecommons.org/licenses/by/4.0/", "source": "Wikimedia Commons",
        "source_url": "https://commons.wikimedia.org/wiki/File:Sweet_potatoes.jpg",
    ] }

    // MARK: Manifest

    @Test("An image asset decodes with its size and credit")
    func imageEntryDecodes() throws {
        let json = """
        { "sha256": "ab12", "size": 1234, "kind": "image", "path": "assets/ab12.jpg", "width": 1024, "height": 768,
          "credit": { "title": "Volcano", "author": "NASA", "license": "Public domain", "license_url": "https://www.nasa.gov/nasa-brand-center/images-and-media/",
                      "source": "NASA", "source_url": "https://images.nasa.gov/details/x" } }
        """
        let entry = try JSONDecoder().decode(PackManifest.AssetEntry.self, from: Data(json.utf8))
        #expect(entry.isImage)
        #expect(entry.lang == nil)
        #expect(entry.width == 1024)
        #expect(entry.height == 768)
        #expect(entry.credit == PackManifest.ImageCredit(
            title: "Volcano", author: "NASA", license: "Public domain",
            licenseURL: "https://www.nasa.gov/nasa-brand-center/images-and-media/",
            source: "NASA", sourceURL: "https://images.nasa.gov/details/x"
        ))
    }

    @Test("An audio asset of an old pack has no image keys and still decodes")
    func audioEntryWithoutImageKeys() throws {
        let json = #"{ "sha256": "cd34", "size": 99, "kind": "audio", "lang": "vi", "path": "assets/cd34.m4a" }"#
        let entry = try JSONDecoder().decode(PackManifest.AssetEntry.self, from: Data(json.utf8))
        #expect(!entry.isImage)
        #expect(entry.lang == "vi")
        #expect(entry.width == nil && entry.height == nil && entry.credit == nil)
    }

    @Test("A credit the app cannot read (wrong types, blanks) never closes the manifest")
    func looseCredit() throws {
        let json = """
        { "sha256": "ef56", "size": 10, "kind": "image", "path": "assets/ef56.jpg", "width": "wide", "height": 300,
          "credit": { "title": 42, "author": "  ", "license": "CC0 1.0", "source_url": ["x"] } }
        """
        let entry = try JSONDecoder().decode(PackManifest.AssetEntry.self, from: Data(json.utf8))
        #expect(entry.width == nil, "a width of the wrong type reads as missing")
        #expect(entry.height == 300)
        let credit = try #require(entry.credit)
        #expect(credit.title == nil)
        #expect(credit.author == nil, "blank reads as missing")
        #expect(credit.license == "CC0 1.0")
        #expect(credit.sourceURL == nil)

        let notAnObject = #"{ "sha256": "ef56", "size": 10, "kind": "image", "path": "assets/ef56.jpg", "credit": "CC0" }"#
        let bare = try JSONDecoder().decode(PackManifest.AssetEntry.self, from: Data(notAnObject.utf8))
        #expect(bare.credit == nil)
    }

    // MARK: Changes and composed pictures (10/11)

    /// The credit of a composed picture as content-cli writes it (SK-033, 10/11).
    static var composedCredit: [String: Any] { [
        "title": "Land and water on a globe", "author": "Science Kids (ghép từ ảnh nguồn)", "license": "CC BY 4.0",
        "license_url": "https://creativecommons.org/licenses/by/4.0/", "source": "composed",
        "changes": ["composed", "cropped", "resized"],
        "parts": [
            [
                "title": "Old globe facing the Americas", "author": "Ann Example", "license": "CC BY 3.0",
                "license_url": "https://creativecommons.org/licenses/by/3.0/", "source": "Wikimedia Commons",
                "source_url": "https://commons.wikimedia.org/wiki/File:Globe.jpg",
            ],
            [
                "title": "Hand holding a globe", "author": "Pexels", "license": "CC0 1.0",
                "license_url": "https://creativecommons.org/publicdomain/zero/1.0/", "source": "Wikimedia Commons",
                "source_url": "https://commons.wikimedia.org/wiki/File:Hand.jpg",
            ],
        ],
    ] }

    static func credit(_ json: [String: Any]) throws -> PackManifest.ImageCredit {
        let data = try JSONSerialization.data(withJSONObject: json)
        return try JSONDecoder().decode(PackManifest.ImageCredit.self, from: data)
    }

    @Test("A composed picture: changes and the credit of each source picture, in order")
    func composedCreditDecodes() throws {
        let credit = try Self.credit(Self.composedCredit)
        #expect(credit.isComposed)
        #expect(credit.source == "composed")
        #expect(credit.sourceURL == nil)
        #expect(credit.changes == ["composed", "cropped", "resized"])
        #expect(credit.parts == [
            .init(title: "Old globe facing the Americas", author: "Ann Example", license: "CC BY 3.0",
                  licenseURL: "https://creativecommons.org/licenses/by/3.0/", source: "Wikimedia Commons",
                  sourceURL: "https://commons.wikimedia.org/wiki/File:Globe.jpg"),
            .init(title: "Hand holding a globe", author: "Pexels", license: "CC0 1.0",
                  licenseURL: "https://creativecommons.org/publicdomain/zero/1.0/", source: "Wikimedia Commons",
                  sourceURL: "https://commons.wikimedia.org/wiki/File:Hand.jpg"),
        ])
        #expect(!credit.isEmpty)
    }

    @Test("A plain picture: changes without parts; an old credit has neither")
    func plainCreditChanges() throws {
        var json = Self.fullCredit
        json["changes"] = ["cropped", "resized"]
        let changed = try Self.credit(json)
        #expect(changed.changes == ["cropped", "resized"])
        #expect(changed.parts.isEmpty)
        #expect(!changed.isComposed)

        let old = try Self.credit(Self.fullCredit)
        #expect(old.changes.isEmpty && old.parts.isEmpty)
        #expect(!old.isComposed)
        #expect(old == PackManifest.ImageCredit(
            title: "Sweet potatoes at a market", author: "Nguyen Van A", license: "CC BY 4.0",
            licenseURL: "https://creativecommons.org/licenses/by/4.0/", source: "Wikimedia Commons",
            sourceURL: "https://commons.wikimedia.org/wiki/File:Sweet_potatoes.jpg"
        ))

        // Only changes, nothing else: still something to show.
        let onlyChanges = try Self.credit(["changes": ["cropped"]])
        #expect(!onlyChanges.isEmpty)
        let nothing = try Self.credit([:])
        #expect(nothing.isEmpty)
    }

    @Test("Changes and parts read loosely: wrong types and bad entries never drop the credit")
    func looseChangesAndParts() throws {
        var json = Self.composedCredit
        json["changes"] = ["cropped", 3, "  ", " resized ", NSNull()] as [Any]
        json["parts"] = [
            ["title": "Kept", "author": 7, "license": "CC0 1.0"] as [String: Any],
            "not an object",
            ["author": "   ", "title": ["x"]] as [String: Any],
            [:] as [String: Any],
        ] as [Any]
        let credit = try Self.credit(json)
        #expect(credit.title == "Land and water on a globe")
        #expect(credit.changes == ["cropped", "resized"], "non-text and blank entries dropped, text trimmed")
        #expect(credit.parts == [.init(title: "Kept", license: "CC0 1.0")], "a part with nothing to show is dropped")

        json["changes"] = "cropped"
        json["parts"] = ["title": "one part, not a list"]
        let wrongTypes = try Self.credit(json)
        #expect(wrongTypes.changes.isEmpty)
        #expect(wrongTypes.parts.isEmpty)
        #expect(wrongTypes.isComposed, "source composed still marks it")
        #expect(wrongTypes.license == "CC BY 4.0")

        // Parts without the `composed` source still make a composed picture.
        json["source"] = "Wikimedia Commons"
        json["parts"] = [["title": "Only part"]]
        let partsOnly = try Self.credit(json)
        #expect(partsOnly.isComposed)
        // Source spelled in another case is still the marker.
        let otherCase = try Self.credit(["source": "Composed"])
        #expect(otherCase.isComposed)
    }

    @Test("A pack with a composed picture lists it once, with its parts")
    func packWithComposedImage() async throws {
        let composed = TestPack.Image(data: try TestJPEG.make(width: 48, height: 48, rgb: (0.2, 0.4, 0.8)), width: 48, height: 48, credit: Self.composedCredit)
        var plainCredit = Self.fullCredit
        plainCredit["changes"] = ["resized"]
        let plain = TestPack.Image(data: try TestJPEG.make(width: 48, height: 32, rgb: (0.7, 0.5, 0.2)), width: 48, height: 32, credit: plainCredit)
        let made = try TestPack.made(images: [composed, plain])
        defer { made.remove() }
        let pack = try await ContentPack.load(from: DirectoryPackSource(root: made.root), appVersion: nil)
        #expect(pack.rejected.isEmpty)
        #expect(pack.images.map(\.sha256) == [composed.sha256, plain.sha256], "by title: Land… before Sweet…")
        let first = try #require(pack.images.first?.credit)
        #expect(first.isComposed)
        #expect(first.parts.map(\.title) == ["Old globe facing the Americas", "Hand holding a globe"])
        let second = try #require(pack.images.last?.credit)
        #expect(second.changes == ["resized"])
        #expect(second.parts.isEmpty && !second.isComposed)
        #expect(try await pack.imageData(for: composed.sha256) == composed.data)
    }

    @Test("A pack without any image opens, with no image and no credit")
    func packWithoutImages() async throws {
        let made = try TestPack.made()
        defer { made.remove() }
        let pack = try await ContentPack.load(from: DirectoryPackSource(root: made.root), appVersion: nil)
        #expect(pack.rejected.isEmpty)
        #expect(pack.images.isEmpty)
        // A clip is not an image: the screens draw the stand-in art for it.
        let clip = try #require(pack.manifest.assets.first)
        #expect(pack.hasAsset(clip.sha256))
        #expect(!pack.hasImage(clip.sha256))
    }

    // MARK: Reading images

    @Test("Images of a pack: listed by title, read and checked by sha256, pointed at by the lesson")
    func packWithImages() async throws {
        let potato = TestPack.Image(data: try TestJPEG.make(width: 64, height: 48, rgb: (0.8, 0.3, 0.1)), width: 64, height: 48, credit: Self.fullCredit)
        let egg = TestPack.Image(data: try TestJPEG.make(width: 40, height: 40, rgb: (0.9, 0.9, 0.7)), width: 40, height: 40,
                                 credit: ["title": "An egg", "license": "CC0 1.0", "source": "Openverse/Flickr"])
        let bare = TestPack.Image(data: try TestJPEG.make(width: 20, height: 30, rgb: (0.1, 0.5, 0.2)), width: 20, height: 30, credit: nil)
        let made = try TestPack.made(images: [potato, egg, bare], lessonEdit: { lesson in
            try Self.setOptionAsset(&lesson, item: 2, option: 0, hash: potato.sha256)
            try Self.setOptionAsset(&lesson, item: 2, option: 1, hash: egg.sha256)
        })
        defer { made.remove() }
        let pack = try await ContentPack.load(from: DirectoryPackSource(root: made.root), appVersion: nil)
        #expect(pack.rejected.isEmpty)

        // Manifest: three images, by title; the one without credit first (empty title).
        #expect(pack.images.map(\.sha256) == [bare.sha256, egg.sha256, potato.sha256])
        let potatoEntry = try #require(pack.images.last)
        #expect(potatoEntry.path == "assets/\(potato.sha256).jpg")
        #expect(potatoEntry.width == 64 && potatoEntry.height == 48)
        #expect(potatoEntry.credit?.title == "Sweet potatoes at a market")
        #expect(potatoEntry.credit?.licenseURL == "https://creativecommons.org/licenses/by/4.0/")
        #expect(pack.images.first?.credit == nil)

        // Content: the option's `image.asset` is the file's sha256.
        let lesson = try #require(pack.library.lesson(id: Self.lessonID)?.lesson)
        guard case .singleChoice(let choice) = lesson.quiz[2].answer else {
            Issue.record("q3 is not single_choice")
            return
        }
        #expect(choice.options[0].image?.asset == potato.sha256)
        #expect(choice.options[1].image?.asset == egg.sha256)
        #expect(choice.options[2].image?.asset == nil)

        // Bytes: the same JPEG, checked; upper-case hashes work too.
        #expect(pack.hasImage(potato.sha256))
        #expect(pack.hasImage(potato.sha256.uppercased()))
        let data = try await pack.imageData(for: potato.sha256)
        #expect(data == potato.data)
        #expect(CGImageSourceCreateWithData(data as CFData, nil).map(CGImageSourceGetCount) == 1)

        // A clip is not served as an image.
        let clip = try #require(pack.manifest.assets.first { !$0.isImage })
        do {
            _ = try await pack.imageData(for: clip.sha256)
            Issue.record("a clip was served as an image")
        } catch {
            #expect(error == .unknownAsset(clip.sha256))
        }
    }

    @Test("One byte of an image changed: that image is refused, the others are served")
    func changedImageIsRefused() async throws {
        let one = TestPack.Image(data: try TestJPEG.make(width: 32, height: 32, rgb: (1, 0, 0)), width: 32, height: 32, credit: Self.fullCredit)
        let two = TestPack.Image(data: try TestJPEG.make(width: 32, height: 32, rgb: (0, 0, 1)), width: 32, height: 32, credit: Self.fullCredit)
        let made = try TestPack.made(images: [one, two])
        defer { made.remove() }
        try TestPack.flipOneByte(of: made.root.appendingPathComponent("assets/\(one.sha256).jpg"))
        let pack = try await ContentPack.load(from: DirectoryPackSource(root: made.root), appVersion: nil)
        #expect(pack.rejected.isEmpty, "a bad image does not close its topic")
        #expect(pack.hasImage(one.sha256), "listed: the check happens when it is read")
        do {
            _ = try await pack.imageData(for: one.sha256)
            Issue.record("a changed image was accepted")
        } catch {
            guard case .mismatch(let path, _, _, let expected, let actual) = error else {
                Issue.record("expected .mismatch, got \(error)")
                return
            }
            #expect(path == "assets/\(one.sha256).jpg")
            #expect(expected == one.sha256)
            #expect(actual != one.sha256)
        }
        #expect(try await pack.imageData(for: two.sha256) == two.data)
    }

    /// `quiz[item].options[option].image.asset = hash` in a lesson file's JSON.
    static func setOptionAsset(_ lesson: inout [String: Any], item: Int, option: Int, hash: String) throws {
        var quiz = try #require(lesson["quiz"] as? [[String: Any]])
        var options = try #require(quiz[item]["options"] as? [[String: Any]])
        var image = try #require(options[option]["image"] as? [String: Any])
        image["asset"] = hash
        options[option]["image"] = image
        quiz[item]["options"] = options
        lesson["quiz"] = quiz
    }
}

/// A small one-colour JPEG made in the test (sRGB, quality 0.82, as the image contract), so no
/// picture is downloaded or kept in the repo.
enum TestJPEG {
    struct Failed: Error {}

    static func make(width: Int, height: Int, rgb: (CGFloat, CGFloat, CGFloat)) throws -> Data {
        guard let space = CGColorSpace(name: CGColorSpace.sRGB),
              let context = CGContext(
                data: nil, width: width, height: height, bitsPerComponent: 8, bytesPerRow: 0, space: space,
                bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue
              ),
              let color = CGColor(colorSpace: space, components: [rgb.0, rgb.1, rgb.2, 1])
        else { throw Failed() }
        context.setFillColor(color)
        context.fill(CGRect(x: 0, y: 0, width: width, height: height))
        guard let image = context.makeImage() else { throw Failed() }
        let data = NSMutableData()
        guard let destination = CGImageDestinationCreateWithData(data, UTType.jpeg.identifier as CFString, 1, nil) else { throw Failed() }
        CGImageDestinationAddImage(destination, image, [kCGImageDestinationLossyCompressionQuality: 0.82] as CFDictionary)
        guard CGImageDestinationFinalize(destination) else { throw Failed() }
        return data as Data
    }
}
