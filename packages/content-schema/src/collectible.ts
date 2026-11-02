// Mirror of schema/collectible.schema.json.
import { z } from "zod";
import { Image, Key, Spoken, Uuid } from "./common.ts";

export const Collectible = z.strictObject({
  id: Uuid,
  key: Key,
  set: Key,
  name: Spoken,
  tag: Spoken.optional(),
  image: Image,
  fact: Spoken,
  rarity: z.enum(["common", "rare"]).default("common"),
});

export type Collectible = z.infer<typeof Collectible>;
