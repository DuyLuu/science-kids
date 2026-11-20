import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import { existsSync, mkdirSync, mkdtempSync, readFileSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import { describe, test } from "node:test";
import { sha256OfFile } from "../src/audio.ts";
import { buildManifest, clipFileName, parseUiVoiceSource, replaceableOut, UI_VOICE_MANIFEST_FORMAT, UI_VOICE_SOURCE_FORMAT } from "../src/ui-voice/source.ts";
import { CLI_ROOT } from "./helpers.ts";

const REPO_ROOT = path.resolve(CLI_ROOT, "..", "..");
const SOURCE = path.join(REPO_ROOT, "content", "ui-voice", "strings.json");
const CLI = path.join(CLI_ROOT, "src", "cli.ts");

function source(strings: unknown, format: string = UI_VOICE_SOURCE_FORMAT): string {
  return JSON.stringify({ format, strings });
}

function cli(args: string[]) {
  return spawnSync(process.execPath, [CLI, ...args], { encoding: "utf8", env: { ...process.env, INIT_CWD: CLI_ROOT } });
}

function tempDir(): string {
  const dir = mkdtempSync(path.join(tmpdir(), "content-cli-ui-voice-test-"));
  process.on("exit", () => rmSync(dir, { recursive: true, force: true }));
  return dir;
}

describe("ui-voice source (SK-059)", () => {
  test("content/ui-voice/strings.json is valid: the 4 hint keys of SK-059 table A, EN and VI", () => {
    const { strings, problems } = parseUiVoiceSource(readFileSync(SOURCE, "utf8"));
    assert.deepEqual(problems, []);
    assert.deepEqual(
      strings.map((s) => s.key),
      ["lesson.play.hint.first.explorer", "lesson.play.hint.first.discoverer", "lesson.play.hint.again.explorer", "lesson.play.hint.again.discoverer"],
    );
    for (const s of strings) {
      assert.ok(s.en.length > 0 && s.vi.length > 0, s.key);
      assert.equal(s.vi, s.vi.normalize("NFC"));
    }
  });

  test("reports missing languages, bad keys, unknown fields and a wrong format", () => {
    const { strings, problems } = parseUiVoiceSource(
      source(
        {
          "lesson.play.ok": { en: "Hello.", vi: "Xin chào." },
          "Lesson Play": { en: "Hi.", vi: "Chào." },
          "lesson.play.no_vi": { en: "Hi." },
          "lesson.play.extra": { en: "Hi.", vi: "Chào.", voice: "x" },
          "lesson.play.space": { en: " Hi.", vi: "Chào." },
        },
        "other@1",
      ),
    );
    assert.deepEqual(strings.map((s) => s.key), ["lesson.play.ok", "Lesson Play", "lesson.play.extra", "lesson.play.space"]);
    assert.deepEqual(
      problems.map((p) => p.pointer),
      ["/format", "/strings/Lesson Play", "/strings/lesson.play.no_vi/vi", "/strings/lesson.play.extra/voice", "/strings/lesson.play.space/en"],
    );
  });

  test("not JSON or no strings: one problem, nothing to make", () => {
    assert.equal(parseUiVoiceSource("{").problems.length, 1);
    const empty = parseUiVoiceSource(source({}));
    assert.deepEqual(empty.strings, []);
    assert.deepEqual(empty.problems.map((p) => p.pointer), ["/strings"]);
  });
});

describe("ui-voice manifest (SK-059)", () => {
  test("flat bundle file names <key>.<lang>.m4a", () => {
    assert.equal(clipFileName("lesson.play.hint.first.explorer", "vi"), "lesson.play.hint.first.explorer.vi.m4a");
  });

  test("keys sorted, en before vi, no timestamp: same input gives the same bytes", () => {
    const clip = (n: number) => ({ sha256: String(n).repeat(64).slice(0, 64), bytes: n, duration_ms: n * 100, text: `t${n}`, read: `r${n}` });
    const input = {
      source: "content/ui-voice/strings.json",
      sourceSha256: "abc",
      engines: { en: "Kokoro", vi: "VieNeu" },
      clips: [
        { key: "b.x", lang: "vi" as const, clip: clip(1) },
        { key: "a.x", lang: "vi" as const, clip: clip(2) },
        { key: "b.x", lang: "en" as const, clip: clip(3) },
        { key: "a.x", lang: "en" as const, clip: clip(4) },
      ],
    };
    const manifest = buildManifest(input);
    assert.equal(manifest.format, UI_VOICE_MANIFEST_FORMAT);
    assert.deepEqual(Object.keys(manifest.clips), ["a.x", "b.x"]);
    assert.deepEqual(Object.keys(manifest.clips["a.x"]!), ["en", "vi"]);
    assert.deepEqual(manifest.clips["b.x"]!.en, { file: "b.x.en.m4a", ...clip(3) });
    assert.equal(JSON.stringify(buildManifest({ ...input, clips: [...input.clips].reverse() })), JSON.stringify(manifest));
  });

  test("--out is replaced only when empty or an earlier ui-voice build", () => {
    assert.equal(replaceableOut([], undefined), true);
    assert.equal(replaceableOut(["manifest.json", "a.en.m4a"], JSON.stringify({ format: UI_VOICE_MANIFEST_FORMAT })), true);
    assert.equal(replaceableOut(["notes.txt"], undefined), false);
    assert.equal(replaceableOut(["manifest.json"], JSON.stringify({ format: "science-kids/pack@1" })), false);
    assert.equal(replaceableOut(["manifest.json"], "{"), false);
  });
});

describe("ui-voice build command (SK-059)", () => {
  test("wrong usage exits 2 without loading a model", () => {
    assert.equal(cli(["ui-voice"]).status, 2);
    assert.equal(cli(["ui-voice", "make"]).status, 2);
    assert.equal(cli(["ui-voice", "build", "--lang", "fr"]).status, 2);
    const out = tempDir();
    writeFileSync(path.join(out, "keep.txt"), "not a ui-voice build");
    const result = cli(["ui-voice", "build", "--out", out, "--no-review"]);
    assert.equal(result.status, 2, result.stderr);
    assert.match(result.stderr, /không xoá/);
    assert.ok(existsSync(path.join(out, "keep.txt")));
  });

  test("an invalid source exits 1 and writes nothing", () => {
    const dir = tempDir();
    const file = path.join(dir, "strings.json");
    writeFileSync(file, source({ "lesson.play.x": { en: "Hi." } }));
    const out = path.join(dir, "out");
    const result = cli(["ui-voice", "build", "--source", file, "--out", out, "--no-review"]);
    assert.equal(result.status, 1);
    assert.match(result.stderr, /\/strings\/lesson\.play\.x\/vi thiếu câu VI/);
    assert.equal(existsSync(out), false);
  });

  // Needs the clips of an earlier real run in content/.audio (gitignored); with them, no model loads.
  const manifestOfRealRun = path.join(REPO_ROOT, "content", ".build", "ui-voice", "manifest.json");
  test("from the cache: 8 clips whose bytes match the manifest", { skip: !existsSync(manifestOfRealRun) && "chưa chạy ui-voice build thật trên máy này" }, () => {
    const out = path.join(tempDir(), "ui-voice");
    mkdirSync(out);
    const result = cli(["ui-voice", "build", "--out", out, "--no-review", "--no-self-check"]);
    assert.equal(result.status, 0, result.stderr);
    assert.match(result.stdout, /sinh mới 0 · dùng lại 4/);
    const manifest = JSON.parse(readFileSync(path.join(out, "manifest.json"), "utf8"));
    assert.equal(manifest.source, "content/ui-voice/strings.json");
    const files = Object.values(manifest.clips).flatMap((byLang) => Object.values(byLang as Record<string, { file: string; sha256: string }>));
    assert.equal(files.length, 8);
    for (const clip of files) assert.equal(sha256OfFile(path.join(out, clip.file)), clip.sha256);
    assert.equal(readFileSync(path.join(out, "manifest.json"), "utf8"), readFileSync(manifestOfRealRun, "utf8"));
  });
});
