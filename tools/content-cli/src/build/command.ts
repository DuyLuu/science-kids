// `content-cli build`: topic + lesson JSON (output of tts, with audio.<lang>) + cached clips ->
// a content pack laid out as technical-plan.md B4.3:
//   <out>/catalog/v1/manifest.json
//   <out>/topics/<topic_id>/<version>/pack.json
//   <out>/assets/<sha256>.m4a
//   <out>/assets/<sha256>.jpg     (SK-033: pictures chosen in content/images/…, fetched into content/.images;
//                                  composed pictures from content/images/composed/…, own pictures from
//                                  content/images/own/…, dev 10/11)
// Read only on the inputs, the clip cache, the image selection files and the image cache. Same
// inputs -> same bytes everywhere except manifest.generated_at.
import { existsSync, mkdirSync, readdirSync, readFileSync, renameSync, rmSync, statSync, writeFileSync } from "node:fs";
import path from "node:path";
import { validateDocuments } from "@science-kids/content-schema/validate";
import { maxAppVersion } from "../app-version.ts";
import { sha256Bytes } from "../audio.ts";
import { AudioCache, canonicalJson, type ClipEntry } from "../cache.ts";
import { displayPointer, getAt } from "../json-pointer.ts";
import { collectSpoken, locateCommon, type ContentKind, type Lang, type SpokenNode } from "../spoken.ts";
import { checkAgeRules, formatIssue, IMAGE_WARNING_CODES, issueText } from "../validate/age-rules.ts";
import { DEFAULT_IMAGE_CACHE_DIR, ImageCache, isComposedEntry, isOwnEntry, isSourceEntry, type Change, type ImageEntry } from "../images/cache.ts";
import { sameCredit } from "../images/fetch.ts";
import {
  composedCacheKey,
  composedCredit,
  creditOf,
  DEFAULT_SELECTION_DIR,
  imageCacheKey,
  isOwnCredit,
  ownCacheKey,
  ownCredit,
  partCredit,
  partCreditOf,
  sameComposedCredit,
  sameOwnCredit,
  SelectionSet,
  selectionFileFor,
  type Credit,
  type OwnCredit,
  type PartCredit,
  type Selection,
} from "../images/selection.ts";
import { duplicateKeys, imageRefs } from "../images/slots.ts";
import { AGE_GROUPS, loadRules, type Rules } from "./rules.ts";

export const CATALOG_PATH = "catalog/v1/manifest.json";
/** Hex characters kept of a sha256 for `version` and `content_version`. */
const VERSION_LENGTH = 12;
const PACK_ENTRIES = new Set(["catalog", "topics", "assets"]);
const IGNORED_ENTRIES = new Set([".DS_Store"]);

export type BuildOptions = {
  files: string[];
  out: string;
  cacheDir: string;
  rulesFile: string;
  minAppVersion: string;
  /**
   * Languages every Spoken must have a clip for (default ["en"]). `--require-lang en,vi` once every
   * lesson in the pack has VI audio (SK-024); an audio.vi that is present is always checked.
   */
  requireLangs?: Lang[];
  /** SK-033: image selection files, default content/images (<age_group>/<topic_slug>/<lesson_slug>.json). */
  selectionDir?: string;
  /** SK-033: processed pictures + index.json written by `images fetch`, default content/.images (read only). */
  imageCacheDir?: string;
  /** --require-assets: every Image must get a picture (else an error per Image). */
  requireAssets?: boolean;
  /** Paths are printed relative to this. */
  display: (target: string) => string;
};

type Doc = Record<string, unknown> & { kind: ContentKind; id: string };
type Input = { path: string; display: string; text: string; data: Doc };
type Problem = { file: string; pointer: string; message: string };
type AudioRef = { input: Input; pointer: string; lang: Lang; hash: string; en: string };
type AudioAsset = { sha256: string; size: number; kind: "audio"; lang: Lang; path: string; bytes: Buffer };
/** SK-033 contract: credit = title, author, license, license_url, source, source_url (+ changes: what fetch did to the source picture). */
export type ImageCredit = Credit & { changes: Change[] };
/**
 * Composed picture (SK-033 dev 10/11): title, author "Science Kids", license (the strictest of
 * the parts), license_url, source "composed", changes (always has "composed"), parts (credit of each source picture).
 */
export type ComposedImageCredit = { title: string; author: string; license: string; license_url: string; source: "composed"; changes: Change[]; parts: PartCredit[] };
/**
 * Own picture (SK-033 dev 10/11): title, author "Science Kids", license "Science Kids", license_url "",
 * source "Science Kids", changes [<method>] ("drawn"). No source_url.
 */
export type OwnImageCredit = OwnCredit & { changes: Change[] };
type ImageAsset = { sha256: string; size: number; kind: "image"; path: string; width: number; height: number; credit: ImageCredit | ComposedImageCredit | OwnImageCredit; bytes: Buffer };
type Asset = AudioAsset | ImageAsset;
type WithoutBytes<T> = T extends unknown ? Omit<T, "bytes"> : never;

export type ManifestTopic = {
  id: string;
  slug: string;
  age_group: string;
  order: number;
  title: SpokenNode;
  is_free: boolean;
  version: string;
  path: string;
  sha256: string;
  size: number;
  min_app_version: string;
};
export type Manifest = {
  schema_version: number;
  generated_at: string;
  content_version: string;
  topics: ManifestTopic[];
  rules: Rules;
  assets: WithoutBytes<Asset>[];
};

const nf = new Intl.NumberFormat("vi-VN", { maximumFractionDigits: 1 });
export function formatBytes(bytes: number): string {
  if (bytes < 1024) return `${bytes} B`;
  if (bytes < 1024 * 1024) return `${nf.format(bytes / 1024)} KB`;
  return `${nf.format(bytes / (1024 * 1024))} MB`;
}

const json = (value: unknown) => `${JSON.stringify(value, null, 2)}\n`;
const shortHash = (value: unknown) => sha256Bytes(canonicalJson(value)).slice(0, VERSION_LENGTH);

/** Why `out` cannot be replaced, or undefined when it is missing, empty or an earlier pack. */
export function outDirProblem(out: string): string | undefined {
  if (!existsSync(out)) return undefined;
  if (!statSync(out).isDirectory()) return "không phải thư mục";
  const entries = readdirSync(out).filter((name) => !IGNORED_ENTRIES.has(name));
  if (entries.length === 0) return undefined;
  const strangers = entries.filter((name) => !PACK_ENTRIES.has(name));
  if (strangers.length > 0) return `có ${strangers.map((name) => JSON.stringify(name)).join(", ")}, không phải gói do build tạo; chọn thư mục khác hoặc tự xoá`;
  if (!existsSync(path.join(out, CATALOG_PATH))) return `không có ${CATALOG_PATH}, không phải gói do build tạo; chọn thư mục khác hoặc tự xoá`;
  return undefined;
}

export async function runBuild(options: BuildOptions): Promise<number> {
  const log = (line: string) => console.log(line);
  const outDir = path.resolve(options.out);
  const outProblem = outDirProblem(outDir);
  if (outProblem) {
    console.error(`--out ${options.display(outDir)}: ${outProblem}. build thay cả thư mục này.`);
    return 2;
  }

  // 1. Read + validate the inputs with packages/content-schema (Ajv + zod + cross-file checks).
  const inputs: Input[] = [];
  for (const file of options.files) {
    const absolute = path.resolve(file);
    if (!existsSync(absolute) || !statSync(absolute).isFile()) {
      console.error(`${options.display(absolute)} / không tìm thấy file`);
      return 1;
    }
    const text = readFileSync(absolute, "utf8");
    let data: Doc;
    try {
      data = JSON.parse(text);
    } catch (error) {
      console.error(`${options.display(absolute)} / JSON không hợp lệ: ${(error as Error).message}`);
      return 1;
    }
    if (inputs.some((input) => input.path === absolute)) continue;
    inputs.push({ path: absolute, display: options.display(absolute), text, data });
  }
  const validation = validateDocuments(inputs.map((input) => ({ file: input.display, text: input.text })));
  if (!validation.ok) {
    for (const error of validation.errors) console.error(`${error.file} ${displayPointer(error.pointer)} ${error.message}`);
    console.error(`\nInput chưa hợp lệ theo content-schema (${validation.errors.length} lỗi). Bài lẻ thì đưa kèm topic.json.`);
    return 1;
  }
  const topics = inputs.filter((input) => input.data.kind === "topic");
  const lessons = inputs.filter((input) => input.data.kind === "lesson");
  if (topics.length === 0) {
    console.error("Thiếu topic.json: gói chủ đề cần file topic và các bài của nó.");
    return 1;
  }

  const problems: Problem[] = [];
  const warnings: string[] = [];
  const imageWarnings = new Map<string, number>();

  // 2. rules (B5.3): one source, copied into the manifest. Then the authoring rules of each
  //    topic's age group (SK-026), same lines as `validate`; a topic whose age group is not in the
  //    file gets age_rules_missing. format_not_rendered is an error here.
  const rulesDisplay = options.display(path.resolve(options.rulesFile));
  const { rules, errors: rulesErrors } = loadRules(path.resolve(options.rulesFile));
  for (const error of rulesErrors) problems.push({ file: rulesDisplay, pointer: error.pointer, message: error.message });
  if (rules) {
    for (const issue of checkAgeRules(inputs, rules, { minAppVersion: options.minAppVersion, mode: "build", rulesDisplay })) {
      if (issue.severity === "error") problems.push({ file: issue.file, pointer: issue.pointer, message: issueText(issue) });
      else if (IMAGE_WARNING_CODES.has(issue.code)) imageWarnings.set(issue.file, (imageWarnings.get(issue.file) ?? 0) + 1);
      else warnings.push(formatIssue(issue));
    }
  }
  for (const [file, count] of imageWarnings) warnings.push(`${file}: ${count} cảnh báo hình (image_missing, image_brief_keywords); xem từng dòng bằng validate`);

  // 3. Every AssetHash, located through the schema: Spoken audio or Image asset, nothing else.
  const audioRefs: AudioRef[] = [];
  const imagesByInput = new Map<Input, string[]>();
  for (const input of inputs) {
    const known = new Set<string>();
    for (const { pointer, node } of collectSpoken(input.data.kind, input.data)) {
      for (const lang of options.requireLangs ?? ["en"]) {
        if (!node.audio?.[lang]) {
          problems.push({ file: input.display, pointer, message: `thiếu audio.${lang}: "${node[lang]}". Chạy content-cli tts --lang ${lang} rồi build từ JSON đầu ra của tts` });
        }
      }
      for (const lang of Object.keys(node.audio ?? {}) as Lang[]) {
        const hash = node.audio![lang]!;
        known.add(`${pointer}/audio/${lang}`);
        audioRefs.push({ input, pointer: `${pointer}/audio/${lang}`, lang, hash, en: node.en });
      }
    }
    const images = locateCommon(input.data.kind, input.data, "Image");
    imagesByInput.set(input, images);
    for (const pointer of images) {
      const image = getAt(input.data, pointer) as { asset?: string };
      if (image.asset === undefined) continue;
      known.add(`${pointer}/asset`);
      problems.push({ file: input.display, pointer: `${pointer}/asset`, message: "image.asset do build điền từ file chọn ảnh (content/images/…, SK-033), không viết trong nội dung; bỏ asset" });
    }
    for (const pointer of locateCommon(input.data.kind, input.data, "AssetHash")) {
      if (!known.has(pointer)) problems.push({ file: input.display, pointer, message: "AssetHash ở chỗ build chưa biết (không phải audio của Spoken hay asset của Image)" });
    }
    if (input.data.ai_draft === true) {
      warnings.push(`${input.display}: ai_draft = true (bản nháp AI chưa duyệt); vẫn build vì là bản thử`);
    }
  }

  // 4. Each referenced clip: in index.json, file present, bytes hash to the name it will get.
  const cache = new AudioCache(path.resolve(options.cacheDir));
  const cacheDisplay = options.display(cache.dir);
  const bySha = cache.bySha256();
  const assets = new Map<string, Asset>();
  const refsByHash = new Map<string, AudioRef[]>();
  for (const ref of audioRefs) refsByHash.set(ref.hash, [...(refsByHash.get(ref.hash) ?? []), ref]);
  for (const [hash, refs] of refsByHash) {
    const langs = [...new Set(refs.map((ref) => ref.lang))];
    const report = (message: string) => {
      for (const ref of refs) problems.push({ file: ref.input.display, pointer: ref.pointer, message: `${message} · "${ref.en}"` });
    };
    if (langs.length > 1) {
      report(`cùng một clip ${hash.slice(0, 12)}… dùng cho ${langs.join(" và ")}`);
      continue;
    }
    const lang = langs[0]!;
    const entries = (bySha.get(hash) ?? []).filter(({ entry }) => entry.lang === lang);
    if (entries.length === 0) {
      report(`không có clip ${lang} sha256 ${hash.slice(0, 12)}… trong ${cacheDisplay}/index.json. Chạy lại content-cli tts`);
      continue;
    }
    // Several cache keys may record the same sha256: every one that is present must really have
    // those bytes, otherwise assets/<sha256> would be ambiguous.
    let chosen: { entry: ClipEntry; bytes: Buffer } | undefined;
    const gone: string[] = [];
    const changed: string[] = [];
    for (const { entry } of entries) {
      const file = path.join(cache.dir, entry.file);
      if (!existsSync(file)) {
        gone.push(`${cacheDisplay}/${entry.file}`);
        continue;
      }
      const bytes = readFileSync(file);
      const actual = sha256Bytes(bytes);
      if (actual !== hash) changed.push(`${cacheDisplay}/${entry.file} (sha256 thật ${actual.slice(0, 12)}…)`);
      else chosen ??= { entry, bytes };
    }
    if (changed.length > 0) {
      report(`hash trùng mà khác nội dung: index.json ghi sha256 ${hash.slice(0, 12)}… nhưng ${changed.join(", ")}. Xoá file đó rồi chạy lại content-cli tts`);
      continue;
    }
    if (!chosen) {
      report(`thiếu clip ${lang}: ${gone.join(", ")} không còn trong cache (index.json vẫn ghi sha256 ${hash.slice(0, 12)}…). Chạy lại content-cli tts; clip sinh lại có hash mới`);
      continue;
    }
    const assetPath = `assets/${hash}.m4a`;
    assets.set(hash, { sha256: hash, size: chosen!.bytes.length, kind: "audio", lang, path: assetPath, bytes: chosen!.bytes });
  }

  // 4b. Pictures (SK-033): image key -> selection file -> image cache (content/.images). The
  //     credit in the cache must be the one written in the selection file (fetch checked it at
  //     the source); bytes must hash to the recorded sha256. One file per picture however often used.
  const selectionDir = path.resolve(options.selectionDir ?? DEFAULT_SELECTION_DIR);
  const selections = new SelectionSet(selectionDir);
  const imageCache = new ImageCache(path.resolve(options.imageCacheDir ?? DEFAULT_IMAGE_CACHE_DIR));
  const imageCacheDisplay = options.display(imageCache.dir);
  const assetOfImage = new Map<Input, Map<string, string>>();
  let imagesWithAsset = 0;
  let imagesWithoutAsset = 0;
  const selectionsUsed = new Set<string>();
  const notComposedYet = new Set<string>();
  for (const input of inputs) {
    const refs = imageRefs(input.data.kind, input.data);
    const chosen = new Map<string, string>();
    assetOfImage.set(input, chosen);
    const topic = input.data.kind === "topic" ? input : topics.find((candidate) => candidate.data.id === input.data.topic_id);
    if (!topic) continue;
    const selectionFile = selectionFileFor(selectionDir, String(topic.data.age_group), String(topic.data.slug), input.data.kind === "lesson" ? String(input.data.slug) : undefined);
    const selectionDisplay = options.display(selectionFile);
    let selection: Selection | undefined;
    if (existsSync(selectionFile)) {
      const loaded = selections.load(selectionFile);
      for (const error of loaded.errors) problems.push({ file: selectionDisplay, pointer: error.pointer, message: error.message });
      selection = loaded.selection;
      if (selection) selectionsUsed.add(selectionDisplay);
    }
    for (const key of duplicateKeys(refs)) problems.push({ file: input.display, pointer: "", message: `hai hình cùng khoá ${key}: lỗi của content-cli, báo dev` });
    for (const ref of refs) {
      if (ref.image.asset !== undefined) continue; // reported in step 3
      const resolved = selection ? selections.resolve(selection, ref.key, String(topic.data.age_group), options.display) : undefined;
      if (resolved && "error" in resolved) {
        problems.push({ file: input.display, pointer: ref.pointer, message: `hình ${ref.key}: ${selectionDisplay} ${resolved.error}` });
        continue;
      }
      const at = { file: input.display, pointer: ref.pointer };
      let entry: ImageEntry | undefined;
      if (resolved && "composed" in resolved) {
        // Composed picture: the designer's file must be there and fetched (cache key = its bytes);
        // no file yet means not made yet: placeholder, like a picture not chosen.
        const composedPath = selections.composedPath(resolved.composed.composed.file);
        if (!existsSync(composedPath)) {
          imagesWithoutAsset++;
          notComposedYet.add(`${options.display(composedPath)} (${selectionDisplay} ${resolved.key})`);
          if (options.requireAssets) problems.push({ ...at, message: `hình ${ref.key} chưa có ảnh (--require-assets): hình ghép ${options.display(composedPath)} chưa có; designer ghép rồi chạy content-cli images fetch ${selectionDisplay}` });
          continue;
        }
        const found = imageCache.usable(composedCacheKey(sha256Bytes(readFileSync(composedPath))));
        if (!found || !isComposedEntry(found)) {
          problems.push({ ...at, message: `hình ${ref.key}: hình ghép ${options.display(composedPath)} (mới hoặc đã sửa) chưa có trong ${imageCacheDisplay}. Chạy content-cli images fetch ${selectionDisplay}` });
          continue;
        }
        if (!sameComposedCredit(found.credit, composedCredit(resolved.composed.title, resolved.parts.map(partCredit)))) {
          problems.push({ ...at, message: `hình ${ref.key}: ${selectionDisplay} đổi title hoặc ảnh thành phần của hình ghép sau lần fetch trước; chạy lại content-cli images fetch ${selectionDisplay}` });
          continue;
        }
        entry = found;
      } else if (resolved && "own" in resolved) {
        // Own picture: the file must be there (an own entry says the picture is made) and fetched
        // (cache key = its path + bytes); title and method as at fetch.
        const ownPath = selections.localPath(resolved.own.own.file);
        if (!existsSync(ownPath)) {
          problems.push({ ...at, message: `hình ${ref.key}: hình tự vẽ ${options.display(ownPath)} chưa có (${selectionDisplay} ${resolved.key}); designer vẽ, xuất JPEG vào đó rồi chạy content-cli images fetch ${selectionDisplay}` });
          continue;
        }
        const found = imageCache.usable(ownCacheKey(resolved.own.own.file, sha256Bytes(readFileSync(ownPath))));
        if (!found || !isOwnEntry(found)) {
          problems.push({ ...at, message: `hình ${ref.key}: hình tự vẽ ${options.display(ownPath)} (mới hoặc đã sửa) chưa có trong ${imageCacheDisplay}. Chạy content-cli images fetch ${selectionDisplay}` });
          continue;
        }
        if (!sameOwnCredit(found.credit, ownCredit(resolved.own.title)) || found.own.method !== resolved.own.own.method) {
          problems.push({ ...at, message: `hình ${ref.key}: ${selectionDisplay} đổi title hoặc method của hình tự vẽ sau lần fetch trước; chạy lại content-cli images fetch ${selectionDisplay}` });
          continue;
        }
        entry = found;
      } else if (resolved) {
        const found = imageCache.usable(imageCacheKey(resolved.picked));
        if (!found || !isSourceEntry(found)) {
          problems.push({ ...at, message: `hình ${ref.key}: ảnh đã chọn trong ${selectionDisplay} chưa có trong ${imageCacheDisplay}. Chạy content-cli images fetch ${selectionDisplay}` });
          continue;
        }
        if (!sameCredit(found.credit, creditOf(resolved.picked))) {
          problems.push({ ...at, message: `hình ${ref.key}: ${selectionDisplay} đổi nguồn hoặc giấy phép sau lần fetch trước; chạy lại content-cli images fetch ${selectionDisplay}` });
          continue;
        }
        entry = found;
      } else {
        imagesWithoutAsset++;
        if (options.requireAssets) problems.push({ ...at, message: `hình ${ref.key} chưa có ảnh (--require-assets): chọn ảnh vào ${selectionDisplay} rồi chạy content-cli images fetch` });
        continue;
      }
      const bytes = readFileSync(imageCache.filePath(entry));
      const actual = sha256Bytes(bytes);
      if (actual !== entry.sha256) {
        problems.push({ ...at, message: `hình ${ref.key}: ${imageCacheDisplay}/${entry.file} có sha256 ${actual.slice(0, 12)}…, index.json ghi ${entry.sha256.slice(0, 12)}…; xoá file đó rồi chạy lại images fetch --force` });
        continue;
      }
      chosen.set(ref.pointer, entry.sha256);
      imagesWithAsset++;
      if (!assets.has(entry.sha256)) {
        const credit: ImageCredit | ComposedImageCredit | OwnImageCredit = isComposedEntry(entry)
          ? {
              title: entry.credit.title,
              author: entry.credit.author,
              license: entry.credit.license,
              license_url: entry.credit.license_url,
              source: entry.credit.source,
              changes: entry.changes,
              parts: entry.credit.parts.map(partCreditOf),
            }
          : isOwnEntry(entry)
            ? { ...ownCredit(entry.credit.title), changes: entry.changes }
            : { ...creditOf(entry.credit), changes: entry.changes };
        assets.set(entry.sha256, { sha256: entry.sha256, size: bytes.length, kind: "image", path: `assets/${entry.sha256}.jpg`, width: entry.width, height: entry.height, credit, bytes });
      }
    }
    if (selection) {
      for (const key of Object.keys(selection.images)) {
        if (!refs.some((ref) => ref.key === key)) warnings.push(`${selectionDisplay} /images/${key}: ${input.display} không có hình nào mang khoá này (bài đổi key?); bỏ qua`);
      }
    }
  }

  for (const file of notComposedYet) warnings.push(`hình ghép chưa có file: ${file}; app vẽ hình giữ chỗ (designer ghép rồi chạy images fetch)`);

  if (problems.length > 0) {
    for (const problem of problems) console.error(`${problem.file} ${displayPointer(problem.pointer)} ${problem.message}`);
    console.error(`\nKhông build được (${problems.length} lỗi). Chưa ghi gì vào ${options.display(outDir)}.`);
    return 1;
  }

  // 5. pack.json per topic: topic + its lessons (by order), Image.brief removed (SK-001).
  const strip = (input: Input): Doc => {
    const copy = structuredClone(input.data);
    for (const pointer of imagesByInput.get(input) ?? []) {
      const image = getAt(copy, pointer) as { brief?: string; asset?: string };
      delete image.brief;
      const asset = assetOfImage.get(input)?.get(pointer);
      if (asset !== undefined) image.asset = asset;
    }
    return copy;
  };
  const groupIndex = (input: Input) => AGE_GROUPS.indexOf(input.data.age_group as (typeof AGE_GROUPS)[number]);
  const orderedTopics = [...topics].sort((a, b) => groupIndex(a) - groupIndex(b) || Number(a.data.order) - Number(b.data.order) || String(a.data.slug).localeCompare(String(b.data.slug)));
  const packs: { topic: Input; lessons: Input[]; entry: ManifestTopic; text: string }[] = [];
  const stripped: { file: string; data: Doc }[] = [];
  for (const topic of orderedTopics) {
    const own = lessons.filter((lesson) => lesson.data.topic_id === topic.data.id).sort((a, b) => Number(a.data.order) - Number(b.data.order));
    if (own.length === 0) warnings.push(`${topic.display}: chủ đề chưa có bài nào trong input`);
    const topicData = strip(topic);
    const lessonData = own.map(strip);
    stripped.push({ file: topic.display, data: topicData }, ...own.map((lesson, i) => ({ file: lesson.display, data: lessonData[i]! })));
    const schemaVersion = Number(topicData.schema_version);
    const version = shortHash({ schema_version: schemaVersion, topic: topicData, lessons: lessonData });
    const text = json({ schema_version: schemaVersion, topic_id: topicData.id, version, topic: topicData, lessons: lessonData });
    const appVersions = [options.minAppVersion];
    for (const [input, data] of [[topic, topicData] as const, ...own.map((lesson, i) => [lesson, lessonData[i]!] as const)]) {
      for (const pointer of locateCommon(input.data.kind, data, "AppVersion")) appVersions.push(String(getAt(data, pointer)));
    }
    const packPath = `topics/${topicData.id}/${version}/pack.json`;
    packs.push({
      topic,
      lessons: own,
      text,
      entry: {
        id: topicData.id,
        slug: String(topicData.slug),
        age_group: String(topicData.age_group),
        order: Number(topicData.order),
        title: topicData.title as SpokenNode,
        is_free: topicData.is_free === true,
        version,
        path: packPath,
        sha256: sha256Bytes(text),
        size: Buffer.byteLength(text),
        min_app_version: maxAppVersion(appVersions),
      },
    });
  }
  // The pack content must still be valid schema v1 (checked under the input names, so the
  // folder-based checks see the same folder as for the inputs).
  const strippedValidation = validateDocuments(stripped);
  if (!strippedValidation.ok) {
    for (const error of strippedValidation.errors) console.error(`${error.file} ${displayPointer(error.pointer)} ${error.message}`);
    console.error("\nNội dung gói (sau khi bỏ brief) không hợp lệ: đây là lỗi của content-cli, báo dev.");
    return 1;
  }
  const schemaVersions = new Set(packs.map((pack) => Number(pack.topic.data.schema_version)));
  if (schemaVersions.size !== 1) {
    console.error(`Các chủ đề có schema_version khác nhau (${[...schemaVersions].join(", ")}): mỗi lần build một schema_version.`);
    return 1;
  }

  // 6. Manifest.
  const assetList = [...assets.values()].sort((a, b) => a.sha256.localeCompare(b.sha256));
  const body = {
    schema_version: [...schemaVersions][0]!,
    topics: packs.map((pack) => pack.entry),
    rules: rules!,
    assets: assetList.map(({ bytes: _bytes, ...asset }) => asset),
  };
  const manifest: Manifest = {
    schema_version: body.schema_version,
    generated_at: new Date().toISOString(),
    content_version: shortHash(body),
    topics: body.topics,
    rules: body.rules,
    assets: body.assets,
  };
  const manifestText = json(manifest);

  // 7. Write into a sibling temp folder, check it, then swap it in for --out.
  const parent = path.dirname(outDir);
  mkdirSync(parent, { recursive: true });
  const staging = path.join(parent, `.${path.basename(outDir)}.tmp-${process.pid}`);
  const retired = path.join(parent, `.${path.basename(outDir)}.old-${process.pid}`);
  rmSync(staging, { recursive: true, force: true });
  try {
    const write = (relative: string, data: string | Buffer) => {
      const file = path.join(staging, relative);
      mkdirSync(path.dirname(file), { recursive: true });
      writeFileSync(file, data);
    };
    write(CATALOG_PATH, manifestText);
    for (const pack of packs) write(pack.entry.path, pack.text);
    for (const asset of assetList) write(asset.path, asset.bytes);

    const expected = new Map<string, { sha256: string; size: number }>([
      ...packs.map((pack) => [pack.entry.path, pack.entry] as const),
      ...assetList.map((asset) => [asset.path, asset] as const),
    ]);
    const onDisk = listFiles(staging).filter((relative) => relative !== CATALOG_PATH);
    if (onDisk.length !== expected.size) throw new Error(`gói tạm có ${onDisk.length} file, manifest liệt kê ${expected.size}`);
    for (const relative of onDisk) {
      const want = expected.get(relative);
      const bytes = readFileSync(path.join(staging, relative));
      if (!want || want.size !== bytes.length || want.sha256 !== sha256Bytes(bytes)) throw new Error(`${relative} không khớp manifest`);
    }

    rmSync(retired, { recursive: true, force: true });
    if (existsSync(outDir)) renameSync(outDir, retired);
    renameSync(staging, outDir);
    rmSync(retired, { recursive: true, force: true });
  } finally {
    rmSync(staging, { recursive: true, force: true });
  }

  // 8. Report.
  const files = listFiles(outDir);
  const total = files.reduce((sum, relative) => sum + statSync(path.join(outDir, relative)).size, 0);
  const assetBytes = assetList.reduce((sum, asset) => sum + asset.size, 0);
  const composedAssets = assetList.filter((asset) => asset.kind === "image" && asset.credit.source === "composed").length;
  const ownAssets = assetList.filter((asset) => asset.kind === "image" && isOwnCredit(asset.credit)).length;
  const imageKinds = [composedAssets > 0 ? `${composedAssets} hình ghép` : "", ownAssets > 0 ? `${ownAssets} hình tự vẽ` : ""].filter(Boolean).join(", ");
  const byLang = new Map<string, number>();
  for (const asset of assetList) {
    const label = asset.kind === "audio" ? `audio ${asset.lang}` : "image";
    byLang.set(label, (byLang.get(label) ?? 0) + 1);
  }
  const lines = [
    "",
    `Build gói nội dung · schema v${manifest.schema_version} · content_version ${manifest.content_version}`,
    `Input: ${inputs.map((input) => path.basename(input.path)).join(", ")}`,
    `Chủ đề: ${packs.length} · bài: ${packs.reduce((sum, pack) => sum + pack.lessons.length, 0)} · asset: ${assetList.length} (${[...byLang].map(([kind, n]) => `${kind} ${n}`).join(", ") || "không có"})`,
    ...packs.map((pack) => `  ${pack.entry.age_group} #${pack.entry.order} ${pack.entry.slug}: ${pack.lessons.length} bài · version ${pack.entry.version} · min_app_version ${pack.entry.min_app_version} · pack.json ${formatBytes(pack.entry.size)}`),
    `Hình: ${assetList.filter((asset) => asset.kind === "image").length} file ảnh${imageKinds ? ` (${imageKinds})` : ""} cho ${imagesWithAsset} Image · ${imagesWithoutAsset} Image chưa có ảnh (app vẽ hình giữ chỗ); đã bỏ brief` +
      (selectionsUsed.size > 0 ? ` · file chọn ảnh: ${[...selectionsUsed].join(", ")}` : ""),
    `Rules: ${Object.keys(manifest.rules).join(", ")} (từ ${rulesDisplay})`,
    `Tổng dung lượng gói: ${formatBytes(total)} (${nf.format(total)} byte, ${files.length} file) · asset ${formatBytes(assetBytes)} · manifest ${formatBytes(Buffer.byteLength(manifestText))}`,
    `Gói: ${options.display(outDir)} (manifest: ${CATALOG_PATH})`,
    `Cảnh báo: ${warnings.length}`,
    ...warnings.map((warning) => `  ${warning}`),
  ];
  log(lines.join("\n"));
  return 0;
}

/** Files under `dir`, relative with "/" separators, sorted. */
export function listFiles(dir: string): string[] {
  const out: string[] = [];
  const walk = (relative: string) => {
    for (const name of readdirSync(path.join(dir, relative)).sort()) {
      const child = relative ? `${relative}/${name}` : name;
      if (statSync(path.join(dir, child)).isDirectory()) walk(child);
      else out.push(child);
    }
  };
  walk("");
  return out;
}
