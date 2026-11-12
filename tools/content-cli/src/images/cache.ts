// Image cache (SK-033): content/.images/<sha256>.jpg (processed JPEG, named by the sha256 of its
// bytes) + content/.images/index.json: cache key (imageCacheKey: file URL + crop + processing)
// -> sha256, size, credit as checked at the source, changes made, download date. Outside git,
// like content/.audio: `images fetch` rebuilds it from the selection files.
// A composed picture (dev 10/11) is cached the same way, under composedCacheKey (bytes of the
// designer's file + processing), with the credit of every part. An own picture (dev 10/11) too,
// under ownCacheKey (its repo path + bytes + processing), with the credit "Science Kids".
import { existsSync, mkdirSync, readFileSync, renameSync, statSync, writeFileSync } from "node:fs";
import path from "node:path";
import { REPO_ROOT } from "../paths.ts";
import { IMAGE_CACHE_FORMAT, type ComposedCredit, type Credit, type Crop, type OwnCredit, type OwnMethod, type PartCredit } from "./selection.ts";

export const DEFAULT_IMAGE_CACHE_DIR = path.join(REPO_ROOT, "content", ".images");

/**
 * What was done to the source picture (credit.changes; CC BY 4.0 asks to say so). "composed": made
 * from several pictures. An own picture has its method instead ("drawn"): nothing of someone else's was changed.
 */
export type Change = "cropped" | "resized" | "composed" | OwnMethod;

type EntryBase = {
  /** "<sha256>.jpg", relative to the cache dir. */
  file: string;
  sha256: string;
  bytes: number;
  width: number;
  height: number;
  changes: Change[];
  fetched_at: string;
};

/** A picture downloaded from its source. */
export type SourceEntry = EntryBase & {
  credit: Credit;
  file_url: string;
  crop?: Crop;
  /** URL actually downloaded (Commons: a server-side scaled copy of file_url when the original is large). */
  downloaded_url: string;
  original: { width: number; height: number; format: string; bytes: number };
  /** Licence checks made at the source before the file was used. */
  verified: { via: string[]; license: string; author_at_source: string; at: string; notes: string[] };
};

/** A composed picture: the designer's file in the repo, processed like a download; every part was checked at its source. */
export type ComposedEntry = EntryBase & {
  credit: ComposedCredit;
  composed: {
    /** composed.file of the selection file (content/images/composed/…). */
    file: string;
    /** sha256 of that file's bytes (part of the cache key). */
    file_sha256: string;
    original: { width: number; height: number; format: string; bytes: number };
    /** Each part: its processed picture in this cache and its credit (an own part: "Science Kids"). */
    parts: { sha256: string; credit: PartCredit }[];
    notes: string[];
  };
};

/** An own picture: a file Science Kids made (own.file in the repo), processed like a download; no source to check. */
export type OwnEntry = EntryBase & {
  credit: OwnCredit;
  own: {
    /** own.file of the selection file (content/images/own/…). */
    file: string;
    /** sha256 of that file's bytes (part of the cache key). */
    file_sha256: string;
    method: OwnMethod;
    original: { width: number; height: number; format: string; bytes: number };
    notes: string[];
  };
};

export type ImageEntry = SourceEntry | ComposedEntry | OwnEntry;
export const isComposedEntry = (entry: ImageEntry): entry is ComposedEntry => "composed" in entry;
export const isOwnEntry = (entry: ImageEntry): entry is OwnEntry => "own" in entry;
/** A picture downloaded from its source (not composed, not own). */
export const isSourceEntry = (entry: ImageEntry): entry is SourceEntry => !isComposedEntry(entry) && !isOwnEntry(entry);

type IndexFile = { format: typeof IMAGE_CACHE_FORMAT; images: Record<string, ImageEntry> };

export class ImageCache {
  readonly dir: string;
  private readonly indexPath: string;
  private images: Record<string, ImageEntry> = {};
  private savedJson = "";

  constructor(dir: string) {
    this.dir = dir;
    this.indexPath = path.join(dir, "index.json");
    if (existsSync(this.indexPath)) {
      const parsed = JSON.parse(readFileSync(this.indexPath, "utf8")) as IndexFile;
      if (parsed.format !== IMAGE_CACHE_FORMAT) throw new Error(`${this.indexPath}: format ${parsed.format} lạ, cần ${IMAGE_CACHE_FORMAT}`);
      this.images = parsed.images ?? {};
      this.savedJson = this.serialize();
    }
  }

  get(key: string): ImageEntry | undefined {
    return this.images[key];
  }

  /** The entry when its file is still there with the recorded size. */
  usable(key: string): ImageEntry | undefined {
    const entry = this.images[key];
    if (!entry) return undefined;
    const file = path.join(this.dir, entry.file);
    return existsSync(file) && statSync(file).size === entry.bytes ? entry : undefined;
  }

  filePath(entry: Pick<ImageEntry, "file">): string {
    return path.join(this.dir, entry.file);
  }

  /** Writes the JPEG (named by its sha256) and records the entry; index.json is written by save(). */
  put(key: string, entry: ImageEntry, bytes: Buffer): void {
    mkdirSync(this.dir, { recursive: true });
    const file = path.join(this.dir, entry.file);
    if (!existsSync(file) || statSync(file).size !== bytes.length) {
      const partial = `${file}.part`;
      writeFileSync(partial, bytes);
      renameSync(partial, file);
    }
    this.images[key] = entry;
  }

  get size(): number {
    return Object.keys(this.images).length;
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
    const images: Record<string, ImageEntry> = {};
    for (const key of Object.keys(this.images).sort()) images[key] = this.images[key]!;
    return `${JSON.stringify({ format: IMAGE_CACHE_FORMAT, images } satisfies IndexFile, null, 2)}\n`;
  }
}
