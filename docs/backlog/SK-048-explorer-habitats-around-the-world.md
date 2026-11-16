# SK-048 · Chủ đề Explorer mới "Những nơi sống trên Trái Đất" (Habitats around the world, 8 bài)

Trạng thái: todo · Ngày: 2026-11-16 · Phụ trách: content-editor (soạn) · designer (ảnh) · phiên chính chạy lệnh · Tester: tester
Nguồn: Duy 16/11 (yêu cầu; chốt câu 1–7, rồi câu 8, 9); [docs/explorer-habitats-proposal.md](../explorer-habitats-proposal.md) (đề xuất đầy đủ, đã chốt); [docs/oak/geography-y2-cold-and-hot-places.md](../oak/geography-y2-cold-and-hot-places.md) (Oak Địa lý Year 2, đọc 16/11); `syllabus.md` mục 1–3; `syllabus-progression.md` mục 3, 5.1, 6–8; `content/syllabus.json`; `content/TEMPLATE.md` (bảy luật Explorer, mục SK-044, SK-047); `content/rules.json` (`explorer.authoring`); SK-041, SK-045, SK-046 (khuôn soạn và rà chữ Explorer); SK-033 (ảnh)

> **Duy đã chốt cả chín câu ngày 16/11** (nút "Theo đề xuất PM", hai lượt; chi tiết ở "Quyết định đã ghi"). Không còn câu nào chờ Duy.
> **Tài liệu đã sửa 16/11** (phần pm của "Việc kéo theo"), trừ dòng `docs/backlog/README.md`.
> **Còn chờ:**
> - SK-045, SK-046 đóng rà chữ (câu 7 = a; 16/11 cả hai còn ở `review`). Chưa giao content-editor.
> - Phiên SK-047 commit, để thêm chủ đề vào `content/syllabus.json`, sửa `tools/content-cli/test/syllabus.test.ts` và thêm dòng vào `docs/backlog/README.md`.

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
- [ ] `content/syllabus.json` có chủ đề mới ở #4 (chờ phiên SK-047 commit):
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
- [ ] `validate content/explorer/<slug>` 0 lỗi; `ids` chạy theo thứ tự `_topic.md`, rồi bài 1 tới bài 8.
- [ ] `images fetch` 0 lỗi; `tts` EN và VI (ghi số clip VI bị đánh dấu chờ Duy nghe); `build`; `check-pack` OK.
- [ ] Một bài chơi trọn Khởi động → Học → Chơi → Quiz → Tổng kết → Thưởng trên simulator iPhone 16, một máy, một lần (không dùng iPhone 16 Pro).

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
