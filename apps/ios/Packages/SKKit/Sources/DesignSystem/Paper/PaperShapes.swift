import Foundation
import SwiftUI

/// Paper label with all four corners cut (`shape.tag_chamfer`), CSS
/// `clip-path: polygon(5px 0, calc(100% - 5px) 0, 100% 5px, …)`.
public struct ChamferShape: SwiftUI.Shape {
    public var cut: CGFloat

    public init(cut: CGFloat = Tokens.Shape.tagChamfer) {
        self.cut = cut
    }

    public func path(in rect: CGRect) -> Path {
        let c = min(cut, rect.width / 2, rect.height / 2)
        var path = Path()
        path.move(to: CGPoint(x: rect.minX + c, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - c, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + c))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - c))
        path.addLine(to: CGPoint(x: rect.maxX - c, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX + c, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - c))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + c))
        path.closeSubpath()
        return path
    }
}

/// Paper with its top-right corner folded away (`shape.fold_corner`, wrong-answer note),
/// CSS `clip-path: polygon(0 0, calc(100% - 22px) 0, 100% 22px, 100% 100%, 0 100%)`.
public struct FoldCornerShape: SwiftUI.Shape {
    public var fold: CGFloat

    public init(fold: CGFloat = Tokens.Shape.foldCorner) {
        self.fold = fold
    }

    public func path(in rect: CGRect) -> Path {
        let f = min(fold, rect.width, rect.height)
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - f, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + f))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

/// The folded-over flap in the cut corner of a `FoldCornerShape`: the lower-left half of the
/// fold square at the top right (CSS `polygon(0 0, 0 100%, 100% 100%)` in a fold × fold box).
public struct FoldFlapShape: SwiftUI.Shape {
    public var fold: CGFloat

    public init(fold: CGFloat = Tokens.Shape.foldCorner) {
        self.fold = fold
    }

    public func path(in rect: CGRect) -> Path {
        let f = min(fold, rect.width, rect.height)
        var path = Path()
        path.move(to: CGPoint(x: rect.maxX - f, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - f, y: rect.minY + f))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + f))
        path.closeSubpath()
        return path
    }
}

/// Paper with a hand-torn top edge (`shape.torn_edge_top`): the bottom navigation strip, the
/// question sheet. Each token point is (x as a fraction of the width, y in pt from the top);
/// the shape closes along the bottom.
/// A sheet torn along its trailing edge (Trang chủ iPad: the paper sidebar, SK-013): the points of
/// `shape.torn_edge_top` turned a quarter, so the tear has the same rhythm as the top edges.
public struct TornEdgeTrailingShape: SwiftUI.Shape {
    public var points: [CGPoint]

    public init(points: [CGPoint] = Tokens.Shape.tornEdgeTop) {
        self.points = points
    }

    public func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        guard !points.isEmpty else {
            path.addRect(rect)
            return path
        }
        for point in points {
            // (x along the edge as a fraction, y into the sheet in pt) → down the trailing edge.
            path.addLine(to: CGPoint(x: rect.maxX - point.y, y: rect.minY + point.x * rect.height))
        }
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

public struct TornEdgeTopShape: SwiftUI.Shape {
    public var points: [CGPoint]

    public init(points: [CGPoint] = Tokens.Shape.tornEdgeTop) {
        self.points = points
    }

    public func path(in rect: CGRect) -> Path {
        var path = Path()
        guard let first = points.first else {
            path.addRect(rect)
            return path
        }
        path.move(to: CGPoint(x: rect.minX + first.x * rect.width, y: rect.minY + first.y))
        for point in points.dropFirst() {
            path.addLine(to: CGPoint(x: rect.minX + point.x * rect.width, y: rect.minY + point.y))
        }
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}
