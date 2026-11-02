// Clip cache: content/.audio/<lang>/<key>.m4a, named by the cache KEY (hash of the input),
// plus content/.audio/index.json mapping key -> sha256 of the m4a BYTES (the AssetHash the
// content JSON carries), duration, text, model, voice, date.
import { existsSync, mkdirSync, readFileSync, renameSync, statSync, writeFileSync } from "node:fs";
import path from "node:path";
import { sha256Bytes } from "./audio.ts";
import type { Lang } from "./spoken.ts";

export const CACHE_FORMAT = "science-kids/tts-clip@1";

export type ClipEntry = {
  lang: Lang;
  /** Relative to the cache dir: "en/<key>.m4a". */
  file: string;
  /** sha256 of the m4a bytes = audio.<lang> in the content JSON = assets/<sha256>.m4a in the pack. */
  sha256: string;
  bytes: number;
  duration_ms: number;
  /** Normalised text: what was read and hashed. */
  text: string;
  engine: string;
  model: string;
  voice: string;
  speed: number;
  created_at: string;
  /** Engines that sample at random (VI): which seed variant was kept and the seeds actually used. */
  variant?: number;
  seeds?: number[];
  /** VieNeu's babble guard regenerated a chunk internally while making this clip. */
  retried?: boolean;
  /** Loudness / silence post-processing (src/audio-post.ts) measured while making this clip. */
  post?: { loudness_before_lufs: number; gain_db: number; limiter_db: number; limited_ms: number; loudness_after_lufs: number; true_peak_dbtp: number; raw_tail_db: number; lead_before_s?: number; trail_before_s?: number };
  /** Last self-check of these exact bytes (VI): flags, what the ASR heard, when. */
  check?: { flags: string[]; heard: string[]; asr_errors: number; lead_silence_s: number; trail_silence_s: number; max_pause_s: number; end_db: number; badness: number; checked_at: string };
};

type IndexFile = { format: typeof CACHE_FORMAT; clips: Record<string, ClipEntry> };

/** Deterministic JSON (sorted keys) so the key does not depend on property order. */
export function canonicalJson(value: unknown): string {
  if (Array.isArray(value)) return `[${value.map(canonicalJson).join(",")}]`;
  if (value !== null && typeof value === "object") {
    const object = value as Record<string, unknown>;
    return `{${Object.keys(object)
      .sort()
      .filter((key) => object[key] !== undefined)
      .map((key) => `${JSON.stringify(key)}:${canonicalJson(object[key])}`)
      .join(",")}}`;
  }
  return JSON.stringify(value);
}

/**
 * Cache key = sha256(normalised text + engine descriptor (model, revision, dtype, voice, speed, library
 * versions, seed scheme) + blank handling + encoder settings + post-processing (loudness, VI silence)
 * [+ seed variant, VI only, when not 0]).
 * `variant` undefined or 0 leaves the key exactly as before SK-024 (EN keys unchanged).
 */
export function cacheKey(material: { lang: Lang; text: string; engine: object; blank: object; encoding: object; post?: object; variant?: number }): string {
  const { variant, ...rest } = material;
  return sha256Bytes(canonicalJson({ format: CACHE_FORMAT, ...rest, ...(variant ? { variant } : {}) }));
}

export class AudioCache {
  readonly dir: string;
  private readonly indexPath: string;
  private clips: Record<string, ClipEntry> = {};
  private savedJson = "";

  constructor(dir: string) {
    this.dir = dir;
    this.indexPath = path.join(dir, "index.json");
    if (existsSync(this.indexPath)) {
      const parsed = JSON.parse(readFileSync(this.indexPath, "utf8")) as IndexFile;
      if (parsed.format !== CACHE_FORMAT) throw new Error(`${this.indexPath}: format ${parsed.format} lạ, cần ${CACHE_FORMAT}`);
      this.clips = parsed.clips ?? {};
      this.savedJson = this.serialize();
    }
  }

  clipPath(lang: Lang, key: string): string {
    return path.join(this.dir, lang, `${key}.m4a`);
  }

  /** The entry if its file is still there with the recorded size; undefined means "generate". */
  usable(key: string): ClipEntry | undefined {
    const entry = this.clips[key];
    if (!entry) return undefined;
    const file = path.join(this.dir, entry.file);
    if (!existsSync(file) || statSync(file).size !== entry.bytes) return undefined;
    return entry;
  }

  has(key: string): boolean {
    return Object.hasOwn(this.clips, key);
  }

  put(key: string, entry: ClipEntry): void {
    this.clips[key] = entry;
  }

  /** Drops an entry (its file is the caller's business). */
  remove(key: string): void {
    delete this.clips[key];
  }

  get size(): number {
    return Object.keys(this.clips).length;
  }

  /** All recorded byte hashes (for checks). */
  hashes(): Set<string> {
    return new Set(Object.values(this.clips).map((entry) => entry.sha256));
  }

  /** Entries grouped by the sha256 of their bytes (build looks clips up by audio.<lang>). Read only. */
  bySha256(): Map<string, { key: string; entry: ClipEntry }[]> {
    const map = new Map<string, { key: string; entry: ClipEntry }[]>();
    for (const key of Object.keys(this.clips).sort()) {
      const entry = this.clips[key]!;
      const list = map.get(entry.sha256) ?? [];
      list.push({ key, entry });
      map.set(entry.sha256, list);
    }
    return map;
  }

  /** Writes index.json only when something changed (atomic rename). */
  save(): boolean {
    const json = this.serialize();
    if (json === this.savedJson) return false;
    mkdirSync(this.dir, { recursive: true });
    const partial = `${this.indexPath}.part`;
    writeFileSync(partial, json);
    renameSync(partial, this.indexPath);
    this.savedJson = json;
    return true;
  }

  private serialize(): string {
    const clips: Record<string, ClipEntry> = {};
    for (const key of Object.keys(this.clips).sort()) clips[key] = this.clips[key]!;
    return `${JSON.stringify({ format: CACHE_FORMAT, clips } satisfies IndexFile, null, 2)}\n`;
  }
}
