#!/usr/bin/env node
/**
 * Applies the deltas of database/supabase/migrations to the Supabase **staging** database and runs the
 * pgTAP tests of database/supabase/tests (technical-plan.md B5.1, SK-021). Node + psql only, no dependency.
 * Model: ise_center scripts/crm-apply-sql.mjs (connection handling, ref guard, port 6543 guard).
 *
 *   node scripts/db-apply.mjs --status      list deltas: applied on the database / pending
 *   node scripts/db-apply.mjs --dry-run     check the delta files and print what would run (connects
 *                                           when database/.env.local exists, otherwise offline)
 *   node scripts/db-apply.mjs --rehearse    run every pending delta in one transaction, then ROLLBACK
 *   node scripts/db-apply.mjs               apply pending deltas (asks to type the project ref)
 *   node scripts/db-apply.mjs --yes         apply pending deltas without asking
 *   node scripts/db-apply.mjs --test        run tests/*.test.sql (pgTAP); each file in a transaction
 *                                           that is rolled back, so no test data stays. Counts passed,
 *                                           failed, skipped (# SKIP) and todo (# TODO, not a failure) per
 *                                           file and in total; exit 1 only on a real failure, a missing
 *                                           plan line or a file that psql could not run to the end
 *   node scripts/db-apply.mjs --test --only vectors   only test files whose name contains "vectors"
 *   node scripts/db-apply.mjs --test --with-pending   run the tests on top of the pending deltas, all in the
 *                                           same rolled-back transaction: try a delta before applying it
 *   node scripts/db-apply.mjs --query "<sql>"         run SQL in a READ ONLY transaction (inspection)
 *   node scripts/db-apply.mjs --lint        plpgsql_check on every PL/pgSQL function of schema public (what
 *                                           `supabase db lint` does), pending deltas included; rolled back
 *
 * Options:
 *   --env <path>          env file, default database/.env.local (not --env-file: Node takes that one)
 *   --expect-ref <ref>    project ref the connection must contain; default SUPABASE_PROJECT_REF of the env file
 *   --allow-local         accept a database on localhost / 127.0.0.1 without a project ref (offline checks)
 *
 * Connection (database/.env.local, gitignored; copy database/.env.example):
 *   SUPABASE_PROJECT_REF   required, e.g. the staging ref
 *   SUPABASE_DB_URL        Session pooler string, port 5432: postgresql://postgres.<ref>:<pw>@aws-<n>-<region>.pooler.supabase.com:5432/postgres
 *   or SUPABASE_DB_HOST / SUPABASE_DB_PORT / SUPABASE_DB_USER / SUPABASE_DB_PASSWORD / SUPABASE_DB_NAME
 * The password only travels in PGPASSWORD: never in argv, never printed. The host is replaced by
 * <db-host> in anything printed. Port 6543 (transaction pooler) is refused: a delta is one transaction
 * of many statements. db.<ref>.supabase.co is IPv6 only, hence the session pooler.
 *
 * Each delta runs as: BEGIN; ensure supabase_migrations.schema_migrations; <file>; insert its version; COMMIT,
 * with ON_ERROR_STOP. The first error stops everything and that delta leaves nothing behind. The history
 * table is the one the Supabase CLI uses, so `supabase migration list` stays in step.
 * Delta and test files must not contain BEGIN / COMMIT / ROLLBACK of their own.
 */

import { spawnSync } from 'node:child_process';
import { randomBytes } from 'node:crypto';
import fs from 'node:fs';
import path from 'node:path';
import readline from 'node:readline';
import { fileURLToPath } from 'node:url';

const ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const MIGRATIONS_DIR = path.join(ROOT, 'database', 'supabase', 'migrations');
const TESTS_DIR = path.join(ROOT, 'database', 'supabase', 'tests');
const TEST_PRELUDE = path.join(TESTS_DIR, '_helpers.sql');

// ---------------------------------------------------------------- arguments
const argv = process.argv.slice(2);
const KNOWN = new Set(['--status', '--dry-run', '--rehearse', '--yes', '--test', '--with-pending', '--query', '--lint', '--only', '--env', '--expect-ref', '--allow-local', '--help']);
for (let i = 0; i < argv.length; i++) {
  if (!KNOWN.has(argv[i])) die(`unknown argument ${argv[i]} (see --help)`);
  if (['--only', '--env', '--expect-ref', '--query'].includes(argv[i])) i++;
}
const has = (name) => argv.includes(`--${name}`);
const getArg = (name, fallback) => {
  const i = argv.indexOf(`--${name}`);
  return i >= 0 ? argv[i + 1] : fallback;
};
if (has('help')) {
  console.log(fs.readFileSync(fileURLToPath(import.meta.url), 'utf8').split('*/')[0]);
  process.exit(0);
}
const MODES = ['status', 'dry-run', 'rehearse', 'test', 'query', 'lint'].filter(has);
if (MODES.length > 1) die(`choose one of --status, --dry-run, --rehearse, --test, --query, --lint (got ${MODES.join(', ')})`);
const MODE = MODES[0] ?? 'apply';
const YES = has('yes');
const ONLY = getArg('only');
const ENV_FILE = path.resolve(ROOT, getArg('env', 'database/.env.local'));
const ALLOW_LOCAL = has('allow-local');
const WITH_PENDING = has('with-pending');
if (WITH_PENDING && MODE !== 'test') die('--with-pending goes with --test');

function die(message) {
  console.error(`✗ ${message}`);
  process.exit(1);
}

// ---------------------------------------------------------------- SQL files
// Transaction control outside dollar-quoted bodies and comments.
function transactionControl(sql) {
  const stripped = sql
    .replace(/\$([A-Za-z_][A-Za-z0-9_]*)?\$[\s\S]*?\$\1\$/g, ' ')
    .replace(/--[^\n]*/g, ' ')
    .replace(/\/\*[\s\S]*?\*\//g, ' ');
  const m = stripped.match(/(^|;)\s*(BEGIN|COMMIT|ROLLBACK|END|START\s+TRANSACTION|SAVEPOINT|RELEASE)\b[^;]*;/i);
  return m ? m[0].replace(/^;/, '').trim() : null;
}

function readDeltas() {
  if (!fs.existsSync(MIGRATIONS_DIR)) die(`missing ${path.relative(ROOT, MIGRATIONS_DIR)}`);
  const deltas = [];
  for (const file of fs.readdirSync(MIGRATIONS_DIR).sort()) {
    if (file.startsWith('.')) continue;
    const m = file.match(/^(\d{14})_([a-z0-9_]+)\.sql$/);
    if (!m) die(`${file}: a delta is named YYYYMMDDHHMMSS_<name>.sql (Vietnam time, lower-case name)`);
    const full = path.join(MIGRATIONS_DIR, file);
    const sql = fs.readFileSync(full, 'utf8');
    const tc = transactionControl(sql);
    if (tc) die(`${file}: contains "${tc}" — db-apply wraps each delta in its own transaction`);
    deltas.push({ version: m[1], name: m[2], file, full, sql });
  }
  const seen = new Set();
  for (const d of deltas) {
    if (seen.has(d.version)) die(`two deltas share version ${d.version}`);
    seen.add(d.version);
  }
  return deltas;
}

function readTests() {
  if (!fs.existsSync(TESTS_DIR)) die(`missing ${path.relative(ROOT, TESTS_DIR)}`);
  const files = fs
    .readdirSync(TESTS_DIR)
    .filter((f) => f.endsWith('.test.sql'))
    .filter((f) => !ONLY || f.includes(ONLY))
    .sort();
  if (files.length === 0) die(`no *.test.sql${ONLY ? ` matching "${ONLY}"` : ''} in ${path.relative(ROOT, TESTS_DIR)}`);
  return files.map((file) => {
    const sql = fs.readFileSync(path.join(TESTS_DIR, file), 'utf8');
    const tc = transactionControl(sql);
    if (tc) die(`${file}: contains "${tc}" — db-apply --test wraps each file in a transaction and rolls it back`);
    return { file, sql };
  });
}

const HISTORY_SQL = `
CREATE SCHEMA IF NOT EXISTS supabase_migrations;
CREATE TABLE IF NOT EXISTS supabase_migrations.schema_migrations (version text NOT NULL PRIMARY KEY);
ALTER TABLE supabase_migrations.schema_migrations ADD COLUMN IF NOT EXISTS statements text[];
ALTER TABLE supabase_migrations.schema_migrations ADD COLUMN IF NOT EXISTS name text;
`;

function dollarQuote(text) {
  let tag;
  do tag = `$sk_${randomBytes(6).toString('hex')}$`;
  while (text.includes(tag));
  return `${tag}${text}${tag}`;
}

function deltaSql(d) {
  return [
    `-- ${d.file}`,
    'SET LOCAL statement_timeout = 0;',
    d.sql,
    ';',
    `INSERT INTO supabase_migrations.schema_migrations (version, name, statements) VALUES ('${d.version}', '${d.name}', ARRAY[${dollarQuote(d.sql)}]);`,
  ].join('\n');
}

// ---------------------------------------------------------------- connection
function readEnvFile(file) {
  if (!fs.existsSync(file)) return null;
  const out = {};
  for (const line of fs.readFileSync(file, 'utf8').split('\n')) {
    const m = line.match(/^\s*([A-Z0-9_]+)\s*=\s*(.*)$/);
    if (m) out[m[1]] = m[2].trim().replace(/^["'](.*)["']$/, '$1');
  }
  return out;
}

function connect() {
  const env = readEnvFile(ENV_FILE);
  if (!env) return null;
  const ref = getArg('expect-ref', env.SUPABASE_PROJECT_REF);
  let conn;
  if (env.SUPABASE_DB_URL) {
    let u;
    try {
      u = new URL(env.SUPABASE_DB_URL);
    } catch {
      die(`SUPABASE_DB_URL in ${path.relative(ROOT, ENV_FILE)} is not a valid URL`);
    }
    const password = decodeURIComponent(u.password ?? '');
    u.password = '';
    conn = {
      args: ['-d', u.toString()],
      password,
      host: u.hostname,
      port: Number(u.port || 5432),
      user: decodeURIComponent(u.username || ''),
      db: u.pathname.replace(/^\//, '') || 'postgres',
      sslmode: u.searchParams.get('sslmode'),
    };
  } else if (env.SUPABASE_DB_HOST) {
    const port = Number(env.SUPABASE_DB_PORT ?? 5432);
    const user = env.SUPABASE_DB_USER ?? (ref ? `postgres.${ref}` : 'postgres');
    const db = env.SUPABASE_DB_NAME ?? 'postgres';
    conn = { args: ['-h', env.SUPABASE_DB_HOST, '-p', String(port), '-U', user, '-d', db], password: env.SUPABASE_DB_PASSWORD ?? '', host: env.SUPABASE_DB_HOST, port, user, db };
  } else {
    die(`${path.relative(ROOT, ENV_FILE)} has neither SUPABASE_DB_URL nor SUPABASE_DB_HOST (see database/.env.example)`);
  }

  const local = ['localhost', '127.0.0.1', '::1', '[::1]'].includes(conn.host);
  if (conn.port === 6543) die('port 6543 is the transaction pooler: use the Session pooler string (port 5432)');
  if (local && !ALLOW_LOCAL) die('the connection points to localhost: add --allow-local for an offline check');
  if (!local) {
    if (!ref) die(`SUPABASE_PROJECT_REF is missing in ${path.relative(ROOT, ENV_FILE)}`);
    if (!conn.host.includes(ref) && !conn.user.includes(ref)) {
      die(`the connection does not contain the project ref "${ref}" — refusing to touch another database`);
    }
  }
  conn.ref = local ? null : ref;
  conn.label = local ? `local ${conn.host}:${conn.port}/${conn.db}` : `project ${ref} (${conn.host.includes('pooler') ? 'session pooler' : 'direct'}, port ${conn.port}, db ${conn.db})`;
  conn.env = {
    ...process.env,
    PGPASSWORD: conn.password,
    PGSSLMODE: conn.sslmode ?? process.env.PGSSLMODE ?? (local ? 'disable' : 'require'),
    PGCONNECT_TIMEOUT: process.env.PGCONNECT_TIMEOUT ?? '15',
    PGAPPNAME: 'science-kids db-apply',
  };
  return conn;
}

function redact(conn, text) {
  let out = text ?? '';
  if (conn?.password) out = out.split(conn.password).join('<password>');
  if (conn?.host) out = out.split(conn.host).join('<db-host>');
  return out;
}

function psql(conn, sql, { tuples = false } = {}) {
  const args = [...conn.args, '-X', '-q', '-v', 'ON_ERROR_STOP=1'];
  if (tuples) args.push('-A', '-t');
  args.push('-f', '-');
  const r = spawnSync('psql', args, { env: conn.env, input: sql, encoding: 'utf8', maxBuffer: 256 * 1024 * 1024 });
  if (r.error) die(`cannot run psql: ${r.error.message} (macOS: brew install libpq && brew link --force libpq)`);
  return { ok: r.status === 0, status: r.status, out: redact(conn, r.stdout).trim(), err: redact(conn, r.stderr).trim() };
}

function query(conn, sql) {
  const r = psql(conn, sql, { tuples: true });
  if (!r.ok) die(`psql failed:\n${r.err || r.out}`);
  return r.out;
}

function appliedVersions(conn) {
  const exists = query(conn, "SELECT to_regclass('supabase_migrations.schema_migrations') IS NOT NULL;");
  if (exists !== 't') return new Map();
  const rows = query(conn, "SELECT version || '|' || coalesce(name, '') FROM supabase_migrations.schema_migrations ORDER BY version;");
  return new Map(rows ? rows.split('\n').map((l) => l.split('|')) : []);
}

// ---------------------------------------------------------------- main
const deltas = (MODE === 'test' && !WITH_PENDING) || MODE === 'query' ? [] : readDeltas();
const conn = connect();
if (!conn) {
  if (MODE !== 'dry-run') die(`no ${path.relative(ROOT, ENV_FILE)}: copy database/.env.example and fill it in (Duy)`);
  console.log(`• no ${path.relative(ROOT, ENV_FILE)}: offline check only`);
  console.log(`• ${deltas.length} delta file(s), names and content checked (no BEGIN/COMMIT of their own):`);
  for (const d of deltas) console.log(`    ${d.file}  ${(d.sql.length / 1024).toFixed(1)} KB`);
  console.log('\n(--dry-run offline: which ones are pending needs a connection)');
  process.exit(0);
}

const [server, who] = query(conn, "SELECT current_setting('server_version'); SELECT current_database() || ' as ' || current_user;").split('\n');
console.log(`• target  ${conn.label}`);
console.log(`• server  PostgreSQL ${server} · ${who}`);

if (MODE === 'query') {
  const text = getArg('query', '');
  const tc = transactionControl(text);
  if (tc) die(`--query cannot contain "${tc}": it runs inside one READ ONLY transaction`);
  const r = psql(conn, `BEGIN READ ONLY;\n${text}\n;\nROLLBACK;`);
  if (r.out) console.log(r.out);
  if (!r.ok) die(`query failed:\n${r.err}`);
  process.exit(0);
}

if (MODE === 'lint') {
  const done = appliedVersions(conn);
  const todo = deltas.filter((d) => !done.has(d.version));
  if (todo.length) console.log(`• with ${todo.length} pending delta(s), rolled back: ${todo.map((d) => d.file).join(', ')}`);
  const lintSql = [
    'BEGIN;',
    todo.length ? [HISTORY_SQL, ...todo.map(deltaSql)].join('\n') : '',
    'CREATE EXTENSION IF NOT EXISTS plpgsql_check;',
    `SELECT p.oid::regprocedure || ' | ' || r.level || ' | ' || coalesce(r.lineno::text, '-') || ' | ' || coalesce(r.sqlstate, '') || ' | ' || r.message
       FROM pg_catalog.pg_proc AS p
       JOIN pg_catalog.pg_namespace AS n ON n.oid = p.pronamespace
       JOIN pg_catalog.pg_language AS l ON l.oid = p.prolang
       CROSS JOIN LATERAL plpgsql_check_function_tb(p.oid) AS r
      WHERE n.nspname = 'public' AND l.lanname = 'plpgsql'
        AND p.prorettype NOT IN ('pg_catalog.trigger'::regtype, 'pg_catalog.event_trigger'::regtype)
      ORDER BY 1;`,
    `SELECT 'checked ' || count(*) FROM pg_catalog.pg_proc AS p JOIN pg_catalog.pg_namespace AS n ON n.oid = p.pronamespace
       JOIN pg_catalog.pg_language AS l ON l.oid = p.prolang
      WHERE n.nspname = 'public' AND l.lanname = 'plpgsql'
        AND p.prorettype NOT IN ('pg_catalog.trigger'::regtype, 'pg_catalog.event_trigger'::regtype);`,
    'ROLLBACK;',
  ].join('\n');
  const r = psql(conn, lintSql, { tuples: true });
  if (!r.ok) die(`lint failed to run:\n${r.err}`);
  const lines = r.out.split('\n').filter(Boolean);
  const findings = lines.filter((l) => l.includes(' | '));
  const errors = findings.filter((l) => l.split(' | ')[1] === 'error');
  for (const l of findings) console.log(`  ${l}`);
  console.log(`\n${errors.length ? '✗' : '✓'} lint: ${lines.find((l) => l.startsWith('checked')) ?? ''} PL/pgSQL function(s), ${errors.length} error(s), ${findings.length - errors.length} warning(s). Rolled back.`);
  process.exit(errors.length ? 1 : 0);
}

if (MODE === 'test') {
  const tests = readTests();
  const prelude = fs.existsSync(TEST_PRELUDE) ? fs.readFileSync(TEST_PRELUDE, 'utf8') : '';
  let pendingSql = '';
  if (WITH_PENDING) {
    const done = appliedVersions(conn);
    const todo = deltas.filter((d) => !done.has(d.version));
    console.log(`• with ${todo.length} pending delta(s), rolled back with each file: ${todo.map((d) => d.file).join(', ') || '(none)'}`);
    pendingSql = todo.length ? [HISTORY_SQL, ...todo.map(deltaSql)].join('\n') : '';
  }
  const sum = { passed: 0, failed: 0, skipped: 0, todo: 0, todoPassing: 0 };
  let brokenFiles = 0;
  for (const t of tests) {
    const sql = ['BEGIN;', pendingSql, 'SET LOCAL search_path TO "$user", public, extensions;', prelude, t.sql, 'ROLLBACK;'].join('\n');
    const r = psql(conn, sql, { tuples: true });
    const lines = r.out.split('\n');
    const planLine = lines.find((l) => /^1\.\.\d+$/.test(l));
    const planned = planLine ? Number(planLine.slice(3)) : null;
    const results = lines.map(tapResult).filter(Boolean);
    const count = (kind) => results.filter((x) => x.kind === kind).length;
    const n = { passed: count('pass'), failed: count('fail'), skipped: count('skip'), todo: count('todo') };
    const todoPassing = results.filter((x) => x.kind === 'todo' && x.ok).length;
    for (const k of Object.keys(n)) sum[k] += n[k];
    sum.todoPassing += todoPassing;
    const complete = planned !== null && results.length === planned;
    const good = r.ok && complete && n.failed === 0;
    if (!good) brokenFiles++;
    console.log(`${good ? '✓' : '✗'} ${t.file.padEnd(42)} ${n.passed}/${planned ?? '?'} passed, ${n.failed} failed, ${n.skipped} skipped, ${n.todo} todo`);
    // Skips and todos are not failures, but they are listed so nobody mistakes them for passes.
    for (const x of results) {
      if (x.kind === 'skip') console.log(`    skip  ${x.line}`);
      if (x.kind === 'todo') console.log(`    todo  ${x.line}${x.ok ? '   <- passing now: the todo can go' : ''}`);
    }
    if (!good) {
      for (const l of lines) if (tapResult(l)?.kind === 'fail' || /^#/.test(l)) console.log(`    ${l}`);
      if (!complete && r.ok) console.log(`    planned ${planned ?? 'no plan'}, ran ${results.length}`);
      if (!r.ok) console.log(`    psql stopped (exit ${r.status}):\n${(r.err || '').split('\n').map((l) => `      ${l}`).join('\n')}`);
    }
  }
  const total = sum.passed + sum.failed + sum.skipped + sum.todo;
  console.log(
    `\n${brokenFiles === 0 ? '✓' : '✗'} pgTAP: ${tests.length} files, ${total} assertions: ${sum.passed} passed, ${sum.failed} failed, ` +
      `${sum.skipped} skipped, ${sum.todo} todo${sum.todoPassing ? ` (${sum.todoPassing} passing now)` : ''}; ` +
      `${brokenFiles} file(s) not green. Every file was rolled back.`,
  );
  process.exit(brokenFiles === 0 ? 0 : 1);
}

// One TAP test line -> { kind: pass | fail | skip | todo, ok, line }, anything else -> null.
// The directive is the first unescaped "#" followed by SKIP or TODO (any case, TAP 13):
//   ok N … # SKIP why       skip   (pgTAP skip())
//   not ok N … # TODO why   todo   (pgTAP todo(): expected to fail, not a failure)
//   ok N … # TODO why       todo   that passes now (ok: true)
//   not ok N … # SKIP why   fail   (a skip must be "ok")
function tapResult(line) {
  const m = line.match(/^(not )?ok \d+(.*)$/);
  if (!m) return null;
  const ok = !m[1];
  const directive = m[2].match(/(?:^|[^\\])#\s*(skip|todo)/i)?.[1].toLowerCase();
  if (directive === 'todo') return { kind: 'todo', ok, line };
  if (directive === 'skip' && ok) return { kind: 'skip', ok, line };
  return { kind: ok ? 'pass' : 'fail', ok, line };
}

const applied = appliedVersions(conn);
const pending = deltas.filter((d) => !applied.has(d.version));
const unknown = [...applied.keys()].filter((v) => !deltas.some((d) => d.version === v));

if (MODE === 'status') {
  for (const d of deltas) console.log(`  ${applied.has(d.version) ? 'applied' : 'pending'}  ${d.file}`);
  for (const v of unknown) console.log(`  remote   ${v}_${applied.get(v)}  (on the database, no local file)`);
  console.log(`\n${applied.size} applied, ${pending.length} pending${unknown.length ? `, ${unknown.length} only on the database` : ''}.`);
  process.exit(0);
}

if (unknown.length) die(`the database has versions with no local delta: ${unknown.join(', ')} — pull them into the repo first`);
const lastApplied = [...applied.keys()].sort().at(-1);
const outOfOrder = pending.filter((d) => lastApplied && d.version < lastApplied);
if (outOfOrder.length) die(`pending delta older than the last applied one (${lastApplied}): ${outOfOrder.map((d) => d.file).join(', ')}`);

console.log(`• ${pending.length} pending delta(s):`);
for (const d of pending) console.log(`    ${d.file}  ${(d.sql.length / 1024).toFixed(1)} KB`);
if (pending.length === 0) {
  console.log('\n✓ nothing to apply');
  process.exit(0);
}
if (MODE === 'dry-run') {
  console.log('\n(--dry-run: nothing written)');
  process.exit(0);
}

if (MODE === 'rehearse') {
  const sql = ['BEGIN;', HISTORY_SQL, ...pending.map(deltaSql), 'ROLLBACK;'].join('\n');
  const r = psql(conn, sql);
  if (!r.ok) {
    console.error(`\n✗ rehearsal failed — nothing written:\n${r.err || r.out}`);
    process.exit(1);
  }
  console.log(`\n✓ rehearsal: ${pending.length} delta(s) ran in one transaction and were rolled back — database unchanged`);
  process.exit(0);
}

if (!YES) {
  const rl = readline.createInterface({ input: process.stdin, output: process.stdout });
  const expected = conn.ref ?? 'local';
  const answer = await new Promise((resolve) => rl.question(`\nType "${expected}" to apply to ${conn.label}: `, (a) => (rl.close(), resolve(a.trim()))));
  if (answer !== expected) die('cancelled');
}

for (const d of pending) {
  const started = Date.now();
  process.stdout.write(`▶ ${d.file} … `);
  const r = psql(conn, ['BEGIN;', HISTORY_SQL, deltaSql(d), 'COMMIT;'].join('\n'));
  const secs = ((Date.now() - started) / 1000).toFixed(1);
  if (!r.ok) {
    console.log(`ERROR after ${secs}s`);
    console.error(r.err || r.out);
    console.error(`\n✗ stopped at ${d.file}: its transaction was rolled back; earlier deltas stay applied.`);
    process.exit(1);
  }
  console.log(`ok ${secs}s`);
}
console.log(`\n✓ applied ${pending.length} delta(s) to ${conn.label}`);
