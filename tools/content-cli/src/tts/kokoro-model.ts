// Kokoro-82M v1.0 (ONNX export by onnx-community, Apache-2.0): pinned revision, pinned sha256,
// downloaded once into tools/content-cli/.models/. This is the only network access of the CLI.
import { createHash } from "node:crypto";
import { createReadStream, createWriteStream, existsSync, mkdirSync, renameSync, statSync, unlinkSync } from "node:fs";
import path from "node:path";
import { Readable } from "node:stream";
import { pipeline } from "node:stream/promises";
import { MODELS_DIR } from "../paths.ts";

export const MODEL_ID = "onnx-community/Kokoro-82M-v1.0-ONNX";
/** Git commit on Hugging Face (2025-02-08). Bump together with the sha256 below. */
export const MODEL_REVISION = "1939ad2a8e416c0acfeecc08a694d14ef25f2231";

export type Dtype = "fp32" | "fp16" | "q8";
export const DEFAULT_DTYPE: Dtype = "fp32";

type ModelFile = { name: string; bytes: number; sha256: string };

const COMMON_FILES: ModelFile[] = [
  { name: "config.json", bytes: 44, sha256: "df34b4f930b23447cd4dc410fabfb42eb3f24e803e6c3f97d618fb359380a36f" },
  { name: "tokenizer.json", bytes: 3497, sha256: "77a02c8e164413299b4b4c403b14f8e0e1c1b727db4d46a09d6327b861060a34" },
  { name: "tokenizer_config.json", bytes: 113, sha256: "be1cb066d6ef6b074b3f15e6a6dd21ac88ff3cdaedf325f0aaed686c70f75d20" },
];

/** onnx/<file> per dtype, as transformers.js names them (fp32 = model.onnx, q8 = model_quantized.onnx). */
const ONNX_FILES: Record<Dtype, ModelFile> = {
  fp32: { name: "onnx/model.onnx", bytes: 325532232, sha256: "8fbea51ea711f2af382e88c833d9e288c6dc82ce5e98421ea61c058ce21a34cb" },
  fp16: { name: "onnx/model_fp16.onnx", bytes: 163234740, sha256: "ba4527a874b42b21e35f468c10d326fdff3c7fc8cac1f85e9eb6c0dfc35c334a" },
  q8: { name: "onnx/model_quantized.onnx", bytes: 92361116, sha256: "fbae9257e1e05ffc727e951ef9b9c98418e6d79f1c9b6b13bd59f5c9028a1478" },
};

export function isDtype(value: string): value is Dtype {
  return Object.hasOwn(ONNX_FILES, value);
}

export function modelFiles(dtype: Dtype): ModelFile[] {
  return [...COMMON_FILES, ONNX_FILES[dtype]];
}

/** Folder transformers.js reads with env.localModelPath = MODELS_DIR. */
export function modelDir(): string {
  return path.join(MODELS_DIR, ...MODEL_ID.split("/"));
}

export function downloadUrl(name: string): string {
  return `https://huggingface.co/${MODEL_ID}/resolve/${MODEL_REVISION}/${name}`;
}

export async function sha256File(file: string): Promise<string> {
  const hash = createHash("sha256");
  await pipeline(createReadStream(file), hash);
  return hash.digest("hex");
}

/** Files missing or with the wrong size (cheap check; sha256 is verified at download time). */
export function missingModelFiles(dtype: Dtype): ModelFile[] {
  return modelFiles(dtype).filter((file) => {
    const target = path.join(modelDir(), file.name);
    return !existsSync(target) || statSync(target).size !== file.bytes;
  });
}

const mb = (bytes: number) => `${(bytes / 1e6).toFixed(1)} MB`;

/** Download what is missing, verify size + sha256, then move into place. */
export async function ensureModel(dtype: Dtype, log: (line: string) => void): Promise<{ downloaded: number }> {
  const missing = missingModelFiles(dtype);
  if (missing.length === 0) return { downloaded: 0 };
  const total = missing.reduce((sum, file) => sum + file.bytes, 0);
  log(`Tải model Kokoro (${dtype}, ${mb(total)}) từ huggingface.co/${MODEL_ID} @ ${MODEL_REVISION.slice(0, 7)} vào ${modelDir()}`);
  for (const file of missing) {
    const target = path.join(modelDir(), file.name);
    const partial = `${target}.part`;
    mkdirSync(path.dirname(target), { recursive: true });
    const url = downloadUrl(file.name);
    const response = await fetch(url);
    if (!response.ok || !response.body) throw new Error(`tải ${url} thất bại: HTTP ${response.status}`);
    let received = 0;
    let nextMark = 0.1;
    const counter = new TransformStream<Uint8Array, Uint8Array>({
      transform(chunk, controller) {
        received += chunk.byteLength;
        if (file.bytes > 10e6 && received / file.bytes >= nextMark) {
          log(`  ${file.name}: ${Math.round((received / file.bytes) * 100)}% (${mb(received)})`);
          nextMark += 0.1;
        }
        controller.enqueue(chunk);
      },
    });
    await pipeline(Readable.fromWeb(response.body.pipeThrough(counter) as never), createWriteStream(partial));
    const size = statSync(partial).size;
    const digest = await sha256File(partial);
    if (size !== file.bytes || digest !== file.sha256) {
      unlinkSync(partial);
      throw new Error(`${file.name}: sai kích thước hoặc sha256 (nhận ${size} byte, sha256 ${digest}; cần ${file.bytes} byte, ${file.sha256})`);
    }
    renameSync(partial, target);
    log(`  ${file.name}: xong, ${mb(size)}, sha256 ${digest.slice(0, 12)}…`);
  }
  return { downloaded: missing.length };
}
