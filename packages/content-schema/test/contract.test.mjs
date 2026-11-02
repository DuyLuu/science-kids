// "Hợp đồng trường v1" (SK-001) transcribed by hand, checked against BOTH the JSON Schema
// files and the zod mirror: same fields, same required/optional, same enum values,
// same discriminators, and every $defs name has a zod export of the same name.
import assert from "node:assert/strict";
import test from "node:test";
import * as zod from "../src/index.ts";
import { loadSchemas } from "../scripts/lib/ajv.mjs";

const QUIZ_BASE = "id key format version dok prompt instruction? image? hint explanation_correct explanation_wrong misconception_id? p_correct? recall_from?";
const BLOCK_BASE = "id key type version min_app_version?";

// `x?` = optional (absent is valid; fields with a default are optional too).
// Interpretations of the ticket table, recorded in SK-001 "Quyết định đã ghi" (D9-D10):
//   Lesson.sensitive/archived/ai_draft default false like Topic (table lists them without "?").
const CONTRACT = {
  Text: "en vi",
  Spoken: "en vi audio?",
  SpokenAudio: "en? vi?",
  Image: "alt brief? asset?",
  Topic: "kind schema_version id slug age_group order title question? strand level difficulty prerequisite_topic_ids is_free oak_unit_ref? sensitive? archived? ai_draft? misconceptions",
  Difficulty: "abstraction prior_knowledge misconception vocabulary science_skill",
  Misconception: "id key statement correction note?",
  Lesson: "kind schema_version id topic_id slug order stage title objective key_points est_minutes sensitive? archived? ai_draft? warmup learn play quiz vocab reward",
  Reward: "collectible?",
  BlockBase: BLOCK_BASE,
  ExploreGroups: `${BLOCK_BASE} prompt groups complete_when`,
  ExploreGroup: "key label color sentence image? examples",
  SentenceCard: `${BLOCK_BASE} text image?`,
  WordList: `${BLOCK_BASE} title? term_keys`,
  BuildTray: `${BLOCK_BASE} prompt capacity groups items messages success_when`,
  TrayGroup: "key label color role",
  TrayItem: "key label group image?",
  TrayMessages: "start full balanced has_limited missing",
  QuizBase: QUIZ_BASE,
  ChoiceOption: "key label image? correct",
  SingleChoice: `${QUIZ_BASE} options`,
  MultiChoice: `${QUIZ_BASE} options`,
  TrueFalse: `${QUIZ_BASE} answer statement? speaker? labels?`,
  TrueFalseLabels: "true false",
  FillBlankBank: `${QUIZ_BASE} sentence bank answers`,
  BankWord: "key label",
  OrderSequence: `${QUIZ_BASE} items answer`,
  SequenceItem: "key label image?",
  PictureBarChart: `${QUIZ_BASE} chart options`,
  BarChart: "title? unit? bars",
  Bar: "key label image? value",
  RecallFromPriorKnowledge: "kind note",
  RecallFromLesson: "kind lesson_id",
  VocabTerm: "id key term example image? tier?",
  Collectible: "id key set name tag? image fact rarity?",
};

const UNIONS = {
  QuizItem: ["format", ["single_choice", "multi_choice", "true_false", "fill_blank_bank", "order_sequence", "picture_bar_chart"]],
  RecallFrom: ["kind", ["prior_knowledge", "lesson"]],
  LearnBlock: ["type", ["explore_groups", "sentence_card", "word_list"]],
  PlayBlock: ["type", ["build_tray"]],
  Block: ["type", ["explore_groups", "sentence_card", "word_list", "build_tray"]],
};

const ENUMS = {
  "Topic.age_group": ["explorer", "discoverer", "scientist"],
  "Topic.strand": ["plants_animals", "living_environment", "humans_health", "materials", "energy_forces", "earth_sky"],
  "Lesson.stage": ["opener", "core", "apply", "review"],
  "TrayGroup.role": ["required", "limit", "neutral"],
  "VocabTerm.tier": ["core", "extra"],
  "Collectible.rarity": ["common", "rare"],
};
const COLOR_TOKENS = ["do_son", "vang_hoe", "gi_dong", "cham", "nau_dat"];

// Not part of the field table: scalar types, rule wrappers around QuizItem.
const NOT_IN_TABLE = ["NonEmptyString", "AssetHash", "Uuid", "Key", "Slug", "AppVersion", "ColorToken", "SchemaVersion", "WarmupItem", "LessonQuizItem"];

const defs = Object.assign({}, ...loadSchemas().map((schema) => schema.$defs));
const parse = (spec) => {
  const fields = spec.split(/\s+/);
  return { all: fields.map((f) => f.replace("?", "")).sort(), required: fields.filter((f) => !f.endsWith("?")).sort() };
};

function jsonSchemaFields(name) {
  const def = defs[name];
  const base = def.$ref?.startsWith("#/$defs/") ? jsonSchemaFields(def.$ref.slice("#/$defs/".length)) : { all: [], required: [] };
  return {
    all: [...new Set([...base.all, ...Object.keys(def.properties ?? {})])].sort(),
    required: [...new Set([...base.required, ...(def.required ?? [])])].sort(),
  };
}
function zodFields(name) {
  const shape = zod[name].shape;
  const all = Object.keys(shape).sort();
  return { all, required: all.filter((key) => !shape[key].safeParse(undefined).success) };
}
const unwrap = (schema) => (typeof schema.unwrap === "function" ? unwrap(schema.unwrap()) : schema);

test("every $defs name has a zod export with the same name, and the other way round", () => {
  const missing = Object.keys(defs).filter((name) => !(name in zod));
  assert.deepEqual(missing, []);
  const covered = new Set([...Object.keys(CONTRACT), ...Object.keys(UNIONS), ...NOT_IN_TABLE]);
  assert.deepEqual(Object.keys(defs).filter((name) => !covered.has(name)), [], "a $def is neither in the contract table nor in NOT_IN_TABLE");
  assert.deepEqual([...covered].filter((name) => !(name in defs)), [], "contract names a type the JSON Schema lacks");
});

for (const [name, spec] of Object.entries(CONTRACT)) {
  test(`contract ${name}: JSON Schema and zod have exactly these fields`, () => {
    const expected = parse(spec);
    assert.deepEqual(jsonSchemaFields(name), expected, "JSON Schema");
    assert.deepEqual(zodFields(name), expected, "zod");
  });
}

for (const [name, [discriminator, values]] of Object.entries(UNIONS)) {
  test(`union ${name} on ${discriminator}: same members in JSON Schema and zod`, () => {
    assert.deepEqual(defs[name].properties[discriminator].enum, values);
    assert.deepEqual(zod[name].options.map((option) => option.shape[discriminator].value), values);
  });
}

test("enum values match the contract in JSON Schema and zod", () => {
  for (const [path, values] of Object.entries(ENUMS)) {
    const [type, field] = path.split(".");
    assert.deepEqual(defs[type].properties[field].enum, values, `JSON Schema ${path}`);
    assert.deepEqual(unwrap(zod[type].shape[field]).options, values, `zod ${path}`);
  }
  assert.deepEqual(defs.ColorToken.enum, COLOR_TOKENS);
  assert.deepEqual(zod.ColorToken.options, COLOR_TOKENS);
});

test("every schema file has a $id and draft 2020-12", () => {
  for (const schema of loadSchemas()) {
    assert.equal(schema.$schema, "https://json-schema.org/draft/2020-12/schema");
    assert.match(schema.$id, /^https:\/\/science-kids\.example\/schema\/content\/v1\/[a-z-]+\.schema\.json$/);
  }
});
