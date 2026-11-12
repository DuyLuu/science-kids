import { mkdtempSync, readFileSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import { fileURLToPath } from "node:url";

export const CLI_ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
export const FIXTURE_DIR = path.resolve(CLI_ROOT, "../../packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh");
export const TOPIC_FILE = path.join(FIXTURE_DIR, "topic.json");
export const LESSON_FILE = path.join(FIXTURE_DIR, "01-thuc-an-cho-ta-nhung-gi.json");

/**
 * content/rules.json without the SK-033 image keys (image_expected, image_search_keywords): the
 * rules as they were before SK-033, for tests of SK-026/SK-027/SK-030 that count every warning.
 * The images tests (test/images.test.ts, age rules part) use the real file.
 */
export function withoutImageChecks<T extends Record<string, any>>(rules: T): T {
  const copy = structuredClone(rules);
  for (const group of Object.values(copy)) {
    delete group?.authoring?.image_expected;
    delete group?.authoring?.image_search_keywords;
  }
  return copy;
}

let noImageRulesFile: string | undefined;
/** withoutImageChecks(content/rules.json), written once per test process into the OS temp folder. */
export function rulesFileWithoutImageChecks(): string {
  if (!noImageRulesFile) {
    const dir = mkdtempSync(path.join(tmpdir(), "content-cli-rules-no-image-"));
    noImageRulesFile = path.join(dir, "rules.json");
    const rules = JSON.parse(readFileSync(path.resolve(CLI_ROOT, "../../content/rules.json"), "utf8"));
    writeFileSync(noImageRulesFile, JSON.stringify(withoutImageChecks(rules), null, 2));
    process.on("exit", () => rmSync(dir, { recursive: true, force: true }));
  }
  return noImageRulesFile;
}

export function readJson(file: string): Record<string, unknown> & { kind: "topic" | "lesson" } {
  return JSON.parse(readFileSync(file, "utf8"));
}

/**
 * SK-026: lesson 1 with q2 (fill_blank_bank, DOK 1) replaced by a valid order_sequence of 3 cards
 * that reuses Spoken objects already in the lesson (q2's texts, q1's option labels), so a copy
 * that went through tts keeps audio on every Spoken. Discoverer rules still pass; only
 * format_not_rendered fires (no app renders order_sequence in a Discoverer lesson yet).
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
