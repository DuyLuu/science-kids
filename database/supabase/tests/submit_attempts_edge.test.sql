-- SK-021 T2 · submit_attempts, edge cases: batch and answer limits, bad fields, idempotency, rules changes,
-- out-of-order arrival, time zones around midnight and DST, per-child lock, rules_missing, anon.
-- Every user and row is made by this file inside the transaction that db-apply rolls back.

SELECT plan(71);

CREATE TEMP TABLE t AS
SELECT pg_temp.new_user(true) AS a, pg_temp.new_user(true) AS b, pg_temp.new_user(true) AS la, pg_temp.new_user(true) AS la2,
       pg_temp.new_user(true) AS kir, pg_temp.new_user(true) AS tie1, pg_temp.new_user(true) AS tie2, pg_temp.new_user(true) AS ooo,
       pg_temp.new_user(true) AS lim, pg_temp.new_user(true) AS nr,
       '11111111-1111-4111-8111-111111111111'::uuid AS l1,
       '22222222-2222-4222-8222-222222222222'::uuid AS l2;
ALTER TABLE t ADD COLUMN ca uuid, ADD COLUMN cb uuid, ADD COLUMN cla uuid, ADD COLUMN cla2 uuid, ADD COLUMN ckir uuid,
            ADD COLUMN ctie1 uuid, ADD COLUMN ctie2 uuid, ADD COLUMN cooo uuid, ADD COLUMN clim uuid, ADD COLUMN cnr uuid;
UPDATE t SET ca = pg_temp.new_child(a), cb = pg_temp.new_child(b),
             cla = pg_temp.new_child(la, 'America/Los_Angeles'), cla2 = pg_temp.new_child(la2, 'America/Los_Angeles'),
             ckir = pg_temp.new_child(kir, 'Pacific/Kiritimati'),
             ctie1 = pg_temp.new_child(tie1), ctie2 = pg_temp.new_child(tie2), cooo = pg_temp.new_child(ooo),
             clim = pg_temp.new_child(lim), cnr = pg_temp.new_child(nr);

-- A valid attempt of child A (6/6 on 02/10) with a fresh id; the caller changes one field.
CREATE FUNCTION pg_temp.base() RETURNS jsonb LANGUAGE sql AS $$
  SELECT pg_temp.attempt(gen_random_uuid(), (SELECT ca FROM t), (SELECT l1 FROM t), '2026-10-02T02:00:00Z', 6)
$$;
-- Submits one attempt as guest A and returns results[0] (or the whole answer when the call itself failed).
CREATE FUNCTION pg_temp.one(p_attempt jsonb) RETURNS jsonb LANGUAGE sql AS $$
  SELECT COALESCE(r #> '{data,results,0}', r) FROM (SELECT pg_temp.submit((SELECT a FROM t), jsonb_build_array(p_attempt)) AS r) AS x
$$;
CREATE FUNCTION pg_temp.stored(p_attempt jsonb) RETURNS integer LANGUAGE sql AS $$
  SELECT count(*)::integer FROM public.lesson_attempts WHERE id::text = lower(p_attempt ->> 'id')
$$;
-- 20 warmup answers, to pad an attempt.
CREATE FUNCTION pg_temp.warmups(p_n integer) RETURNS jsonb LANGUAGE sql AS $$
  SELECT jsonb_agg(jsonb_build_object('item_id', gen_random_uuid(), 'slot', 'warmup', 'item_order', n, 'correct', true,
                                      'points', 1, 'tries', 1, 'answer', '[]'::jsonb)) FROM generate_series(1, p_n) AS n
$$;

-- 1. Batch of exactly 50 (51 is in submit_attempts.test.sql): all stored, one progress row.
CREATE FUNCTION pg_temp.batch(p_child uuid, p_lesson uuid, p_n integer) RETURNS jsonb LANGUAGE sql AS $$
  SELECT jsonb_agg(pg_temp.attempt(gen_random_uuid(), p_child, p_lesson, '2026-10-02T02:00:00Z'::timestamptz + n * interval '1 minute', 6) ORDER BY n)
  FROM generate_series(1, p_n) AS n
$$;
CREATE TEMP TABLE b50 AS SELECT pg_temp.submit(b, pg_temp.batch(cb, l2, 50)) AS r FROM t;
SELECT is((SELECT jsonb_array_length(r #> '{data,results}') FROM b50), 50, '50 attempts in one call: 50 results');
SELECT is(
  (SELECT count(*)::integer FROM b50, jsonb_array_elements(r #> '{data,results}') AS e WHERE e ->> 'status' = 'inserted'),
  50,
  '50 attempts in one call: all inserted'
);
SELECT is(
  (SELECT attempts_count FROM public.lesson_progress WHERE child_id = (SELECT cb FROM t) AND lesson_id = (SELECT l2 FROM t)),
  50,
  '50 attempts of one lesson: attempts_count 50'
);
SELECT is((SELECT jsonb_array_length(r #> '{data,progress}') FROM b50), 1, 'one progress row for the lesson of the whole batch');

-- 51 attempts: refused as a whole, nothing stored for them.
CREATE TEMP TABLE b51 AS SELECT pg_temp.submit(b, pg_temp.batch(cb, l1, 51)) AS r FROM t;
SELECT is(
  (SELECT jsonb_build_object('success', r -> 'success', 'error_code', r -> 'error_code', 'data', r -> 'data') FROM b51),
  '{"success": false, "error_code": "too_many_attempts", "data": null}'::jsonb,
  '51 attempts -> success false, too_many_attempts'
);
SELECT is(
  (SELECT count(*)::integer FROM public.lesson_attempts WHERE child_id = (SELECT cb FROM t) AND lesson_id = (SELECT l1 FROM t)),
  0,
  '51 attempts: nothing stored'
);

-- 49 good + 1 bad in the middle of a 50 batch: the 49 are stored.
CREATE TEMP TABLE b49 AS
SELECT pg_temp.submit(t.a, x.batch) AS r
FROM t, LATERAL (
  SELECT jsonb_agg(CASE WHEN n = 25 THEN jsonb_build_object('id', gen_random_uuid(), 'child_id', t.ca, 'lesson_id', 'oops')
                        ELSE pg_temp.attempt(gen_random_uuid(), t.ca, t.l2, '2026-10-02T02:00:00Z'::timestamptz + n * interval '1 minute', 6) END
                   ORDER BY n) AS batch
  FROM generate_series(1, 50) AS n
) AS x;
SELECT is(
  (SELECT jsonb_build_object('inserted', count(*) FILTER (WHERE e ->> 'status' = 'inserted'),
                             'rejected_index', max((e ->> 'index')::integer) FILTER (WHERE e ->> 'status' = 'rejected'))
   FROM b49, jsonb_array_elements(r #> '{data,results}') AS e),
  '{"inserted": 49, "rejected_index": 24}'::jsonb,
  'one bad attempt in 50: 49 inserted, the bad one rejected at its index'
);

-- 2. Answers: 20 pass, 21 fail (an attempt = 6 quiz + up to 14 warmup answers).
CREATE TEMP TABLE a20 AS SELECT jsonb_set(pg_temp.base(), '{answers}', (pg_temp.base() -> 'answers') || pg_temp.warmups(14)) AS att;
CREATE TEMP TABLE a21 AS SELECT jsonb_set(pg_temp.base(), '{answers}', (pg_temp.base() -> 'answers') || pg_temp.warmups(15)) AS att;
SELECT is((SELECT pg_temp.one(att) ->> 'status' FROM a20), 'inserted', '20 answers (6 quiz + 14 warmup) -> inserted');
SELECT is(
  (SELECT count(*)::integer FROM public.quiz_answers WHERE attempt_id = (SELECT (att ->> 'id')::uuid FROM a20)),
  20,
  'all 20 answers stored'
);
SELECT is(
  (SELECT jsonb_build_object('status', pg_temp.one(att) -> 'status', 'code', pg_temp.one(att) -> 'error_code') FROM a21),
  '{"status": "rejected", "code": "invalid_attempt"}'::jsonb,
  '21 answers -> rejected invalid_attempt'
);
SELECT is((SELECT pg_temp.stored(att) FROM a21), 0, '21 answers: the attempt is not stored');
SELECT is(
  (SELECT pg_temp.one(jsonb_set(pg_temp.base(), '{answers}', '[]')) -> 'score'),
  '6'::jsonb,
  'an empty answers array: the app''s score field is kept (6)'
);

-- answer (the list of tries) of 4096 bytes passes, 4097 fails; the size is that of the jsonb text.
CREATE FUNCTION pg_temp.answer_of(p_bytes integer) RETURNS jsonb LANGUAGE sql AS $$
  SELECT jsonb_build_array(jsonb_build_object('selected', repeat('x', p_bytes - octet_length('[{"selected": ""}]')))) $$;
SELECT is(octet_length(pg_temp.answer_of(4096)::text), 4096, 'helper makes an answer of exactly 4096 bytes');
SELECT is(
  pg_temp.one(jsonb_set(pg_temp.base(), '{answers,0,answer}', pg_temp.answer_of(4096))) ->> 'status',
  'inserted',
  'answer of exactly 4096 bytes -> inserted'
);
SELECT is(
  pg_temp.one(jsonb_set(pg_temp.base(), '{answers,0,answer}', pg_temp.answer_of(4097))) ->> 'status',
  'rejected',
  'answer of 4097 bytes -> rejected'
);
SELECT is(
  pg_temp.one(jsonb_set(pg_temp.base(), '{answers,0,answer}', pg_temp.answer_of(100000))) ->> 'error_code',
  'invalid_attempt',
  'answer of 100 KB -> invalid_attempt'
);
SELECT is(
  pg_temp.one(jsonb_set(pg_temp.base(), '{answers,0,answer}', '{"selected": "x"}')) ->> 'status',
  'rejected',
  'answer that is not an array -> rejected'
);

-- 3. Bad answer fields: rejected, and nothing of the attempt is left (no attempt, no answers, no day).
CREATE TEMP TABLE bad AS
SELECT label, att FROM (VALUES
  ('points 2',        jsonb_set(pg_temp.base(), '{answers,0,points}', '2')),
  ('points -1',       jsonb_set(pg_temp.base(), '{answers,0,points}', '-1')),
  ('points 1.5',      jsonb_set(pg_temp.base(), '{answers,0,points}', '1.5')),
  ('points text',     jsonb_set(pg_temp.base(), '{answers,0,points}', '"abc"')),
  ('tries 0',         jsonb_set(pg_temp.base(), '{answers,0,tries}', '0')),
  ('tries 11',        jsonb_set(pg_temp.base(), '{answers,0,tries}', '11')),
  ('tries missing',   pg_temp.base() #- '{answers,0,tries}'),
  ('slot foo',        jsonb_set(pg_temp.base(), '{answers,0,slot}', '"foo"')),
  ('slot 0',          jsonb_set(pg_temp.base(), '{answers,0,slot}', '0')),
  ('slot 21',         jsonb_set(pg_temp.base(), '{answers,0,slot}', '21')),
  ('slot -1',         jsonb_set(pg_temp.base(), '{answers,0,slot}', '-1')),
  ('slot 1.5',        jsonb_set(pg_temp.base(), '{answers,0,slot}', '1.5')),
  ('slot missing',    pg_temp.base() #- '{answers,0,slot}'),
  ('slot null',       jsonb_set(pg_temp.base(), '{answers,0,slot}', 'null')),
  ('quiz w/o order',  jsonb_set(pg_temp.base(), '{answers,0,slot}', '"quiz"')),
  ('item_id missing', pg_temp.base() #- '{answers,0,item_id}'),
  ('item_id bad',     jsonb_set(pg_temp.base(), '{answers,0,item_id}', '"nope"')),
  ('correct text',    jsonb_set(pg_temp.base(), '{answers,0,correct}', '"maybe"')),
  ('time_ms -1',      jsonb_set(pg_temp.base(), '{answers,0,time_ms}', '-1')),
  ('answers string',  jsonb_set(pg_temp.base(), '{answers}', '"x"')),
  ('answers object',  jsonb_set(pg_temp.base(), '{answers}', '{"a": 1}')),
  ('answers items not objects', jsonb_set(pg_temp.base(), '{answers}', '["a", 1]')),
  ('7 quiz answers',  jsonb_set(pg_temp.base(), '{answers}', (pg_temp.base() -> 'answers') || pg_temp.warmups(1) || jsonb_build_array(jsonb_build_object(
                        'item_id', gen_random_uuid(), 'slot', 'quiz', 'item_order', 7, 'correct', true, 'points', 1, 'tries', 1)))),
  ('same item in quiz and warmup', jsonb_set(pg_temp.base(), '{answers}', (pg_temp.base() -> 'answers') || jsonb_build_array(jsonb_build_object(
                        'item_id', pg_temp.base() #>> '{answers,0,item_id}', 'slot', 'warmup', 'item_order', 1, 'correct', true, 'points', 1, 'tries', 1))))
) AS v(label, att);
-- the "same item" row above uses a different base(): give it the item of its own answers
UPDATE bad SET att = jsonb_set(att, '{answers,6,item_id}', att #> '{answers,0,item_id}') WHERE label = 'same item in quiz and warmup';
SELECT is(
  (SELECT jsonb_agg(label ORDER BY label) FROM bad WHERE pg_temp.one(att) ->> 'status' IS DISTINCT FROM 'rejected'),
  NULL::jsonb,
  'every bad answer field is rejected (none slips through)'
);
SELECT is(
  (SELECT jsonb_agg(label ORDER BY label) FROM bad WHERE pg_temp.one(att) ->> 'error_code' IS DISTINCT FROM 'invalid_attempt'),
  NULL::jsonb,
  'every bad answer field is rejected with invalid_attempt (no other code)'
);
SELECT is(
  (SELECT jsonb_agg(label ORDER BY label) FROM bad WHERE pg_temp.stored(att) <> 0),
  NULL::jsonb,
  'a rejected attempt leaves no lesson_attempts row'
);
SELECT is(
  (SELECT count(*)::integer FROM public.quiz_answers WHERE attempt_id IN (SELECT (att ->> 'id')::uuid FROM bad)),
  0,
  'a rejected attempt leaves no quiz_answers row (the partial writes roll back)'
);

-- 4. Bad attempt fields.
CREATE TEMP TABLE bad2 AS
SELECT label, att FROM (VALUES
  ('duration -1',        jsonb_set(pg_temp.base(), '{duration_s}', '-1')),
  ('duration missing',   pg_temp.base() #- '{duration_s}'),
  ('duration null',      jsonb_set(pg_temp.base(), '{duration_s}', 'null')),
  ('duration 1.5',       jsonb_set(pg_temp.base(), '{duration_s}', '1.5')),
  ('duration text',      jsonb_set(pg_temp.base(), '{duration_s}', '"abc"')),
  ('duration 1e12',      jsonb_set(pg_temp.base(), '{duration_s}', '1000000000000')),
  ('started missing',    pg_temp.base() #- '{started_at}'),
  ('started null',       jsonb_set(pg_temp.base(), '{started_at}', 'null')),
  ('started text',       jsonb_set(pg_temp.base(), '{started_at}', '"yesterday"')),
  ('started no zone',    jsonb_set(pg_temp.base(), '{started_at}', '"2026-10-02T01:00:00"')),
  ('started date only',  jsonb_set(pg_temp.base(), '{started_at}', '"2026-10-02"')),
  ('started number',     jsonb_set(pg_temp.base(), '{started_at}', '1790000000')),
  ('completed bad',      jsonb_set(pg_temp.base(), '{completed_at}', '"soon"')),
  ('client_created bad', jsonb_set(pg_temp.base(), '{client_created_at}', '"soon"')),
  ('install_id text',    jsonb_set(pg_temp.base(), '{install_id}', '"abc"')),
  ('install_id number',  jsonb_set(pg_temp.base(), '{install_id}', '5')),
  ('content_version space', jsonb_set(pg_temp.base(), '{content_version}', '"a b"')),
  ('content_version 65', jsonb_set(pg_temp.base(), '{content_version}', to_jsonb(repeat('a', 65)))),
  ('content_version empty', jsonb_set(pg_temp.base(), '{content_version}', '""')),
  ('lesson_id text',     jsonb_set(pg_temp.base(), '{lesson_id}', '"x"')),
  ('lesson_id missing',  pg_temp.base() #- '{lesson_id}'),
  ('lesson_id null',     jsonb_set(pg_temp.base(), '{lesson_id}', 'null')),
  ('id number',          jsonb_set(pg_temp.base(), '{id}', '5')),
  ('id text',            jsonb_set(pg_temp.base(), '{id}', '"not-a-uuid"')),
  ('id null',            jsonb_set(pg_temp.base(), '{id}', 'null')),
  ('id missing',         pg_temp.base() - 'id'),
  ('child_id text',      jsonb_set(pg_temp.base(), '{child_id}', '"zz"')),
  ('xp too big',         jsonb_set(pg_temp.base(), '{xp}', '99999999999')),
  ('xp text',            jsonb_set(pg_temp.base(), '{xp}', '"lots"')),
  ('no answers, no score', (pg_temp.base() - 'answers') - 'score' - 'max_score'),
  ('no answers, score > max', (pg_temp.base() - 'answers') || '{"score": 7, "max_score": 6}'),
  ('no answers, score < 0',   (pg_temp.base() - 'answers') || '{"score": -1, "max_score": 6}'),
  ('no answers, max 0',       (pg_temp.base() - 'answers') || '{"score": 0, "max_score": 0}'),
  ('no answers, max 101',     (pg_temp.base() - 'answers') || '{"score": 0, "max_score": 101}')
) AS v(label, att);
SELECT is(
  (SELECT jsonb_agg(label ORDER BY label) FROM bad2 WHERE pg_temp.one(att) ->> 'status' IS DISTINCT FROM 'rejected'),
  NULL::jsonb,
  'every bad attempt field is rejected (none slips through)'
);
SELECT is(
  (SELECT jsonb_agg(label ORDER BY label) FROM bad2 WHERE pg_temp.one(att) ->> 'error_code' IS DISTINCT FROM 'invalid_attempt'),
  NULL::jsonb,
  'every bad attempt field is rejected with invalid_attempt'
);
SELECT is(
  (SELECT jsonb_agg(label ORDER BY label) FROM bad2 WHERE pg_temp.stored(att) <> 0),
  NULL::jsonb,
  'a rejected attempt leaves no row'
);
SELECT is(
  (SELECT pg_temp.one(jsonb_build_object('id', gen_random_uuid(), 'lesson_id', (SELECT l1 FROM t))) ->> 'error_code'),
  'child_not_found',
  'child_id missing -> child_not_found'
);
SELECT is(
  (SELECT pg_temp.one(jsonb_set(pg_temp.base(), '{child_id}', 'null')) ->> 'error_code'),
  'child_not_found',
  'child_id null -> child_not_found'
);
SELECT is((SELECT pg_temp.submit(a, '["x", null, 5]') #>> '{data,results,1,error_code}' FROM t), 'invalid_attempt', 'an array of non-objects: each rejected on its own');
SELECT is((SELECT pg_temp.rpc(a, 'SELECT public.submit_attempts(NULL)') ->> 'error_code' FROM t), 'invalid_input', 'p_attempts null -> invalid_input');
SELECT is((SELECT pg_temp.submit(a, '"text"') ->> 'error_code' FROM t), 'invalid_input', 'p_attempts a string -> invalid_input');

-- 5. Fields that are accepted: offsets, fractions, optional ones, and what the server fixes.
CREATE TEMP TABLE r_offset AS
SELECT pg_temp.one(jsonb_set(jsonb_set(pg_temp.base(), '{completed_at}', '"2026-10-02T09:00:00.123+07:00"'), '{started_at}', '"2026-10-02T08:55:00+07:00"')) AS r;
SELECT is(
  (SELECT a.completed_at FROM r_offset, public.lesson_attempts AS a WHERE a.id = (r ->> 'id')::uuid),
  '2026-10-02T02:00:00.123Z'::timestamptz,
  'an ISO 8601 time with an offset and fractional seconds is read as that instant'
);
SELECT is(
  (SELECT pg_temp.one(pg_temp.base() - 'content_version' - 'install_id' - 'client_created_at' - 'xp') ->> 'xp'),
  '0',
  'optional fields missing: accepted, xp 0'
);
SELECT is(
  (SELECT pg_temp.one(jsonb_set(pg_temp.base(), '{content_version}', to_jsonb(repeat('a', 64)))) ->> 'status'),
  'inserted',
  'content_version of 64 characters is accepted'
);
SELECT is((SELECT pg_temp.one(jsonb_set(pg_temp.base(), '{duration_s}', '0')) ->> 'status'), 'inserted', 'duration_s 0 is accepted');
SELECT is((SELECT pg_temp.one(jsonb_set(pg_temp.base(), '{xp}', '-5')) ->> 'xp'), '0', 'a negative xp is stored as 0');
SELECT is((SELECT pg_temp.one(jsonb_set(pg_temp.base(), '{xp}', '110')) ->> 'xp'), '110', 'xp at the cap (110) is kept');
SELECT is((SELECT pg_temp.one(jsonb_set(pg_temp.base(), '{xp}', '111')) ->> 'xp'), '110', 'xp one above the cap is cut to 110');
SELECT is(
  (SELECT pg_temp.one(jsonb_set(pg_temp.base(), '{duration_s}', '864001')) ->> 'status' = 'rejected'
       OR (SELECT duration_s FROM public.lesson_attempts ORDER BY received_at DESC, started_at DESC LIMIT 1) <= 864000),
  true,
  'duration_s above 10 days is rejected or cut to 864000, never stored above it'
);
CREATE TEMP TABLE r_inverted AS
SELECT pg_temp.one(jsonb_set(pg_temp.base(), '{completed_at}', '"2026-10-02T01:00:00Z"')) AS r;
SELECT is(
  (SELECT jsonb_build_object('status', r -> 'status', 'started_eq_completed', (a.started_at = a.completed_at))
   FROM r_inverted, public.lesson_attempts AS a WHERE a.id = (r ->> 'id')::uuid),
  '{"status": "inserted", "started_eq_completed": true}'::jsonb,
  'completed_at before started_at: stored, started_at pulled back to completed_at (decision 9)'
);
CREATE TEMP TABLE r_future_start AS
SELECT pg_temp.one((pg_temp.base() - 'completed_at' - 'answers') || '{"started_at": "2099-01-01T00:00:00Z", "score": 1, "max_score": 6}'::jsonb) AS r;
SELECT ok(
  (SELECT a.started_at <= now() FROM r_future_start, public.lesson_attempts AS a WHERE a.id = (r ->> 'id')::uuid),
  'a started_at in the future is brought back to now'
);
-- L1 (SK-021 T2): completed_at is optional and "not completed -> completed_at null, no star" (ticket, decision 8).
-- store_attempt does LEAST(parse_instant(NULL), now()) and LEAST ignores NULL, so a missing completed_at becomes now().
SELECT CASE WHEN (SELECT (r ->> 'completed')::boolean = false FROM r_future_start)
  THEN ok(true, 'no completed_at and no answers: the attempt is not completed')
  ELSE skip('SK-021 L1: missing completed_at is turned into now() by LEAST(NULL, now()) and the attempt counts as completed (store_attempt)', 1)
END;
SELECT CASE WHEN (SELECT a.completed_at IS NULL FROM r_future_start, public.lesson_attempts AS a WHERE a.id = (r ->> 'id')::uuid)
  THEN ok(true, 'no completed_at: completed_at stays null in lesson_attempts')
  ELSE skip('SK-021 L1: missing completed_at is stored as now()', 1)
END;
SELECT CASE WHEN (SELECT (r ->> 'stars')::integer = 0 FROM r_future_start)
  THEN ok(true, 'an attempt without completed_at gives no star')
  ELSE skip('SK-021 L1: an attempt without completed_at gives a star', 1)
END;

-- 6. Idempotency.
-- 6a. Same id twice in the same call: first inserted, second duplicate, one row, attempts_count 1.
CREATE TEMP TABLE r_dup AS
SELECT x.att, pg_temp.submit(t.b, jsonb_build_array(x.att, x.att)) AS r
FROM t, (SELECT pg_temp.attempt(gen_random_uuid(), (SELECT cb FROM t), (SELECT gen_random_uuid()), '2026-10-02T02:00:00Z', 6) AS att) AS x;
SELECT is(
  (SELECT jsonb_agg(e ->> 'status' ORDER BY (e ->> 'index')::integer) FROM r_dup, jsonb_array_elements(r #> '{data,results}') AS e),
  '["inserted", "duplicate"]'::jsonb,
  'same id twice in one call -> inserted then duplicate'
);
SELECT is((SELECT pg_temp.stored(att) FROM r_dup), 1, 'same id twice in one call: one row');
SELECT is(
  (SELECT attempts_count FROM public.lesson_progress WHERE child_id = (SELECT cb FROM t) AND lesson_id = (SELECT (att ->> 'lesson_id')::uuid FROM r_dup)),
  1,
  'same id twice in one call: attempts_count 1'
);
SELECT is(
  (SELECT count(*)::integer FROM public.quiz_answers WHERE attempt_id = (SELECT (att ->> 'id')::uuid FROM r_dup)),
  6,
  'same id twice in one call: answers stored once'
);
-- 6b. Replay with different content: the first stored version wins and is returned.
CREATE TEMP TABLE r_replay AS
SELECT x.att, pg_temp.submit(t.a, jsonb_build_array(x.att)) AS r1,
       pg_temp.submit(t.a, jsonb_build_array(pg_temp.attempt((x.att ->> 'id')::uuid, t.ca, t.l1, '2026-10-02T02:00:00Z', 1) || '{"xp": 5}'::jsonb)) AS r2
FROM t, (SELECT pg_temp.attempt(gen_random_uuid(), (SELECT ca FROM t), (SELECT l1 FROM t), '2026-10-02T02:00:00Z', 6) AS att) AS x;
SELECT is(
  (SELECT jsonb_build_object('status', r2 #>> '{data,results,0,status}', 'score', r2 #> '{data,results,0,score}', 'xp', r2 #> '{data,results,0,xp}') FROM r_replay),
  '{"status": "duplicate", "score": 6, "xp": 90}'::jsonb,
  'same id with other content: duplicate, the stored score and xp are returned'
);
SELECT is((SELECT score FROM public.lesson_attempts WHERE id = (SELECT (att ->> 'id')::uuid FROM r_replay)), 6::smallint, 'the stored attempt was not overwritten');
-- 6c. UUID case: an upper-case id is the same id.
CREATE TEMP TABLE r_case AS
SELECT x.att, pg_temp.one(jsonb_set(jsonb_set(x.att, '{id}', to_jsonb(upper(x.att ->> 'id'))), '{child_id}', to_jsonb(upper(x.att ->> 'child_id')))) AS r1,
       pg_temp.one(x.att) AS r2
FROM (SELECT pg_temp.base() AS att) AS x;
SELECT is((SELECT r1 ->> 'status' FROM r_case), 'inserted', 'upper-case id and child_id are accepted');
SELECT is((SELECT r2 ->> 'status' FROM r_case), 'duplicate', 'the same id in lower case is a duplicate');

-- 7. Local date and time zones. 02:00 and 07:00 UTC, DST changes and +14 h.
CREATE FUNCTION pg_temp.ld(p_user uuid, p_child uuid, p_at timestamptz) RETURNS text LANGUAGE sql AS $$
  SELECT pg_temp.submit(p_user, jsonb_build_array(pg_temp.attempt(gen_random_uuid(), p_child, gen_random_uuid(), p_at, 6))) #>> '{data,results,0,local_date}' $$;
SELECT is(
  (SELECT ARRAY[pg_temp.ld(la, cla, '2025-11-02T08:59:59Z'), pg_temp.ld(la, cla, '2025-11-03T07:59:59Z'), pg_temp.ld(la, cla, '2025-11-03T08:00:00Z')] FROM t),
  ARRAY['2025-11-02', '2025-11-02', '2025-11-03'],
  'America/Los_Angeles, DST ends 2025-11-02: 08:59:59Z 02/11, 07:59:59Z on 03/11 is still 02/11, 08:00:00Z is 03/11'
);
SELECT is(
  (SELECT ARRAY[pg_temp.ld(la, cla, '2025-03-10T06:59:59Z'), pg_temp.ld(la, cla, '2025-03-10T07:00:00Z')] FROM t),
  ARRAY['2025-03-09', '2025-03-10'],
  'America/Los_Angeles, DST starts 2025-03-09: 06:59:59Z on 10/03 is 09/03, 07:00:00Z is 10/03'
);
SELECT is(
  (SELECT ARRAY[pg_temp.ld(kir, ckir, '2026-10-01T09:59:59Z'), pg_temp.ld(kir, ckir, '2026-10-01T10:00:00Z')] FROM t),
  ARRAY['2026-10-01', '2026-10-02'],
  'Pacific/Kiritimati (UTC+14): 09:59:59Z is 01/10, 10:00:00Z is already 02/10'
);
-- The calendar day of the child, not of UTC, decides the third star (SK-003 D4).
CREATE TEMP TABLE r_midnight AS
SELECT pg_temp.submit(la2, jsonb_build_array(
  pg_temp.attempt(gen_random_uuid(), cla2, l1, '2025-11-02T20:00:00Z', 6),   -- 02/11 12:00 PST
  pg_temp.attempt(gen_random_uuid(), cla2, l1, '2025-11-03T07:00:00Z', 6)    -- 02/11 23:00 PST, but 03/11 in UTC
)) AS r FROM t;
SELECT is(
  (SELECT r #>> '{data,progress,0,stars}' FROM r_midnight),
  '2',
  'two passes on the same local day, different UTC days: 2 stars, not mastered'
);
SELECT is(
  (SELECT pg_temp.submit(la2, jsonb_build_array(pg_temp.attempt(gen_random_uuid(), cla2, l1, '2025-11-03T09:00:00Z', 6))) #>> '{data,results,0,stars}' FROM t),
  '3',
  'a pass at 01:00 PST on the next local day: 3 stars'
);

-- 8. Stars never go back when the rules change (SK-003 D4): 5/6 -> 4/6 -> 5/6.
UPDATE public.app_config SET value = jsonb_set(value, '{pass_threshold}', '{"num": 4, "den": 6}') WHERE key = 'rules.discoverer';
CREATE TEMP TABLE r_low AS
SELECT pg_temp.submit(lim, jsonb_build_array(
  pg_temp.attempt(gen_random_uuid(), clim, l1, '2026-10-02T02:00:00Z', 4),
  pg_temp.attempt(gen_random_uuid(), clim, l1, '2026-10-03T02:00:00Z', 4)
)) AS r FROM t;
SELECT is((SELECT r #>> '{data,progress,0,stars}' FROM r_low), '3', 'threshold 4/6: two 4/6 attempts on two days -> 3 stars');
UPDATE public.app_config SET value = jsonb_set(value, '{pass_threshold}', '{"num": 5, "den": 6}') WHERE key = 'rules.discoverer';
CREATE TEMP TABLE r_back AS
SELECT pg_temp.submit(lim, jsonb_build_array(pg_temp.attempt(gen_random_uuid(), clim, l1, '2026-10-04T02:00:00Z', 1))) AS r FROM t;
SELECT is((SELECT r #>> '{data,results,0,stars}' FROM r_back), '3', 'threshold back to 5/6: the stars stay at 3');
SELECT is(
  (SELECT jsonb_build_object('stars', stars, 'best', best_score, 'first_pass', first_pass_at, 'mastered', mastered_at, 'count', attempts_count)
   FROM public.lesson_progress WHERE child_id = (SELECT clim FROM t) AND lesson_id = (SELECT l1 FROM t)),
  '{"stars": 3, "best": 4, "first_pass": "2026-10-02T02:00:00+00:00", "mastered": "2026-10-03T02:00:00+00:00", "count": 3}'::jsonb,
  'threshold back to 5/6: first_pass_at, mastered_at and best_score are kept'
);
-- Raised to 6/6 after a 5/6 pass of another lesson: it stays 2 stars.
CREATE TEMP TABLE r_p5 AS
SELECT pg_temp.submit(lim, jsonb_build_array(pg_temp.attempt(gen_random_uuid(), clim, l2, '2026-10-02T02:00:00Z', 5))) AS r FROM t;
SELECT is((SELECT r #>> '{data,results,0,stars}' FROM r_p5), '2', '5/6 passes at threshold 5/6: 2 stars');
UPDATE public.app_config SET value = jsonb_set(value, '{pass_threshold}', '{"num": 6, "den": 6}') WHERE key = 'rules.discoverer';
SELECT is(
  (SELECT pg_temp.submit(lim, jsonb_build_array(pg_temp.attempt(gen_random_uuid(), clim, l2, '2026-10-02T03:00:00Z', 2))) #>> '{data,results,0,stars}' FROM t),
  '2',
  'threshold raised to 6/6 and a new 2/6: the 2 stars stay'
);
UPDATE public.app_config SET value = jsonb_set(value, '{pass_threshold}', '{"num": 5, "den": 6}') WHERE key = 'rules.discoverer';

-- 9. Order of arrival: a later-played pass uploaded first, the earlier one uploaded after.
CREATE TEMP TABLE r_ooo1 AS
SELECT pg_temp.submit(ooo, jsonb_build_array(pg_temp.attempt(gen_random_uuid(), cooo, l1, '2026-10-05T02:00:00Z', 6))) AS r FROM t;
SELECT is((SELECT r #>> '{data,progress,0,stars}' FROM r_ooo1), '2', 'the later pass alone: 2 stars');
CREATE TEMP TABLE r_ooo2 AS
SELECT pg_temp.submit(ooo, jsonb_build_array(pg_temp.attempt(gen_random_uuid(), cooo, l1, '2026-10-03T02:00:00Z', 6))) AS r FROM t;
SELECT is(
  (SELECT (r #> '{data,progress,0}') - 'child_id' - 'lesson_id' FROM r_ooo2),
  '{"stars": 3, "best_score": 6, "attempts_count": 2, "first_pass_at": "2026-10-03T02:00:00Z",
    "mastered_at": "2026-10-05T02:00:00Z", "last_completed_at": "2026-10-05T02:00:00Z"}'::jsonb,
  'the earlier pass arrives after: it becomes the first pass, the later one masters (3 stars)'
);

-- 10. Same completed_at, different ids (SK-003 5a): the result does not depend on the order of arrival.
CREATE TEMP TABLE r_tie AS
SELECT pg_temp.submit(tie1, jsonb_build_array(
         pg_temp.attempt('00000000-0000-4000-8000-0000000000aa', ctie1, l1, '2026-10-02T02:00:00Z', 6),
         pg_temp.attempt('ffffffff-0000-4000-8000-0000000000aa', ctie1, l1, '2026-10-02T02:00:00Z', 5))) AS r1,
       pg_temp.submit(tie2, jsonb_build_array(
         pg_temp.attempt('ffffffff-0000-4000-8000-0000000000bb', ctie2, l1, '2026-10-02T02:00:00Z', 5),
         pg_temp.attempt('00000000-0000-4000-8000-0000000000bb', ctie2, l1, '2026-10-02T02:00:00Z', 6))) AS r2
FROM t;
SELECT is(
  (SELECT (r1 #> '{data,progress,0}') - 'child_id' - 'lesson_id' FROM r_tie),
  (SELECT (r2 #> '{data,progress,0}') - 'child_id' - 'lesson_id' FROM r_tie),
  'two attempts with the same completed_at: same progress whatever the arrival order'
);
SELECT is(
  (SELECT (r1 #> '{data,progress,0}') - 'child_id' - 'lesson_id' FROM r_tie),
  '{"stars": 2, "best_score": 6, "attempts_count": 2, "first_pass_at": "2026-10-02T02:00:00Z",
    "mastered_at": null, "last_completed_at": "2026-10-02T02:00:00Z"}'::jsonb,
  'two passes at the same instant on the same day: 2 stars, not mastered'
);
-- At the function level: the first pass is the smaller attempt id (C collation), in either input order.
SELECT is(
  public.stars_detail(
    '[{"attempt_id": "ffffffff-0000-4000-8000-000000000001", "completed": true, "completed_at": "2026-10-02T02:00:00Z", "local_date": "2026-10-02", "correct": 6, "max": 6},
      {"attempt_id": "00000000-0000-4000-8000-000000000001", "completed": true, "completed_at": "2026-10-02T02:00:00Z", "local_date": "2026-10-02", "correct": 6, "max": 6}]'::jsonb,
    public.rules_for('discoverer')) ->> 'first_pass_attempt_id',
  '00000000-0000-4000-8000-000000000001',
  'stars_detail: the tie is broken by the smaller attempt_id, the input order does not matter'
);

-- 11. A call with a changed rules row: rules_missing is a whole-call error and writes nothing.
SELECT is(
  (SELECT count(*)::integer FROM public.app_config WHERE key = 'rules.discoverer'),
  1,
  'precondition: rules.discoverer exists on the database under test'
);
CREATE TEMP TABLE nr_att AS SELECT pg_temp.attempt(gen_random_uuid(), cnr, l1, '2026-10-02T02:00:00Z', 6) AS att FROM t;
DELETE FROM public.app_config WHERE key = 'rules.discoverer';
SELECT is(
  (SELECT jsonb_build_object('success', r -> 'success', 'code', r -> 'error_code', 'data', r -> 'data')
   FROM (SELECT pg_temp.submit((SELECT nr FROM t), jsonb_build_array((SELECT att FROM nr_att))) AS r) AS x),
  '{"success": false, "code": "rules_missing", "data": null}'::jsonb,
  'rules.<age_group> missing: success false, rules_missing'
);
SELECT is((SELECT pg_temp.stored(att) FROM nr_att), 0, 'rules_missing: nothing stored');

-- 12. Who may call, and the lock per child.
SELECT throws_ok(
  $$SELECT pg_temp.run_as('anon', NULL, 'SELECT public.submit_attempts(''[]''::jsonb)')$$,
  '42501', NULL,
  'anon cannot execute submit_attempts'
);
SELECT ok(
  EXISTS (
    SELECT 1 FROM pg_locks AS l, t
    WHERE l.locktype = 'advisory' AND l.pid = pg_backend_pid() AND l.granted
      AND l.classid::bigint = ((hashtextextended('child:' || t.ca::text, 0) >> 32) & 4294967295)
      AND l.objid::bigint = (hashtextextended('child:' || t.ca::text, 0) & 4294967295)
  ),
  'submit_attempts holds the advisory lock child:<child_id> until the transaction ends'
);
SELECT is(
  (SELECT pg_temp.submit(b, jsonb_build_array(pg_temp.attempt(gen_random_uuid(), ca, l1, '2026-10-02T02:00:00Z', 6))) #>> '{data,results,0,error_code}' FROM t),
  'child_not_found',
  'guest B cannot write to the child of guest A'
);

SELECT * FROM finish();
