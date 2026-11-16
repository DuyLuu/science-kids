import AudioKit
import ContentModel
import Foundation

/// What Tổng kết shows (SK-047, proposal 4.9; design `Quiz-Dot1.html` `r-d1-a`, `r-d2-a`,
/// `r-d2-a-nod`, `r-x1-a`, `r-x2-a`, `r-x2-none`, Duy 15/11). Every line is content the lesson
/// already has, with its clips: nothing is scored here, nothing new is read aloud.
public struct LessonRecap: Hashable, Sendable {
    /// Page 1 "Em đã học": one card per `key_points` line, with a picture of the Học groups.
    public struct KeyPoint: Hashable, Sendable {
        public let text: Spoken
        /// The picture of the Học group matched to this line (`KeyPointPictures`); `nil` when the
        /// lesson has no `explore_groups` (the card draws its stand-in art).
        public let image: ContentImage?
    }

    /// Page 2 "Nhớ nhé": the "Ý sai → Ý đúng" card, from the quiz question with a
    /// `misconception_id` when it is a `true_false`.
    public struct Myth: Hashable, Sendable {
        public let itemKey: String
        /// What was claimed: the `statement` (Na's line), else the `prompt`.
        public let claim: Spoken
        /// `explanation_correct`, read as a sentence of its own.
        public let truth: Spoken
        /// The question's `answer`: Na said something true (the card nods, nothing is struck).
        public let claimIsTrue: Bool
        /// Who said it (`na`), for the face; `nil` on Explorer questions.
        public let speaker: String?
        /// The question's picture (Explorer shows it with the shake).
        public let image: ContentImage?
    }

    public let keyPoints: [KeyPoint]
    public let myth: Myth?
    /// The words of `word_list.term_keys` found in `vocab`; empty without a `word_list`.
    public let words: [VocabTerm]
    /// "I can…"
    public let objective: Spoken
}

extension LessonSession {
    /// Tổng kết of this lesson.
    public var recap: LessonRecap {
        let groups = exploreBlock?.groups ?? []
        let matched = KeyPointPictures.match(
            keyPoints: lesson.keyPoints.map(\.en),
            groups: groups.map { ($0.label.en, $0.sentence.en) }
        )
        let keyPoints = lesson.keyPoints.enumerated().map { index, text in
            LessonRecap.KeyPoint(text: text, image: matched[index].flatMap { groups[$0].image })
        }
        let words = (wordList?.termKeys ?? []).compactMap { key in lesson.vocab.first { $0.key == key } }
        return LessonRecap(keyPoints: keyPoints, myth: Self.myth(in: quizItems, presentation: presentation), words: words, objective: lesson.objective)
    }

    /// The card "Ý sai → Ý đúng": the last quiz question with a `misconception_id`, when it is a
    /// `true_false` (Discoverer: Na wrong or Na right). Explorer shows it only when the answer is
    /// false (the claim is not true); a `single_choice` there has no card.
    static func myth(in quiz: [QuizItem], presentation: LessonPresentation) -> LessonRecap.Myth? {
        guard let item = quiz.last(where: { $0.misconceptionId != nil }),
              case .trueFalse(let tf) = item.answer
        else { return nil }
        if presentation == .explorer, tf.answer { return nil }
        return LessonRecap.Myth(
            itemKey: item.key, claim: tf.statement ?? item.prompt, truth: item.explanationCorrect,
            claimIsTrue: tf.answer, speaker: tf.speaker, image: item.image
        )
    }

    // MARK: Voice

    /// One key point, as its card's speaker and the page's reading say it.
    public func recapKeyPointUtterance(_ index: Int) -> Utterance {
        utterance("recap.key_point.\(index)", lesson.keyPoints.indices.contains(index) ? lesson.keyPoints[index] : nil)
    }

    /// The claim, then the truth.
    public func recapMythUtterance(_ myth: LessonRecap.Myth) -> Utterance {
        utterance("recap.myth", myth.claim, myth.truth)
    }

    public var recapObjectiveUtterance: Utterance {
        utterance("recap.objective", lesson.objective)
    }

    /// What page 1 reads by itself, one key point after the other (the card being read lifts).
    public var recapFirstPageReading: [Utterance] {
        lesson.keyPoints.indices.map(recapKeyPointUtterance).filter { !$0.isEmpty }
    }

    /// What page 2 reads by itself: the claim and the truth, then the objective. The new words
    /// are read only when tapped.
    public var recapSecondPageReading: [Utterance] {
        var reading: [Utterance] = []
        if let myth = recap.myth { reading.append(recapMythUtterance(myth)) }
        reading.append(recapObjectiveUtterance)
        return reading.filter { !$0.isEmpty }
    }
}

/// The picture of each key point card until the content has `key_point_images` (wave 2): a
/// picture of the lesson's Học groups, matched by words, not by place (designer 15/11, "Hình thẻ
/// ý chính"). Key point n and group n often do not match (lessons have 4–5 groups; key point 3 is
/// often group 4). Deterministic, no library, the same on Android:
///
/// 1. Words of an English text: lower case, runs of `a`–`z`; drop words of 2 letters or fewer and
///    stop words (checked before the next step); then the first of the endings `ies` (→ `y`), `es`,
///    `s`, `ed`, `ing` that leaves at least 3 letters is cut; then a final `e` is cut when more
///    than 3 letters are left.
/// 2. Score (key point i, group j) = number of words shared by the key point and the group's
///    `label.en` + `sentence.en`.
/// 3. Pairs with a score ≥ 2 and (j = i, or a score above that of group i for key point i), by
///    score (high first), then |i − j| (small first), then i (small first), then j (large first);
///    taken in that order, each key point once, each group once.
/// 4. A key point left over gets group i if nobody took it, else the first group nobody took.
///
/// Test vector: the designer's table of 34 lessons (`KeyPointPicturesTests`).
enum KeyPointPictures {
    static let stopWords: Set<String> = Set("""
        the a an and or but of to in on at by for with from is are was were be been it its this \
        that these those your our you we they them their there here some many very just more most \
        also only can could will would than then when what which who how why not no yes all each \
        every other another into out over under too like have has had do does did one two three four five
        """.split(separator: " ").map(String.init))

    /// For each key point, the index of its group (`nil` when there is no group left).
    static func match(keyPoints: [String], groups: [(label: String, sentence: String)]) -> [Int?] {
        let pointWords = keyPoints.map(words)
        let groupWords = groups.map { words($0.label + " " + $0.sentence) }
        let scores = pointWords.map { point in groupWords.map { point.intersection($0).count } }
        func own(_ i: Int) -> Int { i < groups.count ? scores[i][i] : 0 }

        var pairs: [(score: Int, i: Int, j: Int)] = []
        for i in keyPoints.indices {
            for j in groups.indices where scores[i][j] >= 2 && (j == i || scores[i][j] > own(i)) {
                pairs.append((scores[i][j], i, j))
            }
        }
        pairs.sort { a, b in
            if a.score != b.score { return a.score > b.score }
            if abs(a.i - a.j) != abs(b.i - b.j) { return abs(a.i - a.j) < abs(b.i - b.j) }
            if a.i != b.i { return a.i < b.i }
            return a.j > b.j
        }
        var result = [Int?](repeating: nil, count: keyPoints.count)
        var used = Set<Int>()
        for pair in pairs where result[pair.i] == nil && !used.contains(pair.j) {
            result[pair.i] = pair.j
            used.insert(pair.j)
        }
        for i in keyPoints.indices where result[i] == nil {
            let j = i < groups.count && !used.contains(i) ? i : groups.indices.first { !used.contains($0) }
            result[i] = j
            if let j { used.insert(j) }
        }
        return result
    }

    /// Step 1.
    static func words(_ text: String) -> Set<String> {
        var words = Set<String>()
        var current = ""
        func flush() {
            defer { current = "" }
            guard current.count > 2, !stopWords.contains(current) else { return }
            words.insert(stem(current))
        }
        for scalar in text.lowercased().unicodeScalars {
            if ("a"..."z").contains(scalar) {
                current.unicodeScalars.append(scalar)
            } else {
                flush()
            }
        }
        flush()
        return words
    }

    static func stem(_ word: String) -> String {
        var word = word
        for ending in ["ies", "es", "s", "ed", "ing"] where word.hasSuffix(ending) && word.count - ending.count >= 3 {
            word = String(word.dropLast(ending.count)) + (ending == "ies" ? "y" : "")
            break
        }
        if word.hasSuffix("e"), word.count > 3 { word.removeLast() }
        return word
    }
}
