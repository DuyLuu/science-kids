---
id: 0262e1c8-cc03-44c3-8e43-affeacda44fb
topic: thoi-tiet-va-cac-mua
slug: mua-lai-ve
order: 6
stage: review
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Seasons come back
vi: Mùa lại về
> Giữ đúng tên ở `content/syllabus.json` (key `new-weather-and-seasons`, bài số sáu).

## Mục tiêu
en: I can tell how a year's weather changes.
vi: Em kể được thời tiết đổi ra sao trong một năm.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 17/11/2026. Ticket SK-050. Mọi dòng `id:` để trống; chạy `ids` sau bài 5 (Khởi động trỏ bài 5 và bài 2 của chủ đề này).
> Chủ đề mới, không bám sườn lesson nào (`_topic.md` mục Nguồn). Mục tiêu tám từ EN (lệch đề xuất PM, đã ghi ở `_topic.md` mục Lệch).
> Bài tổng kết (`review`): gom bài 1 tới 5. Đặt hai cách chia mùa cạnh nhau (miền Bắc bốn mùa, miền Nam mùa mưa và mùa khô), nói mùa quay lại mỗi năm, và mặc theo mùa. Không dạy vì sao có mùa; không nói "mùa đông ngày càng ấm" (để dành Scientist số mười sáu).
> Sửa `same_weather_all_year` ở ý chính một, bốn ô Học, kệ Chơi (ba mùa, ba kiểu đồ) và câu q6 (gắn key).

## Ý chính
1.en: The weather changes with the seasons.
1.vi: Thời tiết thay đổi theo mùa.
2.en: The seasons come back every year.
2.vi: Năm nào các mùa cũng quay lại.
3.en: We dress to suit each season.
3.vi: Mỗi mùa mình mặc cho hợp.
> Chữ chốt ở `_topic.md`. Từ cụ thể tới trừu tượng: thời tiết đổi theo mùa ở hai miền (bé thấy được), rồi mùa quay vòng, rồi việc bé làm theo mùa (mặc đồ). Ý chính ba quay về điều cụ thể để bài kết thúc bằng việc bé tự làm được.

## Khởi động

> Ba câu, DOK 1: w1 ôn bài 5 (bài ngay trước, ô Tet), w2 ôn bài 2 (cách bốn bài, ô Summer, ý chính ba), w3 ôn *Gọi tên và nhóm động vật* bài sáu (mốc dài, theo `goi-ten-va-nhom-dong-vat/_topic.md` mục Ghi chú). Câu và lựa chọn chốt ở `_topic.md` mục Khởi động. Câu w3 mới, không chép "A buffalo eats meat." của bài tám chủ đề đó.

### w1
id: 7c121ce7-87ab-44d9-a95f-6edcf81b8bf9
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: thoi-tiet-va-cac-mua/muoi-hai-thang
prompt.en: Which comes near the start of the year?
prompt.vi: Dịp nào đến vào khoảng đầu năm?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of the order of the year.
hint.vi: Em nghĩ về thứ tự các dịp trong năm nhé.
explanation_correct.en: Yes! Families wrap banh chung for Tet.
explanation_correct.vi: Đúng rồi! Nhà nhà gói bánh chưng đón Tết.
explanation_wrong.en: The answer is Tet. It comes early in the year.
explanation_wrong.vi: Đáp án là Tết. Tết đến vào khoảng đầu năm.
> Ôn câu chính ô Tet bài 5. Lựa chọn là dịp: ảnh là dấu hiệu (bánh chưng, bãi biển), `label` gọi tên dịp. Gợi ý là cách nghĩ (thứ tự trong năm, câu q4 bài 5), không gọi tên dịp nào.

#### option w1_tet
correct: true
label.en: Tet
label.vi: Tết
image.brief: Dùng lại hình `tray_banh_chung` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): banh chung
image.alt.en: Two square cakes wrapped in leaves
image.alt.vi: Hai chiếc bánh vuông gói lá

#### option w1_holiday
correct: false
feedback.en: The summer holiday comes on hot days.
feedback.vi: Nghỉ hè đến vào những ngày nắng nóng.
label.en: summer holiday
label.vi: nghỉ hè
image.brief: Dùng lại hình `q3` ở bài `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien`. Từ khoá tìm ảnh (EN): empty beach blue sea
image.alt.en: A beach by the sea
image.alt.vi: Bãi biển vắng

### w2
id: dde7d3a6-b83b-4888-a5a7-e9d5f9458fc8
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: thoi-tiet-va-cac-mua/mua-xuan-va-mua-he
prompt.en: Summer days are short.
prompt.vi: Ngày mùa hè ngắn.
image.brief: Dùng lại hình `explore_summer` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): Delonix regia
image.alt.en: Red flowers on a big tree
image.alt.vi: Hoa đỏ trên cây to
answer: false
hint.en: Think of playing outside on summer evenings.
hint.vi: Em nghĩ tới lúc chơi ngoài sân chiều tối mùa hè nhé.
explanation_correct.en: Summer days are long. It gets dark late.
explanation_correct.vi: Mùa hè ngày dài. Trời tối muộn.
explanation_wrong.en: This is false. In summer, it gets dark late.
explanation_wrong.vi: Câu này sai. Mùa hè, trời tối muộn.
feedback_true.en: Short days come in winter.
feedback_true.vi: Ngày ngắn là vào mùa đông.
> Ôn ý chính ba bài 2 ("Summer days are long.") và ví dụ bắt buộc ô Summer ("it gets dark late"); phản hồi nhắc ô Short days bài 3. Hình là hoa phượng (dấu hiệu mùa hè, hình gốc ô Summer bài 2). Không nói vì sao ngày dài, ngày ngắn.
> Gợi ý là một cảnh quen (chơi ngoài sân lúc chiều tối mùa hè), không hỏi "sớm hay muộn".

### w3
id: 5a36679c-f34d-4212-a905-d8dde78bb401
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/con-vat-an-gi
prompt.en: A buffalo eats small fish.
prompt.vi: Con trâu ăn cá nhỏ.
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu
answer: false
hint.en: Think of a buffalo out on the farm.
hint.vi: Em nghĩ tới con trâu ngoài đồng nhé.
explanation_correct.en: A buffalo eats grass.
explanation_correct.vi: Con trâu ăn cỏ.
explanation_wrong.en: This is false. Buffaloes eat grass all day.
explanation_wrong.vi: Câu này sai. Trâu ăn cỏ cả ngày.
feedback_true.en: A cat likes to eat fish.
feedback_true.vi: Con mèo thích ăn cá.
> Ôn mốc dài (*Gọi tên và nhóm động vật* bài sáu: trâu ăn cỏ, mèo ăn cá). Hình là con trâu bên suối (đúng vật được nói tới, `alt` riêng như chủ đề số bốn), không có cỏ hay cá làm bằng chứng cho phía nào.
> [CẦN KIỂM] Trâu ăn cỏ, không ăn cá (như bài sáu chủ đề số một).

## Học

> Bốn ô, theo `_topic.md` mục Bài 6: hai miền (bốn mùa; mùa mưa và mùa khô), quần áo theo mùa, mùa quay lại. Hai ô đầu đặt hai cách chia cạnh nhau; không nói "Việt Nam có bốn mùa" hay "Việt Nam có hai mùa".
> Chữ dạy trước cho Quiz: câu chính và ví dụ hai ô Clothes (q1, q4); câu chính ô Again and again (q2, q5); ví dụ hai ô North (q3: thu mát; lá vàng đã dạy ở bài 3); ví dụ ô North và ô South (q6).
> Không bản đồ, không chữ, không người nhìn rõ mặt.

### explore
id: d4d8ae78-4160-4bf6-b514-3d6e120498fc
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_north
label.en: North
label.vi: Miền Bắc
color: nau_dat
sentence.en: The north has four seasons.
sentence.vi: Miền Bắc có bốn mùa.
image.brief: Dùng lại hình `explore_seasons` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`.
image.alt.en: Four pictures from one year
image.alt.vi: Bốn hình trong một năm
examples.1.en: warm spring, hot summer
examples.1.vi: xuân ấm, hè nóng
examples.2.en: cool autumn, cold winter
examples.2.vi: thu mát, đông lạnh
examples.3.en: like Hanoi
examples.3.vi: như Hà Nội
> Hình gốc là hình ghép bốn ô ở bài 2 (bảng `_topic.md` ghi "ghép, không tìm"), nên brief dùng lại không có dòng từ khoá (nếu có, máy coi là phần cần tìm mới).
> Màu `nau_dat` trùng nhóm "Winter in the north" ở kệ Chơi.

#### group explore_south
label.en: South
label.vi: Miền Nam
color: cham
sentence.en: The south has rainy and dry seasons.
sentence.vi: Miền Nam có mùa mưa và mùa khô.
image.brief: [sơ đồ ghép ảnh] Hai ảnh đã có, cắt cùng cỡ, đặt cạnh nhau thành một hàng, giữa hai ô có khe hở mỏng màu nền: mưa to trên phố `explore_rainy_season` ở bài `thoi-tiet-va-cac-mua/mua-mua-va-mua-kho` (bên trái), con đường khô dưới nắng `explore_dry_season` ở bài `thoi-tiet-va-cac-mua/mua-mua-va-mua-kho` (bên phải); không bản đồ, không chữ, không mũi tên, không viền nét quanh ô.
image.alt.en: Heavy rain and a sunny road
image.alt.vi: Mưa to và con đường nắng
examples.1.en: warm all year
examples.1.vi: ấm quanh năm
examples.2.en: rain in the afternoon
examples.2.vi: mưa vào buổi chiều
examples.3.en: like Ho Chi Minh City
examples.3.vi: như Thành phố Hồ Chí Minh
> Hình ghép mới của bài này (một trong ba hình ghép của chủ đề, `_topic.md` Quy ước hình số một). Brief không có dòng `Từ khoá tìm ảnh (EN)` vì cả hai phần là hình dùng lại; chỉ hai key của hai phần nằm trong backtick.
> [CẦN KIỂM] Miền Nam ấm quanh năm; mưa mùa mưa thường tới buổi chiều (như bài 4).

#### group explore_clothes
label.en: Clothes
label.vi: Quần áo theo mùa
color: vang_hoe
sentence.en: Thin clothes for hot days, coats for cold.
sentence.vi: Ngày nóng mặc đồ mỏng, ngày lạnh mặc áo khoác.
image.brief: [sơ đồ ghép ảnh] Ba ảnh đồ vật đã có, cắt vuông cùng cỡ, giữa các ô có khe hở mỏng màu nền; hai ô trên: áo phao `explore_cold` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay` (trên trái), áo tay dài `q4_long_sleeve` (trên phải); một ô dưới ở giữa: áo cộc tay `tray_tshirt` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`; đọc theo hàng vẫn từ dày tới mỏng. Bản 2:1 của từ `clothes` giữ một hàng ba ô cùng thứ tự. Không người mặc, không chữ, không mũi tên, không viền nét quanh ô.
image.alt.en: A coat, a shirt and a T-shirt
image.alt.vi: Áo khoác, áo tay dài và áo cộc tay
examples.1.en: a raincoat for rainy days
examples.1.vi: áo mưa cho ngày mưa
examples.2.en: a scarf for winter
examples.2.vi: khăn len cho mùa đông
examples.3.en: a hat for the sun
examples.3.vi: nón cho ngày nắng
> Câu chính chốt ở `_topic.md` (câu rút gọn, không động từ); nghe tự nhiên khi đọc kèm hình ba chiếc áo.
> Ba bộ đồ trong hình xếp từ lạnh tới nóng, đúng thứ tự câu q4 (q4 là áp dụng, bé đã thấy dải này ở ô Học).

#### group explore_again
label.en: Again and again
label.vi: Lại về
color: gi_dong
sentence.en: Peach trees bloom again every spring.
sentence.vi: Mùa xuân nào hoa đào cũng lại nở.
image.brief: Dùng lại hình `explore_spring` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): Prunus persica blossom
image.alt.en: Pink blossoms on a branch
image.alt.vi: Cành hoa màu hồng
examples.1.en: flame trees every summer
examples.1.vi: hè nào phượng cũng nở
examples.2.en: after winter, spring again
examples.2.vi: hết đông lại đến xuân
examples.3.en: rain every rainy season
examples.3.vi: mùa mưa nào cũng có mưa chiều
> Ảnh hoa đào thay "vòng mùa" (không có ảnh thật cho vòng mùa; `_topic.md` mục Lệch). Ví dụ một nhắc miền Bắc, ví dụ ba nhắc miền Nam bằng ý mùa mưa.

### new_words
id: 56255473-356e-403e-8e54-5d4144559a1a
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: change, warm

## Chơi

> Bé chọn đồ cho ba mùa: mùa đông miền Bắc (áo khoác, khăn len), mùa hè (nón lá, áo cộc tay), mùa mưa miền Nam (áo mưa, ủng cao su). Đạt khi đủ ba nhóm và không chọn đồ không liên quan thời tiết.
> Món bẫy là cái gối (mềm như khăn len) và quả bóng (đồ chơi ngoài trời), như bài 1. Kệ tám món, toàn ảnh dùng lại.
> Lời nhắn `has_limited` đúng với cả hai món bẫy (`_topic.md` mục Phần Chơi).

### tray
id: 69f4ddf3-8336-49d0-aab1-a4ae2178be08
type: build_tray
version: 1
prompt.en: Pick clothes for three seasons
prompt.vi: Chọn đồ cho ba mùa
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find one thing for each season.
messages.start.vi: Em tìm cho mỗi mùa một món nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! You are ready for every season.
messages.balanced.vi: Tuyệt! Mùa nào em cũng sẵn sàng.
messages.has_limited.en: That one does not help with weather.
messages.has_limited.vi: Món này không giúp gì khi nắng, mưa hay lạnh.
messages.missing.tray_north_winter.en: Now find one for a cold winter.
messages.missing.tray_north_winter.vi: Em tìm thêm một món cho mùa đông lạnh nhé.
messages.missing.tray_summer.en: Now find one for hot summer days.
messages.missing.tray_summer.vi: Em tìm thêm một món cho những ngày hè nóng nhé.
messages.missing.tray_south_rain.en: Now find one for the rainy season.
messages.missing.tray_south_rain.vi: Em tìm thêm một món cho mùa mưa nhé.

#### group tray_north_winter
label.en: Winter in the north
label.vi: Mùa đông miền Bắc
color: nau_dat
role: required

#### group tray_summer
label.en: Summer
label.vi: Mùa hè
color: vang_hoe
role: required

#### group tray_south_rain
label.en: Rainy season in the south
label.vi: Mùa mưa miền Nam
color: cham
role: required

#### group tray_other
label.en: Not for sun, rain or cold
label.vi: Không dùng khi nắng, mưa hay lạnh
color: do_son
role: limit
> Nhãn `limit` dạng "Not for …" như bài 1 (đồ không liên quan thời tiết, không có cách nói khẳng định ngắn; `_topic.md` mục Phần Chơi).
> Nhãn hai nhóm mùa có tên miền, khớp hai ô North, South. Nhóm "Summer" không ghi miền (hoa phượng, nắng nóng mùa hè có ở cả hai miền).

#### item tray_coat
label.en: Coat
label.vi: Áo khoác
group: tray_north_winter
image.brief: Dùng lại hình `explore_cold` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): winter coat hanger
image.alt.en: A warm coat on a hanger
image.alt.vi: Chiếc áo khoác ấm trên móc

#### item tray_ball
label.en: Ball
label.vi: Quả bóng
group: tray_other
image.brief: Dùng lại hình `tray_ball` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): colourful rubber bouncy balls
image.alt.en: Colourful rubber balls
image.alt.vi: Những quả bóng cao su nhiều màu

#### item tray_raincoat
label.en: Raincoat
label.vi: Áo mưa
group: tray_south_rain
image.brief: Dùng lại hình `tray_raincoat` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): yellow raincoat with hood
image.alt.en: A yellow raincoat with a hood
image.alt.vi: Chiếc áo mưa vàng có mũ

#### item tray_hat
label.en: Conical hat
label.vi: Nón lá
group: tray_summer
image.brief: Dùng lại hình `w1_hat` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): Vietnamese conical hat non la
image.alt.en: A conical hat
image.alt.vi: Chiếc nón lá

#### item tray_scarf
label.en: Scarf
label.vi: Khăn len
group: tray_north_winter
image.brief: Dùng lại hình `tray_scarf` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): knitted wool scarf
image.alt.en: A knitted scarf
image.alt.vi: Chiếc khăn len

#### item tray_pillow
label.en: Pillow
label.vi: Cái gối
group: tray_other
image.brief: Dùng lại hình `tray_pillow` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): plain white pillow
image.alt.en: A soft pillow
image.alt.vi: Chiếc gối mềm

#### item tray_tshirt
label.en: T-shirt
label.vi: Áo cộc tay
group: tray_summer
image.brief: Dùng lại hình `tray_tshirt` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): plain t-shirt
image.alt.en: A short-sleeved T-shirt
image.alt.vi: Chiếc áo cộc tay

#### item tray_boots
label.en: Rubber boots
label.vi: Ủng cao su
group: tray_south_rain
image.brief: Dùng lại hình `tray_boots` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): rubber boots pair
image.alt.en: A pair of rubber boots
image.alt.vi: Đôi ủng cao su

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q3, q5; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ, một thứ tự đúng). Chữ câu hỏi, đáp án, lựa chọn chốt ở `_topic.md` mục Khung Quiz.
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính. Câu nào cũng tự đủ nghĩa khi chỉ nghe.

### q1
id: 4a2368dd-91de-44fc-bbfe-de859ea15e7c
format: single_choice
version: 1
dok: 1
prompt.en: Which one do you wear on hot days?
prompt.vi: Ngày nóng, em mặc gì?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of playing outside in the sun.
hint.vi: Em nghĩ tới lúc chơi ngoài nắng nhé.
explanation_correct.en: Yes! A T-shirt is thin and cool.
explanation_correct.vi: Đúng rồi! Áo cộc tay mỏng và mát.
explanation_wrong.en: The answer is the T-shirt. It is thin.
explanation_wrong.vi: Đáp án là áo cộc tay. Áo cộc tay mỏng, mặc mát.
> DOK 1: nhớ lại ô Clothes (câu chính) và kệ Chơi. Ba đồ mặc khác hẳn dáng (áo ngắn tay, áo khoác dày, khăn dài), cả ba bé đã gặp từ bài 1.
> Gợi ý là một cảnh quen, không trỏ vào câu chính ô Clothes (câu đó là phán quyết).

#### option q1_coat
correct: false
feedback.en: A warm coat is for cold days.
feedback.vi: Áo khoác ấm dùng cho ngày lạnh.
label.en: coat
label.vi: áo khoác
image.brief: Dùng lại hình `explore_cold` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): winter coat hanger
image.alt.en: A warm coat on a hanger
image.alt.vi: Chiếc áo khoác ấm trên móc

#### option q1_scarf
correct: false
feedback.en: A scarf keeps your neck warm.
feedback.vi: Khăn len giữ ấm cổ em.
label.en: scarf
label.vi: khăn len
image.brief: Dùng lại hình `tray_scarf` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): knitted wool scarf
image.alt.en: A knitted scarf
image.alt.vi: Chiếc khăn len

#### option q1_tshirt
correct: true
label.en: T-shirt
label.vi: áo cộc tay
image.brief: Dùng lại hình `tray_tshirt` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): plain t-shirt
image.alt.en: A short-sleeved T-shirt
image.alt.vi: Chiếc áo cộc tay

### q2
id: 7b513677-91df-442c-8327-d00c57e8c96c
format: true_false
version: 1
dok: 1
prompt.en: The seasons come back every year.
prompt.vi: Năm nào các mùa cũng quay lại.
image.brief: Dùng lại hình `explore_spring` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): Prunus persica blossom
image.alt.en: Pink blossoms on a branch
image.alt.vi: Cành hoa màu hồng
answer: true
hint.en: Think of the flowers you see each year.
hint.vi: Em nghĩ tới những loài hoa năm nào em cũng thấy nhé.
explanation_correct.en: Yes! After winter, spring comes again.
explanation_correct.vi: Đúng rồi! Hết mùa đông lại đến mùa xuân.
explanation_wrong.en: This is true. Each season comes round again.
explanation_wrong.vi: Câu này đúng. Mùa nào rồi cũng quay lại.
feedback_false.en: These pink blossoms open again each year.
feedback_false.vi: Năm nào những bông hoa hồng này cũng lại nở.
> DOK 1: nhớ lại ý chính hai và ô Again and again. Hình là cành hoa đào (dấu hiệu quay lại mỗi năm, hình ô Again and again). Câu khẳng định, đáp án Đúng.

### q3
id: 5547e716-c769-4fe1-9dad-c0972d0ca8e9
format: single_choice
version: 1
dok: 1
prompt.en: Which picture shows autumn?
prompt.vi: Hình nào là mùa thu?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of cool days with blue skies.
hint.vi: Em nghĩ tới những ngày mát, trời xanh trong nhé.
explanation_correct.en: Yes! Yellow leaves are a sign of autumn.
explanation_correct.vi: Đúng rồi! Lá vàng là một dấu hiệu của mùa thu.
explanation_wrong.en: The answer is the yellow leaf. Some leaves turn yellow in autumn.
explanation_wrong.vi: Đáp án là chiếc lá vàng. Mùa thu, có cây lá chuyển vàng.
> DOK 1: nhớ lại bài 3 (ô Autumn, câu q2) và ví dụ hai ô North hôm nay. Ba hình của ba mùa, khác hẳn màu (vàng, hồng, đỏ); cả ba là ảnh quen.
> Gợi ý nhắc câu chính ô Autumn bài 3 (trời mát, xanh trong), không nhắc lá; ảnh lá vàng không có trời xanh, nên gợi ý không chỉ thẳng một thẻ.
> `alt` lá vàng không có chữ "autumn".

#### option q3_peach
correct: false
feedback.en: Peach trees bloom in spring, at Tet.
feedback.vi: Hoa đào nở vào mùa xuân, dịp Tết.
label.en: peach blossom
label.vi: hoa đào
image.brief: Dùng lại hình `explore_spring` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): Prunus persica blossom
image.alt.en: Pink blossoms on a branch
image.alt.vi: Cành hoa màu hồng

#### option q3_yellow
correct: true
label.en: yellow leaf
label.vi: lá vàng
image.brief: Dùng lại hình `q4_yellow` ở bài `thoi-tiet-va-cac-mua/mua-thu-va-mua-dong`. Từ khoá tìm ảnh (EN): autumn leaf on branch
image.alt.en: A yellow leaf on a branch
image.alt.vi: Chiếc lá vàng trên cành
> Ảnh lá vàng mới của chủ đề (gốc ở bài 3 `q4_yellow`, không tuyết); không dùng `q4_yellow` của *Sinh vật sống ở đâu?* (phiên chính 18/11). `alt` không có chữ "autumn" của câu hỏi.

#### option q3_flame
correct: false
feedback.en: Flame trees bloom red in summer.
feedback.vi: Hoa phượng nở đỏ vào mùa hè.
label.en: flame tree
label.vi: hoa phượng
image.brief: Dùng lại hình `explore_summer` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): Delonix regia
image.alt.en: Red flowers on a big tree
image.alt.vi: Hoa đỏ trên cây to

### q4
id: d77c5ccd-cf7a-4158-adb0-81150b29770a
format: order_sequence
version: 1
dok: 2
prompt.en: Order from cold days to hot days.
prompt.vi: Em xếp từ ngày lạnh tới ngày nóng nhé.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_coat, q4_long_sleeve, q4_tshirt
hint.en: Start with the warmest clothes.
hint.vi: Em bắt đầu từ chiếc áo ấm nhất nhé.
explanation_correct.en: Yes! Thick for cold, thin for hot.
explanation_correct.vi: Đúng rồi! Trời lạnh mặc dày, trời nóng mặc mỏng.
explanation_wrong.en: The order is coat, long-sleeved shirt, T-shirt.
explanation_wrong.vi: Thứ tự là áo khoác, áo tay dài, rồi áo cộc tay.
> DOK 2: so sánh ba chiếc áo theo độ dày, xếp theo thời tiết. Một chiều (lạnh tới nóng), không phải vòng. Đúng một thứ tự đúng.
> Gợi ý chỉ nhắc một đầu dải (áo ấm nhất), không gọi tên cả hai đầu (`_topic.md` Lỗi hay gặp số 19). Thẻ trong file không theo thứ tự đúng.

#### item q4_tshirt
label.en: T-shirt
label.vi: áo cộc tay
image.brief: Dùng lại hình `tray_tshirt` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): plain t-shirt
image.alt.en: A short-sleeved T-shirt
image.alt.vi: Chiếc áo cộc tay

#### item q4_coat
label.en: coat
label.vi: áo khoác
image.brief: Dùng lại hình `explore_cold` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): winter coat hanger
image.alt.en: A warm coat on a hanger
image.alt.vi: Chiếc áo khoác ấm trên móc

#### item q4_long_sleeve
label.en: long-sleeved shirt
label.vi: áo tay dài
image.brief: [ảnh] Một chiếc áo sơ mi tay dài trơn màu, vải vừa (không dày như áo khoác), dưới ánh đèn xanh (áo trông màu xanh), thấy thân áo và hai tay áo dài, không thấy móc (khung cắt bỏ cổ, vai và chữ in nổi trên móc; khung vuông có thể mất cổ tay áo); không người mặc, không chữ, không hình in, không nhãn hiệu. Từ khoá tìm ảnh (EN): long sleeve shirt
image.alt.en: A long-sleeved shirt
image.alt.vi: Chiếc áo tay dài
> Hình gốc áo tay dài của chủ đề (key `q4_long_sleeve` ở bảng Hình dùng chung của `_topic.md`). Hình ghép `explore_clothes` dùng ảnh này.
> Ba thẻ cùng kiểu ảnh (áo trên nền trơn hoặc trên móc), cắt vuông cùng cỡ.

### q5
id: 15c3e538-434b-4140-8c87-298abbf77553
format: single_choice
version: 1
dok: 2
prompt.en: Peach trees bloom again. Which season is back?
prompt.vi: Hoa đào lại nở. Mùa nào đã trở lại?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of when families get ready for Tet.
hint.vi: Em nghĩ tới dịp cả nhà chuẩn bị đón Tết nhé.
explanation_correct.en: Yes! Spring brings new leaves and flowers.
explanation_correct.vi: Đúng rồi! Mùa xuân có lộc non và hoa nở.
explanation_wrong.en: The answer is spring. Peach trees bloom then.
explanation_wrong.vi: Đáp án là mùa xuân. Hoa đào nở vào mùa xuân.
> DOK 2: áp ý "mùa quay lại" (ô Again and again) vào một dấu hiệu, chọn ảnh dấu hiệu của đúng mùa. Lựa chọn là mùa: ảnh là dấu hiệu cụ thể (lộc non, trời thu, phố mùa đông trong sương mù), `label` gọi tên mùa. Không ảnh hoa đào nào trong ba lựa chọn (chữ "Peach trees" đã ở `prompt`).
> Gợi ý trỏ tới cảnh quen (chuẩn bị Tết), không gọi tên mùa. Phản hồi nói về dấu hiệu trên ảnh bé chọn.
> [CẦN KIỂM] Hoa đào nở cuối đông, đầu xuân; bé có thể nghĩ tới mùa đông vì dịp Tết ở miền Bắc thường còn rét (`_topic.md` Còn mở số hai). Phản hồi của lựa chọn mùa đông không nói "đào không nở mùa đông".

#### option q5_spring
correct: true
label.en: spring
label.vi: mùa xuân
image.brief: Dùng lại hình `explore_buds` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): leaf buds spring
image.alt.en: Tiny light-green leaves on a twig
image.alt.vi: Những chiếc lá nhỏ màu xanh nhạt trên cành

#### option q5_autumn
correct: false
feedback.en: Autumn is cool, with clear blue skies.
feedback.vi: Mùa thu trời mát, bầu trời xanh trong.
label.en: autumn
label.vi: mùa thu
image.brief: Dùng lại hình `explore_autumn` ở bài `thoi-tiet-va-cac-mua/mua-thu-va-mua-dong`. Từ khoá tìm ảnh (EN): blue sky trees
image.alt.en: Trees under a clear blue sky
image.alt.vi: Hàng cây dưới bầu trời xanh trong

#### option q5_winter
correct: false
feedback.en: Winter mornings are cold and foggy.
feedback.vi: Sáng mùa đông trời lạnh và có sương mù.
label.en: winter
label.vi: mùa đông
image.brief: Dùng lại hình `explore_winter` ở bài `thoi-tiet-va-cac-mua/mua-thu-va-mua-dong`. Từ khoá tìm ảnh (EN): fog in Hanoi
image.alt.en: A foggy winter street
image.alt.vi: Phố mùa đông trong sương mù
> `feedback` đổi 18/11 cho khớp ảnh mới (phố Hà Nội trong sương mù, không người): nói dấu hiệu trên ảnh, không gọi tên đáp án.

### q6
id: 447db139-6304-4039-be5a-f754a19024ea
format: true_false
version: 1
dok: 2
misconception: same_weather_all_year
prompt.en: The weather is the same all year.
prompt.vi: Cả năm thời tiết đều như nhau.
image.brief: Dùng lại hình `explore_seasons` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`.
image.alt.en: Four pictures from one year
image.alt.vi: Bốn hình trong một năm
answer: false
hint.en: Look at the four pictures closely.
hint.vi: Em nhìn thật kỹ bốn hình nhé.
explanation_correct.en: The weather changes with the seasons.
explanation_correct.vi: Thời tiết thay đổi theo mùa.
explanation_wrong.en: This is false. Winter is cold, summer is hot.
explanation_wrong.vi: Câu này sai. Mùa đông lạnh, mùa hè nóng.
feedback_true.en: Each picture shows a different season.
feedback_true.vi: Mỗi hình là một mùa khác nhau.
> Câu misconception (`same_weather_all_year`), bằng hình, DOK 2: bé còn nghĩ "cả năm như nhau" sẽ chạm Đúng. Bé áp ý chính một vào bốn dấu hiệu đã học. Câu chỉ kiểm một việc.
> Hình ghép bốn mùa (đúng vật được nói tới: một năm). Gợi ý trỏ tới bằng chứng nhìn thấy; phản hồi tả hình, không lặp gợi ý.
> `explanation_correct` là đúng câu `correction` ở `_topic.md`, đứng một mình cho thẻ "Ý sai → Ý đúng".
> Câu hỏi nói "the weather" chung, hình là bốn mùa miền Bắc; miền Nam (mùa mưa, mùa khô) cũng làm câu này sai, đã dạy ở ô South.

## Từ vựng

### change
id: efe507a5-ba0a-4828-85b7-164d86ff787f
tier: core
term.en: change
term.vi: thay đổi
example.en: Rainy weather changes to dry, sunny weather.
example.vi: Trời mưa đổi sang trời khô và nắng.
image.brief: Dùng lại hình `explore_south`.
image.alt.en: Heavy rain and a sunny road
image.alt.vi: Mưa to và con đường nắng
> Hình gốc là hình ghép (ô South), nên brief dùng lại không có dòng từ khoá.

### warm
id: 565512c5-f314-451f-9a61-020d14234ef5
tier: core
term.en: warm
term.vi: ấm
example.en: Spring days are warm.
example.vi: Ngày mùa xuân trời ấm.
image.brief: Dùng lại hình `explore_spring` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): Prunus persica blossom
image.alt.en: Pink blossoms on a branch
image.alt.vi: Cành hoa màu hồng
> [CẦN KIỂM] "Spring days are warm" đúng như cách nói chung (bài 2: "days get warmer"); đầu xuân ở Hà Nội có thể còn rét.

### clothes
id: fd020d68-087e-4502-93a5-3cb0fe42098f
tier: extra
term.en: clothes
term.vi: quần áo
example.en: We wear different clothes in each season.
example.vi: Mỗi mùa, mình mặc quần áo khác nhau.
image.brief: Dùng lại hình `explore_clothes`.
image.alt.en: A coat, a shirt and a T-shirt
image.alt.vi: Áo khoác, áo tay dài và áo cộc tay
> Hình gốc là hình ghép (ô Clothes), nên brief dùng lại không có dòng từ khoá.

### t_shirt
id: 851e90a1-8d69-4066-9243-7ad65d423151
tier: extra
term.en: T-shirt
term.vi: áo cộc tay
example.en: I wear a T-shirt on hot days.
example.vi: Ngày nóng, em mặc áo cộc tay.
image.brief: Dùng lại hình `tray_tshirt` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): plain t-shirt
image.alt.en: A short-sleeved T-shirt
image.alt.vi: Chiếc áo cộc tay

## Thưởng

### star_lantern_card
id: bff0710f-fef9-48a7-81be-ebb217c9d9e7
set: weather
rarity: rare
name.en: Star lantern
name.vi: Đèn ông sao
tag.en: Shines at Mid-Autumn
tag.vi: Sáng rực dịp Trung thu
fact.en: It has five points, like a star.
fact.vi: Đèn ông sao có năm cánh như ngôi sao.
image.brief: [hình vẽ] Một chiếc đèn ông sao năm cánh truyền thống bằng giấy cắt (style E), thân giấy đỏ, tua giấy ở bốn cánh dưới, cán tre, thấy rõ cả năm cánh, đặt trên mảnh giấy điệp, nền trơn; không nét viền, không người, không chữ.
image.alt.en: A red paper star lantern
image.alt.vi: Chiếc đèn ông sao bằng giấy đỏ
> Hình tự vẽ (phiên chính duyệt 18/11; designer đang vẽ): ảnh thật hợp lệ duy nhất có nhiều trẻ rõ mặt, crop một chiếc đèn chỉ còn 256 px, mờ ở thẻ thưởng. Ngoại lệ thứ hai của "Hình tự vẽ" sau vòng mười hai tháng (`_topic.md` Quy ước hình số một). Brief theo hình designer đã vẽ (`content/images/own/thoi-tiet-va-cac-mua/mua-lai-ve.reward.star_lantern_card.jpg`); `alt` "A red paper star lantern" khớp hình.
> Thẻ chốt ở `_topic.md`. Đèn ông sao là dấu hiệu mùa thu (ví dụ ô Autumn bài 3), nối bài tổng kết với bộ thẻ `weather`.
> [CẦN KIỂM] Đèn ông sao truyền thống có năm cánh; giọng EN đọc "Mid-Autumn".

## Ghi chú cho hoạ sĩ

- **Hình ghép mới (hai):**
  - `explore_south`: hai ô cạnh nhau, mưa to trên phố `explore_rainy_season` (trái) và con đường khô dưới nắng `explore_dry_season` (phải), cả hai từ bài 4. Dùng ở ô South, từ `change`.
  - `explore_clothes`: ba ô vuông, hai ô trên (áo khoác `explore_cold` bài 1, áo tay dài `q4_long_sleeve` bài này), một ô dưới ở giữa (áo cộc tay `tray_tshirt` bài 1), đọc theo hàng từ dày tới mỏng (bố cục mới 18/11, ô to hơn). Dùng ở ô Clothes; bản 2:1 của từ `clothes` giữ một hàng ba ô.
  - Cả hai: khe hở mỏng màu nền, không viền nét, không chữ, không mũi tên; ghi mục `composed` đủ ghi công từng phần.
- **Ảnh mới (một):** `q4_long_sleeve` (áo sơ mi tay dài dưới ánh đèn xanh, thấy thân áo và hai tay áo dài, không thấy móc, cổ áo; không người mặc; key gốc của cả chủ đề).
- **Hình tự vẽ (một, phiên chính duyệt 18/11):** `star_lantern_card`, đèn ông sao năm cánh giấy cắt style E, đỏ, có tua; không nét viền, không chữ.
- **Ảnh dùng lại trong chủ đề này** (chờ bài gốc xong; key và `alt` theo bảng Hình dùng chung của `_topic.md`):
  - bài 1 `thoi-tiet-hom-nay`: `explore_cold` (kệ Chơi, q1, q4, hình ghép), `tray_scarf` (kệ Chơi, q1), `tray_raincoat`, `tray_boots`, `tray_pillow`, `tray_ball` (kệ Chơi), `tray_tshirt` (kệ Chơi, q1, q4, từ `t_shirt`, hình ghép);
  - bài 2 `mua-xuan-va-mua-he`: `explore_seasons` (ô North, q6), `explore_spring` (ô Again and again, q2, q3, từ `warm`), `explore_summer` (w2, q3), `explore_buds` (q5), `tray_banh_chung` (w1);
  - bài 3 `mua-thu-va-mua-dong`: `explore_autumn`, `explore_winter` (q5);
  - bài 4 `mua-mua-va-mua-kho`: `explore_rainy_season`, `explore_dry_season` (hình ghép ô South).
- **Ảnh dùng lại từ chủ đề khác:** *Gọi tên và nhóm động vật* bài một `w1` (hàng rào tre: hình câu w1, q1, q3, q4, q5), `w1_hat` (nón lá, kệ Chơi; designer kiểm có trông như đồ chơi không, `_topic.md` Đề xuất designer ý 2), bài tám `q3` (bãi biển, w1); *Khủng long* `trai-dat-rat-lau-ve-truoc` `w1_buffalo` (w3). Quả bóng kệ Chơi từ 18/11 dùng `tray_ball` bài 1, không dùng `q1_ball` của *Sinh vật sống ở đâu?* nữa (ảnh có chữ nhãn hiệu). Lá vàng q3 dùng ảnh mới của chủ đề, gốc ở bài 3 `q4_yellow` (18/11).
- **Khung cần kiểm:** q4 ba áo cắt vuông cùng cỡ, cùng kiểu nền, thấy rõ độ dày khác nhau (áo khoác phồng, áo tay dài mỏng vừa, áo cộc tay); q5 ba ảnh cảnh (lộc non chụp gần, hàng cây trời thu, phố mùa đông trong sương mù) phải khác hẳn bằng mắt; q3 ba ảnh khác màu rõ.
- **Màu:** Học: North `nau_dat`, South `cham`, Clothes `vang_hoe`, Again and again `gi_dong`. Chơi: Mùa đông miền Bắc `nau_dat`, Mùa hè `vang_hoe`, Mùa mưa miền Nam `cham`, Không dùng khi nắng, mưa hay lạnh `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (change, warm). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Sai, w3 Sai). Quiz `single_choice` (q1, q3, q5; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`same_weather_all_year`). Không có `labels` ở câu `true_false`.
- **Thứ tự đúng q4:** `q4_coat`, `q4_long_sleeve`, `q4_tshirt`. Thẻ trong file không theo thứ tự đúng.
- **Màn Chơi, ví dụ để kiểm:** Áo khoác, Nón lá, Áo mưa → `balanced`; Khăn len, Áo cộc tay, Quả bóng → `has_limited`; Áo khoác, Khăn len, Áo cộc tay → `missing.tray_south_rain`; Nón lá, Áo mưa, Ủng cao su → `missing.tray_north_winter`; Áo khoác, Ủng cao su, Cái gối → `has_limited`.
- **Khởi động trỏ bài khác:** w1 → `thoi-tiet-va-cac-mua/muoi-hai-thang`, w2 → `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he` (hai bài này phải có id trước khi chạy `ids` bài 6), w3 → `goi-ten-va-nhom-dong-vat/con-vat-an-gi` (đã có id).
- **Hình dùng lại bài 1 tới 4:** brief trỏ sang bài gốc chỉ hợp lệ khi bài gốc đặt đúng key ở bảng Hình dùng chung (`explore_cold`, `tray_scarf`, `tray_raincoat`, `tray_boots`, `tray_pillow`, `tray_tshirt`, `explore_seasons`, `explore_spring`, `explore_summer`, `explore_buds`, `tray_banh_chung`, `explore_autumn`, `explore_winter`, `explore_rainy_season`, `explore_dry_season`). `tray_pillow` dùng đúng từ khoá và `alt` của bài 1 (bảng `alt` ở `_topic.md` đã có dòng này, 17/11).
- **Hình gốc ở bài này:** `explore_south`, `explore_clothes` (hình ghép, mục `composed`), `q4_long_sleeve`, `star_lantern_card` (từ 18/11 là `[hình vẽ]`, mục `own`, `method: "drawn"`, như `explore_months` bài 5; bỏ mục ảnh đèn ông sao đã chọn trong file chọn ảnh).
- **Từ EN có thể ngoài Starters/Movers:** season, suit, autumn, Hanoi, Ho Chi Minh City, peach, bloom, blossoms, flame tree, conical hat, rubber boots, scarf, long-sleeved, buffalo, Tet, banh chung, Mid-Autumn, lantern. Nghe thử giọng EN đọc "Ho Chi Minh City", "Mid-Autumn", "banh chung"; giọng VI đọc "Thành phố Hồ Chí Minh", "áo cộc tay", "ủng cao su".
- **Grep chữ bé nghe (tự kiểm 17/11):** không có chữ nào trong danh sách cấm ở `_topic.md` Lỗi hay gặp số 17.
