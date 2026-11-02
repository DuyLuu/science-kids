import Foundation
import SwiftUI
import Testing
@testable import DesignSystem

/// SK-007: the generated `Tokens.swift` matches `packages/design-tokens/tokens.json`.
/// tokens.json is read straight from the repo through a path relative to this file (`#filePath`),
/// so these tests fail when someone edits tokens.json and forgets `npm run export:swift`.
@MainActor
struct TokensExportTests {
    private static let testsDirectory = URL(fileURLWithPath: #filePath).deletingLastPathComponent()
    /// Tests/DesignSystemTests → Tests → SKKit → Packages → ios → apps → repo root.
    private static let tokensURL = testsDirectory
        .appendingPathComponent("../../../../../../packages/design-tokens/tokens.json")
        .standardizedFileURL
    private static let generatedURL = testsDirectory
        .appendingPathComponent("../../Sources/DesignSystem/Generated/Tokens.swift")
        .standardizedFileURL

    private let root: [String: Any]

    init() throws {
        let data = try Data(contentsOf: Self.tokensURL)
        let object = try JSONSerialization.jsonObject(with: data)
        root = try #require(object as? [String: Any], "tokens.json root is not an object")
    }

    // MARK: - Colours

    @Test("Colours: palette literals and role references match the tokens.json hex")
    func colours() throws {
        let cases: [(String, Color)] = [
            ("color.palette.do_son", Tokens.Palette.doSon),
            ("color.palette.la_tre", Tokens.Palette.laTre),
            ("color.role.feedback_correct", Tokens.Role.feedbackCorrect),
            ("color.role.text_correct", Tokens.Role.textCorrect),
            ("color.role.stamp_mark", Tokens.Role.stampMark),
            ("color.palette.diep", Tokens.Palette.diep),
            ("color.role.action_primary", Tokens.Role.actionPrimary),
            ("color.role.text_primary", Tokens.Role.textPrimary),
            ("color.role.food_group.fat", Tokens.Role.FoodGroup.fat),
            ("color.age_group.scientist", Tokens.AgeGroup.scientist.color),
        ]
        for (path, color) in cases {
            let hex = try string(path)
            try expectColour(color, hex: hex, alpha: 1, path)
        }
        #expect(try string("color.palette.do_son") == "#A93A27")
        #expect(try string("color.role.action_primary") == "#A93A27")
        #expect(try string("color.palette.la_tre") == "#3F7A33", "Duy 29/10: báo đúng là lá tre")
    }

    // MARK: - Fonts

    @Test("Font family and typography.button (family, size, weight, line height, letter spacing)")
    func typography() throws {
        let display = try string("font.family.display")
        #expect(Tokens.FontFamily.display == display)
        #expect(display == "Phudu")

        let json = try object("typography.button")
        let button = Tokens.Typography.button
        let family = try #require(try resolved(json["family"] as Any) as? String)
        #expect(button.family == family)
        #expect(Double(button.size) == (json["size"] as? NSNumber)?.doubleValue)
        let weight = try #require(try resolved(json["weight"] as Any) as? NSNumber)
        #expect(button.weight == weight.intValue)
        #expect(Double(button.lineHeight) == (json["line_height"] as? NSNumber)?.doubleValue)
        #expect(Double(button.letterSpacing) == (json["letter_spacing"] as? NSNumber)?.doubleValue)
        #expect(button.textCase == nil)
        #expect(button.size == 24 && button.weight == 900)

        #expect(Tokens.Typography.eyebrow.textCase == .uppercase)
        #expect(try object("typography.eyebrow")["text_case"] as? String == "upper")
    }

    // MARK: - Sizes

    @Test("Dimensions (pt)", arguments: [
        ("radius.explorer", Tokens.Radius.explorer),
        ("radius.discoverer", Tokens.Radius.discoverer),
        ("touch_target.discoverer", Tokens.TouchTarget.discoverer),
        ("space.s12", Tokens.Space.s12),
        ("layout.paper_frame_max", Tokens.Layout.paperFrameMax),
        ("layout.tray.slot_regular", Tokens.Layout.Tray.slotRegular),
    ])
    func dimension(path: String, swiftValue: CGFloat) throws {
        let expected = try number(path)
        #expect(Double(swiftValue) == expected, "\(path)")
    }

    @Test("Fixed values the ticket names: touch target Discoverer 56, paper frame 600, radius 10")
    func ticketValues() {
        #expect(Tokens.TouchTarget.discoverer == 56)
        #expect(Tokens.Layout.paperFrameMax == 600)
        #expect(Tokens.Radius.discoverer == 10)
    }

    @Test("Age group lookups pick radius, touch target and world colour")
    func ageGroups() throws {
        for group in Tokens.AgeGroup.allCases {
            let radius = try number("radius.\(group.rawValue)")
            let touch = try number("touch_target.\(group.rawValue)")
            #expect(Double(group.radius) == radius, "\(group)")
            #expect(Double(group.touchTarget) == touch, "\(group)")
            try expectColour(group.color, hex: try string("color.age_group.\(group.rawValue)"), alpha: 1, "\(group)")
        }
        #expect(Tokens.AgeGroup.explorer.touchTarget == 72)
        #expect(Tokens.AgeGroup.discoverer.touchTarget == 56)
        #expect(Tokens.AgeGroup.scientist.touchTarget == 48)
    }

    // MARK: - Shadow

    @Test("shadow.button_under: two layers, colour reference with alpha")
    func shadow() throws {
        let json = try #require(try value("shadow.button_under") as? [[String: Any]])
        let layers = Tokens.Shadow.buttonUnder.layers
        try #require(layers.count == json.count)
        for (index, (layer, expected)) in zip(layers, json).enumerated() {
            let label = "shadow.button_under[\(index)]"
            #expect(Double(layer.x) == (expected["x"] as? NSNumber)?.doubleValue, "\(label).x")
            #expect(Double(layer.y) == (expected["y"] as? NSNumber)?.doubleValue, "\(label).y")
            #expect(Double(layer.blur) == (expected["blur"] as? NSNumber)?.doubleValue, "\(label).blur")
            #expect(Double(layer.spread) == (expected["spread"] as? NSNumber)?.doubleValue, "\(label).spread")
            #expect(layer.inset == (expected["inset"] as? Bool), "\(label).inset")
            let hex = try #require(try resolved(expected["color"] as Any) as? String)
            let alpha = try #require((expected["alpha"] as? NSNumber)?.doubleValue)
            try expectColour(layer.color, hex: hex, alpha: alpha, label)
        }
        #expect(layers.first?.y == 7)
    }

    // MARK: - Motion

    @Test("motion.preset.lay: 460 ms, cubic-bezier(.2, .8, .2, 1)")
    func layPreset() throws {
        let json = try object("motion.preset.lay")
        let lay = Tokens.Motion.Preset.lay
        let durationMs = try #require((json["duration"] as? NSNumber)?.doubleValue)
        #expect(lay.duration == durationMs / 1000)
        #expect(lay.duration == 0.46)
        let easing = [lay.easing.x1, lay.easing.y1, lay.easing.x2, lay.easing.y2]
        #expect(easing == (json["easing"] as? [NSNumber])?.map(\.doubleValue))
        #expect(easing == [0.2, 0.8, 0.2, 1])
        #expect(lay.delay == 0)
        #expect(lay.stagger)
        #expect(!lay.repeats)
        #expect(lay.fillMode == .backwards)
        #expect(lay.origin == .center)
        try #require(lay.keyframes.count == 2)
        #expect(lay.keyframes[0].offset == 0)
        #expect(lay.keyframes[0].pose == Tokens.Pose(opacity: 0, translateY: -12, scale: 1.03))
        #expect(lay.keyframes[1].pose == Tokens.Pose(opacity: 1, translateY: 0, scale: 1))
    }

    @Test("Other kinds: stagger in seconds, grid, Dynamic Type ceiling, tilt angle, press transition")
    func otherKinds() throws {
        let stepMs = try number("motion.stagger.step")
        #expect(Tokens.Motion.Stagger.step == stepMs / 1000)

        let grid = try object("layout.grid.quiz.compact")
        let quiz = Tokens.Layout.Grid.Quiz.compact
        #expect(quiz.columns == (grid["columns"] as? NSNumber)?.intValue)
        #expect(Double(quiz.cellHeight) == (grid["cell_height"] as? NSNumber)?.doubleValue)
        #expect(Double(quiz.rowGap) == (grid["row_gap"] as? NSNumber)?.doubleValue)
        #expect(Double(quiz.columnGap) == (grid["column_gap"] as? NSNumber)?.doubleValue)

        #expect(try string("typography.dynamic_type.max_category") == "xxxLarge")
        #expect(Tokens.Typography.DynamicType.maxCategory == .xxxLarge)

        let tilt = try number("shape.tilt_stamp")
        #expect(Tokens.Shape.tiltStamp.degrees == tilt)

        let press = Tokens.Motion.Preset.press
        #expect(press.trigger == .pressed)
        #expect(press.to.translateY == 3)
        #expect(press.also.map(\.property) == [.shadow, .backgroundColor])
    }

    // MARK: - Completeness

    @Test("Tokens.swift has one constant per tokens.json leaf")
    func everyLeafHasAConstant() throws {
        let swift = try String(contentsOf: Self.generatedURL, encoding: .utf8)
        #expect(swift.hasPrefix("// Generated by packages/design-tokens/scripts/export-swift.mjs — do not edit\n"))

        var leaves: [String] = []
        collectLeaves(root, prefix: "", into: &leaves)
        var marked: [String] = []
        var constants = 0
        for line in swift.split(separator: "\n") {
            let trimmed = line.drop(while: { $0 == " " })
            if trimmed.hasPrefix("public static let ") { constants += 1 }
            // Token marker written by export-swift.mjs: /// `group.key` …
            guard trimmed.hasPrefix("/// `") else { continue }
            let path = trimmed.dropFirst(5).prefix(while: { $0 != "`" })
            let isTokenPath = path.contains(".") && path.first?.isLetter == true
                && path.allSatisfy { $0.isLowercase || $0.isNumber || $0 == "_" || $0 == "." }
            if isTokenPath { marked.append(String(path)) }
        }
        // 176 in tokens v1 + color.la_tre, role.text_correct, role.stamp_mark (SK-013, 29/10).
        #expect(leaves.count == 179)
        #expect(constants == leaves.count)
        #expect(marked.sorted() == leaves.sorted())
    }

    // MARK: - Reading tokens.json

    /// `$value` of a leaf, with `{…}` references followed.
    private func value(_ path: String) throws -> Any {
        var node: Any = root
        for key in path.split(separator: ".") {
            let group = try #require(node as? [String: Any], "\(path): \(key) is not inside a group")
            node = try #require(group[String(key)], "\(path): no key \(key)")
        }
        let leaf = try #require(node as? [String: Any], "\(path) is not a leaf")
        return try resolved(try #require(leaf["$value"], "\(path) has no $value"))
    }

    private func resolved(_ raw: Any) throws -> Any {
        if let text = raw as? String, text.hasPrefix("{"), text.hasSuffix("}") {
            return try value(String(text.dropFirst().dropLast()))
        }
        return raw
    }

    private func number(_ path: String) throws -> Double {
        try #require(try value(path) as? NSNumber, "\(path) is not a number").doubleValue
    }

    private func string(_ path: String) throws -> String {
        try #require(try value(path) as? String, "\(path) is not a string")
    }

    private func object(_ path: String) throws -> [String: Any] {
        try #require(try value(path) as? [String: Any], "\(path) is not an object")
    }

    private func collectLeaves(_ node: [String: Any], prefix: String, into leaves: inout [String]) {
        for (key, child) in node where !key.hasPrefix("$") {
            guard let child = child as? [String: Any] else { continue }
            let path = prefix.isEmpty ? key : "\(prefix).\(key)"
            if child["$value"] != nil {
                leaves.append(path)
            } else {
                collectLeaves(child, prefix: path, into: &leaves)
            }
        }
    }

    /// Compares the sRGB components of `colour` with `hex` (#RRGGBB) and `alpha`.
    private func expectColour(_ colour: Color, hex: String, alpha: Double, _ label: String) throws {
        let rgb = try #require(UInt32(hex.dropFirst(), radix: 16), "\(label): bad hex \(hex)")
        let expected = [Double((rgb >> 16) & 0xFF), Double((rgb >> 8) & 0xFF), Double(rgb & 0xFF)].map { $0 / 255 }
        let components = colour.resolve(in: EnvironmentValues())
        let actual = [components.red, components.green, components.blue].map(Double.init)
        for (channel, (a, e)) in zip(["red", "green", "blue"], zip(actual, expected)) {
            #expect(abs(a - e) < 0.002, "\(label) \(channel): \(a) vs \(e) (\(hex))")
        }
        #expect(abs(Double(components.opacity) - alpha) < 0.002, "\(label) alpha")
    }
}
