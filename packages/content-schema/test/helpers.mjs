import { spawnSync } from "node:child_process";
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { validateDocuments } from "../scripts/lib/core.mjs";

export const ROOT = fileURLToPath(new URL("../", import.meta.url));
export const TOPIC_FILE = "fixtures/valid/discoverer/an-uong-lanh-manh/topic.json";
export const LESSON_FILE = "fixtures/valid/discoverer/an-uong-lanh-manh/01-thuc-an-cho-ta-nhung-gi.json";

export const readJson = (file) => JSON.parse(readFileSync(new URL(file, `file://${ROOT}`), "utf8"));
export const validTopic = () => readJson(TOPIC_FILE);
export const validLesson = () => readJson(LESSON_FILE);

/** Run the CLI from the package root, like `npm run validate` does. */
export function runCli(args) {
  const result = spawnSync(process.execPath, ["scripts/validate.mjs", ...args], { cwd: ROOT, encoding: "utf8" });
  return { status: result.status, stdout: result.stdout, stderr: result.stderr, lines: result.stdout.split("\n").filter(Boolean) };
}

/** Validate in-memory docs; a lesson gets the valid topic as context unless `alone`. */
export function check(docs, options = {}) {
  const list = Array.isArray(docs) ? docs : [docs];
  const context = options.alone ? [] : [{ file: TOPIC_FILE, data: validTopic() }];
  const inputs = [...context, ...list.map((doc, index) => ("data" in doc && "file" in doc ? doc : { file: `mem/${index}.json`, data: doc }))];
  return validateDocuments(inputs, options);
}

export const pointers = (errors) => errors.map((error) => error.pointer).sort();
export const hash = (char) => char.repeat(64);
