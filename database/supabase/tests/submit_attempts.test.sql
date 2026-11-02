-- SK-021 · submit_attempts: idempotent on id, stars settled by the server, per-attempt rejection.
-- Child of guest A is in Asia/Ho_Chi_Minh; 2026-10-02T02:00:00Z is 09:00 on 02/10 there.

SELECT plan(33);

CREATE TEMP TABLE t AS
SELECT u.a, u.b, u.c,
       '11111111-1111-4111-8111-111111111111'::uuid AS lesson_1,
       '22222222-2222-4222-8222-222222222222'::uuid AS lesson_2,
       'aaaaaaaa-0000-4000-8000-000000000001'::uuid AS a1,
       'aaaaaaaa-0000-4000-8000-000000000002'::uuid AS a2,
       'aaaaaaaa-0000-4000-8000-000000000003'::uuid AS a3,
       'aaaaaaaa-0000-4000-8000-000000000004'::uuid AS a4
FROM (SELECT pg_temp.new_user(true) AS a, pg_temp.new_user(true) AS b, pg_temp.new_user(true) AS c) AS u;

ALTER TABLE t ADD COLUMN child_a uuid, ADD COLUMN child_b uuid, ADD COLUMN child_c uuid;
UPDATE t SET child_a = pg_temp.new_child(a), child_b = pg_temp.new_child(b), child_c = pg_temp.new_child(c, 'America/Los_Angeles');

-- 1. First attempt, 6/6 on 02/10 -> 2 stars.
CREATE TEMP TABLE r1 AS
SELECT pg_temp.submit(a, jsonb_build_array(pg_temp.attempt(a1, child_a, lesson_1, '2026-10-02T02:00:00Z', 6))) AS r FROM t;

SELECT is((SELECT pg_temp.keys(r) FROM r1), ARRAY['data', 'error', 'error_code', 'success'], 'result is {success, error_code, error, data}');
SELECT is((SELECT pg_temp.keys(r -> 'data') FROM r1), ARRAY['progress', 'results'], 'data has results and progress');
SELECT is(
  (SELECT pg_temp.keys(r #> '{data,results,0}') FROM r1),
  ARRAY['child_id', 'completed', 'error', 'error_code', 'id', 'index', 'lesson_id', 'local_date', 'max_score', 'score', 'stars', 'status', 'xp'],
  'a stored attempt result has its settled fields'
);
SELECT is(
  (SELECT (r #> '{data,results,0}') - 'child_id' - 'lesson_id' - 'id' FROM r1),
  '{"index": 0, "status": "inserted", "error_code": null, "error": null, "score": 6, "max_score": 6,
    "completed": true, "local_date": "2026-10-02", "xp": 90, "stars": 2}'::jsonb,
  '6/6 -> inserted, completed, local_date in the child time zone, 2 stars'
);
SELECT is(
  (SELECT (r #> '{data,progress,0}') - 'child_id' - 'lesson_id' FROM r1),
  '{"stars": 2, "best_score": 6, "attempts_count": 1, "first_pass_at": "2026-10-02T02:00:00Z",
    "mastered_at": null, "last_completed_at": "2026-10-02T02:00:00Z"}'::jsonb,
  'progress of the lesson is returned'
);
SELECT is(
  (SELECT jsonb_build_object('n', count(*), 'slots', array_agg(DISTINCT slot), 'orders', sum(item_order))
   FROM public.quiz_answers WHERE attempt_id = (SELECT a1 FROM t)),
  '{"n": 6, "slots": ["quiz"], "orders": 21}'::jsonb,
  'the 6 answers are stored, numeric slot read as quiz position'
);

-- 2. Same attempt again (offline queue sends twice) -> duplicate, nothing changes.
CREATE TEMP TABLE r2 AS
SELECT pg_temp.submit(a, jsonb_build_array(pg_temp.attempt(a1, child_a, lesson_1, '2026-10-02T02:00:00Z', 6))) AS r FROM t;
SELECT is((SELECT r #>> '{data,results,0,status}' FROM r2), 'duplicate', 'same id again -> duplicate');
SELECT is((SELECT r #>> '{data,results,0,stars}' FROM r2), '2', 'a duplicate still returns the settled stars');
SELECT is((SELECT count(*)::integer FROM public.lesson_attempts WHERE id = (SELECT a1 FROM t)), 1, 'one row in lesson_attempts');
SELECT is(
  (SELECT attempts_count FROM public.lesson_progress WHERE child_id = (SELECT child_a FROM t) AND lesson_id = (SELECT lesson_1 FROM t)),
  1,
  'attempts_count does not grow on the second call'
);
SELECT is((SELECT count(*)::integer FROM public.quiz_answers WHERE attempt_id = (SELECT a1 FROM t)), 6, 'answers are not stored twice');

-- 3. Pass again on the next local day -> 3 stars (mastery_gap_days 1).
CREATE TEMP TABLE r3 AS
SELECT pg_temp.submit(a, jsonb_build_array(pg_temp.attempt(a2, child_a, lesson_1, '2026-10-03T03:00:00Z', 5))) AS r FROM t;
SELECT is((SELECT r #>> '{data,results,0,stars}' FROM r3), '3', 'pass again one local day later -> 3 stars');
SELECT is(
  (SELECT mastered_at FROM public.lesson_progress WHERE child_id = (SELECT child_a FROM t) AND lesson_id = (SELECT lesson_1 FROM t)),
  '2026-10-03T03:00:00Z'::timestamptz,
  'mastered_at is the completed_at of the mastering attempt'
);

-- 4. A batch with a good attempt, a broken one and one for a child of another account.
CREATE TEMP TABLE r4 AS
SELECT pg_temp.submit(a, jsonb_build_array(
  pg_temp.attempt(a3, child_a, lesson_1, '2026-10-04T02:00:00Z', 5, 5),
  jsonb_build_object('id', 'not-a-uuid', 'child_id', child_a),
  pg_temp.attempt(gen_random_uuid(), child_b, lesson_1, '2026-10-04T02:00:00Z', 6)
)) AS r FROM t;
SELECT is((SELECT r -> 'success' FROM r4), 'true'::jsonb, 'a batch with bad attempts still succeeds');
SELECT is(
  (SELECT jsonb_agg(jsonb_build_object('status', e ->> 'status', 'error_code', e ->> 'error_code') ORDER BY (e ->> 'index')::integer)
   FROM r4, jsonb_array_elements(r #> '{data,results}') AS e),
  '[{"status": "inserted", "error_code": null}, {"status": "rejected", "error_code": "invalid_attempt"},
    {"status": "rejected", "error_code": "child_not_found"}]'::jsonb,
  'each attempt has its own status, in input order'
);
SELECT is(
  (SELECT r #> '{data,results,0,completed}' FROM r4),
  'false'::jsonb,
  'only 5 quiz answers -> not completed'
);
SELECT is(
  (SELECT jsonb_build_object('stars', stars, 'attempts_count', attempts_count) FROM public.lesson_progress
   WHERE child_id = (SELECT child_a FROM t) AND lesson_id = (SELECT lesson_1 FROM t)),
  '{"stars": 3, "attempts_count": 3}'::jsonb,
  'the incomplete attempt counts as an attempt and keeps 3 stars'
);
SELECT is(
  (SELECT count(*)::integer FROM public.lesson_attempts WHERE child_id = (SELECT child_b FROM t)),
  0,
  'nothing stored for the child of another account'
);
SELECT is((SELECT completed_at FROM public.lesson_attempts WHERE id = (SELECT a3 FROM t)), NULL, 'completed_at is null when not completed');

-- 5. Stars never go down (SK-003 D4).
SELECT is(
  (SELECT pg_temp.submit(a, jsonb_build_array(pg_temp.attempt(a4, child_a, lesson_1, '2026-10-05T02:00:00Z', 1))) #>> '{data,results,0,stars}' FROM t),
  '3',
  'a later 1/6 keeps 3 stars'
);

-- 6. local_date follows the profile time zone, not UTC.
SELECT is(
  (SELECT pg_temp.submit(c, jsonb_build_array(pg_temp.attempt(gen_random_uuid(), child_c, lesson_1, '2026-10-28T06:59:59Z', 6))) #>> '{data,results,0,local_date}' FROM t),
  '2026-10-27',
  'America/Los_Angeles: 06:59:59Z on 28/10 is 27/10 (vector local-date-007)'
);

-- 7. Server-side corrections.
CREATE TEMP TABLE r7 AS
SELECT pg_temp.submit(a, jsonb_build_array(
  -- the app claims 6/6 but its answers carry 4 points: the server adds the points itself
  pg_temp.attempt(gen_random_uuid(), child_a, lesson_2, '2026-10-02T03:00:00Z', 4) || '{"score": 6}'::jsonb,
  -- a completed_at in the future is brought back to now
  pg_temp.attempt(gen_random_uuid(), child_a, lesson_2, '2099-01-01T00:00:00Z', 6),
  -- XP above what one attempt can earn is capped (6 x 10 + 20 + 10 + 20 = 110)
  pg_temp.attempt(gen_random_uuid(), child_a, lesson_2, '2026-10-02T04:00:00Z', 6) || '{"xp": 5000}'::jsonb,
  -- no answers: the app's score is kept
  pg_temp.attempt(gen_random_uuid(), child_a, lesson_2, '2026-10-02T05:00:00Z', 0, 0) || '{"score": 5, "max_score": 6}'::jsonb
)) AS r FROM t;
SELECT is((SELECT r #> '{data,results,0,score}' FROM r7), '4'::jsonb, 'score comes from the answers, not the app''s score field');
SELECT ok(
  (SELECT completed_at <= now() FROM public.lesson_attempts WHERE id = (SELECT (r #>> '{data,results,1,id}')::uuid FROM r7)),
  'completed_at in the future is stored as now'
);
SELECT is((SELECT r #> '{data,results,2,xp}' FROM r7), '110'::jsonb, 'xp is capped by the rules');
SELECT is(
  (SELECT jsonb_build_object('score', r #> '{data,results,3,score}', 'completed', r #> '{data,results,3,completed}') FROM r7),
  '{"score": 5, "completed": true}'::jsonb,
  'without answers the app''s score is kept'
);

-- 8. Broken answers are rejected, the attempt is not stored.
SELECT is(
  (SELECT pg_temp.submit(a, jsonb_build_array(
     (SELECT jsonb_set(x, '{answers,1,item_id}', x #> '{answers,0,item_id}')
      FROM (SELECT pg_temp.attempt(gen_random_uuid(), child_a, lesson_2, '2026-10-02T07:00:00Z', 6) AS x) AS s)
   )) #>> '{data,results,0,error_code}' FROM t),
  'invalid_attempt',
  'the same quiz item twice -> invalid_attempt (score_lesson invalid_results)'
);

-- 9. An attempt id already used by another account.
SELECT is(
  (SELECT pg_temp.submit(b, jsonb_build_array(pg_temp.attempt(a1, child_b, lesson_1, '2026-10-02T02:00:00Z', 6))) #>> '{data,results,0,error_code}' FROM t),
  'id_conflict',
  'attempt id of another child -> id_conflict'
);
SELECT is((SELECT child_id FROM public.lesson_attempts WHERE id = (SELECT a1 FROM t)), (SELECT child_a FROM t), 'the stored attempt is untouched');

-- 10. The exact JSON the iOS app writes in lessons/history.json (AttemptRecord, SK-012).
SELECT is(
  (SELECT (pg_temp.submit(a, jsonb_build_array(format($json${
      "answers" : [
        {"answer" : [{"selected" : "fish"}], "correct" : true, "hint_used" : false, "item_id" : "0b4f5a5e-3a52-4d0e-9a51-6f0c1d7f1a01", "points" : 1, "slot" : 1, "tries" : 1},
        {"answer" : [{"selected" : ["fish", "egg"]}], "correct" : true, "hint_used" : true, "item_id" : "0b4f5a5e-3a52-4d0e-9a51-6f0c1d7f1a02", "points" : 1, "slot" : 2, "tries" : 1},
        {"answer" : [{"value" : false}], "correct" : true, "hint_used" : false, "item_id" : "0b4f5a5e-3a52-4d0e-9a51-6f0c1d7f1a03", "points" : 1, "slot" : 3, "tries" : 1},
        {"answer" : [{"filled" : ["air"]}], "correct" : true, "hint_used" : false, "item_id" : "0b4f5a5e-3a52-4d0e-9a51-6f0c1d7f1a04", "points" : 1, "slot" : 4, "tries" : 1},
        {"answer" : [{"order" : ["a", "b"]}, {"order" : ["b", "a"]}], "correct" : true, "hint_used" : false, "item_id" : "0b4f5a5e-3a52-4d0e-9a51-6f0c1d7f1a05", "points" : 0, "slot" : 5, "tries" : 2},
        {"answer" : [{"selected" : "rice"}], "correct" : true, "hint_used" : false, "item_id" : "0b4f5a5e-3a52-4d0e-9a51-6f0c1d7f1a06", "points" : 1, "slot" : 6, "tries" : 1}
      ],
      "child_id" : "%s",
      "completed_at" : "2026-10-29T03:05:12Z",
      "content_version" : null,
      "duration_s" : 312,
      "id" : "5d2c6a8e-1b7f-4c3e-9f10-2a4b6c8d0e1f",
      "lesson_id" : "%s",
      "local_date" : "2026-10-29",
      "max_score" : 6,
      "score" : 5,
      "started_at" : "2026-10-29T03:00:00Z",
      "stars" : 2,
      "xp" : 80
    }$json$, child_a, gen_random_uuid())::jsonb)) #> '{data,results,0}') - 'id' - 'child_id' - 'lesson_id' - 'index' FROM t),
  '{"status": "inserted", "error_code": null, "error": null, "score": 5, "max_score": 6, "completed": true,
    "local_date": "2026-10-29", "xp": 80, "stars": 2}'::jsonb,
  'an AttemptRecord written by the app is accepted as is'
);

-- 11. Whole-call errors (the app keeps its queue).
SELECT is((SELECT pg_temp.submit(a, '{}'::jsonb) ->> 'error_code' FROM t), 'invalid_input', 'not an array -> invalid_input');
SELECT is((SELECT pg_temp.submit(a, '[]'::jsonb) ->> 'error_code' FROM t), 'invalid_input', 'empty array -> invalid_input');
SELECT is(
  (SELECT pg_temp.submit(t.a, x.batch) ->> 'error_code'
   FROM t, LATERAL (
     SELECT jsonb_agg(pg_temp.attempt(gen_random_uuid(), t.child_a, t.lesson_2, '2026-10-02T02:00:00Z'::timestamptz + n * interval '1 minute', 6)) AS batch
     FROM generate_series(1, 51) AS n
   ) AS x),
  'too_many_attempts',
  '51 attempts -> too_many_attempts'
);
SELECT is(
  pg_temp.rpc(NULL, $$SELECT public.submit_attempts('[{}]'::jsonb)$$) ->> 'error_code',
  'not_authenticated',
  'no session -> not_authenticated'
);

SELECT * FROM finish();
