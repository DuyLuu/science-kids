#!/usr/bin/env node
/**
 * Checks that the declared schema (database/supabase/schemas/*.sql) and the deltas
 * (database/supabase/migrations/*.sql) describe the same database (technical-plan.md B5.1, SK-021).
 * No Docker and no remote database: it starts a throwaway Postgres from the local server binaries,
 * builds the schema twice (stub + schemas, stub + deltas), compares `pg_dump --schema-only` of schema
 * public (tables, constraints, indexes, RLS, policies, grants, functions, comments), then deletes it all.
 *
 *   node scripts/db-check-schema.mjs            exit 0 when both match, 1 when they differ
 *   PG_BIN=/path/to/postgres/bin node scripts/db-check-schema.mjs
 *
 * Needs initdb, pg_ctl, postgres, psql, pg_dump of one Postgres version (macOS: brew install postgresql@17;
 * any version from 14 works for this check). The Supabase pieces the SQL relies on (roles anon,
 * authenticated, service_role, schema auth with users and uid(), schema extensions, default privileges)
 * come from database/scripts/supabase-stub.sql. When that server has no pgTAP, the
 * `CREATE EXTENSION ... pgtap` line is left out on both sides.
 */

import { execFileSync, spawnSync } from 'node:child_process';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const SCHEMAS = path.join(ROOT, 'database', 'supabase', 'schemas');
const MIGRATIONS = path.join(ROOT, 'database', 'supabase', 'migrations');
const STUB = path.join(ROOT, 'database', 'scripts', 'supabase-stub.sql');

function die(message) {
  console.error(`✗ ${message}`);
  process.exit(2);
}

function findBin() {
  const candidates = [process.env.PG_BIN];
  try {
    candidates.push(execFileSync('pg_config', ['--bindir'], { encoding: 'utf8' }).trim());
  } catch {}
  try {
    const postgres = execFileSync('which', ['postgres'], { encoding: 'utf8' }).trim();
    if (postgres) candidates.push(path.dirname(fs.realpathSync(postgres)));
  } catch {}
  for (const dir of ['/opt/homebrew/opt', '/usr/local/opt']) {
    if (!fs.existsSync(dir)) continue;
    for (const name of fs.readdirSync(dir).filter((n) => /^postgresql(@\d+)?$/.test(n)).sort().reverse()) {
      candidates.push(path.join(dir, name, 'bin'));
    }
  }
  const tools = ['initdb', 'pg_ctl', 'postgres', 'psql', 'pg_dump'];
  return candidates.filter(Boolean).find((dir) => tools.every((t) => fs.existsSync(path.join(dir, t))));
}

const bin = findBin();
if (!bin) die('no local Postgres server binaries (initdb, pg_ctl, postgres, psql, pg_dump). Set PG_BIN or install postgresql.');
const tool = (name) => path.join(bin, name);

const sqlFiles = (dir) => fs.readdirSync(dir).filter((f) => f.endsWith('.sql')).sort().map((f) => path.join(dir, f));
const schemaFiles = sqlFiles(SCHEMAS);
const deltaFiles = sqlFiles(MIGRATIONS);
if (!schemaFiles.length || !deltaFiles.length) die('need at least one schema file and one delta');

const work = fs.mkdtempSync(path.join(os.tmpdir(), 'sk-schema-'));
const data = path.join(work, 'data');
const port = String(55400 + Math.floor(Math.random() * 90));
const run = (cmd, args, opts = {}) => spawnSync(cmd, args, { encoding: 'utf8', ...opts });

let started = false;
let exitCode = 2;
try {
  let r = run(tool('initdb'), ['-D', data, '-U', 'postgres', '-A', 'trust', '-E', 'UTF8', '--no-locale']);
  if (r.status !== 0) die(`initdb failed:\n${r.stderr}`);
  r = run(tool('pg_ctl'), ['-D', data, '-l', path.join(work, 'log'), '-w', '-o', `-p ${port} -c listen_addresses=127.0.0.1 -c unix_socket_directories=''`, 'start']);
  if (r.status !== 0) die(`pg_ctl start failed:\n${r.stderr}${fs.existsSync(path.join(work, 'log')) ? fs.readFileSync(path.join(work, 'log'), 'utf8') : ''}`);
  started = true;

  const psql = (db, input) =>
    run(tool('psql'), ['-h', '127.0.0.1', '-p', port, '-U', 'postgres', '-d', db, '-X', '-q', '-v', 'ON_ERROR_STOP=1', '-f', '-'], { input });
  const hasPgtap = run(tool('psql'), ['-h', '127.0.0.1', '-p', port, '-U', 'postgres', '-At', '-X', '-c',
    "SELECT count(*) FROM pg_available_extensions WHERE name = 'pgtap'"]).stdout.trim() === '1';
  const prepare = (sql) => (hasPgtap ? sql : sql.replace(/^CREATE EXTENSION IF NOT EXISTS pgtap[^;]*;/gim, '-- (pgtap not available on this server)'));
  if (!hasPgtap) console.log('• this server has no pgTAP: CREATE EXTENSION pgtap left out on both sides');

  const stub = fs.readFileSync(STUB, 'utf8');
  // Roles are cluster-wide: create them once, then only the per-database part of the stub.
  const roleSql = stub.split('\n').filter((l) => /^CREATE ROLE /.test(l)).join('\n');
  const dbStub = stub.split('\n').filter((l) => !/^CREATE ROLE /.test(l)).join('\n');
  r = psql('postgres', roleSql);
  if (r.status !== 0) die(`stub roles failed:\n${r.stderr}`);

  const build = (db, files) => {
    let res = psql('postgres', `CREATE DATABASE ${db};`);
    if (res.status !== 0) die(res.stderr);
    res = psql(db, dbStub);
    if (res.status !== 0) die(`stub failed on ${db}:\n${res.stderr}`);
    for (const f of files) {
      res = run(tool('psql'), ['-h', '127.0.0.1', '-p', port, '-U', 'postgres', '-d', db, '-X', '-q', '-1', '-v', 'ON_ERROR_STOP=1', '-f', '-'], {
        input: prepare(fs.readFileSync(f, 'utf8')),
      });
      if (res.status !== 0) die(`${path.relative(ROOT, f)} failed on ${db}:\n${res.stderr}`);
    }
    const dump = run(tool('pg_dump'), ['-h', '127.0.0.1', '-p', port, '-U', 'postgres', '-d', db, '--schema-only', '--schema=public', '--no-owner']);
    if (dump.status !== 0) die(`pg_dump ${db} failed:\n${dump.stderr}`);
    return dump.stdout
      .split('\n')
      .filter((l) => l.trim() !== '' && !l.startsWith('--') && !/^SET |^SELECT pg_catalog\.set_config/.test(l));
  };

  const fromSchemas = build('from_schemas', schemaFiles);
  const fromDeltas = build('from_deltas', deltaFiles);
  console.log(`• Postgres ${run(tool('postgres'), ['--version']).stdout.trim()} at ${bin}`);
  console.log(`• schemas: ${schemaFiles.length} file(s) · deltas: ${deltaFiles.length} file(s)`);

  const a = new Set(fromSchemas);
  const b = new Set(fromDeltas);
  const onlySchemas = fromSchemas.filter((l) => !b.has(l));
  const onlyDeltas = fromDeltas.filter((l) => !a.has(l));
  if (onlySchemas.length === 0 && onlyDeltas.length === 0 && fromSchemas.join('\n') === fromDeltas.join('\n')) {
    console.log(`\n✓ schema public is the same from schemas/ and from migrations/ (${fromSchemas.length} dump lines)`);
    exitCode = 0;
  } else {
    console.log('\n✗ schemas/ and migrations/ differ:');
    for (const l of onlySchemas.slice(0, 40)) console.log(`  only in schemas/    ${l}`);
    for (const l of onlyDeltas.slice(0, 40)) console.log(`  only in migrations/ ${l}`);
    if (!onlySchemas.length && !onlyDeltas.length) console.log('  same lines, different order');
    exitCode = 1;
  }
} finally {
  if (started) run(tool('pg_ctl'), ['-D', data, '-m', 'immediate', 'stop']);
  fs.rmSync(work, { recursive: true, force: true });
}
process.exit(exitCode);
