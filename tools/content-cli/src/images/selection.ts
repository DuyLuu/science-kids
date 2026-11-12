// Image selection files (SK-033): content/images/<age_group>/<topic_slug>/<lesson_slug>.json,
// one per lesson (_topic.json for the topic), in git. Format: schema/image-selection.schema.json.
//   { "images": { "<image key>": <picked image> | { "same_as": "<key>"[, "lesson": "<topic>/<lesson>"] }
//                              | { "composed": { "file": "content/images/composed/<topic>/<name>.jpg", "parts": [ … ] }, "title": "…" }
//                              | { "own": { "file": "content/images/own/<topic>/<name>.jpg", "method": "drawn" }, "title": "…" } } }
// images fetch downloads every picked image into the cache; build fills image.asset from it.
// A composed picture (dev 10/11) is a file the designer made from several source pictures (a
// timeline, a dinosaur next to a bus, a cutaway with its labels removed, one part highlighted):
// each part is a source picture written out in full, an own picture, or a same_as to a picture of
// a selection file. Its licence is the strictest of its parts; the credit lists every part.
// An own picture (dev 10/11, Duy 10/11: an object with no valid free picture gets a drawing) is a
// file Science Kids made itself (method "drawn": the designer or an agent drew it, AI drawing
// included): no outside source, so no third-party licence; the credit says "Science Kids".
import { existsSync, readdirSync, readFileSync, statSync } from "node:fs";
import path from "node:path";
import { Ajv2020, type ValidateFunction } from "ajv/dist/2020.js";
import { canonicalJson } from "../cache.ts";
import { sha256Bytes } from "../audio.ts";
import { CLI_ROOT, REPO_ROOT } from "../paths.ts";
import { OWN_LICENSE_NAME, strictestLicense } from "./license.ts";

export const SELECTION_SCHEMA_FILE = path.join(CLI_ROOT, "schema", "image-selection.schema.json");
/** Selection files live here: <root>/<age_group>/<topic_slug>/<lesson_slug>.json. */
export const DEFAULT_SELECTION_DIR = path.join(REPO_ROOT, "content", "images");
/** Selection file of the topic itself (a slug never starts with "_"). */
export const TOPIC_SELECTION = "_topic.json";
/** composed.file and own.file are repo paths under content/images/; they are read from <selection root>/composed/… and <selection root>/own/… */
export const COMPOSED_FILE_PREFIX = "content/images/";
export const LOCAL_FILE_PREFIX = COMPOSED_FILE_PREFIX;
/** How an own picture was made: "drawn" (designer or agent, AI drawing included). "photo" (taken by us) may come later. */
export const OWN_METHODS = ["drawn"] as const;
export type OwnMethod = (typeof OWN_METHODS)[number];

export type Crop = { left: number; top: number; width: number; height: number };
export type Credit = { title: string; author: string; license: string; license_url: string; source: string; source_url: string };
export type Picked = Credit & { openverse_id?: string; file_url: string; crop?: Crop; note?: string };
export type SameAs = { same_as: string; lesson?: string; note?: string };
/** A picture Science Kids made itself: a file in the repo (content/images/own/<topic>/<name>.jpg). */
export type Own = { own: { file: string; method: OwnMethod }; title: string; note?: string };
/** A part of a composed picture: a source picture written out in full, an own picture, or a picture of a selection file. */
export type Part = Picked | SameAs | Own;
export type Composed = { composed: { file: string; parts: Part[] }; title: string; note?: string };
export type Entry = Picked | SameAs | Composed | Own;
export type Selection = { note?: string; images: Record<string, Entry> };
export type SelectionError = { pointer: string; message: string };

export const isSameAs = (entry: Entry | Part): entry is SameAs => "same_as" in entry;
export const isComposed = (entry: Entry | Part): entry is Composed => "composed" in entry;
export const isOwn = (entry: Entry | Part): entry is Own => "own" in entry;
export const isPicked = (entry: Entry | Part): entry is Picked => !isSameAs(entry) && !isComposed(entry) && !isOwn(entry);

/** Key of `images` that `token` names: the key itself, else the only key ending in ".<token>". */
export function findKey(images: Record<string, Entry>, token: string): string | undefined {
  if (Object.hasOwn(images, token)) return token;
  const tail = Object.keys(images).filter((key) => key.endsWith(`.${token}`));
  return tail.length === 1 ? tail[0] : undefined;
}

let validator: ValidateFunction | undefined;
function validateShape(data: unknown): SelectionError[] {
  // strictRequired / strictTypes off: the if/then branches name properties declared in the parent schema.
  validator ??= new Ajv2020({ allErrors: true, strict: true, strictRequired: false, strictTypes: false }).compile(JSON.parse(readFileSync(SELECTION_SCHEMA_FILE, "utf8")));
  if (validator(data)) return [];
  // if/then/else adds a summary error ("must match then/else schema") next to the real one: drop it.
  return (validator.errors ?? [])
    .filter((error) => error.keyword !== "if")
    .map((error) => {
      const params = error.params as Record<string, unknown>;
      const detail = params.additionalProperty ?? params.missingProperty ?? params.propertyName;
      return { pointer: error.instancePath, message: `${error.message ?? "sai"}${detail !== undefined ? `: ${String(detail)}` : ""}` };
    });
}

function cropErrors(crop: Crop | undefined, at: string): SelectionError[] {
  if (!crop) return [];
  const EPS = 1e-9;
  const errors: SelectionError[] = [];
  if (crop.left + crop.width > 1 + EPS) errors.push({ pointer: `${at}/crop`, message: `left + width = ${crop.left + crop.width} > 1` });
  if (crop.top + crop.height > 1 + EPS) errors.push({ pointer: `${at}/crop`, message: `top + height = ${crop.top + crop.height} > 1` });
  return errors;
}

/** Why a same_as without lesson (of `selfKey`) points nowhere usable in this file, or undefined. */
function sameFileProblem(images: Record<string, Entry>, token: string, selfKey: string, part: boolean): string | undefined {
  const targetKey = findKey(images, token);
  const target = targetKey === undefined ? undefined : images[targetKey];
  if (targetKey === selfKey) return part ? "phần của hình ghép trỏ vào chính hình ghép" : "same_as trỏ vào chính nó";
  if (target === undefined) return `không có khoá "${token}" trong file này`;
  if (isSameAs(target)) return `"${targetKey}" cũng là same_as; trỏ thẳng tới mục có ảnh ("${target.same_as}")`;
  return undefined;
}

/** Checks a parsed selection: schema, then crop inside the image and same_as targets (also inside composed parts). */
export function checkSelection(data: unknown): { selection?: Selection; errors: SelectionError[] } {
  const errors = validateShape(data);
  if (errors.length > 0) return { errors };
  const selection = data as Selection;
  for (const [key, entry] of Object.entries(selection.images)) {
    const at = `/images/${key}`;
    if (isSameAs(entry)) {
      if (entry.lesson !== undefined) continue; // another lesson's file: checked by fetch and build
      const problem = sameFileProblem(selection.images, entry.same_as, key, false);
      if (problem) errors.push({ pointer: `${at}/same_as`, message: problem });
      continue;
    }
    if (isComposed(entry)) {
      entry.composed.parts.forEach((part, i) => {
        const partAt = `${at}/composed/parts/${i}`;
        if (isOwn(part)) return;
        if (!isSameAs(part)) return void errors.push(...cropErrors(part.crop, partAt));
        if (part.lesson !== undefined) return;
        const problem = sameFileProblem(selection.images, part.same_as, key, true);
        if (problem) errors.push({ pointer: `${partAt}/same_as`, message: problem });
      });
      continue;
    }
    if (isPicked(entry)) errors.push(...cropErrors(entry.crop, at));
  }
  return errors.length > 0 ? { errors } : { selection, errors };
}

export function loadSelection(file: string): { selection?: Selection; errors: SelectionError[] } {
  if (!existsSync(file)) return { errors: [{ pointer: "", message: "không tìm thấy file" }] };
  let data: unknown;
  try {
    data = JSON.parse(readFileSync(file, "utf8"));
  } catch (error) {
    return { errors: [{ pointer: "", message: `JSON không hợp lệ: ${(error as Error).message}` }] };
  }
  return checkSelection(data);
}

/** The picked image a key uses inside one file (following one same_as without lesson), or undefined when the key is not chosen or is a composed or own picture. */
export function resolvePicked(selection: Selection, key: string): { picked: Picked; via?: string } | undefined {
  const entry = selection.images[key];
  if (entry === undefined) return undefined;
  if (isPicked(entry)) return { picked: entry };
  if (!isSameAs(entry)) return undefined;
  if (entry.lesson !== undefined) return undefined;
  const targetKey = findKey(selection.images, entry.same_as);
  const target = targetKey === undefined ? undefined : selection.images[targetKey];
  return target && isPicked(target) ? { picked: target, via: targetKey } : undefined;
}

export type ResolvedPicked = { picked: Picked; via?: string };
/** An own picture (key: where its entry is, for messages). */
export type ResolvedOwn = { own: Own; key: string; via?: string };
/** A part of a composed picture once resolved: a picked image or an own picture. */
export type ResolvedPart = ResolvedPicked | { own: Own; via?: string };
/** A composed picture with its parts as source pictures (same_as followed, composed parts flattened, no duplicates). */
export type ResolvedComposed = { composed: Composed; key: string; parts: ResolvedPart[]; via?: string };
export type Resolved = ResolvedPicked | ResolvedOwn | ResolvedComposed | { error: string } | undefined;

/** Where a same_as lands: the selection that holds the picture, its key, the entry (never a same_as). */
type Found = { selection: Selection; key: string; entry: Picked | Composed | Own; via?: string };

/**
 * Selection files of one root (content/images), loaded once each. resolve() follows same_as,
 * also to another lesson's file (`lesson`: <topic>/<lesson>, same age group): one hop across
 * files, then at most one same_as inside the target file. A composed picture comes back with its
 * parts resolved the same way; a part that is itself a composed picture brings its own parts
 * (one level: those must be source pictures).
 */
export class SelectionSet {
  readonly root: string;
  private readonly loaded = new Map<string, { selection?: Selection; errors: SelectionError[] }>();
  constructor(root: string) {
    this.root = root;
  }

  load(file: string): { selection?: Selection; errors: SelectionError[] } {
    const key = path.resolve(file);
    let result = this.loaded.get(key);
    if (!result) {
      result = loadSelection(key);
      this.loaded.set(key, result);
    }
    return result;
  }

  /** File of `lesson` (<topic>/<lesson slug>, a leading "nn-" is ignored) in `ageGroup`. */
  fileOf(ageGroup: string, lesson: string): string {
    const [topic, slug] = lesson.split("/") as [string, string];
    const exact = selectionFileFor(this.root, ageGroup, topic, slug);
    const bare = selectionFileFor(this.root, ageGroup, topic, slug.replace(/^\d{2}-/, ""));
    return existsSync(exact) || !existsSync(bare) ? exact : bare;
  }

  /** Absolute path of a composed picture's file (composed.file is content/images/composed/…). */
  composedPath(file: string): string {
    return composedFilePath(this.root, file);
  }

  /** Absolute path of a file in the repo under content/images/ (composed.file, own.file). */
  localPath(file: string): string {
    return localImagePath(this.root, file);
  }

  resolve(selection: Selection, key: string, ageGroup: string, display: (file: string) => string = (file) => file): Resolved {
    const entry = selection.images[key];
    if (entry === undefined) return undefined;
    const found: Found | { error: string } = isSameAs(entry) ? this.follow(selection, entry, key, ageGroup, display) : { selection, key, entry };
    if ("error" in found) return found;
    if (isComposed(found.entry)) return this.composedOf({ ...found, entry: found.entry }, ageGroup, display);
    if (isOwn(found.entry)) return found.via === undefined ? { own: found.entry, key: found.key } : { own: found.entry, key: found.key, via: found.via };
    return found.via === undefined ? { picked: found.entry } : { picked: found.entry, via: found.via };
  }

  /** A same_as of `selfKey` (an image or a composed part) in `selection`. */
  private follow(selection: Selection, ref: SameAs, selfKey: string, ageGroup: string, display: (file: string) => string): Found | { error: string } {
    if (ref.lesson === undefined) {
      const targetKey = findKey(selection.images, ref.same_as);
      const target = targetKey === undefined ? undefined : selection.images[targetKey];
      if (targetKey === undefined || target === undefined || targetKey === selfKey || isSameAs(target)) return { error: `same_as "${ref.same_as}" không trỏ tới ảnh nào trong file` };
      return { selection, key: targetKey, entry: target, via: targetKey };
    }
    const file = this.fileOf(ageGroup, ref.lesson);
    if (!existsSync(file)) return { error: `same_as trỏ tới bài ${ref.lesson} nhưng chưa có ${display(file)}` };
    const other = this.load(file);
    if (!other.selection) return { error: `${display(file)} chưa hợp lệ (${other.errors.map((error) => `${error.pointer || "/"} ${error.message}`).join("; ")})` };
    const targetKey = findKey(other.selection.images, ref.same_as);
    if (targetKey === undefined) return { error: `${display(file)} không có khoá "${ref.same_as}"` };
    const target = other.selection.images[targetKey]!;
    if (!isSameAs(target)) return { selection: other.selection, key: targetKey, entry: target, via: `${ref.lesson} ${targetKey}` };
    if (target.lesson !== undefined) return { error: `${display(file)} ${targetKey} lại dùng lại ảnh của bài khác; trỏ thẳng tới chỗ gốc (${target.lesson} ${target.same_as})` };
    const innerKey = findKey(other.selection.images, target.same_as);
    const inner = innerKey === undefined ? undefined : other.selection.images[innerKey];
    if (innerKey === undefined || inner === undefined || innerKey === targetKey || isSameAs(inner)) return { error: `${display(file)} ${targetKey} không trỏ tới ảnh nào` };
    return { selection: other.selection, key: innerKey, entry: inner, via: `${ref.lesson} ${innerKey}` };
  }

  private composedOf(found: Found & { entry: Composed }, ageGroup: string, display: (file: string) => string): ResolvedComposed | { error: string } {
    const { selection, key, entry, via } = found;
    const parts: ResolvedPart[] = [];
    const seen = new Set<string>();
    const add = (source: Picked | Own, from?: string) => {
      // The same picture twice counts once: a picked image by its cache key, an own picture by its file.
      const id = isOwn(source) ? `own ${source.own.file}` : imageCacheKey(source);
      if (seen.has(id)) return;
      seen.add(id);
      const part: ResolvedPart = isOwn(source) ? { own: source } : { picked: source };
      parts.push(from === undefined ? part : { ...part, via: from });
    };
    for (const [i, part] of entry.composed.parts.entries()) {
      if (!isSameAs(part)) {
        add(part);
        continue;
      }
      const target = this.follow(selection, part, key, ageGroup, display);
      if ("error" in target) return { error: `hình ghép ${key} phần ${i + 1}: ${target.error}` };
      if (!isComposed(target.entry)) {
        add(target.entry, target.via);
        continue;
      }
      // "Same source pictures as that composed picture": its parts, one level deep.
      for (const [j, inner] of target.entry.composed.parts.entries()) {
        if (!isSameAs(inner)) {
          add(inner, `${target.via ?? target.key} phần ${j + 1}`);
          continue;
        }
        const source = this.follow(target.selection, inner, target.key, ageGroup, display);
        if ("error" in source) return { error: `hình ghép ${key} phần ${i + 1} (${target.key} phần ${j + 1}): ${source.error}` };
        if (isComposed(source.entry)) return { error: `hình ghép ${key} phần ${i + 1}: ${target.key} lại ghép từ hình ghép ${source.key}; chỉ lồng được một lớp, trỏ thẳng tới ảnh nguồn` };
        // A key of the other lesson's file is shown with that lesson.
        add(source.entry, inner.lesson === undefined && part.lesson !== undefined ? `${part.lesson} ${source.key}` : source.via);
      }
    }
    return via === undefined ? { composed: entry, key, parts } : { composed: entry, key, parts, via };
  }
}

/** The six credit fields, in the contract's order (picked image, or a credit read back from the cache). */
export function creditOf(picked: Credit): Credit {
  return { title: picked.title, author: picked.author, license: picked.license, license_url: picked.license_url, source: picked.source, source_url: picked.source_url };
}

/**
 * credit.author, credit.license and credit.source of an own picture (SK-033 dev 10/11): no outside
 * source, so no third-party licence and no source page. license_url is "" (the app treats an empty
 * string as missing); there is no source_url. In the pack: { title, author, license, license_url,
 * source, changes: [<method>] } (changes "drawn": the app shows it like any change it does not know).
 */
export const OWN_NAME = OWN_LICENSE_NAME;
export const OWN_AUTHOR = OWN_NAME;
export const OWN_LICENSE = OWN_NAME;
export const OWN_SOURCE = OWN_NAME;
export type OwnCredit = { title: string; author: string; license: string; license_url: ""; source: string };
/** Credit of an own picture, also its credit as a part of a composed picture. */
export function ownCredit(title: string): OwnCredit {
  return { title, author: OWN_AUTHOR, license: OWN_LICENSE, license_url: "", source: OWN_SOURCE };
}
export const isOwnCredit = (credit: { source: string }): boolean => credit.source === OWN_SOURCE;
/** Credit of a part of a composed picture: the six fields of a source picture, or an own picture's credit. */
export type PartCredit = Credit | OwnCredit;
export function partCredit(part: ResolvedPart): PartCredit {
  return "own" in part ? ownCredit(part.own.title) : creditOf(part.picked);
}
/** A part credit read back from the cache, in the contract's order. */
export function partCreditOf(credit: PartCredit): PartCredit {
  return isOwnCredit(credit) ? ownCredit(credit.title) : creditOf(credit as Credit);
}
export const sameOwnCredit = (a: OwnCredit, b: OwnCredit) => canonicalJson(a) === canonicalJson(b);

/**
 * credit.author and credit.source of every composed picture (SK-033 dev 10/11). The app shows the
 * author as written and adds "Composed from several images" in the interface language itself
 * (ios-dev 10/11), so the author is only the name.
 */
export const COMPOSED_AUTHOR = "Science Kids";
export const COMPOSED_SOURCE = "composed";
/** Credit of a composed picture: no source_url of its own; parts = the credit of every source picture (an own part: its own credit). */
export type ComposedCredit = { title: string; author: string; license: string; license_url: string; source: typeof COMPOSED_SOURCE; parts: PartCredit[] };

/**
 * title from the selection file; licence = the strictest of the parts: CC BY when one part is CC
 * BY, else "Science Kids" (license_url "") when one part is an own picture, else PD / PDM / CC0.
 */
export function composedCredit(title: string, parts: PartCredit[]): ComposedCredit {
  if (parts.length === 0) throw new Error("hình ghép không có phần nào");
  const strictest = strictestLicense(parts);
  return { title, author: COMPOSED_AUTHOR, license: strictest.license, license_url: strictest.license_url, source: COMPOSED_SOURCE, parts: parts.map(partCreditOf) };
}

export const sameComposedCredit = (a: ComposedCredit, b: ComposedCredit) => canonicalJson(a) === canonicalJson(b);

/** <selection root>/composed/<topic>/<name>.jpg for composed.file content/images/composed/<topic>/<name>.jpg (own.file the same way). */
export function localImagePath(root: string, file: string): string {
  if (!file.startsWith(LOCAL_FILE_PREFIX)) throw new Error(`đường dẫn file hình phải bắt đầu bằng ${LOCAL_FILE_PREFIX}: ${file}`);
  return path.join(root, ...file.slice(LOCAL_FILE_PREFIX.length).split("/"));
}
export const composedFilePath = localImagePath;

/** <root>/<age_group>/<topic_slug>/<lesson_slug>.json, or …/_topic.json for the topic. */
export function selectionFileFor(root: string, ageGroup: string, topicSlug: string, lessonSlug?: string): string {
  return path.join(root, ageGroup, topicSlug, lessonSlug === undefined ? TOPIC_SELECTION : `${lessonSlug}.json`);
}

/** Every *.json under the inputs (a file is taken as is), sorted, no duplicates. */
export function selectionFilesOf(inputs: string[]): { files: string[]; missing: string[] } {
  const files = new Set<string>();
  const missing: string[] = [];
  const walk = (dir: string) => {
    for (const name of readdirSync(dir).sort()) {
      if (name.startsWith(".")) continue;
      const child = path.join(dir, name);
      if (statSync(child).isDirectory()) walk(child);
      else if (name.endsWith(".json")) files.add(child);
    }
  };
  for (const input of inputs) {
    if (!existsSync(input)) missing.push(input);
    else if (statSync(input).isDirectory()) walk(input);
    else files.add(input);
  }
  return { files: [...files].sort(), missing };
}

/** How fetch turns a source file into the pack JPEG (part of the cache key; README "images fetch"). */
export const PROCESS = { max_edge: 1024, format: "jpeg", quality: 82, mozjpeg: true, colourspace: "srgb", alpha_background: "#ffffff", metadata: "none" } as const;
export const IMAGE_CACHE_FORMAT = "science-kids/image@1";

/** Cache key of a picked image: same file, same crop, same processing -> same processed JPEG. */
export function imageCacheKey(picked: Pick<Picked, "file_url" | "crop">): string {
  return sha256Bytes(canonicalJson({ format: IMAGE_CACHE_FORMAT, file_url: picked.file_url, crop: picked.crop ?? null, process: PROCESS }));
}

/** Cache key of a composed picture: the bytes of the designer's file + the processing. */
export function composedCacheKey(fileSha256: string): string {
  return sha256Bytes(canonicalJson({ format: IMAGE_CACHE_FORMAT, composed_sha256: fileSha256, process: PROCESS }));
}

/** Cache key of an own picture: its file in the repo (own.file), the bytes of that file, the processing. */
export function ownCacheKey(file: string, fileSha256: string): string {
  return sha256Bytes(canonicalJson({ format: IMAGE_CACHE_FORMAT, own_file: file, own_sha256: fileSha256, process: PROCESS }));
}
