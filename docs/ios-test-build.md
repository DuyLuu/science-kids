# Bản iOS chạy thử nhanh nhất

Ngày 28/10/2026 · Trạng thái: Duy duyệt 28/10, đã tách thành ticket SK-005 – SK-022 ([docs/backlog/README.md](backlog/README.md)) · **Sửa 31/10:** Duy ưu tiên giọng tiếng Việt trước mọi việc khác. Audio VI chuyển sang Làm ngay, thêm SK-023 – SK-025 (mục "Giọng tiếng Việt") · **Sửa 9/11:** Duy duyệt syllabus mới. App hiện đủ danh mục (45 chủ đề, 384 bài, từ `content/syllabus.json`), không khoá bài; gói trả phí tạm tắt nên bản test không có cổng trả phí, không nhãn Free. Thêm SK-030 (mục "Hiện đủ syllabus, không khoá") · Nguồn: technical-plan.md B4, B7, B7.10, B9, B10, B16

## Đích

Một bé 7–9 tuổi cầm iPhone hoặc iPad chơi trọn **bài 1 "Thức ăn cho ta những gì?"** (chủ đề Ăn uống lành mạnh): tạo hồ sơ → Trang chủ → Chủ đề → Khởi động → Học → Chơi (mâm cơm) → Quiz 6 câu → Thưởng (sao + thẻ rau muống). Bé nghe giọng theo lựa chọn lúc tạo hồ sơ: chỉ tiếng Anh, chỉ tiếng Việt, hoặc cả hai (tiếng Anh trước, tiếng Việt nối theo). Chữ tiếng Việt hiện bên dưới chữ tiếng Anh. Giọng tiếng Việt là VieNeu-TTS, giọng Kim Thanh (nữ miền Nam; Duy chốt 1/11, SK-023).

**Đích mở rộng (9/11, [SK-030](backlog/SK-030-full-syllabus-no-lock.md)).**
- Mở app thấy đủ syllabus của nhóm tuổi theo thứ tự Duy duyệt: Discoverer 17 chủ đề, 155 bài; xem được Explorer (12 chủ đề, 73 bài) và Scientist (16 chủ đề, 156 bài).
- Không bài nào khoá.
- Hai bài đã soạn chơi trọn được, cả hai thuộc *Ăn uống lành mạnh*, nay là chủ đề #9 của Discoverer:
  - "Thức ăn cho ta những gì?" ở ô bài 2;
  - "Mâm cơm cân bằng" ở ô bài 6.
- Bài khác hiện tên và "Chưa có nội dung".
- "Bài 1" trong kế hoạch này là file `01-thuc-an-cho-ta-nhung-gi.md`; trong danh mục 9/11 bài đó nằm ở ô bài 2.

## Cắt gì để nhanh

| Làm ngay | Để sau |
| --- | --- |
| Gói bài 1 nhúng sẵn trong app | Tải gói từ R2 / Supabase Storage |
| Hồ sơ lưu trên máy | Chế độ khách trên Supabase, đồng bộ tiến độ (mốc 3) |
| Audio EN bằng Kokoro; **audio VI bằng VieNeu-TTS giọng Kim Thanh** (Duy chốt 1/11) (Duy ưu tiên 31/10; trước đó nằm ở cột Để sau) | Audio VI cho các bài soạn sau (trước 9/11 ghi "bài 2–5"); nút nghe thứ tiếng kia (B4.1, chờ Duy ở SK-025) |
| 36 hình giữ chỗ do app vẽ (mảnh giấy màu nhóm + tên món) | Hình giấy cắt thật vẽ trên Claude Design |
| 9 màn: Welcome, Tạo hồ sơ, Trang chủ, Chủ đề, Khởi động, Học, Chơi, Quiz, Thưởng | Chọn hồ sơ, Bộ thẻ, Huy hiệu, Từ vựng, Góc phụ huynh, Mở khoá, Đăng ký, thanh toán (9/11: gói trả phí tạm tắt, bản test không có cổng trả phí) |
| *(9/11)* Danh mục `content/syllabus.json` nhúng trong bundle; mọi chủ đề, mọi bài mở; bài chưa soạn báo "Chưa có nội dung" | Danh mục đi trong gói nội dung và CMS; cổng trả phí và chọn chủ đề miễn phí |
| iPhone + iPad, 4 màn iPad theo SK-004 | Tinh chỉnh Split View, snapshot đủ ma trận thiết bị |
| Luật chấm 4 dạng câu của bài 1 | 2 dạng còn lại (`order_sequence`, `picture_bar_chart`), chuỗi ngày, chọn câu khởi động theo giãn cách |

## Ba mốc

1. **Chạy trên simulator iPhone + iPad.** Không cần Supabase, không cần tài khoản Apple trả phí. Đây là phần lớn công việc.
2. **Lên máy thật.** Cần Apple ID của Duy.
3. **Nối Supabase.** Làm khi Duy tạo project.

## Việc cần làm

### Giọng tiếng Việt · ưu tiên trước mọi việc khác (Duy 31/10)

Duy chọn thử **VieNeu-TTS, chỉ giọng Nam** (31/10). Không thử Google, FPT, Azure lần này. Dự phòng nếu không giọng nào đạt: hỏi lại Duy theo thứ tự B9 (Google Chirp 3 HD, rồi FPT/Azure).

**1/11: Duy chốt giọng Kim Thanh, tốc độ mặc định (V1 xong).**

| # | Ticket | Việc | Ai | Cần trước | Xong khi |
| --- | --- | --- | --- | --- | --- |
| V1 | [SK-023](backlog/SK-023-tts-vi-listening-test.md) | Listening test: xác minh giấy phép VieNeu v3 Turbo, dựng runtime, sinh 30 câu + 30 từ (`content/tts-vi/listening-set.md`) bằng mọi giọng miền Nam (có thể thêm 2 tốc độ), ẩn tên để chấm mù theo phiếu | dev (sinh mẫu), content-editor (bộ câu, phiếu), Duy + biên tập viên chấm | — | Duy chốt giọng + tốc độ; PM ghi vào technical-plan B9, B18 #3 |
| V2 | [SK-024](backlog/SK-024-content-cli-tts-vi.md) | `content-cli tts` cho VI: chuẩn hoá chữ VI (số, đơn vị, viết tắt, từ mượn, dấu thanh, ô trống), khoá cache theo engine + giọng + model + tham số, sinh `audio.vi` cho 128 chuỗi bài 1 (110 clip, khoảng 2.800 ký tự), build lại gói | dev | V1 cho lần sinh cuối; chuẩn hoá, cache, build làm song song | `--require-assets` chỉ còn lỗi hình; Duy nghe hết phần VI và ghi "đạt" |
| V3 | [SK-025](backlog/SK-025-ios-vi-voice.md) | App phát VI thật: `vi` chỉ VI, `both` EN rồi VI, nút nghe và Từ mới có ở hồ sơ `vi`, tải trước theo thứ tiếng đang bật; trả lời câu hỏi #6 của SK-016 | ios-dev, tester | V2 (unit test làm trước bằng gói test) | Đi trọn bài 1 với hồ sơ `vi` và `both` trên 1 simulator, mỗi bộ 1 lần; Duy nghe tay |

### Mốc 1 · simulator

| # | Ticket | Việc | Ai | Cần trước | Xong khi |
| --- | --- | --- | --- | --- | --- |
| I1 | [SK-005](backlog/SK-005-ios-app-skeleton.md) | Khung `apps/ios`: XcodeGen `project.yml`, một target universal iOS 17, Swift 6; package nội bộ `SKKit` (DesignSystem, ContentModel, LessonEngine, ContentKit, LessonPlayer, AudioKit); font Phudu + Be Vietnam Pro đóng gói; `Localizable.xcstrings` EN/VI; `PrivacyInfo.xcprivacy`; iPhone khoá dọc, iPad xoay | ios-dev | — | `xcodebuild build` xanh trên iPhone 16 và iPad Pro 11 |
| I2 | [SK-006](backlog/SK-006-design-tokens-v1.md) | `packages/design-tokens/tokens.json`: màu, chữ, bán kính theo nhóm tuổi, vùng chạm 72/56/48, bóng giấy, thời lượng và easing của motion, trích từ các file Discoverer | designer | — | File tokens + bảng đối chiếu với canvas |
| I3 | [SK-007](backlog/SK-007-tokens-swift-export.md) | Script xuất `tokens.json` → `Tokens.swift` trong `SKKit/DesignSystem` | dev | I2 | Chạy lại được bằng một lệnh |
| I4 | [SK-008](backlog/SK-008-ios-design-system.md) | DesignSystem: PaperCard, TwoLayerButton, Seal, PaperTag, ProgressSquares, bóng giấy; preset motion `lay`, `stamp`, `rise`, `pop`, `flip`, `fall`; tắt khi giảm chuyển động; `LayoutMetrics` cho compact và regular | ios-dev | I1, I3 | Màn gallery thành phần chạy ở cả iPhone và iPad |
| I5 | [SK-009](backlog/SK-009-ios-content-model.md) | ContentModel: Codable theo schema v1, test decode 2 fixture hợp lệ, block hoặc format lạ thì bỏ qua không crash | ios-dev | I1 | Test xanh |
| I6 | [SK-010](backlog/SK-010-ios-lesson-engine.md) | LessonEngine (Swift thuần): chấm `single_choice`, `multi_choice`, `true_false`, `fill_blank_bank`; điểm bài, sao, XP; chạy vector `item-scoring`, `lesson-score`, `stars` | ios-dev | I1 | 71/71 case pass |
| I7 | [SK-011](backlog/SK-011-ios-onboarding-home-topic.md) | Luồng mở app: Welcome → tạo hồ sơ (tên, hình đại diện, chọn giọng EN · VI · cả hai, lưu trên máy) → Trang chủ → Chủ đề (bài 1 mở, bài 2–5 khoá; **9/11 bỏ khoá, xem SK-030**) | ios-dev | I4, I5 | Ảnh chụp iPhone và iPad đặt cạnh canvas |
| I8 | [SK-012](backlog/SK-012-ios-lesson-player.md) | LessonPlayer: Khởi động, Học (`explore_groups`, `word_list`), Chơi (`build_tray` mâm cơm), Quiz 6 câu có gợi ý và giải thích, Thưởng (sao, giấy vụn, lật thẻ rau muống); thoát giữa bài thì mở lại đúng bước | ios-dev | I4, I5, I6 | Chơi trọn bài 1, điểm và sao khớp engine |
| I9 | [SK-013](backlog/SK-013-ios-ipad-layouts.md) | Bản iPad cho Trang chủ, Học, Chơi, Quiz theo SK-004: khung giấy ~600pt, lưới 3–4 cột, Trang chủ hai cột; Split 1/3 dùng bố cục iPhone | ios-dev | I7, I8 | Ảnh chụp iPad dọc và ngang |
| C1 | [SK-014](backlog/SK-014-content-cli-tts-en.md) | `tools/content-cli tts` cho EN: đọc JSON bài, chuẩn hoá số thành chữ, sinh clip Kokoro giọng `af_heart` cho 128 chuỗi `Spoken` (107 clip, khoảng 2.800 ký tự; số đo ở SK-014, lúc lập kế hoạch ước 164 chuỗi), chuyển m4a mono 64 kbps bằng `afconvert` có sẵn trên Mac, đặt tên theo hash | dev | — | Thư mục clip + báo cáo; Duy nghe thử 10 câu và phần từ vựng |
| C2 | [SK-015](backlog/SK-015-content-cli-build-pack.md) | `content-cli build` tối giản: gói bài 1 (topic.json, lesson.json, audio, manifest có sha256) thành thư mục để app nhúng | dev | C1 | ContentKit đọc gói và kiểm sha256 |
| I10 | [SK-016](backlog/SK-016-ios-audio-content-kit.md) | AudioKit: phát EN theo từng câu và từ, tải trước clip của bước kế, nút nghe lại; clip chưa có thì bỏ qua | ios-dev | I8, C2 | Nghe được toàn bài trên simulator |
| N1 | [SK-017](backlog/SK-017-fix-sk002-bugs.md) | Sửa 3 lỗi SK-002: 2 câu VI lộ đáp án, chép 23 UUID vào markdown, thêm `alt` cho 3 mẫu trong TEMPLATE; dev cập nhật fixture | content-editor → dev | — | `validate` OK. Không chặn các việc I |
| D1 | [SK-018](backlog/SK-018-lesson1-paper-art.md) | Hình giấy cắt thật cho bài 1, ưu tiên 4 nhóm chất + thẻ rau muống, rồi tới 36 brief | designer | — | Không chặn mốc 1; thay dần vào gói |
| T1 | [SK-019](backlog/SK-019-ios-golden-path-test.md) | Kiểm luồng vàng trên iPhone 16e, iPhone 16 Pro Max, iPad Pro 11 (dọc, ngang), iPad mini: VoiceOver đọc được, giảm chuyển động tắt animation, vùng chạm ≥ 56pt, không tràn chữ | tester | I8, I9, I10 | Báo cáo lỗi theo mức |

**Đường găng:** I1 → I4, I5, I6 → I8 → I10 → T1. Chạy song song với nó: I2 → I3 (designer, dev), C1 → C2 (dev), N1, D1.

**Thứ tự từ 31/10 (Duy ưu tiên giọng VI):**
1. V1 → V2 → V3 làm trước mọi việc khác của dev và ios-dev.
2. Trong V2, phần chuẩn hoá, cache, build chạy song song với V1. Unit test của V3 chạy song song với V2.
3. Các việc đang ở review (SK-013 chờ Duy chọn cách đặt nhãn, SK-017, SK-018) không bị dừng, nhưng không lấy người của V1–V3.
4. Đề xuất: T1 (SK-019) chạy sau V3, để kiểm cả giọng VI trong cùng một lần chạy (luật 1 lần, 1 simulator).

### Hiện đủ syllabus, không khoá (mở 9/11)

Duy duyệt syllabus ngày 9/11 ([syllabus.md](../syllabus.md) mục 0, 6, 9). Main session sinh `content/syllabus.json`. App sẽ đọc file này từ bundle giống `content/rules.json` (việc của ios-dev ở SK-030).

| # | Ticket | Việc | Ai | Cần trước | Xong khi |
| --- | --- | --- | --- | --- | --- |
| K1 | [SK-030](backlog/SK-030-full-syllabus-no-lock.md) | Schema + test cho `content/syllabus.json`, `content-cli validate` kiểm file này (dev). App đọc danh mục từ bundle, bỏ `BundledContent.plannedLessonCounts`; Home hiện mọi chủ đề, xem được 2 nhóm còn lại; màn Chủ đề hiện mọi bài, bài chưa soạn báo "Chưa có nội dung"; bỏ luật khoá trong `LessonList` và cờ `SK_UNLOCK_ALL_LESSONS`; tắt nhãn Free; thẻ "Học tiếp" trỏ bài đã soạn đầu tiên theo thứ tự (ios-dev). Tên VI cho 347 bài (content-editor) | dev, ios-dev, content-editor; tester | `content/syllabus.json` | Đủ tiêu chí SK-030: 12, 17, 16 chủ đề và 73, 155, 156 bài; *Ăn uống lành mạnh* hiện 10 bài, 2 bài chơi trọn được; không còn khoá hay nhãn Free; bản Release trên iPhone của Duy |

### Mốc 2 · máy thật

| # | Ticket | Việc | Ai |
| --- | --- | --- | --- |
| B1 | [SK-020](backlog/SK-020-ios-device-install.md) (Duy quyết) | Chọn cách cài (xem mục quyết định 1) | Duy |
| B2 | [SK-020](backlog/SK-020-ios-device-install.md) (Duy quyết) | Chốt bundle id (ví dụ `vn.<tên>.sciencekids`) và tên hiển thị tạm, vì tên app chưa chốt | Duy |
| B3 | [SK-020](backlog/SK-020-ios-device-install.md) | Ký tự động theo Team ID, số build, `ITSAppUsesNonExemptEncryption = NO`, script archive; icon 1024 tạm | ios-dev, designer làm icon |
| B4 | [SK-020](backlog/SK-020-ios-device-install.md) | Nếu dùng TestFlight: tạo app trên App Store Connect, upload từ Xcode Organizer, thêm tester nội bộ | Duy bấm, ios-dev viết hướng dẫn từng bước |

### Mốc 3 · nối Supabase

| # | Ticket | Việc | Ai | Cần trước |
| --- | --- | --- | --- | --- |
| S1 | Duy · phụ thuộc của [SK-021](backlog/SK-021-supabase-app-migration.md), [SK-022](backlog/SK-022-ios-supabase-sync.md) | Tạo project staging (free), bật Anonymous sign-ins, gửi URL + publishable key. Không gửi `service_role` | Duy | — |
| S2 | [SK-021](backlog/SK-021-supabase-app-migration.md) | Migration đầu cho app: `child_profiles` (có `voice_mode`), `lesson_attempts`, `lesson_progress`, `app_config` + RLS + GRANT; RPC `create_child_profile` (1 hồ sơ khi chưa Premium), `submit_attempts` (idempotent theo `attempt_id`), `get_home`; pgTAP | dev viết, Duy chạy tay | S1 |
| S3 | [SK-022](backlog/SK-022-ios-supabase-sync.md) | `supabase-swift`: `signInAnonymously`, session trong Keychain, đẩy hồ sơ trên máy lên server lần đầu, hàng đợi gửi attempt (ghi máy trước, gửi khi có mạng) | ios-dev | S1, S2 |
| S4 | [SK-022](backlog/SK-022-ios-supabase-sync.md) | Chuỗi ngày và ngày theo giờ địa phương: vector `streak`, `local-date` | ios-dev | — |
| T2 | [SK-021](backlog/SK-021-supabase-app-migration.md) (pgTAP), [SK-022](backlog/SK-022-ios-supabase-sync.md) (offline) | pgTAP cho RPC và RLS; offline rồi online, gửi lại không nhân đôi | tester | S2, S3 |

## Duy cần quyết hoặc làm

1. **Cách lên máy thật (mốc 2).**
   - Apple ID miễn phí: Xcode cài thẳng lên iPhone/iPad của Duy. App hết hạn sau 7 ngày, tối đa 3 máy, không chia cho người khác.
   - Apple Developer Program, 99 USD/năm: TestFlight cho tối đa 100 người trong team mà không cần duyệt, hoặc người ngoài qua một lần duyệt beta. Tài khoản cá nhân thường được duyệt trong 48 giờ. Tài khoản tổ chức cần mã D-U-N-S, mất 1–2 tuần, và tên tổ chức hiện là người bán trên store.
2. **Bundle id và tên hiển thị tạm.**
3. **Trang chủ iPad theo bố cục A hay B** (SK-004). Chưa chọn thì làm A.
4. **Ngưỡng đạt 4/6 hay 5/6.** Engine đọc từ `rules`, nên bản thử dùng 5/6 như mặc định trong test vector; đổi sau không phải sửa code.
5. **Cho phép tải công cụ:** XcodeGen (Homebrew), font Phudu và Be Vietnam Pro (Google Fonts, giấy phép OFL), model Kokoro (Hugging Face, khoảng 90–330 MB tuỳ bản), `supabase-swift` (Swift Package, mốc 3). Thêm 31/10: gói `vieneu` và model VieNeu-TTS từ Hugging Face (Duy cho phép).
6. **Tạo project Supabase** khi tới mốc 3.
7. **Giọng tiếng Việt (31/10).** Đã chọn thử VieNeu-TTS, giọng Nam. Còn cần Duy:
   - ~~xác nhận "giọng Nam" là giọng miền Nam; chấm listening test, chốt giọng và tốc độ (SK-023)~~: xong 1/11, Kim Thanh;
   - nghe hết phần VI của bài 1 (SK-024);
   - nghe trong app và chọn thứ tự đọc của chế độ "Cả hai" (SK-025).
8. **Syllabus 9/11 còn mở** ([syllabus.md](../syllabus.md) mục 8, technical-plan.md A8):
   - ~~phạm vi pilot GĐ 0~~ Duy chốt 9/11: 6 chủ đề đầu Discoverer, 38 bài, chưa bài nào soạn; *Ăn uống lành mạnh* (#9) ngoài pilot. Mốc 16/1/2027 chưa xác nhận lại;
   - tên VI hai chủ đề mùa của Explorer;
   - gói trả phí bật lại khi nào; trong lúc tắt có giữ giới hạn 1 hồ sơ cho khách không.

## Ghi chú kỹ thuật

- **Kokoro chạy bằng gì.** Máy đang có Python 3.15; `onnxruntime` thường ra bản cho Python mới chậm, nên `kokoro-onnx` có thể không cài được. dev thử `kokoro-js` (chạy thẳng trong Node, hợp với content-cli viết bằng TypeScript) trước; không được thì dùng `uv` tạo môi trường Python 3.12 cho `kokoro-onnx`.
- **VieNeu chạy bằng gì (31/10).** B9 ghi `pip install vieneu` (Python, chạy CPU qua ONNX). Máy có Python 3.15, nên có thể cần `uv` dựng môi trường Python 3.12, như phương án dự phòng của Kokoro; CLI Node gọi qua tiến trình con. dev chốt cách chạy và ghi giấy phép của đúng bản model (v3 Turbo, Apache-2.0; không dùng bản 0.3B cũ CC-BY-NC) ở SK-023 trước khi sinh mẫu.
- **Project Xcode.** `project.yml` của XcodeGen là nguồn, `.xcodeproj` không đưa vào git để tránh xung đột; mở project bằng `apps/ios/bootstrap.sh`.
- **Gói nhúng trong app.** Cấu trúc thư mục gói giống bản sẽ tải về ở GĐ 1, nên khi chuyển sang tải mạng chỉ đổi nguồn trong ContentKit.
- **Danh mục syllabus (9/11).** `content/syllabus.json` là file JSON viết tay, app đọc từ bundle. App không còn khoá bài (SK-030), cờ build tạm `SK_UNLOCK_ALL_LESSONS` đã bỏ. Đưa danh mục vào gói (`content-cli build`) để sau, khi có CMS.
- **Simulator trên máy:** iPhone 16, iPhone 16e (máy nhỏ, thay iPhone SE), iPhone 16 Pro Max, iPad Pro 11-inch (M4), iPad mini (A17 Pro); Xcode 16.3, Swift 6.1.
