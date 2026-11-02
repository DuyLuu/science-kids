-- Prelude of every *.test.sql. `node scripts/db-apply.mjs --test` sends this file first, in the same
-- transaction as the test file, then rolls the whole transaction back: nothing stays in the database.
-- The helpers live in pg_temp, so they also disappear with the session.
--
-- Assertions always run as postgres; only the SQL given to run_as runs as anon or authenticated, with
-- the JWT claims PostgREST would set (technical-plan.md B15: `request.jwt.claims` with sub, is_anonymous).

-- A new auth user (a guest by default). Returns its id.
CREATE FUNCTION pg_temp.new_user(p_anonymous boolean DEFAULT true)
RETURNS uuid
LANGUAGE plpgsql
AS $$
DECLARE
  v_id uuid := gen_random_uuid();
BEGIN
  INSERT INTO auth.users (id, aud, role, is_anonymous, created_at, updated_at)
  VALUES (v_id, 'authenticated', 'authenticated', p_anonymous, now(), now());
  RETURN v_id;
END;
$$;

-- Runs p_sql as p_role with the claims of p_user (NULL: no user) and returns the first column of the
-- first row as text. The role and the claims are reset before returning; when p_sql raises, the error
-- goes up unchanged (throws_ok rolls the SET LOCAL back with its subtransaction).
CREATE FUNCTION pg_temp.run_as(p_role text, p_user uuid, p_sql text)
RETURNS text
LANGUAGE plpgsql
AS $$
DECLARE
  v_result text;
BEGIN
  PERFORM set_config('request.jwt.claims', jsonb_build_object(
    'sub', p_user,
    'role', p_role,
    'is_anonymous', COALESCE((SELECT u.is_anonymous FROM auth.users AS u WHERE u.id = p_user), false)
  )::text, true);
  EXECUTE format('SET LOCAL ROLE %I', p_role);
  EXECUTE p_sql INTO v_result;
  RESET ROLE;
  PERFORM set_config('request.jwt.claims', '', true);
  RETURN v_result;
END;
$$;

-- p_sql as a signed-in user (guest or parent), result as text.
CREATE FUNCTION pg_temp.as_user(p_user uuid, p_sql text)
RETURNS text
LANGUAGE sql
AS $$ SELECT pg_temp.run_as('authenticated', p_user, p_sql) $$;

-- An RPC called by a signed-in user, result as jsonb.
CREATE FUNCTION pg_temp.rpc(p_user uuid, p_sql text)
RETURNS jsonb
LANGUAGE sql
AS $$ SELECT pg_temp.run_as('authenticated', p_user, p_sql)::jsonb $$;

-- Sorted keys of a JSON object, to check the shape of an RPC result.
CREATE FUNCTION pg_temp.keys(p_object jsonb)
RETURNS text[]
LANGUAGE sql
AS $$ SELECT array_agg(k ORDER BY k) FROM jsonb_object_keys(p_object) AS k $$;

-- Creates the profile of p_user through the RPC (grade 3, Asia/Ho_Chi_Minh unless given) and returns its id.
CREATE FUNCTION pg_temp.new_child(p_user uuid, p_timezone text DEFAULT 'Asia/Ho_Chi_Minh')
RETURNS uuid
LANGUAGE sql
AS $$
  SELECT (pg_temp.rpc(p_user, format(
    'SELECT public.create_child_profile(%L, %L, %s, %L, %L, %L)', 'Minh', 'ech', 3, 'bilingual', 'both', p_timezone
  )) #>> '{data,id}')::uuid
$$;

-- An attempt as the iOS app sends it (AttemptRecord, SK-012): ISO 8601 UTC times, `slot` = 1-based
-- position in the quiz, plus `stars` and `local_date` that the server ignores. p_correct questions
-- are right at the first try; p_answered questions are answered (6 = completed).
CREATE FUNCTION pg_temp.attempt(
  p_id uuid, p_child_id uuid, p_lesson_id uuid, p_completed_at timestamptz,
  p_correct integer, p_answered integer DEFAULT 6
)
RETURNS jsonb
LANGUAGE sql
AS $$
  SELECT jsonb_build_object(
    'id', p_id,
    'child_id', p_child_id,
    'lesson_id', p_lesson_id,
    'content_version', 'a1b2c3d4e5f6',
    'started_at', to_char((p_completed_at - interval '5 minutes') AT TIME ZONE 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS"Z"'),
    'completed_at', to_char(p_completed_at AT TIME ZONE 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS"Z"'),
    'score', p_correct,
    'max_score', 6,
    'duration_s', 300,
    'xp', p_correct * 10 + 30,
    'stars', 3,
    'local_date', '1999-01-01',
    'answers', COALESCE((
      SELECT jsonb_agg(jsonb_build_object(
        'item_id', md5(p_id::text || n::text)::uuid,
        'slot', n,
        'correct', n <= p_correct,
        'points', CASE WHEN n <= p_correct THEN 1 ELSE 0 END,
        'answer', jsonb_build_array(jsonb_build_object('selected', 'opt_a')),
        'hint_used', false,
        'tries', CASE WHEN n <= p_correct THEN 1 ELSE 2 END
      ) ORDER BY n)
      FROM generate_series(1, p_answered) AS n
    ), '[]'::jsonb)
  )
$$;

-- submit_attempts called by p_user with the given attempts.
CREATE FUNCTION pg_temp.submit(p_user uuid, p_attempts jsonb)
RETURNS jsonb
LANGUAGE sql
AS $$ SELECT pg_temp.rpc(p_user, format('SELECT public.submit_attempts(%L::jsonb)', p_attempts)) $$;
