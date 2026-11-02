import Foundation

/// `child_profiles.language_mode` (technical-plan B4.1, B5.3): how the lesson text shows its two
/// languages. Chosen on the Welcome screen (canvas Discoverer 1).
///
/// Raw values are the keys of `default_voice_mode` in `content/rules.json` (SK-015 decision 5),
/// written `snake_case` like the database.
public enum LanguageMode: String, Codable, CaseIterable, Sendable {
    /// "Song ngữ": English with Vietnamese subtitles (recommended).
    case bilingual
    /// "Tiếng Anh trước": Vietnamese hidden, tap to see (international schools, centres).
    case enFirst = "en_first"
    /// "Tiếng Việt trước": for children who are just starting.
    case viFirst = "vi_first"
}

/// `child_profiles.voice_mode` (B4.1): which recorded voice plays. `both` plays EN, then VI.
public enum VoiceMode: String, Codable, CaseIterable, Sendable {
    case en
    case vi
    case both
}

/// `child_profiles.age_group`: the learning world of a child (B4.1).
public enum AgeGroup: String, Codable, CaseIterable, Sendable {
    case explorer
    case discoverer
    case scientist
}

/// A language of the content (`Spoken.en`, `Spoken.vi`).
public enum ContentLanguage: String, Codable, CaseIterable, Sendable {
    case en
    case vi

    public var other: ContentLanguage { self == .en ? .vi : .en }
}

extension VoiceMode {
    /// The voice suggested on the profile screen for a language mode (B4.1): Song ngữ → both,
    /// Tiếng Anh trước → en, Tiếng Việt trước → both; Explorer is always both. Same values as
    /// `default_voice_mode` in `content/rules.json` (`ProfilesTests` compares them).
    ///
    /// TODO(SK-016): read `rules.<age_group>.default_voice_mode` from the pack manifest once
    /// ContentKit loads it (SK-011 decision 2).
    public static func suggested(for mode: LanguageMode, ageGroup: AgeGroup) -> VoiceMode {
        if ageGroup == .explorer { return .both }
        switch mode {
        case .bilingual: return .both
        case .enFirst: return .en
        case .viFirst: return .both
        }
    }
}

extension LanguageMode {
    /// Language of a name (topic title, lesson title) on Home and Topic. The canvas, drawn in
    /// Song ngữ, names the topic and its lessons in Vietnamese (Home, Topic).
    public var nameLanguage: ContentLanguage {
        switch self {
        case .bilingual, .viFirst: .vi
        case .enFirst: .en
        }
    }

    /// Second language shown next to a name where the layout has a caption
    /// (the English title before "· Mức 2" under the topic title); `nil` hides it (Tiếng Anh trước).
    public var nameSecondLanguage: ContentLanguage? {
        switch self {
        case .bilingual, .viFirst: .en
        case .enFirst: nil
        }
    }

    /// First line of a sentence the child reads (topic question; lesson text in SK-012):
    /// English, except in Tiếng Việt trước.
    public var sentenceLanguage: ContentLanguage {
        self == .viFirst ? .vi : .en
    }

    /// Line under the sentence, in the other language.
    public var sentenceSecondLanguage: ContentLanguage { sentenceLanguage.other }

    /// Tiếng Anh trước: the Vietnamese line stays hidden until the child taps to see it.
    public var hidesSentenceSecondLanguage: Bool { self == .enFirst }
}

/// Grades of the Vietnamese school (Lớp 1–5) and their age group (canvas Discoverer 2).
public enum Grade {
    /// Every grade can be chosen (B18 #14), even where the world has no content yet.
    public static let range: ClosedRange<Int> = 1...5

    /// Canvas `Discoverer-Profile`: Lớp 1 → Explorer, Lớp 2–3 → Discoverer, Lớp 4–5 → Scientist.
    /// `nil` outside `range`. The server maps the same way in `create_child_profile` (B5.5).
    public static func ageGroup(for grade: Int) -> AgeGroup? {
        switch grade {
        case 1: .explorer
        case 2, 3: .discoverer
        case 4, 5: .scientist
        default: nil
        }
    }

    /// The UK school year of a grade (canvas: Lớp 2 → "Year 3"), for "Discoverer · Year 3".
    public static func ukYear(for grade: Int) -> Int { grade + 1 }
}
