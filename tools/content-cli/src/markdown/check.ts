// `validate` / `import` on markdown: the three steps of SK-027, per topic folder.
//   1. markdown (syntax.ts + convert.ts, ids across the content root): codes md_*;
//   2. packages/content-schema on the JSON in memory: code `schema`;
//   3. authoring rules of the age group (validate/age-rules.ts, SK-026): codes age_*.
// A topic with errors in one step does not run the next, except md_id_missing: validate then
// uses placeholder ids in memory so the editor sees every content problem at once.
// Every issue points at a line of a .md file. Pure apart from reading files.
import { realpathSync } from "node:fs";
import path from "node:path";
import { validateDocuments } from "@science-kids/content-schema/validate";
import { loadRules, type Rules } from "../build/rules.ts";
import { displayPointer, parsePointer } from "../json-pointer.ts";
import { checkAgeRules, type AgeDoc } from "../validate/age-rules.ts";
import { convertLesson, convertTopic, type Converted } from "./convert.ts";
import { contentRootFor, discover, readParsed, scanRoot, type IdOccurrence } from "./files.ts";
import { parentPointer } from "./locator.ts";
import { MD_CODES, NEEDS_CHECK, type MdIssue } from "./source.ts";
import type { ParsedMd } from "./syntax.ts";

export type MdCheckOptions = {
  /** Absolute paths of .md files and folders. */
  inputs: string[];
  contentRoot?: string;
  rulesFile: string;
  minAppVersion: string;
  /** Path as printed. */
  display: (file: string) => string;
  /** How the `ids` command is spelt for this user (for the md_id_missing hint). */
  idsCommand: (file: string) => string;
};

export type TopicResult = { dir: string; topic: Converted; lessons: Converted[]; errors: number; stepReached: 1 | 2 | 3 };

export type MdReport =
  | { ok: false; exit: 1 | 2; messages: string[] }
  | { ok: true; root: string; topics: TopicResult[]; issues: MdIssue[]; files: number; rulesDisplay: string };

const isError = (issue: MdIssue) => issue.severity === "error";

export function checkMarkdown(options: MdCheckOptions): MdReport {
  const found = discover(options.inputs, options.display);
  if (!found.ok) return found;
  const root = contentRootFor(found.topics.map((topic) => topic.dir), options.contentRoot);
  const issues: MdIssue[] = [];

  // Parse every file of the call.
  const parsed = found.topics.map((topic) => ({
    input: topic,
    topic: readParsed(topic.topicFile, options.display),
    lessons: topic.lessons.map((file) => readParsed(file, options.display)),
  }));
  const callFiles = parsed.flatMap((entry) => [entry.topic, ...entry.lessons]);
  const realCall = new Set(callFiles.map((doc) => realpathSync(doc.path)));
  const index = scanRoot(root, found.topics.map((topic) => topic.dir), realCall, options.display);

  // Misnamed lesson files: reported, not read.
  for (const entry of parsed) {
    for (const file of entry.input.misnamed) {
      issues.push({ file: options.display(file), line: 1, pointer: "", code: "md_filename", severity: "error", message: `tên file bài phải là <nn>-<slug>.md, nn là order viết hai chữ số (vd 02-mam-com-can-bang.md); file này chưa được đọc` });
    }
  }

  // Step 1: convert.
  const converted = parsed.map((entry) => {
    const topic = convertTopic(entry.topic, index.lookup);
    const lessons = entry.lessons.map((doc) => convertLesson(doc, topic.topicRef!, index.lookup));
    return { entry, topic, lessons };
  });
  const allConverted = converted.flatMap((entry) => [entry.topic, ...entry.lessons]);
  for (const conv of allConverted) issues.push(...withoutShadowed(conv.doc, [...conv.doc.issues, ...conv.issues]));
  issues.push(...duplicateIds(allConverted, index.ids));
  for (const conv of allConverted) {
    const missing = idMissing(conv, options.idsCommand);
    if (missing) issues.push(missing);
    const check = needsCheck(conv.doc);
    if (check) issues.push(check);
  }

  // Steps 2 and 3, per topic.
  let rules: Rules | undefined;
  const rulesDisplay = options.display(path.resolve(options.rulesFile));
  const topics: TopicResult[] = [];
  for (const { entry, topic, lessons } of converted) {
    const docs = [topic, ...lessons];
    const files = new Set([...docs.map((conv) => conv.doc.display), ...entry.input.misnamed.map(options.display)]);
    const mine = () => issues.filter((issue) => files.has(issue.file) && isError(issue));
    const result: TopicResult = { dir: entry.input.dir, topic, lessons, errors: 0, stepReached: 1 };
    topics.push(result);
    if (mine().some((issue) => issue.code !== "md_id_missing")) {
      result.errors = mine().length;
      continue;
    }
    result.stepReached = 2;
    const schema = validateDocuments(docs.map((conv) => ({ file: conv.doc.display, data: conv.data })));
    if (!schema.ok) {
      issues.push(...schemaIssues(docs, schema.errors));
      result.errors = mine().length;
      continue;
    }
    result.stepReached = 3;
    if (!rules) {
      const loaded = loadRules(path.resolve(options.rulesFile));
      if (!loaded.rules) {
        return { ok: false, exit: 1, messages: [...loaded.errors.map((error) => `${rulesDisplay} ${displayPointer(error.pointer)} ${error.message}`), `\n${rulesDisplay} không hợp lệ (${loaded.errors.length} lỗi).`] };
      }
      rules = loaded.rules;
    }
    const ageDocs: AgeDoc[] = docs.map((conv) => ({ display: conv.doc.display, data: conv.data as AgeDoc["data"] }));
    for (const issue of checkAgeRules(ageDocs, rules, { minAppVersion: options.minAppVersion, mode: "validate", rulesDisplay })) {
      const conv = docs.find((doc) => doc.doc.display === issue.file)!;
      issues.push({ file: issue.file, line: conv.loc.line(issue.pointer), pointer: issue.pointer, code: issue.code, severity: issue.severity, message: mdWords(issue.message) });
    }
    result.errors = mine().length;
  }

  // Errors first, then warnings; each by file (call order) then line.
  const order = new Map<string, number>();
  for (const entry of parsed) {
    for (const file of [entry.topic.display, ...[...entry.lessons.map((doc) => doc.display), ...entry.input.misnamed.map(options.display)].sort()]) {
      if (!order.has(file)) order.set(file, order.size);
    }
  }
  issues.sort((a, b) => Number(isError(b)) - Number(isError(a)) || (order.get(a.file) ?? 0) - (order.get(b.file) ?? 0) || a.line - b.line);
  return { ok: true, root, topics, issues, files: callFiles.length + parsed.reduce((n, entry) => n + entry.input.misnamed.length, 0), rulesDisplay };
}

/** Codes that stay visible inside the range a missing ## heading shadows. */
const NOT_SHADOWED = new Set(["md_missing_section", "md_unknown_section", "md_frontmatter", "md_id_missing", "md_id_invalid", "md_id_duplicate", "md_filename"]);

/** Drops the step-1 errors that only exist because a `##` heading is missing (syntax.ts shadows). */
function withoutShadowed(doc: ParsedMd, list: MdIssue[]): MdIssue[] {
  if (doc.shadows.length === 0) return list;
  return list.filter((issue) => NOT_SHADOWED.has(issue.code) || !doc.shadows.some(({ from, to }) => issue.line >= from && issue.line <= to));
}

/** md_id_missing: one line per file, at the first empty id, listing the others. */
function idMissing(conv: Converted, idsCommand: (file: string) => string): MdIssue | undefined {
  const slots = conv.ids.filter((slot) => slot.state === "empty" || slot.state === "absent").sort((a, b) => a.line - b.line);
  if (slots.length === 0) return undefined;
  const [first, ...rest] = slots;
  const absent = slots.filter((slot) => slot.state === "absent");
  const others = rest.length > 0 ? `, và ${rest.length} chỗ nữa ở dòng ${rest.map((slot) => slot.line).join(", ")}` : "";
  const note = absent.length > 0 ? ` (dòng ${absent.map((slot) => slot.line).join(", ")} chưa có dòng "id:", ids sẽ thêm ngay dưới tiêu đề)` : "";
  return {
    file: conv.doc.display,
    line: first!.line,
    pointer: first!.pointer,
    code: "md_id_missing",
    severity: "error",
    message: `"id:" còn trống${others}${note}. Chạy "${idsCommand(conv.doc.path)}" để máy điền UUID; validate và import không ghi vào file .md`,
  };
}

/** md_id_duplicate: an id used twice in the call, or also elsewhere under the content root. One line per (file, other file). */
function duplicateIds(docs: Converted[], others: IdOccurrence[]): MdIssue[] {
  type Occ = IdOccurrence & { pointer?: string; call: boolean; rank: number };
  const all: Occ[] = [];
  docs.forEach((conv, fileRank) => {
    for (const slot of conv.ids) {
      if (slot.state === "ok") all.push({ value: slot.value, path: conv.doc.path, display: conv.doc.display, line: slot.line, pointer: slot.pointer, call: true, rank: fileRank * 1e6 + slot.line });
    }
  });
  for (const other of others) all.push({ ...other, call: false, rank: Number.MAX_SAFE_INTEGER });
  const byValue = new Map<string, Occ[]>();
  for (const occ of all) byValue.set(occ.value, [...(byValue.get(occ.value) ?? []), occ]);

  const hits: { at: Occ; ref: Occ }[] = [];
  for (const list of byValue.values()) {
    if (list.length < 2) continue;
    const call = list.filter((occ) => occ.call).sort((a, b) => a.rank - b.rank);
    const outside = list.filter((occ) => !occ.call).sort((a, b) => (a.display < b.display ? -1 : a.display > b.display ? 1 : a.line - b.line));
    if (outside.length > 0) for (const at of call) hits.push({ at, ref: outside[0]! });
    else for (const at of call.slice(1)) hits.push({ at, ref: call[0]! });
  }
  const groups = new Map<string, { at: Occ; ref: Occ }[]>();
  for (const hit of hits) {
    const key = `${hit.at.display}\n${hit.ref.display}`;
    groups.set(key, [...(groups.get(key) ?? []), hit]);
  }
  const out: MdIssue[] = [];
  for (const list of groups.values()) {
    list.sort((a, b) => a.at.line - b.at.line);
    const { at, ref } = list[0]!;
    const sameFile = at.path === ref.path;
    const there = sameFile ? `dòng ${ref.line} của file này` : `${ref.display}:${ref.line}`;
    const fix = `mỗi id chỉ dùng một lần: xoá giá trị sau "id:" ở chỗ mới chép (để trống) rồi chạy ids`;
    const message =
      list.length === 1
        ? `UUID ${at.value} trùng với id ở ${there}; ${fix}`
        : `${list.length} id trùng với id ở ${sameFile ? "chỗ khác trong file này" : ref.display}: ${list.map((hit) => `dòng ${hit.at.line} = dòng ${hit.ref.line}`).join(", ")}; ${fix}`;
    out.push({ file: at.display, line: at.line, pointer: at.pointer ?? "", code: "md_id_duplicate", severity: "error", message });
  }
  return out;
}

function needsCheck(doc: ParsedMd): MdIssue | undefined {
  if (doc.needsCheck.length === 0) return undefined;
  const lines = doc.needsCheck;
  return {
    file: doc.display,
    line: lines[0]!,
    pointer: "",
    code: "md_needs_check",
    severity: MD_CODES.md_needs_check,
    message: `còn ${lines.length} dòng ${NEEDS_CHECK} (dòng ${lines.join(", ")}): người duyệt chuyên môn kiểm rồi xoá dòng đó; còn ${NEEDS_CHECK} thì chưa phát hành`,
  };
}

/** JSON names in rule messages -> markdown names. */
export function mdWords(message: string): string {
  return message
    .replace(/\bmisconception_id\b/g, "misconception")
    .replace(/\bprerequisite_topic_ids\b/g, "prerequisites")
    .replace(/\btopic_id\b/g, "topic")
    .replace(/\blesson_id\b/g, "recall_from.lesson")
    .replace(/câu warmup/g, "câu ở ## Khởi động")
    .replace(/câu quiz/g, "câu ở ## Quiz");
}

/** What a JSON array is called in markdown (for "cần đúng 6 …"). */
const NOUNS: Readonly<Record<string, string>> = {
  quiz: "câu (###)",
  warmup: "câu (###)",
  learn: "block (###)",
  vocab: "từ (###)",
  misconceptions: "misconception (###)",
  key_points: "ý (1.en, 2.en…)",
  options: "#### option",
  bank: "#### bank",
  items: "#### item",
  groups: "#### group",
  bars: "#### bar",
  examples: "ví dụ (examples.1, examples.2…)",
  term_keys: "key",
  answers: "key",
  answer: "key",
  prerequisite_topic_ids: "chủ đề",
};

/** Markdown name of the JSON path below a block: ["recall_from", "lesson_id"] -> "recall_from.lesson". */
export function mdPath(tokens: string[]): string {
  const out: string[] = [];
  for (let i = 0; i < tokens.length; i++) {
    const token = tokens[i]!;
    const before = tokens[i - 1];
    if (/^\d+$/.test(token) && (before === "examples" || before === "key_points")) out.push(String(Number(token) + 1));
    else if (token === "misconception_id") out.push("misconception");
    else if (token === "topic_id") out.push("topic");
    else if (token === "prerequisite_topic_ids") out.push("prerequisites");
    else if (token === "lesson_id") out.push("lesson");
    else out.push(token);
  }
  return out.join(".");
}

const PAIRS = new Set(["title", "question", "objective", "prompt", "instruction", "hint", "explanation_correct", "explanation_wrong", "sentence", "statement", "correction", "label", "text", "term", "example", "name", "tag", "fact", "alt", "true", "false", "start", "full", "balanced", "has_limited", "unit", "feedback", "feedback_true", "feedback_false"]);

/** "label" -> "label.en và label.vi", "image" -> "image.alt.en và image.alt.vi". */
function missingWhat(name: string, inNote: boolean): string {
  const last = name.split(".").pop() ?? name;
  if (name === "" || last === "") return 'dòng "en:" và "vi:"';
  if (last === "image") return `${name}.alt.en và ${name}.alt.vi`;
  if (PAIRS.has(last) || (last === "note" && inNote) || /^\d+$/.test(last) || name.startsWith("messages.missing.")) return `${name}.en và ${name}.vi`;
  return name;
}

/** content-schema errors -> lines. Several errors on one line become one line. */
function schemaIssues(docs: Converted[], errors: { file: string; pointer: string; message: string }[]): MdIssue[] {
  const merged = new Map<string, MdIssue>();
  for (const error of errors) {
    const conv = docs.find((doc) => doc.doc.display === error.file);
    if (!conv) continue;
    const { line, message } = schemaMessage(conv, error.pointer, error.message);
    const key = `${error.file}:${line}`;
    const earlier = merged.get(key);
    if (!earlier) {
      merged.set(key, { file: error.file, line, pointer: error.pointer, code: "schema", severity: "error", message });
      continue;
    }
    // "X thiếu a" + "X thiếu b" -> "X thiếu a, b".
    const head = /^(.* thiếu )/.exec(earlier.message)?.[1];
    earlier.message += head && message.startsWith(head) ? `, ${message.slice(head.length)}` : `; ${message}`;
  }
  return [...merged.values()];
}

export function schemaMessage(conv: Converted, pointer: string, raw: string): { line: number; message: string } {
  const { loc } = conv;
  const line = loc.line(pointer);
  const block = loc.blockOf(pointer);
  const tokens = parsePointer(pointer);
  const below = parsePointer(block.pointer).length;
  const relative = mdPath(tokens.slice(below));
  const label = block.pointer === "" ? "frontmatter" : block.label;
  const lastToken = tokens[tokens.length - 1] ?? "";
  let message = mdWords(raw);

  const missing = /^thiếu trường bắt buộc "(.+)"$/.exec(raw);
  if (missing) {
    const inRecall = tokens.includes("recall_from");
    if (loc.has(pointer) && loc.nearest(pointer) === pointer && pointer !== block.pointer) {
      return { line, message: `${missingWhat(loc.name(pointer) ?? relative, inRecall)} đang trống` };
    }
    if (lastToken === "play") return { line, message: "## Chơi cần đúng một ### (block chơi)" };
    return { line, message: `${label} thiếu ${missingWhat(relative, inRecall)}` };
  }

  // "cần đúng 6 phần tử" -> "cần đúng 6 câu (###)"; "phần tử 1 trùng với phần tử 0".
  message = message.replace(/phần tử (\d+) trùng với phần tử (\d+)/, (_, a: string, b: string) => `mục thứ ${Number(a) + 1} trùng mục thứ ${Number(b) + 1}`);
  message = message.replace(/phần tử/g, NOUNS[lastToken] ?? "mục");
  // Pointers inside a message ("đã có ở /quiz/1/bank/0/key") -> lines.
  message = message.replace(/(?<=[\s(])\/[a-z_]+(?:\/[A-Za-z0-9_~-]+)*/g, (found) => (found.split("/")[1]! in conv.data ? `dòng ${loc.line(found)}` : found));

  const own = loc.label(pointer);
  if (own !== undefined) return { line, message: `${own}: ${message}` };
  const name = loc.name(pointer) || relative;
  if (message.startsWith(`${lastToken} `) || message.startsWith(`${name} `)) return { line, message };
  const isChildArray = NOUNS[lastToken] !== undefined && parentPointer(pointer) === block.pointer && name === lastToken;
  if (name && !isChildArray) return { line, message: `${name}: ${message}` };
  return { line, message: `${label}: ${message}` };
}
