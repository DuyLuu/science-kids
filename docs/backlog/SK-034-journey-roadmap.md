# SK-034 · Bản đồ Hành trình và biểu tượng từng chủ đề

Trạng thái: in_progress · Ngày: 2026-11-10 · Phụ trách: designer (xong thiết kế), ios-dev (dựng) · Tester: tester
Nguồn: Duy 10/11:
- "phần road map xấu quá, phải nhìn như road map, mỗi đầu mục sẽ có 1 icon khác nhau";
- "đã hoàn thành phần Khủng long… nhưng không có dấu hiệu gì là đã xong". Phần dấu đã xong đã làm, ghi ở SK-030 mục "ios-dev 10/11: tiến độ trên hành trình".

Thiết kế:
- canvas `design/play-ui/project/Discoverer-Home-Roadmap*.dc.html` và `Topic-Icons.dc.html`;
- spec `design/play-ui/journey-roadmap-spec.md`;
- 45 biểu tượng ở `design/icons/topics/<key>.svg`.

## Mục tiêu
Màn Hành trình trông như một bản đồ đường đi. Mỗi chủ đề có biểu tượng riêng. Trẻ thấy ngay chủ đề nào đã xong, đang học, chưa học hay sắp có.

## Quyết định đã ghi
- **Duy 10/11:**
  - Phương án A, đường quanh co.
  - Dấu "Đã xong" màu lá tre (nới luật "lá tre chỉ báo đúng"); chữ "Đã xong" dùng `text_primary` cho đủ tương phản.
  - Sao chủ đề: 0–3 sao theo trung bình sao các bài, làm tròn xuống, chỉ để hiển thị.
  - Tên chặng "Chặng 1, 2, 3", không ghi Year.
- **Main session 10/11** (Duy không chọn, theo đề xuất của designer):
  - giữ vài mảnh cảnh nhạt hai bên đường (phương án A);
  - cho dùng vài màu tự nhiên ngoài token trong icon (não, ruột, màu da, băng) để dễ nhận ra.

## Tiêu chí nghiệm thu
- [ ] Hành trình cả 3 nhóm dựng theo phương án A: đường lượn nối chặng, cột cây số chia chặng, cờ đích. Có 4 trạng thái (đã xong, đang học, chưa học, sắp có) đúng spec, không khoá.
- [ ] Đủ 45 biểu tượng trong asset catalog (`Topic-<key>`, giữ vector), mỗi chủ đề đúng biểu tượng; không còn "•••".
- [ ] Chủ đề đã xong có triện lá tre và 0–3 sao theo trung bình; chữ "Đã xong" đủ tương phản 4,5:1.
- [ ] Thẻ "Học tiếp" có biểu tượng của chủ đề.
- [ ] Giảm chuyển động được tôn trọng; vùng chạm ≥ 56pt; VoiceOver đọc tên, trạng thái, số bài.
- [ ] iPhone đẹp; iPad dùng được (thanh bên 340pt hoặc bố cục rộng theo spec mục 11).
- [ ] Unit test qua; ảnh chụp Home cho Duy xem trên iPhone.

## ios-dev 10/11
Dựng bản đồ phương án A cho cả 3 nhóm, theo `design/play-ui/journey-roadmap-spec.md` và canvas `Discoverer-Home-Roadmap-Full.dc.html`.

**Biểu tượng (spec 8):**
- 45 icon chép vào `ScienceKids/Resources/Assets.xcassets/Art/Topics/Topic-<key>.imageset`: giữ vector, một cỡ, thư mục không bật namespace.
- Chép lại khi designer sửa icon: `sh apps/ios/scripts/import-topic-icons.sh`. Không cần sửa `project.yml`, vì catalog đã nằm trong target.
- `TopicIcon.name(key:strand:)` chọn icon theo thứ tự: icon của chủ đề → icon của mạch (`TopicIcon.strandIcons`, mỗi mạch mượn icon một chủ đề quen) → "•••" (chỉ khi mạch lạ). Mọi chủ đề trong syllabus hiện có icon riêng.
- `TopicGlyph(key:strand:size:muted:)` thay cho glyph theo mạch. `TopicPlate` (thẻ Học tiếp, hero màn Chủ đề) đặt icon cỡ 0,53 × đĩa.

**Dữ liệu (ContentModel, ContentKit):**
- `Syllabus.TopicEntry.oakYear` đọc từ `source.year`, rồi đi vào `JourneyTopic.oakYear`. Chủ đề chỉ có trong nội dung thì `nil`.
- `JourneySegment.of(stops)`: gom các chủ đề liền nhau có cùng năm. Discoverer 1–5 · 6–11 · 12–17; Explorer 1–6 · 7–12; Scientist 1–3 · 4–9 · 10–16.
- `JourneyStop.stars` = tổng sao tốt nhất các bài đã soạn ÷ số bài đã soạn, làm tròn xuống (bài chưa xong tính 0). Chỉ để hiển thị.
- Thêm `JourneyProgress.segments` và `doneTopicCount`.

**Vẽ:**
- `DesignSystem/JourneyMapGeometry` là hàm thuần, có test. Nó tính khung từng mục, điểm đường đi qua, cảnh bên đường, mảnh vòng bài và độ trễ lượt hiện.
- App dùng `JourneyMapLayout` (một `Layout`) để đo chiều cao từng hàng rồi đặt hàng theo hình học. Đường là một `Path` cubic duy nhất vẽ sau các hàng, đi qua điểm lấy lại từ khung các hàng (`anchorPreference` đặt ngoài hiệu ứng lượt hiện, nên đường không rung khi hàng trượt vào).
- Mảnh trang trí trong `DesignSystem/JourneyMapPieces`: `LessonRing`, `MilestonePost`, `FinishFlag`, `RoadsideScenery`.
- Seal có thêm cỡ `.medium` (28, dấu tích 17).
- Bản đồ chạy hết bề rộng màn (W = màn, không trừ lề khung), tối đa 600 và canh giữa; chữ một chặng rộng tối đa 300.

**Quyết định / lệch spec:**
1. Chữ "Đã xong · 5/5 bài": `caption_s` 700, `text_primary` (Duy chốt). Lá tre chỉ còn ở triện và mảnh lót. Sao đầy dùng `state_current`, sao rỗng dùng `giay_lom_deep`.
   - Chữ "Đã xong" ở màn Chủ đề vẫn màu lá tre. Lý do: nó nằm trên nền giấy `#FBF6EA`, đạt 4,82:1. Chỉ trên nền điệp lá tre mới thiếu tương phản.
2. Dynamic Type (spec 6), lệch nhỏ so với spec:
   - Giữa hai chặng A, bước dọc = max(124, khe 46 tính giữa mép hai hàng). Spec ghi "hàng cao hơn + 46"; cách đo theo mép thì hàng cao cạnh hàng thấp sẽ giãn ít hơn.
   - Cạnh cột mốc hoặc cờ, bước dọc tính theo phần thật sự nhô lên, nhô xuống (cột mốc nhô 26 trên điểm, cờ nhô 46), khe 24 ở A và 2 ở B.
   - Ở cỡ chữ mặc định, toạ độ trùng hệt canvas: 34, 130, 254 … 2266, cờ 2376, cao 2430 (có unit test).
3. Bố cục B (từ `accessibility1`): app chặn cỡ chữ ở xxxLarge (B7.8), nên cỡ chữ của máy được đọc trước khi chặn (`RootView` → `prefersAccessibilityTextLayout`).
   - Ảnh B đã chụp.
   - Lệch: chữ cột mốc của B vẫn để hai dòng, spec ghi một dòng.
   - Ở B, avatar chạm nhẹ vào cột mốc 1.
4. Cảnh bên đường vẽ bằng shape SwiftUI, chép toạ độ từ canvas, không chờ 4 SVG từ designer. Màu dùng token giấy lõm.
   - Ao không có hex trong view: pha `giay` với 20% `gi_dong`, ra khoảng `#D5DBD0`. Canvas dùng `#CFDCD8`, nên màu app hơi xanh lục hơn.
   - Đề xuất designer: thêm một token cho màu ao/băng nếu muốn khớp đúng.
5. Triện chỉ đóng `stamp` lần đầu Home thấy chủ đề đã xong.
   - `AppModel.freshlyDoneTopics` / `markDoneShown` nhớ trong bộ nhớ, cho tới khi tắt app.
   - Lần nhìn đầu sau khi mở app coi như đã thấy, nên không đóng dấu lúc mở app. Rời bản đồ (mở chủ đề, đổi tab hay đổi nhóm) thì đánh dấu đã thấy.
   - Không lưu xuống máy, vì lưu cần UserDefaults kèm khai `PrivacyInfo`. Muốn nhớ qua các lần mở app thì làm sau.
6. Motion:
   - Mỗi mục bản đồ hiện bằng `lay`, trễ 140 ms + 70 ms × thứ tự, chặn ở 420 ms.
   - Avatar hiện bằng `pop` ở 420 ms; triện đóng 170 ms sau hàng của nó.
   - Không có chuyển động lặp trên bản đồ. Giảm chuyển động tắt hết (qua `KeyframeMotion` sẵn có).
7. VoiceOver:
   - Mỗi chặng là một nút, đọc kiểu "Khủng long và Trái Đất thời xa xưa. Đã xong, 5 trên 5 bài, 2 sao".
   - Cột mốc là header: "Chặng 2, 0 trên 6 chủ đề xong".
   - Cờ đọc gộp: "Về đích, 17 chủ đề · 1 đã xong".
   - Đường, cảnh, icon, sao, avatar đều ẩn. Thứ tự đọc là thứ tự hành trình.
   - Định danh `home.topic.<key>` giữ nguyên. Thêm `home.segment.<n>`, `home.journey.map`, `home.journey.finish`.
8. iPad (spec 11, A): bản đồ chuyển sang cột nội dung, dưới thẻ Học tiếp, tối đa 600.
   - Thanh bên giữ 4 tab, tên hành trình, chip nhóm, và thêm danh sách chặng (`home.sidebar.segment.<n>`).
   - Chạm một chặng thì cuộn bản đồ tới cột mốc đó; nếu đang ở tab khác thì chuyển về tab Hành trình trước.
   - Đã sửa `IPadLayoutUITests` theo bố cục mới. Chưa chạy trên iPad.
9. Bỏ `JourneyTopicRow` (danh sách cũ). `PaperDisc` vẫn còn trong DesignSystem nhưng Home không dùng nữa.
10. Chuỗi mới (EN + VI), nhờ content-editor xem câu chữ:
    - `home.journey.segment`, `.segment_done`, `.segment_a11y`;
    - `.finish`, `.finish_done`;
    - `.stars_a11y` (EN có số nhiều);
    - `.done_a11y`, `.learning_a11y`, `.level_a11y`, `.new_a11y`.
    - Không thêm `segment_year_done`, vì Duy bỏ Year.

**Test** (một lần, iPhone 16 Pro `14DF158D…`, `xcodebuild test … -skip-testing:ScienceKidsUITests`, log `scratchpad/xctest-sk034-roadmap.log` của phiên):
- Kết quả: `** TEST FAILED **`. 338 test, 335 qua, 3 đỏ. Cả 3 test đỏ đều là test mới của ticket này và đều sai ở phía test, code không sai:
  - `JourneyMapGeometryTests.canvasFrames`, `.trailLayout` (5 lỗi): vế phải của `#expect(a == b)` viết dạng phép tính (`80 + 14 + 246`). swift-testing suy kiểu riêng cho vế này thành `Int`, nên so với `CGFloat` ra sai dù hai số bằng nhau (log in `340.0 == 340`). Đã đổi sang số viết sẵn.
  - `JourneyMapAppTests.mapItemsOfEachGroup` (1 lỗi): test giả định chủ đề đang học là #1, nhưng bộ fixture chỉ có #9 Ăn uống lành mạnh. Đã đổi sang so với chủ đề đã soạn đầu tiên.
  - Sau khi sửa: `build-for-testing` qua. **Chưa chạy lại** vì quy ước một lượt. Cần một lượt: `-only-testing:DesignSystemTests/JourneyMapGeometryTests -only-testing:ScienceKidsTests/JourneyMapAppTests`.
- Theo bộ: ScienceKidsTests 80 (1 đỏ), DesignSystemTests 58 (2 đỏ), ContentModelTests 28, LessonEngineTests 19, ContentKitTests 45, LessonPlayerTests 56, AudioKitTests 13, ProfilesTests 21, SyncTests 18.
- Test mới đã qua:
  - hình học: toạ độ canvas, điểm lấy lại từ khung, Dynamic Type, cấp 300, đường cubic đứng, cảnh bên đường, vòng bài, độ trễ, bản đồ rỗng;
  - `JourneySegmentTests` (4 test): chặng của 3 nhóm, năm Oak, đếm xong, sao làm tròn xuống;
  - `SyllabusTests.oakYearOfEachTopic`;
  - `JourneyMapAppTests`: đủ 45 icon, rơi về icon mạch, triện đóng một lần;
  - `InfoPlistTests.roadmapStringsFillIn`;
  - `JourneyProgressAppTests` (3 test hôm trước chưa chạy, nay đã qua).

**Ảnh** (iPhone 16 Pro, VI, `-SKSyncOff YES`), trong `scratchpad/shots/`:
- `app-roadmap-discoverer-top.png`;
- `app-roadmap-discoverer-map.png`;
- `app-roadmap-explorer.png`;
- `app-roadmap-discoverer-a11y-textB.png`: cỡ chữ accessibility-medium, bố cục B.
- Dữ liệu thử ghi tay: Khủng long xong 5 bài (3, 3, 3, 2, 3 sao, ra 2 sao); Bề mặt Trái Đất xong bài 1–3; Ăn uống lành mạnh có một bài đang dở. Chụp xong đã trả container, trả cỡ chữ về `large` và shutdown máy.

**Chưa kiểm:**
- iPad: cột nội dung và danh sách chặng ở thanh bên.
- iPhone 16e và Pro Max: chỉ có unit test hình học ở W = 390 và 600.
- VoiceOver trên máy thật; Giảm chuyển động trên simulator.
- UI test: chưa chạy.

**Tester kiểm:**
- Học xong một chủ đề rồi quay về Home: triện đóng `stamp` một lần, mở lại Home thì triện đứng yên.
- Số sao: (3, 3, 3, 2, 3) phải ra 2 sao.
- Chặng "Sắp có" bấm vẫn mở màn chủ đề.
- Cỡ chữ `accessibility1` trở lên ra bố cục B.
- iPad: chạm "Chặng 3" ở thanh bên thì bản đồ cuộn tới cột mốc 3.
