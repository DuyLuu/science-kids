import assert from "node:assert/strict";
import { describe, test } from "node:test";
import { BLANK, normalizeEn } from "../src/normalize/en.ts";
import { cardinal, decade, ordinal, year } from "../src/normalize/numbers-en.ts";
import { collectSpoken } from "../src/spoken.ts";
import { splitAtBlanks } from "../src/tts/utterance.ts";
import { LESSON_FILE, readJson, TOPIC_FILE } from "./helpers.ts";

const read = (text: string) => normalizeEn(text).text;

describe("số nguyên 0–9999", () => {
  const cases: [number, string][] = [
    [0, "zero"],
    [7, "seven"],
    [13, "thirteen"],
    [20, "twenty"],
    [21, "twenty-one"],
    [40, "forty"],
    [99, "ninety-nine"],
    [100, "one hundred"],
    [101, "one hundred and one"],
    [110, "one hundred and ten"],
    [999, "nine hundred and ninety-nine"],
    [1000, "one thousand"],
    [1001, "one thousand and one"],
    [1010, "one thousand and ten"],
    [1100, "one thousand one hundred"],
    [1234, "one thousand two hundred and thirty-four"],
    [2026, "two thousand and twenty-six"],
    [9999, "nine thousand nine hundred and ninety-nine"],
  ];
  for (const [n, words] of cases) test(`${n} -> ${words}`, () => assert.equal(cardinal(n), words));

  test("mọi số 0–9999: chỉ có chữ, không trùng nhau", () => {
    const seen = new Map<string, number>();
    for (let n = 0; n <= 9999; n++) {
      const words = cardinal(n);
      assert.match(words, /^[a-z]+(?:[ -][a-z]+)*$/, `${n} -> ${words}`);
      assert.equal(seen.get(words), undefined, `${n} và ${seen.get(words)} cùng đọc là ${words}`);
      seen.set(words, n);
    }
  });

  test("trong câu", () => {
    assert.equal(read("I have 42 apples."), "I have forty-two apples.");
    assert.equal(read("We need 3 meals and 8 glasses of water."), "We need three meals and eight glasses of water.");
    assert.equal(read("0 and 9999"), "zero and nine thousand nine hundred and ninety-nine");
    assert.equal(read("1,250 grains"), "one thousand two hundred and fifty grains");
    assert.equal(read("Year 3"), "Year three");
    assert.equal(read("a 3-year-old"), "a three-year-old");
    assert.equal(read("5-7 bananas"), "five to seven bananas");
    assert.equal(read("It is -5°C."), "It is minus five degrees Celsius.");
    assert.equal(read("1.5 kg of rice"), "one point five kilograms of rice");
    assert.equal(read("1 kg and 2 kg"), "one kilogram and two kilograms");
    assert.equal(read("50% of it"), "fifty percent of it");
    assert.equal(read("1/2 a cup"), "one half a cup");
    assert.equal(read("at 7:30"), "at seven thirty");
  });

  test("số 4 chữ số không có từ báo năm: đọc số đếm và cảnh báo", () => {
    const result = normalizeEn("It was 1990.");
    assert.equal(result.text, "It was one thousand nine hundred and ninety.");
    assert.deepEqual(result.warnings.map((w) => w.code), ["maybe_year"]);
  });
});

describe("năm", () => {
  const cases: [number, string][] = [
    [1066, "ten sixty-six"],
    [1900, "nineteen hundred"],
    [1905, "nineteen oh five"],
    [1990, "nineteen ninety"],
    [1999, "nineteen ninety-nine"],
    [2000, "two thousand"],
    [2008, "two thousand and eight"],
    [2010, "twenty ten"],
    [2026, "twenty twenty-six"],
  ];
  for (const [n, words] of cases) test(`${n} -> ${words}`, () => assert.equal(year(n), words));

  test("sau từ báo năm, thập niên, trước BC/AD", () => {
    assert.equal(read("In 1990, people ate rice."), "In nineteen ninety, people ate rice.");
    assert.equal(read("since 2026"), "since twenty twenty-six");
    assert.equal(read("from 1905 until 2008"), "from nineteen oh five until two thousand and eight");
    assert.equal(read("the 1990s"), "the nineteen nineties");
    assert.equal(decade(2000), "two thousands");
    assert.equal(read("in 500 BC"), "in five hundred B C");
  });
});

describe("số thứ tự", () => {
  const cases: [number, string][] = [
    [1, "first"],
    [2, "second"],
    [3, "third"],
    [4, "fourth"],
    [5, "fifth"],
    [8, "eighth"],
    [9, "ninth"],
    [11, "eleventh"],
    [12, "twelfth"],
    [20, "twentieth"],
    [21, "twenty-first"],
    [22, "twenty-second"],
    [100, "one hundredth"],
    [101, "one hundred and first"],
  ];
  for (const [n, words] of cases) test(`${n} -> ${words}`, () => assert.equal(ordinal(n), words));

  test("trong câu", () => {
    assert.equal(read("the 1st lesson"), "the first lesson");
    assert.equal(read("my 2nd, 3rd and 4th tries"), "my second, third and fourth tries");
    assert.equal(read("on the 21st day"), "on the twenty-first day");
  });
});

describe("ô trống {1} không đọc thành one", () => {
  test("giữa câu: thành quãng ngắt", () => {
    const text = read("Animals, including humans, need food, water and {1} to live.");
    assert.equal(text, `Animals, including humans, need food, water and ${BLANK} to live.`);
    assert.doesNotMatch(text, /\bone\b|\{|\d/);
  });

  test("cuối câu: bỏ dấu chấm sau ô trống", () => {
    const text = read("Carbohydrates give us {1}.");
    assert.equal(text, `Carbohydrates give us ${BLANK}`);
    assert.doesNotMatch(text, /\bone\b/);
  });

  test("nhiều ô, đầu câu, câu hỏi", () => {
    assert.equal(read("{1} and {2} are foods."), `${BLANK} and ${BLANK} are foods.`);
    assert.equal(read("What gives us {1}?"), `What gives us ${BLANK}?`);
    assert.doesNotMatch(read("{1} {2} {3} {10}"), /one|two|three|ten/);
  });

  test("tách câu tại ô trống để có quãng ngắt thật", () => {
    assert.deepEqual(splitAtBlanks(read("Animals, including humans, need food, water and {1} to live.")), [
      { kind: "speech", text: `Animals, including humans, need food, water and ${BLANK}` },
      { kind: "speech", text: "to live." },
    ]);
    assert.deepEqual(splitAtBlanks(read("Carbohydrates give us {1}.")), [{ kind: "speech", text: `Carbohydrates give us ${BLANK}` }]);
    assert.deepEqual(splitAtBlanks(read("What gives us {1}?")), [{ kind: "speech", text: `What gives us ${BLANK}?` }]);
    const leading = splitAtBlanks(read("{1} is a carbohydrate."));
    assert.equal(leading[0]!.kind, "pause");
    assert.deepEqual(leading[1], { kind: "speech", text: "is a carbohydrate." });
    assert.deepEqual(splitAtBlanks("Great! Your tray is balanced."), [{ kind: "speech", text: "Great! Your tray is balanced." }]);
  });
});

describe("không có gì cần đổi thì giữ nguyên", () => {
  test("câu thường", () => {
    for (const text of ["Great! Your tray is balanced.", "Challenge: spot the mistake", "Is Na right?", "rice", "Vitamins, minerals", "Sweets: just a little"]) {
      assert.deepEqual(normalizeEn(text), { text, warnings: [] });
    }
  });

  test("mọi chuỗi Spoken của bài 1 (trừ 2 câu có ô trống) giữ nguyên, không cảnh báo", () => {
    const all = [...collectSpoken("topic", readJson(TOPIC_FILE)), ...collectSpoken("lesson", readJson(LESSON_FILE))];
    const changed = all.filter(({ node }) => normalizeEn(node.en).text !== node.en).map(({ pointer }) => pointer);
    assert.deepEqual(changed, ["/warmup/0/sentence", "/quiz/1/sentence"]);
    assert.deepEqual(all.flatMap(({ node }) => normalizeEn(node.en).warnings), []);
  });
});

describe("khoảng trắng, ký hiệu, viết tắt", () => {
  test("bỏ khoảng trắng thừa", () => {
    assert.equal(read("  Fish,   eggs \n and tofu . "), "Fish, eggs and tofu.");
    assert.equal(read("Wait... what?"), `Wait${BLANK} what?`);
  });

  test("ký hiệu đọc đầy đủ", () => {
    assert.equal(read("Fish & eggs"), "Fish and eggs");
    assert.equal(read("2 + 3 = 5"), "two plus three equals five");
    assert.equal(read("Eat fruit, e.g. bananas."), "Eat fruit, for example bananas.");
  });

  test("không đọc được thì cảnh báo, không đoán", () => {
    assert.deepEqual(normalizeEn("rice/bread").warnings.map((w) => w.code), ["symbol"]);
    assert.deepEqual(normalizeEn("We need DNA.").warnings.map((w) => w.code), ["acronym"]);
    assert.deepEqual(normalizeEn("Water is H2O.").warnings.map((w) => w.code), ["digits"]);
    assert.deepEqual(normalizeEn("Em khoẻ mạnh").warnings.map((w) => w.code), ["non_english"]);
  });
});
