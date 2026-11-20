---
id: 197e5e88-5b0d-4823-9040-fcabf480d73f
topic: nui-song-va-bien
slug: nui-va-doi
order: 2
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Mountains and hills
vi: Núi và đồi
> Giữ đúng tên ở `content/syllabus.json` (key `new-mountains-rivers-and-seas`, bài số hai). `id` là `lesson_id` của danh mục.

## Mục tiêu
en: I can tell mountains and hills apart.
vi: Em phân biệt được núi và đồi.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 19/11/2026. Ticket SK-058. Mọi dòng `id:` khác để trống.
> Ý của SK-058: núi cao, dốc; đồi thấp, tròn; Phan Xi Păng là núi cao nhất Việt Nam. Thêm ý "trên núi cao thì mát" để sửa `mountain_top_warmer` (ô Cool up high, câu q5, q6). Không dạy vì sao có núi, vì sao lên cao thì lạnh (Discoverer #9, Scientist #3); không núi lửa.

## Ý chính
1.en: Mountains are very high and steep.
1.vi: Núi rất cao và dốc.
2.en: Hills are lower and rounder than mountains.
2.vi: Đồi thấp hơn và tròn hơn núi.
3.en: High on a mountain, the air is cool.
3.vi: Lên cao trên núi, không khí mát.
> Từ cụ thể tới trừu tượng: hình dáng núi, rồi so với đồi, rồi điều cảm thấy khi lên cao.
> Ghép với ô Học (`KeyPointPictures.match`): ý 1 → Mountain (ba từ chung), ý 2 → Hill (bốn), ý 3 → Cool up high (bốn). Ô Fansipan không ghép.

## Khởi động

> Hai câu: w1 ôn bài trước (hình vẽ toàn cảnh); w2 ôn *Thời tiết và các mùa* bài 1 (trời lạnh mặc áo khoác ấm), làm nền cho ô Cool up high (ví dụ "bring a warm coat") và lời khen câu q5.

### w1
id: b094998e-f8d6-4137-9f8f-bea3658290bc
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: nui-song-va-bien/dat-lien-va-bien
prompt.en: From a plane, we see land and sea.
prompt.vi: Từ máy bay, mình thấy đất liền và biển.
image.brief: Dùng lại hình `q6` ở bài `nui-song-va-bien/dat-lien-va-bien`.
image.alt.en: Land and sea seen from up high
image.alt.vi: Đất liền và biển nhìn từ trên cao
answer: true
hint.en: Think of looking down from up high.
hint.vi: Em nghĩ tới lúc nhìn xuống từ trên cao nhé.
explanation_correct.en: Yes! The sea looks wide and blue.
explanation_correct.vi: Đúng rồi! Biển trông rộng và xanh.
explanation_wrong.en: This is true. We see land and sea.
explanation_wrong.vi: Câu này đúng. Mình thấy cả đất liền và biển.
feedback_false.en: This picture shows land and sea.
feedback_false.vi: Hình này có cả đất liền và biển.
> Ôn câu chính ô From up high bài 1. Hình vẽ toàn cảnh, bản khung 4:3 `q6` của bài 1 (designer 19/11; cùng bản vẽ với `explore_above`). Câu `true_false`, một hình, không trộn loại hình.

### w2
id: af789d9f-151c-4606-a78d-2e19202c6139
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: thoi-tiet-va-cac-mua/thoi-tiet-hom-nay
prompt.en: What do we wear on cold days?
prompt.vi: Trời lạnh, mình mặc gì?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of a chilly, windy morning.
hint.vi: Em nghĩ tới một buổi sáng gió lạnh nhé.
explanation_correct.en: Yes! A thick coat keeps you warm.
explanation_correct.vi: Đúng rồi! Áo khoác dày giữ ấm cho em.
explanation_wrong.en: The answer is the warm coat. It is thick.
explanation_wrong.vi: Đáp án là áo khoác ấm. Áo khoác dày.
> Ôn câu chính ô Cold của #5 bài 1 ("On cold days, we wear a warm coat."). Câu mới, khác q1 "What do we wear on rainy days?" của bài đó. `alt` đáp án ("A warm coat on a hanger") không có chữ của câu hỏi.

#### option w2_coat
correct: true
label.en: warm coat
label.vi: áo khoác ấm
image.brief: Dùng lại hình `explore_cold` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): winter coat hanger
image.alt.en: A warm coat on a hanger
image.alt.vi: Chiếc áo khoác ấm trên móc

#### option w2_tshirt
correct: false
feedback.en: A T-shirt is thin, for hot days.
feedback.vi: Áo cộc tay mỏng, mặc ngày nóng.
label.en: T-shirt
label.vi: áo cộc tay
image.brief: Dùng lại hình `tray_tshirt` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): plain t-shirt
image.alt.en: A short-sleeved T-shirt
image.alt.vi: Chiếc áo cộc tay

## Học

> Bốn ô: núi, đồi (so hình dáng), một ngọn núi Việt Nam (Phan Xi Păng), rồi điều cảm thấy khi lên cao (mát). Lượt sửa 19/11 (tester n2): "mát lạnh" đổi thành "mát" ở sáu chỗ, khớp "cool" và câu `correction` "mát hơn".
> Chữ cần dạy trước khi hỏi: "peak" (q1, từ `peak`) ở ô Mountain; "low", "round" (q1, q2) ở ô Hill; "tallest mountain in Vietnam" (q3) ở ô Fansipan; "even in summer, it feels cool" (q5) ở ô Cool up high.
> **Tên nơi** (SK-058 khuyến nghị 6): ô Fansipan cần ảnh đúng đỉnh Phan Xi Păng, giấy phép hợp lệ. Thiếu ảnh thì dùng câu dự phòng ở dòng `>` dưới ô (cùng ảnh núi cao chung), đồng thời đổi câu q3, món `tray_fansipan`, từ `peak`, thẻ thưởng như ghi ở từng chỗ.

### explore
id: 1e020c4e-6886-44a6-80ae-6dcd85d4e4bc
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_mountain
label.en: Mountain
label.vi: Núi
color: nau_dat
sentence.en: Mountains are very high, with steep sides.
sentence.vi: Núi rất cao, sườn núi dốc đứng.
image.brief: Dùng lại hình `tray_mountain` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): steep mountain peak clouds
image.alt.en: A tall, steep peak
image.alt.vi: Đỉnh cao, sườn dốc đứng
examples.1.en: the top is called the peak
examples.1.vi: chỗ cao nhất gọi là đỉnh núi
examples.2.en: steep sides are hard to climb
examples.2.vi: sườn dốc rất khó leo
examples.3.en: the north has many mountains
examples.3.vi: miền Bắc có nhiều núi
> Ví dụ một dạy trước từ `peak`; ví dụ hai dạy trước từ `steep`.
> [CẦN KIỂM] Miền Bắc Việt Nam có nhiều núi (vùng núi phía Bắc, Tây Bắc).

#### group explore_hill
label.en: Hill
label.vi: Đồi
color: gi_dong
sentence.en: Hills are lower and rounder than mountains.
sentence.vi: Đồi thấp hơn và tròn hơn núi.
image.brief: Dùng lại hình `tray_hill` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): round green hill
image.alt.en: A low, round, green slope
image.alt.vi: Sườn đất thấp, tròn, xanh mướt
examples.1.en: tea grows on green hills
examples.1.vi: chè mọc trên những quả đồi xanh
examples.2.en: you can walk up a hill
examples.2.vi: em có thể đi bộ lên đồi
examples.3.en: kites fly high on hilltops
examples.3.vi: diều bay cao trên đỉnh đồi
> [CẦN KIỂM] Chè trồng nhiều trên đồi (Mộc Châu, Thái Nguyên).

#### group explore_fansipan
label.en: Fansipan
label.vi: Phan Xi Păng
color: vang_hoe
sentence.en: Fansipan is the tallest mountain in Vietnam.
sentence.vi: Phan Xi Păng là ngọn núi cao nhất Việt Nam.
image.brief: [ảnh] **Cần ảnh đúng đỉnh Phan Xi Păng (Fansipan), giấy phép hợp lệ (CC0, PD, PDM, CC BY); thiếu thì bỏ tên** (dùng ảnh dãy núi cao chung và câu dự phòng). Ảnh đã chọn (designer 19/11): "Der Fansipan", chụp từ Sa Pa, CC0 — dãy núi cao nhiều lớp mờ sương dưới trời xanh, không mây trắng quanh đỉnh, vài công trình rất nhỏ, mờ trên đỉnh (không đọc ra); trang gốc ghi rõ là Fansipan; không cột mốc tam giác có chữ trên đỉnh, không cáp treo, không chùa, tượng, công trình; không người nhìn rõ mặt; không chữ, không tuyết dày kiểu núi ôn đới. Ảnh ngang có khoảng trống (khung vuông ở Học, kệ Chơi, thẻ thưởng; khung 4:3 câu q3). Từ khoá tìm ảnh (EN): Fansipan peak; Fansipan mountain clouds; Hoang Lien Son range
image.alt.en: Fansipan, tall and misty
image.alt.vi: Phan Xi Păng cao vút, mờ sương
examples.1.en: near Sa Pa, in the north
examples.1.vi: ở gần Sa Pa, miền Bắc
examples.2.en: clouds often cover the top
examples.2.vi: mây thường phủ kín đỉnh núi
examples.3.en: it is cold up there
examples.3.vi: trên đó trời lạnh
> Hình gốc của bài (kệ Chơi `tray_fansipan`, câu q3, thẻ `fansipan_card`; từ `peak` dùng `tray_mountain` từ lượt 2).
> **Câu dự phòng khi thiếu ảnh đúng nơi** (ảnh núi cao chung giữa mây): `label` "Tall mountains" · "Núi cao"; `sentence` "Some mountains reach above the clouds." · "Có ngọn núi cao vượt lên trên mây."; ví dụ một "the tallest ones are in the north" · "núi cao nhất ở miền Bắc"; ví dụ hai, ba giữ; `alt` "A peak above the clouds" · "Đỉnh núi vượt lên trên mây". Ghép ý chính không đổi (đã tính). Ghi tên nơi bị bỏ ở `_topic.md`.
> [CẦN KIỂM] Phan Xi Păng là núi cao nhất Việt Nam (khoảng ba nghìn một trăm bốn mươi ba mét; bài không nói số), thuộc dãy Hoàng Liên Sơn, gần Sa Pa; mây thường phủ đỉnh. Nghe thử EN "Fansipan", VI "Phan Xi Păng".

#### group explore_cool
label.en: Cool up high
label.vi: Trên cao trời mát
color: cham
sentence.en: High on a mountain, the air is cool.
sentence.vi: Lên cao trên núi, không khí mát.
image.brief: [ảnh] Biển mây trắng nằm dưới các đỉnh núi, chụp từ một đỉnh núi hay sườn núi cao lúc sáng sớm, thấy vài đỉnh núi nhô lên khỏi mây; trời xanh nhạt; không người, không lều, không cột mốc, không chữ; không tuyết. Ưu tiên cảnh núi Việt Nam (Tà Xùa, Sa Pa) nhưng `alt` không nêu tên nơi. Ảnh ngang có khoảng trống (khung vuông ở Học, thẻ hai lựa chọn 17:10 câu q5, khung 4:3 bài 6 w2). Từ khoá tìm ảnh (EN): sea of clouds mountains; clouds below mountain peaks; cloud sea sunrise mountain
image.alt.en: Clouds below the mountain tops
image.alt.vi: Mây trắng dưới các đỉnh núi
examples.1.en: bring a warm coat
examples.1.vi: mang theo áo ấm
examples.2.en: clouds float below you
examples.2.vi: mây trôi ngay dưới chân
examples.3.en: even in summer, it feels cool
examples.3.vi: mùa hè trên đó vẫn mát
> Ảnh đã chọn (designer 19/11): biển mây chụp từ đỉnh Phan Xi Păng (Flickr, PDM 1.0), một đỉnh tối nhô giữa mây, góc trái dưới còn ngọn một cành cây mảnh. Khớp chữ, `alt` giữ, không nêu tên nơi.
> Hình gốc của chủ đề (câu q5; bài 6 w2). Ô sửa `mountain_top_warmer`; ví dụ ba dạy trước câu q5, ví dụ một dạy trước lời khen câu q5.
> Không nói vì sao lên cao thì mát (ngoài phạm vi, Discoverer). Không nói số độ.
> [CẦN KIỂM] Không khí trên núi cao mát hơn đồng bằng, kể cả mùa hè (Sa Pa mùa hè mát).

### new_words
id: cfbd6102-4b9e-4cbc-8923-1dab6d1af188
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: mountain, hill

## Chơi

> Bé chọn một ngọn núi, một quả đồi, một chỗ đất bằng. Đạt khi đủ ba nhóm và không chọn món bẫy.
> Món bẫy do người làm ra nhưng trông giống đất cao: đống rơm tròn như quả đồi, toà nhà cao vươn lên như núi.
> Kệ bảy món, toàn ảnh chụp.

### tray
id: 61de1ad2-f0be-402e-a354-83f74814aa92
type: build_tray
version: 1
prompt.en: Find a mountain, a hill and flat land
prompt.vi: Tìm núi, đồi và đất bằng
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick a mountain, a hill and flat land.
messages.start.vi: Em chọn một ngọn núi, một quả đồi và một chỗ đất bằng nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! You know high and flat land.
messages.balanced.vi: Tuyệt! Em đã biết đất cao và đất bằng.
messages.has_limited.en: People made that one.
messages.has_limited.vi: Cái này do người làm ra.
messages.missing.tray_mountains.en: You still need a mountain.
messages.missing.tray_mountains.vi: Em còn thiếu một ngọn núi.
messages.missing.tray_hills.en: You still need a hill.
messages.missing.tray_hills.vi: Em còn thiếu một quả đồi.
messages.missing.tray_flat.en: You still need some flat land.
messages.missing.tray_flat.vi: Em còn thiếu một chỗ đất bằng.
> Lời nhắn `has_limited` đúng với cả hai món bẫy (đống rơm, toà nhà).

#### group tray_mountains
label.en: Mountain
label.vi: Núi
color: nau_dat
role: required

#### group tray_hills
label.en: Hill
label.vi: Đồi
color: gi_dong
role: required

#### group tray_flat
label.en: Flat land
label.vi: Đất bằng
color: vang_hoe
role: required

#### group tray_made
label.en: Made by people
label.vi: Do người làm ra
color: do_son
role: limit

#### item tray_mountain
label.en: Steep peak
label.vi: Đỉnh núi dốc
group: tray_mountains
image.brief: Dùng lại hình `tray_mountain` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): steep mountain peak clouds
image.alt.en: A tall, steep peak
image.alt.vi: Đỉnh cao, sườn dốc đứng

#### item tray_fansipan
label.en: Fansipan
label.vi: Phan Xi Păng
group: tray_mountains
image.brief: Dùng lại hình `explore_fansipan`. Từ khoá tìm ảnh (EN): Fansipan peak
image.alt.en: Fansipan, tall and misty
image.alt.vi: Phan Xi Păng cao vút, mờ sương
> Dự phòng khi thiếu ảnh đúng nơi: `label` "Tall mountains" · "Núi cao", `alt` theo ô Học.

#### item tray_hill
label.en: Round hill
label.vi: Đồi tròn
group: tray_hills
image.brief: Dùng lại hình `tray_hill` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): round green hill
image.alt.en: A low, round, green slope
image.alt.vi: Sườn đất thấp, tròn, xanh mướt

#### item tray_grass_hills
label.en: Grassy hills
label.vi: Đồi cỏ
group: tray_hills
image.brief: [ảnh] Vài quả đồi thấp phủ cỏ, đỉnh tròn, sườn thoai thoải nối nhau, chụp ngang từ xa, trời xanh; không có núi nhọn cao trong khung; không người, không nhà lớn, không đường dây điện, không chữ. Ảnh Việt Nam (đồi cỏ Đà Lạt, Mộc Châu) thì tốt, `alt` không nêu tên nơi. Khác `tray_hill` (khác ảnh, cùng kiểu đồi). Từ khoá tìm ảnh (EN): rolling grassy hills; green grassy hills; grass hills Vietnam
image.alt.en: Soft, grassy slopes
image.alt.vi: Những quả đồi cỏ thoai thoải
> Ảnh mới, chỉ dùng ở bài này (kệ Chơi, từ `hill`). Ảnh đã chọn (designer 19/11): đồi cỏ thoai thoải (Unsplash, không rõ nước); chữ không nói nơi chụp, khớp.

#### item tray_fields
label.en: Rice fields
label.vi: Ruộng lúa
group: tray_flat
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh

#### item tray_straw
label.en: Straw pile
label.vi: Đống rơm
group: tray_made
image.brief: Dùng lại hình `tray_straw` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`. Từ khoá tìm ảnh (EN): rice straw pile Vietnam
image.alt.en: A pile of rice straw
image.alt.vi: Đống rơm khô
> Món bẫy giống nhóm "Hill": tròn như quả đồi nhưng do người chất lên.

#### item tray_building
label.en: Tall building
label.vi: Toà nhà cao
group: tray_made
image.brief: Dùng lại hình `tray_building` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): tall building blue sky
image.alt.en: A tall building
image.alt.vi: Toà nhà cao tầng

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1 ba lựa chọn, q5 hai lựa chọn), `true_false` (q2 Sai, q3 Đúng, q6 Sai), `order_sequence` (q4).
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính. Mọi lựa chọn, thẻ là ảnh chụp bé đã gặp ở Học hay kệ Chơi.

### q1
id: a9ccc7fe-9193-47b4-b453-542f7547c8b5
format: single_choice
version: 1
dok: 1
prompt.en: Which one is a mountain?
prompt.vi: Hình nào là ngọn núi?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look at how high each one goes.
hint.vi: Em nhìn xem mỗi nơi cao tới đâu nhé.
explanation_correct.en: Yes! Its steep sides go up high.
explanation_correct.vi: Đúng rồi! Sườn núi dốc, vươn lên rất cao.
explanation_wrong.en: The answer is the mountain. It is very high.
explanation_wrong.vi: Đáp án là ngọn núi. Núi rất cao.
> DOK 1: nhận ra núi (ô Mountain). `alt` đáp án không có chữ "mountain" · "núi".

#### option q1_hill
correct: false
feedback.en: A hill is low, with a round top.
feedback.vi: Quả đồi thấp, đỉnh tròn.
label.en: hill
label.vi: quả đồi
image.brief: Dùng lại hình `tray_hill` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): round green hill
image.alt.en: A low, round, green slope
image.alt.vi: Sườn đất thấp, tròn, xanh mướt

#### option q1_mountain
correct: true
label.en: mountain
label.vi: ngọn núi
image.brief: Dùng lại hình `tray_mountain` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): steep mountain peak clouds
image.alt.en: A tall, steep peak
image.alt.vi: Đỉnh cao, sườn dốc đứng

#### option q1_fields
correct: false
feedback.en: Rice fields lie on flat land.
feedback.vi: Ruộng lúa nằm trên đất bằng.
label.en: rice fields
label.vi: ruộng lúa
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh

### q2
id: 80df5434-0e4c-4161-a9b8-fb415ca039b1
format: true_false
version: 1
dok: 1
prompt.en: Hills are taller than mountains.
prompt.vi: Đồi cao hơn núi.
image.brief: Dùng lại hình `tray_hill` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): round green hill
image.alt.en: A low, round, green slope
image.alt.vi: Sườn đất thấp, tròn, xanh mướt
answer: false
hint.en: Think how long each climb takes.
hint.vi: Em nghĩ xem leo lên mỗi nơi mất bao lâu nhé.
explanation_correct.en: Hills are lower and rounder than mountains.
explanation_correct.vi: Đồi thấp hơn và tròn hơn núi.
explanation_wrong.en: This is false. Mountains are taller.
explanation_wrong.vi: Câu này sai. Núi cao hơn đồi.
feedback_true.en: These hills have low, round tops.
feedback_true.vi: Những quả đồi này có đỉnh thấp, tròn.
> DOK 1: nhớ lại ý chính hai. Câu khẳng định, đáp án Sai; `explanation_correct` là đúng câu ý chính hai, đứng một mình.

### q3
id: 69b797f5-933c-4336-978f-d372d8d14437
format: true_false
version: 1
dok: 1
prompt.en: Fansipan is the tallest mountain in Vietnam.
prompt.vi: Phan Xi Păng là ngọn núi cao nhất Việt Nam.
image.brief: Dùng lại hình `explore_fansipan`. Từ khoá tìm ảnh (EN): Fansipan peak
image.alt.en: Fansipan, tall and misty
image.alt.vi: Phan Xi Păng cao vút, mờ sương
answer: true
hint.en: Look how high it rises.
hint.vi: Em nhìn xem núi vươn cao tới đâu nhé.
explanation_correct.en: Yes! It stands near Sa Pa, in the north.
explanation_correct.vi: Đúng rồi! Núi ở gần Sa Pa, miền Bắc.
explanation_wrong.en: This is true. It is our tallest mountain.
explanation_wrong.vi: Câu này đúng. Đây là ngọn núi cao nhất nước mình.
feedback_false.en: Mist covers its high, steep slopes.
feedback_false.vi: Sương mờ phủ những sườn núi cao, dốc.
> DOK 1: nhớ lại câu chính ô Fansipan (bé kể được một nơi ở Việt Nam, mục tiêu SK-058). Gợi ý trỏ vào điều thấy trong hình (núi vươn rất cao), không gọi ô Học.
> Lượt sửa 19/11 theo ảnh thật (designer lệch 1: núi mờ sương, không có mây quanh đỉnh): `hint` cũ "Think of the clouds around its top." → "Look how high it rises."; `feedback_false` cũ "Its top often hides in the clouds." → "Mist covers its high, steep slopes.".
> **Câu dự phòng khi thiếu ảnh đúng nơi:** `prompt` "Some mountains reach above the clouds." · "Có ngọn núi cao vượt lên trên mây." (Đúng); `hint` giữ; `explanation_correct` "Yes! From up there, clouds look like a sea." · "Đúng rồi! Từ trên đó, mây trông như biển."; `explanation_wrong` "This is true. Some peaks rise above clouds." · "Câu này đúng. Có đỉnh núi cao hơn cả mây."; `feedback_false` giữ.
> [CẦN KIỂM] Phan Xi Păng là núi cao nhất Việt Nam, gần Sa Pa.

### q4
id: 14660684-400e-417c-9a48-20ff2ea558e2
format: order_sequence
version: 1
dok: 2
prompt.en: Start with the highest. Put them in order.
prompt.vi: Bắt đầu từ chỗ cao nhất. Em xếp theo thứ tự nhé.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_mountain, q4_hill, q4_fields
hint.en: Flat land is the lowest.
hint.vi: Đất bằng là thấp nhất.
explanation_correct.en: Yes! Mountains are the highest of all.
explanation_correct.vi: Đúng rồi! Núi là cao nhất.
explanation_wrong.en: The order is mountain, hill, then flat land.
explanation_wrong.vi: Thứ tự là núi, đồi, rồi đất bằng.
> DOK 2: so độ cao ba loại đất (bài 1 ý chính hai, bài này ý chính một, hai). `prompt` nêu đầu cao; gợi ý chỉ nhắc đầu kia. Thẻ trong file không theo thứ tự đúng. Ba thẻ là ảnh chụp, khung vuông.

#### item q4_hill
label.en: hill
label.vi: đồi
image.brief: Dùng lại hình `tray_hill` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): round green hill
image.alt.en: A low, round, green slope
image.alt.vi: Sườn đất thấp, tròn, xanh mướt

#### item q4_fields
label.en: flat land
label.vi: đất bằng
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh

#### item q4_mountain
label.en: mountain
label.vi: núi
image.brief: Dùng lại hình `tray_mountain` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): steep mountain peak clouds
image.alt.en: A tall, steep peak
image.alt.vi: Đỉnh cao, sườn dốc đứng

### q5
id: 0fc15ab2-8e38-4952-97b3-0d6a2c5efe0d
format: single_choice
version: 1
dok: 2
prompt.en: Where is it cool even in summer?
prompt.vi: Mùa hè, ở đâu vẫn mát?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for clouds close by.
hint.vi: Em tìm hình có mây ở ngay gần nhé.
explanation_correct.en: Yes! The wind up there feels chilly.
explanation_correct.vi: Đúng rồi! Trên đó gió thổi lạnh.
explanation_wrong.en: The answer is the mountain top. It is high.
explanation_wrong.vi: Đáp án là đỉnh núi. Ở đó rất cao.
> DOK 2: áp ý chính ba vào mốc quen (mùa hè, ví dụ ba ô Cool up high "even in summer, it feels cool"). Hai ảnh bé đã gặp hôm nay (ô Cool up high, kệ Chơi). `alt` đáp án ("Clouds below the mountain tops" · "Mây trắng dưới các đỉnh núi") không có chữ của câu hỏi. Gợi ý chỉ điều nhìn thấy (mây ở gần), không nói "mát", "cao".
> Lượt sửa 19/11 (tester n8): câu cũ "Where would you need a warm coat?" · "Ở đâu em cần mặc áo ấm?" nước đôi (mùa đông miền Bắc ở ruộng cũng cần áo ấm); chốt mốc mùa hè. Lời khen nói gió lạnh trên cao (tester n13, phương án b), không thêm lần thứ tư chữ "áo ấm".

#### option q5_cool
correct: true
label.en: mountain top
label.vi: đỉnh núi
image.brief: Dùng lại hình `explore_cool`. Từ khoá tìm ảnh (EN): sea of clouds mountains
image.alt.en: Clouds below the mountain tops
image.alt.vi: Mây trắng dưới các đỉnh núi

#### option q5_fields
correct: false
feedback.en: These rice fields lie low and flat.
feedback.vi: Ruộng lúa này nằm thấp và bằng phẳng.
label.en: rice fields
label.vi: ruộng lúa
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh

### q6
id: f529f83b-45c3-4c0a-a6d4-2cc2e4b41cad
format: true_false
version: 1
dok: 2
misconception: mountain_top_warmer
prompt.en: It is hotter on top of a mountain.
prompt.vi: Lên đỉnh núi thì trời nóng hơn.
image.brief: Dùng lại hình `tray_mountain` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): steep mountain peak clouds
image.alt.en: A tall, steep peak
image.alt.vi: Đỉnh cao, sườn dốc đứng
answer: false
hint.en: Think of clouds and wind up there.
hint.vi: Em nghĩ tới mây và gió trên cao nhé.
explanation_correct.en: High on a mountain, the air is cooler.
explanation_correct.vi: Lên cao trên núi, không khí mát hơn.
explanation_wrong.en: This is false. Mountain tops are cool.
explanation_wrong.vi: Câu này sai. Trên đỉnh núi trời mát.
feedback_true.en: People bring warm coats up mountains.
feedback_true.vi: Người ta mang áo ấm khi lên núi.
> Câu misconception (`mountain_top_warmer`), bằng hình, DOK 2: bé còn nghĩ "lên cao gần Mặt Trời nên nóng" sẽ chạm gật đầu. Câu chỉ kiểm một việc: trên núi cao nóng hơn hay mát hơn. Câu không nhắc Mặt Trời (không gợi lý do sai, không bảo bé nhìn Mặt Trời). Hình là đỉnh núi (vật bé phải nghĩ tới), không phải biển mây, để hình không làm bằng chứng thay cho việc nhớ.
> `explanation_correct` là đúng câu `correction` ở `_topic.md`. `feedback_true` (áo ấm) và gợi ý (mây, gió) không lặp ý.
> [CẦN KIỂM] Nhiệt độ không khí giảm khi lên cao.

## Từ vựng

### mountain
id: cabcdd9e-8fca-485f-b7df-98ab82c3af04
tier: core
term.en: mountain
term.vi: núi
example.en: Clouds cover the top of the mountain.
example.vi: Mây phủ kín đỉnh núi.
image.brief: Dùng lại hình `tray_mountain` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): steep mountain peak clouds
image.alt.en: A tall, steep peak
image.alt.vi: Đỉnh cao, sườn dốc đứng

### hill
id: e632c6f8-aa41-4360-befe-b270eadfffa4
tier: core
term.en: hill
term.vi: đồi
example.en: We fly kites on the hill.
example.vi: Chúng mình thả diều trên đồi.
image.brief: Dùng lại hình `tray_grass_hills`. Từ khoá tìm ảnh (EN): rolling grassy hills
image.alt.en: Soft, grassy slopes
image.alt.vi: Những quả đồi cỏ thoai thoải

### steep
id: 6c3ead86-e477-426f-8452-bb158f30e574
tier: extra
term.en: steep
term.vi: dốc
example.en: This path is very steep.
example.vi: Con đường này rất dốc.
image.brief: Dùng lại hình `tray_mountain` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): steep mountain peak clouds
image.alt.en: A tall, steep peak
image.alt.vi: Đỉnh cao, sườn dốc đứng

### peak
id: 44898efc-5f47-4568-9dda-242049dae7c7
tier: extra
term.en: peak
term.vi: đỉnh núi
example.en: The peak is the very top.
example.vi: Đỉnh núi là chỗ cao nhất.
image.brief: Dùng lại hình `tray_mountain` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): steep mountain peak clouds
image.alt.en: A tall, steep peak
image.alt.vi: Đỉnh cao, sườn dốc đứng
> Lượt 2 (tester c9, designer 19/11): ảnh Phan Xi Păng là dãy núi dài mờ sương, khó chỉ ra "chỗ cao nhất"; thẻ từ nay dùng đỉnh nhọn `tray_mountain`.

## Thưởng

### fansipan_card
id: e81e6561-b64e-46a7-a412-42d508c458b9
set: landforms
rarity: common
name.en: Fansipan
name.vi: Núi Phan Xi Păng
tag.en: High in the clouds
tag.vi: Cao tít trong mây
fact.en: Sometimes, snow falls on its top.
fact.vi: Có năm, tuyết rơi trên đỉnh núi.
image.brief: Dùng lại hình `explore_fansipan`. Từ khoá tìm ảnh (EN): Fansipan peak
image.alt.en: Fansipan, tall and misty
image.alt.vi: Phan Xi Păng cao vút, mờ sương
> Bộ `set: landforms`. Ý "tuyết" khớp với `winter_means_snow` của #5 bài 3 ("tuyết chỉ thỉnh thoảng có ở núi cao phía Bắc").
> **Thẻ dự phòng khi thiếu ảnh đúng nơi:** key `misty_peak_card`, `name` "Misty peak" · "Đỉnh núi mây mù", `tag` giữ, `fact` "Some mountain tops get frost." · "Có đỉnh núi phủ sương giá.", hình dùng lại ảnh núi cao chung của ô Học.
> [CẦN KIỂM] Một số năm có tuyết rơi, băng giá trên đỉnh Phan Xi Păng.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật (CC0, PD, PDM, CC BY có ghi công). Hình vẽ toàn cảnh của bài 1 (bản 4:3 `q6`) chỉ ở câu w1 (câu `true_false`, một hình).
- **Ảnh mới (ba):** `explore_fansipan` (đỉnh Phan Xi Păng, **cần ảnh đúng nơi**, mở trang gốc kiểm địa điểm và giấy phép; không cột mốc có chữ, không cáp treo, không chùa), `explore_cool` (biển mây dưới đỉnh núi), `tray_grass_hills` (đồi cỏ thoai thoải).
- **Thiếu ảnh Phan Xi Păng hợp lệ:** dùng ảnh núi cao chung giữa mây cho `explore_fansipan` (giữ key), đổi chữ theo các dòng "Câu dự phòng" (ô Học, món `tray_fansipan`, câu q3, từ `peak`, thẻ `misty_peak_card`), ghi vào mục "Tên nơi đã bỏ" ở `_topic.md`.
- **Dùng lại trong chủ đề (bài 1):** `tray_mountain`, `tray_hill`, `tray_building`, `q6` (hình vẽ toàn cảnh 4:3).
- **Dùng lại chủ đề khác:** `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha` `w1` (hàng rào tre); `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay` `explore_cold`, `tray_tshirt` (w2); Discoverer `khung-long/trai-dat-rat-lau-ve-truoc` `q2_rice` (ruộng lúa: kệ, q1, q4, q5; chép mục); `chuoi-thuc-an/chuoi-thuc-an-la-gi` `tray_straw` (kệ).
- **Núi khác đồi rõ bằng mắt** (luật Explorer số bảy): núi nhọn, dốc, đá; đồi thấp, tròn, phủ cỏ hay chè. Ba ảnh câu q4 phải thấy ngay cao, vừa, thấp.
- **Không:** núi lửa, thác, hẻm núi, tuyết dày kiểu núi ôn đới, người leo vách đá.
- **Màu:** Học: Mountain `nau_dat`, Hill `gi_dong`, Fansipan `vang_hoe`, Cool up high `cham`. Chơi: Núi `nau_dat`, Đồi `gi_dong`, Đất bằng `vang_hoe`, Do người làm ra `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (mountain, hill). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `true_false` (w1 Đúng), `single_choice` (w2, hai lựa chọn). Quiz `single_choice` (q1 ba lựa chọn, q5 hai lựa chọn), `true_false` (q2 Sai, q3 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`mountain_top_warmer`). Không có `labels` ở câu `true_false`.
- **Màn Chơi, ví dụ để kiểm:** Đỉnh núi dốc, Đồi tròn, Ruộng lúa → `balanced`; Phan Xi Păng, Đồi cỏ, Ruộng lúa → `balanced`; Đỉnh núi dốc, Phan Xi Păng, Ruộng lúa → `missing.tray_hills`; Đống rơm, Đỉnh núi dốc, Ruộng lúa → `has_limited`; Toà nhà cao, Đồi tròn, Ruộng lúa → `has_limited`.
- **Khởi động:** w1 → `nui-song-va-bien/dat-lien-va-bien` (id có sẵn ở frontmatter bài 1); w2 → `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay` (đã có id).
- **Thẻ thưởng:** `fansipan_card`, bộ `landforms`.
- **Từ EN có thể ngoài Starters/Movers:** steep, peak, rounder, tallest, Fansipan, chilly, kites, hilltops, straw, grassy. Nghe thử giọng EN đọc "Fansipan", "Sa Pa"; giọng VI đọc "Phan Xi Păng", "thoai thoải", "dốc đứng".
