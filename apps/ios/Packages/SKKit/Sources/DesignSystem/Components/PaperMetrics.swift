import Foundation
import SwiftUI

/// Sizes of the paper components that `tokens.json` has no token for yet. They are the canvas
/// values (file and element named on each line), kept here in one place so no view writes a raw
/// number. Proposed to the designer as tokens in SK-008 (see the ticket, "Kết quả (ios-dev)").
/// Everything else comes from `Tokens`.
public enum PaperMetrics {
    // MARK: Two-layer button

    /// Face of the main button (Quiz "Kiểm tra": `height: 58px; margin-bottom: 7px`). The lower
    /// layer's offset comes from `shadow.button_under` (y = 7).
    public static let buttonFaceHeight: CGFloat = 58
    /// Inner padding left and right of a main button's label.
    public static let buttonPaddingX: CGFloat = Tokens.Space.s20
    /// Gap between a button's label and its icon ("Tiếp" + arrow: `gap: 10px`).
    public static let buttonIconGap: CGFloat = Tokens.Space.s10

    /// Smallest scale a one-line label may shrink to before it would wrap (long titles in a
    /// fixed-size button or seal; never used on the canvas lengths).
    public static let labelMinimumScale: CGFloat = 0.8
    public static let sealMinimumScale: CGFloat = 0.6

    // MARK: Icons

    /// Icon inside a button (arrow, bulb: 22 × 22).
    public static let iconSize: CGFloat = 22
    /// Paper disc of a round icon button (`circle r = 25` in a 56 box).
    public static let iconDiscDiameter: CGFloat = 50
    /// Glyph of the speaker on its disc (24 box at `translate(16 15)` in 56).
    public static let iconGlyphSize: CGFloat = 24
    /// Cross of the close button (16 × 16 in 56, stroke 3.4).
    public static let closeGlyphSize: CGFloat = 16

    // MARK: Seal

    /// Large seal "ĐÚNG" (Quiz, QuizMyth, Warmup: 52 × 52).
    public static let sealLarge: CGFloat = 52
    /// Small seal "Đã xem" on a food-group cell, check in the tray (22 × 22).
    public static let sealSmall: CGFloat = 22
    /// Check on the small seal (Play: 14 × 14).
    public static let sealSmallGlyph: CGFloat = 14
    /// Seal of a topic done on the journey map (SK-034 spec 3: `28 × 28`, check `17`).
    public static let sealMedium: CGFloat = 28
    public static let sealMediumGlyph: CGFloat = 17

    // MARK: Progress squares

    /// One step square (`rect 22 × 22 rx 2`).
    public static let progressSquare: CGFloat = 22
    /// Gap between packed squares (Quiz: x step 28 − 22).
    public static let progressGap: CGFloat = Tokens.Space.s6
    /// Gap between a square and its label (Learn: square ends at y 24, label baseline 38).
    public static let progressLabelGap: CGFloat = Tokens.Space.s4

    // MARK: Tags and chips

    /// Chip of a food or food group (Learn: `height: 30px`).
    public static let chipHeight: CGFloat = 30
    /// Colour dot in a chip (6 × 6).
    public static let chipDot: CGFloat = 6
    /// Colour disc of a food-group choice (Learn: 24 × 24).
    public static let groupDisc: CGFloat = 24
    /// Text of the marks on a checked quiz cell ("Đúng", "Chưa đúng", "Bỏ sót": Phudu 12/700).
    public static let markTypography = Tokens.Typography(
        family: Tokens.FontFamily.display,
        size: 12,
        weight: Tokens.FontWeight.displayBold,
        lineHeight: 1.2,
        letterSpacing: 0,
        textCase: nil
    )
    /// "Đúng" mark: Phudu 900, letter spacing 0.5, upper case.
    public static let markCorrectTypography = Tokens.Typography(
        family: Tokens.FontFamily.display,
        size: 12,
        weight: Tokens.FontWeight.displayBlack,
        lineHeight: 1.2,
        letterSpacing: 0.5,
        textCase: .uppercase
    )
    /// Padding of a mark (`padding: 3px 7px`).
    public static let markPadding = EdgeInsets(top: 3, leading: 7, bottom: 3, trailing: 7)
    /// Inset of a mark from the cell's top-right corner (phone 6, iPad 8).
    public static let markInsetCompact: CGFloat = Tokens.Space.s6
    public static let markInsetRegular: CGFloat = Tokens.Space.s8
    /// Extra room above a row of answer cells for the marks that sit astride their top edge.
    ///
    /// A slip is about 21pt tall, so about 10.5pt of it stands above the cell. The "Đúng" seal is
    /// tilted 8°, which makes it about 28pt tall, so about 14pt of it stands above the cell. The gap
    /// above the row (`LessonMetrics.gap`, 12) alone would let the seal touch the line above (the
    /// "Chọn từ còn thiếu" caption, or the bottom of the question sheet). The canvas allows that
    /// with `top: -10px` under a 12px gap. With these 6pt there are 4pt or more of clear space.
    public static let markRoomAbove: CGFloat = Tokens.Space.s6

    // MARK: Fold note

    /// Padding of the wrong-answer note (`padding: 11px 34px 11px 16px`; 34 = fold 22 + 12).
    public static let foldNotePadding = EdgeInsets(
        top: 11,
        leading: Tokens.Space.s16,
        bottom: 11,
        trailing: Tokens.Shape.foldCorner + Tokens.Space.s12
    )

    // MARK: Flip

    /// CSS `perspective: 900px` on the parent of a flipping card (Bộ thẻ, Từ vựng).
    public static let flipPerspective: CGFloat = 900

    // MARK: Journey and lesson list (SK-011, canvas Home, Topic)

    /// A stop of the journey (Home: `width: 56px; height: 56px; border-radius: 12px`).
    public static let journeyDisc: CGFloat = 56
    /// Glyph inside a locked stop (28 × 28).
    public static let journeyGlyph: CGFloat = 28
    /// Lock badge on a locked stop (24 × 24 disc, glyph 14, `right: -6px; bottom: -6px`).
    public static let journeyBadge: CGFloat = 24
    public static let journeyBadgeGlyph: CGFloat = 14
    public static let journeyBadgeOffset: CGFloat = Tokens.Space.s6
    /// Zig-zag of the journey: stops move right by this step (`margin-left: 0 | 44 | 88px`).
    public static let journeyIndentStep: CGFloat = 44
    /// Tilt of each stop in turn (`rotate(-3deg)`, `2deg`, `-2deg`, `3deg`, `-2deg`, `2deg`).
    public static let journeyTilts: [Double] = [-3, 2, -2, 3, -2, 2]
    /// Number tile of a lesson row (Topic: 36 × 36, tilted −8°).
    public static let lessonNumberTile: CGFloat = 36
    /// Lesson row, open (`min-height: 68px`).
    public static let lessonRowMinHeight: CGFloat = 68
    /// Round play button: Home card 64, lesson row 52 (two discs `r = 27` in a 64 box, 6 apart).
    public static let playDiscLarge: CGFloat = 64
    public static let playDiscSmall: CGFloat = 52

    // MARK: Bottom navigation (SK-011, canvas Home)

    /// Icon chip of the current tab (50 × 32).
    public static let navChipWidth: CGFloat = 50
    public static let navChipHeight: CGFloat = 32
    /// One tab (`min-height: 58px`).
    public static let navItemMinHeight: CGFloat = 58
    /// Strip padding (`padding: 14px 8px 18px 8px`); below the content the home indicator area
    /// adds its own room, so the bottom padding is smaller than the canvas's.
    public static let navPadding = EdgeInsets(top: Tokens.Space.s14, leading: Tokens.Space.s8, bottom: Tokens.Space.s8, trailing: Tokens.Space.s8)

    // MARK: Header chips (SK-011, canvas Home)

    /// Streak and stars chips (`height: 44px`); the button around them is the touch target.
    public static let headerChipHeight: CGFloat = 44
    public static let headerChipIcon: CGFloat = 20
}

extension PaperMetrics {
    /// Lesson squares on the Home card (`rect 18 × 18`, x step 24).
    public static let progressSquareSmall: CGFloat = 18
}

extension PaperMetrics {
    // MARK: Lesson screens (SK-012, canvas Warmup, Learn, Play, Quiz, QuizMyth, Reward)

    /// `PlaceholderArt`: the coloured piece (share of the box), its tilt, the paper disc on it.
    public static let placeholderPiece: CGFloat = 0.74
    public static let placeholderTilt: Angle = .degrees(-6)
    public static let placeholderDisc: CGFloat = 0.32
    public static let placeholderDiscOffset: CGFloat = 0.08
    /// `ContentPicture` (SK-033): a real picture's corners (a Discoverer piece, like a card or a
    /// choice cell), the coloured paper under it (share of the box, tilted like the stand-in
    /// piece) and the photo on that paper (share of the box). Until the designer draws the photo
    /// frame of style E (SK-033 point 6).
    public static let pictureRadius: CGFloat = Tokens.Radius.discoverer
    public static let pictureBacking: CGFloat = 0.92
    public static let pictureOnBacking: CGFloat = 0.8
    /// First guess of a grid cell picture's width, as a multiple of its height, before layout
    /// measures it (only picks the decode size of the first frame).
    public static let pictureWidthEstimate: CGFloat = 2
    /// Question sheet (`padding: 16px 14px 14px 16px`; the torn edge takes the first 6pt).
    public static let sheetPadding = EdgeInsets(top: Tokens.Space.s16 + Tokens.Space.s2, leading: Tokens.Space.s16, bottom: Tokens.Space.s14, trailing: Tokens.Space.s14)
    /// Result sheet at the bottom (`padding: 18px 20px 22px 20px`).
    public static let resultSheetPadding = EdgeInsets(top: Tokens.Space.s18, leading: Tokens.Space.s20, bottom: Tokens.Space.s8, trailing: Tokens.Space.s20)
}
