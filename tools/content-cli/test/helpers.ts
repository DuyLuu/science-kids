import { mkdtempSync, readFileSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import { fileURLToPath } from "node:url";

export const CLI_ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
export const FIXTURE_DIR = path.resolve(CLI_ROOT, "../../packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh");
export const TOPIC_FILE = path.join(FIXTURE_DIR, "topic.json");
export const LESSON_FILE = path.join(FIXTURE_DIR, "01-thuc-an-cho-ta-nhung-gi.json");

/**
 * content/rules.json without the warning-only keys added after SK-026, for tests of
 * SK-026/SK-027/SK-030 that count every warning:
 * - SK-033 image keys (image_expected, image_search_keywords); test/images.test.ts uses the real file;
 * - SK-047 vocab_item_uses_lesson_word: those tests edit lesson 1 (other formats, other words) and
 *   count every warning, so they should not depend on a later warning-only rule. Lesson 1 itself
 *   passes it since 15/11 (q2 asks "nutrients", a core word). The SK-047 tests in
 *   test/age-rules.test.ts use the real file.
 * multi_choice_correct_spread stays: lesson 1 has one multi_choice, so it never fires on it.
 */
export function withoutLaterWarnings<T extends Record<string, any>>(rules: T): T {
  const copy = structuredClone(rules);
  for (const group of Object.values(copy)) {
    delete group?.authoring?.image_expected;
    delete group?.authoring?.image_search_keywords;
    delete group?.authoring?.vocab_item_uses_lesson_word;
  }
  return copy;
}

let laterWarningsRulesFile: string | undefined;
/** withoutLaterWarnings(content/rules.json), written once per test process into the OS temp folder. */
export function rulesFileWithoutLaterWarnings(): string {
  if (!laterWarningsRulesFile) {
    const dir = mkdtempSync(path.join(tmpdir(), "content-cli-rules-026-"));
    laterWarningsRulesFile = path.join(dir, "rules.json");
    const rules = JSON.parse(readFileSync(path.resolve(CLI_ROOT, "../../content/rules.json"), "utf8"));
    writeFileSync(laterWarningsRulesFile, JSON.stringify(withoutLaterWarnings(rules), null, 2));
    process.on("exit", () => rmSync(dir, { recursive: true, force: true }));
  }
  return laterWarningsRulesFile;
}

export function readJson(file: string): Record<string, unknown> & { kind: "topic" | "lesson" } {
  return JSON.parse(readFileSync(file, "utf8"));
}

/**
 * SK-026: lesson 1 with q2 (fill_blank_bank, DOK 1) replaced by a valid order_sequence of 3 cards
 * that reuses Spoken objects already in the lesson (q2's texts, q1's option labels), so a copy
 * that went through tts keeps audio on every Spoken. Discoverer rules still pass; format_not_rendered
 * fires only below 0.1.0 (Discoverer renders order_sequence from 0.1.0, SK-043).
 */
export function withOrderSequence<T extends Record<string, any>>(lesson: T): T {
  const copy = structuredClone(lesson);
  const [q1, q2] = copy.quiz;
  const items = q1.options.map((option: { label: unknown }, i: number) => ({ key: `q2_seq_${i + 1}`, label: option.label }));
  copy.quiz[1] = {
    id: q2.id,
    key: q2.key,
    format: "order_sequence",
    version: q2.version,
    dok: q2.dok,
    prompt: q2.prompt,
    hint: q2.hint,
    explanation_correct: q2.explanation_correct,
    explanation_wrong: q2.explanation_wrong,
    items,
    answer: items.map((item: { key: string }) => item.key),
  };
  return copy;
}
