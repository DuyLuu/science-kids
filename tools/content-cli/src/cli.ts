#!/usr/bin/env node
// content-cli: Science Kids content pipeline (MVP). Commands: validate, import, ids (markdown),
// tts, build, fetch-model. Exit 0 = ok, 1 = content or runtime error, 2 = wrong usage.
// validate, import and ids never load a module of src/tts (no model, no Python, no network).

// .ts runs through Node's type stripping (no build step): needs ^22.18 or >= 23.6.
const [major = 0, minor = 0] = process.versions.node.split(".").map(Number);
if (major < 22 || (major === 22 && minor < 18) || (major === 23 && minor < 6)) {
  console.error(`Cần Node ^22.18.0 hoặc >= 23.6.0 (chạy thẳng file .ts); máy đang có ${process.version}.`);
  process.exit(2);
}

const { parseArgs } = await import("node:util");
const path = await import("node:path");
const { DEFAULT_AUDIO_DIR, DEFAULT_PACK_DIR, DEFAULT_REVIEW_DIR, DEFAULT_RULES_FILE, display } = await import("./paths.ts");
const { parseAppVersion } = await import("./app-version.ts");

/** tts defaults shown in the usage text; loaded only for tts, fetch-model and help. */
async function ttsDefaults() {
  const { DEFAULT_DTYPE } = await import("./tts/kokoro-model.ts");
  const { DEFAULT_VOICE } = await import("./tts/kokoro-en.ts");
  const { DEFAULT_VI_VOICE } = await import("./tts/vieneu-vi.ts");
  return { DEFAULT_DTYPE, DEFAULT_VOICE, DEFAULT_VI_VOICE };
}

/** build, validate: lowest app version for every topic = MARKETING_VERSION of the first iOS test build (SK-005). */
const DEFAULT_MIN_APP_VERSION = "0.1.0";

const MD_USAGE = `Cách dùng (markdown, SK-027):
  node src/cli.ts validate <thư mục hoặc file .md>... [--content-root <thư mục>] [--rules <file>] [--min-app-version <x.y.z>]
  node src/cli.ts import <thư mục hoặc file .md>... [--out <thư mục>] [--content-root <thư mục>] [--rules <file>] [--min-app-version <x.y.z>]
  node src/cli.ts ids <thư mục hoặc file .md>... [--content-root <thư mục>]
  Từ gốc repo: npm --prefix tools/content-cli run validate -- content/discoverer/an-uong-lanh-manh

validate: đọc bài markdown (thư mục: mọi thư mục chủ đề có _topic.md bên trong; bài lẻ: tự lấy _topic.md cùng thư mục),
     kiểm cú pháp, content-schema rồi luật theo nhóm tuổi. Mỗi dòng: <file .md>:<dòng> <JSON pointer> [<mã>] <thông báo>.
     Không ghi gì. Không trộn .md với .json trong một lần gọi (exit 2); file .json thì kiểm như cũ.
import: như validate; không có lỗi thì ghi JSON schema v1 vào --out (mặc định content/.build/json),
     <age_group>/<topic_slug>/topic.json và <nn>-<slug>.json; thư mục của mỗi chủ đề bị thay cả. Có lỗi thì không ghi gì.
ids: điền UUID vào các dòng "id:" còn trống (frontmatter và ngay dưới ###); không đụng id đã có.
  --content-root <dir>  gốc nội dung để kiểm id trùng và tìm prerequisites, recall_from.lesson; mặc định content/
                        (bản chép ngoài content/: thư mục trên <age_group>/ của chủ đề)`;

function usage(defaults: { DEFAULT_DTYPE: string; DEFAULT_VOICE: string; DEFAULT_VI_VOICE: string }) {
  const { DEFAULT_DTYPE, DEFAULT_VOICE, DEFAULT_VI_VOICE } = defaults;
  return `Cách dùng:
  node src/cli.ts validate <thư mục hoặc file .md>... [tuỳ chọn]       (markdown, xem dưới)
  node src/cli.ts import <thư mục hoặc file .md>... [--out <thư mục>]
  node src/cli.ts ids <thư mục hoặc file .md>...
  node src/cli.ts tts <file.json>... --out <thư mục> [tuỳ chọn]
  node src/cli.ts build <topic.json> <lesson.json>... [--out <thư mục>] [tuỳ chọn]
  node src/cli.ts validate <topic.json> <lesson.json>... [--rules <file>] [--min-app-version <x.y.z>]
  node src/cli.ts fetch-model [--dtype fp32|fp16|q8]

${MD_USAGE}

tts: sinh clip cho mọi chuỗi Spoken (en hoặc vi) của các file topic/lesson, ghi bản sao có
     audio.<lang> (sha256 của file m4a) vào --out. Bài lẻ thì đưa kèm topic.json của chủ đề.
     --out được trùng thư mục input khi input là bản sao trong content/.build/ (chạy en rồi vi).
  --out <thư mục>      nơi ghi bản sao JSON (bắt buộc)
  --lang en|vi         thứ tiếng: en = Kokoro, vi = VieNeu-TTS (mặc định en)
  --force              sinh lại mọi clip, bỏ qua cache
  --no-review          không tạo file nghe thử (en: review-<nn>, vi: review-<nn>-vi)
  --cache <thư mục>    cache clip, mặc định content/.audio
  --review-dir <dir>   nơi ghi file nghe thử, mặc định content/.build/tts
  --voice <giọng>      en: giọng Kokoro, mặc định ${DEFAULT_VOICE}; vi: giọng VieNeu, mặc định ${DEFAULT_VI_VOICE}
  --dtype <bản>        en: bản model Kokoro fp32 (mặc định), fp16, q8
  --no-self-check      vi: không chạy bước tự kiểm (evaluate.py) trên clip mới
  --max-variants <n>   vi: số seed khác thử thêm cho clip bị đánh dấu, mặc định 4
  --vi-numbers sgk|nam vi: đọc số kiểu sách giáo khoa (linh, nghìn; mặc định) hay giọng Nam (lẻ, ngàn)
  --check-passes <n>   vi: số lượt máy nghe mỗi clip khi tự kiểm, mặc định 2
  --recheck <chữ>      vi: tìm lại seed cho chuỗi này dù đã có trong cache (lặp lại cờ cho nhiều chuỗi);
                       kết quả ghi vào tts-vi/variants.json, kể cả khi seed gốc vẫn tốt nhất
  --pin-variant <chữ=n[:lý do]>  vi: chọn tay biến thể seed n cho chuỗi này (sau khi nghe), ghi vào variants.json
  --check-all          vi: tự kiểm mọi clip của lần chạy, kể cả clip đã có trong cache (kết quả lưu vào index.json)

build: gói topic + bài (JSON đầu ra của tts, có audio.en, audio.vi) + clip trong cache thành thư mục
     catalog/v1/manifest.json, topics/<topic_id>/<version>/pack.json, assets/<sha256>.m4a.
     Thay toàn bộ --out (chỉ khi --out trống hoặc là gói build trước đó).
  --out <thư mục>      nơi ghi gói, mặc định content/.build/pack
  --cache <thư mục>    cache clip, mặc định content/.audio (chỉ đọc)
  --rules <file>       luật chấm, mặc định content/rules.json
  --min-app-version <x.y.z>  bản app thấp nhất cho mọi chủ đề, mặc định ${DEFAULT_MIN_APP_VERSION}
  --require-lang <en,vi>     thứ tiếng mọi chuỗi Spoken bắt buộc có clip, mặc định en
                             (audio.vi có mặt thì luôn được kiểm và chép vào gói)
     build cũng chạy luật soạn theo nhóm tuổi như validate; có lỗi thì exit 1, không ghi gói.

validate: kiểm file topic/lesson JSON bằng content-schema, rồi luật soạn theo nhóm tuổi
     (rules.<age_group>.authoring của --rules, SK-026). Mỗi dòng: <file> <JSON pointer> [<mã>] <thông báo>.
     Cảnh báo (age_dok_order, age_words_en, format_not_rendered) không làm exit 1. Không ghi gì.
  --rules <file>       luật, mặc định content/rules.json
  --min-app-version <x.y.z>  bản app thấp nhất, mặc định ${DEFAULT_MIN_APP_VERSION} (format_not_rendered)

fetch-model: chỉ tải model Kokoro vào tools/content-cli/.models (tts cũng tự tải khi thiếu).

Exit 0 = xong, 1 = lỗi nội dung hoặc lỗi chạy, 2 = sai cách gọi.`;
}
const fullUsage = async () => usage(await ttsDefaults());

// `npm run tts -- <file>` runs in tools/content-cli; resolve relative paths against the
// directory the user typed the command in.
const userCwd = process.env.INIT_CWD ?? process.cwd();
const fromUser = (target: string) => path.resolve(userCwd, target);
const shown = (target: string) => {
  const relative = path.relative(userCwd, target);
  return relative && !relative.startsWith("..") && !path.isAbsolute(relative) ? relative : display(target);
};

const [command, ...rest] = process.argv.slice(2);

async function main(): Promise<number> {
  if (!command || command === "-h" || command === "--help" || command === "help") {
    console.log(await fullUsage());
    return command ? 0 : 2;
  }
  if (command === "tts") {
    const { DEFAULT_DTYPE, DEFAULT_VOICE, DEFAULT_VI_VOICE } = await ttsDefaults();
    const { isDtype } = await import("./tts/kokoro-model.ts");
    const { DEFAULT_VI_NUMBER_STYLE } = await import("./normalize/numbers-vi.ts");
    /** --vi-numbers: "sgk" = linh, nghìn, bốn (textbook, default); "nam" = lẻ, ngàn, tư (Southern). */
    const VI_NUMBER_STYLES = {
      sgk: DEFAULT_VI_NUMBER_STYLE,
      nam: { zeroTens: "lẻ", thousand: "ngàn", fourAfterTens: "tư" },
    } as const;
    let parsed;
    try {
      parsed = parseArgs({
        args: rest,
        allowPositionals: true,
        allowNegative: true,
        options: {
          out: { type: "string" },
          force: { type: "boolean", default: false },
          review: { type: "boolean", default: true },
          lang: { type: "string", default: "en" },
          cache: { type: "string" },
          "review-dir": { type: "string" },
          dtype: { type: "string", default: DEFAULT_DTYPE },
          voice: { type: "string" },
          "self-check": { type: "boolean", default: true },
          "max-variants": { type: "string", default: "4" },
          "vi-numbers": { type: "string", default: "sgk" },
          "check-passes": { type: "string", default: "2" },
          recheck: { type: "string", multiple: true, default: [] },
          "pin-variant": { type: "string", multiple: true, default: [] },
          "check-all": { type: "boolean", default: false },
          help: { type: "boolean", short: "h", default: false },
        },
      });
    } catch (error) {
      console.error(`${(error as Error).message}\n\n${await fullUsage()}`);
      return 2;
    }
    const { values, positionals } = parsed;
    if (values.help) {
      console.log(await fullUsage());
      return 0;
    }
    const maxVariants = Number(values["max-variants"]);
    if (!Number.isInteger(maxVariants) || maxVariants < 0 || maxVariants > 20) {
      console.error(`--max-variants ${values["max-variants"]} không hợp lệ (0–20).`);
      return 2;
    }
    const checkPasses = Number(values["check-passes"]);
    if (!Number.isInteger(checkPasses) || checkPasses < 1 || checkPasses > 8) {
      console.error(`--check-passes ${values["check-passes"]} không hợp lệ (1–8).`);
      return 2;
    }
    if (!Object.hasOwn(VI_NUMBER_STYLES, values["vi-numbers"])) {
      console.error(`--vi-numbers ${values["vi-numbers"]} không hợp lệ (sgk hoặc nam).`);
      return 2;
    }
    if (!values.out || positionals.length === 0) {
      console.error(`${!values.out ? "Thiếu --out." : "Thiếu file JSON."}\n\n${await fullUsage()}`);
      return 2;
    }
    if (values.lang !== "en" && values.lang !== "vi") {
      console.error(`--lang ${values.lang} không hợp lệ (en hoặc vi).`);
      return 2;
    }
    if (!isDtype(values.dtype)) {
      console.error(`--dtype ${values.dtype} không hợp lệ (fp32, fp16, q8).`);
      return 2;
    }
    const { runTts } = await import("./tts/command.ts");
    return runTts({
      files: positionals.map(fromUser),
      out: fromUser(values.out),
      lang: values.lang,
      force: values.force,
      review: values.review,
      cacheDir: values.cache ? fromUser(values.cache) : DEFAULT_AUDIO_DIR,
      reviewDir: values["review-dir"] ? fromUser(values["review-dir"]) : DEFAULT_REVIEW_DIR,
      dtype: values.dtype,
      voice: values.voice ?? (values.lang === "vi" ? DEFAULT_VI_VOICE : DEFAULT_VOICE),
      selfCheck: values["self-check"],
      maxVariants,
      checkPasses,
      recheck: values.recheck,
      pinVariants: values["pin-variant"],
      checkAll: values["check-all"],
      viNumbers: VI_NUMBER_STYLES[values["vi-numbers"] as keyof typeof VI_NUMBER_STYLES],
      display: shown,
    });
  }
  if (command === "build") {
    let parsed;
    try {
      parsed = parseArgs({
        args: rest,
        allowPositionals: true,
        options: {
          out: { type: "string" },
          cache: { type: "string" },
          rules: { type: "string" },
          "min-app-version": { type: "string", default: DEFAULT_MIN_APP_VERSION },
          "require-lang": { type: "string", default: "en" },
          help: { type: "boolean", short: "h", default: false },
        },
      });
    } catch (error) {
      console.error(`${(error as Error).message}\n\n${await fullUsage()}`);
      return 2;
    }
    const { values, positionals } = parsed;
    if (values.help) {
      console.log(await fullUsage());
      return 0;
    }
    if (positionals.length === 0) {
      console.error(`Thiếu file JSON (topic.json và các bài).\n\n${await fullUsage()}`);
      return 2;
    }
    const { runBuild } = await import("./build/command.ts");
    if (!parseAppVersion(values["min-app-version"])) {
      console.error(`--min-app-version ${values["min-app-version"]} không hợp lệ (MAJOR.MINOR.PATCH, vd 0.1.0).`);
      return 2;
    }
    const requireLangs = values["require-lang"].split(",").map((lang) => lang.trim()).filter(Boolean);
    if (requireLangs.length === 0 || requireLangs.some((lang) => lang !== "en" && lang !== "vi")) {
      console.error(`--require-lang ${values["require-lang"]} không hợp lệ (en, vi hoặc en,vi).`);
      return 2;
    }
    return runBuild({
      requireLangs: requireLangs as ("en" | "vi")[],
      files: positionals.map(fromUser),
      out: values.out ? fromUser(values.out) : DEFAULT_PACK_DIR,
      cacheDir: values.cache ? fromUser(values.cache) : DEFAULT_AUDIO_DIR,
      rulesFile: values.rules ? fromUser(values.rules) : DEFAULT_RULES_FILE,
      minAppVersion: values["min-app-version"],
      display: shown,
    });
  }
  if (command === "validate" || command === "import" || command === "ids") {
    let parsed;
    try {
      parsed = parseArgs({
        args: rest,
        allowPositionals: true,
        options: {
          rules: { type: "string" },
          "min-app-version": { type: "string", default: DEFAULT_MIN_APP_VERSION },
          "content-root": { type: "string" },
          ...(command === "import" ? { out: { type: "string" as const } } : {}),
          help: { type: "boolean", short: "h", default: false },
        },
      });
    } catch (error) {
      console.error(`${(error as Error).message}\n\n${MD_USAGE}`);
      return 2;
    }
    const { values, positionals } = parsed;
    if (values.help) {
      console.log(MD_USAGE);
      return 0;
    }
    if (positionals.length === 0) {
      console.error(`Thiếu thư mục hoặc file .md${command === "validate" ? " (hoặc các file .json: topic.json và các bài)" : ""}.\n\n${MD_USAGE}`);
      return 2;
    }
    if (!parseAppVersion(values["min-app-version"])) {
      console.error(`--min-app-version ${values["min-app-version"]} không hợp lệ (MAJOR.MINOR.PATCH, vd 0.1.0).`);
      return 2;
    }
    // .json = the JSON validate of SK-026 (unchanged); .md or a folder = markdown (SK-027).
    const json = positionals.filter((target) => target.toLowerCase().endsWith(".json"));
    const markdown = positionals.filter((target) => !target.toLowerCase().endsWith(".json"));
    if (json.length > 0 && markdown.length > 0) {
      console.error(`Không trộn file .json với file .md hay thư mục trong một lần gọi: ${json.join(", ")} và ${markdown.join(", ")}. Gọi riêng từng loại.`);
      return 2;
    }
    const other = markdown.filter((target) => /\.[A-Za-z0-9]+$/.test(path.basename(target)) && !target.toLowerCase().endsWith(".md"));
    if (other.length > 0) {
      console.error(`${command} chỉ đọc file .md hoặc thư mục${command === "validate" ? " (hoặc .json)" : ""}: ${other.join(", ")}`);
      return 2;
    }
    if (json.length > 0) {
      if (command !== "validate") {
        console.error(`${command} chỉ đọc markdown (.md hoặc thư mục chủ đề), không đọc ${json.join(", ")}.\n\n${MD_USAGE}`);
        return 2;
      }
      if (values["content-root"]) {
        console.error("--content-root chỉ dùng với markdown.");
        return 2;
      }
      const { runValidate } = await import("./validate/command.ts");
      return runValidate({
        files: positionals.map(fromUser),
        rulesFile: values.rules ? fromUser(values.rules) : DEFAULT_RULES_FILE,
        minAppVersion: values["min-app-version"],
        display: shown,
      });
    }
    const markdownCommand = await import("./markdown/command.ts");
    const options = {
      inputs: positionals.map(fromUser),
      contentRoot: values["content-root"] ? fromUser(values["content-root"]) : undefined,
      rulesFile: values.rules ? fromUser(values.rules) : DEFAULT_RULES_FILE,
      minAppVersion: values["min-app-version"],
      cwd: userCwd,
      display: shown,
    };
    if (command === "validate") return markdownCommand.runMarkdownValidate(options);
    if (command === "ids") return markdownCommand.runIds(options);
    const out = (values as { out?: string }).out;
    return markdownCommand.runImport({ ...options, out: out ? fromUser(out) : markdownCommand.DEFAULT_JSON_DIR });
  }
  if (command === "fetch-model") {
    const { DEFAULT_DTYPE, ensureModel, isDtype } = await import("./tts/kokoro-model.ts");
    const { values } = parseArgs({ args: rest, options: { dtype: { type: "string", default: DEFAULT_DTYPE } } });
    if (!isDtype(values.dtype)) {
      console.error(`--dtype ${values.dtype} không hợp lệ (fp32, fp16, q8).`);
      return 2;
    }
    const { downloaded } = await ensureModel(values.dtype, (line) => console.log(line));
    console.log(downloaded ? `Đã tải ${downloaded} file.` : `Model ${values.dtype} đã có đủ, không tải gì.`);
    return 0;
  }
  console.error(`Lệnh lạ: ${command}\n\n${await fullUsage()}`);
  return 2;
}

try {
  process.exitCode = await main();
} catch (error) {
  console.error(`Lỗi: ${(error as Error).stack ?? error}`);
  process.exitCode = 1;
}
