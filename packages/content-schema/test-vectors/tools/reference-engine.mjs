// Bản cài tham chiếu (oracle) của luật chấm v1, chỉ để tester chạy thử vector.
// KHÔNG phải engine sản phẩm: engine thật viết bằng Swift/Kotlin/SQL ở sprint 1–2 và phải qua
// cùng bộ vector này. Nếu vector và file này lệch nhau thì một trong hai sai — sửa theo luật
// trong SK-003 (D1–D6, T1–T6 của SK-003; T1–T4 của SK-012 cho build_tray), không sửa vector cho khớp code.

import { addDays, dayDiff, isoWeek, localDate as tzLocalDate } from './calendar.mjs';

const QUIZ_LENGTH = 6; // B4.4: score = số câu đúng / 6; SK-001: quiz đúng 6 câu.

// ---------------------------------------------------------------- score_item
const INVALID = Symbol('invalid');

function judgeTry(item, t) {
  switch (item.format) {
    case 'single_choice':
    case 'picture_bar_chart': {
      if (typeof t.selected !== 'string') return INVALID;
      const opt = item.options.find((o) => o.key === t.selected);
      if (!opt) return INVALID;
      return { correct: opt.correct };
    }
    case 'multi_choice': {
      if (!Array.isArray(t.selected)) return INVALID;
      const keys = new Set(item.options.map((o) => o.key));
      if (new Set(t.selected).size !== t.selected.length) return INVALID; // T3: chọn trùng
      if (!t.selected.every((k) => keys.has(k))) return INVALID;
      const want = new Set(item.options.filter((o) => o.correct).map((o) => o.key));
      const got = new Set(t.selected);
      return { correct: got.size === want.size && [...got].every((k) => want.has(k)) };
    }
    case 'true_false': {
      if (typeof t.value !== 'boolean') return INVALID;
      return { correct: t.value === item.answer };
    }
    case 'fill_blank_bank': {
      if (!Array.isArray(t.filled) || t.filled.length !== item.answers.length) return INVALID;
      const bank = new Set(item.bank.map((b) => b.key));
      if (!t.filled.every((k) => bank.has(k))) return INVALID;
      return { correct: t.filled.every((k, i) => k === item.answers[i]) };
    }
    case 'order_sequence': {
      if (!Array.isArray(t.order)) return INVALID;
      const keys = item.items.map((i) => i.key);
      const isPermutation = t.order.length === keys.length
        && new Set(t.order).size === keys.length
        && t.order.every((k) => keys.includes(k));
      if (!isPermutation) return INVALID;
      const inPlace = t.order.filter((k, i) => k === item.answer[i]).length;
      return { correct: inPlace === keys.length, inPlace };
    }
    default:
      throw new Error(`format chưa hỗ trợ: ${item.format}`);
  }
}

export function scoreItem(item, tries, rules) {
  if (tries.length === 0) return { error: 'no_tries' }; // T2
  if (tries.length > rules.max_tries) return { error: 'too_many_tries' }; // D1
  const judged = [];
  for (let i = 0; i < tries.length; i++) {
    const j = judgeTry(item, tries[i]);
    if (j === INVALID) return { error: 'invalid_answer' }; // T3
    if (i > 0 && judged[i - 1].correct) return { error: 'try_after_correct' }; // T1
    judged.push(j);
  }
  const first = judged[0];
  let points = first.correct ? 1 : 0; // D1: chỉ lần thử 1 có điểm
  const k = rules.partial_order_min;
  if (!points && item.format === 'order_sequence' && k != null && first.inPlace >= k) points = 1; // D2
  return {
    points,
    try_results: judged.map((j) => j.correct),
    final_correct: judged[judged.length - 1].correct,
    tries_used: judged.length,
  };
}

// ---------------------------------------------------------------- score_lesson
export function scoreLesson(quizResults, _warmupResults) {
  const ids = new Set(quizResults.map((r) => r.item_id));
  if (ids.size !== quizResults.length || quizResults.length > QUIZ_LENGTH) return { error: 'invalid_results' }; // T5
  return {
    correct: quizResults.reduce((s, r) => s + r.points, 0),
    max: QUIZ_LENGTH,
    completed: quizResults.length === QUIZ_LENGTH, // T4: khởi động không ảnh hưởng
  };
}

// ---------------------------------------------------------------- compute_stars
export function computeStars(attempts, rules) {
  const { num, den } = rules.pass_threshold;
  const passes = (a) => a.correct * den >= num * a.max; // D3: so nguyên
  const done = attempts
    .filter((a) => a.completed)
    .sort((a, b) => Date.parse(a.completed_at) - Date.parse(b.completed_at));
  if (done.length === 0) return { stars: 0, first_pass_date: null, mastered_date: null };
  const firstIdx = done.findIndex(passes);
  if (firstIdx < 0) return { stars: 1, first_pass_date: null, mastered_date: null };
  const firstDate = done[firstIdx].local_date;
  const mastered = done
    .slice(firstIdx + 1)
    .find((a) => passes(a) && dayDiff(firstDate, a.local_date) >= rules.mastery_gap_days); // D4: ngày lịch
  return {
    stars: mastered ? 3 : 2,
    first_pass_date: firstDate,
    mastered_date: mastered ? mastered.local_date : null,
  };
}

// ---------------------------------------------------------------- compute_streak
export function computeStreak(studiedDates, today, rules) {
  const studied = new Set(studiedDates.filter((d) => d <= today));
  const earliest = [...studied].sort()[0];
  let studiedDays = 0;
  let chainStart = null;
  const rest = [];
  const usedPerWeek = new Map();
  if (studied.has(today)) { studiedDays = 1; chainStart = today; } // D5: hôm nay chưa học thì bỏ qua
  for (let d = addDays(today, -1); earliest && d >= earliest; d = addDays(d, -1)) {
    if (studied.has(d)) { studiedDays++; chainStart = d; continue; }
    const week = isoWeek(d);
    const used = usedPerWeek.get(week) ?? 0;
    if (used >= rules.rest_days_per_week) break; // hết phần nghỉ của tuần ISO → đứt
    usedPerWeek.set(week, used + 1);
    rest.push(d);
  }
  const restDays = chainStart ? rest.filter((d) => d > chainStart).sort() : []; // bỏ ngày nghỉ trước ngày học đầu
  return { studied_days: studiedDays, chain_start: chainStart, rest_days: restDays };
}

// ---------------------------------------------------------------- local_date
export function localDate(completedAt, timezone) {
  return tzLocalDate(completedAt, timezone);
}

// ---------------------------------------------------------------- select_warmup
export function selectWarmup(history, currentLesson, today, rules) {
  const W = rules.warmup;
  const rank = (items) => items
    .filter((it) => it.slot === 'quiz' && !W.exclude_dok.includes(it.dok))
    .sort((a, b) => Number(a.last_correct) - Number(b.last_correct) || a.order - b.order);
  const lessons = history
    .filter((h) => h.lesson_id !== currentLesson.lesson_id)
    .map((h) => ({ ...h, age: dayDiff(h.last_completed_date, today), ranked: rank(h.items) }))
    .filter((h) => h.ranked.length > 0);
  const byRecency = [...lessons].sort((a, b) => a.age - b.age
    || Date.parse(b.last_completed_at) - Date.parse(a.last_completed_at));

  const out = [];
  const used = new Set();
  const take = (lesson, slot, index = 0) => {
    out.push({ item_id: lesson.ranked[index].item_id, from: lesson.lesson_id, slot });
    used.add(lesson.lesson_id);
  };

  const recent = byRecency[0];
  if (recent) take(recent, 'recent');
  for (const [slot, win] of [['week', W.week], ['month', W.month]]) {
    const pick = lessons
      .filter((l) => !used.has(l.lesson_id) && l.age >= win.min && l.age <= win.max)
      .sort((a, b) => Math.abs(a.age - win.target) - Math.abs(b.age - win.target)
        || b.age - a.age // cách đều target → bài cũ hơn
        || Date.parse(a.last_completed_at) - Date.parse(b.last_completed_at))[0];
    if (pick) take(pick, slot);
  }
  while (out.length < W.min) { // lấp bằng bài kế tiếp có age nhỏ nhất
    const next = byRecency.find((l) => !used.has(l.lesson_id));
    if (!next) break;
    take(next, 'fill');
  }
  if (out.length < W.min && recent && recent.ranked.length > 1) take(recent, 'recent_second', 1);
  const prior = currentLesson.warmup
    .filter((w) => w.recall_from.kind === 'prior_knowledge')
    .sort((a, b) => a.order - b.order);
  for (const w of prior) {
    if (out.length >= W.min) break; // T6: mỗi bước dự phòng chỉ lấp tới min
    out.push({ item_id: w.item_id, from: currentLesson.lesson_id, slot: 'prior_knowledge' });
  }
  return { items: out.slice(0, W.max) };
}

// ---------------------------------------------------------------- build_tray (SK-012)
// Chạy lần lượt từng lần chạm trên mâm. full là cờ tạm: bật khi chạm món chưa có lúc mâm đã đủ capacity,
// tắt ở lần chạm kế tiếp làm đổi mâm (T1). Ưu tiên lời nhắn: balanced > full > has_limited > start > missing (T2, Duy chốt 29/10:
// mâm đạt thì "Tuyệt!" thắng, cờ full vẫn true). Thứ tự xét missing theo groups của block, không khoá theo canvas (T3). Dữ liệu hỏng trả lỗi, không đoán (T4).
export function buildTray(block, tray, taps) {
  const groupOf = new Map(block.items.map((i) => [i.key, i.group]));
  if ([...tray, ...taps].some((k) => !groupOf.has(k))) return { error: 'unknown_item' };
  if (new Set(tray).size !== tray.length || tray.length > block.capacity) return { error: 'invalid_tray' };
  let cur = [...tray];
  let full = false;
  for (const k of taps) {
    if (cur.includes(k)) { cur = cur.filter((x) => x !== k); full = false; }
    else if (cur.length >= block.capacity) full = true;
    else { cur.push(k); full = false; }
  }
  const present = new Set(cur.map((k) => groupOf.get(k)));
  const missing = block.groups.filter((g) => g.role === 'required' && !present.has(g.key)).map((g) => g.key);
  const hasLimited = block.groups.some((g) => g.role === 'limit' && present.has(g.key));
  const success = missing.length === 0 && !hasLimited;
  let message;
  if (success) message = 'balanced';
  else if (full) message = 'full';
  else if (hasLimited) message = 'has_limited';
  else if (cur.length === 0) message = 'start';
  else message = `missing.${missing[0]}`;
  return { tray: cur, full, missing, has_limited: hasLimited, success, message };
}

// ---------------------------------------------------------------- bảng gọi theo suite
export const SUITES = {
  'item-scoring': (input, rules) => scoreItem(input.item, input.tries, rules),
  'lesson-score': (input) => scoreLesson(input.quiz_results, input.warmup_results),
  stars: (input, rules) => computeStars(input.attempts, rules),
  streak: (input, rules) => computeStreak(input.studied_dates, input.today, rules),
  'local-date': (input) => localDate(input.completed_at, input.timezone),
  'warmup-selection': (input, rules) => selectWarmup(input.history, input.current_lesson, input.today, rules),
  'build-tray': (input) => buildTray(input.block, input.tray, input.taps),
};
