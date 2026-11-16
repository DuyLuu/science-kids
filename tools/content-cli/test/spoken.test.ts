import assert from "node:assert/strict";
import { describe, test } from "node:test";
import { SchemaWalker } from "../src/schema-walk.ts";
import { collectSpoken } from "../src/spoken.ts";
import { LESSON_FILE, readJson, TOPIC_FILE } from "./helpers.ts";

describe("chuỗi Spoken lấy theo schema", () => {
  const topic = collectSpoken("topic", readJson(TOPIC_FILE));
  const lesson = collectSpoken("lesson", readJson(LESSON_FILE));

  // SK-047 (15/11): q2 of lesson 1 became "nutrients" and its two wrong bank words got feedback (126 -> 128).
  test("bài 1: topic 2, bài 128, tổng 130, 110 chuỗi EN khác nhau", () => {
    assert.equal(topic.length, 2);
    assert.equal(lesson.length, 128);
    assert.equal(new Set([...topic, ...lesson].map(({ node }) => node.en)).size, 110);
    assert.deepEqual(topic.map(({ pointer }) => pointer), ["/title", "/question"]);
  });

  test("không lấy Text: alt, recall_from.note, statement/correction của misconception", () => {
    const pointers = lesson.map(({ pointer }) => pointer);
    assert.deepEqual(pointers.filter((pointer) => /\/alt$|\/note$|\/correction$|misconceptions/.test(pointer)), []);
  });

  test("có mọi nhánh: if/then theo format, additionalProperties (messages.missing), true_false statement", () => {
    const pointers = new Set(lesson.map(({ pointer }) => pointer));
    for (const pointer of [
      "/title",
      "/objective",
      "/key_points/2",
      "/warmup/0/sentence",
      "/warmup/0/bank/2/label",
      "/warmup/1/prompt",
      "/learn/0/groups/3/examples/2",
      "/learn/1/title",
      "/play/messages/missing/tray_protein",
      "/play/items/7/label",
      "/quiz/4/instruction",
      "/quiz/5/statement",
      "/quiz/5/labels/false",
      "/vocab/7/example",
      "/reward/collectible/fact",
    ]) {
      assert.ok(pointers.has(pointer), pointer);
    }
  });

  test("hình của thẻ từ fill_blank_bank (SK-033): alt là Text, không đọc; nhãn vẫn đọc", () => {
    const doc = readJson(LESSON_FILE) as any;
    const w = doc.warmup.findIndex((item: { format: string }) => item.format === "fill_blank_bank");
    doc.warmup[w].bank[0].image = { alt: { en: "Air bubbles in water", vi: "Bọt khí trong nước" }, brief: "Bọt khí" };
    const pointers = collectSpoken("lesson", doc).map(({ pointer }) => pointer);
    assert.equal(pointers.length, lesson.length);
    assert.ok(pointers.includes(`/warmup/${w}/bank/0/label`));
    assert.deepEqual(pointers.filter((pointer) => pointer.includes("/image")), []);
  });

  test("thứ tự theo tài liệu", () => {
    assert.equal(lesson[0]!.pointer, "/title");
    assert.equal(lesson.at(-1)!.pointer, "/reward/collectible/fact");
  });
});

describe("SchemaWalker", () => {
  const base = "https://example.test/";
  const schemas = [
    { $id: `${base}common.json`, $defs: { Target: { type: "object", properties: { en: { type: "string" } } }, Other: { type: "object" } } },
    {
      $id: `${base}root.json`,
      type: "object",
      properties: {
        pick: { oneOf: [{ type: "string" }, { $ref: "common.json#/$defs/Target" }] },
        list: { type: "array", prefixItems: [{ $ref: "common.json#/$defs/Other" }], items: { $ref: "common.json#/$defs/Target" } },
        tagged: {
          type: "object",
          if: { properties: { kind: { const: "a" } } },
          then: { properties: { value: { $ref: "common.json#/$defs/Target" } } },
          else: { properties: { other: { $ref: "common.json#/$defs/Target" } } },
        },
        found: { type: "array", contains: { $ref: "common.json#/$defs/Target", required: ["en"] } },
      },
      patternProperties: { "^x_": { $ref: "common.json#/$defs/Target" } },
    },
  ];
  const walker = new SchemaWalker(schemas);
  const target = `${base}common.json#/$defs/Target`;

  test("oneOf, prefixItems/items, if/then/else, contains, patternProperties", () => {
    const instance = {
      pick: { en: "a" },
      list: [{ en: "skip" }, { en: "b" }, { en: "c" }],
      tagged: { kind: "b", value: { en: "no" }, other: { en: "d" } },
      found: [{ vi: "x" }, { en: "e" }],
      x_extra: { en: "f" },
    };
    assert.deepEqual(walker.locate(`${base}root.json`, instance, target), ["/pick", "/list/1", "/list/2", "/tagged/other", "/found/1", "/x_extra"]);
  });

  test("applicator chưa hỗ trợ thì báo lỗi, không lặng lẽ bỏ sót", () => {
    const strict = new SchemaWalker([{ $id: `${base}u.json`, type: "object", dependencies: { a: { properties: {} } } }]);
    assert.throws(() => strict.locate(`${base}u.json`, { a: 1 }, target), /dependencies/);
  });
});
