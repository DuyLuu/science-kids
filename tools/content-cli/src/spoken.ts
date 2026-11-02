// Every Spoken string of a topic/lesson file, located through the JSON Schema of
// packages/content-schema (a $ref to common.schema.json#/$defs/Spoken), never by field name.
// Text fields (image alt, recall_from.note, misconception statement/correction) are not Spoken.
import { readdirSync, readFileSync } from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { getAt } from "./json-pointer.ts";
import { SchemaWalker } from "./schema-walk.ts";

export type Lang = "en" | "vi";
export type SpokenNode = { en: string; vi: string; audio?: Partial<Record<Lang, string>> };
export type SpokenRef = { pointer: string; node: SpokenNode };
export type ContentKind = "topic" | "lesson";

const SCHEMA_DIR = path.dirname(fileURLToPath(import.meta.resolve("@science-kids/content-schema/schema/common.schema.json")));

let cached: { walker: SchemaWalker; base: string } | undefined;

function load(): { walker: SchemaWalker; base: string } {
  if (!cached) {
    const files = readdirSync(SCHEMA_DIR).filter((name) => name.endsWith(".schema.json")).sort();
    const schemas = files.map((name) => JSON.parse(readFileSync(path.join(SCHEMA_DIR, name), "utf8")));
    const common = schemas.find((schema) => String(schema.$id).endsWith("/common.schema.json"));
    if (!common) throw new Error(`không thấy common.schema.json trong ${SCHEMA_DIR}`);
    cached = { walker: new SchemaWalker(schemas), base: String(common.$id).replace(/common\.schema\.json$/, "") };
  }
  return cached;
}

/** Absolute URI of the Spoken definition, e.g. https://…/v1/common.schema.json#/$defs/Spoken */
export function spokenUri(): string {
  return `${load().base}common.schema.json#/$defs/Spoken`;
}

/**
 * Pointers (document order) of every value the schema types as `common.schema.json#/$defs/<def>`,
 * e.g. "Image" or "AssetHash". Same walk as collectSpoken.
 */
export function locateCommon(kind: ContentKind, doc: unknown, def: string): string[] {
  const { walker, base } = load();
  return walker.locate(`${base}${kind}.schema.json`, doc, `${base}common.schema.json#/$defs/${def}`);
}

/** Spoken strings of one (already validated) document, in document order. */
export function collectSpoken(kind: ContentKind, doc: unknown): SpokenRef[] {
  const pointers = locateCommon(kind, doc, "Spoken");
  return pointers.map((pointer) => {
    const node = getAt(doc, pointer) as SpokenNode;
    if (node === null || typeof node !== "object" || typeof node.en !== "string") {
      throw new Error(`${pointer}: schema nói đây là Spoken nhưng giá trị không có en`);
    }
    return { pointer, node };
  });
}
