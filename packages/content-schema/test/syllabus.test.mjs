// SK-030: content/syllabus.json. Unit cases on a small sample (one rule, one case), then the real
// file: schema, the rules of scripts/lib/syllabus.mjs, and every topic_id / lesson_id against the
// markdown in content/, read with content-cli's own reader (tools/content-cli/src/markdown/files.ts,
// frontmatter only) so there is one markdown parser. Needs `npm install` in tools/content-cli.
import assert from "node:assert/strict";
import { randomUUID } from "node:crypto";
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import test, { describe } from "node:test";
import { loadSchemas } from "../scripts/lib/ajv.mjs";
import { SYLLABUS_CODES, loadSyllabusSchema, placeOf, validateSyllabus } from "../scripts/lib/syllabus.mjs";

const REPO = fileURLToPath(new URL("../../../", import.meta.url));
const CONTENT = `${REPO}content`;
const SYLLABUS_FILE = `${CONTENT}/syllabus.json`;

async function contentIndexOf(root) {
  let files;
  try {
    files = await import(new URL("../../../tools/content-cli/src/markdown/files.ts", import.meta.url));
  } catch (error) {
    throw new Error(`không nạp được tools/content-cli/src/markdown/files.ts (chạy npm install trong tools/content-cli?): ${error.message}`);
  }
  return files.contentIndex(root, (file) => file.slice(REPO.length));
}

// --- sample ---------------------------------------------------------------------------
const T1 = "d3a514ef-02cd-4386-a358-f01e425a10f8";
const T2 = "0b6f3a52-6c1e-4f43-9d0a-2f7c8e1d9a10";
const L1 = "4b11eb40-9a47-4e5e-b4b5-bea60264ded3";
const L2 = "23603940-87a2-435b-bf7d-c6c18f79e349";
const L3 = "7d2c4e91-3b5a-4f6e-8c1d-0a9b8c7d6e5f";
const UNKNOWN = "99999999-9999-4999-8999-999999999999";

function sample() {
  return {
    schema_version: 1,
    syllabus_version: "2026-11-09",
    ai_draft: true,
    source: "test",
    groups: [
      {
        age_group: "explorer",
        oak_years: [1, 2],
        topics: [
          {
            key: "everyday-materials",
            number: 1,
            title: { en: "Everyday materials", vi: "Vật liệu quanh em" },
            strand: "materials",
            level: 2,
            source: { kind: "oak", unit_slug: "everyday-materials", year: 1, unit_index: 6 },
            topic_id: T2,
            lessons: [{ number: 1, title: { en: "Materials", vi: null }, oak_lessons: ["materials-a"], statutory: true, lesson_id: L3 }],
          },
        ],
      },
      {
        age_group: "discoverer",
        oak_years: [3, 4],
        topics: [
          {
            key: "new-weather",
            number: 1,
            title: { en: "Weather", vi: "Thời tiết" },
            strand: "earth_sky",
            level: null,
            source: { kind: "new" },
            lessons: [
              { number: 1, title: { en: "Clouds", vi: "Mây" }, oak_lessons: [], statutory: false },
              { number: 2, title: { en: "Rain", vi: null }, oak_lessons: [], statutory: false },
            ],
          },
          {
            key: "healthy-eating",
            number: 2,
            title: { en: "Healthy eating", vi: "Ăn uống lành mạnh" },
            strand: "humans_health",
            level: 2,
            source: { kind: "oak", unit_slug: "healthy-eating", year: 3, unit_index: 4 },
            topic_id: T1,
            lessons: [
              { number: 1, title: { en: "Making or finding food", vi: null }, oak_lessons: ["making-or-finding-food"], statutory: true },
              { number: 2, title: { en: "Types of food", vi: "Thức ăn cho ta những gì?" }, oak_lessons: ["types-of-food"], statutory: true, lesson_id: L1 },
              {
                number: 3,
                title: { en: "Nutrient-rich meal", vi: null },
                oak_lessons: ["nutrient-rich-meal-planning", "nutrient-rich-meal-doing"],
                statutory: false,
                sensitive: true,
                lesson_id: L2,
              },
            ],
          },
        ],
      },
    ],
  };
}

function index() {
  const topic = (id, slug, age_group) => ({ id, slug, age_group, file: `content/${age_group}/${slug}/_topic.md` });
  const lesson = (id, slug, topic_id, topic_slug, group) => ({ id, slug, topic_id, topic_slug, file: `content/${group}/${topic_slug}/${slug}.md` });
  return {
    root: "content",
    topics: [topic(T1, "an-uong-lanh-manh", "discoverer"), topic(T2, "vat-lieu", "explorer")],
    lessons: [
      lesson(L1, "thuc-an-cho-ta-nhung-gi", T1, "an-uong-lanh-manh", "discoverer"),
      lesson(L2, "mam-com-can-bang", T1, "an-uong-lanh-manh", "discoverer"),
      lesson(L3, "vat-lieu-1", T2, "vat-lieu", "explorer"),
    ],
  };
}

/** Extension lesson number n of an Oak topic (Duy 13/11). */
const extension = (number) => ({ number, title: { en: `Extension ${number}`, vi: null }, oak_lessons: [], statutory: false, extension: true });
const renumber = (topic) => topic.lessons.forEach((lesson, i) => (lesson.number = i + 1)) ?? true;

const HE = "/groups/1/topics/1"; // healthy-eating
const NEW = "/groups/1/topics/0"; // new-weather
const at = (issues, severity = "error") => issues.filter((issue) => issue.severity === severity).map((issue) => `${issue.pointer} ${issue.code}`);

/** name -> mutation of (data, index) and the errors expected, exactly. `refs: false` runs without the content index. */
const CASES = [
  // schema
  ["topic title.vi null (only lessons may lack vi)", (d) => (d.groups[1].topics[1].title.vi = null), [`${HE}/title/vi schema`]],
  ["lesson title.vi missing (null is how a lesson says untranslated)", (d) => delete d.groups[1].topics[1].lessons[0].title.vi, [`${HE}/lessons/0/title/vi schema`]],
  ["lesson title.vi blank", (d) => (d.groups[1].topics[1].lessons[0].title.vi = " "), [`${HE}/lessons/0/title/vi schema`]],
  ["lesson title.en null", (d) => (d.groups[1].topics[1].lessons[0].title.en = null), [`${HE}/lessons/0/title/en schema`]],
  ["level 6", (d) => (d.groups[1].topics[1].level = 6), [`${HE}/level schema`]],
  ["level missing (null is how a new topic says unrated)", (d) => delete d.groups[1].topics[0].level, [`${NEW}/level schema`]],
  ["strand outside topic.schema.json", (d) => (d.groups[1].topics[1].strand = "space"), [`${HE}/strand schema`]],
  ["age_group outside topic.schema.json", (d) => (d.groups[0].age_group = "teen"), ["/groups/0/age_group schema"]],
  ["oak source without year", (d) => delete d.groups[1].topics[1].source.year, [`${HE}/source/year schema`]],
  ["new source with unit_slug", (d) => (d.groups[1].topics[0].source.unit_slug = "x"), [`${NEW}/source/unit_slug schema`]],
  ["source kind other", (d) => (d.groups[1].topics[0].source = { kind: "custom" }), [`${NEW}/source/kind schema`]],
  ["unknown lesson field", (d) => (d.groups[1].topics[1].lessons[0].order = 1), [`${HE}/lessons/0/order schema`]],
  ["topic_id not a UUID", (d) => (d.groups[1].topics[1].topic_id = "abc"), [`${HE}/topic_id schema`]],
  ["topic without lessons", (d) => (d.groups[1].topics[0].lessons = []), [`${NEW}/lessons schema`]],
  ["syllabus_version not a date", (d) => (d.syllabus_version = "9/11"), ["/syllabus_version schema"]],
  // syllabus_duplicate
  ["age_group twice", (d) => (d.groups[1].age_group = "explorer"), ["/groups/1/age_group syllabus_duplicate"], { refs: false }],
  ["key twice in the file", (d) => Object.assign(d.groups[0].topics[0], { key: "healthy-eating", source: { ...d.groups[0].topics[0].source, unit_slug: "healthy-eating" } }), [`${HE}/key syllabus_duplicate`]],
  ["topic_id on two topics", (d) => (d.groups[1].topics[0].topic_id = T1), [`${HE}/topic_id syllabus_duplicate`]],
  ["lesson_id on two lessons", (d) => (d.groups[1].topics[1].lessons[0].lesson_id = L1), [`${HE}/lessons/1/lesson_id syllabus_duplicate`]],
  ["Oak lesson in two lessons", (d) => (d.groups[1].topics[1].lessons[0].oak_lessons = ["materials-a"]), [`${HE}/lessons/0/oak_lessons/0 syllabus_duplicate`]],
  // syllabus_number
  ["topic number skips", (d) => (d.groups[1].topics[1].number = 3), [`${HE}/number syllabus_number`]],
  ["lesson numbers start at 2", (d) => (d.groups[1].topics[1].lessons[0].number = 2), [`${HE}/lessons/0/number syllabus_number`]],
  // syllabus_key
  ["Oak key differs from unit_slug", (d) => (d.groups[1].topics[1].key = "eating"), [`${HE}/key syllabus_key`]],
  ["new key without new-", (d) => (d.groups[1].topics[0].key = "weather"), [`${NEW}/key syllabus_key`]],
  // syllabus_oak
  ["Oak topic, lesson without oak_lessons", (d) => (d.groups[1].topics[1].lessons[0].oak_lessons = []), [`${HE}/lessons/0/oak_lessons syllabus_oak`]],
  ["new topic, lesson with oak_lessons", (d) => (d.groups[1].topics[0].lessons[1].oak_lessons = ["rain"]), [`${NEW}/lessons/1/oak_lessons syllabus_oak`]],
  ["source.year outside oak_years", (d) => (d.groups[1].topics[1].source.year = 5), [`${HE}/source/year syllabus_oak`]],
  // extension (Duy 13/11): a lesson of our own in an Oak topic; anywhere in it since SK-051 (18/11)
  ["extension lesson after the Oak lessons", (d) => d.groups[1].topics[1].lessons.push(extension(4)), []],
  ["two extension lessons, sensitive", (d) => d.groups[1].topics[1].lessons.push(extension(4), { ...extension(5), sensitive: true }), []],
  ["extension with oak_lessons", (d) => d.groups[1].topics[1].lessons.push({ ...extension(4), oak_lessons: ["insects"] }), [`${HE}/lessons/3/oak_lessons syllabus_oak`]],
  ["extension statutory true", (d) => d.groups[1].topics[1].lessons.push({ ...extension(4), statutory: true }), [`${HE}/lessons/3/statutory syllabus_oak`]],
  ["extension lesson between Oak lessons (SK-051)", (d) => d.groups[1].topics[1].lessons.splice(2, 0, extension(3)) && renumber(d.groups[1].topics[1]), []],
  ["extension lesson first, Oak lessons after it (SK-051)", (d) => d.groups[1].topics[1].lessons.splice(0, 0, extension(1)) && renumber(d.groups[1].topics[1]), []],
  ["extension in the middle with oak_lessons", (d) => d.groups[1].topics[1].lessons.splice(1, 0, { ...extension(2), oak_lessons: ["insects"] }) && renumber(d.groups[1].topics[1]), [`${HE}/lessons/1/oak_lessons syllabus_oak`]],
  ["extension in the middle statutory true", (d) => d.groups[1].topics[1].lessons.splice(1, 0, { ...extension(2), statutory: true }) && renumber(d.groups[1].topics[1]), [`${HE}/lessons/1/statutory syllabus_oak`]],
  ["extension in a new topic", (d) => d.groups[1].topics[0].lessons.push(extension(3)), [`${NEW}/lessons/2/extension syllabus_oak`]],
  ["Oak topic with only extension lessons", (d) => (d.groups[1].topics[1].lessons = [extension(1)]), [`${HE}/lessons syllabus_oak`], { refs: false }],
  ["extension not boolean", (d) => d.groups[1].topics[1].lessons.push({ ...extension(4), extension: "yes" }), [`${HE}/lessons/3/extension schema`]],
  // syllabus_topic_ref
  ["topic_id not in the content (its lessons are not blamed again)", (d) => (d.groups[1].topics[1].topic_id = UNKNOWN), [`${HE}/topic_id syllabus_topic_ref`]],
  ["topic_id of another age group", (_, i) => (i.topics[0].age_group = "scientist"), [`${HE}/topic_id syllabus_topic_ref`]],
  // syllabus_lesson_ref
  ["lesson_id not in the content", (d) => (d.groups[1].topics[1].lessons[1].lesson_id = UNKNOWN), [`${HE}/lessons/1/lesson_id syllabus_lesson_ref`]],
  [
    "lesson_id of a lesson in another topic",
    (d) => {
      delete d.groups[0].topics[0].lessons[0].lesson_id;
      d.groups[1].topics[1].lessons[0].lesson_id = L3;
    },
    [`${HE}/lessons/0/lesson_id syllabus_lesson_ref`],
  ],
  ["lesson_id under a topic without topic_id", (d) => delete d.groups[1].topics[1].topic_id, [`${HE}/lessons/1/lesson_id syllabus_lesson_ref`, `${HE}/lessons/2/lesson_id syllabus_lesson_ref`]],
  // without the index nothing is looked up
  ["no content index: unknown ids pass", (d) => (d.groups[1].topics[1].lessons[1].lesson_id = UNKNOWN), [], { refs: false }],
];

describe("syllabus.schema.json + scripts/lib/syllabus.mjs (mẫu nhỏ)", () => {
  test("schema: $id, draft 2020-12; strand và age_group trỏ vào topic.schema.json", () => {
    const schema = loadSyllabusSchema();
    assert.equal(schema.$schema, "https://json-schema.org/draft/2020-12/schema");
    assert.equal(schema.$id, "https://science-kids.example/schema/content/v1/syllabus.schema.json");
    assert.equal(schema.$defs.SyllabusTopic.properties.strand.$ref, "topic.schema.json#/$defs/Topic/properties/strand");
    assert.equal(schema.$defs.SyllabusGroup.properties.age_group.$ref, "topic.schema.json#/$defs/Topic/properties/age_group");
  });

  test("mọi strand và age_group của topic.schema.json đều hợp lệ trong syllabus", () => {
    const topic = loadSchemas().find((schema) => schema.$id.endsWith("/topic.schema.json")).$defs.Topic.properties;
    for (const strand of topic.strand.enum) {
      const data = sample();
      data.groups[1].topics[1].strand = strand;
      assert.deepEqual(validateSyllabus(data).issues, [], strand);
    }
    for (const group of topic.age_group.enum) {
      const data = sample();
      data.groups[0].age_group = group;
      if (group === "discoverer") data.groups[1].age_group = "explorer";
      assert.deepEqual(validateSyllabus(data).issues, [], group);
    }
  });

  test("mẫu hợp lệ: 0 lỗi; vi null ở bài, level null ở chủ đề mới, sensitive, nhiều lesson Oak trong một bài", () => {
    const report = validateSyllabus(sample(), { content: index() });
    assert.deepEqual(report.issues, []);
    assert.equal(report.ok, true);
    assert.equal(report.refsChecked, true);
    assert.deepEqual(report.counts, {
      groups: 2,
      topics: 3,
      lessons: 6,
      byGroup: [
        { age_group: "explorer", topics: 1, lessons: 1 },
        { age_group: "discoverer", topics: 2, lessons: 5 },
      ],
      linkedTopics: 2,
      linkedLessons: 3,
      untranslatedLessons: 4,
    });
  });

  for (const [name, mutate, expected, options = {}] of CASES) {
    test(`${name} -> ${expected.length === 0 ? "0 lỗi" : expected.join(", ")}`, () => {
      const data = sample();
      const content = index();
      mutate(data, content);
      const report = validateSyllabus(data, options.refs === false ? {} : { content });
      assert.deepEqual(at(report.issues), expected, JSON.stringify(report.issues, null, 2));
      assert.equal(report.ok, expected.length === 0);
      for (const issue of report.issues) assert.ok(issue.code in SYLLABUS_CODES, issue.code);
    });
  }

  test("thông báo nêu nhóm, chủ đề (number, key) và bài (number, tên en)", () => {
    const data = sample();
    data.groups[1].topics[1].lessons[1].lesson_id = UNKNOWN;
    const [issue] = validateSyllabus(data, { content: index() }).issues.filter((entry) => entry.severity === "error");
    assert.equal(issue.message, `discoverer, chủ đề 2 "healthy-eating", bài 2 "Types of food": lesson_id ${UNKNOWN} không có trong content: không bài markdown nào có id này`);

    const other = sample();
    delete other.groups[0].topics[0].lessons[0].lesson_id;
    other.groups[1].topics[1].lessons[0].lesson_id = L3;
    const [moved] = validateSyllabus(other, { content: index() }).issues.filter((entry) => entry.severity === "error");
    assert.match(moved.message, /^discoverer, chủ đề 2 "healthy-eating", bài 1 "Making or finding food": lesson_id 7d2c4e91-\S+ là bài "vat-lieu-1" \(content\/explorer\/vat-lieu\/vat-lieu-1\.md\) của chủ đề "vat-lieu", không thuộc topic_id d3a514ef-\S+ của chủ đề này$/);
  });

  test("bài hoặc chủ đề có trong nội dung mà chưa ô nào trỏ tới: cảnh báo syllabus_unlisted, vẫn ok", () => {
    const content = index();
    content.lessons.push({ id: UNKNOWN, slug: "an-bao-nhieu", topic_id: T1, topic_slug: "an-uong-lanh-manh", file: "content/discoverer/an-uong-lanh-manh/03-an-bao-nhieu.md" });
    content.topics.push({ id: "12345678-1234-4234-8234-123456789abc", slug: "nam", age_group: "scientist", file: "content/scientist/nam/_topic.md" });
    const report = validateSyllabus(sample(), { content });
    assert.equal(report.ok, true);
    assert.deepEqual(at(report.issues), []);
    assert.deepEqual(at(report.issues, "warning"), [" syllabus_unlisted", `${HE}/lessons syllabus_unlisted`]);
    const lesson = report.issues.find((entry) => entry.pointer === `${HE}/lessons`);
    assert.match(lesson.message, /^discoverer, chủ đề 2 "healthy-eating": bài "an-bao-nhieu" \(content\/discoverer\/an-uong-lanh-manh\/03-an-bao-nhieu\.md\) có trong content nhưng chưa ô nào trỏ tới: ghi lesson_id 99999999-/);
  });

  test("lỗi trước cảnh báo, theo thứ tự trong file (chỉ số mảng so như số: 9 trước 10)", () => {
    const data = sample();
    const topics = data.groups[1].topics;
    for (let n = 3; n <= 11; n++) topics.push({ ...structuredClone(topics[0]), key: `new-t${n}`, number: n });
    topics[10].lessons[0].number = 5; // /groups/1/topics/10
    topics[9].lessons[0].number = 5; // /groups/1/topics/9
    const content = index();
    content.topics.push({ id: UNKNOWN, slug: "x", age_group: "explorer" });
    const report = validateSyllabus(data, { content });
    assert.deepEqual(
      report.issues.map((issue) => `${issue.pointer} ${issue.code}`),
      ["/groups/1/topics/9/lessons/0/number syllabus_number", "/groups/1/topics/10/lessons/0/number syllabus_number", " syllabus_unlisted"],
    );
  });

  test("placeOf chịu được dữ liệu sai hình (không ném lỗi)", () => {
    assert.equal(placeOf(null, "/groups/0"), "");
    assert.equal(placeOf({ groups: "x" }, "/groups/0/topics/0"), "");
    assert.equal(placeOf({ groups: [{ topics: [{ lessons: [{}] }] }] }, "/groups/0/topics/0/lessons/0/title"), "nhóm thứ 1, chủ đề (thứ 1), bài (thứ 1)");
  });
});

describe("content/syllabus.json (file thật)", () => {
  const data = JSON.parse(readFileSync(SYLLABUS_FILE, "utf8"));

  test("đúng schema và luật, mọi topic_id / lesson_id có trong content/ và lesson_id thuộc đúng chủ đề", async (t) => {
    const content = await contentIndexOf(CONTENT);
    assert.ok(content.topics.length >= 1 && content.lessons.length >= 1, "content/ phải có ít nhất một chủ đề và một bài markdown");
    const report = validateSyllabus(data, { content });
    const errors = report.issues.filter((issue) => issue.severity === "error");
    assert.deepEqual(errors, [], errors.map((issue) => `${issue.pointer} [${issue.code}] ${issue.message}`).join("\n"));
    assert.equal(report.refsChecked, true);
    for (const warning of report.issues) t.diagnostic(`${warning.pointer || "/"} [${warning.code}] ${warning.message}`);
  });

  // SK-051 (18/11): Explorer #10 growing-plants merged into #7, so 11 topics / 71 lessons (incl. extension
  // lessons: 2 of naming-and-grouping-animals, 1 of identifying-plants-and-their-basic-parts), total 382.
  // SK-053 (18/11): new-life ("Life cycles") goes from 5 Oak lessons to 6 (lessons 3 and 5 are extension
  // lessons), so Explorer 11 topics / 72 lessons, total 383.
  // SK-057 (19/11): Explorer drops everyday-materials (7), uses-of-everyday-materials (6) and healthy-me (7),
  // new-life becomes #8, three new earth_sky topics #9-#11 (6 lessons each): 11 topics / 70 lessons, total 381.
  // SK-061 (19/11): Explorer drops new-water-around-us (6 lessons, moved to Discoverer), new-sky-day-and-night
  // becomes #10 (level 1): 10 topics / 64 lessons, total 375.
  test("nghiệm thu SK-030, số đếm SK-061: 3 nhóm explorer, discoverer, scientist; 10, 17, 16 chủ đề; 64, 155, 156 bài, tổng 375", () => {
    const { counts } = validateSyllabus(data);
    assert.deepEqual(
      counts.byGroup.map((group) => [group.age_group, group.topics, group.lessons]),
      [
        ["explorer", 10, 64],
        ["discoverer", 17, 155],
        ["scientist", 16, 156],
      ],
    );
    assert.equal(counts.lessons, 375);
  });

  test("tên: chủ đề luôn có vi (schema); bài còn vi null thì đếm được (nghiệm thu: 0 sau khi gộp tên của content-editor)", (t) => {
    const { counts } = validateSyllabus(data);
    const missing = data.groups.flatMap((group) => group.topics).flatMap((topic) => topic.lessons).filter((lesson) => lesson.title.vi === null).length;
    assert.equal(counts.untranslatedLessons, missing);
    t.diagnostic(`${counts.untranslatedLessons}/${counts.lessons} bài chưa có title.vi`);
  });

  test("bản chép có một lesson_id trỏ sai: đúng một lỗi syllabus_lesson_ref, nêu đúng chủ đề và bài", async () => {
    const content = await contentIndexOf(CONTENT);
    const copy = structuredClone(data);
    const slots = [];
    copy.groups.forEach((group, g) =>
      group.topics.forEach((topic, t) => topic.lessons.forEach((lesson, l) => lesson.lesson_id && slots.push({ group, topic, lesson, pointer: `/groups/${g}/topics/${t}/lessons/${l}/lesson_id` }))),
    );
    assert.ok(slots.length >= 1, "file thật phải có ít nhất một bài có lesson_id");
    const { group, topic, lesson, pointer } = slots[0];
    const wrong = randomUUID();
    lesson.lesson_id = wrong;
    const errors = validateSyllabus(copy, { content }).issues.filter((issue) => issue.severity === "error");
    assert.deepEqual(errors.map((issue) => `${issue.pointer} ${issue.code}`), [`${pointer} syllabus_lesson_ref`]);
    assert.ok(
      errors[0].message.startsWith(`${group.age_group}, chủ đề ${topic.number} "${topic.key}", bài ${lesson.number} "${lesson.title.en}": lesson_id ${wrong} không có trong content`),
      errors[0].message,
    );
  });
});
