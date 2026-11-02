// Every quiz format and block type of v1, independent of which ones the sample lesson
// happens to use: one minimal valid case each, plus the typical shape mistakes.
import assert from "node:assert/strict";
import test from "node:test";
import { check, validLesson, validTopic } from "./helpers.mjs";

const s = (en, vi = en) => ({ en, vi });
const uuid = (n) => `00000000-0000-4000-8000-${String(n).padStart(12, "0")}`;
const base = (format) => ({
  id: uuid(100), key: "q1", format, version: 1, dok: 1,
  prompt: s("Prompt"), hint: s("Hint"), explanation_correct: s("Yes"), explanation_wrong: s("No"),
});
const option = (key, correct) => ({ key, label: s(key), correct });

const FORMATS = {
  single_choice: { options: [option("a", true), option("b", false), option("c", false)] },
  multi_choice: { options: [option("a", true), option("b", true), option("c", false)] },
  true_false: { answer: true, statement: s("Fat is food."), speaker: "na", labels: { true: s("Na is right"), false: s("Na is not right") } },
  fill_blank_bank: { sentence: s("We need {1} and {2}.", "Ta cần {1} và {2}."), bank: [{ key: "air", label: s("air") }, { key: "water", label: s("water") }], answers: ["air", "water"] },
  order_sequence: { items: [{ key: "a", label: s("a") }, { key: "b", label: s("b") }, { key: "c", label: s("c") }], answer: ["c", "a", "b"] },
  picture_bar_chart: { chart: { unit: s("children"), bars: [{ key: "bar_x", label: s("x"), value: 0 }, { key: "bar_y", label: s("y"), value: 4.5 }] }, options: [option("x", false), option("y", true)] },
};

const withQuiz0 = (item) => {
  const lesson = validLesson();
  lesson.quiz[0] = item;
  return lesson;
};
function expectRejected(doc, pointer, { topic = false } = {}) {
  const report = topic ? check([{ file: "t.json", data: doc }], { alone: true }) : check([doc]);
  const result = report.results.at(-1);
  assert.ok(result.ajv.some((e) => e.pointer === pointer), `Ajv should flag ${pointer}: ${JSON.stringify(result.ajv)}`);
  assert.ok(result.zod.some((e) => e.pointer === pointer), `zod should flag ${pointer}: ${JSON.stringify(result.zod)}`);
}

for (const [format, fields] of Object.entries(FORMATS)) {
  test(`quiz format ${format}: minimal item is valid in quiz and (with recall_from) in warmup`, () => {
    assert.deepEqual(check([withQuiz0({ ...base(format), ...fields })]).errors, []);
    const lesson = validLesson();
    lesson.warmup[0] = { ...base(format), key: "w1", id: uuid(101), ...fields, recall_from: { kind: "lesson", lesson_id: uuid(102) } };
    assert.deepEqual(check([lesson]).errors, []);
  });
}

test("quiz shape mistakes are rejected by both engines", () => {
  const cases = [
    [{ ...base("single_choice"), options: Array.from({ length: 7 }, (_, i) => option(`o${i}`, i === 0)) }, "/quiz/0/options"],
    [{ ...base("single_choice"), options: [option("a", false), option("b", false)] }, "/quiz/0/options"],
    [{ ...base("multi_choice"), options: [option("a", true), option("b", true)] }, "/quiz/0/options"],
    [{ ...base("true_false") }, "/quiz/0/answer"],
    [{ ...base("true_false"), answer: "false" }, "/quiz/0/answer"],
    [{ ...base("true_false"), answer: false, labels: { true: s("yes") } }, "/quiz/0/labels/false"],
    [{ ...base("fill_blank_bank"), ...FORMATS.fill_blank_bank, bank: [{ key: "air", label: s("air") }] }, "/quiz/0/bank"],
    [{ ...base("order_sequence"), ...FORMATS.order_sequence, items: FORMATS.order_sequence.items.slice(0, 2) }, "/quiz/0/items"],
    [{ ...base("order_sequence"), ...FORMATS.order_sequence, answer: ["a", "a", "b"] }, "/quiz/0/answer"],
    [{ ...base("picture_bar_chart"), ...FORMATS.picture_bar_chart, chart: { bars: [{ key: "x", label: s("x"), value: 1 }] } }, "/quiz/0/chart/bars"],
    [{ ...base("picture_bar_chart"), ...FORMATS.picture_bar_chart, chart: { bars: [{ key: "x", label: s("x"), value: -1 }, { key: "y", label: s("y"), value: 1 }] } }, "/quiz/0/chart/bars/0/value"],
    [{ ...base("fill_blank_free"), answers: ["x"] }, "/quiz/0/format"],
    [{ ...base("single_choice"), ...FORMATS.single_choice, dok: 4 }, "/quiz/0/dok"],
    [{ ...base("single_choice"), ...FORMATS.single_choice, p_correct: 1.2 }, "/quiz/0/p_correct"],
    [{ ...base("single_choice"), ...FORMATS.single_choice, answer: true }, "/quiz/0/answer"],
    [{ ...base("single_choice"), ...FORMATS.single_choice, id: uuid(100).toUpperCase().replace("0000-4000", "0000-4ABC") }, "/quiz/0/id"],
    [{ ...base("single_choice"), ...FORMATS.single_choice, key: "Q1" }, "/quiz/0/key"],
    [{ ...base("single_choice"), ...FORMATS.single_choice, prompt: s(" ") }, "/quiz/0/prompt/en"],
  ];
  for (const [item, pointer] of cases) expectRejected(withQuiz0(item), pointer);
});

test("block types: sentence_card in learn is valid; wrong section or shape is rejected", () => {
  const card = { id: uuid(200), key: "card", type: "sentence_card", version: 1, min_app_version: "1.2.0", text: s("Food gives us energy.") };
  const lesson = validLesson();
  lesson.learn.push(card);
  assert.deepEqual(check([lesson]).errors, []);

  const cases = [
    [(l) => l.learn.push({ ...structuredClone(l.play), id: uuid(201), key: "tray2" }), "/learn/2/type"],
    [(l) => (l.play = { ...structuredClone(l.learn[0]) }), "/play/type"],
    [(l) => (l.learn[0].groups = l.learn[0].groups.slice(0, 1)), "/learn/0/groups"],
    [(l) => (l.learn[0].groups[0].color = "#8A5E3B"), "/learn/0/groups/0/color"],
    [(l) => (l.learn[0].complete_when = "any"), "/learn/0/complete_when"],
    [(l) => (l.learn[0].version = 0), "/learn/0/version"],
    [(l) => (l.learn.push({ ...card, min_app_version: "1.2" })), "/learn/2/min_app_version"],
    [(l) => (l.learn[0].data = {}), "/learn/0/data"],
    [(l) => (l.play.groups[0].role = "must"), "/play/groups/0/role"],
    [(l) => (l.play.messages.missing.Carb = s("x")), "/play/messages/missing/Carb"],
    [(l) => (l.play.messages.missing = {}), "/play/messages/missing"],
    [(l) => (l.learn = []), "/learn"],
    [(l) => (l.warmup = [...l.warmup, ...l.warmup.slice(0, 2)]), "/warmup"],
    [(l) => (l.stage = "intro"), "/stage"],
    [(l) => (l.schema_version = 2), "/schema_version"],
    [(l) => (l.reward.badge = {}), "/reward/badge"],
    [(l) => delete l.reward.collectible.image, "/reward/collectible/image"],
    [(l) => (l.vocab[0].tier = "bonus"), "/vocab/0/tier"],
  ];
  for (const [mutate, pointer] of cases) {
    const copy = validLesson();
    mutate(copy);
    expectRejected(copy, pointer);
  }
});

test("topic fields: level, difficulty, strand, flags", () => {
  const cases = [
    [(t) => (t.level = 6), "/level"],
    [(t) => (t.difficulty.abstraction = 4), "/difficulty/abstraction"],
    [(t) => delete t.difficulty.science_skill, "/difficulty/science_skill"],
    [(t) => (t.strand = "biology"), "/strand"],
    [(t) => (t.age_group = "toddler"), "/age_group"],
    [(t) => (t.is_free = "yes"), "/is_free"],
    [(t) => (t.slug = "An Uong"), "/slug"],
    [(t) => (t.prerequisite_topic_ids = [uuid(1), uuid(1)]), "/prerequisite_topic_ids"],
    [(t) => (t.misconceptions[0].statement.audio = {}), "/misconceptions/0/statement/audio"],
  ];
  for (const [mutate, pointer] of cases) {
    const topic = validTopic();
    mutate(topic);
    expectRejected(topic, pointer, { topic: true });
  }
  const minimal = validTopic();
  for (const key of ["question", "sensitive", "archived", "ai_draft"]) delete minimal[key];
  assert.equal(check([{ file: "t.json", data: minimal }], { alone: true }).ok, true, "optional topic fields may be left out");
});
