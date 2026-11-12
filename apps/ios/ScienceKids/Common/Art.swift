import ContentModel
import DesignSystem
import SwiftUI
import UIKit

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

/// SK-034: the designer's icon of each syllabus topic (`design/icons/topics/<key>.svg`, 45 icons),
/// in the asset catalog as `Topic-<key>` (`scripts/import-topic-icons.sh`). A topic with no icon
/// (one only the content has) takes the icon of a topic of its strand; an unknown strand has none.
enum TopicIcon {
    /// Asset name of a topic's own icon.
    static func assetName(key: String) -> String { "Topic-" + key }

    /// Icon of each strand, for a topic without its own: a topic of that strand everyone knows.
    static let strandIcons: [String: String] = [
        Topic.Strand.plantsAnimals.rawValue: "growing-plants",
        Topic.Strand.livingEnvironment.rawValue: "living-things-and-the-environment",
        Topic.Strand.humansHealth.rawValue: "healthy-eating",
        Topic.Strand.materials.rawValue: "everyday-materials",
        Topic.Strand.energyForces.rawValue: "simple-forces-including-magnets",
        Topic.Strand.earthSky.rawValue: "earth-sun-and-moon",
    ]

    /// The asset to draw for a topic: its own icon when the catalog has it, else its strand's;
    /// `nil` when neither exists (`exists` looks the name up, the catalog by default).
    static func name(key: String, strand: Topic.Strand, exists: (String) -> Bool = TopicIcon.inCatalog) -> String? {
        let own = assetName(key: key)
        if exists(own) { return own }
        if let fallback = strandIcons[strand.rawValue].map(assetName(key:)), exists(fallback) { return fallback }
        return nil
    }

    /// The app's asset catalog has an image of that name.
    static func inCatalog(_ name: String) -> Bool {
        UIImage(named: name) != nil
    }
}

/// Icon of a topic (SK-034): the designer's paper-cut icon of the topic (`TopicIcon`) on
/// `shadow.paper_1`, fitted in a square of `size`. Decorative: the row or button around it carries
/// the label. `muted`: grey and faint, on a topic with nothing written ("Sắp có", spec 3).
struct TopicGlyph: View {
    let key: String
    let strand: Topic.Strand
    let size: CGFloat
    var muted = false

    var body: some View {
        Group {
            if let name = TopicIcon.name(key: key, strand: strand) {
                Image(name)
                    .resizable()
                    .scaledToFit()
                    .paperDropShadow(Tokens.Shadow.paper1)
            } else {
                PaperIconView(.more, size: size, color: Tokens.Role.textSecondary)
            }
        }
        .frame(width: size, height: size)
        .grayscale(muted ? 1 : 0)
        .opacity(muted ? ScreenMetrics.mutedIconOpacity : 1)
        .accessibilityHidden(true)
    }
}

/// A topic's illustration on the Home card and the Topic hero: a paper plate (chàm rim, paper,
/// sunken centre) with the topic's icon at 0.53 of the plate (SK-034 spec 8). Canvas plate:
/// `r 110 / 101 / 72` in a 240 box.
struct TopicPlate: View {
    let key: String
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
            TopicGlyph(key: key, strand: strand, size: disc * ScreenMetrics.plateIconShare)
        }
        .frame(width: size, height: size)
        .paperDropShadow(Tokens.Shadow.paper2)
        .accessibilityHidden(true)
    }
}
