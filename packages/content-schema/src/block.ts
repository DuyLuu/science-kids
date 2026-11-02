// Mirror of schema/block.schema.json.
import { z } from "zod";
import { AppVersion, ColorToken, Image, Key, Spoken, Uuid, uniqueItems } from "./common.ts";

/** Common fields. Never used alone: always through Block, LearnBlock or PlayBlock. */
export const BlockBase = z.strictObject({
  id: Uuid,
  key: Key,
  type: z.string(),
  version: z.int().min(1),
  min_app_version: AppVersion.optional(),
});

export const ExploreGroup = z.strictObject({
  key: Key,
  label: Spoken,
  color: ColorToken,
  sentence: Spoken,
  image: Image.optional(),
  examples: z.array(Spoken).min(1).max(4),
});

export const ExploreGroups = BlockBase.extend({
  type: z.literal("explore_groups"),
  prompt: Spoken,
  groups: z.array(ExploreGroup).min(2).max(6),
  complete_when: z.literal("all_seen"),
});

export const SentenceCard = BlockBase.extend({
  type: z.literal("sentence_card"),
  text: Spoken,
  image: Image.optional(),
});

export const WordList = BlockBase.extend({
  type: z.literal("word_list"),
  title: Spoken.optional(),
  term_keys: uniqueItems(z.array(Key).min(1)),
});

export const TrayGroup = z.strictObject({
  key: Key,
  label: Spoken,
  color: ColorToken,
  role: z.enum(["required", "limit", "neutral"]),
});

export const TrayItem = z.strictObject({
  key: Key,
  label: Spoken,
  group: Key,
  image: Image.optional(),
});

export const TrayMessages = z.strictObject({
  start: Spoken,
  full: Spoken,
  balanced: Spoken,
  has_limited: Spoken,
  missing: z.record(Key, Spoken).refine((value) => Object.keys(value).length >= 1, {
    message: "cần ít nhất 1 lời nhắc",
  }),
});

export const BuildTray = BlockBase.extend({
  type: z.literal("build_tray"),
  prompt: Spoken,
  capacity: z.int().min(1),
  groups: z.array(TrayGroup).min(1),
  items: z.array(TrayItem).min(1),
  messages: TrayMessages,
  success_when: z.literal("all_required_and_no_limit"),
});

export const LearnBlock = z.discriminatedUnion("type", [ExploreGroups, SentenceCard, WordList]);
export const PlayBlock = z.discriminatedUnion("type", [BuildTray]);
export const Block = z.discriminatedUnion("type", [ExploreGroups, SentenceCard, WordList, BuildTray]);

export type ExploreGroups = z.infer<typeof ExploreGroups>;
export type SentenceCard = z.infer<typeof SentenceCard>;
export type WordList = z.infer<typeof WordList>;
export type BuildTray = z.infer<typeof BuildTray>;
export type LearnBlock = z.infer<typeof LearnBlock>;
export type PlayBlock = z.infer<typeof PlayBlock>;
export type Block = z.infer<typeof Block>;
export type BlockType = Block["type"];
