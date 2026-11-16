import ContentKit
import ContentModel
import CoreText
import DesignSystem
import Foundation
import Profiles
import SwiftUI
import Testing
@testable import LessonPlayer

// SK-047, tester 16/11 ("PALAEONTO…" on the bank of `da-va-dat/15` q2): every label the child reads
// to choose fits its card whole on the narrowest phone, the phone of the pilot and the iPad: one
// word on one line, never cut, never broken inside; a phrase broken only at its spaces. Labels
// from the embedded pack (`content/.build/pack`), EN and VI, measured with the bundled fonts at
// the widths `LabelWidths` gives the views.

/// The app registers Phudu and Be Vietnam Pro through `UIAppFonts`; the package tests have no app,
/// so they register the repo's font files for this process.
enum BundledFonts {
    static let files = [
        "apps/ios/ScienceKids/Resources/Fonts/Phudu/Phudu-VariableFont_wght.ttf",
        "apps/ios/ScienceKids/Resources/Fonts/BeVietnamPro/BeVietnamPro-Regular.ttf",
        "apps/ios/ScienceKids/Resources/Fonts/BeVietnamPro/BeVietnamPro-SemiBold.ttf",
        "apps/ios/ScienceKids/Resources/Fonts/BeVietnamPro/BeVietnamPro-Bold.ttf",
    ]

    /// `true` once both families answer by name.
    static let registered: Bool = {
        for file in files {
            var error: Unmanaged<CFError>?
            // Fails harmlessly when already registered.
            CTFontManagerRegisterFontsForURL(Repo.find(file) as CFURL, .process, &error)
        }
        return SKFont.postScriptName(Tokens.Typography.title) != nil
            && SKFont.postScriptName(Tokens.Typography.bodyStrong) != nil
    }()
}

/// Widths of the three machines of the brief, in their orientation of use (iPad: portrait; its
/// landscape has the same 600 frame).
struct Machine: Sendable, CustomStringConvertible {
    let name: String
    let metrics: LayoutMetrics
    var description: String { name }

    static let iPhone16e = Machine(name: "iPhone 16e", metrics: LayoutMetrics(widthClass: .compact, containerWidth: 390))
    static let iPhone16 = Machine(name: "iPhone 16", metrics: LayoutMetrics(widthClass: .compact, containerWidth: 393))
    static let iPadPro11 = Machine(name: "iPad Pro 11-inch (M4)", metrics: LayoutMetrics(widthClass: .regular, containerWidth: 834))
    /// Slide Over and Split View 1/3 use the phone layout at 320 (B7.10).
    static let slideOver = Machine(name: "iPad Slide Over", metrics: LayoutMetrics(widthClass: .compact, containerWidth: 320))

    static let brief = [iPhone16e, iPhone16, iPadPro11]
}

/// One printed label: where it shows, the text as drawn (EN or VI), its role and its width.
struct PrintedLabel {
    let site: String
    let lesson: String
    let text: String
    let style: Tokens.Typography
    let maxLines: Int
    let fixedBox: Bool
    /// The text width on a machine at a text size (the bank and Tổng kết take a column less when
    /// a word would not fit, as the views do).
    let width: (LayoutMetrics, DynamicTypeSize) -> CGFloat
}

/// Every label of the embedded pack, per place it prints (both languages: `vi_first` prints VI).
enum PackLabels {
    static func all(in library: ContentLibrary) -> [PrintedLabel] {
        var labels: [PrintedLabel] = []
        func both(_ spoken: Spoken) -> [String] { [spoken.text(in: .en), spoken.text(in: .vi)] }
        for topic in library.topics {
            let discoverer = topic.topic.ageGroup.rawValue == "discoverer"
            for lesson in topic.lessons {
                let name = "\(topic.topic.slug)/\(lesson.slug)"
                if discoverer {
                    for item in lesson.warmup + lesson.quiz {
                        let site = "\(name) \(item.key)"
                        switch item.answer {
                        case .fillBlankBank(let fill):
                            let count = fill.bank.count
                            let bank = fill.bank.map(\.label)
                            for word in fill.bank {
                                for text in both(word.label) {
                                    labels.append(PrintedLabel(
                                        site: "bank", lesson: site, text: text, style: Tokens.Typography.title,
                                        maxLines: LabelWidths.bankLines, fixedBox: true,
                                        width: { metrics, size in
                                            let language: ContentLanguage = text == word.label.text(in: .en) ? .en : .vi
                                            let words = bank.map { $0.text(in: language) }
                                            let columns = LabelWidths.bankColumns(count: count, metrics: metrics) { width in
                                                words.allSatisfy { WordFit.rawFit($0, style: Tokens.Typography.title, width: width, maxLines: LabelWidths.bankLines, dynamicTypeSize: size).scale >= WordFit.floor }
                                            }
                                            return LabelWidths.bankText(columns: columns, metrics: metrics)
                                        }
                                    ))
                                }
                            }
                        case .singleChoice(let choice):
                            labels += choiceLabels(choice.options, multiple: false, site: site, both: both)
                        case .multiChoice(let choice):
                            labels += choiceLabels(choice.options, multiple: true, site: site, both: both)
                        case .trueFalse(let tf):
                            for spoken in [tf.labels?.trueLabel, tf.labels?.falseLabel].compactMap({ $0 }) {
                                for text in both(spoken) {
                                    labels.append(PrintedLabel(
                                        site: "true_false", lesson: site, text: text, style: Tokens.Typography.title,
                                        maxLines: 2, fixedBox: true, width: { metrics, _ in LabelWidths.trueFalseText(metrics: metrics) }
                                    ))
                                }
                            }
                        case .pictureBarChart(let chart):
                            let count = min(chart.chart.bars.count, chart.options.count)
                            for bar in chart.chart.bars {
                                for text in both(bar.label) {
                                    labels.append(PrintedLabel(
                                        site: "bar", lesson: site, text: text, style: Tokens.Typography.bodyStrong,
                                        maxLines: 2, fixedBox: false, width: { metrics, _ in LabelWidths.barName(count: count, metrics: metrics) }
                                    ))
                                }
                            }
                        default:
                            break
                        }
                    }
                }
                // New words: Tổng kết (both worlds), Explorer "Từ mới" cards. The word is English.
                let list = lesson.learn.compactMap { block -> WordList? in
                    if case .wordList(let list) = block { return list } else { return nil }
                }.first
                let words = (list?.termKeys ?? []).compactMap { key in lesson.vocab.first { $0.key == key } }
                let shown = words.map { $0.term.en.uppercased() }
                for term in words {
                    labels.append(PrintedLabel(
                        site: "recap_word", lesson: name, text: term.term.en.uppercased(), style: Tokens.Typography.title,
                        maxLines: 2, fixedBox: true, width: { metrics, size in
                            LabelWidths.recapWordText(columns: WordFitLayoutTests.recapColumns(shown, metrics: metrics, size: size), metrics: metrics)
                        }
                    ))
                    if !discoverer {
                        labels.append(PrintedLabel(
                            site: "explorer_word_card", lesson: name, text: term.term.en, style: Tokens.Typography.itemTitle,
                            maxLines: 2, fixedBox: true, width: { metrics, _ in LabelWidths.explorerWordCardText(metrics: metrics) }
                        ))
                    }
                }
            }
        }
        return labels
    }

    private static func choiceLabels(
        _ options: [QuizItem.ChoiceOption], multiple: Bool, site: String, both: (Spoken) -> [String]
    ) -> [PrintedLabel] {
        let count = options.count
        return options.flatMap { option in
            both(option.label).map { text in
                option.image == nil
                    ? PrintedLabel(
                        site: "choice_text", lesson: site, text: text, style: Tokens.Typography.title,
                        maxLines: LabelWidths.choiceTextLines, fixedBox: false,
                        width: { metrics, _ in LabelWidths.choiceText(count: count, multiple: multiple, metrics: metrics) }
                    )
                    : PrintedLabel(
                        site: "name_label", lesson: site, text: text, style: Tokens.Typography.bodyStrong,
                        maxLines: 2, fixedBox: true,
                        width: { metrics, _ in LabelWidths.nameLabelText(count: count, multiple: multiple, metrics: metrics) }
                    )
            }
        }
    }
}

@Suite struct WordFitLayoutTests {
    /// The columns `RecapStep.wordGrid` picks for these words (one less while a word would be cut).
    static func recapColumns(_ words: [String], metrics: LayoutMetrics, size: DynamicTypeSize) -> Int {
        LabelWidths.recapWordColumns(count: words.count, metrics: metrics) { width in
            words.allSatisfy { WordFit.rawFit($0, style: Tokens.Typography.title, width: width, dynamicTypeSize: size).scale >= WordFit.floor }
        }
    }

    /// Tổng kết of lesson 1 ("CARBOHYDRATE" with three other words): four columns at the default
    /// text size on every machine (designer 15/11: 0.51 on a 390 phone); at the larger sizes of a
    /// box (xLarge, the cap) the phones take three columns instead of cutting the word.
    @Test(.enabled(if: BundledFonts.registered), arguments: Machine.brief)
    func carbohydrateTakesAColumnLessOnlyWhenItWouldBeCut(_ machine: Machine) {
        let words = ["CARBOHYDRATE", "PROTEIN", "VITAMIN", "NUTRIENT"]
        #expect(Self.recapColumns(words, metrics: machine.metrics, size: .large) == 4)
        let large = Self.recapColumns(words, metrics: machine.metrics, size: .xLarge)
        #expect(large == (machine.metrics.isRegular ? 4 : 3), "\(machine)")
        let fit = WordFit.rawFit("CARBOHYDRATE", style: Tokens.Typography.title,
                                 width: LabelWidths.recapWordText(columns: large, metrics: machine.metrics), dynamicTypeSize: .xLarge)
        #expect(fit.scale >= WordFit.floor && fit.lines == 1, "\(machine): \(fit)")
    }

    /// The bank card of the tester's screenshot on each machine: "palaeontology" on one line, at a
    /// size above the floor (it was cut at 0.8 on iPhone 16); "cổ sinh vật học" on two lines,
    /// broken between its words.
    @Test(.enabled(if: BundledFonts.registered), arguments: Machine.brief)
    func palaeontologyFitsTheBankCard(_ machine: Machine) {
        let width = LabelWidths.bankText(columns: 3, metrics: machine.metrics)
        let word = WordFit.rawFit("palaeontology", style: Tokens.Typography.title, width: width, maxLines: LabelWidths.bankLines)
        #expect(word.lines == 1)
        #expect(word.scale >= WordFit.floor, "\(machine): \(word.scale)")
        #expect(word.scale < PaperMetrics.labelMinimumScale || machine.metrics.isRegular,
                "on a phone the old 0.8 floor cut it: \(word.scale)")
        let vi = WordFit.rawFit("cổ sinh vật học", style: Tokens.Typography.title, width: width, maxLines: LabelWidths.bankLines)
        #expect(vi.lines == 2 || machine.metrics.isRegular, "\(machine): \(vi)")
        #expect(vi.scale >= PaperMetrics.labelMinimumScale, "\(machine): \(vi.scale)")
        let measure = WordFit.measure(Tokens.Typography.title, fixedBox: true, dynamicTypeSize: .large)
        let size = (Tokens.Typography.title.size * vi.scale).rounded(.down) / Tokens.Typography.title.size
        let lineWidth = (width - WordFit.slack) / size
        #expect(WordFit.lineCount(["cổ", "sinh", "vật", "học"], lineWidth: lineWidth, measure: measure) == vi.lines)
    }

    /// The card widths `LabelWidths` gives (pt): the bank in three columns on a phone, four in
    /// the frame; the cards of a choice grid; the true / false word.
    @Test func cardWidthsPerMachine() {
        let phone16e = Machine.iPhone16e.metrics, phone16 = Machine.iPhone16.metrics, pad = Machine.iPadPro11.metrics
        #expect(phone16e.contentWidth == 350)
        #expect(phone16.contentWidth == 353)
        #expect(pad.contentWidth == 544)
        let inset = phone16.gridTrailingInset
        #expect(abs(LabelWidths.bankText(columns: 3, metrics: phone16) - ((353 - inset - 20) / 3 - 16)) < 0.001)
        #expect(abs(LabelWidths.bankText(columns: 3, metrics: phone16e) - ((350 - inset - 20) / 3 - 16)) < 0.001)
        #expect(abs(LabelWidths.bankText(columns: 4, metrics: pad) - ((544 - inset - 30) / 4 - 16)) < 0.001)
        #expect(LabelWidths.bankColumns(count: 3, metrics: phone16) == 3)
        #expect(LabelWidths.bankColumns(count: 5, metrics: pad) == 4)
        #expect(LabelWidths.bankColumns(count: 2, metrics: pad) == 2)
        #expect(abs(LabelWidths.choiceCard(count: 4, multiple: false, metrics: phone16) - (353 - inset - 12) / 2) < 0.001)
        #expect(abs(LabelWidths.choiceCard(count: 3, multiple: false, metrics: phone16) - (353 - inset)) < 0.001)
        #expect(abs(LabelWidths.choiceCard(count: 3, multiple: false, metrics: pad) - (544 - inset - 24) / 3) < 0.001)
        #expect(LabelWidths.bankText(columns: 3, metrics: phone16e) < LabelWidths.bankText(columns: 3, metrics: phone16))
    }

    /// Every label of the pack, on each machine, at the default text size and at the cap of its
    /// box: fits without going under `WordFit.floor` (no "…", no break inside a word).
    @Test(.enabled(if: EmbeddedPack.isBuilt && BundledFonts.registered), arguments: Machine.brief)
    func everyPackLabelFitsItsCard(_ machine: Machine) async throws {
        let labels = PackLabels.all(in: try await EmbeddedPack.library())
        #expect(labels.count > 1000, "\(labels.count) labels")
        var cut: [String] = []
        var smallest: [String: (scale: CGFloat, text: String)] = [:]
        for size in [DynamicTypeSize.large, .xLarge] {
            for label in labels {
                let width = label.width(machine.metrics, size)
                let fit = WordFit.rawFit(label.text, style: label.style, width: width, maxLines: label.maxLines,
                                         fixedBox: label.fixedBox, dynamicTypeSize: size)
                if fit.scale < WordFit.floor {
                    cut.append("\(label.site) \(label.lesson) '\(label.text)' \(size) → \(fit.scale)")
                }
                if size == .large, fit.scale < (smallest[label.site]?.scale ?? 2) {
                    smallest[label.site] = (fit.scale, label.text)
                }
            }
        }
        #expect(cut.isEmpty, "\(machine): \(cut.prefix(10))")
        let summary = smallest.keys.sorted().map { "\($0) \(String(format: "%.2f", smallest[$0]!.scale)) '\(smallest[$0]!.text)'" }
        print("WordFitLayoutTests \(machine): \(labels.count) labels, smallest \(summary.joined(separator: "; "))")
    }

    /// The bank is laid out with the columns the view picks: on the three machines every bank of
    /// the pack keeps its columns (three on the phone, four in the frame); at 320 (Slide Over) a
    /// bank whose word would not fit takes a column less instead of cutting it.
    @Test(.enabled(if: EmbeddedPack.isBuilt && BundledFonts.registered))
    func bankColumnsKeepEveryWordWhole() async throws {
        let library = try await EmbeddedPack.library()
        var banks: [(site: String, words: [String])] = []
        for topic in library.topics where topic.topic.ageGroup.rawValue == "discoverer" {
            for lesson in topic.lessons {
                for item in lesson.warmup + lesson.quiz {
                    guard case .fillBlankBank(let fill) = item.answer else { continue }
                    for language in [ContentLanguage.en, .vi] {
                        banks.append(("\(lesson.slug) \(item.key) \(language)", fill.bank.map { $0.label.text(in: language) }))
                    }
                }
            }
        }
        #expect(banks.count == 80, "40 fill_blank_bank × EN, VI")
        for machine in Machine.brief + [Machine.slideOver] {
            for bank in banks {
                let fits: (CGFloat) -> Bool = { width in
                    bank.words.allSatisfy { WordFit.rawFit($0, style: Tokens.Typography.title, width: width, maxLines: LabelWidths.bankLines).scale >= WordFit.floor }
                }
                let columns = LabelWidths.bankColumns(count: bank.words.count, metrics: machine.metrics, fits: fits)
                if machine.name != Machine.slideOver.name {
                    #expect(columns == LabelWidths.bankColumns(count: bank.words.count, metrics: machine.metrics), "\(machine) \(bank.site)")
                }
                #expect(fits(LabelWidths.bankText(columns: columns, metrics: machine.metrics)), "\(machine) \(bank.site)")
            }
        }
    }
}
