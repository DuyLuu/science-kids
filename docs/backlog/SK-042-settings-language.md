# SK-042 · Trang Cài đặt: chọn tiếng Anh, tiếng Việt hay cả hai

Trạng thái: review · Ngày: 2026-11-12 · Phụ trách: ios-dev · Tester: tester
Nguồn: Duy 12/11 ("nên có settings page, settings việc là bật english, vietnamese hay cả 2 cùng lúc"); prd.md mục 6 (`language_mode` theo hồ sơ con); canvas `Discoverer-Parent.dc.html` (mục "Chế độ ngôn ngữ")

## Mục tiêu
Phụ huynh hoặc bé đổi được ngôn ngữ học của hồ sơ đang dùng bất cứ lúc nào, không phải tạo lại hồ sơ.

## Phạm vi
- Nút bánh răng ở Trang chủ (iPhone và iPad) mở trang Cài đặt theo style E.
- Trang Cài đặt có mục "Ngôn ngữ" với ba lựa chọn: **English** · **Tiếng Việt** · **Cả hai**; áp ngay cho hồ sơ đang dùng, lưu trên máy và đồng bộ như `language_mode` hiện có.
- Ánh xạ vào ba giá trị đang có của DB (không migration): English → `en_first`, Tiếng Việt → `vi_first`, Cả hai → `bilingual`. Hành vi:
  - English: chữ và giọng tiếng Anh, ẩn phụ đề VI;
  - Tiếng Việt: chữ và giọng tiếng Việt (từ vựng vẫn hiện từ EN kèm nghĩa VI);
  - Cả hai: như hiện nay.
  Nếu hành vi hiện tại của `en_first`/`vi_first` khác, ios-dev chỉnh cho khớp ba dòng trên và ghi lại.
- Áp cho cả bài Discoverer và Explorer, cả màn ngoài bài (Trang chủ, tab).

## Ngoài phạm vi
- Mã PIN phụ huynh (canvas `Discoverer-Parent`); các mục cài đặt khác.

## Tiêu chí nghiệm thu
- [ ] Từ Trang chủ mở được Cài đặt; đổi sang English → bài học chỉ còn chữ và giọng EN; Tiếng Việt → chỉ VI; Cả hai → như cũ.
- [ ] Đổi xong, mở lại app vẫn giữ; hồ sơ khác không bị đổi.
- [ ] VoiceOver đọc được ba lựa chọn và trạng thái đã chọn; iPhone và iPad.

## ios-dev 12/11

**Đã làm** (chỉ sửa `apps/ios/`, chưa commit)
- Trang chủ có nút bánh răng `home.settings` ở cuối dòng chào, trên cả iPhone và iPad (cột nội dung). Bấm vào mở trang Cài đặt (`AppRoute.settings`, `ScienceKids/Settings/SettingsScreen.swift`). Mục Ngôn ngữ có ba thẻ giấy; thẻ đang chọn nền vàng hoè. VoiceOver đọc tên lựa chọn, dòng mô tả và trạng thái "đã chọn".
- Chọn xong là áp dụng ngay và lưu file hồ sơ (`AppModel.setLanguage`): đổi `language_mode` (English → `en_first`, Tiếng Việt → `vi_first`, Cả hai → `bilingual`) và đổi giọng đọc kèm theo (`VoiceMode.matching`: en, vi, both). Chỉ hồ sơ đang dùng bị đổi; mở lại app vẫn giữ. Bài đang học dở giữ ngôn ngữ lúc mở bài; bài mở sau dùng ngôn ngữ mới.
- Icon mới `PaperIcon.gear`: một khối tô màu, không nét viền.
- **Hành vi đã chỉnh cho khớp ticket** (`Profiles/Modes.swift`):
  - English (`en_first`): chỉ chữ EN. Đã bỏ chip "VI" trong bài (`SecondLanguageSwitch.isOffered = false`) và nút "Xem tiếng Việt" ở màn Chủ đề.
  - Tiếng Việt (`vi_first`): chỉ chữ VI. Không còn tên phụ EN dưới tiêu đề (`nameSecondLanguage = nil`), không còn dòng EN dưới câu. Ô "Từ mới" ở màn Học vẫn hiện từ EN kèm nghĩa VI; tab Từ vựng vốn đã hiện như vậy.
  - Cả hai: như cũ.
- Áp cho bài Discoverer, bài Explorer và các màn ngoài bài (Trang chủ, Chủ đề, các tab), vì mọi màn đều đọc `language_mode` của hồ sơ.

**Chưa đồng bộ lên server.** Hiện app chỉ gửi `language_mode` và `voice_mode` một lần, lúc tạo hồ sơ (`create_child_profile`); server chưa có RPC để đổi hai trường này. Vì vậy lựa chọn ở Cài đặt mới lưu trên máy, server vẫn giữ giá trị cũ. Đề xuất cho dev: thêm RPC `update_child_profile(p_child_id, p_language_mode, p_voice_mode)`; ios-dev sẽ gọi nó khi đổi ngôn ngữ.

**Lệch với `content/rules.json`:** giọng đọc của "Tiếng Việt" là `vi` theo ticket, trong khi `default_voice_mode.vi_first` của nhóm discoverer là `both`. Màn tạo hồ sơ vẫn gợi ý theo `rules`. PM hoặc dev chốt có đổi `rules` cho khớp không.

**Chuỗi mới** (content-editor rà giúp): `settings.open`, `settings.title`, `settings.back`, `settings.language.title`, `settings.language.caption %@`, `settings.language.en|en_detail`, `settings.language.vi|vi_detail`, `settings.language.both|both_detail`, `settings.save_failed`.

**Test:**
- Unit: `ProfilesTests` (tên, câu, giọng theo lựa chọn), `AppModelTests.settingsLanguageIsSavedAndSurvivesARelaunch`, `AppModelTests.settingsLanguageWithoutAFileChangesNothing`, `ContentTextTests.vietnameseFirst`.
- UI test `testEnglishFirstHidesVietnameseUntilTapped` đổi thành `testEnglishFirstShowsEnglishOnly`. Lần này chưa chạy UI test.
- `xcodebuild test-without-building … -skip-testing:ScienceKidsUITests` trên iPhone 16 Pro, chạy 1 lần: TEST EXECUTE SUCCEEDED, mọi bộ đều qua.
- Trên simulator: đổi sang Tiếng Việt, file hồ sơ ghi `vi_first`/`vi`; đổi sang English, ghi `en_first`/`en`; màn bài học chỉ còn chữ EN. Ảnh: `settings-language.png`, `settings-lesson-english.png`. Đã tắt simulator.

**Chưa kiểm:** bố cục trên iPad (trang dùng `PaperFrame` nên khung 600 canh giữa như các trang khác); VoiceOver trên máy thật.

## Duy 13/11 · "Cả hai": tự đọc tiếng Anh, nút loa VI để nghe tiếng Việt

**Quyết định của Duy:** ở chế độ Cả hai, app chỉ tự đọc tiếng Anh. Cạnh mỗi chỗ có giọng đọc có thêm một nút loa VI nhỏ; bé cần thì bấm để nghe bản tiếng Việt. Phụ đề VI vẫn hiện như cũ. Chế độ English và Tiếng Việt không đổi so với lượt trước.

**ios-dev đã làm:**
- `SpeechPlayer.firstLanguageOnly = "en"` khi hồ sơ ở chế độ Cả hai (`AppModel.applyVoiceSplit`, chạy khi mở app, khi tạo hồ sơ và khi đổi trong Cài đặt). Từ đó mọi lần phát tự động (`autoplay`) và mọi lần phát do chạm (`play`) chỉ phát clip EN: câu hỏi khi mở màn, tên hình khi chạm, lời linh vật, gợi ý và giải thích của Explorer. Nếu chuỗi chỉ có clip VI thì vẫn phát VI, để nút không bao giờ im.
- `SecondVoiceButton` là nút loa có chữ "VI", nhãn VoiceOver `lesson.listen.vi` ("Nghe tiếng Việt"), vùng chạm theo nhóm tuổi (56 / 72pt). Nút chỉ hiện ở chế độ Cả hai và khi chuỗi có clip VI.
- Nút VI có ở các chỗ sau:
  - mọi `ListenButton`, nằm ngay dưới nút loa chính để câu bên cạnh giữ đủ bề rộng: câu hỏi, gợi ý, giải thích, mục tiêu và lệnh ở màn Học, câu của ô Học, lời nhắn ở Chơi, thẻ thưởng, màn Chủ đề, tab Thẻ, tab Từ vựng;
  - ô từ mới ở màn Học;
  - bong bóng lời linh vật Explorer, ở góc dưới bên phải.
- Chưa thêm nút VI cho tên từng lựa chọn khi bé chạm: chạm vẫn đọc tên EN, còn phụ đề VI của câu vẫn hiện.

**Test:**
- `AudioKitTests.bothModePlaysEnglishThenVietnameseOnRequest`.
- `AppModelTests.settingsLanguageIsSavedAndSurvivesARelaunch`: thêm kiểm tách giọng ở chế độ Cả hai.
- Unit test (bỏ UI test) chạy 1 lần trên iPhone 16 Pro: TEST EXECUTE SUCCEEDED, mọi bộ qua. Đã tắt simulator.
- Ảnh chụp với gói thật có clip VI: `bilingual-explorer-quiz.png`, `bilingual-discoverer-warmup.png`, `bilingual-discoverer-result.png`. Hai ảnh Discoverer là câu Khởi động; màn này dùng chung khung câu hỏi và tờ kết quả với Quiz.

**Còn lại:** chưa nghe thử bằng loa thật; chưa kiểm trên iPad.
