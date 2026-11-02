-- Declared state (SK-021).

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
