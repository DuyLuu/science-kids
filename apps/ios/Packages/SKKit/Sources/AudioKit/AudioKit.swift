/// `AudioKit` plays the voice of the content (SK-016): `SpeechPlayer` (one utterance at a time,
/// EN → VI clips, autoplay off under VoiceOver, preloading), `AVClipBackend` (`AVAudioPlayer`),
/// `AudioSessionPolicy` (`.ambient` for now). It knows clips by hash only; the lesson player picks
/// them from the content and the profile's `voice_mode`.
public enum AudioKitModule {
    public static let name = "AudioKit"
}
