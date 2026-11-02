import Foundation
import SwiftUI

/// Screen container for Học, Chơi, Quiz (B7.10). Reads `layoutMetrics`:
/// - compact: điệp background edge to edge, content inside the phone margins;
/// - regular: điệp background, a paper frame of `frameWidth` (≤ 600) centred with
///   `shadow.frame_sides` on its two edges, content inside the frame padding.
///
/// `scrolls: true` puts the content in a vertical `ScrollView` inside the frame (the frame and
/// its shadows stay put). The paper fibre texture of the canvas (`illustration.background_*`)
/// comes later as a baked image (content-cli assets); until then the background is flat điệp.
public struct PaperFrame<Content: View>: View {
    private let scrolls: Bool
    private let content: Content
    @Environment(\.layoutMetrics) private var metrics

    public init(scrolls: Bool = false, @ViewBuilder content: () -> Content) {
        self.scrolls = scrolls
        self.content = content()
    }

    public var body: some View {
        ZStack {
            Tokens.Role.bgScreen
                .ignoresSafeArea()
            if metrics.drawsPaperFrame {
                Tokens.Role.bgScreen
                    .frame(width: metrics.frameWidth)
                    .paperShadow(Tokens.Shadow.frameSides)
                    .ignoresSafeArea()
                    .accessibilityHidden(true)
            }
            if scrolls {
                ScrollView(.vertical) {
                    framedContent
                }
                .scrollIndicators(.hidden)
                .safeAreaInset(edge: .top, spacing: 0) {
                    // A strip of điệp under the status bar (a background reaches into the safe
                    // area), so scrolled content passes under paper, not behind the clock.
                    // Style E has no gradient fade.
                    // Regular: only as wide as the frame, so the frame's side shadows run on up.
                    Color.clear
                        .frame(width: metrics.drawsPaperFrame ? metrics.frameWidth : nil, height: 0)
                        .background(Tokens.Role.bgScreen)
                        .frame(maxWidth: .infinity)
                        .accessibilityHidden(true)
                }
            } else {
                framedContent
                    .frame(maxHeight: .infinity, alignment: .top)
            }
        }
        .foregroundStyle(Tokens.Role.textPrimary)
    }

    private var framedContent: some View {
        content
            .frame(width: metrics.contentWidth, alignment: .topLeading)
            .padding(metrics.contentInsets)
            .frame(maxWidth: .infinity)
    }
}

extension View {
    /// A bar pinned above or below a `PaperFrame` (the main button, a result sheet, SK-013): as wide
    /// as the paper frame and centred in regular width, so it lines up with the content; the whole
    /// width in compact.
    public func alignedToPaperFrame() -> some View {
        modifier(PaperFrameAligned())
    }
}

private struct PaperFrameAligned: ViewModifier {
    @Environment(\.layoutMetrics) private var metrics

    func body(content: Content) -> some View {
        content
            .frame(width: metrics.drawsPaperFrame ? metrics.frameWidth : nil)
            .frame(maxWidth: .infinity)
    }
}
