import DesignSystem
import SwiftUI
import UIKit

/// How a label the child reads fits its card, from its width at full size: a word card of the
/// bank, an option's name, a new word (designer 15/11; SK-047 tester 16/11: "PALAEONTO…").
/// - one word: one line, as small as needed down to `floor` (the canvas asks 0.6; "CARBOHYDRATE"
///   in four columns needs 0.51 on a 390 phone). A word is never cut with "…" and never broken.
/// - several words: one line when it fits at `phraseOneLine` or more; else the fewest lines, up to
///   `maxLines`, broken at the spaces the way SwiftUI breaks them (greedy), at the largest size at
///   which every line fits; never broken inside a word.
enum WordFit {
    struct Fit: Equatable {
        let scale: CGFloat
        let lines: Int

        func style(_ base: Tokens.Typography) -> Tokens.Typography {
            Tokens.Typography(
                family: base.family, size: (base.size * scale).rounded(.down), weight: base.weight,
                lineHeight: base.lineHeight, letterSpacing: base.letterSpacing, textCase: base.textCase
            )
        }
    }

    static let floor: CGFloat = 0.5
    static let phraseOneLine: CGFloat = 0.8
    /// Room kept beside the measured width (pt), so the glyphs' rounding never pushes a word that
    /// just fits onto a second line.
    static let slack: CGFloat = 1

    /// The fit, never under `floor` (a label still wider then shrinks once more on screen through
    /// `minimumScaleFactor`, and the layout tests fail on it: `rawFit`).
    static func fit(_ text: String, width: CGFloat, maxLines: Int = 2, measure: (String) -> CGFloat) -> Fit {
        let raw = rawFit(text, width: width, maxLines: maxLines, measure: measure)
        return Fit(scale: max(raw.scale, floor), lines: raw.lines)
    }

    /// `fit` before the floor: a scale under `floor` means the label does not fit its card.
    static func rawFit(_ text: String, width: CGFloat, maxLines: Int = 2, measure: (String) -> CGFloat) -> Fit {
        let whole = measure(text)
        guard whole > width, width > 0 else { return Fit(scale: 1, lines: 1) }
        let words = text.split(separator: " ").map(String.init)
        if words.count < 2 || maxLines < 2 {
            return Fit(scale: width / whole, lines: 1)
        }
        if width / whole >= phraseOneLine {
            return Fit(scale: width / whole, lines: 1)
        }
        var fit = Fit(scale: width / whole, lines: 1)
        for lines in 2...maxLines {
            let line = narrowestLine(words, lines: lines, measure: measure)
            fit = Fit(scale: min(width / line, 1), lines: lines)
            if fit.scale >= phraseOneLine { break }
        }
        return fit
    }

    /// The narrowest line in which `words`, broken greedily at the spaces, take at most `lines`
    /// lines. One of the runs of consecutive words is that width.
    static func narrowestLine(_ words: [String], lines: Int, measure: (String) -> CGFloat) -> CGFloat {
        var runs: [CGFloat] = []
        for start in words.indices {
            for end in start..<words.count {
                runs.append(measure(words[start...end].joined(separator: " ")))
            }
        }
        return runs.sorted().first { (lineCount(words, lineWidth: $0, measure: measure) ?? .max) <= lines }
            ?? measure(words.joined(separator: " "))
    }

    /// Lines `words` take when broken greedily at the spaces in `lineWidth`; `nil` when a word is
    /// wider than the line (it would break inside).
    static func lineCount(_ words: [String], lineWidth: CGFloat, measure: (String) -> CGFloat) -> Int? {
        var lines = 0
        var current = ""
        for word in words {
            guard measure(word) <= lineWidth else { return nil }
            if current.isEmpty {
                current = word
                lines += 1
            } else if measure(current + " " + word) <= lineWidth {
                current += " " + word
            } else {
                current = word
                lines += 1
            }
        }
        return lines
    }

    // MARK: With the real font

    /// The fit of `text` set in `style` in `width` (less `slack`), measured at the size drawn for
    /// `dynamicTypeSize`; floored. What `WordFitText` draws.
    static func fit(
        _ text: String, style: Tokens.Typography, width: CGFloat, maxLines: Int = 2, fixedBox: Bool = true,
        dynamicTypeSize: DynamicTypeSize = .large
    ) -> Fit {
        fit(text, width: max(width - slack, 0), maxLines: maxLines,
            measure: measure(style, fixedBox: fixedBox, dynamicTypeSize: dynamicTypeSize))
    }

    /// `fit(_:style:width:…)` before the floor (layout tests, the bank's columns).
    static func rawFit(
        _ text: String, style: Tokens.Typography, width: CGFloat, maxLines: Int = 2, fixedBox: Bool = true,
        dynamicTypeSize: DynamicTypeSize = .large
    ) -> Fit {
        rawFit(text, width: max(width - slack, 0), maxLines: maxLines,
               measure: measure(style, fixedBox: fixedBox, dynamicTypeSize: dynamicTypeSize))
    }

    /// Width of a string in `style` at the size drawn for `dynamicTypeSize` (capped as
    /// `.typography(_:fixedBox:)` caps it), rounded up.
    static func measure(_ style: Tokens.Typography, fixedBox: Bool, dynamicTypeSize: DynamicTypeSize) -> (String) -> CGFloat {
        let size = drawnSize(style, fixedBox: fixedBox, dynamicTypeSize: dynamicTypeSize)
        var attributes: [NSAttributedString.Key: Any] = [.font: SKFont.uiFont(style, size: size)]
        if style.letterSpacing != 0 { attributes[.kern] = style.letterSpacing }
        let upper = style.textCase == .uppercase
        return { text in
            ((upper ? text.uppercased() : text) as NSString).size(withAttributes: attributes).width.rounded(.up)
        }
    }

    /// The point size `.typography(style, fixedBox:)` draws at for `dynamicTypeSize`.
    static func drawnSize(_ style: Tokens.Typography, fixedBox: Bool, dynamicTypeSize: DynamicTypeSize) -> CGFloat {
        typealias Cap = Tokens.Typography.DynamicType
        return fixedBox
            ? SKFont.scaledSize(style.size, dynamicTypeSize: dynamicTypeSize, cap: Cap.fixedBoxMaxCategory, maxScale: Cap.fixedBoxMaxScale)
            : SKFont.scaledSize(style.size, dynamicTypeSize: dynamicTypeSize, cap: Cap.maxCategory, maxScale: Cap.maxScale)
    }
}

/// A label set by `WordFit` (SK-047): a word is never cut with "…" nor broken inside, a phrase
/// breaks only at its spaces. Measured with the real font at the size drawn for the Dynamic Type
/// size, under the same cap as `.typography(_:fixedBox:)`.
///
/// `width`: the width the text gets, pt, from `LabelWidths` (cards in a grid, so the layout tests
/// check the same number). `nil` in a row where the text takes what is left: the label reads its
/// width once laid out (first pass: one word on one line shrinking, a phrase on `maxLines` lines).
/// `reservedLines`: the label is as high as that many lines of `style` at full size, so cards in a
/// row stay one height when one word shrinks or one phrase takes two lines (the bank).
struct WordFitText: View {
    let text: String
    let style: Tokens.Typography
    let width: CGFloat?
    var maxLines = 2
    var fixedBox = true
    var alignment: TextAlignment = .center
    var reservedLines: Int?
    @State private var measuredWidth: CGFloat?
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    init(
        _ text: String, style: Tokens.Typography, width: CGFloat?, maxLines: Int = 2,
        fixedBox: Bool = true, alignment: TextAlignment = .center, reservedLines: Int? = nil
    ) {
        self.text = text
        self.style = style
        self.width = width
        self.maxLines = maxLines
        self.fixedBox = fixedBox
        self.alignment = alignment
        self.reservedLines = reservedLines
    }

    var body: some View {
        if let width {
            label(WordFit.fit(text, style: style, width: width, maxLines: maxLines, fixedBox: fixedBox, dynamicTypeSize: dynamicTypeSize))
        } else {
            label(measuredWidth.map {
                WordFit.fit(text, style: style, width: $0, maxLines: maxLines, fixedBox: fixedBox, dynamicTypeSize: dynamicTypeSize)
            } ?? Self.unmeasured(text, maxLines: maxLines))
            .frame(maxWidth: .infinity, alignment: frameAlignment)
            .onGeometryChange(for: CGFloat.self) { proxy in
                proxy.size.width
            } action: { width in
                measuredWidth = width
            }
        }
    }

    private func label(_ fit: WordFit.Fit) -> some View {
        Text(verbatim: text)
            .typography(fit.style(style), fixedBox: fixedBox)
            .multilineTextAlignment(alignment)
            .lineLimit(fit.lines)
            // A size the fit was not measured for (a Dynamic Type change on the way): shrink, never cut.
            .minimumScaleFactor(WordFit.floor)
            .fixedSize(horizontal: false, vertical: true)
            .frame(minHeight: reservedHeight, alignment: frameAlignment)
    }

    private var reservedHeight: CGFloat? {
        reservedLines.map { CGFloat($0) * style.lineHeight * WordFit.drawnSize(style, fixedBox: fixedBox, dynamicTypeSize: dynamicTypeSize) }
    }

    private var frameAlignment: Alignment {
        switch alignment {
        case .leading: .leading
        case .trailing: .trailing
        default: .center
        }
    }

    /// Before the width is known: one word on one line (SwiftUI shrinks it), a phrase on `maxLines`.
    private static func unmeasured(_ text: String, maxLines: Int) -> WordFit.Fit {
        WordFit.Fit(scale: 1, lines: text.contains(" ") ? maxLines : 1)
    }
}

/// Widths the labels of the lesson's cards get, from `LayoutMetrics`, the way the views lay the
/// cards out (SK-047, tester 16/11). The views and the layout tests (`WordFitLayoutTests`, on the
/// widths of iPhone 16e, iPhone 16 and iPad) read the same numbers.
enum LabelWidths {
    /// What a grid of cards spans: the content less the trailing room of the selected ring.
    static func room(_ metrics: LayoutMetrics) -> CGFloat {
        max(metrics.contentWidth - metrics.gridTrailingInset, 0)
    }

    /// Lines a phrase may take on a word card of the bank ("thí nghiệm công bằng").
    static let bankLines = 2
    /// Lines an option with no picture may take (a short sentence: "Thức ăn của nhiều nhóm khác nhau").
    static let choiceTextLines = 3

    // MARK: Bank of `fill_blank_bank` (Discoverer)

    /// Columns of the bank: three on the phone, four in the frame, no more than the words.
    static func bankColumns(count: Int, metrics: LayoutMetrics) -> Int {
        min(max(count, 1), metrics.isRegular ? 4 : 3)
    }

    /// `bankColumns`, fewer while a word of the bank would not fit its card even at `WordFit.floor`
    /// (Slide Over, 320 wide, with "palaeontology"); `fits` gets the text width of a card.
    static func bankColumns(count: Int, metrics: LayoutMetrics, fits: (CGFloat) -> Bool) -> Int {
        var columns = bankColumns(count: count, metrics: metrics)
        while columns > 1, !fits(bankText(columns: columns, metrics: metrics)) { columns -= 1 }
        return columns
    }

    /// Text width of a word card: its column less the card's padding (`s8` each side).
    static func bankText(columns: Int, metrics: LayoutMetrics) -> CGFloat {
        let count = CGFloat(max(columns, 1))
        let cell = (room(metrics) - (count - 1) * Tokens.Space.s10) / count
        return max(cell - 2 * Tokens.Space.s8, 0)
    }

    // MARK: Choices (Discoverer single and multi choice)

    /// Multi choice and four or more options: a 2 × 2 grid; else one under the other (iPad: a row).
    static func choiceIsGrid(count: Int, multiple: Bool) -> Bool {
        multiple || count > 3
    }

    static func choiceCard(count: Int, multiple: Bool, metrics: LayoutMetrics) -> CGFloat {
        if choiceIsGrid(count: count, multiple: multiple) { return max((room(metrics) - Tokens.Space.s12) / 2, 0) }
        guard metrics.isRegular else { return room(metrics) }
        let row = CGFloat(max(count, 1))
        return max((room(metrics) - (row - 1) * Tokens.Space.s12) / row, 0)
    }

    /// An option with no picture: its label fills the card (padding `s10`).
    static func choiceText(count: Int, multiple: Bool, metrics: LayoutMetrics) -> CGFloat {
        max(choiceCard(count: count, multiple: multiple, metrics: metrics) - 2 * Tokens.Space.s10, 0)
    }

    /// The name pasted on a picture card once scored (`NameLabel`: `s12` from the card's edge,
    /// `s8` inside the label).
    static func nameLabelText(count: Int, multiple: Bool, metrics: LayoutMetrics) -> CGFloat {
        max(choiceCard(count: count, multiple: multiple, metrics: metrics) - 2 * Tokens.Space.s12 - 2 * Tokens.Space.s8, 0)
    }

    // MARK: True / false, bar chart (Discoverer)

    /// The word under the nod or the shake: half the row, less the card's padding.
    static func trueFalseText(metrics: LayoutMetrics) -> CGFloat {
        max((room(metrics) - Tokens.Space.s12) / 2 - 2 * Tokens.Space.s8, 0)
    }

    /// A bar's name: one column of the chart's paper (padding `s14`, `s14` between the bars).
    static func barName(count: Int, metrics: LayoutMetrics) -> CGFloat {
        let bars = CGFloat(max(count, 1))
        return max((room(metrics) - 2 * Tokens.Space.s14 - (bars - 1) * Tokens.Space.s14) / bars, 0)
    }

    // MARK: New words (Tổng kết, Explorer Học)

    /// Tổng kết màn 2: one row of word cells, as many columns as words, four at most.
    static func recapWordColumns(count: Int) -> Int {
        min(max(count, 1), RecapMetrics.wordColumnsMax)
    }

    /// `recapWordColumns`, fewer while a word would not fit its cell even at `WordFit.floor`
    /// ("CARBOHYDRATE" in four columns at the larger text sizes); `fits` gets the text width.
    static func recapWordColumns(count: Int, metrics: LayoutMetrics, fits: (CGFloat) -> Bool) -> Int {
        var columns = recapWordColumns(count: count)
        while columns > 1, !fits(recapWordText(columns: columns, metrics: metrics)) { columns -= 1 }
        return columns
    }

    static func recapWordCell(columns: Int, metrics: LayoutMetrics) -> CGFloat {
        let count = CGFloat(max(columns, 1))
        return (room(metrics) - (count - 1) * RecapMetrics.wordGap) / count
    }

    /// The word of a Tổng kết cell: the cell less its padding.
    static func recapWordText(columns: Int, metrics: LayoutMetrics) -> CGFloat {
        max(recapWordCell(columns: columns, metrics: metrics) - 2 * RecapMetrics.wordPadding, 0)
    }

    /// A word card of the Explorer "Từ mới" page: two columns, padding `s8`.
    static func explorerWordCardText(metrics: LayoutMetrics) -> CGFloat {
        max((room(metrics) - Tokens.Space.s12) / 2 - 2 * Tokens.Space.s8, 0)
    }
}
