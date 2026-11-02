// Schema-guided walk: which instance locations does a given $defs entry (e.g. Spoken) apply to?
// Follows the 2020-12 applicators ($ref, allOf, anyOf/oneOf, if/then/else, dependentSchemas,
// properties, patternProperties, additionalProperties, prefixItems, items, contains). `if`,
// the anyOf/oneOf branches and `contains` are decided by Ajv on the same schemas. Any other applicator that could
// reach a value throws, so a schema change can never silently drop a Spoken string.
import { Ajv2020, type ValidateFunction } from "ajv/dist/2020.js";
import { escapeToken, toPointer, unescapeToken, type Token } from "./json-pointer.ts";

type SchemaObject = Record<string, unknown>;
type Schema = boolean | SchemaObject;

/** Keywords that apply a subschema to (part of) the instance and that this walker does not follow. */
const UNSUPPORTED = ["dependencies", "unevaluatedItems"];

export class SchemaWalker {
  private readonly documents = new Map<string, Schema>();
  private readonly ajv: Ajv2020;
  private readonly matchers = new Map<string, ValidateFunction>();

  constructor(schemas: SchemaObject[]) {
    // Not strict: WarmupItem adds `required` next to a $ref (valid 2020-12, trips strictRequired).
    this.ajv = new Ajv2020({ strict: false, allErrors: false });
    for (const schema of schemas) {
      const id = schema.$id;
      if (typeof id !== "string") throw new Error("schema-walk: schema thiếu $id");
      this.documents.set(stripFragment(id), schema);
      this.ajv.addSchema(schema);
    }
  }

  /**
   * Pointers (in instance document order) of every value that the schema at `rootUri` applies
   * the subschema `targetUri` to. `targetUri` is absolute, e.g. ".../common.schema.json#/$defs/Spoken".
   */
  locate(rootUri: string, instance: unknown, targetUri: string): string[] {
    const found = new Set<string>();
    this.visit(normalizeUri(rootUri), instance, [], normalizeUri(targetUri), found, 0);
    return documentOrder(instance).filter((pointer) => found.has(pointer));
  }

  private visit(uri: string, instance: unknown, path: Token[], target: string, found: Set<string>, depth: number): void {
    if (depth > 200) throw new Error(`schema-walk: $ref lồng quá sâu tại ${uri}`);
    if (uri === target) {
      found.add(toPointer(path));
      return;
    }
    const schema = this.resolve(uri);
    if (typeof schema === "boolean") return;
    const base = stripFragment(uri);
    const here = (...tokens: Token[]) => `${uri}${uri.includes("#") ? "" : "#"}${tokens.map((t) => `/${fragmentToken(t)}`).join("")}`;
    const next = (child: string, value: unknown, childPath: Token[]) => this.visit(child, value, childPath, target, found, depth + 1);

    if (typeof schema.$id === "string" && stripFragment(schema.$id) !== base) {
      throw new Error(`schema-walk: chưa hỗ trợ $id lồng bên trong schema (${uri})`);
    }
    for (const keyword of UNSUPPORTED) {
      if (keyword in schema) throw new Error(`schema-walk: chưa hỗ trợ "${keyword}" (${uri})`);
    }
    if (isObject(schema.unevaluatedProperties)) {
      throw new Error(`schema-walk: chưa hỗ trợ unevaluatedProperties dạng schema (${uri})`);
    }

    if (typeof schema.$ref === "string") next(normalizeUri(new URL(schema.$ref, base).href), instance, path);
    if (Array.isArray(schema.allOf)) schema.allOf.forEach((_, i) => next(here("allOf", i), instance, path));
    for (const keyword of ["anyOf", "oneOf"] as const) {
      const branches = schema[keyword];
      if (Array.isArray(branches)) {
        branches.forEach((_, i) => {
          if (this.matches(here(keyword, i), instance)) next(here(keyword, i), instance, path);
        });
      }
    }
    if ("if" in schema) {
      const passed = this.matches(here("if"), instance);
      if (passed && "then" in schema) next(here("then"), instance, path);
      if (!passed && "else" in schema) next(here("else"), instance, path);
    }

    if (isObject(instance) && isObject(schema.dependentSchemas)) {
      for (const key of Object.keys(schema.dependentSchemas)) {
        if (Object.hasOwn(instance, key)) next(here("dependentSchemas", key), instance, path);
      }
    }

    if (isObject(instance)) {
      const properties = isObject(schema.properties) ? schema.properties : {};
      const patterns = isObject(schema.patternProperties) ? Object.keys(schema.patternProperties) : [];
      for (const key of Object.keys(instance)) {
        const value = instance[key];
        let covered = false;
        if (Object.hasOwn(properties, key)) {
          covered = true;
          next(here("properties", key), value, [...path, key]);
        }
        for (const pattern of patterns) {
          if (new RegExp(pattern, "u").test(key)) {
            covered = true;
            next(here("patternProperties", pattern), value, [...path, key]);
          }
        }
        if (!covered && isObject(schema.additionalProperties)) next(here("additionalProperties"), value, [...path, key]);
      }
    }

    if (Array.isArray(instance)) {
      const prefix = Array.isArray(schema.prefixItems) ? schema.prefixItems.length : 0;
      instance.forEach((value, i) => {
        if (i < prefix) next(here("prefixItems", i), value, [...path, i]);
        else if ("items" in schema && schema.items !== true) next(here("items"), value, [...path, i]);
        if ("contains" in schema && this.matches(here("contains"), value)) next(here("contains"), value, [...path, i]);
      });
    }
  }

  private resolve(uri: string): Schema {
    const [base, fragment = ""] = uri.split("#");
    const document = this.documents.get(base!);
    if (document === undefined) throw new Error(`schema-walk: không có schema ${base}`);
    let node: unknown = document;
    if (fragment !== "") {
      if (!fragment.startsWith("/")) throw new Error(`schema-walk: chỉ hỗ trợ $ref dạng JSON pointer (${uri})`);
      for (const raw of fragment.slice(1).split("/")) {
        const token = unescapeToken(decodeURIComponent(raw));
        if (node === null || typeof node !== "object") throw new Error(`schema-walk: $ref trỏ vào chỗ không có (${uri})`);
        node = (node as Record<string, unknown>)[token];
      }
    }
    if (typeof node !== "boolean" && !isObject(node)) throw new Error(`schema-walk: $ref trỏ vào chỗ không phải schema (${uri})`);
    return node;
  }

  private matches(uri: string, instance: unknown): boolean {
    const validate = this.matchers.get(uri) ?? this.ajv.compile({ $ref: uri });
    this.matchers.set(uri, validate);
    return validate(instance) === true;
  }
}

/** JSON pointer token, made safe for a URI fragment (decoded again in resolve()). */
function fragmentToken(token: Token): string {
  return escapeToken(token).replace(/%/g, "%25").replace(/#/g, "%23").replace(/ /g, "%20");
}

function isObject(value: unknown): value is Record<string, unknown> {
  return value !== null && typeof value === "object" && !Array.isArray(value);
}

function stripFragment(uri: string): string {
  const index = uri.indexOf("#");
  return index === -1 ? uri : uri.slice(0, index);
}

/** "x.json#" and "x.json" are the same resource; keep one spelling so `uri === target` holds. */
function normalizeUri(uri: string): string {
  return uri.endsWith("#") ? uri.slice(0, -1) : uri;
}

/** Every pointer of the instance, depth first, keys in document order. */
function documentOrder(instance: unknown): string[] {
  const out: string[] = [];
  const walk = (value: unknown, path: Token[]) => {
    out.push(toPointer(path));
    if (Array.isArray(value)) value.forEach((item, i) => walk(item, [...path, i]));
    else if (isObject(value)) for (const key of Object.keys(value)) walk(value[key], [...path, key]);
  };
  walk(instance, []);
  return out;
}
