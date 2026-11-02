// Tests for scripts/export-swift.mjs (SK-007). Run: npm test
import assert from 'node:assert/strict';
import { execFileSync, spawnSync } from 'node:child_process';
import { mkdtempSync, readFileSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { test } from 'node:test';
import { fileURLToPath } from 'node:url';

import {
  DEFAULT_OUT,
  DEFAULT_TOKENS,
  HEADER,
  TokenError,
  diffAgainst,
  generateSwift,
  lowerCamel,
  swiftIdentifier,
} from '../scripts/export-swift.mjs';

const SCRIPT = fileURLToPath(new URL('../scripts/export-swift.mjs', import.meta.url));
const tokens = () => JSON.parse(readFileSync(DEFAULT_TOKENS, 'utf8'));

function countLeaves(node) {
  let n = 0;
  for (const [k, v] of Object.entries(node)) {
    if (k.startsWith('$') || !v || typeof v !== 'object') continue;
    n += '$value' in v ? 1 : countLeaves(v);
  }
  return n;
}

test('one public static let per leaf, header on the first line', () => {
  const gen = generateSwift(tokens());
  assert.equal(gen.leafCount, countLeaves(tokens()));
  assert.equal(gen.constantCount, gen.leafCount);
  assert.equal(gen.blocks.size, gen.leafCount);
  assert.equal(gen.text.split('\n')[0], HEADER);
  assert.ok(gen.text.endsWith('}\n'));
});

test('same input gives the same bytes', () => {
  assert.equal(generateSwift(tokens()).text, generateSwift(tokens()).text);
});

test('committed Tokens.swift is up to date', () => {
  assert.equal(readFileSync(DEFAULT_OUT, 'utf8'), generateSwift(tokens()).text);
});

test('names: snake_case → lowerCamelCase, keywords get backticks', () => {
  assert.equal(lowerCamel('do_son'), 'doSon');
  assert.equal(lowerCamel('title_xl'), 'titleXl');
  assert.equal(lowerCamel('paper_1'), 'paper1');
  assert.equal(lowerCamel('preserve_3d'), 'preserve3d');
  assert.equal(swiftIdentifier('default', 'x'), '`default`');
  assert.equal(swiftIdentifier('in', 'x'), '`in`');
  assert.equal(swiftIdentifier('doSon', 'x'), 'doSon');
  assert.throws(() => swiftIdentifier('12', 'space.12'), TokenError);

  const t = tokens();
  t.radius.default = { $value: 8, $type: 'dimension' };
  assert.match(generateSwift(t).text, /public static let `default`: CGFloat = 8\n/);
});

test('mapping samples', () => {
  const { text } = generateSwift(tokens());
  assert.match(text, /public static let doSon: Color = Color\(\.sRGB, red: 0xA9 \/ 255, green: 0x3A \/ 255, blue: 0x27 \/ 255\)/);
  assert.match(text, /public static let actionPrimary: Color = Tokens\.Palette\.doSon\n/);
  assert.match(text, /public static let discoverer: CGFloat = 56\n/);
  assert.match(text, /public static let paperFrameMax: CGFloat = 600\n/);
  assert.match(text, /public static let step: TimeInterval = 0\.06\n/);
  assert.match(text, /public static let maxCategory: DynamicTypeSize = \.xxxLarge\n/);
  assert.match(text, /public static let tiltStamp: Angle = \.degrees\(-8\)\n/);
  assert.match(text, /Tokens\.Shadow\.Layer\(x: 0, y: 7, blur: 0, spread: 0, color: Tokens\.Palette\.doSonDeep, inset: false\)/);
  assert.match(text, /color: Tokens\.Palette\.mucBong\.opacity\(0\.3\), inset: false\)/);
  assert.match(text, /public static let lay: Tokens\.KeyframeAnimation = Tokens\.KeyframeAnimation\(\n\s+duration: 0\.46,\n\s+easing: Tokens\.CubicBezier\(0\.2, 0\.8, 0\.2, 1\),/);
  assert.match(text, /repeats: true,/); // sway, nudge
  assert.match(text, /textCase: \.uppercase\n/); // eyebrow
});

test('diff names only the token whose value changed', () => {
  const real = generateSwift(tokens());
  const t = tokens();
  t.color.palette.do_son.$value = '#A93A28';
  t.radius.discoverer.$value = 11;
  const d = diffAgainst(real.text, generateSwift(t));
  assert.deepEqual(d.changed.sort(), ['color.palette.do_son', 'radius.discoverer']);
  assert.deepEqual(d.added, []);
  assert.deepEqual(d.removed, []);
});

test('diff reports added and removed tokens', () => {
  const real = generateSwift(tokens());
  const t = tokens();
  delete t.space.s32;
  t.space.s40 = { $value: 40, $type: 'dimension' };
  const d = diffAgainst(real.text, generateSwift(t));
  assert.deepEqual(d.added, ['space.s40']);
  assert.deepEqual(d.removed, ['space.s32']);
});

test('bad input fails with a message naming the token', () => {
  const broken = (mutate) => {
    const t = tokens();
    mutate(t);
    return () => generateSwift(t);
  };
  assert.throws(broken((t) => { t.color.role.link.$value = '{color.palette.khong_co}'; }), /color\.role\.link: tham chiếu/);
  assert.throws(broken((t) => { t.color.role.link.$value = '{radius.discoverer}'; }), /\$type dimension, cần color/);
  assert.throws(broken((t) => { t.shadow.paper_1.$value[0].offset_x = 1; }), /shadow\.paper_1\[0\]: khoá lạ offset_x/);
  assert.throws(broken((t) => { t.motion.preset.lay.$value.keyframes[0].skew = 2; }), /thuộc tính motion lạ skew/);
  assert.throws(broken((t) => { t.radius.mystery = { $value: 1, $type: 'angle' }; }), /radius\.mystery: \$type "angle"/);
  assert.throws(broken((t) => { t.color.palette.diep.$value = '#F0E6CF80'; }), /#RRGGBB/);
  assert.throws(broken((t) => { t.radius.Bad_Key = { $value: 1, $type: 'dimension' }; }), /snake_case/);
  assert.throws(broken((t) => { t.color.role.link.$value = '{color.role.link}'; }), /tham chiếu vòng/);
});

test('CLI --check: exit 0 on the real file, exit 1 and the token name on a modified copy', () => {
  const ok = spawnSync(process.execPath, [SCRIPT, '--check'], { encoding: 'utf8' });
  assert.equal(ok.status, 0, ok.stderr);
  assert.match(ok.stdout, /Lá trong .*: (\d+) · Hằng trong Tokens\.swift: \1/);

  const dir = mkdtempSync(join(tmpdir(), 'sk007-'));
  const copy = join(dir, 'tokens.json');
  const t = tokens();
  t.layout.paper_frame_max.$value = 640;
  writeFileSync(copy, JSON.stringify(t, null, 2));
  const bad = spawnSync(process.execPath, [SCRIPT, '--check', '--tokens', copy], { encoding: 'utf8' });
  assert.equal(bad.status, 1);
  assert.match(bad.stderr, /lệch: layout\.paper_frame_max\n/);
  assert.doesNotMatch(bad.stderr, /lệch: (?!layout\.paper_frame_max)/);
});

test('CLI writes to --out and a second run leaves it unchanged', () => {
  const dir = mkdtempSync(join(tmpdir(), 'sk007-'));
  const out = join(dir, 'Generated', 'Tokens.swift');
  const first = execFileSync(process.execPath, [SCRIPT, '--out', out], { encoding: 'utf8' });
  assert.match(first, /Đã ghi/);
  const bytes = readFileSync(out);
  const second = execFileSync(process.execPath, [SCRIPT, '--out', out], { encoding: 'utf8' });
  assert.match(second, /Không đổi/);
  assert.deepEqual(readFileSync(out), bytes);
});
