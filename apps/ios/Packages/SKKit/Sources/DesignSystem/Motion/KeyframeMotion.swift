import Foundation
import SwiftUI

extension View {
    /// Plays a keyframe preset (`Tokens.Motion.Preset.lay`, `.stamp`, `.rise`, `.pop`, `.fall`…) once
    /// when the view appears, and again when `motionReplayID` changes. `delay` adds to the preset's
    /// own delay (use `MotionStagger.delay(order:)` for the reveal). With Reduce Motion on, the view
    /// shows its final state at once and nothing animates.
    public func motion(_ preset: Tokens.KeyframeAnimation, delay: TimeInterval = 0) -> some View {
        modifier(KeyframeMotion(animation: preset, delay: delay))
    }

    /// One piece of the screen's reveal: `lay` (by default) delayed by its place in reading order.
    /// `step` is `Tokens.Motion.Stagger.step` between blocks, `stepDense` between grid cells.
    public func reveal(
        order: Int,
        step: TimeInterval = Tokens.Motion.Stagger.step,
        preset: Tokens.KeyframeAnimation = Tokens.Motion.Preset.lay
    ) -> some View {
        motion(preset, delay: preset.stagger ? MotionStagger.delay(order: order, step: step) : 0)
    }
}

/// Drives a `Tokens.KeyframeAnimation` frame by frame with `TimelineView`, using
/// `KeyframeEvaluator` for the pose. The timeline is paused when nothing runs, and the
/// view structure never changes between states, so the content keeps its identity.
struct KeyframeMotion: ViewModifier {
    let animation: Tokens.KeyframeAnimation
    let delay: TimeInterval

    @ReducedMotion private var reduced
    @Environment(\.motionReplayID) private var replayID

    private enum Phase: Equatable {
        case pending
        case running(start: Date)
        case finished
    }

    @State private var phase = Phase.pending

    func body(content: Content) -> some View {
        TimelineView(.animation(minimumInterval: nil, paused: !isRunning)) { context in
            content.motionPose(pose(at: context.date), anchor: animation.origin)
        }
        .onAppear(perform: start)
        .onChange(of: replayID) { start() }
        .onChange(of: reduced) { _, isReduced in
            if isReduced { phase = .finished }
        }
        .task(id: phase) {
            guard case .running = phase, let total = KeyframeEvaluator.totalDuration(animation, extraDelay: delay) else {
                return
            }
            try? await Task.sleep(for: .seconds(total))
            if !Task.isCancelled { phase = .finished }
        }
    }

    private var isRunning: Bool {
        if case .running = phase, !reduced { return true }
        return false
    }

    private func start() {
        guard !reduced else {
            MotionPolicy.log.debug("skip \(animation.presetName, privacy: .public): reduce motion")
            phase = .finished
            return
        }
        MotionPolicy.log.debug("start \(animation.presetName, privacy: .public) delay \(delay, privacy: .public)")
        phase = .running(start: .now)
    }

    private func pose(at date: Date) -> MotionPose {
        if reduced { return .identity }
        switch phase {
        case .pending:
            // Before onAppear: the first frame of the run (hidden for the entry presets).
            return KeyframeEvaluator.pose(animation, elapsed: 0, extraDelay: delay)
        case .running(let start):
            return KeyframeEvaluator.pose(animation, elapsed: date.timeIntervalSince(start), extraDelay: delay)
        case .finished:
            return KeyframeEvaluator.finalPose(animation)
        }
    }
}
