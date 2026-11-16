import ContentModel
import Foundation

/// The order the app shows things in when the content's order would give the answer away
/// (SK-047, proposal 4.5): the choices of `single_choice` and `multi_choice`, the bank of
/// `fill_blank_bank`, the cards of `order_sequence` (Khởi động and Quiz, Explorer and Discoverer),
/// and the Chơi shelf (SK-031). Not shuffled: the two true / false cards, the bars of
/// `picture_bar_chart` (`options[i]` answers `bars[i]`), the blanks of a sentence.
///
/// The order is a pure function of the attempt id and the question key, so a lesson stopped half
/// way shows the same order when it opens again, two questions of one attempt get their own
/// orders, and Android or an analysis script can rebuild the order a child saw. It does not use
/// `shuffled(using:)`: the standard library does not promise to keep its algorithm between Swift
/// versions. The whole algorithm, to port as is:
///
/// 1. Seed. The attempt id's 16 bytes in RFC 4122 order (the order of its text form) read as two
///    big-endian `UInt64`, `hi` (bytes 0–7) and `lo` (bytes 8–15). `k` = FNV-1a 64 of the key's
///    UTF-8 bytes (offset basis `0xcbf29ce484222325`, prime `0x100000001b3`, wrapping multiply).
///    The generator's state starts at `hi ^ lo ^ k`.
/// 2. SplitMix64 (Steele, Lea, Flood 2014), wrapping arithmetic on `UInt64`:
///    `state += 0x9E3779B97F4A7C15; z = state; z = (z ^ (z >> 30)) * 0xBF58476D1CE4E5B9;
///    z = (z ^ (z >> 27)) * 0x94D049BB133111EB; return z ^ (z >> 31)`.
/// 3. Fisher–Yates (Durstenfeld) from the end: for `i` from `n − 1` down to `1`,
///    `j = next() % (i + 1)`, swap `a[i]` and `a[j]`. Modulo bias is below 10⁻¹⁷ for n ≤ 10.
/// 4. `order_sequence` only: if the cards came out in `answer` order, rotate them left by one
///    (the first card goes last), so the bank never shows the answer.
///
/// Test vector: `SeededOrderTests.goldenPermutations`.
enum SeededOrder {
    /// Where each shown place takes its item from: `permutation[shown] = content index`.
    static func permutation(count: Int, attemptId: UUID, key: String) -> [Int] {
        var order = Array(0..<max(count, 0))
        guard order.count > 1 else { return order }
        var generator = SplitMix64(attemptId: attemptId, key: key)
        for i in stride(from: order.count - 1, through: 1, by: -1) {
            let j = Int(generator.next() % UInt64(i + 1))
            order.swapAt(i, j)
        }
        return order
    }

    static func shuffled<T>(_ items: [T], attemptId: UUID, key: String) -> [T] {
        permutation(count: items.count, attemptId: attemptId, key: key).map { items[$0] }
    }

    /// The cards of an `order_sequence`, shuffled, never in `answer` order (step 4).
    static func orderCards(
        _ items: [QuizItem.OrderSequence.SequenceItem], answer: [String], attemptId: UUID, key: String
    ) -> [QuizItem.OrderSequence.SequenceItem] {
        var cards = shuffled(items, attemptId: attemptId, key: key)
        if cards.count > 1, cards.map(\.key) == answer {
            cards.append(cards.removeFirst())
        }
        return cards
    }

    /// FNV-1a 64 of `text`'s UTF-8 bytes.
    static func fnv1a64(_ text: String) -> UInt64 {
        var hash: UInt64 = 0xCBF2_9CE4_8422_2325
        for byte in text.utf8 {
            hash ^= UInt64(byte)
            hash = hash &* 0x0000_0100_0000_01B3
        }
        return hash
    }
}

/// SplitMix64 (Steele, Lea, Flood 2014): a small seeded generator, so an order is the same for
/// the same attempt on every launch and on every platform (`SeededOrder`). Not for anything secret.
struct SplitMix64: RandomNumberGenerator {
    private(set) var state: UInt64

    init(state: UInt64) {
        self.state = state
    }

    /// Seed of `SeededOrder` step 1: the attempt id (big-endian halves) and the key's FNV-1a.
    init(attemptId: UUID, key: String) {
        let bytes = withUnsafeBytes(of: attemptId.uuid) { Array($0) }
        let hi = bytes[0..<8].reduce(UInt64(0)) { $0 << 8 | UInt64($1) }
        let lo = bytes[8..<16].reduce(UInt64(0)) { $0 << 8 | UInt64($1) }
        self.init(state: hi ^ lo ^ SeededOrder.fnv1a64(key))
    }

    mutating func next() -> UInt64 {
        state &+= 0x9E37_79B9_7F4A_7C15
        var z = state
        z = (z ^ (z >> 30)) &* 0xBF58_476D_1CE4_E5B9
        z = (z ^ (z >> 27)) &* 0x94D0_49BB_1331_11EB
        return z ^ (z >> 31)
    }
}
