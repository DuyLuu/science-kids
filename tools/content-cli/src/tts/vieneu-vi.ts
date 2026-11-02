// VI speech: VieNeu-TTS v3 Turbo (ONNX, CPU) through the Python environment of SK-023
// (tools/content-cli/tts-vi, uv), driven over a JSON-lines pipe (`vieneu_vi.py serve`).
// Model files are pinned by commit and sha256 (tts-vi/model-files.json) and read offline.
// Sampling is random, so every request carries a seed derived from (voice, text, variant):
// the same machine regenerates the same PCM bit for bit (SK-023). Mac is the machine of record.
import { spawn, type ChildProcessWithoutNullStreams } from "node:child_process";
import { existsSync, mkdtempSync, readFileSync, rmSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import { createInterface } from "node:readline";
import { sha256Bytes } from "../audio.ts";
import { CLI_ROOT, MODELS_DIR } from "../paths.ts";
import type { EngineSpec, Synthesizer } from "./engine.ts";

export const TTS_VI_DIR = path.join(CLI_ROOT, "tts-vi");
export const VI_PYTHON = path.join(TTS_VI_DIR, ".venv", "bin", "python");
export const VI_EVAL_PYTHON = path.join(TTS_VI_DIR, ".venv-eval", "bin", "python");
const MODEL_FILES = path.join(TTS_VI_DIR, "model-files.json");
const HF_CACHE = path.join(MODELS_DIR, "vieneu", "hf");

/** SK-023 decision (01/11): Kim Thanh, Southern female; fallback Đức Trí. */
export const DEFAULT_VI_VOICE = "Kim Thanh";
export const VI_SAMPLE_RATE = 48000;
/** Same string as SEED_SCHEME in tts-vi/vieneu_vi.py. */
export const SEED_SCHEME = "sha256(voice + LF + text [+ LF + '#' + variant if variant > 0])[:4] big-endian -> numpy.random.seed";
/** SDK defaults of vieneu 3.8.3 Vieneu.infer (temperature, top_k, top_p, repetition_penalty, max_chars). */
const SAMPLING = "temperature=0.8 top_k=25 top_p=0.95 repetition_penalty=1.2 max_chars=256 apply_watermark=False";

type ModelFiles = { vieneu: string; precision: string; pins: Record<string, string>; files: { repo: string; revision: string; file: string; size: number; sha256: string }[] };

function lockedVersions(): Record<string, string> {
  const lock = readFileSync(path.join(TTS_VI_DIR, "uv.lock"), "utf8");
  const versions: Record<string, string> = {};
  for (const match of lock.matchAll(/\[\[package\]\]\nname = "([^"]+)"\nversion = "([^"]+)"/g)) versions[match[1]!] = match[2]!;
  return versions;
}

function modelPath(repo: string, revision: string, file: string): string {
  return path.join(HF_CACHE, `models--${repo.replace("/", "--")}`, "snapshots", revision, file);
}

export function vieneuVi({ voice = DEFAULT_VI_VOICE }: { voice?: string } = {}): EngineSpec {
  const models = JSON.parse(readFileSync(MODEL_FILES, "utf8")) as ModelFiles;
  const versions = lockedVersions();
  const [modelRepo, codecRepo] = Object.keys(models.pins);
  const descriptor = {
    engine: "vieneu",
    engine_version: versions.vieneu ?? models.vieneu,
    onnxruntime_version: versions.onnxruntime ?? "?",
    sea_g2p_version: versions["sea-g2p"] ?? "?",
    numpy_version: versions.numpy ?? "?",
    model: modelRepo!,
    model_revision: models.pins[modelRepo!]!,
    codec: codecRepo!,
    codec_revision: models.pins[codecRepo!]!,
    model_files_sha256: sha256Bytes(JSON.stringify(models.files)),
    dtype: models.precision,
    voice,
    speed: 1.0,
    sample_rate: VI_SAMPLE_RATE,
    sampling: SAMPLING,
    seed_scheme: SEED_SCHEME,
    platform: `${process.platform}-${process.arch}`,
  };
  return {
    lang: "vi",
    label: `VieNeu-TTS v3 Turbo ONNX ${models.precision} (vieneu ${descriptor.engine_version}, rev ${descriptor.model_revision.slice(0, 7)}) · giọng ${voice} · tốc độ mặc định`,
    descriptor,
    blankPauseMs: 800,
    async load(log) {
      if (!existsSync(VI_PYTHON)) {
        throw new Error(`chưa có môi trường Python của VieNeu (${VI_PYTHON}). Chạy: cd tools/content-cli/tts-vi && uv sync`);
      }
      const missing = models.files.filter((f) => !existsSync(modelPath(f.repo, f.revision, f.file)));
      if (missing.length > 0) {
        log(`Thiếu ${missing.length} file model VieNeu, tải bản đã ghim (608,6 MB, lần duy nhất dùng mạng)…`);
        await runToEnd(VI_PYTHON, ["vieneu_vi.py", "fetch"], log);
      }
      return startServer(voice, log);
    },
  };
}

function runToEnd(cmd: string, args: string[], log: (line: string) => void): Promise<void> {
  return new Promise((resolve, reject) => {
    const child = spawn(cmd, args, { cwd: TTS_VI_DIR, stdio: ["ignore", "pipe", "pipe"] });
    createInterface({ input: child.stdout }).on("line", log);
    let err = "";
    child.stderr.on("data", (chunk) => (err += chunk));
    child.on("error", reject);
    child.on("close", (code) => (code === 0 ? resolve() : reject(new Error(`${path.basename(cmd)} ${args.join(" ")} exit ${code}\n${err.slice(-2000)}`))));
  });
}

type Reply = { ok: boolean; error?: string; samples?: number; sample_rate?: number; seed?: number; gen_s?: number; babble_retry_log?: string[]; ready?: boolean; load_s?: number; versions?: Record<string, string> };

async function startServer(voice: string, log: (line: string) => void): Promise<Synthesizer> {
  const child: ChildProcessWithoutNullStreams = spawn(VI_PYTHON, ["vieneu_vi.py", "serve"], { cwd: TTS_VI_DIR, stdio: ["pipe", "pipe", "pipe"] });
  let stderr = "";
  child.stderr.on("data", (chunk) => {
    stderr = (stderr + chunk).slice(-4000);
  });
  const lines = createInterface({ input: child.stdout })[Symbol.asyncIterator]();
  const next = async (): Promise<Reply> => {
    const { value, done } = await lines.next();
    if (done) throw new Error(`VieNeu dừng bất ngờ.\n${stderr}`);
    return JSON.parse(value as string) as Reply;
  };
  const ready = await next();
  if (!ready.ready) throw new Error(`VieNeu không khởi động được: ${JSON.stringify(ready)}\n${stderr}`);
  log(`VieNeu sẵn sàng sau ${ready.load_s} s (vieneu ${ready.versions?.vieneu}, onnxruntime ${ready.versions?.onnxruntime})`);
  const work = mkdtempSync(path.join(tmpdir(), "content-cli-vieneu-"));
  let n = 0;
  return {
    async synthesize(text, options) {
      const out = path.join(work, `${n++}.f32`);
      child.stdin.write(`${JSON.stringify({ text, voice, variant: options?.variant ?? 0, out })}\n`);
      const reply = await next();
      if (!reply.ok) throw new Error(`VieNeu lỗi với "${text}": ${reply.error}`);
      if (reply.sample_rate !== VI_SAMPLE_RATE) throw new Error(`VieNeu trả ${reply.sample_rate} Hz, cần ${VI_SAMPLE_RATE}`);
      const bytes = readFileSync(out);
      rmSync(out, { force: true });
      const samples = new Float32Array(bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength));
      if (samples.length !== reply.samples) throw new Error(`VieNeu: ${samples.length} mẫu, báo ${reply.samples}`);
      return { samples, sampleRate: VI_SAMPLE_RATE, info: { seeds: [reply.seed!], retried: (reply.babble_retry_log ?? []).length > 0 } };
    },
    async dispose() {
      child.stdin.end();
      await new Promise((resolve) => child.on("close", resolve));
      rmSync(work, { recursive: true, force: true });
    },
  };
}
