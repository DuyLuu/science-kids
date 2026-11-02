import DesignSystem
import Foundation
import SwiftUI

/// Canvas sizes of the SK-011 screens that have no design token (file and element on each line).
/// Kept here so the views write no raw numbers; layout that a token covers comes from `Tokens`
/// and `LayoutMetrics`. Candidates for tokens are listed in SK-011 "Kết quả".
enum ScreenMetrics {
    // MARK: Shared header

    /// Gap in a screen header (`gap: 12px`) and between title and caption (`gap: 2px`).
    static let headerGap: CGFloat = Tokens.Space.s12
    static let headerTextGap: CGFloat = Tokens.Space.s2

    // MARK: Welcome (Discoverer-Welcome)

    /// Brand mark (`svg 44 × 44`, `rotate(-4deg)`).
    static let brandMark: CGFloat = 44
    static let brandMarkTilt: Angle = .degrees(-4)
    /// Hero: hills `350 × 166`, mascot `120 × 120` at `left: 115px; top: 16px` (scaled to the width).
    static let heroSize = CGSize(width: 350, height: 166)
    static let mascotSize: CGFloat = 120
    static let mascotOrigin = CGPoint(x: 115, y: 16)
    /// Screen gap (`gap: 14px`), gap between mode cards (`gap: 10px`).
    static let welcomeGap: CGFloat = Tokens.Space.s14
    static let modeGap: CGFloat = Tokens.Space.s10
    /// Mode card (`min-height: 64px; padding: 10px 14px 10px 12px`), its EN/VI tile (`44 × 44`).
    static let modeMinHeight: CGFloat = 64
    static let modePadding = EdgeInsets(top: Tokens.Space.s10, leading: Tokens.Space.s12, bottom: Tokens.Space.s10, trailing: Tokens.Space.s14)
    static let modeTile: CGFloat = 44
    /// "Khuyên dùng" badge (`padding: 2px 7px`).
    static let badgePadding = EdgeInsets(top: Tokens.Space.s2, leading: 7, bottom: Tokens.Space.s2, trailing: 7)
    /// Check seal on a chosen card (`top: -8px; right: -6px`).
    static let sealOffset = CGSize(width: Tokens.Space.s6, height: -Tokens.Space.s8)

    // MARK: Profile (Discoverer-Profile)

    static let profileGap: CGFloat = Tokens.Space.s16
    /// Field label to field (`gap: 6px`), section title to its choices (`gap: 8px`).
    static let fieldLabelGap: CGFloat = Tokens.Space.s6
    static let sectionLabelGap: CGFloat = Tokens.Space.s8
    /// Name field padding (`padding: 0 16px`).
    static let fieldPaddingX: CGFloat = Tokens.Space.s16
    /// Avatar cell (`height: 80px`, art `50 × 50`, grid `gap: 10px`).
    static let avatarCellHeight: CGFloat = 80
    static let avatarArt: CGFloat = 50
    static let avatarGap: CGFloat = Tokens.Space.s10
    /// Grade and voice chips (`gap: 8px`); the canvas's 48pt chips are raised to the touch target.
    static let chipGap: CGFloat = Tokens.Space.s8
    /// World card (`padding: 10px 14px; gap: 12px`).
    static let worldPadding = EdgeInsets(top: Tokens.Space.s10, leading: Tokens.Space.s14, bottom: Tokens.Space.s10, trailing: Tokens.Space.s14)
    /// Privacy shield (`18 × 18`).
    static let privacyIcon: CGFloat = 18

    // MARK: Home (Discoverer-Home)

    static let homeGap: CGFloat = Tokens.Space.s12
    /// Avatar in the header (`56 × 56`).
    static let homeAvatar: CGFloat = 56
    /// Header chip padding (`padding: 0 11px 0 9px; gap: 5px`).
    static let chipPaddingLeading: CGFloat = 9
    static let chipPaddingTrailing: CGFloat = 11
    static let chipIconGap: CGFloat = 5
    /// Continue card (`padding: 16px; gap: 6px`), art `104 × 104` at `right: -14px; top: -20px`.
    static let cardPadding: CGFloat = Tokens.Space.s16
    static let cardGap: CGFloat = Tokens.Space.s6
    static let cardArt: CGFloat = 104
    static let cardArtOffset = CGSize(width: 14, height: -20)
    /// Room kept free of the card art on the right of the title.
    static let cardTitleTrailing: CGFloat = 64
    /// Journey glyph of the current topic (`40 × 35`).
    static let journeyGlyphCurrent = CGSize(width: 40, height: 35)
    /// Journey row (`gap: 14px`), rows (`gap: 8px`).
    static let journeyRowGap: CGFloat = Tokens.Space.s14
    static let journeyGap: CGFloat = Tokens.Space.s8

    // MARK: Home iPad (Discoverer-Home-iPad, layout A, SK-013)

    /// Content column (`padding: 32px; gap: 20px`).
    static let homeColumnPadding = EdgeInsets(top: Tokens.Space.s32, leading: Tokens.Space.s32, bottom: Tokens.Space.s32, trailing: Tokens.Space.s32)
    static let homeColumnGap: CGFloat = Tokens.Space.s20
    /// Sidebar (`padding: 32px 24px; gap: 28px`); nav rows (`gap: 4px`, `min-height: 58px`);
    /// journey (`gap: 14px`). Its width is `layout.home_sidebar_a` (`LayoutMetrics.homeSidebarWidth`).
    static let sidebarPadding = EdgeInsets(top: Tokens.Space.s32, leading: Tokens.Space.s24, bottom: Tokens.Space.s32, trailing: Tokens.Space.s24)
    static let sidebarGap: CGFloat = Tokens.Space.s28
    static let sidebarNavGap: CGFloat = Tokens.Space.s4
    static let sidebarRowHeight: CGFloat = 58
    static let sidebarJourneyGap: CGFloat = Tokens.Space.s14

    // MARK: Topic (Discoverer-Topic)

    static let topicGap: CGFloat = Tokens.Space.s14
    /// Hero (`height: 196px`): art `214 × 214` at `left: 200px; top: -4px`, question slip
    /// `width: 236px` at `top: 46px`, padding `12px 12px 8px 22px`, dot `7 × 7` at `left: 9px; top: 19px`.
    static let topicHeroMinHeight: CGFloat = 196
    static let topicArt: CGFloat = 214
    static let topicArtOrigin = CGPoint(x: 200, y: -4)
    static let questionTop: CGFloat = 46
    static let questionWidth: CGFloat = 236
    static let questionPadding = EdgeInsets(top: Tokens.Space.s12, leading: 22, bottom: Tokens.Space.s8, trailing: Tokens.Space.s12)
    static let bulletDot: CGFloat = 7
    static let bulletOrigin = CGPoint(x: 9, y: 19)
    /// Lesson rows (`gap: 9px`), open row padding `8px 8px 8px 12px`, locked `8px 14px 8px 12px`.
    static let lessonGap: CGFloat = 9
    static let openRowPadding = EdgeInsets(top: Tokens.Space.s8, leading: Tokens.Space.s12, bottom: Tokens.Space.s8, trailing: Tokens.Space.s8)
    static let lockedRowPadding = EdgeInsets(top: Tokens.Space.s8, leading: Tokens.Space.s12, bottom: Tokens.Space.s8, trailing: Tokens.Space.s14)
    /// Lock on a locked lesson (`22 × 22`).
    static let lessonLock: CGFloat = 22
    /// Topic words chip: dot `7`, book `20`, arrow `16`, `padding: 0 14px 0 12px`.
    static let wordsIcon: CGFloat = 20
    static let wordsArrow: CGFloat = 16

    // MARK: Content error (SK-016, no canvas screen)

    /// Mascot on the error screen: the Welcome mascot's size class, smaller (no canvas).
    static let errorMascot: CGFloat = 120
}
