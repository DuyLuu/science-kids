// `content-cli images search <lesson .md | topic folder>...` (SK-033): for every Image of each
// lesson, look for candidates on Wikimedia Commons and Openverse with the brief's English keywords
// ("Từ khoá tìm ảnh (EN): …", else alt.en), keep only CC0 / public domain / PDM / CC BY, and write
//   <out>/<topic_slug>/<lesson_slug>/candidates.json + candidates.html
// (out defaults to content/.build/images). Nothing is downloaded: thumbnails are hotlinked in the
// HTML. Answers are cached in <out>/.cache/ (Openverse allows 200 anonymous requests a day).
// A composed brief ("[sơ đồ ghép ảnh]", dev 10/11) gets candidates for each source picture it
// names ("Từ khoá tìm ảnh (EN)": one part per query; "Từ khoá cho <phần>: …") and lists the
// pictures it reuses; the page builds a { "composed": … } entry from them.
// A brief for a picture Science Kids draws ("[hình vẽ]", dev 10/11) is not searched: the page
// offers an { "own": … } entry with a suggested file for the designer's drawing.
import { existsSync, mkdirSync, readdirSync, renameSync, writeFileSync } from "node:fs";
import path from "node:path";
import { checkMarkdown } from "../markdown/check.ts";
import { LESSON_NAME } from "../markdown/files.ts";
import { REPO_ROOT } from "../paths.ts";
import { renderCandidatesHtml } from "./candidates-html.ts";
import { normalizeUrl } from "./license.ts";
import { DailyQuota, getJson, HttpError, JsonCache, OPENVERSE_GAP_MS, COMMONS_GAP_MS, realSleep, searchCacheDir, Throttle, type Http, type Sleep } from "./net.ts";
import { loadSelection, selectionFileFor, type Entry, type Own, type Picked, type SameAs } from "./selection.ts";
import { briefKeywords, composedPartSearches, composedReuses, crossReuse, imageRefs, isComposedBrief, isOwnBrief, isReuseBrief, reuseTarget, type ComposedReuse, type Here, type ImageRef } from "./slots.ts";
import { commonsSearchUrl, openverseCategory, openverseSearchUrl, parseCommonsSearch, parseOpenverseSearch, type Candidate, type Found } from "./sources.ts";

export const DEFAULT_PER_IMAGE = 6;
/** Queries per image sent to each source (the first query matters most). */
const COMMONS_QUERIES = 3;
const OPENVERSE_QUERIES = 2;
/** Wait before the one retry of a 5xx answer. */
const RETRY_AFTER_MS = 5000;
/** Commons matches every word: a longer query with no usable result is tried again with its first words. */
const COMMONS_SHORT_WORDS = 3;

export type SearchOptions = {
  inputs: string[];
  contentRoot?: string;
  rulesFile: string;
  minAppVersion: string;
  out: string;
  selectionDir: string;
  perImage: number;
  /** Only these image keys (empty: all). */
  keys: string[];
  /** Ignore the search cache (answers are fetched again and re-cached). */
  refresh: boolean;
  /** Only answers already in the search cache; no request at all (rebuild the page after a code or selection change). */
  cacheOnly?: boolean;
  /** Skip a source. */
  sources: { commons: boolean; openverse: boolean };
  http: Http;
  sleep?: Sleep;
  /** Openverse daily quota file (default <out>/.cache/openverse-usage.json). */
  quotaFile?: string;
  display: (file: string) => string;
  now?: () => Date;
};

export type CandidateOut = Candidate & { selection: Picked };
/** One source picture of a composed brief: its own search. */
export type ComposedPartOut = { name?: string; queries: string[]; candidates: CandidateOut[]; rejected: Record<string, number>; notes: string[] };
/** A composed brief: suggested file and title for the selection entry, a search per part to find, the pictures reused. */
export type ComposedOut = { file: string; title: string; searches: ComposedPartOut[]; reuses: ComposedReuse[] };
export type ImageOut = {
  key: string;
  pointer: string;
  alt: { en: string; vi: string };
  brief?: string;
  queries: string[];
  query_from: "brief" | "alt" | "reuse" | "composed" | "own";
  /** Where the reused picture is (display): an image key of this lesson, or "<topic>/<lesson> <key>". */
  reuse_of?: string;
  /** The selection entry for a reused picture. */
  reuse_entry?: SameAs;
  /** Composed brief: what the designer composes from (candidates stays empty). */
  composed?: ComposedOut;
  /** "[hình vẽ]" brief: the own entry to write once the drawing is saved there (candidates stays empty). */
  own?: Own;
  current?: Entry;
  candidates: CandidateOut[];
  rejected: Record<string, number>;
  notes: string[];
};
export type CandidatesFile = {
  generated_at: string;
  lesson: { id: string; slug: string; title: { en: string; vi: string }; file: string; age_group: string; topic_slug: string };
  selection_file: string;
  selection_exists: boolean;
  sources: string[];
  requests: { commons: number; openverse: number; cached: number };
  images: ImageOut[];
};

/** Entry for the selection file, keys in the schema's order. */
export function selectionEntry(candidate: Candidate): Picked {
  return {
    source: candidate.source,
    ...(candidate.openverse_id ? { openverse_id: candidate.openverse_id } : {}),
    source_url: candidate.source_url,
    file_url: candidate.file_url,
    title: candidate.title,
    author: candidate.author,
    license: candidate.license,
    license_url: candidate.license_url,
  } as Picked;
}

/** Alternate Commons and Openverse (each in its own rank order), no page twice, at most `limit`. */
export function pickCandidates(commons: Candidate[], openverse: Candidate[], limit: number): Candidate[] {
  const seen = new Set<string>();
  const unique = (list: Candidate[]) =>
    list.filter((candidate) => {
      const id = normalizeUrl(candidate.source_url);
      if (seen.has(id)) return false;
      seen.add(id);
      return true;
    });
  const a = unique(commons);
  const b = unique(openverse);
  const out: Candidate[] = [];
  for (let i = 0; out.length < limit && (i < a.length || i < b.length); i++) {
    if (i < a.length) out.push(a[i]!);
    if (out.length < limit && i < b.length) out.push(b[i]!);
  }
  return out;
}

/** "giấy phép CC BY-SA 4.0: không nhận …" -> counted under its first clause. */
function rejectionGroup(reason: string): string {
  return reason.split(":")[0]!.trim();
}

export async function runImagesSearch(options: SearchOptions): Promise<number> {
  const sleep = options.sleep ?? realSleep;
  const now = options.now ?? (() => new Date());
  const report = checkMarkdown({
    inputs: options.inputs,
    contentRoot: options.contentRoot,
    rulesFile: options.rulesFile,
    minAppVersion: options.minAppVersion,
    display: options.display,
    idsCommand: (file) => `ids ${file}`,
  });
  if (!report.ok) {
    for (const message of report.messages) console.log(message);
    return report.exit;
  }

  const cacheRoot = searchCacheDir(options.out);
  const cache = { commons: new JsonCache(path.join(cacheRoot, "commons")), openverse: new JsonCache(path.join(cacheRoot, "openverse")) };
  const quota = new DailyQuota(options.quotaFile ?? path.join(cacheRoot, "openverse-usage.json"));
  const throttle = { commons: new Throttle(COMMONS_GAP_MS, sleep), openverse: new Throttle(OPENVERSE_GAP_MS, sleep) };
  const requests = { commons: 0, openverse: 0, cached: 0 };
  let openverseOff: string | undefined = options.sources.openverse ? undefined : "tắt bằng --sources";

  /** One search answer: from the cache unless --refresh; Openverse within the daily quota. */
  async function answer(origin: "commons" | "openverse", url: string): Promise<unknown> {
    if (!options.refresh) {
      const hit = cache[origin].get(url);
      if (hit !== undefined) {
        requests.cached++;
        return hit;
      }
    }
    if (options.cacheOnly) throw new Error(`${origin === "commons" ? "Commons" : "Openverse"}: chưa có trong cache (--cache-only)`);
    if (origin === "openverse") {
      if (openverseOff) throw new Error(`Openverse: ${openverseOff}`);
      if (!quota.take()) {
        openverseOff = `hết ${quota.limit} lượt hôm nay (giới hạn khi không có khoá); chạy lại ngày mai, kết quả đã tìm vẫn nằm trong cache`;
        throw new Error(`Openverse: ${openverseOff}`);
      }
    }
    for (let attempt = 1; ; attempt++) {
      await throttle[origin].wait();
      requests[origin]++;
      try {
        const body = await getJson(options.http, url);
        cache[origin].put(url, body);
        return body;
      } catch (error) {
        if (origin === "openverse" && error instanceof HttpError && error.status === 429) {
          openverseOff = "Openverse trả 429 (quá nhanh hoặc hết lượt); dừng Openverse cho lần chạy này";
        }
        // 5xx (Openverse answers 504 when a search takes too long): wait and try once more.
        const retry = attempt === 1 && error instanceof HttpError && error.status >= 500 && (origin === "commons" || quota.take());
        if (!retry) throw error;
        await sleep(RETRY_AFTER_MS);
      }
    }
  }

  let total = 0;
  let failedLessons = 0;
  for (const topic of report.topics) {
    if (topic.stepReached < 3) {
      console.log(`${options.display(topic.dir)}: còn lỗi markdown hoặc content-schema; chạy validate, sửa rồi tìm ảnh`);
      failedLessons += topic.lessons.length;
      continue;
    }
    const topicData = topic.topic.data as { age_group: string; slug: string };
    for (const lesson of topic.lessons) {
      const data = lesson.data as { id: string; slug: string; order: number; title: { en: string; vi: string } };
      const here: Here = { topic: topicData.slug, slug: data.slug, order: data.order };
      const refs = imageRefs("lesson", data);
      const wanted = options.keys.length > 0 ? refs.filter((ref) => options.keys.includes(ref.key)) : refs;
      const selectionFile = selectionFileFor(options.selectionDir, topicData.age_group, topicData.slug, data.slug);
      const current = existsSync(selectionFile) ? loadSelection(selectionFile) : undefined;
      if (current && !current.selection) {
        console.log(`${options.display(selectionFile)}: file chọn ảnh chưa hợp lệ (${current.errors.map((e) => `${e.pointer || "/"} ${e.message}`).join("; ")}); trang ứng viên không hiện lựa chọn cũ`);
      }
      console.log(`${lesson.doc.display}: ${wanted.length} hình${options.keys.length > 0 ? ` (lọc theo --key)` : ""}`);
      const images: ImageOut[] = [];
      for (const ref of wanted) {
        images.push(await searchOne(ref, refs, current?.selection?.images[ref.key], here, topic.dir));
        total++;
      }
      const out: CandidatesFile = {
        generated_at: now().toISOString(),
        lesson: { id: data.id, slug: data.slug, title: { en: data.title.en, vi: data.title.vi }, file: path.relative(REPO_ROOT, lesson.doc.path), age_group: topicData.age_group, topic_slug: topicData.slug },
        selection_file: path.relative(REPO_ROOT, selectionFile),
        selection_exists: current?.selection !== undefined,
        sources: [options.sources.commons ? "Wikimedia Commons" : undefined, options.sources.openverse ? "Openverse" : undefined].filter((name): name is string => name !== undefined),
        requests: { ...requests },
        images,
      };
      const dir = path.join(options.out, topicData.slug, data.slug);
      mkdirSync(dir, { recursive: true });
      const writeAtomic = (name: string, text: string) => {
        writeFileSync(path.join(dir, `${name}.part`), text);
        renameSync(path.join(dir, `${name}.part`), path.join(dir, name));
      };
      writeAtomic("candidates.json", `${JSON.stringify(out, null, 2)}\n`);
      writeAtomic("candidates.html", renderCandidatesHtml(out, current?.selection?.images ?? {}));
      const reused = images.filter((image) => image.reuse_of !== undefined).length;
      const composed = images.filter((image) => image.composed !== undefined).length;
      const own = images.filter((image) => image.own !== undefined).length;
      const empty = images.filter((image) => image.reuse_of === undefined && image.composed === undefined && image.own === undefined && image.candidates.length === 0).length;
      console.log(
        `  ${images.length - reused - composed - own - empty} hình có ứng viên · ${reused} dùng lại hình khác${composed > 0 ? ` · ${composed} hình ghép` : ""}${own > 0 ? ` · ${own} hình tự vẽ` : ""} · ${empty} chưa có ứng viên\n` +
          `  ${options.display(path.join(dir, "candidates.html"))}\n  ${options.display(path.join(dir, "candidates.json"))}`,
      );
    }
  }
  console.log(
    `\nimages search: ${total} hình · gọi Commons ${requests.commons}, Openverse ${requests.openverse} (hôm nay đã dùng ${quota.used()}/${quota.limit}), lấy từ cache ${requests.cached}` +
      (openverseOff && options.sources.openverse ? `\nOpenverse: ${openverseOff}` : "") +
      `\nTiếp theo: mở candidates.html, chọn ảnh (xem trang gốc: giấy phép, không mặt người nhận ra được, không logo), chép JSON vào file chọn ảnh, rồi chạy images fetch.`,
  );
  return failedLessons > 0 ? 1 : 0;

  async function searchOne(ref: ImageRef, refs: ImageRef[], current: Entry | undefined, here: Here, topicDir: string): Promise<ImageOut> {
    const base = { key: ref.key, pointer: ref.pointer, alt: ref.image.alt, ...(ref.image.brief !== undefined ? { brief: ref.image.brief } : {}), ...(current ? { current } : {}) };
    const reused = (reuseOf: string, entry: SameAs): ImageOut => {
      console.log(`  ${ref.key}: dùng lại hình của ${reuseOf}`);
      return { ...base, queries: [], query_from: "reuse", reuse_of: reuseOf, reuse_entry: entry, candidates: [], rejected: {}, notes: [] };
    };
    const notes: string[] = [];
    // "[sơ đồ ghép ảnh] …": a picture per part, before reading it as a reuse brief.
    if (isComposedBrief(ref.image.brief)) return searchComposed(ref, refs, here, base, notes);
    // "Dùng lại hình `<key>` ở bài `<topic>/<lesson>`": the picture chosen for that lesson.
    const cross = crossReuse(ref.image.brief, here);
    if (cross) {
      const topicSlug = cross.lesson.topic ?? here.topic!;
      let slug = cross.lesson.slug;
      if (slug === undefined && cross.lesson.order !== undefined && topicSlug === here.topic) {
        const order = String(cross.lesson.order).padStart(2, "0");
        const name = readdirSync(topicDir).find((file) => LESSON_NAME.exec(file)?.[1] === order);
        slug = name ? LESSON_NAME.exec(name)![2] : undefined;
      }
      const token = cross.tokens[0];
      if (slug !== undefined && token !== undefined) return reused(`${topicSlug}/${slug} ${token}`, { same_as: token, lesson: `${topicSlug}/${slug}` });
      notes.push("brief dùng lại hình của bài khác nhưng không rõ bài hoặc key; tìm như hình mới");
    }
    // "Dùng lại hình `<key>`" in this lesson: follow the chain to a picture of its own.
    let target = reuseTarget(ref.image.brief, refs, ref.key, here);
    for (let hops = 0; target !== undefined && hops < 5; hops++) {
      const next = refs.find((other) => other.key === target);
      if (!next || !isReuseBrief(next.image.brief)) break;
      const further = reuseTarget(next.image.brief, refs, next.key, here);
      if (further === undefined || further === ref.key) break;
      target = further;
    }
    if (target !== undefined) return reused(target, { same_as: target });
    // "[hình vẽ] …": Science Kids draws it; nothing to search.
    if (isOwnBrief(ref.image.brief)) {
      const own: Own = { own: { file: `content/images/own/${here.topic}/${here.slug}.${ref.key}.jpg`, method: "drawn" }, title: ref.image.alt.en };
      console.log(`  ${ref.key}: hình tự vẽ, không tìm · file đề xuất ${own.own.file}`);
      return { ...base, queries: [], query_from: "own", own, candidates: [], rejected: {}, notes };
    }
    const keywords = briefKeywords(ref.image.brief);
    const queries = keywords ?? [ref.image.alt.en];
    if (!keywords) notes.push(`brief chưa có "Từ khoá tìm ảnh (EN)", tìm bằng alt.en`);
    const found = await findCandidates(queries, openverseCategory(ref.image.brief), notes);
    console.log(`  ${ref.key}: ${found.candidates.length} ứng viên ("${queries.join('", "')}")${notes.length > 0 ? ` · ${notes.join(" · ")}` : ""}`);
    return { ...base, queries, query_from: keywords ? "brief" : "alt", candidates: found.candidates, rejected: found.rejected, notes };
  }

  /** A composed brief: one search per part to find (perImage candidates each), the reused pictures listed. */
  async function searchComposed(ref: ImageRef, refs: ImageRef[], here: Here, base: Pick<ImageOut, "key" | "pointer" | "alt" | "brief" | "current">, notes: string[]): Promise<ImageOut> {
    const searches = composedPartSearches(ref.image.brief);
    const reuses = composedReuses(ref.image.brief, refs, ref.key, here);
    if (searches.length === 0 && reuses.length === 0) {
      searches.push({ queries: [ref.image.alt.en] });
      notes.push(`brief ghép chưa có "Từ khoá tìm ảnh (EN)" hay hình dùng lại, tìm bằng alt.en`);
    }
    const category = openverseCategory(ref.image.brief);
    const parts: ComposedPartOut[] = [];
    for (const search of searches) {
      const partNotes: string[] = [];
      const found = await findCandidates(search.queries, category, partNotes);
      parts.push({ ...(search.name !== undefined ? { name: search.name } : {}), queries: search.queries, candidates: found.candidates, rejected: found.rejected, notes: partNotes });
    }
    const file = `content/images/composed/${here.topic}/${here.slug}.${ref.key}.jpg`;
    console.log(
      `  ${ref.key}: hình ghép · ${parts.length} ảnh cần tìm (${parts.map((part) => `${part.candidates.length} ứng viên`).join(", ") || "không có"}) · ${reuses.length} ảnh dùng lại${reuses.length > 0 ? ` (${reuses.map((reuse) => reuse.of).join(", ")})` : ""}` +
        (notes.length > 0 ? ` · ${notes.join(" · ")}` : ""),
    );
    return {
      ...base,
      queries: parts.flatMap((part) => part.queries),
      query_from: "composed",
      composed: { file, title: ref.image.alt.en, searches: parts, reuses },
      candidates: [],
      rejected: {},
      notes,
    };
  }

  /** Commons and Openverse for one picture: candidates (alternating, at most perImage), rejections by reason; errors go to notes. */
  async function findCandidates(queries: string[], category: string | undefined, notes: string[]): Promise<{ candidates: CandidateOut[]; rejected: Record<string, number> }> {
    const all: Record<"commons" | "openverse", Found> = { commons: { candidates: [], rejected: [] }, openverse: { candidates: [], rejected: [] } };
    const plan: ["commons" | "openverse", string][] = [
      ...(options.sources.commons ? queries.slice(0, COMMONS_QUERIES).map((q) => ["commons", q] as ["commons", string]) : []),
      ...(options.sources.openverse ? queries.slice(0, OPENVERSE_QUERIES).map((q) => ["openverse", q] as ["openverse", string]) : []),
    ];
    for (const [origin, query] of plan) {
      try {
        let found = origin === "commons" ? parseCommonsSearch(await answer(origin, commonsSearchUrl(query)), query) : parseOpenverseSearch(await answer(origin, openverseSearchUrl(query, category)), query);
        const words = query.split(/\s+/).filter(Boolean);
        if (origin === "commons" && found.candidates.length === 0 && words.length > COMMONS_SHORT_WORDS) {
          const short = words.slice(0, COMMONS_SHORT_WORDS).join(" ");
          const retry = parseCommonsSearch(await answer(origin, commonsSearchUrl(short)), short);
          found = { candidates: retry.candidates, rejected: [...found.rejected, ...retry.rejected] };
        }
        all[origin].candidates.push(...found.candidates);
        all[origin].rejected.push(...found.rejected);
      } catch (error) {
        const message = (error as Error).message;
        if (!notes.includes(message)) notes.push(message);
      }
    }
    const picked = pickCandidates(all.commons.candidates, all.openverse.candidates, options.perImage);
    const rejected: Record<string, number> = {};
    for (const entry of [...all.commons.rejected, ...all.openverse.rejected]) {
      const group = rejectionGroup(entry.reason);
      rejected[group] = (rejected[group] ?? 0) + 1;
    }
    return { candidates: picked.map((candidate) => ({ ...candidate, selection: selectionEntry(candidate) })), rejected };
  }
}
