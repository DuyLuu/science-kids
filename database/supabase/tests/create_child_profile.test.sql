-- SK-021 · create_child_profile: guest limit, idempotent p_id, validation, grade -> age group.

SELECT plan(25);

CREATE TEMP TABLE t_users AS
SELECT pg_temp.new_user(true) AS guest_a, pg_temp.new_user(true) AS guest_b, gen_random_uuid() AS child_b_id;

-- Not signed in.
SELECT is(
  pg_temp.rpc(NULL, $$SELECT public.create_child_profile('Minh', 'ech', 3, 'bilingual', 'both', 'Asia/Ho_Chi_Minh')$$) ->> 'error_code',
  'not_authenticated',
  'no session -> not_authenticated'
);

-- Guest A creates the profile of SK-011 (canvas: Minh, ech, Lớp 3, Tiếng Anh trước, voice en).
CREATE TEMP TABLE t_first AS
SELECT pg_temp.rpc(guest_a, $$SELECT public.create_child_profile('  Minh  ', 'ech', 3, 'en_first', 'en', 'Asia/Ho_Chi_Minh')$$) AS r
FROM t_users;

SELECT is((SELECT pg_temp.keys(r) FROM t_first), ARRAY['data', 'error', 'error_code', 'success'], 'result is {success, error_code, error, data}');
SELECT is((SELECT r -> 'success' FROM t_first), 'true'::jsonb, 'guest creates the first profile');
SELECT is((SELECT r -> 'error_code' FROM t_first), 'null'::jsonb, 'error_code is null on success');
SELECT is(
  (SELECT pg_temp.keys(r -> 'data') FROM t_first),
  ARRAY['age_group', 'archived_at', 'avatar', 'created', 'created_at', 'display_name', 'grade', 'id', 'language_mode',
        'locked_reason', 'timezone', 'voice_mode'],
  'data is the profile (no owner_id) plus created'
);
SELECT is(
  (SELECT jsonb_build_object('display_name', r #> '{data,display_name}', 'age_group', r #> '{data,age_group}',
     'language_mode', r #> '{data,language_mode}', 'voice_mode', r #> '{data,voice_mode}', 'timezone', r #> '{data,timezone}',
     'created', r #> '{data,created}') FROM t_first),
  '{"display_name": "Minh", "age_group": "discoverer", "language_mode": "en_first", "voice_mode": "en",
    "timezone": "Asia/Ho_Chi_Minh", "created": true}'::jsonb,
  'name trimmed, grade 3 -> discoverer, modes and time zone stored'
);
SELECT ok(
  (SELECT (r #>> '{data,created_at}') ~ '^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z$' FROM t_first),
  'created_at is ISO 8601 UTC with whole seconds'
);
SELECT is(
  (SELECT owner_id FROM public.child_profiles WHERE id = (SELECT (r #>> '{data,id}')::uuid FROM t_first)),
  (SELECT guest_a FROM t_users),
  'owner_id is the caller'
);

-- Second profile of a guest -> profile_limit (prd.md section 6).
CREATE TEMP TABLE t_second AS
SELECT pg_temp.rpc(guest_a, $$SELECT public.create_child_profile('Su', 'meo', 2, 'bilingual', 'both', 'Asia/Ho_Chi_Minh')$$) AS r
FROM t_users;
SELECT is((SELECT r ->> 'error_code' FROM t_second), 'profile_limit', 'guest calling a second time -> profile_limit');
SELECT is((SELECT r -> 'success' FROM t_second), 'false'::jsonb, 'success is false on error');
SELECT is((SELECT r -> 'data' FROM t_second), 'null'::jsonb, 'data is null on error');
SELECT is((SELECT count(*)::integer FROM public.child_profiles WHERE owner_id = (SELECT guest_a FROM t_users)), 1, 'guest A still has 1 profile');

-- p_id: the app's own id; the same call again returns the stored profile (lost response, retry).
SELECT is(
  (SELECT pg_temp.rpc(guest_b, format($$SELECT public.create_child_profile('Lan', 'ga', 2, 'vi_first', 'both', 'Asia/Ho_Chi_Minh', %L)$$, child_b_id)) #>> '{data,id}' FROM t_users),
  (SELECT child_b_id::text FROM t_users),
  'p_id becomes the profile id'
);
SELECT is(
  (SELECT pg_temp.rpc(guest_b, format($$SELECT public.create_child_profile('Lan', 'ga', 2, 'vi_first', 'both', 'Asia/Ho_Chi_Minh', %L)$$, child_b_id)) -> 'data' ->> 'created' FROM t_users),
  'false',
  'same p_id again -> success with created = false'
);
SELECT is((SELECT count(*)::integer FROM public.child_profiles WHERE owner_id = (SELECT guest_b FROM t_users)), 1, 'retry with p_id adds no row');
SELECT is(
  (SELECT pg_temp.rpc(guest_a, format($$SELECT public.create_child_profile('Lan', 'ga', 2, 'vi_first', 'both', 'Asia/Ho_Chi_Minh', %L)$$, child_b_id)) ->> 'error_code' FROM t_users),
  'id_conflict',
  'p_id of another account -> id_conflict'
);

-- Validation (checked before the limit).
SELECT is((SELECT pg_temp.rpc(guest_a, $$SELECT public.create_child_profile('   ', 'ech', 3, 'bilingual', 'both', 'Asia/Ho_Chi_Minh')$$) ->> 'error_code' FROM t_users), 'invalid_display_name', 'blank name -> invalid_display_name');
SELECT is((SELECT pg_temp.rpc(guest_a, $$SELECT public.create_child_profile('Minh', 'Ếch', 3, 'bilingual', 'both', 'Asia/Ho_Chi_Minh')$$) ->> 'error_code' FROM t_users), 'invalid_avatar', 'avatar not an id -> invalid_avatar');
SELECT is((SELECT pg_temp.rpc(guest_a, $$SELECT public.create_child_profile('Minh', 'ech', 6, 'bilingual', 'both', 'Asia/Ho_Chi_Minh')$$) ->> 'error_code' FROM t_users), 'invalid_grade', 'grade 6 -> invalid_grade');
SELECT is((SELECT pg_temp.rpc(guest_a, $$SELECT public.create_child_profile('Minh', 'ech', 3, 'english', 'both', 'Asia/Ho_Chi_Minh')$$) ->> 'error_code' FROM t_users), 'invalid_language_mode', 'unknown language_mode -> invalid_language_mode');
SELECT is((SELECT pg_temp.rpc(guest_a, $$SELECT public.create_child_profile('Minh', 'ech', 3, 'bilingual', 'all', 'Asia/Ho_Chi_Minh')$$) ->> 'error_code' FROM t_users), 'invalid_voice_mode', 'unknown voice_mode -> invalid_voice_mode');
SELECT is((SELECT pg_temp.rpc(guest_a, $$SELECT public.create_child_profile('Minh', 'ech', 3, 'bilingual', 'both', 'Mars/Base')$$) ->> 'error_code' FROM t_users), 'invalid_timezone', 'unknown time zone -> invalid_timezone');

-- Grade -> age group, same table as the app (Grade.ageGroup, canvas Discoverer-Profile).
SELECT is(
  ARRAY[public.age_group_for_grade(0), public.age_group_for_grade(1), public.age_group_for_grade(2), public.age_group_for_grade(3),
        public.age_group_for_grade(4), public.age_group_for_grade(5), public.age_group_for_grade(6)],
  ARRAY[NULL, 'explorer', 'discoverer', 'discoverer', 'scientist', 'scientist', NULL],
  'grade 1 explorer, 2-3 discoverer, 4-5 scientist, others null'
);

-- An archived profile frees the slot (the limit counts active profiles only).
UPDATE public.child_profiles SET archived_at = now() WHERE owner_id = (SELECT guest_a FROM t_users);
SELECT is(
  (SELECT pg_temp.rpc(guest_a, $$SELECT public.create_child_profile('Su', 'meo', 2, 'bilingual', 'both', 'Asia/Ho_Chi_Minh')$$) -> 'success' FROM t_users),
  'true'::jsonb,
  'after archiving, the guest can create a new profile'
);

-- Only signed-in users reach the RPC.
SELECT throws_ok(
  $$SELECT pg_temp.run_as('anon', NULL, 'SELECT public.create_child_profile(''Minh'', ''ech'', 3, ''bilingual'', ''both'', ''Asia/Ho_Chi_Minh'')')$$,
  '42501', NULL,
  'anon cannot execute create_child_profile'
);

SELECT * FROM finish();
