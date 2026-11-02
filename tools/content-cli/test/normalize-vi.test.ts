// VI normaliser (SK-024). Cases from content/tts-vi/listening-set.md "Ghi chú cho dev: luật đọc"
// and the (chữ gốc, bản đọc mong đợi) pairs of A18–A28, B23–B30: the expected reading with its
// hyphens replaced by spaces (listening-set C1.3) is exactly what the engine must get.
import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import { mkdtempSync, readFileSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import { describe, test } from "node:test";
import { encodeM4a, M4A_ENCODING, M4A_ENCODING_ZERO_TIMES, wavFromFloat } from "../src/audio.ts";
import { cacheKey } from "../src/cache.ts";
import { BLANK } from "../src/normalize/en.ts";
import { cardinalVi, fractionVi, ordinalVi } from "../src/normalize/numbers-vi.ts";
import { isVietnameseSyllable, normalizeVi, placeTone } from "../src/normalize/vi.ts";
import { collectSpoken } from "../src/spoken.ts";
import type { Pcm, Synthesizer } from "../src/tts/engine.ts";
import { BLANK_STRATEGY, blankStrategy, splitAtBlanks, speak } from "../src/tts/utterance.ts";
import { LESSON_FILE, readJson, TOPIC_FILE } from "./helpers.ts";

const read = (text: string) => normalizeVi(text).text;
const codes = (text: string) => normalizeVi(text).warnings.map((w) => w.code);
const SOUTH = { numbers: { zeroTens: "lẻ", thousand: "ngàn", fourAfterTens: "tư" }, toneStyle: "new" } as const;

describe("số đếm 0–9999", () => {
  const cases: [number, string][] = [
    [0, "không"],
    [1, "một"],
    [5, "năm"],
    [10, "mười"],
    [11, "mười một"],
    [14, "mười bốn"],
    [15, "mười lăm"],
    [20, "hai mươi"],
    [21, "hai mươi mốt"],
    [24, "hai mươi bốn"],
    [25, "hai mươi lăm"],
    [71, "bảy mươi mốt"],
    [100, "một trăm"],
    [105, "một trăm linh năm"],
    [110, "một trăm mười"],
    [111, "một trăm mười một"],
    [206, "hai trăm linh sáu"],
    [215, "hai trăm mười lăm"],
    [1000, "một nghìn"],
    [1005, "một nghìn không trăm linh năm"],
    [1010, "một nghìn không trăm mười"],
    [1835, "một nghìn tám trăm ba mươi lăm"],
    [2026, "hai nghìn không trăm hai mươi sáu"],
    [9999, "chín nghìn chín trăm chín mươi chín"],
  ];
  for (const [n, words] of cases) test(`${n} -> ${words}`, () => assert.equal(cardinalVi(n), words));

  test("tuỳ chọn giọng Nam: lẻ, ngàn, tư", () => {
    assert.equal(cardinalVi(206, SOUTH.numbers), "hai trăm lẻ sáu");
    assert.equal(cardinalVi(1000, SOUTH.numbers), "một ngàn");
    assert.equal(cardinalVi(24, SOUTH.numbers), "hai mươi tư");
    assert.equal(cardinalVi(14, SOUTH.numbers), "mười bốn", "14 luôn là mười bốn");
    assert.equal(normalizeVi("có 206 chiếc", SOUTH).text, "có hai trăm lẻ sáu chiếc");
  });

  test("mọi số 0–9999: chỉ có chữ, không trùng nhau, không có 'mươi một' hay 'mươi năm'", () => {
    const seen = new Map<string, number>();
    for (let n = 0; n <= 9999; n++) {
      const words = cardinalVi(n);
      assert.match(words, /^[\p{L}]+(?: [\p{L}]+)*$/u, `${n} -> ${words}`);
      assert.doesNotMatch(words, /mươi một|mươi năm|mười năm/, `${n} -> ${words}`);
      assert.equal(seen.get(words), undefined, `${n} và ${seen.get(words)} cùng đọc là ${words}`);
      seen.set(words, n);
    }
  });

  test("trong câu", () => {
    assert.equal(read("Em có 3 quả cam."), "Em có ba quả cam.");
    assert.equal(read("0 và 9999"), "không và chín nghìn chín trăm chín mươi chín");
    assert.equal(read("Mã 007"), "Mã không không bảy");
    assert.equal(read("Nhiệt độ -5 °C"), "Nhiệt độ âm năm độ xê");
  });
});

describe("dấu phân cách kiểu Việt", () => {
  test("dấu chấm ngăn hàng nghìn, dấu phẩy thập phân", () => {
    assert.equal(read("1.000 bạn"), "một nghìn bạn");
    assert.equal(read("12.345 hạt"), "mười hai nghìn ba trăm bốn mươi lăm hạt");
    assert.equal(read("2,5 kg"), "hai phẩy năm ki lô gam");
    assert.equal(read("3,14"), "ba phẩy mười bốn");
    assert.equal(read("1,05"), "một phẩy không năm");
  });
  test("số viết kiểu Anh: cảnh báo, không tự đoán", () => {
    assert.equal(read("1,000 hạt"), "1,000 hạt");
    assert.equal(read("2.5 lít"), "2.5 lít");
    assert.ok(codes("1,000 hạt").includes("number_format"));
    assert.ok(codes("2.5 lít").includes("number_format"));
  });
});

describe("năm, số thứ tự, tháng, phân số, phần trăm, khoảng", () => {
  test("năm đọc như số đếm", () => assert.equal(read("Năm 1835, ông đi."), "Năm một nghìn tám trăm ba mươi lăm, ông đi."));
  test("số thứ tự", () => {
    assert.equal(ordinalVi(1), "nhất");
    assert.equal(ordinalVi(4), "tư");
    assert.equal(read("câu thứ 1, lần thứ 4, bài thứ 2"), "câu thứ nhất, lần thứ tư, bài thứ hai");
  });
  test("tháng 4 là tháng tư", () => assert.equal(read("từ tháng 4 đến tháng 11"), "từ tháng tư đến tháng mười một"));
  test("phân số không đọc 'trên'", () => {
    assert.equal(fractionVi(3, 4), "ba phần tư");
    assert.equal(read("gần 3/4 bề mặt"), "gần ba phần tư bề mặt");
    assert.equal(read("1/2 cốc"), "một phần hai cốc");
    assert.equal(read("2/3 số bạn"), "hai phần ba số bạn");
    assert.ok(codes("gần 3/4").includes("maybe_date"), "3/4 cũng có thể là ngày: cảnh báo");
  });
  test("phần trăm", () => {
    assert.equal(read("71% bề mặt"), "bảy mươi mốt phần trăm bề mặt");
    assert.equal(read("2,5%"), "hai phẩy năm phần trăm");
  });
  test("khoảng số", () => assert.equal(read("5–7 tuổi"), "năm đến bảy tuổi"));
});

describe("đơn vị (chỉ sau số)", () => {
  const cases: [string, string][] = [
    ["12 cm", "mười hai xăng ti mét"],
    ["1 kg", "một ki lô gam"],
    ["500 g", "năm trăm gam"],
    ["3 m", "ba mét"],
    ["2 km", "hai ki lô mét"],
    ["1 l", "một lít"],
    ["250 ml", "hai trăm năm mươi mi li lít"],
    ["5 mm", "năm mi li mét"],
    ["100 °C", "một trăm độ xê"],
    ["0°C", "không độ xê"],
  ];
  for (const [input, words] of cases) test(`${input} -> ${words}`, () => assert.equal(read(input), words));
  test("chữ Việt bắt đầu bằng m, g, l sau số không bị coi là đơn vị", () => {
    assert.equal(read("5 mét"), "năm mét");
    assert.equal(read("3 gà và 2 lá"), "ba gà và hai lá");
  });
});

describe("ô trống, ký hiệu, dấu thanh", () => {
  test("{1} không đọc thành 'một'", () => {
    assert.equal(read("Động vật, kể cả con người, cần thức ăn, nước và {1} để sống."), `Động vật, kể cả con người, cần thức ăn, nước và ${BLANK} để sống.`);
    assert.equal(read("Chất bột đường cho ta {1}."), `Chất bột đường cho ta ${BLANK}`);
    assert.doesNotMatch(read("Cơm cho ta {1} và {2}."), /\bmột\b|\bhai\b/);
    assert.deepEqual(splitAtBlanks(read("nước và {1} để sống.")), [
      { kind: "speech", text: `nước và ${BLANK}` },
      { kind: "speech", text: "để sống." },
    ]);
  });
  test("gạch ngang thành dấu phẩy, ngoặc thành hai dấu phẩy, dấu hai chấm giữ nguyên", () => {
    assert.equal(read("Mâm đầy rồi — chạm món trong mâm để bỏ ra."), "Mâm đầy rồi, chạm món trong mâm để bỏ ra.");
    assert.equal(read("Từ mới: nutrient – chất dinh dưỡng."), "Từ mới: nutrient, chất dinh dưỡng.");
    assert.equal(read("Nòng nọc (con non của ếch) sống dưới nước."), "Nòng nọc, con non của ếch, sống dưới nước.");
    assert.equal(read("Đồ ngọt: nên ăn ít"), "Đồ ngọt: nên ăn ít");
  });
  test("vị trí dấu thanh thống nhất kiểu mới (như bài 1)", () => {
    assert.equal(read("khỏe mạnh"), "khoẻ mạnh");
    assert.equal(read("hòa học, hóa học, thủy tinh"), "hoà học, hoá học, thuỷ tinh");
    assert.equal(read("khoẻ mạnh"), "khoẻ mạnh");
    for (const word of ["quý", "hoàng", "thuyền", "khuya", "toán", "Hoà", "KHỎE"]) assert.equal(placeTone(word, "new"), word === "KHỎE" ? "KHOẺ" : word);
    assert.equal(placeTone("khoẻ", "old"), "khỏe", "tuỳ chọn kiểu cũ");
  });
  test("khoảng trắng thừa", () => assert.equal(read("  Cơm   và  cá  . "), "Cơm và cá."));
});

describe("viết tắt, công thức, từ mượn", () => {
  test("bảng viết tắt, chữ in hoa lạ thì cảnh báo", () => {
    assert.equal(read("Ở TP.HCM trời mưa."), "Ở Thành phố Hồ Chí Minh trời mưa.");
    assert.ok(codes("Đọc SGK nhé").includes("acronym"));
  });
  test("bảng đọc ép: vitamin đọc kiểu Việt, giữ chữ hoa đầu", () => {
    assert.equal(read("Vitamin và chất khoáng giúp ta khoẻ mạnh."), "Vi ta min và chất khoáng giúp ta khoẻ mạnh.");
    assert.equal(read("Quả cam có vitamin."), "Quả cam có vi ta min.");
    assert.deepEqual(codes("Quả cam có vitamin."), []);
  });
  test("từ không theo âm tiết tiếng Việt thì cảnh báo", () => {
    assert.ok(codes("Từ mới: nutrient").includes("loanword"));
    assert.equal(isVietnameseSyllable("nghiêng"), true);
    assert.equal(isVietnameseSyllable("khuya"), true);
    assert.equal(isVietnameseSyllable("gì"), true);
    assert.equal(isVietnameseSyllable("vitamin"), false);
  });
});

describe("cặp chữ gốc → bản đọc mong đợi của listening-set (A18–A28, B23–B30)", () => {
  const spaced = (expected: string) => expected.replace(/(?<=\p{L})-(?=\p{L})/gu, " ");
  const pairs: [string, string, string][] = [
    ["A18", "Bộ xương của người lớn có 206 chiếc xương.", "Bộ xương của người lớn có hai trăm linh sáu chiếc xương."],
    ["A19", "Tuần này, cây đậu của em cao 12 cm, cao hơn tuần trước 2,5 cm.", "Tuần này, cây đậu của em cao mười hai xăng-ti-mét, cao hơn tuần trước hai phẩy năm xăng-ti-mét."],
    ["A20", "Nước có 3 thể: rắn, lỏng và khí. Nước sôi ở 100 °C và đóng băng ở 0 °C.", "Nước có ba thể: rắn, lỏng và khí. Nước sôi ở một trăm độ xê và đóng băng ở không độ xê."],
    ["A21", "Chai nước này chứa 1.000 ml, tức là 1 lít. Nước trong chai nặng khoảng 1 kg.", "Chai nước này chứa một nghìn mi-li-lít, tức là một lít. Nước trong chai nặng khoảng một ki-lô-gam."],
    ["A22", "Nước phủ khoảng 71% bề mặt Trái Đất, tức là gần 3/4.", "Nước phủ khoảng bảy mươi mốt phần trăm bề mặt Trái Đất, tức là gần ba phần tư."],
    ["A23", "Ở TP.HCM, mùa mưa thường kéo dài từ tháng 5 đến tháng 11.", "Ở Thành phố Hồ Chí Minh, mùa mưa thường kéo dài từ tháng năm đến tháng mười một."],
    ["A24", "Năm 1835, Charles Darwin đến quần đảo Galápagos và quan sát những con rùa khổng lồ ở đó.", "Năm một nghìn tám trăm ba mươi lăm, Sác-lơ Đác-uyn đến quần đảo Ga-la-pa-gốt và quan sát những con rùa khổng lồ ở đó."],
    ["A25", "Khi quang hợp, cây dùng H₂O và CO₂ để làm ra thức ăn, rồi thải ra khí oxy.", "Khi quang hợp, cây dùng hát hai ô và xê ô hai để làm ra thức ăn, rồi thải ra khí ô-xi."],
    ["A26", "Chất đạm còn gọi là protein, chất bột đường còn gọi là carbohydrate.", "Chất đạm còn gọi là prô-tê-in, chất bột đường còn gọi là các-bô-hi-đrát."],
    ["A27", "Nòng nọc (con non của ếch) sống dưới nước và thở bằng mang.", "Nòng nọc, con non của ếch, sống dưới nước và thở bằng mang."],
    ["A28", "Từ mới: nutrient – chất dinh dưỡng.", "Từ mới: nutrient, chất dinh dưỡng."],
    ["B23", "oxy", "ô-xi"],
    ["B24", "CO₂", "xê ô hai"],
    ["B25", "H₂O", "hát hai ô"],
    ["B26", "protein", "prô-tê-in"],
    ["B27", "carbohydrate", "các-bô-hi-đrát"],
    ["B28", "Isaac Newton", "Ai-dắc Niu-tơn"],
    ["B29", "5–7 tuổi", "năm đến bảy tuổi"],
    ["B30", "câu thứ 1, lần thứ 4", "câu thứ nhất, lần thứ tư"],
  ];
  for (const [id, source, expected] of pairs) test(`${id}: ${source}`, () => assert.equal(read(source), spaced(expected)));
});

describe("chuỗi VI của bài 1", () => {
  const spoken = [TOPIC_FILE, LESSON_FILE].flatMap((file) => {
    const doc = readJson(file);
    return collectSpoken(doc.kind, doc).map(({ pointer, node }) => ({ pointer, vi: node.vi }));
  });

  test("128 chuỗi; chỉ chuỗi có ô trống, gạch ngang hay 'vitamin' bị đổi", () => {
    assert.equal(spoken.length, 128);
    const changed = spoken.filter(({ vi }) => read(vi) !== vi);
    for (const { pointer, vi } of changed) {
      assert.match(vi, /\{\d\}|—|[Vv]itamin/, `${pointer}: "${vi}" -> "${read(vi)}"`);
    }
    const kept = spoken.filter(({ vi }) => !/\{\d\}|—|[Vv]itamin/.test(vi));
    for (const { pointer, vi } of kept) assert.equal(read(vi), vi, pointer);
    // 2 blanks, 2 dashes, 10 strings with "vitamin"; /reward/collectible/fact has both a dash and "vitamin".
    assert.equal(changed.length, 2 + 2 + 10 - 1);
  });

  test("không cảnh báo nào (vitamin đã có trong bảng đọc ép)", () => {
    const warned = spoken.flatMap(({ pointer, vi }) => normalizeVi(vi).warnings.map((w) => `${pointer} ${w.code}`));
    assert.deepEqual(warned, []);
  });
});

describe("khoá cache VI và mã hoá", () => {
  const base = { lang: "en" as const, text: "rice", engine: { model: "m" }, blank: BLANK_STRATEGY, encoding: M4A_ENCODING };

  test("variant 0 hay không có: khoá EN y như trước SK-024", () => {
    assert.equal(cacheKey({ ...base, variant: 0 }), cacheKey(base));
    assert.equal(cacheKey({ ...base, variant: undefined }), cacheKey(base));
    assert.deepEqual(blankStrategy(undefined), BLANK_STRATEGY);
  });

  test("seed variant, quãng ngắt ô trống, cách mã hoá đều vào khoá", () => {
    const vi = { ...base, lang: "vi" as const, text: "Kẹo", encoding: M4A_ENCODING_ZERO_TIMES, blank: blankStrategy(800) };
    const key = cacheKey(vi);
    assert.notEqual(cacheKey({ ...vi, variant: 1 }), key);
    assert.notEqual(cacheKey({ ...vi, variant: 2 }), cacheKey({ ...vi, variant: 1 }));
    assert.notEqual(cacheKey({ ...vi, blank: BLANK_STRATEGY }), key);
    assert.notEqual(cacheKey({ ...vi, encoding: M4A_ENCODING }), key);
  });

  test("mã hoá xoá ngày giờ: cùng PCM ra cùng bytes", { skip: spawnSync("afconvert", ["-h"]).error ? "cần afconvert (macOS)" : false }, async () => {
    const dir = mkdtempSync(path.join(tmpdir(), "vi-zero-times-"));
    try {
      const samples = new Float32Array(48000).map((_, i) => 0.3 * Math.sin(i / 20));
      writeFileSync(path.join(dir, "a.wav"), wavFromFloat(samples, 48000));
      await encodeM4a(path.join(dir, "a.wav"), path.join(dir, "1.m4a"), { zeroTimes: true });
      await new Promise((resolve) => setTimeout(resolve, 1100)); // afconvert stamps whole seconds
      await encodeM4a(path.join(dir, "a.wav"), path.join(dir, "2.m4a"), { zeroTimes: true });
      await encodeM4a(path.join(dir, "a.wav"), path.join(dir, "3.m4a"));
      assert.deepEqual(readFileSync(path.join(dir, "1.m4a")), readFileSync(path.join(dir, "2.m4a")));
      assert.notDeepEqual(readFileSync(path.join(dir, "1.m4a")), readFileSync(path.join(dir, "3.m4a")));
    } finally {
      rmSync(dir, { recursive: true, force: true });
    }
  });
});

describe("ô trống với giọng VI: đệm cho đủ quãng ngắt", () => {
  test("lặng cuối đoạn trước + đệm + lặng đầu đoạn sau = 800 ms", async () => {
    const sr = 1000;
    const part = (leadMs: number, speechMs: number, trailMs: number) =>
      new Float32Array(leadMs + speechMs + trailMs).map((_, i) => (i >= leadMs && i < leadMs + speechMs ? 0.5 : 0));
    const fake: Synthesizer = {
      async synthesize(text): Promise<Pcm> {
        return { samples: text.endsWith(BLANK) ? part(50, 300, 150) : part(60, 200, 100), sampleRate: sr };
      },
      async dispose() {},
    };
    const pcm = await speak(fake, `nước và ${BLANK} để sống.`, { blankPauseMs: 800 });
    // 500 (part 1) + pad 800-150-60 = 590 + 360 (part 2)
    assert.equal(pcm.samples.length, 500 + 590 + 360);
    const kokoroLike = await speak(fake, `nước và ${BLANK} để sống.`);
    assert.equal(kokoroLike.samples.length, 500 + 360, "không có blankPauseMs: nối thẳng như EN");
  });
});
