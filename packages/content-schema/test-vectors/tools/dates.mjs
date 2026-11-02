#!/usr/bin/env node
// Tính ngày cho người viết vector, để không tính nhẩm. In kết quả của Node và của lệnh `date` cạnh nhau.
//
//   node test-vectors/tools/dates.mjs 2027-01-03 2027-01-04          → thứ + tuần ISO
//   node test-vectors/tools/dates.mjs 2026-11-01 +30                  → ngày cộng/trừ n ngày
//   node test-vectors/tools/dates.mjs age 2026-10-17 2026-12-01       → số ngày lịch (age)
//   node test-vectors/tools/dates.mjs 2027-03-28T23:00:00Z Europe/London → local_date
//
// check-vectors.mjs tính lại mọi giá trị này khi kiểm, nên giá trị chép sai vẫn bị bắt.

import { spawnSync } from 'node:child_process';
import { addDays, calendarLabel, dayDiff, isValidDate, localDate } from './calendar.mjs';

const date = (argv, env = {}) => {
  const r = spawnSync('date', argv, { encoding: 'utf8', env: { ...process.env, LC_ALL: 'C', ...env } });
  return r.status === 0 ? r.stdout.trim() : null;
};
const bsd = date(['-j', '-f', '%Y-%m-%d', '2026-12-31', '+%a %G-W%V']) === 'Thu 2026-W53';
const osLabel = (d) => (bsd ? date(['-j', '-f', '%Y-%m-%d', d, '+%a %G-W%V']) : date(['-d', d, '+%a %G-W%V']));
const osLocal = (ts, tz) => {
  const epoch = String(Math.floor(Date.parse(ts) / 1000));
  return bsd ? date(['-r', epoch, '+%Y-%m-%d'], { TZ: tz }) : date(['-d', `@${epoch}`, '+%Y-%m-%d'], { TZ: tz });
};

const a = process.argv.slice(2);
if (a.length === 0) {
  console.error('Dùng: dates.mjs <YYYY-MM-DD>... | <YYYY-MM-DD> <±n> | age <từ> <tới> | <ISO-Z> <IANA tz>');
  process.exit(2);
}
if (a[0] === 'age' && a.length === 3) {
  console.log(`age(${a[1]} → ${a[2]}) = ${dayDiff(a[1], a[2])}`);
} else if (a.length === 2 && /^[+-]\d+$/.test(a[1]) && isValidDate(a[0])) {
  const d = addDays(a[0], Number(a[1]));
  console.log(`${a[0]} ${a[1]} = ${d}  node: ${calendarLabel(d)}  date: ${osLabel(d)}`);
} else if (a.length === 2 && a[0].includes('T')) {
  console.log(`local_date(${a[0]}, ${a[1]})  node: ${localDate(a[0], a[1])}  date: ${osLocal(a[0], a[1])}`);
} else {
  for (const d of a) {
    if (!isValidDate(d)) { console.log(`${d}  không phải ngày có thật`); continue; }
    console.log(`${d}  node: ${calendarLabel(d)}  date: ${osLabel(d)}`);
  }
}
