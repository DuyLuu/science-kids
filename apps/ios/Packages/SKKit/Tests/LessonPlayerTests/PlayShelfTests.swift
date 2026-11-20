import CoreGraphics
import Foundation
import Testing
@testable import LessonPlayer

/// SK-059: the Chơi shelf (columns), the drag (payload, drop zone, what a drop does), the
/// first-time hint and its flag, and the session's add / remove used by drops and VoiceOver.
@Suite struct PlayShelfLayoutTests {
    /// iPhone, ≤ 6 items: 2 columns as high as the room allows (96…132); too little room: 3 × 96.
    @Test func compactTwoColumnsWhenTheyFit() {
        // `nui-song-va-bien/03` on iPhone 16: 6 items, about 400 pt under the chips.
        #expect(PlayShelfLayout.shelf(itemCount: 6, isRegular: false, room: 400) == .init(columns: 2, cell: 126.66666666666667))
        #expect(PlayShelfLayout.shelf(itemCount: 6, isRegular: false, room: 600) == .init(columns: 2, cell: 132), "at most 132")
        #expect(PlayShelfLayout.shelf(itemCount: 6, isRegular: false, room: 300) == .init(columns: 3, cell: 96), "below 96: three columns")
        #expect(PlayShelfLayout.shelf(itemCount: 4, isRegular: false, room: 220) == .init(columns: 2, cell: 105), "4 items: two rows")
        #expect(PlayShelfLayout.shelf(itemCount: 6, isRegular: false, room: nil) == .init(columns: 2, cell: 112), "not measured yet")
    }

    @Test func compactThreeColumnsAboveSix() {
        for count in [7, 8, 9] {
            #expect(PlayShelfLayout.shelf(itemCount: count, isRegular: false, room: 900) == .init(columns: 3, cell: 96))
        }
    }

    /// iPad (Duy 19/11): ≤ 6 items 3 columns of 150, more 4 columns of 124.
    @Test func regularColumns() {
        #expect(PlayShelfLayout.shelf(itemCount: 6, isRegular: true, room: nil) == .init(columns: 3, cell: 150))
        #expect(PlayShelfLayout.shelf(itemCount: 8, isRegular: true, room: 300) == .init(columns: 4, cell: 124))
    }
}

@Suite struct PlayDragTests {
    @Test func payloadRoundTrip() {
        let payload = PlayDragPayload(key: "tray_rice", source: .shelf)
        #expect(payload.encoded == "shelf:tray_rice")
        #expect(PlayDragPayload(encoded: payload.encoded) == payload)
        #expect(PlayDragPayload(encoded: "tray:a:b") == PlayDragPayload(key: "a:b", source: .tray))
        #expect(PlayDragPayload(encoded: "rice") == nil)
        #expect(PlayDragPayload(encoded: "shelf:") == nil)
        #expect(PlayDragPayload(encoded: "other:rice") == nil)
    }

    /// The drop zone is the tray grown by 16 pt.
    @Test func dropZone() {
        let tray = CGRect(x: 20, y: 200, width: 350, height: 120)
        #expect(PlayDrop.at(CGPoint(x: 190, y: 260), trayFrame: tray) == .tray)
        #expect(PlayDrop.at(CGPoint(x: 10, y: 190), trayFrame: tray) == .tray, "within 16 pt of the edge")
        #expect(PlayDrop.at(CGPoint(x: 190, y: 340), trayFrame: tray) == .outside)
        #expect(PlayDrop.at(CGPoint(x: 190, y: 600), trayFrame: tray) == .outside)
    }

    /// Shelf → tray adds; tray → outside removes; anything else slides back.
    @Test func dropEffects() {
        let shelf = PlayDragPayload(key: "k", source: .shelf)
        let tray = PlayDragPayload(key: "k", source: .tray)
        #expect(PlayDrop.tray.effect(of: shelf, onTray: false) == .add)
        #expect(PlayDrop.tray.effect(of: shelf, onTray: true) == .none)
        #expect(PlayDrop.outside.effect(of: shelf, onTray: false) == .none)
        #expect(PlayDrop.outside.effect(of: tray, onTray: true) == .remove)
        #expect(PlayDrop.tray.effect(of: tray, onTray: true) == .none, "dropped back on the tray: no change")
        #expect(PlayDrop.outside.effect(of: tray, onTray: false) == .none)
    }
}

@Suite struct PlayHintTests {
    @Test func firstTimeThenGone() {
        var hint = PlayHintState(firstTime: true)
        #expect(hint.showing == .first)
        hint.dismiss()
        #expect(hint.showing == nil)
        #expect(PlayHintState(firstTime: false).showing == nil)
    }

    /// Three big views closed with no pick: the reminder, once.
    @Test func reminderAfterThreeZoomsOnce() {
        var hint = PlayHintState(firstTime: false)
        hint.zoomClosed()
        hint.zoomClosed()
        #expect(hint.showing == nil)
        hint.zoomClosed()
        #expect(hint.showing == .again)
        hint.dismiss()
        for _ in 0..<5 { hint.zoomClosed() }
        #expect(hint.showing == nil, "not again in this attempt")
    }

    @Test func noReminderAfterAPick() {
        var hint = PlayHintState(firstTime: false)
        hint.zoomClosed()
        hint.didPick()
        hint.zoomClosed()
        hint.zoomClosed()
        #expect(hint.showing == nil)
    }

    /// The flag is per child, on this device; another child still sees the hint.
    @Test func storeIsPerChild() throws {
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent("PlayHint-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: directory) }
        let store = PlayHintStore(directory: directory)
        let an = UUID(), binh = UUID()
        #expect(!store.seen(childId: an))
        store.markSeen(childId: an)
        #expect(store.seen(childId: an))
        #expect(!store.seen(childId: binh))
        #expect(PlayHintStore(directory: directory).seen(childId: an), "kept in the file")
        store.markSeen(childId: an)
        let ids = try JSONDecoder().decode([String].self, from: Data(contentsOf: store.url))
        #expect(ids == [an.uuidString.lowercased()], "once, ids only")
    }

    /// The hint lines come from the app's string catalog, both languages.
    @Test func hintKeys() {
        #expect(PlayHintText.key(.first, explorer: true) == "lesson.play.hint.first.explorer")
        #expect(PlayHintText.key(.again, explorer: false) == "lesson.play.hint.again.discoverer")
    }
}

/// The session side of drops and VoiceOver actions: the engine's tap, never a toggle by mistake.
@MainActor
@Suite struct PlayTraySessionTests {
    @Test func addRemoveAndFull() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let session = harness.session()
        let tray = try #require(session.tray)
        #expect(session.addToTray("tray_rice"))
        #expect(!session.addToTray("tray_rice"), "already in: no change (the old tap would take it out)")
        #expect(session.trayState?.tray == ["tray_rice"])
        session.removeFromTray("tray_fish")
        #expect(session.trayState?.tray == ["tray_rice"], "not in: no change")
        session.removeFromTray("tray_rice")
        #expect(session.trayState?.tray == [])
        // Fill the tray, then one more: the tray stays, the engine says `full`.
        let keys = tray.items.map(\.key)
        for key in keys.prefix(tray.capacity) { session.addToTray(key) }
        let full = session.trayState?.tray
        #expect(full?.count == tray.capacity)
        if let extra = keys.dropFirst(tray.capacity).first {
            #expect(!session.addToTray(extra))
            #expect(session.trayState?.tray == full)
            #expect(session.trayState?.message == .full)
        }
    }

    /// The hint flag goes in the attempts' folder, per child.
    @Test func hintFlagPerChild() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let session = harness.session()
        #expect(session.playHintFirstTime)
        session.markPlayHintSeen()
        #expect(!session.playHintFirstTime)
        #expect(!harness.session().playHintFirstTime, "the next lesson or a new launch: not again")
    }
}
