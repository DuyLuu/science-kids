// JSON pointer -> markdown line, for one converted file. Every value convert.ts writes records the
// line it came from; a pointer with no line of its own (a missing field, a whole array) falls back
// to the nearest ancestor that has one: the pair's other half, the `####` / `###` heading, the
// `##` section, or line 1 (frontmatter).

export function parentPointer(pointer: string): string {
  const cut = pointer.lastIndexOf("/");
  return cut <= 0 ? "" : pointer.slice(0, cut);
}

export class Locator {
  private readonly lines = new Map<string, number>();
  /** Markdown name of field pointers, e.g. /quiz/0/prompt/en -> "prompt.en". */
  private readonly names = new Map<string, string>();
  /** Heading of block pointers: "frontmatter", "## Quiz", "### q1", "#### option q1_rice". */
  private readonly labels = new Map<string, string>();

  /** First write wins: a pair points at its first line, a block at its heading. */
  mark(pointer: string, line: number, name?: string): void {
    if (!this.lines.has(pointer)) this.lines.set(pointer, line);
    if (name !== undefined && !this.names.has(pointer)) this.names.set(pointer, name);
  }

  block(pointer: string, line: number, label: string): void {
    this.mark(pointer, line);
    this.labels.set(pointer, label);
  }

  has(pointer: string): boolean {
    return this.lines.has(pointer);
  }

  /** Nearest recorded pointer: the pointer itself or an ancestor ("" = frontmatter, line 1). */
  nearest(pointer: string): string {
    let current = pointer;
    while (current !== "" && !this.lines.has(current)) current = parentPointer(current);
    return current;
  }

  line(pointer: string): number {
    return this.lines.get(this.nearest(pointer)) ?? 1;
  }

  name(pointer: string): string | undefined {
    return this.names.get(pointer);
  }

  label(pointer: string): string | undefined {
    return this.labels.get(pointer);
  }

  /** Nearest block (heading) at or above the pointer. */
  blockOf(pointer: string): { pointer: string; label: string } {
    let current = pointer;
    for (;;) {
      const label = this.labels.get(current);
      if (label !== undefined) return { pointer: current, label };
      if (current === "") return { pointer: "", label: "frontmatter" };
      current = parentPointer(current);
    }
  }
}
