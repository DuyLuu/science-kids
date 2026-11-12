// content/syllabus.json in `validate <folder>` (SK-030): a folder given to validate that holds a
// syllabus.json directly (content/ does, a topic folder does not) gets that file checked too, by
// packages/content-schema (schema + rules JSON Schema cannot say), with references resolved against
// the markdown under that same folder (contentIndex, frontmatter only). Pure apart from reading files.
// One line per issue: <file> <JSON pointer> [<code>] <message>, like validate on JSON.
import { existsSync, readFileSync, statSync } from "node:fs";
import path from "node:path";
import { SYLLABUS_CODES, validateSyllabus, type SyllabusCounts, type SyllabusIssue } from "@science-kids/content-schema/syllabus";
import { displayPointer } from "../json-pointer.ts";
import { contentIndex } from "./files.ts";

export const SYLLABUS_FILE = "syllabus.json";
export { SYLLABUS_CODES };

export type SyllabusResult = {
  /** Path as printed. */
  file: string;
  issues: SyllabusIssue[];
  /** Only when the file passed the schema. */
  counts?: SyllabusCounts;
};

/** <folder>/syllabus.json of every folder input that has one, once each. */
export function syllabusFilesOf(inputs: string[]): string[] {
  const files: string[] = [];
  for (const input of inputs) {
    if (!existsSync(input) || !statSync(input).isDirectory()) continue;
    const file = path.join(path.resolve(input), SYLLABUS_FILE);
    if (existsSync(file) && statSync(file).isFile() && !files.includes(file)) files.push(file);
  }
  return files;
}

/** Reads and checks one syllabus.json; the folder it sits in is its content root. */
export function checkSyllabus(file: string, display: (file: string) => string): SyllabusResult {
  const shown = display(file);
  let data: unknown;
  try {
    data = JSON.parse(readFileSync(file, "utf8"));
  } catch (error) {
    return { file: shown, issues: [{ pointer: "", code: "syllabus_json", severity: "error", message: `JSON không hợp lệ: ${(error as Error).message}` }] };
  }
  const report = validateSyllabus(data, { content: contentIndex(path.dirname(file), display) });
  return { file: shown, issues: report.issues, counts: report.counts };
}

export function formatSyllabusIssue(file: string, issue: SyllabusIssue): string {
  return `${file} ${displayPointer(issue.pointer)} [${issue.code}] ${issue.severity === "warning" ? "cảnh báo: " : ""}${issue.message}`;
}

/** " · syllabus content/syllabus.json (3 nhóm, 45 chủ đề, 384 bài; 2 bài có lesson_id, 347 bài chưa có tên vi)" for the summary line. */
export function syllabusSummary(result: SyllabusResult): string {
  const { counts } = result;
  if (!counts) return ` · syllabus ${result.file} (${result.issues.some((issue) => issue.code === "syllabus_json") ? "JSON không hợp lệ" : "chưa qua schema"})`;
  const untranslated = counts.untranslatedLessons > 0 ? `, ${counts.untranslatedLessons} bài chưa có tên vi` : "";
  return ` · syllabus ${result.file} (${counts.groups} nhóm, ${counts.topics} chủ đề, ${counts.lessons} bài; ${counts.linkedLessons} bài có lesson_id${untranslated})`;
}
