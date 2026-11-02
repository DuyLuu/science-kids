// CLI behaviour: line format, exit codes, no stack traces.
import assert from "node:assert/strict";
import { mkdtempSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import test from "node:test";
import { TOPIC_FILE, runCli } from "./helpers.mjs";

const LINE = /^(\S+) (\/\S*) (\S.*)$/;
const noStack = (text) => assert.doesNotMatch(text, /^\s+at |Error:|node:internal/m);

function withTemp(files, fn) {
  const dir = mkdtempSync(path.join(tmpdir(), "content-schema-cli-"));
  try {
    for (const [name, content] of Object.entries(files)) writeFileSync(path.join(dir, name), content);
    return fn(dir);
  } finally {
    rmSync(dir, { recursive: true, force: true });
  }
}

test("every error line is `<file> <JSON pointer> <message>`", () => {
  const run = runCli([TOPIC_FILE, "fixtures/invalid/quiz-5-items.json", "fixtures/invalid/spoken-missing-vi.json"]);
  assert.equal(run.status, 1);
  const errors = run.lines.filter((line) => !line.startsWith("LỖI"));
  assert.equal(errors.length, 2);
  for (const line of errors) assert.match(line, LINE);
  assert.ok(errors.includes("fixtures/invalid/quiz-5-items.json /quiz cần đúng 6 phần tử, đang có 5"));
  assert.ok(errors.includes('fixtures/invalid/spoken-missing-vi.json /learn/0/groups/1/sentence/vi thiếu trường bắt buộc "vi"'));
  noStack(run.stdout + run.stderr);
});

test("broken JSON, missing kind, non-object root: readable, no stack trace", () => {
  withTemp({ "broken.json": '{"kind": "topic",', "nokind.json": "{}", "list.json": "[]", "odd.json": '{"kind":"badge"}' }, (dir) => {
    const run = runCli([dir]);
    assert.equal(run.status, 1);
    noStack(run.stdout + run.stderr);
    const at = (name) => run.lines.find((line) => line.includes(`${name} `));
    assert.match(at("broken.json"), /broken\.json \/ JSON không hợp lệ: /);
    assert.match(at("nokind.json"), /nokind\.json \/kind thiếu kind; phải là "topic" hoặc "lesson"/);
    assert.match(at("list.json"), /list\.json \/ file phải là một object JSON/);
    assert.match(at("odd.json"), /odd\.json \/kind kind "badge" không hợp lệ/);
  });
});

test("missing path -> exit 1; no input or unknown flag -> exit 2; --help -> exit 0", () => {
  const missing = runCli(["does/not/exist.json"]);
  assert.equal(missing.status, 1);
  assert.match(missing.stdout, /does\/not\/exist\.json \/ không tìm thấy file hoặc thư mục/);
  assert.equal(runCli([]).status, 2);
  const unknown = runCli(["--fix", "fixtures/valid"]);
  assert.equal(unknown.status, 2);
  assert.match(unknown.stderr, /Cờ không hỗ trợ: --fix/);
  assert.equal(runCli(["--help"]).status, 0);
});

test("the same file given twice is checked once", () => {
  const run = runCli(["fixtures/valid", TOPIC_FILE]);
  assert.equal(run.status, 0, run.stdout);
  assert.match(run.stdout, /OK: 2 file hợp lệ/);
});
