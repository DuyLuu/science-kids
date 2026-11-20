// `content-cli ui-voice build` (SK-059): one clip per key and language of content/ui-voice/strings.json,
// made exactly like the clips of a lesson (`tts`: same normaliser, engine, voice, loudness pass, m4a
// encoding, cache key and cache content/.audio, VI self-check and seed variants), then copied to a flat
// folder the iOS app embeds (`<key>.<lang>.m4a` + manifest.json). A clip whose sentence already exists
// in a lesson is reused from the cache, not generated again.
import { copyFileSync, existsSync, mkdirSync, mkdtempSync, readdirSync, readFileSync, rmSync, statSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import { durationMs, M4A_ENCODING_ZERO_TIMES, requireTool, sha256Bytes, sha256OfFile } from "../audio.ts";
import { postSpec } from "../audio-post.ts";
import { AudioCache, cacheKey } from "../cache.ts";
import { normalizeEn, type Normalized } from "../normalize/en.ts";
import { DEFAULT_VI_NUMBER_STYLE } from "../normalize/numbers-vi.ts";
import { normalizeVi } from "../normalize/vi.ts";
import { REPO_ROOT } from "../paths.ts";
import type { Lang } from "../spoken.ts";
import { checkAndRetry, checkFromEntry, entryFor, render, type Clip } from "../tts/command.ts";
import type { EngineSpec } from "../tts/engine.ts";
import { kokoroEn } from "../tts/kokoro-en.ts";
import { DEFAULT_DTYPE } from "../tts/kokoro-model.ts";
import { writeReview, type ReviewItem } from "../tts/review.ts";
import { FLAG_LABELS } from "../tts/self-check.ts";
import { blankStrategy } from "../tts/utterance.ts";
import { engineFingerprint, VariantTable } from "../tts/variants.ts";
import { vieneuVi } from "../tts/vieneu-vi.ts";
import { buildManifest, clipFileName, parseUiVoiceSource, replaceableOut, type UiVoiceString } from "./source.ts";

/** Source of the interface sentences (edited by content-editor). */
export const DEFAULT_UI_VOICE_SOURCE = path.join(REPO_ROOT, "content", "ui-voice", "strings.json");
/** Output the iOS app embeds as `ui-voice/` (gitignored, like the pack). */
export const DEFAULT_UI_VOICE_OUT = path.join(REPO_ROOT, "content", ".build", "ui-voice");
/** Listening files (review-ui-voice-en.m4a, review-ui-voice-vi.m4a + .txt). */
export const DEFAULT_UI_VOICE_REVIEW_DIR = path.join(REPO_ROOT, "content", ".build", "tts", "ui-voice");

export type UiVoiceOptions = {
  source: string;
  out: string;
  cacheDir: string;
  langs: Lang[];
  force: boolean;
  review: boolean;
  reviewDir: string;
  /** VI: Whisper self-check of new clips, other seeds for flagged ones (same as `tts --lang vi`). */
  selfCheck: boolean;
  display: (target: string) => string;
};

type LangResult = { engine: EngineSpec; byKey: Map<string, Clip>; clips: Clip[] };

export async function runUiVoiceBuild(options: UiVoiceOptions): Promise<number> {
  const log = (line: string) => process.stderr.write(`${line}\n`);
  const source = path.resolve(options.source);
  if (!existsSync(source) || !statSync(source).isFile()) {
    console.error(`${options.display(source)}: không tìm thấy file`);
    return 1;
  }
  const sourceText = readFileSync(source, "utf8");
  const { strings, problems } = parseUiVoiceSource(sourceText);
  if (problems.length > 0) {
    for (const problem of problems) console.error(`${options.display(source)} ${problem.pointer || "/"} ${problem.message}`);
    console.error(`\nFile nguồn chưa hợp lệ (${problems.length} lỗi).`);
    return 1;
  }

  const out = path.resolve(options.out);
  if (existsSync(out)) {
    const manifestPath = path.join(out, "manifest.json");
    if (!statSync(out).isDirectory() || !replaceableOut(readdirSync(out), existsSync(manifestPath) ? readFileSync(manifestPath, "utf8") : undefined)) {
      console.error(`--out ${options.display(out)} không trống và không phải thư mục ui-voice build trước đó: lệnh không xoá.`);
      return 2;
    }
  }

  const results = new Map<Lang, LangResult>();
  for (const lang of options.langs) {
    const result = await makeClips(lang, strings, options, log);
    if (typeof result === "number") return result;
    results.set(lang, result);
  }

  // Output: replace the folder, copy each clip under its bundle name, check the bytes, write the manifest.
  rmSync(out, { recursive: true, force: true });
  mkdirSync(out, { recursive: true });
  const manifestClips: Parameters<typeof buildManifest>[0]["clips"] = [];
  const cacheDir = path.resolve(options.cacheDir);
  for (const string of strings) {
    for (const [lang, result] of results) {
      const clip = result.byKey.get(string.key)!;
      const target = path.join(out, clipFileName(string.key, lang));
      copyFileSync(path.join(cacheDir, clip.entry!.file), target);
      const sha256 = sha256OfFile(target);
      if (sha256 !== clip.entry!.sha256) {
        console.error(`${options.display(target)}: sha256 ${sha256} khác index.json (${clip.entry!.sha256}); chạy lại với --force.`);
        return 1;
      }
      manifestClips.push({
        key: string.key,
        lang,
        clip: { sha256, bytes: clip.entry!.bytes, duration_ms: clip.entry!.duration_ms, text: string[lang], read: clip.text },
      });
    }
  }
  const manifest = buildManifest({
    source: path.relative(REPO_ROOT, source).split(path.sep).join("/"),
    sourceSha256: sha256Bytes(sourceText),
    engines: Object.fromEntries([...results].map(([lang, result]) => [lang, result.engine.label])),
    clips: manifestClips,
  });
  writeFileSync(path.join(out, "manifest.json"), `${JSON.stringify(manifest, null, 2)}\n`);

  // Listening files, one per language (EN 24 kHz and VI 48 kHz cannot share one file).
  const reviews: string[] = [];
  const reviewWarnings: string[] = [];
  if (options.review) {
    for (const [lang, result] of results) {
      const items: ReviewItem[] = strings.map((string) => {
        const clip = result.byKey.get(string.key)!;
        const flags = clip.check?.flags ?? [];
        return {
          group: "sentence",
          role: flags.length ? `⚑ ${flags.map((flag) => FLAG_LABELS[flag] ?? flag).join("; ")}` : "câu",
          file: path.basename(source),
          pointer: string.key,
          en: string[lang],
          read: clip.text,
          clip: path.join(cacheDir, clip.entry!.file),
          duration_ms: clip.entry!.duration_ms,
          ...(flags.length ? { note: `máy nghe: ${clip.check!.hyp.map((h) => `"${h}"`).join(" / ")}` } : {}),
        };
      });
      try {
        const review = await writeReview({
          dir: path.resolve(options.reviewDir),
          name: `review-ui-voice-${lang}`,
          title: `chữ giao diện có giọng (${path.basename(source)})`,
          engineLabel: result.engine.label,
          items,
          sourceLabel: `chữ ${lang.toUpperCase()}`,
          summary: `${items.length} câu theo thứ tự trong file nguồn`,
        });
        reviews.push(`Nghe thử: ${options.display(review.m4a)} (${items.length} clip, ${(review.duration_ms / 1000).toFixed(1).replace(".", ",")} s) + ${path.basename(review.txt)}`);
      } catch (error) {
        reviewWarnings.push(`file nghe thử ${lang}: ${(error as Error).message}`);
      }
    }
  }

  const all = [...results.values()].flatMap((result) => result.clips);
  const flagged = all.filter((clip) => (clip.check?.flags.length ?? 0) > 0);
  console.log(
    [
      "",
      `ui-voice · ${strings.length} key × ${options.langs.join(", ")} = ${manifestClips.length} clip`,
      ...[...results].map(([lang, result]) => `  ${lang}: ${result.engine.label} · sinh mới ${result.clips.filter((c) => c.status === "generated").length} · dùng lại ${result.clips.filter((c) => c.status !== "generated").length}`),
      ...flagged.map((clip) => `  ⚑ ${JSON.stringify(clip.text)}: ${clip.check!.flags.map((f) => FLAG_LABELS[f] ?? f).join("; ")} · máy nghe: ${clip.check!.hyp.map((h) => JSON.stringify(h)).join(" / ")}`),
      `Đầu ra: ${options.display(out)} (manifest.json + ${manifestClips.length} file .m4a)`,
      ...reviews,
      ...reviewWarnings.map((warning) => `Cảnh báo nghe thử: ${warning}`),
    ].join("\n"),
  );
  return 0;
}

/** Steps 2–4 of `tts` for a list of sentences of one language: normalise, cache key, reuse or generate, VI self-check. */
async function makeClips(lang: Lang, strings: UiVoiceString[], options: UiVoiceOptions, log: (line: string) => void): Promise<LangResult | number> {
  const normalize: (text: string) => Normalized =
    lang === "en" ? normalizeEn : (text) => normalizeVi(text, { numbers: DEFAULT_VI_NUMBER_STYLE, toneStyle: "new" });
  const hasLetters = lang === "en" ? /[A-Za-z]/ : /\p{L}/u;
  const engine: EngineSpec = lang === "en" ? kokoroEn({ dtype: DEFAULT_DTYPE }) : vieneuVi();
  const encoding = M4A_ENCODING_ZERO_TIMES;
  const blank = blankStrategy(engine.blankPauseMs);
  const fingerprint = engineFingerprint(engine.descriptor);
  const variants = lang === "vi" ? new VariantTable() : undefined;
  const post = postSpec(lang);
  const keyOf = (text: string, variant: number) => cacheKey({ lang, text, engine: engine.descriptor, blank, encoding, post, variant });

  const byKey = new Map<string, Clip>();
  const clips = new Map<string, Clip>();
  for (const string of strings) {
    const result = normalize(string[lang]);
    for (const warning of result.warnings) log(`${string.key} ${lang} [${warning.code}] ${warning.message} · "${string[lang]}"`);
    if (!hasLetters.test(result.text)) {
      console.error(`${string.key} ${lang}: không còn chữ nào để đọc sau chuẩn hoá ("${string[lang]}")`);
      return 1;
    }
    const chosen = variants?.get(fingerprint, result.text);
    const variant = chosen?.variant ?? 0;
    const key = keyOf(result.text, variant);
    const clip = clips.get(key) ?? { key, text: result.text, uses: [], variant, fromTable: chosen !== undefined };
    clips.set(key, clip);
    byKey.set(string.key, clip);
  }

  const cache = new AudioCache(path.resolve(options.cacheDir));
  const todo: Clip[] = [];
  for (const clip of clips.values()) {
    const entry = options.force ? undefined : cache.usable(clip.key);
    if (entry) {
      clip.status = "reused";
      clip.entry = entry;
      clip.retried = entry.retried;
      clip.post = entry.post;
      if (entry.check) clip.check = checkFromEntry(clip.key, entry.check);
      continue;
    }
    const file = cache.clipPath(lang, clip.key);
    if (!options.force && existsSync(file) && !cache.has(clip.key)) {
      const bytes = readFileSync(file);
      clip.entry = entryFor(clip, file, bytes, await durationMs(file), statSync(file).mtime, engine, cache.dir, lang);
      clip.status = "recovered";
      cache.put(clip.key, clip.entry);
      continue;
    }
    todo.push(clip);
  }

  if (todo.length > 0) {
    await requireTool("afconvert", ["-h"], "cần macOS (afconvert có sẵn trong hệ điều hành)");
    await requireTool("afinfo", ["-h"], "cần macOS (afinfo có sẵn trong hệ điều hành)");
    const work = mkdtempSync(path.join(tmpdir(), "content-cli-ui-voice-"));
    try {
      const synthesizer = await engine.load(log);
      log(`Sinh ${todo.length} clip ${lang} (${engine.label})`);
      try {
        for (const [index, clip] of todo.entries()) {
          const file = cache.clipPath(lang, clip.key);
          const made = await render(synthesizer, engine, post, clip.text, clip.variant, file, work, true);
          clip.retried = made.retried;
          clip.post = made.post;
          clip.entry = entryFor(clip, file, made.bytes, made.duration, new Date(), engine, cache.dir, lang, made.seeds);
          clip.status = "generated";
          cache.put(clip.key, clip.entry);
          cache.save();
          log(`  [${index + 1}/${todo.length}] ${(made.duration / 1000).toFixed(1)} s  ${JSON.stringify(clip.text)}${clip.variant ? ` (biến thể ${clip.variant})` : ""}`);
        }
        if (lang === "vi" && options.selfCheck) {
          await checkAndRetry({
            todo,
            forced: [],
            pool: [...clips.values()],
            post,
            synthesizer,
            engine,
            cache,
            work,
            keyOf,
            variants: variants!,
            fingerprint,
            maxVariants: 4,
            passes: 2,
            log,
          });
        }
      } finally {
        await synthesizer.dispose();
      }
    } finally {
      rmSync(work, { recursive: true, force: true });
    }
  }
  cache.save();
  variants?.save();
  return { engine, byKey, clips: [...clips.values()] };
}
