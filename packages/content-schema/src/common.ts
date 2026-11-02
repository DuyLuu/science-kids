// Mirror of schema/common.schema.json. Keep 1:1: same $defs names, same fields, same rules.
import { z } from "zod";

// --require-assets: Spoken must carry audio.en + audio.vi, Image must carry asset.
// zod has no per-parse context, so the mode is a flag that is only on while a
// synchronous parse runs inside withAssetsRequired(). Never call it around async work.
let assetsRequired = false;

export function withAssetsRequired<T>(required: boolean, fn: () => T): T {
  const previous = assetsRequired;
  assetsRequired = required;
  try {
    return fn();
  } finally {
    assetsRequired = previous;
  }
}

export const NonEmptyString = z.string().regex(/\S/, "không được rỗng hoặc chỉ có khoảng trắng");

export const AssetHash = z
  .string()
  .regex(/^[0-9a-f]{64}$/, "phải là sha256 hex: 64 ký tự 0-9 a-f chữ thường");

export const Uuid = z
  .string()
  .regex(
    /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/,
    "phải là UUID chữ thường dạng 8-4-4-4-12",
  );

export const Key = z
  .string()
  .regex(/^[a-z][a-z0-9_]{0,39}$/, "phải là key: bắt đầu bằng chữ a-z, chỉ gồm a-z 0-9 _, tối đa 40 ký tự");

export const Slug = z
  .string()
  .regex(/^[a-z0-9]+(-[a-z0-9]+)*$/, "phải là slug: chữ thường không dấu và số, nối bằng dấu -");

export const AppVersion = z
  .string()
  .regex(/^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)$/, "phải là phiên bản app dạng MAJOR.MINOR.PATCH");

export const ColorToken = z.enum(["do_son", "vang_hoe", "gi_dong", "cham", "nau_dat"]);

export const SchemaVersion = z.literal(1);

export const Text = z.strictObject({
  en: NonEmptyString,
  vi: NonEmptyString,
});

export const SpokenAudio = z.strictObject({
  en: AssetHash.optional(),
  vi: AssetHash.optional(),
});

export const Spoken = z
  .strictObject({
    en: NonEmptyString,
    vi: NonEmptyString,
    audio: SpokenAudio.optional(),
  })
  .superRefine((value, ctx) => {
    if (!assetsRequired) return;
    if (value.audio === undefined) {
      ctx.addIssue({ code: "custom", path: ["audio"], message: "thiếu audio (cần audio.en và audio.vi)" });
      return;
    }
    for (const lang of ["en", "vi"] as const) {
      if (value.audio[lang] === undefined) {
        ctx.addIssue({ code: "custom", path: ["audio", lang], message: `thiếu audio.${lang}` });
      }
    }
  });

export const Image = z
  .strictObject({
    alt: Text,
    brief: NonEmptyString.optional(),
    asset: AssetHash.optional(),
  })
  .superRefine((value, ctx) => {
    if (assetsRequired && value.asset === undefined) {
      ctx.addIssue({ code: "custom", path: ["asset"], message: "hình thiếu asset" });
    }
  });

/** Array whose items must be pairwise different (JSON Schema uniqueItems). */
export function uniqueItems<T extends z.ZodType>(array: z.ZodArray<T>) {
  return array.superRefine((items, ctx) => {
    const seen = new Map<string, number>();
    items.forEach((item, index) => {
      const id = JSON.stringify(item);
      const first = seen.get(id);
      if (first === undefined) seen.set(id, index);
      else ctx.addIssue({ code: "custom", message: `phần tử ${index} trùng với phần tử ${first}` });
    });
  });
}

export type NonEmptyString = z.infer<typeof NonEmptyString>;
export type AssetHash = z.infer<typeof AssetHash>;
export type Uuid = z.infer<typeof Uuid>;
export type Key = z.infer<typeof Key>;
export type Slug = z.infer<typeof Slug>;
export type AppVersion = z.infer<typeof AppVersion>;
export type ColorToken = z.infer<typeof ColorToken>;
export type Text = z.infer<typeof Text>;
export type SpokenAudio = z.infer<typeof SpokenAudio>;
export type Spoken = z.infer<typeof Spoken>;
export type Image = z.infer<typeof Image>;
