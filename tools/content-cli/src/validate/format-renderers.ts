// Quiz format -> first app version that renders it (SK-026, code `format_not_rendered`).
// One table for build and validate. An app older than this drops the question (Lesson.swift),
// so the quiz has fewer than 6 questions; build refuses such a lesson unless --min-app-version
// (or a block min_app_version) is at least this version, so older apps see "cần cập nhật".
//
// Source: iOS `QuizAnswer.hasRenderer(for:)` (apps/ios/Packages/SKKit/Sources/LessonPlayer/ContentScoring.swift).
// The app picks the screens from the topic's age_group (SK-040: `.explorer` / `.discoverer`;
// Scientist runs as Discoverer), so the table has a column per presentation:
// FORMAT_FIRST_APP_VERSION is the Discoverer one (also Scientist), and a group listed in
// FORMAT_FIRST_APP_VERSION_BY_GROUP uses its own full column. firstAppVersion() picks.
//
// Versions: the iOS MARKETING_VERSION is 0.1.0 (apps/ios/Config/Base.xcconfig) and no build has
// shipped yet (SK-020 todo: no TestFlight, no store). So a renderer that lands before the first
// shipped build is listed at 0.1.0, which is the --min-app-version default (SK-040: Explorer
// order_sequence). Once a build ships, a new renderer gets the next MARKETING_VERSION, and
// content using it needs --min-app-version (or a block min_app_version) that high.
// ios-dev proposes an update each time a renderer ships (in the ticket of that renderer); dev edits
// this file. Android (after the iOS beta) gets its own column when it ships.
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";

const QUIZ_ITEM_SCHEMA = fileURLToPath(import.meta.resolve("@science-kids/content-schema/schema/quiz-item.schema.json"));

/** The `format` enum of quiz-item.schema.json (content schema v1 and its additions). */
export const QUIZ_FORMATS: readonly string[] = JSON.parse(readFileSync(QUIZ_ITEM_SCHEMA, "utf8")).$defs.QuizItem.properties.format.enum;

/** Discoverer and Scientist. null = no app version renders it yet. Every format of QUIZ_FORMATS has a row (test/age-rules.test.ts). */
export const FORMAT_FIRST_APP_VERSION: Readonly<Record<string, string | null>> = {
  single_choice: "0.1.0",
  multi_choice: "0.1.0",
  true_false: "0.1.0",
  fill_blank_bank: "0.1.0",
  // Renderers planned for GĐ 1 S4 (technical-plan.md line 663).
  order_sequence: null,
  picture_bar_chart: null,
};

/**
 * Age groups whose screens differ from Discoverer, each with a full column (every format of
 * QUIZ_FORMATS). Explorer (SK-040) shows only the formats of rules.explorer quiz_formats; the app
 * drops any other format in an Explorer lesson.
 */
export const FORMAT_FIRST_APP_VERSION_BY_GROUP: Readonly<Record<string, Readonly<Record<string, string | null>>>> = {
  explorer: {
    single_choice: "0.1.0",
    true_false: "0.1.0",
    order_sequence: "0.1.0", // SK-040, before the first shipped build
    multi_choice: null,
    fill_blank_bank: null,
    picture_bar_chart: null,
  },
};

/** First app version that renders `format` in a topic of `ageGroup`; null = none yet. */
export function firstAppVersion(format: string, ageGroup: string): string | null {
  const column = FORMAT_FIRST_APP_VERSION_BY_GROUP[ageGroup] ?? FORMAT_FIRST_APP_VERSION;
  return column[format] ?? null;
}
