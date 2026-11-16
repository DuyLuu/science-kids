import ContentModel
import DesignSystem
import Profiles
import SwiftUI

// The sentence of a `fill_blank_bank` with its blanks (SK-013), the only piece kept from the
// first quiz screens (`QuestionViews.swift`, removed in SK-047: the A2 screens replaced them).

/// The sentence of `fill_blank_bank` with its blanks filled by `filled` (bank keys in blank order).
struct FillBlankSentence: View {
    let fill: QuizItem.FillBlankBank
    let filled: [String]
    let mode: LanguageMode
    let showsSecond: Bool
    /// Right / wrong look of the filled blanks after a check; `nil` while editing.
    let state: ChoiceState?

    var body: some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s4) {
            Text(attributed(mode.sentenceLanguage, line: Tokens.Typography.sentence))
                .typography(Tokens.Typography.sentence)
                .fixedSize(horizontal: false, vertical: true)
                .accessibilityIdentifier("lesson.prompt")
            if showsSecond {
                Text(attributed(mode.sentenceSecondLanguage, line: Tokens.Typography.body))
                    .typography(Tokens.Typography.body)
                    .foregroundStyle(Tokens.Role.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func attributed(_ language: ContentLanguage, line: Tokens.Typography) -> AttributedString {
        Self.sentence(fill, filled: filled, language: language, line: line, state: state)
    }

    /// The sentence in `language`, set in `line` (the text role of the line: `sentence` for the
    /// main line, `body` for the second), with its blanks.
    ///
    /// An empty blank is a sunken box: figure spaces around "?" keep it wide enough to see.
    ///
    /// A filled blank is the word alone (designer table, SK-013 "Từ điền chỗ trống không chip").
    /// It has no padding characters, no underline and no chip, so it sits between the sentence's
    /// own spaces and its punctuation (L9). Its look depends on the state, the same on both lines
    /// and in both languages:
    ///
    /// | State | Background | Text | Weight |
    /// | --- | --- | --- | --- |
    /// | choosing (`nil`, not checked yet) | `state_selected` (vàng hoè) | `text_primary` | 700 |
    /// | right (`.correct`) | none | `text_correct` (lá tre) | 700 |
    /// | wrong (`.wrong`, first try and last) | `feedback_wrong` (giấy lõm) | `text_secondary` | 400 |
    ///
    /// The background colour is the one of the paper behind the tapped word cell, so the child
    /// sees the same colour in the sentence and on the cell. Without colour the three states still
    /// differ: background + bold, plain bold, background + regular.
    ///
    /// The font keeps the line's family and size and changes only the weight, through
    /// `SKFont.font(_:)`. So it scales with Dynamic Type, under the cap that `.typography(_:)` puts on
    /// the whole `Text`, and the line height does not change. Spaces inside the word become
    /// no-break spaces, so the background of "năng lượng" is never cut in two at a line end.
    static func sentence(
        _ fill: QuizItem.FillBlankBank, filled: [String], language: ContentLanguage,
        line: Tokens.Typography, state: ChoiceState?
    ) -> AttributedString {
        let segments = language == .en ? fill.segmentsEN : fill.segmentsVI
        var result = AttributedString()
        for segment in segments {
            switch segment {
            case .text(let text):
                result += AttributedString(text)
            case .blank(let number):
                let index = number - 1
                let word = filled.indices.contains(index)
                    ? fill.bank.first { $0.key == filled[index] }.map { $0.label.text(in: language) }
                    : nil
                guard let word else {
                    var empty = AttributedString("\u{2007}\u{2007}?\u{2007}\u{2007}")
                    empty.backgroundColor = Tokens.Role.surfaceSunken
                    empty.foregroundColor = Tokens.Role.textSecondary
                    result += empty
                    continue
                }
                let look = FilledWordLook(state: state)
                var blank = AttributedString(word.replacingOccurrences(of: " ", with: "\u{00A0}"))
                blank.backgroundColor = look.background
                blank.foregroundColor = look.foreground
                blank.font = SKFont.font(look.style(line: line))
                result += blank
            }
        }
        return result
    }
}

/// Look of a word put in a blank, by state (see `FillBlankSentence.sentence`).
struct FilledWordLook: Equatable {
    let background: Color?
    let foreground: Color
    let weight: Int

    init(state: ChoiceState?) {
        switch state {
        case .correct?:
            background = nil
            foreground = Tokens.Role.textCorrect
            weight = Tokens.FontWeight.textBold
        case .wrong?:
            background = Tokens.Role.feedbackWrong
            foreground = Tokens.Role.textSecondary
            weight = Tokens.FontWeight.textRegular
        default:
            background = Tokens.Role.stateSelected
            foreground = Tokens.Role.textPrimary
            weight = Tokens.FontWeight.textBold
        }
    }

    /// The line's text role with this weight: same family, size, line height, spacing and case.
    func style(line: Tokens.Typography) -> Tokens.Typography {
        Tokens.Typography(
            family: line.family, size: line.size, weight: weight,
            lineHeight: line.lineHeight, letterSpacing: line.letterSpacing, textCase: line.textCase
        )
    }
}
