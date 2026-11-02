# SK-022 · App iOS nối Supabase: khách ẩn danh, đẩy hồ sơ, hàng đợi lần làm bài, chuỗi ngày

Trạng thái: review · Ngày: 2026-10-28 · Phụ trách: ios-dev · Tester: tester
Nguồn: docs/ios-test-build.md mốc 3 việc S3, S4 và phần offline của T2; technical-plan.md B4.4 (chuỗi ngày), B5.1 (`local_date` theo múi giờ hồ sơ), B7.3 (`supabase-swift`, Keychain), B7.7 (đồng bộ và offline), B10 (`signInAnonymously`); SK-021 (bảng, RPC); SK-003 (vector `streak`, `local-date`); `.claude/agents/ios-dev.md` mục "Riêng tư" (`Config/Local.xcconfig`)

## Mục tiêu
App bản thử đăng nhập khách ẩn danh, đẩy hồ sơ trên máy lên server lần đầu và gửi kết quả làm bài qua hàng đợi chịu được mất mạng. Phần thưởng hiện ngay theo engine trên máy; server chốt sau.

## Phạm vi
- **S3 · nối Supabase:**
  - thêm `supabase-swift` (Swift Package; Duy đã cho phép ở ios-test-build mục 5) vào module mới `Sync` (hoặc `Account`) trong SKKit;
  - URL và publishable key đọc từ `Config/Local.xcconfig` (gitignore) qua Info.plist; có `Config/Local.example.xcconfig`. Không có `service_role` hay secret nào trong app;
  - lần mở đầu: `signInAnonymously()`, session lưu trong Keychain; cài lại app vẫn giữ session (B7.7);
  - hồ sơ trên máy (SK-011) chưa có trên server thì gọi `create_child_profile` một lần, lưu `id` server trả. `profile_limit` thì báo log, app vẫn chạy bằng hồ sơ trên máy;
  - **hàng đợi attempt:** xong bài thì ghi lên máy trước (SK-012 đã lưu lịch sử), rồi gửi `submit_attempts` khi có mạng; thử lại có backoff mũ; gửi lại an toàn vì idempotent theo `id`. Hàng đợi lưu file JSON trong `Application Support` (chưa GRDB, như SK-011);
  - server trả sao hay XP khác bản tính trên máy thì cập nhật lặng lẽ, không thu hồi hiệu ứng đã chạy (B7.7);
  - `get_home` khi mở Trang chủ để lấy sao và bài tiếp theo. Mất mạng thì dùng dữ liệu trên máy.
- **S4 · chuỗi ngày và ngày địa phương:** `computeStreak`, `localDate` trong `LessonEngine`, chạy vector `streak.json` (18 case) và `local-date.json` (13 case). Trang chủ hiện chuỗi ngày tính trên máy, server chốt qua `get_home`. Phần này không cần Supabase, làm sớm được sau SK-010.
- `PrivacyInfo.xcprivacy` cập nhật: API mới cần khai, và khai dữ liệu gửi lên server (ID người dùng ẩn danh, tiến độ học, không dùng để theo dõi).

## Ngoài phạm vi
- Đăng ký phụ huynh, liên kết danh tính, `merge-guest`, Premium, hồ sơ thứ 2.
- Kéo tiến độ về máy mới. Analytics.
- GRDB: thêm khi vào sprint, cần Duy duyệt thư viện.

## Tiêu chí nghiệm thu
- [ ] Không có URL hay key trong git: `git grep -n "supabase.co"` chỉ ra file mẫu; `git check-ignore apps/ios/Config/Local.xcconfig` in ra đường dẫn.
- [ ] Cài mới trên simulator, có mạng → tạo hồ sơ → trên Supabase staging (Duy hoặc tester xem bằng SQL): 1 user ẩn danh, 1 dòng `child_profiles` có `voice_mode` và `timezone` đúng.
- [ ] Chơi xong bài 1 → 1 dòng `lesson_attempts` đúng `id` của máy; `lesson_progress.stars` khớp số sao màn Thưởng.
- [ ] **Offline rồi online (T2):** tắt mạng của Mac (hoặc Network Link Conditioner 100% loss) → chơi xong bài 1 → màn Thưởng hiện bình thường → bật mạng, mở lại app → attempt lên server đúng 1 dòng. Ép gửi lại cùng attempt 3 lần (nút debug hoặc test) → vẫn 1 dòng.
- [ ] Xoá app rồi cài lại trên cùng simulator → vẫn là user ẩn danh cũ (session trong Keychain), không tạo hồ sơ thứ 2 trên server.
- [ ] `LessonEngineTests`: `streak` 18/18 và `local-date` 13/13 pass, cộng 71/71 của SK-010. Dán log.
- [ ] Unit test hàng đợi với transport giả: lỗi mạng → thử lại với backoff; server trả `success: false` → giữ trong hàng đợi và ghi log; thành công → xoá khỏi hàng đợi.
- [ ] `xcodebuild test` xanh trên iPhone 16 và iPad Pro 11-inch (M4).
- [ ] Không sửa file ngoài `apps/ios/` (trừ ghi chú trong ticket). Không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- SK-021 đã được Duy chạy trên staging. Duy gửi URL + publishable key (S1).
  - **29/10:** Duy đã tạo project staging (tạo lại lần hai để đổi vùng, vì Supabase không đổi vùng được sau khi tạo) và gửi URL + publishable key. Phiên chính lưu vào `apps/ios/Config/Local.xcconfig` (gitignore, đã kiểm `git check-ignore`) với hai biến `SK_SUPABASE_URL` (URL viết dạng `https:/$()/…` vì `//` là comment trong xcconfig) và `SK_SUPABASE_PUBLISHABLE_KEY`. Không ghi URL hay key vào file nào trong git.
  - **Anonymous sign-ins chưa bật** lúc 29/10 (`GET /auth/v1/settings` trả `anonymous_users: false`). Duy bật ở Authentication → Sign In / Providers → Allow anonymous sign-ins.
  - Migration SK-021 chưa chạy trên staging.
- SK-011 (hồ sơ trên máy), SK-012 (lịch sử làm bài), SK-010 (engine).
- Phần S4 chỉ cần SK-010.

**Quyết định đã ghi** (PM đề xuất 28/10)
1. Hàng đợi lưu file JSON, chưa thêm GRDB, vì danh sách tải đã duyệt (mục 5) chỉ có `supabase-swift`.
2. App không gửi `local_date`; server tính từ `completed_at` và `timezone` của hồ sơ (B5.1). App chỉ tính để hiện tạm.

**Câu hỏi còn mở**
- "6 ngày liên tiếp" trên Trang chủ đếm số ngày có học (`studied_days`) hay tính cả ngày nghỉ được tha? SK-003 D5 đang chờ Duy. Bản thử hiện `studied_days`.

## Kết quả (ios-dev)

29/10/2026 · Xcode 16.3, Swift 6.1 (strict concurrency `complete`), simulator iOS 18.4, Supabase staging (SK-021 đã apply). Chưa commit. Log, ảnh: `SP/` = `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-022/`. Không có URL hay key nào trong ticket, log của app hay test.

### Đã làm
- **S4 · `LessonEngine`:**
  - `computeStreak(studiedDates:today:rules:)` và `StreakRules` (`rest_days_per_week`) theo SK-003 D5, cùng luật với `compute_streak` SQL; `localDate(at:timeZone:)` dùng cơ sở dữ liệu múi giờ của nền tảng;
  - harness vector thêm suite `streak` và `local-date`. `LessonSession` tính `local_date` qua hàm này; `LessonRules` có thêm `streak`.
- **Module `Sync` (SKKit, mới):**
  - `supabase-swift` 2.55.4 (ghim `exact`; chỉ sản phẩm `Auth` và `PostgREST`); phiên bản gói phụ thuộc ghim ở `apps/ios/Package.resolved`, `bootstrap.sh` chép vào project;
  - `SupabaseTransport`:
    - `signInAnonymously`, session trong Keychain (service `vn.sciencekids.auth`);
    - 3 RPC qua PostgREST, kèm access token của session;
    - `SELECT child_profiles` khi gặp `profile_limit`;
    - mỗi request một `URLSession` ephemeral, xem quyết định 6;
  - `SyncEngine`:
    - đăng nhập khách → `create_child_profile` một lần (`p_id` = id hồ sơ trên máy);
    - hàng đợi `sync/queue.json` gửi tối đa 50 attempt mỗi lần, backoff mũ 15 s → 15 phút;
    - `get_home`;
    - `onSettled` trả sao server chốt;
  - `SyncStore` (`state.json`, `queue.json`, file hỏng thì giữ bản `.corrupt-`), `SyncTransport` (protocol; test dùng server giả).
- **App:**
  - Info.plist nhận `SKSupabaseURL`, `SKSupabasePublishableKey` từ `Config/Local.xcconfig`; `Base.xcconfig` để trống; `Local.xcconfig.example` có hướng dẫn và giá trị giả;
  - `AppModel` đồng bộ sau khi mở nội dung, sau khi tạo hồ sơ, ngay khi xong bài, khi app vào foreground, khi có mạng lại (`NWPathMonitor`) và theo backoff;
  - hàng đợi luôn dựng lại từ `lessons/history.json`;
  - sao server chốt được ghi lặng lẽ vào lịch sử (`AttemptStore.updateStars`);
  - Trang chủ hiện chuỗi ngày và sao (`HomeProgress`).
  - Debug: `-SKSyncOff`, `-SKSyncProbe` (phần tử ẩn `debug.sync`, id cắt 8 ký tự), `-SKSyncUnreachable`, `-SKResendLastAttempt <n>`. App làm host cho unit test thì tự tắt đồng bộ.
  - UI test cũ chạy với `-SKSyncOff YES` để không tạo khách trên staging.
- **Hai lỗi tester gộp vào** (ghi chú đã thêm ở SK-011, SK-012):
  - `child_profile.json` hỏng → đổi tên thành `.corrupt-<giờ UTC>` trước khi ghi mới; lịch sử bài chỉ có một id bé thì hồ sơ mới giữ id đó, attempt không mồ côi;
  - `history.json` hỏng → đổi tên `.corrupt-`, không bị `append` ghi đè (L2).
- `PrivacyInfo.xcprivacy`:
  - khai 4 loại dữ liệu gửi server: User ID, Name (tên gọi của bé), Product Interaction (kết quả bài), Other (lớp, avatar, chế độ, múi giờ);
  - tất cả đều gắn với tài khoản, không theo dõi, chỉ để app chạy;
  - không có API cần khai lý do (đã quét mã nguồn supabase-swift `Auth`, `PostgREST`, `Helpers` và các gói phụ thuộc).

**File chính** (trong `apps/ios/`):
- Mới:
  - `Packages/SKKit/Sources/Sync/{SyncModels,SyncTransport,SupabaseTransport,SyncStore,SyncEngine,Sync}.swift`
  - `Packages/SKKit/Sources/LessonEngine/Streak.swift`, `Packages/SKKit/Sources/Profiles/CorruptFile.swift`
  - `ScienceKids/Sync/AppSync.swift`, `ScienceKids/Debug/SyncProbe.swift`
  - `Package.resolved`
  - test: `Packages/SKKit/Tests/SyncTests/SyncTests.swift`, `Packages/SKKit/Tests/LessonEngineTests/StreakTests.swift`, `ScienceKidsTests/SyncAppTests.swift`, `ScienceKidsUITests/SyncUITests.swift`
- Sửa:
  - `Packages/SKKit/Package.swift`, `project.yml`, `bootstrap.sh`, `README.md`
  - `Config/{Base.xcconfig,Local.xcconfig.example}`, `ScienceKids/Info.plist`, `ScienceKids/Resources/PrivacyInfo.xcprivacy`
  - `LessonEngine/LocalDate.swift`, `LessonPlayer/{AttemptStore,LessonRules,LessonSession}.swift`, `Profiles/ProfileStore.swift`
  - `ScienceKids/App/{AppModel,LaunchOptions,ScienceKidsApp}.swift`, `ScienceKids/Home/{HomeScreen,MainFlow}.swift`
  - test: `LessonEngineTests/{VectorTests,VectorHarness}.swift`, `LessonPlayerTests/LessonSessionTests.swift`, `ProfilesTests/ProfilesTests.swift`, `ScienceKidsTests/InfoPlistTests.swift`, 4 file UI test cũ (thêm `-SKSyncOff YES`)

### Quyết định đã ghi (ios-dev)
1. **`p_id` = id hồ sơ trên máy** (theo ghi chú dev ở SK-021): id server trùng id máy, attempt gửi nguyên `child_id`, gọi lại khi mất phản hồi vẫn an toàn.
2. **`profile_limit`** (xoá app cài lại, Keychain còn giữ khách, máy tạo hồ sơ mới):
   - app `SELECT child_profiles`; có đúng một hồ sơ đang hoạt động thì dùng hồ sơ đó (`adopted`), attempt gửi theo id server;
   - không có hồ sơ nào hoặc có nhiều hơn một thì ghi log, app chạy bằng hồ sơ trên máy và attempt nằm chờ (`limit`), như ticket ghi.
3. **Hàng đợi theo hợp đồng SK-021:**
   - gọi được và `success = true`: bỏ khỏi hàng đợi các attempt `inserted` và `duplicate`; bỏ cả `rejected` (có log, giữ mã lỗi trong `state.json`, không xếp lại);
   - `success = false` hoặc lỗi mạng: giữ cả lô, backoff mũ;
   - attempt chờ hồ sơ lên server cũng chờ theo backoff, không thử lại mỗi giây.
4. **Hàng đợi dựng từ lịch sử** mỗi lần đồng bộ, bỏ qua attempt đã được server nhận: app tắt giữa lúc ghi lịch sử và lúc xếp hàng thì attempt vẫn không mất.
5. **Trang chủ:** hàng đợi trống và `get_home.today` trùng "hôm nay" của bé thì hiện số của server (`total_stars`, `streak.studied_days`); nếu không, hiện số tính trên máy. Chuỗi ngày đếm `studied_days` (mặc định tạm).
6. **Mạng trên simulator:**
   - với `URLSession.shared`, từ lần mở app thứ hai trở đi mọi request đi thẳng HTTP/3 (QUIC), vì session đã lưu `Alt-Svc` của server xuống đĩa. QUIC trên simulator rớt giữa chừng (`-1005`, log hệ thống ghi "path … unavailable");
   - curl cùng lúc vẫn chạy bình thường;
   - cách xử lý: mỗi RPC chạy trên một `URLSession` ephemeral, nên bắt đầu bằng HTTP/2 qua TCP và không lưu cache hay cookie chứa dữ liệu của bé xuống đĩa. Thêm 1 lần thử lại sau 0,5 s khi gặp `-1005`; ba RPC đều gửi lại an toàn;
   - sau khi sửa, cả 4 lượt UI test đồng bộ đều xanh, không còn `-1005`.
7. **T2 trên simulator:** tôi không tắt mạng của Mac (thay đổi cài đặt hệ thống). Thay vào đó dùng cờ `-SKSyncUnreachable YES`: thay địa chỉ server bằng `https://sync-unreachable.invalid`. Request thật qua `URLSession` lỗi DNS (`-1003`), giống máy mất mạng; Keychain và hàng đợi vẫn là thật.
8. `install_id` là UUID trong `sync/state.json`: mất khi xoá app, đúng nghĩa "một lần cài". `client_created_at` = `completed_at` của attempt.

### Tiêu chí nghiệm thu

| # | Tiêu chí | Kết quả | Bằng chứng |
| --- | --- | --- | --- |
| 1 | Không URL/key trong git; `check-ignore` | pass | `git grep -n --untracked "supabase\.co"` (apps/ chưa track nên phải thêm `--untracked`): trong `apps/ios` chỉ có `Config/Local.xcconfig.example` (dòng giá trị giả `<project-ref>`). `git check-ignore apps/ios/Config/Local.xcconfig` in ra đúng đường dẫn. Quét `service_role\|sb_secret_\|eyJhbGciOi` trong `apps/ios`: chỉ có comment cảnh báo. Key trong `Local.xcconfig` có tiền tố `sb_publishable_` (đã kiểm mà không in ra) |
| 2 | Cài mới, có mạng → tạo hồ sơ → staging: 1 user ẩn danh, 1 `child_profiles` đúng `voice_mode`, `timezone` | pass (qua API của app); cần chạy SQL để xác nhận | iPhone 16: đã `simctl uninstall` app và `simctl keychain reset` rồi chạy `SyncUITests.testProfileAndLessonReachTheServer`. Probe: `user a3edb1eb, profile linked sameId true`. Log: `signed in as a new guest`, `profile on the server (created)`. `get_home` của chính app trả `child` với voice `en`, tz `Asia/Ho_Chi_Minh`. SQL ở dưới |
| 3 | Chơi xong bài 1 → 1 `lesson_attempts` đúng `id`; `lesson_progress.stars` = sao màn Thưởng | pass (qua API của app); cần chạy SQL để xác nhận | Thưởng: "Được 2 trên 3 sao". `submit_attempts` trả `inserted`, `stars 2`. `get_home`: `total_stars 2`, `lessons[0].stars 2`, `attempts_count 1`, `streak.studied_days 1`; Trang chủ hiện 🔥1 ⭐2 lấy từ server. `state.json`: `acknowledged {83572579-c6a4-4788-8707-b99165608913: 2}` = id trong `history.json` |
| 4 | Offline → chơi xong → Thưởng hiện → online, mở lại → lên đúng 1 dòng; gửi lại 3 lần → vẫn 1 dòng | pass (offline giả bằng địa chỉ không tồn tại, quyết định 7) | `testOfflineThenOnlineThenResend` trên iPhone 16 và iPad Pro 11:<br>• offline: Thưởng hiện bình thường; probe `waiting: … URLError -1003, queued 1, shown from device`;<br>• mở lại có mạng: `queued 0, synced, attempts +1`;<br>• mở lại với `-SKResendLastAttempt 3`: 3 lần `submit_attempts`, log `0 new, 1 already stored`, `attempts_count` không đổi (iPhone 5 → 5, iPad 1 → 1).<br>Unit: `resendingIsSafe`, `offlineFirstLaunchCatchesUp`, `queueSurvivesARelaunch`. Thêm: thử bằng curl với một khách mới: gửi cùng attempt 3 lần → `inserted`, `duplicate`, `duplicate`; `attempts_count 1` |
| 5 | Xoá app cài lại → vẫn user ẩn danh cũ, không tạo hồ sơ thứ 2 | pass | iPhone 16: `simctl uninstall`, cài lại, tạo hồ sơ mới. Probe vẫn `user a3edb1eb`; `create_child_profile` → `profile_limit` → `profile adopted` (dùng hồ sơ cũ `f63382c5…`); log `profile_limit: using the guest's existing server profile`. Không có hồ sơ thứ 2; xác nhận bằng SQL 1 |
| 6 | `streak` 18/18, `local-date` 13/13, cộng 71/71 | pass | `vectors streak: 18/18 pass · confirmed 1/1 · proposed 17/17`; `vectors local-date: 13/13 pass · confirmed 13/13 · proposed 0/0`; item-scoring 33/33 + lesson-score 11/11 + stars 27/27 = 71/71; `vectors all: 141/141 pass · confirmed 84/84 · proposed 57/57` (cả build-tray 39). Đúng ngay lần chạy đầu |
| 7 | Unit test hàng đợi với transport giả | pass | `SyncEngineTests`:<br>• `networkErrorRetriesWithBackoff`: offline → `failures 1`, thử lại sau 15 s; chưa hết backoff thì không gửi; lỗi lần 2 → 30 s; online → hết hàng đợi;<br>• `successFalseKeepsTheAttempt`: `rules_missing` → giữ, `last_error` ghi mã, có log;<br>• `successEmptiesTheQueue`: xoá khỏi hàng đợi, trả sao chốt, lần sau không xếp lại;<br>• `rejectedAttemptLeavesTheQueue`, `profileLimitAdoptsTheExistingProfile`, `profileLimitKeepsAttemptsWaiting`, `sendsInBatchesOfFifty` (50+50+20), `newGuestLinksAgain`, `noTransportIsOff`.<br>`SyncPiecesTests`: backoff 15…900 s, file hỏng giữ lại, cấu hình từ Info.plist, khoá JSON khớp RPC, decode phản hồi đúng dạng SK-021 |
| 8 | `xcodebuild test` xanh trên iPhone 16 và iPad Pro 11 | pass | Log dưới |
| 9 | Không sửa ngoài `apps/ios/` (trừ ticket); không commit | pass | Ngoài `apps/ios/` chỉ ghi ticket này và mục "Đã sửa ở SK-022" cuối SK-011, SK-012. Không đọc `database/.env.local`, không chạy psql, không sửa `database/`, `scripts/`, `docs/backlog/README.md`. Không commit |

**Lệnh và kết quả** (từ `apps/ios`):
```
xcodebuild test -project ScienceKids.xcodeproj -scheme ScienceKids -destination 'platform=iOS Simulator,name=iPhone 16' -derivedDataPath "$DD" -skip-testing:ScienceKidsUITests
xcodebuild test-without-building … -only-testing:ScienceKidsUITests                       # iPhone 16: cả target UI
xcodebuild test-without-building … -only-testing:ScienceKidsUITests/LessonUITests -only-testing:ScienceKidsUITests/SyncUITests   # iPad Pro 11
```
Unit, lần chạy cuối, giống nhau ở iPhone 16 và iPad Pro 11 (`SP/unit-final-iphone16.log`, `SP/unit-final-ipadpro11.log`), 226 test mỗi máy, không có warning Swift trong code của repo:
```
✔ Test run with 51 tests passed   ScienceKidsTests (44 trước đây)
✔ Test run with 35 tests passed   DesignSystemTests
✔ Test run with 20 tests passed   ContentModelTests
✔ Test run with 19 tests passed   LessonEngineTests (14 trước đây; 2 suite vector mới chạy trong test có tham số)
✔ Test run with 18 tests passed   ContentKitTests
✔ Test run with 31 tests passed   LessonPlayerTests (29 trước đây)
✔ Test run with 13 tests passed   AudioKitTests
✔ Test run with 21 tests passed   ProfilesTests (20 trước đây)
✔ Test run with 18 tests passed   SyncTests (mới)
** TEST SUCCEEDED **
```
UI:
```
iPhone 16 cả target UI:  Executed 33 tests, with 5 tests skipped and 0 failures   (SP/ui-final-iphone16.log)
   Audio 5/5 · Gallery 7 (2 skip) · Lesson 9 (2 skip) · Onboarding 10 (1 skip) · Sync 2/2
iPad Pro 11 Lesson + Sync: Executed 11 tests, with 2 tests skipped and 0 failures   (SP/ui-final-ipadpro11.log)
   luồng vàng: score '6/6, câu đúng', stars 'Được 2 trên 3 sao', xp '+90, XP'
```
Test skip đều có lý do: chỉ chạy khi bật Reduce Motion hệ thống, hoặc khi có thư mục ảnh.

**Ảnh:** `SP/shots/iphone-16-04-home-synced.png`, `SP/shots/ipad-pro-11-04-home-synced.png`: Trang chủ có 🔥1 ⭐2 lấy từ server. Ngoài hai chip này không màn nào đổi giao diện.

### Câu SQL để kiểm staging (phiên chính hoặc dev chạy)
Dữ liệu thử phiên này tạo trên staging có 3 khách:
- iPhone 16: user `a3edb1eb-7f41-40ae-bb42-7ec875f93379`, hồ sơ `f63382c5-778b-45f8-aae0-c3856a29cc06`, 6 attempt, gồm `83572579-c6a4-4788-8707-b99165608913`;
- iPad Pro 11: user `3d2258c3-e914-4d43-8b24-f3ec0c35a8df`, hồ sơ `3686aaf8-adf5-45c1-8e71-02aa570d4cc0`, 2 attempt;
- curl (thử RPC bằng tay): user bắt đầu `207ba712`, hồ sơ bắt đầu `5f11db45`, 1 attempt.

```sql
-- 1. Mỗi khách đúng 1 hồ sơ, là khách ẩn danh (mong đợi 3 dòng, profiles = 1)
select u.id, u.is_anonymous, u.created_at, count(c.id) as profiles
from auth.users u left join public.child_profiles c on c.owner_id = u.id
group by u.id, u.is_anonymous, u.created_at order by u.created_at;

-- 2. Hồ sơ của khách iPhone 16: voice_mode 'en', timezone 'Asia/Ho_Chi_Minh', grade 3, discoverer
select id, owner_id, display_name, avatar, grade, age_group, language_mode, voice_mode, timezone, archived_at
from public.child_profiles where owner_id = 'a3edb1eb-7f41-40ae-bb42-7ec875f93379';

-- 3. Attempt: mỗi id đúng 1 dòng (mong đợi 0 dòng), và attempt đầu tiên của iPhone 16
select id, count(*) from public.lesson_attempts group by id having count(*) > 1;
select id, child_id, lesson_id, content_version, score, max_score, xp, duration_s, local_date, completed_at, install_id, received_at
from public.lesson_attempts where child_id = 'f63382c5-778b-45f8-aae0-c3856a29cc06' order by completed_at;  -- mong đợi 6 dòng
select count(*) from public.quiz_answers where attempt_id = '83572579-c6a4-4788-8707-b99165608913';             -- mong đợi 6

-- 4. Tiến độ: sao = 2 như màn Thưởng, attempts_count = số dòng ở câu 3
select child_id, lesson_id, stars, best_score, attempts_count, first_pass_at, mastered_at, last_completed_at
from public.lesson_progress where child_id in ('f63382c5-778b-45f8-aae0-c3856a29cc06', '3686aaf8-adf5-45c1-8e71-02aa570d4cc0');

-- 5. Ngày học (activity_days)
select child_id, local_date, minutes, lessons_completed from public.activity_days order by child_id, local_date;
```
Đã kiểm qua API (không dùng SQL), với một khách thử tạo bằng curl và chỉ dùng publishable key cộng session của khách:
- RLS: `SELECT lesson_attempts` trả 1 dòng của chính khách; `SELECT child_profiles` trả 1 hồ sơ của chính khách;
- `get_home`: `total_stars 2`, `attempts_count [1]`, `streak.studied_days 1`;
- request chỉ có publishable key (không session): `child_profiles`, `lesson_attempts` và `get_home` đều trả 401 `42501` (permission denied).

Dọn dữ liệu thử: xoá 3 user ở Authentication → Users (xoá dây chuyền).

### Ghi chú cho người khác
- **dev (SK-021):**
  - chữ ký 3 RPC khớp dữ liệu app, không thấy lệch;
  - app gửi UUID chữ hoa (mặc định của Swift); server ép kiểu và `lower()` đúng;
  - `duration_s` vẫn là `completedAt − startedAt`, tính cả lúc tạm dừng, như dev đã ghi; app chưa đo được thời gian học thực;
  - câu khởi động chưa được gửi trong `answers` (`AttemptRecord` chỉ có câu quiz).
- **tester:**
  - chạy `SyncTests`, `SyncAppTests`, `-only-testing:ScienceKidsUITests/SyncUITests` (ghi dữ liệu lên staging; `xcrun simctl keychain <máy> reset` để có khách mới), rồi chạy SQL ở trên;
  - T2 với mạng thật: bật Network Link Conditioner 100% loss trên Mac hoặc máy thật, chơi xong bài, tắt chế độ đó, mở lại app;
  - xoá app cài lại trên máy thật (Keychain thật).
- **Duy:**
  - giới hạn đăng nhập ẩn danh mặc định 30 lần/giờ/IP; UI test đồng bộ chạy nhiều máy cùng lúc có thể chạm giới hạn này (SK-021 đã ghi);
  - Trang chủ vẫn ghi "0/5 bài · Đang học" sau khi xong bài 1, vì số bài xong chưa được nối (ngoài phạm vi ticket này).

### Câu hỏi cho Duy
1. *(mặc định tạm)* Chuỗi ngày hiện `studied_days`. Giữ hay tính cả ngày nghỉ được tha?
2. Xoá app cài lại, phụ huynh tạo hồ sơ mới, trong khi khách cũ đã có hồ sơ trên server: app đang dùng hồ sơ cũ trên server (tên, avatar, lớp ở server giữ như cũ, tiến độ cộng dồn). Giữ cách này, hay muốn hồ sơ mới thay hồ sơ cũ (cần RPC sửa hồ sơ, chưa có)?
3. Đồng bộ khi chưa có đồng ý của phụ huynh (B12, cần luật sư): bản thử đã gửi tên gọi của bé và tiến độ lên staging. Có cần màn đồng ý trước khi gửi ở beta không?

## Nghiệm thu (tester, 29/10)

Bản sao `snapshot-r3` (17:39 ngày 29/10), Xcode 16.3, iOS 18.4, **chỉ iPhone 16 Pro** (Duy giảm phạm vi 29/10: 1 lần, 1 máy). `SP/` = `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/`; log, ảnh, script trong `SP/tester-r3/`.

Kết luận: **đạt**. Mất mạng thật (qua proxy) cho đủ 6 ca đúng mong đợi, không mất và không nhân đôi dòng nào trên server. Không có lỗi chặn hay lỗi; có 3 góp ý nhẹ và 2 phần chưa kiểm.

### Cách dựng "mất mạng thật" (không đụng mạng của Mac)
- `SP/tester-r3/proxy.mjs`: reverse proxy Node nghe `127.0.0.1:18443`, chuyển tới `<staging-ref>.supabase.co` (đổi `Host`), bỏ `accept-encoding` để đọc được kết quả `submit_attempts`. Log (`proxy.log`, tách theo ca `proxy-case*.log`): giờ UTC, method, path (không query), status, mode, ms, và với `submit_attempts` chỉ có `success` và danh sách `status` (`inserted`/`duplicate`). Không ghi `Authorization`, `apikey`, body, token.
- Mode đọc từ file `SP/tester-r3/proxy.mode` (100 ms một lần): `pass` · `down` (đóng cổng, kết nối bị từ chối, `URLError -1004`) · `blackhole` (nhận kết nối, không trả lời) · `cut-after-store` (chuyển `submit_attempts` lên server, đợi server lưu, rồi `destroy` kết nối với app).
- Bản build riêng `SP/dd-tester-r3-proxy` với `Local.xcconfig` của **bản sao** đổi `SK_SUPABASE_URL` sang proxy (đã khôi phục sau khi build; `Local.xcconfig` của repo thật không đụng).
- **HTTP không dùng được:** `SyncConfig.init(info:)` (`Packages/SKKit/Sources/Sync/SyncTransport.swift:60`) chỉ nhận `url.scheme == "https"`, nên bản trỏ `http://127.0.0.1:18080` chạy với `sync off: no Supabase URL…` (test skip, log `sync off`). Không sửa code app. Chuyển sang **HTTPS cục bộ**: CA riêng (`SP/tester-r3/certs/`, hạn 30 ngày) cài vào Keychain simulator bằng `xcrun simctl keychain <UDID> add-root-cert`, proxy dùng cert lá có SAN `IP:127.0.0.1`. Không có ngoại lệ ATS nào (ATS không áp cho địa chỉ IP, và ở đây vẫn là HTTPS).
- Điều khiển app: UI test mới **chỉ ở bản sao**, `ScienceKidsUITests/ProxyUITests.swift` (6 ca, đổi mode bằng cách ghi file qua `TEST_RUNNER_SK_PROXY_MODE_FILE`) và `BadPackUITests.swift` (SK-016). Đề xuất giữ: xem "Đề xuất".
- Log app: `xcrun simctl spawn <UDID> log stream --predicate 'subsystem == "vn.sciencekids.app"'` → `applog-sync-only.log` (giờ **địa phương** UTC+7; log proxy là UTC, chênh 7 giờ).

### Đã chạy
```
xcodebuild test-without-building … -skip-testing:ScienceKidsUITests                    → unit-iphone.log (226 test, 0 lỗi; SyncTests 18, LessonEngine 19 gồm streak 18/18, local-date 13/13)
SP/tester-r3/runproxy.sh <ca>     (6 lần, mỗi ca 1 lần)                               → proxy-testCase*.xclog, proxy-case*.log
xcodebuild test-without-building … -only-testing:ScienceKidsUITests/SyncUITests         → syncui-iphone.log (trỏ thẳng staging)
```
Unit cũng chạy trên iPad Pro 13 trước khi luật đổi (`unit-ipad.log`, cùng kết quả); mọi thứ khác chỉ iPhone 16 Pro.

### Sáu ca mất mạng (proxy)

| # | Ca | Kết quả | Bằng chứng |
| --- | --- | --- | --- |
| 1 | `down` từ lần mở đầu (chưa có khách) | pass | Tạo hồ sơ, chơi hết bài 1 (49 s): Thưởng `Được 2 trên 3 sao`, Trang chủ hiện số từ máy. Probe: `waiting: sign in: offline: URLError -1004, queued 1, user -`. Bật `pass`, mở lại: proxy `POST /auth/v1/signup 200` → `create_child_profile 200` → `submit_attempts 200` → `get_home`; app log `signed in as a new guest`, `profile on the server (created)`, `submit_attempts: 1 new, 0 already stored, 0 rejected, 0 still queued`. Probe: `synced, queued 0, profile linked sameId true, attempts 1, stars 2`. SQL: 1 hồ sơ, 1 attempt cho user `92bc83c2` |
| 2 | `down` giữa bài (sau Khởi động) | pass | Thưởng bình thường (`Được 2 trên 3 sao`); probe `waiting: submit_attempts: offline: URLError -1004, queued 1`; bật `pass` + mở lại: `submit_attempts … results=[inserted]`, `attempts 1 → 2`. Dòng mới `de168407-…` |
| 3 | `cut-after-store` | pass | Proxy: `submit_attempts -> 200 server stored success=true results=[inserted]; CONNECTION CUT` rồi 0,8 s sau lần thử lại một lần của app (`-1005`): `… results=[duplicate]; CONNECTION CUT`. App: `URLError -1005, queued 1`. Bật `pass` + mở lại: `results=[duplicate]`; app log `submit_attempts: 0 new, 1 already stored, 0 rejected, 0 still queued`. SQL: attempt `c1d51648-…` đúng 1 dòng, 6 `quiz_answers` |
| 4 | `blackhole` | pass | Chơi xong bài khi mạng treo: Thưởng hiện, về Trang chủ bấm được (UI không treo). Sau khi xong bài: thử lúc `+0`, bỏ sau **~20 s** (`URLError -1001`, `request.timeoutInterval = 20` ở `SupabaseTransport.swift` fetch của PostgREST), thử lại `+37 s` (backoff 15 s), bỏ sau 20 s, thử lại `+86 s` (backoff 30 s), … đúng 15 s → 30 s → 60 s (cap 15 phút). Bật `pass` + mở lại: `inserted`, `attempts +1` |
| 5 | `-SKResendLastAttempt 3` | pass | Proxy: `results=[inserted]` rồi 3 lần `results=[duplicate]`; probe `attempts` không đổi (5 → 5). SQL: không có `id` nào trùng (xem dưới) |
| 6 | Mạng có lại khi app đang mở | pass, theo đúng ghi chú | Xem dưới |

**Ca 6.** `down` từ lúc xong bài (18:01:19): thử lại sau 15 s (18:01:35) và 30 s sau đó (18:02:07), đều `-1004`; lần kế dự kiến ~18:03:07. Bật `pass` lúc 18:02:18 (app vẫn mở): **không có request nào trong 34 s** (`NWPathMonitor` thấy mạng của máy vẫn "satisfied", nên không phát sự kiện "mạng trở lại"; đúng như dự đoán). Đưa app ra nền rồi `activate()` lúc 18:02:50: gửi xong sau **2,6 s** (`submit_attempts … results=[inserted]` 18:02:52.9). Hàng đợi vì vậy được gửi theo ba đường: mở lại app, quay lại foreground (đều `force`), hoặc hết backoff (chỉ khi app mở và chưa bị quá hạn). Phần "tự gửi khi `NWPathMonitor` thấy mạng có lại" **chỉ kiểm được trên máy thật bằng chế độ máy bay (SK-020)**; không kiểm ở đây.

### Chạy trên bản trỏ thẳng staging

| Mục | Kết quả | Bằng chứng |
| --- | --- | --- |
| `SyncUITests` (2 test) | pass | 148,98 s, 0 lỗi (`syncui-iphone.log`): `testProfileAndLessonReachTheServer` 66 s (`server stars = Thưởng stars`, Trang chủ lấy số từ server), `testOfflineThenOnlineThenResend` 83 s (offline `URLError -1003`; online: `queued 0`; gửi 3 lần: `attempts 7 → 7`) |
| `SyncTests` (unit) + `streak` 18/18, `local-date` 13/13 | pass | `unit-iphone.log`: SyncTests 18 test; LessonEngineTests 19 (gồm hai suite vector) |
| Tiêu chí 1: không có URL/key trong git | pass | `git grep -n --untracked "supabase\.co"` (trừ `docs`, `database`): chỉ `apps/ios/Config/Local.xcconfig.example:10` (`<project-ref>`) và `scripts/db-apply.mjs` (chú thích); `git check-ignore apps/ios/Config/Local.xcconfig` in đường dẫn. Quét `sb_publishable_[A-Za-z0-9_-]{20,}` và `eyJhbGciOi` ở `apps tools packages content docs`: chỉ `Local.xcconfig` (gitignore); hai file còn lại là mẫu `xxxx` và chính ticket này |
| Tiêu chí 5: xoá app cài lại → cùng khách | chưa kiểm bằng `simctl uninstall` | Không chạy thêm bộ nào ngoài luật 1 lần. Cơ chế tương đương đã thấy: mỗi ca `-SKResetProfile` xoá `Application Support` (hồ sơ mới trên máy, id khác), Keychain giữ khách: log `profile_limit: using the guest's existing server profile`, probe `profile adopted`, SQL vẫn 1 hồ sơ. Khác với cài lại thật ở chỗ cả `sync/` bị xoá |
| Tiêu chí 9: chỉ sửa trong `apps/ios/` | không kiểm được qua git | `apps/` chưa được git theo dõi |
| iPad Pro 11 / 13 | **chưa kiểm: Duy giảm phạm vi 29/10, 1 lần 1 máy** | Chỉ unit trên iPad Pro 13 (51/35/20/19/18/31/13/21/18 pass) |

### SQL chỉ đọc (`node scripts/db-apply.mjs --query …`, từ repo thật)
```
-- 1 khách của tôi, 1 hồ sơ đúng voice_mode/timezone, tiến độ khớp
0d985203-0e10-4b33-8ccf-84a2d5ea3cb1 | en | Asia/Ho_Chi_Minh | Minh | archived_at null | stars 2 | attempts_count 8 | best_score 6
-- 8 attempt, 8 id khác nhau (count(*)=8, count(distinct id)=8); trùng id toàn bảng: 0 dòng
-- mỗi attempt: score 6/6, xp 90, local_date 2026-10-29, 6 quiz_answers
cd972be5 (ca1) de168407 (ca2) c1d51648 (ca3: server nhận 2 POST, 1 dòng) b31ae05a (ca4) 601cf0c9 (ca5) 8a224e06 (ca6) 44a4626e, 446109d2 (SyncUITests)
```
Khớp: 6 attempt từ proxy (mỗi ca đúng 1) + 2 từ `SyncUITests` = 8; `lesson_progress.stars` 2 = số sao màn Thưởng.

### User id đã tạo trên staging (để Duy xoá)
- **`92bc83c2-26a9-45cd-9d83-94d4342e731b`** (khách ẩn danh, tạo 10:49:35 UTC; hồ sơ `0d985203-0e10-4b33-8ccf-84a2d5ea3cb1`, 8 attempt). Đây là khách duy nhất tôi tạo.
- Ba khách khác lúc 10:52 UTC (`d2a54be1…`, `370eeea0…`, `3185adae…`) không phải của tôi (có thể ios-dev đang chạy SK-013), cộng ba khách cũ của ios-dev (`a3edb1eb…`, `207ba712…`, `3d2258c3…`).
- Không dùng `simctl keychain reset`. Khoá session trong Keychain **không** tính theo host (bản proxy và bản trỏ thẳng staging dùng chung một khách `92bc83c2` trên cùng simulator): giả định ở đề bài "khách mới vì khoá tính theo host" là sai; chỉ ảnh hưởng cách tôi đếm khách, không phải lỗi.

### Lỗi
Không có.

### Góp ý (nhẹ)
- **G1** `SupabaseTransport.swift` `init`: fetch của **Auth** không đặt `timeoutInterval` (mặc định 60 s) trong khi RPC là 20 s. `blackhole` ngay lần mở đầu (chưa có khách, `signInAnonymously`) sẽ treo `running` tới 60 s; bài vừa xong trong lúc đó phải chờ (`rerun`). UI không bị ảnh hưởng (đồng bộ chạy nền) và Thưởng vẫn hiện, nhưng nên đặt cùng mức 20 s. **Chưa kiểm bằng proxy** vì cần khách mới (`simctl keychain reset`), ngoài hạn mức khách.
- **G2** Mở app khi mất mạng mà hàng đợi trống (ca 1, lúc mới mở): `sync waits: sign in: offline: URLError -1004` chỉ ghi một lần và không lên lịch thử lại (`scheduleRetry` chỉ chạy khi hàng đợi có việc). Khách và hồ sơ chỉ được tạo ở lần đồng bộ kế (xong bài, foreground, `NWPathMonitor` trên máy thật). Chấp nhận được vì mọi đường đó đều có; ghi để biết.
- **G3** `SyncConfig` từ chối `http` là đúng cho bản phát hành; nhưng nó khiến không thể trỏ app vào proxy/mock HTTP cục bộ. Nếu muốn test mất mạng bằng proxy dễ hơn: cho phép `http` với host `127.0.0.1`/`localhost` **chỉ trong `#if DEBUG`** (ios-dev quyết). Hiện tôi dùng HTTPS + CA cài vào simulator nên không cần.
- Lần thử lại một lần sau `-1005` (`SupabaseTransport.send`) làm server nhận `submit_attempts` hai lần khi mạng cắt sau khi lưu (ca 3: `inserted` rồi `duplicate`). Đúng thiết kế, an toàn nhờ idempotent; ghi lại vì người đọc log proxy sẽ thấy 2 request.

### Chưa kiểm
- Tự gửi khi `NWPathMonitor` thấy mạng có lại, chế độ máy bay thật: SK-020.
- `blackhole` hoặc `down` khi **chưa có session** và cần `signInAnonymously` treo: chỉ ca `down` (ca 1) kiểm được; `blackhole` ở lần mở đầu chưa kiểm (G1).
- Xoá app cài lại với Keychain thật: SK-020 (ngoài phạm vi đợt này).
- iPad: xem trên.

### Đề xuất cho ios-dev
- Giữ `ProxyUITests.swift` làm test hồi quy mất mạng (cần Node proxy và CA, không nên chạy trong CI mặc định): `SP/snapshot-r3/apps/ios/ScienceKidsUITests/ProxyUITests.swift`, kèm `SP/tester-r3/proxy.mjs`. Tôi đề xuất đưa vào `apps/ios/ScienceKidsUITests/` (bị skip khi không có `SK_PROXY_MODE_FILE`) và proxy vào `tools/` hoặc `apps/ios/scripts/`; ios-dev/dev quyết. Tôi không chép vào repo thật.
- `BadPackUITests.swift` (SK-016) cùng cách: gói hỏng cần sửa `.app` bằng tay trước khi chạy.
- G1: đặt `timeoutInterval = 20` cho request của Auth.
