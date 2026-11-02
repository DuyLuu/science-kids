import DesignSystem
import Profiles
import SwiftUI

/// Màn 2 · Hồ sơ của bé (canvas `Discoverer-Profile`): nickname, avatar, grade, and the voice
/// block added on 28/10 (not on the canvas yet; built like the grade chips, SK-011 default).
struct ProfileSetupScreen: View {
    @Bindable var model: OnboardingModel
    let onBack: () -> Void
    let onCreate: (ChildProfile) throws -> Void

    @Environment(\.layoutMetrics) private var metrics
    @Environment(\.ageGroup) private var ageGroup
    @FocusState private var nameFocused: Bool
    @State private var saveFailed = false

    var body: some View {
        PaperFrame(scrolls: true) {
            VStack(alignment: .leading, spacing: ScreenMetrics.profileGap) {
                ScreenHeader(
                    back: .init(label: Text("profile.back"), action: onBack),
                    title: Text("profile.title"),
                    caption: Text("profile.setup_step")
                ) {
                    ProgressSquares(count: 2, current: 1, accessibilityLabel: Text("profile.step_a11y"))
                }
                .reveal(order: 0)
                nameField.reveal(order: 1)
                avatars.reveal(order: 2)
                grades.reveal(order: 3)
                voices.reveal(order: 4)
                privacyNote.reveal(order: 5)
            }
        }
        .scrollDismissesKeyboard(.interactively)
        .safeAreaInset(edge: .bottom, spacing: 0) {
            VStack(spacing: Tokens.Space.s8) {
                if saveFailed {
                    Text("profile.save_failed")
                        .typography(Tokens.Typography.caption)
                        .foregroundStyle(Tokens.Role.textAccent)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                TwoLayerButton("profile.start", icon: .arrowForward, action: create)
                    .disabled(!model.canCreate)
                    .accessibilityIdentifier("profile.start")
            }
            .padding(.horizontal, metrics.contentInsets.leading)
            .padding(.vertical, Tokens.Space.s8)
            .background(Tokens.Role.bgScreen)
            .alignedToPaperFrame()
            .reveal(order: 6)
        }
    }

    private func create() {
        nameFocused = false
        do {
            try onCreate(try model.makeProfile())
        } catch {
            saveFailed = true
        }
    }

    // MARK: Name

    private var nameField: some View {
        VStack(alignment: .leading, spacing: ScreenMetrics.fieldLabelGap) {
            // Canvas label: Phudu 18/700, the same values as the `number` role.
            Text("profile.name.label")
                .typography(Tokens.Typography.number)
                .accessibilityHidden(true) // the field carries the same label
            TextField(
                text: $model.name,
                prompt: Text("profile.name.prompt").foregroundStyle(Tokens.Role.textSecondary)
            ) {
                Text("profile.name.label")
            }
            .typography(Tokens.Typography.sentence)
            .foregroundStyle(Tokens.Role.textPrimary)
            .textInputAutocapitalization(.words)
            .autocorrectionDisabled()
            .submitLabel(.done)
            .focused($nameFocused)
            .padding(.horizontal, ScreenMetrics.fieldPaddingX)
            .frame(minHeight: ageGroup.touchTarget)
            .paperSurface(Tokens.Role.surfaceSunken, shadow: Tokens.Shadow.sunken, cornerRadius: ageGroup.radius)
            .onChange(of: model.name) { _, typed in
                let limited = ChildProfile.limitedNameInput(typed)
                if limited != typed { model.name = limited }
            }
            .accessibilityIdentifier("profile.name")
        }
    }

    // MARK: Avatar

    private var avatars: some View {
        VStack(alignment: .leading, spacing: ScreenMetrics.sectionLabelGap) {
            sectionTitle("profile.avatar.label")
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible(), spacing: ScreenMetrics.avatarGap), count: 3),
                spacing: ScreenMetrics.avatarGap
            ) {
                ForEach(AvatarChoice.allCases) { avatar in
                    let isSelected = model.avatar == avatar
                    Button {
                        nameFocused = false
                        model.avatar = avatar
                    } label: {
                        VStack(spacing: Tokens.Space.s2) {
                            AvatarArt(avatar: avatar, size: ScreenMetrics.avatarArt)
                            Text(avatar.name)
                                .typography(Tokens.Typography.caption, fixedBox: true)
                                .lineLimit(1)
                                .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                        }
                        .frame(maxWidth: .infinity, minHeight: ScreenMetrics.avatarCellHeight)
                    }
                    .buttonStyle(PaperChoiceStyle(state: isSelected ? .selected : .idle))
                    .accessibilityIdentifier("profile.avatar.\(avatar.rawValue)")
                    .overlay(alignment: .topTrailing) {
                        if isSelected { ChosenSeal() }
                    }
                }
            }
            .padding(.trailing, metrics.gridTrailingInset)
            .padding(.bottom, metrics.gridTrailingInset)
        }
    }

    // MARK: Grade and world

    private var grades: some View {
        VStack(alignment: .leading, spacing: ScreenMetrics.sectionLabelGap) {
            sectionTitle("profile.grade.label")
            HStack(spacing: ScreenMetrics.chipGap) {
                ForEach(Array(Grade.range), id: \.self) { grade in
                    Button {
                        nameFocused = false
                        model.grade = grade
                    } label: {
                        Text("profile.grade \(grade)")
                            .typography(Tokens.Typography.number, fixedBox: true)
                            .lineLimit(1)
                            .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                    }
                    .buttonStyle(PaperChipStyle(isSelected: model.grade == grade))
                    .accessibilityIdentifier("profile.grade.\(grade)")
                }
            }
            if let group = model.ageGroup {
                WorldCard(group: group)
                    .id(group)
                    .motion(Tokens.Motion.Preset.pop)
            }
        }
    }

    // MARK: Voice

    private var voices: some View {
        VStack(alignment: .leading, spacing: ScreenMetrics.sectionLabelGap) {
            sectionTitle("profile.voice.label")
            HStack(spacing: ScreenMetrics.chipGap) {
                ForEach(VoiceMode.allCases, id: \.self) { voice in
                    Button {
                        nameFocused = false
                        model.chooseVoice(voice)
                    } label: {
                        Text(voiceTitle(voice))
                            .typography(Tokens.Typography.label, fixedBox: true)
                            .lineLimit(2)
                            .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                    }
                    .buttonStyle(PaperChipStyle(isSelected: model.voiceMode == voice))
                    .accessibilityIdentifier("profile.voice.\(voice.rawValue)")
                }
            }
            Text("profile.voice.hint")
                .typography(Tokens.Typography.caption)
                .foregroundStyle(Tokens.Role.textSecondary)
        }
    }

    private func voiceTitle(_ voice: VoiceMode) -> LocalizedStringKey {
        switch voice {
        case .en: "profile.voice.en"
        case .vi: "profile.voice.vi"
        case .both: "profile.voice.both"
        }
    }

    // MARK: Privacy

    private var privacyNote: some View {
        HStack(alignment: .top, spacing: Tokens.Space.s8) {
            PaperIconView(.shield, size: ScreenMetrics.privacyIcon, color: Tokens.Role.textSecondary)
            Text("profile.privacy")
                .typography(Tokens.Typography.caption)
                .foregroundStyle(Tokens.Role.textSecondary)
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    private func sectionTitle(_ key: LocalizedStringKey) -> some View {
        Text(key)
            .typography(Tokens.Typography.number)
            .accessibilityAddTraits(.isHeader)
    }
}

/// The learning world of the chosen grade (canvas: tag + ages + "Thế giới học của bé"). A world
/// without content says the child tries Discoverer (B18 #14).
private struct WorldCard: View {
    let group: AgeGroup
    @Environment(\.ageGroup) private var ageGroup

    var body: some View {
        HStack(spacing: Tokens.Space.s12) {
            PaperTag(Text(name), style: .cut(fill: color))
            VStack(alignment: .leading, spacing: 1) {
                Text(ages)
                    .typography(Tokens.Typography.bodyStrong)
                Text("profile.world.caption")
                    .typography(Tokens.Typography.captionS)
                    .foregroundStyle(Tokens.Role.textSecondary)
                if group.rawValue != BundledContent.world.rawValue {
                    Text("profile.world.trial")
                        .typography(Tokens.Typography.captionS)
                        .foregroundStyle(Tokens.Role.textAccent)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(ScreenMetrics.worldPadding)
        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper3, cornerRadius: ageGroup.radius)
        .accessibilityElement(children: .combine)
        .accessibilityIdentifier("profile.world")
    }

    private var name: LocalizedStringKey {
        switch group {
        case .explorer: "world.explorer"
        case .discoverer: "world.discoverer"
        case .scientist: "world.scientist"
        }
    }

    private var ages: LocalizedStringKey {
        switch group {
        case .explorer: "profile.world.explorer"
        case .discoverer: "profile.world.discoverer"
        case .scientist: "profile.world.scientist"
        }
    }

    private var color: Color {
        (Tokens.AgeGroup(rawValue: group.rawValue) ?? .discoverer).color
    }
}
