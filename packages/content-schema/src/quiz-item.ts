// Mirror of schema/quiz-item.schema.json.
import { z } from "zod";
import { Image, Key, Spoken, Text, Uuid, uniqueItems } from "./common.ts";

export const RecallFromPriorKnowledge = z.strictObject({
  kind: z.literal("prior_knowledge"),
  note: Text,
});

export const RecallFromLesson = z.strictObject({
  kind: z.literal("lesson"),
  lesson_id: Uuid,
});

export const RecallFrom = z.discriminatedUnion("kind", [RecallFromPriorKnowledge, RecallFromLesson]);

export const ChoiceOption = z.strictObject({
  key: Key,
  label: Spoken,
  image: Image.optional(),
  correct: z.boolean(),
  /** SK-044: only on a wrong option (refs.mjs). */
  feedback: Spoken.optional(),
});

/** Common fields. Never used alone: always through QuizItem. */
export const QuizBase = z.strictObject({
  id: Uuid,
  key: Key,
  format: z.string(),
  version: z.int().min(1),
  dok: z.int().min(1).max(3),
  prompt: Spoken,
  instruction: Spoken.optional(),
  image: Image.optional(),
  hint: Spoken,
  explanation_correct: Spoken,
  explanation_wrong: Spoken,
  misconception_id: Uuid.optional(),
  p_correct: z.number().min(0).max(1).optional(),
  recall_from: RecallFrom.optional(),
});

const countCorrect = (options: { correct: boolean }[]) => options.filter((o) => o.correct).length;

const singleCorrectOptions = z
  .array(ChoiceOption)
  .min(2)
  .max(6)
  .superRefine((options, ctx) => {
    if (countCorrect(options) !== 1) {
      ctx.addIssue({ code: "custom", message: "cần đúng 1 lựa chọn có correct: true" });
    }
  });

export const SingleChoice = QuizBase.extend({
  format: z.literal("single_choice"),
  options: singleCorrectOptions,
});

export const MultiChoice = QuizBase.extend({
  format: z.literal("multi_choice"),
  options: z
    .array(ChoiceOption)
    .min(2)
    .max(8)
    .superRefine((options, ctx) => {
      const correct = countCorrect(options);
      if (correct < 1) {
        ctx.addIssue({ code: "custom", message: "multi_choice cần ít nhất 1 lựa chọn đúng (correct: true)" });
      }
      if (correct === options.length) {
        ctx.addIssue({ code: "custom", message: "multi_choice cần ít nhất 1 lựa chọn sai (correct: false)" });
      }
    }),
});

export const TrueFalseLabels = z.strictObject({
  true: Spoken,
  false: Spoken,
});

export const TrueFalse = QuizBase.extend({
  format: z.literal("true_false"),
  answer: z.boolean(),
  statement: Spoken.optional(),
  speaker: Key.optional(),
  labels: TrueFalseLabels.optional(),
  /** SK-044: said when the child taps true on an answer: false item (refs.mjs). */
  feedback_true: Spoken.optional(),
  /** SK-044: said when the child taps false on an answer: true item (refs.mjs). */
  feedback_false: Spoken.optional(),
});

export const BankWord = z.strictObject({
  key: Key,
  label: Spoken,
  image: Image.optional(),
  /** SK-044: only on a word that is not in answers (refs.mjs). */
  feedback: Spoken.optional(),
});

export const FillBlankBank = QuizBase.extend({
  format: z.literal("fill_blank_bank"),
  sentence: Spoken,
  bank: z.array(BankWord).min(2),
  answers: z.array(Key).min(1),
});

export const SequenceItem = z.strictObject({
  key: Key,
  label: Spoken,
  image: Image.optional(),
});

export const OrderSequence = QuizBase.extend({
  format: z.literal("order_sequence"),
  items: z.array(SequenceItem).min(3).max(6),
  answer: uniqueItems(z.array(Key)),
});

export const Bar = z.strictObject({
  key: Key,
  label: Spoken,
  image: Image.optional(),
  value: z.number().min(0),
});

export const BarChart = z.strictObject({
  title: Spoken.optional(),
  unit: Spoken.optional(),
  bars: z.array(Bar).min(2).max(6),
});

/**
 * SK-043 (dev 14/11): options[i] is the answer of chart.bars[i] (same count, same label, no option
 * image; refs.mjs). The app draws bars left to right; a tap on bar i selects options[i].
 */
export const PictureBarChart = QuizBase.extend({
  format: z.literal("picture_bar_chart"),
  chart: BarChart,
  options: singleCorrectOptions,
});

export const QuizItem = z.discriminatedUnion("format", [
  SingleChoice,
  MultiChoice,
  TrueFalse,
  FillBlankBank,
  OrderSequence,
  PictureBarChart,
]);

export type RecallFrom = z.infer<typeof RecallFrom>;
export type ChoiceOption = z.infer<typeof ChoiceOption>;
export type SingleChoice = z.infer<typeof SingleChoice>;
export type MultiChoice = z.infer<typeof MultiChoice>;
export type TrueFalse = z.infer<typeof TrueFalse>;
export type FillBlankBank = z.infer<typeof FillBlankBank>;
export type OrderSequence = z.infer<typeof OrderSequence>;
export type PictureBarChart = z.infer<typeof PictureBarChart>;
export type QuizItem = z.infer<typeof QuizItem>;
export type QuizFormat = QuizItem["format"];
