// `content-cli validate <topic.json> <lesson.json>...`: content schema (packages/content-schema:
// Ajv + zod + cross-file checks), then the authoring rules of the topic's age group (SK-026).
// Reads JSON only; parsing markdown comes later (technical-plan.md B16). Writes nothing.
// Exit 0 = no error (warnings allowed), 1 = content error, 2 = wrong usage (cli.ts).
import { existsSync, readFileSync, statSync } from "node:fs";
import path from "node:path";
import { validateDocuments } from "@science-kids/content-schema/validate";
import { loadRules } from "../build/rules.ts";
import { displayPointer } from "../json-pointer.ts";
import type { ContentKind } from "../spoken.ts";
import { checkAgeRules, formatIssue, type AgeDoc } from "./age-rules.ts";

export type ValidateOptions = {
  files: string[];
  rulesFile: string;
  minAppVersion: string;
  /** Paths are printed relative to this. */
  display: (target: string) => string;
};

export function runValidate(options: ValidateOptions): number {
  const docs: (AgeDoc & { text: string })[] = [];
  for (const file of options.files) {
    const absolute = path.resolve(file);
    const display = options.display(absolute);
    if (!existsSync(absolute) || !statSync(absolute).isFile()) {
      console.log(`${display} / không tìm thấy file`);
      return 1;
    }
    if (docs.some((doc) => doc.display === display)) continue;
    const text = readFileSync(absolute, "utf8");
    let data: AgeDoc["data"];
    try {
      data = JSON.parse(text);
    } catch (error) {
      console.log(`${display} / JSON không hợp lệ: ${(error as Error).message}`);
      return 1;
    }
    docs.push({ display, text, data });
  }

  // 1. Content schema: the age rules assume a valid shape.
  const schema = validateDocuments(docs.map((doc) => ({ file: doc.display, text: doc.text })));
  if (!schema.ok) {
    for (const error of schema.errors) console.log(`${error.file} ${displayPointer(error.pointer)} ${error.message}`);
    console.log(`\nvalidate: ${schema.errors.length} lỗi content-schema; chưa kiểm luật theo tuổi. Bài lẻ thì đưa kèm topic.json.`);
    return 1;
  }

  // 2. content/rules.json.
  const rulesDisplay = options.display(path.resolve(options.rulesFile));
  const { rules, errors: rulesErrors } = loadRules(path.resolve(options.rulesFile));
  if (!rules) {
    for (const error of rulesErrors) console.log(`${rulesDisplay} ${displayPointer(error.pointer)} ${error.message}`);
    console.log(`\nvalidate: ${rulesDisplay} không hợp lệ (${rulesErrors.length} lỗi).`);
    return 1;
  }

  // 3. Authoring rules per age group. Errors first, then warnings, each in document order.
  const issues = checkAgeRules(docs, rules, { minAppVersion: options.minAppVersion, mode: "validate", rulesDisplay });
  const errors = issues.filter((issue) => issue.severity === "error");
  const warnings = issues.filter((issue) => issue.severity === "warning");
  for (const issue of [...errors, ...warnings]) console.log(formatIssue(issue));
  const count = (kind: ContentKind) => docs.filter((doc) => doc.data.kind === kind).length;
  const groups = [...new Set(docs.filter((doc) => doc.data.kind === "topic").map((doc) => String(doc.data.age_group)))];
  console.log(
    `${issues.length > 0 ? "\n" : ""}validate: ${docs.length} file (${count("topic")} topic, ${count("lesson")} lesson) · nhóm ${groups.join(", ") || "-"} · ` +
      `${errors.length} lỗi · ${warnings.length} cảnh báo · luật ${rulesDisplay} · app ${options.minAppVersion}`,
  );
  return errors.length > 0 ? 1 : 0;
}
