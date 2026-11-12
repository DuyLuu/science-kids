// Ajv (JSON Schema) and zod must reach the same verdict on every fixture and on
// thousands of single-point mutations of the valid sample.
import assert from "node:assert/strict";
import { readdirSync } from "node:fs";
import test from "node:test";
import { ajvValidate } from "../scripts/lib/ajv.mjs";
import { validateDocuments } from "../scripts/lib/core.mjs";
import { zodValidate } from "../scripts/lib/zod.mjs";
import { ROOT, pointers, readJson, validLesson, validTopic } from "./helpers.mjs";

const fixtureFiles = () => {
  const list = [];
  const walk = (dir) => {
    for (const entry of readdirSync(`${ROOT}${dir}`, { withFileTypes: true })) {
      if (entry.isDirectory()) walk(`${dir}/${entry.name}`);
      else if (entry.name.endsWith(".json")) list.push(`${dir}/${entry.name}`);
    }
  };
  walk("fixtures");
  return list.sort();
};

test("every fixture: Ajv verdict = zod verdict, same pointers", () => {
  const files = fixtureFiles();
  assert.ok(files.length >= 12);
  for (const file of files) {
    const data = readJson(file);
    const ajv = ajvValidate(data.kind, data);
    const zod = zodValidate(data.kind, data);
    assert.equal(ajv.length === 0, zod.length === 0, `${file}: Ajv ${ajv.length} lỗi, zod ${zod.length} lỗi`);
    assert.deepEqual(pointers(ajv), pointers(zod), file);
  }
});

// With --require-assets the asset rule is a zod refinement, and zod skips refinements of an
// object that already failed (eg an Image without alt), while Ajv (allErrors) reports both.
// The verdict must still match and zod must never report a pointer Ajv does not.
test("every fixture (--require-assets): Ajv verdict = zod verdict, zod pointers within Ajv's", () => {
  for (const file of fixtureFiles()) {
    const data = readJson(file);
    const ajv = pointers(ajvValidate(data.kind, data, { requireAssets: true }));
    const zod = pointers(zodValidate(data.kind, data, { requireAssets: true }));
    assert.equal(ajv.length === 0, zod.length === 0, file);
    assert.deepEqual(zod.filter((pointer) => !ajv.includes(pointer)), [], file);
  }
});

// --- mutation sweep -------------------------------------------------------------------
function* nodes(value, path = []) {
  yield path;
  if (Array.isArray(value)) for (let i = 0; i < value.length; i++) yield* nodes(value[i], [...path, i]);
  else if (value && typeof value === "object") for (const key of Object.keys(value)) yield* nodes(value[key], [...path, key]);
}
const get = (root, path) => path.reduce((node, key) => node[key], root);
const wrongValue = (value) => {
  if (typeof value === "string") return 7;
  if (typeof value === "number") return "7";
  if (typeof value === "boolean") return "true";
  if (Array.isArray(value)) return {};
  if (value && typeof value === "object") return [];
  return null;
};

function* mutations(doc) {
  for (const path of nodes(doc)) {
    if (path.length === 0) continue;
    const parentPath = path.slice(0, -1);
    const last = path.at(-1);
    const parent = get(doc, parentPath);
    const value = parent[last];
    const set = (fn, label) => {
      const copy = structuredClone(doc);
      fn(get(copy, parentPath), last);
      return { label: `${label} /${path.join("/")}`, copy };
    };
    yield set((p, k) => (p[k] = wrongValue(value)), "wrong type at");
    if (Array.isArray(parent)) {
      yield set((p, k) => p.splice(k, 1), "remove item");
      yield set((p, k) => p.splice(k, 0, structuredClone(p[k])), "duplicate item");
    } else {
      yield set((p, k) => delete p[k], "delete");
    }
    if (value && typeof value === "object" && !Array.isArray(value)) {
      yield set((p, k) => (p[k].zz_unknown = 1), "unknown field in");
    }
    if (typeof value === "string") {
      yield set((p, k) => (p[k] = ""), "empty string at");
      yield set((p, k) => (p[k] = value.toUpperCase()), "uppercase at");
    }
    if (typeof value === "number") {
      yield set((p, k) => (p[k] = value + 10), "+10 at");
      yield set((p, k) => (p[k] = -1), "-1 at");
      yield set((p, k) => (p[k] = value + 0.5), "+0.5 at");
    }
    if (typeof value === "boolean") yield set((p, k) => (p[k] = !value), "flip");
  }
}

for (const [name, make, minimum] of [["topic", validTopic, 100], ["lesson", validLesson, 1000]]) {
  test(`mutation sweep on the valid ${name}: Ajv verdict = zod verdict`, () => {
    let total = 0;
    let rejected = 0;
    const mismatches = [];
    for (const { label, copy } of mutations(make())) {
      total++;
      for (const requireAssets of [false, true]) {
        const ajv = ajvValidate(name, copy, { requireAssets });
        const zod = zodValidate(name, copy, { requireAssets });
        if ((ajv.length === 0) !== (zod.length === 0)) mismatches.push(`${label}${requireAssets ? " [assets]" : ""}: Ajv ${JSON.stringify(ajv)} / zod ${JSON.stringify(zod)}`);
        else if (ajv.length > 0 && !ajv.some((a) => zod.some((z) => z.pointer === a.pointer))) {
          mismatches.push(`${label}: no common pointer, Ajv ${pointers(ajv)} / zod ${pointers(zod)}`);
        }
        if (!requireAssets && ajv.length > 0) rejected++;
      }
    }
    assert.deepEqual(mismatches.slice(0, 10), [], `${mismatches.length} mismatches of ${total}`);
    assert.ok(total > minimum && rejected > total / 3, `sweep too small: ${total} mutations, ${rejected} rejected`);
  });
}

// The valid lesson has no image on a bank word (SK-033 added the field): sweep only the bank of
// a copy that has one, so the new field gets the same Ajv = zod check as the rest.
test("mutation sweep on a bank word with an image: Ajv verdict = zod verdict", () => {
  const lesson = validLesson();
  const w = lesson.warmup.findIndex((item) => item.format === "fill_blank_bank");
  lesson.warmup[w].bank[0].image = { alt: { en: "Air bubbles in water", vi: "Bọt khí trong nước" }, brief: "Bọt khí, ảnh chụp" };
  assert.deepEqual(validateDocuments([{ file: "t.json", data: validTopic() }, { file: "l.json", data: lesson }]).errors, []);
  const prefix = `/warmup/${w}/bank`;
  let total = 0;
  const mismatches = [];
  for (const { label, copy } of mutations(lesson)) {
    if (!label.includes(` ${prefix}`)) continue; // labels end with " /<path>"
    total++;
    for (const requireAssets of [false, true]) {
      const ajv = ajvValidate("lesson", copy, { requireAssets });
      const zod = zodValidate("lesson", copy, { requireAssets });
      if ((ajv.length === 0) !== (zod.length === 0)) mismatches.push(`${label}${requireAssets ? " [assets]" : ""}: Ajv ${JSON.stringify(ajv)} / zod ${JSON.stringify(zod)}`);
    }
  }
  assert.deepEqual(mismatches.slice(0, 10), [], `${mismatches.length} mismatches of ${total}`);
  assert.ok(total > 40, `sweep too small: ${total}`);
});

test("validate reports parity when the two engines disagree", () => {
  const lenient = () => [];
  const strict = () => [{ pointer: "/title", message: "boom" }];
  const doc = { file: "x.json", data: validTopic() };
  const zodOnly = validateDocuments([doc], { engines: { ajv: lenient, zod: strict } });
  assert.deepEqual(zodOnly.errors.map((e) => [e.stage, e.pointer]), [["parity", "/title"]]);
  assert.match(zodOnly.errors[0].message, /^parity: /);
  const ajvOnly = validateDocuments([doc], { engines: { ajv: strict, zod: lenient } });
  assert.deepEqual(ajvOnly.errors.map((e) => e.stage), ["schema", "parity"]);
  const lesson = validLesson();
  assert.equal(validateDocuments([doc, { file: "y.json", data: lesson }], { engines: { ajv: lenient, zod: lenient } }).ok, true);
});
