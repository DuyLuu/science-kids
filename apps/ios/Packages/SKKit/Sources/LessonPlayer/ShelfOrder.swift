import ContentModel
import Foundation

/// The order of the things on the Chơi shelf (SK-031, "kệ trung tính"). The content lists the
/// items of a `build_tray` in any order, often group by group (rice and bread, then fish and
/// egg…) or with a pattern (every second place unsafe). On the shelf that order would show the
/// groups before the child picks, so the shelf shuffles the items once per attempt. The seed is
/// the attempt id: a resumed attempt keeps its shelf, a new one gets another. Nothing here
/// touches scoring (`buildTray` gets keys, not places).
///
/// SK-047: the shuffle is `SeededOrder` (Fisher–Yates on SplitMix64, written out so Android can
/// rebuild it) with the key `"play"`, no longer the standard library's `shuffled(using:)`.
enum ShelfOrder {
    static let key = "play"

    static func shuffled(_ items: [TrayItem], seed: UUID) -> [TrayItem] {
        SeededOrder.shuffled(items, attemptId: seed, key: key)
    }
}
