import DesignSystem
import SwiftUI

/// The pack in the app did not pass its checks (SK-016): no lesson can open. Words for a parent,
/// no technical reason (that one is in the log), and "Thử lại" to read the pack again.
struct ContentErrorScreen: View {
    let onRetry: () -> Void

    var body: some View {
        PaperFrame {
            VStack(alignment: .leading, spacing: Tokens.Space.s16) {
                Spacer(minLength: 0)
                Image("ArtMascot", bundle: .main)
                    .resizable()
                    .scaledToFit()
                    .frame(width: ScreenMetrics.errorMascot, height: ScreenMetrics.errorMascot)
                    .paperDropShadow(Tokens.Shadow.dropTag)
                    .accessibilityHidden(true)
                Text("content.error.title")
                    .typography(Tokens.Typography.titleL)
                    .fixedSize(horizontal: false, vertical: true)
                    .accessibilityAddTraits(.isHeader)
                    .accessibilityIdentifier("content.error.title")
                Text("content.error.body")
                    .typography(Tokens.Typography.body)
                    .foregroundStyle(Tokens.Role.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer(minLength: 0)
                TwoLayerButton("content.error.retry", icon: .retry, action: onRetry)
                    .accessibilityIdentifier("content.error.retry")
            }
        }
    }
}
