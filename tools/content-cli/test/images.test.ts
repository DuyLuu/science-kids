// SK-033: picture pipeline. Image keys and brief keywords (src/images/slots.ts), the image rules
// of validate (age-rules.ts), licence rule (license.ts), selection files (selection.ts), network
// helpers (net.ts), source parsing (sources.ts), `images search` and `images fetch` with a fake
// HTTP function (fixtures in test/fixtures/images/; nothing here touches the network), and the
// sharp processing. build with pictures is in build.test.ts.
import assert from "node:assert/strict";
import { cpSync, existsSync, mkdirSync, mkdtempSync, readFileSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import { after, before, describe, mock, test } from "node:test";
import sharp from "sharp";
import { sha256Bytes } from "../src/audio.ts";
import { loadRules } from "../src/build/rules.ts";
import { ImageCache, type ComposedEntry, type OwnEntry, type SourceEntry } from "../src/images/cache.ts";
import { runImagesFetch } from "../src/images/fetch.ts";
import { CC0_URL, classifyCommons, classifyOpenverse, commonsTitle, creditAuthor, licenseRank, normalizeUrl, plainText, PDM_URL, strictestLicense, UNKNOWN_AUTHOR } from "../src/images/license.ts";
import { DailyQuota, JsonCache, MAX_RETRY_WAIT_MS, politeHttp, retryAfterMs, retryWaitMs, Throttle, type Http, type HttpResponse } from "../src/images/net.ts";
import { cropRect, processImage } from "../src/images/process.ts";
import { pickCandidates, runImagesSearch, selectionEntry, type CandidatesFile } from "../src/images/search.ts";
import {
  checkSelection,
  COMPOSED_AUTHOR,
  composedCacheKey,
  composedCredit,
  composedFilePath,
  creditOf,
  findKey,
  imageCacheKey,
  localImagePath,
  OWN_AUTHOR,
  ownCacheKey,
  ownCredit,
  partCredit,
  resolvePicked,
  selectionFileFor,
  SelectionSet,
  type Own,
  type Picked,
  type ResolvedComposed,
  type ResolvedOwn,
} from "../src/images/selection.ts";
import { briefKeywords, composedPartSearches, composedReuses, crossReuse, imageKeyOf, imageRefs, isComposedBrief, isOwnBrief, isReuseBrief, parseReuse, reuseTarget } from "../src/images/slots.ts";
import { commonsDownloadUrl, commonsFileInfoUrl, commonsSearchUrl, openverseCategory, openverseDetailUrl, openverseSearchUrl, parseCommonsSearch, parseOpenverseSearch, type Candidate } from "../src/images/sources.ts";
import { DEFAULT_RULES_FILE } from "../src/paths.ts";
import { checkAgeRules, type AgeDoc, type Issue } from "../src/validate/age-rules.ts";
import { CLI_ROOT, LESSON_FILE, readJson, TOPIC_FILE } from "./helpers.ts";

const FIXTURES = path.join(CLI_ROOT, "test", "fixtures", "images");
const COMMONS_SEARCH = JSON.parse(readFileSync(path.join(FIXTURES, "commons-search.json"), "utf8"));
const OPENVERSE_SEARCH = JSON.parse(readFileSync(path.join(FIXTURES, "openverse-search.json"), "utf8"));
const MD_FIXTURE = path.join(CLI_ROOT, "test", "fixtures", "markdown", "valid");
const noSleep = async () => {};

// ---------- fake HTTP ----------

const jsonResponse = (url: string, body: unknown, status = 200): HttpResponse => ({
  ok: status >= 200 && status < 300,
  status,
  url,
  headers: { get: (name) => (name.toLowerCase() === "content-type" ? "application/json" : null) },
  json: async () => structuredClone(body),
  arrayBuffer: async () => new ArrayBuffer(0),
});
const imageResponse = (url: string, bytes: Buffer, type = "image/jpeg"): HttpResponse => ({
  ok: true,
  status: 200,
  url,
  headers: { get: (name) => (name.toLowerCase() === "content-type" ? type : name.toLowerCase() === "content-length" ? String(bytes.length) : null) },
  json: async () => {
    throw new Error("không phải JSON");
  },
  arrayBuffer: async () => bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength) as ArrayBuffer,
});
/** An error answer (429, 503, 404…), optionally with a Retry-After header. */
const statusResponse = (url: string, status: number, retryAfter?: string): HttpResponse => ({
  ...jsonResponse(url, { error: status }, status),
  headers: { get: (name) => (name.toLowerCase() === "retry-after" ? (retryAfter ?? null) : null) },
});
/** Every request is recorded; an unexpected URL fails the test (no network, ever). */
function fakeHttp(handler: (url: string) => HttpResponse | undefined): { http: Http; calls: string[] } {
  const calls: string[] = [];
  const http: Http = async (url, init) => {
    calls.push(url);
    assert.match(init.headers["User-Agent"]!, /^ScienceKidsContentCLI\//);
    const response = handler(url);
    if (!response) throw new Error(`request không mong đợi: ${url}`);
    return response;
  };
  return { http, calls };
}
/** Runs with console.log silenced; returns the printed lines. */
async function quiet<T>(run: () => Promise<T>): Promise<{ result: T; out: string }> {
  const lines: string[] = [];
  const log = mock.method(console, "log", (...args: unknown[]) => lines.push(args.join(" ")));
  const error = mock.method(console, "error", (...args: unknown[]) => lines.push(args.join(" ")));
  try {
    return { result: await run(), out: lines.join("\n") };
  } finally {
    log.mock.restore();
    error.mock.restore();
  }
}

// ---------- image keys, brief keywords ----------

describe("khoá hình và từ khoá trong brief", () => {
  test("khoá = chuỗi key từ gốc tới hình; learn, vocab, reward có tiền tố; không trùng trong bài", () => {
    const lesson = readJson(LESSON_FILE);
    const refs = imageRefs("lesson", lesson);
    const byPointer = Object.fromEntries(refs.map((ref) => [ref.pointer, ref.key]));
    assert.equal(byPointer["/warmup/1/image"], "w2");
    assert.equal(byPointer["/learn/0/groups/0/image"], "learn.explore.explore_carb");
    assert.equal(byPointer["/play/items/1/image"], "tray.tray_bread");
    assert.equal(byPointer["/quiz/0/options/1/image"], "q1.q1_rice");
    assert.equal(byPointer["/quiz/2/image"], "q3");
    assert.equal(byPointer["/vocab/2/image"], "vocab.protein");
    assert.equal(byPointer["/reward/collectible/image"], "reward.rau_muong");
    assert.equal(new Set(refs.map((ref) => ref.key)).size, refs.length);
    for (const ref of refs) assert.match(ref.key, /^[a-z0-9_]+(\.[a-z0-9_]+)*$/);
  });

  test("bank, bar của biểu đồ, mảng không có key", () => {
    const doc = { quiz: [{ key: "q2", bank: [{ key: "q2_air", image: {} }], chart: { bars: [{ key: "bar_a", image: {} }] } }], extra: [{ image: {} }] };
    assert.deepEqual(imageKeyOf(doc, "/quiz/0/bank/0/image"), { key: "q2.q2_air", owner: "q2_air" });
    assert.deepEqual(imageKeyOf(doc, "/quiz/0/chart/bars/0/image"), { key: "q2.bar_a", owner: "bar_a" });
    assert.deepEqual(imageKeyOf(doc, "/extra/0/image"), { key: "extra.0", owner: undefined });
  });

  test("briefKeywords: cuối dòng brief, khoá/khóa, hoa thường, tách theo ;, cụm dài có dấu phẩy thì tách cả dấu phẩy", () => {
    assert.deepEqual(briefKeywords("[ảnh] Một cái ao nhỏ ở làng quê. Từ khoá tìm ảnh (EN): pond village lotus leaves"), ["pond village lotus leaves"]);
    assert.deepEqual(briefKeywords("Biển xanh. Từ khoá tìm ảnh (EN): blue sea horizon; fishing boat, calm sea."), ["blue sea horizon", "fishing boat, calm sea"]);
    assert.deepEqual(
      briefKeywords("x. Từ khoá tìm ảnh (EN): fossil formation stages illustration, bones buried sediment layers cross section, palaeontologist brushing fossil bone in rock"),
      ["fossil formation stages illustration", "bones buried sediment layers cross section", "palaeontologist brushing fossil bone in rock"],
    );
    assert.deepEqual(briefKeywords("x. Từ khoá tìm ảnh (EN): pond\ndòng sau không đọc"), ["pond"]);
    assert.deepEqual(briefKeywords("x. từ khóa tìm ảnh (en):   T. rex skeleton museum"), ["T. rex skeleton museum"]);
    assert.deepEqual(briefKeywords("x. TỪ KHOÁ TÌM ẢNH (EN) : pond"), ["pond"]);
    // NFD input (macOS file names, some editors) is read the same.
    assert.deepEqual(briefKeywords("x. Từ khoá tìm ảnh (EN): lake".normalize("NFD")), ["lake"]);
    assert.equal(briefKeywords("Biển xanh, không có chữ"), undefined);
    assert.equal(briefKeywords("x. Từ khoá tìm ảnh (EN): ;"), undefined);
    assert.equal(briefKeywords(undefined), undefined);
  });

  test("brief dùng lại theo TEMPLATE: `<key>`, `<key>` ở bài `<chủ đề>/<bài>`, `<bài>/<key>`, ở bài một; bỏ phần từ khoá chép theo", () => {
    const refs = imageRefs("lesson", readJson(LESSON_FILE));
    const here = { topic: "an-uong-lanh-manh", slug: "thuc-an-cho-ta-nhung-gi", order: 1 };
    assert.deepEqual(parseReuse("Dùng lại hình `tray_rice`. Từ khoá tìm ảnh (EN): bowl of rice `q9`"), { tokens: ["tray_rice"] });
    assert.equal(reuseTarget("Dùng lại hình `tray_rice`.", refs, "q1.q1_rice", here), "tray.tray_rice");
    assert.equal(reuseTarget("Dùng lại hình `tray.tray_rice`.", refs, "q1.q1_rice", here), "tray.tray_rice");
    assert.equal(reuseTarget("Dùng lại hình `q3`.", refs, "vocab.fibre", here), "q3");
    assert.deepEqual(parseReuse("Dùng lại hình `tray_sea` ở bài `be-mat-trai-dat/01-dat-va-nuoc-tren-trai-dat`."), { tokens: ["tray_sea"], lesson: { topic: "be-mat-trai-dat", slug: "dat-va-nuoc-tren-trai-dat" } });
    assert.deepEqual(parseReuse("[ảnh] Dùng lại hình `03-hoa-thach-ke-chuyen-khung-long/tray_rock_print`"), { tokens: ["tray_rock_print"], lesson: { slug: "hoa-thach-ke-chuyen-khung-long" } });
    assert.deepEqual(parseReuse("Dùng lại hình bát cơm của món tray_rice ở bài một"), { tokens: ["tray_rice"], lesson: { order: 1 } });
    // "ở bài một" from lesson 1 is this lesson; from lesson 2 it is another one.
    assert.equal(crossReuse("Dùng lại hình bát cơm của món tray_rice ở bài một", here), undefined);
    assert.equal(reuseTarget("Dùng lại hình bát cơm của món tray_rice ở bài một", refs, "q1.q1_rice", here), "tray.tray_rice");
    assert.deepEqual(crossReuse("Dùng lại hình bát cơm của món tray_rice ở bài một", { ...here, order: 2, slug: "mam-com-can-bang" })?.lesson, { order: 1 });
    assert.equal(reuseTarget("Dùng lại hình `tray_sea` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`.", refs, "q1.q1_rice", here), undefined);
    assert.ok(crossReuse("Dùng lại hình `tray_sea` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`.", here));
    assert.equal(parseReuse("Biển xanh"), undefined);
  });

  test("brief dùng lại kiểu cũ: tìm key được nêu (ưu tiên token có _), bỏ qua chính nó", () => {
    const refs = imageRefs("lesson", readJson(LESSON_FILE));
    assert.equal(isReuseBrief("Dùng lại hình bát cơm của món tray_rice"), true);
    assert.equal(isReuseBrief("Dùng lại hình `tray_rice`.".normalize("NFD")), true);
    assert.equal(isReuseBrief("[ảnh] Dùng lại hình kẹo"), true);
    assert.equal(isReuseBrief("Không dùng lại"), false);
    assert.equal(reuseTarget("Dùng lại hình bát cơm của món tray_rice", refs, "q1.q1_rice"), "tray.tray_rice");
    assert.equal(reuseTarget("Dùng lại hình của nhóm explore_carb", refs, "vocab.carbohydrate"), "learn.explore.explore_carb");
    assert.equal(reuseTarget("Dùng lại hình của món tray_ricee", refs, "q1.q1_rice"), undefined);
    assert.equal(reuseTarget("Bát cơm của món tray_rice", refs, "q1.q1_rice"), undefined);
    assert.equal(reuseTarget("Dùng lại hình của q1_rice", refs, "q1.q1_rice"), undefined);
  });

  test("brief ghép: nhãn có chữ ghép hoặc mở đầu bằng Ghép; mảnh ghép xếp hình, câu nhắc tới hình ghép khác thì không", () => {
    assert.equal(isComposedBrief("[sơ đồ ghép ảnh] Bên trái là sơ đồ gốc của bài"), true);
    assert.equal(isComposedBrief("[Ảnh ghép] Hai con vật chung một cảnh".normalize("NFD")), true);
    assert.equal(isComposedBrief("Ghép hình `tray_rice` cạnh `tray_egg`"), true);
    assert.equal(isComposedBrief("[sơ đồ] Hình ghép mặt cắt với quả trứng"), true);
    assert.equal(isComposedBrief("[sơ đồ ghép ảnh] Dùng lại hình `tray_rice` và `tray_egg`, đặt cạnh nhau"), true);
    assert.equal(isComposedBrief("[ảnh] Một mảnh ghép xếp hình nằm cạnh bộ xếp hình đang ghép dở. Từ khoá tìm ảnh (EN): puzzle piece"), false);
    assert.equal(isComposedBrief("[ảnh] Trứng hoá thạch, vì thẻ thưởng bài bốn ghép ảnh này cạnh quả dừa. Từ khoá tìm ảnh (EN): egg fossil"), false);
    assert.equal(isComposedBrief("[sơ đồ] Sơ đồ khối mặt cắt vỏ Trái Đất"), false);
    assert.equal(isComposedBrief("Dùng lại hình `tray_rice`."), false);
    assert.equal(isComposedBrief(undefined), false);
  });

  test("brief ghép: mỗi truy vấn của Từ khoá tìm ảnh là một ảnh cần tìm; Từ khoá cho <phần>: … thêm một phần có tên", () => {
    // Trái Đất bài năm, explore_plates.
    assert.deepEqual(
      composedPartSearches("[sơ đồ ghép ảnh] Bên trái: quả trứng luộc nứt vỏ. Bên phải: Trái Đất có ranh giới mảng. Từ khoá cho hình Trái Đất: tectonic plates globe Atlantic. Từ khoá tìm ảnh (EN): boiled egg cracked shell"),
      [{ queries: ["boiled egg cracked shell"] }, { name: "hình Trái Đất", queries: ["tectonic plates globe Atlantic"] }],
    );
    // Khủng long bài hai, explore_reptiles: two pictures to find.
    assert.deepEqual(composedPartSearches("[sơ đồ ghép ảnh] Kỳ đà cạnh bộ xương. Từ khoá tìm ảnh (EN): monitor lizard front view sprawling legs; sauropod skeleton front view museum"), [
      { queries: ["monitor lizard front view sprawling legs"] },
      { queries: ["sauropod skeleton front view museum"] },
    ]);
    assert.deepEqual(composedPartSearches("Ghép hai ảnh. Từ khóa cho quả dừa: green coconut; coconut isolated"), [{ name: "quả dừa", queries: ["green coconut", "coconut isolated"] }]);
    assert.deepEqual(composedPartSearches("[sơ đồ ghép ảnh] Dùng lại hình `tray_rice` và `tray_egg`"), []);
    assert.deepEqual(composedPartSearches(undefined), []);
  });

  test("brief hình tự vẽ (dev 10/11): nhãn [hình vẽ], [hình tự vẽ], [tự vẽ]; nhãn khác, chữ không trong ngoặc, brief ghép thì không", () => {
    for (const brief of ["[hình vẽ] Quả địa cầu nhựa trên bàn học, nền trơn", "[Hình tự vẽ] Tay quay quả địa cầu", "  [ tự vẽ ] Bình nước", "[hình vẽ] Quả địa cầu".normalize("NFD")]) {
      assert.equal(isOwnBrief(brief), true, brief);
    }
    for (const brief of ["[ảnh] Quả địa cầu. Từ khoá tìm ảnh (EN): globe", "[tranh] Cá", "[hình vẽ ghép] Hai hình", "[sơ đồ ghép ảnh] Ghép hình vẽ", "Hình vẽ quả địa cầu", "[hình vẽ minh hoạ] x", undefined]) {
      assert.equal(isOwnBrief(brief), false, String(brief));
    }
    assert.equal(openverseCategory("[hình vẽ] Quả địa cầu"), undefined, "hình tự vẽ không tìm");
  });

  test("brief ghép: hình dùng lại là key trong backtick của bài này, `<bài>/<key>`, `<chủ đề>/<bài>/<key>`, `<key>` ở bài `<chủ đề>/<bài>`", () => {
    const refs = imageRefs("lesson", readJson(LESSON_FILE));
    const here = { topic: "an-uong-lanh-manh", slug: "thuc-an-cho-ta-nhung-gi", order: 1 };
    const brief =
      "[sơ đồ ghép ảnh] Bát cơm (dùng lại hình `tray_rice`) cạnh trứng `tray.tray_egg` và đậu phụ `02-mam-com-can-bang/q4_tofu`; " +
      "vỏ trứng `be-mat-trai-dat/ben-trong-trai-dat/tray_eggshell`; cá `q9_fish` ở bài `an-uong-lanh-manh/mam-com-can-bang`; " +
      "cá kho `thuc-an-cho-ta-nhung-gi/tray_fish`, `limit`, `Không phải key`, `explore_carb`, lại `tray_rice`. Từ khoá tìm ảnh (EN): coconut `tray_banana`";
    assert.deepEqual(
      composedReuses(brief, refs, "learn.explore.explore_carb", here).map((reuse) => reuse.part),
      [
        { same_as: "tray.tray_rice" },
        { same_as: "tray.tray_egg" },
        { same_as: "q4_tofu", lesson: "an-uong-lanh-manh/mam-com-can-bang" },
        { same_as: "tray_eggshell", lesson: "be-mat-trai-dat/ben-trong-trai-dat" },
        { same_as: "q9_fish", lesson: "an-uong-lanh-manh/mam-com-can-bang" },
        { same_as: "tray.tray_fish" },
      ],
    );
    assert.deepEqual(composedReuses(brief, refs, "learn.explore.explore_carb", here)[2], { token: "02-mam-com-can-bang/q4_tofu", part: { same_as: "q4_tofu", lesson: "an-uong-lanh-manh/mam-com-can-bang" }, of: "an-uong-lanh-manh/mam-com-can-bang q4_tofu" });
    assert.deepEqual(composedReuses("[sơ đồ ghép ảnh] Hai ảnh mới. Từ khoá tìm ảnh (EN): a; b", refs, "q1", here), []);
    // q1_rice reuses tray_rice: named in tray_rice's own brief it is not a part ("… `q1_rice` dùng lại").
    assert.deepEqual(composedReuses("[sơ đồ ghép ảnh] Bát cơm, câu `q1_rice` dùng lại hình này. Từ khoá tìm ảnh (EN): rice", refs, "tray.tray_rice", here), []);
  });
});

// ---------- validate: image rules ----------

describe("luật hình của validate (SK-033)", () => {
  const { rules } = loadRules(DEFAULT_RULES_FILE);
  const docs = (): (AgeDoc & { data: any })[] => [
    { display: "topic.json", data: readJson(TOPIC_FILE) },
    { display: "lesson.json", data: readJson(LESSON_FILE) },
  ];
  const run = (input = docs(), withRules = rules!) => checkAgeRules(input, withRules, { minAppVersion: "0.1.0", mode: "validate", rulesDisplay: "rules.json" });
  const of = (issues: Issue[], code: string) => issues.filter((issue) => issue.code === code).map((issue) => issue.pointer);

  test("rules.json: mọi nhóm có image_expected và image_search_keywords", () => {
    for (const group of ["explorer", "discoverer", "scientist"] as const) {
      const authoring = rules![group]!.authoring as Record<string, unknown>;
      assert.deepEqual(authoring.image_expected, ["question", "choice_option", "sequence_item", "bank_word", "tray_item"]);
      assert.equal(authoring.image_search_keywords, true);
    }
  });

  test("bài 1 Discoverer: image_missing ở mọi câu, lựa chọn, thẻ từ thiếu hình; chỉ cảnh báo, không lỗi", () => {
    const lesson = docs()[1]!.data;
    const issues = run();
    assert.deepEqual(issues.filter((issue) => issue.severity === "error"), []);
    const expected: string[] = [];
    for (const section of ["warmup", "quiz"] as const) {
      lesson[section].forEach((item: any, i: number) => {
        if (!item.image) expected.push(`/${section}/${i}`);
        for (const field of ["options", "bank"]) item[field]?.forEach((entry: any, j: number) => !entry.image && expected.push(`/${section}/${i}/${field}/${j}`));
      });
    }
    lesson.play.items.forEach((item: any, j: number) => !item.image && expected.push(`/play/items/${j}`));
    assert.ok(expected.length > 10);
    assert.deepEqual(of(issues, "image_missing").sort(), expected.sort());
    for (const issue of issues.filter((entry) => entry.code === "image_missing")) assert.equal(issue.severity, "warning");
    // SK-047 (15/11): the q2 bank words have pictures; the warm-up w1 bank words still do not.
    const bankWord = issues.find((issue) => issue.pointer === "/warmup/0/bank/0")!;
    assert.match(bankWord.message, /^thẻ từ w1_\w+ thiếu image; nhóm discoverer cần mọi thẻ từ trong ngân hàng có hình \(SK-033\)$/);
    assert.match(issues.find((issue) => issue.pointer === "/quiz/0")!.message, /^câu q1 thiếu image \(hình minh hoạ câu hỏi\)/);
  });

  test("image_brief_keywords: brief thiếu từ khoá thì cảnh báo; brief dùng lại có key thì không; dùng lại sai key thì có", () => {
    const input = docs();
    const lesson = input[1]!.data;
    lesson.play.items[1].image.brief += ". Từ khoá tìm ảnh (EN): banh mi bread roll";
    lesson.quiz[0].options[2].image.brief = "Dùng lại hình kẹo của món tray_candyy";
    delete lesson.vocab[0].image.brief;
    const issues = run(input);
    const pointers = of(issues, "image_brief_keywords");
    const refs = imageRefs("lesson", lesson);
    assert.ok(!pointers.includes("/play/items/1/image/brief"), "có từ khoá");
    assert.ok(!pointers.includes("/quiz/0/options/1/image/brief"), "dùng lại tray_rice");
    assert.ok(pointers.includes("/quiz/0/options/2/image/brief"), "dùng lại key sai");
    assert.ok(pointers.includes("/vocab/0/image"), "không có brief");
    assert.ok(pointers.includes("/play/items/0/image/brief"));
    // SK-047 (15/11): q2_air and q2_sunlight reuse pictures of other lessons ("… ở bài `<chủ đề>/<bài>`"): no warning either.
    const here = { topic: "an-uong-lanh-manh", slug: String(lesson.slug), order: Number(lesson.order) };
    assert.ok(!pointers.includes("/quiz/1/bank/1/image/brief"), "dùng lại hình bài khác");
    const reuseOk = refs.filter((ref) => isReuseBrief(ref.image.brief) && (crossReuse(ref.image.brief, here) !== undefined || reuseTarget(ref.image.brief, refs, ref.key) !== undefined)).length;
    assert.equal(pointers.length, refs.length - 1 - reuseOk);
    assert.match(issues.find((issue) => issue.pointer === "/play/items/0/image/brief")!.message, /brief của hình tray\.tray_rice thiếu "Từ khoá tìm ảnh \(EN\): …"/);
  });

  test("brief ghép: có từ khoá, có Từ khoá cho …, hay nêu hình dùng lại thì không cảnh báo; không có gì thì một dòng riêng", () => {
    const input = docs();
    const items = input[1]!.data.play.items;
    items[0].image.brief = "[sơ đồ ghép ảnh] Bát cơm cạnh quả dừa. Từ khoá tìm ảnh (EN): coconut; rice bowl";
    items[1].image.brief = "[sơ đồ ghép ảnh] Dùng lại hình `tray_rice` và `tray_egg`, đặt cạnh nhau, không có chữ";
    items[2].image.brief = "[sơ đồ ghép ảnh] Trứng nứt cạnh Trái Đất. Từ khoá cho hình Trái Đất: globe Atlantic plates.";
    items[3].image.brief = "Ghép hình đậu phụ (`mam-com-can-bang/q4_tofu`) với bát cơm";
    items[4].image.brief = "[sơ đồ ghép ảnh] Hai hình cạnh nhau trên nền trơn, không có chữ";
    items[5].image.brief = "[sơ đồ ghép ảnh] Ghép `tray_ricee` với `khong_co`";
    const issues = run(input);
    const pointers = of(issues, "image_brief_keywords");
    for (const i of [0, 1, 2, 3]) assert.ok(!pointers.includes(`/play/items/${i}/image/brief`), `món ${i}`);
    assert.ok(pointers.includes("/play/items/4/image/brief"));
    assert.ok(pointers.includes("/play/items/5/image/brief"), "key gõ sai: không phải hình dùng lại");
    assert.match(issues.find((issue) => issue.pointer === "/play/items/4/image/brief")!.message, /^brief ghép của hình tray\.\w+ không có "Từ khoá tìm ảnh \(EN\): …" cho ảnh cần tìm và không nêu hình dùng lại nào/);
    assert.equal(issues.find((issue) => issue.pointer === "/play/items/4/image/brief")!.severity, "warning");
  });

  test("brief hình tự vẽ [hình vẽ]: không cần từ khoá tìm ảnh, không cảnh báo; nhãn vẽ trên brief dùng lại vẫn kiểm như brief dùng lại", () => {
    const input = docs();
    const items = input[1]!.data.play.items;
    items[0].image.brief = "[hình vẽ] Quả địa cầu nhựa trên bàn học, nền trơn, không có chữ";
    items[1].image.brief = "[tự vẽ] Bình nước";
    items[2].image.brief = "[hình vẽ] Dùng lại hình `tray_ricee`.";
    const pointers = of(run(input), "image_brief_keywords");
    assert.ok(!pointers.includes("/play/items/0/image/brief"));
    assert.ok(!pointers.includes("/play/items/1/image/brief"));
    assert.ok(pointers.includes("/play/items/2/image/brief"), "brief dùng lại sai key vẫn bị bắt");
    assert.ok(pointers.includes("/play/items/3/image/brief"), "brief thường thiếu từ khoá vẫn cảnh báo");
  });

  test("chỗ có trong image_required là lỗi age_image_required (một dòng mỗi chỗ); không có khoá SK-033 thì không kiểm", () => {
    const strict = structuredClone(rules!);
    strict.discoverer!.authoring = { ...(strict.discoverer!.authoring as object), image_required: ["bank_word", "tray_item", "question"] };
    const issues = run(docs(), strict);
    const errors = issues.filter((issue) => issue.severity === "error");
    assert.ok(errors.length > 0);
    for (const error of errors) assert.equal(error.code, "age_image_required");
    assert.ok(errors.some((error) => error.pointer === "/warmup/0/bank/0" && /bắt buộc mọi thẻ từ trong ngân hàng có hình$/.test(error.message)));
    assert.ok(errors.some((error) => error.pointer === "/quiz/0" && /^câu q1 thiếu image \(hình minh hoạ câu hỏi\); nhóm discoverer bắt buộc/.test(error.message)));
    // Options are still only expected: warnings.
    assert.ok(issues.some((issue) => issue.code === "image_missing" && /\/options\/\d+$/.test(issue.pointer)));
    const pointers = issues.filter((issue) => issue.code === "age_image_required" || issue.code === "image_missing").map((issue) => issue.pointer);
    assert.equal(new Set(pointers).size, pointers.length, "một dòng mỗi chỗ");

    const none = structuredClone(rules!);
    delete (none.discoverer!.authoring as Record<string, unknown>).image_expected;
    delete (none.discoverer!.authoring as Record<string, unknown>).image_search_keywords;
    assert.deepEqual(run(docs(), none).filter((issue) => issue.code.startsWith("image_")), []);
  });

  test("Explorer: true_false thiếu hình là lỗi (image_required), không kèm image_missing ở cùng chỗ", () => {
    const input = docs();
    input[0]!.data.age_group = "explorer";
    const issues = run(input);
    const tf = input[1]!.data.quiz.findIndex((item: any) => item.format === "true_false");
    const here = issues.filter((issue) => issue.pointer === `/quiz/${tf}`);
    assert.deepEqual(here.map((issue) => issue.code), ["age_image_required"]);
    assert.match(here[0]!.message, /^câu true_false q\d thiếu image \(hình vật được nói tới\); nhóm explorer bắt buộc câu đúng\/sai có hình$/);
  });
});

// ---------- licence rule ----------

describe("quy tắc giấy phép", () => {
  const page = "https://commons.wikimedia.org/wiki/File:X.jpg";
  test("Commons: nhận CC0, public domain, PDM, CC BY; loại BY-SA, NC, ND, GFDL, nhãn lạ, hạn chế, NonFree", () => {
    assert.deepEqual(classifyCommons({ LicenseShortName: "CC0", License: "cc0" }, page), { ok: true, kind: "cc0", license: "CC0 1.0", license_url: CC0_URL });
    assert.deepEqual(classifyCommons({ LicenseShortName: "Public domain", License: "pd" }, page), { ok: true, kind: "pd", license: "Public domain", license_url: page });
    assert.deepEqual(classifyCommons({ LicenseShortName: "Public Domain Mark", License: "pdm" }, page), { ok: true, kind: "pdm", license: "PDM 1.0", license_url: PDM_URL });
    assert.deepEqual(classifyCommons({ LicenseShortName: "CC BY 4.0", License: "cc-by-4.0", LicenseUrl: "//creativecommons.org/licenses/by/4.0" }, page), {
      ok: true,
      kind: "by",
      license: "CC BY 4.0",
      license_url: "https://creativecommons.org/licenses/by/4.0",
    });
    assert.deepEqual(classifyCommons({ LicenseShortName: "CC BY 3.0 de", License: "cc-by-3.0-de" }, page), { ok: true, kind: "by", license: "CC BY 3.0 de", license_url: "https://creativecommons.org/licenses/by/3.0/de/" });
    for (const [short, code] of [
      ["CC BY-SA 4.0", "cc-by-sa-4.0"],
      ["CC BY-NC 2.0", "cc-by-nc-2.0"],
      ["CC BY-ND 2.0", "cc-by-nd-2.0"],
      ["GFDL", "gfdl"],
      ["Attribution", "attribution"],
      ["No restrictions", ""],
      ["Copyrighted free use", ""],
      ["", ""],
    ]) {
      const verdict = classifyCommons({ LicenseShortName: short, License: code }, page);
      assert.equal(verdict.ok, false, `${short} phải bị loại`);
    }
    assert.match((classifyCommons({ LicenseShortName: "CC0", License: "cc0", Restrictions: "personality|trademarked" }, page) as { reason: string }).reason, /hạn chế "personality\|trademarked"/);
    assert.equal(classifyCommons({ LicenseShortName: "CC0", License: "cc0", NonFree: "true" }, page).ok, false);
  });

  test("Openverse: cc0, pdm, by có phiên bản; loại by-sa, nc, nd, mature, by không rõ phiên bản", () => {
    assert.deepEqual(classifyOpenverse({ license: "cc0", license_version: "1.0" }), { ok: true, kind: "cc0", license: "CC0 1.0", license_url: CC0_URL });
    assert.deepEqual(classifyOpenverse({ license: "pdm", license_version: "1.0" }), { ok: true, kind: "pdm", license: "PDM 1.0", license_url: PDM_URL });
    assert.deepEqual(classifyOpenverse({ license: "by", license_version: "2.0", license_url: "http://creativecommons.org/licenses/by/2.0/" }), { ok: true, kind: "by", license: "CC BY 2.0", license_url: "https://creativecommons.org/licenses/by/2.0/" });
    for (const license of ["by-sa", "by-nc", "by-nd", "by-nc-sa", "sampling+", ""]) assert.equal(classifyOpenverse({ license, license_version: "2.0" }).ok, false, license);
    assert.equal(classifyOpenverse({ license: "by", license_version: "" }).ok, false);
    assert.equal(classifyOpenverse({ license: "cc0", license_version: "1.0", mature: true }).ok, false);
  });

  test("tác giả: HTML thành chữ; CC BY không có tác giả thì không nhận; CC0 không có thì Unknown", () => {
    assert.equal(plainText('<bdi><a href="//x">Nguyễn&nbsp;Văn&#32;A</a> &amp; B</bdi>'), "Nguyễn Văn A & B");
    assert.equal(plainText("x".repeat(300)).length, 200);
    // Commons artwork template: visible title, then hidden Wikidata lines.
    assert.equal(
      plainText('<div class="fn"><i>Fishing Boats <span class="noprint"><a href="x"><img alt="Edit"></a></span></i></div><div style="display: none;">title QS:P1476,en:"Fishing Boats <span>x</span>"</div><div style="display: none;">label QS:Lnl,"Vissersboten"</div>'),
      "Fishing Boats",
    );
    assert.equal(plainText('Sea view title QS:P1476,en:"Sea view'), "Sea view");
    assert.equal(creditAuthor("", "by"), undefined);
    assert.equal(creditAuthor(null, "cc0"), UNKNOWN_AUTHOR);
    assert.equal(creditAuthor("<i>NASA</i>", "pd"), "NASA");
  });

  test("normalizeUrl, commonsTitle", () => {
    assert.equal(normalizeUrl("//Creativecommons.org/licenses/by/4.0/"), "https://creativecommons.org/licenses/by/4.0");
    assert.equal(normalizeUrl("http://example.org/a"), normalizeUrl("https://example.org/a/"));
    assert.equal(commonsTitle("https://commons.wikimedia.org/wiki/File:Ha_Long_Bay_%281%29.jpg"), "File:Ha Long Bay (1).jpg");
    assert.equal(commonsTitle("https://en.wikipedia.org/wiki/File:X.jpg"), undefined);
    assert.equal(commonsTitle("https://commons.wikimedia.org/wiki/Category:X"), undefined);
  });

  test("hình ghép: giấy phép chặt nhất (CC BY > Science Kids > public domain > PDM > CC0), phần đầu tiên khi bằng nhau", () => {
    const part = (license: string, license_url: string) => ({ license, license_url });
    assert.deepEqual([licenseRank("CC BY 2.0"), licenseRank("CC BY 3.0 de"), licenseRank("Science Kids"), licenseRank("Public domain"), licenseRank("PDM 1.0"), licenseRank("CC0 1.0")], [4, 4, 3, 2, 1, 0]);
    // An own picture (dev 10/11) as a part: the composed picture is Science Kids' unless a part is CC BY.
    assert.deepEqual(strictestLicense([part("CC0 1.0", CC0_URL), part("Science Kids", ""), part("Public domain", "https://commons.wikimedia.org/wiki/File:A.jpg")]), part("Science Kids", ""));
    assert.deepEqual(strictestLicense([part("Science Kids", ""), part("CC BY 4.0", "https://creativecommons.org/licenses/by/4.0/")]), part("CC BY 4.0", "https://creativecommons.org/licenses/by/4.0/"));
    assert.deepEqual(strictestLicense([part("CC0 1.0", CC0_URL)]), part("CC0 1.0", CC0_URL));
    assert.deepEqual(strictestLicense([part("CC0 1.0", CC0_URL), part("PDM 1.0", PDM_URL), part("Public domain", "https://commons.wikimedia.org/wiki/File:A.jpg")]), part("Public domain", "https://commons.wikimedia.org/wiki/File:A.jpg"));
    assert.deepEqual(
      strictestLicense([part("CC0 1.0", CC0_URL), part("CC BY 2.0", "https://creativecommons.org/licenses/by/2.0/"), part("CC BY 4.0", "https://creativecommons.org/licenses/by/4.0/")]),
      part("CC BY 2.0", "https://creativecommons.org/licenses/by/2.0/"),
    );
    assert.throws(() => strictestLicense([]));
  });
});

// ---------- selection file ----------

const COMMONS_PICK: Picked = {
  source: "Wikimedia Commons",
  source_url: "https://commons.wikimedia.org/wiki/File:Blue_sea_horizon.jpg",
  file_url: "https://upload.wikimedia.org/wikipedia/commons/a/a1/Blue_sea_horizon.jpg",
  title: "Blue sea horizon",
  author: "Example Author A",
  license: "CC0 1.0",
  license_url: CC0_URL,
};
const FLICKR_PICK: Picked = {
  source: "Openverse/Flickr",
  openverse_id: "22222222-2222-4222-8222-222222222222",
  source_url: "https://www.flickr.com/photos/example/9002",
  file_url: "https://live.staticflickr.com/65535/9002_abc_b.jpg",
  title: "River & boat",
  author: "Example Photographer 2",
  license: "CC BY 2.0",
  license_url: "https://creativecommons.org/licenses/by/2.0/",
};

describe("file chọn ảnh", () => {
  const errorsOf = (images: Record<string, unknown>, extra: Record<string, unknown> = {}) => checkSelection({ images, ...extra }).errors;
  test("hợp lệ: Commons, Openverse, same_as, crop, note; resolvePicked theo same_as", () => {
    const data = { note: "Duy duyệt 9/11", images: { "tray.tray_sea": { ...COMMONS_PICK, crop: { left: 0.1, top: 0, width: 0.9, height: 1 } }, "q1.q1_sea": { same_as: "tray.tray_sea" }, "tray.tray_river": FLICKR_PICK } };
    const { selection, errors } = checkSelection(data);
    assert.deepEqual(errors, []);
    assert.deepEqual(resolvePicked(selection!, "q1.q1_sea"), { picked: data.images["tray.tray_sea"], via: "tray.tray_sea" });
    assert.equal(resolvePicked(selection!, "q9"), undefined);
  });

  test("lỗi có pointer: thiếu openverse_id, openverse_id ở Commons, giấy phép ngoài quy tắc, http, khoá lạ, Commons ngoài commons.wikimedia.org", () => {
    const at = (errors: { pointer: string; message: string }[]) => errors.map((error) => error.pointer);
    const { openverse_id: _id, ...noId } = FLICKR_PICK;
    assert.ok(at(errorsOf({ a: noId })).includes("/images/a"));
    assert.ok(at(errorsOf({ a: { ...COMMONS_PICK, openverse_id: FLICKR_PICK.openverse_id } })).includes("/images/a"));
    assert.ok(at(errorsOf({ a: { ...COMMONS_PICK, license: "CC BY-SA 4.0" } })).includes("/images/a/license"));
    assert.ok(at(errorsOf({ a: { ...COMMONS_PICK, license: "CC BY-NC 2.0" } })).includes("/images/a/license"));
    assert.ok(at(errorsOf({ a: { ...COMMONS_PICK, license_url: "http://creativecommons.org/publicdomain/zero/1.0/" } })).includes("/images/a/license_url"));
    assert.ok(at(errorsOf({ a: { ...COMMONS_PICK, photographer: "x" } })).includes("/images/a"));
    assert.ok(at(errorsOf({ a: { ...COMMONS_PICK, source_url: "https://example.org/wiki/File:X.jpg" } })).includes("/images/a/source_url"));
    assert.ok(at(errorsOf({ a: { ...COMMONS_PICK, author: " " } })).includes("/images/a/author"));
    assert.ok(at(errorsOf({ "Q1 Bad": COMMONS_PICK })).length > 0);
    assert.ok(at(errorsOf({ a: COMMONS_PICK }, { lesson: "x" })).includes(""));
  });

  test("same_as theo key như brief viết (phần cuối khoá); same_as có lesson không kiểm trong file", () => {
    const images = { "tray.tray_sea": COMMONS_PICK, q3: FLICKR_PICK, "q3.q3_sea": { same_as: "tray_sea" } };
    assert.equal(findKey(images, "tray_sea"), "tray.tray_sea");
    assert.equal(findKey(images, "q3"), "q3");
    assert.equal(findKey(images, "nothing"), undefined);
    const { selection, errors } = checkSelection({ images: { ...images, "q4.q4_sea": { same_as: "tray_sea", lesson: "be-mat-trai-dat/dat-va-nuoc-tren-trai-dat" } } });
    assert.deepEqual(errors, []);
    assert.deepEqual(resolvePicked(selection!, "q3.q3_sea"), { picked: COMMONS_PICK, via: "tray.tray_sea" });
    assert.equal(resolvePicked(selection!, "q4.q4_sea"), undefined);
    assert.ok(checkSelection({ images: { a: { same_as: "x", lesson: "Bad Lesson" } } }).errors.some((error) => error.pointer === "/images/a/lesson"));
  });

  test("SelectionSet: same_as sang file chọn ảnh của bài khác (bỏ nn- ở tên bài), báo lỗi rõ khi thiếu", () => {
    const dir = mkdtempSync(path.join(tmpdir(), "content-cli-selset-"));
    try {
      const fileA = selectionFileFor(dir, "discoverer", "be-mat-trai-dat", "dat-va-nuoc-tren-trai-dat");
      mkdirSync(path.dirname(fileA), { recursive: true });
      writeFileSync(fileA, JSON.stringify({ images: { "tray.tray_sea": COMMONS_PICK, "q1.q1_sea": { same_as: "tray.tray_sea" }, "q9.q9_x": { same_as: "x", lesson: "a/b" } } }));
      const set = new SelectionSet(dir);
      const here = { images: { w1: { same_as: "q1_sea", lesson: "be-mat-trai-dat/01-dat-va-nuoc-tren-trai-dat" }, w2: { same_as: "tray_sea", lesson: "be-mat-trai-dat/khong-co" }, w3: { same_as: "nothing", lesson: "be-mat-trai-dat/dat-va-nuoc-tren-trai-dat" }, w4: { same_as: "q9_x", lesson: "be-mat-trai-dat/dat-va-nuoc-tren-trai-dat" } } };
      const selection = checkSelection(here).selection!;
      assert.deepEqual(set.resolve(selection, "w1", "discoverer"), { picked: COMMONS_PICK, via: "be-mat-trai-dat/01-dat-va-nuoc-tren-trai-dat tray.tray_sea" });
      assert.match((set.resolve(selection, "w2", "discoverer") as { error: string }).error, /chưa có .*khong-co\.json/);
      assert.match((set.resolve(selection, "w3", "discoverer") as { error: string }).error, /không có khoá "nothing"/);
      assert.match((set.resolve(selection, "w4", "discoverer") as { error: string }).error, /lại dùng lại ảnh của bài khác/);
      assert.equal(set.resolve(selection, "w9", "discoverer"), undefined);
    } finally {
      rmSync(dir, { recursive: true, force: true });
    }
  });

  test("crop vượt khỏi hình, same_as tới khoá không có / tới same_as khác / tới chính nó", () => {
    assert.deepEqual(errorsOf({ a: { ...COMMONS_PICK, crop: { left: 0.5, top: 0.2, width: 0.6, height: 0.8 } } }), [{ pointer: "/images/a/crop", message: "left + width = 1.1 > 1" }]);
    assert.deepEqual(errorsOf({ a: { same_as: "b" } }), [{ pointer: "/images/a/same_as", message: 'không có khoá "b" trong file này' }]);
    assert.match(errorsOf({ a: COMMONS_PICK, b: { same_as: "a" }, c: { same_as: "b" } })[0]!.message, /"b" cũng là same_as; trỏ thẳng tới mục có ảnh \("a"\)/);
    assert.deepEqual(errorsOf({ a: { same_as: "a" } }), [{ pointer: "/images/a/same_as", message: "same_as trỏ vào chính nó" }]);
  });

  test("đường dẫn file chọn ảnh; khoá cache đổi theo file và crop, không theo tên hay tác giả", () => {
    assert.equal(selectionFileFor("/r", "discoverer", "be-mat-trai-dat", "dat-va-nuoc-tren-trai-dat"), path.join("/r", "discoverer", "be-mat-trai-dat", "dat-va-nuoc-tren-trai-dat.json"));
    assert.equal(selectionFileFor("/r", "discoverer", "be-mat-trai-dat"), path.join("/r", "discoverer", "be-mat-trai-dat", "_topic.json"));
    const key = imageCacheKey(COMMONS_PICK);
    assert.match(key, /^[0-9a-f]{64}$/);
    const renamed: Picked = { ...COMMONS_PICK, title: "other", author: "other" };
    assert.equal(imageCacheKey(renamed), key);
    assert.notEqual(imageCacheKey({ ...COMMONS_PICK, crop: { left: 0, top: 0, width: 0.5, height: 1 } }), key);
    assert.notEqual(imageCacheKey({ ...COMMONS_PICK, file_url: `${COMMONS_PICK.file_url}?x` }), key);
  });

  const COMPOSED = (parts: unknown[], extra: Record<string, unknown> = {}) => ({ composed: { file: "content/images/composed/be-mat-trai-dat/sea-river.jpg", parts }, title: "Sea and river", ...extra });

  test("hình ghép hợp lệ: parts là ảnh nguồn đầy đủ hoặc same_as (cùng file, bài khác); same_as tới hình ghép được", () => {
    const { selection, errors } = checkSelection({
      images: {
        "tray.tray_sea": COMMONS_PICK,
        "learn.explore.sea_river": COMPOSED([FLICKR_PICK, { same_as: "tray_sea" }, { same_as: "q1", lesson: "be-mat-trai-dat/dat-va-nuoc-tren-trai-dat", note: "x" }], { note: "đã xoá nhãn" }),
        q2: { same_as: "sea_river" },
        q3: COMPOSED([{ same_as: "sea_river" }]),
      },
    });
    assert.deepEqual(errors, []);
    assert.equal(resolvePicked(selection!, "learn.explore.sea_river"), undefined, "resolvePicked chỉ trả ảnh nguồn");
    assert.equal(composedFilePath("/r/content/images", "content/images/composed/t/a.jpg"), path.join("/r/content/images", "composed", "t", "a.jpg"));
    assert.throws(() => composedFilePath("/r", "other/x.jpg"));
  });

  test("hình ghép sai: có pointer (thiếu title, parts rỗng, file ngoài content/images/composed, part sai giấy phép, part trỏ sai, crop)", () => {
    const at = (images: Record<string, unknown>) => errorsOf(images).map((error) => `${error.pointer} ${error.message}`);
    const has = (images: Record<string, unknown>, pointer: string, message?: RegExp) => {
      const lines = at(images);
      assert.ok(lines.some((line) => line.startsWith(`${pointer} `) && (!message || message.test(line))), `${pointer}\n${lines.join("\n")}`);
    };
    const { title: _title, ...noTitle } = COMPOSED([COMMONS_PICK]);
    has({ k: noTitle }, "/images/k", /title/);
    has({ k: COMPOSED([]) }, "/images/k/composed/parts");
    for (const file of ["content/images/sea.jpg", "content/images/composed/t/sea.png", "content/images/composed/t/sub/sea.jpg", "content/images/composed/T/sea.jpg", "/abs/content/images/composed/t/sea.jpg", "content/images/composed/t/../sea.jpg"]) {
      has({ k: { composed: { file, parts: [COMMONS_PICK] }, title: "x" } }, "/images/k/composed/file");
    }
    has({ k: { composed: { file: "content/images/composed/t/a.jpg", parts: [COMMONS_PICK], crop: {} }, title: "x" } }, "/images/k/composed", /crop/);
    has({ k: COMPOSED([{ ...COMMONS_PICK, license: "CC BY-SA 4.0" }]) }, "/images/k/composed/parts/0/license");
    has({ k: COMPOSED([COMMONS_PICK, { same_as: "nothing" }]) }, "/images/k/composed/parts/1/same_as", /không có khoá "nothing" trong file này/);
    has({ k: COMPOSED([{ same_as: "k" }]) }, "/images/k/composed/parts/0/same_as", /phần của hình ghép trỏ vào chính hình ghép/);
    has({ a: COMMONS_PICK, b: { same_as: "a" }, k: COMPOSED([{ same_as: "b" }]) }, "/images/k/composed/parts/0/same_as", /"b" cũng là same_as/);
    has({ k: COMPOSED([{ ...COMMONS_PICK, crop: { left: 0.5, top: 0, width: 0.6, height: 1 } }]) }, "/images/k/composed/parts/0/crop", /left \+ width = 1\.1 > 1/);
    has({ k: COMPOSED([{ same_as: "a", lesson: "Bad" }]) }, "/images/k/composed/parts/0/lesson");
  });

  test("SelectionSet: hình ghép trả mọi ảnh nguồn (same_as trong file, sang bài khác, phần là hình ghép khác), bỏ trùng; lồng hai lớp thì lỗi", () => {
    const dir = mkdtempSync(path.join(tmpdir(), "content-cli-composed-"));
    try {
      const fileA = selectionFileFor(dir, "discoverer", "t", "bai-mot");
      mkdirSync(path.dirname(fileA), { recursive: true });
      const timeline = { composed: { file: "content/images/composed/t/timeline.jpg", parts: [{ same_as: "tray_sea" }, FLICKR_PICK] }, title: "Timeline" };
      writeFileSync(fileA, JSON.stringify({ images: { "tray.tray_sea": COMMONS_PICK, "learn.explore.timeline": timeline } }));
      const set = new SelectionSet(dir);
      const here = checkSelection({
        images: {
          q1: { composed: { file: "content/images/composed/t/q1.jpg", parts: [{ same_as: "timeline", lesson: "t/01-bai-mot" }, { same_as: "q3" }] }, title: "Q1" },
          q2: { same_as: "timeline", lesson: "t/bai-mot" },
          q3: COMMONS_PICK,
          q4: { same_as: "q1" },
          q5: { composed: { file: "content/images/composed/t/q5.jpg", parts: [{ same_as: "q1" }] }, title: "Q5" },
          q6: { composed: { file: "content/images/composed/t/q6.jpg", parts: [{ same_as: "nothing", lesson: "t/bai-mot" }] }, title: "Q6" },
        },
      }).selection!;
      const q1 = set.resolve(here, "q1", "discoverer") as ResolvedComposed;
      assert.equal(q1.key, "q1");
      assert.equal(q1.via, undefined);
      assert.deepEqual(q1.parts, [
        { picked: COMMONS_PICK, via: "t/01-bai-mot tray.tray_sea" },
        { picked: FLICKR_PICK, via: "t/01-bai-mot learn.explore.timeline phần 2" },
      ]);
      const q2 = set.resolve(here, "q2", "discoverer") as ResolvedComposed;
      assert.deepEqual([q2.key, q2.via, q2.composed.title, q2.parts.map((part) => ("picked" in part ? part.picked : part.own))], ["learn.explore.timeline", "t/bai-mot learn.explore.timeline", "Timeline", [COMMONS_PICK, FLICKR_PICK]]);
      const q4 = set.resolve(here, "q4", "discoverer") as ResolvedComposed;
      assert.deepEqual([q4.key, q4.via, q4.parts.length], ["q1", "q1", 2]);
      assert.match((set.resolve(here, "q5", "discoverer") as { error: string }).error, /hình ghép q5 phần 1: q1 lại ghép từ hình ghép learn\.explore\.timeline; chỉ lồng được một lớp/);
      assert.match((set.resolve(here, "q6", "discoverer") as { error: string }).error, /hình ghép q6 phần 1: .*bai-mot\.json không có khoá "nothing"/);
      assert.deepEqual(set.resolve(here, "q3", "discoverer"), { picked: COMMONS_PICK });

      const credit = composedCredit(q1.composed.title, q1.parts.map(partCredit));
      assert.deepEqual(credit, {
        title: "Q1",
        author: COMPOSED_AUTHOR,
        license: "CC BY 2.0",
        license_url: FLICKR_PICK.license_url,
        source: "composed",
        parts: [creditOf(COMMONS_PICK), creditOf(FLICKR_PICK)],
      });
      assert.equal(COMPOSED_AUTHOR, "Science Kids");
      assert.equal(composedCredit("Only CC0", [creditOf(COMMONS_PICK)]).license, "CC0 1.0");
      assert.match(composedCacheKey("a".repeat(64)), /^[0-9a-f]{64}$/);
      assert.notEqual(composedCacheKey("a".repeat(64)), composedCacheKey("b".repeat(64)));
    } finally {
      rmSync(dir, { recursive: true, force: true });
    }
  });

  const OWN = (file = "content/images/own/be-mat-trai-dat/globe.jpg", title = "Plastic globe on a desk", extra: Record<string, unknown> = {}): Own => ({ own: { file, method: "drawn" }, title, ...extra }) as Own;

  test("hình tự vẽ (dev 10/11) hợp lệ: own.file trong content/images/own/<chủ đề>/, method drawn, title; same_as tới hình tự vẽ; làm phần của hình ghép", () => {
    const { selection, errors } = checkSelection({
      images: {
        "tray.tray_globe": OWN(undefined, undefined, { note: "designer vẽ 10/11" }),
        q2: { same_as: "tray_globe" },
        "tray.tray_sea": COMMONS_PICK,
        q3: COMPOSED([{ same_as: "tray_globe" }, OWN("content/images/own/be-mat-trai-dat/crank.jpeg", "Globe crank"), COMMONS_PICK]),
      },
    });
    assert.deepEqual(errors, []);
    assert.equal(resolvePicked(selection!, "tray.tray_globe"), undefined, "resolvePicked chỉ trả ảnh nguồn");
    assert.equal(resolvePicked(selection!, "q2"), undefined);
    assert.equal(localImagePath("/r/content/images", "content/images/own/t/a.jpg"), path.join("/r/content/images", "own", "t", "a.jpg"));
    assert.deepEqual(ownCredit("Plastic globe"), { title: "Plastic globe", author: "Science Kids", license: "Science Kids", license_url: "", source: "Science Kids" });
    assert.equal(OWN_AUTHOR, "Science Kids");
    assert.match(ownCacheKey("content/images/own/t/a.jpg", "a".repeat(64)), /^[0-9a-f]{64}$/);
    assert.notEqual(ownCacheKey("content/images/own/t/a.jpg", "a".repeat(64)), ownCacheKey("content/images/own/t/a.jpg", "b".repeat(64)), "đổi bytes");
    assert.notEqual(ownCacheKey("content/images/own/t/a.jpg", "a".repeat(64)), ownCacheKey("content/images/own/t/b.jpg", "a".repeat(64)), "đổi đường dẫn");
    assert.notEqual(ownCacheKey("content/images/own/t/a.jpg", "a".repeat(64)), composedCacheKey("a".repeat(64)));
  });

  test("hình tự vẽ sai: có pointer (file ngoài content/images/own, png, thư mục con, thiếu title, method lạ, khoá lạ, có giấy phép)", () => {
    const has = (images: Record<string, unknown>, pointer: string, message?: RegExp) => {
      const lines = errorsOf(images).map((error) => `${error.pointer} ${error.message}`);
      assert.ok(lines.some((line) => line.startsWith(`${pointer} `) && (!message || message.test(line))), `${pointer}\n${lines.join("\n")}`);
    };
    for (const file of ["content/images/globe.jpg", "content/images/composed/t/globe.jpg", "content/images/own/t/globe.png", "content/images/own/t/sub/globe.jpg", "content/images/own/T/globe.jpg", "content/images/own/t/../globe.jpg", "/abs/content/images/own/t/globe.jpg"]) {
      has({ k: OWN(file) }, "/images/k/own/file");
    }
    const { title: _title, ...noTitle } = OWN();
    has({ k: noTitle }, "/images/k", /title/);
    has({ k: { own: { file: "content/images/own/t/a.jpg", method: "photo" }, title: "x" } }, "/images/k/own/method");
    has({ k: { own: { file: "content/images/own/t/a.jpg" }, title: "x" } }, "/images/k/own", /method/);
    has({ k: { ...OWN(), license: "CC0 1.0" } }, "/images/k", /license/);
    has({ k: COMPOSED([{ ...OWN(), author: "x" }]) }, "/images/k/composed/parts/0", /author/);
  });

  test("SelectionSet: hình tự vẽ (cùng file, sang bài khác); hình ghép có phần tự vẽ (trong parts, same_as, qua hình ghép khác), bỏ trùng; credit", () => {
    const dir = mkdtempSync(path.join(tmpdir(), "content-cli-own-"));
    try {
      const fileA = selectionFileFor(dir, "discoverer", "t", "bai-mot");
      mkdirSync(path.dirname(fileA), { recursive: true });
      const globe = OWN("content/images/own/t/globe.jpg", "Plastic globe");
      const crank = OWN("content/images/own/t/crank.jpg", "Globe crank");
      writeFileSync(fileA, JSON.stringify({ images: { "tray.tray_globe": globe, "learn.explore.globe_sea": COMPOSED([{ same_as: "tray_globe" }, COMMONS_PICK]) } }));
      const set = new SelectionSet(dir);
      const here = checkSelection({
        images: {
          w1: { same_as: "tray_globe", lesson: "t/bai-mot" },
          w2: crank,
          w3: { same_as: "w2" },
          q1: COMPOSED([{ same_as: "w2" }, crank, { same_as: "globe_sea", lesson: "t/bai-mot" }, FLICKR_PICK], { title: "Q1" }),
          q2: COMPOSED([{ same_as: "w2" }, COMMONS_PICK], { title: "Q2" }),
          q3: COMPOSED([OWN("content/images/own/t/bottle.jpg", "Water bottle")], { title: "Q3" }),
        },
      }).selection!;
      assert.deepEqual(set.resolve(here, "w1", "discoverer"), { own: globe, key: "tray.tray_globe", via: "t/bai-mot tray.tray_globe" } satisfies ResolvedOwn);
      assert.deepEqual(set.resolve(here, "w2", "discoverer"), { own: crank, key: "w2" });
      assert.deepEqual(set.resolve(here, "w3", "discoverer"), { own: crank, key: "w2", via: "w2" });
      const q1 = set.resolve(here, "q1", "discoverer") as ResolvedComposed;
      assert.deepEqual(q1.parts, [
        { own: crank, via: "w2" },
        { own: globe, via: "t/bai-mot tray.tray_globe" },
        { picked: COMMONS_PICK, via: "t/bai-mot learn.explore.globe_sea phần 2" },
        { picked: FLICKR_PICK },
      ]);
      const credit = composedCredit("Q1", q1.parts.map(partCredit));
      assert.deepEqual(credit, {
        title: "Q1",
        author: "Science Kids",
        license: "CC BY 2.0",
        license_url: FLICKR_PICK.license_url,
        source: "composed",
        parts: [ownCredit("Globe crank"), ownCredit("Plastic globe"), creditOf(COMMONS_PICK), creditOf(FLICKR_PICK)],
      });
      assert.deepEqual(Object.keys(credit.parts[0]!), ["title", "author", "license", "license_url", "source"], "phần tự vẽ không có source_url");
      // No CC BY part: the composed picture is Science Kids'; only own parts: too.
      const q2 = composedCredit("Q2", (set.resolve(here, "q2", "discoverer") as ResolvedComposed).parts.map(partCredit));
      assert.deepEqual([q2.license, q2.license_url], ["Science Kids", ""]);
      const q3 = composedCredit("Q3", (set.resolve(here, "q3", "discoverer") as ResolvedComposed).parts.map(partCredit));
      assert.deepEqual([q3.license, q3.license_url, q3.parts], ["Science Kids", "", [ownCredit("Water bottle")]]);
    } finally {
      rmSync(dir, { recursive: true, force: true });
    }
  });
});

// ---------- network helpers, sources ----------

describe("throttle, hạn mức Openverse, cache tìm kiếm", () => {
  test("Throttle chờ đủ khoảng cách giữa hai lượt", async () => {
    let clock = 1000;
    const waits: number[] = [];
    const throttle = new Throttle(3100, async (ms) => {
      waits.push(ms);
      clock += ms;
    }, () => clock);
    await throttle.wait();
    clock += 1000;
    await throttle.wait();
    await throttle.wait();
    assert.deepEqual(waits, [2100, 3100]);
  });

  test("DailyQuota: đếm theo ngày UTC, dừng ở giới hạn, sang ngày mới đếm lại", () => {
    const dir = mkdtempSync(path.join(tmpdir(), "content-cli-quota-"));
    try {
      let day = "2026-11-09";
      const quota = new DailyQuota(path.join(dir, "q.json"), 2, () => day);
      assert.equal(quota.take(), true);
      assert.equal(quota.take(), true);
      assert.equal(quota.take(), false);
      assert.equal(quota.used(), 2);
      day = "2026-11-10";
      assert.equal(quota.used(), 0);
      assert.equal(quota.take(), true);
    } finally {
      rmSync(dir, { recursive: true, force: true });
    }
  });

  test("JsonCache: lưu theo URL", () => {
    const dir = mkdtempSync(path.join(tmpdir(), "content-cli-jcache-"));
    try {
      const cache = new JsonCache(dir);
      assert.equal(cache.get("https://a"), undefined);
      cache.put("https://a", { x: 1 });
      assert.deepEqual(cache.get("https://a"), { x: 1 });
      assert.equal(cache.get("https://b"), undefined);
    } finally {
      rmSync(dir, { recursive: true, force: true });
    }
  });

  test("Retry-After: số giây hoặc ngày giờ HTTP; quá khứ là 0; thiếu, hỏng là undefined; chờ ≥ bước backoff, ≤ 120 s", () => {
    const now = Date.parse("2026-11-10T04:00:00Z");
    assert.equal(retryAfterMs("7", now), 7000);
    assert.equal(retryAfterMs(" 0 ", now), 0);
    assert.equal(retryAfterMs("1.5", now), 1500);
    assert.equal(retryAfterMs("Tue, 10 Nov 2026 04:00:30 GMT", now), 30_000);
    assert.equal(retryAfterMs("Tue, 10 Nov 2026 03:59:00 GMT", now), 0);
    for (const bad of [null, undefined, "", "soon", "-5"]) assert.equal(retryAfterMs(bad, now), undefined, String(bad));
    assert.equal(retryWaitMs(0, 7000), 7000);
    assert.equal(retryWaitMs(0, 1000), 5000, "Retry-After nhỏ hơn bước backoff thì chờ theo backoff");
    assert.deepEqual([0, 1, 2].map((retry) => retryWaitMs(retry, undefined)), [5000, 15_000, 45_000]);
    assert.equal(retryWaitMs(1, 600_000), MAX_RETRY_WAIT_MS);
    assert.equal(MAX_RETRY_WAIT_MS, 120_000);
  });

  /** Fake clock: sleep moves it forward; every sleep is recorded. */
  const clockFor = (start = Date.parse("2026-11-10T04:00:00Z")) => {
    const clock = { now: start, sleeps: [] as number[] };
    const sleep = async (ms: number) => {
      clock.sleeps.push(ms);
      clock.now += ms;
    };
    return { clock, sleep, now: () => clock.now };
  };
  const sequenceHttp = (answers: ((url: string) => HttpResponse)[]) => {
    const calls: { url: string; at: number }[] = [];
    let i = 0;
    return {
      calls,
      make: (now: () => number): Http =>
        async (url) => {
          calls.push({ url, at: now() });
          const answer = answers[Math.min(i++, answers.length - 1)]!;
          return answer(url);
        },
    };
  };
  const IMG = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/X.jpg/1280px-X.jpg";

  test("politeHttp: 429 có Retry-After giây, 503 có Retry-After ngày giờ: chờ đúng rồi thử lại, lần ba qua", async () => {
    const { clock, sleep, now } = clockFor();
    const lines: string[] = [];
    const answers = sequenceHttp([
      (url) => statusResponse(url, 429, "7"),
      (url) => statusResponse(url, 503, new Date(clock.now + 20_000).toUTCString()),
      (url) => imageResponse(url, Buffer.from("ok")),
    ]);
    const http = politeHttp(answers.make(now), { sleep, now, log: (line) => lines.push(line) });
    const response = await http(IMG, { headers: {} });
    assert.equal(response.status, 200);
    assert.deepEqual(clock.sleeps, [7000, 20_000]);
    assert.equal(answers.calls.length, 3);
    assert.match(lines[0]!, /HTTP 429 ở upload\.wikimedia\.org, Retry-After 7 s: chờ 7 s rồi thử lại \(lần 1\/3\)/);
    assert.match(lines[1]!, /HTTP 503 ở upload\.wikimedia\.org, Retry-After 20 s: chờ 20 s rồi thử lại \(lần 2\/3\)/);
  });

  test("politeHttp: không có Retry-After thì backoff 5, 15, 45 s; Retry-After quá 120 s chờ 120 s; hết lượt trả 429; 404 không thử lại", async () => {
    const { clock, sleep, now } = clockFor();
    const lines: string[] = [];
    const always = sequenceHttp([(url) => statusResponse(url, 429)]);
    const response = await politeHttp(always.make(now), { sleep, now, log: (line) => lines.push(line) })(IMG, { headers: {} });
    assert.equal(response.status, 429);
    assert.equal(always.calls.length, 4, "1 lượt đầu + 3 lượt thử lại");
    assert.deepEqual(clock.sleeps, [5000, 15_000, 45_000]);
    assert.match(lines.at(-1)!, /HTTP 429 ở upload\.wikimedia\.org: đã thử lại 3 lần, bỏ/);

    const long = clockFor();
    const longLines: string[] = [];
    const slow = sequenceHttp([(url) => statusResponse(url, 429, "3600"), (url) => imageResponse(url, Buffer.from("ok"))]);
    assert.equal((await politeHttp(slow.make(long.now), { sleep: long.sleep, now: long.now, log: (line) => longLines.push(line) })(IMG, { headers: {} })).status, 200);
    assert.deepEqual(long.clock.sleeps, [120_000]);
    assert.match(longLines[0]!, /Retry-After 3600 s \(chờ tối đa 120 s\): chờ 120 s/);

    const notFound = clockFor();
    const missing = sequenceHttp([(url) => statusResponse(url, 404)]);
    assert.equal((await politeHttp(missing.make(notFound.now), { sleep: notFound.sleep, now: notFound.now })(IMG, { headers: {} })).status, 404);
    assert.equal(missing.calls.length, 1);
    assert.deepEqual(notFound.clock.sleeps, []);
  });

  test("politeHttp: throttle theo host chờ trước mỗi lượt, kể cả lượt thử lại", async () => {
    const { clock, sleep, now } = clockFor();
    const upload = new Throttle(3000, sleep, now);
    const answers = sequenceHttp([(url) => imageResponse(url, Buffer.from("ok"))]);
    const http = politeHttp(answers.make(now), { sleep, now, throttleFor: (url) => (new URL(url).hostname === "upload.wikimedia.org" ? upload : undefined) });
    await http(IMG, { headers: {} });
    clock.now += 500;
    await http(IMG, { headers: {} });
    await http("https://live.staticflickr.com/1/x.jpg", { headers: {} });
    await http(IMG, { headers: {} });
    assert.deepEqual(clock.sleeps, [2500, 3000]);
    const uploads = answers.calls.filter((call) => call.url === IMG).map((call) => call.at);
    for (let i = 1; i < uploads.length; i++) assert.ok(uploads[i]! - uploads[i - 1]! >= 3000);

    // After a retry, the next request counts its 3 s from the retry, not from the first attempt.
    const second = clockFor();
    const gap = new Throttle(3000, second.sleep, second.now);
    const retried = sequenceHttp([(url) => statusResponse(url, 429, "1"), (url) => imageResponse(url, Buffer.from("ok"))]);
    const polite = politeHttp(retried.make(second.now), { sleep: second.sleep, now: second.now, throttleFor: () => gap });
    await polite(IMG, { headers: {} });
    await polite(IMG, { headers: {} });
    assert.deepEqual(second.clock.sleeps, [5000, 3000], "Retry-After 1 s < bước đầu 5 s; lượt sau chờ 3 s tính từ lượt thử lại");
    assert.deepEqual(retried.calls.map((call) => call.at - retried.calls[0]!.at), [0, 5000, 8000]);
  });
});

describe("đọc kết quả Commons và Openverse (fixture)", () => {
  test("Commons: theo thứ tự tìm, chỉ CC0 / PD / CC BY; loại BY-SA, GFDL, hạn chế, nhỏ, gif, không tác giả, nhãn lạ", () => {
    const found = parseCommonsSearch(COMMONS_SEARCH, "sea");
    assert.deepEqual(found.candidates.map((c) => [c.title, c.license, c.author]), [
      ["Blue sea horizon", "CC0 1.0", "Example Author A"],
      ["Calm lake & trees", "CC BY 4.0", "Example Author B"],
      ["Public domain volcano", "Public domain", "NASA"],
    ]);
    const lake = found.candidates[1]!;
    assert.equal(lake.source, "Wikimedia Commons");
    assert.equal(lake.source_url, "https://commons.wikimedia.org/wiki/File:Calm_lake_with_trees.jpg");
    assert.equal(lake.file_url, "https://upload.wikimedia.org/wikipedia/commons/a/a2/Calm_lake_with_trees.jpg");
    assert.match(lake.thumb_url, /400px-/);
    assert.equal(found.candidates[2]!.license_url, "https://commons.wikimedia.org/wiki/File:Public_domain_volcano.jpg");
    assert.equal(found.rejected.length, 7);
    const reasons = found.rejected.map((r) => r.reason).join("\n");
    for (const part of ["CC BY-SA 4.0", "GFDL", "personality", "nhỏ quá (300×200)", "image/gif", "CC BY 3.0 mà không rõ tác giả", '"Attribution"']) assert.ok(reasons.includes(part), part);
  });

  test("Openverse: nguồn Openverse/<nhà cung cấp>, url https, loại by-sa, mature, không tác giả, nhỏ", () => {
    const found = parseOpenverseSearch(OPENVERSE_SEARCH, "sea");
    assert.deepEqual(found.candidates.map((c) => [c.title, c.license, c.source, c.author]), [
      ["Sea at dawn", "CC0 1.0", "Openverse/Flickr", "example_photographer_1"],
      ["River & boat", "CC BY 2.0", "Openverse/Flickr", "Example Photographer 2"],
      ["Volcano from orbit", "PDM 1.0", "Openverse/NASA", UNKNOWN_AUTHOR],
      ["Blue sea horizon", "CC0 1.0", "Openverse/Wikimedia Commons", "Example Author A"],
    ]);
    assert.equal(found.candidates[1]!.license_url, "https://creativecommons.org/licenses/by/2.0/");
    assert.equal(found.candidates[0]!.openverse_id, "11111111-1111-4111-8111-111111111111");
    assert.equal(found.rejected.length, 4);
  });

  test("URL gọi API; category theo nhãn brief", () => {
    assert.match(commonsSearchUrl("blue sea"), /^https:\/\/commons\.wikimedia\.org\/w\/api\.php\?.*gsrsearch=filetype%3Abitmap\+blue\+sea/);
    assert.match(openverseSearchUrl("blue sea", "photograph"), /^https:\/\/api\.openverse\.org\/v1\/images\/\?q=blue\+sea&license=cc0%2Cpdm%2Cby&page_size=20&mature=false&category=photograph$/);
    assert.equal(openverseDetailUrl("abc"), "https://api.openverse.org/v1/images/abc/");
    assert.match(commonsFileInfoUrl("File:X y.jpg"), /titles=File%3AX\+y\.jpg/);
    assert.match(commonsFileInfoUrl("File:X y.jpg"), /iiprop=url%7Csize%7Cmime%7Cextmetadata&iiurlwidth=1280&/);
    assert.equal(openverseCategory("[ảnh] Biển"), "photograph");
    assert.equal(openverseCategory("[ảnh mô hình] Voi ma mút"), "photograph");
    assert.equal(openverseCategory("[tranh] Cá"), "illustration,digitized_artwork");
    assert.equal(openverseCategory("[tranh phục dựng] Khủng long"), "illustration,digitized_artwork");
    for (const tag of ["[ảnh hoặc tranh] x", "[bản đồ] x", "[sơ đồ ghép ảnh] x", "Biển xanh"]) assert.equal(openverseCategory(tag), undefined, tag);
  });

  test("commonsDownloadUrl: ảnh rộng hơn 1280 px hoặc không phải JPEG/PNG/WebP thì tải thumburl, còn lại url gốc", () => {
    const url = "https://upload.wikimedia.org/wikipedia/commons/6/6d/Red_hot_iron.jpg";
    const thumb = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Red_hot_iron.jpg/1280px-Red_hot_iron.jpg";
    assert.equal(commonsDownloadUrl({ url, thumb_url: thumb, width: 4608, mime: "image/jpeg" }), thumb);
    assert.equal(commonsDownloadUrl({ url, thumb_url: thumb, width: 1281, mime: "image/jpeg" }), thumb);
    // Commons' thumburl of a picture no wider than 1280 px is the original URL itself.
    assert.equal(commonsDownloadUrl({ url, thumb_url: url, width: 1280, mime: "image/jpeg" }), url);
    assert.equal(commonsDownloadUrl({ url, thumb_url: url, width: 900, mime: "image/png" }), url);
    const tiffThumb = "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Map.tif/lossy-page1-1000px-Map.tif.jpg";
    assert.equal(commonsDownloadUrl({ url: url.replace(".jpg", ".tif"), thumb_url: tiffThumb, width: 1000, mime: "image/tiff" }), tiffThumb);
    assert.equal(commonsDownloadUrl({ url, thumb_url: undefined, width: 4608, mime: "image/jpeg" }), url, "API không trả thumburl: url gốc");
  });

  test("pickCandidates: xen kẽ hai nguồn, bỏ trùng trang gốc, tối đa n; selectionEntry hợp schema", () => {
    const commons = parseCommonsSearch(COMMONS_SEARCH, "q").candidates;
    const openverse = parseOpenverseSearch(OPENVERSE_SEARCH, "q").candidates;
    const picked = pickCandidates(commons, openverse, 6);
    assert.deepEqual(picked.map((c) => c.title), ["Blue sea horizon", "Sea at dawn", "Calm lake & trees", "River & boat", "Public domain volcano", "Volcano from orbit"]);
    assert.equal(pickCandidates(commons, openverse, 3).length, 3);
    for (const candidate of [...commons, ...openverse]) {
      assert.deepEqual(checkSelection({ images: { k: selectionEntry(candidate) } }).errors, [], candidate.title);
    }
    assert.deepEqual(Object.keys(selectionEntry(openverse[1] as Candidate)), ["source", "openverse_id", "source_url", "file_url", "title", "author", "license", "license_url"]);
  });
});

// ---------- images search ----------

describe("images search (API giả)", () => {
  let root: string;
  let lessonMd: string;
  before(() => {
    root = mkdtempSync(path.join(tmpdir(), "content-cli-img-search-"));
    cpSync(MD_FIXTURE, path.join(root, "content"), { recursive: true });
    lessonMd = path.join(root, "content", "discoverer", "an-uong-lanh-manh", "01-thuc-an-cho-ta-nhung-gi.md");
    const text = readFileSync(lessonMd, "utf8");
    const line = "image.brief: Ổ bánh mì Việt Nam vỏ vàng giòn, chưa kẹp nhân\n";
    assert.equal(text.split(line).length, 2);
    const tofu = "image.brief: Bìa đậu phụ trắng cắt miếng vuông trên đĩa, vài miếng rán vàng\n";
    assert.equal(text.split(tofu).length, 2);
    writeFileSync(
      lessonMd,
      text
        .replace(line, "image.brief: [ảnh] Ổ bánh mì Việt Nam vỏ vàng giòn, chưa kẹp nhân. Từ khoá tìm ảnh (EN): banh mi bread roll; baguette\n")
        .replace(tofu, "image.brief: Dùng lại hình `q4_tofu` ở bài `an-uong-lanh-manh/02-mam-com-can-bang`. Từ khoá tìm ảnh (EN): tofu plate\n"),
    );
  });
  after(() => rmSync(root, { recursive: true, force: true }));

  const KEYS = ["tray.tray_bread", "tray.tray_rice", "q1.q1_rice", "q5.q5_tofu"];
  const handler = (url: string) => {
    if (url.startsWith("https://commons.wikimedia.org/w/api.php?")) return jsonResponse(url, COMMONS_SEARCH);
    if (url.startsWith("https://api.openverse.org/v1/images/?")) return jsonResponse(url, OPENVERSE_SEARCH);
    return undefined;
  };
  const search = (name: string, http: Http, extra: Partial<Parameters<typeof runImagesSearch>[0]> = {}) =>
    quiet(() =>
      runImagesSearch({
        inputs: [lessonMd],
        contentRoot: path.join(root, "content"),
        rulesFile: DEFAULT_RULES_FILE,
        minAppVersion: "0.1.0",
        out: path.join(root, name),
        selectionDir: path.join(root, "content", "images"),
        perImage: 6,
        keys: KEYS,
        refresh: false,
        sources: { commons: true, openverse: true },
        http,
        sleep: noSleep,
        quotaFile: path.join(root, `${name}-quota.json`),
        display: (file) => path.relative(root, file),
        now: () => new Date("2026-11-09T10:00:00.000Z"),
        ...extra,
      }),
    );
  const candidatesOf = (name: string): CandidatesFile => JSON.parse(readFileSync(path.join(root, name, "an-uong-lanh-manh", "thuc-an-cho-ta-nhung-gi", "candidates.json"), "utf8"));

  test("ghi candidates.json + .html; từ khoá từ brief, thiếu thì alt.en; hình dùng lại không tìm; không tải ảnh", async () => {
    const { http, calls } = fakeHttp(handler);
    const { result, out } = await search("run1", http);
    assert.equal(result, 0, out);
    // Only API answers, never an image file.
    assert.ok(calls.every((url) => url.startsWith("https://commons.wikimedia.org/w/api.php?") || url.startsWith("https://api.openverse.org/v1/images/?")), calls.join("\n"));
    assert.deepEqual(calls.filter((url) => url.includes("commons")).map((url) => new URL(url).searchParams.get("gsrsearch")), ["filetype:bitmap A bowl of rice", "filetype:bitmap banh mi bread roll", "filetype:bitmap baguette"]);
    const openverse = calls.filter((url) => url.includes("openverse")).map((url) => new URL(url));
    assert.deepEqual(openverse.map((url) => url.searchParams.get("q")), ["A bowl of rice", "banh mi bread roll", "baguette"]);
    assert.deepEqual(openverse.map((url) => url.searchParams.get("category")), [null, "photograph", "photograph"]);

    const file = candidatesOf("run1");
    assert.equal(file.selection_file, path.relative(path.resolve(CLI_ROOT, "../.."), path.join(root, "content", "images", "discoverer", "an-uong-lanh-manh", "thuc-an-cho-ta-nhung-gi.json")));
    assert.equal(file.lesson.slug, "thuc-an-cho-ta-nhung-gi");
    assert.deepEqual(file.images.map((image) => image.key), ["tray.tray_rice", "tray.tray_bread", "q1.q1_rice", "q5.q5_tofu"]);
    const [rice, bread, reuse, tofu] = file.images;
    assert.equal(rice!.query_from, "alt");
    assert.deepEqual(rice!.queries, ["A bowl of rice"]);
    assert.match(rice!.notes[0]!, /tìm bằng alt\.en/);
    assert.equal(bread!.query_from, "brief");
    assert.deepEqual(bread!.queries, ["banh mi bread roll", "baguette"]);
    assert.equal(bread!.candidates.length, 6);
    assert.deepEqual(bread!.candidates.map((c) => c.title), ["Blue sea horizon", "Sea at dawn", "Calm lake & trees", "River & boat", "Public domain volcano", "Volcano from orbit"]);
    for (const candidate of bread!.candidates) assert.deepEqual(checkSelection({ images: { [bread!.key]: candidate.selection } }).errors, []);
    assert.equal(Object.values(bread!.rejected).reduce((sum, n) => sum + n, 0), 2 * (7 + 4));
    assert.equal(reuse!.reuse_of, "tray.tray_rice");
    assert.deepEqual(reuse!.reuse_entry, { same_as: "tray.tray_rice" });
    assert.deepEqual(reuse!.candidates, []);
    assert.equal(tofu!.reuse_of, "an-uong-lanh-manh/mam-com-can-bang q4_tofu");
    assert.deepEqual(tofu!.reuse_entry, { same_as: "q4_tofu", lesson: "an-uong-lanh-manh/mam-com-can-bang" });
    assert.deepEqual(checkSelection({ images: { [tofu!.key]: tofu!.reuse_entry } }).errors, []);
    assert.deepEqual(file.requests, { commons: 3, openverse: 3, cached: 0 });

    const html = readFileSync(path.join(root, "run1", "an-uong-lanh-manh", "thuc-an-cho-ta-nhung-gi", "candidates.html"), "utf8");
    assert.match(html, /<code>tray\.tray_bread<\/code>/);
    assert.match(html, /River &amp; boat/);
    assert.match(html, /id="copy"/);
    assert.equal(html.match(/<\/script>/g)!.length, 2, "dữ liệu nhúng không đóng thẻ script");
    assert.match(html, /value="same_as" checked> Dùng lại ảnh của <code>tray\.tray_rice<\/code>/);
    assert.match(out, /2 hình có ứng viên · 2 dùng lại hình khác · 0 chưa có ứng viên/);
    assert.match(out, /images search: 4 hình · gọi Commons 3, Openverse 3/);
    assert.equal(new DailyQuota(path.join(root, "run1-quota.json")).used(), 3);
  });

  test("chạy lại: lấy hết từ cache, không gọi API; --refresh với chỉ Commons thì không gọi Openverse", async () => {
    const first = fakeHttp(handler);
    await search("run2", first.http);
    const again = fakeHttp(handler);
    const { result } = await search("run2", again.http);
    assert.equal(result, 0);
    assert.deepEqual(again.calls, []);
    assert.deepEqual(candidatesOf("run2").requests, { commons: 0, openverse: 0, cached: 6 });
    const commonsOnly = fakeHttp(handler);
    await search("run2", commonsOnly.http, { refresh: true, sources: { commons: true, openverse: false } });
    assert.equal(commonsOnly.calls.length, 3);
    assert.ok(commonsOnly.calls.every((url) => url.includes("commons.wikimedia.org")));
  });

  test("hết lượt Openverse hôm nay: không gọi Openverse, ghi chú ở hình; 429 thì dừng Openverse cho lần chạy", async () => {
    const quotaFile = path.join(root, "full-quota.json");
    writeFileSync(quotaFile, JSON.stringify({ date: new Date().toISOString().slice(0, 10), count: 190 }));
    const full = fakeHttp(handler);
    const { result, out } = await search("run3", full.http, { quotaFile });
    assert.equal(result, 0);
    assert.ok(full.calls.every((url) => !url.includes("openverse")));
    assert.match(candidatesOf("run3").images[1]!.notes.join(" "), /hết 190 lượt hôm nay/);
    assert.match(out, /Openverse: hết 190 lượt/);

    const limited = fakeHttp((url) => (url.includes("openverse") ? jsonResponse(url, { detail: "throttled" }, 429) : handler(url)));
    await search("run4", limited.http);
    assert.equal(limited.calls.filter((url) => url.includes("openverse")).length, 1);
    assert.equal(candidatesOf("run4").images[1]!.candidates.length, 3, "chỉ còn ứng viên Commons");
  });

  test("trả lời 5xx: chờ rồi thử lại một lần; --cache-only không gọi mạng", async () => {
    let openverseCalls = 0;
    const flaky = fakeHttp((url) => {
      if (url.includes("openverse") && ++openverseCalls === 1) return jsonResponse(url, { detail: "timeout" }, 504);
      return handler(url);
    });
    const waits: number[] = [];
    await search("run6", flaky.http, { sleep: async (ms) => void waits.push(ms) });
    assert.ok(waits.includes(5000));
    assert.equal(flaky.calls.filter((url) => url.includes("openverse")).length, 4, "3 truy vấn + 1 lần thử lại");
    assert.deepEqual(candidatesOf("run6").images[0]!.notes.filter((note) => note.includes("504")), []);
    const offline = fakeHttp(() => undefined);
    const { result } = await search("run6", offline.http, { cacheOnly: true });
    assert.equal(result, 0);
    assert.deepEqual(offline.calls, []);
    const fresh = fakeHttp(() => undefined);
    await search("run7", fresh.http, { cacheOnly: true });
    assert.deepEqual(fresh.calls, []);
    assert.match(candidatesOf("run7").images[1]!.notes.join(" "), /chưa có trong cache \(--cache-only\)/);
  });

  test("file chọn ảnh có sẵn: hiện lựa chọn cũ trong candidates.json và HTML", async () => {
    const selectionFile = path.join(root, "content", "images", "discoverer", "an-uong-lanh-manh", "thuc-an-cho-ta-nhung-gi.json");
    mkdirSync(path.dirname(selectionFile), { recursive: true });
    writeFileSync(selectionFile, JSON.stringify({ images: { "tray.tray_bread": COMMONS_PICK } }));
    try {
      const { http } = fakeHttp(handler);
      await search("run5", http);
      const file = candidatesOf("run5");
      assert.equal(file.selection_exists, true);
      assert.deepEqual(file.images[1]!.current, COMMONS_PICK);
      assert.match(readFileSync(path.join(root, "run5", "an-uong-lanh-manh", "thuc-an-cho-ta-nhung-gi", "candidates.html"), "utf8"), /Đang chọn: <a href="https:\/\/commons\.wikimedia\.org\/wiki\/File:Blue_sea_horizon\.jpg"/);
    } finally {
      rmSync(selectionFile);
    }
  });

  test("brief ghép: tìm riêng từng ảnh cần tìm, liệt kê hình dùng lại, đề xuất file ghép; trang có lựa chọn Hình ghép", async () => {
    const original = readFileSync(lessonMd, "utf8");
    const fish = "image.brief: Cá kho tộ màu nâu cánh gián trong nồi đất nhỏ, vài lát ớt đỏ\n";
    assert.equal(original.split(fish).length, 2);
    writeFileSync(
      lessonMd,
      original.replace(
        fish,
        "image.brief: [sơ đồ ghép ảnh] Nồi cá kho đặt cạnh bát cơm (dùng lại hình `tray_rice`) và đậu phụ `mam-com-can-bang/q4_tofu`. Từ khoá cho nồi cá: fish clay pot; braised fish. Từ khoá tìm ảnh (EN): banh mi bread roll; baguette\n",
      ),
    );
    const selectionFile = path.join(root, "content", "images", "discoverer", "an-uong-lanh-manh", "thuc-an-cho-ta-nhung-gi.json");
    try {
      const { http, calls } = fakeHttp(handler);
      const { result, out } = await search("run8", http, { keys: ["tray.tray_fish"] });
      assert.equal(result, 0, out);
      assert.deepEqual(calls.filter((url) => url.includes("commons")).map((url) => new URL(url).searchParams.get("gsrsearch")), [
        "filetype:bitmap banh mi bread roll",
        "filetype:bitmap baguette",
        "filetype:bitmap fish clay pot",
        "filetype:bitmap braised fish",
      ]);
      assert.deepEqual(calls.filter((url) => url.includes("openverse")).map((url) => new URL(url).searchParams.get("q")), ["banh mi bread roll", "baguette", "fish clay pot", "braised fish"]);
      const [fishImage] = candidatesOf("run8").images;
      assert.equal(fishImage!.query_from, "composed");
      assert.deepEqual(fishImage!.candidates, []);
      const composed = fishImage!.composed!;
      assert.equal(composed.file, "content/images/composed/an-uong-lanh-manh/thuc-an-cho-ta-nhung-gi.tray.tray_fish.jpg");
      assert.equal(composed.title, fishImage!.alt.en);
      assert.deepEqual(composed.searches.map((part) => [part.name, part.queries, part.candidates.length]), [
        [undefined, ["banh mi bread roll"], 6],
        [undefined, ["baguette"], 6],
        ["nồi cá", ["fish clay pot", "braised fish"], 6],
      ]);
      assert.deepEqual(composed.reuses.map((reuse) => reuse.part), [{ same_as: "tray.tray_rice" }, { same_as: "q4_tofu", lesson: "an-uong-lanh-manh/mam-com-can-bang" }]);
      // What the page builds: a valid composed entry.
      const entry = { composed: { file: composed.file, parts: [composed.reuses[0]!.part, composed.reuses[1]!.part, composed.searches[2]!.candidates[0]!.selection] }, title: composed.title };
      assert.deepEqual(checkSelection({ images: { "tray.tray_rice": COMMONS_PICK, "tray.tray_fish": entry } }).errors, []);
      assert.match(out, /tray\.tray_fish: hình ghép · 3 ảnh cần tìm \(6 ứng viên, 6 ứng viên, 6 ứng viên\) · 2 ảnh dùng lại \(tray\.tray_rice, an-uong-lanh-manh\/mam-com-can-bang q4_tofu\)/);
      assert.match(out, /0 hình có ứng viên · 0 dùng lại hình khác · 1 hình ghép · 0 chưa có ứng viên/);

      const html = readFileSync(path.join(root, "run8", "an-uong-lanh-manh", "thuc-an-cho-ta-nhung-gi", "candidates.html"), "utf8");
      assert.match(html, /<input type="radio" name="pick-0" value="composed"> Hình ghép từ các ảnh đánh dấu/);
      assert.match(html, /<h4>Ảnh cần tìm 3: nồi cá/);
      assert.match(html, /data-reuse="1" checked> Dùng lại ảnh của <code>an-uong-lanh-manh\/mam-com-can-bang q4_tofu<\/code>/);
      assert.match(html, /name="pick-0-part-2" value="5" data-part="search"/);
      assert.equal(html.match(/<\/script>/g)!.length, 2);
      const data = JSON.parse(/<script type="application\/json" id="data">(.*?)<\/script>/s.exec(html)![1]!);
      assert.deepEqual(data.images[0].composed.reuses, composed.reuses.map((reuse) => reuse.part));
      assert.equal(data.images[0].composed.searches[2].length, 6);

      // A composed entry already in the file shows as the current choice.
      mkdirSync(path.dirname(selectionFile), { recursive: true });
      writeFileSync(selectionFile, JSON.stringify({ images: { "tray.tray_rice": COMMONS_PICK, "tray.tray_fish": entry } }));
      await search("run9", fakeHttp(handler).http, { keys: ["tray.tray_fish"], cacheOnly: true });
      assert.match(readFileSync(path.join(root, "run9", "an-uong-lanh-manh", "thuc-an-cho-ta-nhung-gi", "candidates.html"), "utf8"), /Đang chọn: hình ghép <code>content\/images\/composed\/an-uong-lanh-manh\/thuc-an-cho-ta-nhung-gi\.tray\.tray_fish\.jpg<\/code> từ 3 ảnh/);
    } finally {
      writeFileSync(lessonMd, original);
      rmSync(selectionFile, { force: true });
    }
  });

  test("brief [hình vẽ] (dev 10/11): không tìm, không gọi mạng; đề xuất mục own; trang có lựa chọn Hình tự vẽ; lựa chọn cũ hiện ra", async () => {
    const original = readFileSync(lessonMd, "utf8");
    const fish = "image.brief: Cá kho tộ màu nâu cánh gián trong nồi đất nhỏ, vài lát ớt đỏ\n";
    assert.equal(original.split(fish).length, 2);
    writeFileSync(lessonMd, original.replace(fish, "image.brief: [hình vẽ] Nồi cá kho tộ bằng đất, nhìn nghiêng, nền trơn, không có chữ. Từ khoá tìm ảnh (EN): fish clay pot\n"));
    const selectionFile = path.join(root, "content", "images", "discoverer", "an-uong-lanh-manh", "thuc-an-cho-ta-nhung-gi.json");
    try {
      const { http, calls } = fakeHttp(() => undefined);
      const { result, out } = await search("run10", http, { keys: ["tray.tray_fish"] });
      assert.equal(result, 0, out);
      assert.deepEqual(calls, [], "hình tự vẽ: không gọi mạng");
      const [fishImage] = candidatesOf("run10").images;
      assert.equal(fishImage!.query_from, "own");
      assert.deepEqual(fishImage!.queries, []);
      assert.deepEqual(fishImage!.candidates, []);
      const own = fishImage!.own!;
      assert.deepEqual(own, { own: { file: "content/images/own/an-uong-lanh-manh/thuc-an-cho-ta-nhung-gi.tray.tray_fish.jpg", method: "drawn" }, title: fishImage!.alt.en });
      assert.deepEqual(checkSelection({ images: { "tray.tray_fish": own } }).errors, [], "mục đề xuất hợp schema");
      assert.match(out, /tray\.tray_fish: hình tự vẽ, không tìm · file đề xuất content\/images\/own\/an-uong-lanh-manh\/thuc-an-cho-ta-nhung-gi\.tray\.tray_fish\.jpg/);
      assert.match(out, /0 hình có ứng viên · 0 dùng lại hình khác · 1 hình tự vẽ · 0 chưa có ứng viên/);
      const html = readFileSync(path.join(root, "run10", "an-uong-lanh-manh", "thuc-an-cho-ta-nhung-gi", "candidates.html"), "utf8");
      assert.match(html, /<input type="radio" name="pick-0" value="keep" checked> Chưa chọn/);
      assert.match(html, /<input type="radio" name="pick-0" value="own"> Hình tự vẽ \(đã có file\)/);
      const data = JSON.parse(/<script type="application\/json" id="data">(.*?)<\/script>/s.exec(html)![1]!);
      assert.deepEqual(data.images[0].own, own);

      mkdirSync(path.dirname(selectionFile), { recursive: true });
      writeFileSync(selectionFile, JSON.stringify({ images: { "tray.tray_fish": own } }));
      await search("run11", fakeHttp(() => undefined).http, { keys: ["tray.tray_fish"] });
      assert.match(readFileSync(path.join(root, "run11", "an-uong-lanh-manh", "thuc-an-cho-ta-nhung-gi", "candidates.html"), "utf8"), /Đang chọn: hình tự vẽ <code>content\/images\/own\/an-uong-lanh-manh\/thuc-an-cho-ta-nhung-gi\.tray\.tray_fish\.jpg<\/code> · /);
    } finally {
      writeFileSync(lessonMd, original);
      rmSync(selectionFile, { force: true });
    }
  });
});

// ---------- processing ----------

/** A width × height JPEG (left half red, right half blue), optionally with EXIF orientation + GPS-like EXIF. */
async function sourceJpeg(width: number, height: number, orientation?: number): Promise<Buffer> {
  const left = await sharp({ create: { width: Math.ceil(width / 2), height, channels: 3, background: "#ff0000" } }).png().toBuffer();
  let image = sharp({ create: { width, height, channels: 3, background: "#0000ff" } }).composite([{ input: left, left: 0, top: 0 }]).jpeg();
  if (orientation) image = image.withMetadata({ orientation, exif: { IFD0: { Copyright: "Example", Artist: "Example" } } });
  return image.toBuffer();
}

describe("xử lý ảnh (sharp)", () => {
  test("xoay theo EXIF, thu về cạnh dài 1024, JPEG sRGB, không EXIF/ICC, cùng input ra cùng bytes", async () => {
    const input = await sourceJpeg(3000, 2000, 6);
    assert.equal((await sharp(input).metadata()).orientation, 6);
    const out = await processImage(input);
    assert.deepEqual([out.width, out.height], [683, 1024]);
    assert.deepEqual(out.changes, ["resized"]);
    assert.deepEqual(out.original, { width: 2000, height: 3000, format: "jpeg" });
    const meta = await sharp(out.jpeg).metadata();
    assert.equal(meta.format, "jpeg");
    assert.equal(meta.space, "srgb");
    assert.equal(meta.exif, undefined);
    assert.equal(meta.icc, undefined);
    assert.equal(meta.orientation, undefined);
    // Rotated 90° clockwise: the red left half is now on top.
    const [r, , b] = [...(await sharp(out.jpeg).extract({ left: 5, top: 5, width: 1, height: 1 }).raw().toBuffer())];
    assert.ok(r! > 200 && b! < 50);
    assert.equal(Buffer.compare((await processImage(input)).jpeg, out.jpeg), 0);
  });

  test("cắt theo tỉ lệ của ảnh đã xoay; ảnh nhỏ không phóng to; nền trong suốt thành trắng", async () => {
    const input = await sourceJpeg(1200, 900);
    const cropped = await processImage(input, { left: 0.5, top: 0, width: 0.5, height: 1 });
    assert.deepEqual([cropped.width, cropped.height, cropped.changes], [600, 900, ["cropped"]]);
    const [r, , b] = [...(await sharp(cropped.jpeg).extract({ left: 5, top: 5, width: 1, height: 1 }).raw().toBuffer())];
    assert.ok(b! > 200 && r! < 50, "nửa phải màu xanh");
    const png = await sharp({ create: { width: 80, height: 60, channels: 4, background: { r: 0, g: 0, b: 0, alpha: 0 } } }).png().toBuffer();
    const flat = await processImage(png);
    assert.deepEqual([flat.width, flat.height, flat.changes], [80, 60, []]);
    assert.deepEqual([...(await sharp(flat.jpeg).extract({ left: 1, top: 1, width: 1, height: 1 }).raw().toBuffer())], [255, 255, 255]);
    assert.deepEqual(cropRect({ left: 0.99, top: 0.99, width: 0.5, height: 0.5 }, 100, 100), { left: 99, top: 99, width: 1, height: 1 });
    await assert.rejects(processImage(Buffer.from("not an image")));
  });
});

// ---------- images fetch ----------

describe("images fetch (API giả, ảnh sinh bằng sharp)", () => {
  let root: string;
  let seaJpeg: Buffer;
  let riverJpeg: Buffer;
  let lakePng: Buffer;
  const SEA_THUMB = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Blue_sea_horizon.jpg/1280px-Blue_sea_horizon.jpg";
  const LAKE_ID = "77777777-7777-4777-8777-777777777777";
  const LAKE_PICK: Picked = {
    source: "Openverse/Wikimedia Commons",
    openverse_id: LAKE_ID,
    source_url: "https://commons.wikimedia.org/wiki/File:Calm_lake_with_trees.jpg",
    file_url: "https://upload.wikimedia.org/wikipedia/commons/a/a2/Calm_lake_with_trees.jpg",
    title: "Calm lake & trees",
    author: "Example Author B",
    license: "CC BY 4.0",
    license_url: "https://creativecommons.org/licenses/by/4.0/",
  };
  const commonsPage = (title: string, url: string, width: number, height: number, meta: Record<string, string>, thumb?: string) => ({
    batchcomplete: true,
    query: {
      pages: [
        {
          pageid: 1,
          ns: 6,
          title,
          imagerepository: "local",
          imageinfo: [{ ...(thumb ? { thumburl: thumb, thumbwidth: 1280, thumbheight: Math.round((1280 * height) / width) } : { thumburl: url }), url, descriptionurl: `https://commons.wikimedia.org/wiki/${title.replace(/ /g, "_")}`, width, height, mime: "image/jpeg", extmetadata: Object.fromEntries(Object.entries(meta).map(([k, v]) => [k, { value: v }])) }],
        },
      ],
    },
  });
  const seaPage = (meta: Record<string, string> = { ObjectName: "Blue sea horizon", Artist: "Example Author A", LicenseShortName: "CC0", License: "cc0" }, url = COMMONS_PICK.file_url) =>
    commonsPage("File:Blue sea horizon.jpg", url, 4000, 3000, meta, SEA_THUMB);
  const lakePage = (meta: Record<string, string> = { Artist: "Example Author B", LicenseShortName: "CC BY 4.0", License: "cc-by-4.0", LicenseUrl: "https://creativecommons.org/licenses/by/4.0/" }) =>
    commonsPage("File:Calm lake with trees.jpg", LAKE_PICK.file_url, 1200, 900, meta);
  const riverRecord = (edit: Record<string, unknown> = {}) => ({ ...OPENVERSE_SEARCH.results[1], ...edit });
  const lakeRecord = (edit: Record<string, unknown> = {}) => ({
    ...OPENVERSE_SEARCH.results[6],
    id: LAKE_ID,
    title: "Calm lake &amp; trees",
    creator: "Example Author B",
    license: "by",
    license_version: "4.0",
    license_url: "https://creativecommons.org/licenses/by/4.0/",
    foreign_landing_url: LAKE_PICK.source_url,
    url: LAKE_PICK.file_url,
    ...edit,
  });

  type Answers = { sea?: unknown; lake?: unknown; river?: unknown; lakeRecord?: unknown; riverType?: string };
  const handlerFor = (answers: Answers = {}) => (url: string) => {
    if (url === commonsFileInfoUrl("File:Blue sea horizon.jpg")) return jsonResponse(url, answers.sea ?? seaPage());
    if (url === commonsFileInfoUrl("File:Calm lake with trees.jpg")) return jsonResponse(url, answers.lake ?? lakePage());
    if (url === openverseDetailUrl(FLICKR_PICK.openverse_id!)) return jsonResponse(url, answers.river ?? riverRecord());
    if (url === openverseDetailUrl(LAKE_ID)) return jsonResponse(url, answers.lakeRecord ?? lakeRecord());
    if (url === SEA_THUMB) return imageResponse(url, seaJpeg);
    if (url === FLICKR_PICK.file_url) return imageResponse(url, riverJpeg, answers.riverType ?? "image/jpeg");
    if (url === LAKE_PICK.file_url) return imageResponse(url, lakePng, "image/png");
    return undefined;
  };

  before(async () => {
    root = mkdtempSync(path.join(tmpdir(), "content-cli-img-fetch-"));
    seaJpeg = await sourceJpeg(3000, 2000, 6);
    riverJpeg = await sourceJpeg(1200, 900);
    lakePng = await sharp({ create: { width: 800, height: 600, channels: 4, background: { r: 10, g: 120, b: 40, alpha: 0.5 } } }).png().toBuffer();
  });
  after(() => rmSync(root, { recursive: true, force: true }));

  const writeSelection = (name: string, images: Record<string, unknown>) => {
    const file = path.join(root, name, "images", "discoverer", "t", "lesson.json");
    mkdirSync(path.dirname(file), { recursive: true });
    writeFileSync(file, `${JSON.stringify({ images }, null, 2)}\n`);
    return file;
  };
  const fetchRun = (name: string, inputs: string[], http: Http, extra: Partial<Parameters<typeof runImagesFetch>[0]> = {}) =>
    quiet(() =>
      runImagesFetch({
        inputs,
        cacheDir: path.join(root, name, "cache"),
        force: false,
        http,
        sleep: noSleep,
        quotaFile: path.join(root, name, "quota.json"),
        display: (file) => path.relative(root, file),
        now: () => new Date("2026-11-09T10:00:00.000Z"),
        ...extra,
      }),
    );
  const ALL = { "tray.tray_sea": COMMONS_PICK, "q1.q1_sea": { same_as: "tray.tray_sea" }, "tray.tray_river": { ...FLICKR_PICK, crop: { left: 0.5, top: 0, width: 0.5, height: 1 } }, "tray.tray_lake": LAKE_PICK };

  test("kiểm giấy phép ở nguồn, tải, xử lý, ghi cache + index.json; same_as không tải thêm", async () => {
    const file = writeSelection("ok", ALL);
    const { http, calls } = fakeHttp(handlerFor());
    const { result, out } = await fetchRun("ok", [path.join(root, "ok", "images")], http);
    assert.equal(result, 0, out);
    assert.deepEqual(calls, [
      commonsFileInfoUrl("File:Blue sea horizon.jpg"),
      SEA_THUMB,
      openverseDetailUrl(FLICKR_PICK.openverse_id!),
      FLICKR_PICK.file_url,
      openverseDetailUrl(LAKE_ID),
      commonsFileInfoUrl("File:Calm lake with trees.jpg"),
      LAKE_PICK.file_url,
    ]);
    const cache = new ImageCache(path.join(root, "ok", "cache"));
    assert.equal(cache.size, 3);
    const sea = cache.usable(imageCacheKey(COMMONS_PICK)) as SourceEntry;
    const river = cache.usable(imageCacheKey(ALL["tray.tray_river"])) as SourceEntry;
    const lake = cache.usable(imageCacheKey(LAKE_PICK)) as SourceEntry;
    for (const entry of [sea, river, lake]) {
      const bytes = readFileSync(cache.filePath(entry));
      assert.equal(sha256Bytes(bytes), entry.sha256);
      assert.equal(entry.file, `${entry.sha256}.jpg`);
      assert.ok(Math.max(entry.width, entry.height) <= 1024);
      const meta = await sharp(bytes).metadata();
      assert.deepEqual([meta.format, meta.width, meta.height, meta.exif], ["jpeg", entry.width, entry.height, undefined]);
    }
    assert.deepEqual(sea.credit, { title: "Blue sea horizon", author: "Example Author A", license: "CC0 1.0", license_url: CC0_URL, source: "Wikimedia Commons", source_url: COMMONS_PICK.source_url });
    assert.deepEqual([sea.width, sea.height, sea.changes, sea.downloaded_url], [683, 1024, ["resized"], SEA_THUMB]);
    assert.deepEqual(sea.verified.via, ["Wikimedia Commons API (extmetadata)"]);
    assert.equal(sea.fetched_at, "2026-11-09T10:00:00.000Z");
    assert.deepEqual([river.width, river.height, river.changes], [600, 900, ["cropped"]]);
    assert.deepEqual(river.verified.via, ["Openverse API (detail)"]);
    assert.deepEqual(lake.changes, []);
    assert.deepEqual(lake.verified.via, ["Openverse API (detail)", "Wikimedia Commons API (extmetadata)"]);
    assert.match(out, /Kiểm tay: https:\/\/www\.flickr\.com\/photos\/example\/9002 \(Openverse\/Flickr\)/);
    assert.match(out, /3 ảnh khác nhau · 3 tải mới · 0 đã có · 0 lỗi/);
    assert.equal(new DailyQuota(path.join(root, "ok", "quota.json")).used(), 2);
    assert.ok(existsSync(file));

    // Again: nothing to do. --force: checked and downloaded again.
    const again = fakeHttp(handlerFor());
    const second = await fetchRun("ok", [file], again.http);
    assert.equal(second.result, 0);
    assert.deepEqual(again.calls, []);
    assert.match(second.out, /0 tải mới · 3 đã có/);
    const forced = fakeHttp(handlerFor());
    assert.equal((await fetchRun("ok", [file], forced.http, { force: true })).result, 0);
    assert.equal(forced.calls.length, 7);
  });

  test("giấy phép ở Commons đổi thành BY-SA: lỗi, không tải, không vào cache", async () => {
    const file = writeSelection("sa", { "tray.tray_sea": COMMONS_PICK });
    const { http, calls } = fakeHttp(handlerFor({ sea: seaPage({ Artist: "Example Author A", LicenseShortName: "CC BY-SA 4.0", License: "cc-by-sa-4.0" }) }));
    const { result, out } = await fetchRun("sa", [file], http);
    assert.equal(result, 1);
    assert.match(out, /tray\.tray_sea: KHÔNG DÙNG, Commons nay ghi: giấy phép CC BY-SA 4\.0/);
    assert.ok(!calls.includes(SEA_THUMB));
    assert.equal(new ImageCache(path.join(root, "sa", "cache")).size, 0);
  });

  test("lệch với nguồn: giấy phép khác, file_url khác, hạn chế personality, Openverse đổi giấy phép, không phải ảnh", async () => {
    const cases: [string, Record<string, unknown>, Answers, RegExp][] = [
      ["lic", { a: { ...COMMONS_PICK, license: "CC BY 4.0", license_url: "https://creativecommons.org/licenses/by/4.0/" } }, {}, /giấy phép ở Commons là CC0 1\.0, file chọn ghi CC BY 4\.0/],
      ["url", { a: COMMONS_PICK }, { sea: seaPage(undefined, "https://upload.wikimedia.org/wikipedia/commons/b/b1/Blue_sea_horizon.jpg") }, /file_url khác URL file trên Commons/],
      ["restrict", { a: LAKE_PICK }, { lake: lakePage({ Artist: "Example Author B", LicenseShortName: "CC BY 4.0", License: "cc-by-4.0", LicenseUrl: "https://creativecommons.org/licenses/by/4.0/", Restrictions: "personality" }) }, /Commons nay ghi: Commons ghi hạn chế "personality"/],
      ["ov-sa", { a: FLICKR_PICK }, { river: riverRecord({ license: "by-sa" }) }, /Openverse nay ghi: giấy phép Openverse "by-sa 2\.0"/],
      ["ov-url", { a: FLICKR_PICK }, { river: riverRecord({ url: "https://live.staticflickr.com/65535/other.jpg" }) }, /file_url khác url trên Openverse/],
      ["html", { a: FLICKR_PICK }, { riverType: "text/html" }, /trả về text\/html, không phải ảnh/],
    ];
    for (const [name, images, answers, expected] of cases) {
      const file = writeSelection(name, images);
      const { http } = fakeHttp(handlerFor(answers));
      const { result, out } = await fetchRun(name, [file], http);
      assert.equal(result, 1, `${name}\n${out}`);
      assert.match(out, expected, name);
      assert.equal(new ImageCache(path.join(root, name, "cache")).size, 0, name);
    }
  });

  test("tác giả khác nguồn: vẫn dùng, in cảnh báo; hết lượt Openverse: lỗi riêng ảnh Openverse", async () => {
    const author = writeSelection("author", { a: { ...COMMONS_PICK, author: "Example A" } });
    const named = await fetchRun("author", [author], fakeHttp(handlerFor()).http);
    assert.equal(named.result, 0);
    assert.match(named.out, /cảnh báo: tác giả ở Commons: "Example Author A" \(file chọn ghi "Example A"\)/);

    const file = writeSelection("quota", { sea: COMMONS_PICK, river: FLICKR_PICK });
    mkdirSync(path.join(root, "quota"), { recursive: true });
    writeFileSync(path.join(root, "quota", "quota.json"), JSON.stringify({ date: new Date().toISOString().slice(0, 10), count: 190 }));
    const { result, out } = await fetchRun("quota", [file], fakeHttp(handlerFor()).http);
    assert.equal(result, 1);
    assert.match(out, /river: KHÔNG DÙNG, hết 190 lượt Openverse hôm nay/);
    assert.equal(new ImageCache(path.join(root, "quota", "cache")).size, 1);
  });

  test("CC BY phải giữ title của nguồn; CC0 được đặt title trung tính", async () => {
    const renamedBy = writeSelection("title-by", { a: { ...FLICKR_PICK, title: "Sông quê" } });
    const by = await fetchRun("title-by", [renamedBy], fakeHttp(handlerFor()).http);
    assert.equal(by.result, 1);
    assert.match(by.out, /CC BY 2\.0: title phải giữ như nguồn ghi \("River & boat"\)/);
    const renamedCc0 = writeSelection("title-cc0", { a: { ...COMMONS_PICK, title: "Biển Đông" } });
    const cc0 = await fetchRun("title-cc0", [renamedCc0], fakeHttp(handlerFor()).http);
    assert.equal(cc0.result, 0, cc0.out);
    assert.equal(new ImageCache(path.join(root, "title-cc0", "cache")).usable(imageCacheKey(COMMONS_PICK))!.credit.title, "Biển Đông");
  });

  test("same_as sang bài khác: fetch một file cũng tải ảnh gốc của bài kia", async () => {
    const images = path.join(root, "cross", "images");
    const fileA = selectionFileFor(images, "discoverer", "t", "bai-mot");
    const fileB = selectionFileFor(images, "discoverer", "t", "bai-hai");
    mkdirSync(path.dirname(fileA), { recursive: true });
    writeFileSync(fileA, JSON.stringify({ images: { "tray.tray_sea": COMMONS_PICK } }));
    writeFileSync(fileB, JSON.stringify({ images: { "q2.q2_sea": { same_as: "tray_sea", lesson: "t/bai-mot" }, "q3.q3_x": { same_as: "q", lesson: "t/khong-co" } } }));
    const { http, calls } = fakeHttp(handlerFor());
    const { result, out } = await fetchRun("cross", [fileB], http);
    assert.equal(result, 1, "q3_x trỏ tới bài không có file");
    assert.match(out, /q2\.q2_sea \(dùng lại t\/bai-mot tray\.tray_sea\): OK/);
    assert.match(out, /\/images\/q3\.q3_x same_as trỏ tới bài t\/khong-co nhưng chưa có/);
    assert.ok(calls.includes(SEA_THUMB));
    assert.ok(new ImageCache(path.join(root, "cross", "cache")).usable(imageCacheKey(COMMONS_PICK)));
  });

  test("file chọn ảnh sai, cùng file ảnh mà ghi credit khác, đường dẫn không có: exit 1", async () => {
    const bad = writeSelection("bad", { a: { ...COMMONS_PICK, license: "CC BY-SA 4.0" } });
    let run = await fetchRun("bad", [bad], fakeHttp(() => undefined).http);
    assert.equal(run.result, 1);
    assert.match(run.out, /lesson\.json \/images\/a\/license /);
    const clash = writeSelection("clash", { a: COMMONS_PICK, b: { ...COMMONS_PICK, author: "Someone Else" } });
    run = await fetchRun("clash", [clash], fakeHttp(handlerFor()).http);
    assert.equal(run.result, 1);
    assert.match(run.out, /cùng file ảnh với .* a nhưng ghi nguồn hoặc giấy phép khác/);
    run = await fetchRun("none", [path.join(root, "khong-co.json")], fakeHttp(() => undefined).http);
    assert.equal(run.result, 1);
    assert.match(run.out, /khong-co\.json \/ không tìm thấy file/);
  });

  test("Commons: tải bản 1280 px (thumburl), không tải file gốc; crop áp trên bản thu nhỏ; Openverse trỏ về Commons cũng lấy bản 1280; upload.wikimedia.org cách nhau ≥ 3 s", async () => {
    const thumbJpeg = await sourceJpeg(1280, 960); // what Commons serves at 1280px- for the 4000 × 3000 original
    const LAKE_THUMB = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Calm_lake_with_trees.jpg/1280px-Calm_lake_with_trees.jpg";
    const bigLake = commonsPage("File:Calm lake with trees.jpg", LAKE_PICK.file_url, 5000, 3750, { Artist: "Example Author B", LicenseShortName: "CC BY 4.0", License: "cc-by-4.0", LicenseUrl: "https://creativecommons.org/licenses/by/4.0/" }, LAKE_THUMB);
    const crop = { left: 0.5, top: 0, width: 0.5, height: 1 };
    const file = writeSelection("thumb", { "tray.tray_half": { ...COMMONS_PICK, crop }, "tray.tray_sea": COMMONS_PICK, "tray.tray_lake": LAKE_PICK });
    const base = handlerFor({ lake: bigLake });
    const { http, calls } = fakeHttp((url) => (url === SEA_THUMB ? imageResponse(url, thumbJpeg) : url === LAKE_THUMB ? imageResponse(url, lakePng, "image/png") : base(url)));
    const sleeps: number[] = [];
    const { result, out } = await fetchRun("thumb", [file], http, { sleep: async (ms) => void sleeps.push(ms) });
    assert.equal(result, 0, out);
    assert.ok(calls.every((url) => /api\.php|api\.openverse\.org|\/thumb\//.test(url)), `chỉ API và bản thu nhỏ:\n${calls.join("\n")}`);
    assert.ok(!calls.includes(COMMONS_PICK.file_url) && !calls.includes(LAKE_PICK.file_url));
    for (const url of calls.filter((url) => url.includes("api.php"))) assert.match(url, /iiurlwidth=1280/);

    const cache = new ImageCache(path.join(root, "thumb", "cache"));
    const half = cache.usable(imageCacheKey({ ...COMMONS_PICK, crop })) as SourceEntry;
    const whole = cache.usable(imageCacheKey(COMMONS_PICK)) as SourceEntry;
    const lake = cache.usable(imageCacheKey(LAKE_PICK)) as SourceEntry;
    // Crop is a fraction: the right half of the 1280 × 960 copy, same part of the picture as on the original.
    assert.deepEqual([half.width, half.height, half.changes, half.downloaded_url], [640, 960, ["cropped"], SEA_THUMB]);
    assert.deepEqual(half.original, { width: 1280, height: 960, format: "jpeg", bytes: thumbJpeg.length });
    const [r, , b] = [...(await sharp(cache.filePath(half)).extract({ left: 5, top: 5, width: 1, height: 1 }).raw().toBuffer())];
    assert.ok(b! > 200 && r! < 50, "nửa phải màu xanh");
    assert.deepEqual([whole.width, whole.height, whole.changes], [1024, 768, ["resized"]]);
    assert.equal(lake.downloaded_url, LAKE_THUMB);
    assert.deepEqual(lake.verified.via, ["Openverse API (detail)", "Wikimedia Commons API (extmetadata)"]);
    // Three downloads from upload.wikimedia.org: the 2nd and 3rd wait for the 3 s gap (minus the few ms of processing).
    assert.equal(sleeps.filter((ms) => ms > 2000 && ms <= 3000).length, 2, sleeps.join(", "));
  });

  test("429/503: chờ Retry-After (hoặc backoff) rồi thử lại; hết lượt thử thì KHÔNG DÙNG như cũ", async () => {
    const thumbJpeg = await sourceJpeg(1280, 960);
    const file = writeSelection("retry", { "tray.tray_sea": COMMONS_PICK });
    const infoUrl = commonsFileInfoUrl("File:Blue sea horizon.jpg");
    let info = 0;
    let downloads = 0;
    const flaky = fakeHttp((url) => {
      if (url === infoUrl && info++ === 0) return statusResponse(url, 503);
      if (url === SEA_THUMB) return downloads++ === 0 ? statusResponse(url, 429, "7") : imageResponse(url, thumbJpeg);
      return handlerFor()(url);
    });
    const sleeps: number[] = [];
    const ok = await fetchRun("retry", [file], flaky.http, { sleep: async (ms) => void sleeps.push(ms) });
    assert.equal(ok.result, 0, ok.out);
    assert.deepEqual(flaky.calls, [infoUrl, infoUrl, SEA_THUMB, SEA_THUMB]);
    assert.ok(sleeps.includes(5000), `503 không Retry-After: backoff 5 s (${sleeps.join(", ")})`);
    assert.ok(sleeps.includes(7000), `429 Retry-After 7: chờ 7 s (${sleeps.join(", ")})`);
    assert.match(ok.out, /HTTP 503 ở commons\.wikimedia\.org: chờ 5 s rồi thử lại \(lần 1\/3\)/);
    assert.match(ok.out, /HTTP 429 ở upload\.wikimedia\.org, Retry-After 7 s: chờ 7 s rồi thử lại \(lần 1\/3\)/);
    assert.match(ok.out, /tray\.tray_sea: OK /);

    const stuck = writeSelection("stuck", { "tray.tray_sea": COMMONS_PICK });
    const always = fakeHttp((url) => (url === SEA_THUMB ? statusResponse(url, 429, "Tue, 10 Nov 2026 04:00:30 GMT") : handlerFor()(url)));
    const waits: number[] = [];
    const failed = await fetchRun("stuck", [stuck], always.http, { sleep: async (ms) => void waits.push(ms), now: () => new Date("2026-11-10T04:00:00.000Z") });
    assert.equal(failed.result, 1);
    assert.equal(always.calls.filter((url) => url === SEA_THUMB).length, 4, "1 lượt đầu + 3 lượt thử lại");
    assert.deepEqual(waits.filter((ms) => ms >= 5000), [30_000, 30_000, 45_000], "Retry-After 30 s theo ngày giờ; lượt ba backoff 45 s lớn hơn");
    assert.match(failed.out, /HTTP 429 ở upload\.wikimedia\.org: đã thử lại 3 lần, bỏ/);
    assert.match(failed.out, /tray\.tray_sea: KHÔNG DÙNG, lỗi: HTTP 429 khi tải https:\/\/upload\.wikimedia\.org\/wikipedia\/commons\/thumb\/a\/a1\/Blue_sea_horizon\.jpg\/1280px-Blue_sea_horizon\.jpg/);
    assert.match(failed.out, /0 tải mới · 0 đã có · 1 lỗi/);
    assert.equal(new ImageCache(path.join(root, "stuck", "cache")).size, 0);
  });

  const TIMELINE = (title = "Sea and river", parts: unknown[] = [{ same_as: "tray_sea" }, FLICKR_PICK]) => ({ composed: { file: "content/images/composed/t/timeline.jpg", parts }, title });

  test("hình ghép: kiểm và tải ảnh thành phần trước; chưa có file thì chờ ghép (exit 0); có file thì xử lý vào cache, credit có từng phần", async () => {
    const file = writeSelection("composed", { "tray.tray_sea": COMMONS_PICK, "learn.explore.timeline": TIMELINE(), q2: { same_as: "timeline" } });
    const composedPath = path.join(root, "composed", "images", "composed", "t", "timeline.jpg");
    const first = fakeHttp(handlerFor());
    let run = await fetchRun("composed", [file], first.http);
    assert.equal(run.result, 0, run.out);
    assert.deepEqual(first.calls, [commonsFileInfoUrl("File:Blue sea horizon.jpg"), SEA_THUMB, openverseDetailUrl(FLICKR_PICK.openverse_id!), FLICKR_PICK.file_url]);
    const cacheDir = path.join(root, "composed", "cache");
    let cache = new ImageCache(cacheDir);
    assert.equal(cache.size, 2);
    const sea = cache.usable(imageCacheKey(COMMONS_PICK))!;
    const river = cache.usable(imageCacheKey(FLICKR_PICK))!;
    assert.match(run.out, /lesson\.json learn\.explore\.timeline phần 2: OK/);
    assert.match(run.out, /learn\.explore\.timeline: chờ ghép, chưa có composed\/images\/composed\/t\/timeline\.jpg\. Ảnh thành phần đã kiểm giấy phép:/);
    assert.ok(run.out.includes(`  1. composed/cache/${sea.file} · Blue sea horizon · CC0 1.0\n  2. composed/cache/${river.file} · River & boat · CC BY 2.0`), run.out);
    assert.match(run.out, /Hình ghép: 1 · 0 xử lý mới · 0 đã có · 1 chờ ghép/);
    assert.match(run.out, /Hình chờ ghép: designer ghép/);

    // The designer saves a big JPEG with EXIF: fetch processes it again (≤ 1024 px, no metadata) and says so.
    mkdirSync(path.dirname(composedPath), { recursive: true });
    writeFileSync(composedPath, await sourceJpeg(2000, 1000, 1));
    const second = fakeHttp(() => undefined);
    run = await fetchRun("composed", [file], second.http);
    assert.equal(run.result, 0, run.out);
    assert.deepEqual(second.calls, [], "ảnh thành phần đã có: không gọi mạng");
    assert.match(run.out, /lesson\.json learn\.explore\.timeline: OK hình ghép [0-9a-f]{12}… 1024×512 · CC BY 2\.0 · 2 ảnh thành phần/);
    assert.match(run.out, /lưu ý: file ghép 2000×1000, cạnh dài hơn 1024 px; file ghép còn metadata/);
    cache = new ImageCache(cacheDir);
    assert.equal(cache.size, 3);
    const entry = cache.usable(composedCacheKey(sha256Bytes(readFileSync(composedPath)))) as ComposedEntry;
    assert.deepEqual(entry.credit, { title: "Sea and river", author: "Science Kids", license: "CC BY 2.0", license_url: FLICKR_PICK.license_url, source: "composed", parts: [creditOf(COMMONS_PICK), creditOf(FLICKR_PICK)] });
    assert.deepEqual(entry.changes, ["composed", "resized"]);
    assert.deepEqual(entry.composed.parts.map((part) => part.sha256), [sea.sha256, river.sha256]);
    assert.equal(entry.composed.file, "content/images/composed/t/timeline.jpg");
    assert.equal(entry.composed.file_sha256, sha256Bytes(readFileSync(composedPath)));
    const bytes = readFileSync(cache.filePath(entry));
    assert.equal(sha256Bytes(bytes), entry.sha256);
    const meta = await sharp(bytes).metadata();
    assert.deepEqual([meta.format, meta.width, meta.height, meta.exif, meta.icc], ["jpeg", 1024, 512, undefined, undefined]);
    assert.match(readFileSync(path.join(cacheDir, "index.json"), "utf8"), /"parts": \[/);

    // Again: nothing to do. A new title: processed again (credit), still no network.
    run = await fetchRun("composed", [file], fakeHttp(() => undefined).http);
    assert.match(run.out, /đã có hình ghép/);
    assert.match(run.out, /Hình ghép: 1 · 0 xử lý mới · 1 đã có · 0 chờ ghép/);
    writeSelection("composed", { "tray.tray_sea": COMMONS_PICK, "learn.explore.timeline": TIMELINE("Biển và sông") });
    run = await fetchRun("composed", [file], fakeHttp(() => undefined).http);
    assert.equal(run.result, 0, run.out);
    assert.match(run.out, /OK hình ghép/);
    assert.equal((new ImageCache(cacheDir).usable(composedCacheKey(sha256Bytes(readFileSync(composedPath)))) as ComposedEntry).credit.title, "Biển và sông");
  });

  test("hình ghép: ảnh thành phần không hợp giấy phép thì hình ghép KHÔNG DÙNG, exit 1; cùng file ghép mà khác title hoặc parts: lỗi", async () => {
    const file = writeSelection("composed-sa", { "learn.explore.timeline": TIMELINE("Sea and river", [COMMONS_PICK, FLICKR_PICK]) });
    const composedPath = path.join(root, "composed-sa", "images", "composed", "t", "timeline.jpg");
    mkdirSync(path.dirname(composedPath), { recursive: true });
    writeFileSync(composedPath, await sourceJpeg(800, 600));
    const { http } = fakeHttp(handlerFor({ sea: seaPage({ Artist: "Example Author A", LicenseShortName: "CC BY-SA 4.0", License: "cc-by-sa-4.0" }) }));
    let run = await fetchRun("composed-sa", [file], http);
    assert.equal(run.result, 1);
    assert.match(run.out, /timeline phần 1: KHÔNG DÙNG, Commons nay ghi: giấy phép CC BY-SA 4\.0/);
    assert.match(run.out, /learn\.explore\.timeline: KHÔNG DÙNG hình ghép composed-sa\/images\/composed\/t\/timeline\.jpg, 1 ảnh thành phần chưa dùng được \("Blue sea horizon"/);
    const cache = new ImageCache(path.join(root, "composed-sa", "cache"));
    assert.equal(cache.usable(composedCacheKey(sha256Bytes(readFileSync(composedPath)))), undefined);
    assert.equal(cache.size, 1, "chỉ ảnh sông");

    const clash = writeSelection("composed-clash", { a: TIMELINE("A", [COMMONS_PICK]), b: TIMELINE("B", [COMMONS_PICK]) });
    run = await fetchRun("composed-clash", [clash], fakeHttp(handlerFor()).http);
    assert.equal(run.result, 1);
    assert.match(run.out, /\/images\/b cùng file ghép content\/images\/composed\/t\/timeline\.jpg với .* a nhưng khác title hoặc ảnh thành phần/);
    const nested = writeSelection("composed-nested", { a: TIMELINE("A", [COMMONS_PICK]), b: TIMELINE("B", [{ same_as: "a" }, { same_as: "nothing", lesson: "t/khong-co" }]) });
    run = await fetchRun("composed-nested", [nested], fakeHttp(handlerFor()).http);
    assert.equal(run.result, 1);
    assert.match(run.out, /\/images\/b hình ghép b phần 2: same_as trỏ tới bài t\/khong-co nhưng chưa có/);
  });

  const OWN_GLOBE = (title = "Plastic globe on a desk"): Own => ({ own: { file: "content/images/own/t/globe.jpg", method: "drawn" }, title });
  const ownPathOf = (name: string, file = "globe.jpg") => path.join(root, name, "images", "own", "t", file);

  test("hình tự vẽ (dev 10/11): chưa có file thì KHÔNG DÙNG, exit 1; có file thì xử lý vào cache (credit Science Kids, changes drawn), không gọi mạng", async () => {
    const file = writeSelection("own", { "tray.tray_globe": OWN_GLOBE(), q2: { same_as: "tray_globe" } });
    let run = await fetchRun("own", [file], fakeHttp(() => undefined).http);
    assert.equal(run.result, 1, run.out);
    assert.match(run.out, /lesson\.json tray\.tray_globe: KHÔNG DÙNG hình tự vẽ, chưa có file own\/images\/own\/t\/globe\.jpg/);
    assert.match(run.out, /Hình tự vẽ: 1 · 0 xử lý mới · 0 đã có/);

    // The designer exports a big PNG with transparency: processed to the contract, with a note.
    const ownPath = ownPathOf("own");
    mkdirSync(path.dirname(ownPath), { recursive: true });
    writeFileSync(ownPath, await sharp({ create: { width: 1600, height: 1200, channels: 4, background: { r: 30, g: 90, b: 200, alpha: 0.5 } } }).png().toBuffer());
    const { http, calls } = fakeHttp(() => undefined);
    run = await fetchRun("own", [file], http);
    assert.equal(run.result, 0, run.out);
    assert.deepEqual(calls, [], "không gọi mạng");
    assert.match(run.out, /lesson\.json tray\.tray_globe: OK hình tự vẽ [0-9a-f]{12}… 1024×768 · Science Kids · drawn/);
    assert.match(run.out, /lưu ý: file tự vẽ là png, không phải JPEG; file tự vẽ 1600×1200, cạnh dài hơn 1024 px/);
    const cacheDir = path.join(root, "own", "cache");
    const cache = new ImageCache(cacheDir);
    assert.equal(cache.size, 1);
    const entry = cache.usable(ownCacheKey("content/images/own/t/globe.jpg", sha256Bytes(readFileSync(ownPath)))) as OwnEntry;
    assert.deepEqual(entry.credit, { title: "Plastic globe on a desk", author: "Science Kids", license: "Science Kids", license_url: "", source: "Science Kids" });
    assert.deepEqual(entry.changes, ["drawn"]);
    assert.deepEqual([entry.own.file, entry.own.method, entry.own.file_sha256], ["content/images/own/t/globe.jpg", "drawn", sha256Bytes(readFileSync(ownPath))]);
    assert.deepEqual(entry.own.original, { width: 1600, height: 1200, format: "png", bytes: readFileSync(ownPath).length });
    const bytes = readFileSync(cache.filePath(entry));
    assert.equal(sha256Bytes(bytes), entry.sha256);
    const meta = await sharp(bytes).metadata();
    assert.deepEqual([meta.format, meta.width, meta.height, meta.hasAlpha, meta.exif, meta.icc], ["jpeg", 1024, 768, false, undefined, undefined]);

    // Again: nothing to do. A new title: processed again. Same file under two titles: error.
    run = await fetchRun("own", [file], fakeHttp(() => undefined).http);
    assert.match(run.out, /đã có hình tự vẽ/);
    writeSelection("own", { "tray.tray_globe": OWN_GLOBE("Globe") });
    run = await fetchRun("own", [file], fakeHttp(() => undefined).http);
    assert.equal(run.result, 0, run.out);
    assert.match(run.out, /OK hình tự vẽ/);
    assert.equal((new ImageCache(cacheDir).usable(ownCacheKey("content/images/own/t/globe.jpg", sha256Bytes(readFileSync(ownPath)))) as OwnEntry).credit.title, "Globe");
    writeSelection("own", { "tray.tray_globe": OWN_GLOBE("A"), q2: OWN_GLOBE("B") });
    run = await fetchRun("own", [file], fakeHttp(() => undefined).http);
    assert.equal(run.result, 1);
    assert.match(run.out, /\/images\/q2 cùng file tự vẽ content\/images\/own\/t\/globe\.jpg với .* tray\.tray_globe nhưng khác title hoặc method/);
    // Not a picture at all: KHÔNG DÙNG, not cached.
    writeSelection("own", { "tray.tray_globe": OWN_GLOBE("Globe") });
    writeFileSync(ownPath, "not a picture");
    run = await fetchRun("own", [file], fakeHttp(() => undefined).http);
    assert.equal(run.result, 1);
    assert.match(run.out, /KHÔNG DÙNG hình tự vẽ own\/images\/own\/t\/globe\.jpg, lỗi: /);
  });

  test("hình ghép có phần tự vẽ: hình tự vẽ xử lý trước, rồi ảnh nguồn tải về, rồi file ghép; credit có phần tự vẽ; thiếu file tự vẽ thì hình ghép KHÔNG DÙNG", async () => {
    const file = writeSelection("own-composed", { "tray.tray_globe": OWN_GLOBE(), "learn.explore.timeline": TIMELINE("Globe and sea", [{ same_as: "tray_globe" }, COMMONS_PICK]) });
    const composedPath = path.join(root, "own-composed", "images", "composed", "t", "timeline.jpg");
    mkdirSync(path.dirname(composedPath), { recursive: true });
    writeFileSync(composedPath, await sourceJpeg(800, 400));
    let run = await fetchRun("own-composed", [file], fakeHttp(handlerFor()).http);
    assert.equal(run.result, 1);
    assert.match(run.out, /KHÔNG DÙNG hình tự vẽ, chưa có file/);
    assert.match(run.out, /learn\.explore\.timeline: KHÔNG DÙNG hình ghép .*timeline\.jpg, 1 ảnh thành phần chưa dùng được \("Plastic globe on a desk"/);

    const ownPath = ownPathOf("own-composed");
    mkdirSync(path.dirname(ownPath), { recursive: true });
    writeFileSync(ownPath, await sourceJpeg(600, 600));
    run = await fetchRun("own-composed", [file], fakeHttp(handlerFor()).http);
    assert.equal(run.result, 0, run.out);
    assert.match(run.out, /OK hình ghép [0-9a-f]{12}… 800×400 · Science Kids · 2 ảnh thành phần/);
    const cache = new ImageCache(path.join(root, "own-composed", "cache"));
    const own = cache.usable(ownCacheKey("content/images/own/t/globe.jpg", sha256Bytes(readFileSync(ownPath))))!;
    const entry = cache.usable(composedCacheKey(sha256Bytes(readFileSync(composedPath)))) as ComposedEntry;
    assert.deepEqual(entry.credit, { title: "Globe and sea", author: "Science Kids", license: "Science Kids", license_url: "", source: "composed", parts: [ownCredit("Plastic globe on a desk"), creditOf(COMMONS_PICK)] });
    assert.deepEqual(entry.composed.parts.map((part) => part.sha256), [own.sha256, cache.usable(imageCacheKey(COMMONS_PICK))!.sha256]);
  });
});
