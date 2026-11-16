// Authoring rules per age group (SK-026): read `rules.<age_group>.authoring` of content/rules.json
// for the topic's age_group and check its lessons' warmup and quiz. Runs in `validate` and in
// `build`, on documents that already passed packages/content-schema (shape + cross-file checks).
// Pure: no I/O, the caller prints. One line per issue:
//   <file> <JSON pointer> [<code>] <message>      (warnings: message starts with "cảnh báo: ")
import { compareAppVersions, maxAppVersion } from "../app-version.ts";
import { authoringOf, type Authoring, type ImageSlot, type Range, type Rules } from "../build/rules.ts";
import { briefKeywords, composedPartSearches, composedReuses, crossReuse, imageRefs, isComposedBrief, isOwnBrief, isReuseBrief, KEYWORDS_LABEL, reuseTarget, type Here } from "../images/slots.ts";
import { displayPointer, getAt } from "../json-pointer.ts";
import { collectSpoken, locateCommon, type ContentKind } from "../spoken.ts";
import { firstAppVersion } from "./format-renderers.ts";

export type Severity = "error" | "warning";
export type IssueCode =
  | "age_rules_missing"
  | "age_format_not_allowed"
  | "age_option_count"
  | "age_image_required"
  | "age_first_item_dok"
  | "age_dok_mix"
  | "age_misconception_count"
  | "age_format_variety"
  | "age_dok_order"
  | "age_words_en"
  | "format_not_rendered"
  | "image_missing"
  | "image_brief_keywords"
  | "multi_choice_correct_spread"
  | "vocab_item_uses_lesson_word";

/** Level of each code. format_not_rendered: error in build, warning in validate. */
export const ISSUE_LEVELS: Readonly<Record<IssueCode, Severity | "build: error, validate: warning">> = {
  age_rules_missing: "error",
  age_format_not_allowed: "error",
  age_option_count: "error",
  age_image_required: "error",
  age_first_item_dok: "error",
  age_dok_mix: "error",
  age_misconception_count: "error",
  age_format_variety: "error",
  age_dok_order: "warning",
  age_words_en: "warning",
  format_not_rendered: "build: error, validate: warning",
  image_missing: "warning",
  image_brief_keywords: "warning",
  // SK-047: a warning while content-editor reworked the 40 Discoverer lessons; an error since the
  // content passed (15/11), so validate exits 1 and build stops on it.
  multi_choice_correct_spread: "error",
  // SK-047 wave 1: an approximation (label vs vocab term), so it stays a warning.
  vocab_item_uses_lesson_word: "warning",
};

/** SK-033 codes: build folds them into one count line per file instead of one line each. */
export const IMAGE_WARNING_CODES: ReadonlySet<IssueCode> = new Set(["image_missing", "image_brief_keywords"]);

export type Issue = { file: string; pointer: string; code: IssueCode; severity: Severity; message: string };
export type AgeDoc = { display: string; data: Record<string, unknown> & { kind: ContentKind } };
export type AgeRulesOptions = {
  /** Lowest app version of every topic (--min-app-version); block min_app_version can raise it. */
  minAppVersion: string;
  /** build: format_not_rendered is an error; validate: a warning. */
  mode: "build" | "validate";
  /** How the rules file is named in messages. */
  rulesDisplay: string;
};

type Entry = { key: string; image?: unknown; label?: { en?: string }; correct?: boolean };
type QuizItem = {
  key: string;
  format: string;
  dok: number;
  image?: unknown;
  misconception_id?: string;
  options?: Entry[];
  items?: Entry[];
  bank?: Entry[];
  answers?: string[];
};
type VocabTerm = { key: string; term?: { en?: string }; tier?: "core" | "extra" };

/** Array counted by option_count, per format; true_false has none. */
const COUNTED: Readonly<Record<string, { field: "options" | "items" | "bank"; noun: string }>> = {
  single_choice: { field: "options", noun: "lựa chọn" },
  multi_choice: { field: "options", noun: "lựa chọn" },
  picture_bar_chart: { field: "options", noun: "lựa chọn" },
  order_sequence: { field: "items", noun: "thẻ" },
  fill_blank_bank: { field: "bank", noun: "từ trong ngân hàng" },
};
/** Formats whose options are picture cards (choice_option). Not picture_bar_chart: the child taps a bar, options carry no image (SK-043, 14/11). */
const CHOICE_FORMATS = new Set(["single_choice", "multi_choice"]);
const SECTIONS = [
  { field: "warmup", name: "Khởi động", formats: (a: Authoring) => a.warmup_formats },
  { field: "quiz", name: "Quiz", formats: (a: Authoring) => a.quiz_formats },
] as const;

const range = ([min, max]: Range) => (min === max ? `${min}` : `${min}–${max}`);
const outside = (n: number, [min, max]: Range) => n < min || n > max;

/** Sentences of an EN string: split after . ! ? … followed by space. */
export function sentencesOf(text: string): string[] {
  return text.split(/(?<=[.!?…])\s+/).map((part) => part.trim()).filter(Boolean);
}

/** Words of one sentence: whitespace tokens with a letter or digit (a blank {1} counts as a word; "—" does not). */
export function countWords(sentence: string): number {
  return sentence.split(/\s+/).filter((token) => /[\p{L}\p{N}]/u.test(token)).length;
}

/** "[<code>] <message>", the part after the pointer (build prints its problems as <file> <pointer> <text>). */
export function issueText(issue: Issue): string {
  return `[${issue.code}] ${issue.severity === "warning" ? "cảnh báo: " : ""}${issue.message}`;
}

/** <file> <JSON pointer> [<code>] <message> */
export function formatIssue(issue: Issue): string {
  return `${issue.file} ${displayPointer(issue.pointer)} ${issueText(issue)}`;
}

export function checkAgeRules(docs: AgeDoc[], rules: Rules, options: AgeRulesOptions): Issue[] {
  const issues: Issue[] = [];
  const topics = docs.filter((doc) => doc.data.kind === "topic");
  const lessons = docs.filter((doc) => doc.data.kind === "lesson");
  for (const topic of topics) {
    const group = String(topic.data.age_group);
    const authoring = authoringOf(rules, group);
    const own = lessons.filter((lesson) => lesson.data.topic_id === topic.data.id);
    const push = (doc: AgeDoc, pointer: string, code: IssueCode, message: string, severity: Severity = ISSUE_LEVELS[code] === "warning" ? "warning" : "error") =>
      issues.push({ file: doc.display, pointer, code, severity, message });

    if (!authoring) {
      const why = Object.hasOwn(rules, group) ? `nhóm tuổi ${group} chưa có authoring trong ${options.rulesDisplay}` : `nhóm tuổi ${group} không có trong ${options.rulesDisplay}`;
      push(topic, "/age_group", "age_rules_missing", `${why}; chưa kiểm được luật soạn theo tuổi`);
    }
    // Same as build: the topic needs the newest of --min-app-version and every block min_app_version.
    const versions = [options.minAppVersion];
    for (const doc of [topic, ...own]) for (const pointer of locateCommon(doc.data.kind, doc.data, "AppVersion")) versions.push(String(getAt(doc.data, pointer)));
    const appVersion = maxAppVersion(versions);

    for (const lesson of own) {
      for (const section of SECTIONS) {
        const list = (lesson.data[section.field] ?? []) as QuizItem[];
        list.forEach((item, i) => {
          const pointer = `/${section.field}/${i}`;
          if (authoring) checkItem(lesson, item, pointer, section.name, section.formats(authoring), authoring, group, push);
          const first = firstAppVersion(item.format, group);
          // A format the group's rules do not allow already has age_format_not_allowed: one line per problem.
          const notAllowed = authoring !== undefined && !section.formats(authoring).includes(item.format);
          if (!notAllowed && (first === null || compareAppVersions(first, appVersion) > 0)) {
            const since = first === null ? `chưa bản app nào hiện được format này ở nhóm ${group}` : `app hiện được từ ${first}, cần --min-app-version ${first} trở lên`;
            const effect = options.mode === "build" ? "app cũ sẽ bỏ câu này" : "build sẽ báo lỗi";
            push(lesson, `${pointer}/format`, "format_not_rendered", `format ${item.format} chưa hiện được ở app ${appVersion}: ${since}; ${effect}`, options.mode === "build" ? "error" : "warning");
          }
        });
      }
      if (authoring) checkQuiz(lesson, (lesson.data.quiz ?? []) as QuizItem[], authoring, group, push);
      if (authoring) checkTray(lesson, lesson.data.play as Tray | undefined, authoring, group, push);
      if (authoring?.vocab_item_uses_lesson_word === true) checkVocabItems(lesson, push);
    }
    if (authoring?.multi_choice_correct_spread !== undefined) checkCorrectSpread(topic, own, authoring.multi_choice_correct_spread, group, push);
    if (authoring?.image_search_keywords === true) {
      for (const doc of [topic, ...own]) checkBriefs(doc, { topic: String(topic.data.slug), slug: doc.data.kind === "lesson" ? String(doc.data.slug) : undefined, order: doc.data.kind === "lesson" ? Number(doc.data.order) : undefined }, push);
    }
    if (authoring?.max_words_en !== undefined) {
      for (const doc of [topic, ...own]) checkWords(doc, authoring.max_words_en, group, push);
    }
  }
  return issues;
}

type Push = (doc: AgeDoc, pointer: string, code: IssueCode, message: string) => void;

function checkItem(doc: AgeDoc, item: QuizItem, pointer: string, sectionName: string, allowed: string[], authoring: Authoring, group: string, push: Push) {
  if (!allowed.includes(item.format)) {
    push(doc, `${pointer}/format`, "age_format_not_allowed", `format ${item.format} không dùng ở ${sectionName} của nhóm ${group} (được dùng: ${allowed.join(", ")})`);
    return;
  }
  const counted = COUNTED[item.format];
  const limits = authoring.option_count[item.format];
  if (counted && limits) {
    const n = item[counted.field]?.length ?? 0;
    if (outside(n, limits)) push(doc, `${pointer}/${counted.field}`, "age_option_count", `${item.format} có ${n} ${counted.noun}; nhóm ${group} cần ${range(limits)}`);
  }
  const missing: Missing[] = [];
  if (item.image === undefined) {
    if (item.format === "true_false") missing.push({ pointer, slot: "true_false", key: item.key });
    missing.push({ pointer, slot: "question", key: item.key });
  }
  if (CHOICE_FORMATS.has(item.format)) item.options?.forEach((option, j) => option.image === undefined && missing.push({ pointer: `${pointer}/options/${j}`, slot: "choice_option", key: option.key }));
  if (item.format === "order_sequence") item.items?.forEach((card, j) => card.image === undefined && missing.push({ pointer: `${pointer}/items/${j}`, slot: "sequence_item", key: card.key }));
  if (item.format === "fill_blank_bank") item.bank?.forEach((word, j) => word.image === undefined && missing.push({ pointer: `${pointer}/bank/${j}`, slot: "bank_word", key: word.key }));
  reportMissing(doc, missing, authoring, group, push);
}

type Missing = { pointer: string; slot: ImageSlot; key: string };
type Tray = { type?: string; items?: Entry[] };

/** What each slot is called: [noun for the message, "mọi …" for the rule]. */
const SLOT_WORDS: Readonly<Record<ImageSlot, [string, string]>> = {
  question: ["câu", "mọi câu Khởi động và Quiz có hình minh hoạ"],
  choice_option: ["lựa chọn", "mọi lựa chọn có hình"],
  sequence_item: ["thẻ", "mọi thẻ sắp thứ tự có hình"],
  true_false: ["câu true_false", "câu đúng/sai có hình"],
  bank_word: ["thẻ từ", "mọi thẻ từ trong ngân hàng có hình"],
  tray_item: ["món", "mọi món ở phần Chơi có hình"],
};

/**
 * One line per place (pointer): age_image_required (error) when a slot of the place is in
 * image_required, else image_missing (warning) when one is in image_expected, else nothing.
 * The first slot listed for a place names it (true_false before question).
 */
function reportMissing(doc: AgeDoc, missing: Missing[], authoring: Authoring, group: string, push: Push) {
  const required = new Set(authoring.image_required);
  const expected = new Set(authoring.image_expected ?? []);
  const places = new Map<string, Missing[]>();
  for (const entry of missing) places.set(entry.pointer, [...(places.get(entry.pointer) ?? []), entry]);
  for (const [pointer, slots] of places) {
    const hard = slots.find((entry) => required.has(entry.slot));
    if (hard) {
      const [noun, rule] = SLOT_WORDS[hard.slot];
      const what = hard.slot === "true_false" ? " (hình vật được nói tới)" : hard.slot === "question" ? " (hình minh hoạ câu hỏi)" : "";
      push(doc, pointer, "age_image_required", `${noun} ${hard.key} thiếu image${what}; nhóm ${group} bắt buộc ${rule}`);
      continue;
    }
    const soft = slots.find((entry) => expected.has(entry.slot));
    if (soft) {
      const [noun, rule] = SLOT_WORDS[soft.slot];
      push(doc, pointer, "image_missing", `${noun} ${soft.key} thiếu image${soft.slot === "question" ? " (hình minh hoạ câu hỏi)" : ""}; nhóm ${group} cần ${rule} (SK-033)`);
    }
  }
}

/** build_tray of ## Chơi: every item is a tray_item slot. */
function checkTray(doc: AgeDoc, play: Tray | undefined, authoring: Authoring, group: string, push: Push) {
  if (play?.type !== "build_tray") return;
  const missing: Missing[] = [];
  play.items?.forEach((item, j) => item.image === undefined && missing.push({ pointer: `/play/items/${j}`, slot: "tray_item", key: item.key }));
  reportMissing(doc, missing, authoring, group, push);
}

/**
 * Every Image brief carries "Từ khoá tìm ảnh (EN): …", or reuses another picture ("Dùng lại hình
 * `<key>`…", no keywords needed). A reuse of this document must name one of its keys; a reuse of
 * another lesson is not checked here (that lesson may not be in the call). A composed brief
 * ("[sơ đồ ghép ảnh]", dev 10/11) needs keywords only for the parts still to find: it is fine
 * with keywords, "Từ khoá cho <phần>: …", or at least one reused picture in backticks. A brief
 * for a picture Science Kids draws ("[hình vẽ]", dev 10/11) needs no keywords: nothing is searched.
 */
function checkBriefs(doc: AgeDoc, here: Here, push: Push) {
  const refs = imageRefs(doc.data.kind, doc.data);
  for (const ref of refs) {
    const brief = ref.image.brief;
    if (brief === undefined) {
      push(doc, ref.pointer, "image_brief_keywords", `hình ${ref.key} chưa có brief nên chưa có "${KEYWORDS_LABEL} …" (từ khoá tiếng Anh cho content-cli images search)`);
    } else if (isComposedBrief(brief)) {
      if (composedPartSearches(brief).length === 0 && composedReuses(brief, refs, ref.key, here).length === 0) {
        push(doc, `${ref.pointer}/brief`, "image_brief_keywords", `brief ghép của hình ${ref.key} không có "${KEYWORDS_LABEL} …" cho ảnh cần tìm và không nêu hình dùng lại nào (vd "dùng lại hình \`tray_sea\`"; bài khác thì "\`<bài>/<key>\`")`);
      }
    } else if (isReuseBrief(brief)) {
      if (!crossReuse(brief, here) && reuseTarget(brief, refs, ref.key, here) === undefined) {
        push(doc, `${ref.pointer}/brief`, "image_brief_keywords", `brief "Dùng lại …" của hình ${ref.key} không nêu key của hình nào trong bài (vd "Dùng lại hình \`tray_sea\`."; bài khác thì thêm "ở bài \`<chủ đề>/<bài>\`")`);
      }
    } else if (isOwnBrief(brief)) {
      // Drawn by Science Kids: the brief says what to draw, no search.
    } else if (briefKeywords(brief) === undefined) {
      push(doc, `${ref.pointer}/brief`, "image_brief_keywords", `brief của hình ${ref.key} thiếu "${KEYWORDS_LABEL} …" ở cuối dòng (từ khoá cho images search); hình dùng lại thì mở đầu bằng "Dùng lại hình \`<key>\`."`);
    }
  }
}

function checkQuiz(doc: AgeDoc, quiz: QuizItem[], authoring: Authoring, group: string, push: Push) {
  if (quiz.length === 0) return;
  if (quiz[0]!.dok !== authoring.first_item_dok) {
    push(doc, "/quiz/0/dok", "age_first_item_dok", `câu 1 là DOK ${quiz[0]!.dok}; nhóm ${group} cần câu 1 là DOK ${authoring.first_item_dok}`);
  }
  const mix = [1, 2, 3].map((dok) => quiz.filter((item) => item.dok === dok).length);
  if (mix.some((n, i) => n !== authoring.dok_mix[i])) {
    push(doc, "/quiz", "age_dok_mix", `phân bổ DOK 1·2·3 là ${mix.join("·")}; nhóm ${group} cần ${authoring.dok_mix.join("·")}`);
  }
  const misconceptions = quiz.filter((item) => item.misconception_id !== undefined).length;
  if (outside(misconceptions, authoring.misconception_items)) {
    push(doc, "/quiz", "age_misconception_count", `${misconceptions} câu có misconception_id; nhóm ${group} cần ${range(authoring.misconception_items)}`);
  }
  const formats = [...new Set(quiz.map((item) => item.format))];
  if (formats.length < authoring.min_formats) {
    push(doc, "/quiz", "age_format_variety", `quiz dùng ${formats.length} format (${formats.join(", ")}); nhóm ${group} cần ít nhất ${authoring.min_formats}`);
  }
  for (let i = 1; i < quiz.length; i++) {
    const [before, now] = [quiz[i - 1]!.dok, quiz[i]!.dok];
    if (now < before) push(doc, `/quiz/${i}/dok`, "age_dok_order", `DOK giảm từ ${before} (câu ${i}) xuống ${now} (câu ${i + 1}); quiz xếp dễ → khó`);
  }
}

function checkWords(doc: AgeDoc, max: number, group: string, push: Push) {
  for (const { pointer, node } of collectSpoken(doc.data.kind, doc.data)) {
    for (const sentence of sentencesOf(node.en)) {
      const n = countWords(sentence);
      if (n > max) push(doc, `${pointer}/en`, "age_words_en", `câu EN ${n} từ, nhóm ${group} tối đa ${max}: "${sentence}"`);
    }
  }
}

/** "01-vi-sao-ta-phai-tho": order and slug of a lesson, as its file name. */
function lessonName(doc: AgeDoc): string {
  return `${String(doc.data.order).padStart(2, "0")}-${String(doc.data.slug)}`;
}

/** SK-047: max(1, floor(ratio × n)); the epsilon keeps 0.29 × 100 at 29. */
export function correctSpreadLimit(n: number, ratio: number): number {
  return Math.max(1, Math.floor(ratio * n + 1e-9));
}

/**
 * SK-047 (proposal 4.6, 4.7): a topic-level rule. Gathers every multi_choice of the topic's
 * lessons in this call, warm-up and quiz, and counts them by number of right answers. A number
 * of right answers held by more than correctSpreadLimit items gets one line on the topic file.
 * Only the lessons in the call count: run it on the whole topic folder.
 */
function checkCorrectSpread(topic: AgeDoc, lessons: AgeDoc[], ratio: number, group: string, push: Push) {
  const items: { where: string; right: number }[] = [];
  const ordered = [...lessons].sort((a, b) => Number(a.data.order) - Number(b.data.order));
  for (const lesson of ordered) {
    for (const section of SECTIONS) {
      for (const item of (lesson.data[section.field] ?? []) as QuizItem[]) {
        if (item.format !== "multi_choice") continue;
        items.push({ where: `${lessonName(lesson)} ${item.key}`, right: (item.options ?? []).filter((option) => option.correct === true).length });
      }
    }
  }
  const n = items.length;
  const limit = correctSpreadLimit(n, ratio);
  const byRight = new Map<number, string[]>();
  for (const item of items) byRight.set(item.right, [...(byRight.get(item.right) ?? []), item.where]);
  const spread = [...byRight.entries()].sort(([a], [b]) => a - b).map(([right, list]) => `${right} đúng × ${list.length}`).join(" · ");
  for (const [right, list] of [...byRight.entries()].sort(([a], [b]) => a - b)) {
    if (list.length <= limit) continue;
    push(
      topic,
      "",
      "multi_choice_correct_spread",
      `chủ đề ${String(topic.data.slug)}: ${list.length}/${n} câu multi_choice có ${right} đáp án đúng; nhóm ${group} cho tối đa ${limit} câu cùng số đáp án đúng ` +
        `(max(1, floor(${ratio} × ${n}))), cần đổi ít nhất ${list.length - limit} câu sang số đáp án đúng khác. Phân bố: ${spread}. Các câu: ${list.join(", ")}`,
    );
  }
}

const IRREGULAR: Readonly<Record<string, string>> = { teeth: "tooth", feet: "foot", mice: "mouse", geese: "goose", children: "child", people: "person", men: "man", women: "woman" };

/** Lower case, hyphens as spaces, no edge punctuation, no leading article: "The Air-sacs." -> "air sacs". */
function normalizeWord(text: string): string {
  return text
    .normalize("NFKC")
    .toLowerCase()
    .replace(/[-‐–—]/g, " ")
    .replace(/[^\p{L}\p{N}' ]/gu, " ")
    .replace(/\s+/g, " ")
    .trim()
    .replace(/^(a|an|the) /, "");
}

/**
 * Possible base forms of the last word (wave 1, no dictionary): the word itself, plus what is
 * left after -s, -es, -ies, -ves, -ed, -ied, -ing (with or without a final e, undoubling the last
 * consonant), plus a few irregular plurals. Stems under 3 letters are dropped.
 */
export function wordForms(text: string): Set<string> {
  const phrase = normalizeWord(text);
  const cut = phrase.lastIndexOf(" ");
  const [head, word] = cut < 0 ? ["", phrase] : [phrase.slice(0, cut + 1), phrase.slice(cut + 1)];
  const bases = new Set([word]);
  const add = (base: string) => base.length >= 3 && bases.add(base);
  const undouble = (base: string) => (/([b-df-hj-np-tv-z])\1$/.test(base) ? base.slice(0, -1) : base);
  if (IRREGULAR[word]) add(IRREGULAR[word]!);
  if (word.endsWith("ies") || word.endsWith("ied")) add(`${word.slice(0, -3)}y`);
  if (word.endsWith("ves")) (add(`${word.slice(0, -3)}f`), add(`${word.slice(0, -3)}fe`));
  if (word.endsWith("es")) add(word.slice(0, -2));
  if (word.endsWith("s") && !word.endsWith("ss")) add(word.slice(0, -1));
  if (word.endsWith("ed")) (add(word.slice(0, -2)), add(word.slice(0, -1)), add(undouble(word.slice(0, -2))));
  if (word.endsWith("ing")) (add(word.slice(0, -3)), add(`${word.slice(0, -3)}e`), add(undouble(word.slice(0, -3))));
  return new Set([...bases].map((base) => `${head}${base}`));
}

/** Same word up to case and -s, -es, -ed, -ing: the two sets of base forms meet. */
export function sameWord(a: string, b: string): boolean {
  const left = wordForms(a);
  for (const form of wordForms(b)) if (left.has(form)) return true;
  return false;
}

/**
 * SK-047 wave 1 of vocab_item_uses_lesson_word: every fill_blank_bank of the quiz is a "new word"
 * item, so at least one of its answers (bank label.en) is a term.en of a core word of the lesson's
 * vocab. Core only (coordinator 15/11): content-schema calls core "new words of the lesson, tested"
 * and extra "further reading"; the recap's new-word strip shows the core words (word_list).
 * Wave 2 also checks items with skill vocab. Warm-up items recall other lessons: not checked.
 */
function checkVocabItems(doc: AgeDoc, push: Push) {
  const vocab = (doc.data.vocab ?? []) as VocabTerm[];
  const termsOf = (tier: "core" | "extra") => vocab.filter((entry) => (entry.tier ?? "core") === tier).map((entry) => entry.term?.en ?? "").filter(Boolean);
  const [core, extra] = [termsOf("core"), termsOf("extra")];
  ((doc.data.quiz ?? []) as QuizItem[]).forEach((item, i) => {
    if (item.format !== "fill_blank_bank") return;
    const labels = (item.answers ?? []).map((key) => item.bank?.find((word) => word.key === key)?.label?.en ?? key);
    if (labels.some((label) => core.some((term) => sameWord(label, term)))) return;
    const words = core.length > 0 ? core.join(", ") : "bài chưa có từ core nào";
    const extraHit = extra.filter((term) => labels.some((label) => sameWord(label, term)));
    const extraNote = extraHit.length > 0 ? `; ${extraHit.join(", ")} là từ đọc thêm (tier: extra) của bài, chưa phải từ mới: dùng một từ core, hoặc đổi tier của từ đó thành core` : "";
    push(
      doc,
      `/quiz/${i}/answers`,
      "vocab_item_uses_lesson_word",
      `câu ${item.key}: từ trong chỗ trống (${labels.join(" + ")}) không trùng từ mới nào của bài (vocab tier core: ${words})${extraNote}; fill_blank_bank ở Quiz là câu Từ mới, chỗ trống dùng một từ mới của bài (so không phân biệt hoa thường, nhận -s, -es, -ed, -ing)`,
    );
  });
}
