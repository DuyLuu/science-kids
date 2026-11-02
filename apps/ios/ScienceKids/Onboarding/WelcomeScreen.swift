import DesignSystem
import Profiles
import SwiftUI

/// Màn 1 · Chào mừng (canvas `Discoverer-Welcome`): the parent picks the language mode.
struct WelcomeScreen: View {
    @Bindable var model: OnboardingModel
    let onNext: () -> Void
    @Environment(\.layoutMetrics) private var metrics

    var body: some View {
        PaperFrame(scrolls: true) {
            VStack(alignment: .leading, spacing: ScreenMetrics.welcomeGap) {
                header.reveal(order: 0)
                hero.reveal(order: 1)
                tagline.reveal(order: 2)
                VStack(alignment: .leading, spacing: ScreenMetrics.modeGap) {
                    Text("welcome.question")
                        .typography(Tokens.Typography.titleS)
                        .accessibilityAddTraits(.isHeader)
                        .reveal(order: 3)
                    ForEach(Array(LanguageMode.allCases.enumerated()), id: \.element) { index, mode in
                        ModeCard(mode: mode, isSelected: model.languageMode == mode) {
                            model.languageMode = mode
                        }
                        .reveal(order: 4 + index)
                    }
                }
                .padding(.trailing, metrics.gridTrailingInset)
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            TwoLayerButton("welcome.next", icon: .arrowForward, action: onNext)
                .accessibilityIdentifier("welcome.next")
                .padding(.horizontal, metrics.contentInsets.leading)
                .padding(.top, Tokens.Space.s8)
                .padding(.bottom, Tokens.Space.s8)
                .background(Tokens.Role.bgScreen)
                .alignedToPaperFrame()
                .reveal(order: 7)
        }
    }

    private var header: some View {
        HStack(spacing: ScreenMetrics.headerGap) {
            Image("ArtBrandMark")
                .resizable()
                .scaledToFit()
                .frame(width: ScreenMetrics.brandMark, height: ScreenMetrics.brandMark)
                .rotationEffect(ScreenMetrics.brandMarkTilt)
                .paperDropShadow(Tokens.Shadow.dropTag)
                .accessibilityHidden(true)
            VStack(alignment: .leading, spacing: ScreenMetrics.headerTextGap) {
                Text("welcome.brand")
                    .typography(Tokens.Typography.title)
                    .accessibilityAddTraits(.isHeader)
                Text("welcome.setup_step")
                    .typography(Tokens.Typography.caption)
                    .foregroundStyle(Tokens.Role.textSecondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            ProgressSquares(count: 2, current: 0, accessibilityLabel: Text("welcome.step_a11y"))
        }
    }

    /// Hills, sun and the mascot, scaled from the canvas's 350 × 166 to the content width (at most
    /// `illustrationMaxScale` in the iPad paper frame, SK-013).
    private var hero: some View {
        let scale = min(metrics.contentWidth / ScreenMetrics.heroSize.width, max(1, metrics.illustrationMaxScale))
        return ZStack(alignment: .topLeading) {
            Image("ArtWelcomeHills")
                .resizable()
                .frame(width: ScreenMetrics.heroSize.width * scale, height: ScreenMetrics.heroSize.height * scale)
                .paperDropShadow(Tokens.Shadow.dropTag)
            Image("ArtMascot")
                .resizable()
                .frame(width: ScreenMetrics.mascotSize * scale, height: ScreenMetrics.mascotSize * scale)
                .paperDropShadow(Tokens.Shadow.dropTag)
                .offset(x: ScreenMetrics.mascotOrigin.x * scale, y: ScreenMetrics.mascotOrigin.y * scale)
        }
        .frame(width: ScreenMetrics.heroSize.width * scale, height: ScreenMetrics.heroSize.height * scale, alignment: .topLeading)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("welcome.hero_a11y"))
        .accessibilityAddTraits(.isImage)
    }

    private var tagline: some View {
        VStack(spacing: Tokens.Space.s4) {
            Text("welcome.tagline")
                .typography(Tokens.Typography.sentence)
            Text("welcome.tagline_sub")
                .typography(Tokens.Typography.body)
                .foregroundStyle(Tokens.Role.textSecondary)
        }
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, Tokens.Space.s6)
    }
}

/// One language mode: EN/VI tile, title (badge on Song ngữ), line under it; chosen → vàng hoè
/// piece behind and a check seal.
private struct ModeCard: View {
    let mode: LanguageMode
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: Tokens.Space.s12) {
                tile
                VStack(alignment: .leading, spacing: Tokens.Space.s2) {
                    HStack(spacing: Tokens.Space.s8) {
                        Text(title)
                            .typography(Tokens.Typography.itemTitle)
                        if mode == .bilingual {
                            Text("welcome.mode.bilingual.badge")
                                .typography(PaperMetrics.markTypography, fixedBox: true)
                                .foregroundStyle(Tokens.Role.textOnAccent)
                                .padding(ScreenMetrics.badgePadding)
                                .paperSurface(Tokens.Palette.giDong, shadow: Tokens.Shadow.paper1, cornerRadius: Tokens.Radius.tag)
                        }
                    }
                    Text(detail)
                        .typography(Tokens.Typography.caption)
                        .foregroundStyle(Tokens.Role.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .multilineTextAlignment(.leading)
            }
            .padding(ScreenMetrics.modePadding)
            .frame(maxWidth: .infinity, minHeight: ScreenMetrics.modeMinHeight, alignment: .leading)
        }
        .buttonStyle(PaperChoiceStyle(state: isSelected ? .selected : .idle))
        .accessibilityIdentifier("welcome.mode.\(mode.rawValue)")
        .overlay(alignment: .topTrailing) {
            if isSelected { ChosenSeal() }
        }
    }

    /// The tile: EN over a small VI for Song ngữ, one code for the other two (Phudu).
    private var tile: some View {
        VStack(spacing: 0) {
            switch mode {
            case .bilingual:
                Text(verbatim: "EN").typography(Tokens.Typography.stamp, fixedBox: true)
                Text(verbatim: "VI").typography(PaperMetrics.markTypography, fixedBox: true)
                    .foregroundStyle(Tokens.Role.textSecondary)
            case .enFirst:
                Text(verbatim: "EN").typography(Tokens.Typography.stamp, fixedBox: true)
            case .viFirst:
                Text(verbatim: "VI").typography(Tokens.Typography.stamp, fixedBox: true)
            }
        }
        .foregroundStyle(Tokens.Role.textPrimary)
        .frame(width: ScreenMetrics.modeTile, height: ScreenMetrics.modeTile)
        .paperSurface(Tokens.Role.bgScreen, shadow: Tokens.Shadow.sunkenS, cornerRadius: Tokens.Radius.tag)
        .accessibilityHidden(true)
    }

    private var title: LocalizedStringKey {
        switch mode {
        case .bilingual: "welcome.mode.bilingual"
        case .enFirst: "welcome.mode.en_first"
        case .viFirst: "welcome.mode.vi_first"
        }
    }

    private var detail: LocalizedStringKey {
        switch mode {
        case .bilingual: "welcome.mode.bilingual.detail"
        case .enFirst: "welcome.mode.en_first.detail"
        case .viFirst: "welcome.mode.vi_first.detail"
        }
    }
}
