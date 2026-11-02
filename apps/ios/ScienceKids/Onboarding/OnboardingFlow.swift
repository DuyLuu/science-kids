import DesignSystem
import Profiles
import SwiftUI

/// First launch (B7.6): Welcome → Profile. Creating the profile hands it to `onCreate`, which
/// saves it; the root then shows Home and this flow goes away (no way back to Welcome).
/// Both screens are phone layouts; on iPad (regular width) they sit in the 600pt paper frame of
/// `PaperFrame`, centred (SK-013, B7.10: no layout of their own).
struct OnboardingFlow: View {
    let model: OnboardingModel
    let onCreate: (ChildProfile) throws -> Void

    @State private var path: [Step] = []

    enum Step: Hashable {
        case profile
    }

    var body: some View {
        NavigationStack(path: $path) {
            WelcomeScreen(model: model) { path.append(.profile) }
                .toolbar(.hidden, for: .navigationBar)
                .navigationDestination(for: Step.self) { _ in
                    ProfileSetupScreen(model: model, onBack: { path.removeLast() }, onCreate: onCreate)
                        .toolbar(.hidden, for: .navigationBar)
                }
        }
    }
}
