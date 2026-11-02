// Acceptance: valid sample passes, every invalid fixture fails with exactly one error,
// at the expected JSON pointer, rejected by BOTH Ajv and zod (stage "schema") or accepted
// by both and caught by the cross check (stage "refs").
import assert from "node:assert/strict";
import { readdirSync, readFileSync } from "node:fs";
import test from "node:test";
import { validateDocuments } from "../scripts/lib/core.mjs";
import { ROOT, pointers, readJson, runCli } from "./helpers.mjs";

const TABLE = readJson("test/invalid-fixtures.json");
const load = (file) => ({ file, text: readFileSync(`${ROOT}${file}`, "utf8") });

test("npm run validate: fixtures/valid -> exit 0 and prints the count", () => {
  const run = runCli(["fixtures/valid"]);
  assert.equal(run.status, 0, run.stdout);
  assert.match(run.stdout, /^OK: 2 file hợp lệ \(1 topic, 1 lesson\)$/m);
});

test("fixtures/invalid: at least 10 files, all listed in test/invalid-fixtures.json", () => {
  const onDisk = readdirSync(`${ROOT}fixtures/invalid`).filter((name) => name.endsWith(".json")).map((name) => `fixtures/invalid/${name}`).sort();
  assert.ok(onDisk.length >= 10, `only ${onDisk.length} invalid fixtures`);
  assert.deepEqual(onDisk, TABLE.map((row) => row.file).sort());
});

test("fixtures/invalid covers every case named in SK-001", () => {
  const required = [
    "quiz-5-items", "spoken-missing-vi", "uuid-bad-format", "single-choice-two-correct", "multi-choice-no-correct",
    "block-unknown-type", "image-missing-alt", "misconception-id-not-in-topic", "uuid-duplicate", "vocab-9-terms",
    "key-points-2", "warmup-missing-recall-from",
  ];
  for (const name of required) assert.ok(TABLE.some((row) => row.file === `fixtures/invalid/${name}.json`), name);
});

for (const row of TABLE) {
  test(`${row.file}: ${row.description} -> ${row.pointer} (${row.stage})`, () => {
    const report = validateDocuments([...row.context.map(load), load(row.file)]);
    assert.equal(report.ok, false);
    assert.deepEqual(
      report.errors.map(({ file, pointer, stage }) => ({ file, pointer, stage })),
      [{ file: row.file, pointer: row.pointer, stage: row.stage }],
      JSON.stringify(report.errors, null, 2),
    );
    const result = report.results.find((entry) => entry.file === row.file);
    if (row.stage === "schema") {
      assert.deepEqual(pointers(result.ajv), [row.pointer], "Ajv");
      assert.deepEqual(pointers(result.zod), [row.pointer], "zod");
    } else {
      assert.deepEqual(result.ajv, [], "Ajv must accept the shape");
      assert.deepEqual(result.zod, [], "zod must accept the shape");
    }
  });
}
