import Foundation
import SwiftUI

/// Every transform a motion preset can set, fully resolved (no `nil`).
/// `identity` is the element's own style: what CSS shows with `animation: none`.
public struct MotionPose: Sendable, Equatable {
    public var opacity: Double = 1
    public var translateX: CGFloat = 0
    public var translateY: CGFloat = 0
    /// Percent of the element's own height (`rise`).
    public var translateYPercent: CGFloat = 0
    public var scaleX: CGFloat = 1
    public var scaleY: CGFloat = 1
    /// Degrees.
    public var rotate: Double = 0
    /// Degrees, around the y axis.
    public var rotateY: Double = 0

    public init() {}

    public static let identity = MotionPose()
}

/// Turns a `Tokens.KeyframeAnimation` into a pose at a point in time, following the CSS rules
/// the canvas uses (README "Cách đọc tokens.json", `keyframeAnimation`):
/// - a property missing from a keyframe is interpolated between the nearest keyframes that set it;
///   a property no keyframe sets at offset 0 or 1 uses the element's own value there;
/// - the easing applies to each segment between two keyframes of that property, not to the whole run;
/// - `fillMode` decides what shows during the delay and after the end.
public enum KeyframeEvaluator {
    /// Pose at linear progress `progress` (0...1) of one iteration.
    public static func pose(_ animation: Tokens.KeyframeAnimation, progress: Double) -> MotionPose {
        let curve = UnitBezier(animation.easing)
        var pose = MotionPose.identity
        for property in Property.allCases {
            let value = property.value(in: animation.keyframes, at: progress, curve: curve)
            property.set(value, on: &pose)
        }
        return pose
    }

    /// Pose `elapsed` seconds after the motion was started. The real delay is the preset's
    /// `delay` plus `extraDelay` (the stagger of this element).
    public static func pose(
        _ animation: Tokens.KeyframeAnimation,
        elapsed: TimeInterval,
        extraDelay: TimeInterval = 0
    ) -> MotionPose {
        let local = elapsed - animation.delay - extraDelay
        let fillsBackwards = animation.fillMode == .backwards || animation.fillMode == .both
        let fillsForwards = animation.fillMode == .forwards || animation.fillMode == .both
        if local < 0 {
            return fillsBackwards ? pose(animation, progress: 0) : .identity
        }
        guard animation.duration > 0 else {
            return fillsForwards ? pose(animation, progress: 1) : .identity
        }
        let iterations = local / animation.duration
        if animation.repeats {
            return pose(animation, progress: iterations.truncatingRemainder(dividingBy: 1))
        }
        if iterations >= 1 {
            return fillsForwards ? pose(animation, progress: 1) : .identity
        }
        return pose(animation, progress: iterations)
    }

    /// Seconds from start until the motion is over (delay included); `nil` for a looping preset.
    public static func totalDuration(_ animation: Tokens.KeyframeAnimation, extraDelay: TimeInterval = 0) -> TimeInterval? {
        animation.repeats ? nil : animation.delay + extraDelay + animation.duration
    }

    /// The pose a finished (or skipped) motion leaves on screen.
    public static func finalPose(_ animation: Tokens.KeyframeAnimation) -> MotionPose {
        let fillsForwards = animation.fillMode == .forwards || animation.fillMode == .both
        return fillsForwards && !animation.repeats ? pose(animation, progress: 1) : .identity
    }

    // MARK: - One animated property

    enum Property: CaseIterable {
        case opacity, translateX, translateY, translateYPercent, scaleX, scaleY, rotate, rotateY

        /// Value this keyframe sets, `nil` when it leaves the property out.
        func value(of pose: Tokens.Pose) -> Double? {
            switch self {
            case .opacity: pose.opacity
            case .translateX: pose.translateX.map(Double.init)
            case .translateY: pose.translateY.map(Double.init)
            case .translateYPercent: pose.translateYPercent.map(Double.init)
            // CSS `scale: s` sets both axes; `scale: sx sy` sets each one.
            case .scaleX: (pose.scaleX ?? pose.scale).map(Double.init)
            case .scaleY: (pose.scaleY ?? pose.scale).map(Double.init)
            case .rotate: pose.rotate?.degrees
            case .rotateY: pose.rotateY?.degrees
            }
        }

        /// The element's own value, used where no keyframe sets the property.
        var neutral: Double {
            switch self {
            case .opacity, .scaleX, .scaleY: 1
            case .translateX, .translateY, .translateYPercent, .rotate, .rotateY: 0
            }
        }

        func set(_ value: Double, on pose: inout MotionPose) {
            switch self {
            case .opacity: pose.opacity = value
            case .translateX: pose.translateX = CGFloat(value)
            case .translateY: pose.translateY = CGFloat(value)
            case .translateYPercent: pose.translateYPercent = CGFloat(value)
            case .scaleX: pose.scaleX = CGFloat(value)
            case .scaleY: pose.scaleY = CGFloat(value)
            case .rotate: pose.rotate = value
            case .rotateY: pose.rotateY = value
            }
        }

        func value(in keyframes: [Tokens.Keyframe], at progress: Double, curve: UnitBezier) -> Double {
            var stops = keyframes
                .compactMap { frame in value(of: frame.pose).map { (offset: frame.offset, value: $0) } }
                .sorted { $0.offset < $1.offset }
            guard !stops.isEmpty else { return neutral }
            if stops[0].offset > 0 { stops.insert((offset: 0, value: neutral), at: 0) }
            if stops[stops.count - 1].offset < 1 { stops.append((offset: 1, value: neutral)) }

            let p = min(max(progress, 0), 1)
            for index in 0..<(stops.count - 1) {
                let start = stops[index]
                let end = stops[index + 1]
                guard p <= end.offset else { continue }
                let span = end.offset - start.offset
                guard span > 0 else { return end.value }
                let eased = curve.value(at: (p - start.offset) / span)
                return start.value + (end.value - start.value) * eased
            }
            return stops[stops.count - 1].value
        }
    }
}

extension View {
    /// Applies a resolved pose in the CSS order of the individual transform properties:
    /// scale, then rotate, then translate (outermost), around `anchor`.
    func motionPose(_ pose: MotionPose, anchor: UnitPoint) -> some View {
        self
            .scaleEffect(x: pose.scaleX, y: pose.scaleY, anchor: anchor)
            .rotationEffect(.degrees(pose.rotate), anchor: anchor)
            .rotation3DEffect(.degrees(pose.rotateY), axis: (x: 0, y: 1, z: 0), anchor: anchor)
            .offset(x: pose.translateX, y: pose.translateY)
            .visualEffect { content, proxy in
                content.offset(y: proxy.size.height * pose.translateYPercent / 100)
            }
            .opacity(pose.opacity)
    }
}
