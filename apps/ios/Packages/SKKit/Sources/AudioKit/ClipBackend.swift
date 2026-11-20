import AVFoundation
import os

/// What sounds a clip. `AVClipBackend` on a device; tests use a fake that records the calls.
@MainActor
public protocol ClipBackend: AnyObject {
    /// Plays `data` (an m4a clip) from the start, stopping anything playing. Calls `onFinish`
    /// once, when the clip ends by itself (not after `stop()`).
    func play(_ data: Data, onFinish: @escaping @MainActor () -> Void) throws
    func stop()
    /// Players sounding now (0 or 1 by design).
    var playingCount: Int { get }
}

public enum ClipBackendError: Error, Equatable, Sendable {
    /// `AVAudioPlayer.play()` returned false.
    case didNotStart
}

/// `AVAudioPlayer` (B7.3), with the app's session policy (`AudioSessionPolicy.current`).
@MainActor
public final class AVClipBackend: NSObject, ClipBackend {
    private let policy: AudioSessionPolicy
    private var slots = ClipSlots<AVAudioPlayer>()
    private let log = Logger(subsystem: Bundle.main.bundleIdentifier ?? "ScienceKids", category: "audio")

    public init(policy: AudioSessionPolicy = .current) {
        self.policy = policy
    }

    public func play(_ data: Data, onFinish: @escaping @MainActor () -> Void) throws {
        stop()
        policy.activate(log: log)
        let player = try AVAudioPlayer(data: data, fileTypeHint: AVFileType.m4a.rawValue)
        player.delegate = self
        guard player.play() else { throw ClipBackendError.didNotStart }
        slots.add(player, onFinish: onFinish)
    }

    public func stop() {
        for player in slots.removeAll() {
            player.delegate = nil
            player.stop()
        }
    }

    public var playingCount: Int {
        slots.players.filter(\.isPlaying).count
    }

    fileprivate func ended(_ player: AVAudioPlayer) {
        // Called after `slots` is updated: `onFinish` starts the next clip, which stops and adds.
        slots.ended(player)?()
    }
}

/// The players sounding and what to call when each ends by itself (SK-060, finding 6).
///
/// The end of a clip comes from the delegate on another thread and reaches the main actor a
/// moment later. If a tap starts the next clip in that moment, the ended player is already
/// released and the new one may sit at the same address: keyed by `ObjectIdentifier` alone, the
/// late "ended" removed the new player (releasing it, so it went silent) and ran its `onFinish`.
/// Here the late call carries the player itself (kept alive until it arrives) and only ends the
/// slot holding that very object.
struct ClipSlots<Player: AnyObject> {
    private var entries: [ObjectIdentifier: (player: Player, onFinish: @MainActor () -> Void)] = [:]

    var players: [Player] { entries.values.map(\.player) }

    mutating func add(_ player: Player, onFinish: @escaping @MainActor () -> Void) {
        entries[ObjectIdentifier(player)] = (player, onFinish)
    }

    /// Forgets every player (`stop()`); their `onFinish` is not called.
    mutating func removeAll() -> [Player] {
        defer { entries.removeAll() }
        return players
    }

    /// `player` ended by itself: forgets it and returns its `onFinish` (once), if it is still the
    /// one in its slot. The caller runs it after this returns: it starts the next clip, which
    /// changes the slots again (calling it in here was a simultaneous access, SK-060).
    mutating func ended(_ player: Player) -> (@MainActor () -> Void)? {
        let id = ObjectIdentifier(player)
        guard let entry = entries[id], entry.player === player else { return nil }
        entries[id] = nil
        return entry.onFinish
    }
}

/// Carries an `AVAudioPlayer` from the delegate's thread to the main actor, where it is only
/// compared and handed back (never played).
private struct PlayerRef: @unchecked Sendable {
    let player: AVAudioPlayer
}

extension AVClipBackend: AVAudioPlayerDelegate {
    nonisolated public func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        let ref = PlayerRef(player: player)
        Task { @MainActor [weak self] in self?.ended(ref.player) }
    }

    nonisolated public func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: (any Error)?) {
        let ref = PlayerRef(player: player)
        Task { @MainActor [weak self] in self?.ended(ref.player) }
    }
}
