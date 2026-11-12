// Wikimedia Commons and Openverse: request URLs and parsing of their answers into candidates
// (search) or file records (fetch). Parsing is pure; the calls go through net.ts.
//   Commons:   https://commons.wikimedia.org/w/api.php (action=query, no key)
//   Openverse: https://api.openverse.org/v1/images/ (no key: 20 requests a minute, 200 a day)
import { classifyCommons, classifyOpenverse, commonsTitle, creditAuthor, flattenExtmetadata, plainText, providerName, type Verdict } from "./license.ts";

export const COMMONS_API = "https://commons.wikimedia.org/w/api.php";
export const OPENVERSE_API = "https://api.openverse.org/v1";
export const COMMONS_SOURCE = "Wikimedia Commons";

/** Smallest longest edge worth showing (the pack JPEG is 1024 px). */
export const MIN_EDGE = 600;
const COMMONS_MIME = new Set(["image/jpeg", "image/png", "image/tiff", "image/webp"]);
const EXTMETADATA = ["ObjectName", "Artist", "Credit", "LicenseShortName", "License", "LicenseUrl", "Restrictions", "NonFree", "UsageTerms", "AttributionRequired", "Copyrighted"].join("|");

export type Origin = "commons" | "openverse";
export type Candidate = {
  origin: Origin;
  /** credit.source: "Wikimedia Commons" or "Openverse/<provider>". */
  source: string;
  source_url: string;
  file_url: string;
  thumb_url: string;
  title: string;
  author: string;
  license: string;
  license_url: string;
  width?: number;
  height?: number;
  openverse_id?: string;
  /** Provider code on Openverse (flickr, wikimedia…). */
  provider?: string;
  query: string;
};
export type Rejected = { origin: Origin; title: string; source_url?: string; reason: string };
export type Found = { candidates: Candidate[]; rejected: Rejected[] };

const isObject = (value: unknown): value is Record<string, unknown> => value !== null && typeof value === "object" && !Array.isArray(value);
const str = (value: unknown): string | undefined => (typeof value === "string" && value.trim() !== "" ? value.trim() : undefined);
const num = (value: unknown): number | undefined => (typeof value === "number" && Number.isFinite(value) ? value : undefined);
const https = (url: string | undefined) => (url === undefined ? undefined : url.startsWith("//") ? `https:${url}` : url.replace(/^http:\/\//i, "https://"));

/** "File:Ha Long Bay 01.jpg" -> "Ha Long Bay 01" */
function fileLabel(title: string): string {
  return title.replace(/^file:/i, "").replace(/\.[a-z0-9]+$/i, "").replace(/_/g, " ").trim();
}

// ---------- Wikimedia Commons ----------

export function commonsSearchUrl(query: string, limit = 20): string {
  const params = new URLSearchParams({
    action: "query",
    format: "json",
    formatversion: "2",
    generator: "search",
    gsrsearch: `filetype:bitmap ${query}`,
    gsrnamespace: "6",
    gsrlimit: String(limit),
    prop: "imageinfo",
    iiprop: "url|size|mime|extmetadata",
    iiurlwidth: "400",
    iiextmetadatafilter: EXTMETADATA,
    iiextmetadatalanguage: "en",
  });
  return `${COMMONS_API}?${params}`;
}

/**
 * Width of the Commons copy `images fetch` downloads (dev 10/11). 1280 is one of Wikimedia's
 * standard thumbnail widths (served from its cache; originals and odd widths get HTTP 429 fast)
 * and is enough for the pack (longest edge <= 1024 after crop and resize).
 */
export const COMMONS_THUMB_WIDTH = 1280;
/** Formats fetch may download as they are; others (TIFF…) always come as Commons' JPEG/PNG rendering. */
const DIRECT_MIME = new Set(["image/jpeg", "image/png", "image/webp"]);

/** imageinfo + extmetadata of one file (fetch); iiurlwidth asks Commons for its scaled copy (thumburl). */
export function commonsFileInfoUrl(title: string, width = COMMONS_THUMB_WIDTH): string {
  const params = new URLSearchParams({
    action: "query",
    format: "json",
    formatversion: "2",
    redirects: "1",
    titles: title,
    prop: "imageinfo",
    iiprop: "url|size|mime|extmetadata",
    iiurlwidth: String(width),
    iiextmetadatafilter: EXTMETADATA,
    iiextmetadatalanguage: "en",
  });
  return `${COMMONS_API}?${params}`;
}

export type CommonsFile = {
  title: string;
  page_url: string;
  url: string;
  thumb_url?: string;
  width: number;
  height: number;
  mime: string;
  meta: Record<string, string>;
};

function commonsPages(body: unknown): Record<string, unknown>[] {
  const query = isObject(body) && isObject(body.query) ? body.query : undefined;
  const pages = query?.pages;
  if (Array.isArray(pages)) return pages.filter(isObject);
  if (isObject(pages)) return Object.values(pages).filter(isObject); // formatversion 1
  return [];
}

function commonsFileOf(page: Record<string, unknown>): CommonsFile | undefined {
  const info = Array.isArray(page.imageinfo) && isObject(page.imageinfo[0]) ? page.imageinfo[0] : undefined;
  const title = str(page.title);
  const url = https(str(info?.url));
  const pageUrl = https(str(info?.descriptionurl));
  if (!info || !title || !url || !pageUrl) return undefined;
  return {
    title,
    page_url: pageUrl,
    url,
    thumb_url: https(str(info.thumburl)),
    width: num(info.width) ?? 0,
    height: num(info.height) ?? 0,
    mime: str(info.mime) ?? "",
    meta: flattenExtmetadata(info.extmetadata as Record<string, { value?: unknown }> | undefined),
  };
}

/**
 * What `images fetch` downloads for a Commons file (never the original of a large picture):
 * thumburl when the original is wider than `width` or not JPEG/PNG/WebP; else the original URL
 * (Commons' thumburl of a small JPEG is that same URL). No thumburl in the answer: the original.
 */
export function commonsDownloadUrl(file: Pick<CommonsFile, "url" | "thumb_url" | "width" | "mime">, width = COMMONS_THUMB_WIDTH): string {
  if (!file.thumb_url) return file.url;
  return file.width > width || !DIRECT_MIME.has(file.mime) ? file.thumb_url : file.url;
}

/** The one file of a commonsFileInfoUrl answer; undefined when the page is missing. */
export function parseCommonsFile(body: unknown): CommonsFile | undefined {
  const page = commonsPages(body)[0];
  if (!page || page.missing === true || page.missing === "") return undefined;
  return commonsFileOf(page);
}

/** Licence + author of a Commons file, as the credit needs them. */
export function commonsCredit(file: CommonsFile): { verdict: Verdict; author?: string; title: string } {
  const verdict = classifyCommons(file.meta, file.page_url);
  const title = plainText(file.meta.ObjectName) || fileLabel(file.title);
  return { verdict, author: verdict.ok ? creditAuthor(file.meta.Artist, verdict.kind) : undefined, title };
}

export function parseCommonsSearch(body: unknown, query: string): Found {
  const found: Found = { candidates: [], rejected: [] };
  const pages = commonsPages(body).sort((a, b) => (num(a.index) ?? 1e9) - (num(b.index) ?? 1e9));
  for (const page of pages) {
    const file = commonsFileOf(page);
    const label = fileLabel(str(page.title) ?? "?");
    if (!file) {
      found.rejected.push({ origin: "commons", title: label, reason: "thiếu imageinfo" });
      continue;
    }
    const reject = (reason: string) => found.rejected.push({ origin: "commons", title: label, source_url: file.page_url, reason });
    if (!COMMONS_MIME.has(file.mime)) {
      reject(`định dạng ${file.mime || "không rõ"}`);
      continue;
    }
    if (Math.max(file.width, file.height) < MIN_EDGE) {
      reject(`nhỏ quá (${file.width}×${file.height})`);
      continue;
    }
    const { verdict, author, title } = commonsCredit(file);
    if (!verdict.ok) {
      reject(verdict.reason);
      continue;
    }
    if (author === undefined) {
      reject(`${verdict.license} mà không rõ tác giả: không ghi công được`);
      continue;
    }
    found.candidates.push({
      origin: "commons",
      source: COMMONS_SOURCE,
      source_url: file.page_url,
      file_url: file.url,
      thumb_url: file.thumb_url ?? file.url,
      title,
      author,
      license: verdict.license,
      license_url: verdict.license_url,
      width: file.width,
      height: file.height,
      query,
    });
  }
  return found;
}

// ---------- Openverse ----------

/**
 * Openverse category from the brief's tag (content/TEMPLATE.md): [ảnh], [ảnh mô hình] ->
 * photograph; [tranh], [tranh phục dựng] -> illustration + digitized artwork;
 * [ảnh hoặc tranh], [bản đồ], [sơ đồ ghép ảnh] and no tag -> every category. ([hình vẽ] is
 * never searched: Science Kids draws it, search.ts.)
 */
export function openverseCategory(brief: string | undefined): string | undefined {
  const tag = /^\s*\[([^\]]+)\]/u.exec(brief?.normalize("NFC") ?? "")?.[1]?.trim().toLowerCase();
  if (!tag) return undefined;
  if (tag === "ảnh" || tag === "ảnh mô hình") return "photograph";
  if (tag === "tranh" || tag.startsWith("tranh ")) return "illustration,digitized_artwork";
  return undefined;
}

export function openverseSearchUrl(query: string, category?: string, pageSize = 20): string {
  const params = new URLSearchParams({ q: query, license: "cc0,pdm,by", page_size: String(pageSize), mature: "false" });
  if (category) params.set("category", category);
  return `${OPENVERSE_API}/images/?${params}`;
}

export function openverseDetailUrl(id: string): string {
  return `${OPENVERSE_API}/images/${encodeURIComponent(id)}/`;
}

/** A result (search) or detail record (fetch) -> candidate, or why it is not one. */
export function openverseCandidate(record: Record<string, unknown>, query: string): Candidate | Rejected {
  const title = plainText(str(record.title)) || "Untitled";
  const sourceUrl = https(str(record.foreign_landing_url));
  const reject = (reason: string): Rejected => ({ origin: "openverse", title, source_url: sourceUrl, reason });
  const id = str(record.id);
  const fileUrl = https(str(record.url));
  if (!id || !fileUrl || !sourceUrl) return reject("thiếu id, url hoặc trang gốc");
  const verdict = classifyOpenverse({
    license: str(record.license),
    license_version: str(record.license_version),
    license_url: str(record.license_url),
    mature: record.mature === true,
  });
  if (!verdict.ok) return reject(verdict.reason);
  const filetype = (str(record.filetype) ?? "").toLowerCase();
  if (filetype === "gif" || filetype === "svg") return reject(`định dạng ${filetype}`);
  const width = num(record.width);
  const height = num(record.height);
  if (width !== undefined && height !== undefined && Math.max(width, height) < MIN_EDGE) return reject(`nhỏ quá (${width}×${height})`);
  const author = creditAuthor(str(record.creator), verdict.kind);
  if (author === undefined) return reject(`${verdict.license} mà không rõ tác giả: không ghi công được`);
  const provider = str(record.provider) ?? str(record.source);
  return {
    origin: "openverse",
    source: `Openverse/${providerName(provider)}`,
    source_url: sourceUrl,
    file_url: fileUrl,
    thumb_url: https(str(record.thumbnail)) ?? fileUrl,
    title,
    author,
    license: verdict.license,
    license_url: verdict.license_url,
    width,
    height,
    openverse_id: id,
    provider,
    query,
  };
}

export function parseOpenverseSearch(body: unknown, query: string): Found {
  const found: Found = { candidates: [], rejected: [] };
  const results = isObject(body) && Array.isArray(body.results) ? body.results.filter(isObject) : [];
  for (const record of results) {
    const entry = openverseCandidate(record, query);
    if ("reason" in entry) found.rejected.push(entry);
    else found.candidates.push(entry);
  }
  return found;
}

/** Openverse records whose landing page is on Commons: fetch also checks the licence at Commons. */
export function commonsTitleOfOpenverse(record: { source_url: string; provider?: string }): string | undefined {
  return commonsTitle(record.source_url);
}
