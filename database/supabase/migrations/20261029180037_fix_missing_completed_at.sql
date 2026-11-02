-- SK-021 L1 (tester T2, 29/10/2026) · An attempt without completed_at was stored as completed at now().
-- store_attempt did LEAST(parse_instant(completed_at), now()); LEAST skips NULL, so a missing
-- completed_at became now(), the attempt counted as completed (both with and without answers), got
-- stars and a study day. Now a missing completed_at stays NULL: completed = false, completed_at NULL,
-- no star (decision 8). A completed_at in the future is still brought back to now.
--
-- Same state as database/supabase/schemas/40_internal_functions.sql. Only public.store_attempt
-- changes: same signature, not SECURITY DEFINER (internal helper run by the RPCs as their owner),
-- SET search_path = ''. CREATE OR REPLACE keeps the owner and the privileges; the REVOKE / GRANT
-- below restate them as in the schema file. No RPC signature changes; the iOS app needs no change.

CREATE OR REPLACE FUNCTION public.store_attempt(p_owner_id uuid, p_attempt jsonb, p_index integer)
RETURNS jsonb
LANGUAGE plpgsql
SET search_path = ''
AS $$
DECLARE
  c_quiz_length constant integer := 6;      -- B4.4, SK-001: a quiz has exactly 6 questions
  c_max_answers constant integer := 20;
  c_max_duration_s constant integer := 864000;
  v_raw_id text := p_attempt ->> 'id';
  v_id uuid;
  v_child public.child_profiles;
  v_existing public.lesson_attempts;
  v_rules jsonb;
  v_now timestamptz := now();
  v_started_at timestamptz;
  v_sent_completed_at timestamptz;
  v_completed_at timestamptz;
  v_duration_s integer;
  v_answers jsonb;
  v_normalized jsonb := '[]'::jsonb;
  v_score jsonb;
  v_correct integer;
  v_max integer;
  v_completed boolean;
  v_xp integer;
  v_xp_cap integer;
  v_row public.lesson_attempts;
BEGIN
  IF jsonb_typeof(p_attempt) IS DISTINCT FROM 'object' THEN
    RETURN jsonb_build_object('index', p_index, 'id', NULL, 'status', 'rejected',
      'error_code', 'invalid_attempt', 'error', 'an attempt must be a JSON object');
  END IF;

  BEGIN
    v_id := v_raw_id::uuid;
    IF v_id IS NULL THEN
      RETURN jsonb_build_object('index', p_index, 'id', NULL, 'status', 'rejected',
        'error_code', 'invalid_attempt', 'error', 'id is missing');
    END IF;

    SELECT * INTO v_child
    FROM public.child_profiles AS c
    WHERE c.id = (p_attempt ->> 'child_id')::uuid AND c.owner_id = p_owner_id;
    IF NOT FOUND THEN
      RETURN jsonb_build_object('index', p_index, 'id', v_id, 'status', 'rejected',
        'error_code', 'child_not_found', 'error', 'child_id is not a profile of this account');
    END IF;

    -- Idempotent: an id already stored is never written again.
    SELECT * INTO v_existing FROM public.lesson_attempts AS a WHERE a.id = v_id;
    IF FOUND THEN
      IF v_existing.child_id <> v_child.id THEN
        RETURN jsonb_build_object('index', p_index, 'id', v_id, 'status', 'rejected',
          'error_code', 'id_conflict', 'error', 'this attempt id is already used by another profile');
      END IF;
      RETURN jsonb_build_object('index', p_index, 'id', v_id, 'status', 'duplicate',
        'error_code', NULL, 'error', NULL,
        'child_id', v_existing.child_id, 'lesson_id', v_existing.lesson_id,
        'score', v_existing.score, 'max_score', v_existing.max_score,
        'completed', v_existing.completed_at IS NOT NULL, 'local_date', v_existing.local_date,
        'xp', v_existing.xp);
    END IF;

    v_rules := public.rules_for(v_child.age_group);

    -- Times come from the device clock (the attempt may have been played offline). A time in the
    -- future is brought back to now; started_at is never after the end.
    v_started_at := public.parse_instant(p_attempt ->> 'started_at');
    v_duration_s := (p_attempt ->> 'duration_s')::integer;
    IF v_started_at IS NULL OR v_duration_s IS NULL THEN
      RETURN jsonb_build_object('index', p_index, 'id', v_id, 'status', 'rejected',
        'error_code', 'invalid_attempt', 'error', 'started_at and duration_s are required');
    END IF;
    -- No completed_at means not completed (decision 8): it must stay NULL, so no LEAST here, which
    -- would skip the NULL and return now (SK-021 L1).
    v_sent_completed_at := public.parse_instant(p_attempt ->> 'completed_at');
    IF v_sent_completed_at > v_now THEN
      v_sent_completed_at := v_now;
    END IF;
    v_started_at := LEAST(v_started_at, COALESCE(v_sent_completed_at, v_now));

    v_answers := COALESCE(NULLIF(p_attempt -> 'answers', 'null'::jsonb), '[]'::jsonb);
    IF jsonb_typeof(v_answers) <> 'array' OR jsonb_array_length(v_answers) > c_max_answers THEN
      RETURN jsonb_build_object('index', p_index, 'id', v_id, 'status', 'rejected',
        'error_code', 'invalid_attempt', 'error', format('answers must be an array of at most %s items', c_max_answers));
    END IF;

    IF jsonb_array_length(v_answers) > 0 THEN
      -- slot as a number (the app's AttemptRecord today) means the quiz item at that position;
      -- slot as 'quiz' / 'warmup' takes the position from item_order.
      SELECT COALESCE(jsonb_agg(jsonb_build_object(
               'item_id', e ->> 'item_id',
               'slot', CASE WHEN jsonb_typeof(e -> 'slot') = 'number' THEN 'quiz' ELSE e ->> 'slot' END,
               'item_order', CASE WHEN jsonb_typeof(e -> 'slot') = 'number' THEN e -> 'slot' ELSE e -> 'item_order' END,
               'correct', e -> 'correct',
               'points', e -> 'points',
               'answer', COALESCE(NULLIF(e -> 'answer', 'null'::jsonb), '[]'::jsonb),
               'time_ms', e -> 'time_ms',
               'hint_used', COALESCE(NULLIF(e -> 'hint_used', 'null'::jsonb), 'false'::jsonb),
               'tries', e -> 'tries'
             ) ORDER BY t.ord), '[]'::jsonb)
        INTO v_normalized
      FROM jsonb_array_elements(v_answers) WITH ORDINALITY AS t(e, ord);

      -- The server keeps the app's per-question result (SK-003) but adds up the score itself.
      SELECT public.score_lesson(
               COALESCE(jsonb_agg(jsonb_build_object('item_id', x.item_id, 'points', x.points, 'final_correct', x.correct))
                          FILTER (WHERE x.slot = 'quiz'), '[]'::jsonb),
               COALESCE(jsonb_agg(jsonb_build_object('item_id', x.item_id, 'points', x.points, 'final_correct', x.correct))
                          FILTER (WHERE x.slot = 'warmup'), '[]'::jsonb))
        INTO v_score
      FROM jsonb_to_recordset(v_normalized) AS x(item_id uuid, slot text, points integer, correct boolean);

      IF v_score ? 'error' THEN
        RETURN jsonb_build_object('index', p_index, 'id', v_id, 'status', 'rejected',
          'error_code', 'invalid_attempt', 'error', 'quiz answers: ' || (v_score ->> 'error'));
      END IF;
      v_correct := (v_score ->> 'correct')::integer;
      v_max := (v_score ->> 'max')::integer;
      v_completed := (v_score ->> 'completed')::boolean AND v_sent_completed_at IS NOT NULL;
    ELSE
      -- No answers sent: keep the app's score.
      v_correct := (p_attempt ->> 'score')::integer;
      v_max := (p_attempt ->> 'max_score')::integer;
      v_completed := v_sent_completed_at IS NOT NULL;
    END IF;

    v_completed_at := CASE WHEN v_completed THEN v_sent_completed_at END;

    -- XP is not settled yet (B18 #13): the server keeps the app's value, capped at the most one
    -- attempt can earn under the rules.
    v_xp_cap := COALESCE(v_max, c_quiz_length) * COALESCE((v_rules ->> 'xp_per_correct')::integer, 0)
              + COALESCE((v_rules ->> 'xp_lesson_complete')::integer, 0)
              + COALESCE((v_rules ->> 'xp_game_complete')::integer, 0)
              + COALESCE((v_rules ->> 'xp_mastery_review')::integer, 0);
    v_xp := LEAST(GREATEST(COALESCE((p_attempt ->> 'xp')::integer, 0), 0), v_xp_cap);

    INSERT INTO public.lesson_attempts (
      id, child_id, lesson_id, content_version, started_at, completed_at, local_date,
      score, max_score, duration_s, xp, install_id, client_created_at
    )
    VALUES (
      v_id,
      v_child.id,
      (p_attempt ->> 'lesson_id')::uuid,
      p_attempt ->> 'content_version',
      v_started_at,
      v_completed_at,
      public.local_date(COALESCE(v_sent_completed_at, v_started_at), v_child.timezone),
      v_correct,
      v_max,
      LEAST(v_duration_s, c_max_duration_s),
      v_xp,
      (p_attempt ->> 'install_id')::uuid,
      public.parse_instant(p_attempt ->> 'client_created_at')
    )
    ON CONFLICT (id) DO NOTHING
    RETURNING * INTO v_row;

    IF NOT FOUND THEN
      -- Stored by a concurrent call between the check above and the insert.
      RETURN jsonb_build_object('index', p_index, 'id', v_id, 'status', 'rejected',
        'error_code', 'id_conflict', 'error', 'this attempt id was stored by another request; send it again');
    END IF;

    INSERT INTO public.quiz_answers (                                                        -- [optional]
      attempt_id, item_id, slot, item_order, correct, points, answer, time_ms, hint_used, tries -- [optional]
    )                                                                                         -- [optional]
    SELECT v_id, x.item_id, x.slot, x.item_order, x.correct, x.points, x.answer, x.time_ms, x.hint_used, x.tries -- [optional]
    FROM jsonb_to_recordset(v_normalized) AS x(                                                -- [optional]
      item_id uuid, slot text, item_order smallint, correct boolean, points smallint,         -- [optional]
      answer jsonb, time_ms integer, hint_used boolean, tries smallint);                       -- [optional]

    RETURN jsonb_build_object('index', p_index, 'id', v_id, 'status', 'inserted',
      'error_code', NULL, 'error', NULL,
      'child_id', v_row.child_id, 'lesson_id', v_row.lesson_id,
      'score', v_row.score, 'max_score', v_row.max_score,
      'completed', v_row.completed_at IS NOT NULL, 'local_date', v_row.local_date,
      'xp', v_row.xp);
  EXCEPTION
    WHEN data_exception OR integrity_constraint_violation THEN
      RETURN jsonb_build_object('index', p_index, 'id', v_raw_id, 'status', 'rejected',
        'error_code', 'invalid_attempt', 'error', SQLERRM);
  END;
END;
$$;

REVOKE ALL ON FUNCTION public.store_attempt(uuid, jsonb, integer) FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.store_attempt(uuid, jsonb, integer) TO service_role;
