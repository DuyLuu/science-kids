// Cross checks: uniqueness, references by key in a file, by UUID across files, linked counts.
import assert from "node:assert/strict";
import test from "node:test";
import { validateDocuments } from "../scripts/lib/core.mjs";
import { TOPIC_FILE, check, validLesson, validTopic } from "./helpers.mjs";

const refErrors = (report) => report.errors.map(({ file, pointer, stage }) => `${stage} ${file} ${pointer}`);
const only = (report, ...expected) => assert.deepEqual(report.errors.map((e) => e.pointer), expected, JSON.stringify(report.errors, null, 2));
const quiz = (lesson, format) => lesson.quiz.findIndex((item) => item.format === format);

test("a lesson checked without its topic -> /topic_id", () => {
  only(check([validLesson()], { alone: true }), "/topic_id");
});

test("a lesson whose topic fails the schema still resolves topic_id", () => {
  const topic = validTopic();
  topic.level = 9;
  const report = validateDocuments([{ file: TOPIC_FILE, data: topic }, { file: "l.json", data: validLesson() }]);
  assert.deepEqual(refErrors(report), [`schema ${TOPIC_FILE} /level`]);
});

test("topic.json slug must equal its folder name", () => {
  const report = validateDocuments([{ file: "content/discoverer/healthy-eating/topic.json", data: validTopic() }]);
  only(report, "/slug");
  assert.match(report.errors[0].message, /healthy-eating/);
  // Other file names (fixtures/invalid/*.json) are not tied to a folder.
  assert.equal(validateDocuments([{ file: "x/other.json", data: validTopic() }]).ok, true);
});

test("a topic cannot be its own prerequisite", () => {
  const topic = validTopic();
  topic.prerequisite_topic_ids = [topic.id];
  only(validateDocuments([{ file: "t.json", data: topic }]), "/prerequisite_topic_ids/0");
});

test("UUID duplicated across files names both places", () => {
  const lesson = validLesson();
  lesson.vocab[2].id = validTopic().misconceptions[0].id;
  const report = check([{ file: "lesson.json", data: lesson }]);
  only(report, "/vocab/2/id");
  assert.match(report.errors[0].message, new RegExp(`${TOPIC_FILE} /misconceptions/0/id`));
});

test("misconception keys are unique within the topic", () => {
  const topic = validTopic();
  topic.misconceptions.push({ ...structuredClone(topic.misconceptions[0]), id: "00000000-0000-4000-8000-000000000009" });
  only(validateDocuments([{ file: "t.json", data: topic }]), `/misconceptions/${topic.misconceptions.length - 1}/key`);
});

test("keys: one scope for the whole lesson, child keys included", () => {
  const lesson = validLesson();
  const q = quiz(lesson, "multi_choice");
  lesson.quiz[q].options[1].key = lesson.quiz[q].options[0].key;
  only(check([lesson]), `/quiz/${q}/options/1/key`);

  const clash = validLesson();
  clash.warmup[0].key = clash.vocab[0].key; // warmup vs vocab
  only(check([clash]), "/vocab/0/key");

  const nested = validLesson();
  nested.quiz[q].options[0].key = nested.play.items[0].key; // a child key of the quiz vs a child key of the tray
  only(check([nested]), `/quiz/${q}/options/0/key`);

  const reference = validLesson();
  reference.quiz[0].key = reference.play.items[0].group; // same name as a tray group, defined earlier at /play/groups/…/key
  only(check([reference]), "/quiz/0/key");
});

test("recall_from.lesson_id cannot point at the lesson itself", () => {
  const lesson = validLesson();
  lesson.warmup[0].recall_from = { kind: "lesson", lesson_id: lesson.id };
  only(check([lesson]), "/warmup/0/recall_from/lesson_id");
  lesson.warmup[0].recall_from.lesson_id = "00000000-0000-4000-8000-000000000008"; // other lessons: not resolved in v1
  assert.equal(check([lesson]).ok, true);
});

test("fill_blank_bank: blanks {1}..{n}, answers match, bank keys exist", () => {
  const w = validLesson().warmup.findIndex((item) => item.format === "fill_blank_bank");
  const twoKeys = (i) => [i.bank[0].key, i.bank[1].key];
  const cases = [
    [(i) => (i.sentence.en = "No blank here."), `/warmup/${w}/sentence/en`],
    [(i) => ((i.sentence.en = "A {1} and {3}."), (i.answers = twoKeys(i))), `/warmup/${w}/sentence/en`],
    [(i) => (i.sentence.vi = "Câu {2}"), `/warmup/${w}/sentence/vi`],
    [(i) => (i.answers = ["water"]), `/warmup/${w}/answers/0`],
  ];
  for (const [mutate, pointer] of cases) {
    const lesson = validLesson();
    mutate(lesson.warmup[w]);
    only(check([lesson]), pointer);
  }
  const two = validLesson();
  Object.assign(two.warmup[w], { sentence: { en: "{2} and {1}.", vi: "{1} và {2}." }, answers: twoKeys(two.warmup[w]) });
  assert.equal(check([two]).ok, true, "blanks may appear in any order");
});

test("order_sequence: answer must be a permutation of items", () => {
  // The sample lesson has no order_sequence: swap q2 for one.
  const withSequence = (answer) => {
    const lesson = validLesson();
    const { id, key, version, dok, prompt, hint, explanation_correct, explanation_wrong } = lesson.quiz[1];
    const label = (en) => ({ en, vi: en });
    lesson.quiz[1] = {
      id, key, format: "order_sequence", version, dok, prompt, hint, explanation_correct, explanation_wrong,
      items: [{ key: "q2_seed", label: label("seed") }, { key: "q2_sprout", label: label("sprout") }, { key: "q2_plant", label: label("plant") }],
      answer,
    };
    return lesson;
  };
  assert.equal(check([withSequence(["q2_sprout", "q2_seed", "q2_plant"])]).ok, true);
  only(check([withSequence(["q2_seed", "q2_sprout", "zzz"])]), "/quiz/1/answer/2");
  only(check([withSequence(["q2_seed", "q2_sprout"])]), "/quiz/1/answer");
});

test("build_tray: groups, items, missing messages and capacity agree", () => {
  const tray = validLesson().play;
  const required = tray.groups.find((g) => g.role === "required").key;
  const limit = tray.groups.find((g) => g.role === "limit").key;
  const cases = [
    [(b) => delete b.messages.missing[required], "/play/messages/missing"],
    [(b) => (b.messages.missing[limit] = { en: "x", vi: "x" }), `/play/messages/missing/${limit}`],
    [(b) => (b.capacity = 2), "/play/capacity"],
    [(b) => ((b.groups = b.groups.map((g) => ({ ...g, role: "neutral" }))), (b.messages.missing = { zz: { en: "x", vi: "x" } })), "/play/groups"],
  ];
  for (const [mutate, pointer] of cases) {
    const lesson = validLesson();
    mutate(lesson.play);
    const report = check([lesson]);
    assert.ok(report.errors.some((e) => e.pointer === pointer && e.stage === "refs"), `${pointer}: ${JSON.stringify(report.errors)}`);
  }
});
