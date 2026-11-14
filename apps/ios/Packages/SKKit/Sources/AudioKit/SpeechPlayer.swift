import Foundation
import Observation
import os
import UIKit

/// One thing the child hears when a listen button is tapped or a screen opens: clips in order
/// (for `voice_mode` = `both`, the EN clip of each sentence, then its VI clip). Built by the
/// lesson player from the content; AudioKit only plays it.
public struct Utterance: Hashable, Sendable, Identifiable {
    public struct Clip: Hashable, Sendable {
        /// sha256 of the clip in the content pack (`audio.en` / `audio.vi`).
        public let hash: String
        /// `en` or `vi`.
        public let language: String
        /// What the clip says, for logs and the debug probe.
        public let text: String

        public init(hash: String, language: String, text: String) {
            self.hash = hash
            self.language = language
            self.text = text
        }

        /// `en:Pick the missing word`
        public var label: String { "\(language):\(text)" }
    }

    /// Stable name of what is said (`question.q3`, `word.q5_fish`), for logs and tests.
    public let id: String
    public let clips: [Clip]

    public init(id: String, clips: [Clip]) {
        self.id = id
        self.clips = clips
    }

    /// Nothing to play: no clip in the voice of the profile. Screens hide its listen button.
    public var isEmpty: Bool { clips.isEmpty }

    /// The clips in one language only (`en`, `vi`), same id with the language after it.
    public func only(_ language: String) -> Utterance {
        Utterance(id: "\(id).\(language)", clips: clips.filter { $0.language == language })
    }
}

/// Where the bytes of a clip come from: the content pack, which checks them first (SK-016).
public protocol ClipLoader: Sendable {
    func clipData(for hash: String) async throws -> Data
}

/// What happened, in order, for the debug probe and the tests (no audio is needed to read it).
public struct SpeechStats: Codable, Sendable, Equatable {
    /// `play` and `autoplay` calls with something to play.
    public var requested = 0
    /// Utterances that made a sound (their first clip started), by id.
    public var sounded: [String] = []
    /// Utterances that played to their last clip.
    public var finished: [String] = []
    /// Utterances stopped before their end (another one, `stop()`, leaving the screen).
    public var interrupted: [String] = []
    /// Every clip started, as `language:text`.
    public var heard: [String] = []
    /// Clips that could not play (missing, refused by the pack check, not decodable).
    public var failed: [String] = []
    /// Utterances started by a screen opening, and those not started because VoiceOver is on.
    public var autoplayed: [String] = []
    public var autoplaySkipped: [String] = []
    /// The most players sounding at the same moment (must stay 1: never two voices at once).
    public var maxPlaying = 0

    public init() {}
}

/// Plays the voice of the lesson (SK-016, B7.3): one utterance at a time. A new request stops the
/// one playing, so tapping five listen buttons fast plays only the last. Clips that cannot be
/// loaded are skipped quietly (the text stays on screen).
///
/// - `play(_:)`: a tap on a listen button or a word.
/// - `autoplay(_:)`: a screen opening (instruction, question). Not when VoiceOver is running, so
///   the clip never talks over VoiceOver; the listen buttons still play.
/// - `preload(_:)`: reads and checks the clips of the steps about to show, ahead of the taps.
@MainActor
@Observable
public final class SpeechPlayer {
    /// Id of the utterance playing (or loading its next clip).
    public private(set) var speaking: String?
    public private(set) var stats = SpeechStats()
    /// SK-042 (Duy 13/11): in "Cả hai" only this language plays by itself and on the main listen
    /// buttons and taps (`play`, `autoplay`); the other language plays on its own small button
    /// (`secondVoice(of:)`, `playSecond`). `nil`: every clip plays, as before (English, Tiếng Việt).
    public var firstLanguageOnly: String?

    /// The content pack's clips; `nil` while there is no pack (fixtures: no audio).
    @ObservationIgnored public var loader: (any ClipLoader)?
    /// Whether VoiceOver is on. A launch argument may force it in debug builds (simulators have
    /// no VoiceOver).
    @ObservationIgnored public var isVoiceOverRunning: @MainActor () -> Bool

    @ObservationIgnored private let backend: any ClipBackend
    @ObservationIgnored private var generation = 0
    @ObservationIgnored private var current: Utterance?
    @ObservationIgnored private var queue: ArraySlice<Utterance.Clip> = []
    @ObservationIgnored private var currentSounded = false
    @ObservationIgnored private var cache: [String: Data] = [:]
    @ObservationIgnored private var wanted: Set<String> = []
    @ObservationIgnored private var loading: [String: Task<Data?, Never>] = [:]
    @ObservationIgnored private let log = Logger(subsystem: Bundle.main.bundleIdentifier ?? "ScienceKids", category: "audio")

    public init(
        loader: (any ClipLoader)? = nil,
        backend: (any ClipBackend)? = nil,
        isVoiceOverRunning: @escaping @MainActor () -> Bool = { UIAccessibility.isVoiceOverRunning }
    ) {
        self.loader = loader
        self.backend = backend ?? AVClipBackend()
        self.isVoiceOverRunning = isVoiceOverRunning
    }

    // MARK: Playing

    /// Plays `utterance` from its start, stopping whatever was playing; with `firstLanguageOnly`,
    /// only its clips in that language (all of them when it has none in that language).
    public func play(_ utterance: Utterance) {
        start(firstVoice(of: utterance))
    }

    /// The part of `utterance` that `play` sounds.
    public func firstVoice(of utterance: Utterance) -> Utterance {
        guard let language = firstLanguageOnly else { return utterance }
        let first = Utterance(id: utterance.id, clips: utterance.clips.filter { $0.language == language })
        return first.isEmpty ? utterance : first
    }

    /// With `firstLanguageOnly`: the clips of `utterance` in the other language(s), for the small
    /// second-language button; `nil` without `firstLanguageOnly`, or when there are none.
    public func secondVoice(of utterance: Utterance) -> Utterance? {
        guard let language = firstLanguageOnly else { return nil }
        let second = Utterance(id: "\(utterance.id).second", clips: utterance.clips.filter { $0.language != language })
        guard !second.isEmpty, second.clips.count < utterance.clips.count else { return nil }
        return second
    }

    /// Plays the second-language part of `utterance` (the small button), stopping what was playing.
    public func playSecond(_ utterance: Utterance) {
        guard let second = secondVoice(of: utterance) else { return }
        start(second)
    }

    private func start(_ utterance: Utterance) {
        interrupt()
        guard !utterance.isEmpty else { return }
        stats.requested += 1
        generation += 1
        current = utterance
        queue = utterance.clips[...]
        currentSounded = false
        speaking = utterance.id
        log.debug("speak \(utterance.id, privacy: .public): \(utterance.clips.count) clip(s)")
        playNextClip(generation)
    }

    /// A screen opened: plays `utterance` unless VoiceOver is running. Stops what was playing
    /// either way (it belonged to the screen before).
    public func autoplay(_ utterance: Utterance) {
        guard !utterance.isEmpty else {
            interrupt()
            return
        }
        if isVoiceOverRunning() {
            interrupt()
            stats.autoplaySkipped.append(utterance.id)
            log.notice("autoplay skipped (VoiceOver): \(utterance.id, privacy: .public)")
            return
        }
        stats.autoplayed.append(utterance.id)
        play(utterance)
    }

    /// Silence (leaving a lesson, the app going to the background).
    public func stop() {
        interrupt()
    }

    private func interrupt() {
        generation += 1
        backend.stop()
        if let current { stats.interrupted.append(current.id) }
        current = nil
        queue = []
        speaking = nil
    }

    private func playNextClip(_ token: Int) {
        guard token == generation, let utterance = current else { return }
        guard let clip = queue.popFirst() else {
            stats.finished.append(utterance.id)
            current = nil
            speaking = nil
            return
        }
        if let data = cache[clip.hash] {
            start(clip, data: data, token: token)
            return
        }
        Task { [weak self] in
            guard let self else { return }
            let data = await self.load(clip.hash)
            guard token == self.generation else { return }
            if let data {
                self.start(clip, data: data, token: token)
            } else {
                self.skip(clip, token: token, reason: "unavailable")
            }
        }
    }

    private func start(_ clip: Utterance.Clip, data: Data, token: Int) {
        do {
            try backend.play(data) { [weak self] in self?.clipEnded(token) }
        } catch {
            skip(clip, token: token, reason: String(describing: error))
            return
        }
        if !currentSounded, let current {
            currentSounded = true
            stats.sounded.append(current.id)
        }
        stats.heard.append(clip.label)
        stats.maxPlaying = max(stats.maxPlaying, backend.playingCount)
        log.info("play \(self.current?.id ?? "-", privacy: .public) \(clip.language, privacy: .public) \(clip.hash.prefix(12), privacy: .public)")
    }

    private func clipEnded(_ token: Int) {
        guard token == generation else { return }
        playNextClip(token)
    }

    /// A clip that cannot play is skipped quietly: the next clip (or nothing) follows.
    private func skip(_ clip: Utterance.Clip, token: Int, reason: String) {
        stats.failed.append(clip.label)
        log.error("clip skipped \(clip.language, privacy: .public) \(clip.hash.prefix(12), privacy: .public): \(reason, privacy: .public)")
        playNextClip(token)
    }

    // MARK: Loading

    /// Keeps the clips of `hashes` read and checked ahead of time (the steps showing and next),
    /// and forgets the others.
    public func preload(_ hashes: some Sequence<String>) {
        wanted = Set(hashes)
        cache = cache.filter { wanted.contains($0.key) }
        for hash in wanted where cache[hash] == nil && loading[hash] == nil {
            Task { [weak self] in _ = await self?.load(hash) }
        }
    }

    /// Clips read ahead and kept (tests).
    public var preloaded: Set<String> { Set(cache.keys) }

    private func load(_ hash: String) async -> Data? {
        if let data = cache[hash] { return data }
        if let task = loading[hash] { return await task.value }
        guard let loader else { return nil }
        let task = Task<Data?, Never> {
            try? await loader.clipData(for: hash)
        }
        loading[hash] = task
        let data = await task.value
        loading[hash] = nil
        if let data, wanted.contains(hash) { cache[hash] = data }
        return data
    }
}
