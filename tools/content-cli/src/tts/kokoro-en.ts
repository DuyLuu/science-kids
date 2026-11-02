// EN speech: Kokoro-82M v1.0 through kokoro-js (transformers.js + onnxruntime-node, CPU),
// model files from tools/content-cli/.models/ only (remote loading disabled).
import { readFileSync } from "node:fs";
import path from "node:path";
import { sha256Bytes } from "../audio.ts";
import { CLI_ROOT, MODELS_DIR } from "../paths.ts";
import type { EngineSpec, Synthesizer } from "./engine.ts";
import { DEFAULT_DTYPE, ensureModel, MODEL_ID, MODEL_REVISION, modelFiles, type Dtype } from "./kokoro-model.ts";

export const DEFAULT_VOICE = "af_heart";
export const DEFAULT_SPEED = 1.0;
const SAMPLE_RATE = 24000;

function packageVersion(name: string): string {
  const file = path.join(CLI_ROOT, "node_modules", ...name.split("/"), "package.json");
  return JSON.parse(readFileSync(file, "utf8")).version;
}

function voiceFile(voice: string): string {
  return path.join(CLI_ROOT, "node_modules", "kokoro-js", "voices", `${voice}.bin`);
}

export function kokoroEn({ dtype = DEFAULT_DTYPE, voice = DEFAULT_VOICE, speed = DEFAULT_SPEED }: { dtype?: Dtype; voice?: string; speed?: number } = {}): EngineSpec {
  let voiceSha: string;
  try {
    voiceSha = sha256Bytes(readFileSync(voiceFile(voice)));
  } catch {
    throw new Error(`không có giọng "${voice}" trong kokoro-js (${voiceFile(voice)})`);
  }
  const onnx = modelFiles(dtype).find((file) => file.name.startsWith("onnx/"))!;
  const descriptor = {
    engine: "kokoro-js",
    engine_version: packageVersion("kokoro-js"),
    transformers_version: packageVersion("@huggingface/transformers"),
    onnxruntime_version: packageVersion("onnxruntime-node"),
    phonemizer_version: packageVersion("phonemizer"),
    model: MODEL_ID,
    model_revision: MODEL_REVISION,
    dtype,
    model_sha256: onnx.sha256,
    voice,
    voice_sha256: voiceSha,
    speed,
    sample_rate: SAMPLE_RATE,
  };
  return {
    lang: "en",
    label: `Kokoro-82M v1.0 ONNX ${dtype} (rev ${MODEL_REVISION.slice(0, 7)}) · giọng ${voice} · tốc độ ${speed.toFixed(1)}`,
    descriptor,
    async load(log) {
      await ensureModel(dtype, log);
      const { env } = await import("@huggingface/transformers");
      const { KokoroTTS } = await import("kokoro-js");
      env.allowRemoteModels = false;
      env.allowLocalModels = true;
      env.localModelPath = `${MODELS_DIR}${path.sep}`;
      const tts = await KokoroTTS.from_pretrained(MODEL_ID, { dtype, device: "cpu" });
      const synthesizer: Synthesizer = {
        async synthesize(text) {
          const audio = await tts.generate(text, { voice: voice as never, speed });
          if (audio.sampling_rate !== SAMPLE_RATE) throw new Error(`Kokoro trả ${audio.sampling_rate} Hz, cần ${SAMPLE_RATE}`);
          return { samples: audio.audio, sampleRate: audio.sampling_rate };
        },
        async dispose() {
          await (tts.model as unknown as { dispose(): Promise<unknown> }).dispose();
        },
      };
      return synthesizer;
    },
  };
}
