---
id: 42deb09b-40dd-46f7-96ff-9ec596c73982
topic: nui-song-va-bien
slug: hang-dong
order: 6
stage: review
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Caves
vi: Hang động
> Giữ đúng tên ở `content/syllabus.json` (key `new-mountains-rivers-and-seas`, bài số sáu). `id` là `lesson_id` của danh mục.

## Mục tiêu
en: I can say what a cave is like.
vi: Em nói được hang động trông như thế nào.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 19/11/2026. Ticket SK-058. Mọi dòng `id:` khác để trống.
> Bài `review`: phần mới là hang (khoảng trống lớn trong núi đá, tối và mát); Khởi động ôn trộn bài 5, 2, 3; kệ Chơi và câu q4 ôn cả chủ đề (đất cao, nơi có nước, núi xuống biển).
> Không dạy hang hình thành thế nào, nhũ đá hình thành thế nào (nước bào mòn đá vôi: Discoverer #9, Scientist #3); không tiếng vọng, dơi định vị (Discoverer #13); không thác trong hang. Một câu an toàn ở ô Học (khuyến nghị 7). Tên Phong Nha, Sơn Đoòng chỉ vào chữ bé nghe khi có ảnh đúng nơi (khuyến nghị 6); từ 19/11 chỉ còn Sơn Đoòng (thẻ thưởng), Phong Nha bỏ vì ảnh không chắc đúng nơi.

## Ý chính
1.en: A cave is a big space inside rock.
1.vi: Hang là khoảng trống lớn trong núi đá.
2.en: Caves are dark and cool inside.
2.vi: Trong hang tối và mát.
3.en: Some caves are huge, like a big hall.
3.vi: Có hang rất rộng, như một căn phòng lớn.
> Từ cụ thể tới trừu tượng: hang là gì (thấy cửa hang), bên trong ra sao (tối, mát), rồi hang có thể rộng tới mức nào. Ý chính ba mang ý sửa `caves_are_small`.
> Ghép với ô Học (`KeyPointPictures.match`): ý 1 → Cave (năm từ chung), ý 2 → Dark and cool (bốn), ý 3 → Huge caves (bốn). Ô Stalactites không ghép (đổi tên ô 19/11 không làm đổi kết quả ghép: ý 1 với ô này còn một từ chung, trước là hai).
> [CẦN KIỂM] "Hang là khoảng trống lớn trong núi đá": đúng ở mức thấy với hang đá vôi Việt Nam; có hang trong đất, băng, đá núi lửa, bài không nói.

## Khởi động

> Ba câu (bài `review`), ôn trộn ba bài của chủ đề (SK-058): w1 bài 5 (đảo, bài ngay trước), w2 bài 2 (giãn cách `mountain_top_warmer`, cách bốn bài), w3 bài 3 (đồng bằng, cách ba bài). Bài 1, 4 được ôn ở kệ Chơi và câu q4.

### w1
id: b0c33957-c8cd-4c6a-93db-41f64278ec53
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: nui-song-va-bien/bai-bien-dao-va-vinh
prompt.en: An island has water all around it.
prompt.vi: Đảo có nước bao quanh.
image.brief: Dùng lại hình `explore_island` ở bài `nui-song-va-bien/bai-bien-dao-va-vinh`. Từ khoá tìm ảnh (EN): small island aerial
image.alt.en: A small, green land in the sea
image.alt.vi: Khoảnh đất xanh nhỏ giữa biển
answer: true
hint.en: Look at the edges of the land.
hint.vi: Em nhìn quanh mép đất nhé.
explanation_correct.en: Yes! Islands can be big or small.
explanation_correct.vi: Đúng rồi! Đảo có đảo to, đảo nhỏ.
explanation_wrong.en: This is true. Water is all around an island.
explanation_wrong.vi: Câu này đúng. Nước bao quanh hòn đảo.
feedback_false.en: Sea surrounds this land on every side.
feedback_false.vi: Biển bao quanh khoảnh đất này ở mọi phía.
> Ôn ý chính hai bài 5.

### w2
id: c8eefad7-4f35-4bd0-9f4b-bd11e950cb98
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: nui-song-va-bien/nui-va-doi
prompt.en: Mountain tops feel hotter than the plains.
prompt.vi: Trên đỉnh núi nóng hơn ở đồng bằng.
image.brief: Dùng lại hình `explore_cool` ở bài `nui-song-va-bien/nui-va-doi`. Từ khoá tìm ảnh (EN): sea of clouds mountains
image.alt.en: Clouds below the mountain tops
image.alt.vi: Mây trắng dưới các đỉnh núi
answer: false
hint.en: Think of clouds below the peaks.
hint.vi: Em nghĩ tới mây trắng dưới các đỉnh núi nhé.
explanation_correct.en: High on a mountain, the air is cooler.
explanation_correct.vi: Lên cao trên núi, không khí mát hơn.
explanation_wrong.en: This is false. Mountain tops are cool.
explanation_wrong.vi: Câu này sai. Trên đỉnh núi trời mát.
feedback_true.en: Clouds and chilly wind wrap these peaks.
feedback_true.vi: Mây và gió lạnh bao quanh những đỉnh núi này.
> Ôn `mountain_top_warmer` (giãn cách sau bài 2 q6), câu mới so với đồng bằng (bài 3). `explanation_correct` là đúng câu `correction` ở `_topic.md`. Không gắn `misconception` (chỉ câu q6 của Quiz gắn key).

### w3
id: cc9baf3e-29fb-43ad-9a4d-af2029dbda8a
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: nui-song-va-bien/dong-bang-va-ruong-lua
prompt.en: Which land is wide and flat?
prompt.vi: Đất nào rộng và bằng phẳng?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for land as flat as a table.
hint.vi: Em tìm chỗ đất phẳng như mặt bàn nhé.
explanation_correct.en: Yes! Many villages sit on plains.
explanation_correct.vi: Đúng rồi! Nhiều làng xóm nằm trên đồng bằng.
explanation_wrong.en: The answer is the plain. It is flat.
explanation_wrong.vi: Đáp án là đồng bằng. Đồng bằng phẳng.
> Ôn ý chính một bài 3. `alt` đáp án ("Fields stretching far away") không có chữ của câu hỏi.

#### option w3_hill
correct: false
feedback.en: These hills slope up and down.
feedback.vi: Những quả đồi này dốc lên rồi dốc xuống.
label.en: hill
label.vi: quả đồi
image.brief: Dùng lại hình `tray_hill` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): round green hill
image.alt.en: A low, round, green slope
image.alt.vi: Sườn đất thấp, tròn, xanh mướt

#### option w3_plain
correct: true
label.en: plain
label.vi: đồng bằng
image.brief: Dùng lại hình `explore_plain` ở bài `nui-song-va-bien/dong-bang-va-ruong-lua`. Từ khoá tìm ảnh (EN): Mekong Delta fields aerial
image.alt.en: Fields stretching far away
image.alt.vi: Ruộng đồng trải dài tít tắp

## Học

> Bốn ô: cửa hang (hang là gì), bên trong hang (tối, mát), nhũ đá (điều bé thấy trong hang), hang rất rộng (sửa `caves_are_small`).
> Chữ cần dạy trước khi hỏi: "cave mouth", "rocky mountains" (q1, q5) ở ô Cave; "torch", "dark", "cool" (q2) ở ô Dark and cool; "stalactites", "hang down" (q3) ở ô Stalactites; "boats can go into some caves" (q6 gợi ý) ở ô Huge caves.
> **Câu an toàn** (khuyến nghị 7): ví dụ ba ô Cave "go into caves with a grown-up" · "chỉ vào hang cùng người lớn". Lời nhắc giữ hang: ví dụ ba ô Stalactites "look, but do not touch" · "chỉ nhìn, không chạm vào". Không thành câu Khởi động, Quiz.

### explore
id: 753da0d3-e9e8-407b-b090-1bc9be805b3c
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_cave
label.en: Cave
label.vi: Hang
color: nau_dat
sentence.en: A cave is a big space inside rock.
sentence.vi: Hang là khoảng trống lớn trong núi đá.
image.brief: [ảnh] Cửa một hang lớn trong vách núi đá vôi, chụp từ ngoài nhìn vào: miệng hang tối hình vòm, vách đá xám gồ ghề, cây cỏ, dây leo quanh cửa; thấy rõ là hang tự nhiên (không bê tông, không đường nhựa, không cửa sắt, không bậc xây); không thác, không nước chảy mạnh; không người, hay người rất nhỏ ở xa, không nhận ra mặt; không biển tên, chữ, đèn màu. Ưu tiên hang miền Trung, miền Bắc Việt Nam; `alt` không nêu tên nơi. Ảnh ngang có khoảng trống (khung vuông Học, kệ; thẻ ba lựa chọn 5:2 q1; thẻ hai lựa chọn 17:10 q5; khung 4:3 q6; thẻ từ 2:1). Từ khoá tìm ảnh (EN): cave entrance limestone; cave mouth jungle; limestone cave entrance Vietnam
image.alt.en: A dark opening in a rocky hill
image.alt.vi: Cửa tối trong vách núi đá
examples.1.en: the way in is the cave mouth
examples.1.vi: lối vào gọi là cửa hang
examples.2.en: many caves are in rocky mountains
examples.2.vi: nhiều hang nằm trong núi đá
examples.3.en: go into caves with a grown-up
examples.3.vi: chỉ vào hang cùng người lớn
> Hình gốc của bài (kệ, q1, q5, q6, từ `cave`). `alt` không có chữ "cave" · "hang" vì câu q1 hỏi "Which one is a cave?". Phải khác rõ `tray_tunnel` (luật Explorer số bảy): hang có vách đá gồ ghề tự nhiên; đường hầm có vòm bê tông, đường nhựa.
> Ảnh đã chọn (designer 19/11): cửa động Phong Nha (`Phongnhakebang2.jpg`, PD); chữ không nêu tên nơi, khớp.
> Ví dụ ba là câu an toàn của bài.
> [CẦN KIỂM] Nhiều hang ở Việt Nam nằm trong núi đá vôi.

#### group explore_dark
label.en: Dark and cool
label.vi: Tối và mát
color: cham
sentence.en: Inside a cave, it is dark and cool.
sentence.vi: Trong hang tối và mát.
image.brief: [ảnh] Bên trong hang: một lối đi giữa hai vách đá, chỉ có ánh đèn trắng hay vàng ấm soi một khoảng, xung quanh tối dần; thấy vách đá ướt, có thể có vài giọt nước; **không thấy nhũ đá rủ từ trần** (ảnh này là lựa chọn sai của câu q3 "What hangs from a cave roof?"); ánh đèn không màu sặc sỡ (không xanh lá, tím); không người, hay người rất nhỏ ở xa quay lưng; không biển chỉ dẫn, chữ, lan can có chữ. Ảnh ngang có khoảng trống (khung vuông Học, khung 4:3 q2, thẻ từ 2:1). Từ khoá tìm ảnh (EN): inside cave lamp path; cave passage light; dark cave interior
image.alt.en: A dim path between rock walls
image.alt.vi: Lối đi mờ tối giữa vách đá
examples.1.en: bring a torch to see
examples.1.vi: mang đèn pin để nhìn
examples.2.en: water drips from the roof
examples.2.vi: nước nhỏ giọt từ trần hang
examples.3.en: the air feels cool and damp
examples.3.vi: không khí mát và ẩm
> Ảnh mới (câu q2, câu q3 lựa chọn sai, từ `dark`). Ví dụ một dạy trước từ `torch` và câu q2.
> Ảnh đã chọn (designer 19/11, lệch 13): lối đi hang Sửng Sốt (Hạ Long, CC0) có hàng đèn vàng; đã cắt bỏ trần có nhũ đá, mép phải còn vài khối măng đá trắng đứng (không rủ từ trần). Ví dụ hai "water drips from the roof" là lời chung; chữ không nêu tên nơi; khớp.
> [CẦN KIỂM] Trong hang tối, mát, ẩm; nước nhỏ giọt từ trần hang.

#### group explore_rock_icicles
label.en: Stalactites
label.vi: Nhũ đá
color: vang_hoe
sentence.en: Stalactites hang down from the cave roof.
sentence.vi: Nhũ đá rủ xuống từ trần hang.
image.brief: [ảnh] Nhiều khối nhũ đá dài, nhọn rủ xuống từ trần hang, chụp gần dưới ánh đèn trắng hay vàng ấm, thấy rõ đầu nhọn chĩa xuống; không đèn màu sặc sỡ; không người, không tay chạm vào đá, không chữ. Ảnh ngang có khoảng trống (khung vuông Học, kệ; thẻ hai lựa chọn 17:10 q3; thẻ từ 2:1). Từ khoá tìm ảnh (EN): stalactites cave; stalactites lamp light; cave ceiling stalactites
image.alt.en: Long, pointy rocks pointing down
image.alt.vi: Những khối đá dài, nhọn chĩa xuống
examples.1.en: like long stone drips from the roof
examples.1.vi: như những giọt đá dài rủ từ trần hang
examples.2.en: some are long, some are short
examples.2.vi: có khối dài, có khối ngắn
examples.3.en: look, but do not touch
examples.3.vi: chỉ nhìn, không chạm vào
> Ảnh đã chọn (designer 19/11): nhũ đá hang Rawhiti (New Zealand), ánh sáng tự nhiên. Chữ cũ nói "ánh đèn" lệch ảnh: `alt` "Long, pointy rocks in lamp light" · "…dưới ánh đèn" → "Long, pointy rocks pointing down" · "Những khối đá dài, nhọn chĩa xuống"; ví dụ hai "they shine in the lamp light" · "nhũ đá lấp lánh dưới ánh đèn" → "some are long, some are short" · "có khối dài, có khối ngắn"; câu q3 `explanation_correct` "Yes! They shine in the lamp light." → "Yes! They point down, like long drips." · "Đúng rồi! Nhũ đá chĩa xuống như những giọt dài.". Brief trên ghi "ánh đèn" là mô tả lúc tìm ảnh.
> Ảnh mới (kệ, q3, từ `rock`, `stalactite`). `alt` không có chữ "hang", "roof", "stalactite" · "rủ", "trần", "nhũ đá" vì câu q3 hỏi "What hangs from a cave roof?".
> Lượt sửa 19/11 (tester C3, quyết định 4 của phiên chính): thuật ngữ tự đặt "rock icicles" đổi thành từ thật "stalactite" · "nhũ đá" (như "chrysalis" ở *Lớn lên*); lời tả cho trẻ là ví dụ một "like long stone drips from the roof", không dùng "icicle" (cột băng lạ với trẻ Việt Nam). Ví dụ cũ "some reach down to the floor" bỏ. Key hình `explore_rock_icicles` giữ nguyên (designer đang chọn ảnh), chỉ đổi chữ.
> Không nói nhũ đá hình thành thế nào (Discoverer). Ví dụ ba là lời nhắc giữ hang.
> [CẦN KIỂM] "stalactite" vượt danh sách Starters/Movers (từ khoa học của bài, như "chrysalis"); lời tả "giọt đá dài" đúng ở mức thấy; không nên chạm tay vào nhũ đá.

#### group explore_big_cave
label.en: Huge caves
label.vi: Hang rất rộng
color: gi_dong
sentence.en: Some caves are huge, like a big hall.
sentence.vi: Có hang rất rộng, như một căn phòng lớn.
image.brief: [ảnh] Lòng một hang rất rộng và cao, chữ không nêu tên nơi (từ 19/11). Ảnh lượt 2 (designer 19/11, c14): "Cueva Paraíso, Phong Nha, Vietnam" (CC BY 2.0), lòng hang Thiên Đường rất rộng, cao, đầy khối đá vôi dưới đèn vàng ấm, lối đi gỗ ở góc dưới phải có vài người rất nhỏ; không thấy sông. Tên nơi không vào chữ bé nghe. Vài người rất nhỏ ở xa để thấy hang to cỡ nào, không nhận ra mặt; ánh đèn trắng hay vàng ấm; không thác lớn, không nước xiết; không đèn màu sặc sỡ, không chữ, không biển chỉ dẫn. Ảnh ngang có khoảng trống. Từ khoá tìm ảnh (EN): Phong Nha cave boat; huge cave chamber; giant cave interior people
image.alt.en: A giant rock room with tiny people
image.alt.vi: Khoảng hang khổng lồ, người trông bé xíu
examples.1.en: bigger than a house
examples.1.vi: to hơn cả ngôi nhà
examples.2.en: people look tiny inside
examples.2.vi: người đứng trong đó trông bé xíu
examples.3.en: boats can go into some caves
examples.3.vi: thuyền đi vào được một số hang
> Ảnh mới, chỉ dùng ở ô này. Ô mang ý sửa `caves_are_small`; ví dụ ba dạy trước gợi ý câu q6.
> **Lượt sửa 19/11 theo ảnh thật (designer lệch 9):** ảnh đã chọn là lòng hang rộng, có lối đi gỗ, vài du khách rất nhỏ; trang gốc chỉ ghi "Dong Hoi Phong Nha grotten", không chắc là động Phong Nha (có thể là hang Tiên Sơn) và **không thấy sông**. Dùng phương án không tên: ví dụ hai cũ "Phong Nha has a river inside" · "động Phong Nha có sông chảy bên trong" → "people look tiny inside" · "người đứng trong đó trông bé xíu" (tả đúng ảnh; không dùng câu dự phòng "some caves have rivers inside" vì ảnh không có sông). `alt` "A giant rock room with tiny people" giữ, khớp ảnh. Tên Phong Nha đã ghi vào mục "Tên nơi đã bỏ" ở `_topic.md`. Ví dụ ba "boats can go into some caves" là lời chung, giữ (gợi ý câu q6 dựa vào).

### new_words
id: 209167e2-283c-4ea6-a116-8c5af98a8bef
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: cave, rock

## Chơi

> Bài `review`: kệ ôn cả chủ đề. Bé chọn một cái hang, một chỗ đất cao (bài 1, 2), một nơi có nước (bài 1, 4, 5). Đạt khi đủ ba nhóm và không chọn món bẫy.
> Món bẫy do người làm ra nhưng trông giống nơi tự nhiên: đường hầm tối như cửa hang, bể bơi chứa nước như hồ.
> Kệ tám món, toàn ảnh chụp.

### tray
id: d31ad335-ce09-4189-877b-8cb720802e10
type: build_tray
version: 1
prompt.en: Find a cave, high land and water
prompt.vi: Tìm hang, đất cao và nơi có nước
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick a cave, high land and water.
messages.start.vi: Em chọn một cái hang, một chỗ đất cao và một nơi có nước nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! You know land, water and caves.
messages.balanced.vi: Tuyệt! Em đã biết đất, nước và hang.
messages.has_limited.en: People made that one.
messages.has_limited.vi: Cái này do người làm ra.
messages.missing.tray_caves.en: You still need a cave.
messages.missing.tray_caves.vi: Em còn thiếu một cái hang.
messages.missing.tray_high.en: You still need some high land.
messages.missing.tray_high.vi: Em còn thiếu một chỗ đất cao.
messages.missing.tray_water.en: You still need some water.
messages.missing.tray_water.vi: Em còn thiếu một nơi có nước.
> Lời nhắn `has_limited` đúng với cả hai món bẫy (đường hầm, bể bơi). Nhãn và lời nhắn "High land", "Water", "Made by people" giữ đúng chữ của bài 1.

#### group tray_caves
label.en: Cave
label.vi: Hang
color: gi_dong
role: required

#### group tray_high
label.en: High land
label.vi: Đất cao
color: nau_dat
role: required

#### group tray_water
label.en: Water
label.vi: Nơi có nước
color: cham
role: required

#### group tray_made
label.en: Made by people
label.vi: Do người làm ra
color: do_son
role: limit

#### item tray_cave
label.en: Cave mouth
label.vi: Cửa hang
group: tray_caves
image.brief: Dùng lại hình `explore_cave`. Từ khoá tìm ảnh (EN): cave entrance limestone
image.alt.en: A dark opening in a rocky hill
image.alt.vi: Cửa tối trong vách núi đá

#### item tray_icicles
label.en: Stalactites
label.vi: Nhũ đá
group: tray_caves
image.brief: Dùng lại hình `explore_rock_icicles`. Từ khoá tìm ảnh (EN): stalactites cave
image.alt.en: Long, pointy rocks pointing down
image.alt.vi: Những khối đá dài, nhọn chĩa xuống

#### item tray_mountain
label.en: Mountain
label.vi: Ngọn núi
group: tray_high
image.brief: Dùng lại hình `tray_mountain` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): steep mountain peak clouds
image.alt.en: A tall, steep peak
image.alt.vi: Đỉnh cao, sườn dốc đứng

#### item tray_hill
label.en: Hill
label.vi: Quả đồi
group: tray_high
image.brief: Dùng lại hình `tray_hill` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): round green hill
image.alt.en: A low, round, green slope
image.alt.vi: Sườn đất thấp, tròn, xanh mướt

#### item tray_river
label.en: River
label.vi: Dòng sông
group: tray_water
image.brief: Dùng lại hình `explore_river` ở bài `nui-song-va-bien/song-va-ho`. Từ khoá tìm ảnh (EN): wide river ripples
image.alt.en: A wide river with ripples
image.alt.vi: Dòng sông rộng gợn sóng

#### item tray_sea
label.en: Sea
label.vi: Biển
group: tray_water
image.brief: Dùng lại hình `tray_sea` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): open sea horizon
image.alt.en: Wide blue water to the sky
image.alt.vi: Nước xanh mênh mông tới chân trời

#### item tray_tunnel
label.en: Road tunnel
label.vi: Đường hầm
group: tray_made
image.brief: [ảnh] Cửa một đường hầm cho xe xuyên qua núi: vòm bê tông nhẵn, con đường nhựa có vạch kẻ đi vào trong tối, sườn núi có cây phía trên; không xe, không người; không biển báo, biển tên hầm, chữ, số. Ảnh ngang có khoảng trống (món Chơi vuông, thẻ hai lựa chọn 17:10 câu q5). Từ khoá tìm ảnh (EN): road tunnel entrance mountain; tunnel portal road; highway tunnel entrance
image.alt.en: A road going into a hill
image.alt.vi: Con đường dẫn vào trong núi
> Ảnh mới (kệ, câu q5). Món bẫy giống nhóm "Cave": cũng là lối tối dẫn vào núi, nhưng do người đào. `alt` không có chữ "people", "make" · "người", "làm ra" vì câu q5 hỏi "Which one did people make?".

#### item tray_pool
label.en: Swimming pool
label.vi: Bể bơi
group: tray_made
image.brief: Dùng lại hình `tray_pool` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): empty outdoor swimming pool
image.alt.en: An empty swimming pool
image.alt.vi: Bể bơi vắng người

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1 ba lựa chọn; q3, q5 hai lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4, ôn bài 2, 3, 5).
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính. Mọi lựa chọn là ảnh chụp bé đã gặp hôm nay (ô Học, kệ Chơi); thẻ câu q4 là ảnh của bài 1, 3, 5.

### q1
id: 9cd10664-1eb4-49de-9cce-aab5de395493
format: single_choice
version: 1
dok: 1
prompt.en: Which one is a cave?
prompt.vi: Hình nào là hang động?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for a dark way into rock.
hint.vi: Em tìm lối đi tối dẫn vào trong đá nhé.
explanation_correct.en: Yes! It leads to a space inside rock.
explanation_correct.vi: Đúng rồi! Lối này dẫn vào khoảng trống trong núi đá.
explanation_wrong.en: The answer is the cave. It goes into rock.
explanation_wrong.vi: Đáp án là hang động. Hang ăn sâu vào núi đá.
> DOK 1: nhận ra hang (ô Cave). Ba ảnh khác hẳn nhau: đồi xanh, cửa hang tối, dòng sông. Đường hầm không ở câu này (để câu q5, DOK 2).

#### option q1_hill
correct: false
feedback.en: These hills are round, green land.
feedback.vi: Những quả đồi này là đất tròn, xanh.
label.en: hill
label.vi: quả đồi
image.brief: Dùng lại hình `tray_hill` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): round green hill
image.alt.en: A low, round, green slope
image.alt.vi: Sườn đất thấp, tròn, xanh mướt

#### option q1_cave
correct: true
label.en: cave
label.vi: hang động
image.brief: Dùng lại hình `explore_cave`. Từ khoá tìm ảnh (EN): cave entrance limestone
image.alt.en: A dark opening in a rocky hill
image.alt.vi: Cửa tối trong vách núi đá

#### option q1_river
correct: false
feedback.en: This river flows out in the open.
feedback.vi: Dòng sông này chảy ngoài trời.
label.en: river
label.vi: dòng sông
image.brief: Dùng lại hình `explore_river` ở bài `nui-song-va-bien/song-va-ho`. Từ khoá tìm ảnh (EN): wide river ripples
image.alt.en: A wide river with ripples
image.alt.vi: Dòng sông rộng gợn sóng

### q2
id: 57027b82-5e6d-4e87-9419-b24e3c7c98bb
format: true_false
version: 1
dok: 1
prompt.en: Caves are dark and cool inside.
prompt.vi: Trong hang tối và mát.
image.brief: Dùng lại hình `explore_dark`. Từ khoá tìm ảnh (EN): inside cave lamp path
image.alt.en: A dim path between rock walls
image.alt.vi: Lối đi mờ tối giữa vách đá
answer: true
hint.en: Think how far sunlight can reach.
hint.vi: Em nghĩ xem ánh nắng chiếu vào được tới đâu nhé.
explanation_correct.en: Yes! Bring a torch to see inside.
explanation_correct.vi: Đúng rồi! Vào hang, nhớ mang đèn pin nhé.
explanation_wrong.en: This is true. Caves are dark and cool.
explanation_wrong.vi: Câu này đúng. Trong hang tối và mát.
feedback_false.en: Only lamps light this rocky path.
feedback_false.vi: Chỉ có những ngọn đèn soi lối đi đá này.
> DOK 1: nhớ lại ý chính hai. Hình là đúng vật được nói tới.

### q3
id: d83201b1-fc6f-45ad-a02b-2580cffeb2d8
format: single_choice
version: 1
dok: 1
prompt.en: What hangs from a cave roof?
prompt.vi: Thứ gì rủ xuống từ trần hang?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for rocks that point down.
hint.vi: Em tìm những khối đá chĩa xuống dưới nhé.
explanation_correct.en: Yes! They point down, like long drips.
explanation_correct.vi: Đúng rồi! Nhũ đá chĩa xuống như những giọt dài.
explanation_wrong.en: The answer is the stalactites. They hang down.
explanation_wrong.vi: Đáp án là nhũ đá. Nhũ đá rủ xuống.
> DOK 1: nhớ lại ô Stalactites. Hai ảnh bé đã gặp hôm nay, cả hai ở **trong hang** (ô Học, kệ Chơi): lối đi dưới nền hang, nhũ đá rủ từ trần. Bé phải nhớ ô Học (cái gì ở trên trần), không loại được chỉ vì "không ở trong hang". Không đặt ảnh dơi (dơi cũng treo mình trên trần hang, nước đôi).
> Lượt sửa 19/11 (tester n11): lựa chọn sai cũ là đỉnh núi `q3_mountain` (ở ngoài hang, quá dễ loại); thay bằng lối đi trong hang `q3_path` (dùng lại `explore_dark`; brief ảnh đó nay dặn không thấy nhũ đá). Tester C3: nhãn "rock icicles" đổi thành "stalactites".

#### option q3_path
correct: false
feedback.en: This path runs along the cave floor.
feedback.vi: Lối đi này nằm dưới nền hang.
label.en: cave path
label.vi: lối đi trong hang
image.brief: Dùng lại hình `explore_dark`. Từ khoá tìm ảnh (EN): inside cave lamp path
image.alt.en: A dim path between rock walls
image.alt.vi: Lối đi mờ tối giữa vách đá

#### option q3_icicles
correct: true
label.en: stalactites
label.vi: nhũ đá
image.brief: Dùng lại hình `explore_rock_icicles`. Từ khoá tìm ảnh (EN): stalactites cave
image.alt.en: Long, pointy rocks pointing down
image.alt.vi: Những khối đá dài, nhọn chĩa xuống

### q4
id: 56bc975a-5425-4c43-977c-f214bae7b42c
format: order_sequence
version: 1
dok: 2
prompt.en: Start high on a mountain. Walk down to the sea.
prompt.vi: Bắt đầu từ trên núi cao. Em đi dần xuống biển nhé.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_mountain, q4_plain, q4_beach
hint.en: The beach is right by the sea.
hint.vi: Bãi biển nằm sát biển.
explanation_correct.en: Yes! The land gets lower near the sea.
explanation_correct.vi: Đúng rồi! Gần biển, đất thấp dần.
explanation_wrong.en: The order is mountain, plain, then beach.
explanation_wrong.vi: Thứ tự là núi, đồng bằng, rồi bãi biển.
> DOK 2, ôn cả chủ đề (bài 2 núi, bài 3 đồng bằng, bài 5 bãi biển): xếp ba nơi từ cao xuống thấp, như hình toàn cảnh bài 1. Đây là đi trên **đất**, không phải đường đi của nước (Discoverer #9 *Sông, hồ và vòng tuần hoàn nước*). `prompt` nêu đầu núi; gợi ý chỉ nhắc đầu kia. Thẻ trong file không theo thứ tự đúng. Ba thẻ là ảnh chụp, khung vuông.
> [CẦN KIỂM] "Gần biển, đất thấp dần" đúng ở mức thấy (núi phía tây, đồng bằng, rồi bờ biển); có nơi núi ra sát biển (bài không nói).

#### item q4_plain
label.en: plain
label.vi: đồng bằng
image.brief: Dùng lại hình `explore_plain` ở bài `nui-song-va-bien/dong-bang-va-ruong-lua`. Từ khoá tìm ảnh (EN): Mekong Delta fields aerial
image.alt.en: Fields stretching far away
image.alt.vi: Ruộng đồng trải dài tít tắp

#### item q4_beach
label.en: beach
label.vi: bãi biển
image.brief: Dùng lại hình `explore_sandy` ở bài `nui-song-va-bien/bai-bien-dao-va-vinh`. Từ khoá tìm ảnh (EN): white sand beach Vietnam
image.alt.en: Soft, pale sand by calm water
image.alt.vi: Bãi cát trắng mịn bên làn nước lặng

#### item q4_mountain
label.en: mountain
label.vi: núi
image.brief: Dùng lại hình `tray_mountain` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): steep mountain peak clouds
image.alt.en: A tall, steep peak
image.alt.vi: Đỉnh cao, sườn dốc đứng

### q5
id: 91014189-11ae-406c-bcd0-70b8902f86da
format: single_choice
version: 1
dok: 2
prompt.en: Which one did people make?
prompt.vi: Cái nào do người làm ra?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look closely at the walls and floor.
hint.vi: Em nhìn kỹ vách và nền nhé.
explanation_correct.en: Yes! People dug it for cars to pass.
explanation_correct.vi: Đúng rồi! Người ta đào hầm cho xe đi qua.
explanation_wrong.en: The answer is the tunnel. People dug it.
explanation_wrong.vi: Đáp án là đường hầm. Người ta đào ra nó.
> DOK 2: so hai lối tối dẫn vào núi, phân biệt tự nhiên với do người làm (nguyên tắc N1, như nhóm bẫy cả chủ đề). Hai ảnh bé đã gặp hôm nay (ô Cave, kệ Chơi). `alt` đáp án không có chữ của câu hỏi. Gợi ý chỉ chỗ nhìn (vách, nền), không nói "bê tông", "đường".
> Phản hồi lựa chọn hang chỉ tả điều thấy (vách đá gồ ghề), không nói hang hình thành thế nào.

#### option q5_cave
correct: false
feedback.en: This cave has rough, wild rock walls.
feedback.vi: Hang này có vách đá gồ ghề, tự nhiên.
label.en: cave
label.vi: hang động
image.brief: Dùng lại hình `explore_cave`. Từ khoá tìm ảnh (EN): cave entrance limestone
image.alt.en: A dark opening in a rocky hill
image.alt.vi: Cửa tối trong vách núi đá

#### option q5_tunnel
correct: true
label.en: tunnel
label.vi: đường hầm
image.brief: Dùng lại hình `tray_tunnel`. Từ khoá tìm ảnh (EN): road tunnel entrance mountain
image.alt.en: A road going into a hill
image.alt.vi: Con đường dẫn vào trong núi

### q6
id: 11546322-7c20-446b-a7ee-8e9b1fbcba20
format: true_false
version: 1
dok: 2
misconception: caves_are_small
prompt.en: Every cave is small, like a hole.
prompt.vi: Hang nào cũng nhỏ, như một cái lỗ.
image.brief: Dùng lại hình `explore_cave`. Từ khoá tìm ảnh (EN): cave entrance limestone
image.alt.en: A dark opening in a rocky hill
image.alt.vi: Cửa tối trong vách núi đá
answer: false
hint.en: Think of boats going into a cave.
hint.vi: Em nghĩ tới thuyền đi vào trong hang nhé.
explanation_correct.en: Some caves are huge, bigger than houses.
explanation_correct.vi: Có hang rất rộng, to hơn cả ngôi nhà.
explanation_wrong.en: This is false. Some caves are huge.
explanation_wrong.vi: Câu này sai. Có hang rất rộng.
feedback_true.en: Some caves have a whole river inside.
feedback_true.vi: Có hang rộng tới mức có cả dòng sông bên trong.
> Câu misconception (`caves_are_small`), bằng hình, DOK 2: bé nghĩ hang là cái lỗ nhỏ trong vách đá sẽ chạm gật đầu. Câu chỉ kiểm một việc: hang có thể rất rộng không. Hình là cửa hang (vật bé phải nghĩ tới), không phải ảnh hang khổng lồ, để hình không làm bằng chứng thay cho việc nhớ. `explanation_correct` là đúng câu `correction` ở `_topic.md`. Gợi ý trỏ một cảnh quen của ô Huge caves (thuyền vào hang), không trỏ câu chính ô đó.

## Từ vựng

### cave
id: 0f6e05ac-cdaf-4373-a9d0-be2f5d4098ce
tier: core
term.en: cave
term.vi: hang
example.en: Bats sleep in the dark cave.
example.vi: Dơi ngủ trong hang tối.
image.brief: Dùng lại hình `explore_cave`. Từ khoá tìm ảnh (EN): cave entrance limestone
image.alt.en: A dark opening in a rocky hill
image.alt.vi: Cửa tối trong vách núi đá
> [CẦN KIỂM] Nhiều loài dơi ngủ trong hang (ban ngày). Không dạy dơi định vị (Discoverer #13).

### rock
id: d33baba3-9dc0-4dd2-bb54-40420d62c5eb
tier: core
term.en: rock
term.vi: đá
example.en: The cave walls are hard rock.
example.vi: Vách hang là đá cứng.
image.brief: Dùng lại hình `explore_rock_icicles`. Từ khoá tìm ảnh (EN): stalactites cave
image.alt.en: Long, pointy rocks pointing down
image.alt.vi: Những khối đá dài, nhọn chĩa xuống
> "rock" chưa là từ Explorer nào (Discoverer *Đá và đất* có, nhóm tuổi khác). Không dạy loại đá (Discoverer #6).

### stalactite
id: fb43eb9c-c81e-4c1f-af2e-02221fab7772
tier: extra
term.en: stalactite
term.vi: nhũ đá
example.en: We saw stalactites in the cave.
example.vi: Chúng mình thấy nhũ đá trong hang.
image.brief: Dùng lại hình `explore_rock_icicles`. Từ khoá tìm ảnh (EN): stalactites cave
image.alt.en: Long, pointy rocks pointing down
image.alt.vi: Những khối đá dài, nhọn chĩa xuống
> Thêm 19/11 (tester C3, quyết định 4): từ thật của ô Stalactites, để `extra` (từ khó, không vào `word_list`). Không trùng từ Explorer đã có.

### dark
id: c4e29b0d-a30f-4f06-b914-f95a5aafe8bf
tier: extra
term.en: dark
term.vi: tối
example.en: It is dark inside the cave.
example.vi: Trong hang tối om.
image.brief: Dùng lại hình `explore_dark`. Từ khoá tìm ảnh (EN): inside cave lamp path
image.alt.en: A dim path between rock walls
image.alt.vi: Lối đi mờ tối giữa vách đá

### torch
id: 8994cf81-5719-4b95-94c0-945bd8352617
tier: extra
term.en: torch
term.vi: đèn pin
example.en: Switch on your torch in the cave.
example.vi: Vào hang, em bật đèn pin lên.
image.brief: [ảnh] Một chiếc đèn pin cầm tay đang bật, chụp ngang. Ảnh đã chọn (designer 19/11, lệch 8): đèn pin kim loại đang bật, đầu đèn sáng xanh, trên nền sáng (không phải chùm sáng trong tối: ảnh loại đó hợp giấy phép đều có người hoặc nhãn hiệu); có thể thấy bàn tay cầm đèn (không thấy mặt); không nhãn hiệu, logo, chữ trên đèn. Ảnh ngang (thẻ từ 2:1). Từ khoá tìm ảnh (EN): flashlight beam dark; torch light beam; hand holding flashlight
image.alt.en: A torch that is switched on
image.alt.vi: Chiếc đèn pin đang bật
> Ảnh mới, chỉ dùng ở thẻ từ này. Chính tả Anh "torch" (như "autumn" của #5); [CẦN KIỂM] dùng "torch" hay "flashlight".

## Thưởng

### son_doong_card
id: bfbeedc6-d7c2-48f7-b561-b852b4aee7d7
set: landforms
rarity: rare
name.en: Son Doong Cave
name.vi: Hang Sơn Đoòng
tag.en: A forest inside a cave
tag.vi: Có cả rừng trong hang
fact.en: Son Doong has a jungle inside it.
fact.vi: Trong hang Sơn Đoòng có cả một khu rừng.
image.brief: [ảnh] **Cần ảnh đúng hang Sơn Đoòng, giấy phép hợp lệ (CC0, PD, PDM, CC BY); thiếu thì bỏ tên** (thẻ dự phòng dưới đây). Lòng hang khổng lồ, ánh sáng rọi xuống từ hố trần, có cây rừng xanh mọc bên trong; người rất nhỏ ở xa, không nhận ra mặt; không chữ, không logo đơn vị tour. Phần lớn ảnh Sơn Đoòng đẹp có bản quyền riêng: mở trang gốc kiểm giấy phép trước khi chọn. Ảnh vuông hay ngang có khoảng trống (thẻ vuông). Từ khoá tìm ảnh (EN): Son Doong cave; Hang Son Doong; Son Doong doline jungle
image.alt.en: A forest inside a giant cave
image.alt.vi: Khu rừng trong lòng hang khổng lồ
> Bộ `set: landforms`, `rarity: rare`.
> **Thẻ dự phòng một (thiếu ảnh Sơn Đoòng, có ảnh động Phong Nha hợp lệ):** key `phong_nha_card`, `name` "Phong Nha Cave" · "Động Phong Nha", `tag` "A river inside a cave" · "Có sông trong hang", `fact` "Boats carry visitors into Phong Nha." · "Thuyền chở khách vào động Phong Nha.", ảnh lòng hang có thuyền trên sông, `alt` "Boats on a river inside a cave" · "Thuyền trên dòng sông trong hang".
> **Thẻ dự phòng hai (không có ảnh đúng nơi nào):** key `stalactite_card` (đổi 19/11 từ `rock_icicles_card`, tester C3), `name` "Stalactite" · "Nhũ đá", `tag` "Stone hanging from the roof" · "Đá rủ từ trần hang", `fact` "Stalactites grow very, very slowly." · "Nhũ đá lớn lên rất, rất chậm.", hình dùng lại `explore_rock_icicles`.
> [CẦN KIỂM] Hang Sơn Đoòng có rừng mọc trong lòng hang (ở chỗ trần sập, ánh sáng lọt xuống), là một trong những hang lớn nhất thế giới; động Phong Nha có sông ngầm, thuyền chở khách; nhũ đá lớn rất chậm (hàng trăm, hàng nghìn năm; bài không nói số, không nói vì sao). Nghe thử EN "Son Doong", VI "Sơn Đoòng".

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật (CC0, PD, PDM, CC BY có ghi công). Không hình vẽ.
- **Ảnh mới (sáu):** `explore_cave` (cửa hang tự nhiên), `explore_dark` (lối đi trong hang có hàng đèn), `explore_rock_icicles` (nhũ đá, ánh sáng tự nhiên), `explore_big_cave` (lòng hang rất rộng, lối đi gỗ, du khách bé xíu; chữ không nêu tên nơi), `tray_tunnel` (cửa đường hầm xuyên núi), `torch` (đèn pin), cộng `son_doong_card` (**cần ảnh đúng hang Sơn Đoòng**; phần lớn ảnh có bản quyền riêng, có thể phải dùng thẻ dự phòng).
- **Hang khác đường hầm rõ bằng mắt** (luật Explorer số bảy): hang có vách đá gồ ghề, cây cỏ quanh cửa, không bê tông; đường hầm có vòm bê tông nhẵn, đường nhựa có vạch. Câu q5 đặt hai ảnh cạnh nhau.
- **Ánh đèn trong hang:** trắng hay vàng ấm; không đèn màu sặc sỡ (Quy ước hình số chín ở `_topic.md`).
- **Không:** thác lớn, nước xiết, người leo vách, trẻ em trong hang không có người lớn, biển chỉ dẫn có chữ; không ảnh dơi ở câu q3 (nước đôi với "treo trên trần hang").
- **An toàn** (khuyến nghị 7): người trong ảnh ở xa, đi theo đoàn trên lối đi có sẵn.
- **Dùng lại trong chủ đề:** bài 1 `tray_mountain`, `tray_hill`, `tray_sea`, `tray_pool`; bài 2 `explore_cool` (w2); bài 3 `explore_plain` (w3, q4); bài 4 `explore_river` (kệ, q1); bài 5 `explore_island` (w1).
- **Dùng lại chủ đề khác:** `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha` `w1` (hàng rào tre); `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien` `q3` (bãi biển, câu q4).
- **Màu:** Học: Cave `nau_dat`, Dark and cool `cham`, Stalactites `vang_hoe`, Huge caves `gi_dong`. Chơi: Hang `gi_dong`, Đất cao `nau_dat`, Nơi có nước `cham`, Do người làm ra `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (cave, rock). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món. Khởi động `true_false` (w1 Đúng, w2 Sai), `single_choice` (w3, hai lựa chọn). Quiz `single_choice` (q1 ba lựa chọn; q3, q5 hai lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`caves_are_small`). Không có `labels` ở câu `true_false`.
- **Màn Chơi, ví dụ để kiểm:** Cửa hang, Ngọn núi, Dòng sông → `balanced`; Nhũ đá, Quả đồi, Biển → `balanced`; Cửa hang, Nhũ đá, Biển → `missing.tray_high`; Đường hầm, Ngọn núi, Biển → `has_limited`; Cửa hang, Quả đồi, Bể bơi → `has_limited`.
- **Khởi động:** w1 → `nui-song-va-bien/bai-bien-dao-va-vinh`, w2 → `nui-song-va-bien/nui-va-doi`, w3 → `nui-song-va-bien/dong-bang-va-ruong-lua` (ba bài có id sẵn).
- **Thẻ thưởng:** `son_doong_card` (dự phòng `phong_nha_card`, rồi `stalactite_card`), bộ `landforms`, `rarity: rare`.
- **Từ EN có thể ngoài Starters/Movers:** cave, rock, stalactite, stalactites, torch, damp, drips, hall, huge, tunnel, dug, Phong Nha, Son Doong, jungle. Nghe thử giọng EN đọc "Phong Nha", "Son Doong", "stalactites"; giọng VI đọc "Sơn Đoòng", "nhũ đá", "gồ ghề", "nhỏ giọt".
