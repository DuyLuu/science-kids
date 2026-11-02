#!/usr/bin/env node
// Kiểm hình dạng và nhất quán của bộ test vector SK-003. Không chạy luật chấm: phần đó ở run-reference.mjs.
//
// Dùng (từ packages/content-schema):
//   node test-vectors/tools/check-vectors.mjs              kiểm tất cả
//   node test-vectors/tools/check-vectors.mjs --coverage   in thêm bảng "tình huống bắt buộc → case"
//   node test-vectors/tools/check-vectors.mjs --no-os-date bỏ bước đối chiếu với lệnh `date` (máy không có date)
// Exit 0 khi sạch, 1 khi có lỗi, 2 khi sai cách gọi.
//
// Chạy được không cần npm install. Khi có node_modules của packages/content-schema thì chạy thêm:
//   - Ajv 2020 trên vector.schema.json (phải cùng kết luận với mini-json-schema.mjs);
//   - Ajv trên schema/quiz-item.schema.json của SK-001 với từng item của item-scoring sau khi điền
//     chữ giữ chỗ cho các trường không phải đáp án (để chắc item là một câu SK-001 hợp lệ).

import { readFileSync, existsSync, readdirSync } from 'node:fs';
import { spawnSync } from 'node:child_process';
import { dirname, join, relative } from 'node:path';
import { fileURLToPath } from 'node:url';
import { createValidator, deepEqual } from './mini-json-schema.mjs';
import { addDays, calendarLabel, dayDiff, isValidDate, isoWeek, localDate } from './calendar.mjs';

const TOOLS = dirname(fileURLToPath(import.meta.url));
const DIR = join(TOOLS, '..');
const PKG = join(DIR, '..');
const REPO = join(PKG, '..', '..');
const TICKET = join(REPO, 'docs', 'backlog', 'SK-003-scoring-test-vectors-v1.md');
const TICKET_SK012 = join(REPO, 'docs', 'backlog', 'SK-012-ios-lesson-player.md');
const FIXTURE_L1 = join(PKG, 'fixtures', 'valid', 'discoverer', 'an-uong-lanh-manh', '01-thuc-an-cho-ta-nhung-gi.json');

const args = process.argv.slice(2);
const KNOWN_FLAGS = new Set(['--coverage', '--no-os-date']);
for (const a of args) {
  if (!KNOWN_FLAGS.has(a)) {
    console.error(`Không hiểu tham số ${a}. Dùng: node test-vectors/tools/check-vectors.mjs [--coverage] [--no-os-date]`);
    process.exit(2);
  }
}
const SHOW_COVERAGE = args.includes('--coverage');
const USE_OS_DATE = !args.includes('--no-os-date');

// ------------------------------------------------------------------ bảng của ticket SK-003
// Tên hàm, số case tối thiểu (bảng Phạm vi) và nơi chạy (tiêu chí nghiệm thu, gạch README).
const SUITES = {
  'item-scoring': { fn: 'score_item', min: 20, platforms: ['app'] },
  'lesson-score': { fn: 'score_lesson', min: 6, platforms: ['app', 'server'] },
  stars: { fn: 'compute_stars', min: 12, platforms: ['app', 'server'] },
  streak: { fn: 'compute_streak', min: 14, platforms: ['app', 'server'] },
  'local-date': { fn: 'local_date', min: 5, platforms: ['app', 'server'] },
  'warmup-selection': { fn: 'select_warmup', min: 10, platforms: ['server', 'app_offline'] },
  'build-tray': { fn: 'build_tray', min: 20, platforms: ['app'] }, // SK-012; luật ở SK-012 T1–T4 và quyết định 3 (Duy chốt 29/10)
};
const REQUIRED_FILES = [...Object.keys(SUITES).map((s) => `${s}.json`), 'vector.schema.json', 'README.md'];
// D1–D6 của PM (ticket), T1–T6 của tester (ghi trong ticket, mục "Quyết định đã ghi").
const KNOWN_DECISIONS = [
  ...['D1', 'D2', 'D3', 'D4', 'D5', 'D6', 'T1', 'T2', 'T3', 'T4', 'T5', 'T6'].map((d) => `SK-003/${d}`),
  ...['T1', 'T2', 'T3', 'T4'].map((d) => `SK-012/${d}`), // tester, mục "Vector mâm cơm" của SK-012
];
// Khoá rules được phép ghi lại đúng bằng default_rules: case nào phụ thuộc ngưỡng 4/6 hay 5/6 thì ghim
// pass_threshold, để khi Duy đổi default_rules thì case đó không âm thầm đổi nghĩa.
const PINNABLE_RULES = new Set(['pass_threshold']);
const SLOT_ORDER = ['recent', 'week', 'month', 'fill', 'recent_second', 'prior_knowledge']; // T6
const SK001_FORMATS = ['single_choice', 'multi_choice', 'true_false', 'fill_blank_bank', 'order_sequence', 'picture_bar_chart'];
const VI_CHARS = /[àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ]/i;
const CASE_REF = /\b(item-scoring|lesson-score|stars|streak|local-date|warmup-selection|build-tray)-\d{3}\b/g;

// ------------------------------------------------------------------ báo lỗi
const errors = [];
const warnings = [];
const err = (file, pointer, message) => errors.push(`${file} ${pointer || '/'} ${message}`);
const warn = (message) => warnings.push(message);
const steps = [];
const step = (name, detail) => steps.push(`  ${name.padEnd(42)} ${detail}`);
// Dữ liệu sai hình dạng có thể làm một bước kiểm sau ném lỗi; báo thành một dòng lỗi thay vì stack trace.
const safely = (file, pointer, fn) => {
  try { fn(); } catch (e) { err(file, pointer, `không kiểm tiếp được (${e.message}); sửa lỗi hình dạng ở trên trước`); }
};

// ------------------------------------------------------------------ 1. đủ file
const missing = REQUIRED_FILES.filter((f) => !existsSync(join(DIR, f)));
for (const f of missing) err(f, '', 'thiếu file (bảng Phạm vi của SK-003)');
const extra = readdirSync(DIR).filter((f) => f.endsWith('.json') && !REQUIRED_FILES.includes(f));
for (const f of extra) err(f, '', 'file .json lạ: mỗi file vector phải là một bộ trong bảng của SK-003');
step(`Đủ ${REQUIRED_FILES.length} file của bảng Phạm vi`, `${REQUIRED_FILES.length - missing.length}/${REQUIRED_FILES.length}`);

const vectorSchema = JSON.parse(readFileSync(join(DIR, 'vector.schema.json'), 'utf8'));
const files = {};
for (const suite of Object.keys(SUITES)) {
  const name = `${suite}.json`;
  if (!existsSync(join(DIR, name))) continue;
  try {
    files[suite] = JSON.parse(readFileSync(join(DIR, name), 'utf8'));
  } catch (e) {
    err(name, '', `JSON không hợp lệ: ${e.message}`);
  }
}

// ------------------------------------------------------------------ 2. đúng vector.schema.json (mini + Ajv)
const mini = createValidator(vectorSchema);
let ajvVector = null;
let Ajv2020 = null;
try {
  Ajv2020 = (await import('ajv/dist/2020.js')).default;
  const ajv = new Ajv2020({ allErrors: true, strict: true, strictTypes: false, strictRequired: false });
  ajvVector = ajv.compile(vectorSchema);
} catch (e) {
  if (Ajv2020) err('vector.schema.json', '', `Ajv không biên dịch được schema: ${e.message}`);
  else warn('Không có Ajv (chưa npm install trong packages/content-schema): chỉ chạy mini-json-schema, bỏ bước kiểm SK-001 bằng Ajv.');
}
let schemaOk = 0;
for (const [suite, data] of Object.entries(files)) {
  const name = `${suite}.json`;
  const miniErrs = mini(data);
  for (const e of miniErrs) err(name, e.path, e.message);
  if (ajvVector) {
    const ajvOk = ajvVector(data);
    if (ajvOk !== (miniErrs.length === 0)) {
      err(name, '', `parity: Ajv ${ajvOk ? 'nhận' : 'từ chối'} nhưng mini-json-schema ${miniErrs.length ? 'từ chối' : 'nhận'}`
        + (ajvOk ? '' : ` (Ajv: ${ajvVector.errors.slice(0, 3).map((x) => `${x.instancePath} ${x.message}`).join('; ')})`));
    }
  }
  if (data.$schema !== './vector.schema.json') err(name, '/$schema', 'phải là "./vector.schema.json" để editor gợi ý được');
  if (data.suite !== suite) err(name, '/suite', `phải trùng tên file (${suite})`);
  if (miniErrs.length === 0) schemaOk++;
}
step('Đúng vector.schema.json', `${schemaOk}/${Object.keys(files).length} file`
  + (ajvVector ? ' (mini-json-schema và Ajv 2020 cùng kết luận)' : ' (chỉ mini-json-schema)'));

// ------------------------------------------------------------------ 3. đầu file: hàm, nơi chạy, số case, default_rules
let defaultRef = null;
for (const [suite, data] of Object.entries(files)) {
  const name = `${suite}.json`;
  const spec = SUITES[suite];
  if (typeof data.function !== 'string' || !data.function.startsWith(`${spec.fn}(`)) {
    err(name, '/function', `phải bắt đầu bằng "${spec.fn}(" theo bảng của SK-003`);
  }
  if (!deepEqual([...(data.platforms ?? [])].sort(), [...spec.platforms].sort())) {
    err(name, '/platforms', `phải là ${JSON.stringify(spec.platforms)} theo SK-003, đang là ${JSON.stringify(data.platforms)}`);
  }
  if ((data.cases?.length ?? 0) < spec.min) err(name, '/cases', `cần ít nhất ${spec.min} case, đang có ${data.cases?.length ?? 0}`);
  if (defaultRef === null) defaultRef = { suite, rules: data.default_rules };
  else if (!deepEqual(data.default_rules, defaultRef.rules)) {
    err(name, '/default_rules', `khác default_rules của ${defaultRef.suite}.json; mọi file phải dùng cùng một bản sao`);
  }
}
const counts = Object.entries(files).map(([s, d]) => `${s} ${d.cases?.length ?? 0}/${SUITES[s].min}`);
step('Số case ≥ tối thiểu', counts.join(' · '));
step('default_rules giống nhau ở mọi file', defaultRef ? 'có' : 'không đọc được');

// ------------------------------------------------------------------ 4. từng case: id, mô tả, decision, rules
const ticketTexts = {
  'SK-003': existsSync(TICKET) ? readFileSync(TICKET, 'utf8') : null,
  'SK-012': existsSync(TICKET_SK012) ? readFileSync(TICKET_SK012, 'utf8') : null,
};
for (const [k, v] of Object.entries(ticketTexts)) if (!v) warn(`Không thấy ticket ${k}: bỏ bước đối chiếu decision của ${k} với ticket.`);
const allIds = new Set();
const usedDecisions = new Set();
for (const [suite, data] of Object.entries(files)) {
  const name = `${suite}.json`;
  let prevNum = 0;
  (data.cases ?? []).forEach((c, i) => {
    const p = `/cases/${i}`;
    const m = new RegExp(`^${suite}-(\\d{3})$`).exec(c.id ?? '');
    if (!m) err(name, `${p}/id`, `id phải có dạng ${suite}-NNN, đang là ${JSON.stringify(c.id)}`);
    else {
      const n = Number(m[1]);
      if (n <= prevNum) err(name, `${p}/id`, `${c.id} không tăng dần (case trước là số ${String(prevNum).padStart(3, '0')})`);
      prevNum = Math.max(prevNum, n);
    }
    if (allIds.has(c.id)) err(name, `${p}/id`, `id ${c.id} bị trùng`);
    allIds.add(c.id);

    const d = c.description ?? '';
    if (d.trim().length < 40) err(name, `${p}/description`, 'mô tả quá ngắn: cần nêu luật đang kiểm và vì sao ra expected');
    if (!VI_CHARS.test(d)) err(name, `${p}/description`, 'mô tả phải viết bằng tiếng Việt có dấu');

    for (const ref of [].concat(c.decision ?? [])) {
      usedDecisions.add(ref);
      if (!KNOWN_DECISIONS.includes(ref)) err(name, `${p}/decision`, `${ref} không có trong danh sách quyết định (SK-003, SK-012)`);
    }
    if (c.status === 'proposed' && c.decision === undefined) err(name, `${p}/decision`, 'case proposed phải có decision');
    if (c.status === 'confirmed' && c.decision !== undefined) err(name, `${p}/decision`, 'case confirmed không được có decision: đã chốt thì xoá decision, chưa chốt thì để proposed');

    for (const [k, v] of Object.entries(c.rules ?? {})) {
      const def = data.default_rules?.[k];
      if (deepEqual(v, def) && !PINNABLE_RULES.has(k)) {
        err(name, `${p}/rules/${k}`, 'bằng default_rules: rules của case chỉ ghi phần khác mặc định');
      }
    }
  });
}
for (const ref of usedDecisions) {
  const [tk, code] = ref.split('/');
  if (ticketTexts[tk] && !new RegExp(`\\*\\*${code} ·`).test(ticketTexts[tk])) {
    err(tk, '', `decision ${ref} được dùng trong vector nhưng ticket chưa ghi "**${code} · …**"`);
  }
}
step('id duy nhất, đúng tiền tố, tăng dần', `${allIds.size} id`);
step('decision có trong ticket', `${usedDecisions.size} mã: ${[...usedDecisions].sort().map((r) => r.replace(/^SK-0*/, '')).join(', ')}`);

// Tham chiếu case trong mô tả và notes phải trỏ tới case có thật.
for (const [suite, data] of Object.entries(files)) {
  const texts = [...(data.notes ?? []).map((t, i) => [`/notes/${i}`, t]), ...(data.cases ?? []).map((c, i) => [`/cases/${i}/description`, c.description ?? ''])];
  for (const [p, t] of texts) {
    for (const ref of t.match(CASE_REF) ?? []) if (!allIds.has(ref)) err(`${suite}.json`, p, `nhắc tới ${ref} nhưng không có case này`);
  }
}

// ------------------------------------------------------------------ 5. ngày, thứ, tuần ISO bằng công cụ
// Hai nguồn độc lập: Node (calendar.mjs, Intl/ICU) và lệnh `date` của hệ điều hành (BSD hoặc GNU).
const osDate = (() => {
  if (!USE_OS_DATE) return null;
  const run = (argv, env = {}) => {
    const r = spawnSync('date', argv, { encoding: 'utf8', env: { ...process.env, LC_ALL: 'C', ...env } });
    return r.status === 0 ? r.stdout.trim() : null;
  };
  if (run(['-j', '-f', '%Y-%m-%d', '2026-12-31', '+%a %G-W%V']) === 'Thu 2026-W53') {
    return {
      kind: 'BSD',
      label: (d) => run(['-j', '-f', '%Y-%m-%d', d, '+%a %G-W%V']),
      local: (epoch, tz) => run(['-r', String(epoch), '+%Y-%m-%d'], { TZ: tz }),
    };
  }
  if (run(['-d', '2026-12-31', '+%a %G-W%V']) === 'Thu 2026-W53') {
    return {
      kind: 'GNU',
      label: (d) => run(['-d', d, '+%a %G-W%V']),
      local: (epoch, tz) => run(['-d', `@${epoch}`, '+%Y-%m-%d'], { TZ: tz }),
    };
  }
  warn('Không chạy được lệnh `date` (BSD hoặc GNU): chỉ đối chiếu bằng Node.');
  return null;
})();
const epochOf = (ts) => Math.floor(Date.parse(ts) / 1000);
let calendarChecked = 0;
let localChecked = 0;
let osChecked = 0;

function checkLocal(name, pointer, ts, tz, want) {
  localChecked++;
  const node = localDate(ts, tz);
  if (node !== want) err(name, pointer, `local_date(${ts}, ${tz}) theo Node là ${node}, vector ghi ${want}`);
  if (osDate) {
    osChecked++;
    const os = osDate.local(epochOf(ts), tz);
    if (os !== want) err(name, pointer, `local_date(${ts}, ${tz}) theo lệnh date là ${os}, vector ghi ${want}`);
  }
}

for (const [suite, data] of Object.entries(files)) {
  const name = `${suite}.json`;
  const tz = data.context?.timezone;
  (data.cases ?? []).forEach((c, i) => safely(name, `/cases/${i}`, () => {
    const p = `/cases/${i}`;
    // Mọi chuỗi ngày trong input/expected phải là ngày có thật (pattern không bắt được 2026-02-30).
    const walk = (x, path) => {
      if (typeof x === 'string' && /^\d{4}-\d{2}-\d{2}$/.test(x) && !isValidDate(x)) err(name, path, `ngày không có thật: ${x}`);
      if (x && typeof x === 'object') for (const [k, v] of Object.entries(x)) walk(v, `${path}/${k}`);
    };
    walk(c.input, `${p}/input`);
    walk(c.expected, `${p}/expected`);

    for (const [d, label] of Object.entries(c.derived?.calendar ?? {})) {
      calendarChecked++;
      const node = calendarLabel(d);
      if (node !== label) err(name, `${p}/derived/calendar/${d}`, `Node tính ${node}, vector ghi ${label}`);
      if (osDate) {
        osChecked++;
        const os = osDate.label(d);
        if (os !== label) err(name, `${p}/derived/calendar/${d}`, `lệnh date ra ${os}, vector ghi ${label}`);
      }
    }
    if (c.derived?.ages) {
      const hist = c.input?.history ?? [];
      const want = Object.fromEntries(hist.map((h) => [h.lesson_id, dayDiff(h.last_completed_date, c.input.today)]));
      if (!deepEqual(c.derived.ages, want)) err(name, `${p}/derived/ages`, `tính lại ra ${JSON.stringify(want)}, vector ghi ${JSON.stringify(c.derived.ages)}`);
    } else if (suite === 'warmup-selection' && (c.input?.history ?? []).length > 0) {
      err(name, `${p}/derived`, 'case có history phải ghi derived.ages để người đọc kiểm');
    }

    if (suite === 'stars') {
      if (!tz) err(name, '/context/timezone', 'stars cần context.timezone để kiểm local_date');
      else (c.input?.attempts ?? []).forEach((a, j) => {
        if (a.completed_at) checkLocal(name, `${p}/input/attempts/${j}/local_date`, a.completed_at, tz, a.local_date);
      });
    }
    if (suite === 'warmup-selection') {
      if (!tz) err(name, '/context/timezone', 'warmup-selection cần context.timezone để kiểm last_completed_date');
      else (c.input?.history ?? []).forEach((h, j) => {
        checkLocal(name, `${p}/input/history/${j}/last_completed_date`, h.last_completed_at, tz, h.last_completed_date);
      });
    }
    if (suite === 'local-date' && c.input) {
      checkLocal(name, `${p}/expected`, c.input.completed_at, c.input.timezone, c.expected);
    }
  }));
}

// Thứ trong mô tả ("thứ Hai 02/11", "Chủ nhật 03/01/2027") phải đúng lịch.
const VI_WEEKDAY = { 'thứ hai': 'Mon', 'thứ ba': 'Tue', 'thứ tư': 'Wed', 'thứ năm': 'Thu', 'thứ sáu': 'Fri', 'thứ bảy': 'Sat', 'chủ nhật': 'Sun' };
const WEEKDAY_IN_TEXT = /(thứ Hai|thứ Ba|thứ Tư|thứ Năm|thứ Sáu|thứ Bảy|Chủ nhật)\s+(\d{1,2})\/(\d{1,2})(?:\/(\d{4}))?/giu;
let weekdayMentions = 0;
for (const [suite, data] of Object.entries(files)) {
  (data.cases ?? []).forEach((c, i) => {
    const dates = new Set(JSON.stringify([c.input, c.expected, c.derived ?? {}]).match(/\d{4}-\d{2}-\d{2}/g) ?? []);
    for (const m of (c.description ?? '').matchAll(WEEKDAY_IN_TEXT)) {
      const mmdd = `${m[3].padStart(2, '0')}-${m[2].padStart(2, '0')}`;
      const years = m[4] ? [m[4]] : [...new Set([...dates].filter((d) => d.endsWith(mmdd)).map((d) => d.slice(0, 4)))];
      if (years.length !== 1) {
        err(`${suite}.json`, `/cases/${i}/description`, `"${m[0]}": không suy ra được năm từ ngày trong case, ghi rõ năm`);
        continue;
      }
      weekdayMentions++;
      const date = `${years[0]}-${mmdd}`;
      const want = VI_WEEKDAY[m[1].toLowerCase()];
      if (!isValidDate(date) || calendarLabel(date).slice(0, 3) !== want) {
        err(`${suite}.json`, `/cases/${i}/description`, `"${m[0]}": ${date} là ${isValidDate(date) ? calendarLabel(date) : 'ngày không có thật'}`);
      }
    }
  });
}
step('Thứ và tuần ISO (derived.calendar)', `${calendarChecked} ngày`);
step('local_date (stars, warmup, local-date)', `${localChecked} thời điểm`);
step('Thứ nhắc trong mô tả', `${weekdayMentions} chỗ`);
step('Đối chiếu với lệnh date của hệ điều hành', osDate ? `${osChecked} lần gọi date (${osDate.kind})` : 'bỏ qua');

// ------------------------------------------------------------------ 6. item-scoring dùng đúng tên trường SK-001
const sk001Path = join(PKG, 'schema', 'quiz-item.schema.json');
let contractChecked = 0;
let hydratedChecked = 0;
if (!existsSync(sk001Path)) {
  err('item-scoring.json', '', `không thấy ${relative(PKG, sk001Path)} (SK-001) để đối chiếu tên trường`);
} else if (files['item-scoring']) {
  const qs = JSON.parse(readFileSync(sk001Path, 'utf8'));
  const defs = qs.$defs;
  const deref = (s) => {
    let node = s;
    while (node && node.$ref && node.$ref.startsWith('#/$defs/')) {
      const own = { ...node };
      delete own.$ref;
      const target = defs[node.$ref.slice('#/$defs/'.length)];
      // Gộp properties của def được $ref (QuizBase) với properties riêng.
      node = { ...target, ...own, properties: { ...(target.properties ?? {}), ...(own.properties ?? {}) } };
      if (target.$ref) node.$ref = target.$ref; else delete node.$ref;
    }
    return node;
  };
  const formatDef = {};
  for (const branch of defs.QuizItem.allOf) formatDef[branch.if.properties.format.const] = deref(branch.then);
  const missingFormats = SK001_FORMATS.filter((f) => !formatDef[f]);
  for (const f of missingFormats) err('item-scoring.json', '', `SK-001 không còn format ${f}`);

  const checkFields = (obj, schema, path, name) => {
    const props = schema.properties ?? {};
    for (const [k, v] of Object.entries(obj)) {
      contractChecked++;
      if (!(k in props)) { err(name, `${path}/${k}`, `trường "${k}" không có trong SK-001 (${relative(PKG, sk001Path)})`); continue; }
      const itemSchema = props[k].items;
      if (Array.isArray(v) && itemSchema?.$ref?.startsWith('#/$defs/')) {
        v.forEach((el, j) => { if (el && typeof el === 'object') checkFields(el, deref(itemSchema), `${path}/${k}/${j}`, name); });
      }
    }
  };
  const used = new Set();
  files['item-scoring'].cases.forEach((c, i) => {
    const item = c.input?.item;
    if (!item) return;
    used.add(item.format);
    const def = formatDef[item.format];
    if (!def) { err('item-scoring.json', `/cases/${i}/input/item/format`, `format ${item.format} không có trong SK-001`); return; }
    checkFields(item, def, `/cases/${i}/input/item`, 'item-scoring.json');
  });
  for (const f of SK001_FORMATS) if (!used.has(f)) err('item-scoring.json', '/cases', `chưa phủ format ${f} (SK-003: phủ đủ 6 format của v1)`);

  // Điền chữ giữ chỗ rồi validate cả câu bằng Ajv trên schema SK-001: item phải là một câu hợp lệ
  // (vd single_choice đúng 1 đáp án đúng, order_sequence 3–6 phần tử), chỉ tries mới được sai.
  if (Ajv2020) {
    const ajv = new Ajv2020({ allErrors: true, strict: true, strictTypes: false, strictRequired: false });
    const schemaDir = join(PKG, 'schema');
    for (const f of readdirSync(schemaDir).filter((x) => x.endsWith('.schema.json'))) {
      ajv.addSchema(JSON.parse(readFileSync(join(schemaDir, f), 'utf8')));
    }
    const validateQuiz = ajv.getSchema(qs.$id);
    const sp = (s) => ({ en: s, vi: s });
    const hydrate = (item, n) => {
      const base = {
        id: `00000000-0000-4000-8000-${String(n).padStart(12, '0')}`, key: 'q1', format: item.format, version: 1, dok: 1,
        prompt: sp('Prompt'), hint: sp('Hint'), explanation_correct: sp('Right'), explanation_wrong: sp('Not yet'),
      };
      const label = (o) => ({ ...o, label: sp(o.key) });
      switch (item.format) {
        case 'single_choice':
        case 'multi_choice':
          return { ...base, options: item.options.map(label) };
        case 'picture_bar_chart':
          return { ...base, chart: { bars: item.options.map((o, j) => ({ key: `bar_${o.key}`, label: sp(o.key), value: j + 1 })) }, options: item.options.map(label) };
        case 'true_false':
          return { ...base, answer: item.answer };
        case 'fill_blank_bank': {
          const blanks = item.answers.map((_, j) => `{${j + 1}}`).join(' and ');
          return { ...base, sentence: sp(`Food gives us ${blanks}.`), bank: item.bank.map(label), answers: item.answers };
        }
        case 'order_sequence':
          return { ...base, items: item.items.map(label), answer: item.answer };
        default:
          return { ...base, ...item };
      }
    };
    // Case có input sai hình dạng đã bị báo ở bước 2 và bước kiểm tên trường; không dựng câu từ đó.
    const badInput = new Set(mini(files['item-scoring']).map((e) => /^\/cases\/(\d+)\/input/.exec(e.path)?.[1]).filter(Boolean).map(Number));
    files['item-scoring'].cases.forEach((c, i) => safely('item-scoring.json', `/cases/${i}`, () => {
      if (!c.input?.item || badInput.has(i)) return;
      hydratedChecked++;
      const full = hydrate(c.input.item, i + 1);
      if (!validateQuiz(full)) {
        const msg = validateQuiz.errors.slice(0, 3).map((x) => `${x.instancePath || '/'} ${x.message}`).join('; ');
        err('item-scoring.json', `/cases/${i}/input/item`, `không phải câu SK-001 hợp lệ khi điền đủ chữ: ${msg}`);
      }
      // Luật kiểm chéo của SK-001 (refs) mà JSON Schema không diễn đạt được.
      const it = c.input.item;
      if (it.format === 'order_sequence') {
        const keys = it.items.map((x) => x.key).sort();
        if (!deepEqual([...it.answer].sort(), keys)) err('item-scoring.json', `/cases/${i}/input/item/answer`, 'answer phải là hoán vị của items (SK-001 quyết định 13)');
      }
      if (it.format === 'fill_blank_bank') {
        const bank = new Set(it.bank.map((x) => x.key));
        it.answers.forEach((a, j) => { if (!bank.has(a)) err('item-scoring.json', `/cases/${i}/input/item/answers/${j}`, `"${a}" không có trong bank`); });
      }
      const childKeys = [...(it.options ?? []), ...(it.bank ?? []), ...(it.items ?? [])].map((x) => x.key);
      if (new Set(childKeys).size !== childKeys.length) err('item-scoring.json', `/cases/${i}/input/item`, 'key con bị trùng (SK-001 quyết định 12)');
    }));
  }
}
step('item-scoring dùng tên trường SK-001', `${contractChecked} trường; 6/6 format`
  + (Ajv2020 ? `; ${hydratedChecked} item hợp lệ theo quiz-item.schema.json` : '; bỏ bước Ajv'));

// ------------------------------------------------------------------ 7. expected tự nhất quán (bất biến, không phải luật)
const effective = (data, c) => ({ ...data.default_rules, ...(c.rules ?? {}) });
let invariantCases = 0;
const INVARIANTS = {
  'item-scoring'(c, r, fail) {
    const e = c.expected;
    if ('error' in e) return;
    const n = c.input.tries.length;
    if (e.tries_used !== n) fail('/expected/tries_used', `phải bằng số phần tử của tries (${n})`);
    if (e.try_results.length !== e.tries_used) fail('/expected/try_results', 'độ dài phải bằng tries_used');
    if (e.final_correct !== e.try_results.at(-1)) fail('/expected/final_correct', 'phải bằng phần tử cuối của try_results');
    if (e.try_results.slice(0, -1).some(Boolean)) fail('/expected/try_results', 'đã đúng thì không còn lần thử sau (T1)');
    if (e.tries_used > r.max_tries) fail('/expected/tries_used', `vượt max_tries ${r.max_tries} mà không báo lỗi`);
    if (e.points === 1 && !e.try_results[0] && !(c.input.item.format === 'order_sequence' && r.partial_order_min != null)) {
      fail('/expected/points', 'lần thử 1 sai thì chỉ được điểm khi là order_sequence có partial_order_min (D1, D2)');
    }
  },
  'build-tray'(c, r, fail) {
    const b = c.input.block;
    const roles = Object.fromEntries(b.groups.map((g) => [g.key, g.role]));
    const gKeys = b.groups.map((g) => g.key);
    if (new Set(gKeys).size !== gKeys.length) fail('/input/block/groups', 'key nhóm bị trùng');
    const iKeys = b.items.map((i) => i.key);
    if (new Set(iKeys).size !== iKeys.length) fail('/input/block/items', 'key món bị trùng');
    for (const i of b.items) if (!(i.group in roles)) fail('/input/block/items', `món ${i.key} trỏ tới nhóm không có (${i.group})`);
    const required = b.groups.filter((g) => g.role === 'required').map((g) => g.key);
    if (b.capacity < required.length) fail('/input/block/capacity', 'capacity không nhỏ hơn số nhóm required (SK-001)');
    const e = c.expected;
    if ('error' in e) return;
    const kinds = new Map(b.items.map((i) => [i.key, i.group]));
    if (e.tray.length > b.capacity) fail('/expected/tray', 'vượt capacity');
    if (new Set(e.tray).size !== e.tray.length) fail('/expected/tray', 'món trùng trong mâm');
    if (e.tray.some((k) => !kinds.has(k))) fail('/expected/tray', 'có món không thuộc block');
    const present = new Set(e.tray.map((k) => kinds.get(k)));
    const missing = required.filter((k) => !present.has(k));
    if (!deepEqual(e.missing, missing)) fail('/expected/missing', `phải là các nhóm required chưa có theo thứ tự groups: ${JSON.stringify(missing)}`);
    const limited = b.groups.some((g) => g.role === 'limit' && present.has(g.key));
    if (e.has_limited !== limited) fail('/expected/has_limited', 'phải là true khi có món thuộc nhóm limit');
    if (e.success !== (missing.length === 0 && !limited)) fail('/expected/success', 'success = đủ nhóm required và không có nhóm limit (success_when)');
    if (e.full && c.input.taps.length === 0) fail('/expected/full', 'full chỉ bật bởi lần chạm bị từ chối, không có taps thì không full');
    if (e.message.startsWith('missing.')) {
      if (e.full || e.success || e.has_limited || e.tray.length === 0) fail('/expected/message', 'missing.* chỉ khi không full, không success, không đồ ngọt, mâm không rỗng');
      if (e.message !== `missing.${missing[0]}`) fail('/expected/message', `phải là missing.${missing[0]} (nhóm đầu của missing)`);
    }
    // T2 (Duy chốt 29/10): balanced > full > has_limited > start > missing. Cờ full có thể true cùng message balanced.
    if (e.success && e.message !== 'balanced') fail('/expected/message', 'success thì lời nhắn luôn là balanced, kể cả khi cờ full bật (T2)');
    if (e.message === 'balanced' && !e.success) fail('/expected/message', 'balanced cần success');
    if (e.message === 'has_limited' && (!e.has_limited || e.full)) fail('/expected/message', 'has_limited cần có đồ ngọt và không full');
    if (e.message === 'start' && e.tray.length !== 0) fail('/expected/message', 'start chỉ khi mâm rỗng');
    if (e.message === 'full' && (!e.full || e.success)) fail('/expected/message', 'full cần cờ full và chưa success (T2)');
    if (e.full && !e.success && e.message !== 'full') fail('/expected/message', 'full true mà chưa success thì lời nhắn là full (T2)');
  },
  'lesson-score'(c, r, fail) {
    const e = c.expected;
    if ('error' in e) return;
    if (e.correct > e.max) fail('/expected/correct', 'không được vượt max');
    if (e.correct > c.input.quiz_results.length) fail('/expected/correct', 'không được vượt số câu đã trả lời');
  },
  stars(c, r, fail) {
    const e = c.expected;
    const done = c.input.attempts.filter((a) => a.completed);
    const dates = new Set(done.map((a) => a.local_date));
    if ((e.stars === 0) !== (done.length === 0)) fail('/expected/stars', '0 sao khi và chỉ khi không có lần làm completed');
    if ((e.stars >= 2) !== (e.first_pass_date !== null)) fail('/expected/first_pass_date', 'có first_pass_date khi và chỉ khi ≥ ⭐⭐');
    if ((e.stars === 3) !== (e.mastered_date !== null)) fail('/expected/mastered_date', 'có mastered_date khi và chỉ khi ⭐⭐⭐');
    if (e.first_pass_date && !dates.has(e.first_pass_date)) fail('/expected/first_pass_date', 'phải là local_date của một lần làm completed');
    if (e.mastered_date && !dates.has(e.mastered_date)) fail('/expected/mastered_date', 'phải là local_date của một lần làm completed');
    if (e.mastered_date && dayDiff(e.first_pass_date, e.mastered_date) < r.mastery_gap_days) {
      fail('/expected/mastered_date', `cách first_pass_date chưa đủ mastery_gap_days ${r.mastery_gap_days}`);
    }
  },
  streak(c, r, fail) {
    const e = c.expected;
    const { today } = c.input;
    const studied = new Set(c.input.studied_dates);
    if ((e.studied_days === 0) !== (e.chain_start === null)) fail('/expected/chain_start', 'null khi và chỉ khi studied_days = 0');
    if (e.chain_start === null) {
      if (e.rest_days.length) fail('/expected/rest_days', 'chuỗi rỗng thì không có ngày nghỉ');
      return;
    }
    if (!studied.has(e.chain_start)) fail('/expected/chain_start', 'phải là một ngày có học');
    if (e.chain_start > today) fail('/expected/chain_start', 'không được sau today');
    const sorted = [...e.rest_days].sort();
    if (!deepEqual(sorted, e.rest_days)) fail('/expected/rest_days', 'phải sắp tăng dần');
    const perWeek = new Map();
    for (const d of e.rest_days) {
      if (studied.has(d)) fail('/expected/rest_days', `${d} là ngày có học`);
      if (!(d > e.chain_start && d < today)) fail('/expected/rest_days', `${d} phải nằm giữa chain_start và today`);
      perWeek.set(isoWeek(d), (perWeek.get(isoWeek(d)) ?? 0) + 1);
    }
    for (const [w, n] of perWeek) if (n > r.rest_days_per_week) fail('/expected/rest_days', `${n} ngày nghỉ trong ${w}, quá rest_days_per_week ${r.rest_days_per_week}`);
    let count = 0;
    const rest = new Set(e.rest_days);
    for (let d = e.chain_start; d <= today; d = addDays(d, 1)) {
      if (studied.has(d)) count++;
      else if (!rest.has(d) && d !== today) fail('/expected', `${d} trong chuỗi mà không học cũng không phải ngày nghỉ`);
    }
    if (count !== e.studied_days) fail('/expected/studied_days', `đếm ngày có học từ chain_start tới today ra ${count}`);
  },
  'local-date'() {},
  'warmup-selection'(c, r, fail) {
    const W = r.warmup;
    const items = c.expected.items;
    const cur = c.input.current_lesson;
    if (items.length > W.max) fail('/expected/items', `quá warmup.max ${W.max}`);
    if (new Set(items.map((x) => x.item_id)).size !== items.length) fail('/expected/items', 'item_id bị trùng');
    let lastSlot = -1;
    items.forEach((x, j) => {
      const p = `/expected/items/${j}`;
      const s = SLOT_ORDER.indexOf(x.slot);
      if (s < lastSlot) fail(`${p}/slot`, `thứ tự slot phải theo ${SLOT_ORDER.join(' → ')} (T6)`);
      lastSlot = Math.max(lastSlot, s);
      if (x.slot === 'prior_knowledge') {
        if (x.from !== cur.lesson_id) fail(`${p}/from`, 'câu prior_knowledge phải lấy từ bài đang học');
        const w = cur.warmup.find((y) => y.item_id === x.item_id);
        if (!w || w.recall_from.kind !== 'prior_knowledge') fail(`${p}/item_id`, 'không phải câu warmup prior_knowledge của bài đang học');
        return;
      }
      if (x.from === cur.lesson_id) fail(`${p}/from`, 'không được lấy câu từ bài đang học (D6)');
      const h = c.input.history.find((y) => y.lesson_id === x.from);
      if (!h) { fail(`${p}/from`, `${x.from} không có trong history`); return; }
      const it = h.items.find((y) => y.item_id === x.item_id);
      if (!it) fail(`${p}/item_id`, `${x.item_id} không thuộc bài ${x.from}`);
      else {
        if (it.slot !== 'quiz') fail(`${p}/item_id`, 'ứng viên phải là câu quiz (D6)');
        if (W.exclude_dok.includes(it.dok)) fail(`${p}/item_id`, `câu DOK ${it.dok} nằm trong exclude_dok`);
      }
      const age = dayDiff(h.last_completed_date, c.input.today);
      for (const [slot, win] of [['week', W.week], ['month', W.month]]) {
        if (x.slot === slot && !(age >= win.min && age <= win.max)) fail(`${p}/slot`, `age ${age} ngoài cửa sổ ${slot} [${win.min}, ${win.max}]`);
      }
    });
  },
};
for (const [suite, data] of Object.entries(files)) {
  (data.cases ?? []).forEach((c, i) => {
    if (!c.input || c.expected === undefined) return;
    invariantCases++;
    try {
      INVARIANTS[suite](c, effective(data, c), (ptr, msg) => err(`${suite}.json`, `/cases/${i}${ptr}`, `${c.id}: ${msg}`));
    } catch (e) {
      err(`${suite}.json`, `/cases/${i}`, `${c.id}: không kiểm được bất biến (${e.message})`);
    }
  });
}
step('expected tự nhất quán', `${invariantCases} case`);

// Block "A" của build-tray phải đúng bằng block build_tray thật của bài 1 (phần luật), để vector không trôi khỏi nội dung.
if (existsSync(FIXTURE_L1) && files['build-tray']) {
  const lesson = JSON.parse(readFileSync(FIXTURE_L1, 'utf8'));
  const tray = lesson.play?.type === 'build_tray' ? lesson.play : null;
  if (!tray) err('build-tray.json', '', 'không thấy block build_tray trong fixture bài 1 để đối chiếu');
  else {
    const want = { capacity: tray.capacity, groups: tray.groups.map((g) => ({ key: g.key, role: g.role })), items: tray.items.map((i) => ({ key: i.key, group: i.group })) };
    const blocks = files['build-tray'].cases.map((c) => c.input?.block).filter((b) => b && b.groups?.[0]?.key === want.groups[0].key);
    const bad = blocks.filter((b) => !deepEqual(b, want));
    if (bad.length || blocks.length === 0) err('build-tray.json', '/cases', `block bài 1 trong vector không khớp fixture (${blocks.length} case dùng, ${bad.length} lệch)`);
    else step('Block bài 1 khớp fixture', `${blocks.length} case; lời nhắn missing có đúng ${tray.groups.filter((g) => g.role === 'required').length} nhóm required`);
    const mk = Object.keys(tray.messages?.missing ?? {});
    if (!deepEqual([...mk].sort(), tray.groups.filter((g) => g.role === 'required').map((g) => g.key).sort())) err('build-tray.json', '', 'fixture: messages.missing không đủ đúng các nhóm required');
  }
} else if (files['build-tray']) warn('Không thấy fixture bài 1: bỏ bước đối chiếu block mâm cơm.');

// ------------------------------------------------------------------ 8. phủ "Nội dung phải có trong từng bộ"
const byId = new Map();
for (const [suite, data] of Object.entries(files)) for (const c of data.cases ?? []) byId.set(c.id, { suite, data, c });
const R = (id) => { const x = byId.get(id); return x ? effective(x.data, x.c) : {}; };
const I = (id) => byId.get(id)?.c.input ?? {};
const COVERAGE = [
  ['item-scoring', 'đúng ngay lần đầu', ['item-scoring-001']],
  ['item-scoring', 'sai rồi đúng', ['item-scoring-002']],
  ['item-scoring', 'sai hết số lần thử', ['item-scoring-003', 'item-scoring-007']],
  ['item-scoring', 'max_tries = 1', ['item-scoring-004', 'item-scoring-005'], (id) => R(id).max_tries === 1],
  ['item-scoring', 'max_tries = 3', ['item-scoring-006', 'item-scoring-007'], (id) => R(id).max_tries === 3],
  ['item-scoring', 'multi_choice chọn thiếu', ['item-scoring-010']],
  ['item-scoring', 'multi_choice chọn thừa', ['item-scoring-011']],
  ['item-scoring', 'multi_choice đúng tập, khác thứ tự (vẫn đúng)', ['item-scoring-012']],
  ['item-scoring', 'fill_blank_bank 2 ô, sai 1 ô', ['item-scoring-017'], (id) => I(id).item?.answers?.length === 2],
  ['item-scoring', 'order_sequence, partial_order_min = null', ['item-scoring-021'], (id) => R(id).partial_order_min === null],
  ['item-scoring', 'order_sequence, partial_order_min = 3', ['item-scoring-022', 'item-scoring-023', 'item-scoring-024'], (id) => R(id).partial_order_min === 3],
  ['item-scoring', 'vượt max_tries → too_many_tries', ['item-scoring-005', 'item-scoring-008'], (id) => byId.get(id)?.c.expected?.error === 'too_many_tries'],
  ['lesson-score', '6/6', ['lesson-score-001']],
  ['lesson-score', '0/6', ['lesson-score-002']],
  ['lesson-score', '5/6, có câu đúng ở lần thử 2', ['lesson-score-003']],
  ['lesson-score', 'khởi động sai hết, không ảnh hưởng điểm', ['lesson-score-004']],
  ['lesson-score', 'mới trả lời 5 câu → completed false', ['lesson-score-006'], (id) => byId.get(id)?.c.expected?.completed === false],
  ['stars', 'một lần làm điểm thấp → ⭐', ['stars-002']],
  ['stars', 'đạt trong ngày → ⭐⭐', ['stars-003']],
  ['stars', 'đạt lại cùng ngày → vẫn ⭐⭐', ['stars-005']],
  ['stars', 'đạt lại ngày hôm sau → ⭐⭐⭐', ['stars-006']],
  ['stars', 'trượt rồi mới đạt', ['stars-007', 'stars-008']],
  ['stars', 'sao không giảm khi lần sau điểm thấp', ['stars-009', 'stars-010']],
  ['stars', 'mastery_gap_days = 2', ['stars-011', 'stars-012', 'stars-013'], (id) => R(id).mastery_gap_days === 2],
  ['stars', 'cùng lịch sử, khác kết quả giữa 4/6 và 5/6 (≥ 3 cặp)', ['stars-020', 'stars-021', 'stars-022', 'stars-023', 'stars-024', 'stars-025']],
  ['stars', 'cách < 24 giờ nhưng khác local_date → cách 1 ngày', ['stars-015']],
  ['streak', 'học liền nhiều ngày', ['streak-001']],
  ['streak', 'nghỉ 1 ngày trong tuần', ['streak-002']],
  ['streak', 'nghỉ 2 ngày cùng tuần ISO → đứt', ['streak-003']],
  ['streak', 'nghỉ Chủ nhật rồi thứ Hai (2 tuần ISO) → không đứt', ['streak-004']],
  ['streak', 'hôm nay chưa học', ['streak-005', 'streak-006', 'streak-012']],
  ['streak', 'chỉ học hôm nay', ['streak-008']],
  ['streak', 'ngày nghỉ ở đầu chuỗi bị bỏ', ['streak-009']],
  ['streak', 'rest_days_per_week = 0', ['streak-011', 'streak-012'], (id) => R(id).rest_days_per_week === 0],
  ['streak', 'rest_days_per_week = 2', ['streak-013', 'streak-014'], (id) => R(id).rest_days_per_week === 2],
  ['streak', 'qua tuần 53 (2026-W53 → 2027-W01)', ['streak-015', 'streak-016'],
    (id) => Object.values(byId.get(id)?.c.derived?.calendar ?? {}).some((v) => v.endsWith('2026-W53'))],
  ['streak', 'chưa học ngày nào → 0, null', ['streak-017'], (id) => (I(id).studied_dates ?? [1]).length === 0],
  ['local-date', 'Asia/Ho_Chi_Minh 16:59:59Z → 02/11, 17:00:00Z → 03/11', ['local-date-001', 'local-date-002'],
    (id) => ['2026-11-02T16:59:59Z', '2026-11-02T17:00:00Z'].includes(I(id).completed_at)],
  ['local-date', 'Europe/London ngày đổi giờ 28/3/2027', ['local-date-003', 'local-date-004', 'local-date-005'], (id) => I(id).timezone === 'Europe/London'],
  ['local-date', 'America/Los_Angeles', ['local-date-006', 'local-date-007', 'local-date-008'], (id) => I(id).timezone === 'America/Los_Angeles'],
  ['local-date', 'qua giao thừa', ['local-date-009', 'local-date-010', 'local-date-011']],
  ['warmup-selection', 'chưa có lịch sử, có câu prior_knowledge', ['warmup-selection-001'], (id) => (I(id).history ?? [1]).length === 0],
  ['warmup-selection', 'chưa có lịch sử, không có câu soạn sẵn → rỗng', ['warmup-selection-002'], (id) => byId.get(id)?.c.expected?.items?.length === 0],
  ['warmup-selection', 'chỉ có bài gần nhất', ['warmup-selection-005', 'warmup-selection-006']],
  ['warmup-selection', 'bài gần nhất + bài ở cửa sổ tuần', ['warmup-selection-007']],
  ['warmup-selection', 'đủ cả 3 khe', ['warmup-selection-008'], (id) => byId.get(id)?.c.expected?.items?.length === 3],
  ['warmup-selection', 'biên cửa sổ 5, 10, 21, 45 và 4, 46 ngày', ['warmup-selection-009', 'warmup-selection-011', 'warmup-selection-012', 'warmup-selection-013', 'warmup-selection-010', 'warmup-selection-014']],
  ['warmup-selection', 'hai bài cách đều target', ['warmup-selection-015', 'warmup-selection-016']],
  ['warmup-selection', 'loại câu DOK 3', ['warmup-selection-017']],
  ['warmup-selection', 'ưu tiên câu lần trước làm sai', ['warmup-selection-019']],
  ['warmup-selection', 'chỉ có đúng 1 bài trong lịch sử', ['warmup-selection-005', 'warmup-selection-027'], (id) => (I(id).history ?? []).length === 1],
  ['build-tray', 'mâm trống → start', ['build-tray-001'], (id) => byId.get(id)?.c.expected?.message === 'start'],
  ['build-tray', 'mâm hợp lệ → balanced, success', ['build-tray-003', 'build-tray-005'], (id) => byId.get(id)?.c.expected?.success === true],
  ['build-tray', 'thiếu từng nhóm bắt buộc: carb, protein, veg', ['build-tray-006', 'build-tray-007', 'build-tray-008'],
    (id) => /^missing\./.test(byId.get(id)?.c.expected?.message) && byId.get(id).c.expected.missing.length === 1],
  ['build-tray', 'đủ 7 lời nhắn (start, full, balanced, has_limited, 3 missing)', ['build-tray-001', 'build-tray-019', 'build-tray-003', 'build-tray-013', 'build-tray-006', 'build-tray-007', 'build-tray-008']],
  ['build-tray', 'quá capacity → full, mâm giữ nguyên', ['build-tray-018', 'build-tray-019'], (id) => byId.get(id)?.c.expected?.full === true],
  ['build-tray', 'món trùng (hai món cùng nhóm; mâm có món trùng → lỗi)', ['build-tray-011', 'build-tray-032']],
  ['build-tray', 'món không thuộc block → unknown_item', ['build-tray-029', 'build-tray-030', 'build-tray-031'], (id) => byId.get(id)?.c.expected?.error === 'unknown_item'],
  ['build-tray', 'mâm đầy + success + vừa bị từ chối → balanced, cờ full true (T2 mới)', ['build-tray-018', 'build-tray-027', 'build-tray-037'],
    (id) => byId.get(id)?.c.expected?.full === true && byId.get(id).c.expected.message === 'balanced'],
  ['build-tray', 'mâm đầy + chưa đạt + vừa bị từ chối → full (thắng has_limited, missing)', ['build-tray-019', 'build-tray-038'],
    (id) => byId.get(id)?.c.expected?.full === true && byId.get(id).c.expected.message === 'full'],
  ['build-tray', 'thứ tự missing theo groups: ít nhất 2 block tự đặt có thứ tự khác canvas, mỗi cái trả nhóm đầu khác nhau', ['build-tray-017', 'build-tray-034', 'build-tray-035'],
    (id) => { // thứ tự canvas: đạm → rau quả → bột đường; case phải cho đáp án khác đáp án khoá canvas
      const { input: i, expected: e } = byId.get(id).c;
      const rank = (k) => ['protein', 'veg', 'carb'].findIndex((n) => k.endsWith(n));
      const byCanvas = [...e.missing].sort((a, b) => rank(a) - rank(b))[0];
      return i.block.groups[0].key !== 'tray_protein' && e.message.startsWith('missing.') && e.message !== `missing.${byCanvas}`;
    }],
  ['build-tray', 'đồ ngọt (limit) làm success false', ['build-tray-013'], (id) => byId.get(id)?.c.expected?.success === false],
  ['build-tray', 'nhóm neutral không ảnh hưởng', ['build-tray-015', 'build-tray-016']],
];
let covered = 0;
for (const [suite, need, ids, pred] of COVERAGE) {
  const holds = (id) => { try { return pred(id); } catch { return false; } };
  const bad = ids.filter((id) => !byId.has(id) || byId.get(id).suite !== suite || (pred && !holds(id)));
  if (bad.length) err(`${suite}.json`, '', `tình huống bắt buộc "${need}": case ${bad.join(', ')} không có hoặc không đúng điều kiện`);
  else covered++;
}
// Biên cửa sổ: tập age của các case biên phải đúng là {4, 5, 10, 21, 45, 46}.
const edgeAges = new Set(['009', '010', '011', '012', '013', '014'].flatMap((n) => Object.values(byId.get(`warmup-selection-${n}`)?.c.derived?.ages ?? {})));
for (const a of [4, 5, 10, 21, 45, 46]) if (!edgeAges.has(a)) err('warmup-selection.json', '', `thiếu case biên với age ${a}`);
// ≥ 3 cặp stars cùng input, khác kết quả, một bên 4/6 một bên 5/6.
const pairs = [];
const starCases = files.stars?.cases ?? [];
for (let a = 0; a < starCases.length; a++) for (let b = a + 1; b < starCases.length; b++) {
  const x = starCases[a];
  const y = starCases[b];
  const tx = effective(files.stars, x).pass_threshold ?? {};
  const ty = effective(files.stars, y).pass_threshold ?? {};
  const four = (t) => t.num * 6 === 4 * t.den;
  const five = (t) => t.num * 6 === 5 * t.den;
  if (deepEqual(x.input, y.input) && ((four(tx) && five(ty)) || (five(tx) && four(ty))) && !deepEqual(x.expected, y.expected)) pairs.push(`${x.id}/${y.id}`);
}
if (pairs.length < 3) err('stars.json', '/cases', `cần ≥ 3 cặp cùng lịch sử khác kết quả giữa 4/6 và 5/6, đang có ${pairs.length}`);
step('Tình huống bắt buộc của ticket', `${covered}/${COVERAGE.length}; cặp 4/6↔5/6: ${pairs.length} (${pairs.join(', ')})`);

if (SHOW_COVERAGE) {
  console.log('Tình huống bắt buộc (SK-003 "Nội dung phải có trong từng bộ") → case:');
  for (const [suite, need, ids] of COVERAGE) console.log(`  ${suite.padEnd(17)} ${need.padEnd(56)} ${ids.join(', ')}`);
  console.log('');
}

// ------------------------------------------------------------------ kết quả
console.log('check-vectors (SK-003)');
for (const s of steps) console.log(s);
for (const w of warnings) console.log(`  ! ${w}`);
if (errors.length) {
  console.log(`\nLỖI: ${errors.length}`);
  for (const e of errors) console.log(`  ${e}`);
  process.exit(1);
}
const total = Object.values(files).reduce((n, d) => n + (d.cases?.length ?? 0), 0);
console.log(`\nOK: ${Object.keys(files).length} file vector, ${total} case, không có lỗi hình dạng hay nhất quán`);
