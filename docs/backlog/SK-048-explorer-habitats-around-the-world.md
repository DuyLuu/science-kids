# SK-048 · Chủ đề Explorer mới "Những nơi sống trên Trái Đất" (Habitats around the world, 8 bài)

Trạng thái: review · Ngày: 2026-11-16 · Phụ trách: content-editor (soạn) · designer (ảnh) · phiên chính chạy lệnh · Tester: tester
Nguồn: Duy 16/11 (yêu cầu; chốt câu 1–7, rồi câu 8, 9); [docs/explorer-habitats-proposal.md](../explorer-habitats-proposal.md) (đề xuất đầy đủ, đã chốt); [docs/oak/geography-y2-cold-and-hot-places.md](../oak/geography-y2-cold-and-hot-places.md) (Oak Địa lý Year 2, đọc 16/11); `syllabus.md` mục 1–3; `syllabus-progression.md` mục 3, 5.1, 6–8; `content/syllabus.json`; `content/TEMPLATE.md` (bảy luật Explorer, mục SK-044, SK-047); `content/rules.json` (`explorer.authoring`); SK-041, SK-045, SK-046 (khuôn soạn và rà chữ Explorer); SK-033 (ảnh)

> **Duy đã chốt cả chín câu ngày 16/11** (nút "Theo đề xuất PM", hai lượt; chi tiết ở "Quyết định đã ghi"). Không còn câu nào chờ Duy.
> **Tài liệu đã sửa 16/11** (phần pm của "Việc kéo theo"), trừ dòng `docs/backlog/README.md`.
> **16/11 chiều: đã soạn xong.** Duy (qua phiên chính, sau khi SK-047 commit `ba17d26`): "commit gộp r làm luôn chỉ đề mới môi trường và động vật hoang dã", tức là làm ngay, không chờ SK-045, SK-046 đóng rà chữ (thay câu 7 = a).
> - Danh mục 46 chủ đề / 394 bài, `topic_id` và 8 `lesson_id` đã ghi; `syllabus.test.ts` sửa; dòng README đã thêm.
> - 8 bài: tester rà 1 chặn, 3 nên sửa (đã sửa hết); ảnh 299/299 chỗ, 137 ảnh, 0 BY-SA/NC/ND; TTS EN + VI (74 clip VI chờ Duy nghe); gói 11 chủ đề `check-pack` OK; chạy trọn bài 1 trên iPhone 16; icon chủ đề mới.
> - Kiểm nghiệm thu (tester, mục cuối): 25 đạt, 0 không đạt; còn chờ người chuyên môn đọc 142 dòng `[CẦN KIỂM]` (PM1) và Duy nghe 74 clip VI.
> - Chưa commit.

## Mục tiêu

Bé Explorer 5–7 tuổi nhận ra vài nơi sống lớn trên Trái Đất qua nóng, lạnh, ướt, khô, và biết con vật hoang dã nào sống ở mỗi nơi, chỉ bằng nghe và nhìn.

## Phạm vi / Ngoài phạm vi

### Phạm vi
- Chủ đề mới `content/explorer/<slug>/`: `_topic.md` và 8 bài (proposal mục 4).
  - Tên *Habitats around the world · Những nơi sống trên Trái Đất*. Slug đề xuất `noi-song-tren-trai-dat`; key danh mục `new-habitats-around-the-world`.
  - Vị trí Explorer #4, ngay sau *Chuỗi thức ăn*.
  - Tám bài, theo thứ tự, kèm `stage` và key misconception (bài 1, 2 dùng misconception của Oak; bài 3–8 content-editor được đổi sang phương án khác ở proposal mục 4, có lý do):

    | # | Bài (EN · VI) | `stage` | Misconception |
    | --- | --- | --- | --- |
    | 1 | The Arctic · Bắc Cực | `opener` | `polar_bears_eat_penguins` (Oak lesson 5) |
    | 2 | The Antarctic · Nam Cực | `core` | `polar_bears_in_antarctic` (Oak lesson 6) |
    | 3 | Rainforests · Rừng mưa nhiệt đới | `core` | `forest_animals_on_ground` |
    | 4 | Mangroves and swamps · Rừng ngập mặn và đầm lầy | `core` | `swamps_have_no_life` |
    | 5 | Oceans · Biển và đại dương | `core` | `sea_same_everywhere` |
    | 6 | Savannas · Đồng cỏ xavan | `core` | `lions_live_in_jungle` |
    | 7 | Deserts · Sa mạc | `apply` | `camel_hump_water` |
    | 8 | Every animal has its place · Mỗi con vật một nơi sống | `review` | `animals_live_anywhere` |
- File chọn ảnh `content/images/explorer/<slug>/*.json`.
- Phiên chính chạy `validate`, `ids`, `images fetch`, `tts`, `build`, `check-pack`.
- Thêm chủ đề vào `content/syllabus.json`, sửa `tools/content-cli/test/syllabus.test.ts` (dev). Tài liệu đã sửa 16/11.

### Ngoài phạm vi
- Bản Discoverer (câu 2 = a; xem lại sau beta).
- Bản đồ, quả địa cầu, ảnh Trái Đất từ vũ trụ (câu 6 = a).
- Khái niệm và từ "thích nghi · adaptation" (câu 5 = a).
- Phá rừng, động vật gặp nguy, biến đổi khí hậu, băng tan, khu bảo tồn, thiên tai: thuộc Discoverer #16.
- Phần con người trong Oak Địa lý: con người ở vùng cực và Hiệp ước Nam Cực (unit 3 lesson 7, 8); người sống ở Xa-ha-ra, người Tuareg (unit 4 lesson 3); chuyến đi tới nơi nóng (unit 4 lesson 4).
- Dạng câu mới (`sort_into_groups` để sau beta), màn app mới, khoá bộ thẻ mới (dùng lại `set: animals`).
- Hai chủ đề Explorer mới của câu D3 trong `docs/syllabus-review-2026-11-13.md`.

## Tiêu chí nghiệm thu

### Bước 0 · chốt và danh mục (pm, phiên chính)
- [x] Duy trả lời bảy câu (nay ở "Câu hỏi 1–7"); ngày và lựa chọn ghi vào "Quyết định đã ghi". (16/11: cả bảy theo đề xuất PM.)
- [x] PM đọc trang Oak Geography KS1, xem có unit "vùng nóng, vùng lạnh của thế giới" làm sườn được không; ghi kết quả vào ticket. Nếu có, đề xuất lại cho Duy trước khi giao content-editor.
  **Kết quả 16/11** (phiên chính đọc trang, PM tóm tắt; chi tiết ở [docs/oak/geography-y2-cold-and-hot-places.md](../oak/geography-y2-cold-and-hot-places.md)):
  - **Có, ở Year 2.** Unit 3 *Cold places* có 8 lesson; lesson 5 `arctic-wildlife` và lesson 6 `antarctic-wildlife` là hai bài riêng, mỗi bài một misconception về gấu trắng và chim cánh cụt. Unit 4 *Hot places* có 4 lesson; lesson 2 rừng mưa nhiệt đới, lesson 3 sa mạc nóng. Oak học unit 3 trước unit 4.
  - Bốn lesson này làm sườn một phần cho bài 1, 2, 3, 7. Xavan, đầm lầy, rừng ngập mặn không có trong KS1 Địa lý. Biển chỉ có ở mức vị trí đại dương (Year 1 *Continents and oceans*).
  - Không dùng hết được. Cả hai unit dựa vào bản đồ, quả địa cầu; có biến đổi khí hậu; có phần con người. Ý "gấu trắng ngủ đông" không chính xác. Quiz có câu "cây ở sa mạc là xương rồng".
  - Oak chỉ dùng chữ "adapt" cho con người. Với con vật, Oak nói "đặc điểm giúp", khớp câu 5 = a.
  - Đã đề xuất lại cho Duy: câu 8 (tách vùng cực), câu 9 (lạnh trước nóng). Duy chốt cả hai 16/11.
- [x] Duy trả lời câu 8, 9; ngày và lựa chọn ghi vào "Quyết định đã ghi". (16/11: cả hai theo đề xuất PM.)
- [x] `content/syllabus.json` có chủ đề mới ở #4 (16/11, sau khi SK-047 commit; `topic_id` và 8 `lesson_id` đã ghi; test 46/394 xanh; `validate content` 0 lỗi):
  - `key: new-habitats-around-the-world`, `source.kind: new`, `strand: living_environment`, `level: 3`, tên *Habitats around the world · Những nơi sống trên Trái Đất*;
  - 8 bài đúng thứ tự và tên EN/VI ở bảng "Phạm vi" (khớp `syllabus-lessons.md`); mỗi bài `oak_lessons: []`, `statutory: false`;
  - các chủ đề #4–#12 cũ đánh lại `number` thành #5–#13.

  `tools/content-cli/test/syllabus.test.ts` sửa thành "3 nhóm, 46 chủ đề, 394 bài" trong cùng lần; test xanh. `validate` 0 lỗi. Bản test của app hiện chủ đề mới đúng chỗ, các bài báo "chưa có nội dung".
- [x] Tài liệu sửa xong theo "Việc kéo theo" (phần pm), làm một lần sau câu 8, 9. (16/11; dòng README chờ phiên SK-047.)

### content-editor
- [ ] `_topic.md`: `age_group: explorer`, `order: 4`, `strand: living_environment`, `level: 3`, `difficulty` 2-3-2-2-2 (hoặc chấm lại, có lý do), `prerequisites: [goi-ten-va-nhom-dong-vat, sinh-vat-song-o-dau]`, `is_free: false`, không `oak_unit_ref`, `ai_draft: true`.
  - Mục Nguồn ghi các lesson Oak Địa lý dùng làm sườn (năm, unit, slug) cho bài 1, 2, 3, 7 và trỏ tới `docs/oak/geography-y2-cold-and-hot-places.md`.
  - Có các mục như `sinh-vat-song-o-dau/_topic.md`: Tên gọi, Quy ước hình, Hình dùng chung, Đúng/Sai, Khởi động, Chơi, Thẻ thưởng, An toàn, Ranh giới, Còn mở.
- [ ] Đúng 8 bài, đúng thứ tự và `stage` ở bảng "Phạm vi"; tên bài EN/VI khớp `content/syllabus.json` từng chữ.
- [ ] Mỗi bài theo luật Explorer:
  - Khởi động 2–3 câu DOK 1, chỉ `single_choice` và `true_false`, câu nào cũng có `recall_from`;
  - Quiz 6 câu, DOK 1·1·1·2·2·2;
  - đúng một câu misconception ở câu 6; key có trong `_topic.md`, mỗi key dùng một lần, không trùng key của ba chủ đề Explorer trước;
  - bài 1, 2 dùng đúng key `polar_bears_eat_penguins`, `polar_bears_in_antarctic` (misconception của Oak); bài 3–8 dùng key ở bảng "Phạm vi" hoặc phương án khác ở proposal mục 4, ghi lý do trong `_topic.md`; không dùng `polar_bears_meet_penguins` (bản gộp đã bỏ);
  - chỉ `single_choice` (2–3 lựa chọn), `true_false`, `order_sequence` (3 thẻ); mỗi bài ít nhất hai dạng;
  - mỗi câu EN tối đa 8 từ; `true_false` là câu khẳng định, không có `labels`.
- [ ] Khởi động bài 1 (Bắc Cực) có:
  - một câu ôn ý chung "nơi sống" của *Sinh vật sống ở đâu?* bài 4: nơi sống cho con vật thức ăn, nước, chỗ trú. Không hỏi một nơi cụ thể của bài đó;
  - một câu ôn *Gọi tên và nhóm động vật*.

  Bài 8 có một câu ôn chủ đề khác, cách khoảng một tháng (`plants_grow_anywhere` của #2 bài 5).
- [ ] SK-044: mọi lựa chọn sai có `feedback` một câu, tối đa 8 từ EN, nói về chính vật bé chọn; `true_false` có `feedback_true` hoặc `feedback_false` đúng phía.
- [ ] SK-047: `hint`, `feedback`, giải thích không nhắc vị trí thẻ. `explanation_correct` của câu 6 dạng `true_false` đáp án Sai đứng một mình được (không "Yes!", không "This is false.").
- [ ] Mỗi câu `order_sequence` có đúng một thứ tự đúng.
- [ ] Từ vựng 4–5 từ mỗi bài, 2–3 từ `core`, khớp `word_list.term_keys`. Theo câu 5 = a: grep "adaptation", "adapt", "thích nghi" trong chữ bé nghe ra 0 kết quả.
- [ ] Ranh giới:
  - không câu ghép con vật với nơi sống y như quiz Oak Science (proposal mục 2.2 ý 4); không chép câu và lựa chọn của quiz Oak Địa lý (dùng ý, viết lại);
  - không chuỗi thức ăn, mũi tên, cảnh săn mồi (câu "gấu trắng ăn chim cánh cụt" ở bài 1 chỉ bằng lời và hai ảnh riêng); không phá rừng, động vật gặp nguy, biến đổi khí hậu, băng tan, thiên tai;
  - không "gấu trắng ngủ đông"; không dạy mùa ở bài 1, 2; không con người ở vùng cực hay sa mạc;
  - không dùng ảnh đồi cát Việt Nam làm sa mạc; không gọi lạc đà là động vật hoang dã; không đặt xương rồng ở Xa-ha-ra.
- [ ] Mọi sự thật chưa chắc có dòng `> [CẦN KIỂM]` ngay dưới; danh sách chép vào ticket (mục "Cần kiểm chuyên môn" dưới đây là điểm xuất phát).
- [ ] "Ghi chú cho hoạ sĩ" mỗi bài liệt kê ảnh mới, ảnh dùng lại, ảnh khó.

### designer
- [ ] Mọi chỗ có hình (câu hỏi, lựa chọn, thẻ `order_sequence`, món Chơi, ô Học, từ, thẻ thưởng) có mục trong file chọn ảnh; 0 chỗ trống.
- [ ] Ảnh nguồn ngoài chỉ CC0, PD, PDM hoặc CC BY có ghi công; 0 ảnh BY-SA, NC, ND hay không rõ giấy phép; đã mở trang gốc kiểm. `images fetch content/images/explorer/<slug>` 0 lỗi, 0 cảnh báo tỉ lệ.
- [ ] Ảnh mang tên một nơi (Xa-ha-ra, A-ma-dôn, Cần Giờ, Tràm Chim…) có địa điểm khớp ở trang gốc; không khớp thì báo content-editor bỏ tên nơi ở brief và `alt`.
- [ ] Con vật hoang dã: không chuồng, lưới, hàng rào sở thú, người, xe, thuyền, vòng đeo cổ, yên cương, dây cương (lạc đà, tuần lộc); không cảnh săn mồi, máu, xác; không chữ, logo.
- [ ] Không bản đồ, không quả địa cầu, không ảnh Trái Đất từ vũ trụ (câu 6 = a).
- [ ] Món không có ảnh hợp lệ: báo content-editor đổi món. Hình tự vẽ chỉ khi PM ghi đồng ý trong ticket.

### tester
- [ ] Rà chữ theo khuôn SK-041, SK-046: 0 mục chặn; mục "nên sửa" đã sửa hoặc có quyết định của PM.
- [ ] Đọc mọi dòng `[CẦN KIỂM]` ở mức hợp lý với trẻ 5–7 tuổi (không thay người chuyên môn).

### phiên chính
- [x] `validate content/explorer/<slug>` 0 lỗi; `ids` chạy theo thứ tự `_topic.md`, rồi bài 1 tới bài 8. (16/11)
- [x] `images fetch` 0 lỗi; `tts` EN và VI (ghi số clip VI bị đánh dấu chờ Duy nghe); `build`; `check-pack` OK. (16/11: 748 clip VI, **74 bị đánh dấu chờ Duy nghe**, report `content/.audio/report-noi-song-tren-trai-dat-01_02_03_04_05_06_07_08-vi.json`; gói 11 chủ đề, 1325 ảnh, `check-pack` OK)
- [x] Một bài chơi trọn Khởi động → Học → Chơi → Quiz → Tổng kết → Thưởng trên simulator iPhone 16, một máy, một lần (không dùng iPhone 16 Pro). (16/11, ios-dev: bài 1 Bắc Cực; xem mục cuối)

### pm (đóng ticket)
- [ ] Người chuyên môn đọc hết các dòng `[CẦN KIỂM]` trước khi phát hành; ghi người đọc và ngày.
- [ ] `syllabus.md`, `syllabus-lessons.md`, `syllabus-progression.md`, `prd.md`, `technical-plan.md`, `docs/backlog/README.md` khớp 46 chủ đề, 394 bài, Explorer 13 / 83, vị trí #4; khớp số đếm của `content/syllabus.json` và `syllabus.test.ts`. (Tài liệu đã khớp từ 16/11; còn README và danh mục.)

## Phụ thuộc · Quyết định đã ghi · Câu hỏi đã chốt

### Phụ thuộc
- SK-045, SK-046 đóng rà chữ (câu 7 = a; 16/11 cả hai ở `review`): chủ đề này dùng lại ảnh và tên gọi của hai chủ đề đó, và Khởi động trỏ vào chúng.
- Phiên SK-047 commit xong trước khi sửa `content/syllabus.json`, `syllabus.test.ts`, `docs/backlog/README.md` (mục "Việc kéo theo").
- SK-040 (app chạy bài Explorer); SK-043, SK-044, SK-047 (màn A2, phản hồi, xáo lựa chọn, Tổng kết).
- Mạng tới Commons và Openverse (từng trả 429; giãn nhịp, mỗi lúc một tiến trình).

### Quyết định đã ghi
- **Duy 16/11 (yêu cầu):** thêm vào Explorer một chủ đề về môi trường sống của động vật hoang dã (savan châu Phi, đầm lầy, rừng Amazon, sa mạc Sahara, Bắc Cực…).
- **Duy 16/11 (chốt bảy câu, nút "Theo đề xuất PM"):**
  1. **A** · 7 bài: rừng mưa nhiệt đới; rừng ngập mặn và đầm lầy; biển; đồng cỏ xavan; sa mạc; Bắc Cực và Nam Cực; tổng kết. (Câu 8 sau đó tách vùng cực, nên chủ đề có 8 bài.)
  2. **a** · Chưa làm bản Discoverer; xem lại sau beta.
  3. **C** · Explorer #4, ngay sau *Chuỗi thức ăn*; *Thu, đông và mùa khô* và các chủ đề sau lùi một bậc.
  4. **A** · *Habitats around the world · Những nơi sống trên Trái Đất*.
  5. **a** · Không dùng "thích nghi · adaptation"; nói bằng điều nhìn thấy, dùng "giúp", không nói con vật "thay đổi để".
  6. **a** · Không bản đồ, quả địa cầu; nói "rất xa", "châu Phi", "phía bắc", "phía nam" bằng lời.
  7. **a** · Soạn sau khi SK-045, SK-046 đóng rà chữ; không chen việc của pilot Discoverer (mốc 16/1/2027).
- **Duy 16/11 (chốt câu 8, 9 về Oak Địa lý, nút "Theo đề xuất PM"):**
  8. **b** · Tách Bắc Cực và Nam Cực thành hai bài theo Oak Y2 Địa lý lesson 5 `arctic-wildlife`, lesson 6 `antarctic-wildlife`. Chủ đề có 8 bài; Explorer 13 chủ đề / 83 bài; cả app 46 chủ đề / 394 bài.
  9. **b** · Lạnh trước nóng theo Oak (unit 3 *Cold places* trước unit 4 *Hot places*). Thứ tự: Bắc Cực → Nam Cực → rừng mưa nhiệt đới → rừng ngập mặn và đầm lầy → biển → xavan → sa mạc → tổng kết.
- **Duy 16/11 (sau khi soạn xong):** bản đồ Hành trình giữ #4 *Những nơi sống trên Trái Đất* thành một chặng riêng (Chặng 3 của Explorer, 5 chặng), không gộp vào chặng Year 2.
- **PM 16/11** (chi tiết, Duy đổi được):
  - Chủ đề mới: `source.kind: new`, `oak_lessons: []`, `statutory: false`; mục tiêu "I can…" tự viết.
  - Mức 3 (2-3-2-2-2 = 11); mạch Sinh vật & môi trường (`living_environment`). Cách chấm ở proposal mục 1.2.
  - `prerequisites: [goi-ten-va-nhom-dong-vat, sinh-vat-song-o-dau]`.
  - Thẻ thưởng dùng lại `set: animals`, nên không cần khoá giao diện mới.
  - Không có câu lời Na. Câu 6 là câu misconception bằng hình, DOK 2; ưu tiên `true_false` đáp án Sai để Tổng kết có thẻ "Ý sai → Ý đúng".
  - Loài có trong quiz Oak Science (gấu trắng, lạc đà, cá hề, voi, đười ươi, kỳ nhông, hà mã) dùng được ở Học, Chơi và trong câu khác dạng; không làm câu ghép con vật với nơi sống y như quiz Oak.
  - Chữ cho bé dùng "nơi sống"; không "nhà", không "môi trường sống".
  - `stage`: bài 1 `opener`, bài 2–6 `core`, bài 7 `apply`, bài 8 `review`.
  - Khởi động bài 1 (Bắc Cực) vẫn ôn #2 bài 4, nhưng chỉ ý chung "nơi sống" (nơi sống cho con vật thức ăn, nước, chỗ trú), vì ý này không riêng nơi nào. Bài 3 (rừng mưa) nên ôn "rừng" của #2 bài 4 để nối rừng với rừng mưa.
- **PM 16/11, sau khi đọc Oak Địa lý** (không cần Duy):
  - Giữ `source.kind: new` và mỗi bài `oak_lessons: []`, vì `oak_lessons` trong `content/syllabus.json` chỉ ghi lesson Oak Science. Lesson Oak Địa lý ghi ở `_topic.md` mục Nguồn và ở `docs/oak/geography-y2-cold-and-hot-places.md`.
  - Bài có lesson Oak Địa lý dùng misconception của Oak khi hợp tuổi: bài 1, 2 dùng misconception của lesson 5, 6. Bài 3 (rừng mưa) giữ `forest_animals_on_ground` (misconception Oak "thời tiết và khí hậu là một" quá trừu tượng). Bài 7 (sa mạc) giữ `camel_hump_water` (misconception Oak nói về con người).
  - Chỗ lệch Oak Địa lý chỉ ghi lại, không hỏi lại, vì Duy đã chốt hoặc ranh giới đã có (chi tiết ở proposal mục 2.2 ý 6):
    - bỏ bản đồ, quả địa cầu (câu 6);
    - bỏ biến đổi khí hậu, động vật bị đe doạ (thuộc Discoverer #16);
    - không dùng ý "gấu trắng ngủ đông" (không chính xác);
    - không theo câu quiz Oak "cây ở sa mạc là xương rồng" (ranh giới: không đặt xương rồng ở Xa-ha-ra);
    - bỏ phần con người: người sống ở vùng cực, Hiệp ước Nam Cực, người sống ở sa mạc, người Tuareg;
    - không dạy mùa ở bài 1, 2 (băng theo tháng, chim cánh cụt tới và đi theo mùa), vì hai chủ đề mùa của Explorer đứng sau #4. Chỉ giữ ý nhìn được bằng ảnh: chim cánh cụt hoàng đế đứng sát nhau cho ấm;
    - ba bài ngoài Oak (đất ngập nước, biển, xavan) đứng giữa rừng mưa và sa mạc, theo trục ướt tới khô; thứ tự tương đối của bốn lesson Oak giữ nguyên.

### Câu hỏi 1–7 (đã chốt 16/11; giữ làm hồ sơ)

| # | Câu hỏi | Lựa chọn | Đề xuất PM | Duy 16/11 |
| --- | --- | --- | --- | --- |
| 1 | Số bài và cách gộp | **A** · 7 bài: rừng mưa nhiệt đới; rừng ngập mặn và đầm lầy; biển; đồng cỏ xavan; sa mạc; Bắc Cực và Nam Cực; tổng kết. **B** · 6 bài: như A, bỏ bài Biển (biển đã có ở #1 bài 8, #2 bài 4). **C** · 5 bài: gộp xavan với sa mạc, bỏ bài Biển, đưa biển vào bài tổng kết. **D** · 8 bài: như A, tách rừng ngập mặn và đầm lầy | **A.** Đủ các nơi Duy kể và ba nơi bé Việt Nam liên hệ được; một bài một nơi vừa sức bé 5–7 tuổi. Gộp rừng ngập mặn với đầm lầy vì #2 bài 4, 5 đã dạy rừng ngập mặn. C quá tải một bài; D lặp #2 | **A** (đã chốt; câu 8 tách vùng cực nên thành 8 bài) |
| 2 | Có làm bản Discoverer không; nếu có thì khác gì | **a** · Chưa làm. Discoverer gặp lại ý này ở #1 bài 2 (châu lục, đại dương), #5 (thời tiết), #16 bài 8–17 (môi trường, mối đe doạ, bảo tồn). **b** · Làm chủ đề Discoverer mới khoảng 5 bài: bé đọc chữ EN; có bản đồ thế giới (duyệt pháp lý như #1 bài 2), xích đạo và hai cực; biểu đồ cột tranh về nhiệt độ, lượng mưa; chuỗi thức ăn ở từng nơi; câu DOK 3 `claim_check`. Theo luật 9/11 chủ đề này đứng #6, đẩy *Đá và đất* ra khỏi "6 chủ đề đầu" của pilot, nên phải đặt sau pilot (lệch luật). **c** · Thêm vài bài vào Discoverer #16 (lệch Oak ở cấp bài) | **a.** Phần cho tuổi 7–9 đã có ở #16; thêm chủ đề sẽ đụng phạm vi pilot. Xem lại sau beta | **a** (đã chốt) |
| 3 | Vị trí trong Explorer | **A** · #1, theo luật 9/11 "chủ đề mới đứng đầu". **B** · #3, ngay sau *Sinh vật sống ở đâu?*, trước *Chuỗi thức ăn*. **C** · #4, ngay sau *Chuỗi thức ăn*; từ *Thu, đông và mùa khô* trở đi lùi một bậc. **D** · #13, cuối nhóm | **C.** Đủ nền của #1–#3 và giữ cụm ba chủ đề Duy xếp 14/11. A đặt chủ đề trước nền của nó; D cách #2 quá xa. Nếu Duy chốt cả câu D3 (13/11), PM xếp ba chủ đề mới một lần | **C** (đã chốt) |
| 4 | Tên chủ đề EN/VI | **A** · Habitats around the world · Những nơi sống trên Trái Đất. **B** · Wild animals around the world · Động vật hoang dã khắp Trái Đất. **C** · Where wild animals live · Môi trường sống của động vật hoang dã | **A.** Dùng lại từ "habitat · nơi sống" bé học ở #2 bài 4. B hút bé hơn nhưng không có "nơi sống". C đúng chữ sách giáo khoa [CẦN KIỂM] nhưng lệch bảng tên gọi của #2, và dễ lẫn với "Sinh vật sống ở đâu?". Câu hỏi lớn của chủ đề có thể là "Where do wild animals live?" · "Động vật hoang dã sống ở đâu?" | **A** (đã chốt) |
| 5 | Dùng từ "thích nghi · adaptation" ở tuổi 5–7 không | **a** · Không dùng. Nói bằng điều nhìn thấy ("Thick fur keeps it warm." · "Lông dày giữ ấm"); dùng "giúp", không nói con vật "thay đổi để". **b** · Dùng làm từ `extra` (chỉ nghe, không hỏi) ở bài 7. **c** · Dạy làm từ `core`, có câu hỏi | **a.** Oak dạy ở Y6 (Scientist #14 bài 8, 10–12), sớm hơn bốn năm. Trẻ dễ hiểu thành "con vật tự đổi cơ thể vì cần", một quan niệm sai khó sửa. Điểm C và D lên 3 làm chủ đề thành Mức 4, vượt khung Explorer | **a** (đã chốt) |
| 6 | Bản đồ, quả địa cầu để chỉ nơi xa | **a** · Không dùng; nói "rất xa", "châu Phi", "phía bắc", "phía nam" bằng lời. **b** · Ảnh Trái Đất từ vũ trụ của NASA, không thấy Đông Nam Á, chỉ ở bài 7. **c** · Bản đồ thế giới chính thức, duyệt pháp lý như Discoverer #1 bài 2 (Biển Đông, Hoàng Sa, Trường Sa) | **a.** Bé 5–7 tuổi chưa đọc bản đồ; tránh thêm một hình phải duyệt pháp lý | **a** (đã chốt) |
| 7 | Khi nào soạn; ưu tiên so với pilot và câu D3 | **a** · Soạn sau khi SK-045, SK-046 đóng rà chữ; không chen việc của pilot Discoverer (mốc 16/1/2027). **b** · Soạn ngay, song song. **c** · Để sau GĐ 0 | **a.** Dùng lại được ảnh và tên gọi đã chốt của #2, #3; không lấy giờ của biên tập và hoạ sĩ khỏi pilot | **a** (đã chốt) |

Số bài trong bảng (bài 6, bài 7) là đánh số của bản 7 bài lúc hỏi.

### Câu hỏi 8–9 về Oak Địa lý (đã chốt 16/11; giữ làm hồ sơ)

Hai câu lộ ra khi đọc Oak Geography KS1 ngày 16/11. Số bài trong bảng là đánh số lúc hỏi.

| # | Câu hỏi | Lựa chọn | Đề xuất PM | Duy 16/11 |
| --- | --- | --- | --- | --- |
| 8 | Bắc Cực và Nam Cực: một bài hay hai bài | **a** · Giữ một bài như câu 1 (7 bài). Lệch Oak: Oak có hai lesson riêng (`arctic-wildlife`, `antarctic-wildlife`). Misconception gộp `polar_bears_meet_penguins` ("Gấu trắng và chim cánh cụt sống cùng một nơi"). **b** · Tách hai bài theo Oak (8 bài): *The Arctic · Bắc Cực* (Oak lesson 5; gấu trắng, cáo Bắc Cực, hải mã, tuần lộc, cú tuyết; misconception Oak `polar_bears_eat_penguins` "Gấu trắng ăn chim cánh cụt") và *The Antarctic · Nam Cực* (Oak lesson 6; chim cánh cụt hoàng đế, chim cánh cụt Adélie, chim cánh cụt Gentoo, hải cẩu Weddell; misconception Oak `polar_bears_in_antarctic` "Gấu trắng sống ở Nam Cực"). Explorer thành 13 chủ đề / 83 bài, cả app 46 / 394 | **b.** Đúng Oak từng lesson. Đúng nguyên tắc "một bài một nơi" PM đặt ở proposal mục 3: bài gộp chỉ còn khoảng hai ô Học cho mỗi nơi. Mỗi bài có sẵn một misconception của Oak; hai misconception sửa cùng một nhầm lẫn từ hai phía, nên bé gặp ý đó hai lần. Đủ ảnh: mỗi bài có ít nhất bốn loài, mỗi loài từ 7 ảnh hợp lệ trở lên (mục "Khả thi ảnh"). Tốn thêm một bài, khoảng 5 ảnh mới, một thẻ thưởng; không đụng pilot vì câu 7 = a | **b** (đã chốt) |
| 9 | Thứ tự bài trong chủ đề | **a** · Giữ "gần tới xa" (proposal mục 3): rừng mưa → đất ngập nước → biển → xavan → sa mạc → vùng cực → tổng kết. Lệch Oak: nơi nóng trước nơi lạnh. **b** · Theo Oak, lạnh trước nóng: vùng cực (Bắc Cực → Nam Cực nếu tách) → rừng mưa → đất ngập nước → biển → xavan → sa mạc → tổng kết. Năm bài nơi nóng và nơi nước giữ thứ tự cũ. Cả hai cách giữ thứ tự trong từng unit Oak (rừng mưa trước sa mạc; Bắc Cực trước Nam Cực) | **b.** Đúng thứ tự unit Oak Year 2. Ý "mở đầu bằng nơi gần nhà" đã có ở #2 *Sinh vật sống ở đâu?* (rừng, ao, rừng ngập mặn), nên #4 không cần lặp lại. Học gấu trắng, chim cánh cụt trước thì các bài sau dùng chúng làm bẫy và câu so sánh; bé gặp lại ý "mỗi con vật một nơi sống" nhiều lần, không chỉ ở bài cuối. Mất: bài 1 là nơi xa nhất, không nối thẳng #2 bài 4. Lý do Oak xếp lạnh trước (dạy hai cực, xích đạo trên bản đồ) không còn khi ta không dùng bản đồ, nên đây là câu Duy chọn theo ưu tiên "theo Oak", không phải câu sư phạm bắt buộc | **b** (đã chốt) |

### Câu cho PM và agent (không cần Duy)
- **PM:**
  - Đọc Oak Geography KS1 (Bước 0): xong 16/11.
  - Sửa proposal mục 3, 4 và tài liệu theo 8 bài: xong 16/11.
  - Còn: giao content-editor khi SK-045, SK-046 đóng; thêm dòng README khi phiên SK-047 commit.
- **content-editor:** chọn misconception chính hay phương án khác ở bài 3–8 (proposal mục 4); chọn thẻ thưởng bài 8.
- **designer:**
  - kiểm loài trong ảnh `goi-ten-va-nhom-dong-vat/chim-va-bo-sat` `tray_penguin` trước khi dùng lại ở bài 1 (bẫy) hay bài 2 (loài sống ở bờ biển ấm thì không dùng ở bài 2);
  - `be-mat-trai-dat/cac-chau-luc-va-dai-duong` `tray_antarctica` là chim cánh cụt Gentoo ở đảo Danco, không phải Adélie; brief và `alt` gọi đúng loài.
- **ios-dev:** xác nhận app chỉ cần danh mục và gói mới, không đổi code (danh mục đọc từ `content/syllabus.json`, SK-030); biểu tượng chủ đề mới cho bản đồ Hành trình (SK-034).

### Cần kiểm chuyên môn (điểm xuất phát; content-editor bổ sung)
- **Vùng cực (bài 1, 2):**
  - gấu trắng chỉ ở Bắc Cực; mọi loài chim cánh cụt ở nửa phía nam (chim cánh cụt Galápagos sát xích đạo); lông dày và lớp mỡ giữ ấm;
  - "gấu trắng ngủ đông": thường chỉ gấu cái mang thai vào hang (để biết vì sao không dùng);
  - chỉ chim cánh cụt hoàng đế ở lại qua mùa đông, đứng sát nhau cho ấm; mọi con vật tới Nam Cực kiếm ăn ở biển; cá voi lưng gù kiếm ăn ở biển Nam Cực mùa hè;
  - tuần lộc ở Bắc Cực là hoang dã hay do người chăn.
- **Rừng mưa (bài 3):** Cúc Phương, Cát Tiên là rừng mưa nhiệt đới; vượn đen má vàng ở Cát Tiên; chim hồng hoàng có ở Việt Nam; ếch phi tiêu độc sống ở tầng đất; tên VI "ếch phi tiêu độc", "khỉ rú".
- **Đất ngập nước (bài 4):** nước lợ ở rừng ngập mặn; đầm lầy Tràm Chim là nước ngọt; sếu đầu đỏ còn về Tràm Chim; khỉ đuôi dài ở Cần Giờ; tên "còng" hay "cáy"; cá sấu Xiêm ở Bàu Sấu.
- **Biển (bài 5):** rùa biển ở Côn Đảo; cá hề ở Nha Trang; cá voi, bò biển ở biển Việt Nam; biển sâu tối và lạnh; san hô do những con vật nhỏ tạo nên.
- **Xavan (bài 6):** mùa mưa, mùa khô và đàn thú di cư; sư tử không sống ở rừng mưa rậm; chiều cao ngựa vằn, voi, hươu cao cổ; trảng cỏ Tây Nguyên khác xavan.
- **Sa mạc (bài 7):** Xa-ha-ra ngày nóng, đêm lạnh; phần lớn là đá, sỏi; lạc đà một bướu hầu như không còn hoang dã; bướu chứa mỡ; xương rồng không mọc tự nhiên ở Xa-ha-ra; cáo fennec ở trong hang ban ngày, tai to giúp toả nhiệt.
- **Chương trình và chữ:** CT GDPT 2018 Tự nhiên và Xã hội lớp 2 về môi trường sống; NGSS K-ESS3-1, 2-LS4-1; Địa lý KS1 đã đối chiếu qua Oak 16/11, còn KS2 (Oak Year 3 *Climate zones*, chưa đọc); nguồn nghiên cứu về quan niệm sai "thích nghi"; cách viết "xavan", "A-ma-dôn", "Xa-ha-ra", "rừng mưa nhiệt đới".

### Việc kéo theo
**Số đếm** (`content/syllabus.json`, đếm 16/11):

| | Chủ đề | Bài |
| --- | --- | --- |
| Explorer hiện tại | 12 | 75 (#1 có 8 bài, gồm 2 bài mở rộng) |
| Discoverer | 17 | 155 |
| Scientist | 16 | 156 |
| Tổng hiện tại | 45 | 386 |
| **Sau khi thêm 8 bài (đã chốt)** | **Explorer 13; tổng 46** | **Explorer 83; tổng 394** |

394 = 384 bài Duy duyệt 9/11 + 2 bài mở rộng của Explorer #1 (đã có trong danh mục, các bản tài liệu trước chưa cộng) + 8 bài của chủ đề mới. Chủ đề mới cả app: 9 (Explorer 1, Discoverer 5, Scientist 3).

- [x] **pm, làm một lần sau câu 8, 9** (16/11):
  - [x] `syllabus.md`: dòng trạng thái đầu file; mục 0 (ghi chú số đếm từ 16/11); mục 1 (Explorer 13 chủ đề, 83 bài); mục 2 (bảng đối chiếu sách bách khoa thêm một dòng, sửa số chủ đề Explorer theo thứ tự mới; ghi chỗ lệch luật "chủ đề mới đứng đầu"); mục 3 (bỏ câu "nhóm này không có chủ đề mới", xếp lại theo `content/syllabus.json`: #2, #3 theo Duy 14/11, thêm #4, đánh số lại #5–#13; #1 có 8 bài; tổng 83); mục 7 (83 bài, ~35 tuần); mục 9 (ghi chú chủ đề mới thứ 9); Nguồn (Oak Địa lý).
  - [x] `syllabus-lessons.md`: xếp lại Explorer theo danh mục; thêm mục chủ đề mới #4 với 8 bài EN/VI và lesson Oak Địa lý; #1 thêm 2 bài mở rộng.
  - [x] `syllabus-progression.md`: dòng trạng thái; mục 4 (bảng mạch: thêm chủ đề, 11 điểm); ghi chú ở mục 5.1.
  - [x] `prd.md` và `technical-plan.md`: thêm ghi chú 16/11 ở dòng cập nhật, trạng thái; sửa các dòng hiện trạng thành 46 chủ đề, 394 bài, Explorer 13 / 83, 9 chủ đề mới. Không viết lại các dòng lịch sử có ngày.
  - [x] `docs/syllabus-review-2026-11-13.md`: ghi chú ở câu D3.
  - [ ] `docs/backlog/README.md`: thêm dòng dưới đây khi phiên SK-047 commit.
- **Chờ phiên SK-047 commit:** `content/syllabus.json` và dòng trong `docs/backlog/README.md`. Phiên đó đang có thay đổi chưa commit ở README và ở `syllabus.test.ts`, và đang chạy app trên simulator.
- **phiên chính (dev nếu schema cần sửa):** thêm chủ đề vào `content/syllabus.json` ở #4 với 8 bài theo bảng "Phạm vi", đánh lại `number` #5–#13; chạy `validate`.
- **dev:** `tools/content-cli/test/syllabus.test.ts` đang khẳng định "3 nhóm, 45 chủ đề, 386 bài" (dòng 95, 101, 109). Thêm chủ đề vào `content/syllabus.json` thì sửa test này trong cùng một lần thành "46 chủ đề, 394 bài", nếu không test đỏ.
- **content-editor:** soạn sau khi SK-045 và SK-046 đóng rà chữ, và PM giao. Không cần sửa `content/TEMPLATE.md`, `content/rules.json` (không có dạng câu mới, không có từ `extra` "adaptation").
- **designer:** ảnh theo brief; một biểu tượng chủ đề mới cho bản đồ Hành trình (SK-034, bộ biểu tượng 45 → 46).
- **ios-dev:** đưa biểu tượng chủ đề mới vào app (SK-034); không cần khoá bộ thẻ mới.
- **tester:** rà chữ theo khuôn SK-041, SK-046.

### Khả thi ảnh (phiên chính kiểm 16/11; chi tiết ở proposal mục 7)
- Kiểm bằng luật giấy phép của `content-cli images search`, chỉ Commons, 40 kết quả đầu, 177 truy vấn (mọi từ khoá ở proposal mục 4 và tên khoa học). Chưa tìm Openverse, chưa mở trang gốc.
- **Cả tám bài làm được bằng ảnh thật.** Không phải bỏ nơi sống nào. Bảng "Ảnh theo bài" ở proposal mục 7.
- **Khó** (tối đa 4 ảnh hợp lệ): ngựa vằn, voi châu Phi (phần lớn ảnh là BY-SA); linh dương Dorcas (0, đề xuất bỏ); chuột nhảy (1 ảnh con sống); rạn san hô ở Việt Nam; sa mạc lúc đêm; xavan mùa mưa; vũng nước; biển sâu tối; cá lồng đèn.
- **Dễ hơn PM đoán:** rừng Cúc Phương (31), Cát Tiên (15), rừng ngập mặn Việt Nam (30), sếu đầu đỏ (13), vượn đen má vàng (9). Điều kiện: tìm bằng truy vấn ngắn hoặc tên khoa học.
- **Vùng cực, dùng cho câu 8:** Bắc Cực: cáo Bắc Cực 25–26, hải mã 12–27 (tuỳ truy vấn), tuần lộc 7, cú tuyết 17, gấu trắng 9 (cộng `tray_arctic` có sẵn). Nam Cực: chim cánh cụt hoàng đế 12, Adélie 18, hải cẩu Weddell 25 (cộng `tray_antarctica`, chim cánh cụt Gentoo, có sẵn). Tách hai bài vẫn đủ ảnh. Số "hải cẩu 31" ở lượt đầu là hải cẩu Greenland, loài sống ở Bắc Cực, không dùng cho bài Nam Cực.
- Brief viết truy vấn hai, ba từ hoặc tên khoa học. Cụm năm, sáu từ trên Commons thường ra 0–3 ảnh.

### Dòng đề xuất cho `docs/backlog/README.md`
Đặt cạnh các dòng SK-041, SK-045, SK-046. PM chưa sửa README: chờ phiên SK-047 commit (mục "Việc kéo theo").

```markdown
| [SK-048](SK-048-explorer-habitats-around-the-world.md) | Chủ đề Explorer mới #4 "Những nơi sống trên Trái Đất" (Habitats around the world, 8 bài) | content-editor, designer; phiên chính chạy lệnh | tester | todo (16/11: Duy chốt 9 câu; tài liệu đã sửa; chờ thêm vào `content/syllabus.json`) | SK-045, SK-046 đóng rà chữ; phiên SK-047 commit |
```

## designer 16/11 · ảnh bài 1

Đã làm: file chọn ảnh `content/images/explorer/noi-song-tren-trai-dat/bac-cuc.json`, **37 / 37** chỗ có hình. `images fetch content/images/explorer/noi-song-tren-trai-dat`: 25 ảnh khác nhau, 16 tải mới, 9 đã có, **0 lỗi, 0 cảnh báo tỉ lệ**, không có dòng "Chưa kiểm tỉ lệ". Kiểm thêm với `max_factor` 1,05: không hình nào lệch khung quá 5%. Không sửa `.md`, không đụng bài 2–8. Nhịp Commons ≥ 4,6 s, một tiến trình (lượt tìm, xem ảnh, đọc trang gốc, fetch); không có 429. Openverse hôm nay 14/190 lượt (đã cộng vào `openverse-usage.json`).

- **Ảnh mới (5), đều là hình gốc của cả chủ đề:** CC0 1 (cáo Bắc Cực, Iceland), Public domain 2 (hải mã NOAA, Bắc Băng Dương; tuần lộc BLM, Alaska), PDM 1 (cú tuyết USFWS, Flickr), CC BY 2.0 1 (băng biển, ảnh USGS của Patrick Kelley, trang gốc thuộc "Photographs of the Arctic Ocean"). Đã mở trang gốc từng ảnh; ảnh Flickr (cú tuyết) kiểm tay: PDM 1.0, "snowy owl in a snowy field in Minnesota", cú hoang dã.
- **Dùng lại:** ảnh Explorer trỏ thẳng tới mục có crop đúng khung (ao, hàng rào tre, mèo 17:10, voọc ô kệ và 5:2, cá sấu ô kệ và 5:2, trâu 5:2, rừng 5:2). Brief ghi `w3_cat`, `q1_reptiles` (*Khủng long*), `w1_buffalo` (*Trái Đất rất lâu về trước*): cùng ảnh đó, nhưng trỏ tới mục Explorer vì `same_as` không sang được nhóm tuổi khác. Ảnh Discoverer (gấu trắng, chim cánh cụt Gentoo, băng trôi Greenland) chép mục gốc.
- **Mục riêng có crop riêng (13):** băng biển 1:1 và 5:2; cáo 1:1 và 4:3; hải mã 1:1 và 5:2; tuần lộc 1:1 và 5:2; cú tuyết 1:1; gấu trắng 1:1 và 4:3; chim cánh cụt 1:1; voọc 17:10; cá thòi lòi 5:2; ao 5:2; băng trôi 1:1. Ảnh cáo và cú tuyết còn rộng, cắt được 5:2 cho bài 3, 4, 7, 8.
- **Gấu trắng (`tray_arctic`):** ảnh public domain nên đã đổi `title` thành "Polar bear on sea ice"; màn Nguồn hình không còn tên "… Face Shorter Sea Ice Season" (mục "Cần kiểm thêm" ở Ghi chú cho hoạ sĩ bài 1 xong). Mọi crop cắt bỏ chữ ký tác giả "Mario Hoppmann" ở góc dưới phải ảnh gốc.

**Hai việc ticket giao**
- `goi-ten-va-nhom-dong-vat/chim-va-bo-sat` `tray_penguin` là **chim cánh cụt Gentoo** (*Pygoscelis papua*): vạch trắng ngang đỉnh đầu, mỏ đỏ cam, chân cam. Trang gốc ghi "Antarctica", thể loại *Pygoscelis papua*. Không phải loài bờ biển ấm, nên bài 2 dùng được ở w2 và chỗ khác. Lưu ý: con chim đứng trên đá, không trên băng; và đừng đặt nó cùng câu với loài chim cánh cụt khác (Quy ước hình 9).
- `be-mat-trai-dat/cac-chau-luc-va-dai-duong` `tray_antarctica`: đúng là Gentoo ở đảo Danco. Đã làm crop vuông riêng cho `tray_penguin`: hai con phía trước, sau lưng là biển có băng vụn và núi tuyết. **Ảnh gốc có khoảng năm du khách** ở góc trên phải (x 0,56–0,80, y 0,17–0,29 của ảnh). Crop vuông bài 1 đã cắt bỏ họ. Crop 4:5 của Discoverer (x 0,18–0,74) vẫn còn họ (người rất nhỏ). Bài 2 `explore_land`, từ `antarctic` và bài 3 `q5_icy_land` cần mục riêng có crop tránh vùng này; Discoverer nên sửa crop của chính `tray_antarctica`.

**Đổi so với brief (đề xuất biên tập sửa `brief`/`alt` trong `.md`):**

| Bài · chỗ | Brief / `alt` | Ảnh thật | Đề xuất |
| --- | --- | --- | --- |
| 1 `tray_penguin` | "Penguins on icy land" · "Chim cánh cụt trên vùng đất phủ băng"; ghi chú "giữ nền băng tuyết" | hai con Gentoo trên bãi sỏi ven biển; băng vụn trên mặt biển và núi tuyết ở phía sau; mặt đất là sỏi, không phải băng | `alt` "Penguins on a cold, stony beach" · "Chim cánh cụt trên bãi đá lạnh"; bỏ "giữ nền băng tuyết". Bài 2, 3 dùng cùng ảnh, nên phiên chính sửa dòng `tray_antarctica` ở bảng Hình dùng chung một lần. Muốn bẫy đứng trên băng thật thì phải đổi sang ảnh khác, báo designer |
| 1 `tray_reindeer`, `q4_reindeer` | "một con tuần lộc có gạc"; `alt` "A reindeer in the snow" | đàn tuần lộc hoang dã Bắc Mỹ (caribou, cùng loài *Rangifer tarandus*; đàn Fortymile, Alaska), kiếm ăn trên sườn đồi tuyết. Ô vuông có hai con, một con có gạc; thẻ 5:2 có năm con. Không có ảnh hợp lệ nào chụp một con rõ trên tuyết mà không có người, dây cương hay nhà | `alt.en` "Reindeer in the snow" (bỏ "A", đúng cho một hay nhiều con); `alt.vi` giữ. Ảnh chụp đàn hoang dã, đúng ý bài không gọi tuần lộc là hoang dã |
| 1 `explore_walrus` (và `tray_walrus`, `q1_walrus`, từ `walrus`) | "nằm nghỉ trên tảng băng nổi giữa biển … có khoảng trống quanh con vật" | một con hải mã nằm trên băng ở Bắc Băng Dương (trang gốc NOAA), thấy rõ hai ngà; không thấy mặt biển. Ô vuông mất phần đuôi; thẻ 5:2 có đầu, ngà và thân, mất vây | Giữ `alt`; brief bỏ "giữa biển" |
| 1 `explore_fox` | "nhìn ngang" | cáo ngồi nhìn thẳng, thấy cả con, đuôi xù, tai nhỏ | Giữ |
| 1 `tray_owl` | cú tuyết trên tuyết | cú tuyết trên cánh đồng tuyết ở Minnesota, nơi cú tuyết trú đông, không phải Bắc Cực; `alt` không có tên nơi | Giữ |
| 1 `q1_mudskipper` | `alt` "A mudskipper on the mud" | cá thòi lòi trên mỏm đá bùn ven nước (cùng ảnh SK-046) | `alt` "A mudskipper by the water" · "Cá thòi lòi bên mép nước", như SK-046 đã đề xuất cho *Sinh vật sống ở đâu?* bài 4; sửa cả hai chủ đề một lần |
| 1 `w2_douc` | "A douc in a tree" | thẻ 17:10 thấy con voọc chính, góc dưới trái có thêm một con thứ hai | Giữ |
| 1 `explore_ice` | ưu tiên ảnh public domain | CC BY 2.0 (ảnh USGS) | Giữ. Nếu PM muốn ảnh public domain: có ảnh USFWS "Sea ice" chụp ở biển Chukchi (mảng băng lớn và khe nước, trời xanh) |

**Còn chưa chắc (cho PM):** trang Commons của ảnh gấu trắng gắn PD-NASA, nhưng tác giả thật là Mario Hoppmann (không phải nhân viên NASA), và Flickr gốc của NASA Goddard ghi CC BY 2.0. Nếu PM coi ảnh này là CC BY 2.0 thì phải giữ tên gốc "Polar Bears Across the Arctic Face Shorter Sea Ice Season", đúng cái tên chủ đề muốn tránh. Ảnh dùng ở sáu chỗ của bài 1 và ở bài 2, 6, 7, 8. Nếu cần đổi, designer tìm ảnh gấu trắng public domain khác. Ảnh USFWS "Polar bear on sea ice" chụp từ trực thăng, con gấu rất nhỏ, nên không dùng được.

## Rà chữ (tester 16/11)

Phạm vi: `content/explorer/noi-song-tren-trai-dat/_topic.md` và tám bài `01-bac-cuc.md` … `08-moi-con-vat-mot-noi-song.md`. Đọc đối chiếu `docs/explorer-habitats-proposal.md` (mục 4, 6, 7), `docs/oak/geography-y2-cold-and-hot-places.md`, `content/TEMPLATE.md` (bảy luật Explorer, mục SK-044, SK-047), `content/rules.json` (`explorer.authoring`), `content/syllabus.json`, và hai chủ đề Explorer trước. Không sửa file nội dung, không chạy lệnh có ghi file, không dùng simulator. Chạy lại `validate` (lệnh chỉ đọc): **9 file · nhóm explorer · 0 lỗi · 9 cảnh báo**, cả 9 là `md_needs_check` (36 + 105 dòng `[CẦN KIỂM]`).

Script kiểm cấu trúc (không phải test sản phẩm) ở `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/8e2fcca1-fbe3-4313-a419-e683eef8228e/scratchpad/sk048/`, chạy bằng `python3 -I`: sáu script của SK-045 đổi thư mục (`parse.py`, `check_struct.py`, `check_fb.py`, `check_more.py`, `check_hint.py`, `check_misc.py`, `check_tf.py`, `check_reuse2.py`) cộng ba script mới — `t_words.py` (số từ EN **theo câu**, dấu tiếng Việt trong `.en`, chữ số và ký hiệu trong `.vi`), `t_img.py` (thiếu `brief`/`alt`, key "Dùng lại hình" có thật, `alt` và truy vấn đầu chép đúng gốc, `alt` đáp án trùng chữ câu hỏi), `t_meta.py` + `t_table.py` (key misconception, `term_keys`, `recall_from`, `order_sequence`, và đối chiếu từng ô bảng Khung Quiz · Đúng/Sai · Vị trí đáp án của `_topic.md` với bài).

**Tổng kết: chặn 1 · nên sửa 3 · nhỏ 11.**

### Đạt (đã kiểm bằng máy, không có lỗi)

- **Danh mục:** `topic_id` và tám `lesson_id` trong `content/syllabus.json` khớp đúng `id:` của chín file; tên bài EN/VI khớp từng chữ; `oak_lessons: []`, `statutory: false` cả tám; `number: 4`, `strand: living_environment`, `level: 3`, `source.kind: new`. Không `id` nào trùng trong cả `content/`; không khối nào trong tám bài thiếu `id`.
- **Cấu trúc:** tám bài, mỗi bài sáu câu Quiz, DOK 1·1·1·2·2·2, câu một DOK 1, đúng một câu misconception ở q6. Khởi động hai câu (bài 1–6) và ba câu (bài 7, 8), DOK 1, câu nào cũng có `recall_from.kind: lesson`; `single_choice` ở Khởi động luôn hai lựa chọn. Bài 1–4 hai format, bài 5–8 ba format (`order_sequence` ở q4, đúng ba thẻ). `build_tray` cả tám bài: `capacity: 3`, ba nhóm `required`, một nhóm `limit` màu `do_son`, kệ bảy hoặc tám món, `do_son` không dùng cho nhóm `required` nào, bốn màu khác nhau ở cả Học lẫn Chơi.
- **Đối chiếu `_topic.md` với bài:** 64 `prompt.en` và 64 `prompt.vi` của Khởi động và Quiz **khớp từng chữ** bảng Khung Quiz (`_topic.md:450-562`) — 0 lệch. 32 câu `true_false` khớp từng dòng bảng Đáp án Đúng/Sai (`_topic.md:564-602`), 19 Đúng · 13 Sai, bài nào cũng có cả hai. Vị trí `#### option` khớp từng ô bảng `_topic.md:604-630`; đếm máy 22 câu ba lựa chọn: chỗ một 7, chỗ hai 7, chỗ ba 8 — đúng con số ở `_topic.md:619`. `recall_from` của 18 câu Khởi động trỏ đúng bài ở bảng `_topic.md:632-647`, bài nào cũng có thật và đã có `id`.
- **SK-044:** không lựa chọn sai nào thiếu `feedback`, không lựa chọn đúng nào có `feedback`, không cặp `.en/.vi` nào thiếu một nửa. 32 câu `true_false` viết đúng phía bé chọn nhầm (`answer: false` → `feedback_true`; `answer: true` → `feedback_false`), **0 câu sai phía**. Mọi `feedback` một câu, không câu nào quá tám từ EN; **mọi `feedback` đều gọi tên chính vật bé vừa chạm** (đếm máy, 0 trường hợp nói về vật khác). Không câu nào chê bai ("Oops", "sai rồi", "chưa đúng"). `explanation_correct` của mọi câu không phải `true_false`-Sai đều mở đầu "Yes!" · "Đúng rồi!".
- **SK-047:** không `hint`, `feedback`, `explanation` nào nhắc vị trí thẻ (quét "first/second/left/right/top/last", "thẻ đầu", "bên trái", "đầu tiên", "cuối cùng"; năm chỗ máy bắt đều là vị trí **trong một hình**: giữa đàn chim cánh cụt, đáy cát, đỉnh đầu con cáo). Tám `explanation_correct` của câu q6 (đáp án Sai) cùng bốn câu Khởi động đáp án Sai đều đứng một mình được: không "Yes!", không "Đúng rồi!", không "This is false." · "Câu này sai.". Không `hint` nào trùng từ 3 chữ trở lên với `prompt` của chính câu đó.
- **Số từ và chữ:** đếm **theo từng câu** (như `age_words_en`), mọi chuỗi trẻ nghe (`prompt`, `hint`, `explanation_*`, `feedback*`, `sentence`, `examples`, `example`, `messages`, `label`, `tag`, `fact`, `title`) **không câu EN nào quá tám từ** ở cả chín file. Chuỗi `.en` không có dấu tiếng Việt; chuỗi `.vi` không có chữ số, ký hiệu, dấu "—"; không câu VI nào quá hai mươi từ.
- **Hình:** 0 chỗ có hình mà thiếu `image.brief`, `image.alt.en` hay `image.alt.vi` (mọi lựa chọn, thẻ `order_sequence`, món kệ, ô Học, câu `true_false`, từ vựng, thẻ thưởng). **265 chỗ "Dùng lại hình": mọi key có thật** (kể cả 26 key của năm chủ đề khác, mười một bài), không chỗ nào trỏ qua một hình đã là hình dùng lại, truy vấn đầu của dòng `Từ khoá tìm ảnh (EN)` chép đúng gốc ở cả 265 chỗ. Sáu chỗ `alt` khác gốc đều là chỗ cố ý và đã ghi lý do: `01:484`, `02:370`, `06:280`, `08:303` (`w1_buffalo`, theo `_topic.md:440`), `04:438`, `05:353`, `08:67` (bảng "alt riêng" `_topic.md:404-410`).
- **Bảng "Hình dùng chung" đúng hai chiều.** Đếm máy 33 hình gốc trong chủ đề và 26 hình của chủ đề khác; từng dòng "Dùng ở" của `_topic.md:331-365` và `_topic.md:419-445` khớp đúng chỗ dùng thật trong tám bài, và mọi brief "Dùng lại hình … ở bài …" đều có dòng trong bảng — **0 lệch**. Ảnh mới đếm máy 5 · 4 · 7 · 3 · 3 · 6 · 5 · 0, cộng một `[sơ đồ ghép ảnh]` — đúng từng con số ở `_topic.md:447`.
- **Misconception:** tám key đều có thật trong `_topic.md`, mỗi key dùng **đúng một lần**, không key nào gắn ở Khởi động, không key nào khai báo mà bỏ không. **Không key nào trùng ba chủ đề Explorer trước** (đối chiếu máy với `goi-ten-va-nhom-dong-vat`, `sinh-vat-song-o-dau`, `chuoi-thuc-an`). Bài 1, 2 dùng đúng key Oak `polar_bears_eat_penguins`, `polar_bears_in_antarctic`; `polar_bears_meet_penguins` không xuất hiện ở đâu.
- **`true_false`:** 32 câu đều là câu khẳng định, không câu nào có "not", "no", "never", "không", "chưa"; không câu nào có `labels`; câu nào cũng có `image` cấp câu. `explanation_wrong` đúng khuôn "This is false." · "Câu này sai." và "This is true." · "Câu này đúng.".
- **`order_sequence` (bốn câu):** `05:425` biển nông → rạn san hô → biển sâu; `06:432` ngựa vằn → voi → hươu cao cổ; `07:450` sa mạc → đồng cỏ xavan → rừng mưa; `08:472` sa mạc → đầm lầy → đại dương. **Mỗi câu chỉ một thứ tự đúng** (độ sâu, chiều cao thật, lượng mưa, lượng nước — không có cách xếp thứ hai hợp lý); không câu nào thẻ trong file nằm sẵn đúng thứ tự; cả bốn khớp bảng `_topic.md:621-628`.
- **Từ vựng:** bốn hoặc năm từ mỗi bài, hai từ `core` (bài 8 ba từ), `word_list.term_keys` khớp **đúng** danh sách `core` ở cả tám bài và khớp bảng `_topic.md:291-301`. Không từ nào trùng giữa tám bài; chỉ `habitat` (bài 8, `extra`) trùng chủ đề #2, cố ý và đã ghi.
- **Chữ cấm:** grep trong mọi giá trị trẻ nghe (bỏ `brief`) ra **0 kết quả** cho "adapt/adaptation/thích nghi", "climate/khí hậu", "bản đồ/quả địa cầu", "Antarctica/châu Nam Cực", "gấu Bắc Cực", "môi trường sống", "wetland", "jungle", "ngủ đông/hibernate", "băng tan/biến đổi khí hậu", "tuyệt chủng/quý hiếm/săn bắt", "giết/kill". Tên riêng VI viết nhất quán: "A-ma-dôn" 3, "Xa-ha-ra" 12, "còng" 15 (0 "cáy"), "fennec" 16, "ếch phi tiêu độc" 3; "xavan" **luôn** đi với "đồng cỏ" (6 chỗ, 0 chỗ đứng trơ).
- **Kệ Chơi:** khớp bảng `_topic.md:649-668` từng nhóm, từng món, từng nhãn. Ba ví dụ `Màn Chơi, ví dụ để kiểm` ở Ghi chú cho dev của cả tám bài tính tay theo `success_when: all_required_and_no_limit` ra đúng `balanced` · `has_limited` · `missing.*`. `messages.full` đúng chữ chung ở cả tám bài; `messages.has_limited` đúng với **mọi** món bẫy của bài đó; nhãn nhóm không có dấu phẩy.
- **Ranh giới Oak và chủ đề khác:** không câu nào hỏi "gấu trắng / lạc đà / cá hề / voi sống ở đâu"; không có đười ươi, kỳ nhông, hà mã, khỉ rú, báo đốm; không bộ ba ếch phi tiêu độc – khỉ rú – con lười của quiz Oak Địa lý; không câu xương rồng, không người Tuareg, không con người ở vùng cực hay sa mạc; không chuỗi thức ăn, không mũi tên, không cảnh săn mồi trong brief; lạc đà không chỗ nào bị gọi là động vật hoang dã (bài 7 ví dụ ba nói "most camels live with people"); không chỗ nào đặt xương rồng ở Xa-ha-ra (0 lần "xương rồng" trong cả chủ đề); `noi-song-cua-con-vat` `q4_dunes` (đồi cát Việt Nam) không được dùng ở đâu.
- **Khởi động theo giãn cách:** bài 1 có đúng một câu ôn ý chung "nơi sống" của `sinh-vat-song-o-dau/noi-song-cua-con-vat` (`01:46` "A habitat gives food, water and hiding places.", không hỏi một nơi cụ thể) và một câu ôn `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Bài 2–8 mỗi bài một câu ôn bài ngay trước; bài 7 w3 và bài 8 w2 ôn bài cách sáu bài; bài 8 w3 ôn `sinh-vat-song-o-dau/noi-song-cua-cay` đúng ý đúng của `plants_grow_anywhere` (`08:113` "A lotus needs water to grow.", không chép câu q6 cũ "A lotus can grow in dry sand.").
- **Chữ cần dạy trước khi hỏi:** đọc hết bảy dòng ở `_topic.md:562` và tìm thấy đủ trong bài — `02:169` "seals swim under the ice" (cho q4), `03:161` "high in the trees" (q4, q6), `05:124` "warm and full of fish" (q3), `06:144` "walk far" (q3), `07:162` "water" ở ô Oasis (q3), `07:186` "its hump stores fat" (q6), `08:173` "big ears keep a fennec fox cool" (q5). Không câu Quiz nào dùng chữ chưa dạy trong bài hay ở bài được `recall_from` trỏ tới.
- **Các `[CẦN KIỂM]` tester đọc được ở mức 5–7 tuổi không thấy chỗ nào sai rõ:** gấu trắng bắt hải cẩu trên băng biển và da màu đen; hải mã chỉ ở vùng Bắc Cực; Nam Cực lạnh hơn Bắc Cực; chim cánh cụt hoàng đế to nhất và đứng sát nhau cho ấm; hải cẩu Weddell lặn rất lâu; A-ma-dôn là rừng mưa lớn nhất; con lười ở A-ma-dôn và Trung Mỹ; vượn đen má vàng ở Cát Tiên; sếu đầu đỏ cao gần bằng người lớn; biển sâu tối và lạnh; hươu cao cổ cao hơn voi và cao nhất trên cạn; sư tử không ở rừng mưa rậm; bướu lạc đà chứa mỡ; cáo fennec tai to nhất họ cáo; gấu trắng không sống được ở sa mạc nóng. Hai chỗ nói hơi chắc tay, xem n9, n10.

### Lỗi chặn (1)

**C1. Bài 3 (và một chỗ ở bài 4) dịch "on the ground" thành "dưới mặt đất", trong tiếng Việt nghĩa là *dưới lòng đất*. Câu bé nghe thành sai, và câu misconception của bài 3 nói một ý khác hẳn bản EN.**

| Chỗ | Chữ hiện tại |
| --- | --- |
| `03-rung-mua-nhiet-doi.md:177` | `label.vi: Dưới mặt đất` (ô Học, `label.en: On the ground`) |
| `03-rung-mua-nhiet-doi.md:180` | `sentence.vi: Ếch phi tiêu độc nhảy dưới mặt đất.` (EN: `Poison dart frogs hop on the ground.`) |
| `03-rung-mua-nhiet-doi.md:217` | `messages.start.vi: Em tìm cả trên cây cao lẫn dưới mặt đất nhé.` |
| `03-rung-mua-nhiet-doi.md:229` | `messages.missing.tray_ground.vi: Em còn thiếu một con sống dưới mặt đất.` |
| `03-rung-mua-nhiet-doi.md:247` | `label.vi: Dưới mặt đất` (nhóm kệ Chơi) |
| `03-rung-mua-nhiet-doi.md:529` | `prompt.vi: Con vật nào ở rừng mưa cũng sống dưới mặt đất.` (q6, EN: `Every rainforest animal lives on the ground.`) |
| `04-rung-ngap-man-va-dam-lay.md:73` | `feedback.vi: Chú ếch nhỏ này sống dưới mặt đất.` |
| `_topic.md:232`, `_topic.md:491`, `_topic.md:655` | bảng Tên gọi, bảng Khung Quiz, bảng Phần Chơi |

- **Lý do:** trong tiếng Việt "dưới mặt đất" là *bên dưới bề mặt đất* ("tàu điện ngầm chạy dưới mặt đất", "rễ cây ở dưới mặt đất"). Nghĩa "ở dưới, trên nền đất" là **"dưới đất"** hoặc **"trên mặt đất"**. Vì vậy `03:180` dạy bé rằng ếch phi tiêu độc nhảy *trong lòng đất* — sai với chính `image.brief` của ô (`03:181`: "ngồi trên lớp lá rụng nâu ở mặt đất rừng").
- Chỗ này còn làm chủ đề tự mâu thuẫn: `_topic.md:54` `statement.vi` của chính key đã viết "Con vật trong rừng đều sống **dưới đất**", và dòng `>` của người viết ở `03:542` cũng viết "con vật trong rừng đều đi **dưới đất**". Chỉ chữ bé nghe là "dưới mặt đất".
- Câu q6 là câu misconception của bài và là chữ hiện lại ở thẻ "Ý sai → Ý đúng" (SK-047), nên phải sửa trước `tts`.
- **Sửa:** dùng "dưới đất" cho nhãn và "trên mặt đất" cho câu kể — `03:177` và `03:247` → `label.vi: Dưới đất`; `03:180` → `sentence.vi: Ếch phi tiêu độc nhảy trên mặt đất.`; `03:217` → `Em tìm cả trên cây cao lẫn dưới đất nhé.`; `03:229` → `Em còn thiếu một con sống dưới đất.`; `03:529` → `prompt.vi: Con vật nào ở rừng mưa cũng sống dưới đất.` (khớp đúng `_topic.md:54`); `04:73` → `feedback.vi: Chú ếch nhỏ này sống dưới đất.` Bản EN không đổi. Sửa kèm ba bảng ở `_topic.md` (`:232`, `:491`, `:655`) và dòng màu `03:644`. Đây là nhận định về tiếng Việt, content-editor hoặc người duyệt chốt lại nếu thấy khác.

### Nên sửa (3)

**N1. Bài 1 q4: ảnh đáp án đúng là ảnh duy nhất có tuyết, mà câu hỏi hỏi đúng chữ "tuyết"; bé chọn đúng bằng nền ảnh, không cần ý của bài.**
- `01-bac-cuc.md:445-446` `prompt.en: Which animal stays warm in the snow?` · `prompt.vi: Con nào giữ được ấm giữa trời tuyết?` (DOK 2).
- Ba lựa chọn: `q4_croc` (`01:466-467` "A crocodile on a riverbank" · "Con cá sấu trên bờ sông"), `q4_reindeer` (`01:474-475` **"A reindeer in the snow" · "Tuần lộc trên tuyết"**, đáp án), `q4_buffalo` (`01:484-485` "A water buffalo" · "Con trâu").
- Đây đúng là luật chủ đề tự đặt: `_topic.md:319` Quy ước hình số tám ý bốn ("`alt` của lựa chọn đúng không nói đúng chữ của câu hỏi") và `_topic.md:797` Lỗi hay gặp số mười hai ("ảnh lựa chọn đúng không chứa đúng chữ của câu hỏi"). Chủ đề đã áp luật này ở `01:409` (q3 bỏ chữ "Arctic"), `04:440` (q3_crab bỏ "mud"), `05:355` (q1_whale bỏ "wide"), `08:69` (w1_camel bỏ "sand") — bài 1 q4 là chỗ duy nhất còn sót. Dòng `>` ở `01:456-457` nói bé "phải so lông", nhưng bé chỉ cần tìm ảnh có tuyết.
- Khác trường hợp bài 2 q4 (đã được phiên chính duyệt giữ ở `02:463`, vì **cả ba** lựa chọn đều đứng trên băng tuyết nên chữ "ice" không chỉ về ai).
- **Sửa (ưu tiên a):** (a) yêu cầu designer chọn ảnh tuần lộc trên đồng rêu, không có tuyết — chính `01:305` đã cho phương án này — rồi đặt `alt` "A reindeer on cold land" · "Tuần lộc trên vùng đất lạnh" ở `01:474-475`, `02:482-483` và bảng `_topic.md:373`; (b) nếu chỉ có ảnh trên tuyết hợp giấy phép thì ít nhất đổi `alt` **riêng ở chỗ này** thành `A reindeer with thick fur` · `Tuần lộc có bộ lông dày` (TEMPLATE cho phép) và thêm một dòng vào bảng "alt riêng" `_topic.md:404-410`; ảnh vẫn lộ nền tuyết nên (a) tốt hơn.

**N2. Bài 8 q4: `hint` gọi tên con vật của cả hai đầu dãy, nên nói luôn cả ba vị trí.**
- `08-moi-con-vat-mot-noi-song.md:483-484` `hint.en: Think where a camel and a whale live.` · `hint.vi: Em nghĩ xem lạc đà và cá voi sống ở đâu nhé.` Câu có ba thẻ (sa mạc, đầm lầy, đại dương): biết lạc đà ở sa mạc và cá voi ở đại dương là biết luôn đầm lầy đứng giữa.
- Trái SK-047 (`content/TEMPLATE.md:145-148`): "`hint` hiện **trước** khi bé trả lời … không được gần như nói đáp án". `order_sequence` không có `feedback`, nên `hint` là chỗ duy nhất, càng phải giữ. Dòng `>` ở `08:490` tự nhận "gợi ý cho bé hai đầu dải".
- Ba câu `order_sequence` kia làm đúng: `05:436` chỉ một đầu ("a boat leaving the beach"), `06:443` một cách nghĩ ("side by side in real life"), `07:461` một cách nghĩ ("how much rain each place gets").
- **Sửa:** `08:483-484` → `hint.en: Remember how dry the Sahara is.` (sáu từ) · `hint.vi: Em nhớ sa mạc Xa-ha-ra khô thế nào nhé.` Chỉ một đầu dãy, giống bài 5. Sửa kèm dòng `>` ở `08:490`.

**N3. Bài 4 q6: bản VI "đầm lầy lầy lội" lặp chữ "lầy", nghe vấp; đây lại là câu hiện lại ở thẻ Tổng kết.**
- `04-rung-ngap-man-va-dam-lay.md:518-519` `prompt.en: Animals stay away from muddy swamps.` · `prompt.vi: Con vật tránh xa những đầm lầy lầy lội.`
- App đọc bản VI; "đầm lầy lầy lội" là ba âm "lầy/lội" liền nhau. Cùng lỗi ở `_topic.md:62` `statement.vi` ("Đầm lầy lầy lội, chẳng có gì sống.", trường nội bộ) và `_topic.md:504` (bảng Khung Quiz). Các chỗ khác của chủ đề đã dùng "nơi lầy lội" hoặc "đầy bùn" (`04:28`, `04:209`, `04:219`), không lặp.
- **Sửa:** `04:519` → `prompt.vi: Con vật tránh xa những đầm lầy đầy bùn.` Bản EN giữ nguyên (đã là tám từ, đúng khuôn khẳng định đáp án Sai). Sửa kèm `_topic.md:504`; `_topic.md:62` nên đổi thành "Đầm lầy đầy bùn, chẳng có gì sống." cho khớp.

### Nhỏ (11)

- **n1. `explanation_correct.en` mở đầu bằng "It" không có chủ ngữ, trong khi bản VI gọi tên con vật** (`07-sa-mac.md:504` "Yes! It sleeps in a cool hole all day." · "Đúng rồi! Cáo fennec ngủ trong hang mát suốt ban ngày."; `08:527` "Yes! It also sleeps in a hole all day." · "Đúng rồi! Cáo fennec còn ngủ trong hang suốt ban ngày."). Lỗi hay gặp số bảy ở `_topic.md:792` (EN và VI cùng nội dung). Đề xuất `07:504` → "Yes! A fennec fox sleeps in a cool hole." (tám từ) và `08:527` → "Yes! A fennec fox hides there all day." (tám từ), để EN cũng gọi tên con vật như VI.
- **n2. Bài 6 q5 `hint` gần như nối thẳng tới đáp án** (`06-dong-co-xavan.md:485-486` "Think about where zebras find their food." · "Em nghĩ xem ngựa vằn tìm thức ăn ở đâu nhé."). Câu q1 ngay trước đó vừa nói "Zebras eat the tall grass there." (`06:329`), nên bé chỉ cần ghép ngựa vằn → đồng cỏ. Không sai luật (ngựa vằn không có trên màn, và bé vẫn phải nhớ nơi sống của ngựa vằn), chỉ ghi lại. Nếu muốn chặt hơn: "Think about where tall grass grows best." — nhưng câu đó lại nhắc "grass" của câu hỏi, nên tester nghiêng về **giữ nguyên**.
- **n3. Bài 4 q6 dùng ảnh đầm lầy không có con vật** (`04:520` dùng `explore_swamp`; brief `04:142` yêu cầu "không thấy con vật nào"). Câu là "Animals stay away from muddy swamps." (Sai), nên một đầm lầy vắng là bằng chứng nhẹ cho **phía sai**. Biên tập đã cân nhắc (ảnh có sen, cỏ năng = "plants" trong câu sửa, và đặt một con vật vào thì lộ đáp án). Tester đồng ý giữ; đề nghị ghi thêm một dòng vào Ghi chú cho hoạ sĩ bài 4: ô đầm lầy phải nhìn ra **xanh tốt, nhiều cây sống**, không phải bãi bùn trơ.
- **n4. "rừng mưa" rút gọn ngay ở lần nhắc đầu của một màn** — `03:213` lệnh kệ Chơi "Chọn ba con vật sống ở rừng mưa"; `03:254` nhãn nhóm `limit` "Không sống ở rừng mưa"; `08:408` q2 "Con lười sống trên cây cao trong rừng mưa.". Bảng Tên gọi `_topic.md:230` ghi "rừng mưa" chỉ dùng **từ lần thứ hai trong cùng một câu hay một ô**. Hai chỗ bài 3 và câu bài 8 đều là chữ đã chốt ở `_topic.md`; tester không bắt sửa, ghi lại để người duyệt nghe thử bản VI.
- **n5. `alt` riêng của `w1_buffalo` không có trong bảng "alt riêng".** Bốn chỗ (`01:484-485`, `02:370-371`, `06:280-281`, `08:303-304`) dùng "A water buffalo" · "Con trâu" thay `alt` gốc "An animal with two curved horns" · "Con vật có hai sừng cong" của `khung-long/trai-dat-rat-lau-ve-truoc`. Việc này **đúng** theo `_topic.md:440`, nhưng bảng "alt riêng" `_topic.md:404-410` chỉ có ba dòng. Đề nghị thêm một dòng để hai bảng khớp nhau, khỏi báo trùng ở lượt rà sau.
- **n6. Chỗ dùng lại chỉ chép truy vấn đầu, không chép cả dòng từ khoá của hình gốc** (ví dụ `01:271` "walrus ice Odobenus" trong khi gốc `01:176` là "walrus ice Odobenus; Odobenus rosmarus"). Đây **đúng** luật của chủ đề này (`_topic.md:366`: bảng chỉ ghi truy vấn đầu, được thêm truy vấn sau dấu `;`), khác nếp SK-046 ("chép đúng từng chữ"). Ghi lại để lượt rà sau khỏi báo là lỗi.
- **n7. Vài món bẫy không giống nhóm bắt buộc nào.** Bài 2 gấu trắng (nhóm: Chim cánh cụt, Hải cẩu, Cá voi), bài 7 gấu trắng, bài 5 con ếch, và bài 4 có hai bẫy cùng giống nhóm "Chim" (chim hồng hoàng, chim cánh cụt hoàng đế) nhưng không bẫy nào giống nhóm "Cua". Luật ở `_topic.md:661` nói mỗi bẫy giống một nhóm. Ba chỗ đầu đã có lý do ghi trong bài (gấu trắng là món bẫy của chính misconception, `07:226` gọi là "bẫy dễ nhất"); chỉ bài 4 là chưa có lý do. Chấp nhận được với bé 5–7; ghi lại.
- **n8. Bài 2 kệ Chơi có hai món chim cánh cụt cùng một nhóm** (`02:312` `tray_adelie` nhãn "Penguin" · "Chim cánh cụt" và `02:260` `tray_emperor` nhãn "Emperor penguin"). Không trái luật Explorer số bảy (luật đó áp cho một **câu**, không áp cho kệ), và cả hai đều đúng. Đề nghị kiểm trên máy thật rằng hai mục cắt vuông nhìn ra khác nhau (chim cánh cụt hoàng đế có mảng vàng cam ở cổ).
- **n9. "Mangrove water is salty, like the sea." nói hơi chắc tay** (`04:122-123`, và ý chính hai `04:29-30`). Nước rừng ngập mặn là **nước lợ**, nhạt hơn nước biển. Dòng `[CẦN KIỂM]` đã có ở `04:35`. Với bé 5–7 và với mục đích đối chiếu mặn/ngọt thì cách nói này chấp nhận được; để người chuyên môn chốt, tester không đề xuất đổi.
- **n10. "hot all year long" · "trời nóng quanh năm" cho xavan** (`06:113-114`) hơi mạnh: xavan Đông Phi ở độ cao lớn, ban đêm mát; cái không đổi giữa hai mùa là **nhiệt độ ít chênh**, không phải lúc nào cũng nóng. Dòng `[CẦN KIỂM]` đã có ở `06:119`. Nếu người chuyên môn thấy cần: "warm all year long" · "trời ấm quanh năm".
- **n11. Bảng "Vị trí đáp án đúng" (`_topic.md:604-630`) tester đã kiểm đúng từng ô**, nhưng SK-047 đã cho bảng này hết hiệu lực; `_topic.md:808` Còn mở số một đang chờ PM quyết giữ hay bỏ. Giữ thì nên ghi thêm "chỉ là thứ tự trong file" ngay trên bảng (hiện đã có ở `_topic.md:606`), bỏ thì xoá cả bốn dòng Ghi chú cho dev tương ứng ở các bài.

### Chưa kiểm

- **Ảnh:** chủ đề chưa có file chọn ảnh cho bài 2–8 (`content/images/explorer/noi-song-tren-trai-dat/` mới có bài 1), nên chưa kiểm được giấy phép, khung 5:2 và 17:10, mục `crop` riêng, và các điều kiện địa điểm: ảnh có đúng là Xa-ha-ra, Cúc Phương hay Cát Tiên, Tràm Chim không; ảnh cáo fennec, cú tuyết, chim hồng hoàng, vượn có phải ảnh sở thú không; ảnh lạc đà, tuần lộc có yên cương không; ảnh cá sấu `khung-long/khung-long-la-gi` `q1_reptiles` (dùng ở năm bài) có há miệng nhe răng không (`_topic.md:803` Đề xuất cho designer ý năm); loài trong `goi-ten-va-nhom-dong-vat/chim-va-bo-sat` `tray_penguin` (bài 2 w2).
- Không chạy `ids`, `images fetch`, `tts`, `build`, `check-pack`. Chỉ chạy `validate` (lệnh chỉ đọc), kết quả dán ở đầu mục.
- **Không dùng simulator** (luật một máy, một lần): chưa chơi thử bài nào, nên chưa kiểm renderer `order_sequence`, thứ tự app đọc `feedback` rồi `hint`, số chữ thật trên một màn Chơi, thẻ "Ý sai → Ý đúng" ở Tổng kết.
- Chưa nghe thử giọng đọc: EN "walrus", "Antarctic", "huddle", "hornbill", "gibbon", "macaw", "wildebeest", "savanna", "Sahara", "oasis", "fennec"; VI "A-ma-dôn", "Xa-ha-ra", "xavan", "cáo fennec", "ếch phi tiêu độc".
- **141 dòng `[CẦN KIỂM]`** (36 ở `_topic.md`, 105 ở tám bài) tester chỉ đọc ở mức hợp lý với trẻ 5–7, **không thay người chuyên môn**. Những điều tester không kiểm được: tuần lộc ở Bắc Cực là hoang dã hay do người chăn; chiều cao thật của sếu đầu đỏ và chuyện "chim bay cao nhất"; cá sấu Xiêm ở Bàu Sấu; độ sâu của con sứa trong ảnh NOAA; hươu cao cổ và cá sấu có nhóm nhỏ ở rìa Xa-ha-ra (Namibia, Mauritania, Chad) — `_topic.md:815` Còn mở số tám; cách viết tên tiếng Việt theo sách giáo khoa (`_topic.md:812` Còn mở số năm).
- Chưa đối chiếu Oak Year 3 *Climate zones* (chưa ai đọc, `_topic.md:782`) và sách Tự nhiên và Xã hội lớp hai (CT GDPT 2018).
- Màn Học vượt mười lăm từ EN nếu đếm cả `examples` (giống SK-046 n14): tester không đếm lại, vì PM chưa chốt cách đếm cho `explore_groups`.

## content-editor 16/11 · sửa theo tester và designer

Không chạy lệnh (chưa chạy `validate` lại; phiên chính chạy). Chỉ sửa trong `content/explorer/noi-song-tren-trai-dat/`. Không đổi dòng `id:` nào; không thêm, không xoá khối có id; không đổi khoá câu, khoá lựa chọn, khoá hình. Chỗ nào sửa đều có dòng `>` ghi lý do ngay trong bài.

**Chọn một cách nói cho "on the ground": "trên mặt đất"** (cả nhãn, câu kể, lời nhắn, câu hỏi). Không dùng "dưới mặt đất" (dưới lòng đất), cũng không dùng "sống dưới đất" như tester gợi ý cho nhãn: "con vật sống dưới đất" trong tiếng Việt hay hiểu là sống trong đất (giun, chuột chũi), cùng kiểu lỗi C1. "Trên mặt đất" không nước đôi và đối được với "trên cây cao". Riêng lời nhắn mở đầu kệ Chơi bài 3 theo sát EN "Look up high and down on the ground": "Em nhìn cả lên cây cao lẫn xuống mặt đất nhé." Người duyệt nghe thử nếu thấy khác.

**Bài 2, 3 có dựa vào chữ "trên băng" của `tray_antarctica` không:** có hai chỗ. Bài 2 ô "Icy land" (câu chính "The Antarctic is icy land", ví dụ một "ice and snow cover the land"): giữ chữ, đòi mục `crop` riêng giữ rõ núi phủ tuyết và băng phía sau. Bài 3 `q5_icy_land` có `feedback` "Penguins stand on this cold, icy land." (chim đứng trên băng): đã sửa. Nhãn "icy land" · "đất phủ băng" giữ (tên ô Học bài 2 dùng cùng ảnh).

### Các chỗ đã sửa

| Mục | Bài · chỗ | Trước | Sau |
| --- | --- | --- | --- |
| C1 | 3 ô `explore_ground` `label.vi` | Dưới mặt đất | Trên mặt đất |
| C1 | 3 ô `explore_ground` `sentence.vi` | Ếch phi tiêu độc nhảy dưới mặt đất. | Ếch phi tiêu độc nhảy trên mặt đất. |
| C1 | 3 kệ Chơi `messages.start.vi` | Em tìm cả trên cây cao lẫn dưới mặt đất nhé. | Em nhìn cả lên cây cao lẫn xuống mặt đất nhé. |
| C1 | 3 kệ Chơi `messages.missing.tray_ground.vi` | Em còn thiếu một con sống dưới mặt đất. | Em còn thiếu một con sống trên mặt đất. |
| C1 | 3 nhóm `tray_ground` `label.vi` | Dưới mặt đất | Trên mặt đất |
| C1, n4 | 3 q6 `prompt.vi` (câu misconception, thẻ "Ý sai → Ý đúng") | Con vật nào ở rừng mưa cũng sống dưới mặt đất. | Mọi con vật ở rừng mưa nhiệt đới đều sống trên mặt đất. ("every" là "mọi … đều": cùng nghĩa EN, không nghe thành câu hỏi "con vật nào") |
| C1 | 4 w1 `w1_dart_frog` `feedback.vi` | Chú ếch nhỏ này sống dưới mặt đất. | Chú ếch nhỏ này sống trên mặt đất. |
| C1 | `_topic.md` `forest_animals_on_ground` `statement.vi` | Con vật trong rừng đều sống dưới đất. | Con vật trong rừng đều sống trên mặt đất. |
| C1 | `_topic.md` bảng Tên gọi, Tổng quan bài 3, Khung Quiz bài 3 q6, Phần Chơi bài 3, Lỗi hay gặp (thêm số mười ba); dòng `>` và Ghi chú cho hoạ sĩ bài 3 | "dưới mặt đất", "dưới đất" | "trên mặt đất" (grep cả thư mục: chữ cũ chỉ còn trong dòng `>` ghi lý do sửa) |
| N1 | 1 q4 `q4_reindeer` `image.brief` | Dùng lại hình `tray_reindeer` (đàn tuần lộc trên tuyết, ảnh duy nhất có tuyết) | `[ảnh]` riêng: một con tuần lộc trên đồng rêu, bãi cỏ thấp, không có tuyết hay băng; thẻ 5:2. Dòng `>` ghi "Designer phải đổi ảnh `q4_reindeer`" và phương án dự phòng |
| N1 | 1 q4 `q4_reindeer` `alt` | A reindeer in the snow · Tuần lộc trên tuyết | A reindeer on cold land · Tuần lộc trên vùng đất lạnh |
| N1 | 1 q4 dòng `>`; Ghi chú cho hoạ sĩ (ảnh mới sáu, ảnh khó tuần lộc, một ảnh hai khung) | | theo ảnh riêng không tuyết |
| N1 | `_topic.md` bảng Hình dùng chung (`tray_reindeer`), ghi chú dưới bảng `alt`, đếm ảnh mới, Khung Quiz bài 1 q4, Đề xuất cho designer | `tray_reindeer` dùng ở 1 q4; ba mươi ba ảnh mới | `tray_reindeer` chỉ còn 1 kệ Chơi, 2 q4; `q4_reindeer` ảnh riêng; ba mươi bốn ảnh mới |
| N2 | 8 q4 `hint` | Think where a camel and a whale live. · Em nghĩ xem lạc đà và cá voi sống ở đâu nhé. | Remember how dry the Sahara is. · Em nhớ sa mạc Xa-ha-ra khô thế nào nhé. (một đầu dải, như bài 5; nếu ảnh không phải Xa-ha-ra thì "a desert" · "sa mạc", ghi ở dòng `>`) |
| N3 | 4 q6 `prompt.vi` | Con vật tránh xa những đầm lầy lầy lội. | Con vật tránh xa những đầm lầy đầy bùn. |
| N3 | `_topic.md` `swamps_have_no_life` `statement.vi`, Khung Quiz bài 4 q6 | Đầm lầy lầy lội, … · đầm lầy lầy lội | Đầm lầy đầy bùn, chẳng có gì sống. · đầm lầy đầy bùn |
| designer | 1 `tray_penguin`; 2 ô `explore_land`, từ `antarctic`; 3 `q5_icy_land` `alt` | Penguins on icy land · Chim cánh cụt trên vùng đất phủ băng | Penguins on a cold, stony beach · Chim cánh cụt trên bãi đá lạnh |
| designer | 1 `tray_penguin` dòng `>` | "giữ nền băng tuyết" | bỏ; ghi ảnh thật (bãi sỏi, sau lưng băng vụn và núi tuyết), crop đã cắt du khách |
| designer | 2 ô `explore_land` dòng `>` | "thấy rõ đất có băng phủ" | ảnh thật; crop riêng phải giữ núi tuyết, băng và tránh du khách, không giữ được thì báo |
| designer | 3 `q5_icy_land` `feedback` | Penguins stand on this cold, icy land. · Chim cánh cụt đứng trên vùng đất băng giá này. | Penguins live in this cold, icy place. · Chim cánh cụt sống ở nơi băng giá này. |
| designer | 1 `tray_reindeer`; 2 `q4_reindeer` `alt.en` | A reindeer in the snow | Reindeer in the snow (`alt.vi` giữ) |
| designer | 1 `tray_reindeer` `image.brief` và dòng `>` | một con tuần lộc, "trên nền tuyết hoặc đồng rêu", dùng cho q4 bài 1 | một hoặc vài con trên nền tuyết, dùng cho kệ Chơi và q4 bài 2 (khớp ảnh đã chọn); truy vấn đầu giữ |
| designer | 1 `explore_walrus` `image.brief` | nằm nghỉ trên tảng băng nổi giữa biển | nằm nghỉ trên tảng băng nổi (`alt` giữ) |
| designer | 1 `q1_mudskipper`; 4 `tray_mudskipper`; 5 `q1_mudskipper` `alt` | A mudskipper on the mud · Con cá thòi lòi trên bùn | A mudskipper by the water · Cá thòi lòi bên mép nước (cả ba chỗ dùng ảnh này trong chủ đề, để một ảnh một `alt`; không sửa chủ đề #2) |
| designer | `_topic.md` bảng hình chủ đề khác (`tray_antarctica`, `mudskipper`), bảng "alt riêng", đoạn Lệch bài 1, bảng Phần Chơi bài 1 | | theo ảnh thật |
| n1 | 7 q5 `explanation_correct.en` | Yes! It sleeps in a cool hole all day. | Yes! Fennec foxes sleep in cool holes all day. (VI giữ, đã gọi tên) |
| n1 | 8 q5 `explanation_correct.en` | Yes! It also sleeps in a hole all day. | Yes! Fennec foxes also sleep in holes all day. (VI giữ) |
| n3 | 4 Ghi chú cho hoạ sĩ, ảnh khó đầm lầy | | thêm: ảnh phải xanh tốt, nhiều cây sống, không bãi bùn trơ (hình câu q6 đáp án Sai) |
| n4 | 3 kệ Chơi `prompt.vi`; nhóm `tray_not` `label.vi` | … sống ở rừng mưa · Không sống ở rừng mưa | … sống ở rừng mưa nhiệt đới · Không sống ở rừng mưa nhiệt đới |
| n4 | 8 q2 `prompt.vi` | Con lười sống trên cây cao trong rừng mưa. | … trong rừng mưa nhiệt đới. |
| n4 | `_topic.md` Khung Quiz bài 8 q2, Phần Chơi bài 3 | | theo bài |
| n5 | `_topic.md` bảng "alt riêng" | ba dòng | thêm `w1_buffalo` (bốn chỗ), `tray_antarctica` (bốn chỗ), `mudskipper` (ba chỗ); đầu bảng thêm lý do "khớp ảnh thật" |
| n9 | 4 ô `explore_mangrove` `sentence` | Mangrove water is salty, like the sea. · Nước ở rừng ngập mặn thì mặn, giống nước biển. | Sea water makes mangrove water salty. · Nước biển làm cho nước ở rừng ngập mặn có vị mặn. (vẫn có "salty" cho q4, không nói mặn bằng biển) |
| n9 | 4 dòng `[CẦN KIỂM]` ý chính; `_topic.md` Tổng quan bài 4, Đúng khoa học bài 4 | "bài nói mặn, như nước biển" | theo câu mới |
| n10 | 6 ô `explore_savanna` ví dụ hai | hot all year long · trời nóng quanh năm | warm all year long · trời ấm quanh năm |
| n10 | 6 dòng `[CẦN KIỂM]`; `_topic.md` Đúng khoa học bài 6 | xavan nóng quanh năm | ấm quanh năm, nhiệt độ ít đổi, ban ngày nóng |

`_topic.md` mục Ghi chú thêm một dòng `>` tóm lượt sửa này.

### Mục nhỏ giữ nguyên

- **n2** bài 6 q5 `hint` "Think about where zebras find their food.": giữ như tester nghiêng. Ngựa vằn không có trên màn, bé vẫn phải nhớ nơi sống của ngựa vằn; câu thay lại nhắc chữ "grass" của câu hỏi. Đã ghi dòng `>` dưới câu.
- **n3** bài 4 q6 dùng ảnh đầm lầy vắng con vật: giữ ảnh và câu (đặt con vật vào thì lộ đáp án; sen, cỏ năng là "plants" của câu sửa). Chỉ thêm yêu cầu ảnh xanh tốt ở Ghi chú cho hoạ sĩ.
- **n6** chỗ dùng lại chỉ chép truy vấn đầu: đúng luật của chủ đề (`_topic.md` dòng dưới bảng `alt`), không sửa.
- **n7** món bẫy không giống nhóm nào: giữ. Bài 2, 5, 7 đã có lý do trong bài. Bài 4 thêm dòng `>`: cua đồng, cua biển bé quen đều hay sống ở bùn, nên một món bẫy "cua không sống ở nơi lầy lội" sẽ nước đôi.
- **n8** bài 2 kệ có hai món chim cánh cụt cùng một nhóm: giữ. Luật Explorer số bảy áp cho một câu, không cho kệ; hai ảnh khác hẳn nhau (con hoàng đế to, có mảng vàng cam, đứng một mình trên băng; con Adélie nhỏ ở mép băng sát biển), món nào cũng đúng. Việc nhìn hai ô vuông trên máy thật để lượt chạy simulator.
- **n11** bảng "Vị trí đáp án đúng": việc của PM (`_topic.md` Còn mở số một), không sửa.

### Hình đổi sau rà chữ

| Khoá | Bài | Đổi gì | Việc của designer |
| --- | --- | --- | --- |
| `q4_reindeer` | 1 (lựa chọn đúng q4) | Trước: dùng lại `tray_reindeer` (đàn tuần lộc trên tuyết). Sau: ảnh riêng một con tuần lộc trên đồng rêu, bãi cỏ thấp, **không có tuyết, băng**; `alt` "A reindeer on cold land" · "Tuần lộc trên vùng đất lạnh" | **Chọn ảnh mới**, mục riêng (không `same_as` sang `tray_reindeer`), khung 5:2, không dây cương, yên, người. Truy vấn `Rangifer tarandus tundra`, `caribou tundra`. Không có ảnh hợp lệ thì báo phiên chính; dự phòng ghi ở bài 1 dưới lựa chọn |
| `tray_reindeer` | 1 (kệ Chơi); dùng lại ở 2 `q4_reindeer` | `alt.en` "Reindeer in the snow" (bỏ "A"); brief tả một hoặc vài con trên tuyết; không còn dùng ở 1 q4 | Giữ ảnh. Bỏ chỗ dùng 1 q4 khỏi file chọn ảnh bài 1 |
| `tray_antarctica` (`be-mat-trai-dat/cac-chau-luc-va-dai-duong`) | 1 `tray_penguin`; 2 `explore_land`, từ `antarctic`; 3 `q5_icy_land` | `alt` "Penguins on a cold, stony beach" · "Chim cánh cụt trên bãi đá lạnh" | Giữ ảnh. Bài 2, 3 cần mục `crop` riêng tránh nhóm du khách (như designer đã ghi); riêng ô `explore_land` bài 2 giữ rõ núi tuyết và băng, không giữ được thì báo để tìm ảnh đất phủ băng khác |
| `explore_walrus` | 1 (và mọi chỗ dùng lại) | `brief` bỏ "giữa biển"; `alt` giữ | Không đổi |
| `mudskipper` (`sinh-vat-song-o-dau/noi-song-cua-con-vat`) | 1 `q1_mudskipper`, 4 `tray_mudskipper`, 5 `q1_mudskipper` | `alt` "A mudskipper by the water" · "Cá thòi lòi bên mép nước" | Không đổi ảnh |
| `explore_swamp` | 4 (gốc; dùng lại ở 5, 8) | Ghi chú cho hoạ sĩ thêm: ảnh xanh tốt, nhiều cây sống, không bãi bùn trơ | Áp khi chọn ảnh bài 4 |

**Chữ trẻ nghe đổi** (sinh lại giọng nếu đã chạy `tts`): bài 3 ô "On the ground" (`label.vi`, `sentence.vi`), kệ Chơi (`prompt.vi`, `messages.start.vi`, `messages.missing.tray_ground.vi`, nhãn `tray_ground` và `tray_not` VI), `q5_icy_land` `feedback` (EN, VI), q6 `prompt.vi`; bài 4 `w1_dart_frog` `feedback.vi`, ô "Mangrove" `sentence` (EN, VI), q6 `prompt.vi`; bài 6 ô "Savanna" ví dụ hai (EN, VI); bài 7 q5 `explanation_correct.en`; bài 8 q2 `prompt.vi`, q4 `hint` (EN, VI), q5 `explanation_correct.en`. `alt` đổi (nhãn VoiceOver, không qua `tts`): `q4_reindeer`, `tray_reindeer`, bài 2 `q4_reindeer`, bốn chỗ `tray_antarctica`, ba chỗ cá thòi lòi.

**Còn chưa chắc**
- Chưa chạy `validate` sau lượt sửa (luật SK-027: phiên chính chạy). Tự đếm: mọi câu EN mới tối đa tám từ mỗi câu; chuỗi `.vi` mới không chữ số, không ký hiệu.
- Ô "Icy land" bài 2 dùng ảnh chim cánh cụt trên bãi sỏi: chữ của ô dựa vào núi tuyết phía sau. Nếu PM hay Duy muốn ảnh "đất phủ băng" rõ hơn cho ô này thì designer tìm ảnh khác (Còn mở mới, chưa ghi vào `_topic.md`).
- `alt` gốc "Penguins on icy land" ở Discoverer *Bề mặt Trái Đất* bài hai và "A mudskipper on the mud" ở *Sinh vật sống ở đâu?* bài bốn không khớp ảnh thật; chủ đề này chỉ dùng `alt` riêng. PM báo hai chủ đề đó nếu muốn sửa tận gốc.

### Lượt 2 (sau ảnh bài 2–8)

Theo mục "designer 16/11 · ảnh bài 2–8". Chỉ sửa trong `content/explorer/noi-song-tren-trai-dat/`; không đổi `id:`, khoá câu, khoá lựa chọn, khoá hình. Mỗi chỗ sửa có dòng `>` trong bài. Chưa chạy `validate` (phiên chính chạy).

- **Gấu trắng:** bài 1 `explore_bear` thành hình gốc `[ảnh]` (gấu hoang dã đi trên băng biển sát mặt nước; từ khoá `polar bear sea ice; Ursus maritimus`). Bài 1 `tray_bear`, q5, q6, từ `polar_bear`, thẻ: "Dùng lại hình `explore_bear`"; bài 2 (`tray_bear`, q6), bài 6, 7 (`tray_bear`), bài 8 (`tray_bear`, q6): "Dùng lại hình `explore_bear` ở bài `noi-song-tren-trai-dat/bac-cuc`". `alt` giữ.
- **Cá sấu:** bài 1 `tray_croc` thành hình gốc `[ảnh]` (cá sấu Xiêm hoang dã, miệng khép, trên bờ sông bùn; `Crocodylus siamensis; Siamese crocodile riverbank`). Bài 1 `q4_croc`: "Dùng lại hình `tray_croc`"; bài 4 q5, bài 5 `tray_croc`, bài 6 w2, bài 7 `tray_croc`: "Dùng lại hình `tray_croc` ở bài `noi-song-tren-trai-dat/bac-cuc`". `alt` giữ.
- **Brief khác (không `alt` nào đổi):** bài 2 `explore_huddle` bỏ "thành một khối tròn"; bài 3 `explore_vietnam` ghi Cát Tiên (gốc cổ thụ rễ bạnh), truy vấn đầu `Cuc Phuong` → `Cat Tien forest` (chép ở bài 3 q3, q5, q6, từ `rainforest`; bài 6 q5; bài 7 q4; bài 8 ô Hot and wet); bài 3 `explore_amazon` "có sông ở phía xa"; bài 4 `explore_swamp` bỏ "ở châu Á"; bài 5 `explore_deep` bỏ "do tàu lặn không người lái chụp" và tên Okeanos Explorer; bài 6 `explore_savanna` bỏ Serengeti ở lời tả và truy vấn đầu (`savanna acacia tree`, chép ở bài 6 q5, từ `savanna`; bài 7 q4); bài 6 `explore_herd` bỏ "nối nhau thành hàng dài" và "chụp từ xa"; `tray_lion` "nằm nghỉ trên nền đất"; `tray_elephant` "nhìn thẳng".
- **`_topic.md`:** bảng Hình dùng chung thêm `explore_bear`, `tray_croc` (bài 1) vào nhóm hình gốc, cột "Dùng ở" giữ đủ; bỏ hai dòng `tray_arctic`, `q1_reptiles` ở bảng hình chủ đề khác; bảng từ khoá thêm hai dòng đó, sửa truy vấn đầu `explore_vietnam`, `explore_savanna`; Tổng quan bài 1, 3; Khung Quiz bài 1, 2, 4, 6, 8; Thẻ thưởng bài 1; Đề xuất cho designer ý 3, 5 và Còn mở 9 ghi xong; thêm Còn mở 10 (ba điểm ảnh designer chờ PM). Ghi chú cho hoạ sĩ bài 1, 2, 4, 5, 6, 7, 8 sửa theo.
- **Số ảnh mới: 36, không phải 34.** Đếm brief `[ảnh]`: bài 1 tám (năm ảnh lượt đầu, `q4_reindeer`, `explore_bear`, `tray_croc`), bài 2 bốn, bài 3 bảy, bài 4 ba, bài 5 ba, bài 6 sáu, bài 7 năm, bài 8 không (một hình ghép). Đối chiếu file chọn ảnh: 36 ảnh khác nhau không lấy từ chủ đề khác = 5 (designer, ảnh bài 1) + 31 (designer, ảnh bài 2–8).
- **Chữ trẻ nghe đổi (chạy lại `tts`):** bài 6 w2 `hint`: "Look at the crocodile's sharp teeth." · "Em nhìn hàm răng nhọn của cá sấu nhé." → "Look at the crocodile's long, strong jaws." · "Em nhìn cái hàm dài và khoẻ của cá sấu nhé." Lý do: ảnh mới miệng khép, không thấy răng. Không chữ nào khác đổi: không câu nào bé nghe nhắc Serengeti, Cúc Phương hay tên nơi của các ảnh mới.
- **Còn chưa chắc:** bài 4 ô Swamp ví dụ một "lotus and tall grass grow here": ảnh đầm sen thấy sen và hàng cây, cỏ cao không rõ; giữ vì là ý chung về đầm lầy. Bài 3 ảnh nay ở Cát Tiên nên "doucs and gibbons live here" nói về Cát Tiên (voọc ở đó là chà vá chân đen); đã thêm `[CẦN KIỂM]` dưới ô.

## designer 16/11 · ảnh bài 2–8

Đã làm: bảy file chọn ảnh trong `content/images/explorer/noi-song-tren-trai-dat/` (`nam-cuc.json`, `rung-mua-nhiet-doi.json`, `rung-ngap-man-va-dam-lay.json`, `bien-va-dai-duong.json`, `dong-co-xavan.json`, `sa-mac.json`, `moi-con-vat-mot-noi-song.json`), sửa năm mục của `bac-cuc.json`, và hình ghép `content/images/composed/noi-song-tren-trai-dat/moi-con-vat-mot-noi-song.vocab.earth.jpg`. Không sửa `.md`, không sửa file chọn ảnh của chủ đề khác.

- **Số chỗ có ảnh:** bài 2: 35/35 · bài 3: 37/37 · bài 4: 36/36 · bài 5: 38/38 · bài 6: 38/38 · bài 7: 38/38 · bài 8: 40/40 (gồm một hình ghép). Bài 1 vẫn 37/37. Không chỗ nào trống. Khoá lấy từ `images search --cache-only` chạy lại sau lượt sửa chữ của content-editor; khoá không đổi.
- **`images fetch content/images/explorer/noi-song-tren-trai-dat`** (lần cuối): 8 file, 128 ảnh khác nhau, **0 lỗi, 0 cảnh báo tỉ lệ**, không có dòng "Chưa kiểm tỉ lệ". Kiểm thêm với `max_factor` 1,05: không hình nào lệch khung quá 5% (chỉ `q3_forest` dùng lại của *Sinh vật sống ở đâu?* lệch 1%).
- **Nếp như bài 1:** ảnh gốc nằm ở bài phụ trách theo bảng Hình dùng chung. Bài khác trỏ `same_as` + `lesson` khi khung khớp. Khung khác thì mục riêng có `crop` riêng, đặt ở bài đầu tiên dùng khung đó (ví dụ cáo Bắc Cực 5:2 ở bài 3, hải mã 17:10 ở bài 2). Ảnh Explorer chủ đề khác trỏ thẳng tới mục có crop đúng khung. Ảnh Discoverer (sóng Đại Tây Dương, cá voi, hươu cao cổ, rạn san hô, rừng Barro Colorado, thằn lằn bóng) được chép mục gốc, crop riêng.
- **Nhịp gọi:** Commons qua wrapper giữ nhịp, một tiến trình mỗi lúc. Lượt tìm đầu (4,6 s) bị ba lần 429 nên nâng lên 6 s cho mọi lượt sau; sau đó không còn 429. Openverse hôm nay 108/190 (đã cộng vào `openverse-usage.json`).

**Ảnh mới: 31.** CC0 4 (cá sấu, chim cánh cụt hoàng đế, chim hồng hoàng, con còng) · Public domain 7 (gấu trắng, tuần lộc trên đồng rêu, đầm lầy có sen, sứa biển sâu, cá hề, đồi cát Xa-ha-ra, ốc đảo) · CC BY 20 (Adélie, đàn chim cánh cụt hoàng đế, hải cẩu Weddell, rừng Cát Tiên, A-ma-dôn, con lười, ếch phi tiêu độc, vượn đen má vàng, vẹt đuôi dài, sếu đầu đỏ, rùa biển, xavan, xavan mùa khô, linh dương đầu bò, ngựa vằn, sư tử, voi châu Phi, lạc đà, cáo fennec, thằn lằn đuôi gai). Không ảnh BY-SA, NC, ND. Đã đọc trang gốc từng ảnh (Commons qua API; Flickr và iNaturalist mở trang hoặc API).

**Kiểm tay đã làm** (dòng "Kiểm tay" của `fetch` với ảnh Openverse):
- iNaturalist qua API của iNaturalist (`captive` và `license_code`): chim cánh cụt hoàng đế (ảnh 353907170, cc0, hoang dã), con lười (410795063, cc-by, Puerto Jiménez, Costa Rica, hoang dã), ếch phi tiêu độc (12432857, cc-by, Annai, Guyana, hoang dã), cá sấu (254420162, cc0, Nakhon Sawan, Thái Lan, hoang dã).
- Flickr: lạc đà (giấy phép CC BY 2.0 trên trang, tên "Dromedary Desert near Nefta Tunisia"), voi (CC BY 2.0, mô tả "Credit: Danielle Brigida, WWFUS", trùng người đăng).
- **Lưu ý cho dev:** Openverse ghi một ảnh cá sấu iNaturalist là CC BY 4.0, nhưng iNaturalist hiện ghi cc-by-nc (ảnh 87220226). Đã bỏ ảnh đó. `fetch` chỉ kiểm qua Openverse nên không bắt được trường hợp này. Đề xuất: với nguồn `Openverse/iNaturalist`, `fetch` đối chiếu thêm API iNaturalist.

### Ba việc ticket giao

- **Gấu trắng: đã đổi ảnh, kể cả bài 1.** Ảnh mới: "Male Polar Bear on Pack Ice (5165200832)", USFWS Alaska, ảnh Eric Regehr/USFWS, Public domain (PD-USGov-FWS). Gấu đực đi trên băng biển sát mặt nước, không vòng cổ, không người, không con mồi; miệng hơi hé khi thở, không nhe nanh. `title` trung tính "Polar bear walking on sea ice". `bac-cuc.json` sửa `learn.explore.explore_bear` (vuông) và `q5` (4:3); các chỗ khác của bài 1 đã `same_as` hai mục này. Bài 2, 6, 7, 8 trỏ về bài 1. Đã fetch lại. Ảnh NASA cũ không còn dùng trong chủ đề này. **Việc kéo theo:** Discoverer `be-mat-trai-dat/cac-chau-luc-va-dai-duong` `tray_arctic` vẫn dùng ảnh NASA cũ (Commons ghi PD-NASA, Flickr gốc ghi CC BY 2.0, tác giả Mario Hoppmann). Phiên chính báo Duy chọn: đổi sang ảnh USFWS này, hoặc giữ và ghi CC BY 2.0, tác giả Mario Hoppmann, tên gốc.
- **Cá sấu: ảnh `q1_reptiles` há miệng, thấy rõ răng** (đã xem ảnh thật). Đã chọn ảnh khác cho cả chủ đề: cá sấu Xiêm non hoang dã nằm trên bờ sông bùn, miệng khép (iNaturalist 254420162, Светлана Царахова, CC0, Nakhon Sawan, Thái Lan). Mục gốc ở `bac-cuc.json` (`tray.tray_croc` vuông, `q4.q4_croc` 5:2). Mục 4:3 ở bài 4 `q5`, bài 6 `w2` trỏ về đó. Bài 5, 7 `tray_croc` trỏ về bài 1. Con cá sấu nhỏ và mảnh trong khung vuông (thân dài), nhưng nhận ra được. **Content-editor sửa sáu chỗ brief** "Dùng lại hình `q1_reptiles` ở bài `khung-long/khung-long-la-gi`" (bài 1 `tray_croc`, `q4_croc`; bài 4 q5; bài 5 `tray_croc`; bài 6 w2; bài 7 `tray_croc`) theo bảng đề xuất dưới, và sửa bảng Hình dùng chung. **Việc kéo theo:** cùng ảnh há miệng còn dùng ở *Gọi tên và nhóm động vật* (`con-vat-nuoi-trong-nha`, `con-vat-an-gi`, `chim-va-bo-sat`) và *Khủng long*; chủ đề đó không có Quy ước hình số 4 nên chỉ ghi để PM biết.
- **`tray_antarctica`: giữ ảnh, mọi crop dừng ở x 0,54** (du khách từ x 0,56). Bài 2 `explore_land` và từ `antarctic`: crop vuông (x 0,12–0,54, y 0,16–0,91) thấy núi phủ tuyết, biển có băng vụn và hai con chim cánh cụt. **Núi tuyết nhỏ**, chiếm khoảng một phần sáu bề ngang ở phần trên khung; không làm to hơn được vì ảnh gốc rộng mà du khách ở ngay bên phải. Bài 3 `q5_icy_land` (5:2): núi tuyết và biển băng rõ, hai con chim cánh cụt phía trước bị cắt ngang thân. Nếu PM muốn ô "Icy land" thấy đất phủ băng rõ hơn thì cần ảnh khác (báo designer). **Việc kéo theo:** Discoverer `tray_antarctica` crop 4:5 vẫn còn du khách; Discoverer tự sửa crop, không sửa ở đây.

### Theo lượt rà chữ (phiên chính báo 16/11)

1. **Bài 1 `q4_reindeer`: ảnh mới, mục riêng.** Một con tuần lộc (caribou) hoang dã gạc lớn đi trên đồng rêu xanh, không tuyết, không băng (vườn quốc gia Denali, Alaska; NPS Photo/Emily Mesner; Public domain). Crop 5:2 thấy cả con. `bac-cuc.json` `q4.q4_reindeer` không còn trỏ tới `tray_reindeer`. Bài 2 `q4_reindeer` (tuần lộc trên tuyết) có mục 5:2 riêng ở `nam-cuc.json`, cùng ảnh `tray_reindeer`.
2. **`tray_antarctica`:** như trên.
3. **`explore_swamp`:** đầm lầy nước ngọt xanh tốt, phủ đầy lá sen, vài bông sen vàng, hàng cây phía sau (Monopoly Marsh, Mingo National Wildlife Refuge, Missouri, Mỹ; USFWS; Public domain). Ảnh gốc có một con vịt nhỏ giữa ảnh: mọi crop tránh vùng đó, không khung nào thấy con vật. Đã tìm Tràm Chim (Commons chỉ có ảnh đường phố, thị trấn, xuồng chở khách), Láng Sen (không có ảnh), Vân Long (mù sương, có thuyền và người): không dùng được.
4. **Chỉ đổi chữ:** file chọn ảnh không chép `alt`. `title` của `tray_reindeer` ("Caribou in the snow"), hải mã, cá thòi lòi không cần đổi.
5. **`explore_sahara` chụp ở Xa-ha-ra thật:** "Erg chebbi sunrise", trang gốc ghi "Sun rising over Erg Chebbi dunes, Morocco", thể loại Erg Chebbi (đồi cát Erg Chebbi thuộc Xa-ha-ra). `hint` bài 8 q4 nhắc "Xa-ha-ra" giữ được. `alt` "Big sand dunes in the Sahara" giữ.

### Đề xuất sửa `brief`/`alt` (content-editor sửa `.md`)

| Bài · chỗ | Brief / `alt` hiện tại | Ảnh thật | Đề xuất |
| --- | --- | --- | --- |
| 1 `tray_croc`, `q4_croc`; 4 `q5`; 5 `tray_croc`; 6 `w2`; 7 `tray_croc` | "Dùng lại hình `q1_reptiles` ở bài `khung-long/khung-long-la-gi`", "miệng há để phơi nắng" | ảnh mới, cá sấu Xiêm non miệng khép trên bờ sông bùn | bài 1 `tray_croc` thành brief `[ảnh]` riêng, hình gốc của chủ đề (cá sấu Xiêm nằm trên bờ sông, miệng khép; từ khoá `Crocodylus siamensis`); bài 1 `q4_croc` "Dùng lại hình `tray_croc`"; bài 4, 5, 6, 7 "Dùng lại hình `tray_croc` ở bài `noi-song-tren-trai-dat/bac-cuc`". `alt` "A crocodile on a riverbank" giữ |
| 1 `explore_bear` và mọi chỗ gấu trắng (bài 1, 2, 6, 7, 8) | trỏ `be-mat-trai-dat/cac-chau-luc-va-dai-duong` `tray_arctic`; `alt` "A polar bear on floating ice" | gấu đi trên băng biển (pack ice) sát mặt nước | bài 1 `explore_bear` thành brief `[ảnh]` riêng, hình gốc của chủ đề (từ khoá `polar bear sea ice; Ursus maritimus`); các chỗ khác của bài 1 "Dùng lại hình `explore_bear`"; bài 2, 6, 7, 8 "Dùng lại hình `explore_bear` ở bài `noi-song-tren-trai-dat/bac-cuc`". `alt` giữ (băng biển là băng nổi). Bảng Hình dùng chung chuyển hai dòng `tray_arctic`, `q1_reptiles` lên nhóm hình gốc của chủ đề |
| 3 `explore_vietnam` | Cúc Phương hoặc Cát Tiên | rừng Cát Tiên, cây cổ thụ rễ bạnh, dây leo, cây bụi; không đường mòn | brief ghi Cát Tiên; `alt` giữ |
| 3 `explore_amazon` | "một dòng sông lớn uốn khúc chảy qua" | rừng A-ma-dôn gần Manaus nhìn từ trên cao, sông Rio Negro ở phía xa | brief "có sông ở phía xa"; `alt` giữ |
| 3 `tray_gibbon` | ưu tiên Cát Tiên | vượn cái lông vàng nâu, tay dài với lên cành, iNaturalist ghi "Vietnam" (vị trí ẩn) | Giữ; `alt` khớp (thấy rõ tay dài) |
| 4 `explore_swamp` | "ưu tiên Tràm Chim … nếu không thì đầm lầy nước ngọt khác ở châu Á" | đầm sen ở Missouri, Mỹ | bỏ "ở châu Á"; `alt` giữ |
| 4 `explore_crane` | ưu tiên Tràm Chim | hai con sếu đầu đỏ ở đầm Dadri, Ấn Độ | Giữ (brief đã cho phép Ấn Độ) |
| 5 `explore_deep` | "ảnh do tàu lặn không người lái của NOAA chụp" | sứa *Bathykorus bouilloni* trong suốt trên nền đen, NOAA Hidden Ocean 2005, trang gốc ghi "deep-sea"; trang không nói chụp tại chỗ hay trong bể trên tàu | brief bỏ "do tàu lặn không người lái chụp", giữ "ảnh NOAA, sứa biển sâu". Nếu PM đòi ảnh chắc chắn chụp dưới biển: "Pink Jellyfish" (NOAA, khu bảo tồn Channel Islands, chụp dưới biển sâu), nhưng sứa màu hồng, nhỏ trong khung, nên `alt` phải đổi khỏi "see-through" |
| 5 `tray_clownfish` | ưu tiên Nha Trang | rạn Great Barrier, Úc | Giữ (brief đã cho bỏ tên nơi) |
| 5 `tray_sea_turtle` | ưu tiên Côn Đảo | rùa biển xanh nằm nghỉ trên rạn san hô, đảo Apo, Philippines | Giữ |
| 6 `explore_savanna` | "savanna Serengeti acacia" | đồng cỏ Masai Mara (Kenya), một cây keo, đồi phía sau | brief bỏ "Serengeti" (như brief đã dặn); `alt` không đổi |
| 6 `explore_dry` | — | đồng cỏ khô vàng lúc bình minh, Kruger, Nam Phi, mùa đông khô | Giữ |
| 6 `explore_herd` | "rất đông … nối nhau thành hàng dài, chụp từ xa" | đàn rất đông đứng sát nhau, chụp gần hơn (Maasai Mara, mùa di cư) | brief bỏ "nối nhau thành hàng dài"; `alt` giữ. Ảnh toàn cảnh hàng dài ở Serengeti (William Warby) chỉ còn 349 px chiều cao sau khi `fetch` lấy bản 1280 px, nên không dùng |
| 6 `tray_lion` | "nằm nghỉ trên cỏ khô" | sư tử đực hoang dã nằm nghỉ trên nền đất trống, miệng khép (Ngorongoro, Tanzania) | brief "nằm nghỉ trên nền đất"; `alt` giữ. Ảnh "Lion waiting in Namibia" đẹp hơn nhưng chụp ở trung tâm cứu hộ AfriCat (sư tử nuôi nhốt) nên bỏ |
| 6 `tray_elephant` | "nhìn ngang" | voi đứng nhìn thẳng, hai tai xoè, cặp ngà | brief "nhìn thẳng"; `alt` giữ |
| 6 q4 `q4_giraffe` | "cắt bỏ cây tán rộng bên cạnh" | cây keo đứng sát hươu; crop bỏ thân cây, còn mép tán ở góc trái | Giữ; không cắt hết được mà không cắt hươu |
| 7 `explore_camel` | "nhìn ngang" | lạc đà một bướu đứng chếch ba phần tư trên cát gần Nefta, Tunisia, không yên cương | Giữ |
| 7 `explore_fennec` | — | cáo fennec hoang dã ban ngày trên cát, Ma Rốc | Giữ |
| 7 `tray_lizard` | "Trang gốc ghi Xa-ha-ra hay Bắc Phi thì tốt" | *Uromastyx aegyptia* trên cát sỏi ở thung lũng Arava (Israel) | Giữ (brief, `alt` không ghi tên nơi) |
| 2 `explore_huddle` | "khối tròn … nhiều con quay lưng ra ngoài" | đàn chim cánh cụt hoàng đế đứng rất đông, sát nhau giữa mùa đông, không thành khối tròn rõ; ảnh chỉ 1024 px | Giữ `alt` "A big group of emperor penguins"; brief bỏ "thành một khối tròn" |

### Ảnh khó, thiếu hoặc yếu

- **Không phải đổi món nào.** Mọi chỗ đều có ảnh hợp lệ.
- **Cáo fennec:** mọi ảnh CC BY trên Openverse đều là cáo nuôi (iNaturalist ghi `captive`). Ảnh dùng là bản Commons duy nhất của một con hoang dã chụp ban ngày (iNaturalist 615513692, Horatiu Stefanie, CC BY 4.0). Đuôi và chân hơi mờ do chuyển động.
- **Đàn chim cánh cụt hoàng đế đứng sát nhau:** chỉ có một ảnh hợp lệ, 1024 px, chụp đàn đông chứ không thấy khối tròn.
- **Độ nét:** `fetch` lấy bản 1280 px của Commons. Vài khung vuông dưới 600 px: `explore_land` 538, `explore_sea_food` 563, `explore_huddle` 576, `explore_swamp` và từ `habitat` 595 (bài 1 cũng có món 469–480 px). Các thẻ 5:2 đều 1024×410, trừ sứa biển sâu 800×320 (ảnh gốc 800 px).
- **Rạn san hô Việt Nam, Tràm Chim, Cần Giờ:** không có ảnh dùng được; chủ đề dùng ảnh nơi khác, không ghi tên nơi.

**Còn chưa chắc:** sứa *Bathykorus* có thể chụp trong bể trên tàu (trang gốc không nói). Đầm sen chọn ở Mỹ, không ở châu Á. Ô "Icy land" dựa vào núi tuyết nhỏ phía sau. Ba điểm này chờ PM quyết.

**Sửa sau chạy thử iPhone 16 (16/11).**
- Bài 6 `explore_savanna`: đổi sang ảnh "Landscape, Masai Mara, Kenya (52452028118)" (flowcomm, CC BY 2.0, Commons). Đồng cỏ trải tới chân trời thấp, ba cây keo tán phẳng, không đồi rừng. Mọi crop dừng ở x 0,66, tránh hai con linh dương bên phải. Đổi bốn chỗ: ô Học (vuông), bài 6 `q5_savanna` (5:2), từ `savanna` (2:1), bài 7 `q4_savanna` (vuông, `same_as`). `alt` giữ. Brief bỏ "Serengeti" (ảnh chụp ở Masai Mara, châu Phi). Ảnh này không nằm trong hình ghép `earth`.
- Thẻ từ Explorer trên máy là khung ngang 2:1, nhưng `tools/content-cli/image-slots.json` vẫn ghi `vocab` 1:1, nên `fetch` không cảnh báo khi app cắt giữa ảnh vuông. Đã thêm crop 2:1 cho các thẻ từ bị cắt hỏng: `emperor_penguin` (mất đầu), `giraffe` (mất đầu), `camel`, `hump` (mất bướu), `walrus` bài 1 (mất nửa đầu), `antarctic` (mất núi tuyết), `swamp`, `habitat` (mất sen và nước), `desert`, `hot`. Các thẻ từ khác cắt giữa vẫn đủ ý. Đề xuất dev: sửa `image-slots.json` mục `explorer` thành `"vocab": "2:1"`, rồi kiểm lại thẻ từ của mọi chủ đề Explorer (bài 1 cũ đều crop vuông).
- `images fetch content/images/explorer/noi-song-tren-trai-dat`: 8 file, 136 ảnh khác nhau, 0 lỗi, 0 cảnh báo tỉ lệ.

## Kiểm nghiệm thu (tester 16/11)

Lượt kiểm cuối, sau lượt sửa của content-editor (hai lượt) và lượt chọn ảnh của designer (bài 1, bài 2–8, sửa sau chạy thử). Không sửa file nội dung, file chọn ảnh hay code; không dùng simulator; không ghi vào `content/.build/pack` hay cache. Gói kiểm thêm ghi ở scratchpad riêng, không đụng gói thật.

**Lệnh đã chạy (chỉ đọc, hoặc ghi ra scratchpad):**

| Lệnh | Kết quả |
| --- | --- |
| `validate content/explorer/noi-song-tren-trai-dat` | **9 file · 0 lỗi · 9 cảnh báo** (cả 9 là `md_needs_check`: 142 dòng `[CẦN KIỂM]` — 36 ở `_topic.md`, 106 ở tám bài) |
| `validate content` | **78 file · 0 lỗi · 145 cảnh báo · syllabus (3 nhóm, 46 chủ đề, 394 bài)** |
| `build … --require-assets --out <scratchpad>` | **exit 0** · 8 bài · asset 1601 (audio en 716, vi 748, ảnh 137) · "137 file ảnh (1 hình ghép) cho 299 Image · **0 Image chưa có ảnh**" · 0 cảnh báo tỉ lệ (9 cảnh báo đều là `ai_draft = true`) · version `4ded74854a6e` **trùng** version của chủ đề trong `content/.build/pack`, tức gói thật khớp nội dung hiện tại |
| `sh tools/content-cli/scripts/check-pack.sh content/.build/pack` | **OK, exit 0** · 14960 file khớp manifest · 11 pack.json · `"brief"` = 0 ở mọi pack · thiếu file audio 0 · **ảnh: 1325 file kiểm JPEG, metadata, kích thước, credit, giấy phép (79 hình ghép, kiểm cả parts) · lỗi: 0** |
| `npm --prefix tools/content-cli test` | **399/399 pass, 0 fail**; có test "validate content từ gốc repo … 3 nhóm, 46 chủ đề, 394 bài" |
| Bộ script rà chữ ở scratchpad (`python3 -I`) | chạy lại toàn bộ trên tám bài hiện tại; kết quả dưới |

**Chạy lại bộ script sau các lượt sửa — không có chỗ hỏng mới:**
- `t_words.py`: 0 câu EN quá tám từ (đếm theo câu), 0 chuỗi `.en` có dấu tiếng Việt, 0 chuỗi `.vi` có chữ số hay ký hiệu, 0 câu VI quá hai mươi từ. Các câu mới (bài 3 q6, bài 4 q6, bài 8 q4 `hint`, bài 6 w2 `hint`, bài 7 q5 và bài 8 q5 `explanation_correct.en`) đều trong hạn.
- `check_struct.py`: tám bài, mỗi bài sáu câu Quiz DOK 1·1·1·2·2·2, đúng một misconception ở q6; Khởi động 2 câu (bài 1–6), 3 câu (bài 7, 8), DOK 1.
- `check_fb.py`, `check_more.py`: 0 lựa chọn sai thiếu `feedback`, 0 `feedback` quá một câu hay quá tám từ, 0 `true_false` sai phía. Năm dòng máy báo ở mục 2 đều là trùng âm tiết ngẫu nhiên ("cánh đồng" ↔ "cánh cụt", "khô" ↔ "san hô") hoặc hai con cáo cùng câu (cố ý), như lượt trước.
- `t_table.py`: 64 `prompt` Khởi động + Quiz **khớp từng chữ** bảng Khung Quiz (`lệch 0`) sau khi content-editor sửa bảng; 32 câu `true_false` khớp bảng Đúng/Sai; `explanation_correct` của câu đáp án Sai vẫn đứng một mình được; 5 chỗ máy bắt chữ chỉ vị trí đều là vị trí **trong một hình** (giữa đàn chim cánh cụt, đáy cát, đỉnh đầu con cáo) — không chỗ nào nhắc vị trí thẻ.
- `t_meta.py`, `check_misc.py`: tám key misconception đều có thật, mỗi key một lần; `recall_from` của 18 câu Khởi động trỏ đúng bài có thật; bốn câu `order_sequence` đúng ba thẻ, mỗi câu một thứ tự đúng; từ vựng 4–5 từ, `term_keys` khớp danh sách `core` ở cả tám bài. (Ghi cho lượt sau: `t_meta.py` mục 2 báo "LECH" là **lỗi của script** — đọc trường `kind` thay vì `tier`; `check_misc.py` mục 2 mới đúng.)
- `t_img.py`: **0 chỗ có hình mà thiếu `brief` hay `alt.en`/`alt.vi`**; 262 chỗ "Dùng lại hình" đều trỏ key có thật. **14 chỗ `alt` khác gốc** (trước đây 7) khớp **đúng** sáu dòng bảng "alt riêng" `_topic.md:399-410` sau khi content-editor thêm ba dòng (n5): `w1_buffalo` 4 chỗ, `tray_antarctica` 4 chỗ, cá thòi lòi 3 chỗ, cộng `q3_crab`, `q1_whale`, `w1_camel`.
- Script mới đối chiếu **hai chiều** bảng Hình dùng chung: 54 dòng bảng, **0 lệch** với chỗ dùng thật trong tám bài; 0 hình dùng ở hai bài trở lên mà thiếu dòng bảng (trừ `w1` hàng rào tre, cố ý ghi bằng lời ở `_topic.md:438`). Hình gốc trong chủ đề: 36 ảnh + 1 hình ghép, đúng con số ở `_topic.md:456`.
- Các mục đã sửa: **C1** — grep cả thư mục còn 0 chỗ "dưới mặt đất"/"sống dưới đất" trong chữ bé nghe (chỉ còn trong dòng `>` và bảng ghi lý do); **N1** — `01:474-475` nay là ảnh riêng `q4_reindeer`, `alt` "A reindeer on cold land", ảnh thật là tuần lộc trên đồng rêu xanh **không có tuyết** (đã mở xem); **N2** — `08:484-485` `hint` chỉ còn một đầu dải; **N3** — `04:524` "đầm lầy đầy bùn". Chữ cấm (adapt/thích nghi, khí hậu, bản đồ, Antarctica, môi trường sống, jungle, ngủ đông, băng tan, săn bắt, giết, xương rồng): **0 kết quả** trong mọi trường bé nghe.

**Ảnh và giấy phép (`jq` trên `content/.build/pack`, lọc 137 asset ảnh của chủ đề mới):**
- **Mọi chỗ có hình đều có mục, 0 chỗ trống:** 299 mục trong tám file chọn ảnh (37 · 35 · 37 · 36 · 38 · 38 · 38 · 40), đúng bằng 299 Image; `build --require-assets` chạy xong, "0 Image chưa có ảnh".
- **Giấy phép:** CC BY 2.0 40 · Public domain 31 · CC BY 4.0 29 · CC0 1.0 23 · CC BY 3.0 8 · CC BY 2.5 4 · PDM 1.0 2. **0 ảnh BY-SA, NC, ND hay không rõ giấy phép**, cả trong gói lẫn trong tám file chọn ảnh. Mọi ảnh CC BY đều có `author`.
- **Credit đủ trường:** 137/137 có `title`, `author`, `license`, `license_url`, `source`; chỉ hình ghép `earth` không có `source_url` (nguồn "composed", tự ghép) — credit của nó có `parts` đủ bốn ảnh gốc kèm tác giả (Patrick Kelley, JanSuchy, Vyacheslav Argenberg, NOAA Fisheries/Andrew Gray). Nguồn: Wikimedia Commons 115, Openverse/iNaturalist 13, Openverse/Flickr 8, composed 1.
- **Không bản đồ, quả địa cầu, ảnh Trái Đất từ vũ trụ:** quét 63 tên ảnh và mọi `source_url` theo "map/globe/satellite/world/planet/NASA/atlas/hemisphere" → **0 kết quả**. Hình ghép `earth` đã mở xem: lưới 2×2 băng biển · đồi cát · rừng · rạn san hô, không có quả địa cầu.
- **Ảnh tester mở xem trong `content/.images` (9 ảnh):** gấu trắng (băng biển, không vòng cổ, không người, không con mồi, không nhe nanh) · cá sấu Xiêm (miệng khép, bờ bùn) · tuần lộc `q4_reindeer` (đồng rêu xanh, không tuyết, không dây cương) · xavan mới (đồng cỏ, ba cây keo, không con vật, không người) · lạc đà (không yên, không dây cương, không người) · cáo fennec (hoang dã trên cát) · đầm lầy (xanh tốt, nhiều sen, không con vật — đúng yêu cầu n3) · hình ghép `earth` · bài 2 `explore_land` (bãi sỏi, **không thấy du khách** — crop đã cắt đúng). 128 ảnh còn lại theo báo cáo designer, tester chưa mở từng ảnh.
- **Tên nơi:** chữ bé nghe chỉ nêu "Xa-ha-ra" và "A-ma-dôn"; ảnh tương ứng là "Erg chebbi sunrise" (Ma Rốc, thuộc Xa-ha-ra) và "Amazon rainforest manaus…" — khớp. Không chuỗi bé nghe nào nêu Cát Tiên, Cúc Phương, Serengeti, Masai Mara, Tràm Chim, Cần Giờ, Côn Đảo, Nha Trang.

**Bảng kiểm từng tiêu chí**

| # | Tiêu chí | Kết quả | Bằng chứng |
| --- | --- | --- | --- |
| B0.1–B0.3 | Duy chốt 9 câu; PM đọc Oak Địa lý | đạt | mục "Quyết định đã ghi", `docs/oak/geography-y2-cold-and-hot-places.md` |
| B0.4 | `content/syllabus.json` có chủ đề ở #4, 8 bài, `oak_lessons: []`, `statutory: false`, #5–#13 đánh lại; `syllabus.test.ts` 46/394, test xanh | **đạt** | đọc máy: Explorer 13 chủ đề / 83 bài; #4 `new-habitats-around-the-world`, `strand: living_environment`, `level: 3`, `source.kind: new`, 8 bài tên EN/VI khớp bảng; `syllabus.test.ts:95,101,109` nêu 46/394; `npm test` 399/399 |
| B0.5 | Tài liệu sửa theo "Việc kéo theo" | đạt | `syllabus.md`, `syllabus-lessons.md`, `syllabus-progression.md` 46/394; `prd.md`, `technical-plan.md` chỉ còn "45 chủ đề" ở dòng lịch sử có ngày (đúng luật pm) |
| CE1 | `_topic.md` frontmatter và các mục | đạt | `_topic.md:1-18`: `age_group: explorer`, `order: 4`, `strand`, `level: 3`, difficulty 2-3-2-2-2, `prerequisites`, `is_free: false`, không `oak_unit_ref`, `ai_draft: true` |
| CE2 | 8 bài, đúng thứ tự, `stage`, tên khớp `syllabus.json` | đạt | `stage`: opener · core ×5 · apply · review; `lesson_id` và tên EN/VI khớp từng chữ |
| CE3 | Luật Explorer (Khởi động, 6 câu DOK 1·1·1·2·2·2, q6 misconception, dạng câu, ≤8 từ EN, `true_false` khẳng định) | đạt | `check_struct.py`, `t_words.py`, `check_tf.py`, `validate` 0 lỗi |
| CE4 | Khởi động bài 1 (ý chung "nơi sống" + ôn *Gọi tên và nhóm động vật*); bài 8 ôn `plants_grow_anywhere` | đạt | `01:46`, `01:63`; `08:106` → `sinh-vat-song-o-dau/noi-song-cua-cay` |
| CE5 | SK-044 `feedback` | đạt | `check_fb.py`, `check_more.py`: 0 thiếu, 0 quá dài, 0 sai phía |
| CE6 | SK-047 không nhắc vị trí thẻ; `explanation_correct` câu Sai đứng một mình | đạt | `t_table.py` (5 chỗ máy bắt đều là vị trí trong hình) |
| CE7 | `order_sequence` một thứ tự đúng | đạt | bốn câu `05:427`, `06:438`, `07:450`, `08:473`; thẻ trong file không nằm sẵn đúng thứ tự |
| CE8 | Từ vựng 4–5 từ, 2–3 `core`, khớp `term_keys`; 0 "adaptation/thích nghi" | đạt | `check_misc.py` mục 2 (8/8 OK); grep 0 kết quả |
| CE9 | Ranh giới (Oak, chuỗi thức ăn, con người, xương rồng, lạc đà hoang dã, đồi cát VN) | đạt | grep chữ cấm 0 kết quả; `noi-song-cua-con-vat/q4_dunes` không dùng ở đâu |
| CE10 | `[CẦN KIỂM]` có dòng; Ghi chú cho hoạ sĩ đủ ảnh mới · dùng lại · khó | đạt | 142 dòng `[CẦN KIỂM]`; tám bài đều có ba mục trong "Ghi chú cho hoạ sĩ" |
| D1 | Mọi chỗ có hình có mục, 0 chỗ trống | **đạt** | 299/299; `build --require-assets` exit 0 |
| D2 | Chỉ CC0/PD/PDM/CC BY có ghi công; 0 BY-SA, NC, ND; `fetch` 0 lỗi, 0 cảnh báo tỉ lệ | **đạt** | bảng giấy phép ở trên; `build` 0 cảnh báo tỉ lệ; `check-pack` kiểm 1325 ảnh, lỗi 0. Phần `images fetch` tester **không chạy lại** (không gọi mạng): theo báo cáo designer 8 file · 136 ảnh · 0 lỗi |
| D3 | Ảnh mang tên nơi khớp trang gốc | đạt | Xa-ha-ra ← Erg Chebbi; A-ma-dôn ← Manaus; chữ bé nghe không nêu tên nơi nào khác |
| D4 | Không chuồng, người, xe, vòng cổ, yên cương, cảnh săn mồi, chữ, logo | đạt phần kiểm được | tester mở 9 ảnh (danh sách ở trên), không thấy vi phạm; 128 ảnh còn lại theo báo cáo designer |
| D5 | Không bản đồ, quả địa cầu, Trái Đất từ vũ trụ | **đạt** | quét tên ảnh và nguồn: 0 kết quả; hình ghép `earth` đã xem |
| D6 | Không phải đổi món; hình tự vẽ chỉ khi PM đồng ý | đạt | 0 mục `own` trong tám file chọn ảnh; 1 hình ghép, có ghi ở `_topic.md:307` |
| T1 | Rà chữ: 0 chặn; mục "nên sửa" đã sửa hay có quyết định | **đạt** | C1, N1, N2, N3 đã sửa và kiểm lại; n1, n3, n4, n5, n9, n10 đã sửa; n2, n6, n7, n8, n11 giữ có lý do |
| T2 | Tester đọc mọi dòng `[CẦN KIỂM]` ở mức 5–7 tuổi | đạt | 142 dòng; không thấy chỗ nào sai rõ với trẻ; không thay người chuyên môn |
| P1 | `validate` 0 lỗi; `ids` đã chạy | **đạt** | 0 lỗi; 0 dòng `id:` trống trong chín file (18+17+18+17+18+18+19+18+9 id đã điền) |
| P2 | `images fetch` 0 lỗi; `tts` EN và VI; `build`; `check-pack` OK | **đạt** | `tts` EN: 916 chuỗi, 916 có clip, 755 clip khác nhau, 0 cảnh báo. `tts` VI: 916/916, 748 clip, **74 clip bị đánh dấu** (`flagged_first_check` = `still_flagged` = 74, cờ `asr`; 37 cảnh báo `loanword`: "xavan" 22, "fennec" 15). `build` + `check-pack` chạy lại, OK |
| P3 | Chơi trọn một bài trên iPhone 16, một máy, một lần | đạt theo báo cáo ios-dev | tester **không dùng simulator** (luật một máy, một lần): chưa tự kiểm |
| PM1 | Người chuyên môn đọc hết `[CẦN KIỂM]` trước khi phát hành | **chưa đạt — chờ người chuyên môn** | 142 dòng còn nguyên; `validate` vẫn cảnh báo `md_needs_check` nên chưa phát hành được |
| PM2 | Tài liệu và `docs/backlog/README.md` khớp 46/394, Explorer 13/83, #4 | đạt phần số đếm | dòng SK-048 đã có ở `docs/backlog/README.md:87` (trạng thái `in_progress`); pm đổi trạng thái khi đóng |

**Tổng: 25 đạt · 2 đạt một phần (D4, PM2) · 1 đạt theo báo cáo người khác (P3) · 1 chưa đạt (PM1, chờ người chuyên môn) · 0 không đạt.**

### Lỗi mới của lượt này

Không có lỗi chặn. Hai mục nên sửa và vài góp ý:

**L1 (nên sửa, cần một lượt nhìn trên máy). Thẻ từ Explorer là khung 2:1 nhưng 25 trong 33 ảnh thẻ từ của chủ đề vẫn là ảnh vuông; nặng nhất là hình ghép `earth`.**
- `tools/content-cli/image-slots.json:20-23`: mục `explorer.ratios` chỉ ghi đè `choice_3`, `choice_2`; `vocab` rơi về `default` `"1:1"` (`image-slots.json:13`), nên `fetch` và `build` **không cảnh báo** khi app cắt giữa ảnh vuông. Designer đã ghi đề xuất này cho dev; tester xác nhận đúng trong file.
- Đếm trong gói: 33 asset thẻ từ của chủ đề, **25 là 1:1**, 8 là 2:1 (đúng mười thẻ designer đã sửa cộng `savanna`). Trong 25 ảnh vuông có **`earth` — hình ghép lưới 2×2, 1024×1024** (`content/images/explorer/noi-song-tren-trai-dat/moi-con-vat-mot-noi-song.json`, mục `vocab.earth`, không có `crop`). Cắt giữa về 2:1 sẽ xén mất nửa trên của hai ô trên và nửa dưới của hai ô dưới, để lại dải giữa có khe ngăn chạy ngang — thẻ từ khoá nhất của bài 8.
- Tester **chưa kiểm được trên máy** (không dùng simulator). Đề nghị: ios-dev hoặc designer nhìn thẻ từ `earth` một lượt; nếu đúng như trên thì designer thêm `crop` 2:1 (hoặc ghép lại hình ngang 2:1), và dev sửa `image-slots.json` rồi rà thẻ từ của mọi chủ đề Explorer.

**L2 (nên sửa, đã là Còn mở — xin PM chốt). Ô "Icy land" bài 2: ảnh là bãi sỏi, chữ của ô nói đất phủ băng.**
- `02-nam-cuc.md:121-128`: `sentence` "The Antarctic is icy land, far south." và ví dụ một "ice and snow cover the land" · "băng và tuyết phủ kín mặt đất"; ảnh (đã mở xem) là chim cánh cụt Gentoo trên **bãi sỏi xám**, núi phủ tuyết ở phía xa chiếm khoảng một phần sáu bề ngang. `alt` đã sửa đúng thành "bãi đá lạnh", nên `alt` và câu của ô nói hai điều khác nhau. Designer đã ghi là không làm rõ hơn được với ảnh này.
- Đề nghị: hoặc đổi ảnh ô này sang cảnh đất phủ băng, hoặc sửa ví dụ một thành điều nhìn thấy ("snow lies on the hills" · "tuyết phủ trên đồi"). Quyết định thuộc PM (`_topic.md` Còn mở).

### Góp ý

- **g1.** Bài 6: sau khi đổi ảnh, ô "Đồng cỏ xavan" (`06:110`) và ô "Mùa khô" (`06:375`) đều là cỏ vàng khô, khác ảnh và khác góc nhưng cùng tông; `brief` đòi "khác hẳn ảnh ô Mùa khô". Bé có thể hiểu xavan lúc nào cũng vàng. Không chặn; nếu đổi thì chỉ cần ảnh ô "Đồng cỏ xavan" có cỏ xanh hơn.
- **g2.** `tray_croc` ô vuông: con cá sấu nhỏ, cùng màu với nền bùn, ảnh hơi nhiễu — khó nhận ở ô kệ. Liên quan: `06-dong-co-xavan.md:77-78` `hint` "Look at the crocodile's long, strong jaws." · "cái hàm dài và khoẻ" khó thấy ở khung nhỏ. Để lượt chạy máy xem lại.
- **g3.** Credit hình ghép `earth` không có `source_url` (asset `44ff02d7…`). Có `parts` đủ bốn tác giả nên đủ ghi công; chỉ nên xem màn Nguồn hình hiện gì khi thiếu trường này.
- **g4.** `[CẦN KIỂM]` tăng từ 141 lên 142 dòng (thêm một dòng ở bài 3 về voọc ở Cát Tiên). Đúng hướng: chỗ chưa chắc thì ghi ra.
- **g5.** Cho lượt rà sau: `t_meta.py` mục 2 (`term_keys`) có lỗi script, đọc trường `kind` thay vì `tier`; dùng `check_misc.py` mục 2.

### Còn chờ người

- **Chờ người chuyên môn:** 142 dòng `[CẦN KIỂM]` (36 `_topic.md`, 106 tám bài). Nặng nhất: tuần lộc Bắc Cực hoang dã hay do người chăn; chiều cao sếu đầu đỏ và "chim bay cao nhất"; cá sấu Xiêm ở Bàu Sấu; độ sâu con sứa trong ảnh NOAA; hươu cao cổ, cá sấu ở rìa Xa-ha-ra; nước rừng ngập mặn mặn hay lợ; xavan "ấm quanh năm"; cách viết tên tiếng Việt theo sách giáo khoa.
- **Chờ Duy:** nghe **74 clip VI bị đánh dấu** (cờ `asr`; nhóm lớn: "xavan" 14, "tai/tay" 12, "voọc" 11, "fennec" 10, "Xa-ha-ra" 3, "chim cánh cụt" 2, còn lại 28 — ví dụ "tuần lọc", "con xếu", "ngồi lên thở"). Danh sách ở `content/.audio/report-noi-song-tren-trai-dat-01_02_03_04_05_06_07_08-vi.json`.
- **Chờ PM:** L2 (ô "Icy land"); ba điểm ảnh ở "Còn chưa chắc" của designer (sứa `Bathykorus`, đầm sen ở Mỹ, núi tuyết nhỏ); bảng "Vị trí đáp án đúng" (`_topic.md` Còn mở số một); ảnh NASA cũ `tray_arctic` của Discoverer *Bề mặt Trái Đất*.
- **Chưa kiểm (cần máy):** L1 (thẻ từ `earth`), g2, renderer `order_sequence`, thẻ "Ý sai → Ý đúng" ở Tổng kết, hai ô vuông chim cánh cụt bài 2 (n8). Tester không dùng simulator ở lượt này.

**Sửa sau nghiệm thu (16/11).**
- Hình ghép `earth` ghép lại thành 1024×512 (khung 2:1 của thẻ từ), lưới 2×2, mỗi ô ~2:1 cắt đúng phần cảnh (băng nổi, đỉnh đồi cát, thân cây rễ bạnh, quạt san hô có nước xanh). Giữ khe giấy điệp 12 px, không viền. Lưu đè đúng file cũ; mục `composed` giữ bốn phần, chỉ sửa `note`.
- Bài 2 ô "Icy land" và từ `antarctic`: ảnh mới "Transantarctic Mountains (10986929324)" (NASA Operation IceBridge, ảnh Jim Yungel; Public domain): núi gần sông băng Beardmore phủ băng tuyết, cánh đồng băng trắng. Crop vuông 720 px, thẻ từ 2:1 922×461; mọi crop dừng ở x 0,72, bỏ cánh máy bay ở mép phải. Hình gốc mới của bài 2, nằm ở `nam-cuc.json`. Bài 1 `tray_penguin`, bài 3 `q5_icy_land` giữ ảnh Gentoo. Đề xuất `alt` "Snowy mountains on icy land" · "Núi tuyết trên vùng đất phủ băng". Brief hai chỗ thành `[ảnh]` riêng, từ khoá `Transantarctic Mountains; Antarctica ice sheet` (không còn "Dùng lại hình `tray_antarctica`").
- `images fetch content/images/explorer/noi-song-tren-trai-dat`: 8 file, 136 ảnh khác nhau, 0 lỗi, 0 cảnh báo tỉ lệ; hình ghép xử lý mới, CC BY 2.0, ghi công đủ bốn ảnh.

## phiên chính 16/11 · chạy lệnh, chạy thử, sửa sau nghiệm thu

- **Danh mục:** `content/syllabus.json` thêm `new-habitats-around-the-world` ở Explorer #4, #5–#13 đánh lại số, `topic_id` và 8 `lesson_id` sau `ids`; `tools/content-cli/test/syllabus.test.ts` 46 chủ đề / 394 bài; dòng SK-048 ở `docs/backlog/README.md`.
- **Lệnh:** `ids` (thứ tự `_topic.md` → bài 1 … 8), `import`, `tts --lang en` (0 cảnh báo), `tts --lang vi` (748 clip, 74 đánh dấu; `tools/content-cli/tts-vi/variants.json` chỉ thêm 165 mục), `build` gói 11 chủ đề (4 Explorer + 7 Discoverer) vào `content/.build/pack`, `check-pack` OK. `npm test` content-cli 399/399. Chủ đề build riêng với `--require-assets`: 0 hình thiếu ảnh.
- **Icon chủ đề:** designer vẽ `design/icons/topics/new-habitats-around-the-world.svg` (chim cánh cụt trên băng cạnh xương rồng trên đồi cát; không quả địa cầu), thêm vào canvas `Topic-Icons` và spec bản đồ mục 8; phiên chính chạy `apps/ios/scripts/import-topic-icons.sh` (46 icon).
- **ios-dev:** sửa test iOS ghi cứng số đếm (`SyllabusTests`, `JourneyTests`, `JourneySegmentTests`, `JourneyMapAppTests`, `OnboardingTests`, `OnboardingUITests`, README); ContentModelTests 28/28, ContentKitTests 51/51, ScienceKidsTests 91/91 trên iPhone 16. Chạy thử app: bản đồ có #4 với icon mới, đủ 8 bài, chơi trọn bài 1, lướt bài 6, màn Nguồn hình có ảnh mới. `OnboardingUITests` 6 qua, 4 hỏng, cả 4 có từ trước SK-048 (Explorer đã có bài từ `81f65a3`; SK-047 bỏ định danh `lesson.title`; audit tương phản tab Thẻ Discoverer).
- **Sửa sau chạy thử và nghiệm thu:** ảnh xavan bài 6 (ảnh cũ phần lớn là đồi rừng); hình ghép `earth` ghép lại 2:1 (thẻ từ Explorer trên máy là khung 2:1); ô "Icy land" và từ `antarctic` bài 2 đổi sang ảnh núi phủ băng Nam Cực của NASA (PD), phiên chính sửa `brief`/`alt` ("Snowy mountains on icy land" · "Núi tuyết trên vùng đất phủ băng") và bảng Hình dùng chung; build lại gói, `check-pack` OK. Không đổi chữ trẻ nghe sau lượt TTS cuối.
- **Chặng trên bản đồ (Duy chốt 16/11: "Giữ chặng riêng"):** app chia chặng theo năm Oak; chủ đề mới không có năm nên #4 đứng riêng Chặng 3, Explorer có 5 chặng. Không đổi code hay danh mục; test iOS (`JourneySegmentTests`, `JourneyMapAppTests`) đã khớp 5 chặng.
- **Việc kéo theo (ngoài SK-048, chưa làm):**
  - dev: `tools/content-cli/image-slots.json` thiếu `explorer.ratios.vocab` (thẻ từ Explorer trên máy là 2:1, file đang rơi về 1:1); kiểm lại thẻ từ các chủ đề Explorer khác; `images fetch` chỉ kiểm giấy phép iNaturalist qua Openverse (một ảnh Openverse ghi CC BY mà iNaturalist nay ghi NC).
  - Discoverer `be-mat-trai-dat`: ảnh gấu trắng `tray_arctic` giấy phép không rõ (Commons ghi PD-NASA, Flickr gốc ghi CC BY 2.0, tác giả Mario Hoppmann) — đổi sang ảnh USFWS mà SK-048 dùng, hoặc ghi CC BY 2.0 giữ tên gốc (Duy chọn); crop 4:5 của `tray_antarctica` còn du khách; `alt` "Penguins on icy land" không khớp ảnh.
  - Ảnh cá sấu há miệng `q1_reptiles` vẫn còn ở *Gọi tên và nhóm động vật* và *Khủng long*; `alt` ảnh ao `goi-ten-va-nhom-dong-vat/ca-va-luong-cu` `q1` (ảnh là đầm lầy trong rừng); `alt` cá thòi lòi ở *Sinh vật sống ở đâu?* bài 4.
  - ios-dev/tester: sửa 4 `OnboardingUITests` hỏng có từ trước; màn Nguồn hình gộp ảnh trùng `source_url`.
  - PM: bảng "Vị trí đáp án đúng" (SK-047 cho hết hiệu lực); ba điểm ảnh "còn chưa chắc" của designer (sứa *Bathykorus* có thể chụp trong bể trên tàu; đầm sen ở Mỹ; ô Xavan và ô Mùa khô đều cỏ vàng); người chuyên môn đọc 142 dòng `[CẦN KIỂM]`.
- Chưa commit, chưa push.

