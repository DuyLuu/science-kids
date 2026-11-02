// Public entry: zod schemas (1:1 with ../schema/*.schema.json) and their TS types.
import { Lesson } from "./lesson.ts";
import { Topic } from "./topic.ts";

export * from "./common.ts";
export * from "./vocab-term.ts";
export * from "./collectible.ts";
export * from "./quiz-item.ts";
export * from "./block.ts";
export * from "./topic.ts";
export * from "./lesson.ts";

/** Root schema per file kind (the `kind` field at the root of every content file). */
export const schemasByKind = { topic: Topic, lesson: Lesson } as const;
export type ContentKind = keyof typeof schemasByKind;
export const contentKinds = Object.keys(schemasByKind) as ContentKind[];
