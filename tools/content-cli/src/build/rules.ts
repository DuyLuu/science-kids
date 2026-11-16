// content/rules.json (B5.3: the single source of `rules`), checked against schema/rules.schema.json.
// build copies the file as is into manifest.rules; publish (later) copies it to app_config.
// `rules.<age_group>.authoring` (SK-026) is read by content-cli only (validate, build); the app and
// the server ignore it.
import { existsSync, readFileSync } from "node:fs";
import path from "node:path";
import { Ajv2020 } from "ajv/dist/2020.js";
import { CLI_ROOT } from "../paths.ts";

export const RULES_SCHEMA_FILE = path.join(CLI_ROOT, "schema", "rules.schema.json");
export const AGE_GROUPS = ["explorer", "discoverer", "scientist"] as const;
export type AgeGroup = (typeof AGE_GROUPS)[number];
export type Rules = Partial<Record<AgeGroup, Record<string, unknown>>>;
export type RulesError = { pointer: string; message: string };

/** Quiz length of content schema v1 (lesson.schema.json: quiz has exactly 6 items). */
export const QUIZ_LENGTH = 6;

export type Range = [number, number];
/** schema/rules.schema.json#/$defs/ImageSlot. */
export const IMAGE_SLOTS = ["question", "choice_option", "sequence_item", "true_false", "bank_word", "tray_item"] as const;
export type ImageSlot = (typeof IMAGE_SLOTS)[number];
/** rules.<age_group>.authoring, shape of schema/rules.schema.json#/$defs/Authoring. */
export type Authoring = {
  quiz_formats: string[];
  warmup_formats: string[];
  option_count: Partial<Record<string, Range>>;
  image_required: ImageSlot[];
  /** SK-033: missing image here is a warning (image_missing) unless image_required also lists the slot. */
  image_expected?: ImageSlot[];
  /** SK-033: every Image brief carries "Từ khoá tìm ảnh (EN): …" (warning image_brief_keywords). */
  image_search_keywords?: boolean;
  dok_mix: [number, number, number];
  first_item_dok: number;
  misconception_items: Range;
  min_formats: number;
  max_words_en?: number;
  /** SK-047: in one topic, at most max(1, floor(this × n)) of the n multi_choice items share a number of right answers. */
  multi_choice_correct_spread?: number;
  /** SK-047 (wave 1): every fill_blank_bank of the quiz puts a word of the lesson's vocab in a blank (warning). */
  vocab_item_uses_lesson_word?: boolean;
};

export function authoringOf(rules: Rules, group: string): Authoring | undefined {
  if (!Object.hasOwn(rules, group)) return undefined;
  return rules[group as AgeGroup]?.authoring as Authoring | undefined;
}

export function loadRules(file: string): { rules?: Rules; errors: RulesError[] } {
  if (!existsSync(file)) return { errors: [{ pointer: "", message: "không tìm thấy file" }] };
  let data: unknown;
  try {
    data = JSON.parse(readFileSync(file, "utf8"));
  } catch (error) {
    return { errors: [{ pointer: "", message: `JSON không hợp lệ: ${(error as Error).message}` }] };
  }
  const ajv = new Ajv2020({ allErrors: true, strict: true });
  const validate = ajv.compile(JSON.parse(readFileSync(RULES_SCHEMA_FILE, "utf8")));
  if (!validate(data)) {
    const errors = (validate.errors ?? []).map((error) => {
      const params = error.params as Record<string, unknown>;
      const detail = params.additionalProperty ?? params.propertyName ?? params.missingProperty;
      return { pointer: error.instancePath, message: `${error.message ?? "sai"}${detail ? `: ${String(detail)}` : ""} (rules.schema.json ${error.schemaPath})` };
    });
    return { errors };
  }
  const rules = data as Rules;
  const errors = authoringErrors(rules);
  return errors.length > 0 ? { errors } : { rules, errors };
}

/** What JSON Schema cannot say: every [min, max] has min <= max, dok_mix adds up to the quiz length. */
function authoringErrors(rules: Rules): RulesError[] {
  const errors: RulesError[] = [];
  for (const group of Object.keys(rules)) {
    const authoring = authoringOf(rules, group);
    if (!authoring) continue;
    const base = `/${group}/authoring`;
    const ranges: [string, Range][] = [
      ...Object.entries(authoring.option_count).map(([format, range]) => [`${base}/option_count/${format}`, range!] as [string, Range]),
      [`${base}/misconception_items`, authoring.misconception_items],
    ];
    for (const [pointer, [min, max]] of ranges) {
      if (min > max) errors.push({ pointer, message: `khoảng [${min}, ${max}] có min lớn hơn max` });
    }
    const total = authoring.dok_mix.reduce((sum, n) => sum + n, 0);
    if (total !== QUIZ_LENGTH) errors.push({ pointer: `${base}/dok_mix`, message: `tổng ${authoring.dok_mix.join(" + ")} = ${total}, phải bằng ${QUIZ_LENGTH} (số câu quiz)` });
  }
  return errors;
}
