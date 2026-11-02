import ContentModel
import DesignSystem
import SwiftUI

/// The six ready-made avatars of the profile screen (canvas Discoverer 2). The id is what the
/// profile stores (`child_profiles.avatar`); the art is an SVG in `Assets.xcassets/Art`.
enum AvatarChoice: String, CaseIterable, Identifiable, Sendable {
    case ca
    case ech
    case ga
    case meo
    case chim
    case trau

    var id: String { rawValue }

    /// `AvatarCa`, `AvatarEch`…
    var imageName: String { "Avatar" + rawValue.prefix(1).uppercased() + rawValue.dropFirst() }

    var name: LocalizedStringKey { LocalizedStringKey("avatar." + rawValue) }

    /// The avatar of a stored id; an unknown id (newer app, server) shows the frog.
    static func of(_ id: String) -> AvatarChoice { AvatarChoice(rawValue: id) ?? .ech }
}

/// An avatar's paper-cut art with the paper drop shadow (canvas `filter: paperE`). Decorative
/// unless given a label (the button or cell around it usually carries the name).
struct AvatarArt: View {
    let avatar: AvatarChoice
    let size: CGFloat
    var accessibilityLabel: Text?

    var body: some View {
        let art = Image(avatar.imageName)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .paperDropShadow(Tokens.Shadow.dropTag)
        if let accessibilityLabel {
            art
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
                .accessibilityAddTraits(.isImage)
        } else {
            art.accessibilityHidden(true)
        }
    }
}

/// Glyph of a topic on the journey and in the topic art. The schema has no topic image yet, so
/// the glyph follows the strand: the bowl of the canvas for `humans_health`, three dots for the
/// rest until there is art (proposal in SK-011: `topic.image`).
struct TopicGlyph: View {
    let strand: Topic.Strand
    let size: CGSize

    var body: some View {
        Group {
            if strand == .humansHealth {
                Image("ArtTopicBowl")
                    .resizable()
                    .scaledToFit()
                    .paperDropShadow(Tokens.Shadow.paper1)
            } else {
                PaperIconView(.more, size: min(size.width, size.height), color: Tokens.Role.textSecondary)
            }
        }
        .frame(width: size.width, height: size.height)
        .accessibilityHidden(true)
    }
}

/// Stand-in for a topic's illustration (Home card, Topic hero) until topics have art: a paper
/// plate (chàm rim, paper, sunken centre) with the topic glyph. Canvas plate: `r 110 / 101 / 72`
/// in a 240 box.
struct TopicPlate: View {
    let strand: Topic.Strand
    let size: CGFloat

    var body: some View {
        let disc = size * 220 / 240
        ZStack {
            Circle().fill(Tokens.Palette.cham)
                .frame(width: disc, height: disc)
            Circle().fill(Tokens.Role.surfacePaper)
                .frame(width: disc * 101 / 110, height: disc * 101 / 110)
            Circle().fill(Tokens.Role.surfaceSunken)
                .frame(width: disc * 72 / 110, height: disc * 72 / 110)
            TopicGlyph(strand: strand, size: CGSize(width: disc * 0.5, height: disc * 0.44))
        }
        .frame(width: size, height: size)
        .paperDropShadow(Tokens.Shadow.paper2)
        .accessibilityHidden(true)
    }
}
