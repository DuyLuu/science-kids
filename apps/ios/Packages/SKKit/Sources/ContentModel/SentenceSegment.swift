/// A piece of a `fill_blank_bank` sentence: plain text, or blank number `n` (written `{n}`).
public enum SentenceSegment: Hashable, Sendable {
    case text(String)
    case blank(Int)

    /// Splits a sentence into text and blanks.
    ///
    /// A blank is `{` + ASCII digits + `}`, the same pattern as the CLI (`/\{(\d+)\}/g` in
    /// `packages/content-schema/scripts/lib/refs.mjs`). Anything else, `{x}` or a lone brace,
    /// stays text. Empty text pieces are left out, so `"{1}{2}"` gives two blanks.
    ///
    ///     SentenceSegment.split("Cats like {1}.")
    ///     // [.text("Cats like "), .blank(1), .text(".")]
    public static func split(_ sentence: String) -> [SentenceSegment] {
        var segments: [SentenceSegment] = []
        var text = ""
        var index = sentence.startIndex
        while index < sentence.endIndex {
            if sentence[index] == "{",
               let close = sentence[index...].firstIndex(of: "}") {
                let digits = sentence[sentence.index(after: index)..<close]
                if !digits.isEmpty, digits.allSatisfy({ $0.isASCII && $0.isNumber }), let number = Int(digits) {
                    if !text.isEmpty {
                        segments.append(.text(text))
                        text = ""
                    }
                    segments.append(.blank(number))
                    index = sentence.index(after: close)
                    continue
                }
            }
            text.append(sentence[index])
            index = sentence.index(after: index)
        }
        if !text.isEmpty {
            segments.append(.text(text))
        }
        return segments
    }
}
