// Shared pieces of the markdown reader (SK-027): line splitting that keeps every byte (BOM, CRLF),
// the issue type and its one-line form, and "did you mean" suggestions. Pure, no I/O.

export type Severity = "error" | "warning";

/** One line of `validate` / `import` output: <file .md>:<line> <JSON pointer> [<code>] <message>. */
export type MdIssue = {
  /** Path as printed (relative to the user's cwd when under it). */
  file: string;
  line: number;
  /** JSON pointer of the JSON that `import` writes; "" when the problem has no place in it. */
  pointer: string;
  code: string;
  severity: Severity;
  message: string;
};

export function formatMdIssue(issue: MdIssue): string {
  const pointer = issue.pointer === "" ? "/" : issue.pointer;
  return `${issue.file}:${issue.line} ${pointer} [${issue.code}] ${issue.severity === "warning" ? "cảnh báo: " : ""}${issue.message}`;
}

/** Codes of the markdown step (step 1), with their level. README and SK-027 list the same table. */
export const MD_CODES = {
  md_frontmatter: "error",
  md_filename: "error",
  md_missing_section: "error",
  md_unknown_section: "error",
  md_bad_line: "error",
  md_unknown_field: "error",
  md_duplicate_field: "error",
  md_bad_value: "error",
  md_unknown_format: "error",
  md_unknown_type: "error",
  md_unknown_child: "error",
  md_heading_level: "error",
  md_block_count: "error",
  md_ref_unknown: "error",
  md_id_missing: "error",
  md_id_invalid: "error",
  md_id_duplicate: "error",
  md_needs_check: "warning",
} as const satisfies Record<string, Severity>;
export type MdCode = keyof typeof MD_CODES;

/** A file split into lines; joining `bom + lines[i] + eols[i]` gives back the exact bytes. */
export type SourceText = { bom: boolean; lines: string[]; eols: string[] };

export function splitSource(raw: string): SourceText {
  const bom = raw.startsWith("﻿");
  const body = bom ? raw.slice(1) : raw;
  const lines: string[] = [];
  const eols: string[] = [];
  const pattern = /\r\n|\n|\r/g;
  let start = 0;
  for (let match = pattern.exec(body); match; match = pattern.exec(body)) {
    lines.push(body.slice(start, match.index));
    eols.push(match[0]);
    start = match.index + match[0].length;
  }
  if (start < body.length || lines.length === 0) {
    lines.push(body.slice(start));
    eols.push("");
  }
  return { bom, lines, eols };
}

export function joinSource(source: SourceText): string {
  return (source.bom ? "﻿" : "") + source.lines.map((line, i) => line + source.eols[i]).join("");
}

/** Lower case, no Vietnamese marks, đ -> d: "Từ vựng" and "Tu vung" compare equal. */
export function foldName(text: string): string {
  return text.normalize("NFD").replace(/\p{M}/gu, "").replace(/đ/g, "d").replace(/Đ/g, "D").toLowerCase().trim();
}

function distance(a: string, b: string): number {
  const row = Array.from({ length: b.length + 1 }, (_, j) => j);
  for (let i = 1; i <= a.length; i++) {
    let previous = row[0]!;
    row[0] = i;
    for (let j = 1; j <= b.length; j++) {
      const current = row[j]!;
      row[j] = Math.min(row[j]! + 1, row[j - 1]! + 1, previous + (a[i - 1] === b[j - 1] ? 0 : 1));
      previous = current;
    }
  }
  return row[b.length]!;
}

/** Closest candidate when it is close enough to be a typo, else undefined. */
export function suggest(input: string, candidates: Iterable<string>): string | undefined {
  const folded = foldName(input);
  let best: { name: string; score: number } | undefined;
  for (const name of candidates) {
    const score = distance(folded, foldName(name));
    if (!best || score < best.score) best = { name, score };
  }
  if (!best) return undefined;
  const limit = Math.max(2, Math.floor(Math.max(folded.length, foldName(best.name).length) / 3));
  return best.score <= limit ? best.name : undefined;
}

/** ` Có phải "x"?` or "" */
export function didYouMean(input: string, candidates: Iterable<string>): string {
  const hint = suggest(input, candidates);
  return hint !== undefined && hint !== input ? ` Có phải "${hint}"?` : "";
}

export const NEEDS_CHECK = "[CẦN KIỂM]";
