import SwiftUI
import Testing
@testable import DesignSystem

/// SK-008: motion presets follow the canvas CSS (`@keyframes e*`, `.e-*` classes).
@MainActor
struct MotionTests {
    private typealias Preset = Tokens.Motion.Preset

    // MARK: - cubic-bezier

    @Test("cubic-bezier solves like the browser")
    func bezier() {
        let ease = UnitBezier(Tokens.CubicBezier(0.25, 0.1, 0.25, 1))
        #expect(ease.value(at: 0) == 0)
        #expect(ease.value(at: 1) == 1)
        // CSS `ease` at 50 % is 0.8024 (WebKit UnitBezier).
        #expect(abs(ease.value(at: 0.5) - 0.8024) < 0.001)
        let linear = UnitBezier(Tokens.CubicBezier(0, 0, 1, 1))
        for x in stride(from: 0.0, through: 1.0, by: 0.1) {
            #expect(abs(linear.value(at: x) - x) < 1e-6)
        }
        // `pop` overshoots (y1 = 1.2), so the curve goes above 1 before settling.
        let pop = UnitBezier(Preset.pop.easing)
        #expect((0..<100).map { pop.value(at: Double($0) / 100) }.max()! > 1)
        // Monotonic in x for the lay curve.
        let lay = UnitBezier(Preset.lay.easing)
        let samples = (0...50).map { lay.value(at: Double($0) / 50) }
        #expect(zip(samples, samples.dropFirst()).allSatisfy { $0 <= $1 + 1e-9 })
    }

    // MARK: - Keyframes

    @Test("lay: hidden, 12pt up and 103 % at the start; identity at the end")
    func lay() {
        let start = KeyframeEvaluator.pose(Preset.lay, progress: 0)
        #expect(start.opacity == 0)
        #expect(start.translateY == -12)
        #expect(start.scaleX == 1.03 && start.scaleY == 1.03)
        #expect(KeyframeEvaluator.pose(Preset.lay, progress: 1) == .identity)
        let mid = KeyframeEvaluator.pose(Preset.lay, progress: 0.5)
        let eased = UnitBezier(Preset.lay.easing).value(at: 0.5)
        #expect(abs(mid.opacity - eased) < 1e-9)
        #expect(abs(Double(mid.translateY) - (-12 + 12 * eased)) < 1e-9)
    }

    @Test("stamp: a property missing from a keyframe is interpolated between the keyframes that set it")
    func stampSparseKeyframes() {
        // opacity is set at 0, 0.55 and 1 only; at 0.78 (where only scale is set) it is 1.
        #expect(KeyframeEvaluator.pose(Preset.stamp, progress: 0.78).opacity == 1)
        #expect(KeyframeEvaluator.pose(Preset.stamp, progress: 0.78).scaleX == 1.06)
        #expect(KeyframeEvaluator.pose(Preset.stamp, progress: 0.55).scaleX == 0.9)
        #expect(KeyframeEvaluator.pose(Preset.stamp, progress: 0).scaleX == 1.7)
        // The easing applies per segment: halfway between 0.55 and 0.78 uses the curve at 0.5.
        let eased = UnitBezier(Preset.stamp.easing).value(at: 0.5)
        let scale = KeyframeEvaluator.pose(Preset.stamp, progress: (0.55 + 0.78) / 2).scaleX
        #expect(abs(Double(scale) - (0.9 + (1.06 - 0.9) * eased)) < 1e-6)
    }

    @Test("fall: opacity reaches 1 at 15 % while translate and rotate run the whole way")
    func fall() {
        let at15 = KeyframeEvaluator.pose(Preset.fall, progress: 0.15)
        #expect(at15.opacity == 1)
        #expect(at15.translateY < 0 && at15.translateY > -70)
        #expect(at15.rotate < 0 && at15.rotate > -50)
        #expect(KeyframeEvaluator.pose(Preset.fall, progress: 1) == .identity)
    }

    @Test("pop, rise, grow, flip and press keep their CSS values")
    func otherPresets() {
        #expect(KeyframeEvaluator.pose(Preset.pop, progress: 0).scaleX == 0.4)
        #expect(KeyframeEvaluator.pose(Preset.pop, progress: 0.7).scaleX == 1.12)
        #expect(KeyframeEvaluator.pose(Preset.rise, progress: 0).translateYPercent == 105)
        #expect(KeyframeEvaluator.pose(Preset.rise, progress: 0).opacity == 1, "rise does not fade")
        let grow = KeyframeEvaluator.pose(Preset.grow, progress: 0)
        #expect(grow.scaleY == 0 && grow.scaleX == 1)
        #expect(Preset.press.to.translateY == 3)
        #expect(Preset.press.mainAnimation == Tokens.CubicBezier(0.25, 0.1, 0.25, 1).animation(duration: 0.12))
        #expect(Preset.press.animation(for: .shadow) == Tokens.CubicBezier(0.25, 0.1, 0.25, 1).animation(duration: 0.16))
        #expect(Preset.flip.to.rotateY == .degrees(180))
    }

    @Test("Delay and fill mode: backwards shows the first frame while waiting, then plays, then holds the end")
    func timeline() {
        let delay = 0.2
        #expect(KeyframeEvaluator.pose(Preset.lay, elapsed: 0, extraDelay: delay).opacity == 0)
        #expect(KeyframeEvaluator.pose(Preset.lay, elapsed: 0.19, extraDelay: delay).opacity == 0)
        let running = KeyframeEvaluator.pose(Preset.lay, elapsed: delay + 0.23, extraDelay: delay).opacity
        #expect(running > 0 && running < 1)
        #expect(KeyframeEvaluator.pose(Preset.lay, elapsed: delay + 0.46, extraDelay: delay) == .identity)
        #expect(KeyframeEvaluator.pose(Preset.lay, elapsed: 10, extraDelay: delay) == .identity)
        #expect(KeyframeEvaluator.totalDuration(Preset.lay, extraDelay: delay) == delay + 0.46)
        // Looping presets never end and have no backwards fill.
        #expect(KeyframeEvaluator.totalDuration(Preset.sway) == nil)
        #expect(KeyframeEvaluator.pose(Preset.nudge, elapsed: 0.5) == .identity)
        let swayStart = KeyframeEvaluator.pose(Preset.sway, elapsed: 0).rotate
        let swayLater = KeyframeEvaluator.pose(Preset.sway, elapsed: Preset.sway.duration).rotate
        #expect(abs(swayStart - swayLater) < 1e-9, "one loop later, same pose")
    }

    @Test("Every entry preset ends at the element's own style, which is what Reduce Motion shows at once")
    func reducedMotionShowsFinalState() {
        for preset in [Preset.lay, Preset.rise, Preset.stamp, Preset.pop, Preset.fall, Preset.slide, Preset.grow, Preset.turn] {
            #expect(KeyframeEvaluator.pose(preset, progress: 1) == .identity, "\(preset.presetName)")
            #expect(KeyframeEvaluator.finalPose(preset) == .identity, "\(preset.presetName)")
        }
    }

    // MARK: - Policy

    @Test("Reduce Motion: system setting or app switch turns motion off; state changes are instant")
    func policy() {
        #expect(!MotionPolicy.isReduced(system: false, override: false))
        #expect(MotionPolicy.isReduced(system: true, override: false))
        #expect(MotionPolicy.isReduced(system: false, override: true))
        #expect(MotionPolicy.isReduced(system: true, override: true))
        #expect(MotionPolicy.animation(Preset.press.mainAnimation, reduced: true) == nil)
        #expect(MotionPolicy.animation(Preset.press.mainAnimation, reduced: false) == Preset.press.mainAnimation)
        #expect(Tokens.Motion.Rules.reduceMotion == "disable_all")
        #expect(Tokens.Motion.Rules.wrongAnswerShake == false)
        #expect(EnvironmentValues().reduceMotionOverride == false)
    }

    @Test("Stagger: reading order × step, capped so the last piece starts by 0.5 s")
    func stagger() {
        #expect(MotionStagger.delay(order: 0) == 0)
        #expect(abs(MotionStagger.delay(order: 3) - 0.18) < 1e-9)
        #expect(abs(MotionStagger.delay(order: 4, step: Tokens.Motion.Stagger.stepDense) - 0.16) < 1e-9)
        #expect(MotionStagger.delay(order: 50) == Tokens.Motion.Stagger.maxDelay)
        #expect(MotionStagger.delay(order: -1) == 0)
    }

    @Test("Preset names for logs")
    func names() {
        #expect(Preset.lay.presetName == "lay")
        #expect(Preset.stamp.presetName == "stamp")
        #expect(Preset.fall.presetName == "fall")
    }
}
