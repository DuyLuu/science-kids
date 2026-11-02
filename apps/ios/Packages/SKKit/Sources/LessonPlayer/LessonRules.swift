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

    public init(scoring: Rules, xp: XPRules, streak: StreakRules = StreakRules(restDaysPerWeek: 0)) {
        self.scoring = scoring
        self.xp = xp
        self.streak = streak
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
            return LessonRules(
                scoring: try decoder.decode(Rules.self, from: groupData),
                xp: try decoder.decode(XPRules.self, from: groupData),
                streak: try decoder.decode(StreakRules.self, from: groupData)
            )
        } catch {
            throw .unreadable(String(describing: error))
        }
    }
}
