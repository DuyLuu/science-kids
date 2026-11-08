// `content-cli ids`: give every structured place without an id a UUID v4 (TEMPLATE section A,
// "id và key"): the frontmatter and each ### of a structured section. An `id:` line with no
// value gets "id: <uuid>"; a place with no `id:` line gets one right under its heading (or
// under the opening ---). Ids that exist are never touched, and every other byte of the file
// (BOM, CRLF, `>` notes) stays as it was. Running it twice changes nothing.
import { randomUUID } from "node:crypto";
import { LEARN_TYPES, PLAY_TYPES, QUIZ_FORMATS_MD } from "./convert.ts";
import { joinSource } from "./source.ts";
import type { Block, ParsedMd, Section } from "./syntax.ts";

export type NewId = { line: number; uuid: string };
/** A ### left alone, and why (line in the file as it was read). */
export type Skipped = { line: number; heading: string; reason: string };

/**
 * Whether a ### is recognisably a block of its section, so a missing `id:` line may be added:
 * a question needs a known `format:`, a learn / play block a known `type:`; a word, card or
 * misconception needs at least one field. Field names compare without case ("Format:").
 */
function recognised(section: Section, block: Block): boolean {
  const value = (name: string) => block.fields.find((field) => field.name.toLowerCase() === name)?.value ?? "";
  switch (section.spec.kind) {
    case "quiz":
      return (QUIZ_FORMATS_MD as readonly string[]).includes(value("format"));
    case "learn":
      return (LEARN_TYPES as readonly string[]).includes(value("type"));
    case "play":
      return (PLAY_TYPES as readonly string[]).includes(value("type"));
    default:
      return block.fields.some((field) => field.name !== "id" && field.value !== "");
  }
}

/**
 * New text of the file and the ids it added (line numbers in the new text), or no change.
 * A ### written with the wrong number of # (md_heading_level) is never touched; a ### that is
 * not recognisable gets no new `id:` line. Both are listed in `skipped`.
 */
export function fillIds(doc: ParsedMd, taken: Set<string>, make: () => string = randomUUID): { text?: string; added: NewId[]; skipped: Skipped[] } {
  const skipped: Skipped[] = [];
  const fill = new Map<number, string>();
  const insertAfter = new Map<number, string>();
  const fresh = () => {
    let uuid = make();
    while (taken.has(uuid)) uuid = make();
    taken.add(uuid);
    return uuid;
  };
  if (doc.frontmatter) {
    const ids = doc.frontmatter.fields.filter((field) => field.name === "id");
    if (ids.length === 0 && doc.frontmatter.open) insertAfter.set(1, fresh());
    else if (ids.length > 0 && ids.every((field) => field.value === "")) fill.set(ids[0]!.line, fresh());
  }
  for (const section of doc.sections) {
    for (const block of section.blocks) {
      const level = "tiêu đề sai cấp (### là câu hay khối, #### là lựa chọn, từ, thẻ, cột, nhóm bên trong); sửa theo validate rồi chạy lại ids";
      if (block.levelError) {
        skipped.push({ line: block.line, heading: `#### ${block.key}`, reason: level });
        continue;
      }
      for (const child of block.children) {
        if (child.levelError) skipped.push({ line: child.line, heading: `### ${child.heading.replace(/^#### /, "")}`, reason: level });
      }
      const ids = block.fields.filter((field) => field.name === "id");
      if (ids.length === 0) {
        if (recognised(section, block)) insertAfter.set(block.line, fresh());
        else skipped.push({ line: block.line, heading: block.heading, reason: 'chưa có dòng "id:" và chưa rõ là khối gì (thiếu hoặc sai format:/type:); sửa theo validate rồi chạy lại ids' });
      } else if (ids.every((field) => field.value === "")) fill.set(ids[0]!.line, fresh());
    }
  }
  if (fill.size === 0 && insertAfter.size === 0) return { added: [], skipped };

  const { source } = doc;
  const eol = source.eols.find((ending) => ending !== "") ?? "\n";
  const lines: string[] = [];
  const eols: string[] = [];
  const added: NewId[] = [];
  source.lines.forEach((text, i) => {
    const n = i + 1;
    const uuid = fill.get(n);
    if (uuid) {
      lines.push(text.replace(/^(\s*id:).*$/, `$1 ${uuid}`));
      added.push({ line: lines.length, uuid });
    } else lines.push(text);
    const inserted = insertAfter.get(n);
    if (inserted) {
      eols.push(source.eols[i] || eol);
      lines.push(`id: ${inserted}`);
      added.push({ line: lines.length, uuid: inserted });
      eols.push(source.eols[i] ?? "");
      return;
    }
    eols.push(source.eols[i]!);
  });
  // Skipped headings in the new numbering (each inserted line above pushes them down by one).
  const shifted = skipped.map((skip) => ({ ...skip, line: skip.line + [...insertAfter.keys()].filter((after) => after < skip.line).length }));
  return { text: joinSource({ bom: source.bom, lines, eols }), added: added.sort((a, b) => a.line - b.line), skipped: shifted };
}
