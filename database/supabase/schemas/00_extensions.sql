-- Declared state (SK-021): extensions used by the database.
-- pgTAP runs the tests of database/supabase/tests through `node scripts/db-apply.mjs --test`.
CREATE EXTENSION IF NOT EXISTS pgtap WITH SCHEMA extensions;
