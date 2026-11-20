import ContentKit
import ContentModel
import Foundation
import LessonEngine
import Testing
@testable import LessonPlayer

// SK-047, tester 16/11: in `SK047ShotsUITests`, the Chơi tray of Explorer `/07`
// (`con-trung-va-con-vat-nhieu-chan`) never showed its arrow after the harness tapped ant, spider
// and crab. On the real lesson the engine balances that tray; the UI hierarchy at the failure
// shows spider and crab on the tray, "You still need an animal with six legs.", and the ant on the
// shelf's third row at y 831–927 of an 852 pt screen: the tap on the ant landed under the bottom
// strip and never reached the app (see the ticket, "ios-dev 16/11 · sửa sau kiểm lại").

@MainActor
@Suite struct PlayTrayPackTests {
    /// `/07` as the harness played it: one animal of each required group balances the tray, in any
    /// order; without the ant the message is the one the screenshot showed.
    @Test(.enabled(if: EmbeddedPack.isBuilt))
    func insectTrayBalancesWithOneOfEachRequiredGroup() async throws {
        let library = try await EmbeddedPack.library()
        let lesson = try EmbeddedPack.lesson("goi-ten-va-nhom-dong-vat", "con-trung-va-con-vat-nhieu-chan", in: library)
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent("PlayTrayPackTests-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: directory) }
        let session = try packSession(lesson, presentation: .explorer, directory: directory)
        let tray = try #require(session.tray)
        #expect(tray.capacity == 3)
        #expect(tray.groups.filter { $0.role.rawValue == "required" }.map(\.key) == ["tray_six", "tray_eight", "tray_lots"])
        #expect(tray.items.count == 8, "eight pictures: three rows of the three-column shelf")
        #expect(Set(session.shelfItems.map(\.key)) == Set(tray.items.map(\.key)))

        for key in ["tray_ant", "tray_spider", "tray_crab"] { session.tapTrayItem(key) }
        let state = try #require(session.trayState)
        #expect(state.tray == ["tray_ant", "tray_spider", "tray_crab"])
        #expect(state.success, "the arrow `lesson.play.done` shows on success")
        #expect(state.message == .balanced)
        #expect(session.trayMessage == tray.messages.balanced)

        for order in [["tray_crab", "tray_ant", "tray_spider"], ["tray_spider", "tray_crab", "tray_ant"]] {
            #expect(try buildTray(block: tray.trayRules, tray: [], taps: order).get().success, "\(order)")
        }
        // The screen of the failure: the ant's tap lost, spider and crab on the tray.
        let withoutAnt = try buildTray(block: tray.trayRules, tray: [], taps: ["tray_spider", "tray_crab"]).get()
        #expect(!withoutAnt.success)
        #expect(withoutAnt.message == .missing(group: "tray_six"))
        #expect(tray.text(for: withoutAnt.message)?.en == "You still need an animal with six legs.")
        // A tap on a picture already on the tray takes it off (a resumed attempt the harness taps again).
        #expect(try buildTray(block: tray.trayRules, tray: ["tray_ant"], taps: ["tray_ant"]).get().tray.isEmpty)
    }

    /// Every tray of the pack (20/11, SK-061 pack with "Bầu trời ngày và đêm": 104 trays, 64 Explorer,
    /// 40 Discoverer; counted from `content/.build/pack`): one item of each required group, in the
    /// content's order or the other way round, balances; no required group is empty and the tray
    /// has room for one of each. So the harness' choice is right for every lesson.
    @Test(.enabled(if: EmbeddedPack.isBuilt))
    func everyPackTrayBalancesWithOneOfEachRequiredGroup() async throws {
        let library = try await EmbeddedPack.library()
        var trays = 0
        var explorer = 0
        for topic in library.topics {
            for lesson in topic.lessons {
                guard case .buildTray(let tray) = lesson.play else { continue }
                trays += 1
                if topic.topic.ageGroup.rawValue == "explorer" { explorer += 1 }
                let required = tray.groups.filter { $0.role.rawValue == "required" }
                #expect(required.count <= tray.capacity, "\(lesson.slug)")
                let picks = required.compactMap { group in tray.items.first { $0.group == group.key }?.key }
                #expect(picks.count == required.count, "\(lesson.slug): a required group with no item")
                for taps in [picks, Array(picks.reversed())] {
                    let state = try buildTray(block: tray.trayRules, tray: [], taps: taps).get()
                    #expect(state.success, "\(lesson.slug) \(taps): \(state.message.code)")
                }
            }
        }
        #expect(trays == 104, "pack of 20/11 (SK-061)")
        #expect(explorer == 64, "pack of 20/11 (SK-061): 10 Explorer topics written")
    }
}
