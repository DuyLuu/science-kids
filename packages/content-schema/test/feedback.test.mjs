// SK-044: optional `feedback` (Spoken) on a wrong choice: ChoiceOption, BankWord, and
// true_false feedback_true / feedback_false for the side the child can get wrong.
// Old content without it stays valid (every other test file uses none).
import assert from "node:assert/strict";
import test from "node:test";
import { check, validLesson } from "./helpers.mjs";

const s = (en, vi = en) => ({ en, vi });
const uuid = (n) => `00000000-0000-4000-8000-${String(n).padStart(12, "0")}`;
const base = (format) => ({
  id: uuid(100), key: "q1", format, version: 1, dok: 1,
  prompt: s("Prompt"), hint: s("Hint"), explanation_correct: s("Yes"), explanation_wrong: s("No"),
});
const option = (key, correct, feedback) => ({ key, label: s(key), correct, ...(feedback ? { feedback } : {}) });
const withQuiz0 = (item) => {
  const lesson = validLesson();
  lesson.quiz[0] = item;
  return lesson;
};
const errorsOf = (item, options) => check([withQuiz0(item)], options).errors;
const FB = s("A bat has fur, not feathers.", "Con dơi có lông, không có lông vũ.");

const single = (options) => ({ ...base("single_choice"), options });
const multi = (options) => ({ ...base("multi_choice"), options });
const bank = (words, answers = ["air"]) => ({ ...base("fill_blank_bank"), sentence: s("We need {1}.", "Ta cần {1}."), bank: words, answers });
const trueFalse = (answer, extra) => ({ ...base("true_false"), answer, ...extra });

test("feedback on wrong choices is valid in every format that has it", () => {
  assert.deepEqual(errorsOf(single([option("a", true), option("b", false, FB), option("c", false)])), []);
  assert.deepEqual(errorsOf(multi([option("a", true), option("b", true), option("c", false, FB)])), []);
  assert.deepEqual(errorsOf(bank([{ key: "air", label: s("air") }, { key: "sand", label: s("sand"), feedback: FB }])), []);
  assert.deepEqual(errorsOf(trueFalse(true, { feedback_false: FB })), []);
  assert.deepEqual(errorsOf(trueFalse(false, { feedback_true: FB })), []);
  const chart = {
    ...base("picture_bar_chart"),
    chart: { bars: [{ key: "bar_x", label: s("x"), value: 1 }, { key: "bar_y", label: s("y"), value: 2 }] },
    options: [option("x", false, FB), option("y", true)],
  };
  assert.deepEqual(errorsOf(chart), [], "picture_bar_chart shares ChoiceOption");
});

test("feedback is a Spoken: en and vi required, --require-assets asks for its audio", () => {
  const half = single([option("a", true), option("b", false, { en: "Fur." })]);
  const pointers = check([withQuiz0(half)]).errors.map((e) => e.pointer);
  assert.ok(pointers.includes("/quiz/0/options/1/feedback/vi"), JSON.stringify(pointers));

  const strict = errorsOf(single([option("a", true), option("b", false, FB)]), { requireAssets: true }).map((e) => e.pointer);
  assert.ok(strict.includes("/quiz/0/options/1/feedback/audio"), "--require-assets needs feedback audio");
  const voiced = { ...FB, audio: { en: "a".repeat(64), vi: "b".repeat(64) } };
  const ok = errorsOf(single([option("a", true), option("b", false, voiced)]), { requireAssets: true }).map((e) => e.pointer);
  assert.ok(!ok.some((pointer) => pointer.startsWith("/quiz/0/options/1/feedback")), JSON.stringify(ok));
});

test("feedback on a right choice is a refs error, at the feedback pointer", () => {
  const cases = [
    [single([option("a", true, FB), option("b", false)]), "/quiz/0/options/0/feedback"],
    [multi([option("a", true), option("b", true, FB), option("c", false)]), "/quiz/0/options/1/feedback"],
    [bank([{ key: "air", label: s("air"), feedback: FB }, { key: "sand", label: s("sand") }]), "/quiz/0/bank/0/feedback"],
    [trueFalse(true, { feedback_true: FB }), "/quiz/0/feedback_true"],
    [trueFalse(false, { feedback_false: FB }), "/quiz/0/feedback_false"],
  ];
  for (const [item, pointer] of cases) {
    const errors = errorsOf(item);
    assert.deepEqual(errors.map((e) => [e.stage, e.pointer]), [["refs", pointer]], `${item.format}: ${JSON.stringify(errors)}`);
  }
});

test("feedback is not a field of order_sequence items, the question, or a true_false item", () => {
  const order = {
    ...base("order_sequence"),
    items: [{ key: "a", label: s("a"), feedback: FB }, { key: "b", label: s("b") }, { key: "c", label: s("c") }],
    answer: ["a", "b", "c"],
  };
  assert.ok(errorsOf(order).some((e) => e.stage === "schema" && e.pointer === "/quiz/0/items/0/feedback"));
  assert.ok(errorsOf({ ...single([option("a", true), option("b", false)]), feedback: FB }).some((e) => e.pointer === "/quiz/0/feedback"));
  assert.ok(errorsOf(trueFalse(true, { feedback: FB })).some((e) => e.pointer === "/quiz/0/feedback"), "true_false uses feedback_true / feedback_false");
});

test("feedback in warmup follows the same rule", () => {
  const lesson = validLesson();
  const w = lesson.warmup.findIndex((item) => item.format === "fill_blank_bank");
  const item = lesson.warmup[w];
  const wrong = item.bank.findIndex((word) => !item.answers.includes(word.key));
  const right = item.bank.findIndex((word) => item.answers.includes(word.key));
  item.bank[wrong].feedback = FB;
  assert.deepEqual(check([lesson]).errors, []);
  item.bank[right].feedback = FB;
  assert.deepEqual(check([lesson]).errors.map((e) => e.pointer), [`/warmup/${w}/bank/${right}/feedback`]);
});
