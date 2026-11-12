import DesignSystem
import Profiles
import SwiftUI

/// Cài đặt (SK-042, Duy 12/11): the language of the profile in use. Three choices on paper, the
/// chosen one vàng hoè (`PaperChoiceStyle`), mapped onto the profile's `language_mode` with no new
/// value: English → `en_first`, Tiếng Việt → `vi_first`, Cả hai → `bilingual`. The voice follows
/// (`VoiceMode.matching`). The change applies at once to every screen and to lessons opened from
/// now on (a lesson under way keeps the language it opened with).
///
/// No parent PIN yet (out of scope, canvas `Discoverer-Parent`).
struct SettingsScreen: View {
    let app: AppModel
    let profile: ChildProfile
    @State private var saveFailed = false
    @Environment(\.ageGroup) private var ageGroup

    static let choices: [(mode: LanguageMode, title: LocalizedStringKey, detail: LocalizedStringKey, id: String)] = [
        (.enFirst, "settings.language.en", "settings.language.en_detail", "settings.language.en"),
        (.viFirst, "settings.language.vi", "settings.language.vi_detail", "settings.language.vi"),
        (.bilingual, "settings.language.both", "settings.language.both_detail", "settings.language.both"),
    ]

    var body: some View {
        PaperFrame(scrolls: true) {
            VStack(alignment: .leading, spacing: ScreenMetrics.homeGap) {
                ScreenHeader(
                    back: .init(label: Text("settings.back"), action: app.goBack),
                    title: Text("settings.title"),
                    titleIdentifier: "settings.title"
                )
                .reveal(order: 0)
                VStack(alignment: .leading, spacing: Tokens.Space.s10) {
                    Text("settings.language.title")
                        .typography(Tokens.Typography.number)
                        .accessibilityAddTraits(.isHeader)
                    Text("settings.language.caption \(profile.displayName)")
                        .typography(Tokens.Typography.caption)
                        .foregroundStyle(Tokens.Role.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                    VStack(spacing: Tokens.Space.s10) {
                        ForEach(Self.choices, id: \.id) { choice in
                            row(choice.mode, title: choice.title, detail: choice.detail, id: choice.id)
                        }
                    }
                    .padding(.trailing, Tokens.Shadow.offsetAccent.layers.map(\.x).max() ?? 0)
                    .accessibilityElement(children: .contain)
                    .accessibilityLabel(Text("settings.language.title"))
                    if saveFailed {
                        Text("settings.save_failed")
                            .typography(Tokens.Typography.caption)
                            .foregroundStyle(Tokens.Role.textAccent)
                            .accessibilityIdentifier("settings.save_failed")
                    }
                }
                .reveal(order: 1)
            }
        }
    }

    private func row(_ mode: LanguageMode, title: LocalizedStringKey, detail: LocalizedStringKey, id: String) -> some View {
        let selected = profile.languageMode == mode
        return Button {
            saveFailed = !app.setLanguage(mode)
        } label: {
            VStack(alignment: .leading, spacing: Tokens.Space.s2) {
                Text(title)
                    .typography(Tokens.Typography.itemTitle)
                Text(detail)
                    .typography(Tokens.Typography.caption)
                    .foregroundStyle(Tokens.Role.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .multilineTextAlignment(.leading)
            .padding(EdgeInsets(top: Tokens.Space.s12, leading: Tokens.Space.s14, bottom: Tokens.Space.s12, trailing: Tokens.Space.s14))
            .frame(maxWidth: .infinity, minHeight: ageGroup.touchTarget, alignment: .leading)
        }
        .buttonStyle(PaperChoiceStyle(state: selected ? .selected : .idle))
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(selected ? .isSelected : [])
        .accessibilityIdentifier(id)
    }
}
