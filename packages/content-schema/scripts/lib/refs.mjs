// Cross checks that JSON Schema cannot express: uniqueness, references by key inside a
// file, references by UUID across files, and counts that tie two fields together.
// Runs only on files that passed both Ajv and zod, so the shapes below can be trusted.
import path from "node:path";
import { join } from "./pointer.mjs";

/**
 * @param {{file: string, kind: string, data: any, schemaOk: boolean}[]} docs
 * @returns {{file: string, pointer: string, message: string}[]}
 */
export function checkRefs(docs) {
  const errors = [];
  const report = (file, pointer, message) => errors.push({ file, pointer, message });

  // Topics are reference targets even when they failed the schema, so one broken topic
  // does not also flag every lesson of that topic.
  const topics = new Map();
  for (const doc of docs) {
    if (doc.kind === "topic" && typeof doc.data?.id === "string" && !topics.has(doc.data.id)) topics.set(doc.data.id, doc);
  }

  const checked = docs.filter((doc) => doc.schemaOk);
  checkUniqueIds(checked, report);
  for (const doc of checked) {
    checkKeyLists(doc, report);
    if (doc.kind === "topic") checkTopic(doc, report);
    if (doc.kind === "lesson") checkLesson(doc, topics, report);
  }
  return errors;
}

// Every `id` (all of them are UUIDs of entities) is unique across all files checked.
function checkUniqueIds(docs, report) {
  const seen = new Map();
  for (const doc of docs) {
    walk(doc.data, "", (value, pointer) => {
      if (!isObject(value) || typeof value.id !== "string") return;
      const at = join(pointer, "id");
      const first = seen.get(value.id);
      if (first) {
        const where = first.file === doc.file ? first.pointer : `${first.file} ${first.pointer}`;
        report(doc.file, at, `UUID ${value.id} trùng với ${where}`);
      } else {
        seen.set(value.id, { file: doc.file, pointer: at });
      }
    });
  }
}

// Every `key` that names something (an object's `key` field) is unique in its file: in a
// lesson that includes child keys (options, groups, items, bank, bars), as in the contract
// ("duy nhất trong bài") and the SK-002 template (q5_egg, tray_egg); in a topic, misconceptions.
// References by key (term_keys, answers, group, messages.missing) are checked elsewhere.
function checkKeyLists(doc, report) {
  const scope = doc.kind === "lesson" ? "trong bài" : "trong chủ đề";
  const seen = new Map();
  walk(doc.data, "", (value, pointer) => {
    if (!isObject(value) || typeof value.key !== "string") return;
    const at = join(pointer, "key");
    const first = seen.get(value.key);
    if (first !== undefined) report(doc.file, at, `key "${value.key}" trùng ${scope} (đã có ở ${first})`);
    else seen.set(value.key, at);
  });
}

function checkTopic({ file, data }, report) {
  if (path.basename(file) === "topic.json") {
    const folder = path.basename(path.dirname(path.resolve(file)));
    if (data.slug !== folder) report(file, "/slug", `slug "${data.slug}" phải trùng tên thư mục "${folder}"`);
  }
  data.prerequisite_topic_ids.forEach((id, index) => {
    if (id === data.id) report(file, `/prerequisite_topic_ids/${index}`, "chủ đề không thể là điều kiện của chính nó");
  });
}

function checkLesson({ file, data }, topics, report) {
  const topic = topics.get(data.topic_id)?.data;
  if (!topic) {
    report(file, "/topic_id", `không có topic nào có id ${data.topic_id} trong các file đang kiểm (đưa kèm topic.json của chủ đề)`);
  }
  const misconceptionIds = new Set((Array.isArray(topic?.misconceptions) ? topic.misconceptions : []).map((m) => m?.id));
  const vocabKeys = new Set(data.vocab.map((term) => term.key));

  const items = [
    ...data.warmup.map((item, index) => [item, `/warmup/${index}`]),
    ...data.quiz.map((item, index) => [item, `/quiz/${index}`]),
  ];
  for (const [item, pointer] of items) {
    if (item.misconception_id !== undefined && topic && !misconceptionIds.has(item.misconception_id)) {
      report(file, `${pointer}/misconception_id`, `misconception_id ${item.misconception_id} không có trong misconceptions của topic "${topic.slug}"`);
    }
    if (item.recall_from?.kind === "lesson" && item.recall_from.lesson_id === data.id) {
      report(file, `${pointer}/recall_from/lesson_id`, "câu khởi động không thể nhớ lại từ chính bài này");
    }
    if (item.format === "fill_blank_bank") checkFillBlank(item, pointer, file, report);
    if (item.format === "order_sequence") checkOrderSequence(item, pointer, file, report);
  }

  data.learn.forEach((block, index) => {
    if (block.type !== "word_list") return;
    block.term_keys.forEach((key, i) => {
      if (!vocabKeys.has(key)) report(file, `/learn/${index}/term_keys/${i}`, `không có từ nào trong vocab có key "${key}"`);
    });
  });

  if (data.play.type === "build_tray") checkBuildTray(data.play, "/play", file, report);
}

function blanks(text) {
  return [...text.matchAll(/\{(\d+)\}/g)].map((match) => Number(match[1]));
}

function checkFillBlank(item, pointer, file, report) {
  const numbers = blanks(item.sentence.en);
  const n = numbers.length;
  const expected = Array.from({ length: n }, (_, i) => i + 1);
  if (n === 0) {
    report(file, `${pointer}/sentence/en`, "câu cần ít nhất một ô trống {1}");
    return;
  }
  if ([...numbers].sort((a, b) => a - b).join() !== expected.join()) {
    report(file, `${pointer}/sentence/en`, `ô trống phải đánh số {1}…{${n}}, mỗi số một lần; đang có ${numbers.map((x) => `{${x}}`).join(" ")}`);
  }
  for (const x of blanks(item.sentence.vi)) {
    if (x < 1 || x > n) report(file, `${pointer}/sentence/vi`, `ô {${x}} không có trong câu en`);
  }
  if (item.answers.length !== n) {
    report(file, `${pointer}/answers`, `câu có ${n} ô trống nhưng answers có ${item.answers.length} đáp án`);
  }
  const bank = new Set(item.bank.map((word) => word.key));
  item.answers.forEach((key, i) => {
    if (!bank.has(key)) report(file, `${pointer}/answers/${i}`, `không có từ nào trong bank có key "${key}"`);
  });
}

function checkOrderSequence(item, pointer, file, report) {
  const keys = new Set(item.items.map((entry) => entry.key));
  item.answer.forEach((key, i) => {
    if (!keys.has(key)) report(file, `${pointer}/answer/${i}`, `không có mục nào trong items có key "${key}"`);
  });
  if (item.answer.length !== item.items.length) {
    report(file, `${pointer}/answer`, `answer phải xếp đủ ${item.items.length} mục của items, đang có ${item.answer.length}`);
  }
}

function checkBuildTray(block, pointer, file, report) {
  const groups = new Map(block.groups.map((group) => [group.key, group]));
  const required = block.groups.filter((group) => group.role === "required");
  if (required.length === 0) report(file, `${pointer}/groups`, 'cần ít nhất một nhóm role "required"');
  if (block.capacity < required.length) {
    report(file, `${pointer}/capacity`, `capacity ${block.capacity} nhỏ hơn số nhóm required (${required.length}), mâm không bao giờ đạt`);
  }
  block.items.forEach((item, index) => {
    if (!groups.has(item.group)) report(file, `${pointer}/items/${index}/group`, `không có nhóm nào có key "${item.group}"`);
  });
  for (const key of Object.keys(block.messages.missing)) {
    if (groups.get(key)?.role !== "required") {
      report(file, join(`${pointer}/messages/missing`, key), `"${key}" không phải key của một nhóm role "required"`);
    }
  }
  for (const group of required) {
    if (!(group.key in block.messages.missing)) {
      report(file, `${pointer}/messages/missing`, `thiếu lời nhắc cho nhóm required "${group.key}"`);
    }
  }
}

function isObject(value) {
  return value !== null && typeof value === "object" && !Array.isArray(value);
}

// Depth-first, document order; visit(value, pointer) for every node.
function walk(value, pointer, visit) {
  visit(value, pointer);
  if (Array.isArray(value)) value.forEach((item, index) => walk(item, join(pointer, index), visit));
  else if (isObject(value)) for (const [key, item] of Object.entries(value)) walk(item, join(pointer, key), visit);
}
