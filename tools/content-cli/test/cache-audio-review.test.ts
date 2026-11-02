import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import { mkdtempSync, readFileSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import { describe, test } from "node:test";
import { M4A_ENCODING, pcm16FromWav, wavFromFloat } from "../src/audio.ts";
import { cacheKey, canonicalJson } from "../src/cache.ts";
import { reviewPointers, vocabPointers } from "../src/tts/review.ts";
import { BLANK_STRATEGY } from "../src/tts/utterance.ts";
import { CLI_ROOT, LESSON_FILE, readJson, TOPIC_FILE } from "./helpers.ts";

describe("khoá cache", () => {
  const engine = { model: "m", voice: "af_heart", speed: 1 };
  const base = { lang: "en" as const, text: "rice", engine, blank: BLANK_STRATEGY, encoding: M4A_ENCODING };

  test("không phụ thuộc thứ tự thuộc tính", () => {
    assert.equal(canonicalJson({ b: 1, a: [{ d: 2, c: 3 }] }), '{"a":[{"c":3,"d":2}],"b":1}');
    assert.equal(cacheKey(base), cacheKey({ ...base, engine: { speed: 1, voice: "af_heart", model: "m" } }));
  });

  test("đổi chữ, giọng, tốc độ, model hay tham số mã hoá thì đổi khoá", () => {
    const key = cacheKey(base);
    assert.match(key, /^[0-9a-f]{64}$/);
    for (const changed of [
      { ...base, text: "Rice" },
      { ...base, engine: { ...engine, voice: "af_bella" } },
      { ...base, engine: { ...engine, speed: 1.1 } },
      { ...base, engine: { ...engine, model: "m2" } },
      { ...base, encoding: { ...M4A_ENCODING, bitrate: 96000 } },
    ]) {
      assert.notEqual(cacheKey(changed), key);
    }
  });
});

describe("WAV", () => {
  test("ghi rồi đọc lại PCM 16-bit", () => {
    const samples = new Float32Array([0, 0.5, -0.5, 1, -1, 2]);
    const { data, sampleRate } = pcm16FromWav(wavFromFloat(samples, 24000));
    assert.equal(sampleRate, 24000);
    assert.deepEqual([...new Int16Array(data.buffer, data.byteOffset, data.length / 2)], [0, 16384, -16384, 32767, -32768, 32767]);
  });
});

describe("file nghe thử", () => {
  test("10 câu theo SK-014 + 16 mục từ vựng", () => {
    const lesson = readJson(LESSON_FILE);
    assert.deepEqual(
      reviewPointers(lesson).map(({ pointer }) => pointer),
      [
        "/title",
        "/objective",
        "/key_points/0",
        "/warmup/0/sentence",
        "/quiz/1/sentence",
        "/quiz/5/statement",
        "/quiz/1/hint",
        "/quiz/0/explanation_correct",
        "/play/messages/balanced",
        "/quiz/5/instruction",
      ],
    );
    const vocab = vocabPointers(lesson);
    assert.equal(vocab.length, 16);
    assert.deepEqual(vocab.slice(0, 2).map(({ pointer }) => pointer), ["/vocab/0/term", "/vocab/0/example"]);
  });
});

describe("CLI (không cần model)", () => {
  const cli = path.join(CLI_ROOT, "src", "cli.ts");
  const runCli = (...args: string[]) => spawnSync(process.execPath, [cli, ...args], { encoding: "utf8" });

  test("thiếu --out: exit 2", () => {
    const result = runCli("tts", TOPIC_FILE);
    assert.equal(result.status, 2);
    assert.match(result.stderr, /Thiếu --out/);
  });

  test("--out trùng thư mục nguồn: exit 2, không ghi đè fixture", () => {
    const before = readFileSync(TOPIC_FILE, "utf8");
    const result = runCli("tts", TOPIC_FILE, "--out", path.dirname(TOPIC_FILE));
    assert.equal(result.status, 2);
    assert.equal(readFileSync(TOPIC_FILE, "utf8"), before);
  });

  test("input sai schema: exit 1 trước khi nạp model", () => {
    const dir = mkdtempSync(path.join(tmpdir(), "content-cli-test-"));
    try {
      const topic = readJson(TOPIC_FILE);
      (topic.title as Record<string, unknown>).en = "";
      const file = path.join(dir, "topic.json");
      writeFileSync(file, JSON.stringify(topic));
      const result = runCli("tts", file, "--out", path.join(dir, "out"), "--cache", path.join(dir, "audio"));
      assert.equal(result.status, 1);
      assert.match(result.stderr, /\/title\/en/);
    } finally {
      rmSync(dir, { recursive: true, force: true });
    }
  });
});
