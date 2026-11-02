// App versions (MAJOR.MINOR.PATCH): `--min-app-version`, block `min_app_version`, and the
// format -> first app version table of src/validate/format-renderers.ts.

export function parseAppVersion(value: string): [number, number, number] | undefined {
  const match = /^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)$/.exec(value);
  return match ? [Number(match[1]), Number(match[2]), Number(match[3])] : undefined;
}

/** < 0 when a is older than b, 0 when equal, > 0 when newer. Both must parse. */
export function compareAppVersions(a: string, b: string): number {
  const [x, y] = [parseAppVersion(a)!, parseAppVersion(b)!];
  for (let i = 0; i < 3; i++) if (x[i] !== y[i]) return x[i]! - y[i]!;
  return 0;
}

/** Newest of a non-empty list. */
export function maxAppVersion(versions: string[]): string {
  return versions.reduce((best, version) => (compareAppVersions(version, best) > 0 ? version : best));
}
