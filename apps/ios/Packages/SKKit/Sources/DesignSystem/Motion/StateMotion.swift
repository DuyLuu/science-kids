import Foundation
import SwiftUI

// `press` and `flip` are `Tokens.StateTransition`s: they animate between two states instead of
// playing on appear. With Reduce Motion on the state still changes (a held button still sits
// 3pt lower, a card still shows its back) but at once, like CSS `transition: none`.

extension Tokens.StateTransition {
    /// Animation of the main property (translate for `press`, rotation for `flip`).
    public var mainAnimation: Animation {
        let animation = easing.animation(duration: duration)
        return delay > 0 ? animation.delay(delay) : animation
    }

    /// Animation of a companion property (`press`: shadow and background colour, 160 ms).
    public func animation(for property: Property) -> Animation {
        guard let companion = also.first(where: { $0.property == property }) else { return mainAnimation }
        return companion.easing.animation(duration: companion.duration)
    }
}

extension View {
    /// `press` (CSS `.e-press:active`): moves the view down by `press.to.translateY` (3pt) while held.
    /// Use inside a `ButtonStyle` with `configuration.isPressed`.
    public func pressEffect(_ isPressed: Bool) -> some View {
        modifier(PressEffect(isPressed: isPressed))
    }

    /// Animates paper state changes (selected ring, shadow, background colour) with the `press`
    /// companion timing (160 ms ease), or at once with Reduce Motion.
    public func paperStateAnimation<V: Equatable>(value: V) -> some View {
        modifier(PaperStateAnimation(value: value))
    }
}

struct PressEffect: ViewModifier {
    let isPressed: Bool
    @ReducedMotion private var reduced

    func body(content: Content) -> some View {
        let press = Tokens.Motion.Preset.press
        let pose = isPressed ? press.to : press.from
        content
            .offset(x: pose.translateX ?? 0, y: pose.translateY ?? 0)
            .animation(MotionPolicy.animation(press.mainAnimation, reduced: reduced), value: isPressed)
    }
}

struct PaperStateAnimation<V: Equatable>: ViewModifier {
    let value: V
    @ReducedMotion private var reduced

    func body(content: Content) -> some View {
        content.animation(
            MotionPolicy.animation(Tokens.Motion.Preset.press.animation(for: .shadow), reduced: reduced),
            value: value
        )
    }
}

/// Generic pressable paper piece: the label as is, pressed down 3pt while held.
public struct PaperPressStyle: ButtonStyle {
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .contentShape(Rectangle())
            .pressEffect(configuration.isPressed)
    }
}

extension ButtonStyle where Self == PaperPressStyle {
    /// `.buttonStyle(.paperPress)`.
    public static var paperPress: PaperPressStyle { PaperPressStyle() }
}

/// A card that turns over in 3D (`flip`, Bộ thẻ, Từ vựng): `front` while `isFlipped` is false,
/// `back` after. The back is pre-rotated 180 degrees and each face hides once it faces away
/// (CSS `backface-visibility: hidden`). Reduce Motion swaps the faces at once.
public struct FlipCard<Front: View, Back: View>: View {
    private let isFlipped: Bool
    private let front: Front
    private let back: Back
    @ReducedMotion private var reduced

    public init(isFlipped: Bool, @ViewBuilder front: () -> Front, @ViewBuilder back: () -> Back) {
        self.isFlipped = isFlipped
        self.front = front()
        self.back = back()
    }

    public var body: some View {
        let flip = Tokens.Motion.Preset.flip
        let angle = (isFlipped ? flip.to.rotateY : flip.from.rotateY)?.degrees ?? 0
        FlipFaces(angle: angle, front: front, back: back)
            .animation(MotionPolicy.animation(flip.mainAnimation, reduced: reduced), value: isFlipped)
    }
}

/// The two faces of a `FlipCard`. `Animatable`, so the faces swap at the animated
/// 90 degrees, not at the moment the state flips.
private struct FlipFaces<Front: View, Back: View>: View, Animatable {
    var angle: Double
    let front: Front
    let back: Back

    nonisolated var animatableData: Double {
        get { angle }
        set { angle = newValue }
    }

    var body: some View {
        let showsBack = angle > 90
        ZStack {
            front
                .opacity(showsBack ? 0 : 1)
                .accessibilityHidden(showsBack)
            back
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .opacity(showsBack ? 1 : 0)
                .accessibilityHidden(!showsBack)
        }
        .visualEffect { [angle] content, proxy in
            // CSS `perspective: 900px` on the card's parent (Bộ thẻ, Từ vựng). SwiftUI takes the
            // perspective relative to the view's larger side.
            content.rotation3DEffect(
                .degrees(angle),
                axis: (x: 0, y: 1, z: 0),
                perspective: max(proxy.size.width, proxy.size.height) / PaperMetrics.flipPerspective
            )
        }
    }
}
