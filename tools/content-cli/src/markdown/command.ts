// `content-cli validate|import|ids` on markdown (SK-027). validate and import never write a .md
// file; import writes JSON of content schema v1 (the input of `tts`), ids writes UUIDs into .md.
// Exit 0 = done (warnings allowed), 1 = content error (import wrote nothing), 2 = wrong usage.
import { existsSync, mkdirSync, readdirSync, readFileSync, realpathSync, renameSync, rmSync, statSync, writeFileSync } from "node:fs";
import path from "node:path";
import { CLI_ROOT, REPO_ROOT } from "../paths.ts";
import { checkMarkdown, type MdReport, type TopicResult } from "./check.ts";
import { contentRootFor, discover, readParsed, scanRoot } from "./files.ts";
import { fillIds } from "./ids.ts";
import { formatMdIssue } from "./source.ts";
import { checkSyllabus, formatSyllabusIssue, syllabusFilesOf, syllabusSummary, type SyllabusResult } from "./syllabus.ts";

export const DEFAULT_JSON_DIR = path.join(REPO_ROOT, "content", ".build", "json");

export type MdOptions = {
  inputs: string[];
  contentRoot?: string;
  rulesFile: string;
  minAppVersion: string;
  /** The user's cwd: printed paths and commands are relative to it. */
  cwd: string;
  display: (file: string) => string;
};

/** "npm run x --" in tools/content-cli, else "npm --prefix <rel> run x --". */
function npmRun(cwd: string, script: string): string {
  const relative = path.relative(cwd, CLI_ROOT);
  return relative === "" ? `npm run ${script} --` : `npm --prefix ${relative} run ${script} --`;
}

/** A path for a printed command: relative to the cwd inside the repo, absolute otherwise. */
function arg(cwd: string, file: string): string {
  const inRepo = (target: string) => {
    const relative = path.relative(REPO_ROOT, target);
    return !relative.startsWith("..") && !path.isAbsolute(relative);
  };
  const shown = inRepo(file) && inRepo(cwd) ? path.relative(cwd, file) || "." : file;
  return /[\s"'$`\\]/.test(shown) ? JSON.stringify(shown) : shown;
}

function check(options: MdOptions): MdReport {
  return checkMarkdown({
    inputs: options.inputs,
    contentRoot: options.contentRoot,
    rulesFile: options.rulesFile,
    minAppVersion: options.minAppVersion,
    display: options.display,
    idsCommand: (file) => `${npmRun(options.cwd, "ids")} ${arg(options.cwd, file)}`,
  });
}

function stepNote(topic: TopicResult): string | undefined {
  if (topic.stepReached === 3) return undefined;
  const slug = path.basename(topic.dir);
  return topic.stepReached === 1
    ? `  ${slug}: dừng ở bước 1 (cú pháp markdown); sửa các lỗi trên rồi chạy lại để kiểm content-schema và luật theo tuổi`
    : `  ${slug}: dừng ở bước 2 (content-schema); sửa rồi chạy lại để kiểm luật theo tuổi`;
}

/**
 * Prints the issues and the summary line; returns the number of errors. Order: markdown errors,
 * syllabus errors, markdown warnings, syllabus warnings.
 */
function printReport(command: string, report: Extract<MdReport, { ok: true }>, options: MdOptions, syllabi: SyllabusResult[] = []): number {
  const isError = (issue: { severity: string }) => issue.severity === "error";
  const syllabusLines = (error: boolean) =>
    syllabi.flatMap((result) => result.issues.filter((issue) => isError(issue) === error).map((issue) => formatSyllabusIssue(result.file, issue)));
  const lines = [
    ...report.issues.filter(isError).map(formatMdIssue),
    ...syllabusLines(true),
    ...report.issues.filter((issue) => !isError(issue)).map(formatMdIssue),
    ...syllabusLines(false),
  ];
  const syllabusIssues = syllabi.flatMap((result) => result.issues);
  const errors = report.issues.filter(isError).length + syllabusIssues.filter(isError).length;
  const warnings = report.issues.length + syllabusIssues.length - errors;
  for (const line of lines) console.log(line);
  const topics = report.topics.length;
  const lessons = report.topics.reduce((n, topic) => n + topic.lessons.length, 0);
  const groups = [...new Set(report.topics.map((topic) => topic.topic.data.age_group).filter((group) => typeof group === "string"))];
  const notes = report.topics.map(stepNote).filter((note): note is string => note !== undefined);
  console.log(
    `${lines.length > 0 ? "\n" : ""}${command}: ${report.files} file markdown (${topics} topic, ${lessons} bài) · nhóm ${groups.join(", ") || "-"} · ` +
      `${errors} lỗi · ${warnings} cảnh báo · gốc nội dung ${options.display(report.root)} · luật ${report.rulesDisplay} · app ${options.minAppVersion}` +
      syllabi.map(syllabusSummary).join(""),
  );
  for (const note of notes) console.log(note);
  return errors;
}

/** validate also checks <folder>/syllabus.json of a folder input (content/), SK-030; import does not. */
export function runMarkdownValidate(options: MdOptions): number {
  const report = check(options);
  if (!report.ok) {
    for (const message of report.messages) (report.exit === 2 ? console.error : console.log)(message);
    return report.exit;
  }
  const syllabi = syllabusFilesOf(options.inputs).map((file) => checkSyllabus(file, options.display));
  return printReport("validate", report, options, syllabi) > 0 ? 1 : 0;
}

/** Files a topic output folder may hold (anything else: refuse to replace it). */
const JSON_ENTRY = /^(topic|\d{2}-.+)\.json$/;

export function runImport(options: MdOptions & { out: string }): number {
  const report = check(options);
  if (!report.ok) {
    for (const message of report.messages) (report.exit === 2 ? console.error : console.log)(message);
    return report.exit;
  }
  const errors = printReport("import", report, options);
  if (errors > 0) {
    console.log(`import: không ghi gì (còn ${errors} lỗi). Sửa file .md rồi chạy lại; validate cho cùng danh sách lỗi.`);
    return 1;
  }

  // Where each topic goes: <out>/<age_group>/<slug>/. Check every target before writing any.
  const outRoot = path.resolve(options.out);
  const plans = report.topics.map((topic) => {
    const group = String(topic.topic.data.age_group);
    const slug = String(topic.topic.data.slug);
    return { topic, target: path.join(outRoot, group, slug) };
  });
  const problems: string[] = [];
  const targets = new Set<string>();
  for (const { topic, target } of plans) {
    if (targets.has(target)) problems.push(`${options.display(target)}: hai chủ đề cùng ghi vào một thư mục`);
    targets.add(target);
    if (!existsSync(target)) continue;
    if (!statSync(target).isDirectory()) {
      problems.push(`${options.display(target)}: không phải thư mục`);
      continue;
    }
    if (realpathSync(target) === realpathSync(topic.dir)) {
      problems.push(`${options.display(target)}: là thư mục markdown nguồn; chọn --out khác`);
      continue;
    }
    const strangers = readdirSync(target).filter((name) => name !== ".DS_Store" && !JSON_ENTRY.test(name));
    if (strangers.length > 0) problems.push(`${options.display(target)}: có ${strangers.map((name) => JSON.stringify(name)).join(", ")}, không phải đầu ra của import; chọn --out khác hoặc tự xoá`);
  }
  if (problems.length > 0) {
    for (const problem of problems) console.error(`--out ${problem}. import thay cả thư mục của mỗi chủ đề.`);
    return 2;
  }

  const written: string[] = [];
  for (const { topic, target } of plans) {
    const files = [
      { name: "topic.json", data: topic.topic.data },
      ...topic.lessons.map((lesson) => ({ name: path.basename(lesson.doc.path).replace(/\.md$/, ".json"), data: lesson.data })),
    ];
    const parent = path.dirname(target);
    mkdirSync(parent, { recursive: true });
    const staging = path.join(parent, `.${path.basename(target)}.tmp-${process.pid}`);
    const retired = path.join(parent, `.${path.basename(target)}.old-${process.pid}`);
    rmSync(staging, { recursive: true, force: true });
    try {
      mkdirSync(staging);
      for (const file of files) writeFileSync(path.join(staging, file.name), `${JSON.stringify(file.data, null, 2)}\n`);
      for (const file of files) {
        if (readFileSync(path.join(staging, file.name), "utf8") !== `${JSON.stringify(file.data, null, 2)}\n`) throw new Error(`${file.name}: ghi ra không khớp`);
      }
      rmSync(retired, { recursive: true, force: true });
      if (existsSync(target)) renameSync(target, retired);
      renameSync(staging, target);
      rmSync(retired, { recursive: true, force: true });
    } finally {
      rmSync(staging, { recursive: true, force: true });
    }
    written.push(...files.map((file) => path.join(target, file.name)));
  }
  console.log(`import: ghi ${written.length} file JSON (schema v1) vào ${options.display(outRoot)}`);
  for (const file of written) console.log(`  ${options.display(file)}`);
  console.log(nextSteps(plans.map(({ target }) => target), written, outRoot, options.cwd));
  return 0;
}

/**
 * The rest of the path: tts en, tts vi, build (README "Markdown: validate, import, ids").
 * Default --out: both tts runs write content/.build/tts/<age_group>/<slug>/ (tts may overwrite
 * its own copies there). Elsewhere: <parent>/tts-en/… then <parent>/tts-vi/… (tts never writes
 * over its input outside content/.build), build into <parent>/pack. Folder names keep the slug:
 * content-schema checks that topic.json sits in a folder named after it.
 */
function nextSteps(targets: string[], written: string[], outRoot: string, cwd: string): string {
  const defaultOut = path.resolve(outRoot) === DEFAULT_JSON_DIR;
  const parent = path.dirname(outRoot);
  const enRoot = defaultOut ? path.join(REPO_ROOT, "content", ".build", "tts") : path.join(parent, "tts-en");
  const viRoot = defaultOut ? enRoot : path.join(parent, "tts-vi");
  const lines = ["", "Tiếp theo (tts và build đọc JSON này):"];
  for (const target of targets) {
    const relative = path.relative(outRoot, target);
    const en = path.join(enRoot, relative);
    const vi = path.join(viRoot, relative);
    const files = written.filter((file) => path.dirname(file) === target).map((file) => path.basename(file));
    const list = (dir: string) => files.map((name) => arg(cwd, path.join(dir, name))).join(" ");
    lines.push(`  ${npmRun(cwd, "tts")} ${list(target)} --lang en --out ${arg(cwd, en)}`);
    lines.push(`  ${npmRun(cwd, "tts")} ${list(en)} --lang vi --out ${arg(cwd, vi)}`);
    lines.push(`  ${npmRun(cwd, "build")} ${list(vi)}${defaultOut ? "" : ` --out ${arg(cwd, path.join(parent, "pack"))}`}`);
  }
  return lines.join("\n");
}

export function runIds(options: MdOptions): number {
  const found = discover(options.inputs, options.display);
  if (!found.ok) {
    for (const message of found.messages) (found.exit === 2 ? console.error : console.log)(message);
    return found.exit;
  }
  const root = contentRootFor(found.topics.map((topic) => topic.dir), options.contentRoot);
  const index = scanRoot(root, found.topics.map((topic) => topic.dir), new Set(), options.display);
  const taken = new Set(index.ids.map((occurrence) => occurrence.value));
  let total = 0;
  let changed = 0;
  let skippedCount = 0;
  const files = found.topics.flatMap((topic) => topic.requested);
  for (const file of files) {
    const doc = readParsed(file, options.display);
    const { text, added, skipped } = fillIds(doc, taken);
    for (const skip of skipped) console.log(`${doc.display}:${skip.line} bỏ qua "${skip.heading}": ${skip.reason}`);
    skippedCount += skipped.length;
    if (text === undefined) continue;
    writeFileSync(file, text);
    changed += 1;
    total += added.length;
    for (const id of added) console.log(`${doc.display}:${id.line} ${id.uuid}`);
  }
  const tail = skippedCount > 0 ? ` · bỏ qua ${skippedCount} khối (xem trên)` : "";
  console.log(`${total + skippedCount > 0 ? "\n" : ""}ids: ${total} id mới trong ${changed} file (đọc ${files.length} file)${total === 0 ? "; không có id trống" : ""}${tail}`);
  return 0;
}

