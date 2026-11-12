import CoreGraphics
import Foundation
import ImageIO
import os
import SwiftUI

/// Where the bytes of a content picture come from (SK-033): the content pack, which checks them
/// against its manifest first (size, sha256), as it does for the voice clips.
public protocol PictureLoader: Sendable {
    /// Whether the pack lists `hash` as an image (no file read). The screens draw the picture
    /// when it does, the stand-in art (`PlaceholderArt`) when it does not.
    func hasPicture(_ hash: String) -> Bool
    /// The checked bytes of the picture (a JPEG).
    func pictureData(for hash: String) async throws -> Data
}

/// A picture decoded at the size it is drawn. A class so that `NSCache` can hold it; `CGImage`
/// is immutable, so sharing it across threads is safe.
public final class DecodedPicture: @unchecked Sendable {
    public let cgImage: CGImage

    init(cgImage: CGImage) {
        self.cgImage = cgImage
    }

    public var pixelWidth: Int { cgImage.width }
    public var pixelHeight: Int { cgImage.height }
    /// Bytes the decoded picture holds in memory (the cache's cost).
    var cost: Int { cgImage.bytesPerRow * cgImage.height }
}

/// Reads, decodes and keeps the content pictures (SK-033).
///
/// - Bytes come from a `PictureLoader` (the pack's checked assets). A picture that fails (missing,
///   refused by the sha256 check, not a JPEG) is remembered: from then on `hasPicture` is false
///   and the screens draw the stand-in art, without reading the file again.
/// - Decoding uses ImageIO's thumbnail path at the size the picture is drawn (never the full
///   1024 px file for a 50pt cell) and decodes right away (`ShouldCacheImmediately`), so drawing
///   does not decode on the main thread.
/// - `picture(_:side:)` is a nonisolated async method: called from a view's `.task`, the read,
///   the hash check and the decode run on the cooperative pool, not on the main actor.
/// - Decoded pictures sit in an `NSCache` (memory only) with a cost limit, so the system can
///   drop them under memory pressure; a lesson's pictures stay while the child moves between
///   its steps.
public final class PictureStore: Sendable {
    /// Decode sizes are rounded up to a step of this many pixels, so boxes of near sizes share one
    /// decoded picture.
    public static let pixelStep = 128
    /// Default memory for decoded pictures: a lesson has about 40 pictures, each about 0.5–1 MB
    /// decoded at cell size.
    public static let defaultCostLimit = 64 * 1024 * 1024

    private let loader: any PictureLoader
    private let cache: PictureCache
    private let failed = OSAllocatedUnfairLock(initialState: Set<String>())
    private let log = Logger(subsystem: Bundle.main.bundleIdentifier ?? "ScienceKids", category: "pictures")

    public init(loader: any PictureLoader, costLimit: Int = PictureStore.defaultCostLimit) {
        self.loader = loader
        self.cache = PictureCache(costLimit: costLimit)
    }

    /// Whether to draw the pack's picture for `hash`: the pack has it and it has not failed.
    public func hasPicture(_ hash: String) -> Bool {
        let key = hash.lowercased()
        return loader.hasPicture(key) && !failed.withLock { $0.contains(key) }
    }

    /// The picture already decoded for this size, if any (no file read; safe in a view's body).
    public func cachedPicture(_ hash: String, side: Int) -> DecodedPicture? {
        cache.object(forKey: Self.cacheKey(hash, side: side))
    }

    /// The picture decoded so that its shorter side is at least `side` pixels (or the file's own
    /// size if smaller). `nil` when it cannot be had; then `hasPicture` turns false.
    public func picture(_ hash: String, side: Int) async -> DecodedPicture? {
        let key = hash.lowercased()
        if let hit = cachedPicture(key, side: side) { return hit }
        guard hasPicture(key) else { return nil }
        let data: Data
        do {
            data = try await loader.pictureData(for: key)
        } catch {
            markFailed(key, reason: String(describing: error))
            return nil
        }
        guard let decoded = Self.decode(data, shortSide: side) else {
            markFailed(key, reason: "not a picture ImageIO can decode")
            return nil
        }
        cache.set(decoded, forKey: Self.cacheKey(key, side: side))
        return decoded
    }

    private func markFailed(_ key: String, reason: String) {
        failed.withLock { _ = $0.insert(key) }
        log.error("picture \(key.prefix(12), privacy: .public)… not shown (stand-in art instead): \(reason, privacy: .public)")
    }

    // MARK: Sizes

    /// The decode size for a box of `size` points on a screen of `scale`: the box's longer side in
    /// pixels, rounded up to `pixelStep`. `0` for an empty box (nothing to load yet).
    public static func pixelSide(for size: CGSize, scale: CGFloat) -> Int {
        let longest = max(size.width, size.height) * max(scale, 1)
        guard longest.isFinite, longest > 0 else { return 0 }
        return Int((longest / CGFloat(pixelStep)).rounded(.up)) * pixelStep
    }

    static func cacheKey(_ hash: String, side: Int) -> NSString {
        "\(hash.lowercased())@\(side)" as NSString
    }

    /// Decodes `data` with its shorter side at least `shortSide` pixels, so that any box whose
    /// longer side is `shortSide` is covered when the picture fills it (aspect fill). Never larger
    /// than the file; EXIF orientation applied (the contract strips EXIF, but a stray one must not
    /// turn the picture).
    static func decode(_ data: Data, shortSide: Int) -> DecodedPicture? {
        guard shortSide > 0,
              let source = CGImageSourceCreateWithData(data as CFData, [kCGImageSourceShouldCache: false] as CFDictionary),
              CGImageSourceGetCount(source) > 0
        else { return nil }
        let properties = CGImageSourceCopyPropertiesAtIndex(source, 0, nil) as? [CFString: Any]
        let width = properties?[kCGImagePropertyPixelWidth] as? Int ?? 0
        let height = properties?[kCGImagePropertyPixelHeight] as? Int ?? 0
        let long = max(width, height)
        let short = min(width, height)
        guard long > 0, short > 0 else { return nil }
        let wanted = (Double(shortSide) * Double(long) / Double(short)).rounded(.up)
        let maxPixel = min(long, max(1, Int(wanted)))
        let options: [CFString: Any] = [
            kCGImageSourceCreateThumbnailFromImageAlways: true,
            kCGImageSourceCreateThumbnailWithTransform: true,
            kCGImageSourceShouldCacheImmediately: true,
            kCGImageSourceThumbnailMaxPixelSize: maxPixel,
        ]
        guard let image = CGImageSourceCreateThumbnailAtIndex(source, 0, options as CFDictionary) else { return nil }
        return DecodedPicture(cgImage: image)
    }
}

/// `NSCache` is thread-safe (Foundation documents it), but not `Sendable` in Swift's eyes.
private final class PictureCache: @unchecked Sendable {
    private let cache = NSCache<NSString, DecodedPicture>()

    init(costLimit: Int) {
        cache.totalCostLimit = costLimit
        cache.name = "SKContentPictures"
    }

    func object(forKey key: NSString) -> DecodedPicture? {
        cache.object(forKey: key)
    }

    func set(_ picture: DecodedPicture, forKey key: NSString) {
        cache.setObject(picture, forKey: key, cost: picture.cost)
    }
}

// MARK: - Environment

private struct PictureStoreKey: EnvironmentKey {
    static let defaultValue: PictureStore? = nil
}

extension EnvironmentValues {
    /// The content pack's pictures; `nil` with the fixtures, in previews and in tests without a
    /// pack (every picture draws its stand-in art).
    public var pictureStore: PictureStore? {
        get { self[PictureStoreKey.self] }
        set { self[PictureStoreKey.self] = newValue }
    }
}
