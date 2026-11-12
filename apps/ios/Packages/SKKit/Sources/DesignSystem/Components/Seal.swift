import Foundation
import SwiftUI

/// Seal (triện) stamped on a correct answer or a marked item: paper tilted `shape.tilt_stamp`
/// (−8°), `shadow.stamp`, shown with the `stamp` preset. Its tone says what it means (Duy 29/10,
/// SK-006): `.correct` (lá tre, `role.feedback_correct`) for "ĐÚNG" and, since Duy 10/11 (SK-034),
/// for a lesson or topic done; `.mark` (đỏ son, `role.stamp_mark`) for every seal that only marks
/// something (seen, on the tray, chosen).
///
/// ```swift
/// Seal("ĐÚNG", tone: .correct)                        // large; VoiceOver reads its word
/// Seal(icon: .check, accessibilityLabel: Text("learn.seen"))   // small "Đã xem", đỏ son
/// Seal("ĐÚNG", tone: .correct, delay: 0.26)           // later in a reveal
/// ```
public struct Seal: View {
    /// What the seal says: right, or just marked.
    public enum Tone: Sendable, CaseIterable {
        /// A right answer: `role.feedback_correct` (lá tre).
        case correct
        /// Seen, put on the tray, chosen: `role.stamp_mark` (đỏ son).
        case mark

        var fill: Color {
            switch self {
            case .correct: Tokens.Role.feedbackCorrect
            case .mark: Tokens.Role.stampMark
            }
        }
    }

    public enum Size: Sendable, CaseIterable {
        /// 52 × 52, word in `typography.stamp` ("ĐÚNG").
        case large
        /// 22 × 22, check icon ("Đã xem", item in the tray).
        case small
        /// 28 × 28, check icon 17: a topic done on the journey map (SK-034).
        case medium

        var side: CGFloat {
            switch self {
            case .large: PaperMetrics.sealLarge
            case .small: PaperMetrics.sealSmall
            case .medium: PaperMetrics.sealMedium
            }
        }

        var glyph: CGFloat {
            switch self {
            case .large: PaperMetrics.iconSize
            case .small: PaperMetrics.sealSmallGlyph
            case .medium: PaperMetrics.sealMediumGlyph
            }
        }
    }

    private enum Mark {
        case text(Text)
        case icon(PaperIcon)
    }

    private let mark: Mark
    private let size: Size
    private let tone: Tone
    private let label: Text?
    private let animated: Bool
    private let delay: TimeInterval

    /// A word seal. Text from the content or the string catalog, already upper case (canvas).
    public init(
        _ text: Text,
        size: Size = .large,
        tone: Tone = .mark,
        accessibilityLabel: Text? = nil,
        animated: Bool = true,
        delay: TimeInterval = 0
    ) {
        self.mark = .text(text)
        self.size = size
        self.tone = tone
        self.label = accessibilityLabel
        self.animated = animated
        self.delay = delay
    }

    public init<S: StringProtocol>(
        _ text: S,
        size: Size = .large,
        tone: Tone = .mark,
        accessibilityLabel: Text? = nil,
        animated: Bool = true,
        delay: TimeInterval = 0
    ) {
        self.init(Text(text), size: size, tone: tone, accessibilityLabel: accessibilityLabel, animated: animated, delay: delay)
    }

    /// An icon seal (small by default).
    public init(
        icon: PaperIcon,
        size: Size = .small,
        tone: Tone = .mark,
        accessibilityLabel: Text? = nil,
        animated: Bool = true,
        delay: TimeInterval = 0
    ) {
        self.mark = .icon(icon)
        self.size = size
        self.tone = tone
        self.label = accessibilityLabel
        self.animated = animated
        self.delay = delay
    }

    public var body: some View {
        let shape = RoundedRectangle(cornerRadius: Tokens.Radius.tag, style: .continuous)
        content
            .foregroundStyle(Tokens.Role.textOnAccent)
            .frame(width: size.side, height: size.side)
            .paperSurface(tone.fill, shadow: Tokens.Shadow.stamp, in: shape)
            .rotationEffect(Tokens.Shape.tiltStamp)
            .modifier(OptionalMotion(preset: animated ? Tokens.Motion.Preset.stamp : nil, delay: delay))
            .accessibilityElement(children: .ignore)
            .modifier(SealAccessibility(label: label ?? wordLabel))
    }

    /// A word seal reads its word unless given another label; an icon seal needs a label.
    private var wordLabel: Text? {
        if case .text(let text) = mark { return text }
        return nil
    }

    @ViewBuilder private var content: some View {
        switch mark {
        case .text(let text):
            text
                .typography(Tokens.Typography.stamp, fixedBox: true)
                .lineLimit(1)
                .minimumScaleFactor(PaperMetrics.sealMinimumScale)
        case .icon(let icon):
            PaperIconView(icon, size: size.glyph, color: Tokens.Role.textOnAccent)
        }
    }
}

/// An icon seal without a label is decorative. To hide a word seal whose text repeats a nearby
/// title ("ĐÚNG" next to "Chính xác!"), add `.accessibilityHidden(true)` where it is used.
private struct SealAccessibility: ViewModifier {
    let label: Text?

    func body(content: Content) -> some View {
        if let label {
            content.accessibilityLabel(label).accessibilityAddTraits(.isImage)
        } else {
            content.accessibilityHidden(true)
        }
    }
}

/// Applies `motion` only when a preset is given.
struct OptionalMotion: ViewModifier {
    let preset: Tokens.KeyframeAnimation?
    let delay: TimeInterval

    func body(content: Content) -> some View {
        if let preset {
            content.motion(preset, delay: delay)
        } else {
            content
        }
    }
}
