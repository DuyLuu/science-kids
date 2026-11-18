// SK-030: `validate <folder>` also checks <folder>/syllabus.json (content/syllabus.json).
// The rules themselves are tested in packages/content-schema/test/syllabus.test.mjs; here: wiring,
// line format, exit codes. Copies use the markdown fixture (test/fixtures/markdown/valid: _topic.md
// and lesson 1, 0 errors) plus a copy of content/syllabus.json in which the slots pointing at
// content the fixture lacks lose their id, so the copy starts with 0 errors whatever else content/ holds.
import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import { cpSync, mkdtempSync, readFileSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import { randomUUID } from "node:crypto";
import { after, before, describe, mock, test } from "node:test";
import { DEFAULT_RULES_FILE } from "../src/paths.ts";
import { runMarkdownValidate } from "../src/markdown/command.ts";
import { contentIndex } from "../src/markdown/files.ts";
import { SYLLABUS_CODES } from "../src/markdown/syllabus.ts";
import { CLI_ROOT, rulesFileWithoutLaterWarnings } from "./helpers.ts";

const cli = path.join(CLI_ROOT, "src", "cli.ts");
const REPO = path.resolve(CLI_ROOT, "..", "..");
const VALID = path.join(CLI_ROOT, "test", "fixtures", "markdown", "valid");
const REAL_SYLLABUS = path.join(REPO, "content", "syllabus.json");
const TOPIC_REL = "discoverer/an-uong-lanh-manh";

type Lesson = { number: number; title: { en: string; vi: string | null }; lesson_id?: string };
type Topic = { key: string; number: number; title: { en: string; vi: string | null }; topic_id?: string; lessons: Lesson[] };
type Syllabus = { groups: { age_group: string; topics: Topic[] }[] };

let scratch: string;
before(() => {
  scratch = mkdtempSync(path.join(tmpdir(), "content-cli-syllabus-"));
});
after(() => rmSync(scratch, { recursive: true, force: true }));

/** <scratch>/<name>: the markdown fixture + content/syllabus.json trimmed to the fixture's ids. */
function copyRoot(name: string): { root: string; syllabus: Syllabus } {
  const root = path.join(scratch, name);
  rmSync(root, { recursive: true, force: true });
  cpSync(VALID, root, { recursive: true });
  const index = contentIndex(root, (file) => file);
  const topics = new Set(index.topics.map((topic) => topic.id));
  const lessons = new Set(index.lessons.map((lesson) => lesson.id));
  const syllabus: Syllabus = JSON.parse(readFileSync(REAL_SYLLABUS, "utf8"));
  for (const topic of syllabus.groups.flatMap((group) => group.topics)) {
    if (topic.topic_id !== undefined && !topics.has(topic.topic_id)) delete topic.topic_id;
    for (const lesson of topic.lessons) {
      if (lesson.lesson_id !== undefined && (topic.topic_id === undefined || !lessons.has(lesson.lesson_id))) delete lesson.lesson_id;
    }
  }
  writeSyllabus(root, syllabus);
  return { root, syllabus };
}
const writeSyllabus = (root: string, data: unknown) => writeFileSync(path.join(root, "syllabus.json"), `${JSON.stringify(data, null, 2)}\n`);

/** The slot of the copy that points at the fixture's lesson 1, with its pointer. */
function linkedSlot(syllabus: Syllabus) {
  for (const [g, group] of syllabus.groups.entries()) {
    for (const [t, topic] of group.topics.entries()) {
      for (const [l, lesson] of topic.lessons.entries()) {
        if (lesson.lesson_id !== undefined) return { group, topic, lesson, pointer: `/groups/${g}/topics/${t}/lessons/${l}/lesson_id` };
      }
    }
  }
  throw new Error("content/syllabus.json không còn ô nào trỏ tới bài 1 của fixture (an-uong-lanh-manh/01)");
}

function cliRun(args: string[], cwd = CLI_ROOT) {
  const result = spawnSync(process.execPath, [cli, ...args], { cwd, encoding: "utf8", env: { ...process.env, INIT_CWD: cwd } });
  return { status: result.status, out: result.stdout, err: result.stderr, lines: result.stdout.split("\n").filter(Boolean) };
}

/** runMarkdownValidate in process, console silenced; output relative to the root. */
function validate(root: string, inputs: string[] = ["."]): { status: number; lines: string[] } {
  const lines: string[] = [];
  const log = mock.method(console, "log", (...args: unknown[]) => lines.push(args.join(" ")));
  const error = mock.method(console, "error", (...args: unknown[]) => lines.push(args.join(" ")));
  try {
    const status = runMarkdownValidate({
      inputs: inputs.map((input) => path.join(root, input)),
      contentRoot: root,
      rulesFile: rulesFileWithoutLaterWarnings(),
      minAppVersion: "0.1.0",
      cwd: root,
      display: (file) => path.relative(root, file) || ".",
    });
    return { status, lines: lines.join("\n").split("\n").filter(Boolean) };
  } finally {
    log.mock.restore();
    error.mock.restore();
  }
}
const syllabusLines = (lines: string[]) => lines.filter((line) => line.startsWith("syllabus.json ") || line.includes("/syllabus.json "));

describe("validate <thư mục> kiểm luôn syllabus.json (SK-030)", () => {
  test("validate content từ gốc repo (lệnh README): không có lỗi syllabus; dòng tổng nêu 3 nhóm, 45 chủ đề, 390 bài", () => {
    const result = cliRun(["validate", "content"], REPO);
    // A lesson being written may still have markdown errors (exit 1); the syllabus must not.
    assert.ok(result.status === 0 || result.status === 1, result.out + result.err);
    const errors = result.lines.filter((line) => line.startsWith("content/syllabus.json ") && !line.includes("] cảnh báo: "));
    assert.deepEqual(errors, []);
    assert.match(result.out, /^validate: .* · syllabus content\/syllabus\.json \(3 nhóm, 45 chủ đề, 390 bài; \d+ bài có lesson_id(, \d+ bài chưa có tên vi)?\)$/m);
  });

  test("bản chép đúng: exit 0, không có dòng syllabus", () => {
    const { root } = copyRoot("ok");
    const result = validate(root);
    assert.equal(result.status, 0, result.lines.join("\n"));
    assert.deepEqual(syllabusLines(result.lines), []);
    assert.match(result.lines.at(-1)!, / · 0 lỗi · 2 cảnh báo · .* · syllabus syllabus\.json \(3 nhóm, 45 chủ đề, 390 bài; 1 bài có lesson_id(, \d+ bài chưa có tên vi)?\)$/);
  });

  test("bản chép có lesson_id sai (CLI): exit 1, một dòng <file> <pointer> [syllabus_lesson_ref] nêu đúng chủ đề và bài", () => {
    const { root, syllabus } = copyRoot("wrong-lesson-id");
    const { group, topic, lesson, pointer } = linkedSlot(syllabus);
    const wrong = randomUUID();
    lesson.lesson_id = wrong;
    writeSyllabus(root, syllabus);
    const result = cliRun(["validate", root]);
    assert.equal(result.status, 1, result.out + result.err);
    const file = path.join(root, "syllabus.json");
    const errors = result.lines.filter((line) => line.startsWith(`${file} `) && !line.includes("] cảnh báo: "));
    assert.equal(errors.length, 1, result.out);
    assert.equal(
      errors[0],
      `${file} ${pointer} [syllabus_lesson_ref] ${group.age_group}, chủ đề ${topic.number} "${topic.key}", bài ${lesson.number} "${lesson.title.en}": ` +
        `lesson_id ${wrong} không có trong ${root}: không bài markdown nào có id này`,
    );
    assert.match(result.out, /· 1 lỗi · /);
    // Lesson 1 of the fixture is now pointed at by no slot.
    assert.ok(result.lines.some((line) => line.startsWith(`${file} `) && line.includes("[syllabus_unlisted] cảnh báo: ") && line.includes('bài "thuc-an-cho-ta-nhung-gi"')), result.out);
  });

  test("bài có trong nội dung mà syllabus chưa trỏ tới: cảnh báo syllabus_unlisted, exit 0", () => {
    const { root, syllabus } = copyRoot("unlisted");
    delete linkedSlot(syllabus).lesson.lesson_id;
    writeSyllabus(root, syllabus);
    const result = validate(root);
    assert.equal(result.status, 0, result.lines.join("\n"));
    const lines = syllabusLines(result.lines);
    assert.equal(lines.length, 1, lines.join("\n"));
    assert.match(lines[0]!, /^syllabus\.json \/groups\/\d+\/topics\/\d+\/lessons \[syllabus_unlisted\] cảnh báo: \w+, chủ đề \d+ "[a-z-]+": bài "thuc-an-cho-ta-nhung-gi" \(discoverer\/an-uong-lanh-manh\/01-thuc-an-cho-ta-nhung-gi\.md\)/);
  });

  test("lỗi syllabus in sau lỗi markdown, trước cảnh báo; schema sai thì dừng ở schema", () => {
    const { root, syllabus } = copyRoot("schema");
    syllabus.groups[0]!.topics[0]!.title.vi = null; // topics always need vi
    writeSyllabus(root, syllabus);
    const result = validate(root);
    assert.equal(result.status, 1);
    const firstWarning = result.lines.findIndex((line) => line.includes("] cảnh báo: "));
    const schemaLine = result.lines.findIndex((line) => line.startsWith("syllabus.json /groups/0/topics/0/title/vi [schema] "));
    assert.ok(schemaLine !== -1 && schemaLine < firstWarning, result.lines.join("\n"));
    assert.match(result.lines[schemaLine]!, /\[schema\] explorer, chủ đề 1 "[a-z-]+": phải là chuỗi, đang là null$/);
    assert.match(result.lines.at(-1)!, / · syllabus syllabus\.json \(chưa qua schema\)$/);
  });

  test("syllabus.json hỏng: một dòng [syllabus_json], exit 1", () => {
    const { root } = copyRoot("broken");
    writeFileSync(path.join(root, "syllabus.json"), '{"groups": [');
    const result = validate(root);
    assert.equal(result.status, 1);
    const lines = syllabusLines(result.lines);
    assert.equal(lines.length, 1);
    assert.match(lines[0]!, /^syllabus\.json \/ \[syllabus_json\] JSON không hợp lệ: /);
  });

  test("thư mục chủ đề (không có syllabus.json bên trong): không kiểm syllabus", () => {
    const { root } = copyRoot("topic-only");
    writeFileSync(path.join(root, "syllabus.json"), "không phải JSON");
    const result = validate(root, [TOPIC_REL]);
    assert.equal(result.status, 0, result.lines.join("\n"));
    assert.doesNotMatch(result.lines.join("\n"), /syllabus/);
  });

  test("validate <…>/syllabus.json: exit 2, nhắc validate thư mục chứa nó", () => {
    const result = cliRun(["validate", REAL_SYLLABUS]);
    assert.equal(result.status, 2);
    assert.match(result.err, /syllabus\.json được kiểm khi validate thư mục chứa nó/);
  });

  test("README content-cli nêu mọi mã syllabus_* và schema", () => {
    const readme = readFileSync(path.join(CLI_ROOT, "README.md"), "utf8");
    for (const code of Object.keys(SYLLABUS_CODES)) assert.ok(readme.includes(`\`${code}\``), `README thiếu ${code}`);
  });
});
