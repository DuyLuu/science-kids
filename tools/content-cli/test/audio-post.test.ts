// Loudness and silence post-processing (SK-024, 1/11): src/audio-post.ts.
import assert from "node:assert/strict";
import { describe, test } from "node:test";
import { M4A_ENCODING } from "../src/audio.ts";
import {
  CUT_TAIL_DB,
  fixSilence,
  kWeightingFilters,
  LOUDNESS,
  postProcess,
  postSpec,
  soundSpan,
  speechLoudness,
  tailDb,
  truePeakDb,
  VI_SILENCE,
} from "../src/audio-post.ts";
import { cacheKey } from "../src/cache.ts";
import { BLANK_STRATEGY } from "../src/tts/utterance.ts";

const sine = (sr: number, seconds: number, amp: number, hz = 997, phase = 0) =>
  new Float32Array(Math.round(sr * seconds)).map((_, i) => amp * Math.sin((2 * Math.PI * hz * i) / sr + phase));
const concat = (...parts: Float32Array[]) => {
  const out = new Float32Array(parts.reduce((n, p) => n + p.length, 0));
  let o = 0;
  for (const p of parts) {
    out.set(p, o);
    o += p.length;
  }
  return out;
};
const close = (actual: number, expected: number, tol: number, what = "") => assert.ok(Math.abs(actual - expected) <= tol, `${what} ${actual} ≉ ${expected} ± ${tol}`);

describe("đo độ to (BS.1770, khối 100 ms)", () => {
  test("hệ số K-weighting ở 48 kHz đúng bảng của BS.1770", () => {
    const [shelf, highpass] = kWeightingFilters(48000);
    close(shelf.b0, 1.53512485958697, 1e-9);
    close(shelf.b1, -2.69169618940638, 1e-9);
    close(shelf.b2, 1.19839281085285, 1e-9);
    close(shelf.a1, -1.69065929318241, 1e-9);
    close(shelf.a2, 0.73248077421585, 1e-9);
    close(highpass.a1, -1.99004745483398, 1e-9);
    close(highpass.a2, 0.99007225036621, 1e-9);
  });
  test("sóng sin 997 Hz: LUFS = dBFS đỉnh - 3,01, ở 48 kHz (VI) và 24 kHz (EN)", () => {
    for (const sr of [48000, 24000]) {
      close(speechLoudness(sine(sr, 2, 1), sr), -3.01, 0.05, `${sr} Hz 0 dBFS`);
      close(speechLoudness(sine(sr, 2, 0.1), sr), -23.01, 0.05, `${sr} Hz -20 dBFS`);
    }
  });
  test("chỉ tính phần có tiếng: dài ngắn khoảng lặng không đổi độ to; clip ngắn 0,3 s vẫn đo được", () => {
    const sr = 48000;
    const speech = sine(sr, 0.5, 0.1);
    const short = speechLoudness(concat(new Float32Array(0.2 * sr), speech, new Float32Array(0.2 * sr)), sr);
    close(speechLoudness(concat(new Float32Array(sr), speech, new Float32Array(2 * sr)), sr), short, 0.05, "1 s + 2 s lặng so với 0,2 s");
    // Blocks half inside the speech pass the gate and pull the value down a little (edge effect).
    close(short, speechLoudness(speech, sr), 0.8, "có lặng so với không lặng");
    close(speechLoudness(sine(sr, 0.3, 0.1), sr), -23.01, 0.1);
    assert.equal(speechLoudness(new Float32Array(sr), sr), -Infinity);
  });
});

describe("true peak và limiter", () => {
  test("đỉnh giữa hai mẫu: sin fs/4 lệch pha 45° có đỉnh mẫu -3 dB nhưng true peak khoảng 0 dB", () => {
    const s = sine(48000, 0.5, 1, 12000, Math.PI / 4);
    close(truePeakDb(s), 0, 0.2);
  });
  test("clip to quá trần thì limiter kéo true peak xuống dưới trần", () => {
    const sr = 48000;
    // Speech-like: quiet body with short loud bursts (big peak-to-loudness ratio).
    const body = sine(sr, 1.5, 0.06, 300);
    for (const at of [0.3, 0.8, 1.2]) for (let i = 0; i < 480; i++) body[Math.round(at * sr) + i]! += 0.45 * Math.sin((2 * Math.PI * 2000 * i) / sr);
    const { samples, report } = postProcess(body, sr, postSpec("en"));
    assert.ok(report.limiter_db < 0, "phải có giới hạn");
    assert.ok(truePeakDb(samples) <= LOUDNESS.ceiling_dbtp + 0.05, `true peak ${truePeakDb(samples)}`);
    close(report.loudness_after_lufs, LOUDNESS.target_lufs, 0.15, "độ to sau limiter (bù lại phần limiter lấy đi)");
  });
  test("clip không chạm trần: đúng mức đích, không limiter", () => {
    const { report } = postProcess(sine(24000, 1, 0.05, 440), 24000, postSpec("en"));
    assert.equal(report.limiter_db, 0);
    close(report.loudness_after_lufs, -18, 0.02);
  });
  test("tất định: cùng PCM vào, cùng PCM ra", () => {
    const x = concat(new Float32Array(9000), sine(48000, 1.2, 0.4, 220), new Float32Array(1000));
    const a = postProcess(x, 48000, postSpec("vi")).samples;
    const b = postProcess(x, 48000, postSpec("vi")).samples;
    assert.deepEqual(Buffer.from(a.buffer), Buffer.from(b.buffer));
  });
});

describe("khoảng lặng VI", () => {
  const sr = 48000;
  test("cắt bớt lặng đầu thừa, đệm lặng cuối thiếu: còn đúng 0,15 s + 0,35 s quanh phần có tiếng", () => {
    const speech = sine(sr, 1, 0.2, 300);
    const x = concat(new Float32Array(0.4 * sr), speech, new Float32Array(0.02 * sr));
    const { samples, lead_before_s, trail_before_s } = fixSilence(x, sr, VI_SILENCE);
    close(lead_before_s, 0.4, 0.011);
    close(trail_before_s, 0.02, 0.011);
    const span = soundSpan(samples, sr, VI_SILENCE.threshold_db)!;
    close(span.start / sr, VI_SILENCE.lead_s + VI_SILENCE.margin_s, 0.011, "lặng đầu");
    close((samples.length - span.end) / sr, VI_SILENCE.trail_s + VI_SILENCE.margin_s, 0.011, "lặng cuối");
    close(samples.length / sr, VI_SILENCE.lead_s + 1 + 2 * VI_SILENCE.margin_s + VI_SILENCE.trail_s, 0.002);
  });
  test("EN không đổi khoảng lặng", () => {
    const x = concat(new Float32Array(0.33 * 24000), sine(24000, 1, 0.1, 300), new Float32Array(0.46 * 24000));
    assert.equal(postProcess(x, 24000, postSpec("en")).samples.length, x.length);
  });
  test("phát hiện engine cắt cụt: tiếng còn to ở 30 ms cuối", () => {
    const cut = sine(sr, 0.5, 0.3, 300);
    const faded = concat(sine(sr, 0.5, 0.3, 300).map((v, i, a) => v * Math.max(0, 1 - i / a.length)), new Float32Array(0.05 * sr));
    assert.ok(tailDb(cut, sr) > CUT_TAIL_DB);
    assert.ok(tailDb(faded, sr) < CUT_TAIL_DB);
  });
});

test("tham số hậu xử lý nằm trong khoá cache", () => {
  const base = { lang: "vi" as const, text: "Kẹo", engine: { model: "m" }, blank: BLANK_STRATEGY, encoding: M4A_ENCODING, post: postSpec("vi") };
  const key = cacheKey(base);
  assert.notEqual(cacheKey({ ...base, post: { ...postSpec("vi"), loudness: { ...LOUDNESS, target_lufs: -17 } } }), key);
  assert.notEqual(cacheKey({ ...base, post: { ...postSpec("vi"), silence: { ...VI_SILENCE, lead_s: 0.2 } } }), key);
  assert.notEqual(cacheKey({ ...base, post: { ...postSpec("vi"), version: 2 } }), key);
  assert.notEqual(cacheKey({ ...base, post: undefined }), key);
});
