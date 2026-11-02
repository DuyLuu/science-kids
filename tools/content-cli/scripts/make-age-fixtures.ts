#!/usr/bin/env node
// Regenerates test/fixtures/age-rules/ (SK-026): test data for the authoring rules per age group,
// not content for children.
//   valid/explorer/fixture-explorer/{topic.json, 01-fixture-explorer-lesson.json}
//   valid/scientist/fixture-scientist/{topic.json, 01-fixture-scientist-lesson.json}
//   invalid/<name>.json   one lesson = a valid lesson with exactly ONE age-rule error
//   expected.json         per invalid file: its topic (context) and the expected error, by hand
// The Discoverer mutations start from lesson 1 of packages/content-schema/fixtures/valid.
// Every file stays valid content schema v1 (test/age-rules.test.ts checks). Do not edit the
// output by hand; edit this script and run: node scripts/make-age-fixtures.ts
import { mkdirSync, readFileSync, rmSync, writeFileSync } from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const CLI_ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
const OUT = path.join(CLI_ROOT, "test", "fixtures", "age-rules");
const rel = (file: string) => path.relative(CLI_ROOT, file).split(path.sep).join("/");
const DISCOVERER_DIR = path.resolve(CLI_ROOT, "../../packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh");
const DISCOVERER = { topic: path.join(DISCOVERER_DIR, "topic.json"), lesson: path.join(DISCOVERER_DIR, "01-thuc-an-cho-ta-nhung-gi.json") };

type Json = Record<string, any>;
const uuid = (n: number) => `00000000-0000-4000-8000-${String(n).padStart(12, "0")}`;
const sp = (en: string, vi: string) => ({ en, vi });
const img = (en: string, vi: string) => ({ alt: { en, vi } });
const option = (key: string, en: string, vi: string, correct: boolean, image = true) => ({ key, label: sp(en, vi), ...(image ? { image: img(`A ${en}`, vi) } : {}), correct });
const card = (key: string, en: string, vi: string) => ({ key, label: sp(en, vi), image: img(`A ${en}`, vi) });
const base = (id: number, key: string, format: string, dok: number, prompt: [string, string], extra: Json = {}) => ({
  id: uuid(id),
  key,
  format,
  version: 1,
  dok,
  prompt: sp(...prompt),
  ...(extra.image ? { image: extra.image } : {}),
  hint: sp("Look at the pictures.", "Em nhìn hình nhé."),
  explanation_correct: sp("Yes, well done.", "Đúng rồi."),
  explanation_wrong: sp("Let us look again.", "Mình xem lại nhé."),
  ...Object.fromEntries(Object.entries(extra).filter(([name]) => name !== "image")),
});
const recall = { recall_from: { kind: "prior_knowledge", note: { en: "Test data", vi: "Dữ liệu test" } } };

function topic(n: number, slug: string, ageGroup: string, misconceptions: [string, string][]): Json {
  return {
    kind: "topic",
    schema_version: 1,
    id: uuid(n),
    slug,
    age_group: ageGroup,
    order: 1,
    title: sp("Test topic", "Chủ đề thử"),
    strand: "plants_animals",
    level: 1,
    difficulty: { abstraction: 1, prior_knowledge: 1, misconception: 1, vocabulary: 1, science_skill: 1 },
    prerequisite_topic_ids: [],
    is_free: true,
    misconceptions: misconceptions.map(([key, en], i) => ({ id: uuid(n + 1 + i), key, statement: { en, vi: en }, correction: { en: "Test data", vi: "Dữ liệu test" } })),
  };
}

/** Everything a lesson needs besides warmup and quiz, kept small and short (≤ 8 words a sentence). */
function lesson(n: number, topicId: string, slug: string, warmup: Json[], quiz: Json[]): Json {
  return {
    kind: "lesson",
    schema_version: 1,
    id: uuid(n),
    topic_id: topicId,
    slug,
    order: 1,
    stage: "opener",
    title: sp("Test lesson", "Bài thử"),
    objective: sp("I can name animals.", "Em gọi tên được con vật."),
    key_points: [sp("Animals move.", "Con vật di chuyển."), sp("Animals eat.", "Con vật ăn."), sp("Animals grow.", "Con vật lớn lên.")],
    est_minutes: 5,
    warmup,
    learn: [{ id: uuid(n + 1), key: "card", type: "sentence_card", version: 1, text: sp("A hen has feathers.", "Gà mái có lông vũ.") }],
    play: {
      id: uuid(n + 2),
      key: "tray",
      type: "build_tray",
      version: 1,
      prompt: sp("Pick an animal.", "Chọn một con vật."),
      capacity: 1,
      groups: [{ key: "tray_animal", label: sp("Animal", "Con vật"), color: "do_son", role: "required" }],
      items: [{ key: "tray_hen", label: sp("hen", "gà mái"), group: "tray_animal", image: img("A hen", "Gà mái") }],
      messages: {
        start: sp("Pick one.", "Chọn một nhé."),
        full: sp("The tray is full.", "Khay đầy rồi."),
        balanced: sp("Well done.", "Giỏi lắm."),
        has_limited: sp("Try again.", "Thử lại nhé."),
        missing: { tray_animal: sp("Add an animal.", "Thêm một con vật.") },
      },
      success_when: "all_required_and_no_limit",
    },
    quiz,
    vocab: ["bird", "fish", "cow", "hen"].map((word, i) => ({
      id: uuid(n + 3 + i),
      key: word,
      term: sp(word, word),
      example: sp(`I can see a ${word}.`, `Em thấy con ${word}.`),
    })),
    reward: {},
  };
}

// Explorer: DOK 3·3·0, q1 DOK 1, 1 misconception (q6), 3 formats, a picture on every option, card
// and true_false item, single_choice 2–3 options, order_sequence 3 cards.
const explorerTopic = topic(100, "fixture-explorer", "explorer", [["bats_are_birds", "Bats are birds."]]);
const explorerLesson = lesson(110, explorerTopic.id, "fixture-explorer-lesson", [
  base(120, "w1", "single_choice", 1, ["Which one can fly?", "Con nào biết bay?"], { ...recall, options: [option("w1_bird", "bird", "con chim", true), option("w1_cat", "cat", "con mèo", false)] }),
  base(121, "w2", "true_false", 1, ["A fish can swim.", "Cá biết bơi."], { image: img("A fish", "Con cá"), ...recall, answer: true }),
], [
  base(130, "q1", "single_choice", 1, ["Which animal can fly?", "Con nào biết bay?"], { options: [option("q1_bird", "bird", "con chim", true), option("q1_cow", "cow", "con bò", false), option("q1_fish", "fish", "con cá", false)] }),
  base(131, "q2", "true_false", 1, ["A cow can fly.", "Con bò biết bay."], { image: img("A cow", "Con bò"), answer: false }),
  base(132, "q3", "single_choice", 1, ["Which one lives in water?", "Con nào sống dưới nước?"], { options: [option("q3_fish", "fish", "con cá", true), option("q3_cat", "cat", "con mèo", false)] }),
  base(133, "q4", "order_sequence", 2, ["Put them in order.", "Xếp theo thứ tự."], { items: [card("q4_egg", "egg", "quả trứng"), card("q4_chick", "chick", "gà con"), card("q4_hen", "hen", "gà mái")], answer: ["q4_egg", "q4_chick", "q4_hen"] }),
  base(134, "q5", "single_choice", 2, ["What does a cow eat?", "Con bò ăn gì?"], { options: [option("q5_grass", "grass", "cỏ", true), option("q5_fish", "fish", "cá", false), option("q5_meat", "meat", "thịt", false)] }),
  base(135, "q6", "true_false", 2, ["A bat is a bird.", "Con dơi là chim."], { image: img("A bat", "Con dơi"), misconception_id: explorerTopic.misconceptions[0].id, answer: false }),
]);

// Scientist: DOK 1·3·2, 2 misconceptions (the upper bound: valid), 4 formats, single_choice 4 options.
const scientistTopic = topic(200, "fixture-scientist", "scientist", [["heavy_falls_faster", "Heavy things fall faster."], ["food_from_soil", "Plants get food from soil."]]);
const four = (key: string) => [option(`${key}_a`, "leaf", "lá", true, false), option(`${key}_b`, "root", "rễ", false, false), option(`${key}_c`, "stem", "thân", false, false), option(`${key}_d`, "flower", "hoa", false, false)];
const scientistLesson = lesson(210, scientistTopic.id, "fixture-scientist-lesson", [
  base(220, "w1", "single_choice", 1, ["Which part of a plant makes food?", "Bộ phận nào của cây làm ra thức ăn?"], { ...recall, options: four("w1") }),
  base(221, "w2", "true_false", 1, ["Plants need light to grow.", "Cây cần ánh sáng để lớn."], { ...recall, answer: true }),
], [
  base(230, "q1", "single_choice", 1, ["Which part of a plant makes food?", "Bộ phận nào của cây làm ra thức ăn?"], { options: four("q1") }),
  base(231, "q2", "multi_choice", 2, ["Which things does a plant need?", "Cây cần những gì?"], { options: [option("q2_light", "light", "ánh sáng", true, false), option("q2_water", "water", "nước", true, false), option("q2_sweets", "sweets", "kẹo", false, false), option("q2_music", "music", "âm nhạc", false, false)] }),
  base(232, "q3", "true_false", 2, ["A heavy ball falls faster than a light one.", "Quả bóng nặng rơi nhanh hơn quả bóng nhẹ."], { misconception_id: scientistTopic.misconceptions[0].id, answer: false }),
  base(233, "q4", "fill_blank_bank", 2, ["Fill in the gap.", "Điền vào chỗ trống."], { sentence: sp("Plants need light and {1} to grow.", "Cây cần ánh sáng và {1} để lớn."), bank: [{ key: "q4_water", label: sp("water", "nước") }, { key: "q4_sand", label: sp("sand", "cát") }, { key: "q4_salt", label: sp("salt", "muối") }], answers: ["q4_water"] }),
  base(234, "q5", "single_choice", 3, ["Where does a plant get its food from?", "Cây lấy thức ăn từ đâu?"], { misconception_id: scientistTopic.misconceptions[1].id, options: four("q5") }),
  base(235, "q6", "true_false", 3, ["A plant in a dark box will stay green for months.", "Cây trong hộp tối sẽ xanh tốt nhiều tháng."], { answer: false }),
]);

type Expected = { pointer: string; code: string };
type Mutation = { name: string; description: string; group: "explorer" | "discoverer" | "scientist"; mutate: (lesson: Json) => Expected };
const err = (pointer: string, code: string): Expected => ({ pointer, code });

const MUTATIONS: Mutation[] = [
  // SK-026 "Tiêu chí nghiệm thu › GĐ 0 › Fixture một lỗi", in that order, then extra cases.
  { name: "explorer-option-no-image", description: "Explorer single_choice bỏ image của lựa chọn 2", group: "explorer", mutate: (l) => (delete l.quiz[0].options[1].image, err("/quiz/0/options/1", "age_image_required")) },
  { name: "explorer-single-choice-4-options", description: "Explorer single_choice có 4 lựa chọn", group: "explorer", mutate: (l) => (l.quiz[0].options.push(option("q1_duck", "duck", "con vịt", false)), err("/quiz/0/options", "age_option_count")) },
  {
    name: "explorer-fill-blank-bank",
    description: "Explorer có một câu fill_blank_bank (thay q3, cùng DOK 1)",
    group: "explorer",
    mutate: (l) => {
      l.quiz[2] = base(132, "q3", "fill_blank_bank", 1, ["Fill in the gap.", "Điền vào chỗ trống."], { sentence: sp("A fish lives in {1}.", "Cá sống ở {1}."), bank: [{ key: "q3_water", label: sp("water", "nước") }, { key: "q3_sand", label: sp("sand", "cát") }], answers: ["q3_water"] });
      return err("/quiz/2/format", "age_format_not_allowed");
    },
  },
  { name: "explorer-true-false-no-image", description: "Explorer true_false bỏ image", group: "explorer", mutate: (l) => (delete l.quiz[1].image, err("/quiz/1", "age_image_required")) },
  { name: "discoverer-single-choice-2-options", description: "Discoverer single_choice còn 2 lựa chọn", group: "discoverer", mutate: (l) => (l.quiz[0].options.splice(l.quiz[0].options.findIndex((o: Json) => !o.correct), 1), err("/quiz/0/options", "age_option_count")) },
  { name: "scientist-single-choice-3-options", description: "Scientist single_choice còn 3 lựa chọn", group: "scientist", mutate: (l) => (l.quiz[0].options.pop(), err("/quiz/0/options", "age_option_count")) },
  { name: "discoverer-first-item-dok", description: "Discoverer đổi chỗ q1 (DOK 1) với q3 (DOK 2)", group: "discoverer", mutate: (l) => ([l.quiz[0], l.quiz[2]] = [l.quiz[2], l.quiz[0]], err("/quiz/0/dok", "age_first_item_dok")) },
  { name: "discoverer-no-misconception", description: "Discoverer không câu nào có misconception_id", group: "discoverer", mutate: (l) => (delete l.quiz[5].misconception_id, err("/quiz", "age_misconception_count")) },
  { name: "scientist-3-misconceptions", description: "Scientist có 3 câu misconception (thêm ở q1)", group: "scientist", mutate: (l) => ((l.quiz[0].misconception_id = scientistTopic.misconceptions[0].id), err("/quiz", "age_misconception_count")) },
  {
    name: "discoverer-2-formats",
    description: "Discoverer chỉ dùng 2 format (q2 fill_blank_bank và q5 multi_choice đổi thành single_choice, giữ DOK)",
    group: "discoverer",
    mutate: (l) => {
      const toSingle = (i: number, prefix: string) => {
        const { id, key, version, dok, prompt, hint, explanation_correct, explanation_wrong } = l.quiz[i];
        l.quiz[i] = { id, key, format: "single_choice", version, dok, prompt, hint, explanation_correct, explanation_wrong, options: [option(`${prefix}_a`, "rice", "cơm", true, false), option(`${prefix}_b`, "fish", "cá", false, false), option(`${prefix}_c`, "oil", "dầu", false, false)] };
      };
      toSingle(1, "q2_sc");
      toSingle(4, "q5_sc");
      return err("/quiz", "age_format_variety");
    },
  },
  // Extra: warmup scope (option count and pictures apply to Khởi động too), order_sequence, DOK mix.
  { name: "explorer-warmup-multi-choice", description: "Explorer Khởi động dùng multi_choice", group: "explorer", mutate: (l) => ((l.warmup[0].format = "multi_choice"), err("/warmup/0/format", "age_format_not_allowed")) },
  { name: "explorer-warmup-option-no-image", description: "Explorer Khởi động: lựa chọn 1 thiếu image", group: "explorer", mutate: (l) => (delete l.warmup[0].options[0].image, err("/warmup/0/options/0", "age_image_required")) },
  { name: "explorer-sequence-item-no-image", description: "Explorer order_sequence: thẻ 2 thiếu image", group: "explorer", mutate: (l) => (delete l.quiz[3].items[1].image, err("/quiz/3/items/1", "age_image_required")) },
  {
    name: "explorer-order-sequence-4-items",
    description: "Explorer order_sequence có 4 thẻ",
    group: "explorer",
    mutate: (l) => (l.quiz[3].items.push(card("q4_rooster", "rooster", "gà trống")), l.quiz[3].answer.push("q4_rooster"), err("/quiz/3/items", "age_option_count")),
  },
  { name: "explorer-dok-mix", description: "Explorer q6 thành DOK 3 (phân bổ 3·2·1)", group: "explorer", mutate: (l) => ((l.quiz[5].dok = 3), err("/quiz", "age_dok_mix")) },
  { name: "explorer-2-misconceptions", description: "Explorer có 2 câu misconception", group: "explorer", mutate: (l) => ((l.quiz[4].misconception_id = explorerTopic.misconceptions[0].id), err("/quiz", "age_misconception_count")) },
];

const write = (file: string, data: unknown) => {
  mkdirSync(path.dirname(file), { recursive: true });
  writeFileSync(file, `${JSON.stringify(data, null, 2)}\n`);
};
const read = (file: string): Json => JSON.parse(readFileSync(file, "utf8"));

rmSync(OUT, { recursive: true, force: true });
const VALID = {
  explorer: { topic: path.join(OUT, "valid/explorer/fixture-explorer/topic.json"), lesson: path.join(OUT, "valid/explorer/fixture-explorer/01-fixture-explorer-lesson.json") },
  scientist: { topic: path.join(OUT, "valid/scientist/fixture-scientist/topic.json"), lesson: path.join(OUT, "valid/scientist/fixture-scientist/01-fixture-scientist-lesson.json") },
  discoverer: DISCOVERER,
};
write(VALID.explorer.topic, explorerTopic);
write(VALID.explorer.lesson, explorerLesson);
write(VALID.scientist.topic, scientistTopic);
write(VALID.scientist.lesson, scientistLesson);

const table = MUTATIONS.map(({ name, description, group, mutate }) => {
  const doc = read(VALID[group].lesson);
  const expected = mutate(doc);
  const file = path.join(OUT, "invalid", `${name}.json`);
  write(file, doc);
  return { file: rel(file), description, group, context: [rel(VALID[group].topic)], errors: [expected] };
});
write(path.join(OUT, "expected.json"), {
  valid: (["explorer", "discoverer", "scientist"] as const).map((group) => ({ group, files: [rel(VALID[group].topic), rel(VALID[group].lesson)] })),
  invalid: table,
});
console.log(`${table.length} file trong ${rel(path.join(OUT, "invalid"))}/, 2 bài hợp lệ (explorer, scientist), bảng mong đợi ở ${rel(path.join(OUT, "expected.json"))}`);
