// Picture shape vs slot after `images fetch` (Duy 13/11, SK-043): the same check as build
// (aspect.ts), on the lesson markdown next to the selection file. A selection file
// content/images/<age_group>/<topic>/<lesson>.json goes with content/<age_group>/<topic>/<nn>-<lesson>.md;
// when that markdown is missing or not schema-valid yet, the file is skipped (build checks again).
// Reads files only; warnings, never errors.
import { existsSync, readFileSync } from "node:fs";
import path from "node:path";
import { sha256Bytes } from "../audio.ts";
import { checkMarkdown } from "../markdown/check.ts";
import { TOPIC_FILE } from "../markdown/files.ts";
import { DEFAULT_RULES_FILE } from "../paths.ts";
import { aspectWarnings, aspectWarningText, loadSlotTable, type AspectSource, type SizedRef, type SlotTable } from "./aspect.ts";
import type { ImageCache, ImageEntry } from "./cache.ts";
import { composedCacheKey, imageCacheKey, ownCacheKey, SelectionSet, TOPIC_SELECTION, type Resolved } from "./selection.ts";
import { imageRefs } from "./slots.ts";

export type ShapeReport = { lines: string[]; byTopic: Map<string, number>; skipped: string[] };
type SourceWithoutFile = AspectSource extends infer T ? (T extends unknown ? Omit<T, "selection"> : never) : never;

/** Cache entry of a resolved picture (undefined: not fetched yet, or a composed picture not made yet). */
function cachedEntry(set: SelectionSet, resolved: Resolved, cache: ImageCache): { entry: ImageEntry; source: SourceWithoutFile } | undefined {
  if (!resolved || "error" in resolved) return undefined;
  if ("picked" in resolved) {
    const entry = cache.usable(imageCacheKey(resolved.picked));
    return entry ? { entry, source: { kind: "picked", entryKey: resolved.via ?? "", ...(resolved.picked.crop ? { crop: resolved.picked.crop } : {}) } } : undefined;
  }
  if ("own" in resolved) {
    const file = set.localPath(resolved.own.own.file);
    if (!existsSync(file)) return undefined;
    const entry = cache.usable(ownCacheKey(resolved.own.own.file, sha256Bytes(readFileSync(file))));
    return entry ? { entry, source: { kind: "own", entryKey: resolved.via ?? resolved.key, file: resolved.own.own.file } } : undefined;
  }
  const file = set.composedPath(resolved.composed.composed.file);
  if (!existsSync(file)) return undefined;
  const entry = cache.usable(composedCacheKey(sha256Bytes(readFileSync(file))));
  return entry ? { entry, source: { kind: "composed", entryKey: resolved.via ?? resolved.key, file: resolved.composed.composed.file } } : undefined;
}

/** Shape warnings for the lessons of these selection files (see the header). */
export function selectionShapeWarnings(files: string[], cache: ImageCache, display: (file: string) => string, table: SlotTable = loadSlotTable()): ShapeReport {
  const report: ShapeReport = { lines: [], byTopic: new Map(), skipped: [] };
  const sets = new Map<string, SelectionSet>();
  const topics = new Map<string, ReturnType<typeof checkMarkdown> | undefined>();
  for (const file of files) {
    const absolute = path.resolve(file);
    if (path.basename(absolute) === TOPIC_SELECTION) continue;
    const topicDirInImages = path.dirname(absolute);
    const topicSlug = path.basename(topicDirInImages);
    const ageGroup = path.basename(path.dirname(topicDirInImages));
    const root = path.dirname(path.dirname(topicDirInImages));
    const topicDir = path.join(path.dirname(root), ageGroup, topicSlug);
    if (!existsSync(path.join(topicDir, TOPIC_FILE))) continue; // no markdown next to this selection root (tests, copies)
    let markdown = topics.get(topicDir);
    if (!topics.has(topicDir)) {
      try {
        markdown = checkMarkdown({ inputs: [topicDir], rulesFile: DEFAULT_RULES_FILE, minAppVersion: "0.1.0", display, idsCommand: (target) => `ids ${target}` });
      } catch {
        markdown = undefined;
      }
      topics.set(topicDir, markdown);
    }
    const topic = markdown?.ok ? markdown.topics[0] : undefined;
    const slug = path.basename(absolute, ".json").replace(/^\d{2}-/, "");
    const lesson = topic && topic.stepReached >= 3 ? topic.lessons.find((candidate) => (candidate.data as { slug?: string }).slug === slug) : undefined;
    if (!lesson) {
      report.skipped.push(display(absolute));
      continue;
    }
    const set = sets.get(root) ?? new SelectionSet(root);
    sets.set(root, set);
    const selection = set.load(absolute).selection;
    if (!selection) continue;
    const sized: SizedRef[] = [];
    const sources = new Map<string, AspectSource>();
    for (const ref of imageRefs("lesson", lesson.data)) {
      const found = cachedEntry(set, set.resolve(selection, ref.key, ageGroup, display), cache);
      if (!found) continue;
      sized.push({ key: ref.key, pointer: ref.pointer, size: { width: found.entry.width, height: found.entry.height } });
      sources.set(ref.key, { ...found.source, entryKey: found.source.entryKey || ref.key, selection: display(absolute) } as AspectSource);
    }
    const lessonName = path.basename(lesson.doc.path, ".md");
    for (const warning of aspectWarnings(lesson.data, ageGroup, sized, table)) {
      report.lines.push(`${display(lesson.doc.path)} ${aspectWarningText(lessonName, warning, sources.get(warning.key))}`);
      report.byTopic.set(topicSlug, (report.byTopic.get(topicSlug) ?? 0) + 1);
    }
  }
  return report;
}
