// VI self-check (SK-024): runs tools/content-cli/tts-vi/evaluate.py `check` (Whisper large-v3-turbo
// from the local Hugging Face cache, 2 ASR passes, signal measurements) on freshly generated clips.
import { spawn } from "node:child_process";
import { existsSync, mkdtempSync, readFileSync, rmSync, writeFileSync } from "node:fs";
import { tmpdir } from "node:os";
import path from "node:path";
import { TTS_VI_DIR, VI_EVAL_PYTHON } from "./vieneu-vi.ts";

export type CheckJob = { id: string; m4a: string; ref: string; retry: boolean; blank: boolean; cut_end_raw?: boolean };
export type CheckResult = {
  id: string;
  hyp: string[];
  tolerant_errors: number;
  tone_errors: number;
  passes_with_errors: number;
  duration_s: number;
  lead_silence_s: number;
  trail_silence_s: number;
  max_pause_s: number;
  end_db: number;
  flags: string[];
  badness: number;
};

export const FLAG_LABELS: Record<string, string> = {
  asr: "máy nghe ra sai chữ hoặc sai thanh",
  cut_end: "cụt cuối (engine dừng khi chưa đọc hết âm)",
  no_lead: "không có khoảng lặng đầu",
  long_pause: "ngắt quá 0,8 s",
  engine_retry: "engine phải tự sinh lại",
  too_short: "ngắn dưới 0,3 s",
  silent: "chỉ có khoảng lặng",
};

export async function selfCheck(jobs: CheckJob[], log: (line: string) => void, passes = 2): Promise<Map<string, CheckResult>> {
  if (!existsSync(VI_EVAL_PYTHON)) {
    throw new Error(`chưa có môi trường chấm (${VI_EVAL_PYTHON}). Chạy: cd tools/content-cli/tts-vi && UV_PROJECT_ENVIRONMENT=.venv-eval uv sync --only-group eval (hoặc thêm --no-self-check)`);
  }
  const work = mkdtempSync(path.join(tmpdir(), "content-cli-check-"));
  try {
    const jobsFile = path.join(work, "jobs.jsonl");
    const resultsFile = path.join(work, "results.jsonl");
    writeFileSync(jobsFile, jobs.map((job) => JSON.stringify(job)).join("\n") + "\n");
    await new Promise<void>((resolve, reject) => {
      const child = spawn(VI_EVAL_PYTHON, ["evaluate.py", "check", "--jobs", jobsFile, "--results", resultsFile, "--passes", String(passes)], {
        cwd: TTS_VI_DIR,
        env: { ...process.env, HF_HUB_OFFLINE: "1", HF_HUB_DISABLE_TELEMETRY: "1" },
        stdio: ["ignore", "ignore", "pipe"],
      });
      let err = "";
      child.stderr.on("data", (chunk: Buffer) => {
        err = (err + chunk).slice(-4000);
        for (const line of String(chunk).split("\n")) if (line.startsWith("self-check:")) log(`  ${line}`);
      });
      child.on("error", reject);
      child.on("close", (code) => (code === 0 ? resolve() : reject(new Error(`evaluate.py check exit ${code}\n${err}`))));
    });
    const results = new Map<string, CheckResult>();
    for (const line of readFileSync(resultsFile, "utf8").split("\n")) {
      if (!line.trim()) continue;
      const result = JSON.parse(line) as CheckResult;
      results.set(result.id, result);
    }
    return results;
  } finally {
    rmSync(work, { recursive: true, force: true });
  }
}
