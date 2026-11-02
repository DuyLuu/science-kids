-- Declared state (SK-021). OPTIONAL block: how to drop it is written in SK-021 ("Bỏ activity_days, quiz_answers").

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
