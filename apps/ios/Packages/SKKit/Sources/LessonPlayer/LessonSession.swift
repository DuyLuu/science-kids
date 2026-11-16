import ContentModel
import Foundation
import LessonEngine
import Observation
import os
import Profiles

/// Which part of the lesson a question belongs to: warmup is never scored, quiz is.
public enum QuestionPhase: String, Hashable, Sendable {
    case warmup
    case quiz
}

/// Where one question stands, derived from its tries with `scoreItem` (B4.4).
public enum QuestionStatus: Hashable, Sendable {
    /// No try yet.
    case open
    /// The last try was wrong and another try is allowed (`max_tries`): show the hint, "Thử lại".
    case retry(last: Try)
    /// Answered: right (on the first try or a later one), or wrong on the last allowed try.
    case done(correct: Bool, firstTry: Bool, last: Try)

    public var isDone: Bool {
        if case .done = self { return true }
        return false
    }

    /// The try to show on the answer cells, if any.
    public var lastTry: Try? {
        switch self {
        case .open: nil
        case .retry(let last): last
        case .done(_, _, let last): last
        }
    }
}

/// How a lesson is shown, from the age group of its topic (SK-026: the content's `age_group`, not
/// the profile's). Explorer (5–7) is the "no reading needed" quiz of SK-026 D1–D4: picture cards
/// with no text, tap to answer, the mascot reads every line, stars and a sticker without the
/// number right or XP. Scientist has no screens of its own yet and plays like Discoverer.
public enum LessonPresentation: String, Hashable, Sendable {
    case discoverer
    case explorer

    public init(ageGroup: String) {
        self = ageGroup == "explorer" ? .explorer : .discoverer
    }
}

/// What the Reward screen shows, all from the engine.
public struct LessonSummary: Hashable, Sendable {
    public var score: LessonScore
    public var xp: XPAward
    public var stars: StarsResult
    public var record: AttemptRecord
}

/// One lesson attempt from Khởi động to Thưởng (SK-012): the steps, the child's answers, the tray,
/// the result. Scoring is the engine's (`scoreItem`, `scoreLesson`, `computeStars`, `computeXP`,
/// `buildTray`), with the parameters of `rules`; nothing is decided here.
///
/// The progress is written to `store` after every step and every checked answer, so the attempt
/// opens again where it stopped (B4.4). Finishing writes the attempt to the history and removes
/// the progress.
@MainActor
@Observable
public final class LessonSession {
    public struct Context: Hashable, Sendable {
        public var childId: UUID
        public var timeZone: TimeZone
        public var languageMode: LanguageMode
        public var voiceMode: VoiceMode
        /// From the topic's `age_group` (SK-040).
        public var presentation: LessonPresentation

        public init(
            childId: UUID, timeZone: TimeZone, languageMode: LanguageMode, voiceMode: VoiceMode,
            presentation: LessonPresentation = .discoverer
        ) {
            self.childId = childId
            self.timeZone = timeZone
            self.languageMode = languageMode
            self.voiceMode = voiceMode
            self.presentation = presentation
        }
    }

    public typealias Step = AttemptProgress.Step

    public let lesson: Lesson
    public let rules: LessonRules
    public let context: Context
    /// Questions and blocks this build can show, in content order; the rest is left out (SK-009).
    public let warmupItems: [QuizItem]
    public let quizItems: [QuizItem]
    public let exploreBlock: ExploreGroups?
    public let wordList: WordList?
    public let tray: BuildTray?
    /// The tray's items in the order the Chơi shelf shows them: shuffled once per attempt
    /// (`ShelfOrder`, SK-031), so the content's order does not give the groups away; empty
    /// without a tray.
    public let shelfItems: [TrayItem]
    /// Every step of this lesson, in order.
    public let steps: [Step]

    /// Version of the content pack the lesson came from (`topics[].version`), written on the
    /// finished attempt as `content_version` (B4.3); `nil` with the fixtures.
    public let contentVersion: String?

    public private(set) var progress: AttemptProgress
    public private(set) var trayState: TrayState?
    public private(set) var summary: LessonSummary?
    /// Tiếng Anh trước: the Vietnamese lines show only after the child asks for them.
    public var showsSecondLanguage: Bool

    @ObservationIgnored private let store: AttemptStore?
    @ObservationIgnored private let now: @Sendable () -> Date
    @ObservationIgnored private let log = Logger(subsystem: Bundle.main.bundleIdentifier ?? "ScienceKids", category: "lesson")

    /// Opens the attempt under way for this lesson and child (not older than 7 days), or starts one.
    public init(
        lesson: Lesson,
        rules: LessonRules,
        context: Context,
        store: AttemptStore?,
        contentVersion: String? = nil,
        now: @escaping @Sendable () -> Date = { Date() }
    ) {
        self.lesson = lesson
        self.contentVersion = contentVersion
        self.rules = rules
        self.context = context
        self.store = store
        self.now = now
        warmupItems = lesson.warmup.filter { $0.answer.hasRenderer(for: context.presentation) }
        quizItems = lesson.quiz.filter { $0.answer.hasRenderer(for: context.presentation) }

        exploreBlock = lesson.learn.lazy.compactMap { block -> ExploreGroups? in
            if case .exploreGroups(let explore) = block { return explore }
            return nil
        }.first
        wordList = lesson.learn.lazy.compactMap { block -> WordList? in
            if case .wordList(let list) = block { return list }
            return nil
        }.first
        if case .buildTray(let block) = lesson.play { tray = block } else { tray = nil }

        var steps: [Step] = warmupItems.indices.map { .warmup(index: $0) }
        if exploreBlock != nil || wordList != nil { steps.append(.learn) }
        if tray != nil { steps.append(.play) }
        steps += quizItems.indices.map { .quiz(index: $0) }
        // SK-047: Tổng kết between the last quiz question and the reward.
        steps.append(.recap)
        steps.append(.reward)
        self.steps = steps

        let date = now()
        let attempt: AttemptProgress
        if var saved = store?.inProgress(lessonId: lesson.id, childId: context.childId, now: date),
           steps.contains(saved.step) {
            saved.isPaused = false
            let checked = Self.reconciled(
                saved, warmup: warmupItems, quiz: quizItems, rules: rules,
                trayItems: tray.map { Set($0.items.map(\.key)) }, groups: exploreBlock.map { $0.groups.map(\.key) }
            )
            if !checked.dropped.isEmpty {
                log.notice("saved tries no longer fit the content, questions open again: \(checked.dropped.joined(separator: ","), privacy: .public)")
            }
            attempt = checked.progress
        } else {
            attempt = AttemptProgress(childId: context.childId, lessonId: lesson.id, now: date, firstStep: steps[0])
        }
        progress = attempt
        if case .buildTray(let block) = lesson.play {
            shelfItems = ShelfOrder.shuffled(block.items, seed: attempt.attemptId)
        } else {
            shelfItems = []
        }
        showsSecondLanguage = !context.languageMode.hidesSentenceSecondLanguage
        if let tray {
            trayState = try? buildTray(block: tray.trayRules, tray: progress.tray, taps: []).get()
        }
        for item in (lesson.warmup + lesson.quiz) where !item.answer.hasRenderer(for: context.presentation) {
            log.notice("question \(item.key, privacy: .public) (\(item.format, privacy: .public)) has no \(context.presentation.rawValue, privacy: .public) screen: left out")
        }
        prepareStep()
        if progress.step.finishesTheAttempt {
            finish()
        } else {
            save()
        }
    }

    /// SK-047: a lesson stopped half way and opened again on a newer content pack (options, bank
    /// words or order cards renamed or removed, fewer tries allowed). The engine refuses such a
    /// saved try, so its question would show as wrong without being asked and the attempt could
    /// never be complete. Each question whose saved tries the engine refuses for the content now
    /// loses them (and its `hint_used`) and opens again; an attempt standing after such a quiz
    /// question goes back to the first one. Tray items and Học groups that are gone are dropped.
    /// `dropped`: the question keys that open again, for the log.
    static func reconciled(
        _ saved: AttemptProgress, warmup: [QuizItem], quiz: [QuizItem], rules: LessonRules,
        trayItems: Set<String>?, groups: [String]?
    ) -> (progress: AttemptProgress, dropped: [String]) {
        var progress = saved
        var dropped: [String] = []
        func fits(_ item: QuizItem, _ tries: [Try]) -> Bool {
            guard let scoring = item.answer.scoringItem else { return false }
            if case .success = scoreItem(item: scoring, tries: tries, rules: rules.scoring(forFormat: item.format)) { return true }
            return false
        }
        let warmupKeys = Set(warmup.map(\.key))
        progress.warmupTries = progress.warmupTries.filter { warmupKeys.contains($0.key) }
        for item in warmup {
            if let tries = progress.warmupTries[item.key], !fits(item, tries) {
                progress.warmupTries[item.key] = nil
                progress.hintsUsed.remove(hintKey(item, in: .warmup))
                dropped.append(item.key)
            }
        }
        let quizKeys = Set(quiz.map(\.key))
        progress.quizTries = progress.quizTries.filter { quizKeys.contains($0.key) }
        var firstReopened: Int?
        for (index, item) in quiz.enumerated() {
            if let tries = progress.quizTries[item.key], !fits(item, tries) {
                progress.quizTries[item.key] = nil
                progress.hintsUsed.remove(hintKey(item, in: .quiz))
                dropped.append(item.key)
                if firstReopened == nil { firstReopened = index }
            }
        }
        if let first = firstReopened {
            switch progress.step {
            case .quiz(let index) where index > first: progress.step = .quiz(index: first)
            case .recap, .reward: progress.step = .quiz(index: first)
            default: break
            }
        }
        if let trayItems {
            progress.tray = progress.tray.filter { trayItems.contains($0) }
        }
        if let groups {
            progress.exploreSeen = progress.exploreSeen.filter { groups.contains($0) }
            if let selected = progress.exploreSelected, !groups.contains(selected) { progress.exploreSelected = nil }
        }
        return (progress, dropped)
    }

    public var step: Step { progress.step }
    public var languageMode: LanguageMode { context.languageMode }
    public var presentation: LessonPresentation { context.presentation }
    public var isExplorer: Bool { context.presentation == .explorer }

    // MARK: Steps

    /// The four parts on the step squares (Khởi động · Học · Chơi · Quiz): index of the current one.
    public var phaseIndex: Int {
        switch step {
        case .warmup: 0
        case .learn: 1
        case .play: 2
        case .quiz, .recap, .reward: 3
        }
    }

    /// Goes to the next step. The step after the last quiz question is Tổng kết (SK-047), which
    /// finishes the attempt on the way in: a child who closes the app there keeps the lesson.
    public func advance() {
        guard let index = steps.firstIndex(of: step), index + 1 < steps.count else { return }
        if step == .play, trayState?.success == true { progress.playCompleted = true }
        progress.step = steps[index + 1]
        prepareStep()
        if progress.step.finishesTheAttempt {
            finish()
        } else {
            save()
        }
    }

    /// From Chơi back to Học (canvas "Quay lại phần học"); other steps have no way back.
    public func backToLearn() {
        guard step == .play, steps.contains(.learn) else { return }
        progress.step = .learn
        save()
    }

    /// The child leaves with the close button: the attempt waits, it does not reopen by itself.
    public func pause() {
        guard summary == nil else { return }
        progress.isPaused = true
        save()
    }

    private func prepareStep() {
        if step == .learn, progress.exploreSelected == nil, let first = exploreBlock?.groups.first {
            progress.exploreSelected = first.key
            if !progress.exploreSeen.contains(first.key) { progress.exploreSeen.append(first.key) }
        }
    }

    // MARK: Questions

    public func item(at index: Int, in phase: QuestionPhase) -> QuizItem? {
        let items = phase == .warmup ? warmupItems : quizItems
        return items.indices.contains(index) ? items[index] : nil
    }

    public func tries(for item: QuizItem, in phase: QuestionPhase) -> [Try] {
        (phase == .warmup ? progress.warmupTries : progress.quizTries)[item.key] ?? []
    }

    public func status(of item: QuizItem, in phase: QuestionPhase) -> QuestionStatus {
        let tries = tries(for: item, in: phase)
        guard let last = tries.last else { return .open }
        guard let scoring = item.answer.scoringItem,
              case .success(let score) = scoreItem(item: scoring, tries: tries, rules: rules.scoring(forFormat: item.format))
        else { return .done(correct: false, firstTry: false, last: last) }
        if score.finalCorrect { return .done(correct: true, firstTry: score.tryResults.count == 1, last: last) }
        if tries.count >= rules.scoring(forFormat: item.format).maxTries { return .done(correct: false, firstTry: false, last: last) }
        return .retry(last: last)
    }

    /// The engine's score of a question's tries so far (`scoreItem`); `nil` before the first try.
    public func itemScore(of item: QuizItem, in phase: QuestionPhase) -> ItemScore? {
        let tries = tries(for: item, in: phase)
        guard !tries.isEmpty, let scoring = item.answer.scoringItem,
              case .success(let score) = scoreItem(item: scoring, tries: tries, rules: rules.scoring(forFormat: item.format))
        else { return nil }
        return score
    }

    /// XP a quiz question earned (`computeItemXP` on its `scoreItem` points), once it is done;
    /// `nil` in warmup and while the question is open.
    public func xpEarned(by item: QuizItem, in phase: QuestionPhase) -> Int? {
        guard phase == .quiz, !isExplorer, status(of: item, in: phase).isDone, let score = itemScore(of: item, in: phase) else { return nil }
        return computeItemXP(score: score, rules: rules.xp)
    }

    /// Checks one try of the child. A try the engine refuses (shape of another format, a key that
    /// is not in the question) is ignored; so is a try after the question is done.
    @discardableResult
    public func submit(_ attempt: Try, for item: QuizItem, in phase: QuestionPhase) -> QuestionStatus {
        let before = status(of: item, in: phase)
        guard !before.isDone, let scoring = item.answer.scoringItem else { return before }
        let tries = tries(for: item, in: phase) + [attempt]
        guard case .success = scoreItem(item: scoring, tries: tries, rules: rules.scoring(forFormat: item.format)) else {
            log.error("try refused for \(item.key, privacy: .public)")
            return before
        }
        switch phase {
        case .warmup: progress.warmupTries[item.key] = tries
        case .quiz: progress.quizTries[item.key] = tries
        }
        save()
        return status(of: item, in: phase)
    }

    // MARK: Gợi ý (SK-047)

    /// The child tapped "Gợi ý" (Discoverer, Scientist): `hint_used` of the question. Only while
    /// the question is not done; the hint the app reads by itself after a wrong try does not
    /// count (it never calls this). Opening the hint does not change the points (Duy 15/11).
    public func markHintUsed(_ item: QuizItem, in phase: QuestionPhase) {
        guard !status(of: item, in: phase).isDone else { return }
        let key = Self.hintKey(item, in: phase)
        guard !progress.hintsUsed.contains(key) else { return }
        progress.hintsUsed.insert(key)
        save()
    }

    /// Whether the child opened the hint of this question (its slip stays open, also after the
    /// lesson reopens).
    public func hintOpened(_ item: QuizItem, in phase: QuestionPhase) -> Bool {
        progress.hintsUsed.contains(Self.hintKey(item, in: phase))
    }

    /// Key in `hintsUsed`: the quiz key as before (`finish` reads it for `hint_used`), Khởi động
    /// keys apart so they never mark a quiz question.
    static func hintKey(_ item: QuizItem, in phase: QuestionPhase) -> String {
        phase == .warmup ? "warmup/" + item.key : item.key
    }

    // MARK: Order on the screen (SK-047)

    /// The choices of a `single_choice` or `multi_choice` as the screen shows them
    /// (`SeededOrder`, by attempt id and question key). Other formats: their content order.
    public func shownOptions(_ item: QuizItem) -> [QuizItem.ChoiceOption] {
        switch item.answer {
        case .singleChoice(let choice): SeededOrder.shuffled(choice.options, attemptId: progress.attemptId, key: item.key)
        case .multiChoice(let choice): SeededOrder.shuffled(choice.options, attemptId: progress.attemptId, key: item.key)
        // `options[i]` answers `bars[i]`: the chart keeps its order.
        case .pictureBarChart(let chart): chart.options
        default: []
        }
    }

    /// The word cards of a `fill_blank_bank` as the screen shows them. The blanks keep the
    /// sentence's order.
    public func shownBank(_ item: QuizItem) -> [QuizItem.FillBlankBank.BankWord] {
        guard case .fillBlankBank(let fill) = item.answer else { return [] }
        return SeededOrder.shuffled(fill.bank, attemptId: progress.attemptId, key: item.key)
    }

    /// The cards of an `order_sequence` as the bank shows them: never in `answer` order.
    public func shownOrderCards(_ item: QuizItem) -> [QuizItem.OrderSequence.SequenceItem] {
        guard case .orderSequence(let order) = item.answer else { return [] }
        return SeededOrder.orderCards(order.items, answer: order.answer, attemptId: progress.attemptId, key: item.key)
    }

    /// Quiz questions answered so far (for the squares and "Câu n/6").
    public var quizAnsweredCount: Int {
        quizItems.filter { status(of: $0, in: .quiz).isDone }.count
    }

    // MARK: Học

    public func selectGroup(_ key: String) {
        progress.exploreSelected = key
        if !progress.exploreSeen.contains(key) { progress.exploreSeen.append(key) }
        save()
    }

    /// `complete_when`: `all_seen` (the only value in v1) needs every group opened once.
    public var learnComplete: Bool {
        guard let explore = exploreBlock else { return true }
        return Set(explore.groups.map(\.key)).isSubset(of: Set(progress.exploreSeen))
    }

    // MARK: Chơi

    /// One tap on a food (shelf or tray): the engine decides the tray and its message.
    public func tapTrayItem(_ key: String) {
        guard let tray else { return }
        switch buildTray(block: tray.trayRules, tray: progress.tray, taps: [key]) {
        case .success(let state):
            trayState = state
            progress.tray = state.tray
            save()
        case .failure(let error):
            log.error("tray tap refused: \(error.code, privacy: .public)")
        }
    }

    /// The message text of the tray now.
    public var trayMessage: Spoken? {
        guard let tray, let state = trayState else { return nil }
        return tray.text(for: state.message)
    }

    // MARK: Finish

    /// Scores the attempt, writes it to the history, removes the progress. Called once, on the
    /// way into Tổng kết (SK-047; before, the reward), and again, harmlessly, if the app stopped
    /// half way through it.
    private func finish() {
        guard summary == nil else { return }
        let completedAt = now().wholeSeconds
        var quizResults: [ItemResult] = []
        var answers: [AttemptRecord.Answer] = []
        for (slot, item) in quizItems.enumerated() {
            let tries = tries(for: item, in: .quiz)
            guard let scoring = item.answer.scoringItem,
                  case .success(let score) = scoreItem(item: scoring, tries: tries, rules: rules.scoring(forFormat: item.format))
            else { continue }
            quizResults.append(ItemResult(itemId: item.id.uuidString.lowercased(), score: score))
            answers.append(AttemptRecord.Answer(
                itemId: item.id.uuidString.lowercased(), slot: slot + 1, correct: score.finalCorrect,
                points: score.points, answer: tries, hintUsed: progress.hintsUsed.contains(item.key),
                tries: score.triesUsed
            ))
        }
        let warmupResults: [ItemResult] = warmupItems.compactMap { item in
            guard let scoring = item.answer.scoringItem,
                  case .success(let score) = scoreItem(item: scoring, tries: tries(for: item, in: .warmup), rules: rules.scoring(forFormat: item.format))
            else { return nil }
            return ItemResult(itemId: item.id.uuidString.lowercased(), score: score)
        }
        let score = (try? scoreLesson(quizResults: quizResults, warmupResults: warmupResults).get())
            ?? LessonScore(correct: 0, max: quizLength, completed: false)
        // SK-026 D1, SK-040 (main session 12/11, hướng b): Explorer earns no XP. The attempt sends
        // `xp = 0` and nothing is added locally; `rules.json` keeps its values for the other groups.
        let xp = isExplorer
            ? XPAward(correct: 0, gameComplete: 0, lessonComplete: 0)
            : computeXP(score: score, gameCompleted: progress.playCompleted, rules: rules.xp)
        let localDate = Self.localDate(of: completedAt, in: context.timeZone)

        let history = store?.history().filter { $0.childId == context.childId && $0.lessonId == lesson.id && $0.id != progress.attemptId } ?? []
        var attempts = history.compactMap { record -> LessonAttempt? in
            guard let date = LocalDate(record.localDate) else { return nil }
            return LessonAttempt(
                attemptId: record.id.uuidString.lowercased(),
                completion: .init(at: record.completedAt, localDate: date),
                correct: record.score, max: record.maxScore
            )
        }
        attempts.append(LessonAttempt(
            attemptId: progress.attemptId.uuidString.lowercased(),
            completion: score.completed ? .init(at: completedAt, localDate: localDate) : nil,
            correct: score.correct, max: score.max
        ))
        let stars = computeStars(attempts: attempts, rules: rules.scoring)

        let record = AttemptRecord(
            id: progress.attemptId, childId: context.childId, lessonId: lesson.id, contentVersion: contentVersion,
            startedAt: progress.startedAt, completedAt: completedAt, score: score.correct, maxScore: score.max,
            durationS: max(0, Int(completedAt.timeIntervalSince(progress.startedAt))), xp: xp.total,
            stars: stars.stars, localDate: localDate.description, answers: answers
        )
        do {
            try store?.append(record)
        } catch {
            log.error("history not written: \(String(describing: error), privacy: .public)")
        }
        store?.deleteInProgress(lessonId: lesson.id)
        summary = LessonSummary(score: score, xp: xp, stars: stars, record: record)
    }

    /// `local_date` of an instant in the child's time zone (B5.1), for the stars' mastery gap:
    /// the engine's `localDate` (vector `local-date`, SK-022).
    nonisolated static func localDate(of date: Date, in timeZone: TimeZone) -> LocalDate {
        LessonEngine.localDate(at: date, in: timeZone)
    }

    private func save() {
        guard summary == nil, let store else { return }
        progress.updatedAt = now().wholeSeconds
        do {
            try store.save(progress)
        } catch {
            log.error("progress not saved: \(String(describing: error), privacy: .public)")
        }
    }
}

extension AttemptProgress.Step {
    /// Tổng kết and the reward come after the attempt is scored and written (SK-047).
    var finishesTheAttempt: Bool {
        self == .recap || self == .reward
    }
}
