// Mirror of schema/vocab-term.schema.json.
import { z } from "zod";
import { Image, Key, Spoken, Uuid } from "./common.ts";

export const VocabTerm = z.strictObject({
  id: Uuid,
  key: Key,
  term: Spoken,
  example: Spoken,
  image: Image.optional(),
  tier: z.enum(["core", "extra"]).default("core"),
});

export type VocabTerm = z.infer<typeof VocabTerm>;
