// content/syllabus.json (SK-030): JSON Schema (Ajv, schema/syllabus.schema.json), then the rules
// JSON Schema cannot say. Pure: the caller reads the file and, for the reference checks, passes an
// index of the topics and lessons that exist (content-cli builds it from the markdown in content/).
//
//   schema               Ajv; nothing below runs until it passes
//   syllabus_duplicate   age_group, topic key, topic_id, lesson_id, Oak lesson slug used twice
//   syllabus_number      topic and lesson `number` not 1..n in file order
//   syllabus_key         Oak topic: key = source.unit_slug; new topic: key starts with "new-"
//   syllabus_oak         oak_lessons empty under an Oak topic (except an `extension` lesson), not
//                        empty under a new one; source.year outside the group's oak_years;
//                        `extension` lesson (Duy 13/11): only in an Oak topic, oak_lessons [],
//                        statutory false, not the only kind; anywhere in the topic (SK-051, 18/11:
//                        it may stand between Oak lessons, no longer only after them)
//   syllabus_topic_ref   topic_id not in the content, or a topic of another age group
//   syllabus_lesson_ref  lesson_id not in the content, in another topic, or under a topic without topic_id
//   syllabus_unlisted    (warning) a topic or lesson of the content that no slot points at
// syllabus_json (file is not JSON) is reported by the caller that reads the file.
import { readFileSync } from "node:fs";
import Ajv2020 from "ajv/dist/2020.js";
import { AJV_OPTIONS, SCHEMA_BASE, loadSchemas, normalizeAjvErrors } from "./ajv.mjs";
import { toPointer } from "./pointer.mjs";

export const SYLLABUS_SCHEMA_ID = `${SCHEMA_BASE}syllabus.schema.json`;
const SCHEMA_FILE = new URL("../../schema/syllabus.schema.json", import.meta.url);

/** Every code with its level. README (content-schema, content-cli) lists the same table. */
export const SYLLABUS_CODES = Object.freeze({
  syllabus_json: "error",
  schema: "error",
  syllabus_duplicate: "error",
  syllabus_number: "error",
  syllabus_key: "error",
  syllabus_oak: "error",
  syllabus_topic_ref: "error",
  syllabus_lesson_ref: "error",
  syllabus_unlisted: "warning",
});

export const NEW_TOPIC_PREFIX = "new-";

export function loadSyllabusSchema() {
  return JSON.parse(readFileSync(SCHEMA_FILE, "utf8"));
}

let compiled;
function schemaValidator() {
  if (!compiled) {
    // Union types ("string" or "null") only exist in the syllabus: allowed on this instance alone.
    const ajv = new Ajv2020({ ...AJV_OPTIONS, allowUnionTypes: true });
    for (const schema of loadSchemas()) ajv.addSchema(schema);
    ajv.addSchema(loadSyllabusSchema());
    compiled = ajv.getSchema(SYLLABUS_SCHEMA_ID);
  }
  return compiled;
}

/**
 * @typedef {{pointer: string, code: keyof typeof SYLLABUS_CODES, severity: "error"|"warning", message: string}} SyllabusIssue
 * @typedef {{id: string, slug?: string, age_group?: string, file?: string}} ContentTopic
 * @typedef {{id: string, slug?: string, topic_id?: string, topic_slug?: string, file?: string}} ContentLesson
 * @typedef {{root?: string, topics: ContentTopic[], lessons: ContentLesson[]}} ContentIndex
 * @typedef {{groups: number, topics: number, lessons: number, byGroup: {age_group: string, topics: number, lessons: number}[], linkedTopics: number, linkedLessons: number, untranslatedLessons: number}} SyllabusCounts
 */

/**
 * @param {unknown} data parsed content/syllabus.json
 * @param {{content?: ContentIndex}} [options] without `content` the reference checks are skipped
 * @returns {{ok: boolean, schemaOk: boolean, refsChecked: boolean, issues: SyllabusIssue[], counts?: SyllabusCounts}}
 */
export function validateSyllabus(data, { content } = {}) {
  const validate = schemaValidator();
  if (!validate(data)) {
    const issues = normalizeAjvErrors(validate.errors ?? []).map((error) => issue(data, error.pointer, "schema", error.message));
    return { ok: false, schemaOk: false, refsChecked: false, issues };
  }
  const issues = [...structure(data), ...(content ? references(data, content) : [])].sort(byPlace);
  return { ok: !issues.some((entry) => entry.severity === "error"), schemaOk: true, refsChecked: Boolean(content), issues, counts: countsOf(data) };
}

/** Errors first, then file order (array indexes compared as numbers). */
function byPlace(a, b) {
  if (a.severity !== b.severity) return a.severity === "error" ? -1 : 1;
  const left = a.pointer.split("/");
  const right = b.pointer.split("/");
  for (let i = 0; i < Math.min(left.length, right.length); i++) {
    if (left[i] === right[i]) continue;
    const numeric = /^\d+$/.test(left[i]) && /^\d+$/.test(right[i]);
    if (numeric) return Number(left[i]) - Number(right[i]);
    return left[i] < right[i] ? -1 : 1;
  }
  return left.length - right.length;
}

function issue(data, pointer, code, message) {
  const place = placeOf(data, pointer);
  return { pointer, code, severity: SYLLABUS_CODES[code], message: place ? `${place}: ${message}` : message };
}

const isObject = (value) => value !== null && typeof value === "object" && !Array.isArray(value);
const scalar = (value) => typeof value === "string" || typeof value === "number";

/** "discoverer, chủ đề 9 "healthy-eating", bài 2 "Types of food"" for a pointer inside that lesson. */
export function placeOf(data, pointer) {
  const tokens = pointer.split("/").slice(1);
  const parts = [];
  if (tokens[0] !== "groups" || tokens[1] === undefined || !isObject(data)) return "";
  const group = Array.isArray(data.groups) ? data.groups[Number(tokens[1])] : undefined;
  if (!isObject(group)) return "";
  parts.push(typeof group.age_group === "string" ? group.age_group : `nhóm thứ ${Number(tokens[1]) + 1}`);
  const topic = tokens[2] === "topics" && tokens[3] !== undefined && Array.isArray(group.topics) ? group.topics[Number(tokens[3])] : undefined;
  if (isObject(topic)) {
    const number = Number.isInteger(topic.number) ? topic.number : `(thứ ${Number(tokens[3]) + 1})`;
    parts.push(`chủ đề ${number}${scalar(topic.key) ? ` "${topic.key}"` : ""}`);
    const lesson = tokens[4] === "lessons" && tokens[5] !== undefined && Array.isArray(topic.lessons) ? topic.lessons[Number(tokens[5])] : undefined;
    if (isObject(lesson)) {
      const lessonNumber = Number.isInteger(lesson.number) ? lesson.number : `(thứ ${Number(tokens[5]) + 1})`;
      const title = isObject(lesson.title) && typeof lesson.title.en === "string" ? ` "${lesson.title.en}"` : "";
      parts.push(`bài ${lessonNumber}${title}`);
    }
  }
  return parts.join(", ");
}

/** Every topic and lesson with its pointer, in file order (data already passed the schema). */
function* walk(data) {
  for (const [g, group] of data.groups.entries()) {
    for (const [t, topic] of group.topics.entries()) {
      const topicPointer = toPointer(["groups", g, "topics", t]);
      yield { group, g, topic, t, topicPointer };
    }
  }
}

function structure(data) {
  const out = [];
  const add = (pointer, code, message) => out.push(issue(data, pointer, code, message));
  const firstAt = (map, value, pointer) => {
    if (map.has(value)) return map.get(value);
    map.set(value, pointer);
    return undefined;
  };

  const groups = new Map();
  for (const [g, group] of data.groups.entries()) {
    const at = toPointer(["groups", g, "age_group"]);
    const other = firstAt(groups, group.age_group, at);
    if (other) add(at, "syllabus_duplicate", `nhóm ${group.age_group} đã có ở ${other.replace(/\/age_group$/, "")}; mỗi nhóm tuổi một mục`);
    for (const [t, topic] of group.topics.entries()) {
      if (topic.number !== t + 1) {
        add(toPointer(["groups", g, "topics", t, "number"]), "syllabus_number", `number phải là ${t + 1} (chủ đề thứ ${t + 1} của nhóm; number đi liên tiếp từ 1 theo thứ tự trong file), đang là ${topic.number}`);
      }
      for (const [l, lesson] of topic.lessons.entries()) {
        if (lesson.number !== l + 1) {
          add(toPointer(["groups", g, "topics", t, "lessons", l, "number"]), "syllabus_number", `number phải là ${l + 1} (bài thứ ${l + 1} của chủ đề; number đi liên tiếp từ 1 theo thứ tự trong file), đang là ${lesson.number}`);
        }
      }
    }
  }

  const keys = new Map();
  const topicIds = new Map();
  const lessonIds = new Map();
  const oakLessons = new Map();
  for (const { group, topic, topicPointer } of walk(data)) {
    const keyAt = `${topicPointer}/key`;
    const sameKey = firstAt(keys, topic.key, keyAt);
    if (sameKey) add(keyAt, "syllabus_duplicate", `key "${topic.key}" trùng với ${placeOf(data, sameKey)} (${sameKey}); key duy nhất trong cả file`);

    const oak = topic.source.kind === "oak";
    if (oak && topic.key !== topic.source.unit_slug) {
      add(keyAt, "syllabus_key", `chủ đề lấy từ Oak có key bằng source.unit_slug "${topic.source.unit_slug}", đang là "${topic.key}"`);
    }
    if (!oak && !topic.key.startsWith(NEW_TOPIC_PREFIX)) {
      add(keyAt, "syllabus_key", `chủ đề mới (source.kind = new) có key bắt đầu bằng "${NEW_TOPIC_PREFIX}", đang là "${topic.key}"`);
    }
    if (oak && !group.oak_years.includes(topic.source.year)) {
      add(`${topicPointer}/source/year`, "syllabus_oak", `source.year ${topic.source.year} không thuộc oak_years [${group.oak_years.join(", ")}] của nhóm ${group.age_group}`);
    }

    if (topic.topic_id !== undefined) {
      const at = `${topicPointer}/topic_id`;
      const other = firstAt(topicIds, topic.topic_id, at);
      if (other) add(at, "syllabus_duplicate", `topic_id ${topic.topic_id} đã gắn cho ${placeOf(data, other)} (${other}); mỗi chủ đề nội dung gắn một ô`);
    }

    for (const [l, lesson] of topic.lessons.entries()) {
      const lessonPointer = `${topicPointer}/lessons/${l}`;
      if (lesson.extension === true) {
        // Extension lesson (Duy 13/11): a lesson of our own in an Oak unit, at any place (SK-051).
        if (!oak) add(`${lessonPointer}/extension`, "syllabus_oak", `extension chỉ dùng trong chủ đề lấy từ Oak; chủ đề mới (source.kind = new) thì mọi bài đã là bài riêng, bỏ extension`);
        if (oak && lesson.oak_lessons.length > 0) add(`${lessonPointer}/oak_lessons`, "syllabus_oak", `bài mở rộng (extension) không có lesson Oak: oak_lessons phải là [], đang có ${lesson.oak_lessons.length} slug`);
        if (lesson.statutory !== false) add(`${lessonPointer}/statutory`, "syllabus_oak", `bài mở rộng (extension) không thuộc chương trình bắt buộc: statutory phải là false`);
      } else if (oak) {
        if (lesson.oak_lessons.length === 0) {
          add(`${lessonPointer}/oak_lessons`, "syllabus_oak", `chủ đề lấy từ Oak (source.kind = oak): oak_lessons cần ít nhất 1 slug lesson của Oak (bài riêng thêm vào chủ đề thì ghi "extension": true)`);
        }
      }
      if (!oak && lesson.oak_lessons.length > 0) {
        add(`${lessonPointer}/oak_lessons`, "syllabus_oak", `chủ đề mới (source.kind = new): oak_lessons phải là [], đang có ${lesson.oak_lessons.length} slug`);
      }
      for (const [s, slug] of lesson.oak_lessons.entries()) {
        const at = `${lessonPointer}/oak_lessons/${s}`;
        const other = firstAt(oakLessons, slug, at);
        if (other) add(at, "syllabus_duplicate", `lesson Oak "${slug}" đã gắn ở ${placeOf(data, other)} (${other}); mỗi lesson Oak vào một bài`);
      }
      if (lesson.lesson_id !== undefined) {
        const at = `${lessonPointer}/lesson_id`;
        const other = firstAt(lessonIds, lesson.lesson_id, at);
        if (other) add(at, "syllabus_duplicate", `lesson_id ${lesson.lesson_id} đã gắn cho ${placeOf(data, other)} (${other}); mỗi bài nội dung gắn một ô`);
        if (topic.topic_id === undefined) {
          add(at, "syllabus_lesson_ref", `có lesson_id nhưng chủ đề chưa có topic_id; ghi topic_id (id trong _topic.md của chủ đề chứa bài) trước`);
        }
      }
    }
    if (oak && topic.lessons.every((lesson) => lesson.extension === true)) {
      add(`${topicPointer}/lessons`, "syllabus_oak", `chủ đề lấy từ Oak cần ít nhất 1 bài Oak; mọi bài đều là extension thì chủ đề là chủ đề mới (source.kind = new)`);
    }
  }
  return out;
}

function references(data, content) {
  const out = [];
  const add = (pointer, code, message) => out.push(issue(data, pointer, code, message));
  const root = content.root ?? "nội dung";
  const topics = new Map();
  for (const topic of content.topics) if (!topics.has(topic.id)) topics.set(topic.id, topic);
  const lessons = new Map();
  for (const lesson of content.lessons) if (!lessons.has(lesson.id)) lessons.set(lesson.id, lesson);
  const where = (entry) => (entry.file ? ` (${entry.file})` : "");

  const linkedTopics = new Map();
  const linkedLessons = new Set();
  for (const { group, topic, topicPointer } of walk(data)) {
    if (topic.topic_id !== undefined) {
      linkedTopics.set(topic.topic_id, topicPointer);
      const found = topics.get(topic.topic_id);
      if (!found) {
        add(`${topicPointer}/topic_id`, "syllabus_topic_ref", `topic_id ${topic.topic_id} không có trong ${root}: không _topic.md nào có id này`);
      } else if (found.age_group !== undefined && found.age_group !== group.age_group) {
        add(`${topicPointer}/topic_id`, "syllabus_topic_ref", `topic_id ${topic.topic_id} là chủ đề "${found.slug}"${where(found)} của nhóm ${found.age_group}, không phải nhóm ${group.age_group}`);
      }
    }
    for (const [l, lesson] of topic.lessons.entries()) {
      if (lesson.lesson_id === undefined) continue;
      linkedLessons.add(lesson.lesson_id);
      const at = `${topicPointer}/lessons/${l}/lesson_id`;
      const found = lessons.get(lesson.lesson_id);
      if (!found) {
        add(at, "syllabus_lesson_ref", `lesson_id ${lesson.lesson_id} không có trong ${root}: không bài markdown nào có id này`);
      } else if (topics.has(topic.topic_id) && found.topic_id !== topic.topic_id) {
        // Only under a topic_id that resolves: a wrong topic_id is reported once, on the topic.
        add(at, "syllabus_lesson_ref", `lesson_id ${lesson.lesson_id} là bài "${found.slug}"${where(found)} của chủ đề "${found.topic_slug}", không thuộc topic_id ${topic.topic_id} của chủ đề này`);
      }
    }
  }

  // Content no slot points at: the app would never show it.
  for (const topic of topics.values()) {
    if (linkedTopics.has(topic.id)) continue;
    add("", "syllabus_unlisted", `chủ đề "${topic.slug}"${where(topic)} có trong ${root} nhưng chưa ô nào trỏ tới: ghi topic_id ${topic.id} vào chủ đề tương ứng`);
  }
  for (const lesson of lessons.values()) {
    if (linkedLessons.has(lesson.id)) continue;
    const topicPointer = lesson.topic_id !== undefined ? linkedTopics.get(lesson.topic_id) : undefined;
    add(topicPointer ? `${topicPointer}/lessons` : "", "syllabus_unlisted", `bài "${lesson.slug}"${where(lesson)} có trong ${root} nhưng chưa ô nào trỏ tới: ghi lesson_id ${lesson.id} vào bài tương ứng`);
  }
  return out;
}

function countsOf(data) {
  const byGroup = data.groups.map((group) => ({
    age_group: group.age_group,
    topics: group.topics.length,
    lessons: group.topics.reduce((n, topic) => n + topic.lessons.length, 0),
  }));
  const topics = data.groups.flatMap((group) => group.topics);
  const lessons = topics.flatMap((topic) => topic.lessons);
  return {
    groups: data.groups.length,
    topics: topics.length,
    lessons: lessons.length,
    byGroup,
    linkedTopics: topics.filter((topic) => topic.topic_id !== undefined).length,
    linkedLessons: lessons.filter((lesson) => lesson.lesson_id !== undefined).length,
    untranslatedLessons: lessons.filter((lesson) => lesson.title.vi === null).length,
  };
}
