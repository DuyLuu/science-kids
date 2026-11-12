import DesignSystem
import SwiftUI
import Testing
@testable import LessonPlayer

/// SK-013 (Duy 31/10, canvas `Discoverer-QuizFill`): which bank word carries which mark, for Quiz
/// q2 "Carbohydrates give us {1}." (bank energy / air / sunlight, answer energy).
@MainActor
struct BankChipMarkTests {
    private static let bank = ["q2_energy", "q2_air", "q2_sunlight"]
    private static let answer = "q2_energy"

    private static func draft(_ keys: [String]) -> AnswerDraft {
        var draft = AnswerDraft()
        draft.keys = keys
        return draft
    }

    /// The mark key of every bank word, in bank order (`nil`: no mark).
    private static func marks(_ display: AnswerDisplay) -> [String?] {
        bank.map { BankChips.wordMarkKey(display: display, key: $0, correct: $0 == answer) }
    }

    @Test("Right: \"Đúng\" on the word put in, nothing else")
    func right() {
        #expect(Self.marks(.final(Self.draft(["q2_energy"]))) == ["lesson.mark.correct", nil, nil])
    }

    @Test("Wrong, first try: \"Chưa đúng\" on the word put in; the right word is not shown")
    func wrongFirstTry() {
        #expect(Self.marks(.afterFirstTry(Self.draft(["q2_air"]))) == [nil, "lesson.mark.wrong", nil])
    }

    @Test("Wrong, last try: \"Chưa đúng\" on the word put in, \"Đáp án\" on the right word")
    func wrongLastTry() {
        #expect(Self.marks(.final(Self.draft(["q2_sunlight"]))) == ["lesson.mark.answer", nil, "lesson.mark.wrong"])
    }

    @Test("After \"Thử lại\" and while choosing: no mark, with the blank empty or filled")
    func noMarkWhileChoosing() {
        #expect(Self.marks(.editing(AnswerDraft())) == [nil, nil, nil])
        #expect(Self.marks(.editing(Self.draft(["q2_sunlight"]))) == [nil, nil, nil])
    }

    @Test("Khởi động (tap to answer): a tapped wrong word is greyed out, with no mark (canvas Warmup)")
    func warmupTriedWord() {
        let display = AnswerDisplay.editing(AnswerDraft(), tried: Self.draft(["q2_air"]))
        #expect(display.state(forKey: "q2_air", correct: false) == .wrong)
        #expect(Self.marks(display) == [nil, nil, nil])
    }

    @Test("Mark keys are the ones of the other answer cells (string catalog)")
    func sameKeysAsChoiceCells() {
        #expect(markKey(for: .correct, multi: false) == "lesson.mark.correct")
        #expect(markKey(for: .wrong, multi: false) == "lesson.mark.wrong")
        #expect(markKey(for: .missed, multi: false) == "lesson.mark.answer")
        #expect(markKey(for: .missed, multi: true) == "lesson.mark.missed")
        #expect(markKey(for: .selected, multi: false) == nil)
        #expect(markKey(for: .idle, multi: false) == nil)
    }
}

/// SK-033 (Duy 9/11): a word card with a picture is a picture cell of `layout.grid.quiz`, on the
/// phone (every width the phone layout takes, Split View 1/3 included) and in the iPad frame. It
/// is never under the Discoverer touch target and holds its art and its word without growing.
@MainActor
struct BankCardSizeTests {
    /// (regular width, container width): phones and Split View 1/3, then iPad portrait / landscape.
    nonisolated static let widths: [(Bool, CGFloat)] = [
        (false, 320), (false, 375), (false, 393), (false, 440),
        (true, 834), (true, 1194),
    ]

    @Test("Picture card: quiz cell height, ≥ touch target, art and word fit", arguments: widths)
    func pictureCard(regular: Bool, width: CGFloat) {
        let metrics = LayoutMetrics(horizontalSizeClass: regular ? .regular : .compact, containerWidth: width)
        let touch = Tokens.AgeGroup.discoverer.touchTarget
        let height = BankChips.cardHeight(pictures: true, metrics: metrics, touchTarget: touch)
        #expect(height == metrics.quizGrid.cellHeight)
        #expect(height >= touch)
        #expect(metrics.cellWidth(for: metrics.quizGrid) >= touch, "card width at \(width)")
        // Top 6 + art + gap 2 + one line of `sentence` + bottom 10 (the card's padding).
        let sentence = Tokens.Typography.sentence
        let needed = Tokens.Space.s6 + metrics.illustration(LessonMetrics.cellArt) + Tokens.Space.s2
            + sentence.size * sentence.lineHeight + Tokens.Space.s10
        #expect(needed <= height, "\(needed)pt of content in a \(height)pt card at \(width)")
    }

    @Test("Chip without pictures: the touch target, as before")
    func chip() {
        let metrics = LayoutMetrics(horizontalSizeClass: .compact, containerWidth: 393)
        let touch = Tokens.AgeGroup.discoverer.touchTarget
        #expect(touch >= 56)
        #expect(BankChips.cardHeight(pictures: false, metrics: metrics, touchTarget: touch) == touch)
    }
}
