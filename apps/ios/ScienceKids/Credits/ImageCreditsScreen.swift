import ContentKit
import DesignSystem
import SwiftUI

/// "Nguồn hình" · "Image credits" (SK-033): the credit of every picture in the content pack, as
/// the licences ask (CC BY: title, author, licence, source).
///
/// The app has no parent gate yet (Góc phụ huynh is GĐ 1), and children reach this screen from
/// Home, so nothing here opens anything: the source page and the licence page are plain text,
/// not links (`Text(verbatim:)` never detects links). When Góc phụ huynh exists, the screen
/// moves behind its gate and the two addresses become links that open in Safari.
///
/// SK-052: one card per source picture (`ImageCreditItem.group`), not one per file of the pack:
/// the crops of one photo share its card, whose change line lists every change made.
///
/// SK-052: the screen opened scrolled down, the title and the back button out of view: the
/// header and the note sat above a `LazyVStack` of cards in a `VStack`, and the scroll view kept
/// the first card in place while the lazy rows were measured. Now the header, the note and the
/// cards are rows of one `LazyVStack` (about 1,100 cards, so it stays lazy), the header its first
/// row: the screen opens on it. Only the header and the note play the reveal (a lazy card would
/// play it again each time it scrolls back into view).
struct ImageCreditsScreen: View {
    let items: [ImageCreditItem]
    let onBack: () -> Void

    init(credits: [PackManifest.AssetEntry], onBack: @escaping () -> Void) {
        items = ImageCreditItem.group(credits)
        self.onBack = onBack
    }

    var body: some View {
        PaperFrame(scrolls: true) {
            LazyVStack(alignment: .leading, spacing: 0) {
                ScreenHeader(
                    back: .init(label: Text("credits.back"), action: onBack),
                    title: Text("credits.title"),
                    caption: Text("credits.count \(items.count)"),
                    titleIdentifier: "credits.title"
                )
                .reveal(order: 0)
                .padding(.bottom, ScreenMetrics.homeGap)
                Text("credits.intro")
                    .typography(Tokens.Typography.body)
                    .foregroundStyle(Tokens.Role.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
                    .reveal(order: 1)
                    .padding(.bottom, ScreenMetrics.homeGap)
                ForEach(items) { item in
                    ImageCreditCard(item: item)
                        .padding(.bottom, item.id == items.last?.id ? 0 : Tokens.Space.s10)
                }
            }
        }
    }
}

/// One picture's credit on a paper card: title, then author, licence, source, what was changed,
/// then the two addresses in small print. A composed picture adds a well "Source images" under
/// it, one credit per source picture, in smaller type.
private struct ImageCreditCard: View {
    let item: ImageCreditItem

    var body: some View {
        let lines = item.lines
        PaperCard {
            VStack(alignment: .leading, spacing: Tokens.Space.s10) {
                ImageCreditFields(lines: lines, titleStyle: Tokens.Typography.bodyStrong, lineStyle: Tokens.Typography.caption)
                    .accessibilityElement(children: .combine)
                if !lines.parts.isEmpty {
                    ImageCreditParts(parts: lines.parts)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("credits.item.\(item.id.prefix(12))")
    }
}

/// SK-052: one card of "Image credits": a source picture and every file of the pack made from it.
/// The pack lists each file (each crop or size of a photo has its own `sha256`), so one photo used
/// in several lessons came several times ("Cropped", "Cropped · Resized"…).
///
/// Files are the same source picture when their credit has the same `source_url` (the picture's
/// page at its source); a credit without one (a picture Science Kids drew or composed) when every
/// field but `changes` is the same. A file without a credit stays on its own. The card shows the
/// first file's credit (its title: the crops of one photo may have their own titles, the author,
/// licence and source are the photo's) and every change made to any of the files, so "Cropped"
/// is still said when one crop was. Order: where the first file of each picture comes in the pack.
struct ImageCreditItem: Identifiable, Equatable {
    /// `sha256` of the first file of the picture.
    let id: String
    let lines: ImageCreditLines
    /// How many files of the pack are this picture.
    let files: Int

    static func group(_ entries: [PackManifest.AssetEntry]) -> [ImageCreditItem] {
        var order: [GroupKey] = []
        var groups: [GroupKey: [PackManifest.AssetEntry]] = [:]
        for entry in entries {
            let key = GroupKey(entry)
            if groups[key] == nil { order.append(key) }
            groups[key, default: []].append(entry)
        }
        return order.compactMap { key in
            guard let files = groups[key], let first = files.first else { return nil }
            let changes = files.flatMap { $0.credit?.changes ?? [] }
            let composed = files.contains { $0.credit?.isComposed ?? false }
            return ImageCreditItem(
                id: first.sha256, lines: ImageCreditLines(first.credit, changes: changes, composed: composed), files: files.count
            )
        }
    }

    private enum GroupKey: Hashable {
        case page(String)
        case credit(title: String?, author: String?, license: String?, licenseURL: String?, source: String?, parts: [PackManifest.ImageCredit.Part])
        case file(String)

        init(_ entry: PackManifest.AssetEntry) {
            guard let credit = entry.credit else {
                self = .file(entry.sha256)
                return
            }
            if let page = credit.sourceURL?.trimmingCharacters(in: .whitespacesAndNewlines), !page.isEmpty {
                self = .page(page)
            } else {
                self = .credit(
                    title: credit.title, author: credit.author, license: credit.license,
                    licenseURL: credit.licenseURL, source: credit.source, parts: credit.parts
                )
            }
        }
    }
}

/// The source pictures of a composed picture: a well pressed into the card (stacked paper, no
/// outline), a small heading, then each source's title, author, licence, source and addresses.
private struct ImageCreditParts: View {
    let parts: [ImageCreditLines]

    var body: some View {
        PaperCard(
            .sunken,
            padding: EdgeInsets(top: Tokens.Space.s10, leading: Tokens.Space.s12, bottom: Tokens.Space.s10, trailing: Tokens.Space.s12)
        ) {
            VStack(alignment: .leading, spacing: Tokens.Space.s10) {
                Text("credits.parts")
                    .typography(Tokens.Typography.captionS)
                    .foregroundStyle(Tokens.Role.textSecondary)
                    .accessibilityAddTraits(.isHeader)
                ForEach(parts.indices, id: \.self) { index in
                    ImageCreditFields(lines: parts[index], titleStyle: Tokens.Typography.caption, lineStyle: Tokens.Typography.captionS)
                        .accessibilityElement(children: .combine)
                        .accessibilityIdentifier("credits.part.\(index)")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

/// The lines of one credit (a picture or one of its source pictures), plain text only.
private struct ImageCreditFields: View {
    let lines: ImageCreditLines
    let titleStyle: Tokens.Typography
    let lineStyle: Tokens.Typography

    var body: some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s4) {
            Group {
                if let title = lines.title {
                    Text(verbatim: title)
                } else {
                    Text("credits.untitled")
                }
            }
            .typography(titleStyle)
            .fixedSize(horizontal: false, vertical: true)
            if let author = lines.author {
                Text("credits.author \(author)").creditLine(lineStyle)
            }
            if let license = lines.license {
                Text("credits.license \(license)").creditLine(lineStyle)
            }
            if let source = lines.source {
                Text("credits.source \(source)").creditLine(lineStyle)
            }
            if !lines.changes.isEmpty {
                ImageCreditChange.text(lines.changes).creditLine(lineStyle)
            }
            if let page = lines.sourceURL {
                Text("credits.page \(page)").creditAddress()
            }
            if let licensePage = lines.licenseURL {
                Text("credits.license_page \(licensePage)").creditAddress()
            }
        }
    }
}

/// The fields of a credit as the card shows them: present and not blank, in that order.
/// `nil` credit (an image the pack lists without one) shows only "Untitled picture".
///
/// A composed picture: `source` `composed` is a marker, not a place, so no "Source:" line; the
/// change line says "Composed from several images" (even when the manifest's `changes` forgot it)
/// and `parts` holds the credit of each source picture.
///
/// A picture drawn by Science Kids (SK-033 dev 10/11: `license` and `source` both "Science Kids",
/// `changes` `drawn`): no "Licence: Science Kids" line, which would repeat the source line; the
/// change line says "Drawn by Science Kids". A drawn source picture of a composed one has no
/// licence line either.
struct ImageCreditLines: Equatable {
    /// Author, licence and source of the pictures Science Kids draws itself.
    static let houseName = "Science Kids"

    let title: String?
    let author: String?
    let license: String?
    let source: String?
    let sourceURL: String?
    let licenseURL: String?
    /// What was changed, without repeats, "composed" first. Empty: no change line.
    private(set) var changes: [ImageCreditChange]
    /// Source pictures of a composed picture (each without changes or parts of its own).
    let parts: [ImageCreditLines]

    init(_ credit: PackManifest.ImageCredit?) {
        title = credit?.title
        author = credit?.author
        let house = Self.isHouse(credit?.license) && Self.isHouse(credit?.source)
        license = house ? nil : credit?.license
        let composedMarker = credit?.source?.caseInsensitiveCompare(PackManifest.ImageCredit.composedSource) == .orderedSame
        source = composedMarker ? nil : credit?.source
        sourceURL = credit?.sourceURL
        licenseURL = credit?.licenseURL
        changes = ImageCreditChange.lines(credit?.changes ?? [], composed: credit?.isComposed ?? false)
        parts = (credit?.parts ?? []).map(ImageCreditLines.init(part:))
    }

    /// SK-052: the credit of a picture whose files had these changes between them
    /// (`ImageCreditItem`).
    init(_ credit: PackManifest.ImageCredit?, changes manifestValues: [String], composed: Bool) {
        self.init(credit)
        changes = ImageCreditChange.lines(manifestValues, composed: composed)
    }

    private static func isHouse(_ value: String?) -> Bool {
        value?.caseInsensitiveCompare(houseName) == .orderedSame
    }

    init(part: PackManifest.ImageCredit.Part) {
        title = part.title
        author = part.author
        // A part Science Kids drew: the same rule as a drawn picture.
        license = Self.isHouse(part.license) && Self.isHouse(part.source) ? nil : part.license
        source = part.source
        sourceURL = part.sourceURL
        licenseURL = part.licenseURL
        changes = []
        parts = []
    }
}

/// A change made to a source picture, as the credit line names it (CC BY asks to say the picture
/// was changed). A value the app does not know reads "Edited", so a change is never hidden.
/// `drawn` (SK-033 dev 10/11) is a picture Science Kids drew itself: "Drawn by Science Kids".
enum ImageCreditChange: String, Equatable, CaseIterable {
    case composed
    case drawn
    case cropped
    case resized
    case edited

    init(manifestValue: String) {
        self = switch manifestValue.lowercased() {
        case "composed": .composed
        case "drawn": .drawn
        case "cropped": .cropped
        case "resized": .resized
        default: .edited
        }
    }

    /// Key in `Localizable.xcstrings`.
    var key: String { "credits.change.\(rawValue)" }

    /// The manifest's `changes` as the line shows them: known names mapped, unknown ones as one
    /// "Edited", no repeats; a composed picture starts with "Composed from several images".
    static func lines(_ manifestValues: [String], composed: Bool) -> [ImageCreditChange] {
        var result: [ImageCreditChange] = composed ? [.composed] : []
        for change in manifestValues.map(Self.init(manifestValue:)) where !result.contains(change) {
            result.append(change)
        }
        return result
    }

    /// "Cropped · Resized": each change localised, joined by a middle dot.
    static func text(_ changes: [ImageCreditChange]) -> Text {
        changes.enumerated().reduce(Text(verbatim: "")) { line, item in
            let label = Text(LocalizedStringKey(item.element.key))
            return item.offset == 0 ? line + label : line + Text(verbatim: " · ") + label
        }
    }
}

@MainActor private extension Text {
    func creditLine(_ style: Tokens.Typography) -> some View {
        typography(style)
            .fixedSize(horizontal: false, vertical: true)
    }

    /// An address in small print, as text: not a link (no parent gate yet).
    func creditAddress() -> some View {
        typography(Tokens.Typography.captionS)
            .foregroundStyle(Tokens.Role.textSecondary)
            .fixedSize(horizontal: false, vertical: true)
    }
}

/// "Nguồn hình" under the journey (Home, phone page and iPad sidebar): a quiet line, the touch
/// target tall. Only when the pack has pictures.
struct ImageCreditsLink: View {
    let action: () -> Void
    @Environment(\.ageGroup) private var ageGroup

    var body: some View {
        Button(action: action) {
            HStack(spacing: Tokens.Space.s6) {
                PaperIconView(.book, size: PaperMetrics.headerChipIcon, color: Tokens.Role.textSecondary)
                    .accessibilityHidden(true)
                Text("credits.entry")
                    .typography(Tokens.Typography.caption)
                    .foregroundStyle(Tokens.Role.textSecondary)
            }
            .frame(maxWidth: .infinity, minHeight: ageGroup.touchTarget, alignment: .leading)
            .contentShape(Rectangle())
        }
        .buttonStyle(.paperPress)
        .accessibilityIdentifier("home.image_credits")
    }
}
