// Every Image of a topic/lesson (located through the JSON Schema, like Spoken) with its stable
// key (SK-033): the key the image selection file (content/images/…/<lesson>.json) uses.
//
// Key = the `key` of every keyed object on the path from the document root to the Image, joined
// with ".", prefixed with the root section name except for warmup, quiz and play (their own keys,
// w1 / q3 / tray, already say where they are). An array element without `key` adds its index.
//   /quiz/2                 image -> q3              /quiz/2/options/1     -> q3.q3_river
//   /quiz/1/bank/0          image -> q2.q2_piece     /play/items/4         -> tray.tray_sea
//   /learn/0/groups/1       image -> learn.explore.explore_water
//   /vocab/3                image -> vocab.model     /reward/collectible   -> reward.ha_long
// content-schema makes every key unique inside a lesson, so the image key is unique too.
// Pure: no I/O.
import { getAt, parsePointer } from "../json-pointer.ts";
import { locateCommon, type ContentKind } from "../spoken.ts";

export type ImageNode = { alt: { en: string; vi: string }; brief?: string; asset?: string };
export type ImageRef = {
  /** JSON pointer of the Image object. */
  pointer: string;
  /** Stable key, e.g. "q3.q3_river". */
  key: string;
  /** `key` of the nearest keyed object above the Image (q3_river, tray_sea, explore_land). */
  owner: string | undefined;
  image: ImageNode;
};

/** Root sections whose own keys (w1, q3, tray) already name the place: no prefix. */
const UNPREFIXED = new Set(["warmup", "quiz", "play"]);

const isObject = (value: unknown): value is Record<string, unknown> => value !== null && typeof value === "object" && !Array.isArray(value);

/** Stable key of the Image at `pointer` (see the header). */
export function imageKeyOf(doc: unknown, pointer: string): { key: string; owner: string | undefined } {
  const tokens = parsePointer(pointer);
  const parts: string[] = [];
  let node: unknown = doc;
  let owner: string | undefined;
  tokens.slice(0, -1).forEach((token, depth) => {
    const parent = node;
    node = (node as Record<string, unknown>)[token];
    if (depth === 0 && !UNPREFIXED.has(token)) parts.push(token);
    const key = isObject(node) && typeof node.key === "string" ? node.key : undefined;
    if (key !== undefined) {
      parts.push(key);
      owner = key;
    } else if (Array.isArray(parent)) {
      parts.push(token);
    }
  });
  return { key: parts.length > 0 ? parts.join(".") : tokens.join("."), owner };
}

/** Every Image of a (schema-valid) document, in document order, with its key. */
export function imageRefs(kind: ContentKind, doc: unknown): ImageRef[] {
  return locateCommon(kind, doc, "Image").map((pointer) => ({ pointer, ...imageKeyOf(doc, pointer), image: getAt(doc, pointer) as ImageNode }));
}

/** Keys used twice (cannot happen in schema-valid content; build checks anyway). */
export function duplicateKeys(refs: ImageRef[]): string[] {
  const seen = new Set<string>();
  const twice = new Set<string>();
  for (const ref of refs) (seen.has(ref.key) ? twice : seen).add(ref.key);
  return [...twice];
}

/** The line the brief must carry (content/TEMPLATE.md mục A "Hình (SK-033)"), at the end of the brief line. */
export const KEYWORDS_LABEL = "Từ khoá tìm ảnh (EN):";
/** "Từ khoá tìm ảnh (EN):" and "Từ khóa tìm ảnh (EN):", any case, flexible spaces. */
const KEYWORDS = /từ\s+kh(?:oá|óa|oa)\s+tìm\s+ảnh\s*\(\s*en\s*\)\s*:\s*/iu;
/** A brief that reuses the picture of another place: "Dùng lại hình `tray_sea`." */
const REUSE = /^\s*(?:\[[^\]]*\]\s*)?dùng\s+lại(?:\s|$)/iu;
/** A key as briefs write it: an owner key (tray_sea), an item key (q3) or an image key (tray.tray_sea). */
const KEY_TOKEN = /^[a-z][a-z0-9_]*(?:\.[a-z0-9_]+)*$/;
/** Queries longer than this that contain commas are split at the commas too (Khủng long briefs). */
const LONG_QUERY_WORDS = 6;

/**
 * Search queries of a brief: what follows "Từ khoá tìm ảnh (EN):" up to the end of the line,
 * split at ";" (each part is one query, the first matters most); a part of more than six words
 * that contains commas is split at the commas as well. Undefined when the brief has no such
 * line or nothing after it.
 */
export function briefKeywords(brief: string | undefined): string[] | undefined {
  if (brief === undefined) return undefined;
  const text = brief.normalize("NFC");
  const match = KEYWORDS.exec(text);
  if (!match) return undefined;
  const rest = text.slice(match.index + match[0].length).split(/\r?\n/)[0] ?? "";
  const clean = (part: string) => part.trim().replace(/[.…]+$/u, "").trim();
  const words = (part: string) => part.split(/\s+/).filter(Boolean).length;
  const queries = rest
    .split(";")
    .flatMap((part) => (part.includes(",") && words(part) > LONG_QUERY_WORDS ? part.split(",") : [part]))
    .map(clean)
    .filter((part) => /[\p{L}\p{N}]/u.test(part));
  return queries.length > 0 ? queries : undefined;
}

export function isReuseBrief(brief: string | undefined): boolean {
  return brief !== undefined && REUSE.test(brief.normalize("NFC"));
}

/** Where a reused picture lives, as the brief says it. */
export type ReuseRef = {
  /** Keys named in the "Dùng lại …" sentence, best first (backticked, then tokens with "_"). */
  tokens: string[];
  /** Another lesson: `<topic>/<lesson>` or `<lesson>` in backticks, or "ở bài một" (order in the same topic). */
  lesson?: { topic?: string; slug?: string; order?: number };
};
/** Where the current document is (to tell "another lesson" from this one). */
export type Here = { topic?: string; slug?: string; order?: number };

const ORDINALS: Readonly<Record<string, number>> = { một: 1, hai: 2, ba: 3, bốn: 4, tư: 4, năm: 5, sáu: 6, bảy: 7, tám: 8, chín: 9, mười: 10 };
/** "02-cac-chau-luc" (file name) -> "cac-chau-luc" (slug). */
const stripOrder = (slug: string) => slug.replace(/^\d{2}-/, "").replace(/\.md$/, "");

/**
 * Reads a "Dùng lại …" brief (content/TEMPLATE.md): "Dùng lại hình `<key>`.", "Dùng lại hình
 * `<key>` ở bài `<topic>/<lesson>`.", "Dùng lại hình `<lesson>/<key>`", and the older free form
 * "Dùng lại hình bát cơm của món tray_rice (ở bài một)". Only the sentence before "Từ khoá tìm
 * ảnh" is read (a reuse brief may copy the keywords of the original). Undefined when the brief is
 * not a reuse brief.
 */
export function parseReuse(brief: string | undefined): ReuseRef | undefined {
  if (!isReuseBrief(brief)) return undefined;
  const text = brief!.normalize("NFC");
  const keywords = KEYWORDS.exec(text);
  let head = keywords ? text.slice(0, keywords.index) : text;
  let lesson: ReuseRef["lesson"];
  const named = /(?:ở|của|trong)\s+bài\s+`([^`]+)`/iu.exec(head);
  if (named) {
    const parts = named[1]!.trim().split("/");
    lesson = parts.length >= 2 ? { topic: parts[parts.length - 2], slug: stripOrder(parts[parts.length - 1]!) } : { slug: stripOrder(parts[0]!) };
    head = head.replace(named[0], " ");
  } else {
    const ordinal = /(?:ở|của|trong)\s+bài\s+(\d{1,2}|một|hai|ba|bốn|tư|năm|sáu|bảy|tám|chín|mười)(?![\p{L}\p{N}])/iu.exec(head);
    if (ordinal) {
      const word = ordinal[1]!.toLowerCase();
      lesson = { order: /^\d+$/.test(word) ? Number(word) : ORDINALS[word] };
    }
  }
  const tokens: string[] = [];
  for (const match of head.matchAll(/`([^`]+)`/g)) {
    const parts = match[1]!.trim().split("/");
    const last = parts[parts.length - 1]!;
    if (!KEY_TOKEN.test(last)) continue;
    tokens.push(last);
    if (!lesson && parts.length === 2) lesson = { slug: stripOrder(parts[0]!) };
    if (!lesson && parts.length >= 3) lesson = { topic: parts[parts.length - 3], slug: stripOrder(parts[parts.length - 2]!) };
  }
  if (tokens.length === 0) {
    const words = head.split(/[\s,;:()"'“”‘’]+/u).map((word) => word.replace(/\.+$/, "")).filter((word) => KEY_TOKEN.test(word));
    tokens.push(...words.filter((word) => word.includes("_")), ...words.filter((word) => !word.includes("_")));
  }
  return { tokens, ...(lesson ? { lesson } : {}) };
}

/** The brief points to a picture of another lesson (undefined: same document, or not a reuse brief). */
export function crossReuse(brief: string | undefined, here: Here): (ReuseRef & { lesson: NonNullable<ReuseRef["lesson"]> }) | undefined {
  const reuse = parseReuse(brief);
  if (!reuse?.lesson) return undefined;
  const { topic, slug, order } = reuse.lesson;
  const sameTopic = topic === undefined || topic === here.topic;
  const sameLesson = (slug !== undefined && slug === here.slug) || (order !== undefined && order === here.order);
  return sameTopic && sameLesson ? undefined : (reuse as ReuseRef & { lesson: NonNullable<ReuseRef["lesson"]> });
}

/** Image key of `token` among refs: the key itself, the owner key, or the last part of a key. */
export function findRef(refs: ImageRef[], token: string, selfKey?: string): ImageRef | undefined {
  const others = refs.filter((ref) => ref.key !== selfKey);
  return others.find((ref) => ref.key === token) ?? others.find((ref) => ref.owner === token) ?? others.find((ref) => ref.key.endsWith(`.${token}`));
}

/**
 * For a "Dùng lại …" brief about this document: the image key of the place it names. Undefined
 * when the brief is not a reuse brief, names another lesson (crossReuse) or names no key here.
 */
export function reuseTarget(brief: string | undefined, refs: ImageRef[], selfKey: string, here: Here = {}): string | undefined {
  const reuse = parseReuse(brief);
  if (!reuse || crossReuse(brief, here)) return undefined;
  for (const token of reuse.tokens) {
    const target = findRef(refs, token, selfKey);
    if (target) return target.key;
  }
  return undefined;
}

// ---------- own pictures (dev 10/11) ----------

/** "[hình vẽ]", "[hình tự vẽ]", "[tự vẽ]": Science Kids draws this picture (no search). */
const OWN_LABEL = /^\s*\[\s*(?:hình\s+)?(?:tự\s+)?vẽ\s*\]/iu;

/**
 * A brief for a picture Science Kids draws itself (Duy 10/11: an object with no valid free
 * picture gets a drawing): label "[hình vẽ]" (or "[hình tự vẽ]", "[tự vẽ]"). No search keywords
 * needed; the brief describes what to draw. A reuse brief or a composed brief stays what it is.
 */
export function isOwnBrief(brief: string | undefined): boolean {
  return brief !== undefined && OWN_LABEL.test(brief.normalize("NFC"));
}

// ---------- composed pictures (dev 10/11) ----------

/** "[sơ đồ ghép ảnh]", "[ảnh ghép]", "[hình ghép]"…: the label in brackets says "ghép". */
const COMPOSED_LABEL = /^\s*\[[^\]]*ghép[^\]]*\]/iu;
/** No such label, but the brief itself starts with "Ghép …", "Hình ghép …", "Ảnh ghép …", "Sơ đồ ghép …". */
const COMPOSED_START = /^\s*(?:\[[^\]]*\]\s*)?(?:hình\s+|ảnh\s+|sơ\s+đồ\s+)?ghép(?![\p{L}\p{N}])/iu;
/** "Từ khoá cho <part>: <keywords>." names the search words of one more part (content/TEMPLATE.md, Trái Đất bài năm). */
const PART_KEYWORDS = /từ\s+kh(?:oá|óa|oa)\s+cho\s+([^:\n]{1,60}?)\s*:\s*(.+?)(?=\.\s|\.$|\n|$|\s+từ\s+kh(?:oá|óa|oa)\s)/giu;
/** "`<key>` ở bài `<topic>/<lesson>`" -> "`<topic>/<lesson>/<key>`", one token per reused picture. */
const KEY_IN_LESSON = /`([a-z0-9_.]+)`\s+(?:ở|của|trong)\s+bài\s+`([^`]+)`/giu;

/**
 * A brief for a picture the designer composes from several source pictures (SK-033 dev 10/11):
 * label "[sơ đồ ghép ảnh]" (or any label with "ghép"), or a brief that starts with "Ghép …".
 * A puzzle piece ("mảnh ghép") or a brief that only mentions another composed picture is not one.
 */
export function isComposedBrief(brief: string | undefined): boolean {
  if (brief === undefined) return false;
  const text = brief.normalize("NFC");
  return COMPOSED_LABEL.test(text) || COMPOSED_START.test(text);
}

/** One source picture to search for: the brief's own words (unnamed) or "Từ khoá cho <name>: …". */
export type ComposedPartSearch = { name?: string; queries: string[] };

/**
 * Source pictures of a composed brief that need a search: every query of "Từ khoá tìm ảnh (EN): …"
 * is one part (the parts are different pictures, not alternatives), then every "Từ khoá cho
 * <part>: <a>; <b>." (one part, alternatives split at ";"). Empty when the brief names none.
 */
export function composedPartSearches(brief: string | undefined): ComposedPartSearch[] {
  if (brief === undefined) return [];
  const text = brief.normalize("NFC");
  const parts: ComposedPartSearch[] = (briefKeywords(text) ?? []).map((query) => ({ queries: [query] }));
  for (const match of text.matchAll(PART_KEYWORDS)) {
    const queries = match[2]!
      .split(";")
      .map((part) => part.trim().replace(/[.…]+$/u, "").trim())
      .filter((part) => /[\p{L}\p{N}]/u.test(part));
    if (queries.length > 0) parts.push({ name: match[1]!.trim(), queries });
  }
  return parts;
}

/** A source picture of a composed brief that reuses a picture already chosen: the same_as part for the selection file. */
export type ComposedReuse = { token: string; part: { same_as: string; lesson?: string }; of: string };

/**
 * Pictures a composed brief reuses: every key in backticks that names an image of this lesson
 * (`tray_eggshell`, `explore_crust`) or of another lesson (`<lesson>/<key>`, `<topic>/<lesson>/<key>`,
 * "`<key>` ở bài `<topic>/<lesson>`"). Backticked words that name nothing here, and pictures of
 * this lesson that themselves reuse this one, are skipped.
 * Only the text before "Từ khoá tìm ảnh (EN)" is read.
 */
export function composedReuses(brief: string | undefined, refs: ImageRef[], selfKey: string, here: Here = {}): ComposedReuse[] {
  if (brief === undefined) return [];
  const text = brief.normalize("NFC");
  const keywords = KEYWORDS.exec(text);
  const head = (keywords ? text.slice(0, keywords.index) : text).replace(KEY_IN_LESSON, (_whole, key: string, lesson: string) => `\`${lesson.trim()}/${key}\``);
  const out: ComposedReuse[] = [];
  const seen = new Set<string>();
  const push = (reuse: ComposedReuse) => {
    const id = `${reuse.part.lesson ?? ""} ${reuse.part.same_as}`;
    if (seen.has(id)) return;
    seen.add(id);
    out.push(reuse);
  };
  for (const match of head.matchAll(/`([^`]+)`/g)) {
    const token = match[1]!.trim();
    const parts = token.split("/");
    const key = parts[parts.length - 1]!;
    if (!KEY_TOKEN.test(key)) continue;
    if (parts.length >= 2) {
      const topic = parts.length >= 3 ? parts[parts.length - 3] : here.topic;
      const slug = stripOrder(parts[parts.length - 2]!);
      const sameLesson = topic === here.topic && slug === here.slug;
      if (!sameLesson) {
        if (topic !== undefined) push({ token, part: { same_as: key, lesson: `${topic}/${slug}` }, of: `${topic}/${slug} ${key}` });
        continue;
      }
    }
    const ref = findRef(refs, key, selfKey);
    // "… vì câu q1 và từ vựng `palaeontologist` dùng lại": a picture that reuses this one is not a part of it.
    if (!ref || (isReuseBrief(ref.image.brief) && reuseTarget(ref.image.brief, refs, ref.key, here) === selfKey)) continue;
    push({ token, part: { same_as: ref.key }, of: ref.key });
  }
  return out;
}
