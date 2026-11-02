import Foundation
import SwiftUI

extension Tokens.Shadow.Layer {
    /// SwiftUI blur radius for the CSS blur radius: CSS blurs with a standard deviation of
    /// `blur / 2`, and `.blur(radius:)` takes about that standard deviation (README
    /// "Ghi chú cho SK-007 và SK-008"; checked by eye against the canvas, SK-008).
    public var blurRadius: CGFloat { blur / 2 }
}

extension View {
    /// Paper shadow of `shape` drawn behind this view, one layer per `Tokens.Shadow` layer, like
    /// CSS `box-shadow` (and `filter: drop-shadow` on a clipped piece): each layer is the shape
    /// filled with the layer colour, grown by `spread`, moved by (x, y) and blurred; the first layer
    /// is on top. Inset layers (`sunken`, `sunken_s`) are drawn inside the shape over the view.
    /// Layers never shadow each other, unlike chained `.shadow()` calls.
    public func paperShadow(_ shadow: Tokens.Shadow, in shape: some SwiftUI.Shape) -> some View {
        modifier(PaperShadowModifier(shadow: shadow, shape: shape))
    }

    /// `paperShadow(_:in:)` for a rounded rectangle.
    public func paperShadow(_ shadow: Tokens.Shadow, cornerRadius: CGFloat = 0) -> some View {
        paperShadow(shadow, in: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
    }

    /// A paper piece behind this view: `shape` filled with `fill`, with `shadow` (outer layers
    /// behind it, inset layers on the fill, under this view's content).
    public func paperSurface(_ fill: Color, shadow: Tokens.Shadow? = nil, in shape: some SwiftUI.Shape) -> some View {
        background {
            ZStack {
                if let shadow {
                    OuterShadowLayers(shadow: shadow, shape: shape)
                }
                shape.fill(fill)
                if let shadow {
                    InsetShadowLayers(shadow: shadow, shape: shape)
                }
            }
        }
    }

    /// `paperSurface(_:shadow:in:)` for a rounded rectangle.
    public func paperSurface(_ fill: Color, shadow: Tokens.Shadow? = nil, cornerRadius: CGFloat) -> some View {
        paperSurface(fill, shadow: shadow, in: RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
    }
}

private struct PaperShadowModifier<S: SwiftUI.Shape>: ViewModifier {
    let shadow: Tokens.Shadow
    let shape: S

    func body(content: Content) -> some View {
        content
            .background { OuterShadowLayers(shadow: shadow, shape: shape) }
            .overlay { InsetShadowLayers(shadow: shadow, shape: shape).allowsHitTesting(false) }
    }
}

/// Outer layers, last CSS layer at the bottom.
private struct OuterShadowLayers<S: SwiftUI.Shape>: View {
    let shadow: Tokens.Shadow
    let shape: S

    var body: some View {
        ZStack {
            ForEach(Array(shadow.layers.enumerated().reversed()), id: \.offset) { _, layer in
                if !layer.inset {
                    shape
                        .fill(layer.color)
                        .padding(-layer.spread)
                        .offset(x: layer.x, y: layer.y)
                        .blur(radius: layer.blurRadius)
                }
            }
        }
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }
}

/// Inset layers: the layer colour everywhere inside the shape except a copy of the shape moved
/// by (x, y) and shrunk by `spread`, blurred, then clipped to the shape (CSS `inset` box-shadow).
private struct InsetShadowLayers<S: SwiftUI.Shape>: View {
    let shadow: Tokens.Shadow
    let shape: S

    var body: some View {
        ZStack {
            ForEach(Array(shadow.layers.enumerated().reversed()), id: \.offset) { _, layer in
                if layer.inset {
                    let reach = layer.blur + abs(layer.x) + abs(layer.y) + abs(layer.spread)
                    Color.clear
                        .overlay {
                            ZStack {
                                Rectangle()
                                    .fill(layer.color)
                                    .padding(-reach)
                                shape
                                    .fill(Tokens.Palette.thanTre) // any opaque colour: it is cut out
                                    .padding(layer.spread)
                                    .offset(x: layer.x, y: layer.y)
                                    .blendMode(.destinationOut)
                            }
                            .compositingGroup()
                            .blur(radius: layer.blurRadius)
                        }
                        .clipShape(shape)
                }
            }
        }
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }
}

extension View {
    /// Drop shadow that follows what is drawn (CSS `filter: drop-shadow`), for paper art that is
    /// not one shape: an illustration, an avatar. Outer layers of `shadow` become `.shadow` calls
    /// on the composited view (at most the first two layers; every art token has one).
    public func paperDropShadow(_ shadow: Tokens.Shadow) -> some View {
        modifier(PaperDropShadowModifier(layers: shadow.layers.filter { !$0.inset }))
    }
}

private struct PaperDropShadowModifier: ViewModifier {
    let layers: [Tokens.Shadow.Layer]

    func body(content: Content) -> some View {
        let first = layers.first
        let second = layers.dropFirst().first
        content
            .compositingGroup()
            .shadow(color: first?.color ?? .clear, radius: first?.blurRadius ?? 0, x: first?.x ?? 0, y: first?.y ?? 0)
            .shadow(color: second?.color ?? .clear, radius: second?.blurRadius ?? 0, x: second?.x ?? 0, y: second?.y ?? 0)
    }
}
