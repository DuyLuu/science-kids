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
| [SK-016](SK-016-ios-audio-content-kit.md) | I10 · AudioKit và ContentKit: đọc gói, phát giọng EN | ios-dev | tester | review (tester đạt 29/10; 2/11 sửa lỗi sandbox khi build vào DerivedData mặc định, 251 test xanh trên iPhone 16 Pro) | SK-012, SK-015 |
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

## Đường nội dung từ markdown (mở 2/11/2026)

Duy 2/11 giao ngay: biên tập soạn bài 2 trở đi từ 10/11, nên `content-cli` phải đọc markdown trước đó (kéo lên từ B16 1/12–12/12).

| Id | Tên | Phụ trách | Tester | Trạng thái | Phụ thuộc |
| --- | --- | --- | --- | --- | --- |
| [SK-027](SK-027-content-cli-import-markdown.md) | `content-cli` đọc markdown: `validate` báo lỗi theo dòng, `import` ra JSON schema v1, `ids` điền id | dev | tester | done (2/11: markdown bài 1 ra JSON trùng từng byte fixture, gói trùng sha256 mốc; tester đạt sau một vòng sửa L1–L6, `npm test` 273/273; còn L7, L8 nhẹ không chặn. Duy chốt: phiên chính chạy `validate` hộ content-editor) | SK-001, SK-015, SK-026 |
| [SK-028](SK-028-lesson2-mam-com-can-bang.md) | Bài 2 "Mâm cơm cân bằng" (Ăn uống lành mạnh), bài đầu tiên đi trọn đường markdown; kèm sửa TEMPLATE theo lệnh mới | content-editor; phiên chính chạy lệnh | tester | done (2/11: bài 2 đi trọn đường markdown → gói, `validate` 0 lỗi, sửa theo 17 góp ý của tester, `check-pack` OK; test content-cli 273/273, content-schema 98/98, iOS 38/38. Nội dung vẫn là nháp AI: chờ duyệt chuyên môn, Duy nghe; gói 2 bài chưa nhúng vào app) | SK-027 |

## Icon và màn khởi động (mở 2/11/2026)

Duy 2/11: thiết kế bộ app icon và màn khởi động trước khi build lên máy thật (SK-020).

| Id | Tên | Phụ trách | Tester | Trạng thái | Phụ thuộc |
| --- | --- | --- | --- | --- | --- |
| [SK-029](SK-029-app-icon-launch-screen.md) | Bộ app icon (sáng, tối, tinted) và màn khởi động theo style E; 3 hướng icon để Duy chọn | designer → ios-dev | tester | review (Duy chọn icon B linh vật và khởi động PA2, 3/11; 8/11 đã vào app: icon sáng và màn khởi động đúng trên iPhone 16 Pro, 251 test xanh; icon Dark, Tinted và iPad kiểm trên máy thật ở SK-020) | Không; SK-020 dùng thay "icon tạm" |
| [SK-030](SK-030-full-syllabus-no-lock.md) | App hiện đủ syllabus (45 chủ đề, 384 bài từ `content/syllabus.json`), không khoá bài, tắt nhãn Free | ios-dev, dev, content-editor; pm sửa tài liệu | tester | review (9/11: danh mục 384 bài có đủ tên VI, `validate` 0 lỗi; content-schema 142/142, content-cli 282/282; iOS: ScienceKidsTests 57/57, ContentKitTests 25/25, ContentModelTests 25/25, OnboardingUITests 10 qua + 1 skip; bản Release đã cài trên iPhone Luu. Chưa chạy lại Lesson/Audio/Sync/iPad UI test theo Duy; còn câu hỏi cho Duy trong ticket) | syllabus.md (Duy duyệt 9/11) |
| [SK-049](SK-049-explorer-6-human-body.md) | Soạn Explorer #6 "Cơ thể của em" (6 bài theo Oak Y1 Human body parts: con người là động vật, bộ phận ngoài, bộ phận trong, năm giác quan, nhìn ngửi nghe, nếm sờ; ảnh thật) | content-editor, designer; phiên chính chạy lệnh | tester | review (18/11: 6 bài, ảnh 0 lỗi, TTS, build, check-pack OK, chạy bài 1 trên iPhone 16; còn: ảnh "Loài người" đọc như mì, 5 clip VI chờ nghe, `[CẦN KIỂM]` chờ người chuyên môn) | SK-040, SK-044, SK-047 |
| [SK-048](SK-048-explorer-habitats-around-the-world.md) | Chủ đề Explorer mới #4 "Những nơi sống trên Trái Đất" (8 bài: Bắc Cực, Nam Cực, rừng mưa, rừng ngập mặn và đầm lầy, biển, xavan, sa mạc, tổng kết; ảnh thật) | content-editor, designer; phiên chính chạy lệnh | tester | review (16/11: 8 bài soạn xong, tester rà 1 chặn + 3 nên sửa, đã sửa; ảnh 299/299 chỗ, 137 ảnh CC0/PD/CC BY; TTS EN + VI, 74 clip VI chờ Duy nghe; gói 11 chủ đề `check-pack` OK; chạy trọn bài 1 trên iPhone 16. Chờ người chuyên môn đọc `[CẦN KIỂM]`) | SK-040, SK-044, SK-047 |
| [SK-050](SK-050-explorer-weather-and-seasons.md) | Chủ đề Explorer mới #5 "Thời tiết và các mùa" (Weather and seasons, 6 bài: thời tiết hôm nay, xuân và hè, thu và đông, mùa mưa và mùa khô, mười hai tháng, tổng kết), gộp và thay #5, #8 cũ | dev (danh mục), content-editor, designer, ios-dev; phiên chính chạy lệnh | tester | review (18/11: soạn 6 bài, ảnh, icon, test iOS xong; validate 0 lỗi, gói 12 chủ đề check-pack OK; chờ chuyên môn duyệt 46 ý [CẦN KIỂM], Duy nghe 28 clip VI) | SK-040, SK-044, SK-047 |
| [SK-044](SK-044-answer-feedback.md) | Giải thích khi chọn sai (để chọn lại) và khi chọn đúng, theo tuổi | content-editor, dev, ios-dev | tester | in_progress (13/11) | — |
| [SK-043](SK-043-lesson-screens-picture-book.md) | Thiết kế lại màn Học, Chơi, Quiz theo hướng A Sách tranh | designer → ios-dev | tester | in_progress (13/11, thiết kế, chưa code) | — |
| [SK-042](SK-042-settings-language.md) | Trang Cài đặt: chọn English, Tiếng Việt hay cả hai | ios-dev | tester | review (12/11: bánh răng ở Trang chủ, ba chế độ, lưu trên máy; unit test qua; đã cài iPhone Luu. Chờ dev RPC đổi `language_mode` trên server; chờ chốt giọng chế độ Tiếng Việt `vi` hay `both`) | — |
| [SK-040](SK-040-ios-explorer-mode.md) | App chạy bài Explorer theo canvas và SK-026 | ios-dev | tester | review (12/11: Explorer Khởi động/Học/Chơi/Quiz/Thưởng, order_sequence, XP = 0; unit test qua; chưa nghe giọng trên máy, chưa VoiceOver thật) | SK-026 |
| [SK-041](SK-041-explorer-1-animals.md) | Soạn Explorer #1 "Gọi tên và nhóm động vật" (6 bài, Oak Y1) | content-editor, designer; phiên chính chạy lệnh | tester | review (12/11: 6 bài, tester rà 1 chặn + 6 nên sửa, đã sửa; 46 ảnh mới, 0 trống; TTS 537 clip VI, 37 đánh dấu; gói 8 chủ đề `check-pack` OK) | SK-026, SK-040 |
| [SK-038](SK-038-discoverer-5-weather.md) | Soạn chủ đề Discoverer #5 "Thời tiết và thiên tai ở Việt Nam" (5 bài, có hình) | content-editor, designer; phiên chính chạy lệnh | tester | review (12/11: 5 bài, tester rà 1 chặn + 8 nên sửa, đã sửa; hình 90 vẽ + 2 ảnh; TTS 543 clip VI, 33 đánh dấu; gói 7 chủ đề `check-pack` OK; đã cài iPhone Luu) | SK-030, SK-033 |
| [SK-039](SK-039-discoverer-6-rocks-soils.md) | Soạn chủ đề Discoverer #6 "Đá và đất" (15 bài theo Oak, có hình) | content-editor, designer; phiên chính chạy lệnh | tester | review (12/11: 15 bài theo Oak, hai tester rà 0 chặn, đã sửa; hình 158 ảnh, 201 vẽ, 31 ghép, 0 trống; TTS 1367 clip VI, 76 đánh dấu; gói 7 chủ đề 863 ảnh `check-pack` OK; đã cài iPhone Luu) | SK-030, SK-033 |
| [SK-035](SK-035-tabs-cards-words-badges.md) | Ba tab Bộ thẻ, Từ vựng, Huy hiệu thay trang "Sắp có" | ios-dev | tester | review (10/11: ba tab chạy thật; tester kiểm, 3 lượt sửa; ScienceKidsTests 86/86, IPadLayoutUITests 3/3, Lesson/Audio/Onboarding UI qua; chưa kiểm VoiceOver thật, Reduce Motion cài đặt máy, SyncUITests) | SK-030, SK-033, SK-034 |
| [SK-036](SK-036-discoverer-3-breathing.md) | Soạn chủ đề Discoverer #3 "Hô hấp" (4 bài, có hình) | content-editor, designer; phiên chính chạy lệnh | tester | review (11/11: 4 bài, tester rà chữ 0 chặn, đã sửa 7 nên sửa; `validate` 0 lỗi; hình 69 tự vẽ + 24 ảnh Commons, còn trống `tray_toy_fish`; TTS 429 clip VI, 16 bị đánh dấu chờ Duy nghe; gói 5 chủ đề 441 ảnh, `check-pack` OK; bản Release build xong, chưa cài. Chờ Duy: hai món bẫy khói thuốc, bếp than) | SK-030, SK-033 |
| [SK-037](SK-037-discoverer-4-brain-senses.md) | Soạn chủ đề Discoverer #4 "Não bộ và giác quan" (4 bài, có hình) | content-editor, designer; phiên chính chạy lệnh | tester | review (11/11: 4 bài, tester rà chữ 0 chặn, đã sửa 9 nên sửa; `validate` 0 lỗi; hình 63 tự vẽ + 23 ảnh Commons + 1 ghép, 0 trống; TTS 417 clip VI, 21 bị đánh dấu chờ Duy nghe; gói 5 chủ đề `check-pack` OK; bản Release build xong, chưa cài) | SK-030, SK-033 |
| [SK-034](SK-034-journey-roadmap.md) | Bản đồ Hành trình (phương án A, đường quanh co) và 45 biểu tượng chủ đề | designer → ios-dev | tester | in_progress (10/11: thiết kế xong, Duy chốt A, lá tre, 3 sao, "Chặng n") | SK-030 |
| [SK-033](SK-033-real-images.md) | Hình minh hoạ thật (ảnh chụp, hình vẽ gần thực tế, nguồn miễn phí) cho mọi câu hỏi và lựa chọn; đường đưa hình vào gói và app | dev, ios-dev, content-editor, designer | tester | review (10/11: đường ảnh xong — validate luật hình, `images search`/`fetch`/`build`, app hiện ảnh thật và màn Nguồn hình; bài thử *Đất và nước* 18 ảnh (CC0 6, PD 4, CC BY 8), Duy duyệt, đã cài lên iPhone Luu; 7 chỗ chưa có ảnh đề xuất tự chụp) | — |
| [SK-032](SK-032-discoverer-2-dinosaurs.md) | Soạn chủ đề Discoverer #2 "Khủng long và Trái Đất thời xa xưa" (5 bài; mọi câu hỏi và lựa chọn có hình) | content-editor; phiên chính chạy lệnh | tester | review (10/11: 5 bài đủ hình theo luật mới; tester rà chữ 0 chặn, đã sửa 7 lỗi nên sửa; `validate` 0 lỗi; TTS EN 531 + VI 525 clip, 31 clip VI bị đánh dấu chờ Duy nghe; gói 3 chủ đề 12 bài; đã cài lên iPhone Luu) | SK-031 |
| [SK-031](SK-031-discoverer-1-earth-surface.md) | Soạn chủ đề Discoverer #1 "Bề mặt Trái Đất: núi lửa, động đất, đại dương" (5 bài, chủ đề đầu của pilot) | content-editor; phiên chính chạy lệnh | tester | review (9/11: 5 bài soạn xong, tester rà chữ 0 chặn, đã sửa 6 lỗi nên sửa; `validate` 0 lỗi; gói 2 chủ đề, 7 bài, 33,3 MB, check-pack OK; iOS unit test qua; đã cài lên iPhone Luu. Chờ duyệt chuyên môn, duyệt pháp lý bản đồ bài 2, Duy nghe 16 clip VI bị đánh dấu) | SK-030 |

## Hệ thống quiz (mở 15/11/2026)

Duy 15/11 chọn hướng B của [docs/quiz-system-proposal.md](../quiz-system-proposal.md) và thêm bước Tổng kết bài (T1). Làm theo 3 đợt; đợt 1 không đổi schema.

| Id | Tên | Phụ trách | Tester | Trạng thái | Phụ thuộc |
| --- | --- | --- | --- | --- | --- |
| [SK-047](SK-047-quiz-system-wave-1.md) | Quiz Đợt 1: xáo lựa chọn, nút gợi ý, xếp thứ tự giữ thẻ đúng, tên cột biểu đồ, Tổng kết bài bản cơ bản; luật MC trong CLI; sửa MC, FB ở 40 bài Discoverer | designer → ios-dev; dev, content-editor song song | tester | review (16/11: tester kiểm lại 2 lượt, 51 đạt, 3 chưa kiểm, 0 chặn; PM đã cập nhật tài liệu: technical-plan A3, B4.4, B7.6; PRD mục 5; syllabus mục 1; danh sách việc Đợt 2 ở cuối ticket; chờ Duy review, commit) | SK-043, SK-044 |
