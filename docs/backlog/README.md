# Backlog

Mỗi ticket một file `<id>-<slug>.md`, mẫu trong [CLAUDE.md](../../CLAUDE.md). Id tăng dần SK-001, SK-002… Trạng thái: `todo` · `in_progress` · `review` · `done`. Agent đổi trạng thái trong ticket thì cập nhật luôn bảng này.

## GĐ 0 · đợt 1 (mở 28/10/2026)

| Id | Tên | Phụ trách | Tester | Trạng thái | Phụ thuộc |
| --- | --- | --- | --- | --- | --- |
| [SK-001](SK-001-content-schema-v1.md) | Content schema v1: JSON Schema + zod + validate · dev | tester | review | Không; bước cuối chờ markdown của SK-002 |
| [SK-002](SK-002-lesson-template-sample-lesson.md) | Khung markdown một bài + bài mẫu "Ăn uống lành mạnh — bài 1" · content-editor | tester | review | Dùng bảng trường của SK-001; validate chờ SK-001 xong |
| [SK-003](SK-003-scoring-test-vectors-v1.md) | Test vector v1 cho luật chấm B4.4 · tester | dev đọc chéo | review | Dùng tên trường đáp án của SK-001 |
| [SK-004](SK-004-ipad-discoverer-4-screens.md) | Bản iPad cho 4 màn Discoverer: Trang chủ, Học, Chơi, Quiz · designer | tester | review | Không |

SK-002, SK-003 và SK-004 chạy song song với SK-001. Khi SK-001 xong, bài mẫu của SK-002 phải qua `validate`; điều kiện này ghi ở cả hai ticket.

## Đợt 2 · bản iOS chạy thử (mở 28/10/2026)

Kế hoạch ở [docs/ios-test-build.md](../ios-test-build.md), Duy duyệt 28/10. Mã đầu cột Tên (I1, C1, B1–B4…) là mã việc trong kế hoạch. App iOS do `ios-dev` làm; backend, `content-cli` và script tokens do `dev` làm.

**Mốc 1 · simulator iPhone + iPad**

| Id | Tên | Phụ trách | Tester | Trạng thái | Phụ thuộc |
| --- | --- | --- | --- | --- | --- |
| [SK-005](SK-005-ios-app-skeleton.md) | I1 · Khung app iOS: XcodeGen, SKKit rỗng, font, iPhone + iPad | ios-dev | tester | review | Không |
| [SK-006](SK-006-design-tokens-v1.md) | I2 · Design tokens v1 trích từ canvas style E | designer | tester | review | Không |
| [SK-007](SK-007-tokens-swift-export.md) | I3 · Script xuất `tokens.json` → `Tokens.swift` | dev | tester | review | SK-006; thư mục đích từ SK-005 |
| [SK-008](SK-008-ios-design-system.md) | I4 · DesignSystem: thành phần giấy, motion, `LayoutMetrics` | ios-dev | tester | review | SK-005, SK-007 |
| [SK-009](SK-009-ios-content-model.md) | I5 · ContentModel Codable theo schema v1 | ios-dev | tester | review | SK-005 |
| [SK-010](SK-010-ios-lesson-engine.md) | I6 · LessonEngine: chấm câu, điểm bài, sao, XP (71 case) | ios-dev | tester | review | SK-005 |
| [SK-011](SK-011-ios-onboarding-home-topic.md) | I7 · Chào mừng → Tạo hồ sơ → Trang chủ → Chủ đề | ios-dev | tester | review | SK-008, SK-009 |
| [SK-012](SK-012-ios-lesson-player.md) | I8 · LessonPlayer: chơi trọn bài 1 | ios-dev | tester | review | SK-008, SK-009, SK-010; vector `build-tray` của tester |
| [SK-013](SK-013-ios-ipad-layouts.md) | I9 · Bố cục iPad cho Trang chủ, Học, Chơi, Quiz | ios-dev | tester | review (tester đạt có điều kiện 29/10; L9–L11 đã sửa 29/10, còn L12; từ điền theo designer đã làm 31/10, audit màn Học sửa và đạt trên iPhone 16 Pro; nhãn ô từ đã thêm và vắt mép mọi ô 31/10 (Duy chọn a), đạt trên iPhone 16 Pro; chờ designer sửa canvas câu 5) | SK-011, SK-012; Duy chọn Trang chủ A (29/10) |
| [SK-014](SK-014-content-cli-tts-en.md) | C1 · `content-cli tts` tiếng Anh bằng Kokoro | dev | tester | review | Không |
| [SK-015](SK-015-content-cli-build-pack.md) | C2 · `content-cli build`: gói bài 1 để app nhúng | dev | tester | review | SK-014; nên chạy lại sau SK-017 |
| [SK-016](SK-016-ios-audio-content-kit.md) | I10 · AudioKit và ContentKit: đọc gói, phát giọng EN | ios-dev | tester | review (tester đạt 29/10) | SK-012, SK-015 |
| [SK-017](SK-017-fix-sk002-bugs.md) | N1 · Sửa 3 lỗi SK-002 và cập nhật fixture | content-editor → dev | tester | review | Không |
| [SK-018](SK-018-lesson1-paper-art.md) | D1 · Hình giấy cắt thật cho bài 1 | designer | tester | review (đợt 1) | Không; chưa vào gói khi chưa có `content-cli assets` |
| [SK-019](SK-019-ios-golden-path-test.md) | T1 · Kiểm luồng vàng trên 5 simulator | tester | pm | todo | SK-012, SK-013, SK-016 |

Đường găng: SK-005 → SK-008, SK-009, SK-010 → SK-012 → SK-016 → SK-019. Chạy song song: SK-006 → SK-007 (designer, dev), SK-014 → SK-015 (dev), SK-017, SK-018. Ba ticket bắt đầu ngay: SK-005, SK-006, SK-014.

**Mốc 2 · máy thật** và **mốc 3 · nối Supabase**

| Id | Tên | Phụ trách | Tester | Trạng thái | Phụ thuộc |
| --- | --- | --- | --- | --- | --- |
| [SK-020](SK-020-ios-device-install.md) | B1–B4 · Lên máy thật: ký, icon tạm, cài trực tiếp hoặc TestFlight | ios-dev (designer làm icon) | tester | todo | SK-019; Duy chọn Apple ID miễn phí hay Developer Program, chốt bundle id |
| [SK-021](SK-021-supabase-app-migration.md) | S2, T2 (pgTAP) · Migration đầu cho app + RPC + pgTAP | dev | tester | review (T2 đạt, L1 đã sửa 29/10) | Viết được ngay; Duy tạo project staging (S1) và chạy migration |
| [SK-022](SK-022-ios-supabase-sync.md) | S3, S4, T2 (offline) · App nối Supabase: khách ẩn danh, hàng đợi, chuỗi ngày | ios-dev | tester | review (tester đạt 29/10, mất mạng qua proxy) | SK-021 đã chạy trên staging, URL + key từ Duy; SK-010, SK-011, SK-012 |

S1 (Duy tạo project Supabase) không có ticket riêng; nó là phụ thuộc của SK-021 và SK-022.

## Giọng tiếng Việt · ưu tiên (mở 31/10/2026)

Duy đưa giọng VI lên trước mọi việc khác; chỉ thử VieNeu-TTS, giọng miền Nam (31/10). Chi tiết ở [ios-test-build.md](../ios-test-build.md) mục "Giọng tiếng Việt · ưu tiên".

| Id | Tên | Phụ trách | Tester | Trạng thái | Phụ thuộc |
| --- | --- | --- | --- | --- | --- |
| [SK-023](SK-023-tts-vi-listening-test.md) | V1 · Listening test VieNeu-TTS giọng Nam, chốt giọng | dev, content-editor; Duy chấm | tester | done (Duy nghe bài 1 và chốt Kim Thanh, nữ miền Nam, tốc độ mặc định, 1/11) | Không |
| [SK-024](SK-024-content-cli-tts-vi.md) | V2 · `content-cli tts` VI, `audio.vi` bài 1, build lại gói | dev | tester | review (dev xong 1/11: 128/128 audio.vi; cân âm lượng EN/VI -18 LUFS, lặng VI 0,15/0,35 s; gói 210 clip `89d8ade0a3cd`, test 173/173; chờ Duy nghe) | SK-023 (giọng đã chốt) |
| [SK-025](SK-025-ios-vi-voice.md) | V3 · App phát giọng VI thật | ios-dev | tester | review (ios-dev xong 1/11: hồ sơ vi và both phát giọng VI thật; nhúng gói đã cân âm lượng, 87/87 test audio pass trên iPhone 16 Pro; chờ Duy nghe tay) | SK-024 |

## Dạng quiz theo nhóm tuổi (mở 1/11/2026)

Duy 1/11: mỗi nhóm tuổi có dạng quiz riêng; bé chưa biết chữ làm quiz bằng giọng đọc và hình. GĐ 0 chỉ làm luật soạn câu và kiểm theo tuổi; màn quiz Explorer và Scientist để GĐ 2.

| Id | Tên | Phụ trách | Tester | Trạng thái | Phụ thuộc |
| --- | --- | --- | --- | --- | --- |
| [SK-026](SK-026-quiz-formats-by-age.md) | Dạng câu và cách hiện quiz theo Explorer, Discoverer, Scientist; luật kiểm theo tuổi trong `content-cli` | GĐ 0: dev, content-editor, designer; GĐ 2: thêm ios-dev | tester | done cho GĐ 0 (tester đạt 1/11: content-cli 215/215, unit iOS 68/68; Duy chốt D2 ngày 2/11: khung A, triện và góc bong của B, biểu tượng gật/lắc đầu). Phần GĐ 2 tách ticket con khi mở GĐ 2 | GĐ 2: renderer `order_sequence` (GĐ 1 S4); câu kỹ thuật "luật của nhóm nào" trước khi đặt `xp_*` = 0 |
