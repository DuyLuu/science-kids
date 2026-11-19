import ContentModel
import Profiles
import Testing
@testable import LessonPlayer

/// SK-052: Tổng kết page 2 (the "Ý sai → Ý đúng" card, "I can…") shows the line in the other
/// language under each sentence in "Cả hai", as the other steps do; English and Tiếng Việt show
/// one language only (SK-042).
@MainActor
@Suite struct RecapSecondLineTests {
    let objective = Spoken(en: "I can name parts of a plant.", vi: "Em gọi tên được các bộ phận của cây.")

    @Test func bilingualShowsTheVietnameseLine() {
        let mode = LanguageMode.bilingual
        #expect(mode.sentence(objective) == "I can name parts of a plant.")
        #expect(RecapStep.secondLine(objective, mode: mode, shows: !mode.hidesSentenceSecondLanguage) == "Em gọi tên được các bộ phận của cây.")
    }

    @Test func oneLanguageModesShowNoSecondLine() {
        for mode in [LanguageMode.enFirst, .viFirst] {
            #expect(RecapStep.secondLine(objective, mode: mode, shows: !mode.hidesSentenceSecondLanguage) == nil, "\(mode)")
        }
    }

    /// A line not translated yet (blank, or the same words) has no second line.
    @Test func blankOrSameSecondLineIsLeftOut() {
        #expect(RecapStep.secondLine(Spoken(en: "Oxygen", vi: " "), mode: .bilingual, shows: true) == nil)
        #expect(RecapStep.secondLine(Spoken(en: "Oxygen", vi: "Oxygen"), mode: .bilingual, shows: true) == nil)
    }
}
