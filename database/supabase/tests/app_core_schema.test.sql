-- SK-021 · Shape of the app schema: RLS, grants, function settings, app_config seed.
-- Checks every table and function of schema public, so a later delta that forgets RLS, a REVOKE or
-- search_path fails here. Left out: functions owned by an extension, and event-trigger functions
-- (Supabase creates public.rls_auto_enable for its "enable RLS automatically" option; an event-trigger
-- function cannot be called through the API).

SELECT plan(14);

CREATE TEMP TABLE app_tables AS
SELECT c.oid, c.relname, c.relrowsecurity
FROM pg_catalog.pg_class AS c
JOIN pg_catalog.pg_namespace AS n ON n.oid = c.relnamespace
WHERE n.nspname = 'public' AND c.relkind IN ('r', 'p', 'v', 'm');

CREATE TEMP TABLE app_functions AS
SELECT p.oid, p.proname, p.prosecdef, p.proconfig
FROM pg_catalog.pg_proc AS p
JOIN pg_catalog.pg_namespace AS n ON n.oid = p.pronamespace
WHERE n.nspname = 'public'
  AND p.prorettype <> 'pg_catalog.event_trigger'::regtype
  AND NOT EXISTS (SELECT 1 FROM pg_catalog.pg_depend AS d WHERE d.objid = p.oid AND d.deptype = 'e');

SELECT is(
  (SELECT array_agg(relname::text ORDER BY relname) FROM app_tables),
  ARRAY['activity_days', 'app_config', 'child_profiles', 'lesson_attempts', 'lesson_progress', 'quiz_answers'],
  'schema public has exactly the 6 app tables'
);

SELECT is(
  (SELECT array_agg(relname::text ORDER BY relname) FROM app_tables WHERE NOT relrowsecurity),
  NULL,
  'every table has row level security enabled'
);

SELECT is(
  (SELECT array_agg(relname::text ORDER BY relname) FROM app_tables
   WHERE has_table_privilege('anon', oid, 'SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER')),
  NULL,
  'anon has no privilege on any table'
);

SELECT is(
  (SELECT array_agg(relname::text ORDER BY relname) FROM app_tables
   WHERE has_table_privilege('authenticated', oid, 'INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER')),
  NULL,
  'authenticated cannot write any table (writes go through RPCs)'
);

SELECT is(
  (SELECT array_agg(relname::text ORDER BY relname) FROM app_tables
   WHERE NOT has_table_privilege('authenticated', oid, 'SELECT')),
  NULL,
  'authenticated can SELECT every table (RLS filters the rows)'
);

SELECT is(
  (SELECT array_agg(relname::text ORDER BY relname) FROM app_tables
   WHERE NOT (has_table_privilege('service_role', oid, 'SELECT') AND has_table_privilege('service_role', oid, 'INSERT')
              AND has_table_privilege('service_role', oid, 'UPDATE') AND has_table_privilege('service_role', oid, 'DELETE'))),
  NULL,
  'service_role can read and write every table'
);

SELECT is(
  (SELECT array_agg(format('%s.%s (%s)', p.tablename, p.policyname, p.cmd) ORDER BY p.tablename)
   FROM pg_catalog.pg_policies AS p
   WHERE p.schemaname = 'public' AND (p.cmd <> 'SELECT' OR p.roles <> ARRAY['authenticated']::name[])),
  NULL,
  'policies are SELECT for authenticated only (no write policy, nothing for anon)'
);

SELECT is(
  (SELECT array_agg(relname::text ORDER BY relname) FROM app_tables AS t
   WHERE NOT EXISTS (SELECT 1 FROM pg_catalog.pg_policies AS p WHERE p.schemaname = 'public' AND p.tablename = t.relname)),
  NULL,
  'every table has a policy'
);

SELECT is(
  (SELECT array_agg(proname::text ORDER BY proname) FROM app_functions WHERE has_function_privilege('anon', oid, 'EXECUTE')),
  NULL,
  'anon cannot execute any function of schema public'
);

SELECT is(
  (SELECT array_agg(proname::text ORDER BY proname) FROM app_functions WHERE has_function_privilege('authenticated', oid, 'EXECUTE')),
  ARRAY['create_child_profile', 'get_home', 'submit_attempts'],
  'authenticated can execute the 3 RPCs and nothing else'
);

SELECT is(
  (SELECT array_agg(proname::text ORDER BY proname) FROM app_functions
   WHERE proconfig IS NULL OR NOT ('search_path=""' = ANY (proconfig))),
  NULL,
  'every function has SET search_path = '''''
);

SELECT is(
  (SELECT array_agg(proname::text ORDER BY proname) FROM app_functions WHERE prosecdef),
  ARRAY['create_child_profile', 'get_home', 'submit_attempts'],
  'the 3 RPCs are SECURITY DEFINER, the helpers are not'
);

SELECT is(
  (SELECT array_agg(key ORDER BY key) FROM public.app_config WHERE key LIKE 'rules.%'),
  ARRAY['rules.discoverer', 'rules.explorer', 'rules.scientist'],
  'app_config has rules for the 3 age groups'
);

SELECT is(
  (SELECT array_agg(key ORDER BY key) FROM public.app_config
   WHERE key LIKE 'rules.%'
     AND NOT (value ?& ARRAY['pass_threshold', 'mastery_gap_days', 'rest_days_per_week', 'xp_per_correct',
                              'xp_lesson_complete', 'xp_game_complete', 'xp_mastery_review'])),
  NULL,
  'every rules.<age_group> has the keys the RPCs read'
);

SELECT * FROM finish();
