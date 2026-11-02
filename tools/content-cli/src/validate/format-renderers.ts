// Quiz format -> first app version that renders it (SK-026, code `format_not_rendered`).
// One table for build and validate. An app older than this drops the question (Lesson.swift),
// so the quiz has fewer than 6 questions; build refuses such a lesson unless --min-app-version
// (or a block min_app_version) is at least this version, so older apps see "cần cập nhật".
//
// Source: iOS `QuizAnswer.hasRenderer` (apps/ios/Packages/SKKit/Sources/LessonPlayer/ContentScoring.swift).
// ios-dev proposes an update each time a renderer ships (in the ticket of that renderer); dev edits
// this file. Android (after the iOS beta) gets its own column when it ships.
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";

const QUIZ_ITEM_SCHEMA = fileURLToPath(import.meta.resolve("@science-kids/content-schema/schema/quiz-item.schema.json"));

/** The `format` enum of quiz-item.schema.json (content schema v1 and its additions). */
export const QUIZ_FORMATS: readonly string[] = JSON.parse(readFileSync(QUIZ_ITEM_SCHEMA, "utf8")).$defs.QuizItem.properties.format.enum;

/** null = no app version renders it yet. Every format of QUIZ_FORMATS has a row (test/age-rules.test.ts). */
export const FORMAT_FIRST_APP_VERSION: Readonly<Record<string, string | null>> = {
  single_choice: "0.1.0",
  multi_choice: "0.1.0",
  true_false: "0.1.0",
  fill_blank_bank: "0.1.0",
  // Renderers planned for GĐ 1 S4 (technical-plan.md line 663).
  order_sequence: null,
  picture_bar_chart: null,
};
