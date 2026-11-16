import ContentModel
import DesignSystem
import Foundation
import Profiles
import SwiftUI
import Testing
@testable import LessonPlayer

/// The word put in a blank (SK-013: L9, then the designer table "Từ điền chỗ trống không chip").
/// It sits in the sentence like any other word: no padding characters, so no white space before
/// punctuation and one space on each side. Its look depends on the state:
/// - choosing: vàng hoè background, ink, bold;
/// - right: no background, lá tre, bold;
/// - wrong: giấy lõm background, secondary ink, regular.
/// Multi-word answers keep together with no-break spaces.
/// Lesson 1 fixture: w1 has its blank mid-sentence, q2 has it right before a comma (SK-047:
/// content-editor rewrote q2, "Food gives us {1}, like protein and fat."; before, a full stop).
@MainActor
struct FillBlankSentenceTests {
    struct NotFillBlank: Error { let key: String }

    private static func fill(_ key: String) throws -> QuizItem.FillBlankBank {
        let lesson = try Repo.lesson()
        let item = try #require((lesson.warmup + lesson.quiz).first { $0.key == key })
        guard case .fillBlankBank(let fill) = item.answer else { throw NotFillBlank(key: key) }
        return fill
    }

    private static func text(_ string: AttributedString) -> String { String(string.characters) }

    /// Any white space, including figure space (U+2007) and no-break space (U+00A0), right before
    /// punctuation, or two in a row.
    private static func strayWhitespace(in text: String) -> [String] {
        var found: [String] = []
        let chars = Array(text)
        for i in chars.indices.dropFirst() where chars[i - 1].isWhitespace {
            if ".,!?;:".contains(chars[i]) { found.append("space before '\(chars[i])' at \(i)") }
            if chars[i].isWhitespace { found.append("two spaces at \(i - 1)") }
        }
        return found
    }

    nonisolated static let states: [ChoiceState?] = [nil, .correct, .wrong]
    /// The two lines of the sentence: main (`sentence`, 700) and second (`body`, 400).
    nonisolated static let lines: [Tokens.Typography] = [Tokens.Typography.sentence, Tokens.Typography.body]

    private static let nbsp = "\u{00A0}"

    /// Attribute keys spelled out, so SwiftUI's and UIKit's attributes of the same name never mix.
    private typealias SwiftUIKeys = AttributeScopes.SwiftUIAttributes
    private typealias UIKitKeys = AttributeScopes.UIKitAttributes

    /// The look the designer table gives a filled word, written out here (not read from the code).
    private static func expected(_ state: ChoiceState?) -> (background: Color?, foreground: Color, face: SKFont.BeVietnamPro) {
        switch state {
        case .correct?: (nil, Tokens.Role.textCorrect, .bold)
        case .wrong?: (Tokens.Role.feedbackWrong, Tokens.Role.textSecondary, .regular)
        default: (Tokens.Role.stateSelected, Tokens.Role.textPrimary, .bold)
        }
    }

    private static func style(_ line: Tokens.Typography, weight: Int) -> Tokens.Typography {
        Tokens.Typography(
            family: line.family, size: line.size, weight: weight,
            lineHeight: line.lineHeight, letterSpacing: line.letterSpacing, textCase: line.textCase
        )
    }

    // MARK: - Spacing (L9)

    @Test("Blank before a comma (q2): the word touches the comma, EN and VI", arguments: states)
    func wordBeforePunctuation(state: ChoiceState?) throws {
        let fill = try Self.fill("q2")
        for line in Self.lines {
            let en = Self.text(FillBlankSentence.sentence(fill, filled: ["q2_nutrients"], language: .en, line: line, state: state))
            let vi = Self.text(FillBlankSentence.sentence(fill, filled: ["q2_nutrients"], language: .vi, line: line, state: state))
            #expect(en == "Food gives us nutrients, like protein and fat.")
            #expect(vi == "Thức ăn cho ta chất\(Self.nbsp)dinh\(Self.nbsp)dưỡng, như chất đạm và chất béo.")
            #expect(Self.strayWhitespace(in: en).isEmpty, "\(Self.strayWhitespace(in: en))")
            #expect(Self.strayWhitespace(in: vi).isEmpty, "\(Self.strayWhitespace(in: vi))")
        }
    }

    @Test("Blank mid-sentence (Khởi động w1): one plain space on each side, EN and VI", arguments: states)
    func wordInTheMiddle(state: ChoiceState?) throws {
        let fill = try Self.fill("w1")
        for line in Self.lines {
            let en = Self.text(FillBlankSentence.sentence(fill, filled: ["w1_air"], language: .en, line: line, state: state))
            let vi = Self.text(FillBlankSentence.sentence(fill, filled: ["w1_air"], language: .vi, line: line, state: state))
            #expect(en == "Animals, including humans, need food, water and air to live.")
            #expect(vi == "Động vật, kể cả con người, cần thức ăn, nước và không\(Self.nbsp)khí để sống.")
            #expect(Self.strayWhitespace(in: en).isEmpty, "\(Self.strayWhitespace(in: en))")
            #expect(Self.strayWhitespace(in: vi).isEmpty, "\(Self.strayWhitespace(in: vi))")
        }
    }

    // MARK: - Look (designer table)

    @Test("Filled word: background, colour and face by state, no underline; on both lines, EN and VI", arguments: states)
    func filledWordLook(state: ChoiceState?) throws {
        let want = Self.expected(state)
        let cases: [(key: String, word: String, filled: String, language: ContentLanguage)] = [
            ("q2", "nutrients", "q2_nutrients", .en), ("q2", "chất\(Self.nbsp)dinh\(Self.nbsp)dưỡng", "q2_nutrients", .vi),
            ("w1", "air", "w1_air", .en), ("w1", "không\(Self.nbsp)khí", "w1_air", .vi),
        ]
        for item in cases {
            let fill = try Self.fill(item.key)
            for line in Self.lines {
                let at = "\(item.key) \(item.language) \(line.size)pt \(String(describing: state))"
                let sentence = FillBlankSentence.sentence(fill, filled: [item.filled], language: item.language, line: line, state: state)
                let words = sentence.runs.filter { String(sentence[$0.range].characters) == item.word }
                #expect(words.count == 1, "\(at): the word is one run")
                let run = try #require(words.first)
                #expect(run[SwiftUIKeys.BackgroundColorAttribute.self] == want.background, "\(at): background")
                #expect(run[SwiftUIKeys.ForegroundColorAttribute.self] == want.foreground, "\(at): colour")
                // Same family and size as the line, only the weight changes (Dynamic Type kept).
                let face = SKFont.BeVietnamPro(weight: want.face.weight)
                #expect(face == want.face, "\(at): \(face.rawValue)")
                #expect(line.family == Tokens.FontFamily.text, "\(at): the lines are Be Vietnam Pro")
                #expect(run[SwiftUIKeys.FontAttribute.self] == SKFont.font(Self.style(line, weight: want.face.weight)), "\(at): \(want.face.rawValue)")
                let otherFace: SKFont.BeVietnamPro = want.face == .bold ? .regular : .bold
                #expect(run[SwiftUIKeys.FontAttribute.self] != SKFont.font(Self.style(line, weight: otherFace.weight)), "\(at): not \(otherFace.rawValue)")
                #expect(run[SwiftUIKeys.UnderlineStyleAttribute.self] == nil, "\(at): no underline")
                #expect(run[UIKitKeys.UnderlineStyleAttribute.self] == nil, "\(at): no underline")
                #expect(run[SwiftUIKeys.StrikethroughStyleAttribute.self] == nil, "\(at): no strikethrough")
                #expect(run[UIKitKeys.StrikethroughStyleAttribute.self] == nil, "\(at): no strikethrough")

                // The rest of the sentence keeps the line's own look: no background, colour or font.
                for other in sentence.runs where other.range != run.range {
                    let text = String(sentence[other.range].characters)
                    #expect(other[SwiftUIKeys.BackgroundColorAttribute.self] == nil, "\(at): '\(text)' has no background")
                    #expect(other[SwiftUIKeys.ForegroundColorAttribute.self] == nil, "\(at): '\(text)' keeps the line colour")
                    #expect(other[SwiftUIKeys.FontAttribute.self] == nil, "\(at): '\(text)' keeps the line font")
                }
            }
        }
    }

    @Test("Only the word's own spaces become no-break spaces")
    func noBreakOnlyInsideTheWord() throws {
        let fill = try Self.fill("q2")
        let vi = FillBlankSentence.sentence(fill, filled: ["q2_nutrients"], language: .vi, line: Tokens.Typography.body, state: .correct)
        let text = Self.text(vi)
        #expect(text.filter { $0 == "\u{00A0}" }.count == 2, "two no-break spaces, in 'chất dinh dưỡng'")
        #expect(text.hasPrefix("Thức ăn cho ta "), "the sentence keeps its plain spaces")
    }

    @Test("Empty blank keeps the sunken box with \"?\" (unchanged)", arguments: lines)
    func emptyBlank(line: Tokens.Typography) throws {
        let fill = try Self.fill("q2")
        for language in [ContentLanguage.en, .vi] {
            let sentence = FillBlankSentence.sentence(fill, filled: [], language: language, line: line, state: nil)
            let box = "\u{2007}\u{2007}?\u{2007}\u{2007}"
            let run = try #require(sentence.runs.first { String(sentence[$0.range].characters) == box })
            #expect(run[SwiftUIKeys.BackgroundColorAttribute.self] == Tokens.Role.surfaceSunken)
            #expect(run[SwiftUIKeys.ForegroundColorAttribute.self] == Tokens.Role.textSecondary)
            #expect(run[SwiftUIKeys.FontAttribute.self] == nil, "the box keeps the line font")
        }
        #expect(Self.text(FillBlankSentence.sentence(fill, filled: [], language: .en, line: Tokens.Typography.sentence, state: nil))
            == "Food gives us \u{2007}\u{2007}?\u{2007}\u{2007}, like protein and fat.")
    }
}
