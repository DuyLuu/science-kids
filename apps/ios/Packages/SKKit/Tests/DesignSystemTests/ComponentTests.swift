import SwiftUI
import Testing
import UIKit
@testable import DesignSystem

/// SK-008: the token each component state uses (the drawing itself is checked on the simulator
/// gallery, `-SKGallery YES`).
@MainActor
struct ComponentTests {
    @Test("Answer cell: selection is a vàng hoè offset ring, checked states use lá tre and giấy lõm")
    func choiceStates() {
        #expect(ChoiceState.idle.shadow == Tokens.Shadow.paper3)
        #expect(ChoiceState.selected.shadow == Tokens.Shadow.offsetAccent)
        #expect(ChoiceState.selected.shadow.layers[0].color == Tokens.Role.stateSelected)
        #expect(ChoiceState.correct.shadow == Tokens.Shadow.offsetCorrect)
        #expect(ChoiceState.correct.shadow.layers[0].color == Tokens.Role.feedbackCorrect, "Duy 29/10: right is lá tre")
        #expect(ChoiceState.wrong.shadow == Tokens.Shadow.offsetWrong)
        #expect(ChoiceState.wrong.shadow.layers[0].color == Tokens.Role.feedbackWrong)
        #expect(ChoiceState.missed.shadow == Tokens.Shadow.paper3)
        #expect(ChoiceState.allCases.filter(\.isChosen) == [.selected, .correct, .wrong])
        #expect(ChoiceState.correct.mark == .correct)
        #expect(ChoiceState.wrong.mark == .wrong)
        #expect(ChoiceState.missed.mark == .missed)
        #expect(ChoiceState.idle.mark == nil && ChoiceState.selected.mark == nil)
    }

    /// Duy 29/10 (SK-006): only "ĐÚNG" is lá tre; a seal that only marks (seen, on the tray,
    /// chosen) stays đỏ son, so the app does not turn every seal green.
    @Test("Seal tones: correct is feedback_correct, mark is stamp_mark")
    func sealTones() {
        #expect(Seal.Tone.correct.fill == Tokens.Role.feedbackCorrect)
        #expect(Seal.Tone.mark.fill == Tokens.Role.stampMark)
        #expect(Tokens.Role.feedbackCorrect == Tokens.Palette.laTre)
        #expect(Tokens.Role.stampMark == Tokens.Palette.doSon)
        #expect(Tokens.Role.textCorrect == Tokens.Palette.laTre)
        #expect(Seal.Tone.correct.fill != Seal.Tone.mark.fill)
    }

    @Test("Progress squares: done before current, current vàng hoè, then giấy lõm")
    func progressStates() {
        let states = (0..<6).map { ProgressSquares.state(of: $0, current: 4) }
        #expect(states == [.done, .done, .done, .done, .current, .upcoming])
        #expect(ProgressSquares.StepState.done.fill == Tokens.Role.feedbackCorrect)
        #expect(ProgressSquares.StepState.current.fill == Tokens.Role.stateCurrent)
        #expect(ProgressSquares.StepState.upcoming.fill == Tokens.Role.surfaceInactive)
        #expect((0..<4).map { ProgressSquares.state(of: $0, current: 4) }.allSatisfy { $0 == .done })
    }

    @Test("Paper card styles")
    func cardStyles() {
        #expect(PaperCardStyle.paper.fill == Tokens.Role.surfacePaper)
        #expect(PaperCardStyle.paper.shadow == Tokens.Shadow.paper3)
        #expect(PaperCardStyle.sunken.fill == Tokens.Role.surfaceSunken)
        #expect(PaperCardStyle.sunken.shadow == Tokens.Shadow.sunken)
        #expect(PaperCardStyle.sunken.shadow.layers.allSatisfy { $0.inset })
        #expect(PaperCardStyle.inactive.fill == Tokens.Role.surfaceInactive)
    }

    @Test("Shadow blur: CSS blur radius / 2 for SwiftUI")
    func shadowBlur() {
        #expect(Tokens.Shadow.paper3.layers[0].blurRadius == 2)
        #expect(Tokens.Shadow.buttonUnder.layers[0].blurRadius == 0, "solid lower layer of the main button")
        #expect(Tokens.Shadow.buttonUnder.layers[0].y == 7)
    }

    @Test("Paper shapes: chamfer and folded corner follow the canvas clip-paths")
    func shapes() {
        let rect = CGRect(x: 0, y: 0, width: 100, height: 40)
        let chamfer = ChamferShape().path(in: rect)
        #expect(!chamfer.contains(CGPoint(x: 1, y: 1)), "corner cut")
        #expect(chamfer.contains(CGPoint(x: 50, y: 20)))
        #expect(chamfer.contains(CGPoint(x: 6, y: 1)))
        let fold = FoldCornerShape().path(in: rect)
        #expect(!fold.contains(CGPoint(x: 99, y: 1)), "top-right folded away")
        #expect(fold.contains(CGPoint(x: 1, y: 1)))
        let flap = FoldFlapShape().path(in: rect)
        #expect(flap.contains(CGPoint(x: 80, y: 20)), "flap is the lower-left half of the fold square")
        #expect(!flap.contains(CGPoint(x: 98, y: 2)))
        #expect(Tokens.Shape.foldCorner == 22)
    }

    @Test("Dynamic Type: body scaling, capped at xxxLarge / ×1.35, or xLarge / ×1.12 in fixed boxes")
    func dynamicType() {
        typealias Cap = Tokens.Typography.DynamicType
        #expect(SKFont.scaledSize(19, dynamicTypeSize: .large) == 19)
        #expect(SKFont.scaledSize(17, dynamicTypeSize: .small) < 17)
        let larger = SKFont.scaledSize(17, dynamicTypeSize: .xLarge)
        #expect(larger > 17)
        let capped = SKFont.scaledSize(17, dynamicTypeSize: .accessibility5)
        #expect(capped == SKFont.scaledSize(17, dynamicTypeSize: .xxxLarge))
        #expect(capped <= 17 * Cap.maxScale + 1e-9)
        #expect(capped > larger)
        let box = SKFont.scaledSize(17, dynamicTypeSize: .accessibility5, cap: Cap.fixedBoxMaxCategory, maxScale: Cap.fixedBoxMaxScale)
        #expect(box <= 17 * Cap.fixedBoxMaxScale + 1e-9)
        #expect(box > 17)
        #expect(box < capped)
    }

    @Test("Be Vietnam Pro face for a token weight")
    func faces() {
        #expect(SKFont.BeVietnamPro(weight: Tokens.FontWeight.textRegular) == .regular)
        #expect(SKFont.BeVietnamPro(weight: Tokens.FontWeight.textSemibold) == .semiBold)
        #expect(SKFont.BeVietnamPro(weight: Tokens.FontWeight.textBold) == .bold)
    }

    @Test("Icons are drawn inside their view box")
    func icons() {
        for icon in PaperIcon.allCases {
            let box = CGRect(x: 0, y: 0, width: icon.viewBox, height: icon.viewBox)
            var bounds = icon.fillPath().boundingRect
            if let stroke = icon.strokePath() {
                bounds = bounds.isEmpty ? stroke.path.boundingRect : bounds.union(stroke.path.boundingRect)
            }
            #expect(!bounds.isEmpty, "\(icon)")
            #expect(box.insetBy(dx: -0.5, dy: -0.5).contains(bounds), "\(icon) \(bounds)")
        }
    }
}
