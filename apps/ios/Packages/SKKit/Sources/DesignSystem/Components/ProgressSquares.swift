import Foundation
import SwiftUI

/// Progress through the steps of a lesson or the questions of a quiz: one paper square per step.
/// Done steps are lá tre (`feedback_correct`, Duy 29/10) with a tick, the current one vàng hoè
/// (`state_current`), the rest giấy lõm (`surface_inactive`). With `labels`, each square sits in an equal column above its name
/// (Học: "Khởi động · Học · Chơi · Quiz"); without, the squares are packed (Quiz: 6 questions).
/// VoiceOver reads it as one element with `accessibilityLabel` ("Bước 2 trên 4: Học").
public struct ProgressSquares: View {
    public enum StepState: Sendable, Equatable {
        case done
        case current
        case upcoming

        public var fill: Color {
            switch self {
            case .done: Tokens.Role.feedbackCorrect
            case .current: Tokens.Role.stateCurrent
            case .upcoming: Tokens.Role.surfaceInactive
            }
        }
    }

    private let states: [StepState]
    private let labels: [Text]
    private let label: Text
    private let squareSize: CGFloat

    /// `current` is the 0-based index of the current step; `current >= count` means all done.
    /// `squareSize`: 22 by default; the lesson count on the Home card uses 18 (SK-011).
    public init(
        count: Int,
        current: Int,
        labels: [Text] = [],
        squareSize: CGFloat = PaperMetrics.progressSquare,
        accessibilityLabel: Text
    ) {
        self.states = (0..<max(count, 0)).map { Self.state(of: $0, current: current) }
        self.labels = labels
        self.squareSize = squareSize
        self.label = accessibilityLabel
    }

    /// Squares in given states, in order: for lessons done out of order (Home, Topic: a lesson
    /// played before the ones above it is done while they are not).
    public init(states: [StepState], squareSize: CGFloat = PaperMetrics.progressSquare, accessibilityLabel: Text) {
        self.states = states
        self.labels = []
        self.squareSize = squareSize
        self.label = accessibilityLabel
    }

    /// State of step `index` (pure, for tests and custom drawings).
    nonisolated public static func state(of index: Int, current: Int) -> StepState {
        if index < current { return .done }
        if index == current { return .current }
        return .upcoming
    }

    public var body: some View {
        Group {
            if labels.isEmpty {
                HStack(spacing: PaperMetrics.progressGap) {
                    ForEach(states.indices, id: \.self) { index in square(index) }
                }
            } else {
                HStack(spacing: 0) {
                    ForEach(states.indices, id: \.self) { index in
                        VStack(spacing: PaperMetrics.progressLabelGap) {
                            square(index)
                            if index < labels.count {
                                labels[index]
                                    .typography(Tokens.Typography.captionS, fixedBox: true)
                                    .foregroundStyle(
                                        states[index] == .current ? Tokens.Role.textPrimary : Tokens.Role.textSecondary
                                    )
                                    .lineLimit(1)
                                    .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(label)
    }

    private func square(_ index: Int) -> some View {
        let state = states[index]
        let shape = RoundedRectangle(cornerRadius: Tokens.Radius.bar, style: .continuous)
        return ZStack {
            if state == .done {
                PaperIconView(.tick, size: squareSize, color: Tokens.Role.textOnAccent)
            }
        }
        .frame(width: squareSize, height: squareSize)
        // filter paperE on the canvas squares; closest shadow token paper_2.
        .paperSurface(state.fill, shadow: Tokens.Shadow.paper2, in: shape)
        .paperStateAnimation(value: state)
    }
}
