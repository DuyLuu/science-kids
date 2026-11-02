import Foundation
import Testing
@testable import AudioKit

@Test func moduleIsLinked() {
    #expect(AudioKitModule.name == "AudioKit")
}

/// Mặc định tạm of SK-016: `.ambient` until Duy decides at SK-020 (one line in AudioSessionPolicy).
@Test func sessionPolicyIsAmbientForNow() {
    #expect(AudioSessionPolicy.current == .ambient)
    #expect(AudioSessionPolicy.ambient.category == .ambient)
    #expect(AudioSessionPolicy.ambient.options.isEmpty)
    #expect(AudioSessionPolicy.playbackMixing.category == .playback)
    #expect(AudioSessionPolicy.playbackMixing.options == [.mixWithOthers])
}

/// Records what the player asks for; the test ends a clip by hand (`endClip()`).
@MainActor
final class FakeBackend: ClipBackend {
    private(set) var played: [String] = []
    private(set) var stops = 0
    private var onFinish: (@MainActor () -> Void)?
    var failing: Set<String> = []

    func play(_ data: Data, onFinish: @escaping @MainActor () -> Void) throws {
        stop()
        let name = String(decoding: data, as: UTF8.self)
        if failing.contains(name) { throw ClipBackendError.didNotStart }
        played.append(name)
        self.onFinish = onFinish
    }

    func stop() {
        stops += 1
        onFinish = nil
    }

    var playingCount: Int { onFinish == nil ? 0 : 1 }

    /// The clip playing ends by itself.
    func endClip() {
        let finish = onFinish
        onFinish = nil
        finish?()
    }
}

/// The VoiceOver switch of a test.
@MainActor
final class Switch {
    var isOn: Bool
    init(_ isOn: Bool) { self.isOn = isOn }
}

/// Clips by hash; the bytes are the hash's name. `delay` makes loading slow (taps faster than it).
struct FakeLoader: ClipLoader {
    var clips: Set<String>
    var delay: Duration = .zero

    func clipData(for hash: String) async throws -> Data {
        if delay > .zero { try await Task.sleep(for: delay) }
        guard clips.contains(hash) else { throw CocoaError(.fileNoSuchFile) }
        return Data(hash.utf8)
    }
}

@MainActor
@Suite struct SpeechPlayerTests {
    static func utterance(_ id: String, _ hashes: String...) -> Utterance {
        Utterance(id: id, clips: hashes.map { Utterance.Clip(hash: $0, language: $0.hasPrefix("vi") ? "vi" : "en", text: $0) })
    }

    /// Waits for the player's loading tasks (they run on the main actor between awaits).
    static func settle(until done: @MainActor () -> Bool = { false }) async {
        for _ in 0..<200 {
            if done() { return }
            try? await Task.sleep(for: .milliseconds(5))
        }
    }

    /// `both`: the EN clip, then the VI clip, then the utterance is finished.
    @Test func playsClipsInOrder() async {
        let backend = FakeBackend()
        let player = SpeechPlayer(loader: FakeLoader(clips: ["en1", "vi1"]), backend: backend, isVoiceOverRunning: { false })
        player.play(Self.utterance("q1", "en1", "vi1"))
        await Self.settle { backend.played == ["en1"] }
        #expect(player.speaking == "q1")
        backend.endClip()
        await Self.settle { backend.played == ["en1", "vi1"] }
        backend.endClip()
        await Self.settle { player.speaking == nil }
        #expect(backend.played == ["en1", "vi1"])
        #expect(player.stats.finished == ["q1"])
        #expect(player.stats.sounded == ["q1"])
        #expect(player.stats.heard == ["en:en1", "vi:vi1"])
        #expect(player.stats.maxPlaying == 1)
    }

    /// A clip that is not there (VI before the voice exists, or refused by the pack check) is
    /// skipped quietly; the rest plays.
    @Test func missingClipIsSkipped() async {
        let backend = FakeBackend()
        let player = SpeechPlayer(loader: FakeLoader(clips: ["en1", "en2"]), backend: backend, isVoiceOverRunning: { false })
        player.play(Self.utterance("q", "en1", "vi-missing", "en2"))
        await Self.settle { backend.played == ["en1"] }
        backend.endClip()
        await Self.settle { backend.played == ["en1", "en2"] }
        backend.endClip()
        await Self.settle { player.speaking == nil }
        #expect(player.stats.failed == ["vi:vi-missing"])
        #expect(player.stats.finished == ["q"])
    }

    /// No loader (fixtures, no pack): nothing plays, nothing breaks.
    @Test func noLoaderPlaysNothing() async {
        let backend = FakeBackend()
        let player = SpeechPlayer(loader: nil, backend: backend, isVoiceOverRunning: { false })
        player.play(Self.utterance("q", "en1"))
        await Self.settle { player.speaking == nil }
        #expect(backend.played.isEmpty)
        #expect(player.stats.failed == ["en:en1"])
    }

    @Test func emptyUtteranceDoesNothing() {
        let backend = FakeBackend()
        let player = SpeechPlayer(loader: FakeLoader(clips: []), backend: backend, isVoiceOverRunning: { false })
        player.play(Utterance(id: "q", clips: []))
        #expect(player.speaking == nil)
        #expect(player.stats.requested == 0)
    }

    /// Tapping again plays again from the start; another tap stops the first.
    @Test func newRequestStopsTheOneBefore() async {
        let backend = FakeBackend()
        let player = SpeechPlayer(loader: FakeLoader(clips: ["a", "b"]), backend: backend, isVoiceOverRunning: { false })
        player.play(Self.utterance("one", "a"))
        await Self.settle { backend.played == ["a"] }
        player.play(Self.utterance("one", "a"))
        await Self.settle { backend.played == ["a", "a"] }
        player.play(Self.utterance("two", "b"))
        await Self.settle { backend.played == ["a", "a", "b"] }
        #expect(player.stats.interrupted == ["one", "one"])
        #expect(player.speaking == "two")
        #expect(player.stats.maxPlaying == 1)
        backend.endClip()
        await Self.settle { player.speaking == nil }
        #expect(player.stats.finished == ["two"])
    }

    /// Five taps faster than the clips load: only the last one sounds, never two at once.
    @Test func fiveFastTapsPlayOnlyTheLast() async {
        let backend = FakeBackend()
        let ids = ["w1", "w2", "w3", "w4", "w5"]
        let player = SpeechPlayer(loader: FakeLoader(clips: Set(ids), delay: .milliseconds(30)), backend: backend, isVoiceOverRunning: { false })
        for id in ids { player.play(Self.utterance(id, id)) }
        await Self.settle { !backend.played.isEmpty }
        try? await Task.sleep(for: .milliseconds(100))
        #expect(backend.played == ["w5"])
        #expect(player.stats.sounded == ["w5"])
        #expect(player.stats.interrupted == ["w1", "w2", "w3", "w4"])
        #expect(player.stats.maxPlaying == 1)
    }

    /// VoiceOver on: a screen opening plays nothing (VoiceOver reads it); a listen button still plays.
    @Test func autoplayWaitsForVoiceOver() async {
        let backend = FakeBackend()
        let voiceOver = Switch(true)
        let player = SpeechPlayer(loader: FakeLoader(clips: ["q"]), backend: backend, isVoiceOverRunning: { voiceOver.isOn })
        player.autoplay(Self.utterance("question", "q"))
        await Self.settle()
        #expect(backend.played.isEmpty)
        #expect(player.stats.autoplaySkipped == ["question"])
        player.play(Self.utterance("question", "q"))
        await Self.settle { backend.played == ["q"] }
        #expect(player.stats.sounded == ["question"])

        voiceOver.isOn = false
        backend.endClip()
        player.autoplay(Self.utterance("next", "q"))
        await Self.settle { backend.played.count == 2 }
        #expect(player.stats.autoplayed == ["next"])
    }

    /// Autoplay of a screen with nothing to say still silences the screen before.
    @Test func emptyAutoplayStopsTheVoice() async {
        let backend = FakeBackend()
        let player = SpeechPlayer(loader: FakeLoader(clips: ["a"]), backend: backend, isVoiceOverRunning: { false })
        player.play(Self.utterance("one", "a"))
        await Self.settle { backend.played == ["a"] }
        player.autoplay(Utterance(id: "reward", clips: []))
        #expect(player.speaking == nil)
        #expect(backend.playingCount == 0)
        #expect(player.stats.interrupted == ["one"])
    }

    /// Preload reads the wanted clips ahead and forgets the others; a preloaded clip starts at once.
    @Test func preloadKeepsOnlyWhatIsAsked() async {
        let backend = FakeBackend()
        let player = SpeechPlayer(loader: FakeLoader(clips: ["a", "b", "c"]), backend: backend, isVoiceOverRunning: { false })
        player.preload(["a", "b", "missing"])
        await Self.settle { player.preloaded == ["a", "b"] }
        #expect(player.preloaded == ["a", "b"])
        player.preload(["b", "c"])
        await Self.settle { player.preloaded == ["b", "c"] }
        #expect(player.preloaded == ["b", "c"])
        // Cached: plays without waiting for a load.
        player.play(Self.utterance("x", "b"))
        #expect(backend.played == ["b"])
    }

    /// A clip the backend cannot start is skipped like a missing one.
    @Test func undecodableClipIsSkipped() async {
        let backend = FakeBackend()
        backend.failing = ["bad"]
        let player = SpeechPlayer(loader: FakeLoader(clips: ["bad", "good"]), backend: backend, isVoiceOverRunning: { false })
        player.play(Self.utterance("q", "bad", "good"))
        await Self.settle { backend.played == ["good"] }
        #expect(player.stats.failed == ["en:bad"])
        #expect(player.stats.sounded == ["q"])
    }

    @Test func stopSilences() async {
        let backend = FakeBackend()
        let player = SpeechPlayer(loader: FakeLoader(clips: ["a"]), backend: backend, isVoiceOverRunning: { false })
        player.play(Self.utterance("one", "a"))
        await Self.settle { backend.played == ["a"] }
        player.stop()
        #expect(player.speaking == nil)
        #expect(backend.playingCount == 0)
        backend.endClip() // a late end of the stopped clip changes nothing
        #expect(player.stats.finished.isEmpty)
    }
}
