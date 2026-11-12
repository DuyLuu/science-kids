import ContentKit
import DesignSystem
import SwiftUI

/// Header of a screen (canvas Profile, Topic): optional round back button, title and caption,
/// something on the trailing side (step squares).
struct ScreenHeader<Trailing: View>: View {
    struct Back {
        let label: Text
        let action: () -> Void
    }

    let back: Back?
    let title: Text
    let caption: Text?
    let titleIdentifier: String?
    @ViewBuilder let trailing: Trailing

    init(
        back: Back? = nil,
        title: Text,
        caption: Text? = nil,
        titleIdentifier: String? = nil,
        @ViewBuilder trailing: () -> Trailing = { EmptyView() }
    ) {
        self.back = back
        self.title = title
        self.caption = caption
        self.titleIdentifier = titleIdentifier
        self.trailing = trailing()
    }

    var body: some View {
        HStack(spacing: ScreenMetrics.headerGap) {
            if let back {
                PaperIconButton(.arrowBack, accessibilityLabel: back.label, action: back.action)
                    .accessibilityIdentifier("header.back")
            }
            VStack(alignment: .leading, spacing: ScreenMetrics.headerTextGap) {
                title
                    .typography(Tokens.Typography.title)
                    .fixedSize(horizontal: false, vertical: true)
                    .accessibilityAddTraits(.isHeader)
                    .accessibilityIdentifier(titleIdentifier ?? "header.title")
                if let caption {
                    caption
                        .typography(Tokens.Typography.caption)
                        .foregroundStyle(Tokens.Role.textSecondary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            trailing
        }
    }
}

/// A chip of the profile screen ("Lớp 3", "Chỉ tiếng Anh"): a flat slip (`radius.tag`), vàng hoè
/// when chosen, bright paper otherwise, pressed down while held. At least the touch target tall
/// (the canvas draws the grade chips 48pt; SK-011 raises them to 56).
struct PaperChipStyle: ButtonStyle {
    let isSelected: Bool
    @Environment(\.ageGroup) private var ageGroup

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(Tokens.Role.textPrimary)
            .multilineTextAlignment(.center)
            .padding(.horizontal, Tokens.Space.s4)
            .frame(maxWidth: .infinity, minHeight: ageGroup.touchTarget)
            .paperSurface(
                isSelected ? Tokens.Role.stateSelected : Tokens.Role.surfacePaper,
                shadow: Tokens.Shadow.paper2,
                cornerRadius: Tokens.Radius.tag
            )
            .contentShape(Rectangle())
            .pressEffect(configuration.isPressed)
            .paperStateAnimation(value: isSelected)
            .accessibilityAddTraits(isSelected ? .isSelected : [])
    }
}

/// The check seal on a chosen card (canvas: `top: -8px; right: -6px`), stamped in.
struct ChosenSeal: View {
    var body: some View {
        Seal(icon: .check)
            .offset(x: ScreenMetrics.sealOffset.width, y: ScreenMetrics.sealOffset.height)
            .allowsHitTesting(false)
    }
}

/// `ProgressSquares` of a topic's written lessons that never runs past its width (SK-030: a topic
/// has up to 19 lessons): the squares at the first of `sizes` that fits, else none. Put the count
/// in words next to it (the Topic and Home captions do), since the squares may not show.
///
/// 10/11: one square per lesson the child can play, done (lá tre, tick), the "Học tiếp" one
/// (vàng hoè) or still to do (`JourneyStop.squareStates`), so a lesson done out of order shows.
struct LessonSquares: View {
    let states: [ProgressSquares.StepState]
    /// Square sizes to try, largest first (`PaperMetrics.progressSquare`, `.progressSquareSmall`).
    let sizes: [CGFloat]
    let accessibilityLabel: Text

    var body: some View {
        ViewThatFits(in: .horizontal) {
            ForEach(sizes, id: \.self) { size in
                ProgressSquares(states: states, squareSize: size, accessibilityLabel: accessibilityLabel)
            }
            Color.clear
                .frame(width: 0, height: 0)
                .accessibilityHidden(true)
        }
    }
}

extension JourneyStop {
    /// The squares of the topic's written lessons, in order: done, the topic's "Học tiếp" lesson
    /// (`next`), or still to do.
    var squareStates: [ProgressSquares.StepState] {
        zip(topic.lessons, lessonStates).compactMap { lesson, state in
            guard lesson.lesson != nil else { return nil }
            if case .done = state { return .done }
            return lesson.number == next?.number ? .current : .upcoming
        }
    }
}

/// Best stars of a lesson done (Topic rows): three small paper stars, vàng hoè for each earned,
/// giấy lõm for the rest (the Reward screen's stars, small). Decorative: the row reads the count.
struct LessonStars: View {
    let count: Int

    var body: some View {
        HStack(spacing: Tokens.Space.s2) {
            ForEach(0..<3, id: \.self) { index in
                PaperIconView(
                    .star, size: ScreenMetrics.lessonStar,
                    color: index < count ? Tokens.Role.stateCurrent : Tokens.Role.surfaceInactive
                )
            }
        }
        .accessibilityHidden(true)
    }
}

/// The small "done" seal (lá tre tick) on a journey stop or a lesson's number tile. Not stamped
/// in (a list of them would all stamp at once); decorative, the row says "Đã xong".
struct DoneSeal: View {
    var body: some View {
        Seal(icon: .check, tone: .correct, animated: false)
            .allowsHitTesting(false)
    }
}
