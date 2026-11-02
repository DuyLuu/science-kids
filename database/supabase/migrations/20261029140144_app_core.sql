-- SK-021 · Baseline delta: everything in database/supabase/schemas/*.sql at 29/10/2026 (files 00 to 50,
-- in that order) plus the app_config seed. Applied to staging by `node scripts/db-apply.mjs`
-- (technical-plan.md B5.1); production is run by Duy. Never edit this file once it has run:
-- every later change is a new delta and an edit of the schema files.
--
-- Contents: pgTAP; child_profiles, lesson_attempts, lesson_progress, app_config; OPTIONAL
-- activity_days, quiz_answers; pure rule functions (vectors lesson-score, stars, local-date, streak);
-- internal helpers; RPCs create_child_profile, submit_attempts, get_home; seed rules.<age_group>.
--
-- Conventions (B5.1, B5.4, B5.5): every table has RLS, a SELECT policy for the owner and explicit
-- GRANTs (Supabase gives anon and authenticated ALL on new public objects, so each one revokes first);
-- the app only SELECTs and writes through the RPCs; RPCs take p_ parameters, return jsonb
-- {success, error_code, error, data}, are SECURITY DEFINER with SET search_path = ''.

-- ---------------------------------------------------------------------------------------------
-- schemas/00_extensions.sql
-- ---------------------------------------------------------------------------------------------
CREATE EXTENSION IF NOT EXISTS pgtap WITH SCHEMA extensions;

-- ---------------------------------------------------------------------------------------------
-- schemas/10_app_core.sql
-- ---------------------------------------------------------------------------------------------

-- =============================================================================================
-- 1. Core tables
-- =============================================================================================

-- A child profile belongs to an auth user: a guest (anonymous sign-in) or, later, a parent.
-- No birth date, photo or voice (B12).
CREATE TABLE public.child_profiles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  owner_id uuid NOT NULL REFERENCES auth.users (id) ON DELETE CASCADE,
  display_name text NOT NULL
    CONSTRAINT child_profiles_display_name_check
    CHECK (char_length(display_name) BETWEEN 1 AND 40 AND display_name !~ '[[:cntrl:]]'),
  avatar text NOT NULL CONSTRAINT child_profiles_avatar_check CHECK (avatar ~ '^[a-z0-9_]{1,32}$'),
  grade smallint NOT NULL CONSTRAINT child_profiles_grade_check CHECK (grade BETWEEN 1 AND 5),
  age_group text NOT NULL
    CONSTRAINT child_profiles_age_group_check CHECK (age_group IN ('explorer', 'discoverer', 'scientist')),
  language_mode text NOT NULL
    CONSTRAINT child_profiles_language_mode_check CHECK (language_mode IN ('bilingual', 'en_first', 'vi_first')),
  voice_mode text NOT NULL
    CONSTRAINT child_profiles_voice_mode_check CHECK (voice_mode IN ('en', 'vi', 'both')),
  -- IANA name; create_child_profile checks it against pg_timezone_names.
  timezone text NOT NULL CONSTRAINT child_profiles_timezone_check CHECK (char_length(timezone) BETWEEN 1 AND 64),
  locked_reason text CONSTRAINT child_profiles_locked_reason_check CHECK (locked_reason IN ('premium_expired')),
  created_at timestamptz NOT NULL DEFAULT now(),
  archived_at timestamptz
);

CREATE INDEX child_profiles_owner_id_idx ON public.child_profiles (owner_id);

COMMENT ON TABLE public.child_profiles IS
  'Child profiles of a guest or parent account (technical-plan B5.3). Written only by RPCs.';

-- One lesson attempt. id is made by the app (UUID v4) and is the idempotency key of submit_attempts.
CREATE TABLE public.lesson_attempts (
  id uuid PRIMARY KEY,
  child_id uuid NOT NULL REFERENCES public.child_profiles (id) ON DELETE CASCADE,
  lesson_id uuid NOT NULL,
  content_version text CONSTRAINT lesson_attempts_content_version_check CHECK (content_version ~ '^[A-Za-z0-9._-]{1,64}$'),
  started_at timestamptz NOT NULL,
  -- NULL when the attempt is not completed (fewer than 6 quiz answers): it then gives no star.
  completed_at timestamptz,
  -- Calendar day of the attempt in the child's time zone, computed by the server (B5.1), never sent
  -- by the app: local_date(completed_at sent by the app, or started_at, child_profiles.timezone).
  local_date date NOT NULL,
  score smallint NOT NULL,
  max_score smallint NOT NULL,
  duration_s integer NOT NULL CONSTRAINT lesson_attempts_duration_s_check CHECK (duration_s BETWEEN 0 AND 864000),
  xp integer NOT NULL DEFAULT 0 CONSTRAINT lesson_attempts_xp_check CHECK (xp >= 0),
  -- Random id the app makes at install time; not a device identifier.
  install_id uuid,
  client_created_at timestamptz,
  received_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT lesson_attempts_score_check CHECK (max_score BETWEEN 1 AND 100 AND score BETWEEN 0 AND max_score),
  CONSTRAINT lesson_attempts_completed_at_check CHECK (completed_at IS NULL OR completed_at >= started_at)
);

CREATE INDEX lesson_attempts_child_lesson_idx ON public.lesson_attempts (child_id, lesson_id);
CREATE INDEX lesson_attempts_child_local_date_idx ON public.lesson_attempts (child_id, local_date);

COMMENT ON TABLE public.lesson_attempts IS
  'Lesson attempts sent by submit_attempts, idempotent on id (technical-plan B5.3, B7.7).';

-- Stars and best score of a lesson, recomputed by submit_attempts from every attempt of the lesson.
CREATE TABLE public.lesson_progress (
  child_id uuid NOT NULL REFERENCES public.child_profiles (id) ON DELETE CASCADE,
  lesson_id uuid NOT NULL,
  stars smallint NOT NULL DEFAULT 0 CONSTRAINT lesson_progress_stars_check CHECK (stars BETWEEN 0 AND 3),
  best_score smallint NOT NULL DEFAULT 0 CONSTRAINT lesson_progress_best_score_check CHECK (best_score >= 0),
  first_pass_at timestamptz,
  mastered_at timestamptz,
  last_completed_at timestamptz,
  attempts_count integer NOT NULL DEFAULT 0 CONSTRAINT lesson_progress_attempts_count_check CHECK (attempts_count >= 0),
  updated_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY (child_id, lesson_id)
);

COMMENT ON TABLE public.lesson_progress IS
  'Per child and lesson: stars (0-3, never go down), best score, attempt count. Written only by submit_attempts.';

-- Feature flags, maintenance notices and rules.<age_group> (copied from content/rules.json at publish).
CREATE TABLE public.app_config (
  key text PRIMARY KEY CONSTRAINT app_config_key_check CHECK (key ~ '^[a-z0-9_]+(\.[a-z0-9_]+)*$'),
  value jsonb NOT NULL,
  min_app_version text CONSTRAINT app_config_min_app_version_check CHECK (min_app_version ~ '^[0-9]+(\.[0-9]+){0,2}$'),
  updated_at timestamptz NOT NULL DEFAULT now()
);

COMMENT ON TABLE public.app_config IS
  'App configuration readable by every signed-in user; written by service_role (content-cli publish).';

-- RLS: the owner reads their own rows; nobody writes through the Data API.
ALTER TABLE public.child_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.lesson_attempts ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.lesson_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.app_config ENABLE ROW LEVEL SECURITY;

CREATE POLICY child_profiles_select_own ON public.child_profiles
  FOR SELECT TO authenticated
  USING (owner_id = (SELECT auth.uid()));

CREATE POLICY lesson_attempts_select_own ON public.lesson_attempts
  FOR SELECT TO authenticated
  USING (EXISTS (
    SELECT 1 FROM public.child_profiles c
    WHERE c.id = lesson_attempts.child_id AND c.owner_id = (SELECT auth.uid())
  ));

CREATE POLICY lesson_progress_select_own ON public.lesson_progress
  FOR SELECT TO authenticated
  USING (EXISTS (
    SELECT 1 FROM public.child_profiles c
    WHERE c.id = lesson_progress.child_id AND c.owner_id = (SELECT auth.uid())
  ));

CREATE POLICY app_config_select_all ON public.app_config
  FOR SELECT TO authenticated
  USING (true);

REVOKE ALL ON TABLE public.child_profiles, public.lesson_attempts, public.lesson_progress, public.app_config
  FROM PUBLIC, anon, authenticated;
GRANT SELECT ON TABLE public.child_profiles, public.lesson_attempts, public.lesson_progress, public.app_config
  TO authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE
  ON TABLE public.child_profiles, public.lesson_attempts, public.lesson_progress, public.app_config
  TO service_role;

-- ---------------------------------------------------------------------------------------------
-- schemas/20_activity_days_quiz_answers.sql
-- ---------------------------------------------------------------------------------------------
-- =============================================================================================
-- 2. OPTIONAL tables: activity_days, quiz_answers
--    SK-021 open question. Provisional default (Duy to confirm): keep both.
--    activity_days gives get_home the day streak (vector streak) and today's minutes;
--    quiz_answers keeps every answer so p_correct can be calibrated later.
-- =============================================================================================

-- One row per child and local day with at least one attempt. Rest days are not stored: the streak
-- (and its rest_days) is computed when read, by compute_streak in get_home.
CREATE TABLE public.activity_days (
  child_id uuid NOT NULL REFERENCES public.child_profiles (id) ON DELETE CASCADE,
  local_date date NOT NULL,
  minutes integer NOT NULL DEFAULT 0 CONSTRAINT activity_days_minutes_check CHECK (minutes >= 0),
  lessons_completed integer NOT NULL DEFAULT 0 CONSTRAINT activity_days_lessons_completed_check CHECK (lessons_completed >= 0),
  updated_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY (child_id, local_date)
);

COMMENT ON TABLE public.activity_days IS
  'Per child and local day: minutes and completed lessons, for the day streak (B4.4). Written only by submit_attempts.';

-- One answered question of an attempt. The server trusts correct and points sent by the app
-- (SK-003: no answer key on the server in the MVP).
CREATE TABLE public.quiz_answers (
  attempt_id uuid NOT NULL REFERENCES public.lesson_attempts (id) ON DELETE CASCADE,
  item_id uuid NOT NULL,
  slot text NOT NULL CONSTRAINT quiz_answers_slot_check CHECK (slot IN ('quiz', 'warmup')),
  -- 1-based position of the item in lesson.quiz or lesson.warmup.
  item_order smallint NOT NULL CONSTRAINT quiz_answers_item_order_check CHECK (item_order BETWEEN 1 AND 20),
  correct boolean NOT NULL,
  points smallint NOT NULL CONSTRAINT quiz_answers_points_check CHECK (points IN (0, 1)),
  -- Every try in order, in the shape of the item-scoring vectors: [{"selected": "fish"}, ...].
  answer jsonb NOT NULL DEFAULT '[]'::jsonb
    CONSTRAINT quiz_answers_answer_check CHECK (jsonb_typeof(answer) = 'array' AND octet_length(answer::text) <= 4096),
  time_ms integer CONSTRAINT quiz_answers_time_ms_check CHECK (time_ms >= 0),
  hint_used boolean NOT NULL DEFAULT false,
  tries smallint NOT NULL CONSTRAINT quiz_answers_tries_check CHECK (tries BETWEEN 1 AND 10),
  PRIMARY KEY (attempt_id, item_id)
);

CREATE INDEX quiz_answers_item_id_idx ON public.quiz_answers (item_id);

COMMENT ON TABLE public.quiz_answers IS
  'Answers of each attempt, to calibrate p_correct (technical-plan B5.3). Written only by submit_attempts.';

ALTER TABLE public.activity_days ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.quiz_answers ENABLE ROW LEVEL SECURITY;

CREATE POLICY activity_days_select_own ON public.activity_days
  FOR SELECT TO authenticated
  USING (EXISTS (
    SELECT 1 FROM public.child_profiles c
    WHERE c.id = activity_days.child_id AND c.owner_id = (SELECT auth.uid())
  ));

CREATE POLICY quiz_answers_select_own ON public.quiz_answers
  FOR SELECT TO authenticated
  USING (EXISTS (
    SELECT 1
    FROM public.lesson_attempts a
    JOIN public.child_profiles c ON c.id = a.child_id
    WHERE a.id = quiz_answers.attempt_id AND c.owner_id = (SELECT auth.uid())
  ));

REVOKE ALL ON TABLE public.activity_days, public.quiz_answers FROM PUBLIC, anon, authenticated;
GRANT SELECT ON TABLE public.activity_days, public.quiz_answers TO authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE public.activity_days, public.quiz_answers TO service_role;

-- ---------------------------------------------------------------------------------------------
-- schemas/30_rule_functions.sql
-- ---------------------------------------------------------------------------------------------
-- =============================================================================================
-- 3. Pure rule functions (technical-plan B4.4, SK-003). No table access. Checked by the generated
--    tests/vectors_<suite>.test.sql against packages/content-schema/test-vectors, the same files
--    the Swift and Kotlin engines run. Change a rule: change the vector first.
-- =============================================================================================

-- local_date(completed_at, timezone) -> calendar date in that IANA zone (vector local-date).
CREATE FUNCTION public.local_date(p_at timestamptz, p_timezone text)
RETURNS date
LANGUAGE sql
IMMUTABLE
STRICT
PARALLEL SAFE
SET search_path = ''
AS $$
  SELECT (p_at AT TIME ZONE p_timezone)::date
$$;

-- score_lesson(quiz_results, warmup_results) -> {correct, max, completed} | {error} (vector lesson-score).
-- correct sums points (not final_correct); the quiz has exactly 6 questions (B4.4, SK-001);
-- completed = 6 quiz results (T4); warmup never counts. Duplicate item_id or more than 6 -> invalid_results (T5).
CREATE FUNCTION public.score_lesson(p_quiz_results jsonb, p_warmup_results jsonb)
RETURNS jsonb
LANGUAGE sql
IMMUTABLE
PARALLEL SAFE
SET search_path = ''
AS $$
  WITH results AS (
    SELECT r ->> 'item_id' AS item_id, (r ->> 'points')::integer AS points
    FROM jsonb_array_elements(COALESCE(p_quiz_results, '[]'::jsonb)) AS r
  )
  SELECT CASE
    WHEN count(*) > 6 OR count(DISTINCT item_id) <> count(*)
      THEN jsonb_build_object('error', 'invalid_results')
    ELSE jsonb_build_object(
      'correct', COALESCE(sum(points), 0),
      'max', 6,
      'completed', count(*) = 6
    )
  END
  FROM results
$$;

COMMENT ON FUNCTION public.score_lesson(jsonb, jsonb) IS
  'Vector lesson-score. p_warmup_results is accepted for the shared signature and never scored.';

-- compute_stars plus the ids of the attempts that set first_pass and mastered, so submit_attempts
-- can store their timestamps. Rules (SK-003 D3, D4):
--   only completed attempts count, ordered by completed_at then attempt_id;
--   pass when correct * den >= num * max (integers, no rounding);
--   1 star for a completed attempt, 2 for a pass, 3 for a later pass whose local_date is at least
--   mastery_gap_days calendar days after the first pass.
CREATE FUNCTION public.stars_detail(p_attempts jsonb, p_rules jsonb)
RETURNS jsonb
LANGUAGE sql
STABLE
PARALLEL SAFE
SET search_path = ''
AS $$
  WITH params AS (
    SELECT (p_rules #>> '{pass_threshold,num}')::integer AS num,
           (p_rules #>> '{pass_threshold,den}')::integer AS den,
           (p_rules ->> 'mastery_gap_days')::integer AS gap
  ),
  done AS (
    SELECT a ->> 'attempt_id' AS attempt_id,
           (a ->> 'local_date')::date AS local_date,
           row_number() OVER (
             ORDER BY (a ->> 'completed_at')::timestamptz, (a ->> 'attempt_id') COLLATE "C"
           ) AS seq,
           (a ->> 'correct')::integer * p.den >= p.num * (a ->> 'max')::integer AS passed
    FROM jsonb_array_elements(COALESCE(p_attempts, '[]'::jsonb)) AS a
    CROSS JOIN params AS p
    WHERE (a ->> 'completed')::boolean
  ),
  first_pass AS (
    SELECT d.attempt_id, d.local_date, d.seq FROM done AS d WHERE d.passed ORDER BY d.seq LIMIT 1
  ),
  mastered AS (
    SELECT d.attempt_id, d.local_date
    FROM done AS d
    CROSS JOIN first_pass AS f
    CROSS JOIN params AS p
    WHERE d.passed AND d.seq > f.seq AND d.local_date - f.local_date >= p.gap
    ORDER BY d.seq
    LIMIT 1
  )
  SELECT jsonb_build_object(
    'stars', CASE
      WHEN NOT EXISTS (SELECT 1 FROM done) THEN 0
      WHEN NOT EXISTS (SELECT 1 FROM first_pass) THEN 1
      WHEN NOT EXISTS (SELECT 1 FROM mastered) THEN 2
      ELSE 3
    END,
    'first_pass_date', (SELECT to_jsonb(f.local_date) FROM first_pass AS f),
    'mastered_date', (SELECT to_jsonb(m.local_date) FROM mastered AS m),
    'first_pass_attempt_id', (SELECT f.attempt_id FROM first_pass AS f),
    'mastered_attempt_id', (SELECT m.attempt_id FROM mastered AS m)
  )
$$;

-- compute_stars(attempts, rules) -> {stars, first_pass_date, mastered_date} (vector stars).
-- attempts[]: {attempt_id, completed, completed_at, local_date, correct, max}.
CREATE FUNCTION public.compute_stars(p_attempts jsonb, p_rules jsonb)
RETURNS jsonb
LANGUAGE sql
STABLE
PARALLEL SAFE
SET search_path = ''
AS $$
  SELECT public.stars_detail(p_attempts, p_rules) - 'first_pass_attempt_id' - 'mastered_attempt_id'
$$;

-- compute_streak(studied_dates, today, rules) -> {studied_days, chain_start, rest_days} (vector streak).
-- SK-003 D5: today counts if studied, otherwise it is skipped (never a rest day). Walk back from
-- yesterday: a studied day adds to studied_days and moves chain_start; a day without study uses one
-- rest day of its ISO week if any is left (rest_days_per_week), otherwise the chain breaks.
-- Rest days before chain_start are dropped. Dates after today are ignored.
CREATE FUNCTION public.compute_streak(p_studied_dates jsonb, p_today date, p_rules jsonb)
RETURNS jsonb
LANGUAGE plpgsql
STABLE
PARALLEL SAFE
SET search_path = ''
AS $$
DECLARE
  v_rest_per_week integer := COALESCE((p_rules ->> 'rest_days_per_week')::integer, 0);
  v_studied date[];
  v_earliest date;
  v_day date;
  v_week text;
  v_week_used integer;
  v_used jsonb := '{}'::jsonb;
  v_rest date[] := ARRAY[]::date[];
  v_studied_days integer := 0;
  v_chain_start date;
BEGIN
  SELECT COALESCE(array_agg(DISTINCT s.d), ARRAY[]::date[]), min(s.d)
    INTO v_studied, v_earliest
  FROM (
    SELECT t.value::date AS d
    FROM jsonb_array_elements_text(COALESCE(p_studied_dates, '[]'::jsonb)) AS t(value)
  ) AS s
  WHERE s.d <= p_today;

  IF p_today = ANY (v_studied) THEN
    v_studied_days := 1;
    v_chain_start := p_today;
  END IF;

  v_day := p_today - 1;
  WHILE v_earliest IS NOT NULL AND v_day >= v_earliest LOOP
    IF v_day = ANY (v_studied) THEN
      v_studied_days := v_studied_days + 1;
      v_chain_start := v_day;
    ELSE
      v_week := to_char(v_day::timestamp, 'IYYY-IW');
      v_week_used := COALESCE((v_used ->> v_week)::integer, 0);
      EXIT WHEN v_week_used >= v_rest_per_week;
      v_used := v_used || jsonb_build_object(v_week, v_week_used + 1);
      v_rest := array_append(v_rest, v_day);
    END IF;
    v_day := v_day - 1;
  END LOOP;

  RETURN jsonb_build_object(
    'studied_days', v_studied_days,
    'chain_start', to_jsonb(v_chain_start),
    'rest_days', COALESCE(
      (SELECT jsonb_agg(to_jsonb(r.d) ORDER BY r.d)
       FROM unnest(v_rest) AS r(d)
       WHERE r.d > v_chain_start),
      '[]'::jsonb
    )
  );
END;
$$;

-- Vietnamese grade -> age group (canvas Discoverer-Profile, same table as the app's Grade.ageGroup).
CREATE FUNCTION public.age_group_for_grade(p_grade integer)
RETURNS text
LANGUAGE sql
IMMUTABLE
PARALLEL SAFE
SET search_path = ''
AS $$
  SELECT CASE
    WHEN p_grade = 1 THEN 'explorer'
    WHEN p_grade IN (2, 3) THEN 'discoverer'
    WHEN p_grade IN (4, 5) THEN 'scientist'
  END
$$;

-- Pure functions are not part of the app's API: only the RPCs (as their owner) and service_role run them.
REVOKE ALL ON FUNCTION
  public.local_date(timestamptz, text),
  public.score_lesson(jsonb, jsonb),
  public.stars_detail(jsonb, jsonb),
  public.compute_stars(jsonb, jsonb),
  public.compute_streak(jsonb, date, jsonb),
  public.age_group_for_grade(integer)
  FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION
  public.local_date(timestamptz, text),
  public.score_lesson(jsonb, jsonb),
  public.stars_detail(jsonb, jsonb),
  public.compute_stars(jsonb, jsonb),
  public.compute_streak(jsonb, date, jsonb),
  public.age_group_for_grade(integer)
  TO service_role;

-- ---------------------------------------------------------------------------------------------
-- schemas/40_internal_functions.sql
-- ---------------------------------------------------------------------------------------------
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
    v_sent_completed_at := LEAST(public.parse_instant(p_attempt ->> 'completed_at'), v_now);
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

-- ---------------------------------------------------------------------------------------------
-- schemas/50_rpc.sql
-- ---------------------------------------------------------------------------------------------
-- =============================================================================================
-- 5. RPCs (docs/api/rpc.md, proposed text in SK-021)
-- =============================================================================================

-- Creates the child profile of the signed-in user (guest or parent).
-- Free or guest accounts have at most 1 active profile (prd.md section 6); Premium raises the limit
-- in a later migration, together with billing_entitlements.
-- p_id (optional): the id the app already gave the profile. With it the call is idempotent: the same
-- p_id again returns the stored profile with created = false, so a lost response can be retried.
CREATE FUNCTION public.create_child_profile(
  p_display_name text,
  p_avatar text,
  p_grade integer,
  p_language_mode text,
  p_voice_mode text,
  p_timezone text,
  p_id uuid DEFAULT NULL
)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = ''
AS $$
DECLARE
  c_max_active_profiles constant integer := 1;
  v_uid uuid := auth.uid();
  v_name text;
  v_age_group text;
  v_existing public.child_profiles;
  v_active integer;
  v_profile public.child_profiles;
BEGIN
  IF v_uid IS NULL THEN
    RETURN public.rpc_error('not_authenticated', 'sign in first (an anonymous session is enough)');
  END IF;

  v_name := regexp_replace(normalize(COALESCE(p_display_name, ''), NFC), '^\s+|\s+$', '', 'g');
  IF char_length(v_name) NOT BETWEEN 1 AND 40 OR v_name ~ '[[:cntrl:]]' THEN
    RETURN public.rpc_error('invalid_display_name', 'display_name must have 1 to 40 characters');
  END IF;
  IF p_avatar IS NULL OR p_avatar !~ '^[a-z0-9_]{1,32}$' THEN
    RETURN public.rpc_error('invalid_avatar', 'avatar must be an avatar id such as "ech"');
  END IF;
  v_age_group := public.age_group_for_grade(p_grade);
  IF v_age_group IS NULL THEN
    RETURN public.rpc_error('invalid_grade', 'grade must be 1 to 5');
  END IF;
  IF p_language_mode IS NULL OR p_language_mode NOT IN ('bilingual', 'en_first', 'vi_first') THEN
    RETURN public.rpc_error('invalid_language_mode', 'language_mode must be bilingual, en_first or vi_first');
  END IF;
  IF p_voice_mode IS NULL OR p_voice_mode NOT IN ('en', 'vi', 'both') THEN
    RETURN public.rpc_error('invalid_voice_mode', 'voice_mode must be en, vi or both');
  END IF;
  IF p_timezone IS NULL OR NOT EXISTS (SELECT 1 FROM pg_catalog.pg_timezone_names AS z WHERE z.name = p_timezone) THEN
    RETURN public.rpc_error('invalid_timezone', 'timezone must be an IANA name such as Asia/Ho_Chi_Minh');
  END IF;

  -- One call at a time per account, so two quick calls cannot both pass the limit.
  PERFORM pg_advisory_xact_lock(hashtextextended('child_profiles:' || v_uid::text, 0));

  IF p_id IS NOT NULL THEN
    SELECT * INTO v_existing FROM public.child_profiles AS c WHERE c.id = p_id;
    IF FOUND THEN
      IF v_existing.owner_id = v_uid THEN
        RETURN public.rpc_ok(public.child_profile_json(v_existing) || jsonb_build_object('created', false));
      END IF;
      RETURN public.rpc_error('id_conflict', 'this profile id is already used');
    END IF;
  END IF;

  SELECT count(*)::integer INTO v_active
  FROM public.child_profiles AS c
  WHERE c.owner_id = v_uid AND c.archived_at IS NULL;
  IF v_active >= c_max_active_profiles THEN
    RETURN public.rpc_error('profile_limit', 'this account already has its active profile');
  END IF;

  INSERT INTO public.child_profiles (id, owner_id, display_name, avatar, grade, age_group, language_mode, voice_mode, timezone)
  VALUES (COALESCE(p_id, gen_random_uuid()), v_uid, v_name, p_avatar, p_grade, v_age_group, p_language_mode, p_voice_mode, p_timezone)
  RETURNING * INTO v_profile;

  RETURN public.rpc_ok(public.child_profile_json(v_profile) || jsonb_build_object('created', true));
END;
$$;

-- Receives 1..50 attempts from the app's offline queue, idempotent on each attempt id. In one
-- transaction: stores new attempts (and their answers), recomputes lesson_progress of every lesson
-- that got a new attempt (stars from rules.<age_group> in app_config), [optional] activity_days,
-- and returns the settled result of every attempt.
-- A bad attempt is rejected on its own (status rejected) and the others are still stored;
-- success = false only when the whole call is unusable (then the app keeps its queue).
CREATE FUNCTION public.submit_attempts(p_attempts jsonb)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = ''
AS $$
DECLARE
  c_max_batch constant integer := 50;
  v_uid uuid := auth.uid();
  v_child public.child_profiles;
  v_attempt jsonb;
  v_index integer;
  v_results jsonb := '[]'::jsonb;
  v_pair record;
  v_progress jsonb;
BEGIN
  IF v_uid IS NULL THEN
    RETURN public.rpc_error('not_authenticated', 'sign in first (an anonymous session is enough)');
  END IF;
  IF p_attempts IS NULL OR jsonb_typeof(p_attempts) <> 'array' OR jsonb_array_length(p_attempts) = 0 THEN
    RETURN public.rpc_error('invalid_input', 'p_attempts must be a non-empty JSON array');
  END IF;
  IF jsonb_array_length(p_attempts) > c_max_batch THEN
    RETURN public.rpc_error('too_many_attempts', format('send at most %s attempts per call', c_max_batch));
  END IF;

  -- Lock the caller's children named in the batch, in id order: two devices sending at the same
  -- time then recompute progress one after the other, without deadlock.
  FOR v_child IN
    SELECT c.*
    FROM public.child_profiles AS c
    WHERE c.owner_id = v_uid
      AND c.id::text IN (
        SELECT lower(e ->> 'child_id') FROM jsonb_array_elements(p_attempts) AS e WHERE jsonb_typeof(e) = 'object'
      )
    ORDER BY c.id
  LOOP
    PERFORM pg_advisory_xact_lock(hashtextextended('child:' || v_child.id::text, 0));
    IF public.rules_for(v_child.age_group) IS NULL THEN
      RETURN public.rpc_error('rules_missing', format('app_config has no rules.%s', v_child.age_group));
    END IF;
  END LOOP;

  FOR v_attempt, v_index IN
    SELECT t.e, (t.ord - 1)::integer FROM jsonb_array_elements(p_attempts) WITH ORDINALITY AS t(e, ord)
  LOOP
    v_results := v_results || jsonb_build_array(public.store_attempt(v_uid, v_attempt, v_index));
  END LOOP;

  FOR v_pair IN
    SELECT DISTINCT (r ->> 'child_id')::uuid AS child_id, (r ->> 'lesson_id')::uuid AS lesson_id, c.age_group
    FROM jsonb_array_elements(v_results) AS r
    JOIN public.child_profiles AS c ON c.id = (r ->> 'child_id')::uuid
    WHERE r ->> 'status' = 'inserted'
  LOOP
    PERFORM public.refresh_lesson_progress(v_pair.child_id, v_pair.lesson_id, public.rules_for(v_pair.age_group));
  END LOOP;

  FOR v_pair IN                                                                   -- [optional]
    SELECT DISTINCT (r ->> 'child_id')::uuid AS child_id, (r ->> 'local_date')::date AS local_date -- [optional]
    FROM jsonb_array_elements(v_results) AS r                                     -- [optional]
    WHERE r ->> 'status' = 'inserted'                                             -- [optional]
  LOOP                                                                            -- [optional]
    PERFORM public.refresh_activity_day(v_pair.child_id, v_pair.local_date);      -- [optional]
  END LOOP;                                                                       -- [optional]

  -- Settled reward of each attempt: the stars of its lesson after the whole batch.
  SELECT COALESCE(jsonb_agg(
           CASE WHEN r ->> 'status' IN ('inserted', 'duplicate')
             THEN r || jsonb_build_object('stars', COALESCE(lp.stars, 0))
             ELSE r
           END
           ORDER BY (r ->> 'index')::integer), '[]'::jsonb)
    INTO v_results
  FROM jsonb_array_elements(v_results) AS r
  LEFT JOIN public.lesson_progress AS lp
    ON r ->> 'status' IN ('inserted', 'duplicate')
   AND lp.child_id = (r ->> 'child_id')::uuid
   AND lp.lesson_id = (r ->> 'lesson_id')::uuid;

  SELECT COALESCE(jsonb_agg(public.lesson_progress_json(lp) ORDER BY lp.child_id, lp.lesson_id), '[]'::jsonb)
    INTO v_progress
  FROM public.lesson_progress AS lp
  WHERE (lp.child_id, lp.lesson_id) IN (
    SELECT (r ->> 'child_id')::uuid, (r ->> 'lesson_id')::uuid
    FROM jsonb_array_elements(v_results) AS r
    WHERE r ->> 'status' IN ('inserted', 'duplicate')
  );

  RETURN public.rpc_ok(jsonb_build_object('results', v_results, 'progress', v_progress));
END;
$$;

-- Home screen data of one child: the profile, progress of every lesson played, total stars and XP,
-- the last lesson played, [optional] the day streak and today's minutes.
-- The next lesson is chosen by the app from the order in its content pack and lessons[]: the server
-- has no lesson catalog in the MVP (no cms_* tables, B8.0).
CREATE FUNCTION public.get_home(p_child_id uuid)
RETURNS jsonb
LANGUAGE plpgsql
STABLE
SECURITY DEFINER
SET search_path = ''
AS $$
DECLARE
  v_uid uuid := auth.uid();
  v_child public.child_profiles;
  v_rules jsonb;
  v_today date;
  v_lessons jsonb;
  v_total_stars integer;
  v_total_xp integer;
  v_last_lesson_id uuid;
  v_studied jsonb;
  v_streak jsonb;
  v_minutes_today integer;
BEGIN
  IF v_uid IS NULL THEN
    RETURN public.rpc_error('not_authenticated', 'sign in first (an anonymous session is enough)');
  END IF;
  IF p_child_id IS NULL THEN
    RETURN public.rpc_error('invalid_input', 'p_child_id is required');
  END IF;

  SELECT * INTO v_child FROM public.child_profiles AS c WHERE c.id = p_child_id AND c.owner_id = v_uid;
  IF NOT FOUND THEN
    RETURN public.rpc_error('child_not_found', 'p_child_id is not a profile of this account');
  END IF;

  v_rules := public.rules_for(v_child.age_group);
  IF v_rules IS NULL THEN
    RETURN public.rpc_error('rules_missing', format('app_config has no rules.%s', v_child.age_group));
  END IF;
  v_today := public.local_date(now(), v_child.timezone);

  SELECT COALESCE(jsonb_agg(public.lesson_progress_json(lp) ORDER BY lp.last_completed_at DESC NULLS LAST, lp.lesson_id), '[]'::jsonb),
         COALESCE(sum(lp.stars), 0)::integer
    INTO v_lessons, v_total_stars
  FROM public.lesson_progress AS lp
  WHERE lp.child_id = v_child.id;

  SELECT COALESCE(sum(a.xp), 0)::integer INTO v_total_xp
  FROM public.lesson_attempts AS a
  WHERE a.child_id = v_child.id;

  SELECT a.lesson_id INTO v_last_lesson_id
  FROM public.lesson_attempts AS a
  WHERE a.child_id = v_child.id AND a.completed_at IS NOT NULL
  ORDER BY a.completed_at DESC, a.id
  LIMIT 1;

  -- [optional] Without activity_days, read the days from lesson_attempts instead:
  --   SELECT COALESCE(jsonb_agg(DISTINCT a.local_date), '[]') FROM public.lesson_attempts a
  --   WHERE a.child_id = v_child.id AND a.completed_at IS NOT NULL
  SELECT COALESCE(jsonb_agg(d.local_date ORDER BY d.local_date), '[]'::jsonb) INTO v_studied -- [optional]
  FROM public.activity_days AS d                                                             -- [optional]
  WHERE d.child_id = v_child.id AND d.lessons_completed >= 1;                                -- [optional]

  v_streak := public.compute_streak(v_studied, v_today, v_rules)
           || jsonb_build_object('studied_today', v_studied @> jsonb_build_array(v_today));

  -- [optional] Without activity_days: minutes from lesson_attempts of v_today, or drop the key.
  SELECT COALESCE(max(d.minutes), 0)::integer INTO v_minutes_today -- [optional]
  FROM public.activity_days AS d                                   -- [optional]
  WHERE d.child_id = v_child.id AND d.local_date = v_today;        -- [optional]

  RETURN public.rpc_ok(jsonb_build_object(
    'child', public.child_profile_json(v_child),
    'today', v_today,
    'lessons', v_lessons,
    'total_stars', v_total_stars,
    'total_xp', v_total_xp,
    'last_lesson_id', v_last_lesson_id,
    'streak', v_streak,
    'minutes_today', v_minutes_today
  ));
END;
$$;

-- New functions are executable by PUBLIC, and Supabase adds anon and authenticated by default:
-- revoke everything, then grant the three RPCs to signed-in users (guests included) only.
REVOKE ALL ON FUNCTION
  public.create_child_profile(text, text, integer, text, text, text, uuid),
  public.submit_attempts(jsonb),
  public.get_home(uuid)
  FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION
  public.create_child_profile(text, text, integer, text, text, text, uuid),
  public.submit_attempts(jsonb),
  public.get_home(uuid)
  TO authenticated, service_role;


-- =============================================================================================
-- 6. Seed: rules.<age_group> copied from content/rules.json (29/10/2026). From now on content-cli
--    publish writes these keys (B5.3: one source, two copies). ON CONFLICT DO NOTHING so the
--    migration never overwrites a newer publish.
-- =============================================================================================

INSERT INTO public.app_config (key, value) VALUES
  ('rules.explorer', '{"max_tries":2,"partial_order_min":null,"pass_threshold":{"num":5,"den":6},"mastery_gap_days":1,"rest_days_per_week":1,"warmup":{"min":2,"max":3,"week":{"target":7,"min":5,"max":10},"month":{"target":30,"min":21,"max":45},"exclude_dok":[3]},"xp_per_correct":10,"xp_lesson_complete":20,"xp_game_complete":10,"xp_mastery_review":20,"default_voice_mode":{"bilingual":"both","en_first":"both","vi_first":"both"}}'::jsonb),
  ('rules.discoverer', '{"max_tries":2,"partial_order_min":null,"pass_threshold":{"num":5,"den":6},"mastery_gap_days":1,"rest_days_per_week":1,"warmup":{"min":2,"max":3,"week":{"target":7,"min":5,"max":10},"month":{"target":30,"min":21,"max":45},"exclude_dok":[3]},"xp_per_correct":10,"xp_lesson_complete":20,"xp_game_complete":10,"xp_mastery_review":20,"default_voice_mode":{"bilingual":"both","en_first":"en","vi_first":"both"}}'::jsonb),
  ('rules.scientist', '{"max_tries":2,"partial_order_min":null,"pass_threshold":{"num":5,"den":6},"mastery_gap_days":1,"rest_days_per_week":1,"warmup":{"min":2,"max":3,"week":{"target":7,"min":5,"max":10},"month":{"target":30,"min":21,"max":45},"exclude_dok":[3]},"xp_per_correct":10,"xp_lesson_complete":20,"xp_game_complete":10,"xp_mastery_review":20,"default_voice_mode":{"bilingual":"both","en_first":"en","vi_first":"both"}}'::jsonb)
ON CONFLICT (key) DO NOTHING;
