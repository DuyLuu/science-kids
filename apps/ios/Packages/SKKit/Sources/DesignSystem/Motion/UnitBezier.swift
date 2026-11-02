import Foundation
import SwiftUI

/// A CSS `cubic-bezier(x1, y1, x2, y2)` timing function, solved the way browsers do
/// (WebKit `UnitBezier`: Newton steps, then bisection). Pure and deterministic, so the
/// eased value of a motion segment can be unit-tested against the canvas CSS.
public struct UnitBezier: Sendable, Equatable {
    private let cx: Double
    private let bx: Double
    private let ax: Double
    private let cy: Double
    private let by: Double
    private let ay: Double

    public init(_ curve: Tokens.CubicBezier) {
        cx = 3 * curve.x1
        bx = 3 * (curve.x2 - curve.x1) - cx
        ax = 1 - cx - bx
        cy = 3 * curve.y1
        by = 3 * (curve.y2 - curve.y1) - cy
        ay = 1 - cy - by
    }

    /// Eased progress for linear progress `x` in 0...1. Inputs outside 0...1 are clamped;
    /// the output may leave 0...1 when a control point does (`pop` overshoots with y1 = 1.2).
    public func value(at x: Double) -> Double {
        if x <= 0 { return 0 }
        if x >= 1 { return 1 }
        return sampleY(solveX(x))
    }

    private func sampleX(_ t: Double) -> Double { ((ax * t + bx) * t + cx) * t }
    private func sampleY(_ t: Double) -> Double { ((ay * t + by) * t + cy) * t }
    private func slopeX(_ t: Double) -> Double { (3 * ax * t + 2 * bx) * t + cx }

    private func solveX(_ x: Double) -> Double {
        let epsilon = 1e-7
        var t = x
        for _ in 0..<8 {
            let error = sampleX(t) - x
            if abs(error) < epsilon { return t }
            let slope = slopeX(t)
            if abs(slope) < 1e-6 { break }
            t -= error / slope
        }
        var low = 0.0
        var high = 1.0
        t = x
        for _ in 0..<64 {
            let value = sampleX(t)
            if abs(value - x) < epsilon { return t }
            if x > value { low = t } else { high = t }
            t = (low + high) / 2
        }
        return t
    }
}

extension Tokens.CubicBezier {
    /// The same curve as a SwiftUI animation.
    public func animation(duration: TimeInterval) -> Animation {
        .timingCurve(x1, y1, x2, y2, duration: duration)
    }
}

