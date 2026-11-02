// One normalised string -> PCM. Blanks (BLANK, from `{1}` of fill_blank_bank) split the
// sentence: each part is spoken on its own and the parts are joined, so the blank is a real
// pause (Kokoro reads "…" inside one sentence as a comma-length pause, about 0.27 s).
import { concatFloat } from "../audio.ts";
import { BLANK } from "../normalize/en.ts";
import type { Pcm, Synthesizer } from "./engine.ts";

/** Extra silence between two spoken parts. 0: Kokoro's own edge silence (~0.47 s + ~0.33 s) is the pause. */
export const JOIN_PAUSE_MS = 0;
/** Silence for a blank at the very start of a sentence ("{1} is a carbohydrate."). */
export const LEADING_PAUSE_MS = 600;

/** Part of the cache key (EN, unchanged since SK-014). */
export const BLANK_STRATEGY = { marker: BLANK, strategy: "split", join_pause_ms: JOIN_PAUSE_MS, leading_pause_ms: LEADING_PAUSE_MS };

/** Blank handling of an engine, for the cache key. Engines with `blankPauseMs` pad the join to that total. */
export function blankStrategy(blankPauseMs?: number): Record<string, string | number> {
  return blankPauseMs === undefined ? BLANK_STRATEGY : { ...BLANK_STRATEGY, target_pause_ms: blankPauseMs };
}

/** Seconds of near-silence (|x| <= 0.01) at the start and the end of a clip. */
export function edgeSilence(samples: Float32Array, sampleRate: number): { lead: number; trail: number } {
  let first = 0;
  while (first < samples.length && Math.abs(samples[first]!) <= 0.01) first++;
  if (first === samples.length) return { lead: samples.length / sampleRate, trail: 0 };
  let last = samples.length - 1;
  while (last > 0 && Math.abs(samples[last]!) <= 0.01) last--;
  return { lead: first / sampleRate, trail: (samples.length - 1 - last) / sampleRate };
}

export type Piece = { kind: "speech"; text: string } | { kind: "pause"; ms: number };

/**
 * "need food, water and … to live." -> speech "need food, water and …", speech "to live."
 * The part before a blank keeps the "…" so it ends on a held, unfinished tone.
 */
export function splitAtBlanks(text: string): Piece[] {
  const parts = text.split(BLANK);
  const pieces: Piece[] = [];
  parts.forEach((raw, index) => {
    const part = raw.trim();
    const beforeBlank = index < parts.length - 1;
    if (part === "") {
      if (index === 0 && beforeBlank) pieces.push({ kind: "pause", ms: LEADING_PAUSE_MS });
      return;
    }
    const last = pieces.at(-1);
    // Only punctuation left after a blank ("give us …?"): glue it to the previous part.
    if (/^[\s,.;:!?"”’)]+$/.test(part) && last?.kind === "speech") {
      last.text = `${last.text}${part}`;
      return;
    }
    if (last?.kind === "speech" && JOIN_PAUSE_MS > 0) pieces.push({ kind: "pause", ms: JOIN_PAUSE_MS });
    pieces.push({ kind: "speech", text: beforeBlank ? `${part} ${BLANK}` : part });
  });
  return pieces;
}

export async function speak(
  synthesizer: Synthesizer,
  text: string,
  options: { variant?: number; blankPauseMs?: number } = {},
): Promise<Pcm> {
  const chunks: Float32Array[] = [];
  let sampleRate = 0;
  const pending: number[] = [];
  const seeds: number[] = [];
  let retried = false;
  let previous: Float32Array | undefined;
  for (const piece of splitAtBlanks(text)) {
    if (piece.kind === "pause") {
      pending.push(piece.ms);
      continue;
    }
    const pcm = await synthesizer.synthesize(piece.text, options.variant ? { variant: options.variant } : undefined);
    if (sampleRate && pcm.sampleRate !== sampleRate) throw new Error("các đoạn khác sample rate");
    sampleRate = pcm.sampleRate;
    if (pcm.info) {
      seeds.push(...pcm.info.seeds);
      retried ||= pcm.info.retried;
    }
    for (const ms of pending.splice(0)) chunks.push(new Float32Array(Math.round((ms / 1000) * sampleRate)));
    if (previous && options.blankPauseMs !== undefined) {
      // Pad so trailing silence + padding + leading silence = blankPauseMs.
      const gap = edgeSilence(previous, sampleRate).trail + edgeSilence(pcm.samples, sampleRate).lead;
      const pad = Math.max(0, options.blankPauseMs / 1000 - gap);
      chunks.push(new Float32Array(Math.round(pad * sampleRate)));
    }
    chunks.push(pcm.samples);
    previous = pcm.samples;
  }
  if (!sampleRate) throw new Error(`không có gì để đọc trong "${text}"`);
  return { samples: concatFloat(chunks), sampleRate, ...(seeds.length ? { info: { seeds, retried } } : {}) };
}
