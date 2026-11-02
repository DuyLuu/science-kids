import CoreText
import SwiftUI
import UIKit

/// The two bundled families of style E. The font files live in the app bundle
/// (`ScienceKids/Resources/Fonts`, `UIAppFonts`); registration is process-wide, so this module
/// only needs the family names from `Tokens.FontFamily`.
public enum SKFont {
    /// OpenType axis tag 'wght', the key used inside kCTFontVariationAttribute.
    public static let weightAxisTag = 0x7767_6874

    /// Be Vietnam Pro ships as static files, one per weight (400, 600, 700).
    public enum BeVietnamPro: String, CaseIterable, Sendable {
        case regular = "BeVietnamPro-Regular"
        case semiBold = "BeVietnamPro-SemiBold"
        case bold = "BeVietnamPro-Bold"

        public var weight: Int {
            switch self {
            case .regular: Tokens.FontWeight.textRegular
            case .semiBold: Tokens.FontWeight.textSemibold
            case .bold: Tokens.FontWeight.textBold
            }
        }

        /// The bundled face closest to `weight`.
        public init(weight: Int) {
            self = Self.allCases.min { abs($0.weight - weight) < abs($1.weight - weight) } ?? .regular
        }
    }

    /// Phudu ships as one variable font (wght 300...900): the weight is set on the wght axis,
    /// because CoreText's names for the named instances are not stable (Fonts/README.md).
    public static func phudu(weight: Int, size: CGFloat) -> UIFont {
        let variation = UIFontDescriptor.AttributeName(rawValue: kCTFontVariationAttribute as String)
        let descriptor = UIFontDescriptor(fontAttributes: [
            .family: Tokens.FontFamily.display,
            variation: [weightAxisTag: CGFloat(weight)],
        ])
        return UIFont(descriptor: descriptor, size: size)
    }

    /// `nil` when the font is not registered (UIAppFonts missing, or running outside the app).
    public static func beVietnamPro(_ face: BeVietnamPro, size: CGFloat) -> UIFont? {
        UIFont(name: face.rawValue, size: size)
    }

    /// PostScript name of the face for a text role, for `Font.custom(_:size:relativeTo:)`.
    /// Phudu: the name CoreText gives the instance at the role's wght value (900 is a named
    /// instance of the variable font), read at run time, never written down (Fonts/README.md);
    /// `FontTests` checks that the name opens the same wght. `nil` when the family is not registered.
    public static func postScriptName(_ style: Tokens.Typography) -> String? {
        if style.family == Tokens.FontFamily.display {
            let font = phudu(weight: style.weight, size: style.size)
            return font.familyName == Tokens.FontFamily.display ? font.fontName : nil
        }
        if style.family == Tokens.FontFamily.text {
            let face = BeVietnamPro(weight: style.weight)
            return beVietnamPro(face, size: style.size) == nil ? nil : face.rawValue
        }
        return nil
    }

    /// SwiftUI font of a text role. `Font.custom(_:size:relativeTo: .body)`, so SwiftUI itself
    /// scales it with Dynamic Type (and the accessibility audit sees a Dynamic Type font); the
    /// cap is set by `.typography(_:)` with `.dynamicTypeSize(...)`. Falls back to a fixed
    /// CoreText font when the family is not registered.
    public static func font(_ style: Tokens.Typography) -> Font {
        if let name = postScriptName(style) {
            return .custom(name, size: style.size, relativeTo: .body)
        }
        return Font(uiFont(style, size: style.size) as CTFont)
    }

    /// The font of a text role at `size` (already scaled for Dynamic Type). Falls back to the
    /// system font of the same weight when the family is not registered (package unit tests).
    public static func uiFont(_ style: Tokens.Typography, size: CGFloat) -> UIFont {
        if style.family == Tokens.FontFamily.display {
            return phudu(weight: style.weight, size: size)
        }
        if style.family == Tokens.FontFamily.text,
           let font = beVietnamPro(BeVietnamPro(weight: style.weight), size: size) {
            return font
        }
        return UIFont.systemFont(ofSize: size, weight: systemWeight(style.weight))
    }

    /// Point size for `dynamicTypeSize`, scaled like body text (`UIFontMetrics(forTextStyle: .body)`)
    /// and never above the cap: the category `cap` and the factor `maxScale`
    /// (`typography.dynamic_type.max_category` / `max_scale` = xxxLarge / 1.35 for reading text,
    /// `fixed_box_max_category` / `fixed_box_max_scale` = xLarge / 1.12 for text in fixed boxes).
    public static func scaledSize(
        _ size: CGFloat,
        dynamicTypeSize: DynamicTypeSize,
        cap: DynamicTypeSize = Tokens.Typography.DynamicType.maxCategory,
        maxScale: CGFloat = Tokens.Typography.DynamicType.maxScale
    ) -> CGFloat {
        let category = UIContentSizeCategory(min(dynamicTypeSize, cap))
        let traits = UITraitCollection(preferredContentSizeCategory: category)
        let scaled = UIFontMetrics(forTextStyle: .body).scaledValue(for: size, compatibleWith: traits)
        return min(scaled, size * maxScale)
    }

    private static func systemWeight(_ weight: Int) -> UIFont.Weight {
        switch weight {
        case ..<450: .regular
        case ..<650: .semibold
        case ..<800: .bold
        default: .black
        }
    }
}

extension View {
    /// Sets a style E text role: family and weight, size scaled for Dynamic Type up to the cap,
    /// line height, letter spacing and text case. `fixedBox: true` for text inside a box of fixed
    /// size (quiz cell, main button, tab bar): capped at `fixed_box_max_category` instead of
    /// `max_category`.
    public func typography(_ style: Tokens.Typography, fixedBox: Bool = false) -> some View {
        modifier(TypographyModifier(style: style, fixedBox: fixedBox))
    }
}

struct TypographyModifier: ViewModifier {
    let style: Tokens.Typography
    let fixedBox: Bool
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    private typealias Cap = Tokens.Typography.DynamicType

    func body(content: Content) -> some View {
        let size = scaledSize()
        let font = SKFont.uiFont(style, size: size)
        // CSS line-height is a multiple of the size; SwiftUI adds lineSpacing to the font's own line height.
        let spacing = max(style.lineHeight * size - font.lineHeight, 0)
        content
            .font(SKFont.font(style))
            .tracking(style.letterSpacing)
            .lineSpacing(spacing)
            .textCase(style.textCase)
            .dynamicTypeSize(...(fixedBox ? Cap.fixedBoxMaxCategory : Cap.maxCategory))
    }

    /// The size SwiftUI will draw at (for the line spacing).
    private func scaledSize() -> CGFloat {
        fixedBox
            ? SKFont.scaledSize(style.size, dynamicTypeSize: dynamicTypeSize, cap: Cap.fixedBoxMaxCategory, maxScale: Cap.fixedBoxMaxScale)
            : SKFont.scaledSize(style.size, dynamicTypeSize: dynamicTypeSize, cap: Cap.maxCategory, maxScale: Cap.maxScale)
    }
}
