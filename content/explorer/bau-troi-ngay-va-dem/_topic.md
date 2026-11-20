---
id: 87892746-4720-430b-93f8-532096a25fce
slug: bau-troi-ngay-va-dem
age_group: explorer
order: 10
strand: earth_sky
level: 1
difficulty:
  abstraction: 1
  prior_knowledge: 1
  misconception: 1
  vocabulary: 2
  science_skill: 1
prerequisites: [thoi-tiet-va-cac-mua, co-the-cua-em]
is_free: false
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: The sky by day and night
vi: Bầu trời ngày và đêm
> Giữ đúng tên ở `content/syllabus.json` (key `new-sky-day-and-night`, Explorer số mười sau SK-061). `id` để trống: phiên chính gắn `topic_id` của danh mục khi chạy `ids`.

## Câu hỏi lớn
en: What can we see when we look up?
vi: Ngước lên trời, em thấy gì?
> Tám từ EN, đúng câu gợi ý của SK-061. Bài 1 Mặt Trời (và an toàn mắt); bài 2 ngày và đêm; bài 3 một ngày đi qua (mọc, trưa, lặn); bài 4 Mặt Trăng; bài 5 các vì sao; bài 6 ôn cả chủ đề, thêm ý gần và xa.

## Misconceptions

### safe_to_look_at_sun
id: 701311d9-73d0-4c56-9402-ed3cba2a71f6
statement.en: It is safe to look at the Sun.
statement.vi: Nhìn thẳng vào Mặt Trời là an toàn.
correction.en: Never look right at the Sun. It hurts your eyes.
correction.vi: Không bao giờ nhìn thẳng vào Mặt Trời, mắt sẽ bị đau.
note: Dạy ở bài 1: ý chính ba, ô Học Keep eyes safe, câu q6 gắn key ("It is safe to look at the Sun.", Sai, hình nắng xuyên tán lá `explore_light`). Bài 5 w3 ôn lại ("Bright sunshine can hurt our eyes.", Đúng); bài 6 ô Day sky nhắc lại ở ví dụ. Câu gợi ý của ticket "It is OK to look at the Sun." đổi "OK" thành "safe" (luật không chữ viết tắt). Không dùng `sun_gone_when_cloudy` (đã có ở #5 bài 1; chỉ ôn ở Khởi động bài 1). Nháp AI 19/11/2026.
> [CẦN KIỂM] Nhìn thẳng vào Mặt Trời làm hại mắt (bỏng võng mạc), kể cả khi đeo kính râm thường. Câu "kể cả khi đeo kính râm" chỉ có ở một ví dụ ô Học bài 1; không nói gì về ống nhòm, kính lúp. Quan niệm có ở trẻ: trẻ hay nhìn thử Mặt Trời "một chút" khi chơi ngoài trời.

### everyone_sleeps_at_night
id: eba4c80f-d96c-4d96-94fb-051b5a75a687
statement.en: All animals sleep at night.
statement.vi: Con vật nào cũng ngủ vào ban đêm.
correction.en: Some animals sleep by day, wake at night.
correction.vi: Có con vật ngủ ban ngày, thức ban đêm.
note: Dạy ở bài 2: ý chính ba, ô Học Night animals, kệ Chơi (cú, dơi, đom đóm; bẫy gà trống, bướm, các bạn nhỏ đi bộ ban ngày), câu q3, câu q6 gắn key ("All animals sleep at night.", Sai, hình con cú `explore_owl`, ảnh mới lượt 4). Bài 6 w2 ôn lại ("Owls sleep all night long.", Sai). Nháp AI 19/11/2026.
> [CẦN KIỂM] Cú (phần lớn loài), dơi kiếm ăn ban đêm, ban ngày nghỉ; đom đóm phát sáng ban đêm; gà, bướm hoạt động ban ngày. Quan niệm: trẻ lấy giờ ngủ của mình áp cho mọi con vật (suy luận của biên tập, chưa có nghiên cứu dẫn).

### sun_stays_still
id: 969b426c-165a-4d61-9f95-021fe254645d
statement.en: The Sun stays in one place all day.
statement.vi: Mặt Trời đứng yên một chỗ suốt cả ngày.
correction.en: The Sun rises, climbs high, then sets.
correction.vi: Mặt Trời mọc, lên cao, rồi lặn.
note: Dạy ở bài 3: ý chính một tới ba, ba ô Học Sunrise, Noon, Sunset, câu q4 xếp sáng → trưa → chiều tối, câu q6 gắn key ("The Sun stays in one place all day.", Sai, hình bình minh `explore_sunrise`). Chỉ nói "mọc, lên cao, lặn" như lời thường ngày; không nói Mặt Trời hay Trái Đất chuyển động (Discoverer #7). Nháp AI 19/11/2026.
> [CẦN KIỂM] Quan niệm: trẻ nhỏ ít để ý Mặt Trời ở chỗ khác nhau trong ngày (suy luận của biên tập). Người chuyên môn xem câu `correction` "climbs high" có làm trẻ nghĩ Mặt Trời tự đi lên không; đây là cách nói thường ngày, như "Mặt Trời lên cao".

### moon_only_at_night
id: 040b8192-3d7e-4e2f-bf81-0cca0c4f10cf
statement.en: We can only see the Moon at night.
statement.vi: Chỉ ban đêm mới thấy được trăng.
correction.en: Sometimes we see the Moon by day, too.
correction.vi: Có hôm, ban ngày mình cũng thấy trăng.
note: Dạy ở bài 4: ý chính ba, ô Học Moon by day, câu q6 gắn key ("We can only see the Moon at night.", Sai, hình trăng trên trời xanh `explore_day_moon`). Thẻ thưởng bài 6 `day_moon_card` nhắc lại. Không nói vì sao (Discoverer #7 bài 4). Nháp AI 19/11/2026.
> [CẦN KIỂM] Có những ngày thấy trăng trên trời xanh (buổi sáng hoặc buổi chiều, nhiều ngày trong tháng). Quan niệm này có trong các danh sách quan niệm sai về Mặt Trăng của trẻ tiểu học.

### stars_are_tiny
id: ab901158-c958-4c84-b656-e65373108d50
statement.en: Stars are tiny, like little sparkles.
statement.vi: Sao bé tí, như những đốm lấp lánh.
correction.en: Stars are big, but very far away.
correction.vi: Sao rất to, nhưng ở rất xa.
note: Dạy ở bài 5: ý chính ba, ô Học Very far, câu q4, câu q6 gắn key ("Stars are tiny, like little sparkles.", Sai, hình trời sao `explore_starry`). Bài 6 ô Far away, câu q5 ôn lại. Chỉ mô tả khoảng cách, không nói sao là "mặt trời ở xa" (Discoverer #7). EN không dùng "because" (chữ cấm); VI không dùng "vì". Nháp AI 19/11/2026.
> [CẦN KIỂM] Sao rất to (nhiều sao to hơn Mặt Trời) nhưng ở rất xa, nên trông như chấm sáng. Quan niệm "sao nhỏ xíu" có trong nghiên cứu quan niệm thiên văn của trẻ (nguồn cụ thể chưa tra).

### moon_follows_me
id: 586ea5a4-26cd-4fef-91b1-2e1d0b0066dd
statement.en: The Moon follows me when I walk.
statement.vi: Mặt Trăng đi theo em khi em đi.
correction.en: The Moon is far; we see it everywhere.
correction.vi: Mặt Trăng ở rất xa nên em đi đâu cũng thấy.
note: Dạy ở bài 6: ý chính ba, ô Học Far away (ví dụ "far away, so we see it everywhere"), câu q4 (gần tới xa), câu q6 gắn key ("The Moon follows me when I walk.", Sai, hình trăng tròn `explore_full` của bài 4). Nháp AI 19/11/2026.
> [CẦN KIỂM] Quan niệm "trăng đi theo mình" là ví dụ kinh điển về tư duy của trẻ nhỏ (Piaget); người chuyên môn xác nhận nguồn. Câu `correction` có dấu chấm phẩy để đủ ý trong tám từ; người duyệt nghe thử giọng EN đọc chỗ ngắt.

## Ghi chú

> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 19/11/2026. Ticket SK-061. Lượt này viết `_topic.md` và sáu bài; sửa ghi chú (không đổi chữ bé nghe) ở `content/explorer/nui-song-va-bien/`.
> Mọi dòng `id:` để trống, kể cả frontmatter chủ đề và bài (danh mục chưa có `topic_id`, `lesson_id` cho chủ đề này). Thứ tự chạy `ids`: file này trước, rồi bài 1 tới bài 6 đúng thứ tự. Khởi động bài sau trỏ bài trước của chủ đề này; các câu ôn chủ đề khác trỏ sang *Thời tiết và các mùa*, *Cây quanh em*, *Chuỗi thức ăn*, *Cơ thể của em*, đều đã có id.
> Trong mục Ghi chú, số bài viết bằng chữ số cho dễ tra (máy không đọc mục này). Mọi chữ trẻ đọc hay nghe vẫn viết số bằng chữ.

### Nguồn

- **Chủ đề mới, không bám Oak** (`source.kind: new`, mỗi bài `oak_lessons: []`, `statutory: false`, không dòng `oak_unit_ref`). Danh mục, sáu bài và khuyến nghị ở SK-061 (PM chốt 19/11, chế độ auto; Duy: "start làm luôn, ko cần confirm lại").
- Mức Explorer là **thấy** (bản rà `docs/syllabus-review-2026-11-18.md` mục 2, 3.3): gọi tên, nhận ra, nói điều nhìn thấy. Không câu "tại sao", "why", "because"; không giải thích cơ chế (Trái Đất quay, vì sao trăng đổi hình).
- Luật Explorer: `content/rules.json` (`explorer.authoring`), `content/TEMPLATE.md` (bảy luật Explorer, mục SK-044, mục SK-047). Khuôn: `content/explorer/nui-song-va-bien/` (SK-058), `content/explorer/lon-len/` (SK-053). Kệ Chơi theo SK-059 (chạm xem to, giữ rồi kéo vào giỏ): mỗi kệ đúng sáu món để iPhone xếp hai cột ảnh to.

### Frontmatter

- **`order: 10`, `strand: earth_sky`, `level: 1`** theo SK-061 (A1, quyết định 6). `is_free: false`, `sensitive: false`.
- **`prerequisites: [thoi-tiet-va-cac-mua, co-the-cua-em]`** theo gợi ý SK-061 (Mặt Trời sau mây, ngày nắng; mắt nhìn).
- **`difficulty` 1-1-1-2-1 = sáu điểm (Mức 1)**, khớp `level: 1` và điểm tạm của PM:
  - A = 1: Mặt Trời, trăng, sao, ngày, đêm là thứ bé thấy hằng ngày.
  - B = 1: chỉ cần trải nghiệm đời sống; *Thời tiết và các mùa* có ích nhưng bài không dựa vào.
  - C = 1: sáu quan niệm sai đều sửa được bằng hình hoặc trải nghiệm. `moon_follows_me` là quan niệm khá bền ở trẻ nhỏ; nếu người chuyên môn xếp là "cứng đầu" thì C = 2, bảy điểm, vẫn Mức 1.
  - D = 2: từ dễ (sun, moon, star, day, night, sky) cộng vài từ mới (sunrise, sunset, twinkle, crescent).
  - E = 1: quan sát, gọi tên, phân loại; hai câu xếp thứ tự (sáng → trưa → chiều tối; trăng mảnh → tròn), một câu gần → xa; không đo, không thí nghiệm.
  - Chấm lại khi soạn: giữ `level: 1`, không đề xuất đổi.

### Tổng quan sáu bài

| Bài · file | `stage` | Ý chính (EN · VI) | Key q6 · format · đáp án | Từ `core` · `extra` | Thẻ thưởng |
| --- | --- | --- | --- | --- | --- |
| 1 · `01-mat-troi-cho-anh-sang-va-hoi-am.md` | `opener` | The Sun gives us light by day. · Ban ngày, Mặt Trời cho mình ánh sáng. / Sunshine keeps us warm and dries things. · Nắng sưởi ấm mình và phơi khô đồ. / Never look right at the Sun. · Không bao giờ nhìn thẳng vào Mặt Trời. | `safe_to_look_at_sun` · TF · Sai | sun, sunshine · bright, warmth | `sun_card` Mặt Trời |
| 2 · `02-ngay-va-dem.md` | `core` | By day, the sky is bright. · Ban ngày, bầu trời sáng. / At night, the sky is dark. · Ban đêm, bầu trời tối. / Some animals wake up at night. · Có con vật thức dậy vào ban đêm. | `everyone_sleeps_at_night` · TF · Sai | day, night · owl, awake | `night_sky_card` Bầu trời đêm |
| 3 · `03-mat-troi-moc-mat-troi-lan.md` | `core` | In the morning, the Sun rises. · Buổi sáng, Mặt Trời mọc. / At noon, the Sun is high. Sunshine is strong. · Buổi trưa, Mặt Trời lên cao, nắng gắt. / In the evening, the Sun sets. · Chiều tối, Mặt Trời lặn. | `sun_stays_still` · TF · Sai | sunrise, sunset · morning, evening | `sunrise_card` Bình minh |
| 4 · `04-mat-trang-doi-hinh.md` | `core` | Some nights, the Moon is round. · Có đêm, trăng tròn vành vạnh. / Some nights, the Moon is thin. · Có đêm, trăng mảnh như lưỡi liềm. / We can see the Moon by day, too. · Có hôm, ban ngày mình cũng thấy trăng. | `moon_only_at_night` · TF · Sai | moon, full_moon · crescent, lantern | `mid_autumn_moon_card` Trăng Trung thu (rare) |
| 5 · `05-cac-vi-sao.md` | `core` | On clear nights, we see many stars. · Đêm trời quang, mình thấy nhiều sao. / Stars twinkle and look very small. · Sao lấp lánh và trông rất nhỏ. / Stars are big, but very far away. · Sao rất to, nhưng ở rất xa. | `stars_are_tiny` · TF · Sai | star, twinkle · far, countryside | `starry_sky_card` Bầu trời sao |
| 6 · `06-tren-bau-troi-co-gi.md` | `review` | By day, we see the Sun and clouds. · Ban ngày, mình thấy Mặt Trời và mây. / At night, we see the Moon and stars. · Ban đêm, mình thấy trăng và sao. / Kites fly near. The Moon is far. · Diều bay gần. Mặt Trăng ở rất xa. | `moon_follows_me` · TF · Sai | sky, near · cloud, kite | `day_moon_card` Trăng ban ngày (rare) |

- Tên bài EN · VI khớp bảng Phần B của SK-061 từng chữ: The Sun gives light and warmth · Mặt Trời cho ánh sáng và hơi ấm (`mat-troi-cho-anh-sang-va-hoi-am`); Day and night · Ngày và đêm (`ngay-va-dem`); Sunrise and sunset · Mặt Trời mọc, Mặt Trời lặn (`mat-troi-moc-mat-troi-lan`); The Moon changes shape · Mặt Trăng đổi hình (`mat-trang-doi-hinh`); The stars · Các vì sao (`cac-vi-sao`); What is in the sky? · Trên bầu trời có gì? (`tren-bau-troi-co-gi`). Slug bài do content-editor đặt.
- **Lưu ý:** lúc soạn (19/11), `content/syllabus.json` vẫn là bản trước SK-061 (số 11, `level` 2, bài 3 "Shadows change in the day", bài 6 "The Earth is a big ball"). Bài 3, bài 6 ở đây theo tên mới của ticket; dev đổi danh mục (Phần A1) thì tên khớp.
- Mục tiêu "I can…" tối đa tám từ: bài 1 "I can say what the Sun gives us."; bài 2 "I can tell day and night apart."; bài 3 "I can tell sunrise from sunset."; bài 4 "I can spot full and thin Moons."; bài 5 "I can say what stars look like."; bài 6 "I can name things in the sky." (lượt 2, tester C1: hai câu bài 3, bài 6 rút từ chín từ xuống).
- Sáu câu q6 là `true_false` đáp án Sai, câu khẳng định, để bước Tổng kết (SK-047) có thẻ "Ý sai → Ý đúng". `explanation_correct` của sáu câu này đúng câu `correction` ở mục Misconceptions, đứng một mình.
- Không có câu lời Na (Explorer). `est_minutes: 6` cả sáu bài.

### Ghép ý chính với ô Học (`KeyPointPictures.match`)

Tính tay theo `LessonRecap.swift` (chữ thường, bỏ từ hai chữ cái trở xuống và từ dừng, cắt đuôi `ies`/`es`/`s`/`ed`/`ing`, cắt `e` cuối). Mỗi bài, ý i ghép ô i (cùng thứ tự); ô bốn không ghép. Người sửa câu ý chính hay câu chính ô Học tính lại.

| Bài | Ý 1 → ô (điểm) | Ý 2 → ô (điểm) | Ý 3 → ô (điểm) | Ô không ghép |
| --- | --- | --- | --- | --- |
| 1 | Light (sun, light, day = 3) | Warm sunshine (sunshin, warm, dri = 3) | Keep eyes safe (never, look, right, sun = 4) | Plants need sun |
| 2 | Day (day, sky, bright = 3) | Night (night, sky, dark = 3) | Night animals (animal, wak, night = 3) | Bedtime |
| 3 | Sunrise (morn, sun, ris = 3) | Noon (noon, sun, high = 3) | Sunset (even, sun, set = 3) | Lights on |
| 4 | Full Moon (moon, round = 2) | Thin Moon (thin, moon = 2) | Moon by day (see, moon, day = 3) | Mid-Autumn (moon, round = 2 với ý 1, hoà, thua ô cùng thứ tự) |
| 5 | Starry night (clear, night, star = 3) | Twinkle (star, twinkl, look, small = 4) | Very far (star, big, far, away = 4) | City lights (mỗi ý chỉ chung "star" = 1) |
| 6 | Day sky (day, see, sun, cloud = 4) | Night sky (night, see, moon, star = 4) | Near us (kit, fly, near = 3) | Far away (ý 2 được moon, star = 2; ý 3 được moon, far = 2; đều thua ô cùng thứ tự) |

### Khuôn chung mỗi bài

- **Frontmatter bài:** `topic: bau-troi-ngay-va-dem`, `slug`, `order`, `stage` theo bảng Tổng quan, `est_minutes: 6`, `sensitive: false`, `archived: false`, `ai_draft: true`; `id:` để trống.
- **Khởi động:** hai câu (bài 5, 6 ba câu), DOK 1, chỉ `single_choice` hai lựa chọn và `true_false`. Mỗi câu `recall_from.kind: lesson`. Mọi câu có hình ở câu hỏi; mọi lựa chọn có hình.
- **Học:** một `explore_groups` bốn ô (`prompt` "Tap each picture" · "Chạm từng hình", `complete_when: all_seen`), mỗi ô một câu chính và ba ví dụ, mỗi câu EN tối đa tám từ; một `word_list` (`title` "New words" · "Từ mới") gồm đúng các từ `core`. Câu chính ô Học không mở đầu bằng "It".
- **Chơi:** một `build_tray`, `capacity: 3`, `success_when: all_required_and_no_limit`, nhóm `required` (bài 1 ba nhóm, bài 2 ba nhóm, bài 3 tới 6 hai nhóm), một nhóm `limit` màu `do_son`. Kệ sáu món (bài 3 thêm món bẫy thứ hai ở lượt 2), nhóm bẫy mỗi kệ có ít nhất hai món, để kệ hai cột trên iPhone (SK-059, Duy chốt: ≤ 6 món thì hai cột). Mỗi kệ một kiểu hình: bài 1, 2, 4, 5 ảnh chụp; bài 3 (từ lượt 4) và bài 6 hình vẽ giấy cắt cả kệ. `messages.full` chung: "No more room! Tap one to take it off." · "Hết chỗ rồi! Em chạm vào để bỏ ra nhé." (SK-059 mục C: còn đúng với tương tác mới).
- **Quiz:** sáu câu, DOK 1·1·1·2·2·2; câu 6 là câu misconception `true_false` Sai. Bài 1, 2, 5 hai format (`single_choice`, `true_false`); bài 3, 4, 6 ba format (thêm `order_sequence` ở q4).
- **Hình câu `single_choice` và `order_sequence`:** hàng rào tre trung tính `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha` (SK-043: app Explorer ẩn hình câu hỏi khi mọi lựa chọn có hình). `prompt` tự đủ nghĩa khi chỉ nghe.
- **Từ vựng:** bốn từ, hai `core` (vào `word_list`), hai `extra`.
- **Thưởng:** một thẻ mỗi bài, **bộ mới `set: sky`** "Sky cards" · "Thẻ bầu trời" (SK-061 quyết định 9), key có đuôi `_card`.

### Tên gọi thống nhất cả chủ đề

Đổi một tên thì đổi đồng bộ cả sáu bài và file này.

| Khái niệm | EN | VI | Ghi chú |
| --- | --- | --- | --- |
| Mặt Trời | the Sun | Mặt Trời | Viết hoa như *Thời tiết và các mùa*. "sun" thường chỉ ở cụm "in the sun", "sun hat" (ra nắng) |
| nắng | sunshine | nắng; ánh nắng | Từ `core` bài 1 |
| Mặt Trăng · trăng | the Moon | Mặt Trăng; trăng; vầng trăng | Viết hoa "Moon" mọi chỗ, kể cả "full Moon", "thin Moon" |
| trăng tròn | full Moon; round Moon | trăng tròn | Không "trăng rằm" trong chữ bé nghe (*Thời tiết và các mùa* đã chốt: không âm lịch, không ngày rằm) |
| trăng lưỡi liềm | thin Moon; crescent Moon | trăng lưỡi liềm; trăng mảnh | "crescent" là từ `extra` bài 4. Nhãn nhóm Chơi bài 4 "Thin Moon" · "Trăng lưỡi liềm" |
| nửa vầng trăng | half Moon | nửa vầng trăng | Chỉ ở câu q4 bài 4 và một ví dụ |
| sao | star; stars | ngôi sao; các vì sao; sao | "vì sao" chỉ trong "các vì sao", "những vì sao". Không Sao Mai, Sao Hôm |
| lấp lánh | twinkle | lấp lánh | Từ `core` bài 5 |
| ban ngày · ban đêm | day; by day; in the day · night; at night | ban ngày · ban đêm | Từ `core` bài 2 |
| buổi sáng · trưa · chiều tối | morning · noon; midday · evening | buổi sáng · buổi trưa · chiều tối | "evening" luôn là "chiều tối" (không "buổi tối"), cho khớp cảnh Mặt Trời lặn |
| Mặt Trời mọc · lặn | sunrise; the Sun rises · sunset; the Sun sets | Mặt Trời mọc; bình minh · Mặt Trời lặn; hoàng hôn | "lên cao" cho buổi trưa. Không "move", "spin", "quay", "di chuyển" |
| bầu trời | sky | bầu trời; trời | Từ `core` bài 6 |
| gần · xa | near · far; far away | gần · xa; rất xa; tít xa | "near" `core` bài 6; "far" `extra` bài 5 |
| Trung thu | Mid-Autumn | Trung thu | Chỉ là dịp quen; không lịch âm, không "rằm tháng Tám" |
| người lớn | a grown-up | người lớn | Câu "ngắm sao cùng người lớn" bài 5, 6 |

- **Đọc bằng máy:** nghe thử EN "Mid-Autumn", "crescent", "twinkle", "countryside", "stargazing", "mooncakes", "hair dryer"; VI "lưỡi liềm", "lấp lánh", "vành vạnh", "chạng vạng", "lập loè", "bánh trung thu".
- **Chuỗi `.en` không có dấu tiếng Việt.** VI không ký hiệu, không chữ số, không viết tắt.

### Ranh giới, chữ cấm (SK-061 khuyến nghị 1, 2 và Ngoài phạm vi)

- **Không giải thích cơ chế:** vì sao có ngày và đêm, Trái Đất quay, Mặt Trời là một ngôi sao (Discoverer #7 bài 1–3); vì sao trăng đổi hình, lịch âm, tên các pha (Discoverer #7 bài 4); hành tinh, sao chổi, sao băng, nhật thực, nguyệt thực (Discoverer #7); bóng, bóng đổi theo giờ (Discoverer #12 bài 5–6); Trái Đất là quả cầu (Discoverer #7 bài 1, Scientist #1); trọng lực, mùa, thuỷ triều (Scientist #1); chòm sao, Ngân Hà, kính thiên văn, du hành vũ trụ (Scientist #2). Mây, mưa, nắng nóng, các mùa: Explorer #5 (chỉ ôn ở Khởi động).
- **Chữ cấm trong chữ bé nghe (EN, VI; không tính dòng `>`, `brief`, `note`, mục Ghi chú):** "spin", "rotate", "orbit", "quay", "quỹ đạo", "tự quay"; "planet", "hành tinh", "phase", "pha", "gravity", "trọng lực", "eclipse", "nhật thực", "nguyệt thực", "comet", "sao chổi", "shooting star", "sao băng", "constellation", "chòm sao", "galaxy", "Ngân Hà", "telescope", "kính thiên văn", "astronaut", "phi hành gia"; "Earth", "Trái Đất", "globe", "quả địa cầu", "map", "bản đồ"; "shadow", "bóng nắng" (tránh luôn mọi chữ "bóng": không "bóng tối", "quả bóng", "bóng đèn"); "east", "west", "phía đông", "phía tây"; "why", "because", "tại sao"; "vì sao" chỉ trong "các vì sao", "những vì sao". Không Sao Mai, Sao Hôm, tử vi, "sao chiếu mệnh", chú Cuội, thỏ ngọc.
- Câu "Stars are big, but very far away." (bài 5) và "The Moon is far; we see it everywhere." (bài 6) chỉ mô tả khoảng cách (khuyến nghị 1), không nói thêm.
- **Với *Thời tiết và các mùa* (#5):** bài 1 ôn `sun_gone_when_cloudy` ở w1 (không làm lại key); "wear a hat outside" là ví dụ; không mùa, không mưa. Bài 6 dùng lại ảnh `explore_cloudy`.
- **Với *Cây quanh em* (#7):** bài 1 ô "Plants need sun" chỉ nói cây lớn tốt nhờ nắng; không quang hợp.
- **Với *Chuỗi thức ăn* (#3):** cú chỉ là con vật thức đêm; không làm lại "cú bắt chuột" ngoài w2 bài 2 và một ví dụ.

### An toàn (khuyến nghị 3)

- **"Không nhìn thẳng vào Mặt Trời"**: ý chính ba bài 1, ô Học Keep eyes safe bài 1, câu q6 bài 1 (`safe_to_look_at_sun`), ô Học Day sky bài 6 (ví dụ một), Khởi động w3 bài 5 ("Bright sunshine can hurt our eyes.").
- **"Ngắm sao cùng người lớn"**: chỉ ở ví dụ ô Học (bài 5 ô Very far, bài 6 ô Night sky), không thành câu quiz.
- Kính râm: chỉ một ví dụ bài 1 "even with sunglasses on" · "kể cả khi đeo kính râm" `[CẦN KIỂM]`. Không nhắc ống nhòm, kính lúp.
- Không trẻ ở ngoài một mình ban đêm (chữ và ảnh). Ảnh ngắm sao có người lớn hoặc không có người. Pháo hoa chỉ là món bẫy bài 5 (ảnh không người).

### Quy ước hình cả chủ đề (SK-061 khuyến nghị designer 1–6)

1. **Ảnh chụp thật** (CC0, PD, PDM, CC BY có ghi công; không BY-SA, NC, ND). Không AI, không Pinterest. Ảnh NASA chỉ dùng khi đúng là ảnh của NASA (loại ảnh bên thứ ba đăng lại).
2. **Hình vẽ giấy cắt style E** (không nét viền, màu từ design tokens, mục `own`, `changes: ["drawn"]`, credit "Science Kids"), **ba mươi chỗ hình vẽ** (lượt 3 mười bảy; lượt 4, designer 20/11, thêm mười ba ở bài 3, 4; cộng `star_lantern_card` dùng lại; designer đếm ba mươi hai file kể cả bản cắt khung 2:1, 5:2):
   - bài 1 (vẽ thêm vì không có ảnh hợp lệ): `explore_safe` (bạn nhỏ đội nón lá đi trên đường ruộng, nhìn từ sau; bài 5 w3 dùng lại), `q4_cupboard`, `q4_step`, `q4_bathroom` (cả câu q4; câu q5 dùng lại `q4_cupboard`);
   - bài 2: `explore_day`, `explore_night` (cùng một ngôi nhà, cùng khung cảnh, ban ngày và ban đêm; ô Học, câu q1, q2, q5, bài 3 w1);
   - bài 3: `q4_morning`, `q4_noon`, `q4_evening` (cùng ngôi nhà, cánh đồng, ba giờ trong ngày; câu q4); lượt 4 thêm ô Học `explore_noon`, **cả sáu món kệ** (`tray_rooster`, `tray_sunrise`, `tray_streetlights`, `tray_windows`, `tray_noon`, `tray_noon_rest`), ba lựa chọn câu q2 (`q2_rooster`, `q2_noon`, `q2_lights`, bản 5:2) và ba lựa chọn câu q5 (`q5_rooster`, `q5_noon`, `q5_lights`, cùng hình q2) — không có ảnh trưa nắng hợp lệ nên đổi đồng bộ;
   - bài 4 (vẽ thêm): `explore_mid_autumn`, thẻ `mid_autumn_moon_card` (đèn lồng giấy và trăng tròn); lượt 4 thêm ba thẻ câu q4 `q4_thin`, `q4_half`, `q4_full` (cùng nền xanh than, cùng cỡ, cùng màu trăng);
   - bài 5 (vẽ thêm): `explore_far` (người lớn và em nhỏ in đen ngắm sao; bài 6 ô Far away dùng lại);
   - bài 6: cả kệ Chơi `tray_sun`, `tray_rainbow`, `tray_moon`, `tray_stars`, `tray_round_lantern`, cộng `tray_star_lantern` dùng lại hình `star_lantern_card` đã vẽ của *Thời tiết và các mùa* bài 6.
3. **Một câu, một kệ: một kiểu hình.** Kệ bài 1, 2, 4, 5 toàn ảnh; **kệ bài 3 và kệ bài 6 toàn hình vẽ** (bài 3 từ lượt 4). Câu q1 bài 2, câu w1 bài 3 (hai hình vẽ ngày, đêm), câu q2, q4, q5 bài 3 (ba hình vẽ, q2 và q5 từ lượt 4), câu q4 bài 1 (ba hình vẽ, lượt 3) và câu q4 bài 4 (ba hình vẽ, lượt 4) không có ảnh chụp. Ô Học bài 3 có cả ảnh và hình vẽ (`explore_noon`); ô Học không phải câu, không phải kệ. Các hình vẽ thêm khác (`explore_safe`, `explore_mid_autumn`, `explore_far`, `mid_autumn_moon_card`) chỉ đứng một mình: ô Học, câu Đúng/Sai một hình, thẻ từ, thẻ thưởng. Câu **w2 bài 3** (mắt, tai) cũng là hai hình vẽ: dùng lại `explore_see`, `explore_hear` của *Cơ thể của em* bài 4, gốc ở Discoverer `nao-bo-va-giac-quan` là hình vẽ gần thực tế nền kem trơn, **khác nét** giấy cắt style E của chủ đề này (tester n6, lượt 2). Câu vẫn đúng luật một câu một kiểu hình; giữ, không đổi sang ảnh chụp. Mọi câu chọn khác toàn ảnh chụp. Đáp án không là hình vẽ duy nhất giữa các ảnh, và ngược lại.
4. **Không dùng:** bản đồ, quả địa cầu, ảnh Trái Đất từ vũ trụ, hình nét bờ biển Việt Nam; nhật thực, nguyệt thực, kính thiên văn, phi hành gia, cờ trên Mặt Trăng; chòm sao có nối nét hay có chữ; dải Ngân Hà rõ nét (bé dễ hỏi "đó là gì", ngoài phạm vi); ảnh người hoặc trẻ nhìn thẳng vào Mặt Trời; ảnh Mặt Trời chói toàn khung; ảnh Mặt Trời chụp qua kính lọc (quả cầu cam của SDO). Mặt Trời chỉ qua mây, qua tán cây, lúc mọc, lặn, hoặc là một vùng sáng ở mép khung.
5. **Ảnh trăng:** trăng thật trên nền trời; có ảnh trăng ban ngày trên trời xanh (bài 4 `explore_day_moon`, thẻ bài 6). Ảnh Trung thu chỉ đèn lồng và trăng, không mặt người.
6. **Trẻ trong ảnh:** chụp từ phía sau hay xa, không nhận ra mặt; không trẻ ở ngoài một mình ban đêm.
7. **Hai cảnh trong một câu khác nhau rõ bằng mắt** (luật Explorer số bảy). Ảnh bình minh và ảnh hoàng hôn trông gần giống nhau: **không bao giờ đặt hai ảnh này trong cùng một câu hay cùng một kệ**. Kệ bài 3 chỉ có ảnh bình minh (có sương sớm, gà gáy đi kèm), phía chiều tối dùng đèn đường, cửa sổ sáng đèn. Câu xếp sáng → trưa → chiều tối dùng ba hình vẽ cùng khung, có dấu hiệu đời sống (gà gáy, mâm cơm sáng đèn).
8. **Không chữ, không logo** trong mọi hình (đèn lồng, máy sấy, quạt, đèn bàn không nhãn hiệu; không biển hiệu phố).
9. **Không lộ đáp án:** hình câu `single_choice`, `order_sequence` là hàng rào tre; hình câu `true_false` là đúng vật được nói tới; `alt` của lựa chọn đúng không chứa chữ của câu hỏi (vì vậy `alt` gốc đặt sẵn không có tên vật: `explore_light` "Bright rays through green leaves", `explore_full` "A bright white disc in a dark sky", `explore_crescent` "A bright curve of light", `explore_twinkle` "Bright dots on dark purple", `explore_starry` "Countless dots of light above trees", `explore_noon` "A sunny path between fields", `explore_lights` "Yellow lamps under a purple sky", `explore_near` "A paper kite in a blue sky", `explore_sleep` "A bed with a mosquito net").
10. **Khung (SK-043):** thẻ ba lựa chọn 5:2, thẻ hai lựa chọn 17:10, món Chơi và thẻ `order_sequence` vuông, hình câu `true_false` 4:3, thẻ từ 2:1, thẻ thưởng vuông. Ảnh trời nên ngang, chủ thể (trăng, vầng sáng) nằm giữa để crop vuông vẫn còn.
11. **Bối cảnh Việt Nam** khi có ảnh hợp lệ: đường làng, sân phơi thóc, rặng tre, mái ngói, diều sáo, đèn lồng Trung thu.

### Hình dùng chung

**Hình gốc mới trong chủ đề này** (chỉ ghi hình dùng ở nhiều chỗ):

| Key gốc · bài | Nội dung | `alt.en` · `alt.vi` | Dùng ở |
| --- | --- | --- | --- |
| `explore_light` · 1 | nắng xuyên tán lá, đĩa Mặt Trời bị lá che | Bright rays through green leaves · Tia sáng xuyên qua tán lá xanh | 1 (Học, q1, q3, q6, từ `sun`) |
| `explore_warm` · 1 | quần áo phơi trên dây ngoài nắng | Clothes hanging on a line · Quần áo phơi trên dây | 1 (Học, tray, q2) |
| `explore_safe` · 1 | bạn nhỏ đội nón đi dưới nắng, chụp từ phía sau | A child in a sun hat, from behind · Bạn nhỏ đội nón, nhìn từ phía sau | 1 (Học); 5 (w3) |
| `tray_cat` · 1 | mèo nằm duỗi trong vệt nắng | A cat stretched out in bright light · Con mèo nằm duỗi trong vệt sáng | 1 (tray, từ `warmth`); 2 (w1) |
| `tray_rice` · 1 | thóc phơi trên sân | Golden grain spread on a yard · Thóc vàng trải trên sân | 1 (tray, từ `sunshine`); 2 (q4) |
| `explore_day`, `explore_night` · 2 | **hình vẽ** cùng một ngôi nhà ban ngày, ban đêm | A house under a blue, sunny sky · Ngôi nhà dưới trời xanh đầy nắng; The same house under a dark sky · Ngôi nhà ấy dưới trời tối | 2 (Học, q1, q2, q5, từ `day`, `night`); 3 (w1) |
| `tray_firefly_item` · 2 | đom đóm phát sáng ban đêm trên bãi cỏ | Tiny glowing lights over the grass · Những đốm sáng nhỏ trên bãi cỏ | 2 (tray); 5 (tray, q4) |
| `explore_sunrise` · 3 | bình minh trên cánh đồng có sương | A pink sky over misty fields · Trời hồng trên cánh đồng sương | 3 (Học, tray, q1, q6, từ `sunrise`). Không đứng cạnh `explore_sunset` trong một câu, một kệ |
| `explore_sunset` · 3 | hoàng hôn trên sông có đò | An orange sky over a quiet river · Trời cam trên dòng sông lặng | 3 (Học, q3, từ `sunset`); 4 (w1) |
| `explore_plants` · 1 | vườn rau xanh dưới nắng | Rows of green vegetables · Luống rau xanh mướt | 1 (Học, tray, q3); 4 (w2) |
| `explore_noon` · 3 | **hình vẽ** lối đất giữa ruộng trưa nắng (lượt 4) | A sunny path between fields · Lối đất giữa ruộng nắng gắt | 3 (Học, tray, q2, q5) |
| `explore_lights` · 3 | đèn đường vừa bật lúc chạng vạng | Yellow lamps under a purple sky · Đèn vàng dưới trời tím | 3 (Học, tray, q2, q5, từ `evening`); 5 (w2, tray, q4); 6 (w3) |
| `explore_full` · 4 | trăng tròn trắng xám, rõ vệt sẫm, nền trời đêm tối, không cây (lượt 4) | A bright white disc in a dark sky · Đĩa trắng sáng trên trời tối | 4 (Học, tray, q1, từ `moon`, `full_moon`); 5 (tray, w1); 6 (q1, q6). Câu q4 bài 4 từ lượt 4 dùng hình vẽ `q4_full` |
| `explore_crescent` · 4 | trăng lưỡi liềm lúc chạng vạng | A bright curve of light · Vệt sáng cong cong trên trời | 4 (Học, tray, q1, q2, q4, q5, từ `crescent`); 5 (w1) |
| `explore_day_moon` · 4 | trăng trên trời xanh ban ngày | A pale white shape in a blue sky · Vầng trắng mờ trên trời xanh | 4 (Học, q6) |
| `tray_lantern` · 4 | đèn lồng giấy tròn treo | A round paper lantern · Chiếc đèn lồng giấy tròn | 4 (tray, q1, q5, từ `lantern`) |
| `explore_starry` · 5 | trời sao trên rặng cây ở quê | Countless dots of light above trees · Vô số chấm sáng phía trên rặng cây | 5 (Học, tray, q1, q6, từ `twinkle`, `countryside`). Lượt 2: câu q3 dùng ảnh mới `q3_countryside` (tester n4) |
| `explore_twinkle` · 5 | nhiều ngôi sao sáng trên nền trời tím thẫm (lượt 4) | Bright dots on dark purple · Chấm sáng trên nền tím thẫm | 5 (Học, tray, q2, từ `star`); 6 (q5) |
| `explore_far` · 5 | người lớn và em nhỏ ngắm sao, chụp từ phía sau | A grown-up and child gazing upward · Người lớn và em nhỏ ngước nhìn lên trời | 5 (Học, từ `far`); 6 (Học) |
| `explore_city` · 5 | thành phố sáng đèn, trời không sao | A glowing city under an empty sky · Thành phố sáng đèn dưới bầu trời trống | 5 (Học); 6 (w1). Lượt 2: câu q3 bài 5 dùng ảnh mới `q3_town` |
| `night_sky_card` · 2 | trăng trên một thị trấn yên tĩnh (lượt 3, ảnh thật) | A quiet town under the Moon · Thị trấn yên tĩnh dưới trăng | 2 (thẻ); 6 (Học) |
| `explore_near` · 6 | diều nhiều màu trên trời xanh (lượt 3, ảnh thật, không thấy cánh đồng) | A paper kite in a blue sky · Con diều giấy trên trời xanh | 6 (Học, q2, q4, q5, từ `near`, `kite`) |

**Hình của chủ đề khác** (đã mở file nguồn 19/11; `alt` chép đúng gốc):

| Hình gốc | `alt` gốc | Dùng ở |
| --- | --- | --- |
| `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha` `w1` | A bamboo fence in a garden · Hàng rào tre trước khu vườn | hình câu mọi `single_choice`, `order_sequence` |
| `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay` `explore_cloudy` | Sunbeams through the clouds · Tia nắng xuyên qua mây | 1 (w1); 6 (Học, q1, q3, từ `sky`, `cloud`) |
| `cay-quanh-em/cay-can-gi-de-lon` `explore_needs` | A green plant by a sunny window · Chậu cây xanh bên cửa sổ có nắng | 1 (w2) |
| ~~`chuoi-thuc-an/con-vat-kiem-an-the-nao` `explore_hunt`~~ | Từ lượt 4 không dùng; thay bằng hình gốc mới `explore_owl` ở bài 2 (cú sừng mắt vàng, "An owl on a branch" · "Con cú đậu trên cành"), dùng ở bài 2 (Học, tray, w2, q3, q6, từ `owl`), bài 6 (w2, q5) | — |
| `goi-ten-va-nhom-dong-vat/dong-vat-co-vu` `explore_fur` | A white rabbit on the grass · Con thỏ trắng trên cỏ | 2 (w2) |
| `goi-ten-va-nhom-dong-vat/dong-vat-co-vu` `tray_bat` | A bat hanging from a branch · Con dơi treo trên cành | 2 (tray, từ `awake`) |
| `co-the-cua-em/nam-giac-quan-cua-em` `tray_rooster` | A rooster crowing · Con gà trống đang gáy | 2 (tray, q3); 3 (tray, q2, q5, từ `morning`); 6 (w3) |
| `co-the-cua-em/nam-giac-quan-cua-em` `explore_see`, `explore_hear` | An eye · Một con mắt; An ear · Một cái tai | 3 (w2) |
| `lon-len/con-vat-doi-hinh-dang` `q4_butterfly` | A white butterfly on a flower · Con bướm trắng trên bông hoa | 2 (tray, q3) |
| `co-the-cua-em/nam-giac-quan-cua-em` `tray_rainbow` | A rainbow over green fields · Cầu vồng trên cánh đồng xanh | 6 (q1) |
| `thoi-tiet-va-cac-mua/mua-lai-ve` `star_lantern_card` (hình vẽ) | A red paper star lantern · Chiếc đèn ông sao bằng giấy đỏ | 6 (tray, hình vẽ giấy cắt) |

### Khởi động (giãn cách)

| Bài | w1 | w2 | w3 |
| --- | --- | --- | --- |
| 1 | `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay` (#5 bài 1, rất xa), TF "The Sun is behind the clouds." · Đúng | `cay-quanh-em/cay-can-gi-de-lon` (#7 bài 2, rất xa), TF "A plant by a sunny window grows well." · Đúng | — |
| 2 | bài 1 (hôm trước), TF "Cats lie in the sun to keep warm." · Đúng | `chuoi-thuc-an/con-vat-kiem-an-the-nao` (#3 bài 1, rất xa), SC "Which animal hunts mice?" · cú ✓; thỏ | — |
| 3 | bài 2 (hôm trước), SC "Which picture shows day?" · ngày ✓; đêm (hai hình vẽ) | `co-the-cua-em/nam-giac-quan-cua-em` (#6 bài 4, rất xa), SC "Which part helps you see the sky?" · mắt ✓; tai | — |
| 4 | bài 3 (hôm trước), TF "The Sun sets in the evening." · Đúng | bài 1 (cách hai bài), TF "Plants grow best in the dark." · Sai | — |
| 5 | bài 4 (hôm trước), SC "Which one is a thin Moon?" · trăng lưỡi liềm ✓; trăng tròn | bài 3 (cách một bài), TF "Streetlights come on at sunrise." · Sai | bài 1 (cách bốn bài, khoảng một tuần), TF "Bright sunshine can hurt our eyes." · Đúng |
| 6 | bài 5 (hôm trước), TF "City lights hide many stars." · Đúng | bài 2 (cách bốn bài, khoảng một tuần), TF "Owls sleep all night long." · Sai | bài 3 (cách ba bài), SC "What happens early in the morning?" · gà gáy ✓; đèn chiều tối |

- Đủ ba mốc (SK-058 n12): "hôm trước" (bài 2 tới 6), "khoảng một tuần" (bài 5 w3, bài 6 w2), "rất xa" (bài 1, 2, 3 ôn chủ đề #3, #5, #6, #7).
- Bài 6 (`review`) ôn trộn bài 5, 2, 3 ở Khởi động; bài 1, 4 được ôn ở Học (an toàn mắt, trăng), câu q1, q6 và kệ Chơi bài 6.
- Câu ôn chủ đề khác là câu mới, không chép câu cũ: bài 1 w1 khác q6 "On cloudy days, the Sun goes away." của #5 bài 1; bài 2 w2 khác các câu về cú của *Chuỗi thức ăn*; bài 3 w2 khác câu chính "You see with your eyes." của #6 bài 4.

### Phần Chơi sáu bài (`build_tray`)

| Bài | Lệnh | Nhóm bắt buộc (món) · màu | Nhóm `limit` (món bẫy) | Kiểu hình · số món |
| --- | --- | --- | --- | --- |
| 1 | "Find what sunshine helps with" · "Tìm những việc nắng giúp mình" | Dried by the sun · Phơi khô (quần áo, thóc) `vang_hoe`; Helps plants · Giúp cây lớn (vườn rau) `gi_dong`; Keeps warm · Sưởi ấm (mèo sưởi nắng) `nau_dat` | Uses electricity · Chạy bằng điện: đèn bàn, máy sấy tóc | ảnh · 6 |
| 2 | "Find who is awake at night" · "Tìm con vật thức ban đêm" | Big night eyes · Mắt to nhìn đêm (cú) `nau_dat`; Sleeps upside down · Ngủ treo ngược (dơi) `cham`; Glows in the dark · Phát sáng trong đêm (đom đóm) `vang_hoe`. Nhãn là dấu hiệu, không là tên con vật (lượt 2, tester n2) | Awake by day · Thức ban ngày: gà trống, bướm, các bạn nhỏ đi bộ ban ngày | ảnh · 6 |
| 3 | "Find morning and evening" · "Tìm buổi sáng và chiều tối" | Morning · Buổi sáng (gà gáy, bình minh có sương) `vang_hoe`; Evening · Chiều tối (đèn đường, cửa sổ sáng đèn) `cham` | Midday · Buổi trưa: đường làng trưa nắng, bác nông dân nghỉ trưa dưới gốc cây | hình vẽ · 6 (lượt 4) |
| 4 | "Find round and thin Moons" · "Tìm trăng tròn và trăng lưỡi liềm" | Round Moon · Trăng tròn (hai ảnh) `vang_hoe`; Thin Moon · Trăng lưỡi liềm (hai ảnh) `cham` | Near us · Ở gần mình: đèn lồng tròn, quả chuối | ảnh · 6 |
| 5 | "Find what shines far up in the sky" · "Tìm những thứ sáng tít trên bầu trời" | Stars · Các vì sao (hai ảnh) `cham`; Moon · Mặt Trăng (một ảnh) `vang_hoe` | Near us · Ở gần mình: đom đóm, đèn đường, pháo hoa | ảnh · 6 |
| 6 | "Find things in the day and night sky" · "Tìm những thứ trên trời ban ngày và ban đêm" | Day sky · Trời ban ngày (Mặt Trời, cầu vồng) `vang_hoe`; Night sky · Trời ban đêm (trăng, sao) `cham` | Made by people · Do người làm ra: đèn ông sao, đèn lồng tròn | hình vẽ · 6 |

- **Lời nhắn `has_limited`** (đúng với mọi món bẫy của bài): bài 1 "That one uses electricity, not sunshine." · "Cái này chạy bằng điện, không nhờ nắng."; bài 2 "That one is busy in the day." · "Bạn này bận rộn vào ban ngày."; bài 3 "That is midday, when the Sun is high." · "Đó là buổi trưa, lúc Mặt Trời lên cao."; bài 4 "That one is near us, not up high." · "Cái này ở gần mình, không ở tít trên cao." (bài 5 "That light is near us, not far away." · "Ánh sáng đó ở gần mình, không ở rất xa."); bài 6 "People made that one." · "Cái này do người làm ra."
- **Mỗi món bẫy giống một nhóm bắt buộc:** đèn bàn cho ánh sáng, máy sấy tóc làm khô (bài 1); gà, bướm, bạn nhỏ cũng là con vật, con người nhưng thức ban ngày (bài 2); trưa nắng cũng là một buổi trong ngày (bài 3); đèn lồng tròn như trăng tròn, quả chuối cong như trăng lưỡi liềm (bài 4); đom đóm, đèn đường, pháo hoa cũng sáng ban đêm nhưng ở gần (bài 5); đèn ông sao giống ngôi sao, đèn lồng tròn giống trăng (bài 6).
- Một ý một nhãn: "Near us" · "Ở gần mình" giữ đúng chữ ở bài 4, 5 (và ô Học bài 6); "Made by people" · "Do người làm ra" như *Núi, sông và biển*.

### Từ vựng từng bài

| Bài | `core` (vào `word_list`) | `extra` | Hình từ |
| --- | --- | --- | --- |
| 1 | `sun` sun · Mặt Trời; `sunshine` sunshine · nắng | `bright` bright · sáng; `warmth` warmth · hơi ấm | `explore_light`; `tray_rice`; `explore_light`; `tray_cat` |
| 2 | `day` day · ban ngày; `night` night · ban đêm | `owl` owl · con cú; `awake` awake · thức | `explore_day`; `explore_night`; `explore_owl` (lượt 4); `tray_bat` (*Gọi tên và nhóm động vật* bài 2) |
| 3 | `sunrise` sunrise · Mặt Trời mọc; `sunset` sunset · Mặt Trời lặn | `morning` morning · buổi sáng; `evening` evening · chiều tối | `explore_sunrise`; `explore_sunset`; `tray_rooster`; `explore_lights` |
| 4 | `moon` Moon · Mặt Trăng; `full_moon` full Moon · trăng tròn | `crescent` crescent · trăng lưỡi liềm; `lantern` lantern · đèn lồng | `explore_full`; `explore_full`; `explore_crescent`; `tray_lantern` |
| 5 | `star` star · ngôi sao; `twinkle` twinkle · lấp lánh | `far` far · xa; `countryside` countryside · nông thôn, ở quê | `explore_twinkle`; `explore_starry`; `explore_far`; `explore_starry` |
| 6 | `sky` sky · bầu trời; `near` near · gần | `cloud` cloud · đám mây; `kite` kite · con diều | `explore_cloudy` (*Thời tiết và các mùa* bài 1); `explore_near`; `explore_cloudy`; `explore_near` |

- Grep `^### <key>$` trong `content/explorer/` (19/11): không trùng. "light", "warm", "shape", "dark", "sunny", "cloudy", "round", "high", "bat", "bird", "hot", "shade" đã là từ ở chủ đề khác nên không làm lại; vì vậy bài 1 dùng `warmth`, `bright` thay "light", "warm"; bài 2 không lấy "dark"; bài 4 không lấy "shape"; bài 6 lấy "cloud" (khác "cloudy").

### Thẻ thưởng (bộ mới `set: sky`)

Key `sky`, tên "Sky cards" · "Thẻ bầu trời" (SK-061 quyết định 9). ios-dev thêm khoá `collectible.set.sky`.

| Bài | Key · tên EN · VI | `rarity` | `tag` EN · VI | Em có biết? (`fact`) EN · VI | Hình | [CẦN KIỂM] |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | `sun_card` The Sun · Mặt Trời | common | Light and warmth for all · Ánh sáng và hơi ấm cho muôn loài | The Sun is huge, but very far away. · Mặt Trời rất to, nhưng ở rất xa. | ảnh mới, Mặt Trời qua lớp mây mỏng | Mặt Trời to hơn nhiều so với vẻ ngoài |
| 2 | `night_sky_card` Night sky · Bầu trời đêm | common | Quiet and full of lights · Yên tĩnh và lấp lánh | Night is when owls and bats get busy. · Đêm là lúc cú và dơi bận rộn. | ảnh mới, trăng và sao trên làng tối | Cú, dơi hoạt động ban đêm |
| 3 | `sunrise_card` Sunrise · Bình minh | common | A new day begins · Một ngày mới bắt đầu | Roosters often crow before sunrise. · Gà trống thường gáy trước khi Mặt Trời mọc. | hình vẽ mới (20/11): bác nông dân ra đồng lúc bình minh, gà gáy | Gà gáy trước bình minh |
| 4 | `mid_autumn_moon_card` Mid-Autumn Moon · Trăng Trung thu | rare | Round and bright · Tròn và sáng | Families eat mooncakes under this Moon. · Cả nhà ăn bánh trung thu dưới trăng này. | ảnh mới, trăng tròn sau đèn lồng | Trăng Trung thu tròn |
| 5 | `starry_sky_card` Starry sky · Bầu trời sao | common | Lights far, far away · Ánh sáng ở tít xa | On dark nights, we see thousands of stars. · Đêm thật tối, mình thấy được hàng nghìn ngôi sao. | ảnh mới, trời sao trên núi hay đồng quê | Số sao thấy bằng mắt thường |
| 6 | `day_moon_card` Daytime Moon · Trăng ban ngày | rare | Out in the blue sky · Hiện trên trời xanh | Look up some mornings to spot it. · Có buổi sáng, em nhìn lên sẽ thấy trăng. | ảnh mới, trăng lưỡi liềm hay nửa vầng trên trời xanh | Thấy trăng buổi sáng |

- Không trùng thẻ đã có (grep `^### \w+_card` trong `content/` 19/11). Không làm thẻ cú (`owl_card` ở #3), dơi (`bat_card` ở #1), đom đóm (`firefly_card` ở #2), đèn ông sao (`star_lantern_card` ở #5). Ticket gợi ý "Trăng rằm": đổi thành "Trăng Trung thu" theo luật không ngày rằm của #5.

### Đáp án Đúng/Sai

| Bài | Câu `true_false` | Đáp án |
| --- | --- | --- |
| 1 | w1 "The Sun is behind the clouds." | Đúng |
| 1 | w2 "A plant by a sunny window grows well." | Đúng |
| 1 | q2 "Sunshine dries wet clothes." | Đúng |
| 1 | q5 "Plants grow well in a dark cupboard." | Sai |
| 1 | q6 `safe_to_look_at_sun` "It is safe to look at the Sun." | Sai |
| 2 | w1 "Cats lie in the sun to keep warm." | Đúng |
| 2 | q2 "In the day, we see the Sun." | Đúng |
| 2 | q5 "We can see the Sun at night." | Sai |
| 2 | q6 `everyone_sleeps_at_night` "All animals sleep at night." | Sai |
| 3 | q1 "In the morning, the Sun rises." | Đúng |
| 3 | q3 "The sky can turn orange at sunset." | Đúng |
| 3 | q6 `sun_stays_still` "The Sun stays in one place all day." | Sai |
| 4 | w1 "The Sun sets in the evening." | Đúng |
| 4 | w2 "Plants grow best in the dark." | Sai |
| 4 | q2 "A thin Moon looks curved, like a banana." | Đúng |
| 4 | q3 "At Mid-Autumn, the Moon looks round." | Đúng |
| 4 | q6 `moon_only_at_night` "We can only see the Moon at night." | Sai |
| 5 | w2 "Streetlights come on at sunrise." | Sai |
| 5 | w3 "Bright sunshine can hurt our eyes." | Đúng |
| 5 | q2 "Stars twinkle in the night sky." | Đúng |
| 5 | q5 "We see stars best on cloudy nights." | Sai |
| 5 | q6 `stars_are_tiny` "Stars are tiny, like little sparkles." | Sai |
| 6 | w1 "City lights hide many stars." | Đúng |
| 6 | w2 "Owls sleep all night long." | Sai |
| 6 | q2 "A kite flies near us." | Đúng |
| 6 | q3 "Clouds can hide the Sun by day." | Đúng |
| 6 | q6 `moon_follows_me` "The Moon follows me when I walk." | Sai |

- Hai mươi bảy câu: mười lăm Đúng, mười hai Sai. Không tính sáu câu q6: mười lăm Đúng, sáu Sai. Khởi động: chín câu `true_false`, sáu Đúng, ba Sai (bài 4 w2, bài 5 w2 đổi sang Sai ở lượt 2, tester n1; cùng bài 6 w2).
- Không câu nào có "not", "no", "never", "không", "chưa"; "only", "all", "best" là câu khẳng định. Không câu nào có `labels`.
- Câu đáp án Sai: `explanation_correct` không mở đầu "Yes!" · "Đúng rồi!", đứng một mình; `explanation_wrong` mở đầu "This is false." · "Câu này sai."; phản hồi ở `feedback_true`. Câu đáp án Đúng: `explanation_wrong` mở đầu "This is true." · "Câu này đúng."; phản hồi ở `feedback_false`.

### Thứ tự đúng các câu `order_sequence`

| Bài | Câu | Thứ tự đúng | Ghi chú |
| --- | --- | --- | --- |
| 3 | q4 | sáng (`q4_morning`), trưa (`q4_noon`), chiều tối (`q4_evening`) | "Start with the morning."; gợi ý nhắc đầu kia (chiều tối sau cùng). Ba hình vẽ cùng khung |
| 4 | q4 | trăng lưỡi liềm (`q4_thin`), nửa vầng (`q4_half`), trăng tròn (`q4_full`) | "Start with the thinnest Moon."; chỉ xếp theo hình, không gọi tên pha, không nói trăng lớn dần qua các đêm |
| 6 | q4 | diều (`q4_kite`), máy bay (`q4_plane`), Mặt Trăng (`q4_moon`) | "Start with the nearest."; gợi ý nhắc đầu kia (Mặt Trăng xa nhất) |

- Thẻ trong file không nằm sẵn đúng thứ tự.

### Lỗi hay gặp — người viết tự kiểm trước khi nộp

1–25. Như hai mươi lăm mục ở `content/explorer/nui-song-va-bien/_topic.md` (bỏ các mục riêng về tên nơi, địa hình).
26. (mới) Grep chữ bé nghe với danh sách ở mục Ranh giới; riêng "vì sao" chỉ trong "các vì sao", "những vì sao"; không chữ "bóng".
27. (mới) "Không nhìn thẳng vào Mặt Trời" đúng các chỗ ở mục An toàn; "cùng người lớn" chỉ ở ví dụ ô Học.
28. (mới) Ảnh bình minh và ảnh hoàng hôn không cùng một câu, một kệ.

### Đúng khoa học

Mọi ý chưa chắc có dòng `> [CẦN KIỂM]` ngay dưới trường trong bài. Danh sách gộp (phiên chính chép sang "Câu hỏi còn mở" của SK-061):

**Bài 1**
> [CẦN KIỂM] Nhìn thẳng vào Mặt Trời hại mắt, kể cả khi đeo kính râm thường; nắng làm khô quần áo, thóc; cây trong tủ tối lớn kém (*Cây quanh em* đã dạy "lá nhạt màu"); Mặt Trời rất to nhưng ở rất xa; quan niệm `safe_to_look_at_sun`.

**Bài 2**
> [CẦN KIỂM] Cú, dơi, đom đóm thức ban đêm; gà, bướm hoạt động ban ngày; cú nhìn rõ trong đêm (mắt to); quan niệm `everyone_sleeps_at_night`.

**Bài 3**
> [CẦN KIỂM] Gà trống thường gáy trước khi Mặt Trời mọc; buổi trưa Mặt Trời lên cao nhất (giờ trưa thật theo Mặt Trời ở Việt Nam lệch chút với mười hai giờ đồng hồ, bài không nói giờ); trời có thể ửng cam, đỏ lúc hoàng hôn; đèn đường bật lúc chạng vạng; nắng gắt nhất quanh trưa (thực tế nóng nhất thường đầu giờ chiều; chữ bé nghe chỉ nói "nắng gắt", không nói "nóng nhất").

**Bài 4**
> [CẦN KIỂM] Có hôm thấy trăng ban ngày; trăng Trung thu tròn; trên trăng tròn thấy những vệt sẫm; trăng đổi hình qua từng ngày; trăng lưỡi liềm hay thấy lúc chạng vạng hoặc gần sáng (chữ bé nghe không nói giờ).

**Bài 5**
> [CẦN KIỂM] Sao rất to nhưng ở rất xa; sao lấp lánh; ở quê ít đèn thấy nhiều sao hơn ở phố; đêm tối trời thấy được khoảng vài nghìn ngôi sao bằng mắt thường; sao xa hơn Mặt Trăng rất nhiều; mây che sao.

**Bài 6**
> [CẦN KIỂM] Máy bay bay cao hơn diều nhưng gần hơn Mặt Trăng (hiển nhiên, chỉ ghi cho đủ); quan niệm `moon_follows_me` (Piaget); câu `correction` có dấu chấm phẩy.

### Đề xuất cho người khác

- **ios-dev:** khoá `collectible.set.sky` "Sky cards" · "Thẻ bầu trời" (đã có trong ticket A4).
- **designer:** mười một hình vẽ giấy cắt (mục Quy ước hình số hai); ảnh theo "Hình dùng chung" và "Ghi chú cho hoạ sĩ" từng bài; luật bình minh và hoàng hôn (số bảy).
- **dev:** đổi danh mục theo Phần A1 (tên bài 3, 6, `number`, `level`). Không đổi luật validator.
- **PM:** xem mục Còn mở.

### Còn mở (chờ PM hoặc Duy)

1. ~~Kệ bài 2 mỗi nhóm một món~~ **Đóng lượt 2** (tester n2): giữ một món mỗi nhóm, đổi nhãn nhóm sang dấu hiệu (Mắt to nhìn đêm, Ngủ treo ngược, Phát sáng trong đêm) để chip không lộ đáp án.
2. ~~Bảng Đúng/Sai lệch về Đúng~~ **Đóng lượt 2** (tester n1): bài 4 w2, bài 5 w2 đổi sang câu Sai.
3. Ảnh bình minh và hoàng hôn khó phân biệt: kệ bài 3 chỉ có bình minh có sương. Nếu designer không tìm được ảnh bình minh có dấu hiệu buổi sáng rõ, thay món `tray_sunrise` bằng một ảnh đời sống buổi sáng khác (chợ sớm, người tập thể dục lúc sáng sớm, chụp xa, không nhận ra mặt).
4. Thẻ bài 2 "Bầu trời đêm" và thẻ bài 5 "Bầu trời sao" gần nhau về hình. Giữ hai ảnh khác hẳn (bài 2 có trăng và làng; bài 5 đầy sao, không trăng). Nếu PM muốn thẻ bài 2 khác hẳn thì đề xuất "Hoa quỳnh" (nở về đêm), ra khỏi chủ đề bầu trời.
