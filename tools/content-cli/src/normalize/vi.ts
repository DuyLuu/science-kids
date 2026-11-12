// Vietnamese text normalisation before TTS (technical-plan B9, SK-024). VieNeu's own front end
// (sea-g2p) reads "3/4" as "ba trên bốn" and an English-looking word ("vitamin") with English
// phonemes, so the CLI decides those readings here. The result is both what gets hashed (cache key)
// and what VieNeu reads; the text shown on screen never changes. Pure, no I/O.
// Rules and test cases: content/tts-vi/listening-set.md "Ghi chú cho dev: luật đọc".
import { BLANK, type Normalized, type NormalizeWarning } from "./en.ts";
import { cardinalVi, decimalPartVi, DEFAULT_VI_NUMBER_STYLE, fractionVi, MAX_VI_CARDINAL, monthVi, ordinalVi, type ViNumberStyle } from "./numbers-vi.ts";

export type ViOptions = {
  numbers: ViNumberStyle;
  /**
   * Where the tone mark sits in "oa", "oe", "uy" without a final consonant: "new" = hoà, khoẻ, thuỷ
   * (how lesson 1 is written), "old" = hòa, khỏe, thủy. sea-g2p gives the same phonemes for both
   * (checked 01/11), so this only makes the two spellings share one clip.
   */
  toneStyle: "new" | "old";
};

export const DEFAULT_VI_OPTIONS: ViOptions = { numbers: DEFAULT_VI_NUMBER_STYLE, toneStyle: "new" };

/** Units read only right after a number. */
const UNITS: Record<string, string> = {
  kg: "ki lô gam",
  g: "gam",
  mg: "mi li gam",
  km: "ki lô mét",
  m: "mét",
  cm: "xăng ti mét",
  mm: "mi li mét",
  l: "lít",
  ml: "mi li lít",
  "°C": "độ xê",
  "%": "phần trăm",
};

/** Abbreviations read in full. Case-sensitive. */
const ABBREVIATIONS: [RegExp, string][] = [
  [/\bTP\.?\s?HCM\b/g, "Thành phố Hồ Chí Minh"],
  [/\bTPHCM\b/g, "Thành phố Hồ Chí Minh"],
  [/\bv\.v\.?/g, "vân vân"],
];

/** Chemical formulas, read the way Vietnamese schools do (H = "hát", C = "xê", O = "ô"). */
const FORMULAS: [RegExp, string][] = [
  [/\bCO[₂2](?![\w])/g, "xê ô hai"],
  [/\bH[₂2]O\b/g, "hát hai ô"],
  [/\bO[₂2](?![\w])/g, "ô hai"],
];

/**
 * Forced readings for loanwords and foreign names (B9: do not let the engine guess). Matched as
 * whole words, case-insensitive; a capital first letter is kept. "vitamin": sea-g2p gives English
 * phonemes ("vai-tơ-min"); listening-set A05 expects the Vietnamese "vi-ta-min".
 */
export const READINGS: Record<string, string> = {
  // listening-set.md "Bảng phiên âm" and the expected readings of A24, A26, B23, B26–B28
  vitamin: "vi ta min",
  oxy: "ô xi",
  protein: "prô tê in",
  carbohydrate: "các bô hi đrát",
  charles: "Sác lơ",
  darwin: "Đác uyn",
  "galápagos": "Ga la pa gốt",
  isaac: "Ai dắc",
  newton: "Niu tơn",
  // khung-long/_topic.md (SK-033, Duy 9/11): "kỷ Jura" reads "Giu-ra". "Tam Điệp" is plain
  // Vietnamese and stays as written (no entry).
  jura: "giu ra",
  // da-va-dat (Discoverer, Oak "Rocks and soils"; dev 12/11): "thang độ cứng Mohs" reads "Mốt",
  // "Mary Anning" reads "Me-ri An-ninh".
  mohs: "Mốt",
  mary: "Me ri",
  anning: "An ninh",
};

const TONE_MARKS = "̣̀́̃̉"; // huyền sắc ngã hỏi nặng
const VI_LETTER = "a-zA-ZàáảãạăằắẳẵặâầấẩẫậèéẻẽẹêềếểễệìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵđĐÀ-Ỹ";
const NUMBER = String.raw`\d{1,3}(?:\.\d{3})+|\d+`;
const UNIT_NAMES = Object.keys(UNITS)
  .sort((a, b) => b.length - a.length)
  .map((unit) => unit.replace(/[%°]/g, (c) => `\\${c}`))
  .join("|");

/** "1.000" -> 1000. */
function toInt(digits: string): number {
  return Number(digits.replace(/\./g, ""));
}

/** Moves the tone mark in "oa", "oe", "uy" (no final consonant) to the chosen side. */
export function placeTone(word: string, style: ViOptions["toneStyle"]): string {
  const nfd = word.normalize("NFD");
  const old = new RegExp(`^([^aeiouyAEIOUY]*?)([oOuU])([${TONE_MARKS}])([aeyAEY])$`);
  const modern = new RegExp(`^([^aeiouyAEIOUY]*?)([oOuU])([aeyAEY])([${TONE_MARKS}])$`);
  const fits = (initial: string, first: string, second: string) => {
    const pair = `${first}${second}`.toLowerCase();
    if (!["oa", "oe", "uy"].includes(pair)) return false;
    return !(pair === "uy" && /q$/i.test(initial)); // "quý": u belongs to "qu"
  };
  if (style === "new") {
    const m = nfd.match(old);
    if (m && fits(m[1]!, m[2]!, m[4]!)) return `${m[1]}${m[2]}${m[4]}${m[3]}`.normalize("NFC");
  } else {
    const m = nfd.match(modern);
    if (m && fits(m[1]!, m[2]!, m[3]!)) return `${m[1]}${m[2]}${m[4]}${m[3]}`.normalize("NFC");
  }
  return word;
}

const SYLLABLE = new RegExp(
  "^(ngh|ng|gh|gi|kh|nh|ph|qu|th|tr|ch|b|c|d|đ|g|h|k|l|m|n|p|r|s|t|v|x)?" + "[aăâeêioôơuưy]{1,3}" + "(ch|ng|nh|c|m|n|p|t)?$",
);

/** True when the word can be one Vietnamese syllable (spelling only, tones ignored). */
export function isVietnameseSyllable(word: string): boolean {
  const bare = word
    .normalize("NFD")
    .replace(new RegExp(`[${TONE_MARKS}]`, "g"), "")
    .normalize("NFC")
    .toLowerCase();
  return SYLLABLE.test(bare);
}

export function normalizeVi(input: string, options: ViOptions = DEFAULT_VI_OPTIONS): Normalized {
  const style = options.numbers;
  const warnings: NormalizeWarning[] = [];
  const warn = (code: string, message: string) => {
    if (!warnings.some((w) => w.code === code && w.message === message)) warnings.push({ code, message });
  };
  let text = input.normalize("NFC").replace(/[  \t\r\n]/g, " ");

  // 1. Blanks of fill_blank_bank, and "..." / "…" as the same pause marker (as for EN).
  text = text.replace(/\{\s*\d+\s*\}/g, ` ${BLANK} `).replace(/\.{3}/g, BLANK);

  // 2. One tone-mark style.
  text = text.replace(new RegExp(`[${VI_LETTER}]+`, "g"), (word) => placeTone(word, options.toneStyle));

  // 3. Abbreviations, formulas, forced readings.
  for (const [pattern, words] of ABBREVIATIONS) text = text.replace(pattern, words);
  for (const [pattern, words] of FORMULAS) text = text.replace(pattern, words);
  text = text.replace(new RegExp(`(?<![${VI_LETTER}])([${VI_LETTER}]+)(?![${VI_LETTER}])`, "g"), (word) => {
    const reading = READINGS[word.toLowerCase()];
    if (!reading) return word;
    return /^\p{Lu}/u.test(word) ? reading.charAt(0).toUpperCase() + reading.slice(1) : reading;
  });

  // 4. Symbols read as pauses or words.
  text = text
    .replace(new RegExp(`(?<=[${VI_LETTER}])\\s*[—–]\\s*(?=[${VI_LETTER}])`, "g"), ", ") // "rồi — chạm" -> "rồi, chạm"
    .replace(/\s*\(\s*([^()]*?)\s*\)\s*/g, ", $1, ") // "(con non của ếch)" -> ", con non của ếch,"
    .replace(/\s*&\s*/g, " và ")
    .replace(/(?<=\d)\s*\+\s*(?=\d)/g, " cộng ")
    .replace(/(?<=\d)\s*[×]\s*(?=\d)/g, " nhân ")
    .replace(/\s*=\s*/g, " bằng ");

  // 5. Numbers, most specific first.
  // English-style separators are not guessed: "1,000" (thousands?) and "2.5" (decimal?).
  for (const match of text.matchAll(/(?<![\w.,])\d{1,3},\d{3}(?![\d,.])/g)) {
    warn("number_format", `"${match[0]}" giống kiểu Anh (dấu phẩy ngăn nghìn); kiểu Việt viết "${match[0].replace(",", ".")}" (nghìn) hoặc giữ dấu phẩy cho số thập phân. Chưa đọc thành chữ`);
  }
  for (const match of text.matchAll(/(?<![\w.,])\d+\.\d{1,2}(?![\d.,])/g)) {
    warn("number_format", `"${match[0]}" giống số thập phân kiểu Anh; kiểu Việt viết "${match[0].replace(".", ",")}". Chưa đọc thành chữ`);
  }
  // Set those aside (private-use characters, no digits) so the number rules below skip them.
  const kept: string[] = [];
  text = text.replace(/(?<![\w.,])(\d{1,3},\d{3}|\d+\.\d{1,2})(?![\d.,])/g, (m) => {
    kept.push(m);
    return `\uE000${String.fromCharCode(0xe100 + kept.length - 1)}\uE000`;
  });
  // Ordinals and months.
  text = text.replace(/\b(thứ|Thứ)\s+(\d{1,4})\b/g, (_, word: string, digits: string) => `${word} ${ordinalVi(Number(digits), style)}`);
  text = text.replace(/\b(tháng|Tháng)\s+(\d{1,2})\b/g, (match, word: string, digits: string) => {
    const n = Number(digits);
    return n >= 1 && n <= 12 ? `${word} ${monthVi(n, style)}` : match;
  });
  // Fractions 3/4 -> "ba phần tư" (sea-g2p would say "ba trên bốn"); a/b that could be a date is read but flagged.
  text = text.replace(/(?<![\w./])(\d{1,4})\/(\d{1,3})(?![\w/])/g, (match, a: string, b: string) => {
    const numerator = Number(a);
    const denominator = Number(b);
    if (denominator < 2 || denominator > 100) return match;
    if (numerator >= 1 && numerator <= 31 && denominator <= 12) {
      warn("maybe_date", `"${match}" đọc là phân số (${fractionVi(numerator, denominator, style)}); nếu là ngày tháng thì viết bằng chữ`);
    }
    return fractionVi(numerator, denominator, style);
  });
  // Ranges 5–7 -> "5 đến 7" (the numbers are read just below).
  text = text.replace(new RegExp(String.raw`(?<![\w.,])(${NUMBER}(?:,\d+)?)\s?[-–—]\s?(?=(?:${NUMBER})(?![\w]))`, "g"), "$1 đến ");
  // Plain numbers: Vietnamese thousands dot, decimal comma, optional sign and unit.
  const plain = new RegExp(String.raw`(?<![\w.,])(-|−)?(${NUMBER})(?:,(\d+))?(?:\s?(${UNIT_NAMES})(?![\w${VI_LETTER}]))?`, "g");
  text = text.replace(plain, (match, sign: string | undefined, digits: string, decimals: string | undefined, unit: string | undefined) => {
    const value = toInt(digits);
    if (!Number.isSafeInteger(value) || value > MAX_VI_CARDINAL) {
      warn("number_too_large", `số ${digits} quá lớn, chưa đọc thành chữ`);
      return match;
    }
    // "007": digit by digit, a cardinal would drop the zeros.
    let words = /^0\d/.test(digits) ? [...digits].map((d) => cardinalVi(Number(d), style)).join(" ") : cardinalVi(value, style);
    if (decimals !== undefined) words += ` phẩy ${decimalPartVi(decimals, style)}`;
    if (sign) words = `âm ${words}`;
    if (unit) words += ` ${UNITS[unit]}`;
    return words;
  });
  text = text.replace(/\uE000(.)\uE000/g, (_, c: string) => kept[c.charCodeAt(0) - 0xe100]!);

  // 6. Whitespace and punctuation tidy-up.
  text = text
    .replace(/\s+/g, " ")
    .replace(/\s+([,.;:!?])/g, "$1")
    .replace(/,\s*(?=[,.;:!?])/g, "")
    .replace(/^\s*,\s*/, "")
    .replace(new RegExp(`${BLANK}\\.(?!\\.)`, "g"), BLANK)
    .replace(new RegExp(`${BLANK}(?=[^\\s,.;:!?)"'”’])`, "g"), `${BLANK} `)
    .trim();

  // 7. What is still risky: report, do not guess.
  for (const digits of text.match(/\d+/g) ?? []) warn("digits", `còn chữ số "${digits}" chưa đọc thành chữ`);
  for (const acronym of new Set(text.match(new RegExp(`(?<![${VI_LETTER}])[A-ZĐ]{2,}(?![${VI_LETTER}])`, "g")) ?? [])) {
    warn("acronym", `chữ in hoa "${acronym}" không có trong bảng viết tắt: engine có thể đánh vần, viết đầy đủ hoặc thêm vào bảng`);
  }
  for (const symbol of new Set(text.match(/[/\\#@*_~^|<>[\]{}$£€]/g) ?? [])) {
    warn("symbol", `ký hiệu "${symbol}" chưa có cách đọc, viết lại bằng chữ`);
  }
  for (const word of new Set(text.match(new RegExp(`[${VI_LETTER}]+`, "g")) ?? [])) {
    if (!isVietnameseSyllable(word)) {
      warn("loanword", `"${word}" không phải âm tiết tiếng Việt: engine sẽ đoán cách đọc (thường theo tiếng Anh). Viết phiên âm kèm hoặc thêm vào bảng READINGS`);
    }
  }
  return { text, warnings };
}
