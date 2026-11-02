// JSON Pointer (RFC 6901), same conventions as packages/content-schema/scripts/lib/pointer.mjs.

export type Token = string | number;

export function escapeToken(token: Token): string {
  return String(token).replace(/~/g, "~0").replace(/\//g, "~1");
}

export function unescapeToken(token: string): string {
  return token.replace(/~1/g, "/").replace(/~0/g, "~");
}

/** ["quiz", 0, "options"] -> "/quiz/0/options" */
export function toPointer(path: readonly Token[]): string {
  return path.map((token) => `/${escapeToken(token)}`).join("");
}

export function parsePointer(pointer: string): string[] {
  if (pointer === "") return [];
  if (!pointer.startsWith("/")) throw new Error(`JSON pointer phải bắt đầu bằng "/": ${pointer}`);
  return pointer.slice(1).split("/").map(unescapeToken);
}

export function getAt(doc: unknown, pointer: string): unknown {
  let node: unknown = doc;
  for (const token of parsePointer(pointer)) {
    if (node === null || typeof node !== "object") return undefined;
    node = (node as Record<string, unknown>)[token];
  }
  return node;
}

/** The document root is "" in RFC 6901; print it as "/" so the column is never empty. */
export function displayPointer(pointer: string): string {
  return pointer === "" ? "/" : pointer;
}
