// Picture shape vs slot (Duy 13/11, SK-043): slot of each Image pointer, ratio table, warning
// threshold, suggested crop, warning text (src/images/aspect.ts), and the check `images fetch`
// runs on the lesson markdown (src/images/aspect-report.ts). build's warning is in build.test.ts.
import assert from "node:assert/strict";
import { cpSync, mkdirSync, mkdtempSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import { after, before, describe, test } from "node:test";
import { selectionShapeWarnings } from "../src/images/aspect-report.ts";
import {
  aspectFactor,
  aspectWarnings,
  aspectWarningText,
  checkSlotTable,
  formatRatio,
  loadSlotTable,
  orientation,
  parseRatio,
  SLOT_KINDS,
  slotOf,
  slotRatio,
  suggestCrop,
  type SlotTable,
} from "../src/images/aspect.ts";
import { ImageCache, type SourceEntry } from "../src/images/cache.ts";
import { creditOf, imageCacheKey, selectionFileFor, type Picked } from "../src/images/selection.ts";
import { CLI_ROOT } from "./helpers.ts";

const TABLE: SlotTable = {
  max_factor: 1.5,
  default: { question: "4:3", choice_2: "2:1", choice_3: "3:1", choice_4: "1:1", order_item: "1:1", bank_item: "1:1", learn_group: "1:1", tray_item: "1:1", vocab: "1:1", reward: "1:1" },
  age_groups: { explorer: { hide_question_image_with_picture_choices: true, ratios: { choice_3: "5:2" } }, discoverer: { max_factor: 2 } },
};

const img = { alt: { en: "a", vi: "a" } };
const LESSON = {
  warmup: [{ key: "w1", format: "single_choice", image: img, options: [{ key: "a", image: img }, { key: "b", image: img }, { key: "c", image: img }] }],
  quiz: [
    { key: "q1", format: "single_choice", image: img, options: [{ key: "a", image: img }, { key: "b" }, { key: "c", image: img }] },
    { key: "q2", format: "true_false", image: img },
    { key: "q3", format: "order_sequence", image: img, items: [{ key: "x", image: img }, { key: "y", image: img }, { key: "z", image: img }] },
    { key: "q4", format: "fill_blank_bank", image: img, bank: [{ key: "m", image: img }] },
    { key: "q5", format: "multi_choice", options: [{ key: "a" }, { key: "b" }, { key: "c" }, { key: "d" }] },
    { key: "q6", format: "single_choice", options: [{ key: "a" }, { key: "b" }] },
  ],
  learn: [{ key: "explore", type: "explore_groups", groups: [{ key: "g", image: img }] }],
  play: { key: "tray", items: [{ key: "t", image: img }] },
  vocab: [{ key: "v", image: img }],
  reward: { collectible: { image: img } },
};

describe("tỉ lệ khung (aspect.ts)", () => {
  test("parseRatio: \"rộng:cao\" hoặc số; sai dạng thì lỗi", () => {
    assert.equal(parseRatio("3:1"), 3);
    assert.equal(parseRatio("4:3"), 4 / 3);
    assert.equal(parseRatio(1.5), 1.5);
    assert.throws(() => parseRatio("3x1"), /sai dạng/);
    assert.throws(() => parseRatio(0), /sai dạng/);
    assert.throws(() => parseRatio("0:1"), /sai dạng/);
  });

  test("formatRatio và orientation: tỉ lệ quen thuộc trong 3%, còn lại số thập phân", () => {
    assert.equal(formatRatio(683 / 1024), "2:3");
    assert.equal(formatRatio(768 / 1024), "3:4");
    assert.equal(formatRatio(1024 / 576), "16:9");
    assert.equal(formatRatio(1024 / 472), "2,17:1");
    assert.equal(orientation(0.75), "dọc");
    assert.equal(orientation(1.05), "vuông");
    assert.equal(orientation(2.5), "ngang");
  });

  test("bảng thật tools/content-cli/image-slots.json hợp lệ, đủ mọi khung", () => {
    const table = loadSlotTable();
    for (const kind of SLOT_KINDS) assert.ok(slotRatio(table, "explorer", kind).ratio > 0, kind);
    assert.ok(table.max_factor > 1);
  });

  test("checkSlotTable: thiếu khung, khung lạ, max_factor ≤ 1 đều báo lỗi", () => {
    const { choice_3: _drop, ...partial } = TABLE.default;
    assert.throws(() => checkSlotTable({ ...TABLE, default: partial as SlotTable["default"] }), /default thiếu khung choice_3/);
    assert.throws(() => checkSlotTable({ ...TABLE, age_groups: { explorer: { ratios: { card: "1:1" } as never } } }), /khung lạ/);
    assert.throws(() => checkSlotTable({ ...TABLE, max_factor: 1 }), /max_factor/);
    assert.throws(() => checkSlotTable({ ...TABLE, max_factors: { vocab: 1 } }), /max_factors\.vocab phải là số > 1/);
    assert.throws(() => checkSlotTable({ ...TABLE, max_factors: { card: 1.5 } as never }), /max_factors\.card: khung lạ/);
    assert.throws(() => checkSlotTable({ ...TABLE, age_groups: { explorer: { max_factors: { vocab: "1.6" as never } } } }), /age_groups\.explorer\.max_factors\.vocab/);
    assert.equal(checkSlotTable(TABLE), TABLE);
  });

  test("slotRatio: nhóm tuổi ghi đè default (tỉ lệ và max_factor)", () => {
    assert.deepEqual(slotRatio(TABLE, "explorer", "choice_3"), { ratio: 2.5, maxFactor: 1.5 });
    assert.deepEqual(slotRatio(TABLE, "discoverer", "choice_3"), { ratio: 3, maxFactor: 2 });
    assert.deepEqual(slotRatio(TABLE, "adventurer", "question"), { ratio: 4 / 3, maxFactor: 1.5 });
  });

  test("slotRatio: max_factors theo khung thắng max_factor; của nhóm tuổi thắng chung (SK-053)", () => {
    const table: SlotTable = { ...TABLE, max_factors: { vocab: 1.6 }, age_groups: { ...TABLE.age_groups, adventurer: { max_factors: { vocab: 1.3 } } } };
    assert.equal(slotRatio(table, "explorer", "vocab").maxFactor, 1.6);
    assert.equal(slotRatio(table, "discoverer", "vocab").maxFactor, 1.6, "nhóm có max_factor 2 vẫn theo ngưỡng riêng của khung");
    assert.equal(slotRatio(table, "discoverer", "choice_3").maxFactor, 2);
    assert.equal(slotRatio(table, "adventurer", "vocab").maxFactor, 1.3);
    assert.equal(slotRatio(table, "adventurer", "question").maxFactor, 1.5);
  });

  test("slotOf: mỗi chỗ dùng hình ra đúng khung", () => {
    const kind = (pointer: string, group = "discoverer") => slotOf(LESSON, pointer, group, TABLE)?.kind;
    assert.equal(kind("/warmup/0/options/1/image"), "choice_3");
    assert.equal(kind("/quiz/0/image"), "question");
    assert.equal(kind("/quiz/0/options/0/image"), "choice_3");
    assert.equal(kind("/quiz/1/image"), "question");
    assert.equal(kind("/quiz/2/items/0/image"), "order_item");
    assert.equal(kind("/quiz/3/bank/0/image"), "bank_item");
    assert.equal(kind("/quiz/4/options/0/image"), "choice_4");
    assert.equal(kind("/quiz/5/options/0/image"), "choice_2");
    assert.equal(kind("/learn/0/groups/0/image"), "learn_group");
    assert.equal(kind("/play/items/0/image"), "tray_item");
    assert.equal(kind("/vocab/0/image"), "vocab");
    assert.equal(kind("/reward/collectible/image"), "reward");
    assert.equal(kind("/cover/image"), undefined);
    assert.equal(slotOf(LESSON, "/quiz/0/options/0/image", "discoverer", TABLE)?.label, "thẻ lựa chọn (3 lựa chọn)");
  });

  test("Explorer: hình câu hỏi ẩn khi mọi lựa chọn/thẻ xếp có hình (không kiểm); thiếu một hình thì vẫn kiểm", () => {
    assert.equal(slotOf(LESSON, "/warmup/0/image", "explorer", TABLE), undefined);
    assert.equal(slotOf(LESSON, "/quiz/2/image", "explorer", TABLE), undefined);
    assert.equal(slotOf(LESSON, "/quiz/0/image", "explorer", TABLE)?.kind, "question");
    assert.equal(slotOf(LESSON, "/quiz/1/image", "explorer", TABLE)?.kind, "question");
    assert.equal(slotOf(LESSON, "/warmup/0/image", "discoverer", TABLE)?.kind, "question");
    // Discoverer A2 (SK-043, 14/11): fill_blank_bank whose every bank word has a picture hides the question picture too.
    assert.equal(slotOf(LESSON, "/quiz/3/image", "explorer", TABLE), undefined);
    assert.equal(slotOf(LESSON, "/quiz/3/image", "discoverer", TABLE)?.kind, "question");
  });

  test("image-slots.json thật: Discoverer theo A2 (Duy 14/11), Explorer giữ bảng designer 13/11", () => {
    const table = loadSlotTable();
    const ratio = (group: string, kind: Parameters<typeof slotRatio>[2]) => slotRatio(table, group, kind).ratio;
    assert.deepEqual(
      { choice_2: ratio("discoverer", "choice_2"), choice_3: ratio("discoverer", "choice_3"), choice_4: ratio("discoverer", "choice_4"), bank_item: ratio("discoverer", "bank_item"), learn_group: ratio("discoverer", "learn_group"), tray_item: ratio("discoverer", "tray_item"), vocab: ratio("discoverer", "vocab") },
      // bank_item 1:1: image-slots.json note, "designer chốt 14/11" (square bank chip of the A2 code).
      { choice_2: 2.5, choice_3: 2.5, choice_4: 0.8, bank_item: 1, learn_group: 1, tray_item: 1, vocab: 4 / 3 },
    );
    assert.equal(table.age_groups?.discoverer?.hide_question_image_with_picture_choices, true);
    // vocab 2:1: Explorer word card 152×76 on iPhone 16 (wordsPage, SK-048 16/11); it fell back to default 1:1 before.
    assert.deepEqual({ choice_2: ratio("explorer", "choice_2"), choice_3: ratio("explorer", "choice_3"), vocab: ratio("explorer", "vocab") }, { choice_2: 1.7, choice_3: 2.5, vocab: 2 });
    assert.equal(formatRatio(0.6), "3:5");
  });

  test("image-slots.json thật: ảnh vuông ở thẻ từ Explorer 2:1 bị cảnh báo, ảnh 4:3 và ảnh đã crop 2:1 thì không (SK-053 19/11)", () => {
    const table = loadSlotTable();
    assert.equal(table.max_factor, 2.2);
    assert.equal(slotRatio(table, "explorer", "vocab").maxFactor, 1.6);
    const lesson = { vocab: [{ key: "a", image: img }, { key: "b", image: img }, { key: "c", image: img }] };
    const refs = [
      { key: "vocab.a", pointer: "/vocab/0/image", size: { width: 1024, height: 1024 } },
      { key: "vocab.b", pointer: "/vocab/1/image", size: { width: 1024, height: 768 } },
      { key: "vocab.c", pointer: "/vocab/2/image", size: { width: 1024, height: 512 } },
    ];
    const warnings = aspectWarnings(lesson, "explorer", refs, table);
    assert.deepEqual(warnings.map((w) => [w.key, w.factor]), [["vocab.a", 2]]);
    assert.match(aspectWarningText("01-vong-doi", warnings[0]!), /thẻ từ vựng.*ảnh 1024×1024 vuông 1:1, khung 2:1 ngang; lệch ×2/);
    // Discoverer vocab 4:3: a square picture is ×1,33, under 1,6.
    assert.deepEqual(aspectWarnings(lesson, "discoverer", refs, table), []);
    // Other slots keep max_factor 2,2: a 2:1 picture on a 1:1 tray item (×2) passes.
    assert.deepEqual(aspectWarnings({ play: { items: [{ key: "t", image: img }] } }, "explorer", [{ key: "tray.t", pointer: "/play/items/0/image", size: { width: 1024, height: 512 } }], table), []);
  });

  test("aspectWarnings: ảnh dọc trong thẻ ngang thì cảnh báo; gần khung thì không; chưa có ảnh thì bỏ qua", () => {
    assert.equal(aspectFactor(683, 1024, 2.5), 2.5 / (683 / 1024));
    const warnings = aspectWarnings(LESSON, "explorer", [
      { key: "q1.a", pointer: "/quiz/0/options/0/image", size: { width: 683, height: 1024 } },
      { key: "q1.c", pointer: "/quiz/0/options/2/image", size: { width: 1024, height: 440 } },
      { key: "tray.t", pointer: "/play/items/0/image", size: { width: 1024, height: 768 } },
      { key: "vocab.v", pointer: "/vocab/0/image" },
      { key: "w1", pointer: "/warmup/0/image", size: { width: 300, height: 1000 } },
    ], TABLE);
    assert.deepEqual(warnings.map((w) => w.key), ["q1.a"]);
    assert.equal(warnings[0]!.slot.kind, "choice_3");
    assert.equal(warnings[0]!.slotRatio, 2.5);
  });

  test("suggestCrop: cắt giữa đúng tỉ lệ khung; có crop sẵn thì nằm trong crop đó; luôn trong ảnh", () => {
    assert.deepEqual(suggestCrop(1000, 1000, 2), { left: 0, top: 0.25, width: 1, height: 0.5 });
    assert.deepEqual(suggestCrop(2000, 1000, 1), { left: 0.25, top: 0, width: 0.5, height: 1 });
    // The processed picture is the right half of the source: the suggestion stays in it.
    assert.deepEqual(suggestCrop(1000, 1000, 2, { left: 0.5, top: 0, width: 0.5, height: 1 }), { left: 0.5, top: 0.25, width: 0.5, height: 0.5 });
    for (const [w, h, r] of [[683, 1024, 2.5], [1024, 333, 1], [777, 1024, 4 / 3]] as const) {
      const crop = suggestCrop(w, h, r, { left: 0.18, top: 0.1, width: 0.64, height: 0.9 });
      assert.ok(crop.left + crop.width <= 1 && crop.top + crop.height <= 1, JSON.stringify(crop));
      assert.ok(crop.left >= 0.18 && crop.top >= 0.1, JSON.stringify(crop));
      // Shape of the result in pixels of the processed picture ≈ slot ratio.
      const shape = ((crop.width / 0.64) * w) / ((crop.height / 0.9) * h);
      assert.ok(Math.abs(shape / r - 1) < 0.02, `${shape} vs ${r}`);
    }
  });

  test("aspectWarningText: tên bài, khoá, tỉ lệ ảnh, tỉ lệ khung, gợi ý crop hoặc đổi ảnh", () => {
    const [warning] = aspectWarnings(LESSON, "explorer", [{ key: "q1.a", pointer: "/quiz/0/options/0/image", size: { width: 683, height: 1024 } }], TABLE);
    const picked = aspectWarningText("04-ca-va-luong-cu", warning!, { kind: "picked", selection: "content/images/x.json", entryKey: "q1.a" });
    assert.match(picked, /^bài 04-ca-va-luong-cu · hình q1\.a \(thẻ lựa chọn \(3 lựa chọn\)\): ảnh 683×1024 dọc 2:3, khung 5:2 ngang; lệch ×3,75: lấp khung thì mất khoảng 73% ảnh/);
    assert.match(picked, /Đặt "crop" trong content\/images\/x\.json mục q1\.a \(gợi ý cắt giữa \{"left":0,"top":0\.367,"width":1,"height":0\.266\}/);
    assert.match(picked, /hoặc chọn ảnh khác\.$/);
    const shared = aspectWarningText("l", warning!, { kind: "picked", selection: "s.json", entryKey: "tray.tray_x" });
    assert.match(shared, /mục tray\.tray_x \(ảnh dùng chung, đổi ở đó là đổi mọi chỗ dùng ảnh này\)/);
    const own = aspectWarningText("l", warning!, { kind: "own", selection: "s.json", entryKey: "q1.a", file: "content/images/own/t/a.jpg" });
    assert.match(own, /Sửa hình tự vẽ content\/images\/own\/t\/a\.jpg theo khung 5:2/);
    assert.match(aspectWarningText("l", warning!), /Đặt crop hoặc chọn ảnh khác\.$/);
  });
});

describe("images fetch: kiểm tỉ lệ trên bài markdown (aspect-report.ts)", () => {
  let root: string;
  const PICK: Picked = {
    source: "Wikimedia Commons",
    source_url: "https://commons.wikimedia.org/wiki/File:Bowl_of_rice.jpg",
    file_url: "https://upload.wikimedia.org/wikipedia/commons/a/a1/Bowl_of_rice.jpg",
    title: "Bowl of rice",
    author: "Example Author A",
    license: "CC BY 4.0",
    license_url: "https://creativecommons.org/licenses/by/4.0/",
  };
  const SQUARE: Picked = { ...PICK, file_url: "https://upload.wikimedia.org/wikipedia/commons/a/a1/Square.jpg", source_url: "https://commons.wikimedia.org/wiki/File:Square.jpg", title: "Square" };
  const put = (cache: ImageCache, pick: Picked, width: number, height: number) => {
    const bytes = Buffer.from(`${pick.file_url}`);
    const entry: SourceEntry = {
      file: `${pick.title.replace(/\W/g, "")}.jpg`,
      sha256: "0".repeat(64),
      bytes: bytes.length,
      width,
      height,
      changes: ["resized"],
      fetched_at: "2026-11-13T00:00:00.000Z",
      credit: creditOf(pick),
      file_url: pick.file_url,
      downloaded_url: pick.file_url,
      original: { width, height, format: "jpeg", bytes: bytes.length },
      verified: { via: ["test"], license: pick.license, author_at_source: pick.author, at: "2026-11-13T00:00:00.000Z", notes: [] },
    };
    cache.put(imageCacheKey(pick), entry, bytes);
  };

  before(() => {
    root = mkdtempSync(path.join(tmpdir(), "content-cli-aspect-"));
    cpSync(path.join(CLI_ROOT, "test", "fixtures", "markdown", "valid"), path.join(root, "content"), { recursive: true });
  });
  after(() => rmSync(root, { recursive: true, force: true }));

  test("ảnh dọc ở thẻ 3 lựa chọn: cảnh báo, ghi file .md của bài; cùng ảnh dùng lại ở câu 6 lựa chọn (khung 1:1) và ảnh vuông ở kệ Chơi: không", () => {
    const selection = selectionFileFor(path.join(root, "content", "images"), "discoverer", "an-uong-lanh-manh", "thuc-an-cho-ta-nhung-gi");
    mkdirSync(path.dirname(selection), { recursive: true });
    writeFileSync(selection, JSON.stringify({ images: { "q1.q1_rice": PICK, "q5.q5_rice": { same_as: "q1.q1_rice" }, "tray.tray_rice": SQUARE } }, null, 2));
    const cache = new ImageCache(path.join(root, "image-cache"));
    put(cache, PICK, 683, 1024);
    put(cache, SQUARE, 1024, 1024);
    const report = selectionShapeWarnings([selection], cache, (file) => path.relative(root, file), TABLE);
    assert.deepEqual(report.skipped, []);
    // q5 has 6 options: khung 1:1, 683×1024 lệch ×1,5 ≤ max_factor 2 of TABLE.discoverer.
    assert.equal(report.lines.length, 1, report.lines.join("\n"));
    assert.deepEqual([...report.byTopic], [["an-uong-lanh-manh", 1]]);
    assert.match(report.lines[0]!, /^content\/discoverer\/an-uong-lanh-manh\/01-thuc-an-cho-ta-nhung-gi\.md bài 01-thuc-an-cho-ta-nhung-gi · hình q1\.q1_rice /);
    assert.match(report.lines[0]!, /ảnh 683×1024 dọc 2:3, khung 3:1 ngang/);
    // Tighter table: the reuse in q5 warns too and points at the entry that holds the picture.
    const strict = selectionShapeWarnings([selection], cache, (file) => path.relative(root, file), { ...TABLE, max_factor: 1.4, age_groups: {} });
    assert.equal(strict.lines.length, 2, strict.lines.join("\n"));
    assert.match(strict.lines[1]!, /hình q5\.q5_rice \(thẻ lựa chọn \(6 lựa chọn\)\).*mục q1\.q1_rice \(ảnh dùng chung, đổi ở đó là đổi mọi chỗ dùng ảnh này\)/);
  });

  test("không có markdown cạnh thư mục ảnh (bản chép, test của fetch): bỏ qua, không lỗi", () => {
    const other = mkdtempSync(path.join(tmpdir(), "content-cli-aspect-none-"));
    try {
      const selection = selectionFileFor(path.join(other, "images"), "discoverer", "an-uong-lanh-manh", "thuc-an-cho-ta-nhung-gi");
      mkdirSync(path.dirname(selection), { recursive: true });
      writeFileSync(selection, JSON.stringify({ images: { "q1.q1_rice": PICK } }));
      const report = selectionShapeWarnings([selection], new ImageCache(path.join(other, "cache")), (file) => file, TABLE);
      assert.deepEqual(report, { lines: [], byTopic: new Map(), skipped: [] });
    } finally {
      rmSync(other, { recursive: true, force: true });
    }
  });
});
