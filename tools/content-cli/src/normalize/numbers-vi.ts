// Vietnamese number words (content/tts-vi/listening-set.md "Ghi chú cho dev: luật đọc"). Pure.
//   21..91 ending in 1 -> "mốt" (11 stays "mười một"); 15, 25.. -> "lăm"; 105 -> "một trăm linh năm";
//   24 -> "hai mươi bốn" or "hai mươi tư" (option); 206 -> "hai trăm linh sáu" or "lẻ" (option);
//   2026 -> "hai nghìn không trăm hai mươi sáu"; "nghìn" or "ngàn" (option).
// The defaults follow the primary-school maths textbook reading (SK-024 open question 1).

export type ViNumberStyle = {
  /** Tens digit 0 after hundreds (206): "linh" (default, textbook) or "lẻ" (Southern). */
  zeroTens: "linh" | "lẻ";
  /** 1000: "nghìn" (default) or "ngàn" (Southern). */
  thousand: "nghìn" | "ngàn";
  /** 4 after "mươi" (24, 34…): "bốn" (default) or "tư". 14 is always "mười bốn". */
  fourAfterTens: "bốn" | "tư";
};

export const DEFAULT_VI_NUMBER_STYLE: ViNumberStyle = { zeroTens: "linh", thousand: "nghìn", fourAfterTens: "bốn" };

const DIGITS = ["không", "một", "hai", "ba", "bốn", "năm", "sáu", "bảy", "tám", "chín"];
const SCALES = ["", "", "triệu", "tỉ"]; // groups of three digits; index 1 is the thousand word

/** 0..99. `inner`: the number follows a higher group ("hai trăm linh sáu", "một nghìn không trăm linh năm"). */
function tensAndUnits(n: number, inner: boolean, style: ViNumberStyle): string[] {
  const tens = Math.floor(n / 10);
  const unit = n % 10;
  if (tens === 0) {
    if (unit === 0) return inner ? [] : ["không"];
    return inner ? [style.zeroTens, DIGITS[unit]!] : [DIGITS[unit]!];
  }
  const words = tens === 1 ? ["mười"] : [DIGITS[tens]!, "mươi"];
  if (unit === 0) return words;
  if (unit === 1) return [...words, tens === 1 ? "một" : "mốt"];
  if (unit === 5) return [...words, "lăm"];
  if (unit === 4 && tens > 1) return [...words, style.fourAfterTens];
  return [...words, DIGITS[unit]!];
}

/** 0..999 as one group. `inner`: a higher group came before, so hundreds are always said ("không trăm"). */
function group(n: number, inner: boolean, style: ViNumberStyle): string[] {
  const hundreds = Math.floor(n / 100);
  const rest = n % 100;
  if (hundreds === 0 && !inner) return tensAndUnits(rest, false, style);
  const words = [DIGITS[hundreds]!, "trăm"];
  return rest === 0 ? words : [...words, ...tensAndUnits(rest, true, style)];
}

export const MAX_VI_CARDINAL = 999_999_999_999;

/** Cardinal 0 .. 999 999 999 999 in words. */
export function cardinalVi(n: number, style: ViNumberStyle = DEFAULT_VI_NUMBER_STYLE): string {
  if (!Number.isSafeInteger(n) || n < 0 || n > MAX_VI_CARDINAL) throw new RangeError(`cardinalVi: ${n}`);
  if (n < 1000) return group(n, false, style).join(" ");
  const groups: number[] = [];
  for (let rest = n; rest > 0; rest = Math.floor(rest / 1000)) groups.unshift(rest % 1000);
  const words: string[] = [];
  groups.forEach((value, i) => {
    const scaleIndex = groups.length - 1 - i;
    const scale = scaleIndex === 1 ? style.thousand : SCALES[scaleIndex]!;
    if (value === 0) return;
    // "một triệu không trăm linh năm nghìn": a group after a higher one keeps its hundreds.
    words.push(...group(value, i > 0, style));
    if (scale) words.push(scale);
  });
  return words.join(" ");
}

/** Digits after the decimal comma: read as a number ("2,5" -> năm, "3,14" -> mười bốn), leading zeros one by one. */
export function decimalPartVi(digits: string, style: ViNumberStyle = DEFAULT_VI_NUMBER_STYLE): string {
  const zeros = digits.match(/^0+/)?.[0].length ?? 0;
  const rest = digits.slice(zeros);
  return [...Array(zeros).fill("không"), ...(rest ? [cardinalVi(Number(rest), style)] : [])].join(" ");
}

/** "thứ 1" -> "thứ nhất", "thứ 4" -> "thứ tư", other numbers stay cardinal ("thứ hai"). */
export function ordinalVi(n: number, style: ViNumberStyle = DEFAULT_VI_NUMBER_STYLE): string {
  if (n === 1) return "nhất";
  if (n === 4) return "tư";
  return cardinalVi(n, style);
}

/** "3/4" -> "ba phần tư", "1/2" -> "một phần hai". Denominator 4 is read "tư". */
export function fractionVi(numerator: number, denominator: number, style: ViNumberStyle = DEFAULT_VI_NUMBER_STYLE): string {
  const below = denominator === 4 ? "tư" : cardinalVi(denominator, style);
  return `${cardinalVi(numerator, style)} phần ${below}`;
}

/** Month names: "tháng 4" -> "tháng tư"; the others are cardinals ("tháng mười một"). */
export function monthVi(n: number, style: ViNumberStyle = DEFAULT_VI_NUMBER_STYLE): string {
  return n === 4 ? "tư" : cardinalVi(n, style);
}
