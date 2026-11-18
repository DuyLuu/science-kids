---
id: adf7d86b-7434-4ed8-b039-5e4f627a038c
topic: thoi-tiet-va-cac-mua
slug: mua-mua-va-mua-kho
order: 4
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Rainy and dry seasons
vi: Mùa mưa và mùa khô
> Giữ đúng tên ở `content/syllabus.json` (key `new-weather-and-seasons`, bài số bốn).

## Mục tiêu
en: I can tell rainy and dry seasons apart.
vi: Em phân biệt được mùa mưa và mùa khô.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 17/11/2026. Ticket SK-050. Mọi dòng `id:` để trống; chạy `ids` sau `_topic.md` và bài 1 đến 3 (câu w1 trỏ bài 3; nhiều hình dùng lại của bài 1, 2, 3).
> Chủ đề mới, không bám Oak; không có lesson Oak nào cho mùa mưa, mùa khô (`_topic.md` mục Nguồn). Mục tiêu "I can…" tự viết.
> Bài core, chỉ nói miền Nam ("in the south" · "ở miền Nam", "Ho Chi Minh City" · "Thành phố Hồ Chí Minh"). Sửa `four_seasons_everywhere` ở ý chính một và câu q6 (gắn key). Không miền Trung.

## Ý chính
1.en: In the south, a year has two seasons.
1.vi: Ở miền Nam, một năm có hai mùa.
2.en: The rainy season often has afternoon rain.
2.vi: Mùa mưa hay có mưa vào buổi chiều.
3.en: The dry season is sunny, with little rain.
3.vi: Mùa khô nắng nhiều, ít mưa.
> Từ cụ thể tới trừu tượng: cách chia năm ở miền Nam (hai mùa, khác bốn mùa bé vừa học ở bài 2, 3), rồi điều nhìn thấy của từng mùa (mưa chiều; nắng, ít mưa).
> [CẦN KIỂM] Miền Nam có mùa mưa (khoảng tháng Năm tới tháng Mười Một) và mùa khô (khoảng tháng Mười Hai tới tháng Tư); mưa mùa mưa thường tới buổi chiều, mưa rào rồi tạnh.

## Khởi động

> Hai câu, đúng bảng Khởi động ở `_topic.md`. w1 ôn bài ngay trước (bài 3, ô Winter: mặc áo ấm, quàng khăn). w2 ôn *Những nơi sống trên Trái Đất* bài sáu (mốc dài: ô `explore_dry` "In the dry season, the grass turns yellow."), nối sang chữ "mùa khô" hôm nay. Không nói "miền Nam giống xavan".

### w1
id: ea4af37f-d75b-4a63-9670-2ba96a2377e8
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: thoi-tiet-va-cac-mua/mua-thu-va-mua-dong
prompt.en: Which one keeps you warm in winter?
prompt.vi: Mùa đông, cái gì giữ ấm cho em?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of the cold wind in winter.
hint.vi: Em nghĩ tới gió lạnh mùa đông nhé.
explanation_correct.en: Yes! You wrap it around your neck.
explanation_correct.vi: Đúng rồi! Em quàng khăn len quanh cổ.
explanation_wrong.en: The answer is the scarf. It keeps you warm.
explanation_wrong.vi: Đáp án là khăn len. Khăn len giữ ấm cho em.
> Nón lá ở chủ đề này luôn là đồ che nắng; ở đây là lựa chọn sai cho "giữ ấm", không nước đôi (`_topic.md` mục Phần Chơi). Gợi ý nhắc ví dụ "a cold wind blows" của ô Winter bài 3, không trỏ tới câu chính ô.

#### option w1_hat
correct: false
feedback.en: A conical hat keeps the sun off.
feedback.vi: Nón lá dùng để che nắng.
label.en: conical hat
label.vi: nón lá
image.brief: Dùng lại hình `w1_hat` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): Vietnamese conical hat non la
image.alt.en: A conical hat
image.alt.vi: Chiếc nón lá

#### option w1_scarf
correct: true
label.en: scarf
label.vi: khăn len
image.brief: Dùng lại hình `tray_scarf` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): knitted wool scarf
image.alt.en: A knitted scarf
image.alt.vi: Chiếc khăn len

### w2
id: 5a097178-5f50-4d96-84a3-f08e59776560
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: noi-song-tren-trai-dat/dong-co-xavan
prompt.en: Savanna grass turns yellow in the dry season.
prompt.vi: Mùa khô, cỏ ở đồng cỏ xavan chuyển vàng.
image.brief: Dùng lại hình `explore_dry` ở bài `noi-song-tren-trai-dat/dong-co-xavan`. Từ khoá tìm ảnh (EN): savanna dry season
image.alt.en: Grass on the savanna
image.alt.vi: Cỏ ở đồng cỏ xavan
answer: true
hint.en: Think of grass with very little rain.
hint.vi: Em nghĩ xem cỏ sẽ ra sao khi trời rất ít mưa nhé.
explanation_correct.en: Yes! With rain, it turns green again.
explanation_correct.vi: Đúng rồi! Có mưa, cỏ lại xanh tươi.
explanation_wrong.en: This is true. Dry grass turns yellow.
explanation_wrong.vi: Câu này đúng. Cỏ khô thì chuyển vàng.
feedback_false.en: The grass in this picture is dry.
feedback_false.vi: Cỏ trong hình này đã khô rồi.
> `alt` riêng của chủ đề (`_topic.md` bảng Hình của chủ đề khác): `alt` gốc "Yellow grass in the dry season" nói đúng câu hỏi.
> Câu viết lại câu chính ô `explore_dry` của bài đó, không chép. `explanation_correct` dùng lại ý ví dụ ba ô đó ("in the rainy season, grass turns green").

## Học

> Bốn ô: mùa mưa (mưa to rồi tạnh, ở miền Nam), mây đen (mây kéo tới buổi chiều, báo sắp mưa), mùa khô (nắng nhiều, ít mưa), ruộng lúa (mưa làm ruộng xanh). Đúng bốn ô của `_topic.md`.
> Ý "hai mùa" (sửa `four_seasons_everywhere`) ở ý chính một và ví dụ bắt buộc ô Rainy season ("in the south, like Ho Chi Minh City"). Không ô nào nói "miền Bắc" hay "bốn mùa".
> Mưa ở bài này luôn là mưa rồi tạnh. Không nói ruộng khô hay ruộng gặt vào mùa khô (`_topic.md` mục Lệch). Mùa khô không phải thiên tai: đường khô, cây xanh, mình tưới cây.

### explore
id: a0f099e7-6e98-4cdc-903b-c5134b6714e1
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_rainy_season
label.en: Rainy season
label.vi: Mùa mưa
color: cham
sentence.en: Heavy rain falls, then it stops.
sentence.vi: Mưa to trút xuống, rồi tạnh.
image.brief: [ảnh] Mưa to trên một con phố, thấy rõ vệt mưa rơi và mặt đường ướt; không thấy người, có thể có một chiếc xe đỗ bên lề; nước chỉ ướt mặt đường, không ngập, không cây đổ, không có tia chớp; cắt bỏ biển hiệu và biển số xe, không chữ. Ảnh ngang có khoảng trống để làm khung vuông (Học) và thẻ hai lựa chọn (câu q3). Hình gốc của cả chủ đề (bài 6 ghép lại). Từ khoá tìm ảnh (EN): heavy rain street; rain Ho Chi Minh City street; tropical rain street motorbikes
image.alt.en: Heavy rain on a street
image.alt.vi: Mưa to trên phố
examples.1.en: in the south, like Ho Chi Minh City
examples.1.vi: ở miền Nam, như Thành phố Hồ Chí Minh
examples.2.en: bring a raincoat
examples.2.vi: mang theo áo mưa
examples.3.en: puddles on the road
examples.3.vi: vũng nước trên đường
> Ví dụ một bắt buộc (`_topic.md`): nói nơi bằng lời, không bản đồ. Ví dụ hai dạy trước câu q1, ví dụ ba dạy trước lựa chọn vũng nước câu q4. Câu chính nói "rồi tạnh" (mưa rào, không thiên tai).
> Ảnh thật chụp ở nước ngoài (không có ảnh mưa ở miền Nam hợp luật thấy rõ vệt mưa), nên `brief`, `alt` không nêu tên nơi; ví dụ một vẫn giữ (Quy ước hình số bảy). Sửa brief 18/11 theo ảnh designer chọn.
> [CẦN KIỂM] Mưa mùa mưa ở miền Nam thường là mưa rào to, mưa một lúc rồi tạnh.

#### group explore_dark_clouds
label.en: Dark clouds
label.vi: Mây đen
color: nau_dat
sentence.en: Dark clouds often come in the afternoon.
sentence.vi: Chiều chiều, mây đen kéo tới.
image.brief: [ảnh] Mây đen dày kéo tới trên một dòng sông và một cây lớn ven bờ, trời tối lại nhưng chưa mưa (không thấy vệt mưa); không có tia chớp, không gió giật cây đổ, không người nhìn rõ mặt, không chữ. Hình gốc của cả chủ đề. Từ khoá tìm ảnh (EN): dark rain clouds; dark clouds over river
image.alt.en: Dark clouds over the river
image.alt.vi: Mây đen trên dòng sông
examples.1.en: the sky turns grey
examples.1.vi: bầu trời xám lại
examples.2.en: the wind feels cool
examples.2.vi: gió mát thổi tới
examples.3.en: rain is coming soon
examples.3.vi: sắp mưa rồi
> Ô dạy trước lựa chọn mây đen câu q4 (mây đen đến trước mưa). Chỉ là mây kéo tới, không mây giông, không tia chớp (mục An toàn ở `_topic.md`).
> `alt` sửa 18/11 theo ảnh thật (mây đen trên sông, chụp ở nước ngoài, không nêu tên nơi): "Dark clouds over the river" · "Mây đen trên dòng sông"; bảng `_topic.md` sửa cùng.
> [CẦN KIỂM] Mùa mưa ở miền Nam, mây đen thường kéo tới vào buổi chiều trước cơn mưa; trước mưa hay có gió mát.

#### group explore_dry_season
label.en: Dry season
label.vi: Mùa khô
color: vang_hoe
sentence.en: The dry season is sunny, with little rain.
sentence.vi: Mùa khô nắng nhiều, ít mưa.
image.brief: [ảnh] Một con đường đất đỏ khô ráo dưới hàng cây xanh, nắng xuyên qua tán, bóng cây đổ rõ trên mặt đường, không thấy trời; không đất nứt nẻ, không cây chết hay khô héo, không bụi mù, không người nhìn rõ mặt, không biển hiệu, biển số hay chữ; không thấy Mặt Trời chói trong khung. Hình gốc của cả chủ đề (bài 6 ghép lại). Từ khoá tìm ảnh (EN): sunny dry road; village road sunshine Vietnam; tree lined road sunny
image.alt.en: A dry road in the sunshine
image.alt.vi: Con đường khô dưới nắng
examples.1.en: we water the plants
examples.1.vi: mình tưới cây
examples.2.en: the roads are dry
examples.2.vi: đường khô ráo
examples.3.en: wear a hat in the sun
examples.3.vi: đội nón khi ra nắng
> Ví dụ một dạy trước câu q5 ("Plants need watering…"), ví dụ hai dạy trước gợi ý câu q2. Ảnh là đáp án câu q3 ("Which picture shows the dry season?"): `alt` không có cụm "dry season".
> Mùa khô không gắn với thiên tai: cây ven đường vẫn xanh (Quy ước hình số năm, số chín ở `_topic.md`).
> [CẦN KIỂM] Mùa khô ở miền Nam nắng nhiều, rất ít mưa; người ta phải tưới cây.

#### group explore_fields
label.en: Rice fields
label.vi: Ruộng lúa
color: gi_dong
sentence.en: Rain makes the rice fields green.
sentence.vi: Mưa làm ruộng lúa xanh tốt.
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh
examples.1.en: frogs and fish in the fields
examples.1.vi: ếch, cá trong ruộng
examples.2.en: farmers plant rice
examples.2.vi: bà con cấy lúa
examples.3.en: green as far as you see
examples.3.vi: xanh tới tận chân trời
> Chép mục Discoverer `khung-long/trai-dat-rat-lau-ve-truoc` `q2_rice` (`same_as` không sang nhóm tuổi khác; `_topic.md` bảng Hình của chủ đề khác). Ảnh gốc có núi ở xa, không chắc là miền Nam: ô này không nói nơi, chỉ nói mưa làm ruộng xanh.
> [CẦN KIỂM] Cách nói "mưa làm ruộng lúa xanh tốt" chấp nhận được (đồng bằng sông Cửu Long cấy lúa quanh năm nhờ thuỷ lợi; `_topic.md` Còn mở số bốn).

### new_words
id: 207672b1-25b3-4e7e-898f-5dd75e390cad
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: rainy_season, dry_season

## Chơi

> Bé chuẩn bị đồ cho cả hai mùa: một món che mưa (áo mưa hoặc ủng cao su), một món che nắng (nón lá), một món tưới cây (bình tưới cây). Đạt khi đủ ba nhóm và không chọn đồ mùa đông lạnh.
> Món bẫy là đồ mùa đông bé vừa gặp ở bài 3 (áo khoác, khăn len, chăn bông): cũng là đồ mặc, đồ dùng như nhóm khác, nhưng miền Nam ấm quanh năm, không cần. Kệ bảy món, toàn ảnh chụp.

### tray
id: 87467166-d305-4a23-b955-209fc4c8965b
type: build_tray
version: 1
prompt.en: Get ready for rainy and dry seasons
prompt.vi: Chuẩn bị cho mùa mưa và mùa khô
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find things for rain, sun and plants.
messages.start.vi: Em tìm đồ che mưa, đồ che nắng và đồ tưới cây nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! You are ready for both seasons.
messages.balanced.vi: Tuyệt! Em đã sẵn sàng cho cả hai mùa.
messages.has_limited.en: That one is for cold winters.
messages.has_limited.vi: Món này dùng cho mùa đông lạnh.
messages.missing.tray_rain_off.en: You still need something for the rain.
messages.missing.tray_rain_off.vi: Em còn thiếu đồ che mưa.
messages.missing.tray_sun_off.en: You still need something for the sun.
messages.missing.tray_sun_off.vi: Em còn thiếu đồ che nắng.
messages.missing.tray_water.en: You still need something for the plants.
messages.missing.tray_water.vi: Em còn thiếu đồ tưới cây.
> Lời nhắn `has_limited` đúng với cả ba món bẫy, đúng chữ ở `_topic.md`.

#### group tray_rain_off
label.en: Keeps rain off
label.vi: Che mưa
color: cham
role: required

#### group tray_sun_off
label.en: Keeps sun off
label.vi: Che nắng
color: vang_hoe
role: required

#### group tray_water
label.en: Waters plants
label.vi: Tưới cây
color: gi_dong
role: required

#### group tray_cold
label.en: For cold winters
label.vi: Dùng cho mùa đông lạnh
color: do_son
role: limit

#### item tray_coat
label.en: Coat
label.vi: Áo khoác
group: tray_cold
image.brief: Dùng lại hình `explore_cold` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): winter coat hanger
image.alt.en: A warm coat on a hanger
image.alt.vi: Chiếc áo khoác ấm trên móc

#### item tray_raincoat
label.en: Raincoat
label.vi: Áo mưa
group: tray_rain_off
image.brief: Dùng lại hình `tray_raincoat` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): yellow raincoat with hood
image.alt.en: A yellow raincoat with a hood
image.alt.vi: Chiếc áo mưa vàng có mũ

#### item tray_watering_can
label.en: Watering can
label.vi: Bình tưới cây
group: tray_water
image.brief: [ảnh] Một bình tưới cây bằng nhựa hoặc tôn có vòi dài, đặt trên nền đất, sân gạch hoặc nền trơn, chụp ngang thấy cả bình và vòi; không người cầm, không nhãn hiệu, không chữ. Hình gốc của cả chủ đề (bài 5 dùng lại). Từ khoá tìm ảnh (EN): watering can; metal watering can garden
image.alt.en: A watering can
image.alt.vi: Bình tưới cây

#### item tray_scarf
label.en: Scarf
label.vi: Khăn len
group: tray_cold
image.brief: Dùng lại hình `tray_scarf` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): knitted wool scarf
image.alt.en: A knitted scarf
image.alt.vi: Chiếc khăn len

#### item tray_hat
label.en: Conical hat
label.vi: Nón lá
group: tray_sun_off
image.brief: Dùng lại hình `w1_hat` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): Vietnamese conical hat non la
image.alt.en: A conical hat
image.alt.vi: Chiếc nón lá

#### item tray_boots
label.en: Rubber boots
label.vi: Ủng cao su
group: tray_rain_off
image.brief: Dùng lại hình `tray_boots` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): rubber boots pair
image.alt.en: A pair of rubber boots
image.alt.vi: Đôi ủng cao su

#### item tray_quilt
label.en: Quilt
label.vi: Chăn bông
group: tray_cold
image.brief: Dùng lại hình `tray_quilt` ở bài `thoi-tiet-va-cac-mua/mua-thu-va-mua-dong`. Từ khoá tìm ảnh (EN): quilt blanket bed
image.alt.en: A thick quilt on a bed
image.alt.vi: Chăn bông dày trên giường

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1 ba lựa chọn; q3, q4 hai lựa chọn), `true_false` (q2 Sai, q5 Đúng, q6 Sai). Đúng khung Quiz bài 4 ở `_topic.md` (q4 đổi từ `order_sequence` sang `single_choice` 18/11; vẫn đạt luật mỗi bài ít nhất hai dạng).
> Hình câu `single_choice` là hàng rào tre trung tính. Câu nào cũng tự đủ nghĩa khi chỉ nghe.

### q1
id: b089aa88-2cae-4832-bea0-d808ca2f0627
format: single_choice
version: 1
dok: 1
prompt.en: What do you bring in the rainy season?
prompt.vi: Mùa mưa, em mang theo gì?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of heavy rain on the way home.
hint.vi: Em nghĩ tới cơn mưa to trên đường về nhà nhé.
explanation_correct.en: Yes! A raincoat keeps you dry.
explanation_correct.vi: Đúng rồi! Áo mưa giữ cho em khô ráo.
explanation_wrong.en: The answer is the raincoat. It keeps rain off.
explanation_wrong.vi: Đáp án là áo mưa. Áo mưa che mưa cho em.
> DOK 1: nhớ lại ví dụ hai ô "Rainy season" ("bring a raincoat"). Lựa chọn sai: khăn len (đồ mùa đông, bài 3), bình tưới cây (đồ mùa khô, kệ Chơi hôm nay). Ba vật khác nhau rõ bằng dáng.

#### option q1_scarf
correct: false
feedback.en: A scarf keeps your neck warm in winter.
feedback.vi: Khăn len giữ ấm cổ em vào mùa đông.
label.en: scarf
label.vi: khăn len
image.brief: Dùng lại hình `tray_scarf` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): knitted wool scarf
image.alt.en: A knitted scarf
image.alt.vi: Chiếc khăn len

#### option q1_raincoat
correct: true
label.en: raincoat
label.vi: áo mưa
image.brief: Dùng lại hình `tray_raincoat` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): yellow raincoat with hood
image.alt.en: A yellow raincoat with a hood
image.alt.vi: Chiếc áo mưa vàng có mũ

#### option q1_can
correct: false
feedback.en: A watering can gives water to plants.
feedback.vi: Bình tưới cây dùng để tưới nước cho cây.
label.en: watering can
label.vi: bình tưới cây
image.brief: Dùng lại hình `tray_watering_can`. Từ khoá tìm ảnh (EN): watering can
image.alt.en: A watering can
image.alt.vi: Bình tưới cây

### q2
id: 6ed8ea6e-a58b-481e-a360-22c3b22dbfb3
format: true_false
version: 1
dok: 1
prompt.en: The dry season has lots of rain.
prompt.vi: Mùa khô có rất nhiều mưa.
image.brief: Dùng lại hình `explore_dry_season`. Từ khoá tìm ảnh (EN): sunny dry road
image.alt.en: A dry road in the sunshine
image.alt.vi: Con đường khô dưới nắng
answer: false
hint.en: Look at the road in this picture.
hint.vi: Em nhìn con đường trong hình nhé.
explanation_correct.en: The dry season is sunny, with little rain.
explanation_correct.vi: Mùa khô nắng nhiều, ít mưa.
explanation_wrong.en: This is false. The dry season has little rain.
explanation_wrong.vi: Câu này sai. Mùa khô ít mưa.
feedback_true.en: Lots of rain comes in the rainy season.
feedback_true.vi: Mùa mưa mới có nhiều mưa.
> DOK 1: nhớ lại ý chính ba, kèm quan sát ảnh đường khô (ví dụ hai ô "Dry season"). Ảnh là bằng chứng cho phía đúng. `explanation_correct` đứng một mình được (thẻ "Ý sai → Ý đúng").

### q3
id: 60b520cd-2aa0-4e94-bb2f-1ae22e90c81c
format: single_choice
version: 1
dok: 1
prompt.en: Which picture shows the dry season?
prompt.vi: Hình nào là mùa khô?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of when we water the plants.
hint.vi: Em nghĩ xem khi nào mình phải tưới cây nhé.
explanation_correct.en: Yes! The road is dry in the sun.
explanation_correct.vi: Đúng rồi! Con đường khô ráo dưới nắng.
explanation_wrong.en: The answer is the sunny road. It is dry.
explanation_wrong.vi: Đáp án là con đường nắng. Đường khô ráo.
> Hai lựa chọn (`_topic.md` Khung Quiz): hai ảnh bé vừa xem ở ô Học, khác nhau rõ bằng mắt (đường nắng, trời xanh; mưa to, trời xám). Gợi ý trỏ tới ví dụ một ô "Dry season" (tưới cây), không trỏ tới câu chính ô.
> `alt` của đáp án là `alt` riêng, không có chữ "dry" của câu hỏi (sửa 17/11 theo rà chữ g4, Quy ước hình số tám).

#### option q3_rain
correct: false
feedback.en: Heavy rain falls in the rainy season.
feedback.vi: Mưa to là vào mùa mưa.
label.en: heavy rain
label.vi: mưa to
image.brief: Dùng lại hình `explore_rainy_season`. Từ khoá tìm ảnh (EN): heavy rain street
image.alt.en: Heavy rain on a street
image.alt.vi: Mưa to trên phố

#### option q3_dry
correct: true
label.en: sunny road
label.vi: con đường nắng
image.brief: Dùng lại hình `explore_dry_season`. Từ khoá tìm ảnh (EN): sunny dry road
image.alt.en: A sunny road with trees
image.alt.vi: Con đường nắng có hàng cây
> `alt` riêng ở chỗ này (khai ở bảng `alt` riêng của `_topic.md`): bỏ chữ "dry" của câu hỏi. Ảnh, key, `brief` giữ nguyên; các chỗ khác dùng `alt` gốc.

### q4
id: c30e30fa-873b-4560-8f7d-fe081cb7397d
format: single_choice
version: 1
dok: 2
prompt.en: What comes after heavy rain?
prompt.vi: Mưa to xong thì có gì?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of the road when rain stops.
hint.vi: Em nghĩ tới mặt đường lúc mưa vừa tạnh nhé.
explanation_correct.en: Yes! Rainwater stays on the road.
explanation_correct.vi: Đúng rồi! Nước mưa còn đọng lại trên đường.
explanation_wrong.en: The answer is the puddle. Rain leaves water behind.
explanation_wrong.vi: Đáp án là vũng nước. Mưa tạnh, nước còn đọng lại.
> Đổi 18/11 từ `order_sequence` ("Put the afternoon rain in order.") sang phương án `single_choice` đã ghi ở `_topic.md` (quyết định phiên chính 18/11): không tìm được ba ảnh mây đen, mưa, vũng nước cùng một cảnh hợp luật. Giữ DOK 2, giữ dòng `id:`.
> DOK 2: bé suy từ hai ô Học (ô "Dark clouds": mây đen đến trước mưa; ô "Rainy season": mưa to rồi tạnh, ví dụ "puddles on the road") ra điều đến sau cơn mưa. Lựa chọn sai là mây đen: cũng gắn với cơn mưa nhưng đến trước, nên bé phải nghĩ về trước, sau chứ không chỉ nhận mặt ảnh.
> Hai lựa chọn, khác nhau rõ bằng mắt (trời tối kéo mây trên sông; mặt nước đọng phản chiếu trời xanh). Không dùng ảnh mưa to làm lựa chọn (chính là chữ trong câu hỏi). `alt` của đáp án không có chữ "rain", "after" của câu hỏi.
> `feedback` nói về lựa chọn mây đen (đến trước mưa), không gọi tên đáp án; `hint` trỏ tới một cảnh quen (mặt đường lúc mưa vừa tạnh), không trỏ tới thẻ hay ô Học, không bảo bé nhìn lên trời (SK-044, SK-047; Lỗi hay gặp số mười lăm).
> Hai lựa chọn với hai lượt chạm: bé đoán vẫn qua ở lượt hai (như q3). Muốn khó hơn thì thêm lựa chọn thứ ba con đường nắng khô (`explore_dry_season`, cần mục chọn ảnh mới `q4.q4_dry`); chưa thêm để không phát sinh ảnh.

#### option q4_clouds
correct: false
feedback.en: Dark clouds come before the rain.
feedback.vi: Mây đen kéo tới trước khi mưa.
label.en: dark clouds
label.vi: mây đen
image.brief: Dùng lại hình `explore_dark_clouds`. Từ khoá tìm ảnh (EN): dark rain clouds
image.alt.en: Dark clouds over the river
image.alt.vi: Mây đen trên dòng sông

#### option q4_puddle
correct: true
label.en: puddle
label.vi: vũng nước
image.brief: [ảnh] Một vũng nước trên lề đường sau cơn mưa, mặt nước phản chiếu trời xanh và dãy nhà, quanh vũng mặt đường còn ướt; nước chỉ đọng thành vũng, không ngập đường, không rác, không người, không xe, không biển số hay chữ. Ảnh vuông hoặc ngang có khoảng trống để làm khung vuông. Từ khoá tìm ảnh (EN): puddle road after rain; puddle street reflection; rain puddle asphalt
image.alt.en: A puddle on the road
image.alt.vi: Vũng nước trên đường
> Ảnh mới, chỉ dùng ở bài này (câu q4, từ `puddle`). Ảnh thật chụp ở nước ngoài; `alt` không nêu tên nơi.

### q5
id: 9dde0c5b-86fc-4358-b88f-94d70d3d35cf
format: true_false
version: 1
dok: 2
prompt.en: Plants need watering in the dry season.
prompt.vi: Mùa khô, cây cần được tưới nước.
image.brief: Dùng lại hình `tray_watering_can`. Từ khoá tìm ảnh (EN): watering can
image.alt.en: A watering can
image.alt.vi: Bình tưới cây
answer: true
hint.en: Think of the dry roads and little rain.
hint.vi: Em nghĩ tới con đường khô và trời ít mưa nhé.
explanation_correct.en: Yes! Water helps plants stay green.
explanation_correct.vi: Đúng rồi! Có nước, cây mới xanh tốt.
explanation_wrong.en: This is true. With little rain, plants need water.
explanation_wrong.vi: Câu này đúng. Trời ít mưa thì cây cần được tưới.
feedback_false.en: We water the plants in the dry season.
feedback_false.vi: Mùa khô, mình tưới cây.
> DOK 2: suy từ "ít mưa" (ý chính ba) ra "cây cần tưới", nối với ví dụ một ô "Dry season" và món bình tưới cây ở kệ Chơi. Hình là bình tưới cây (`_topic.md`), không có cây khô héo.

### q6
id: a54ca0e8-74af-4078-a8d9-fe58a36fe728
format: true_false
version: 1
dok: 2
misconception: four_seasons_everywhere
prompt.en: Every place has four seasons.
prompt.vi: Nơi nào cũng có bốn mùa.
image.brief: Dùng lại hình `explore_seasons` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Hình ghép, không tìm ảnh.
image.alt.en: Four pictures from one year
image.alt.vi: Bốn hình trong một năm
answer: false
hint.en: Think of Ho Chi Minh City.
hint.vi: Em nghĩ tới miền Nam, như Thành phố Hồ Chí Minh nhé.
explanation_correct.en: The south has rainy and dry seasons.
explanation_correct.vi: Miền Nam có mùa mưa và mùa khô.
explanation_wrong.en: This is false. The south has two seasons.
explanation_wrong.vi: Câu này sai. Miền Nam có hai mùa.
feedback_true.en: In the south, it is warm all year.
feedback_true.vi: Ở miền Nam, trời ấm quanh năm.
> Câu misconception (`four_seasons_everywhere`), DOK 2: bé vừa học bốn mùa ở bài 2, 3 dễ nghĩ "nơi nào cũng thế" và chạm Đúng. Bé áp ý chính một hôm nay để bác câu nói. Câu chỉ kiểm một việc: mọi nơi có cùng bốn mùa không.
> Hình là hình ghép bốn mùa của bài 2 (đúng `_topic.md`): đúng vật được nói tới, không tự làm bằng chứng cho phía nào. Gợi ý trỏ tới nơi bé vừa học, không nói thẳng "hai mùa".
> `explanation_correct` là đúng câu `correction` ở `_topic.md`, đứng một mình được: "Every place has four seasons." → "The south has rainy and dry seasons.".
> `feedback_true` không nhắc miền Bắc (bài 4 chỉ nói miền Nam); dùng ý "ấm quanh năm" của bài 6 ô South.
> Brief dùng lại hình ghép không có dòng từ khoá (hình gốc là `[sơ đồ ghép ảnh]` toàn phần dùng lại); `validate` có thể cảnh báo `image_brief_keywords`, giữ lại có chủ ý.
> [CẦN KIỂM] Miền Nam ấm quanh năm, chia mùa mưa và mùa khô.

## Từ vựng

### rainy_season
id: 7e654a20-5020-4b9d-a6a1-e50f24cd9de0
tier: core
term.en: rainy season
term.vi: mùa mưa
example.en: The rainy season often brings afternoon rain.
example.vi: Mùa mưa thường có mưa vào buổi chiều.
image.brief: Dùng lại hình `explore_rainy_season`. Từ khoá tìm ảnh (EN): heavy rain street
image.alt.en: Heavy rain on a street
image.alt.vi: Mưa to trên phố

### dry_season
id: 0cbcabad-318a-437a-b424-e309cbe3e9f4
tier: core
term.en: dry season
term.vi: mùa khô
example.en: In the dry season, we water the plants.
example.vi: Mùa khô, mình tưới cây.
image.brief: Dùng lại hình `explore_dry_season`. Từ khoá tìm ảnh (EN): sunny dry road
image.alt.en: A dry road in the sunshine
image.alt.vi: Con đường khô dưới nắng
> Trùng có chủ ý với từ `extra` `dry_season` của *Những nơi sống trên Trái Đất* bài sáu (`noi-song-tren-trai-dat/dong-co-xavan`); ở bài này nâng lên `core` (`_topic.md` mục Từ vựng từng bài).

### puddle
id: fd9a909f-c86b-4adf-bc14-86ad18340338
tier: extra
term.en: puddle
term.vi: vũng nước
example.en: I jump over a puddle after rain.
example.vi: Mưa tạnh, em nhảy qua vũng nước.
image.brief: Dùng lại hình `q4_puddle`. Từ khoá tìm ảnh (EN): puddle road after rain
image.alt.en: A puddle on the road
image.alt.vi: Vũng nước trên đường

### dark_cloud
id: fa9dbdf1-7948-49d7-8e98-464299b80815
tier: extra
term.en: dark cloud
term.vi: mây đen
example.en: Dark clouds often bring rain.
example.vi: Mây đen thường mang mưa tới.
image.brief: Dùng lại hình `explore_dark_clouds`. Từ khoá tìm ảnh (EN): dark rain clouds
image.alt.en: Dark clouds over the river
image.alt.vi: Mây đen trên dòng sông
> Câu ví dụ nói "often", vì không phải mây đen nào cũng mang mưa.

## Thưởng

### mango_card
id: 5e0c171b-b21f-47b6-a475-8d051b5ab4f8
set: weather
rarity: common
name.en: Mango
name.vi: Quả xoài
tag.en: Ripe in the hot dry season
tag.vi: Chín vào mùa khô nắng nóng
fact.en: Mangoes hang in bunches on big trees.
fact.vi: Xoài treo thành chùm trên cây to.
image.brief: [ảnh] Một chùm quả xoài còn xanh treo trên cây, lá xanh dài quanh chùm, chụp gần từ dưới tán, trời sáng; không túi bọc quả, không người, không nhãn dán, không chữ. Từ khoá tìm ảnh (EN): mango tree fruit; Mangifera indica fruit tree; mangoes on tree
image.alt.en: Mangoes on a tree
image.alt.vi: Những quả xoài trên cây
> Ảnh mới chỉ dùng ở bài này. Ảnh thật là chùm xoài còn xanh (không có ảnh hợp lệ có quả đã ngả vàng).
> `fact` đổi 18/11 (phiên chính): bỏ "Mangoes turn yellow when they are ripe." · "Xoài chín thì vỏ chuyển vàng." vì ảnh là quả còn xanh, và có giống xoài chín vỏ vẫn xanh. Câu mới nói điều bé thấy trong ảnh (bảy từ EN).
> [CẦN KIỂM] Xoài miền Nam chín rộ cuối mùa khô, đầu mùa mưa (câu `tag`); quả xoài thường treo thành chùm vài quả trên cuống dài.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Không thiên tai: không tia chớp, không nước ngập đường, không cây đổ, không người gặp nạn. Mùa khô không có ảnh đất nứt nẻ, cây chết; cây ven đường vẫn xanh. Người trong cảnh ở xa, không nhận ra mặt; không biển hiệu, biển số hay chữ.
- **Ảnh mới, hình gốc của cả chủ đề (giữ đúng key, `alt`, truy vấn đầu ở `_topic.md`):** mưa to trên phố, không thấy người (`explore_rainy_season`); mây đen kéo tới trên sông, chưa mưa (`explore_dark_clouds`); con đường đất đỏ khô dưới hàng cây, nắng xuyên tán (`explore_dry_season`); bình tưới cây (`tray_watering_can`, bài 5 dùng lại). Bài 6 ghép `explore_rainy_season` với `explore_dry_season` thành `explore_south`: hai ảnh nên cùng tỉ lệ ngang.
- **Ảnh mới chỉ dùng ở bài này:** vũng nước trên lề đường sau mưa (`q4_puddle`), chùm xoài còn xanh trên cây (`mango_card`).
- **Ảnh dùng lại:** bài 1 `thoi-tiet-hom-nay`: `explore_cold`, `tray_scarf`, `tray_raincoat`, `tray_boots`. Bài 2 `mua-xuan-va-mua-he`: `explore_seasons` (hình ghép, câu q6). Bài 3 `mua-thu-va-mua-dong`: `tray_quilt`. *Gọi tên và nhóm động vật* bài một: `w1` (hàng rào tre, hình câu w1, q1, q3, q4), `w1_hat` (nón lá). *Những nơi sống trên Trái Đất* bài sáu: `explore_dry` (xavan, `alt` riêng). Discoverer *Khủng long* bài một: `q2_rice` (ruộng lúa, chép mục).
- **Câu q4 (18/11 đổi sang `single_choice`, hai lựa chọn):** mây đen `q4_clouds` (dùng lại `explore_dark_clouds`) và vũng nước `q4_puddle`, thẻ hai lựa chọn. Bỏ thẻ mưa to (đã bỏ cả mục ảnh trong file chọn ảnh). Hai ảnh không cần cùng một cảnh.
- **Ảnh khó:** phố mưa không ngập (nhiều ảnh mưa Sài Gòn có nước ngập: loại); mây đen không có tia chớp; con đường nắng không đất nứt, không bụi; xoài không bọc túi. Ảnh mưa, mây đen, đường khô, vũng nước đều chụp ở nước ngoài: `alt` không nêu tên nơi.
- **Màu:** Học: mùa mưa `cham`, mây đen `nau_dat`, mùa khô `vang_hoe`, ruộng lúa `gi_dong`. Chơi: che mưa `cham`, che nắng `vang_hoe`, tưới cây `gi_dong`, dùng cho mùa đông lạnh `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (rainy_season, dry_season). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Đúng). Quiz `single_choice` (q1 ba lựa chọn; q3, q4 hai lựa chọn), `true_false` (q2 Sai, q5 Đúng, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`four_seasons_everywhere`). Không có `labels` ở câu `true_false`.
- **q4 đổi format (18/11):** `order_sequence` → `single_choice`, giữ `id`, `version: 1` (bài chưa publish). Khối `#### item` đổi thành `#### option` có `correct`; bỏ `answer`; bỏ thẻ mưa to. Hai lựa chọn mới không có dòng `id` (lựa chọn không mang id).
- **Màn Chơi, ví dụ để kiểm:** Áo mưa, Nón lá, Bình tưới cây → `balanced`; Ủng cao su, Nón lá, Bình tưới cây → `balanced`; Áo mưa, Ủng cao su, Nón lá → `missing.tray_water`; Áo mưa, Nón lá, Chăn bông → `has_limited`; Khăn len, Nón lá, Bình tưới cây → `has_limited`.
- **Khởi động trỏ:** w1 → `thoi-tiet-va-cac-mua/mua-thu-va-mua-dong` (bài 3 phải có id trước), w2 → `noi-song-tren-trai-dat/dong-co-xavan` (đã có id).
- **Hình chép từ Discoverer:** `explore_fields` dùng `q2_rice` của `khung-long/trai-dat-rat-lau-ve-truoc`; `same_as` không sang nhóm tuổi khác, file chọn ảnh chép mục.
- **Từ EN có thể ngoài Starters/Movers:** season, rainy season, dry season, afternoon, puddle, dark clouds, rice fields, savanna, watering can, conical hat, raincoat, rubber boots, quilt, mango, ripe, bunches, Ho Chi Minh City. Nghe thử giọng EN đọc "Ho Chi Minh City", "savanna".
