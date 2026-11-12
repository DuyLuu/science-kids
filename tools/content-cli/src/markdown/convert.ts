// Parsed markdown (syntax.ts) -> JSON of content schema v1, plus the markdown line of every value
// (locator.ts) and the issues of step 1. Mapping: content/TEMPLATE.md section D.
//
// Key order is the order of the JSON Schema `properties`, as in the hand-made fixtures of
// packages/content-schema, because build hashes pack.json byte for byte (SK-027 decision 6).
// One exception follows the fixtures: a choice option is key, label, correct, image (the schema
// lists image before correct). test/markdown.test.ts pins every order against the schema.
//
// The machine only adds `kind` and `schema_version`; nothing the markdown leaves out gets a
// default. A field with an empty value counts as absent.
import { randomUUID } from "node:crypto";
import path from "node:path";
import { escapeToken } from "../json-pointer.ts";
import { Locator } from "./locator.ts";
import { didYouMean, NEEDS_CHECK, suggest, type MdIssue } from "./source.ts";
import type { Block, Child, Field, ParsedMd, Section } from "./syntax.ts";

export const QUIZ_FORMATS_MD = ["single_choice", "multi_choice", "true_false", "fill_blank_bank", "order_sequence", "picture_bar_chart"] as const;
export const LEARN_TYPES = ["explore_groups", "sentence_card", "word_list"] as const;
export const PLAY_TYPES = ["build_tray"] as const;
export const DIFFICULTY_KEYS = ["abstraction", "prior_knowledge", "misconception", "vocabulary", "science_skill"] as const;
const UUID = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/;
/** Fields only a ### (question, block, word, card) has: seeing one inside another block means a deleted heading. */
const BLOCK_MARKERS = new Set(["id", "format", "type", "version", "dok"]);

type Json = Record<string, unknown>;
type Spoken = { en?: string; vi?: string };

/** One `id:` place: ok, empty (`id:` with no value), absent (no `id:` line), invalid. */
export type IdSlot = { value: string; line: number; pointer: string; state: "ok" | "empty" | "absent" | "invalid" };

/** `misconceptionsKnown`: _topic.md has its ## Misconceptions section (else refs are not checked: no cascade). */
export type TopicRef = { id: string; folder: string; misconceptions: Map<string, string>; misconceptionsKnown: boolean };

/** Other topics and lessons under the content root (files.ts). */
export type Lookup = {
  topic(slug: string): { id?: string } | undefined;
  topicSlugs(): string[];
  lesson(topicSlug: string, lessonSlug: string): { id?: string } | undefined;
  lessonRefs(): string[];
};

export type Converted = { doc: ParsedMd; data: Json; loc: Locator; issues: MdIssue[]; ids: IdSlot[]; topicRef?: TopicRef };

/** `merged`: some place looked like two blocks run together (a deleted heading); later key references and foreign children are then not reported. */
type Ctx = { doc: ParsedMd; loc: Locator; issues: MdIssue[]; ids: IdSlot[]; merged: boolean };
type Owner = { label: string; pointer: string; line: number };

const assemble = (entries: [string, unknown][]): Json => {
  const out: Json = {};
  for (const [key, value] of entries) if (value !== undefined) out[key] = value;
  return out;
};

function newCtx(doc: ParsedMd): Ctx {
  return { doc, loc: new Locator(), issues: [], ids: [], merged: false };
}

function report(ctx: Ctx, line: number, pointer: string, code: string, message: string) {
  ctx.issues.push({ file: ctx.doc.display, line, pointer, code, severity: "error", message });
}

/** Reads the fields of one place (frontmatter, section, ###, ####) by name; finish() flags the rest. */
class Reader {
  private readonly byName = new Map<string, Field[]>();
  private readonly known = new Set<string>();
  private readonly patterns: { pattern: RegExp; example: string }[] = [];
  private readonly pointers = new Map<string, string>();
  /** Names found only by ignoring case ("Format:" for "format:"): reported once, read anyway. */
  private readonly caseHits = new Set<string>();
  private readonly ctx: Ctx;
  readonly owner: Owner;
  readonly fields: Field[];

  constructor(ctx: Ctx, owner: Owner, fields: Field[]) {
    this.ctx = ctx;
    this.owner = owner;
    this.fields = fields;
    for (const field of fields) {
      const list = this.byName.get(field.name) ?? [];
      list.push(field);
      this.byName.set(field.name, list);
    }
  }

  /** The field (first one with a value, else the first empty one); registers the name as known. */
  field(name: string, pointer: string): Field | undefined {
    this.known.add(name);
    if (!this.pointers.has(name)) this.pointers.set(name, pointer);
    let list = this.byName.get(name);
    if (!list) {
      // Same name in other letter case: say so at that line, then read it as if written right.
      const other = [...this.byName.keys()].find((candidate) => candidate !== name && candidate.toLowerCase() === name.toLowerCase());
      if (other === undefined) return undefined;
      list = this.byName.get(other)!;
      if (!this.caseHits.has(other)) {
        this.caseHits.add(other);
        report(this.ctx, list[0]!.line, pointer, "md_unknown_field", `tên trường viết chữ thường: "${name}:", không phải "${other}:"`);
      }
    }
    const field = list.find((entry) => entry.value !== "") ?? list[0]!;
    this.ctx.loc.mark(pointer, field.line, name);
    return field;
  }

  private isKnown(name: string): boolean {
    return this.known.has(name) || this.caseHits.has(name) || this.patterns.some(({ pattern }) => pattern.test(name));
  }

  /** Field names this place takes and does not have yet (suggestions never point at a line already there). */
  private candidates(): string[] {
    return [...this.known, ...this.patterns.map(({ example }) => example)].filter((name) => !this.byName.has(name));
  }

  /** Lines that do not belong here: repeats of a known name, and names unknown at this place. */
  private strays(): { repeats: Field[]; unknown: Field[] } {
    const repeats: Field[] = [];
    const unknown: Field[] = [];
    for (const [name, list] of this.byName) {
      if (!this.isKnown(name)) unknown.push(...list);
      else repeats.push(...list.filter((field) => field.value !== "").slice(1));
    }
    return { repeats, unknown };
  }

  /**
   * Lines of another block that landed here because a ### / #### heading was deleted: reported
   * as one line, and follow-up errors stay quiet. Signals (SK-027 L5): a stray name that only a
   * block has (id, format, type, version, dok); or stray lines that run together, either three or
   * more, or a whole group of repeats (label.en + label.vi of a deleted #### bank). Two typos
   * apart from each other are reported one by one.
   * Valid once every field of this place has been read (before its children).
   */
  get suspectMerged(): boolean {
    const { repeats, unknown } = this.strays();
    const stray = new Set([...repeats, ...unknown]);
    if (new Set([...stray].map((field) => field.name)).size < 2) return false;
    if ([...stray].some((field) => BLOCK_MARKERS.has(field.name))) return true;
    const indexes = this.fields.map((field, i) => (stray.has(field) ? i : -1)).filter((i) => i !== -1);
    const together = indexes.every((index, i) => i === 0 || index === indexes[i - 1]! + 1);
    return together && (stray.size >= 3 || unknown.length === 0);
  }

  private bad(field: Field, pointer: string, message: string) {
    report(this.ctx, field.line, pointer, "md_bad_value", `${field.name}: ${message}`);
  }

  str(name: string, pointer: string): string | undefined {
    const field = this.field(name, pointer);
    return field && field.value !== "" ? field.value : undefined;
  }

  int(name: string, pointer: string): number | undefined {
    const field = this.field(name, pointer);
    if (!field || field.value === "") return undefined;
    if (!/^[+-]?\d+$/.test(field.value)) {
      this.bad(field, pointer, `phải là số nguyên viết bằng chữ số (vd 2), đang là "${field.value}"`);
      return undefined;
    }
    return Number(field.value);
  }

  num(name: string, pointer: string): number | undefined {
    const field = this.field(name, pointer);
    if (!field || field.value === "") return undefined;
    if (!/^[+-]?(\d+(\.\d+)?|\.\d+)$/.test(field.value)) {
      this.bad(field, pointer, `phải là số viết bằng chữ số (vd 7 hoặc 2.5), đang là "${field.value}"`);
      return undefined;
    }
    return Number(field.value);
  }

  bool(name: string, pointer: string): boolean | undefined {
    const field = this.field(name, pointer);
    if (!field || field.value === "") return undefined;
    if (field.value !== "true" && field.value !== "false") {
      this.bad(field, pointer, `viết true hoặc false (chữ thường, không ngoặc kép), đang là "${field.value}"`);
      return undefined;
    }
    return field.value === "true";
  }

  /** `a, b, c` -> ["a", "b", "c"]; one key is still a list. */
  keys(name: string, pointer: string): { keys: string[]; field: Field } | undefined {
    const field = this.field(name, pointer);
    if (!field || field.value === "") return undefined;
    const parts = field.value.split(",").map((part) => part.trim());
    if (/[[\];]/.test(field.value) || parts.some((part) => part === "" || /\s/.test(part))) {
      this.bad(field, pointer, `danh sách key viết trên một dòng, cách nhau bằng dấu phẩy, không ngoặc, vd "${name}: ${name === "term_keys" ? "nutrient, protein" : "q2_energy"}"; đang là "${field.value}"`);
      return undefined;
    }
    parts.forEach((_, i) => this.ctx.loc.mark(`${pointer}/${i}`, field.line, name));
    return { keys: parts, field };
  }

  /** `<prefix>.en` + `<prefix>.vi` (or `en` + `vi` when prefix is ""). */
  pair(prefix: string, pointer: string): Spoken | undefined {
    const nameOf = (lang: string) => (prefix ? `${prefix}.${lang}` : lang);
    const en = this.field(nameOf("en"), `${pointer}/en`);
    const vi = this.field(nameOf("vi"), `${pointer}/vi`);
    const present = [en, vi].filter((field): field is Field => field !== undefined);
    const filled = present.filter((field) => field.value !== "");
    if (filled.length === 0) {
      // Lines written but left empty: a "missing" error points at them, not at the heading.
      if (present.length > 0) this.ctx.loc.mark(pointer, Math.min(...present.map((field) => field.line)), prefix);
      return undefined;
    }
    this.ctx.loc.mark(pointer, Math.min(...filled.map((field) => field.line)), prefix);
    return assemble([
      ["en", en?.value || undefined],
      ["vi", vi?.value || undefined],
    ]) as Spoken;
  }

  /** `<prefix>.brief`, `<prefix>.alt.en`, `<prefix>.alt.vi` -> { alt, brief }. */
  image(prefix: string, pointer: string): Json | undefined {
    const brief = this.field(`${prefix}.brief`, `${pointer}/brief`);
    const alt = this.pair(`${prefix}.alt`, `${pointer}/alt`);
    const lines = [brief?.value ? brief.line : undefined, alt ? this.ctx.loc.line(`${pointer}/alt`) : undefined].filter((line): line is number => line !== undefined);
    if (lines.length === 0) return undefined;
    this.ctx.loc.mark(pointer, Math.min(...lines), prefix);
    return assemble([
      ["alt", alt],
      ["brief", brief?.value || undefined],
    ]);
  }

  /** `<prefix>.<n>.en|vi` (or `<n>.en|vi`), n = 1, 2, 3… with no gap -> array. */
  numbered(prefix: string, pointer: string): Spoken[] {
    const pattern = new RegExp(`^${prefix ? `${prefix.replace(/\./g, "\\.")}\\.` : ""}(\\d+)\\.(en|vi)$`);
    this.patterns.push({ pattern, example: `${prefix ? `${prefix}.` : ""}1.en` });
    const numbers = new Map<number, number>();
    for (const field of this.fields) {
      const match = pattern.exec(field.name);
      if (match && !numbers.has(Number(match[1]))) numbers.set(Number(match[1]), field.line);
    }
    const sorted = [...numbers.keys()].sort((a, b) => a - b);
    const gap = sorted.findIndex((n, i) => n !== i + 1);
    if (gap !== -1) {
      const n = sorted[gap]!;
      const field = this.fields.find((entry) => pattern.exec(entry.name)?.[1] !== undefined && Number(pattern.exec(entry.name)![1]) === n)!;
      const what = prefix ? `${prefix}.<n>` : "ý chính";
      this.bad(field, pointer, `${what} đánh số liền từ 1 (1, 2, 3…); đang có ${sorted.join(", ")}`);
    }
    const out: Spoken[] = [];
    for (const n of sorted) {
      const raw = this.fields.find((entry) => Number(pattern.exec(entry.name)?.[1]) === n)!.name.replace(/\.(en|vi)$/, "");
      const spoken = this.pair(raw, `${pointer}/${out.length}`);
      if (spoken) out.push(spoken);
    }
    if (out.length > 0) this.ctx.loc.mark(pointer, Math.min(...[...numbers.values()]), prefix);
    return out;
  }

  /** `<prefix>.<key>.en|vi` -> { key: Spoken } in line order. */
  keyed(prefix: string, pointer: string): { value: Record<string, Spoken>; lines: Map<string, number> } | undefined {
    const pattern = new RegExp(`^${prefix.replace(/\./g, "\\.")}\\.([^.]+)\\.(en|vi)$`);
    this.patterns.push({ pattern, example: `${prefix}.<key nhóm>.en` });
    const keys: string[] = [];
    const lines = new Map<string, number>();
    for (const field of this.fields) {
      const key = pattern.exec(field.name)?.[1];
      if (key !== undefined && !keys.includes(key)) {
        keys.push(key);
        lines.set(key, field.line);
      }
    }
    const value: Record<string, Spoken> = {};
    for (const key of keys) {
      const spoken = this.pair(`${prefix}.${key}`, `${pointer}/${escapeToken(key)}`);
      if (spoken) value[key] = spoken;
    }
    if (Object.keys(value).length === 0) return undefined;
    this.ctx.loc.mark(pointer, Math.min(...lines.values()), prefix);
    return { value, lines };
  }

  /** Unknown names, repeated names, [CẦN KIỂM] inside a value. `quiet`: the block's format/type is unknown. */
  finish(quiet = false) {
    const merged = this.suspectMerged;
    if (merged && !quiet) {
      this.ctx.merged = true;
      const { repeats, unknown } = this.strays();
      const lines = [...repeats, ...unknown].sort((a, b) => a.line - b.line);
      const first = lines[0]!;
      const what = repeats.length > 0 && unknown.length > 0 ? "dòng viết lại hoặc không dùng được" : repeats.length > 0 ? "trường viết hai lần" : "trường không dùng được";
      report(this.ctx, first.line, this.owner.pointer, unknown.length > 0 ? "md_unknown_field" : "md_duplicate_field", `${lines.length} ${what} ở ${this.owner.label} (dòng ${lines.map((field) => field.line).join(", ")}); nếu từ dòng ${first.line} là một câu hay khối khác thì thiếu tiêu đề ### (hoặc ####) ngay phía trên`);
    }
    for (const [name, list] of this.byName) {
      if (!this.isKnown(name)) {
        if (quiet || merged) continue;
        const hint = didYouMean(name, this.candidates());
        for (const field of list) {
          report(this.ctx, field.line, this.owner.pointer, "md_unknown_field", `trường "${name}" không dùng được ở ${this.owner.label}.${hint}`);
        }
        continue;
      }
      const filled = list.filter((field) => field.value !== "");
      if (merged) continue;
      for (const extra of filled.slice(1)) {
        report(this.ctx, extra.line, this.pointers.get(name) ?? this.owner.pointer, "md_duplicate_field", `"${name}" viết hai lần ở ${this.owner.label} (lần đầu ở dòng ${filled[0]!.line}); giữ một dòng`);
      }
    }
    for (const field of this.fields) {
      if (field.value.includes(NEEDS_CHECK)) {
        report(this.ctx, field.line, this.pointers.get(field.name) ?? this.owner.pointer, "md_bad_value", `${field.name}: không viết ${NEEDS_CHECK} trong giá trị (trẻ sẽ thấy); chuyển thành dòng "> ${NEEDS_CHECK} …" ngay dưới`);
      }
    }
  }
}

/** `id:` of the frontmatter or a ###. Empty or absent -> a placeholder id in memory only (md_id_missing). */
function readId(ctx: Ctx, reader: Reader, pointer: string, headingLine: number, tracked = true): string {
  const at = `${pointer}/id`;
  const field = reader.field("id", at);
  if (!field || field.value === "") {
    if (tracked) ctx.ids.push({ value: "", line: field?.line ?? headingLine, pointer: at, state: field ? "empty" : "absent" });
    if (!field) ctx.loc.mark(at, headingLine, "id");
    return randomUUID();
  }
  if (!UUID.test(field.value)) {
    report(ctx, field.line, at, "md_id_invalid", `id "${field.value}" không phải UUID chữ thường dạng 8-4-4-4-12; xoá giá trị (để "id:" trống) rồi chạy ids để máy cấp mã mới`);
    ctx.ids.push({ value: field.value, line: field.line, pointer: at, state: "invalid" });
    return field.value;
  }
  ctx.ids.push({ value: field.value, line: field.line, pointer: at, state: "ok" });
  return field.value;
}

function section(doc: ParsedMd, json: string): Section | undefined {
  return doc.sections.find((entry) => entry.spec.json === json);
}

function blockStart(ctx: Ctx, block: Block | Child): Reader {
  ctx.loc.block(block.pointer, block.line, block.heading);
  ctx.loc.mark(`${block.pointer}/key`, block.line, `key (tên trong "${block.heading}")`);
  return new Reader(ctx, { label: block.heading, pointer: block.pointer, line: block.line }, block.fields);
}

/** `## Tiêu đề` style: en: + vi:. */
function pairSection(ctx: Ctx, doc: ParsedMd, json: string): Spoken | undefined {
  const entry = section(doc, json);
  if (!entry) return undefined;
  const reader = new Reader(ctx, { label: entry.heading, pointer: entry.pointer, line: entry.line }, entry.fields);
  const value = reader.pair("", entry.pointer);
  ctx.loc.block(entry.pointer, entry.line, entry.heading);
  reader.finish();
  return value;
}

type ChildBuilder = (ctx: Ctx, child: Child, reader: Reader) => Json;

/** `#### <type> <key>` children of a block, by allowed type; others are md_unknown_child. */
function readChildren(ctx: Ctx, block: Block, owner: string, allowed: Record<string, ChildBuilder>, quiet = false): Map<string, Json[]> {
  const out = new Map<string, Json[]>(Object.keys(allowed).map((type) => [type, []]));
  const names = Object.keys(allowed);
  for (const child of block.children) {
    const build = allowed[child.type];
    if (!build) {
      if (quiet || ctx.merged) continue;
      const usable = names.length > 0 ? `Dùng được: ${names.map((name) => `#### ${name}`).join(", ")}` : `${owner} không có dòng #### nào bên dưới`;
      report(ctx, child.line, block.pointer, "md_unknown_child", `"#### ${child.type}" không dùng được trong ${owner}.${didYouMean(child.type, names)} ${usable}`);
      continue;
    }
    const reader = blockStart(ctx, child);
    const value = build(ctx, child, reader);
    reader.finish();
    out.get(child.type)!.push(value);
  }
  return out;
}

const choiceOption: ChildBuilder = (_ctx, child, reader) => {
  const p = child.pointer;
  const label = reader.pair("label", `${p}/label`);
  const correct = reader.bool("correct", `${p}/correct`);
  const image = reader.image("image", `${p}/image`);
  return assemble([
    ["key", child.key],
    ["label", label],
    ["correct", correct],
    ["image", image],
  ]);
};

const bankWord: ChildBuilder = (_ctx, child, reader) => {
  const label = reader.pair("label", `${child.pointer}/label`);
  const image = reader.image("image", `${child.pointer}/image`);
  return assemble([
    ["key", child.key],
    ["label", label],
    ["image", image],
  ]);
};

const sequenceItem: ChildBuilder = (_ctx, child, reader) => {
  const label = reader.pair("label", `${child.pointer}/label`);
  const image = reader.image("image", `${child.pointer}/image`);
  return assemble([
    ["key", child.key],
    ["label", label],
    ["image", image],
  ]);
};

const bar: ChildBuilder = (_ctx, child, reader) => {
  const p = child.pointer;
  const label = reader.pair("label", `${p}/label`);
  const image = reader.image("image", `${p}/image`);
  const value = reader.num("value", `${p}/value`);
  return assemble([
    ["key", child.key],
    ["label", label],
    ["image", image],
    ["value", value],
  ]);
};

const exploreGroup: ChildBuilder = (_ctx, child, reader) => {
  const p = child.pointer;
  const label = reader.pair("label", `${p}/label`);
  const color = reader.str("color", `${p}/color`);
  const sentence = reader.pair("sentence", `${p}/sentence`);
  const image = reader.image("image", `${p}/image`);
  const examples = reader.numbered("examples", `${p}/examples`);
  return assemble([
    ["key", child.key],
    ["label", label],
    ["color", color],
    ["sentence", sentence],
    ["image", image],
    ["examples", examples],
  ]);
};

const trayGroup: ChildBuilder = (_ctx, child, reader) => {
  const p = child.pointer;
  const label = reader.pair("label", `${p}/label`);
  const color = reader.str("color", `${p}/color`);
  const role = reader.str("role", `${p}/role`);
  return assemble([
    ["key", child.key],
    ["label", label],
    ["color", color],
    ["role", role],
  ]);
};

/** Tray items: `group:` is checked against the tray's groups after all children are read. */
const trayItem: ChildBuilder = (_ctx, child, reader) => {
  const p = child.pointer;
  const label = reader.pair("label", `${p}/label`);
  const groupField = reader.field("group", `${p}/group`);
  const group = groupField?.value || undefined;
  const image = reader.image("image", `${p}/image`);
  const item = assemble([
    ["key", child.key],
    ["label", label],
    ["group", group],
    ["image", image],
  ]);
  if (groupField && group) (item as Json & { [GROUP_LINE]?: number })[GROUP_LINE] = groupField.line;
  return item;
};
const GROUP_LINE = Symbol("group line");

function checkKeys(ctx: Ctx, used: { keys: string[]; field: Field } | undefined, pointer: string, targets: string[], what: string) {
  if (!used) return;
  used.keys.forEach((key, i) => {
    if (targets.includes(key)) return;
    report(ctx, used.field.line, `${pointer}/${i}`, "md_ref_unknown", `${used.field.name}: không có ${what} "${key}".${didYouMean(key, targets)} Đang có: ${targets.join(", ") || "(chưa có)"}`);
  });
}

function quizItem(ctx: Ctx, block: Block, topic: TopicRef, lookup: Lookup): Json {
  const p = block.pointer;
  const reader = blockStart(ctx, block);
  const formatField = reader.field("format", `${p}/format`);
  const format = formatField?.value || undefined;
  const known = format !== undefined && (QUIZ_FORMATS_MD as readonly string[]).includes(format);
  // A block that is not a recognisable question (no known format, wrong heading level) gets no md_id_missing.
  const id = readId(ctx, reader, p, block.line, known && !block.levelError);
  if (known) reader.owner.label = `${block.heading} (câu ${format})`;
  if (!format) {
    report(ctx, formatField?.line ?? block.line, `${p}/format`, "md_unknown_format", `${block.heading} thiếu "format:"; dùng được: ${QUIZ_FORMATS_MD.join(", ")}`);
  } else if (!known) {
    report(ctx, formatField!.line, `${p}/format`, "md_unknown_format", `format "${format}" không có.${didYouMean(format, QUIZ_FORMATS_MD)} Dùng được: ${QUIZ_FORMATS_MD.join(", ")}`);
  }
  const version = reader.int("version", `${p}/version`);
  const dok = reader.int("dok", `${p}/dok`);
  const prompt = reader.pair("prompt", `${p}/prompt`);
  const instruction = reader.pair("instruction", `${p}/instruction`);
  const image = reader.image("image", `${p}/image`);
  const hint = reader.pair("hint", `${p}/hint`);
  const explanationCorrect = reader.pair("explanation_correct", `${p}/explanation_correct`);
  const explanationWrong = reader.pair("explanation_wrong", `${p}/explanation_wrong`);

  const misconceptionField = reader.field("misconception", `${p}/misconception_id`);
  let misconceptionId: string | undefined;
  if (misconceptionField?.value) {
    misconceptionId = topic.misconceptions.get(misconceptionField.value);
    if (misconceptionId === undefined && topic.misconceptionsKnown) {
      const keys = [...topic.misconceptions.keys()];
      report(ctx, misconceptionField.line, `${p}/misconception_id`, "md_ref_unknown", `misconception: "${misconceptionField.value}" không có trong ## Misconceptions của _topic.md.${didYouMean(misconceptionField.value, keys)} Đang có: ${keys.join(", ") || "(chưa có)"}`);
    }
  }

  const kind = reader.str("recall_from.kind", `${p}/recall_from/kind`);
  const note = reader.pair("recall_from.note", `${p}/recall_from/note`);
  const lessonField = reader.field("recall_from.lesson", `${p}/recall_from/lesson_id`);
  let lessonId: string | undefined;
  if (lessonField?.value) {
    const [topicSlug, lessonSlug, ...more] = lessonField.value.split("/");
    if (!topicSlug || !lessonSlug || more.length > 0) {
      report(ctx, lessonField.line, `${p}/recall_from/lesson_id`, "md_bad_value", `recall_from.lesson: viết <slug chủ đề>/<slug bài>, vd an-uong-lanh-manh/thuc-an-cho-ta-nhung-gi; đang là "${lessonField.value}"`);
    } else {
      const found = lookup.lesson(topicSlug, lessonSlug);
      if (!found) {
        report(ctx, lessonField.line, `${p}/recall_from/lesson_id`, "md_ref_unknown", `recall_from.lesson: không có bài "${lessonField.value}" trong gốc nội dung.${didYouMean(lessonField.value, lookup.lessonRefs())}`);
      } else if (!found.id) {
        report(ctx, lessonField.line, `${p}/recall_from/lesson_id`, "md_ref_unknown", `recall_from.lesson: bài "${lessonField.value}" chưa có id; chạy ids cho bài đó trước`);
      } else lessonId = found.id;
    }
  }
  let recallFrom: Json | undefined;
  if (kind !== undefined || note !== undefined || lessonField?.value) {
    recallFrom = assemble([
      ["kind", kind],
      ["note", note],
      ["lesson_id", lessonId ?? (lessonField?.value ? lessonField.value : undefined)],
    ]);
  }

  const base: [string, unknown][] = [
    ["id", id],
    ["key", block.key],
    ["format", format],
    ["version", version],
    ["dok", dok],
    ["prompt", prompt],
    ["instruction", instruction],
    ["image", image],
    ["hint", hint],
    ["explanation_correct", explanationCorrect],
    ["explanation_wrong", explanationWrong],
    ["misconception_id", misconceptionId],
    ["recall_from", recallFrom],
  ];
  const owner = `${block.heading} (câu ${format ?? "?"})`;
  if (!known) {
    // Unknown format: no per-format fields, no children, no "unknown field" noise (one error only).
    reader.finish(true);
    return assemble(base);
  }
  let extra: [string, unknown][] = [];
  if (format === "single_choice" || format === "multi_choice") {
    const children = readChildren(ctx, block, owner, { option: choiceOption }, reader.suspectMerged);
    extra = [["options", children.get("option")]];
  } else if (format === "true_false") {
    const answer = reader.bool("answer", `${p}/answer`);
    const statement = reader.pair("statement", `${p}/statement`);
    const speaker = reader.str("speaker", `${p}/speaker`);
    const labelTrue = reader.pair("labels.true", `${p}/labels/true`);
    const labelFalse = reader.pair("labels.false", `${p}/labels/false`);
    let labels: Json | undefined;
    if (labelTrue || labelFalse) {
      labels = assemble([
        ["true", labelTrue],
        ["false", labelFalse],
      ]);
      const lines = [labelTrue && ctx.loc.line(`${p}/labels/true`), labelFalse && ctx.loc.line(`${p}/labels/false`)].filter((line): line is number => typeof line === "number");
      ctx.loc.mark(`${p}/labels`, Math.min(...lines), "labels");
    }
    readChildren(ctx, block, owner, {}, reader.suspectMerged);
    extra = [
      ["answer", answer],
      ["statement", statement],
      ["speaker", speaker],
      ["labels", labels],
    ];
  } else if (format === "fill_blank_bank") {
    const sentence = reader.pair("sentence", `${p}/sentence`);
    const answers = reader.keys("answers", `${p}/answers`);
    const children = readChildren(ctx, block, owner, { bank: bankWord }, reader.suspectMerged);
    const bank = children.get("bank")!;
    checkKeys(ctx, answers, `${p}/answers`, bank.map((word) => String(word.key)), "#### bank");
    extra = [
      ["sentence", sentence],
      ["bank", bank],
      ["answers", answers?.keys],
    ];
  } else if (format === "order_sequence") {
    const answer = reader.keys("answer", `${p}/answer`);
    const children = readChildren(ctx, block, owner, { item: sequenceItem }, reader.suspectMerged);
    const items = children.get("item")!;
    checkKeys(ctx, answer, `${p}/answer`, items.map((item) => String(item.key)), "#### item");
    extra = [
      ["items", items],
      ["answer", answer?.keys],
    ];
  } else if (format === "picture_bar_chart") {
    const title = reader.pair("chart.title", `${p}/chart/title`);
    const unit = reader.pair("chart.unit", `${p}/chart/unit`);
    const children = readChildren(ctx, block, owner, { bar, option: choiceOption }, reader.suspectMerged);
    extra = [
      [
        "chart",
        assemble([
          ["title", title],
          ["unit", unit],
          ["bars", children.get("bar")],
        ]),
      ],
      ["options", children.get("option")],
    ];
  }
  reader.finish();
  return assemble([...base, ...extra]);
}

type VocabCheck = (vocabKeys: () => string[]) => void;

function lessonBlock(ctx: Ctx, block: Block, allowedTypes: readonly string[], sectionName: string, later: (check: VocabCheck) => void): Json {
  const p = block.pointer;
  const reader = blockStart(ctx, block);
  const typeField = reader.field("type", `${p}/type`);
  const type = typeField?.value || undefined;
  const id = readId(ctx, reader, p, block.line, type !== undefined && allowedTypes.includes(type) && !block.levelError);
  const version = reader.int("version", `${p}/version`);
  const minAppVersion = reader.str("min_app_version", `${p}/min_app_version`);
  const base: [string, unknown][] = [
    ["id", id],
    ["key", block.key],
    ["type", type],
    ["version", version],
    ["min_app_version", minAppVersion],
  ];
  const all = [...LEARN_TYPES, ...PLAY_TYPES] as readonly string[];
  if (type && allowedTypes.includes(type)) reader.owner.label = `${block.heading} (${type})`;
  if (!type || !allowedTypes.includes(type)) {
    if (!type) {
      report(ctx, typeField?.line ?? block.line, `${p}/type`, "md_unknown_type", `${block.heading} thiếu "type:"; ở ## ${sectionName} dùng được: ${allowedTypes.join(", ")}`);
    } else if (all.includes(type)) {
      report(ctx, typeField!.line, `${p}/type`, "md_unknown_type", `type "${type}" không dùng ở ## ${sectionName}; ở mục này dùng được: ${allowedTypes.join(", ")}`);
    } else {
      report(ctx, typeField!.line, `${p}/type`, "md_unknown_type", `type "${type}" không có.${didYouMean(type, allowedTypes)} Ở ## ${sectionName} dùng được: ${allowedTypes.join(", ")}`);
    }
    reader.finish(true);
    return assemble(base);
  }
  const owner = `${block.heading} (${type})`;
  let extra: [string, unknown][] = [];
  if (type === "explore_groups") {
    const prompt = reader.pair("prompt", `${p}/prompt`);
    const completeWhen = reader.str("complete_when", `${p}/complete_when`);
    const groups = readChildren(ctx, block, owner, { group: exploreGroup }, reader.suspectMerged).get("group");
    extra = [
      ["prompt", prompt],
      ["groups", groups],
      ["complete_when", completeWhen],
    ];
  } else if (type === "sentence_card") {
    const text = reader.pair("text", `${p}/text`);
    const image = reader.image("image", `${p}/image`);
    readChildren(ctx, block, owner, {}, reader.suspectMerged);
    extra = [
      ["text", text],
      ["image", image],
    ];
  } else if (type === "word_list") {
    const title = reader.pair("title", `${p}/title`);
    const termKeys = reader.keys("term_keys", `${p}/term_keys`);
    readChildren(ctx, block, owner, {}, reader.suspectMerged);
    later((vocabKeys) => checkKeys(ctx, termKeys, `${p}/term_keys`, vocabKeys(), "từ nào ở ## Từ vựng có key"));
    extra = [
      ["title", title],
      ["term_keys", termKeys?.keys],
    ];
  } else if (type === "build_tray") {
    const prompt = reader.pair("prompt", `${p}/prompt`);
    const capacity = reader.int("capacity", `${p}/capacity`);
    const messages: [string, unknown][] = ["start", "full", "balanced", "has_limited"].map((name) => [name, reader.pair(`messages.${name}`, `${p}/messages/${name}`)]);
    const missing = reader.keyed("messages.missing", `${p}/messages/missing`);
    const successWhen = reader.str("success_when", `${p}/success_when`);
    const children = readChildren(ctx, block, owner, { group: trayGroup, item: trayItem }, reader.suspectMerged);
    const groups = children.get("group")!;
    const items = children.get("item")!;
    const groupKeys = groups.map((group) => String(group.key));
    items.forEach((item, i) => {
      const key = item.group as string | undefined;
      const line = (item as Json & { [GROUP_LINE]?: number })[GROUP_LINE];
      delete (item as Json & { [GROUP_LINE]?: number })[GROUP_LINE];
      if (key !== undefined && line !== undefined && !groupKeys.includes(key)) {
        report(ctx, line, `${p}/items/${i}/group`, "md_ref_unknown", `group: không có #### group "${key}" trong ${block.heading}.${didYouMean(key, groupKeys)} Đang có: ${groupKeys.join(", ") || "(chưa có)"}`);
      }
    });
    if (missing) {
      for (const [key, line] of missing.lines) {
        if (!groupKeys.includes(key)) {
          report(ctx, line, `${p}/messages/missing/${escapeToken(key)}`, "md_ref_unknown", `messages.missing.${key}: không có #### group "${key}" trong ${block.heading}.${didYouMean(key, groupKeys)} Đang có: ${groupKeys.join(", ") || "(chưa có)"}`);
        }
      }
    }
    const messageEntries = [...messages, ["missing", missing?.value]] as [string, unknown][];
    const messageObject = messageEntries.some(([, value]) => value !== undefined) ? assemble(messageEntries) : undefined;
    if (messageObject) {
      const lines = messageEntries.flatMap(([name, value]) => (value !== undefined ? [ctx.loc.line(`${p}/messages/${name}`)] : []));
      ctx.loc.mark(`${p}/messages`, Math.min(...lines), "messages");
    }
    extra = [
      ["prompt", prompt],
      ["capacity", capacity],
      ["groups", groups],
      ["items", items],
      ["messages", messageObject],
      ["success_when", successWhen],
    ];
  }
  reader.finish();
  return assemble([...base, ...extra]);
}

function vocabTerm(ctx: Ctx, block: Block): Json {
  const p = block.pointer;
  const reader = blockStart(ctx, block);
  const id = readId(ctx, reader, p, block.line, !block.levelError);
  const term = reader.pair("term", `${p}/term`);
  const example = reader.pair("example", `${p}/example`);
  const image = reader.image("image", `${p}/image`);
  const tier = reader.str("tier", `${p}/tier`);
  readChildren(ctx, block, block.heading, {}, reader.suspectMerged);
  reader.finish();
  return assemble([
    ["id", id],
    ["key", block.key],
    ["term", term],
    ["example", example],
    ["image", image],
    ["tier", tier],
  ]);
}

function collectible(ctx: Ctx, block: Block): Json {
  const p = block.pointer;
  const reader = blockStart(ctx, block);
  const id = readId(ctx, reader, p, block.line, !block.levelError);
  const set = reader.str("set", `${p}/set`);
  const name = reader.pair("name", `${p}/name`);
  const tag = reader.pair("tag", `${p}/tag`);
  const image = reader.image("image", `${p}/image`);
  const fact = reader.pair("fact", `${p}/fact`);
  const rarity = reader.str("rarity", `${p}/rarity`);
  readChildren(ctx, block, block.heading, {}, reader.suspectMerged);
  reader.finish();
  return assemble([
    ["id", id],
    ["key", block.key],
    ["set", set],
    ["name", name],
    ["tag", tag],
    ["image", image],
    ["fact", fact],
    ["rarity", rarity],
  ]);
}

function misconception(ctx: Ctx, block: Block): Json {
  const p = block.pointer;
  const reader = blockStart(ctx, block);
  const id = readId(ctx, reader, p, block.line, !block.levelError);
  const statement = reader.pair("statement", `${p}/statement`);
  const correction = reader.pair("correction", `${p}/correction`);
  const note = reader.str("note", `${p}/note`);
  readChildren(ctx, block, block.heading, {}, reader.suspectMerged);
  reader.finish();
  return assemble([
    ["id", id],
    ["key", block.key],
    ["statement", statement],
    ["correction", correction],
    ["note", note],
  ]);
}

function blocksOf(doc: ParsedMd, json: string): { entry?: Section; blocks: Block[] } {
  const entry = section(doc, json);
  return { entry, blocks: entry?.blocks ?? [] };
}

function markSection(ctx: Ctx, entry: Section | undefined) {
  if (entry) ctx.loc.block(entry.pointer, entry.line, entry.heading);
}

/** Frontmatter keys every file must have (the schema `required` list, in markdown names). */
const REQUIRED_FRONTMATTER = {
  topic: ["slug", "age_group", "order", "strand", "level", "difficulty", "prerequisites", "is_free"],
  lesson: ["topic", "slug", "order", "stage", "est_minutes"],
} as const;

function requireFrontmatter(ctx: Ctx, doc: ParsedMd, reader: Reader, names: readonly string[]) {
  if (!doc.frontmatter) return;
  for (const name of names) {
    const fields = reader.fields.filter((field) => field.name.toLowerCase() === name || field.name.toLowerCase().startsWith(`${name}.`));
    if (fields.some((field) => field.value !== "") || (name === "difficulty" && fields.length > 0)) continue;
    const pointer = name === "topic" ? "/topic_id" : name === "prerequisites" ? "/prerequisite_topic_ids" : `/${name}`;
    const hint = name === "prerequisites" ? '; chủ đề không có điều kiện thì viết "prerequisites: []"' : "";
    if (fields.length > 0) report(ctx, fields[0]!.line, pointer, "md_frontmatter", `"${name}:" đang trống${hint}`);
    else report(ctx, 1, pointer, "md_frontmatter", `frontmatter thiếu dòng "${name}:"${hint}`);
  }
}

export function convertTopic(doc: ParsedMd, lookup: Lookup): Converted {
  const ctx = newCtx(doc);
  ctx.loc.block("", 1, "frontmatter");
  const fm = new Reader(ctx, { label: "frontmatter", pointer: "", line: 1 }, doc.frontmatter?.fields ?? []);
  const id = readId(ctx, fm, "", 1, doc.frontmatter !== undefined);
  const slug = fm.str("slug", "/slug");
  const ageGroup = fm.str("age_group", "/age_group");
  const order = fm.int("order", "/order");
  const strand = fm.str("strand", "/strand");
  const level = fm.int("level", "/level");
  const difficultyLine = fm.field("difficulty", "/difficulty");
  const scores = DIFFICULTY_KEYS.map((key) => [key, fm.int(`difficulty.${key}`, `/difficulty/${key}`)] as [string, number | undefined]);
  const difficulty = difficultyLine || scores.some(([, value]) => value !== undefined) ? assemble(scores) : undefined;

  const prerequisitesField = fm.field("prerequisites", "/prerequisite_topic_ids");
  let prerequisites: string[] | undefined;
  if (prerequisitesField?.value) {
    const match = /^\[(.*)\]$/.exec(prerequisitesField.value);
    const slugs = match ? match[1]!.split(",").map((part) => part.trim()).filter((part, i, all) => part !== "" || all.length > 1) : undefined;
    if (!slugs || slugs.some((part) => part === "" || /\s/.test(part))) {
      report(ctx, prerequisitesField.line, "/prerequisite_topic_ids", "md_bad_value", `prerequisites: viết "prerequisites: []" hoặc "prerequisites: [slug-chu-de-a, slug-chu-de-b]"; đang là "${prerequisitesField.value}"`);
    } else {
      prerequisites = [];
      for (const [i, prerequisite] of slugs.entries()) {
        ctx.loc.mark(`/prerequisite_topic_ids/${i}`, prerequisitesField.line, "prerequisites");
        const found = lookup.topic(prerequisite);
        if (!found) {
          report(ctx, prerequisitesField.line, `/prerequisite_topic_ids/${i}`, "md_ref_unknown", `prerequisites: không có chủ đề "${prerequisite}" (thư mục có _topic.md) trong gốc nội dung.${didYouMean(prerequisite, lookup.topicSlugs())}`);
        } else if (!found.id) {
          report(ctx, prerequisitesField.line, `/prerequisite_topic_ids/${i}`, "md_ref_unknown", `prerequisites: chủ đề "${prerequisite}" chưa có id; chạy ids cho chủ đề đó trước`);
        } else prerequisites.push(found.id);
      }
    }
  }
  const isFree = fm.bool("is_free", "/is_free");
  const oak = fm.str("oak_unit_ref", "/oak_unit_ref");
  const sensitive = fm.bool("sensitive", "/sensitive");
  const archived = fm.bool("archived", "/archived");
  const aiDraft = fm.bool("ai_draft", "/ai_draft");
  fm.finish();
  requireFrontmatter(ctx, doc, fm, REQUIRED_FRONTMATTER.topic);

  const title = pairSection(ctx, doc, "title");
  const question = pairSection(ctx, doc, "question");
  const { entry, blocks } = blocksOf(doc, "misconceptions");
  markSection(ctx, entry);
  const misconceptions = blocks.map((block) => misconception(ctx, block));

  const folder = folderOf(doc.path);
  const slugField = fm.fields.find((field) => field.name === "slug" && field.value !== "");
  if (slug !== undefined && slug !== folder) {
    report(ctx, slugField!.line, "/slug", "md_filename", `slug: "${slug}" phải trùng tên thư mục chủ đề "${folder}"`);
  }
  const data = assemble([
    ["kind", "topic"],
    ["schema_version", 1],
    ["id", id],
    ["slug", slug],
    ["age_group", ageGroup],
    ["order", order],
    ["title", title],
    ["question", question],
    ["strand", strand],
    ["level", level],
    ["difficulty", difficulty],
    ["prerequisite_topic_ids", prerequisites],
    ["is_free", isFree],
    ["oak_unit_ref", oak],
    ["sensitive", sensitive],
    ["archived", archived],
    ["ai_draft", aiDraft],
    ["misconceptions", misconceptions],
  ]);
  const topicRef: TopicRef = {
    id,
    folder,
    misconceptions: new Map(misconceptions.map((entry) => [String(entry.key), String(entry.id)])),
    misconceptionsKnown: entry !== undefined,
  };
  return { doc, data, loc: ctx.loc, issues: ctx.issues, ids: ctx.ids, topicRef };
}

export function convertLesson(doc: ParsedMd, topic: TopicRef, lookup: Lookup): Converted {
  const ctx = newCtx(doc);
  ctx.loc.block("", 1, "frontmatter");
  const fm = new Reader(ctx, { label: "frontmatter", pointer: "", line: 1 }, doc.frontmatter?.fields ?? []);
  const id = readId(ctx, fm, "", 1, doc.frontmatter !== undefined);
  const topicField = fm.field("topic", "/topic_id");
  if (topicField?.value && topicField.value !== topic.folder) {
    report(ctx, topicField.line, "/topic_id", "md_filename", `topic: "${topicField.value}" phải trùng tên thư mục chủ đề "${topic.folder}"`);
  }
  const slug = fm.str("slug", "/slug");
  const order = fm.int("order", "/order");
  const stage = fm.str("stage", "/stage");
  const estMinutes = fm.int("est_minutes", "/est_minutes");
  const sensitive = fm.bool("sensitive", "/sensitive");
  const archived = fm.bool("archived", "/archived");
  const aiDraft = fm.bool("ai_draft", "/ai_draft");
  fm.finish();
  requireFrontmatter(ctx, doc, fm, REQUIRED_FRONTMATTER.lesson);

  const title = pairSection(ctx, doc, "title");
  const objective = pairSection(ctx, doc, "objective");
  const pointsSection = section(doc, "key_points");
  let keyPoints: Spoken[] = [];
  if (pointsSection) {
    markSection(ctx, pointsSection);
    const reader = new Reader(ctx, { label: pointsSection.heading, pointer: pointsSection.pointer, line: pointsSection.line }, pointsSection.fields);
    keyPoints = reader.numbered("", pointsSection.pointer);
    reader.finish();
  }

  const quizSection = (json: "warmup" | "quiz") => {
    const { entry, blocks } = blocksOf(doc, json);
    markSection(ctx, entry);
    return blocks.map((block) => quizItem(ctx, block, topic, lookup));
  };
  const later: VocabCheck[] = [];
  const warmup = quizSection("warmup");

  const learnSection = blocksOf(doc, "learn");
  markSection(ctx, learnSection.entry);
  const learn = learnSection.blocks.map((block) => lessonBlock(ctx, block, LEARN_TYPES, "Học", (check) => later.push(check)));

  const playSection = blocksOf(doc, "play");
  markSection(ctx, playSection.entry);
  let play: Json | undefined;
  if (playSection.entry && playSection.blocks.length === 0 && playSection.entry.orphan === undefined) {
    report(ctx, playSection.entry.line, "/play", "md_block_count", `## Chơi cần đúng một ### (block chơi, vd "### tray" với "type: build_tray"); đang trống`);
  }
  playSection.blocks.forEach((block, i) => {
    if (i === 0) play = lessonBlock(ctx, block, PLAY_TYPES, "Chơi", (check) => later.push(check));
    else report(ctx, block.line, "/play", "md_block_count", `## Chơi chỉ có một ### (block chơi); "${block.heading}" là ### thứ ${i + 1}`);
  });

  const quiz = quizSection("quiz");

  const vocabSection = blocksOf(doc, "vocab");
  markSection(ctx, vocabSection.entry);
  const vocab = vocabSection.blocks.map((block) => vocabTerm(ctx, block));

  const rewardSection = blocksOf(doc, "reward");
  markSection(ctx, rewardSection.entry);
  let reward: Json = {};
  rewardSection.blocks.forEach((block, i) => {
    if (i === 0) reward = { collectible: collectible(ctx, block) };
    else report(ctx, block.line, "/reward", "md_block_count", `## Thưởng có tối đa một ### (một thẻ); "${block.heading}" là ### thứ ${i + 1}`);
  });

  // term_keys point into ## Từ vựng; when that section is missing (already an error) skip them.
  const vocabKeys = () => vocab.map((term) => String(term.key));
  if (vocabSection.entry && !ctx.merged) for (const check of later) check(vocabKeys);

  // File name <nn>-<slug>.md (TEMPLATE section A): nn = order on two digits, the rest = slug.
  const name = basename(doc.path);
  const match = /^(\d{2})-(.+)\.md$/.exec(name);
  if (match) {
    const orderField = fm.fields.find((field) => field.name === "order" && field.value !== "");
    if (order !== undefined && orderField && String(order).padStart(2, "0") !== match[1]) {
      report(ctx, orderField.line, "/order", "md_filename", `tên file bắt đầu bằng ${match[1]} nhưng order: ${order}; đổi tên file thành ${String(order).padStart(2, "0")}-${match[2]}.md hoặc sửa order`);
    }
    const slugField = fm.fields.find((field) => field.name === "slug" && field.value !== "");
    if (slug !== undefined && slugField && slug !== match[2]) {
      report(ctx, slugField.line, "/slug", "md_filename", `tên file là ${name} nhưng slug: ${slug}; phần sau "${match[1]}-" phải trùng slug`);
    }
  }

  const data = assemble([
    ["kind", "lesson"],
    ["schema_version", 1],
    ["id", id],
    ["topic_id", topic.id],
    ["slug", slug],
    ["order", order],
    ["stage", stage],
    ["title", title],
    ["objective", objective],
    ["key_points", keyPoints],
    ["est_minutes", estMinutes],
    ["sensitive", sensitive],
    ["archived", archived],
    ["ai_draft", aiDraft],
    ["warmup", warmup],
    ["learn", learn],
    ["play", play],
    ["quiz", quiz],
    ["vocab", vocab],
    ["reward", reward],
  ]);
  return { doc, data, loc: ctx.loc, issues: ctx.issues, ids: ctx.ids };
}

function basename(file: string): string {
  return path.basename(file);
}

function folderOf(file: string): string {
  return path.basename(path.dirname(file));
}
