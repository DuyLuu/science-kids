-- Declared state (SK-021).

-- =============================================================================================
-- 4. Internal helpers. Not callable by anon or authenticated (EXECUTE revoked below);
--    the RPCs run them as their owner.
-- =============================================================================================

CREATE FUNCTION public.rpc_ok(p_data jsonb)
RETURNS jsonb
LANGUAGE sql
IMMUTABLE
SET search_path = ''
AS $$
  SELECT jsonb_build_object('success', true, 'error_code', NULL, 'error', NULL, 'data', p_data)
$$;

CREATE FUNCTION public.rpc_error(p_error_code text, p_error text)
RETURNS jsonb
LANGUAGE sql
IMMUTABLE
SET search_path = ''
AS $$
  SELECT jsonb_build_object('success', false, 'error_code', p_error_code, 'error', p_error, 'data', NULL)
$$;

-- Timestamps in RPC output: ISO 8601 UTC, whole seconds ("2026-11-02T02:00:00Z"), like the app's files.
CREATE FUNCTION public.iso_utc(p_at timestamptz)
RETURNS text
LANGUAGE sql
STABLE
STRICT
SET search_path = ''
AS $$
  SELECT to_char(p_at AT TIME ZONE 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS"Z"')
$$;

-- An instant sent by the app: ISO 8601 with Z or an offset, optional fraction of a second.
-- NULL stays NULL; anything else raises invalid_datetime_format (22007).
CREATE FUNCTION public.parse_instant(p_text text)
RETURNS timestamptz
LANGUAGE plpgsql
STABLE
SET search_path = ''
AS $$
BEGIN
  IF p_text IS NULL THEN
    RETURN NULL;
  END IF;
  IF p_text !~ '^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(\.\d{1,9})?(Z|[+-]\d{2}:?\d{2})$' THEN
    RAISE EXCEPTION USING ERRCODE = '22007', MESSAGE = format('not an ISO 8601 instant with a zone: %s', left(p_text, 64));
  END IF;
  RETURN p_text::timestamptz;
END;
$$;

CREATE FUNCTION public.rules_for(p_age_group text)
RETURNS jsonb
LANGUAGE sql
STABLE
SET search_path = ''
AS $$
  SELECT c.value FROM public.app_config AS c WHERE c.key = 'rules.' || p_age_group
$$;

CREATE FUNCTION public.child_profile_json(p_profile public.child_profiles)
RETURNS jsonb
LANGUAGE sql
STABLE
SET search_path = ''
AS $$
  SELECT jsonb_build_object(
    'id', p_profile.id,
    'display_name', p_profile.display_name,
    'avatar', p_profile.avatar,
    'grade', p_profile.grade,
    'age_group', p_profile.age_group,
    'language_mode', p_profile.language_mode,
    'voice_mode', p_profile.voice_mode,
    'timezone', p_profile.timezone,
    'locked_reason', p_profile.locked_reason,
    'created_at', public.iso_utc(p_profile.created_at),
    'archived_at', public.iso_utc(p_profile.archived_at)
  )
$$;

CREATE FUNCTION public.lesson_progress_json(p_progress public.lesson_progress)
RETURNS jsonb
LANGUAGE sql
STABLE
SET search_path = ''
AS $$
  SELECT jsonb_build_object(
    'child_id', p_progress.child_id,
    'lesson_id', p_progress.lesson_id,
    'stars', p_progress.stars,
    'best_score', p_progress.best_score,
    'attempts_count', p_progress.attempts_count,
    'first_pass_at', public.iso_utc(p_progress.first_pass_at),
    'mastered_at', public.iso_utc(p_progress.mastered_at),
    'last_completed_at', public.iso_utc(p_progress.last_completed_at)
  )
$$;

-- Recomputes lesson_progress of one child and lesson from all its attempts (compute_stars).
-- Stars, best score and the first-pass / mastered dates never go back (SK-003 D4), even if the
-- rules change later.
CREATE FUNCTION public.refresh_lesson_progress(p_child_id uuid, p_lesson_id uuid, p_rules jsonb)
RETURNS void
LANGUAGE plpgsql
SET search_path = ''
AS $$
DECLARE
  v_attempts jsonb;
  v_count integer;
  v_best integer;
  v_last timestamptz;
  v_detail jsonb;
  v_first_pass_at timestamptz;
  v_mastered_at timestamptz;
BEGIN
  SELECT COALESCE(jsonb_agg(jsonb_build_object(
           'attempt_id', a.id::text,
           'completed', a.completed_at IS NOT NULL,
           'completed_at', a.completed_at,
           'local_date', CASE WHEN a.completed_at IS NOT NULL THEN a.local_date END,
           'correct', a.score,
           'max', a.max_score)), '[]'::jsonb),
         count(*)::integer,
         COALESCE(max(a.score) FILTER (WHERE a.completed_at IS NOT NULL), 0)::integer,
         max(a.completed_at)
    INTO v_attempts, v_count, v_best, v_last
  FROM public.lesson_attempts AS a
  WHERE a.child_id = p_child_id AND a.lesson_id = p_lesson_id;

  v_detail := public.stars_detail(v_attempts, p_rules);

  SELECT a.completed_at INTO v_first_pass_at
  FROM public.lesson_attempts AS a
  WHERE a.id::text = v_detail ->> 'first_pass_attempt_id';

  SELECT a.completed_at INTO v_mastered_at
  FROM public.lesson_attempts AS a
  WHERE a.id::text = v_detail ->> 'mastered_attempt_id';

  INSERT INTO public.lesson_progress AS lp (
    child_id, lesson_id, stars, best_score, first_pass_at, mastered_at, last_completed_at, attempts_count, updated_at
  )
  VALUES (
    p_child_id, p_lesson_id, (v_detail ->> 'stars')::smallint, v_best::smallint, v_first_pass_at, v_mastered_at,
    v_last, v_count, now()
  )
  ON CONFLICT (child_id, lesson_id) DO UPDATE SET
    stars = GREATEST(lp.stars, excluded.stars),
    best_score = GREATEST(lp.best_score, excluded.best_score),
    first_pass_at = LEAST(lp.first_pass_at, excluded.first_pass_at),
    mastered_at = LEAST(lp.mastered_at, excluded.mastered_at),
    last_completed_at = GREATEST(lp.last_completed_at, excluded.last_completed_at),
    attempts_count = excluded.attempts_count,
    updated_at = now();
END;
$$;

-- [optional] activity_days of one child and day, recomputed from that day's attempts.
-- minutes: sum of duration_s rounded up, each attempt capped at 60 minutes because duration_s is
-- wall-clock time and an attempt paused for a day would otherwise count as hours of study.
CREATE FUNCTION public.refresh_activity_day(p_child_id uuid, p_local_date date)
RETURNS void
LANGUAGE sql
SET search_path = ''
AS $$
  INSERT INTO public.activity_days AS d (child_id, local_date, minutes, lessons_completed, updated_at)
  SELECT p_child_id,
         p_local_date,
         ((COALESCE(sum(LEAST(a.duration_s, 3600)), 0) + 59) / 60)::integer,
         (count(*) FILTER (WHERE a.completed_at IS NOT NULL))::integer,
         now()
  FROM public.lesson_attempts AS a
  WHERE a.child_id = p_child_id AND a.local_date = p_local_date
  ON CONFLICT (child_id, local_date) DO UPDATE SET
    minutes = excluded.minutes,
    lessons_completed = excluded.lessons_completed,
    updated_at = now()
$$;

-- Validates and stores one attempt of a submit_attempts batch; returns its result object.
-- p_owner_id is auth.uid() of the caller. Never raises for bad input: a value of the wrong type or a
-- broken constraint rejects only this attempt (its partial writes roll back with the block).
CREATE FUNCTION public.store_attempt(p_owner_id uuid, p_attempt jsonb, p_index integer)
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

REVOKE ALL ON FUNCTION
  public.rpc_ok(jsonb),
  public.rpc_error(text, text),
  public.iso_utc(timestamptz),
  public.parse_instant(text),
  public.rules_for(text),
  public.child_profile_json(public.child_profiles),
  public.lesson_progress_json(public.lesson_progress),
  public.refresh_lesson_progress(uuid, uuid, jsonb),
  public.refresh_activity_day(uuid, date), -- [optional]
  public.store_attempt(uuid, jsonb, integer)
  FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION
  public.rpc_ok(jsonb),
  public.rpc_error(text, text),
  public.iso_utc(timestamptz),
  public.parse_instant(text),
  public.rules_for(text),
  public.child_profile_json(public.child_profiles),
  public.lesson_progress_json(public.lesson_progress),
  public.refresh_lesson_progress(uuid, uuid, jsonb),
  public.refresh_activity_day(uuid, date), -- [optional]
  public.store_attempt(uuid, jsonb, integer)
  TO service_role;
