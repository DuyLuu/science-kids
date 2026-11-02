#!/usr/bin/env node
// Usage: node scripts/validate.mjs [--require-assets] <file|folder>...
// Exit 0 = clean, 1 = content errors, 2 = wrong usage.

// src/*.ts is loaded through Node's type stripping (no build step): needs ^22.18 or >=23.6.
const [major, minor] = process.versions.node.split(".").map(Number);
if (major < 22 || (major === 22 && minor < 18) || (major === 23 && minor < 6)) {
  console.error(`Cần Node ^22.18.0 hoặc >= 23.6.0 (chạy thẳng file .ts); máy đang có ${process.version}.`);
  process.exit(2);
}
const { displayPointer } = await import("./lib/pointer.mjs");
const { validatePaths } = await import("./lib/core.mjs");

const USAGE = `Cách dùng: node scripts/validate.mjs [--require-assets] <file|thư mục>...

  Kiểm file topic/lesson (*.json) theo content schema v1: JSON Schema (Ajv) và zod
  phải cùng kết luận, sau đó kiểm chéo id/key giữa các file được đưa vào.
  Đưa kèm topic.json của chủ đề khi kiểm một bài lẻ.

  --require-assets   bắt buộc mọi Spoken có audio.en + audio.vi, mọi Image có asset
  -h, --help         in hướng dẫn này

  Exit 0 = sạch, 1 = có lỗi nội dung, 2 = sai cách gọi.`;

const args = process.argv.slice(2);
const flags = args.filter((arg) => arg.startsWith("-"));
const inputs = args.filter((arg) => !arg.startsWith("-"));

if (flags.includes("-h") || flags.includes("--help")) {
  console.log(USAGE);
  process.exit(0);
}
const unknown = flags.filter((flag) => flag !== "--require-assets");
if (unknown.length > 0 || inputs.length === 0) {
  if (unknown.length > 0) console.error(`Cờ không hỗ trợ: ${unknown.join(" ")}\n`);
  console.error(USAGE);
  process.exit(2);
}

const requireAssets = flags.includes("--require-assets");
const report = validatePaths(inputs, { requireAssets });
const mode = requireAssets ? " (--require-assets)" : "";
const { files, valid, topic, lesson } = report.counts;

for (const error of report.errors) {
  console.log(`${error.file} ${displayPointer(error.pointer)} ${error.message}`);
}
if (report.ok) {
  console.log(`OK${mode}: ${valid} file hợp lệ (${topic} topic, ${lesson} lesson)`);
  process.exit(0);
}
const failed = new Set(report.errors.map((error) => error.file)).size;
console.log(`\nLỖI${mode}: ${report.errors.length} lỗi ở ${failed} file; ${valid}/${files} file hợp lệ (${topic} topic, ${lesson} lesson)`);
process.exit(1);
