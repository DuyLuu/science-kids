import Foundation
import Observation
import Profiles

/// What the parent picks on Welcome and Profile, before the profile exists (SK-011).
///
/// The voice follows the language mode (B4.1, `VoiceMode.suggested`) until the parent picks one
/// on the profile screen; after that, changing the mode or the grade keeps the parent's choice.
@MainActor
@Observable
final class OnboardingModel {
    var languageMode: LanguageMode = .bilingual {
        didSet { suggestVoice() }
    }
    var name = ""
    var avatar: AvatarChoice?
    var grade: Int? {
        didSet { suggestVoice() }
    }
    private(set) var voiceMode: VoiceMode = .suggested(for: .bilingual, ageGroup: .discoverer)
    private(set) var parentChoseVoice = false

    /// Age group of the chosen grade (canvas: Lớp 1 Explorer, 2–3 Discoverer, 4–5 Scientist).
    var ageGroup: AgeGroup? { grade.flatMap(Grade.ageGroup(for:)) }

    func chooseVoice(_ voice: VoiceMode) {
        voiceMode = voice
        parentChoseVoice = true
    }

    /// Name, avatar and grade are all needed; voice and mode always have a value.
    var canCreate: Bool {
        ChildProfile.normalizedName(name) != nil && avatar != nil && grade != nil
    }

    func makeProfile(now: Date = Date(), timeZone: TimeZone = .current) throws -> ChildProfile {
        try ChildProfile.create(
            displayName: name,
            avatar: avatar?.rawValue ?? "",
            grade: grade ?? 0,
            languageMode: languageMode,
            voiceMode: voiceMode,
            timeZone: timeZone,
            now: now
        )
    }

    private func suggestVoice() {
        guard !parentChoseVoice else { return }
        // Before a grade is chosen, suggest for the trial world (Discoverer).
        voiceMode = .suggested(for: languageMode, ageGroup: ageGroup ?? .discoverer)
    }
}
