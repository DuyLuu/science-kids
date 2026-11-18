# SK-050 · Chủ đề Explorer mới "Thời tiết và các mùa" (Weather and seasons, 6 bài), gộp Explorer #5 và #8

Trạng thái: review · Ngày: 2026-11-17 (review 18/11) · Phụ trách: dev (danh mục) · content-editor (soạn) · designer (ảnh, icon) · ios-dev (test, icon) · phiên chính chạy lệnh · Tester: tester
Nguồn: Duy 17/11 (yêu cầu; chốt bằng "bật mode auto, không cần hỏi thêm"); [docs/explorer-weather-seasons-proposal.md](../explorer-weather-seasons-proposal.md) (đề xuất đầy đủ, đã chốt); `syllabus.md` mục 1–3, 8; `syllabus-lessons.md` Explorer #5, #8; `syllabus-progression.md` mục 3, 4, 6–8, 11; `docs/syllabus-review-2026-11-13.md` câu D3, D4; `content/syllabus.json`; `content/TEMPLATE.md` (bảy luật Explorer, SK-044, SK-047); `content/rules.json` (`explorer.authoring`); SK-048 (khuôn gần nhất); SK-038 (Discoverer #5 thời tiết); SK-034 (chặng bản đồ); SK-033 (ảnh)

> **Số ticket:** brief ban đầu ghi SK-049, nhưng SK-049 đã được phiên khác dùng cho Explorer #6 *Cơ thể của em* (17/11), nên lấy SK-050.
> **Chốt 17/11.** Duy (lời Duy do phiên chính chuyển lại): "bật mode auto, không cần hỏi thêm". Sáu câu ở "Câu hỏi 1–6" theo đề xuất PM. Câu còn mở chỉ là chỗ cần người chuyên môn kiểm.
> **Tài liệu đã sửa 17/11 (pm):** đề xuất, ticket này, dòng `docs/backlog/README.md`, ghi chú câu D4 ở `docs/syllabus-review-2026-11-13.md`, ghi chú ở `docs/explorer-habitats-proposal.md` mục 5.
> **Lượt 2, 17/11:** danh mục `content/syllabus.json` đã đổi (Explorer 12 / 79, cả app 45 / 390; phiên chính kiểm: `validate content` 0 lỗi, dòng tổng "3 nhóm, 45 chủ đề, 390 bài"; `npm test` content-cli 399/399). pm đã sửa `syllabus.md` (dòng trạng thái, mục 0, 1, 2, 3, 7, 8 ý 2, 9), `syllabus-lessons.md` (bỏ #5, #8 cũ, thêm #5 mới, đánh lại #8–#12), `syllabus-progression.md` (dòng trạng thái, mục 4, ghi chú 5.1, mục 11 dòng "Mùa", mục 12 câu gộp hai chủ đề mùa), `prd.md` (dòng cập nhật, mục 1, bảng GĐ, rủi ro, "Đã chốt", "Còn mở"), `technical-plan.md` (dòng trạng thái, A1, A5, A7, A8), ghi chú ở SK-049. Chưa soạn bài.

## Mục tiêu

Bé Explorer 5–7 tuổi gọi tên được thời tiết hằng ngày, nhận ra dấu hiệu bốn mùa ở miền Bắc và mùa mưa, mùa khô ở miền Nam, và biết một năm có mười hai tháng quay vòng, chỉ bằng nghe và nhìn.

## Phạm vi / Ngoài phạm vi

### Phạm vi
- **Danh mục:** bỏ Explorer #5 `seasonal-changes-autumn-and-winter` và #8 `seasonal-changes-spring-and-summer`; thêm chủ đề mới ở #5:
  - tên *Weather and seasons · Thời tiết và các mùa*; key `new-weather-and-seasons`; slug `thoi-tiet-va-cac-mua`;
  - `source.kind: new`, `strand: earth_sky`, `level: 2`; mọi bài `oak_lessons: []`, `statutory: false`.
- **Chủ đề mới** `content/explorer/thoi-tiet-va-cac-mua/`: `_topic.md` và 6 bài. Tên bài là tên danh mục, content-editor không tự đổi:

  | # | Bài (EN · VI) | `stage` | Misconception (câu 6) |
  | --- | --- | --- | --- |
  | 1 | Weather today · Thời tiết hôm nay | `opener` | `sun_gone_when_cloudy` |
  | 2 | Spring and summer · Mùa xuân và mùa hè | `core` | `flowers_only_in_spring` |
  | 3 | Autumn and winter · Mùa thu và mùa đông | `core` | `winter_means_snow` |
  | 4 | Rainy and dry seasons · Mùa mưa và mùa khô | `core` | `four_seasons_everywhere` |
  | 5 | Twelve months · Mười hai tháng | `apply` | `months_stop_after_december` |
  | 6 | Seasons come back · Mùa lại về | `review` | `same_weather_all_year` |

- File chọn ảnh `content/images/explorer/thoi-tiet-va-cac-mua/*.json`; một icon chủ đề mới.
- Phiên chính chạy `validate`, `ids`, `images fetch`, `tts`, `build`, `check-pack`.

### Bảng soạn (đủ để viết `_topic.md` ngay; chi tiết từng ô Học, Chơi, Khởi động, ranh giới ở proposal mục 5)

**`_topic.md`:** `age_group: explorer`, `order: 5`, `strand: earth_sky`, `level: 2`, `difficulty` 2-1-2-2-2 (A trừu tượng 2, B nền 1, C misconception 2, D từ vựng 2, E kỹ năng 2; lý do ở proposal mục 1.2), `prerequisites: []`, `is_free: false`, `sensitive: false`, `ai_draft: true`, không `oak_unit_ref`. Câu hỏi lớn: "How does the weather change in a year?" · "Thời tiết thay đổi thế nào trong một năm?". Thẻ thưởng `set: weather` (app đã có khoá `collectible.set.weather`).

| Bài | Ý chính (EN · VI) | Misconception: câu sai · câu sửa · nguồn | Vật, cảnh trong bài | Ảnh mới chính (từ khoá EN) | Dùng lại |
| --- | --- | --- | --- | --- | --- |
| 1 · Thời tiết hôm nay | 1. The weather can be sunny, rainy or windy. · Trời có thể nắng, mưa hoặc có gió.<br>2. Some days are hot. Some days are cold. · Có ngày trời nóng, có ngày trời lạnh.<br>3. We dress for the weather. · Mình mặc quần áo hợp với thời tiết. | "On cloudy days, the Sun goes away." · "Trời nhiều mây là Mặt Trời đi mất." → "The Sun is still there, behind the clouds." · "Mặt Trời vẫn ở đó, sau những đám mây." Nguồn: gần ý Vosniadou và Brewer 1994 [CẦN KIỂM]; kinh nghiệm phổ thông. Phương án khác `weather_same_all_day` | Mặt Trời, mây, mưa, gió (lúa nghiêng), nón lá, áo mưa, ô, áo khoác, khăn len; thẻ cầu vồng | `crepuscular rays; sun behind clouds` · `conical hat; non la` · `raincoat` · `winter coat; knitted scarf` · `rainbow field` | Discoverer (chép mục): `be-mat-trai-dat/nui-lua` `q3_sun`, `q1_rain`; `ho-hap/vi-sao-ta-phai-tho` `w1`; `thoi-tiet-va-thien-tai/nang-mua-gio-may` `explore_cloudy` |
| 2 · Mùa xuân và mùa hè | 1. In the north, a year has four seasons. · Ở miền Bắc, một năm có bốn mùa.<br>2. Spring gets warmer. Peach trees bloom at Tet. · Mùa xuân trời ấm dần, hoa đào nở dịp Tết.<br>3. Summer is hot. Summer days are long. · Mùa hè nóng, ngày dài, trời tối muộn. | "Flowers bloom only in spring." · "Hoa chỉ nở vào mùa xuân." → "Flame tree flowers bloom in summer." · "Hoa phượng nở vào mùa hè." Nguồn: PM; tranh, bài hát gắn hoa với mùa xuân [CẦN KIỂM]. Phương án khác `summer_always_sunny` | Hoa đào, lộc non, mưa phùn (chỉ nói), hoa phượng, con ve, bánh chưng, hoa sen (lựa chọn sai); ảnh ghép bốn mùa; thẻ cây phượng | `Prunus persica blossom; peach blossom Vietnam` · `new leaves buds` · `Delonix regia` · `cicada tree bark` · `banh chung` · `[sơ đồ ghép ảnh]` bốn mùa | Áo khoác (bài 1); lá vàng (bài 3); hoa sen của *Sinh vật sống ở đâu?* (content-editor tìm key) |
| 3 · Mùa thu và mùa đông | 1. Autumn is cool. Some leaves turn yellow. · Mùa thu mát, có cây lá chuyển vàng.<br>2. Winter is cold. We wear warm clothes. · Mùa đông lạnh, mình mặc áo ấm.<br>3. Winter days are short. It gets dark early. · Mùa đông ngày ngắn, trời tối sớm. | "Winter always brings snow." · "Mùa đông lúc nào cũng có tuyết." → "Hanoi winters are cold, without snow." · "Mùa đông Hà Nội lạnh nhưng không có tuyết." Nguồn: tranh, phim, thiệp mùa đông có tuyết; mùa đông Anh của Oak `weather-in-winter` [CẦN KIỂM] | Lá vàng, lá bàng đỏ, trời thu xanh, đèn ông sao, áo khoác, khăn len, chăn bông, sương mù, phố lên đèn lúc chiều, phố mùa đông không tuyết; thẻ cây hoa sữa hoặc sương mù | `blue sky trees autumn` · `star lantern Vietnam` · `fog lake trees; Hanoi fog` · `Hanoi winter street` · `street lights dusk` · `quilt blanket` · `Alstonia scholaris` | `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song` `q4_yellow`, thẻ `almond_card` (lá bàng đỏ); áo khoác, khăn len (bài 1) |
| 4 · Mùa mưa và mùa khô | 1. In the south, there are two seasons. · Ở miền Nam, một năm có hai mùa.<br>2. Rain often comes in the afternoon. · Mùa mưa hay có mưa to vào buổi chiều.<br>3. The dry season is sunny, with little rain. · Mùa khô nắng nhiều, ít mưa. | "Every place has four seasons." · "Nơi nào cũng có bốn mùa." → "The south has rainy and dry seasons." · "Miền Nam có mùa mưa và mùa khô." Nguồn: bài hát, sách tranh "bốn mùa"; SGK dạy cả hai [CẦN KIỂM]. Phương án khác `rains_all_day` | Mưa to trên phố, mây đen, vũng nước, ruộng lúa xanh, ruộng đã gặt, đường nắng khô, bình tưới, áo mưa, ô, nón lá; thẻ content-editor chọn | `tropical downpour; heavy rain street` · `cumulonimbus; dark rain clouds` · `puddle rain` · `rice stubble field` · `sunny dry road` · `watering can` | Ruộng lúa xanh `khung-long/trai-dat-rat-lau-ve-truoc` `q2_rice` (Discoverer, chép mục); áo mưa, ô, nón lá (bài 1); ảnh ghép bốn mùa (bài 2) |
| 5 · Mười hai tháng | 1. A year has twelve months. · Một năm có mười hai tháng.<br>2. After December, January comes again. · Hết tháng Mười Hai lại đến tháng Một.<br>3. Every year has Tet and a summer holiday. · Năm nào cũng có Tết, có nghỉ hè. | "After December, the months stop." · "Hết tháng Mười Hai là hết tháng." → "After December, January comes again." · "Hết tháng Mười Hai lại đến tháng Một." Nguồn: trẻ dưới 8 tuổi khó hiểu thời gian quay vòng (Friedman) [CẦN KIỂM]. Phương án khác `year_has_four_months` | Vòng mười hai tháng; Tết (cành đào, hoa mai, bánh chưng); nghỉ hè (bãi biển, xô xẻng cát, phao bơi); khai giảng (cặp sách, trống trường); thẻ bánh chưng hoặc cành đào | `[hình vẽ]` vòng mười hai hạt, PM đồng ý · `Ochna integerrima` · `sand bucket spade; swim ring` · `school backpack` · `school drum Vietnam` | Cành đào, bánh chưng (bài 2); bãi biển vắng `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien` `q3` |
| 6 · Mùa lại về | 1. The weather changes with the seasons. · Thời tiết thay đổi theo mùa.<br>2. The seasons come back every year. · Năm nào các mùa cũng quay lại.<br>3. We dress to suit each season. · Mỗi mùa mình mặc cho hợp. | "The weather is the same all year." · "Cả năm thời tiết đều như nhau." → "The weather changes with the seasons." · "Thời tiết thay đổi theo mùa." Nguồn: mục tiêu bắt buộc Year 1 của hai unit Oak; kinh nghiệm phổ thông [CẦN KIỂM]. Phương án khác `seasons_come_once` | Ảnh ghép bốn mùa, ảnh ghép hai mùa, bộ áo (áo khoác, áo dài tay, áo cộc tay) | `long sleeve shirt; t-shirt` (không nhãn hiệu, chữ) · `[sơ đồ ghép ảnh]` hai mùa | Ảnh bài 1–5 |

**Từ vựng** (`core` · `extra`): bài 1 weather, sunny, rainy · cloudy, raincoat; bài 2 season, spring, summer · flower, cicada; bài 3 autumn, winter · cool, coat, scarf; bài 4 rainy season, dry season · puddle, shower (`dry_season` là `extra` của *Những nơi sống trên Trái Đất* bài 6, nâng lên `core`, cố ý); bài 5 month, year · calendar, holiday (tên tháng không vào `word_list`); bài 6 change, warm (đổi được nếu trùng).

**Câu `order_sequence` gợi ý** (một thứ tự đúng; mùa và tháng là vòng nên `prompt` nêu thẻ đầu): bài 3 "Spring comes first. Put them in order." (hoa đào → hoa phượng → lá vàng); bài 5 "Start at Tet. Put them in order." (Tết → nghỉ hè → khai giảng); bài 6 ba bộ áo từ ngày lạnh tới ngày nóng. Bài 1 không có (nắng, mây, mưa nhiều thứ tự). Bài 4 tuỳ content-editor.

### Ngoài phạm vi
- Vì sao có mùa, vì sao ngày dài ngắn, trục nghiêng của Trái Đất (Scientist #6).
- Lịch âm; tên tháng như câu hỏi; tháng sinh của bé; lễ tôn giáo.
- Bão, lũ, hạn hán, sét, dụng cụ đo thời tiết, "gió là không khí chuyển động", "mây là giọt nước" (Discoverer #5).
- Bài riêng cho miền Trung; chọn miền theo hồ sơ bé.
- Bản đồ, quả địa cầu.
- Bản Discoverer của chủ đề này; dạng câu mới; màn app mới; khoá bộ thẻ mới.
- Chủ đề "bầu trời ngày và đêm" của câu D3 (vẫn chờ Duy).

## Tiêu chí nghiệm thu

### Bước 0 · chốt, danh mục, tài liệu
- [x] PM viết đề xuất và ticket; sáu câu chốt 17/11 (Duy, qua phiên chính: "bật mode auto, không cần hỏi thêm"), ghi ở "Quyết định đã ghi".
- [x] **dev:** `content/syllabus.json` *(17/11: danh mục đã đổi; phiên chính kiểm: `validate content` 0 lỗi, dòng tổng "3 nhóm, 45 chủ đề, 390 bài"; `syllabus.test.ts` đã sửa, content-cli 399/399)*:
  - không còn key `seasonal-changes-autumn-and-winter`, `seasonal-changes-spring-and-summer`;
  - Explorer #5 là `new-weather-and-seasons`, tên *Weather and seasons · Thời tiết và các mùa*, `strand: earth_sky`, `level: 2`, `source.kind: new`, 6 bài đúng thứ tự và tên EN/VI ở bảng "Phạm vi", mỗi bài `oak_lessons: []`, `statutory: false`;
  - #1–#4, #6, #7 giữ số; *Vật liệu quanh em* … *Em khoẻ mạnh* đánh lại #8–#12 (bảng "Đánh số lại");
  - `topic_id`, `lesson_id` mà SK-049 (*Cơ thể của em*) ghi vào `human-body-parts` còn nguyên;
  - đếm máy: Explorer 12 chủ đề / 79 bài; cả app 45 / 390.

  Kiểm: `validate content` 0 lỗi, dòng tổng nêu "3 nhóm, 45 chủ đề, 390 bài"; `tools/content-cli/test/syllabus.test.ts` sửa trong cùng lần, `npm --prefix tools/content-cli test` xanh.
- [x] **pm** *(17/11, xong; file đã sửa ở dòng "Lượt 2" đầu ticket)*, cùng lượt danh mục: `syllabus.md`, `syllabus-lessons.md`, `syllabus-progression.md`, `prd.md`, `technical-plan.md` khớp 45 chủ đề, 390 bài, Explorer 12 / 79, 35 unit Oak và 10 chủ đề mới (danh sách chỗ sửa ở "Việc kéo theo").

### content-editor
- [ ] `_topic.md` đúng frontmatter ở "Bảng soạn"; Tiêu đề khớp danh mục; mục Nguồn ghi câu Duy 17/11 và mười slug lesson Oak với bài tương ứng (proposal mục 2.1); có các mục như `noi-song-tren-trai-dat/_topic.md`: Tên gọi, Quy ước hình, Hình dùng chung, Đúng/Sai, Khởi động, Chơi, Thẻ thưởng, An toàn, Ranh giới, Còn mở.
- [ ] Đúng 6 bài, đúng thứ tự và `stage`; tên bài EN/VI khớp `content/syllabus.json` từng chữ.
- [ ] Mỗi bài theo luật Explorer:
  - Khởi động 2–3 câu DOK 1, chỉ `single_choice`, `true_false`, câu nào cũng có `recall_from`;
  - Quiz 6 câu, DOK 1·1·1·2·2·2;
  - đúng một câu misconception ở câu 6, key ở bảng "Phạm vi" (hoặc phương án khác ở "Bảng soạn", ghi lý do trong `_topic.md`); mỗi key dùng một lần; không trùng key của các chủ đề Explorer đã soạn (kể cả *Cơ thể của em*, SK-049) và Discoverer #5;
  - chỉ `single_choice` (2–3 lựa chọn), `true_false`, `order_sequence` (3 thẻ); mỗi bài ít nhất hai dạng;
  - mỗi câu EN tối đa 8 từ; `true_false` là câu khẳng định, không `labels`.
- [ ] Câu 6 ưu tiên `true_false` đáp án Sai; `explanation_correct` là câu sửa, đứng một mình (không "Yes!", không "This is false."). Các câu `true_false` khác cân Đúng/Sai trong chủ đề; bảng Đúng/Sai ở `_topic.md`.
- [ ] Khởi động:
  - bài 1 có một câu ôn *Gọi tên và nhóm động vật* (mốc một tháng, theo `goi-ten-va-nhom-dong-vat/_topic.md:339`) và một câu ôn *Những nơi sống trên Trái Đất* (nơi nóng, nơi lạnh);
  - bài 4 có một câu ôn *Những nơi sống trên Trái Đất* bài 6 (mùa mưa, mùa khô ở xavan);
  - bài 6 ôn trộn bài 1–5 và có một câu ôn chủ đề cách khoảng một tháng.
- [ ] Miền: bài 2, 3 chỉ nói miền Bắc; bài 4 chỉ nói miền Nam; grep chữ bé nghe ra 0 câu "cả nước", "Việt Nam có bốn mùa", "Việt Nam có hai mùa", "Vietnam has four seasons".
- [ ] Bài 5: không câu Khởi động, Quiz nào hỏi tên tháng hay tháng thứ mấy; tên tháng chỉ ở ví dụ ô Học; `word_list` không có tên tháng; grep chữ bé nghe ra 0 kết quả "âm lịch", "lịch âm", "lunar", "tháng Giêng", "birthday", "sinh nhật", "Christmas", "Giáng sinh".
- [ ] Mỗi `order_sequence` có đúng một thứ tự đúng; câu về mùa hoặc mốc trong năm nêu thẻ đầu trong `prompt`; thẻ trong file không nằm sẵn đúng thứ tự.
- [ ] Từ vựng 4–5 từ mỗi bài, 2–3 `core`, khớp `word_list.term_keys`; `dry_season` ở bài 4 có dòng `>` ghi trùng có chủ ý với *Những nơi sống trên Trái Đất* bài 6.
- [ ] SK-044: mọi lựa chọn sai có `feedback` một câu, tối đa 8 từ EN, nói về chính vật bé chọn; `true_false` có `feedback_true` hoặc `feedback_false` đúng phía.
- [ ] SK-047: `hint`, `feedback`, giải thích không nhắc vị trí thẻ; `hint` không gần như nói đáp án.
- [ ] Ranh giới, grep chữ bé nghe ra 0 kết quả: "bão", "lũ", "hạn hán", "sét", "storm", "flood", "drought", "lightning", "nhiệt kế", "thermometer", "gần Mặt Trời", "closer to the Sun", "nghiêng", "tilt", "khí hậu", "climate", "mùa hạ". Không câu nào bảo bé nhìn Mặt Trời. Không ảnh tuyết làm mùa đông Việt Nam, không ảnh đất nứt làm mùa khô (đọc `brief`).
- [ ] Mọi sự thật chưa chắc có dòng `> [CẦN KIỂM]` ngay dưới; danh sách chép vào mục "Câu hỏi còn mở" của ticket.
- [ ] "Ghi chú cho hoạ sĩ" mỗi bài liệt kê ảnh mới, ảnh dùng lại, ảnh khó.
- [ ] Ghi chú cũ trỏ tới hai chủ đề mùa sửa thành chủ đề mới #5 (danh sách ở "Việc kéo theo"); không đổi chữ bé nghe ở các chủ đề đó.

### designer
- [ ] Mọi chỗ có hình (câu hỏi, lựa chọn, thẻ `order_sequence`, món Chơi, ô Học, từ, thẻ thưởng) có mục trong file chọn ảnh; 0 chỗ trống.
- [ ] Ảnh nguồn ngoài chỉ CC0, PD, PDM hoặc CC BY có ghi công; 0 BY-SA, NC, ND hay không rõ giấy phép; đã mở trang gốc kiểm. `images fetch content/images/explorer/thoi-tiet-va-cac-mua` 0 lỗi, 0 cảnh báo tỉ lệ.
- [ ] Không chữ, chữ số, logo, nhãn hiệu trong hình; người ở xa, không nhận ra mặt; không trẻ em nhìn rõ mặt.
- [ ] Ảnh mang tên nơi (Hà Nội, Sa Pa…) khớp trang gốc; không khớp thì báo content-editor bỏ tên nơi ở `brief`, `alt`.
- [ ] Hình tự vẽ chỉ có vòng mười hai tháng (PM đồng ý 17/11): mười hai hạt tròn cùng màu nối thành vòng, không chữ số. Chỗ khác cần tự vẽ thì PM ghi đồng ý vào ticket trước. Hình ghép bốn mùa, hai mùa ghi mục `composed` đủ ghi công từng phần.
- [ ] Icon `design/icons/topics/new-weather-and-seasons.svg`, khác rõ `new-weather` (mây giông, sét, mưa) của Discoverer #5; thêm vào canvas `Topic-Icons` và `design/play-ui/journey-roadmap-spec.md` mục 8 (Explorer 12, tổng 45 icon); bỏ hai dòng `seasonal-changes-*` khỏi danh sách.

### ios-dev (sau khi dev đổi danh mục)
- [ ] Chạy `apps/ios/scripts/import-topic-icons.sh`: có `Topic-new-weather-and-seasons`, không còn hai imageset `Topic-seasonal-changes-*`; 45 icon.
- [ ] Sửa test ghi cứng số đếm (danh sách ở "Việc kéo theo"); `ContentModelTests`, `ContentKitTests`, `ScienceKidsTests` xanh trên simulator iPhone 16, một máy, một lần (không iPhone 16 Pro).
- [ ] Chạy thử: bản đồ Explorer có 5 chặng; Chặng 3 có #4 và #5 với icon mới; #5 hiện đủ 6 bài, mỗi bài báo "chưa có nội dung" trước khi soạn.
- [ ] Không thêm khoá thẻ (`collectible.set.weather` đã có).

### tester
- [ ] Danh mục và test đếm: 45 / 390, Explorer 12 / 79, `oakYear` Explorer `[1, 2, 2, nil, nil, 1, 1, 1, 2, 2, 2, 2]`, 5 chặng.
- [ ] Rà chữ 6 bài theo khuôn SK-041, SK-046, SK-048: 0 mục chặn; mục "nên sửa" đã sửa hoặc có quyết định của PM.
- [ ] Đọc mọi dòng `[CẦN KIỂM]` ở mức hợp lý với trẻ 5–7 tuổi (không thay người chuyên môn).

### phiên chính
- [ ] `validate content/explorer/thoi-tiet-va-cac-mua` 0 lỗi; `ids` chạy theo thứ tự `_topic.md`, rồi bài 1 tới bài 6.
- [ ] `images fetch` 0 lỗi; `tts` EN và VI (ghi số clip VI bị đánh dấu chờ Duy nghe; nghe thử "Tet", "tháng Tư", "tháng Mười Một"); `build`; `check-pack` OK.
- [ ] Chơi trọn một bài Khởi động → Học → Chơi → Quiz → Tổng kết → Thưởng trên simulator iPhone 16, một máy, một lần.

### pm (đóng ticket)
- [ ] Người chuyên môn đọc hết các dòng `[CẦN KIỂM]` trước khi phát hành; ghi người đọc và ngày.
- [ ] Tài liệu và `docs/backlog/README.md` khớp `content/syllabus.json` và `syllabus.test.ts`; `syllabus.md` mục 8 ý 2 (tên hai chủ đề mùa) ghi là hết hiệu lực.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi

### Phụ thuộc
- dev đổi `content/syllabus.json` trước khi phiên chính chạy `validate`, `ids` lần đầu cho chủ đề mới (`_topic.md` `order: 5` phải khớp danh mục). content-editor soạn song song được.
- **SK-049 (*Cơ thể của em*, Explorer #6) đang soạn song song.** Chủ đề đó giữ số #6 trong danh mục mới, nên `order: 6` của nó không đổi. Nhưng phiên đó sẽ ghi `topic_id`, `lesson_id` vào `human-body-parts` trong `content/syllabus.json` và có thể sửa cùng các test iOS ở dưới: dev và ios-dev làm trên bản mới nhất, không ghi đè; nên gộp việc sửa test của hai ticket vào một lượt ios-dev. SK-049 ghi "vẫn 46 chủ đề, 394 bài": đúng tới khi SK-050 đổi danh mục.
- ios-dev sửa test sau khi danh mục đổi; designer vẽ icon trước khi ios-dev chạy script icon.
- Cây làm việc đang có thay đổi chưa commit của phiên khác (`tools/content-cli/image-slots.json`, `tools/content-cli/test/aspect.test.ts`, bốn file `content/images/explorer/…`, SK-043). dev không đụng các file đó trong lượt này.
- SK-040, SK-044, SK-047 (app chạy bài Explorer, phản hồi, xáo lựa chọn, Tổng kết): đã có.
- Mạng tới Commons, Openverse (từng trả 429: giãn nhịp, một tiến trình).

### Quyết định đã ghi
- **Duy 17/11 (yêu cầu):** "chủ đề thời tiết và sự chuyển đổi giữa các mùa, rồi các tháng trong năm thì gôm chung lại thành 1 topic kiểu generic. không cần quá phụ thuộc vào oak."
- **Duy 17/11 (lời Duy do phiên chính chuyển lại): "bật mode auto, không cần hỏi thêm" → theo khuyến nghị PM** cho sáu câu dưới đây:
  1. **A** · Tên *Weather and seasons · Thời tiết và các mùa*; key `new-weather-and-seasons`; slug `thoi-tiet-va-cac-mua`.
  2. **A** · Explorer #5, ngay sau *Những nơi sống trên Trái Đất*; bản đồ vẫn 5 chặng.
  3. **A** · 6 bài (bảng "Phạm vi").
  4. **a** · Dạy cả hai miền: bài 2–3 miền Bắc (bốn mùa), bài 4 miền Nam (mùa mưa, mùa khô); không bài riêng miền Trung.
  5. **a** · Chỉ dương lịch; Tết là một mốc; tên tháng chỉ nghe, không hỏi.
  6. **a** · Soạn ngay; không chen việc pilot Discoverer.
- **PM 17/11, theo câu Duy (không hỏi):**
  - Bỏ hẳn #5, #8 khỏi danh mục. Hai chủ đề chưa có bài, `topic_id`, `lesson_id`, ảnh hay audio, nên không mất công. Mười slug Oak ghi ở `_topic.md` mục Nguồn và `syllabus-lessons.md`.
  - Lệch Oak (proposal mục 2.2): bỏ hai unit Oak Year 1; không theo 1 lesson = 1 bài; không theo thứ tự năm học Anh; bỏ bài riêng độ dài ngày và thời tiết từng mùa (còn một ý trong bài 2, 3); bỏ dấu hiệu chỉ đúng ở Anh; thêm mùa mưa, mùa khô, mười hai tháng, bài tổng kết. Luật "theo đúng Oak, lệch thì hỏi" vẫn giữ cho các chủ đề khác.
  - `source.kind: new` (schema buộc: một chủ đề Oak chỉ có một unit), mỗi bài `oak_lessons: []`, `statutory: false`.
  - Không đọc lại trang mười lesson Oak trước khi soạn (Duy: không bám Oak). Sáu key misconception do PM đề xuất; content-editor được đổi sang phương án khác, có lý do.
- **PM 17/11 (chi tiết, Duy đổi được):**
  - Mức 2 (2-1-2-2-2 = 9), mạch Trái Đất & bầu trời (`earth_sky`), `prerequisites: []`. Lệch quy tắc "Mức không giảm" (Mức 2 sau ba chủ đề Mức 3), cùng chỗ lệch đã chấp nhận 14/11, 16/11.
  - Lệch luật 9/11 "chủ đề mới đứng đầu", như #4.
  - Thẻ thưởng `set: weather` (dùng chung với Discoverer #5).
  - Không dạy vì sao có mùa, ngày dài ngắn (Scientist #6).
  - Chữ bé nghe dùng "mùa hè", không "mùa hạ"; EN chính tả Anh (autumn).
  - Nói nơi chốn bằng lời ("miền Bắc, như Hà Nội"), không bản đồ.
  - Không bảng tháng theo mùa; chỉ gắn Tết với mùa xuân, nghỉ hè với mùa hè.
  - Hình tự vẽ được duyệt: vòng mười hai tháng (không có ảnh thật cho ý này).
  - Câu D4 của `docs/syllabus-review-2026-11-13.md` (PM khi đó đề xuất không gộp) được trả lời bằng câu Duy 17/11; câu `syllabus.md` mục 8 ý 2 (tên VI hai chủ đề mùa) hết hiệu lực.

- **Phiên chính 18/11 (chế độ auto Duy bật 17/11, sau lượt ảnh):**
  - Bài 4 q4 đổi từ `order_sequence` sang phương án `single_choice` đã ghi sẵn: không tìm được ba ảnh mây đen, mưa, vũng nước cùng một cảnh hợp luật.
  - Thẻ thưởng đèn ông sao (bài 6) là hình giấy cắt tự vẽ: ảnh thật hợp lệ duy nhất có nhiều trẻ rõ mặt, crop một chiếc đèn còn 256 px, mờ. Ngoại lệ thứ hai của "Hình tự vẽ" sau vòng mười hai tháng.
  - Nón lá `w1_hat` (dùng lại của #1): tạm giữ ảnh nón lưu niệm; tìm ảnh nón lá thật là việc tiếp theo, không chặn.
  - Không dùng `q4_yellow` của *Sinh vật sống ở đâu?* (ảnh gốc có tuyết); chủ đề này có ảnh lá vàng mới, mục gốc bài 3 `q4.q4_yellow`.
  - Xoài thẻ thưởng là quả còn xanh: chữ bé nghe không nói vỏ chín chuyển vàng.

### Câu hỏi 1–6 (đã chốt 17/11; giữ làm hồ sơ)

| # | Câu hỏi | Lựa chọn | Đề xuất PM | Duy 17/11 |
| --- | --- | --- | --- | --- |
| 1 | Tên chủ đề | **A** · Weather and seasons · Thời tiết và các mùa. **B** · Seasons and months · Mùa và tháng trong năm. **C** · Weather through the year · Thời tiết quanh năm. **D** · Our year: weather, seasons, months · Một năm của em: thời tiết, mùa, tháng | **A.** Ngắn, vừa thẻ bản đồ; đúng hai ý lớn Duy nêu, tháng là một bài bên trong. Chung chữ "thời tiết" với Discoverer #5 là xoắn ốc có chủ ý; key khác (`new-weather-and-seasons` và `new-weather`). D đủ ý nhưng dài ba dòng trên thẻ Học tiếp | A (auto) |
| 2 | Vị trí trong Explorer | **A** · #5, ngay sau *Những nơi sống trên Trái Đất*: 5 chặng, Chặng 3 hai chủ đề mới. **B** · #1, theo luật 9/11: 6 chặng; chủ đề đầu thành "Sắp có" tới khi soạn xong. **C** · Sau *Cây quanh em*: 7 chặng, cắt đôi chặng Year 1. **D** · Sau *Vật liệu quanh em*: 6 chặng | **A.** Nối thẳng #4 (nóng, lạnh, ướt, khô; xavan có mùa mưa, mùa khô); giữ chỗ sớm của unit mùa cũ; bản đồ không thêm chặng, không đổi code; chỉ #9–#13 cũ đổi số | A (auto) |
| 3 | Số bài | **A** · 6: thời tiết; xuân và hè; thu và đông; mùa mưa và mùa khô; mười hai tháng; tổng kết. Explorer 12 / 79, cả app 45 / 390. **B** · 5: gộp bốn mùa miền Bắc vào một bài (xuân, thu thành từ đọc thêm). 12 / 78; 45 / 389. **C** · 4: như B, bỏ bài tổng kết. 12 / 77; 45 / 388. **D** · 7: như A, thêm bài "Ngày dài, ngày ngắn" như Oak. 12 / 80; 45 / 391 | **A.** Bốn tên mùa cộng "season" là năm từ mới; tách hai bài thì mỗi bài giữ 2–3 từ `core` (syllabus-progression mục 8) và mỗi mùa có ô Học riêng. Vẫn ít hơn 10 bài cũ. Độ dài ngày còn một ý trong bài 2, 3 | A (auto) |
| 4 | Mùa theo miền | **a** · Cả hai: miền Bắc bốn mùa (2 bài), miền Nam mùa mưa, mùa khô (1 bài); miền Trung không bài riêng. **b** · Chỉ bốn mùa; mùa mưa, mùa khô là một ô Học. **c** · Chỉ mùa mưa, mùa khô; bốn mùa là một ô Học. **d** · Phụ huynh chọn miền, app hiện bài theo miền | **a.** Đúng với bé cả hai miền; đặt hai cách chia cạnh nhau là cách sửa "nơi nào cũng bốn mùa". d phải hỏi nơi ở của bé (thêm dữ liệu trẻ) và cần code mới. b, c sai với nửa số bé | a (auto) |
| 5 | Tháng: dương lịch hay kèm âm lịch, Tết | **a** · Chỉ dương lịch; Tết là một mốc ("thường vào tháng Một hoặc tháng Hai"); tên tháng chỉ nghe. **b** · Dương lịch, thêm một ô Học "lịch âm" (ông bà xem lịch âm; Tết, Trung thu theo lịch âm), không hỏi. **c** · Dạy cả hai lịch, có câu hỏi. **d** · Không dạy tên tháng, chỉ "một năm có mười hai tháng" và các mốc | **a.** Bé 5–7 tuổi chưa vững thứ tự mười hai tháng [CẦN KIỂM: Friedman]; thêm lịch thứ hai dễ lẫn. Tết vẫn có mặt như mốc văn hoá. Lịch âm gắn với Mặt Trăng, để dành Scientist #6 hoặc chủ đề bầu trời của câu D3 | a (auto) |
| 6 | Khi nào soạn | **a** · Soạn ngay, song song phần còn lại của SK-048. **b** · Sau khi SK-048 đóng (người chuyên môn đọc xong `[CẦN KIỂM]`). **c** · Sau GĐ 0 | **a.** Pilot Discoverer đã soạn xong, đang chờ duyệt; chủ đề dùng lại nhiều ảnh thời tiết đã có; Duy đã cho làm ngay SK-048 | a (auto) |

### Câu hỏi còn mở (chỉ cho người chuyên môn; content-editor bổ sung khi soạn)
- **Danh sách đầy đủ 46 ý `[CẦN KIỂM]` sau khi soạn** (66 dòng trong 6 bài và `_topic.md`) nằm ở mục "## content-editor 17/11 · sửa sau rà chữ" cuối ticket, gom theo mùa, dấu hiệu mùa, mốc trong năm, tên gọi, nguồn, khác; người chuyên môn đọc theo danh sách đó. Các ý dưới đây là bản PM viết trước khi soạn.
- **Mùa ở Việt Nam:** miền Bắc có bốn mùa; miền Nam có mùa mưa (khoảng tháng Năm tới tháng Mười Một) và mùa khô; mùa mưa miền Trung (khoảng tháng Chín tới tháng Mười Hai); mưa mùa mưa miền Nam hay đến buổi chiều; SGK Tự nhiên và Xã hội lớp 2 dạy các mùa thế nào (CT GDPT 2018).
- **Dấu hiệu mùa:** hoa đào nở dịp Tết ở miền Bắc, hoa mai ở miền Nam; hoa phượng nở mùa hè ở cả hai miền; tiếng ve mùa hè; hoa sữa nở mùa thu Hà Nội; lá bàng đỏ rồi rụng vào mùa đông; mưa phùn, nồm cuối xuân; Tết rơi vào tháng Một hoặc tháng Hai dương lịch.
- **Mùa đông và tuyết:** mùa đông Hà Nội không có tuyết; tuyết, băng giá chỉ thỉnh thoảng ở núi cao phía Bắc (Sa Pa, Mẫu Sơn).
- **Độ dài ngày:** ở Hà Nội mùa đông trời tối sớm, mùa hè tối muộn rõ rệt; ở miền Nam đổi ít.
- **Tháng:** viết hoa tên tháng ("tháng Một" hay "tháng một"); dùng "tháng Một" cho dương lịch; khai giảng vào tháng Chín; nghỉ hè khoảng tháng Sáu tới tháng Tám.
- **Tên gọi EN:** "flame tree" hay "royal poinciana" (phượng); tên EN hoa mai; "Tet" trong chuỗi EN.
- **Nguồn misconception:** Vosniadou và Brewer (1994) về mây, Mặt Trời và ngày đêm; Friedman về hiểu biết tháng, mùa theo vòng ở trẻ; nguyên văn mục tiêu bắt buộc Science Year 1 của chương trình Anh; tháng trong năm ở Toán Year 1 (Anh) và Toán lớp 1–2 (Việt Nam).
- **Oak (không chặn):** dấu hiệu, misconception và việc đo thời tiết trong mười lesson Oak Year 1; chỉ để ghi đúng chỗ lệch ở proposal mục 2.2.

### Việc kéo theo

**Số đếm** (`content/syllabus.json`, đếm 17/11):

| | Chủ đề | Bài |
| --- | --- | --- |
| Explorer hiện tại | 13 | 83 |
| Bỏ #5, #8 | −2 | −10 |
| Thêm *Thời tiết và các mùa* | +1 | +6 |
| **Explorer sau khi đổi** | **12** (10 unit Oak, 2 mới) | **79** |
| Discoverer | 17 | 155 |
| Scientist | 16 | 156 |
| **Cả app sau khi đổi** | **45** (35 unit Oak, 10 mới: Explorer 2, Discoverer 5, Scientist 3) | **390** |

Explorer 79 bài ≈ 33 tuần (3 bài/tuần cộng tuần ôn). Icon chủ đề 46 → 45.

**Đánh số lại Explorer:**

| Số mới | Chủ đề | Số cũ | Năm Oak |
| --- | --- | --- | --- |
| 1 | Gọi tên và nhóm động vật | 1 | Y1 |
| 2 | Sinh vật sống ở đâu? | 2 | Y2 |
| 3 | Chuỗi thức ăn | 3 | Y2 |
| 4 | Những nơi sống trên Trái Đất | 4 | mới |
| 5 | **Thời tiết và các mùa** | — (thay 5 và 8) | mới |
| 6 | Cơ thể của em (SK-049 đang soạn) | 6 | Y1 |
| 7 | Cây quanh em | 7 | Y1 |
| 8 | Vật liệu quanh em | 9 | Y1 |
| 9 | Vật liệu dùng làm gì? | 10 | Y2 |
| 10 | Trồng cây | 11 | Y2 |
| 11 | Sự sống mới | 12 | Y2 |
| 12 | Em khoẻ mạnh | 13 | Y2 |

Không chủ đề đã soạn hay đang soạn nào đổi `order` (#1–#4, #6 giữ số).

**Chặng bản đồ Explorer sau khi đổi** (vẫn 5): Chặng 1 #1 (Y1) · Chặng 2 #2–#3 (Y2) · Chặng 3 #4–#5 (mới) · Chặng 4 #6–#8 (Y1) · Chặng 5 #9–#12 (Y2). `stopRange` `[0..<1, 1..<3, 3..<5, 5..<8, 8..<12]`, `oakYear` theo chặng `[1, 2, nil, 1, 2]`; bản đồ có 5 cột mốc + 12 chặng + 1 cờ = 18 mục. Duy chốt 16/11 "Giữ chặng riêng" cho #4 vẫn đúng: Chặng 3 chỉ có chủ đề mới.

- **dev:**
  - `content/syllabus.json`: bỏ khối `seasonal-changes-autumn-and-winter` (dòng 393–465 lúc PM đọc 17/11) và `seasonal-changes-spring-and-summer` (dòng 645–717); thêm `new-weather-and-seasons` ở #5 theo bảng "Phạm vi"; đánh lại `number` theo bảng trên. Giữ `syllabus_version` như SK-048 đã làm. Đọc lại file trước khi sửa (SK-049 có thể đã ghi id cho `human-body-parts`).
  - `tools/content-cli/test/syllabus.test.ts` dòng 95, 101, 109: "46 chủ đề, 394 bài" → "45 chủ đề, 390 bài", sửa cùng lần.
  - `content/.build/syllabus-vi.tsv`, `syllabus-vi-worklist.tsv` còn mười dòng hai chủ đề cũ: sinh lại nếu có script, không thì để (thư mục build).
  - Không đụng `tools/content-cli/image-slots.json`, `test/aspect.test.ts` (phiên khác đang sửa, chưa commit).
- **ios-dev:**
  - `apps/ios/Packages/SKKit/Tests/ContentModelTests/SyllabusTests.swift`: dòng 27 `[13, 17, 16]` → `[12, 17, 16]`; dòng 28 `[83, 155, 156]` → `[79, 155, 156]`; dòng 54 `oakYear` Explorer → `[1, 2, 2, nil, nil, 1, 1, 1, 2, 2, 2, 2]`; dòng 55–57 key #3–#5 → `introduction-to-food-chains`, `new-habitats-around-the-world`, `new-weather-and-seasons`.
  - `ContentKitTests/JourneyTests.swift`: dòng 34 Explorer 13 → 12; dòng 37 tổng 394 → 390.
  - `ContentKitTests/JourneySegmentTests.swift` dòng 25–26: `stopRange` → `[0..<1, 1..<3, 3..<5, 5..<8, 8..<12]`, `oakYear` giữ `[1, 2, nil, 1, 2]`; sửa chú thích.
  - `ScienceKidsTests/JourneyMapAppTests.swift` dòng 41 (1 + 2 + 2 + 3 + 4), dòng 74–75 (`5 + 12 + 1`).
  - `OnboardingTests`, `OnboardingUITests`, README: grep số 13, 83, 394, 46 (SK-048 đã sửa các file này).
  - Asset: bỏ `Topic-seasonal-changes-autumn-and-winter.imageset`, `Topic-seasonal-changes-spring-and-summer.imageset`; thêm `Topic-new-weather-and-seasons` bằng `apps/ios/scripts/import-topic-icons.sh`.
  - Gộp với việc sửa test của SK-049 nếu cùng lúc (một lượt simulator).
- **designer:**
  - icon `design/icons/topics/new-weather-and-seasons.svg` (gợi ý: nắng sau mây và một chiếc lá vàng, hay cành đào; khác `new-weather`); canvas `design/play-ui/project/Topic-Icons.dc.html`; `design/play-ui/journey-roadmap-spec.md` mục 8 (Explorer 12, tổng 45; bỏ hai dòng `seasonal-changes-*`) và mục 2 ý 3 (ví dụ chặng Explorer đang ghi "1–6 (Year 1), 7–12 (Year 2)", đã cũ);
  - hai icon cũ ở `design/icons/topics/`: chuyển sang thư mục lưu trữ hoặc xoá (designer chọn);
  - ảnh theo brief; vòng mười hai tháng tự vẽ; hình ghép bốn mùa, hai mùa.
- **content-editor:**
  - soạn `_topic.md` và 6 bài theo bảng "Phạm vi", "Bảng soạn" và proposal mục 3–7;
  - sửa ghi chú (dòng `>` hoặc mục Ghi chú của `_topic.md`, không phải chữ bé nghe) đang trỏ tới hai chủ đề mùa cũ: `content/explorer/goi-ten-va-nhom-dong-vat/_topic.md:339`; `content/explorer/sinh-vat-song-o-dau/_topic.md:350`, `03-dang-song-da-chet-chua-tung-song.md:400`; `content/explorer/noi-song-tren-trai-dat/_topic.md:194, 713`, `02-nam-cuc.md:23`, `06-dong-co-xavan.md:33, 93, 611`; `content/discoverer/thoi-tiet-va-thien-tai/_topic.md:308`. Sửa ghi chú thì không phải chạy lại `tts`.
  - Không cần sửa `content/TEMPLATE.md`, `content/rules.json`.
- **pm** (cùng lượt dev đổi danh mục; lượt 17/11 chỉ được sửa `docs/`) *(đã làm 17/11, lượt 2)*:
  - `syllabus.md`: dòng trạng thái; mục 0 (số đếm từ 17/11: 45 chủ đề, 35 unit Oak, 10 chủ đề mới, 390 bài); mục 1 (Explorer 12 chủ đề, 2 mới, 79 bài); mục 2 (luật 1 "giữ 35/38 unit"; dòng "Bốn mùa, Thời tiết" của bảng sách bách khoa; ngoại lệ vị trí thêm #5); mục 3 (bảng Explorer theo bảng "Đánh số lại", tổng 79); mục 7 (79 bài, ~33 tuần); mục 8 ý 2 hết hiệu lực; mục 9.
  - `syllabus-lessons.md`: bỏ mục Explorer #5, #8 cũ; thêm mục #5 mới (6 bài EN/VI, mười slug Oak đã gộp); đánh lại số các mục sau.
  - `syllabus-progression.md`: dòng trạng thái; mục 4 bảng mạch ("Mùa ×2 (6)" → "Thời tiết và các mùa (9; mới 17/11)"); ghi chú mục 5.1; mục 11 dòng "Mùa".
  - `prd.md`, `technical-plan.md`: dòng hiện trạng 45 chủ đề, 390 bài, Explorer 12 / 79, 10 chủ đề mới; không viết lại dòng lịch sử có ngày.
  - SK-049: thêm một dòng ghi chú 17/11 rằng số đếm "46 / 394" đổi theo SK-050 (khi phiên SK-049 xong, để khỏi sửa chồng).
  - `docs/backlog/README.md`: đổi trạng thái theo ticket.
- **tester:** rà chữ theo khuôn SK-041, SK-046, SK-048; kiểm danh mục và test đếm.

### Dòng `docs/backlog/README.md`
Đã thêm 17/11, ngay dưới dòng SK-048.

## ios-dev 17/11

- **Icon:** chạy `apps/ios/scripts/import-topic-icons.sh` (45 SVG → 45 imageset), có `Topic-new-weather-and-seasons`; xoá tay `Topic-seasonal-changes-autumn-and-winter.imageset`, `Topic-seasonal-changes-spring-and-summer.imageset`. `Assets.xcassets/Art/Topics` còn đúng 45 imageset `Topic-*`. Không thêm khoá thẻ (`collectible.set.weather` đã có).
- **Test sửa số đếm** (đọc bản mới nhất, không đụng phần SK-049):
  - `Packages/SKKit/Tests/ContentModelTests/SyllabusTests.swift`: `[12, 17, 16]`, `[79, 155, 156]`, `oakYear` Explorer `[1, 2, 2, nil, nil, 1, 1, 1, 2, 2, 2, 2]`, key #3–#5 `introduction-to-food-chains`, `new-habitats-around-the-world`, `new-weather-and-seasons`.
  - `ContentKitTests/JourneyTests.swift`: Explorer 12, tổng 390.
  - `ContentKitTests/JourneySegmentTests.swift`: `stopRange` `[0..<1, 1..<3, 3..<5, 5..<8, 8..<12]`, `oakYear` giữ `[1, 2, nil, 1, 2]`, chú thích.
  - `ScienceKidsTests/JourneyMapAppTests.swift`: 45 icon/chủ đề; Explorer `5 + 12 + 1`, chú thích (1 + 2 + 2 + 3 + 4).
  - `ScienceKidsTests/OnboardingTests.swift`: Explorer 12; `[12, 17, 16]`.
  - `apps/ios/README.md`: 45 icon.
  - `OnboardingUITests`: không có số đếm hay key cũ (chỉ `home.topic.new-weather` của Discoverer), không sửa. `Art.swift` và mã nguồn không còn key `seasonal-changes`.
- **Test** (iPhone 16, một máy, một lần; `-only-testing` ba bundle): `ContentModelTests` 28/28, `ContentKitTests` 51/51, `ScienceKidsTests` 91/91 pass, `** TEST SUCCEEDED **`. Không chạy UI test.
- **Chưa làm:** chạy thử bản đồ Explorer trên máy (phiên chính làm sau khi có gói nội dung).

## Rà chữ (tester) 17/11

Phạm vi: `content/explorer/thoi-tiet-va-cac-mua/_topic.md` và sáu bài `01-thoi-tiet-hom-nay.md` … `06-mua-lai-ve.md`. Đối chiếu ticket này (mục content-editor), `docs/explorer-weather-seasons-proposal.md`, `content/TEMPLATE.md` (bảy luật Explorer, SK-044, SK-047), `content/rules.json` (`explorer.authoring`), `content/syllabus.json`, các chủ đề Explorer đã soạn và Discoverer #5. Khuôn rà theo SK-041, SK-046, SK-048. Không sửa file bài, không chạy lệnh ghi file, không dùng simulator.

Lệnh đã chạy (chỉ đọc): `node tools/content-cli/src/cli.ts validate content/explorer/thoi-tiet-va-cac-mua` → **7 file (1 topic, 6 bài) · nhóm explorer · 0 lỗi · 8 cảnh báo**: 7 `md_needs_check` (67 dòng `[CẦN KIỂM]`: 22 ở `_topic.md`, 5 · 8 · 10 · 8 · 9 · 5 ở sáu bài) và **1 `age_words_en`** (`04-mua-mua-va-mua-kho.md:494`, xem N1).

Script kiểm cấu trúc (không phải test sản phẩm) ở `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/8e2fcca1-fbe3-4313-a419-e683eef8228e/scratchpad/sk050/`, chạy bằng `python3 -I`: bộ script của SK-048 đổi thư mục (`parse.py`, `check_struct.py`, `check_fb.py`, `check_hint.py`, `check_tf.py`, `t_words.py`, `t_img.py`) cộng script mới `fb2.py` (SK-044 theo phía Đúng/Sai, feedback nhiều câu, feedback gọi tên đáp án), `hint2.py` (hint trùng nhãn đáp án, nhắc vị trí thẻ), `t_tab2.py` + `t_tf2.py` (đối chiếu từng prompt và từng dòng bảng Đúng/Sai của `_topic.md`), `mis.py` (q6 khớp `statement`/`correction`), `usecmp.py` + `ext.py` (cột "Dùng ở" của hai bảng hình), `play.py`, `req.py`.

**Tổng kết: chặn 0 · nên sửa 7 · gợi ý 14.**

### Đạt (kiểm bằng máy, không có lỗi)

- **Cấu trúc:** sáu bài, mỗi bài Quiz 6 câu DOK 1·1·1·2·2·2, câu 1 DOK 1, đúng một câu misconception ở q6. Khởi động 2 câu (bài 1–5) và 3 câu (bài 6), DOK 1, **câu nào cũng có `recall_from.kind: lesson`**; `single_choice` ở Khởi động luôn hai lựa chọn. Bài 1, 2 hai format; bài 3–6 ba format (`order_sequence` ở q4, đúng ba thẻ). `single_choice` 2–3 lựa chọn, `true_false` không `labels`. Học: bốn ô + `word_list` mọi bài; Chơi: `capacity: 3`, ba nhóm `required`, một nhóm `limit` màu `do_son`, kệ 7–8 món, không trùng màu, đủ `messages.missing.*` cho từng nhóm.
- **Đối chiếu `_topic.md` với bài:** **toàn bộ 66 `prompt.en` và 66 `prompt.vi`** của Khởi động và Quiz có mặt từng chữ trong `_topic.md` (0 lệch). Bảng Đáp án Đúng/Sai: **22/22 dòng khớp cả câu lẫn đáp án**, đếm máy 9 Đúng · 13 Sai (đúng con số ở `_topic.md:483`); bỏ sáu câu q6 còn 9 Đúng · 7 Sai; bài nào cũng có cả hai phía. Sáu câu q6 có `prompt` và `explanation_correct` **trùng từng chữ** `statement`/`correction` của mục Misconceptions.
- **Misconception:** sáu key đúng bảng "Phạm vi", mỗi key một lần, không key nào gắn ở Khởi động; **không trùng key nào trong cả `content/`** (kiểm cả bốn chủ đề Explorer đã soạn, *Cơ thể của em* và Discoverer #5).
- **SK-044:** không lựa chọn sai nào thiếu `feedback`, không lựa chọn đúng nào có `feedback`, không cặp `.en/.vi` nào thiếu một nửa. 22 câu `true_false` viết đúng phía bé chọn nhầm (`answer: false` → `feedback_true`, và ngược lại), **0 câu sai phía**. **Không `feedback` nào gọi tên đáp án đúng** của chính câu đó. Chỉ một `feedback` hai câu (N2).
- **SK-047:** không `hint`, `feedback`, `explanation` nào nhắc vị trí thẻ (quét "first/second/left/right/top/last", "thẻ đầu", "bên trái", "đầu tiên", "cuối cùng"; một chỗ máy bắt là "first" chỉ thời gian ở `03:95`). Sáu `explanation_correct` của q6 đứng một mình được (không "Yes!", không "This is false."), cũng vậy ở bốn câu Khởi động đáp án Sai. Một `hint` nói thẳng chữ đáp án (N3).
- **`true_false`:** 22 câu đều là câu khẳng định, 0 chữ phủ định, 0 `labels`, câu nào cũng có `image` cấp câu; `explanation_wrong` đúng khuôn "This is false." · "Câu này sai." / "This is true." · "Câu này đúng.".
- **Số từ và chữ:** đếm theo từng câu, mọi chuỗi bé nghe chỉ có **một câu EN quá tám từ** (N1). Chuỗi `.en` không có dấu tiếng Việt; chuỗi `.vi` không có chữ số, ký hiệu; không câu VI nào quá hai mươi từ; 0 chuỗi lẻ (có `.en` thiếu `.vi` hoặc ngược lại), 0 chuỗi rỗng.
- **Hình:** 0 chỗ có hình mà thiếu `image.brief`, `image.alt.en`, `image.alt.vi` (lựa chọn, thẻ `order_sequence`, món kệ, ô Học, câu `true_false`, từ vựng, thẻ thưởng). **184 chỗ "Dùng lại hình": mọi key có thật** trong bài nguồn. Ba chỗ `alt` khác gốc đều là "alt riêng" đã khai ở `_topic.md` (`explore_ice` `01:63`, `explore_dry` `04:86`, `w1_buffalo` `06:110`); chỗ thứ tư chưa khai là `tray_pillow` (N4). Cột "Dùng ở" của bảng Hình dùng chung và bảng Hình của chủ đề khác khớp chỗ dùng thật, trừ hai ô cũ (g9). Đếm ảnh mới từng bài khớp `_topic.md:378` (8 · 5 · 8 · 6 · 6 · 2 = 35, một hình vẽ, ba hình ghép, bốn mục chép từ Discoverer).
- **`recall_from`:** mười một bài đích đều có thật (mở từng file nguồn); nội dung ôn có thật ở bài đó — `bac-cuc` ý chính một "The Arctic is icy and very cold." và ô `explore_ice`; `chim-va-bo-sat` `tray_penguin`; `noi-song-cua-cay` (sen ở ao); `dang-song-da-chet-chua-tung-song` `q4_yellow`; `dong-co-xavan` ô `explore_dry`; `con-vat-an-gi` (trâu ăn cỏ ở ví dụ ô Học, "Cats eat fish." ở q6 bài đó). Đúng nếp giãn cách: bài 1 w1 ôn #4 (hai tuần) và w2 ôn #1 bài 3 (một tháng); bài 4 w2 ôn #4 bài 6 (mùa mưa, mùa khô ở xavan); bài 6 w1 ôn bài 5, w2 ôn bài 2 (cách bốn bài), w3 ôn #1 bài 6 — đúng chỗ đã hẹn ở `goi-ten-va-nhom-dong-vat/_topic.md:339`.
- **Miền:** grep chữ bé nghe — bài 1 không nói miền nào; **bài 2, 3 chỉ có miền Bắc** (`02:27,125`; `03:144,510`), **bài 4 chỉ có miền Nam** (`04:26,124,494,500`), bài 5 nhắc cả hai đúng một chỗ (ví dụ ô Tet `05:147-150`), bài 6 đặt hai miền cạnh nhau. **0 kết quả** "cả nước", "Việt Nam có bốn mùa", "Việt Nam có hai mùa", "Vietnam has four seasons".
- **Bài 5:** không câu Khởi động hay Quiz nào hỏi tên tháng hay tháng thứ mấy; tên tháng chỉ ở ý chính hai, ba ví dụ ô Twelve months, ví dụ "in September" ô Back to school, `prompt` và `explanation_correct` của q6 — đúng chỗ `_topic.md:182` cho phép. `word_list` không có tên tháng. Grep 0 kết quả "âm lịch", "lịch âm", "lunar", "tháng Giêng", "birthday", "sinh nhật", "Christmas", "Giáng sinh".
- **Ranh giới:** grep mọi chuỗi bé nghe (bỏ `brief`, bỏ dòng `>`) ra **0 kết quả** cho "bão", "lũ", "hạn hán", "sét", "storm", "flood", "drought", "lightning", "nhiệt kế", "thermometer", "gần Mặt Trời", "closer to the Sun", "nghiêng", "tilt", "khí hậu", "climate", "mùa hạ". Không câu nào bảo bé nhìn Mặt Trời (ô Sunny có ví dụ bắt buộc "never look straight at the Sun"); `brief` nào cũng cấm tuyết làm mùa đông Việt Nam và cấm đất nứt làm mùa khô.
- **`order_sequence` (bốn câu):** mỗi câu chỉ một thứ tự đúng; `prompt` nêu thẻ đầu ở hai câu vòng (`03:410` "Spring comes first.", `05:443` "Start at Tet."), hai câu còn lại là chuỗi một chiều; **cả bốn câu thẻ trong file không nằm sẵn đúng thứ tự**; `hint` chỉ nhắc một đầu dải hoặc một cách nghĩ, không gọi tên cả ba (đúng Lỗi hay gặp số 19).
- **Từ vựng:** 4–5 từ mỗi bài, 2–3 `core`; `word_list.term_keys` khớp **đúng** danh sách `core` ở cả sáu bài và khớp bảng `_topic.md:241-248`. `dry_season` ở bài 4 có dòng `>` ghi trùng có chủ ý (`04:532`).
- **Ghi chú cũ trỏ hai chủ đề mùa đã bỏ:** đã sửa hết (kiểm lại tám chỗ ở `goi-ten-va-nhom-dong-vat`, `sinh-vat-song-o-dau`, `noi-song-tren-trai-dat`, `discoverer/thoi-tiet-va-thien-tai`); chữ bé nghe ở các chủ đề đó không đổi.
- **Luật hình câu hỏi:** quy ước "hàng rào tre vì app ẩn hình câu hỏi khi mọi lựa chọn có hình" đúng với mã nguồn (`apps/ios/Packages/SKKit/Sources/LessonPlayer/Views/ExplorerQuestionStep.swift:46-47,84`).
- **Đúng khoa học ở mức 5–7 tuổi:** không thấy chỗ nào sai rõ. Đã đọc: nắng thường nóng (có "often"), mây che Mặt Trời một lúc, bốn mùa miền Bắc, hoa đào dịp Tết, lộc non mùa xuân, phượng và ve mùa hè, lá vàng mùa thu, hoa sữa và Trung thu mùa thu, lá bàng đỏ mùa đông, Hà Nội không tuyết, sương mù sáng sớm, ngày ngắn mùa đông, hai mùa miền Nam, mưa chiều rồi tạnh, mùa khô phải tưới cây, một năm mười hai tháng quay vòng, Tết khoảng đầu năm, khai giảng tháng Chín, xoài chín mùa khô, đèn ông sao năm cánh. Những chỗ nói hơi chắc tay: xem N7 và g7.

### Nên sửa (7)

**N1. `04-mua-mua-va-mua-kho.md:494` — `hint.en` của q6 dài chín từ, quá hạn tám từ của Explorer; đây là cảnh báo duy nhất `validate` bắt được.**
- Hiện tại: `hint.en: Think of Ho Chi Minh City in the south.` (9 từ) · `hint.vi: Em nghĩ tới miền Nam, như Thành phố Hồ Chí Minh nhé.`
- Trái `content/rules.json` `explorer.authoring.max_words_en: 8` và tiêu chí "mỗi câu EN tối đa 8 từ" của ticket. `validate` báo `age_words_en` (cảnh báo, không chặn `build`), nhưng app vẫn đọc câu này cho bé.
- **Sửa:** `hint.en: Think of Ho Chi Minh City.` (5 từ), VI giữ nguyên. Sửa kèm nếu `_topic.md` có chép lại (bảng Khung Quiz không ghi `hint`, nên chỉ sửa trong bài).

**N2. `06-mua-lai-ve.md:544-545` — `feedback` của lựa chọn sai `q5_winter` viết hai câu, trái luật SK-044 "feedback một câu".**
- Hiện tại: `feedback.en: Winter is cold. People wear warm coats.` · `feedback.vi: Mùa đông lạnh. Mọi người mặc áo ấm.` Đây là `feedback` **duy nhất** của cả chủ đề có hai câu (39 `feedback` còn lại đều một câu).
- **Sửa:** `feedback.en: People wear warm coats in winter.` (6 từ) · `feedback.vi: Mùa đông, mọi người mặc áo ấm.`

**N3. `01-thoi-tiet-hom-nay.md:51-52` — `hint` của w1 nói thẳng chữ của nhãn đáp án.**
- `prompt.en: Which place is very cold?`, đáp án `w1_ice` nhãn "sea ice" · "băng trên biển", lựa chọn sai là Xa-ha-ra. `hint.en: Think of the ice in your freezer.` — chữ "ice" chính là nhãn đáp án; bé chỉ cần nghe gợi ý là chọn đúng, không cần nhớ bài *Bắc Cực*.
- Dòng `>` ở `01:57` tự nhận "không gọi tên đáp án" — đúng với bản VI ("đá" khác "băng"), **sai với bản EN**. Trái SK-047 (`content/TEMPLATE.md:145-148`): `hint` hiện trước khi trả lời, không được gần như nói đáp án.
- **Sửa:** `hint.en: Think of your freezer at home.` (6 từ) · `hint.vi: Em nghĩ tới ngăn đá tủ lạnh ở nhà nhé.` (giữ cảnh quen, bỏ chữ đáp án). Sửa kèm dòng `>` `01:57`.

**N4. `06-mua-lai-ve.md:318-320` — `tray_pillow` dùng lại hình của bài 1 nhưng đặt `alt` và truy vấn đầu khác bài 1; bảng `alt` của `_topic.md` thiếu dòng này.**
- Bài 1 (`01:281-283`): truy vấn `plain white pillow; pillow on bed`, `alt` "A soft pillow" · "Chiếc gối mềm" (và `01:600` ghi rõ "bài 6 chép theo").
- Bài 6: truy vấn `plain pillow`, `alt` "A plain pillow" · "Chiếc gối trơn màu". Một ảnh hai `alt` trong cùng chủ đề; người viết đã ghi `06:321` là bản tạm.
- **Sửa:** `06:318` → `… Từ khoá tìm ảnh (EN): plain white pillow`; `06:319-320` → "A soft pillow" · "Chiếc gối mềm"; bỏ dòng `>` `06:321`. Thêm một dòng `| `tray_pillow` · 1 | plain white pillow | A soft pillow · Chiếc gối mềm |` vào bảng `alt` của `_topic.md` (giữa dòng `tray_boots` `_topic.md:325` và `explore_spring` `:326`).

**N5. Nhãn món kệ Chơi của bài 3 và bài 4 viết thường, lệch bốn bài kia và lệch khuôn SK-048.**
- Bài 1, 2, 5, 6 viết hoa chữ đầu ("Conical hat", "Warm coat", "Scarf", "Banh chung", "Coat"…); **bài 3** (`03:254,262,270,279,287,304`) và **bài 4** (`04:252,260,268,276,284,292,300`) viết thường ("conical hat", "coat", "hand fan", "scarf", "wool hat", "quilt", "raincoat", "watering can", "rubber boots"), cả `label.en` lẫn `label.vi`. Chủ đề #4 (SK-048) viết hoa mọi nhãn món.
- Cùng một vật hiện ra ba kiểu trên kệ của sáu bài: "Warm coat" (bài 1, 2) · "coat" (bài 3, 4) · "Coat" (bài 6); "Conical hat" · "conical hat"; "Scarf" · "scarf".
- **Sửa:** viết hoa chữ đầu mọi `label` món ở bài 3 và bài 4 (EN và VI), theo nếp bốn bài kia. Nhãn nhóm đã đúng.

**N6. Ghi chú cho dev ở `03-mua-thu-va-mua-dong.md:612` và `04-mua-mua-va-mua-kho.md:588` nói sai về `order_sequence`.**
- Hai dòng ghi "bản app 0.1.0 chưa hiện format này (`build` báo `format_not_rendered`)". Thực tế Explorer `order_sequence` đã có renderer từ 0.1.0 (`tools/content-cli/src/validate/format-renderers.ts:47`, SK-040; màn `ExplorerOrderSequence.swift` có thật), và `validate` chủ đề này **không** báo `format_not_rendered` lần nào.
- Nguy hiểm vì `format_not_rendered` là **lỗi** (không phải cảnh báo) ở `build` (`tools/content-cli/src/validate/age-rules.ts:151`): ghi chú sai có thể khiến phiên chính đặt `--min-app-version` cao hơn cần thiết hoặc bỏ format. Bài 5, 6 cũng dùng `order_sequence` nhưng không có ghi chú này; SK-048 cũng không có.
- **Sửa:** xoá hai dòng, hoặc đổi thành "Explorer `order_sequence` có renderer từ app 0.1.0 (SK-040); `build` không báo `format_not_rendered`".

**N7. Bản EN của hai câu ở bài 4 nói tuyệt đối trong khi bản VI có chữ "hay", "chiều chiều".**
- `04:28` `2.en: The rainy season has afternoon rain.` · `2.vi: Mùa mưa hay có mưa vào buổi chiều.`
- `04:138` `sentence.en: Dark clouds come in the afternoon.` · `sentence.vi: Chiều chiều, mây đen kéo tới.`
- EN đọc thành "mùa mưa thì chiều nào cũng mưa", "chiều nào mây đen cũng kéo tới" — không đúng và lệch nghĩa bản VI (app đọc cả hai thứ tiếng). Cùng kiểu lỗi SK-048 n10. Từ `dark_cloud` của chính bài đã làm đúng ("Dark clouds often bring rain." `04:550`, có dòng `>` giải thích).
- **Sửa:** `04:28` → `The rainy season often has afternoon rain.` (7 từ); `04:138` → `Dark clouds often come in the afternoon.` (7 từ). Sửa kèm `_topic.md:130` (bảng Tổng quan bài 4), `_topic.md:169-170` (ô Rainy season, Dark clouds) và `_topic.md:593`.

### Gợi ý (14)

- **g1. `02:326-327` `hint` của q1 gần như nhắc lại câu hỏi** ("Which flower blooms at Tet?" → "Think of flowers in homes at Tet." · "Em nghĩ tới cành hoa bày trong nhà dịp Tết nhé."): không thêm manh mối nào ngoài chữ đã có trong `prompt`. Không sai luật (không lộ đáp án vì cả ba hoa đều có thể bày trong nhà), chỉ là gợi ý rỗng. Nếu muốn chặt hơn: trỏ tới một dấu hiệu khác của mùa xuân ("Think of the warm days after winter.").
- **g2. `02:516-517` `feedback` của lựa chọn "mùa đông" ở q5 không trả lời được cách nghĩ của bé miền Bắc.** Câu hỏi "It is Tet. Which season is it?" đáp án mùa xuân; bé ở Hà Nội thấy Tết còn rét, chọn "mùa đông" (ảnh áo khoác) là suy luận có cơ sở, mà `feedback` chỉ nói "A warm coat is for winter days." Đây đúng là Còn mở số hai của `_topic.md:631` (chờ người chuyên môn). Đề nghị: khi chuyên môn chốt giữ câu này, đổi `feedback` thành câu công nhận cái bé thấy rồi chỉ sang dấu hiệu, ví dụ "Tet days can still feel cold." · "Ngày Tết đôi khi vẫn lạnh." (không nói tên đáp án).
- **g3. `04:490-492` q6 dùng hình ghép bốn mùa, hơi nghiêng về phía misconception.** Câu "Every place has four seasons." (Sai) mà hình là **bốn mùa**: bé nhìn hình thấy bằng chứng cho phía Đúng. Năm câu q6 còn lại đều dùng hình phản ví dụ (phố mùa đông không tuyết, hoa phượng mùa hè, vòng hạt khép kín…). Hình này là chữ chốt ở `_topic.md:426`; tester không bắt đổi, nhưng nếu người duyệt muốn cân: dùng `explore_dry_season` hoặc `explore_rainy_season` (ảnh miền Nam, đúng vật câu sửa nói tới).
- **g4. `04:413` `alt` của lựa chọn đúng q3 có chữ "dry" của câu hỏi** ("Which picture shows the dry season?" → "A dry road in the sunshine"), và đây là ảnh khô duy nhất trong hai lựa chọn. Người viết đã ghi lý do ở `04:396` (không có nguyên cụm "dry season", `alt` chốt ở bảng). Nếu muốn theo sát Quy ước hình số 8: đặt `alt` riêng cho riêng chỗ này ("A sunny road with trees" · "Con đường nắng có hàng cây") và thêm một dòng vào bảng `alt` riêng của `_topic.md`.
- **g5. `02:427` `alt` của lựa chọn đúng q3 có chữ "leaves" của câu hỏi** ("Which picture shows new leaves?" → "Tiny light-green leaves on a twig"), dù `alt` đã cố ý bỏ chữ "new". Hai lựa chọn sai dùng số ít ("A yellow leaf…", "A dry fallen leaf"). Nhẹ, ghi lại.
- **g6. Giọng miền Nam ở bài 5:** bài cố ý ghép đôi hoa đào (miền Bắc) với hoa mai (miền Nam) ở ô Tet, nhưng món Tết trong cả chủ đề chỉ có bánh chưng (ví dụ `02:147`, `05:151`, món kệ `05:257`, thẻ `q4_tet` `05:467`, thẻ thưởng `banh_chung_card`). Bé miền Nam gói bánh tét. Đề nghị PM hoặc content-editor cân nhắc nhắc "bánh tét" một lần ở ví dụ ô Tet bài 5 (chỉ lời, không thêm ảnh), hoặc ghi vào Còn mở cho người duyệt quyết.
- **g7. Hoa phượng gắn với "nghỉ hè" hay "trước nghỉ hè".** `05:486` q5 "Flame trees bloom. What time of year?" đáp án **nghỉ hè**; nhưng `03:51-52` `hint` lại nói "sân trường **trước kỳ nghỉ hè**" (phượng nở khoảng tháng Năm, trước khi nghỉ). Với bé 5–7 và ba lựa chọn (Tết, nghỉ hè, khai giảng) thì nghỉ hè vẫn là đáp án rõ nhất; ghi lại để người chuyên môn đọc `[CẦN KIỂM]` xác nhận cách nói.
- **g8. `06:466-467` `prompt` VI của q4 thiếu giọng "Em … nhé"** ("Xếp từ ngày lạnh tới ngày nóng.") trong khi ba câu `order_sequence` kia đều có ("Em xếp theo thứ tự nhé.", "Em xếp cơn mưa chiều theo thứ tự nhé."). Chữ chốt ở `_topic.md:448`; nếu đổi thì sửa cả hai chỗ.
- **g9. Hai ô "Dùng ở" của bảng Hình dùng chung đã cũ:** `_topic.md:296` ghi `explore_seasons` dùng ở "6 (`explore_north`, q2, q6)" nhưng bài 6 q2 dùng `explore_spring` (`06:398`, đúng bảng Khung Quiz `_topic.md:446`); `_topic.md:308` ghi `explore_school` dùng ở "q1_bag" nhưng bài 5 q1 chỉ có ba lựa chọn áo khoác, xô xẻng, bánh chưng. Sửa hai ô cho bảng khớp bài.
- **g10. Hai ghi chú đã lỗi thời trong bài:** `03:493` nói "Key gốc ở `_topic.md` là `q5_fog`" (bảng đã ghi `q5_winter`, `_topic.md:300,335`); `06:190` nói "Phiên chính sửa dòng `tray_long_sleeve` của bảng thành `q4_long_sleeve`" (bảng đã là `q4_long_sleeve`, `_topic.md:311-312,347`). Bỏ hai dòng để lượt rà sau khỏi báo lệch.
- **g11. Nhãn nhóm `limit` bài 1 và bài 6 có dấu phẩy** ("Not for sun, rain or cold" · "Không dùng khi nắng, mưa hay lạnh", `01:245-246`, `06:267-268`), trái ghi chú "Nhãn nhóm tránh dấu phẩy" của chính `_topic.md:526` — nhưng cùng dòng đó đã ghi đây là ngoại lệ phiên chính chốt 17/11, và `01:249` cũng ghi lại. Không bắt sửa; ghi lại để lượt rà sau khỏi báo.
- **g12. `03:212` `messages.start.en` "Find warm clothes, scarves and a warm bed."** — trên kệ không có "a warm bed", chỉ có chăn bông; EN hơi gượng (bản VI "đồ cho giường ấm" đã nói đúng). Nếu đổi: "Find warm clothes, a scarf and a quilt." (8 từ), nhưng khi đó lời nhắn không còn trùng chữ nhãn nhóm; người viết đã cân nhắc ở `03:227`. Ghi lại.
- **g13. Danh sách `[CẦN KIỂM]` chưa chép vào mục "Câu hỏi còn mở" của ticket** (tiêu chí content-editor). 67 dòng, trong đó nhiều ý chưa có trong mục đó: nắng làm quần áo mau khô; ếch kêu sau mưa; cầu vồng hiện khi nắng chiếu vào giọt mưa; hoa sữa mọc thành chùm hoa trắng; xoài chín rộ cuối mùa khô; đèn ông sao năm cánh; khai giảng ngày năm tháng Chín; bánh chưng gói lá dong; "mưa làm ruộng lúa xanh tốt"; cách hiểu "một cơn mưa" của ba thẻ q4 bài 4. `_topic.md:625` cũng đang nhờ PM làm việc này.
- **g14. Chuỗi "dùng lại" hai tầng** (ví dụ `02:358` `q1_lotus` → `tray_lotus` → `w1_lotus` của #1; `01:380` `q2` → `explore_sunny` → `q3_sun` của Discoverer): đúng nếp "chép mục" của chủ đề này (`same_as` không sang nhóm tuổi khác, `_topic.md:373-376`), không phải lỗi. Ghi lại để lượt rà sau và người làm file chọn ảnh biết phải giải chuỗi tới hình gốc.

### Chưa kiểm

- **Ảnh:** chưa có thư mục `content/images/explorer/thoi-tiet-va-cac-mua/`, nên chưa kiểm được giấy phép, tỉ lệ khung, mục `crop`, mục `composed` của ba hình ghép, hình vẽ vòng mười hai hạt, và các điều kiện địa điểm (phố mùa đông có đúng Hà Nội không, phố mưa có đúng miền Nam không, hoa mai có đúng *Ochna integerrima* không, hoa đào có lẫn anh đào không, nón lá `w1_hat` có trông như đồ chơi không, `q4_yellow` crop đã hết tuyết chưa).
- Không chạy `ids`, `images fetch`, `tts`, `build`, `check-pack` (lệnh ghi file). Chỉ chạy `validate`, kết quả dán ở đầu mục.
- **Không dùng simulator** (luật một máy, một lần): chưa chơi thử bài nào, nên chưa kiểm màn `order_sequence` thật, thứ tự app đọc `feedback` rồi `hint`, thẻ "Ý sai → Ý đúng" ở Tổng kết, số chữ thật trên một màn Chơi, vùng chạm, VoiceOver đọc `alt`.
- Chưa nghe thử giọng: EN "Tet", "banh chung", "Hanoi", "Ho Chi Minh City", "cicada", "Mid-Autumn", "Indian almond", "yellow apricot", "blackboard tree", ba câu vè tên tháng; VI "tháng Tư", "tháng Mười Một", "tháng Mười Hai", "áo cộc tay", "ủng cao su", "Thành phố Hồ Chí Minh".
- **67 dòng `[CẦN KIỂM]`** tester chỉ đọc ở mức hợp lý với trẻ 5–7, **không thay người chuyên môn**. Những điều tester không kiểm được: mốc tháng của mùa mưa, mùa khô miền Nam; giờ tối ở Hà Nội mùa đông so với mùa hè; mùa nở của hoa sữa, hoa mai, lá bàng đỏ; tên EN "flame tree", "yellow apricot blossom", "blackboard tree"; cách viết hoa "tháng Một"; nguồn Vosniadou và Brewer (1994), Friedman; SGK Tự nhiên và Xã hội lớp hai dạy mùa thế nào.
- Chưa đối chiếu mười trang lesson Oak Year 1 (chủ đề không bám Oak, `_topic.md:97` ghi rõ chưa ai đọc).

## content-editor 17/11 · sửa sau rà chữ

Sửa trong `content/explorer/thoi-tiet-va-cac-mua/` (sáu bài và `_topic.md`). Không đổi dòng `id:` nào, không đổi key hình nào, không đổi `brief` của hình gốc. Mọi câu EN mới đã đếm từ (tối đa tám, tính cả tên riêng nhiều chữ). Chưa chạy lại `validate` (lượt này không chạy lệnh); phiên chính hoặc tester chạy lại.

### Nên sửa (7/7)

- **N1** `04` q6 `hint.en` → "Think of Ho Chi Minh City." (sáu từ, không phải năm như ghi ở rà chữ); VI giữ.
- **N2** `06` q5 `q5_winter` `feedback` → "People wear warm coats in winter." · "Mùa đông, mọi người mặc áo ấm.".
- **N3** `01` w1 `hint` → "Think of your freezer at home." · "Em nghĩ tới ngăn đá tủ lạnh ở nhà nhé."; sửa dòng `>` dưới câu.
- **N4** `06` `tray_pillow`: từ khoá `plain white pillow`, `alt` "A soft pillow" · "Chiếc gối mềm", bỏ dòng `>` tạm; sửa ghi chú cho dev cuối bài. `_topic.md`: thêm dòng `tray_pillow` vào bảng `alt` (giữa `tray_boots` và `explore_spring`).
- **N5** Viết hoa chữ đầu `label` mọi món kệ Chơi ở bài 3 (Conical hat, Coat, Hand fan, Scarf, Wool hat, Quilt; VI Nón lá, Áo khoác, Quạt nan, Khăn len, Mũ len, Áo cộc tay, Chăn bông) và bài 4 (Coat, Raincoat, Watering can, Scarf, Conical hat, Rubber boots, Quilt; VI tương ứng). Nhãn lựa chọn Quiz và thẻ `order_sequence` giữ chữ thường như bốn bài kia.
- **N6** `03`, `04` ghi chú cho dev → "Explorer `order_sequence` có renderer từ app 0.1.0 (SK-040); `build` không báo `format_not_rendered`."
- **N7** `04` ý chính hai → "The rainy season often has afternoon rain."; ô Dark clouds → "Dark clouds often come in the afternoon."; **thêm** câu ví dụ từ `rainy_season` → "The rainy season often brings afternoon rain." (cùng lỗi, VI đã có "thường"). `_topic.md`: bảng Tổng quan bài 4, ô Dark clouds, mục Đúng khoa học (Mùa ở miền Nam).

### Gợi ý

- **g1 (làm)** `02` q1 `hint` → "Think of flowers as spring begins." · "Em nghĩ xem hoa nào nở khi mùa xuân vừa tới nhé." Không dùng câu tester đề xuất ("warm days after winter") vì Tết ở miền Bắc thường còn rét, mâu thuẫn với g2.
- **g2 (làm)** `02` q5 `q5_winter` `feedback` → "Tet can be cold, but winter is over." (tám từ) · "Tết có thể còn rét, nhưng mùa đông đã qua." Công nhận điều bé thấy, nói ý "đã sang xuân" mà không gọi tên mùa xuân. Lệch Lỗi hay gặp số 18 (feedback nói về dấu hiệu trên ảnh áo khoác): đã ghi ngoại lệ ở `_topic.md` mục 18 và Còn mở số hai.
- **g3 (không làm)** giữ hình ghép bốn mùa ở `04` q6: là đúng vật câu nói tới, chữ chốt ở `_topic.md`; gợi ý và giải thích đã kéo bé sang miền Nam. Để người duyệt quyết nếu muốn đổi sang `explore_rainy_season`.
- **g4 (làm)** `04` `q3_dry` `alt` riêng "A sunny road with trees" · "Con đường nắng có hàng cây"; thêm bảng "`alt` riêng ở một chỗ dùng" vào `_topic.md` (sau bảng `alt` hình gốc). **Designer chú ý:** ảnh `explore_dry_season` nên có hàng cây ven đường (brief gốc đã xin "cây xanh ven đường"); key, `brief`, `alt` gốc không đổi.
- **g5 (làm)** `02` `q3_buds` `alt` riêng "Tiny light-green buds on a twig" · "Những chồi nhỏ xanh nhạt trên cành"; cùng bảng `alt` riêng. Key, `brief`, `alt` gốc `explore_buds` không đổi.
- **g6 (làm)** `05` ô Tet ví dụ ba → "families wrap banh chung or banh tet" · "nhà nhà gói bánh chưng, bánh tét" (chỉ lời, không ảnh); thêm một dòng `[CẦN KIỂM]`; sửa kèm `_topic.md` bài 5. Cần nghe thử giọng EN đọc "banh tet".
- **g7 (làm)** thống nhất "phượng nở lúc nghỉ hè": `03` w1 `hint` → "Think of hot days when school ends." · "Em nghĩ tới những ngày nắng nóng, lúc được nghỉ hè nhé."; bổ sung dòng `[CẦN KIỂM]` dưới câu. Bài 5 q5 giữ nguyên.
- **g8 (làm)** `06` q4 `prompt.vi` → "Em xếp từ ngày lạnh tới ngày nóng nhé."; sửa kèm bảng Khung Quiz bài 6 ở `_topic.md`.
- **g9 (làm)** `_topic.md` cột "Dùng ở": `explore_seasons` bỏ "q2" ở bài 6; `explore_school` bỏ "q1_bag".
- **g10 (làm)** bỏ dòng `>` cũ về `q5_fog` (`03` dưới q5, và cụm tương ứng ở Ghi chú cho hoạ sĩ) và về `tray_long_sleeve` (`06` ô Clothes; sửa kèm dòng `>` dưới `q4_long_sleeve` và Ghi chú cho hoạ sĩ).
- **g11 (không làm)** dấu phẩy ở nhãn `limit` bài 1, 6 là ngoại lệ phiên chính đã chốt.
- **g12 (làm)** `03` `messages.start` → "Find warm clothes, a scarf and a quilt." · "Em tìm quần áo ấm, khăn quàng và chăn bông nhé." (nhóm "Warm bed" chỉ có một món); sửa dòng `>` dưới.
- **g13 (làm)** danh sách dưới đây; `_topic.md` mục Đề xuất cho PM ghi đã chép.
- **g14 (không làm)** chuỗi dùng lại hai tầng đúng nếp chép mục, không phải lỗi.

### Danh sách `[CẦN KIỂM]` (chờ người chuyên môn)

Gom theo ý; nơi ghi trong ngoặc (số bài, hoặc `_topic`). Một ý có thể lặp ở nhiều nơi.

**Mùa (cách chia, thời tiết từng mùa)**
1. Miền Bắc có bốn mùa theo cách chia của SGK; mùa thu mát, trời trong; mùa đông lạnh (`_topic` Đúng khoa học; 2; 3).
2. Tết được coi là mùa xuân dù Hà Nội dịp Tết thường còn rét; cách nói "Tết thì mùa đông đã qua" ở feedback mới (2 q5; `_topic` Còn mở số hai).
3. Hoa đào nở cuối đông, đầu xuân (6 q5).
4. "Spring days are warm" chấp nhận được khi đầu xuân Hà Nội có thể còn rét (6 từ `warm`).
5. Mưa phùn cuối đông, đầu xuân ở miền Bắc (2 ô Spring; `_topic`).
6. Hà Nội không có tuyết; tuyết, băng giá chỉ thỉnh thoảng ở núi cao phía Bắc (Sa Pa, Mẫu Sơn) (3 ô Winter, q6; `_topic` misconception `winter_means_snow`).
7. Miền Nam có mùa mưa (khoảng tháng Năm tới tháng Mười Một) và mùa khô (khoảng tháng Mười Hai tới tháng Tư); miền Nam ấm quanh năm (4 ý chính, q6; 6 ô South; `_topic`).
8. Mùa mưa miền Nam: mưa thường tới buổi chiều, mưa rào to rồi tạnh; mây đen thường kéo tới buổi chiều, trước mưa hay có gió mát (4 ý chính, ô Rainy season, ô Dark clouds; 6 ô South).
9. Mùa khô miền Nam nắng nhiều, rất ít mưa, phải tưới cây (4 ô Dry season).
10. Cách nói "mưa làm ruộng lúa xanh tốt"; không nói ruộng khô vào mùa khô vì đồng bằng sông Cửu Long cấy quanh năm (4 ô Rice fields; `_topic` Lệch bài 4, Còn mở số bốn).
11. "Sunny days are often hot" đúng với trẻ Việt Nam (1 ý chính; `_topic`).
12. Nắng làm quần áo ướt mau khô (1 ô Sunny).
13. Ở Hà Nội mùa đông tối sớm hơn rõ (khoảng năm giờ rưỡi chiều) so với mùa hè (khoảng bảy giờ tối); "dark before dinner" hợp bữa tối gia đình Việt Nam (2 ý chính; 3 ý chính, ô Short days; `_topic`).

**Dấu hiệu mùa**
14. Hoa phượng nở mùa hè ở cả hai miền; nở rộ khoảng tháng Năm, tháng Sáu, nên nói "phượng nở lúc nghỉ hè" chấp nhận được (2 ô Summer; 3 w1; `_topic` misconception `flowers_only_in_spring`).
15. Ve sầu kêu nhiều vào mùa hè ở miền Bắc (ve đực kêu) (2 ô Summer, q2).
16. Hoa sen nở mùa hè (2 ô Summer; 5 q3).
17. Nhiều cây ở miền Bắc ra lộc non vào mùa xuân (2 ô New leaves).
18. Có cây lá chuyển vàng vào mùa thu ở miền Bắc; thứ tự hoa đào, hoa phượng, lá vàng theo xuân, hè, thu (3 ô Autumn, q4; `_topic`).
19. Hoa sữa (*Alstonia scholaris*) nở mùa thu ở Hà Nội, hoa nhỏ màu trắng mọc thành chùm, mùi thơm nồng (3 ô Autumn, thẻ; `_topic`).
20. Lá bàng chuyển đỏ rồi rụng vào mùa đông ở miền Bắc; sang xuân ra lá non (3 ô Red leaves; `_topic`).
21. Sáng sớm mùa đông miền Bắc hay có sương mù (3 ô Winter, q5; `_topic`).
22. Ếch đồng kêu nhiều sau mưa (1 ô Rainy; `_topic` bài 1).
23. Cầu vồng thấy khi vừa có mưa vừa có nắng, Mặt Trời sau lưng người xem; `fact` chỉ nói "nắng chiếu vào giọt mưa" (1 thẻ; `_topic`).
24. Xoài miền Nam chín rộ cuối mùa khô, đầu mùa mưa; vỏ chuyển vàng khi chín (đúng với giống phổ biến như xoài cát) (4 thẻ; `_topic`).
25. Hoa mai vàng (*Ochna integerrima*) nở dịp Tết ở miền Nam; nhiều nhà chưng cành hay chậu mai ngày Tết (5 ô Tet, q3; `_topic`).

**Mốc trong năm**
26. Tết rơi vào tháng Một hoặc tháng Hai dương lịch ("khoảng đầu năm") (5 ô Tet, q4; `_topic`).
27. Nghỉ hè khoảng tháng Sáu tới tháng Tám, trùng mùa hoa phượng (5 ô Summer holiday; `_topic`).
28. Khai giảng ngày năm tháng Chín; trống trường đánh trong lễ khai giảng (5 ô Back to school; `_topic`).
29. Thứ tự Tết, nghỉ hè, khai giảng (5 q4; `_topic` bảng thứ tự).
30. Trung thu rơi vào mùa thu (tháng Chín hoặc tháng Mười dương lịch) (3 ô Autumn; `_topic`).
31. Bánh chưng gói lá dong (5 thẻ; `_topic`); miền Nam ngày Tết gói bánh tét (5 ô Tet, mới 17/11).
32. Đèn ông sao truyền thống có năm cánh (6 thẻ; `_topic`).

**Tên gọi**
33. Tên EN "flame tree" (hay "royal poinciana") cho cây phượng; cách gọi "hoa học trò" (2 thẻ; 3 w1; `_topic`).
34. Tên EN "yellow apricot blossom" cho hoa mai (tên khác "yellow ochna", "Vietnamese mickey mouse plant") (5 ô Tet; `_topic`).
35. Tên EN "blackboard tree" cho hoa sữa (3 thẻ; `_topic`).
36. Viết hoa tên tháng VI ("tháng Một" hay "tháng một"); dùng "tháng Một" cho dương lịch, không "tháng Giêng" (5 ô Twelve months; `_topic`).
37. Nghe thử giọng đọc: EN "Mid-Autumn", "banh chung", "banh tet", "dong leaves", "blackboard tree" (3 thẻ; 5 thẻ, ô Tet; 6 thẻ).

**Nguồn**
38. `sun_gone_when_cloudy`: gần ý Vosniadou và Brewer (1994); có thật ở trẻ năm tới bảy tuổi (`_topic`).
39. `flowers_only_in_spring`: tranh, bài hát thiếu nhi "mùa xuân trăm hoa đua nở" (`_topic`).
40. `winter_means_snow`: tranh, phim, thiệp mùa đông có tuyết (`_topic`).
41. `four_seasons_everywhere`: bài hát, sách tranh "bốn mùa"; SGK Tự nhiên và Xã hội dạy cả hai cách chia (`_topic`).
42. `months_stop_after_december`: William Friedman về hiểu biết tháng, mùa theo vòng ở trẻ (5 q6; `_topic`).
43. `same_weather_all_year`: mục tiêu bắt buộc Science Year 1 (Anh); kinh nghiệm phổ thông (`_topic`).
44. Toán Year 1 (Anh), Toán lớp một, hai; SGK Tự nhiên và Xã hội lớp hai (CT GDPT 2018) dạy các mùa thế nào (`_topic` Chương trình và nguồn).

**Khác (không thuộc năm nhóm trên)**
45. Ôn chủ đề khác, đã kiểm ở chủ đề gốc: chim cánh cụt không bay, dùng cánh để bơi (1 w2); thân, rễ sen nằm trong bùn đáy ao (2 w2); trâu ăn cỏ, không ăn cá (6 w3).
46. Bé năm tới bảy tuổi hiểu ba ảnh mây đen, mưa to, vũng nước (ba nơi) là "một cơn mưa" (4 q4; `_topic` Còn mở số ba).

### Còn chưa chắc

- Chưa chạy lại `validate`; dự kiến hết cảnh báo `age_words_en`, còn bảy `md_needs_check`.
- Hai `alt` riêng mới (g4, g5) cộng ba `alt` riêng cũ (`explore_ice`, `explore_dry`, `w1_buffalo`) là năm chỗ `alt` khác gốc; người làm file chọn ảnh ghi `alt` theo chỗ dùng.
- g2 cần người chuyên môn đọc cùng Còn mở số hai.

## designer 17/11 · ảnh bài 4–6

Đã làm: ba file chọn ảnh `content/images/explorer/thoi-tiet-va-cac-mua/mua-mua-va-mua-kho.json` (34/34 chỗ), `muoi-hai-thang.json` (38/38), `mua-lai-ve.json` (40/40); hình vẽ `content/images/own/thoi-tiet-va-cac-mua/muoi-hai-thang.{learn.explore.explore_months,q2,vocab.month}.jpg`; bốn hình ghép `content/images/composed/thoi-tiet-va-cac-mua/mua-lai-ve.{learn.explore.explore_south,vocab.change,learn.explore.explore_clothes,vocab.clothes}.jpg`. Không sửa `.md`, không đụng file chọn ảnh bài 1–3.

- **`images fetch` ba file của bài 4–6 (lượt cuối, 18/11 rạng sáng):** 58 ảnh khác nhau, 0 cảnh báo tỉ lệ, mọi mục ảnh mới của bài 4–6 OK. Còn 1 lỗi và 1 hình chờ ghép, cả hai là hình của bài 1–3 mà bài 6 trỏ tới: 429 khi tải ảnh phố Hà Nội `mua-thu-va-mua-dong` `vocab.winter` (Commons đang chặn tạm vì nhiều phiên tải cùng lúc; chạy lại là qua), và `mua-xuan-va-mua-he` `learn.explore.explore_seasons` chưa có file ghép. Chưa chạy được `fetch` cả thư mục trọn một lượt vì 429.
- **Ảnh mới: 14.** CC0 2 (mây đen Don Det, bát cơm) · Public domain 2 (bàn chải, đèn ông sao) · CC BY 10 (mưa phố Luang Prabang 2.0, đường mùa khô Vat Phou 4.0, bình tưới cây 2.0 Flickr, vũng nước La Habana 3.0, chùm xoài 2.0 Flickr, mai vàng 3.0, cặp sách randoseru 2.0, xô xẻng 2.0, phao bơi 2.0, áo sơ mi tay dài 2.0). Không BY-SA, NC, ND, không AI, không Pinterest. Mọi ảnh Commons đã đọc trang gốc qua API (giấy phép, tác giả, thể loại, mô tả); hai ảnh Flickr mở trang gốc, cả hai ghi CC BY 2.0. Bỏ một ảnh xoài Rawpixel CC0 vì trang gốc chặn, không kiểm được.
- **Hình vẽ (1, ba bản theo khung):** vòng mười hai hạt gỗ cùng màu, cùng cỡ, xâu trên sợi dây khép kín, đặt trên mảnh giấy điệp; giấy cắt style E, không nét viền, không chữ số, bóng `paperE` nướng sẵn. Bản 1024×1024 (Học), 1024×768 (q2, q6), 1024×512 (từ `month`) để vòng không bị cắt.
- **Hình ghép (2, mỗi hình hai bản):** `explore_south` = mưa phố (trái) + đường khô (phải), bản Học hai ô dọc, bản thẻ từ hai ô vuông; `explore_clothes` = áo khoác bài 1 + áo tay dài + áo cộc tay bài 1, ba ô vuông một hàng. Khe 12 px màu giấy điệp, không viền, không chữ. Mục `composed` liệt kê từng phần, credit ghi từng phần.
- **Mục chép từ Discoverer:** `explore_fields` chép nguyên `q2.q2_rice` của `khung-long/trai-dat-rat-lau-ve-truoc`.
- **Dùng lại:** trỏ `same_as` + `lesson` theo key trong file bài 1–3, chọn mục cùng khung: thẻ ba lựa chọn trỏ tới thẻ ba lựa chọn (`q1.q1_coat`, `q1.q1_raincoat`, `q1.q1_tshirt` bài 1; `q4.q4_scarf`, `q1.q1_flame`, `q1.q1_peach`, `q5.q5_spring` bài 2), thẻ từ trỏ tới thẻ từ (`vocab.season`, `vocab.spring` bài 2; `vocab.autumn`, `vocab.winter` bài 3, cũng dùng cho thẻ 5:2 bài 6 q5). Bánh chưng thẻ 5:2 (bài 5 `q1_banh_chung`, `q5_tet`): bài 2 chưa có bản 5:2 nên chép mục `tray.tray_banh_chung` kèm crop riêng. Nón lá kệ Chơi trỏ `chuoi-thuc-an/chuoi-thuc-an-la-gi` `tray.tray_hat` (bản vuông), bãi biển ô Học, thẻ xếp trỏ `noi-song-tren-trai-dat/bien-va-dai-duong` `learn.explore.explore_beach` (bản vuông).
- **Lá vàng (bài 6 `q3_yellow`):** trỏ `mua-xuan-va-mua-he` `q3.q3_yellow`, ảnh lá vàng mới "An autumn leaf" (cùng ảnh `w2`, `q4.q4_yellow` của bài 3). Chọn mục bài 2 vì đó là bản 5:2 đúng khung thẻ ba lựa chọn; không dùng `q4_yellow` của `sinh-vat-song-o-dau`.
- **Nhịp gọi:** Commons qua script giữ nhịp 9 s, một tiến trình; vẫn gặp 429 nhiều lần (phiên bài 1–3 tìm cùng lúc). Openverse hôm nay đã cộng vào `openverse-usage.json`.

**Bài 4 q4 (mây đen → mưa → vũng nước): không đạt ba ảnh cùng kiểu cảnh.** Mưa và vũng nước là cảnh phố; mây đen là trời trên sông và hàng cây (Don Det, Lào). Không tìm được ảnh mây đen trên mái nhà hay phố hợp luật: ảnh mưa ở Việt Nam trên Commons đa số CC BY-SA; ảnh mây trên phố tìm được thì mây xám nhạt hoặc có biển chữ. Ba ảnh cũng chụp ba nơi (Lào, Lào, Cuba). Đề nghị phiên chính đổi q4 sang `single_choice` như phương án ở `_topic.md`. Ảnh vũng nước (`q4_puddle`, từ `puddle`) dùng tiếp được cho câu mới.

**Ảnh khó**
- **Mưa trên phố:** không có ảnh mưa ở miền Nam Việt Nam hợp lệ thấy rõ vệt mưa (ảnh "Saigon … evening rain" CC0 chỉ là đường ướt, không thấy mưa rơi). Dùng ảnh mưa to ở Luang Prabang: vệt mưa rõ, đường ướt, không ngập; có một xe tuk tuk đỗ bên lề. Crop bỏ biển hiệu ở hai mép và biển số xe con.
- **Đèn ông sao:** ảnh hợp lệ duy nhất là ảnh rước đèn Trung thu ở Việt Nam (public domain), có nhiều trẻ em nhìn rõ mặt. Crop chỉ lấy một chiếc đèn phía trên đám đông nên ảnh chỉ còn 256×256 px, hơi mờ khi hiện to ở thẻ thưởng. Nếu PM thấy chưa đủ: hoặc đồng ý vẽ đèn ông sao giấy cắt (cần PM ghi đồng ý, vì Quy ước hình chỉ cho vẽ vòng mười hai tháng), hoặc chờ ảnh tốt hơn.
- **Cặp sách:** không có ảnh ba lô học sinh đứng một mình, trơn màu, không nhãn hiệu. Dùng randoseru đen treo trên bàn trong lớp học Nhật (crop bỏ đồng hồ và bảng chữ).
- **Xoài:** không có ảnh hợp lệ có quả đã ngả vàng. Dùng chùm xoài xanh treo trên cây.
- **Nón lá (`goi-ten-va-nhom-dong-vat` `w1_hat`, dùng ở bài 4 w1, kệ bài 4 và bài 6):** đã xem: là chùm nón lá nhỏ treo dây đỏ, trông như nón đồ chơi, lưu niệm, không phải nón lá thật đội đầu. Đề nghị designer bài 1–3 (chủ hình này trong chủ đề) hay PM quyết định tìm ảnh nón lá thật.

**Đề xuất content-editor sửa `brief`/`alt` (không đổi chữ bé nghe):**

| Bài · chỗ | Brief / `alt` hiện tại | Ảnh thật | Đề xuất |
| --- | --- | --- | --- |
| 4 `explore_rainy_season` (và mọi chỗ dùng lại) | phố miền Nam, ưu tiên TP.HCM; người mặc áo mưa | mưa to trên phố Luang Prabang, Lào; một xe tuk tuk đỗ, không thấy người | brief bỏ "ưu tiên phố ở miền Nam Việt Nam (Thành phố Hồ Chí Minh…)", "người, xe… mặc áo mưa"; `alt` giữ. Ô Học vẫn nói "like Ho Chi Minh City" như ví dụ (Quy ước hình 7) |
| 4 `explore_dark_clouds`, `q4_clouds`, từ `dark_cloud` (+ bảng `_topic.md`) | "Dark clouds over the land" · "Mây đen trên cánh đồng"; trên mái nhà, hàng cây hoặc cánh đồng | mây đen trên sông Mê Kông và một cây lớn ở Don Det, Lào | `alt` "Dark clouds over the river" · "Mây đen trên dòng sông" (hoặc "Dark clouds coming" · "Mây đen kéo tới"); brief bỏ "ưu tiên cảnh có mái nhà" |
| 4 `explore_dry_season` | trời xanh, bóng cây đổ rõ, ưu tiên miền Nam VN | đường đất đỏ dưới hàng cây xanh, nắng xuyên tán, bóng cây trên đường, không thấy trời (Champasak, Lào) | brief bỏ "trời xanh", "ưu tiên … miền Nam Việt Nam"; `alt` giữ |
| 4 `q4_puddle`, từ `puddle` | ưu tiên phố, ngõ Việt Nam | vũng nước trên lề đường La Habana, Cuba, phản chiếu trời xanh và nhà | brief bỏ "ưu tiên phố, ngõ Việt Nam"; `alt` giữ |
| 4 `mango_card` | có quả đã ngả vàng; ưu tiên vườn Việt Nam | chùm xoài xanh trên cây | brief "chùm quả xoài còn xanh"; `alt` "Mangoes on a tree" giữ; `fact` "Mangoes turn yellow when they are ripe." vẫn đúng với ảnh quả chưa chín |
| 5 `explore_school` | ba lô trơn màu, đặt đứng trên nền trơn hoặc bàn học | cặp đeo lưng (randoseru) màu đen treo trên bàn trong lớp học, cạnh một chiếc đỏ | brief theo ảnh; `alt` "A school bag" giữ |
| 5 `tray_toothbrush` | thấy cả cán và lông | đầu bàn chải và nửa cán | brief "chụp gần đầu bàn chải" |
| 5 `tray_swim_ring` | đặt trên bãi cát hoặc nền trơn | phao xanh lá trong suốt nổi trên mặt nước | brief "nổi trên mặt nước"; `alt` giữ |
| 5 `explore_tet` | cành mai đang nở | một cành mai ít hoa (ba, bốn bông) trên nền trời xanh, ảnh Thái Lan | giữ |
| 6 `q4_long_sleeve`, ghép `explore_clothes` | trơn màu, treo trên móc hoặc trải phẳng | sơ mi trắng treo trên móc dưới ánh đèn xanh lam, nhìn như áo xanh; khung vuông cắt mất cổ tay áo | giữ `alt`; brief "dưới ánh đèn xanh" |
| 6 `star_lantern_card` | treo hoặc đặt trên nền tối hay nền trơn | một chiếc đèn ông sao trong buổi rước đèn, nền đèn màu và kim tuyến | brief theo ảnh; `alt` giữ |

**Việc của bài 1–3 thấy khi fetch cả thư mục (không sửa vì không phải file của mình):** `mua-xuan-va-mua-he.learn.explore.explore_seasons` còn "chờ ghép" (bài 4 q6, bài 5 từ `year`, bài 6 `explore_north`, q6 trỏ tới hình này); ảnh phố Hà Nội `vocab.winter` bài 3 bị 429 trong lượt này, chạy lại `fetch` là được.

**Còn chưa chắc:** ảnh mưa có xe tuk tuk (xe của Lào, Thái Lan) có thể làm bé thắc mắc; nếu PM muốn ảnh không có xe thì cần thêm thời gian tìm. Mai vàng ít hoa. Đèn ông sao độ phân giải thấp.

## designer 17/11 · ảnh bài 1–3

Đã làm: ba file chọn ảnh `content/images/explorer/thoi-tiet-va-cac-mua/thoi-tiet-hom-nay.json` (36/36 chỗ có hình), `mua-xuan-va-mua-he.json` (39/39), `mua-thu-va-mua-dong.json` (36/36), và hai hình ghép trong `content/images/composed/thoi-tiet-va-cac-mua/`: `mua-xuan-va-mua-he.learn.explore.explore_seasons.jpg` (vuông) và `mua-xuan-va-mua-he.vocab.season.jpg` (2:1). Không sửa `.md`, không sửa file bài 4–6. Openverse 18 lượt tự gọi (đã cộng vào `openverse-usage.json`); Openverse trả 504 nhiều lần, nên tìm chủ yếu trên Commons. Upload Commons trả 429 (hai phiên fetch cùng lúc), phải lùi 10 phút rồi chạy lại.

**Ảnh mới: 22.** CC0 7 (khăn len, gối, lá vàng, phố Hà Nội, sương mù Hà Nội, quạt nan, hoa sữa) · Public domain 6 (áo phao, áo mưa, cầu vồng USFWS, cây phượng, bánh chưng, chăn bông) · CC BY 9 (tia nắng sau mây 2.0, áo cộc tay 2.0, ủng 2.0, hoa đào 3.0, lộc non 2.0, ve sầu 2.0, tán cây trời xanh 4.0, phố lên đèn 4.0, mũ len 2.0). Không BY-SA, NC, ND. Giấy phép đọc ở trang gốc qua API Commons; `fetch` kiểm lại ở nguồn. Ảnh Flickr chép từ Discoverer (`q3_cloudy`) đã mở trang Flickr: CC BY 2.0.
- **Chép mục Discoverer (crop riêng theo khung Explorer):** `nui-lua` `q3_sun` (`explore_sunny`), `q1_rain` (`explore_rainy`); `nang-mua-gio-may` `explore_cloudy` (đặt tên `q3_cloudy`). Không dùng `q2_rice` (không bài nào của tôi dùng).
- **Explorer chủ đề khác:** hàng rào tre, `w1_lotus` 5:2, `almond_card`, nón lá trỏ `same_as`; băng biển, đồi cát Xa-ha-ra, chim cánh cụt, quả bóng, sen, đồi cát Mũi Né, ao bèo, lá khô, lá bàng là mục riêng (cùng ảnh, crop đúng khung 17:10, 4:3, 1:1, 2:1, 5:2).
- **Lá vàng (quyết định phiên chính 17/11):** ảnh mới "An autumn leaf" (Iurie Nistor, CC0): một lá phong vàng còn trên cành, nền mờ xám, không tuyết. Gốc là bài 3 `q4.q4_yellow` (vuông); bài 2 `q3.q3_yellow` là bản 5:2; bài 3 `w2`, `q2` bản 4:3; hình ghép bốn mùa dùng bản vuông. Không còn chỗ nào của bài 1–3 trỏ `sinh-vat-song-o-dau` `q4_yellow`.
- **Hình ghép `explore_seasons`:** 1024×1024, lưới 2×2, khe 12 px màu giấy điệp, không chữ: trên trái hoa đào, trên phải cây phượng, dưới phải lá vàng, dưới trái áo phao (theo chiều kim đồng hồ như brief). Mục `composed` ghi bốn phần, credit từng phần.
- **Hình ghép thẻ từ `vocab.season`:** bản 2:1 riêng (1024×512, bốn ô 2:1, cùng ảnh, cùng thứ tự), vì bản vuông trong thẻ từ 2:1 mất nửa ảnh. Bài 5 từ `year` trỏ mục này thì đúng khung.
- **`images fetch` ba file (lần cuối):** 77 ảnh khác nhau, **0 lỗi, 0 cảnh báo tỉ lệ**, không có dòng "Chưa kiểm tỉ lệ", 2 hình ghép đã xử lý. Kiểm thêm với ngưỡng 1,05 (gọi `selectionShapeWarnings` với bảng tỉ lệ hạ ngưỡng, không sửa `image-slots.json`): 0 cảnh báo, kể cả mọi thẻ từ 2:1.
- **Độ nét:** `fetch` lấy bản 1280 px, nên ảnh vuông của ảnh ngang còn 720–960 px; ủng chỉ 648 px (ảnh gốc nhỏ); quả bóng 384 px (như mục gốc); `q4_flame` 512 px.

**Nón lá `w1_hat` (ticket giao kiểm):** đã xem ở cỡ kệ 1:1 (mục vuông của `chuoi-thuc-an-la-gi` `tray_hat`) và thẻ 5:2: là nón lá mini treo dây đỏ (trang gốc: "Small straw conic hats"), dáng và chất lá đúng nón thật, nhưng dây đỏ và cả chùm treo cho thấy đây là đồ lưu niệm. Designer bài 4–6 cũng thấy vậy. Đã tìm Commons (Category Conical straw hats in Vietnam, "non la", "Vietnamese conical hat") và Openverse (504): chỉ có nón lá ở bảo tàng Phụ nữ chụp từ trên xuống (thành hình tròn, có bóng người phản chiếu trên kính), hoặc nón người đang đội. Chưa thay; vẫn trỏ ảnh cũ. **Cần PM chọn:** (a) giữ ảnh hiện tại; (b) cho tìm thêm khi Openverse ổn (Flickr); (c) cho phép tự vẽ một chiếc nón lá (cần PM ghi đồng ý, vì Quy ước hình số 1 chỉ cho vòng mười hai tháng).

**Ảnh khó, chỗ lệch brief (đề xuất content-editor sửa `brief`/`alt` trong `.md`):**

| Bài · chỗ | Brief / `alt` hiện tại | Ảnh thật | Đề xuất |
| --- | --- | --- | --- |
| 1 `explore_cloudy` (q6, từ `weather`) | mép dưới có cây, đồng hoặc mái nhà | tia nắng toả lên từ sau một đám mây dày, đĩa Mặt Trời bị che kín, trời xanh; không thấy mặt đất | brief bỏ "mép dưới…"; `alt` giữ |
| 1 `explore_cold` và mọi chỗ áo khoác | áo phao hoặc áo dạ, nền tường trơn sáng | áo phao đỏ trên móc, nền vải đen | brief "nền trơn tối"; `alt` giữ |
| 1 `tray_raincoat` | áo mưa thấy cả mũ trùm | áo mưa cánh dơi vàng; mũ trùm gấp sau lưng, không thấy rõ; móc có chữ hiệu, đã cắt bỏ | brief bỏ "và mũ trùm"; `alt` giữ |
| 1 `tray_pillow` | gối trên nền trơn hoặc giường ga trơn | một gối trắng trên giường khách sạn, đầu giường gỗ | Giữ |
| 1 `tray_boots` | nhìn ngang | nhìn từ trên chếch xuống, ủng đỏ trên thảm, có bông cúc nhỏ | brief bỏ "nhìn ngang" |
| 1 `tray_ball` | — | quả bóng đỏ có dòng chữ in nổi nhỏ (cùng ảnh chủ đề gốc) | Giữ; ghi để PM biết (Quy ước hình số 4) |
| 1 `rainbow_card` | ưu tiên làng quê Việt Nam, ruộng lúa | cầu vồng trên ruộng khoai nước ở Hanalei (Hawaii), trời xám; không có ảnh hợp lệ ở Việt Nam | brief bỏ "ruộng lúa", `alt` giữ |
| 2 `explore_summer` (và mọi chỗ hoa phượng, thẻ thưởng) | trời xanh, ưu tiên sân trường Việt Nam | cây phượng tán rộng ở Coral Gables (Florida), trời trắng mây; ảnh phượng Việt Nam trên Commons (Hồ Gươm, ảnh Léon Busy) không thấy tán hay là ảnh cũ | brief bỏ "trên nền trời xanh"; `alt` giữ |
| 2 `explore_spring` | ưu tiên hoa đào miền Bắc | cành đào hồng thắm, trang gốc không ghi nơi | Giữ (`alt` không có tên nơi) |
| 2 `tray_banh_chung` | một chiếc bánh | hai chiếc bánh chưng chồng nhau | brief "hai chiếc bánh chưng chồng nhau"; `alt` "Square cakes wrapped in leaves" · "Bánh chưng vuông gói lá", hoặc giữ nếu PM chấp nhận |
| 3 `explore_autumn` (từ `autumn`, `cool`) | hàng cây ven phố, hồ Việt Nam | tán cây nhìn từ dưới lên, trời xanh trong (Darjeeling, Ấn Độ); không tìm được ảnh Hà Nội trời thu xanh hợp lệ | brief "tán cây dưới trời xanh trong, nhìn từ dưới lên"; `alt` "Trees under a clear blue sky" giữ được |
| 3 `explore_winter` (q6, từ `winter`) | Hà Nội, trời xám, người ở xa mặc áo ấm | **khớp Hà Nội**: "February 2008, street views in Hanoi 3" (rét đậm 2/2008); người đi xe máy ở tầm trung mặc áo ấm, đội mũ bảo hiểm (thẻ từ 2:1 thấy họ to hơn, mặt nhỏ, khó nhận ra); một bà bán hàng quay lưng ở gần; ô tô xa, biển số không đọc được; băng rôn đỏ rất xa, chữ không đọc được. Nếu PM thấy người còn gần quá thì báo designer tìm ảnh khác | brief giữ Hà Nội; `alt` giữ |
| 3 `explore_short_days` (q3) | ưu tiên phố Việt Nam | kênh và dãy phố lên đèn lúc chập tối ở Sète (Pháp); không có ảnh phố Việt Nam lúc chập tối hợp lệ; số trên thuyền đã cắt bỏ | brief bỏ "ưu tiên phố Việt Nam" hoặc giữ; `alt` giữ |
| 3 `q5_winter` (ở `_topic.md` ghi `q5_fog`) | hàng cây hoặc mặt hồ trong sương sớm | **khớp Hà Nội**: hàng cây trong sương mù ở Ba Đình, 5/3/2012 (cuối đông, đầu xuân theo lịch âm) | Giữ; nếu muốn nhắc "Hà Nội" thì nơi khớp |
| 3 `tray_fan` | quạt nan tre, nền trơn | chồng quạt đan lá cọ treo ở sạp (Philippines) | brief "quạt đan bằng lá"; `alt` giữ |
| 3 `tray_wool_hat` | mũ len trơn màu | mũ len sọc kem, xanh, đỏ | brief bỏ "trơn màu"; `alt` giữ |
| 3 `tray_quilt` | chăn bông gấp gọn | chăn bông trắng trải phẳng trên giường đơn | brief bỏ "gấp gọn"; `alt` giữ |
| 3 `q4` order | ba thẻ cùng kiểu chụp gần | hoa đào, lá vàng chụp gần; phượng là cả tán (crop sát chùm hoa chỉ còn 256 px) | Giữ; nếu cần cùng cỡ thì tìm ảnh phượng chụp gần riêng |
| 3 `blackboard_tree_card` | — | chùm hoa sữa, trang gốc ghi đúng loài *Alstonia scholaris* | Giữ |
| 2, 3 mọi chỗ lá vàng | trỏ `sinh-vat-song-o-dau` `q4_yellow` | ảnh mới, gốc ở bài 3 `q4.q4_yellow` | brief "Dùng lại hình `q4_yellow` ở bài `thoi-tiet-va-cac-mua/mua-thu-va-mua-dong`" (bài 2 q3_yellow, hình ghép; bài 3 w2, q2, q4_yellow là hình gốc `[ảnh]` mới, từ khoá `autumn leaf on branch`); sửa dòng `q4_yellow` ở bảng Hình dùng chung |
| `_topic.md` Hình dùng chung | nón lá dùng `w1_hat` | kệ 1:1 trỏ mục vuông `chuoi-thuc-an/chuoi-thuc-an-la-gi` `tray_hat` (cùng ảnh) | Không phải sửa chữ |

**Cho designer bài 4–6:** key gốc trong file của tôi khớp bảng Hình dùng chung (`learn.explore.explore_cold`, `tray.tray_scarf`, `tray.tray_raincoat`, `tray.tray_tshirt`, `tray.tray_boots`, `tray.tray_pillow` bài 1; `learn.explore.explore_spring`, `explore_buds`, `explore_summer`, `tray.tray_banh_chung`, `explore_seasons` bài 2; `explore_autumn`, `explore_winter`, `q5.q5_winter`, `tray.tray_quilt`, `q4.q4_yellow` bài 3). Bản 5:2: `q1.q1_coat`, `q1.q1_raincoat`, `q1.q1_tshirt` (bài 1); `q4.q4_scarf`, `q1.q1_flame`, `q1.q1_peach`, `q3.q3_buds`, `q3.q3_yellow` (bài 2). Bản 2:1: `vocab.raincoat` (bài 1); `vocab.spring`, `vocab.summer` (bài 2); `vocab.autumn`, `vocab.winter`, `vocab.coat`, `vocab.scarf` (bài 3). Áo mưa: crop mới bắt đầu từ y 0,13 (bỏ chữ trên móc).

**Còn chưa chắc:** nón lá (chờ PM); hoa phượng và tán cây mùa thu không chụp ở Việt Nam; bánh chưng là hai chiếc.

## designer 18/11 · đèn ông sao

- Thẻ thưởng `reward.star_lantern_card` (bài 6) đổi từ ảnh Commons sang hình giấy cắt tự vẽ theo quyết định phiên chính 18/11: `content/images/own/thoi-tiet-va-cac-mua/mua-lai-ve.reward.star_lantern_card.jpg`, JPEG 1024×1024 (khung 1:1 thẻ thưởng), không metadata.
- Hình: đèn ông sao năm cánh giấy đỏ son, mỗi cánh hai mặt sáng tối như gấp giấy, lớp dưới `#6E2216`, sao nhỏ lớp trên và bông giấy vàng hoè ở giữa; tua giấy vàng, nghệ, gỉ đồng ở bốn cánh dưới; cán tre hai đốt; trên mảnh giấy điệp tròn, nền `#FBF6EA`. Không chữ, không người, không nét viền; bóng `paperE` nướng sẵn.
- `mua-lai-ve.json`: mục ảnh cũ (Den_ong_sao.JPG, PD) thay bằng mục `own` (`method: drawn`), bỏ ghi công; note đầu file sửa "Ảnh mới: 1". `images fetch` file này: 0 lỗi, 0 cảnh báo tỉ lệ.
- Script nguồn ở scratchpad phiên (`sk050/draw/gen_lantern.py`), chưa đưa vào repo, giống vòng mười hai tháng.
- Chờ content-editor đổi brief thẻ sang `[hình vẽ]`; alt hiện có ("A red paper star lantern") khớp hình.

## content-editor 18/11 · khớp chữ với ảnh

Nháp AI, chưa duyệt. Sửa theo hai bảng designer 17/11 và "Phiên chính 18/11". Không đổi key hình; chữ bé nghe chỉ đổi ở bài 4 q4, `fact` thẻ xoài và các `alt`. Chưa chạy `validate` (phiên chính chạy cùng `ids`).

**`brief` sửa theo ảnh thật, `alt` giữ** (bỏ "ưu tiên Việt Nam", tên nơi; tả đúng cái bé thấy):
- Bài 1: `explore_cloudy` (chỉ có trời, không mặt đất); `explore_cold` (áo phao đỏ, nền trơn tối); `tray_raincoat` (áo mưa cánh dơi, mũ trùm gấp sau lưng); `tray_boots` (chụp chếch từ trên); `rainbow_card` (ruộng khoai nước, không ảnh hợp lệ ở Việt Nam).
- Bài 2: `explore_summer` (cây phượng, trời trắng mây); hình ghép `explore_seasons` (ô lá vàng trỏ hình mới, khe màu giấy điệp).
- Bài 3: `explore_autumn` (tán cây nhìn từ dưới lên); `explore_short_days` (dãy phố ven kênh lên đèn); `tray_wool_hat` (mũ len có sọc); `tray_quilt` (chăn trắng trải phẳng).
- Bài 4: `explore_rainy_season` (mưa trên phố, không thấy người, không tên nơi); `explore_dry_season` (đường đất đỏ dưới hàng cây, nắng xuyên tán); `q4_puddle` (vũng nước trên lề đường, phản chiếu trời và nhà); `mango_card` (chùm xoài còn xanh).
- Bài 5: `explore_school` (cặp đeo lưng đen treo bên bàn lớp học); `tray_toothbrush` (chụp gần đầu bàn chải); `tray_swim_ring` (phao xanh lá nổi trên mặt nước).
- Bài 6: `q4_long_sleeve` (áo treo dưới ánh đèn xanh); hình ghép `explore_clothes` (áo phao).

**`alt` đổi (có được đọc):**
- Mây đen `explore_dark_clouds`, `q4_clouds`, từ `dark_cloud`: "Dark clouds over the river" · "Mây đen trên dòng sông".
- Bánh chưng `tray_banh_chung` và mọi chỗ dùng lại (bài 5 kệ Chơi, q1, q4, q5, thẻ; bài 6 w1): "Two square cakes wrapped in leaves" · "Hai chiếc bánh vuông gói lá". Giữ kiểu cũ không gọi tên bánh.
- Quạt `tray_fan` bài 3: "Woven hand fans" · "Những chiếc quạt nan đan" (ảnh là một chồng quạt đan lá cọ). Nhãn "Hand fan" · "Quạt nan" giữ.
- `alt` không nêu tên nơi nước ngoài. `alt` của lựa chọn không chứa chữ của câu hỏi.

**Lá vàng:** bài 2 `q3_yellow`, bài 6 `q3_yellow`: "Dùng lại hình `q4_yellow` ở bài `thoi-tiet-va-cac-mua/mua-thu-va-mua-dong`. Từ khoá tìm ảnh (EN): autumn leaf on branch". Bài 3 là bài gốc: `q4.q4_yellow` thành brief `[ảnh]` mới; w2, q2 trỏ "Dùng lại hình `q4_yellow`.". `_topic.md`: thêm dòng `q4_yellow` · 3 vào bảng Hình gốc và bảng `alt`; dòng `sinh-vat-song-o-dau` `q4_yellow` ở bảng Hình của chủ đề khác ghi "Không dùng nữa".

**Bài 4 q4 → `single_choice`** (giữ `id`, DOK 2):
- Câu hỏi: "What comes after heavy rain?" · "Mưa to xong thì có gì?". Có hai lựa chọn: vũng nước ✓ (`q4_puddle`) và mây đen (`q4_clouds`). Bỏ thẻ `q4_rain`, nên mục `q4.q4_rain` trong `mua-mua-va-mua-kho.json` không còn chỗ dùng. Hai lựa chọn không có dòng `id`.
- `feedback` mây đen: "Dark clouds come before the rain." · "Mây đen kéo tới trước khi mưa."
- `hint`: "Think of the road when rain stops." · "Em nghĩ tới mặt đường lúc mưa vừa tạnh nhé."
- `explanation_correct`: "Yes! Rainwater stays on the road." · "Đúng rồi! Nước mưa còn đọng lại trên đường."
- `explanation_wrong`: "The answer is the puddle. Rain leaves water behind." · "Đáp án là vũng nước. Mưa tạnh, nước còn đọng lại."
- Mọi câu EN dưới 8 từ.
- Bài 4 nay có hai dạng (`single_choice`, `true_false`), vẫn đạt `min_formats: 2`.
- `_topic.md` sửa kèm: Khuôn chung (bài 1, 2, 4 hai format; bài 3, 5, 6 ba format), Khung Quiz bài 4, ghi chú dưới Khung Quiz, bỏ dòng bài 4 ở bảng thứ tự `order_sequence`, dòng `[CẦN KIỂM]` dưới bảng, Lệch bài 4, Còn mở số ba và số sáu (đánh dấu đã đóng).

**Thẻ xoài:** `fact` đổi thành "Mangoes hang in bunches on big trees." · "Xoài treo thành chùm trên cây to.", vì ảnh là quả còn xanh. `tag` giữ. Bảng Thẻ thưởng và dòng `[CẦN KIỂM]` ở `_topic.md` sửa cùng.

**Đèn ông sao:** brief đổi thành `[hình vẽ]` giấy cắt, khớp hình designer đã vẽ: đỏ, tua ở bốn cánh dưới, cán tre. Bỏ từ khoá tìm ảnh; `alt` giữ. `_topic.md` Quy ước hình số một nay có hai hình tự vẽ: vòng mười hai tháng và đèn ông sao (phiên chính duyệt 18/11).

**Còn chưa chắc:**
- Bài 4 q4 chỉ có hai lựa chọn, nên với hai lượt chạm bé đoán vẫn qua. Muốn khó hơn thì thêm lựa chọn đường nắng khô; việc này cần một mục chọn ảnh mới `q4.q4_dry`.
- Cần kiểm tiếng Anh "bunches" trong `fact` thẻ xoài.
- Nón lá vẫn chờ PM.

## ios-dev 18/11 · chạy thử

Máy: simulator **iPhone 16** (`8620A918…`), một máy, một lượt. Không đụng iPhone 16 Pro, không mở máy khác; xong đã `simctl shutdown` iPhone 16. Không sửa code, không sửa nội dung, không commit.

**Build:** gói `content/.build/pack` nhúng bằng build phase `embed-content-pack.sh` như SK-048 (`SK_CONTENT_PACK_DIR` mặc định trỏ `content/.build/pack`). `xcodebuild build -scheme ScienceKids -configuration Debug -destination 'generic/platform=iOS Simulator'` → `note: Content pack embedded … (16106 files)`, `** BUILD SUCCEEDED **`. Cài đè lên iPhone 16 (giữ dữ liệu), chạy với `-SKSyncOff YES -SKAssumeVoiceOver YES`. Không chạy lại unit test lượt này (lượt 17/11 đã xanh; không đổi code).

**Bản đồ Explorer** (tab Explorer trên Trang chủ): đạt cả bốn ý.
- [x] 5 chặng (Chặng 1 0/1, Chặng 2 0/2, Chặng 3 0/2, Chặng 4 0/3, Chặng 5 0/4).
- [x] Chặng 3 có #4 *Những nơi sống trên Trái Đất* và #5 *Thời tiết và các mùa*.
- [x] Icon `new-weather-and-seasons` (mây, mặt trời, cành hoa, lá vàng) hiện đúng, không lẫn với icon Discoverer #5.
- [x] #5 "Level 2 · 0/6 lessons"; màn chủ đề đủ 6 bài, đúng tên, câu hỏi lớn "How does the weather change in a year?". Level 2 đúng `syllabus.json`.
- Sau bài 1: nút #5 thành "Learning now · 1/6 lessons".

**Bài 1 "Thời tiết hôm nay"** chơi trọn Khởi động → Học (4 trang nhóm + trang Từ mới) → Chơi (kệ đồ) → Quiz 6 câu → Tổng kết 2 trang → Thưởng (thẻ Cầu vồng, 2 sao, "Review tomorrow for the 3rd star"). q6 cố ý chọn sai để xem thẻ sai → đúng. Không crash, không ảnh mất, không chữ tràn, không còn block bị bỏ qua.

**Ngó thêm (mở thẳng bằng `-SKOpenLesson`):**
- Bài 5 trang Học 1/5 "Mười hai tháng": vòng mười hai hạt tự vẽ hiện trọn, không cắt, nhãn "MƯỜI HAI THÁNG".
- Bài 6 chơi trọn tới Thưởng: thẻ **Đèn ông sao** (giấy cắt tự vẽ) hiện đủ cán tre và bốn chùm tua, không cắt. Bài 6 q4 `order_sequence` (áo khoác → sơ mi dài tay → áo cộc tay) xếp và chấm đúng.

**Lỗi hiển thị / nội dung cần xem (không sửa, chuyển designer, content-editor):**
1. **Áo mưa vàng (`tray_raincoat`) bị cắt xấu.** Crop gốc bỏ phần trên (móc áo có chữ) nên chỉ còn một khối vàng hình thang. Ở ô 4:3 (bài 5 w1) và ô rộng (bài 1 q1) gần như không nhận ra áo mưa, nhất là ở bài 5, nơi ảnh đứng cạnh bình tưới. Đề nghị designer chọn crop lấy cả cổ và mũ trùm (che móc), hoặc đổi ảnh.
2. **Phố mùa đông Hà Nội (`explore_winter`, bài 6 q5):** ở ô rộng thấy rõ người ở gần (bà bán hàng, người đi xe đạp nhìn được mặt), biển hiệu và băng rôn có chữ. Trái luật hình "người ở xa, không chữ". Đề nghị designer xem lại crop hoặc đổi ảnh.
3. **Hình ghép bốn mùa (`explore_seasons`, bài 6 trang Học "Miền Bắc", từ `year`, thẻ sai → đúng ở Tổng kết):** đọc trái → phải, trên → dưới thì thứ tự là xuân, hè, **đông** (áo khoác), **thu** (lá vàng). Nên đổi hai ô dưới cho đúng vòng xuân → hạ → thu → đông, hoặc ghi rõ thứ tự là chủ ý.
4. Bài 1 trang Học "Trời mưa" nói "we wear a raincoat" nhưng ảnh là căn nhà gỗ trong mưa, không có áo mưa. Không sai khoa học; content-editor cân nhắc.
5. Lặp ảnh: mặt trời và nhà gỗ trong mưa xuất hiện ở trang Học, Từ mới, q2, q3, q4 và Tổng kết của bài 1. Không lỗi, chỉ ghi lại.

**Ghi chú app (nhỏ, không sửa lượt này):**
- Thẻ "sai → đúng" Explorer ở Tổng kết: khi ảnh vuông (hình ghép bốn mùa) nằm trong khung rộng ~2.8:1, `PictureFit` chuyển sang `.fit` (đúng luật SK-043). Lúc đó nút VI và loa đè lên góc dưới phải của ảnh ghép (ô lá vàng). Ở bài 1 (ảnh lấp đầy khung) thì không thấy. Có thể sửa sau bằng cách để controls nằm trên vùng giấy trống khi ảnh `.fit`; cần designer chốt.
- Đúng/Sai Explorer khi bé chọn sai: lời giải hai câu đẩy ảnh xuống, hai thẻ gật/lắc bị thanh nút dưới che gần nửa. Bé vẫn đọc được lời giải và bấm tiếp được, nên không chặn.
- Chạy thử bằng tool simulator: mỗi lần chạm cần chờ khoảng 2 giây, app mới chuyển màn xong. Chụp ngay thì ảnh còn là màn cũ. Đây không phải lỗi app.

**Ảnh chụp (iPhone 16):** `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/8e2fcca1-fbe3-4313-a419-e683eef8228e/scratchpad/shots/sk050/` (36 ảnh: `01`–`05` bản đồ và màn chủ đề, `06`–`24` bài 1, `25` bản đồ sau bài 1, `26`–`27` bài 5, `28`–`36` bài 6).

**Dữ liệu simulator:** để mở tab Explorer có hồ sơ, lượt này tạm đổi `age_group` của hồ sơ thử trên iPhone 16 sang `explorer` và cất hai lượt dở cũ ra ngoài. Xong đã trả hồ sơ về `discoverer` và chép lại hai lượt dở. Lịch sử bài 1, bài 6 và lượt dở bài 5 vẫn còn trong `lessons/` của máy.

**Chưa kiểm:** iPad, iPhone 16e, Pro Max; VoiceOver; giọng thật (simulator không phát tiếng, `-SKAssumeVoiceOver` tắt tự phát); bài 2, 3, 4 và các trang Học còn lại của bài 5.

## Kiểm nghiệm thu (tester) 18/11

Lượt kiểm cuối, sau lượt sửa của content-editor (17/11 và 18/11), hai lượt ảnh của designer, đèn ông sao 18/11, và các quyết định "Phiên chính 18/11" (bài 4 q4 → `single_choice`; thẻ đèn ông sao là hình vẽ). Không sửa file nội dung, file chọn ảnh, code hay tài liệu khác. **Không dùng simulator** (ios-dev đang chạy thử trên iPhone 16 song song): mọi tiêu chí cần máy ghi "chờ ios-dev". Script kiểm ở `/private/tmp/claude-501/-Users-buiduyluu-Documents-personal-science-kids/8e2fcca1-fbe3-4313-a419-e683eef8228e/scratchpad/sk050/` (bộ cũ) và `…/scratchpad/sk050t/` (bộ mới của lượt này), chạy bằng `python3 -I`.

**Lệnh tester tự chạy lại (kết quả dán nguyên):**

| Lệnh | Kết quả |
| --- | --- |
| `validate content/explorer/thoi-tiet-va-cac-mua` | **7 file (1 topic, 6 bài) · 0 lỗi · 7 cảnh báo** — cả 7 là `md_needs_check` (66 dòng `[CẦN KIỂM]`: 21 `_topic.md`, 5·8·10·7·10·5 ở sáu bài). **Cảnh báo `age_words_en` của lượt rà trước đã hết** (N1 đã sửa) |
| `validate content` | **92 file (13 topic, 79 bài) · 0 lỗi · 159 cảnh báo · syllabus (3 nhóm, 45 chủ đề, 390 bài; 79 bài có lesson_id)** |
| `npm --prefix tools/content-cli test` | **399/399 pass, 0 fail** |
| `images fetch content/images/explorer/thoi-tiet-va-cac-mua` | **6 file · 108 ảnh khác nhau · 0 lỗi · 0 cảnh báo tỉ lệ**; hình tự vẽ 4, hình ghép 6, **0 chờ ghép**. Không gặp 429 |
| `sh tools/content-cli/scripts/check-pack.sh content/.build/pack` | **OK, exit 0** · `"brief"` = 0 ở mọi pack.json · thiếu file audio 0 · **ảnh: 1436 file kiểm JPEG, metadata, kích thước, credit, giấy phép (85 hình ghép kiểm cả parts, 469 hình tự vẽ) · lỗi: 0** |
| `git status` | 55 mục như trước khi tester chạy; `images fetch` chỉ ghi cache `content/.images` |

**Kiểm bằng máy trên gói đã build** (`topics/ac6f6c40…/5cca5726ee4c/pack.json`):
- **6 bài** đúng slug, đúng thứ tự; quiz 6 câu mỗi bài; Khởi động 2 câu (bài 1–5), 3 câu (bài 6).
- **222 node Image · thiếu `asset` 0 · thiếu `alt.en`/`alt.vi` 0**; 222 mục trong sáu file chọn ảnh, **từng bài khớp đúng** (36·39·36·33·38·40) — 0 chỗ trống, 0 mục thừa (mục `q4.q4_rain` đã bỏ cùng lượt đổi format).
- **Audio:** 915 chuỗi song ngữ, **681 chuỗi có đủ `audio.en` và `audio.vi`**, 0 chuỗi chỉ có một thứ tiếng; 234 chuỗi không có audio đều là `alt` (222) và `statement`/`correction` của Misconceptions (12) — đúng thiết kế. **Mọi `prompt`, `hint`, `explanation_*`, `label`, `feedback`, `feedback_true/false`, thẻ `order_sequence` của Khởi động và Quiz đều có clip EN và VI (thiếu: 0).** 0 hash audio nằm ngoài manifest.
- **Giấy phép 118 asset ảnh của chủ đề:** CC BY 2.0 37 · CC0 1.0 33 · Public domain 19 · CC BY 3.0 14 · CC BY 4.0 11 · Science Kids (hình tự vẽ) 4. **0 ảnh BY-SA, NC, ND hay không rõ giấy phép**; 0 ảnh CC BY thiếu `author`; 0 asset thiếu credit; 0 file thiếu trên đĩa. Nguồn: Wikimedia Commons 102 · composed 6 · Openverse/Flickr 6 · Science Kids 4. (Bốn hình tự vẽ không có `license_url` — đúng, là hình của mình.) Kiểm thêm trong sáu file chọn ảnh: 222 mục, 18 `parts` của sáu hình ghép đều trỏ `same_as` tới ảnh đã có credit.
- **`content/syllabus.json`:** Explorer 12 / 79, cả app 45 / 390; không còn key `seasonal-changes-*`; #5 `new-weather-and-seasons`, `strand: earth_sky`, `level: 2`, `source.kind: new`, 6 bài `oak_lessons: []`, `statutory: false`; `topic_id` và sáu `lesson_id` **khớp từng chữ** `id:` ở frontmatter bảy file `.md`; `human-body-parts` của SK-049 còn nguyên `topic_id`. `oakYear` Explorer suy từ danh mục = `[1, 2, 2, nil, nil, 1, 1, 1, 2, 2, 2, 2]` → gom thành **5 chặng** `[0..<1, 1..<3, 3..<5, 5..<8, 8..<12]`, đúng `JourneySegmentTests`.
- **113 dòng `id:`** trong bảy file, 0 dòng trống, 0 id trùng trong cả `content/`; không khối `option`/`item`/`group` nào mang `id` (nhất quán sáu bài).

**Chạy lại bộ script rà chữ — không có chỗ hỏng mới:**
- `check_struct.py`: sáu bài DOK 1·1·1·2·2·2, đúng một misconception ở q6, Khởi động DOK 1. Dạng câu: bài 1, 2, 4 hai dạng; bài 3, 5, 6 ba dạng (`min_formats: 2` đạt). `single_choice` 2–3 lựa chọn; Khởi động `single_choice` luôn hai lựa chọn.
- `t_words.py`: **0 câu EN quá tám từ**, 0 chuỗi `.en` có dấu tiếng Việt, 0 chuỗi `.vi` có chữ số hay ký hiệu, 0 câu VI quá hai mươi từ.
- `fb2.py`: 0 lựa chọn sai thiếu `feedback`, 0 lựa chọn đúng có `feedback`, 0 `feedback` VI nhiều hơn một câu, 0 `feedback` chứa nguyên cụm nhãn đáp án, **0 câu `true_false` sai phía**.
- `hint2.py`: 0 chỗ nhắc vị trí thẻ (một dòng máy bắt là "first" chỉ thời gian ở `03:95`).
- `mis.py`: sáu key đúng bảng "Phạm vi", `prompt`/`explanation_correct` của q6 trùng từng chữ `statement`/`correction`. Đếm cả `content/`: **79 key misconception, không key nào trùng** (kể cả *Cơ thể của em* và Discoverer #5).
- Script mới `prompts.py`: **98 chuỗi `prompt.en`/`prompt.vi` của Khởi động và Quiz đều có mặt từng chữ trong `_topic.md` (lệch 0)** sau khi bảng Khung Quiz sửa theo q4 bài 4 mới.
- Script mới `tf.py`: bảng Đáp án Đúng/Sai **22/22 dòng khớp cả câu lẫn đáp án**, 0 dòng thừa, 0 dòng thiếu; đếm máy 13 Sai · 9 Đúng, bài nào cũng có cả hai phía.
- Script mới `use.py`: bảng Hình dùng chung 30 dòng hình gốc, **cột "Dùng ở" khớp chỗ dùng thật 30/30 (lệch 0)** — hai ô cũ của g9 đã sửa. Bảng "Hình của chủ đề khác" đối chiếu bằng `ext.py`: khớp, dòng `sinh-vat-song-o-dau/q4_yellow` đã ghi "Không dùng nữa".
- Script mới `forbid.py` (chỉ chữ bé nghe, bỏ `brief` và dòng `>`): ranh giới ("bão", "lũ", "hạn hán", "sét", "storm", "flood", "drought", "lightning", "nhiệt kế", "thermometer", "gần Mặt Trời", "closer to the Sun", "nghiêng", "tilt", "khí hậu", "climate", "mùa hạ") **0 kết quả**, kể cả trong `alt`; bài 5 ("âm lịch", "lịch âm", "lunar", "tháng Giêng", "birthday", "sinh nhật", "Christmas", "Giáng sinh") **0 kết quả**; miền ("cả nước", "Việt Nam có bốn mùa", "Việt Nam có hai mùa", "Vietnam has four seasons") **0 kết quả**. Chỗ duy nhất nói tới nhìn Mặt Trời là ví dụ an toàn bắt buộc "never look straight at the Sun".
- `mien.py`: bài 1 không nói miền nào; **bài 2, 3 chỉ miền Bắc**; **bài 4 chỉ miền Nam**; bài 5 ghép hai miền ở ví dụ ô Tet; bài 6 đặt hai miền cạnh nhau; 0 chỗ nói "miền Trung".
- `t_tab2.py` mục `word_list`: 4–5 từ mỗi bài, 2–3 `core`, `term_keys` khớp danh sách `core` **6/6 bài**.

**Mục "nên sửa" và "gợi ý" của lượt rà 17/11 — kiểm lại từng mục:**

| Mục | Trạng thái | Bằng chứng |
| --- | --- | --- |
| N1 `04` q6 `hint.en` | **đã sửa** | `04:491` "Think of Ho Chi Minh City." (6 từ); `validate` hết `age_words_en` |
| N2 `06` q5 `q5_winter` `feedback` | **đã sửa** | `06:542-543` một câu |
| N3 `01` w1 `hint` | **đã sửa** | `01:51-52` "Think of your freezer at home."; dòng `>` `01:57` sửa theo |
| N4 `06` `tray_pillow` | **đã sửa** | `06:317-319` trùng bài 1; `_topic.md:327` có dòng trong bảng `alt` |
| N5 nhãn món kệ bài 3, 4 | **đã sửa** | `03:254…304` và `04:252…300` viết hoa chữ đầu, EN và VI |
| N6 ghi chú `format_not_rendered` | **đã sửa** | `03:612` ghi đúng "có renderer từ app 0.1.0 (SK-040)"; dòng ở `04` thay bằng ghi chú đổi format |
| N7 EN nói tuyệt đối ở bài 4 | **đã sửa** | `04:28`, `04:138` có "often"; thêm `04:513` ví dụ từ `rainy_season` |
| g1, g2, g4, g5, g6, g7, g8, g9, g10, g12, g13 (content-editor ghi "làm") | **đã làm 11/11** | `02:326`, `02:517`, `04:412-414`, `02:426-428` + bảng `alt` riêng `_topic.md:357-361`, `05:151-155`, `03:51-52`, `06:465`, `_topic.md:296,309`, 0 kết quả `q5_fog`/`tray_long_sleeve`, `03:212-213` |
| g3, g11, g14 (ghi "không làm") | có lý do, đã ghi | giữ hình ghép ở `04` q6; dấu phẩy nhãn `limit` là ngoại lệ đã chốt; chuỗi dùng lại hai tầng đúng nếp |

**Bảng kiểm từng tiêu chí**

| # | Tiêu chí | Kết quả | Bằng chứng |
| --- | --- | --- | --- |
| B0.1 | PM viết đề xuất, ticket; sáu câu chốt 17/11 | đạt | mục "Quyết định đã ghi", "Câu hỏi 1–6" |
| B0.2 | `content/syllabus.json` theo "Phạm vi"; đếm 45/390, Explorer 12/79; `syllabus.test.ts` sửa cùng lần | **đạt** | đọc máy (ở trên); `syllabus.test.ts:95,101,109` nêu 45/390; `npm test` 399/399 |
| B0.3 | pm sửa `syllabus.md`, `syllabus-lessons.md`, `syllabus-progression.md`, `prd.md`, `technical-plan.md` | đạt | cả năm file nêu 45 chủ đề / 390 bài, Explorer 12/79, 35 unit Oak + 10 chủ đề mới; `syllabus.md` mục 8 ý 2 đã gạch và ghi "Hết hiệu lực 17/11" |
| CE1 | `_topic.md` frontmatter, Tiêu đề, Nguồn, đủ mục | đạt | `_topic.md:1-19` (`order: 5`, `earth_sky`, `level: 2`, difficulty 2-1-2-2-2, `prerequisites: []`, `is_free: false`, `ai_draft: true`, không `oak_unit_ref`); Nguồn có câu Duy 17/11 và bảng **mười slug Oak** kèm bài; có đủ Tên gọi, Quy ước hình, Hình dùng chung, Đúng/Sai, Khởi động, Chơi, Thẻ thưởng, An toàn, Ranh giới, Còn mở |
| CE2 | 6 bài, thứ tự, `stage`, tên khớp danh mục | đạt | `stage` opener · core ×3 · apply · review; tên EN/VI và `id` khớp `syllabus.json` từng chữ |
| CE3 | Luật Explorer (Khởi động, 6 câu DOK 1·1·1·2·2·2, q6 misconception, dạng câu, ≤8 từ EN, `true_false` khẳng định không `labels`) | đạt | `check_struct.py`, `t_words.py`, `validate` 0 lỗi; mỗi câu Khởi động có `recall_from.kind: lesson` |
| CE4 | q6 `true_false` đáp án Sai, `explanation_correct` đứng một mình; cân Đúng/Sai | đạt | 6/6 q6 `answer: false`; `tf.py` 22/22; 9 Đúng · 7 Sai nếu bỏ q6 |
| CE5 | Khởi động giãn cách bài 1, 4, 6 | đạt | bài 1 w1 → `noi-song-tren-trai-dat/bac-cuc`, w2 → `goi-ten-va-nhom-dong-vat/chim-va-bo-sat` (mốc một tháng); bài 4 w2 → `noi-song-tren-trai-dat/dong-co-xavan` (bài 6 của #4); bài 6 w1 → bài 5, w2 → bài 2, w3 → `goi-ten-va-nhom-dong-vat/con-vat-an-gi` |
| CE6 | Miền (bài 2, 3 Bắc; bài 4 Nam; grep) | **đạt** | `mien.py`, `forbid.py` |
| CE7 | Bài 5 không hỏi tên tháng; `word_list` không có tên tháng; grep lịch âm | **đạt** | tên tháng chỉ ở ý chính, ví dụ ô Học và `prompt`/`explanation` của q6 (chỗ `_topic.md:182` cho phép); grep 0 kết quả |
| CE8 | `order_sequence` một thứ tự đúng, nêu thẻ đầu khi là vòng, thẻ không nằm sẵn đúng thứ tự | đạt | ba câu còn lại `03:405`, `05:440`, `06:459`; `03` "Spring comes first.", `05` "Start at Tet."; thứ tự trong file đều xáo |
| CE9 | Từ vựng 4–5 từ, 2–3 `core`, `dry_season` có dòng `>` | đạt | `t_tab2.py`; `04` dòng `>` ghi trùng có chủ ý với #4 bài 6 |
| CE10 | SK-044 `feedback` | đạt | `fb2.py` |
| CE11 | SK-047 `hint` | đạt | `hint2.py`; N3, g1, g7 đã sửa |
| CE12 | Ranh giới; không ảnh tuyết làm mùa đông VN, không đất nứt làm mùa khô | đạt | `forbid.py` 0 kết quả; `brief` bài 3, 4 cấm tuyết và đất nứt; ảnh `explore_winter` (Hà Nội 2/2008) và `explore_dry_season` đã xem, không tuyết, không đất nứt |
| CE13 | Mọi sự thật chưa chắc có `[CẦN KIỂM]`; danh sách chép vào "Câu hỏi còn mở" của ticket | **đạt một phần** | 66 dòng `[CẦN KIỂM]` trong bảy file; danh sách 46 ý có trong ticket nhưng nằm ở mục "content-editor 17/11", **không nằm ở mục "Câu hỏi còn mở"** (mục đó vẫn là bản PM 17/11). Đề nghị pm gộp khi đóng ticket |
| CE14 | "Ghi chú cho hoạ sĩ" đủ ảnh mới · dùng lại · ảnh khó | đạt | sáu bài đều có ba mục |
| CE15 | Ghi chú cũ trỏ hai chủ đề mùa | đạt | 8 chỗ đã sửa; `git diff` cho thấy **chỉ đổi dòng `>`**, 0 chữ bé nghe đổi |
| D1 | Mọi chỗ có hình có mục, 0 chỗ trống | **đạt** | 222/222 theo từng bài |
| D2 | Chỉ CC0/PD/PDM/CC BY có ghi công; `fetch` 0 lỗi, 0 cảnh báo tỉ lệ | **đạt** | bảng giấy phép ở trên; tester tự chạy `images fetch` |
| D3 | Không chữ, chữ số, logo, nhãn hiệu trong hình; người ở xa, không nhận ra mặt | **không đạt** | **L1** và **L2** dưới đây (ảnh phố Hà Nội; quả bóng `tray_ball`). Các ảnh khác tester mở xem (58 ảnh khác nhau, một bản contact sheet) không thấy vi phạm |
| D4 | Ảnh mang tên nơi khớp trang gốc | đạt | chữ bé nghe chỉ nêu Hà Nội và Thành phố Hồ Chí Minh; ảnh gắn Hà Nội đúng Hà Nội ("February 2008, street views in Hanoi 3", "Fog in Hanoi … 2012"); chỗ nói "Ho Chi Minh City" là ví dụ bằng lời, ảnh chụp nước ngoài và `alt` không nêu tên nơi; 0 `alt` nào có tên nơi nước ngoài |
| D5 | Hình tự vẽ chỉ vòng mười hai tháng; chỗ khác phải có đồng ý ghi trước | đạt | đúng hai hình tự vẽ: vòng mười hai hạt (PM 17/11) và đèn ông sao (phiên chính 18/11, ghi ở "Quyết định đã ghi" và `_topic.md` Quy ước hình số 1). Tester mở xem cả hai: không chữ, không chữ số, không nét viền. Ba hình ghép có mục `composed` đủ `parts` |
| D6 | Icon mới; canvas; spec mục 8; bỏ hai dòng `seasonal-changes-*` | đạt | `design/icons/topics/new-weather-and-seasons.svg` (4 màu giấy, không stroke, không text, khác hẳn `new-weather`); `Topic-Icons.dc.html` có key mới; `journey-roadmap-spec.md:145,177` "45 icon"; `canvas.json` "Icon chủ đề (45)"; hai icon cũ chuyển `design/icons/topics/_retired/`; mục 2 ý 3 của spec đã viết lại thành 5 chặng |
| I1 | `import-topic-icons.sh`: có `Topic-new-weather-and-seasons`, 45 icon, bỏ hai imageset cũ | đạt | `Assets.xcassets/Art/Topics` còn đúng 45 thư mục `Topic-*`; `design/icons/topics` 45 svg |
| I2 | Test ghi cứng số đếm sửa; ba bundle xanh trên iPhone 16 | **đạt một phần** | đọc file: `SyllabusTests:27,28,55,57`, `JourneyTests:34,37`, `JourneySegmentTests:25-26`, `JourneyMapAppTests:18,41,75`, `OnboardingTests:219,298`, `README:53` đều đúng số mới. **Kết quả chạy: chờ ios-dev** (tester không dùng simulator lượt này) |
| I3 | Chạy thử bản đồ Explorer (5 chặng, Chặng 3 có #4 và #5, #5 đủ 6 bài) | **chờ ios-dev** | tester không dùng simulator; suy từ danh mục thì ra đúng 5 chặng và Chặng 3 = {#4, #5} |
| I4 | Không thêm khoá thẻ | đạt | `collectible.set.weather` đã có; `Localizable.xcstrings` không nằm trong danh sách file đổi |
| T1 | Danh mục và test đếm: 45/390, Explorer 12/79, `oakYear`, 5 chặng | **đạt** | ở trên |
| T2 | Rà chữ 6 bài: 0 chặn; "nên sửa" đã sửa hoặc có quyết định | **đạt** | 7/7 mục N đã sửa; 11/11 gợi ý ghi "làm" đã làm; 3 mục "không làm" có lý do |
| T3 | Đọc mọi dòng `[CẦN KIỂM]` ở mức 5–7 tuổi | đạt | 66 dòng; không thấy chỗ nào sai rõ với trẻ; không thay người chuyên môn (xem "Còn chờ người") |
| P1 | `validate` 0 lỗi; `ids` đã chạy đúng thứ tự | **đạt** | 0 lỗi; 113 dòng `id:` đã điền, 0 trống, 0 trùng trong cả `content/` |
| P2 | `images fetch` 0 lỗi; `tts` EN và VI; `build`; `check-pack` OK | **đạt** | tester chạy lại `fetch` (0 lỗi) và `check-pack` (OK, 1436 ảnh, lỗi 0); báo cáo TTS VI: 681 chuỗi, 564 clip, `flagged_first_check` 30 → `changed_variant` 3 → **`still_flagged` 28** (27 cờ `asr`, **1 cờ `cut_end`**), 1 cảnh báo `loanword` ("xavan"). `build` gói 12 chủ đề (log `scratchpad/sk050-build.log`): 16106 file, 89 cảnh báo — **0 dòng nhắc `thoi-tiet-va-cac-mua`**, các dòng in ra đều của *Ăn uống lành mạnh* và *Thời tiết và thiên tai* (Discoverer, có từ trước) |
| P3 | Chơi trọn một bài trên iPhone 16 | **chờ ios-dev** | tester không dùng simulator ở lượt này |
| PM1 | Người chuyên môn đọc hết `[CẦN KIỂM]` trước khi phát hành | **chưa đạt — chờ người chuyên môn** | 66 dòng còn nguyên; `validate` còn `md_needs_check` nên chưa phát hành được |
| PM2 | Tài liệu và `docs/backlog/README.md` khớp danh mục | đạt phần số đếm | `README.md:89` đã có dòng SK-050 (trạng thái `in_progress`, chữ mô tả còn là bản 17/11 "chờ content-editor soạn…"); pm cập nhật khi đóng |

**Tổng: 30 đạt · 2 đạt một phần (CE13, I2) · 1 không đạt (D3) · 2 chờ ios-dev (I3, P3) · 1 chưa đạt vì chờ người chuyên môn (PM1). Lỗi chặn: 0.**

### Lỗi (nên sửa)

**L1. Ảnh phố mùa đông Hà Nội (`explore_winter`) có biển số xe, biển hiệu và băng rôn đọc được — trái Quy ước hình số 3 và 4 của chính `_topic.md`.**
- Ảnh: "February 2008, street views in Hanoi 3" (CC0). Tester mở ba crop trong gói và phóng to: **biển số ô tô đọc được "60H-1…"**; biển hiệu vàng bên trái "…A NỘI"; một biển chữ đỏ "…HỌC CẤM…" ở mép trái; băng rôn đỏ ngang phố có chữ; **mã vạch và chữ in trên các hộp kẹo mút ở tiền cảnh**.
- `_topic.md:254` Quy ước hình số 3 ("không biển hiệu, biển số xe đọc được") và số 4 ("Không chữ, không chữ số trong mọi hình… không biển phố"). Ghi chú designer ở ticket ("ô tô xa, biển số không đọc được; băng rôn… chữ không đọc được") **không đúng với ảnh thật**.
- Dùng ở **4 chỗ**: bài 3 ô Học "Winter" (`bai3/learn/0/groups/1`), **bài 3 q6 — chính câu misconception `winter_means_snow`** (`bai3/quiz/5`), từ `winter` (`bai3/vocab/1`), và bài 6 q5 lựa chọn "mùa đông" (`bai6/quiz/4/options/2`).
- ios-dev chạy thử trên iPhone 16 cùng ngày cũng bắt đúng chỗ này (mục "ios-dev 18/11", ý 2), thêm: ở khung rộng còn **thấy rõ mặt người ở gần**.
- **Đề nghị:** designer crop lại lấy phần giữa đường (bỏ dải nhà hai bên, bỏ xe và quầy hàng ở tiền cảnh), hoặc đổi sang ảnh phố mùa đông khác. Nếu đổi ảnh thì `brief`/`alt` ("People in coats on a street") giữ được.

**L2. Ảnh quả bóng trên kệ Chơi (`tray_ball`, dùng lại `sinh-vat-song-o-dau/vat-song-hay-khong-song` `q1_ball`) có nhãn hiệu đọc rõ.**
- Mở bản dùng thật ở kệ bài 1 (384×384) và bài 6 (888×1024): chữ **"Baden"** in trên quả bóng, một tem trắng có chữ, và chữ trên lốp xe đạp phía sau. Ở ô kệ bé nhìn gần nên đọc được.
- Trái Quy ước hình số 4. Designer đã ghi "Giữ; ghi để PM biết" ở bảng ảnh khó bài 1–3, nhưng tiêu chí nghiệm thu vẫn là "không nhãn hiệu".
- **Đề nghị:** crop lấy phần bóng không có chữ (chữ nằm lệch phải, cắt được), hoặc đổi ảnh. Ảnh gốc thuộc *Sinh vật sống ở đâu?*: nếu sửa thì sửa ở chủ đề gốc, hai chủ đề cùng được.

**L3. Lá vàng `q4_yellow` là lá phong (maple) có đốm đen và lỗ sâu — biểu tượng mùa thu ôn đới, không phải cây Việt Nam.**
- Ảnh "An autumn leaf" (CC0), chọn 18/11 để thay ảnh cũ có tuyết. Tester mở xem: lá phong vàng, mặt lá có nhiều đốm đen (bệnh đốm than) và vài lỗ thủng.
- Dùng ở **6 chỗ**: bài 2 q3 lựa chọn sai, bài 3 w2, q2 và q4 (thẻ mùa thu), bài 6 q3 (đáp án đúng "Hình nào là mùa thu?"), và **một ô của hình ghép bốn mùa** `explore_seasons` (hình này lại dùng ở bài 4 q6, bài 5 từ `year`, bài 6 ô "Miền Bắc" và q6).
- Hai rủi ro: (a) cùng loại rủi ro với ảnh tuyết đã bị loại 18/11 — chủ đề cố ý dạy dấu hiệu mùa Việt Nam (hoa sữa, lá bàng đỏ, sương mù) mà ảnh chốt cho "mùa thu" lại là lá phong; (b) đốm đen, lỗ thủng làm lá trông như lá hỏng, trong khi bài 2 q3 đặt nó cạnh "chiếc lá khô vừa rụng" (`q3_dry`) làm hai lựa chọn sai gần nhau.
- **Đề nghị:** designer tìm ảnh lá vàng lành lặn của cây nhiệt đới (ví dụ lá bàng, lá sấu) hoặc ít nhất một lá vàng không đốm. Nếu giữ thì PM ghi là chủ ý. Không chặn.

### Góp ý

- **g1. Hình ghép `explore_clothes` bản vuông để trống hơn một phần ba khung.** `mua-lai-ve.learn.explore.explore_clothes.jpg` (1024×1024) chỉ có ba ô ảnh nằm ở dải giữa, trên và dưới là giấy trơn; ở ô Học bé sẽ thấy ba chiếc áo khá nhỏ. Bản 2:1 (`vocab.clothes`) thì vừa khung. Nếu ghép lại cho bản vuông thành lưới hoặc ba ô cao hơn thì ảnh to gần gấp ba. Cần nhìn trên máy (chờ ios-dev).
- **g2. Hình ghép bốn mùa đọc theo hàng không ra thứ tự mùa.** Trên trái hoa đào, trên phải hoa phượng, dưới trái áo khoác, dưới phải lá vàng — đúng chiều kim đồng hồ như `_topic.md:296` và brief designer đã chốt, nhưng bé 5–7 đọc trái → phải, trên → dưới sẽ ra xuân, hè, **đông**, **thu**. ios-dev cũng nêu (ý 3). Quyết định thuộc PM: đổi hai ô dưới, hay ghi rõ là chủ ý.
- **g3. Ảnh mưa (`explore_rainy_season`) còn chữ nhỏ và một biển báo.** Tem chữ Lào hình bầu dục trên đầu xe tuk tuk và một biển báo tròn (biểu tượng, không chữ) bên phải. Ở cỡ hiện trên máy thì không đọc được, nên tester không tính vào L1; ghi lại để lượt crop sau biết.
- **g4. Bài 4 nay chỉ còn hai dạng câu và cả q3 lẫn q4 đều hai lựa chọn.** Sau khi q4 đổi sang `single_choice`, bé đoán vẫn qua ở lượt hai cho hai câu liền. content-editor đã ghi ở "Còn chưa chắc" và đề xuất thêm lựa chọn thứ ba (`q4.q4_dry`). Đạt luật (`min_formats: 2`), chỉ là độ khó.
- **g5. Ghi chú đã cũ ở `04-mua-mua-va-mua-kho.md:586`:** "mục `q4.q4_rain` trong file chọn ảnh không còn chỗ dùng" — designer đã bỏ hẳn mục đó khỏi `mua-mua-va-mua-kho.json` (file nay 33 mục, khớp đúng 33 node Image). Bỏ nửa câu đó để lượt rà sau khỏi đi tìm.
- **g6. Clip VI bị cờ `cut_end`:** trong 28 clip còn đánh dấu có **một clip cờ `cut_end`** — "Đúng rồi! Áo cộc tay mỏng và mát." (27 clip còn lại đều cờ `asr`, phần lớn là "lộc non", "ve kêu râm ran", "Xa-ha-ra", "cầu vồng"). Đề nghị Duy nghe clip `cut_end` trước, vì cờ này báo tiếng bị cắt cuối chứ không phải đọc chệch.
- **g7. Ô Học "Trời mưa" bài 1 nói "we wear a raincoat" nhưng ảnh là mưa trên căn nhà gỗ, không có áo mưa** (ios-dev cũng nêu, ý 4). Không sai khoa học; áo mưa có trên kệ Chơi và ở q1. content-editor cân nhắc đổi câu sang điều nhìn thấy, hoặc đổi ảnh.
- **g8. Danh sách `[CẦN KIỂM]` 46 ý nằm ở mục "content-editor 17/11" của ticket.** Tiêu chí ghi "chép vào mục Câu hỏi còn mở"; mục đó vẫn là bản PM viết 17/11 trước khi soạn. Người chuyên môn dễ đọc sót. Đề nghị pm trỏ liên kết hoặc gộp khi đóng ticket.

### Còn chờ người

- **Chờ người chuyên môn (PM1):** 66 dòng `[CẦN KIỂM]` (21 `_topic.md`, 45 ở sáu bài), gom thành 46 ý ở mục "content-editor 17/11". Nặng nhất: mốc tháng mùa mưa, mùa khô miền Nam; giờ tối ở Hà Nội mùa đông so với mùa hè; mùa nở hoa sữa, hoa mai, lá bàng đỏ; cách viết hoa "tháng Một"; nguồn Vosniadou–Brewer và Friedman; SGK Tự nhiên và Xã hội lớp hai dạy mùa thế nào; "phượng nở lúc nghỉ hè".
- **Chờ Duy:** nghe 28 clip VI còn đánh dấu (ưu tiên clip `cut_end` ở g6); nghe thử giọng EN "Tet", "banh chung", "banh tet", "Ho Chi Minh City", "Mid-Autumn", "blackboard tree", "bunches".
- **Chờ PM / designer:** L1, L2, L3 ở trên; nón lá `w1_hat` (ảnh nón lưu niệm, phiên chính 18/11 ghi "không chặn"); g1, g2.
- **Chờ ios-dev (không dùng simulator lượt này):** I3, P3 — bản đồ 5 chặng, chơi trọn một bài, thẻ "Ý sai → Ý đúng" ở Tổng kết, màn `order_sequence`, vùng chạm, VoiceOver đọc `alt`, cỡ thật của hình ghép `explore_clothes` và của ảnh phố Hà Nội.
- **Chưa kiểm:** tester chưa đọc mười trang lesson Oak Year 1 (chủ đề không bám Oak, `_topic.md:97` ghi rõ chưa ai đọc); chưa mở từng ảnh trong 118 asset (đã mở 58 ảnh khác nhau qua contact sheet và phóng to 6 ảnh).

## designer 18/11 · sửa sau chạy thử

Sửa theo "ios-dev 18/11 · chạy thử" (ý 1–3) và "Kiểm nghiệm thu (tester) 18/11" (L1, L2, L3, g1, g2). Chỉ sửa file chọn ảnh và hình ghép; không sửa `.md`, không đụng file của `sinh-vat-song-o-dau`.

- **Áo mưa `tray_raincoat` (ý 1): đổi ảnh.** Áo mưa cũ là áo choàng cánh dơi, không có tay áo, nên crop nào cũng chỉ ra một khối vàng. Ảnh mới: "Friesennerze" (Schneehase17, Public domain, Commons). Áo mưa vàng bóng, có mũ trùm, hai tay áo, túi, trải trên cỏ; phía sau có hai áo xanh than và một áo vàng khác. Không người, không chữ. Crop: kệ vuông sát chiếc áo vàng ở giữa (đủ mũ, thân, hai tay áo; đầu cổ tay hơi lẹm) (`tray_raincoat`, dùng ở bài 1, 4, 6 và bài 5 w1); `q1_raincoat` 5:2 (bài 1, bài 4 trỏ); `vocab.raincoat` 2:1.
- **Phố mùa đông `explore_winter` (ý 2, L1): đổi ảnh.** Ảnh phố Hà Nội 2/2008 không crop sạch được: biển số ô tô, biển hiệu, băng rôn, mã vạch hộp kẹo, và mặt người đi xe đạp ở tầm giữa vẫn rõ. Đã tìm thay ảnh phố Hà Nội mùa đông có người mặc áo ấm ở xa: Commons (cả chuỗi 36 ảnh Syced 2/2008, Winter in Vietnam, Fog in Vietnam, tìm theo tên phố tháng 12–2), Openverse/Flickr. Ảnh hợp giấy phép đều có người gần hoặc chữ; ảnh phố Hà Nội 2021–2026 đều CC BY-SA. Thay bằng ảnh **sương mù Hà Nội** đã có của chủ đề ("Fog in Hanoi, Vietnam in 5 March 2012", Banhtrung1, CC0; trang gốc ghi Hà Nội): một khoảng đường ướt trong sương dày, cây mờ, đèn đường xa; không tuyết, không người, không chữ. Mọi crop bỏ dải xe đỗ bên trái (có biển số) và giỏ rác: vuông (ô Học), 4:3 (bài 3 q6, câu `winter_means_snow`), 2:1 (từ `winter`, bài 6 q5 trỏ). Không còn chỗ nào dùng ảnh phố Hà Nội 2008.
- **Quả bóng `tray_ball` (L2): đổi ảnh.** Ảnh Red Inflatable Ball còn chữ "Baden", tem nhãn và chữ "DIAMONDBACK" trên lốp xe đạp ngay sau quả bóng; crop vuông nào lấy trọn quả bóng cũng còn chữ, nên không chép mục. Ảnh mới: "rubber ball convention" (frankieleon, CC BY 2.0, Openverse/Flickr): những quả bóng nảy cao su nhiều màu chụp gần trên nền trắng, không chữ. Mục gốc ở bài 1 (crop vuông); bài 6 đổi `same_as` sang mục bài 1. File của `sinh-vat-song-o-dau` giữ nguyên.
- **Lá vàng `q4_yellow` (L3): đổi ảnh.** Ảnh mới: "2024-10-24 - vivid yellow ginkgo leaf on distant twig against a blue sky - DSM4694" (Franz van Duns, CC BY 4.0, Commons): lá bạch quả vàng tươi, lành, trên cành nhỏ, nền trời xanh trong. Không tìm được ảnh lá vàng của cây hay gặp ở Việt Nam vừa hợp luật vừa sạch; lá bàng đã là lá đỏ của chủ đề (`almond_card`), dùng làm lá vàng thì lẫn. Crop: vuông `q4_yellow` (bài 3 q4, hình ghép bốn mùa), 4:3 `w2` (bài 3 w2, q2 trỏ), 5:2 `q3_yellow` (bài 2 q3, bài 6 q3 trỏ; hình ghép 2:1).
- **Hình ghép bốn mùa (ý 3, g2): ghép lại** `mua-xuan-va-mua-he.learn.explore.explore_seasons.jpg` (1024×1024) và `…vocab.season.jpg` (1024×512). Đọc trái → phải, trên → dưới: hoa đào (xuân), phượng (hè), lá bạch quả vàng (thu), áo phao (đông). Thứ tự `parts` vốn đã là xuân, hè, thu, đông, nay trùng thứ tự đọc; sửa `note` hai mục. Hình này đi theo tới bài 4 q6, bài 5 từ `year`, bài 6 "Miền Bắc" và q6.
- **Hình ghép `explore_clothes` (g1): ghép lại** thành ba ô vuông 506 px: hàng trên áo khoác, sơ mi tay dài; hàng dưới ở giữa áo cộc tay (đọc vẫn dày → mỏng). Ô to gấp 2,3 lần bản ba ô một hàng; giấy trống còn khoảng 1/4 khung. Khi ghép to, lộ chữ "HangSavvy" in nổi trên móc ở cổ áo sơ mi (`q4_long_sleeve`, có từ 17/11, cũng có ở thẻ bài 6 q4): dời crop xuống (top 0,31) bỏ chữ; mất cổ và vai, còn thân áo và hai tay áo dài. Ghép lại cả `vocab.clothes` (2:1) cho cùng ảnh.
- **Các hình ghép khác:** `explore_south`, `change` (trái mưa to, phải đường khô: mùa mưa → mùa khô) đúng ý bài, không đổi. `clothes` 2:1 giữ một hàng ba ô (vừa khung), chỉ ghép lại vì ảnh sơ mi đổi crop.

**`images fetch content/images/explorer/thoi-tiet-va-cac-mua`:** lượt cuối **6 file · 107 ảnh khác nhau · 0 lỗi · 0 cảnh báo tỉ lệ**, không dòng "Chưa kiểm tỉ lệ"; hình tự vẽ 4, hình ghép 6 (4 ghép mới), **0 chờ ghép**. Giữa chừng Commons trả 429 nhiều lượt (upload.wikimedia.org, Retry-After 120–600 s), đã dừng hẳn 15 rồi 30 phút trước khi chạy lại. Ảnh Flickr quả bóng: đã mở trang gốc, ghi CC BY 2.0. Credit CC BY ghi đúng title, tác giả như nguồn (fetch kiểm).

**Cần content-editor sửa `.md` (designer không sửa):**

| Chỗ | Hiện tại | Đề xuất |
| --- | --- | --- |
| Bài 1 `tray_raincoat` và mọi chỗ dùng lại (bài 1 q1, từ `raincoat`; bài 4 kệ, q1; bài 5 w1; bài 6 kệ), `_topic.md` bảng Hình dùng chung, bảng `alt` | brief: áo mưa cánh dơi treo trên móc, mũ trùm gấp sau lưng; `alt` "A raincoat on a hook" · "Chiếc áo mưa treo trên móc" | brief: "áo mưa vàng có mũ trùm và hai tay áo, trải trên cỏ, phía sau có vài áo mưa khác"; `alt` "A yellow raincoat with a hood" · "Chiếc áo mưa vàng có mũ" |
| Bài 3 `explore_winter`, q6, từ `winter`; bài 6 q5 `q5_winter`; `_topic.md` (Học bài 3, Hình dùng chung, bảng `alt`, Ảnh khó) | brief: phố mùa đông, người ở xa mặc áo khoác; `alt` "People in coats on a street" · "Người mặc áo ấm trên phố" | brief: "một khoảng đường ở Hà Nội trong sương mù dày buổi sáng mùa đông, mặt đường ướt, không người, không tuyết"; `alt` "A foggy winter street" · "Phố mùa đông trong sương mù". Tên Hà Nội khớp trang gốc, giữ được. Ảnh này nay trùng ảnh `q5_winter` của bài 3 (khác crop): cân nhắc cho bài 3 q5 lựa chọn mùa đông dùng ảnh áo phao `explore_cold` thay sương mù, để bé không thấy cùng một cảnh hai lần trong một bài |
| Bài 1, bài 6 `tray_ball` | brief: dùng lại `q1_ball` của `sinh-vat-song-o-dau`; `alt` "A round ball" · "Quả bóng tròn" | brief: "[ảnh] những quả bóng nảy cao su nhiều màu chụp gần, không chữ"; bài 6 trỏ "Dùng lại hình `tray_ball` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`"; `alt` "Colourful rubber balls" · "Những quả bóng cao su nhiều màu" (nhãn "Ball" · "Quả bóng" giữ) |
| Bài 3 `q4_yellow` (gốc), w2, q2; bài 2 q3_yellow; bài 6 q3_yellow; `_topic.md` | brief "một chiếc lá vàng còn trên cành, chụp gần, nền mờ" | brief: "nền trời xanh" thay "nền mờ" (lá bạch quả vàng trên cành nhỏ); `alt` "A yellow leaf on a branch" · "Chiếc lá vàng trên cành" giữ |
| Bài 2 `explore_seasons`, `season`; `_topic.md:296` | "theo chiều kim đồng hồ" | "đọc trái → phải, trên → dưới: xuân, hè, thu, đông" |
| Bài 6 `explore_clothes` | ba ô một hàng | "hai ô trên (áo khoác, sơ mi tay dài), một ô dưới giữa (áo cộc tay)"; `q4_long_sleeve`: "thấy thân áo và hai tay áo dài, không thấy móc" |

**Còn chưa chắc:** ảnh mùa đông không còn người mặc áo ấm (câu Học "We wear coats and scarves" không có hình minh hoạ áo; ô `explore_cold` ở bài 1 có áo phao); ảnh sương mù chụp 5/3 (cuối đông theo âm lịch). Lá bạch quả không phải cây Việt Nam. Áo mưa có vết bẩn nhỏ. Ảnh bóng là nhiều quả, không phải một. Cần ios-dev xem lại trên máy: hình ghép áo mới, áo mưa ở ô 4:3 bài 5 w1.

## content-editor 18/11 · khớp chữ sau đổi ảnh

Nháp AI, chưa duyệt. Sửa theo bảng "designer 18/11 · sửa sau chạy thử", ios-dev ý 4 và tester g5, g7. Chỉ sửa trong `content/explorer/thoi-tiet-va-cac-mua/`. Không đổi key, `id`, DOK, format, đáp án. **Chưa chạy `validate`** (không có shell): phiên chính chạy.

**Chữ bé nghe đã đổi (chạy lại TTS EN và VI):**

| Chỗ | Cũ | Mới |
| --- | --- | --- |
| Bài 1 ô Học `explore_rainy` `sentence` | "On rainy days, we wear a raincoat." · "Trời mưa, mình mặc áo mưa." | "Rain falls and everything gets wet." · "Mưa rơi xuống, mọi thứ đều ướt." |
| Bài 1 `explore_rainy` `examples.1` | "rubber boots for puddles" (lên số 2, chữ giữ) | "we wear a raincoat" · "mình mặc áo mưa" |
| Bài 1 `explore_rainy` | ví dụ "the roads get wet" · "đường sá ướt hết" | bỏ (ảnh không thấy đường; câu ví dụ của từ `rainy` vẫn giữ ý này) |
| Bài 3 ô Học `explore_winter` `sentence` | "Winter is cold. We wear coats and scarves." · "Mùa đông trời lạnh. Mình mặc áo khoác, quàng khăn." | "Winter is cold. Mornings are often foggy." · "Mùa đông trời lạnh. Sáng sớm thường có sương mù." |
| Bài 3 `explore_winter` `examples.2` | "foggy mornings" · "sáng sớm có sương mù" | "we wear coats and scarves" · "mình mặc áo khoác, quàng khăn" |
| Bài 3 q5 `prompt` | "Red leaves, warm coats. Which season is it?" · "Lá bàng đỏ, áo khoác ấm. Đang là mùa nào?" | "Red leaves, foggy mornings. Which season is it?" · "Lá bàng đỏ, sáng sớm có sương mù. Đang là mùa nào?" |
| Bài 3 q5 `explanation_correct` | "Yes! Winter mornings are often foggy." · "Đúng rồi! Sáng mùa đông thường có sương mù." | "Yes! We wear warm coats in winter." · "Đúng rồi! Mùa đông mình mặc áo khoác ấm." |
| Bài 3 từ `winter` `example` | "In winter, we wear warm coats." · "Mùa đông, mình mặc áo khoác ấm." | "Winter mornings can be cold and foggy." · "Sáng mùa đông trời lạnh và có sương mù." |
| Bài 6 q5 `q5_winter` `feedback` | "People wear warm coats in winter." · "Mùa đông, mọi người mặc áo ấm." | "Winter mornings are cold and foggy." · "Sáng mùa đông trời lạnh và có sương mù." |

Mọi câu EN mới ≤ 7 từ; `feedback` bài 6 nói dấu hiệu trên ảnh, không gọi tên đáp án (mùa xuân); không câu nào nói vị trí thẻ. Ý "mặc áo ấm mùa đông" vẫn dạy ở ý chính hai bài 3, ví dụ hai ô Winter và kệ Chơi.

**`alt` đổi (VoiceOver đọc, không có clip TTS):**
- `tray_raincoat` và mọi chỗ dùng lại (bài 1 kệ, q1, từ `raincoat`; bài 4 kệ, q1; bài 5 w1; bài 6 kệ): "A yellow raincoat with a hood" · "Chiếc áo mưa vàng có mũ".
- `explore_winter` và mọi chỗ dùng lại (bài 3 ô Học, q6, từ `winter`; bài 6 q5): "A foggy winter street" · "Phố mùa đông trong sương mù".
- `tray_ball` (bài 1, bài 6): "Colourful rubber balls" · "Những quả bóng cao su nhiều màu"; nhãn "Ball" · "Quả bóng" giữ.
- Bài 3 q5 `q5_winter`: "A warm coat on a hanger" · "Chiếc áo khoác ấm trên móc" (alt gốc `explore_cold`).
- Lá vàng, hình ghép bốn mùa, `explore_clothes`, `q4_long_sleeve`: `alt` giữ.

**`brief` sửa theo ảnh mới:** `tray_raincoat` (áo vàng có mũ, hai tay áo, trải trên cỏ); `explore_winter` (đường Hà Nội trong sương mù, không người; truy vấn đầu "fog in Hanoi"); `tray_ball` (gốc mới ở bài 1, `[ảnh]`; bài 6 trỏ "Dùng lại hình `tray_ball` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`"); `q4_yellow` bài 3 ("nền trời xanh" thay "nền mờ", ghi lá bạch quả); `explore_seasons` bài 2 ("đọc trái → phải, trên → dưới ra xuân, hè, thu, đông"); bài 6 `explore_clothes` (hai ô trên áo khoác, sơ mi tay dài; một ô dưới giữa áo cộc tay; bản 2:1 một hàng) và `q4_long_sleeve` (thấy thân áo, hai tay áo dài, không thấy móc). Ghi chú cho hoạ sĩ các bài sửa theo.

**`_topic.md`:** Khung Học bài 1 (`explore_rainy`) và bài 3 (`explore_winter`); bảng Hình gốc (`tray_raincoat`, thêm dòng `tray_ball` · 1, `explore_seasons`, `explore_winter`, `q4_yellow`, `explore_clothes`, `q4_long_sleeve`; `explore_cold` thêm "3 (q5_winter)"; **bỏ dòng `q5_winter` · 3**); bảng `alt` (`tray_raincoat`, thêm `tray_ball`, `explore_winter`; bỏ `q5_winter`) kèm một dòng ghi chú 18/11; bảng Hình của chủ đề khác: dòng `q1_ball` ghi "Không dùng nữa"; Khung Quiz bài 3 q5; dòng đếm ảnh mới (số không đổi: thêm `tray_ball`, bỏ `q5_winter`).

**Quyết định (việc 2): đổi thẻ mùa đông bài 3 q5 sang ảnh áo phao `explore_cold`.** Lý do: ảnh sương mù nay là ảnh ô Học Winter, câu q6 và từ `winter`; để nguyên thì bé chọn theo trí nhớ hình vừa xem, câu DOK 2 thành nhận diện. Bài 2 q5 đã dùng áo phao cho thẻ mùa đông, nên hai bài nhất quán. Vì ảnh đáp án là áo khoác, `prompt` đổi "warm coats" thành "foggy mornings" để dấu hiệu trên ảnh không trùng chữ câu hỏi (sương mù được dạy ở câu chính ô Winter).

**JSON cần phiên chính sửa** (content-editor không sửa JSON):
1. `content/images/explorer/thoi-tiet-va-cac-mua/mua-thu-va-mua-dong.json`, mục `"q5.q5_winter"`: thay cả mục ảnh sương mù (crop 5:2) bằng
   `{ "same_as": "q1.q1_coat", "lesson": "thoi-tiet-va-cac-mua/thoi-tiet-hom-nay" }` (giống `q5.q5_winter` của `mua-xuan-va-mua-he.json`).
2. Cùng file, `note` của `learn.explore.explore_winter` còn câu "Cùng ảnh gốc với `q5_winter`": sửa hoặc bỏ cho khỏi lạc (không ảnh hưởng build).
3. Không cần mục mới nào khác: áo mưa, quả bóng, lá vàng, hai hình ghép designer đã sửa; bài 6 `tray_ball` đã trỏ bài 1.
Sau đó chạy `images fetch` (bài 3 vẫn đủ số mục, chỉ một mục đổi sang `same_as`), `ids` không cần (không thêm khối), `validate`, TTS cho tám cặp chuỗi EN · VI mới ở bảng trên, `build`.

**Dọn ghi chú (không đổi chữ bé nghe):**
- g5: `04-mua-mua-va-mua-kho.md` Ghi chú cho hoạ sĩ (câu q4) và Ghi chú cho dev (q4 đổi format) không còn nhắc `q4.q4_rain`/`q4_rain`; ghi "bỏ thẻ mưa to (đã bỏ cả mục ảnh trong file chọn ảnh)".
- `01` ghi chú dưới `explore_cold` còn tên cũ `tray_long_sleeve` → `q4_long_sleeve`.
- `03` ghi chú thẻ hoa sữa: "không dùng sương mù (đã là ảnh ô Học Winter và câu q6)".

**Còn chưa chắc:**
- Bài 3 q5 giờ nghe "foggy mornings" và câu chính ô Winter cũng nói sương mù, nên bước "nhận ra mùa" dễ hơn; bước chọn ảnh áo khoác vẫn là áp dụng. Tester xem có còn đạt DOK 2 không.
- Ảnh sương mù chụp 5/3 (cuối đông, đầu xuân theo dương lịch); chữ chỉ nói "sáng mùa đông thường có sương mù", vẫn nằm dưới dòng `[CẦN KIỂM]` sẵn có.
- Câu "Rain falls and everything gets wet." đúng ảnh mưa trên căn nhà gỗ; bé thấy áo mưa ở ví dụ một chỉ bằng lời, ảnh áo mưa có ở kệ Chơi ngay sau.

## Phiên chính 18/11 · sau đổi ảnh và khớp chữ

- Sửa `mua-thu-va-mua-dong.json`: `q5.q5_winter` → `same_as q1.q1_coat` (ảnh áo phao, theo content-editor); bỏ câu "Cùng ảnh gốc với `q5_winter`" trong note `explore_winter`.
- `images fetch` 6 file: 106 ảnh, 0 lỗi, 0 chờ ghép. `validate` chủ đề: 0 lỗi, 7 cảnh báo `md_needs_check`.
- TTS chạy lại: VI 560 clip, còn đánh dấu 28 (báo cáo `content/.audio/report-thoi-tiet-va-cac-mua-01_02_03_04_05_06-vi.json`).
- Build gói 12 chủ đề (Explorer 5 + Discoverer 7; chưa gồm co-the-cua-em của SK-049 vì ảnh chưa tải): 1435 ảnh, check-pack OK, 0 lỗi.
- Chưa chạy lại trên iPhone 16 sau đổi ảnh: còn xem hình ghép áo bài 6 và áo mưa ở ô bài 5 w1.

**Chờ người thật trước khi done:** chuyên môn duyệt 46 ý `[CẦN KIỂM]`; Duy nghe 28 clip VI bị đánh dấu; tester xem bài 3 q5 ("foggy mornings") còn đạt DOK 2 không.
**Việc sau (không chặn):** hai lỗi bố cục app (nút VI/loa đè ảnh ở recap; thanh dưới che thẻ khi sai câu đúng/sai); nón lá `w1_hat` là đồ lưu niệm; script vẽ hình chỉ nằm ở scratchpad.
