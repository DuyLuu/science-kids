import Foundation
import SwiftUI

extension View {
    /// Shows a screen that has only its phone layout so far as that layout, in a column of the
    /// phone frame width (`layout.frame_width`, 390) centred on the điệp background, when the
    /// window is regular width (iPad). Inside the column `horizontalSizeClass` and
    /// `layoutMetrics` are compact. In compact width (iPhone, Split View 1/3, Slide Over) it only
    /// fills the screen with điệp.
    ///
    /// SK-011 puts Welcome, Profile, Home and Topic in it; SK-013 gives Home its two-column iPad
    /// layout and takes it off there.
    public func phoneColumnOnRegular() -> some View {
        modifier(PhoneColumn())
    }
}

private struct PhoneColumn: ViewModifier {
    @Environment(\.layoutMetrics) private var metrics
    @Environment(\.horizontalSizeClass) private var sizeClass

    func body(content: Content) -> some View {
        let column = metrics.isRegular ? min(Tokens.Layout.frameWidth, metrics.containerWidth) : nil
        content
            .environment(\.horizontalSizeClass, column == nil ? sizeClass : .compact)
            .environment(
                \.layoutMetrics,
                column.map { LayoutMetrics(widthClass: .compact, containerWidth: $0, ageGroup: metrics.ageGroup) } ?? metrics
            )
            .frame(width: column)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Tokens.Role.bgScreen.ignoresSafeArea())
    }
}
