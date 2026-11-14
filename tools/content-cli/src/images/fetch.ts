// `content-cli images fetch <selection file | folder>...` (SK-033): for every picked image of the
// selection files, check the licence again at the source, download the file, process it (EXIF
// rotation, crop, longest edge <= 1024 px, sRGB, JPEG q82, no metadata) and store it in the image
// cache (content/.images/<sha256>.jpg + index.json with the credit). A licence that changed, or no
// longer fits the rule, is an error and the picture is not used.
//   Commons:   imageinfo + extmetadata of the file page; file_url must still be the file's URL.
//   Openverse: the image's detail record (licence, url, landing page must match the selection);
//              a landing page on Commons is checked at Commons too. Other providers (Flickr…) are
//              only checked through Openverse: fetch says so, a person confirms on the source page.
// A composed picture (dev 10/11): every part is checked and fetched like a picked image (so the
// designer has the processed parts in content/.images to compose from); then the designer's file
// (composed.file, in the repo) is processed the same way and cached with the credit of every part.
// No file yet: "chờ ghép" with the part files to use, not an error (build keeps the placeholder).
// An own picture (dev 10/11): a file Science Kids made (own.file, in the repo). No source, no
// network: the file must be there; it is processed the same way and cached with the credit
// "Science Kids". It can be a part of a composed picture (processed before the composed ones).
// Light on Wikimedia (dev 10/11): a Commons file is downloaded as Commons' 1280 px copy (thumburl
// of the same imageinfo call that checks the licence), never the large original; downloads from
// upload.wikimedia.org are 3 s apart; a 429/503 is retried after Retry-After (net.ts politeHttp).
import { existsSync, readFileSync } from "node:fs";
import path from "node:path";
import sharp from "sharp";
import { sha256Bytes } from "../audio.ts";
import { ImageCache, isComposedEntry, isOwnEntry, isSourceEntry, type ComposedEntry, type ImageEntry, type OwnEntry } from "./cache.ts";
import { commonsTitle, normalizeUrl, plainText } from "./license.ts";
import {
  COMMONS_FETCH_GAP_MS,
  COMMONS_GAP_MS,
  DailyQuota,
  getImage,
  getJson,
  OPENVERSE_GAP_MS,
  politeHttp,
  realSleep,
  Throttle,
  WIKIMEDIA_UPLOAD_GAP_MS,
  WIKIMEDIA_UPLOAD_HOST,
  type Http,
  type Sleep,
} from "./net.ts";
import { processImage } from "./process.ts";
import { selectionShapeWarnings } from "./aspect-report.ts";
import {
  composedCacheKey,
  composedCredit,
  creditOf,
  imageCacheKey,
  isOwn,
  isPicked,
  isSameAs,
  ownCacheKey,
  ownCredit,
  partCredit,
  PROCESS,
  sameComposedCredit,
  sameOwnCredit,
  SelectionSet,
  selectionFilesOf,
  type ComposedCredit,
  type Credit,
  type Own,
  type OwnCredit,
  type Picked,
  type ResolvedComposed,
  type ResolvedPart,
} from "./selection.ts";
import { commonsCredit, commonsDownloadUrl, commonsFileInfoUrl, COMMONS_THUMB_WIDTH, openverseCandidate, openverseDetailUrl, parseCommonsFile, type CommonsFile } from "./sources.ts";

export type FetchOptions = {
  inputs: string[];
  cacheDir: string;
  force: boolean;
  http: Http;
  sleep?: Sleep;
  quotaFile: string;
  display: (file: string) => string;
  now?: () => Date;
};

type Use = { file: string; key: string };
type Job = { cacheKey: string; picked: Picked; uses: Use[] };
type ComposedJob = { path: string; set: SelectionSet; resolved: ResolvedComposed; credit: ComposedCredit; uses: Use[] };
type OwnJob = { path: string; own: Own; credit: OwnCredit; uses: Use[] };
type Verified = { downloadUrl: string; via: string[]; license: string; authorAtSource: string; notes: string[] };

class Refused extends Error {}

export const sameCredit = (a: Credit, b: Credit) =>
  a.title === b.title && a.author === b.author && a.license === b.license && a.license_url === b.license_url && a.source === b.source && a.source_url === b.source_url;

const sameText = (a: string, b: string) => plainText(a).toLowerCase() === plainText(b).toLowerCase();

/**
 * CC BY: the credit keeps the title the source gives (CC BY 2.0 and 3.0 ask for it). CC0, public
 * domain and PDM: the chooser may write a neutral title (content/TEMPLATE.md, SK-033).
 */
function checkTitle(picked: Picked, license: string, sourceTitle: string) {
  if (license.startsWith("CC BY") && !sameText(picked.title, sourceTitle)) {
    throw new Refused(`${license}: title phải giữ như nguồn ghi ("${sourceTitle}"), file chọn ghi "${picked.title}"; chỉ ảnh CC0, public domain, PDM mới được đặt tên khác`);
  }
}

export async function runImagesFetch(options: FetchOptions): Promise<number> {
  const sleep = options.sleep ?? realSleep;
  const now = options.now ?? (() => new Date());
  const { files, missing } = selectionFilesOf(options.inputs);
  for (const input of missing) console.log(`${options.display(input)} / không tìm thấy file`);
  if (missing.length > 0) return 1;
  if (files.length === 0) {
    console.log("Không có file chọn ảnh (.json) nào trong đầu vào.");
    return 1;
  }

  // 1. Read every selection file; group the picked images by cache key (one download each).
  //    A same_as to another lesson ("lesson") brings in that lesson's picked image too, so
  //    fetching one file is enough for build. Files are <root>/<age_group>/<topic>/<lesson>.json.
  let errors = 0;
  const jobs = new Map<string, Job>();
  const composedJobs = new Map<string, ComposedJob>();
  const ownJobs = new Map<string, OwnJob>();
  const sets = new Map<string, SelectionSet>();
  const addJob = (picked: Picked, use: Use) => {
    const cacheKey = imageCacheKey(picked);
    const job = jobs.get(cacheKey);
    if (!job) jobs.set(cacheKey, { cacheKey, picked, uses: [use] });
    else if (!sameCredit(creditOf(job.picked), creditOf(picked)) || job.picked.openverse_id !== picked.openverse_id) {
      console.log(`${use.file} /images/${use.key} cùng file ảnh với ${job.uses[0]!.file} ${job.uses[0]!.key} nhưng ghi nguồn hoặc giấy phép khác; chép y hệt mục đó (hoặc dùng same_as)`);
      errors++;
    } else if (!job.uses.some((other) => other.file === use.file && other.key === use.key)) job.uses.push(use);
  };
  /** An own picture: one job per file; the same file under another title or method is an error. */
  const addOwn = (set: SelectionSet, own: Own, use: Use) => {
    const absolute = set.localPath(own.own.file);
    const credit = ownCredit(own.title);
    const job = ownJobs.get(absolute);
    if (!job) ownJobs.set(absolute, { path: absolute, own, credit, uses: [use] });
    else if (!sameOwnCredit(job.credit, credit) || job.own.own.method !== own.own.method) {
      console.log(`${use.file} /images/${use.key} cùng file tự vẽ ${own.own.file} với ${job.uses[0]!.file} ${job.uses[0]!.key} nhưng khác title hoặc method; dùng same_as tới mục đó`);
      errors++;
    } else if (!job.uses.some((other) => other.file === use.file && other.key === use.key)) job.uses.push(use);
  };
  /** Every part as a picked image (fetched first) or an own picture (processed first), then the composed file itself. */
  const addComposed = (set: SelectionSet, resolved: ResolvedComposed, use: Use) => {
    resolved.parts.forEach((part, i) => {
      const partUse = { file: use.file, key: `${use.key} phần ${i + 1}${part.via ? ` (${part.via})` : ""}` };
      if ("own" in part) addOwn(set, part.own, partUse);
      else addJob(part.picked, partUse);
    });
    const absolute = set.composedPath(resolved.composed.composed.file);
    const credit = composedCredit(resolved.composed.title, resolved.parts.map(partCredit));
    const job = composedJobs.get(absolute);
    if (!job) composedJobs.set(absolute, { path: absolute, set, resolved, credit, uses: [use] });
    else if (!sameComposedCredit(job.credit, credit)) {
      console.log(`${use.file} /images/${use.key} cùng file ghép ${resolved.composed.composed.file} với ${job.uses[0]!.file} ${job.uses[0]!.key} nhưng khác title hoặc ảnh thành phần; dùng same_as tới mục đó`);
      errors++;
    } else if (!job.uses.some((other) => other.file === use.file && other.key === use.key)) job.uses.push(use);
  };
  for (const file of files) {
    const shown = options.display(file);
    const lessonDir = path.dirname(path.resolve(file));
    const ageGroup = path.basename(path.dirname(lessonDir));
    const root = path.dirname(path.dirname(lessonDir));
    const set = sets.get(root) ?? new SelectionSet(root);
    sets.set(root, set);
    const { selection, errors: problems } = set.load(file);
    if (!selection) {
      for (const problem of problems) console.log(`${shown} ${problem.pointer || "/"} ${problem.message}`);
      errors += problems.length;
      continue;
    }
    for (const [key, entry] of Object.entries(selection.images)) {
      if (isPicked(entry)) {
        addJob(entry, { file: shown, key });
        continue;
      }
      if (isOwn(entry)) {
        addOwn(set, entry, { file: shown, key });
        continue;
      }
      if (isSameAs(entry) && entry.lesson === undefined) continue; // same file: its target is fetched with the file
      const resolved = set.resolve(selection, key, ageGroup, options.display);
      if (resolved && "picked" in resolved) addJob(resolved.picked, { file: shown, key: `${key} (dùng lại ${resolved.via})` });
      else if (resolved && "own" in resolved) addOwn(set, resolved.own, { file: shown, key: `${key} (dùng lại ${resolved.via})` });
      else if (resolved && "composed" in resolved) addComposed(set, resolved, { file: shown, key: resolved.via === undefined ? key : `${key} (dùng lại ${resolved.via})` });
      else {
        console.log(`${shown} /images/${key} ${resolved && "error" in resolved ? resolved.error : "same_as không trỏ tới ảnh nào"}`);
        errors++;
      }
    }
  }

  // 2. Check, download, process, cache.
  const cache = new ImageCache(options.cacheDir);
  const quota = new DailyQuota(options.quotaFile);
  const throttle = {
    commons: new Throttle(COMMONS_FETCH_GAP_MS, sleep),
    openverse: new Throttle(OPENVERSE_GAP_MS, sleep),
    upload: new Throttle(WIKIMEDIA_UPLOAD_GAP_MS, sleep),
    download: new Throttle(COMMONS_GAP_MS, sleep),
  };
  /**
   * Commons API and every download: per-host throttle + retry on 429/503. Openverse API calls go
   * straight through options.http (each one is counted in the daily quota; a 429 there is an error).
   */
  const polite = politeHttp(options.http, {
    sleep,
    now: () => now().getTime(),
    throttleFor: (url) => {
      const host = new URL(url).hostname;
      return host === "commons.wikimedia.org" ? throttle.commons : host === WIKIMEDIA_UPLOAD_HOST ? throttle.upload : throttle.download;
    },
    log: (line) => console.log(line),
  });
  let fresh = 0;
  let kept = 0;
  /** Cache keys of the picked images usable after this run (fetched now or already there): parts of composed pictures need them. */
  const usable = new Set<string>();
  const reminders: string[] = [];

  async function commonsFile(title: string): Promise<CommonsFile> {
    const file = parseCommonsFile(await getJson(polite, commonsFileInfoUrl(title, COMMONS_THUMB_WIDTH)));
    if (!file) throw new Refused(`không thấy ${title} trên Commons (đã xoá hoặc đổi tên?)`);
    return file;
  }

  /** Licence at Commons must be accepted and equal to the selection's. */
  function checkCommons(file: CommonsFile, picked: Picked): { license: string; author: string; notes: string[] } {
    const { verdict, author, title } = commonsCredit(file);
    if (!verdict.ok) throw new Refused(`Commons nay ghi: ${verdict.reason}`);
    if (verdict.license !== picked.license) throw new Refused(`giấy phép ở Commons là ${verdict.license}, file chọn ghi ${picked.license}`);
    if (normalizeUrl(verdict.license_url) !== normalizeUrl(picked.license_url)) throw new Refused(`license_url ở Commons là ${verdict.license_url}, file chọn ghi ${picked.license_url}`);
    if (author === undefined) throw new Refused(`${verdict.license} mà Commons không ghi tác giả: không ghi công được`);
    if (picked.source === "Wikimedia Commons") checkTitle(picked, verdict.license, title);
    const notes = sameText(author, picked.author) ? [] : [`tác giả ở Commons: "${author}" (file chọn ghi "${picked.author}")`];
    return { license: verdict.license, author, notes };
  }

  async function verify(picked: Picked): Promise<Verified> {
    if (picked.source === "Wikimedia Commons") {
      const title = commonsTitle(picked.source_url);
      if (!title) throw new Refused(`source_url ${picked.source_url} không phải trang File: của Commons`);
      const file = await commonsFile(title);
      if (commonsTitle(file.page_url) !== title) throw new Refused(`Commons chuyển ${title} sang ${commonsTitle(file.page_url)}; chạy lại images search`);
      if (normalizeUrl(file.url) !== normalizeUrl(picked.file_url)) throw new Refused(`file_url khác URL file trên Commons (${file.url}); chạy lại images search`);
      const checked = checkCommons(file, picked);
      return { downloadUrl: commonsDownloadUrl(file), via: ["Wikimedia Commons API (extmetadata)"], license: checked.license, authorAtSource: checked.author, notes: checked.notes };
    }
    // Openverse/<provider>
    if (!quota.take()) throw new Refused(`hết ${quota.limit} lượt Openverse hôm nay; chạy lại ngày mai`);
    await throttle.openverse.wait();
    const record = (await getJson(options.http, openverseDetailUrl(picked.openverse_id!))) as Record<string, unknown>;
    const found = openverseCandidate(record, "");
    if ("reason" in found) throw new Refused(`Openverse nay ghi: ${found.reason}`);
    if (found.license !== picked.license) throw new Refused(`giấy phép trên Openverse là ${found.license}, file chọn ghi ${picked.license}`);
    if (normalizeUrl(found.license_url) !== normalizeUrl(picked.license_url)) throw new Refused(`license_url trên Openverse là ${found.license_url}, file chọn ghi ${picked.license_url}`);
    if (normalizeUrl(found.file_url) !== normalizeUrl(picked.file_url)) throw new Refused(`file_url khác url trên Openverse (${found.file_url})`);
    if (normalizeUrl(found.source_url) !== normalizeUrl(picked.source_url)) throw new Refused(`source_url khác trang gốc trên Openverse (${found.source_url})`);
    if (found.source !== picked.source) throw new Refused(`nguồn trên Openverse là ${found.source}, file chọn ghi ${picked.source}`);
    checkTitle(picked, found.license, found.title);
    const notes = sameText(found.author, picked.author) ? [] : [`tác giả trên Openverse: "${found.author}" (file chọn ghi "${picked.author}")`];
    const via = ["Openverse API (detail)"];
    const title = commonsTitle(found.source_url);
    let downloadUrl = found.file_url;
    if (title) {
      const file = await commonsFile(title);
      const checked = checkCommons(file, picked);
      notes.push(...checked.notes);
      via.push("Wikimedia Commons API (extmetadata)");
      // Same file at Commons: take Commons' 1280 px copy instead of the original Openverse points to.
      if (normalizeUrl(file.url) === normalizeUrl(found.file_url)) downloadUrl = commonsDownloadUrl(file);
    } else {
      reminders.push(`${picked.source_url} (${found.source}): giấy phép mới kiểm qua Openverse; mở trang gốc xác nhận ${picked.license} trước khi phát hành`);
    }
    return { downloadUrl, via, license: found.license, authorAtSource: found.author, notes };
  }

  for (const job of jobs.values()) {
    const label = job.uses.map((use) => `${use.file} ${use.key}`).join(", ");
    const credit = creditOf(job.picked);
    const existing = cache.usable(job.cacheKey);
    if (existing && isSourceEntry(existing) && !options.force && sameCredit(existing.credit, credit)) {
      console.log(`${label}: đã có ${existing.sha256.slice(0, 12)}… ${existing.width}×${existing.height} (bỏ qua; --force để tải và kiểm lại)`);
      kept++;
      usable.add(job.cacheKey);
      continue;
    }
    try {
      const checked = await verify(job.picked);
      const download = await getImage(polite, checked.downloadUrl);
      const processed = await processImage(download.bytes, job.picked.crop);
      const sha256 = sha256Bytes(processed.jpeg);
      const at = now().toISOString();
      const entry: ImageEntry = {
        file: `${sha256}.jpg`,
        sha256,
        bytes: processed.jpeg.length,
        width: processed.width,
        height: processed.height,
        credit,
        changes: processed.changes,
        file_url: job.picked.file_url,
        ...(job.picked.crop ? { crop: job.picked.crop } : {}),
        downloaded_url: download.finalUrl,
        original: { ...processed.original, bytes: download.bytes.length },
        verified: { via: checked.via, license: checked.license, author_at_source: checked.authorAtSource, at, notes: checked.notes },
        fetched_at: at,
      };
      cache.put(job.cacheKey, entry, processed.jpeg);
      cache.save();
      fresh++;
      usable.add(job.cacheKey);
      const changes = processed.changes.length > 0 ? ` · ${processed.changes.join(", ")}` : "";
      console.log(`${label}: OK ${sha256.slice(0, 12)}… ${processed.width}×${processed.height} · ${credit.license} · ${credit.source}${changes}`);
      for (const note of checked.notes) console.log(`  cảnh báo: ${note}`);
    } catch (error) {
      errors++;
      const message = error instanceof Refused ? error.message : `lỗi: ${(error as Error).message}`;
      console.log(`${label}: KHÔNG DÙNG, ${message}`);
    }
  }

  /** A file the designer made (own picture, composed picture) -> pack JPEG, with notes when the file itself is not what the contract asks. */
  async function processLocal(bytes: Buffer, what: string): Promise<{ processed: Awaited<ReturnType<typeof processImage>>; notes: string[] }> {
    const meta = await sharp(bytes).metadata();
    const processed = await processImage(bytes);
    const notes: string[] = [];
    if (meta.format !== "jpeg") notes.push(`${what} là ${meta.format ?? "định dạng lạ"}, không phải JPEG`);
    if (processed.changes.includes("resized")) notes.push(`${what} ${processed.original.width}×${processed.original.height}, cạnh dài hơn ${PROCESS.max_edge} px`);
    if (meta.exif || meta.icc || meta.xmp || meta.iptc) notes.push(`${what} còn metadata (EXIF, ICC, XMP hoặc IPTC)`);
    return { processed, notes };
  }

  // 2b. Own pictures: the file must be there (no network); processed like a download.
  /** Cache key of every own picture usable after this run, by absolute file path (parts of composed pictures need them). */
  const ownUsable = new Map<string, string>();
  const ownCount = { fresh: 0, kept: 0 };
  for (const job of ownJobs.values()) {
    const label = job.uses.map((use) => `${use.file} ${use.key}`).join(", ");
    const shownFile = options.display(job.path);
    if (!existsSync(job.path)) {
      errors++;
      console.log(`${label}: KHÔNG DÙNG hình tự vẽ, chưa có file ${shownFile} (designer vẽ, xuất JPEG vào đúng đường dẫn own.file rồi chạy lại images fetch)`);
      continue;
    }
    const bytes = readFileSync(job.path);
    const fileSha256 = sha256Bytes(bytes);
    const cacheKey = ownCacheKey(job.own.own.file, fileSha256);
    const existing = cache.usable(cacheKey);
    if (existing && isOwnEntry(existing) && !options.force && sameOwnCredit(existing.credit, job.credit) && existing.own.method === job.own.own.method) {
      console.log(`${label}: đã có hình tự vẽ ${existing.sha256.slice(0, 12)}… ${existing.width}×${existing.height} (bỏ qua; --force để xử lý lại)`);
      ownCount.kept++;
      ownUsable.set(job.path, cacheKey);
      continue;
    }
    try {
      const { processed, notes } = await processLocal(bytes, "file tự vẽ");
      const sha256 = sha256Bytes(processed.jpeg);
      const entry: OwnEntry = {
        file: `${sha256}.jpg`,
        sha256,
        bytes: processed.jpeg.length,
        width: processed.width,
        height: processed.height,
        credit: job.credit,
        changes: [job.own.own.method],
        own: { file: job.own.own.file, file_sha256: fileSha256, method: job.own.own.method, original: { ...processed.original, bytes: bytes.length }, notes },
        fetched_at: now().toISOString(),
      };
      cache.put(cacheKey, entry, processed.jpeg);
      cache.save();
      ownCount.fresh++;
      ownUsable.set(job.path, cacheKey);
      console.log(`${label}: OK hình tự vẽ ${sha256.slice(0, 12)}… ${processed.width}×${processed.height} · ${job.credit.license} · ${job.own.own.method}`);
      if (notes.length > 0) console.log(`  lưu ý: ${notes.join("; ")}. fetch đã xử lý lại theo hợp đồng; nên lưu đè ${shownFile} bằng bản JPEG ≤ ${PROCESS.max_edge} px không metadata cho repo nhẹ`);
    } catch (error) {
      errors++;
      console.log(`${label}: KHÔNG DÙNG hình tự vẽ ${shownFile}, lỗi: ${(error as Error).message}`);
    }
  }

  // 3. Composed pictures: every part usable, then the designer's file processed like a download.
  /** Cache key of a part when it is usable after this run. */
  const partKey = (set: SelectionSet, part: ResolvedPart): string | undefined => {
    if ("own" in part) return ownUsable.get(set.localPath(part.own.own.file));
    const key = imageCacheKey(part.picked);
    return usable.has(key) ? key : undefined;
  };
  const partTitle = (part: ResolvedPart) => ("own" in part ? part.own.title : part.picked.title);
  const composedCount = { fresh: 0, kept: 0, waiting: 0 };
  for (const job of composedJobs.values()) {
    const label = job.uses.map((use) => `${use.file} ${use.key}`).join(", ");
    const shownFile = options.display(job.path);
    const failed = job.resolved.parts.filter((part) => partKey(job.set, part) === undefined);
    if (failed.length > 0) {
      errors++;
      console.log(`${label}: KHÔNG DÙNG hình ghép ${shownFile}, ${failed.length} ảnh thành phần chưa dùng được (${failed.map((part) => `"${partTitle(part)}"`).join(", ")}; xem dòng của ảnh đó)`);
      continue;
    }
    const partEntries = job.resolved.parts.map((part) => cache.usable(partKey(job.set, part)!)!);
    if (!existsSync(job.path)) {
      composedCount.waiting++;
      const list = partEntries.map((entry, i) => `  ${i + 1}. ${options.display(cache.filePath(entry))} · ${job.credit.parts[i]!.title} · ${job.credit.parts[i]!.license}`);
      console.log(`${label}: chờ ghép, chưa có ${shownFile}. Ảnh thành phần đã kiểm giấy phép:\n${list.join("\n")}`);
      continue;
    }
    const bytes = readFileSync(job.path);
    const fileSha256 = sha256Bytes(bytes);
    const cacheKey = composedCacheKey(fileSha256);
    const existing = cache.usable(cacheKey);
    if (existing && isComposedEntry(existing) && !options.force && sameComposedCredit(existing.credit, job.credit)) {
      console.log(`${label}: đã có hình ghép ${existing.sha256.slice(0, 12)}… ${existing.width}×${existing.height} (bỏ qua; --force để xử lý lại)`);
      composedCount.kept++;
      continue;
    }
    try {
      const { processed, notes } = await processLocal(bytes, "file ghép");
      const sha256 = sha256Bytes(processed.jpeg);
      const at = now().toISOString();
      const entry: ComposedEntry = {
        file: `${sha256}.jpg`,
        sha256,
        bytes: processed.jpeg.length,
        width: processed.width,
        height: processed.height,
        credit: job.credit,
        changes: ["composed", ...processed.changes],
        composed: {
          file: job.resolved.composed.composed.file,
          file_sha256: fileSha256,
          original: { ...processed.original, bytes: bytes.length },
          parts: partEntries.map((part, i) => ({ sha256: part.sha256, credit: job.credit.parts[i]! })),
          notes,
        },
        fetched_at: at,
      };
      cache.put(cacheKey, entry, processed.jpeg);
      cache.save();
      composedCount.fresh++;
      console.log(`${label}: OK hình ghép ${sha256.slice(0, 12)}… ${processed.width}×${processed.height} · ${job.credit.license} · ${job.credit.parts.length} ảnh thành phần`);
      if (notes.length > 0) console.log(`  lưu ý: ${notes.join("; ")}. fetch đã xử lý lại theo hợp đồng; nên lưu đè ${shownFile} bằng bản JPEG ≤ ${PROCESS.max_edge} px không metadata cho repo nhẹ`);
    } catch (error) {
      errors++;
      console.log(`${label}: KHÔNG DÙNG hình ghép ${shownFile}, lỗi: ${(error as Error).message}`);
    }
  }

  for (const reminder of reminders) console.log(`Kiểm tay: ${reminder}`);
  // Picture shape vs slot (Duy 13/11, SK-043): same warning as build, on the lesson markdown.
  const shape = selectionShapeWarnings(files, cache, options.display);
  if (shape.lines.length > 0) {
    console.log(`\nẢnh lệch khung (tỉ lệ ảnh khác chỗ dùng, tools/content-cli/image-slots.json): ${shape.lines.length} hình · ${[...shape.byTopic].map(([slug, n]) => `${slug} ${n}`).join(", ")}`);
    for (const line of shape.lines) console.log(`  ${line}`);
  }
  if (shape.skipped.length > 0) console.log(`Chưa kiểm tỉ lệ ảnh (markdown bài chưa hợp lệ hoặc không tìm thấy): ${shape.skipped.join(", ")}`);
  console.log(
    `\nimages fetch: ${files.length} file chọn ảnh · ${jobs.size} ảnh khác nhau · ${fresh} tải mới · ${kept} đã có · ${errors} lỗi · cache ${options.display(path.resolve(options.cacheDir))}` +
      (ownJobs.size > 0 ? `\nHình tự vẽ: ${ownJobs.size} · ${ownCount.fresh} xử lý mới · ${ownCount.kept} đã có` : "") +
      (composedJobs.size > 0 ? `\nHình ghép: ${composedJobs.size} · ${composedCount.fresh} xử lý mới · ${composedCount.kept} đã có · ${composedCount.waiting} chờ ghép` : "") +
      (composedCount.waiting > 0 ? "\nHình chờ ghép: designer ghép từ các ảnh thành phần ở trên (content/.images/<sha256>.jpg), lưu vào composed.file, rồi chạy lại images fetch; tới lúc đó build vẽ hình giữ chỗ." : "") +
      (errors > 0 ? "\nẢnh lỗi không vào cache; build sẽ báo hình đó chưa có ảnh." : "\nTiếp theo: build (điền image.asset và credit vào gói)."),
  );
  return errors > 0 ? 1 : 0;
}
