// Fixed locations, resolved from this file so the CLI works from any cwd.
import path from "node:path";
import { fileURLToPath } from "node:url";

/** tools/content-cli/ */
export const CLI_ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
/** Repo root (two levels above tools/content-cli/). */
export const REPO_ROOT = path.resolve(CLI_ROOT, "..", "..");
/** Kokoro model files (gitignored). */
export const MODELS_DIR = path.join(CLI_ROOT, ".models");
/** Clip cache: content/.audio/<lang>/<cache key>.m4a + index.json + report-*.json (gitignored). */
export const DEFAULT_AUDIO_DIR = path.join(REPO_ROOT, "content", ".audio");
/** Build outputs (gitignored). The review clip lands in content/.build/tts/. */
export const DEFAULT_REVIEW_DIR = path.join(REPO_ROOT, "content", ".build", "tts");
/** Content pack written by `build` (gitignored); the iOS app embeds this folder (SK-016). */
export const DEFAULT_PACK_DIR = path.join(REPO_ROOT, "content", ".build", "pack");
/** Single source of `rules` (technical-plan.md B5.3). */
export const DEFAULT_RULES_FILE = path.join(REPO_ROOT, "content", "rules.json");

/** Relative to the cwd when the target is under it, absolute otherwise (same rule as validate.mjs). */
export function display(target: string): string {
  const relative = path.relative(process.cwd(), target);
  return relative && !relative.startsWith("..") && !path.isAbsolute(relative) ? relative : path.resolve(target);
}
