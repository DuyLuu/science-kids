// Authoring rules per age group (SK-026): read `rules.<age_group>.authoring` of content/rules.json
// for the topic's age_group and check its lessons' warmup and quiz. Runs in `validate` and in
// `build`, on documents that already passed packages/content-schema (shape + cross-file checks).
// Pure: no I/O, the caller prints. One line per issue:
//   <file> <JSON pointer> [<code>] <message>      (warnings: message starts with "cảnh báo: ")
import { compareAppVersions, maxAppVersion } from "../app-version.ts";
import { authoringOf, type Authoring, type Range, type Rules } from "../build/rules.ts";
import { displayPointer, getAt } from "../json-pointer.ts";
import { collectSpoken, locateCommon, type ContentKind } from "../spoken.ts";
import { FORMAT_FIRST_APP_VERSION } from "./format-renderers.ts";

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
  | "format_not_rendered";

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
};

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

type Entry = { key: string; image?: unknown };
type QuizItem = {
  key: string;
  format: string;
  dok: number;
  image?: unknown;
  misconception_id?: string;
  options?: Entry[];
  items?: Entry[];
  bank?: Entry[];
};

/** Array counted by option_count, per format; true_false has none. */
const COUNTED: Readonly<Record<string, { field: "options" | "items" | "bank"; noun: string }>> = {
  single_choice: { field: "options", noun: "lựa chọn" },
  multi_choice: { field: "options", noun: "lựa chọn" },
  picture_bar_chart: { field: "options", noun: "lựa chọn" },
  order_sequence: { field: "items", noun: "thẻ" },
  fill_blank_bank: { field: "bank", noun: "từ trong ngân hàng" },
};
const CHOICE_FORMATS = new Set(["single_choice", "multi_choice", "picture_bar_chart"]);
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
          const first = FORMAT_FIRST_APP_VERSION[item.format] ?? null;
          if (first === null || compareAppVersions(first, appVersion) > 0) {
            const since = first === null ? "chưa bản app nào hiện được format này" : `app hiện được từ ${first}, cần --min-app-version ${first} trở lên`;
            const effect = options.mode === "build" ? "app cũ sẽ bỏ câu này" : "build sẽ báo lỗi";
            push(lesson, `${pointer}/format`, "format_not_rendered", `format ${item.format} chưa hiện được ở app ${appVersion}: ${since}; ${effect}`, options.mode === "build" ? "error" : "warning");
          }
        });
      }
      if (authoring) checkQuiz(lesson, (lesson.data.quiz ?? []) as QuizItem[], authoring, group, push);
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
  const required = new Set(authoring.image_required);
  if (required.has("choice_option") && CHOICE_FORMATS.has(item.format)) {
    item.options?.forEach((option, j) => {
      if (option.image === undefined) push(doc, `${pointer}/options/${j}`, "age_image_required", `lựa chọn ${option.key} thiếu image; nhóm ${group} bắt buộc mọi lựa chọn có hình`);
    });
  }
  if (required.has("sequence_item") && item.format === "order_sequence") {
    item.items?.forEach((card, j) => {
      if (card.image === undefined) push(doc, `${pointer}/items/${j}`, "age_image_required", `thẻ ${card.key} thiếu image; nhóm ${group} bắt buộc mọi thẻ sắp thứ tự có hình`);
    });
  }
  if (required.has("true_false") && item.format === "true_false" && item.image === undefined) {
    push(doc, pointer, "age_image_required", `câu true_false ${item.key} thiếu image (hình vật được nói tới); nhóm ${group} bắt buộc câu đúng/sai có hình`);
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
