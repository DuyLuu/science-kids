// SK-027: markdown -> JSON (`validate`, `import`, `ids` of content-cli).
// Fixtures: test/fixtures/markdown/ (valid/ = copy of lesson 1, expected.json = one-error cases).
// These tests depend on content/ only through _topic.md and lesson 1 (SK-028): lessons 2, 3… may be
// added or be mid-edit without turning them red. When _topic.md or lesson 1 changes, regenerate
// (README "Markdown", Fixture): packages/content-schema fixtures by `import`, then
// `node scripts/make-invalid-fixtures.mjs` there, then the copy in test/fixtures/markdown/valid.
import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import { cpSync, existsSync, mkdirSync, mkdtempSync, readdirSync, readFileSync, renameSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import { after, before, describe, mock, test } from "node:test";
import { DEFAULT_RULES_FILE } from "../src/paths.ts";
import { checkMarkdown, type MdReport } from "../src/markdown/check.ts";
import { runImport, runIds, runMarkdownValidate } from "../src/markdown/command.ts";
import { DIFFICULTY_KEYS, LEARN_TYPES, PLAY_TYPES, QUIZ_FORMATS_MD } from "../src/markdown/convert.ts";
import { formatMdIssue, MD_CODES, type MdIssue } from "../src/markdown/source.ts";
import { QUIZ_FORMATS } from "../src/validate/format-renderers.ts";
import { CLI_ROOT, LESSON_FILE, rulesFileWithoutImageChecks, TOPIC_FILE } from "./helpers.ts";

const cli = path.join(CLI_ROOT, "src", "cli.ts");
const REPO = path.resolve(CLI_ROOT, "..", "..");
const CONTENT_TOPIC = path.join(REPO, "content", "discoverer", "an-uong-lanh-manh");
const FIXTURES = path.join(CLI_ROOT, "test", "fixtures", "markdown");
const VALID = path.join(FIXTURES, "valid");
const TOPIC_REL = "discoverer/an-uong-lanh-manh";
const LESSON_REL = `${TOPIC_REL}/01-thuc-an-cho-ta-nhung-gi.md`;
const SCHEMA_DIR = path.join(REPO, "packages", "content-schema", "schema");

type Edit = { file: string; replace?: [string, string]; cut?: [string, string]; write?: string; rename?: string };
type Expect = { file: string; line: number; pointer: string; code: string };
type Case = { name: string; description: string; edits: Edit[]; errors?: Expect[]; warnings?: Expect[]; message_includes?: string[] };
const EXPECTED: { cases: Case[]; warning_cases: Case[] } = JSON.parse(readFileSync(path.join(FIXTURES, "expected.json"), "utf8"));

let scratch: string;
before(() => {
  scratch = mkdtempSync(path.join(tmpdir(), "content-cli-md-"));
});
after(() => rmSync(scratch, { recursive: true, force: true }));

/** Copy of valid/ with the edits applied; returns the root (the content root of the run). */
function materialize(name: string, edits: Edit[] = []): string {
  const root = path.join(scratch, name);
  rmSync(root, { recursive: true, force: true });
  cpSync(VALID, root, { recursive: true });
  for (const edit of edits) {
    const file = path.join(root, edit.file);
    if (edit.write !== undefined) {
      mkdirSync(path.dirname(file), { recursive: true });
      writeFileSync(file, edit.write);
      continue;
    }
    if (edit.rename !== undefined) {
      renameSync(file, path.join(root, edit.rename));
      continue;
    }
    const text = readFileSync(file, "utf8");
    if (edit.replace) {
      const [find, replacement] = edit.replace;
      assert.equal(text.split(find).length - 1, 1, `${name}: "${find.slice(0, 40)}…" phải có đúng một lần trong ${edit.file}`);
      writeFileSync(file, text.replace(find, () => replacement));
    }
    if (edit.cut) {
      const [from, to] = edit.cut;
      const start = text.indexOf(from);
      const end = text.indexOf(to, start);
      assert.ok(start !== -1 && end !== -1, `${name}: không thấy đoạn cần cắt`);
      writeFileSync(file, text.slice(0, start) + text.slice(end));
    }
  }
  return root;
}

const relativeTo = (root: string) => (file: string) => path.relative(root, file);
function check(root: string, inputs: string[] = [TOPIC_REL]): Extract<MdReport, { ok: true }> {
  const report = checkMarkdown({
    inputs: inputs.map((input) => path.join(root, input)),
    contentRoot: root,
    rulesFile: rulesFileWithoutImageChecks(),
    minAppVersion: "0.1.0",
    display: relativeTo(root),
    idsCommand: (file) => `ids ${file}`,
  });
  assert.ok(report.ok, JSON.stringify(report));
  return report;
}
const brief = ({ file, line, pointer, code }: MdIssue): Expect => ({ file, line, pointer: pointer === "" ? "/" : pointer, code });
const errorsOf = (report: { issues: MdIssue[] }) => report.issues.filter((issue) => issue.severity === "error");
const warningsOf = (report: { issues: MdIssue[] }) => report.issues.filter((issue) => issue.severity === "warning");
/** Runs a command function with console.log / console.error silenced; returns exit code and output. */
function quiet(run: () => number): { status: number; out: string } {
  const lines: string[] = [];
  const log = mock.method(console, "log", (...args: unknown[]) => lines.push(args.join(" ")));
  const error = mock.method(console, "error", (...args: unknown[]) => lines.push(args.join(" ")));
  try {
    return { status: run(), out: lines.join("\n") };
  } finally {
    log.mock.restore();
    error.mock.restore();
  }
}
const mdOptions = (root: string, inputs: string[]) => ({
  inputs: inputs.map((input) => path.join(root, input)),
  contentRoot: root,
  rulesFile: rulesFileWithoutImageChecks(),
  minAppVersion: "0.1.0",
  cwd: root,
  display: relativeTo(root),
});
const listAll = (dir: string): string[] =>
  existsSync(dir) ? readdirSync(dir, { recursive: true, withFileTypes: true }).filter((entry) => entry.isFile()).map((entry) => path.join(entry.parentPath, entry.name)) : [];
/** _topic.md + lesson 1 of content/, copied alone into <scratch>/<name>/discoverer/an-uong-lanh-manh/ (content root <scratch>/<name>). */
function lesson1FromContent(name: string): string {
  const root = path.join(scratch, name);
  const dir = path.join(root, TOPIC_REL);
  rmSync(root, { recursive: true, force: true });
  mkdirSync(dir, { recursive: true });
  for (const file of ["_topic.md", "01-thuc-an-cho-ta-nhung-gi.md"]) cpSync(path.join(CONTENT_TOPIC, file), path.join(dir, file));
  return root;
}

/** B3: messages use markdown names, never JSON ones. */
const JSON_WORDS = /misconception_id|topic_id|prerequisite_topic_ids|lesson_id|phần tử|\/(options|bank|items|groups|quiz|warmup|learn|vocab)\/\d/;

describe("bài 1: markdown -> JSON khớp fixture (A1, A2)", () => {
  test("content/ bài 1 ra đúng từng byte hai fixture của packages/content-schema (A1; _topic.md và bài 1 chép riêng, bài khác không ảnh hưởng)", () => {
    const root = lesson1FromContent("a1");
    const report = checkMarkdown({
      inputs: [path.join(root, TOPIC_REL)],
      contentRoot: root,
      rulesFile: DEFAULT_RULES_FILE,
      minAppVersion: "0.1.0",
      display: (file) => file,
      idsCommand: (file) => file,
    });
    assert.ok(report.ok);
    assert.deepEqual(errorsOf(report), []);
    const [topic] = report.topics;
    assert.equal(topic!.lessons.length, 1);
    assert.equal(`${JSON.stringify(topic!.topic.data, null, 2)}\n`, readFileSync(TOPIC_FILE, "utf8"), "topic.json");
    assert.equal(`${JSON.stringify(topic!.lessons[0]!.data, null, 2)}\n`, readFileSync(LESSON_FILE, "utf8"), "01-thuc-an-cho-ta-nhung-gi.json");
  });

  test("bản chép trong test/fixtures/markdown/valid trùng content/ (sinh lại khi bài 1 đổi)", () => {
    for (const name of ["_topic.md", "01-thuc-an-cho-ta-nhung-gi.md"]) {
      assert.equal(readFileSync(path.join(VALID, TOPIC_REL, name), "utf8"), readFileSync(path.join(CONTENT_TOPIC, name), "utf8"), name);
    }
  });

  test("validate: 0 lỗi; cảnh báo chỉ có md_needs_check, mỗi file một dòng (5 dòng ở bài, 2 ở _topic.md)", () => {
    const report = check(materialize("valid"));
    assert.deepEqual(errorsOf(report), []);
    assert.deepEqual(warningsOf(report).map(brief), [
      { file: `${TOPIC_REL}/_topic.md`, line: 46, pointer: "/", code: "md_needs_check" },
      { file: LESSON_REL, line: 41, pointer: "/", code: "md_needs_check" },
    ]);
    assert.match(warningsOf(report)[0]!.message, /2 dòng \[CẦN KIỂM\] \(dòng 46, 55\)/);
    assert.match(warningsOf(report)[1]!.message, /5 dòng \[CẦN KIỂM\] \(dòng 41, 74, 162, 447, 625\)/);
  });

  test("CLI import (spawn): exit 0, ghi <age_group>/<slug>/topic.json + 01-….json trùng fixture, in lệnh tts/build tiếp theo", () => {
    const root = lesson1FromContent("cli-import-src");
    const out = path.join(scratch, "cli-import");
    const result = spawnSync(process.execPath, [cli, "import", path.join(root, TOPIC_REL), "--out", out], { cwd: CLI_ROOT, encoding: "utf8", env: { ...process.env, INIT_CWD: CLI_ROOT } });
    assert.equal(result.status, 0, result.stdout + result.stderr);
    assert.deepEqual(readdirSync(path.join(out, "discoverer", "an-uong-lanh-manh")).sort(), ["01-thuc-an-cho-ta-nhung-gi.json", "topic.json"]);
    assert.deepEqual(readFileSync(path.join(out, "discoverer", "an-uong-lanh-manh", "topic.json")), readFileSync(TOPIC_FILE));
    assert.deepEqual(readFileSync(path.join(out, "discoverer", "an-uong-lanh-manh", "01-thuc-an-cho-ta-nhung-gi.json")), readFileSync(LESSON_FILE));
    assert.match(result.stdout, /run tts -- .* --lang en --out /);
    assert.match(result.stdout, /run tts -- .* --lang vi --out /);
    assert.match(result.stdout, /run build -- /);
  });

  test("file BOM + CRLF ra cùng JSON", () => {
    const root = materialize("crlf");
    for (const name of ["_topic.md", "01-thuc-an-cho-ta-nhung-gi.md"]) {
      const file = path.join(root, TOPIC_REL, name);
      writeFileSync(file, `﻿${readFileSync(file, "utf8").replace(/\n/g, "\r\n")}`);
    }
    const report = check(root);
    assert.deepEqual(errorsOf(report), []);
    assert.equal(`${JSON.stringify(report.topics[0]!.lessons[0]!.data, null, 2)}\n`, readFileSync(LESSON_FILE, "utf8"));
  });
});

describe("một lỗi, một dòng (B1, B3)", () => {
  test("có đủ 21 ca của tiêu chí B1 (12 và 18 mỗi ca hai biến thể)", () => {
    const numbers = new Set(EXPECTED.cases.map((row) => Number(row.name.slice(0, 2))));
    for (let n = 1; n <= 21; n++) assert.ok(numbers.has(n), `thiếu ca ${n}`);
  });

  for (const row of EXPECTED.cases) {
    test(`${row.name}: ${row.description}`, () => {
      const root = materialize(row.name, row.edits);
      const report = check(root);
      const errors = errorsOf(report);
      assert.deepEqual(errors.map(brief), row.errors, errors.map(formatMdIssue).join("\n"));
      for (const error of errors) {
        assert.doesNotMatch(error.message, JSON_WORDS, formatMdIssue(error));
        for (const part of row.message_includes ?? []) assert.ok(error.message.includes(part), `${part} / ${error.message}`);
      }
      // import on the same files writes nothing and exits 1.
      const out = path.join(scratch, `${row.name}-out`);
      const result = quiet(() => runImport({ ...mdOptions(root, [TOPIC_REL]), out }));
      assert.equal(result.status, 1, result.out);
      assert.deepEqual(listAll(out), []);
    });
  }

  for (const row of EXPECTED.warning_cases) {
    test(`${row.name}: ${row.description}`, () => {
      const report = check(materialize(row.name, row.edits));
      assert.deepEqual(errorsOf(report), []);
      const warnings = warningsOf(report).filter((issue) => issue.code !== "md_needs_check");
      assert.deepEqual(warnings.map(brief), row.warnings);
    });
  }

  test("lỗi in trước cảnh báo; theo file (topic trước) rồi theo dòng; dòng có dạng <file>:<dòng> <pointer> [<mã>]", () => {
    const root = materialize("order", [
      { file: LESSON_REL, replace: ["#### option q1_orange\ncorrect: true\n", "#### option q1_orange\ncorrect: yes\n"] },
      { file: `${TOPIC_REL}/_topic.md`, replace: ["is_free: true\n", "is_free: yes\n"] },
      { file: LESSON_REL, replace: ["answers: q2_energy\n", "answers: [q2_energy]\n"] },
    ]);
    const lines = check(root).issues.map(formatMdIssue);
    assert.match(lines[0]!, /^discoverer\/an-uong-lanh-manh\/_topic\.md:15 \/is_free \[md_bad_value\] /);
    assert.match(lines[1]!, /^discoverer\/an-uong-lanh-manh\/01-thuc-an-cho-ta-nhung-gi\.md:306 \/quiz\/0\/options\/0\/correct \[md_bad_value\] /);
    assert.match(lines[2]!, /01-thuc-an-cho-ta-nhung-gi\.md:338 \/quiz\/1\/answers \[md_bad_value\] /);
    assert.match(lines[3]!, /_topic\.md:46 \/ \[md_needs_check\] cảnh báo: /);
    assert.match(lines[4]!, /01-thuc-an-cho-ta-nhung-gi\.md:41 \/ \[md_needs_check\] cảnh báo: /);
  });

  test("bảng mã md_*: mọi mã có mức; mọi mã các ca dùng đều có trong bảng (hoặc schema, age_*)", () => {
    for (const row of [...EXPECTED.cases, ...EXPECTED.warning_cases]) {
      for (const expected of [...(row.errors ?? []), ...(row.warnings ?? [])]) {
        assert.ok(expected.code in MD_CODES || expected.code === "schema" || expected.code.startsWith("age_"), expected.code);
      }
    }
  });
});

describe("id (C1, C2)", () => {
  const LESSON_ID = "id: 4b11eb40-9a47-4e5e-b4b5-bea60264ded3\n";
  const Q3_ID = "id: b06b6e26-f1b1-412e-b110-78e00e3d510f\n";
  const MISCONCEPTION_ID = "id: 93c51bb0-1d45-45df-99c5-a0397967fe10\n";
  const blank: Edit[] = [
    { file: LESSON_REL, replace: [LESSON_ID, "id:\n"] },
    { file: LESSON_REL, replace: [Q3_ID, "id:\n"] },
    { file: `${TOPIC_REL}/_topic.md`, replace: [MISCONCEPTION_ID, "id:\n"] },
  ];

  test("C1: ids điền đúng 3 dòng trống (CRLF giữ CRLF), UUID v4 không trùng; chạy lần hai không đổi gì", () => {
    const root = materialize("ids", blank);
    const lessonFile = path.join(root, LESSON_REL);
    writeFileSync(lessonFile, readFileSync(lessonFile, "utf8").replace(/\n/g, "\r\n"));
    const before = Object.fromEntries(listAll(root).map((file) => [file, readFileSync(file, "utf8")]));
    const first = quiet(() => runIds(mdOptions(root, [TOPIC_REL])));
    assert.equal(first.status, 0, first.out);
    const printed = first.out.split("\n").filter((line) => /:\d+ [0-9a-f-]{36}$/.test(line));
    assert.deepEqual(printed.map((line) => line.replace(/ .*$/, "")), [`${TOPIC_REL}/_topic.md:33`, `${LESSON_REL}:2`, `${LESSON_REL}:359`]);
    const uuids = printed.map((line) => line.split(" ")[1]!);
    for (const uuid of uuids) assert.match(uuid, /^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/);
    const allIds = Object.values(before).join("\n").match(/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/g) ?? [];
    assert.equal(new Set([...uuids, ...allIds]).size, uuids.length + new Set(allIds).size);
    // Exactly the 3 lines changed, nothing else.
    for (const [file, text] of Object.entries(before)) {
      const now = readFileSync(file, "utf8");
      const a = text.split(/(?<=\n)/);
      const b = now.split(/(?<=\n)/);
      assert.equal(a.length, b.length, file);
      const changed = a.flatMap((line, i) => (line === b[i] ? [] : [i + 1]));
      const expected = file.endsWith("_topic.md") ? [33] : file.endsWith("01-thuc-an-cho-ta-nhung-gi.md") ? [2, 359] : [];
      assert.deepEqual(changed, expected, file);
      for (const n of changed) assert.match(b[n - 1]!, file.endsWith(".md") && file === lessonFile ? /^id: [0-9a-f-]{36}\r\n$/ : /^id: [0-9a-f-]{36}\n$/);
    }
    const afterFirst = listAll(root).map((file) => readFileSync(file, "utf8"));
    const second = quiet(() => runIds(mdOptions(root, [TOPIC_REL])));
    assert.match(second.out, /ids: 0 id mới/);
    assert.deepEqual(listAll(root).map((file) => readFileSync(file, "utf8")), afterFirst);
    // And the files validate again.
    assert.deepEqual(errorsOf(check(root)), []);
  });

  test("ids: chỗ không có dòng id: thì thêm ngay dưới ### (và dưới --- mở); bài lẻ thì không đụng _topic.md", () => {
    const root = materialize("ids-absent", [
      { file: LESSON_REL, replace: [LESSON_ID, ""] },
      { file: LESSON_REL, replace: [Q3_ID, ""] },
      { file: `${TOPIC_REL}/_topic.md`, replace: [MISCONCEPTION_ID, "id:\n"] },
    ]);
    const report = check(root);
    assert.deepEqual(errorsOf(report).map(brief), [
      { file: `${TOPIC_REL}/_topic.md`, line: 33, pointer: "/misconceptions/0/id", code: "md_id_missing" },
      { file: LESSON_REL, line: 1, pointer: "/id", code: "md_id_missing" },
    ]);
    const topicBefore = readFileSync(path.join(root, TOPIC_REL, "_topic.md"), "utf8");
    const result = quiet(() => runIds(mdOptions(root, [LESSON_REL])));
    assert.match(result.out, /ids: 2 id mới trong 1 file/);
    assert.equal(readFileSync(path.join(root, TOPIC_REL, "_topic.md"), "utf8"), topicBefore);
    const lines = readFileSync(path.join(root, LESSON_REL), "utf8").split("\n");
    assert.equal(lines[0], "---");
    assert.match(lines[1]!, /^id: [0-9a-f-]{36}$/);
    assert.equal(lines[357], "### q3");
    assert.match(lines[358]!, /^id: [0-9a-f-]{36}$/);
  });

  test("ids không chèn id vào tiêu đề sai cấp hay khối chưa rõ loại; in rõ dòng bỏ qua (nghiệm thu L2)", () => {
    const cases: [string, Edit, RegExp][] = [
      ["ids-extra-hash", { file: LESSON_REL, replace: ["### q2\nid: aeb7debc-28ed-4fd8-a192-8a9e5a581455\n", "#### q2\n"] }, /:329 bỏ qua "#### q2": tiêu đề sai cấp/],
      ["ids-missing-hash", { file: LESSON_REL, replace: ["#### option q1_rice\n", "### option q1_rice\n"] }, /:313 bỏ qua "### option q1_rice": tiêu đề sai cấp/],
      ["ids-unknown-block", { file: LESSON_REL, replace: ["## Từ vựng\n", "### q7\nprompt.en: a\n\n## Từ vựng\n"] }, /:522 bỏ qua "### q7": chưa có dòng "id:"/],
    ];
    for (const [name, edit, note] of cases) {
      const root = materialize(name, [edit]);
      const before = listAll(root).map((file) => readFileSync(file, "utf8"));
      const result = quiet(() => runIds(mdOptions(root, [TOPIC_REL])));
      assert.equal(result.status, 0, result.out);
      assert.match(result.out, note, name);
      assert.match(result.out, /ids: 0 id mới .* bỏ qua 1 khối/, name);
      assert.deepEqual(listAll(root).map((file) => readFileSync(file, "utf8")), before, `${name}: không file nào đổi`);
      // validate: one line for the heading / block, no md_id_missing next to it.
      assert.equal(errorsOf(check(root)).length, 1, name);
    }
  });

  test("C2: id trống ở cả hai file + một lỗi nội dung: mỗi file một dòng md_id_missing, lỗi nội dung vẫn hiện; import exit 1, không ghi", () => {
    const root = materialize("c2", [...blank, { file: LESSON_REL, replace: ["#### option q1_rice\ncorrect: false\nlabel.en: rice\nlabel.vi: cơm\n", "#### option q1_rice\ncorrect: false\nlabel.en: rice\n"] }]);
    const report = check(root);
    assert.deepEqual(errorsOf(report).map(brief), [
      { file: `${TOPIC_REL}/_topic.md`, line: 33, pointer: "/misconceptions/0/id", code: "md_id_missing" },
      { file: LESSON_REL, line: 2, pointer: "/id", code: "md_id_missing" },
      { file: LESSON_REL, line: 315, pointer: "/quiz/0/options/1/label/vi", code: "schema" },
    ]);
    assert.match(errorsOf(report)[1]!.message, /và 1 chỗ nữa ở dòng 358/);
    const out = path.join(scratch, "c2-out");
    const result = quiet(() => runImport({ ...mdOptions(root, [TOPIC_REL]), out }));
    assert.equal(result.status, 1);
    assert.deepEqual(listAll(out), []);
  });
});

describe("gọi lệnh (D2) và không nạp tts (D1)", () => {
  const run = (args: string[], options: { cwd?: string; preload?: string } = {}) => {
    const result = spawnSync(process.execPath, [...(options.preload ? ["--import", options.preload] : []), cli, ...args], {
      cwd: options.cwd ?? CLI_ROOT,
      encoding: "utf8",
      env: { ...process.env, INIT_CWD: options.cwd ?? CLI_ROOT },
    });
    return { status: result.status, out: result.stdout, err: result.stderr };
  };

  test("trộn .md với .json: exit 2; import/ids nhận .json: exit 2", () => {
    const result = run(["validate", path.join(VALID, LESSON_REL), TOPIC_FILE]);
    assert.equal(result.status, 2, result.out + result.err);
    assert.match(result.err, /Không trộn file \.json/);
    assert.equal(run(["import", TOPIC_FILE]).status, 2);
    assert.equal(run(["ids", TOPIC_FILE]).status, 2);
  });

  test("thư mục không có _topic.md: exit 2 (có .json thì nhắc đưa từng file); đường dẫn không có: exit 1 như validate JSON", () => {
    const result = run(["validate", path.dirname(TOPIC_FILE)]);
    assert.equal(result.status, 2);
    assert.match(result.err, /không có thư mục chủ đề nào .*đưa từng file \.json/);
    const missing = run(["validate", path.join(scratch, "khong-co.md")]);
    assert.equal(missing.status, 1);
    assert.match(missing.out, /khong-co\.md \/ không tìm thấy file/);
    const lonely = path.join(scratch, "lonely");
    mkdirSync(lonely, { recursive: true });
    writeFileSync(path.join(lonely, "01-bai.md"), "---\n---\n");
    assert.equal(run(["validate", path.join(lonely, "01-bai.md")]).status, 2);
  });

  test("validate JSON giữ nguyên hành vi (exit 0, không có dòng nào có [)", () => {
    const result = run(["validate", TOPIC_FILE, LESSON_FILE, "--rules", rulesFileWithoutImageChecks()]);
    assert.equal(result.status, 0);
    assert.match(result.out, /nhóm discoverer · 0 lỗi · 0 cảnh báo/);
  });

  test("validate, import, ids không nạp module nào của src/tts; tts --help thì có", () => {
    const hook = `data:text/javascript,${encodeURIComponent(
      'import { registerHooks } from "node:module"; registerHooks({ resolve(specifier, context, next) { const result = next(specifier, context); if (result.url.includes("/src/tts/") || result.url.includes("kokoro") || result.url.includes("transformers")) process.stderr.write("LOADED " + result.url + "\\n"); return result; } });',
    )}`;
    const root = materialize("d1");
    const out = path.join(scratch, "d1-out");
    for (const args of [["validate", path.join(root, TOPIC_REL)], ["import", path.join(root, TOPIC_REL), "--out", out], ["ids", path.join(root, TOPIC_REL)]]) {
      const result = run(args, { preload: hook });
      assert.equal(result.status, 0, result.out + result.err);
      assert.doesNotMatch(result.err, /LOADED/, `${args[0]}: ${result.err}`);
    }
    assert.match(run(["tts", "--help"], { preload: hook }).err, /LOADED .*\/src\/tts\//);
  });

  test("README: lệnh cho biên tập chạy từ gốc repo với đường dẫn tương đối", () => {
    // Lesson 1 only (its _topic.md comes along): other lessons of content/ do not decide this test.
    const result = run(["validate", path.relative(REPO, path.join(CONTENT_TOPIC, "01-thuc-an-cho-ta-nhung-gi.md"))], { cwd: REPO });
    assert.equal(result.status, 0, result.out + result.err);
    assert.match(result.out, /^content\/discoverer\/an-uong-lanh-manh\/01-thuc-an-cho-ta-nhung-gi\.md:41 \/ \[md_needs_check\]/m);
    const readme = readFileSync(path.join(CLI_ROOT, "README.md"), "utf8");
    assert.ok(readme.includes("npm --prefix tools/content-cli run validate -- content/discoverer/an-uong-lanh-manh"));
    for (const code of Object.keys(MD_CODES)) assert.ok(readme.includes(`\`${code}\``), `README thiếu ${code}`);
  });

  test("validate cả thư mục content/: chạy hết, dưới 2 giây (D5)", () => {
    const started = performance.now();
    const result = run(["validate", path.join(REPO, "content")]);
    const took = performance.now() - started;
    // A lesson being written may still have errors (exit 1); this test only times the run.
    assert.ok(result.status === 0 || result.status === 1, result.out + result.err);
    assert.match(result.out, /^validate: \d+ file markdown/m);
    assert.ok(took < 2000, `${took} ms`);
  });
});

describe("thứ tự khoá theo JSON Schema (quyết định 6)", () => {
  const schemas = Object.fromEntries(
    readdirSync(SCHEMA_DIR).filter((name) => name.endsWith(".schema.json")).map((name) => [name, JSON.parse(readFileSync(path.join(SCHEMA_DIR, name), "utf8"))]),
  );
  const props = (file: string, def: string) => Object.keys(schemas[file].$defs[def].properties);
  const merged = (file: string, base: string, def: string) => [...new Set([...props(file, base), ...props(file, def)])];
  const keysIn = (value: unknown) => Object.keys(value as object);
  const ordered = (keys: string[], order: string[]) => assert.deepEqual(keys, order.filter((key) => keys.includes(key)), `${keys.join(",")} theo ${order.join(",")}`);

  test("format và type của convert.ts đúng enum của content-schema", () => {
    assert.deepEqual([...QUIZ_FORMATS_MD].sort(), [...QUIZ_FORMATS].sort());
    assert.deepEqual([...LEARN_TYPES], schemas["block.schema.json"].$defs.LearnBlock.properties.type.enum);
    assert.deepEqual([...PLAY_TYPES], schemas["block.schema.json"].$defs.PlayBlock.properties.type.enum);
    assert.deepEqual([...DIFFICULTY_KEYS], props("topic.schema.json", "Difficulty"));
  });

  test("bài có order_sequence, picture_bar_chart, sentence_card và hình thẻ từ: khoá theo properties (option: key, label, correct, image như fixture)", () => {
    const q2 = /### q2\n[\s\S]*?(?=### q3\n)/;
    const q4 = /### q4\n[\s\S]*?(?=### q5\n)/;
    const root = materialize("orders");
    const file = path.join(root, LESSON_REL);
    let text = readFileSync(file, "utf8");
    text = text.replace(q2, `### q2\nid: aeb7debc-28ed-4fd8-a192-8a9e5a581455\nformat: order_sequence\nversion: 1\ndok: 1\nprompt.en: Put them in order\nprompt.vi: Xếp theo thứ tự\nhint.en: Start small.\nhint.vi: Bắt đầu từ nhỏ.\nexplanation_correct.en: Yes.\nexplanation_correct.vi: Đúng.\nexplanation_wrong.en: No.\nexplanation_wrong.vi: Chưa đúng.\nanswer: q2_seed, q2_sprout, q2_plant\n\n#### item q2_seed\nlabel.en: seed\nlabel.vi: hạt\nimage.brief: Hạt\nimage.alt.en: A seed\nimage.alt.vi: Hạt\n\n#### item q2_sprout\nlabel.en: sprout\nlabel.vi: mầm\n\n#### item q2_plant\nlabel.en: plant\nlabel.vi: cây\n\n`);
    text = text.replace(q4, `### q4\nid: 00bb56f5-6adc-4d54-b48a-5bbbbae20eab\nformat: picture_bar_chart\nversion: 1\ndok: 2\nprompt.en: Which fruit do most children like?\nprompt.vi: Quả nào nhiều bạn thích nhất?\nhint.en: Find the tallest bar.\nhint.vi: Tìm cột cao nhất.\nexplanation_correct.en: Mango.\nexplanation_correct.vi: Xoài.\nexplanation_wrong.en: It is mango.\nexplanation_wrong.vi: Là xoài.\nchart.title.en: Fruit we like\nchart.title.vi: Quả chúng mình thích\nchart.unit.en: children\nchart.unit.vi: bạn\n\n#### bar q4_bar_mango\nlabel.en: mango\nlabel.vi: xoài\nimage.brief: Quả xoài\nimage.alt.en: A mango\nimage.alt.vi: Quả xoài\nvalue: 7\n\n#### bar q4_bar_banana\nlabel.en: banana\nlabel.vi: chuối\nvalue: 3\n\n#### option q4_mango\ncorrect: true\nlabel.en: mango\nlabel.vi: xoài\nimage.brief: Quả xoài\nimage.alt.en: A mango\nimage.alt.vi: Quả xoài\n\n#### option q4_banana\ncorrect: false\nlabel.en: banana\nlabel.vi: chuối\n\n#### option q4_lime\ncorrect: false\nlabel.en: lime\nlabel.vi: chanh\n\n`);
    text = text.replace("#### bank w1_air\nlabel.en: air\nlabel.vi: không khí\n", "#### bank w1_air\nlabel.en: air\nlabel.vi: không khí\nimage.brief: Bọt khí trong cốc nước\nimage.alt.en: Air bubbles in water\nimage.alt.vi: Bọt khí trong nước\n");
    text = text.replace("\n## Chơi\n", "\n### bridge\nid: 0d6a1c55-8a7e-4c1f-9b55-1f2e3d4c5b6a\ntype: sentence_card\nversion: 1\nmin_app_version: 0.1.0\ntext.en: Vegetables give us vitamins.\ntext.vi: Rau cho ta vitamin.\nimage.brief: Rổ rau\nimage.alt.en: A basket of vegetables\nimage.alt.vi: Rổ rau\n\n## Chơi\n");
    writeFileSync(file, text);
    const report = check(root);
    assert.deepEqual(errorsOf(report).filter((issue) => issue.code !== "format_not_rendered"), []);
    const lesson = report.topics[0]!.lessons[0]!.data as any;
    const quizItem = (format: string) => merged("quiz-item.schema.json", "QuizBase", format);
    ordered(keysIn(lesson.quiz[1]), quizItem("OrderSequence"));
    ordered(keysIn(lesson.quiz[1].items[0]), props("quiz-item.schema.json", "SequenceItem"));
    ordered(keysIn(lesson.quiz[3]), quizItem("PictureBarChart"));
    ordered(keysIn(lesson.quiz[3].chart), props("quiz-item.schema.json", "BarChart"));
    ordered(keysIn(lesson.quiz[3].chart.bars[0]), props("quiz-item.schema.json", "Bar"));
    ordered(keysIn(lesson.quiz[3].chart.bars[0].image), props("common.schema.json", "Image"));
    ordered(keysIn(lesson.quiz[3].options[0]), ["key", "label", "correct", "image"]);
    ordered(keysIn(lesson.learn[2]), merged("block.schema.json", "BlockBase", "SentenceCard"));
    ordered(keysIn(lesson.quiz[5]), quizItem("TrueFalse"));
    ordered(keysIn(lesson.quiz[5].labels), props("quiz-item.schema.json", "TrueFalseLabels"));
    ordered(keysIn(lesson.warmup[0]), quizItem("FillBlankBank"));
    ordered(keysIn(lesson.warmup[0].recall_from), props("quiz-item.schema.json", "RecallFromPriorKnowledge"));
    // SK-033: a bank word may carry an image, read like an option's image.
    ordered(keysIn(lesson.warmup[0].bank[0]), props("quiz-item.schema.json", "BankWord"));
    assert.deepEqual(lesson.warmup[0].bank[0].image, { alt: { en: "Air bubbles in water", vi: "Bọt khí trong nước" }, brief: "Bọt khí trong cốc nước" });
    assert.deepEqual(keysIn(lesson.warmup[0].bank[0]), ["key", "label", "image"]);
    assert.equal(lesson.warmup[0].bank[1].image, undefined);
    ordered(keysIn(lesson.play), merged("block.schema.json", "BlockBase", "BuildTray"));
    ordered(keysIn(lesson.play.messages), props("block.schema.json", "TrayMessages"));
    ordered(keysIn(lesson.play.items[0]), props("block.schema.json", "TrayItem"));
    ordered(keysIn(lesson.play.groups[0]), props("block.schema.json", "TrayGroup"));
    ordered(keysIn(lesson.learn[0]), merged("block.schema.json", "BlockBase", "ExploreGroups"));
    ordered(keysIn(lesson.learn[0].groups[0]), props("block.schema.json", "ExploreGroup"));
    ordered(keysIn(lesson.vocab[0]), props("vocab-term.schema.json", "VocabTerm"));
    ordered(keysIn(lesson.reward.collectible), props("collectible.schema.json", "Collectible"));
    ordered(keysIn(lesson), props("lesson.schema.json", "Lesson"));
    const topic = report.topics[0]!.topic.data as any;
    ordered(keysIn(topic), props("topic.schema.json", "Topic"));
    ordered(keysIn(topic.misconceptions[0]), props("topic.schema.json", "Misconception"));
    // The one exception: the schema lists image before correct.
    assert.deepEqual(props("quiz-item.schema.json", "ChoiceOption"), ["key", "label", "image", "correct"]);
  });

  test("validate (CLI) trên markdown in đúng dòng của runMarkdownValidate", () => {
    const root = materialize("cli-validate");
    const result = quiet(() => runMarkdownValidate(mdOptions(root, [TOPIC_REL])));
    assert.equal(result.status, 0, result.out);
    assert.match(result.out, /validate: 2 file markdown \(1 topic, 1 bài\) · nhóm discoverer · 0 lỗi · 2 cảnh báo/);
  });
});
