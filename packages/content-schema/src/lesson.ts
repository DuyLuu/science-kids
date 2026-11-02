// Mirror of schema/lesson.schema.json.
import { z } from "zod";
import { LearnBlock, PlayBlock } from "./block.ts";
import { Collectible } from "./collectible.ts";
import { SchemaVersion, Slug, Spoken, Uuid } from "./common.ts";
import { QuizItem } from "./quiz-item.ts";
import { VocabTerm } from "./vocab-term.ts";

export const WarmupItem = QuizItem.superRefine((item, ctx) => {
  if (item.recall_from === undefined) {
    ctx.addIssue({
      code: "custom",
      path: ["recall_from"],
      message: "câu warmup phải có recall_from (prior_knowledge hoặc lesson)",
    });
  }
});

export const LessonQuizItem = QuizItem.superRefine((item, ctx) => {
  if (item.recall_from !== undefined) {
    ctx.addIssue({
      code: "custom",
      path: ["recall_from"],
      message: "recall_from chỉ dùng cho câu warmup; câu quiz không được có",
    });
  }
});

export const Reward = z.strictObject({
  collectible: Collectible.optional(),
});

export const Lesson = z.strictObject({
  kind: z.literal("lesson"),
  schema_version: SchemaVersion,
  id: Uuid,
  topic_id: Uuid,
  slug: Slug,
  order: z.int().min(1),
  stage: z.enum(["opener", "core", "apply", "review"]),
  title: Spoken,
  objective: Spoken,
  key_points: z.array(Spoken).length(3),
  est_minutes: z.int().min(1),
  sensitive: z.boolean().default(false),
  archived: z.boolean().default(false),
  ai_draft: z.boolean().default(false),
  warmup: z.array(WarmupItem).max(3),
  learn: z.array(LearnBlock).min(1),
  play: PlayBlock,
  quiz: z.array(LessonQuizItem).length(6),
  vocab: z.array(VocabTerm).min(4).max(8),
  reward: Reward,
});

export type Reward = z.infer<typeof Reward>;
export type Lesson = z.infer<typeof Lesson>;
export type LessonInput = z.input<typeof Lesson>;
