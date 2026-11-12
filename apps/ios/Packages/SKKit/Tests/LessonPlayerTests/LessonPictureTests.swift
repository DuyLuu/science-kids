import ContentModel
import CoreGraphics
import DesignSystem
import Foundation
import ImageIO
import SwiftUI
import Testing
import UniformTypeIdentifiers
@testable import LessonPlayer

/// SK-033: the lesson screens draw a content `Image` with `ContentPicture(image:color:size:box:)`
/// (question, choice cells, word cards, Chơi shelf, Học sheet, reward card). With `image.asset`
/// in the pack the photo shows; with no asset, no image or no pack the stand-in art stays.
@MainActor
@Suite struct LessonPictureTests {
    static let alt = BilingualText(en: "A sweet potato", vi: "Củ khoai lang")

    @Test("A content image whose asset is in the pack draws the photo; otherwise the stand-in art")
    func drawsTheContentImage() async throws {
        let jpeg = try LessonJPEG.make(width: 90, height: 60)
        let hash = "5eed" + String(repeating: "0", count: 60)
        let store = PictureStore(loader: MemoryPictures([hash: jpeg]))
        let size: CGFloat = 100
        _ = try #require(await store.picture(hash, side: PictureStore.pixelSide(for: CGSize(width: size, height: size), scale: 1)))

        let withAsset = ContentImage(alt: Self.alt, brief: nil, asset: hash)
        #expect(try Self.middle(ContentPicture(image: withAsset, color: nil, size: size), store: store).isRed)
        // The Học sheet: the photo on a piece of the group's colour.
        #expect(try Self.middle(ContentPicture(image: withAsset, color: Tokens.Palette.vangHoe, size: size), store: store).isRed)

        let noAsset = ContentImage(alt: Self.alt, brief: "brief only", asset: nil)
        #expect(try !Self.middle(ContentPicture(image: noAsset, color: nil, size: size), store: store).isRed)
        #expect(try !Self.middle(ContentPicture(image: nil, color: nil, size: size), store: store).isRed)
        #expect(try !Self.middle(ContentPicture(image: withAsset, color: nil, size: size), store: nil).isRed, "fixtures: no pack")
    }

    @Test("The picture's VoiceOver label is the image's alt; no image, no label")
    func pictureLabel() throws {
        let image = ContentImage(alt: Self.alt, brief: nil, asset: "abc")
        // The label goes through the same init as before (`alt.en`), whatever the pack holds.
        let labelled = ContentPicture(image: image, color: nil, size: 50)
        let mirror = Mirror(reflecting: labelled)
        let label = mirror.children.first { $0.label == "label" }?.value as? Text
        #expect(label == Text(verbatim: "A sweet potato"))
        let asset = mirror.children.first { $0.label == "asset" }?.value as? String
        #expect(asset == "abc")
        // No image: the `label` field is there and empty (decorative art). `as? Text` on the boxed
        // `Optional<Text>.none` gives nil; `as? Text?` would be flattened by the cast (9/11 run).
        let none = Mirror(reflecting: ContentPicture(image: nil, color: nil, size: 50))
        let noLabel = try #require(none.children.first { $0.label == "label" })
        #expect(noLabel.value as? Text == nil)
    }

    // MARK: Helpers

    struct Pixel {
        let red: UInt8, green: UInt8, blue: UInt8
        var isRed: Bool { red > 200 && green < 70 && blue < 70 }
    }

    struct Failed: Error {}

    static func middle(_ view: some View, store: PictureStore?) throws -> Pixel {
        let renderer = ImageRenderer(content: view.environment(\.pictureStore, store).environment(\.displayScale, 1))
        renderer.scale = 1
        guard let image = renderer.cgImage, let space = CGColorSpace(name: CGColorSpace.sRGB) else { throw Failed() }
        var bytes = [UInt8](repeating: 0, count: 4)
        let x = image.width / 2, y = image.height / 2
        let drawn = bytes.withUnsafeMutableBytes { buffer -> Bool in
            guard let context = CGContext(
                data: buffer.baseAddress, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: space,
                bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
            ) else { return false }
            context.draw(image, in: CGRect(x: -x, y: -(image.height - 1 - y), width: image.width, height: image.height))
            return true
        }
        guard drawn else { throw Failed() }
        return Pixel(red: bytes[0], green: bytes[1], blue: bytes[2])
    }
}

/// Pictures in memory, as the pack would serve them after its sha256 check.
private struct MemoryPictures: PictureLoader {
    let files: [String: Data]

    init(_ files: [String: Data]) { self.files = files }

    func hasPicture(_ hash: String) -> Bool { files[hash] != nil }

    func pictureData(for hash: String) async throws -> Data {
        guard let data = files[hash] else { throw URLError(.fileDoesNotExist) }
        return data
    }
}

/// A red JPEG made in the test.
private enum LessonJPEG {
    struct Failed: Error {}

    static func make(width: Int, height: Int) throws -> Data {
        guard let space = CGColorSpace(name: CGColorSpace.sRGB),
              let context = CGContext(
                data: nil, width: width, height: height, bitsPerComponent: 8, bytesPerRow: 0, space: space,
                bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue
              ),
              let red = CGColor(colorSpace: space, components: [1, 0, 0, 1])
        else { throw Failed() }
        context.setFillColor(red)
        context.fill(CGRect(x: 0, y: 0, width: width, height: height))
        guard let image = context.makeImage() else { throw Failed() }
        let data = NSMutableData()
        guard let destination = CGImageDestinationCreateWithData(data, UTType.jpeg.identifier as CFString, 1, nil) else { throw Failed() }
        CGImageDestinationAddImage(destination, image, [kCGImageDestinationLossyCompressionQuality: 0.82] as CFDictionary)
        guard CGImageDestinationFinalize(destination) else { throw Failed() }
        return data as Data
    }
}
