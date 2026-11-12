# SK-031 · Soạn chủ đề Discoverer #1 "Bề mặt Trái Đất: núi lửa, động đất, đại dương" (5 bài)

Trạng thái: review · Ngày: 2026-11-09 · Phụ trách: content-editor (soạn), main session chạy lệnh · Tester: tester
Nguồn: Duy 9/11 ("Soạn Discoverer #1"); syllabus.md mục 2, 4 và mục 8 (pilot GĐ 0 = 6 chủ đề đầu Discoverer); syllabus-lessons.md (danh sách 5 bài nháp); `content/TEMPLATE.md`; `content/rules.json`; hai bài đã soạn của *Ăn uống lành mạnh* làm mẫu giọng và độ dài

## Mục tiêu
Chủ đề đầu tiên của pilot có đủ 5 bài chơi được trong app, có tiếng EN và VI, để Duy thử trên iPhone.

## Phạm vi
- **content-editor:**
  - viết `content/discoverer/<slug>/_topic.md`: kế hoạch 5 bài (mục tiêu "I can…", 3 ý chính, từ vựng mỗi bài), misconception, câu hỏi lớn;
  - viết 5 bài `01-…md` → `05-…md` theo TEMPLATE;
  - chủ đề mới không có sườn Oak, nên mục tiêu tự dựng theo syllabus-lessons.md (5 bài nháp) và CT GDPT 2018.
- **main session:**
  - chạy `ids`, `validate`, chuyển lỗi lại cho content-editor;
  - `import`, `tts --lang en`, `tts --lang vi`, `build` gói có cả *Ăn uống lành mạnh* và chủ đề này;
  - điền `topic_id`, `lesson_id` cho `new-earth-surface` trong `content/syllabus.json`;
  - build Release, cài lên iPhone Luu.
- **tester:** rà chữ 5 bài theo luật Discoverer và TEMPLATE; kiểm gói.

## Ngoài phạm vi
- Hình giấy cắt thật: app vẽ hình giữ chỗ; designer làm sau.
- Duyệt chuyên môn địa chất, Duy nghe giọng đọc.
- Đổi tên chủ đề: content-editor đã đề xuất "Trái Đất của chúng ta" hoặc "Lục địa, đại dương và núi lửa" (SK-030). Giữ tên hiện tại tới khi Duy chốt.

## Tiêu chí nghiệm thu
- [ ] 5 bài theo TEMPLATE, `ai_draft: true`; chỗ cần chuyên gia xem có `[CẦN KIỂM]`.
- [ ] Quiz chỉ dùng format app hiện được (`build` báo `format_not_rendered` là lỗi).
- [ ] `validate` thư mục chủ đề: 0 lỗi; cảnh báo dán vào ticket, content-editor xem từng cái.
- [ ] `tts` EN và VI sinh đủ clip; clip VI bị tự kiểm đánh dấu được liệt kê cho Duy nghe.
- [ ] `build` ra gói có 2 chủ đề, `check-pack.sh` OK; `validate content` vẫn 0 lỗi sau khi gắn id vào `content/syllabus.json`.
- [ ] Trên iPhone Luu: Discoverer #1 hiện 5 bài chơi được, có tiếng; *Ăn uống lành mạnh* vẫn chơi được bài 2 và 6.
- [ ] Tester rà chữ cả 5 bài (đọc, không chỉ chạy máy).

## Phụ thuộc · Quyết định đã ghi · Câu hỏi còn mở

**Phụ thuộc:** SK-030 (danh mục, app hiện đủ syllabus).

**Lưu ý nội dung cho content-editor**
- **Vùng biển của Việt Nam:** tiếng Việt gọi "Biển Đông", tiếng Anh gọi "the East Sea".
- **Bản đồ** (Duy chốt 9/11, thay lưu ý cũ "không vẽ bản đồ khu vực"): hình có bản đồ hoặc quả địa cầu thấy vùng Đông Nam Á thì vẽ theo bản đồ chuẩn của Nhà nước, thể hiện đủ chủ quyền, kể cả quần đảo Hoàng Sa, Trường Sa. Mô tả hình ghi rõ yêu cầu này và gắn `[CẦN KIỂM]` để người duyệt pháp lý xem trước khi phát hành.
- **Ví dụ Việt Nam:** núi lửa đã tắt ở Tây Nguyên (Chư Đăng Ya, Gia Lai) và đảo Lý Sơn; Công viên địa chất Đắk Nông; động đất nhỏ ở Kon Tum. Số liệu, năm, độ lớn để `[CẦN KIỂM]`.
- **An toàn động đất:** "cúi xuống, che đầu, bám chắc". Sóng thần: ở gần biển thấy nước rút bất thường thì chạy lên chỗ cao. Nói nhẹ nhàng, không gây sợ.

**Quyết định đã ghi**
- **ios-dev 9/11** (theo "Ghi chú cho dev" của bài 1):
  - Chữ giao diện màn Chơi (`build_tray`) đổi sang chữ chung, không nói mâm, món, cân bằng; bài tự nói vật được chọn là gì qua `prompt`, `messages`, nhãn nhóm. `lesson.play.done` "Done! Take the quiz" · "Xong rồi! Làm quiz"; `lesson.play.tray_label` "Your picks · tap one to take it off" · "Em đã chọn · chạm vào để bỏ ra"; `lesson.play.remove %@` "Remove %@" · "Bỏ chọn %@"; `lesson.play.tray_a11y` "Your picks: %1$lld of %2$lld places filled" · "Em đã chọn: %1$lld trên %2$lld chỗ"; `lesson.play.meter_ok` "done" · "đã có" (VI giữ). `need`, `meter_missing`, `mascot` vốn đã chung, chỉ sửa comment.
  - Nhãn trên mâm nói "tap one", không nói "tap a picture": trong mâm, món hiện bằng chấm màu và tên, không có hình.
  - Thêm `collectible.set.earth` "Earth cards" · "Thẻ Trái Đất". Bộ thẻ lạ (chưa có khoá `collectible.set.<set>`) hiện tên chung `collectible.set_generic` "Cards" · "Thẻ", không in khoá thô (`CollectibleSetName` trong `RewardStep.swift`).
  - Không đổi schema. Phương án (b) để bài tự đặt chữ (`tray_label`, `done_label` ở schema v1.1) để sau, cần `dev` sửa schema trước.
- **ios-dev 9/11, kệ trung tính.** Content-editor báo bé có thể ghép theo màu mà không cần hiểu bài (bài 1 và bài 5: nhóm đúng và nhóm `limit` khác màu).
  - Hình giữ chỗ trên kệ màn Chơi (`build_tray`) dùng chung một mảnh giấy lõm (`Role.surfaceInactive`, như ô đáp án quiz), không tô màu nhóm (`PlayStep.swift`).
  - Thứ tự trên kệ: app xáo một lần mỗi lượt học, hạt giống là `attemptId` (`ShelfOrder.swift`, `LessonSession.shelfItems`). Học tiếp lượt dở thì kệ giữ nguyên; lượt mới thì thứ tự khác. Lý do: thứ tự `#### item` trong bài cũng lộ nhóm. Bài 1 *Ăn uống lành mạnh* xếp từng cặp cùng nhóm (cơm, bánh mì · cá, trứng…). Bài 5 *Bề mặt Trái Đất* đặt nhóm `tray_unsafe` ở mọi vị trí chẵn, trên lưới 4 cột của iPhone là trọn cột 2 và cột 4. Content-editor không cần sắp lại thứ tự.
  - Nhãn VoiceOver của món trên kệ chỉ có tên món (EN, rồi chữ đang hiện nếu khác), không có tên nhóm; `accessibilityIdentifier` (`lesson.shelf.<key>`) không được đọc.
  - Giữ nguyên vì chỉ hiện sau khi chọn: chấm màu nhóm của món trên khay, chip nhóm đổi màu và có dấu tích khi đủ, phiếu `limit`, lời mascot. Chip nhóm và dòng "Cần đủ…" hiện trước khi chọn nhưng chỉ nêu tên nhóm, không cho biết món nào thuộc nhóm nào.
  - Không đổi luật chấm (`buildTray` nhận key, không nhận vị trí), không đổi schema. Canvas `Discoverer-Play` vẽ hình riêng từng món, không tô theo nhóm, nên kệ trung tính không lệch canvas. Đề xuất cho designer: hình giấy cắt thật của món trên kệ không dùng màu nền theo nhóm.
- Duy 9/11:
  - Bài 1 đổi tên "Land and water on Earth · Đất và nước trên Trái Đất". Danh mục đã sửa theo.
  - Bài 2 dạy 7 châu lục, 5 đại dương theo sách tiếng Anh, kèm một câu nói sách ở trường có thể chia khác.
  - Bản đồ vẽ theo bản đồ chuẩn của Nhà nước, cần người duyệt pháp lý.

**Câu hỏi còn mở**

## Rà chữ (tester 9/11)

Phạm vi: đọc cả `_topic.md` và 5 bài (EN, VI, quiz, Chơi, từ vựng, thẻ thưởng), đối chiếu `content/TEMPLATE.md`, `content/rules.json` (discoverer), bảng "Tên gọi thống nhất". Không chạy `tts`/`build`/`import`, không sửa nội dung. Đường dẫn: `content/discoverer/be-mat-trai-dat/`; "01" = `01-dat-va-nuoc-tren-trai-dat.md`, "02" = `02-cac-chau-luc-va-dai-duong.md`, "03" = `03-ben-trong-trai-dat.md`, "04" = `04-nui-lua.md`, "05" = `05-dong-dat-va-song-than.md`.

Tổng: chặn 0 · nên sửa 6 · nhỏ 12.

**Đã đạt (đọc, không chỉ chạy máy):**
- Khoa học: không thấy câu sai rõ. Các chỗ giản lược đều có `[CẦN KIỂM]`.
- Tên gọi: khớp bảng (Biển Đông/East Sea, Oceania, vỏ Trái Đất · lớp manti · nhân Trái Đất, mác-ma). Không thấy tên tỉnh cũ, "lục địa", "đất liền", "nước" thay "quốc gia", "South China Sea" trong chữ bé đọc.
- Quiz: mỗi câu đúng một đáp án (single) hoặc đúng các đáp án nêu trong ghi chú (multi); đáp án đúng có trong lựa chọn; DOK 1-1-2-2-2-3; đúng 1 câu `misconception` (q6) mỗi bài, đúng key.
- Khởi động ôn đúng ý bài trước đã dạy (w1/w2 bài 2 → bài 1; bài 3 → bài 2 và 1; bài 4 → bài 3 và 1; bài 5 → bài 4 và 1).
- Vị trí đáp án đúng trong từng bài không lặp một chỗ (vị trí 2 hơi nhiều: bài 1 w1/q2/q4, bài 3 w2/q2/q4).
- Chơi: mọi tổ hợp đạt được; không món nào vừa đúng vừa sai; nhóm `limit` hợp lý.
- An toàn: động đất, sóng thần, núi lửa nói nhẹ; lời khuyên "cúi xuống, che đầu, bám chắc", "lên chỗ cao" đúng; không số người chết, không cảnh đổ nát. Chỗ cần chuyên gia đều có `[CẦN KIỂM]`.
- Bản đồ: chỉ `explore_vietnam` (02:177-190) là bản đồ Đông Nam Á, brief ghi đủ Hoàng Sa, Trường Sa và cần duyệt pháp lý; mọi quả địa cầu khác quay về Đại Tây Dương/Thái Bình Dương.

### Chặn
Không có.

### Nên sửa

**N1. Quiz và Khởi động dạy bé đáp "đúng/sai" theo thói quen, không theo nội dung.**
- 5/5 câu q6 đều `answer: false` (01:504, 02:518, 03:472, 04:520, 05:550): "Na chưa đúng" luôn là đáp án. 4/4 câu Khởi động `true_false` đều `answer: true` (01:93, 02:83, 04:77, 04:98).
- Qua 5 bài bé sẽ học "Na luôn sai, bấm No" mà không cần nghĩ; câu DOK 3 mất giá trị đo.
- Sửa: ít nhất 1 bài có q6 mà Na nói đúng (ví dụ bài 5: "The ground shakes a little. I still drop, cover and hold on." · "Đất rung nhẹ. Mình vẫn cúi xuống, che đầu, bám chắc.", `answer: true`, vẫn gắn `quake_just_shaking`). Và ít nhất 1 Khởi động `true_false` có đáp án sai (ví dụ 04 w3: "An island is water with land all around it." · "Hòn đảo là nước, có đất bao quanh." `answer: false`). Giữ ý kiểm cũ, chỉ đảo chiều.

**N2. Bài 1 w1 có hai đáp án hợp lý (01:36-78).**
- Câu: "Which one has the same shape as Earth?" · lựa chọn: clock, ball, box. Gợi ý: "Think of photos of Earth from space." Ảnh Trái Đất từ vũ trụ là hình tròn, đồng hồ cũng tròn; bé 7 tuổi chọn đồng hồ là có lý.
- Giải thích sai (01:51-52) chỉ nói "Earth is round like a ball", không nói vì sao đồng hồ chưa đúng.
- Sửa: giải thích sai thêm "A clock is flat. Earth is a ball." · "Đồng hồ thì dẹt. Trái Đất tròn như quả bóng."; hoặc prompt "Which one is round on all sides, like Earth?" · "Vật nào tròn đều mọi phía, giống Trái Đất?"

**N3. Bài 5 Chơi: tổ hợp đạt nhưng không hợp lý (05:286-349).**
- "Quỳ xuống" + "Tay che đầu" + "Bám chân bàn" → `balanced`, lời nhắn "Em ở yên đó và bám chắc". Nhưng brief `tray_arms` (05:339) ghi "quỳ sát bức tường, xa cửa sổ... gần đó không có bàn", còn `tray_leg` là nắm chân bàn: bé vừa ở cạnh tường không có bàn vừa nắm chân bàn.
- Sửa: bỏ ràng buộc "không có bàn" ở `tray_arms` (cho bạn quỳ cạnh bàn, một tay che đầu), hoặc đổi `tray_leg` thành "Hold on tight" · "Bám chắc" với hình bám vào vật chắc (chân bàn, chân ghế). Cũng nhắn designer: ba hình phải cùng một cảnh.

**N4. Bài 5, ví dụ "Tây Nguyên" đứng ngay dưới câu "mảng trượt" (05:164-165, ghi chú 05:168-171).**
- "small ones in the Central Highlands · có trận nhỏ ở Tây Nguyên" nằm trong ô "Động đất", dưới câu "Khi các mảng trượt đột ngột, mặt đất rung lắc". Tây Nguyên ở giữa một mảng, xa ranh giới mảng; biên tập đã nhớ có ý kiến là động đất kích thích do hồ thuỷ điện. Bé sẽ hiểu sai nguyên nhân.
- Sửa: bỏ ví dụ 3 cho tới khi chuyên gia xác nhận; thay bằng "some are too small to feel" · "có trận nhỏ tới mức không cảm thấy" (ý có sẵn ở thẻ `seismograph`).

**N5. Bài 3 q5, lựa chọn đúng "very hot" không rõ là so sánh (03:429-453).**
- Câu hỏi: "How is Earth's core different from an egg yolk?" Lòng đỏ vừa luộc cũng "very hot"; bé có thể chọn "in the middle" với lý do "lòng đỏ không nóng". Giải thích (03:433-436) phải "cứu" bằng "much hotter than any egg".
- Gợi ý (03:431) "which layer is the hottest?" đã lộ đáp án.
- Sửa: label "much hotter" · "nóng hơn nhiều"; gợi ý "Is a yolk as hot as the core?" hoặc bỏ lộ đáp án.

**N6. Nhãn nhóm `limit` lộ món bẫy trước khi bé chọn.**
- 03:229-232: chip "No sea of melted rock · Không chọn biển đá nóng chảy" gọi đúng tên món bẫy; bé tránh được mà không cần hiểu, `has_limited` (03:200) gần như không bao giờ chạy. Bẫy `inside_is_lava` mất tác dụng ở phần Chơi.
- 02:253-257: "No countries · Không chọn quốc gia" cũng báo trước hai lá cờ (nhẹ hơn, vì bé vẫn phải biết cờ = quốc gia).
- Sửa 03: nhãn chung "Not a layer of Earth" · "Không phải lớp của Trái Đất". Sửa 02: có thể giữ.

### Nhỏ

1. **"Tap a picture to take it off" ở cả 5 bài** (01:189, 02:218, 03:195, 04:213, 05:245; VI "chạm vào một hình"). Quyết định ios-dev 9/11: món trên khay hiện bằng chấm và tên, không có hình, nhãn app nói "tap one". Đề xuất: "Tap one to take it off." · "Em chạm vào một món để bỏ ra nhé." (hoặc "một lựa chọn").
2. **01 q3 gợi ý (01:373-374)**: "Where could you build a house?" Ở Việt Nam có nhà nổi trên sông, bè trên hồ; gợi ý có thể dẫn sang cái ao/sông. Dùng "Where can you walk?" như q1.
3. **02 câu EN nghe gượng (02:130, 164)**: "English books count seven continents." / "School books may count differently." Đề xuất: "Books in English say there are seven continents." / "Your school books may group them differently."
4. **02 q4 (02:435-465)** nhắc đảo Cát Bà chưa dạy. Bé chỉ cần biết to nhỏ nên làm được; để dễ hơn thì thêm trong lựa chọn "Cat Ba Island, in Vietnam".
5. **03 từ `layer` (03:524-526)**: alt EN "A piece of layer cake" cho bánh da lợn. "Layer cake" gợi bánh kem nhiều tầng; đổi alt "A slice of layered pandan cake".
6. **03 `has_limited` (03:200-201)** viết tuyệt đối: "There is no sea of melted rock under the crust". Nhân ngoài lỏng và mác-ma ở một số nơi (bài 4). Đề xuất bám q6: "There is no sea of melted rock just below us." · "Ngay dưới chân mình không có biển đá nóng chảy đâu."
7. **03 q4 (03:395-419)**: EN "the stone" cho hạt đào (Anh-Anh). Bé EN-as-second-language có thể đọc thành "hòn đá". Đề xuất "the pit" hoặc "the stone (seed)"; hình đã giúp.
8. **04 q3 (04:394-418)**: lựa chọn "The sun makes it hot" nhưng giải thích sai chỉ nói "It is melted rock, not fire" (không khớp bé chọn Mặt Trời). Thêm vế "The sun does not heat it from inside." hoặc đổi sang "Wind blows lava out"; ngoài ra lựa chọn EN có dấu chấm cuối câu, các bài khác thì không.
9. **04 `tray_shore_rocks` (04:294-296)**: nhãn EN "Rocks by the sea" quá chung, VI "Ghềnh đá đen ven biển". Đề xuất EN "Dark rocks by the sea".
10. **05 q2 và `plate` (05:30-31, 399-409)**: câu đáp án duy nhất "plates are pieces of the crust", lựa chọn sai "mantle". Mảng gồm vỏ và phần trên cùng của lớp manti (đã ghi `[CẦN KIỂM]`). Nếu chuyên gia chốt nói "lớp ngoài cùng cứng" thì sửa q2 cho khỏi dạy bé "mảng chỉ là vỏ".
11. **05 q5 (05:504-515, hình 506)**: Lan đứng một mình, giải thích nói "listen to grown-ups". Thêm một người lớn ở xa trong hình, đang gọi mọi người lên đồi.
12. **05 Khởi động chỉ có 2 câu** và không ôn bài 2 (đã có đề xuất w3 ở `_topic.md` mục "Còn mở"). Đồng ý nên thêm khi build lại.

### Không chắc, cần người khác
- "Bắc Mỹ/Nam Mỹ" thiếu "châu" trong khi mọi châu lục khác có "châu" (02:136-138): đã có `[CẦN KIỂM]`; nếu chốt "châu Bắc Mỹ", đổi cả 02 lẫn bảng ở `_topic.md`.
- Nghe giọng VI (chưa kiểm vì tôi không chạy tts): "manti", "mác-ma", "Nam Đại Dương" so với "châu Đại Dương", câu "có năm đại dương" (chữ "năm").

## Sửa theo rà chữ (content-editor 9/11)

Phạm vi: chỉ sửa 6 file trong `content/discoverer/be-mat-trai-dat/`. Không đổi `slug`, không đổi hay xoá dòng `id:` nào; không đổi `key` nào. Có một khối mới (`w3` của bài năm), `id:` để trống. Chưa chạy `ids`/`validate` (agent không chạy lệnh); main session chạy. Mỗi chỗ sửa có dòng `>` "Rà chữ 9/11" ngay trong bài.

**Luật đã kiểm trước khi sửa N1:** `content/rules.json` (discoverer) chỉ có `misconception_items: [1, 1]`; `tools/content-cli/src/validate/age-rules.ts` chỉ đếm số câu có `misconception_id`. Không có luật nào buộc câu misconception phải có đáp án Sai, nên câu sáu được để Na nói đúng mà vẫn gắn key.

### Nên sửa

- **N1. Đáp án theo thói quen: đã sửa.**
  - Câu sáu, nay là 01 Sai, 02 Sai, 03 Đúng, 04 Sai, 05 Đúng. Hai câu đổi vẫn gắn đúng key của bài.
    - 03 q6 (`inside_is_lava`): Na nói "Deep inside, Earth is hot. But the crust under us is solid." · "Sâu bên trong, Trái Đất rất nóng. Nhưng vỏ Trái Đất dưới chân mình là đất đá rắn chắc.", `answer: true`.
      - Gợi ý mới chỉ vào bằng chứng đời thường: "When people dig deep, do they find melted rock?"
      - Giải thích viết lại: đúng "Yes! Even the mantle below it is mostly solid."; sai "Na is right. Under us is solid crust."
      - Lời Na nói "solid", không nói "solid rock": dưới chân có lớp đất trước khi tới đá.
    - 05 q6 (`quake_just_shaking`): theo đề xuất của tester. Na nói "The ground shakes a little. I still drop, cover and hold on.", `answer: true`. Gợi ý giữ nguyên.
      - Giải thích đúng: "Yes! Shaking can get stronger, and things can fall."
      - Giải thích sai: "Na is right. Shaking can get stronger." Rút ngắn để màn không quá ba mươi từ.
  - **Nhãn của câu sáu, đổi ở cả năm bài.** "Challenge: spot the mistake · Thử thách: bắt lỗi sai" thành "Challenge: check Na's idea · Thử thách: kiểm tra ý của Na".
    - Nhãn cũ sai với câu Na nói đúng.
    - Nếu chỉ đổi ở câu Na đúng thì nhãn lại thành dấu hiệu lộ đáp án ("bắt lỗi sai" là bấm No).
    - Ngoài phạm vi: *Ăn uống lành mạnh* vẫn dùng nhãn cũ. Đề xuất PM thống nhất nhãn (ghi ở `_topic.md`, mục "Còn mở"). Canvas `Discoverer-QuizMyth` vẽ nhãn "Thử thách · bắt lỗi sai", designer xem có đổi không.
  - Khởi động `true_false`, nay là 01 w2 Sai, 02 w2 Đúng, 04 w2 Sai, 04 w3 Đúng, 05 w3 Sai (mới).
    - 01 w2: "Sea water tastes sweet." · "Nước biển có vị ngọt.", `answer: false`, giữ ý kiểm và gợi ý.
    - 04 w2: "The mantle is a layer of melted rock." · "Lớp manti là một lớp đá nóng chảy.", `answer: false`. Thêm hình dùng lại `explore_mantle` của bài ba.
    - Đổi 04 w2 chứ không đổi 04 w3 như đề xuất. Câu w2 kiểm thẳng ý "lớp manti phần lớn vẫn rắn" (nối `inside_is_lava`). Đổi w3 thành "Hòn đảo là nước, có đất bao quanh" thì thành câu đánh đố bằng chữ.
  - Giải thích đúng của câu đáp án Sai không mở đầu bằng "Yes!" hay "Đúng rồi!", như câu w1 bài một *Ăn uống lành mạnh*. Câu đáp án Đúng thì mở đầu "Yes! · Đúng rồi!"; giải thích sai nói "Na is right · Na nói đúng" hoặc "This is false · Câu này sai".
- **N2. Bài một w1: đã sửa cả hai cách.**
  - Câu hỏi: "Which one is round on all sides, like Earth?" · "Vật nào tròn đều mọi phía, giống Trái Đất?"
  - Gợi ý: "Look from the side. Which one is still round?" Thay gợi ý ảnh từ vũ trụ, vốn cho thấy một hình tròn dẹt.
  - Giải thích sai: "The answer is the ball. A clock is flat. Earth is round like a ball."
- **N3. Bài năm Chơi: đã sửa.** `tray_arms` không còn là cảnh "quỳ sát tường, không có bàn".
  - Nay là cùng chiếc bàn với `tray_table` và `tray_leg`: bạn đã ở dưới gầm bàn, một cánh tay che đầu và gáy, khớp hình ô `explore_safe`.
  - Nhãn EN "Arms over head" thành "Arm over head"; VI giữ "Tay che đầu". Alt sửa theo.
  - Brief `tray_kneel` thêm "cạnh chiếc bàn gỗ to, cùng chiếc bàn như `tray_table`"; brief `tray_leg` cũng nói cùng chiếc bàn đó.
  - Ghi chú cho hoạ sĩ: bốn hình của ba bước cùng một cảnh. Hai tổ hợp đạt nay đều hợp lý.
  - Câu q3 (lớp học) giữ "Arms over head" số nhiều: không có bàn thì che đầu bằng hai tay là đúng.
- **N4. Bài năm, ví dụ Tây Nguyên: đã bỏ.**
  - `explore_quake` ví dụ ba nay là "many are too small to feel" · "nhiều trận nhỏ tới mức mình không cảm thấy". Dùng "many", không dùng "some", vì phần lớn động đất nhỏ tới mức chỉ máy đo ghi được.
  - Ghi chú `[CẦN KIỂM]` về Kon Plông và động đất kích thích giữ lại cho chuyên gia, kèm điều kiện đưa ví dụ trở lại.
  - `_topic.md` ("Khi soạn bài 2 đến 5", Bài 5) sửa theo.
- **N5. Bài ba q5: đã sửa.**
  - Lựa chọn đúng: "much hotter" · "nóng hơn nhiều".
  - Gợi ý mới chỉ cách làm, không nhắc độ nóng: "Two answers are true for both. Which is true only for the core?" · "Có hai ý đúng với cả hai. Ý nào chỉ đúng với nhân Trái Đất?"
- **N6. Nhãn nhóm `limit` lộ món bẫy: đã sửa cả hai bài.**
  - Bài ba: "Not a layer of Earth" · "Không phải lớp của Trái Đất", theo đề xuất, cùng kiểu với bài bốn "Not from volcanoes". Chỗ chưa chắc: vỏ trứng, quả bơ cũng không phải lớp của Trái Đất. Lời nhắn `start` đã nói đó là phần của mô hình; nhờ tester xem trên máy.
  - Bài hai: "Only continents and oceans" · "Chỉ chọn châu lục và đại dương", câu khẳng định như bài năm "Only safe things". Không dùng kiểu "Not a continent or an ocean": đứng ngay sau "Ocean" trên dòng điều kiện, bé sẽ đọc thành mâu thuẫn. `has_limited` vẫn nói thẳng "Đó là một quốc gia".

### Nhỏ

1. **`messages.full` cả năm bài: đã sửa.** "No more room! Tap one to take it off." · "Hết chỗ rồi! Em chạm vào để bỏ ra nhé.", khớp nhãn app.
2. **01 q3 gợi ý: đã sửa.** Dùng lại gợi ý q1: "Land is dry. Where can you walk?" · "Đất thì khô ráo. Em đi bộ được ở đâu?"
3. **02 câu EN gượng: đã sửa.**
   - "Books in English say there are seven continents."
   - "Books in English say there are five oceans. Your school books may group them differently."
   - VI giữ nguyên. Hệ quả: màn Học bài hai lên khoảng ba mươi chín từ EN (trước khoảng ba mươi bốn). Đã ghi ở Ghi chú cho dev, kèm cách cắt nếu PM muốn.
4. **02 q4 Cát Bà: không sửa.** Nhãn "đảo Cát Bà" đã nói đó là đảo. Thêm "in Vietnam" thì lựa chọn tự trả lời một nửa phép so sánh lồng nhau (đảo trong quốc gia, quốc gia trong châu lục) mà câu này kiểm. Lý do ghi ở `>` dưới q4.
5. **03 alt từ `layer`: đã sửa.** Alt EN "A slice of layered pandan cake".
6. **03 `has_limited`: đã sửa.** "There is no sea of melted rock just below us." · "Ngay dưới chân mình không có biển đá nóng chảy đâu.", bám câu q6.
7. **03 q4 "the stone": đã sửa thành "the seed"**, cả lựa chọn lẫn hai lời giải thích EN; VI giữ "hạt đào". Key `q4_stone` giữ. Ghi chú: về thực vật, "stone" là vỏ cứng bọc hạt; "seed" là cách nói giản lược, khớp "Avocado seed" ở phần Chơi.
8. **04 q3: đã sửa.**
   - Giải thích sai: "The answer is magma pushing up. Not fire, and not the sun." · "Đáp án là mác-ma đẩy lên. Không phải lửa, cũng không phải Mặt Trời."
   - Bỏ dấu chấm cuối ở ba lựa chọn (EN và VI).
   - Note của `volcano_is_fire` ở `_topic.md` sửa theo.
9. **04 `tray_shore_rocks`: đã sửa.** Nhãn EN "Dark rocks by the sea".
10. **05 q2 "mảng là phần của vỏ": giữ.** Thêm dòng `[CẦN KIỂM]` dưới q2. Câu khớp ý chính một, ô `explore_plates` và từ `plate` (cùng một cách giản lược). Nếu chuyên gia đổi cách nói thì sửa cả bốn chỗ, và câu q2 nên hỏi lớp mình sống bên trên.
11. **05 q5: đã sửa brief.**
    - Thêm mẹ của Lan đứng gần trên bãi cát, dáng bình thường.
    - Không cho người lớn vẫy gọi lên đồi như đề xuất, vì hình sẽ lộ đáp án "chạy lên chỗ cao".
12. **05 thiếu ôn bài hai: đã thêm `w3`** (`true_false`, DOK 1, `recall_from.lesson: be-mat-trai-dat/cac-chau-luc-va-dai-duong`, không có hình, `id:` trống).
    - Nội dung: "Asia is one country." · "Châu Á là một quốc gia.", `answer: false`.
    - Hỏi lại misconception `continent_is_country` thay ý "Biển Đông" đề xuất cũ. Bài tổng kết như vậy quay lại cả hai misconception đầu chủ đề (w2 đã hỏi lại `earth_mostly_land`).
    - Không gắn key, vì luật chỉ đếm ở Quiz. Khởi động bài năm nay có ba câu, đúng mức tối đa.

### Câu đổi chữ (clip cần sinh lại, EN và VI trừ khi ghi khác)
- **01:**
  - w1: `prompt`, `hint`, `explanation_wrong`;
  - w2: `prompt`, `explanation_correct`, `explanation_wrong`;
  - `tray`: `messages.full`;
  - q3: `hint`;
  - q6: `instruction`.
- **02:**
  - `explore_more_continents.sentence` (chỉ EN);
  - `explore_more_oceans.sentence` (chỉ EN);
  - `tray`: `messages.full`, nhãn nhóm `tray_countries`;
  - q6: `instruction`.
- **03:**
  - `tray`: `messages.full`, `messages.has_limited`, nhãn nhóm `tray_melted`;
  - q4: nhãn `q4_stone`, `explanation_correct`, `explanation_wrong` (cả ba chỉ EN);
  - q5: `hint`, nhãn `q5_hot`;
  - q6: `instruction`, `statement`, `hint`, `explanation_correct`, `explanation_wrong`.
- **04:**
  - w2: `prompt`, `hint`, `explanation_correct`, `explanation_wrong`;
  - `tray`: `messages.full`, nhãn `tray_shore_rocks` (chỉ EN);
  - q3: `explanation_wrong`, ba nhãn lựa chọn (chỉ bỏ dấu chấm);
  - q6: `instruction`.
- **05:**
  - w3 (mới): `prompt`, `hint`, `explanation_correct`, `explanation_wrong`;
  - `explore_quake`: ví dụ ba (`examples.3`);
  - `tray`: `messages.full`, nhãn `tray_arms` (chỉ EN);
  - q6: `instruction`, `statement`, `explanation_correct`, `explanation_wrong`.
- **Không phải clip:** alt và brief (03 `layer`; 04 w2 thêm hình; 05 `tray_kneel`, `tray_arms`, `tray_leg`, q5), `note` của misconception ở `_topic.md`, các dòng `>`.
- **Clip VI tự kiểm:** "Thử thách: bắt lỗi sai" có mục riêng trong `tools/content-cli/tts-vi/variants.json`; câu thay thế "Thử thách: kiểm tra ý của Na" có thể cần mục tương tự.

### Còn chưa chắc
- Nhãn `limit` bài ba "Không phải lớp của Trái Đất" có làm bé ngại chọn vỏ trứng, quả bơ không: cần xem trên máy.
- 04 w2 coi "Lớp manti là một lớp đá nóng chảy" là Sai, dựa trên cách giản lược "phần lớn vẫn rắn" (đã `[CẦN KIỂM]`).
- Số từ EN mỗi màn sau sửa:
  - q6 bài ba và bài năm khoảng ba mươi;
  - 01 w1 khoảng hai mươi tám;
  - màn Học bài hai khoảng ba mươi chín (xem Nhỏ 3).
- Vị trí đáp án đúng không đổi ở câu nào; ý "vị trí 2 hơi nhiều" của tester chưa xử lý vì không nằm trong danh sách sửa.

## Kết quả chạy lệnh (main session 9/11)
- `ids`, `validate content`: 0 lỗi; cảnh báo chỉ còn `md_needs_check`. `content/syllabus.json` gắn `topic_id` và 5 `lesson_id` cho `new-earth-surface`, `level: 3`.
- **TTS:**
  - Lượt 1: EN 473 clip mới (6 phút 24 giây); VI 478 clip mới (51 phút 42 giây, tự kiểm 46 phút).
  - Lượt 2, sau khi sửa theo tester: EN 39 clip mới, VI 32 clip mới.
  - Còn 16 clip VI bị đánh dấu, chờ Duy nghe:
    - phần lớn có chữ "mác-ma" (máy nghe ra "mát ma" hoặc "bác ma");
    - còn có "manti" (nghe ra "malti"), "Ghềnh", "nguội", "sóng", "Na".
  - 20 cảnh báo `loanword` cho "manti": đề xuất dev thêm cách đọc ép vào `READINGS` sau khi Duy nghe.
- **Gói:**
  - `build --require-lang en,vi`: 2 chủ đề, 7 bài, 638 clip EN, 678 clip VI, 33,3 MB.
  - `check-pack.sh`: OK.
- **iOS unit test:**
  - Lần 1 đỏ 2 test, đều vì test giả định chỉ có 1 chủ đề đã soạn: `SyllabusTests.healthyEatingCarriesTheWrittenLessons`, `ContentPackTests.builtPackRefusesAChangedPackJSON`.
  - Main session sửa 2 test này để không phụ thuộc số chủ đề.
  - Chạy lại ContentKitTests 25/25, ContentModelTests 25/25. Các bộ khác đã qua ở lần 1.
  - UI test chưa chạy lại.
- Bản Release đã cài lên iPhone Luu. Chưa mở được app vì iPhone đang khoá màn hình.
