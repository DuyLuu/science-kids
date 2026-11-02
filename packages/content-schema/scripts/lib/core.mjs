// validate: every file through Ajv AND zod (they must agree), then the cross checks.
import { readdirSync, readFileSync, realpathSync, statSync } from "node:fs";
import path from "node:path";
import { ajvValidate } from "./ajv.mjs";
import { checkRefs } from "./refs.mjs";
import { zodValidate } from "./zod.mjs";

export const KINDS = ["topic", "lesson"];
const defaultEngines = { ajv: ajvValidate, zod: zodValidate };

/**
 * @typedef {{file: string, pointer: string, message: string, stage: "io"|"json"|"kind"|"schema"|"parity"|"refs"}} ValidationError
 * @typedef {{file: string, kind?: string, ajv?: {pointer: string, message: string}[], zod?: {pointer: string, message: string}[], errors: ValidationError[]}} FileResult
 */

/** Expand files and folders (recursively, *.json, skipping dot entries and node_modules). */
export function collectFiles(inputs) {
  const files = [];
  const errors = [];
  const visit = (target) => {
    let stat;
    try {
      stat = statSync(target);
    } catch {
      errors.push({ file: target, pointer: "", message: "không tìm thấy file hoặc thư mục", stage: "io" });
      return;
    }
    if (stat.isDirectory()) {
      for (const name of readdirSync(target).sort()) {
        if (name.startsWith(".") || name === "node_modules") continue;
        const child = path.join(target, name);
        if (statSync(child).isDirectory() || name.endsWith(".json")) visit(child);
      }
    } else {
      files.push(target);
    }
  };
  for (const input of inputs) visit(input);
  const seen = new Set();
  const unique = files.filter((file) => {
    const real = realpathSync(file);
    if (seen.has(real)) return false;
    seen.add(real);
    return true;
  });
  return { files: unique, errors };
}

/**
 * @param {{file: string, text?: string, data?: unknown}[]} inputs
 * @param {{requireAssets?: boolean, engines?: {ajv: Function, zod: Function}}} [options]
 */
export function validateDocuments(inputs, { requireAssets = false, engines = defaultEngines } = {}) {
  /** @type {FileResult[]} */
  const results = [];
  const docs = [];
  for (const input of inputs) {
    const result = { file: input.file, errors: [] };
    results.push(result);
    const fail = (pointer, message, stage) => result.errors.push({ file: input.file, pointer, message, stage });

    let data = input.data;
    if (input.text !== undefined) {
      try {
        data = JSON.parse(input.text);
      } catch (error) {
        fail("", `JSON không hợp lệ: ${error.message}`, "json");
        continue;
      }
    }
    if (data === null || typeof data !== "object" || Array.isArray(data)) {
      fail("", "file phải là một object JSON {…}", "kind");
      continue;
    }
    if (!KINDS.includes(data.kind)) {
      const got = data.kind === undefined ? "thiếu kind" : `kind ${JSON.stringify(data.kind)} không hợp lệ`;
      fail("/kind", `${got}; phải là "topic" hoặc "lesson"`, "kind");
      continue;
    }
    result.kind = data.kind;
    result.ajv = engines.ajv(data.kind, data, { requireAssets });
    result.zod = engines.zod(data.kind, data, { requireAssets });
    const ajvOk = result.ajv.length === 0;
    const zodOk = result.zod.length === 0;
    for (const error of result.ajv) fail(error.pointer, error.message, "schema");
    if (ajvOk && !zodOk) {
      for (const issue of result.zod) fail(issue.pointer, `parity: JSON Schema chấp nhận nhưng zod từ chối: ${issue.message}`, "parity");
    }
    if (!ajvOk && zodOk) {
      fail(result.ajv[0].pointer, "parity: zod chấp nhận nhưng JSON Schema từ chối (các lỗi ở trên)", "parity");
    }
    docs.push({ file: input.file, kind: data.kind, data, schemaOk: ajvOk && zodOk });
  }

  const byFile = new Map(results.map((result) => [result.file, result]));
  for (const error of checkRefs(docs)) byFile.get(error.file).errors.push({ ...error, stage: "refs" });

  const errors = results.flatMap((result) => result.errors);
  const valid = results.filter((result) => result.errors.length === 0);
  return {
    ok: errors.length === 0,
    results,
    errors,
    counts: {
      files: results.length,
      valid: valid.length,
      topic: valid.filter((result) => result.kind === "topic").length,
      lesson: valid.filter((result) => result.kind === "lesson").length,
    },
  };
}

/** Files and folders on disk -> same report as validateDocuments, plus missing-path errors. */
export function validatePaths(inputs, options = {}) {
  const { files, errors: ioErrors } = collectFiles(inputs);
  // Relative to the cwd when the file is under it, absolute otherwise.
  const display = (file) => {
    const relative = path.relative(process.cwd(), file);
    return relative && !relative.startsWith("..") && !path.isAbsolute(relative) ? relative : path.resolve(file);
  };
  const docs = files.map((file) => ({ file: display(file), text: readFileSync(file, "utf8") }));
  const report = validateDocuments(docs, options);
  const errors = [...ioErrors, ...report.errors];
  return { ...report, ok: errors.length === 0, errors };
}
