// UI voice (SK-059): interface sentences the mascot says outside a lesson pack (e.g. the first-time
// hint of the Play shelf). Source: content/ui-voice/strings.json, keys = Localizable.xcstrings keys,
// EN and VI for every key. Pure helpers here (no model, no file system writes) so tests run fast.
import type { Lang } from "../spoken.ts";

export const UI_VOICE_SOURCE_FORMAT = "science-kids/ui-voice-strings@1";
export const UI_VOICE_MANIFEST_FORMAT = "science-kids/ui-voice@1";
export const UI_VOICE_LANGS: readonly Lang[] = ["en", "vi"];

/** Same shape as the dotted keys of Localizable.xcstrings (`lesson.play.hint.first.explorer`). */
const KEY_PATTERN = /^[a-z0-9_]+(\.[a-z0-9_]+)+$/;

export type UiVoiceString = { key: string; en: string; vi: string };
export type SourceProblem = { pointer: string; message: string };

/** Parses and checks the source file. Strings come back in file order (= review order). */
export function parseUiVoiceSource(text: string): { strings: UiVoiceString[]; problems: SourceProblem[] } {
  const problems: SourceProblem[] = [];
  let data: unknown;
  try {
    data = JSON.parse(text);
  } catch (error) {
    return { strings: [], problems: [{ pointer: "", message: `JSON không hợp lệ: ${(error as Error).message}` }] };
  }
  if (!isObject(data)) return { strings: [], problems: [{ pointer: "", message: "cần một object" }] };
  if (data.format !== UI_VOICE_SOURCE_FORMAT) problems.push({ pointer: "/format", message: `cần "${UI_VOICE_SOURCE_FORMAT}"` });
  if (!isObject(data.strings) || Object.keys(data.strings).length === 0) {
    problems.push({ pointer: "/strings", message: "cần object strings có ít nhất một key" });
    return { strings: [], problems };
  }
  const strings: UiVoiceString[] = [];
  for (const [key, value] of Object.entries(data.strings)) {
    const pointer = `/strings/${key.replaceAll("~", "~0").replaceAll("/", "~1")}`;
    if (!KEY_PATTERN.test(key)) problems.push({ pointer, message: "key phải dạng a.b.c (chữ thường, số, _), như key của Localizable.xcstrings" });
    if (!isObject(value)) {
      problems.push({ pointer, message: "cần object { en, vi }" });
      continue;
    }
    for (const field of Object.keys(value)) {
      if (!["en", "vi", "ticket", "note"].includes(field)) problems.push({ pointer: `${pointer}/${field}`, message: "trường lạ (chỉ en, vi, ticket, note)" });
    }
    let ok = true;
    for (const lang of UI_VOICE_LANGS) {
      const sentence = value[lang];
      if (typeof sentence !== "string" || sentence.trim() === "") {
        problems.push({ pointer: `${pointer}/${lang}`, message: `thiếu câu ${lang.toUpperCase()}` });
        ok = false;
      } else if (sentence !== sentence.trim()) {
        problems.push({ pointer: `${pointer}/${lang}`, message: "có khoảng trắng ở đầu hoặc cuối" });
      }
    }
    if (ok) strings.push({ key, en: (value.en as string).normalize("NFC"), vi: (value.vi as string).normalize("NFC") });
  }
  return { strings, problems };
}

/** Bundle file name of one clip: `<key>.<lang>.m4a` (flat, so `Bundle.url(forResource:withExtension:subdirectory:)` finds it). */
export function clipFileName(key: string, lang: Lang): string {
  return `${key}.${lang}.m4a`;
}

export type ManifestClip = {
  file: string;
  /** sha256 of the m4a bytes (same hash scheme as audio.<lang> and assets/<sha256>.m4a of a pack). */
  sha256: string;
  bytes: number;
  duration_ms: number;
  /** Sentence as written in the source (what the app prints). */
  text: string;
  /** Normalised sentence (what the engine read). */
  read: string;
};

export type UiVoiceManifest = {
  format: typeof UI_VOICE_MANIFEST_FORMAT;
  source: string;
  source_sha256: string;
  engines: Partial<Record<Lang, string>>;
  clips: Record<string, Partial<Record<Lang, ManifestClip>>>;
};

/** Deterministic manifest (no timestamp): the same source and clips give the same bytes. Keys sorted. */
export function buildManifest(input: {
  source: string;
  sourceSha256: string;
  engines: Partial<Record<Lang, string>>;
  clips: { key: string; lang: Lang; clip: Omit<ManifestClip, "file"> }[];
}): UiVoiceManifest {
  const clips: UiVoiceManifest["clips"] = {};
  for (const { key, lang, clip } of [...input.clips].sort((a, b) => (a.key === b.key ? a.lang.localeCompare(b.lang) : a.key < b.key ? -1 : 1))) {
    clips[key] ??= {};
    clips[key][lang] = { file: clipFileName(key, lang), ...clip };
  }
  return { format: UI_VOICE_MANIFEST_FORMAT, source: input.source, source_sha256: input.sourceSha256, engines: input.engines, clips };
}

/** `--out` may be replaced only when empty or an earlier ui-voice build (manifest.json with our format). */
export function replaceableOut(entries: string[], manifestText: string | undefined): boolean {
  if (entries.length === 0) return true;
  if (manifestText === undefined) return false;
  try {
    return (JSON.parse(manifestText) as { format?: string }).format === UI_VOICE_MANIFEST_FORMAT;
  } catch {
    return false;
  }
}

function isObject(value: unknown): value is Record<string, unknown> {
  return value !== null && typeof value === "object" && !Array.isArray(value);
}
