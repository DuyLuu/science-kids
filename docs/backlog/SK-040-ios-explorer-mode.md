# SK-040 · App chạy bài Explorer (5–7 tuổi): Học, Chơi, Quiz, Thưởng theo canvas Explorer

Trạng thái: review · Ngày: 2026-11-12 · Phụ trách: ios-dev · Tester: tester
Nguồn: Duy 12/11 ("ưu tiên làm những phần bên Explorer như 'Gọi tên và nhóm động vật' trước"); SK-026 (D1–D5, "Hình thức D2 (Duy chốt 2/11)"); canvas `design/play-ui/project/Explorer-Home|Learn|Play|Quiz|Quiz-A|Quiz-B|QuizTF-Icons|Reward.dc.html`; content/rules.json (nhóm explorer)

## Mục tiêu
Bé 5–7 tuổi chưa biết chữ chơi trọn một bài Explorer chỉ bằng nghe và nhìn.

## Phạm vi
- LessonPlayer nhận bài `age_group: explorer` và hiện theo canvas Explorer: Khởi động, Học, Chơi, Quiz, Thưởng; bản iPad.
- Quiz theo SK-026: D1 chấm ngầm (sao, sticker; không số câu đúng, không XP); D2 câu hỏi có phụ đề ngắn, lựa chọn và nút không chữ, Đúng/Sai bằng biểu tượng gật/lắc đầu; D4 chạm thẻ là trả lời, app đọc tên hình sau khi chọn; câu hỏi tự đọc.
- Ba format Explorer trong rules: `single_choice` (2–3 lựa chọn), `true_false`, `order_sequence` (3 món; renderer mới).
- Hồ sơ Explorer: Trang chủ/Hành trình nhóm Explorer mở được bài đã soạn (bỏ "Sắp ra mắt" của `profile.world.trial` khi nhóm có bài).
- Bài thử: dùng bài Explorer đầu tiên khi content-editor soạn xong (SK-041); trong lúc chờ, dựng fixture JSON tối thiểu trong test.

## Ngoài phạm vi
- Scientist. Đồng bộ Supabase phần mới (dùng đường lưu tiến độ đang có).

## Tiêu chí nghiệm thu
- [ ] Hồ sơ Explorer mở bài Explorer, đi hết 5 bước, không có chữ trên lựa chọn và nút trả lời.
- [ ] Mỗi câu tự đọc câu hỏi; chạm lựa chọn là chấm ngay, đọc tên hình; Đúng/Sai bằng gật/lắc đầu.
- [ ] `order_sequence` 3 món kéo/chạm được, VoiceOver dùng được.
- [ ] Màn Thưởng không hiện số câu đúng, không XP; sao theo luật engine.
- [ ] iPhone và iPad; Reduce Motion; test một lần trên iPhone 16 Pro (và iPad Pro 11 M4 cho bố cục), tắt simulator.

## ios-dev 12/11

**Đã làm** (chỉ sửa `apps/ios/`, chưa commit)
- `LessonPresentation` (`.explorer` / `.discoverer`) lấy từ `age_group` của chủ đề (`MainFlow` truyền vào `LessonSession.Context`); Scientist tạm chạy như Discoverer.
- Format theo cách hiện: Explorer hiện `single_choice`, `true_false`, `order_sequence`; format khác trong bài Explorer bị bỏ và ghi log. Discoverer giữ nguyên (`hasRenderer` cũ không đổi, vẫn chưa có `order_sequence`).
- Màn câu hỏi Explorer (Khởi động và Quiz) theo "Hình thức D2": khung A (linh vật + bong bóng, cả bong bóng là nút nghe lại), triện vuông lá tre, góc bong + mũi tên vòng của B, thẻ đáp án vàng hoè nhạt khi hết lượt, nút đỏ cả bề ngang chỉ có mũi tên, ô tiến độ cùng màu gỉ đồng không tích (D1). Chạm thẻ là chấm (D4): app đọc tên hình rồi đọc gợi ý/giải thích trong một lượt; kết quả hiện sau 0,9 s như canvas. Đúng/Sai bằng biểu tượng gật/lắc đầu (bộ 1); câu Đúng/Sai đầu tiên của bài có dòng hướng dẫn và thẻ gật nhún.
- `order_sequence` mới cho Explorer: 3 ô đánh dấu bằng chấm (1–2–3 chấm, không chữ số), chạm thẻ để đặt vào ô trống kế tiếp, chạm thẻ đã đặt để lấy ra, hoặc kéo thả (thả vào ô có thẻ thì đổi chỗ). Đặt đủ thì chấm theo engine (khớp hoàn toàn). Sai còn lượt: thẻ về chỗ, đọc gợi ý. Hết lượt: ô hiện thứ tự đúng. VoiceOver: mỗi thẻ và ô là nút ("Ô 2: gà con", "Ô 3, còn trống").
- Thưởng Explorer: "Great job!", sticker (collectible) chạm để dán, 3 sao theo `computeStars`; không số câu đúng, không XP. Linh vật đọc tên sticker khi mở màn.
- Học và Chơi: dùng màn Discoverer (schema v1 chưa có `hotspot_image`, `sort_into_groups`), bỏ chip XP ở Chơi. Mọi màn Explorer dùng `ageGroup` explorer (bo góc 20, vùng chạm 72).
- iPad (regular): khung giấy 600, thẻ lựa chọn một hàng. Reduce Motion: mọi chuyển động qua preset token nên tắt hết.
- Màn Hồ sơ: dòng "Sắp ra mắt…" (`profile.world.trial`) chỉ hiện khi nhóm chưa có bài nào.
- Hình mới trong asset catalog (từ symbol canvas `Explorer-QuizTF`, bỏ filter, không nét viền): `ArtMascotTalk|Happy|Think`, `ArtExplorerNod`, `ArtExplorerShake`.
- Debug: `-SKOpenLesson <lesson id>` mở thẳng một bài khi nội dung sẵn sàng.
- Fixture test (dữ liệu test, không phải nội dung cho trẻ): `apps/ios/TestContent/explorer/fixture-explorer-ios/` (`validate` 0 lỗi, 27 cảnh báo về hình/brief).

**Quyết định đã ghi**
1. Explorer `true_false` giữ `max_tries` 2 như `rules` (câu còn mở ở SK-026).
2. Ảnh câu hỏi ở câu có thẻ lựa chọn/thứ tự thu nhỏ (cao 112pt) để vừa màn 390×844; câu Đúng/Sai giữ 214pt như canvas.
3. Thẻ thứ tự hiện theo thứ tự trong nội dung (không xáo); biên tập không viết `items` theo đúng `answer`.
4. Học và Chơi Explorer tạm dùng màn Discoverer cho tới khi có block Explorer (GĐ 2).

**Đề xuất cho dev**
- Bảng `format_not_rendered`: `order_sequence` hiện được ở Explorer từ bản app phát hành có SK-040 (Discoverer vẫn chưa). `validate` hiện báo cảnh báo này cho bài Explorer.
- `content/rules.json` → `explorer.xp_*` đặt 0 theo D1 (app đã ẩn XP, nhưng bản ghi lượt học vẫn tính XP theo `rules`).

**Lệnh và kết quả (iPhone 16 Pro, 1 lần)**
- `xcodebuild build -scheme ScienceKids -destination 'generic/platform=iOS Simulator'` → BUILD SUCCEEDED.
- `xcodebuild test-without-building … -destination 'id=14DF158D-…' -skip-testing:ScienceKidsUITests` → `ExplorerTests` 13 test qua, `LaunchOptionsTests.openLesson` qua; 1 lỗi có sẵn, không do SK-040: `ContentKitTests/JourneyTests.syllabusTitlesAndLevels` (`topics.contains { $0.level == nil }`: `content/syllabus.json` giờ có level cho mọi chủ đề Discoverer). UI test không chạy.
- Ảnh: luồng Explorer trên iPhone 16 Pro, một màn trên iPad Pro 11 (M4). Đã tắt cả hai simulator.

**Chưa làm / cho tester**
- Chưa có bài Explorer thật (SK-041) và clip audio: chưa nghe được tự đọc, chưa thấy huy hiệu loa đổi màu; dòng hướng dẫn Đúng/Sai chưa có clip giọng giao diện.
- Sổ sticker (ô "Chỗ này!", 4/12) của canvas Reward chưa làm.
- Kiểm VoiceOver thật trên máy, kéo thả trên iPad, iPhone 16e/16 Pro Max (chỉ kiểm qua `LayoutMetrics`).
- Chuỗi mới cho content-editor rà: `lesson.explorer.*` (17 khoá) trong `Localizable.xcstrings`.

## ios-dev 12/11 · lượt 2

Kiểm bằng bài thật: `content-cli import content/explorer/goi-ten-va-nhom-dong-vat --out <scratchpad>` rồi mở bằng `-SKContentFolder`, chạy trên iPhone 16 Pro (bài 4, cái kệ 2 chỗ). Bài nhập chưa có clip và ảnh thật, nên lần này chưa nghe được giọng đọc.

**Chơi (`build_tray`) ở Explorer**
- Khi mở màn, app tự đọc `prompt` rồi tới lời nhắn hiện tại (`messages.start`…).
- Chạm một món: app đọc tên món rồi đọc lời nhắn mới của engine, gộp trong một lượt. Như vậy mọi `messages.*` đều được đọc ngay khi chúng đổi.
- Kệ chỉ có hình. Món đã đặt lên cái khay cũng hiện bằng hình, không còn tên.
- Chip nhóm thành nút cao 72pt, có chấm màu của nhóm, chạm vào thì đọc tên nhóm; khi khay đã có món của nhóm thì chip chuyển lá tre có dấu tích.
- Nút dưới màn chỉ có mũi tên và chỉ hiện khi khay đạt yêu cầu.
- Kệ 2 chỗ (`capacity: 2`) hiện đúng 2 ô. Có unit test cho trường hợp 2 chỗ.

**Học (`explore_groups`) ở Explorer**
- Chạm một ô: app đọc tên ô rồi đọc `sentence`.
- **Chốt: `examples` không tự đọc.** Trong bài thật, mỗi ví dụ là một cụm 3–5 từ, có ô tới 4 cụm; đọc hết cả hai tiếng sau mỗi lần chạm thì quá dài với bé 5 tuổi. Nút nghe của tờ giấy vẫn đọc câu và các ví dụ.
- Nút sang phần Chơi chỉ có mũi tên và chỉ hiện khi đã xem hết các ô.

**Chuỗi mới** (content-editor rà giúp)
- Tên bộ thẻ: `collectible.set.animals` "Animal cards" · "Thẻ con vật"; `collectible.set.weather` "Weather cards" · "Thẻ thời tiết"; `collectible.set.rocks` "Rock and soil cards" · "Thẻ đá và đất". Hai khoá `breathing` và `body` đã có từ trước.
- Nhãn VoiceOver cho nút chỉ có mũi tên: `lesson.explorer.learn.next`, `lesson.explorer.play.next`.
- Nhãn VoiceOver cho thẻ "Em chưa chắc": `lesson.explorer.unsure`.

**Biểu tượng "Em chưa chắc"**
- Hình `ArtExplorerUnsure` (SVG, không chữ, không nét viền): cùng bạn nhỏ và cùng đĩa nền với bộ gật/lắc, đầu nghiêng, mắt nhìn lên, miệng tròn, ba chấm nghĩ màu vàng hoè; không có mũi nhọn chỉ hướng nên không lẫn với gật hay lắc đầu.
- Chưa gắn vào màn nào: schema chưa có format `think_first`. Nhờ designer duyệt hình.

**Test cũ đã sửa**
- `JourneyTests.syllabusTitlesAndLevels` giờ kiểm mọi chủ đề Discoverer có level từ 1 đến 5, khớp `content/syllabus.json` hiện tại.

**Kết quả**
- `build-for-testing`: TEST BUILD SUCCEEDED.
- `test-without-building` (bỏ UI test), chạy 1 lần trên iPhone 16 Pro: TEST EXECUTE SUCCEEDED, mọi bộ đều qua, `ExplorerTests` 15 test.
- Ảnh: `explorer-learn-2.png`, `explorer-play-2.png`. Đã tắt simulator.

**Còn lại**
- Phần đầu màn Học/Chơi (tiêu đề bài, dòng mục tiêu, "Your picks", nhãn bước) vẫn là chữ của màn Discoverer.
- Chưa nghe thử giọng đọc thật; việc này chờ gói có clip.

## dev 12/11

**1. `format_not_rendered` theo nhóm tuổi (đã làm).** Bảng format → bản app có thêm cột Explorer (`FORMAT_FIRST_APP_VERSION_BY_GROUP.explorer`, hàm `firstAppVersion(format, ageGroup)`), khớp `hasRenderer(for:)`: Explorer hiện `single_choice`, `true_false`, `order_sequence` từ 0.1.0; `multi_choice`, `fill_blank_bank`, `picture_bar_chart` chưa có. Discoverer và Scientist giữ cột cũ (`order_sequence` vẫn bị báo). Câu dùng format mà luật nhóm không cho thì chỉ báo `age_format_not_allowed`, không báo thêm `format_not_rendered`.
- Quyết định bản app: iOS `MARKETING_VERSION` = 0.1.0 (`apps/ios/Config/Base.xcconfig`), chưa bản nào phát hành (SK-020 todo). Renderer vào trước bản phát hành đầu tiên ghi 0.1.0, bằng mặc định `--min-app-version`, nên bài Explorer `validate`/`build` không cần cờ. Từ khi có bản phát hành (TestFlight/store), renderer mới ghi bản `MARKETING_VERSION` kế tiếp (ios-dev tăng số) và nội dung dùng nó build với `--min-app-version` bản đó. Ghi ở `tools/content-cli/README.md` mục "Bảng format → bản app".
- **Cho ios-dev:** nếu có bản 0.1.0 nào được cài cho người ngoài trước khi gộp SK-040, báo dev để đổi Explorer `order_sequence` sang bản kế tiếp.

**2. `explorer.xp_*` = 0: chưa đổi, đề xuất.** Không đổi `content/rules.json` vì đụng câu còn mở và DB:
- App lấy `rules` theo nhóm của **chủ đề** (`MainFlow`: `content.rules(for: topic.topic.ageGroup)`), server lấy theo nhóm của **hồ sơ** (`rules_for(v_child.age_group)` trong `40_internal_functions.sql`, chặn XP gửi lên ở mức tối đa theo `xp_*`). technical-plan B4.4 ghi rõ "Chưa đặt vào `rules.json`: chờ chốt luật lấy theo nhóm của hồ sơ hay của chủ đề (SK-026)".
- Dòng `app_config` `rules.explorer` trên staging (seed ở migration `20261029140144_app_core.sql`) vẫn 10/20/10/20. Đổi chỉ gói thì hai nguồn lệch; đổi cả DB cần một delta `UPDATE public.app_config` (hoặc chờ `publish` chép `rules.json` sang `app_config`), và lúc đó bé Explorer học chủ đề Discoverer sẽ bị server chặn XP về 0.
- Đề xuất cho PM/Duy chốt: (a) XP theo nhóm của chủ đề: đặt `explorer.xp_*` = 0 trong `rules.json`, sửa `test/rules.test.ts` (đang khẳng định 10/20/10/20 cho cả 3 nhóm), thêm delta `UPDATE app_config` cho `rules.explorer`, và đổi server lấy `rules` theo nhóm của chủ đề (cần biết `age_group` của bài ở server: hiện chưa có bảng nội dung, nên khó ở GĐ 0); (b) đơn giản cho MVP: giữ `xp_*` trong `rules.json`, app Explorer gửi `xp = 0` khi `presentation == .explorer` (ios-dev, một dòng), server giữ nguyên. Dev nghiêng (b) cho tới khi có CMS.
- Test vector chung (`packages/content-schema/test-vectors/`) không có khoá `xp_*`, không ảnh hưởng.

**3. Bảng đọc ép VI (đã làm).** `READINGS` trong `tools/content-cli/src/normalize/vi.ts`: `mohs` → "Mốt", `mary` → "Me ri", `anning` → "An ninh" (khớp cả từ, giữ chữ hoa đầu). Chưa chạy lại TTS: clip VI có các tên này (chủ đề Đá và đất) cần `tts` lại khi bài đó soạn xong.

**File đã đổi:** `tools/content-cli/src/validate/format-renderers.ts`, `src/validate/age-rules.ts`, `src/normalize/vi.ts`, `README.md`, `test/age-rules.test.ts`, `test/normalize-vi.test.ts`, `test/helpers.ts` (chú thích).

**Lệnh và kết quả**
- `npm test` (content-cli): 363 test, 362 qua, 1 lỗi thời gian: "validate cả thư mục content/: chạy hết, dưới 2 giây (D5)" đo 2,8 s khi cả bộ chạy song song; chạy riêng `node --test test/markdown.test.ts` 59/59 qua, và lệnh validate thật 0,8 s. `npm run typecheck`: sạch.
- `npm test` (packages/content-schema): 144/144 qua.
- `node tools/content-cli/src/cli.ts validate content`: 54 file (8 topic, 46 bài), 0 lỗi, 125 cảnh báo (37 `image_brief_keywords`, 34 `image_missing`, 54 `md_needs_check`), 0 `format_not_rendered`.

**Cho tester:** bài Explorer có `order_sequence` (SK-041 bài 2–5) không còn cảnh báo `format_not_rendered`; đổi `age_group` một bài Discoverer có `order_sequence` thì vẫn báo; `build` bài Explorer có `order_sequence` với mặc định 0.1.0 không lỗi.

## Main session chốt 12/11
- XP Explorer: chọn hướng (b) của dev — giữ `rules.json`, app gửi `xp = 0` khi chơi bài Explorer. Gom vào lượt ios-dev kế tiếp. Duy/PM đổi được.
- `READINGS` mới ("Mohs", "Mary", "Anning"): lượt pipeline kế tiếp chạy lại TTS *Đá và đất* cho các clip có các tên này.

## ios-dev 12/11 · XP Explorer = 0 (hướng b)
- `LessonSession.finish`: bài Explorer có XP bằng 0, nên lượt học gửi lên có `xp = 0` và không cộng XP vào máy; `xpEarned` trả `nil`. `rules.json` giữ nguyên.
- Unit test `ExplorerTests.rewardIsScoredOutOfSightWithStarsFromTheEngine` kiểm `summary.xp.total == 0` và `record.xp == 0` dù `rules.explorer.xp_per_correct > 0`.
- `-only-testing:LessonPlayerTests` trên iPhone 16 Pro: TEST EXECUTE SUCCEEDED, 71 test qua. Đã tắt simulator.
