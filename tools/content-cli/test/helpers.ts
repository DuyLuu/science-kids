import { readFileSync } from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

export const CLI_ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
export const FIXTURE_DIR = path.resolve(CLI_ROOT, "../../packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh");
export const TOPIC_FILE = path.join(FIXTURE_DIR, "topic.json");
export const LESSON_FILE = path.join(FIXTURE_DIR, "01-thuc-an-cho-ta-nhung-gi.json");

export function readJson(file: string): Record<string, unknown> & { kind: "topic" | "lesson" } {
  return JSON.parse(readFileSync(file, "utf8"));
}

/**
 * SK-026: lesson 1 with q2 (fill_blank_bank, DOK 1) replaced by a valid order_sequence of 3 cards
 * that reuses Spoken objects already in the lesson (q2's texts, q1's option labels), so a copy
 * that went through tts keeps audio on every Spoken. Discoverer rules still pass; only
 * format_not_rendered fires (no app renders order_sequence at 0.1.0).
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
