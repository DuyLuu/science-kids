-- SK-021 T2 · get_home, edge cases: streak with rest days (against compute_streak), today not studied, incomplete
-- attempts, time zones, minutes_today with the 60 minute cap, rules_missing, nothing leaks between accounts.
-- "Today" is the real local day of the run (now() is fixed inside one transaction). Every attempt is placed
-- at noon of a local date, or at now() for today, so no assertion depends on the hour of the run.

SELECT plan(30);

CREATE FUNCTION pg_temp.noon(p_date date, p_tz text) RETURNS timestamptz LANGUAGE sql AS $$
  SELECT LEAST((p_date + time '12:00') AT TIME ZONE p_tz, now()) $$;
CREATE FUNCTION pg_temp.home(p_user uuid, p_child uuid) RETURNS jsonb LANGUAGE sql AS $$
  SELECT pg_temp.rpc(p_user, format('SELECT public.get_home(%L)', p_child)) $$;
-- One completed 6/6 attempt of lesson p_lesson on the local date p_date (today: at now()).
CREATE FUNCTION pg_temp.day(p_child uuid, p_lesson uuid, p_date date, p_tz text DEFAULT 'Asia/Ho_Chi_Minh') RETURNS jsonb LANGUAGE sql AS $$
  SELECT pg_temp.attempt(gen_random_uuid(), p_child, p_lesson, pg_temp.noon(p_date, p_tz), 6) $$;

CREATE TEMP TABLE t AS
SELECT pg_temp.new_user(true) AS u1, pg_temp.new_user(true) AS u2, pg_temp.new_user(true) AS u3, pg_temp.new_user(true) AS u4,
       pg_temp.new_user(true) AS u5, pg_temp.new_user(true) AS u6, pg_temp.new_user(true) AS u7, pg_temp.new_user(true) AS u8,
       pg_temp.new_user(true) AS la, pg_temp.new_user(true) AS kir, pg_temp.new_user(true) AS pago, pg_temp.new_user(true) AS other,
       public.local_date(now(), 'Asia/Ho_Chi_Minh') AS today,
       '11111111-1111-4111-8111-111111111111'::uuid AS l1, '22222222-2222-4222-8222-222222222222'::uuid AS l2,
       '33333333-3333-4333-8333-333333333333'::uuid AS l3;
ALTER TABLE t ADD COLUMN c1 uuid, ADD COLUMN c2 uuid, ADD COLUMN c3 uuid, ADD COLUMN c4 uuid, ADD COLUMN c5 uuid, ADD COLUMN c6 uuid,
            ADD COLUMN c7 uuid, ADD COLUMN c8 uuid, ADD COLUMN cla uuid, ADD COLUMN ckir uuid, ADD COLUMN cpago uuid, ADD COLUMN cother uuid;
UPDATE t SET c1 = pg_temp.new_child(u1), c2 = pg_temp.new_child(u2), c3 = pg_temp.new_child(u3), c4 = pg_temp.new_child(u4),
             c5 = pg_temp.new_child(u5), c6 = pg_temp.new_child(u6), c7 = pg_temp.new_child(u7), c8 = pg_temp.new_child(u8),
             cla = pg_temp.new_child(la, 'America/Los_Angeles'), ckir = pg_temp.new_child(kir, 'Pacific/Kiritimati'),
             cpago = pg_temp.new_child(pago, 'Pacific/Pago_Pago'), cother = pg_temp.new_child(other);

-- 1. One rest day: studied today, yesterday and 3 days ago; the day in between is a rest day.
SELECT is(
  (SELECT jsonb_agg(e ->> 'status') FROM t, jsonb_array_elements(pg_temp.submit(u1, jsonb_build_array(
     pg_temp.day(c1, l1, today), pg_temp.day(c1, l1, today - 1), pg_temp.day(c1, l1, today - 3))) #> '{data,results}') AS e),
  '["inserted", "inserted", "inserted"]'::jsonb,
  'setup 1: attempts today, -1 and -3'
);
SELECT is(
  (SELECT pg_temp.home(u1, c1) #> '{data,streak}' FROM t),
  (SELECT jsonb_build_object('studied_days', 3, 'chain_start', today - 3, 'rest_days', jsonb_build_array(today - 2), 'studied_today', true) FROM t),
  'studied today, -1, -3: the day -2 is a rest day, chain 3 days'
);

-- 2. Two gaps (-1 and -3) with study on today, -2, -4: they are rest days only if they fall in different ISO weeks.
SELECT is(
  (SELECT jsonb_agg(e ->> 'status') FROM t, jsonb_array_elements(pg_temp.submit(u2, jsonb_build_array(
     pg_temp.day(c2, l1, today), pg_temp.day(c2, l1, today - 2), pg_temp.day(c2, l1, today - 4))) #> '{data,results}') AS e),
  '["inserted", "inserted", "inserted"]'::jsonb,
  'setup 2: attempts today, -2 and -4'
);
SELECT is(
  (SELECT pg_temp.home(u2, c2) #> '{data,streak}' FROM t),
  (SELECT CASE
     WHEN to_char((today - 1)::timestamp, 'IYYY-IW') = to_char((today - 3)::timestamp, 'IYYY-IW')
       THEN jsonb_build_object('studied_days', 2, 'chain_start', today - 2, 'rest_days', jsonb_build_array(today - 1), 'studied_today', true)
       ELSE jsonb_build_object('studied_days', 3, 'chain_start', today - 4, 'rest_days', jsonb_build_array(today - 3, today - 1), 'studied_today', true)
   END FROM t),
  'two gaps: one rest day per ISO week (both gaps in one week break the chain at the second)'
);

-- 3. Today not studied yet: today is skipped, never a rest day; yesterday keeps the chain.
SELECT is(
  (SELECT pg_temp.submit(u3, jsonb_build_array(pg_temp.day(c3, l1, today - 1), pg_temp.day(c3, l1, today - 2))) ->> 'success' FROM t),
  'true',
  'setup 3: attempts -1 and -2'
);
SELECT is(
  (SELECT pg_temp.home(u3, c3) #> '{data,streak}' FROM t),
  (SELECT jsonb_build_object('studied_days', 2, 'chain_start', today - 2, 'rest_days', '[]'::jsonb, 'studied_today', false) FROM t),
  'today not studied: studied_days 2, studied_today false, today is not a rest day'
);

-- 4. Only the day before yesterday studied: yesterday is the rest day, the chain holds.
SELECT is(
  (SELECT pg_temp.submit(u4, jsonb_build_array(pg_temp.day(c4, l1, today - 2))) ->> 'success' FROM t),
  'true',
  'setup 4: attempt at -2'
);
SELECT is(
  (SELECT pg_temp.home(u4, c4) #> '{data,streak}' FROM t),
  (SELECT jsonb_build_object('studied_days', 1, 'chain_start', today - 2, 'rest_days', jsonb_build_array(today - 1), 'studied_today', false) FROM t),
  'studied only at -2: yesterday is a rest day, studied_days 1'
);

-- 5. Incomplete attempts: minutes count, the day is not a study day, no star.
CREATE TEMP TABLE r5 AS
SELECT pg_temp.submit(u5, jsonb_build_array(
  pg_temp.attempt(gen_random_uuid(), c5, l1, pg_temp.noon(today, 'Asia/Ho_Chi_Minh'), 3, 3) || '{"duration_s": 120}'::jsonb)) AS r FROM t;
SELECT is((SELECT r #>> '{data,results,0,completed}' FROM r5), 'false', 'setup 5: a 3-answer attempt is not completed');
SELECT is(
  (SELECT jsonb_build_object('streak', h #> '{data,streak}', 'minutes', h #> '{data,minutes_today}', 'stars', h #> '{data,total_stars}')
   FROM (SELECT pg_temp.home(u5, c5) AS h FROM t) AS x),
  (SELECT jsonb_build_object('streak', jsonb_build_object('studied_days', 0, 'chain_start', NULL, 'rest_days', '[]'::jsonb, 'studied_today', false),
                             'minutes', 2, 'stars', 0) FROM t),
  'an incomplete attempt today: no streak, no star, 2 minutes'
);
SELECT is(
  (SELECT h #>> '{data,lessons,0,stars}' || '/' || COALESCE(h #>> '{data,lessons,0,last_completed_at}', 'null') || '/' || (h #>> '{data,lessons,0,attempts_count}')
   FROM (SELECT pg_temp.home(u5, c5) AS h FROM t) AS x),
  '0/null/1',
  'the lesson with only an incomplete attempt is listed with 0 stars, no last_completed_at, 1 attempt'
);

-- 6. minutes_today: each attempt capped at 60 minutes, today only, rounded up.
CREATE TEMP TABLE r6 AS
SELECT pg_temp.submit(u6, jsonb_build_array(
  pg_temp.day(c6, l1, today) || '{"duration_s": 7200}'::jsonb,
  pg_temp.day(c6, l2, today) || '{"duration_s": 61}'::jsonb,
  pg_temp.day(c6, l2, today - 1) || '{"duration_s": 1800}'::jsonb)) AS r FROM t;
SELECT is(
  (SELECT pg_temp.home(u6, c6) #>> '{data,minutes_today}' FROM t),
  '62',
  'minutes_today: 7200 s is capped at 60 min, +61 s rounds up to 2 min = 62; yesterday does not count'
);
SELECT is(
  (SELECT pg_temp.home(u6, c6) #> '{data,streak,studied_days}' FROM t),
  '2'::jsonb,
  'today and yesterday studied: studied_days 2'
);
SELECT is(
  (SELECT jsonb_build_object('stars', total_stars, 'xp', total_xp) FROM (
     SELECT (h #> '{data,total_stars}')::integer AS total_stars, (h #> '{data,total_xp}')::integer AS total_xp FROM (SELECT pg_temp.home(u6, c6) AS h FROM t) AS x) AS y),
  '{"stars": 5, "xp": 270}'::jsonb,
  'totals: lesson 1 has 2 stars (one pass), lesson 2 has 3 (pass on two days); xp 3 x 90'
);

-- 7. A long chain: 14 days in a row, no rest day used.
CREATE TEMP TABLE r7 AS
SELECT pg_temp.submit(u7, (SELECT jsonb_agg(pg_temp.day(c7, l3, today - n) ORDER BY n) FROM generate_series(0, 13) AS n)) AS r FROM t;
SELECT is(
  (SELECT pg_temp.home(u7, c7) #> '{data,streak}' FROM t),
  (SELECT jsonb_build_object('studied_days', 14, 'chain_start', today - 13, 'rest_days', '[]'::jsonb, 'studied_today', true) FROM t),
  '14 days in a row: studied_days 14, no rest day'
);
SELECT is(
  (SELECT (pg_temp.home(u7, c7) #> '{data,lessons,0}') - 'child_id' - 'lesson_id' - 'first_pass_at' - 'mastered_at' - 'last_completed_at' FROM t),
  '{"stars": 3, "best_score": 6, "attempts_count": 14}'::jsonb,
  '14 attempts of one lesson: 3 stars, attempts_count 14'
);

-- 8. Dates that cannot be real study days: a future attempt is brought to today, an old one does not extend the chain.
CREATE TEMP TABLE r8 AS
SELECT pg_temp.submit(u8, jsonb_build_array(
  pg_temp.attempt(gen_random_uuid(), c8, l1, '2099-01-01T00:00:00Z', 6),
  pg_temp.attempt(gen_random_uuid(), c8, l2, '2020-01-01T00:00:00Z', 6))) AS r FROM t;
SELECT is(
  (SELECT pg_temp.home(u8, c8) #> '{data,streak}' FROM t),
  (SELECT jsonb_build_object('studied_days', 1, 'chain_start', today, 'rest_days', '[]'::jsonb, 'studied_today', true) FROM t),
  'a 2099 attempt counts as today only, a 2020 one is far outside the chain: studied_days 1'
);
SELECT is(
  (SELECT jsonb_agg(e ->> 'local_date' ORDER BY (e ->> 'index')::integer) FROM r8, jsonb_array_elements(r #> '{data,results}') AS e),
  (SELECT jsonb_build_array(today::text, '2020-01-01') FROM t),
  'local_date of the 2099 attempt is today, of the 2020 attempt 01/01/2020'
);

-- 9. Time zones: "today" is the local day of the profile.
SELECT is(
  (SELECT ARRAY[pg_temp.home(la, cla) #>> '{data,today}', pg_temp.home(kir, ckir) #>> '{data,today}', pg_temp.home(pago, cpago) #>> '{data,today}'] FROM t),
  ARRAY[public.local_date(now(), 'America/Los_Angeles')::text, public.local_date(now(), 'Pacific/Kiritimati')::text,
        public.local_date(now(), 'Pacific/Pago_Pago')::text],
  'today follows the time zone of each profile (Los_Angeles, Kiritimati UTC+14, Pago_Pago UTC-11)'
);
SELECT ok(
  (SELECT (pg_temp.home(kir, ckir) #>> '{data,today}')::date - (pg_temp.home(pago, cpago) #>> '{data,today}')::date IN (1, 2) FROM t),
  'Kiritimati is 1 or 2 days ahead of Pago_Pago (25 hours apart)'
);
-- A study day in the profile's time zone: an attempt at LA noon of today's LA date is studied_today.
CREATE TEMP TABLE r9 AS
SELECT pg_temp.submit(la, jsonb_build_array(pg_temp.attempt(gen_random_uuid(), cla, l1, pg_temp.noon(public.local_date(now(), 'America/Los_Angeles'), 'America/Los_Angeles'), 6))) AS r FROM t;
SELECT is(
  (SELECT pg_temp.home(la, cla) #> '{data,streak,studied_today}' FROM t),
  'true'::jsonb,
  'LA profile: an attempt on the LA local day is studied_today'
);

-- 10. Errors and who sees what.
SELECT is((SELECT pg_temp.home(u1, c2) ->> 'error_code' FROM t), 'child_not_found', 'child of another account -> child_not_found');
SELECT is((SELECT pg_temp.rpc(u1, 'SELECT public.get_home(gen_random_uuid())') ->> 'error_code' FROM t), 'child_not_found', 'unknown child id -> child_not_found');
SELECT is(
  (SELECT jsonb_build_object('lessons', h #> '{data,lessons}', 'stars', h #> '{data,total_stars}', 'xp', h #> '{data,total_xp}',
                             'last', h #> '{data,last_lesson_id}', 'streak', h #> '{data,streak,studied_days}')
   FROM (SELECT pg_temp.home(other, cother) AS h FROM t) AS x),
  '{"lessons": [], "stars": 0, "xp": 0, "last": null, "streak": 0}'::jsonb,
  'a child with no attempt sees nothing of the other children''s data'
);
SELECT is((SELECT pg_temp.rpc(NULL, format('SELECT public.get_home(%L)', c1)) ->> 'error_code' FROM t), 'not_authenticated', 'no session -> not_authenticated');
SELECT throws_ok(
  $$SELECT pg_temp.run_as('anon', NULL, 'SELECT public.get_home(gen_random_uuid())')$$, '42501', NULL, 'anon cannot execute get_home');
SELECT is(
  (SELECT pg_temp.home(u1, c1) -> 'data' -> 'child' ->> 'id' FROM t),
  (SELECT c1::text FROM t),
  'child.id is the requested profile'
);
SELECT ok(
  NOT (SELECT pg_temp.home(u1, c1) -> 'data' -> 'child' ? 'owner_id' FROM t),
  'the profile in get_home has no owner_id'
);

-- 11. Read only: get_home is STABLE, so Postgres refuses writes inside it.
SELECT ok(
  (SELECT p.provolatile = 's' FROM pg_proc AS p WHERE p.oid = 'public.get_home(uuid)'::regprocedure),
  'get_home is declared STABLE'
);

-- 12. rules_missing: whole-call error.
DELETE FROM public.app_config WHERE key = 'rules.discoverer';
SELECT is(
  (SELECT jsonb_build_object('success', h -> 'success', 'code', h -> 'error_code', 'data', h -> 'data') FROM (SELECT pg_temp.home(u1, c1) AS h FROM t) AS x),
  '{"success": false, "code": "rules_missing", "data": null}'::jsonb,
  'rules.<age_group> missing: success false, rules_missing'
);

SELECT * FROM finish();
