// Licence rule of SK-033 ("Đề xuất" 2, Duy 9/11: the app is paid, never risk copyright).
// Accepted, nothing else:
//   - CC0 1.0;
//   - public domain with a clear label on the source page (Commons "Public domain"), PDM 1.0;
//   - CC BY (any version, ported versions too), with an author to credit.
// Rejected: BY-SA, NC, ND, GFDL and other copyleft, "Attribution"/"No restrictions"/unknown
// labels, Commons files with Restrictions (personality, trademarked, insignia…), non-free
// files, Openverse results marked mature.
// A composed picture takes the strictest licence of its parts (strictestLicense); an own picture
// (made by Science Kids, dev 10/11) has the licence "Science Kids", between CC BY and public domain.
// Pure: no I/O. search uses it to filter candidates, fetch to check again at the source.

export type LicenseKind = "cc0" | "pd" | "pdm" | "by";
export type Verdict = { ok: true; kind: LicenseKind; license: string; license_url: string } | { ok: false; reason: string };

export const CC0_URL = "https://creativecommons.org/publicdomain/zero/1.0/";
export const PDM_URL = "https://creativecommons.org/publicdomain/mark/1.0/";
export const byUrl = (version: string, port?: string) => `https://creativecommons.org/licenses/by/${version}/${port ? `${port}/` : ""}`;

/** Every credit.license the pipeline writes (selection file schema uses the same pattern). */
export const LICENSE_PATTERN = /^(?:CC0 1\.0|Public domain|PDM 1\.0|CC BY [1-4]\.[05](?: [a-z]{2,}(?:-[a-z]+)?)?)$/;
export const LICENSE_PATTERN_SOURCE = LICENSE_PATTERN.source;

/** credit.license of a picture Science Kids made itself (selection.ts OWN_LICENSE). */
export const OWN_LICENSE_NAME = "Science Kids";

/**
 * How much a credit.license asks of whoever uses the picture, for a composed picture (SK-033 dev
 * 10/11): CC BY (credit the author) > Science Kids (an own picture: the composed picture is ours,
 * not free) > Public domain (a label on the source page, may depend on the country) > PDM 1.0 >
 * CC0 1.0 (worldwide waiver).
 */
export function licenseRank(license: string): number {
  if (license.startsWith("CC BY")) return 4;
  if (license === OWN_LICENSE_NAME) return 3;
  if (license === "Public domain") return 2;
  if (license === "PDM 1.0") return 1;
  return 0;
}

/** The first of `parts` with the highest licenseRank: CC BY when one part is CC BY, else Science Kids / PD / PDM / CC0. */
export function strictestLicense<T extends { license: string; license_url: string }>(parts: readonly T[]): T {
  if (parts.length === 0) throw new Error("strictestLicense: không có phần nào");
  return parts.reduce((best, part) => (licenseRank(part.license) > licenseRank(best.license) ? part : best));
}

/** Author of an accepted image whose source names nobody (CC0 / public domain only). */
export const UNKNOWN_AUTHOR = "Unknown";
const MAX_TEXT = 200;

const ENTITIES: Readonly<Record<string, string>> = { amp: "&", lt: "<", gt: ">", quot: '"', apos: "'", nbsp: " " };

/**
 * HTML (Commons extmetadata) -> plain text: hidden blocks (display: none, where Commons artwork
 * templates keep Wikidata "title QS:P1476,…" lines) dropped, tags removed, entities decoded,
 * spaces collapsed, at most 200 characters.
 */
export function plainText(html: string | null | undefined): string {
  const text = (html ?? "")
    .replace(/<(div|span)\b[^>]*style\s*=\s*"[^"]*display\s*:\s*none[^"]*"[^>]*>[\s\S]*?<\/\1>/gi, " ")
    .replace(/<[^>]*>/g, " ")
    .replace(/&(#x[0-9a-f]+|#\d+|[a-z]+);/gi, (whole, name: string) => {
      if (name[0] === "#") {
        const code = name[1] === "x" || name[1] === "X" ? Number.parseInt(name.slice(2), 16) : Number(name.slice(1));
        return Number.isFinite(code) && code > 0 && code < 0x110000 ? String.fromCodePoint(code) : whole;
      }
      return ENTITIES[name.toLowerCase()] ?? whole;
    })
    .replace(/\s+/g, " ")
    .replace(/\s*\b(?:title|label) QS:[\s\S]*$/u, "")
    .trim();
  return text.length > MAX_TEXT ? `${text.slice(0, MAX_TEXT - 1).trimEnd()}…` : text;
}

/** "http://…", "//…" -> "https://…"; no trailing "/"; host lower case. For comparing URLs. */
export function normalizeUrl(url: string | null | undefined): string {
  let text = (url ?? "").trim();
  if (text.startsWith("//")) text = `https:${text}`;
  text = text.replace(/^http:\/\//i, "https://");
  try {
    const parsed = new URL(text);
    parsed.hostname = parsed.hostname.toLowerCase();
    text = parsed.toString();
  } catch {
    // keep as is: not a URL, compared as text
  }
  return text.replace(/\/+$/, "");
}

/** https:// form of a licence URL from a source ("//…" and "http://" fixed); empty stays empty. */
function httpsUrl(url: string | undefined): string {
  const text = (url ?? "").trim();
  if (text === "") return "";
  if (text.startsWith("//")) return `https:${text}`;
  return text.replace(/^http:\/\//i, "https://");
}

const COPYLEFT = /\b(?:sa|nc|nd|gfdl|fal|copyleft|sharealike|noncommercial|noderivs|noderivatives|gpl|lgpl|odbl)\b/;

/** Commons extmetadata, flattened: name -> value (see flattenExtmetadata). */
export type CommonsMeta = Readonly<Record<string, string | undefined>>;

export function flattenExtmetadata(extmetadata: Record<string, { value?: unknown } | undefined> | undefined): Record<string, string> {
  const out: Record<string, string> = {};
  for (const [name, entry] of Object.entries(extmetadata ?? {})) {
    if (entry && entry.value !== undefined && entry.value !== null) out[name] = String(entry.value);
  }
  return out;
}

/**
 * Licence of a Wikimedia Commons file from its extmetadata (LicenseShortName, License,
 * LicenseUrl, Restrictions, NonFree). `pageUrl` is the file page: the licence link of a
 * public-domain file without LicenseUrl (the page shows the public domain tag).
 */
export function classifyCommons(meta: CommonsMeta, pageUrl: string): Verdict {
  const short = (meta.LicenseShortName ?? "").trim();
  const code = (meta.License ?? "").trim().toLowerCase();
  const url = httpsUrl(meta.LicenseUrl);
  const name = short || code || "không ghi";
  if ((meta.NonFree ?? "").trim().toLowerCase() === "true") return { ok: false, reason: `Commons ghi NonFree (không tự do): ${name}` };
  const restrictions = plainText(meta.Restrictions);
  if (restrictions !== "") {
    return { ok: false, reason: `Commons ghi hạn chế "${restrictions}" (personality = người nhận ra được, trademarked = nhãn hiệu, insignia = huy hiệu cơ quan…)` };
  }
  const words = `${short} ${code}`.toLowerCase().replace(/[-_/]+/g, " ");
  if (COPYLEFT.test(words)) return { ok: false, reason: `giấy phép ${name}: không nhận BY-SA, NC, ND, GFDL và giấy phép copyleft` };
  if (code === "cc0" || /^cc0(?: 1\.0)?$/i.test(short)) return { ok: true, kind: "cc0", license: "CC0 1.0", license_url: CC0_URL };
  if (code === "pdm" || code === "cc-pd" || code === "pd-mark" || /^(?:cc )?pdm(?: 1\.0)?$|^public domain mark/i.test(short)) {
    return { ok: true, kind: "pdm", license: "PDM 1.0", license_url: PDM_URL };
  }
  if (code === "pd" || /^public domain$/i.test(short)) return { ok: true, kind: "pd", license: "Public domain", license_url: url || pageUrl };
  const by = /^cc[- ]by[- ]([1-4]\.[05])(?:[- ]([a-z]{2,}(?:-[a-z]+)?))?$/i.exec(code) ?? /^cc[- ]by[- ]([1-4]\.[05])(?:[- ]([a-z]{2,}(?:-[a-z]+)?))?$/i.exec(short);
  if (by) {
    const version = by[1]!;
    const port = by[2]?.toLowerCase();
    return { ok: true, kind: "by", license: `CC BY ${version}${port ? ` ${port}` : ""}`, license_url: url || byUrl(version, port) };
  }
  return { ok: false, reason: `giấy phép "${name}" không thuộc CC0, public domain, PDM, CC BY` };
}

export type OpenverseLicense = { license?: string | null; license_version?: string | null; license_url?: string | null; mature?: boolean | null };

/** Licence of an Openverse result (search) or detail record (fetch). */
export function classifyOpenverse(record: OpenverseLicense): Verdict {
  const license = (record.license ?? "").trim().toLowerCase();
  const version = (record.license_version ?? "").trim();
  if (record.mature === true) return { ok: false, reason: "Openverse đánh dấu mature" };
  if (license === "cc0") return { ok: true, kind: "cc0", license: "CC0 1.0", license_url: CC0_URL };
  if (license === "pdm") return { ok: true, kind: "pdm", license: "PDM 1.0", license_url: PDM_URL };
  if (license === "by") {
    if (!/^[1-4]\.[05]$/.test(version)) return { ok: false, reason: `CC BY không rõ phiên bản ("${version}")` };
    return { ok: true, kind: "by", license: `CC BY ${version}`, license_url: httpsUrl(record.license_url ?? undefined) || byUrl(version) };
  }
  return { ok: false, reason: `giấy phép Openverse "${license || "không ghi"}${version ? ` ${version}` : ""}" không thuộc CC0, PDM, CC BY` };
}

/**
 * Author for the credit: the plain text the source gives, or UNKNOWN_AUTHOR when it gives none
 * and the licence does not need one. CC BY without an author cannot be credited: undefined.
 */
export function creditAuthor(raw: string | null | undefined, kind: LicenseKind): string | undefined {
  const author = plainText(raw);
  if (author !== "") return author;
  return kind === "by" ? undefined : UNKNOWN_AUTHOR;
}

/** "File:Ha_Long_Bay.jpg" from https://commons.wikimedia.org/wiki/File:Ha_Long_Bay.jpg (spaces as "_" or " "). */
export function commonsTitle(pageUrl: string): string | undefined {
  try {
    const url = new URL(pageUrl);
    if (!/^(?:commons\.wikimedia\.org|commons\.m\.wikimedia\.org)$/i.test(url.hostname)) return undefined;
    const match = /^\/wiki\/(File:.+)$/i.exec(url.pathname);
    if (!match) return undefined;
    return decodeURIComponent(match[1]!).replace(/_/g, " ").replace(/^file:/i, "File:");
  } catch {
    return undefined;
  }
}

/** File page URL of a Commons title. */
export function commonsPageUrl(title: string): string {
  return `https://commons.wikimedia.org/wiki/${encodeURIComponent(title.replace(/ /g, "_")).replace(/%3A/gi, ":").replace(/%2F/gi, "/")}`;
}

/** Display names of Openverse providers (credit.source = "Openverse/<name>"). */
const PROVIDERS: Readonly<Record<string, string>> = {
  flickr: "Flickr",
  wikimedia: "Wikimedia Commons",
  nasa: "NASA",
  rijksmuseum: "Rijksmuseum",
  smithsonian: "Smithsonian",
  met: "The Met",
  clevelandmuseum: "Cleveland Museum of Art",
  nypl: "NYPL",
  europeana: "Europeana",
  geographorguk: "Geograph",
  stocksnap: "StockSnap",
  rawpixel: "Rawpixel",
  inaturalist: "iNaturalist",
  biodiversity: "Biodiversity Heritage Library",
  wordpress: "WordPress Photo Directory",
  sciencemuseum: "Science Museum",
  brooklynmuseum: "Brooklyn Museum",
  museumsvictoria: "Museums Victoria",
  phylopic: "PhyloPic",
  spacex: "SpaceX",
};

export function providerName(provider: string | null | undefined): string {
  const code = (provider ?? "").trim();
  return PROVIDERS[code.toLowerCase()] ?? (code || "không rõ");
}
