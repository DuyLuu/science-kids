// English text normalisation before TTS (technical-plan B9). Kokoro has no SSML and reads
// digits, symbols and abbreviations badly, so every Spoken `en` string goes through here; the
// result is both what gets hashed (cache key) and what Kokoro reads. Pure, no I/O.
import { cardinal, decade, decimal, fraction, MAX_CARDINAL, ordinal, year } from "./numbers-en.ts";

export type NormalizeWarning = { code: string; message: string };
export type Normalized = { text: string; warnings: NormalizeWarning[] };

/**
 * A fill_blank_bank blank `{1}`, `{2}`… is read as a pause, never as "one". It becomes this
 * marker; the synthesiser splits the sentence at it (see tts/utterance.ts).
 */
export const BLANK = "…";

const YEAR_CUES = "in|since|from|until|till|by|before|after|around|during|circa|year";

const UNITS: Record<string, [string, string]> = {
  kg: ["kilogram", "kilograms"],
  g: ["gram", "grams"],
  mg: ["milligram", "milligrams"],
  km: ["kilometre", "kilometres"],
  m: ["metre", "metres"],
  cm: ["centimetre", "centimetres"],
  mm: ["millimetre", "millimetres"],
  l: ["litre", "litres"],
  ml: ["millilitre", "millilitres"],
  "°C": ["degree Celsius", "degrees Celsius"],
  "°F": ["degree Fahrenheit", "degrees Fahrenheit"],
  "%": ["percent", "percent"],
};

/** Abbreviations read in full. Case-sensitive, matched as whole tokens. */
const ABBREVIATIONS: [RegExp, string][] = [
  [/\be\.g\.(?=[\s,;:!?)]|$)/g, "for example"],
  [/\bi\.e\.(?=[\s,;:!?)]|$)/g, "that is"],
  [/\betc\.(?=[\s,;:!?)]|$)/g, "et cetera"],
  [/\bvs\.?(?=\s)/g, "versus"],
  [/\bapprox\.(?=\s)/g, "approximately"],
  [/\bMr\.(?=\s)/g, "Mister"],
  [/\bMrs\.(?=\s)/g, "Missus"],
  [/\bDr\.(?=\s)/g, "Doctor"],
  [/\bNo\.(?=\s?\d)/g, "number"],
];

/** Symbols read as words. `/` is only handled inside a fraction; anywhere else it is a warning. */
const SYMBOLS: [RegExp, string][] = [
  [/\s*&\s*/g, " and "],
  [/(?<=\d)\s*\+\s*(?=\d)/g, " plus "],
  [/(?<=\d)\s*[×x]\s*(?=\d)/g, " times "],
  [/(?<=\d)\s*÷\s*(?=\d)/g, " divided by "],
  [/\s*=\s*/g, " equals "],
  [/°(?![CF])/g, " degrees"],
];

const NUMBER = String.raw`\d{1,3}(?:,\d{3})+|\d+`;
const UNIT_NAMES = Object.keys(UNITS)
  .sort((a, b) => b.length - a.length)
  .map((unit) => unit.replace(/[%°]/g, (c) => `\\${c}`))
  .join("|");

function toInt(digits: string): number {
  return Number(digits.replace(/,/g, ""));
}

function readInteger(digits: string, warn: (code: string, message: string) => void): string {
  const value = toInt(digits);
  if (!Number.isSafeInteger(value) || value > MAX_CARDINAL) {
    warn("number_too_large", `số ${digits} quá lớn, chưa đọc thành chữ`);
    return digits;
  }
  // "007": read digit by digit, a cardinal would drop the zeros.
  if (/^0\d/.test(digits)) return [...digits].map((d) => cardinal(Number(d))).join(" ");
  return cardinal(value);
}

export function normalizeEn(input: string): Normalized {
  const warnings: NormalizeWarning[] = [];
  const warn = (code: string, message: string) => {
    if (!warnings.some((w) => w.code === code && w.message === message)) warnings.push({ code, message });
  };
  let text = input.normalize("NFC").replace(/[   \t\r\n]/g, " ");

  // 1. Blanks of fill_blank_bank, and "..." as the same pause marker.
  text = text.replace(/\{\s*\d+\s*\}/g, ` ${BLANK} `).replace(/\.{3}/g, BLANK);

  // 2. Abbreviations and symbols.
  for (const [pattern, words] of ABBREVIATIONS) text = text.replace(pattern, words);
  for (const [pattern, words] of SYMBOLS) text = text.replace(pattern, words);

  // 3. Numbers, most specific first.
  // Times 7:30 -> "seven thirty", 7:00 -> "seven o'clock", 7:05 -> "seven oh five".
  text = text.replace(/\b([01]?\d|2[0-3]):([0-5]\d)\b/g, (_, h: string, m: string) => {
    const hour = cardinal(Number(h));
    const minute = Number(m);
    if (minute === 0) return `${hour} o'clock`;
    return minute < 10 ? `${hour} oh ${cardinal(minute)}` : `${hour} ${cardinal(minute)}`;
  });
  // Ordinals 1st, 22nd, 3rd, 4th.
  text = text.replace(new RegExp(String.raw`(?<![\w.,])(${NUMBER})(st|nd|rd|th)\b`, "g"), (_, digits: string) => ordinal(toInt(digits)));
  // Decades 1990s.
  text = text.replace(/(?<![\w.,])(1[0-9]|20)(\d0)s\b/g, (_, century: string, rest: string) => decade(Number(century + rest)));
  // Years after a cue word, and before BC/AD.
  text = text.replace(new RegExp(String.raw`\b(${YEAR_CUES})(\s+)(\d{4})\b(?![.,]\d)`, "gi"), (match, cue: string, space: string, digits: string) => {
    const value = Number(digits);
    return value >= 1000 && value <= 2099 ? `${cue}${space}${year(value)}` : match;
  });
  text = text.replace(/(?<![\w.,])(\d{1,4})\s?(BCE|BC|CE|AD)\b/g, (_, digits: string, era: string) => `${year(Number(digits))} ${[...era].join(" ")}`);
  // Fractions 1/2, 3/4.
  text = text.replace(/(?<![\w./])(\d+)\/(\d+)(?![\w/])/g, (match, a: string, b: string) => {
    const denominator = Number(b);
    return denominator > 1 && denominator <= 100 ? fraction(Number(a), denominator) : match;
  });
  // Ranges 5-7, 5–7 -> "5 to 7" (the numbers are read just below).
  text = text.replace(new RegExp(String.raw`(?<![\w.,])(${NUMBER}(?:\.\d+)?)\s?[-–]\s?(?=(?:${NUMBER})(?![\w]))`, "g"), "$1 to ");
  // Plain numbers, with optional sign, decimals and unit.
  const plain = new RegExp(String.raw`(?<![\w.,])(-|−)?(${NUMBER})(?:\.(\d+))?(?:\s?(${UNIT_NAMES})(?![\w]))?`, "g");
  text = text.replace(plain, (match, sign: string | undefined, digits: string, decimals: string | undefined, unit: string | undefined) => {
    let words = decimals !== undefined ? decimal(String(toInt(digits)), decimals) : readInteger(digits, warn);
    if (/^\d/.test(words)) return match;
    if (/^\d{4}$/.test(digits) && !decimals && !unit && !sign && toInt(digits) >= 1100 && toInt(digits) <= 2099) {
      warn("maybe_year", `"${digits}" đọc là số đếm (${words}); nếu là năm thì viết "in ${digits}" để đọc kiểu năm`);
    }
    if (sign) words = `minus ${words}`;
    if (unit) {
      const [one, many] = UNITS[unit]!;
      words += ` ${toInt(digits) === 1 && decimals === undefined && !sign ? one : many}`;
    }
    return words;
  });

  // 4. Whitespace and punctuation tidy-up.
  text = text
    .replace(/\s+/g, " ")
    .replace(/\s+([,.;:!?])/g, "$1")
    .replace(new RegExp(`${BLANK}\\.(?!\\.)`, "g"), BLANK)
    .replace(new RegExp(`${BLANK}(?=[^\\s,.;:!?)"'”’])`, "g"), `${BLANK} `)
    .trim();

  // 5. What is still risky: report, do not guess.
  for (const digits of text.match(/\d+/g) ?? []) warn("digits", `còn chữ số "${digits}" chưa đọc thành chữ`);
  for (const acronym of new Set(text.match(/\b[A-Z]{2,}\b/g) ?? [])) {
    warn("acronym", `viết tắt "${acronym}": Kokoro có thể đánh vần hoặc đọc sai, nghe kỹ hoặc viết đầy đủ`);
  }
  for (const symbol of new Set(text.match(/[/\\#@*_~^|<>[\]{}$£€]/g) ?? [])) {
    warn("symbol", `ký hiệu "${symbol}" chưa có cách đọc, viết lại bằng chữ`);
  }
  const foreign = text.match(/[^\x20-\x7e…—–‘’“”]/g);
  if (foreign) warn("non_english", `có ký tự ngoài tiếng Anh (${[...new Set(foreign)].join(" ")}), Kokoro đọc theo âm tiếng Anh`);

  return { text, warnings };
}
