-- SK-021 T2 · create_child_profile, edge cases: name length and Unicode, grade/avatar/time zone limits,
-- parent account, p_id and archived profiles, the per-account lock, cascade delete.
-- Every user and row is made by this file inside the transaction that db-apply rolls back.

SELECT plan(44);

-- Calls create_child_profile for a fresh guest with a name and returns the error_code, or 'ok'.
CREATE FUNCTION pg_temp.cp_name(p_name text) RETURNS text LANGUAGE sql AS $$
  SELECT COALESCE(
    pg_temp.rpc(pg_temp.new_user(true), format(
      'SELECT public.create_child_profile(%L, %L, 3, %L, %L, %L)', p_name, 'ech', 'bilingual', 'both', 'Asia/Ho_Chi_Minh')) ->> 'error_code',
    'ok')
$$;

-- Same for the other parameters (name fixed to a valid one). Null arguments are passed as SQL NULL.
CREATE FUNCTION pg_temp.cp_args(p_avatar text, p_grade integer, p_language text, p_voice text, p_timezone text)
RETURNS text LANGUAGE sql AS $$
  SELECT COALESCE(
    pg_temp.rpc(pg_temp.new_user(true), format(
      'SELECT public.create_child_profile(%L, %L, %L::integer, %L, %L, %L)', 'Minh', p_avatar, p_grade, p_language, p_voice, p_timezone)) ->> 'error_code',
    'ok')
$$;

-- 1. Name length: 40 characters pass, 41 fail (characters = code points after NFC).
SELECT is(pg_temp.cp_name(repeat('a', 40)), 'ok', 'name of exactly 40 characters is accepted');
SELECT is(pg_temp.cp_name(repeat('a', 41)), 'invalid_display_name', 'name of 41 characters -> invalid_display_name');
SELECT is(pg_temp.cp_name(repeat(chr(128512), 40)), 'ok', '40 emoji (4-byte code points) are accepted');
SELECT is(pg_temp.cp_name(repeat(chr(128512), 41)), 'invalid_display_name', '41 emoji -> invalid_display_name');
SELECT is(pg_temp.cp_name(repeat('é', 40)), 'ok', '40 precomposed accented letters are accepted');
SELECT is(pg_temp.cp_name(repeat('e' || chr(769), 40)), 'ok', '40 letters written as e + combining acute (80 code points) count 40 after NFC');
SELECT is(pg_temp.cp_name(repeat('e' || chr(769), 41)), 'invalid_display_name', '41 letters in decomposed form -> invalid_display_name');
SELECT is(pg_temp.cp_name(NULL), 'invalid_display_name', 'null name -> invalid_display_name');
SELECT is(pg_temp.cp_name(''), 'invalid_display_name', 'empty name -> invalid_display_name');

-- 2. Whitespace and control characters.
SELECT is(pg_temp.cp_name(chr(160)), 'invalid_display_name', 'only a no-break space -> invalid_display_name');
SELECT is(pg_temp.cp_name(chr(12288)), 'invalid_display_name', 'only an ideographic space -> invalid_display_name');
SELECT is(pg_temp.cp_name('a' || chr(9) || 'b'), 'invalid_display_name', 'a tab inside the name -> invalid_display_name');
SELECT is(pg_temp.cp_name('a' || chr(10) || 'b'), 'invalid_display_name', 'a newline inside the name -> invalid_display_name');
SELECT is(pg_temp.cp_name('a' || chr(127)), 'invalid_display_name', 'DEL inside the name -> invalid_display_name');
SELECT is(pg_temp.cp_name(repeat(' ', 60) || 'a' || repeat(' ', 60)), 'ok', 'spaces around the name are trimmed before the length check');

-- 3. NFC and trimming: what is stored.
CREATE TEMP TABLE t AS
SELECT pg_temp.new_user(true) AS g1, pg_temp.new_user(true) AS g2, pg_temp.new_user(false) AS parent,
       pg_temp.new_user(true) AS g3, pg_temp.new_user(true) AS g4;
CREATE TEMP TABLE r_nfc AS
SELECT pg_temp.rpc(g1, format('SELECT public.create_child_profile(%L, %L, 3, %L, %L, %L)',
  chr(9) || 'Nguye' || chr(770) || chr(771) || 'n Thi' || chr(803) || ' A' || chr(769) || 'nh ' || chr(10), 'ech', 'vi_first', 'vi', 'Asia/Ho_Chi_Minh')) AS r
FROM t;
SELECT is(
  (SELECT r #>> '{data,display_name}' FROM r_nfc),
  'Nguyễn Thị Ánh',
  'a decomposed Vietnamese name is returned in NFC and trimmed (tab and newline are trimmed too)'
);
SELECT is(
  (SELECT display_name FROM public.child_profiles WHERE id = (SELECT (r #>> '{data,id}')::uuid FROM r_nfc)),
  'Nguyễn Thị Ánh',
  'the stored name is the NFC form'
);

-- 4. Other parameters at their limits.
SELECT is(pg_temp.cp_args(repeat('a', 32), 3, 'bilingual', 'both', 'UTC'), 'ok', 'avatar of 32 characters is accepted');
SELECT is(pg_temp.cp_args(repeat('a', 33), 3, 'bilingual', 'both', 'UTC'), 'invalid_avatar', 'avatar of 33 characters -> invalid_avatar');
SELECT is(pg_temp.cp_args('Ech', 3, 'bilingual', 'both', 'UTC'), 'invalid_avatar', 'avatar with a capital letter -> invalid_avatar');
SELECT is(pg_temp.cp_args(NULL, 3, 'bilingual', 'both', 'UTC'), 'invalid_avatar', 'null avatar -> invalid_avatar');
SELECT is(pg_temp.cp_args('', 3, 'bilingual', 'both', 'UTC'), 'invalid_avatar', 'empty avatar -> invalid_avatar');
SELECT is(pg_temp.cp_args('ech', 1, 'bilingual', 'both', 'UTC'), 'ok', 'grade 1 is accepted');
SELECT is(pg_temp.cp_args('ech', 5, 'bilingual', 'both', 'UTC'), 'ok', 'grade 5 is accepted');
SELECT is(
  ARRAY[pg_temp.cp_args('ech', 0, 'bilingual', 'both', 'UTC'), pg_temp.cp_args('ech', 6, 'bilingual', 'both', 'UTC'),
        pg_temp.cp_args('ech', -1, 'bilingual', 'both', 'UTC'), pg_temp.cp_args('ech', NULL, 'bilingual', 'both', 'UTC')],
  ARRAY['invalid_grade', 'invalid_grade', 'invalid_grade', 'invalid_grade'],
  'grade 0, 6, -1 and null -> invalid_grade'
);
SELECT is(
  ARRAY[pg_temp.cp_args('ech', 3, NULL, 'both', 'UTC'), pg_temp.cp_args('ech', 3, 'Bilingual', 'both', 'UTC')],
  ARRAY['invalid_language_mode', 'invalid_language_mode'],
  'null and wrong-case language_mode -> invalid_language_mode'
);
SELECT is(
  ARRAY[pg_temp.cp_args('ech', 3, 'bilingual', NULL, 'UTC'), pg_temp.cp_args('ech', 3, 'bilingual', 'EN', 'UTC')],
  ARRAY['invalid_voice_mode', 'invalid_voice_mode'],
  'null and wrong-case voice_mode -> invalid_voice_mode'
);
SELECT is(
  ARRAY[pg_temp.cp_args('ech', 3, 'bilingual', 'both', NULL), pg_temp.cp_args('ech', 3, 'bilingual', 'both', ''),
        pg_temp.cp_args('ech', 3, 'bilingual', 'both', 'asia/ho_chi_minh'), pg_temp.cp_args('ech', 3, 'bilingual', 'both', 'UTC+7')],
  ARRAY['invalid_timezone', 'invalid_timezone', 'invalid_timezone', 'invalid_timezone'],
  'null, empty, wrong-case and made-up time zone -> invalid_timezone'
);
SELECT is(pg_temp.cp_args('ech', 3, 'bilingual', 'both', 'America/Los_Angeles'), 'ok', 'America/Los_Angeles is accepted');

-- 5. A failed call does not use the slot: the next valid call of the same guest still succeeds.
SELECT is(
  (SELECT pg_temp.rpc(g2, $$SELECT public.create_child_profile('', 'ech', 3, 'bilingual', 'both', 'UTC')$$) ->> 'error_code' FROM t),
  'invalid_display_name',
  'invalid call first'
);
SELECT is(
  (SELECT pg_temp.rpc(g2, $$SELECT public.create_child_profile('Minh', 'ech', 3, 'bilingual', 'both', 'UTC')$$) -> 'success' FROM t),
  'true'::jsonb,
  'the valid call after a failed one still creates the profile'
);

-- 6. A parent account (not anonymous) is limited to 1 profile until Premium exists.
SELECT is(
  (SELECT pg_temp.rpc(parent, $$SELECT public.create_child_profile('Lan', 'ga', 2, 'bilingual', 'both', 'UTC')$$) -> 'success' FROM t),
  'true'::jsonb,
  'parent account creates the first profile'
);
SELECT is(
  (SELECT pg_temp.rpc(parent, $$SELECT public.create_child_profile('Su', 'meo', 2, 'bilingual', 'both', 'UTC')$$) ->> 'error_code' FROM t),
  'profile_limit',
  'parent account without Premium: second profile -> profile_limit'
);

-- 7. p_id and archived profiles.
-- g3 has an archived profile; its id is replayed as p_id.
CREATE TEMP TABLE r_arch AS
SELECT pg_temp.rpc(g3, $$SELECT public.create_child_profile('Old', 'ech', 3, 'bilingual', 'both', 'UTC')$$) AS r FROM t;
UPDATE public.child_profiles SET archived_at = now() WHERE id = (SELECT (r #>> '{data,id}')::uuid FROM r_arch);
CREATE TEMP TABLE r_arch_replay AS
SELECT pg_temp.rpc(g3, format($$SELECT public.create_child_profile('New', 'meo', 2, 'bilingual', 'both', 'UTC', %L)$$,
  (SELECT (r #>> '{data,id}')::uuid FROM r_arch))) AS r FROM t;
SELECT is(
  (SELECT count(*)::integer FROM public.child_profiles WHERE owner_id = (SELECT g3 FROM t)),
  1,
  'p_id of an archived profile of the caller does not create a second row'
);
SELECT is(
  (SELECT display_name FROM public.child_profiles WHERE id = (SELECT (r #>> '{data,id}')::uuid FROM r_arch)),
  'Old',
  'a replayed p_id never overwrites the stored profile'
);
-- The archived slot is free: one new active profile is allowed, then the limit applies again.
SELECT is(
  (SELECT pg_temp.rpc(g3, $$SELECT public.create_child_profile('New', 'meo', 2, 'bilingual', 'both', 'UTC')$$) -> 'success' FROM t),
  'true'::jsonb,
  'archived profile frees the slot: a new active profile is allowed'
);
SELECT is(
  (SELECT pg_temp.rpc(g3, $$SELECT public.create_child_profile('Third', 'meo', 2, 'bilingual', 'both', 'UTC')$$) ->> 'error_code' FROM t),
  'profile_limit',
  'archived + active exist: a third call -> profile_limit'
);
SELECT is(
  (SELECT count(*)::integer FROM public.child_profiles WHERE owner_id = (SELECT g3 FROM t) AND archived_at IS NULL),
  1,
  'exactly 1 active profile'
);

-- p_id of another account, caller without a profile: id_conflict and nothing created.
SELECT is(
  (SELECT pg_temp.rpc(g4, format($$SELECT public.create_child_profile('X', 'ech', 3, 'bilingual', 'both', 'UTC', %L)$$,
     (SELECT (r #>> '{data,id}')::uuid FROM r_nfc))) ->> 'error_code' FROM t),
  'id_conflict',
  'p_id of another account -> id_conflict even when the caller has no profile'
);
SELECT is((SELECT count(*)::integer FROM public.child_profiles WHERE owner_id = (SELECT g4 FROM t)), 0, 'id_conflict creates nothing');

-- Replay of p_id with other parameters returns the stored profile unchanged.
CREATE TEMP TABLE r_replay AS
SELECT pg_temp.rpc(g1, format($$SELECT public.create_child_profile('Other', 'meo', 5, 'en_first', 'en', 'UTC', %L)$$,
  (SELECT (r #>> '{data,id}')::uuid FROM r_nfc))) AS r FROM t;
SELECT is(
  (SELECT jsonb_build_object('created', r #> '{data,created}', 'name', r #> '{data,display_name}', 'grade', r #> '{data,grade}', 'age_group', r #> '{data,age_group}') FROM r_replay),
  '{"created": false, "name": "Nguyễn Thị Ánh", "grade": 3, "age_group": "discoverer"}'::jsonb,
  'replay of p_id with other parameters returns the stored profile (created = false)'
);

-- 8. The chốt chặn of two calls at once: a transaction advisory lock per account, taken before the count.
-- (A real two-session race is done through the REST API, see SK-021 "Nghiệm thu T2".)
SELECT ok(
  EXISTS (
    SELECT 1 FROM pg_locks AS l, t
    WHERE l.locktype = 'advisory' AND l.pid = pg_backend_pid() AND l.granted
      AND l.classid::bigint = ((hashtextextended('child_profiles:' || t.g1::text, 0) >> 32) & 4294967295)
      AND l.objid::bigint = (hashtextextended('child_profiles:' || t.g1::text, 0) & 4294967295)
  ),
  'create_child_profile holds the advisory lock child_profiles:<owner> until the transaction ends'
);
-- 9. Deleting the auth user removes the profile, its attempts, progress, days and answers (cleanup of test users).
CREATE TEMP TABLE r_cascade AS
SELECT pg_temp.submit(g2, jsonb_build_array(pg_temp.attempt(gen_random_uuid(),
  (SELECT id FROM public.child_profiles WHERE owner_id = g2), gen_random_uuid(), '2026-10-02T02:00:00Z', 6))) AS r FROM t;
SELECT is((SELECT r #>> '{data,results,0,status}' FROM r_cascade), 'inserted', 'cascade test data stored');
DELETE FROM auth.users WHERE id = (SELECT g2 FROM t);
SELECT is(
  (SELECT jsonb_build_object(
     'profiles', (SELECT count(*) FROM public.child_profiles WHERE owner_id = (SELECT g2 FROM t)),
     'attempts', (SELECT count(*) FROM public.lesson_attempts WHERE id::text = (SELECT r #>> '{data,results,0,id}' FROM r_cascade)),
     'progress', (SELECT count(*) FROM public.lesson_progress WHERE child_id::text = (SELECT r #>> '{data,results,0,child_id}' FROM r_cascade)),
     'days', (SELECT count(*) FROM public.activity_days WHERE child_id::text = (SELECT r #>> '{data,results,0,child_id}' FROM r_cascade)),
     'answers', (SELECT count(*) FROM public.quiz_answers WHERE attempt_id::text = (SELECT r #>> '{data,results,0,id}' FROM r_cascade))
   )),
  '{"profiles": 0, "attempts": 0, "progress": 0, "days": 0, "answers": 0}'::jsonb,
  'deleting the auth user cascades to profile, attempts, progress, activity_days and quiz_answers'
);

SELECT * FROM finish();
