import CoreGraphics
import Foundation
import ImageIO
import os
import SwiftUI
import Testing
import UniformTypeIdentifiers
@testable import DesignSystem

/// SK-033: content pictures. `PictureStore` reads through its loader (the pack's checked bytes),
/// decodes at the drawn size and keeps the result; `ContentPicture` draws the pack's picture when
/// the content's `asset` is in the pack, the stand-in art otherwise.
@Suite struct PictureStoreTests {
    // MARK: Sizes

    @Test("Decode sizes: the box's longer side in pixels, rounded up to 128")
    func pixelSides() {
        #expect(PictureStore.pixelSide(for: CGSize(width: 50, height: 50), scale: 3) == 256)
        #expect(PictureStore.pixelSide(for: CGSize(width: 93, height: 50), scale: 3) == 384)
        #expect(PictureStore.pixelSide(for: CGSize(width: 128, height: 10), scale: 1) == 128)
        #expect(PictureStore.pixelSide(for: CGSize(width: 129, height: 10), scale: 1) == 256)
        #expect(PictureStore.pixelSide(for: .zero, scale: 3) == 0, "no box yet: nothing to load")
        #expect(PictureStore.pixelSide(for: CGSize(width: CGFloat.infinity, height: 10), scale: 2) == 0)
    }

    @Test("Decoding: the shorter side covers the box, never more than the file")
    func decodeSizes() throws {
        let jpeg = try PictureJPEG.make(width: 400, height: 300, rgb: (1, 0, 0))
        let small = try #require(PictureStore.decode(jpeg, shortSide: 128))
        #expect(min(small.pixelWidth, small.pixelHeight) >= 128)
        #expect(max(small.pixelWidth, small.pixelHeight) < 400, "smaller than the file")
        #expect(small.pixelWidth > small.pixelHeight, "keeps its aspect")
        let full = try #require(PictureStore.decode(jpeg, shortSide: 1024))
        #expect(full.pixelWidth == 400 && full.pixelHeight == 300, "never larger than the file")
        #expect(PictureStore.decode(Data("not a jpeg".utf8), shortSide: 128) == nil)
        #expect(PictureStore.decode(jpeg, shortSide: 0) == nil)
    }

    // MARK: Store

    @Test("A picture is read once, then served from memory")
    func cachesDecodedPictures() async throws {
        let jpeg = try PictureJPEG.make(width: 200, height: 150, rgb: (0, 0.6, 0))
        let loader = FakePictures(["abc": jpeg])
        let store = PictureStore(loader: loader)
        #expect(store.hasPicture("abc"))
        #expect(store.hasPicture("ABC"), "hashes are hex, any case")
        #expect(store.cachedPicture("abc", side: 128) == nil)
        let first = try #require(await store.picture("abc", side: 128))
        let again = try #require(await store.picture("abc", side: 128))
        #expect(first === again)
        #expect(store.cachedPicture("abc", side: 128) === first)
        #expect(loader.reads == 1)
        // Another size is another decode.
        _ = await store.picture("abc", side: 256)
        #expect(loader.reads == 2)
    }

    @Test("A picture the pack does not have, or that fails its check, draws the stand-in art")
    func failuresFallBack() async throws {
        let loader = FakePictures(["good": try PictureJPEG.make(width: 10, height: 10, rgb: (0, 0, 1)), "broken": Data("x".utf8)],
                                  refused: ["refused"])
        let store = PictureStore(loader: loader)
        #expect(!store.hasPicture("missing"))
        #expect(await store.picture("missing", side: 128) == nil)
        #expect(loader.reads == 0, "not in the pack: no read")

        #expect(store.hasPicture("refused"))
        #expect(await store.picture("refused", side: 128) == nil)
        #expect(!store.hasPicture("refused"), "a refused picture is not tried again")

        #expect(await store.picture("broken", side: 128) == nil)
        #expect(!store.hasPicture("broken"))
        #expect(store.hasPicture("good"))
    }

    // MARK: Choosing the picture

    @Test("ContentPicture draws the pack's picture only when the asset is in the pack")
    func choosesThePackPicture() async throws {
        let store = PictureStore(loader: FakePictures(["abc": try PictureJPEG.make(width: 10, height: 10, rgb: (1, 0, 0))], refused: ["bad"]))
        #expect(ContentPicture.pictureHash(asset: "abc", store: store) == "abc")
        #expect(ContentPicture.pictureHash(asset: "ABC", store: store) == "abc")
        #expect(ContentPicture.pictureHash(asset: nil, store: store) == nil, "no asset: stand-in art")
        #expect(ContentPicture.pictureHash(asset: "", store: store) == nil)
        #expect(ContentPicture.pictureHash(asset: "zzz", store: store) == nil, "not in the pack")
        #expect(ContentPicture.pictureHash(asset: "abc", store: nil) == nil, "no pack (fixtures)")
        _ = await store.picture("bad", side: 128)
        #expect(ContentPicture.pictureHash(asset: "bad", store: store) == nil, "failed once: stand-in art")
    }

    /// Rendered: with the pack's picture in memory the middle of the box is the photo's colour;
    /// without it, the stand-in art (giấy lõm piece) is there instead.
    @MainActor
    @Test("Rendered: the photo fills its box; no picture keeps PlaceholderArt")
    func rendersThePhoto() async throws {
        let red = try PictureJPEG.make(width: 120, height: 80, rgb: (1, 0, 0))
        let store = PictureStore(loader: FakePictures(["red": red]))
        let size: CGFloat = 100
        // As the view will ask on its first frame (square box, scale 1).
        _ = try #require(await store.picture("red", side: PictureStore.pixelSide(for: CGSize(width: size, height: size), scale: 1)))

        let photo = try PictureRender.middle(of: ContentPicture(asset: "red", color: nil, size: size), store: store)
        #expect(photo.isRed, "\(photo)")
        let onPaper = try PictureRender.middle(of: ContentPicture(asset: "red", color: Tokens.Palette.giDong, size: size), store: store)
        #expect(onPaper.isRed, "on a coloured piece, the photo is on top: \(onPaper)")
        let none = try PictureRender.middle(of: ContentPicture(asset: nil, color: nil, size: size), store: store)
        #expect(!none.isRed, "\(none)")
        let unknown = try PictureRender.middle(of: ContentPicture(asset: "other", color: nil, size: size), store: store)
        #expect(!unknown.isRed, "\(unknown)")
        let noPack = try PictureRender.middle(of: ContentPicture(asset: "red", color: nil, size: size), store: nil)
        #expect(!noPack.isRed, "\(noPack)")
    }
}

/// A loader with files in memory; `refused` hashes are listed but throw on read (a failed
/// sha256 check). Counts reads.
final class FakePictures: PictureLoader, @unchecked Sendable {
    private let files: [String: Data]
    private let refused: Set<String>
    private let count = OSAllocatedUnfairLock(initialState: 0)

    init(_ files: [String: Data], refused: Set<String> = []) {
        self.files = files
        self.refused = refused
    }

    var reads: Int { count.withLock { $0 } }

    func hasPicture(_ hash: String) -> Bool {
        files[hash] != nil || refused.contains(hash)
    }

    func pictureData(for hash: String) async throws -> Data {
        count.withLock { $0 += 1 }
        guard let data = files[hash], !refused.contains(hash) else { throw URLError(.fileDoesNotExist) }
        return data
    }
}

/// Renders a view at scale 1 and reads the pixel in its middle.
enum PictureRender {
    struct Pixel: CustomStringConvertible {
        let red: UInt8, green: UInt8, blue: UInt8
        var isRed: Bool { red > 200 && green < 70 && blue < 70 }
        var description: String { "rgb(\(red), \(green), \(blue))" }
    }

    struct Failed: Error {}

    @MainActor
    static func middle(of view: some View, store: PictureStore?) throws -> Pixel {
        let renderer = ImageRenderer(content: view
            .environment(\.pictureStore, store)
            .environment(\.displayScale, 1))
        renderer.scale = 1
        guard let image = renderer.cgImage else { throw Failed() }
        return try pixel(of: image, x: image.width / 2, y: image.height / 2)
    }

    static func pixel(of image: CGImage, x: Int, y: Int) throws -> Pixel {
        guard let space = CGColorSpace(name: CGColorSpace.sRGB) else { throw Failed() }
        var bytes = [UInt8](repeating: 0, count: 4)
        let drawn = bytes.withUnsafeMutableBytes { buffer -> Bool in
            guard let context = CGContext(
                data: buffer.baseAddress, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: space,
                bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
            ) else { return false }
            // Move the wanted pixel to the context's only pixel (Core Graphics: origin bottom left).
            context.draw(image, in: CGRect(x: -x, y: -(image.height - 1 - y), width: image.width, height: image.height))
            return true
        }
        guard drawn else { throw Failed() }
        return Pixel(red: bytes[0], green: bytes[1], blue: bytes[2])
    }
}

/// A small one-colour JPEG made in the test (no picture downloaded or kept in the repo).
enum PictureJPEG {
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

/// SK-043 (Duy 13/11, ngưỡng 2,2 main session 13/11): crop to fill unless the photo is turned
/// the other way from its box.
@Test func pictureFitCropsCloseShapesAndFitsFarOnes() {
    // A portrait parrot (3:4) in a landscape quiz card (330 × 120): 2.75 / 0.75 ≈ 3.7 → whole photo.
    #expect(PictureFit.mode(image: CGSize(width: 900, height: 1200), box: CGSize(width: 330, height: 120)) == .fit)
    // A landscape photo (4:3) in the same card: 2.75 / 1.33 ≈ 2.06 → fill (ordinary photos keep filling).
    #expect(PictureFit.mode(image: CGSize(width: 1200, height: 900), box: CGSize(width: 330, height: 120)) == .fill)
    // The same photo in the tall Explorer page picture (322 × 380): ≈ 1.57 → fill.
    #expect(PictureFit.mode(image: CGSize(width: 1200, height: 900), box: CGSize(width: 322, height: 380)) == .fill)
    // At the limit (2.2) fill; just over it, whole.
    #expect(PictureFit.mode(image: CGSize(width: 220, height: 100), box: CGSize(width: 100, height: 100)) == .fill)
    #expect(PictureFit.mode(image: CGSize(width: 230, height: 100), box: CGSize(width: 100, height: 100)) == .fit)
    // A wide strip (3:1) in a near-square shelf cell (110 × 116): ≈ 3.2 → whole.
    #expect(PictureFit.mode(image: CGSize(width: 1500, height: 500), box: CGSize(width: 110, height: 116)) == .fit)
    // Square in square, and not measured yet: fill.
    #expect(PictureFit.mode(image: CGSize(width: 500, height: 500), box: CGSize(width: 96, height: 96)) == .fill)
    #expect(PictureFit.mode(image: CGSize(width: 900, height: 1200), box: .zero) == .fill)
}
