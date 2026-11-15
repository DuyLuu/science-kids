import Foundation
import LessonEngine

/// The rules a lesson is scored with: `Rules` (tries, pass threshold, mastery gap) and `XPRules`,
/// for one age group. Read from the `rules` object of `content/rules.json` (B5.3: one source; the
/// pack manifest carries a copy, SK-015), never written in code.
public struct LessonRules: Hashable, Sendable {
    public var scoring: Rules
    public var xp: XPRules
    /// Rest days of the day streak (SK-022).
    public var streak: StreakRules
    /// Tries per question by `format`, over `scoring.maxTries` (`max_tries_by_format` of the age
    /// group). Duy 14/11 (SK-043, point 6): `true_false`, Na's questions included, has one try in
    /// every age group: with two sides, the feedback of a wrong tap all but says the answer.
    /// Until `rules.json` carries the key (dev, SK-043), the app uses `defaultMaxTriesByFormat`.
    public var maxTriesByFormat: [String: Int]

    /// Used when the rules have no `max_tries_by_format` (Duy 14/11). Temporary: the key belongs
    /// in `content/rules.json` with the server's copy.
    public static let defaultMaxTriesByFormat = ["true_false": 1]

    public init(scoring: Rules, xp: XPRules, streak: StreakRules = StreakRules(restDaysPerWeek: 0),
                maxTriesByFormat: [String: Int] = LessonRules.defaultMaxTriesByFormat) {
        self.scoring = scoring
        self.xp = xp
        self.streak = streak
        self.maxTriesByFormat = maxTriesByFormat
    }

    /// The scoring rules of one question: `maxTries` of its format when the rules give one.
    public func scoring(forFormat format: String) -> Rules {
        guard let tries = maxTriesByFormat[format], tries >= 1 else { return scoring }
        var rules = scoring
        rules.maxTries = tries
        return rules
    }

    public enum LoadError: Error, Equatable, Sendable {
        /// The file has no object for this age group.
        case noRules(ageGroup: String)
        case unreadable(String)
    }

    /// `data` is `content/rules.json` (or the manifest's `rules`): `{ "<age_group>": { … } }`.
    public static func load(from data: Data, ageGroup: String) throws(LoadError) -> LessonRules {
        let groupData: Data
        do {
            let root = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            guard let group = root?[ageGroup] as? [String: Any] else { throw LoadError.noRules(ageGroup: ageGroup) }
            groupData = try JSONSerialization.data(withJSONObject: group)
        } catch let error as LoadError {
            throw error
        } catch {
            throw .unreadable(String(describing: error))
        }
        do {
            let decoder = JSONDecoder()
            let byFormat = try decoder.decode(TriesByFormat.self, from: groupData).maxTriesByFormat
            return LessonRules(
                scoring: try decoder.decode(Rules.self, from: groupData),
                xp: try decoder.decode(XPRules.self, from: groupData),
                streak: try decoder.decode(StreakRules.self, from: groupData),
                maxTriesByFormat: byFormat ?? defaultMaxTriesByFormat
            )
        } catch {
            throw .unreadable(String(describing: error))
        }
    }
}

/// `max_tries_by_format` of an age group's rules, when present.
private struct TriesByFormat: Decodable {
    let maxTriesByFormat: [String: Int]?

    enum CodingKeys: String, CodingKey {
        case maxTriesByFormat = "max_tries_by_format"
    }
}
