// content/rules.json (B5.3) vs default_rules of the SK-003 test vectors: same keys, same values.
// Plus `authoring` (SK-026): the table "Đặc tả theo nhóm tuổi" written out by hand below.
import assert from "node:assert/strict";
import { mkdtempSync, readdirSync, readFileSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import { describe, test } from "node:test";
import { AGE_GROUPS, loadRules, RULES_SCHEMA_FILE } from "../src/build/rules.ts";
import { DEFAULT_RULES_FILE } from "../src/paths.ts";
import { QUIZ_FORMATS } from "../src/validate/format-renderers.ts";
import { CLI_ROOT } from "./helpers.ts";

const VECTOR_DIR = path.resolve(CLI_ROOT, "../../packages/content-schema/test-vectors");
/** Keys rules.json adds on top of the scoring vectors: XP (B4.4), default voice (B4.1), authoring (SK-026). */
const EXTRA_KEYS = ["xp_per_correct", "xp_lesson_complete", "xp_game_complete", "xp_mastery_review", "default_voice_mode", "authoring"];
/**
 * Duy 14/11 (SK-043): true_false (and the "check Na's idea" question, which is true_false) has one
 * try in Explorer and Discoverer. Scientist gets the same (dev 14/11: the reason, two sides, holds
 * for every group, and the iOS app already falls back to it when the key is missing). Optional key,
 * not in default_rules of the vectors yet (proposal for tester in SK-043 "dev 14/11").
 */
const MAX_TRIES_BY_FORMAT: Record<string, Record<string, number> | undefined> = { explorer: { true_false: 1 }, discoverer: { true_false: 1 }, scientist: { true_false: 1 } };
const V1_FORMATS = ["single_choice", "multi_choice", "true_false", "fill_blank_bank", "order_sequence", "picture_bar_chart"];
const WARMUP_FORMATS = ["single_choice", "multi_choice", "true_false", "fill_blank_bank"];

/**
 * SK-026 "Đặc tả theo nhóm tuổi", 6 v1 formats only. Duy 1/11 (D3). Two cells the table leaves
 * open, set by the coordinator 1/11 with content-editor: Scientist max_words_en 15 (upper end of
 * 12–15, as Explorer 8 and Discoverer 10), Scientist picture_bar_chart 4 (TEMPLATE before 1/11).
 * "multi_choice ≤ 6" is [2, 6]: 2 is the content schema minimum.
 */
/**
 * SK-047 (Duy 15/11, proposal 4.6, 4.7): in one topic at most half of the multi_choice items share a
 * number of right answers; a quiz fill_blank_bank uses a word of the lesson's vocab. Discoverer and
 * Scientist only (Explorer has neither format).
 */
const SK047 = { multi_choice_correct_spread: 0.5, vocab_item_uses_lesson_word: true };
/** SK-033 (Duy 9/11): every question, option, bank word and tray item should have a picture; a warning until Duy approves the pilot lesson. */
const IMAGE_EXPECTED = ["question", "choice_option", "sequence_item", "bank_word", "tray_item"];
const AUTHORING = {
  explorer: {
    quiz_formats: ["single_choice", "true_false", "order_sequence"],
    warmup_formats: ["single_choice", "true_false"],
    option_count: { single_choice: [2, 3], order_sequence: [3, 3] },
    image_required: ["choice_option", "sequence_item", "true_false"],
    image_expected: IMAGE_EXPECTED,
    image_search_keywords: true,
    dok_mix: [3, 3, 0],
    first_item_dok: 1,
    misconception_items: [1, 1],
    min_formats: 2,
    max_words_en: 8,
  },
  discoverer: {
    quiz_formats: V1_FORMATS,
    warmup_formats: WARMUP_FORMATS,
    option_count: { single_choice: [3, 4], multi_choice: [2, 6], order_sequence: [3, 5], picture_bar_chart: [3, 4] },
    image_required: [],
    image_expected: IMAGE_EXPECTED,
    image_search_keywords: true,
    dok_mix: [2, 3, 1],
    first_item_dok: 1,
    misconception_items: [1, 1],
    min_formats: 3,
    max_words_en: 10,
    ...SK047,
  },
  scientist: {
    quiz_formats: V1_FORMATS,
    warmup_formats: WARMUP_FORMATS,
    option_count: { single_choice: [4, 4], multi_choice: [2, 6], order_sequence: [3, 6], picture_bar_chart: [4, 4] },
    image_required: [],
    image_expected: IMAGE_EXPECTED,
    image_search_keywords: true,
    dok_mix: [1, 3, 2],
    first_item_dok: 1,
    misconception_items: [1, 2],
    min_formats: 3,
    max_words_en: 15,
    ...SK047,
  },
};

describe("content/rules.json", () => {
  const { rules, errors } = loadRules(DEFAULT_RULES_FILE);
  const vectors = readdirSync(VECTOR_DIR)
    .filter((name) => name.endsWith(".json") && name !== "vector.schema.json")
    .sort()
    .map((name) => ({ name, defaults: JSON.parse(readFileSync(path.join(VECTOR_DIR, name), "utf8")).default_rules }));

  test("hợp lệ theo schema/rules.schema.json, đủ 3 nhóm tuổi", () => {
    assert.deepEqual(errors, []);
    assert.deepEqual(Object.keys(rules!), [...AGE_GROUPS]);
  });

  test("mọi file vector có cùng default_rules", () => {
    // 6 files at SK-015 (28/10); build-tray.json came later (29/10). What matters is that all agree.
    assert.ok(vectors.length >= 6, `${vectors.length} file vector`);
    for (const { name, defaults } of vectors) assert.deepEqual(defaults, vectors[0]!.defaults, name);
  });

  for (const group of AGE_GROUPS) {
    test(`${group}: khoá và giá trị luật chấm trùng default_rules, thêm đúng XP, giọng mặc định và authoring`, () => {
      const own = rules![group]!;
      const defaults = vectors[0]!.defaults as Record<string, unknown>;
      const optional = MAX_TRIES_BY_FORMAT[group] ? ["max_tries_by_format"] : [];
      assert.deepEqual(Object.keys(own).sort(), [...Object.keys(defaults), ...EXTRA_KEYS, ...optional].sort());
      for (const key of Object.keys(defaults)) assert.deepEqual(own[key], defaults[key], `${group}.${key}`);
    });
  }

  test("XP theo B4.4 (GĐ 0: Explorer chưa đặt xp_* = 0, SK-026), giọng mặc định theo B4.1 (Explorer luôn both)", () => {
    for (const group of AGE_GROUPS) {
      const own = rules![group]!;
      assert.deepEqual(
        { per_correct: own.xp_per_correct, lesson: own.xp_lesson_complete, game: own.xp_game_complete, mastery: own.xp_mastery_review },
        { per_correct: 10, lesson: 20, game: 10, mastery: 20 },
      );
    }
    assert.deepEqual(rules!.discoverer!.default_voice_mode, { bilingual: "both", en_first: "en", vi_first: "both" });
    assert.deepEqual(rules!.scientist!.default_voice_mode, { bilingual: "both", en_first: "en", vi_first: "both" });
    assert.deepEqual(rules!.explorer!.default_voice_mode, { bilingual: "both", en_first: "both", vi_first: "both" });
  });

  test("max_tries_by_format (Duy 14/11, SK-043): true_false một lượt ở mọi nhóm; format khác theo max_tries", () => {
    for (const group of AGE_GROUPS) assert.deepEqual(rules![group]!.max_tries_by_format, MAX_TRIES_BY_FORMAT[group], group);
  });

  test("rules.schema.json: max_tries_by_format chỉ nhận format có thật và số >= 1", () => {
    const dir = mkdtempSync(path.join(tmpdir(), "rules-tries-"));
    try {
      const file = path.join(dir, "rules.json");
      const bad: [unknown, RegExp][] = [
        [{ true_flase: 1 }, /\/explorer\/max_tries_by_format/],
        [{ true_false: 0 }, /\/explorer\/max_tries_by_format\/true_false/],
        [{}, /\/explorer\/max_tries_by_format/],
      ];
      for (const [value, pointer] of bad) {
        writeFileSync(file, JSON.stringify({ ...rules, explorer: { ...rules!.explorer, max_tries_by_format: value } }));
        const { errors } = loadRules(file);
        assert.ok(errors.some((error) => pointer.test(error.pointer)), `${JSON.stringify(value)}: ${JSON.stringify(errors)}`);
      }
      const { explorer, ...rest } = rules!;
      const { max_tries_by_format: _dropped, ...withoutKey } = explorer!;
      writeFileSync(file, JSON.stringify({ ...rest, explorer: withoutKey }));
      assert.deepEqual(loadRules(file).errors, [], "khoá tuỳ chọn: thiếu thì mọi format theo max_tries");
    } finally {
      rmSync(dir, { recursive: true, force: true });
    }
  });

  for (const group of AGE_GROUPS) {
    test(`${group}.authoring trùng bảng Đặc tả của SK-026`, () => {
      assert.deepEqual(rules![group]!.authoring, AUTHORING[group]);
    });
  }

  test("format trong rules.schema.json trùng enum format của content-schema (quiz-item.schema.json)", () => {
    const schema = JSON.parse(readFileSync(RULES_SCHEMA_FILE, "utf8"));
    assert.deepEqual(schema.$defs.QuizFormat.enum, [...QUIZ_FORMATS]);
    const counted = schema.$defs.Authoring.properties.option_count.propertyNames.enum;
    assert.deepEqual(counted, QUIZ_FORMATS.filter((format) => format !== "true_false"));
  });
});

describe("loadRules: authoring", () => {
  const base = JSON.parse(readFileSync(DEFAULT_RULES_FILE, "utf8"));
  const withAuthoring = (group: string, edit: (authoring: Record<string, unknown>) => void) => {
    const copy = structuredClone(base);
    edit(copy[group].authoring);
    const dir = mkdtempSync(path.join(tmpdir(), "content-cli-rules-"));
    const file = path.join(dir, "rules.json");
    writeFileSync(file, JSON.stringify(copy));
    try {
      return loadRules(file);
    } finally {
      rmSync(dir, { recursive: true, force: true });
    }
  };

  test("thiếu authoring vẫn hợp lệ theo schema (validate và build báo age_rules_missing)", () => {
    const copy = structuredClone(base);
    delete copy.scientist.authoring;
    const dir = mkdtempSync(path.join(tmpdir(), "content-cli-rules-"));
    writeFileSync(path.join(dir, "rules.json"), JSON.stringify(copy));
    const { rules, errors } = loadRules(path.join(dir, "rules.json"));
    rmSync(dir, { recursive: true, force: true });
    assert.deepEqual(errors, []);
    assert.equal(rules!.scientist!.authoring, undefined);
  });

  test("khoá gõ sai, format lạ, khoảng sai dạng: lỗi schema có pointer", () => {
    let result = withAuthoring("explorer", (a) => (a.max_word_en = 8));
    assert.ok(result.errors.some((e) => e.pointer === "/explorer/authoring" && e.message.includes("max_word_en")), JSON.stringify(result.errors));
    result = withAuthoring("explorer", (a) => (a.quiz_formats = ["single_choice", "sort_into_groups"]));
    assert.ok(result.errors.some((e) => e.pointer === "/explorer/authoring/quiz_formats/1"), JSON.stringify(result.errors));
    result = withAuthoring("discoverer", (a) => (a.option_count = { true_false: [2, 2] }));
    assert.ok(result.errors.some((e) => e.pointer === "/discoverer/authoring/option_count" && e.message.includes("true_false")), JSON.stringify(result.errors));
    result = withAuthoring("discoverer", (a) => (a.misconception_items = [1]));
    assert.ok(result.errors.some((e) => e.pointer === "/discoverer/authoring/misconception_items"), JSON.stringify(result.errors));
  });

  test("multi_choice_correct_spread chỉ nhận số trong (0, 1]; vocab_item_uses_lesson_word chỉ nhận boolean (SK-047)", () => {
    for (const value of [0, 1.5, "a", -0.5]) {
      const result = withAuthoring("discoverer", (a) => (a.multi_choice_correct_spread = value));
      assert.equal(result.rules, undefined, JSON.stringify(value));
      assert.ok(result.errors.length > 0 && result.errors.every((e) => e.pointer === "/discoverer/authoring/multi_choice_correct_spread"), `${JSON.stringify(value)}: ${JSON.stringify(result.errors)}`);
    }
    for (const value of [1, 0.25]) assert.deepEqual(withAuthoring("scientist", (a) => (a.multi_choice_correct_spread = value)).errors, [], String(value));
    const result = withAuthoring("scientist", (a) => (a.vocab_item_uses_lesson_word = "yes"));
    assert.ok(result.errors.some((e) => e.pointer === "/scientist/authoring/vocab_item_uses_lesson_word"), JSON.stringify(result.errors));
    // Optional keys: Explorer has neither, and a group without them is valid.
    assert.deepEqual(withAuthoring("discoverer", (a) => (delete a.multi_choice_correct_spread, delete a.vocab_item_uses_lesson_word)).errors, []);
  });

  test("min > max và dok_mix không cộng ra 6: lỗi có pointer", () => {
    let result = withAuthoring("scientist", (a) => ((a.option_count as Record<string, number[]>).single_choice = [5, 4]));
    assert.equal(result.rules, undefined);
    assert.deepEqual(result.errors, [{ pointer: "/scientist/authoring/option_count/single_choice", message: "khoảng [5, 4] có min lớn hơn max" }]);
    result = withAuthoring("explorer", (a) => (a.dok_mix = [3, 3, 1]));
    assert.deepEqual(result.errors, [{ pointer: "/explorer/authoring/dok_mix", message: "tổng 3 + 3 + 1 = 7, phải bằng 6 (số câu quiz)" }]);
  });
});
