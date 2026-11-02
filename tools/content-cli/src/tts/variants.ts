// Seed variants chosen by the VI self-check (SK-024), kept in the repo so a re-run (or a rebuild
// after the cache is lost, on the machine of record) regenerates exactly the clip that was kept.
// tools/content-cli/tts-vi/variants.json: engine fingerprint -> normalised text -> variant.
import { existsSync, readFileSync, writeFileSync } from "node:fs";
import path from "node:path";
import { sha256Bytes } from "../audio.ts";
import { canonicalJson } from "../cache.ts";
import { CLI_ROOT } from "../paths.ts";

export const VARIANTS_FILE = path.join(CLI_ROOT, "tts-vi", "variants.json");
const FORMAT = "science-kids/tts-variants@1";

export type VariantChoice = {
  variant: number;
  /** Self-check flags of variant 0 (why another seed was tried) and of the kept variant. */
  flags_before: string[];
  flags_after: string[];
  /** What the ASR heard for the kept clip (both passes). */
  heard: string[];
  tried: number[];
  chosen_at: string;
  /** Set when a person chose the variant (--pin-variant), with the reason. */
  note?: string;
};

type VariantsFile = { format: string; note: string; engines: Record<string, { label: string; texts: Record<string, VariantChoice> }> };

/** Everything in the descriptor that changes the sound (voice, model, versions…): a new voice starts a fresh table. */
export function engineFingerprint(descriptor: Record<string, string | number>): string {
  return sha256Bytes(canonicalJson(descriptor)).slice(0, 16);
}

export class VariantTable {
  private data: VariantsFile;
  private readonly saved: string;
  private readonly file: string;

  constructor(file = VARIANTS_FILE) {
    this.file = file;
    this.data = existsSync(file)
      ? (JSON.parse(readFileSync(file, "utf8")) as VariantsFile)
      : { format: FORMAT, note: "Biến thể seed do bước tự kiểm của content-cli tts --lang vi chọn (SK-024). Không sửa tay.", engines: {} };
    if (this.data.format !== FORMAT) throw new Error(`${file}: format ${this.data.format} lạ, cần ${FORMAT}`);
    this.saved = this.serialize();
  }

  get(fingerprint: string, text: string): VariantChoice | undefined {
    return this.data.engines[fingerprint]?.texts[text];
  }

  set(fingerprint: string, label: string, text: string, choice: VariantChoice | undefined): void {
    const engine = (this.data.engines[fingerprint] ??= { label, texts: {} });
    if (choice) engine.texts[text] = choice;
    else delete engine.texts[text];
  }

  save(): boolean {
    const json = this.serialize();
    if (json === this.saved) return false;
    writeFileSync(this.file, json);
    return true;
  }

  private serialize(): string {
    const engines: VariantsFile["engines"] = {};
    for (const fp of Object.keys(this.data.engines).sort()) {
      const { label, texts } = this.data.engines[fp]!;
      const sorted: Record<string, VariantChoice> = {};
      for (const text of Object.keys(texts).sort()) sorted[text] = texts[text]!;
      engines[fp] = { label, texts: sorted };
    }
    return `${JSON.stringify({ format: this.data.format, note: this.data.note, engines }, null, 2)}\n`;
  }
}
