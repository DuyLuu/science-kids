// JSON Pointer (RFC 6901) helpers.

export function escapeToken(token) {
  return String(token).replace(/~/g, "~0").replace(/\//g, "~1");
}

/** ["quiz", 0, "options"] -> "/quiz/0/options" */
export function toPointer(path) {
  return path.map((token) => `/${escapeToken(token)}`).join("");
}

export function join(pointer, ...tokens) {
  return pointer + toPointer(tokens);
}

/** The document root is "" in RFC 6901; print it as "/" so the column is never empty. */
export function displayPointer(pointer) {
  return pointer === "" ? "/" : pointer;
}

/** Keep the first error per (pointer, message). */
export function dedupe(errors) {
  const seen = new Set();
  return errors.filter((error) => {
    const id = `${error.pointer}\u0000${error.message}`;
    if (seen.has(id)) return false;
    seen.add(id);
    return true;
  });
}
