import Foundation
import Testing
@testable import AudioKit

/// SK-060 finding 6: the end of a clip reaches the main actor late; it must never end the clip a
/// tap started in between.
@MainActor
struct ClipSlotsTests {
    final class Player {}

    /// The finish starts the next clip, which stops and adds players: it runs after `ended`
    /// returns, so the slots are free to change (the app crashed on a simultaneous access).
    @Test func theFinishMayStartTheNextClip() {
        var slots = ClipSlots<Player>()
        let first = Player(), second = Player()
        var finish: (@MainActor () -> Void)?
        slots.add(first) { finish = nil }
        finish = slots.ended(first)
        #expect(finish != nil)
        _ = slots.removeAll()
        slots.add(second) {}
        finish?()
        #expect(slots.players.count == 1 && slots.players[0] === second)
    }

    @Test func aPlayerThatEndsCallsItsFinishOnce() {
        var slots = ClipSlots<Player>()
        let player = Player()
        var ended = 0
        slots.add(player) { ended += 1 }
        slots.ended(player)?()
        let again = slots.ended(player)
        #expect(again == nil, "once")
        #expect(ended == 1)
        #expect(slots.players.isEmpty)
    }

    /// The question ends, a tap stops it and starts the answer, then the question's late "ended"
    /// arrives: the answer keeps sounding and its finish is not called.
    @Test func aLateEndOfTheStoppedPlayerLeavesTheNewOneAlone() {
        var slots = ClipSlots<Player>()
        let question = Player()
        var questionEnded = 0, answerEnded = 0
        slots.add(question) { questionEnded += 1 }
        let stopped = slots.removeAll()
        #expect(stopped.count == 1 && stopped[0] === question)
        let answer = Player()
        slots.add(answer) { answerEnded += 1 }
        let late = slots.ended(question)
        #expect(late == nil)
        #expect(questionEnded == 0, "stop() means no finish")
        #expect(answerEnded == 0)
        #expect(slots.players.count == 1 && slots.players[0] === answer)
        slots.ended(answer)?()
        #expect(answerEnded == 1)
    }
}
