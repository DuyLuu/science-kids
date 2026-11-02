-- Minimal stand-in for the roles, schemas and auth.uid() a Supabase database has, so scripts/db-check-schema.mjs
-- can build the schema twice on a throwaway local Postgres (no Docker). Not applied to any real database.
CREATE ROLE anon NOLOGIN;
CREATE ROLE authenticated NOLOGIN;
CREATE ROLE service_role NOLOGIN BYPASSRLS;
CREATE SCHEMA auth;
CREATE SCHEMA extensions;
GRANT USAGE ON SCHEMA auth, extensions, public TO anon, authenticated, service_role;
CREATE TABLE auth.users (id uuid PRIMARY KEY, aud varchar(255), role varchar(255), email varchar(255),
  is_anonymous boolean NOT NULL DEFAULT false, created_at timestamptz, updated_at timestamptz);
CREATE FUNCTION auth.uid() RETURNS uuid LANGUAGE sql STABLE AS $$
  select coalesce(nullif(current_setting('request.jwt.claim.sub', true), ''),
                  (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub'))::uuid $$;
GRANT EXECUTE ON FUNCTION auth.uid() TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon, authenticated, service_role;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO anon, authenticated, service_role;
