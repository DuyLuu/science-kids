-- SK-021 · get_home: progress, totals, day streak and minutes of today in the child's time zone.
-- Attempts are placed relative to now() so "today" is the real local day of the test run.

SELECT plan(14);

CREATE TEMP TABLE t AS
SELECT u.a, u.b,
       '11111111-1111-4111-8111-111111111111'::uuid AS lesson_1,
       '22222222-2222-4222-8222-222222222222'::uuid AS lesson_2,
       public.local_date(now(), 'Asia/Ho_Chi_Minh') AS today
FROM (SELECT pg_temp.new_user(true) AS a, pg_temp.new_user(true) AS b) AS u;
ALTER TABLE t ADD COLUMN child_a uuid, ADD COLUMN child_b uuid;
UPDATE t SET child_a = pg_temp.new_child(a), child_b = pg_temp.new_child(b);

-- Fresh profile: nothing played yet.
CREATE TEMP TABLE h0 AS SELECT pg_temp.rpc(a, format('SELECT public.get_home(%L)', child_a)) AS r FROM t;
SELECT is((SELECT pg_temp.keys(r) FROM h0), ARRAY['data', 'error', 'error_code', 'success'], 'result is {success, error_code, error, data}');
SELECT is(
  (SELECT pg_temp.keys(r -> 'data') FROM h0),
  ARRAY['child', 'last_lesson_id', 'lessons', 'minutes_today', 'streak', 'today', 'total_stars', 'total_xp'],
  'data keys'
);
SELECT is(
  (SELECT (r -> 'data') - 'child' - 'today' FROM h0),
  '{"lessons": [], "total_stars": 0, "total_xp": 0, "last_lesson_id": null, "minutes_today": 0,
    "streak": {"studied_days": 0, "chain_start": null, "rest_days": [], "studied_today": false}}'::jsonb,
  'a new profile has no progress and no streak'
);
SELECT is((SELECT r #>> '{data,today}' FROM h0), (SELECT today::text FROM t), 'today is the local date of the profile');
SELECT is((SELECT r #>> '{data,child,id}' FROM h0), (SELECT child_a::text FROM t), 'child is the profile');

-- Play on three days in a row: two days ago, yesterday (lesson 1 twice), today (lesson 2).
SELECT is(
  (SELECT jsonb_agg(e ->> 'status') FROM t, jsonb_array_elements(pg_temp.submit(a, jsonb_build_array(
     pg_temp.attempt(gen_random_uuid(), child_a, lesson_1, now() - interval '2 days', 6),
     pg_temp.attempt(gen_random_uuid(), child_a, lesson_1, now() - interval '1 day', 6),
     pg_temp.attempt(gen_random_uuid(), child_a, lesson_2, now() - interval '1 minute', 3)
   )) #> '{data,results}') AS e),
  '["inserted", "inserted", "inserted"]'::jsonb,
  'three attempts stored'
);

CREATE TEMP TABLE h1 AS SELECT pg_temp.rpc(a, format('SELECT public.get_home(%L)', child_a)) AS r FROM t;
SELECT is(
  (SELECT r #> '{data,streak}' FROM h1),
  (SELECT jsonb_build_object('studied_days', 3, 'chain_start', today - 2, 'rest_days', '[]'::jsonb, 'studied_today', true) FROM t),
  'three days in a row, today included -> studied_days 3'
);
SELECT is((SELECT r #> '{data,total_stars}' FROM h1), '4'::jsonb, 'total stars: lesson 1 has 3, lesson 2 has 1');
SELECT is((SELECT r #> '{data,total_xp}' FROM h1), '240'::jsonb, 'total xp is the sum of the attempts (90 + 90 + 60)');
SELECT is((SELECT r #>> '{data,last_lesson_id}' FROM h1), (SELECT lesson_2::text FROM t), 'last lesson is the one completed last');
SELECT is((SELECT r #> '{data,minutes_today}' FROM h1), '5'::jsonb, 'minutes today come from the attempt of today (300 s)');
SELECT is(
  (SELECT jsonb_agg(jsonb_build_object('lesson_id', e ->> 'lesson_id', 'stars', e -> 'stars', 'attempts_count', e -> 'attempts_count'))
   FROM h1, jsonb_array_elements(r #> '{data,lessons}') AS e),
  (SELECT jsonb_build_array(
     jsonb_build_object('lesson_id', lesson_2, 'stars', 1, 'attempts_count', 1),
     jsonb_build_object('lesson_id', lesson_1, 'stars', 3, 'attempts_count', 2)) FROM t),
  'lessons, most recently completed first'
);

-- Errors.
SELECT is((SELECT pg_temp.rpc(a, format('SELECT public.get_home(%L)', child_b)) ->> 'error_code' FROM t), 'child_not_found', 'child of another account -> child_not_found');
SELECT is((SELECT pg_temp.rpc(a, 'SELECT public.get_home(NULL)') ->> 'error_code' FROM t), 'invalid_input', 'null id -> invalid_input');

SELECT * FROM finish();
