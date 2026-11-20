import CoreGraphics
import Foundation
import os

// SK-059 (Duy 19/11): on the Chơi shelf a tap opens the picture big ("xem to"), a long press then
// a drag into the tray picks it. The pieces here have no SwiftUI so they can be tested: the
// shelf's columns, what a drop does, and the first-time hint. The engine (`buildTray`) is not
// touched: a drop on the tray is the old tap (`LessonSession.tapTrayItem`).

/// The shelf's grid (designer 19/11, "Ghi chú designer" of SK-059).
///
/// - iPhone, 6 items or fewer: 2 columns; a cell is as high as the room left under the chips
///   allows for its rows (`(room − gaps) ÷ rows`), between 96 and 132. Below 96: 3 columns of 96.
/// - iPhone, more than 6: 3 columns of 96 (`110 × 96`, as before).
/// - iPad, 6 or fewer: 3 columns of 150; more: 4 columns of 124.
public enum PlayShelfLayout {
    public struct Shelf: Equatable, Sendable {
        public let columns: Int
        /// Cell height in points.
        public let cell: CGFloat
    }

    /// The most items shown in the big layouts.
    public static let bigLayoutMaxItems = 6
    public static let gap: CGFloat = 10
    public static let compactCellMin: CGFloat = 96
    public static let compactCellMax: CGFloat = 132
    /// Two-column cell when the room is not measured yet (the canvas `x59-shelf2`: `167 × 112`).
    public static let compactCellDefault: CGFloat = 112
    public static let regularCellBig: CGFloat = 150
    public static let regularCellDense: CGFloat = 124

    /// `room`: height left for the shelf on the first screen (under the chips, above the bottom
    /// bar), `nil` before it is measured.
    public static func shelf(itemCount: Int, isRegular: Bool, room: CGFloat?) -> Shelf {
        let big = itemCount <= bigLayoutMaxItems
        if isRegular {
            return big ? Shelf(columns: 3, cell: regularCellBig) : Shelf(columns: 4, cell: regularCellDense)
        }
        guard big else { return Shelf(columns: 3, cell: compactCellMin) }
        let rows = max(1, Int((Double(itemCount) / 2).rounded(.up)))
        guard let room, room > 0 else { return Shelf(columns: 2, cell: compactCellDefault) }
        let raw = (room - gap * CGFloat(rows - 1)) / CGFloat(rows)
        if raw < compactCellMin { return Shelf(columns: 3, cell: compactCellMin) }
        return Shelf(columns: 2, cell: min(raw, compactCellMax))
    }

    /// Required group chips share one row, equal widths, when there are at most this many
    /// (designer 19/11, Duy approved); more wrap as before.
    public static let evenChipsMax = 3
}

/// What a drag carries: the item's key and where it was lifted from.
public struct PlayDragPayload: Codable, Equatable, Sendable {
    public enum Source: String, Codable, Sendable { case shelf, tray }
    public let key: String
    public let source: Source

    public init(key: String, source: Source) {
        self.key = key
        self.source = source
    }

    /// The text the drag session carries (in-app only: a type no other app reads).
    public var encoded: String { "\(source.rawValue):\(key)" }

    public init?(encoded: String) {
        guard let colon = encoded.firstIndex(of: ":"),
              let source = Source(rawValue: String(encoded[..<colon])) else { return nil }
        let key = String(encoded[encoded.index(after: colon)...])
        guard !key.isEmpty else { return nil }
        self.init(key: key, source: source)
    }
}

/// Where a drag ends, and what it does to the tray.
public enum PlayDrop: Equatable, Sendable {
    /// Over the tray (its frame grown by `trayDropOutset`).
    case tray
    /// Anywhere else on the screen.
    case outside

    /// The designer's drop zone: the tray's frame grown by 16 pt.
    public static let trayDropOutset: CGFloat = 16

    public enum Effect: Equatable, Sendable {
        /// `tapTrayItem(key)`: the item goes in (or, tray full, the engine says `full`).
        case add
        /// `tapTrayItem(key)` on an item already in: it comes out.
        case remove
        /// Nothing changes; the item slides back.
        case none
    }

    /// From the shelf onto the tray: add (unless already in: the shelf does not lift it then).
    /// From the tray to outside: remove. Everything else: nothing.
    public func effect(of payload: PlayDragPayload, onTray: Bool) -> Effect {
        switch (payload.source, self) {
        case (.shelf, .tray): onTray ? .none : .add
        case (.tray, .outside): onTray ? .remove : .none
        default: .none
        }
    }

    /// Whether the drop is over the tray.
    public static func at(_ point: CGPoint, trayFrame: CGRect) -> PlayDrop {
        trayFrame.insetBy(dx: -trayDropOutset, dy: -trayDropOutset).contains(point) ? .tray : .outside
    }
}

/// The mascot's hint on Chơi (SK-059 §4): the first time a child profile opens Chơi on this
/// device, and once again in an attempt when three big views closed without any pick.
public struct PlayHintState: Equatable, Sendable {
    public enum Line: Equatable, Sendable { case first, again }

    /// Big views (closed) before the reminder.
    public static let zoomsBeforeReminder = 3

    public private(set) var showing: Line?
    public private(set) var zoomsClosed = 0
    public private(set) var reminded = false
    public private(set) var picked = false

    public init(firstTime: Bool) {
        showing = firstTime ? .first : nil
    }

    /// The child did something (tap, drag): the hint stops, the bubble shows the lesson's message.
    public mutating func dismiss() {
        showing = nil
    }

    /// An item went into the tray.
    public mutating func didPick() {
        picked = true
        showing = nil
    }

    /// A big view closed; the third with no pick yet shows the reminder, once.
    public mutating func zoomClosed() {
        zoomsClosed += 1
        if !picked, !reminded, zoomsClosed >= Self.zoomsBeforeReminder {
            reminded = true
            showing = .again
        }
    }
}

/// Which child profiles saw the Chơi hint on this device: a small file next to the attempts
/// (`play_hint_seen.json`), never sent to the server (B10: child data stays minimal).
public struct PlayHintStore: Sendable {
    public let url: URL
    private static let log = Logger(subsystem: "vn.sciencekids.app", category: "lesson")

    public init(directory: URL) {
        url = directory.appendingPathComponent("play_hint_seen.json")
    }

    public func seen(childId: UUID) -> Bool {
        load().contains(childId.uuidString.lowercased())
    }

    public func markSeen(childId: UUID) {
        var ids = load()
        guard ids.insert(childId.uuidString.lowercased()).inserted else { return }
        do {
            try FileManager.default.createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true)
            try JSONEncoder().encode(ids.sorted()).write(to: url, options: .atomic)
        } catch {
            Self.log.error("play hint flag not saved: \(error.localizedDescription, privacy: .public)")
        }
    }

    private func load() -> Set<String> {
        guard let data = try? Data(contentsOf: url) else { return [] }
        return Set((try? JSONDecoder().decode([String].self, from: data)) ?? [])
    }
}
