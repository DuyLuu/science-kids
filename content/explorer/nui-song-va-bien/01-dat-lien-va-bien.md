---
id: 277cfc38-16b7-4ec1-879d-d06f77e79fb6
topic: nui-song-va-bien
slug: dat-lien-va-bien
order: 1
stage: opener
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Land and sea
vi: Đất liền và biển
> Giữ đúng tên ở `content/syllabus.json` (key `new-mountains-rivers-and-seas`, bài số một). `id` là `lesson_id` của danh mục.

## Mục tiêu
en: I can spot land and water from above.
vi: Em chỉ ra được đất liền và nước khi nhìn từ trên cao.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 19/11/2026. Ticket SK-058. Mọi dòng `id:` khác để trống; chạy `ids` sau `_topic.md`.
> Bài mở chủ đề: nhìn toàn cảnh từ trên cao, chia mặt đất thành đất cao, đất bằng và nơi có nước; giới thiệu năm bài sau (núi và đồi, đồng bằng, sông và hồ, bờ biển; hang ở bài 6). Sửa `land_all_flat` ở ô High land, Flat land và câu q6.
> Ranh giới với Discoverer #7 *Hệ Mặt Trời* (Trái Đất là quả cầu; Duy chốt 19/11): chỉ nhìn từ máy bay, flycam, đỉnh đồi; có hình vẽ giấy cắt minh hoạ đất liền và biển; không ảnh, hình Trái Đất từ vũ trụ, không quả cầu, không bản đồ.

## Ý chính
1.en: From up high, we see land and sea.
1.vi: Nhìn từ trên cao, mình thấy đất liền và biển.
2.en: Some land is high. Some land is flat.
2.vi: Có chỗ đất cao, có chỗ đất bằng phẳng.
3.en: Rivers and lakes are water on land.
3.vi: Sông và hồ là nước nằm trên đất liền.
> Từ cụ thể tới trừu tượng: điều bé thấy khi nhìn xuống (đất, biển), rồi chia đất theo hình dạng (cao, bằng), rồi chia nước theo chỗ nằm (trên đất liền hay ngoài biển).
> Ghép với ô Học (`KeyPointPictures.match`): ý 1 → From up high (bốn từ chung), ý 2 → High land (hai từ, ô cùng thứ tự; Flat land cũng hai từ nhưng không hơn), ý 3 → Water on land (bốn từ). Ô Flat land không ghép.
> [CẦN KIỂM] "Sông và hồ là nước trên đất liền": đúng ở mức thấy; đầm phá, hồ nước mặn ven biển là ngoại lệ, bài không nói.

## Khởi động

> Hai câu, cả hai ôn *Những nơi sống trên Trái Đất* (#4) vì đây là bài đầu chủ đề: w1 ôn bài 5 (biển, mốc khoảng ba tuần), w2 ôn bài 2 (đất phủ băng, nối sang chữ "land" của bài này).

### w1
id: 8b46d83f-be2b-4f9e-9c4d-6e3ea7e3d4e4
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: noi-song-tren-trai-dat/bien-va-dai-duong
prompt.en: Sea water tastes salty.
prompt.vi: Nước biển có vị mặn.
image.brief: Dùng lại hình `q3` ở bài `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien`. Từ khoá tìm ảnh (EN): empty beach blue sea
image.alt.en: A beach by the sea
image.alt.vi: Bãi biển vắng
answer: true
hint.en: Think of sea water on your lips.
hint.vi: Em nhớ lại vị nước biển dính trên môi nhé.
explanation_correct.en: Yes! The sea has lots of salt.
explanation_correct.vi: Đúng rồi! Trong nước biển có nhiều muối.
explanation_wrong.en: This is true. Sea water is salty.
explanation_wrong.vi: Câu này đúng. Nước biển có vị mặn.
feedback_false.en: People make salt from sea water.
feedback_false.vi: Người ta làm muối từ nước biển.
> Ôn ý chính một của #4 bài 5 ("The ocean is huge and salty."). Chỉ ôn ở Khởi động; bài 5 của chủ đề này không dạy lại "biển mặn" (SK-058 khuyến nghị 3). Câu mới, khác "Sea water tastes sweet." của Discoverer.

### w2
id: 9c5bb83a-f34c-44ce-8f10-cfc55e49a3ee
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: noi-song-tren-trai-dat/nam-cuc
prompt.en: The Antarctic is hot, sandy land.
prompt.vi: Nam Cực là vùng đất nóng, đầy cát.
image.brief: Dùng lại hình `explore_land` ở bài `noi-song-tren-trai-dat/nam-cuc`. Từ khoá tìm ảnh (EN): Transantarctic Mountains
image.alt.en: Snowy mountains on icy land
image.alt.vi: Núi tuyết trên vùng đất phủ băng
answer: false
hint.en: Look at the colour of the land.
hint.vi: Em nhìn màu của mặt đất nhé.
explanation_correct.en: The Antarctic is icy land, far south.
explanation_correct.vi: Nam Cực là vùng đất phủ băng, ở tận phía nam.
explanation_wrong.en: This is false. The Antarctic is icy.
explanation_wrong.vi: Câu này sai. Nam Cực phủ đầy băng.
feedback_true.en: Snow and ice cover these mountains.
feedback_true.vi: Băng tuyết phủ kín những ngọn núi này.
> Ôn ý chính một của #4 bài 2. Câu khẳng định, đáp án Sai; `explanation_correct` là đúng câu ý chính bài đó, đứng một mình. Ảnh có núi tuyết: nhắc trước chữ "land" và "mountains" của bài này.

## Học

> Bốn ô, từ toàn cảnh nhìn từ trên cao (hình vẽ) tới từng loại đất và nước (ảnh chụp). Ô From up high là hình vẽ giấy cắt duy nhất của ô Học (Duy chốt 19/11); ba ô kia là ảnh.
> Chữ cần dạy trước khi hỏi: "beach is where land meets sea" (q4) ở ô From up high; "mountains are very high", "hills are lower and round" (q1, q3) ở ô High land; "rice fields on flat land" (q1, q3) ở ô Flat land; "a lake has land all around" (bài 2 trở đi) ở ô Water on land.

### explore
id: 32c2ce7b-0d27-45c9-9fdb-95a289118e79
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_above
label.en: From up high
label.vi: Nhìn từ trên cao
color: cham
sentence.en: From a plane, we see land and sea.
sentence.vi: Từ máy bay, mình thấy đất liền và biển.
image.brief: [hình vẽ] Giấy cắt style E, không nét viền, màu từ design tokens: một vùng đất và biển nhìn chếch từ trên cao (như nhìn qua cửa sổ máy bay). Phía xa là dãy núi nhọn màu xanh đậm và vài quả đồi tròn xanh nhạt; ở giữa là đồng bằng phẳng chia ô ruộng xanh, một dòng sông uốn khúc chảy qua, một cái hồ nhỏ có bờ bao quanh, vài mái nhà nhỏ; phía trước là dải bãi cát vàng, rồi biển xanh chiếm khoảng một phần ba khung, có vài gợn sóng trắng và một hòn đảo nhỏ có cây. Đường chân trời thẳng, không cong; không thấy Trái Đất hình cầu, không vũ trụ, không quả địa cầu, không bản đồ, không la bàn; đường bờ biển là một đoạn cong đơn giản, không giống hình dạng bờ biển một nước nào; không người, không máy bay trong hình, không chữ. Ảnh ngang có khoảng trống (khung vuông ở Học, khung 4:3 câu q6, câu w1 bài 2).
image.alt.en: Land and sea seen from up high
image.alt.vi: Đất liền và biển nhìn từ trên cao
examples.1.en: the sea looks wide and blue
examples.1.vi: biển trông rộng và xanh
examples.2.en: the beach is where land meets sea
examples.2.vi: bãi biển là chỗ đất liền gặp biển
examples.3.en: we live on land
examples.3.vi: mình sống trên đất liền
> Hình gốc của cả chủ đề (câu q6, bài 2 w1). Hình vẽ toàn cảnh là chỗ Duy cho vẽ thêm (SK-058 khuyến nghị 1 sửa): một ảnh chụp thật khó có đủ núi, đồng bằng, sông, hồ, bãi cát, biển, đảo trong một khung. Hình cũng là "mục lục" của chủ đề: núi và đồi (bài 2), đồng bằng (bài 3), sông và hồ (bài 4), bãi biển và đảo (bài 5).
> Ví dụ hai dạy trước câu q4 (bãi cát giữa đất và biển).

#### group explore_high
label.en: High land
label.vi: Đất cao
color: nau_dat
sentence.en: Mountains and hills are high land.
sentence.vi: Núi và đồi là những chỗ đất cao.
image.brief: Dùng lại hình `explore_land` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): hills tea plantation Vietnam village
image.alt.en: Hills, mountains and a village
image.alt.vi: Đồi, núi và làng quê
examples.1.en: mountains are very high
examples.1.vi: núi rất cao
examples.2.en: hills are lower and round
examples.2.vi: đồi thấp hơn và tròn
examples.3.en: you climb up to the top
examples.3.vi: muốn lên đỉnh phải leo lên
> Hình của nhóm Discoverer (đồi chè Mộc Châu, CC0): **chép mục** sang chủ đề này (`same_as` không sang nhóm tuổi khác), giữ `alt` gốc. Ảnh không có sông, hồ, biển.
> Ví dụ một, hai dạy trước câu q1, q3 (núi cao, đồi tròn) và bài 2.

#### group explore_flat
label.en: Flat land
label.vi: Đất bằng
color: vang_hoe
sentence.en: Plains are wide, flat land.
sentence.vi: Đồng bằng là vùng đất rộng, bằng phẳng.
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh
examples.1.en: rice fields on flat land
examples.1.vi: ruộng lúa trên đất bằng
examples.2.en: as flat as a table
examples.2.vi: phẳng như mặt bàn
examples.3.en: you can see very far
examples.3.vi: em nhìn được rất xa
> Ruộng lúa là hình quen để bé nhận ra đất bằng (SK-058 khuyến nghị 8); đồng bằng dạy kỹ ở bài 3. Ví dụ hai là chữ của gợi ý câu q3.
> Designer (tester n6): brief gốc của `q2_rice` ghi "núi ở xa". Ảnh này là đáp án "đất bằng" (q3, bài 2 q4), nên crop sao cho không thấy núi rõ ở mọi khung (vuông, 5:2, thẻ `order_sequence`).

#### group explore_water
label.en: Water on land
label.vi: Nước trên đất liền
color: gi_dong
sentence.en: Rivers and lakes hold water on land.
sentence.vi: Sông và hồ chứa nước trên đất liền.
image.brief: [ảnh] Chụp từ flycam hay máy bay, nhìn chếch xuống: một dải sông uốn lượn qua những thửa ruộng xanh và vườn cây, thấy rõ cả hai bờ; không thấy biển, không thấy cửa sông; có thể có một con thuyền nhỏ; ưu tiên cảnh Việt Nam; không ảnh vệ tinh, không thấy hình dạng cả một vùng; không lũ, không nước tràn ruộng; không người nhìn rõ, không chữ. Ảnh ngang có khoảng trống (khung vuông ở Học và kệ Chơi, thẻ hai lựa chọn 17:10 câu q5 bài 4). Từ khoá tìm ảnh (EN): winding river aerial fields; river bend drone farmland; Vietnam river aerial
image.alt.en: Water winding through rice fields
image.alt.vi: Dải nước uốn lượn qua ruộng lúa
examples.1.en: a river is long
examples.1.vi: dòng sông dài
examples.2.en: a lake has land all around
examples.2.vi: hồ có đất bao quanh
examples.3.en: the sea is much wider
examples.3.vi: biển thì rộng hơn nhiều
> Hình gốc của cả chủ đề (bài 3 ô Near rivers, câu q2; bài 4 kệ Chơi, câu q5, từ `flow`). Lượt 4: không còn ở kệ bài 1, 3. `alt` không có chữ "river" · "sông", vì bài 4 câu q5 hỏi "From up high, which one is a river?" và đáp án là ảnh này.
> Không thấy sông chảy ra biển: đường đi của nước để Discoverer #9 *Sông, hồ và vòng tuần hoàn nước* (SK-058 khuyến nghị 2; SK-061).
> Ảnh đã chọn (designer 19/11, chép mục Discoverer): sông Tràng An nhìn từ trên cao, ruộng hai bên vàng xanh (lúa sắp chín), nhiều thuyền khách nhỏ, góc trên còn một mẩu vách núi đá. `alt` cũ "…through green fields" · "…qua ruộng xanh" → "Water winding through rice fields" · "Dải nước uốn lượn qua ruộng lúa" (lệch 2). Brief trên giữ làm mô tả lúc tìm ảnh.

### new_words
id: 8401b3c9-9f10-40ba-8a62-8a756e673083
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: land, sea

## Chơi

> Bé chọn ba nơi: một chỗ đất cao (núi, đồi), một chỗ đất bằng (ruộng lúa), một nơi có nước (biển, sông). Đạt khi đủ ba nhóm và không chọn món bẫy.
> Món bẫy là thứ do người làm ra nhưng trông giống nơi tự nhiên: toà nhà cao vươn lên như núi, bể bơi chứa nước như hồ. Bẫy dạy nguyên tắc N1 (núi, sông, biển là của tự nhiên).
> Kệ bảy món, toàn ảnh chụp, cùng kiểu chụp từ xa.

### tray
id: 845c3aa9-d904-4f5a-96a6-9e3a1be40b6b
type: build_tray
version: 1
prompt.en: Find high land, flat land and water
prompt.vi: Tìm đất cao, đất bằng và nơi có nước
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick high land, flat land and water.
messages.start.vi: Em chọn một chỗ đất cao, một chỗ đất bằng và một nơi có nước nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! You found land and water.
messages.balanced.vi: Tuyệt! Em đã tìm được đất và nước.
messages.has_limited.en: People made that one.
messages.has_limited.vi: Cái này do người làm ra.
messages.missing.tray_high.en: You still need some high land.
messages.missing.tray_high.vi: Em còn thiếu một chỗ đất cao.
messages.missing.tray_flat.en: You still need some flat land.
messages.missing.tray_flat.vi: Em còn thiếu một chỗ đất bằng.
messages.missing.tray_water.en: You still need some water.
messages.missing.tray_water.vi: Em còn thiếu một nơi có nước.
> Lời nhắn `has_limited` đúng với cả hai món bẫy (toà nhà, bể bơi).

#### group tray_high
label.en: High land
label.vi: Đất cao
color: nau_dat
role: required

#### group tray_flat
label.en: Flat land
label.vi: Đất bằng
color: vang_hoe
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
> Nhãn chung của nhóm bẫy ở bài 1, 2, 4, 6 (một ý một nhãn).

#### item tray_mountain
label.en: Mountain
label.vi: Ngọn núi
group: tray_high
image.brief: [ảnh] Một ngọn núi cao đứng riêng, đỉnh nhọn, sườn dốc nhiều đá và cây, mây trắng vờn quanh đỉnh hay sườn, chụp từ xa ngang tầm hoặc từ dưới lên; thấy rõ cả ngọn núi từ chân tới đỉnh; không sông, suối, thác, hồ; không miệng núi lửa, không khói; không tuyết phủ dày (tránh cảnh núi ôn đới); không người, không cáp treo, không cột mốc, không chữ. Ưu tiên núi miền Bắc Việt Nam, nhưng `alt` không nêu tên nơi. Có thể chép mục `tray_mountain` của Discoverer `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat` (Three Peak Green, PD) nếu ảnh đó dốc, nhọn rõ. Ảnh ngang có khoảng trống (món Chơi vuông, thẻ ba lựa chọn 5:2, thẻ `order_sequence` vuông). Từ khoá tìm ảnh (EN): steep mountain peak clouds; rocky mountain peak; Hoang Lien Son mountains
image.alt.en: A tall, steep peak
image.alt.vi: Đỉnh cao, sườn dốc đứng
> Hình gốc của cả chủ đề (q1, từ `high`; bài 2 ô Mountain, kệ, q1, q4, q6, từ `mountain`, `steep`; bài 3 kệ, q1, q4, w1; bài 6 kệ, q3, q4). `alt` không có chữ "mountain" · "núi" vì bài 2 câu q1 hỏi "Which one is a mountain?".
> Ảnh đã chọn (designer 19/11): đỉnh núi đá trong mây (Unsplash, ở nước ngoài). Khớp chữ; chữ bé nghe không nói nơi chụp.
> Phải khác rõ `tray_hill` (luật Explorer số bảy): núi nhọn, dốc, nhiều đá; đồi thấp, tròn, phủ cỏ hay chè.

#### item tray_hill
label.en: Hill
label.vi: Quả đồi
group: tray_high
image.brief: [ảnh] Một quả đồi thấp, đỉnh tròn, sườn thoai thoải phủ cỏ xanh hoặc hàng chè, chụp từ xa ngang tầm, trời xanh; thấy cả quả đồi; không có núi cao nhọn trong khung (tránh lẫn với núi); không sông, hồ; không người, không nhà lớn, không chữ. Ưu tiên đồi chè Việt Nam (Mộc Châu, Thái Nguyên), nhưng `alt` không nêu tên nơi. Ảnh ngang có khoảng trống. Từ khoá tìm ảnh (EN): round green hill; tea hill Vietnam; rolling green hill
image.alt.en: A low, round, green slope
image.alt.vi: Sườn đất thấp, tròn, xanh mướt
> Hình gốc của cả chủ đề (q3; bài 2 ô Hill, kệ, q1, q2, q4; bài 3 kệ, w1; bài 6 kệ, w3). `alt` không có chữ "hill" · "đồi".
> Ảnh đã chọn (designer 19/11, lệch 11): đồi chè Long Cốc, nhiều quả đồi tròn (khung vuông lấy đồi giữa), không phải một quả đồi đứng riêng. Những câu tả chính ảnh này (bài 2 q2 `feedback_true`, bài 6 w3, q1 `feedback`) đổi sang số nhiều "these hills" · "những quả đồi này"; nhãn "Hill" · "Quả đồi" giữ (tên loại đất).

#### item tray_fields
label.en: Rice fields
label.vi: Ruộng lúa
group: tray_flat
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh

#### item tray_sea
label.en: Sea
label.vi: Biển
group: tray_water
image.brief: [ảnh] Biển xanh rộng tới chân trời, có gợn sóng trắng, chụp ngang từ bờ hoặc từ thuyền; không thấy đất, đảo, bãi cát; không thuyền đọc được tên, số; không người, không chữ; trời xanh có mây nhẹ. Có thể chép mục `tray_sea` của Discoverer `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat` (Open Ocean, CC BY 2.0) nếu khớp. Tiêu đề, mô tả ảnh ở nguồn không có tên biển (xem Quy ước hình số bốn ở `_topic.md`). Từ khoá tìm ảnh (EN): open sea horizon; blue sea waves horizon
image.alt.en: Wide blue water to the sky
image.alt.vi: Nước xanh mênh mông tới chân trời
> Hình gốc của cả chủ đề (q1, từ `sea`; bài 3 q1; bài 4 kệ, q1, q4; bài 6 kệ). `alt` không có chữ "sea" · "biển".
> Ảnh lượt 2 (designer 19/11, c4): biển khơi Avşa (Unsplash, CC0), gợn sóng tới chân trời thẳng, không đất, không đảo, không thuyền; không còn chép mục Discoverer. `alt` khớp.

#### item tray_river
label.en: River
label.vi: Dòng sông
group: tray_water
image.brief: Dùng lại hình `explore_river` ở bài `nui-song-va-bien/song-va-ho`. Từ khoá tìm ảnh (EN): wide river ripples
image.alt.en: A wide river with ripples
image.alt.vi: Dòng sông rộng gợn sóng
> Lượt 4 (designer 19/11, Duy thấy trên máy): ảnh Tràng An `explore_water` có cả ruộng lúa và núi đá, nước đôi với nhóm Đất cao, Đất bằng của kệ; món nay dùng sông Lô (chỉ có nước và bờ tre). Nhãn giữ.

#### item tray_building
label.en: Tall building
label.vi: Toà nhà cao
group: tray_made
image.brief: [ảnh] Một toà nhà cao tầng đứng một mình, chụp từ dưới lên hoặc từ xa, nền trời xanh; thấy rõ là nhà do người xây (tường, cửa sổ); không biển hiệu, logo, chữ, không cờ; không người. Từ khoá tìm ảnh (EN): tall building blue sky; high rise building
image.alt.en: A tall building
image.alt.vi: Toà nhà cao tầng
> Hình gốc của cả chủ đề (q3, q5; bài 2 kệ). Món bẫy giống nhóm "High land": cao nhưng do người xây. Ảnh đã chọn: toà nhà ở San Francisco (Mỹ); chữ không nói nơi chụp, khớp.

#### item tray_pool
label.en: Swimming pool
label.vi: Bể bơi
group: tray_made
image.brief: [ảnh] Một bể bơi ngoài trời vắng người, nước xanh trong, thành bể lát gạch, thấy rõ là bể do người xây; không người, không trẻ em, không biển báo, không chữ, không logo khách sạn. Từ khoá tìm ảnh (EN): empty outdoor swimming pool; swimming pool no people
image.alt.en: An empty swimming pool
image.alt.vi: Bể bơi vắng người
> Hình gốc của cả chủ đề (bài 4 kệ, q3; bài 6 kệ). Món bẫy giống nhóm "Water": có nước nhưng do người làm ra. Ảnh đã chọn: bể bơi chụp từ trên cao, vắng người; khớp.

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1, q3, q4; ba lựa chọn), `true_false` (q2 Đúng, q5 Sai, q6 Sai).
> Hình câu `single_choice` là hàng rào tre trung tính (app Explorer ẩn hình câu hỏi khi mọi lựa chọn có hình). Câu nào cũng tự đủ nghĩa khi chỉ nghe.
> Loại hình: q1, q3 ba ảnh chụp (đều đã gặp ở Học hay kệ Chơi); q4 ba hình vẽ giấy cắt mới (không có ảnh chụp); q2, q5 ảnh; q6 hình vẽ toàn cảnh `explore_above`.

### q1
id: 411abf1c-0a76-43f1-92c5-57e7222046ce
format: single_choice
version: 1
dok: 1
prompt.en: Which picture shows the sea?
prompt.vi: Hình nào là biển?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for wide, blue water.
hint.vi: Em tìm chỗ nước xanh, rộng mênh mông nhé.
explanation_correct.en: Yes! The sea stretches far away.
explanation_correct.vi: Đúng rồi! Biển trải rộng ra tít xa.
explanation_wrong.en: The answer is the sea. It is wide water.
explanation_wrong.vi: Đáp án là biển. Biển là vùng nước rộng.
> DOK 1: nhận ra biển (ô From up high, kệ Chơi). Ba ảnh khác hẳn nhau: nước tới chân trời, đỉnh núi, ruộng lúa.

#### option q1_mountain
correct: false
feedback.en: A mountain is very high land.
feedback.vi: Núi là chỗ đất rất cao.
label.en: mountain
label.vi: ngọn núi
image.brief: Dùng lại hình `tray_mountain`. Từ khoá tìm ảnh (EN): steep mountain peak clouds
image.alt.en: A tall, steep peak
image.alt.vi: Đỉnh cao, sườn dốc đứng

#### option q1_sea
correct: true
label.en: sea
label.vi: biển
image.brief: Dùng lại hình `tray_sea`. Từ khoá tìm ảnh (EN): open sea horizon
image.alt.en: Wide blue water to the sky
image.alt.vi: Nước xanh mênh mông tới chân trời

#### option q1_fields
correct: false
feedback.en: Rice fields grow on flat land.
feedback.vi: Ruộng lúa nằm trên đất bằng.
label.en: rice fields
label.vi: ruộng lúa
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh

### q2
id: 5f0456e7-3c88-4c9b-b2e8-685ac311c0ac
format: true_false
version: 1
dok: 1
prompt.en: Mountains and hills are high land.
prompt.vi: Núi và đồi là những chỗ đất cao.
image.brief: Dùng lại hình `explore_land` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): hills tea plantation Vietnam village
image.alt.en: Hills, mountains and a village
image.alt.vi: Đồi, núi và làng quê
answer: true
hint.en: Think of climbing up a hill.
hint.vi: Em nghĩ tới lúc leo lên đồi nhé.
explanation_correct.en: Yes! From the top, you see far.
explanation_correct.vi: Đúng rồi! Đứng trên đỉnh, em nhìn được rất xa.
explanation_wrong.en: This is true. Mountains and hills are high.
explanation_wrong.vi: Câu này đúng. Núi và đồi là chỗ đất cao.
feedback_false.en: You walk uphill to reach the top.
feedback_false.vi: Muốn lên tới đỉnh, em phải đi lên dốc.
> DOK 1: nhớ lại câu chính ô High land. Hình là đúng vật được nói tới (ảnh ô High land, chép mục Discoverer).

### q3
id: 9d07b2a5-bde0-4a59-976e-66742b0274fa
format: single_choice
version: 1
dok: 1
prompt.en: Which one is flat land?
prompt.vi: Đâu là đất bằng?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for land as flat as a table.
hint.vi: Em tìm chỗ đất phẳng như mặt bàn nhé.
explanation_correct.en: Yes! Flat land is good for rice.
explanation_correct.vi: Đúng rồi! Đất bằng hợp để làm ruộng lúa.
explanation_wrong.en: The answer is the rice fields. They are flat.
explanation_wrong.vi: Đáp án là ruộng lúa. Ruộng lúa bằng phẳng.
> DOK 1: nhớ lại ô Flat land. Gợi ý dùng ví dụ "as flat as a table" (cách so, không gọi tên đáp án). Lựa chọn sai: quả đồi (đất cao), toà nhà (do người xây), cả hai bé đã gặp ở kệ Chơi.

#### option q3_hill
correct: false
feedback.en: A hill goes up, then down.
feedback.vi: Quả đồi dốc lên rồi lại thoải xuống.
label.en: hill
label.vi: quả đồi
image.brief: Dùng lại hình `tray_hill`. Từ khoá tìm ảnh (EN): round green hill
image.alt.en: A low, round, green slope
image.alt.vi: Sườn đất thấp, tròn, xanh mướt

#### option q3_fields
correct: true
label.en: rice fields
label.vi: ruộng lúa
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh

#### option q3_building
correct: false
feedback.en: People built this tall building.
feedback.vi: Toà nhà cao này do người xây.
label.en: tall building
label.vi: toà nhà cao
image.brief: Dùng lại hình `tray_building`. Từ khoá tìm ảnh (EN): tall building blue sky
image.alt.en: A tall building
image.alt.vi: Toà nhà cao tầng

### q4
id: 98a06ce6-aaf2-4d86-b636-1963961efc26
format: single_choice
version: 1
dok: 2
prompt.en: Which picture has both land and sea?
prompt.vi: Hình nào có cả đất liền và biển?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for where sand meets water.
hint.vi: Em tìm chỗ bãi cát gặp nước nhé.
explanation_correct.en: Yes! The beach is where land meets sea.
explanation_correct.vi: Đúng rồi! Bãi biển là chỗ đất liền gặp biển.
explanation_wrong.en: The answer has land, a beach and sea.
explanation_wrong.vi: Đáp án là hình có đất liền, bãi cát và biển.
> DOK 2: so ba cảnh, phân loại cảnh có cả hai phần (ý chính một). Ba lựa chọn là **ba hình vẽ giấy cắt mới**, cùng nét, cùng bảng màu, cùng góc nhìn chếch từ trên cao, cùng cỡ; không hình nào bé đã gặp, nên đáp án không nổi bật (Duy chốt 19/11: một câu một loại hình, đáp án không là hình vẽ duy nhất). Không đặt hình toàn cảnh `explore_above` vào đây (đáp án sẽ là hình quen duy nhất giữa hai hình mới).
> Gợi ý chỉ một chỗ nhìn (bãi cát giáp nước), không gọi tên đáp án; "where sand meets water" dựa trên ví dụ hai ô From up high.

#### option q4_only_land
correct: false
feedback.en: This picture has hills and fields only.
feedback.vi: Hình này chỉ có đồi và ruộng.
label.en: hills and fields
label.vi: đồi và ruộng
image.brief: [hình vẽ] Giấy cắt style E, cùng nét và bảng màu với hai hình kia của câu q4: nhìn chếch từ trên cao, vài quả đồi tròn xanh, ruộng chia ô phẳng, một con đường đất nhỏ, vài mái nhà; không có nước ở đâu cả (không sông, hồ, ao, biển); không người, không chữ, không bản đồ. Khung 5:2.
image.alt.en: Green hills and fields
image.alt.vi: Đồi xanh và ruộng đồng

#### option q4_land_sea
correct: true
label.en: land and sea
label.vi: đất liền và biển
image.brief: [hình vẽ] Giấy cắt style E, cùng nét và bảng màu với hai hình kia của câu q4: nhìn chếch từ trên cao, nửa trái là đồi xanh và hàng dừa, giữa là dải bãi cát vàng cong, nửa phải là biển xanh có gợn sóng trắng; đường bờ là một đường cong đơn giản, không giống hình dạng bờ biển một nước nào; không đảo, không người, không chữ, không bản đồ. Khác hình toàn cảnh của ô From up high (ít chi tiết hơn, không núi, không sông). Khung 5:2.
image.alt.en: Hills, sand and waves
image.alt.vi: Đồi, bãi cát và sóng nước
> `alt` không có chữ "land", "sea", "đất liền", "biển" của câu hỏi.

#### option q4_only_water
correct: false
feedback.en: This picture has only water and sky.
feedback.vi: Hình này chỉ có nước và bầu trời.
label.en: open sea
label.vi: biển khơi
image.brief: [hình vẽ] Giấy cắt style E, cùng nét và bảng màu với hai hình kia của câu q4: nhìn chếch từ trên cao, chỉ có nước biển xanh nhiều lớp sóng tới đường chân trời thẳng, trời có mây; không đất, không đảo, không thuyền, không người, không chữ. Khung 5:2.
image.alt.en: Waves as far as you see
image.alt.vi: Sóng nước tới tận chân trời

### q5
id: 2f71d80a-c559-4124-8c78-7c6943022e60
format: true_false
version: 1
dok: 2
prompt.en: Tall buildings are high land.
prompt.vi: Toà nhà cao là chỗ đất cao.
image.brief: Dùng lại hình `tray_building`. Từ khoá tìm ảnh (EN): tall building blue sky
image.alt.en: A tall building
image.alt.vi: Toà nhà cao tầng
answer: false
hint.en: Think who made this tall thing.
hint.vi: Em nghĩ xem ai làm ra thứ cao này nhé.
explanation_correct.en: People build tall buildings on land.
explanation_correct.vi: Người ta xây toà nhà cao trên đất.
explanation_wrong.en: This is false. People built this building.
explanation_wrong.vi: Câu này sai. Toà nhà này do người xây.
feedback_true.en: Workers built this, floor by floor.
feedback_true.vi: Thợ xây toà nhà này lên từng tầng một.
> DOK 2: áp ý "đất cao là núi, đồi" vào một vật cao quen thuộc mà không phải đất (như món bẫy kệ Chơi). Câu khẳng định, đáp án Sai; `explanation_correct` đứng một mình. Gợi ý là cách nghĩ (ai làm ra), không nói "người" hay "đất".

### q6
id: d2176387-8193-4ce2-abba-0624ea07625c
format: true_false
version: 1
dok: 2
misconception: land_all_flat
prompt.en: The land is flat everywhere.
prompt.vi: Ở đâu đất cũng bằng phẳng.
image.brief: [hình vẽ] Cùng bản vẽ giấy cắt toàn cảnh của ô From up high, khung 4:3 (designer 19/11 xuất thành file riêng cho câu này và bài 2 w1): núi nhọn, đồi tròn, ruộng chia ô, sông uốn khúc, hồ có bờ, mái nhà, bãi cát, biển, đảo nhỏ; chân trời thẳng, không chữ, không bản đồ.
image.alt.en: Land and sea seen from up high
image.alt.vi: Đất liền và biển nhìn từ trên cao
answer: false
hint.en: Think of the mountains you have seen.
hint.vi: Em nghĩ tới những ngọn núi em từng thấy nhé.
explanation_correct.en: Some land is high, some is flat.
explanation_correct.vi: Có chỗ đất cao, có chỗ đất bằng.
explanation_wrong.en: This is false. Mountains and hills are high.
explanation_wrong.vi: Câu này sai. Núi và đồi là chỗ đất cao.
feedback_true.en: This picture has mountains, too.
feedback_true.vi: Trong hình này cũng có núi.
> Câu misconception (`land_all_flat`), bằng hình, DOK 2: bé còn nghĩ "đâu cũng bằng như chỗ em ở" sẽ chạm gật đầu. Câu chỉ kiểm một việc: đất có chỗ cao, chỗ bằng. Hình toàn cảnh (cả núi, đồi và đồng bằng) là đúng vật được nói tới, như ảnh nắng sau mây ở *Thời tiết và các mùa* bài 1 q6. `explanation_correct` là đúng câu `correction` ở `_topic.md`.
> Hình câu q6 là hình vẽ: câu `true_false` chỉ có một hình nên không có chuyện trộn loại hình.
> [CẦN KIỂM] Quan niệm `land_all_flat` (mục Misconceptions ở `_topic.md`).

## Từ vựng

### land
id: b3df664a-fbd3-41ff-ac75-c99412912eff
tier: core
term.en: land
term.vi: đất liền
example.en: We build our homes on land.
example.vi: Mình làm nhà trên đất liền.
image.brief: Dùng lại hình `explore_land` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): hills tea plantation Vietnam village
image.alt.en: Hills, mountains and a village
image.alt.vi: Đồi, núi và làng quê

### sea
id: 0b9da321-5f3a-482c-ab85-b4ddd3bb1be0
tier: core
term.en: sea
term.vi: biển
example.en: Big ships sail on the sea.
example.vi: Tàu lớn đi trên biển.
image.brief: Dùng lại hình `tray_sea`. Từ khoá tìm ảnh (EN): open sea horizon
image.alt.en: Wide blue water to the sky
image.alt.vi: Nước xanh mênh mông tới chân trời
> "sea" chưa là từ Explorer nào ("ocean" là từ `core` của #4 bài 5; Discoverer có "sea" là từ `extra`, nhóm tuổi khác).

### flat
id: a28fa9d2-c11a-43c7-9135-5243c14698d8
tier: extra
term.en: flat
term.vi: bằng phẳng
example.en: The top of a table is flat.
example.vi: Mặt bàn bằng phẳng.
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh

### high
id: a3033572-0691-4d75-94e4-1fc4ed383fa7
tier: extra
term.en: high
term.vi: cao
example.en: Birds fly high above the hills.
example.vi: Chim bay cao trên những quả đồi.
image.brief: Dùng lại hình `tray_mountain`. Từ khoá tìm ảnh (EN): steep mountain peak clouds
image.alt.en: A tall, steep peak
image.alt.vi: Đỉnh cao, sườn dốc đứng

## Thưởng

### cape_card
id: 4ce4d725-9159-47f2-8b07-9e938d055374
set: landforms
rarity: common
name.en: Cape
name.vi: Mũi đất
tag.en: Land poking into the sea
tag.vi: Đất chìa ra biển
fact.en: A cape has sea on three sides.
fact.vi: Mũi đất có biển ở ba phía.
image.brief: [ảnh] Một mũi đất chìa ra biển nhìn từ trên cao hoặc từ đỉnh đồi: dải đất có cây xanh hoặc đá nhô ra, biển xanh ở ba phía, sóng trắng quanh chân; có ngọn hải đăng nhỏ không chữ thì tốt; chỉ thấy một đoạn bờ ngắn, không thấy hình dạng cả vùng bờ biển; không ảnh vệ tinh; không người, không chữ, không cờ. Ưu tiên mũi đất Việt Nam nhưng `alt` không nêu tên nơi; tiêu đề ảnh ở nguồn không có tên biển (Quy ước hình số bốn). Từ khoá tìm ảnh (EN): headland aerial sea; cape lighthouse aerial; rocky headland sea
image.alt.en: Land pointing out into the sea
image.alt.vi: Dải đất chìa ra biển
> Bộ mới `set: landforms` (đề xuất ở `_topic.md`; ios-dev thêm khoá `collectible.set.landforms`). Thẻ nối ý chính một (đất gặp biển) và báo trước "đảo có nước bốn phía" của bài 5.
> [CẦN KIỂM] "Mũi đất có biển ở ba phía": định nghĩa phổ thông của mũi đất (cape, headland).
> Ảnh đã chọn (designer 19/11, lệch 14): Cape Schanck (Úc), panorama cắt vuông 525×521 px, hơi mềm; chữ không nêu tên nơi, khớp. Nếu mờ trên iPad thì đổi ảnh.

## Ghi chú cho hoạ sĩ

- **Loại hình:** bài duy nhất của chủ đề có hình vẽ (Duy chốt 19/11). Bốn hình `[hình vẽ]` giấy cắt style E, mục `own` (`method: "drawn"`), credit "Science Kids": `explore_above` (toàn cảnh, ô Học; bản khung 4:3 `q6` cho câu q6 và bài 2 w1, cùng bản vẽ) và ba lựa chọn câu q4 (`q4_only_land`, `q4_land_sea`, `q4_only_water`), cùng nét, cùng bảng màu, cùng góc nhìn. Mọi chỗ khác là ảnh chụp thật (CC0, PD, PDM, CC BY có ghi công).
- **Không:** Trái Đất từ vũ trụ, đường chân trời cong, quả địa cầu, bản đồ, la bàn, ảnh vệ tinh, đường bờ biển giống hình một nước, chữ trong hình (SK-058 khuyến nghị 1, 5).
- **Một câu, một kệ, một loại hình:** kệ Chơi bảy ảnh chụp; câu q1, q3 ba ảnh chụp; câu q4 ba hình vẽ. Hình toàn cảnh `explore_above` không vào câu chọn nào.
- **Ảnh mới (bảy):** `explore_water` (sông uốn qua ruộng, flycam), `tray_mountain` (đỉnh núi dốc), `tray_hill` (đồi tròn thấp), `tray_sea` (biển tới chân trời), `tray_building` (toà nhà cao), `tray_pool` (bể bơi vắng), `cape_card` (mũi đất). Sáu ảnh đầu là **hình gốc của cả chủ đề** (bảng Hình dùng chung ở `_topic.md`): giữ đúng key và `alt`.
- **Chép mục từ Discoverer** (`same_as` không sang nhóm tuổi khác): `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat` `explore_land` → `explore_high` (ô Học, q2, từ `land`). Có thể chép thêm `tray_mountain`, `tray_sea` của bài đó nếu khớp brief (đã ghi ở brief).
- **Dùng lại trong Explorer:** `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha` `w1` (hàng rào tre: hình câu q1, q3, q4); `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien` `q3` (bãi biển, w1); `noi-song-tren-trai-dat/nam-cuc` `explore_land` (w2). Chép mục Discoverer `khung-long/trai-dat-rat-lau-ve-truoc` `q2_rice` (ruộng lúa: ô Flat land, kệ, q1, q3, từ `flat`; *Thời tiết và các mùa* bài 4 cũng chép ảnh này thành `explore_fields`, cùng file ảnh).
- **Bảy ảnh kệ Chơi** cùng kiểu chụp từ xa, mỗi ảnh một nơi; nhìn là biết đất hay nước. Núi khác đồi rõ bằng mắt.
- **Màu:** Học: From up high `cham`, High land `nau_dat`, Flat land `vang_hoe`, Water on land `gi_dong`. Chơi: Đất cao `nau_dat`, Đất bằng `vang_hoe`, Nơi có nước `cham`, Do người làm ra `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (land, sea). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `true_false` (w1 Đúng, w2 Sai). Quiz `single_choice` (q1, q3, q4; ba lựa chọn), `true_false` (q2 Đúng, q5 Sai, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`land_all_flat`). Không có `labels` ở câu `true_false`.
- **Màn Chơi, ví dụ để kiểm:** Ngọn núi, Ruộng lúa, Biển → `balanced`; Quả đồi, Ruộng lúa, Dòng sông → `balanced`; Ngọn núi, Quả đồi, Biển → `missing.tray_flat`; Toà nhà cao, Ruộng lúa, Biển → `has_limited`; Ngọn núi, Ruộng lúa, Bể bơi → `has_limited`.
- **Khởi động trỏ sang chủ đề khác:** w1 → `noi-song-tren-trai-dat/bien-va-dai-duong`, w2 → `noi-song-tren-trai-dat/nam-cuc` (hai bài đã có id).
- **Thẻ thưởng:** `cape_card`, bộ mới `landforms` (cần khoá `collectible.set.landforms`).
- **Hình vẽ:** bốn mục `own` trong file chọn ảnh `content/images/explorer/nui-song-va-bien/dat-lien-va-bien.json`.
- **Từ EN có thể ngoài Starters/Movers:** land, flat, plain, plains, cape, poking, salty, Antarctic, sandy, uphill, stretches, workers. Nghe thử giọng EN đọc "Antarctic", "cape"; giọng VI đọc "Nam Cực", "mênh mông", "thoải".
