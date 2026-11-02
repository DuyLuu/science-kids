import Foundation
import Testing
@testable import LessonEngine

/// The suites the engine covers (SK-010; `build-tray` SK-012; `streak`, `local-date` SK-022), with the
/// minimum case count of each.
let engineSuites: [(name: String, minimum: Int)] = [
    ("item-scoring", 20),
    ("lesson-score", 6),
    ("stars", 12),
    ("build-tray", 20),
    ("streak", 18),
    ("local-date", 13),
]

/// Shared test vectors (SK-003): every case of every suite, `confirmed` and `proposed` alike.
/// Failures are reported by case `id`.
@Suite struct SharedVectors {
    @Test(arguments: engineSuites.map(\.name))
    func suite(_ name: String) throws {
        let suite = try VectorSuite.load(name)
        let minimum = engineSuites.first { $0.name == name }?.minimum ?? 1
        #expect(suite.cases.count >= minimum, "\(name) has \(suite.cases.count) cases")
        let report = Harness.run(suite)
        for outcome in report.outcomes where !outcome.passed {
            Issue.record("\(outcome.id) [\(outcome.status)]: \(outcome.detail)")
        }
        print("vectors \(report.summary)")
        #expect(report.passed == report.total)
    }

    @Test func allSuitesTogether() throws {
        let reports = try engineSuites.map { try Harness.run(VectorSuite.load($0.name)) }
        let outcomes = reports.flatMap(\.outcomes)
        let all = SuiteReport(suite: "all", outcomes: outcomes)
        let ids = outcomes.map(\.id)
        #expect(Set(ids).count == ids.count, "case ids are unique across suites")
        print("vectors " + reports.map(\.summary).joined(separator: "\nvectors "))
        print("vectors \(all.summary)")
        #expect(all.passed == all.total)
    }
}

/// Proves the harness can fail and that rules come from each case, not from constants.
@Suite struct HarnessSelfCheck {
    /// Change one `expected` in a copy → exactly that case fails, by id.
    @Test func editedExpectationFailsByID() throws {
        var items = try VectorSuite.load("item-scoring")
        items.editCase("item-scoring-001") { item in
            item["expected"] = .object([
                "points": .number(0), "try_results": .array([.bool(true)]),
                "final_correct": .bool(true), "tries_used": .number(1),
            ])
        }
        #expect(Harness.run(items).failedIDs == ["item-scoring-001"])

        var lessons = try VectorSuite.load("lesson-score")
        lessons.editCase("lesson-score-003") { item in
            item["expected"] = .object(["correct": .number(6), "max": .number(6), "completed": .bool(true)])
        }
        #expect(Harness.run(lessons).failedIDs == ["lesson-score-003"])

        var stars = try VectorSuite.load("stars")
        stars.editCase("stars-006") { item in
            item["expected"] = .object([
                "stars": .number(3), "first_pass_date": .string("2026-11-02"), "mastered_date": .string("2026-11-04"),
            ])
        }
        // null and a missing key are different results.
        stars.editCase("stars-002") { item in
            item["expected"] = .object(["stars": .number(1), "first_pass_date": .null])
        }
        let report = Harness.run(stars)
        #expect(report.failedIDs == ["stars-002", "stars-006"])
        print("harness self-check: edited expectations fail as \(report.failedIDs)")
    }

    /// `default_rules.pass_threshold` = 4/6 in a copy → still every case passes, because every
    /// threshold-dependent case pins its own `pass_threshold` (SK-003).
    @Test func defaultThresholdFourSixthsStillPasses() throws {
        var total = 0
        var passed = 0
        for (name, _) in engineSuites {
            var suite = try VectorSuite.load(name)
            suite.defaultRules["pass_threshold"] = .object(["num": .number(4), "den": .number(6)])
            let report = Harness.run(suite)
            for outcome in report.outcomes where !outcome.passed {
                Issue.record("\(outcome.id) with default 4/6: \(outcome.detail)")
            }
            total += report.total
            passed += report.passed
        }
        print("vectors with default_rules.pass_threshold 4/6: \(passed)/\(total) pass")
        #expect(passed == total)
    }

    /// And the threshold really flows from rules: drop the pin of stars-021 (4/6 attempt, pinned 5/6)
    /// while the default is 4/6 → the engine now passes the attempt and the case fails.
    @Test func unpinnedThresholdFollowsDefaultRules() throws {
        var suite = try VectorSuite.load("stars")
        suite.defaultRules["pass_threshold"] = .object(["num": .number(4), "den": .number(6)])
        suite.editCase("stars-021") { item in item["rules"] = nil }
        let outcome = Harness.run(suite).outcomes.first { $0.id == "stars-021" }
        #expect(outcome?.passed == false)
        #expect(outcome?.detail.contains("\"stars\":2") == true, "\(outcome?.detail ?? "")")
    }
}
