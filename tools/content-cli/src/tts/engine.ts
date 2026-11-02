// A speech engine per language. EN = Kokoro (kokoro-en.ts), VI = VieNeu-TTS (vieneu-vi.ts, SK-024).
// Adding one (e.g. the B9 fallbacks) = a new EngineSpec + a normaliser for that language.
import type { Lang } from "../spoken.ts";

export type Pcm = {
  samples: Float32Array;
  sampleRate: number;
  /** Engines that sample at random report the seeds used and whether they had to retry internally. */
  info?: { seeds: number[]; retried: boolean };
};

export interface Synthesizer {
  /** `variant` picks another seed for engines that sample at random (ignored by Kokoro). */
  synthesize(text: string, options?: { variant?: number }): Promise<Pcm>;
  dispose(): Promise<void>;
}

export type EngineSpec = {
  lang: Lang;
  /** Short human label for reports, e.g. "Kokoro-82M v1.0 ONNX fp32 · af_heart · 1.0". */
  label: string;
  /** Everything that changes the sound. Goes into the cache key; must be cheap (no model load). */
  descriptor: Record<string, string | number>;
  /**
   * Total pause at a fill-in blank, edge silences included. Undefined: parts are joined as they come
   * (Kokoro's own ~0.8 s of edge silence is the pause). VieNeu's edges are ~0.25 s, so it pads to this.
   */
  blankPauseMs?: number;
  /** Load the model (downloading it on first use). */
  load(log: (line: string) => void): Promise<Synthesizer>;
};
