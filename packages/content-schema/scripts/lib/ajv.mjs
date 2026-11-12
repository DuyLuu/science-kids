// JSON Schema side: Ajv (draft 2020-12) over schema/*.schema.json, errors normalised to
// { pointer, message } so they can be compared with the zod side.
import { readFileSync } from "node:fs";
import Ajv2020 from "ajv/dist/2020.js";
import { dedupe, join } from "./pointer.mjs";

export const SCHEMA_BASE = "https://science-kids.example/schema/content/v1/";
export const SCHEMA_FILES = ["common", "vocab-term", "collectible", "quiz-item", "block", "topic", "lesson"];
const SCHEMA_DIR = new URL("../../schema/", import.meta.url);

export function loadSchemas() {
  return SCHEMA_FILES.map((name) => JSON.parse(readFileSync(new URL(`${name}.schema.json`, SCHEMA_DIR), "utf8")));
}

// --require-assets = the same schemas with three extra `required`: Spoken.audio,
// SpokenAudio.en/vi, Image.asset. The files on disk stay the single source.
function requireAssets(schemas) {
  const copy = structuredClone(schemas);
  const defs = copy.find((schema) => schema.$id === `${SCHEMA_BASE}common.schema.json`).$defs;
  defs.Spoken.required = [...defs.Spoken.required, "audio"];
  defs.SpokenAudio.required = ["en", "vi"];
  defs.Image.required = [...defs.Image.required, "asset"];
  return copy;
}

// Strict except strictRequired: WarmupItem adds `required: ["recall_from"]` to a $ref'd
// QuizItem, which is valid 2020-12 but trips that one check. Shared with syllabus.mjs.
export const AJV_OPTIONS = Object.freeze({
  allErrors: true,
  verbose: true,
  strictSchema: true,
  strictNumbers: true,
  strictTypes: true,
  strictTuples: true,
  strictRequired: false,
});

const cache = new Map();

function validators(assets) {
  if (!cache.has(assets)) {
    const ajv = new Ajv2020(AJV_OPTIONS);
    const schemas = loadSchemas();
    for (const schema of assets ? requireAssets(schemas) : schemas) ajv.addSchema(schema);
    cache.set(assets, {
      topic: ajv.getSchema(`${SCHEMA_BASE}topic.schema.json`),
      lesson: ajv.getSchema(`${SCHEMA_BASE}lesson.schema.json`),
    });
  }
  return cache.get(assets);
}

/** @returns {{pointer: string, message: string}[]} empty when valid */
export function ajvValidate(kind, data, { requireAssets: assets = false } = {}) {
  const validate = validators(assets)[kind];
  if (!validate) throw new Error(`unknown kind ${kind}`);
  if (validate(data)) return [];
  return normalizeAjvErrors(validate.errors ?? []);
}

export function normalizeAjvErrors(errors) {
  const out = [];
  for (const error of errors) {
    // Wrappers that only repeat a deeper error: if/then dispatch, propertyNames, and the
    // per-item misses inside `contains` (the `contains` error itself is kept).
    if (error.keyword === "if" || error.keyword === "propertyNames") continue;
    if (error.schemaPath.includes("/contains/")) continue;
    out.push({ pointer: pointerOf(error), message: messageOf(error) });
  }
  return dedupe(out);
}

// Point at the field the error is about, not at its parent object.
function pointerOf(error) {
  const { instancePath: path, params } = error;
  if (error.propertyName !== undefined) return join(path, error.propertyName);
  switch (error.keyword) {
    case "required":
      return join(path, params.missingProperty);
    case "additionalProperties":
      return join(path, params.additionalProperty);
    case "unevaluatedProperties":
      return join(path, params.unevaluatedProperty);
    default:
      return path;
  }
}

const TYPE_VI = {
  string: "chuỗi",
  integer: "số nguyên",
  number: "số",
  boolean: "true hoặc false",
  object: "object {…}",
  array: "mảng […]",
  null: "null",
};

const show = (value) => {
  const text = JSON.stringify(value);
  return text === undefined ? String(value) : text.length > 60 ? `${text.slice(0, 57)}…` : text;
};

function messageOf(error) {
  const { params, parentSchema = {}, data } = error;
  const description = parentSchema.description;
  const count = Array.isArray(data) ? data.length : undefined;
  switch (error.keyword) {
    case "required": {
      const name = params.missingProperty;
      if (name === "audio") return "thiếu audio (cần audio.en và audio.vi)";
      if (name === "asset") return "hình thiếu asset";
      if (error.instancePath.endsWith("/audio")) return `thiếu audio.${name}`;
      // A rule-only schema (no `properties`) describes the rule it enforces.
      if (description && !parentSchema.properties) return description;
      return `thiếu trường bắt buộc "${name}"`;
    }
    case "additionalProperties":
      return `trường lạ "${params.additionalProperty}", không có trong schema v1`;
    case "unevaluatedProperties":
      return `trường lạ "${params.unevaluatedProperty}", không có trong schema v1 cho loại này`;
    case "type":
      // A union type (syllabus: ["string", "null"]) arrives as an array.
      return `phải là ${[params.type].flat().map((type) => TYPE_VI[type] ?? type).join(" hoặc ")}, đang là ${show(data)}`;
    case "enum":
      return `giá trị ${show(data)} không hợp lệ; được phép: ${params.allowedValues.join(", ")}`;
    case "const":
      return `phải là ${show(params.allowedValue)}, đang là ${show(data)}`;
    case "pattern": {
      const rule = description ?? `phải khớp ${params.pattern}`;
      return error.propertyName !== undefined ? `tên "${error.propertyName}" ${rule}` : `${rule}, đang là ${show(data)}`;
    }
    case "minItems":
    case "maxItems":
      if (parentSchema.minItems !== undefined && parentSchema.minItems === parentSchema.maxItems) {
        return `cần đúng ${parentSchema.minItems} phần tử, đang có ${count}`;
      }
      return error.keyword === "minItems"
        ? `cần ít nhất ${params.limit} phần tử, đang có ${count}`
        : `tối đa ${params.limit} phần tử, đang có ${count}`;
    case "minimum":
      return `phải ≥ ${params.limit}, đang là ${show(data)}`;
    case "maximum":
      return `phải ≤ ${params.limit}, đang là ${show(data)}`;
    case "minProperties":
      return `cần ít nhất ${params.limit} mục`;
    case "uniqueItems":
      return `phần tử ${params.i} trùng với phần tử ${params.j}`;
    case "contains":
    case "not":
      return description ?? error.message;
    case "false schema":
      return "trường này không được phép ở đây";
    default:
      return error.message ?? error.keyword;
  }
}
