-- Declared state (SK-021).

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
