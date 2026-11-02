#!/usr/bin/env node
// Chạy mọi case của 7 bộ vector qua bản cài tham chiếu (reference-engine.mjs) và so với expected.
// Dùng: node tools/run-reference.mjs [--verbose]
// Exit 0 khi mọi case khớp, 1 khi có case lệch.

import { readFileSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { SUITES } from './reference-engine.mjs';
import { deepEqual } from './mini-json-schema.mjs';

const dir = join(dirname(fileURLToPath(import.meta.url)), '..');
const verbose = process.argv.includes('--verbose');
const SUITE_ORDER = ['item-scoring', 'lesson-score', 'stars', 'streak', 'local-date', 'warmup-selection', 'build-tray'];

let failed = 0;
let total = 0;
for (const suite of SUITE_ORDER) {
  const file = JSON.parse(readFileSync(join(dir, `${suite}.json`), 'utf8'));
  const fn = SUITES[suite];
  let pass = 0;
  for (const c of file.cases) {
    total++;
    const rules = { ...file.default_rules, ...(c.rules ?? {}) }; // gộp nông, giống jsonb ||
    let actual;
    try {
      actual = fn(structuredClone(c.input), rules);
    } catch (e) {
      actual = { exception: e.message };
    }
    if (deepEqual(actual, c.expected)) {
      pass++;
      if (verbose) console.log(`  ok   ${c.id}`);
    } else {
      failed++;
      console.log(`  FAIL ${c.id}\n       expected ${JSON.stringify(c.expected)}\n       actual   ${JSON.stringify(actual)}`);
    }
  }
  console.log(`${suite.padEnd(18)} ${pass}/${file.cases.length} khớp`);
}
console.log(failed === 0 ? `\nOK: ${total}/${total} case khớp bản cài tham chiếu` : `\nLỖI: ${failed}/${total} case lệch`);

// Độ nhạy ngưỡng: case nào ra kết quả khác nhau giữa 4/6 (PRD) và 5/6 (đề xuất) thì phải ghim
// rules.pass_threshold, để khi Duy đổi default_rules thì case đó không âm thầm đổi nghĩa.
const THRESHOLDS = [{ num: 4, den: 6 }, { num: 5, den: 6 }];
let unpinned = 0;
let probed = 0;
for (const suite of SUITE_ORDER) {
  const file = JSON.parse(readFileSync(join(dir, `${suite}.json`), 'utf8'));
  for (const c of file.cases) {
    if (c.rules?.pass_threshold) continue;
    probed++;
    const outs = THRESHOLDS.map((t) => {
      try { return SUITES[suite](structuredClone(c.input), { ...file.default_rules, ...(c.rules ?? {}), pass_threshold: t }); } catch (e) { return { exception: e.message }; }
    });
    if (!deepEqual(outs[0], outs[1])) {
      unpinned++;
      console.log(`  GHIM ${c.id}: 4/6 ra ${JSON.stringify(outs[0])}, 5/6 ra ${JSON.stringify(outs[1])} → ghi rules.pass_threshold`);
    }
  }
}
console.log(unpinned === 0
  ? `OK: ${probed} case không ghim pass_threshold đều cho cùng kết quả ở 4/6 và 5/6`
  : `LỖI: ${unpinned} case phụ thuộc ngưỡng mà chưa ghim pass_threshold`);
process.exit(failed === 0 && unpinned === 0 ? 0 : 1);
