// SK-026: authoring rules per age group (src/validate/age-rules.ts) and `content-cli validate`.
// Fixtures: test/fixtures/age-rules/ (scripts/make-age-fixtures.ts) + lesson 1 of content-schema.
import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import { mkdirSync, mkdtempSync, readFileSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import { after, before, describe, test } from "node:test";
import { validateDocuments } from "@science-kids/content-schema/validate";
import { loadRules } from "../src/build/rules.ts";
import { DEFAULT_RULES_FILE } from "../src/paths.ts";
import { checkAgeRules, countWords, formatIssue, ISSUE_LEVELS, sentencesOf, type AgeDoc, type Issue } from "../src/validate/age-rules.ts";
import { FORMAT_FIRST_APP_VERSION, QUIZ_FORMATS } from "../src/validate/format-renderers.ts";
import { CLI_ROOT, LESSON_FILE, TOPIC_FILE, withOrderSequence } from "./helpers.ts";

const cli = path.join(CLI_ROOT, "src", "cli.ts");
const FIXTURES = path.join(CLI_ROOT, "test", "fixtures", "age-rules");
type Row = { file: string; description: string; group: string; context: string[]; errors: { pointer: string; code: string }[] };
const EXPECTED: { valid: { group: string; files: string[] }[]; invalid: Row[] } = JSON.parse(readFileSync(path.join(FIXTURES, "expected.json"), "utf8"));
const { rules } = loadRules(DEFAULT_RULES_FILE);

const doc = (file: string): AgeDoc & { text: string } => {
  const text = readFileSync(path.resolve(CLI_ROOT, file), "utf8");
  return { display: file, text, data: JSON.parse(text) };
};
const check = (files: string[], mode: "build" | "validate" = "validate", minAppVersion = "0.1.0") =>
  checkAgeRules(files.map(doc), rules!, { minAppVersion, mode, rulesDisplay: "content/rules.json" });
const only = (issues: Issue[], severity: Issue["severity"]) => issues.filter((issue) => issue.severity === severity).map(({ pointer, code }) => ({ pointer, code }));
/** Runs the CLI from tools/content-cli (paths in output are relative to it). */
const run = (...args: string[]) => {
  const result = spawnSync(process.execPath, [cli, ...args], { cwd: CLI_ROOT, encoding: "utf8", env: { ...process.env, INIT_CWD: CLI_ROOT } });
  return { status: result.status, out: result.stdout, err: result.stderr, lines: result.stdout.split("\n").filter(Boolean) };
};
const LESSON1 = [path.relative(CLI_ROOT, TOPIC_FILE), path.relative(CLI_ROOT, LESSON_FILE)];

describe("bảng mã và bảng format → bản app", () => {
  test("11 mã của SK-026, đúng mức", () => {
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
    });
  });

  test("mỗi format của content-schema có một dòng; 0.1.0 hiện đúng 4 format như hasRenderer của iOS", () => {
    assert.deepEqual(Object.keys(FORMAT_FIRST_APP_VERSION).sort(), [...QUIZ_FORMATS].sort());
    assert.deepEqual(
      Object.entries(FORMAT_FIRST_APP_VERSION).filter(([, version]) => version === "0.1.0").map(([format]) => format).sort(),
      ["fill_blank_bank", "multi_choice", "single_choice", "true_false"],
    );
    assert.equal(FORMAT_FIRST_APP_VERSION.order_sequence, null);
    assert.equal(FORMAT_FIRST_APP_VERSION.picture_bar_chart, null);
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

  test("cảnh báo: Explorer chỉ có format_not_rendered (order_sequence ở q4); bài 1 Discoverer và Scientist không có", () => {
    const warnings = (group: string) => only(check(EXPECTED.valid.find((row) => row.group === group)!.files), "warning");
    assert.deepEqual(warnings("explorer"), [{ pointer: "/quiz/3/format", code: "format_not_rendered" }]);
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
    const result = run("validate", ...LESSON1);
    assert.equal(result.status, 0, result.out);
    assert.match(result.out, /nhóm discoverer · 0 lỗi · 0 cảnh báo/);
    assert.equal(result.lines.filter((line) => line.includes("[")).length, 0, result.out);
  });

  test("bài 1 đổi sang Explorer: exit 1, có đủ các dòng của tiêu chí", () => {
    const files = lesson1Copy("explorer", { topic: (t) => (t.age_group = "explorer") });
    const result = run("validate", ...files);
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
    assert.match(result.out, /8 lỗi · 6 cảnh báo/);
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

  test("q2 thành order_sequence: validate chỉ cảnh báo format_not_rendered, exit 0", () => {
    const files = lesson1Copy("sequence", { lesson: withOrderSequence });
    const result = run("validate", ...files, "--min-app-version", "0.1.0");
    assert.equal(result.status, 0, result.out);
    const lines = result.lines.filter((line) => line.includes(" ["));
    assert.equal(lines.length, 1, result.out);
    assert.match(lines[0]!, /01-thuc-an-cho-ta-nhung-gi\.json \/quiz\/1\/format \[format_not_rendered\] cảnh báo: format order_sequence chưa hiện được ở app 0\.1\.0/);
  });

  test("format_not_rendered: lỗi ở build; format chưa có bản app nào (null) thì --min-app-version cao mấy cũng lỗi", () => {
    const files = lesson1Copy("sequence-build", { lesson: withOrderSequence });
    const docs = files.map((file) => ({ display: file, data: JSON.parse(readFileSync(file, "utf8")) }));
    for (const minAppVersion of ["0.1.0", "9.9.9"]) {
      const issues = checkAgeRules(docs, rules!, { minAppVersion, mode: "build", rulesDisplay: "rules" });
      assert.deepEqual(only(issues, "error"), [{ pointer: "/quiz/1/format", code: "format_not_rendered" }], minAppVersion);
    }
    // 4 formats of lesson 1 render from 0.1.0: nothing at 0.1.0.
    assert.deepEqual(check(LESSON1, "build"), []);
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
