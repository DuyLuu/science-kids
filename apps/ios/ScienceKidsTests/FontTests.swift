import CoreText
import DesignSystem
import Testing
import UIKit
@testable import ScienceKids

/// SK-005: both bundled families load, at the three weights the canvas uses,
/// and cover the Vietnamese letters of the interface strings.
/// SK-008: the font helpers moved from the app (`AppFont`) to `DesignSystem` (`SKFont`).
@Suite struct FontTests {
    /// Placeholder strings plus the diacritics the ticket calls out.
    static let vietnameseSample = "Thức ăn cho ta những gì? Ta cần ăn gì để khoẻ mạnh? ứ ă ữ ì ẻ ạ"

    @Test func bothFamiliesAreRegistered() {
        #expect(!UIFont.fontNames(forFamilyName: Tokens.FontFamily.display).isEmpty)
        #expect(!UIFont.fontNames(forFamilyName: Tokens.FontFamily.text).isEmpty)
    }

    @Test(arguments: [500, 700, 900])
    func phuduVariableWeight(_ weight: Int) throws {
        let font = SKFont.phudu(weight: weight, size: 24)
        #expect(font.familyName == Tokens.FontFamily.display)
        let variation = try #require(CTFontCopyVariation(font as CTFont) as? [NSNumber: NSNumber])
        let wght = try #require(variation[NSNumber(value: SKFont.weightAxisTag)])
        #expect(wght.intValue == weight)
    }

    /// The wght axis really changes the outlines: each weight sets the same text
    /// at a different width (Phudu gets narrower as it gets heavier).
    @Test func phuduWeightsRenderDifferently() {
        let widths = [500, 700, 900].map { weight in
            let font = SKFont.phudu(weight: weight, size: 40)
            return (Self.vietnameseSample as NSString).size(withAttributes: [.font: font]).width
        }
        #expect(Set(widths).count == 3, "widths: \(widths)")
    }

    /// SK-008: `.typography` draws with `Font.custom(postScriptName, …)`, so the name of each
    /// role's face must open that very face (Phudu: the same wght instance).
    @Test(arguments: [
        Tokens.Typography.titleXl, .title, .titleS, .button, .buttonS, .label, .eyebrow, .stamp, .number,
        .sentence, .itemTitle, .bodyStrong, .body, .bodyS, .caption, .captionS,
    ])
    func typographyFaceByName(_ style: Tokens.Typography) throws {
        let name = try #require(SKFont.postScriptName(style), "\(style.family) not registered")
        let font = try #require(UIFont(name: name, size: style.size), "no font named \(name)")
        #expect(font.familyName == style.family)
        if style.family == Tokens.FontFamily.display {
            let variation = try #require(CTFontCopyVariation(font as CTFont) as? [NSNumber: NSNumber], "\(name)")
            #expect(variation[NSNumber(value: SKFont.weightAxisTag)]?.intValue == style.weight, "\(name)")
        } else {
            #expect(font.fontName == SKFont.BeVietnamPro(weight: style.weight).rawValue)
        }
    }

    @Test(arguments: SKFont.BeVietnamPro.allCases)
    func beVietnamProStaticWeight(_ face: SKFont.BeVietnamPro) throws {
        let font = try #require(SKFont.beVietnamPro(face, size: 20))
        #expect(font.familyName == Tokens.FontFamily.text)
        #expect(font.fontName == face.rawValue)
    }

    @Test func vietnameseGlyphsInPhudu() {
        let font = SKFont.phudu(weight: 700, size: 20)
        #expect(Self.hasAllGlyphs(font, for: Self.vietnameseSample))
    }

    @Test(arguments: SKFont.BeVietnamPro.allCases)
    func vietnameseGlyphsInBeVietnamPro(_ face: SKFont.BeVietnamPro) throws {
        let font = try #require(SKFont.beVietnamPro(face, size: 20))
        #expect(Self.hasAllGlyphs(font, for: Self.vietnameseSample))
    }

    /// True when the font itself (no fallback) has a glyph for every UTF-16 unit.
    static func hasAllGlyphs(_ font: UIFont, for text: String) -> Bool {
        let characters = Array(text.precomposedStringWithCanonicalMapping.utf16)
        var glyphs = [CGGlyph](repeating: 0, count: characters.count)
        return CTFontGetGlyphsForCharacters(font as CTFont, characters, &glyphs, characters.count)
    }
}
