// `content-cli tts`: every Spoken `<lang>` of the given topic/lesson JSON -> one m4a clip per
// distinct normalised string (cached by key), audio.<lang> = sha256 of the clip bytes in a copy of
// each file. EN = Kokoro (SK-014). VI = VieNeu-TTS + self-check with seed variants (SK-024).
import { copyFileSync, existsSync, mkdirSync, mkdtempSync, readFileSync, renameSync, rmSync, statSync, writeFileSync } from "node:fs";
import { hostname, tmpdir } from "node:os";
import path from "node:path";
import { performance } from "node:perf_hooks";
import { validateDocuments } from "@science-kids/content-schema/validate";
import { durationMs, encodeM4a, M4A_ENCODING_ZERO_TIMES, requireTool, sha256Bytes, wavFromFloat } from "../audio.ts";
import { CUT_TAIL_DB, postProcess, postSpec, type PostReport, type PostSpec } from "../audio-post.ts";
import { AudioCache, cacheKey, type ClipEntry } from "../cache.ts";
import { displayPointer, getAt } from "../json-pointer.ts";
import { BLANK, normalizeEn, type Normalized, type NormalizeWarning } from "../normalize/en.ts";
import type { ViNumberStyle } from "../normalize/numbers-vi.ts";
import { normalizeVi } from "../normalize/vi.ts";
import { REPO_ROOT } from "../paths.ts";
import { collectSpoken, type ContentKind, type Lang, type SpokenNode } from "../spoken.ts";
import type { EngineSpec, Synthesizer } from "./engine.ts";
import { kokoroEn } from "./kokoro-en.ts";
import type { Dtype } from "./kokoro-model.ts";
import { reviewPointers, vocabPointers, writeReview, type ReviewItem } from "./review.ts";
import { FLAG_LABELS, selfCheck, type CheckJob, type CheckResult } from "./self-check.ts";
import { blankStrategy, speak } from "./utterance.ts";
import { engineFingerprint, VariantTable } from "./variants.ts";
import { vieneuVi } from "./vieneu-vi.ts";

export type TtsOptions = {
  files: string[];
  out: string;
  lang: Lang;
  force: boolean;
  review: boolean;
  cacheDir: string;
  reviewDir: string;
  dtype: Dtype;
  voice: string;
  /** VI: run evaluate.py on new clips and try other seeds for flagged ones. */
  selfCheck: boolean;
  /** VI: how many other seed variants to try per flagged clip. */
  maxVariants: number;
  /** VI: ASR passes per check (different neighbours each pass). */
  checkPasses: number;
  /** VI: texts (source or normalised) whose seed is searched again even if cached and clean (e.g. Duy heard "kẹo" as "keo"). */
  recheck: string[];
  /** VI: "text=variant" chosen by a person (after listening or a deeper check); recorded in variants.json. */
  pinVariants: string[];
  /** VI: self-check every clip of the run, cached ones included (normal runs check only new clips). */
  checkAll: boolean;
  /** VI: "linh"/"lẻ", "nghìn"/"ngàn", "bốn"/"tư". */
  viNumbers: ViNumberStyle;
  /** Paths are printed relative to this. */
  display: (target: string) => string;
};

type Input = { path: string; name: string; display: string; text: string; data: Record<string, unknown> & { kind: ContentKind } };
type Use = { input: Input; pointer: string; node: SpokenNode; source: string; read: string };
type Clip = {
  key: string;
  text: string;
  uses: Use[];
  variant: number;
  /** The variant came from tts-vi/variants.json (chosen by an earlier self-check). */
  fromTable: boolean;
  status?: "generated" | "reused" | "recovered";
  entry?: ClipEntry;
  retried?: boolean;
  /** Loudness / silence post-processing of the kept clip. */
  post?: PostReport;
  check?: CheckResult;
  tried?: number[];
  firstCheck?: CheckResult;
};
type Warning = NormalizeWarning & { file: string; pointer: string; source: string };

/** Generated copies (content/.build/…) may be rewritten in place: `--lang vi` on the output of `--lang en`. */
const BUILD_DIR = path.join(REPO_ROOT, "content", ".build") + path.sep;

const nf = new Intl.NumberFormat("vi-VN");
function seconds(ms: number): string {
  const total = ms / 1000;
  if (total < 60) return `${total.toFixed(1).replace(".", ",")} s`;
  const minutes = Math.floor(total / 60);
  return `${minutes} phút ${(total - minutes * 60).toFixed(1).replace(".", ",")} s`;
}

export async function runTts(options: TtsOptions): Promise<number> {
  const started = performance.now();
  const log = (line: string) => process.stderr.write(`${line}\n`);
  const lang = options.lang;
  const normalize: (text: string) => Normalized =
    lang === "en" ? normalizeEn : (text) => normalizeVi(text, { numbers: options.viNumbers, toneStyle: "new" });
  const hasLetters = lang === "en" ? /[A-Za-z]/ : /\p{L}/u;

  // 1. Read + validate the inputs exactly like packages/content-schema/scripts/validate.mjs.
  const inputs: Input[] = [];
  for (const file of options.files) {
    const absolute = path.resolve(file);
    if (!existsSync(absolute) || !statSync(absolute).isFile()) {
      console.error(`${options.display(absolute)}: không tìm thấy file`);
      return 1;
    }
    const text = readFileSync(absolute, "utf8");
    let data: Input["data"];
    try {
      data = JSON.parse(text);
    } catch (error) {
      console.error(`${options.display(absolute)} / JSON không hợp lệ: ${(error as Error).message}`);
      return 1;
    }
    inputs.push({ path: absolute, name: path.basename(absolute), display: options.display(absolute), text, data });
  }
  const names = new Set<string>();
  for (const input of inputs) {
    if (names.has(input.name)) {
      console.error(`Hai file cùng tên ${input.name}: --out ghi theo tên file nên phải chạy riêng từng chủ đề.`);
      return 2;
    }
    names.add(input.name);
  }
  const outDir = path.resolve(options.out);
  for (const input of inputs) {
    if (path.join(outDir, input.name) === input.path && !input.path.startsWith(BUILD_DIR)) {
      console.error(`--out trỏ vào đúng thư mục của ${input.display}: lệnh không ghi đè file nguồn (chỉ ghi đè bản sao trong content/.build/).`);
      return 2;
    }
  }
  const validation = validateDocuments(inputs.map((input) => ({ file: input.display, text: input.text })));
  if (!validation.ok) {
    for (const error of validation.errors) console.error(`${error.file} ${displayPointer(error.pointer)} ${error.message}`);
    console.error(`\nInput chưa hợp lệ (${validation.errors.length} lỗi). Sửa rồi chạy lại; bài lẻ thì đưa kèm topic.json.`);
    return 1;
  }

  // 2. Spoken strings -> normalised text -> distinct clips.
  const engine: EngineSpec = lang === "en" ? kokoroEn({ dtype: options.dtype, voice: options.voice }) : vieneuVi({ voice: options.voice });
  // Both languages zero the m4a times since the loudness pass of 1/11 (every EN hash changed then
  // anyway): the same PCM always gives the same bytes. M4A_ENCODING stays exported for the tests.
  const encoding = M4A_ENCODING_ZERO_TIMES;
  const blank = blankStrategy(engine.blankPauseMs);
  const fingerprint = engineFingerprint(engine.descriptor);
  const variants = lang === "vi" ? new VariantTable() : undefined;
  const post = postSpec(lang);
  const keyOf = (text: string, variant: number) => cacheKey({ lang, text, engine: engine.descriptor, blank, encoding, post, variant });
  const pins = new Map<string, { variant: number; note: string }>();
  for (const pin of options.pinVariants) {
    const match = pin.normalize("NFC").match(/^(.+)=(\d{1,2})(?::(.*))?$/s);
    if (!match || lang !== "vi") {
      console.error(`--pin-variant "${pin}" không hợp lệ (cần "chữ=số" hoặc "chữ=số:lý do", chỉ cho --lang vi)`);
      return 2;
    }
    pins.set(match[1]!, { variant: Number(match[2]), note: match[3]?.trim() || "chọn tay" });
  }
  const orphans: string[] = [];
  const warnings: Warning[] = [];
  const clips = new Map<string, Clip>();
  const skipped: Use[] = [];
  const spokenPerFile = new Map<Input, number>();
  for (const input of inputs) {
    const refs = collectSpoken(input.data.kind, input.data);
    spokenPerFile.set(input, refs.length);
    for (const { pointer, node } of refs) {
      const source = node[lang];
      const result = normalize(source);
      for (const warning of result.warnings) warnings.push({ ...warning, file: input.display, pointer, source });
      const use: Use = { input, pointer, node, source, read: result.text };
      if (!hasLetters.test(result.text)) {
        warnings.push({ code: "nothing_to_read", message: `không còn chữ nào để đọc, bỏ qua (không có audio.${lang})`, file: input.display, pointer, source });
        skipped.push(use);
        continue;
      }
      const pin = pins.get(result.text) ?? pins.get(source);
      if (pin && variants) {
        const before = variants.get(fingerprint, result.text)?.variant ?? 0;
        if (before !== pin.variant) orphans.push(keyOf(result.text, before));
        variants.set(fingerprint, engine.label, result.text, {
          variant: pin.variant,
          flags_before: [],
          flags_after: [],
          heard: [],
          tried: [pin.variant],
          chosen_at: new Date().toISOString(),
          note: pin.note,
        });
      }
      const chosen = variants?.get(fingerprint, result.text);
      const variant = chosen?.variant ?? 0;
      const key = keyOf(result.text, variant);
      const clip = clips.get(key) ?? { key, text: result.text, uses: [], variant, fromTable: chosen !== undefined };
      clip.uses.push(use);
      clips.set(key, clip);
    }
  }

  for (const [text] of pins) {
    if (![...clips.values()].some((clip) => clip.text === text || clip.uses.some((use) => use.source === text))) {
      console.error(`--pin-variant "${text}": không có chuỗi ${lang} nào như vậy trong input`);
      return 2;
    }
  }

  // 3. Cache lookup.
  const cache = new AudioCache(path.resolve(options.cacheDir));
  for (const key of new Set(orphans)) {
    // The clip a pin replaces: drop it so index.json only lists clips in use.
    const entry = cache.usable(key);
    if (entry && ![...clips.values()].some((clip) => clip.key === key)) {
      rmSync(path.join(cache.dir, entry.file), { force: true });
      cache.remove(key);
    }
  }
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
      // Clip on disk but index.json lost or older: re-read it instead of regenerating.
      const bytes = readFileSync(file);
      clip.entry = entryFor(clip, file, bytes, await durationMs(file), statSync(file).mtime, engine, cache.dir, lang);
      clip.status = "recovered";
      cache.put(clip.key, clip.entry);
      continue;
    }
    todo.push(clip);
  }

  // 4. Generate what is missing (and, for VI, check it and try other seeds where needed).
  const wanted = new Set(options.recheck.map((text) => text.normalize("NFC")));
  const forced = lang === "vi" ? [...clips.values()].filter((clip) => wanted.has(clip.text) || clip.uses.some((use) => wanted.has(use.source))) : [];
  for (const text of wanted) {
    if (!forced.some((clip) => clip.text === text || clip.uses.some((use) => use.source === text))) {
      console.error(`--recheck "${text}": không có chuỗi ${lang} nào như vậy trong input`);
      return 2;
    }
  }
  let loadMs = 0;
  let checkMs = 0;
  let genMs = 0;
  const toCheck = lang === "vi" && options.checkAll ? [...clips.values()] : todo;
  const work = mkdtempSync(path.join(tmpdir(), "content-cli-tts-"));
  try {
    if (todo.length > 0 || forced.length > 0 || (options.checkAll && toCheck.length > 0)) {
      await requireTool("afconvert", ["-h"], "cần macOS (afconvert có sẵn trong hệ điều hành)");
      await requireTool("afinfo", ["-h"], "cần macOS (afinfo có sẵn trong hệ điều hành)");
      const loadStart = performance.now();
      const synthesizer = await engine.load(log);
      loadMs = performance.now() - loadStart;
      log(`Sinh ${todo.length} clip ${lang} (${engine.label}); tải (nếu thiếu) và nạp model ${seconds(loadMs)}`);
      try {
        for (const [index, clip] of todo.entries()) {
          const clipStart = performance.now();
          const file = cache.clipPath(lang, clip.key);
          const made = await render(synthesizer, engine, post, clip.text, clip.variant, file, work, true);
          genMs += performance.now() - clipStart;
          clip.retried = made.retried;
          clip.post = made.post;
          clip.entry = entryFor(clip, file, made.bytes, made.duration, new Date(), engine, cache.dir, lang, made.seeds);
          clip.status = "generated";
          cache.put(clip.key, clip.entry);
          cache.save();
          const took = performance.now() - clipStart;
          log(`  [${String(index + 1).padStart(String(todo.length).length)}/${todo.length}] ${seconds(made.duration).padStart(6)} audio, ${seconds(took).padStart(6)}  ${JSON.stringify(clip.text)}${clip.variant ? ` (biến thể ${clip.variant})` : ""}`);
        }
        if (lang === "vi" && (options.selfCheck || forced.length > 0)) {
          const checkStart = performance.now();
          await checkAndRetry({
            todo: options.selfCheck || options.checkAll ? toCheck : [],
            forced,
            pool: [...clips.values()],
            post,
            synthesizer,
            engine,
            cache,
            work,
            keyOf,
            variants: variants!,
            fingerprint,
            maxVariants: Math.max(options.maxVariants, forced.length ? 1 : 0),
            passes: options.checkPasses,
            log,
          });
          checkMs = performance.now() - checkStart;
        }
      } finally {
        await synthesizer.dispose();
      }
    }
  } finally {
    rmSync(work, { recursive: true, force: true });
  }
  cache.save();
  variants?.save();

  // 5. Output copies with audio.<lang> = sha256 of the clip bytes.
  mkdirSync(outDir, { recursive: true });
  const outputs: { input: Input; file: string; data: Record<string, unknown> }[] = [];
  for (const input of inputs) {
    const copy = structuredClone(input.data);
    for (const clip of clips.values()) {
      for (const use of clip.uses) {
        if (use.input !== input) continue;
        // audio goes last in the Spoken object; the other language's hash is kept as is.
        const node = getAt(copy, use.pointer) as SpokenNode;
        if (node.audio) node.audio[lang] = clip.entry!.sha256;
        else node.audio = { [lang]: clip.entry!.sha256 };
      }
    }
    const file = path.join(outDir, input.name);
    writeFileSync(file, `${JSON.stringify(copy, null, 2)}\n`);
    outputs.push({ input, file, data: copy });
  }
  // Validated under the input's path, so folder-based checks (topic slug = folder name) see the
  // same folder as for the input; errors are printed with the output path.
  const outValidation = validateDocuments(outputs.map((output) => ({ file: output.input.display, data: output.data })));
  if (!outValidation.ok) {
    const outputOf = new Map(outputs.map((output) => [output.input.display, options.display(output.file)]));
    for (const error of outValidation.errors) console.error(`${outputOf.get(error.file) ?? error.file} ${displayPointer(error.pointer)} ${error.message}`);
    console.error("\nJSON đầu ra không hợp lệ: đây là lỗi của content-cli, báo dev.");
    return 1;
  }

  // 6. Review pack (one per lesson in the run). EN: 10 sentences + vocabulary (SK-014).
  //    VI: every distinct clip in lesson order, the ones the self-check flagged first (SK-024).
  const reviews: { m4a: string; txt: string; duration_ms: number; items: number }[] = [];
  const reviewWarnings: string[] = [];
  if (options.review) {
    const clipByUse = new Map<string, Clip>();
    for (const clip of clips.values()) for (const use of clip.uses) clipByUse.set(`${use.input.path}#${use.pointer}`, clip);
    for (const input of inputs.filter((item) => item.data.kind === "lesson")) {
      const order = String(input.data.order).padStart(2, "0");
      const title = (input.data.title as SpokenNode)[lang];
      const item = (clip: Clip, use: Use, role: string, group: ReviewItem["group"]): ReviewItem => ({
        group,
        role,
        file: use.input.name,
        pointer: use.pointer,
        en: use.source,
        read: clip.text,
        clip: path.join(cache.dir, clip.entry!.file),
        duration_ms: clip.entry!.duration_ms,
      });
      let items: ReviewItem[];
      let summary: string | undefined;
      if (lang === "en") {
        const toItem = (group: ReviewItem["group"]) => ({ role, pointer }: { role: string; pointer: string }): ReviewItem | undefined => {
          const clip = clipByUse.get(`${input.path}#${pointer}`);
          if (!clip) {
            reviewWarnings.push(`${input.display}#${pointer}: không có clip, bỏ khỏi file nghe thử`);
            return undefined;
          }
          return item(clip, clip.uses.find((candidate) => candidate.input === input && candidate.pointer === pointer)!, role, group);
        };
        items = [...reviewPointers(input.data).map(toItem("sentence")), ...vocabPointers(input.data).map(toItem("vocab"))].filter((x): x is ReviewItem => x !== undefined);
      } else {
        // Lesson clips in lesson order, then the clips only the other inputs (topic.json) use.
        const inLesson = (clip: Clip) => clip.uses.some((use) => use.input === input);
        const ordered = [...[...clips.values()].filter(inLesson), ...[...clips.values()].filter((clip) => !inLesson(clip))];
        const firstUse = (clip: Clip) => clip.uses.find((use) => use.input === input) ?? clip.uses[0]!;
        const flagged = ordered.filter((clip) => (clip.check?.flags.length ?? 0) > 0);
        const clean = ordered.filter((clip) => !flagged.includes(clip));
        items = [
          ...flagged.map((clip) => ({
            ...item(clip, firstUse(clip), `⚑ ${clip.check!.flags.map((f) => FLAG_LABELS[f] ?? f).join("; ")}`, "sentence"),
            note: `máy nghe: ${clip.check!.hyp.map((h) => `"${h}"`).join(" / ")}${clip.variant ? ` · biến thể seed ${clip.variant}` : ""}`,
          })),
          ...clean.map((clip) => item(clip, firstUse(clip), clip.check ? "" : "(không tự kiểm lần này)", "sentence")),
        ];
        summary = `${flagged.length} clip bị đánh dấu ở đầu, rồi ${clean.length} clip theo thứ tự trong bài`;
      }
      try {
        const review = await writeReview({
          dir: path.resolve(options.reviewDir),
          name: lang === "en" ? `review-${order}` : `review-${order}-${lang}`,
          title: `bài ${order} "${title}" (${input.name})`,
          engineLabel: engine.label,
          items,
          sourceLabel: `chữ ${lang.toUpperCase()}`,
          summary,
        });
        if (Math.abs(review.duration_ms - review.expected_ms) > 200) {
          reviewWarnings.push(`${review.m4a}: thời lượng đo được ${review.duration_ms} ms lệch mốc tính ${review.expected_ms} ms`);
        }
        reviews.push({ ...review, items: items.length });
      } catch (error) {
        reviewWarnings.push(`file nghe thử bài ${order}: ${(error as Error).message}`);
      }
    }
  }

  // 7. Report.
  const allClips = [...clips.values()];
  const uses = allClips.flatMap((clip) => clip.uses.map((use) => ({ use, clip })));
  const spokenTotal = [...spokenPerFile.values()].reduce((sum, n) => sum + n, 0);
  const count = (status: Clip["status"]) => allClips.filter((clip) => clip.status === status).length;
  const generated = allClips.filter((clip) => clip.status === "generated");
  const checked = allClips.filter((clip) => clip.check);
  const stillFlagged = checked.filter((clip) => clip.check!.flags.length > 0);
  const totals = {
    spoken: spokenTotal,
    with_audio: uses.length,
    skipped: skipped.length,
    unique_clips: allClips.length,
    generated: generated.length,
    reused: count("reused"),
    recovered: count("recovered"),
    characters: uses.reduce((sum, { use }) => sum + use.source.length, 0),
    characters_unique: allClips.reduce((sum, clip) => sum + clip.text.length, 0),
    characters_generated: generated.reduce((sum, clip) => sum + clip.text.length, 0),
    duration_ms_unique: allClips.reduce((sum, clip) => sum + clip.entry!.duration_ms, 0),
    duration_ms_all_uses: uses.reduce((sum, { clip }) => sum + clip.entry!.duration_ms, 0),
    duration_ms_generated: generated.reduce((sum, clip) => sum + clip.entry!.duration_ms, 0),
    model_load_ms: Math.round(loadMs),
    self_check_ms: Math.round(checkMs),
    elapsed_ms: Math.round(performance.now() - started),
    ...(lang === "vi"
      ? {
          checked: checked.length,
          flagged_first_check: checked.filter((clip) => (clip.firstCheck ?? clip.check)!.flags.length > 0).length,
          changed_variant: checked.filter((clip) => clip.variant !== 0 && !clip.fromTable).length,
          still_flagged: stillFlagged.length,
          variants_from_table: allClips.filter((clip) => clip.fromTable).length,
        }
      : {}),
  };
  const topic = inputs.find((input) => input.data.kind === "topic");
  const lessonOrders = inputs.filter((input) => input.data.kind === "lesson").map((input) => String(input.data.order).padStart(2, "0")).sort();
  const reportName = `report-${topic ? String(topic.data.slug) : "lesson"}-${lessonOrders.length ? lessonOrders.join("_") : "topic"}${lang === "en" ? "" : `-${lang}`}.json`;
  const reportPath = path.join(cache.dir, reportName);
  const report = {
    command: "tts",
    generated_at: new Date().toISOString(),
    host: hostname(),
    lang,
    engine: { label: engine.label, fingerprint, ...engine.descriptor },
    encoding,
    blank,
    inputs: inputs.map((input) => ({ file: input.display, kind: input.data.kind, spoken: spokenPerFile.get(input) })),
    output_dir: options.display(outDir),
    totals,
    warnings,
    reviews: reviews.map((review) => ({ m4a: options.display(review.m4a), txt: options.display(review.txt), duration_ms: review.duration_ms, items: review.items })),
    clips: allClips.map((clip) => ({
      key: clip.key,
      sha256: clip.entry!.sha256,
      status: clip.status,
      duration_ms: clip.entry!.duration_ms,
      text: clip.text,
      ...(lang === "vi" ? { variant: clip.variant, from_table: clip.fromTable, seeds: clip.entry!.seeds, retried: clip.retried, tried: clip.tried } : {}),
      ...(clip.check ? { check: summarizeCheck(clip.check), first_check: clip.firstCheck ? summarizeCheck(clip.firstCheck) : undefined } : {}),
      uses: clip.uses.map((use) => `${use.input.name}#${use.pointer}`),
    })),
  };
  mkdirSync(cache.dir, { recursive: true });
  writeFileSync(reportPath, `${JSON.stringify(report, null, 2)}\n`);

  const rtf = totals.duration_ms_generated ? genMs / totals.duration_ms_generated : 0;
  const lines = [
    "",
    `TTS ${lang} · ${engine.label}`,
    `Input: ${inputs.map((input) => `${input.name} (${spokenPerFile.get(input)} Spoken)`).join(", ")}`,
    `Chuỗi Spoken: ${totals.spoken}${totals.skipped ? ` (${totals.skipped} bỏ qua vì không có chữ)` : ""}`,
    `Clip khác nhau: ${totals.unique_clips} · sinh mới ${totals.generated} · dùng lại ${totals.reused}${totals.recovered ? ` · khôi phục từ file ${totals.recovered}` : ""}`,
    `Tổng ký tự: ${nf.format(totals.characters)} (${totals.spoken} chuỗi) · ${nf.format(totals.characters_unique)} ký tự khác nhau · đã sinh ${nf.format(totals.characters_generated)}`,
    `Tổng thời lượng audio: ${seconds(totals.duration_ms_unique)} (${totals.unique_clips} clip) · ${seconds(totals.duration_ms_all_uses)} nếu phát đủ ${uses.length} chuỗi`,
    `Thời gian chạy: ${seconds(totals.elapsed_ms)}${loadMs ? ` (trong đó tải nếu thiếu và nạp model ${seconds(loadMs)})` : ""}${checkMs ? ` · tự kiểm ${seconds(checkMs)}` : ""}${rtf ? ` · RTF sinh ${rtf.toFixed(2).replace(".", ",")}` : ""}`,
    ...(lang === "vi" && checked.length
      ? [
          `Tự kiểm: ${checked.length} clip · bị đánh dấu ở lần đầu ${totals.flagged_first_check} · đổi seed ${totals.changed_variant} · còn đánh dấu ${stillFlagged.length}${totals.variants_from_table ? ` · ${totals.variants_from_table} clip dùng biến thể đã chọn trước (tts-vi/variants.json)` : ""}`,
          ...stillFlagged.map((clip) => `  ⚑ ${JSON.stringify(clip.text)}: ${clip.check!.flags.map((f) => FLAG_LABELS[f] ?? f).join("; ")} · máy nghe: ${clip.check!.hyp.map((h) => JSON.stringify(h)).join(" / ")}`),
        ]
      : []),
    `Cảnh báo chuẩn hoá: ${warnings.length}`,
    ...warnings.map((warning) => `  ${warning.file} ${warning.pointer} [${warning.code}] ${warning.message} · "${warning.source}"`),
    `Đầu ra (hợp lệ theo content-schema): ${outputs.map((output) => options.display(output.file)).join(", ")}`,
    `Cache: ${options.display(cache.dir)} (${cache.size} clip trong index.json)`,
    `Báo cáo: ${options.display(reportPath)}`,
    ...reviews.map((review) => `Nghe thử: ${options.display(review.m4a)} (${review.items} clip, ${seconds(review.duration_ms)}) + ${path.basename(review.txt)}`),
    ...reviewWarnings.map((warning) => `Cảnh báo nghe thử: ${warning}`),
  ];
  console.log(lines.join("\n"));
  return 0;
}

function checkFromEntry(id: string, stored: NonNullable<ClipEntry["check"]>): CheckResult {
  return {
    id,
    hyp: stored.heard,
    tolerant_errors: stored.asr_errors,
    tone_errors: 0,
    passes_with_errors: 0,
    duration_s: 0,
    lead_silence_s: stored.lead_silence_s,
    trail_silence_s: stored.trail_silence_s,
    max_pause_s: stored.max_pause_s,
    end_db: stored.end_db,
    flags: stored.flags,
    badness: stored.badness,
  };
}

function summarizeCheck(check: CheckResult) {
  return {
    flags: check.flags,
    heard: check.hyp,
    asr_errors: check.tolerant_errors,
    lead_silence_s: check.lead_silence_s,
    trail_silence_s: check.trail_silence_s,
    max_pause_s: check.max_pause_s,
    end_db: check.end_db,
    badness: check.badness,
  };
}

/** One clip: speak (blank-aware), WAV, m4a at `file` (written atomically). */
async function render(synthesizer: Synthesizer, engine: EngineSpec, post: PostSpec, text: string, variant: number, file: string, work: string, zeroTimes: boolean) {
  const pcm = await speak(synthesizer, text, { variant, blankPauseMs: engine.blankPauseMs });
  const processed = postProcess(pcm.samples, pcm.sampleRate, post);
  const wav = path.join(work, `${path.basename(file, ".m4a")}.wav`);
  writeFileSync(wav, wavFromFloat(processed.samples, pcm.sampleRate));
  mkdirSync(path.dirname(file), { recursive: true });
  const partial = `${file}.part`;
  await encodeM4a(wav, partial, { zeroTimes });
  const bytes = readFileSync(partial);
  const duration = await durationMs(partial);
  renameSync(partial, file);
  rmSync(wav, { force: true });
  return { bytes, duration, seeds: pcm.info?.seeds, retried: pcm.info?.retried ?? false, post: processed.report };
}

/**
 * VI self-check (SK-024): every new clip goes through evaluate.py (Whisper, 2 passes, signal
 * measurements). A flagged clip whose variant was not fixed by tts-vi/variants.json gets
 * `maxVariants` more seeds; variant 0 and the candidates are judged in one run and the clip with
 * the lowest badness is kept (ties: the lowest variant). The choice goes into variants.json so a
 * later run regenerates the same clip.
 */
async function checkAndRetry(ctx: {
  todo: Clip[];
  /** Searched again whatever their state (--recheck); the result is recorded even when variant 0 wins. */
  forced: Clip[];
  /** Every clip of the run (context for the ASR when few clips are judged). */
  pool: Clip[];
  post: PostSpec;
  passes: number;
  synthesizer: Synthesizer;
  engine: EngineSpec;
  cache: AudioCache;
  work: string;
  keyOf: (text: string, variant: number) => string;
  variants: VariantTable;
  fingerprint: string;
  maxVariants: number;
  log: (line: string) => void;
}): Promise<void> {
  const { todo, forced, pool, post, synthesizer, engine, cache, work, keyOf, variants, fingerprint, maxVariants, passes, log } = ctx;
  // cut_end_raw: measured on the engine output before the silence was fixed (afterwards every clip ends in silence).
  const job = (id: string, file: string, clip: Clip, retried: boolean, report = clip.post): CheckJob => ({
    id,
    m4a: file,
    ref: clip.text,
    retry: retried,
    blank: clip.text.includes(BLANK),
    cut_end_raw: report !== undefined && report.raw_tail_db > CUT_TAIL_DB,
  });
  if (todo.length > 0) {
    log(`Tự kiểm ${todo.length} clip VI (Whisper large-v3-turbo, ${passes} lượt nghe)…`);
    const first = await selfCheck(todo.map((clip) => job(clip.key, path.join(cache.dir, clip.entry!.file), clip, clip.retried ?? false)), log, passes);
    for (const clip of todo) clip.check = first.get(clip.key);
  }
  const remember = (clip: Clip) => {
    if (!clip.check || !clip.entry) return;
    clip.entry = { ...clip.entry, check: { ...summarizeCheck(clip.check), checked_at: new Date().toISOString() } };
    cache.put(clip.key, clip.entry);
  };
  for (const clip of todo) remember(clip);
  cache.save();
  const retry = [...todo.filter((clip) => (clip.check?.flags.length ?? 0) > 0 && !clip.fromTable && !forced.includes(clip)), ...forced];
  if (retry.length === 0 || maxVariants <= 0) return;

  log(`${retry.length} clip ${forced.length ? `(${forced.length} theo --recheck) ` : ""}cần thử seed khác: thử thêm ${maxVariants} seed cho mỗi clip…`);
  type Candidate = { clip: Clip; variant: number; file: string; bytes: Buffer; duration: number; seeds?: number[]; retried: boolean; post: PostReport };
  const candidates: Candidate[] = [];
  for (let variant = 1; variant <= maxVariants; variant++) {
    for (const clip of retry) {
      const file = path.join(work, `${clip.key}-v${variant}.m4a`);
      const made = await render(synthesizer, engine, post, clip.text, clip.variant + variant, file, work, true);
      candidates.push({ clip, variant: clip.variant + variant, file, ...made });
    }
  }
  // Variant 0 again, in the same run as the candidates, so all are heard under the same conditions.
  // Order: variant by variant, lesson order inside, so neighbours are different sentences.
  const judged: CheckJob[] = [
    ...retry.map((clip) => job(`${clip.key}#${clip.variant}`, path.join(cache.dir, clip.entry!.file), clip, clip.retried ?? false)),
    ...candidates.map((c) => job(`${c.clip.key}#${c.variant}`, c.file, c.clip, c.retried, c.post)),
  ];
  // Few clips to judge (e.g. --recheck "Kẹo"): put other clips of the lesson between them, so the
  // ASR does not hear five takes of the same word in a row. Their results are not used.
  const context = retry.length < 10 ? pool.filter((clip) => clip.entry && !retry.includes(clip)).filter((_, i, all) => i % Math.max(1, Math.floor(all.length / 12)) === 0) : [];
  const jobs: CheckJob[] = context.length
    ? judged.flatMap((j, i) => {
        const filler = context[i % context.length]!;
        return [job(`context#${i}`, path.join(cache.dir, filler.entry!.file), filler, false), j];
      })
    : judged;
  const second = await selfCheck(jobs, log, passes);
  for (const clip of retry) {
    const options = [
      { variant: clip.variant, result: second.get(`${clip.key}#${clip.variant}`)!, candidate: undefined as Candidate | undefined },
      ...candidates.filter((c) => c.clip === clip).map((c) => ({ variant: c.variant, result: second.get(`${clip.key}#${c.variant}`)!, candidate: c })),
    ];
    options.sort((a, b) => a.result.badness - b.result.badness || a.variant - b.variant);
    const best = options[0]!;
    clip.firstCheck = clip.check;
    clip.tried = options.map((o) => o.variant).sort((a, b) => a - b);
    clip.check = best.result;
    if (best.candidate) {
      const oldKey = clip.key;
      const oldFile = path.join(cache.dir, clip.entry!.file);
      clip.key = keyOf(clip.text, best.variant);
      clip.variant = best.variant;
      const file = cache.clipPath("vi", clip.key);
      copyFileSync(best.candidate.file, file);
      clip.retried = best.candidate.retried;
      clip.post = best.candidate.post;
      clip.entry = entryFor(clip, file, best.candidate.bytes, best.candidate.duration, new Date(), engine, cache.dir, "vi", best.candidate.seeds);
      cache.put(clip.key, clip.entry);
      cache.remove(oldKey);
      rmSync(oldFile, { force: true });
    }
    // Recorded even when variant 0 wins: the search is done, a later run reuses the choice.
    variants.set(fingerprint, engine.label, clip.text, {
      variant: clip.variant,
      flags_before: clip.firstCheck?.flags ?? [],
      flags_after: best.result.flags,
      heard: best.result.hyp,
      tried: clip.tried,
      chosen_at: new Date().toISOString(),
    });
    remember(clip);
    const verdict = best.result.flags.length ? `vẫn còn: ${best.result.flags.join(", ")}` : "sạch";
    log(`  ${JSON.stringify(clip.text)}: giữ biến thể ${best.variant} (${verdict}; máy nghe ${best.result.hyp.map((h) => JSON.stringify(h)).join(" / ")})`);
  }
  cache.save();
}

function entryFor(clip: Clip, file: string, bytes: Buffer, duration: number, created: Date, engine: EngineSpec, cacheDir: string, lang: Lang, seeds?: number[]): ClipEntry {
  const d = engine.descriptor;
  return {
    lang,
    file: path.relative(cacheDir, file).split(path.sep).join("/"),
    sha256: sha256Bytes(bytes),
    bytes: bytes.length,
    duration_ms: duration,
    text: clip.text,
    engine: `${d.engine}@${d.engine_version}`,
    model: `${d.model}@${String(d.model_revision).slice(0, 7)} ${d.dtype}`,
    voice: String(d.voice),
    speed: Number(d.speed),
    created_at: created.toISOString(),
    ...(clip.post ? { post: clip.post } : {}),
    ...(lang === "en" ? {} : { variant: clip.variant, ...(seeds ? { seeds } : {}), ...(clip.retried ? { retried: true } : {}) }),
  };
}
