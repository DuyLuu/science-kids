/// The rules part of a `build_tray` block (vector `build-tray` `input.block`; SK-001): how many
/// places the tray has, the groups with their role, the items with their group. Display text
/// (labels, messages) stays in the content; the engine only needs keys.
public struct TrayRules: Hashable, Sendable {
    public struct Group: Hashable, Sendable {
        public var key: String
        public var role: Role

        public init(key: String, role: Role) {
            self.key = key
            self.role = role
        }
    }

    public struct Item: Hashable, Sendable {
        public var key: String
        public var group: String

        public init(key: String, group: String) {
            self.key = key
            self.group = group
        }
    }

    /// `required`: the tray needs one item of the group; `limit`: one item of the group spoils the
    /// tray; `neutral` (and any role added later): no effect.
    public enum Role: Hashable, Sendable {
        case required
        case limit
        case neutral

        /// The schema's role name; unknown names count as `neutral`.
        public init(_ name: String) {
            switch name {
            case "required": self = .required
            case "limit": self = .limit
            default: self = .neutral
            }
        }
    }

    public var capacity: Int
    /// In the block's order: `missing` and the missing message follow it (Duy, 29/10).
    public var groups: [Group]
    public var items: [Item]

    public init(capacity: Int, groups: [Group], items: [Item]) {
        self.capacity = capacity
        self.groups = groups
        self.items = items
    }
}

/// Key of the message the tray shows (vector `expected.message`); the text is in the block's
/// `messages` (`start`, `full`, `balanced`, `has_limited`, `missing.<group>`).
public enum TrayMessage: Hashable, Sendable {
    case start
    case full
    case balanced
    case hasLimited
    case missing(group: String)

    /// The vector's spelling: `start`, `full`, `balanced`, `has_limited`, `missing.<group key>`.
    public var code: String {
        switch self {
        case .start: "start"
        case .full: "full"
        case .balanced: "balanced"
        case .hasLimited: "has_limited"
        case .missing(let group): "missing.\(group)"
        }
    }
}

/// The tray after the taps (vector `expected`).
public struct TrayState: Hashable, Sendable {
    /// Item keys in the order they were put on the tray.
    public var tray: [String]
    /// The last tap tried to add an item to a tray already at `capacity` (the tray did not change).
    /// A short-lived flag: the next tap that changes the tray turns it off (T1).
    public var full: Bool
    /// Required groups with no item on the tray, in `groups` order.
    public var missing: [String]
    /// An item of a `limit` group is on the tray.
    public var hasLimited: Bool
    /// `success_when = all_required_and_no_limit`.
    public var success: Bool
    public var message: TrayMessage

    public init(tray: [String], full: Bool, missing: [String], hasLimited: Bool, success: Bool, message: TrayMessage) {
        self.tray = tray
        self.full = full
        self.missing = missing
        self.hasLimited = hasLimited
        self.success = success
        self.message = message
    }
}

/// Broken input (T4): never guessed, never scored.
public enum TrayError: String, Error, Hashable, Sendable, CaseIterable {
    /// An item key the block does not have, on the starting tray or in the taps.
    case unknownItem = "unknown_item"
    /// The starting tray has an item twice or more items than `capacity`.
    case invalidTray = "invalid_tray"

    public var code: String { rawValue }
}

/// The meal tray of `build_tray` (SK-012, vector `build-tray`; Duy 29/10).
///
/// Each tap: an item already on the tray comes off; a new item goes on at the end while there is
/// room; a new item on a tray at `capacity` changes nothing and raises `full`. Any tap that
/// changes the tray lowers `full`. With no taps the tray is only evaluated.
///
/// Message, first that applies: `balanced` when the tray succeeds (even right after a refused
/// tap, `full` stays true), `full`, `has_limited`, `start` on an empty tray, then
/// `missing.<first missing group in groups order>`. The order of groups comes from the block,
/// never from code.
public func buildTray(block: TrayRules, tray: [String], taps: [String]) -> Result<TrayState, TrayError> {
    var groupOf: [String: String] = [:]
    for item in block.items { groupOf[item.key] = item.group }
    guard (tray + taps).allSatisfy({ groupOf[$0] != nil }) else { return .failure(.unknownItem) }
    guard Set(tray).count == tray.count, tray.count <= block.capacity else { return .failure(.invalidTray) }

    var current = tray
    var full = false
    for key in taps {
        if let index = current.firstIndex(of: key) {
            current.remove(at: index)
            full = false
        } else if current.count >= block.capacity {
            full = true
        } else {
            current.append(key)
            full = false
        }
    }

    let present = Set(current.compactMap { groupOf[$0] })
    let missing = block.groups.filter { $0.role == .required && !present.contains($0.key) }.map(\.key)
    let hasLimited = block.groups.contains { $0.role == .limit && present.contains($0.key) }
    let success = missing.isEmpty && !hasLimited

    let message: TrayMessage
    if success {
        message = .balanced
    } else if full {
        message = .full
    } else if hasLimited {
        message = .hasLimited
    } else if current.isEmpty {
        message = .start
    } else if let first = missing.first {
        message = .missing(group: first)
    } else {
        // Not reachable: not success, no limit item, not empty means a required group is missing.
        message = .start
    }
    return .success(TrayState(
        tray: current, full: full, missing: missing, hasLimited: hasLimited, success: success, message: message
    ))
}
