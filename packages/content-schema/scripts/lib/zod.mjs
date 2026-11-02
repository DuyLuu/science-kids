// zod side: src/*.ts (Node strips the types), issues normalised to { pointer, message }.
import { z } from "zod";
import { schemasByKind, withAssetsRequired } from "../../src/index.ts";
import { dedupe, toPointer } from "./pointer.mjs";

// Per-parse locale: built-in messages in Vietnamese without touching zod's global config.
const { localeError } = z.locales.vi();

/** @returns {{pointer: string, message: string}[]} empty when valid */
export function zodValidate(kind, data, { requireAssets = false } = {}) {
  const schema = schemasByKind[kind];
  if (!schema) throw new Error(`unknown kind ${kind}`);
  const result = withAssetsRequired(requireAssets, () => schema.safeParse(data, { error: localeError }));
  return result.success ? [] : normalizeZodIssues(result.error.issues);
}

export function normalizeZodIssues(issues) {
  const out = [];
  for (const issue of issues) {
    if (issue.code === "unrecognized_keys") {
      for (const key of issue.keys) {
        out.push({ pointer: toPointer([...issue.path, key]), message: `trường lạ "${key}"` });
      }
      continue;
    }
    out.push({ pointer: toPointer(issue.path), message: issue.message });
  }
  return dedupe(out);
}
