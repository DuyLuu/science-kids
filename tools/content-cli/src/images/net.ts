// Network pieces of `images search` and `images fetch` (SK-033): an injectable HTTP function
// (tests pass a fake that reads fixture JSON; nothing in the tests touches the network), a
// throttle per source, the Openverse daily quota (anonymous: 20 requests a minute, 200 a day)
// and the search cache (content/.build/images/.cache/, outside git).
import { existsSync, mkdirSync, readFileSync, renameSync, writeFileSync } from "node:fs";
import path from "node:path";
import { sha256Bytes } from "../audio.ts";
import { REPO_ROOT } from "../paths.ts";

/** Sent with every request (Wikimedia asks for an identifying User-Agent). No personal data. */
export const USER_AGENT = "ScienceKidsContentCLI/0.1 (content-cli images; licence-checked picture search for a children's science app)";

export type HttpResponse = {
  ok: boolean;
  status: number;
  url: string;
  headers: { get(name: string): string | null };
  json(): Promise<unknown>;
  arrayBuffer(): Promise<ArrayBuffer>;
};
export type Http = (url: string, init: { headers: Record<string, string> }) => Promise<HttpResponse>;

/** Node's fetch (follows redirects). */
export const nodeHttp: Http = (url, init) => fetch(url, { headers: init.headers, redirect: "follow" }) as Promise<HttpResponse>;

export class HttpError extends Error {
  readonly status: number;
  readonly url: string;
  constructor(status: number, url: string, message: string) {
    super(message);
    this.status = status;
    this.url = url;
  }
}

export type Sleep = (ms: number) => Promise<void>;
export const realSleep: Sleep = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

/** At least `gapMs` between two calls of wait(). */
export class Throttle {
  private last = -Infinity;
  private readonly gapMs: number;
  private readonly sleep: Sleep;
  private readonly now: () => number;
  constructor(gapMs: number, sleep: Sleep = realSleep, now: () => number = Date.now) {
    this.gapMs = gapMs;
    this.sleep = sleep;
    this.now = now;
  }
  async wait(): Promise<void> {
    const due = this.last + this.gapMs - this.now();
    if (due > 0) await this.sleep(due);
    this.last = this.now();
  }
}

/** Default folder of `images search` output; the search cache and the quota file live in .cache/. */
export const DEFAULT_SEARCH_DIR = path.join(REPO_ROOT, "content", ".build", "images");
export const searchCacheDir = (searchDir: string) => path.join(searchDir, ".cache");

/** Openverse anonymous use: 200 requests a day; stop a little before. */
export const OPENVERSE_DAILY_LIMIT = 190;
/** 20 requests a minute -> one every 3.1 s. */
export const OPENVERSE_GAP_MS = 3100;
/** Commons has no fixed limit for one client reading in sequence; stay gentle. */
export const COMMONS_GAP_MS = 300;
/** `images fetch`: Commons API calls (imageinfo of one file) a little further apart than search. */
export const COMMONS_FETCH_GAP_MS = 1000;
/** `images fetch`: downloads from upload.wikimedia.org (it answers 429 to clients that go faster). */
export const WIKIMEDIA_UPLOAD_GAP_MS = 3000;
export const WIKIMEDIA_UPLOAD_HOST = "upload.wikimedia.org";

// ---------- retry on 429 / 503 (dev 10/11) ----------

/** Answers worth waiting for: too many requests, service unavailable. */
export const RETRY_STATUSES: readonly number[] = [429, 503];
/** Wait before retry 1, 2, 3 when the server says nothing (or less); then give up. */
export const RETRY_BACKOFF_MS: readonly number[] = [5_000, 15_000, 45_000];
/** Longest wait for one retry, whatever Retry-After says. */
export const MAX_RETRY_WAIT_MS = 120_000;

/**
 * Retry-After header -> milliseconds from now: delay-seconds ("120") or an HTTP date
 * ("Wed, 21 Oct 2026 07:28:00 GMT"; a date already past is 0). Missing or unreadable -> undefined.
 */
export function retryAfterMs(value: string | null | undefined, nowMs: number): number | undefined {
  const text = value?.trim();
  if (!text) return undefined;
  if (/^\d+(\.\d+)?$/.test(text)) return Math.round(Number(text) * 1000);
  // HTTP dates start with the day name; V8's Date.parse alone would also read "-5" or "1 2".
  if (!/^[A-Za-z]{3}/.test(text)) return undefined;
  const at = Date.parse(text);
  return Number.isNaN(at) ? undefined : Math.max(0, at - nowMs);
}

/** Wait before retry number `retry` (0-based): Retry-After but at least the backoff step, at most maxWaitMs. */
export function retryWaitMs(retry: number, retryAfter: number | undefined, backoffMs: readonly number[] = RETRY_BACKOFF_MS, maxWaitMs = MAX_RETRY_WAIT_MS): number {
  const step = backoffMs[Math.min(retry, backoffMs.length - 1)] ?? 0;
  return Math.min(maxWaitMs, Math.max(step, retryAfter ?? 0));
}

export type PoliteOptions = {
  sleep?: Sleep;
  /** Clock for an HTTP-date Retry-After. */
  now?: () => number;
  /** Throttle waited before every attempt to this URL (per host); undefined: none. */
  throttleFor?: (url: string) => Throttle | undefined;
  /** One line per retry and when retries run out. */
  log?: (line: string) => void;
  backoffMs?: readonly number[];
  maxWaitMs?: number;
};

const hostOf = (url: string) => {
  try {
    return new URL(url).hostname;
  } catch {
    return url;
  }
};

/**
 * Wraps an Http: waits the URL's throttle before each attempt; a 429 or 503 is retried after
 * Retry-After (seconds or date), at least the backoff step, at most maxWaitMs, backoffMs.length
 * times. When retries run out the last answer is returned (getJson/getImage then throw HttpError).
 */
export function politeHttp(http: Http, options: PoliteOptions = {}): Http {
  const sleep = options.sleep ?? realSleep;
  const now = options.now ?? Date.now;
  const backoff = options.backoffMs ?? RETRY_BACKOFF_MS;
  const maxWait = options.maxWaitMs ?? MAX_RETRY_WAIT_MS;
  const log = options.log ?? (() => {});
  return async (url, init) => {
    for (let retry = 0; ; retry++) {
      await options.throttleFor?.(url)?.wait();
      const response = await http(url, init);
      if (response.ok || !RETRY_STATUSES.includes(response.status)) return response;
      if (retry >= backoff.length) {
        log(`  HTTP ${response.status} ở ${hostOf(url)}: đã thử lại ${backoff.length} lần, bỏ`);
        return response;
      }
      const header = response.headers.get("retry-after");
      const after = retryAfterMs(header, now());
      const wait = retryWaitMs(retry, after, backoff, maxWait);
      const said = after === undefined ? "" : `, Retry-After ${Math.round(after / 1000)} s${after > maxWait ? ` (chờ tối đa ${Math.round(maxWait / 1000)} s)` : ""}`;
      log(`  HTTP ${response.status} ở ${hostOf(url)}${said}: chờ ${Math.round(wait / 1000)} s rồi thử lại (lần ${retry + 1}/${backoff.length})`);
      await response.arrayBuffer().catch(() => undefined); // free the connection
      await sleep(wait);
    }
  };
}

/** Requests to Openverse today (UTC day), shared by search and fetch through a small JSON file. */
export class DailyQuota {
  readonly limit: number;
  private readonly file: string;
  private readonly today: () => string;
  constructor(file: string, limit: number = OPENVERSE_DAILY_LIMIT, today: () => string = () => new Date().toISOString().slice(0, 10)) {
    this.file = file;
    this.limit = limit;
    this.today = today;
  }
  used(): number {
    if (!existsSync(this.file)) return 0;
    try {
      const data = JSON.parse(readFileSync(this.file, "utf8")) as { date?: string; count?: number };
      return data.date === this.today() ? Number(data.count ?? 0) : 0;
    } catch {
      return 0;
    }
  }
  /** Counts one request; false (and nothing counted) when today's limit is reached. */
  take(): boolean {
    const used = this.used();
    if (used >= this.limit) return false;
    mkdirSync(path.dirname(this.file), { recursive: true });
    const partial = `${this.file}.part`;
    writeFileSync(partial, `${JSON.stringify({ date: this.today(), count: used + 1 })}\n`);
    renameSync(partial, this.file);
    return true;
  }
}

/** Search answers by URL: <dir>/<sha256(url)>.json. Only successful answers are kept. */
export class JsonCache {
  private readonly dir: string;
  constructor(dir: string) {
    this.dir = dir;
  }
  private file(url: string) {
    return path.join(this.dir, `${sha256Bytes(url)}.json`);
  }
  get(url: string): unknown | undefined {
    const file = this.file(url);
    if (!existsSync(file)) return undefined;
    try {
      return (JSON.parse(readFileSync(file, "utf8")) as { body: unknown }).body;
    } catch {
      return undefined;
    }
  }
  put(url: string, body: unknown): void {
    mkdirSync(this.dir, { recursive: true });
    const file = this.file(url);
    writeFileSync(`${file}.part`, `${JSON.stringify({ url, fetched_at: new Date().toISOString(), body })}\n`);
    renameSync(`${file}.part`, file);
  }
}

/** GET a JSON document with our User-Agent; non-2xx -> HttpError. */
export async function getJson(http: Http, url: string): Promise<unknown> {
  const response = await http(url, { headers: { "User-Agent": USER_AGENT, Accept: "application/json" } });
  if (!response.ok) throw new HttpError(response.status, url, `HTTP ${response.status} ở ${url}`);
  return response.json();
}

/** Largest picture fetch accepts (Commons originals can be huge; fetch asks for a scaled copy). */
export const MAX_DOWNLOAD_BYTES = 40 * 1024 * 1024;

/** GET an image file: 2xx, Content-Type image/*, at most MAX_DOWNLOAD_BYTES. */
export async function getImage(http: Http, url: string): Promise<{ bytes: Buffer; type: string; finalUrl: string }> {
  const response = await http(url, { headers: { "User-Agent": USER_AGENT, Accept: "image/*" } });
  if (!response.ok) throw new HttpError(response.status, url, `HTTP ${response.status} khi tải ${url}`);
  const type = (response.headers.get("content-type") ?? "").split(";")[0]!.trim().toLowerCase();
  if (!type.startsWith("image/")) throw new Error(`${url} trả về ${type || "không rõ Content-Type"}, không phải ảnh`);
  const declared = Number(response.headers.get("content-length") ?? "0");
  if (declared > MAX_DOWNLOAD_BYTES) throw new Error(`${url}: ${declared} byte, quá ${MAX_DOWNLOAD_BYTES} byte`);
  const bytes = Buffer.from(await response.arrayBuffer());
  if (bytes.length > MAX_DOWNLOAD_BYTES) throw new Error(`${url}: ${bytes.length} byte, quá ${MAX_DOWNLOAD_BYTES} byte`);
  return { bytes, type, finalUrl: response.url || url };
}
