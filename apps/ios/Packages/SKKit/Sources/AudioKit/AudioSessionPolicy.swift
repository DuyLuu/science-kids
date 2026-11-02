import AVFAudio
import os

/// How the app's voice clips share the device audio (B7.3).
///
/// One value, `current`, is used everywhere. **Mặc định tạm (SK-016):** `.ambient`, as the ticket
/// says: never stops the music of the device, but the silent switch mutes the clips. Duy decides at
/// SK-020 on a real iPhone; if the clips must play with the switch on silent, set `current` to
/// `.playbackMixing` (`.playback` + `.mixWithOthers`: still never stops the device's music).
public enum AudioSessionPolicy: String, Sendable, Equatable {
    /// `AVAudioSession.Category.ambient`: mixes with other audio; muted by the silent switch.
    case ambient
    /// `.playback` with `.mixWithOthers`: plays with the silent switch on, mixed with the music.
    case playbackMixing

    /// The policy of the app. The one line to change after SK-020.
    public static let current: AudioSessionPolicy = .ambient

    var category: AVAudioSession.Category {
        switch self {
        case .ambient: .ambient
        case .playbackMixing: .playback
        }
    }

    var options: AVAudioSession.CategoryOptions {
        switch self {
        case .ambient: []
        case .playbackMixing: [.mixWithOthers]
        }
    }

    /// Sets the shared session's category and activates it. Errors are logged, not thrown: no
    /// sound is better than a stuck lesson.
    @MainActor
    func activate(log: Logger) {
        let session = AVAudioSession.sharedInstance()
        do {
            if session.category != category || session.categoryOptions != options {
                try session.setCategory(category, mode: .default, options: options)
            }
            try session.setActive(true)
        } catch {
            log.error("audio session \(rawValue, privacy: .public) not active: \(String(describing: error), privacy: .public)")
        }
    }
}
