---
id: ac6f6c40-bcf9-4a4c-a2ee-66a32f6e1a75
slug: thoi-tiet-va-cac-mua
age_group: explorer
order: 5
strand: earth_sky
level: 2
difficulty:
  abstraction: 2
  prior_knowledge: 1
  misconception: 2
  vocabulary: 2
  science_skill: 2
prerequisites: []
is_free: false
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Weather and seasons
vi: Thời tiết và các mùa
> Giữ đúng tên ở `content/syllabus.json` (key `new-weather-and-seasons`, Explorer số năm). Duy chốt tên 17/11 (SK-050 câu 1 = A).

## Câu hỏi lớn
en: How does the weather change in a year?
vi: Thời tiết thay đổi thế nào trong một năm?
> Tám từ EN. Câu ở "Bảng soạn" của SK-050. Bài 1 trả lời "thời tiết là gì", bài 2 đến 4 trả lời theo từng miền, bài 5 nói một năm quay vòng, bài 6 gom lại.

## Misconceptions

### sun_gone_when_cloudy
id: 9a14b931-e488-4150-b5ae-562dc71edde4
statement.en: On cloudy days, the Sun goes away.
statement.vi: Trời nhiều mây là Mặt Trời đi mất.
correction.en: The Sun is still there, behind the clouds.
correction.vi: Mặt Trời vẫn ở đó, sau những đám mây.
note: Key ở bảng "Phạm vi" của SK-050. Dạy ở bài 1: ô Học Cloudy (câu chính "Clouds can hide the Sun for a while.", ví dụ "the Sun is still there"), câu q6 gắn key (Sai, hình nắng hắt sau mây `explore_cloudy`). Bài 2 w1 ôn lại ("Clouds can hide the Sun."). Không dạy vì sao có ngày, đêm (chủ đề bầu trời của câu D3, chưa chốt). Nháp AI 17/11/2026.
> [CẦN KIỂM] Nguồn: gần ý Vosniadou và Brewer (1994), trẻ nhỏ giải thích đêm bằng "mây che Mặt Trời", "Mặt Trời đi chỗ khác"; phần còn lại là kinh nghiệm phổ thông. Người chuyên môn xác nhận đây là quan niệm có thật ở trẻ năm tới bảy tuổi.

### flowers_only_in_spring
id: 2d262417-78f4-49e5-bb8c-0f4d2b29e27f
statement.en: Flowers bloom only in spring.
statement.vi: Hoa chỉ nở vào mùa xuân.
correction.en: Flame tree flowers bloom in summer.
correction.vi: Hoa phượng nở vào mùa hè.
note: Key ở bảng "Phạm vi" của SK-050. Dạy ở bài 2: ô Học Summer (câu chính "Flame trees bloom red in summer."), kệ Chơi (nhóm Hoa có cả hoa đào, hoa phượng, hoa sen), câu q6 gắn key (Sai, hình hoa phượng `explore_summer`). Không dùng phương án `summer_always_sunny`: bài 1 đã có câu nắng, mưa; câu hoa gắn với dấu hiệu Việt Nam rõ hơn. Nháp AI 17/11/2026.
> [CẦN KIỂM] Nguồn: PM 17/11; tranh, bài hát thiếu nhi gắn hoa với mùa xuân ("mùa xuân, trăm hoa đua nở"). Hoa phượng nở vào mùa hè ở cả hai miền.

### winter_means_snow
id: 68659082-55b5-43e1-908b-002c95b417d9
statement.en: Winter always brings snow.
statement.vi: Mùa đông lúc nào cũng có tuyết.
correction.en: Hanoi winters are cold, without snow.
correction.vi: Mùa đông Hà Nội lạnh nhưng không có tuyết.
note: Key ở bảng "Phạm vi" của SK-050. Dạy ở bài 3: ô Học Winter (ví dụ "Hanoi is cold, but has no snow"), câu q6 gắn key (Sai, hình phố mùa đông không tuyết `explore_winter`). Không dùng `all_trees_lose_leaves` (thuộc *Cây quanh em* bài 4). Nháp AI 17/11/2026.
> [CẦN KIỂM] Mùa đông Hà Nội không có tuyết; tuyết, băng giá chỉ thỉnh thoảng có ở núi cao phía Bắc (Sa Pa, Mẫu Sơn). Nguồn quan niệm: tranh, phim, thiệp mùa đông có tuyết.

### four_seasons_everywhere
id: 11449c4c-0861-4e6c-8b91-2babb51cd9c1
statement.en: Every place has four seasons.
statement.vi: Nơi nào cũng có bốn mùa.
correction.en: The south has rainy and dry seasons.
correction.vi: Miền Nam có mùa mưa và mùa khô.
note: Key ở bảng "Phạm vi" của SK-050. Dạy ở bài 4: ý chính một, ô Học Rainy season và Dry season, câu q6 gắn key (Sai, hình ghép bốn mùa `explore_seasons` của bài 2). Bài 6 ô North, ô South đặt hai cách chia cạnh nhau. Không dùng phương án `rains_all_day` (một chi tiết của mùa mưa, nhẹ hơn ý chính của bài). Nháp AI 17/11/2026.
> [CẦN KIỂM] Miền Nam có mùa mưa (khoảng tháng Năm tới tháng Mười Một) và mùa khô; nguồn quan niệm: bài hát, sách tranh "bốn mùa"; sách giáo khoa Tự nhiên và Xã hội dạy cả hai cách chia.

### months_stop_after_december
id: ab7a3922-be52-41be-a850-faa389af5fe1
statement.en: After December, the months stop.
statement.vi: Hết tháng Mười Hai là hết tháng.
correction.en: After December, January comes again.
correction.vi: Hết tháng Mười Hai lại đến tháng Một.
note: Key ở bảng "Phạm vi" của SK-050. Dạy ở bài 5: ý chính hai, ô Học Twelve months (vòng mười hai hạt), câu q6 gắn key (Sai, hình vòng tháng `explore_months`). Câu không hỏi tên tháng: bé chỉ cần biết "lại bắt đầu". Không dùng `year_has_four_months` (dễ làm bé lẫn thêm mùa với tháng). Nháp AI 17/11/2026.
> [CẦN KIỂM] Nguồn: trẻ dưới tám tuổi còn khó hiểu thời gian theo vòng (các nghiên cứu của William Friedman về hiểu biết tháng, mùa ở trẻ).

### same_weather_all_year
id: a88777a4-bd99-4cd6-be54-ad4f18902169
statement.en: The weather is the same all year.
statement.vi: Cả năm thời tiết đều như nhau.
correction.en: The weather changes with the seasons.
correction.vi: Thời tiết thay đổi theo mùa.
note: Key ở bảng "Phạm vi" của SK-050. Dạy ở bài 6: ý chính một, bốn ô Học, câu q6 gắn key (Sai, hình ghép bốn mùa `explore_seasons`). Không dùng `seasons_come_once` (ý "mùa quay lại" đã có ở câu q2 Đúng của bài). Nháp AI 17/11/2026.
> [CẦN KIỂM] Nguồn: ý chính của hai unit Year 1 (mục tiêu bắt buộc "quan sát thay đổi qua bốn mùa"); kinh nghiệm phổ thông.

## Ghi chú

> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 17/11/2026. Ticket SK-050. Lượt này chỉ có `_topic.md`; sáu bài do người khác viết song song theo file này.
> Mọi dòng `id:` để trống. Thứ tự chạy `ids`: file này trước, rồi bài 1 tới bài 6 đúng thứ tự (Khởi động bài sau trỏ bài trước của chủ đề này). Mọi bài còn trỏ sang *Gọi tên và nhóm động vật*, *Sinh vật sống ở đâu?* hoặc *Những nơi sống trên Trái Đất*, ba chủ đề đã có id.
> Trong mục Ghi chú, số bài viết bằng chữ số cho dễ tra (máy không đọc mục này). Mọi chữ trẻ đọc hay nghe vẫn viết số bằng chữ.
> **Người viết bài 1 đến 6:** những gì ghi ở đây là chung, không tự đổi: tên gọi, key ảnh gốc (mục Hình dùng chung), dạng câu, đáp án, DOK và lựa chọn của từng câu (mục Khung Quiz và Khởi động), nhóm và món của phần Chơi, thẻ thưởng, từ vựng, `recall_from`. Chữ câu hỏi EN và VI trong các bảng là bản chốt (đã đếm từ); chỉ sửa nếu `validate` báo hoặc khi viết thấy sai, và khi sửa thì ghi một dòng `>` trong bài và báo phiên chính để sửa file này. Gợi ý, phản hồi, giải thích, ví dụ ô Học (trừ ví dụ ghi "bắt buộc"), câu ví dụ của từ, `brief` và `alt` (trừ hình gốc có `alt` ở bảng) là phần người viết tự soạn theo luật.

### Nguồn

- **Chủ đề mới, không bám Oak.** Duy 17/11: "chủ đề thời tiết và sự chuyển đổi giữa các mùa, rồi các tháng trong năm thì gôm chung lại thành 1 topic kiểu generic. không cần quá phụ thuộc vào oak." Rồi (lời Duy do phiên chính chuyển lại): "bật mode auto, không cần hỏi thêm", nên sáu câu chốt theo đề xuất PM (SK-050 "Câu hỏi 1–6"). `source.kind: new`, mỗi bài `oak_lessons: []`, `statutory: false`, không có dòng `oak_unit_ref`. Mục tiêu "I can…" tự viết.
- **Mười lesson Oak Year 1 gộp vào đây** (từ hai unit cũ đã bỏ khỏi danh mục: `seasonal-changes-autumn-and-winter`, Y1 #2; `seasonal-changes-spring-and-summer`, Y1 #5). Chưa đọc trang từng lesson (Duy: không bám Oak); chỉ lấy ý, không chép câu, hình, ví dụ, câu quiz; không nhắc tên Oak trong chữ cho bé.

  | Lesson Oak | Unit cũ | Bài của chủ đề này | Dùng |
  | --- | --- | --- | --- |
  | `weather-in-autumn` | Y1 #2 | 1 (gộp), 3 (một ý) | Tả thời tiết bằng từ đơn giản |
  | `weather-in-winter` | Y1 #2 | 1 (gộp), 3 (một ý) | Như trên |
  | `weather-in-spring` | Y1 #5 | 1 (gộp), 2 (một ý) | Như trên |
  | `weather-in-summer` | Y1 #5 | 1 (gộp), 2 (một ý) | Như trên |
  | `signs-of-spring` | Y1 #5 | 2 | Dấu hiệu mùa, viết lại bằng dấu hiệu Việt Nam |
  | `signs-of-summer` | Y1 #5 | 2 | Như trên |
  | `signs-of-autumn` | Y1 #2 | 3 | Như trên |
  | `signs-of-winter` | Y1 #2 | 3 | Như trên |
  | `day-length-in-summer` | Y1 #5 | 2, một ý ("Summer days are long.") | Không dạy vì sao |
  | `day-length-in-winter` | Y1 #2 | 3, một ý ô Short days | Không dạy vì sao |
  | Không có | — | 4 (mùa mưa, mùa khô), 5 (tháng), 6 (tổng kết) | |

- Phạm vi, thứ tự, `stage`, key misconception, "Bảng soạn": `docs/backlog/SK-050-explorer-weather-and-seasons.md`. Ô Học, Chơi, Khởi động, ranh giới, ảnh: `docs/explorer-weather-seasons-proposal.md` mục 3 đến 7 (chỗ lệch ghi ở mục "Lệch so với đề xuất PM").
- Luật Explorer: `content/rules.json` (`explorer.authoring`), `content/TEMPLATE.md` (bảy luật Explorer, mục SK-044, mục SK-047). Khuôn chủ đề: `content/explorer/noi-song-tren-trai-dat/_topic.md` (SK-048); rút kinh nghiệm rà chữ ở mục "Lỗi hay gặp" của file đó (người viết đọc mười bốn mục ấy trước khi viết).

### Frontmatter

- **`order: 5`, `strand: earth_sky`, `level: 2`** theo `content/syllabus.json` (đã đổi; Duy chốt vị trí #5, 17/11).
- **`difficulty` 2-1-2-2-2 = chín điểm** theo proposal mục 1.2, không chấm lại: A = 2 (thời tiết thấy hằng ngày, nhưng mùa và tháng là thay đổi kéo dài, quay vòng); B = 1 (chỉ cần trải nghiệm đời sống; Khởi động ôn #1, #2, #4 nhưng bài không dựa vào chúng); C = 2 (sửa được bằng ảnh và trải nghiệm; không dạy vì sao có mùa nên không lên 3); D = 2 (hai, ba từ `core` mỗi bài; tên tháng chỉ nghe, không vào từ vựng); E = 2 (quan sát thay đổi theo thời gian, so sánh hai miền, xếp thứ tự).
- **`prerequisites: []`** theo SK-050. Lệch "Mức không giảm" (Mức 2 sau ba chủ đề Mức 3) và lệch luật "chủ đề mới đứng đầu": PM đã ghi, cùng chỗ lệch Duy chấp nhận 14/11, 16/11.
- **`is_free: false`**, **`sensitive: false`** (không nội dung dậy thì; thiên tai để ngoài, xem An toàn).

### Tổng quan sáu bài

| Bài · file | `stage` | Ý chính (EN · VI) | Key q6 · format · đáp án | Từ `core` · `extra` | Thẻ thưởng |
| --- | --- | --- | --- | --- | --- |
| 1 · `01-thoi-tiet-hom-nay.md` | `opener` | The weather can be sunny, cloudy or rainy. · Trời có thể nắng, nhiều mây hoặc mưa. / Some days are hot. Some days are cold. · Có ngày trời nóng, có ngày trời lạnh. / We dress for the weather. · Mình mặc quần áo hợp với thời tiết. | `sun_gone_when_cloudy` · TF · Sai | weather, sunny, rainy · cloudy, raincoat | `rainbow_card` Cầu vồng |
| 2 · `02-mua-xuan-va-mua-he.md` | `core` | In the north, a year has four seasons. · Ở miền Bắc, một năm có bốn mùa. / Spring gets warmer. Peach trees bloom at Tet. · Mùa xuân trời ấm dần. Hoa đào nở dịp Tết. / Summer is hot. Summer days are long. · Mùa hè trời nóng. Ngày mùa hè dài. | `flowers_only_in_spring` · TF · Sai | season, spring, summer · flower, cicada | `flame_tree_card` Cây phượng |
| 3 · `03-mua-thu-va-mua-dong.md` | `core` | Autumn is cool. Some leaves turn yellow. · Mùa thu trời mát. Có cây lá chuyển vàng. / Winter is cold. We wear warm clothes. · Mùa đông trời lạnh. Mình mặc áo ấm. / Winter days are short. It gets dark early. · Mùa đông ngày ngắn. Trời tối sớm. | `winter_means_snow` · TF · Sai | autumn, winter · cool, coat, scarf | `blackboard_tree_card` Cây hoa sữa |
| 4 · `04-mua-mua-va-mua-kho.md` | `core` | In the south, a year has two seasons. · Ở miền Nam, một năm có hai mùa. / The rainy season often has afternoon rain. · Mùa mưa hay có mưa vào buổi chiều. / The dry season is sunny, with little rain. · Mùa khô nắng nhiều, ít mưa. | `four_seasons_everywhere` · TF · Sai | rainy season, dry season · puddle, dark cloud | `mango_card` Quả xoài |
| 5 · `05-muoi-hai-thang.md` | `apply` | A year has twelve months. · Một năm có mười hai tháng. / After December, January comes again. · Hết tháng Mười Hai lại đến tháng Một. / Every year has Tet and a summer holiday. · Năm nào cũng có Tết, có nghỉ hè. | `months_stop_after_december` · TF · Sai | month, year · holiday, festival | `banh_chung_card` Bánh chưng |
| 6 · `06-mua-lai-ve.md` | `review` | The weather changes with the seasons. · Thời tiết thay đổi theo mùa. / The seasons come back every year. · Năm nào các mùa cũng quay lại. / We dress to suit each season. · Mỗi mùa mình mặc cho hợp. | `same_weather_all_year` · TF · Sai | change, warm · clothes, T-shirt | `star_lantern_card` Đèn ông sao |

- Tên bài EN/VI khớp `content/syllabus.json` từng chữ: Weather today · Thời tiết hôm nay (`thoi-tiet-hom-nay`); Spring and summer · Mùa xuân và mùa hè (`mua-xuan-va-mua-he`); Autumn and winter · Mùa thu và mùa đông (`mua-thu-va-mua-dong`); Rainy and dry seasons · Mùa mưa và mùa khô (`mua-mua-va-mua-kho`); Twelve months · Mười hai tháng (`muoi-hai-thang`); Seasons come back · Mùa lại về (`mua-lai-ve`).
- Sáu câu q6 là `true_false` đáp án Sai, câu khẳng định, để bước Tổng kết (SK-047) có thẻ "Ý sai → Ý đúng". `explanation_correct` của sáu câu này là đúng câu `correction` ở mục Misconceptions, đứng một mình (không "Yes!", không "This is false.").
- Không có câu lời Na (Explorer, chốt 12/11). `est_minutes: 6` cả sáu bài.
- **Miền:** bài 2, 3 chỉ nói miền Bắc ("in the north" · "ở miền Bắc", "Hanoi" · "Hà Nội"); bài 4 chỉ nói miền Nam ("in the south" · "ở miền Nam", "Ho Chi Minh City" · "Thành phố Hồ Chí Minh"); bài 5 nhắc cả hai đúng một chỗ (hoa đào miền Bắc, hoa mai miền Nam, ví dụ ô Tet); bài 6 đặt hai miền cạnh nhau. Không chữ bé nghe nào có "cả nước", "Việt Nam có bốn mùa", "Việt Nam có hai mùa", "Vietnam has four seasons".

**Bài 1 · Thời tiết hôm nay · Weather today (`opener`)**
- Mục tiêu: "I can say what the weather is like." · "Em nói được hôm nay trời thế nào."
- Học (bốn ô, từ nhìn thấy tới ý mới):
  - `explore_sunny` Sunny · Trời nắng: "Sunny days are bright and often hot." · "Ngày nắng trời sáng và thường nóng." Ví dụ bắt buộc: "never look straight at the Sun" · "đừng bao giờ nhìn thẳng vào Mặt Trời". Hai ví dụ còn lại gợi ý: "wear a hat" · "đội nón"; "drink lots of water" · "uống nhiều nước". Hình chép mục Discoverer `be-mat-trai-dat/nui-lua` `q3_sun`.
  - `explore_cloudy` Cloudy · Trời nhiều mây: "Clouds can hide the Sun for a while." · "Mây có thể che Mặt Trời một lúc." Ví dụ bắt buộc: "the Sun is still there" · "Mặt Trời vẫn ở đó". Gợi ý: "sunbeams shine through the clouds" · "tia nắng lọt qua mây"; "the sky looks grey" · "bầu trời trông xám". Ảnh mới: nắng hắt sau đám mây.
  - `explore_rainy` Rainy · Trời mưa: "Rain falls and everything gets wet." · "Mưa rơi xuống, mọi thứ đều ướt." (sửa 18/11 cho khớp ảnh mưa trên căn nhà gỗ, không có áo mưa). Gợi ý: "we wear a raincoat" · "mình mặc áo mưa" (dạy trước q1); "rubber boots for puddles" · "đi ủng lội vũng nước"; "frogs croak after rain" · "ếch kêu sau mưa" (dòng `[CẦN KIỂM]`). Hình chép mục Discoverer `be-mat-trai-dat/nui-lua` `q1_rain`.
  - `explore_cold` Cold · Trời lạnh: "On cold days, we wear a warm coat." · "Trời lạnh, mình mặc áo khoác ấm." Gợi ý: "wrap a scarf" · "quàng khăn len"; "a cold wind blows" · "gió lạnh thổi"; "warm socks, too" · "đi cả tất ấm". Ảnh mới: áo khoác ấm treo trên móc.
- Đồ vật: nón lá, áo cộc tay, áo mưa, ủng cao su, áo khoác, khăn len (kệ Chơi); gối, quả bóng (bẫy). Không có gió thành ô Học (xem Lệch).

**Bài 2 · Mùa xuân và mùa hè · Spring and summer (`core`, miền Bắc)**
- Mục tiêu: "I can name signs of spring and summer." · "Em kể được dấu hiệu của mùa xuân và mùa hè."
- Học (bốn ô):
  - `explore_seasons` Four seasons · Bốn mùa: "The north has spring, summer, autumn and winter." · "Miền Bắc có mùa xuân, mùa hè, mùa thu, mùa đông." Gợi ý: "like Hanoi" · "như Hà Nội"; "each season looks different" · "mỗi mùa một vẻ"; "spring comes after winter" · "hết mùa đông là đến mùa xuân". Hình ghép bốn ô (xem Hình dùng chung).
  - `explore_spring` Spring · Mùa xuân: "Peach trees bloom in spring, at Tet." · "Hoa đào nở vào mùa xuân, dịp Tết." Gợi ý: "light drizzle falls" · "mưa phùn lất phất" (chỉ nói, không ảnh); "days get warmer" · "trời ấm dần"; "families wrap banh chung" · "nhà nhà gói bánh chưng". Ảnh mới: cành hoa đào.
  - `explore_buds` New leaves · Lộc non: "Many trees grow new leaves in spring." · "Nhiều cây ra lộc non vào mùa xuân." Gợi ý: "small, soft and light green" · "nhỏ, mềm, xanh non"; "the tree is growing" · "cây đang lớn"; "birds sing in the branches" · "chim hót trên cành". Nói "many", không "all" (cây thường xanh, cây rụng lá để dành *Cây quanh em*). Ảnh mới.
  - `explore_summer` Summer · Mùa hè: "Flame trees bloom red in summer." · "Hoa phượng nở đỏ vào mùa hè." Ví dụ bắt buộc: "it gets dark late" · "trời tối muộn" (ý độ dài ngày). Gợi ý: "cicadas sing loudly" · "ve kêu râm ran"; "short, heavy showers" · "có những cơn mưa rào". Ảnh mới: hoa phượng.
- Không tên tháng (bài 5), không âm lịch, không "Tết là năm mới âm lịch".

**Bài 3 · Mùa thu và mùa đông · Autumn and winter (`core`, miền Bắc)**
- Mục tiêu: "I can name signs of autumn and winter." · "Em kể được dấu hiệu của mùa thu và mùa đông."
- Học (bốn ô):
  - `explore_autumn` Autumn · Mùa thu: "Autumn days are cool, with blue skies." · "Mùa thu trời mát, bầu trời xanh trong." Gợi ý: "some leaves turn yellow" · "có cây lá chuyển vàng"; "star lanterns at Mid-Autumn" · "đèn ông sao dịp Trung thu"; "milk flowers smell strong" · "hoa sữa thơm nồng". Ảnh mới: tán cây dưới trời xanh trong, nhìn từ dưới lên (tránh lá đỏ kiểu ôn đới).
  - `explore_winter` Winter · Mùa đông: "Winter is cold. Mornings are often foggy." · "Mùa đông trời lạnh. Sáng sớm thường có sương mù." (sửa 18/11 cho khớp ảnh sương mù không người). Ví dụ bắt buộc: "Hanoi is cold, but has no snow" · "Hà Nội lạnh nhưng không có tuyết". Gợi ý: "we wear coats and scarves" · "mình mặc áo khoác, quàng khăn"; "a cold wind blows" · "gió lạnh thổi". Ảnh: phố Hà Nội mùa đông trong sương mù, không người, không tuyết.
  - `explore_red_leaves` Red leaves · Lá bàng đỏ: "Indian almond leaves turn red in winter." · "Lá bàng chuyển đỏ vào mùa đông." Gợi ý: "then they fall" · "rồi lá rụng"; "new leaves come in spring" · "sang xuân lá non lại mọc"; "a big tree in the schoolyard" · "cây bàng to ở sân trường". Hình dùng lại `almond_card` của #2 bài 3.
  - `explore_short_days` Short days · Ngày ngắn: "Winter days are short. It gets dark early." · "Mùa đông ngày ngắn. Trời tối sớm." Gợi ý: "street lights come on early" · "đèn đường bật sớm"; "dark before dinner" · "chưa tới bữa tối trời đã tối"; "summer days are long" · "mùa hè thì ngày dài". Ảnh mới: phố lên đèn lúc chiều tối.
- Trung thu chỉ là dấu hiệu, không nói ngày âm lịch. Không "gió mùa đông bắc" (nói "gió lạnh"). Không vì sao ngày ngắn.

**Bài 4 · Mùa mưa và mùa khô · Rainy and dry seasons (`core`, miền Nam)**
- Mục tiêu: "I can tell rainy and dry seasons apart." · "Em phân biệt được mùa mưa và mùa khô."
- Học (bốn ô):
  - `explore_rainy_season` Rainy season · Mùa mưa: "Heavy rain falls, then it stops." · "Mưa to trút xuống, rồi tạnh." Ví dụ bắt buộc: "in the south, like Ho Chi Minh City" · "ở miền Nam, như Thành phố Hồ Chí Minh". Gợi ý: "bring a raincoat" · "mang theo áo mưa"; "puddles on the road" · "vũng nước trên đường". Ảnh mới: mưa to trên phố.
  - `explore_dark_clouds` Dark clouds · Mây đen: "Dark clouds often come in the afternoon." · "Chiều chiều, mây đen kéo tới." Gợi ý: "the sky turns grey" · "trời tối sầm lại"; "the wind feels cool" · "gió mát thổi tới"; "rain is coming soon" · "sắp mưa rồi". Ảnh mới: mây đen trên sông, không sét (ảnh thật 18/11).
  - `explore_dry_season` Dry season · Mùa khô: "The dry season is sunny, with little rain." · "Mùa khô nắng nhiều, ít mưa." Gợi ý: "we water the plants" · "mình tưới cây"; "the roads are dry" · "đường khô ráo"; "wear a hat in the sun" · "đội nón khi ra nắng". Ảnh mới: con đường khô dưới nắng, không đất nứt.
  - `explore_fields` Rice fields · Ruộng lúa: "Rain makes the rice fields green." · "Mưa làm ruộng lúa xanh tốt." Gợi ý: "frogs and fish in the fields" · "ếch, cá trong ruộng"; "farmers plant rice" · "bà con cấy lúa"; "green as far as you see" · "xanh tới tận chân trời". Hình chép mục Discoverer `khung-long/trai-dat-rat-lau-ve-truoc` `q2_rice`.
- Không bão, lũ, hạn hán, "mùa mưa bão". Không gọi mùa khô là hạn hán; không ảnh đất nứt. Không miền Trung.

**Bài 5 · Mười hai tháng · Twelve months (`apply`)**
- Mục tiêu: "I know a year has twelve months." · "Em biết một năm có mười hai tháng."
- Học (bốn ô):
  - `explore_months` Twelve months · Mười hai tháng: "A year has twelve months." · "Một năm có mười hai tháng." Ba ví dụ bắt buộc (vè tên tháng, chỉ để nghe): "January, February, March, April" · "tháng Một, tháng Hai, tháng Ba, tháng Tư"; "May, June, July, August" · "tháng Năm, tháng Sáu, tháng Bảy, tháng Tám"; "September, October, November, December" · "tháng Chín, tháng Mười, tháng Mười Một, tháng Mười Hai". Hình tự vẽ: vòng mười hai hạt (PM đồng ý 17/11).
  - `explore_tet` Tet · Tết: "Tet comes near the start of the year." · "Tết đến vào khoảng đầu năm." Ví dụ bắt buộc: "peach blossoms in the north" · "miền Bắc có hoa đào"; "yellow apricot blossoms in the south" · "miền Nam có hoa mai vàng". Gợi ý: "families wrap banh chung or banh tet" · "nhà nhà gói bánh chưng, bánh tét" (thêm bánh tét 17/11, rà chữ g6; chỉ lời, không ảnh). Ảnh mới: hoa mai.
  - `explore_holiday` Summer holiday · Nghỉ hè: "School stops for the summer holiday." · "Nghỉ hè, em được nghỉ học." Gợi ý: "trips to the beach" · "đi chơi biển"; "flame trees are red" · "hoa phượng nở đỏ"; "hot, sunny days" · "những ngày nắng nóng". Hình dùng lại bãi biển vắng của #1 bài 8.
  - `explore_school` Back to school · Khai giảng: "After summer, a new school year starts." · "Hết hè, năm học mới bắt đầu." Ví dụ bắt buộc: "in September" · "vào tháng Chín". Gợi ý: "a new school bag" · "cặp sách mới"; "the school drum beats" · "trống trường vang lên". Ảnh mới: cặp sách.
- Tên tháng chỉ ở ví dụ ô Học, ý chính hai và câu q6 (câu nói, không hỏi tên tháng). Không câu Khởi động, Quiz nào hỏi tên tháng hay tháng thứ mấy. Không âm lịch, tháng sinh, lễ tôn giáo; không tờ lịch, chữ số trong hình; không bảng tháng theo mùa.

**Bài 6 · Mùa lại về · Seasons come back (`review`)**
- Mục tiêu: "I can tell how a year's weather changes." · "Em kể được thời tiết đổi ra sao trong một năm."
- Học (bốn ô):
  - `explore_north` North · Miền Bắc: "The north has four seasons." · "Miền Bắc có bốn mùa." Gợi ý: "warm spring, hot summer" · "xuân ấm, hè nóng"; "cool autumn, cold winter" · "thu mát, đông lạnh"; "like Hanoi" · "như Hà Nội". Hình dùng lại `explore_seasons` bài 2.
  - `explore_south` South · Miền Nam: "The south has rainy and dry seasons." · "Miền Nam có mùa mưa và mùa khô." Gợi ý: "warm all year" · "ấm quanh năm"; "rain in the afternoon" · "mưa vào buổi chiều"; "like Ho Chi Minh City" · "như Thành phố Hồ Chí Minh". Hình ghép hai ô (mới, từ hai ảnh bài 4).
  - `explore_clothes` Clothes · Quần áo theo mùa: "Thin clothes for hot days, coats for cold." · "Ngày nóng mặc đồ mỏng, ngày lạnh mặc áo khoác." Gợi ý: "a raincoat for rainy days" · "áo mưa cho ngày mưa"; "a scarf for winter" · "khăn len cho mùa đông"; "a hat for the sun" · "nón cho ngày nắng". Hình ghép ba bộ áo (mới).
  - `explore_again` Again and again · Lại về: "Peach trees bloom again every spring." · "Mùa xuân nào hoa đào cũng lại nở." Gợi ý: "flame trees every summer" · "hè nào phượng cũng nở"; "after winter, spring again" · "hết đông lại đến xuân"; "rain every rainy season" · "mùa mưa nào cũng có mưa chiều". Hình dùng lại `explore_spring` bài 2.
- Không vì sao có mùa; không "mùa đông ngày càng ấm" (biến đổi khí hậu, Scientist #16).

### Khuôn chung mỗi bài

- **Khởi động:** hai hoặc ba câu, DOK 1, chỉ `single_choice` hai lựa chọn và `true_false`. Mỗi câu `recall_from.kind: lesson` và `recall_from.lesson` đúng như mục Khởi động. Mọi câu có hình ở câu hỏi; mọi lựa chọn có hình.
- **Học:** một `explore_groups` bốn ô (`prompt` "Tap each picture" · "Chạm từng hình", `complete_when: all_seen`), mỗi ô một câu chính và ba ví dụ; một `word_list` (`title` "New words" · "Từ mới") gồm đúng các từ `core`. Không `sentence_card`. Câu chính ô Học gọi tên vật, không mở đầu bằng "It".
- **Chơi:** một `build_tray`, `capacity: 3`, ba nhóm `required`, một nhóm `limit` màu `do_son` (nhóm `required` chọn trong `vang_hoe`, `gi_dong`, `cham`, `nau_dat`), kệ bảy hoặc tám món, mỗi món một ảnh. `messages.full`: "No more room! Tap one to take it off." · "Hết chỗ rồi! Em chạm vào để bỏ ra nhé.". Key món khác key nhóm.
- **Quiz:** sáu câu, DOK 1·1·1·2·2·2, đúng theo mục Khung Quiz. Bài 1, 2, 4 hai format (`single_choice`, `true_false`); bài 3, 5, 6 ba format (thêm `order_sequence` ở q4). Bài 4 q4 đổi từ `order_sequence` sang `single_choice` 18/11 (phiên chính): không có ba ảnh mây đen, mưa, vũng nước cùng một cảnh hợp luật.
- **Hình câu `single_choice` và `order_sequence`:** hàng rào tre trung tính `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha` `w1` (`alt` "A bamboo fence in a garden" · "Hàng rào tre trước khu vườn"; từ khoá "village garden bamboo fence grass"), vì app Explorer ẩn hình câu hỏi khi mọi lựa chọn có hình (SK-043). `prompt` phải tự đủ nghĩa khi chỉ nghe.
- **Lựa chọn là một mùa hay một dịp** (bài 2 q5, bài 3 q5, bài 5 q5, bài 6 q5, bài 6 w1): mỗi lựa chọn là ảnh một dấu hiệu cụ thể (lộc non, hoa phượng, bánh chưng…), `label` gọi tên mùa hay dịp ("spring" · "mùa xuân"). Dấu hiệu trên ảnh không trùng chữ trong `prompt` của câu đó.
- **Từ vựng:** bốn hoặc năm từ, hai đến ba `core` (vào `word_list`), còn lại `extra`.
- **Thưởng:** một thẻ, `set: weather` (khoá `collectible.set.weather` đã có, dùng chung Discoverer #5).
- **Frontmatter bài:** `est_minutes: 6`, `sensitive: false`, `archived: false`, `ai_draft: true`.

### Tên gọi thống nhất cả chủ đề

| Khái niệm | EN | VI | Ghi chú |
| --- | --- | --- | --- |
| thời tiết | weather | thời tiết | Như Discoverer #5 |
| nắng · nhiều mây · mưa | sunny · cloudy · rainy | trời nắng · trời nhiều mây · trời mưa | Nhãn ô Học và nhóm Chơi dùng đúng chữ này |
| nóng · lạnh · mát · ấm | hot · cold · cool · warm | nóng · lạnh · mát · ấm | Không số độ, không nhiệt kế |
| Mặt Trời | the Sun | Mặt Trời | Viết hoa cả hai thứ tiếng. Không câu nào bảo bé nhìn Mặt Trời |
| mùa | season | mùa | |
| bốn mùa | spring, summer, autumn, winter | mùa xuân, mùa hè, mùa thu, mùa đông | Chính tả Anh: autumn, không "fall". Chữ bé nghe không dùng "mùa hạ" |
| mùa mưa · mùa khô | rainy season · dry season | mùa mưa · mùa khô | Như #4 bài 6 |
| miền Bắc · miền Nam | the north · the south | miền Bắc · miền Nam | Kèm "like Hanoi" · "như Hà Nội", "like Ho Chi Minh City" · "như Thành phố Hồ Chí Minh". Không bản đồ |
| tháng · năm | month · year | tháng · năm | Tên tháng VI viết bằng chữ, viết hoa chữ sau "tháng": tháng Một … tháng Mười Hai. Không "tháng Giêng", "tháng Chạp" |
| Tết | Tet | Tết | Chuỗi `.en` không dấu. Không "Lunar New Year" |
| Trung thu | Mid-Autumn | Trung thu | Chỉ là dấu hiệu mùa thu, không nói ngày âm lịch |
| nghỉ hè · khai giảng | summer holiday · back to school | nghỉ hè · khai giảng | "a new school year starts" · "năm học mới bắt đầu" |
| hoa đào · hoa mai | peach blossom; peach tree · yellow apricot blossom | hoa đào · hoa mai | Không đặt hoa đào cạnh hoa mai trong cùng một câu |
| hoa phượng | flame tree | hoa phượng; cây phượng (thẻ) | Không dùng "royal poinciana" trong chữ bé nghe |
| hoa sữa | blackboard tree (thẻ) | hoa sữa; cây hoa sữa | Chỉ ở ví dụ bài 3 và thẻ |
| lá bàng | Indian almond leaves; Indian almond tree | lá bàng; cây bàng | Như #2 bài 3 |
| lộc non | new leaves | lộc non | |
| con ve | cicada | con ve | |
| bánh chưng | banh chung | bánh chưng | Chuỗi `.en` không dấu |
| đèn ông sao | star lantern | đèn ông sao | |
| áo mưa · ủng cao su · nón lá | raincoat · rubber boots · conical hat; hat (lời) | áo mưa · ủng cao su · nón lá | Nón lá ở chủ đề này là đồ che nắng (nhóm Sunny). Không dùng "cái ô" làm món, lựa chọn (ô che cả nắng lẫn mưa) |
| áo khoác · khăn len · mũ len · chăn bông | coat; warm coat · scarf · wool hat · quilt | áo khoác · khăn len · mũ len · chăn bông | |
| áo cộc tay · áo tay dài | T-shirt · long-sleeved shirt | áo cộc tay · áo tay dài | Không "áo dài tay" (nghe lẫn với áo dài) |
| vũng nước · mây đen | puddle · dark cloud | vũng nước · mây đen | |
| ngày dài · ngày ngắn | long days · short days | ngày dài · ngày ngắn | "It gets dark early/late" · "trời tối sớm/muộn" |

- **Đọc bằng máy:** nghe thử EN "Tet", "banh chung", "Hanoi", "Ho Chi Minh City", "cicada", "Mid-Autumn", "Indian almond", "yellow apricot". Nghe thử VI "tháng Tư", "tháng Mười Một", "tháng Mười Hai", "áo cộc tay", "ủng cao su".
- **Chuỗi `.en` không có dấu tiếng Việt.** VI không ký hiệu, không chữ số.
> [CẦN KIỂM] Tên EN: "flame tree" (hay "royal poinciana") cho phượng; "yellow apricot blossom" cho hoa mai (*Ochna integerrima*, tên EN khác: "Vietnamese mickey mouse plant", "yellow ochna"); "blackboard tree" cho hoa sữa (*Alstonia scholaris*). Viết hoa tên tháng VI ("tháng Một" hay "tháng một").

### Từ vựng từng bài

| Bài | `core` (vào `word_list`) | `extra` | Hình từ |
| --- | --- | --- | --- |
| 1 | `weather` weather · thời tiết; `sunny` sunny · trời nắng; `rainy` rainy · trời mưa | `cloudy` cloudy · trời nhiều mây; `raincoat` raincoat · áo mưa | weather `explore_cloudy`; sunny `explore_sunny`; rainy `explore_rainy`; cloudy `q3_cloudy`; raincoat `tray_raincoat` |
| 2 | `season` season · mùa; `spring` spring · mùa xuân; `summer` summer · mùa hè | `flower` flower · bông hoa; `cicada` cicada · con ve | season `explore_seasons`; spring `explore_spring`; summer `explore_summer`; flower `w1_lotus` (#1); cicada `tray_cicada` |
| 3 | `autumn` autumn · mùa thu; `winter` winter · mùa đông | `cool` cool · mát; `coat` coat · áo khoác; `scarf` scarf · khăn quàng | autumn, cool `explore_autumn`; winter `explore_winter`; coat `explore_cold` (bài 1); scarf `tray_scarf` (bài 1) |
| 4 | `rainy_season` rainy season · mùa mưa; `dry_season` dry season · mùa khô | `puddle` puddle · vũng nước; `dark_cloud` dark cloud · mây đen | `explore_rainy_season`; `explore_dry_season`; `q4_puddle`; `explore_dark_clouds` |
| 5 | `month` month · tháng; `year` year · năm | `holiday` holiday · kỳ nghỉ; `festival` festival · ngày hội | month `explore_months`; year `explore_seasons` (bài 2); holiday `explore_holiday`; festival `explore_tet` |
| 6 | `change` change · thay đổi; `warm` warm · ấm | `clothes` clothes · quần áo; `t_shirt` T-shirt · áo cộc tay | change `explore_south`; warm `explore_spring` (bài 2); clothes `explore_clothes`; t_shirt `tray_tshirt` (bài 1) |

- **`dry_season` trùng có chủ ý** với `extra` của *Những nơi sống trên Trái Đất* bài 6, nâng lên `core` ở bài 4. Người viết bài 4 thêm dòng `>` ngay dưới từ này ghi điều đó.
- Không từ nào khác trùng giữa sáu bài hay với từ vựng Explorer đã có (đã grep `term.en` cả `content/explorer/` 17/11: chỉ trùng `dry season`). `weather` trùng từ Discoverer #5 (nhóm tuổi khác, không sao).
- Tên mười hai tháng không vào `word_list`. Không có `calendar` (xem Lệch). Không có `climate`, `thermometer`, `storm`.

### Quy ước hình cả chủ đề (TEMPLATE mục A "Hình", SK-033, SK-043, proposal mục 7)

1. **Ảnh chụp thật** cho mọi hình (CC0, PD, PDM, CC BY có ghi công; không BY-SA, NC, ND). Không AI, không hoạt hình, không Pinterest. Ngoại lệ:
   - hình tự vẽ `[hình vẽ]` chỉ có hai: `explore_months` bài 5 (PM đồng ý 17/11): mười hai hạt tròn cùng màu nối thành vòng, không chữ số, không chữ; và thẻ thưởng `star_lantern_card` bài 6 (phiên chính duyệt 18/11): đèn ông sao năm cánh giấy cắt, vì ảnh thật hợp lệ duy nhất có nhiều trẻ rõ mặt, crop còn 256 px, mờ. Thẻ không đứng cạnh ảnh chụp trong một câu nên không lộ đáp án;
   - ba hình `[sơ đồ ghép ảnh]` từ ảnh đã có: `explore_seasons` (bài 2), `explore_south`, `explore_clothes` (bài 6), không có hình ghép nào khác.
   Chỗ khác cần tự vẽ thì hỏi PM trước. **Không dùng hình tự vẽ của Discoverer #5 hay *Hô hấp*** (áo mưa, khăn len, vũng nước, quạt, diều… ở `nang-mua-gio-may`, `giu-phoi-khoe` là hình vẽ): Explorer chủ đề này toàn ảnh, một hình vẽ giữa các ảnh sẽ lộ đáp án.
2. **Đồ vật không có người mặc:** áo, khăn, nón, ủng treo trên móc, đặt trên bàn hay trên nền trơn; không nhãn hiệu, không chữ in trên áo, không bao bì.
3. **Người trong cảnh** (phố mùa đông, phố mưa, khai giảng): ở xa, không nhận ra mặt; không trẻ em nhìn rõ mặt; không biển hiệu, biển số xe đọc được.
4. **Không chữ, không chữ số** trong mọi hình: không tờ lịch, đồng hồ, nhiệt kế, bao bì bánh chưng, biển phố.
5. **Không thiên tai:** không sét, không bão, không nước ngập đường, không cây đổ; mây đen bài 4 chỉ là mây kéo tới. Không ảnh đất nứt làm mùa khô; không ảnh tuyết làm mùa đông Việt Nam.
6. **Mặt Trời trong ảnh:** chỉ ảnh bầu trời có Mặt Trời (`explore_sunny`) hay nắng sau mây (`explore_cloudy`); không ảnh người nhìn lên Mặt Trời, không kính râm.
7. **Ảnh mang tên nơi** (Hà Nội, Sa Pa, Thành phố Hồ Chí Minh) phải có địa điểm khớp ở trang gốc; không khớp thì `brief` và `alt` bỏ tên nơi, chữ bé nghe vẫn giữ "như Hà Nội" (ví dụ, không gắn với ảnh).
8. **Không lộ đáp án:**
   - hình câu `single_choice`, `order_sequence` là hàng rào tre (app ẩn);
   - hình câu `true_false` là đúng vật được nói tới (bài 3 q6 là phố mùa đông không tuyết; bài 4 q6 là hình ghép bốn mùa);
   - `alt` của lựa chọn đúng không chứa chữ của câu hỏi (ví dụ `explore_spring` không có "Tet", `explore_summer` không có "summer", `explore_buds` không có "new");
   - đáp án đúng không là ảnh mới duy nhất giữa các ảnh quen, và ngược lại.
9. **Hai cảnh trong một câu khác nhau rõ bằng mắt** (luật Explorer số 7): không đặt hoa đào cạnh hoa mai; không đặt lộc non cạnh lá xanh của #2; mùa khô (đường nắng) không đặt cạnh ảnh hạn hán.
10. **`order_sequence`:** ba thẻ cùng kiểu ảnh, khung vuông; thẻ trong file không nằm sẵn đúng thứ tự.
11. **Bối cảnh Việt Nam** khi có ảnh hợp lệ: phố Hà Nội mùa đông, phố mưa miền Nam, ruộng lúa, hoa đào, hoa mai, bánh chưng, đèn ông sao, nón lá.
12. **Từ khoá tìm ảnh:** truy vấn hai, ba từ hoặc tên khoa học; nhiều truy vấn cách nhau bằng `;`.

### Hình dùng chung

Key ảnh gốc là **bắt buộc**: người viết bài phụ trách đặt đúng key ở cột một và đúng `alt`, truy vấn đầu ở bảng thứ hai; người viết bài khác trỏ tới bằng `Dùng lại hình `<key>` ở bài `thoi-tiet-va-cac-mua/<slug bài>`.` rồi chép từ khoá và `alt`. Tên chỗ dùng (q1_coat, tray_hat…) là gợi ý; người viết đặt key con theo luật key.

Hình gốc trong chủ đề này:

| Key gốc · bài | Nội dung | Dùng ở |
| --- | --- | --- |
| `explore_cloudy` · 1 | nắng hắt sau đám mây: thấy rõ tia nắng toả từ sau mây, đĩa Mặt Trời bị mây che kín, không chói, trời xanh, không thấy mặt đất | 1 (`explore_cloudy`, q6, từ `weather`) |
| `explore_cold` · 1 | một chiếc áo phao đỏ treo trên móc, nền trơn tối | 1 (`explore_cold`, tray_coat, q1_coat); 2 (tray_coat, q4_coat, q5_winter, ghép `explore_seasons`); 3 (tray_coat, q5_winter, từ `coat`); 4 (tray_coat); 5 (q1_coat); 6 (tray_coat, q1_coat, q4_coat, ghép `explore_clothes`) |
| `tray_scarf` · 1 | một chiếc khăn len gấp hoặc treo, nền trơn | 1 (tray_scarf, q5); 2 (tray_scarf, q4_scarf); 3 (tray_scarf, từ `scarf`); 4 (w1_scarf, tray_scarf, q1_scarf); 6 (tray_scarf, q1_scarf) |
| `tray_raincoat` · 1 | một chiếc áo mưa vàng có mũ trùm và hai tay áo, trải trên cỏ, phía sau có vài áo mưa khác, không người (ảnh đổi 18/11) | 1 (tray_raincoat, q1_raincoat, từ `raincoat`); 4 (tray_raincoat, q1_raincoat); 5 (w1_raincoat); 6 (tray_raincoat) |
| `tray_tshirt` · 1 | một chiếc áo cộc tay trơn màu, không chữ, không hình in | 1 (tray_tshirt, q1_tshirt); 3 (tray_tshirt); 6 (tray_tshirt, q1_tshirt, q4_tshirt, từ `t_shirt`, ghép `explore_clothes`) |
| `tray_boots` · 1 | một đôi ủng cao su đỏ trên thảm, chụp từ trên chếch xuống | 1 (tray_boots); 4 (tray_boots); 6 (tray_boots) |
| `tray_pillow` · 1 | một chiếc gối trơn màu, không hình in, nền trơn | 1 (tray_pillow); 6 (tray_pillow) |
| `tray_ball` · 1 | những quả bóng nảy cao su nhiều màu chụp gần, không chữ (ảnh mới 18/11, thay `q1_ball` của #2) | 1 (tray_ball); 6 (tray_ball) |
| `explore_spring` · 2 | cành hoa đào hồng nở, chụp gần, nền trời hoặc tường mờ; không cành mai | 2 (`explore_spring`, tray_peach, q1_peach, từ `spring`, ghép `explore_seasons`); 3 (w1_peach, q4_peach); 5 (w2); 6 (`explore_again`, q2, q3_peach, từ `warm`) |
| `explore_buds` · 2 | lộc non xanh nhạt trên cành, chụp gần | 2 (`explore_buds`, q3_buds, q5_spring); 3 (q5_spring); 6 (q5_spring) |
| `explore_summer` · 2 | hoa phượng đỏ trên cây, thấy tán, trời trắng mây (ảnh chụp ở nước ngoài, `alt` không tên nơi) | 2 (`explore_summer`, tray_flame, q1_flame, q5_summer, q6, từ `summer`, thẻ, ghép `explore_seasons`); 3 (w1_flame, q1_flame, q4_flame, q5_summer); 5 (q3_flame); 6 (w2, q3_flame) |
| `tray_cicada` · 2 | con ve sầu bám trên thân cây | 2 (tray_cicada, q2, từ `cicada`); 3 (q1_cicada) |
| `tray_banh_chung` · 2 | hai chiếc bánh chưng vuông gói lá dong chồng nhau, buộc lạt, không bao bì | 2 (tray_banh_chung); 5 (tray_banh_chung, q1_banh_chung, q4_tet, q5_tet, thẻ); 6 (w1_tet) |
| `explore_seasons` · 2 | `[sơ đồ ghép ảnh]` lưới hai nhân hai, đọc trái → phải, trên → dưới: xuân, hè, thu, đông (`explore_spring`, `explore_summer`, `q4_yellow` bài 3, `explore_cold` bài 1) | 2 (`explore_seasons`, từ `season`); 4 (q6); 5 (từ `year`); 6 (`explore_north`, q6) |
| `explore_autumn` · 3 | tán cây dưới trời xanh trong, nhìn từ dưới lên; không lá đỏ kiểu ôn đới, không tuyết | 3 (`explore_autumn`, từ `autumn`, từ `cool`); 6 (q5_autumn) |
| `explore_winter` · 3 | một khoảng đường ở Hà Nội trong sương mù dày buổi sáng mùa đông, mặt đường ướt, không người, không tuyết (ảnh đổi 18/11) | 3 (`explore_winter`, q6, từ `winter`); 6 (q5_winter) |
| `explore_short_days` · 3 | dãy phố ven kênh lên đèn lúc chiều tối, trời xanh sẫm, không người gần | 3 (`explore_short_days`, q3) |
| `tray_quilt` · 3 | chăn bông trắng dày trải phẳng trên giường | 3 (tray_quilt); 4 (tray_quilt) |
| `q4_yellow` · 3 | lá vàng tươi còn trên cành nhỏ, chụp gần, nền trời xanh, không tuyết (ảnh mới 18/11; gốc ở câu q4 bài 3) | 2 (q3_yellow, ghép `explore_seasons`); 3 (w2, q2, q4_yellow); 6 (q3_yellow) |
| `explore_rainy_season` · 4 | mưa to trên phố, thấy rõ vệt mưa, không thấy người | 4 (`explore_rainy_season`, q3_rain, từ `rainy_season`, ghép `explore_south`) |
| `explore_dark_clouds` · 4 | mây đen kéo tới trên dòng sông và một cây lớn, chưa mưa, không sét | 4 (`explore_dark_clouds`, q4_clouds, từ `dark_cloud`) |
| `explore_dry_season` · 4 | con đường đất đỏ khô dưới hàng cây, nắng xuyên tán, không đất nứt | 4 (`explore_dry_season`, q2, q3_dry, từ `dry_season`, ghép `explore_south`) |
| `tray_watering_can` · 4 | bình tưới cây bằng nhựa hoặc tôn, nền trơn | 4 (tray_watering_can, q1_can, q5); 5 (w1_can) |
| `explore_months` · 5 | `[hình vẽ]` mười hai hạt tròn cùng màu nối thành vòng, không chữ số | 5 (`explore_months`, q2, q6, từ `month`) |
| `explore_tet` · 5 | cành hoa mai vàng nở | 5 (`explore_tet`, tray_mai, q3_mai, từ `festival`) |
| `explore_school` · 5 | cặp đeo lưng màu đen treo bên bàn trong lớp học, không nhãn hiệu, không chữ | 5 (`explore_school`, tray_bag, q4_school, q5_school) |
| `tray_bucket` · 5 | xô và xẻng nhựa xúc cát trên bãi cát | 5 (tray_bucket, q1_bucket) |
| `explore_south` · 6 | `[sơ đồ ghép ảnh]` hai ô cạnh nhau: `explore_rainy_season`, `explore_dry_season` bài 4 | 6 (`explore_south`, từ `change`) |
| `explore_clothes` · 6 | `[sơ đồ ghép ảnh]` ba ô: hai ô trên `explore_cold` bài 1, `q4_long_sleeve` bài 6; một ô dưới ở giữa `tray_tshirt` bài 1 (bản 2:1 của từ `clothes`: một hàng ba ô) | 6 (`explore_clothes`, từ `clothes`) |
| `q4_long_sleeve` · 6 | một chiếc áo tay dài trơn màu dưới ánh đèn xanh, thấy thân áo và hai tay áo dài, không thấy móc, không chữ | 6 (q4_long_sleeve, ghép `explore_clothes`) |

> Bài 5 q5 nói "Flame trees bloom." ở `prompt`, nên ảnh hoa phượng không làm lựa chọn của câu đó (chỉ là lựa chọn sai ở q3).

**`alt` và truy vấn đầu của hình gốc** (bắt buộc; người viết bài phụ trách đặt đúng, người viết bài dùng lại chép đúng):

| Key gốc · bài | Từ khoá tìm ảnh (EN), truy vấn đầu | `alt.en` · `alt.vi` |
| --- | --- | --- |
| `explore_cloudy` · 1 | sun behind clouds | Sunbeams through the clouds · Tia nắng xuyên qua mây |
| `explore_cold` · 1 | winter coat hanger | A warm coat on a hanger · Chiếc áo khoác ấm trên móc |
| `tray_scarf` · 1 | knitted wool scarf | A knitted scarf · Chiếc khăn len |
| `tray_raincoat` · 1 | yellow raincoat with hood | A yellow raincoat with a hood · Chiếc áo mưa vàng có mũ |
| `tray_tshirt` · 1 | plain t-shirt | A short-sleeved T-shirt · Chiếc áo cộc tay |
| `tray_boots` · 1 | rubber boots pair | A pair of rubber boots · Đôi ủng cao su |
| `tray_pillow` · 1 | plain white pillow | A soft pillow · Chiếc gối mềm |
| `tray_ball` · 1 | colourful rubber bouncy balls | Colourful rubber balls · Những quả bóng cao su nhiều màu |
| `explore_spring` · 2 | Prunus persica blossom | Pink blossoms on a branch · Cành hoa màu hồng |
| `explore_buds` · 2 | leaf buds spring | Tiny light-green leaves on a twig · Những chiếc lá nhỏ màu xanh nhạt trên cành |
| `explore_summer` · 2 | Delonix regia | Red flowers on a big tree · Hoa đỏ trên cây to |
| `tray_cicada` · 2 | cicada tree bark | A cicada on tree bark · Con ve trên thân cây |
| `tray_banh_chung` · 2 | banh chung | Two square cakes wrapped in leaves · Hai chiếc bánh vuông gói lá |
| `explore_seasons` · 2 | (ghép, không tìm) | Four pictures from one year · Bốn hình trong một năm |
| `explore_autumn` · 3 | blue sky trees | Trees under a clear blue sky · Hàng cây dưới bầu trời xanh trong |
| `explore_winter` · 3 | fog in Hanoi | A foggy winter street · Phố mùa đông trong sương mù |
| `explore_short_days` · 3 | street lights dusk | Street lights on in the evening · Đèn đường sáng lúc chiều tối |
| `tray_quilt` · 3 | quilt blanket bed | A thick quilt on a bed · Chăn bông dày trên giường |
| `q4_yellow` · 3 | autumn leaf on branch | A yellow leaf on a branch · Chiếc lá vàng trên cành |
| `explore_rainy_season` · 4 | heavy rain street | Heavy rain on a street · Mưa to trên phố |
| `explore_dark_clouds` · 4 | dark rain clouds | Dark clouds over the river · Mây đen trên dòng sông |
| `explore_dry_season` · 4 | sunny dry road | A dry road in the sunshine · Con đường khô dưới nắng |
| `tray_watering_can` · 4 | watering can | A watering can · Bình tưới cây |
| `explore_months` · 5 | (hình vẽ) | Twelve beads in a ring · Mười hai hạt tròn xếp thành vòng |
| `explore_tet` · 5 | Ochna integerrima | Yellow blossoms on a branch · Cành hoa vàng |
| `explore_school` · 5 | school backpack | A school bag · Chiếc cặp sách |
| `tray_bucket` · 5 | sand bucket spade | A bucket and spade · Xô và xẻng xúc cát |
| `explore_south` · 6 | (ghép, không tìm) | Heavy rain and a sunny road · Mưa to và con đường nắng |
| `explore_clothes` · 6 | (ghép, không tìm) | A coat, a shirt and a T-shirt · Áo khoác, áo tay dài và áo cộc tay |
| `q4_long_sleeve` · 6 | long sleeve shirt | A long-sleeved shirt · Chiếc áo tay dài |

- `alt` cố ý không chứa chữ của câu hỏi mà hình làm đáp án: `explore_spring` không có "Tet", "spring"; `explore_summer` không có "summer"; `explore_buds` không có "new"; `explore_dry_season` không có "dry season"; `explore_tet` không có "Tet".
- Ảnh khác `alt` (ví dụ phố mùa đông không ở Hà Nội): designer báo phiên chính, phiên chính sửa bảng này và mọi chỗ dùng một lần. `alt` không ghi tên nơi.
- **18/11 (sau chạy thử):** `explore_winter` đổi sang ảnh sương mù Hà Nội không người (ảnh phố Hà Nội 2008 có biển số, biển hiệu, mặt người gần; không tìm được ảnh hợp luật có người mặc áo ấm ở xa). Bỏ hình gốc `q5_winter` (sương sớm, cùng ảnh gốc): bài 3 q5 thẻ mùa đông dùng lại `explore_cold`. `tray_raincoat`, `tray_ball`, `q4_yellow` đổi ảnh; `alt` theo bảng trên.

**`alt` riêng ở một chỗ dùng** của hình gốc trong chủ đề này (ảnh, key, `brief` giữ nguyên; các chỗ khác dùng `alt` gốc ở bảng trên; thêm 17/11 theo rà chữ g4, g5). `alt` riêng của hình chủ đề khác ghi ở bảng "Hình của chủ đề khác" bên dưới.

| Chỗ dùng | Hình gốc | `alt.en` · `alt.vi` riêng | Lý do |
| --- | --- | --- | --- |
| bài 2 `q3_buds` | `explore_buds` | Tiny light-green buds on a twig · Những chồi nhỏ xanh nhạt trên cành | Câu q3 hỏi "new leaves"; `alt` gốc có chữ "leaves" |
| bài 4 `q3_dry` | `explore_dry_season` | A sunny road with trees · Con đường nắng có hàng cây | Câu q3 hỏi "dry season"; `alt` gốc có chữ "dry" |

Hình mới chỉ dùng ở một bài (không vào bảng trên; người viết bài đó tự đặt key, `brief`, `alt`): bài 1 `rainbow_card` (cầu vồng trên ruộng khoai nước); bài 3 `tray_wool_hat` (mũ len có sọc), `tray_fan` (chồng quạt đan lá cọ, không quạt điện có nhãn hiệu), thẻ hoa sữa; bài 4 `q4_puddle` (vũng nước trên lề đường sau mưa), `mango_card` (chùm xoài còn xanh trên cây); bài 5 `tray_swim_ring` (phao bơi xanh lá nổi trên mặt nước), `tray_toothbrush` (chụp gần đầu bàn chải, không nhãn hiệu), `tray_rice_bowl` (bát cơm trắng); bài 6 `star_lantern_card` (`[hình vẽ]` đèn ông sao năm cánh giấy cắt, phiên chính duyệt 18/11). Ảnh khớp brief cập nhật 18/11 theo hai bảng designer ở SK-050.

Hình của chủ đề khác (đã mở file chọn ảnh và file bài nguồn kiểm 17/11):

| Hình gốc | Nội dung, `alt` gốc · ghi chú | Dùng ở |
| --- | --- | --- |
| `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha` `w1` | hàng rào tre trước khu vườn; "A bamboo fence in a garden" · "Hàng rào tre trước khu vườn" | hình câu hỏi mọi câu `single_choice` (Khởi động, Quiz) và mọi câu `order_sequence` của sáu bài |
| `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha` `w1_hat` | nón lá nhìn từ trên xuống (ảnh trang gốc ghi "Nón lá đồ chơi": designer kiểm cỡ, nếu trông như đồ chơi thì báo để tìm ảnh nón lá thật); "A conical hat" · "Chiếc nón lá" | 1 (tray_hat); 2 (q4_hat); 3 (tray_hat); 4 (w1_hat, tray_hat); 6 (tray_hat) |
| `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha` `w1_lotus` | bông sen hồng trên mặt ao; "A lotus flower on a pond" · "Bông hoa sen trên mặt ao" | 2 (tray_lotus, q1_lotus, từ `flower`); 5 (q3_lotus) |
| `goi-ten-va-nhom-dong-vat/chim-va-bo-sat` `tray_penguin` | chim cánh cụt đứng trên tảng đá; "A penguin on a rock" · "Chim cánh cụt đứng trên tảng đá" | 1 (w2) |
| `goi-ten-va-nhom-dong-vat/ca-va-luong-cu` `q1` | ao làng có bèo; "A pond in a village" · "Cái ao ở làng quê" | 2 (w2_pond) |
| `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien` `q3` | bãi biển vắng (CC BY 2.0); "A beach by the sea" · "Bãi biển vắng" | 5 (`explore_holiday`, q4_holiday, q5_holiday, từ `holiday`); 6 (w1_holiday) |
| `khung-long/trai-dat-rat-lau-ve-truoc` `w1_buffalo` | trâu nước bên suối; dùng `alt` riêng như #4: "A water buffalo" · "Con trâu" | 6 (w3) |
| `sinh-vat-song-o-dau/vat-song-hay-khong-song` `q1_ball` | **Không dùng nữa (18/11):** ảnh có chữ nhãn hiệu, crop nào cũng còn chữ. Bài 1, 6 `tray_ball` nay dùng ảnh mới của chủ đề, gốc ở bài 1 `tray_ball` (bảng Hình gốc bên trên) | — |
| `sinh-vat-song-o-dau/noi-song-cua-con-vat` `q4_dunes` | đồi cát dưới nắng; "Sand hills on a sunny day" · "Đồi cát dưới nắng" | 2 (w2_dunes) |
| `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song` `q4_yellow` | **Không dùng nữa (phiên chính 18/11):** ảnh gốc có tuyết. Mọi chỗ lá vàng (bài 2 q3_yellow, ghép `explore_seasons`; bài 3 w2, q2; bài 6 q3_yellow) có brief "Dùng lại hình `q4_yellow` ở bài `thoi-tiet-va-cac-mua/mua-thu-va-mua-dong`" (trong bài 3: "Dùng lại hình `q4_yellow`."); hình gốc mới là `q4_yellow` bài 3, ở bảng Hình gốc bên trên | — |
| `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song` `q4_dry` | lá khô vừa rụng; "A dry fallen leaf" · "Chiếc lá khô vừa rụng" | 2 (q3_dry) |
| `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song` `almond_card` | cành bàng lá to chuyển đỏ (CC BY 4.0); "Red leaves on an Indian almond tree" · "Lá bàng chuyển màu đỏ" | 3 (`explore_red_leaves`, q1_red) |
| `noi-song-tren-trai-dat/bac-cuc` `explore_ice` | băng biển Bắc Cực; **dùng `alt` riêng** "Ice floating on the sea" · "Băng trôi trên mặt biển" (`alt` gốc có chữ "cold" của câu hỏi) | 1 (w1_ice) |
| `noi-song-tren-trai-dat/sa-mac` `explore_sahara` | đồi cát Xa-ha-ra; "Big sand dunes in the Sahara" · "Những đồi cát lớn ở Xa-ha-ra" | 1 (w1_desert) |
| `noi-song-tren-trai-dat/dong-co-xavan` `explore_dry` | xavan mùa khô cỏ vàng; **dùng `alt` riêng** "Grass on the savanna" · "Cỏ ở đồng cỏ xavan" (`alt` gốc nói đúng câu hỏi) | 4 (w2) |
| Discoverer `be-mat-trai-dat/nui-lua` `q3_sun` | Mặt Trời trên trời xanh (CC0); "The bright sun in the sky" · "Mặt Trời chói sáng trên trời". **Chép mục** (`same_as` không sang nhóm tuổi khác) | 1 (`explore_sunny`, q2, q3_sunny, q4_sunny, từ `sunny`) |
| Discoverer `be-mat-trai-dat/nui-lua` `q1_rain` | mưa to (ảnh Estonia, CC0); "Heavy rain falling" · "Mưa to đang rơi". Chép mục | 1 (`explore_rainy`, q3_rainy, q4_rainy, từ `rainy`) |
| Discoverer `thoi-tiet-va-thien-tai/nang-mua-gio-may` `explore_cloudy` | mây trắng xen mây xám trên đồng (CC BY 2.0); "White and grey clouds over the fields" · "Mây trắng và mây xám trên cánh đồng". Chép mục; trong bài 1 đặt tên `q3_cloudy` (không trùng `explore_cloudy` của bài 1) | 1 (q3_cloudy, từ `cloudy`); 2 (w1) |
| Discoverer `khung-long/trai-dat-rat-lau-ve-truoc` `q2_rice` | ruộng lúa xanh Việt Nam (CC BY 3.0); "A green rice field" · "Ruộng lúa xanh". Chép mục | 4 (`explore_fields`) |
- **Không dùng:** Discoverer `ho-hap/vi-sao-ta-phai-tho` `w1` (lúa nghiêng theo gió; bỏ ô gió, xem Lệch); mọi hình tự vẽ của `thoi-tiet-va-thien-tai`, `ho-hap/giu-phoi-khoe` (`w1_scarf`, `q1_raincoat`, `q1_hat`, `tray_puddle`, `tray_fan`…); ảnh lũ, hạn hán, mây giông của Discoverer #5 bài 3, 4.
- **Ảnh mới thật** (ước tính): bài 1 tám (`explore_cloudy`, `explore_cold`, `tray_scarf`, `tray_raincoat`, `tray_tshirt`, `tray_boots`, `tray_pillow`, `rainbow_card`; nón lá và quả bóng dùng lại của #1, #2); bài 2 năm (`explore_spring`, `explore_buds`, `explore_summer`, `tray_cicada`, `tray_banh_chung`); bài 3 tám (`explore_autumn`, `explore_winter`, `explore_short_days`, `q5_winter`, `tray_quilt`, `tray_wool_hat`, `tray_fan`, thẻ hoa sữa); bài 4 sáu (`explore_rainy_season`, `explore_dark_clouds`, `explore_dry_season`, `q4_puddle`, `tray_watering_can`, `mango_card`); bài 5 sáu (`explore_tet`, `explore_school`, `tray_bucket`, `tray_swim_ring`, `tray_toothbrush`, `tray_rice_bowl`); bài 6 hai (`q4_long_sleeve`, `star_lantern_card`). Tổng ba mươi lăm ảnh mới, một hình vẽ, ba hình ghép, bốn mục chép từ Discoverer. **Cập nhật 18/11:** bài 3 thêm ảnh lá vàng `q4_yellow` (thay ảnh của #2); bài 6 `star_lantern_card` thành hình vẽ. Nay ba mươi lăm ảnh mới, hai hình vẽ, ba hình ghép. **Cập nhật 18/11 sau chạy thử:** bài 1 thêm `tray_ball` (thay ảnh `q1_ball` của #2); bài 3 bỏ `q5_winter` (ảnh sương mù nay là `explore_winter`, q5 dùng lại `explore_cold`); số ảnh mới không đổi.

### Khung Quiz sáu bài

Chữ câu hỏi là bản chốt (đã đếm từ); đáp án, dạng câu, DOK, lựa chọn không đổi. ✓ là đáp án đúng; thứ tự lựa chọn trong bảng không phải thứ tự trên màn (app xáo, SK-047). Hình câu `single_choice` và `order_sequence` là hàng rào tre (không ghi lại).

**Bài 1**

| Câu | Dạng · DOK | Câu hỏi EN · VI | Lựa chọn hoặc đáp án · hình |
| --- | --- | --- | --- |
| q1 | SC · 1 | What do we wear on rainy days? · Trời mưa, mình mặc gì? | áo mưa ✓; áo khoác; áo cộc tay |
| q2 | TF · 1 | Sunny days are often hot. · Ngày nắng thường nóng. | Đúng · `explore_sunny` |
| q3 | SC · 1 | Which picture shows a rainy day? · Hình nào là trời mưa? | mưa to ✓ (`explore_rainy`); trời nắng (`explore_sunny`); trời nhiều mây (`q3_cloudy`) |
| q4 | SC · 2 | Which day is best for drying clothes? · Ngày nào phơi quần áo mau khô nhất? | trời nắng ✓; trời mưa (hai lựa chọn) |
| q5 | TF · 2 | A scarf is good for a hot day. · Khăn len hợp với ngày nắng nóng. | Sai · `tray_scarf` |
| q6 | TF · 2 · `sun_gone_when_cloudy` | On cloudy days, the Sun goes away. · Trời nhiều mây là Mặt Trời đi mất. | Sai · `explore_cloudy` |

**Bài 2**

| Câu | Dạng · DOK | Câu hỏi EN · VI | Lựa chọn hoặc đáp án · hình |
| --- | --- | --- | --- |
| q1 | SC · 1 | Which flower blooms at Tet? · Hoa nào nở dịp Tết? | hoa đào ✓; hoa phượng; hoa sen |
| q2 | TF · 1 | Cicadas sing loudly in summer. · Mùa hè, ve kêu râm ran. | Đúng · `tray_cicada` |
| q3 | SC · 1 | Which picture shows new leaves? · Hình nào là lộc non? | lộc non ✓; lá vàng (`q4_yellow`); lá khô (`q4_dry`) |
| q4 | SC · 2 | What do you need on summer days? · Ngày hè, em cần gì? | nón lá ✓; khăn len; áo khoác |
| q5 | SC · 2 | It is Tet. Which season is it? · Đang Tết. Là mùa nào? | mùa xuân ✓ (ảnh `explore_buds`); mùa hè (ảnh `explore_summer`); mùa đông (ảnh `explore_cold`) |
| q6 | TF · 2 · `flowers_only_in_spring` | Flowers bloom only in spring. · Hoa chỉ nở vào mùa xuân. | Sai · `explore_summer` |

**Bài 3**

| Câu | Dạng · DOK | Câu hỏi EN · VI | Lựa chọn hoặc đáp án · hình |
| --- | --- | --- | --- |
| q1 | SC · 1 | Which one is a sign of winter? · Cái nào là dấu hiệu của mùa đông? | lá bàng đỏ ✓ (`almond_card`); hoa phượng; con ve |
| q2 | TF · 1 | Some leaves turn yellow in autumn. · Mùa thu, có cây lá chuyển vàng. | Đúng · `q4_yellow` |
| q3 | TF · 1 | Winter days are long. · Ngày mùa đông dài. | Sai · `explore_short_days` |
| q4 | OS · 2 | Spring comes first. Put them in order. · Mùa xuân đến trước. Em xếp theo thứ tự nhé. | hoa đào → hoa phượng → lá vàng |
| q5 | SC · 2 | Red leaves, foggy mornings. Which season is it? · Lá bàng đỏ, sáng sớm có sương mù. Đang là mùa nào? | mùa đông ✓ (ảnh `explore_cold` bài 1, đổi 18/11); mùa hè (ảnh `explore_summer`); mùa xuân (ảnh `explore_buds`) |
| q6 | TF · 2 · `winter_means_snow` | Winter always brings snow. · Mùa đông lúc nào cũng có tuyết. | Sai · `explore_winter` |

**Bài 4**

| Câu | Dạng · DOK | Câu hỏi EN · VI | Lựa chọn hoặc đáp án · hình |
| --- | --- | --- | --- |
| q1 | SC · 1 | What do you bring in the rainy season? · Mùa mưa, em mang theo gì? | áo mưa ✓; khăn len; bình tưới cây |
| q2 | TF · 1 | The dry season has lots of rain. · Mùa khô có rất nhiều mưa. | Sai · `explore_dry_season` |
| q3 | SC · 1 | Which picture shows the dry season? · Hình nào là mùa khô? | đường nắng khô ✓; mưa to trên phố (hai lựa chọn) |
| q4 | SC · 2 | What comes after heavy rain? · Mưa to xong thì có gì? | vũng nước ✓ (`q4_puddle`); mây đen (`q4_clouds`, hình `explore_dark_clouds`) (hai lựa chọn; đổi từ OS 18/11) |
| q5 | TF · 2 | Plants need watering in the dry season. · Mùa khô, cây cần được tưới nước. | Đúng · `tray_watering_can` |
| q6 | TF · 2 · `four_seasons_everywhere` | Every place has four seasons. · Nơi nào cũng có bốn mùa. | Sai · `explore_seasons` (bài 2) |

**Bài 5**

| Câu | Dạng · DOK | Câu hỏi EN · VI | Lựa chọn hoặc đáp án · hình |
| --- | --- | --- | --- |
| q1 | SC · 1 | Which one is for the summer holiday? · Cái nào dành cho kỳ nghỉ hè? | xô và xẻng xúc cát ✓; bánh chưng; áo khoác |
| q2 | TF · 1 | A year has twelve months. · Một năm có mười hai tháng. | Đúng · `explore_months` |
| q3 | SC · 1 | Which flower do we see at Tet? · Dịp Tết, mình thấy hoa nào? | hoa mai ✓; hoa sen; hoa phượng |
| q4 | OS · 2 | Start at Tet. Put them in order. · Bắt đầu từ Tết. Em xếp theo thứ tự nhé. | Tết (bánh chưng) → nghỉ hè (bãi biển) → khai giảng (cặp sách) |
| q5 | SC · 2 | Flame trees bloom. What time of year? · Hoa phượng nở. Đó là dịp nào trong năm? | nghỉ hè ✓ (bãi biển); Tết (bánh chưng); khai giảng (cặp sách) |
| q6 | TF · 2 · `months_stop_after_december` | After December, the months stop. · Hết tháng Mười Hai là hết tháng. | Sai · `explore_months` |

> Bài 5 q3: hoa sen và hoa phượng là hai lựa chọn sai, không có hoa đào (hoa đào cũng đúng dịp Tết, và luật không đặt hoa đào cạnh hoa mai). Hoa sen dùng `w1_lotus`.

**Bài 6**

| Câu | Dạng · DOK | Câu hỏi EN · VI | Lựa chọn hoặc đáp án · hình |
| --- | --- | --- | --- |
| q1 | SC · 1 | Which one do you wear on hot days? · Ngày nóng, em mặc gì? | áo cộc tay ✓; áo khoác; khăn len |
| q2 | TF · 1 | The seasons come back every year. · Năm nào các mùa cũng quay lại. | Đúng · `explore_spring` (bài 2) |
| q3 | SC · 1 | Which picture shows autumn? · Hình nào là mùa thu? | lá vàng ✓ (`q4_yellow`); hoa đào; hoa phượng |
| q4 | OS · 2 | Order from cold days to hot days. · Em xếp từ ngày lạnh tới ngày nóng nhé. | áo khoác → áo tay dài → áo cộc tay |
| q5 | SC · 2 | Peach trees bloom again. Which season is back? · Hoa đào lại nở. Mùa nào đã trở lại? | mùa xuân ✓ (ảnh `explore_buds`); mùa thu (ảnh `explore_autumn`); mùa đông (ảnh `explore_winter`) |
| q6 | TF · 2 · `same_weather_all_year` | The weather is the same all year. · Cả năm thời tiết đều như nhau. | Sai · `explore_seasons` (bài 2) |

- SC = `single_choice`, TF = `true_false`, OS = `order_sequence` (ba thẻ).
- Mỗi bài: DOK 1·1·1·2·2·2; câu 1 DOK 1; đúng một câu misconception ở q6; bài 1, 2, 4 hai format, bài 3, 5, 6 ba format (mọi bài ít nhất hai dạng).
- **Chữ cần dạy trước khi hỏi** (luật "câu hỏi chỉ dùng chữ đã dạy"): bài 1 q4 cần ý phơi đồ hay "nắng làm khô" (ví dụ ô Sunny có thể thêm "clothes dry fast" · "quần áo mau khô" thay "drink lots of water"; người viết bài 1 chọn); bài 1 q6 cần "the Sun is still there" (ví dụ bắt buộc ô Cloudy); bài 2 q2 cần "cicadas sing loudly" (ví dụ ô Summer); bài 2 q4 cần "hat" (ví dụ ô Sunny bài 1); bài 2 q5 cần Tết gắn mùa xuân (câu chính ô Spring); bài 3 q3 cần "short days" (ô Short days); bài 3 q5 cần lá bàng đỏ mùa đông (ô Red leaves) và sương mù mùa đông (ví dụ ô Winter); bài 4 q4 cần mây đen đến trước mưa, vũng nước sau mưa (ô Dark clouds, ví dụ ô Rainy season); bài 4 q5 cần "we water the plants" (ví dụ ô Dry season); bài 5 q1 cần biển nghỉ hè (ví dụ ô Summer holiday, ảnh xô xẻng ở kệ Chơi); bài 5 q3 cần hoa mai (ví dụ bắt buộc ô Tet); bài 5 q5 cần "flame trees are red" (ví dụ ô Summer holiday); bài 6 q4 cần "thin clothes for hot days" (câu chính ô Clothes).

### Đáp án Đúng/Sai

| Bài | Câu `true_false` | Đáp án |
| --- | --- | --- |
| 1 | w2 "A penguin flies high in the sky." | Sai |
| 1 | q2 "Sunny days are often hot." | Đúng |
| 1 | q5 "A scarf is good for a hot day." | Sai |
| 1 | q6 `sun_gone_when_cloudy` "On cloudy days, the Sun goes away." | Sai |
| 2 | w1 "Clouds can hide the Sun." | Đúng |
| 2 | q2 "Cicadas sing loudly in summer." | Đúng |
| 2 | q6 `flowers_only_in_spring` "Flowers bloom only in spring." | Sai |
| 3 | w2 "A yellow leaf was once green." | Đúng |
| 3 | q2 "Some leaves turn yellow in autumn." | Đúng |
| 3 | q3 "Winter days are long." | Sai |
| 3 | q6 `winter_means_snow` "Winter always brings snow." | Sai |
| 4 | w2 "Savanna grass turns yellow in the dry season." | Đúng |
| 4 | q2 "The dry season has lots of rain." | Sai |
| 4 | q5 "Plants need watering in the dry season." | Đúng |
| 4 | q6 `four_seasons_everywhere` "Every place has four seasons." | Sai |
| 5 | w2 "Peach trees bloom in summer." | Sai |
| 5 | q2 "A year has twelve months." | Đúng |
| 5 | q6 `months_stop_after_december` "After December, the months stop." | Sai |
| 6 | w2 "Summer days are short." | Sai |
| 6 | w3 "A buffalo eats small fish." | Sai |
| 6 | q2 "The seasons come back every year." | Đúng |
| 6 | q6 `same_weather_all_year` "The weather is the same all year." | Sai |

- Hai mươi hai câu: chín Đúng, mười ba Sai. Không tính sáu câu q6: chín Đúng, bảy Sai. Bài nào cũng có cả hai.
- Không câu nào có chữ phủ định ("not", "no", "never", "không", "chẳng"); "only", "always", "every", "lots of" là câu khẳng định. Không câu nào có `labels`.
- Câu đáp án Sai: `explanation_correct` không mở đầu "Yes!" · "Đúng rồi!", đứng một mình được; `explanation_wrong` mở đầu "This is false." · "Câu này sai."; phản hồi viết ở `feedback_true`. Câu đáp án Đúng: `explanation_wrong` mở đầu "This is true." · "Câu này đúng."; phản hồi ở `feedback_false`.
- Bản VI câu "every …" dịch "mọi … đều" hoặc "nơi nào cũng", để không nghe thành câu hỏi "nơi nào".

Thứ tự đúng của các câu `order_sequence` (mỗi câu đúng một thứ tự; ba thẻ liền nhau, câu về mùa và mốc trong năm nêu thẻ đầu trong `prompt`):

| Bài | Câu | Thứ tự đúng | Ghi chú |
| --- | --- | --- | --- |
| 3 | q4 | hoa đào (`explore_spring`), hoa phượng (`explore_summer`), lá vàng (`q4_yellow`) | Ba mùa liền nhau từ mùa xuân |
| 5 | q4 | bánh chưng (`tray_banh_chung`), bãi biển (`oc-bach-tuoc-va-con-vat-bien` `q3`), cặp sách (`explore_school`) | Ba mốc liền nhau từ Tết |
| 6 | q4 | áo khoác (`explore_cold`), áo tay dài (`q4_long_sleeve`), áo cộc tay (`tray_tshirt`) | Từ lạnh tới nóng, không phải vòng |

> [CẦN KIỂM] Bài 5 q4: Tết (tháng Một hoặc tháng Hai dương lịch) đến trước nghỉ hè (khoảng tháng Sáu tới tháng Tám), nghỉ hè đến trước khai giảng (tháng Chín).
> Bài 4 q4 không còn là `order_sequence` (18/11, phiên chính): designer không tìm được ba ảnh mây đen, mưa, vũng nước cùng một cảnh hợp luật (ba ảnh ba nơi, mây đen trên sông, mưa và vũng nước trên phố). Đã đổi sang phương án `single_choice` "What comes after heavy rain?" · "Mưa to xong thì có gì?", vũng nước ✓, mây đen là lựa chọn sai; giữ DOK 2.

### Khởi động (giãn cách)

| Bài | w1 | w2 | w3 |
| --- | --- | --- | --- |
| 1 | `noi-song-tren-trai-dat/bac-cuc` (#4 bài 1, ý chính một "The Arctic is icy and very cold."), SC: "Which place is very cold?" · "Nơi nào rất lạnh?" · băng biển ✓ (`explore_ice`, `alt` riêng); đồi cát Xa-ha-ra (`explore_sahara`) | `goi-ten-va-nhom-dong-vat/chim-va-bo-sat` (#1 bài 3, q6 `all_birds_fly`; mốc khoảng một tháng theo `goi-ten-va-nhom-dong-vat/_topic.md:339`), TF: "A penguin flies high in the sky." · "Chim cánh cụt bay cao trên trời." · Sai · `tray_penguin` | — |
| 2 | `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay` (bài trước, ô Cloudy), TF: "Clouds can hide the Sun." · "Mây có thể che Mặt Trời." · Đúng · `q3_cloudy` | `sinh-vat-song-o-dau/noi-song-cua-cay` (#2 bài 5, ô `explore_pond_plants` "A lotus grows in a muddy pond."), SC: "Where does a lotus grow?" · "Hoa sen mọc ở đâu?" · cái ao ✓ (`ca-va-luong-cu` `q1`); đồi cát (`q4_dunes`) | — |
| 3 | `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he` (bài trước, ô Summer), SC: "Which flower blooms in summer?" · "Hoa nào nở vào mùa hè?" · hoa phượng ✓; hoa đào | `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song` (#2 bài 3, q4 lá xanh → lá vàng → lá khô), TF: "A yellow leaf was once green." · "Chiếc lá vàng từng là lá xanh." · Đúng · `q4_yellow` | — |
| 4 | `thoi-tiet-va-cac-mua/mua-thu-va-mua-dong` (bài trước, ô Winter), SC: "Which one keeps you warm in winter?" · "Mùa đông, cái gì giữ ấm cho em?" · khăn len ✓; nón lá | `noi-song-tren-trai-dat/dong-co-xavan` (#4 bài 6, ô `explore_dry` "In the dry season, the grass turns yellow."), TF: "Savanna grass turns yellow in the dry season." · "Mùa khô, cỏ ở đồng cỏ xavan chuyển vàng." · Đúng · `explore_dry` (`alt` riêng) | — |
| 5 | `thoi-tiet-va-cac-mua/mua-mua-va-mua-kho` (bài trước, ô Dry season), SC: "What helps plants in the dry season?" · "Mùa khô, cái gì giúp cây?" · bình tưới cây ✓; áo mưa | `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he` (cách hai bài, ô Spring), TF: "Peach trees bloom in summer." · "Hoa đào nở vào mùa hè." · Sai · `explore_spring` | — |
| 6 | `thoi-tiet-va-cac-mua/muoi-hai-thang` (bài trước, ô Tet), SC: "Which comes near the start of the year?" · "Dịp nào đến vào khoảng đầu năm?" · Tết ✓ (`tray_banh_chung`); nghỉ hè (bãi biển) | `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he` (cách bốn bài, ô Summer, ý chính ba), TF: "Summer days are short." · "Ngày mùa hè ngắn." · Sai · `explore_summer` | `goi-ten-va-nhom-dong-vat/con-vat-an-gi` (#1 bài 6, mốc dài theo `goi-ten-va-nhom-dong-vat/_topic.md:339`; trâu ăn cỏ), TF: "A buffalo eats small fish." · "Con trâu ăn cá nhỏ." · Sai · `w1_buffalo` (`alt` riêng) |

- Nếp SK-045: mỗi bài một câu ôn bài ngay trước và một câu ôn mốc dài. Bài 1 chưa có bài trước nên cả hai là mốc dài (#4 khoảng hai tuần, #1 khoảng một tháng trở lên). Bài 6 có ba câu: bài 5, bài 2, #1.
- Câu ôn chủ đề trước là câu mới, không chép câu hỏi cũ: bài 1 w2 khác "Every bird can fly." của #1 bài 4 w2 (nói về một con vật bé nhìn thấy); bài 2 w2 không chép #2 bài 5 q1 ("Which plant grows in a pond?"); bài 4 w2 viết lại câu chính ô `explore_dry`; bài 6 w3 khác "A buffalo eats meat." của #1 bài 8 w3.
- Bài 4 w2 nối xavan với miền Nam bằng ý "mùa khô" (không nói "miền Nam giống xavan").

### Phần Chơi sáu bài (`build_tray`)

| Bài | Lệnh | Nhóm bắt buộc (món) · màu | Nhóm `limit` (món bẫy) |
| --- | --- | --- | --- |
| 1 | "Dress for sun, rain and cold" · "Chọn đồ cho ngày nắng, ngày mưa, ngày lạnh" | Sunny · Trời nắng (nón lá, áo cộc tay) `vang_hoe`; Rainy · Trời mưa (áo mưa, ủng cao su) `cham`; Cold · Trời lạnh (áo khoác, khăn len) `nau_dat` | Not for sun, rain or cold · Không dùng khi nắng, mưa hay lạnh: cái gối (mềm như khăn len), quả bóng (đồ chơi ngoài trời) |
| 2 | "Pick three signs of spring and summer" · "Chọn ba dấu hiệu của mùa xuân và mùa hè" | Flowers · Hoa (hoa đào, hoa phượng, hoa sen) `gi_dong`; Animal · Con vật (con ve) `nau_dat`; Tet food · Món ngày Tết (bánh chưng) `vang_hoe` | For cold days · Dùng khi trời lạnh: áo khoác, khăn len |
| 3 | "Pick three things for cold winter days" · "Chọn ba thứ cho những ngày đông lạnh" | Warm clothes · Quần áo ấm (áo khoác, mũ len) `nau_dat`; Scarf · Khăn quàng (khăn len) `gi_dong`; Warm bed · Giường ấm (chăn bông) `cham` | For hot days · Dùng khi trời nóng: nón lá, quạt nan, áo cộc tay |
| 4 | "Get ready for rainy and dry seasons" · "Chuẩn bị cho mùa mưa và mùa khô" | Keeps rain off · Che mưa (áo mưa, ủng cao su) `cham`; Keeps sun off · Che nắng (nón lá) `vang_hoe`; Waters plants · Tưới cây (bình tưới cây) `gi_dong` | For cold winters · Dùng cho mùa đông lạnh: áo khoác, khăn len, chăn bông |
| 5 | "Pick things for three times of year" · "Chọn đồ cho ba dịp trong năm" | Tet · Tết (bánh chưng, hoa mai) `vang_hoe`; Summer holiday · Nghỉ hè (xô và xẻng, phao bơi) `cham`; Back to school · Khai giảng (cặp sách) `nau_dat` | Every day · Ngày nào cũng dùng: bàn chải đánh răng, bát cơm |
| 6 | "Pick clothes for three seasons" · "Chọn đồ cho ba mùa" | Winter in the north · Mùa đông miền Bắc (áo khoác, khăn len) `nau_dat`; Summer · Mùa hè (nón lá, áo cộc tay) `vang_hoe`; Rainy season in the south · Mùa mưa miền Nam (áo mưa, ủng cao su) `cham` | Not for sun, rain or cold · Không dùng khi nắng, mưa hay lạnh: cái gối, quả bóng |

- **Lời nhắn `has_limited`** (đúng với mọi món bẫy của bài): bài 1, 6 "That one does not help with weather." · "Món này không giúp gì khi nắng, mưa hay lạnh."; bài 2 "That one is for cold days." · "Món này dùng khi trời lạnh."; bài 3 "That one is for hot days." · "Món này dùng khi trời nóng."; bài 4 "That one is for cold winters." · "Món này dùng cho mùa đông lạnh."; bài 5 "We use that one every day." · "Món này ngày nào mình cũng dùng."
- **Nhãn `limit`:** bài 2 đến 5 viết khẳng định ("For cold days", "Every day"), như "Farm animal" của #4 bài 8; bài 1, 6 dạng "Not for …" (đồ không liên quan thời tiết, không có cách nói khẳng định ngắn). Nhãn nhóm tránh dấu phẩy; ngoại lệ có chủ ý: nhãn "Not for sun, rain or cold" · "Không dùng khi nắng, mưa hay lạnh" của bài 1, 6 (phiên chính chốt 17/11).
- **Mỗi món bẫy giống một nhóm bắt buộc** về dáng hay chỗ dùng (khăn len, áo khoác ở bài 2, 4 là đồ mặc như nhóm khác; nón lá, áo cộc tay ở bài 3 là đồ mặc; bát cơm ở bài 5 là món ăn như bánh chưng) nhưng sai về thời tiết hay dịp. Bẫy bài 2 đến 6 là đồ bé đã gặp ở bài trước.
- Bài 5 nhóm Tết dùng hoa mai, không thêm cành đào (luật không đặt hoa đào cạnh hoa mai; hoa đào đã có ở bài 2).
- Bài 1 không có "cái ô": ô che cả nắng lẫn mưa, món sẽ nước đôi. Nón lá ở chủ đề này luôn ở nhóm che nắng; ở bài 4 w1 nó là lựa chọn sai cho "giữ ấm", không nước đôi.

### Thẻ thưởng (bộ `set: weather`)

| Bài | Key · tên EN · VI | `rarity` | `tag` EN · VI | Em có biết? (`fact`) EN · VI | Hình | [CẦN KIỂM] |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | `rainbow_card` Rainbow · Cầu vồng | rare | After rain, in sunshine · Sau mưa, khi có nắng | Rainbows show when sunlight meets raindrops. · Cầu vồng hiện ra khi nắng chiếu vào giọt mưa. | ảnh mới `rainbow field` (cầu vồng trên ruộng khoai nước) | Cầu vồng thấy khi vừa mưa vừa có nắng, Mặt Trời sau lưng người xem |
| 2 | `flame_tree_card` Flame tree · Cây phượng | common | Blooms red in summer · Nở hoa đỏ mùa hè | Students call it the school flower. · Học trò gọi hoa phượng là hoa học trò. | `explore_summer` | Tên EN; cách gọi "hoa học trò" |
| 3 | `blackboard_tree_card` Blackboard tree · Cây hoa sữa | rare | Smells strong in autumn · Thơm nồng mùa thu | Its tiny white flowers grow in bunches. · Hoa sữa nhỏ, trắng, mọc thành chùm. | ảnh mới `Alstonia scholaris flowers` | Hoa sữa nở mùa thu Hà Nội; tên EN "blackboard tree" |
| 4 | `mango_card` Mango · Quả xoài | common | Ripe in the hot dry season · Chín vào mùa khô nắng nóng | Mangoes hang in bunches on big trees. · Xoài treo thành chùm trên cây to. (đổi 18/11: ảnh là quả còn xanh, chữ không nói vỏ chín chuyển vàng) | ảnh mới `mango tree fruit` (chùm xoài còn xanh) | Xoài miền Nam chín rộ cuối mùa khô; quả xoài treo thành chùm |
| 5 | `banh_chung_card` Banh chung · Bánh chưng | common | Made for Tet · Gói dịp Tết | It is wrapped in green dong leaves. · Bánh chưng được gói bằng lá dong xanh. | `tray_banh_chung` | Lá dong; "dong leaves" đọc EN |
| 6 | `star_lantern_card` Star lantern · Đèn ông sao | rare | Shines at Mid-Autumn · Sáng rực dịp Trung thu | It has five points, like a star. · Đèn ông sao có năm cánh như ngôi sao. | `[hình vẽ]` đèn ông sao năm cánh giấy cắt (phiên chính duyệt 18/11) | Đèn ông sao năm cánh |

- Sáu thẻ chưa có trong bộ `weather` (đang có: `big_cloud`, `weather_box`, `numbered_storms`, `floating_season`, `storm_kit` của Discoverer #5). Bộ đã có khoá giao diện, ios-dev không thêm khoá.
- Thẻ không có tên tháng, ngày âm lịch, "quý hiếm".
- Bài 3 không dùng cây bàng (đã là thẻ `almond_card` của #2 bài 3, bộ `living_things`).

### An toàn và nhạy cảm

- **Mặt Trời:** không câu nào bảo bé nhìn Mặt Trời, nhìn lên trời tìm Mặt Trời hay tìm cầu vồng gần Mặt Trời. Ô Sunny có ví dụ bắt buộc "never look straight at the Sun" · "đừng bao giờ nhìn thẳng vào Mặt Trời". `hint` của bài 1 q6 trỏ tới tia nắng, ánh sáng ban ngày, không bảo bé nhìn lên.
- **Thiên tai:** không bão, lũ, hạn hán, sét, mưa đá, sạt lở; không "mùa mưa bão"; không người gặp nạn, không nước ngập đường trong ảnh. Mưa to bài 4 là mưa rồi tạnh.
- **Sức khoẻ:** không nói ốm, cảm lạnh, say nắng; chỉ "mặc ấm", "đội nón", "uống nhiều nước".
- **Lễ, lịch:** Tết, Trung thu là lễ dân gian, chỉ dùng như mốc, dấu hiệu; không lễ tôn giáo (không Giáng sinh); không âm lịch, "Lunar New Year", "tháng Giêng", ngày rằm.
- **Dữ liệu trẻ:** không hỏi bé sống ở miền nào, sinh tháng nào; không "sinh nhật", "birthday".
- **Đồ dùng:** quạt là quạt nan (không quạt điện, ổ cắm); không lò sưởi, bếp than để sưởi.

### Ranh giới với chủ đề khác

- **Discoverer #5 *Thời tiết và thiên tai ở Việt Nam*:** gió là không khí chuyển động, mây là giọt nước, dụng cụ đo (nhiệt kế, ống đo mưa), mùa mưa bão, lũ, hạn hán, an toàn: để dành. Không trùng key misconception (`trees_make_wind`, `clouds_are_smoke`, `feel_tells_temperature`, `calm_means_storm_over`, `flood_only_where_it_rains`, `drought_is_one_hot_day`, `shallow_floodwater_safe`). Dùng chung bộ thẻ `weather`, khác key thẻ.
- **Scientist #6 *Trái Đất, Mặt Trời, Mặt Trăng*:** vì sao có mùa, trục nghiêng, ngày dài ngắn, Mặt Trăng và lịch âm: để dành. Không "gần Mặt Trời", "closer to the Sun", "nghiêng", "tilt".
- **Scientist #16:** biến đổi khí hậu; chủ đề không dùng chữ "khí hậu", "climate".
- ***Cây quanh em* (#7):** cây rụng lá, cây thường xanh, bộ phận cây: để dành. Bài 2, 3 chỉ nói "nhiều cây ra lộc", "có cây lá vàng", "lá bàng đỏ rồi rụng".
- ***Sinh vật sống ở đâu?* (#2):** dùng lại lá vàng, lá khô, lá bàng, sen; không dạy lại sống, chết.
- ***Những nơi sống trên Trái Đất* (#4):** dùng lại nơi lạnh (Bắc Cực), mùa khô ở xavan; không dạy lại nơi sống.
- ***Gọi tên và nhóm động vật* (#1):** chỉ ở Khởi động (chim cánh cụt, trâu); con ve, ếch chỉ là dấu hiệu mùa, không phân loại.
- **Chủ đề "bầu trời ngày và đêm" (câu D3, chờ Duy):** không dạy ngày, đêm, Mặt Trời mọc, lặn; ý "trời tối sớm, tối muộn" chỉ là dấu hiệu mùa.
- **Toán:** không đếm ngày trong tháng, không "tháng thứ mấy", không lịch có số.

### Lệch so với đề xuất PM

- **Bài 1:** ý chính một đổi "sunny, rainy or windy" thành "sunny, cloudy or rainy" (khớp ba ô Học, và ô Cloudy mang ý sửa misconception); gió chỉ nói ở ví dụ ô Cold ("a cold wind blows"), không ô riêng, không ảnh lúa nghiêng (`ho-hap/vi-sao-ta-phai-tho` `w1` không dùng), vì gió là ý chính của Discoverer #5 bài 1. Kệ Chơi thay "cái ô" bằng ủng cao su (ô nước đôi nắng, mưa); nhóm `limit` là gối, quả bóng.
- **Bài 1 q1:** lựa chọn sai là áo khoác, áo cộc tay, không nón lá (nón lá cũng dùng khi mưa, nước đôi).
- **Bài 2:** ý chính ba VI viết sát EN ("Mùa hè trời nóng. Ngày mùa hè dài."); "trời tối muộn" thành ví dụ bắt buộc ô Summer. Kệ Chơi: nhóm Hoa, Con vật, Món ngày Tết thay "Tết, ngày hè nóng, lộc non" (lộc non một món khó thành nhóm; thêm hoa sen ở nhóm Hoa cho khớp q6). Khởi động w2 ôn #2 bài 5 bằng hoa sen (nối với lựa chọn hoa sen ở q1 và nhóm Hoa).
- **Bài 3:** không dùng hoa đào làm lựa chọn sai cho "dấu hiệu mùa đông" (hoa đào nở cuối đông, đầu xuân, nước đôi); dùng hoa phượng, con ve. Thẻ là cây hoa sữa (không chọn sương mù: sương mù đã là ảnh câu q5).
- **Bài 4:** ô thứ tư là "Rice fields" một ý ("Rain makes the rice fields green."), bỏ cặp "ruộng xanh mùa mưa, ruộng đã gặt mùa khô" và ảnh `rice stubble field`: đồng bằng sông Cửu Long cấy nhiều vụ quanh năm, nói ruộng khô vào mùa khô dễ sai [CẦN KIỂM]. Từ `extra` `shower` đổi thành `dark_cloud` ("shower" cũng là vòi sen tắm, và Discoverer #5 có hình vòi sen). Kệ Chơi: nhóm Che mưa, Che nắng, Tưới cây thay "mùa mưa, mùa khô, ruộng"; bẫy thêm chăn bông. Câu q4 lúc soạn là `order_sequence` (mây đen → mưa to → vũng nước); 18/11 đổi sang `single_choice` "What comes after heavy rain?" vì không có ba ảnh cùng cảnh.
- **Bài 5:** mục tiêu EN rút còn bảy từ ("I know a year has twelve months."). Từ `extra` `calendar` đổi thành `festival`: không có ảnh lịch hợp luật (lịch có chữ số), mà tự vẽ phải xin PM. Không dùng trống trường làm ảnh (hiếm ảnh mở), chỉ nói ở ví dụ. Bẫy Chơi là đồ dùng hằng ngày (bàn chải, bát cơm).
- **Bài 6:** mục tiêu EN "I can tell how a year's weather changes." (tám từ). Ô thứ tư "Again and again" dùng ảnh hoa đào thay "vòng mùa" (không có ảnh thật cho vòng mùa, và tự vẽ chưa được duyệt). Từ `extra` `clothes`, `t_shirt`. Khởi động w3 ôn #1 bài 6 (theo ghi chú `goi-ten-va-nhom-dong-vat/_topic.md:339`, "bài 1 và bài cuối").
- **Thẻ thưởng:** bài 4 xoài (gợi ý của proposal), bài 6 đèn ông sao (thứ chưa có thẻ).

### Đúng khoa học

Mọi ý chưa chắc có dòng `> [CẦN KIỂM]` ngay dưới; người viết bài đặt lại dòng đó ngay dưới trường tương ứng trong bài và chép sang ticket.

**Thời tiết (bài 1)**
- Ngày nắng thường nóng; mây che Mặt Trời một lúc, Mặt Trời vẫn ở đó; nắng làm quần áo mau khô; ếch kêu sau mưa; cầu vồng hiện ra khi nắng chiếu vào giọt mưa.
> [CẦN KIỂM] "Sunny days are often hot" đúng với trẻ Việt Nam (ngày nắng mùa đông miền Bắc vẫn lạnh: câu dùng "often"); ếch đồng kêu nhiều sau mưa; cầu vồng thấy khi Mặt Trời ở sau lưng người xem và trước mặt có mưa.

**Mùa ở miền Bắc (bài 2, 3)**
- Miền Bắc có bốn mùa; mùa xuân trời ấm dần, mưa phùn; hoa đào nở dịp Tết; nhiều cây ra lộc mùa xuân; mùa hè nóng, ngày dài, tối muộn, ve kêu, mưa rào, hoa phượng nở; hoa sen nở mùa hè.
> [CẦN KIỂM] Miền Bắc có bốn mùa (cách chia theo SGK); Tết được coi là mùa xuân dù trời Hà Nội dịp Tết thường còn lạnh (bài 2 q5 "It is Tet. Which season is it?" đáp án mùa xuân); hoa đào nở dịp Tết ở miền Bắc; mưa phùn cuối đông, đầu xuân; ve kêu mùa hè; hoa phượng nở mùa hè ở cả hai miền; hoa sen nở mùa hè; ở Hà Nội mùa hè trời tối muộn hơn rõ so với mùa đông.
- Mùa thu mát, trời xanh, có cây lá vàng, hoa sữa nở, đèn ông sao dịp Trung thu; mùa đông lạnh, sương mù, lá bàng đỏ rồi rụng, trời tối sớm, không có tuyết ở Hà Nội.
> [CẦN KIỂM] Hoa sữa nở mùa thu Hà Nội; Trung thu rơi vào mùa thu (tháng Chín hoặc tháng Mười dương lịch); lá bàng chuyển đỏ rồi rụng vào mùa đông miền Bắc; sương mù sáng sớm mùa đông; Hà Nội không có tuyết, tuyết chỉ thỉnh thoảng ở núi cao (Sa Pa, Mẫu Sơn); thứ tự xuân → hè → thu đúng một chiều (bài 3 q4).

**Mùa ở miền Nam (bài 4)**
- Miền Nam có mùa mưa và mùa khô; mùa mưa hay mưa to buổi chiều rồi tạnh; mây đen hay kéo tới buổi chiều (bản EN có "often", sửa 17/11 theo rà chữ N7); mùa khô nắng nhiều, ít mưa, phải tưới cây; mưa làm ruộng lúa xanh; xoài chín cuối mùa khô; miền Nam ấm quanh năm (bài 6).
> [CẦN KIỂM] Mùa mưa miền Nam khoảng tháng Năm tới tháng Mười Một, mùa khô khoảng tháng Mười Hai tới tháng Tư; mưa mùa mưa thường tới buổi chiều, mưa rào rồi tạnh; miền Nam ấm quanh năm; xoài miền Nam chín rộ cuối mùa khô, đầu mùa mưa; cách nói "mưa làm ruộng lúa xanh tốt" chấp nhận được (đồng bằng sông Cửu Long cấy lúa quanh năm nhờ thuỷ lợi).
- Xavan châu Phi mùa khô cỏ vàng (bài 4 w2, đã có `[CẦN KIỂM]` ở #4 bài 6).

**Tháng (bài 5)**
- Một năm có mười hai tháng; hết tháng Mười Hai lại đến tháng Một; Tết đến khoảng đầu năm (tháng Một hoặc tháng Hai dương lịch); hoa mai nở dịp Tết ở miền Nam; nghỉ hè giữa năm; khai giảng tháng Chín; bánh chưng gói lá dong.
> [CẦN KIỂM] Tết dương lịch rơi vào tháng Một hoặc tháng Hai; hoa mai vàng (*Ochna integerrima*) nở dịp Tết ở miền Nam; nghỉ hè khoảng tháng Sáu tới tháng Tám; khai giảng ngày năm tháng Chín; bánh chưng gói lá dong; viết hoa tên tháng VI; dùng "tháng Một" cho dương lịch (không "tháng Giêng").

**Thẻ thưởng**
> [CẦN KIỂM] Tên EN "flame tree", "blackboard tree", "yellow apricot blossom"; cách gọi "hoa học trò"; hoa sữa mọc thành chùm hoa nhỏ trắng; quả xoài treo thành chùm trên cây (thay ý "xoài chín vỏ chuyển vàng" 18/11); đèn ông sao năm cánh.

**Chương trình và nguồn**
> [CẦN KIỂM] Nguồn misconception: Vosniadou và Brewer (1994); William Friedman về hiểu biết tháng, mùa theo vòng ở trẻ; nguyên văn mục tiêu bắt buộc Science Year 1 của chương trình Anh (bốn mùa, thời tiết theo mùa, độ dài ngày); tháng trong năm ở Toán Year 1 (Anh) và Toán lớp một, hai (Việt Nam); SGK Tự nhiên và Xã hội lớp hai (CT GDPT 2018) dạy các mùa thế nào.

### Lỗi hay gặp

Đọc mười bốn mục "Lỗi hay gặp" ở `content/explorer/noi-song-tren-trai-dat/_topic.md` trước khi viết. Thêm cho chủ đề này:

15. Không câu nào bảo bé nhìn Mặt Trời, kể cả `hint` ("Look at the sky" chỉ được khi ảnh là bầu trời không có Mặt Trời chói; ưu tiên "Think of…").
16. Tên tháng chỉ ở ví dụ ô Học bài 5, ý chính hai và câu q6 bài 5; `hint`, `feedback`, giải thích không nói tên tháng.
17. Grep chữ bé nghe trước khi nộp: 0 kết quả "bão", "lũ", "hạn hán", "sét", "storm", "flood", "drought", "lightning", "nhiệt kế", "thermometer", "gần Mặt Trời", "closer to the Sun", "nghiêng", "tilt", "khí hậu", "climate", "mùa hạ", "cả nước", "âm lịch", "lịch âm", "lunar", "tháng Giêng", "birthday", "sinh nhật", "Christmas", "Giáng sinh". Chú ý chữ "nghiêng" trong VI (ví dụ "nắng nghiêng", "cây nghiêng"): không dùng.
18. Câu lựa chọn là mùa hay dịp: `label` gọi tên mùa, dịp; `feedback` nói về dấu hiệu trên ảnh bé chọn ("Flame trees bloom in summer." · "Hoa phượng nở vào mùa hè."), không nói tên đáp án đúng. Ngoại lệ có chủ ý: bài 2 q5 lựa chọn mùa đông công nhận "Tết có thể còn rét" rồi nói "mùa đông đã qua" (rà chữ g2, 17/11).
19. Câu `order_sequence` về mùa, mốc trong năm: `prompt` nêu thẻ đầu; `hint` chỉ nhắc một mốc hay một cách nghĩ, không gọi tên cả ba.

### Đề xuất cho người khác (biên tập không sửa vùng này)

- **phiên chính / content-editor lượt sau:** sửa các ghi chú cũ (dòng `>` hay mục Ghi chú, không phải chữ bé nghe) còn trỏ tới hai chủ đề mùa đã bỏ, đổi thành "chủ đề mới #5 *Thời tiết và các mùa*": `content/explorer/goi-ten-va-nhom-dong-vat/_topic.md:339`; `content/explorer/sinh-vat-song-o-dau/_topic.md:350`, `03-dang-song-da-chet-chua-tung-song.md:400`; `content/explorer/noi-song-tren-trai-dat/_topic.md:194, 713`, `02-nam-cuc.md:23`, `06-dong-co-xavan.md:33, 93, 611`; `content/discoverer/thoi-tiet-va-thien-tai/_topic.md:308`. **Đã sửa 17/11** (content-editor lượt soạn bài 5–6).
- **designer:**
  1. `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song` `q4_yellow`: ảnh gốc là lá vàng phủ tuyết (Na Uy, đã crop bỏ tuyết). Chủ đề này dùng nó cho mùa thu (bài 2, 3, 6) và trong hình ghép bốn mùa, mà bài 3 sửa `winter_means_snow`; tên ảnh ở màn "Nguồn hình" vẫn có chữ "snowy". Đề xuất tìm ảnh lá vàng không tuyết làm mục mới cho chủ đề này (giữ key chỗ dùng), hoặc PM xác nhận giữ. **Đã xong 17/11–18/11:** ảnh mới, gốc ở bài 3 `q4_yellow`.
  2. Nón lá `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha` `w1_hat` là ảnh "Nón lá đồ chơi": kiểm trên kệ Chơi (1:1) có trông như nón thật không.
  3. Ảnh khó: phố mùa đông Hà Nội không tuyết, người ở xa (`explore_winter`); phố mưa miền Nam (`explore_rainy_season`); bánh chưng không bao bì; hoa mai đúng loài *Ochna integerrima*, không lẫn hoa đào, không lẫn mai chiếu thuỷ; đèn ông sao không trẻ nhìn rõ mặt; mây đen không sét; con ve trên thân cây.
  4. Một hình vẽ (`explore_months`), ba hình ghép (`explore_seasons`, `explore_south`, `explore_clothes`), ghi mục `composed` đủ ghi công từng phần.
- **PM:** (1) xác nhận các chỗ lệch ở mục "Lệch so với đề xuất PM" (đổi ý chính một bài 1, bỏ ô gió; đổi `calendar` → `festival`, `shower` → `dark_cloud`; bỏ cặp ruộng xanh, ruộng gặt); (2) chép danh sách `[CẦN KIỂM]` mục "Đúng khoa học" vào SK-050 (**đã chép 17/11**, content-editor, mục "content-editor 17/11 · sửa sau rà chữ" của ticket); (3) xác nhận bài 2 q5 (Tết là mùa xuân) chấp nhận được khi Tết ở Hà Nội thường còn lạnh.
- **ios-dev:** không khoá mới (`set: weather` đã có).

### Còn mở (chờ PM hoặc Duy)

1. Ý chính một bài 1 đổi "windy" thành "cloudy", bỏ ô gió: PM xác nhận.
2. Bài 2 q5 "It is Tet. Which season is it?" (đáp án mùa xuân): người chuyên môn xác nhận cách nói "Tết là mùa xuân" cho trẻ khi Tết ở miền Bắc thường còn rét. Từ 17/11 `feedback` của lựa chọn mùa đông là "Tet can be cold, but winter is over." · "Tết có thể còn rét, nhưng mùa đông đã qua." (rà chữ g2); nếu chuyên môn đổi đáp án hay bỏ câu thì sửa cả `feedback` này.
3. ~~Bài 4 q4 `order_sequence` ba ảnh từ ba nơi: giữ hay đổi thành `single_choice`.~~ **Đã đóng 18/11:** phiên chính chọn `single_choice` (vũng nước ✓, mây đen).
4. Bài 4 ô "Rice fields" và cách nói "mưa làm ruộng lúa xanh tốt": người chuyên môn kiểm.
5. Bài 5 từ `festival` thay `calendar`: PM xác nhận, hay cho tự vẽ một tờ lịch không chữ số.
6. ~~Ảnh `q4_yellow` (gốc có tuyết): giữ hay thay.~~ **Đã đóng 18/11:** thay bằng ảnh lá vàng mới, gốc ở bài 3 `q4_yellow`.
7. Tên EN cần người chuyên môn chốt: flame tree, yellow apricot blossom, blackboard tree, Tet, banh chung.
