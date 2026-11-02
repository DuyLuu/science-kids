# SK-011 · Luồng mở app iOS: Chào mừng → Tạo hồ sơ → Trang chủ → Chủ đề

Trạng thái: review · Ngày: 2026-10-28 · Phụ trách: ios-dev · Tester: tester
Nguồn: docs/ios-test-build.md mốc 1 việc I7 và bảng "Cắt gì để nhanh"; technical-plan.md B4.1 (`voice_mode`, mặc định gợi ý theo chế độ ngôn ngữ), B7.6 (điều hướng), B7.9 (chuỗi giao diện), B12 (dữ liệu tối thiểu), B18 #14 (chọn đủ lớp); prd.md mục 6; canvas Discoverer 1 Chào mừng (`Discoverer-Welcome.dc.html`), 2 Hồ sơ của bé (`-Profile`), 4 Trang chủ (`-Home`), 5 Chủ đề (`-Topic`)

## Mục tiêu
Bố mẹ mở app lần đầu, chọn chế độ học và giọng đọc, tạo hồ sơ cho bé, rồi bé thấy Trang chủ và màn Chủ đề với bài 1 mở sẵn. Mọi thứ lưu trên máy, không cần mạng.

## Phạm vi
- **Điều hướng** (`NavigationStack`, theo B7.6): chưa có hồ sơ → Chào mừng → Tạo hồ sơ → Trang chủ. Đã có hồ sơ → vào thẳng Trang chủ. Trang chủ → Chủ đề → (SK-012) bài học.
- **Màn 1 · Chào mừng:** chọn chế độ ngôn ngữ (Song ngữ · Tiếng Anh trước · Tiếng Việt trước) như canvas → `language_mode`.
- **Màn 2 · Hồ sơ của bé:**
  - tên gọi, hình đại diện có sẵn, lớp, như canvas. Chọn được đủ Lớp 1–5 (B18 #14); bản thử luôn vào Discoverer;
  - **thêm chọn giọng đọc** Chỉ tiếng Anh · Chỉ tiếng Việt · Cả hai → `voice_mode`. Mặc định theo B4.1: Song ngữ → cả hai, Tiếng Anh trước → chỉ EN, Tiếng Việt trước → cả hai. Canvas màn 2 chưa có khối này (xem Câu hỏi còn mở): dựng theo kiểu chip "lớp mấy?" đang có trên màn 2;
  - không hỏi ngày sinh, ảnh, email (B12).
- **Lưu hồ sơ trên máy:** một file JSON trong `Application Support` gồm `id` (UUID), `display_name`, `avatar`, `grade`, `age_group`, `language_mode`, `voice_mode`, `timezone` (`TimeZone.current.identifier`), `created_at`. Đúng tên trường của `child_profiles` (B5.3), để SK-022 đẩy lên server không phải đổi tên. Một hồ sơ; chưa có màn chọn hồ sơ.
- **Màn 4 · Trang chủ:** lời chào theo tên, thẻ "Học tiếp" trỏ bài 1, hành trình chủ đề như canvas, dải tab dưới đáy. Tab Bộ thẻ, Huy hiệu, Từ vựng chưa làm: hiện trạng thái "sắp có", không crash.
- **Màn 5 · Chủ đề:** tiêu đề, câu hỏi lớn, mức, số bài, danh sách bài. Bài 1 mở; bài 2–5 khoá ("Mở sau bài 1"…). Chữ lấy từ nội dung (`topic.json`, bài 1), không hard-code.
- **Nguồn nội dung trước khi có gói (SK-015, SK-016):** app đọc `topic.json` và bài 1 từ fixture `packages/content-schema/fixtures/valid/...`, nhúng vào bundle bằng folder reference trong `project.yml`. Không chép file vào `apps/ios`.
- Chuỗi giao diện (nút, nhãn, "sắp có") nằm trong `Localizable.xcstrings` EN + VI; chữ của bài lấy từ nội dung.
- Thành phần mới cần cho màn (ví dụ `PaperDisc` của hành trình, `BottomNavStrip`) đặt trong `DesignSystem`.
- Chỉ dựng bố cục iPhone (compact). Bố cục iPad regular là SK-013. Trên iPad, ticket này chạy bằng bố cục compact canh giữa.

## Ngoài phạm vi
- Màn 3 Chọn hồ sơ, 6 Mở khoá, 7 Đăng ký, 14–17, Góc phụ huynh, thêm hồ sơ thứ 2.
- Đồng bộ hồ sơ lên Supabase: SK-022.
- Bố cục iPad hai cột: SK-013.

## Tiêu chí nghiệm thu
- [ ] Cài mới trên simulator iPhone 16 (`xcrun simctl uninstall` trước) → thấy màn Chào mừng. Chọn "Tiếng Anh trước" → sang màn 2, giọng đọc mặc định là "Chỉ tiếng Anh". Nhập tên "Minh", chọn hình, lớp 3, giữ giọng → vào Trang chủ có "Chào Minh!".
- [ ] Tắt app rồi mở lại → vào thẳng Trang chủ, giữ tên và lựa chọn. File hồ sơ trong `Application Support` có đủ trường ở Phạm vi (dán nội dung file).
- [ ] Đổi lựa chọn ở màn 1 sang "Song ngữ" khi tạo hồ sơ mới (cài lại app) → giọng mặc định là "Cả hai".
- [ ] Trang chủ → Chủ đề: tiêu đề "Ăn uống lành mạnh", câu hỏi lớn, bài 1 "Thức ăn cho ta những gì?" bấm được; bài khoá bấm không vào bài.
- [ ] Ảnh chụp 4 màn trên iPhone 16 và iPhone 16e, đặt cạnh màn canvas tương ứng. Ghi các chỗ khác canvas và lý do.
- [ ] Mọi nút ≥ 56pt, là `Button`; VoiceOver đọc được tên từng nút, kể cả nút chỉ có hình.
- [ ] Đổi máy sang tiếng Anh (`-AppleLanguages "(en)"`) → chuỗi giao diện ra EN. Chữ của bài vẫn theo `language_mode`.
- [ ] `xcodebuild test` xanh trên iPhone 16 và iPad Pro 11-inch (M4); có unit test cho phần lưu và đọc hồ sơ, và cho ánh xạ `language_mode` → `voice_mode` mặc định.
- [ ] Không sửa file ngoài `apps/ios/` (trừ ghi chú trong ticket). Không commit.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc**
- SK-008 (DesignSystem) và SK-009 (ContentModel).
- SK-013 dựng bản iPad của Trang chủ sau ticket này.

**Quyết định đã ghi** (PM đề xuất 28/10)
1. Hồ sơ lưu bằng file JSON, chưa thêm GRDB. B18 #4 chọn GRDB, nhưng GRDB chưa có trong danh sách tải ở ios-test-build mục 5. Thêm khi có hàng đợi đồng bộ.
2. Ánh xạ mặc định `language_mode` → `voice_mode` viết trong app theo B4.1, ghi `TODO` đọc từ `rules` khi manifest có (SK-015).

**Câu hỏi còn mở**
- **Canvas thiếu bước chọn giọng.** Giọng đọc là quyết định ngày 28/10, sau khi vẽ màn 2. Đề xuất: designer thêm khối "Giọng đọc" vào `Discoverer-Profile.dc.html` (ticket thiết kế nhỏ, chưa tạo). Trong lúc chờ, ios-dev dựng theo kiểu chip của màn 2.
- **Trang chủ hiện 6 chủ đề, màn Chủ đề hiện tên bài 2–5, nhưng gói chỉ có chủ đề 1 và bài 1.** App không được hard-code chữ của bài. Đề xuất cho bản thử:
  - bài khoá chỉ hiện số thứ tự và "Mở sau bài n" (chuỗi giao diện);
  - hành trình chỉ hiện chủ đề có trong gói, cộng một ô "Sắp có thêm chủ đề".

  Nếu Duy muốn thấy đủ tên như canvas, content-editor viết tên EN/VI của bài 2–5 và chủ đề 2–6, dev đưa vào manifest ở SK-015.

## Kết quả (ios-dev)

29/10/2026 · Xcode 16.3, Swift 6.1 (strict concurrency `complete`), simulator iOS 18.4. Chưa commit. Ảnh, log nằm trong scratchpad của phiên, viết tắt `SP/` = `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/sk-011/` (ngoài repo, chép ra nếu muốn giữ).

### Đã làm
- **Module mới `Profiles`** (SKKit, chỉ Foundation): `ChildProfile` (Codable, tên trường `child_profiles`), `LanguageMode` (`bilingual` · `en_first` · `vi_first`), `VoiceMode` (`en` · `vi` · `both`), `AgeGroup`, `Grade` (lớp → nhóm tuổi, lớp → Year), `VoiceMode.suggested(for:ageGroup:)` (B4.1), quy tắc ngôn ngữ của tên và câu, `ProfileStore` (file JSON trong Application Support). Test riêng `ProfilesTests` (20 test).
- **ContentKit:** `ContentLibrary`, `TopicContent`, `LocalContentLibrary.load(from:)` đọc mọi `topic`/`lesson` trong một thư mục (bố cục `fixtures/valid`), bỏ qua có log file hỏng, bài không có chủ đề, `archived`, `sensitive`. Test `ContentLibraryTests` (3 test).
- **DesignSystem** (thành phần mới cho màn): `PaperDisc` (điểm dừng hành trình: current/open/locked + huy hiệu khoá), `PaperPlayDisc` (nút tròn hai lớp ▶), `BottomNavStrip` + `BottomNavItem` (dải tab giấy mép xé), `TornEdgeTopShape` (từ `shape.torn_edge_top`), `.phoneColumnOnRegular()` (cột phone 390 canh giữa trên iPad), `.paperDropShadow(_:)` (bóng theo hình cho tranh), 10 icon mới trong `PaperIcon` (lock, shield, star, flame, flameCore, journey, cards, badge, book, more), `ProgressSquares(squareSize:)`, hằng số canvas mới trong `PaperMetrics`. Sửa `TwoLayerButton`: init `StringProtocol` thành `@_disfavoredOverload` (trước đó `TwoLayerButton("welcome.next")` hiện nguyên khoá "WELCOME.NEXT" thay vì chuỗi dịch; SK-012 sẽ gặp đúng lỗi này).
- **App** (`apps/ios/ScienceKids/`):
  - `App/AppModel.swift` (`@Observable`: hồ sơ, thư viện nội dung, `path` của `NavigationStack`, tab Trang chủ), `App/ScienceKidsApp.swift` (AppModel tạo một lần ở `App`; `RootView` chọn luồng theo hồ sơ), `App/LaunchOptions.swift` (`-SKResetProfile YES`, chỉ Debug).
  - `Onboarding/`: `OnboardingFlow` (Welcome → Profile), `OnboardingModel`, `WelcomeScreen` (màn 1), `ProfileSetupScreen` (màn 2, có khối giọng đọc).
  - `Home/`: `MainFlow` (NavigationStack Trang chủ → Chủ đề → bài), `HomeScreen` (màn 4: header, thẻ Học tiếp, hành trình, dải tab, trang "sắp có").
  - `Topic/TopicScreen.swift` (màn 5). `Lesson/LessonPlaceholderScreen.swift` (chỗ giữ route bài cho SK-012).
  - `Content/`: `BundledContent` (nội dung nhúng, thế giới bản thử, bảng số bài dự kiến), `LessonList` (bài mở/khoá, thẻ Học tiếp, số từ vựng), `ContentText` (chữ theo `language_mode`, clip theo `voice_mode`).
  - `Common/`: `ScreenHeader`, `PaperChipStyle`, `ChosenSeal`, `AvatarChoice`/`AvatarArt`, `TopicGlyph`, `TopicPlate`, `ScreenMetrics` (số đo canvas chưa có token, có ghi nguồn từng dòng).
  - Xoá `App/PlaceholderView.swift` (màn giữ chỗ SK-005) và 2 khoá `placeholder.*`.
  - `Resources/Localizable.xcstrings`: 90 khoá EN + VI (EN có plural cho số chủ đề, số từ, sao, chuỗi ngày).
  - `Resources/Assets.xcassets/Art/`: 10 SVG lấy từ canvas (6 avatar, linh vật, đồi, logo, bát cơm), bỏ filter `paperE`. Tạo lại bằng `python3 apps/ios/scripts/extract-canvas-art.py` (chạy từ gốc repo).
- **Test:** app `ScienceKidsTests` thêm `OnboardingTests.swift` (`OnboardingModelTests`, `AppModelTests`, `BundledContentTests`, `ContentTextTests`, `ArtTests`), sửa `InfoPlistTests` (chuỗi EN/VI đủ khoá ở cả hai thứ tiếng, format điền đúng), `LaunchOptionsTests`. UI test mới `ScienceKidsUITests/OnboardingUITests.swift` (10 test).
- `project.yml`: app phụ thuộc `Profiles`; folder reference `../../packages/content-schema/fixtures/valid` (trong bundle là `valid/…`, không chép file vào `apps/ios`); `SKKit/ProfilesTests` vào scheme. `README.md` của app: mục "Luồng mở app và hồ sơ (SK-011)", lệnh test.
- **Sửa test của SK-009** `missingMessagesFollowGroupOrder` (`ContentModelTests.swift`): test ghim thứ tự `groups` cũ của fixture bài 1 (carb, protein, veg); phiên chính đang đổi thứ tự này (protein, veg, carb) nên test đỏ. Viết lại để không phụ thuộc thứ tự trong file: kiểm thứ tự theo `groups` hiện có, rồi đảo `groups` trong bộ nhớ và kiểm lời nhắc đi theo thứ tự mới. Không sửa fixture hay vector.

### Quyết định đã ghi

**Mặc định tạm** (câu hỏi còn mở, Duy chưa trả lời, theo đề xuất PM 28/10):
1. **Bước chọn giọng đọc** dựng trên màn 2, ngay dưới khối lớp, kiểu chip "lớp mấy?": 3 chip "Chỉ tiếng Anh · Chỉ tiếng Việt · Cả hai", chọn thì vàng hoè, kèm một dòng "Cả hai: đọc tiếng Anh trước, tiếng Việt nối theo." Chờ designer thêm khối này vào canvas.
2. **Bài 2–5 chưa có nội dung:** hiện số, "Bài n" và "Mở sau bài n − 1" (chuỗi giao diện), không phải nút. Số bài 5 lấy từ bảng tạm `BundledContent.plannedLessonCounts` (theo ghi chú `_topic.md`), vì `topic.json` chưa có trường số bài; không có tên bài nào trong code.
3. **Hành trình** chỉ hiện chủ đề có trong nội dung, cộng một ô khoá "Sắp có thêm chủ đề" (không bấm được). Dòng đếm "1 chủ đề · dễ → khó" đếm theo nội dung.
4. **Dynamic Type** giữ trần của SK-008 (`xxxLarge`, ô cố định `xLarge`).
5. **UI test** giữ trong target `ScienceKidsUITests`, scheme không đổi. Unit test chạy với `-skip-testing:ScienceKidsUITests`; UI test chạy riêng (`-only-testing:ScienceKidsUITests`).

**ios-dev:**
6. Hồ sơ lưu ở `Library/Application Support/child_profile.json`, JSON in đẹp, khoá sắp xếp; đúng 9 trường của ticket, không thêm gì. `id` UUID v4 viết thường; `created_at` ISO 8601 UTC, cắt về giây chẵn (đọc lại bằng hệt); đọc được cả mốc giờ có mili giây hay `+07:00` (cho SK-022). File hỏng thì app coi như chưa có hồ sơ (vào Chào mừng, ghi log), tạo hồ sơ mới thì ghi đè.
7. Giá trị `language_mode` là `bilingual` · `en_first` · `vi_first`, trùng khoá `default_voice_mode` trong `content/rules.json` (SK-015 quyết định 5). `ProfilesTests.matchesRulesJSON` đọc file đó và so với bảng của app, nên đổi `rules.json` mà quên app thì test đỏ. Vẫn còn `TODO(SK-016)` đọc từ manifest.
8. **Lớp → nhóm tuổi theo canvas màn 2:** Lớp 1 Explorer, Lớp 2–3 Discoverer, Lớp 4–5 Scientist. Year = lớp + 1 (canvas: Lớp 2 → "Year 3"). Hồ sơ lưu đúng nhóm tuổi của bé; bản thử luôn chơi thế giới Discoverer (B18 #14). Thẻ thế giới của Lớp 1, 4, 5 thêm dòng "Sắp ra mắt. Trong lúc chờ, bé học thử Discoverer." Trang chủ ghi thế giới đang chơi: "Discoverer · Year n".
9. **Giọng mặc định** đi theo chế độ học (B4.1) cho tới khi bố mẹ tự bấm một giọng; sau đó đổi chế độ hay lớp không ghi đè. Explorer luôn gợi ý "Cả hai" (B4.1), nên Lớp 1 + Tiếng Anh trước → Cả hai.
10. **Chữ của nội dung theo `language_mode`:**
    - tên (chủ đề, bài): Song ngữ và Tiếng Việt trước dùng VI (như canvas), Tiếng Anh trước dùng EN; dòng phụ dưới tiêu đề Chủ đề ghi thứ tiếng kia, Tiếng Anh trước thì không ghi;
    - câu (câu hỏi lớn): EN trước, VI dưới; Tiếng Việt trước thì VI trước; Tiếng Anh trước ẩn dòng VI, có nút "Chạm để xem tiếng Việt".

    Hệ quả cho tiêu chí 4: hồ sơ Song ngữ hay Tiếng Việt trước thấy "Ăn uống lành mạnh"; hồ sơ Tiếng Anh trước (tiêu chí 1) thấy "Healthy eating".
11. Màn 2 bắt buộc tên, hình và lớp (nút "Bắt đầu hành trình" tắt tới khi đủ). Màn 1 chọn sẵn Song ngữ như canvas; hình và lớp không chọn sẵn. Tên cắt 20 ký tự như canvas, bỏ khoảng trắng hai đầu.
12. **Điều hướng:** `AppModel` tạo một lần ở `App` (`-SKResetProfile` chỉ xoá file một lần mỗi lần mở app), giữ luôn `OnboardingModel` (lựa chọn ở màn 1–2 không mất nếu view bị tạo lại). Chưa có hồ sơ → `OnboardingFlow` (NavigationStack riêng); tạo xong → `MainFlow` (NavigationStack `path: [AppRoute]`), không quay lại Chào mừng được. **Điểm nối cho SK-012:** route `AppRoute.lesson(topicID:lessonID:)`, đổi `LessonPlaceholderScreen` trong `MainFlow.destination` thành LessonPlayer; nút ▶ ở Trang chủ và dòng bài 1 ở Chủ đề đều đi vào route này. Thanh điều hướng hệ thống ẩn, nút quay lại là `PaperIconButton`; vì vậy không có vuốt mép để quay lại (với trẻ thì đỡ bấm nhầm).
13. **Dải tab** là `BottomNavStrip` tự vẽ, không dùng thanh tab hệ thống (không vẽ được giấy mép xé). Thẻ, Huy hiệu, Từ vựng mở trang "Sắp có". Chip chuỗi ngày và chip sao trỏ tab Huy hiệu; nút "Từ vựng chủ đề" trỏ tab Từ vựng (`AppModel.showTab`).
14. **iPad:** Chào mừng, Hồ sơ, Trang chủ, Chủ đề, bài giữ chỗ chạy trong cột phone 390 canh giữa trên nền điệp (`.phoneColumnOnRegular()`, áp ở chỗ đặt màn trong `OnboardingFlow`/`MainFlow` để màn đọc đúng `LayoutMetrics` compact). SK-013 bỏ modifier này ở Trang chủ khi làm bố cục hai cột.
15. **Hình:** avatar, linh vật, đồi, logo, bát cơm là SVG lấy từ canvas trong `Assets.xcassets/Art` (giữ vector). Bỏ filter `paperE` vì CoreSVG không vẽ được; thay bằng `.paperDropShadow(dropTag)` trên cả hình. Mã màu chỉ nằm trong file SVG (tranh), không có trong Swift: `grep` hex trong `apps/ios/**/*.swift` ngoài `Generated/` vẫn rỗng.
16. **Tranh của chủ đề:** schema chưa có hình cho chủ đề, nên thẻ Học tiếp và màn Chủ đề vẽ một đĩa giữ chỗ (viền chàm, giấy, lòng lõm) với glyph theo `strand` (bát cơm cho `humans_health`, ba chấm cho mạch khác). Không chép tranh cá, trứng, cơm của canvas vào app vì đó là hình riêng của chủ đề.
17. Nút loa cạnh câu hỏi lớn chỉ hiện khi có clip cho giọng của hồ sơ. Fixture chưa có audio nên hiện tại ẩn; SK-016 nối AudioKit (`TODO(SK-016)` trong `TopicScreen`).
18. Chuỗi ngày và sao hiện 0 (chưa có tiến độ; `TODO(SK-012/SK-022)`). Avatar ở Trang chủ là hình của bé (ếch), không phải linh vật như canvas, và không phải nút (chưa có màn Chọn hồ sơ; B7.6: một hồ sơ thì vào thẳng Trang chủ).

### Tự kiểm tiêu chí nghiệm thu

| # | Tiêu chí | Kết quả | Bằng chứng |
| --- | --- | --- | --- |
| 1 | Cài mới → Chào mừng; Tiếng Anh trước → giọng "Chỉ tiếng Anh"; Minh, ếch, lớp 3, giữ giọng → "Chào Minh!" | pass | UI test `testEnglishFirstFlowAndRelaunch` (iPhone 16, iPhone 16e, iPad Pro 11). Test mở bằng `-SKResetProfile YES` (xoá file hồ sơ, như cài mới). Thử tay trên iPhone 16: `xcrun simctl uninstall` rồi cài lại → mở ra Chào mừng; đi hết luồng bằng tay (tool simulator: chạm, gõ) → "Chào Minh!", file ra cùng 9 trường như mục dưới. Test kiểm: Song ngữ chọn sẵn, `profile.voice.en` được chọn, `profile.voice.both` không, ếch và lớp 3 được chọn, thẻ thế giới ghi Discoverer, nhãn lời chào đúng "Chào Minh!". |
| 2 | Tắt app, mở lại → vào thẳng Trang chủ, giữ tên và lựa chọn; file có đủ trường | pass | Cùng test: `terminate` rồi `launch` không có cờ reset → "Chào Minh!", không có nút "Tiếp" của Chào mừng, tên chủ đề ở Trang chủ là EN (Tiếng Anh trước). Unit: `AppModelTests.createdProfileSurvivesARelaunch`, `ProfileStoreTests` (6 test), `ChildProfileTests.jsonFieldsAreChildProfilesColumns` (đúng 9 khoá, không thừa). File thật: xem mục dưới. |
| 3 | Cài lại, chọn Song ngữ → giọng mặc định "Cả hai" | pass | `testBilingualDefaultsToBoth`: Song ngữ → Cả hai; quay lại chọn Tiếng Anh trước → Chỉ tiếng Anh; bấm Chỉ tiếng Việt, quay lại chọn Song ngữ → vẫn Chỉ tiếng Việt (giữ lựa chọn của bố mẹ). Unit: `OnboardingModelTests`, `VoiceSuggestionTests` (gồm so với `content/rules.json`). |
| 4 | Trang chủ → Chủ đề: tiêu đề, câu hỏi lớn, bài 1 bấm được; bài khoá không vào bài | pass | `testTopicOpensLessonOneOnly` (hồ sơ Song ngữ): tiêu đề "Ăn uống lành mạnh", câu hỏi EN + dòng VI, nút `topic.lesson.1` có nhãn chứa tên bài 1; dòng 2–5 không phải nút (kiểu `other`), nhãn "Bài n, khoá, mở sau bài n − 1"; chạm dòng 2 không mở bài; chạm bài 1 mở màn giữ chỗ có tên bài; nút ▶ ở Trang chủ mở cùng bài. Hồ sơ Tiếng Anh trước thấy "Healthy eating" (quyết định 10, `testEnglishFirstHidesVietnameseUntilTapped`). |
| 5 | Ảnh 4 màn trên iPhone 16 và 16e cạnh canvas; ghi chỗ khác | pass | Ảnh ghép `SP/compare/compare-{iphone-16,iphone-16e}-{1-welcome,2-profile,4-home,5-topic}.png` (trái: canvas render bằng Chrome headless từ `.dc.html`, `SP/canvas/`; phải: app). Ảnh gốc `SP/shots-final/` (thêm màn Hồ sơ cuộn xuống, Chủ đề, tab Thẻ "sắp có", màn giữ chỗ bài, iPad dọc và ngang). Chỗ khác: mục dưới. |
| 6 | Mọi nút ≥ 56pt, là `Button`; VoiceOver đọc tên từng nút | pass | `testEveryButtonIsAtLeast56ptAndLabelled` trên 3 máy: mọi nút hittable ở Chào mừng, Hồ sơ (cả khi cuộn), Trang chủ, Chủ đề (cả khi cuộn) ≥ 56 × 56 và có nhãn; có cả nút chỉ có hình: "Quay lại chọn chế độ học", "Về hành trình", "Bắt đầu bài 1". `testAccessibilityAudit` (`performAccessibilityAudit`, đủ 7 loại kiểm) trên 4 màn: không lỗi, trừ các mục được cho qua có in log (xem "Đề xuất cho designer"). |
| 7 | Máy tiếng Anh → chuỗi giao diện EN; chữ bài theo `language_mode` | pass | `testEnglishInterface` (`-AppleLanguages (en)`): "Next", "Which mode will your child learn in?", "Hi Minh!", tab "Journey", "Lesson 2, locked, opens after lesson 1"; hồ sơ Song ngữ nên tiêu đề chủ đề vẫn là "Ăn uống lành mạnh". Unit `InfoPlistTests.everyKeyInBothLanguages`: 90 khoá có ở cả `en` và `vi`, không rỗng. |
| 8 | `xcodebuild test` xanh trên iPhone 16 và iPad Pro 11-inch (M4); unit test lưu/đọc hồ sơ và ánh xạ giọng | pass | Log dưới. |
| 9 | Không sửa ngoài `apps/ios/` (trừ ticket); không commit | pass | Chỉ sửa trong `apps/ios/` và ticket này. Không sửa fixture, vector, `packages/`, `docs/backlog/README.md`. Không commit. |

**Lệnh và kết quả** (từ `apps/ios`, `DD` = DerivedData trong scratchpad):
```
xcodebuild test -project ScienceKids.xcodeproj -scheme ScienceKids \
  -destination 'platform=iOS Simulator,name=iPhone 16' -derivedDataPath "$DD" -skip-testing:ScienceKidsUITests
xcodebuild test … -destination 'platform=iOS Simulator,name=iPad Pro 11-inch (M4)' … -skip-testing:ScienceKidsUITests
TEST_RUNNER_SK_SCREENSHOT_DIR=<thư mục> xcodebuild test … -only-testing:ScienceKidsUITests/OnboardingUITests
```
Unit, lần chạy cuối, giống nhau ở iPhone 16 và iPad Pro 11-inch (M4) (`SP/logs/final2-unit-*.log`), 137 test mỗi máy:
```
✔ Test run with 40 tests passed      ScienceKidsTests (17 trước đây)
✔ Test run with 35 tests passed      DesignSystemTests
✔ Test run with 20 tests passed      ContentModelTests
✔ Test run with 14 tests passed      LessonEngineTests
✔ Test run with 5 tests passed       ContentKitTests (2 trước đây)
✔ Test run with 2 tests passed       LessonPlayerTests
✔ Test run with 1 test passed        AudioKitTests
✔ Test run with 20 tests passed      ProfilesTests (mới)
** TEST SUCCEEDED **
```
(Cột tên bundle là chú thích, theo thứ tự trong log.)

UI test `OnboardingUITests`, lần chạy cuối (`SP/logs/final2-ui-*.log`):
```
iPhone 16:              Executed 10 tests, with 0 failures (0 unexpected) in 189.401 seconds  ** TEST SUCCEEDED **
iPad Pro 11-inch (M4):  Executed 10 tests, with 0 failures (0 unexpected) in 198.418 seconds  ** TEST SUCCEEDED **
iPhone 16e:             Executed 10 tests, with 0 failures (0 unexpected) in 195.387 seconds  ** TEST SUCCEEDED **
```
Cả target UI (gallery SK-008 + SK-011) trước hai sửa đổi cuối (chuyển `OnboardingModel` vào `AppModel`, sửa chú thích): iPhone 16 `Executed 17 tests, with 1 test skipped and 0 failures`, iPad Pro 11 `Executed 17 tests, with 1 test skipped and 0 failures` (`SP/logs/final-ui-*.log`; test skip là `testReplayDoesNothingWithSystemReduceMotion`, chỉ chạy khi simulator bật Reduce Motion, như SK-008).

Một lần đỏ đáng ghi: trên iPhone 16e vừa khởi động lạnh, `testEnglishFirstFlowAndRelaunch` đỏ một lần vì lựa chọn "Tiếng Anh trước" không giữ (giọng ra "Cả hai"); chạy lại 2 lần và lần chạy cuối đều xanh. Chưa tái hiện được để biết nguyên nhân. Đã làm hai việc: test kiểm ngay chế độ được chọn sau khi bấm (lần sau đỏ sẽ chỉ đúng chỗ), và `OnboardingModel` chuyển từ `@State` của view sang `AppModel` (tạo một lần mỗi lần mở app), phòng khi view bị tạo lại làm mất lựa chọn. Tester để ý khi chạy trên máy vừa boot.

Không có warning Swift nào trong log build (chỉ dòng `appintentsmetadataprocessor … Metadata extraction skipped` như SK-005). xcodebuild có in "Result bundle saving failed … mkstemp" sau một số lần chạy: không lưu được result bundle, không ảnh hưởng kết quả (như SK-008).

### File hồ sơ trong Application Support

Sau `testEnglishFirstFlowAndRelaunch` trên iPhone 16 (`cat "$(xcrun simctl get_app_container booted vn.sciencekids.app data)/Library/Application Support/child_profile.json"`):
```json
{
  "age_group" : "discoverer",
  "avatar" : "ech",
  "created_at" : "2026-10-29T02:58:11Z",
  "display_name" : "Minh",
  "grade" : 3,
  "id" : "49d1c573-28d1-4861-bf6c-aa1c3761e03f",
  "language_mode" : "en_first",
  "timezone" : "Asia/Ho_Chi_Minh",
  "voice_mode" : "en"
}
```

### Khác canvas và lý do

Chung cho 4 màn:
- Chưa có vân giấy nền và filter `paperE` (mép giấy lệch, bóng từng mảnh), như SK-008: nền điệp phẳng; tranh SVG có một bóng chung (`.paperDropShadow(dropTag)`).
- Canvas vẽ 390 × 844 không có vùng an toàn; app chừa thanh trạng thái và vạch home, nên mọi thứ thấp hơn khoảng 30pt. Nút chính (Tiếp, Bắt đầu hành trình) ghim ở đáy, phần trên cuộn được, để chữ lớn hay máy thấp vẫn bấm được nút.
- Cỡ chữ lấy vai chữ gần nhất trong tokens: tiêu đề đầu màn 23/900 → `title` 21/900; "Bé học theo chế độ nào?" Phudu 20/700 → `title_s` 22/700; tagline 21/700 → `sentence` 19/700; tên chế độ 17/700 → `item_title` 16/700; tên thẻ Học tiếp 27/900 → `title_l` 26/900; ô nhập tên 20/700 → `sentence` 19/700; tên avatar 13/700 → `caption` 13/600; số trên ô bài Phudu 20/900 → `title` 21/900.
- Dấu triện trên ô đang chọn 22pt (`Seal` cỡ nhỏ) thay 26 (màn 1) và 24 (màn 2).

Màn 1 · Chào mừng: linh vật không lắc ăng-ten (`sway`), vì tranh là một file SVG; màn không có chuyển động lặp.

Màn 2 · Hồ sơ:
- thêm khối "Bé nghe giọng đọc nào?" và dòng giải thích (mặc định tạm 1);
- chip lớp cao 56 thay 48 (vùng chạm Discoverer);
- hình và lớp không chọn sẵn (canvas chọn sẵn ếch, Lớp 2 để minh hoạ);
- thẻ thế giới của Explorer, Scientist thêm dòng "Sắp ra mắt…" (B18 #14);
- khi cuộn, dòng chữ nằm sát trên nút bị dải điệp che một phần (ảnh `2-profile`), vì nội dung cuộn dưới nút ghim.

Màn 4 · Trang chủ:
- avatar là hình bé chọn, không phải linh vật; không phải nút, không có mũi tên đổi hồ sơ (chưa có màn Chọn hồ sơ);
- chuỗi ngày, sao là 0 (chưa có tiến độ);
- tranh trên thẻ Học tiếp là đĩa giữ chỗ với bát cơm (quyết định 16);
- hành trình 1 chủ đề + "Sắp có thêm chủ đề" thay 6 chủ đề, dòng đếm "1 chủ đề";
- "Year 4" vì hồ sơ thử là Lớp 3 (canvas Lớp 2 → Year 3);
- dải tab: padding đáy 8 thay 18, vì vùng vạch home thêm chỗ bên dưới.

Màn 5 · Chủ đề:
- bài 2–5 ghi "Bài n" thay tên bài (mặc định tạm 2);
- "0/5 bài" không có "khoảng 40 phút", vì chỉ bài 1 có `est_minutes`;
- không có nút loa (fixture chưa có audio, quyết định 17);
- tranh là đĩa giữ chỗ;
- "Từ vựng chủ đề · 8 từ" (đếm từ của bài có thật) thay 12 từ; chip cao 56 thay 48; chip nằm ngay dưới danh sách, không bị đẩy xuống đáy màn.

iPad (ngoài tiêu chí, ảnh `SP/shots-final/ipad-pro-11-inch-m4-*.png`): cả 4 màn là bố cục phone trong cột 390 canh giữa, dọc và ngang. Bố cục iPad thật là SK-013.

### Đề xuất và việc cho người khác
- **designer:**
  - thêm khối "Giọng đọc" vào `Discoverer-Profile.dc.html` (đang dựng theo chip lớp);
  - chip lớp trên canvas 48pt, dưới vùng chạm 56 của Discoverer;
  - vàng hoè trên giấy chỉ đạt 2,0:1 (dưới 3:1 cho thành phần không phải chữ). Audit của Accessibility Inspector báo "Contrast failed" ở: chip sao (ngôi sao vàng hoè), tab đang chọn (ô vàng hoè), 4 ô avatar có tranh màu sáng (cá, gà, mèo, chim sẻ). Chữ trong các ô đó là than tre trên giấy, đạt chuẩn; trạng thái chọn cũng có trait `isSelected`. Test đang cho qua đúng các mục này (in ra log) chờ designer quyết;
  - số đo chưa có token, đang để trong `ScienceKids/Common/ScreenMetrics.swift` và `PaperMetrics` (điểm dừng hành trình 56, ô số bài 36, nút ▶ 64/52, chip đầu màn 44, dải tab 50 × 32 / 58, ô chế độ 64, ô avatar 80…), cùng các vai chữ thiếu ở mục "Khác canvas";
  - tranh riêng cho chủ đề (thẻ Học tiếp, màn Chủ đề), xem đề xuất cho dev.
- **dev / PM (schema, gói):**
  - `topic.json` hay manifest cần số bài dự kiến (`lesson_count`) để app khỏi giữ bảng `BundledContent.plannedLessonCounts`;
  - schema chưa có hình cho chủ đề: đề xuất `topic.image` (`ContentImage`), app đang vẽ đĩa giữ chỗ;
  - SK-016: app đọc `rules.<age_group>.default_voice_mode` từ manifest thay bảng trong `Profiles` (test `matchesRulesJSON` đang giữ hai bên khớp nhau).
- **tester:**
  - kiểm theo bảng trên: `OnboardingUITests` (10 test), unit `ProfilesTests`, `OnboardingTests`, `ContentLibraryTests`; xem ảnh trong `SP/compare/` và `SP/shots-final/`;
  - kiểm tay VoiceOver trên Chào mừng → Chủ đề;
  - để ý lần đỏ trên iPhone 16e vừa boot (mục log ở trên);
  - tiêu chí "không có chữ của bài trong Swift" của SK-012 nên chỉ grep code app (`ScienceKids/`, `Packages/SKKit/Sources/`): test của SK-009, SK-011 có chữ bài để so sánh.
- **SK-012 (ios-dev):** cắm LessonPlayer vào `MainFlow.destination` (`case .lesson`); `LanguageMode.sentence/secondSentence` và `Spoken.clips(for:)` (trong `ScienceKids/Content/ContentText.swift`) dùng được cho chữ và audio của bài. LessonPlayer muốn đọc `language_mode` thì thêm phụ thuộc `Profiles` (thuần Foundation).
- **SK-013:** bỏ `.phoneColumnOnRegular()` của Trang chủ trong `MainFlow` khi làm bố cục hai cột.

### Câu hỏi còn mở (thêm)
- *(ios-dev → Duy)* Ở chế độ Song ngữ, tên chủ đề và tên bài hiện tiếng Việt (theo canvas), còn câu thì tiếng Anh trước. Giữ như vậy, hay muốn tên cũng tiếng Anh trước?
- *(ios-dev → Duy)* Lớp 1 (Explorer) luôn được gợi ý giọng "Cả hai" theo B4.1, dù bản thử cho bé chơi Discoverer. Giữ theo nhóm tuổi thật của bé, hay gợi ý theo thế giới đang chơi?
- *(ios-dev → Duy/PM)* Year = lớp + 1 (canvas: Lớp 2 → Year 3) đang dùng cho "Discoverer · Year n" và "Hành trình Year n". Đúng ý chưa?

## Nghiệm thu (tester, 29/10)

Chạy trên bản sao `snapshot-sk011-012/apps/ios` (code lúc giao), Xcode 16.3. Máy: **iPhone 16 Pro** thay iPhone 16, **iPad Pro 13-inch (M4)** thay iPad Pro 11-inch. Log, ảnh: `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/77c8c8c2-11a9-41ce-a20a-5e3cd0c8d4de/scratchpad/tester-sk011-012/` (viết tắt `T/`).

### Test đã chạy
| Lệnh | iPhone 16 Pro | iPad Pro 13 (M4) |
| --- | --- | --- |
| `-skip-testing:ScienceKidsUITests` (log `T/unit-iphone16pro.log`, `T/unit-ipad13.log`) | 157 test pass, 0 fail (app 40, DesignSystem 35, ContentModel 20, LessonEngine 14, ContentKit 5, LessonPlayer 22, AudioKit 1, Profiles 20). TEST SUCCEEDED | 157 pass, 0 fail. TEST SUCCEEDED |
| `OnboardingUITests` (`T/ui-iphone16pro.log`, `T/ui-ipad13.log`) | 10/10 pass | 10/10 pass |
Khớp số báo cáo ios-dev (unit 157, Onboarding 10).

### Tiêu chí
| # | Kết quả | Bằng chứng |
| --- | --- | --- |
| 1 Cài mới → luồng EN trước → "Chào Minh!" | Đạt (iPhone 16 Pro) | `simctl uninstall` rồi chạy `testEnglishFirstFlowAndRelaunch`: pass (`T/ui-onb-single-iphone16pro.log`). Test tự reset bằng `-SKResetProfile`, không phải gỡ cài; tôi đã gỡ trước khi chạy. |
| 2 Mở lại giữ hồ sơ; file đủ trường | Đạt | File đọc từ container (`simctl get_app_container ... data`), 9 khoá: age_group `discoverer`, avatar `ech`, created_at `2026-10-29T06:18:28Z`, display_name `Minh`, grade 3, id `5311ce49-eed1-4380-94b5-6ffeee6e0d3b` (UUID v4 hợp lệ), language_mode `en_first`, timezone `Asia/Ho_Chi_Minh`, voice_mode `en`. Đối chiếu B5.3 `child_profiles`: đủ 9 tên cột, đúng tên. Không có `daily_limit_min`, `locked_reason`, `archived_at`, `owner_id` (server cấp, đúng ý ticket). |
| 3 Song ngữ → giọng "Cả hai" | Đạt | `testBilingualDefaultsToBoth` pass cả hai máy; `VoiceSuggestionTests` + `matchesRulesJSON` (Profiles 20/20). |
| 4 Trang chủ → Chủ đề; bài 1 bấm được, bài khoá không | Đạt | `testTopicOpensLessonOneOnly` pass cả hai máy; ảnh `T/shots-phone/iphone-16-pro-5-topic.png` (bài 2–5 "Mở sau bài n", khoá). |
| 5 Ảnh 4 màn iPhone 16 + 16e cạnh canvas | **Không kiểm đủ** | Có ảnh 4 màn trên iPhone 16 Pro (`T/shots-phone/`, 27 ảnh) và iPad 13 (`T/shots-pad/`, 28 ảnh). Tôi chưa đặt cạnh canvas và không có iPhone 16e (máy ngoài danh sách của tôi). Đã xem tay Home, Topic: không thấy chữ bị cắt. Ghi "khác canvas" của ios-dev chưa kiểm lại. |
| 6 Nút ≥ 56pt, là Button, có nhãn | Đạt (phần tự động) | `testEveryButtonIsAtLeast56ptAndLabelled` pass cả hai máy; `testAccessibilityAudit` pass. VoiceOver thật: xem "Duy kiểm tay". |
| 7 Máy tiếng Anh → chuỗi giao diện EN | Đạt | `testEnglishInterface` pass; `InfoPlistTests.everyKeyInBothLanguages` pass. |
| 8 `xcodebuild test` xanh iPhone 16 + iPad 11 | Đạt trên máy thay thế | Bảng trên. Có unit test lưu/đọc (`ProfileStoreTests`) và ánh xạ giọng (`VoiceSuggestionTests`). |
| 9 Không sửa ngoài apps/ios, không commit | Không kiểm được | Tôi chạy trên bản sao, repo thật có nhiều agent cùng sửa nên `git status` không phân biệt được. |

Tổng 9 tiêu chí: 7 đạt (1, 2, 3, 4, 6, 7, 8; #6 chỉ phần tự động), 0 không đạt, 1 không kiểm đủ (#5), 1 không kiểm được (#9).

### Lỗi
Không có lỗi chặn.
- **Nên sửa:** `ProfileStore`/`AppModel.init` (AppModel.swift:48-55): file `child_profile.json` hỏng thì app vào Chào mừng và tạo hồ sơ mới sẽ ghi đè, kèm mất `id` cũ nên các attempt trong `lessons/in_progress` thành mồ côi. Chưa đến mức lỗi với bản thử một hồ sơ; ghi lại để SK-022 xử lý (sao lưu file hỏng thay vì ghi đè).
- **Nhỏ:** `language_mode` nhận `bilingual`/`en_first`/`vi_first` nhưng technical-plan B5.3 và SK-021 chưa ghi tập giá trị; dev (SK-021) cần khoá ràng buộc trùng `content/rules.json`.
- **Nhỏ:** "0/5 bài" lấy từ bảng cứng `BundledContent.plannedLessonCounts` (ios-dev đã tự nêu, cần `lesson_count` trong schema).
- **Nhỏ (lưu ý ios-dev):** lần đỏ lạ của `testEnglishFirstFlowAndRelaunch` trên iPhone 16e vừa boot; tôi chạy 3 lượt (đơn, trong cả bộ, iPad) đều xanh, không tái hiện.

### Duy kiểm tay
1. VoiceOver trên máy thật (Cài đặt > Trợ năng > VoiceOver): đi Chào mừng → Hồ sơ → Trang chủ → Chủ đề, vuốt từng nút, nghe có đọc tên (kể cả nút quay lại, nút ▶, hình đại diện) và trạng thái "đã chọn".
2. Gõ tên "Minh" bằng bàn phím máy thật, bấm nút Bắt đầu khi bàn phím đang mở: nút có bị che không.
3. Đặt cạnh canvas `Discoverer-Welcome/Profile/Home/Topic.dc.html` trên iPhone 16 và 16e: so màu, cỡ chữ, khoảng cách (tôi chưa làm).
4. Tắt app khi đang ở màn Hồ sơ (chưa lưu) rồi mở lại: về Chào mừng, lựa chọn có chấp nhận mất không.

### Đã sửa ở SK-022 (ios-dev, 29/10)
- Lỗi "nên sửa": `child_profile.json` hỏng giờ được đổi tên thành `child_profile.json.corrupt-<giờ UTC>`, có log, trước khi ghi hồ sơ mới. Không còn ghi đè.
- Lịch sử bài chỉ có đúng một id bé thì hồ sơ mới giữ id đó, nên attempt đang dở, lịch sử và hồ sơ trên server vẫn của bé (`AppModel.recoveredChildId`). Có hai id trở lên thì không đoán.
- Test: `ProfileStoreTests.brokenFileIsKeptAside`, `SyncAppTests.brokenProfileKeepsTheChildOfTheLessons`, `SyncAppTests.brokenProfileWithTwoChildrenGuessesNothing`.
- Chi tiết ở SK-022 "Kết quả (ios-dev)".
