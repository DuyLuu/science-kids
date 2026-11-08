// Markdown lesson / topic files (content/TEMPLATE.md, section A "Cú pháp"), read line by line:
//   frontmatter `---` … `---` (flat `name: value`, `difficulty:` with indented sub keys),
//   `## <section>` from a fixed list, `### <key>` blocks, `#### <type> <key>` children,
//   `name: value` fields (split at the first ":"), `>` notes and blank lines skipped,
//   the "Ghi chú…" sections skipped whole. Anything else in a structured place is md_bad_line.
// This step only knows the shape of the file; field names and values are checked in convert.ts.
import { didYouMean, foldName, NEEDS_CHECK, splitSource, suggest, type MdIssue, type SourceText } from "./source.ts";

export type DocKind = "topic" | "lesson";
export type SectionKind = "pair" | "numbered" | "quiz" | "learn" | "play" | "vocab" | "reward" | "misconceptions" | "notes";
export type SectionSpec = { name: string; kind: SectionKind; json?: string; required: boolean; aliases?: string[] };

/** Canonical order (TEMPLATE.md section B). Notes sections may be left out. */
export const LESSON_SECTIONS: readonly SectionSpec[] = [
  { name: "Tiêu đề", kind: "pair", json: "title", required: true },
  { name: "Mục tiêu", kind: "pair", json: "objective", required: true },
  { name: "Ý chính", kind: "numbered", json: "key_points", required: true },
  { name: "Khởi động", kind: "quiz", json: "warmup", required: true },
  { name: "Học", kind: "learn", json: "learn", required: true },
  { name: "Chơi", kind: "play", json: "play", required: true },
  { name: "Quiz", kind: "quiz", json: "quiz", required: true },
  { name: "Từ vựng", kind: "vocab", json: "vocab", required: true },
  { name: "Thưởng", kind: "reward", json: "reward", required: true },
  { name: "Ghi chú cho hoạ sĩ", kind: "notes", required: false, aliases: ["Ghi chú cho họa sĩ"] },
  { name: "Ghi chú cho dev", kind: "notes", required: false },
];

export const TOPIC_SECTIONS: readonly SectionSpec[] = [
  { name: "Tiêu đề", kind: "pair", json: "title", required: true },
  { name: "Câu hỏi lớn", kind: "pair", json: "question", required: true },
  { name: "Misconceptions", kind: "misconceptions", json: "misconceptions", required: true },
  { name: "Ghi chú", kind: "notes", required: false },
];

const BLOCK_SECTIONS = new Set<SectionKind>(["quiz", "learn", "play", "vocab", "reward", "misconceptions"]);
/** `#### <type>` -> array of the parent object (bars live in chart.bars). */
export const CHILD_ARRAYS: Readonly<Record<string, string>> = { option: "options", bank: "bank", item: "items", bar: "chart/bars", group: "groups" };

export type Field = { name: string; value: string; line: number };
/** `levelError`: written with the wrong number of # (md_heading_level); read as if corrected, never given an id by `ids`. */
export type Child = { type: string; key: string; heading: string; line: number; pointer: string; fields: Field[]; levelError?: boolean };
export type Block = { key: string; heading: string; line: number; pointer: string; fields: Field[]; children: Child[]; levelError?: boolean };
/** `orphan`: first `name: value` line written under a ### section before any ### (reported once). */
export type Section = { spec: SectionSpec; heading: string; line: number; pointer: string; fields: Field[]; blocks: Block[]; orphan?: number };
export type Frontmatter = { open: boolean; close: boolean; fields: Field[] };

export type ParsedMd = {
  kind: DocKind;
  path: string;
  display: string;
  source: SourceText;
  /** undefined: the file has no frontmatter at all (one md_frontmatter issue says so). */
  frontmatter?: Frontmatter;
  /** Structured sections, first occurrence of each known name, in file order. */
  sections: Section[];
  issues: MdIssue[];
  /** Lines that contain [CẦN KIỂM]. */
  needsCheck: number[];
  /**
   * Line ranges where a missing `##` heading let its content fall into the section before
   * (or before the first section). Step-1 errors there are consequences of md_missing_section
   * and are not printed (check.ts).
   */
  shadows: { from: number; to: number }[];
};

const FIELD = /^([^\s:]+):(.*)$/;
const HEADING = /^(#+)(?:\s+(.*))?$/;
/** Key lists written on one line; JSON name for the pointer. */
const LIST_FIELDS: Readonly<Record<string, string>> = { term_keys: "term_keys", answers: "answers", answer: "answer", prerequisites: "prerequisite_topic_ids" };

export function sectionSpecs(kind: DocKind): readonly SectionSpec[] {
  return kind === "topic" ? TOPIC_SECTIONS : LESSON_SECTIONS;
}

export function parseMarkdown(kind: DocKind, path: string, display: string, raw: string): ParsedMd {
  const source = splitSource(raw);
  const lines = source.lines.map((line) => line.normalize("NFC"));
  const issues: MdIssue[] = [];
  const issue = (line: number, pointer: string, code: string, message: string) =>
    issues.push({ file: display, line, pointer, code, severity: "error", message });
  const needsCheck = lines.flatMap((line, i) => (line.includes(NEEDS_CHECK) ? [i + 1] : []));

  // 1. Frontmatter: from a `---` on line 1 to the next `---` before the first `##`.
  const firstSection = lines.findIndex((line) => /^##(\s|$)/.test(line));
  const limit = firstSection === -1 ? lines.length : firstSection;
  const open = lines[0]?.trim() === "---";
  let close = -1;
  for (let i = open ? 1 : 0; i < limit; i++) {
    if (lines[i]!.trim() === "---") {
      close = i;
      break;
    }
  }
  let frontmatter: Frontmatter | undefined;
  let bodyStart = 0;
  if (!open && close === -1) {
    // No --- at all: read the lines before the first ## as the frontmatter anyway (one error, no cascade).
    issue(1, "", "md_frontmatter", "frontmatter phải nằm giữa hai dòng --- (dòng 1 và dòng sau khoá cuối), trước mục ## đầu tiên (TEMPLATE mục B)");
    const fields = readFrontmatter(lines, 0, limit, () => {});
    if (fields.length > 0) frontmatter = { open: false, close: false, fields };
    bodyStart = limit;
  } else {
    if (!open) issue(1, "", "md_frontmatter", `thiếu dòng --- mở frontmatter ở dòng 1 (dòng --- đóng ở dòng ${close + 1})`);
    if (close === -1) issue(1, "", "md_frontmatter", "thiếu dòng --- đóng frontmatter (trước mục ## đầu tiên)");
    const from = open ? 1 : 0;
    const to = close === -1 ? limit : close;
    frontmatter = { open, close: close !== -1, fields: readFrontmatter(lines, from, to, issue) };
    bodyStart = close === -1 ? limit : close + 1;
  }

  // 2. Body.
  const specs = sectionSpecs(kind);
  const sections: Section[] = [];
  const seen = new Map<string, number>();
  const unknownHints: string[] = [];
  /** null = before the first `##`; "skip" = inside a notes / unknown / repeated section, or after a misplaced heading. */
  let section: Section | null | "skip" = null;
  /** `###` headings under a section that has no ### (often content of a missing ## section). */
  const misplaced: { line: number; title: string }[] = [];
  let skipUntilLevel = 0;
  let block: Block | null = null;
  let child: Child | null = null;
  let lastField: { field: Field; index: number } | null = null;
  let run: { start: number; last: number; count: number; pointer: string; text: string; after: { field: Field; index: number } | null } | null = null;
  const childCounts = new Map<string, number>();

  const flush = () => {
    if (!run) return;
    const { start, last, count, pointer, text, after } = run;
    run = null;
    if (after && after.field.value === "" && Object.hasOwn(LIST_FIELDS, after.field.name) && /^([-*+]\s|\d+\.\s)/.test(text)) {
      issue(after.field.line, `${pointer}/${LIST_FIELDS[after.field.name]}`, "md_bad_value", `${after.field.name}: danh sách key viết trên một dòng, cách nhau bằng dấu phẩy, ví dụ "${after.field.name}: ${after.field.name === "prerequisites" ? "[an-uong-lanh-manh]" : "nutrient, protein"}"; không viết thành các dòng "-"`);
      return;
    }
    const span = count > 1 ? ` (${count} dòng, tới dòng ${last})` : "";
    issue(start, pointer, "md_bad_line", `${badLineReason(text, after)}${span}`);
  };
  const where = () => child?.pointer ?? block?.pointer ?? (section && section !== "skip" ? section.pointer : "");
  /** A `###` of the current (block) section. */
  const openBlock = (n: number, title: string, levelError: boolean): Block => {
    const current = section as Section;
    const index = current.blocks.length;
    const pointer = current.spec.kind === "play" ? "/play" : current.spec.kind === "reward" ? "/reward/collectible" : `/${current.spec.json}/${index}`;
    block = { key: title, heading: `### ${title}`, line: n, pointer, fields: [], children: [], ...(levelError ? { levelError } : {}) };
    child = null;
    current.blocks.push(block);
    childCounts.clear();
    return block;
  };
  /** A `#### <type> <key>` of the current block. */
  const openChild = (n: number, title: string, levelError: boolean): Child => {
    const owner = block as Block;
    const [type = "", ...rest] = title.split(/\s+/);
    const array = CHILD_ARRAYS[type];
    let pointer = owner.pointer;
    if (array) {
      const index = childCounts.get(type) ?? 0;
      childCounts.set(type, index + 1);
      pointer = `${owner.pointer}/${array}/${index}`;
    }
    child = { type, key: rest.join(" "), heading: `#### ${title}`, line: n, pointer, fields: [], ...(levelError ? { levelError } : {}) };
    owner.children.push(child);
    return child;
  };

  for (let i = bodyStart; i < lines.length; i++) {
    const n = i + 1;
    const text = lines[i]!.trim();
    if (text === "") continue;
    if (text.startsWith(">")) {
      flush();
      lastField = null;
      continue;
    }
    const heading = HEADING.exec(text);
    if (heading) {
      flush();
      lastField = null;
      const level = heading[1]!.length;
      const title = (heading[2] ?? "").trim();
      if (level === 2) {
        block = null;
        child = null;
        skipUntilLevel = 0;
        const spec = specs.find((candidate) => candidate.name === title || candidate.aliases?.includes(title));
        if (!spec) {
          const hint = suggest(title, specs.map((candidate) => candidate.name));
          if (hint) unknownHints.push(hint);
          issue(n, "", "md_unknown_section", `mục "## ${title}" không có trong khung ${kind === "topic" ? "_topic.md" : "bài"}.${didYouMean(title, specs.map((s) => s.name))} Các mục: ${specs.map((s) => s.name).join(", ")}`);
          section = "skip";
        } else if (seen.has(spec.name)) {
          issue(n, "", "md_unknown_section", `mục "## ${spec.name}" viết hai lần (lần đầu ở dòng ${seen.get(spec.name)}); gộp vào một mục`);
          section = "skip";
        } else {
          seen.set(spec.name, n);
          if (spec.kind === "notes") {
            section = "skip";
          } else {
            section = { spec, heading: `## ${spec.name}`, line: n, pointer: `/${spec.json}`, fields: [], blocks: [] };
            sections.push(section);
          }
        }
        continue;
      }
      if (section === "skip" || (skipUntilLevel > 0 && level > skipUntilLevel)) continue;
      skipUntilLevel = 0;
      const inBlockSection = section !== null && BLOCK_SECTIONS.has(section.spec.kind);
      const [first = "", ...rest] = title.split(/\s+/);
      const childTypes = Object.keys(CHILD_ARRAYS);
      if (level === 3 && inBlockSection && block && CHILD_ARRAYS[first] && rest.length > 0) {
        // `### option q1_rice` right after a ###: a child written with one # too few.
        const opened = openChild(n, title, true);
        issue(n, opened.pointer, "md_heading_level", `tiêu đề "### ${title}" thiếu một #: dòng #### bên trong một câu hay khối (${childTypes.join(", ")}) viết "#### ${title}"; máy đọc tiếp như đã sửa`);
        continue;
      }
      if (level === 4 && inBlockSection && !CHILD_ARRAYS[first] && rest.length === 0 && first !== "" && suggest(first, childTypes) === undefined) {
        // `#### q2`: one word that is no child type: a ### (question, block) with one # too many.
        const opened = openBlock(n, title, true);
        issue(n, opened.pointer, "md_heading_level", `tiêu đề "#### ${title}" thừa một #: câu hay block viết "### ${title}"; dòng #### thì viết "#### <loại> <key>" (loại: ${childTypes.join(", ")}); máy đọc tiếp như đã sửa`);
        continue;
      }
      if (level === 3) {
        child = null;
        block = null;
        if (section === null) {
          issue(n, "", "md_bad_line", `"### ${title}" nằm trước mục ## đầu tiên; mỗi ### phải nằm trong một mục ## (Khởi động, Học, Chơi, Quiz…)`);
          skipUntilLevel = 2;
        } else if (!inBlockSection) {
          misplaced.push({ line: n, title });
          issue(n, section.pointer, "md_bad_line", `mục "## ${section.spec.name}" không có ###; chỉ viết các dòng ${section.spec.kind === "pair" ? "en: và vi:" : "1.en:, 1.vi: … 3.vi:"}`);
          skipUntilLevel = 2;
        } else {
          openBlock(n, title, false);
        }
        continue;
      }
      if (level === 4) {
        child = null;
        if (!block) {
          issue(n, where(), "md_bad_line", `"#### ${title}" phải nằm dưới một ### (câu, block)`);
          skipUntilLevel = 3;
          continue;
        }
        openChild(n, title, false);
        continue;
      }
      issue(n, where(), "md_bad_line", `tiêu đề "${heading[1]}" không dùng trong bài; chỉ có ## mục, ### câu hoặc block, #### lựa chọn, từ, thẻ, cột hay nhóm bên trong`);
      continue;
    }
    if (section === "skip" || skipUntilLevel > 0) continue;
    const field = FIELD.exec(text);
    if (field && section !== null && !block && BLOCK_SECTIONS.has(section.spec.kind)) {
      // Fields under a ### section with no ### above them: usually a deleted ### heading. One line,
      // then skip to the next ### (its fields and #### children would only repeat the same error).
      flush();
      lastField = null;
      issue(n, section.pointer, "md_unknown_field", `dòng "${field[1]}:" nằm ngay dưới ${section.heading}, chưa thuộc ### nào; thiếu tiêu đề ### (câu hoặc block, vd "### q1") phía trên? Các dòng tới ### kế tiếp chưa được đọc`);
      section.orphan = n;
      skipUntilLevel = 3;
      continue;
    }
    if (field && section !== null) {
      flush();
      const entry: Field = { name: field[1]!, value: field[2]!.trim(), line: n };
      (child ?? block ?? section).fields.push(entry);
      lastField = { field: entry, index: i };
      continue;
    }
    if (run) {
      run.last = n;
      run.count += 1;
      continue;
    }
    const after = lastField && lines.slice(lastField.index + 1, i).every((line) => line.trim() === "") ? lastField : null;
    run = { start: n, last: n, count: 1, pointer: where(), text, after };
    lastField = null;
  }
  flush();

  // 3. Required sections that are missing (a misspelt heading already said which one it meant).
  const lastLine = lines.length;
  const shadows: { from: number; to: number }[] = [];
  specs.forEach((spec, index) => {
    if (!spec.required || seen.has(spec.name) || unknownHints.includes(spec.name)) return;
    const nextSpec = specs.slice(index + 1).find((candidate) => seen.has(candidate.name));
    const previousSpec = specs.slice(0, index).reverse().find((candidate) => seen.has(candidate.name));
    const next = nextSpec ? seen.get(nextSpec.name)! : undefined;
    const from = previousSpec ? seen.get(previousSpec.name)! + 1 : bodyStart + 1;
    const to = (next ?? lastLine + 1) - 1;
    shadows.push({ from, to });
    const between =
      previousSpec && nextSpec
        ? `giữa "## ${previousSpec.name}" (dòng ${seen.get(previousSpec.name)}) và "## ${nextSpec.name}" (dòng ${next})`
        : nextSpec
          ? `trước "## ${nextSpec.name}" (dòng ${next})`
          : previousSpec
            ? `sau "## ${previousSpec.name}" (dòng ${seen.get(previousSpec.name)}), ở cuối phần nội dung`
            : "sau frontmatter";
    const parts = [`thiếu mục "## ${spec.name}"; mục này nằm ${between}`];
    const lookalike = lookalikeHeading(lines, bodyStart, spec.name);
    if (lookalike) parts.push(`dòng ${lookalike.line} "${lookalike.text}" giống tiêu đề mục này: sửa thành "## ${spec.name}"`);
    else {
      const start = contentStart(spec, sections, misplaced, from, to);
      if (start) parts.push(`nội dung của mục có vẻ bắt đầu ở dòng ${start.line} (${start.what}): thêm dòng "## ${spec.name}" ngay trên dòng đó`);
      else parts.push(`thêm dòng "## ${spec.name}" vào đó${spec.kind === "reward" ? " (không có thẻ thì để trống mục)" : ""}`);
    }
    issue(next ?? lastLine, `/${spec.json}`, "md_missing_section", parts.join("; "));
  });

  return { kind, path, display, source, frontmatter, sections, issues, needsCheck, shadows };
}

type IssueFn = (line: number, pointer: string, code: string, message: string) => void;

/** Minimal YAML: `name: value` at column 0, and `  sub: value` under a `name:` with no value. */
function readFrontmatter(lines: string[], from: number, to: number, issue: IssueFn): Field[] {
  const fields: Field[] = [];
  let parent: Field | null = null;
  for (let i = from; i < to; i++) {
    const n = i + 1;
    const line = lines[i]!;
    const text = line.trim();
    if (text === "" || text.startsWith("#")) continue;
    const indented = /^\s/.test(line);
    const match = FIELD.exec(text);
    if (!match) {
      issue(n, "", "md_frontmatter", `dòng frontmatter không đúng dạng "tên: giá trị"${text.startsWith(">") ? "; ghi chú của trường frontmatter viết ở mục Ghi chú" : ""}`);
      continue;
    }
    const value = match[2]!.trim();
    if (indented) {
      if (!parent) {
        issue(n, "", "md_frontmatter", `dòng thụt lề "${text}" phải nằm dưới một dòng "tên:" để trống giá trị (như difficulty:)`);
        continue;
      }
      fields.push({ name: `${parent.name}.${match[1]}`, value, line: n });
      continue;
    }
    const field: Field = { name: match[1]!, value, line: n };
    fields.push(field);
    parent = value === "" ? field : null;
  }
  return fields;
}

function badLineReason(text: string, after: { field: Field } | null): string {
  const tail = after && after.field.value === "" ? `. Nếu đây là giá trị của "${after.field.name}:" (dòng ${after.field.line}) thì viết cùng dòng với tên trường` : "";
  if (text.startsWith("|")) return `bảng markdown không dùng được ở đây; mỗi dòng một trường "tên: giá trị", ghi chú thì bắt đầu bằng ">"${tail}`;
  if (/^([-*+]\s|\d+\.\s)/.test(text)) return `danh sách "-" không dùng được ở đây; mỗi dòng một trường "tên: giá trị", danh sách key viết trên một dòng cách nhau bằng dấu phẩy, ghi chú thì bắt đầu bằng ">"${tail}`;
  if (text.startsWith("```")) return `khối code không dùng được ở đây; ghi chú thì bắt đầu bằng ">"${tail}`;
  const colon = text.indexOf(":");
  if (colon > 0 && /\s/.test(text.slice(0, colon))) {
    return `tên trường "${text.slice(0, colon)}" có dấu cách; tên trường viết liền (vd prompt.en), đoạn văn thì bắt đầu bằng ">"${tail}`;
  }
  return `dòng thiếu dấu ":" (cần dạng "tên: giá trị"); đoạn văn hay ghi chú thì bắt đầu bằng ">"${tail}`;
}

/** A line that looks like the heading of `name` but is not a `## name` heading: "### Quiz", "##Quiz", "Quiz". */
function lookalikeHeading(lines: string[], from: number, name: string): { line: number; text: string } | undefined {
  const target = foldName(name);
  for (let i = from; i < lines.length; i++) {
    const text = lines[i]!.trim();
    if (text === `## ${name}` || text.startsWith(">")) continue;
    const bare = text.replace(/^#+\s*/, "").replace(/:$/, "").trim();
    if ((text.startsWith("#") || text === bare) && bare !== "" && foldName(bare) === target) return { line: i + 1, text };
  }
  return undefined;
}

/** First ### (or field) in the shadowed range that belongs to the missing section. */
function contentStart(spec: SectionSpec, sections: Section[], misplaced: { line: number; title: string }[], from: number, to: number): { line: number; what: string } | undefined {
  const inRange = (line: number) => line >= from && line <= to;
  const value = (block: Block, name: string) => block.fields.find((field) => field.name === name)?.value;
  const belongs: Partial<Record<SectionKind, (block: Block) => boolean>> = {
    quiz: (block) => value(block, "format") !== undefined && (spec.json === "warmup") === (value(block, "recall_from.kind") !== undefined),
    learn: (block) => ["explore_groups", "sentence_card", "word_list"].includes(value(block, "type") ?? ""),
    play: (block) => value(block, "type") === "build_tray",
    vocab: (block) => value(block, "term.en") !== undefined || value(block, "term.vi") !== undefined,
    reward: (block) => value(block, "set") !== undefined || value(block, "fact.en") !== undefined,
    misconceptions: (block) => value(block, "statement.en") !== undefined || value(block, "correction.en") !== undefined,
  };
  const test = belongs[spec.kind];
  if (test) {
    const block = sections.flatMap((entry) => entry.blocks).find((candidate) => inRange(candidate.line) && test(candidate));
    const loose = misplaced.find((entry) => inRange(entry.line));
    const found = [block && { line: block.line, what: `"${block.heading}"` }, loose && { line: loose.line, what: `"### ${loose.title}"` }]
      .filter((entry): entry is { line: number; what: string } => Boolean(entry))
      .sort((a, b) => a.line - b.line);
    return found[0];
  }
  // pair / numbered: the first en: (or 1.en:) that repeats inside the section before.
  const pattern = spec.kind === "numbered" ? /^\d+\.(en|vi)$/ : /^(en|vi)$/;
  for (const entry of sections) {
    const seenNames = new Set<string>();
    for (const field of entry.fields) {
      const repeat = seenNames.has(field.name);
      seenNames.add(field.name);
      if (!inRange(field.line) || !pattern.test(field.name)) continue;
      if (spec.kind === "numbered" ? entry.spec.kind !== "numbered" : repeat) return { line: field.line, what: `"${field.name}: …"` };
    }
  }
  return undefined;
}
