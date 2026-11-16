// SK-026: authoring rules per age group (src/validate/age-rules.ts) and `content-cli validate`.
// Fixtures: test/fixtures/age-rules/ (scripts/make-age-fixtures.ts) + lesson 1 of content-schema.
import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import { createHash } from "node:crypto";
import { mkdirSync, mkdtempSync, readFileSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import { after, before, describe, test } from "node:test";
import { validateDocuments } from "@science-kids/content-schema/validate";
import { loadRules } from "../src/build/rules.ts";
import { DEFAULT_RULES_FILE } from "../src/paths.ts";
import { checkAgeRules, correctSpreadLimit, countWords, formatIssue, ISSUE_LEVELS, sameWord, sentencesOf, type AgeDoc, type Issue } from "../src/validate/age-rules.ts";
import { firstAppVersion, FORMAT_FIRST_APP_VERSION, FORMAT_FIRST_APP_VERSION_BY_GROUP, QUIZ_FORMATS } from "../src/validate/format-renderers.ts";
import { CLI_ROOT, LESSON_FILE, rulesFileWithoutLaterWarnings, TOPIC_FILE, withOrderSequence, withoutLaterWarnings } from "./helpers.ts";

const cli = path.join(CLI_ROOT, "src", "cli.ts");
const FIXTURES = path.join(CLI_ROOT, "test", "fixtures", "age-rules");
type Row = { file: string; description: string; group: string; context: string[]; errors: { pointer: string; code: string }[] };
const EXPECTED: { valid: { group: string; files: string[] }[]; invalid: Row[] } = JSON.parse(readFileSync(path.join(FIXTURES, "expected.json"), "utf8"));
const { rules } = loadRules(DEFAULT_RULES_FILE);
/** SK-026 tests count every warning: rules without the warning-only keys of SK-033 (images.test.ts) and SK-047 (tested below with the real rules). */
const RULES_026 = withoutLaterWarnings(rules!);
const RULES_026_ARGS = ["--rules", rulesFileWithoutLaterWarnings()];

const doc = (file: string): AgeDoc & { text: string } => {
  const text = readFileSync(path.resolve(CLI_ROOT, file), "utf8");
  return { display: file, text, data: JSON.parse(text) };
};
const check = (files: string[], mode: "build" | "validate" = "validate", minAppVersion = "0.1.0", withRules = RULES_026) =>
  checkAgeRules(files.map(doc), withRules, { minAppVersion, mode, rulesDisplay: "content/rules.json" });
const only = (issues: Issue[], severity: Issue["severity"]) => issues.filter((issue) => issue.severity === severity).map(({ pointer, code }) => ({ pointer, code }));
/** Runs the CLI from tools/content-cli (paths in output are relative to it). */
const run = (...args: string[]) => {
  const result = spawnSync(process.execPath, [cli, ...args], { cwd: CLI_ROOT, encoding: "utf8", env: { ...process.env, INIT_CWD: CLI_ROOT } });
  return { status: result.status, out: result.stdout, err: result.stderr, lines: result.stdout.split("\n").filter(Boolean) };
};
const LESSON1 = [path.relative(CLI_ROOT, TOPIC_FILE), path.relative(CLI_ROOT, LESSON_FILE)];

describe("bảng mã và bảng format → bản app", () => {
  test("11 mã của SK-026, 2 mã cảnh báo hình của SK-033 và 2 mã của SK-047, đúng mức", () => {
    assert.deepEqual(ISSUE_LEVELS, {
      age_rules_missing: "error",
      age_format_not_allowed: "error",
      age_option_count: "error",
      age_image_required: "error",
      age_first_item_dok: "error",
      age_dok_mix: "error",
      age_misconception_count: "error",
      age_format_variety: "error",
      age_dok_order: "warning",
      age_words_en: "warning",
      format_not_rendered: "build: error, validate: warning",
      image_missing: "warning",
      image_brief_keywords: "warning",
      // SK-047: a warning while content-editor reworked the 40 Discoverer lessons, an error since 15/11.
      multi_choice_correct_spread: "error",
      vocab_item_uses_lesson_word: "warning",
    });
  });

  test("mỗi format của content-schema có một dòng; 0.1.0 hiện cả 6 format như hasRenderer của iOS (SK-043: order_sequence, picture_bar_chart)", () => {
    assert.deepEqual(Object.keys(FORMAT_FIRST_APP_VERSION).sort(), [...QUIZ_FORMATS].sort());
    assert.deepEqual(
      Object.entries(FORMAT_FIRST_APP_VERSION).filter(([, version]) => version === "0.1.0").map(([format]) => format).sort(),
      ["fill_blank_bank", "multi_choice", "order_sequence", "picture_bar_chart", "single_choice", "true_false"],
    );
  });

  test("cột Explorer (SK-040): đủ mọi format; 0.1.0 hiện đúng 3 format như hasRenderer(for: .explorer); Scientist dùng cột Discoverer", () => {
    assert.deepEqual(Object.keys(FORMAT_FIRST_APP_VERSION_BY_GROUP), ["explorer"]);
    const explorer = FORMAT_FIRST_APP_VERSION_BY_GROUP.explorer!;
    assert.deepEqual(Object.keys(explorer).sort(), [...QUIZ_FORMATS].sort());
    assert.deepEqual(
      Object.entries(explorer).filter(([, version]) => version === "0.1.0").map(([format]) => format).sort(),
      ["order_sequence", "single_choice", "true_false"],
    );
    assert.equal(firstAppVersion("order_sequence", "explorer"), "0.1.0");
    assert.equal(firstAppVersion("multi_choice", "explorer"), null);
    assert.equal(firstAppVersion("order_sequence", "discoverer"), "0.1.0");
    assert.equal(firstAppVersion("picture_bar_chart", "scientist"), "0.1.0");
    assert.equal(firstAppVersion("picture_bar_chart", "explorer"), null);
    assert.equal(firstAppVersion("multi_choice", "scientist"), "0.1.0");
  });
});

describe("đếm từ EN", () => {
  test("tách câu sau . ! ? …; ô trống {1} là một từ, gạch ngang không phải", () => {
    assert.deepEqual(sentencesOf("Oranges have vitamins. Rice gives energy!  Why?"), ["Oranges have vitamins.", "Rice gives energy!", "Why?"]);
    assert.equal(countWords("Animals, including humans, need food, water and {1} to live."), 10);
    assert.equal(countWords("Fats — like oil — give energy."), 5);
    assert.equal(countWords("It's 5 o'clock."), 3);
  });
});

describe("fixture hợp lệ", () => {
  for (const { group, files } of EXPECTED.valid) {
    test(`${group}: qua content-schema, không lỗi luật tuổi`, () => {
      const report = validateDocuments(files.map(doc).map(({ display, text }) => ({ file: display, text })));
      assert.deepEqual(report.errors, []);
      assert.deepEqual(only(check(files), "error"), []);
    });
  }

  test("cảnh báo: không nhóm nào có (Explorer order_sequence ở q4 hiện được từ 0.1.0, SK-040)", () => {
    const warnings = (group: string) => only(check(EXPECTED.valid.find((row) => row.group === group)!.files), "warning");
    assert.deepEqual(warnings("explorer"), []);
    assert.deepEqual(only(check(EXPECTED.valid.find((row) => row.group === "explorer")!.files, "build"), "error"), []);
    assert.deepEqual(warnings("discoverer"), []);
    assert.deepEqual(warnings("scientist"), []);
  });

  test("Scientist có 2 câu misconception: không lỗi", () => {
    const lesson = doc(EXPECTED.valid.find((row) => row.group === "scientist")!.files[1]!).data as unknown as { quiz: { misconception_id?: string }[] };
    assert.equal(lesson.quiz.filter((item) => item.misconception_id).length, 2);
  });
});

describe("fixture một lỗi (test/fixtures/age-rules/invalid)", () => {
  test("có mọi ca SK-026 nêu ở tiêu chí GĐ 0", () => {
    const names = EXPECTED.invalid.map((row) => path.basename(row.file, ".json"));
    for (const name of [
      "explorer-option-no-image",
      "explorer-single-choice-4-options",
      "explorer-fill-blank-bank",
      "explorer-true-false-no-image",
      "discoverer-single-choice-2-options",
      "scientist-single-choice-3-options",
      "discoverer-first-item-dok",
      "discoverer-no-misconception",
      "scientist-3-misconceptions",
      "discoverer-2-formats",
    ]) assert.ok(names.includes(name), name);
  });

  for (const row of EXPECTED.invalid) {
    test(`${path.basename(row.file)}: ${row.description} -> ${row.errors.map((e) => `${e.pointer} [${e.code}]`).join(", ")}`, () => {
      const files = [...row.context, row.file];
      const report = validateDocuments(files.map(doc).map(({ display, text }) => ({ file: display, text })));
      assert.deepEqual(report.errors, [], "fixture phải hợp lệ theo content-schema");
      const issues = check(files);
      const errors = issues.filter((issue) => issue.severity === "error");
      assert.deepEqual(errors.map(({ file, pointer, code }) => ({ file, pointer, code })), row.errors.map((e) => ({ file: row.file, ...e })), errors.map(formatIssue).join("\n"));
    });
  }
});

describe("content-cli validate", () => {
  let root: string;
  before(() => {
    root = mkdtempSync(path.join(tmpdir(), "content-cli-validate-"));
  });
  after(() => rmSync(root, { recursive: true, force: true }));
  /** Copies of lesson 1 in <root>/<name>/an-uong-lanh-manh/, edited. */
  const lesson1Copy = (name: string, edit: { topic?: (t: any) => void; lesson?: (l: any) => any }) => {
    const dir = path.join(root, name, "an-uong-lanh-manh");
    mkdirSync(dir, { recursive: true });
    const topic = JSON.parse(readFileSync(TOPIC_FILE, "utf8"));
    let lesson = JSON.parse(readFileSync(LESSON_FILE, "utf8"));
    edit.topic?.(topic);
    lesson = edit.lesson?.(lesson) ?? lesson;
    const files = [path.join(dir, "topic.json"), path.join(dir, path.basename(LESSON_FILE))];
    writeFileSync(files[0]!, JSON.stringify(topic, null, 2));
    writeFileSync(files[1]!, JSON.stringify(lesson, null, 2));
    return files;
  };

  test("bài 1: exit 0, không lỗi, không cảnh báo", () => {
    const result = run("validate", ...LESSON1, ...RULES_026_ARGS);
    assert.equal(result.status, 0, result.out);
    assert.match(result.out, /nhóm discoverer · 0 lỗi · 0 cảnh báo/);
    assert.equal(result.lines.filter((line) => line.includes("[")).length, 0, result.out);
  });

  test("bài 1 đổi sang Explorer: exit 1, có đủ các dòng của tiêu chí", () => {
    const files = lesson1Copy("explorer", { topic: (t) => (t.age_group = "explorer") });
    const result = run("validate", ...files, ...RULES_026_ARGS);
    assert.equal(result.status, 1, result.out);
    // Files outside the cwd print with their absolute path (same rule as content-schema validate.mjs).
    const lesson = files[1]!;
    for (const tail of [
      "/warmup/0/format [age_format_not_allowed]",
      "/quiz/1/format [age_format_not_allowed]",
      "/quiz/4/format [age_format_not_allowed]",
      "/quiz/3/options/0 [age_image_required]",
      "/quiz/5 [age_image_required]",
      "/quiz [age_dok_mix]",
    ]) assert.ok(result.lines.some((line) => line.startsWith(`${lesson} ${tail} `)), `${tail}\n${result.out}`);
    // Warnings come after errors and never count as errors.
    const firstWarning = result.lines.findIndex((line) => line.includes("] cảnh báo: "));
    const lastError = result.lines.findLastIndex((line) => /\] (?!cảnh báo: )/.test(line) && line.includes(" [age_"));
    assert.ok(firstWarning > lastError, result.out);
    // 9 age_words_en (Explorer: 8 words); SK-047 rewrote q2 of lesson 1, whose sentences pass 8 words.
    assert.match(result.out, /8 lỗi · 9 cảnh báo/);
  });

  test("rules.json thiếu authoring của nhóm, hoặc thiếu cả nhóm: [age_rules_missing], exit 1", () => {
    const rulesFile = path.join(root, "rules-no-authoring.json");
    const base = JSON.parse(readFileSync(DEFAULT_RULES_FILE, "utf8"));
    delete base.discoverer.authoring;
    writeFileSync(rulesFile, JSON.stringify(base));
    let result = run("validate", ...LESSON1, "--rules", rulesFile);
    assert.equal(result.status, 1, result.out);
    assert.deepEqual(result.lines.filter((line) => line.includes(" [")), [
      `${TOPIC_FILE} /age_group [age_rules_missing] nhóm tuổi discoverer chưa có authoring trong ${rulesFile}; chưa kiểm được luật soạn theo tuổi`,
    ]);
    delete base.discoverer;
    writeFileSync(rulesFile, JSON.stringify(base));
    result = run("validate", ...LESSON1, "--rules", rulesFile);
    assert.equal(result.status, 1, result.out);
    assert.match(result.out, /topic\.json \/age_group \[age_rules_missing\] nhóm tuổi discoverer không có trong/);
  });

  // SK-043: Discoverer renders every format from 0.1.0, so format_not_rendered needs an older --min-app-version.
  test("q2 thành order_sequence, --min-app-version 0.0.9: validate chỉ cảnh báo format_not_rendered (mọi câu, kể cả order_sequence), exit 0; 0.1.0 thì không", () => {
    const files = lesson1Copy("sequence", { lesson: withOrderSequence });
    const clean = run("validate", ...files, "--min-app-version", "0.1.0", ...RULES_026_ARGS);
    assert.equal(clean.status, 0, clean.out);
    assert.deepEqual(clean.lines.filter((line) => line.includes(" [")), []);
    const result = run("validate", ...files, "--min-app-version", "0.0.9", ...RULES_026_ARGS);
    assert.equal(result.status, 0, result.out);
    const lines = result.lines.filter((line) => line.includes(" ["));
    // 0.0.9 is older than every renderer: each of the 2 warm-up and 6 quiz items gets one line.
    assert.equal(lines.length, 8, result.out);
    assert.ok(lines.every((line) => line.includes("[format_not_rendered] cảnh báo:")), result.out);
    assert.ok(lines.some((line) => /01-thuc-an-cho-ta-nhung-gi\.json \/quiz\/1\/format \[format_not_rendered\] cảnh báo: format order_sequence chưa hiện được ở app 0\.0\.9: app hiện được từ 0\.1\.0/.test(line)), result.out);
  });

  test("format_not_rendered: lỗi ở build; format chưa có bản app nào (null) thì --min-app-version cao mấy cũng lỗi", () => {
    const files = lesson1Copy("sequence-build", { lesson: withOrderSequence });
    const docs = files.map((file) => ({ display: file, data: JSON.parse(readFileSync(file, "utf8")) }));
    const errorsAt = (minAppVersion: string, withRules = RULES_026, data = docs) =>
      only(checkAgeRules(data, withRules, { minAppVersion, mode: "build", rulesDisplay: "rules" }), "error").filter((issue) => issue.code === "format_not_rendered");
    assert.ok(errorsAt("0.0.9").some((issue) => issue.pointer === "/quiz/1/format"));
    assert.deepEqual(errorsAt("0.1.0"), []);
    // Lesson 1 formats render from 0.1.0: nothing at 0.1.0.
    assert.deepEqual(check(LESSON1, "build"), []);
    // null (no app renders it): the Explorer column has multi_choice and fill_blank_bank at null. With rules
    // that allow them for Explorer, every such item is an error whatever --min-app-version.
    const asExplorer = docs.map((d) => (d.data.kind === "topic" ? { ...d, data: { ...d.data, age_group: "explorer" } } : d));
    const allFormats = { ...RULES_026.discoverer!.authoring as object };
    const explorerRules = { ...RULES_026, explorer: { ...RULES_026.explorer!, authoring: allFormats } };
    const lesson = docs.find((d) => d.data.kind === "lesson")!.data as { quiz: { format: string }[]; warmup: { format: string }[] };
    const nulls = (["warmup", "quiz"] as const).flatMap((section) =>
      lesson[section].flatMap((item, i) => (firstAppVersion(item.format, "explorer") === null ? [{ pointer: `/${section}/${i}/format`, code: "format_not_rendered" }] : [])),
    );
    assert.ok(nulls.length > 0);
    for (const minAppVersion of ["0.1.0", "9.9.9"]) assert.deepEqual(errorsAt(minAppVersion, explorerRules, asExplorer), nulls, minAppVersion);
  });

  test("input sai content-schema: in lỗi schema, exit 1, chưa chạy luật tuổi", () => {
    const files = lesson1Copy("schema", { lesson: (l) => (l.quiz.pop(), l) });
    const result = run("validate", ...files);
    assert.equal(result.status, 1);
    assert.match(result.out, /\/quiz /);
    assert.match(result.out, /chưa kiểm luật theo tuổi/);
  });

  test("sai cách gọi: exit 2", () => {
    assert.equal(run("validate").status, 2);
    assert.equal(run("validate", ...LESSON1, "--min-app-version", "1.0").status, 2);
    assert.equal(run("validate", ...LESSON1, "--bogus").status, 2);
  });
});

// SK-047: multi_choice_correct_spread (topic level) and vocab_item_uses_lesson_word (wave 1).
describe("SK-047: luật phân bố đáp án MC và câu Từ mới", () => {
  const topicData = JSON.parse(readFileSync(TOPIC_FILE, "utf8"));
  const lessonData = JSON.parse(readFileSync(LESSON_FILE, "utf8"));
  /** Deterministic fresh UUID for every "id" of a copy (content-schema wants ids unique across files). */
  const freshIds = (node: any, seed: string, counter = { n: 0 }): any => {
    if (Array.isArray(node)) return node.map((child) => freshIds(child, seed, counter));
    if (node === null || typeof node !== "object") return node;
    return Object.fromEntries(
      Object.entries(node).map(([key, value]) => {
        if (key !== "id") return [key, freshIds(value, seed, counter)];
        const hex = createHash("sha256").update(`${seed}:${counter.n++}`).digest("hex");
        return [key, `${hex.slice(0, 8)}-${hex.slice(8, 12)}-4${hex.slice(13, 16)}-8${hex.slice(17, 20)}-${hex.slice(20, 32)}`];
      }),
    );
  };
  /**
   * Lesson 1 copied once per entry of `rights`: lesson n (order n, slug bai-n) has its quiz q5
   * (multi_choice, 6 options) with that many right answers. Lesson 1 itself has one MC.
   */
  const topicWith = (rights: number[], edit?: (lessons: any[]) => void) => {
    const lessons = rights.map((right, i) => {
      const lesson = { ...freshIds(structuredClone(lessonData), `lesson-${i}`), order: i + 1, slug: `bai-${i + 1}` };
      lesson.quiz[4].options.forEach((option: { correct: boolean; feedback?: unknown }, j: number) => {
        option.correct = j < right;
        if (option.correct) delete option.feedback;
      });
      return lesson;
    });
    edit?.(lessons);
    return [
      { display: "topic.json", data: topicData },
      ...lessons.map((data, i) => ({ display: `0${i + 1}-bai-${i + 1}.json`, data })),
    ] as AgeDoc[];
  };
  // The real rules: RULES_026 drops vocab_item_uses_lesson_word.
  const spread = (docs: AgeDoc[], withRules = rules!) =>
    checkAgeRules(docs, withRules, { minAppVersion: "0.1.0", mode: "validate", rulesDisplay: "content/rules.json" }).filter((issue) => issue.code === "multi_choice_correct_spread");
  const vocabIssues = (docs: AgeDoc[], withRules = rules!) =>
    checkAgeRules(docs, withRules, { minAppVersion: "0.1.0", mode: "validate", rulesDisplay: "content/rules.json" }).filter((issue) => issue.code === "vocab_item_uses_lesson_word");

  test("giới hạn max(1, floor(tỉ lệ × n))", () => {
    const table = [1, 2, 3, 4, 5, 15, 40].map((n) => [n, correctSpreadLimit(n, 0.5)]);
    assert.deepEqual(table, [[1, 1], [2, 1], [3, 1], [4, 2], [5, 2], [15, 7], [40, 20]]);
    assert.equal(correctSpreadLimit(100, 0.29), 29, "0.29 × 100 không bị làm tròn xuống 28");
    assert.equal(correctSpreadLimit(6, 1), 6);
  });

  test("4 câu MC đều 2 đáp án đúng (như ho-hap 15/11): một dòng ở topic, nêu chủ đề, số đúng lặp, 4/4, giới hạn 2, bài và key", () => {
    const issues = spread(topicWith([2, 2, 2, 2]));
    assert.deepEqual(
      issues.map((issue) => formatIssue(issue)),
      [
        "topic.json / [multi_choice_correct_spread] chủ đề an-uong-lanh-manh: 4/4 câu multi_choice có 2 đáp án đúng; nhóm discoverer cho tối đa 2 câu cùng số đáp án đúng " +
          "(max(1, floor(0.5 × 4))), cần đổi ít nhất 2 câu sang số đáp án đúng khác. Phân bố: 2 đúng × 4. Các câu: 01-bai-1 q5, 02-bai-2 q5, 03-bai-3 q5, 04-bai-4 q5",
      ],
    );
    assert.equal(issues[0]!.severity, "error");
    // Same level in build: the topic does not build.
    const inBuild = checkAgeRules(topicWith([2, 2, 2, 2]), rules!, { minAppVersion: "0.1.0", mode: "build", rulesDisplay: "content/rules.json" });
    assert.deepEqual(inBuild.filter((issue) => issue.code === "multi_choice_correct_spread").map((issue) => issue.severity), ["error"]);
    // Two items moved to 1 and 3 right answers: 2 · 2 · 1 · 3, nothing above 2.
    assert.deepEqual(spread(topicWith([2, 1, 2, 3])), []);
  });

  test("1 câu MC: không báo; 2 câu cùng số đáp án đúng: báo (giới hạn 1); 2 câu khác số: không", () => {
    assert.deepEqual(spread(topicWith([2])), []);
    const two = spread(topicWith([3, 3]));
    assert.equal(two.length, 1);
    assert.match(two[0]!.message, /2\/2 câu multi_choice có 3 đáp án đúng; nhóm discoverer cho tối đa 1 câu/);
    assert.deepEqual(spread(topicWith([3, 2])), []);
  });

  test("mỗi số đáp án đúng vượt giới hạn một dòng; đếm cả câu MC ở Khởi động", () => {
    // 15 items as da-va-dat 15/11: 11 with 2, 4 with 3 -> only "2" is over 7.
    const daVaDat = spread(topicWith([...Array(11).fill(2), ...Array(4).fill(3)]));
    assert.equal(daVaDat.length, 1);
    assert.match(daVaDat[0]!.message, /11\/15 câu multi_choice có 2 đáp án đúng; nhóm discoverer cho tối đa 7 câu .* cần đổi ít nhất 4 câu .* Phân bố: 2 đúng × 11 · 3 đúng × 4\./);
    // 2 quiz items with 1 and 2 right answers, plus a warm-up MC with 2: n = 3, limit 1.
    const warm = spread(
      topicWith([1, 2], (lessons) => {
        lessons[1].warmup.push({ ...structuredClone(lessons[1].quiz[4]), key: "w3", recall_from: lessons[1].warmup[0].recall_from });
      }),
    );
    assert.equal(warm.length, 1);
    assert.match(warm[0]!.message, /2\/3 câu multi_choice có 2 đáp án đúng; .* Các câu: 02-bai-2 w3, 02-bai-2 q5$/);
  });

  test("nhóm không có khoá multi_choice_correct_spread thì không kiểm", () => {
    const rulesNoKey = structuredClone(rules!);
    delete (rulesNoKey.discoverer!.authoring as Record<string, unknown>).multi_choice_correct_spread;
    assert.deepEqual(spread(topicWith([2, 2, 2, 2]), rulesNoKey), []);
  });

  test("sameWord: không phân biệt hoa thường; nhận -s, -es, -ies, -ves, -ed, -ing và vài số nhiều bất quy tắc; khác từ thì không", () => {
    for (const [a, b] of [
      ["Materials", "material"],
      ["shakes", "shake"],
      ["boxes", "box"],
      ["studies", "study"],
      ["leaves", "leaf"],
      ["breathing", "breathe"],
      ["running", "run"],
      ["jumped", "jump"],
      ["breathed", "breathe"],
      ["teeth", "tooth"],
      ["Fresh air", "fresh air"],
      ["air sacs", "air-sac"],
      ["the Sun", "sun"],
    ]) assert.ok(sameWord(a!, b!), `${a} ~ ${b}`);
    for (const [a, b] of [
      ["water", "wind"],
      ["crust", "core"],
      ["one thing", "fair test"],
      ["glass", "glas"],
      ["oxygen", "fresh air"],
    ]) assert.ok(!sameWord(a!, b!), `${a} !~ ${b}`);
  });

  /** Lesson 1 with the vocab word `key` set to `tier`. */
  const withTier = (key: string, tier: "core" | "extra") => (lessons: any[]) => {
    lessons[0].vocab.find((entry: { key: string }) => entry.key === key).tier = tier;
  };
  const energyKey = (lessonData.vocab as { key: string; term: { en: string } }[]).find((entry) => entry.term.en === "energy")!.key;

  /** Lesson 1 q2 with the answer word q2_air relabelled `label` (lesson 1 itself asks "nutrients", a core word, since SK-047). */
  const answerAs = (label: string) => (lessons: any[]) => {
    const air = lessons[0].quiz[1].bank.find((word: { key: string }) => word.key === "q2_air");
    air.label.en = label;
    delete air.feedback;
    lessons[0].quiz[1].answers = ["q2_air"];
  };

  test("bài 1 (q2 điền nutrients, từ core nutrient, biến thể -s): không báo; câu điền từ ở Khởi động (w1 air) không kiểm", () => {
    assert.deepEqual(vocabIssues(topicWith([3])), []);
  });

  test("chỉ tính từ mới (tier: core): chỗ trống là energy, từ extra -> báo và nói energy là từ đọc thêm; energy thành core -> hết báo", () => {
    assert.deepEqual(
      vocabIssues(topicWith([3], answerAs("energy"))).map((issue) => formatIssue(issue)),
      [
        "01-bai-1.json /quiz/1/answers [vocab_item_uses_lesson_word] cảnh báo: câu q2: từ trong chỗ trống (energy) không trùng từ mới nào của bài (vocab tier core: nutrient, carbohydrate, protein, fat); " +
          "energy là từ đọc thêm (tier: extra) của bài, chưa phải từ mới: dùng một từ core, hoặc đổi tier của từ đó thành core; " +
          "fill_blank_bank ở Quiz là câu Từ mới, chỗ trống dùng một từ mới của bài (so không phân biệt hoa thường, nhận -s, -es, -ed, -ing)",
      ],
    );
    assert.deepEqual(
      vocabIssues(
        topicWith([3], (lessons) => {
          answerAs("energy")(lessons);
          withTier(energyKey, "core")(lessons);
        }),
      ),
      [],
    );
  });

  test("FB ở Quiz không có từ core nào: cảnh báo ở /quiz/<i>/answers của đúng câu; hai chỗ trống, một từ core là đạt", () => {
    const docs = topicWith([3], (lessons) => {
      lessons[0].quiz[1].answers = ["q2_sunlight"];
      delete lessons[0].quiz[1].bank.find((word: { key: string }) => word.key === "q2_sunlight").feedback;
    });
    assert.deepEqual(
      vocabIssues(docs).map((issue) => formatIssue(issue)),
      [
        "01-bai-1.json /quiz/1/answers [vocab_item_uses_lesson_word] cảnh báo: câu q2: từ trong chỗ trống (sunlight) không trùng từ mới nào của bài " +
          "(vocab tier core: nutrient, carbohydrate, protein, fat); fill_blank_bank ở Quiz là câu Từ mới, chỗ trống dùng một từ mới của bài (so không phân biệt hoa thường, nhận -s, -es, -ed, -ing)",
      ],
    );
    // Two blanks: one core word (nutrients) is enough.
    const twoBlanks = topicWith([3], ([lesson]) => {
      lesson.quiz[1].sentence.en = "Food gives us {1} and {2}.";
      lesson.quiz[1].answers = ["q2_sunlight", "q2_nutrients"];
    });
    assert.deepEqual(vocabIssues(twoBlanks), []);
    const rulesNoKey = structuredClone(rules!);
    delete (rulesNoKey.discoverer!.authoring as Record<string, unknown>).vocab_item_uses_lesson_word;
    assert.deepEqual(vocabIssues(docs, rulesNoKey), []);
  });

  test("content-cli validate trên bản sao 4 bài (MC đều 2 đúng): in dòng lỗi ở topic.json, exit 1", () => {
    const root = mkdtempSync(path.join(tmpdir(), "content-cli-spread-"));
    try {
      const dir = path.join(root, "an-uong-lanh-manh");
      mkdirSync(dir);
      const files = topicWith([2, 2, 2, 2]).map((doc) => {
        const file = path.join(dir, doc.display);
        writeFileSync(file, JSON.stringify(doc.data, null, 2));
        return file;
      });
      // RULES_026_ARGS: no image warnings, so the MC line is the only one.
      const result = run("validate", ...files, ...RULES_026_ARGS);
      assert.equal(result.status, 1, result.out);
      const lines = result.lines.filter((line) => line.includes(" ["));
      assert.deepEqual(lines.map((line) => line.replace(dir, "<dir>")), [
        "<dir>/topic.json / [multi_choice_correct_spread] chủ đề an-uong-lanh-manh: 4/4 câu multi_choice có 2 đáp án đúng; nhóm discoverer cho tối đa 2 câu cùng số đáp án đúng " +
          "(max(1, floor(0.5 × 4))), cần đổi ít nhất 2 câu sang số đáp án đúng khác. Phân bố: 2 đúng × 4. Các câu: 01-bai-1 q5, 02-bai-2 q5, 03-bai-3 q5, 04-bai-4 q5",
      ]);
      assert.match(result.out, /1 lỗi · 0 cảnh báo/);
    } finally {
      rmSync(root, { recursive: true, force: true });
    }
  });
});
