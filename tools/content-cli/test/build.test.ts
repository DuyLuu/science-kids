import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import { createHash } from "node:crypto";
import { cpSync, existsSync, mkdirSync, mkdtempSync, readdirSync, readFileSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import { after, before, describe, mock, test } from "node:test";
import sharp from "sharp";
import { listFiles, outDirProblem } from "../src/build/command.ts";
import { CACHE_FORMAT } from "../src/cache.ts";
import { ImageCache } from "../src/images/cache.ts";
import { runImagesFetch } from "../src/images/fetch.ts";
import { processImage } from "../src/images/process.ts";
import { creditOf, imageCacheKey, ownCredit, selectionFileFor, type Picked } from "../src/images/selection.ts";
import { collectSpoken, locateCommon } from "../src/spoken.ts";
import { CLI_ROOT, LESSON_FILE, readJson, TOPIC_FILE, withOrderSequence } from "./helpers.ts";

const cli = path.join(CLI_ROOT, "src", "cli.ts");
const sha = (data: string | Buffer) => createHash("sha256").update(data).digest("hex");
/** Empty selection folder and image cache: builds here never pick up content/images or content/.images. */
const NO_IMAGES = mkdtempSync(path.join(tmpdir(), "content-cli-no-images-"));
process.on("exit", () => rmSync(NO_IMAGES, { recursive: true, force: true }));
const runCli = (...args: string[]) =>
  spawnSync(process.execPath, [cli, "build", ...args, ...(args.includes("--images") ? [] : ["--images", NO_IMAGES, "--image-cache", NO_IMAGES])], { encoding: "utf8" });
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

  test("hình của thẻ từ fill_blank_bank (SK-033): vào gói như mọi Image, bỏ brief", () => {
    const dir = path.join(root, "bank-image", "an-uong-lanh-manh");
    mkdirSync(dir, { recursive: true });
    const lesson = readJsonFile(ws.files[1]!);
    const w = lesson.warmup.findIndex((item: { format: string }) => item.format === "fill_blank_bank");
    const alt = { en: "Air bubbles in water", vi: "Bọt khí trong nước" };
    lesson.warmup[w].bank[0].image = { alt, brief: "Bọt khí trong cốc nước, ảnh chụp" };
    assert.ok(locateCommon("lesson", lesson, "Image").includes(`/warmup/${w}/bank/0/image`));
    cpSync(ws.files[0]!, path.join(dir, "topic.json"));
    writeFileSync(path.join(dir, "lesson.json"), JSON.stringify(lesson));
    const out = path.join(root, "pack-bank-image");
    const run = runCli(path.join(dir, "topic.json"), path.join(dir, "lesson.json"), "--out", out, "--cache", ws.cacheDir);
    assert.equal(run.status, 0, run.stderr);
    const [topic] = readJsonFile(path.join(out, "catalog/v1/manifest.json")).topics;
    const packText = readFileSync(path.join(out, topic.path), "utf8");
    assert.doesNotMatch(packText, /"brief"/);
    assert.deepEqual(JSON.parse(packText).lessons[0].warmup[w].bank[0].image, { alt });
  });

  test("feedback của lựa chọn sai (SK-044): là Spoken, vào gói với audio như mọi câu; thiếu audio thì exit 1 ở pointer feedback", () => {
    const dir = path.join(root, "feedback", "an-uong-lanh-manh");
    mkdirSync(dir, { recursive: true });
    const lesson = readJsonFile(ws.files[1]!);
    const q = lesson.quiz.findIndex((item: { format: string }) => item.format === "single_choice");
    const j = lesson.quiz[q].options.findIndex((option: { correct: boolean }) => !option.correct);
    // Reuse a text that is already in the fake cache (its hint): build only needs the clip to exist.
    lesson.quiz[q].options[j].feedback = structuredClone(lesson.quiz[q].hint);
    assert.ok(collectSpoken("lesson", lesson).some((ref) => ref.pointer === `/quiz/${q}/options/${j}/feedback`), "tts and build see feedback as Spoken");
    cpSync(ws.files[0]!, path.join(dir, "topic.json"));
    writeFileSync(path.join(dir, "lesson.json"), JSON.stringify(lesson));
    const out = path.join(root, "pack-feedback");
    const run = runCli(path.join(dir, "topic.json"), path.join(dir, "lesson.json"), "--out", out, "--cache", ws.cacheDir);
    assert.equal(run.status, 0, run.stderr);
    const [topic] = readJsonFile(path.join(out, "catalog/v1/manifest.json")).topics;
    const pack = readJsonFile(path.join(out, topic.path));
    assert.deepEqual(pack.lessons[0].quiz[q].options[j].feedback, lesson.quiz[q].hint);
    assert.ok(existsSync(path.join(out, "assets", `${lesson.quiz[q].hint.audio.en}.m4a`)));

    delete lesson.quiz[q].options[j].feedback.audio;
    writeFileSync(path.join(dir, "lesson.json"), JSON.stringify(lesson));
    const missing = runCli(path.join(dir, "topic.json"), path.join(dir, "lesson.json"), "--out", path.join(root, "pack-feedback-missing"), "--cache", ws.cacheDir);
    assert.equal(missing.status, 1, missing.stdout);
    assert.match(missing.stdout + missing.stderr, new RegExp(`/quiz/${q}/options/${j}/feedback thiếu audio\\.en`));
  });

  test("Image có asset viết sẵn trong nội dung: exit 1 (asset do build điền từ file chọn ảnh)", () => {
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
    assert.ok(run.stderr.includes(`lesson.json ${pointer}/asset image.asset do build điền từ file chọn ảnh`), run.stderr);
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
    assert.deepEqual(lines, validateLines(files).filter((line) => line.includes(" [age_")));
  });

  test("format chưa hiện được ở --min-app-version 0.0.9 (q2 thành order_sequence, hiện từ 0.1.0, SK-043): build exit 1, validate chỉ cảnh báo", () => {
    const files = editedInput("sequence", (lesson) => withOrderSequence(lesson));
    const out = path.join(root, "pack-sequence");
    const run = runCli(...files, "--out", out, "--cache", ws.cacheDir, "--min-app-version", "0.0.9");
    assert.equal(run.status, 1, run.stdout);
    assert.equal(existsSync(out), false);
    const problems = run.stderr.split("\n").filter((line) => line.includes(" ["));
    // 0.0.9 is older than every renderer: one line per warm-up and quiz item.
    assert.equal(problems.length, 8, run.stderr);
    assert.ok(problems.every((line) => line.includes("[format_not_rendered]")), run.stderr);
    assert.ok(problems.some((line) => /lesson\.json \/quiz\/1\/format \[format_not_rendered\] format order_sequence chưa hiện được ở app 0\.0\.9: app hiện được từ 0\.1\.0/.test(line)), run.stderr);
    const validate = spawnSync(process.execPath, [cli, "validate", ...files, "--min-app-version", "0.0.9"], { encoding: "utf8" });
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

describe("build với ảnh (SK-033: file chọn ảnh + cache ảnh giả)", () => {
  let root: string;
  let ws: ReturnType<typeof makeWorkspace>;
  let selectionDir: string;
  let imageCacheDir: string;
  const sha256Of = new Map<string, string>();
  const PICK_A: Picked = {
    source: "Wikimedia Commons",
    source_url: "https://commons.wikimedia.org/wiki/File:Bowl_of_rice.jpg",
    file_url: "https://upload.wikimedia.org/wikipedia/commons/a/a1/Bowl_of_rice.jpg",
    title: "Bowl of rice",
    author: "Example Author A",
    license: "CC BY 4.0",
    license_url: "https://creativecommons.org/licenses/by/4.0/",
  };
  const PICK_B: Picked = {
    source: "Openverse/Flickr",
    openverse_id: "22222222-2222-4222-8222-222222222222",
    source_url: "https://www.flickr.com/photos/example/9002",
    file_url: "https://live.staticflickr.com/65535/9002_abc_b.jpg",
    title: "Young plant",
    author: "Example Photographer 2",
    license: "CC0 1.0",
    license_url: "https://creativecommons.org/publicdomain/zero/1.0/",
    crop: { left: 0, top: 0, width: 0.5, height: 1 },
  };
  const LESSON_SELECTION = () => selectionFileFor(selectionDir, "discoverer", "an-uong-lanh-manh", "thuc-an-cho-ta-nhung-gi");
  const writeSelection = (images: Record<string, unknown>, file = LESSON_SELECTION()) => {
    mkdirSync(path.dirname(file), { recursive: true });
    writeFileSync(file, `${JSON.stringify({ images }, null, 2)}\n`);
  };
  const build = (out: string, ...extra: string[]) => runCli(...ws.files, "--out", out, "--cache", ws.cacheDir, "--images", selectionDir, "--image-cache", imageCacheDir, ...extra);

  before(async () => {
    root = mkdtempSync(path.join(tmpdir(), "content-cli-build-img-"));
    ws = makeWorkspace(root);
    selectionDir = path.join(root, "images");
    imageCacheDir = path.join(root, "image-cache");
    // What `images fetch` would leave in the cache, without the network.
    const cache = new ImageCache(imageCacheDir);
    for (const [pick, color] of [[PICK_A, "#d04020"], [PICK_B, "#20a040"]] as const) {
      const source = await sharp({ create: { width: 1600, height: 1200, channels: 3, background: color } }).jpeg().toBuffer();
      const processed = await processImage(source, pick.crop);
      const hash = sha(processed.jpeg);
      sha256Of.set(pick.file_url, hash);
      cache.put(
        imageCacheKey(pick),
        {
          file: `${hash}.jpg`,
          sha256: hash,
          bytes: processed.jpeg.length,
          width: processed.width,
          height: processed.height,
          credit: creditOf(pick),
          changes: processed.changes,
          file_url: pick.file_url,
          ...(pick.crop ? { crop: pick.crop } : {}),
          downloaded_url: pick.file_url,
          original: { ...processed.original, bytes: source.length },
          verified: { via: ["test"], license: pick.license, author_at_source: pick.author, at: "2026-11-09T00:00:00.000Z", notes: [] },
          fetched_at: "2026-11-09T00:00:00.000Z",
        },
        processed.jpeg,
      );
    }
    cache.save();
  });
  after(() => rmSync(root, { recursive: true, force: true }));

  test("điền image.asset, chép assets/<sha256>.jpg, manifest kind image + credit; mỗi ảnh một file; check-pack.sh OK", () => {
    writeSelection({
      "tray.tray_rice": PICK_A,
      "q1.q1_rice": { same_as: "tray_rice" },
      "q5.q5_rice": { same_as: "tray.tray_rice" },
      "learn.explore.explore_carb": PICK_A,
      w2: PICK_B,
    });
    const out = path.join(root, "pack-images");
    const run = build(out);
    assert.equal(run.status, 0, run.stderr);
    const lesson = readJsonFile(ws.files[1]!);
    const total = locateCommon("lesson", lesson, "Image").length;
    assert.match(run.stdout, new RegExp(`Hình: 2 file ảnh cho 5 Image · ${total - 5} Image chưa có ảnh`));
    assert.match(run.stdout, /asset: 109 \(audio en 107, image 2\)/);
    assert.match(run.stdout, /cảnh báo hình \(image_missing, image_brief_keywords\); xem từng dòng bằng validate/);

    const manifest = readJsonFile(path.join(out, "catalog/v1/manifest.json"));
    const images = manifest.assets.filter((asset: { kind: string }) => asset.kind === "image");
    assert.equal(images.length, 2);
    const a = images.find((asset: { sha256: string }) => asset.sha256 === sha256Of.get(PICK_A.file_url));
    const b = images.find((asset: { sha256: string }) => asset.sha256 === sha256Of.get(PICK_B.file_url));
    assert.deepEqual(Object.keys(a), ["sha256", "size", "kind", "path", "width", "height", "credit"]);
    assert.deepEqual(a.credit, { ...creditOf(PICK_A), changes: ["resized"] });
    assert.deepEqual(Object.keys(a.credit), ["title", "author", "license", "license_url", "source", "source_url", "changes"]);
    assert.deepEqual([a.path, a.width, a.height], [`assets/${a.sha256}.jpg`, 1024, 768]);
    // B: left half of 1600×1200 = 800×1200, then longest edge 1024.
    assert.deepEqual([b.width, b.height, b.credit.changes], [683, 1024, ["cropped", "resized"]]);
    for (const asset of images) {
      const bytes = readFileSync(path.join(out, asset.path));
      assert.equal(sha(bytes), asset.sha256);
      assert.equal(bytes.length, asset.size);
    }

    const [topic] = manifest.topics;
    const pack = JSON.parse(readFileSync(path.join(out, topic.path), "utf8")).lessons[0];
    const at = (pointer: string) => pointer.slice(1).split("/").reduce((node: any, token) => node[token], pack);
    assert.equal(at("/play/items/0/image").asset, a.sha256);
    assert.equal(at("/quiz/0/options/1/image").asset, a.sha256);
    assert.equal(at("/quiz/4/options/1/image").asset, a.sha256);
    assert.equal(at("/learn/0/groups/0/image").asset, a.sha256);
    assert.equal(at("/warmup/1/image").asset, b.sha256);
    assert.deepEqual(Object.keys(at("/warmup/1/image")), ["alt", "asset"]);
    assert.equal(at("/play/items/1/image").asset, undefined);
    assert.doesNotMatch(readFileSync(path.join(out, topic.path), "utf8"), /"brief"/);

    const check = spawnSync("sh", [path.join(CLI_ROOT, "scripts", "check-pack.sh"), out], { encoding: "utf8" });
    assert.equal(check.status, 0, check.stdout + check.stderr);
    assert.match(check.stdout, /ảnh: 2 hash trong pack\.json = 2 dòng kind image trong manifest/);
    assert.match(check.stdout, /ảnh: 2 file kiểm JPEG, metadata, kích thước, credit, giấy phép · lỗi: 0/);
    assert.match(check.stdout, /^OK$/m);

    // check-pack catches a manifest that lies about the picture.
    const broken = path.join(root, "pack-images-broken");
    cpSync(out, broken, { recursive: true });
    const brokenManifest = readJsonFile(path.join(broken, "catalog/v1/manifest.json"));
    const entry = brokenManifest.assets.find((asset: { kind: string }) => asset.kind === "image");
    entry.width = 999;
    entry.credit.license = "CC BY-SA 4.0";
    writeFileSync(path.join(broken, "catalog/v1/manifest.json"), JSON.stringify(brokenManifest, null, 2));
    const bad = spawnSync("sh", [path.join(CLI_ROOT, "scripts", "check-pack.sh"), broken], { encoding: "utf8" });
    assert.equal(bad.status, 1, bad.stdout);
    assert.match(bad.stdout, /manifest ghi 999x/);
    assert.match(bad.stdout, /giấy phép "CC BY-SA 4\.0" không hợp quy tắc/);
  });

  test("ảnh lệch khung (Duy 13/11, SK-043): cảnh báo tên bài, khoá, tỉ lệ ảnh, tỉ lệ khung, gợi ý crop; vẫn build", () => {
    // B (683×1024, dọc 2:3) ở thẻ lựa chọn q1 (Discoverer A2, khung 5:2): lệch ×3,75 > max_factor 2,2.
    // B làm hình câu hỏi w2 (khung 4:3): lệch ×2, không báo. A (1024×768) ở kệ Chơi và nhóm Học (1:1): lệch ×1,33, không báo.
    writeSelection({ "tray.tray_rice": PICK_A, "learn.explore.explore_carb": PICK_A, w2: PICK_B, "q1.q1_rice": PICK_B });
    const run = build(path.join(root, "pack-shape"));
    assert.equal(run.status, 0, run.stderr);
    assert.match(run.stdout, /ảnh lệch khung \(tỉ lệ ảnh khác chỗ dùng, tools\/content-cli\/image-slots\.json\): 1 hình · an-uong-lanh-manh 1/);
    const lines = run.stdout.split("\n").filter((line) => line.includes("lệch ×"));
    assert.equal(lines.length, 1, lines.join("\n"));
    assert.match(lines[0]!, /bài 01-thuc-an-cho-ta-nhung-gi · hình q1\.q1_rice \(thẻ lựa chọn \(\d lựa chọn\)\): ảnh 683×1024 dọc 2:3, khung 5:2 ngang; lệch ×3,75/);
    // Centred 5:2 band of the picture, inside B's own crop (left half of the source).
    assert.match(lines[0]!, /Đặt "crop" trong .*thuc-an-cho-ta-nhung-gi\.json mục q1\.q1_rice \(gợi ý cắt giữa \{"left":0,"top":0\.36[67],"width":0\.5,"height":0\.26[67]\}/);
  });

  test("--require-assets: mỗi Image chưa có ảnh là một lỗi, không ghi gói", () => {
    writeSelection({ "tray.tray_rice": PICK_A });
    const out = path.join(root, "pack-require");
    const run = build(out, "--require-assets");
    assert.equal(run.status, 1);
    const total = locateCommon("lesson", readJsonFile(ws.files[1]!), "Image").length;
    assert.equal(run.stderr.split("\n").filter((line) => line.includes("chưa có ảnh (--require-assets)")).length, total - 1);
    assert.match(run.stderr, /lesson\.json|01-thuc-an-cho-ta-nhung-gi\.json/);
    assert.equal(existsSync(out), false);
  });

  test("ảnh đã chọn mà chưa fetch, hoặc file chọn ảnh đổi credit sau fetch: exit 1, nhắc images fetch", () => {
    writeSelection({ "tray.tray_rice": { ...PICK_A, file_url: "https://upload.wikimedia.org/wikipedia/commons/a/a1/Other.jpg" } });
    let run = build(path.join(root, "pack-unfetched"));
    assert.equal(run.status, 1);
    assert.match(run.stderr, /\/play\/items\/0\/image hình tray\.tray_rice: ảnh đã chọn trong .* chưa có trong .*image-cache\. Chạy content-cli images fetch/);
    writeSelection({ "tray.tray_rice": { ...PICK_A, author: "Someone Else" } });
    run = build(path.join(root, "pack-changed"));
    assert.equal(run.status, 1);
    assert.match(run.stderr, /đổi nguồn hoặc giấy phép sau lần fetch trước; chạy lại content-cli images fetch/);
  });

  test("same_as sang bài khác (lesson): dùng ảnh đã chọn của bài kia; trỏ sai thì lỗi", () => {
    writeSelection({ "q4.q4_tofu": PICK_B }, selectionFileFor(selectionDir, "discoverer", "an-uong-lanh-manh", "mam-com-can-bang"));
    writeSelection({ "q5.q5_tofu": { same_as: "q4_tofu", lesson: "an-uong-lanh-manh/02-mam-com-can-bang" } });
    const out = path.join(root, "pack-cross");
    const run = build(out);
    assert.equal(run.status, 0, run.stderr);
    const manifest = readJsonFile(path.join(out, "catalog/v1/manifest.json"));
    const pack = JSON.parse(readFileSync(path.join(out, manifest.topics[0].path), "utf8")).lessons[0];
    assert.equal(pack.quiz[4].options[4].image.asset, sha256Of.get(PICK_B.file_url));
    writeSelection({ "q5.q5_tofu": { same_as: "q9_none", lesson: "an-uong-lanh-manh/mam-com-can-bang" } });
    const bad = build(path.join(root, "pack-cross-bad"));
    assert.equal(bad.status, 1);
    assert.match(bad.stderr, /hình q5\.q5_tofu: .* không có khoá "q9_none"/);
  });

  test("khoá lạ trong file chọn ảnh: cảnh báo, vẫn build; file chọn ảnh sai schema: lỗi có pointer", () => {
    writeSelection({ "tray.tray_rice": PICK_A, "q9.q9_gone": PICK_A });
    const run = build(path.join(root, "pack-orphan"));
    assert.equal(run.status, 0, run.stderr);
    assert.match(run.stdout, /\/images\/q9\.q9_gone: .* không có hình nào mang khoá này/);
    writeSelection({ "tray.tray_rice": { ...PICK_A, license: "CC BY-NC 2.0" } });
    const bad = build(path.join(root, "pack-bad-selection"));
    assert.equal(bad.status, 1);
    assert.match(bad.stderr, /thuc-an-cho-ta-nhung-gi\.json \/images\/tray\.tray_rice\/license /);
  });

  test("hình ghép (dev 10/11): fetch xử lý file ghép không gọi mạng; manifest credit có parts, giấy phép chặt nhất; check-pack.sh kiểm parts", async () => {
    const composedFile = path.join(selectionDir, "composed", "an-uong-lanh-manh", "rice-plant.jpg");
    const selection = (title = "Rice and young plant") => ({
      "tray.tray_rice": PICK_A,
      w2: PICK_B,
      "learn.explore.explore_carb": { composed: { file: "content/images/composed/an-uong-lanh-manh/rice-plant.jpg", parts: [{ same_as: "tray_rice" }, PICK_B] }, title },
      "q1.q1_rice": { same_as: "learn.explore.explore_carb" },
    });
    writeSelection(selection());

    // No composed file yet: placeholder + warning; --require-assets: error.
    let run = build(path.join(root, "pack-composed-waiting"));
    assert.equal(run.status, 0, run.stderr);
    assert.match(run.stdout, /hình ghép chưa có file: .*rice-plant\.jpg \(.*thuc-an-cho-ta-nhung-gi\.json learn\.explore\.explore_carb\); app vẽ hình giữ chỗ/);
    run = build(path.join(root, "pack-composed-required"), "--require-assets");
    assert.equal(run.status, 1);
    assert.match(run.stderr, /\/learn\/0\/groups\/0\/image hình learn\.explore\.explore_carb chưa có ảnh \(--require-assets\): hình ghép .*rice-plant\.jpg chưa có/);

    // The designer saves the file; fetch: both parts are in the cache (no network), the file is processed.
    mkdirSync(path.dirname(composedFile), { recursive: true });
    writeFileSync(composedFile, await sharp({ create: { width: 900, height: 600, channels: 3, background: "#c0a060" } }).jpeg().toBuffer());
    const fetchOnce = async () => {
      const log = mock.method(console, "log", () => {});
      try {
        return await runImagesFetch({
          inputs: [LESSON_SELECTION()],
          cacheDir: imageCacheDir,
          force: false,
          http: async (url) => {
            throw new Error(`không được gọi mạng: ${url}`);
          },
          sleep: async () => {},
          quotaFile: path.join(root, "quota.json"),
          display: (file) => file,
        });
      } finally {
        log.mock.restore();
      }
    };
    assert.equal(await fetchOnce(), 0);

    const out = path.join(root, "pack-composed");
    run = build(out);
    assert.equal(run.status, 0, run.stderr);
    assert.match(run.stdout, /Hình: 3 file ảnh \(1 hình ghép\) cho 4 Image/);
    const manifest = readJsonFile(path.join(out, "catalog/v1/manifest.json"));
    const composed = manifest.assets.find((asset: { credit?: { source: string } }) => asset.credit?.source === "composed");
    assert.deepEqual(Object.keys(composed.credit), ["title", "author", "license", "license_url", "source", "changes", "parts"]);
    assert.deepEqual(composed.credit, {
      title: "Rice and young plant",
      author: "Science Kids",
      license: "CC BY 4.0",
      license_url: PICK_A.license_url,
      source: "composed",
      changes: ["composed"],
      parts: [creditOf(PICK_A), creditOf(PICK_B)],
    });
    assert.deepEqual([composed.width, composed.height], [900, 600]);
    const pack = JSON.parse(readFileSync(path.join(out, manifest.topics[0].path), "utf8")).lessons[0];
    assert.equal(pack.learn[0].groups[0].image.asset, composed.sha256);
    assert.equal(pack.quiz[0].options[1].image.asset, composed.sha256, "same_as tới hình ghép");
    assert.equal(pack.play.items[0].image.asset, sha256Of.get(PICK_A.file_url));
    const check = spawnSync("sh", [path.join(CLI_ROOT, "scripts", "check-pack.sh"), out], { encoding: "utf8" });
    assert.equal(check.status, 0, check.stdout + check.stderr);
    assert.match(check.stdout, /ảnh: 3 file kiểm JPEG, metadata, kích thước, credit, giấy phép \(1 hình ghép, kiểm cả parts\) · lỗi: 0/);

    // check-pack catches a composed credit that lies.
    const broken = (name: string, edit: (credit: any) => void) => {
      const dir = path.join(root, `pack-composed-${name}`);
      cpSync(out, dir, { recursive: true });
      const brokenManifest = readJsonFile(path.join(dir, "catalog/v1/manifest.json"));
      edit(brokenManifest.assets.find((asset: { credit?: { source: string } }) => asset.credit?.source === "composed").credit);
      writeFileSync(path.join(dir, "catalog/v1/manifest.json"), JSON.stringify(brokenManifest, null, 2));
      return spawnSync("sh", [path.join(CLI_ROOT, "scripts", "check-pack.sh"), dir], { encoding: "utf8" });
    };
    const cases: [string, (credit: any) => void, RegExp][] = [
      ["cc0", (credit) => ((credit.license = "CC0 1.0"), (credit.license_url = PICK_B.license_url)), /có part CC BY mà giấy phép hình ghép là "CC0 1\.0" \(phải là CC BY\)/],
      ["part-sa", (credit) => (credit.parts[1].license = "CC BY-SA 4.0"), /part "Young plant": giấy phép "CC BY-SA 4\.0" không hợp quy tắc/],
      ["part-http", (credit) => (credit.parts[0].source_url = "http://example.org/x"), /part "Bowl of rice": URL không phải https/],
      ["part-missing", (credit) => delete credit.parts[0].author, /part "Bowl of rice" thiếu trường/],
      ["no-parts", (credit) => (credit.parts = []), /hình ghép không có parts/],
      ["no-composed", (credit) => (credit.changes = ["resized"]), /changes của hình ghép thiếu "composed"/],
      ["nested", (credit) => (credit.parts[0].source = "composed"), /part "Bowl of rice" lại là hình ghép/],
    ];
    for (const [name, edit, expected] of cases) {
      const bad = broken(name, edit);
      assert.equal(bad.status, 1, `${name}\n${bad.stdout}`);
      assert.match(bad.stdout, expected, name);
    }

    // A new title in the selection file, or a file edited after fetch: build asks for fetch again.
    writeSelection(selection("Another title"));
    run = build(path.join(root, "pack-composed-title"));
    assert.equal(run.status, 1);
    assert.match(run.stderr, /hình learn\.explore\.explore_carb: .* đổi title hoặc ảnh thành phần của hình ghép sau lần fetch trước; chạy lại content-cli images fetch/);
    writeSelection(selection());
    writeFileSync(composedFile, await sharp({ create: { width: 900, height: 600, channels: 3, background: "#30a0c0" } }).jpeg().toBuffer());
    run = build(path.join(root, "pack-composed-edited"));
    assert.equal(run.status, 1);
    assert.match(run.stderr, /hình learn\.explore\.explore_carb: hình ghép .*rice-plant\.jpg \(mới hoặc đã sửa\) chưa có trong .*image-cache\. Chạy content-cli images fetch/);
    rmSync(path.join(selectionDir, "composed"), { recursive: true, force: true });
  });

  test("hình tự vẽ (dev 10/11): manifest credit Science Kids + changes drawn; same_as và phần của hình ghép; check-pack.sh nhận nguồn Science Kids và bắt credit sai", async () => {
    const own = (name: string) => path.join(selectionDir, "own", "an-uong-lanh-manh", name);
    const composed = (name: string) => path.join(selectionDir, "composed", "an-uong-lanh-manh", name);
    const selection = (title = "Bread roll drawing") => ({
      "tray.tray_bread": { own: { file: "content/images/own/an-uong-lanh-manh/bread.jpg", method: "drawn" }, title, note: "designer vẽ 10/11" },
      "q1.q1_rice": { same_as: "tray_bread" },
      "tray.tray_rice": PICK_A,
      "learn.explore.explore_carb": { composed: { file: "content/images/composed/an-uong-lanh-manh/bread-rice.jpg", parts: [{ same_as: "tray_bread" }, { same_as: "tray_rice" }] }, title: "Bread and rice" },
      w2: { composed: { file: "content/images/composed/an-uong-lanh-manh/bread-only.jpg", parts: [{ same_as: "tray_bread" }] }, title: "Bread on a plate" },
    });
    writeSelection(selection());
    const fetchOnce = async () => {
      const lines: string[] = [];
      const log = mock.method(console, "log", (...args: unknown[]) => lines.push(args.join(" ")));
      try {
        const code = await runImagesFetch({
          inputs: [LESSON_SELECTION()],
          cacheDir: imageCacheDir,
          force: false,
          http: async (url) => {
            throw new Error(`không được gọi mạng: ${url}`);
          },
          sleep: async () => {},
          quotaFile: path.join(root, "quota.json"),
          display: (file) => file,
        });
        return { code, out: lines.join("\n") };
      } finally {
        log.mock.restore();
      }
    };

    // No drawing yet: build is an error (an own entry says the picture is made), not a placeholder.
    let run = build(path.join(root, "pack-own-missing"));
    assert.equal(run.status, 1);
    assert.match(run.stderr, /\/play\/items\/1\/image hình tray\.tray_bread: hình tự vẽ .*own\/an-uong-lanh-manh\/bread\.jpg chưa có \(.*thuc-an-cho-ta-nhung-gi\.json tray\.tray_bread\); designer vẽ, xuất JPEG/);

    mkdirSync(path.dirname(own("bread.jpg")), { recursive: true });
    mkdirSync(path.dirname(composed("x")), { recursive: true });
    writeFileSync(own("bread.jpg"), await sharp({ create: { width: 800, height: 800, channels: 3, background: "#e0b060" } }).jpeg().toBuffer());
    writeFileSync(composed("bread-rice.jpg"), await sharp({ create: { width: 1000, height: 500, channels: 3, background: "#a07040" } }).jpeg().toBuffer());
    writeFileSync(composed("bread-only.jpg"), await sharp({ create: { width: 600, height: 400, channels: 3, background: "#f0d0a0" } }).jpeg().toBuffer());
    // Drawn but not fetched yet: error, asks for fetch.
    run = build(path.join(root, "pack-own-unfetched"));
    assert.equal(run.status, 1);
    assert.match(run.stderr, /hình tray\.tray_bread: hình tự vẽ .*bread\.jpg \(mới hoặc đã sửa\) chưa có trong .*image-cache\. Chạy content-cli images fetch/);
    const fetched = await fetchOnce();
    assert.equal(fetched.code, 0, fetched.out);
    assert.match(fetched.out, /Hình tự vẽ: 1 · 1 xử lý mới · 0 đã có/);
    assert.match(fetched.out, /Hình ghép: 2 · 2 xử lý mới · 0 đã có · 0 chờ ghép/);

    const out = path.join(root, "pack-own");
    run = build(out);
    assert.equal(run.status, 0, run.stderr);
    assert.match(run.stdout, /Hình: 4 file ảnh \(2 hình ghép, 1 hình tự vẽ\) cho 5 Image/);
    const manifest = readJsonFile(path.join(out, "catalog/v1/manifest.json"));
    const images = manifest.assets.filter((asset: { kind: string }) => asset.kind === "image");
    const drawn = images.find((asset: { credit: { source: string } }) => asset.credit.source === "Science Kids");
    assert.deepEqual(Object.keys(drawn), ["sha256", "size", "kind", "path", "width", "height", "credit"]);
    assert.deepEqual(Object.keys(drawn.credit), ["title", "author", "license", "license_url", "source", "changes"]);
    assert.deepEqual(drawn.credit, { title: "Bread roll drawing", author: "Science Kids", license: "Science Kids", license_url: "", source: "Science Kids", changes: ["drawn"] });
    assert.deepEqual([drawn.width, drawn.height], [800, 800]);
    const carb = images.find((asset: { credit: { title: string } }) => asset.credit.title === "Bread and rice");
    assert.deepEqual(carb.credit, {
      title: "Bread and rice",
      author: "Science Kids",
      license: "CC BY 4.0",
      license_url: PICK_A.license_url,
      source: "composed",
      changes: ["composed"],
      parts: [ownCredit("Bread roll drawing"), creditOf(PICK_A)],
    });
    assert.deepEqual(Object.keys(carb.credit.parts[0]), ["title", "author", "license", "license_url", "source"]);
    const plate = images.find((asset: { credit: { title: string } }) => asset.credit.title === "Bread on a plate");
    assert.deepEqual([plate.credit.license, plate.credit.license_url, plate.credit.parts], ["Science Kids", "", [ownCredit("Bread roll drawing")]]);
    const pack = JSON.parse(readFileSync(path.join(out, manifest.topics[0].path), "utf8")).lessons[0];
    assert.equal(pack.play.items[1].image.asset, drawn.sha256);
    assert.equal(pack.quiz[0].options[1].image.asset, drawn.sha256, "same_as tới hình tự vẽ");
    assert.equal(pack.learn[0].groups[0].image.asset, carb.sha256);
    assert.equal(pack.warmup[1].image.asset, plate.sha256);
    const check = spawnSync("sh", [path.join(CLI_ROOT, "scripts", "check-pack.sh"), out], { encoding: "utf8" });
    assert.equal(check.status, 0, check.stdout + check.stderr);
    assert.match(check.stdout, /ảnh: 4 file kiểm JPEG, metadata, kích thước, credit, giấy phép \(2 hình ghép, kiểm cả parts; 1 hình tự vẽ\) · lỗi: 0/);

    // check-pack catches an own credit (or an own part) that lies.
    const broken = (name: string, title: string, edit: (credit: any) => void) => {
      const dir = path.join(root, `pack-own-${name}`);
      cpSync(out, dir, { recursive: true });
      const brokenManifest = readJsonFile(path.join(dir, "catalog/v1/manifest.json"));
      edit(brokenManifest.assets.find((asset: { credit?: { title: string } }) => asset.credit?.title === title).credit);
      writeFileSync(path.join(dir, "catalog/v1/manifest.json"), JSON.stringify(brokenManifest, null, 2));
      return spawnSync("sh", [path.join(CLI_ROOT, "scripts", "check-pack.sh"), dir], { encoding: "utf8" });
    };
    const cases: [string, string, (credit: any) => void, RegExp][] = [
      ["author", "Bread roll drawing", (credit) => (credit.author = "Someone"), /hình tự vẽ phải có author và license "Science Kids"/],
      ["license", "Bread roll drawing", (credit) => (credit.license = "CC0 1.0"), /hình tự vẽ phải có author và license "Science Kids"/],
      ["url", "Bread roll drawing", (credit) => (credit.license_url = "https://example.org/"), /hình tự vẽ không có license_url hay source_url/],
      ["changes", "Bread roll drawing", (credit) => (credit.changes = ["resized"]), /changes của hình tự vẽ thiếu cách làm \(drawn\)/],
      ["parts", "Bread roll drawing", (credit) => (credit.parts = []), /hình tự vẽ không có parts/],
      ["title", "Bread roll drawing", (credit) => (credit.title = ""), /credit hình tự vẽ thiếu title/],
      ["part-url", "Bread and rice", (credit) => (credit.parts[0].source_url = "https://example.org/"), /part tự vẽ "Bread roll drawing": cần title, author và license "Science Kids", không URL/],
      ["plate-cc0", "Bread on a plate", (credit) => ((credit.license = "CC0 1.0"), (credit.license_url = PICK_B.license_url)), /có part tự vẽ, không part CC BY mà giấy phép hình ghép là "CC0 1\.0" \(phải là "Science Kids", license_url trống\)/],
      ["carb-own", "Bread and rice", (credit) => ((credit.license = "Science Kids"), (credit.license_url = "")), /có part CC BY mà giấy phép hình ghép là "Science Kids" \(phải là CC BY\)/],
    ];
    for (const [name, title, edit, expected] of cases) {
      const bad = broken(name, title, edit);
      assert.equal(bad.status, 1, `${name}\n${bad.stdout}`);
      assert.match(bad.stdout, expected, name);
    }

    // A new title, or the drawing edited after fetch: build asks for fetch again.
    writeSelection(selection("Another title"));
    run = build(path.join(root, "pack-own-title"));
    assert.equal(run.status, 1);
    assert.match(run.stderr, /hình tray\.tray_bread: .* đổi title hoặc method của hình tự vẽ sau lần fetch trước; chạy lại content-cli images fetch/);
    writeSelection(selection());
    writeFileSync(own("bread.jpg"), await sharp({ create: { width: 800, height: 800, channels: 3, background: "#3060c0" } }).jpeg().toBuffer());
    run = build(path.join(root, "pack-own-edited"));
    assert.equal(run.status, 1);
    assert.match(run.stderr, /hình tray\.tray_bread: hình tự vẽ .*bread\.jpg \(mới hoặc đã sửa\) chưa có trong/);
    rmSync(path.join(selectionDir, "own"), { recursive: true, force: true });
    rmSync(path.join(selectionDir, "composed"), { recursive: true, force: true });
  });

  test("ảnh trong cache bị sửa: exit 1, sha256 khác index.json", () => {
    const copy = path.join(root, "image-cache-tampered");
    cpSync(imageCacheDir, copy, { recursive: true });
    const file = path.join(copy, `${sha256Of.get(PICK_A.file_url)}.jpg`);
    const bytes = readFileSync(file);
    bytes[bytes.length - 3] = bytes[bytes.length - 3]! ^ 0xff;
    writeFileSync(file, bytes);
    writeSelection({ "tray.tray_rice": PICK_A });
    const run = runCli(...ws.files, "--out", path.join(root, "pack-tampered"), "--cache", ws.cacheDir, "--images", selectionDir, "--image-cache", copy);
    assert.equal(run.status, 1);
    assert.match(run.stderr, /index\.json ghi .*xoá file đó rồi chạy lại images fetch --force/);
  });
});
