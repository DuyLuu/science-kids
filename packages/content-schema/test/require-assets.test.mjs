// --require-assets: every Spoken needs audio.en + audio.vi, every Image needs asset.
import assert from "node:assert/strict";
import { mkdirSync, mkdtempSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import test from "node:test";
import { LESSON_FILE, TOPIC_FILE, check, hash, pointers, runCli, validLesson, validTopic } from "./helpers.mjs";

// Independent oracle, not derived from the schema: an {en, vi} object is Spoken unless it
// sits where the contract uses Text (Image.alt, Misconception.statement/correction,
// recall_from.note); an object with `alt` is an Image.
const TEXT_AT = [/\/alt$/, /^\/misconceptions\/\d+\/(statement|correction)$/, /\/recall_from\/note$/];
function assetSlots(data) {
  const spoken = [];
  const images = [];
  const walk = (value, pointer) => {
    if (Array.isArray(value)) return value.forEach((item, i) => walk(item, `${pointer}/${i}`));
    if (!value || typeof value !== "object") return;
    if (typeof value.en === "string" && typeof value.vi === "string" && !TEXT_AT.some((re) => re.test(pointer))) spoken.push(pointer);
    if ("alt" in value) images.push(pointer);
    for (const [key, item] of Object.entries(value)) walk(item, `${pointer}/${key}`);
  };
  walk(data, "");
  return { spoken, images };
}
function fillAssets(data) {
  const copy = structuredClone(data);
  const at = (pointer) => pointer.split("/").slice(1).reduce((node, key) => node[key], copy);
  const { spoken, images } = assetSlots(copy);
  for (const pointer of spoken) at(pointer).audio = { en: hash("a"), vi: hash("b") };
  for (const pointer of images) at(pointer).asset = hash("c");
  return copy;
}

test("--require-assets on fixtures/valid -> exit 1, one line per missing audio / asset", () => {
  const run = runCli(["--require-assets", "fixtures/valid"]);
  assert.equal(run.status, 1);
  assert.match(run.stdout, /^LỖI \(--require-assets\): \d+ lỗi ở 2 file/m);
  for (const [file, data] of [[TOPIC_FILE, validTopic()], [LESSON_FILE, validLesson()]]) {
    const { spoken, images } = assetSlots(data);
    const expected = [
      ...spoken.map((p) => `${file} ${p}/audio thiếu audio (cần audio.en và audio.vi)`),
      ...images.map((p) => `${file} ${p}/asset hình thiếu asset`),
    ].sort();
    const actual = run.lines.filter((line) => line.startsWith(`${file} `)).sort();
    assert.deepEqual(actual, expected, file);
  }
});

test("Text is never asked for audio (alt, misconception, recall_from.note)", () => {
  const report = check([validLesson()], { requireAssets: true });
  const all = report.errors.map((e) => e.pointer);
  assert.ok(all.length > 0);
  for (const pointer of all) assert.doesNotMatch(pointer, /\/alt\/audio$|\/recall_from\/note\/audio$|^\/misconceptions\/\d+\/(statement|correction)\/audio$/);
  // true_false.statement is Spoken (a character's line), so it does need audio.
  assert.ok(all.includes(`/quiz/${validLesson().quiz.findIndex((item) => item.statement)}/statement/audio`));
  assert.ok(all.includes("/reward/collectible/image/asset"));
  assert.ok(all.includes("/title/audio"));
});

test("all assets present (fake but valid sha256) -> exit 0 with and without the flag", () => {
  const dir = mkdtempSync(path.join(tmpdir(), "content-schema-"));
  try {
    const topicDir = path.join(dir, "discoverer", "an-uong-lanh-manh");
    mkdirSync(topicDir, { recursive: true });
    writeFileSync(path.join(topicDir, "topic.json"), JSON.stringify(fillAssets(validTopic())));
    writeFileSync(path.join(topicDir, "01-thuc-an-cho-ta-nhung-gi.json"), JSON.stringify(fillAssets(validLesson())));
    const strict = runCli(["--require-assets", dir]);
    assert.equal(strict.status, 0, strict.stdout);
    assert.match(strict.stdout, /^OK \(--require-assets\): 2 file hợp lệ \(1 topic, 1 lesson\)$/m);
    assert.equal(runCli([dir]).status, 0);
  } finally {
    rmSync(dir, { recursive: true, force: true });
  }
});

test("half-filled audio and malformed hash are pointed at precisely", () => {
  const lesson = fillAssets(validLesson());
  delete lesson.title.audio.vi;
  lesson.objective.audio.en = "abc";
  delete lesson.reward.collectible.image.asset;
  const topic = { file: "mem/t.json", data: fillAssets(validTopic()) };
  const strict = check([topic, { file: "lesson.json", data: lesson }], { requireAssets: true, alone: true });
  assert.deepEqual(pointers(strict.errors), ["/objective/audio/en", "/reward/collectible/image/asset", "/title/audio/vi"]);
  const result = strict.results.at(-1);
  assert.deepEqual(pointers(result.zod), pointers(result.ajv));
  // Without the flag only the malformed hash is an error.
  assert.deepEqual(pointers(check([lesson]).errors), ["/objective/audio/en"]);
});
