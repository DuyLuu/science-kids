import AudioKit
import ContentModel
import DesignSystem
import Profiles
import SwiftUI

/// Canvas sizes of the lesson screens with no token (file and element on each line), so the views
/// write no raw numbers. Proposed as tokens in SK-012 "Kết quả".
enum LessonMetrics {
    /// Screen gap (`gap: 12px`).
    static let gap: CGFloat = Tokens.Space.s12
    /// Art in a Học words card (`76`).
    static let sheetArt: CGFloat = 76
    /// Tray item disc (`padding: 5px`); shelf seal inset (`right: 5px; top: 5px`).
    static let trayDiscRing: CGFloat = 5
    static let shelfSealInset: CGFloat = 5
    /// Reward: star (`48`), confetti band (`270`).
    static let star: CGFloat = 48
    static let confettiHeight: CGFloat = 270
    /// Meter chip check (`14`).
    static let meterCheck: CGFloat = 14
}

extension ContentPicture {
    /// The picture of a content `Image` (SK-033): the pack's picture when `image.asset` is in the
    /// pack, else the stand-in art; VoiceOver reads its `alt` (English, like the cells' labels).
    /// No `image`: decorative stand-in art.
    init(image: ContentImage?, color: Color?, size: CGFloat, box: Box = .square) {
        self.init(
            asset: image?.asset, color: color, size: size, box: box,
            accessibilityLabel: image.map { Text(verbatim: $0.alt.en) }
        )
    }
}

extension ColorToken {
    /// The style E colour of a content colour name; unknown names fall back to giấy lõm.
    var color: Color {
        switch self {
        case .doSon: Tokens.Palette.doSon
        case .vangHoe: Tokens.Palette.vangHoe
        case .giDong: Tokens.Palette.giDong
        case .cham: Tokens.Palette.cham
        case .nauDat: Tokens.Palette.nauDat
        default: Tokens.Role.surfaceInactive
        }
    }

    /// Letters and icons on `color` (SK-060, designer 20/11: `color.role.text_on_content`, every
    /// pair ≥ 4.5:1; than tre on vàng hoè, giấy on the others, text primary on the fallback).
    var textColor: Color {
        switch self {
        case .doSon: Tokens.Role.TextOnContent.doSon
        case .vangHoe: Tokens.Role.TextOnContent.vangHoe
        case .giDong: Tokens.Role.TextOnContent.giDong
        case .cham: Tokens.Role.TextOnContent.cham
        case .nauDat: Tokens.Role.TextOnContent.nauDat
        default: Tokens.Role.textPrimary
        }
    }
}

/// A "VI" chip that showed or hid every Vietnamese line in Tiếng Anh trước. SK-042 (Duy 12/11):
/// English, Tiếng Việt and Cả hai are now picked on the Settings screen, and English shows
/// English only, so the chip is off (`isOffered`); kept for a later "show the other language" choice.
struct SecondLanguageSwitch: View {
    @Bindable var session: LessonSession
    @Environment(\.ageGroup) private var ageGroup

    static let isOffered = false

    var body: some View {
        if Self.isOffered, session.languageMode.hidesSentenceSecondLanguage {
            Button {
                session.showsSecondLanguage.toggle()
            } label: {
                Text(verbatim: "VI")
                    .typography(Tokens.Typography.label, fixedBox: true)
                    .foregroundStyle(Tokens.Role.textPrimary)
                    .frame(width: ageGroup.touchTarget, height: ageGroup.touchTarget)
                    .paperSurface(
                        session.showsSecondLanguage ? Tokens.Role.stateSelected : Tokens.Role.surfacePaper,
                        shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.tag
                    )
            }
            .buttonStyle(.paperPress)
            .accessibilityLabel(Text(session.showsSecondLanguage ? "lesson.vi.hide" : "lesson.vi.show"))
            .accessibilityAddTraits(session.showsSecondLanguage ? .isSelected : [])
            .accessibilityIdentifier("lesson.vi_switch")
        }
    }
}

/// Bottom area of a screen: the main button or the result, on điệp, full width.
struct BottomBar<Content: View>: View {
    @ViewBuilder let content: Content
    @Environment(\.layoutMetrics) private var metrics

    var body: some View {
        content
            .padding(.horizontal, metrics.contentInsets.leading)
            .padding(.vertical, Tokens.Space.s8)
            .frame(maxWidth: .infinity)
            .background(Tokens.Role.bgScreen)
            .alignedToPaperFrame()
    }
}
