#!/usr/bin/env node
// Regenerates fixtures/invalid/*.json + test/invalid-fixtures.json from the valid sample.
// Each fixture = the valid lesson (or topic) with exactly ONE mutation. The expected
// pointer is written by hand next to each mutation, never computed by the validator.
// Run after the valid sample changes: node scripts/make-invalid-fixtures.mjs
import { mkdirSync, readdirSync, readFileSync, rmSync, writeFileSync } from "node:fs";

const root = new URL("../", import.meta.url);
const VALID_DIR = "fixtures/valid/discoverer/an-uong-lanh-manh/";
const TOPIC = `${VALID_DIR}topic.json`;
const LESSON = `${VALID_DIR}01-thuc-an-cho-ta-nhung-gi.json`;
const read = (file) => JSON.parse(readFileSync(new URL(file, root), "utf8"));
const fixedUuid = (n) => `00000000-0000-4000-8000-${String(n).padStart(12, "0")}`;

const indexOf = (list, predicate, what) => {
  const index = list.findIndex(predicate);
  if (index < 0) throw new Error(`valid sample has no ${what}; adjust this mutation`);
  return index;
};
const quizIndex = (lesson, format) => indexOf(lesson.quiz, (item) => item.format === format, `quiz item ${format}`);
const learnIndex = (lesson, type) => indexOf(lesson.learn, (block) => block.type === type, `learn block ${type}`);

// stage "schema": Ajv and zod both reject at `pointer`.
// stage "refs": both accept the shape; the cross check rejects at `pointer`.
const MUTATIONS = [
  {
    name: "quiz-5-items",
    description: "quiz có 5 câu (phải đúng 6)",
    stage: "schema",
    mutate: (lesson) => (lesson.quiz.pop(), "/quiz"),
  },
  {
    name: "spoken-missing-vi",
    description: "một Spoken thiếu vi",
    stage: "schema",
    mutate: (lesson) => {
      const b = learnIndex(lesson, "explore_groups");
      delete lesson.learn[b].groups[1].sentence.vi;
      return `/learn/${b}/groups/1/sentence/vi`;
    },
  },
  {
    name: "uuid-bad-format",
    description: "UUID sai dạng (thiếu đoạn cuối), ở misconception của topic",
    base: "topic",
    stage: "schema",
    mutate: (topic) => {
      topic.misconceptions[0].id = topic.misconceptions[0].id.slice(0, 23);
      return "/misconceptions/0/id";
    },
  },
  {
    name: "single-choice-two-correct",
    description: "single_choice có 2 đáp án đúng",
    stage: "schema",
    mutate: (lesson) => {
      const q = quizIndex(lesson, "single_choice");
      lesson.quiz[q].options.find((option) => !option.correct).correct = true;
      return `/quiz/${q}/options`;
    },
  },
  {
    name: "multi-choice-no-correct",
    description: "multi_choice không có đáp án đúng",
    stage: "schema",
    mutate: (lesson) => {
      const q = quizIndex(lesson, "multi_choice");
      for (const option of lesson.quiz[q].options) option.correct = false;
      return `/quiz/${q}/options`;
    },
  },
  {
    name: "block-unknown-type",
    description: "block có type lạ (hotspot_image chưa có trong v1)",
    stage: "schema",
    mutate: (lesson) => {
      const b = learnIndex(lesson, "word_list");
      lesson.learn[b].type = "hotspot_image";
      return `/learn/${b}/type`;
    },
  },
  {
    name: "image-missing-alt",
    description: "Image thiếu alt",
    stage: "schema",
    mutate: (lesson) => {
      const b = learnIndex(lesson, "explore_groups");
      delete lesson.learn[b].groups[0].image.alt;
      return `/learn/${b}/groups/0/image/alt`;
    },
  },
  {
    name: "misconception-id-not-in-topic",
    description: "misconception_id không có trong misconceptions của topic",
    stage: "refs",
    mutate: (lesson) => {
      const q = indexOf(lesson.quiz, (item) => item.misconception_id, "quiz item with misconception_id");
      lesson.quiz[q].misconception_id = fixedUuid(1);
      return `/quiz/${q}/misconception_id`;
    },
  },
  {
    name: "uuid-duplicate",
    description: "hai từ vựng trùng UUID",
    stage: "refs",
    mutate: (lesson) => {
      lesson.vocab[1].id = lesson.vocab[0].id;
      return "/vocab/1/id";
    },
  },
  {
    name: "vocab-9-terms",
    description: "vocab có 9 từ (tối đa 8)",
    stage: "schema",
    mutate: (lesson) => {
      lesson.vocab.push({ ...structuredClone(lesson.vocab.at(-1)), id: fixedUuid(2), key: "extra_term", tier: "extra" });
      return "/vocab";
    },
  },
  {
    name: "key-points-2",
    description: "key_points có 2 ý (phải đúng 3)",
    stage: "schema",
    mutate: (lesson) => (lesson.key_points.pop(), "/key_points"),
  },
  {
    name: "warmup-missing-recall-from",
    description: "câu warmup thiếu recall_from",
    stage: "schema",
    mutate: (lesson) => {
      const w = lesson.warmup.length - 1;
      delete lesson.warmup[w].recall_from;
      return `/warmup/${w}/recall_from`;
    },
  },
  {
    name: "quiz-has-recall-from",
    description: "câu quiz có recall_from (chỉ warmup được có)",
    stage: "schema",
    mutate: (lesson) => {
      lesson.quiz[0].recall_from = structuredClone(lesson.warmup[0].recall_from);
      return "/quiz/0/recall_from";
    },
  },
  {
    name: "quiz-item-unknown-field",
    description: "câu quiz có trường audio riêng (đã bỏ, audio gắn vào từng Spoken)",
    stage: "schema",
    mutate: (lesson) => {
      lesson.quiz[0].audio = { en: "0".repeat(64) };
      return "/quiz/0/audio";
    },
  },
  {
    name: "key-duplicate-in-lesson",
    description: "hai câu quiz trùng key trong bài",
    stage: "refs",
    mutate: (lesson) => {
      lesson.quiz[1].key = lesson.quiz[0].key;
      return "/quiz/1/key";
    },
  },
  {
    name: "word-list-unknown-term",
    description: "word_list trỏ tới key không có trong vocab",
    stage: "refs",
    mutate: (lesson) => {
      const b = learnIndex(lesson, "word_list");
      const i = lesson.learn[b].term_keys.push("photosynthesis") - 1;
      return `/learn/${b}/term_keys/${i}`;
    },
  },
  {
    name: "lesson-topic-id-unknown",
    description: "topic_id không trỏ tới topic nào được đưa vào",
    stage: "refs",
    mutate: (lesson) => {
      lesson.topic_id = fixedUuid(3);
      return "/topic_id";
    },
  },
  {
    name: "fill-blank-answers-mismatch",
    description: "fill_blank_bank có 1 ô trống nhưng 2 đáp án",
    stage: "refs",
    mutate: (lesson) => {
      const w = indexOf(lesson.warmup, (item) => item.format === "fill_blank_bank", "warmup fill_blank_bank");
      const item = lesson.warmup[w];
      item.answers.push(item.bank.find((word) => !item.answers.includes(word.key)).key);
      return `/warmup/${w}/answers`;
    },
  },
  {
    name: "tray-item-unknown-group",
    description: "món trong build_tray trỏ tới nhóm không có",
    stage: "refs",
    mutate: (lesson) => {
      lesson.play.items[0].group = "dairy";
      return "/play/items/0/group";
    },
  },
];

const OUT = new URL("fixtures/invalid/", root);
rmSync(OUT, { recursive: true, force: true });
mkdirSync(OUT, { recursive: true });
const table = MUTATIONS.map(({ name, description, base = "lesson", stage, mutate }) => {
  const doc = read(base === "topic" ? TOPIC : LESSON);
  const pointer = mutate(doc);
  const file = `fixtures/invalid/${name}.json`;
  writeFileSync(new URL(file, root), `${JSON.stringify(doc, null, 2)}\n`);
  // A lesson needs its topic to resolve topic_id / misconception_id; a topic stands alone.
  return { file, description, stage, pointer, context: base === "lesson" ? [TOPIC] : [] };
});
writeFileSync(new URL("test/invalid-fixtures.json", root), `${JSON.stringify(table, null, 2)}\n`);
console.log(`${table.length} file trong fixtures/invalid/ (${readdirSync(OUT).length} trên đĩa), bảng mong đợi ở test/invalid-fixtures.json`);
