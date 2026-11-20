---
id: f8f76027-2ea8-4edc-bb59-8f523e4c91a2
slug: nui-song-va-bien
age_group: explorer
order: 9
strand: earth_sky
level: 1
difficulty:
  abstraction: 1
  prior_knowledge: 1
  misconception: 1
  vocabulary: 2
  science_skill: 1
prerequisites: [noi-song-tren-trai-dat, thoi-tiet-va-cac-mua]
is_free: false
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Mountains, rivers and seas
vi: Núi, sông và biển
> Giữ đúng tên ở `content/syllabus.json` (key `new-mountains-rivers-and-seas`, Explorer số chín). `id` ở frontmatter là `topic_id` đã gắn trong danh mục (phiên chính, 19/11); sáu bài dùng đúng sáu `lesson_id` của danh mục.

## Câu hỏi lớn
en: What does the land around us look like?
vi: Mặt đất quanh em trông thế nào?
> Tám từ EN, đúng câu gợi ý của SK-058. Bài 1 nhìn toàn cảnh từ trên cao (đất cao, đất bằng, nước); bài 2 tới 5 đi từng nơi (núi và đồi, đồng bằng, sông và hồ, bờ biển); bài 6 vào trong núi đá (hang) và ôn cả chủ đề.

## Misconceptions

### land_all_flat
id: 89f564ce-3631-4beb-b5a8-cd31cca1f039
statement.en: The land is flat everywhere.
statement.vi: Ở đâu đất cũng bằng phẳng.
correction.en: Some land is high, some is flat.
correction.vi: Có chỗ đất cao, có chỗ đất bằng.
note: Dạy ở bài 1: ý chính hai, ô Học High land và Flat land, kệ Chơi (nhóm Đất cao, Đất bằng), câu q6 gắn key ("The land is flat everywhere.", Sai, hình vẽ toàn cảnh `explore_above` có cả núi và đồng bằng). Không dùng phương án earth_mostly_land (key của Discoverer *Bề mặt Trái Đất* bài 1, và chạm ranh giới "Trái Đất" của Discoverer #7 *Hệ Mặt Trời*). Nháp AI 19/11/2026.
> [CẦN KIỂM] Nguồn quan niệm: kinh nghiệm phổ thông, trẻ sống ở đồng bằng, thành phố (Hà Nội, Thành phố Hồ Chí Minh) ít thấy núi; tranh vẽ của trẻ hay vẽ mặt đất là một đường thẳng. Người chuyên môn xác nhận đây là quan niệm có ở trẻ năm tới bảy tuổi, hoặc đề xuất key khác.

### mountain_top_warmer
id: e6eba0eb-4e91-45ec-ba80-99c96ecd9ba0
statement.en: Mountain tops are hotter, closer to the Sun.
statement.vi: Đỉnh núi nóng hơn vì gần Mặt Trời hơn.
correction.en: High on a mountain, the air is cooler.
correction.vi: Lên cao trên núi, không khí mát hơn.
note: Dạy ở bài 2: ý chính ba, ô Học Cool up high, câu q5 (mùa hè ở đâu vẫn mát), câu q6 gắn key ("It is hotter on top of a mountain.", Sai, hình đỉnh núi dốc `tray_mountain`). Bài 6 w2 ôn lại ("Mountain tops feel hotter than the plains.", Sai). Không dạy vì sao càng lên cao càng lạnh (Discoverer, Scientist). Không dùng phương án hills_same_as_mountains (đã là ý chính hai và câu q2, không phải quan niệm sai có nghiên cứu). Nháp AI 19/11/2026.
> [CẦN KIỂM] Nguồn quan niệm: lý do "gần Mặt Trời hơn" hay gặp ở trẻ tiểu học trong các danh sách quan niệm sai về thời tiết, khí hậu. Sự thật: nhiệt độ không khí thường giảm khi lên cao (khoảng sáu độ mỗi nghìn mét); Sa Pa, đỉnh Phan Xi Păng mát hơn đồng bằng. Chữ bé nghe không nêu số độ.

### plain_is_one_field
id: 0bfd55d8-b055-499d-a495-0cf4b11dde27
statement.en: A plain is just one big field.
statement.vi: Đồng bằng chỉ là một cánh đồng to.
correction.en: A plain has fields, villages and towns.
correction.vi: Đồng bằng có ruộng đồng, có làng, có phố.
note: Dạy ở bài 3: ý chính ba, ô Học Rice fields và Villages and towns, kệ Chơi (ruộng lúa, làng, sông), câu q6 gắn key ("A plain is just one big field.", Sai, hình đồng bằng nhìn từ trên cao `explore_plain`, thấy nhiều thửa ruộng và cụm làng). Không dùng phương án flat_land_is_desert (nối với *Sa mạc* của #4 nhưng không có nguồn quan niệm). Nháp AI 19/11/2026.
> [CẦN KIỂM] Nguồn quan niệm: hai từ "đồng bằng" và "cánh đồng" cùng chữ "đồng", trẻ dễ hiểu đồng bằng là một cánh đồng. Đây là suy luận của biên tập, chưa có nghiên cứu; người chuyên môn xác nhận hoặc đề xuất key khác.

### river_water_still
id: d8ee76d3-401d-4f70-acdc-b93468d6e470
statement.en: River water just stays in one place.
statement.vi: Nước sông chỉ nằm yên một chỗ.
correction.en: River water keeps flowing along.
correction.vi: Nước sông luôn chảy đi.
note: Dạy ở bài 4: ý chính một, ô Học River (ví dụ "leaves float down the river"), câu q6 gắn key ("River water just stays in one place.", Sai, hình sông có gợn sóng `explore_river`). Bài 5 w1 ôn lại ("Which one has flowing water?"). Chỉ dạy "nước sông chảy, nước hồ đứng yên" ở mức thấy; nước chảy từ đâu tới đâu để Discoverer #9 *Sông, hồ và vòng tuần hoàn nước* (SK-058 khuyến nghị 2; SK-061 bỏ *Nước quanh em* khỏi Explorer). Nháp AI 19/11/2026.
> [CẦN KIỂM] Nguồn quan niệm: trẻ nhìn mặt sông rộng, nước chảy chậm, dễ nghĩ sông là "cái hồ dài". Sự thật cần người chuyên môn xem: nước sông chảy về phía hạ lưu; vùng có thuỷ triều (sông Hồng gần biển, sông Mê Kông ở đồng bằng) nước có lúc chảy chậm hay chảy ngược theo con nước; mùa khô có suối cạn. Câu "keeps flowing along" đúng ở mức trẻ năm tới bảy tuổi?

### islands_float
id: 426a4d4d-54f1-40b2-802a-ec82326f2149
statement.en: An island floats on the sea.
statement.vi: Hòn đảo trôi nổi trên mặt biển.
correction.en: An island stands on the sea floor.
correction.vi: Hòn đảo đứng vững trên đáy biển.
note: Dạy ở bài 5: ý chính hai, ô Học Island (ví dụ "islands stay in one place"), câu q6 gắn key ("An island floats on the sea.", Sai, hình hòn đảo `explore_island`). Chữ VI dùng "trôi nổi" cho rõ nghĩa trôi, vì "đảo nổi lên giữa biển" là cách nói thường ngày đúng nghĩa (nhô lên). Không dùng phương án sea_has_no_bottom. Nháp AI 19/11/2026.
> [CẦN KIỂM] Nguồn quan niệm: "đảo nổi trên mặt nước như cái bè" có trong các danh sách quan niệm sai địa lý của trẻ tiểu học (nguồn cụ thể chưa tra). Sự thật: đảo là phần đất nhô lên, chân đảo liền với đáy biển. Đảo nổi thật (đảo cỏ, bè thực vật) có nhưng hiếm, bài không nói.

### caves_are_small
id: 650dd4a4-39da-4ca5-b93f-e23aa8b89eeb
statement.en: Every cave is small, like a hole.
statement.vi: Hang nào cũng nhỏ, như một cái lỗ.
correction.en: Some caves are huge, bigger than houses.
correction.vi: Có hang rất rộng, to hơn cả ngôi nhà.
note: Dạy ở bài 6: ý chính ba, ô Học Huge caves (ví dụ "boats can go into some caves"), câu q6 gắn key ("Every cave is small, like a hole.", Sai, hình cửa hang `explore_cave`). Không dùng phương án caves_are_dug_by_people (dạy được bằng câu q5 đường hầm, nhưng chạm "hang hình thành thế nào", ngoài phạm vi). Nháp AI 19/11/2026.
> [CẦN KIỂM] Nguồn quan niệm: tranh, phim hoạt hình vẽ hang là lỗ nhỏ trong vách đá, hang thú. Sự thật: Việt Nam có nhiều hang rất rộng (Phong Nha có sông ngầm, thuyền chở khách vào được; Sơn Đoòng có lòng hang rộng hàng trăm mét).

## Ghi chú

> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 19/11/2026. Ticket SK-058. Lượt này viết `_topic.md` và sáu bài; thêm một dòng ranh giới ở `content/explorer/noi-song-tren-trai-dat/_topic.md`.
> `id` của chủ đề và sáu bài đã có sẵn (danh mục `content/syllabus.json`). Mọi dòng `id:` khác để trống. Thứ tự chạy `ids`: file này trước, rồi bài 1 tới bài 6 đúng thứ tự. Khởi động bài sau trỏ bài trước của chủ đề này (đã có id từ frontmatter); các câu ôn chủ đề khác trỏ sang *Những nơi sống trên Trái Đất*, *Thời tiết và các mùa*, *Lớn lên*, đều đã có id.
> Trong mục Ghi chú, số bài viết bằng chữ số cho dễ tra (máy không đọc mục này). Mọi chữ trẻ đọc hay nghe vẫn viết số bằng chữ.

### Nguồn

- **Chủ đề mới, không bám Oak** (`source.kind: new`, mỗi bài `oak_lessons: []`, `statutory: false`, không dòng `oak_unit_ref`). Danh mục từ SK-057 (Duy 19/11, cách a); phạm vi, sáu bài và tám khuyến nghị ở SK-058.
- **Duy chốt 19/11** (SK-058 mục "Duy chốt"):
  - khuyến nghị 1 sửa theo Duy: bài 1 được dùng thêm **hình vẽ minh hoạ giấy cắt** (style E) ngoài ảnh chụp từ máy bay, flycam, đỉnh đồi; vẫn không ảnh hay hình Trái Đất từ vũ trụ, không quả cầu, không bản đồ, không hình bờ biển Việt Nam;
  - khuyến nghị 2 tới 8 và danh sách sáu bài chốt theo đề xuất PM ("tiếp tục làm").
- Mức Explorer là **thấy** (bản rà `docs/syllabus-review-2026-11-18.md` mục 2): gọi tên, nhận ra, kể một nơi ở Việt Nam. Không câu "vì sao".
- Luật Explorer: `content/rules.json` (`explorer.authoring`), `content/TEMPLATE.md` (bảy luật Explorer, mục SK-044, mục SK-047). Khuôn: `content/explorer/lon-len/` (SK-053), `content/explorer/thoi-tiet-va-cac-mua/` (SK-050, chủ đề mới cùng kiểu). Ghép ý chính với ô Học theo `KeyPointPictures.match` (`apps/ios/Packages/SKKit/Sources/LessonPlayer/LessonRecap.swift`), mục "Ghép ý chính" dưới đây.

### Frontmatter

- **`order: 9`, `strand: earth_sky`, `level: 1`** theo danh mục. `is_free: false`, `sensitive: false` (không nội dung dậy thì; không thiên tai, xem An toàn).
- **`prerequisites: [noi-song-tren-trai-dat, thoi-tiet-va-cac-mua]`** theo gợi ý SK-058.
- **`difficulty` 1-1-1-2-1 = sáu điểm (Mức 1)**, khớp `level: 1`:
  - A = 1: núi, đồi, sông, hồ, bãi biển, hang là cảnh bé thấy bằng mắt (tận nơi hoặc qua ảnh). Nhìn từ trên cao ở bài 1 là một bước khó hơn nhưng vẫn bằng ảnh, nên không lên 2.
  - B = 1: chỉ cần trải nghiệm đời sống (đi chơi biển, qua sông, thấy ruộng). *Những nơi sống trên Trái Đất*, *Thời tiết và các mùa* có ích nhưng bài không dựa vào.
  - C = 1: sáu quan niệm sai đều sửa được bằng ảnh, không có quan niệm "cứng đầu" theo rubric.
  - D = 2: mỗi bài hai, ba từ mới dễ đọc (mountain, hill, plain, river, lake, beach, island, bay, cave); "steep", "peak", "torch" là từ `extra`.
  - E = 1: quan sát, gọi tên, phân loại đơn giản; có ba câu xếp thứ tự (cao tới thấp, nhỏ tới lớn, núi xuống biển) nhưng không đo, không thí nghiệm. Nếu chấm E = 2 thì bảy điểm, vẫn Mức 1.

### Tổng quan sáu bài

| Bài · file | `stage` | Ý chính (EN · VI) | Key q6 · format · đáp án | Từ `core` · `extra` | Thẻ thưởng |
| --- | --- | --- | --- | --- | --- |
| 1 · `01-dat-lien-va-bien.md` | `opener` | From up high, we see land and sea. · Nhìn từ trên cao, mình thấy đất liền và biển. / Some land is high. Some land is flat. · Có chỗ đất cao, có chỗ đất bằng phẳng. / Rivers and lakes are water on land. · Sông và hồ là nước nằm trên đất liền. | `land_all_flat` · TF · Sai | land, sea · flat, high | `cape_card` Mũi đất |
| 2 · `02-nui-va-doi.md` | `core` | Mountains are very high and steep. · Núi rất cao và dốc. / Hills are lower and rounder than mountains. · Đồi thấp hơn và tròn hơn núi. / High on a mountain, the air is cool. · Lên cao trên núi, không khí mát. | `mountain_top_warmer` · TF · Sai | mountain, hill · steep, peak | `fansipan_card` Núi Phan Xi Păng |
| 3 · `03-dong-bang-va-ruong-lua.md` | `core` | A plain is wide, flat land. · Đồng bằng là vùng đất rộng và bằng phẳng. / Plains are often near big rivers. · Đồng bằng thường ở gần những con sông lớn. / Rice fields, villages and towns are on plains. · Trên đồng bằng có ruộng lúa, làng xóm và phố xá. | `plain_is_one_field` · TF · Sai | plain, rice_field · village, wide | `mekong_delta_card` Đồng bằng sông Cửu Long |
| 4 · `04-song-va-ho.md` | `core` | A river is long. Its water flows. · Sông dài. Nước sông chảy đi. / A lake has land all around. Its water is still. · Hồ có đất bao quanh. Nước hồ đứng yên. / People live, travel and fish by rivers. · Người ta sống, đi lại và đánh cá bên sông. | `river_water_still` · TF · Sai | river, lake · flow, boat | `ba_be_card` Hồ Ba Bể |
| 5 · `05-bai-bien-dao-va-vinh.md` | `core` | Beaches can be sandy or rocky. · Bãi biển có bãi cát, có bãi đá. / An island has water all around it. · Đảo có nước bao quanh. / A bay is sea curving into the land. · Vịnh là chỗ biển lượn vào đất liền. | `islands_float` · TF · Sai | beach, island, bay · sand, wave | `ha_long_bay_card` Vịnh Hạ Long (rare) |
| 6 · `06-hang-dong.md` | `review` | A cave is a big space inside rock. · Hang là khoảng trống lớn trong núi đá. / Caves are dark and cool inside. · Trong hang tối và mát. / Some caves are huge, like a big hall. · Có hang rất rộng, như một căn phòng lớn. | `caves_are_small` · TF · Sai | cave, rock · dark, stalactite, torch | `son_doong_card` Hang Sơn Đoòng (rare) |

- Tên bài EN · VI khớp `content/syllabus.json` từng chữ: Land and sea · Đất liền và biển (`dat-lien-va-bien`); Mountains and hills · Núi và đồi (`nui-va-doi`); Plains and rice fields · Đồng bằng và ruộng lúa (`dong-bang-va-ruong-lua`); Rivers and lakes · Sông và hồ (`song-va-ho`); Beaches, islands and bays · Bãi biển, đảo và vịnh (`bai-bien-dao-va-vinh`); Caves · Hang động (`hang-dong`). Slug bài do content-editor đặt.
- Mục tiêu "I can…" tối đa tám từ: bài 1 "I can spot land and water from above."; bài 2 "I can tell mountains and hills apart."; bài 3 "I can tell what a plain looks like."; bài 4 "I can tell rivers and lakes apart."; bài 5 "I can name beaches, islands and bays."; bài 6 "I can say what a cave is like."
- Sáu câu q6 là `true_false` đáp án Sai, câu khẳng định, để bước Tổng kết (SK-047) có thẻ "Ý sai → Ý đúng". `explanation_correct` của sáu câu này đúng câu `correction` ở mục Misconceptions, đứng một mình.
- Không có câu lời Na (Explorer). `est_minutes: 6` cả sáu bài.

### Ghép ý chính với ô Học (`KeyPointPictures.match`)

Đã tính tay theo bốn bước của `LessonRecap.swift` (chữ thường, bỏ từ hai chữ cái trở xuống và từ dừng, cắt đuôi `ies`/`es`/`s`/`ed`/`ing`, cắt `e` cuối). Người sửa câu ý chính hay câu chính ô Học tính lại bảng này.

| Bài | Ý 1 → ô (điểm) | Ý 2 → ô (điểm) | Ý 3 → ô (điểm) | Ô không ghép |
| --- | --- | --- | --- | --- |
| 1 | From up high (high, see, land, sea = 4) | High land (land, high = 2, ô cùng thứ tự) | Water on land (river, lak, water, land = 4) | Flat land |
| 2 | Mountain (mountain, high, steep = 3) | Hill (hill, lower, rounder, mountain = 4) | Cool up high (high, mountain, air, cool = 4) | Fansipan |
| 3 | Plain (plain, wide, flat, land = 4) | Near rivers (plain, often, near, big, river = 5) | Villages and towns (villag, town, plain = 3; hoà ô Rice fields, thắng vì cùng thứ tự) | Rice fields |
| 4 | River (river, long, water, flow = 4) | Lake (lak, land, around = 3) | By the river (river, peopl, liv, travel, fish = 5) | The Mekong |
| 5 | Sandy beach (beach, sandy = 2, ô cùng thứ tự) | Island (island, water, around = 3) | Bay (bay, sea, curv, land = 4) | Rocky beach |
| 6 | Cave (cav, big, spac, insid, rock = 5) | Dark and cool (cav, dark, cool, insid = 4) | Huge caves (cav, hug, big, hall = 4) | Stalactites |

- **Lượt sửa 19/11 (tester):** bài 3 đổi chỗ hai ô cuối (Villages and towns thứ ba, Rice fields thứ tư; n1) và câu ô Rice fields thành "Many rice fields grow on the plains." (C1): ý 3 nay ghép ô Villages and towns, đúng ý sửa `plain_is_one_field`. Bài 6 ô Rock icicles đổi tên thành Stalactites (C3): kết quả ghép không đổi. Các bài khác không đổi.
- Bài 1 ý 2: ô High land và ô Flat land cùng hai điểm; máy chọn ô cùng thứ tự (High land). Bài 5 ý 1 cũng vậy (Sandy beach, không Rocky beach). Nếu designer muốn thẻ ý chính bài 1 có hình đất bằng, thì đổi câu ý chính, không đổi câu ô.
- Câu dự phòng không tên nơi (bài 2 ô Fansipan, bài 4 ô The Mekong) không làm đổi kết quả ghép (đã tính).

### Khuôn chung mỗi bài

- **Frontmatter bài:** `topic: nui-song-va-bien`, `slug`, `order`, `stage` theo bảng Tổng quan, `est_minutes: 6`, `sensitive: false`, `archived: false`, `ai_draft: true`; `id` là `lesson_id` của danh mục.
- **Khởi động:** hai câu (bài 5 ba câu từ 19/11, thêm mốc khoảng một tuần; bài 6 ba câu, ôn trộn bài 2, 3, 5), DOK 1, chỉ `single_choice` hai lựa chọn và `true_false`. Mỗi câu `recall_from.kind: lesson`. Mọi câu có hình ở câu hỏi; mọi lựa chọn có hình.
- **Học:** một `explore_groups` bốn ô (`prompt` "Tap each picture" · "Chạm từng hình", `complete_when: all_seen`), mỗi ô một câu chính và ba ví dụ, mỗi câu EN tối đa tám từ; một `word_list` (`title` "New words" · "Từ mới") gồm đúng các từ `core`. Không `sentence_card`. Câu chính ô Học gọi tên vật, không mở đầu bằng "It".
- **Chơi:** một `build_tray`, `capacity: 3`, `success_when: all_required_and_no_limit`, ba nhóm `required` (màu trong `vang_hoe`, `gi_dong`, `cham`, `nau_dat`), một nhóm `limit` màu `do_son`, kệ sáu tới tám món, mỗi món một ảnh, **cả sáu kệ là ảnh chụp**. `messages.full` chung: "No more room! Tap one to take it off." · "Hết chỗ rồi! Em chạm vào để bỏ ra nhé." Key món khác key nhóm.
- **Quiz:** sáu câu, DOK 1·1·1·2·2·2; câu 6 là câu misconception `true_false` Sai. Bài 1, 3, 5 hai format (`single_choice`, `true_false`); bài 2, 4, 6 ba format (thêm `order_sequence` ở q4).
- **Hình câu `single_choice` và `order_sequence`:** hàng rào tre trung tính `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`, vì app Explorer ẩn hình câu hỏi khi mọi lựa chọn có hình (SK-043). `prompt` phải tự đủ nghĩa khi chỉ nghe.
- **Từ vựng:** bốn hoặc năm từ, hai đến ba `core` (vào `word_list`), còn lại `extra`.
- **Thưởng:** một thẻ mỗi bài, **bộ mới `set: landforms`** "Landform cards" · "Thẻ núi sông" (phiên chính chốt 19/11, quyết định 2), key có đuôi `_card`.

### Tên gọi thống nhất cả chủ đề

Đổi một tên thì đổi đồng bộ cả sáu bài và file này.

| Khái niệm | EN | VI | Ghi chú |
| --- | --- | --- | --- |
| đất liền · biển | land · sea | đất liền (khi đặt cạnh biển); đất · biển | Từ `core` bài 1. Không "Earth", "Trái Đất" trong chữ bé nghe (để Discoverer #7 *Hệ Mặt Trời*). Không "ocean" (đã là từ `core` của #4 bài 5) |
| đất cao · đất bằng | high land · flat land | đất cao · đất bằng; bằng phẳng | Nhãn ô Học bài 1 và nhãn nhóm Chơi bài 1, 6 (nhóm bắt buộc) dùng đúng chữ này. Nhóm bẫy bài 3 gọi "Not on a plain" · "Không ở đồng bằng" (tester n10) |
| núi · đồi | mountain · hill | núi; ngọn núi · đồi; quả đồi | "Núi cao, dốc; đồi thấp, tròn" |
| đỉnh · dốc | peak; top · steep | đỉnh; đỉnh núi · dốc; dốc đứng | "peak", "steep" là từ `extra` bài 2 |
| đồng bằng | plain | đồng bằng | **Không** "cánh đồng" để chỉ đồng bằng; "cánh đồng", "ruộng đồng" là những thửa ruộng trên đồng bằng |
| ruộng lúa · lúa non | rice field · young rice | ruộng lúa · lúa non | Không "ruộng bậc thang" trong chữ bé nghe (SK-058 khuyến nghị 8) |
| làng · phố | village · town | làng; làng xóm · phố; phố xá | Không giả định bé ở quê hay ở phố |
| sông · hồ · ao | river · lake · pond | sông; dòng sông · hồ; cái hồ · ao; cái ao | "pond" đã là từ `core` của #2 bài 4; ở đây chỉ dùng trong câu xếp thứ tự bài 4 và một ví dụ |
| chảy · đứng yên | flow · still; stay still | chảy; chảy đi · đứng yên; phẳng lặng | Không "dòng chảy từ nguồn ra biển" (Discoverer #9 *Sông, hồ và vòng tuần hoàn nước*) |
| thuyền · đò | boat | thuyền; con đò | |
| bãi biển · bãi cát · bãi đá | beach · sandy beach · rocky beach | bãi biển · bãi cát · bãi đá | |
| đảo · đảo đá | island · rocky island | đảo; hòn đảo · đảo đá | Ví dụ đảo ven bờ: Cát Bà, Phú Quốc, Lý Sơn (SK-058 khuyến nghị 5) |
| vịnh | bay | vịnh | "chỗ biển lượn vào đất liền" |
| mũi đất | cape | mũi đất | Chỉ ở thẻ bài 1 |
| hang · cửa hang · trần hang | cave · cave mouth · cave roof | hang; hang động · cửa hang · trần hang | Bài 6 nói "hang", tên bài "Hang động" |
| nhũ đá | stalactite (stalactites) | nhũ đá | Từ thật, `extra` bài 6 (quyết định 4, tester C3; như "chrysalis" ở *Lớn lên*). Lời tả cho trẻ: "like long stone drips from the roof" · "như những giọt đá dài rủ từ trần hang". **Không** "rock icicles", "icicle" (thuật ngữ tự đặt; cột băng lạ với trẻ Việt Nam). Không "thạch nhũ" |
| đường hầm | tunnel | đường hầm | Chỉ là món bẫy bài 6, câu q5 |
| đèn pin | torch | đèn pin | Chính tả Anh ("torch", không "flashlight"), như "autumn" của #5 |
| người lớn | a grown-up | người lớn | Câu an toàn bài 4, 5, 6 |

- **Tên nơi** (chi tiết ở mục Pháp lý và tên nơi): EN không dấu "Fansipan", "Mekong", "Ba Be Lake", "Ha Long Bay", "Phong Nha", "Son Doong", "Cat Ba", "Phu Quoc", "Ly Son", "Hoan Kiem Lake", "Red River", "Hanoi"; VI "Phan Xi Păng", "sông Mê Kông", "hồ Ba Bể", "vịnh Hạ Long", "động Phong Nha", "hang Sơn Đoòng", "Cát Bà", "Phú Quốc", "Lý Sơn", "Hồ Gươm", "sông Hồng", "Hà Nội". "Đồng bằng sông Cửu Long" chỉ ở thẻ bài 3.
- **Đọc bằng máy:** nghe thử EN "Fansipan", "Mekong", "Ba Be", "Ha Long", "Phong Nha", "Son Doong", "Cat Ba, Phu Quoc, Ly Son", "Hoan Kiem", "Mekong Delta", "stalactites", "steep", "torch"; VI "Phan Xi Păng", "Sơn Đoòng", "Lý Sơn", "nhũ đá", "dốc đứng", "thoai thoải".
- **Chuỗi `.en` không có dấu tiếng Việt.** VI không ký hiệu, không chữ số, không viết tắt.

### Quy ước hình cả chủ đề (TEMPLATE mục A "Hình", SK-033, SK-043, SK-058 khuyến nghị 1, 5, 6, 7)

1. **Ảnh chụp thật** cho mọi hình (CC0, PD, PDM, CC BY có ghi công; không BY-SA, NC, ND). Không AI, không Pinterest. Phong cảnh chụp từ mặt đất, từ đỉnh đồi, từ máy bay hay flycam.
2. **Hình vẽ giấy cắt chỉ ở bài 1** (Duy chốt 19/11, khuyến nghị 1 sửa): bốn hình `[hình vẽ]`, style E (giấy cắt, không nét viền, màu từ design tokens), mục `own`, `changes: ["drawn"]`, credit "Science Kids":
   - `explore_above` (ô Học From up high; câu q6; bài 2 w1): toàn cảnh nhìn chếch từ trên cao;
   - `q4_land_sea`, `q4_only_land`, `q4_only_water` (ba lựa chọn câu q4 bài 1), cùng nét, cùng bảng màu.
   Các hình vẽ này **không** là Trái Đất từ vũ trụ, không có đường cong chân trời kiểu quả cầu, không quả địa cầu, không bản đồ, không la bàn, không đường bờ biển có hình dạng một nước, không chữ. Bài 2 tới 6 toàn ảnh.
3. **Một câu, một kệ: một loại hình.** Cả sáu kệ Chơi là ảnh chụp. Câu q4 bài 1 là ba hình vẽ (không ảnh nào); mọi câu chọn khác là ảnh chụp. Hình vẽ không đứng cạnh ảnh chụp trong cùng một câu. Đáp án đúng không là ảnh mới duy nhất giữa các ảnh đã gặp trong bài (ở ô Học hay kệ Chơi trước câu hỏi), và ngược lại không là ảnh quen duy nhất giữa các ảnh mới.
4. **Không bản đồ, không quả địa cầu, không ảnh vệ tinh, không hình nét bờ biển Việt Nam** (khuyến nghị 5). Ảnh chụp từ máy bay hay flycam chỉ thấy một đoạn cảnh gần (một khúc sông, một vịnh nhỏ, một hòn đảo), không thấy hình dạng cả một vùng bờ biển. Tên ảnh ở nguồn hiện ở màn "Nguồn hình": người chọn ảnh loại ảnh có tên "Biển Đông", "East Sea", "South China Sea", "Hoàng Sa", "Trường Sa", "Paracel", "Spratly" trong tiêu đề hay mô tả.
5. **Ảnh mang tên nơi** (khuyến nghị 6): Phan Xi Păng, sông Mê Kông, hồ Ba Bể, đồng bằng sông Cửu Long, vịnh Hạ Long, động Phong Nha, hang Sơn Đoòng. Brief ghi "cần ảnh đúng nơi, giấy phép hợp lệ; thiếu thì bỏ tên". Người chọn ảnh mở trang gốc, kiểm địa điểm và giấy phép (phần lớn ảnh Hạ Long, Phong Nha trên Commons là BY-SA; ảnh Sơn Đoòng đẹp thường có bản quyền riêng). Không có ảnh hợp lệ thì dùng ảnh cảnh chung, và bài dùng **câu dự phòng không tên nơi** đã viết sẵn ở dòng `>` ngay dưới chỗ đó; ghi tên nơi bị bỏ vào mục "Tên nơi đã bỏ" dưới đây.
6. **An toàn trong ảnh** (khuyến nghị 7): không trẻ em bơi, lội một mình; không lũ, nước dâng, sóng dữ đánh vào người; không tai nạn, người đuối nước, thuyền lật; không người leo vách đá không dây; không người đứng mép vực. Người trong cảnh ở xa, không nhận ra mặt.
7. **Không thiên tai, không núi lửa, không thác nước lớn, không hẻm núi** (ngoài phạm vi: Discoverer #1, #9). Ảnh núi không có miệng núi lửa, khói; ảnh hang không có thác.
8. **Không chữ, không logo** trong mọi hình: không biển hiệu khu du lịch, không cột mốc có chữ trên đỉnh núi, không tên tàu, biển số, không bảng chỉ đường trong hang.
9. **Hang:** ánh đèn trắng hay vàng ấm; tránh ảnh hang chiếu đèn màu sặc sỡ (xanh lá, tím), vì bé dễ nghĩ đá có màu đó.
10. **Không lộ đáp án:** hình câu `single_choice`, `order_sequence` là hàng rào tre; hình câu `true_false` là đúng vật được nói tới; `alt` của lựa chọn đúng không chứa chữ của câu hỏi (vì vậy `alt` gốc đặt sẵn không có tên vật: `tray_mountain` "A tall, steep peak", `tray_hill` "A low, round, green slope", `tray_sea` "Wide blue water to the sky", `explore_water` "Water winding through rice fields", `explore_plain` "Fields stretching far away", `explore_lake` "Calm water ringed by trees", `explore_island` "A small, green land in the sea", `explore_bay` "Sea held by curving hills", `explore_cave` "A dark opening in a rocky hill", `explore_rock_icicles` "Long, pointy rocks pointing down", `explore_by_river` "A busy riverbank by a bridge", `explore_sandy` (riêng ở bài 5 q4) "A quiet shore by calm water"). Trên thẻ lựa chọn Explorer, VoiceOver đọc `label`, không đọc `alt` (đã ghi ở *Lớn lên*).
11. **Hai cảnh trong một câu khác nhau rõ bằng mắt** (luật Explorer số bảy): núi (đỉnh nhọn, sườn dốc, đá) khác đồi (thấp, tròn, phủ cỏ hay chè); sông (dải nước dài, thấy gợn chảy) khác hồ (mặt nước tròn trịa, có bờ quanh, lặng); hồ khác biển (thấy bờ bên kia); bãi cát khác bãi đá; hang khác đường hầm (vách đá gồ ghề, không bê tông, không đường nhựa).
12. **Khung (SK-043):** thẻ ba lựa chọn 5:2, thẻ hai lựa chọn 17:10, món Chơi và thẻ `order_sequence` vuông, hình câu `true_false` 4:3, thẻ từ 2:1, thẻ thưởng vuông. Ảnh phong cảnh nên ngang, chủ thể nằm giữa, để crop vuông vẫn còn đủ.
13. **Bối cảnh Việt Nam** khi có ảnh hợp lệ: đồi chè, ruộng lúa đồng bằng, sông có đò, bãi biển miền Trung, đảo ven bờ, núi đá vôi, hang miền Trung.
14. **Từ khoá tìm ảnh:** truy vấn hai, ba từ hoặc tên nơi, nhiều truy vấn cách nhau bằng `;`. Chỗ dùng lại chép đúng truy vấn đầu của hình gốc. Mọi "Dùng lại hình" trỏ thẳng về mục có ảnh thật.

### Pháp lý và tên nơi

- **Không bao giờ** có trong chữ bé nghe (EN, VI): "Hoàng Sa", "Trường Sa", "Biển Đông", "East Sea", "South China Sea", "bản đồ", "map", "globe", "quả địa cầu" (khuyến nghị 5). Biển chỉ gọi chung là "biển" · "the sea". Đảo chỉ lấy đảo ven bờ (Cát Bà, Phú Quốc, Lý Sơn).
- **Tên nơi gắn với ảnh** (phải có ảnh đúng nơi, giấy phép hợp lệ):

  | Bài · chỗ | Tên nơi | Câu dự phòng khi thiếu ảnh (đã viết ở dòng `>` trong bài) |
  | --- | --- | --- |
  | 2 · ô Học `explore_fansipan`, món `tray_fansipan`, câu q3, thẻ `fansipan_card` | Phan Xi Păng; "near Sa Pa" | Ô thành "Tall mountains" · "Núi cao" ("Some mountains reach above the clouds."); q3 "Some mountains reach above the clouds." (Đúng); thẻ thành `misty_peak_card` |
  | 3 · thẻ `mekong_delta_card` | đồng bằng sông Cửu Long | Thẻ thành `canal_card` "Canal" · "Kênh rạch" |
  | 4 · ô Học `explore_mekong` | sông Mê Kông | Ô thành "Big river" · "Sông lớn" ("Big rivers carry many boats.") |
  | 4 · món `tray_ba_be`, thẻ `ba_be_card` | hồ Ba Bể | Món "Lake in the hills" · "Hồ giữa núi đồi"; thẻ thành `mountain_lake_card` |
  | 5 · món `tray_rock_islands`, thẻ `ha_long_bay_card`, ô Bay ví dụ ba | vịnh Hạ Long | Món "Rocky islands" giữ; thẻ thành `rock_islands_card`; ví dụ ba "some bays have many islands" |
  | 6 · ô Học `explore_big_cave` ví dụ hai | ~~động Phong Nha~~ (bỏ 19/11) | Đã dùng câu không tên, tả đúng ảnh: "people look tiny inside" · "người đứng trong đó trông bé xíu" (ảnh không thấy sông) |
  | 6 · thẻ `son_doong_card` | hang Sơn Đoòng | Thẻ thành `phong_nha_card` (nếu có ảnh Phong Nha hợp lệ), không thì `stalactite_card` |

- **Tên nơi chỉ ở lời ví dụ, không gắn với ảnh** (như "like Hanoi" của *Thời tiết và các mùa*): "Cat Ba, Phu Quoc, Ly Son" (bài 5 ô Island), "Hoan Kiem Lake in Hanoi" (bài 4 ô Lake), "the Red River in Hanoi" (bài 4 ô By the river), "Hanoi lies on a plain" (bài 3 ô Villages and towns). Phiên chính chốt 19/11 (quyết định 1): khuyến nghị 6 chỉ áp cho tên nơi gắn với ảnh, nên bốn chỗ này giữ. Ảnh của các ô đó không mang tên nơi.
- **Tên nơi đã bỏ** (19/11, sau khi designer chọn ảnh): động Phong Nha (bài 6 ô Huge caves, ví dụ hai): trang gốc ảnh chỉ ghi "Dong Hoi Phong Nha grotten", không chắc đúng động Phong Nha, ảnh không có sông. Sáu nơi còn lại có ảnh đúng nơi, giấy phép hợp lệ, giữ tên.

### An toàn và nhạy cảm (khuyến nghị 7)

- **Một câu an toàn ở ô Học bài 4, 5, 6**, dạng ví dụ của ô, không thành câu Khởi động hay Quiz: bài 4 ô River "go to rivers only with a grown-up" · "chỉ ra sông cùng người lớn"; bài 5 ô Sandy beach "go to the sea with a grown-up" · "chỉ ra biển cùng người lớn"; bài 6 ô Cave "go into caves with a grown-up" · "chỉ vào hang cùng người lớn". Từ SK-061 (19/11), Explorer không còn bài an toàn gần nước riêng (*Nước quanh em* đã bỏ khỏi Explorer); ba câu an toàn ở bài 4, 5, 6 vẫn giữ nguyên (SK-061 quyết định 3). Ý an toàn gần nước đầy đủ được đề xuất thêm vào Discoverer #9 *Sông, hồ và vòng tuần hoàn nước* khi soạn.
- Thêm hai lời nhắc nhẹ: bài 5 ô Rocky beach "rocks can be slippery" · "đá có thể trơn trượt"; bài 6 ô Stalactites "look, but do not touch" · "chỉ nhìn, không chạm vào" (giữ nhũ đá).
- Không câu nào rủ bé bơi, lội, leo núi, leo vách, vào hang một mình, nhặt đá trong hang. Ví dụ "climb up a hill" chỉ là đi bộ lên đồi.
- Không thiên tai: không lũ, sạt lở, bão biển, sóng thần (Discoverer *Bề mặt Trái Đất*, *Thời tiết và thiên tai*). Không ô nhiễm, rác trên bãi biển, khai thác cát (Discoverer #16).
- Không giả định gia đình (bé có bố mẹ, ông bà ở quê) hay nơi ở (quê, phố, gần biển).

### Ranh giới với chủ đề khác (khuyến nghị 1–4, 8)

- **Discoverer #7 *Hệ Mặt Trời* bài 1 (Trái Đất là quả cầu; SK-061 chuyển ý này từ Explorer *Bầu trời ngày và đêm* lên đây):** bài 1 chỉ nhìn từ máy bay, flycam, đỉnh đồi (ảnh và hình vẽ giấy cắt); không ảnh, hình Trái Đất từ vũ trụ; không nói Trái Đất tròn; không "Earth" trong chữ bé nghe.
- **Discoverer #9 *Sông, hồ và vòng tuần hoàn nước*** (SK-061 bỏ chủ đề *Nước quanh em* khỏi Explorer, ý nước để Discoverer đào sâu): bài 4 chỉ dạy nhận ra sông (dài, nước chảy) và hồ (bờ bao quanh, nước đứng yên). Đường đi suối → sông → biển, mưa, nước ngầm, an toàn gần nước đầy đủ: để Discoverer #9. Câu xếp thứ tự bài 6 đi từ núi xuống biển là đi trên **đất**, không phải đường đi của nước.
- ***Những nơi sống trên Trái Đất* (#4):** bài 5 dạy hình dạng bờ biển (bãi cát, bãi đá, đảo, vịnh). Không làm lại "biển mặn" (chỉ ôn ở Khởi động bài 1), rạn san hô, biển sâu, con vật biển (#4 bài 5); không rừng ngập mặn, đầm lầy (#4 bài 4; chỉ ôn ở Khởi động bài 4). Con vật chỉ xuất hiện làm cảnh (cua trốn khe đá, cò trên ruộng, vịt trên hồ). Dòng ranh giới ngược lại đã thêm vào `noi-song-tren-trai-dat/_topic.md`.
- ***Thời tiết và các mùa* (#5):** bài 2 dùng "trời lạnh, mặc áo ấm" (#5 bài 1) để dạy "trên núi mát"; không dạy mùa, tuyết. Bài 3 dùng cùng ảnh ruộng lúa với #5 bài 4 (trỏ thẳng mục gốc Discoverer `q2_rice`); không dạy mùa mưa.
- ***Cây quanh em* (#7), *Lớn lên* (#8):** cây lúa, chè chỉ là cảnh; không trồng, cấy, gặt lúa (Discoverer #11 bài 9). Rùa biển con chỉ ở Khởi động bài 5.
- **Discoverer *Bề mặt Trái Đất* (#1):** đất và nước trên Trái Đất, châu lục, đại dương, núi lửa, động đất để dành; không dùng key `earth_mostly_land`. Nhiều ảnh của Discoverer bài 1 hợp chủ đề này: designer được chép mục (ghi ở từng chỗ).
- **Discoverer #9, Scientist #3 (mức biết, hiểu):** vì sao có núi, phù sa bồi đắp đồng bằng, hang do nước bào mòn đá vôi, nhũ đá hình thành thế nào, vòng tuần hoàn nước; thác, hẻm núi. Discoverer #6 đá và đất; Discoverer #8 bài 7 biển đảo Việt Nam và chủ quyền; Discoverer #13 tiếng vọng, dơi định vị.
- **Bài 3 và nguyên tắc N1 (khuyến nghị 8):** ý chính là đồng bằng (địa hình tự nhiên); ruộng lúa là hình quen để bé nhận ra đồng bằng. Không ruộng bậc thang ở bất kỳ chỗ nào của chủ đề (kể cả làm món bẫy), vì ruộng bậc thang nằm trên núi.

### Thẻ thưởng (bộ mới `set: landforms`)

Key `landforms`, tên "Landform cards" · "Thẻ núi sông" (phiên chính chốt 19/11, quyết định 2). ios-dev thêm khoá `collectible.set.landforms`.

| Bài | Key · tên EN · VI | `rarity` | `tag` EN · VI | Em có biết? (`fact`) EN · VI | Hình | [CẦN KIỂM] |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | `cape_card` Cape · Mũi đất | common | Land poking into the sea · Đất chìa ra biển | A cape has sea on three sides. · Mũi đất có biển ở ba phía. | ảnh mới, mũi đất nhìn từ trên cao | Định nghĩa "mũi đất" |
| 2 | `fansipan_card` Fansipan · Núi Phan Xi Păng | common | High in the clouds · Cao tít trong mây | Sometimes, snow falls on its top. · Có năm, tuyết rơi trên đỉnh núi. | `explore_fansipan` | Tuyết rơi trên đỉnh Phan Xi Păng (một số năm) |
| 3 | `mekong_delta_card` Mekong Delta · Đồng bằng sông Cửu Long | common | Rivers everywhere · Sông ngòi chằng chịt | Here, many people travel by boat. · Ở đây, nhiều người đi lại bằng thuyền. | ảnh mới, kênh rạch có xuồng | Đi lại bằng thuyền, xuồng |
| 4 | `ba_be_card` Ba Be Lake · Hồ Ba Bể | common | A lake among mountains · Hồ giữa núi rừng | Ba Be is three lakes joined together. · Hồ Ba Bể gồm ba hồ nối liền nhau. | `tray_ba_be` | Ba hồ Pé Lầm, Pé Lù, Pé Lèng |
| 5 | `ha_long_bay_card` Ha Long Bay · Vịnh Hạ Long | rare | Rocky islands in the sea · Đảo đá giữa biển | Ha Long Bay has over a thousand islands. · Vịnh Hạ Long có hơn một nghìn hòn đảo. | `tray_rock_islands` | Số đảo (Discoverer cũng viết "hơn một nghìn") |
| 6 | `son_doong_card` Son Doong Cave · Hang Sơn Đoòng | rare | A forest inside a cave · Có cả rừng trong hang | Son Doong has a jungle inside it. · Trong hang Sơn Đoòng có cả một khu rừng. | ảnh mới, đúng hang | Rừng trong hố sụt của hang |

- Không trùng thẻ đã có (grep `^### \w+_card` trong `content/explorer/` 19/11; Discoverer có `ha_long` ở bộ `earth`, khác key, khác nhóm tuổi). Không làm thẻ dơi (đã có `bat_card` ở #1), thẻ sen (`lotus_card` ở #2).
- Thẻ dự phòng khi thiếu ảnh đúng nơi: mục Pháp lý và tên nơi; mỗi bài có đủ chữ ở dòng `>` dưới thẻ.

### Đáp án Đúng/Sai

| Bài | Câu `true_false` | Đáp án |
| --- | --- | --- |
| 1 | w1 "Sea water tastes salty." | Đúng |
| 1 | w2 "The Antarctic is hot, sandy land." | Sai |
| 1 | q2 "Mountains and hills are high land." | Đúng |
| 1 | q5 "Tall buildings are high land." | Sai |
| 1 | q6 `land_all_flat` "The land is flat everywhere." | Sai |
| 2 | w1 "From a plane, we see land and sea." | Đúng |
| 2 | q2 "Hills are taller than mountains." | Sai |
| 2 | q3 "Fansipan is the tallest mountain in Vietnam." | Đúng |
| 2 | q6 `mountain_top_warmer` "It is hotter on top of a mountain." | Sai |
| 3 | w2 "Rain makes the rice fields dry." | Sai |
| 3 | q2 "Plains are often near big rivers." | Đúng |
| 3 | q3 "Many rice fields grow on the plains." | Đúng |
| 3 | q5 "A plain is steeper than a hill." | Sai |
| 3 | q6 `plain_is_one_field` "A plain is just one big field." | Sai |
| 4 | w1 "A plain is wide, flat land." | Đúng |
| 4 | w2 "Lotus swamps are full of salty water." | Sai |
| 4 | q2 "A lake has land all around it." | Đúng |
| 4 | q6 `river_water_still` "River water just stays in one place." | Sai |
| 5 | w2 "Baby sea turtles crawl to the sea." | Đúng |
| 5 | w3 "The beach is where land meets sea." | Đúng |
| 5 | q2 "Some beaches are covered in rocks." | Đúng |
| 5 | q5 "A lake is land with water all around." | Sai |
| 5 | q6 `islands_float` "An island floats on the sea." | Sai |
| 6 | w1 "An island has water all around it." | Đúng |
| 6 | w2 "Mountain tops feel hotter than the plains." | Sai |
| 6 | q2 "Caves are dark and cool inside." | Đúng |
| 6 | q6 `caves_are_small` "Every cave is small, like a hole." | Sai |

- Hai mươi bảy câu (từ 19/11, thêm bài 5 w3): mười ba Đúng, mười bốn Sai. Không tính sáu câu q6: mười ba Đúng, tám Sai. Bài nào cũng có cả hai.
- Không câu nào có "not", "no", "never", "không", "chưa"; "just", "every", "everywhere" là câu khẳng định. Không câu nào có `labels`.
- Câu đáp án Sai: `explanation_correct` không mở đầu "Yes!" · "Đúng rồi!", đứng một mình; `explanation_wrong` mở đầu "This is false." · "Câu này sai."; phản hồi ở `feedback_true`. Câu đáp án Đúng: `explanation_wrong` mở đầu "This is true." · "Câu này đúng."; phản hồi ở `feedback_false`.

### Thứ tự đúng các câu `order_sequence`

| Bài | Câu | Thứ tự đúng | Ghi chú |
| --- | --- | --- | --- |
| 2 | q4 | núi (`q4_mountain`), đồi (`q4_hill`), đất bằng (`q4_fields`) | "Start with the highest."; gợi ý nhắc đầu kia (đất bằng thấp nhất) |
| 4 | q4 | ao (`q4_pond`), hồ (`q4_lake`), biển (`q4_sea`) | "Start with the smallest."; gợi ý nhắc đầu kia (biển rộng nhất) |
| 6 | q4 | núi (`q4_mountain`), đồng bằng (`q4_plain`), bãi biển (`q4_beach`) | "Start high on a mountain. Walk down to the sea."; ôn bài 2, 3, 5; đi trên đất, không phải đường đi của nước |

- Ba thẻ mỗi câu là ảnh chụp, khung vuông; thẻ trong file không nằm sẵn đúng thứ tự.

### Khởi động (giãn cách)

| Bài | w1 | w2 | w3 |
| --- | --- | --- | --- |
| 1 | `noi-song-tren-trai-dat/bien-va-dai-duong` (#4 bài 5), TF "Sea water tastes salty." · Đúng | `noi-song-tren-trai-dat/nam-cuc` (#4 bài 2), TF "The Antarctic is hot, sandy land." · Sai | — |
| 2 | `nui-song-va-bien/dat-lien-va-bien` (bài trước), TF "From a plane, we see land and sea." · Đúng | `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay` (#5 bài 1), SC "What do we wear on cold days?" · áo khoác ấm ✓; áo cộc tay | — |
| 3 | `nui-song-va-bien/nui-va-doi` (bài trước), SC "Which one is a hill?" · đồi ✓; núi | `thoi-tiet-va-cac-mua/mua-mua-va-mua-kho` (#5 bài 4), TF "Rain makes the rice fields dry." · Sai | — |
| 4 | `nui-song-va-bien/dong-bang-va-ruong-lua` (bài trước), TF "A plain is wide, flat land." · Đúng | `noi-song-tren-trai-dat/rung-ngap-man-va-dam-lay` (#4 bài 4), TF "Lotus swamps are full of salty water." · Sai | — |
| 5 | `nui-song-va-bien/song-va-ho` (bài trước), SC "Which one has flowing water?" · sông ✓; hồ | `lon-len/con-vat-de-trung` (#8 bài 3), TF "Baby sea turtles crawl to the sea." · Đúng | `nui-song-va-bien/dat-lien-va-bien` (cách bốn bài, thêm 19/11), TF "The beach is where land meets sea." · Đúng |
| 6 | `nui-song-va-bien/bai-bien-dao-va-vinh` (bài trước), TF "An island has water all around it." · Đúng | `nui-song-va-bien/nui-va-doi` (cách bốn bài), TF "Mountain tops feel hotter than the plains." · Sai | `nui-song-va-bien/dong-bang-va-ruong-lua` (cách ba bài), SC "Which land is wide and flat?" · đồng bằng ✓; đồi |

- Mỗi bài một câu ôn bài ngay trước (bài 1 chưa có bài trước nên cả hai câu ôn #4) và một câu ôn chủ đề khác có liên quan (biển, đất phủ băng, áo ấm, ruộng lúa, đầm lầy, rùa biển trên cát). Bài 6 (`review`) có ba câu, ôn trộn bài 5, 2, 3 (SK-058); bài 1, 4 được ôn ở câu q4 và kệ Chơi bài 6. Bài 5 có thêm w3 ôn bài 1 (tester n12, 19/11): cùng bài 6 w2, hai chỗ chạm mốc khoảng một tuần (`warmup.week`).
- Câu ôn chủ đề khác là câu mới, không chép câu hỏi cũ: bài 1 w1 khác "Sea water tastes sweet." của Discoverer; bài 1 w2 khác câu hỏi của #4 bài 2; bài 2 w2 khác q1 "What do we wear on rainy days?" của #5 bài 1; bài 4 w2 khác w1 "Swamp water is salty, like the sea." của #4 bài 5.

### Phần Chơi sáu bài (`build_tray`)

| Bài | Lệnh | Nhóm bắt buộc (món) · màu | Nhóm `limit` (món bẫy) |
| --- | --- | --- | --- |
| 1 | "Find high land, flat land and water" · "Tìm đất cao, đất bằng và nơi có nước" | High land · Đất cao (núi, đồi) `nau_dat`; Flat land · Đất bằng (ruộng lúa) `vang_hoe`; Water · Nơi có nước (biển, sông) `cham` | Made by people · Do người làm ra: toà nhà cao, bể bơi |
| 2 | "Find a mountain, a hill and flat land" · "Tìm núi, đồi và đất bằng" | Mountain · Núi (đỉnh núi dốc, Phan Xi Păng) `nau_dat`; Hill · Đồi (đồi xanh, đồi cỏ) `gi_dong`; Flat land · Đất bằng (ruộng lúa) `vang_hoe` | Made by people · Do người làm ra: đống rơm, toà nhà cao |
| 3 | "Find what is on a plain" · "Tìm những gì có trên đồng bằng" | Rice fields · Ruộng lúa (ruộng lúa, lúa non) `gi_dong`; Villages · Làng xóm (làng) `nau_dat`; Rivers · Sông (sông qua ruộng) `cham` | Not on a plain · Không ở đồng bằng: núi, đồi |
| 4 | "Find a river, a lake and the sea" · "Tìm sông, hồ và biển" | River · Sông (sông gợn sóng, sông nhìn từ trên cao) `cham`; Lake · Hồ (hồ lặng, hồ Ba Bể) `gi_dong`; Sea · Biển (biển rộng) `vang_hoe` | Made by people · Do người làm ra: bể bơi, bể cá |
| 5 | "Find beaches and an island" · "Tìm bãi biển và hòn đảo" | Sandy beach · Bãi cát (bãi cát) `vang_hoe`; Rocky beach · Bãi đá (bãi đá) `nau_dat`; Island · Đảo (đảo xanh, đảo đá) `gi_dong` | River or lake · Sông hoặc hồ: sông, hồ |
| 6 | "Find a cave, high land and water" · "Tìm hang, đất cao và nơi có nước" | Cave · Hang (cửa hang, nhũ đá) `gi_dong`; High land · Đất cao (núi, đồi) `nau_dat`; Water · Nơi có nước (sông, biển) `cham` | Made by people · Do người làm ra: đường hầm, bể bơi |

- **Lời nhắn `has_limited`** (đúng với mọi món bẫy của bài): bài 1, 2, 4, 6 "People made that one." · "Cái này do người làm ra."; bài 3 "That is high land, not a plain." · "Đó là đất cao, không phải đồng bằng."; bài 5 "That is a river or a lake." · "Đó là sông hoặc hồ, không phải biển."
- **Mỗi món bẫy giống một nhóm bắt buộc:** toà nhà cao vươn lên như núi; bể bơi, bể cá chứa nước như hồ; đống rơm tròn như quả đồi; đường hầm tối như cửa hang; núi, đồi cũng là đất (bài 3); sông, hồ cũng có nước và có bờ (bài 5). Bẫy "Made by people" dạy nguyên tắc N1: núi, sông, biển, hang là của tự nhiên.
- Một ý một nhãn: "High land" · "Đất cao", "Flat land" · "Đất bằng", "Water" · "Nơi có nước", "Made by people" · "Do người làm ra" giữ đúng chữ ở mọi bài có nhóm đó. "High land" chỉ là nhóm bắt buộc (bài 1, 6); nhóm bẫy bài 3 đổi thành "Not on a plain" (tester n10, 19/11).
- Bài 3 (tester C2, 19/11): ảnh toàn cảnh đồng bằng `explore_plain` không vào kệ (từng là món "Wide fields" trong nhóm "Rice fields", ngược câu q1, q6); kệ bài 3 còn sáu món.

### Từ vựng từng bài

| Bài | `core` (vào `word_list`) | `extra` | Hình từ |
| --- | --- | --- | --- |
| 1 | `land` land · đất liền; `sea` sea · biển | `flat` flat · bằng phẳng; `high` high · cao | `explore_high`; `tray_sea`; `explore_flat`; `tray_mountain` |
| 2 | `mountain` mountain · núi; `hill` hill · đồi | `steep` steep · dốc; `peak` peak · đỉnh núi | `tray_mountain` (bài 1); `tray_grass_hills`; `tray_mountain` (bài 1); `tray_mountain` (bài 1, từ lượt 2) |
| 3 | `plain` plain · đồng bằng; `rice_field` rice field · ruộng lúa | `village` village · làng; `wide` wide · rộng | `explore_plain`; `q2_rice` (Discoverer *Khủng long* bài 1); `explore_village`; `explore_plain` |
| 4 | `river` river · sông; `lake` lake · hồ | `flow` flow · chảy; `boat` boat · thuyền | `explore_river`; `explore_lake`; `explore_water` (bài 1); `explore_by_river` |
| 5 | `beach` beach · bãi biển; `island` island · hòn đảo; `bay` bay · vịnh | `sand` sand · cát; `wave` wave · sóng | `explore_sandy`; `explore_island`; `explore_bay`; `explore_sandy`; ảnh riêng sóng xô vào đá (từ 19/11) |
| 6 | `cave` cave · hang; `rock` rock · đá | `dark` dark · tối; `stalactite` stalactite · nhũ đá (thêm 19/11); `torch` torch · đèn pin | `explore_cave`; `explore_rock_icicles`; `explore_dark`; `explore_rock_icicles`; ảnh mới đèn pin |

- Không từ nào trùng giữa sáu bài hay với từ vựng Explorer đã có (grep `^### <key>$` cả `content/explorer/` 19/11: 0 kết quả). "pond", "field", "ocean", "water", "dry", "wet" đã là từ ở chủ đề khác nên không làm lại.

### Hình dùng chung

Key ảnh gốc là bắt buộc: bài phụ trách đặt đúng key, `alt` và truy vấn đầu; bài khác trỏ tới bằng "Dùng lại hình `<key>` ở bài `nui-song-va-bien/<slug bài>`." rồi chép từ khoá và `alt`.

**Hình gốc mới trong chủ đề này** (chỉ ghi những hình dùng ở nhiều chỗ):

| Key gốc · bài | Nội dung | Từ khoá đầu | `alt.en` · `alt.vi` | Dùng ở |
| --- | --- | --- | --- | --- |
| `explore_above` · 1 | **hình vẽ giấy cắt:** toàn cảnh nhìn chếch từ trên cao: núi, đồi, đồng bằng có sông, bãi cát, biển, một hòn đảo nhỏ | — (hình vẽ) | Land and sea seen from up high · Đất liền và biển nhìn từ trên cao | 1 (Học, q6); 2 (w1) |
| `explore_water` · 1 | dải sông uốn qua ruộng lúa, chụp từ trên cao; không thấy biển (ảnh thật: sông Tràng An, lúa sắp chín, thuyền khách nhỏ) | winding river aerial fields | Water winding through rice fields · Dải nước uốn lượn qua ruộng lúa | 1 (Học); 3 (Học, q2); 4 (tray, q5, từ `flow`). Lượt 4: không còn ở kệ bài 1, 3 (ảnh có ruộng, núi, nước đôi) |
| `tray_mountain` · 1 | một đỉnh núi cao, sườn dốc, có mây | steep mountain peak clouds | A tall, steep peak · Đỉnh cao, sườn dốc đứng | 1 (tray, q1, từ `high`); 2 (Học, tray, q1, q4, q6, từ `mountain`, `steep`); 3 (tray, q1, q4, w1); 6 (tray, q3, q4) |
| `tray_hill` · 1 | một quả đồi thấp, đỉnh tròn, phủ cỏ hay chè | round green hill | A low, round, green slope · Sườn đất thấp, tròn, xanh mướt | 1 (tray, q3); 2 (Học, tray, q1, q2, q4); 3 (w1); 6 (tray, q1, w3). Lượt 4: kệ bài 3 dùng `tray_grass_hills` của bài 2 thay ảnh này |
| `tray_sea` · 1 | biển rộng tới chân trời, không thấy đất (ảnh lượt 2: biển khơi Avşa, CC0; không còn chép mục Discoverer) | open sea horizon | Wide blue water to the sky · Nước xanh mênh mông tới chân trời | 1 (tray, q1, từ `sea`); 3 (q1); 4 (tray, q1, q4); 6 (tray) |
| `tray_building` · 1 | toà nhà cao tầng, không chữ | tall building blue sky | A tall building · Toà nhà cao tầng | 1 (tray, q3, q5); 2 (tray) |
| `tray_pool` · 1 | bể bơi ngoài trời vắng người | empty outdoor swimming pool | An empty swimming pool · Bể bơi vắng người | 1 (tray); 4 (tray, q3); 6 (tray) |
| `explore_fansipan` · 2 | dãy Phan Xi Păng mờ sương (ảnh đúng nơi, CC0) | Fansipan peak | Fansipan, tall and misty · Phan Xi Păng cao vút, mờ sương | 2 (Học, tray, q3, thẻ) |
| `explore_cool` · 2 | biển mây dưới các đỉnh núi | sea of clouds mountains | Clouds below the mountain tops · Mây trắng dưới các đỉnh núi | 2 (Học, q5); 6 (w2) |
| `explore_plain` · 3 | đồng bằng nhìn từ trên cao: nhiều thửa ruộng, phẳng tới chân trời (ảnh thật ở Bali, có đường thẳng, hàng dừa, không thấy nhà) | Mekong Delta fields aerial | Fields stretching far away · Ruộng đồng trải dài tít tắp | 3 (Học, q1, q4, q5, q6, từ `plain`, `wide`; không vào kệ từ 19/11); 4 (w1); 6 (q4, w3) |
| `explore_village` · 3 | làng giữa ruộng lúa: nhà giữa luỹ tre, cây xanh, ruộng phía trước (ảnh lượt 2: Quảng Ngãi, CC0) | Vietnamese village rice fields | Houses among trees and fields · Nhà cửa giữa cây xanh và ruộng | 3 (Học, tray, từ `village`) |
| `explore_river` · 4 | sông rộng nước nâu, thấy gợn nước chảy, hai bờ tre (ảnh lượt 2: sông Lô, Hà Giang, PD) | wide river ripples | A wide river with ripples · Dòng sông rộng gợn sóng | 4 (Học, tray, q1, q6, từ `river`); 5 (tray, w1); 6 (tray, q1); lượt 4 thêm kệ bài 1, 3 (`tray_river`) |
| `explore_lake` · 4 | hồ lặng, thấy bờ bên kia, cây quanh bờ | calm lake trees shore | Calm water ringed by trees · Mặt nước lặng, cây mọc quanh bờ | 4 (Học, tray, q1, q2, q4, q5, từ `lake`); 5 (tray, q5, w1) |
| `explore_sandy` · 5 | bãi cát khô, trắng, mịn bên mép nước lặng (ảnh lượt 2: Quy Nhơn, CC BY 2.0) | white sand beach Vietnam | Soft, pale sand by calm water · Bãi cát trắng mịn bên làn nước lặng | 5 (Học, tray, q1, q4 `alt` riêng "A quiet shore by calm water" · "Bờ biển vắng bên làn nước lặng", w3, từ `beach`, `sand`); 6 (q4) |
| `explore_rocky` · 5 | bãi đá tròn lớn sát mép nước, nước lặng (ảnh thật Boulders Beach) | rocky beach waves | Big round rocks by the sea · Tảng đá tròn lớn bên bờ biển | 5 (Học, tray, q1, q2, q4) |
| `explore_island` · 5 | đảo nhỏ ven bờ, nước bao quanh bốn phía | small island aerial | A small, green land in the sea · Khoảnh đất xanh nhỏ giữa biển | 5 (Học, tray, q1, q3, q6, từ `island`); 6 (w1) |
| `explore_cave` · 6 | cửa hang trong vách núi đá | cave entrance limestone | A dark opening in a rocky hill · Cửa tối trong vách núi đá | 6 (Học, tray, q1, q5, q6, từ `cave`) |

**Hình của chủ đề khác** (đã mở file bài nguồn 19/11; `alt` chép đúng gốc):

| Hình gốc | `alt` gốc | Dùng ở |
| --- | --- | --- |
| `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha` `w1` | A bamboo fence in a garden · Hàng rào tre trước khu vườn | hình câu mọi `single_choice`, `order_sequence` |
| `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien` `q3` | A beach by the sea · Bãi biển vắng | 1 (w1). Bài 5, 6 từ lượt 2 dùng ảnh bãi cát mới `explore_sandy` của bài 5 |
| `goi-ten-va-nhom-dong-vat/ca-va-luong-cu` `q1` | A pond in a village · Cái ao ở làng quê | 4 (q4) |
| `noi-song-tren-trai-dat/nam-cuc` `explore_land` | Snowy mountains on icy land · Núi tuyết trên vùng đất phủ băng | 1 (w2) |
| `noi-song-tren-trai-dat/rung-ngap-man-va-dam-lay` `explore_swamp` | A swamp with lotus plants · Đầm lầy có cây sen | 4 (w2) |
| `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay` `explore_cold`, `tray_tshirt` | A warm coat on a hanger · Chiếc áo khoác ấm trên móc; A short-sleeved T-shirt · Chiếc áo cộc tay | 2 (w2) |
| Discoverer `khung-long/trai-dat-rat-lau-ve-truoc` `q2_rice` | A green rice field · Ruộng lúa xanh | 1 (`explore_flat`, tray, q1, q3, từ `flat`); 2 (tray, q1, q4, q5); 3 (Học, tray, w2, q3, từ `rice_field`). **Chép mục**; *Thời tiết và các mùa* bài 4 đã chép cùng ảnh thành `explore_fields`. Từ 19/11 trỏ thẳng mục gốc (tester n5). Brief gốc ghi "núi ở xa": crop sao cho không thấy núi rõ, vì ảnh là đáp án "đất bằng" (tester n6) |
| `sinh-vat-song-o-dau/noi-song-cua-cay` `tray_rice` | Young rice in a wet field · Lúa non trên ruộng nước | 3 (tray) |
| `chuoi-thuc-an/chuoi-thuc-an-la-gi` `tray_straw` | A pile of rice straw · Đống rơm khô | 2 (tray) |
| `lon-len/con-vat-de-trung` `tray_turtles` | Baby turtles on the sand · Rùa con bò trên cát | 5 (w2) |
| bài 6 `explore_dark` (hình gốc của bài) | A dim path between rock walls · Lối đi mờ tối giữa vách đá | 6 (Học, q2, q3 lựa chọn sai từ 19/11, từ `dark`); brief dặn không thấy nhũ đá |
| Discoverer `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat` `explore_land` | Hills, mountains and a village · Đồi, núi và làng quê | 1 (`explore_high`, q2, từ `land`). **Chép mục** (ảnh đồi chè Mộc Châu, CC0) |

- **Ảnh Discoverer có thể chép mục** nếu khớp brief (designer kiểm, không bắt buộc): `tray_mountain` (Three Peak Green, PD) cho `tray_mountain`; `tray_sea` hay `tray_atlantic` cho `tray_sea`; `tray_lake` (Calm Waters, PD) cho `explore_lake`; `tray_island` (đảo Hy Lạp, CC BY 2.0) cho `explore_island`; `tray_pond` (ao sen Bình Quới, CC BY 3.0) cho `q4_pond` bài 4; `ha_long` (Ha_Long_Bay.jpg, CC BY 2.5) cho `tray_rock_islands` và thẻ `ha_long_bay_card`; `tray_river` (sông miền Bắc có thuyền, CC0) cho `explore_by_river`. Ghi chú `note` "chép mục" như *Thời tiết và các mùa* đã làm.
- **Đếm hình** (designer 19/11, sau lượt 2): 204 chỗ có hình; ảnh mới hai mươi chín (CC0 16, PD 3, PDM 1, CC BY 9); năm ảnh chép mục Discoverer (đồi chè `explore_high`, ruộng lúa `q2_rice` hai khung, sông Tràng An `explore_water`, hồ `explore_lake`, Hạ Long `tray_rock_islands`); hình vẽ bốn (năm file, bài 1); không hình ghép. `tray_sea` không còn chép mục Discoverer; bãi cát bài 5 không còn mượn ảnh của *Gọi tên và nhóm động vật*.

### Lỗi hay gặp — người viết tự kiểm trước khi nộp

1–19. Như mười chín mục ở `content/explorer/cay-quanh-em/_topic.md` mục "Lỗi hay gặp" (feedback không gọi tên đáp án; mọi câu EN tối đa tám từ; câu hỏi chỉ dùng chữ đã dạy; câu misconception kiểm một việc; `hint` không gần như nói đáp án; không nhắc vị trí thẻ; EN và VI cùng nội dung; câu chính ô Học không mở đầu "It"; một ý một nhãn; `has_limited` đúng với mọi món bẫy; `explanation_correct` thêm một ý; `alt` đáp án không chứa chữ câu hỏi; `hint` của `order_sequence` chỉ nhắc một đầu; câu `true_false` khẳng định, không `labels`).
20. (mới) Grep chữ bé nghe (EN và VI, không tính dòng `>`, `brief`, mục Ghi chú): 0 kết quả "Hoàng Sa", "Trường Sa", "Biển Đông", "East Sea", "South China Sea", "Paracel", "Spratly", "bản đồ", "map", "globe", "quả địa cầu", "Earth", "Trái Đất", "núi lửa", "volcano", "phù sa", "silt", "ruộng bậc thang", "terrace", "icicle", "rock icicles", "thạch nhũ", "erosion", "bào mòn". ("stalactite" được dùng từ 19/11, quyết định 4.)
21. (mới) Tên nơi gắn với ảnh chỉ ở các chỗ trong bảng "Tên nơi gắn với ảnh"; mỗi chỗ có câu dự phòng ở dòng `>`.
22. (mới) Không câu "vì sao", "because", "vì" giải thích cách núi, đồng bằng, hang hình thành hay vì sao trên núi lạnh.
23. (mới) Câu an toàn đúng ba chỗ (bài 4, 5, 6), là ví dụ ô Học, không ở Khởi động, Quiz.
24. (mới) Ảnh thật không có người bơi, lũ, thiên tai, cột mốc có chữ; hình vẽ chỉ ở bài 1.
25. (mới) Ghép ý chính với ô Học: tính lại bảng "Ghép ý chính" khi sửa một câu.

### Đúng khoa học

Mọi ý chưa chắc có dòng `> [CẦN KIỂM]` ngay dưới trường trong bài. Danh sách gộp (phiên chính chép sang "Câu hỏi còn mở" của SK-058):

**Bài 1**
> [CẦN KIỂM] Mũi đất có biển ở ba phía (định nghĩa phổ thông); nước biển mặn (ôn #4); Nam Cực phủ băng (ôn #4); "sông và hồ là nước trên đất liền" (hồ nước mặn, đầm phá ven biển là ngoại lệ, bài không nói); quan niệm `land_all_flat` có ở trẻ.

**Bài 2**
> [CẦN KIỂM] Phan Xi Păng là núi cao nhất Việt Nam (khoảng ba nghìn một trăm bốn mươi ba mét, bài không nói số), gần Sa Pa; mây thường phủ đỉnh; một số năm có tuyết, băng giá trên đỉnh; trên núi cao mát hơn đồng bằng, kể cả mùa hè; chè trồng trên đồi (Mộc Châu, Thái Nguyên); miền Bắc có nhiều núi.

**Bài 3**
> [CẦN KIỂM] Đồng bằng sông Hồng, đồng bằng sông Cửu Long nằm ven sông lớn; Hà Nội nằm trên đồng bằng sông Hồng; lúa nước cần ruộng phẳng, có nước; ở đồng bằng sông Cửu Long nhiều người đi lại bằng thuyền, xuồng; quan niệm `plain_is_one_field`.

**Bài 4**
> [CẦN KIỂM] Sông Mê Kông rất dài (khoảng bốn nghìn ba trăm tới bốn nghìn tám trăm cây số tuỳ nguồn, bài không nói số), chảy qua nhiều nước; nước sông chảy (vùng triều có lúc chảy ngược); nước hồ "đứng yên" ở mức thấy (hồ vẫn có sóng gió); ao nhỏ hơn hồ, hồ nhỏ hơn biển; hồ Ba Bể gồm ba hồ nối nhau (Pé Lầm, Pé Lù, Pé Lèng), nằm giữa núi; Hồ Gươm ở Hà Nội; sông Hồng chảy qua Hà Nội.

**Bài 5**
> [CẦN KIỂM] Bãi biển có bãi cát, bãi đá; cua hay trốn ở khe đá; đảo là đất có nước bao quanh, chân đảo liền với đáy biển; nước trong vịnh thường lặng hơn ngoài biển khơi; vịnh Hạ Long có hơn một nghìn hòn đảo (khoảng một nghìn sáu trăm theo UNESCO, gần hai nghìn theo nguồn khác); Cát Bà, Phú Quốc, Lý Sơn là đảo; rùa biển con bò ra biển (ôn #8).

**Bài 6**
> [CẦN KIỂM] Nhiều hang ở Việt Nam nằm trong núi đá vôi; trong hang tối và mát; nước nhỏ giọt từ trần hang; nhũ đá "stalactite", lời tả "giọt đá dài rủ từ trần" đúng ở mức thấy; không nên chạm vào nhũ đá; động Phong Nha có sông ngầm, thuyền chở khách vào hang; hang Sơn Đoòng có rừng trong lòng hang (ở hố sụt), là một trong những hang lớn nhất thế giới; đường hầm do người đào.

**Tên gọi EN**
> [CẦN KIỂM] "plain" cho đồng bằng (trẻ dễ lẫn với tính từ "plain"); "stalactite" (từ khó, `extra`); hai định nghĩa ở mức thấy "A lake has land all around it." (bài 4) và "A bay is sea curving into the land." (bài 5) (tester 19/11); "cape" cho mũi đất; "torch" hay "flashlight"; "rice field" hay "paddy"; "Mekong Delta" và "đồng bằng sông Cửu Long"; "Ba Be Lake"; "Son Doong Cave".

### Đề xuất cho người khác

- **ios-dev:** khoá `collectible.set.landforms` "Landform cards" · "Thẻ núi sông" (chốt 19/11). Tester n7: mười câu nhận tên có `label` đáp án trùng chữ câu hỏi, VoiceOver đọc `label` là lộ đáp án; lỗi chung cả repo (SK-054), chủ đề này không sửa chữ, chờ PM, ios-dev chốt (ví dụ VoiceOver đọc `alt` ở câu nhận tên).
- **designer:** bốn hình vẽ giấy cắt bài 1 (một toàn cảnh, ba cảnh nhỏ cho câu q4, cùng bảng màu style E); ảnh theo "Hình dùng chung" và "Ghi chú cho hoạ sĩ" từng bài; kiểm địa điểm, giấy phép bảy ảnh mang tên nơi; điền mục "Tên nơi đã bỏ".
- **dev:** không đổi danh mục (tên bài giữ nguyên).
- **PM:** cập nhật TEMPLATE cho hình vẽ giấy cắt theo chủ đề (quyết định 7).

### Còn mở (chờ PM hoặc Duy)

1. ~~Tên nơi chỉ ở lời ví dụ~~ **Đóng 19/11** (quyết định 1): giữ.
2. ~~Tên bộ thẻ~~ **Đóng 19/11** (quyết định 2): "Thẻ núi sông".
3. Ba misconception chưa có nguồn nghiên cứu (`land_all_flat`, `plain_is_one_field`, `caves_are_small`): giữ, `[CẦN KIỂM]` cho người chuyên môn (quyết định 3).
4. ~~"Rock icicles"~~ **Đóng 19/11** (quyết định 4, tester C3): dùng "stalactite" · "nhũ đá"; tả cho trẻ "like long stone drips from the roof".
5. Thẻ bài 6: ảnh Sơn Đoòng hợp lệ rất hiếm; nếu thiếu thì `phong_nha_card`, rồi `stalactite_card` (chữ đã viết sẵn; quyết định 5).
6. Bài 1 câu q4 là ba hình vẽ mới (không hình nào bé đã gặp). Nếu designer chỉ vẽ được một hình, phương án thay: đổi q4 thành ba ảnh chụp từ flycam (bờ biển, đồi, biển khơi), chữ câu giữ nguyên.
