// Mirror of schema/topic.schema.json.
import { z } from "zod";
import { Key, NonEmptyString, SchemaVersion, Slug, Spoken, Text, Uuid, uniqueItems } from "./common.ts";

const score = z.int().min(1).max(3);

export const Difficulty = z.strictObject({
  abstraction: score,
  prior_knowledge: score,
  misconception: score,
  vocabulary: score,
  science_skill: score,
});

export const Misconception = z.strictObject({
  id: Uuid,
  key: Key,
  statement: Text,
  correction: Text,
  note: NonEmptyString.optional(),
});

export const Topic = z.strictObject({
  kind: z.literal("topic"),
  schema_version: SchemaVersion,
  id: Uuid,
  slug: Slug,
  age_group: z.enum(["explorer", "discoverer", "scientist"]),
  order: z.int().min(1),
  title: Spoken,
  question: Spoken.optional(),
  strand: z.enum(["plants_animals", "living_environment", "humans_health", "materials", "energy_forces", "earth_sky"]),
  level: z.int().min(1).max(5),
  difficulty: Difficulty,
  prerequisite_topic_ids: uniqueItems(z.array(Uuid)),
  is_free: z.boolean(),
  oak_unit_ref: NonEmptyString.optional(),
  sensitive: z.boolean().default(false),
  archived: z.boolean().default(false),
  ai_draft: z.boolean().default(false),
  misconceptions: z.array(Misconception),
});

export type Difficulty = z.infer<typeof Difficulty>;
export type Misconception = z.infer<typeof Misconception>;
export type Topic = z.infer<typeof Topic>;
export type TopicInput = z.input<typeof Topic>;
