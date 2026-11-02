// Hàm ngày dùng chung cho check-vectors.mjs và reference-engine.mjs.
// Ngày là chuỗi "YYYY-MM-DD" (ngày lịch, không có giờ); tính trên UTC để không dính múi giờ của máy chạy.

const DAY_MS = 86_400_000;
const WEEKDAYS = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

export function parseDate(s) {
  const m = /^(\d{4})-(\d{2})-(\d{2})$/.exec(s);
  if (!m) throw new Error(`không phải ngày YYYY-MM-DD: ${s}`);
  const t = Date.UTC(+m[1], +m[2] - 1, +m[3]);
  return new Date(t);
}

export function formatDate(d) {
  return d.toISOString().slice(0, 10);
}

export function isValidDate(s) {
  try {
    return formatDate(parseDate(s)) === s;
  } catch {
    return false;
  }
}

export function addDays(s, n) {
  return formatDate(new Date(parseDate(s).getTime() + n * DAY_MS));
}

/** Số ngày lịch từ a tới b (b − a). */
export function dayDiff(a, b) {
  return Math.round((parseDate(b).getTime() - parseDate(a).getTime()) / DAY_MS);
}

export function weekdayName(s) {
  return WEEKDAYS[parseDate(s).getUTCDay()];
}

/** Tuần ISO 8601 dạng "2026-W53": tuần bắt đầu thứ Hai, tuần 1 là tuần chứa thứ Năm đầu tiên của năm. */
export function isoWeek(s) {
  const d = parseDate(s);
  const isoDay = (d.getUTCDay() + 6) % 7; // thứ Hai = 0
  const thursday = new Date(d.getTime() + (3 - isoDay) * DAY_MS);
  const isoYear = thursday.getUTCFullYear();
  const jan1 = Date.UTC(isoYear, 0, 1);
  const week = Math.floor((thursday.getTime() - jan1) / DAY_MS / 7) + 1;
  return `${isoYear}-W${String(week).padStart(2, '0')}`;
}

/** "Mon 2026-W45" — cùng định dạng với `date "+%a %G-W%V"`. */
export function calendarLabel(s) {
  return `${weekdayName(s)} ${isoWeek(s)}`;
}

/** local_date theo múi giờ IANA, dùng ICU của Node (Intl). */
export function localDate(timestamp, timeZone) {
  const t = Date.parse(timestamp);
  if (Number.isNaN(t)) throw new Error(`thời điểm không hợp lệ: ${timestamp}`);
  const parts = new Intl.DateTimeFormat('en-CA', {
    timeZone, year: 'numeric', month: '2-digit', day: '2-digit',
  }).formatToParts(new Date(t));
  const get = (type) => parts.find((p) => p.type === type).value;
  return `${get('year')}-${get('month')}-${get('day')}`;
}
