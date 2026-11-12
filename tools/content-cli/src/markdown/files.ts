// Which markdown files a call reads, and the content root around them.
//   - a folder: every topic folder (one with _topic.md) inside it, itself included;
//   - in a topic folder: _topic.md and every <nn>-*.md; other .md files whose name starts with a
//     digit are reported (md_filename), everything else is ignored;
//   - a single lesson file: that lesson plus the _topic.md next to it.
// The content root is scanned for every id (md_id_duplicate) and for the targets of
// `prerequisites` and `recall_from.lesson`; contentIndex lists its topics and lessons by id for
// the checks of syllabus.json (SK-030).
import { existsSync, readdirSync, readFileSync, realpathSync, statSync } from "node:fs";
import path from "node:path";
import { AGE_GROUPS } from "../build/rules.ts";
import { REPO_ROOT } from "../paths.ts";
import type { Lookup } from "./convert.ts";
import { parseMarkdown, type DocKind, type ParsedMd } from "./syntax.ts";

export const DEFAULT_CONTENT_ROOT = path.join(REPO_ROOT, "content");
export const TOPIC_FILE = "_topic.md";
export const LESSON_NAME = /^(\d{2})-(.+)\.md$/;
/** Looks like a lesson but does not follow <nn>-<slug>.md (2-mam-com.md, 002-x.md, 02_x.md). */
const LESSON_LIKE = /^\d.*\.md$/;

/** `requested`: the files the call named (a folder names all of its files); `ids` writes only these. */
export type TopicInput = { dir: string; topicFile: string; lessons: string[]; misnamed: string[]; requested: string[] };
export type Discovery =
  | { ok: true; topics: TopicInput[] }
  | { ok: false; exit: 1 | 2; messages: string[] };

const isTopicDir = (dir: string) => existsSync(path.join(dir, TOPIC_FILE));

function topicDirsUnder(dir: string): string[] {
  const out: string[] = [];
  const visit = (current: string) => {
    if (isTopicDir(current)) out.push(current);
    for (const name of readdirSync(current).sort()) {
      if (name.startsWith(".") || name === "node_modules") continue;
      const child = path.join(current, name);
      if (statSync(child).isDirectory()) visit(child);
    }
  };
  visit(dir);
  return out;
}

export function lessonFilesOf(dir: string): { lessons: string[]; misnamed: string[] } {
  const names = readdirSync(dir).filter((name) => name.endsWith(".md") && name !== TOPIC_FILE).sort();
  return {
    lessons: names.filter((name) => LESSON_NAME.test(name)).map((name) => path.join(dir, name)),
    misnamed: names.filter((name) => !LESSON_NAME.test(name) && LESSON_LIKE.test(name)).map((name) => path.join(dir, name)),
  };
}

/** `inputs` are absolute paths of .md files or folders. */
export function discover(inputs: string[], display: (file: string) => string): Discovery {
  const missing = inputs.filter((input) => !existsSync(input));
  if (missing.length > 0) return { ok: false, exit: 1, messages: missing.map((input) => `${display(input)} / không tìm thấy file`) };
  const byDir = new Map<string, { all: boolean; lessons: Set<string>; misnamed: Set<string>; topic: boolean }>();
  const entry = (dir: string) => {
    const found = byDir.get(dir) ?? { all: false, lessons: new Set<string>(), misnamed: new Set<string>(), topic: false };
    byDir.set(dir, found);
    return found;
  };
  const problems: string[] = [];
  for (const input of inputs) {
    if (statSync(input).isDirectory()) {
      const dirs = topicDirsUnder(input);
      if (dirs.length === 0) {
        const json = readdirSync(input).some((name) => name.endsWith(".json"));
        problems.push(`${display(input)}: không có thư mục chủ đề nào (thư mục có ${TOPIC_FILE}) bên trong.${json ? " Thư mục này có file .json: validate JSON thì đưa từng file .json, không đưa thư mục." : ""}`);
      }
      for (const dir of dirs) entry(dir).all = true;
      continue;
    }
    const dir = path.dirname(input);
    const name = path.basename(input);
    if (!isTopicDir(dir)) {
      problems.push(`${display(input)}: không có ${TOPIC_FILE} cùng thư mục; mỗi bài nằm trong thư mục chủ đề có ${TOPIC_FILE}`);
      continue;
    }
    const found = entry(dir);
    if (name === TOPIC_FILE) {
      found.topic = true;
      continue;
    }
    if (LESSON_NAME.test(name)) found.lessons.add(input);
    else found.misnamed.add(input);
  }
  if (problems.length > 0) return { ok: false, exit: 2, messages: problems };
  const topics = [...byDir.entries()]
    .sort(([a], [b]) => (a < b ? -1 : a > b ? 1 : 0))
    .map(([dir, found]) => {
      const listed = found.all ? lessonFilesOf(dir) : { lessons: [], misnamed: [] };
      const topicFile = path.join(dir, TOPIC_FILE);
      const lessons = [...new Set([...listed.lessons, ...found.lessons])].sort();
      return {
        dir,
        topicFile,
        lessons,
        misnamed: [...new Set([...listed.misnamed, ...found.misnamed])].sort(),
        requested: [...(found.all || found.topic ? [topicFile] : []), ...lessons],
      };
    });
  return { ok: true, topics };
}

const inside = (child: string, parent: string) => {
  const relative = path.relative(parent, child);
  return relative === "" || (!relative.startsWith("..") && !path.isAbsolute(relative));
};

/**
 * --content-root, else content/ when every topic is in it, else the folder above <age_group>/
 * of the first topic (or its parent folder): a copy at /tmp/x/discoverer/topic checks /tmp/x.
 */
export function contentRootFor(topicDirs: string[], explicit?: string): string {
  if (explicit) return path.resolve(explicit);
  if (topicDirs.every((dir) => inside(dir, DEFAULT_CONTENT_ROOT))) return DEFAULT_CONTENT_ROOT;
  const parent = path.dirname(topicDirs[0]!);
  return (AGE_GROUPS as readonly string[]).includes(path.basename(parent)) ? path.dirname(parent) : parent;
}

export type IdOccurrence = { value: string; path: string; display: string; line: number };

/** Topics, lessons and ids of every markdown file under the root (syntax only, never fails). */
export type RootIndex = { root: string; lookup: Lookup; ids: IdOccurrence[] };

export function kindOf(file: string): DocKind {
  return path.basename(file) === TOPIC_FILE ? "topic" : "lesson";
}

export function readParsed(file: string, display: (file: string) => string): ParsedMd {
  return parseMarkdown(kindOf(file), file, display(file), readFileSync(file, "utf8"));
}

function idsOf(doc: ParsedMd): { value: string; line: number }[] {
  const out: { value: string; line: number }[] = [];
  const id = doc.frontmatter?.fields.find((field) => field.name === "id" && field.value !== "");
  if (id) out.push({ value: id.value, line: id.line });
  for (const section of doc.sections) {
    for (const block of section.blocks) {
      for (const field of block.fields) if (field.name === "id" && field.value !== "") out.push({ value: field.value, line: field.line });
    }
  }
  return out;
}

const frontValue = (doc: ParsedMd, name: string) => doc.frontmatter?.fields.find((field) => field.name === name && field.value !== "")?.value;

export type IndexedTopic = { id: string; slug: string; age_group?: string; file: string };
export type IndexedLesson = { id: string; slug: string; topic_id?: string; topic_slug: string; file: string };
/** Shape of ContentIndex in @science-kids/content-schema/syllabus. */
export type ContentIndex = { root: string; topics: IndexedTopic[]; lessons: IndexedLesson[] };

/**
 * Every topic (_topic.md) and lesson (<nn>-*.md) under the root that has an id, read from the
 * frontmatter only (syntax.ts, same parser as validate; never fails). A lesson belongs to the topic
 * of its folder (validate checks that its `topic:` names that folder). `root` is printed as is.
 */
export function contentIndex(root: string, display: (file: string) => string): ContentIndex {
  const topics: IndexedTopic[] = [];
  const lessons: IndexedLesson[] = [];
  const dirs = existsSync(root) && statSync(root).isDirectory() ? topicDirsUnder(root) : [];
  for (const dir of dirs) {
    const topicDoc = readParsed(path.join(dir, TOPIC_FILE), display);
    const topicId = frontValue(topicDoc, "id");
    const topicSlug = frontValue(topicDoc, "slug") ?? path.basename(dir);
    if (topicId) topics.push({ id: topicId, slug: topicSlug, age_group: frontValue(topicDoc, "age_group"), file: topicDoc.display });
    for (const file of lessonFilesOf(dir).lessons) {
      const doc = readParsed(file, display);
      const id = frontValue(doc, "id");
      if (!id) continue;
      const slug = frontValue(doc, "slug") ?? LESSON_NAME.exec(path.basename(file))![2]!;
      lessons.push({ id, slug, topic_id: topicId, topic_slug: topicSlug, file: doc.display });
    }
  }
  return { root: display(root), topics, lessons };
}

/**
 * `exclude`: real paths of the files of this call; their ids come from the full conversion (with
 * pointers), so they are left out of `ids` here. They still serve as reference targets.
 */
export function scanRoot(root: string, extraTopicDirs: string[], exclude: Set<string>, display: (file: string) => string): RootIndex {
  const topics = new Map<string, { id?: string }>();
  const lessons = new Map<string, { id?: string }>();
  const ids: IdOccurrence[] = [];
  const dirs = existsSync(root) && statSync(root).isDirectory() ? topicDirsUnder(root) : [];
  for (const extra of extraTopicDirs) if (!dirs.includes(extra)) dirs.push(extra);
  const seen = new Set<string>();
  for (const dir of dirs) {
    const topicFile = path.join(dir, TOPIC_FILE);
    const files = [topicFile, ...lessonFilesOf(dir).lessons];
    let topicSlug = path.basename(dir);
    for (const file of files) {
      const real = realpathSync(file);
      if (seen.has(real)) continue;
      seen.add(real);
      const doc = readParsed(file, display);
      const id = frontValue(doc, "id");
      if (file === topicFile) {
        topicSlug = frontValue(doc, "slug") ?? topicSlug;
        if (!topics.has(topicSlug)) topics.set(topicSlug, { id });
      } else {
        const lessonSlug = frontValue(doc, "slug") ?? LESSON_NAME.exec(path.basename(file))![2]!;
        const key = `${topicSlug}/${lessonSlug}`;
        if (!lessons.has(key)) lessons.set(key, { id });
      }
      if (!exclude.has(real)) for (const occurrence of idsOf(doc)) ids.push({ ...occurrence, path: file, display: doc.display });
    }
  }
  const lookup: Lookup = {
    topic: (slug) => topics.get(slug),
    topicSlugs: () => [...topics.keys()],
    lesson: (topicSlug, lessonSlug) => lessons.get(`${topicSlug}/${lessonSlug}`),
    lessonRefs: () => [...lessons.keys()],
  };
  return { root, lookup, ids };
}
