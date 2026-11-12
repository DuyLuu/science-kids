import SwiftUI

/// The picture of a content `Image` (SK-033): the pack's own picture when its `asset` is in the
/// pack, else the stand-in `PlaceholderArt` exactly as before.
///
/// A real picture is a cut-out photo laid on the paper (style E): cropped to its box (aspect
/// fill), rounded like a paper piece (`PaperMetrics.pictureRadius`), the thin paper shadow
/// (`shadow.paper_1`), no stroke. With a `color` (the Học group, the reward card) it sits on a
/// tilted piece of paper in that colour; with none (quiz options, word cards, the Chơi shelf,
/// whose group must not show before the pick, SK-031) it lies on the cell's own paper.
///
/// While the file is read and decoded (off the main thread, a few milliseconds) the box shows
/// giấy lõm; a picture that cannot be read or does not pass its sha256 check falls back to
/// `PlaceholderArt`. No animation: the screen's own reveal is the only entrance.
///
/// VoiceOver reads `accessibilityLabel` (the picture's `alt`) as an image; without one the
/// picture is decorative.
public struct ContentPicture: View {
    /// The box the picture fills.
    public enum Box: Sendable, Equatable {
        /// `size` × `size`: the question sheet, the Học sheet, the reward card.
        case square
        /// The width the layout gives × `size` high: a picture cell of a grid (choice, word card,
        /// Chơi shelf), so the photo spans the cell instead of a small square in its middle. The
        /// cell's height does not change: the box is exactly as high as the stand-in art.
        case fillWidth
    }

    private let asset: String?
    private let color: Color?
    private let size: CGFloat
    private let box: Box
    private let label: Text?
    @Environment(\.pictureStore) private var store

    public init(asset: String?, color: Color?, size: CGFloat, box: Box = .square, accessibilityLabel: Text? = nil) {
        self.asset = asset
        self.color = color
        self.size = size
        self.box = box
        self.label = accessibilityLabel
    }

    public var body: some View {
        if let store, let hash = Self.pictureHash(asset: asset, store: store) {
            PhotoPiece(store: store, hash: hash, backing: box == .square ? color : nil, size: size, box: box, label: label)
        } else {
            PlaceholderArt(color: color, size: size, accessibilityLabel: label)
        }
    }

    /// The pack's picture to draw for `asset`, or `nil` for the stand-in art: no asset, no pack,
    /// not an image of the pack, or a picture that already failed.
    nonisolated public static func pictureHash(asset: String?, store: PictureStore?) -> String? {
        guard let asset, !asset.isEmpty, let store, store.hasPicture(asset) else { return nil }
        return asset.lowercased()
    }
}

/// The real picture: its box, its paper, its loading.
private struct PhotoPiece: View {
    let store: PictureStore
    let hash: String
    let backing: Color?
    let size: CGFloat
    let box: ContentPicture.Box
    let label: Text?

    @Environment(\.displayScale) private var scale
    @State private var loaded: Loaded?
    @State private var failed = false
    /// The photo's box in points, measured after layout; seeded with an estimate so the first
    /// frame can already show a picture decoded before (screens visited again).
    @State private var boxSize: CGSize

    private struct Loaded {
        let hash: String
        let picture: DecodedPicture
    }

    init(store: PictureStore, hash: String, backing: Color?, size: CGFloat, box: ContentPicture.Box, label: Text?) {
        self.store = store
        self.hash = hash
        self.backing = backing
        self.size = size
        self.box = box
        self.label = label
        let side = backing == nil ? size : size * PaperMetrics.pictureOnBacking
        _boxSize = State(initialValue: box == .fillWidth
            ? CGSize(width: size * PaperMetrics.pictureWidthEstimate, height: size)
            : CGSize(width: side, height: side))
    }

    var body: some View {
        let piece = Group {
            if failed {
                PlaceholderArt(color: backing, size: size)
                    .frame(maxWidth: box == .fillWidth ? .infinity : nil)
            } else {
                switch box {
                case .square: square
                case .fillWidth: photo(width: nil).frame(maxWidth: .infinity)
                }
            }
        }
        if let label {
            piece
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(label)
                .accessibilityAddTraits(.isImage)
        } else {
            piece.accessibilityHidden(true)
        }
    }

    private var square: some View {
        ZStack {
            if let backing {
                RoundedRectangle(cornerRadius: PaperMetrics.pictureRadius, style: .continuous)
                    .fill(backing)
                    .frame(width: size * PaperMetrics.pictureBacking, height: size * PaperMetrics.pictureBacking)
                    .rotationEffect(PaperMetrics.placeholderTilt)
                    .paperDropShadow(Tokens.Shadow.paper1)
            }
            photo(width: backing == nil ? size : size * PaperMetrics.pictureOnBacking)
        }
        .frame(width: size, height: size)
    }

    /// The photo in its rounded box, `width` × `width` (square) or the given width × `size`.
    private func photo(width: CGFloat?) -> some View {
        let shape = RoundedRectangle(cornerRadius: PaperMetrics.pictureRadius, style: .continuous)
        let side = PictureStore.pixelSide(for: boxSize, scale: scale)
        let shown = loaded.flatMap { $0.hash == hash ? $0.picture : nil } ?? store.cachedPicture(hash, side: side)
        return shape
            .fill(Tokens.Role.surfaceSunken)
            .overlay {
                if let shown {
                    // Decorative: the label is on the whole piece.
                    Image(decorative: shown.cgImage, scale: scale)
                        .resizable()
                        .scaledToFill()
                        .allowsHitTesting(false)
                }
            }
            .frame(width: width, height: width ?? size)
            .clipShape(shape)
            .onGeometryChange(for: CGSize.self) { proxy in
                proxy.size
            } action: { newSize in
                boxSize = newSize
            }
            .paperDropShadow(Tokens.Shadow.paper1)
            .task(id: "\(hash)@\(side)") {
                await load(side: side)
            }
    }

    private func load(side: Int) async {
        guard side > 0 else { return }
        if let current = loaded, current.hash == hash,
           min(current.picture.pixelWidth, current.picture.pixelHeight) >= side {
            return
        }
        let picture = await store.picture(hash, side: side)
        guard !Task.isCancelled else { return }
        if let picture {
            loaded = Loaded(hash: hash, picture: picture)
        } else {
            failed = true
        }
    }
}
