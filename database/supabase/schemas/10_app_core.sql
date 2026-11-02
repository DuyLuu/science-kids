-- Declared state (SK-021). Conventions: technical-plan.md B5.1, B5.4. Seed data (rules.<age_group>)
-- lives in the baseline delta, not here: content-cli publish owns app_config rows.

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
