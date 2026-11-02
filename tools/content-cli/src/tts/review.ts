// Listening pack for Duy: 10 chosen sentences + every vocab term and its example, one m4a with
// 0.7 s of silence between clips, and a .txt timeline. Clips are decoded with afconvert (exact
// length, AAC priming removed), joined as PCM, and encoded like the clips. ffmpeg's AAC decoder
// gives each clip 3–40 ms more, which shifted the timeline by ~0.6 s over 26 clips.
import { mkdirSync, mkdtempSync, readFileSync, renameSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import { decodeToWav, durationMs, encodeM4a, pcm16FromWav, wavFromPcm16 } from "../audio.ts";
import { getAt } from "../json-pointer.ts";

export const REVIEW_GAP_MS = 700;

export type ReviewItem = {
  group: "sentence" | "vocab";
  role: string;
  file: string;
  pointer: string;
  /** Source text (as the editor wrote it; the field keeps its SK-014 name, VI text goes here too). */
  en: string;
  /** Normalised text (what the engine read). */
  read: string;
  clip: string;
  duration_ms: number;
  /** Extra line under the row (VI: what the self-check heard for a flagged clip). */
  note?: string;
};

type Quiz = { format?: string; speaker?: string; misconception_id?: string; instruction?: unknown };

/**
 * The 10 sentences (SK-014): lesson title, objective, a key point, the fill-in sentence of the
 * first warmup and the first quiz fill_blank_bank (blank), the true_false statement said by a
 * character, a hint, an explanation_correct, a tray message, and the short challenge label.
 * Rules are generic (first match), so other lessons get a comparable pack.
 */
export function reviewPointers(lesson: Record<string, unknown>): { role: string; pointer: string }[] {
  const warmup = (lesson.warmup as Quiz[] | undefined) ?? [];
  const quiz = (lesson.quiz as Quiz[] | undefined) ?? [];
  const indexOf = (list: Quiz[], test: (item: Quiz) => boolean) => list.findIndex(test);
  const warmupBlank = indexOf(warmup, (item) => item.format === "fill_blank_bank");
  const quizBlank = indexOf(quiz, (item) => item.format === "fill_blank_bank");
  const speaker = indexOf(quiz, (item) => item.format === "true_false" && typeof item.speaker === "string");
  const challenge = (() => {
    const withMisconception = indexOf(quiz, (item) => typeof item.misconception_id === "string" && item.instruction !== undefined);
    return withMisconception !== -1 ? withMisconception : indexOf(quiz, (item) => item.instruction !== undefined);
  })();
  const picks: { role: string; pointer: string | null }[] = [
    { role: "tiêu đề bài", pointer: "/title" },
    { role: "objective", pointer: "/objective" },
    { role: "key_points 1", pointer: "/key_points/0" },
    { role: `câu điền từ w${warmupBlank + 1}`, pointer: warmupBlank === -1 ? null : `/warmup/${warmupBlank}/sentence` },
    { role: `câu điền từ q${quizBlank + 1}`, pointer: quizBlank === -1 ? null : `/quiz/${quizBlank}/sentence` },
    { role: `lời ${speaker === -1 ? "nhân vật" : capitalize(String(quiz[speaker]!.speaker))} q${speaker + 1}`, pointer: speaker === -1 ? null : `/quiz/${speaker}/statement` },
    { role: `hint q${(quizBlank === -1 ? 0 : quizBlank) + 1}`, pointer: `/quiz/${quizBlank === -1 ? 0 : quizBlank}/hint` },
    { role: "explanation_correct q1", pointer: "/quiz/0/explanation_correct" },
    { role: "lời nhắn mâm cơm", pointer: getAt(lesson, "/play/messages/balanced") ? "/play/messages/balanced" : "/play/prompt" },
    { role: `nhãn thử thách q${challenge + 1}`, pointer: challenge === -1 ? null : `/quiz/${challenge}/instruction` },
  ];
  return picks.filter((pick): pick is { role: string; pointer: string } => pick.pointer !== null && getAt(lesson, pick.pointer) !== undefined);
}

export function vocabPointers(lesson: Record<string, unknown>): { role: string; pointer: string }[] {
  const vocab = (lesson.vocab as { term: { en: string } }[] | undefined) ?? [];
  return vocab.flatMap((term, i) => [
    { role: `từ ${i + 1}`, pointer: `/vocab/${i}/term` },
    { role: `câu ví dụ ${i + 1}`, pointer: `/vocab/${i}/example` },
  ]);
}

function clock(ms: number): string {
  const tenths = Math.round(ms / 100);
  const minutes = Math.floor(tenths / 600);
  const seconds = (tenths % 600) / 10;
  return `${minutes}:${seconds.toFixed(1).padStart(4, "0").replace(".", ",")}`;
}

/** Writes <dir>/<name>.m4a and <dir>/<name>.txt. Returns the measured duration of the m4a. */
export async function writeReview(options: {
  dir: string;
  name: string;
  title: string;
  engineLabel: string;
  items: ReviewItem[];
  /** Header of the source-text column (default "chữ EN"). */
  sourceLabel?: string;
  /** Replaces the default "N clip: x câu + y mục từ vựng" summary. */
  summary?: string;
}): Promise<{ m4a: string; txt: string; duration_ms: number; expected_ms: number }> {
  const { dir, name, items } = options;
  if (items.length === 0) throw new Error("không có câu nào để ghép file nghe thử");
  mkdirSync(dir, { recursive: true });
  const work = mkdtempSync(path.join(tmpdir(), "content-cli-review-"));
  const m4a = path.join(dir, `${name}.m4a`);
  const txt = path.join(dir, `${name}.txt`);
  /** Start of each clip in the joined file, ms (from sample counts, not from rounding). */
  const starts: number[] = [];
  let expected = 0;
  try {
    const parts: Buffer[] = [];
    let sampleRate = 0;
    let samples = 0;
    for (const [i, item] of items.entries()) {
      const wav = path.join(work, `${i}.wav`);
      await decodeToWav(item.clip, wav);
      const pcm = pcm16FromWav(readFileSync(wav));
      if (sampleRate && pcm.sampleRate !== sampleRate) throw new Error(`${item.clip}: sample rate ${pcm.sampleRate} khác các clip khác`);
      sampleRate = pcm.sampleRate;
      if (i > 0) {
        const gap = Buffer.alloc(Math.round((REVIEW_GAP_MS / 1000) * sampleRate) * 2);
        parts.push(gap);
        samples += gap.length / 2;
      }
      starts.push((samples / sampleRate) * 1000);
      parts.push(pcm.data);
      samples += pcm.data.length / 2;
    }
    const joined = path.join(work, `${name}.wav`);
    writeFileSync(joined, wavFromPcm16(Buffer.concat(parts), sampleRate));
    const partial = `${m4a}.part`;
    await encodeM4a(joined, partial);
    renameSync(partial, m4a);
    expected = (samples / sampleRate) * 1000;
  } finally {
    rmSync(work, { recursive: true, force: true });
  }
  const measured = await durationMs(m4a);

  const roleWidth = Math.max(...items.map((item) => item.role.length));
  const whereWidth = Math.max(...items.map((item) => item.file.length + 1 + item.pointer.length));
  const rows: string[] = [];
  items.forEach((item, i) => {
    rows.push(`${String(i + 1).padStart(2)}  ${clock(starts[i]!).padStart(7)}  ${item.role.padEnd(roleWidth)}  ${`${item.file}#${item.pointer}`.padEnd(whereWidth)}  ${item.en}`);
    if (item.read !== item.en) rows.push(`${"".padEnd(2 + 2 + 7 + 2 + roleWidth + 2 + whereWidth + 2)}đọc: ${item.read}`);
    if (item.note) rows.push(`${"".padEnd(2 + 2 + 7 + 2 + roleWidth + 2 + whereWidth + 2)}${item.note}`);
  });
  const sentences = items.filter((item) => item.group === "sentence").length;
  const vocab = items.length - sentences;
  const gap = String(REVIEW_GAP_MS / 1000).replace(".", ",");
  const header = [
    `${name}.m4a · ${options.title}`,
    `${items.length} clip: ${options.summary ?? `${sentences} câu + ${vocab} mục từ vựng`}, cách nhau ${gap} s, tổng ${clock(measured)}`,
    options.engineLabel,
    "",
    ` #  bắt đầu  ${"vai".padEnd(roleWidth)}  ${"file#JSON pointer".padEnd(whereWidth)}  ${options.sourceLabel ?? "chữ EN"}`,
  ];
  writeFileSync(txt, `${[...header, ...rows].join("\n")}\n`);
  return { m4a, txt, duration_ms: measured, expected_ms: Math.round(expected) };
}

function capitalize(word: string): string {
  return word.charAt(0).toUpperCase() + word.slice(1);
}
