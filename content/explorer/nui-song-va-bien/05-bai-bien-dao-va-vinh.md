---
id: 895ac6db-2dfe-4031-8867-291ab64dff1c
topic: nui-song-va-bien
slug: bai-bien-dao-va-vinh
order: 5
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Beaches, islands and bays
vi: Bãi biển, đảo và vịnh
> Giữ đúng tên ở `content/syllabus.json` (key `new-mountains-rivers-and-seas`, bài số năm). `id` là `lesson_id` của danh mục.

## Mục tiêu
en: I can name beaches, islands and bays.
vi: Em gọi tên được bãi biển, đảo và vịnh.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 19/11/2026. Ticket SK-058. Mọi dòng `id:` khác để trống.
> SK-058 khuyến nghị 3: bài dạy **hình dạng bờ biển** (bãi cát, bãi đá, đảo, vịnh). Không làm lại "biển mặn", rạn san hô, biển sâu, con vật biển (#4 bài 5); con vật chỉ làm cảnh (cua trong khe đá).
> Khuyến nghị 5: đảo chỉ lấy đảo ven bờ (Cát Bà, Phú Quốc, Lý Sơn); không tên biển, không Hoàng Sa, Trường Sa; không bản đồ. Khuyến nghị 6: vịnh Hạ Long chỉ vào chữ bé nghe khi có ảnh đúng nơi, giấy phép hợp lệ. Khuyến nghị 7: một câu an toàn ở ô Học.

## Ý chính
1.en: Beaches can be sandy or rocky.
1.vi: Bãi biển có bãi cát, có bãi đá.
2.en: An island has water all around it.
2.vi: Đảo có nước bao quanh.
3.en: A bay is sea curving into the land.
3.vi: Vịnh là chỗ biển lượn vào đất liền.
> Từ cụ thể tới trừu tượng: chỗ bé đứng (bãi biển), rồi đất giữa nước (đảo), rồi nước giữa đất (vịnh). Ý chính hai, ba là hai hình dạng ngược nhau, nối với hồ của bài 4 (câu q5).
> Ghép với ô Học (`KeyPointPictures.match`): ý 1 → Sandy beach (hai từ, ô cùng thứ tự; Rocky beach cũng hai từ nhưng không hơn), ý 2 → Island (ba), ý 3 → Bay (bốn). Ô Rocky beach không ghép.

## Khởi động

> Ba câu: w1 ôn bài trước (sông chảy, `river_water_still`); w2 ôn *Lớn lên* bài 3 (rùa biển con trên bãi cát); w3 ôn bài 1 (bãi biển là chỗ đất liền gặp biển, mốc khoảng một tuần; thêm 19/11 theo tester n12). Hai câu sau dẫn vào bãi cát của bài này.

### w1
id: 81885753-1852-4062-b086-207c7ee5d8b7
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: nui-song-va-bien/song-va-ho
prompt.en: Which one has flowing water?
prompt.vi: Ở đâu nước đang chảy?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for ripples on the water.
hint.vi: Em tìm những gợn sóng trên mặt nước nhé.
explanation_correct.en: Yes! A river carries leaves along.
explanation_correct.vi: Đúng rồi! Sông cuốn lá trôi theo dòng nước.
explanation_wrong.en: The answer is the river. Its water flows.
explanation_wrong.vi: Đáp án là dòng sông. Nước sông chảy đi.
> Ôn ý chính một bài 4 (giãn cách cho `river_water_still`). `alt` đáp án ("A wide river with ripples") không có chữ của câu hỏi.

#### option w1_lake
correct: false
feedback.en: This lake water lies calm and still.
feedback.vi: Nước hồ này nằm yên, phẳng lặng.
label.en: lake
label.vi: cái hồ
image.brief: Dùng lại hình `explore_lake` ở bài `nui-song-va-bien/song-va-ho`. Từ khoá tìm ảnh (EN): calm lake trees shore
image.alt.en: Calm water ringed by trees
image.alt.vi: Mặt nước lặng, cây mọc quanh bờ

#### option w1_river
correct: true
label.en: river
label.vi: dòng sông
image.brief: Dùng lại hình `explore_river` ở bài `nui-song-va-bien/song-va-ho`. Từ khoá tìm ảnh (EN): wide river ripples
image.alt.en: A wide river with ripples
image.alt.vi: Dòng sông rộng gợn sóng

### w2
id: 994d4add-706a-4513-ade2-c76f54cec276
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: lon-len/con-vat-de-trung
prompt.en: Baby sea turtles crawl to the sea.
prompt.vi: Rùa biển con bò về phía biển.
image.brief: Dùng lại hình `tray_turtles` ở bài `lon-len/con-vat-de-trung`. Từ khoá tìm ảnh (EN): sea turtle hatchlings beach
image.alt.en: Baby turtles on the sand
image.alt.vi: Rùa con bò trên cát
answer: true
hint.en: Think where sea turtles swim.
hint.vi: Em nghĩ xem rùa biển bơi ở đâu nhé.
explanation_correct.en: Yes! They hatch on the sandy beach first.
explanation_correct.vi: Đúng rồi! Rùa con nở ra trên bãi cát trước.
explanation_wrong.en: This is true. They crawl off into the sea.
explanation_wrong.vi: Câu này đúng. Rùa con bò ra biển.
feedback_false.en: Sea turtles live and swim in the sea.
feedback_false.vi: Rùa biển sống và bơi dưới biển.
> Ôn ví dụ ô Hatch của *Lớn lên* bài 3 ("baby sea turtles crawl to the sea"), mốc khoảng hai tuần. Rùa chỉ ở câu ôn, bài này không dạy con vật biển (khuyến nghị 3). Lượt sửa 19/11 (tester n9): `explanation_wrong.vi` bỏ "rồi bơi đi" cho khớp EN.

### w3
id: 0478aa75-7e8c-42b2-92e4-f5968a86be1b
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: nui-song-va-bien/dat-lien-va-bien
prompt.en: The beach is where land meets sea.
prompt.vi: Bãi biển là chỗ đất liền gặp biển.
image.brief: Dùng lại hình `explore_sandy`. Từ khoá tìm ảnh (EN): white sand beach Vietnam
image.alt.en: Soft, pale sand by calm water
image.alt.vi: Bãi cát trắng mịn bên làn nước lặng
answer: true
hint.en: Look where the sand meets the water.
hint.vi: Em nhìn chỗ bãi cát gặp nước nhé.
explanation_correct.en: Yes! Waves wash up onto the sand.
explanation_correct.vi: Đúng rồi! Sóng vỗ lên bãi cát.
explanation_wrong.en: This is true. Land meets sea at the beach.
explanation_wrong.vi: Câu này đúng. Đất liền gặp biển ở bãi biển.
feedback_false.en: Sand lies between the land and water.
feedback_false.vi: Bãi cát nằm giữa đất liền và nước.
> Thêm 19/11 (tester n12): ôn ví dụ hai ô From up high của bài 1 (cách bốn bài, mốc khoảng một tuần, `warmup.week`), dẫn thẳng vào ô Sandy beach. Câu mới (bài 1 q4 hỏi bằng hình vẽ).

## Học

> Bốn ô: hai loại bãi biển (cát, đá), rồi đảo (đất giữa nước), rồi vịnh (nước giữa đất).
> Chữ cần dạy trước khi hỏi: "sandcastle" (q4) ở ô Sandy beach; "rocks", "slippery" (q2) ở ô Rocky beach; "by boat", "islands stay in one place" (q1, q6) ở ô Island; "land wraps around the water" (q3) ở ô Bay.
> **Câu an toàn** (khuyến nghị 7): ví dụ ba ô Sandy beach "go to the sea with a grown-up" · "chỉ ra biển cùng người lớn". Không thành câu Khởi động, Quiz.

### explore
id: 5856372e-32f9-4cba-8559-40b811da55fc
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_sandy
label.en: Sandy beach
label.vi: Bãi cát
color: vang_hoe
sentence.en: A sandy beach has soft, fine sand.
sentence.vi: Bãi cát có cát mịn và mềm.
image.brief: [ảnh] Một bãi cát khô, trắng, mịn cong theo mép nước xanh lặng, hàng dừa và đồi cây phía sau; vắng người, không con vật, không rác, không chữ. Ảnh đã chọn (designer 19/11, lượt 2, tester c5): bãi biển Quy Nhơn (Flickr, CC BY 2.0), vài thanh gỗ trôi dạt. Ảnh ngang có khoảng trống (khung vuông Học, kệ; thẻ ba lựa chọn 5:2 q1; thẻ hai lựa chọn 17:10 q4; khung 4:3 w3; thẻ từ 2:1; thẻ `order_sequence` vuông bài 6). Từ khoá tìm ảnh (EN): white sand beach Vietnam; Quy Nhon beach; empty sandy beach
image.alt.en: Soft, pale sand by calm water
image.alt.vi: Bãi cát trắng mịn bên làn nước lặng
examples.1.en: waves wash onto the sand
examples.1.vi: sóng vỗ lên bờ cát
examples.2.en: build a sandcastle
examples.2.vi: xây lâu đài cát
examples.3.en: go to the sea with a grown-up
examples.3.vi: chỉ ra biển cùng người lớn
> Hình gốc của chủ đề từ lượt 2 (kệ, q1, q4, w3, từ `beach`, `sand`; bài 6 q4). Trước đây dùng lại ảnh bãi triều ướt của *Gọi tên và nhóm động vật* bài 8 (tester c5: không ra cát mịn). Ví dụ ba là câu an toàn của bài; ví dụ hai dạy trước câu q4. Câu q4 dùng `alt` riêng (`alt` gốc có chữ "cát" trùng câu hỏi "lâu đài cát").

#### group explore_rocky
label.en: Rocky beach
label.vi: Bãi đá
color: nau_dat
sentence.en: A rocky beach has big, hard rocks.
sentence.vi: Bãi đá có nhiều tảng đá to và cứng.
image.brief: [ảnh] Một bãi biển đầy đá: những tảng đá to tròn hay đá ghềnh nằm sát mép nước, sóng vỗ tung bọt trắng, biển xanh phía sau; chụp ngang từ bờ; không người, không trẻ em leo đá, không sóng dữ, không biển báo, không chữ. Ưu tiên bãi đá miền Trung Việt Nam, `alt` không nêu tên nơi. Ảnh ngang có khoảng trống (khung vuông Học, kệ; thẻ ba lựa chọn 5:2 q1; khung 4:3 q2; thẻ hai lựa chọn 17:10 q4; bài 6 q3). Từ khoá tìm ảnh (EN): rocky beach waves; boulders beach sea; rocky shore Vietnam
image.alt.en: Big round rocks by the sea
image.alt.vi: Tảng đá tròn lớn bên bờ biển
examples.1.en: waves wash between the rocks
examples.1.vi: sóng luồn giữa các tảng đá
examples.2.en: crabs hide between the rocks
examples.2.vi: cua trốn trong khe đá
examples.3.en: rocks can be slippery
examples.3.vi: đá có thể trơn trượt
> Hình gốc của bài (kệ, q1, q2, q4). Phải khác rõ bãi cát (luật Explorer số bảy). Ví dụ ba là lời nhắc an toàn nhẹ.
> Ảnh đã chọn (designer 19/11, lệch 7): Boulders Beach (Nam Phi), tảng đá tròn lớn sát mép nước, nước lặng, ít bọt sóng. `alt` cũ "Big rocks where waves splash" · "Tảng đá lớn nơi sóng vỗ" → "Big round rocks by the sea" · "Tảng đá tròn lớn bên bờ biển"; `feedback` câu q1 cũ "Waves splash on these big rocks." → "These big rocks sit by the water."; thẻ từ `wave` nay có ảnh riêng. Ví dụ một cũ "waves splash white foam" · "sóng tung bọt trắng xoá" → "waves wash between the rocks" · "sóng luồn giữa các tảng đá" (tester c13: ảnh nước lặng).
> [CẦN KIỂM] Cua hay trốn trong khe đá ven biển.

#### group explore_island
label.en: Island
label.vi: Đảo
color: gi_dong
sentence.en: An island has water all around it.
sentence.vi: Đảo có nước bao quanh.
image.brief: [ảnh] Một hòn đảo nhỏ có cây xanh hay đá, nằm giữa biển xanh, chụp từ flycam hay từ trên đồi cao, thấy rõ **nước bao quanh cả bốn phía**; chỉ một đảo trong khung (hay một đảo nổi bật); không ảnh vệ tinh, không thấy bờ biển một vùng; không nhà lớn, không người, không chữ, không cờ. Ưu tiên đảo nhỏ ven bờ Việt Nam; `alt` không nêu tên nơi; tiêu đề ảnh ở nguồn không có tên biển, không "Hoàng Sa", "Trường Sa", "Paracel", "Spratly" (Quy ước hình số bốn). Có thể chép mục `tray_island` của Discoverer `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat` (đảo nhỏ Hy Lạp, CC BY 2.0). Ảnh ngang có khoảng trống (khung vuông, 5:2, 17:10, 4:3). Từ khoá tìm ảnh (EN): small island aerial; small green island sea; islet aerial view
image.alt.en: A small, green land in the sea
image.alt.vi: Khoảnh đất xanh nhỏ giữa biển
examples.1.en: you go there by boat
examples.1.vi: muốn ra đảo phải đi thuyền
examples.2.en: like Cat Ba, Phu Quoc, Ly Son
examples.2.vi: như Cát Bà, Phú Quốc, Lý Sơn
examples.3.en: islands stay in one place
examples.3.vi: đảo đứng yên một chỗ
> Hình gốc của cả chủ đề (kệ, q1, q3, q6, từ `island`; bài 6 w1). `alt` không có chữ "island" · "đảo" vì câu q1 hỏi "Which one is an island?".
> Ảnh đã chọn (designer 19/11): đảo Mokapu (Hawaii, Mỹ). Chữ bé nghe không nói ảnh là đảo Việt Nam (ví dụ hai là tên đảo chỉ ở lời); khớp.
> Ví dụ hai: ba đảo ven bờ theo khuyến nghị 5, tên chỉ ở lời, không gắn ảnh. Nếu PM áp khuyến nghị 6 cho mọi tên nơi thì đổi thành "some islands are big, some small" · "có đảo to, có đảo nhỏ". Ví dụ ba dạy trước ý sửa `islands_float` (câu q6).
> [CẦN KIỂM] Cát Bà, Phú Quốc, Lý Sơn là đảo ven bờ Việt Nam. Nghe thử EN "Cat Ba, Phu Quoc, Ly Son".

#### group explore_bay
label.en: Bay
label.vi: Vịnh
color: cham
sentence.en: A bay is sea curving into the land.
sentence.vi: Vịnh là chỗ biển lượn vào đất liền.
image.brief: [ảnh] Một vịnh nhỏ chụp từ trên đồi cao hay flycam: đường bờ cong hình vòng cung, hai bên là đồi hay núi đất liền ôm lấy mặt nước, nước trong vịnh lặng, có bãi cát ở trong cùng, phía ngoài mở ra biển; chỉ một đoạn bờ ngắn, không thấy hình dạng cả vùng bờ biển; không ảnh vệ tinh; không thuyền đọc được tên, không resort, không người, không chữ. Ưu tiên vịnh nhỏ miền Trung (Vĩnh Hy, Nha Trang), `alt` không nêu tên nơi. Ảnh ngang có khoảng trống (khung vuông Học, thẻ hai lựa chọn 17:10 q3, thẻ từ 2:1). Từ khoá tìm ảnh (EN): bay aerial curved beach hills; small bay aerial; cove aerial view
image.alt.en: Sea held by curving hills
image.alt.vi: Biển nằm trong vòng đồi
examples.1.en: land wraps around the water
examples.1.vi: đất liền ôm lấy mặt nước
examples.2.en: the water is often calm
examples.2.vi: nước trong vịnh thường lặng
examples.3.en: Ha Long Bay has many rocky islands
examples.3.vi: vịnh Hạ Long có rất nhiều đảo đá
> Ảnh mới (câu q3, từ `bay`). Ảnh dạy hình dạng vịnh (biển lượn vào đất liền), nên không dùng ảnh Hạ Long ở đây (ảnh Hạ Long thấy đảo, khó thấy hình vịnh). `alt` không có chữ "bay" · "vịnh" vì câu q3 hỏi "Which one is a bay?".
> Ảnh đã chọn (designer 19/11): vịnh West Lulworth (Anh), có vài người rất nhỏ trên bãi (không nhận ra mặt). Chữ không nói nơi chụp; khớp.
> Ví dụ ba gắn với ảnh vịnh Hạ Long ở món `tray_rock_islands` và thẻ `ha_long_bay_card` của bài này. **Câu dự phòng khi thiếu ảnh đúng nơi:** "some bays have many islands" · "có vịnh có rất nhiều đảo".
> [CẦN KIỂM] Nước trong vịnh thường lặng hơn ngoài biển khơi (vì có đất che; bài không nói vì sao).

### new_words
id: 315d9d70-9fcb-466d-b942-1a3367efc381
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: beach, island, bay

## Chơi

> Bé chọn ba nơi ở biển: một bãi cát, một bãi đá, một hòn đảo. Đạt khi đủ ba nhóm và không chọn món bẫy.
> Món bẫy là sông và hồ của bài 4: cũng có nước, có bờ, nhưng không ở biển.
> Kệ sáu món, toàn ảnh chụp.

### tray
id: a10b1328-1c6f-4d04-853e-c3ebccb9263c
type: build_tray
version: 1
prompt.en: Find beaches and an island
prompt.vi: Tìm bãi biển và hòn đảo
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick sand, rocks and an island.
messages.start.vi: Em chọn một bãi cát, một bãi đá và một hòn đảo nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! All three are by the sea.
messages.balanced.vi: Tuyệt! Cả ba nơi đều ở biển.
messages.has_limited.en: That is a river or a lake.
messages.has_limited.vi: Đó là sông hoặc hồ, không phải biển.
messages.missing.tray_sandy.en: You still need a sandy beach.
messages.missing.tray_sandy.vi: Em còn thiếu một bãi cát.
messages.missing.tray_rocky.en: You still need a rocky beach.
messages.missing.tray_rocky.vi: Em còn thiếu một bãi đá.
messages.missing.tray_islands.en: You still need an island.
messages.missing.tray_islands.vi: Em còn thiếu một hòn đảo.
> Lời nhắn `has_limited` đúng với cả hai món bẫy (sông, hồ). EN "Pick sand, rocks and an island." rút gọn để còn sáu từ; VI nói đủ.

#### group tray_sandy
label.en: Sandy beach
label.vi: Bãi cát
color: vang_hoe
role: required

#### group tray_rocky
label.en: Rocky beach
label.vi: Bãi đá
color: nau_dat
role: required

#### group tray_islands
label.en: Island
label.vi: Đảo
color: gi_dong
role: required

#### group tray_inland
label.en: River or lake
label.vi: Sông hoặc hồ
color: do_son
role: limit

#### item tray_sand_beach
label.en: Sandy beach
label.vi: Bãi cát
group: tray_sandy
image.brief: Dùng lại hình `explore_sandy`. Từ khoá tìm ảnh (EN): white sand beach Vietnam
image.alt.en: Soft, pale sand by calm water
image.alt.vi: Bãi cát trắng mịn bên làn nước lặng

#### item tray_rock_beach
label.en: Rocky beach
label.vi: Bãi đá
group: tray_rocky
image.brief: Dùng lại hình `explore_rocky`. Từ khoá tìm ảnh (EN): rocky beach waves
image.alt.en: Big round rocks by the sea
image.alt.vi: Tảng đá tròn lớn bên bờ biển

#### item tray_island
label.en: Green island
label.vi: Đảo xanh
group: tray_islands
image.brief: Dùng lại hình `explore_island`. Từ khoá tìm ảnh (EN): small island aerial
image.alt.en: A small, green land in the sea
image.alt.vi: Khoảnh đất xanh nhỏ giữa biển

#### item tray_rock_islands
label.en: Rocky islands
label.vi: Đảo đá
group: tray_islands
image.brief: [ảnh] **Cần ảnh đúng vịnh Hạ Long, giấy phép hợp lệ (CC0, PD, PDM, CC BY); thiếu thì bỏ tên** (ảnh nhiều đảo đá vôi giữa biển chung, chữ đổi theo dòng dự phòng). Nhiều đảo đá vôi phủ cây xanh nhô lên khỏi mặt nước xanh ngọc, chụp từ thuyền, từ đỉnh núi trên đảo hay từ trên cao; có thuyền buồm nâu ở xa thì tốt; trang gốc ghi rõ là vịnh Hạ Long; không người nhìn rõ mặt, không biển quảng cáo, không chữ, không số trên thuyền; không bản đồ. Có thể chép mục `ha_long` của Discoverer `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat` (Ha_Long_Bay.jpg, CC BY 2.5; mở trang gốc kiểm lại). Ảnh vuông hay ngang có khoảng trống (món Chơi vuông, thẻ thưởng vuông). Từ khoá tìm ảnh (EN): Ha Long Bay; Ha Long Bay islands; Halong Bay karst
image.alt.en: Rocky islands in Ha Long Bay
image.alt.vi: Những đảo đá ở vịnh Hạ Long
> Hình gốc (kệ Chơi, thẻ `ha_long_bay_card`). **Dự phòng khi thiếu ảnh đúng nơi:** `label` giữ "Rocky islands" · "Đảo đá"; `alt` "Rocky islands in the sea" · "Những đảo đá giữa biển"; thẻ đổi theo dòng dự phòng ở mục Thưởng; ví dụ ba ô Bay đổi câu dự phòng.

#### item tray_river
label.en: River
label.vi: Dòng sông
group: tray_inland
image.brief: Dùng lại hình `explore_river` ở bài `nui-song-va-bien/song-va-ho`. Từ khoá tìm ảnh (EN): wide river ripples
image.alt.en: A wide river with ripples
image.alt.vi: Dòng sông rộng gợn sóng

#### item tray_lake
label.en: Lake
label.vi: Cái hồ
group: tray_inland
image.brief: Dùng lại hình `explore_lake` ở bài `nui-song-va-bien/song-va-ho`. Từ khoá tìm ảnh (EN): calm lake trees shore
image.alt.en: Calm water ringed by trees
image.alt.vi: Mặt nước lặng, cây mọc quanh bờ

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1 ba lựa chọn; q3, q4 hai lựa chọn), `true_false` (q2 Đúng, q5 Sai, q6 Sai).
> Hình câu `single_choice` là hàng rào tre trung tính. Mọi lựa chọn là ảnh chụp bé đã gặp hôm nay (ô Học, kệ Chơi).

### q1
id: 4ee3fb09-2f54-43d6-b3db-d41ed2b73147
format: single_choice
version: 1
dok: 1
prompt.en: Which one is an island?
prompt.vi: Hình nào là hòn đảo?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look where the water is in each one.
hint.vi: Em nhìn xem nước nằm ở đâu trong mỗi hình nhé.
explanation_correct.en: Yes! You need a boat to get there.
explanation_correct.vi: Đúng rồi! Muốn tới đó phải đi thuyền.
explanation_wrong.en: The answer is the island. Water is all around.
explanation_wrong.vi: Đáp án là hòn đảo. Nước bao quanh đảo.
> DOK 1: nhận ra đảo (ô Island). Ba ảnh: bãi cát, đảo, bãi đá. Gợi ý là cách nhìn (nước nằm ở đâu), không gọi tên đáp án.

#### option q1_sandy
correct: false
feedback.en: This beach is where land meets sea.
feedback.vi: Bãi biển là chỗ đất liền gặp biển.
label.en: sandy beach
label.vi: bãi cát
image.brief: Dùng lại hình `explore_sandy`. Từ khoá tìm ảnh (EN): white sand beach Vietnam
image.alt.en: Soft, pale sand by calm water
image.alt.vi: Bãi cát trắng mịn bên làn nước lặng

#### option q1_island
correct: true
label.en: island
label.vi: hòn đảo
image.brief: Dùng lại hình `explore_island`. Từ khoá tìm ảnh (EN): small island aerial
image.alt.en: A small, green land in the sea
image.alt.vi: Khoảnh đất xanh nhỏ giữa biển

#### option q1_rocky
correct: false
feedback.en: These big rocks sit by the water.
feedback.vi: Những tảng đá to này nằm sát mép nước.
label.en: rocky beach
label.vi: bãi đá
image.brief: Dùng lại hình `explore_rocky`. Từ khoá tìm ảnh (EN): rocky beach waves
image.alt.en: Big round rocks by the sea
image.alt.vi: Tảng đá tròn lớn bên bờ biển

### q2
id: 47182cea-eb98-4227-a6f8-226460cc1369
format: true_false
version: 1
dok: 1
prompt.en: Some beaches are covered in rocks.
prompt.vi: Có bãi biển phủ đầy đá.
image.brief: Dùng lại hình `explore_rocky`. Từ khoá tìm ảnh (EN): rocky beach waves
image.alt.en: Big round rocks by the sea
image.alt.vi: Tảng đá tròn lớn bên bờ biển
answer: true
hint.en: Look at what lies by the water.
hint.vi: Em nhìn xem mép nước có gì nhé.
explanation_correct.en: Yes! Rocky beaches can be slippery.
explanation_correct.vi: Đúng rồi! Bãi đá có thể trơn trượt.
explanation_wrong.en: This is true. Some beaches are rocky.
explanation_wrong.vi: Câu này đúng. Có bãi biển toàn đá.
feedback_false.en: Big rocks lie along this beach.
feedback_false.vi: Những tảng đá to nằm dọc bãi biển này.
> DOK 1: nhớ lại ý chính một. Hình là đúng vật được nói tới.

### q3
id: f1b893c0-ca27-4441-af18-941637880226
format: single_choice
version: 1
dok: 1
prompt.en: Which one is a bay?
prompt.vi: Hình nào là vịnh?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for land that curves around water.
hint.vi: Em tìm chỗ đất liền cong cong ôm lấy nước nhé.
explanation_correct.en: Yes! The hills hug the calm water.
explanation_correct.vi: Đúng rồi! Đồi núi ôm lấy mặt nước lặng.
explanation_wrong.en: The answer is the bay. Land curves around it.
explanation_wrong.vi: Đáp án là vịnh. Đất liền lượn quanh mặt nước.
> DOK 1: nhận ra vịnh (ô Bay). Hai ảnh bé đã gặp hôm nay: vịnh (ô Học), đảo (ô Học, kệ). Hai hình dạng ngược nhau (nước giữa đất, đất giữa nước), khác rõ bằng mắt. Gợi ý chỉ điều nhìn thấy (đường bờ cong), không gọi tên đáp án.

#### option q3_bay
correct: true
label.en: bay
label.vi: vịnh
image.brief: Dùng lại hình `explore_bay`. Từ khoá tìm ảnh (EN): bay aerial curved beach hills
image.alt.en: Sea held by curving hills
image.alt.vi: Biển nằm trong vòng đồi

#### option q3_island
correct: false
feedback.en: This small land sits in the sea.
feedback.vi: Khoảnh đất nhỏ này nằm giữa biển.
label.en: island
label.vi: hòn đảo
image.brief: Dùng lại hình `explore_island`. Từ khoá tìm ảnh (EN): small island aerial
image.alt.en: A small, green land in the sea
image.alt.vi: Khoảnh đất xanh nhỏ giữa biển

### q4
id: 9a7006ad-bae1-4a2b-a83b-00b6651fc1ae
format: single_choice
version: 1
dok: 2
prompt.en: Where can you build a sandcastle?
prompt.vi: Ở đâu em xây được lâu đài cát?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think what a sandcastle is made of.
hint.vi: Em nghĩ xem lâu đài cát làm bằng gì nhé.
explanation_correct.en: Yes! Soft sand is easy to shape.
explanation_correct.vi: Đúng rồi! Cát mềm, dễ nặn thành hình.
explanation_wrong.en: The answer is the sandy beach. It has sand.
explanation_wrong.vi: Đáp án là bãi cát. Ở đó có cát.
> DOK 2: áp ý chính một vào trò chơi quen (xây lâu đài cát, ví dụ hai ô Sandy beach). Hai ảnh bé đã gặp hôm nay. `alt` đáp án (riêng: "A quiet shore by calm water" · "Bờ biển vắng bên làn nước lặng") không có chữ của câu hỏi.

#### option q4_rocky
correct: false
feedback.en: Big, hard rocks cover this beach.
feedback.vi: Bãi này toàn đá to, cứng.
label.en: rocky beach
label.vi: bãi đá
image.brief: Dùng lại hình `explore_rocky`. Từ khoá tìm ảnh (EN): rocky beach waves
image.alt.en: Big round rocks by the sea
image.alt.vi: Tảng đá tròn lớn bên bờ biển

#### option q4_sandy
correct: true
label.en: sandy beach
label.vi: bãi cát
image.brief: Dùng lại hình `explore_sandy`. Từ khoá tìm ảnh (EN): white sand beach Vietnam
image.alt.en: A quiet shore by calm water
image.alt.vi: Bờ biển vắng bên làn nước lặng
> `alt` riêng (lượt 2): `alt` gốc có "sand" · "cát", trùng chữ câu hỏi "sandcastle" · "lâu đài cát".

### q5
id: dde5fbd7-566b-482d-b0a2-0131c7309456
format: true_false
version: 1
dok: 2
prompt.en: A lake is land with water all around.
prompt.vi: Hồ là đất có nước bao quanh.
image.brief: Dùng lại hình `explore_lake` ở bài `nui-song-va-bien/song-va-ho`. Từ khoá tìm ảnh (EN): calm lake trees shore
image.alt.en: Calm water ringed by trees
image.alt.vi: Mặt nước lặng, cây mọc quanh bờ
answer: false
hint.en: Look where the land is here.
hint.vi: Em nhìn xem đất nằm ở đâu trong hình nhé.
explanation_correct.en: A lake is water with land around it.
explanation_correct.vi: Hồ là nước, có đất bao quanh.
explanation_wrong.en: This is false. The lake is the water part.
explanation_wrong.vi: Câu này sai. Hồ là phần nước.
feedback_true.en: Here, the land is around the water.
feedback_true.vi: Ở đây, đất nằm quanh mặt nước.
> DOK 2: so hồ (bài 4) với đảo (bài này), hai hình dạng ngược nhau. Câu khẳng định, đáp án Sai; `explanation_correct` đứng một mình. Lượt sửa 19/11 (tester n4): `explanation_wrong` cũ "That is an island." · "Đó là hòn đảo." khiến bé hiểu ảnh hồ trên màn là hòn đảo; nay nói hồ là phần nước.

### q6
id: a2a28e9a-c043-42d4-ae9d-ec12f0a1d58a
format: true_false
version: 1
dok: 2
misconception: islands_float
prompt.en: An island floats on the sea.
prompt.vi: Hòn đảo trôi nổi trên mặt biển.
image.brief: Dùng lại hình `explore_island`. Từ khoá tìm ảnh (EN): small island aerial
image.alt.en: A small, green land in the sea
image.alt.vi: Khoảnh đất xanh nhỏ giữa biển
answer: false
hint.en: Think of a boat drifting in the wind.
hint.vi: Em nghĩ tới con thuyền trôi theo gió nhé.
explanation_correct.en: An island stands on the sea floor.
explanation_correct.vi: Hòn đảo đứng vững trên đáy biển.
explanation_wrong.en: This is false. Islands stay in one place.
explanation_wrong.vi: Câu này sai. Đảo đứng yên một chỗ.
feedback_true.en: This island stays in the same spot.
feedback_true.vi: Hòn đảo này luôn ở yên một chỗ.
> Câu misconception (`islands_float`), bằng hình, DOK 2: bé nghĩ đảo nổi như cái bè sẽ chạm gật đầu. Câu chỉ kiểm một việc: đảo có trôi nổi không. Hình là hòn đảo (đúng vật được nói tới). VI dùng "trôi nổi" cho rõ nghĩa (khác "nổi lên giữa biển"). `explanation_correct` là đúng câu `correction` ở `_topic.md`.
> Gợi ý là cách so (thứ nổi thì trôi theo gió, như con thuyền), không trỏ vào ví dụ "islands stay in one place" của ô Island (câu đó chính là phán quyết; SK-047).
> [CẦN KIỂM] Chân đảo liền với đáy biển; quan niệm "đảo nổi" ở trẻ.

## Từ vựng

### beach
id: cfcba312-b890-4d77-9a96-afa37c1659dc
tier: core
term.en: beach
term.vi: bãi biển
example.en: Waves roll onto the beach.
example.vi: Sóng vỗ vào bãi biển.
image.brief: Dùng lại hình `explore_sandy`. Từ khoá tìm ảnh (EN): white sand beach Vietnam
image.alt.en: Soft, pale sand by calm water
image.alt.vi: Bãi cát trắng mịn bên làn nước lặng

### island
id: b62c3e30-31da-43e4-a1ce-55cfd9bb17f0
tier: core
term.en: island
term.vi: hòn đảo
example.en: We take a boat to the island.
example.vi: Mình đi thuyền ra đảo.
image.brief: Dùng lại hình `explore_island`. Từ khoá tìm ảnh (EN): small island aerial
image.alt.en: A small, green land in the sea
image.alt.vi: Khoảnh đất xanh nhỏ giữa biển

### bay
id: cb9b156e-3679-4c4e-803b-154b355c2298
tier: core
term.en: bay
term.vi: vịnh
example.en: The water in the bay is calm.
example.vi: Nước trong vịnh phẳng lặng.
image.brief: Dùng lại hình `explore_bay`. Từ khoá tìm ảnh (EN): bay aerial curved beach hills
image.alt.en: Sea held by curving hills
image.alt.vi: Biển nằm trong vòng đồi

### sand
id: c1a9f11a-2fe4-46bd-bbe7-158f5d37617a
tier: extra
term.en: sand
term.vi: cát
example.en: I dig in the soft sand.
example.vi: Em đào cát mềm.
image.brief: Dùng lại hình `explore_sandy`. Từ khoá tìm ảnh (EN): white sand beach Vietnam
image.alt.en: Soft, pale sand by calm water
image.alt.vi: Bãi cát trắng mịn bên làn nước lặng

### wave
id: 1fc939f3-4446-4a5b-828c-615d7ac83f5e
tier: extra
term.en: wave
term.vi: sóng
example.en: Big waves splash on the rocks.
example.vi: Sóng lớn vỗ vào đá.
image.brief: [ảnh] Một con sóng xô vào tảng đá ven biển, tung bọt trắng, chụp ngang từ bờ; không người, không chữ. Ảnh đã chọn (designer 19/11): sóng xô vào đá ở Heceta (Mỹ), CC0, ảnh riêng của thẻ từ này (trước là dùng lại ảnh bãi đá, nhưng ảnh bãi đá đã chọn có nước lặng). Ảnh ngang (thẻ từ 2:1). Từ khoá tìm ảnh (EN): wave splashing rock; wave crashing rocks; sea spray rock
image.alt.en: A wave splashing on a rock
image.alt.vi: Con sóng xô vào tảng đá

## Thưởng

### ha_long_bay_card
id: 7ba2451e-11ac-4194-88ff-8ab9ecfd83fd
set: landforms
rarity: rare
name.en: Ha Long Bay
name.vi: Vịnh Hạ Long
tag.en: Rocky islands in the sea
tag.vi: Đảo đá giữa biển
fact.en: Ha Long Bay has over a thousand islands.
fact.vi: Vịnh Hạ Long có hơn một nghìn hòn đảo.
image.brief: Dùng lại hình `tray_rock_islands`. Từ khoá tìm ảnh (EN): Ha Long Bay
image.alt.en: Rocky islands in Ha Long Bay
image.alt.vi: Những đảo đá ở vịnh Hạ Long
> Bộ `set: landforms`. Key khác thẻ `ha_long` (bộ `earth`) của Discoverer *Bề mặt Trái Đất* bài 1.
> **Thẻ dự phòng khi thiếu ảnh đúng nơi:** key `rock_islands_card`, `name` "Rocky islands" · "Đảo đá", `tag` "Rocks rising from the sea" · "Đá nhô lên giữa biển", `fact` "Some bays have many rocky islands." · "Có vịnh có rất nhiều đảo đá.", `alt` theo dòng dự phòng của món `tray_rock_islands`.
> [CẦN KIỂM] Số đảo ở vịnh Hạ Long: khoảng một nghìn sáu trăm (UNESCO), có nguồn ghi gần hai nghìn; "hơn một nghìn" đúng với cả hai (như Discoverer). Nghe thử EN "Ha Long Bay".

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật (CC0, PD, PDM, CC BY có ghi công). Không hình vẽ.
- **Ảnh mới (sáu, sau lượt 2):** `explore_sandy` (bãi cát Quy Nhơn), thẻ từ `wave` (sóng xô vào đá, ảnh riêng), `explore_rocky` (bãi đá tròn, nước lặng), `explore_island` (đảo nhỏ, nước bốn phía), `explore_bay` (vịnh nhỏ hình vòng cung), `tray_rock_islands` (**cần ảnh đúng vịnh Hạ Long**; thẻ `ha_long_bay_card` dùng lại). `explore_rocky`, `explore_island` là **hình gốc của cả chủ đề** (bài 6 dùng lại).
- **Pháp lý** (khuyến nghị 5): không bản đồ, không ảnh vệ tinh, không hình dạng cả vùng bờ biển; loại ảnh có tên biển, "Hoàng Sa", "Trường Sa", "Paracel", "Spratly" trong tiêu đề, mô tả ở nguồn. Đảo là đảo nhỏ ven bờ.
- **Tên nơi** (khuyến nghị 6): ảnh Hạ Long phải đúng nơi, giấy phép hợp lệ (phần lớn ảnh Hạ Long trên Commons là BY-SA; Discoverer đã có `Ha_Long_Bay.jpg` CC BY 2.5, mở trang gốc kiểm lại). Thiếu thì dùng ảnh đảo đá chung và các dòng dự phòng; ghi tên nơi bị bỏ ở `_topic.md`.
- **An toàn** (khuyến nghị 7): không người bơi, trẻ em leo đá, sóng dữ đánh vào người.
- **Không con vật biển nổi bật** (khuyến nghị 3): không cá, san hô, rùa trong ảnh bài này (trừ ảnh rùa con của câu ôn w2).
- **Bãi cát (lượt 2):** ảnh mới `explore_sandy` (Quy Nhơn), thay ảnh bãi triều của *Gọi tên và nhóm động vật* bài 8; dùng ở ô Học, kệ, q1, q4 (`alt` riêng), w3, từ `beach`, `sand`, bài 6 q4.
- **Dùng lại:** `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha` `w1` (hàng rào tre); `lon-len/con-vat-de-trung` `tray_turtles` (w2); bài 4 `explore_river`, `explore_lake` (w1, kệ, q5).
- **Màu:** Học: Sandy beach `vang_hoe`, Rocky beach `nau_dat`, Island `gi_dong`, Bay `cham`. Chơi: Bãi cát `vang_hoe`, Bãi đá `nau_dat`, Đảo `gi_dong`, Sông hoặc hồ `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (beach, island, bay). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, sáu món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Đúng, w3 Đúng). Quiz `single_choice` (q1 ba lựa chọn; q3, q4 hai lựa chọn), `true_false` (q2 Đúng, q5 Sai, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`islands_float`). Không có `labels` ở câu `true_false`.
- **Màn Chơi, ví dụ để kiểm:** Bãi cát, Bãi đá, Đảo xanh → `balanced`; Bãi cát, Bãi đá, Đảo đá → `balanced`; Bãi cát, Đảo xanh, Đảo đá → `missing.tray_rocky`; Dòng sông, Bãi đá, Đảo xanh → `has_limited`; Bãi cát, Cái hồ, Đảo đá → `has_limited`.
- **Khởi động:** w1 → `nui-song-va-bien/song-va-ho` (id có sẵn); w2 → `lon-len/con-vat-de-trung` (đã có id); w3 → `nui-song-va-bien/dat-lien-va-bien` (id có sẵn).
- **Thẻ thưởng:** `ha_long_bay_card` (dự phòng `rock_islands_card`), bộ `landforms`, `rarity: rare`.
- **Từ EN có thể ngoài Starters/Movers:** sandy, rocky, foam, slippery, sandcastle, island, bay, curving, hug, Cat Ba, Phu Quoc, Ly Son, Ha Long, drifting, turtles, hatch. Nghe thử giọng EN đọc "Cat Ba, Phu Quoc, Ly Son", "Ha Long Bay", "sandcastle"; giọng VI đọc "Lý Sơn", "trơn trượt", "lâu đài cát".
