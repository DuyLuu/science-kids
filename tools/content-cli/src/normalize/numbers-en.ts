// Numbers to English words, British style ("one hundred and five"), as the content uses UK
// spelling. Pure functions, no I/O.

const ONES = [
  "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
  "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen",
];
const TENS = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"];
const SCALES: [number, string][] = [
  [1e9, "billion"],
  [1e6, "million"],
  [1e3, "thousand"],
];

export const MAX_CARDINAL = 999_999_999_999;

function underHundred(n: number): string {
  if (n < 20) return ONES[n]!;
  const tens = TENS[Math.floor(n / 10)]!;
  return n % 10 === 0 ? tens : `${tens}-${ONES[n % 10]}`;
}

function underThousand(n: number): string {
  if (n < 100) return underHundred(n);
  const hundreds = `${ONES[Math.floor(n / 100)]} hundred`;
  return n % 100 === 0 ? hundreds : `${hundreds} and ${underHundred(n % 100)}`;
}

/** 0 -> "zero", 105 -> "one hundred and five", 2026 -> "two thousand and twenty-six", -3 -> "minus three". */
export function cardinal(n: number): string {
  if (!Number.isInteger(n)) throw new RangeError(`cardinal: không phải số nguyên: ${n}`);
  if (n < 0) return `minus ${cardinal(-n)}`;
  if (n > MAX_CARDINAL) throw new RangeError(`cardinal: số quá lớn: ${n}`);
  if (n < 1000) return underThousand(n);
  const parts: string[] = [];
  let rest = n;
  for (const [size, name] of SCALES) {
    if (rest >= size) {
      parts.push(`${underThousand(Math.floor(rest / size))} ${name}`);
      rest %= size;
    }
  }
  // British "and" before a last group under one hundred: "one thousand and five".
  if (rest > 0) parts.push(rest < 100 ? `and ${underHundred(rest)}` : underThousand(rest));
  return parts.join(" ");
}

const ORDINAL_WORDS: Record<string, string> = {
  one: "first", two: "second", three: "third", five: "fifth", eight: "eighth", nine: "ninth", twelve: "twelfth",
};

function ordinalWord(word: string): string {
  if (ORDINAL_WORDS[word]) return ORDINAL_WORDS[word];
  if (word.endsWith("y")) return `${word.slice(0, -1)}ieth`;
  return `${word}th`;
}

/** 1 -> "first", 22 -> "twenty-second", 100 -> "one hundredth". */
export function ordinal(n: number): string {
  if (n < 0) throw new RangeError(`ordinal: số âm: ${n}`);
  const words = cardinal(n);
  return words.replace(/([a-z]+)$/, (last) => ordinalWord(last));
}

/**
 * Year reading for 1000–2099: 1905 -> "nineteen oh five", 1990 -> "nineteen ninety",
 * 1900 -> "nineteen hundred", 2000 -> "two thousand", 2008 -> "two thousand and eight",
 * 2026 -> "twenty twenty-six". Outside that range: cardinal.
 */
export function year(n: number): string {
  if (!Number.isInteger(n) || n < 1000 || n > 2099) return cardinal(n);
  if (n % 1000 === 0 || (n > 2000 && n < 2010)) return cardinal(n);
  const high = Math.floor(n / 100);
  const low = n % 100;
  if (low === 0) return `${cardinal(high)} hundred`;
  if (low < 10) return `${cardinal(high)} oh ${ONES[low]}`;
  return `${cardinal(high)} ${underHundred(low)}`;
}

/** "1990s" -> "nineteen nineties", "1900s" -> "nineteen hundreds". */
export function decade(n: number): string {
  return plural(year(n));
}

function plural(words: string): string {
  return words.replace(/([a-z]+)$/, (last) => (last.endsWith("y") ? `${last.slice(0, -1)}ies` : `${last}s`));
}

/** Digits read one by one after "point": 0.25 -> "zero point two five". */
export function decimal(integer: string, fraction: string): string {
  return `${cardinal(Number(integer))} point ${[...fraction].map((digit) => ONES[Number(digit)]).join(" ")}`;
}

/** 1/2 -> "one half", 3/4 -> "three quarters", 2/3 -> "two thirds". */
export function fraction(numerator: number, denominator: number): string {
  const many = numerator !== 1;
  let name: string;
  if (denominator === 2) name = many ? "halves" : "half";
  else if (denominator === 4) name = many ? "quarters" : "quarter";
  else name = many ? plural(ordinal(denominator)) : ordinal(denominator);
  return `${cardinal(numerator)} ${name}`;
}
