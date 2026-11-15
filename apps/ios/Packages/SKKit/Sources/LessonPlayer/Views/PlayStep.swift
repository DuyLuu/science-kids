import AudioKit
import ContentModel
import DesignSystem
import LessonEngine
import Profiles
import SwiftUI

/// Chơi (canvas Discoverer 10): the `build_tray` block (a meal tray in *Ăn uống lành mạnh*,
/// places with water in *Bề mặt Trái Đất*…). The engine (`buildTray`) decides the tray, the `full`
/// flag and the message (Duy, 29/10: missing groups in `groups` order;
/// `balanced` > `full` > `has_limited` > `start` > `missing`); this screen only shows them. The
/// group chips follow `groups` too. "Xong rồi! Làm quiz" appears once the tray succeeds. The
/// interface words stay generic (SK-031: no "mâm", "món"); what the picks are comes from the content.
/// The shelf is neutral (SK-031): no group colour, no content order before the pick.
struct PlayStep<Header: View>: View {
    let session: LessonSession
    let tray: BuildTray
    @ViewBuilder let header: Header
    @Environment(\.layoutMetrics) private var metrics
    @Environment(\.speechPlayer) private var speech
    @Environment(\.ageGroup) private var ageGroup

    private var mode: LanguageMode { session.languageMode }
    /// Discoverer A2: "Cả hai" prints English only.
    private var showsSecond: Bool { session.isExplorer && session.showsSecondLanguage }
    private var state: TrayState? { session.trayState }

    var body: some View {
        PaperFrame(scrolls: true) {
            VStack(alignment: .leading, spacing: LessonMetrics.gap) {
                header.reveal(order: 0)
                message.reveal(order: 1)
                trayPlate.reveal(order: 2)
                meters.reveal(order: 3)
                shelf.reveal(order: 4)
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            BottomBar {
                // SK-043 hướng A (Explorer; Discoverer A2, Duy 14/11): only the arrow, once the
                // tray succeeds; no word.
                if state?.success == true {
                    ExplorerNextButton(label: "lesson.explorer.play.next", action: session.advance)
                        .accessibilityIdentifier("lesson.play.done")
                }
            }
            .reveal(order: 5)
        }
    }

    /// The mascot says the tray's message (`messages`, chosen by the engine); its listen button at
    /// the end of the row. The message plays by itself when Chơi opens (`autoplayUtterance`), not
    /// after each tap: a tap says the food's name.
    @ViewBuilder private var message: some View {
        // SK-043 Explorer-A, Discoverer A2: the mascot's bubble with its speaker, as in the quiz.
        if let text = bubbleText {
            ExplorerSpeechRow(
                mood: state?.success == true ? .happy : .talk, lines: [text], mode: mode, showsSecond: showsSecond,
                listen: session.utterance("play.message", text), sways: false
            )
            .id(state?.message.code)
            .accessibilityIdentifier("lesson.play.message")
        }
    }

    /// Discoverer A2 (`play-start`): before the first pick the bubble prints the tray's prompt
    /// (one short sentence) instead of `messages.start`; the opening voice says both.
    private var bubbleText: Spoken? {
        if !session.isExplorer, state.map({ $0.tray.isEmpty }) ?? true { return tray.prompt }
        return session.trayMessage
    }

    /// "Em đã chọn": the tray (gỉ đồng oval), the picks on it (tap to take off), the empty places.
    private var trayPlate: some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s6) {
            // SK-043 hướng A: no "Your picks · tap one to take it off" (the voice says it).
            ZStack {
                TrayOval()
                    .frame(width: metrics.trayWidth, height: metrics.trayHeight)
                    .paperDropShadow(Tokens.Shadow.paper2)
                    .accessibilityHidden(true)
                HStack(spacing: Tokens.Space.s8) {
                    ForEach(state?.tray ?? [], id: \.self) { key in
                        if let item = tray.items.first(where: { $0.key == key }) {
                            trayItem(item).motion(Tokens.Motion.Preset.pop)
                        }
                    }
                    ForEach(0..<max(0, tray.capacity - (state?.tray.count ?? 0)), id: \.self) { _ in
                        Circle()
                            .fill(Tokens.Role.surfaceSunken)
                            .frame(width: metrics.traySlot, height: metrics.traySlot)
                            .paperSurface(Tokens.Role.surfaceSunken, shadow: Tokens.Shadow.sunken, in: Circle())
                            .accessibilityHidden(true)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .accessibilityElement(children: .contain)
            .accessibilityLabel(Text("lesson.play.tray_a11y \(state?.tray.count ?? 0) \(tray.capacity)"))
        }
    }

    private func trayItem(_ item: TrayItem) -> some View {
        explorerTrayItem(item)
    }

    /// SK-043 Explorer-A: the photo fills the round place (96); a `limit` pick is faded with a
    /// folded corner, no word.
    private func explorerTrayItem(_ item: TrayItem) -> some View {
        let group = tray.groups.first { $0.key == item.group }
        let limited = group?.role == .limit
        let side = metrics.traySlot - 2 * LessonMetrics.trayDiscRing
        return Button {
            tap(item)
        } label: {
            ContentPicture(image: item.image, color: nil, size: side)
                .frame(width: side, height: side)
                .clipShape(Circle())
                .opacity(limited ? ExplorerMetrics.triedOpacity : 1)
                .padding(LessonMetrics.trayDiscRing)
                .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.onDark, in: Circle())
                .overlay(alignment: .topTrailing) {
                    if limited {
                        FoldFlapShape(fold: Tokens.Shape.foldCornerS * 2)
                            .fill(Tokens.Role.feedbackWrong)
                            .frame(width: Tokens.Shape.foldCornerS * 2, height: Tokens.Shape.foldCornerS * 2)
                            .paperDropShadow(Tokens.Shadow.dropFold)
                            .accessibilityHidden(true)
                    }
                }
        }
        .buttonStyle(.paperPress)
        .accessibilityLabel(Text("lesson.play.remove \(spokenLabel(item.label))"))
        .accessibilityIdentifier("lesson.tray.\(item.key)")
    }

    /// A tapped food says its name (SK-016). Explorer (SK-040 lượt 2): its name, then the
    /// mascot's new message, read by itself after every tap.
    private func tap(_ item: TrayItem) {
        session.tapTrayItem(item.key)
        speech?.play(session.explorerTrayTapUtterance(item))
    }

    /// VoiceOver label of a food: the English name (SK-012: choices read their EN label), then
    /// the name shown on screen when it is another language ("Rice, Cơm").
    private func spokenLabel(_ label: Spoken) -> String {
        let shown = mode.name(label)
        return shown == label.en ? label.en : "\(label.en), \(shown)"
    }

    /// One chip per required group (đỏ son with a check when the tray has it), in `groups` order,
    /// and the folded "limit" slip when the tray has a limited food.
    private var meters: some View {
        // SK-043 Explorer-A, Discoverer A2: the limit pick shows by its faded photo and folded
        // corner, no word.
        WrapLayout(spacing: Tokens.Space.s8) {
            ForEach(tray.groups.filter { $0.role == .required }, id: \.key) { group in
                explorerChip(group, ok: !(state?.missing.contains(group.key) ?? true))
            }
        }
    }

    /// The things to choose from (4 columns, `layout.grid.play`); on the tray → vàng hoè piece and seal.
    /// Nothing on the shelf tells an item's group before the child picks it (SK-031, kệ trung
    /// tính): every stand-in picture is the same giấy lõm piece (`color: nil`, as a quiz option),
    /// and a real picture (SK-033) lies on the cell's own paper with no coloured piece under it,
    /// the order is the session's shuffle (`shelfItems`), and VoiceOver reads the item's name only.
    /// The group shows after the pick: the dot on the tray, the chips, the mascot's message.
    private var shelf: some View {
        pictureShelf
    }

    /// SK-043 hướng A, Explorer: three columns of big pictures (`110 × 116`), no word; the tap
    /// says the name and puts it on the tray.
    private var pictureShelf: some View {
        let columns = Array(repeating: GridItem(.flexible(), spacing: Tokens.Space.s10),
                            count: metrics.isRegular ? PictureBookMetrics.shelfColumnsRegular : PictureBookMetrics.shelfColumns)
        let cell = metrics.isRegular ? PictureBookMetrics.shelfPictureRegular : PictureBookMetrics.shelfPicture
        return LazyVGrid(columns: columns, spacing: Tokens.Space.s10) {
            ForEach(Array(session.shelfItems.enumerated()), id: \.element.key) { index, item in
                let onTray = state?.tray.contains(item.key) ?? false
                Button {
                    tap(item)
                } label: {
                    ContentPicture(image: item.image, color: nil, size: cell - 2 * Tokens.Space.s6, box: .fillWidth)
                        .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.explorer - Tokens.Space.s6, style: .continuous))
                        .padding(Tokens.Space.s6)
                        .frame(maxWidth: .infinity, minHeight: cell)
                }
                .buttonStyle(PaperChoiceStyle(state: onTray ? .selected : .idle))
                .accessibilityLabel(Text(verbatim: spokenLabel(item.label)))
                .accessibilityAddTraits(onTray ? .isSelected : [])
                .accessibilityIdentifier("lesson.shelf.\(item.key)")
                .overlay(alignment: .topTrailing) {
                    if onTray {
                        Seal(icon: .check)
                            .padding(LessonMetrics.shelfSealInset)
                            .allowsHitTesting(false)
                    }
                }
                .reveal(order: index, step: Tokens.Motion.Stagger.stepDense)
            }
        }
        .padding(.trailing, metrics.gridTrailingInset)
        .padding(.bottom, metrics.gridTrailingInset)
    }
}

extension PlayStep {
    /// Explorer group chip (SK-040 lượt 2): the group's colour dot before its name, a button that
    /// says the name; lá tre with a check once the tray has the group. At least 72pt high.
    fileprivate func explorerChip(_ group: TrayGroup, ok: Bool) -> some View {
        Button {
            speech?.play(session.utterance("play.group.\(group.key)", group.label))
        } label: {
            HStack(spacing: Tokens.Space.s6) {
                ZStack {
                    Circle().fill(group.color.color)
                    if ok {
                        PaperIconView(.check, size: LessonMetrics.meterCheck, color: Tokens.Role.textOnAccent)
                    }
                }
                .frame(width: PictureBookMetrics.chipDot, height: PictureBookMetrics.chipDot)
                // Discoverer A2: "Cả hai" prints English only (the sentence language).
                Text(verbatim: session.isExplorer ? mode.name(group.label) : mode.sentence(group.label))
                    .typography(Tokens.Typography.bodyStrong, fixedBox: true)
                    .lineLimit(1)
                    .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                    .foregroundStyle(ok ? Tokens.Role.textOnAccent : Tokens.Role.textPrimary)
            }
            .padding(.horizontal, Tokens.Space.s10)
            .frame(minHeight: ageGroup.touchTarget)
            // SK-043 Explorer-A: "chip nhóm 72 giữ như SK-040".
            .paperSurface(ok ? Tokens.Role.feedbackCorrect : Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: session.isExplorer ? Tokens.Radius.explorer : Tokens.Radius.discoverer)
        }
        .buttonStyle(.paperPress)
        .accessibilityLabel(Text(verbatim: spokenLabel(group.label)))
        .accessibilityValue(Text(ok ? "lesson.play.meter_ok" : "lesson.play.meter_missing"))
        .accessibilityAddTraits(.startsMediaSession)
        .accessibilityIdentifier("lesson.meter.\(group.key)")
    }
}

/// The tray of the canvas: an oval in gỉ đồng, its lower half darker.
private struct TrayOval: View {
    var body: some View {
        ZStack {
            Ellipse().fill(Tokens.Palette.giDongDeep)
            Ellipse().fill(Tokens.Palette.giDong).clipShape(TopHalf())
        }
    }

    private struct TopHalf: SwiftUI.Shape {
        func path(in rect: CGRect) -> Path {
            Path(CGRect(x: rect.minX, y: rect.minY, width: rect.width, height: rect.height / 2))
        }
    }
}
