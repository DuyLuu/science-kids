---
id: 46e12eab-cb1a-40ff-a7c7-8805efea7f59
topic: cay-quanh-em
slug: cay-can-gi-de-lon
order: 2
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: What plants need to grow
vi: Cây cần gì để lớn?
> Giữ đúng tên ở `content/syllabus.json` (key `identifying-plants-and-their-basic-parts`, bài số hai).

## Mục tiêu
en: I can say what plants need to grow.
vi: Em kể được cây cần gì để lớn.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 18/11/2026. Ticket SK-051. Mọi dòng `id:` để trống; chạy `ids` sau bài 1 (câu w2 trỏ bài 1; nhiều hình dùng lại của bài 1).
> Sườn: gộp bốn lesson Oak Y2 *Growing plants*: L3 `what-plants-need-to-grow-and-stay-healthy` (khung "nước, ánh sáng, hơi ấm"), L5 `plants-without-water` (ô No water), L7 `plants-without-light` (ô No light), L6 `plants-without-warmth` (ô Warmth). Thí nghiệm theo dõi nhiều tuần thành so sánh hai chậu cây (câu q3) và chuỗi "tươi, rũ, khô" (câu q4). Không fair test, không đo, không nhiệt kế.
> Ranh giới với *Sinh vật sống ở đâu?* bài 5 (đã dạy "Plants need water, light and air", nơi sống, xương rồng, sen): bài này nhắc lại nước, ánh sáng, thêm hơi ấm và dấu hiệu khi thiếu. Không dạy lại nơi sống; không câu hỏi xương rồng hay sen; không nói "cây cần đất".
> Sửa `more_water_is_better` ở ví dụ bắt buộc ô No water và câu q6 (gắn key).

## Ý chính
1.en: Plants need water, light and warmth.
1.vi: Cây cần nước, ánh sáng và hơi ấm.
2.en: With no water, a plant wilts.
2.vi: Thiếu nước, cây héo rũ.
3.en: With no light, leaves turn pale.
3.vi: Thiếu ánh sáng, lá vàng nhợt.
> Ý một là khung; ý hai, ba là dấu hiệu nhìn thấy khi thiếu. Hơi ấm chỉ ở ô Warmth và ví dụ (thiếu ấm khó thấy ở Việt Nam).
> Không có "nhiệt độ", "temperature", số độ, nhiệt kế trong chữ bé nghe (SK-051).

## Khởi động

> Hai câu. w1 ôn *Sinh vật sống ở đâu?* bài 5 (cây cần nước), theo SK-051; không dùng xương rồng, sen. w2 ôn bài 1 (bài trước): hạt mọc thành cây; món bẫy bi thuỷ tinh là món bé vừa gặp ở kệ Chơi bài 1.

### w1
id: 924b6679-a0ec-41a8-bb2b-87c6e9d1d5b9
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/noi-song-cua-cay
prompt.en: Plants need water to stay alive.
prompt.vi: Cây cần nước để sống.
image.brief: Dùng lại hình `tray_rice` ở bài `sinh-vat-song-o-dau/noi-song-cua-cay`. Từ khoá tìm ảnh (EN): young rice plants flooded paddy
image.alt.en: Young rice in a wet field
image.alt.vi: Lúa non trên ruộng nước
answer: true
hint.en: Think of rice in a wet field.
hint.vi: Em nghĩ tới cây lúa trên ruộng nước nhé.
explanation_correct.en: Yes! Plants also need light and air.
explanation_correct.vi: Đúng rồi! Cây còn cần ánh sáng và không khí.
explanation_wrong.en: This is true. Plants need water to live.
explanation_wrong.vi: Câu này đúng. Cây cần nước để sống.
feedback_false.en: With no water, plants dry up.
feedback_false.vi: Không có nước, cây sẽ khô héo.
> Câu mới, viết lại ý chính hai của bài nguồn ("Plants need water, light and air."), không chép. `explanation_correct` nhắc lại đủ ý bài nguồn để nối sang ý chính một hôm nay (thêm hơi ấm).

### w2
id: 14d0c275-a5f0-41ca-80a0-80ea4b072192
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: cay-quanh-em/cay-moc-len-tu-hat
prompt.en: Which one can grow into a plant?
prompt.vi: Cái nào có thể mọc thành cây?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of what sprouts in wet soil.
hint.vi: Em nghĩ xem cái gì nảy mầm trong đất ẩm nhé.
explanation_correct.en: Yes! A bean seed sprouts, then grows.
explanation_correct.vi: Đúng rồi! Hạt đậu nảy mầm, rồi lớn lên.
explanation_wrong.en: The answer is the beans. They are seeds.
explanation_wrong.vi: Đáp án là đậu xanh. Đó là hạt.

#### option w2_marble
correct: false
feedback.en: Glass marbles are not alive.
feedback.vi: Bi thuỷ tinh không phải vật sống.
label.en: glass marbles
label.vi: bi thuỷ tinh
image.brief: Dùng lại hình `tray_marble` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): glass marbles close up
image.alt.en: Glass marbles
image.alt.vi: Những viên bi thuỷ tinh

#### option w2_beans
correct: true
label.en: green beans
label.vi: hạt đậu xanh
image.brief: Dùng lại hình `explore_seeds` ở bài `cay-quanh-em/cay-moc-len-tu-hat`. Từ khoá tìm ảnh (EN): mung bean seeds
image.alt.en: Small green beans
image.alt.vi: Đậu xanh nhỏ

## Học

> Bốn ô: điều cây cần (khung), thiếu nước (héo), thiếu ánh sáng (vàng nhợt), hơi ấm. Mỗi ô thiếu có ví dụ "chữa kịp thì cây khoẻ lại" (Oak L5, L7).
> Ô No light nói thân dài ra thì luôn kèm "yếu" (SK-051). Ô No water có ví dụ bắt buộc "too much water is bad, too" (dạy trước câu q6), không giải thích úng rễ.

### explore
id: 4d7d6ca4-2239-4a29-9970-b1940d41c94a
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_needs
label.en: What plants need
label.vi: Cây cần gì
color: gi_dong
sentence.en: Plants need water, light and warmth.
sentence.vi: Cây cần nước, ánh sáng và hơi ấm.
image.brief: [ảnh] Một chậu cây lá xanh tươi, lá vươn thẳng, đặt cạnh cửa sổ có nắng chiếu vào, đất trong chậu hơi ẩm; chụp ngang thấy cả chậu và cây; không người, không chậu có chữ, không chữ. Ảnh vuông hoặc ngang có khoảng trống (khung vuông ô Học, món Chơi, khung 4:3 câu q2, thẻ từ 2:1). Hình gốc của cả chủ đề. Câu q3, q4 dùng bộ chậu vẽ (`q4_fresh`, `explore_wilt`, `q4_dry`), không dùng ảnh này. Từ khoá tìm ảnh (EN): healthy potted plant sunlight; houseplant by sunny window; green potted plant windowsill
image.alt.en: A green plant by a sunny window
image.alt.vi: Chậu cây xanh bên cửa sổ có nắng
examples.1.en: water from rain or a watering can
examples.1.vi: nước mưa hay nước tưới
examples.2.en: light from the Sun
examples.2.vi: ánh sáng Mặt Trời
examples.3.en: warm, sunny days
examples.3.vi: những ngày trời ấm áp
> Không nói "cây cần đất" (sen, bèo sống trong nước). Không lặp "air": bài nguồn đã dạy; `explanation_correct` của w1 nhắc lại.

#### group explore_wilt
label.en: No water
label.vi: Thiếu nước
color: cham
sentence.en: With no water, a plant wilts.
sentence.vi: Thiếu nước, cây héo rũ.
image.brief: [hình vẽ] Một chậu đất nung đặt trên mặt tủ trước cửa sổ có nắng, cây trong chậu héo rũ: thân cong gập, lá còn xanh nhưng cụp rũ xuống; đất trong chậu vẫn sẫm màu như ở `q4_fresh`, dấu hiệu nhìn thấy là lá rũ; vẽ gần thực tế, cùng nét, cùng nền, cùng chậu và cửa sổ với `q4_fresh`, `q4_dry` (bộ ba chậu tươi, rũ, khô); không người, không chữ, không nét viền. Khung vuông ô Học, thẻ `order_sequence`, thẻ hai lựa chọn 17:10, thẻ từ 2:1. Hình gốc của cả chủ đề.
image.alt.en: A drooping plant in a pot
image.alt.vi: Chậu cây rũ lá
examples.1.en: leaves droop and turn dry
examples.1.vi: lá rũ xuống, khô dần
examples.2.en: water it soon, and it stands up
examples.2.vi: tưới kịp, cây lại tươi
examples.3.en: too much water is bad, too
examples.3.vi: tưới quá nhiều nước cũng không tốt
> Ví dụ ba bắt buộc (sửa `more_water_is_better`, dạy trước câu q6). `alt` không có chữ "water" (ảnh là đáp án câu q3 "Which plant needs water?").
> [CẦN KIỂM] Cây thiếu nước được tưới kịp thì tươi lại; tưới quá nhiều nước cũng làm nhiều loại cây yếu (không giải thích úng rễ).

#### group explore_dark
label.en: No light
label.vi: Thiếu ánh sáng
color: vang_hoe
sentence.en: With no light, leaves turn pale.
sentence.vi: Thiếu ánh sáng, lá vàng nhợt.
image.brief: [ảnh] Một đĩa giá đỗ sống trên bàn quán ăn, chụp gần: thân trắng dài, đầu có lá mầm vàng nhạt; mép khung có thể thấy một phần nồi inox và cái nĩa; không bao bì, không tem giá, không người, không chữ. Ảnh ngang có khoảng trống (khung vuông ô Học, món Chơi, thẻ ba lựa chọn 5:2 câu q5, thẻ thưởng vuông). Từ 18/11 câu q2 không dùng ảnh này (tester B1). Hình gốc của cả chủ đề (bài 3 câu w1 dùng lại). Từ khoá tìm ảnh (EN): bean sprouts; mung bean sprouts fresh
image.alt.en: White bean sprouts
image.alt.vi: Giá đỗ trắng
examples.1.en: bean sprouts grow in the dark
examples.1.vi: giá đỗ được ủ trong tối
examples.2.en: stems grow long, but weak
examples.2.vi: thân dài ra nhưng yếu ớt
examples.3.en: back in the light, it gets better
examples.3.vi: đưa ra chỗ sáng, cây khoẻ lại
> Ví dụ hai: thân vươn dài luôn đi kèm "yếu" (SK-051), để bé không hiểu "tối thì cây lớn tốt hơn". Ví dụ một dạy trước câu q2, q5.
> [CẦN KIỂM] Giá đỗ ủ tối thân trắng, dài, lá vàng nhợt; cây thiếu sáng lúc đầu vươn dài nhưng yếu; đưa ra chỗ sáng kịp thì cây khoẻ lại.

#### group explore_warm
label.en: Warmth
label.vi: Hơi ấm
color: nau_dat
sentence.en: Plants grow well when it is warm.
sentence.vi: Trời ấm áp, cây lớn tốt.
image.brief: [ảnh] Những hàng cây non xanh trong nhà kính có mái nilon trong suốt, chụp ngang thấy rõ cây non dưới mái nilon; không người nhìn rõ mặt, không biển, không chữ. Từ khoá tìm ảnh (EN): seedlings in greenhouse; young plants plastic greenhouse
image.alt.en: Young plants under a plastic roof
image.alt.vi: Cây non dưới mái nilon
examples.1.en: farmers cover young plants on cold days
examples.1.vi: trời rét, bà con che nilon cho cây non
examples.2.en: hot midday sun can wilt leaves
examples.2.vi: nắng gắt buổi trưa làm lá rau héo
examples.3.en: the Sun gives light and warmth
examples.3.vi: Mặt Trời cho ánh sáng và hơi ấm
> Ví dụ một là "thiếu ấm", ví dụ hai là "nóng quá" (ý misconception `hotter_is_better` của Oak L6, chỉ là ví dụ, không gắn key). Không nói cây chết rét, không số độ.
> Sửa 18/11 (SK-051 quyết định 14): ảnh designer chọn là cây non trong nhà kính mái nilon, không phải mạ; `alt`, `brief`, ví dụ một đổi "mạ" thành "cây non" cho khớp hình. Bỏ phương án thay "luống rau dưới nắng" (đã có ảnh).
> [CẦN KIỂM] Trời rét, bà con che nilon (nhà kính, vòm nilon) cho cây non; nắng gắt giữa trưa hè làm lá rau héo; ví dụ "thiếu ấm" trẻ ba miền đều hiểu (miền Nam ít rét: ví dụ này có thể lạ với trẻ miền Nam).

### new_words
id: 05b416f2-3eb5-45de-b2bb-d0c3bf6aea91
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: water, light

## Chơi

> Bé nhìn ba cây và nói cây nào cần gì: một cây khoẻ (chậu cây bên cửa sổ hoặc hàng rau non), một cây thiếu nước (cỏ khô mùa khô), một cây thiếu ánh sáng (giá đỗ). Đạt khi đủ ba nhóm và không chọn vật không còn sống.
> Món bẫy: cành cây khô (trông như một phần của cây, nhưng đã chết, không lớn được nữa) và ô tô đồ chơi. Kệ sáu món, toàn ảnh chụp. Nhãn nhóm "No water", "No light" trùng nhãn ô Học (một ý một nhãn).
> Sửa 18/11 (SK-051 quyết định 12): bỏ món chậu cây rũ lá (`tray_wilted`, hình vẽ duy nhất trên kệ, lại là món đúng); thay bằng ảnh chụp cỏ khô mùa khô (`tray_dry_grass`) bé đã gặp ở *Nơi sống trên Trái Đất* bài *Đồng cỏ xavan*. Cỏ khô vàng vì thiếu mưa (thiếu nước), khác cành khô đã chết ở nhóm bẫy: cỏ vẫn sống, có mưa lại xanh.
> [CẦN KIỂM] Cỏ xavan mùa khô vàng úa nhưng gốc vẫn sống, mùa mưa xanh lại (để xếp vào "No water", không vào "Not alive").

### tray
id: 3785a998-2f8c-452e-af58-00fd23c87e49
type: build_tray
version: 1
prompt.en: Find a healthy, dry and pale plant
prompt.vi: Tìm một cây khoẻ, một cây khô héo, một cây vàng nhợt
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Look at the leaves of each plant.
messages.start.vi: Em nhìn lá của từng cây nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! You can see what plants need.
messages.balanced.vi: Tuyệt! Em nhìn ra được cây cần gì rồi.
messages.has_limited.en: That one is not alive.
messages.has_limited.vi: Món này không phải vật sống.
messages.missing.tray_healthy.en: You still need a healthy plant.
messages.missing.tray_healthy.vi: Em còn thiếu một cây khoẻ mạnh.
messages.missing.tray_no_water.en: You still need a plant with no water.
messages.missing.tray_no_water.vi: Em còn thiếu một cây thiếu nước.
messages.missing.tray_no_light.en: You still need a plant with no light.
messages.missing.tray_no_light.vi: Em còn thiếu một cây thiếu ánh sáng.
> Lời nhắn `has_limited` đúng với cả hai món bẫy (cành khô đã chết; ô tô chưa từng sống).

#### group tray_healthy
label.en: Healthy
label.vi: Khoẻ mạnh
color: gi_dong
role: required

#### group tray_no_water
label.en: No water
label.vi: Thiếu nước
color: cham
role: required

#### group tray_no_light
label.en: No light
label.vi: Thiếu ánh sáng
color: vang_hoe
role: required

#### group tray_not_alive
label.en: Not alive
label.vi: Không phải vật sống
color: do_son
role: limit

#### item tray_dry_grass
label.en: Dry grass
label.vi: Cỏ khô
group: tray_no_water
image.brief: Dùng lại hình `explore_dry` ở bài `noi-song-tren-trai-dat/dong-co-xavan`. Từ khoá tìm ảnh (EN): savanna dry season
image.alt.en: Yellow grass in the dry season
image.alt.vi: Cỏ vàng mùa khô

#### item tray_stick
label.en: Dry stick
label.vi: Cành khô
group: tray_not_alive
image.brief: Dùng lại hình `tray_stick` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): dry fallen branch stick ground
image.alt.en: A dry stick on the ground
image.alt.vi: Cành cây khô trên mặt đất

#### item tray_window
label.en: Green plant
label.vi: Chậu cây xanh
group: tray_healthy
image.brief: Dùng lại hình `explore_needs`. Từ khoá tìm ảnh (EN): healthy potted plant sunlight
image.alt.en: A green plant by a sunny window
image.alt.vi: Chậu cây xanh bên cửa sổ có nắng

#### item tray_sprouts
label.en: Bean sprouts
label.vi: Giá đỗ
group: tray_no_light
image.brief: Dùng lại hình `explore_dark`. Từ khoá tìm ảnh (EN): bean sprouts
image.alt.en: White bean sprouts
image.alt.vi: Giá đỗ trắng

#### item tray_car
label.en: Toy car
label.vi: Ô tô đồ chơi
group: tray_not_alive
image.brief: Dùng lại hình `tray_car` ở bài `sinh-vat-song-o-dau/vat-song-hay-khong-song`. Từ khoá tìm ảnh (EN): red plastic toy car side view
image.alt.en: A red toy car
image.alt.vi: Chiếc ô tô đồ chơi màu đỏ

#### item tray_young_plants
label.en: Young plants
label.vi: Hàng rau non
group: tray_healthy
image.brief: Dùng lại hình `explore_plants` ở bài `sinh-vat-song-o-dau/vat-song-hay-khong-song`. Từ khoá tìm ảnh (EN): young vegetable seedlings soil row
image.alt.en: Young plants in the soil
image.alt.vi: Cây non mọc trên đất

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q5 ba lựa chọn; q3 hai lựa chọn), `true_false` (q2 Sai, q6 Sai), `order_sequence` (q4, ba thẻ).
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính. Câu nào cũng tự đủ nghĩa khi chỉ nghe.

### q1
id: 343a30c4-9ac8-408d-8412-bc1401409d70
format: single_choice
version: 1
dok: 1
prompt.en: Which one helps a dry plant?
prompt.vi: Cái gì giúp cây đang khô héo?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of rain on a dry garden.
hint.vi: Em nghĩ tới cơn mưa trên khu vườn khô nhé.
explanation_correct.en: Yes! Water helps it stand up again.
explanation_correct.vi: Đúng rồi! Có nước, cây lại tươi tỉnh.
explanation_wrong.en: The answer is the watering can. It gives water.
explanation_wrong.vi: Đáp án là bình tưới cây. Bình tưới cho cây nước.
> DOK 1: nhớ lại ý chính hai và ví dụ hai ô No water. Lựa chọn sai là hai đồ bé đã gặp ở #5 (khăn len, bóng cao su), khác dáng rõ.

#### option q1_scarf
correct: false
feedback.en: A scarf keeps your neck warm.
feedback.vi: Khăn len giữ ấm cổ cho em.
label.en: scarf
label.vi: khăn len
image.brief: Dùng lại hình `tray_scarf` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): knitted wool scarf
image.alt.en: A knitted scarf
image.alt.vi: Chiếc khăn len

#### option q1_can
correct: true
label.en: watering can
label.vi: bình tưới cây
image.brief: Dùng lại hình `tray_watering_can` ở bài `thoi-tiet-va-cac-mua/mua-mua-va-mua-kho`. Từ khoá tìm ảnh (EN): watering can
image.alt.en: A watering can
image.alt.vi: Bình tưới cây

#### option q1_ball
correct: false
feedback.en: Balls are for playing games.
feedback.vi: Quả bóng để chơi đùa.
label.en: rubber balls
label.vi: bóng cao su
image.brief: Dùng lại hình `tray_ball` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): colourful rubber bouncy balls
image.alt.en: Colourful rubber balls
image.alt.vi: Những quả bóng cao su nhiều màu

### q2
id: bc49254f-8137-4a2e-8aeb-69d2f432176d
format: true_false
version: 1
dok: 1
prompt.en: Plants grow best in the dark.
prompt.vi: Cây lớn tốt nhất ở chỗ tối.
image.brief: Dùng lại hình `explore_needs`. Từ khoá tìm ảnh (EN): healthy potted plant sunlight
image.alt.en: A green plant by a sunny window
image.alt.vi: Chậu cây xanh bên cửa sổ có nắng
answer: false
hint.en: Look where this green plant grows.
hint.vi: Em nhìn xem chậu cây xanh này đặt ở đâu nhé.
explanation_correct.en: Plants need light to grow strong.
explanation_correct.vi: Cây cần ánh sáng để lớn khoẻ.
explanation_wrong.en: This is false. Plants need light.
explanation_wrong.vi: Câu này sai. Cây cần ánh sáng.
feedback_true.en: In the dark, leaves turn pale and weak.
feedback_true.vi: Ở chỗ tối, lá vàng nhợt và yếu.
> DOK 1: nhớ lại ý chính một, ba. Hình là chậu cây xanh bên cửa sổ có nắng (`explore_needs`, vật được nói tới: cây), là bằng chứng cho phía đúng (cây xanh tốt ở chỗ sáng). `explanation_correct` đứng một mình được.
> Sửa 18/11 (tester B1, phương án a): hình đổi từ giá đỗ `explore_dark` sang `explore_needs`, `hint` đổi theo hình. Nội dung câu không cần hình giá đỗ: câu nói về chỗ tối, ảnh cây xanh dưới nắng cho thấy điều ngược lại. Nhờ vậy trước câu q5, giá đỗ chỉ còn ở ô Học và kệ Chơi. Mục chọn ảnh `q2` cần đổi sang `same_as explore_needs` (designer).

### q3
id: 62ce596c-9ac7-42d1-8f98-609d83e3620e
format: single_choice
version: 1
dok: 1
prompt.en: Which plant needs water?
prompt.vi: Cây nào đang cần nước?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look at the leaves.
hint.vi: Em nhìn những chiếc lá nhé.
explanation_correct.en: Yes! Its leaves droop and look dry.
explanation_correct.vi: Đúng rồi! Lá cây rũ xuống, khô dần.
explanation_wrong.en: The answer is the drooping plant. It is dry.
explanation_wrong.vi: Đáp án là chậu cây rũ lá. Cây đang khô.
> DOK 1: so hai chậu cây cạnh nhau (thay cho thí nghiệm của sườn): một cây đủ cả, một cây thiếu nước. Hai lựa chọn, khác nhau rõ bằng mắt (lá thẳng xanh; lá rũ).

#### option q3_green
correct: false
feedback.en: This plant is green and strong.
feedback.vi: Cây này xanh tươi, khoẻ mạnh.
label.en: green plant
label.vi: chậu cây xanh
image.brief: Dùng lại hình `q4_fresh`.
image.alt.en: A green plant by a sunny window
image.alt.vi: Chậu cây xanh bên cửa sổ có nắng

#### option q3_wilted
correct: true
label.en: drooping plant
label.vi: chậu cây rũ lá
image.brief: Dùng lại hình `explore_wilt`.
image.alt.en: A drooping plant in a pot
image.alt.vi: Chậu cây rũ lá

### q4
id: 0b7e0a85-6739-41f8-a449-ba69bd1f16aa
format: order_sequence
version: 1
dok: 2
prompt.en: Nobody waters it. Start with the fresh plant.
prompt.vi: Không ai tưới cây. Em xếp từ lúc cây còn tươi nhé.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_fresh, q4_drooping, q4_dry
hint.en: A plant dries a little more each day.
hint.vi: Mỗi ngày, cây lại khô thêm một chút.
explanation_correct.en: Yes! Water it early, before it dries.
explanation_correct.vi: Đúng rồi! Em nhớ tưới sớm, trước khi cây khô.
explanation_wrong.en: The order is fresh, drooping, then dry.
explanation_wrong.vi: Thứ tự là tươi, rũ lá, rồi khô héo.
> DOK 2: xếp ba dáng cây theo thời gian không được tưới (Oak L5: một ngày, một tuần, một tháng; chữ bé nghe không nói số ngày). Đúng một thứ tự. `prompt` nêu thẻ đầu; gợi ý là cách nghĩ, không gọi tên ba thẻ. Thẻ trong file không theo thứ tự đúng.
> Ba thẻ là bộ hình vẽ cùng chậu, cùng cửa sổ (SK-051 quyết định 10, 12): `q4_fresh`, `explore_wilt`, `q4_dry`. Bỏ phương án thay `single_choice` (18/11, không cần nữa).
> [CẦN KIỂM] Cây không được tưới lâu dần: rũ lá rồi khô nâu, giòn.

#### item q4_drooping
label.en: drooping plant
label.vi: chậu cây rũ lá
image.brief: Dùng lại hình `explore_wilt`.
image.alt.en: A drooping plant in a pot
image.alt.vi: Chậu cây rũ lá

#### item q4_dry
label.en: dry plant
label.vi: chậu cây khô héo
image.brief: [hình vẽ] Cùng chậu đất nung, cùng mặt tủ trước cửa sổ có nắng với `q4_fresh`, `explore_wilt`: cây đã khô héo hẳn, thân nâu cong gập, lá nâu khô rũ xuống; đất trong chậu màu nâu nhạt; vành chậu có vài vết nứt nhỏ; hai lá khô rơi ở mặt trước tủ, dưới chậu; vẽ gần thực tế, cùng nét, cùng nền; không người, không chữ, không nét viền. Thẻ `order_sequence` vuông.
image.alt.en: A dry brown plant in a pot
image.alt.vi: Chậu cây khô nâu

#### item q4_fresh
label.en: fresh plant
label.vi: chậu cây tươi
image.brief: [hình vẽ] Một chậu đất nung đặt trên mặt tủ trước cửa sổ có nắng, cây trong chậu xanh tươi: thân thẳng, lá xanh đậm vươn lên, đất trong chậu sẫm màu ẩm; vẽ gần thực tế, cùng nét, cùng nền, cùng chậu và cửa sổ với `explore_wilt`, `q4_dry`; không người, không chữ, không nét viền. Thẻ `order_sequence` vuông và thẻ hai lựa chọn 17:10 câu q3. Hình gốc trong bài (câu q3 dùng lại).
image.alt.en: A green plant by a sunny window
image.alt.vi: Chậu cây xanh bên cửa sổ có nắng

### q5
id: b3c9e98d-67ce-40bd-8c2c-d5a19a0dad58
format: single_choice
version: 1
dok: 2
prompt.en: Look closely. Which plant grew in the dark?
prompt.vi: Em nhìn kỹ nhé. Cây nào đã lớn lên ở chỗ tối?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Plants in the sun stay green.
hint.vi: Cây ở chỗ có nắng thì lá vẫn xanh.
explanation_correct.en: Yes! Bean sprouts grow pale in the dark.
explanation_correct.vi: Đúng rồi! Giá đỗ ủ trong tối nên trắng nhợt.
explanation_wrong.en: The answer is the bean sprouts. They are pale.
explanation_wrong.vi: Đáp án là giá đỗ. Giá đỗ trắng nhợt.
> DOK 2: suy từ dấu hiệu (thân trắng nhợt) ra nguyên nhân (thiếu sáng). Câu hỏi nói nguyên nhân ("grew in the dark"), ba thẻ chỉ cho thấy dấu hiệu (màu thân, màu lá); bé phải nối dấu hiệu với nguyên nhân. Hai lựa chọn sai là cây xanh dưới nắng bé đã gặp. Gợi ý nhắc cách nghĩ, không gọi tên giá đỗ, không tả đáp án.
> Sửa 18/11 (SK-051 quyết định 11): đáp án đổi từ cỏ vàng dưới tấm bạt (không có ảnh hợp giấy phép) sang giá đỗ (`q5_sprouts`, ảnh `explore_dark`). Cả ba lựa chọn là ảnh chụp bé đã gặp, không có ảnh mới lộ đáp án.
> Sửa 18/11 lượt 2 (tester B1, phiên chính chọn phương án a): câu q2 không dùng ảnh giá đỗ nữa, nên trước câu này giá đỗ chỉ còn ở ô Học (nhóm No light) và kệ Chơi (nhóm No light). Chừng đó chưa đủ DOK 2: `prompt` cũ "Which plant had no light for days?" trùng nhãn "No light", bé chỉ cần nhớ ảnh nằm ở nhóm nào. Vì vậy đổi `prompt` sang "Look closely. Which plant grew in the dark?" (tám từ): câu không nhắc nhãn, bắt bé nhìn dấu hiệu (lá, thân nhợt hay xanh) rồi suy ra cây nào đã ở chỗ tối. `hint` đổi thành cách loại trừ ("cây ở chỗ có nắng thì lá vẫn xanh"): hai lựa chọn sai xanh tươi, bé loại hai cây được nắng, còn lại cây nhợt. Không gọi tên giá đỗ, không tả đáp án. Giữ ba lựa chọn, key, DOK 2.
> Còn lại: ô Học ví dụ một "bean sprouts grow in the dark" vẫn cho bé đường nhớ lại. Nếu PM muốn DOK 2 chắc chắn, phương án (b) của tester là đổi đáp án sang một ảnh cây nhợt khác chưa gắn nhãn (cần ảnh mới).

#### option q5_young
correct: false
feedback.en: These young plants are green and strong.
feedback.vi: Hàng rau non này xanh và khoẻ.
label.en: young plants
label.vi: hàng rau non
image.brief: Dùng lại hình `explore_plants` ở bài `sinh-vat-song-o-dau/vat-song-hay-khong-song`. Từ khoá tìm ảnh (EN): young vegetable seedlings soil row
image.alt.en: Young plants in the soil
image.alt.vi: Cây non mọc trên đất

#### option q5_sprouts
correct: true
label.en: bean sprouts
label.vi: giá đỗ
image.brief: Dùng lại hình `explore_dark`. Từ khoá tìm ảnh (EN): bean sprouts
image.alt.en: White bean sprouts
image.alt.vi: Giá đỗ trắng

#### option q5_rice
correct: false
feedback.en: This rice is green in the sun.
feedback.vi: Lúa này xanh tốt dưới nắng.
label.en: rice plants
label.vi: cây lúa
image.brief: Dùng lại hình `tray_rice` ở bài `sinh-vat-song-o-dau/noi-song-cua-cay`. Từ khoá tìm ảnh (EN): young rice plants flooded paddy
image.alt.en: Young rice in a wet field
image.alt.vi: Lúa non trên ruộng nước

### q6
id: 396ce910-beee-4155-9688-77a7bc105de0
format: true_false
version: 1
dok: 2
misconception: more_water_is_better
prompt.en: The more water, the better for plants.
prompt.vi: Tưới càng nhiều nước, cây càng tốt.
image.brief: Dùng lại hình `tray_watering_can` ở bài `thoi-tiet-va-cac-mua/mua-mua-va-mua-kho`. Từ khoá tìm ảnh (EN): watering can
image.alt.en: A watering can
image.alt.vi: Bình tưới cây
answer: false
hint.en: Think of a pot that stays soaking wet.
hint.vi: Em nghĩ tới chậu cây lúc nào cũng sũng nước nhé.
explanation_correct.en: Too much water makes plants weak, too.
explanation_correct.vi: Tưới quá nhiều nước, cây cũng yếu.
explanation_wrong.en: This is false. Too much water is bad.
explanation_wrong.vi: Câu này sai. Tưới quá nhiều cũng không tốt.
feedback_true.en: Some plants need only a little water.
feedback_true.vi: Có cây chỉ cần một chút nước.
> Câu misconception (`more_water_is_better`), DOK 2: bé vừa học "thiếu nước thì héo" dễ suy ra "càng nhiều càng tốt" và chạm Đúng. Bé áp ví dụ ba ô No water để bác câu nói. Câu chỉ kiểm một việc: nhiều nước hơn có luôn tốt hơn không.
> Hình là bình tưới cây (vật được nói tới), không có chậu cây úng hay cây khô, nên không tự làm bằng chứng cho phía nào. `explanation_correct` là đúng câu `correction` ở `_topic.md`. Không giải thích úng rễ; `feedback_true` không nêu xương rồng (ranh giới với *Sinh vật sống ở đâu?* bài 5).

## Từ vựng

### water
id: 8c4f6c9a-00bb-4639-a1ca-195ea3a0c630
tier: core
term.en: water
term.vi: nước
example.en: Plants need water to grow.
example.vi: Cây cần nước để lớn.
image.brief: Dùng lại hình `tray_watering_can` ở bài `thoi-tiet-va-cac-mua/mua-mua-va-mua-kho`. Từ khoá tìm ảnh (EN): watering can
image.alt.en: A watering can
image.alt.vi: Bình tưới cây

### light
id: 17d27177-9c49-4282-a1ac-22e9e5ba6d31
tier: core
term.en: light
term.vi: ánh sáng
example.en: Plants need light from the Sun.
example.vi: Cây cần ánh sáng Mặt Trời.
image.brief: Dùng lại hình `explore_needs`. Từ khoá tìm ảnh (EN): healthy potted plant sunlight
image.alt.en: A green plant by a sunny window
image.alt.vi: Chậu cây xanh bên cửa sổ có nắng

### warm
id: 5ed31603-d61c-4434-9afe-cf2121abbe80
tier: extra
term.en: warm
term.vi: ấm
example.en: Plants grow well on warm days.
example.vi: Ngày ấm áp, cây lớn tốt.
image.brief: Dùng lại hình `explore_warm`. Từ khoá tìm ảnh (EN): seedlings in greenhouse
image.alt.en: Young plants under a plastic roof
image.alt.vi: Cây non dưới mái nilon
> Trùng có chủ ý với từ `core` `warm` của *Thời tiết và các mùa* bài 6 (`thoi-tiet-va-cac-mua/mua-lai-ve`); ở bài này là `extra`, nói về hơi ấm giúp cây lớn. App không gộp thẻ theo chữ (bộ thẻ theo bài, nhận theo `id`).

### wilt
id: 15d70043-b956-4801-9d58-db82d9249ce8
tier: extra
term.en: wilt
term.vi: héo
example.en: A dry plant will wilt and droop.
example.vi: Cây khô nước sẽ héo rũ.
image.brief: Dùng lại hình `explore_wilt`.
image.alt.en: A drooping plant in a pot
image.alt.vi: Chậu cây rũ lá

## Thưởng

### bean_sprout_card
id: 2f42589a-bf37-4c4d-bc45-5560c90b7c71
set: plants
rarity: common
name.en: Bean sprouts
name.vi: Giá đỗ
tag.en: Grown in the dark
tag.vi: Ủ trong bóng tối
fact.en: Bean sprouts grow from mung bean seeds.
fact.vi: Giá đỗ mọc lên từ hạt đậu xanh.
image.brief: Dùng lại hình `explore_dark`. Từ khoá tìm ảnh (EN): bean sprouts
image.alt.en: White bean sprouts
image.alt.vi: Giá đỗ trắng
> Thẻ nối bài 1 (hạt đậu xanh) với bài 2 (thiếu ánh sáng). Món ăn quen ở mâm cơm.
> [CẦN KIỂM] Giá đỗ phần lớn ủ từ hạt đậu xanh (cũng có giá đậu nành); miền Nam gọi "giá"; nghe thử "giá đỗ", "mung bean".

## Ghi chú cho hoạ sĩ

- **Loại hình:** ảnh chụp thật, trừ bộ ba chậu cây vẽ (SK-051 quyết định 10, 12). Không người nhìn rõ mặt; chậu cây không chữ, không nhãn; giá đỗ không bao bì, không tem giá.
- **Hình vẽ (đã vẽ, mục `own`, `changes: ["drawn"]`, credit "Science Kids"):** cùng chậu đất nung, cùng mặt tủ trước cửa sổ có nắng, gần thực tế, không chữ: chậu cây rũ lá (`explore_wilt`, hình gốc cả chủ đề: ô Học, q3, q4, từ `wilt`), chậu cây tươi (`q4_fresh`: q4, q3), chậu cây khô nâu (`q4_dry`: q4). Kệ Chơi không có hình vẽ nào.
- **Ảnh mới, hình gốc của cả chủ đề (giữ đúng key, `alt`, truy vấn đầu ở `_topic.md`):** chậu cây xanh bên cửa sổ có nắng (`explore_needs`: ô Học, kệ Chơi, q2, từ `light`), giá đỗ (`explore_dark`: ô Học, kệ Chơi, q5, thẻ). Sửa 18/11 lượt 2: hình câu q2 đổi từ `explore_dark` sang `explore_needs` (tester B1); mục chọn ảnh `q2` đổi `same_as` theo.
- **Ảnh mới chỉ dùng ở bài này:** cây non dưới mái nilon nhà kính (`explore_warm`, từ `warm`).
- **Ảnh dùng lại:** bài 1 `explore_seeds` (w2); *Sinh vật sống ở đâu?* bài 1 `explore_plants`, `tray_car`, bài 3 `tray_marble`, `tray_stick`, bài 5 `tray_rice`; *Thời tiết và các mùa* bài 1 `tray_scarf`, `tray_ball`, bài 4 `tray_watering_can`; *Gọi tên và nhóm động vật* bài 1 `w1` (hàng rào tre); *Nơi sống trên Trái Đất* bài 6 `explore_dry` (cỏ vàng mùa khô, món `tray_dry_grass`, trỏ thẳng mục gốc ở `noi-song-tren-trai-dat/dong-co-xavan`).
- **Không trộn kiểu hình trong một câu, một kệ:** câu q3 hai thẻ vẽ, câu q4 ba thẻ vẽ; câu q5 ba ảnh chụp; kệ Chơi sáu ảnh chụp.
- **Màu:** Học: cây cần gì `gi_dong`, thiếu nước `cham`, thiếu ánh sáng `vang_hoe`, hơi ấm `nau_dat`. Chơi: khoẻ mạnh `gi_dong`, thiếu nước `cham`, thiếu ánh sáng `vang_hoe`, không phải vật sống `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (water, light). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, sáu món. Khởi động `true_false` (w1 Đúng), `single_choice` (w2, hai lựa chọn). Quiz `single_choice` (q1, q5 ba lựa chọn; q3 hai lựa chọn), `true_false` (q2 Sai, q6 Sai), `order_sequence` (q4). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`more_water_is_better`). Không có `labels` ở câu `true_false`.
- **`order_sequence` q4:** thứ tự đúng `q4_fresh`, `q4_drooping`, `q4_dry`.
- **Màn Chơi, ví dụ để kiểm:** Chậu cây xanh, Cỏ khô, Giá đỗ → `balanced`; Hàng rau non, Cỏ khô, Giá đỗ → `balanced`; Chậu cây xanh, Hàng rau non, Giá đỗ → `missing.tray_no_water`; Cành khô, Cỏ khô, Giá đỗ → `has_limited`.
- **Key đổi 18/11:** món kệ `tray_wilted` → `tray_dry_grass`; lựa chọn q5 `q5_grass` → `q5_sprouts`.
- **Đổi 18/11 lượt 2 (không đổi key):** hình câu q2 dùng lại `explore_needs` (trước là `explore_dark`); q5 đổi `prompt`, `hint`.
- **Khởi động trỏ:** w1 → `sinh-vat-song-o-dau/noi-song-cua-cay` (đã có id), w2 → `cay-quanh-em/cay-moc-len-tu-hat` (bài 1 phải có id trước).
- **Thưởng:** bộ `set: plants`.
- **Từ EN có thể ngoài Starters/Movers:** warmth, wilt, droop, pale, bean sprouts, watering can, scarf, rice, soaking, plastic roof, mung bean, dry season.
