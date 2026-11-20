// Picture orientation vs the slot it fills (Duy 13/11, SK-043): the app fills a slot with the
// picture (scaled to fill, centred), so a portrait photo in a landscape answer card loses its
// top and bottom (the animal's head). build and `images fetch` compare the processed picture
// (width × height after `crop`) with the slot ratio of image-slots.json and warn when they differ
// by more than the slot's threshold; they never fail on it. Threshold of a slot, first found:
// age_groups.<g>.max_factors.<kind>, max_factors.<kind>, age_groups.<g>.max_factor, max_factor.
// max_factors is for a slot where the app does crop (factor below PictureFit.maxCropRatio) but
// cropping that much loses the subject, e.g. a square photo on a 2:1 vocab card (SK-053 19/11).
//
// Slot of an Image, from its JSON pointer:
//   /quiz|warmup/<i>/image                 question   (hide_question_image_with_picture_choices, Explorer and
//                                                      Discoverer A2: hidden when every option, item or bank word has a picture)
//   /quiz|warmup/<i>/options/<j>/image     choice_2 | choice_3 | choice_4 (4 or more options)
//   /quiz|warmup/<i>/items/<j>/image       order_item
//   /quiz|warmup/<i>/bank/<j>/image        bank_item
//   /learn/<i>/groups/<j>/image            learn_group
//   /play/items/<j>/image                  tray_item
//   /vocab/<i>/image                       vocab
//   /reward/collectible/image              reward
// Anything else (topic pictures, blocks without a known slot) is not checked.
// Pure except loadSlotTable.
import { readFileSync } from "node:fs";
import path from "node:path";
import { getAt, parsePointer } from "../json-pointer.ts";
import { CLI_ROOT } from "../paths.ts";
import type { Crop } from "./selection.ts";

export const SLOT_TABLE_FILE = path.join(CLI_ROOT, "image-slots.json");
export const SLOT_KINDS = ["question", "choice_2", "choice_3", "choice_4", "order_item", "bank_item", "learn_group", "tray_item", "vocab", "reward"] as const;
export type SlotKind = (typeof SLOT_KINDS)[number];
type RatioValue = string | number;
type MaxFactors = Partial<Record<SlotKind, number>>;
type GroupTable = { note?: string; max_factor?: number; max_factors?: MaxFactors; ratios?: Partial<Record<SlotKind, RatioValue>>; hide_question_image_with_picture_choices?: boolean };
export type SlotTable = { note?: string; max_factor: number; max_factors?: MaxFactors; default: Record<SlotKind, RatioValue>; age_groups?: Record<string, GroupTable> };

/** "3:1" -> 3, "4:3" -> 1.333…, 1.5 -> 1.5. Throws on anything else. */
export function parseRatio(value: RatioValue): number {
  if (typeof value === "number" && Number.isFinite(value) && value > 0) return value;
  const match = typeof value === "string" ? /^\s*(\d+(?:\.\d+)?)\s*:\s*(\d+(?:\.\d+)?)\s*$/.exec(value) : null;
  if (match && Number(match[1]) > 0 && Number(match[2]) > 0) return Number(match[1]) / Number(match[2]);
  throw new Error(`tỉ lệ khung "${String(value)}" sai dạng; viết "rộng:cao" (vd "4:3") hoặc một số dương`);
}

function checkMaxFactors(place: string, factors: MaxFactors | undefined): void {
  for (const [kind, value] of Object.entries(factors ?? {})) {
    if (!(SLOT_KINDS as readonly string[]).includes(kind)) throw new Error(`${place}.${kind}: khung lạ (có: ${SLOT_KINDS.join(", ")})`);
    if (!(typeof value === "number" && value > 1)) throw new Error(`${place}.${kind} phải là số > 1`);
  }
}

/** Checks the table (every slot kind has a valid ratio, every max_factor > 1); throws with the place. */
export function checkSlotTable(table: SlotTable): SlotTable {
  if (!(typeof table.max_factor === "number" && table.max_factor > 1)) throw new Error("max_factor phải là số > 1");
  checkMaxFactors("max_factors", table.max_factors);
  for (const kind of SLOT_KINDS) {
    if (table.default?.[kind] === undefined) throw new Error(`default thiếu khung ${kind}`);
    parseRatio(table.default[kind]);
  }
  for (const [group, own] of Object.entries(table.age_groups ?? {})) {
    if (own.max_factor !== undefined && !(own.max_factor > 1)) throw new Error(`age_groups.${group}.max_factor phải là số > 1`);
    checkMaxFactors(`age_groups.${group}.max_factors`, own.max_factors);
    for (const [kind, value] of Object.entries(own.ratios ?? {})) {
      if (!(SLOT_KINDS as readonly string[]).includes(kind)) throw new Error(`age_groups.${group}.ratios.${kind}: khung lạ (có: ${SLOT_KINDS.join(", ")})`);
      parseRatio(value as RatioValue);
    }
  }
  return table;
}

let cached: { file: string; table: SlotTable } | undefined;
export function loadSlotTable(file: string = SLOT_TABLE_FILE): SlotTable {
  if (cached?.file === file) return cached.table;
  const table = checkSlotTable(JSON.parse(readFileSync(file, "utf8")) as SlotTable);
  cached = { file, table };
  return table;
}

/** Ratio (width / height) of a slot for an age group, and the factor above which build warns. */
export function slotRatio(table: SlotTable, ageGroup: string, kind: SlotKind): { ratio: number; maxFactor: number } {
  const own = table.age_groups?.[ageGroup];
  const maxFactor = own?.max_factors?.[kind] ?? table.max_factors?.[kind] ?? own?.max_factor ?? table.max_factor;
  return { ratio: parseRatio(own?.ratios?.[kind] ?? table.default[kind]), maxFactor };
}

export type Slot = { kind: SlotKind; label: string };
const QUESTION_SECTIONS = new Set(["quiz", "warmup"]);
const isIndex = (token: string | undefined) => token !== undefined && /^\d+$/.test(token);
const allHavePictures = (list: unknown) => Array.isArray(list) && list.length > 0 && list.every((entry) => (entry as { image?: unknown })?.image !== undefined);

/**
 * Slot of the Image at `pointer` in a lesson (see the header), or undefined when the app does not
 * show it in a known slot. `table` decides whether Explorer hides the question picture.
 */
export function slotOf(doc: unknown, pointer: string, ageGroup: string, table: SlotTable): Slot | undefined {
  const tokens = parsePointer(pointer);
  if (tokens[tokens.length - 1] !== "image") return undefined;
  const [section, a, b, c] = tokens;
  if (QUESTION_SECTIONS.has(section!) && isIndex(a)) {
    const item = getAt(doc, `/${section}/${a}`) as { options?: unknown[]; items?: unknown[]; bank?: unknown[] } | undefined;
    if (tokens.length === 3) {
      if (table.age_groups?.[ageGroup]?.hide_question_image_with_picture_choices && (allHavePictures(item?.options) || allHavePictures(item?.items) || allHavePictures(item?.bank))) return undefined;
      return { kind: "question", label: "hình câu hỏi" };
    }
    if (tokens.length === 5 && isIndex(c)) {
      if (b === "options") {
        const count = item?.options?.length ?? 0;
        const kind: SlotKind = count <= 2 ? "choice_2" : count === 3 ? "choice_3" : "choice_4";
        return { kind, label: `thẻ lựa chọn (${count} lựa chọn)` };
      }
      if (b === "items") return { kind: "order_item", label: "thẻ xếp thứ tự" };
      if (b === "bank") return { kind: "bank_item", label: "thẻ từ có hình" };
    }
    return undefined;
  }
  if (section === "learn" && tokens.length === 5 && isIndex(a) && b === "groups" && isIndex(c)) return { kind: "learn_group", label: "trang Học (nhóm)" };
  if (section === "play" && tokens.length === 4 && a === "items" && isIndex(b)) return { kind: "tray_item", label: "món ở màn Chơi" };
  if (section === "vocab" && tokens.length === 3 && isIndex(a)) return { kind: "vocab", label: "thẻ từ vựng" };
  if (section === "reward" && tokens.length === 3 && a === "collectible") return { kind: "reward", label: "sticker thưởng" };
  return undefined;
}

/** How much the picture and the slot differ: max(image/slot, slot/image), 1 = same shape. */
export function aspectFactor(width: number, height: number, ratio: number): number {
  const image = width / height;
  return Math.max(image / ratio, ratio / image);
}

const COMMON_RATIOS: [number, number][] = [
  [1, 1], [5, 4], [4, 5], [4, 3], [3, 4], [3, 2], [2, 3], [16, 9], [9, 16], [2, 1], [1, 2], [5, 2], [2, 5], [5, 3], [3, 5], [3, 1], [1, 3],
];
const decimal = new Intl.NumberFormat("vi-VN", { maximumFractionDigits: 2 });
/** 0.75 -> "3:4", 1.62 -> "1,62:1" (a common ratio within 3%, else decimal). */
export function formatRatio(ratio: number): string {
  const near = COMMON_RATIOS.find(([w, h]) => Math.abs(w / h / ratio - 1) <= 0.03);
  return near ? `${near[0]}:${near[1]}` : `${decimal.format(ratio)}:1`;
}
export function orientation(ratio: number): "ngang" | "dọc" | "vuông" {
  return ratio > 1.1 ? "ngang" : ratio < 1 / 1.1 ? "dọc" : "vuông";
}

const round3 = (value: number) => Math.round(value * 1000) / 1000;
/**
 * A centred crop that gives the picture the slot's ratio, in fractions of the source picture
 * (as `crop` of the selection file is written). `crop`: the crop already set (the processed
 * picture is that part of the source), so the result stays inside it.
 */
export function suggestCrop(width: number, height: number, ratio: number, crop?: Crop): Crop {
  const image = width / height;
  const inner: Crop = image > ratio ? { left: (1 - ratio / image) / 2, top: 0, width: ratio / image, height: 1 } : { left: 0, top: (1 - image / ratio) / 2, width: 1, height: image / ratio };
  const outer = crop ?? { left: 0, top: 0, width: 1, height: 1 };
  const left = round3(outer.left + outer.width * inner.left);
  const top = round3(outer.top + outer.height * inner.top);
  // Floor the size so left + width never goes past 1 after rounding.
  const floor3 = (value: number) => Math.floor(value * 1000) / 1000;
  return { left, top, width: Math.min(floor3(outer.width * inner.width), round3(1 - left)), height: Math.min(floor3(outer.height * inner.height), round3(1 - top)) };
}

export type AspectWarning = {
  key: string;
  pointer: string;
  slot: Slot;
  width: number;
  height: number;
  imageRatio: number;
  slotRatio: number;
  factor: number;
};

/** One Image to check: its key and pointer, and the processed picture's size (undefined: no picture yet). */
export type SizedRef = { key: string; pointer: string; size?: { width: number; height: number } };

/** Images of `doc` whose picture differs from its slot by more than the table allows. */
export function aspectWarnings(doc: unknown, ageGroup: string, refs: SizedRef[], table: SlotTable): AspectWarning[] {
  const out: AspectWarning[] = [];
  for (const ref of refs) {
    if (!ref.size || ref.size.width <= 0 || ref.size.height <= 0) continue;
    const slot = slotOf(doc, ref.pointer, ageGroup, table);
    if (!slot) continue;
    const { ratio, maxFactor } = slotRatio(table, ageGroup, slot.kind);
    const factor = aspectFactor(ref.size.width, ref.size.height, ratio);
    if (factor <= maxFactor) continue;
    out.push({ key: ref.key, pointer: ref.pointer, slot, width: ref.size.width, height: ref.size.height, imageRatio: ref.size.width / ref.size.height, slotRatio: ratio, factor });
  }
  return out;
}

/** Where the picture of a warning comes from, for the advice. */
export type AspectSource =
  | { kind: "picked"; selection: string; entryKey: string; crop?: Crop }
  | { kind: "own" | "composed"; selection: string; entryKey: string; file: string };

const percent = new Intl.NumberFormat("vi-VN", { maximumFractionDigits: 0 });
/**
 * "bài 04-ca-va-luong-cu · hình q1.q1_frog (thẻ lựa chọn (3 lựa chọn)): ảnh 683×1024 dọc 2:3, khung
 * 5:2 ngang; lệch ×3,75: lấp khung thì mất khoảng 73% ảnh, không thì ảnh hiện nhỏ. Đặt "crop" … hoặc chọn ảnh khác."
 */
export function aspectWarningText(lesson: string, warning: AspectWarning, source?: AspectSource): string {
  const lost = percent.format((1 - 1 / warning.factor) * 100);
  const head =
    `bài ${lesson} · hình ${warning.key} (${warning.slot.label}): ảnh ${warning.width}×${warning.height} ${orientation(warning.imageRatio)} ${formatRatio(warning.imageRatio)}, ` +
    `khung ${formatRatio(warning.slotRatio)} ${orientation(warning.slotRatio)}; lệch ×${decimal.format(warning.factor)}: lấp khung thì mất khoảng ${lost}% ảnh, không thì ảnh hiện nhỏ.`;
  if (!source) return `${head} Đặt crop hoặc chọn ảnh khác.`;
  const shared = source.entryKey === warning.key ? "" : ` (ảnh dùng chung, đổi ở đó là đổi mọi chỗ dùng ảnh này)`;
  if (source.kind === "picked") {
    const crop = suggestCrop(warning.width, warning.height, warning.slotRatio, source.crop);
    return `${head} Đặt "crop" trong ${source.selection} mục ${source.entryKey}${shared} (gợi ý cắt giữa ${JSON.stringify(crop)}, dời left/top cho đúng chỗ cần thấy) rồi chạy lại images fetch, hoặc chọn ảnh khác.`;
  }
  const what = source.kind === "own" ? "hình tự vẽ" : "hình ghép";
  return `${head} Sửa ${what} ${source.file} theo khung ${formatRatio(warning.slotRatio)} (${source.selection} mục ${source.entryKey}${shared}) rồi chạy lại images fetch, hoặc chọn ảnh khác.`;
}
