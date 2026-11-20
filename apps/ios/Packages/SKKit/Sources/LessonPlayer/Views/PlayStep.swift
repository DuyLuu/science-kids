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
///
/// SK-059 (Duy 19/11, design `x59-*` / `d59-*`), Explorer and Discoverer:
/// - A tap on a shelf picture opens it big (`PlayZoomSheet`): the whole photo, its name, a
///   speaker, a close button; the tray does not change. An item already picked opens too.
/// - A long press (0.3 s, the finger still) lifts the picture; dropped on the tray it is picked
///   (`LessonSession.addToTray`, the old tap's engine call); dropped anywhere else, or on a full
///   tray (message `full`), it slides back. A picked item does not lift from the shelf.
/// - A tap on a picked item in the tray takes it off (as before); dragging it out does too.
/// - The drag stays in the app (a SwiftUI gesture, not a system drag): Split View gets nothing.
/// - VoiceOver: double tap = see it big; actions "Pick it" / "Remove it".
/// - First time per child on this device: the mascot's hint and the hand; again once after three
///   big views with no pick (`PlayHintState`).
struct PlayStep<Header: View>: View {
    let session: LessonSession
    let tray: BuildTray
    @ViewBuilder let header: Header
    @Environment(\.layoutMetrics) private var metrics
    @Environment(\.speechPlayer) private var speech
    @Environment(\.ageGroup) private var ageGroup
    @ReducedMotion private var reduced

    @State private var zoomKey: String?
    @State private var drag: PlayDragging?
    @State private var frames: [String: CGRect] = [:]
    @State private var trayFrame: CGRect = .zero
    @State private var visibleBottom: CGFloat?
    @State private var shelfTop: CGFloat?
    @State private var hint = PlayHintState(firstTime: false)
    @State private var hintChecked = false
    @State private var liftCount = 0
    @State private var overTrayCount = 0
    @State private var nudge = 0
    /// (1) The bubble's height with the hint and with the lesson's own message (measured hidden
    /// under the hint), so the shelf is laid out for the message, not the hint.
    @State private var hintRowHeight: CGFloat?
    @State private var messageRowHeight: CGFloat?
    /// The shelf's grid, decided once per screen (no jump when the message changes).
    @State private var lockedShelf: PlayShelfLayout.Shelf?
    /// (2) VoiceOver goes back to the cell the big view was opened from.
    @AccessibilityFocusState private var focusedCell: String?
    /// (5) The big view grows from its cell: the cell's centre on the screen.
    @State private var zoomAnchor: UnitPoint = .center
    @State private var screenSize: CGSize = .zero
    /// The long press that lifted this item also ends as a tap on its button: skip that tap.
    @State private var skipTap: String?
    @GestureState private var pressing = false

    private var mode: LanguageMode { session.languageMode }
    /// Discoverer A2: "Cả hai" prints English only.
    private var showsSecond: Bool { session.isExplorer && session.showsSecondLanguage }
    private var state: TrayState? { session.trayState }
    private var picked: [String] { state?.tray ?? [] }
    private var isFull: Bool { picked.count >= tray.capacity }
    /// Round 2 (designer 19/11): the compact layout above the shelf.
    private var layout: PlayLayout { PlayLayout.of(ageGroup) }
    private var succeeded: Bool { state?.success == true }

    var body: some View {
        PaperFrame(scrolls: true) {
            VStack(alignment: .leading, spacing: layout.rowGap) {
                header
                    // Round 2: the companion moved from the message row into the header's right slot.
                    .overlay(alignment: .bottomTrailing) {
                        Image((succeeded ? ExplorerMood.happy : ExplorerMood.talk).imageName, bundle: .main)
                            .resizable()
                            .scaledToFit()
                            .frame(width: layout.companion, height: layout.companion)
                            .paperDropShadow(Tokens.Shadow.dropTag)
                            .frame(width: ageGroup.touchTarget, alignment: .center)
                            .accessibilityHidden(true)
                    }
                    .reveal(order: 0)
                message.reveal(order: 1)
                trayRow.reveal(order: 2)
                meters.reveal(order: 3)
                shelf.reveal(order: 4)
            }
            .coordinateSpace(.named(PlayDragMetrics.space))
            .overlay(alignment: .topLeading) { floating }
            .overlay(alignment: .topLeading) { hintHand }
        }
        .scrollDisabled(drag != nil)
        .onGeometryChange(for: CGFloat.self) { proxy in
            proxy.frame(in: .global).maxY - proxy.safeAreaInsets.bottom
        } action: { bottom in
            visibleBottom = bottom
        }
        .onGeometryChange(for: CGSize.self) { $0.size } action: { screenSize = $0 }
        .overlay {
            if let key = zoomKey, let item = item(key) {
                PlayZoomSheet(
                    item: item, picked: picked.contains(key), isExplorer: session.isExplorer, mode: mode,
                    showsSecond: showsSecond, onListen: { sayName(item) }, onClose: closeZoom
                )
                .transition(reduced ? .opacity : .scale(scale: PlayDragMetrics.zoomFromScale, anchor: zoomAnchor).combined(with: .opacity))
                .zIndex(1)
            }
        }
        .sensoryFeedback(.impact(weight: .light), trigger: liftCount)
        .sensoryFeedback(.selection, trigger: overTrayCount)
        .onChange(of: pressing) { _, now in
            // The gesture was cancelled (a call, the system): the lifted item goes back.
            if !now, let drag, !drag.returning, !drag.landing { slideBack() }
        }
        .onChange(of: state?.message.code) { _, code in
            // Content-editor 19/11: the picks bob once while `full` / `has_limited` says "tap one".
            if code == TrayMessage.full.code || code == TrayMessage.hasLimited.code, !reduced { nudge += 1 }
        }
        .onAppear(perform: startHint)
    }

    // MARK: Bubble and hint

    /// The mascot says the tray's message (`messages`, chosen by the engine); its listen button at
    /// the end of the row. The message plays by itself when Chơi opens (`autoplayUtterance`), not
    /// after each tap. SK-059: while the hint shows, the bubble says the hint instead.
    @ViewBuilder private var message: some View {
        if let line = hint.showing {
            let spoken = PlayHintText.spoken(line, explorer: session.isExplorer)
            PlayBubbleRow(
                text: spoken, mode: mode, showsSecond: showsSecond,
                listen: PlayHintText.utterance(line, explorer: session.isExplorer, session: session), layout: layout,
                bubbleIdentifier: "lesson.play.hint"
            )
            .id("hint.\(line)")
            .onGeometryChange(for: CGFloat.self) { $0.size.height } action: { hintRowHeight = $0 }
            .background(alignment: .top) {
                // The lesson's message, laid out but not shown: its height sizes the shelf.
                if let text = bubbleText {
                    lessonRow(text).hidden()
                        .onGeometryChange(for: CGFloat.self) { $0.size.height } action: { messageRowHeight = $0 }
                }
            }
        } else if let text = bubbleText {
            lessonRow(text)
                .id(state?.message.code)
                .onGeometryChange(for: CGFloat.self) { $0.size.height } action: { height in
                    if messageRowHeight == nil { messageRowHeight = height }
                }
        }
    }

    /// The bubble with its speaker (round 2: compact, the companion is in the header).
    private func lessonRow(_ text: Spoken) -> some View {
        PlayBubbleRow(text: text, mode: mode, showsSecond: showsSecond, listen: session.utterance("play.message", text), layout: layout,
                      bubbleIdentifier: "lesson.play.message")
    }

    /// Discoverer A2 (`play-start`): before the first pick the bubble prints the tray's prompt
    /// (one short sentence) instead of `messages.start`; the opening voice says both.
    private var bubbleText: Spoken? {
        if !session.isExplorer, state.map({ $0.tray.isEmpty }) ?? true { return tray.prompt }
        return session.trayMessage
    }

    private func startHint() {
        guard !hintChecked else { return }
        hintChecked = true
        guard session.playHintFirstTime else { return }
        hint = PlayHintState(firstTime: true)
        session.markPlayHintSeen()
        // The hint goes before the lesson's own opening line (prompt + message), in one go.
        let hintVoice = PlayHintText.utterance(.first, explorer: session.isExplorer, session: session)
        let opening = session.autoplayUtterance(for: .play)
        // No app-line clip in this build: leave the step's own opening voice alone.
        guard !hintVoice.isEmpty else { return }
        speech?.autoplay(Utterance(id: "play.hint.opening", clips: hintVoice.clips + (opening?.clips ?? [])))
    }

    /// The hand of the hint (`ArtHintHand`, fingertip at 26, 5): it taps the first shelf picture,
    /// then holds it and drags it to the tray, twice (`PlayHintHand`); Reduce Motion: still.
    @ViewBuilder private var hintHand: some View {
        if hint.showing != nil, let first = session.shelfItems.first, let from = frames[PlayDragPayload(key: first.key, source: .shelf).encoded], trayFrame != .zero {
            PlayHintHand(from: CGPoint(x: from.midX, y: from.midY), to: CGPoint(x: trayFrame.midX, y: trayFrame.midY), reduced: reduced) {
                hint.dismiss()
            }
            .allowsHitTesting(false)
            .accessibilityHidden(true)
        }
    }

    // MARK: Tray

    /// "Em đã chọn": the tray (gỉ đồng oval), the picks on it (tap to take off), the empty places.
    /// SK-059: lights up while a shelf picture is over it (vàng hoè piece, the next place vàng hoè).
    /// Round 2: the tray, and at its right the arrow to the quiz once the tray succeeds (no
    /// bottom bar: it took the shelf's room just when the child was done). The arrow pops in.
    private var trayRow: some View {
        HStack(spacing: layout.arrowGap) {
            trayPlate
            if succeeded {
                ExplorerNextButton(label: "lesson.explorer.play.next", action: session.advance)
                    .frame(width: layout.arrow.width, height: layout.arrow.height)
                    .accessibilityIdentifier("lesson.play.done")
                    .transition(reduced ? .identity : .scale.combined(with: .opacity))
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.trailing, metrics.gridTrailingInset)
        .animation(reduced ? nil : .timingCurve(0.2, 0.8, 0.2, 1, duration: PlayDragMetrics.zoomOpen), value: succeeded)
    }

    private var trayPlate: some View {
        let lit = drag.map { $0.payload.source == .shelf && $0.overTray && !$0.returning } ?? false && !isFull
        let width = layout.trayWidth(capacity: tray.capacity)
        return ZStack {
            if lit {
                Capsule()
                    .fill(Tokens.Palette.vangHoe)
                    .frame(width: width, height: layout.trayHeight)
                    .offset(x: PlayDragMetrics.litOffset.width, y: PlayDragMetrics.litOffset.height)
                    .accessibilityHidden(true)
            }
            PlayTrayCapsule()
                .frame(width: width, height: layout.trayHeight)
                .paperDropShadow(Tokens.Shadow.paper2)
                .accessibilityHidden(true)
            HStack(spacing: layout.slotGap) {
                ForEach(picked, id: \.self) { key in
                    if let item = tray.items.first(where: { $0.key == key }) {
                        trayItem(item).motion(Tokens.Motion.Preset.pop)
                    }
                }
                ForEach(0..<max(0, tray.capacity - picked.count), id: \.self) { index in
                    let next = lit && index == 0
                    // The empty place (70 / 58); the next one, while a picture is over the tray, is a
                    // vàng hoè disc as big as a picked one (78 / 64).
                    let side = next ? layout.disc : layout.emptySlot
                    let slot = Circle()
                        .fill(next ? Tokens.Palette.vangHoe : Tokens.Role.surfaceSunken)
                        .frame(width: side, height: side)
                        .paperSurface(next ? Tokens.Palette.vangHoe : Tokens.Role.surfaceSunken, shadow: Tokens.Shadow.sunken, in: Circle())
                        .frame(width: layout.disc, height: layout.disc)
                        .scaleEffect(next ? PlayDragMetrics.nextSlotScale : 1)
                        .accessibilityHidden(true)
                    slot.onGeometryChange(for: CGRect.self) { $0.frame(in: .named(PlayDragMetrics.space)) } action: { frames["slot:\(index)"] = $0 }
                }
            }
        }
        .scaleEffect(lit ? PlayDragMetrics.litTrayScale : 1)
        .animation(reduced ? nil : .easeOut(duration: PlayDragMetrics.lightUp), value: lit)
        .onGeometryChange(for: CGRect.self) { $0.frame(in: .named(PlayDragMetrics.space)) } action: { trayFrame = $0 }
        .accessibilityElement(children: .contain)
        .accessibilityLabel(Text("lesson.play.tray_a11y \(picked.count) \(tray.capacity)"))
        .accessibilityIdentifier("lesson.play.tray")
    }

    /// SK-043 Explorer-A: the photo fills the round place (96); a `limit` pick is faded with a
    /// folded corner, no word. SK-059: a tap takes it off; a long press lifts it to drag it out.
    private func trayItem(_ item: TrayItem) -> some View {
        let group = tray.groups.first { $0.key == item.group }
        let limited = group?.role == .limit
        let side = layout.disc - 2 * layout.discRing
        let payload = PlayDragPayload(key: item.key, source: .tray)
        return Button {
            if skipTap == payload.encoded { skipTap = nil; return }
            hint.dismiss()
            session.removeFromTray(item.key)
            speech?.play(session.explorerTrayTapUtterance(item))
        } label: {
            ContentPicture(image: item.image, color: nil, size: side)
                .frame(width: side, height: side)
                .clipShape(Circle())
                .opacity(limited ? ExplorerMetrics.triedOpacity : 1)
                .padding(layout.discRing)
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
                .phaseAnimator([1.0, PlayDragMetrics.nudgeScale, 1.0], trigger: nudge) { view, scale in
                    view.scaleEffect(scale)
                } animation: { _ in .easeInOut(duration: PlayDragMetrics.nudgeStep) }
        }
        .buttonStyle(.paperPress)
        .opacity(drag?.payload == payload ? 0 : 1)
        .onGeometryChange(for: CGRect.self) { $0.frame(in: .named(PlayDragMetrics.space)) } action: { frames[payload.encoded] = $0 }
        .simultaneousGesture(liftGesture(payload))
        .accessibilityLabel(Text("lesson.play.remove \(spokenLabel(item.label))"))
        .accessibilityIdentifier("lesson.tray.\(item.key)")
    }

    /// VoiceOver label of a food: the English name (SK-012: choices read their EN label), then
    /// the name shown on screen when it is another language ("Rice, Cơm").
    private func spokenLabel(_ label: Spoken) -> String {
        let shown = mode.name(label)
        return shown == label.en ? label.en : "\(label.en), \(shown)"
    }

    // MARK: Chips

    /// One chip per required group (lá tre with a check when the tray has it), in `groups` order.
    /// SK-059 (designer 19/11): three groups or fewer share one row, equal widths (so a 2-column
    /// shelf fits under them); more wrap as before.
    @ViewBuilder private var meters: some View {
        let required = tray.groups.filter { $0.role == .required }
        if required.count <= PlayShelfLayout.evenChipsMax {
            HStack(spacing: Tokens.Space.s8) {
                ForEach(required, id: \.key) { group in
                    explorerChip(group, ok: !(state?.missing.contains(group.key) ?? true), even: true)
                }
            }
            .padding(.trailing, metrics.gridTrailingInset)
        } else {
            WrapLayout(spacing: Tokens.Space.s8) {
                ForEach(required, id: \.key) { group in
                    explorerChip(group, ok: !(state?.missing.contains(group.key) ?? true), even: false)
                }
            }
        }
    }

    // MARK: Shelf

    /// The things to choose from. Nothing on the shelf tells an item's group before the child
    /// picks it (SK-031, kệ trung tính): same paper for every picture, the session's shuffle
    /// (`shelfItems`), VoiceOver reads the name only. SK-059: the columns follow
    /// `PlayShelfLayout` (2 big columns when the items fit the first screen).
    private var shelf: some View {
        let layout = lockedShelf ?? PlayShelfLayout.shelf(itemCount: session.shelfItems.count, isRegular: metrics.isRegular, room: shelfRoom)
        let columns = Array(repeating: GridItem(.flexible(), spacing: PlayShelfLayout.gap), count: layout.columns)
        return LazyVGrid(columns: columns, spacing: PlayShelfLayout.gap) {
            ForEach(Array(session.shelfItems.enumerated()), id: \.element.key) { index, item in
                shelfCell(item, cell: layout.cell)
                    .reveal(order: index, step: Tokens.Motion.Stagger.stepDense)
            }
        }
        .onGeometryChange(for: CGFloat.self) { $0.frame(in: .global).minY } action: { top in
            // Measured once, with the page at the top: the room of the first screen.
            if shelfTop == nil { shelfTop = top }
        }
        .onChange(of: shelfRoom) { _, room in
            guard lockedShelf == nil, let room else { return }
            lockedShelf = PlayShelfLayout.shelf(itemCount: session.shelfItems.count, isRegular: metrics.isRegular, room: room)
        }
        .padding(.trailing, metrics.gridTrailingInset)
        .padding(.bottom, metrics.gridTrailingInset)
    }

    /// Room under the chips on the first screen, above the bottom margin (round 2: no bottom bar),
    /// with the lesson's message in the bubble: while the hint shows, its extra height is given
    /// back. `nil` until everything is measured.
    private var shelfRoom: CGFloat? {
        guard let visibleBottom, let shelfTop else { return nil }
        var hintExtra: CGFloat = 0
        if hint.showing != nil {
            guard let hintRowHeight, let messageRowHeight else { return nil }
            hintExtra = hintRowHeight - messageRowHeight
        }
        return visibleBottom - shelfTop + hintExtra - layout.bottomMargin
    }

    private func shelfCell(_ item: TrayItem, cell: CGFloat) -> some View {
        let onTray = picked.contains(item.key)
        let payload = PlayDragPayload(key: item.key, source: .shelf)
        let lifted = drag?.payload == payload
        let radius = Tokens.Radius.explorer - Tokens.Space.s6
        return Button {
            if skipTap == payload.encoded { skipTap = nil; return }
            openZoom(item)
        } label: {
            ContentPicture(image: item.image, color: nil, size: cell - 2 * Tokens.Space.s6, box: .fillWidth)
                .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
                .padding(Tokens.Space.s6)
                .frame(maxWidth: .infinity, minHeight: cell)
        }
        .buttonStyle(PaperChoiceStyle(state: onTray ? .selected : .idle))
        .opacity(lifted ? 0 : 1)
        .background {
            // The lifted picture leaves a hole (diệp thẫm, sunken) so the shelf does not move.
            if lifted {
                RoundedRectangle(cornerRadius: Tokens.Radius.explorer, style: .continuous)
                    .fill(Tokens.Role.surfaceSunken)
                    .paperShadow(Tokens.Shadow.sunken, in: RoundedRectangle(cornerRadius: Tokens.Radius.explorer, style: .continuous))
            }
        }
        .overlay(alignment: .topTrailing) {
            if onTray {
                Seal(icon: .check)
                    .padding(LessonMetrics.shelfSealInset)
                    .allowsHitTesting(false)
            }
        }
        .onGeometryChange(for: CGRect.self) { $0.frame(in: .named(PlayDragMetrics.space)) } action: { frames[payload.encoded] = $0 }
        .onGeometryChange(for: CGRect.self) { $0.frame(in: .global) } action: { frames["global:" + payload.encoded] = $0 }
        .accessibilityFocused($focusedCell, equals: item.key)
        // A picked item does not lift from the shelf (SK-059 §2): it only opens big.
        .simultaneousGesture(liftGesture(payload), including: onTray ? .subviews : .all)
        .accessibilityLabel(Text(verbatim: spokenLabel(item.label)))
        .accessibilityValue(onTray ? Text("lesson.play.a11y.picked") : Text(verbatim: ""))
        .accessibilityHint(Text("lesson.play.a11y.shelf_hint"))
        .accessibilityAddTraits(onTray ? .isSelected : [])
        .accessibilityAction(named: Text(onTray ? "lesson.play.a11y.unpick" : "lesson.play.a11y.pick")) {
            if onTray { session.removeFromTray(item.key) } else if session.addToTray(item.key) { hint.didPick() }
            announceMessage()
        }
        .accessibilityIdentifier("lesson.shelf.\(item.key)")
    }

    private func item(_ key: String) -> TrayItem? {
        tray.items.first { $0.key == key }
    }

    // MARK: Zoom

    private func openZoom(_ item: TrayItem) {
        hint.dismiss()
        if let cell = frames["global:" + PlayDragPayload(key: item.key, source: .shelf).encoded], screenSize.width > 0, screenSize.height > 0 {
            zoomAnchor = UnitPoint(x: cell.midX / screenSize.width, y: cell.midY / screenSize.height)
        }
        withAnimation(reduced ? .easeInOut(duration: PlayDragMetrics.zoomReduced) : .timingCurve(0.2, 0.8, 0.2, 1, duration: PlayDragMetrics.zoomOpen)) {
            zoomKey = item.key
        }
        sayName(item)
    }

    private func sayName(_ item: TrayItem) {
        speech?.play(session.utterance("play.name.\(item.key)", item.label))
    }

    private func closeZoom() {
        speech?.stop()
        let opened = zoomKey
        withAnimation(reduced ? .easeInOut(duration: PlayDragMetrics.zoomReduced) : .easeIn(duration: PlayDragMetrics.zoomClose)) {
            zoomKey = nil
        }
        hint.zoomClosed()
        // VoiceOver: back on the cell the big view came from (designer 19/11).
        if let opened {
            Task { @MainActor in
                try? await Task.sleep(for: .milliseconds(300))
                focusedCell = opened
            }
        }
        // Content-editor 19/11: `hint.again` plays after the third big view closes, never over
        // the item's name.
        if hint.showing == .again {
            speech?.play(PlayHintText.utterance(.again, explorer: session.isExplorer, session: session))
        }
    }

    // MARK: Drag

    /// Long press (0.3 s, at most 10 pt of movement: more is a scroll), then drag in the step's
    /// coordinate space.
    private func liftGesture(_ payload: PlayDragPayload) -> some Gesture {
        LongPressGesture(minimumDuration: PlayDragMetrics.holdDuration, maximumDistance: PlayDragMetrics.holdSlop)
            .sequenced(before: DragGesture(minimumDistance: 0, coordinateSpace: .named(PlayDragMetrics.space)))
            .updating($pressing) { value, active, _ in
                if case .second(true, _) = value { active = true }
            }
            .onChanged { value in
                guard case .second(true, let move) = value else { return }
                lift(payload, to: move?.location)
            }
            .onEnded { value in
                if case .second(true, let move?) = value {
                    drop(at: move.location)
                } else if drag != nil {
                    slideBack()
                }
            }
    }

    private func lift(_ payload: PlayDragPayload, to point: CGPoint?) {
        if var current = drag, current.payload == payload, !current.returning, !current.landing {
            guard let point else { return }
            current.location = point
            let over = PlayDrop.at(point, trayFrame: trayFrame) == .tray
            if over != current.overTray, over { overTrayCount += 1 }
            current.overTray = over
            drag = current
            return
        }
        guard drag == nil, let home = frames[payload.encoded] else { return }
        hint.dismiss()
        skipTap = payload.encoded
        liftCount += 1
        drag = PlayDragging(payload: payload, home: home, location: point ?? CGPoint(x: home.midX, y: home.midY))
    }

    private func drop(at point: CGPoint) {
        guard let current = drag, !current.returning, !current.landing, let item = item(current.payload.key) else { return }
        let place = PlayDrop.at(point, trayFrame: trayFrame)
        switch place.effect(of: current.payload, onTray: picked.contains(item.key)) {
        case .add:
            if picked.count < tray.capacity, !reduced, let slot = frames["slot:0"] {
                // (4) Into the next place, 220 ms, then it is picked (the place pops as before).
                var landing = current
                landing.landing = true
                drag = landing
                withAnimation(.easeOut(duration: PlayDragMetrics.flyIn)) {
                    drag?.location = CGPoint(x: slot.midX, y: slot.midY)
                } completion: {
                    pick(item)
                    if drag?.landing == true { drag = nil }
                }
            } else if session.addToTray(item.key) {
                hint.didPick()
                drag = nil
                speech?.play(session.explorerTrayTapUtterance(item))
                announceMessage()
            } else {
                slideBack()  // full: the engine's `full` message, the picture goes home
                speech?.play(session.explorerTrayTapUtterance(item))
                announceMessage()
            }
        case .remove:
            session.removeFromTray(item.key)
            drag = nil
            speech?.play(session.explorerTrayTapUtterance(item))
            announceMessage()
        case .none:
            slideBack()
        }
        clearSkipTapSoon()
    }

    private func pick(_ item: TrayItem) {
        if session.addToTray(item.key) { hint.didPick() }
        speech?.play(session.explorerTrayTapUtterance(item))
        announceMessage()
    }

    /// Back to its place (`lay`-like 280 ms); Reduce Motion: shown at its place at once.
    private func slideBack() {
        guard var current = drag else { return }
        guard !reduced else { drag = nil; return }
        current.returning = true
        current.overTray = false
        drag = current
        withAnimation(.timingCurve(0.2, 0.8, 0.2, 1, duration: PlayDragMetrics.slideBack)) {
            drag?.location = CGPoint(x: current.home.midX, y: current.home.midY)
        } completion: {
            if drag?.returning == true { drag = nil }
        }
        clearSkipTapSoon()
    }

    /// A long press with no move ends as the button's tap right after; later taps count again.
    private func clearSkipTapSoon() {
        Task { @MainActor in
            try? await Task.sleep(for: .milliseconds(400))
            skipTap = nil
        }
    }

    /// The lifted picture, under the finger: ×1.08, −3°, `offset_accent`; over the tray, smaller
    /// (×0.7) so the vàng hoè place shows.
    @ViewBuilder private var floating: some View {
        if let current = drag, let item = item(current.payload.key) {
            let over = current.overTray && !current.returning
            let shape = RoundedRectangle(cornerRadius: Tokens.Radius.explorer, style: .continuous)
            ContentPicture(image: item.image, color: nil, size: current.home.height - 2 * Tokens.Space.s6, box: .fillWidth)
                .clipShape(RoundedRectangle(cornerRadius: Tokens.Radius.explorer - Tokens.Space.s6, style: .continuous))
                .padding(Tokens.Space.s6)
                .frame(width: current.home.width, height: current.home.height)
                .background(shape.fill(Tokens.Role.surfacePaper))
                .paperShadow(Tokens.Shadow.offsetAccent, in: shape)
                .scaleEffect(current.returning ? 1 : (over || current.landing ? PlayDragMetrics.overTrayScale : PlayDragMetrics.liftScale))
                .rotationEffect(.degrees(current.returning || current.landing ? 0 : PlayDragMetrics.liftTilt))
                .animation(reduced ? nil : .easeOut(duration: PlayDragMetrics.lightUp), value: over)
                .position(current.location)
                .allowsHitTesting(false)
                .accessibilityHidden(true)
        }
    }

    /// After a VoiceOver action or a drop, the new message is read (designer 19/11).
    private func announceMessage() {
        guard let text = session.trayMessage else { return }
        AccessibilityNotification.Announcement(mode.sentence(text)).post()
    }
}

/// A picture being dragged: where it came from, where it is.
struct PlayDragging: Equatable {
    let payload: PlayDragPayload
    let home: CGRect
    var location: CGPoint
    var overTray = false
    var returning = false
    /// Flying into its place on the tray (220 ms) before it is picked.
    var landing = false
}

/// Numbers of the drag and the big view (designer 19/11, SK-059 "Chuyển động").
enum PlayDragMetrics {
    /// The step's coordinate space: the shelf, the tray and the lifted picture are measured in it.
    static let space = "lesson.play"
    static let holdDuration: Double = 0.3
    static let holdSlop: CGFloat = 10
    static let liftScale: CGFloat = 1.08
    static let liftTilt: Double = -3
    static let overTrayScale: CGFloat = 0.7
    static let litTrayScale: CGFloat = 1.03
    static let litOffset = CGSize(width: 7, height: 8)
    static let nextSlotScale: CGFloat = 1.08
    static let lightUp: Double = 0.12
    static let slideBack: Double = 0.28
    static let flyIn: Double = 0.22
    /// The big view starts at this scale, from its cell's centre.
    static let zoomFromScale: CGFloat = 0.3
    static let zoomOpen: Double = 0.32
    static let zoomClose: Double = 0.24
    static let zoomReduced: Double = 0.15
    static let nudgeScale: CGFloat = 1.08
    static let nudgeStep: Double = 0.14
}

extension PlayStep {
    /// Explorer group chip (SK-040 lượt 2): the group's colour dot before its name, a button that
    /// says the name; lá tre with a check once the tray has the group. At least the age group's
    /// touch target high. `even` (SK-059): one of three equal chips on a row, dot 24, two lines.
    fileprivate func explorerChip(_ group: TrayGroup, ok: Bool, even: Bool) -> some View {
        Button {
            speech?.play(session.utterance("play.group.\(group.key)", group.label))
        } label: {
            HStack(spacing: Tokens.Space.s6) {
                ZStack {
                    Circle().fill(group.color.color)
                    if ok {
                        // SK-060: the check on the group's dot in its `text_on_content` (giấy on vàng hoè 2.02:1).
                        PaperIconView(.check, size: LessonMetrics.meterCheck, color: group.color.textColor)
                    }
                }
                .frame(width: even ? layout.chipDot : PictureBookMetrics.chipDot,
                       height: even ? layout.chipDot : PictureBookMetrics.chipDot)
                // Discoverer A2: "Cả hai" prints English only (the sentence language).
                let name = session.isExplorer ? mode.name(group.label) : mode.sentence(group.label)
                Group {
                    if even {
                        // SK-060 (finding 9): the label rule of SK-047 (`WordFitText`): a word is
                        // never broken ("Carbohydr / ates"); the label shrinks to fit two lines.
                        // `fixedBox` as the bank's word cards: the size follows Dynamic Type up to
                        // the fixed-box cap (audit "partially", allowed) instead of being refitted
                        // back down at every size (audit "unsupported", SK-060 run 20/11).
                        WordFitText(name, style: Tokens.Typography.bodyStrong, width: nil, maxLines: 2,
                                    fixedBox: true, alignment: .leading)
                    } else {
                        Text(verbatim: name)
                            .typography(Tokens.Typography.bodyStrong, fixedBox: true)
                            .lineLimit(1)
                            .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                            .multilineTextAlignment(.leading)
                    }
                }
                .foregroundStyle(ok ? Tokens.Role.textOnAccent : Tokens.Role.textPrimary)
            }
            .padding(.horizontal, even ? Tokens.Space.s8 : Tokens.Space.s10)
            .frame(maxWidth: even ? .infinity : nil, minHeight: ageGroup.touchTarget)
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
