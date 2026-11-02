import AudioKit
import ContentModel
import Foundation
import Profiles
import Testing
@testable import LessonPlayer

/// SK-016, SK-025: which clips a voice plays, what each step says by itself, what is read ahead.
/// Lesson 1 fixture with stand-in clips on every string: EN only (the pack of SK-015), or EN and
/// VI (the pack of SK-024). The last tests read the real pack (`content/.build/pack`) when it is
/// built on this machine.
@MainActor
@Suite struct LessonSpeechTests {
    /// Every `Spoken` of the fixture gets `audio.en` = "en:<text>" (a stand-in hash), and with
    /// `vietnamese` also `audio.vi` = "vi:<text>".
    static func voicedLesson(vietnamese: Bool = false) throws -> Lesson {
        try Repo.lesson { object in
            object = voice(object, vietnamese: vietnamese) as? [String: Any] ?? object
        }
    }

    static func voice(_ value: Any, vietnamese: Bool = false) -> Any {
        if var object = value as? [String: Any] {
            if let en = object["en"] as? String, let vi = object["vi"] as? String, object["kind"] == nil, object["alt"] == nil,
               object.keys.allSatisfy({ ["en", "vi", "audio"].contains($0) }) {
                object["audio"] = vietnamese ? ["en": "en:" + en, "vi": "vi:" + vi] : ["en": "en:" + en]
                return object
            }
            for (key, child) in object { object[key] = voice(child, vietnamese: vietnamese) }
            return object
        }
        if let array = value as? [Any] { return array.map { voice($0, vietnamese: vietnamese) } }
        return value
    }

    static func session(voice: VoiceMode, vietnamese: Bool = false, lesson: Lesson? = nil) throws -> (LessonSession, SessionHarness) {
        let harness = try SessionHarness(lesson: lesson ?? voicedLesson(vietnamese: vietnamese))
        let session = LessonSession(
            lesson: harness.lesson, rules: harness.rules,
            context: .init(childId: harness.child, timeZone: TimeZone(identifier: "Asia/Ho_Chi_Minh")!, languageMode: .bilingual, voiceMode: voice),
            store: harness.store
        )
        return (session, harness)
    }

    // MARK: voice_mode

    @Test func voiceModes() {
        let enOnly = Spoken(en: "rice", vi: "cơm", audio: SpokenAudio(en: "h-en"))
        #expect(enOnly.voiceClips(for: .en).map(\.hash) == ["h-en"])
        #expect(enOnly.voiceClips(for: .both).map(\.hash) == ["h-en"], "both: EN, then VI when it exists")
        #expect(enOnly.voiceClips(for: .vi).isEmpty, "vi: no VI clip yet, nothing plays")

        let both = Spoken(en: "rice", vi: "cơm", audio: SpokenAudio(en: "h-en", vi: "h-vi"))
        #expect(both.voiceClips(for: .both).map(\.hash) == ["h-en", "h-vi"])
        #expect(both.voiceClips(for: .both).map(\.language) == ["en", "vi"])
        #expect(both.voiceClips(for: .vi).map(\.hash) == ["h-vi"])
        #expect(both.voiceClips(for: .en).map(\.text) == ["rice"])

        let silent = Spoken(en: "rice", vi: "cơm")
        #expect(silent.voiceClips(for: .both).isEmpty, "fixtures: no audio")
        #expect(silent.clips(for: .en).isEmpty)

        // Several strings: EN → VI per string.
        let utterance = Utterance(id: "x", [both, enOnly, nil], voice: .both)
        #expect(utterance.clips.map(\.hash) == ["h-en", "h-vi", "h-en"])
    }

    // MARK: Questions

    @Test func questionReadsInstructionStatementPrompt() throws {
        let (session, harness) = try Self.session(voice: .en)
        defer { harness.cleanUp() }
        let lesson = session.lesson
        // w1, fill_blank_bank: "Pick the missing word", then the sentence with its blank.
        let w1 = try #require(lesson.warmup.first { $0.key == "w1" })
        guard case .fillBlankBank(let fill) = w1.answer else { Issue.record("w1 format"); return }
        #expect(session.questionUtterance(w1).clips.map(\.text) == [w1.prompt.en, fill.sentence.en])
        // q6, true/false with Na's statement and an instruction tag.
        let q6 = try #require(lesson.quiz.first { $0.key == "q6" })
        guard case .trueFalse(let tf) = q6.answer, let statement = tf.statement, let instruction = q6.instruction else {
            Issue.record("q6 format")
            return
        }
        #expect(session.questionUtterance(q6).clips.map(\.text) == [instruction.en, statement.en, q6.prompt.en])
        // q1, a single choice: the prompt alone.
        let q1 = try #require(lesson.quiz.first { $0.key == "q1" })
        #expect(session.questionUtterance(q1).clips.map(\.text) == [q1.prompt.en])
        #expect(session.questionUtterance(q1).id == "question.q1")
    }

    /// What plays when each step opens: the question, the Học instruction, the tray message.
    /// Thưởng says nothing by itself.
    @Test func whatPlaysWhenAStepOpens() throws {
        let (session, harness) = try Self.session(voice: .en)
        defer { harness.cleanUp() }
        for step in session.steps {
            let opening = session.autoplayUtterance(for: step)
            switch step {
            case .warmup(let index):
                let item = try #require(session.item(at: index, in: .warmup))
                #expect(opening == session.questionUtterance(item))
            case .quiz(let index):
                let item = try #require(session.item(at: index, in: .quiz))
                #expect(opening == session.questionUtterance(item))
            case .learn:
                #expect(opening?.clips.map(\.text) == session.exploreBlock.map { [$0.prompt.en] })
            case .play:
                #expect(opening?.clips.map(\.text) == session.tray.map { [$0.messages.start.en] }, "fresh tray: the start message")
            case .reward:
                #expect(opening == nil)
            }
        }
    }

    /// SK-025, question 3(a): `vi` on a pack with no VI clip (only a broken pack now): nothing plays
    /// anywhere, every listen button hides, nothing is read ahead. Was `viVoicePlaysNothingYet`
    /// (SK-016: "no VI voice yet"). The check is the same; what it stands for changed.
    @Test func viVoiceWithoutVietnameseClipsPlaysNothing() throws {
        let (session, harness) = try Self.session(voice: .vi)
        defer { harness.cleanUp() }
        for step in session.steps {
            #expect(session.autoplayUtterance(for: step)?.isEmpty ?? true, "\(step)")
            #expect(session.clipsToPreload(at: step).isEmpty, "\(step)")
        }
    }

    /// SK-025: `vi` plays VI only, on every step that says something by itself and on every
    /// question's listen button.
    @Test func viVoicePlaysVietnameseOnly() throws {
        let (session, harness) = try Self.session(voice: .vi, vietnamese: true)
        defer { harness.cleanUp() }
        for step in session.steps where step != .reward {
            let clips = try #require(session.autoplayUtterance(for: step)?.clips, "\(step)")
            #expect(!clips.isEmpty, "\(step)")
            #expect(clips.allSatisfy { $0.language == "vi" && $0.hash.hasPrefix("vi:") }, "\(step): \(clips.map(\.hash))")
        }
        for item in session.lesson.warmup + session.lesson.quiz {
            let clips = session.questionUtterance(item).clips
            #expect(!clips.isEmpty && clips.allSatisfy { $0.language == "vi" }, "\(item.key)")
        }
    }

    /// SK-025, question 2(a): `both` alternates per string, EN1 → VI1 → EN2 → VI2.
    @Test func bothAlternatesPerString() throws {
        let (session, harness) = try Self.session(voice: .both, vietnamese: true)
        defer { harness.cleanUp() }
        let w1 = try #require(session.lesson.warmup.first { $0.key == "w1" })
        guard case .fillBlankBank(let fill) = w1.answer else { Issue.record("w1 format"); return }
        let clips = session.questionUtterance(w1).clips
        #expect(clips.map(\.language) == ["en", "vi", "en", "vi"])
        #expect(clips.map(\.text) == [w1.prompt.en, w1.prompt.vi, fill.sentence.en, fill.sentence.vi])
    }

    /// SK-025: only the voice that is on is read ahead. `en` has no VI hash (unchanged from
    /// SK-016), `vi` only VI hashes, `both` both.
    @Test func preloadsOnlyTheVoiceThatIsOn() throws {
        for voice in [VoiceMode.en, .vi, .both] {
            let (session, harness) = try Self.session(voice: voice, vietnamese: true)
            defer { harness.cleanUp() }
            let all = Set(session.steps.flatMap { session.clipsToPreload(at: $0) })
            let en = all.filter { $0.hasPrefix("en:") }, vi = all.filter { $0.hasPrefix("vi:") }
            switch voice {
            case .en: #expect(!en.isEmpty && vi.isEmpty, "en: \(vi.count) VI hashes")
            case .vi: #expect(en.isEmpty && !vi.isEmpty, "vi: \(en.count) EN hashes")
            case .both: #expect(!en.isEmpty && !vi.isEmpty, "both: \(en.count) EN, \(vi.count) VI")
            }
        }
    }

    /// Every string a step shows has an EN clip in the pack (128/128 in SK-014), so `en` and
    /// `both` play EN everywhere: no step shows a string without a clip.
    @Test func everyShownStringHasAnEnglishClip() throws {
        let (session, harness) = try Self.session(voice: .both)
        defer { harness.cleanUp() }
        for step in session.steps {
            let shown = session.spokenShown(on: step)
            #expect(!shown.isEmpty, "\(step)")
            for spoken in shown {
                #expect(spoken.voiceClips(for: .both).map(\.language) == ["en"], "\(step): \(spoken.en)")
            }
        }
    }

    /// Preload: this step and the next, in the voice that is on.
    @Test func preloadsThisStepAndTheNext() throws {
        let (session, harness) = try Self.session(voice: .en)
        defer { harness.cleanUp() }
        let first = session.steps[0]
        let second = try #require(session.step(after: first))
        let expected = Set((session.spokenShown(on: first) + session.spokenShown(on: second)).compactMap(\.audio?.en))
        #expect(session.clipsToPreload(at: first) == expected)
        #expect(session.step(after: .reward) == nil)
        #expect(session.clipsToPreload(at: .reward) == Set(session.spokenShown(on: .reward).compactMap(\.audio?.en)))
    }

    /// The finished attempt records the pack version it was played from (B4.3).
    @Test func attemptRecordsTheContentVersion() throws {
        let harness = try SessionHarness()
        defer { harness.cleanUp() }
        let session = LessonSession(
            lesson: harness.lesson, rules: harness.rules,
            context: .init(childId: harness.child, timeZone: TimeZone(identifier: "Asia/Ho_Chi_Minh")!, languageMode: .bilingual, voiceMode: .en),
            store: harness.store, contentVersion: "15880ff9df19"
        )
        while session.step != .reward {
            switch session.step {
            case .warmup(let index):
                session.submit(rightTry(session.item(at: index, in: .warmup)!), for: session.item(at: index, in: .warmup)!, in: .warmup)
            case .quiz(let index):
                session.submit(rightTry(session.item(at: index, in: .quiz)!), for: session.item(at: index, in: .quiz)!, in: .quiz)
            case .learn:
                for group in session.exploreBlock?.groups ?? [] { session.selectGroup(group.key) }
            case .play, .reward:
                break
            }
            session.advance()
        }
        #expect(session.summary?.record.contentVersion == "15880ff9df19")
        #expect(harness.store.history().last?.contentVersion == "15880ff9df19")
    }
}
