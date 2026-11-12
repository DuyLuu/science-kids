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
const V1_FORMATS = ["single_choice", "multi_choice", "true_false", "fill_blank_bank", "order_sequence", "picture_bar_chart"];
const WARMUP_FORMATS = ["single_choice", "multi_choice", "true_false", "fill_blank_bank"];

/**
 * SK-026 "Đặc tả theo nhóm tuổi", 6 v1 formats only. Duy 1/11 (D3). Two cells the table leaves
 * open, set by the coordinator 1/11 with content-editor: Scientist max_words_en 15 (upper end of
 * 12–15, as Explorer 8 and Discoverer 10), Scientist picture_bar_chart 4 (TEMPLATE before 1/11).
 * "multi_choice ≤ 6" is [2, 6]: 2 is the content schema minimum.
 */
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
      assert.deepEqual(Object.keys(own).sort(), [...Object.keys(defaults), ...EXTRA_KEYS].sort());
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

  test("min > max và dok_mix không cộng ra 6: lỗi có pointer", () => {
    let result = withAuthoring("scientist", (a) => ((a.option_count as Record<string, number[]>).single_choice = [5, 4]));
    assert.equal(result.rules, undefined);
    assert.deepEqual(result.errors, [{ pointer: "/scientist/authoring/option_count/single_choice", message: "khoảng [5, 4] có min lớn hơn max" }]);
    result = withAuthoring("explorer", (a) => (a.dok_mix = [3, 3, 1]));
    assert.deepEqual(result.errors, [{ pointer: "/explorer/authoring/dok_mix", message: "tổng 3 + 3 + 1 = 7, phải bằng 6 (số câu quiz)" }]);
  });
});
