import CoreGraphics
import SwiftUI
import Testing
@testable import DesignSystem

/// SK-013 (Duy 31/10): the mark of a checked answer cell sits astride the cell's top edge, its
/// middle on the edge, for bank words (56pt) and picture cells (104pt, Quiz q5). From L3 until
/// 31/10 the alignment guide was set inside the `if` of the overlay, where SwiftUI drops it, and
/// the mark sat inside the cell. These tests render the real `ChoiceFace` and measure the pixels.
@MainActor
struct ChoiceMarkPlacementTests {
    /// Where the cell starts on the rendered page, in points.
    private nonisolated static let cellTop: CGFloat = 40
    private nonisolated static let scale: CGFloat = 2

    private struct RGB: Equatable {
        let r: Int, g: Int, b: Int
        init(_ r: Int, _ g: Int, _ b: Int) { self.r = r; self.g = g; self.b = b }
        init(hex: String) {
            let v = Int(hex.dropFirst(), radix: 16) ?? 0
            self.init((v >> 16) & 0xFF, (v >> 8) & 0xFF, v & 0xFF)
        }
        func near(_ other: RGB, tolerance: Int = 6) -> Bool {
            abs(r - other.r) <= tolerance && abs(g - other.g) <= tolerance && abs(b - other.b) <= tolerance
        }
    }

    /// Colours from `tokens.json` (the Swift `Color` cannot be read back as sRGB in a test).
    private static let paper = RGB(hex: "#FBF6EA") // giay, surface_paper
    private static let missed = RGB(hex: "#F0C873") // feedback_missed
    private static let wrong = RGB(hex: "#E2D4B4") // feedback_wrong, giấy lõm
    private static let correct = RGB(hex: "#3F7A33") // feedback_correct, lá tre

    /// A pixel buffer of the cell in `state` with a mark, on a black page; the cell starts at
    /// `cellTop` and is `height` tall.
    private struct Page {
        let width: Int, height: Int
        let pixels: [UInt8]
        func color(x: Int, y: Int) -> RGB {
            let i = (y * width + x) * 4
            return RGB(Int(pixels[i]), Int(pixels[i + 1]), Int(pixels[i + 2]))
        }
        /// Rows (in points) that have at least `minRun` pixels of `color`.
        func rows(of color: RGB, minRun: Int = 3) -> [CGFloat] {
            (0..<height).filter { y in
                (0..<width).filter { color.near(self.color(x: $0, y: y)) }.count >= minRun
            }.map { CGFloat($0) / ChoiceMarkPlacementTests.scale }
        }
        /// First row (in points) of `color` in column `x` (points).
        func firstRow(of color: RGB, column x: CGFloat) -> CGFloat? {
            let px = Int(x * ChoiceMarkPlacementTests.scale)
            return (0..<height).first { color.near(self.color(x: px, y: $0)) }.map { CGFloat($0) / ChoiceMarkPlacementTests.scale }
        }
    }

    private static func render(_ state: ChoiceState, mark: String, cellHeight: CGFloat) throws -> Page {
        let view = ZStack(alignment: .top) {
            Color.black
            ChoiceFace(state: state, mark: Text(verbatim: mark)) {
                Text(verbatim: "air").frame(maxWidth: .infinity, minHeight: cellHeight)
            }
            .frame(width: 140)
            .padding(.top, cellTop)
        }
        .frame(width: 200, height: cellTop + cellHeight + 40)
        .environment(\.reduceMotionOverride, true)

        let renderer = ImageRenderer(content: view)
        renderer.scale = scale
        let image = try #require(renderer.cgImage, "ImageRenderer gave no image")
        let width = image.width, height = image.height
        var pixels = [UInt8](repeating: 0, count: width * height * 4)
        let context = try #require(CGContext(
            data: &pixels, width: width, height: height, bitsPerComponent: 8, bytesPerRow: width * 4,
            space: CGColorSpace(name: CGColorSpace.sRGB)!, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
        ))
        context.draw(image, in: CGRect(x: 0, y: 0, width: width, height: height))
        return Page(width: width, height: height, pixels: pixels)
    }

    nonisolated static let heights: [CGFloat] = [56, 104]

    @Test("\"Đáp án\" slip: its middle on the cell's top edge (bank word 56pt, picture cell 104pt)", arguments: heights)
    func missedSlipIsAstride(cellHeight: CGFloat) throws {
        let page = try Self.render(.missed, mark: "Đáp án", cellHeight: cellHeight)
        // The cell's paper starts at `cellTop` (left part of the cell, away from the mark).
        let cellTop = try #require(page.firstRow(of: Self.paper, column: 40))
        #expect(abs(cellTop - Self.cellTop) <= 1, "cell top \(cellTop)")
        let slip = page.rows(of: Self.missed)
        let top = try #require(slip.first), bottom = try #require(slip.last)
        let middle = (top + bottom) / 2
        print("missed \(cellHeight)pt: slip \(top)…\(bottom), middle \(middle), cell top \(cellTop)")
        #expect(top < cellTop - 6, "the slip stands above the cell: top \(top), cell top \(cellTop)")
        #expect(bottom > cellTop + 6, "and reaches into it: bottom \(bottom)")
        #expect(abs(middle - cellTop) <= 1.5, "its middle is on the edge: \(middle) vs \(cellTop)")
    }

    @Test("\"Chưa đúng\" slip: about half of it above the cell's top edge", arguments: heights)
    func wrongSlipIsAstride(cellHeight: CGFloat) throws {
        let reference = try Self.render(.missed, mark: "Chưa đúng", cellHeight: cellHeight).rows(of: Self.missed)
        let slipHeight = try #require(reference.last) - #require(reference.first)
        let page = try Self.render(.wrong, mark: "Chưa đúng", cellHeight: cellHeight)
        // The wrong cell also has a giấy lõm offset ring, but it starts below the top edge, so the
        // first giấy lõm row is the slip's top.
        let top = try #require(page.rows(of: Self.wrong).first)
        print("wrong \(cellHeight)pt: slip top \(top), slip height \(slipHeight), cell top \(Self.cellTop)")
        #expect(abs((Self.cellTop - top) - slipHeight / 2) <= 1.5, "half the slip above the edge: \(Self.cellTop - top) of \(slipHeight)")
    }

    @Test("\"Đúng\" seal (tilted): stands above the cell's top edge, within the room left above the row", arguments: heights)
    func correctSealIsAstride(cellHeight: CGFloat) throws {
        let page = try Self.render(.correct, mark: "Đúng", cellHeight: cellHeight)
        let top = try #require(page.rows(of: Self.correct).first)
        let above = Self.cellTop - top
        print("correct \(cellHeight)pt: seal top \(top), \(above)pt above the cell")
        #expect(above >= 8, "astride, not inside: \(above)pt above")
        // The gap above a row (12) plus the room left for the marks.
        #expect(above <= 12 + PaperMetrics.markRoomAbove - 2, "clear of the line above: \(above)pt above")
    }

    @Test("No mark: nothing above the cell")
    func noMarkNothingAbove() throws {
        let page = try Self.render(.selected, mark: "Đúng", cellHeight: 56)
        let rowsAbove = (0..<Int((Self.cellTop - 6) * Self.scale)).filter { y in
            (0..<page.width).contains { !RGB(0, 0, 0).near(page.color(x: $0, y: y), tolerance: 10) }
        }
        #expect(rowsAbove.isEmpty, "rows drawn above the cell: \(rowsAbove.prefix(5))")
    }
}
