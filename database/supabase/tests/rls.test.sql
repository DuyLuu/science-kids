-- SK-021 · RLS and grants seen from the app: user A never sees user B's rows, nobody writes a table
-- directly, anon reads nothing. (activity_days and quiz_answers: activity_days_quiz_answers.test.sql.)

SELECT plan(17);

CREATE TEMP TABLE t AS
SELECT u.a, u.b, '11111111-1111-4111-8111-111111111111'::uuid AS lesson_1
FROM (SELECT pg_temp.new_user(true) AS a, pg_temp.new_user(false) AS b) AS u;
ALTER TABLE t ADD COLUMN child_a uuid, ADD COLUMN child_b uuid;
UPDATE t SET child_a = pg_temp.new_child(a), child_b = pg_temp.new_child(b);
CREATE TEMP TABLE setup AS
SELECT pg_temp.submit(a, jsonb_build_array(pg_temp.attempt(gen_random_uuid(), child_a, lesson_1, '2026-10-02T02:00:00Z', 6))) AS r FROM t
UNION ALL
SELECT pg_temp.submit(b, jsonb_build_array(pg_temp.attempt(gen_random_uuid(), child_b, lesson_1, '2026-10-02T02:00:00Z', 6))) FROM t;

-- Reads.
SELECT is((SELECT pg_temp.as_user(a, 'SELECT count(*) FROM public.child_profiles') FROM t), '1', 'A sees exactly 1 profile');
SELECT is(
  (SELECT pg_temp.as_user(a, format('SELECT count(*) FROM public.child_profiles WHERE id = %L', child_b)) FROM t),
  '0',
  'A does not see the profile of B'
);
SELECT is((SELECT pg_temp.as_user(a, 'SELECT count(*) FROM public.lesson_attempts') FROM t), '1', 'A sees only its own attempt');
SELECT is(
  (SELECT pg_temp.as_user(a, format('SELECT count(*) FROM public.lesson_attempts WHERE child_id = %L', child_b)) FROM t),
  '0',
  'A does not see the attempts of B'
);
SELECT is(
  (SELECT pg_temp.as_user(a, format('SELECT count(*) FROM public.lesson_progress WHERE child_id = %L', child_b)) FROM t),
  '0',
  'A does not see the progress of B'
);
SELECT is((SELECT pg_temp.as_user(b, 'SELECT count(*) FROM public.lesson_progress') FROM t), '1', 'B (a parent account) sees its own progress');
SELECT ok((SELECT pg_temp.as_user(a, 'SELECT count(*) FROM public.app_config')::integer >= 3 FROM t), 'a signed-in user reads app_config');

-- Writes through the Data API are refused: only the RPCs write.
SELECT throws_ok(
  format($$SELECT pg_temp.as_user(%L, %L)$$, (SELECT a FROM t), format(
    'INSERT INTO public.lesson_attempts (id, child_id, lesson_id, started_at, local_date, score, max_score, duration_s) VALUES (gen_random_uuid(), %L, %L, now(), current_date, 6, 6, 60)',
    (SELECT child_a FROM t), (SELECT lesson_1 FROM t))),
  '42501', NULL,
  'authenticated cannot INSERT into lesson_attempts'
);
SELECT throws_ok(
  format($$SELECT pg_temp.as_user(%L, 'UPDATE public.lesson_progress SET stars = 3')$$, (SELECT a FROM t)),
  '42501', NULL,
  'authenticated cannot UPDATE lesson_progress'
);
SELECT throws_ok(
  format($$SELECT pg_temp.as_user(%L, 'INSERT INTO public.child_profiles (owner_id, display_name, avatar, grade, age_group, language_mode, voice_mode, timezone) VALUES (auth.uid(), ''X'', ''ech'', 3, ''discoverer'', ''bilingual'', ''both'', ''UTC'')')$$, (SELECT a FROM t)),
  '42501', NULL,
  'authenticated cannot INSERT into child_profiles'
);
SELECT throws_ok(
  format($$SELECT pg_temp.as_user(%L, 'DELETE FROM public.child_profiles')$$, (SELECT a FROM t)),
  '42501', NULL,
  'authenticated cannot DELETE child_profiles'
);
SELECT throws_ok(
  format($$SELECT pg_temp.as_user(%L, 'UPDATE public.app_config SET value = ''{}''')$$, (SELECT a FROM t)),
  '42501', NULL,
  'authenticated cannot change app_config'
);

-- Internal functions are not reachable from the app.
SELECT throws_ok(
  format($$SELECT pg_temp.as_user(%L, 'SELECT public.store_attempt(auth.uid(), ''{}''::jsonb, 0)')$$, (SELECT a FROM t)),
  '42501', NULL,
  'authenticated cannot call store_attempt'
);
SELECT throws_ok(
  format($$SELECT pg_temp.as_user(%L, 'SELECT public.compute_stars(''[]''::jsonb, ''{}''::jsonb)')$$, (SELECT a FROM t)),
  '42501', NULL,
  'authenticated cannot call the rule functions'
);

-- anon (a request with only the publishable key, no session) reads nothing.
SELECT throws_ok($$SELECT pg_temp.run_as('anon', NULL, 'SELECT count(*) FROM public.child_profiles')$$, '42501', NULL, 'anon cannot read child_profiles');
SELECT throws_ok($$SELECT pg_temp.run_as('anon', NULL, 'SELECT count(*) FROM public.app_config')$$, '42501', NULL, 'anon cannot read app_config');
SELECT throws_ok($$SELECT pg_temp.run_as('anon', NULL, 'SELECT public.get_home(gen_random_uuid())')$$, '42501', NULL, 'anon cannot call get_home');

SELECT * FROM finish();
