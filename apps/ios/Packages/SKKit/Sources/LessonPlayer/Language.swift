import ContentModel
import Profiles

// Which language of a content string shows where, by the profile's `language_mode` (rules in
// `Profiles`: `LanguageMode.nameLanguage`, `sentenceLanguage` …). Content text is shown verbatim:
// it comes from the lesson files, never from the string catalog (B7.9). Moved here from the app
// in SK-012 so the lesson screens and the app share one rule.

extension Spoken {
    public func text(in language: ContentLanguage) -> String {
        language == .en ? en : vi
    }

    /// Hashes of the clips the profile's voice plays (`voiceClips(for:)`); empty with the
    /// fixtures, which have no audio. A missing clip (VI before the voice is chosen) is skipped.
    public func clips(for voice: VoiceMode) -> [String] {
        voiceClips(for: voice).map(\.hash)
    }
}

extension BilingualText {
    public func text(in language: ContentLanguage) -> String {
        language == .en ? en : vi
    }
}

extension LanguageMode {
    /// A title or name (topic, lesson, tray item, example food): Vietnamese in Song ngữ and Tiếng
    /// Việt trước, as the canvas; English in Tiếng Anh trước.
    public func name(_ spoken: Spoken) -> String {
        spoken.text(in: nameLanguage)
    }

    /// The other language of a name, for a caption; `nil` in Tiếng Anh trước.
    public func secondName(_ spoken: Spoken) -> String? {
        nameSecondLanguage.map { spoken.text(in: $0) }
    }

    /// First line of a sentence or an answer label the child reads (English, except in Tiếng
    /// Việt trước).
    public func sentence(_ spoken: Spoken) -> String {
        spoken.text(in: sentenceLanguage)
    }

    /// Line under the sentence, in the other language.
    public func secondSentence(_ spoken: Spoken) -> String {
        spoken.text(in: sentenceSecondLanguage)
    }
}
