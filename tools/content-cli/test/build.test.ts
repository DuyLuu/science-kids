import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import { createHash } from "node:crypto";
import { cpSync, existsSync, mkdirSync, mkdtempSync, readdirSync, readFileSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import { after, before, describe, test } from "node:test";
import { listFiles, outDirProblem } from "../src/build/command.ts";
import { CACHE_FORMAT } from "../src/cache.ts";
import { collectSpoken, locateCommon } from "../src/spoken.ts";
import { CLI_ROOT, LESSON_FILE, readJson, TOPIC_FILE, withOrderSequence } from "./helpers.ts";

const cli = path.join(CLI_ROOT, "src", "cli.ts");
const sha = (data: string | Buffer) => createHash("sha256").update(data).digest("hex");
const runCli = (...args: string[]) => spawnSync(process.execPath, [cli, "build", ...args], { encoding: "utf8" });
const readJsonFile = (file: string) => JSON.parse(readFileSync(file, "utf8"));

/**
 * Fixture of SK-001 with audio.en on every Spoken, plus a fake clip cache (bytes are not real
 * m4a: build only copies and hashes them). Same layout as tts output: <dir>/<slug>/{topic,lesson}.json.
 */
function makeWorkspace(root: string) {
  const inDir = path.join(root, "in", "an-uong-lanh-manh");
  const cacheDir = path.join(root, "cache");
  mkdirSync(inDir, { recursive: true });
  mkdirSync(path.join(cacheDir, "en"), { recursive: true });
  const clips: Record<string, object> = {};
  const hashOf = new Map<string, string>();
  const files: string[] = [];
  for (const source of [TOPIC_FILE, LESSON_FILE]) {
    const doc = readJson(source);
    for (const { node } of collectSpoken(doc.kind, doc)) {
      let hash = hashOf.get(node.en);
      if (!hash) {
        const bytes = Buffer.from(`fake m4a: ${node.en}`);
        hash = sha(bytes);
        const key = sha(`key: ${node.en}`);
        writeFileSync(path.join(cacheDir, "en", `${key}.m4a`), bytes);
        clips[key] = { lang: "en", file: `en/${key}.m4a`, sha256: hash, bytes: bytes.length, duration_ms: 1000, text: node.en, engine: "fake", model: "fake", voice: "af_heart", speed: 1, created_at: "2026-10-28T00:00:00.000Z" };
        hashOf.set(node.en, hash);
      }
      node.audio = { en: hash };
    }
    const file = path.join(inDir, path.basename(source));
    writeFileSync(file, `${JSON.stringify(doc, null, 2)}\n`);
    files.push(file);
  }
  writeFileSync(path.join(cacheDir, "index.json"), `${JSON.stringify({ format: CACHE_FORMAT, clips }, null, 2)}\n`);
  return { inDir, cacheDir, files, hashOf, clips: clips as Record<string, { file: string; sha256: string; text: string }> };
}

describe("build (cache giả, không cần model)", () => {
  let root: string;
  let ws: ReturnType<typeof makeWorkspace>;
  const outA = () => path.join(root, "pack-a");
  before(() => {
    root = mkdtempSync(path.join(tmpdir(), "content-cli-build-"));
    ws = makeWorkspace(root);
  });
  after(() => rmSync(root, { recursive: true, force: true }));
  const build = (out: string, ...extra: string[]) => runCli(...ws.files, "--out", out, "--cache", ws.cacheDir, ...extra);

  test("gói đúng B4.3: manifest, pack.json, assets; sha256 và size khớp; không còn brief", () => {
    const run = build(outA());
    assert.equal(run.status, 0, run.stderr);
    assert.match(run.stdout, /Chủ đề: 1 · bài: 1 · asset: 107 \(audio en 107\)/);
    assert.match(run.stdout, /Tổng dung lượng gói: .*109 file/);
    const manifest = readJsonFile(path.join(outA(), "catalog/v1/manifest.json"));
    assert.deepEqual(Object.keys(manifest), ["schema_version", "generated_at", "content_version", "topics", "rules", "assets"]);
    assert.equal(manifest.schema_version, 1);
    assert.match(manifest.content_version, /^[0-9a-f]{12}$/);
    const [topic] = manifest.topics;
    assert.equal(manifest.topics.length, 1);
    assert.deepEqual(Object.keys(topic), ["id", "slug", "age_group", "order", "title", "is_free", "version", "path", "sha256", "size", "min_app_version"]);
    assert.equal(topic.path, `topics/${topic.id}/${topic.version}/pack.json`);
    assert.equal(topic.min_app_version, "0.1.0");
    assert.deepEqual(manifest.rules, readJsonFile(path.join(CLI_ROOT, "../../content/rules.json")));
    for (const group of ["explorer", "discoverer", "scientist"]) assert.ok(manifest.rules[group].authoring, `rules.${group}.authoring (SK-026)`);

    const packFile = path.join(outA(), topic.path);
    const packBytes = readFileSync(packFile);
    assert.equal(sha(packBytes), topic.sha256);
    assert.equal(packBytes.length, topic.size);
    assert.doesNotMatch(packBytes.toString("utf8"), /"brief"/);
    const pack = JSON.parse(packBytes.toString("utf8"));
    assert.deepEqual(Object.keys(pack), ["schema_version", "topic_id", "version", "topic", "lessons"]);
    assert.equal(pack.version, topic.version);
    assert.equal(pack.lessons.length, 1);
    // Only brief is gone: put it back from the input and topic + lesson equal the inputs.
    const at = (doc: Record<string, any>, pointer: string) => pointer.slice(1).split("/").reduce((node, token) => node[token], doc);
    const input = readJsonFile(ws.files[1]!);
    const images = locateCommon("lesson", input, "Image");
    assert.equal(images.length, 36);
    const restored = structuredClone(pack.lessons[0]);
    for (const pointer of images) {
      const { brief } = at(input, pointer);
      if (brief !== undefined) at(restored, pointer).brief = brief;
    }
    assert.deepEqual(restored, input);
    assert.equal(JSON.stringify(pack.topic), JSON.stringify(readJsonFile(ws.files[0]!)));

    const assetFiles = readdirSync(path.join(outA(), "assets")).sort();
    assert.equal(assetFiles.length, 107);
    assert.equal(manifest.assets.length, 107);
    for (const asset of manifest.assets) {
      const bytes = readFileSync(path.join(outA(), asset.path));
      assert.equal(asset.path, `assets/${asset.sha256}.m4a`);
      assert.equal(sha(bytes), asset.sha256);
      assert.equal(bytes.length, asset.size);
      assert.equal(asset.kind, "audio");
      assert.equal(asset.lang, "en");
    }
    const used = new Set<string>();
    for (const doc of [pack.topic, ...pack.lessons]) for (const { node } of collectSpoken(doc.kind, doc)) used.add(node.audio!.en!);
    assert.equal(used.size, 107);
    for (const hash of used) assert.ok(existsSync(path.join(outA(), "assets", `${hash}.m4a`)), hash);
  });

  test("chạy 2 lần: mọi file giống hệt, manifest chỉ khác generated_at", () => {
    const outB = path.join(root, "pack-b");
    assert.equal(build(outB).status, 0);
    const files = listFiles(outA());
    assert.deepEqual(listFiles(outB), files);
    for (const relative of files) {
      const [a, b] = [readFileSync(path.join(outA(), relative)), readFileSync(path.join(outB, relative))];
      if (relative === "catalog/v1/manifest.json") {
        const [ma, mb] = [JSON.parse(a.toString()), JSON.parse(b.toString())];
        delete ma.generated_at;
        delete mb.generated_at;
        assert.deepEqual(ma, mb);
      } else {
        assert.ok(a.equals(b), relative);
      }
    }
  });

  test("build lại trên gói cũ: thay cả thư mục, file lạ trong assets/ bị bỏ", () => {
    const out = path.join(root, "pack-rebuild");
    assert.equal(build(out).status, 0);
    writeFileSync(path.join(out, "assets", "stale.m4a"), "old");
    assert.equal(build(out).status, 0);
    assert.equal(existsSync(path.join(out, "assets", "stale.m4a")), false);
    assert.equal(readdirSync(path.dirname(out)).filter((name) => name.includes(".tmp-") || name.includes(".old-")).length, 0);
  });

  test("xoá một clip khỏi cache: exit 1, báo mọi pointer dùng clip đó, không ghi gì", () => {
    const cache = path.join(root, "cache-missing");
    cpSync(ws.cacheDir, cache, { recursive: true });
    const hash = ws.hashOf.get("rice")!;
    const entry = Object.values(ws.clips).find((clip) => clip.sha256 === hash)!;
    rmSync(path.join(cache, entry.file));
    const out = path.join(root, "pack-missing");
    const run = runCli(...ws.files, "--out", out, "--cache", cache);
    assert.equal(run.status, 1, run.stdout);
    const lines = run.stderr.split("\n").filter((line) => line.includes("thiếu clip en"));
    const lesson = readJsonFile(ws.files[1]!);
    const expected = collectSpoken("lesson", lesson).filter(({ node }) => node.en === "rice").map(({ pointer }) => `${pointer}/audio/en`);
    assert.ok(expected.length >= 2);
    assert.deepEqual(lines.map((line) => line.split(" ")[1]), expected);
    assert.equal(existsSync(out), false);
  });

  test("clip trong cache bị sửa: exit 1, hash trùng mà khác nội dung", () => {
    const cache = path.join(root, "cache-changed");
    cpSync(ws.cacheDir, cache, { recursive: true });
    const entry = Object.values(ws.clips).find((clip) => clip.text === "Healthy eating")!;
    writeFileSync(path.join(cache, entry.file), "changed bytes");
    const run = runCli(...ws.files, "--out", path.join(root, "pack-changed"), "--cache", cache);
    assert.equal(run.status, 1);
    assert.match(run.stderr, /topic\.json \/title\/audio\/en hash trùng mà khác nội dung/);
  });

  test("input chưa qua tts (fixture gốc): exit 1, thiếu audio.en theo pointer", () => {
    const fixtureCopy = path.join(root, "raw", "an-uong-lanh-manh");
    mkdirSync(fixtureCopy, { recursive: true });
    cpSync(TOPIC_FILE, path.join(fixtureCopy, "topic.json"));
    const run = runCli(path.join(fixtureCopy, "topic.json"), "--out", path.join(root, "pack-raw"), "--cache", ws.cacheDir);
    assert.equal(run.status, 1);
    assert.match(run.stderr, /topic\.json \/title thiếu audio\.en: "Healthy eating"/);
    assert.match(run.stderr, /topic\.json \/question thiếu audio\.en/);
  });

  test("Image có asset: exit 1 (gói bản thử chưa nhận hình)", () => {
    const dir = path.join(root, "with-image", "an-uong-lanh-manh");
    mkdirSync(dir, { recursive: true });
    const lesson = readJsonFile(ws.files[1]!);
    const pointer = locateCommon("lesson", lesson, "Image")[0]!;
    const tokens = pointer.slice(1).split("/");
    let node = lesson;
    for (const token of tokens) node = node[token];
    node.asset = "a".repeat(64);
    cpSync(ws.files[0]!, path.join(dir, "topic.json"));
    writeFileSync(path.join(dir, "lesson.json"), JSON.stringify(lesson));
    const run = runCli(path.join(dir, "topic.json"), path.join(dir, "lesson.json"), "--out", path.join(root, "pack-image"), "--cache", ws.cacheDir);
    assert.equal(run.status, 1);
    assert.ok(run.stderr.includes(`lesson.json ${pointer}/asset gói bản thử chưa nhận hình`), run.stderr);
  });

  test("rules.json sai hoặc thiếu nhóm tuổi: exit 1, báo pointer", () => {
    const rules = readJsonFile(path.join(CLI_ROOT, "../../content/rules.json"));
    const noDiscoverer = path.join(root, "rules-no-discoverer.json");
    writeFileSync(noDiscoverer, JSON.stringify({ explorer: rules.explorer }));
    let run = build(path.join(root, "pack-rules"), "--rules", noDiscoverer);
    assert.equal(run.status, 1);
    assert.match(run.stderr, /topic\.json \/age_group \[age_rules_missing\] nhóm tuổi discoverer không có trong/);

    const typo = path.join(root, "rules-typo.json");
    writeFileSync(typo, JSON.stringify({ ...rules, discoverer: { ...rules.discoverer, max_tries: 0, xp_per_corect: 10 } }));
    run = build(path.join(root, "pack-rules"), "--rules", typo);
    assert.equal(run.status, 1);
    assert.match(run.stderr, /rules-typo\.json \/discoverer\/max_tries/);
    assert.match(run.stderr, /rules-typo\.json \/discoverer .*xp_per_corect/);
  });

  /** The tts-shaped lesson (audio on every Spoken), edited, next to a copy of its topic. */
  const editedInput = (name: string, edit: (lesson: Record<string, any>) => Record<string, any> | void) => {
    const dir = path.join(root, name, "an-uong-lanh-manh");
    mkdirSync(dir, { recursive: true });
    const lesson = readJsonFile(ws.files[1]!);
    const edited = edit(lesson) ?? lesson;
    cpSync(ws.files[0]!, path.join(dir, "topic.json"));
    writeFileSync(path.join(dir, "lesson.json"), JSON.stringify(edited, null, 2));
    return [path.join(dir, "topic.json"), path.join(dir, "lesson.json")];
  };
  const validateLines = (files: string[]) =>
    spawnSync(process.execPath, [cli, "validate", ...files], { encoding: "utf8" }).stdout.split("\n").filter((line) => line.includes(" ["));

  test("lỗi luật theo tuổi (SK-026): exit 1, không ghi gói, cùng dòng với validate", () => {
    const files = editedInput("age-error", (lesson) => {
      lesson.quiz[0].options.splice(lesson.quiz[0].options.findIndex((option: { correct: boolean }) => !option.correct), 1);
    });
    const out = path.join(root, "pack-age-error");
    const run = runCli(...files, "--out", out, "--cache", ws.cacheDir);
    assert.equal(run.status, 1, run.stdout);
    assert.equal(existsSync(out), false);
    const lines = run.stderr.split("\n").filter((line) => line.includes(" [age_"));
    assert.equal(lines.length, 1, run.stderr);
    assert.match(lines[0]!, /lesson\.json \/quiz\/0\/options \[age_option_count\] single_choice có 2 lựa chọn; nhóm discoverer cần 3–4$/);
    assert.deepEqual(lines, validateLines(files));
  });

  test("format chưa hiện được ở --min-app-version 0.1.0 (q2 thành order_sequence): build exit 1, validate chỉ cảnh báo", () => {
    const files = editedInput("sequence", (lesson) => withOrderSequence(lesson));
    const out = path.join(root, "pack-sequence");
    const run = runCli(...files, "--out", out, "--cache", ws.cacheDir, "--min-app-version", "0.1.0");
    assert.equal(run.status, 1, run.stdout);
    assert.equal(existsSync(out), false);
    const problems = run.stderr.split("\n").filter((line) => line.includes(" ["));
    assert.equal(problems.length, 1, run.stderr);
    assert.match(problems[0]!, /lesson\.json \/quiz\/1\/format \[format_not_rendered\] format order_sequence chưa hiện được ở app 0\.1\.0: chưa bản app nào hiện được format này/);
    const validate = spawnSync(process.execPath, [cli, "validate", ...files], { encoding: "utf8" });
    assert.equal(validate.status, 0, validate.stdout);
    assert.match(validate.stdout, /lesson\.json \/quiz\/1\/format \[format_not_rendered\] cảnh báo: format order_sequence/);
  });

  test("cảnh báo luật theo tuổi không chặn build, in ở mục Cảnh báo", () => {
    const files = editedInput("age-warning", (lesson) => {
      lesson.quiz[1].hint.en = "Think about the food that gives us energy to run and play every day.";
    });
    const run = runCli(...files, "--out", path.join(root, "pack-age-warning"), "--cache", ws.cacheDir);
    // The hint text changed, so its audio.en no longer matches a clip of that text; build only
    // checks hashes, so it still builds. What matters: one age_words_en warning, exit 0.
    assert.equal(run.status, 0, run.stderr);
    assert.match(run.stdout, /lesson\.json \/quiz\/1\/hint\/en \[age_words_en\] cảnh báo: câu EN 14 từ, nhóm discoverer tối đa 10/);
  });

  test("--out không phải gói: exit 2, không xoá gì", () => {
    const out = path.join(root, "not-a-pack");
    mkdirSync(out);
    writeFileSync(path.join(out, "notes.txt"), "keep me");
    const run = build(out);
    assert.equal(run.status, 2);
    assert.match(run.stderr, /"notes\.txt", không phải gói do build tạo/);
    assert.equal(readFileSync(path.join(out, "notes.txt"), "utf8"), "keep me");
    assert.match(outDirProblem(root) ?? "", /không phải gói/);
  });

  test("--min-app-version sai dạng: exit 2", () => {
    assert.equal(build(path.join(root, "pack-version"), "--min-app-version", "1.0").status, 2);
  });
});
