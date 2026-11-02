# SK-013 · Bố cục iPad (regular width) cho Trang chủ, Học, Chơi, Quiz

Trạng thái: review · Ngày: 2026-10-28 · Phụ trách: ios-dev · Tester: tester
Nguồn: docs/ios-test-build.md mốc 1 việc I9 và mục quyết định 3; technical-plan.md B7.10 (iPad và responsive); SK-004 (spec iPad, bàn giao designer, góp ý tester); canvas `Discoverer-Home-iPad`, `-Learn-iPad`, `-Play-iPad`, `-Quiz-iPad` (`.dc.html`) và note `discovererIpadRules` trong `canvas.json`

## Mục tiêu
Trên iPad regular width, 4 màn đại diện sắp lại theo SK-004 thay vì phóng to màn điện thoại. Các màn khác của bài (Khởi động, Thưởng) đi theo cùng quy tắc khung giấy.

## Phạm vi
- Mọi màn đọc `LayoutMetrics` (SK-008). Không có `if UIDevice…idiom` trong view; chỉ dựa vào size class và bề rộng.
- **Trang chủ:** hai cột kiểu `NavigationSplitView` ở regular, `TabView` ở compact (B7.10).
  - Cột trái là thanh bên giấy: 4 mục điều hướng và 6 chủ đề, thay cho dải tab dưới đáy.
  - Cột phải là lời chào, chuỗi ngày, sao, thẻ "Học tiếp".
  - Làm **bố cục A** (thanh bên 340pt) trừ khi Duy chọn B (thanh bên 250pt, chủ đề nằm ở cột phải) trước khi bắt đầu.
- **Học, Chơi, Quiz:** nội dung trong khung giấy tối đa 600pt canh giữa, hai bên nền điệp.
  - Giữ số cột như phone, ô to hơn: Quiz 3×2 với ô 104 → 150pt; Chơi 4×2 với ô 96 → 124pt; mâm 544pt, chỗ trong mâm 70 → 96pt; nhóm chất 2×2.
  - Hình to tối đa 1,5× bản phone.
- **Khởi động, Chủ đề, Thưởng, Chào mừng, Tạo hồ sơ:** dùng khung giấy 600pt canh giữa, không dựng bố cục riêng.
- Cỡ chữ giữ như phone. Vùng chạm ≥ 56pt, không co. Nút "Từ mới" và chip chuỗi ngày, sao nâng lên 56pt như bản iPad của SK-004 (áp cho cả bản phone).
- Xoay: layout đổi theo size class, không theo góc. Xoay giữa bài không mất trạng thái.
- Split View 1/3 và Slide Over là compact, dùng bố cục phone.

## Ngoài phạm vi
- Bộ thẻ, Huy hiệu, Từ vựng, Góc phụ huynh trên iPad (chưa có trong bản thử).
- Tinh chỉnh Split View 1/2 và snapshot đủ ma trận thiết bị (ios-test-build "Để sau").

## Tiêu chí nghiệm thu
- [ ] Ảnh chụp 4 màn trên iPad Pro 11-inch (M4) dọc và ngang, và trên iPad mini (A17 Pro) dọc. Đặt cạnh 4 board iPad trên canvas. Ghi chỗ khác và lý do.
- [ ] Unit test `LayoutMetrics` cho 834×1194, 1194×834, 744×1133 (iPad mini) và 320 (compact): đúng bề rộng khung, số cột, cỡ ô như Phạm vi.
- [ ] Đang ở quiz câu 5, xoay iPad từ dọc sang ngang: vẫn đúng câu, lựa chọn đã chọn còn nguyên.
- [ ] Mở app trong Split View 1/3 hoặc Slide Over cạnh một app khác trên simulator iPad: Trang chủ dùng `TabView` và bố cục phone, không vỡ. Dán ảnh.
- [ ] Mọi nút trên 4 màn ≥ 56pt ở cả iPhone lẫn iPad (kiểm bằng Accessibility Inspector hoặc UI test đo frame).
- [ ] UI test luồng vàng của SK-012 chạy xanh trên iPad Pro 11-inch (M4).
- [ ] Không sửa file ngoài `apps/ios/` (trừ ghi chú trong ticket). Không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- SK-011 (Trang chủ, Chủ đề) và SK-012 (Học, Chơi, Quiz).
- Duy chọn Trang chủ iPad A hay B (SK-004). Chưa chọn thì làm A; sau đó designer xoá bố cục không dùng trong `Discoverer-Home-iPad.dc.html` (góp ý 3 của tester ở SK-004).
  - **Duy chọn bố cục A (29/10).** Việc còn lại cho designer: xoá bố cục B trong `Discoverer-Home-iPad.dc.html`.
- Làm kèm 4 lỗi nhỏ tester ghi ở SK-012 (Duy giao 29/10): L1 test chập chờn trên iPad 13, L3 nhãn "CHƯA ĐÚNG" che hình, L4 "+XP" ở Quiz tự suy thay vì lấy từ engine, L8 "Đồ / ngọt" xuống dòng.

**Quyết định đã ghi** (PM đề xuất 28/10)
1. Theo bản giao của SK-004: giữ số cột của phone, ô to hơn. Mọi thứ vừa khung 600pt nên không cần bản rộng 760pt.
2. Các màn không có bản iPad trên canvas dùng khung giấy 600pt canh giữa (B7.10).

**Câu hỏi còn mở**
- Nhãn mục điều hướng trên thanh bên dùng 16pt, cỡ của hàng danh sách trên phone, chứ không giữ 12pt của dải tab. SK-004 đang chờ Duy xác nhận.

## Kết quả (ios-dev)

Ngày 29/10. **Duy giảm phạm vi kiểm 29/10: 1 lần, 1 máy.** Lượt chạy duy nhất: iPad Pro 11-inch (M4), iOS 18.4, 18:25–18:36. Không chạy lại. Tiêu chí cần máy khác ghi "chưa kiểm", lý do là luật này.

### Lượt chạy
- Build: `xcodebuild build-for-testing -project ScienceKids.xcodeproj -scheme ScienceKids -destination 'generic/platform=iOS Simulator' -derivedDataPath <dd-sk013>` → `** TEST BUILD SUCCEEDED **`. Còn 1 cảnh báo `appintentsmetadataprocessor` (không dùng App Intents), vô hại.
- Test: `xcodebuild test-without-building … -destination 'platform=iOS Simulator,id=<iPad Pro 11>'` gồm 9 bundle unit, `IPadLayoutUITests`, 3 test của `LessonUITests` (golden path, audit, nút 56pt) và `OnboardingUITests`. UI test chạy với `-SKSyncOff`.
- Kết quả: **exit 65 (`** TEST EXECUTE FAILED **`), có 1 test fail.**
  - Unit: 231 test, 230 pass, **1 fail**.
    - Pass: ScienceKidsTests 51, ContentModel 20, LessonEngine 19, ContentKit 18, LessonPlayer 34, AudioKit 13, Profiles 21, Sync 18.
    - DesignSystemTests 37: 36 pass, 1 fail.
  - UI: 16/16 pass. IPadLayoutUITests 3/3 (187 s), LessonUITests 3/3 (244 s), OnboardingUITests 10/10 (200 s).
- **Test fail:** `TokensExportTests.everyLeafHasAConstant()`, dòng 202: `Expectation failed: (leaves.count → 179) == 176`.
  - Nguyên nhân: test ghi cứng số lá 176 của tokens v1. `tokens.json` giờ có 179 lá (thêm `color.la_tre`, `role.text_correct`, `role.stamp_mark`). Lúc xuất lại token tôi quên sửa con số này.
  - Hai kỳ vọng còn lại của test vẫn pass: số hằng bằng số lá, và đường dẫn token khớp từng lá. Vậy `Tokens.swift` khớp `tokens.json`; chỉ con số trong test bị cũ.
  - **Đã sửa sau lượt chạy:** 176 → 179, có comment. **Chưa chạy lại** theo luật; cần lần chạy kế tiếp xác nhận.
- Log và kết quả (scratchpad của phiên, không đưa vào repo):
  - Log: `…/scratchpad/sk-013/logs/final-run.log`
  - xcresult: `…/scratchpad/dd-sk013/Logs/Test/Test-ScienceKids-2026.10.29_18-25-28-+0700.xcresult`
  - Log không có URL hay key Supabase (đã grep).
- Simulator iPad Pro 11 đã shutdown sau lượt chạy, không còn máy nào boot.

### Tiêu chí nghiệm thu
| # | Tiêu chí | Kết quả | Bằng chứng |
| --- | --- | --- | --- |
| 1 | Ảnh 4 màn iPad Pro 11 dọc + ngang, iPad mini dọc, cạnh canvas | **Đạt một phần** | iPad Pro 11: đủ 4 màn dọc và ngang, đã ghép màn dọc cạnh 4 board (canvas chỉ có board dọc 834×1194). Ảnh ngang đã xoay đúng chiều theo EXIF. **iPad mini: chưa kiểm** (luật 1 máy), thay bằng unit test 744 ở #2. Chỗ khác canvas ở mục dưới. |
| 2 | Unit test `LayoutMetrics` cho 834, 1194, 744, 320 | **Đạt** | `LayoutMetricsTests` "SK-013 widths" chạy 4 bộ tham số, pass trong lượt chạy. Kiểm: khung 600 canh giữa (nội dung 544), Quiz 3 cột ô 150, Chơi 4 cột ô 124, nhóm chất 2 cột, mâm 544, chỗ trong mâm 96, hình ×1,5, thanh bên 340. Ở 320 compact: khung 280, ô 104/96, chỗ 70, không có thanh bên. Vùng chạm 56 ở mọi bề rộng. |
| 3 | Câu 5, xoay dọc ↔ ngang không mất trạng thái | **Đạt** | `testRotationKeepsTheQuizState`. Log: `rotation: 'Câu 5/6' and picks ["q5_fish", "q5_egg"] kept through landscape left, portrait, landscape right, portrait`. |
| 4 | Split View 1/3 hoặc Slide Over dùng bố cục phone | **Chưa kiểm** | Luật 1 lần 1 máy; cần thao tác tay trên simulator. Có unit test compact 320 (#2) pass. Lưu ý: compact dùng dải tab tự vẽ `BottomNavStrip` từ SK-011, không phải `TabView`. Hành vi tương đương. |
| 5 | Mọi nút ≥ 56pt trên iPhone và iPad | **iPad đạt, iPhone chưa kiểm** | `testHomeTouchTargetsBothWays`: 8 nút ≥ 56pt cả dọc lẫn ngang. `LessonUITests.testEveryButtonIsAtLeast56ptAndLabelled`: 20 trạng thái từ Khởi động tới Thưởng. `OnboardingUITests.testEveryButtonIsAtLeast56ptAndLabelled` cũng pass. Chip chuỗi ngày/sao và "Từ mới" ≥ 56 (assert trong `testScreensAndScreenshots`). iPhone không chạy trong lượt này (luật). |
| 6 | Luồng vàng SK-012 xanh trên iPad Pro 11 | **Đạt** | `testGoldenPathAllRight` pass (65 s). Thưởng: `6/6`, `Được 2 trên 3 sao`, `+90 XP`. |
| 7 | Chỉ sửa `apps/ios/` (trừ ticket), không commit | **Đạt (phía tôi)** | Sửa trong `apps/ios/`, cộng mục này và một dòng cuối SK-012. `Tokens.swift` xuất lại từ `packages/design-tokens/tokens.json` (designer sửa, tôi không sửa). Không commit. Tester kiểm lại bằng `git status`. |

Đo trong `testScreensAndScreenshots` (pass):
- Thanh bên nằm trong 340pt, tab ở nửa trên. Lời chào nằm ở cột phải (x > 340).
- Màn "Sắp có" nằm ở cột phải.
- Ô Chơi cao 124, ô Quiz cao 150.
- Nút ở tờ kết quả rộng 544, canh giữa cửa sổ.
- Neo của từng màn nằm trong khung 600.

### Ảnh (scratchpad của phiên)
Thư mục: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/`
- So với canvas, màn dọc: `compare/compare-{home,learn,play,quiz}-portrait.png`
- Màn ngang: `compare/{04-home,09-learn,10-play,11-quiz}-landscape.png`
- Trạng thái đúng màu lá tre (Khởi động câu 1 đúng, Quiz câu 2 đúng): `compare/correct-green-states.png`
- Màn trong khung 600 (Chào mừng, Hồ sơ, Chủ đề, Thưởng): `compare/frame-screens.png`
- Ảnh gốc: `shots/final/`. Có thêm ảnh của `OnboardingUITests.testScreenshots` trên iPad, ví dụ tab "Thẻ" ở cột phải.

### Chỗ khác canvas và lý do
- **Trang chủ:**
  - Gói nội dung chỉ có 1 chủ đề nên thanh bên có 1 chủ đề và ô "Sắp có thêm chủ đề"; canvas vẽ 6.
  - Hồ sơ test học lớp 4 nên hiện "Year 4", chuỗi ngày và sao bằng 0.
  - Avatar không có dấu ▾ (đổi hồ sơ chưa có trong bản thử).
  - Hình thẻ "Học tiếp" là icon chủ đề (bát cơm), canvas vẽ đĩa cá.
  - Mép xé thanh bên vẽ theo nhịp mép xé trong token (`TornEdgeTrailingShape`), hơi khác SVG của canvas.
- **Học:**
  - Hình là `PlaceholderArt` (hình giấy cắt chờ SK-018).
  - Nút "Chơi thôi" lấy từ `Localizable` (canvas: "Chơi: xếp mâm cơm"). Nút mờ tới khi chạm hết các nhóm, kèm dòng nhắc.
  - Thẻ "Em kể được…" có nút loa (từ SK-012).
- **Chơi:**
  - Hình chờ SK-018.
  - Chip XP lấy từ luật: "+10 XP" (canvas "+20").
  - Mâm hiện đủ 4 chỗ.
  - Thanh yêu cầu ghép tên nhóm thành một dòng (L8).
- **Quiz:**
  - Ảnh chụp ở câu 1 (canvas vẽ câu 5). Câu 5 có trong test xoay.
  - Hình lựa chọn là placeholder.
  - Nút "Gợi ý" không có icon bóng đèn (như SK-012).
- **Chung:**
  - Hình phóng ×1,5 (canvas khoảng ×1,45).
  - Ô vuông tiến độ đã xong, dấu ĐÚNG và chữ đúng giờ màu **lá tre** theo quyết định đổi màu, canvas còn màu son. Designer cần cập nhật canvas.
  - Dấu "CHƯA ĐÚNG" nằm vắt qua mép trên ô (L3), xem dưới.
- Nhãn mục trên thanh bên đặt **16pt** làm mặc định tạm, chờ Duy xác nhận (câu hỏi mở của SK-004).

### Lỗi SK-012 làm kèm
- **L1 (test chập chờn):** `testAccessibilityAudit` pass 1 lần trên iPad Pro 11 (107 s).
  - Mỗi lượt audit mất 6,4–9,8 s. Sau audit, màn đứng yên sau 0,4–0,9 s, không có dòng "still moving".
  - Cách sửa:
    - Sau mỗi audit chờ khung nút đứng yên (`settle`).
    - Khi chờ nút quá hạn, test in danh sách những gì đang có trên màn (`screenNow`).
    - Không tăng timeout nào.
  - **Chưa chứng minh hết lỗi:** không chạy lặp trên iPad Pro 13 vì luật mới. Log chẩn đoán vẫn giữ để bắt lần sau.
- **L3 (nhãn che hình):** dấu sai/đúng giờ nằm vắt qua mép trên của ô, không đè lên hình. Khác canvas (canvas đặt trong góc ô, chính chỗ che hình). **Chưa có ảnh trong lượt này**: các test được chạy không chụp trạng thái sai ở Quiz. Ảnh sẽ có khi chạy `LessonUITests.testScreenshots`.
- **L4 (+XP):** Quiz lấy XP từ engine (`computeItemXP`, qua `LessonSession.xpEarned`), view không tự tính nữa.
  - Test `questionXPComesFromTheEngine` và `itemXPRule` pass.
  - Ảnh Quiz câu 2 đúng hiện "+10 XP". Thưởng cộng đúng +90.
- **L8 ("Đồ / ngọt"):** tên nhóm dùng dấu cách không ngắt (U+00A0) lúc hiển thị.
  - Test `groupNamesStayOnOneLine` pass.
  - Ảnh Chơi trên iPad: thanh yêu cầu nằm một dòng.
  - Trên iPhone chưa chụp lại (luật).

### Đổi màu báo đúng sang lá tre
- Token xuất lại: 179 lá. `npm test` trong `packages/design-tokens` 10/10.
- Unit test pass:
  - `TokensExportTests` (`la_tre` = `#3F7A33`, `feedback_correct`, `text_correct`, `stamp_mark`)
  - `ComponentTests` "Seal tones": đúng là `feedback_correct`, đánh dấu là `stamp_mark`; bóng lệch của ô đúng cùng màu.
- Ảnh `correct-green-states.png`:
  - Chữ điền vào chỗ trống ("air", "không khí", "energy", "năng lượng") màu lá tre.
  - Dấu "ĐÚNG" và tiêu đề "CHÍNH XÁC!" màu lá tre.
  - Ô đã chọn có bóng lệch xanh.
- Audit màu tương phản không báo gì mới ở hai màn này.

### Ghi cho tester
- Audit Trang chủ báo "Contrast failed" ở hàng "Hành trình" đang chọn trên thanh bên. Test cho qua theo luật cho phép của SK-011 (vàng hoè trên giấy): ô icon vàng hoè, chữ là `textPrimary` trên giấy. Nếu muốn, thu hẹp luật cho phép về đúng ô icon.
- `Package.resolved` có `opentelemetry-swift-core` (phụ thuộc bắc cầu của supabase-swift). Thứ này **không** được link vào app: `strings` trên `ScienceKids` và `ScienceKids.debug.dylib` không có chữ "opentelemetry".

### File đã đổi (SK-013)
- DesignSystem:
  - `Packages/SKKit/Sources/DesignSystem/Layout/LayoutMetrics.swift`, `Layout/PaperFrame.swift`
  - `Paper/PaperShapes.swift`
  - `Components/PaperChoice.swift`, `Components/Seal.swift`
  - `Generated/Tokens.swift` (xuất lại)
- LessonEngine, LessonPlayer:
  - `Packages/SKKit/Sources/LessonEngine/XP.swift`
  - `Packages/SKKit/Sources/LessonPlayer/LessonSession.swift`
  - `LessonPlayer/Views/{QuestionStep,QuestionViews,PlayStep,LearnStep,LessonParts,RewardStep}.swift`
- App:
  - `ScienceKids/Home/{HomeScreen,MainFlow}.swift`
  - `ScienceKids/Common/ScreenMetrics.swift`
  - `ScienceKids/Onboarding/{OnboardingFlow,WelcomeScreen,ProfileSetupScreen}.swift`
  - `ScienceKids/App/ScienceKidsApp.swift`
  - `ScienceKids/Debug/GalleryView.swift`
- Test:
  - `Packages/SKKit/Tests/DesignSystemTests/{LayoutMetricsTests,ComponentTests,TokensExportTests}.swift` (`TokensExportTests` sửa con số sau lượt chạy)
  - `Packages/SKKit/Tests/LessonPlayerTests/LessonSessionTests.swift`
  - `ScienceKidsUITests/LessonUITests.swift`
  - `ScienceKidsUITests/IPadLayoutUITests.swift` (mới)

### Đề xuất (ghi lại, chưa làm)
- **Lần chạy kế tiếp** (khi phiên chính cho phép):
  - `TokensExportTests` để xác nhận sửa 176 → 179.
  - `LessonUITests.testScreenshots` trên iPad để có ảnh L3.
  - iPhone 16e và iPad mini cho #1 và #5.
  - Split View 1/3 và Slide Over chụp tay cho #4.
- **Từ tester SK-022 (G1):** đặt `timeoutInterval = 20` cho request của Auth trong `SupabaseTransport.swift`, bằng mức của RPC. Hiện Auth theo mặc định 60 s, nên lần mở đầu bị `blackhole` sẽ treo đồng bộ tới 60 s.
- **Từ tester SK-022:** giữ `ProxyUITests.swift` và `BadPackUITests.swift` làm test hồi quy trong `apps/ios/ScienceKidsUITests/`.
  - Bản của tester nằm trong `…/scratchpad/snapshot-r3/apps/ios/ScienceKidsUITests/`.
  - Khi đưa vào cần tự skip nếu thiếu môi trường (`SK_PROXY_MODE_FILE`, gói đã làm hỏng), để lượt chạy thường không đỏ.
- **Designer:**
  - Đổi màu đúng trên canvas sang lá tre.
  - Xoá bố cục B trong `Discoverer-Home-iPad.dc.html`.
  - Cân nhắc vẽ dấu sai/đúng vắt mép ô như L3.

### Câu hỏi cho Duy
1. Nhãn mục thanh bên 16pt: giữ hay đổi?
2. L3: chấp nhận dấu "CHƯA ĐÚNG" vắt qua mép trên ô (khác canvas) để không che hình?

## Nghiệm thu (tester, 29/10)

Luật Duy chốt 29/10: 1 máy, 1 lần. Máy: iPad Pro 11-inch (M4), iOS 18.4, UDID AAE7F637-... Đã shutdown sau lượt chạy. Không chạy lại test nào.

### Lượt chạy (thật)
- Build: `cd apps/ios && ./bootstrap.sh && xcodebuild build-for-testing -project ScienceKids.xcodeproj -scheme ScienceKids -destination 'generic/platform=iOS Simulator' -derivedDataPath $SP/dd-tester-sk013` → `** TEST BUILD SUCCEEDED **`.
- Test: `TEST_RUNNER_SK_SCREENSHOT_DIR=$SP/tester-sk013/shots xcodebuild test-without-building … -destination 'platform=iOS Simulator,id=AAE7F637-…' -skip-testing:ScienceKidsUITests/AudioUITests -skip-testing:ScienceKidsUITests/SyncUITests -skip-testing:ScienceKidsUITests/GalleryUITests`
- Kết quả: **`** TEST EXECUTE SUCCEEDED **`, exit 0. xcresult: 253 test, 252 pass, 0 fail, 1 skip.**
  - Skip: `LessonUITests.testGoldenPathWithSystemReduceMotion` (tự skip, cần bật công tắc hệ thống; ios-dev đã ghi như vậy).
  - UI: IPadLayoutUITests 3/3 (190 s), LessonUITests 8 pass + 1 skip (603 s), OnboardingUITests 10/10 (201 s).
  - `TokensExportTests` "one constant per leaf" pass: sửa 176 → 179 của ios-dev được xác nhận.
- Có chạy thêm `LessonUITests.testScreenshots` và `OnboardingUITests.testScreenshots` (cả target theo yêu cầu). Không chạy GalleryUITests.
- Log: `$SP/tester-sk013/test.log`, `build.log`, `result.xcresult`. $SP = scratchpad của phiên.
- Ảnh của tôi: `$SP/tester-sk013/shots/ipad-pro-11-inch-m4-*.png` (file "landscape" là ảnh gốc chưa xoay EXIF nên nhìn bị nghiêng 90 độ; nội dung đúng).
- Không thêm hay sửa test nào. Không sửa code app.

### Tiêu chí
| # | Tiêu chí | Kết quả | Bằng chứng |
| --- | --- | --- | --- |
| 1 | Ảnh 4 màn iPad Pro 11 dọc/ngang cạnh canvas; iPad mini | **Đạt một phần** | Tôi tự xem ảnh dọc của Trang chủ, Học, Chơi, Quiz và ảnh ngang Trang chủ, Quiz cạnh canvas (`shots/…ipad-04-home-portrait`, `-09-learn-portrait`, `-10-play-sweets`, `-11-quiz-q5-wrong`, `-ipad-11-quiz-landscape`). Khung 600 canh giữa, thanh bên 340, số cột và thứ tự khớp canvas. Chưa xem kỹ ảnh ngang của Học và Chơi (chỉ dựa vào số đo của `testScreensAndScreenshots`). iPad mini: **chưa kiểm: Duy giảm phạm vi 29/10, 1 lần 1 máy**. Khác canvas: xem "Chỗ khác canvas" của ios-dev, thêm lỗi L9 dưới. |
| 2 | Unit `LayoutMetrics` 834, 1194, 744, 320 | **Đạt** | "SK-013 widths" chạy đủ 4 bộ tham số, pass. Phủ: số học của bề rộng khung, cột, ô, mâm, thanh bên, vùng chạm. Không phủ: việc view có thật sự dùng các số đó (phần đó do UI test đo frame ở iPad 834/1194 gánh), và không có gì kiểm 744 trên màn thật. |
| 3 | Quiz câu 5 xoay dọc/ngang giữ trạng thái | **Đạt** | `testRotationKeepsTheQuizState` pass 63 s. Log: `rotation: 'Câu 5/6' and picks ["q5_fish", "q5_egg"] kept through landscape left, portrait, landscape right, portrait`. |
| 4 | Split View 1/3 / Slide Over dùng bố cục phone | **Chưa kiểm: Duy giảm phạm vi 29/10, 1 lần 1 máy** | Chỉ có unit compact 320 (#2) pass. Ghi nhận của ios-dev: compact dùng `BottomNavStrip`, không phải `TabView`; chấp nhận được, nhưng tiêu chí ghi `TabView`, PM cần sửa chữ cho khớp. |
| 5 | Mọi nút ≥ 56pt | **iPad đạt, iPhone chưa kiểm** | `testHomeTouchTargetsBothWays`, `LessonUITests.testEveryButtonIsAtLeast56ptAndLabelled` (20 trạng thái), `OnboardingUITests.testEveryButtonIsAtLeast56ptAndLabelled` đều pass. iPhone: chưa kiểm (1 máy). |
| 6 | Luồng vàng SK-012 xanh trên iPad Pro 11 | **Đạt** | `testGoldenPathAllRight` pass 66 s. |
| 7 | Chỉ sửa `apps/ios/` (+ticket), không commit | **Đạt (phần tôi thấy)** | `apps/` còn untracked nên không có diff để so; `grep` không thấy sửa `apps/ios` ngoài danh sách. Tôi không kiểm được "không sửa ngoài apps/ios" bằng git vì cây đang nhiều thay đổi chưa commit của các agent khác. |

### Đọc code
- Không có `UIDevice` / `userInterfaceIdiom` trong `ScienceKids/` và `Packages/SKKit/Sources` (grep 0 dòng). Bố cục đi theo `horizontalSizeClass` + `containerWidth` qua `LayoutMetrics` (LayoutMetrics.swift:25-35, 143-156). Đạt.
- Không có mã hex / `Color(red:)` / `0xRRGGBB` ngoài `Generated/Tokens.swift`. Đạt.
- Không có chữ của bài trong code (chuỗi đi qua `Localizable` hoặc nội dung). Tên nhóm ở PlayStep lấy từ `mode.name(label)`. Đạt.
- Vùng chạm không co theo iPad: `touchTarget` = 56 mọi bề rộng (LayoutMetrics.swift:127); các test đo ở #5 pass.
- Số cứng còn sót (nhỏ): `spacing: 1` ở LearnStep.swift:108, HomeScreen.swift:249, 394; `cornerRadius: 1` ở RewardStep.swift:274; không đáng kể.

### L1 (test chập chờn)
- `LessonUITests.testAccessibilityAudit` **pass** (108 s) trên iPad Pro 11. Log: `audit[warmup] screen settled after 0.5 s`, learn 0.9, play 0.7, quiz q5 0.6, q6 0.5, reward 0.5; mỗi audit 6,5–9,8 s; không có dòng "still moving".
- Đọc `settle()` (LessonUITests.swift:394-407): chờ đến khi khung của mọi nút giống nhau 2 lần cách 0,3 s, tối đa 10 s. Nếu hết 10 s thì **chỉ in log, không fail**. Timeout 5 s của `tap` và 15 s ở chỗ khác giữ nguyên, không bị nới. Không có `.allowed` mới; luật cho phép audit vẫn là 2 mục cũ.
- Nhận xét: `settle` không che lỗi app vì lỗi, nếu có, vẫn lộ ở lệnh `tap`/`waitForExistence` ngay sau. Nhưng nó thêm tối đa 10 s thời gian chờ ẩn sau mỗi audit và chỉ giải quyết giả thuyết "màn đang bố trí lại", chưa chứng minh. Lỗi gốc xảy ra trên iPad Pro 13 khi chạy song song; lượt này chạy 1 máy, **không chứng minh được L1 đã hết**, chỉ là không tái hiện. Kết luận: **L1 chưa tái hiện, chấp nhận đóng có điều kiện**; nếu CI đỏ lại thì log `screenNow` sẽ cho biết màn nào.
- Góp ý: nên `XCTFail` (hoặc ít nhất ghi issue) khi `settle` hết 10 s thay vì im lặng.

### L3 (nhãn "CHƯA ĐÚNG")
- Ảnh `shots/ipad-pro-11-inch-m4-11-quiz-q5-wrong.png`: nhãn "CHƯA ĐÚNG" nằm vắt qua mép trên ô "rice", chạm vào cạnh trên của khung ô nhưng **không che hình món** (hình là ô placeholder bắt đầu thấp hơn nhãn ~10 px). **Đạt.** Lưu ý: hình thật của SK-018 cao hơn placeholder không? Chưa biết; cần xem lại khi có hình thật (mép trên của hình tranh có thể gần nhãn).

### L4 (+XP lấy từ engine)
- QuestionStep.swift:176 gọi `session.xpEarned(by:in:)` → `computeItemXP(score:rules:)` (LessonSession.swift:235-238, XP.swift:26). View chỉ in `xp`. Không còn `correct && firstTry` trong view. Test `questionXPComesFromTheEngine`, `itemXPRule` pass. Ảnh quiz q2 đúng hiện "+10 XP". **Đạt.**

### L8 ("Đồ ngọt")
- Ảnh `…10-play-sweets.png`: chip "Đồ ngọt: nên ăn ít" và dòng "Cần đủ Đạm, Rau và quả, Bột đường · Đồ ngọt: nên ăn ít" đều **một dòng**. Cách làm: NBSP trong `keptTogether` (PlayStep.swift:67). Test `groupNamesStayOnOneLine` pass. **Đạt trên iPad.** iPhone (390pt, chuỗi dài hơn) chưa kiểm. Rủi ro: ở Dynamic Type lớn hoặc 320pt, NBSP buộc cả nhóm tên dài thành một khối không ngắt; chuỗi "Rau và quả" có thể tràn thay vì xuống dòng. Chưa có ảnh để biết.

### Màu lá tre
Kiểm bằng ảnh và grep `Tokens.Role.*`:
- Lá tre (`feedbackCorrect`/`textCorrect`) chỉ ở: triện ĐÚNG (LessonParts.swift:198, tone .correct), "Chính xác!"/"Đúng rồi!" (LessonParts.swift:206), viền lệch + nhãn "Đúng" của ô đúng (PaperChoice.swift:23, 137), từ điền đúng (QuestionViews.swift:224, chỉ khi `.correct`), ô tiến độ xong (ProgressSquares.swift:17), chỉ số nhóm chất đủ (PlayStep.swift:191). Ảnh: ô tiến độ xanh, "ĐÚNG RỒI!" xanh, chip "Bột đường" có tích xanh khi đủ, ô "air" viền xanh. **Đạt.**
- Vẫn đỏ son: nút "Tiếp", "Thử lại", "Kiểm tra"; "Đã xem" (LearnStep.swift:133, `Seal(icon:)` mặc định `.mark`); món trong mâm (PlayStep.swift:250; ảnh thấy hai triện đỏ ở Cơm, Kẹo); `ChosenSeal` (ScreenParts.swift:84). **Đạt.**
- Báo sai: ảnh "CHƯA ĐÚNG" là mẩu giấy lõm gấp góc, không đỏ, không X. **Đạt.**
- Nghi vấn ngoài danh sách của Duy/designer: `ProgressSquares` `.done` dùng chung cho Trang chủ (HomeScreen.swift:343) và Chủ đề (TopicScreen.swift:34), tức ô "bài đã học" cũng thành xanh. SK-006 chỉ liệt kê ô trong lượt học/thiết lập và ghi "chưa chắc" cho các ô đã học. Ảnh của tôi chỉ có 0/5 bài nên chưa thấy màu. Cần designer/Duy xác nhận.
- Chú thích cũ trong code: ProgressSquares.swift:5 vẫn viết "Done steps are đỏ son" và PaperChoice.swift:112 viết "mini seal (đỏ son...)". Nhỏ.

### Nghi lỗi khoảng trắng trước dấu chấm: **có thật**
- Ảnh ios-dev `compare/correct-green-states.png` (quiz q2): "energy ." và "năng lượng ." có khoảng trắng trước dấu chấm. Ảnh của tôi (warmup, `…08-warmup-right.png`) cũng cho khoảng rộng quanh "air": "and   air   to live." và "nước và   không khí   để sống".
- Nguyên nhân: QuestionViews.swift:220 gắn figure space (U+2007) **hai phía** từ điền (`"\u{2007}\(word)\u{2007}"`), để làm "chip". Nhưng nền chip lúc đã điền là `surfacePaper` (dòng 221), trùng đúng nền thẻ câu hỏi (cũng `surfacePaper`), nên chip vô hình; chỉ còn hai khoảng trắng thừa. Khi chữ điền ở cuối câu thì dấu chấm cách từ một figure space (~ chiều rộng một chữ số). Chip chỉ thấy được ở trạng thái trống (nền lõm).
- Mức: **L9 · nên sửa** (nhìn thấy ở mọi câu điền chỗ trống và ở cả Khởi động; đã xấu cả trước SK-013 nhưng ios-dev khẳng định chip làm "như canvas", canvas có nền chip khác nền thẻ).
- Mong đợi: từ điền sát dấu câu, hoặc chip nhìn thấy được. Thực tế: khoảng trắng thừa 2 bên. Cách xử lý đề xuất: bỏ khoảng trắng đệm phía sau khi segment kế tiếp bắt đầu bằng dấu câu (hoặc dùng thin/hair space), hoặc cho chip nền khác thẻ như canvas.

### Lỗi
| Mã | Mức | Mô tả | Tái hiện | Mong đợi | Thực tế | File |
| --- | --- | --- | --- | --- | --- | --- |
| L9 | nên sửa | Khoảng trắng thừa quanh từ điền đúng (đặc biệt trước dấu chấm) | Khởi động câu 1 hoặc Quiz q2, chọn từ đúng | "…energy." | "…energy ." và "and  air  to live." | QuestionViews.swift:220-221 |
| L10 | nhỏ | `settle()` không fail khi quá 10 s | đọc code | ghi nhận lỗi | chỉ in log, ẩn tối đa 10 s thời gian chờ | LessonUITests.swift:394-407 |
| L11 | nhỏ | Chú thích cũ "đỏ son" cho ô xong và triện đúng | đọc code | khớp lá tre | còn "đỏ son" | ProgressSquares.swift:5, PaperChoice.swift:112 |
| L12 | nhỏ | Audit Trang chủ vẫn báo Contrast ở hàng "Hành trình" và ô sao "0", Hồ sơ ở 4 avatar; test cho qua theo luật cho phép của SK-011 | log `audit[home]`, `audit[profile]` | luật hẹp tới ô icon | luật rộng, che được lỗi chữ thật | OnboardingUITests (allowed) |

Không có lỗi chặn.

### Chưa kiểm
- iPad mini, iPhone, Split View 1/3, Slide Over, công tắc Reduce Motion hệ thống (test skip). Ảnh ngang của Học và Chơi tôi chưa xem trực tiếp.
- Quiz câu 5 xoay: test xác nhận, nhưng không có ảnh sau xoay trong shots của tôi.

### Góp ý
- ios-dev: sửa L9; làm `settle` ghi `XCTIssue` khi hết 10 s; thu hẹp luật cho phép contrast (L12); cập nhật chú thích (L11); với hình thật của SK-018 chụp lại trạng thái sai để xác nhận L3.
- designer: canvas còn đỏ son ở ô xong (đã ghi); canvas chưa có bản đã điền từ trong thẻ cùng nền (chip không nhìn thấy); xác nhận màu ô "bài đã học" ở Trang chủ/Chủ đề; xoá bố cục B trong Home-iPad; canvas vẽ 6 chủ đề, app mới có 1.
- PM: sửa chữ tiêu chí #4 `TabView` thành "bố cục phone" nếu giữ `BottomNavStrip`.

## Sửa sau nghiệm thu (ios-dev, 29/10)

Duy giao sửa L9, L10, L11. L12 không nằm trong lượt này.

### Đã sửa
- **L9: khoảng trắng thừa quanh từ điền.**
  - Từ điền giờ là chữ trơn, tô màu theo trạng thái. Không còn U+2007 đệm và không còn nền chip.
  - Màu: lá tre (`textCorrect`) khi đã kiểm đúng, mực (`textPrimary`) khi đang chọn, chữ phụ (`textSecondary`) khi sai.
  - Từ nằm giữa dấu cách sẵn có của câu và dấu câu của câu, nên không có khoảng trắng trước dấu câu.
  - Ô trống giữ nguyên: ô lõm `surfaceSunken`, có "?" và figure space bên trong.
  - Code: tách phần ghép chuỗi ra `FillBlankSentence.sentence(_:filled:language:state:)` để test được.
- **Chọn bỏ đệm, không làm chip theo canvas.** Lý do:
  - Canvas có trạng thái đã điền ở `Discoverer-Warmup.dc.html` (dòng 137): chip `#FBF6EA` (`giay`, tức `surfacePaper`) nằm trên thẻ cũng `#FBF6EA`. Chip không có nền khác thẻ.
  - Chip chỉ nổi lên nhờ một khe lõm 80×34 (`diep_tham` + `shadow.sunken`) đặt dưới nó và bóng riêng của chip.
  - Một đoạn chữ `AttributedString` nằm trong câu không vẽ được lề trong, bóng, hay hai lớp nền lồng nhau. Làm đúng canvas phải dựng lại câu thành bố cục từng chữ (flow layout tự viết). Việc đó lớn hơn một lỗi "nên sửa", nên chưa làm (ghi ở Đề xuất).
  - Không thêm token mới.
  - Độ tương phản: lá tre trên thẻ giấy sáng 4,82:1.
- **L10: `settle()` fail khi quá 10 s.**
  - Hết 10 s thì gọi `XCTFail`. Thông báo có tên màn và những gì đang trên màn (`screenNow`), file và dòng là chỗ gọi.
  - Trong lượt chạy dưới không có lần nào quá hạn: màn đứng yên sau 0,5–0,9 s.
- **L11: chú thích cũ.**
  - `ProgressSquares.swift`: ô xong là lá tre (`feedback_correct`).
  - `PaperChoice.swift`, phần đầu `ChoiceState` và `ChoiceMark`: lá tre, nhắc tới `shadow.offset_correct` và `Seal.Tone.correct`.
  - Chú thích "đỏ son" ở dòng 7 của `PaperChoice.swift` cũng cũ nên sửa luôn.

### File
- `apps/ios/Packages/SKKit/Sources/LessonPlayer/Views/QuestionViews.swift` (L9)
- `apps/ios/Packages/SKKit/Tests/LessonPlayerTests/FillBlankSentenceTests.swift` (mới, L9)
- `apps/ios/Packages/SKKit/Package.swift`: `LessonPlayerTests` thêm phụ thuộc `DesignSystem` để so màu token.
- `apps/ios/ScienceKidsUITests/LessonUITests.swift` (L10)
- `apps/ios/Packages/SKKit/Sources/DesignSystem/Components/ProgressSquares.swift`, `PaperChoice.swift` (L11, chỉ sửa chú thích)

### Test mới (L9), `FillBlankSentenceTests`
- Câu q2, ô trống trước dấu chấm, chạy 3 trạng thái (đang chọn, đúng, sai):
  - EN ra đúng `"Carbohydrates give us energy."`, VI ra đúng `"Chất bột đường cho ta năng lượng."`.
  - Không có khoảng trắng nào (kể cả U+2007, U+00A0) trước `.,!?;:`, không có hai khoảng trắng liền nhau.
- Câu w1 của Khởi động, ô trống giữa câu, cùng 3 trạng thái:
  - EN `"… water and air to live."`, VI `"… nước và không khí để sống."`, mỗi bên đúng một dấu cách.
- Từ đã điền: không có nền chip; màu theo trạng thái (mực / lá tre / chữ phụ), cả EN và VI.
- Ô trống: vẫn `"\u{2007}\u{2007}?\u{2007}\u{2007}"` trên nền `surfaceSunken`, chữ `textSecondary`.

### Lượt chạy (1 lần, 1 máy)
- Build: `xcodebuild build-for-testing -project ScienceKids.xcodeproj -scheme ScienceKids -destination 'generic/platform=iOS Simulator' -derivedDataPath <dd-sk013>` → `** TEST BUILD SUCCEEDED **`.
  - Lần build đầu lỗi biên dịch trong test mới (`arguments` đọc biến `@MainActor`). Đã sửa thành `nonisolated static let` rồi build lại. Build không chạy test, không boot máy.
- Máy: chỉ boot iPad Pro 11-inch (M4) `AAE7F637-7D33-4C31-A495-BD329AF8A173`, iOS 18.4, 20:55–21:07.
- Lệnh: `xcodebuild test-without-building … -destination 'platform=iOS Simulator,id=AAE7F637-…'` với các `-only-testing`:
  - 8 bundle unit của SKKit: DesignSystem, ContentModel, LessonEngine, ContentKit, LessonPlayer, AudioKit, Profiles, Sync.
  - `ScienceKidsUITests/LessonUITests`, cả lớp.
  - `ScienceKidsUITests/IPadLayoutUITests/testScreensAndScreenshots`, để có ảnh Quiz q2.
- Kết quả: **`** TEST EXECUTE SUCCEEDED **`, exit 0. 194 test: 193 pass, 0 fail, 1 skip.**
  - Unit SKKit: 184/184 pass, gồm DesignSystem 37, ContentModel 20, LessonEngine 19, ContentKit 18, LessonPlayer 38 (34 cũ + 4 mới), AudioKit 13, Profiles 21, Sync 18.
  - `TokensExportTests` "one constant per leaf" pass.
  - UI: 10 test, 9 pass, 1 skip.
    - LessonUITests 8 pass + 1 skip, 595 s. Skip là `testGoldenPathWithSystemReduceMotion`, test tự skip vì cần bật công tắc hệ thống.
    - `IPadLayoutUITests.testScreensAndScreenshots` pass, 114 s.
  - Log `settle`: warmup 0,5 s, learn 0,9, play 0,7, quiz q5 0,6, q6 0,5, reward 0,5. Không có dòng "still moving", không có `XCTFail` từ `settle`.
- Đã `xcrun simctl shutdown` máy đó. `xcrun simctl list devices booted` ra 0 máy.
- Log và kết quả:
  - Log: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/fix/run.log`
  - Build: `…/sk-013/fix/build.log`
  - xcresult: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/dd-sk013/Logs/Test/Test-ScienceKids-2026.10.29_20-54-54-+0700.xcresult`
  - Log không có URL hay key.

### Ảnh
- Khởi động câu 1 sau khi chọn đúng: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/fix/shots/ipad-pro-11-inch-m4-ipad-08-warmup-right-portrait.png`
  - Hiện "and air to live." và "nước và không khí để sống.", từ điền màu lá tre, mỗi bên một dấu cách.
- Quiz q2 sau khi chọn đúng: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/fix/shots/ipad-pro-11-inch-m4-ipad-11-quiz-result-portrait.png`
  - Hiện "give us energy." và "cho ta năng lượng.", sát dấu chấm.
- Bản cắt phần câu: `…/sk-013/fix/compare/08-warmup-right-top.png`, `11-quiz-result-top.png`.
- Thêm: `…/fix/shots/ipad-pro-11-inch-m4-08-warmup-wrong.png` cho thấy ô trống "?" lõm vẫn như cũ.
- Thêm: `…/fix/shots/ipad-pro-11-inch-m4-11-quiz-q5-wrong.png` là ảnh L3 mới trên iPad.

### Còn chưa chắc
- Khi đang chọn (Quiz điền chỗ trống, trước "Kiểm tra"), từ đã điền màu mực, giống chữ thường của câu. Trước đây cũng vậy vì chip vô hình. Bé nhận ra chỗ đã điền nhờ chip trong ngân hàng từ đổi trạng thái. Canvas không có trạng thái này; designer cần quyết định có đánh dấu không.
- Chưa kiểm trên iPhone (luật 1 máy). Chuỗi ghép không phụ thuộc bề rộng, nhưng chưa nhìn tận mắt câu xuống dòng ở 390pt.

### Đề xuất (ghi lại, chưa làm)
- Nếu muốn từ điền đúng có chip như canvas (khe lõm + chip giấy sáng): dựng câu điền chỗ trống bằng bố cục từng chữ, giữ xuống dòng, Dynamic Type và VoiceOver đọc cả câu. Cần designer chốt trước.

## Từ điền chỗ trống không chip (designer, 29/10)

Duy giao: chọn cách hiện từ đã điền mà chưa bấm "Kiểm tra", và vẽ lại canvas khi không còn chip. Chỉ dùng được thuộc tính chữ trong một `AttributedString`: màu chữ, độ đậm, gạch chân, nền phẳng sát chữ.

### Quyết định: nền giấy phẳng sát chữ, không gạch chân
Áp như nhau cho dòng chính (`Tokens.Typography.sentence`, 19pt 700) và dòng phụ (`Tokens.Typography.body`, 15pt 400), dù dòng đó là EN hay VI. Nền của đoạn chữ chỉ phủ đúng các chữ của từ: không thêm ký tự đệm, không bo góc, không bóng. Từ nằm giữa dấu cách sẵn có của câu và dấu câu, như bản sửa L9.

| Trạng thái | Khi nào | Nền đoạn chữ | Màu chữ | Độ đậm | Gạch chân | Tương phản chữ/nền |
| --- | --- | --- | --- | --- | --- | --- |
| Ô trống | chưa điền | `surfaceSunken` `#E6D9BC`, giữ `"\u{2007}\u{2007}?\u{2007}\u{2007}"` | `textSecondary` | theo dòng | không | 6,89:1 |
| Đang chọn | đã điền, chưa "Kiểm tra" (`blankState == nil`) | `stateSelected` (vàng hoè `#E2A52A`) | `textPrimary` | `FontWeight.textBold` 700 | không | 7,88:1 |
| Đúng | đã kiểm, đúng | không có | `textCorrect` (lá tre `#3F7A33`) | `FontWeight.textBold` 700 | không | 4,82:1 trên `surfacePaper` |
| Sai | đã kiểm, sai: lần 1 trước "Thử lại", và lần cuối | `feedbackWrong` (giấy lõm `#E2D4B4`) | `textSecondary` | `FontWeight.textRegular` 400 | không | 6,56:1 |

Số đo theo WCAG 2.1, tính từ mã hex; đã ghi vào bảng tương phản trong `packages/design-tokens/README.md`.

Lý do:
- **Cùng màu với ô từ bên dưới.**
  - Vàng hoè là màu tấm giấy lệch sau ô từ đang chọn (`offset_accent`).
  - Giấy lõm là màu tấm giấy lệch và nhãn "Chưa đúng" khi sai (`offset_wrong`).
  - Lá tre chỉ dùng cho đúng. Không dùng đỏ son.
  - Bé nhìn thấy cùng một màu ở chữ trong câu và ở ô vừa chạm.
- **Phân biệt được khi không nhìn màu.**
  - Đang chọn: có nền, chữ đậm.
  - Đúng: không nền; từ nhập vào câu.
  - Sai: có nền, chữ mảnh.
  - Trên ảnh xám, nền vàng hoè cũng tối hơn hẳn nền giấy lõm.
- **Trạng thái sai cũ chưa đủ rõ, nên đổi.**
  - App đang tô `textSecondary` 700. Màu này chỉ khác chữ thường của câu 1,78:1, cùng độ đậm, nên trông gần như chữ thường.
  - Từ sai còn dễ bị đọc như một câu đúng ("Carbohydrates give us air.").
  - Chữ mảnh 400 trên nền giấy lõm cho thấy "từ này chưa vào được câu", khớp luật báo sai là giấy lõm.
- **Không gạch chân.** Đã dựng thử hướng A (gạch chân cùng màu chữ), xem ảnh so sánh ở dưới.
  - Vạch của Be Vietnam Pro nằm ở −75…−125 đơn vị, còn dấu nặng ở −88…−247 (đo trong file font của app), nên vạch đè lên dấu nặng: "lượng", "đạm", "kẹo", "đậu phụ".
  - CoreText vẽ vạch xuyên qua dấu, và SwiftUI không đổi được độ dày hay vị trí vạch.
  - Vạch lại là một nét; style E chỉ cho nét trong icon nhỏ.
  - Gạch chân vàng hoè chỉ đạt 2,02:1 trên giấy sáng, gần như không thấy.
- **Không chỉ đổi màu chữ** (ví dụ chàm), vì như vậy không phân biệt được khi không nhìn màu.
- **Không quay lại lỗi khoảng trắng thừa.**
  - Lỗi cũ do lề đệm nằm trên một nền trùng màu thẻ, nên thành khoảng trắng.
  - Nay không có lề, và nền khác màu thẻ.
  - Nền đoạn chữ là cách app đang vẽ ô trống "?", nên chiều cao miếng nền dự kiến giống ô đó.
- Nền đoạn chữ không cần đạt 3:1 với thẻ (vàng hoè 2,02, giấy lõm 1,36), vì không phải nguồn thông tin duy nhất: ô từ mang cùng màu và có nhãn chữ "Đúng", "Chưa đúng", "Đáp án".

### Việc cho ios-dev
1. **`FillBlankSentence.sentence(_:filled:language:state:)`** (QuestionViews.swift, khoảng dòng 204–253): thêm tham số vai chữ của dòng (`Tokens.Typography`) để dựng font cho đoạn chữ của từ. Dòng chính truyền `Tokens.Typography.sentence`, dòng phụ truyền `Tokens.Typography.body`. Với từ đã điền:
   - **Đang chọn** (`state == nil`):
     - `backgroundColor = Tokens.Role.stateSelected`
     - `foregroundColor = Tokens.Role.textPrimary`
     - `font` = vai của dòng, weight `Tokens.FontWeight.textBold`.
   - **`.correct`**:
     - không đặt `backgroundColor`
     - `foregroundColor = Tokens.Role.textCorrect`
     - weight `textBold`.
   - **`.wrong`**:
     - `backgroundColor = Tokens.Role.feedbackWrong`
     - `foregroundColor = Tokens.Role.textSecondary`
     - weight `Tokens.FontWeight.textRegular`.
   - Không đặt `underlineStyle` hay `strikethroughStyle`.
   - Không thêm ký tự đệm (U+2007, U+2009, U+200A, U+00A0) quanh từ.
2. **Font của đoạn chữ:** dựng `Tokens.Typography` cùng family, size, line height với vai của dòng, chỉ đổi `weight`, rồi lấy font bằng `SKFont.font(_:)`.
   - Cách này là `Font.custom(name, size:, relativeTo: .body)` nên vẫn co giãn theo Dynamic Type.
   - Trần `dynamicTypeSize` do `.typography(_:)` đặt trên `Text` áp cho cả câu.
   - Cùng family và cùng size nên chiều cao dòng không đổi.
3. **Cụm nhiều chữ không tách dòng:** trong đoạn chữ của từ, thay dấu cách bằng U+00A0, ví dụ "năng lượng". Miếng nền khi đó không bị cắt làm hai ở cuối dòng.
   - Chỉ thay trong từ điền; dấu cách của câu giữ nguyên.
   - Sửa chuỗi mong đợi trong `FillBlankSentenceTests` cho khớp, hoặc so sau khi đổi U+00A0 về dấu cách. Luật "không có khoảng trắng trước dấu câu" giữ nguyên.
4. **Ô trống giữ nguyên.**
5. **Test** (`FillBlankSentenceTests`): với q2 và w1, ở ba trạng thái, kiểm:
   - `backgroundColor` của đoạn chữ của từ: `stateSelected`, không có, `feedbackWrong`;
   - màu chữ;
   - font (tên face Bold hoặc Regular);
   - không có `underlineStyle`;
   - các đoạn chữ của câu không bị đổi nền.
6. **Sửa chú thích** của `FillBlankSentence` (dòng 208–221) theo luật mới. Bỏ câu "ink while the child is still choosing".
7. **Khởi động:** luồng giữ nguyên (chạm là trả lời). Thay đổi nhìn thấy được:
   - Từ đúng ở dòng VI thành đậm 700: "không khí".
   - Câu có từ hai chỗ trống trở lên sẽ hiện "đang chọn" khi mới điền một phần.
8. **Không cần export token:** `tokens.json` không đổi, `check:swift` vẫn khớp 179 = 179.
9. **Chụp lại để so canvas**, theo luật một máy, một lượt: Quiz q2 ở đang chọn, đúng, sai (lần 1) và sai lần cuối, trên một iPhone và iPad. Xem kỹ:
   - chiều cao miếng nền so với ô "?";
   - không có khoảng trắng thừa;
   - "năng lượng" không bị tách dòng ở 390pt.

### File canvas đã sửa
- **`design/play-ui/project/Discoverer-Warmup.dc.html`**
  - Bỏ chip và khe lõm ở từ đã điền, cả dòng EN và VI.
  - Khi đúng, "air" và "không khí" là chữ trơn lá tre 700, không tách dòng, không có hiệu ứng pop riêng.
  - Ô trống giữ nguyên.
  - Khởi động chạm là trả lời, nên màn này chỉ có ô trống và đúng. Khi sai, ô trống hiện lại như app.
- **`design/play-ui/project/Discoverer-QuizFill.dc.html`** (mới, 390×844) và **`Discoverer-QuizFill-iPad.dc.html`** (mới, 834×1194, khung giấy 600). Đây là Quiz câu 2 "Carbohydrates give us ___."
  - Tweak `blank`: trống, đang chọn (mặc định), đúng, sai, sai lần 2. Thêm tweak `showVi`.
  - Chạm trên bảng thì chạy tiếp như app: chọn hoặc gỡ từ → "Kiểm tra" → "Gần đúng!" kèm gợi ý và "Thử lại" → lượt 2 → kết quả. Kết quả có triện ĐÚNG và +10 XP, "Đúng rồi!", hoặc "Cùng xem lại nhé" kèm nhãn "Đáp án".
  - Nhãn trên ô từ nằm vắt qua mép trên như app.
  - Mọi trạng thái vừa khung. Trên phone, khoảng trống còn lại ít nhất 272px (đúng) và 280px (gợi ý mở).
- **`design/play-ui/project/canvas.json`**
  - Thêm 2 khung và thứ tự (`order`).
  - Khung Quiz câu 2 đặt trước câu 5. Quiz câu 5, câu 6, Thưởng và note Chuyển động dời sang phải 470. Quiz câu 5 iPad và note Quy tắc iPad dời 914. Không đổi tên khung nào.
  - Thêm note `discovererFillBlank` (bảng 4 trạng thái).
- **Không sửa:**
  - `Discoverer-Quiz.dc.html` và `Discoverer-Quiz-iPad.dc.html`: câu 5, chọn nhiều, không có chỗ trống.
  - `Discoverer-Play.dc.html` và `Discoverer-Play-iPad.dc.html`: "Mâm còn thiếu rau hoặc quả!" chỉ là lời báo, không có chip điền từ.
- **`packages/design-tokens/README.md`:** sửa các dòng "từ điền đúng trên chip giấy" trong bảng tương phản, thêm dòng `text_secondary` trên `feedback_wrong` và bảng "Từ điền chỗ trống". `tokens.json` không đổi.

### Ảnh (scratchpad của phiên)
Thư mục `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/designer-fill-blank/`:
- **So sánh hướng:**
  - `so-sanh-4-huong.png`: A gạch chân, B gạch chân vàng hoè, C nền vàng hoè, D chỉ đổi màu.
  - `so-sanh-gach-chan-va-nen.png`: A và hướng đã chọn, trên các từ có dấu nặng và ở chế độ VI trước.
  - `so-sanh-gach-chan-va-nen-xam.png`: cùng ảnh, chuyển xám.
- **Quiz câu 2, phone:** `Discoverer-QuizFill--empty.png`, `--chosen.png`, `--right.png`, `--wrong.png`, `--retrying.png`, `--wrong2.png`, `--hint.png`.
- **Quiz câu 2, iPad:** `Discoverer-QuizFill-iPad--…png`, cùng các trạng thái.
- **Khởi động:** `Discoverer-Warmup--empty.png`, `--right.png`, `--wrong.png`.

### Còn chưa chắc
- **Chiều cao nền đoạn chữ trong SwiftUI.**
  - Canvas (Chrome) vẽ nền cao bằng vùng chữ của font (ascent + descent).
  - App đang vẽ ô "?" cũng bằng nền đoạn chữ, và trông vừa. Nhưng chưa ai nhìn miếng vàng hoè trên máy, nhất là khi câu xuống hai dòng.
- **Mép nền sát chữ, không lề,** nên hơi giống bút dạ quang. Muốn có lề hay góc giấy thì phải dựng câu theo từng chữ (đề xuất cũ của ios-dev), không thêm ký tự đệm.
- **Canvas Khởi động không vẽ được "đang chọn" và "sai có từ",** vì màn này chạm là trả lời ngay, app cũng vậy. Hai trạng thái đó xem ở Quiz câu 2.
- **Ô trống trên canvas vẫn khác app:**
  - Canvas là khe lõm có bóng trong; ở Khởi động, dòng EN không có "?".
  - App là nền phẳng có "?".
  - Giữ nguyên theo yêu cầu.
- **Ô "air" đúng ở canvas Khởi động** vẫn là kiểu "đã dùng" lõm của canvas cũ; app dùng viền lệch lá tre. Chưa đồng bộ, ngoài phạm vi lượt này.
- **Đây là quyết định của designer theo giao việc.** Nếu Duy thích gạch chân hơn, đã có ảnh so sánh, nhưng phải chấp nhận vạch đè dấu nặng.

### Đề xuất (ghi lại, chưa làm)
- **Câu một chỗ trống:** khi ô đã có từ, chạm một từ khác hiện không có tác dụng (`tap(key:)` chỉ thêm khi còn chỗ). Đề xuất chạm từ khác thì thay luôn từ đang điền, cho bé đổi ý nhanh. Canvas Quiz câu 2 đang vẽ theo app hiện tại.
- **VoiceOver:** câu điền từ có thể đọc kèm trạng thái của từ ("đang chọn", "đúng", "chưa đúng"). Hiện trạng thái nằm ở ô từ (trait selected và nhãn).

## Làm theo designer, từ điền (ios-dev, 31/10)

Làm theo bảng 4 trạng thái của designer. Ngoài phạm vi lượt này:
- hai đề xuất của designer (chạm từ khác thì thay từ, VoiceOver đọc trạng thái);
- L12;
- đồng bộ ô trống của canvas với app.

`tokens.json` không đổi, không xuất lại token.

### Đã làm (theo 9 việc của designer)
1. `FillBlankSentence.sentence(_:filled:language:line:state:)` nhận thêm vai chữ của dòng (`line`). Dòng chính truyền `Tokens.Typography.sentence`, dòng phụ truyền `Tokens.Typography.body`. Từ đã điền theo bảng, gom trong `FilledWordLook`:
   - Đang chọn (`nil`): nền `stateSelected`, chữ `textPrimary`, 700.
   - Đúng: không nền, chữ `textCorrect`, 700.
   - Sai (lần 1 và lần cuối): nền `feedbackWrong`, chữ `textSecondary`, 400.
   - Không đặt gạch chân hay gạch ngang. Không có ký tự đệm.
2. Font: dựng `Tokens.Typography` cùng family, size, line height, tracking, case với vai của dòng, chỉ đổi weight, rồi lấy qua `SKFont.font(_:)`. Như vậy vẫn là `Font.custom(…, relativeTo: .body)`, theo Dynamic Type dưới trần của `.typography(_:)`.
3. Dấu cách trong từ đổi thành U+00A0 ("năng lượng", "không khí"). Dấu cách của câu giữ nguyên.
4. Ô trống giữ nguyên.
5. Test mở rộng trong `FillBlankSentenceTests` (mục Test).
6. Chú thích của `FillBlankSentence.sentence` viết lại theo bảng. Đã bỏ câu "ink while the child is still choosing".
7. Khởi động: luồng không đổi. Ảnh cho thấy "không khí" ở dòng VI giờ đậm 700, màu lá tre.
8. Không xuất token.
9. Chụp Quiz q2 ở 4 trạng thái trên iPhone 16 Pro. iPad không chụp: lượt này chỉ được 1 máy, và phiên chính không cho chạy `IPadLayoutUITests`.

UI test thêm cho ảnh:
- `LessonUITests.testScreenshots` chụp thêm q2 "đang chọn" (đã điền "energy", chưa kiểm) và "đúng".
- Test mới `LessonUITests.testFillBlankWrongTwice`:
  - q2 sai lần 1 ("air"): từ sai vẫn nằm trong câu, có gợi ý.
  - "Thử lại" làm chỗ trống thành "?" lại.
  - Sai lần cuối ("sunlight"): hiện "Cùng xem lại nhé".
  - Test kiểm nhãn của câu, và chỉ chụp ảnh khi có `SK_SCREENSHOT_DIR`.

### File đã đổi
- `apps/ios/Packages/SKKit/Sources/LessonPlayer/Views/QuestionViews.swift`: `FillBlankSentence`, `FilledWordLook` mới.
- `apps/ios/Packages/SKKit/Tests/LessonPlayerTests/FillBlankSentenceTests.swift`
- `apps/ios/ScienceKidsUITests/LessonUITests.swift`: ảnh q2 trong `testScreenshots`, thêm `testFillBlankWrongTwice`.

### Test (`FillBlankSentenceTests`, 5 test, đều pass)
- **Khoảng trắng.** q2 và w1, ở 3 trạng thái, trên cả 2 dòng, EN và VI:
  - Chuỗi ra đúng, ví dụ `"Chất bột đường cho ta năng\u{00A0}lượng."` và `"… nước và không\u{00A0}khí để sống."`.
  - Không có khoảng trắng nào (kể cả U+2007, U+00A0) trước dấu câu, và không có hai khoảng trắng liền nhau.
- **Nhìn.** q2 và w1 × EN/VI × 2 dòng × 3 trạng thái:
  - Từ là một đoạn chữ riêng.
  - Nền, màu chữ và face khớp bảng. Face so bằng `SKFont.font(...)` của vai dòng với weight 700 hoặc 400, và phải khác face còn lại.
  - Không có gạch chân hay gạch ngang, kiểm cả khoá SwiftUI lẫn UIKit.
  - Các đoạn khác của câu không có nền, màu hay font riêng.
- Chỉ dấu cách trong từ đổi thành U+00A0; câu giữ dấu cách thường.
- Ô trống vẫn là `"\u{2007}\u{2007}?\u{2007}\u{2007}"` trên `surfaceSunken`, chữ `textSecondary`, không đặt font riêng.

### Lượt chạy (1 lần, 1 máy)
- Build: `xcodebuild build-for-testing … -destination 'generic/platform=iOS Simulator' -derivedDataPath <dd-sk013>` → `** TEST BUILD SUCCEEDED **`, không có cảnh báo mới.
- Máy: iPhone 16 Pro `14DF158D-5ED6-49CF-80A5-7519B0D594F5`, iOS 18.4, 13:50–14:02 ngày 31/10. Không đụng CA của tester.
- Lệnh: `xcodebuild test-without-building … -destination 'platform=iOS Simulator,id=14DF158D-…'` với `-only-testing` cho 8 bundle unit của SKKit và `ScienceKidsUITests/LessonUITests`. Không chạy AudioUITests hay IPadLayoutUITests.
- Kết quả: **`** TEST EXECUTE FAILED **`, exit 65. 195 test: 193 pass, 1 fail, 1 skip. Không chạy lại.**
  - Unit SKKit 185/185 pass:
    - DesignSystem 37, ContentModel 20, LessonEngine 19, ContentKit 18, AudioKit 13, Profiles 21, Sync 18.
    - LessonPlayer 39 = 34 cũ + 5 mới.
  - LessonUITests: 8 pass, 1 skip, **1 fail**.
    - Pass gồm `testFillBlankWrongTwice` (50 s) và `testScreenshots` (115 s).
    - Skip: `testGoldenPathWithSystemReduceMotion` (cần bật công tắc hệ thống).
- **Fail: `testAccessibilityAudit`** (LessonUITests.swift:385), ở màn **Học**, không ở câu điền chỗ trống.
  - Audit báo `Contrast failed` cho 4 chữ VI dưới các thẻ "Từ mới": 'chất dinh dưỡng' và 'chất bột đường' ở y = 763, 'chất đạm' và 'chất béo' ở y = 827. Màn iPhone 16 Pro cao 874.
  - Ảnh `iphone-16-pro-09-learn.png` cho thấy hàng thẻ "Từ mới" nằm khuất sau thanh đáy (dòng "Chạm hết các nhóm…" và nút "Chơi thôi"). Vì vậy audit đo chữ trên nền của thanh đáy.
  - Lượt test SK-012 trên iPhone 16 Pro không có lỗi này. SK-013 nâng thẻ "Từ mới" lên 56pt (màn dài thêm) và mới chỉ kiểm trên iPad, nơi còn chỗ. Tôi **đoán** đây là nguyên nhân, **chưa chứng minh**.
  - Chưa sửa, chưa chạy lại. Hướng sửa ở mục Đề xuất.
  - Log: `audit[learn]: 1 Contrast failed · 48 'chất dinh dưỡng' (45.0, 763.17, 97.0, 15.33)`.
- `settle`: màn đứng yên sau 0,4–1,0 s, không có "still moving".
- Lúc bắt đầu, iPad Pro 11 đang ở trạng thái Booted. Máy này không phải tôi bật: lần trước tôi đã shutdown và `booted` ra 0. Không có `xcodebuild` nào chạy trên máy đó, và tôi không đụng vào. Sau lượt chạy, tôi `xcrun simctl shutdown` iPhone 16 Pro, và `xcrun simctl list devices booted` ra **0 máy** (iPad cũng đã tắt).
  - Khoảng 14:03, iPhone 16 Pro lại được boot. Không phải tôi: chỉ thấy `launchd_sim` và luồng log của panel Simulator trong app Claude, không có `xcodebuild`.
  - Tôi không tắt lần nữa, vì có thể agent khác đang dùng. Phiên chính kiểm và tắt nếu máy rảnh.
- Log và kết quả:
  - Log: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/fill-word/logs/run.log`
  - Build: `…/fill-word/logs/build.log`
  - xcresult: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/dd-sk013/Logs/Test/Test-ScienceKids-2026.10.31_13-50-35-+0700.xcresult`
  - Log không có URL hay key.

### Ảnh (iPhone 16 Pro, 402 × 874 pt)
Quiz q2, cả dòng EN và VI:
- Đang chọn: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/fill-word/shots/iphone-16-pro-11-quiz-q2-chosen.png`
- Đúng: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/fill-word/shots/iphone-16-pro-11-quiz-q2-right.png`
- Sai lần 1: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/fill-word/shots/iphone-16-pro-11-quiz-q2-wrong.png`
- Sai lần cuối: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/fill-word/shots/iphone-16-pro-11-quiz-q2-wrong-last.png`

So sánh và ảnh phóng:
- Canvas và app cạnh nhau: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/fill-word/compare-q2-canvas-vs-app.png`
- Phóng to nền chữ (đang chọn, sai): `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/fill-word/zoom-chosen-and-wrong.png`

Khởi động câu 1 đúng:
- `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/fill-word/shots/iphone-16-pro-08-warmup-right.png`
- Bản cắt: `…/fill-word/warmup-right-crop.png`

Màn Học có lỗi audit: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/fill-word/shots/iphone-16-pro-09-learn.png`

Chỗ designer lo, thấy trên ảnh:
- **Chiều cao miếng nền:** nền phủ từ đỉnh chữ tới đáy phần chữ thòng, tức cao bằng dòng chữ và bằng ô "?". Dấu nặng của "lượng" nằm trong nền. Hai dòng không chạm nhau.
- **Xuống dòng:** "năng lượng" nằm trọn một dòng, miếng nền không bị cắt. Dòng EN "Carbohydrates give us energy." xuống dòng ở 402pt, nhưng iOS ngắt trước "us" ("…give / us energy."), không để "energy." đứng một mình. Đó là cách ngắt dòng mặc định của iOS (tránh một chữ đứng trơ ở dòng cuối). Miếng nền "energy" vẫn liền.
- **Khoảng trắng:** không có khoảng trắng thừa trước dấu chấm hay quanh từ.

### Chỗ khác canvas
- Chỗ ngắt dòng EN: canvas (390, Chrome) ngắt "…give us / energy.", app ngắt "…give / us energy.". Ở "air" (từ ngắn) câu vừa một dòng trên app.
- Canvas có icon bóng đèn ở nút "Gợi ý", app không có (từ SK-012).
- **Nhãn trên ô từ (ngân hàng từ):** khác canvas, có từ SK-012, chưa sửa vì ngoài phạm vi.
  - Canvas gắn nhãn vắt mép trên ô: "ĐÚNG" ở energy khi đúng, "CHƯA ĐÚNG" ở air khi sai lần 1, "ĐÁP ÁN" ở energy và "CHƯA ĐÚNG" ở sunlight khi sai lần cuối.
  - App chỉ có tấm giấy lệch (lá tre khi đúng, giấy lõm khi sai) sau ô từ, không có nhãn chữ.
  - Bảng của designer dựa vào các nhãn này để nói nền đoạn chữ không cần đạt 3:1. Trên app hiện chỉ còn tiêu đề tờ kết quả ("Chính xác!", "Gần đúng!", "Cùng xem lại nhé") và triện ĐÚNG mang thông tin bằng chữ.
  - Cần designer và phiên chính quyết có thêm nhãn cho ô từ không.

### Còn chưa chắc
- **Fail audit ở màn Học trên iPhone** (ở trên): nguyên nhân mới là suy đoán.
- **iPad và iPhone nhỏ:** chưa chụp lại 4 trạng thái trên iPad (luật 1 máy). Chưa xem ở iPhone 16e (375pt), nơi câu VI dễ xuống dòng hơn.
- **Dynamic Type lớn:** chưa nhìn bằng mắt. Font của từ dùng cùng cơ chế co giãn với dòng, nhưng chưa có ảnh.

### Đề xuất (ghi lại, chưa làm)
- **Lỗi audit ở màn Học, chọn một trong hai:**
  - (a) Audit ở Học chạy sau khi cuộn để hàng "Từ mới" lộ ra khỏi thanh đáy, hoặc chạy hai lần: trên và dưới.
  - (b) Bỏ qua các phần tử bị thanh đáy che. Cách này cần đo khung, không phải nới luật cho phép (L12).
- Cần phiên chính chọn, rồi chạy lại `testAccessibilityAudit` trên iPhone.

### Sửa audit màn Học: cuộn trước khi audit (ios-dev, 31/10)
Duy chọn cách (a). Chỉ sửa `apps/ios/ScienceKidsUITests/LessonUITests.swift`. Không đổi code app, không đụng `allowed(...)`, không thêm bỏ qua theo nhãn hay loại audit.

**Cách sửa**
- Trước `audit("learn")`, hàm `scrollWordListAboveBottomBar` kéo trang lên vừa đủ: kéo chậm, không vuốt văng, bắt đầu ở hình của thẻ nhóm.
- Sau khi kéo, test đo bằng frame. Hai điều kiện phải đúng:
  - đáy mọi thẻ `lesson.word_list.*` ≤ đỉnh thanh đáy, tính bằng đỉnh dòng "Chạm hết các nhóm…" (hoặc nút "Chơi thôi") trừ 8pt lề của `BottomBar`;
  - đỉnh các thẻ vẫn ≥ đỉnh màn.
- Không đạt thì `XCTFail` kèm số đo và không audit màn Học. Kéo tối đa 3 lần.
- Audit xong thì cuộn về đầu trang rồi chạy tiếp `doLearn`.
- Ảnh màn lúc audit được gắn vào xcresult (`audit-learn`) và lưu vào `SK_SCREENSHOT_DIR`.

**Số đo của lượt chạy**
- Trước khi kéo: thẻ ở y = 733–853, đỉnh thanh đáy 736.
- Sau 1 lần kéo (123pt): thẻ ở y = 610–730, đỉnh thanh đáy 736. Gồm dòng nhắc (y = 744) và nút (y = 767). Màn 402 × 874.

**Phần lượt audit Học không chấm**
- Phần cuộn khỏi đầu màn: nút quay lại, tiêu đề bài, dòng phụ.
- Dải ô bước nằm sát mép trên, chỉ lộ một phần.
- Cùng thành phần đầu bài này vẫn được chấm ở audit Khởi động và Chơi.
- Thẻ "Em kể được…", 4 nhóm chất, thẻ nhóm và hàng "Từ mới" nằm trọn trong màn và được chấm.

**Kết quả**
- Máy: iPhone 16 Pro `14DF158D-5ED6-49CF-80A5-7519B0D594F5`, đang Booted sẵn. Chạy `LessonUITests` 1 lần, 14:36–14:47.
- Build `generic/platform=iOS Simulator`: `** TEST BUILD SUCCEEDED **`.
- `** TEST EXECUTE SUCCEEDED **`, exit 0. **10 test: 9 pass, 0 fail, 1 skip.**
  - Skip: `testGoldenPathWithSystemReduceMotion`, cần bật công tắc hệ thống.
  - `testAccessibilityAudit` pass, 114 s. Audit Học không còn báo Contrast ở 4 chữ VI của "Từ mới", và không có lỗi mới.
  - Kết luận: lần fail trước là do thanh đáy che thẻ, không phải lỗi màu.
- Sau lượt chạy, tôi `xcrun simctl shutdown` máy đó. `xcrun simctl list devices booted` ra 0 lúc 14:47.

**Đường dẫn**
- Log: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/audit-learn/logs/run.log`
- Build: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/audit-learn/logs/build.log`
- Ảnh màn Học lúc audit: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/audit-learn/iphone-16-pro-audit-learn.png`
- Các ảnh khác của `testScreenshots` và `testFillBlankWrongTwice` cũng nằm trong thư mục `audit-learn/`.
- xcresult: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/dd-sk013/Logs/Test/Test-ScienceKids-2026.10.31_14-35-49-+0700.xcresult`

## Nhãn ô từ câu điền (ios-dev, 31/10)

Duy chọn thêm nhãn ĐÚNG / CHƯA ĐÚNG / ĐÁP ÁN cho ô từ trong ngân hàng từ, như canvas `Discoverer-QuizFill`. Ngoài phạm vi lượt này: icon bóng đèn, L12, iPad.

### Đã làm
- `BankChips` truyền nhãn vào `PaperChoiceStyle(state:mark:)`, dùng lại `ChoiceMark` của ô chọn (q5). Không có component mới, không có token mới.
- Ô nào mang nhãn gì do hàm mới `BankChips.wordMarkKey(display:key:correct:)` quyết, và chỉ khi đã "Kiểm tra":
  - Đúng: "Đúng" trên từ đã điền (triện lá tre nghiêng).
  - Sai lần 1: "Chưa đúng" trên từ đã điền (mẩu giấy lõm gấp góc). Không lộ từ đúng, để lượt 2 bé vẫn phải nghĩ.
  - Sai lần cuối: "Chưa đúng" trên từ đã điền, "Đáp án" trên từ đúng (mẩu vàng hoè nhạt).
  - Đang chọn và sau "Thử lại": không có nhãn. Nhãn mất cùng lúc chỗ trống về "?"; UI test kiểm.
  - Khởi động (chạm là trả lời): từ sai chỉ bị làm mờ, không có nhãn, như canvas `Discoverer-Warmup`. Đây là chỗ khác ô chọn của Khởi động, nơi ô sai vẫn hiện "Chưa đúng".
- Chữ nhãn lấy từ string catalog có sẵn (`lesson.mark.correct` / `.wrong` / `.answer`). Đã tách `markKey(for:multi:)` ra để test được; `markText` vẫn như cũ.
- VoiceOver: nút ô từ có `accessibilityValue` là chữ nhãn. Kết quả trong log UI: "energy, Đúng", "air, Chưa đúng", "energy, Đáp án" và "sunlight, Chưa đúng".
- Tương phản chữ nhãn, tính từ hex của token:
  - "Đúng": `text_on_accent` trên lá tre, 4,82:1.
  - "Chưa đúng": `text_primary` trên giấy lõm, 11,68:1.
  - "Đáp án": `text_primary` trên `feedback_missed`, 10,79:1.

### File đã đổi
- `apps/ios/Packages/SKKit/Sources/LessonPlayer/Views/QuestionViews.swift`: `markKey(for:multi:)`, `BankChips.wordMarkKey`, nhãn và `accessibilityValue` của ô từ.
- `apps/ios/Packages/SKKit/Tests/LessonPlayerTests/BankChipMarkTests.swift` (mới, 6 test):
  - đúng;
  - sai lần 1;
  - sai lần cuối;
  - đang chọn và sau "Thử lại";
  - Khởi động có từ đã thử;
  - các khoá nhãn giống ô chọn.
- `apps/ios/ScienceKidsUITests/LessonUITests.swift`:
  - thêm `expectWordMarks`, đọc nhãn và value của từng ô từ;
  - `answerRight` kiểm "Đúng" ở câu điền. Luồng vàng, 4/6 và `testFillBlankWrongTwice` đều đi qua chỗ này.
  - `testFillBlankWrongTwice` kiểm nhãn ở sai lần 1, sau "Thử lại" và sai lần cuối.

### Lượt chạy (1 lần, 1 máy)
- Build `generic/platform=iOS Simulator`: `** TEST BUILD SUCCEEDED **`, không có cảnh báo mới.
- Máy: iPhone 16 Pro `14DF158D-5ED6-49CF-80A5-7519B0D594F5`, đang Booted sẵn nên dùng luôn. Chạy 16:01–16:12.
- Lệnh: 8 bundle unit của SKKit và `ScienceKidsUITests/LessonUITests`, trong một lần `xcodebuild test-without-building`.
- Kết quả: **`** TEST EXECUTE SUCCEEDED **`, exit 0. 201 test: 200 pass, 0 fail, 1 skip.**
  - Unit SKKit 191/191 pass. LessonPlayer 45, gồm 6 test mới.
  - LessonUITests 9 pass, 1 skip (`testGoldenPathWithSystemReduceMotion`). `testAccessibilityAudit` vẫn pass.
- Sau lượt chạy, tôi `xcrun simctl shutdown` máy đó. `booted` ra 0 lúc 16:12 và 16:15.
- Đường dẫn:
  - Log: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/fill-labels/logs/run.log`
  - Build: `…/fill-labels/logs/build.log`
  - xcresult: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/dd-sk013/Logs/Test/Test-ScienceKids-2026.10.31_16-01-12-+0700.xcresult`

### Ảnh (iPhone 16 Pro)
Quiz q2:
- Đúng: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/fill-labels/shots/iphone-16-pro-11-quiz-q2-right.png`
- Sai lần 1: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/fill-labels/shots/iphone-16-pro-11-quiz-q2-wrong.png`
- Sai lần cuối: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/fill-labels/shots/iphone-16-pro-11-quiz-q2-wrong-last.png`

So sánh và ảnh phóng:
- Canvas cạnh app (3 trạng thái): `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/fill-labels/compare-q2-labels-canvas-vs-app.png`
- Phóng hàng ô từ: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/fill-labels/zoom-cells.png`

### Chưa đạt: nhãn chạm và che chữ của ô từ
**Hiện tượng.** Trên ảnh phóng:
- "CHƯA ĐÚNG" che phần đầu các nét cao của "sunlight" (l, h, t).
- Triện "ĐÚNG" chạm vào "energy".
- "ĐÁP ÁN" sát đỉnh "energy".
- "air" thì còn cách 4pt.

Yêu cầu "không để nhãn che chữ của ô" vì vậy **chưa đạt**.

**Nguyên nhân: cách đặt "vắt mép" của L3 chưa bao giờ chạy.**
- Đo pixel ở ảnh sai lần 1 (cột x = 720px): mẩu giấy lõm chạy từ y = 830 tới 893, ô từ chạy từ y = 830 tới 997. Nhãn nằm **trong** ô, đỉnh nhãn trùng đỉnh ô, chứ không vắt qua mép.
- Ảnh q5 của lượt này cũng vậy (`…/fill-labels/shots/iphone-16-pro-11-quiz-q5-wrong.png`). Tester mô tả ảnh L3 cũng là "chạm vào cạnh trên".
- Trong `ChoiceFace` (PaperChoice.swift), `.alignmentGuide(.top)` nằm bên trong `if let` của `overlay`. SwiftUI bỏ alignment guide khi nó nằm trong nhánh `if` của builder.
- Đã kiểm bằng `ImageRenderer` trên macOS (`/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/fill-labels/align-probe.swift`):
  - không có `if`: nhãn vắt mép;
  - có `if`: đỉnh nhãn trùng đỉnh ô;
  - bọc `ZStack { if … }` rồi mới đặt `alignmentGuide`: nhãn vắt mép trở lại.
- Ô ảnh của q5 cao 104pt nên nhãn nằm trong ô không che chữ. Ô từ chỉ cao 56pt, chữ 19pt nằm giữa, nên nhãn cao khoảng 21pt chạm vào chữ.

**Chưa sửa, vì:**
- Sửa `ChoiceFace` đổi vị trí nhãn của **mọi** ô trả lời, cả q5.
- Vị trí vắt mép đang chờ Duy chốt.
- Lượt chạy duy nhất đã dùng.

**Đề xuất, cần phiên chính và Duy chọn:**
- (a) Sửa `ChoiceFace`: bọc phần trong overlay bằng `ZStack` rồi đặt `alignmentGuide` và `offset` ở ngoài, khoảng 3 dòng. Nhãn ở mọi ô sẽ vắt mép như L3 định làm và như canvas QuizFill. Sau đó chạy lại 1 lần `LessonUITests` và unit `DesignSystem`.
- (b) Giữ nhãn trong ô, nhưng đẩy chữ của ô từ xuống (lề trên lớn hơn) hoặc tăng chiều cao ô từ. Cách này khác canvas.

### Chỗ khác canvas
- Vị trí nhãn: canvas vắt mép trên ô; app nằm trong ô sát mép trên (lỗi ở trên). Nhãn ở góc phải, cách mép phải 6pt (`markInsetCompact`). Canvas đặt "ĐÁP ÁN" lệch giữa hơn một chút.
- Khởi động: từ sai không có nhãn (khớp canvas Warmup), khác ô chọn của Khởi động.
- Nút "Gợi ý" thiếu icon bóng đèn (ngoài phạm vi).

### Còn chưa chắc
- Chưa xem trên iPad (ô từ 3 cột, cao 56pt, cùng nguy cơ chạm chữ) và iPhone 16e.
- Chưa nghe VoiceOver thật. Mới đọc label và value bằng UI test.

## Nhãn vắt mép (ios-dev, 31/10)

**Duy chốt (a) ngày 31/10:** nhãn ĐÚNG / CHƯA ĐÚNG / ĐÁP ÁN / BỎ SÓT vắt qua mép trên ở **mọi** ô trả lời (ô ảnh câu 5, ô từ câu điền, thẻ đúng/sai), như canvas `Discoverer-QuizFill`. Quyết định này cũng đóng câu hỏi "nhãn vắt mép" còn mở từ L3.

**L3 trước đây chưa chạy.** Bản sửa L3 (SK-013, 29/10) đặt `.alignmentGuide(.top)` bên trong `if let` của `overlay`. SwiftUI bỏ alignment guide ở đó, nên từ 29/10 tới nay nhãn nằm **trong** ô, đỉnh nhãn trùng đỉnh ô. Ô ảnh q5 cao 104pt nên không thấy lỗi; ô từ cao 56pt thì nhãn chạm chữ. Tester đã tả đúng là "chạm vào cạnh trên".

### Đã sửa
- **`ChoiceFace` (`PaperChoice.swift`)**: bọc phần nhãn bằng `ZStack { if … }`, rồi đặt `.alignmentGuide(.top)` và `.offset(x:)` lên `ZStack`. Giữa nhãn giờ nằm đúng mép trên ô. Không đổi kích thước ô, không thêm token.
- **Chỗ trống phía trên hàng ô.** Thêm `PaperMetrics.markRoomAbove = Tokens.Space.s6` (6pt), đặt làm `padding(.top)` cho 3 vùng trả lời: `ChoiceCells`, `TrueFalseCards`, `BankChips`. Lý do:
  - Mẩu nhãn cao khoảng 21pt, nhô lên khoảng 10,5pt.
  - Triện "Đúng" nghiêng 8° cao khoảng 28pt, nhô lên khoảng 14pt.
  - Khoảng cách 12 có sẵn phía trên hàng (`LessonMetrics.gap`) không đủ cho triện, nó sẽ chạm dòng "Chọn từ còn thiếu" hoặc đáy tờ câu hỏi. Canvas để `top: -10px` dưới khe 12px, chỉ còn khoảng 2px.
  - Khoảng trống này có cả khi chưa có nhãn, nên màn không nhảy khi nhãn hiện ra.
- **Test chặn tái phát `ChoiceMarkPlacementTests`** (DesignSystemTests, 4 test). Test dựng `ChoiceFace` thật bằng `ImageRenderer` rồi đo pixel, với ô 56pt (ô từ) và 104pt (ô ảnh câu 5):
  - mẩu "Đáp án": giữa mẩu cách mép trên ô không quá 1,5pt;
  - mẩu "Chưa đúng": nửa mẩu nằm trên mép (sai số 1,5pt);
  - triện "Đúng": đỉnh triện cao hơn mép ít nhất 8pt, và không vượt quá 12 + 6 − 2;
  - ô không có nhãn: không vẽ gì phía trên ô.
  - Số đo trong lượt chạy (font dự phòng của unit test): mẩu cao 19,5pt, vùng 30,0–49,5, giữa 39,75; mép ô ở 40–40,5. Triện nhô 13pt.
- **`LessonUITests.testScreenshots`** chụp thêm thẻ Khởi động câu 2 sai (`08-warmup-2-wrong`).

### File đã đổi
- `apps/ios/Packages/SKKit/Sources/DesignSystem/Components/PaperChoice.swift`
- `apps/ios/Packages/SKKit/Sources/DesignSystem/Components/PaperMetrics.swift` (`markRoomAbove`)
- `apps/ios/Packages/SKKit/Sources/LessonPlayer/Views/QuestionViews.swift` (khoảng trống trên 3 vùng trả lời)
- `apps/ios/Packages/SKKit/Tests/DesignSystemTests/ChoiceMarkPlacementTests.swift` (mới)
- `apps/ios/ScienceKidsUITests/LessonUITests.swift` (ảnh Khởi động câu 2 sai)

### Lượt chạy (1 lần, 1 máy)
- Build `generic/platform=iOS Simulator`: `** TEST BUILD SUCCEEDED **`, không có cảnh báo mới.
- Máy: iPhone 16 Pro `14DF158D-5ED6-49CF-80A5-7519B0D594F5`. Lúc bắt đầu không máy nào bật, tôi chỉ boot máy này. Chạy 22:57–23:09.
- Lệnh: 8 bundle unit của SKKit (gồm DesignSystem) và `ScienceKidsUITests/LessonUITests`, trong một lần `xcodebuild test-without-building`.
- Kết quả: **`** TEST EXECUTE SUCCEEDED **`, exit 0. 205 test: 204 pass, 0 fail, 1 skip.**
  - Unit SKKit 195/195 pass:
    - DesignSystem 41 (gồm 4 test mới), ContentModel 20, LessonEngine 19, ContentKit 18;
    - LessonPlayer 45, AudioKit 13, Profiles 21, Sync 18.
  - LessonUITests: 9 pass, 1 skip (`testGoldenPathWithSystemReduceMotion`).
    - Nhãn và value của ô từ vẫn đúng ở mọi trạng thái.
    - `testAccessibilityAudit` pass.
- Sau lượt chạy, tôi `xcrun simctl shutdown`. `booted` ra 0 lúc 23:09.

### Đo trên ảnh (iPhone 16 Pro, pt)
- **q2 sai lần 1:** mẩu "Chưa đúng" nằm từ 272,0 tới 293,0, mép ô ở 282,7, tức nhô lên 10,7 và vào trong ô 10,3. Đáy chữ dòng "Chọn từ còn thiếu" ở cùng cột là 260,7, cách nhãn 11,3.
- **q2 đúng:** triện cao tới 286,7 (ở cột x = 115), mép ô 298,7, tức nhô lên 12. Đáy chữ dòng phía trên ở 276,7, cách triện 10.
- **q2 sai lần cuối:** hai mẩu nằm từ 288,0 tới 309,0. Nét cao của "sunlight" bắt đầu ở 319,3, cách đáy mẩu 10,3.
- **Kết luận:** nhãn không che chữ hay hình của ô, không bị cắt, không chạm dòng phía trên hàng.
- **q5 hàng 2 (đúng lần 2, triện trên "tofu"):** đỉnh triện ở 435,3, đáy ô "rice" hàng trên ở 434,0, chỉ cách 1,3. Triện chạm mép giấy của ô hàng trên.
  - Không che chữ hay hình: chữ "cơm" cách đáy ô hơn 10.
  - Khe giữa hai hàng là 12 (token `layout.grid.quiz`, iPad 14), tôi giữ nguyên. Ghi cho designer ở dưới.

### Ảnh
Thư mục `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/labels-straddle/`.

So sánh:
- q2 cạnh canvas QuizFill (đúng, sai lần 1, sai lần cuối): `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/labels-straddle/compare-q2-canvas-vs-app.png`
- q5 trước và nay, kèm hàng 2: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/labels-straddle/compare-q5-before-after.png`
  - Chưa có bản render canvas q5 phone có nhãn để ghép. Canvas q5 đặt nhãn trong góc (`top: 6px`).
- Khởi động câu 2 sai: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/labels-straddle/warmup-2-wrong.png`
  - Canvas Warmup không có trạng thái này cho thẻ đúng/sai.
- Phóng hàng ô từ q2: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/labels-straddle/zoom-q2-cells.png`

Ảnh gốc, trong `…/labels-straddle/shots/`:
- `iphone-16-pro-11-quiz-q2-right.png`
- `iphone-16-pro-11-quiz-q2-wrong.png`
- `iphone-16-pro-11-quiz-q2-wrong-last.png`
- `iphone-16-pro-11-quiz-q5-wrong.png`
- `iphone-16-pro-11-quiz-q5-right-later.png`
- `iphone-16-pro-08-warmup-2-wrong.png`

Log và kết quả:
- Log: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-013/labels-straddle/logs/run.log`
- Build: `…/labels-straddle/logs/build.log`
- xcresult: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/dd-sk013/Logs/Test/Test-ScienceKids-2026.10.31_22-57-44-+0700.xcresult`

### Designer cần cập nhật canvas
1. **`Discoverer-Quiz.dc.html`:** 6 nhãn của ô câu 5 đang `right: 6px; top: 6px` (khoảng dòng 109–145). Đổi sang vắt mép như QuizFill (`top: -10px`).
2. **`Discoverer-Quiz-iPad.dc.html`:** 6 nhãn đang `right: 8px; top: 8px`. Đổi vắt mép tương tự.
3. **Khoảng trống trên hàng ô:** app thêm 6pt trên hàng ô trả lời, nên dòng phía trên cách đỉnh ô 18pt. Canvas đang 12px. Đề nghị thêm 6px cho khớp, ở cả QuizFill.
4. **Hàng 2 của câu 5:** với khe 12 (iPad 14), triện "Đúng" ở hàng 2 chạm mép đáy ô hàng 1. Designer chọn giữ, hoặc tăng khe giữa hai hàng (đổi token `layout.grid.quiz` thì cần `dev` xuất lại).
5. **Thẻ đúng/sai** (Khởi động câu 2, Quiz câu 6): app hiện "Chưa đúng" vắt mép trên thẻ đã chọn sai. Canvas chưa vẽ trạng thái này.
6. Canvas Chơi (`Discoverer-Play*.dc.html`, `top: 6px`) là triện "đã chọn" của kệ món, không phải nhãn chấm. Không thuộc việc này, giữ nguyên.

### Còn chưa chắc
- Chưa xem trên iPad (khe 14, lề nhãn 8) và iPhone 16e.
- Chưa xem màn Gallery (debug), nơi cũng dùng `PaperChoiceStyle` có nhãn.
- Chưa xem Dynamic Type lớn. Chữ nhãn dùng `fixedBox` nên có trần, nhưng chưa nhìn bằng mắt.
