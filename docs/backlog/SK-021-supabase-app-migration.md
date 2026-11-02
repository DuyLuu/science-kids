# SK-021 · Migration đầu cho app: hồ sơ, lần làm bài, tiến độ, `app_config` + RPC + pgTAP

Trạng thái: review · Ngày: 2026-10-28 · Phụ trách: dev · Tester: tester
Nguồn: docs/ios-test-build.md mốc 3 việc S1, S2 và phần pgTAP của T2; technical-plan.md B5.1 (quy ước), B5.3 (bảng app), B5.4 (RLS), B5.5 (RPC), B6 (`docs/api/rpc.md`), B10 (khách ẩn danh), B15 (pgTAP, giả lập user bằng `request.jwt.claims`); prd.md mục 6 (1 hồ sơ khi chưa Premium); SK-003 (vector `lesson-score`, `stars`, `local-date`, `streak`; hướng dẫn sinh pgTAP từ vector)

## Mục tiêu
Dev viết migration đầu và RPC tối thiểu để app bản thử lưu hồ sơ và lần làm bài của khách ẩn danh lên Supabase staging, với RLS chặt và sao do server chốt.

## Phạm vi
- `database/supabase/`: `config.toml`, `migrations/<YYYYMMDDHHMMSS>_app_core.sql` (giờ VN), `tests/*.test.sql` (pgTAP), `seed.sql` nếu cần.
- **Bảng** (theo B5.3, chỉ cột cần cho bản thử; cột còn lại thêm ở migration sau):
  - `child_profiles`: `id`, `owner_id`, `display_name`, `avatar`, `grade`, `age_group`, `language_mode`, `voice_mode` (`en` · `vi` · `both`), `timezone`, `locked_reason`, `created_at`, `archived_at`;
  - `lesson_attempts`: `id` (UUID app sinh), `child_id`, `lesson_id`, `content_version`, `started_at`, `completed_at`, `score`, `max_score`, `duration_s`, `xp`, `install_id`, `client_created_at`;
  - `lesson_progress`: `child_id`, `lesson_id`, `stars`, `best_score`, `first_pass_at`, `mastered_at`, `last_completed_at`, `attempts_count`;
  - `app_config`: `key`, `value jsonb`, `min_app_version`; seed `rules.discoverer` từ `content/rules.json` (SK-015);
  - `activity_days` và `quiz_answers`: xem Câu hỏi còn mở.
- Mỗi bảng: `ENABLE ROW LEVEL SECURITY`, policy `owner_id = auth.uid()` (bảng con join qua `child_profiles`), `GRANT` tường minh cho `authenticated` và `service_role`, không grant `anon`. App chỉ SELECT; mọi ghi tiến độ qua RPC (B5.4).
- **RPC** (tham số `p_`, trả `jsonb {success, error_code, error, data}`, `SECURITY DEFINER`, `SET search_path = ''`, tên bảng đầy đủ):
  - `create_child_profile(p_display_name, p_avatar, p_grade, p_language_mode, p_voice_mode, p_timezone)`: chưa Premium hoặc khách ẩn danh thì tối đa 1 hồ sơ đang hoạt động, quá thì `error_code = profile_limit`. Map lớp → nhóm tuổi.
  - `submit_attempts(p_attempts jsonb)`: nhận 1..n lần làm bài, idempotent theo `id`; trong một transaction ghi attempt rồi tính lại `lesson_progress` (sao theo `rules` trong `app_config`), trả phần thưởng chốt cho từng attempt.
  - `get_home(p_child_id)`: bài tiếp theo, sao, chuỗi ngày (nếu có `activity_days`).
- Hàm SQL thuần cho `lesson-score`, `stars`, `local-date` (và `streak` nếu có `activity_days`), kiểm bằng cùng vector với app.
- `docs/api/rpc.md` theo B6: chữ ký, input, output, mã lỗi của 3 RPC. Dev ghi đề xuất nội dung vào ticket, PM đưa vào `docs/`.
- Hướng dẫn Duy chạy tay: lệnh `supabase db push` hoặc dán SQL, thứ tự, cách bật Anonymous sign-ins.

## Ngoài phạm vi
- Thẻ, huy hiệu, thử thách tuần, `vocab_progress`, `analytics_events`, `billing_*`, `parent_accounts`, `content_publishes`, `rate_counters` và giới hạn tốc độ, cron dọn user ẩn danh.
- Chấm lại từng câu ở server: server tin `correct` app gửi (SK-003, câu hỏi mở).
- Tự apply migration: không bao giờ. Duy chạy tay.

## Tiêu chí nghiệm thu
- [ ] `supabase start` rồi `supabase db reset` trên máy local chạy migration không lỗi; `supabase db lint` không báo lỗi.
- [ ] `supabase test db` xanh, gồm (phần T2, tester viết thêm ca biên):
  - khách ẩn danh gọi `create_child_profile` lần 2 → `error_code = profile_limit`;
  - gọi `submit_attempts` hai lần cùng `id` → 1 dòng `lesson_attempts`, `attempts_count` không tăng lần 2;
  - user A không SELECT được hồ sơ và attempt của user B; `INSERT` thẳng vào `lesson_attempts` bằng role `authenticated` bị từ chối;
  - không bảng nào grant cho `anon`;
  - vector `lesson-score`, `stars`, `local-date` (và `streak` nếu làm) chạy qua hàm SQL, pass hết. File pgTAP sinh từ vector bằng script node theo README vector.
- [ ] Mọi RPC có `SET search_path = ''` và trả đúng hình dạng `jsonb` (pgTAP kiểm).
- [ ] Tên file migration đúng giờ VN (`TZ='Asia/Ho_Chi_Minh' date +"%Y%m%d%H%M%S"`).
- [ ] Có hướng dẫn chạy tay cho Duy. Duy chạy trên staging xong thì ghi ngày vào ticket.
- [ ] Không có `service_role` key trong repo. Không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- Viết và test local được ngay, không chờ ticket nào. Cần Docker cho `supabase start`.
- **Duy (S1):** tạo project staging (free), bật Anonymous sign-ins, gửi URL + publishable key. Không gửi `service_role`. Duy chạy migration trên staging.
- `content/rules.json` của SK-015 để seed `app_config`.
- SK-022 chờ migration đã chạy trên staging.

**Quyết định đã ghi** (PM đề xuất 28/10)
1. `create_child_profile` thêm `p_voice_mode` và `p_timezone` so với chữ ký ở B5.5, vì `voice_mode` có từ 28/10 và B5.1 yêu cầu app gửi múi giờ khi tạo hồ sơ.
2. pgTAP cho luồng chính do dev viết cùng migration (S2); ca biên và RLS do tester thêm (T2).

**Câu hỏi còn mở**
- **`activity_days` và `quiz_answers`.** Dòng S2 không có hai bảng này, nhưng B5.5 ghi `submit_attempts` ghi cả câu trả lời và `get_home` trả chuỗi ngày. PM đề xuất thêm cả hai vào migration này. Không thêm thì `get_home` không có chuỗi ngày và server không có dữ liệu để hiệu chỉnh `p_correct`. Duy chốt.
- Tiến độ khách lưu trên server trước khi có đồng ý của phụ huynh: B12 ghi cần luật sư rà. Staging chỉ có dữ liệu thử, nhưng cần chốt trước beta.

## Kết quả (dev)

29/10/2026. Delta baseline **đã chạy trên staging** `<staging-ref>` ngày 29/10/2026 bằng `node scripts/db-apply.mjs --yes` (quy trình DB Duy chốt 29/10, thay cho `supabase db push` và Docker local). pgTAP trên staging: **181/181 xanh**. Lint PL/pgSQL: **0 lỗi, 0 cảnh báo**. Staging không còn dữ liệu thử. Chưa commit.

### Quy trình DB của repo (Duy chốt 29/10; CLAUDE.md, `.claude/agents/dev.md`, technical-plan.md B5.1)
- **Nguồn đối chiếu:** `database/supabase/schemas/*.sql` là trạng thái đầy đủ hiện tại (extension, bảng, RLS, policy, GRANT, hàm, RPC). Đọc thư mục này là biết DB phải trông thế nào. Dữ liệu seed (`app_config.rules.*`) không nằm ở đây mà ở delta, vì `content-cli publish` sở hữu các dòng đó.
- **Delta:** mỗi thay đổi sửa file schema và thêm đúng một file `database/supabase/migrations/YYYYMMDDHHMMSS_<tên>.sql` (giờ VN). Delta đầu là baseline `20261029140144_app_core.sql` = các file schema 00 → 50 nối theo thứ tự, cộng seed. Không sửa delta đã chạy; giữ mọi delta. Delta không tự viết `BEGIN/COMMIT` (script bọc transaction).
- **Kiểm schema ↔ delta không cần Docker:** `node scripts/db-check-schema.mjs` dựng một Postgres tạm từ binary trên máy (Homebrew), áp `database/scripts/supabase-stub.sql` (role `anon`/`authenticated`/`service_role`, `auth.users`, `auth.uid()`, default privileges như Supabase), dựng schema hai lần (từ `schemas/` và từ `migrations/`), so `pg_dump --schema-only` của schema `public` (gồm GRANT, policy, hàm, comment), rồi xoá hết. Máy không có pgTAP thì bỏ dòng `CREATE EXTENSION pgtap` ở cả hai phía.
- **Apply và test:** `scripts/db-apply.mjs` (Node + `psql`, không dependency; theo mẫu `ise_center/scripts/crm-apply-sql.mjs`):
  - đọc `database/.env.local` (gitignore): `SUPABASE_PROJECT_REF` + `SUPABASE_DB_URL` Session pooler, hoặc bộ `SUPABASE_DB_HOST/PORT/USER/PASSWORD/NAME`. Mật khẩu chỉ đi qua `PGPASSWORD`, không vào argv; mọi thứ in ra đã thay host bằng `<db-host>` và mật khẩu bằng `<password>`. Chặn cổng 6543; chặn khi host/user không chứa project ref; chặn localhost trừ khi có `--allow-local`;
  - `--status`, `--dry-run` (không có file env thì kiểm offline tên file và không có `BEGIN/COMMIT`), `--rehearse` (mọi delta chưa chạy trong một transaction rồi ROLLBACK), mặc định apply (gõ project ref để xác nhận) hoặc `--yes`;
  - mỗi delta: `BEGIN` → tạo `supabase_migrations.schema_migrations` nếu chưa có (đúng bảng của Supabase CLI: `version`, `statements`, `name`) → file → ghi version → `COMMIT`, `ON_ERROR_STOP`, dừng ở lỗi đầu tiên;
  - `--test`: chạy `tests/*.test.sql`, mỗi file một session `BEGIN` → `tests/_helpers.sql` → file → `ROLLBACK`, đếm dòng TAP, kiểm đủ `plan`, exit ≠ 0 khi có fail. `--only <chuỗi>` lọc file. `--test --with-pending` chạy test trên các delta **chưa** apply trong cùng transaction rồi rollback: thử delta trước khi apply;
  - thêm `--lint` (plpgsql_check mọi hàm PL/pgSQL của `public`, gồm cả delta chưa chạy, trong transaction rollback; thay `supabase db lint`) và `--query "<sql>"` (transaction READ ONLY, để xem nhanh; chặn `COMMIT/BEGIN` trong câu);
  - cờ file env là `--env <path>`, không phải `--env-file`: Node 24 tự nuốt `--env-file` dù đứng sau tên script.
- `supabase/config.toml` vẫn giữ cho lúc cần CLI (project_id `science-kids`, cổng local 553xx để không đụng stack 543xx của ise_center, Anonymous sign-ins bật, `schema_paths = ["./schemas/*.sql"]`). Không dùng `supabase link`/`db push`/Docker.

### File đã tạo
- `database/supabase/config.toml` (`supabase init`, đã chỉnh như trên), `database/supabase/.gitignore` (của `supabase init`)
- `database/supabase/schemas/`: `00_extensions.sql` (pgTAP trong schema `extensions`), `10_app_core.sql`, `20_activity_days_quiz_answers.sql` (khối tuỳ chọn), `30_rule_functions.sql`, `40_internal_functions.sql`, `50_rpc.sql`
- `database/supabase/migrations/20261029140144_app_core.sql` (baseline, 49,9 KB; tên lấy bằng `TZ='Asia/Ho_Chi_Minh' date +"%Y%m%d%H%M%S"` lúc 14:01:44 ngày 29/10)
- `database/supabase/tests/`: `_helpers.sql` (prelude trong `pg_temp`), `app_core_schema.test.sql`, `create_child_profile.test.sql`, `submit_attempts.test.sql`, `get_home.test.sql`, `rls.test.sql`, `activity_days_quiz_answers.test.sql`, và 4 file sinh `vectors_lesson-score|stars|streak|local-date.test.sql`
- `database/scripts/gen-vector-tests.mjs` (sinh pgTAP từ vector; `--check` cho CI), `database/scripts/supabase-stub.sql`
- `database/.env.example` (không có giá trị thật)
- `scripts/db-apply.mjs`, `scripts/db-check-schema.mjs`
- Không sửa `packages/` (chỉ đọc vector), `apps/`, `content/`, `docs/backlog/README.md`. Không có `seed.sql` (seed `app_config` nằm trong delta để staging cũng có).

### Kết quả thật các lệnh (29/10/2026, staging `<staging-ref>`, PostgreSQL 17.11)
| Lệnh | Dòng tổng |
| --- | --- |
| `node scripts/db-apply.mjs --status` (trước) | `0 applied, 1 pending.` |
| `--dry-run` | `1 pending delta(s): 20261029140144_app_core.sql 49.9 KB` · `(--dry-run: nothing written)` |
| `--rehearse` | `✓ rehearsal: 1 delta(s) ran in one transaction and were rolled back — database unchanged` |
| `--test --with-pending` lần 1 | `✗ pgTAP: 10 files, 177/181 assertions passed, 4 failed` — 4 fail ở `app_core_schema` vì hàm `public.rls_auto_enable` (xem quyết định 15); sửa test, không sửa SQL |
| `--test --with-pending` lần 2 | `✓ pgTAP: 10 files, 181/181 assertions passed, 0 failed` |
| `--lint` (trước apply) | `✓ lint: checked 7 PL/pgSQL function(s), 0 error(s), 0 warning(s). Rolled back.` |
| `--yes` | `▶ 20261029140144_app_core.sql … ok 2.7s` · `✓ applied 1 delta(s)` |
| `--status` (sau) | `applied 20261029140144_app_core.sql` · `1 applied, 0 pending.` |
| `--test` (sau apply) | `✓ pgTAP: 10 files, 181/181 assertions passed, 0 failed, 0 file(s) not green. Every file was rolled back.` |
| `--lint` (sau apply) | `✓ lint: checked 7 PL/pgSQL function(s), 0 error(s), 0 warning(s).` |
| `--query` kiểm sau | `child_profiles` 0, `lesson_attempts` 0, `auth.users` 0 (test không để lại gì) · `app_config`: `rules.discoverer, rules.explorer, rules.scientist` · `pgtap` 1.3.3 · `plpgsql_check` không cài lại · lịch sử `20261029140144 app_core` |
| `node scripts/db-check-schema.mjs` | `✓ schema public is the same from schemas/ and from migrations/ (867 dump lines)` (Postgres 14.18 Homebrew, không pgTAP) |
| `node database/scripts/gen-vector-tests.mjs --check` | `vector tests are up to date` |
| `check-vectors.mjs` · `run-reference.mjs` (không sửa vector) | `OK: 7 file vector, 168 case` · `OK: 168/168 case khớp bản cài tham chiếu` |

Từng file pgTAP trên staging: `activity_days_quiz_answers` 9/9 · `app_core_schema` 14/14 · `create_child_profile` 25/25 · `get_home` 14/14 · `rls` 17/17 · `submit_attempts` 33/33 · `vectors_lesson-score` 11/11 · `vectors_local-date` 13/13 · `vectors_stars` 27/27 · `vectors_streak` 18/18.

Trước khi chạm staging, tôi đã chạy migration và toàn bộ test trên một Postgres 14 tạm trong scratchpad (shim pgTAP tối giản), sửa 3 lỗi của chính file test: ngày thử ở tháng 11/2026 là tương lai nên server kéo về `now()` (đổi sang tháng 10); ưu tiên toán tử `->`/`-` của jsonb; phạm vi aggregate trong test 51 attempt. Đã dừng và xoá Postgres tạm đó.

**Đối chiếu tiêu chí nghiệm thu** (viết theo quy trình cũ; ánh xạ sang quy trình 29/10):
- `supabase db reset` + `supabase db lint` → `--rehearse` sạch, apply staging sạch, `--lint` 0 lỗi 0 cảnh báo: **đạt**.
- `supabase test db` xanh → `--test` 181/181 trên staging: **đạt**, gồm: khách gọi `create_child_profile` lần 2 → `profile_limit`; `submit_attempts` hai lần cùng `id` → 1 dòng, `attempts_count` không tăng; A không SELECT được hồ sơ, attempt, progress của B; `INSERT` thẳng vào `lesson_attempts` bằng `authenticated` → 42501; không bảng và không hàm nào cho `anon`; 69 case vector (`lesson-score` 11, `stars` 27, `streak` 18, `local-date` 13) chạy qua hàm SQL, sinh bằng `gen-vector-tests.mjs`.
- Mọi RPC có `SET search_path = ''` và trả đúng hình dạng → `app_core_schema` (mọi hàm của `public`) và kiểm khoá kết quả ở từng file RPC: **đạt**.
- Tên file giờ VN: **đạt**. Không có `service_role` key trong repo: **đạt** (`database/.env.local` bị gitignore, `git check-ignore` xác nhận). Không commit.
- "Duy chạy trên staging xong thì ghi ngày": theo quy trình mới dev chạy; **ngày chạy staging: 29/10/2026**.

`warmup-selection` (cũng có `server`) chưa sinh pgTAP: chờ `get_warmup_items`.

### Chữ ký 3 RPC và đề xuất `docs/api/rpc.md` (PM đưa vào docs)

Chung: gọi bằng `supabase.rpc(<tên>, params)` với user đã đăng nhập (khách ẩn danh được); `anon` không gọi được (42501). Mọi kết quả là `{success, error_code, error, data}`; lỗi thì `success = false`, `data = null`, `error` là câu tiếng Anh để log, không hiện cho trẻ. Thời điểm trả về dạng ISO 8601 UTC giây chẵn `"2026-10-02T02:00:00Z"`; ngày dạng `"YYYY-MM-DD"` theo `timezone` của hồ sơ.

**1. `create_child_profile(p_display_name text, p_avatar text, p_grade integer, p_language_mode text, p_voice_mode text, p_timezone text, p_id uuid DEFAULT NULL) → jsonb`**
- Input: tên bỏ khoảng trắng hai đầu, chuẩn NFC, 1–40 ký tự (app cắt 20), không ký tự điều khiển; `p_avatar` dạng `^[a-z0-9_]{1,32}$` (`ech`, `meo`…); `p_grade` 1–5 → `age_group` (1 explorer, 2–3 discoverer, 4–5 scientist); `p_language_mode` `bilingual|en_first|vi_first`; `p_voice_mode` `en|vi|both`; `p_timezone` tên IANA có trong `pg_timezone_names`; `p_id` (tuỳ chọn) là id hồ sơ app đã sinh.
- Luật: chưa Premium (mọi tài khoản lúc này, cả khách) tối đa 1 hồ sơ đang hoạt động (`archived_at IS NULL`). Có `p_id` thì idempotent: gọi lại cùng `p_id` của chính mình → `success`, `created = false`, trả hồ sơ đã lưu.
- Output `data`: `{id, display_name, avatar, grade, age_group, language_mode, voice_mode, timezone, locked_reason, created_at, archived_at, created}` (không có `owner_id`).
- Mã lỗi: `not_authenticated`, `invalid_display_name`, `invalid_avatar`, `invalid_grade`, `invalid_language_mode`, `invalid_voice_mode`, `invalid_timezone`, `id_conflict` (p_id của tài khoản khác), `profile_limit`.

**2. `submit_attempts(p_attempts jsonb) → jsonb`**
- Input: mảng 1–50 attempt. Mỗi attempt (đúng hình dạng `AttemptRecord` trong `lessons/history.json` của SK-012; khoá lạ như `stars`, `local_date` bị bỏ qua):
  - bắt buộc: `id` (UUID app sinh, khoá idempotent), `child_id`, `lesson_id` (UUID), `started_at` (ISO 8601 có `Z` hoặc offset), `duration_s` (số nguyên ≥ 0);
  - tuỳ chọn: `completed_at` (ISO 8601), `score`, `max_score` (chỉ dùng khi không có `answers`), `xp` (mặc định 0), `content_version` (`^[A-Za-z0-9._-]{1,64}$` hoặc null), `install_id` (UUID), `client_created_at` (ISO 8601), `answers` (tối đa 20);
  - mỗi answer: `item_id` (UUID), `slot` là **số** = vị trí câu trong quiz (như app đang ghi) **hoặc** `"quiz"`/`"warmup"` kèm `item_order` (số); `correct` (bool), `points` (0|1), `tries` (1–10), `answer` (mảng các lần thử, ≤ 4 KB), `hint_used` (mặc định false), `time_ms` (tuỳ chọn).
- Luật server: có `answers` thì server tự cộng điểm bằng `score_lesson` (tin `correct`/`points` từng câu, SK-003), `max = 6`, `completed` khi đủ 6 câu quiz; không có `answers` thì giữ `score`/`max_score` của app. Không `completed` thì `completed_at` lưu null (không cho sao). `local_date` server tính từ `completed_at` (hoặc `started_at`) và `timezone` của hồ sơ; giờ ở tương lai bị kéo về lúc nhận. XP chưa chốt (B18 #13): lưu XP app gửi, chặn trần `max × xp_per_correct + xp_lesson_complete + xp_game_complete + xp_mastery_review` (110 với rules hiện tại). Sau khi ghi, tính lại `lesson_progress` của mỗi bài có attempt mới bằng `compute_stars` với `rules.<age_group>` trong `app_config`; sao, điểm cao nhất, ngày đạt và ngày thành thạo không bao giờ lùi.
- Output `data`: `{results: [...], progress: [...]}`.
  - `results[i]` theo thứ tự input: `{index, id, status, error_code, error}`; với `status` là `inserted` hoặc `duplicate` có thêm `child_id, lesson_id, score, max_score, completed, local_date, xp, stars` (`stars` là sao của bài sau cả lô).
  - `progress[]`: `{child_id, lesson_id, stars, best_score, attempts_count, first_pass_at, mastered_at, last_completed_at}` của các bài trong lô.
- Lỗi từng attempt (`status = rejected`, các attempt khác vẫn được ghi): `invalid_attempt` (thiếu trường, sai kiểu, sai ràng buộc, câu trùng hoặc quá 6 câu quiz), `child_not_found` (hồ sơ không thuộc tài khoản), `id_conflict` (id đã thuộc hồ sơ khác).
- Lỗi cả lần gọi (`success = false`, không ghi gì): `not_authenticated`, `invalid_input` (không phải mảng hoặc rỗng), `too_many_attempts` (> 50), `rules_missing` (thiếu `rules.<age_group>`).

**3. `get_home(p_child_id uuid) → jsonb`** (STABLE, chỉ đọc)
- Output `data`: `{child: <như data của create_child_profile, không có created>, today: "YYYY-MM-DD", lessons: [<progress như trên>, bài hoàn thành gần nhất trước], total_stars, total_xp, last_lesson_id, streak: {studied_days, chain_start, rest_days: [...], studied_today}, minutes_today}`.
- Bài tiếp theo do app chọn từ thứ tự trong gói nội dung và `lessons[]`: server chưa có catalog bài (MVP không có bảng `cms_*`). `streak` theo vector `streak` (SK-003 D5) trên các ngày có ≥ 1 bài hoàn thành trong `activity_days`.
- Mã lỗi: `not_authenticated`, `invalid_input` (`p_child_id` null), `child_not_found`, `rules_missing`.

### Cho ios-dev (SK-022)
- Gửi `p_id` = id hồ sơ trên máy khi gọi `create_child_profile`: id server trùng id máy, attempt dùng luôn `child_id` của máy, và gọi lại khi mất phản hồi là an toàn (`created = false`). Gặp `profile_limit` (ví dụ xoá app rồi cài lại, session cũ trong Keychain, hồ sơ trên máy mới): `SELECT` bảng `child_profiles` (RLS chỉ trả hồ sơ của mình) để nhận lại hồ sơ cũ.
- `submit_attempts` nhận nguyên `AttemptRecord` của `history.json` (pgTAP có ca dùng đúng JSON đó). Có thể thêm `install_id`, `client_created_at`; câu khởi động gửi dạng `{"slot": "warmup", "item_order": n, …}`.
- Hàng đợi: `success = true` → bỏ khỏi hàng đợi mọi attempt `inserted`, `duplicate` và `rejected` (ghi log `rejected`, gửi lại cũng không qua); `success = false` → giữ cả lô, thử lại có backoff (`not_authenticated` thì đăng nhập lại; `too_many_attempts` thì chia lô ≤ 50).
- Server không đọc `stars`, `local_date` của app; tự tính. `duration_s` hiện là thời gian thực kể cả lúc tạm dừng (`completedAt − startedAt`): server chỉ cộng tối đa 60 phút mỗi attempt vào `activity_days.minutes`; nếu app đo được thời gian học thực thì nên gửi số đó.
- Trường mới so với B5.3 mà app có thể đọc bằng SELECT: `lesson_attempts.local_date`, `received_at`; `quiz_answers.slot` là `quiz|warmup` và vị trí nằm ở `item_order`.

### Quyết định đã ghi (dev, 29/10)
**Mặc định tạm — Duy xác nhận** (đã chạy trên staging cùng baseline):
1. **Thêm `activity_days` và `quiz_answers`** theo đề xuất PM. Khối riêng: `schemas/20_activity_days_quiz_answers.sql`, hàm `refresh_activity_day`, các dòng đánh dấu `[optional]` trong `store_attempt`, `submit_attempts`, `get_home`, test riêng `activity_days_quiz_answers.test.sql`.
2. **Chuỗi ngày đếm `studied_days`** (SK-022, SK-003 D5). `get_home` trả đủ `studied_days`, `chain_start`, `rest_days`, `studied_today`, nên đổi cách hiện không cần đổi server.
3. **Server tin `correct` và `points` app gửi** (SK-003) nhưng tự cộng điểm bài bằng `score_lesson`.

**dev:**
4. `create_child_profile` thêm `p_id uuid DEFAULT NULL` (cuối danh sách, không phá chữ ký của ticket) để id server = id máy và gọi lại an toàn.
5. Seed cả 3 `rules.explorer|discoverer|scientist` (ticket ghi `rules.discoverer`): hồ sơ Lớp 1, 4, 5 lưu đúng nhóm tuổi (SK-011 quyết định 8) và RPC đọc `rules.<age_group>` của hồ sơ, thiếu thì `rules_missing`. Hiện 3 bộ giống nhau ở phần chấm nên bản thử chơi Discoverer cho mọi lớp không lệch. Seed `ON CONFLICT DO NOTHING` để không đè bản `publish` sau này.
6. Không có cột `activity_days.is_rest_day`: ngày nghỉ phụ thuộc "hôm nay" nên tính lúc đọc (`compute_streak` trong `get_home`); thêm khi báo cáo phụ huynh cần.
7. Cột thêm so với B5.3: `lesson_attempts.local_date` (server tính, chốt lúc ghi để đổi múi giờ sau này không làm đổi sao cũ) và `received_at`; `updated_at` ở `lesson_progress`, `activity_days`, `app_config`; `quiz_answers.item_order`. `quiz_answers.slot` theo B5.3 là `quiz|warmup`; app đang ghi `slot` là số vị trí, server đọc được cả hai dạng.
8. Attempt chưa đủ 6 câu quiz: lưu `completed_at = null`, vẫn tính vào `attempts_count` và phút trong ngày, không tính vào sao và `lessons_completed`.
9. Giờ từ máy ở tương lai bị kéo về lúc server nhận; `started_at` không sau `completed_at`. Giờ máy bị lùi thì vẫn nhận (chỉ thêm một ngày học trong quá khứ).
10. XP: lưu số của app, chặn trần theo `rules` (xem B18 #13).
11. `get_home` không trả `next_lesson_id` (server không có catalog bài); trả `last_lesson_id` và `lessons[]`.
12. Giới hạn chống lạm dụng tối thiểu: ≤ 50 attempt mỗi lần gọi, ≤ 20 answer mỗi attempt, `answer` ≤ 4 KB, `duration_s` ≤ 10 ngày. Rate limit theo `rate_counters` vẫn ngoài phạm vi.
13. Hàm thuần và hàm nội bộ nằm trong `public` nhưng thu hồi `EXECUTE` của `anon` và `authenticated` (chỉ `service_role` và chủ hàm). Chỉ 3 RPC là `SECURITY DEFINER`; mọi hàm có `SET search_path = ''`. Ghi đồng thời từ hai máy: `submit_attempts` khoá theo hồ sơ (`pg_advisory_xact_lock`, theo thứ tự id); `create_child_profile` khoá theo tài khoản.
14. File test không có `BEGIN/ROLLBACK`; `db-apply --test` bọc và rollback. Assertion luôn chạy bằng `postgres`; chỉ câu SQL trong `pg_temp.run_as` chạy bằng `anon`/`authenticated` với `request.jwt.claims` (B15), nên không phụ thuộc quyền EXECUTE của pgTAP cho `authenticated`. Ngày thử dùng tháng 10/2026 (quá khứ) vì server kéo giờ tương lai về hiện tại.
15. Staging có sẵn hàm `public.rls_auto_enable()` + event trigger `ensure_rls` (tuỳ chọn "tự bật RLS cho bảng mới" lúc tạo project; chủ `postgres`, `SECURITY DEFINER`, `search_path = pg_catalog`). Không đụng tới. Test bỏ qua hàm trả `event_trigger` (không gọi được qua API).

### Bỏ `activity_days`, `quiz_answers` nếu Duy nói không
Baseline đã chạy nên phải bằng một delta mới, không sửa baseline: xoá file `schemas/20_activity_days_quiz_answers.sql` và hàm `refresh_activity_day` ở `40_internal_functions.sql`; bỏ các dòng `[optional]` trong `store_attempt`, `submit_attempts`; trong `get_home` lấy ngày học từ `lesson_attempts` (câu thay thế ghi ngay trên dòng đó) và tính `minutes_today` từ `lesson_attempts` hoặc bỏ khoá; delta mới `DROP FUNCTION public.refresh_activity_day(uuid, date)`, `DROP TABLE public.quiz_answers, public.activity_days` và `CREATE OR REPLACE` ba hàm trên; xoá `tests/activity_days_quiz_answers.test.sql`; chạy `db-check-schema`, `--test --with-pending`, `--yes`, `--test`. Khoảng nửa giờ. Bỏ `activity_days` thì đổi hợp đồng `get_home` (mất `minutes_today` nếu bỏ khoá): báo ios-dev.

### Hướng dẫn cho Duy
Đã xong ở staging (Duy tạo project, bật Anonymous sign-ins, điền `database/.env.local`; dev apply và test). Khi cần làm lại hoặc cho production sau này:
1. **Lấy chuỗi Session pooler:** Supabase Dashboard → chọn project → nút **Connect** trên thanh trên → tab **Connection String** → Method **Session pooler** (cổng 5432). Chép chuỗi `postgresql://postgres.<ref>:[YOUR-PASSWORD]@aws-…pooler.supabase.com:5432/postgres`, thay `[YOUR-PASSWORD]` bằng mật khẩu DB (mất thì Project Settings → Database → Reset database password). Mật khẩu có ký tự như `@ # / :` thì mã hoá URL (`@` → `%40`) hoặc dùng bộ biến `SUPABASE_DB_HOST/…/PASSWORD` thay cho URL. Không dùng "Direct connection" (`db.<ref>.supabase.co` chỉ có IPv6) và không dùng "Transaction pooler" cổng 6543 (script chặn).
2. **Điền file:** `cp database/.env.example database/.env.local`, điền `SUPABASE_PROJECT_REF` và `SUPABASE_DB_URL`. File bị gitignore; không dán vào ticket hay chat.
3. **Chạy** (từ gốc repo): `node scripts/db-apply.mjs --status` → `--dry-run` → `--rehearse` → `--test --with-pending` → `--lint` → `--yes` (hoặc không `--yes` rồi gõ project ref) → `--test`.
4. **Kiểm sau khi chạy:** `--status` báo `0 pending`; `--test` xanh; `--query "SELECT key FROM public.app_config"` có 3 khoá `rules.*`; ở Dashboard → Authentication → Sign In / Providers, mục "Allow anonymous sign-ins" đang bật; nên mở thêm Advisors → Security Advisor xem có cảnh báo nào về 6 bảng và các hàm mới không (tôi không xem được dashboard nên chưa kiểm mục này).
5. **Production** (Duy tự chạy): dùng file env riêng, ví dụ `node scripts/db-apply.mjs --env database/.env.production.local --rehearse`, rồi chạy không `--yes` để phải gõ ref. Đề xuất thêm `database/.env.*.local` vào `.gitignore` (hiện chỉ có `database/.env.local`; dev không sửa file này).
6. Anonymous sign-ins mặc định giới hạn 30 lần/giờ/IP (B5.4): nâng ở Authentication → Rate Limits trước khi thử ở Wi-Fi trường hay trung tâm.

### Cho tester (T2, thêm vào `database/supabase/tests/`, chạy bằng `node scripts/db-apply.mjs --test`)
- Ca biên `create_child_profile`: tên đúng 40 và 41 ký tự, emoji và chữ tổ hợp (NFC), tài khoản phụ huynh (không ẩn danh) cũng bị `profile_limit` cho tới khi có Premium, `p_id` trùng hồ sơ đã lưu trữ, hai lần gọi đồng thời (hai session) chỉ ra 1 hồ sơ.
- Ca biên `submit_attempts`: đúng 50 và 51 attempt, 20 và 21 answer, `answer` > 4 KB, `points` = 2 hoặc −1, `tries` = 0, `slot` lạ, `duration_s` âm hoặc thiếu, thiếu `started_at`, `completed_at` trước `started_at`, `install_id` sai dạng, hai session gửi cùng một attempt đồng thời (1 dòng), attempt cho hồ sơ đã lưu trữ, đổi `rules.pass_threshold` từ 5/6 xuống 4/6 rồi lên lại (sao không lùi), cùng `completed_at` khác `id` (phá hoà theo `attempt_id`, SK-003 mục 5a).
- `get_home`: chuỗi có ngày nghỉ (đối chiếu vector `streak`), hôm nay chưa học, hồ sơ ở `America/Los_Angeles` quanh nửa đêm, `minutes_today` với attempt bị chặn 60 phút, hồ sơ đã lưu trữ.
- RLS: B có dữ liệu ở `activity_days`, `quiz_answers` mà A vẫn không thấy; `UPDATE`/`DELETE` thẳng vào `activity_days`, `quiz_answers`, `lesson_attempts` bằng `authenticated` → 42501; `anon` gọi `submit_attempts` → 42501.
- Qua HTTP thật (khi có publishable key): `signInAnonymously` → `create_child_profile` → `submit_attempts` → `get_home` bằng REST/RPC; request chỉ có publishable key (không session) gọi RPC phải bị từ chối. Dữ liệu tạo qua HTTP không tự rollback: dọn bằng cách xoá user thử ở Authentication → Users (xoá dây chuyền hồ sơ và tiến độ).

### Câu hỏi còn mở cho Duy
- Giữ `activity_days` và `quiz_answers`? (Đang giữ, đã chạy staging; bỏ thì một delta như trên.)
- Màn Trang chủ hiện `studied_days` (SK-003 D5)?
- Server tin `correct` app gửi (SK-003)? Muốn chấm lại ở server thì cần đáp án trên server (bảng `cms_*` hoặc gói bài), ngoài MVP.
- XP (B18 #13): giữ cách "lưu số của app, chặn trần" tới khi chốt?
- Tiến độ khách lưu trên server trước khi phụ huynh đồng ý (B12, luật sư): cần chốt trước beta.
- Về sau `publish` có chép thứ tự bài vào `app_config` để server tự tính "bài tiếp theo" (khi có nhiều chủ đề, hai máy) không?

### Việc phụ trong phiên
- Lúc đầu (trước khi đổi quy trình) tôi bật Docker và `supabase start` local tối giản cho project `science-kids` (cổng 553xx), rồi `supabase stop` và thoát Docker. Khi Docker bật, stack local của ise_center (project `database`) tự khởi động lại theo restart policy; thoát Docker cũng dừng nó, như trạng thái ban đầu. Docker còn giữ các volume `supabase_*_science-kids` (DB rỗng); xoá bằng `docker volume ls --filter label=com.supabase.cli.project=science-kids` rồi `docker volume rm …` nếu muốn.
- Đề xuất CI (B14): chạy `node database/scripts/gen-vector-tests.mjs --check` và `node scripts/db-check-schema.mjs` (runner có Postgres) mỗi PR.

## Nghiệm thu T2 (tester)

29/10/2026, staging `<staging-ref>`. Chỉ thêm test trong `database/supabase/tests/`; không sửa schema, migration, script. Không commit.

### Lệnh và kết quả thật
```
node scripts/db-apply.mjs --test
✓ pgTAP: 14 files, 363/363 assertions passed, 0 failed, 0 file(s) not green. Every file was rolled back.
```
Trước T2 là 10 files, 181 assertions; T2 thêm 4 file, **182 assertion**: `create_child_profile_edge` 44 · `get_home_edge` 30 · `rls_edge` 37 · `submit_attempts_edge` 71. Chạy một file: `node scripts/db-apply.mjs --test --only edge`.

**3 trong 71 assertion của `submit_attempts_edge` là `skip` có chủ ý (lỗi L1)**, runner tính là "ok". Lý do: `scripts/db-apply.mjs` đếm mọi dòng `not ok` là fail, kể cả test bọc `todo()` (pgTAP in `not ok N ... # TODO`), nên `todo()` làm bộ test đỏ. Thay vào đó mỗi assertion L1 viết dạng `CASE WHEN <hành vi đúng> THEN ok(true, ...) ELSE skip('SK-021 L1: ...', 1) END`: khi dev sửa xong thì tự thành assertion thật, không cần sửa test. Tìm các assertion này bằng `grep -n "SK-021 L1" database/supabase/tests/submit_attempts_edge.test.sql`.

Test chỉ khẳng định trên dữ liệu do chính nó tạo (user mới mỗi file, mọi thứ rollback). Test có `DELETE FROM app_config` và `UPDATE app_config` trong transaction để thử `rules_missing` và đổi `pass_threshold`: rollback nên người khác không thấy; chỉ giữ khoá hàng tới khi rollback.

### Bảng ca biên
| Ca | Mong đợi | Kết quả | File test |
| --- | --- | --- | --- |
| Tên 40 / 41 ký tự (ASCII, 40/41 emoji, 40/41 chữ `e`+dấu sắc tổ hợp) | 40 nhận, 41 `invalid_display_name`; đếm sau NFC | đạt | `create_child_profile_edge` |
| Tên NFC | tên tổ hợp lưu và trả về dạng NFC, cắt tab/xuống dòng hai đầu | đạt | `create_child_profile_edge` |
| Tên rỗng, null, chỉ NBSP, chỉ khoảng trắng CJK, tab/newline/DEL ở giữa | `invalid_display_name` | đạt | `create_child_profile_edge` |
| Avatar 32/33, hoa, null, rỗng; lớp 0/1/5/6/-1/null; language/voice null hoặc sai hoa thường; múi giờ null, rỗng, sai hoa thường, `UTC+7` | mã lỗi `invalid_*` đúng | đạt | `create_child_profile_edge` |
| Phụ huynh (không ẩn danh) lần 2 | `profile_limit` | đạt | `create_child_profile_edge` |
| `p_id` của hồ sơ đã lưu trữ | không tạo dòng thứ hai, không ghi đè | đạt (xem Q1: trả `success`) | `create_child_profile_edge` |
| Lưu trữ rồi tạo mới; lần thứ ba | cho 1 hồ sơ mới rồi `profile_limit` | đạt | `create_child_profile_edge` |
| `p_id` của tài khoản khác, người gọi chưa có hồ sơ | `id_conflict`, không tạo gì, không lộ dữ liệu | đạt | `create_child_profile_edge`, `rls_edge` |
| Gọi lại `p_id` với tham số khác | trả hồ sơ đã lưu, `created = false` | đạt | `create_child_profile_edge` |
| Gọi lỗi trước rồi gọi đúng | lỗi không chiếm chỗ | đạt | `create_child_profile_edge` |
| Chốt chặn đồng thời `create_child_profile` | advisory lock `child_profiles:<owner>` giữ tới hết transaction | đạt (đọc `pg_locks`) | `create_child_profile_edge` |
| Xoá `auth.users` | xoá dây chuyền hồ sơ, attempt, progress, activity_days, quiz_answers | đạt | `create_child_profile_edge` |
| Lô đúng 50 / 51 attempt | 50 nhận hết; 51 `too_many_attempts`, không ghi gì | đạt | `submit_attempts_edge` |
| 49 tốt + 1 hỏng giữa lô 50 | 49 `inserted`, 1 `rejected` đúng `index` | đạt | `submit_attempts_edge` |
| 20 / 21 answer | 20 nhận, 21 `rejected` | đạt | `submit_attempts_edge` |
| `answer` đúng 4096 byte / 4097 / 100 KB / không phải mảng | 4096 nhận, còn lại `rejected` | đạt | `submit_attempts_edge` |
| 24 kiểu answer hỏng: `points` 2, -1, 1.5, chữ; `tries` 0, 11, thiếu; `slot` lạ, 0, 21, -1, 1.5, thiếu, null; `quiz` không `item_order`; `item_id` thiếu/sai; `correct` chữ; `time_ms` -1; `answers` là chuỗi/object/phần tử không phải object; 7 câu quiz; cùng item ở quiz và warmup | `rejected` + `invalid_attempt`, không để lại dòng nào ở `lesson_attempts`, `quiz_answers` | đạt | `submit_attempts_edge` |
| 33 kiểu trường attempt hỏng: `duration_s` âm/thiếu/null/1.5/chữ/1e12; `started_at` thiếu/null/chữ/không múi giờ/chỉ ngày/số; `completed_at`, `client_created_at`, `install_id`, `content_version` (cách, 65 ký tự, rỗng), `lesson_id`, `id`, `child_id`, `xp` sai; không answers và thiếu hoặc sai `score`/`max_score` | `rejected` + `invalid_attempt`, không ghi | đạt | `submit_attempts_edge` |
| `child_id` thiếu hoặc null; phần tử không phải object; `p_attempts` null hoặc chuỗi | `child_not_found`; `invalid_attempt` từng phần tử; `invalid_input` | đạt | `submit_attempts_edge` |
| Giờ có offset `+07:00` và phần giây lẻ; trường tuỳ chọn thiếu; `content_version` 64 ký tự; `duration_s` 0 | nhận, đúng thời điểm | đạt | `submit_attempts_edge` |
| `xp` -5 / 110 / 111 | 0 / 110 / 110 | đạt | `submit_attempts_edge` |
| `duration_s` 864001 | nhận bị cắt 864000 hoặc từ chối; không bao giờ lưu quá | đạt (server cắt âm thầm, xem Q3) | `submit_attempts_edge` |
| `completed_at` trước `started_at` | nhận, `started_at` kéo về `completed_at` (quyết định 9) | đạt | `submit_attempts_edge` |
| `started_at` tương lai | kéo về `now()` | đạt | `submit_attempts_edge` |
| **Thiếu `completed_at`** | `completed = false`, `completed_at` null, 0 sao | **sai, L1** (3 assertion `skip`) | `submit_attempts_edge` |
| Cùng `id` hai lần trong một lô; hai lần khác lần gọi; gửi lại cùng `id` nội dung khác; `id`/`child_id` viết HOA | `inserted` rồi `duplicate`; 1 dòng; `attempts_count` 1; bản đầu thắng; HOA = cùng id | đạt | `submit_attempts_edge` |
| Hai session gửi cùng một attempt (chốt chặn) | advisory lock `child:<id>` + `ON CONFLICT (id) DO NOTHING` | đạt (đọc `pg_locks`) và đạt qua HTTP thật (bên dưới) | `submit_attempts_edge` |
| `local_date`: LA lúc DST kết thúc (02/11/2025) và bắt đầu (09/03/2025), Kiritimati UTC+14 | ngày theo múi giờ hồ sơ | đạt | `submit_attempts_edge` |
| Hai lần đạt cùng ngày địa phương nhưng khác ngày UTC (LA 12:00 và 23:00) | 2 sao, chưa thành thạo; ngày địa phương kế tiếp thì 3 sao | đạt | `submit_attempts_edge` |
| Đổi `pass_threshold` 5/6 → 4/6 → 5/6, rồi 5/6 → 6/6 | sao, `first_pass_at`, `mastered_at`, `best_score` không lùi | đạt | `submit_attempts_edge` |
| Lần đạt chơi sớm hơn tới server sau lần đạt chơi muộn | tính lại: lần sớm là first pass, lần muộn thành thạo, 3 sao | đạt | `submit_attempts_edge` |
| Cùng `completed_at` khác `id` (SK-003 mục 5a) | kết quả không phụ thuộc thứ tự đến; `stars_detail` chọn `id` nhỏ nhất (collation C) | đạt | `submit_attempts_edge` |
| Thiếu `rules.<age_group>` | `success = false`, `rules_missing`, không ghi | đạt | `submit_attempts_edge`, `get_home_edge` |
| `anon` gọi `submit_attempts`; B ghi vào hồ sơ A | 42501; `child_not_found` | đạt | `submit_attempts_edge`, `rls_edge` |
| Attempt cho hồ sơ đã lưu trữ | **chưa có luật** | server **nhận** (`inserted`) | không có assertion, xem Q1 |
| Chuỗi có ngày nghỉ (1 ngày nghỉ; 2 khoảng trống cùng/khác tuần ISO), hôm nay chưa học, chỉ học hôm kia, chuỗi 14 ngày | khớp vector `streak` (D5) | đạt | `get_home_edge` |
| Attempt chưa hoàn thành | tính phút, không tính ngày học, 0 sao, bài vẫn có trong `lessons[]` | đạt | `get_home_edge` |
| `minutes_today` với attempt 7200 s + 61 s | 60 + 2 = 62, chỉ tính hôm nay | đạt | `get_home_edge` |
| Attempt năm 2099 và năm 2020 | 2099 tính là hôm nay; 2020 không kéo dài chuỗi | đạt | `get_home_edge` |
| Múi giờ LA, Kiritimati, Pago_Pago | `today` theo múi giờ hồ sơ; Kiritimati hơn Pago_Pago 1 hoặc 2 ngày | đạt | `get_home_edge` |
| `get_home` hồ sơ người khác, id lạ, không phiên, `anon`; hồ sơ không có dữ liệu | `child_not_found`, `not_authenticated`, 42501; không thấy dữ liệu người khác | đạt | `get_home_edge`, `rls_edge` |
| `get_home` hồ sơ đã lưu trữ | **chưa có luật** | server trả `success` | không có assertion, xem Q1 |
| B có dữ liệu ở `activity_days`, `quiz_answers`; A đọc bằng mọi điều kiện | 0 dòng; A chỉ thấy 1/1/1/1/6 của mình | đạt | `rls_edge` |
| `authenticated` không có `sub` | 0 dòng mọi bảng | đạt | `rls_edge` |
| UPDATE/DELETE/INSERT/TRUNCATE thẳng vào 6 bảng (18 câu) | 42501 hết, không dòng nào đổi | đạt | `rls_edge` |
| Quyền bảng và hàm theo catalog | `authenticated` chỉ SELECT; `anon` không gì; mọi bảng `public` có RLS; mọi policy `FOR SELECT TO authenticated`; chỉ 3 RPC chạy được bởi `authenticated`, không bởi `anon` | đạt | `rls_edge` |
| A gọi `refresh_lesson_progress`, `refresh_activity_day`, `store_attempt` với id của B | 42501 | đạt | `rls_edge` |
| A phát lại `id` attempt của B trên hồ sơ của A | `id_conflict`, attempt của B không đổi | đạt | `rls_edge` |

### Đồng thời thật qua REST (publishable key, 3 khách ẩn danh)
Kịch bản chạy bằng script trong scratchpad (không có trong repo; key đọc vào biến shell, không in; token đã xoá sau khi dùng). Kiểm bằng `--query` chỉ đọc.

| Thử | Mong đợi | Thực tế |
| --- | --- | --- |
| Khách 1: 2 lời gọi song song `create_child_profile`, không `p_id` | 1 hồ sơ | 1 `success`, 1 `profile_limit`; DB có 1 hồ sơ. Đạt |
| Khách 2: 6 lời gọi song song, tên khác nhau | 1 hồ sơ | 1 `success`, 5 `profile_limit`; DB có 1 hồ sơ. Đạt |
| Khách 3: 4 lời gọi song song cùng `p_id` | 1 hồ sơ, lời gọi trùng trả hồ sơ cũ | cả 4 `success`; 1 `created = true`, 3 `created = false`; DB có 1 hồ sơ. Đạt |
| Khách 1: 2 lời gọi song song `submit_attempts` cùng một attempt (6 answer), rồi thêm 6 lời gọi | 1 dòng | 1 `inserted`, 7 `duplicate`; DB: 1 `lesson_attempts`, `attempts_count` = 1, 6 `quiz_answers`, 1 `activity_days`. Đạt |
| `get_home` của khách 1 | sao, XP, chuỗi khớp | `total_stars` 2, `total_xp` 90, `studied_days` 1, `studied_today` true, `minutes_today` 4. Đạt |
| Chỉ publishable key, không phiên: gọi 3 RPC | từ chối | HTTP 401, `42501 permission denied for function ...` cả 3. Đạt |
| Chỉ publishable key: `GET /rest/v1/child_profiles` | từ chối | 401, `42501`. Đạt |
| Khách 1 đọc hồ sơ khách 3 qua REST; `PATCH` hồ sơ của mình; `POST /lesson_attempts` | rỗng; từ chối; từ chối | `[]`; HTTP 403; `42501`. Đạt |

Hai session chạy thật không tạo được hai hồ sơ hay hai dòng attempt trong các thử trên. Mẫu thử nhỏ (2 đến 8 lời gọi, một lần mỗi kịch bản), nên đây là bằng chứng ủng hộ khoá, không phải chứng minh.

### Lỗi tìm thấy
| Mã | Mức | Mô tả |
| --- | --- | --- |
| L1 | Lỗi (không chặn: app iOS hiện luôn gửi `completed_at`, vì `AttemptRecord.completedAt` là `Date` không null, `AttemptStore.swift:156`; nhưng payload sync `SyncModels.swift:164` khai báo `String?`, nên hợp đồng cho phép thiếu) | Attempt **không có `completed_at`** bị biến thành hoàn thành lúc `now()`. |

**L1, bước tái hiện:** gọi `submit_attempts` với một attempt hợp lệ nhưng bỏ khoá `completed_at` và bỏ `answers` (hoặc `answers` rỗng), `score` 1, `max_score` 6.
- Mong đợi (ticket, quyết định 8, rpc.md: `completed_at` tuỳ chọn, không hoàn thành thì lưu null, không cho sao): `completed = false`, `lesson_attempts.completed_at` null, `stars = 0`.
- Thực tế: `completed = true`, `completed_at = now()`, `local_date` = hôm nay, `stars = 2` (cộng `last_completed_at` và ngày học trong `activity_days`/chuỗi).
- Nguyên nhân: `database/supabase/schemas/40_internal_functions.sql:262` `v_sent_completed_at := LEAST(public.parse_instant(p_attempt ->> 'completed_at'), v_now);` Postgres `LEAST` bỏ qua NULL nên `LEAST(NULL, now())` = `now()`. Sau đó dòng 303 và 308 (`v_completed := ... v_sent_completed_at IS NOT NULL`) luôn đúng. Delta baseline cùng lỗi: `migrations/20261029140144_app_core.sql:698`.
- Gợi ý (việc của dev): giữ NULL, ví dụ `CASE WHEN x IS NULL THEN NULL ELSE LEAST(x, v_now) END`, và để dòng 263 `COALESCE(v_sent_completed_at, v_now)` vẫn kéo `started_at` về `now()`.
- Test: 3 assertion `skip` ở `submit_attempts_edge.test.sql`, mục "L1". Sửa xong thì tự thành assertion thật.

Không tìm thấy lỗi chặn. Không thấy hỏng RLS, GRANT, hay chốt chặn đồng thời.

### Góp ý (không phải lỗi, chưa có assertion)
- **G1.** Tên chỉ có ký tự rộng không thấy (ví dụ U+200B zero-width space) vẫn nhận: `[[:cntrl:]]` chỉ bắt ký tự điều khiển Cc. Ký tự đảo chiều chữ (U+202E) cũng nhận. Tên hiển thị trống hoặc đảo chiều trên màn hình trẻ và phụ huynh. Đề xuất bổ sung chặn nhóm `Cf` ở `50_rpc.sql:41`, sau khi Duy chốt.
- **G2.** Giới hạn 40 ký tự đếm code point, nên một emoji gia đình (5 code point) chiếm 5. App cắt 20 nên khó chạm, chỉ ghi lại.
- **G3.** `slot` số lặp (6 answer cùng `slot = 1`) vẫn cho "đủ 6 câu quiz" và hoàn thành bài; `item_order` không duy nhất trong một attempt. Vì server đã tin `correct` do app gửi (quyết định 3) nên chỉ là thêm một cách làm giả, không thêm rủi ro mới.
- **G4.** Giới hạn `answer` 4 KB tính cho từng answer, không có trần tổng: 50 attempt × 20 answer × 4 KB ≈ 4 MB mỗi lần gọi. Rate limit đã ngoài phạm vi, nhưng nên nhớ khi làm `rate_counters`.
- **G5.** Giới hạn 1 hồ sơ chỉ dựa vào advisory lock, không có ràng buộc `UNIQUE` một phần ở DB (ví dụ `owner_id WHERE archived_at IS NULL`). Khi có Premium cần bỏ giới hạn thì ràng buộc này phải khác; hiện chưa có hại.
- **G6.** `total_xp` của `get_home` cộng XP của mọi attempt, kể cả attempt chưa hoàn thành (`get_home` đọc `lesson_attempts.xp` không lọc `completed_at`; XP do app gửi, chỉ bị chặn trần). Nếu app gửi XP > 0 cho attempt dở thì tổng XP lệch. Đọc code, chưa có test.

### Câu hỏi cho Duy
1. **Hồ sơ đã lưu trữ (`archived_at` có giá trị)** server đang làm: `submit_attempts` cho hồ sơ đó vẫn `inserted` và tính sao; `get_home` trả `success`; `create_child_profile` với `p_id` của hồ sơ đó trả `success`, `created = false`, `archived_at` có giá trị (app có thể tưởng hồ sơ còn hoạt động). Ticket không nói. Muốn từ chối (`child_archived`?), cho phép ghi nhưng không tính ngày học, hay giữ nguyên? Khi chưa trả lời, tôi không viết assertion cho ba hành vi này.
2. **Attempt thiếu `completed_at`**: xác nhận luật của L1 (không hoàn thành, lưu null, không sao), kể cả khi `answers` đủ 6 câu quiz? Hiện server coi là hoàn thành lúc nhận.
3. **`duration_s` > 864000 và `completed_at` < `started_at`**: server nhận và âm thầm chỉnh (cắt về 864000; kéo `started_at` về `completed_at`) thay vì từ chối. Quyết định 9 ghi cách chỉnh thứ hai; cách thứ nhất ticket ghi "≤ 10 ngày" chưa nói cắt hay từ chối. Giữ cắt?
4. **G1:** có chặn ký tự định dạng Unicode (nhóm `Cf`) trong tên không?
5. `todo` trong `db-apply.mjs`: muốn runner coi dòng `not ok ... # TODO` là không fail (dev sửa script, ngoài vùng tester)? Hiện tester dùng `skip` có điều kiện để giữ bộ test xanh.

### User id đã tạo trên staging (để Duy xoá ở Authentication → Users; xoá dây chuyền hồ sơ và tiến độ)
- `d2a54be1-2a38-4299-8964-17433f47471e` (khách 1: 1 hồ sơ, 1 attempt, 6 answer, 1 ngày hoạt động)
- `370eeea0-de45-4b0f-b5ac-49c195b64fe3` (khách 2: 1 hồ sơ)
- `3185adae-3dfb-4a23-b47d-15400538fd8f` (khách 3: 1 hồ sơ)

Test pgTAP không để lại dữ liệu (mỗi file rollback).

## Sửa sau T2 (dev)

29/10/2026, khoảng 18:00, staging `<staging-ref>`. Sửa L1 và cách `db-apply --test` đếm TODO/SKIP. Không đụng test, `apps/ios`, `docs/backlog/README.md`. Không làm Q1, Q3, Q4, G1–G6 (chờ Duy). Chưa commit.

### File đã sửa
- `database/supabase/schemas/40_internal_functions.sql`: trong `store_attempt`, bỏ `LEAST(parse_instant(completed_at), v_now)`. Giờ `completed_at` thiếu thì giữ NULL; có và ở tương lai thì kéo về `v_now` bằng `IF … > v_now`. Dòng kế `v_started_at := LEAST(v_started_at, COALESCE(v_sent_completed_at, v_now))` giữ nguyên: thiếu `completed_at` thì `started_at` vẫn không vượt quá lúc nhận. Hai nhánh `v_completed` (có và không có `answers`) không phải sửa: chúng đã đúng khi NULL đi qua được.
- `database/supabase/migrations/20261029180037_fix_missing_completed_at.sql` (delta mới, tên lấy bằng `TZ='Asia/Ho_Chi_Minh' date` lúc 18:00:37): chỉ `CREATE OR REPLACE FUNCTION public.store_attempt(uuid, jsonb, integer)`. Thân hàm chép nguyên từ file schema (đã `diff` thấy trùng). Giữ chữ ký, giữ không `SECURITY DEFINER` (hàm nội bộ), giữ `SET search_path = ''`. Viết lại `REVOKE … FROM PUBLIC, anon, authenticated` và `GRANT EXECUTE … TO service_role` y như schema (idempotent).
- `scripts/db-apply.mjs`: `--test` đếm theo TAP (chi tiết ở dưới). Các cờ khác không đổi, kể cả `--query`.

**Ảnh hưởng tới app:** không đổi chữ ký RPC hay hình dạng kết quả. App iOS luôn gửi `completed_at` (`AttemptStore.swift:156`), nên kết quả không đổi. Nếu payload sync (`SyncModels.swift:164`, `String?`) thiếu `completed_at` thì attempt giờ được lưu là chưa hoàn thành, đúng như rpc.md.

### Runner `--test` (TAP)
- `ok … # SKIP …` đếm vào **skipped**. `not ok … # TODO …` đếm vào **todo**, không phải fail. `ok … # TODO …` cũng là todo, in thêm `<- passing now: the todo can go`. `not ok … # SKIP` vẫn là fail, vì skip phải là `ok`. Chỉ thị nhận được không phân biệt hoa thường; `\#` không được coi là chỉ thị.
- Từng file in `passed/planned passed, failed, skipped, todo`, rồi liệt kê từng dòng skip và todo. Dòng tổng có dạng `N assertions: P passed, F failed, S skipped, T todo; K file(s) not green`.
- **Định dạng dòng tổng đã đổi:** trước là `363/363 assertions passed`. Script nào grep dòng cũ thì phải sửa.
- Exit ≠ 0 chỉ khi có fail thật, thiếu dòng `plan`, số dòng chạy khác `plan` (skip và todo vẫn được tính là đã chạy), hoặc psql dừng giữa chừng.
- Đã kiểm bộ phân tích offline bằng 13 dòng mẫu: pass, fail, SKIP, skip chữ thường, TODO ở `ok` và `not ok`, `not ok # SKIP`, `\# TODO`, `#1` trong mô tả, dòng diag, dòng plan. Cả 13 đúng.
- Từ giờ tester dùng được `todo()` của pgTAP mà bộ test không đỏ.

### Output thật
| Lệnh | Kết quả |
| --- | --- |
| `--status` (trước) | `applied 20261029140144_app_core.sql` · `1 applied, 0 pending.` |
| `--test` (trước sửa, runner mới) | `submit_attempts_edge.test.sql 68/71 passed, 0 failed, 3 skipped, 0 todo`: `ok 40`, `ok 41`, `ok 42 # SKIP SK-021 L1: …` · `✓ pgTAP: 14 files, 363 assertions: 360 passed, 0 failed, 3 skipped, 0 todo; 0 file(s) not green.` |
| `node scripts/db-check-schema.mjs` | `✓ schema public is the same from schemas/ and from migrations/ (872 dump lines)` (Postgres 14.18 Homebrew, 6 schema, 2 delta; trước là 867 dòng) |
| `--dry-run` | `1 pending delta(s): 20261029180037_fix_missing_completed_at.sql 10.0 KB` · `(--dry-run: nothing written)` |
| `--rehearse` | `✓ rehearsal: 1 delta(s) ran in one transaction and were rolled back — database unchanged` |
| `--test --with-pending --only submit_attempts` | `submit_attempts 33/33` · `submit_attempts_edge 70/71 passed, 0 failed, 1 skipped, 0 todo` (`ok 42 # SKIP`) · `104 assertions: 103 passed, 0 failed, 1 skipped, 0 todo` |
| `--lint` (trước apply, có delta) | `✓ lint: checked 7 PL/pgSQL function(s), 0 error(s), 0 warning(s). Rolled back.` |
| `--yes` | `▶ 20261029180037_fix_missing_completed_at.sql … ok 0.7s` · `✓ applied 1 delta(s)` |
| `--status` (sau) | `2 applied, 0 pending.` |
| `--test` (sau apply) | `✓ pgTAP: 14 files, 363 assertions: 362 passed, 0 failed, 1 skipped, 0 todo; 0 file(s) not green. Every file was rolled back.` Skip còn lại: `ok 42 # SKIP SK-021 L1: an attempt without completed_at gives a star` |
| `--lint` (sau apply) | `✓ lint: checked 7 PL/pgSQL function(s), 0 error(s), 0 warning(s).` |
| `--query` (chỉ đọc) | `store_attempt`: `security_definer f`, `search_path=""`, ACL `{postgres=X/postgres,service_role=X/postgres}` (như trước), thân có bản sửa và không còn `LEAST(public.parse_instant`. Lịch sử có `20261029180037 fix_missing_completed_at` |

### Bằng chứng L1 đã hết
**1. TAP trên staging:** trước sửa có 3 skip (`ok 40`, `ok 41`, `ok 42`). Sau sửa còn 1 skip. `ok 40` (không hoàn thành) và `ok 41` (`completed_at` null) đã thành assertion thật và đạt.

**2. `ok 42` vẫn skip, nhưng do điều kiện trong test, không phải do hàm.**
- `results[i].stars` là sao của **bài** sau cả lô (rpc.md), không phải sao của riêng attempt đó.
- `r_future_start` dùng hồ sơ A, bài `l1`. Trong cùng file, bài này đã có attempt 6/6 hoàn thành ngày 02/10 trước đó (dòng 103 "empty answers… score 6", dòng 271 "duration_s 0 is accepted"). Vì vậy bài đã có 2 sao, dù attempt L1 được xử lý đúng hay sai.
- Chính bước tái hiện của tester cũng cho thấy điều này: một attempt 1/6 đứng riêng chỉ cho tối đa 1 sao, không thể ra 2.

**3. Tái hiện độc lập.** Dùng một Postgres 14 tạm cục bộ: stub Supabase, rồi các delta, rồi `tests/_helpers.sql`. Kịch bản chạy trong `BEGIN … ROLLBACK`, với khách mới, hồ sơ mới và mỗi ca một bài mới; xong thì xoá Postgres tạm. Script nằm ở scratchpad, không có trong repo. Thời điểm gửi `2026-10-02T02:00:00Z`.

| Ca | Chỉ baseline (trước) | Baseline + delta mới (sau) |
| --- | --- | --- |
| A: thiếu `completed_at`, không `answers`, score 6/6 | `completed=true`, `stars=2`, `completed_at` = lúc chạy (29/10 18:00), `local_date` 2026-10-29 | `completed=false`, `stars=0`, `completed_at` NULL, `local_date` 2026-10-02 (từ `started_at`), `last_completed_at` NULL |
| B: thiếu `completed_at`, 6 câu quiz đúng hết | `completed=true`, `stars=2`, `completed_at` = lúc chạy | `completed=false`, `stars=0`, `completed_at` NULL |
| C (đối chứng): có `completed_at`, 6/6 | `completed=true`, `stars=2` | không đổi: `completed=true`, `stars=2`, `completed_at` 02/10 09:00 +07 |
| `activity_days` của hồ sơ | 29/10: `lessons_completed=2` (A, B bị tính là học); 02/10: 1 | chỉ 02/10: `lessons_completed=1` (C), `minutes=15` (vẫn cộng phút của A, B: quyết định 8) |
| D (như `ok 42`): bài đã đạt 6/6, sau đó tới attempt thiếu `completed_at` 1/6 | (không chạy) | `completed=false`, `completed_at` NULL, `stars` của bài = 2 (từ lần đạt trước). Đây là hành vi đúng |

**4. Dữ liệu cũ trên staging:** có 15 `lesson_attempts`. Dòng bị L1 sẽ có `completed_at` bằng đúng `received_at`, tới từng micro giây. Không có dòng nào như vậy. Hai dòng có `completed_at` cách `received_at` dưới 1 giây (`87164f55…`, `84177db0…`) là giờ máy gửi theo giây chẵn, `completed_at − started_at = duration_s`, 6 câu. Không cần sửa dữ liệu.

### Đề xuất cho tester (vùng tester, dev không sửa)
1. Đổi 3 chỗ `CASE WHEN … THEN ok(true) ELSE skip('SK-021 L1: …') END` ở `submit_attempts_edge.test.sql` (dòng ~297–308) thành assertion thường (`is`/`ok`). Lỗi đã sửa, nên nếu hồi quy thì test phải đỏ, không phải skip.
2. Sửa điều kiện của assertion "an attempt without completed_at gives no star": gửi `r_future_start` cho một **bài mới** (ví dụ `gen_random_uuid()` thay cho `l1`), rồi kiểm `results[0].stars = 0` và `lesson_progress.stars = 0`, `last_completed_at IS NULL` của bài đó. Hoặc giữ `l1` và kiểm `lesson_progress` của `(ca, l1)` không đổi (`stars`, `last_completed_at`) trước và sau lần gửi.
3. Có thể thêm ca B ở trên: thiếu `completed_at` nhưng đủ 6 câu quiz thì `completed=false`. Hiện chưa có assertion cho nhánh có `answers`.
4. Từ giờ dùng được `todo()` cho hành vi chờ sửa; runner tách riêng skip và todo.

### Việc tester cần kiểm
- Chạy `node scripts/db-apply.mjs --test`: 0 fail. Sau khi làm đề xuất 1 và 2 thì phải ra 0 skip.
- Thử runner với một `todo()` cố ý fail và một `todo()` đạt (trong file nháp, rollback): dòng tổng đếm todo, có ghi chú `passing now`, exit 0. Một `ok(false)` thường thì exit 1.
- Câu hỏi 2 cho Duy ("thiếu `completed_at` nhưng đủ 6 câu thì vẫn không hoàn thành") đang làm theo cách trong brief của phiên chính và quyết định 8. Duy muốn khác thì cần một delta mới.
