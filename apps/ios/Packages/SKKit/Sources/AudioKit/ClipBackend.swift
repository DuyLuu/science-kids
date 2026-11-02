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
    private var players: [ObjectIdentifier: AVAudioPlayer] = [:]
    private var onFinish: [ObjectIdentifier: @MainActor () -> Void] = [:]
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
        let id = ObjectIdentifier(player)
        players[id] = player
        self.onFinish[id] = onFinish
    }

    public func stop() {
        for player in players.values {
            player.delegate = nil
            player.stop()
        }
        players.removeAll()
        onFinish.removeAll()
    }

    public var playingCount: Int {
        players.values.filter(\.isPlaying).count
    }

    fileprivate func ended(_ id: ObjectIdentifier) {
        players[id] = nil
        onFinish.removeValue(forKey: id)?()
    }
}

extension AVClipBackend: AVAudioPlayerDelegate {
    nonisolated public func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        let id = ObjectIdentifier(player)
        Task { @MainActor [weak self] in self?.ended(id) }
    }

    nonisolated public func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: (any Error)?) {
        let id = ObjectIdentifier(player)
        Task { @MainActor [weak self] in self?.ended(id) }
    }
}
