// Post-processing of synthesised speech before encoding (SK-024, 1/11): one loudness for EN and VI,
// and (VI only) fixed lead/trail silence. Pure and deterministic: same PCM in, same PCM out.
//
// Loudness is measured like ITU-R BS.1770 (K-weighting, absolute gate -70 LUFS, relative gate
// -10 LU) but on 100 ms blocks with a 25 ms hop instead of 400 ms / 100 ms: most clips are short
// (one word = 0.6-0.8 s), and 400 ms gating gives one or two blocks there, so the integrated value
// swings with where the word falls. 100 ms blocks still cover a syllable and gate out the silence.
// True peak: 4x oversampling (windowed-sinc polyphase), as BS.1770 Annex 2.

/** Part of the cache key: change anything and every clip is regenerated. */
export const POST_VERSION = 1;

export type LoudnessSpec = {
  /** Speech-gated loudness every clip is brought to, LUFS. */
  target_lufs: number;
  /** True-peak ceiling before AAC encoding, dBTP (encoding adds a few tenths). */
  ceiling_dbtp: number;
  block_ms: number;
  hop_ms: number;
  lookahead_ms: number;
  release_ms: number;
};

export type SilenceSpec = {
  /** Silence kept before the first and after the last sound, seconds. */
  lead_s: number;
  trail_s: number;
  /** A 10 ms window louder than this (RMS, dBFS) is sound. */
  threshold_db: number;
  /** Sound-free margin kept around the detected speech before padding, seconds. */
  margin_s: number;
  /** Fade at both cut points, seconds (cuts are in near-silence; the fade removes any click). */
  fade_s: number;
};

export type PostSpec = { version: number; loudness: LoudnessSpec; silence?: SilenceSpec };

export const LOUDNESS: LoudnessSpec = { target_lufs: -18, ceiling_dbtp: -1.5, block_ms: 100, hop_ms: 25, lookahead_ms: 5, release_ms: 60 };
/** VI: VieNeu leaves 0-0.26 s before and 0.03-0.4 s after the speech; EN (Kokoro) keeps its own 0.33 s / 0.46 s. */
export const VI_SILENCE: SilenceSpec = { lead_s: 0.15, trail_s: 0.35, threshold_db: -50, margin_s: 0.01, fade_s: 0.005 };

export function postSpec(lang: "en" | "vi"): PostSpec {
  return lang === "vi" ? { version: POST_VERSION, loudness: LOUDNESS, silence: VI_SILENCE } : { version: POST_VERSION, loudness: LOUDNESS };
}

const db = (x: number) => 20 * Math.log10(x + 1e-12);
const fromDb = (d: number) => 10 ** (d / 20);

// ── K-weighting (BS.1770 pre-filter + RLB high-pass), any sample rate ────────────────────────────
type Biquad = { b0: number; b1: number; b2: number; a1: number; a2: number };

export function kWeightingFilters(sampleRate: number): [Biquad, Biquad] {
  // Pre-filter (high shelf): parameters that reproduce the 48 kHz coefficients of BS.1770.
  const f1 = 1681.974450955533;
  const gain = 3.999843853973347;
  const q1 = 0.7071752369554196;
  const k1 = Math.tan((Math.PI * f1) / sampleRate);
  const vh = 10 ** (gain / 20);
  const vb = vh ** 0.4996667741545416;
  const n1 = 1 + k1 / q1 + k1 * k1;
  const shelf: Biquad = {
    b0: (vh + (vb * k1) / q1 + k1 * k1) / n1,
    b1: (2 * (k1 * k1 - vh)) / n1,
    b2: (vh - (vb * k1) / q1 + k1 * k1) / n1,
    a1: (2 * (k1 * k1 - 1)) / n1,
    a2: (1 - k1 / q1 + k1 * k1) / n1,
  };
  // RLB high-pass.
  const f2 = 38.13547087602444;
  const q2 = 0.5003270373238773;
  const k2 = Math.tan((Math.PI * f2) / sampleRate);
  const n2 = 1 + k2 / q2 + k2 * k2;
  const highpass: Biquad = { b0: 1, b1: -2, b2: 1, a1: (2 * (k2 * k2 - 1)) / n2, a2: (1 - k2 / q2 + k2 * k2) / n2 };
  return [shelf, highpass];
}

function biquad(x: Float64Array, f: Biquad): Float64Array {
  const y = new Float64Array(x.length);
  let x1 = 0, x2 = 0, y1 = 0, y2 = 0;
  for (let i = 0; i < x.length; i++) {
    const v = f.b0 * x[i]! + f.b1 * x1 + f.b2 * x2 - f.a1 * y1 - f.a2 * y2;
    x2 = x1;
    x1 = x[i]!;
    y2 = y1;
    y1 = v;
    y[i] = v;
  }
  return y;
}

/** Speech-gated loudness in LUFS (see header). -Infinity for silence. */
export function speechLoudness(samples: Float32Array, sampleRate: number, spec: Pick<LoudnessSpec, "block_ms" | "hop_ms"> = LOUDNESS): number {
  const [shelf, highpass] = kWeightingFilters(sampleRate);
  const k = biquad(biquad(Float64Array.from(samples), shelf), highpass);
  const block = Math.round((spec.block_ms / 1000) * sampleRate);
  const hop = Math.round((spec.hop_ms / 1000) * sampleRate);
  const powers: number[] = [];
  for (let start = 0; start + block <= k.length; start += hop) {
    let sum = 0;
    for (let i = start; i < start + block; i++) sum += k[i]! * k[i]!;
    powers.push(sum / block);
  }
  if (powers.length === 0 && k.length > 0) powers.push(k.reduce((s, v) => s + v * v, 0) / k.length);
  const lufs = (p: number) => -0.691 + 10 * Math.log10(p);
  const absolute = powers.filter((p) => lufs(p) > -70);
  if (absolute.length === 0) return -Infinity;
  const relative = lufs(absolute.reduce((s, p) => s + p, 0) / absolute.length) - 10;
  const gated = absolute.filter((p) => lufs(p) > relative);
  return lufs(gated.reduce((s, p) => s + p, 0) / gated.length);
}

// ── true peak ───────────────────────────────────────────────────────────────────────────────────
const OVERSAMPLE = 4;
const TAPS_PER_PHASE = 12;
const PHASES: Float64Array[] = (() => {
  // Hann-windowed sinc, 4 phases (0, 1/4, 1/2, 3/4 of a sample), normalised to unit DC gain.
  const half = TAPS_PER_PHASE / 2;
  const out: Float64Array[] = [];
  for (let p = 0; p < OVERSAMPLE; p++) {
    const frac = p / OVERSAMPLE;
    const taps = new Float64Array(TAPS_PER_PHASE);
    let sum = 0;
    for (let t = 0; t < TAPS_PER_PHASE; t++) {
      const x = t - half + 1 - frac; // distance from the interpolated point
      const sinc = x === 0 ? 1 : Math.sin(Math.PI * x) / (Math.PI * x);
      const w = 0.5 + 0.5 * Math.cos((Math.PI * x) / (half + 1));
      taps[t] = sinc * w;
      sum += taps[t]!;
    }
    for (let t = 0; t < TAPS_PER_PHASE; t++) taps[t]! /= sum;
    out.push(taps);
  }
  return out;
})();

/** |x| at each sample and at the 3 points between it and the next (4x oversampling). */
export function peakEnvelope(samples: Float32Array): Float64Array {
  const env = new Float64Array(samples.length);
  const half = TAPS_PER_PHASE / 2;
  for (let n = 0; n < samples.length; n++) {
    let m = Math.abs(samples[n]!);
    for (let p = 1; p < OVERSAMPLE; p++) {
      const taps = PHASES[p]!;
      let v = 0;
      for (let t = 0; t < TAPS_PER_PHASE; t++) {
        const i = n + t - half + 1;
        if (i >= 0 && i < samples.length) v += taps[t]! * samples[i]!;
      }
      m = Math.max(m, Math.abs(v));
    }
    env[n] = m;
  }
  return env;
}

export function truePeakDb(samples: Float32Array): number {
  return db(peakEnvelope(samples).reduce((m, v) => Math.max(m, v), 0));
}

// ── limiter ─────────────────────────────────────────────────────────────────────────────────────
/**
 * Look-ahead peak limiter on the true-peak envelope: required gain -> moving minimum over
 * +-lookahead -> moving average over the same window (so the gain is already down at the peak and
 * never steps) -> exponential release towards 1. Returns the limited samples and the deepest
 * gain reduction in dB (0 when nothing exceeded the ceiling).
 */
export function limit(samples: Float32Array, sampleRate: number, ceilingDb: number, lookaheadMs: number, releaseMs: number): { samples: Float32Array; reduction_db: number; limited_ms: number } {
  const env = peakEnvelope(samples);
  const ceiling = fromDb(ceilingDb);
  const need = new Float64Array(samples.length);
  let any = false;
  for (let i = 0; i < samples.length; i++) {
    need[i] = env[i]! > ceiling ? ceiling / env[i]! : 1;
    if (need[i]! < 1) any = true;
  }
  if (!any) return { samples, reduction_db: 0, limited_ms: 0 };
  const l = Math.max(1, Math.round((lookaheadMs / 1000) * sampleRate));
  const n = samples.length;
  // Moving minimum over [i - l, i + l] (monotonic deque), then moving average over the same window.
  const minimum = new Float64Array(n);
  const deque: number[] = [];
  let head = 0;
  for (let j = 0; j < n + l; j++) {
    if (j < n) {
      while (deque.length > head && need[deque[deque.length - 1]!]! >= need[j]!) deque.pop();
      deque.push(j);
    }
    const i = j - l;
    if (i < 0) continue;
    while (deque[head]! < i - l) head++;
    minimum[i] = Math.min(1, need[deque[head]!]!);
  }
  const prefix = new Float64Array(n + 1);
  for (let i = 0; i < n; i++) prefix[i + 1] = prefix[i]! + minimum[i]!;
  const smooth = new Float64Array(n);
  for (let i = 0; i < n; i++) {
    const a = Math.max(0, i - l);
    const b = Math.min(n - 1, i + l);
    const outside = 2 * l + 1 - (b - a + 1); // positions past the ends count as gain 1
    smooth[i] = (prefix[b + 1]! - prefix[a]! + outside) / (2 * l + 1);
  }
  const release = 1 - Math.exp(-1 / ((releaseMs / 1000) * sampleRate));
  const out = new Float32Array(n);
  let g = 1;
  let deepest = 1;
  let under = 0;
  const oneDb = fromDb(-1);
  for (let i = 0; i < n; i++) {
    g = Math.min(smooth[i]!, g + (1 - g) * release);
    deepest = Math.min(deepest, g);
    if (g < oneDb) under++;
    out[i] = samples[i]! * g;
  }
  return { samples: out, reduction_db: db(deepest), limited_ms: Math.round((under / sampleRate) * 1000) };
}

// ── silence ─────────────────────────────────────────────────────────────────────────────────────
/** First and last sample of sound (10 ms windows above threshold), or undefined for silence. */
export function soundSpan(samples: Float32Array, sampleRate: number, thresholdDb: number): { start: number; end: number } | undefined {
  const w = Math.max(1, Math.round(0.01 * sampleRate));
  const threshold = fromDb(thresholdDb);
  let first = -1;
  let last = -1;
  for (let start = 0; start < samples.length; start += w) {
    const end = Math.min(samples.length, start + w);
    let sum = 0;
    for (let i = start; i < end; i++) sum += samples[i]! * samples[i]!;
    if (Math.sqrt(sum / (end - start)) > threshold) {
      if (first < 0) first = start;
      last = end;
    }
  }
  return first < 0 ? undefined : { start: first, end: last };
}

/** Cut or pad so there is exactly `lead_s` before and `trail_s` after the sound (plus the margin). */
export function fixSilence(samples: Float32Array, sampleRate: number, spec: SilenceSpec): { samples: Float32Array; lead_before_s: number; trail_before_s: number } {
  const span = soundSpan(samples, sampleRate, spec.threshold_db);
  if (!span) return { samples, lead_before_s: samples.length / sampleRate, trail_before_s: 0 };
  const margin = Math.round(spec.margin_s * sampleRate);
  const start = Math.max(0, span.start - margin);
  const end = Math.min(samples.length, span.end + margin);
  const body = samples.slice(start, end);
  const fade = Math.min(Math.round(spec.fade_s * sampleRate), Math.floor(body.length / 2));
  for (let i = 0; i < fade; i++) {
    const g = 0.5 - 0.5 * Math.cos((Math.PI * i) / fade); // raised cosine 0 -> 1
    body[i]! *= g;
    body[body.length - 1 - i]! *= g;
  }
  const lead = Math.round(spec.lead_s * sampleRate);
  const trail = Math.round(spec.trail_s * sampleRate);
  const out = new Float32Array(lead + body.length + trail);
  out.set(body, lead);
  return { samples: out, lead_before_s: span.start / sampleRate, trail_before_s: (samples.length - span.end) / sampleRate };
}

/** RMS of the last 30 ms of the engine's raw output, dBFS. Speech-level energy here = the engine cut the word. */
export function tailDb(samples: Float32Array, sampleRate: number): number {
  const n = Math.min(samples.length, Math.round(0.03 * sampleRate));
  let sum = 0;
  for (let i = samples.length - n; i < samples.length; i++) sum += samples[i]! * samples[i]!;
  return db(Math.sqrt(sum / Math.max(1, n)));
}
/** Raw tail louder than this: the engine stopped inside a sound (case a); quieter: the word ended. */
export const CUT_TAIL_DB = -45;

export type PostReport = {
  loudness_before_lufs: number;
  gain_db: number;
  limiter_db: number;
  /** Time the limiter held more than 1 dB of gain reduction. */
  limited_ms: number;
  loudness_after_lufs: number;
  true_peak_dbtp: number;
  raw_tail_db: number;
  lead_before_s?: number;
  trail_before_s?: number;
};

export function postProcess(samples: Float32Array, sampleRate: number, spec: PostSpec): { samples: Float32Array; report: PostReport } {
  const rawTail = tailDb(samples, sampleRate);
  let out = samples;
  let lead: number | undefined;
  let trail: number | undefined;
  if (spec.silence) {
    const fixed = fixSilence(out, sampleRate, spec.silence);
    out = fixed.samples;
    lead = fixed.lead_before_s;
    trail = fixed.trail_before_s;
  }
  const before = speechLoudness(out, sampleRate, spec.loudness);
  let gainDb = Number.isFinite(before) ? spec.loudness.target_lufs - before : 0;
  // Gain, then limiter; the limiter takes a little loudness off, so add that back and limit again
  // (at most 5 rounds, always from the unprocessed signal, so nothing is limited twice).
  let limited = { samples: out, reduction_db: 0, limited_ms: 0 };
  let after = before;
  for (let round = 0; round < 5; round++) {
    const g = fromDb(gainDb);
    const scaled = new Float32Array(out.length);
    for (let i = 0; i < out.length; i++) scaled[i] = out[i]! * g;
    limited = limit(scaled, sampleRate, spec.loudness.ceiling_dbtp, spec.loudness.lookahead_ms, spec.loudness.release_ms);
    after = speechLoudness(limited.samples, sampleRate, spec.loudness);
    if (!Number.isFinite(after) || limited.reduction_db === 0 || Math.abs(spec.loudness.target_lufs - after) <= 0.1) break;
    gainDb += spec.loudness.target_lufs - after;
  }
  const r = (x: number) => Math.round(x * 100) / 100;
  return {
    samples: limited.samples,
    report: {
      loudness_before_lufs: r(before),
      gain_db: r(gainDb),
      limiter_db: r(limited.reduction_db),
      limited_ms: limited.limited_ms,
      loudness_after_lufs: r(after),
      true_peak_dbtp: r(truePeakDb(limited.samples)),
      raw_tail_db: r(rawTail),
      ...(lead !== undefined ? { lead_before_s: r(lead), trail_before_s: r(trail!) } : {}),
    },
  };
}
