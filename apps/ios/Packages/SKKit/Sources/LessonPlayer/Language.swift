import ContentModel
import Foundation
import Profiles

// Which language of a content string shows where, by the profile's `language_mode` (rules in
// `Profiles`: `LanguageMode.nameLanguage`, `sentenceLanguage` …). Content text is shown verbatim:
// it comes from the lesson files, never from the string catalog (B7.9). Moved here from the app
// in SK-012 so the lesson screens and the app share one rule.

extension Spoken {
    /// The text in `language`. Vietnamese keeps its hyphenated loan words on one line
    /// (`keepingHyphenatedWords`, SK-047: "ô-xi" broke after "ô-").
    public func text(in language: ContentLanguage) -> String {
        language == .en ? en : vi.keepingHyphenatedWords
    }

    /// Hashes of the clips the profile's voice plays (`voiceClips(for:)`); empty with the
    /// fixtures, which have no audio. A missing clip (VI before the voice is chosen) is skipped.
    public func clips(for voice: VoiceMode) -> [String] {
        voiceClips(for: voice).map(\.hash)
    }
}

extension BilingualText {
    public func text(in language: ContentLanguage) -> String {
        language == .en ? en : vi.keepingHyphenatedWords
    }
}

extension String {
    /// SK-047: a hyphen between two letters becomes U+2011 NON-BREAKING HYPHEN, so a Vietnamese
    /// loan word ("ô-xi", "các-bon", "a-xít") never breaks after its hyphen. Only for display:
    /// Be Vietnam Pro and Phudu both draw U+2011 with their own hyphen glyph (checked 15/11), and
    /// the clips do not use this text. A hyphen with a space beside it is left alone.
    public var keepingHyphenatedWords: String {
        guard contains("-") else { return self }
        var scalars = Array(unicodeScalars)
        for index in scalars.indices.dropFirst().dropLast()
        where scalars[index] == "-"
            && CharacterSet.letters.contains(scalars[index - 1])
            && CharacterSet.letters.contains(scalars[index + 1]) {
            scalars[index] = "\u{2011}"
        }
        var result = String.UnicodeScalarView()
        result.append(contentsOf: scalars)
        return String(result)
    }
}

extension Syllabus.Title {
    /// `vi` while it is not translated yet (`null`) falls back to `en` (SK-030).
    public func text(in language: ContentLanguage) -> String {
        language == .en ? en : (vi ?? en)
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

    /// A syllabus title (Home, Topic), English while the Vietnamese one is missing.
    public func name(_ title: Syllabus.Title) -> String {
        title.text(in: nameLanguage)
    }

    /// The other language of a syllabus title; `nil` in Tiếng Anh trước, and while `vi` is
    /// missing (both languages would show the same English words).
    public func secondName(_ title: Syllabus.Title) -> String? {
        guard title.vi != nil else { return nil }
        return nameSecondLanguage.map { title.text(in: $0) }
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
