import Foundation
import os
import SwiftUI

/// Whether motion runs (`motion.rules.reduce_motion = "disable_all"`).
public enum MotionPolicy {
    /// Motion is off when the system Reduce Motion setting is on, or when the app turns it off
    /// (`reduceMotionOverride`, for an in-app setting or a test launch argument).
    public static func isReduced(system: Bool, override: Bool) -> Bool {
        system || override
    }

    /// The animation for a state change, or `nil` (change at once) when motion is reduced.
    public static func animation(_ animation: Animation, reduced: Bool) -> Animation? {
        reduced ? nil : animation
    }

    static let log = Logger(subsystem: "vn.sciencekids.designsystem", category: "motion")
}

/// Delay of a piece in the screen's single reveal, in reading order (`motion.stagger`).
public enum MotionStagger {
    /// `order` × `step`, capped at `motion.stagger.max_delay` so the last piece starts within ~0.5 s.
    public static func delay(order: Int, step: TimeInterval = Tokens.Motion.Stagger.step) -> TimeInterval {
        min(Double(max(order, 0)) * step, Tokens.Motion.Stagger.maxDelay)
    }
}

extension Tokens.KeyframeAnimation {
    /// Preset name for logs and the gallery (`lay`, `stamp`…), `custom` for any other value.
    public var presetName: String {
        let presets: [(String, Tokens.KeyframeAnimation)] = [
            ("lay", Tokens.Motion.Preset.lay), ("rise", Tokens.Motion.Preset.rise),
            ("stamp", Tokens.Motion.Preset.stamp), ("pop", Tokens.Motion.Preset.pop),
            ("fall", Tokens.Motion.Preset.fall), ("slide", Tokens.Motion.Preset.slide),
            ("grow", Tokens.Motion.Preset.grow), ("sway", Tokens.Motion.Preset.sway),
            ("nudge", Tokens.Motion.Preset.nudge), ("turn", Tokens.Motion.Preset.turn),
        ]
        return presets.first { $0.1 == self }?.0 ?? "custom"
    }
}

extension EnvironmentValues {
    /// App-level switch that turns motion off on top of the system setting (default `false`).
    /// `EnvironmentValues.accessibilityReduceMotion` is read-only, so this is how a test or an
    /// in-app setting reaches the presets.
    public var reduceMotionOverride: Bool {
        get { self[ReduceMotionOverrideKey.self] }
        set { self[ReduceMotionOverrideKey.self] = newValue }
    }

    /// Bump it to run every motion below again (gallery "Chạy lại"). Ignored when motion is reduced.
    public var motionReplayID: Int {
        get { self[MotionReplayIDKey.self] }
        set { self[MotionReplayIDKey.self] = newValue }
    }
}

private struct ReduceMotionOverrideKey: EnvironmentKey {
    static let defaultValue = false
}

private struct MotionReplayIDKey: EnvironmentKey {
    static let defaultValue = 0
}

/// Reads both Reduce Motion sources for a view.
@propertyWrapper
public struct ReducedMotion: DynamicProperty {
    @Environment(\.accessibilityReduceMotion) private var system
    @Environment(\.reduceMotionOverride) private var override

    public init() {}

    public var wrappedValue: Bool { MotionPolicy.isReduced(system: system, override: override) }
}
