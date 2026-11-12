// Types for the plain-JS validator of packages/content-schema (scripts/lib/core.mjs).
declare module "@science-kids/content-schema/validate" {
  export type ValidationError = {
    file: string;
    pointer: string;
    message: string;
    stage: "io" | "json" | "kind" | "schema" | "parity" | "refs";
  };
  export type ValidationReport = {
    ok: boolean;
    errors: ValidationError[];
    counts: { files: number; valid: number; topic: number; lesson: number };
  };
  export function validateDocuments(
    inputs: { file: string; text?: string; data?: unknown }[],
    options?: { requireAssets?: boolean },
  ): ValidationReport;
}

// Types for scripts/lib/syllabus.mjs: content/syllabus.json (SK-030).
declare module "@science-kids/content-schema/syllabus" {
  export const SYLLABUS_CODES: Readonly<{
    syllabus_json: "error";
    schema: "error";
    syllabus_duplicate: "error";
    syllabus_number: "error";
    syllabus_key: "error";
    syllabus_oak: "error";
    syllabus_topic_ref: "error";
    syllabus_lesson_ref: "error";
    syllabus_unlisted: "warning";
  }>;
  export type SyllabusCode = keyof typeof SYLLABUS_CODES;
  export type SyllabusIssue = { pointer: string; code: SyllabusCode; severity: "error" | "warning"; message: string };
  export type ContentIndex = {
    root?: string;
    topics: { id: string; slug?: string; age_group?: string; file?: string }[];
    lessons: { id: string; slug?: string; topic_id?: string; topic_slug?: string; file?: string }[];
  };
  export type SyllabusCounts = {
    groups: number;
    topics: number;
    lessons: number;
    byGroup: { age_group: string; topics: number; lessons: number }[];
    linkedTopics: number;
    linkedLessons: number;
    /** Lessons whose title.vi is null (not translated yet). */
    untranslatedLessons: number;
  };
  export function validateSyllabus(
    data: unknown,
    options?: { content?: ContentIndex },
  ): { ok: boolean; schemaOk: boolean; refsChecked: boolean; issues: SyllabusIssue[]; counts?: SyllabusCounts };
  export function placeOf(data: unknown, pointer: string): string;
}
