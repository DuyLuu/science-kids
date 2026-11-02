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
