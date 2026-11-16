import Foundation
import Testing
@testable import ContentModel

@Test func moduleIsLinked() {
    #expect(ContentModelModule.name == "ContentModel")
}

/// Collects what `ContentDecoder` logs, so tests can check the log call.
final class RecordingLog: ContentLog, @unchecked Sendable {
    private let lock = NSLock()
    private var recorded: [SkippedContent] = []

    func didSkip(_ entry: SkippedContent, lessonID: UUID) {
        lock.withLock { recorded.append(entry) }
    }

    var entries: [SkippedContent] { lock.withLock { recorded } }
}

// MARK: - Valid fixtures

@Suite struct ValidFixtures {
    @Test func decodesEveryValidFixture() throws {
        let files = Fixtures.jsonFiles(in: Fixtures.valid)
        #expect(files.count >= 2, "fixtures/valid has \(files.count) file(s)")
        var topics = 0
        var lessons = 0
        for url in files {
            let name = Fixtures.relative(url)
            let data = try Data(contentsOf: url)
            let log = RecordingLog()
            let decoder = ContentDecoder(log: log)
            switch try Fixtures.kind(of: data) {
            case "topic":
                do {
                    _ = try decoder.decodeTopic(from: data)
                    topics += 1
                } catch {
                    Issue.record("\(name): \(error)")
                }
            case "lesson":
                do {
                    let lesson = try decoder.decodeLesson(from: data)
                    #expect(lesson.skipped.isEmpty, "\(name) skipped \(lesson.skipped)")
                    lessons += 1
                } catch {
                    Issue.record("\(name): \(error)")
                }
            case let kind:
                Issue.record("\(name): unknown kind \(String(describing: kind))")
            }
            #expect(log.entries.isEmpty, "\(name) logged \(log.entries)")
        }
        print("ContentModel: decoded \(topics + lessons)/\(files.count) valid fixtures (\(topics) topic, \(lessons) lesson)")
        #expect(topics + lessons == files.count)
    }

    @Test func lessonOneValues() throws {
        let lesson = try ContentDecoder().decodeLesson(from: Fixtures.lessonData())
        #expect(lesson.slug == "thuc-an-cho-ta-nhung-gi")
        #expect(lesson.id == UUID(uuidString: "4b11eb40-9a47-4e5e-b4b5-bea60264ded3"))
        #expect(lesson.stage == .opener)
        #expect(lesson.keyPoints.count == 3)

        #expect(lesson.warmup.count == 2)
        #expect(lesson.warmup.map(\.format) == ["fill_blank_bank", "true_false"])
        if case .priorKnowledge = lesson.warmup[0].recallFrom {} else {
            Issue.record("w1 recall_from should be prior_knowledge, got \(String(describing: lesson.warmup[0].recallFrom))")
        }

        #expect(lesson.learn.count == 2)
        #expect(lesson.learn.map(\.type) == ["explore_groups", "word_list"])
        if case .exploreGroups(let explore) = lesson.learn[0] {
            #expect(explore.groups.count == 4)
            #expect(explore.completeWhen == "all_seen")
            #expect(explore.groups.allSatisfy { $0.color.isKnown })
        } else {
            Issue.record("learn[0] should be explore_groups")
        }

        guard case .buildTray(let tray) = lesson.play else {
            Issue.record("play should be build_tray, got \(lesson.play.type)")
            return
        }
        #expect(tray.items.count == 8)
        #expect(tray.capacity >= 3)
        #expect(tray.messages.missing.count == 3)

        #expect(lesson.quiz.count == 6)
        #expect(lesson.quiz.map(\.key) == ["q1", "q2", "q3", "q4", "q5", "q6"])
        #expect(lesson.quiz.map(\.format) == [
            "single_choice", "fill_blank_bank", "single_choice", "single_choice", "multi_choice", "true_false",
        ])
        #expect(lesson.quiz.allSatisfy { $0.recallFrom == nil })
        if case .trueFalse(let q6) = lesson.quiz[5].answer {
            #expect(q6.speaker == "na")
            #expect(q6.labels != nil)
            #expect(q6.statement != nil)
        } else {
            Issue.record("q6 should be true_false")
        }
        #expect(lesson.quiz[5].misconceptionId == UUID(uuidString: "93c51bb0-1d45-45df-99c5-a0397967fe10"))

        #expect(lesson.vocab.count == 8)
        #expect(lesson.reward.collectible?.key == "rau_muong")
        #expect(lesson.reward.collectible?.rarity == .common)
    }

    @Test func topicValues() throws {
        let topic = try ContentDecoder().decodeTopic(from: Fixtures.topicData())
        #expect(topic.slug == "an-uong-lanh-manh")
        #expect(topic.ageGroup == .discoverer)
        #expect(topic.strand == .humansHealth)
        #expect(topic.difficulty.vocabulary == 3)
        #expect(topic.isFree)
        #expect(topic.misconceptions.map(\.key) == ["all_fat_bad", "one_food_enough", "meal_needs_meat"])
        #expect(topic.question?.vi == "Ta cần ăn gì để khoẻ mạnh?")
    }

    /// Encode then decode gives the same value (the Encodable side matches the Decodable side).
    @Test func roundTrip() throws {
        let decoder = ContentDecoder()
        let lesson = try decoder.decodeLesson(from: Fixtures.lessonData())
        let lessonAgain = try decoder.decodeLesson(from: JSONEncoder().encode(lesson))
        #expect(lessonAgain == lesson)

        let topic = try decoder.decodeTopic(from: Fixtures.topicData())
        let topicAgain = try decoder.decodeTopic(from: JSONEncoder().encode(topic))
        #expect(topicAgain == topic)
    }
}

// MARK: - Unknown things are skipped, not fatal

@Suite struct SkipUnknown {
    @Test func unknownLearnBlockIsDropped() throws {
        var object = try Fixtures.lessonObject()
        var learn = object["learn"] as! [[String: Any]]
        learn.append([
            "id": "5f0c2a4e-8d1b-4c3a-9e7f-0a1b2c3d4e5f",
            "key": "hotspot",
            "type": "hotspot_image",
            "version": 1,
            "image": ["alt": ["en": "A plate", "vi": "Một cái đĩa"]],
            "hotspots": [["x": 0.5, "y": 0.5]],
        ])
        object["learn"] = learn

        let log = RecordingLog()
        let lesson = try ContentDecoder(log: log).decodeLesson(from: Fixtures.data(object))
        #expect(lesson.learn.count == 2)
        #expect(!lesson.learn.contains { $0.isUnknown })
        let expected = SkippedContent(
            path: "/learn/2",
            kind: .block(type: "hotspot_image"),
            id: UUID(uuidString: "5f0c2a4e-8d1b-4c3a-9e7f-0a1b2c3d4e5f")
        )
        #expect(lesson.skipped == [expected])
        #expect(log.entries == [expected])
    }

    @Test func unknownQuizFormatIsDropped() throws {
        var object = try Fixtures.lessonObject()
        var quiz = object["quiz"] as! [[String: Any]]
        #expect(quiz[2]["key"] as? String == "q3")
        quiz[2]["format"] = "label_diagram"
        object["quiz"] = quiz

        let log = RecordingLog()
        let lesson = try ContentDecoder(log: log).decodeLesson(from: Fixtures.data(object))
        #expect(lesson.quiz.count == 5)
        #expect(lesson.quiz.map(\.key) == ["q1", "q2", "q4", "q5", "q6"])
        #expect(log.entries.count == 1)
        #expect(log.entries.first?.path == "/quiz/2")
        #expect(log.entries.first?.kind == .quizItem(format: "label_diagram"))
        #expect(log.entries == lesson.skipped)
        // The default log (os.Logger, category "content") takes the same entry without trouble.
        _ = try ContentDecoder().decodeLesson(from: Fixtures.data(object))
    }

    @Test func unknownWarmupFormatIsDropped() throws {
        var object = try Fixtures.lessonObject()
        var warmup = object["warmup"] as! [[String: Any]]
        warmup[0]["format"] = "fill_blank_free"
        object["warmup"] = warmup

        let lesson = try ContentDecoder(log: RecordingLog()).decodeLesson(from: Fixtures.data(object))
        #expect(lesson.warmup.map(\.key) == ["w2"])
        #expect(lesson.skipped.map(\.path) == ["/warmup/0"])
    }

    @Test func unknownPlayBlockIsKeptAsUnknown() throws {
        var object = try Fixtures.lessonObject()
        var play = object["play"] as! [String: Any]
        play["type"] = "fair_test"
        object["play"] = play

        let lesson = try ContentDecoder(log: RecordingLog()).decodeLesson(from: Fixtures.data(object))
        #expect(lesson.play.isUnknown)
        #expect(lesson.play.type == "fair_test")
        #expect(lesson.skipped.map(\.path) == ["/play"])
        #expect(lesson.quiz.count == 6)
    }

    @Test func playBlockInLearnIsDropped() throws {
        var object = try Fixtures.lessonObject()
        var learn = object["learn"] as! [[String: Any]]
        learn.append(object["play"] as! [String: Any])
        object["learn"] = learn

        let lesson = try ContentDecoder(log: RecordingLog()).decodeLesson(from: Fixtures.data(object))
        #expect(lesson.learn.count == 2)
        #expect(lesson.skipped.map(\.kind) == [.block(type: "build_tray")])
    }

    /// The app reads more loosely than the CLI (SK-009 decision 2).
    @Test func unknownFieldsAreIgnored() throws {
        let original = try ContentDecoder().decodeLesson(from: Fixtures.lessonData())

        var object = try Fixtures.lessonObject()
        object["future_field"] = ["anything": [1, 2, 3]]
        var quiz = object["quiz"] as! [[String: Any]]
        quiz[0]["audio"] = "old-style field"
        object["quiz"] = quiz
        var learn = object["learn"] as! [[String: Any]]
        learn[0]["layout"] = "grid"
        object["learn"] = learn

        let lesson = try ContentDecoder(log: RecordingLog()).decodeLesson(from: Fixtures.data(object))
        #expect(lesson == original)
    }

    /// New values of a string enum (a new colour, stage, role…) still decode.
    @Test func newEnumValuesDecode() throws {
        var object = try Fixtures.lessonObject()
        object["stage"] = "challenge"
        var play = object["play"] as! [String: Any]
        var groups = play["groups"] as! [[String: Any]]
        groups[0]["color"] = "xanh_la"
        groups[3]["role"] = "sometimes"
        play["groups"] = groups
        object["play"] = play

        let lesson = try ContentDecoder(log: RecordingLog()).decodeLesson(from: Fixtures.data(object))
        #expect(lesson.stage.rawValue == "challenge")
        #expect(!lesson.stage.isKnown)
        guard case .buildTray(let tray) = lesson.play else {
            Issue.record("play should stay build_tray")
            return
        }
        #expect(tray.groups[0].color == ColorToken(rawValue: "xanh_la"))
        #expect(!tray.groups[0].color.isKnown)
        #expect(tray.groups[3].role.rawValue == "sometimes")
    }

    @Test func defaultsWhenOptionalFlagsAreAbsent() throws {
        var object = try Fixtures.lessonObject()
        object["sensitive"] = nil
        object["archived"] = nil
        object["ai_draft"] = nil
        var vocab = object["vocab"] as! [[String: Any]]
        vocab[0]["tier"] = nil
        vocab[1]["tier"] = "extra"
        object["vocab"] = vocab
        var reward = object["reward"] as! [String: Any]
        var card = reward["collectible"] as! [String: Any]
        card["rarity"] = nil
        reward["collectible"] = card
        object["reward"] = reward

        let lesson = try ContentDecoder().decodeLesson(from: Fixtures.data(object))
        #expect(!lesson.sensitive && !lesson.archived && !lesson.aiDraft)
        #expect(lesson.vocab[0].tier == .core)
        #expect(lesson.vocab[1].tier == .extra)
        #expect(lesson.reward.collectible?.rarity == .common)
    }
}

// MARK: - Errors carry the field path

@Suite struct DecodeErrors {
    @Test func missingTitle() throws {
        var object = try Fixtures.lessonObject()
        object["title"] = nil
        let data = try Fixtures.data(object)
        let error = #expect(throws: ContentDecodingError.self) {
            try ContentDecoder().decodeLesson(from: data)
        }
        #expect(error?.path == "/title")
        print("ContentModel: missing title → \(error.map(String.init(describing:)) ?? "no error")")
    }

    @Test func nestedPath() throws {
        var object = try Fixtures.lessonObject()
        var quiz = object["quiz"] as! [[String: Any]]
        var options = quiz[2]["options"] as! [[String: Any]]
        options[0]["key"] = nil
        quiz[2]["options"] = options
        object["quiz"] = quiz
        let data = try Fixtures.data(object)
        let error = #expect(throws: ContentDecodingError.self) {
            try ContentDecoder().decodeLesson(from: data)
        }
        #expect(error?.path == "/quiz/2/options/0/key")
    }

    @Test func wrongTypeAndBadUUID() throws {
        var object = try Fixtures.lessonObject()
        object["order"] = "one"
        var data = try Fixtures.data(object)
        var error = #expect(throws: ContentDecodingError.self) { try ContentDecoder().decodeLesson(from: data) }
        #expect(error?.path == "/order")

        object = try Fixtures.lessonObject()
        object["topic_id"] = "not-a-uuid"
        data = try Fixtures.data(object)
        error = #expect(throws: ContentDecodingError.self) { try ContentDecoder().decodeLesson(from: data) }
        #expect(error?.path == "/topic_id")
    }

    @Test func wrongKindAndBrokenJSON() throws {
        let topicData = try Fixtures.topicData()
        let kindError = #expect(throws: ContentDecodingError.self) { try ContentDecoder().decodeLesson(from: topicData) }
        #expect(kindError?.path == "/kind")

        let broken = Data("{\"kind\": \"lesson\",".utf8)
        let jsonError = #expect(throws: ContentDecodingError.self) { try ContentDecoder().decodeLesson(from: broken) }
        #expect(jsonError?.path == "/")
    }

    /// The CLI rejects every file in fixtures/invalid/. The app must not crash on any of them: it
    /// either decodes (it reads more loosely) or throws with a path. Where the app rejects a
    /// missing field, its path must equal the CLI pointer in test/invalid-fixtures.json.
    @Test func invalidFixturesNeverCrash() throws {
        let rejectedByApp: [String: String] = [
            "spoken-missing-vi.json": "/learn/0/groups/1/sentence/vi",
            "image-missing-alt.json": "/learn/0/groups/0/image/alt",
            "uuid-bad-format.json": "/misconceptions/0/id",
        ]
        let files = Fixtures.jsonFiles(in: Fixtures.invalid)
        #expect(files.count >= 19)
        var report: [String] = []
        for url in files {
            let name = url.lastPathComponent
            let data = try Data(contentsOf: url)
            let decoder = ContentDecoder(log: RecordingLog())
            let isTopic = try Fixtures.kind(of: data) == "topic"
            do throws(ContentDecodingError) {
                let skipped: [SkippedContent]
                if isTopic {
                    _ = try decoder.decodeTopic(from: data)
                    skipped = []
                } else {
                    skipped = try decoder.decodeLesson(from: data).skipped
                }
                report.append("\(name): decoded" + (skipped.isEmpty ? "" : ", skipped \(skipped.map(\.path))"))
                #expect(rejectedByApp[name] == nil, "\(name) should not decode")
                if name == "block-unknown-type.json" {
                    #expect(skipped.map(\.path) == ["/learn/1"])
                }
            } catch {
                report.append("\(name): error \(error.path)")
                #expect(rejectedByApp[name] == error.path, "\(name): \(error)")
            }
        }
        print("ContentModel: invalid fixtures (CLI rejects all; app outcome):\n  " + report.joined(separator: "\n  "))
    }
}

// MARK: - build_tray and fill_blank_bank helpers

@Test func missingMessagesFollowGroupOrder() throws {
    let lesson = try ContentDecoder().decodeLesson(from: Fixtures.lessonData())
    guard case .buildTray(let tray) = lesson.play else {
        Issue.record("play should be build_tray")
        return
    }
    let requiredInGroupOrder = tray.groups.filter { $0.role == .required }.map(\.key)
    #expect(Set(requiredInGroupOrder) == ["tray_carb", "tray_protein", "tray_veg"])
    #expect(tray.missingMessagesInGroupOrder.map(\.group.key) == requiredInGroupOrder)

    // SK-011: the fixture's `groups` order changes (main session, 29/10), so the order is not
    // pinned here. Reverse `groups` in memory instead: the messages follow `groups`, never the
    // order the file writes `missing` in.
    var object = try Fixtures.lessonObject()
    var play = try #require(object["play"] as? [String: Any])
    let groups = try #require(play["groups"] as? [[String: Any]])
    play["groups"] = Array(groups.reversed())
    object["play"] = play
    let reversed = try ContentDecoder().decodeLesson(from: Fixtures.data(object))
    guard case .buildTray(let reversedTray) = reversed.play else {
        Issue.record("play should be build_tray")
        return
    }
    let reversedOrder = Array(requiredInGroupOrder.reversed())
    #expect(reversedTray.missingMessagesInGroupOrder.map(\.group.key) == reversedOrder)
    let messages = Dictionary(uniqueKeysWithValues: tray.missingMessagesInGroupOrder.map { ($0.group.key, $0.message.en) })
    #expect(reversedTray.missingMessagesInGroupOrder.first?.message.en == messages[reversedOrder[0]])
}

@Test func fillBlankSegments() throws {
    #expect(SentenceSegment.split("Carbohydrates give us {1}.") == [
        .text("Carbohydrates give us "), .blank(1), .text("."),
    ])
    #expect(SentenceSegment.split("{1} and {2}") == [.blank(1), .text(" and "), .blank(2)])
    #expect(SentenceSegment.split("{1}{2}") == [.blank(1), .blank(2)])
    #expect(SentenceSegment.split("No blank here.") == [.text("No blank here.")])
    #expect(SentenceSegment.split("Braces {x} and { } and {") == [.text("Braces {x} and { } and {")])
    #expect(SentenceSegment.split("Ăn {1} nhé, {12}!") == [.text("Ăn "), .blank(1), .text(" nhé, "), .blank(12), .text("!")])
    #expect(SentenceSegment.split("") == [])

    let lesson = try ContentDecoder().decodeLesson(from: Fixtures.lessonData())
    guard case .fillBlankBank(let q2) = lesson.quiz[1].answer else {
        Issue.record("q2 should be fill_blank_bank")
        return
    }
    #expect(q2.segmentsEN == [.text("Food gives us "), .blank(1), .text(", like protein and fat.")])
    // vi may or may not have the blank (SK-017 adds it); never more blanks than answers.
    let viBlanks = q2.segmentsVI.filter { if case .blank = $0 { true } else { false } }
    #expect(viBlanks.count <= q2.answers.count)
}

/// SK-033 (Duy 9/11): a word card of `fill_blank_bank` may have an `image` (same `Image` as a
/// `single_choice` option). Built in memory from the fixture's quiz q2, so the test does not hang
/// on whether the fixture's cards have pictures.
@Suite struct BankWordImage {
    /// The lesson with quiz q2's bank words given `images` by key (no key: no `image` at all).
    private static func lesson(images: [String: [String: Any]]) throws -> Lesson {
        var object = try Fixtures.lessonObject()
        var quiz = try #require(object["quiz"] as? [[String: Any]])
        let index = try #require(quiz.firstIndex { $0["key"] as? String == "q2" })
        var bank = try #require(quiz[index]["bank"] as? [[String: Any]])
        for i in bank.indices {
            let key = try #require(bank[i]["key"] as? String)
            bank[i]["image"] = images[key]
        }
        quiz[index]["bank"] = bank
        object["quiz"] = quiz
        return try ContentDecoder().decodeLesson(from: Fixtures.data(object))
    }

    private static func q2(_ lesson: Lesson) throws -> QuizItem.FillBlankBank {
        let item = try #require(lesson.quiz.first { $0.key == "q2" })
        guard case .fillBlankBank(let fill) = item.answer else { throw FormatMismatch() }
        return fill
    }

    private struct FormatMismatch: Error {}

    @Test("Word cards without image: image is nil, the bank has no pictures")
    func withoutImage() throws {
        let fill = try Self.q2(Self.lesson(images: [:]))
        #expect(fill.bank.map(\.key) == ["q2_nutrients", "q2_air", "q2_sunlight"])
        #expect(fill.bank.allSatisfy { $0.image == nil })
        #expect(!fill.hasPictures)
    }

    @Test("A word card with image decodes it; the others stay nil; the bank has pictures")
    func withImage() throws {
        let image: [String: Any] = [
            "alt": ["en": "A child running in the park", "vi": "Bạn nhỏ chạy trong công viên"],
            "brief": "Ảnh chụp thật, trẻ chạy trên cỏ (từ khoá: child running park)",
        ]
        let lesson = try Self.lesson(images: ["q2_nutrients": image])
        let fill = try Self.q2(lesson)
        let energy = try #require(fill.bank.first { $0.key == "q2_nutrients" })
        #expect(energy.image == ContentImage(
            alt: BilingualText(en: "A child running in the park", vi: "Bạn nhỏ chạy trong công viên"),
            brief: "Ảnh chụp thật, trẻ chạy trên cỏ (từ khoá: child running park)"
        ))
        #expect(fill.bank.filter { $0.key != "q2_nutrients" }.allSatisfy { $0.image == nil })
        #expect(fill.hasPictures)
        // Scoring reads keys only: the answers do not change.
        #expect(fill.answers == ["q2_nutrients"])

        // Encodes back the same (no `image` key is written for the cards without one).
        let again = try ContentDecoder().decodeLesson(from: JSONEncoder().encode(lesson))
        #expect(again == lesson)
    }
}
