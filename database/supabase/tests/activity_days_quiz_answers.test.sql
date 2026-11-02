-- SK-021 · OPTIONAL block: activity_days and quiz_answers. Delete this file together with the block
-- if Duy drops the two tables.

SELECT plan(9);

CREATE TEMP TABLE t AS
SELECT u.a, u.b, '11111111-1111-4111-8111-111111111111'::uuid AS lesson_1
FROM (SELECT pg_temp.new_user(true) AS a, pg_temp.new_user(true) AS b) AS u;
ALTER TABLE t ADD COLUMN child_a uuid, ADD COLUMN child_b uuid;
UPDATE t SET child_a = pg_temp.new_child(a), child_b = pg_temp.new_child(b);

-- 02/10 (Asia/Ho_Chi_Minh): one completed attempt of 300 s, one not completed of 120 s, and one
-- completed attempt paused for two days (duration 172800 s, capped at 60 minutes).
CREATE TEMP TABLE r AS
SELECT pg_temp.submit(a, jsonb_build_array(
  pg_temp.attempt(gen_random_uuid(), child_a, lesson_1, '2026-10-02T02:00:00Z', 6),
  pg_temp.attempt(gen_random_uuid(), child_a, lesson_1, '2026-10-02T03:00:00Z', 2, 3) || '{"duration_s": 120}'::jsonb,
  pg_temp.attempt(gen_random_uuid(), child_a, lesson_1, '2026-10-02T04:00:00Z', 6) || '{"duration_s": 172800}'::jsonb,
  -- canonical answer shape: slot 'warmup' or 'quiz' with item_order, time_ms
  pg_temp.attempt(gen_random_uuid(), child_a, lesson_1, '2026-10-03T02:00:00Z', 0, 0) || jsonb_build_object('answers', jsonb_build_array(
    jsonb_build_object('item_id', gen_random_uuid(), 'slot', 'warmup', 'item_order', 1, 'correct', false, 'points', 0,
                       'answer', '[{"selected": "x"}]'::jsonb, 'hint_used', false, 'tries', 2, 'time_ms', 4200)
  ))
)) AS r FROM t;

SELECT is(
  (SELECT jsonb_agg(e ->> 'status') FROM r, jsonb_array_elements(r.r #> '{data,results}') AS e),
  '["inserted", "inserted", "inserted", "inserted"]'::jsonb,
  'four attempts stored'
);
SELECT is(
  (SELECT jsonb_build_object('minutes', minutes, 'lessons_completed', lessons_completed)
   FROM public.activity_days WHERE child_id = (SELECT child_a FROM t) AND local_date = '2026-10-02'),
  '{"minutes": 67, "lessons_completed": 2}'::jsonb,
  '02/10: (300 + 120 + 3600) s -> 67 minutes; the incomplete attempt adds minutes, not a lesson'
);
SELECT is(
  (SELECT count(*)::integer FROM public.activity_days WHERE child_id = (SELECT child_a FROM t)),
  2,
  'one row per local day'
);
SELECT is(
  (SELECT jsonb_build_object('slot', q.slot, 'item_order', q.item_order, 'time_ms', q.time_ms, 'tries', q.tries)
   FROM public.quiz_answers AS q JOIN public.lesson_attempts AS a ON a.id = q.attempt_id
   WHERE a.child_id = (SELECT child_a FROM t) AND q.slot = 'warmup'),
  '{"slot": "warmup", "item_order": 1, "time_ms": 4200, "tries": 2}'::jsonb,
  'a warmup answer in the canonical shape is stored'
);
SELECT is(
  (SELECT count(*)::integer FROM public.quiz_answers AS q JOIN public.lesson_attempts AS a ON a.id = q.attempt_id
   WHERE a.child_id = (SELECT child_a FROM t)),
  6 + 3 + 6 + 1,
  'every answer of every attempt is stored'
);

-- A second submission of the same day refreshes the row (no double count).
SELECT is(
  (SELECT pg_temp.submit(a, jsonb_build_array(pg_temp.attempt(gen_random_uuid(), child_a, lesson_1, '2026-10-02T05:00:00Z', 6))) #>> '{data,results,0,status}' FROM t),
  'inserted',
  'one more attempt on 02/10'
);
SELECT is(
  (SELECT lessons_completed FROM public.activity_days WHERE child_id = (SELECT child_a FROM t) AND local_date = '2026-10-02'),
  3,
  'lessons_completed is recounted from the attempts'
);

-- RLS of the two tables.
SELECT is(
  (SELECT pg_temp.as_user(b, format('SELECT count(*) FROM public.activity_days WHERE child_id = %L', child_a)) FROM t),
  '0',
  'B does not see the activity days of A'
);
SELECT is(
  (SELECT pg_temp.as_user(b, 'SELECT count(*) FROM public.quiz_answers') FROM t),
  '0',
  'B does not see the answers of A'
);

SELECT * FROM finish();
