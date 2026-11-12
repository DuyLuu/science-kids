import ContentModel
import LessonEngine

// Content → engine: the engine has its own types with keys only (SK-010); text stays in the content.

extension QuizItem.Answer {
    /// The answer as `scoreItem` reads it; `nil` for a format this app cannot show or score.
    public var scoringItem: ScoringItem? {
        switch self {
        case .singleChoice(let choice):
            return .singleChoice(options: choice.options.map { ScoringOption(key: $0.key, correct: $0.correct) })
        case .multiChoice(let choice):
            return .multiChoice(options: choice.options.map { ScoringOption(key: $0.key, correct: $0.correct) })
        case .trueFalse(let item):
            return .trueFalse(answer: item.answer)
        case .fillBlankBank(let item):
            return .fillBlankBank(bank: item.bank.map(\.key), answers: item.answers)
        case .orderSequence(let item):
            return .orderSequence(items: item.items.map(\.key), answer: item.answer)
        case .pictureBarChart(let item):
            return .pictureBarChart(options: item.options.map { ScoringOption(key: $0.key, correct: $0.correct) })
        case .unknown:
            return nil
        }
    }

    /// Formats with a renderer in this build (SK-012 scope) for the Discoverer screens.
    /// `order_sequence` and `picture_bar_chart` have none there yet: such a question is left out
    /// like an unknown format.
    public var hasRenderer: Bool {
        hasRenderer(for: .discoverer)
    }

    /// Formats each presentation can show (SK-040). Explorer shows the three formats of
    /// `rules.explorer.authoring.quiz_formats` (`single_choice`, `true_false`, `order_sequence`);
    /// any other format in an Explorer lesson is left out like an unknown one.
    public func hasRenderer(for presentation: LessonPresentation) -> Bool {
        switch (presentation, self) {
        case (.discoverer, .singleChoice), (.discoverer, .multiChoice), (.discoverer, .trueFalse), (.discoverer, .fillBlankBank):
            true
        case (.explorer, .singleChoice), (.explorer, .trueFalse), (.explorer, .orderSequence):
            true
        default:
            false
        }
    }
}

extension BuildTray {
    /// The rules part of the block, in the block's `groups` order.
    public var trayRules: TrayRules {
        TrayRules(
            capacity: capacity,
            groups: groups.map { TrayRules.Group(key: $0.key, role: TrayRules.Role($0.role.rawValue)) },
            items: items.map { TrayRules.Item(key: $0.key, group: $0.group) }
        )
    }

    /// The text of a message key from `messages`; `nil` when the block has no text for it
    /// (`missing.<group>` of a group without a prompt).
    public func text(for message: TrayMessage) -> Spoken? {
        switch message {
        case .start: messages.start
        case .full: messages.full
        case .balanced: messages.balanced
        case .hasLimited: messages.hasLimited
        case .missing(let group): messages.missing[group]
        }
    }
}
