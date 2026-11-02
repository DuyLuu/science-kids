-- SK-021 T2 · RLS and grants, edge cases: B's activity_days and quiz_answers stay hidden from A, no direct write to any
-- progress table, anon reads and calls nothing, internal functions are not reachable, policies are SELECT only.

SELECT plan(37);

CREATE TEMP TABLE t AS
SELECT pg_temp.new_user(true) AS a, pg_temp.new_user(true) AS b, pg_temp.new_user(true) AS nobody,
       '11111111-1111-4111-8111-111111111111'::uuid AS l1;
ALTER TABLE t ADD COLUMN ca uuid, ADD COLUMN cb uuid;
UPDATE t SET ca = pg_temp.new_child(a), cb = pg_temp.new_child(b);
CREATE TEMP TABLE setup AS
SELECT pg_temp.submit(a, jsonb_build_array(pg_temp.attempt(gen_random_uuid(), ca, l1, '2026-10-02T02:00:00Z', 6))) AS ra,
       pg_temp.submit(b, jsonb_build_array(pg_temp.attempt(gen_random_uuid(), cb, l1, '2026-10-02T02:00:00Z', 6))) AS rb
FROM t;
SELECT is((SELECT ra ->> 'success' || '/' || (rb ->> 'success') FROM setup), 'true/true', 'setup: A and B each have an attempt with answers and an activity day');

-- 1. Each owner sees their own rows in every table (so the zeros below are RLS, not empty tables).
SELECT is(
  (SELECT pg_temp.as_user(a, 'SELECT concat_ws(''/'', (SELECT count(*) FROM public.child_profiles), (SELECT count(*) FROM public.lesson_attempts), (SELECT count(*) FROM public.lesson_progress), (SELECT count(*) FROM public.activity_days), (SELECT count(*) FROM public.quiz_answers))') FROM t),
  '1/1/1/1/6',
  'A sees exactly its own rows: 1 profile, 1 attempt, 1 progress, 1 activity day, 6 answers'
);
SELECT is(
  (SELECT pg_temp.as_user(b, 'SELECT concat_ws(''/'', (SELECT count(*) FROM public.child_profiles), (SELECT count(*) FROM public.lesson_attempts), (SELECT count(*) FROM public.lesson_progress), (SELECT count(*) FROM public.activity_days), (SELECT count(*) FROM public.quiz_answers))') FROM t),
  '1/1/1/1/6',
  'B sees exactly its own rows'
);

-- 2. A cannot reach B's rows by any predicate.
SELECT is(
  (SELECT pg_temp.as_user(a, format('SELECT count(*) FROM public.activity_days WHERE child_id = %L', cb)) FROM t), '0',
  'A does not see the activity days of B');
SELECT is(
  (SELECT pg_temp.as_user(a, format('SELECT count(*) FROM public.quiz_answers WHERE attempt_id IN (SELECT id FROM public.lesson_attempts WHERE child_id = %L)', cb)) FROM t), '0',
  'A does not see the quiz answers of B (through the attempts of B)');
SELECT is(
  (SELECT pg_temp.as_user(a, format('SELECT count(*) FROM public.quiz_answers WHERE attempt_id = %L', (SELECT (rb #>> '{data,results,0,id}')::uuid FROM setup))) FROM t), '0',
  'A does not see the quiz answers of B by attempt id');
SELECT is(
  (SELECT pg_temp.as_user(a, format('SELECT count(*) FROM public.lesson_attempts WHERE id = %L', (SELECT (rb #>> '{data,results,0,id}')::uuid FROM setup))) FROM t), '0',
  'A does not see the attempt of B by id');
SELECT is(
  (SELECT pg_temp.as_user(a, 'SELECT count(*) FROM public.child_profiles WHERE owner_id <> auth.uid()') FROM t), '0',
  'A does not see a profile with another owner');
SELECT is(
  (SELECT pg_temp.as_user(nobody, 'SELECT concat_ws(''/'', (SELECT count(*) FROM public.child_profiles), (SELECT count(*) FROM public.lesson_attempts), (SELECT count(*) FROM public.lesson_progress), (SELECT count(*) FROM public.activity_days), (SELECT count(*) FROM public.quiz_answers))') FROM t),
  '0/0/0/0/0',
  'a signed-in user without a profile sees no row at all'
);
SELECT is(
  (SELECT pg_temp.run_as('authenticated', NULL, 'SELECT concat_ws(''/'', (SELECT count(*) FROM public.child_profiles), (SELECT count(*) FROM public.lesson_attempts), (SELECT count(*) FROM public.lesson_progress), (SELECT count(*) FROM public.activity_days), (SELECT count(*) FROM public.quiz_answers))')),
  '0/0/0/0/0',
  'the authenticated role with no sub claim sees no row (auth.uid() is null)'
);

-- 3. Direct writes are refused for authenticated, in every table, for every statement kind.
CREATE TEMP TABLE w (label text, stmt text);
INSERT INTO w SELECT 'UPDATE ' || x, format('UPDATE public.%I SET %s', x, y)
FROM (VALUES ('lesson_attempts', 'score = 6'), ('lesson_progress', 'stars = 3'), ('activity_days', 'minutes = 0'),
             ('quiz_answers', 'points = 1'), ('child_profiles', 'archived_at = NULL'),
             ('app_config', 'min_app_version = ''1.0''')) AS v(x, y);
INSERT INTO w SELECT 'DELETE ' || x, format('DELETE FROM public.%I', x)
FROM (VALUES ('lesson_attempts'), ('lesson_progress'), ('activity_days'), ('quiz_answers'), ('child_profiles'), ('app_config')) AS v(x);
INSERT INTO w VALUES
  ('INSERT lesson_progress', format('INSERT INTO public.lesson_progress (child_id, lesson_id, stars) VALUES (%L, gen_random_uuid(), 3)', (SELECT ca FROM t))),
  ('INSERT activity_days', format('INSERT INTO public.activity_days (child_id, local_date, minutes, lessons_completed) VALUES (%L, current_date, 1, 1)', (SELECT ca FROM t))),
  ('INSERT quiz_answers', format('INSERT INTO public.quiz_answers (attempt_id, item_id, slot, item_order, correct, points, tries) VALUES (%L, gen_random_uuid(), ''quiz'', 1, true, 1, 1)', (SELECT (ra #>> '{data,results,0,id}')::uuid FROM setup))),
  ('INSERT app_config', 'INSERT INTO public.app_config (key, value) VALUES (''rules.hacked'', ''{}'')'),
  ('TRUNCATE lesson_attempts', 'TRUNCATE public.lesson_attempts'),
  ('TRUNCATE child_profiles', 'TRUNCATE public.child_profiles CASCADE');
-- Runs one write statement as authenticated and returns its SQLSTATE ('ran' when it did not fail).
CREATE FUNCTION pg_temp.try_write(p_user uuid, p_stmt text) RETURNS text LANGUAGE plpgsql AS $$
BEGIN
  PERFORM set_config('request.jwt.claims', jsonb_build_object('sub', p_user, 'role', 'authenticated')::text, true);
  SET LOCAL ROLE authenticated;
  EXECUTE p_stmt;
  RESET ROLE;
  RETURN 'ran';
EXCEPTION WHEN OTHERS THEN
  RESET ROLE;
  RETURN SQLSTATE;
END $$;
SELECT is(
  (SELECT jsonb_agg(label ORDER BY label) FROM w WHERE pg_temp.try_write((SELECT a FROM t), stmt) <> '42501'),
  NULL::jsonb,
  'every direct UPDATE / DELETE / INSERT / TRUNCATE by authenticated is 42501 (permission denied)'
);
SELECT is(
  (SELECT concat_ws('/', (SELECT count(*) FROM public.child_profiles WHERE id IN (SELECT ca FROM t UNION SELECT cb FROM t)),
                         (SELECT count(*) FROM public.lesson_attempts WHERE child_id IN (SELECT ca FROM t UNION SELECT cb FROM t)),
                         (SELECT count(*) FROM public.app_config WHERE key = 'rules.hacked'))),
  '2/2/0',
  'after the write attempts nothing changed or appeared'
);

-- 4. Privileges on the tables, seen from the catalog.
SELECT is(
  (SELECT jsonb_agg(t.x ORDER BY t.x)
   FROM (VALUES ('child_profiles'), ('lesson_attempts'), ('lesson_progress'), ('activity_days'), ('quiz_answers'), ('app_config')) AS t(x)
   WHERE has_table_privilege('authenticated', 'public.' || t.x, 'INSERT,UPDATE,DELETE,TRUNCATE,REFERENCES,TRIGGER')
      OR NOT has_table_privilege('authenticated', 'public.' || t.x, 'SELECT')),
  NULL::jsonb,
  'authenticated has SELECT and nothing else on the 6 tables'
);
SELECT is(
  (SELECT jsonb_agg(t.x ORDER BY t.x)
   FROM (VALUES ('child_profiles'), ('lesson_attempts'), ('lesson_progress'), ('activity_days'), ('quiz_answers'), ('app_config')) AS t(x)
   WHERE has_table_privilege('anon', 'public.' || t.x, 'SELECT,INSERT,UPDATE,DELETE,TRUNCATE,REFERENCES,TRIGGER')),
  NULL::jsonb,
  'anon has no privilege on the 6 tables'
);
SELECT is(
  (SELECT jsonb_agg(c.relname ORDER BY c.relname) FROM pg_class AS c
   WHERE c.relnamespace = 'public'::regnamespace AND c.relkind = 'r' AND NOT c.relrowsecurity),
  NULL::jsonb,
  'every table of schema public has RLS enabled'
);
SELECT is(
  (SELECT jsonb_agg(p.tablename || '.' || p.policyname || ':' || p.cmd || ':' || p.roles::text ORDER BY p.tablename, p.policyname)
   FROM pg_policies AS p WHERE p.schemaname = 'public' AND (p.cmd <> 'SELECT' OR p.roles <> ARRAY['authenticated']::name[])),
  NULL::jsonb,
  'every policy of schema public is FOR SELECT TO authenticated (no write policy, no policy for anon or public)'
);
-- 5. anon: no table, no RPC, no internal function.
SELECT throws_ok($$SELECT pg_temp.run_as('anon', NULL, 'SELECT count(*) FROM public.lesson_attempts')$$, '42501', NULL, 'anon cannot read lesson_attempts');
SELECT throws_ok($$SELECT pg_temp.run_as('anon', NULL, 'SELECT count(*) FROM public.lesson_progress')$$, '42501', NULL, 'anon cannot read lesson_progress');
SELECT throws_ok($$SELECT pg_temp.run_as('anon', NULL, 'SELECT count(*) FROM public.activity_days')$$, '42501', NULL, 'anon cannot read activity_days');
SELECT throws_ok($$SELECT pg_temp.run_as('anon', NULL, 'SELECT count(*) FROM public.quiz_answers')$$, '42501', NULL, 'anon cannot read quiz_answers');
SELECT throws_ok($$SELECT pg_temp.run_as('anon', NULL, 'SELECT public.submit_attempts(''[{}]''::jsonb)')$$, '42501', NULL, 'anon cannot call submit_attempts');
SELECT throws_ok($$SELECT pg_temp.run_as('anon', NULL, 'SELECT public.get_home(gen_random_uuid())')$$, '42501', NULL, 'anon cannot call get_home');
SELECT throws_ok(
  $$SELECT pg_temp.run_as('anon', NULL, 'SELECT public.create_child_profile(''A'', ''ech'', 3, ''bilingual'', ''both'', ''UTC'')')$$,
  '42501', NULL, 'anon cannot call create_child_profile');
SELECT throws_ok(
  $$SELECT pg_temp.run_as('anon', gen_random_uuid(), 'SELECT public.get_home(gen_random_uuid())')$$,
  '42501', NULL, 'anon with a sub claim (a forged-looking request on the anon key) still cannot call get_home');

-- 6. Internal functions are not reachable from a signed-in user, and the three RPCs are not reachable by PUBLIC.
SELECT is(
  (SELECT jsonb_agg(p.proname || '(' || pg_get_function_identity_arguments(p.oid) || ')' ORDER BY p.proname)
   FROM pg_proc AS p
   WHERE p.pronamespace = 'public'::regnamespace AND p.prokind = 'f' AND p.prorettype <> 'event_trigger'::regtype
     AND p.proname NOT IN ('create_child_profile', 'submit_attempts', 'get_home')
     AND (has_function_privilege('authenticated', p.oid, 'EXECUTE') OR has_function_privilege('anon', p.oid, 'EXECUTE'))),
  NULL::jsonb,
  'authenticated and anon can execute only the 3 RPCs of schema public'
);
SELECT is(
  (SELECT jsonb_agg(p.proname ORDER BY p.proname) FROM pg_proc AS p
   WHERE p.proname IN ('create_child_profile', 'submit_attempts', 'get_home') AND p.pronamespace = 'public'::regnamespace
     AND NOT (has_function_privilege('authenticated', p.oid, 'EXECUTE') AND NOT has_function_privilege('anon', p.oid, 'EXECUTE'))),
  NULL::jsonb,
  'the 3 RPCs are executable by authenticated and not by anon'
);
SELECT throws_ok(
  format($$SELECT pg_temp.as_user(%L, %L)$$, (SELECT a FROM t), format('SELECT public.refresh_lesson_progress(%L, %L, ''{}''::jsonb)', (SELECT cb FROM t), (SELECT l1 FROM t))),
  '42501', NULL,
  'A cannot call refresh_lesson_progress on the child of B'
);
SELECT throws_ok(
  format($$SELECT pg_temp.as_user(%L, %L)$$, (SELECT a FROM t), format('SELECT public.refresh_activity_day(%L, current_date)', (SELECT cb FROM t))),
  '42501', NULL,
  'A cannot call refresh_activity_day on the child of B'
);
SELECT throws_ok(
  format($$SELECT pg_temp.as_user(%L, %L)$$, (SELECT a FROM t), format('SELECT public.store_attempt(%L, ''{}''::jsonb, 0)', (SELECT b FROM t))),
  '42501', NULL,
  'A cannot call store_attempt with the owner id of B'
);

-- 7. The RPCs do not let A touch or learn about B.
CREATE TEMP TABLE r_conflict AS
SELECT pg_temp.rpc(nobody, format($$SELECT public.create_child_profile('Spy', 'ech', 3, 'bilingual', 'both', 'UTC', %L)$$, cb)) AS r FROM t;
SELECT is(
  (SELECT jsonb_build_object('success', r -> 'success', 'code', r -> 'error_code', 'data', r -> 'data') FROM r_conflict),
  '{"success": false, "code": "id_conflict", "data": null}'::jsonb,
  'create_child_profile with the p_id of B: id_conflict and no data of B in the answer'
);
SELECT is(
  (SELECT display_name FROM public.child_profiles WHERE id = (SELECT cb FROM t)), 'Minh', 'the profile of B is unchanged');
SELECT is(
  (SELECT pg_temp.submit(a, jsonb_build_array(
     pg_temp.attempt((SELECT (rb #>> '{data,results,0,id}')::uuid FROM setup), ca, l1, '2026-10-02T02:00:00Z', 1))) #>> '{data,results,0,error_code}' FROM t),
  'id_conflict',
  'A replays the attempt id of B on its own child: id_conflict'
);
SELECT is(
  (SELECT jsonb_build_object('score', score, 'child', child_id = (SELECT cb FROM t)) FROM public.lesson_attempts WHERE id = (SELECT (rb #>> '{data,results,0,id}')::uuid FROM setup)),
  '{"score": 6, "child": true}'::jsonb,
  'the attempt of B was not changed or moved'
);
SELECT is(
  (SELECT pg_temp.submit(a, jsonb_build_array(
     pg_temp.attempt(gen_random_uuid(), cb, l1, '2026-10-03T02:00:00Z', 6))) #>> '{data,results,0,error_code}' FROM t),
  'child_not_found',
  'A writing an attempt to the child of B: child_not_found'
);
SELECT is(
  (SELECT jsonb_build_object('rejected', r #>> '{data,results,0,error_code}', 'progress', r #> '{data,progress}')
   FROM (SELECT pg_temp.submit(a, jsonb_build_array(pg_temp.attempt(gen_random_uuid(), cb, l1, '2026-10-03T02:00:00Z', 6))) AS r FROM t) AS x),
  '{"rejected": "child_not_found", "progress": []}'::jsonb,
  'a rejected attempt of B''s child returns no progress of B'
);
SELECT is(
  (SELECT count(*)::integer FROM public.lesson_attempts WHERE child_id = (SELECT cb FROM t)),
  1,
  'B still has exactly its 1 attempt'
);

-- 8. A guest and a parent account are the same for RLS: the parent (not anonymous) sees its own rows only.
CREATE TEMP TABLE tp AS SELECT pg_temp.new_user(false) AS p;
SELECT is(
  (SELECT pg_temp.as_user(p, 'SELECT count(*) FROM public.child_profiles') FROM tp), '0', 'a parent account without profile sees no profile of the guests');

SELECT * FROM finish();
