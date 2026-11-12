import ContentModel
import Foundation

/// The order of the things on the Chơi shelf (SK-031, "kệ trung tính"). The content lists the
/// items of a `build_tray` in any order, often group by group (rice and bread, then fish and
/// egg…) or with a pattern (every second place unsafe). On the shelf that order would show the
/// groups before the child picks, so the shelf shuffles the items once per attempt. The seed is
/// the attempt id: a resumed attempt keeps its shelf, a new one gets another. Nothing here
/// touches scoring (`buildTray` gets keys, not places).
enum ShelfOrder {
    static func shuffled(_ items: [TrayItem], seed: UUID) -> [TrayItem] {
        var generator = SplitMix64(seed: seed)
        return items.shuffled(using: &generator)
    }
}

/// SplitMix64 (Steele, Lea, Flood 2014): a small seeded generator, so the order is the same for
/// the same attempt on every launch. Not for anything secret.
struct SplitMix64: RandomNumberGenerator {
    private var state: UInt64

    init(seed: UUID) {
        state = withUnsafeBytes(of: seed.uuid) { bytes in
            bytes.loadUnaligned(fromByteOffset: 0, as: UInt64.self) ^ bytes.loadUnaligned(fromByteOffset: 8, as: UInt64.self)
        }
    }

    mutating func next() -> UInt64 {
        state &+= 0x9E37_79B9_7F4A_7C15
        var z = state
        z = (z ^ (z >> 30)) &* 0xBF58_476D_1CE4_E5B9
        z = (z ^ (z >> 27)) &* 0x94D0_49BB_1331_11EB
        return z ^ (z >> 31)
    }
}
