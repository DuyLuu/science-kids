# SK-051 · Explorer #7 "Cây quanh em" (Plants around us, 7 bài), gộp Explorer #7 và #10 cũ

Trạng thái: todo · Ngày: 2026-11-18 · Phụ trách: dev (danh mục, luật validate) · content-editor (soạn) · designer (ảnh, icon) · ios-dev (test, icon mặc định) · phiên chính chạy lệnh · Tester: tester
Nguồn: Duy 18/11 (chốt danh sách và thứ tự 7 bài, rồi "ok start"; chế độ auto, chốt theo khuyến nghị PM); [docs/syllabus-review-2026-11-18.md](../syllabus-review-2026-11-18.md) mục 2 (nguyên tắc N: tự nhiên là chính, Oak là kho tham khảo, một bài gộp được nhiều lesson) và mục 4.1 (#7, danh sách bỏ); [docs/oak/identifying-plants-and-their-basic-parts.md](../oak/identifying-plants-and-their-basic-parts.md), [docs/oak/growing-plants.md](../oak/growing-plants.md) (khung Oak từng lesson, misconception, lưu ý VN); `content/syllabus.json` (Explorer #7 `identifying-plants-and-their-basic-parts`, #10 `growing-plants`); `packages/content-schema/scripts/lib/syllabus.mjs` (luật `extension`); `content/TEMPLATE.md` (bảy luật Explorer, SK-044, SK-047); `content/rules.json` (`explorer.authoring`); `content/explorer/sinh-vat-song-o-dau/05-noi-song-cua-cay.md`; SK-049, SK-050 (khuôn gần nhất)

> **Chốt 18/11.** Duy chốt 7 bài và thứ tự, rồi nói "ok start". Phần còn lại của lộ trình 18/11 (34 chủ đề / 236 bài) **vẫn chờ Duy chốt**; ticket này chỉ làm #7 và bỏ #10 vì #10 đã gộp vào #7. Các quyết định danh mục dưới đây PM chốt theo chế độ auto; Duy xem lại khi review.

## Mục tiêu

Bé Explorer 5–7 tuổi biết cây là vật sống mọc lên từ hạt và cần nước, ánh sáng, hơi ấm; gọi tên được rễ, thân, cành, lá, hoa trên cây to và cây có hoa; nhận ra rau quả trên mâm cơm là bộ phận nào của cây; và thấy lá, hoa có nhiều hình, nhiều màu, chỉ bằng nghe và nhìn.

## Phạm vi / Ngoài phạm vi

### Phạm vi

- **Danh mục** (`content/syllabus.json`):
  - Giữ chủ đề Explorer #7, key `identifying-plants-and-their-basic-parts`, `source` giữ nguyên (`kind: oak`, `unit_slug` như key, `year: 1`, `unit_index: 4`), `strand: plants_animals`, `level: 1`. Đổi `title.en` thành **"Plants around us"**; `title.vi` giữ "Cây quanh em".
  - Thay 7 bài cũ bằng 7 bài ở bảng dưới (tên EN/VI đúng từng chữ). Bài 1–4, 6, 7 ghi `oak_lessons` là slug gốc, `statutory: true`. Bài 5 `oak_lessons: []`, `statutory: false`, `extension: true`.
  - Bỏ hẳn chủ đề Explorer #10 `growing-plants` (đã gộp vào #7). Đánh lại số: `new-life` #11 → #10, `healthy-me` #12 → #11.
  - **Nới luật `extension`** để bài mở rộng đứng giữa các bài Oak (bài 5 nằm giữa bài 4 và bài 6). Lý do và các phương án ở "Quyết định đã ghi" mục 2.
- **Chủ đề** `content/explorer/cay-quanh-em/`: `_topic.md` và 7 bài. Tên bài là tên danh mục; content-editor không tự đổi:

  | # | Bài (EN · VI) | Lesson Oak gốc (`oak_lessons`) | `stage` | Misconception (câu 6) |
  | --- | --- | --- | --- | --- |
  | 1 | Plants from seeds · Cây mọc lên từ hạt | `plants-from-seeds` (Y2 *Growing plants* L1) | `opener` | `trees_not_from_seeds` |
  | 2 | What plants need to grow · Cây cần gì để lớn? | `what-plants-need-to-grow-and-stay-healthy`, `plants-without-water`, `plants-without-warmth`, `plants-without-light` (Y2 L3, L5, L6, L7) | `core` | `more_water_is_better` |
  | 3 | Parts of a tree · Cây to: rễ, thân, cành, lá | `structure-of-a-tree` (Y1 L2) | `core` | `trees_not_plants` |
  | 4 | Parts of a flowering plant · Cây có hoa: rễ, thân, lá, hoa | `structure-of-a-flowering-plant` (Y1 L5) | `core` | `plant_same_all_year` |
  | 5 | Plant parts we eat · Rau quả ta ăn là phần nào của cây? | — (bài mới, `extension: true`) | `apply` | `food_not_from_plants` |
  | 6 | Leaves of many shapes · Lá cây nhiều hình, nhiều cỡ | `naming-trees` (Y1 L3) | `core` | `all_leaves_look_same` |
  | 7 | Flowers of many colours · Hoa nhiều màu, nhiều hình | `common-flowering-plants` (Y1 L6) | `review` | `all_plants_have_flowers` |

- File chọn ảnh `content/images/explorer/cay-quanh-em/*.json`. Giữ icon chủ đề #7; bỏ icon `growing-plants`.
- Phiên chính chạy `validate`, `ids`, `images fetch`, `tts`, `build`, `check-pack`; chạy thử một bài trên iPhone 16.

### Bảng soạn

**`_topic.md`:**
- `age_group: explorer`, `order: 7`, `strand: plants_animals`, `level: 1`.
- `difficulty`: content-editor chấm theo `syllabus-progression.md` mục 3 và ghi lý do. Nếu ra Mức khác 1, ghi lý do và báo dev sửa `level` trong danh mục cùng lượt ghi id.
- `prerequisites: [sinh-vat-song-o-dau]` (cây là vật sống; nơi sống của cây).
- `is_free: false`, `sensitive: false`, `ai_draft: true`, `oak_unit_ref` là `identifying-plants-and-their-basic-parts`.
- Câu hỏi lớn: "How do plants live and grow around us?" · "Cây quanh em sống và lớn lên thế nào?".
- Thẻ thưởng: bộ mới `set: plants` (ios-dev thêm khoá `collectible.set.plants` "Plant cards" · "Thẻ cây").
- Mục Nguồn ghi câu Duy 18/11 và slug Oak của từng bài, kể cả 4 slug của bài 2 (Y2 *Growing plants*). Mục "Lệch so với sườn" ghi:
  - gộp hai unit Oak (Y1, Y2);
  - bài 2 gộp 4 lesson;
  - bỏ 6 lesson: Y1 L1, L4, L7; Y2 L2, L4, L8;
  - đổi thứ tự (Duy 18/11);
  - thêm bài 5.

| Bài | Ý chính (EN · VI) | Misconception: câu sai · câu sửa · nguồn | Vật, cảnh trong bài | Ảnh mới chính (từ khoá EN) | Dùng lại |
| --- | --- | --- | --- | --- | --- |
| 1 · Cây mọc lên từ hạt | 1. Many plants grow from seeds. · Nhiều cây mọc lên từ hạt.<br>2. Seeds have many shapes and sizes. · Hạt có nhiều hình, nhiều cỡ.<br>3. The root grows down. The shoot grows up. · Rễ mọc xuống, mầm vươn lên. | "Big trees do not grow from seeds." · "Cây to không mọc lên từ hạt." → "A big mango tree grows from a seed." · "Cây xoài to cũng mọc lên từ một hạt." Nguồn: Oak L1 *Plants from seeds* (misconception và exit quiz: cây to cũng mọc từ hạt). Phương án khác `plants_pop_out_of_soil` (cây tự mọc từ đất) | Mở đầu: cây quanh nhà, quanh trường (ý của Y1 L1). Hạt đậu xanh, đậu đen, hạt bí, hạt mít, hạt xoài; hạt nảy mầm: rễ xuống, mầm lên; cây con; cây xoài to. Thẻ thưởng: content-editor chọn | `mung bean seeds` · `jackfruit seeds` · `mango seed sprouting` · `bean germination root shoot` · `seedling soil` · `mango tree` | Cây, lá của *Sinh vật sống ở đâu?* bài 1, 3 (content-editor tìm key) |
| 2 · Cây cần gì để lớn? | 1. Plants need water, light and warmth. · Cây cần nước, ánh sáng và hơi ấm.<br>2. With no water, a plant wilts. · Thiếu nước, cây héo rũ.<br>3. With no light, leaves turn pale. · Thiếu ánh sáng, lá vàng nhợt. | "Plants grow best with lots of water." · "Tưới càng nhiều nước, cây càng tốt." → "Too much water is bad for plants, too." · "Tưới quá nhiều nước, cây cũng yếu." Nguồn: Oak L5 *Plants without water*. Phương án khác `hotter_is_better` (Oak L6), `dark_makes_plants_short` (Oak L7) | Hai chậu cây cạnh nhau: một chậu đủ cả, một chậu thiếu một thứ. Chậu quên tưới héo rồi tưới lại thì tươi; giá đỗ ủ tối thân trắng; cỏ dưới tấm bạt vàng; nắng gắt giữa trưa làm lá rau héo; rét đậm phải che mạ | `wilted potted plant` · `bean sprouts` · `yellow grass under tarp` · `rice seedlings covered plastic` · `watering can plant` | Xương rồng, bóng râm, `dry` · `wet` của *Sinh vật sống ở đâu?* bài 5; bình tưới của *Thời tiết và các mùa* bài 4 |
| 3 · Cây to: rễ, thân, cành, lá | 1. A tree is a plant, too. · Cây to cũng là thực vật.<br>2. Roots hide under the ground. · Rễ cây nằm dưới đất.<br>3. The trunk holds up the branches and leaves. · Thân cây đỡ cành và lá. | "A tree is not a plant." · "Cây to không phải là thực vật." → "A tree is a plant, too." · "Cây to cũng là thực vật." Nguồn: Oak L2 *Structure of a tree*. Phương án khác `roots_not_part_of_plant` (Oak exit quiz: hình cây thiếu rễ) | Cây bàng, cây phượng, cây xoài; vỏ cây; cành mang lá, hoa, quả; hình cây thiếu rễ, bé chọn phần thiếu. Không dùng cây đa làm hình chính (rễ phụ thòng xuống) | `Terminalia catappa tree` · `tree bark close-up` · `tree roots exposed` · `mango tree fruit branch` | Cây phượng, lá bàng của *Thời tiết và các mùa* bài 2, 3 và *Sinh vật sống ở đâu?* bài 3 (`almond_card`) |
| 4 · Cây có hoa: rễ, thân, lá, hoa | 1. A flowering plant has roots, a stem, leaves and flowers. · Cây có hoa có rễ, thân, lá và hoa.<br>2. Look closely to see each part. · Nhìn kỹ để thấy từng bộ phận.<br>3. A plant changes: bud, flower, then fruit. · Cây đổi dần: nụ, rồi hoa, rồi quả. | "A plant looks the same all year." · "Cây lúc nào trông cũng như nhau." → "A plant has buds, then flowers, then fruit." · "Cây có nụ, rồi ra hoa, rồi kết quả." Nguồn: Oak L5 (ý chính 5; exit quiz cây thuỷ tiên lúc không có hoa). Phương án khác `all_plants_look_same` (misconception trên trang Oak L5) | Cây có hoa trong chậu thấy đủ rễ (hoa mười giờ, cúc); nụ, hoa, quả trên cây bí hoặc cây ớt; nhắc "cây còn có quả và hạt" để nối bài 5 | `potted flowering plant roots visible` · `Portulaca grandiflora` · `pumpkin flower bud` · `chili plant flower fruit` | Hoa của *Thời tiết và các mùa* bài 2 |
| 5 · Rau quả ta ăn là phần nào của cây? | 1. The food we eat comes from plants. · Rau quả ta ăn đều từ cây mà ra.<br>2. We eat roots, stems and leaves. · Ta ăn rễ, thân và lá của cây.<br>3. We eat flowers, fruits and seeds, too. · Ta còn ăn hoa, quả và hạt. | "Carrots do not come from plants." · "Cà rốt không phải là một phần của cây." → "A carrot is the root of a plant." · "Cà rốt là rễ của cây." Nguồn: Oak *Growing plants* starter quiz L1, L3 (mọi rau ta ăn đều từ cây; ăn được một số phần của cây). Phương án khác `we_only_eat_fruit` | Mâm cơm hằng ngày. Rễ: cà rốt, củ cải. Thân: rau muống, mía. Lá: rau cải, xà lách. Hoa: súp lơ, hoa bí. Quả: chuối, cam, xoài, cà chua. Hạt: đậu, lạc, hạt sen. Bảy bộ phận vừa học ở bài 3–4, thêm quả và hạt | `carrot with leaves` · `daikon radish` · `water spinach` · `sugarcane stalks` · `mustard greens` · `cauliflower` · `squash blossoms food` · `tomato plant fruit` · `peanuts in shell` · `lotus seeds` · `Vietnamese family meal` (không người nhìn rõ mặt) | Xoài, chanh, chuối của *Cơ thể của em* bài 6 và *Thời tiết và các mùa* (content-editor tìm key); hoa sen của *Sinh vật sống ở đâu?* bài 5 |
| 6 · Lá cây nhiều hình, nhiều cỡ | 1. Leaves come in many shapes and sizes. · Lá cây có nhiều hình, nhiều cỡ.<br>2. Look closely to compare leaves. · Nhìn kỹ để so sánh các chiếc lá.<br>3. A leaf can help us name a tree. · Nhìn lá có thể biết tên cây. | "All leaves look the same." · "Lá cây nào cũng giống nhau." → "Leaves have many shapes and sizes." · "Lá cây có nhiều hình, nhiều cỡ." Nguồn: Oak L3 *Naming trees*. Phương án khác: nhắc lại `trees_not_plants` (Oak khuyên lặp ý này ở L3), nhưng key mỗi chủ đề chỉ dùng một lần nên phải viết câu khác key | Lá bàng to, tròn bầu; lá chuối rất to, dài; lá dừa xẻ nhiều lá nhỏ; lá phượng gồm rất nhiều lá li ti; nối lá với cây | `banana leaf` · `coconut palm frond` · `Delonix regia leaves close-up` · `Terminalia catappa leaf` | Lá bàng đỏ `almond_card`; cây phượng (bài 3 chủ đề này hoặc *Thời tiết và các mùa* bài 2) |
| 7 · Hoa nhiều màu, nhiều hình | 1. Some plants have flowers. Some do not. · Có cây có hoa, có cây không có hoa.<br>2. Flowers come in many colours and shapes. · Hoa có nhiều màu, nhiều hình.<br>3. We look at flowers, we do not pick them. · Mình ngắm hoa, không hái hoa. | "Every plant has flowers." · "Cây nào cũng có hoa." → "A fern has no flowers." · "Cây dương xỉ không có hoa." Nguồn: Oak L6 *Common flowering plants* (misconception: cây nào cũng có hoa quanh năm). Phương án khác `all_flowers_look_same` | Hoa sen, hoa mai, hoa đào, hướng dương, hoa giấy; dương xỉ, rêu làm ví dụ cây không có hoa. Bài `review`: Khởi động ôn trộn bài 1–6 | `sunflower` · `Bougainvillea` · `fern fronds` · `moss` | Hoa đào, hoa mai (*Thời tiết và các mùa* bài 2, 5); hoa sen (*Sinh vật sống ở đâu?* bài 5) |

**Từ vựng gợi ý** (`core` · `extra`; content-editor chốt, mỗi bài 4–5 từ, 2–3 `core`):
- bài 1: seed, shoot · root, soil;
- bài 2: water, light, warm · wilt;
- bài 3: tree, trunk, branch · bark;
- bài 4: stem, flower · bud, fruit;
- bài 5: vegetable, fruit · (một từ bộ phận);
- bài 6: leaf, shape · big, small;
- bài 7: petal, colour · fern.

Từ đã có ở chủ đề khác:
- `plant` (#1 bài 6), `leaf` (#2 bài 3), `grow` (#2 bài 1), `flower`, `warm` (#5 bài 2, 6), `shade`, `cactus`, `dry`, `wet` (#2 bài 5).
- Dùng lại thì thêm dòng `>` ghi trùng có chủ ý, như `dry_season` ở SK-050.
- **`trunk` đã là vòi voi** ở `goi-ten-va-nhom-dong-vat/05-co-the-cac-con-vat.md:620`. Bài 3 dùng key khác (gợi ý `tree_trunk`, chữ "trunk" · "thân cây") và ghi rõ nghĩa ở dòng `>`. content-editor kiểm tab Từ vựng của app có gộp theo chữ hay không; nếu gộp theo chữ thì báo PM.

**Câu `order_sequence` gợi ý** (mỗi câu đúng một thứ tự):
- bài 1: hạt → hạt nảy mầm → cây con;
- bài 2: chậu cây tươi → bắt đầu héo → khô rũ (không tưới một ngày, một tuần, một tháng; không nói số ngày trong chữ bé nghe nếu khó);
- bài 3: rễ → thân → lá, từ dưới lên;
- bài 4: nụ → hoa → quả.

Bài 5–7 tuỳ content-editor.

**Khởi động:**
- bài 1 có một câu ôn *Sinh vật sống ở đâu?* bài 1 (cây là vật sống);
- bài 2 có một câu ôn *Sinh vật sống ở đâu?* bài 5 (cây cần nước, ánh sáng);
- bài 7 ôn trộn bài 1–6 và có một câu ôn chủ đề cách khoảng một tháng.

**Ranh giới với bài đã soạn:**
- *Nơi sống của cây* (`sinh-vat-song-o-dau/05`) đã dạy: "Plants need water, light and air", mỗi loài một nơi sống, xương rồng cần ít nước (q2), sen cần ao (q6).
- Bài 2 nhắc lại nước và ánh sáng, thêm hơi ấm và dấu hiệu thiếu (héo, vàng nhợt, hồi lại khi chữa kịp).
- Bài 2 không dạy lại nơi sống. Không dùng lại câu xương rồng hay sen làm câu hỏi.
- Không nói "cây cần đất", vì sen, bèo sống trong nước (ghi chú ở bài 5 #2).

### Ngoài phạm vi

- Trồng, gieo, theo dõi cây nhiều tuần; thí nghiệm "chỉ bỏ một thứ" (fair test); đo bằng thước, cm, nhiệt kế, ℃ (bỏ theo lộ trình 18/11).
- Lesson Oak đã bỏ: Y1 L1 *Plants around our school or home* (thành phần mở đầu bài 1), L4 *Deciduous and evergreen trees*, L7 *Wildflowers*; Y2 L2 *Plants from bulbs*, L4 *Plant health and growth*, L8 *Grow your own food*.
- Quang hợp; rễ hút nước, nước đi trong thân; lá làm thức ăn (nếu nói thì chỉ một câu "lá giúp cây làm thức ăn", không giải thích); thụ phấn; vòng đời đầy đủ của cây. Các ý này thuộc Discoverer *Cây sống thế nào?* trong lộ trình 18/11.
- Khoai tây, khoai lang, hành, gừng làm ví dụ bộ phận (dễ nhầm rễ và thân).
- Rủ bé ăn, nếm lá, hoa, quả, hạt lạ; hái hoa; app nhận diện cây.
- Các thay đổi khác của lộ trình 18/11 chưa làm trong ticket này, chờ Duy chốt cả bản rà:
  - bỏ *Vật liệu quanh em*, *Vật liệu dùng làm gì?*, *Em khoẻ mạnh*;
  - đổi *Sự sống mới* thành *Lớn lên*;
  - thêm *Núi, sông và biển*, *Nước quanh em*, *Bầu trời ngày và đêm*;
  - mọi thay đổi của Discoverer, Scientist;
  - viết lại `syllabus-lessons.md`, `prd.md`, `technical-plan.md` theo 34 chủ đề / 236 bài.
- Dạng câu mới, màn app mới.

## Tiêu chí nghiệm thu

### Bước 0 · danh mục, luật, tài liệu
- [x] **dev:** `content/syllabus.json`:
  - Explorer #7 key `identifying-plants-and-their-basic-parts`, `title` "Plants around us" · "Cây quanh em", `source` giữ nguyên, `strand: plants_animals`, `level: 1`;
  - đúng 7 bài, thứ tự, tên EN/VI, `oak_lessons`, `statutory` như bảng "Phạm vi"; bài 5 `extension: true`;
  - không còn key `growing-plants`; `new-life` là #10, `healthy-me` là #11; #1–#9 giữ số;
  - `topic_id`, `lesson_id` các chủ đề đã soạn còn nguyên; `syllabus_version` giữ như SK-050 đã làm;
  - đếm máy: Explorer 11 chủ đề / 71 bài; cả app 44 / 382.

  Kiểm bằng:
  - `validate content`: 0 lỗi, dòng tổng "3 nhóm, 44 chủ đề, 382 bài";
  - `tools/content-cli/test/syllabus.test.ts` dòng 95, 101, 109 sửa cùng lần ("45 chủ đề, 390 bài" → "44 chủ đề, 382 bài");
  - `npm --prefix tools/content-cli test` xanh.
- [x] **dev:** luật `extension` cho phép bài mở rộng đứng giữa các bài Oak. Giữ các luật khác:
  - chỉ dùng trong chủ đề Oak;
  - `oak_lessons: []`, `statutory: false`;
  - chủ đề Oak không được toàn bài mở rộng.

  Sửa cùng lượt:
  - `packages/content-schema/scripts/lib/syllabus.mjs`: bỏ nhánh "bài Oak đứng sau bài mở rộng", sửa chú thích đầu file;
  - mô tả `extension` trong `schema/syllabus.schema.json`;
  - `packages/content-schema/README.md`;
  - `tools/content-cli/README.md` nếu có nhắc luật này;
  - `test/syllabus.test.mjs` dòng 162 ("Oak lesson after an extension lesson") đổi thành ca hợp lệ, thêm một ca bài mở rộng ở giữa.

  Kiểm: `npm --prefix packages/content-schema test` xanh.
- [ ] **pm**, sau khi dev đổi danh mục: các tài liệu ở "Việc kéo theo" khớp 44 / 382, Explorer 11 / 71, 34 unit Oak.

### content-editor
- [ ] `_topic.md` đúng frontmatter và các mục như ở "Bảng soạn". Có các mục như `thoi-tiet-va-cac-mua/_topic.md`: Nguồn, Tên gọi, Quy ước hình, Hình dùng chung, Đúng/Sai, Khởi động, Chơi, Thẻ thưởng, An toàn, Ranh giới, Lệch so với sườn, Còn mở.
- [ ] Đúng 7 bài, đúng thứ tự và `stage`; tên bài EN/VI khớp `content/syllabus.json` từng chữ.
- [ ] Mỗi bài theo luật Explorer:
  - Khởi động 2–3 câu DOK 1, chỉ `single_choice`, `true_false`, câu nào cũng có `recall_from`;
  - Quiz 6 câu, DOK 1·1·1·2·2·2;
  - đúng một câu misconception ở câu 6, key ở bảng "Phạm vi" (hoặc phương án khác ở "Bảng soạn", ghi lý do trong `_topic.md`); mỗi key dùng một lần; không trùng key của các chủ đề Explorer đã soạn (39 key lúc PM đếm 18/11, grep `^misconception:` trong `content/explorer/`), đặc biệt `plants_not_alive`, `plants_grow_anywhere` của *Sinh vật sống ở đâu?*;
  - chỉ `single_choice` (2–3 lựa chọn), `true_false`, `order_sequence` (3 thẻ); mỗi bài ít nhất hai dạng;
  - mỗi câu EN tối đa 8 từ; `true_false` là câu khẳng định, không `labels`.
- [ ] Câu 6 ưu tiên `true_false` đáp án Sai; `explanation_correct` là câu sửa, đứng một mình được. Các câu `true_false` khác cân Đúng/Sai trong chủ đề; có bảng Đúng/Sai ở `_topic.md`.
- [ ] Khởi động theo "Bảng soạn" (bài 1, 2, 7).
- [ ] Bài 1: chữ bé nghe nói "nhiều cây" (many plants), không nói "mọi cây" hay "cây nào cũng" mọc từ hạt. Grep chữ bé nghe ra 0 kết quả "all plants grow from seeds", "every plant", "cây nào cũng mọc", "mọi cây".
- [ ] Bài 2: ba thứ cây cần là nước, ánh sáng, hơi ấm. Câu "thiếu sáng thì cây vươn cao" (nếu dùng) phải nói kèm cây yếu, lá nhợt. Có một câu "quá nhiều nước cũng không tốt", không giải thích úng rễ. Grep 0 kết quả "nhiệt độ", "temperature", "℃", "độ C", "thermometer", "nhiệt kế".
- [ ] Bài 3: hình chính không phải cây đa. Bài 3, 6 không gọi cây chuối là cây to.
- [ ] Bài 5: mỗi rau quả chỉ gắn một bộ phận như bảng; không khoai tây, khoai lang, hành, gừng. Dùng "hạt lạc", không dùng "củ lạc". Cà chua là "quả". Mỗi gắn rau quả với bộ phận có dòng `> [CẦN KIỂM]` khi chưa chắc (danh sách ở "Câu hỏi còn mở").
- [ ] Bài 7: ví dụ cây không có hoa chỉ là dương xỉ, rêu; không lấy cỏ, lúa, xoài làm ví dụ "không có hoa". Không nói "cánh hoa giấy" (phần màu của hoa giấy là lá bắc), chỉ nói "hoa giấy". Có câu ngắm hoa, không hái.
- [ ] Từ vựng 4–5 từ mỗi bài, 2–3 `core`, khớp `word_list.term_keys`; từ trùng chủ đề khác có dòng `>`; `trunk` xử lý như "Bảng soạn".
- [ ] SK-044: mọi lựa chọn sai có `feedback` một câu, tối đa 8 từ EN, nói về chính vật bé chọn; `true_false` có `feedback_true` hoặc `feedback_false` đúng phía.
- [ ] SK-047: `hint`, `feedback`, giải thích không nhắc vị trí thẻ; `hint` không gần như nói đáp án.
- [ ] Ranh giới: grep chữ bé nghe ra 0 kết quả "quang hợp", "photosynthesis", "thụ phấn", "pollen", "pollinat", "chlorophyll", "diệp lục", "xylem", "mạch".
- [ ] An toàn: không câu nào rủ bé nếm, ăn lá, hoa, quả, hạt lạ, hay cho hạt vào miệng, mũi, tai; có lời rửa tay sau khi sờ đất (ô Học hoặc phản hồi, một lần trong chủ đề).
- [ ] Mọi sự thật chưa chắc có dòng `> [CẦN KIỂM]` ngay dưới; danh sách chép vào "Câu hỏi còn mở" của ticket.
- [ ] "Ghi chú cho hoạ sĩ" mỗi bài liệt kê ảnh mới, ảnh dùng lại, ảnh khó.

### designer
- [x] Mọi chỗ có hình (câu hỏi, lựa chọn, thẻ `order_sequence`, món Chơi, ô Học, từ, thẻ thưởng) có mục trong file chọn ảnh; 0 chỗ trống. (tester 18/11 lượt 2: 246/246, 0 thiếu, 0 thừa, 0 key trùng)
- [x] Ảnh nguồn ngoài chỉ CC0, PD, PDM hoặc CC BY có ghi công; 0 BY-SA, NC, ND hay không rõ giấy phép; đã mở trang gốc kiểm. `images fetch content/images/explorer/cay-quanh-em` 0 lỗi, 0 cảnh báo tỉ lệ. (tester chạy lại fetch: 7 file · 136 ảnh · 0 lỗi · 0 cảnh báo khung; giấy phép đọc từ file chọn ảnh và manifest gói — trang gốc do designer mở, tester không mở lại)
- [ ] Không chữ, logo, nhãn hiệu, bao bì trong hình (rau quả ở chợ hay siêu thị hay có tem giá); người ở xa, không nhận ra mặt. (tester xem tận mắt 11 hình mẫu: đạt; chưa xem hết 136 hình)
- [ ] Loài trong ảnh khớp trang gốc (bàng, phượng, mai, đào, hoa giấy, dương xỉ). Không khớp thì báo content-editor. (tester không mở trang gốc; trinh nữ, củ cải, súp lơ, mía xem ảnh thì khớp)
- [x] Không có hình tự vẽ trừ khi PM ghi đồng ý vào ticket trước. Ứng viên có thể cần vẽ: hạt nảy mầm thấy rễ và mầm, cây có hoa thấy đủ rễ. (7 hình vẽ / 12 file, đều nằm trong quyết định 10, 12, 13)
- [x] Icon: giữ `identifying-plants-and-their-basic-parts.svg` (cây ăn quả; vẫn hợp tên mới). Xoá hoặc chuyển lưu trữ `design/icons/topics/growing-plants.svg` như SK-050 đã làm với hai icon mùa. Bỏ dòng `growing-plants` ở canvas `Topic-Icons` và `design/play-ui/journey-roadmap-spec.md` mục 8 (Explorer 11, tổng 44 icon). Đổi tên EN ở dòng #7 nếu bảng có cột tên EN.

### ios-dev (sau khi dev đổi danh mục, designer bỏ icon)
- [ ] `ScienceKids/Common/Art.swift` dòng 60: icon mặc định của mạch `plantsAnimals` đổi từ `growing-plants` sang `identifying-plants-and-their-basic-parts`; chú thích dòng 51 "45 icons" → 44.
- [ ] Chạy `apps/ios/scripts/import-topic-icons.sh`; xoá tay `Topic-growing-plants.imageset`; còn đúng 44 imageset `Topic-*`.
- [ ] Thêm khoá `collectible.set.plants` "Plant cards" · "Thẻ cây" vào `Localizable.xcstrings`.
- [ ] Sửa test ghi cứng số đếm (danh sách ở "Việc kéo theo"). `ContentModelTests`, `ContentKitTests`, `ScienceKidsTests` xanh trên simulator iPhone 16, một máy, một lần (không iPhone 16 Pro).
- [ ] Chạy thử: bản đồ Explorer có 5 chặng; Chặng 4 có #6–#8, #7 tên "Cây quanh em" và đủ 7 bài.

### tester
- [x] Danh mục và test đếm:
  - 44 chủ đề / 382 bài; Explorer 11 / 71;
  - `oakYear` Explorer `[1, 2, 2, nil, nil, 1, 1, 1, 2, 2, 2]`;
  - 5 chặng; `stopRange` `[0..<1, 1..<3, 3..<5, 5..<8, 8..<11]`;
  - luật `extension` mới: bài mở rộng ở giữa thì hợp lệ, các ca lỗi cũ vẫn bắt.

  (kiểm ở lượt rà chữ 18/11, mục "Rà chữ (tester 18/11)")
- [x] Rà chữ 7 bài theo khuôn SK-041, SK-046, SK-048, SK-049: 0 mục chặn; mục "nên sửa" đã sửa hoặc có quyết định của PM. (C1 và N1–N5 đã sửa hoặc có quyết định; tester kiểm lại 18/11 lượt 2: không còn chuỗi "Dùng lại hình" hỏng)
- [x] Đọc mọi dòng `[CẦN KIỂM]` ở mức hợp lý với trẻ 5–7 tuổi (không thay người chuyên môn). (gồm dòng mới 18/11 về cỏ xavan mùa khô; xem Rà ảnh mục A3)

### phiên chính
- [ ] `validate content/explorer/cay-quanh-em` 0 lỗi. Chạy `ids` theo thứ tự `_topic.md`, rồi bài 1 tới bài 7; ghi `topic_id`, `lesson_id` vào `content/syllabus.json`.
- [ ] `images fetch` 0 lỗi; `tts` EN và VI (ghi số clip VI bị đánh dấu chờ Duy nghe; nghe thử "rau muống", "súp lơ", "hoa giấy", "dương xỉ"); `build`; `check-pack` OK.
- [ ] Chơi trọn một bài Khởi động → Học → Chơi → Quiz → Tổng kết → Thưởng trên simulator iPhone 16, một máy, một lần.

### pm (đóng ticket)
- [ ] Người chuyên môn đọc hết các dòng `[CẦN KIỂM]` trước khi phát hành; ghi người đọc và ngày.
- [ ] Tài liệu và `docs/backlog/README.md` khớp `content/syllabus.json` và các test đếm.

## Phụ thuộc · Quyết định đã ghi · Câu hỏi

### Phụ thuộc
- dev đổi danh mục và luật `extension` trước khi phiên chính chạy `validate`, `ids` lần đầu (`_topic.md` `order: 7` và 7 bài phải khớp danh mục). content-editor, designer làm song song được.
- ios-dev sửa test sau khi danh mục đổi và designer bỏ icon.
- Cây làm việc đang có thay đổi chưa commit của phiên khác: `tools/content-cli/image-slots.json`, `tools/content-cli/test/aspect.test.ts`, bốn file `content/images/explorer/…`, SK-043, `syllabus.md`. dev, designer không đụng các file đó, trừ chỗ ghi trong ticket này.
- SK-040, SK-044, SK-047 (app chạy bài Explorer, phản hồi, xáo lựa chọn, Tổng kết): đã có.
- Mạng tới Commons, Openverse (từng trả 429: giãn nhịp, một tiến trình).

### Quyết định đã ghi

**Duy 18/11:**
- Danh sách 7 bài, thứ tự: cây sống và lớn lên (1–2), bộ phận (3–4), bộ phận ta ăn (5), đa dạng lá và hoa (6–7).
- Bỏ các bài trồng và theo dõi cây.
- Giữ "Rau quả ta ăn" và "Cây cần gì".
- "ok start". Chế độ auto: chốt theo khuyến nghị PM, không hỏi thêm.

**PM 18/11, theo chế độ auto (Duy đổi được khi review):**

1. **Giữ chủ đề Oak #7, không chuyển sang chủ đề mới (`kind: new`).**
   - Key giữ `identifying-plants-and-their-basic-parts`: luật `syllabus_key` buộc key của chủ đề Oak bằng `unit_slug`, và các file đã nhắc key này giữ nguyên.
   - Giữ `source.year: 1` để bản đồ vẫn 5 chặng. App chia chặng theo năm Oak liền nhau (`JourneyProgress.swift:169`). Nếu #7 thành chủ đề mới (`oakYear` = nil), Chặng 4 tách ba, bản đồ thành 7 chặng.
   - Ghi được slug Oak từng bài theo nguyên tắc N3 của bản rà 18/11. Chủ đề `kind: new` thì schema buộc mọi `oak_lessons` rỗng.
   - Bài 1–2 mang slug của unit Y2 *Growing plants* trong chủ đề có `unit_slug` Y1. Validator không kiểm slug thuộc unit nào. Ghi rõ trong `_topic.md` mục Nguồn và `syllabus-lessons.md`.
2. **Bài 5 là bài mở rộng (`extension: true`) đứng giữa; nới luật "bài mở rộng chỉ đứng sau mọi bài Oak" (Duy 13/11).**
   - Duy chốt thứ tự 18/11 đặt bài 5 giữa bài 4 và bài 6. Nguyên tắc N 18/11 cũng nói Oak chỉ là kho tham khảo. Luật 13/11 vì thế không còn giữ được cho chủ đề này.
   - Phương án khác:
     - (b) dời bài 5 xuống cuối: trái thứ tự Duy chốt;
     - (c) chuyển #7 sang `kind: new`: bản đồ 7 chặng, mất slug Oak;
     - (d) gắn bài 5 vào một slug Oak gần nhất: sai nguồn.
   - Chọn nới luật vì ít thay đổi nhất, chỉ ở `content-schema`. App không đọc `extension`.
3. **Bỏ hẳn #10 `growing-plants`.** Chủ đề chưa có bài, `topic_id`, `lesson_id`, ảnh hay audio, nên không mất công. 4 lesson dùng (L1, L3, L5–L7) đã gộp vào bài 1–2. 3 lesson bỏ ghi ở "Ngoài phạm vi" và `syllabus-lessons.md`.
4. **Tên bài EN** do PM đặt, ngắn cho thẻ bản đồ. Bài 1 giữ tên Oak. Chính tả Anh ("colours"). Tên VI đúng câu Duy chốt.
5. **Misconception:** bảy key do PM đề xuất theo misconception hoặc exit quiz của lesson Oak gốc; bài 5 theo starter quiz *Growing plants*. content-editor được đổi sang phương án khác, có lý do.
6. **`level: 1` giữ như danh mục.** Bài 2 nặng hơn (từ unit Y2, Mức 3 cũ) nhưng ở Explorer chỉ dạy ở mức nhìn thấy. content-editor chấm `difficulty`; lệch thì báo.
7. **Thẻ thưởng `set: plants`** mới; không dùng chung `living_things` (chưa có khoá trong app) hay `weather`.
8. **Icon:** giữ icon #7 (cây ăn quả), không vẽ mới vì key và tên VI không đổi; bỏ icon `growing-plants`. Icon mặc định của mạch Thực vật & động vật trong app chuyển sang icon #7.
9. **Không cần hỏi Duy thêm để bắt đầu.** Quyết định 2 đổi một luật Duy đặt 13/11. PM ghi vào "Câu hỏi còn mở" để Duy xác nhận khi review, nhưng không chặn việc.
10. **Hình tự vẽ (PM 18/11, chế độ auto, theo khuôn SK-049 quyết định 5; phiên chính chuyển cho designer):** PM đồng ý designer tự vẽ ba hình content-editor nêu, chỉ khi không có ảnh hay hình khoa học PD/CC0/CC BY hợp: hạt nảy mầm thấy rễ và mầm (`explore_sprout` bài 1), cây có hoa thấy đủ rễ (`explore_parts` bài 4), ba chậu cây tươi/rũ/khô cùng kiểu (bài 2 q4). Hình gần thực tế, không chữ; `changes: ["drawn"]`, credit "Science Kids".

**PM 18/11, lượt 2 (sau khi designer chọn ảnh, "Ghi chú designer" mục 1–5, 12; chế độ auto):** Nguyên tắc chung: theo `content/TEMPLATE.md` mục Hình, các lựa chọn và món trên kệ Chơi cùng kiểu hình; không để món hay lựa chọn **đúng** là hình vẽ duy nhất giữa ảnh chụp. Ô Học được trộn ảnh và hình vẽ (như `explore_sprout` ở quyết định 10). Thứ tự: content-editor sửa bài trước, designer cập nhật file chọn ảnh sau, rồi `images fetch`.

11. **Bài 2 q5: đổi đáp án sang giá đỗ, không vẽ cỏ dưới bạt.** Nếu vẽ cỏ, đáp án là hình vẽ duy nhất giữa hai ảnh chụp, tức lộ đáp án. Muốn tránh thì phải vẽ cả ba lựa chọn, tốn công hơn. Giá đỗ đã có ảnh thật, đúng ý chính ba.
    - **content-editor** (`02-cay-can-gi-de-lon.md`):
      - option `q5_grass` đổi key thành `q5_sprouts`, `label` "bean sprouts" · "giá đỗ", brief "Dùng lại hình `explore_dark`." kèm từ khoá gốc, `alt` "White bean sprouts" · "Giá đỗ trắng";
      - `hint` không được gọi tên giá đỗ nữa, ví dụ "Look for pale, thin stems." · "Em tìm cây thân trắng, nhợt nhé.";
      - sửa `explanation_correct`, `explanation_wrong` (ví dụ "Yes! Bean sprouts grow in the dark." · "Đúng rồi! Giá đỗ được ủ trong tối."; "The answer is the bean sprouts. They are pale." · "Đáp án là giá đỗ. Giá đỗ trắng nhợt.");
      - giữ `dok: 2`, sửa dòng `>` thành "suy từ dấu hiệu (thân trắng nhợt) ra nguyên nhân (thiếu sáng)". Nếu thấy câu tụt xuống DOK 1 thì được đổi `prompt` sang hướng nguyên nhân, giữ ba lựa chọn ảnh chụp, và ghi lý do;
      - bỏ dòng `[CẦN KIỂM]` cỏ dưới tấm bạt, dòng `>` ở dòng 196 và 461 về cỏ, ảnh `q5_grass` trong "Ghi chú cho hoạ sĩ"; sửa `_topic.md` (bảng hình, Đáp án, `[CẦN KIỂM]`, Còn mở 6) cho khớp.
    - **designer:** trong `content/images/explorer/cay-quanh-em/cay-can-gi-de-lon.json`, đổi key `q5_grass` → `q5_sprouts`, giữ `same_as explore_dark` (bản cắt 5:2), sửa `alt`.
    - **pm:** đã bỏ "cỏ dưới tấm bạt" ở "Câu hỏi còn mở".
12. **Bài 2: hình vẽ chậu cây dùng được cho cả bộ chậu tươi/rũ/khô** (mở rộng quyết định 10): `explore_wilt` (ô Học, từ `wilt`), `q3_green`, `q3_wilted`, `q4_fresh`, `q4_drooping`, `q4_dry`. `explore_needs` vẫn là ảnh chụp (ô Học, `tray_window`, q6).
    - **content-editor** (`02-cay-can-gi-de-lon.md`):
      - `explore_wilt` brief → `[hình vẽ]`, tả đúng hình designer đã vẽ (chậu đất nung bên cửa sổ có nắng, lá rũ, đất khô), không dòng từ khoá;
      - `q4_fresh` brief → `[hình vẽ]` (chậu cùng kiểu, lá xanh thẳng), không còn "Dùng lại hình `explore_needs`"; `q4_dry` brief → `[hình vẽ]`; `q4_drooping` giữ "Dùng lại hình `explore_wilt`.";
      - `q3_green` → "Dùng lại hình `q4_fresh`.", `q3_wilted` giữ "Dùng lại hình `explore_wilt`.";
      - bỏ phần từ khoá ở mọi brief dùng lại hai hình gốc vẽ này; xoá "Phương án thay" `single_choice` ở q4 (không cần nữa);
      - **kệ Chơi:** bỏ món `tray_wilted` (hình vẽ duy nhất trên kệ, lại là món đúng). Thay bằng món ảnh chụp cho nhóm `tray_no_water`, ví dụ cỏ khô mùa khô: dùng lại hình "Yellow grass in the dry season" ở `noi-song-tren-trai-dat/dong-co-xavan` (content-editor tìm key, trỏ thẳng mục gốc), key gợi ý `tray_dry_grass`, `label` "Dry grass" · "Cỏ khô". Sửa ví dụ kiểm màn Chơi, bảng Phần Chơi `_topic.md`;
      - sửa "Ghi chú cho hoạ sĩ" bài 2, bảng hình `_topic.md`.
    - **designer:** file chọn ảnh bài 2 khớp brief mới: `q4_fresh` là mục `own` (`pot-fresh.jpg`); `q3_green` `same_as q4_fresh` (bản cắt 17:10); bỏ `tray_wilted`, thêm món mới `same_as` thẳng mục gốc; không còn cảnh báo kiểu "brief ảnh, chọn hình vẽ".
13. **Bài 1 q4: chọn (a), designer vẽ thêm hạt đậu xanh và cây đậu con** cùng nét, cùng nền với `bean-sprout.jpg`, để ba thẻ đều là hình vẽ. Ảnh chụp cây đậu con giữ cho kệ Chơi và từ `soil`. Kệ Chơi bài 1 cũng đang có một món vẽ là món đúng (`tray_sprout`), nên thay bằng ảnh.
    - **content-editor** (`01-cay-moc-len-tu-hat.md`):
      - `q4_seed` brief → `[hình vẽ]` hạt đậu xanh (một nhúm hạt trên nền đất, chụp gần, khung vuông), `alt` giữ;
      - `q4_seedling` brief → `[hình vẽ]` cây đậu con trên đất (cùng cây với hình hạt nảy mầm, lớn hơn), `alt` giữ;
      - chuyển brief ảnh chụp hiện tại của `q4_seedling` (`[ảnh] Một cây đậu con…`, từ khoá) sang `tray_seedling`, thành hình gốc; từ `soil` và mọi chỗ khác đang "Dùng lại hình `q4_seedling`" đổi sang "Dùng lại hình `tray_seedling`" (grep cả bài và `_topic.md`);
      - món `tray_sprout` → "Dùng lại hình `explore_dark` ở bài `cay-quanh-em/cay-can-gi-de-lon`.", `label` "Bean sprouts" · "Giá đỗ", `alt` "White bean sprouts" · "Giá đỗ trắng" (giá đỗ là hạt đậu xanh nảy mầm). Key món giữ hay đổi tuỳ content-editor, ghi lại cho designer;
      - sửa dòng `>` dòng 401, "Ghi chú cho hoạ sĩ" (ảnh mới, hình vẽ), ví dụ kiểm màn Chơi, bảng `_topic.md`.
    - **designer:** vẽ `q4_seed` và `q4_seedling` (mục `own`, `method: drawn`, gần thực tế, không chữ, khung vuông); chuyển ảnh chụp cây đậu con sang mục `tray_seedling`, sửa các `same_as` trỏ về nó; `tray_sprout` `same_as` thẳng `explore_dark` bài 2.
14. **`explore_warm` bài 2: đồng ý đổi `alt`** thành "Young plants under a plastic roof" · "Cây non dưới mái nilon".
    - **content-editor:** sửa `alt` ở mục gốc và mọi chỗ dùng lại (từ `warm`), sửa brief cho khớp ảnh (cây non trong nhà kính mái nilon, không phải mạ). Nếu câu ô Học hay ví dụ nói "mạ" thì đổi thành "cây non", hoặc giữ "mạ" chỉ ở câu không gắn với hình này. Sửa `_topic.md` cho khớp.
    - **designer:** sửa `alt` trong file chọn ảnh.
15. **`explore_look` bài 4 (hoa mười giờ): đồng ý đổi `alt` riêng q1** thành "Bright pink petals" · "Những cánh hoa hồng tươi".
    - **content-editor:** sửa `alt` q1 và danh sách "`alt` riêng" ở `_topic.md`. Kiểm `prompt`, `hint`, lời giải q1 không dựa vào màu cam; có thì bỏ "cam".
    - **designer:** sửa `alt` trong file chọn ảnh.
16. **`q5_mimosa` bài 6: đổi sang ảnh riêng nét hơn** ("Mimosa pudica leaves close up", NonNerd, CC0, 4320 px), không cắt từ `explore_sensitive` nữa. Bản cắt 486×194 px mờ trên thẻ 5:2.
    - **content-editor:** brief `q5_mimosa` → `[ảnh] Lá trinh nữ chụp gần: nhiều lá li ti xếp hai hàng trên cuống, không hoa, không chữ; ảnh ngang (thẻ 5:2). Từ khoá tìm ảnh (EN): Mimosa pudica leaves close up`. `label`, `alt` riêng ("Tiny leaves on a branch" · "Lá li ti trên cành") giữ. Thêm vào ảnh mới bài 6 trong "Ghi chú cho hoạ sĩ" và `_topic.md` (đếm ảnh mới bài 6: 3 → 4).
    - **designer:** mở trang gốc kiểm CC0 và loài, kiểm ảnh không có hoa nổi bật (cùng kiểu với hai lựa chọn lá kia), cắt 5:2, `images fetch` lại.

### Câu hỏi còn mở

**Cho Duy khi review (không chặn):**
- Quyết định 2 (nới luật `extension`): Duy đồng ý, hay muốn dời bài 5 xuống cuối?

**Cho người chuyên môn** (PM viết trước khi soạn; content-editor bổ sung):
- **Bài 1:**
  - "nhiều cây mọc từ hạt": dương xỉ, rêu không có hạt; mía, sắn trồng bằng khúc thân;
  - hạt mít, hạt xoài nảy mầm thấy rõ rễ và mầm;
  - một số hạt có độc (đậu sống, hạt táo).
- **Bài 2:**
  - giá đỗ ủ tối thân trắng, dài; giá đỗ là hạt đậu xanh nảy mầm (bài 1 kệ Chơi, quyết định 13);
  - ~~cỏ dưới tấm bạt lâu ngày vàng~~ (bỏ 18/11, quyết định 11: q5 đổi sang giá đỗ);
  - nắng gắt giữa trưa làm lá rau héo;
  - rét đậm miền Bắc làm mạ chết rét, người ta che nilon;
  - ví dụ "thiếu ấm" nào trẻ ba miền đều hiểu;
  - cây thiếu nước tưới kịp thì tươi lại.
- **Bài 3:** bàng, phượng, xoài là cây to quen ở cả ba miền; cành đỡ lá, hoa, quả.
- **Bài 4:**
  - hoa mười giờ, cúc thấy đủ bốn bộ phận trong chậu;
  - nụ → hoa → quả ở cây bí, cây ớt.
- **Bài 5** (từng cặp):
  - cà rốt, củ cải là rễ;
  - rau muống là thân (ta ăn cả thân và lá non: nói "thân" có đúng không, hay đổi ví dụ thân chỉ còn mía);
  - rau cải, xà lách là lá;
  - súp lơ là hoa (cụm nụ hoa);
  - hoa bí là hoa;
  - chuối, cam, xoài, cà chua là quả (cà chua thường gọi là rau);
  - hạt đậu (đậu xanh, đậu đen; không phải quả đậu đũa) là hạt;
  - lạc là hạt (người Việt quen gọi "củ lạc", lạc mọc dưới đất);
  - hạt sen là hạt.
- **Bài 6:**
  - lá dừa là một lá xẻ thành nhiều lá nhỏ, hay nhiều lá;
  - lá phượng gồm nhiều lá li ti (lá kép);
  - cây chuối, cây dừa có gọi là "cây to" (tree) với trẻ không.
- **Bài 7:**
  - phần màu của hoa giấy là lá bắc;
  - dương xỉ, rêu không có hoa;
  - hoa mai vàng nở dịp Tết ở miền Nam, hoa đào ở miền Bắc (đã kiểm ở SK-050, đối chiếu);
  - tên EN hoa mai (*Ochna integerrima*, "yellow apricot blossom" hay "mai flower").
- **Tên gọi EN:**
  - "flowering plant";
  - "shoot" hay "sprout" cho trẻ 5–7 tuổi;
  - "trunk" (trùng vòi voi);
  - "water spinach" hay "morning glory" (rau muống).

### Việc kéo theo

**Số đếm** (`content/syllabus.json`, đếm 18/11):

| | Chủ đề | Bài |
| --- | --- | --- |
| Explorer hiện tại | 12 | 79 |
| #7: 7 bài cũ → 7 bài mới | 0 | 0 |
| Bỏ #10 `growing-plants` | −1 | −8 |
| **Explorer sau khi đổi** | **11** (9 unit Oak, 2 mới) | **71** |
| Discoverer | 17 | 155 |
| Scientist | 16 | 156 |
| **Cả app sau khi đổi** | **44** (34 unit Oak, 10 mới: Explorer 2, Discoverer 5, Scientist 3) | **382** |

Explorer 71 bài, khoảng 30 tuần (3 bài/tuần cộng tuần ôn). Icon chủ đề 45 → 44. Lộ trình đề xuất 18/11 (Explorer 11 / 70, cả app 34 / 236) chưa áp dụng; khi Duy chốt cả bản rà sẽ có ticket riêng.

**Đánh số lại Explorer:**

| Số mới | Chủ đề | Số cũ | Năm Oak |
| --- | --- | --- | --- |
| 1–6 | (không đổi) | 1–6 | Y1, Y2, Y2, mới, mới, Y1 |
| 7 | **Cây quanh em** (Plants around us, 7 bài mới) | 7 (+ 4 lesson của 10) | Y1 |
| 8 | Vật liệu quanh em | 8 | Y1 |
| 9 | Vật liệu dùng làm gì? | 9 | Y2 |
| — | ~~Trồng cây~~ (gộp vào #7) | 10 | — |
| 10 | Sự sống mới | 11 | Y2 |
| 11 | Em khoẻ mạnh | 12 | Y2 |

**Chặng bản đồ Explorer sau khi đổi** (vẫn 5): Chặng 1 #1 · Chặng 2 #2–#3 · Chặng 3 #4–#5 · Chặng 4 #6–#8 · Chặng 5 #9–#11. `stopRange` `[0..<1, 1..<3, 3..<5, 5..<8, 8..<11]`; `oakYear` theo chặng giữ `[1, 2, nil, 1, 2]`; bản đồ 5 cột mốc + 11 chặng + 1 cờ = 17 mục.

- **dev:**
  - `content/syllabus.json` như tiêu chí Bước 0. Đọc lại file trước khi sửa; khối #7 ở dòng 561–654, khối #10 ở dòng 838–942 lúc PM đọc 18/11.
  - `tools/content-cli/test/syllabus.test.ts` dòng 95, 101, 109.
  - Luật `extension` ở `packages/content-schema` như tiêu chí Bước 0.
  - `content/.build/syllabus-vi*.tsv`: sinh lại nếu có script, không thì để.
  - Không đụng `tools/content-cli/image-slots.json`, `test/aspect.test.ts`.
- **ios-dev:**
  - `Packages/SKKit/Tests/ContentModelTests/SyllabusTests.swift`:
    - dòng 27 `[12, 17, 16]` → `[11, 17, 16]`;
    - dòng 28 `[79, 155, 156]` → `[71, 155, 156]`, kèm chú thích;
    - dòng 55 → `[1, 2, 2, nil, nil, 1, 1, 1, 2, 2, 2]`, thêm dòng chú thích SK-051;
    - dòng 56–58 (key #3–#5) giữ.
  - `ContentKitTests/JourneyTests.swift`: dòng 34 Explorer 12 → 11; dòng 37 tổng 390 → 382, kèm chú thích.
  - `ContentKitTests/JourneySegmentTests.swift` dòng 26: `stopRange` → `[0..<1, 1..<3, 3..<5, 5..<8, 8..<11]`; dòng 27 giữ.
  - `ScienceKidsTests/JourneyMapAppTests.swift`:
    - dòng 13, 18: 45 → 44;
    - dòng 41 chú thích (1 + 2 + 2 + 3 + 3);
    - dòng 74–75: `5 + 11 + 1`.
  - `ScienceKidsTests/OnboardingTests.swift`: dòng 219 Explorer 12 → 11; dòng 298 `[11, 17, 16]`.
  - `ScienceKids/Common/Art.swift` dòng 51, 60; `apps/ios/README.md` dòng 53 (44 icon).
  - Asset: bỏ `Topic-growing-plants.imageset`; thêm khoá `collectible.set.plants`.
  - Grep lại `growing-plants`, `390`, `[12,` trong `apps/ios` sau khi sửa.
- **designer:** ảnh theo "Bảng soạn"; icon và hai file thiết kế như tiêu chí designer.
- **content-editor:**
  - soạn `_topic.md` và 7 bài theo bảng "Phạm vi", "Bảng soạn" và hai file `docs/oak/`;
  - sửa ghi chú cũ (dòng `>` hoặc mục Ghi chú, không phải chữ bé nghe) đang trỏ tới "Trồng cây", `growing-plants` hay "Explorer #10" (grep trong `content/explorer/`) thành #7 *Cây quanh em*. Không phải chạy lại `tts`.
- **pm** (lượt 2, cùng lượt dev đổi danh mục):
  - `syllabus.md`: mục 0 (số đếm 44 / 382), mục 1 dòng ghi chú bản danh mục, mục 2 luật 1 ("giữ 34/38 unit"), mục 3 (cột Trạng thái #7), mục 9 nếu có số đếm;
  - `syllabus-lessons.md`: viết lại mục Explorer #7 (7 bài EN/VI, slug Oak, 6 lesson bỏ), bỏ mục #10 cũ, đánh lại số #11–#12 → #10–#11;
  - `syllabus-progression.md`: dòng trạng thái; mục 4 bảng mạch (bỏ "Trồng cây"); ghi chú các chỗ nhắc Explorer #10;
  - `prd.md`, `technical-plan.md`: dòng hiện trạng 44 chủ đề, 382 bài, Explorer 11 / 71, 34 unit Oak; không viết lại dòng lịch sử có ngày;
  - `docs/backlog/README.md`: đổi trạng thái theo ticket.
- **tester:** kiểm danh mục, luật `extension`, test đếm; rà chữ 7 bài.

### Ghi chú dev (18/11)

**Đã làm (Bước 0):**
- `content/syllabus.json`: #7 `title.en` "Plants around us", 7 bài mới theo bảng "Phạm vi" (bài 5 `oak_lessons: []`, `statutory: false`, `extension: true`); bỏ `growing-plants`; `new-life` #10, `healthy-me` #11; `source` #7 giữ nguyên; `syllabus_version` giữ `2026-11-09`. Chủ đề #7 và #10 cũ chưa có `topic_id`/`lesson_id` nên không mất id nào. Bốn slug Oak Y2 dùng ở bài 1–2 đi theo bài mới; ba slug Y2 còn lại (`plants-from-bulbs`, `plant-health-and-growth`, `grow-your-own-food-…`) và ba slug Y1 bỏ (`plants-around-our-school-or-home`, `deciduous-and-evergreen-trees`, `wildflowers`) không còn trong danh mục. File viết lại bằng `JSON.stringify(…, null, 2)` (định dạng gốc giống hệt, đã kiểm).
- Luật `extension`: bỏ nhánh "bài Oak đứng sau bài mở rộng" trong `packages/content-schema/scripts/lib/syllabus.mjs` (và chú thích đầu file); sửa mô tả `extension` trong `schema/syllabus.schema.json`, `packages/content-schema/README.md`, `tools/content-cli/README.md` (bảng mã `syllabus_oak`). Các luật khác giữ: chỉ trong chủ đề Oak, `oak_lessons: []`, `statutory: false`, chủ đề Oak không toàn bài mở rộng.
- Test: `packages/content-schema/test/syllabus.test.mjs` ca "Oak lesson after an extension lesson" thành ca hợp lệ "extension lesson between Oak lessons"; thêm ca bài mở rộng đứng đầu (hợp lệ) và hai ca bài mở rộng ở giữa vẫn bị bắt (`oak_lessons` không rỗng, `statutory: true`). Test đếm file thật ở cùng file **đã lỗi từ trước** (ghi 12/75/386 trong khi file là 12/79/390 từ SK-049, SK-050); sửa thành 11/71/382. `tools/content-cli/test/syllabus.test.ts` dòng 95, 101, 109: "45 chủ đề, 390 bài" → "44 chủ đề, 382 bài". Ví dụ dòng tổng trong `tools/content-cli/README.md` và chú thích `src/markdown/syllabus.ts` đổi sang 44/382.
- `content/.build/syllabus-vi*.tsv`: không có script sinh (file gitignore, làm tay ở SK-030), để nguyên.

**Kết quả lệnh (18/11):**
- `node tools/content-cli/src/cli.ts validate content`: exit 0, 0 lỗi, 159 cảnh báo (đều `md_needs_check` và loại cũ, 0 cảnh báo syllabus); dòng tổng "3 nhóm, 44 chủ đề, 382 bài; 79 bài có lesson_id".
- `npm --prefix packages/content-schema test`: 163/163 pass. `typecheck` sạch.
- `npm --prefix tools/content-cli test`: 399/399 pass. `typecheck` sạch.

**Cho ios-dev:** không đổi định dạng gói hay RPC. App không đọc `extension`. Danh mục đổi số đếm (Explorer 11/71, cả app 44/382) và bỏ key `growing-plants`: sửa test và icon theo "Việc kéo theo".


### Ghi chú ios-dev (18/11)

**Đã làm:**
- `ScienceKids/Common/Art.swift`: icon mạch `plantsAnimals` → `identifying-plants-and-their-basic-parts`; chú thích 44 icon.
- Xoá tay `Assets.xcassets/Art/Topics/Topic-growing-plants.imageset`; còn 44 imageset `Topic-*`, khớp đúng 44 key của `content/syllabus.json` (0 thiếu, 0 thừa). **Chưa chạy** `scripts/import-topic-icons.sh`: `design/icons/topics/growing-plants.svg` vẫn còn (designer chưa bỏ), chạy lúc này sẽ chép lại imageset. Designer bỏ file xong thì chạy script được, kết quả không đổi.
- `Localizable.xcstrings`: thêm `collectible.set.plants` "Plant cards" · "Thẻ cây".
- Số đếm: `SyllabusTests` (`[11, 17, 16]`, `[71, 155, 156]`, `oakYear` 11 phần tử), `JourneyTests` (Explorer 11, tổng 382), `JourneySegmentTests` (`8..<11`), `JourneyMapAppTests` (44 icon, `5 + 11 + 1`, chú thích 1 + 2 + 2 + 3 + 3), `OnboardingTests` (Explorer 11, `[11, 17, 16]`), `apps/ios/README.md` (44 icon). Grep lại `growing-plants`, `390`, `[12,` trong `apps/ios`: chỉ còn `390` là bề rộng máy, không phải số bài.

**Kết quả (iPhone 16, một lần, `-skip-testing:ScienceKidsUITests`):** 411 test, 409 pass, 2 fail; `** TEST FAILED **`. Mọi suite của ticket xanh: `SyllabusTests`, `JourneyTests`, `JourneySegmentTests`, `JourneyMapAppTests`, `OnboardingModelTests`, `AppModelTests`, `BundledContentTests`. Hai test fail **không do SK-051**, đều đọc gói nhúng `content/.build/pack` (build 18/11 08:52, đã có các chủ đề SK-048–SK-050) và còn ghi số từ SK-047:
- `PlayTrayPackTests.everyPackTrayBalancesWithOneOfEachRequiredGroup`: số khay 79 (test ghi 59), Explorer 39 (test ghi 19); mọi khay vẫn cân.
- `KeyPointPicturesTests.designerTableOnThePack`: 10 bài mới của gói khớp ý chính với nhóm hình khác thứ tự 1·2·3, `moved` 44 (bảng designer 34). Cần designer bổ sung bảng cho các bài mới (hoặc PM quyết định cách test), ios-dev không tự đặt thứ tự.

**Chạy thử (iPhone 16):** bản đồ Explorer 5 chặng; Chặng 4 có Cơ thể của em · Cây quanh em · Vật liệu quanh em ("0/3 done"); Cây quanh em dùng icon riêng, "Coming soon" (chưa có nội dung trong gói); cờ "11 topics". Chưa mở màn chủ đề #7 trong app (danh mục có đủ 7 bài, tên "Plants around us" · "Cây quanh em"). iPad và các cỡ iPhone khác chưa chạy.

## Rà chữ (tester 18/11)

Phạm vi: `content/explorer/cay-quanh-em/_topic.md` và bảy bài `01-cay-moc-len-tu-hat.md` … `07-hoa-nhieu-mau-nhieu-hinh.md`, cộng phần danh mục và luật `extension` của dev. Đọc đối chiếu ticket này (tiêu chí content-editor, "Bảng soạn", ranh giới, an toàn, quyết định 1–9), `docs/oak/growing-plants.md` và `docs/oak/identifying-plants-and-their-basic-parts.md` (cả hai đọc hết), `content/TEMPLATE.md`, `content/rules.json` (`explorer.authoring`), `content/syllabus.json`, các chủ đề đã soạn (`sinh-vat-song-o-dau`, `thoi-tiet-va-cac-mua`, `co-the-cua-em`, `goi-ten-va-nhom-dong-vat`, `chuoi-thuc-an`). Không sửa file nội dung, không sửa code, không commit. Không rà phần ảnh đã fetch (designer đang làm song song; `content/images/explorer/cay-quanh-em/` chưa có).

Lệnh đã chạy (chỉ đọc):
- `node tools/content-cli/src/cli.ts validate content/explorer/cay-quanh-em`: **8 file (1 topic, 7 bài) · nhóm explorer · 0 lỗi · 8 cảnh báo**, cả 8 là `md_needs_check` (18 + 48 dòng `[CẦN KIỂM]`).
- `npm --prefix packages/content-schema test`: **163/163 pass**.
- `npm --prefix tools/content-cli test`: **399/399 pass**.

Script kiểm (không phải test sản phẩm) ở `/private/tmp/claude-501/-Users-buiduyluu--claude-spares-spare-3BQ83x/931ba545-9527-406d-9b10-046d41a12137/scratchpad/sk051/`, chạy bằng `python3 -I`: `parse.py`, `check_struct.py`, `check_text.py`, `check_table.py` (đối chiếu từng ô bảng `_topic.md` với bài), `check_img.py`, `chain.py` (chuỗi "Dùng lại hình"), `check_kind.py`, `check_meta.py`, `check_more.py`, `check_new.py`, `check_fb.py`, `check_warm.py`; `ext.mjs` (vector luật `extension` gọi thẳng `validateSyllabus`).

**Tổng kết: chặn 1 · nên sửa 5 · nhỏ 10.**

### Đạt (đã kiểm bằng máy, không có lỗi)

- **Danh mục** (`content/syllabus.json`): #7 key `identifying-plants-and-their-basic-parts`, `title` "Plants around us" · "Cây quanh em", `source` giữ nguyên (`oak`, `unit_slug`, `year: 1`, `unit_index: 4`), `strand: plants_animals`, `level: 1`, `number: 7`; đúng 7 bài, đúng thứ tự, tên EN/VI **khớp ticket từng chữ**, `oak_lessons` và `statutory` đúng bảng "Phạm vi", bài 5 `oak_lessons: []` + `statutory: false` + `extension: true`. `topic_id` khớp `_topic.md`, bảy `lesson_id` khớp `id:` bảy bài (và khớp `number`/`order`). Không `id` nào trùng trong cả `content/`, không dòng `id:` trống. Không còn key `growing-plants`; `new-life` #10, `healthy-me` #11. Đếm máy: **44 chủ đề / 382 bài; Explorer 11 / 71**; `oakYear` Explorer `[1, 2, 2, nil, nil, 1, 1, 1, 2, 2, 2]`.
- **Luật `extension`:** 8 vector tự viết (`ext.mjs`, dựng từ chính `content/syllabus.json`) đều đúng — hợp lệ: bài mở rộng ở giữa (file thật), ở cuối, đứng đầu; vẫn bắt lỗi: `extension` có `oak_lessons`, `statutory: true`, `extension` trong chủ đề `kind: new`, chủ đề Oak toàn bài mở rộng, bài Oak thiếu `oak_lessons`. Chú thích đầu `syllabus.mjs` và nhánh luật khớp nhau.
- **Cấu trúc bài:** 7 bài, mỗi bài 6 câu Quiz, DOK 1·1·1·2·2·2, đúng một câu misconception ở q6, không key nào gắn ở Khởi động. Khởi động 2 câu (bài 1–6) và 3 câu (bài 7), DOK 1, câu nào cũng `recall_from.kind: lesson` và bài đích có thật, đã có `id`; `single_choice` ở Khởi động luôn hai lựa chọn. Mỗi bài ≥ 2 format (bài 1–4 ba format, bài 5–7 hai). `order_sequence` đúng 3 thẻ, `answer` khớp tập thẻ, **không câu nào để thẻ sẵn đúng thứ tự**, và khớp bảng `_topic.md:341-344`. `build_tray` cả 7 bài: `capacity: 3`, `success_when: all_required_and_no_limit`, 3 nhóm `required` + 1 nhóm `limit` màu `do_son`, kệ 6–8 món (đúng khuôn `_topic.md:156`), không nhóm `required` nào dùng `do_son`, key món khác key nhóm, 4 màu khác nhau ở cả Học lẫn Chơi, nhãn nhóm không có dấu phẩy, `messages.missing.*` đủ và đúng key.
- **Đối chiếu `_topic.md` với bài:** bảng Đáp án Đúng/Sai 29 dòng ↔ đúng 29 câu `true_false` trong bài, **khớp từng chữ và từng đáp án**; bảng Khởi động (7 dòng × 3 cột) khớp `recall_from`, format và chữ; bảng Phần Chơi khớp lệnh EN/VI, nhãn và màu 3 nhóm `required` + nhóm `limit`; 7 lời `has_limited` khớp; bảng Từ vựng khớp `tier`, `term.en`, `term.vi`; bảng Thẻ thưởng khớp key, `name`, `rarity`, `tag`, `fact` (một chữ lệch, xem n2); bảng thứ tự `order_sequence` khớp. Tổng cộng **1 ô lệch trên toàn bộ các bảng**.
- **Số từ và chữ:** đếm **theo từng câu**, mọi chuỗi trẻ nghe (`prompt`, `hint`, `explanation_*`, `feedback*`, `sentence`, `examples`, `example`, `messages`, `label`, `tag`, `fact`, `title`, `term`) — **0 câu EN quá tám từ** ở cả bảy bài. Chuỗi `.en` không có dấu tiếng Việt; `.vi` không có chữ số, không ký hiệu. 0 cặp `.en/.vi` thiếu một nửa.
- **SK-044:** 0 lựa chọn sai thiếu `feedback`, 0 lựa chọn đúng có `feedback`, mọi `feedback` một câu và nói về chính vật bé chọn; máy bắt 20 chỗ "feedback chứa chữ của đáp án đúng", đọc tay cả 20 đều là chữ chung của chủ đề ("cây", "lá", "hoa", "plant") chứ không gọi tên đáp án. `true_false`: `answer: false` → có `feedback_true`, `answer: true` → có `feedback_false`, **0 câu đặt sai phía**.
- **SK-047:** 0 `hint`, `feedback`, `explanation` nào nhắc vị trí thẻ ("first/second/left/right/last", "thẻ đầu", "bên trái", "đầu tiên", "cuối cùng"). Bảy `explanation_correct` của q6 đúng câu `correction` ở mục Misconceptions, đứng một mình được, không mở đầu "Yes!" · "Đúng rồi!". Một `hint` trùng ba từ với `prompt` (xem n3), còn lại sạch.
- **`true_false` (29 câu):** câu nào cũng khẳng định (0 "not/no/never/không/chưa"), 0 câu có `labels`, câu nào cũng có hình; `explanation_wrong` đúng khuôn "This is false." · "Câu này sai." và "This is true." · "Câu này đúng.". Cân Đúng/Sai: **10 Đúng · 19 Sai** (bỏ 7 câu q6: 10 Đúng · 12 Sai), **bài nào cũng có cả hai** — đúng con số ghi ở `_topic.md:333`.
- **Misconception:** 7 key khai báo đều dùng **đúng một lần**, đúng bài, đúng câu q6; 0 key khai báo mà bỏ không; **0 trùng key với bất kỳ chủ đề nào trong `content/`** (quét cả ba nhóm tuổi), kể cả `plants_not_alive`, `plants_grow_anywhere` của *Sinh vật sống ở đâu?*.
- **Từ vựng:** 28 từ, 4 từ mỗi bài, 2–3 `core`; `word_list.term_keys` khớp **đúng** danh sách `core` từng bài và khớp bảng `_topic.md:385-391`. Không từ nào trùng trong chủ đề. Ba từ trùng chủ đề khác (`warm`, `flower`, `leaf`) đều là trùng có chủ ý, đã ghi dòng `>`. Key `tree_trunk` tránh đúng key `trunk` (vòi voi) ở *Gọi tên và nhóm động vật* bài 5; kiểm lại `WordDecks.swift`: bộ thẻ theo bài, nhận theo `id`, không gộp theo chữ → kết luận của content-editor đúng.
- **Kệ Chơi:** **28/28 ví dụ** ở "Màn Chơi, ví dụ để kiểm" (Ghi chú cho dev bảy bài) tính lại theo `all_required_and_no_limit` ra đúng `balanced` · `has_limited` · `missing.*`. `messages.full` đúng chữ chung cả bảy bài; `has_limited` đúng với **mọi** món bẫy của từng bài (đọc tay từng món).
- **Hình (phần trong bài, không kiểm ảnh đã fetch):** 0 chỗ có hình mà thiếu `image.brief`, `image.alt.en` hay `image.alt.vi`. **207 chỗ "Dùng lại hình": mọi key có thật**, truy vấn đầu chép đúng gốc ở cả 207 chỗ. Đúng 7 chỗ `alt` khác gốc, **cả 7 nằm trong danh sách "`alt` riêng" `_topic.md:296`** (0 chỗ tự ý đổi). Bảng "Hình của chủ đề khác" đúng hai chiều: 28 hình dùng thật ↔ 28 dòng bảng, 0 thừa 0 thiếu. Đếm máy ảnh mới: bài 1: 6 · bài 2: 6 · bài 3: 5 · bài 4: 7 · bài 5: 10 · bài 6: 3 · bài 7: 2 = **39**, đúng từng con số ở `_topic.md:297`. Một câu, một kệ, một loại hình: **0 chỗ trộn** (toàn ảnh chụp). "Ghi chú cho hoạ sĩ" bảy bài đều có đủ ảnh mới, ảnh dùng lại, `alt` riêng, ảnh khó, màu.
- **Không lộ đáp án:** quét cả chủ đề theo "lần đầu bé nhìn thấy ảnh", **chỉ bài 2 q5** có đáp án là ảnh lần đầu duy nhất (đúng chỗ content-editor đã nêu ở Còn mở 6); mọi câu khác cân. `alt` của lựa chọn đúng không chứa chữ riêng của câu hỏi (hai chỗ máy bắt là chữ chung "leaves", "flower" mà cả ba lựa chọn đều có).
- **Ranh giới và chữ cấm:** grep mọi chuỗi trẻ nghe ra **0 kết quả** cho "quang hợp", "photosynthesis", "thụ phấn", "pollen", "pollinat", "chlorophyll", "diệp lục", "xylem", "mạch", "nhiệt độ", "temperature", "℃", "độ C", "thermometer", "nhiệt kế", "củ lạc", "cánh hoa giấy", "khoai", "hành", "gừng", "cây đa", "banyan", "fair test", "thước", "cm", "vòng đời". Ba chỗ máy bắt "every plant/all plants/cây nào cũng" đều là **câu misconception cố ý sai** (bài 1 q6, bài 7 q6). Bài 1 không có "mọi cây", "cây nào cũng", "every plant". Bài 2 có đúng một câu "quá nhiều nước cũng không tốt" (ô No water ví dụ ba + q6), không giải thích úng rễ; "thiếu sáng thân dài" luôn kèm "yếu" (`02:159-160`). Bài 3 hình chính là cây bàng, brief cấm cây đa; "lá giúp cây làm ra thức ăn" đúng một lần, không giải thích. Bài 5 không khoai tây, khoai lang, hành, gừng; "hạt lạc" không "củ lạc"; cà chua là "quả"; rau muống chỉ ở ô Thân và lá. Bài 7 ví dụ cây không có hoa chỉ dương xỉ và rêu; chỉ nói "hoa giấy".
- **An toàn:** 0 câu rủ bé nếm, ăn, hái. Lời dặn đủ và đúng chỗ: hạt không nhét vào mũi, tai (`01:112-113`), rửa tay sau khi sờ đất (`03:129-130`, một lần trong chủ đề), rau quả là món người lớn nấu, người lớn đưa (`05:161-164`), ngắm hoa không hái (`07:186-187`, ý chính ba, q3), cành hoa giấy có gai (`07:188-189`). Không cây độc cụ thể, không cây chết rét, không thiên tai.
- **Không chép Oak:** đọc hết hai file `docs/oak/`; không dùng sồi, nhựa ruồi, sung dâu, anh túc, lưu ly, cúc, thuỷ tiên; không câu "tranh cây thiếu rễ", "nối bộ phận với số trên hình", "app nhận diện cây", "tra sách, tra mạng"; không ℃, nhiệt kế, thước, cm; không fair test. So 49 `prompt.en` của chủ đề với mọi `prompt.en` đã có trong `content/`: không câu nào giống trên 80% (các chỗ 0.81–0.92 đều là khuôn chung "Which one is a …?", "Start with … Put them in order.").
- **Khởi động theo giãn cách:** bài 1 ôn *Sinh vật sống ở đâu?* bài 1 và *Cơ thể của em* bài 6; bài 2 ôn *Sinh vật sống ở đâu?* bài 5 và bài 1 của chủ đề; bài 3–6 mỗi bài một câu ôn bài ngay trước cộng một mốc dài; bài 7 (`review`) ba câu: bài 6, bài 3 (cách bốn bài) và *Thời tiết và các mùa* bài 2 (khoảng một tháng) — đúng "Bảng soạn" và `_topic.md:346-360`. Bài 2 không dùng xương rồng, sen làm câu hỏi (ranh giới với #2 bài 5).
- **48 dòng `[CẦN KIỂM]` trong bảy bài (và 18 ở `_topic.md`) tester đọc hết; ở mức 5–7 tuổi không thấy chỗ nào sai rõ:** nhiều cây mọc từ hạt (dương xỉ, rêu không có hạt); rễ nhú trước, mầm lên sau; hạt mít to nhẵn, hạt xoài to dẹt; xoài, mít mọc được từ hạt; quả mít mọc trên thân (cauliflory); giá đỗ từ đậu xanh, ủ tối thì trắng dài; cỏ dưới tấm bạt vàng nhợt; tưới kịp thì cây tươi lại; tưới quá nhiều cây cũng yếu; rễ giữ cây và toả rộng; vỏ cây bọc thân; cành mọc từ thân, mang lá hoa quả; nụ → hoa → quả ở bí, ớt; quả xoài mọc từ hoa; cà rốt, củ cải trắng là rễ; mía là thân; súp lơ là chùm nụ hoa; lạc, đậu, sen là hạt; lá dừa là lá kép xẻ dải; lá phượng và lá trinh nữ là lá kép li ti; tàu lá dừa dài hơn cái giường; hướng dương cao hơn trẻ; hạt hướng dương ở giữa bông; dương xỉ, rêu không có hoa; dương xỉ có trước khủng long. Bốn chỗ **phải để người chuyên môn chốt, không phải tester**: tên EN "kapok tree" cho cây gạo (xem N3), "shoot" hay "sprout" (`01:521`), "flowering plant" (`04:578`), "Mọi quả đều phát triển từ hoa" (`05:494`, đúng với cây có hoa nhưng là câu khái quát duy nhất của chủ đề).
- **Hai mục Còn mở tester được hỏi:** (6) bài 2 q5 — **giữ nguyên**: ba lựa chọn đều là ảnh cây ngoài trời cùng kiểu, bé không biết ảnh nào "mới", và màu vàng nhợt chính là bằng chứng câu hỏi cần. (7) bài 7 q6 — **giữ hình hàng rau non**: không đẩy về phía misconception, cũng không tự làm bằng chứng; `explanation_correct` nói đúng lý do (dương xỉ).

### Lỗi chặn (1)

**C1. Năm chỗ `image.brief` trỏ "Dùng lại hình" vào một hình vốn đã là hình dùng lại (chuỗi hai chặng). Làm theo brief thì file chọn ảnh không hợp lệ và `images fetch` lỗi — không đạt tiêu chí "phiên chính" của ticket.**

- Luật của công cụ: `tools/content-cli/src/images/selection.ts:88` (`same_as` trong cùng file trỏ vào một `same_as` → lỗi "… cũng là same_as; trỏ thẳng tới mục có ảnh") và `selection.ts:225` (`same_as` sang bài khác mà mục đó lại dùng lại ảnh của bài khác → lỗi "trỏ thẳng tới chỗ gốc"). `images search` sinh thẳng `same_as` từ brief (`src/images/search.ts:269`, `:281`) và **không** đi tiếp qua brief liên bài (`reuseTarget` trả `undefined` khi brief nêu bài khác, `src/images/slots.ts:180`), nên designer không tự thoát được nếu giữ nguyên brief.
- Quét toàn repo: **0/0 chuỗi như vậy** trong mọi `content/images/**/*.json` hiện có — đây là nếp chung, chủ đề này là chỗ đầu tiên lệch.

| Chỗ | Brief hiện tại | Mục đích đến thật | Sửa |
| --- | --- | --- | --- |
| `03-cay-to-re-than-canh-la.md:242` (món `tray_sparrow`) | `tray_sparrow` ở `chuoi-thuc-an/so-sanh-cac-chuoi-thuc-an` — mục đó là `same_as` sang `goi-ten-va-nhom-dong-vat/chim-va-bo-sat` | `goi-ten-va-nhom-dong-vat/chim-va-bo-sat` `tray_sparrow` (ảnh thật) | "Dùng lại hình `tray_sparrow` ở bài `goi-ten-va-nhom-dong-vat/chim-va-bo-sat`." — `alt` ("A sparrow on a branch" · "Chim sẻ đậu trên cành") và truy vấn giữ nguyên; sửa kèm `_topic.md:290` |
| `03:366` (q3) và `03:522` (từ `branch`) | `explore_branches` trong cùng bài — mà `03:157` lại là "Dùng lại hình `mango_card` ở bài `thoi-tiet-va-cac-mua/mua-mua-va-mua-kho`" | `thoi-tiet-va-cac-mua/mua-mua-va-mua-kho` `mango_card` (ảnh thật) | "Dùng lại hình `mango_card` ở bài `thoi-tiet-va-cac-mua/mua-mua-va-mua-kho`. Từ khoá tìm ảnh (EN): mango tree fruit" — `alt` giữ nguyên |
| `05-rau-qua-ta-an-la-phan-nao-cua-cay.md:87` (w2) | `tray_lime` ở `co-the-cua-em/nem-va-so` — mục đó là `same_as` sang `co-the-cua-em/nam-giac-quan-cua-em` | `co-the-cua-em/nam-giac-quan-cua-em` `tray_lime` (ảnh thật) | "Dùng lại hình `tray_lime` ở bài `co-the-cua-em/nam-giac-quan-cua-em`. Từ khoá tìm ảnh (EN): lime cut in half wooden board" — `alt` giữ nguyên; sửa kèm `_topic.md:293` |
| `07-hoa-nhieu-mau-nhieu-hinh.md:548` (từ `petal`) | `explore_petals` trong cùng bài — mà `07:145` lại là "Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`" | `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha` `w1_lotus` | "Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond"; thêm "từ `petal`" vào cột "Dùng ở" `_topic.md:269` |

- **Không nằm trong mục này:** ba chỗ bài 7 trỏ in-file vào `explore_no_flowers` (`07:308` `tray_fern`, `07:571` từ `fern`, `07:599` `fern_card`) **hợp lệ**, vì `explore_no_flowers` là mục **chép đầy đủ** từ Discoverer `khung-long/trai-dat-rat-lau-ve-truoc` (không phải `same_as`), đúng như "Ghi chú cho hoạ sĩ" bài 7 và `_topic.md:294` đã dặn. Designer nhớ chép mục, đừng để `images search` sinh `same_as` sang nhóm tuổi khác.

### Nên sửa (5)

**N1. Lệnh màn Chơi bài 7 dùng đúng động từ mà bài vừa dạy là không nên làm.**
- `07-hoa-nhieu-mau-nhieu-hinh.md:228` `prompt.en: Pick pink, yellow and red flowers`, trong khi `07:32` ý chính ba "Look at flowers, but do not pick them.", `07:186` ví dụ ô Colours "look, but do not pick", và `07:406` q3 "We pick the flowers we see in parks." có đáp án **Sai**.
- Bé 5–7 tuổi học tiếng Anh nghe "pick" ở ba chỗ dạy "đừng hái", rồi màn Chơi lại bảo "Pick … flowers". Bản VI đã tránh đúng ("Chọn hoa màu hồng…"), chỉ EN lệch.
- **Sửa:** `07:228` → `prompt.en: Choose pink, yellow and red flowers` (hoặc "Find three flowers of three colours."). Sửa kèm `_topic.md:372`. Bài 6 (`06:202` "Pick long, round and tiny leaves") không bị vì bài 6 không dạy "đừng hái lá", nhưng đổi cả hai cho đều thì gọn hơn.

**N2. `hint` bài 6 q6 đọc thành "banana tree", trái luật không gọi cây chuối là "tree".**
- `06-la-cay-nhieu-hinh-nhieu-co.md:469` `hint.en: Think of banana and flame tree leaves.` — cụm "banana and flame tree" rất dễ nghe thành "banana tree và flame tree"; `_topic.md:169` và "Lỗi hay gặp" 18 cấm đúng chuyện này, và chính bài 6 đã cẩn thận dùng "banana plant", "coconut palm" ở mọi chỗ khác. Bản VI (`06:470` "lá chuối và lá phượng") đúng.
- **Sửa:** `06:469` → `hint.en: Think of banana leaves, then flame leaves.` (7 từ) hoặc `Think of one long leaf and tiny leaves.` (8 từ).

**N3. Thẻ thưởng bài 3 gọi cây gạo là "Kapok tree"; truy vấn ảnh có thể kéo về đúng loài sai.**
- `03-cay-to-re-than-canh-la.md:544` `name.en: Kapok tree`, `03:550` `image.brief` liệt kê ba truy vấn, truy vấn thứ ba là `kapok tree red flowers`. Brief đã ghi rõ "Loài phải là *Bombax ceiba*", nhưng trong tiếng Anh "kapok tree" thường là *Ceiba pentandra* (hoa trắng hồng, không nở trên cành trụi lá), nên truy vấn 3 dễ trả ảnh sai loài, làm `fact.en` "Its red flowers bloom on bare branches." không khớp ảnh. `[CẦN KIỂM]` `03:554` đã nêu đúng vấn đề nhưng chữ bé nghe vẫn giữ.
- **Sửa (hai việc, việc đầu làm ngay):** bỏ truy vấn `kapok tree red flowers` ở `03:550`, giữ hai truy vấn đầu (`Bombax ceiba tree flowers`, `red silk cotton tree bloom`); tên thẻ để PM/người chuyên môn chốt theo Còn mở 4 (phương án: `Red silk cotton tree` hoặc `Cotton tree`, kèm `_topic.md:404`).

**N4. Kệ Chơi bài 3: nhãn món trùng y hệt nhãn nhóm (cả EN lẫn VI).**
- Nhóm `03:207-208` `tray_root` "Roots · Rễ" ↔ món `03:247-248` `tray_roots` "Roots · Rễ cây"; nhóm `03:213-214` `tray_trunk` "Trunk · Thân cây" ↔ món `03:263-264` `tray_big_trunk` "Trunk · Thân cây" (**trùng hoàn toàn**).
- Trên màn Chơi, nhãn nhóm và nhãn món nằm cùng màn; giọng đọc và VoiceOver đọc hai thẻ giống hệt nhau. Cùng loại lỗi n9 của SK-049 (đã sửa bên đó). Sáu bài còn lại không có chỗ nào trùng.
- **Sửa:** món → `03:247-248` "Big roots · Rễ to ở gốc"; `03:263-264` "Thick trunk · Thân cây to". Sửa kèm `_topic.md:368`.

**N5. Bài 6 q5: đáp án đúng gọi tên cả cây và `alt` nói về hoa, trong khi câu hỏi hỏi về lá.**
- `06:441-442` `q5_mimosa` `label.en: sensitive plant` · `label.vi: cây trinh nữ`, `06:445-446` `alt` "A sensitive plant with pink flowers" · "Cây trinh nữ có hoa màu hồng"; câu hỏi `06:415` "Which leaves look like flame tree leaves?" và hai lựa chọn kia là "banana leaf", "Indian almond leaves".
- Đáp án đúng thành lựa chọn duy nhất không gọi tên lá, lại là ảnh duy nhất có hoa — bé có thể chọn đúng vì "khác hai cái kia", không vì hình lá. Ảnh gốc có lá kép rõ (brief `sinh-vat-song-o-dau/02:164`), nên chỉ cần sửa chữ.
- **Sửa:** `06:441-442` → `label.en: sensitive plant leaves` · `label.vi: lá trinh nữ`; nếu được thì thêm một dòng `alt` riêng ("Tiny leaves on a branch" · "Lá li ti trên cành") vào danh sách `_topic.md:296` và dặn designer cắt vào phần lá. Nếu không đổi `alt` thì ít nhất đổi nhãn.

### Nhỏ (10)

**n1. Vị trí đáp án đúng lệch hẳn về chỗ 2.** 24 câu có lựa chọn: ba lựa chọn → chỗ 2 **16 câu**, chỗ 3 **2 câu**, chỗ 1 **0 câu**; hai lựa chọn → chỗ 2 **6 câu**, chỗ 1 **0 câu**. Không tới tay bé vì SK-047 xáo lựa chọn theo `attempt_id` (`LessonSession.swift:390`, `SeededOrder.swift:42`), nên không phải lỗi; nhưng chủ đề này không có bảng "Vị trí đáp án" như `co-the-cua-em/_topic.md`, và khi đọc trên giấy thì rất dễ đoán. Nếu muốn giữ nếp cũ: rải lại và thêm một dòng vào `_topic.md`.

**n2. Một ô bảng lệch một chữ:** `_topic.md:405` `fact` bài 4 ghi "…when the sun is bright." trong khi bài ghi "the Sun" (`04:590`). Chủ đề viết hoa "Sun"/"Mặt Trời" ở mọi chỗ khác → sửa bảng.

**n3. `hint` bài 1 q5 lặp ba từ của câu hỏi:** `01:434` "Each seed grows into its own plant." so với `01:429` "A mango seed grows into what?". Không lộ đáp án (không nêu xoài) nhưng nghe như đọc lại. Đề xuất: `hint.en: Each seed makes its own kind of plant.` (8 từ, bám đúng ví dụ hai ô Seeds).

**n4. Câu EN lặp nguyên văn ở hai, ba chỗ bé nghe gần nhau:** "Think of the pumpkin vine." ở `04:521`, `05:53`, `05:487` (ba lần, hai bài liền nhau); `06:351` `prompt` q2 = `06:171` câu chính ô Tiny leaves; `07:385` `prompt` q2 = `07:161` câu chính ô Shapes. Không phá luật nào (q2 là DOK 1 nhớ lại) nhưng hai câu q2 thành đọc lại y hệt ô Học; đổi một trong hai chỗ sẽ bớt cảm giác lặp.

**n5. Lời `balanced` bài 5 nói rộng hơn mâm cơm:** `05:211` "Great! Every food here comes from plants." — "here" lúc cân là ba món đúng, nhưng kệ vẫn còn trứng và cá. Đề xuất: "Great! These three foods come from plants." (7 từ).

**n6. Bài 4 ô Stem ví dụ ba "water spinach has a hollow stem" (`04:143-144`)** đứng trước bài 5, nơi rau muống **cố ý** không gắn vào một bộ phận. Câu nói về cấu tạo (đúng), không nói "ta ăn thân", nên tester không đề xuất đổi; chỉ nêu để content-editor biết bé có thể nhớ "rau muống = thân" trước khi học bài 5.

**n7. Hoa giấy nằm nhóm "Pink" ngay sau ô dạy "hoa giấy có rất nhiều màu"** (`07:320-322` món, `07:179-180` câu chính ô Colours). Ảnh là hoa giấy hồng nên không sai; `_topic.md:378` đã ghi lý do chọn ảnh một màu. Chỉ cần designer giữ đúng ảnh một màu hồng tím.

**n8. `_topic.md:377` liệt kê nếp "nhãn nhóm trùng nhãn ô Học" cho bài 2, 6, 7 nhưng bài 3 cũng vậy** (Roots, Trunk). Thêm bài 3 vào dòng đó cho khớp bài.

**n9. Chủ đề *Cơ thể của em* chỉ được ôn qua đúng một bài:** bài 1 w2 và bài 5 w2 đều `recall_from` `co-the-cua-em/nem-va-so` (hai câu khác nhau, hợp lệ). Nếu muốn trải đều mốc ôn thì một trong hai chuyển sang bài khác của #6.

**n10. Bài 3 kệ Chơi có cả `tray_bark` (vỏ cây) lẫn `tray_big_trunk` (thân cây) trong nhóm Trunk** (`03:230`, `03:262`): đúng ý "vỏ bọc quanh thân", nhưng bé vừa học vỏ cây là một thứ riêng (từ `bark`), nên hai món cùng nhóm có thể gây lăn tăn. `_topic.md:368` đã ghi rõ nhóm gồm cả hai; để nguyên được, chỉ nêu.

### Đã sửa (content-editor 18/11, sau rà chữ)

Chỉ sửa trong `content/explorer/cay-quanh-em/`; không đổi, không xoá `id` nào; không đổi key ô, món, lựa chọn.

- **C1 (đã sửa):** năm chỗ trỏ thẳng về mục có ảnh thật, sửa kèm `_topic.md` (bảng "Hình của chủ đề khác", thêm dòng luật "không trỏ chuỗi hai chặng") và "Ghi chú cho hoạ sĩ" từng bài:
  - bài 3 món `tray_sparrow` → "Dùng lại hình `tray_sparrow` ở bài `goi-ten-va-nhom-dong-vat/chim-va-bo-sat`.";
  - bài 3 câu `q3` (hình câu) và từ `branch` → "Dùng lại hình `mango_card` ở bài `thoi-tiet-va-cac-mua/mua-mua-va-mua-kho`.";
  - bài 5 câu `w2` (hình câu) → "Dùng lại hình `tray_lime` ở bài `co-the-cua-em/nam-giac-quan-cua-em`.";
  - bài 7 từ `petal` → "Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`.".
  - `alt` và truy vấn giữ nguyên. Đã grep lại: không còn chỗ nào trỏ vào một mục vốn là hình dùng lại (ba chỗ bài 7 trỏ `explore_no_flowers` hợp lệ vì đó là mục chép đầy đủ).
- **N1 (đã sửa):** bài 7 `prompt.en` → "Choose pink, yellow and red flowers"; bài 6 đổi cho đều → "Choose long, round and tiny leaves"; bài 5 `messages.start.en` → "Choose a root, a flower and a seed.". Bảng Phần Chơi `_topic.md` sửa kèm.
- **N2 (đã sửa):** bài 6 q6 `hint.en` → "Think of banana leaves, then flame leaves." (VI giữ).
- **N3 (đã sửa phần đầu):** bài 3 `kapok_card` bỏ truy vấn "kapok tree red flowers", còn "Bombax ceiba tree flowers; red silk cotton tree bloom". Tên thẻ "Kapok tree" giữ, chờ PM, người chuyên môn chốt (ghi ở bảng Thẻ thưởng `_topic.md`).
- **N4 (đã sửa):** bài 3 món `tray_roots` → "Big roots" · "Rễ to ở gốc"; món `tray_big_trunk` → "Thick trunk" · "Thân cây to". Ví dụ kiểm màn Chơi ở "Ghi chú cho dev" và bảng Phần Chơi `_topic.md` sửa kèm.
- **N5 (đã sửa):** bài 6 q5 `q5_mimosa` nhãn → "sensitive plant leaves" · "lá trinh nữ"; `alt` riêng "Tiny leaves on a branch" · "Lá li ti trên cành" (thêm vào danh sách `alt` riêng `_topic.md`; designer cắt khung vào phần lá); `explanation_wrong` → "The answer is the sensitive plant leaves. They are tiny." · "Đáp án là lá trinh nữ. Lá trinh nữ li ti.".
- **n2 (đã sửa):** bảng Thẻ thưởng `_topic.md` "the Sun".
- **n3 (đã sửa):** bài 1 q5 `hint.en` → "Each seed makes its own kind of plant.".
- **n5 (đã sửa):** bài 5 `messages.balanced` → "Great! These three foods come from plants." · "Tuyệt! Ba món này đều từ cây mà ra.".
- **n8 (đã sửa):** `_topic.md` dòng "nhãn nhóm trùng nhãn ô Học" thêm bài 3 ("Roots", "Trunk").
- **Giữ nguyên, có quyết định:**
  - n1: không rải lại vị trí đáp án và không thêm bảng (app xáo lựa chọn từ SK-047; bảng vị trí đã hết hiệu lực 15/11).
  - n4: giữ "Think of the pumpkin vine." và hai câu q2 đọc lại câu chính ô Học (q2 là DOK 1 nhớ lại; không phá luật).
  - n6: giữ ví dụ "water spinach has a hollow stem" (nói cấu tạo, không nói "ta ăn thân").
  - n7: không sửa chữ; designer giữ ảnh hoa giấy một màu hồng tím.
  - n9: giữ hai câu ôn cùng *Cơ thể của em* bài 6 (hai câu khác nhau, cùng nối sang rau quả của chủ đề này).
  - n10: giữ vỏ cây trong nhóm Trunk (đúng ý "vỏ bọc quanh thân", câu q2 dạy điều này).

## Ghi chú designer (18/11)

**Đã làm:**
- Bảy file chọn ảnh `content/images/explorer/cay-quanh-em/{cay-moc-len-tu-hat,cay-can-gi-de-lon,cay-to-re-than-canh-la,cay-co-hoa-re-than-la-hoa,rau-qua-ta-an-la-phan-nao-cua-cay,la-cay-nhieu-hinh-nhieu-co,hoa-nhieu-mau-nhieu-hinh}.json`: 246/246 chỗ có hình (33 · 36 · 33 · 38 · 39 · 31 · 36), 0 chỗ trống. Dựng từ `images search` (chạy lại `--cache-only` cho bài 3, 5, 6, 7 sau khi content-editor sửa brief) cộng tìm tay trên Commons, Openverse.
- **Ảnh mới: 34** (bài 1: 5 · bài 2: 3 · bài 3: 5 · bài 4: 6 · bài 5: 10 · bài 6: 3 · bài 7: 2). Giấy phép: CC0 13, Public domain 3, CC BY 18 (2.0: 7, 3.0: 3, 3.0 us: 1, 4.0: 7; ghi công đủ, `title` giữ như nguồn). 0 BY-SA/NC/ND. Mỗi ảnh đã kiểm giấy phép qua Commons API (cùng hàm `classifyCommons` của content-cli) và xem ảnh: không mặt người, không chữ (súp lơ cắt bỏ góc biển giá; trinh nữ cắt bỏ chữ ký góc dưới), không logo. Một ảnh nguồn Flickr qua Openverse (cây ớt, blumenbiene, CC BY 2.0): `fetch` in "Kiểm tay"; trang Flickr ghi CC BY 2.0 (đã kiểm 18/11).
- **Dùng lại:** 85 mục `same_as` sang chủ đề khác (30 hình gốc), 1 sang bài khác cùng chủ đề, 32 trong bài; 83 mục là bản cắt khung riêng (5:2, 17:10, 2:1, 4:3) của cùng ảnh gốc khi không có mục sẵn đúng khung (kể cả ảnh gốc của bài khác trong chủ đề: đổi ảnh gốc thì phải đổi cả các bản cắt, grep `bản cắt khung` trong note); 1 mục chép từ Discoverer (`tray_fern`, dương xỉ *Nephrolepis cordifolia*, CC BY 4.0). Các `same_as` trỏ thẳng về mục gốc (không qua hai chặng), gồm 5 chỗ tester C1.
- **Hình tự vẽ (quyết định 10): 5 hình, 10 file** ở `content/images/own/cay-quanh-em/`: `bean-sprout.jpg` (+ `.2x1`), `flowering-plant-roots.jpg` (+ `.2x1`), `pot-fresh.jpg`, `pot-drooping.jpg`, `pot-dry.jpg` (+ `pot-fresh.17x10`, `pot-drooping.17x10`, `pot-drooping.2x1`). Hình gần thực tế, nền kem, bóng nướng sẵn, không chữ; `own.method: drawn`. Ba chậu cùng chậu đất nung, cùng cửa sổ có nắng, chỉ khác lượng nước. Đã tìm trước khi vẽ: Commons (mung bean / Vigna / Phaseolus / Vicia germination, radicle, uprooted flowering plant, wilted potted plant…), Openverse; chỉ có hạt nảy mầm hàng loạt, tranh trường học có chữ, hoặc BY-SA.
- Icon: `design/icons/topics/growing-plants.svg` chuyển sang `design/icons/topics/_retired/` (như SK-050); `Topic-Icons.dc.html` bỏ ô "10 · Trồng cây", Explorer 11 chủ đề, đánh lại số 10–11, mô tả "44 icon"; `journey-roadmap-spec.md` mục 8 (danh sách 44 icon, Explorer 11, bỏ dòng `growing-plants`, dòng #7 thêm tên EN), bảng file mục đầu (44 icon) và mục 3 (chặng Explorer 9–11, `stopRange` `8..<11`). ios-dev chạy `import-topic-icons.sh` được rồi.

**Chỗ lệch brief, cần người khác xem:**
1. **`explore_wilt` bài 2 (Học, món Chơi `tray_wilted`, q3, từ `wilt`) dùng hình vẽ chậu rũ** của bộ q4: không tìm được ảnh chậu cây rũ lá hợp giấy phép. Quyết định 10 chỉ nói q4; PM xác nhận cho dùng rộng hơn, hoặc content-editor đổi. Hệ quả: kệ Chơi bài 2 có một món hình vẽ giữa ảnh chụp (trái luật "cả kệ Chơi là ảnh chụp"); q3 hai lựa chọn đều là hình vẽ (`pot-fresh.17x10`, `pot-drooping.17x10`) để cùng kiểu; q4 cả ba thẻ là hình vẽ (`q4_fresh` là hình vẽ riêng, không `same_as explore_needs` như brief ghi; `q4_drooping` `same_as explore_wilt`). Đề xuất content-editor đổi brief `q4_fresh`, `q4_drooping`, `q3_*` sang `[hình vẽ]`.
2. **`explore_sprout` bài 1 là hình vẽ** (đã được đồng ý) nhưng q4 bài 1 trộn: `q4_seed` ảnh đậu xanh, `q4_sprout` hình vẽ, `q4_seedling` ảnh cây đậu con trong chậu (trái luật mục 9 "ba thẻ cùng kiểu"). Kệ Chơi bài 1 cũng có một món vẽ. Phương án: PM cho vẽ thêm hạt và cây con cùng nét (ba thẻ vẽ), hoặc giữ.
3. **`q5_grass` bài 2 (đáp án) TẠM `same_as explore_dark`** (giá đỗ, bản cắt 5:2): không có ảnh cỏ vàng dưới tấm bạt hợp giấy phép (Commons có ảnh bệnh cỏ có số watermark, cỏ chết vì hạn). `alt` "A pale patch on green grass" không khớp hình tạm. content-editor chọn: đổi đáp án q5 sang giá đỗ (alt "White bean sprouts") và đổi lời giải thích, hoặc PM cho vẽ.
4. **`explore_warm` bài 2:** không có ảnh mạ dưới vòm nilon hợp giấy phép; dùng "Seedlings in Green House" (ProFlowers.com, CC BY 2.0): cây non dưới mái nilon nhà kính. Đề xuất content-editor đổi `alt` thành "Young plants under a plastic roof" · "Cây non dưới mái nilon" (từ `warm` dùng chung ảnh này).
5. **`explore_look` bài 4 (hoa mười giờ):** ảnh CC BY 3.0 (Aris riyanto) là hoa kép màu hồng, không có màu cam; `alt` riêng q1 "Bright pink and orange petals" lệch. Đề xuất đổi thành "Bright pink petals" · "Những cánh hoa hồng tươi". Hầu hết ảnh *Portulaca grandiflora* trên Commons là BY-SA.
6. **`q2` bài 5 (mía):** ảnh thân mía tím đang đứng trong vườn (Starr, CC BY 3.0 us), không phải bó mía đã chặt; khớp `alt` "Purple sugarcane stalks".
7. **`explore_stem` bài 4:** "Corn marigold with knapweed" (CC0): hoa cúc vàng trên thân xanh cao giữa cỏ; thân không thật nổi. Có thể đổi ảnh tốt hơn khi có.
8. **`explore_tree_trunk` bài 3:** thân cây to nhìn từ gốc lên, cây trụi lá (Thuỵ Điển, PD). Thấy rõ thân và cành; không có lá.
9. **`kapok_card`:** "Bombax ceiba 253588271" (madhavan a.p, CC BY 4.0): hoa gạo đỏ trên cành trụi lá nền trời; trang gốc ghi đúng loài *Bombax ceiba* (không phải *Ceiba pentandra*).
10. Loài khớp trang gốc: bàng (*Terminalia catappa*), phượng (*Delonix regia*), hoa giấy (*Bougainvillea spectabilis*), dương xỉ (*Nephrolepis cordifolia*), mít (*Artocarpus heterophyllus*), xoài (*Mangifera indica*), bí (*Cucurbita maxima*). Hoa mai, hoa đào, hoa sen, rêu dùng lại ảnh của chủ đề trước (đã kiểm ở SK-050, SK-045).
11. **`tray_radish` bài 5:** đổi từ ảnh SaatPilot (bản gốc 1254 px, `fetch` bị HTTP 429 liên tục khi tải bản gốc) sang "Daikon - Harbourside Market, Wellington" (Daderot, CC0): bốn củ cải trắng dài còn cuống lá, cắt bỏ mép dưới. Cây gạo cũng đổi vì cùng lý do (mục 9).
12. **`q5_mimosa` bài 6:** cắt vào lá kép bên phải của `explore_sensitive` (bỏ hoa, bỏ chữ ký góc dưới) nên ảnh chỉ 486×194 px; thẻ 5:2 trên iPhone hơi mờ. Nếu cần nét hơn: dùng ảnh riêng "Mimosa pudica leaves close up" (NonNerd, CC0, 4320 px) thay vì cắt `explore_sensitive` (content-editor đổi brief).
13. Bài 2 có `same_as` sang các file chọn ảnh đang có thay đổi chưa commit của phiên khác (`sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song.json`, `vat-song-hay-khong-song.json`); tôi chỉ đọc, không sửa. Commit các file đó cùng lúc với chủ đề này.

**Kết quả lệnh (18/11):** `npm --prefix tools/content-cli run images -- fetch content/images/explorer/cay-quanh-em`: 7 file chọn ảnh · 135 ảnh khác nhau · 0 lỗi; hình tự vẽ 10; 0 cảnh báo ảnh lệch khung, 0 bài "chưa kiểm tỉ lệ". (Các lượt trước gặp HTTP 429 của upload.wikimedia.org với bản gốc nhỏ; chạy lại, đổi 2 ảnh như trên.) Chưa chạy `build`, `validate` (phiên chính chạy).

**Lượt 2 (18/11, làm theo quyết định 11–16):** chỉ sửa file chọn ảnh và `content/images/own/cay-quanh-em/`. `alt` không nằm trong file chọn ảnh (chỉ ở `.md`), nên quyết định 14, 15 ở phía designer chỉ là sửa `note` cho khớp; `title` của ảnh nguồn giữ đúng như nguồn.
- **QĐ 11 (bài 2):** `q5.q5_grass` → `q5.q5_sprouts`, giữ bản cắt 5:2 của `explore_dark` (giá đỗ).
- **QĐ 12 (bài 2):** `q4_fresh` là mục `own` gốc (`pot-fresh.jpg`); `q3_green` là bản khung 17:10 của nó (`pot-fresh.17x10.jpg`); bỏ `tray.tray_wilted`, thêm `tray.tray_dry_grass` `same_as learn.explore.explore_dry` + `lesson noi-song-tren-trai-dat/dong-co-xavan` (mục gốc "Savanna Grasslands", CC BY 3.0). Bỏ ghi chú "cần PM xác nhận" ở `explore_wilt`.
- **QĐ 13 (bài 1):** vẽ 2 hình mới, cùng nền kem, cùng đất, cùng hạt và lá với `bean-sprout.jpg`, 1024×1024, không chữ: `bean-seeds.jpg` (một nhúm hạt đậu xanh trên mặt đất) cho `q4.q4_seed`, `bean-seedling.jpg` (cây đậu con: rễ nhiều nhánh, hai lá mầm teo, hai tầng lá thật) cho `q4.q4_seedling`; cả hai `own.method: drawn`. Ảnh chụp "Pinto Bean Plant Growth" chuyển sang `tray.tray_seedling` (gốc); `vocab.soil` ghi là bản cắt của `tray.tray_seedling`. `tray.tray_sprout` (giữ key) → `same_as learn.explore.explore_dark` + `lesson cay-quanh-em/cay-can-gi-de-lon`. Script vẽ ở scratchpad của phiên (`sk051/draw/q4.mjs`), không nằm trong repo.
- **QĐ 16 (bài 6):** `q5.q5_mimosa` → "Mimosa pudica leaves close up" (NonNerd, 4320×3240). Trang gốc: CC0 (Category:CC-Zero, "Own work"), Category:Mimosa pudica, mô tả "four Mimosa pudica leaves"; không hoa. Cắt 5:2 (`top 0.215`, `height 0.5333`, hết chiều ngang) bỏ vệt hồng ở góc trên trái và gờ trắng phía dưới; ngọn lá kép trên cùng bên trái bị cắt nhẹ. Bài 6 ảnh mới: 4.
- Đối chiếu key: 7 bài, key trong `.md` (theo `images search --cache-only`) và key trong file chọn ảnh khớp đủ, 0 thiếu, 0 thừa.
- **Kết quả lệnh:** `node tools/content-cli/src/cli.ts images fetch content/images/explorer/cay-quanh-em`: 7 file chọn ảnh · 136 ảnh khác nhau · 1 tải mới (trinh nữ) · 0 lỗi; hình tự vẽ 12 (2 mới); không có cảnh báo lệch khung. Không gặp 429.
- Chưa chắc: `tray_dry_grass` là cỏ xavan châu Phi (bé đã gặp ở chủ đề #4), không phải cỏ VN; `explore_dry` bản gốc 612 px (nhỏ nhưng đủ cho ô kệ 1:1).

**Lượt 3 (18/11, sau rà ảnh lượt 2):**
- **B3 (bài 2 `tray.tray_dry_grass`):** không cắt lại được ảnh xavan: bản Commons chỉ 1280×720, dải cỏ dưới cây cao ~220 px, khung vuông chỉ cỏ quá nhỏ. Thử ảnh cỏ vàng Maui (CC0) nhưng khung vuông chỉ có cỏ ra 324 px, bỏ. Chọn ảnh riêng **"Last year's tufts of grass - overcast day"** (W.carter, CC0, 4963×2792, trang gốc kiểm 18/11: Own work, Category:Dry grass in Sweden). Mục gốc riêng, cắt vuông giữa → 720×720: kín khung là bụi cỏ khô vàng nâu rạp xuống, vài chỗ còn chút xanh; không cây, không trời, không người, không chữ. Bài 2 ảnh mới: 4 (`_topic.md` "Ảnh mới" thành 36, content-editor thêm dòng). Chưa chắc: cỏ khô sau mùa đông ở Thuỵ Điển, màu xám vàng hơn cỏ cháy nắng; bé vẫn đọc ra "cỏ khô".
- **B2 (bài 6 `tray.tray_mimosa`):** bản cắt khung `tray_item` 1:1 của `q5.q5_mimosa` (cùng ảnh NonNerd, CC0), chép mục đầy đủ như các bản cắt khung khác (`same_as` không mang `crop` riêng); 773×773, bỏ vệt hồng góc trái trên và gờ trắng dưới; ngọn lá kép phải và trái bị cắt nhẹ. Đặt sau `tray.tray_flame`. Key này chưa có trong `.md` lúc tôi sửa (content-editor đang thêm); `fetch` không báo gì.
- **B1 (bài 2 `q2`):** theo brief mới, `q2` là bản cắt khung 4:3 của `learn.explore.explore_needs` (chậu sedum bên cửa sổ, CC0): chép mục kèm `crop` (`top 0.13`, `height 0.75`), vì `same_as` không mang được `crop` riêng; giữ cả chậu và cây. Giá đỗ không còn ở q2. Đã sửa `note` của `explore_dark` (đĩa giá đỗ, nồi inox, nĩa ở mép; q5 dùng bản cắt 5:2), `explore_wilt` (đất vẫn sẫm, dấu hiệu là lá rũ), `q4_dry` (đất nâu nhạt, vành chậu nứt, lá rơi trước tủ) cho khớp brief mới.
- **Kết quả lệnh (sau mọi sửa):** `node tools/content-cli/src/cli.ts images fetch content/images/explorer/cay-quanh-em`: 7 file chọn ảnh · 138 ảnh khác nhau · 0 lỗi; hình tự vẽ 12; 0 dòng "Ảnh lệch khung", 0 dòng "Chưa kiểm tỉ lệ". Đối chiếu key `.md` (qua `checkMarkdown` + `imageRefs` của content-cli) với file chọn ảnh: 33 · 36 · 33 · 38 · 39 · 32 · 36 = 247 chỗ, 0 thiếu, 0 thừa. Ảnh Maui thử còn một file mồ côi trong cache `content/.images/3c14bdfe….jpg` (ngoài git, vô hại).

## Rà ảnh (tester 18/11, lượt 2)

Phạm vi: phần **ảnh** của bảy bài và `_topic.md`, bảy file chọn ảnh `content/images/explorer/cay-quanh-em/*.json`, mười hai file `content/images/own/cay-quanh-em/`, và các sửa đổi theo quyết định 11–16. Không rà lại chữ (đã làm ở mục trên). Không sửa file nội dung, không chạy lại `build`, `tts`.

**Tổng kết: chặn 0 · nên sửa 4 · nhỏ 4.**

Lệnh và script đã chạy (chỉ đọc):
- `node tools/content-cli/src/cli.ts images fetch content/images/explorer/cay-quanh-em`: **7 file chọn ảnh · 136 ảnh khác nhau · 0 tải mới · 136 đã có · 0 lỗi · hình tự vẽ 12 · 0 dòng "Ảnh lệch khung" · 0 dòng "Chưa kiểm tỉ lệ"** (tester chạy lại, trùng kết quả designer).
- Script tester (không phải test sản phẩm, ở scratchpad phiên, chạy bằng `node`/`python3 -I`): `keys.ts`, `keysall.ts` (gọi thẳng `checkMarkdown` + `imageRefs` của content-cli để lấy key và brief thật của 86 bài trong `content/`), `cmp.py` (key `.md` ↔ key file chọn ảnh), `chain.py` (chuỗi "Dùng lại hình"), `sameas.py` (chuỗi `same_as` trong JSON), `kind.py` + nhóm theo câu/kệ (ảnh chụp ↔ hình vẽ), `reusecmp.py` (ảnh thật có đúng ảnh brief trỏ tới không), `alt.py` (`alt` khác gốc), `lic.py` (giấy phép, ghi công), `reveal.py` (ảnh lần đầu bé nhìn thấy trong một câu).

### A. Đạt (kiểm bằng máy + xem tận mắt)

- **A1 · Key ảnh khớp đủ:** `.md` 246 chỗ có hình (33 · 36 · 33 · 38 · 39 · 31 · 36) ↔ file chọn ảnh 246 mục, **0 thiếu, 0 thừa, 0 key trùng** trên cả bảy bài. Mọi mục `own` trỏ tới file có thật; 12/12 file trong `content/images/own/cay-quanh-em/` đều được dùng, 0 file thừa.
- **A2 · Không còn chuỗi hỏng:** trong bảy file chọn ảnh có 116 mục `same_as`, **0 mục trỏ vào một mục cũng là `same_as`** (trong bài, sang bài khác, sang chủ đề khác) → đúng luật `selection.ts:88`, `:225`; `images fetch` không báo lỗi. Năm chỗ brief trỏ sang một mục mà **brief** của mục đó cũng là "Dùng lại hình" (bài 3 `tray_sparrow`, bài 5 `w2`, bài 7 `tray_fern`, từ `fern`, thẻ `fern_card`) **không phải lỗi**: cả ba mục đích đến (`goi-ten-va-nhom-dong-vat/chim-va-bo-sat` `tray_sparrow`, `co-the-cua-em/nam-giac-quan-cua-em` `tray_lime`, `cay-quanh-em/hoa-nhieu-mau-nhieu-hinh` `explore_no_flowers`) là **mục chép đầy đủ** (có `source`, `file_url`, ghi công), đúng như `_topic.md` đã dặn.
- **A3 · Ảnh thật đúng ảnh brief trỏ tới:** 207 chỗ "Dùng lại hình" đều giải ra đúng ảnh gốc; 6 chỗ lệch là bản cắt khung riêng của **cùng** hình vẽ (`bean-sprout.2x1`, `pot-fresh.17x10`, `pot-drooping.17x10`, `pot-drooping.2x1`, `flowering-plant-roots.2x1`) — đúng nếp "bản cắt khung riêng".
- **A4 · `alt`:** 246/246 chỗ có `alt.en` và `alt.vi`, 0 chỗ trống, 0 `alt.en` quá tám từ. Đúng **7** chỗ `alt` khác gốc, cả 7 nằm trong danh sách "`alt` riêng" `_topic.md` (gồm quyết định 15 `Bright pink petals`).
- **A5 · Luật cùng kiểu hình (TEMPLATE mục Hình, `_topic.md` Quy ước 2):** quét **mọi** câu có lựa chọn và **cả bảy kệ Chơi**: **0 chỗ trộn ảnh chụp với hình vẽ**. Ba chỗ trộn duy nhất là ô Học bài 1, 2, 4 — đúng chỗ quyết định 11 cho phép. Cụ thể các chỗ ticket hỏi:
  - bài 1 q4: `q4_seed`, `q4_sprout`, `q4_seedling` **ba thẻ đều là hình vẽ** (quyết định 13 xong);
  - bài 1 kệ Chơi: 7 món **toàn ảnh chụp** (`tray_sprout` nay là ảnh giá đỗ `explore_dark`, `tray_seedling` là ảnh chụp gốc);
  - bài 2 q3: hai lựa chọn đều là hình vẽ (`pot-fresh.17x10`, `pot-drooping.17x10`); q4: ba thẻ đều là hình vẽ; q5: ba lựa chọn đều là ảnh chụp;
  - bài 2 kệ Chơi: 6 món **toàn ảnh chụp** (bỏ `tray_wilted`, thêm `tray_dry_grass`).
  - Không còn chỗ nào mà **lựa chọn đúng** hay **món đúng** là hình vẽ duy nhất giữa ảnh chụp.
- **A6 · Giấy phép và ghi công:** 76 ảnh gốc khác nhau được dùng (kể cả ảnh mượn của chủ đề khác): CC0 21 · CC BY 2.0 16 · CC BY 4.0 12 · CC BY 3.0 10 · Public domain 4 · CC BY 3.0 us 1 · hình tự vẽ 12. **0 BY-SA, 0 NC, 0 ND, 0 mục không rõ giấy phép, 0 mục CC BY thiếu `author`.** Trong gói đã build (`content/.build/pack/catalog/v1/manifest.json`, build 16:43, sau lần sửa cuối 15:40) cũng vậy: 18 624 asset, 0 giấy phép cấm; hình tự vẽ ghi công "Science Kids", `changes: ["drawn"]`.
- **A7 · Xem tận mắt 11 hình** (5 hình vẽ + 6 ảnh): `bean-seeds.jpg`, `bean-seedling.jpg`, `bean-sprout.jpg` (cùng nét, cùng nền kem, cùng đất nâu; rễ xuống, mầm lên; ba chặng đọc rõ, không chữ, không người); `pot-fresh.jpg`, `pot-drooping.jpg`, `pot-dry.jpg` (cùng chậu, cùng cửa sổ; tươi → rũ còn xanh → khô nâu, rõ thứ tự); giá đỗ `explore_dark` (đĩa giá đỗ sống trên bàn quán, không chữ, không mặt người, không logo); `q5_mimosa` mới (lá kép trinh nữ chụp gần, **không hoa, không chữ ký**, nét, đúng `alt` "Tiny leaves on a branch"); `tray_dry_grass` (xavan mùa khô); súp lơ (không biển giá), củ cải trắng, rau muống, rổ cà rốt, nhà kính mái nilon: **0 chữ, 0 logo, 0 tem giá, 0 mặt người**.
- **A8 · Bookkeeping theo quyết định 11–16 khớp bài:** không còn `tray_wilted`, `q5_grass` (chỉ còn trong ghi chú lịch sử); brief `explore_wilt`, `q4_fresh`, `q4_dry` đã là `[hình vẽ]` và các chỗ dùng lại hai hình vẽ đó đã bỏ dòng từ khoá; `explore_warm`, `explore_look` q1 đúng `alt` mới; `q5_mimosa` có brief, ảnh, nhãn mới; bảng `_topic.md` (Quy ước hình 1, Hình gốc mới, Hình của chủ đề khác, `alt` riêng, Ảnh mới, Phần Chơi, `order_sequence`) khớp bài. Đếm máy: **35 ảnh mới + 7 hình vẽ = 42**, đúng con số `_topic.md`; danh sách "Ảnh mới" phủ hết 35 ảnh mới (0 ảnh mới nào thiếu trong danh sách). Icon: `design/icons/topics/` còn 44 file, `growing-plants.svg` ở `_retired/`, canvas `Topic-Icons` 0 dòng `growing-plants`, `Assets.xcassets` 44 imageset `Topic-*`.

### B. Nên sửa (4)

**B1. Bài 2 q5 nay là câu nhớ lại, không còn DOK 2 (trả lời câu hỏi còn mở số 6).**
- Cùng một ảnh giá đỗ xuất hiện bốn lần trước đó trong bài: ô Học nhóm **"No light · Thiếu ánh sáng"** (`02:148-162`), hình câu q2 (`02:354`), món kệ Chơi `tray_sprouts` thuộc nhóm **`tray_no_light`** (`02:270-278`), rồi mới tới q5 "Which plant had no light for days?" (`02:466`).
- Bé chỉ cần nhớ "ảnh này nằm ở nhóm Thiếu ánh sáng" là chọn đúng; không phải suy từ dấu hiệu (thân trắng nhợt) ra nguyên nhân như dòng `>` ghi. Vị trí q5 bắt buộc DOK 2 (`rules.json` `explorer.authoring` 1·1·1·2·2·2), nên không hạ DOK được.
- **Đề xuất (content-editor, PM chọn):** (a) đổi hình câu q2 sang vật khác (q2 là `true_false` "Plants grow best in the dark", hình có thể là chậu cây bên cửa sổ `explore_needs`) để giá đỗ chỉ xuất hiện ở ô Học và kệ Chơi; hoặc (b) giữ giá đỗ ở q2 và đổi đáp án q5 sang một cây nhợt khác chưa gắn nhãn "No light"; hoặc (c) PM chấp nhận q5 ở mức nhớ lại và ghi quyết định.

**B2. Bài 6 q5: đáp án là ảnh duy nhất bé chưa từng thấy (trả lời câu hỏi còn mở số 7).**
- Quét cả chủ đề theo "lần đầu bé nhìn thấy ảnh": **chỉ một câu** có đúng một ảnh lần đầu và ảnh đó là **đáp án đúng** — bài 6 q5 `q5_mimosa` (hai lựa chọn kia là `explore_banana_leaf` và `explore_alive` bé đã gặp nhiều lần). Trái chính Quy ước hình số 6 của `_topic.md` ("đáp án đúng không là ảnh mới duy nhất giữa các ảnh quen"). Bài 2 q5 nay đã hết lỗi này (quyết định 11 có tác dụng).
- Ảnh mới thì đẹp và đúng (A7), vấn đề chỉ ở **chỗ xuất hiện lần đầu**.
- **Đề xuất rẻ nhất:** cho bé gặp ảnh này trước quiz trong chính bài 6 — kệ Chơi bài 6 có nhóm `tray_tiny` "Tiny leaves" hiện chỉ một món (`tray_flame`); thêm một món `tray_mimosa` dùng lại `q5_mimosa` (kệ 6 → 7 món, vẫn toàn ảnh chụp). Phương án khác: đổi một lựa chọn sai sang ảnh lá khác cũng chưa gặp.

**B3. Bài 2, món "No water" trên kệ Chơi: ảnh cỏ xavan đọc ra "cây to giữa đồng", không ra "cỏ khô" (trả lời câu hỏi còn mở về cỏ xavan).**
- `tray_dry_grass` (`02:249-254`) dùng lại `explore_dry` của `noi-song-tren-trai-dat/dong-co-xavan`. Xem ảnh ô kệ 1:1 (612×612): **một cây to chiếm giữa khung**, trời hoàng hôn, cỏ vàng chỉ ở nửa dưới. Nhãn món là "Dry grass · Cỏ khô", lệnh kệ là "Tìm một cây khoẻ, một cây **khô héo**, một cây vàng nhợt".
- Ba rủi ro với trẻ 5–7: (i) bé thấy "cái cây" trước, dễ bỏ vào nhóm **Healthy**; (ii) cỏ vàng cũng dễ bị hiểu là đã chết → rơi sang nhóm bẫy **Not alive** (`has_limited` nói "That one is not alive."), mà "cỏ vẫn sống, mưa lại xanh" thì bài không dạy; (iii) đây là món **duy nhất** của nhóm `tray_no_water`, sai một món là không cân được kệ.
- Về mặt khoa học thì xếp "thiếu nước" **ổn** (mùa khô ít mưa), nên không phải lỗi nội dung; vấn đề là hình.
- **Đề xuất (designer, không cần đổi chữ):** cắt riêng một khung chỉ lấy dải cỏ khô (bỏ cây) từ cùng ảnh gốc, thành mục riêng của bài 2 với `crop` mới; hoặc tìm ảnh cỏ vàng cháy nắng không có cây. Nếu giữ nguyên, content-editor nên thêm một ví dụ ở ô "No water" nói "cỏ vàng vì lâu không mưa" để nối ảnh với nhóm.

**B4. Brief `explore_parts` bài 4 vẫn là `[ảnh]` trong khi hình đã chọn là hình vẽ (trả lời câu hỏi còn mở số 4).**
- `04-cay-co-hoa-re-than-la-hoa.md:118` mở đầu `[ảnh] Một cây hoa nhỏ … Nếu không có ảnh hợp lệ … thì là ứng viên hình tự vẽ (cần PM đồng ý trước)`, nhưng mục đã chọn là `content/images/own/cay-quanh-em/flowering-plant-roots.jpg` (`method: drawn`) — và `_topic.md:203`, `:300` đã ghi đúng rằng bài 4 `explore_parts` là hình vẽ.
- Đây là chỗ **duy nhất** trong chủ đề còn lệch kiểu brief ↔ hình đã chọn (quét cả 246 chỗ). Hệ quả: chạy lại `images search` sẽ đi tìm ảnh chụp và gợi ý thay hình vẽ.
- **Đề xuất:** làm như quyết định 12 đã làm cho `explore_wilt`: đổi brief thành `[hình vẽ]` tả đúng hình đã vẽ (cây hoa hồng cánh sen nhổ lên, thấy rễ, thân, lá, hoa, nền kem, không chữ), bỏ dòng từ khoá; thêm chữ "**hình vẽ:**" vào dòng `explore_parts` của bảng "Hình gốc mới" `_topic.md:243` cho giống ba dòng hình vẽ kia.

### C. Nhỏ (4)

- **c1.** `pot-dry.jpg`: vết "đất nứt" lại nằm trên **thành chậu**, nhìn ra chậu bị nứt; hai lá khô rơi thì dính trên **mặt đứng** của tủ. Brief (`02:435`) nói "mặt đất trong chậu khô nứt". Chỉ nêu, không chặn.
- **c2.** `pot-drooping.jpg` (`explore_wilt`): brief (`02:136`) nói "đất trong chậu khô" nhưng đất vẽ vẫn sẫm như chậu tươi; dấu hiệu duy nhất là lá rũ (đủ cho câu hỏi). Sửa brief hoặc sửa hình đều được.
- **c3.** Brief `explore_dark` (`02:154`) tả "giá đỗ trong rổ tre … còn vỏ hạt xanh ở vài cây"; ảnh thật là **đĩa giá đỗ ở quán ăn**, khung vuông còn thấy nồi inox và một cái nĩa ở mép. Không sai luật (không chữ, không mặt người), nhưng brief nên tả đúng ảnh đang dùng để lần sau không bị tìm lại.
- **c4.** `q4_seed` (hình vẽ, `alt` "Small green beans") dùng y hệt `alt` của ảnh chụp `explore_seeds` trong cùng bài; VoiceOver đọc hai hình khác nhau thành một câu. Chấp nhận được (cùng vật), chỉ nêu.

### D. Chưa kiểm

- Không mở trang gốc trên Commons/Openverse (không gọi mạng ra ngoài trong lượt này): giấy phép, tên tác giả, loài **đọc từ file chọn ảnh và manifest gói**, tin theo lượt kiểm của designer.
- Mới xem tận mắt 11/136 hình; chưa xem hết để bắt chữ, logo, mặt người ở các hình còn lại.
- Không chạy `build`, `tts`, không chạy simulator ở lượt này (phiên chính đã chạy; gói `content/.build/pack` build 16:43 **sau** lần sửa nội dung cuối 15:40, có đủ 7 bài của chủ đề).
