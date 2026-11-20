---
id: 97e16d94-740d-47e0-9fb2-23f953d04176
topic: cay-quanh-em
slug: rau-qua-ta-an-la-phan-nao-cua-cay
order: 5
stage: apply
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Plant parts we eat
vi: Rau quả ta ăn là phần nào của cây?
> Giữ đúng tên ở `content/syllabus.json` (key `identifying-plants-and-their-basic-parts`, bài số năm, `extension: true`).

## Mục tiêu
en: I can tell which plant part we eat.
vi: Em nói được mình ăn bộ phận nào của cây.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 18/11/2026. Ticket SK-051. Mọi dòng `id:` để trống; chạy `ids` sau bài 4 (câu w1 trỏ bài 4; hình dùng lại của bài 4).
> Bài mới (`extension: true`, không có lesson Oak). Ý lấy từ starter quiz Oak Y2 L1, L3 (rau ta ăn đều từ cây; ăn được một số phần của cây). Bài vận dụng (`apply`): dùng bộ phận của bài 3, 4 cho mâm cơm, thêm quả và hạt.
> Mỗi rau quả chỉ gắn một bộ phận như bảng ở `_topic.md` mục Đúng khoa học. Rau muống chỉ ở ô Stems and leaves (ăn cả thân lẫn lá), không làm lựa chọn gắn một bộ phận. Không khoai tây, khoai lang, hành, gừng. Nói "hạt lạc", không "củ lạc". Cà chua là "quả".
> An toàn: không câu nào rủ bé nếm, ăn thứ lạ; rau quả là món người lớn nấu, người lớn đưa (ví dụ ô Flowers).
> Sửa `food_not_from_plants` ở ý chính một, ô Roots, câu q1 và câu q6 (gắn key).

## Ý chính
1.en: Vegetables and fruit come from plants.
1.vi: Rau và quả đều từ cây mà ra.
2.en: We eat roots, stems and leaves.
2.vi: Ta ăn rễ, thân và lá của cây.
3.en: We eat flowers, fruits and seeds, too.
3.vi: Ta còn ăn hoa, quả và hạt.
> Ý một đổi từ "The food we eat comes from plants." ở "Bảng soạn" (sai khoa học: thịt, trứng, cá không từ cây; phần Chơi dùng chính ý này làm bẫy). Bản VI giữ ý câu Duy chốt ("rau quả ta ăn đều từ cây mà ra").
> Từ cụ thể tới trừu tượng: mâm cơm quen, rồi xếp từng món vào bộ phận cây, từ dưới đất (rễ) lên tới hoa, quả, hạt.

## Khởi động

> Hai câu. w1 ôn bài 4 (bài trước): nụ, hoa, quả trên dây bí. w2 ôn *Cơ thể của em* bài 6 (mốc dài; ô Taste: vị chua), nối sang rau quả hôm nay.

### w1
id: 06fa8cea-420a-4a53-b5c0-67f4912a37ce
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: cay-quanh-em/cay-co-hoa-re-than-la-hoa
prompt.en: What comes after the flower?
prompt.vi: Sau bông hoa là gì?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of the pumpkin vine.
hint.vi: Em nghĩ tới dây bí nhé.
explanation_correct.en: Yes! A flower turns into a fruit.
explanation_correct.vi: Đúng rồi! Hoa dần thành quả.
explanation_wrong.en: The answer is the young pumpkin. It is fruit.
explanation_wrong.vi: Đáp án là quả bí non. Đó là quả.

#### option w1_bud
correct: false
feedback.en: A bud comes before the flower.
feedback.vi: Nụ có trước khi hoa nở.
label.en: pumpkin bud
label.vi: nụ hoa bí
image.brief: Dùng lại hình `tray_bud` ở bài `cay-quanh-em/cay-co-hoa-re-than-la-hoa`. Từ khoá tìm ảnh (EN): pumpkin flower bud
image.alt.en: Closed yellow petals on a vine
image.alt.vi: Cánh vàng còn khép trên dây bí

#### option w1_pumpkin
correct: true
label.en: young pumpkin
label.vi: quả bí non
image.brief: Dùng lại hình `q4_pumpkin` ở bài `cay-quanh-em/cay-co-hoa-re-than-la-hoa`. Từ khoá tìm ảnh (EN): young pumpkin on vine
image.alt.en: A small pumpkin on the vine
image.alt.vi: Quả bí non trên dây

### w2
id: 33c9c75d-0a9a-40f8-82a0-78239c5ccc3b
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: co-the-cua-em/nem-va-so
prompt.en: A lime tastes sweet.
prompt.vi: Quả chanh có vị ngọt.
image.brief: Dùng lại hình `tray_lime` ở bài `co-the-cua-em/nam-giac-quan-cua-em`. Từ khoá tìm ảnh (EN): lime cut in half wooden board
image.alt.en: A lime cut in half
image.alt.vi: Quả chanh cắt đôi
answer: false
hint.en: Think of a glass of lime juice.
hint.vi: Em nghĩ tới cốc nước chanh nhé.
explanation_correct.en: A lime tastes sour.
explanation_correct.vi: Quả chanh có vị chua.
explanation_wrong.en: This is false. A lime is sour.
explanation_wrong.vi: Câu này sai. Chanh có vị chua.
feedback_true.en: Sugar and ripe mangoes taste sweet.
feedback_true.vi: Đường và xoài chín mới có vị ngọt.
> Câu mới, khác câu q1 "Which one tastes sour?" của bài nguồn. Câu nói về vị bé đã học, không rủ bé nếm.

## Học

> Bốn ô theo ba ý chính: rễ (cà rốt), thân và lá (rau muống), hoa (súp lơ), quả và hạt (cà chua). Mỗi ô một ảnh, các món khác ở ví dụ.
> Ô Roots sửa `food_not_from_plants` (dạy trước câu q6). Ô Flowers có hai ví dụ an toàn: người lớn nấu, em chỉ ăn món người lớn đưa.

### explore
id: 62ae93f6-1c7e-4419-b51a-f35b36f0c2ec
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_eat_roots
label.en: Roots
label.vi: Rễ
color: vang_hoe
sentence.en: A carrot is the root of a plant.
sentence.vi: Cà rốt là rễ của cây.
image.brief: [ảnh] Hai, ba củ cà rốt còn nguyên chùm lá xanh, đặt trên nền gỗ hay nền trơn, chụp ngang thấy cả củ và lá; không tem, không túi, không chữ, không người. Ảnh ngang (khung vuông ô Học, món Chơi, thẻ ba lựa chọn 5:2, thẻ từ 2:1). Hình gốc của cả chủ đề (bài 6 câu w1 dùng lại). Từ khoá tìm ảnh (EN): carrot with leaves; carrots with green tops; fresh carrots tops
image.alt.en: Carrots with green leaves
image.alt.vi: Cà rốt còn lá xanh
examples.1.en: white radish is a root, too
examples.1.vi: củ cải trắng cũng là rễ
examples.2.en: it grows under the soil
examples.2.vi: cà rốt lớn lên dưới đất
examples.3.en: the green leaves stay above
examples.3.vi: lá xanh ở trên mặt đất
> Ô sửa `food_not_from_plants`: câu chính là đúng câu `correction` ở `_topic.md`. Ảnh có lá để bé thấy cà rốt là một phần của cây. `alt` không có chữ "root" (ảnh là đáp án câu q1).
> [CẦN KIỂM] Cà rốt, củ cải trắng là rễ (rễ củ).

#### group explore_eat_leaves
label.en: Stems and leaves
label.vi: Thân và lá
color: gi_dong
sentence.en: We eat some stems and leaves.
sentence.vi: Mình ăn thân và lá của một số cây.
image.brief: [ảnh] Một bó rau muống tươi, thân xanh dài và lá nhọn, đặt trên nền tre hay nền trơn, chụp ngang; không dây buộc có chữ, không tem, không chữ, không người. Ảnh ngang (khung vuông ô Học, thẻ từ 2:1). Từ khoá tìm ảnh (EN): water spinach; Ipomoea aquatica bunch; morning glory vegetable
image.alt.en: A bunch of water spinach
image.alt.vi: Bó rau muống
examples.1.en: water spinach stems and leaves
examples.1.vi: rau muống: mình ăn cả thân lẫn lá
examples.2.en: sugarcane is a sweet stem
examples.2.vi: cây mía là thân cây ngọt
examples.3.en: lettuce and mustard greens are leaves
examples.3.vi: xà lách và rau cải là lá
> Rau muống ở ô này vì mình ăn cả thân lẫn lá non (SK-051 "Câu hỏi còn mở": không gắn rau muống với một bộ phận). Ví dụ hai dạy trước câu q2; ví dụ ba dạy trước lựa chọn rau cải câu q3, q5.
> [CẦN KIỂM] Rau muống: ta ăn thân và lá non; mía là thân; xà lách, rau cải là lá.

#### group explore_eat_flowers
label.en: Flowers
label.vi: Hoa
color: cham
sentence.en: Cauliflower is a bunch of flower buds.
sentence.vi: Súp lơ là một chùm nụ hoa.
image.brief: [ảnh] Một cây súp lơ trắng còn lá xanh bao quanh, đặt trên nền trơn, chụp gần từ trên chếch xuống thấy rõ chùm nụ trắng; không tem, không bọc ni lông, không chữ. Ảnh ngang (khung vuông ô Học, món Chơi, thẻ ba lựa chọn 5:2, thẻ từ 2:1). Từ khoá tìm ảnh (EN): cauliflower; whole cauliflower leaves
image.alt.en: A white cauliflower
image.alt.vi: Cây súp lơ trắng
examples.1.en: pumpkin flowers, too
examples.1.vi: cả hoa bí nữa
examples.2.en: a grown-up cooks them for you
examples.2.vi: người lớn nấu chín cho em
examples.3.en: eat only what a grown-up gives
examples.3.vi: em chỉ ăn món người lớn đưa
> Chữ "bud" bé đã học ở bài 4. Ví dụ hai, ba là lời dặn an toàn (SK-051: không rủ bé ăn hoa lạ).
> [CẦN KIỂM] Súp lơ là chùm nụ hoa; hoa bí ăn được (xào, nấu canh).

#### group explore_eat_fruits
label.en: Fruits and seeds
label.vi: Quả và hạt
color: nau_dat
sentence.en: A tomato is a fruit with seeds inside.
sentence.vi: Cà chua là quả, bên trong có hạt.
image.brief: [ảnh] Một cây cà chua trong vườn có chùm quả đỏ và quả xanh trên cành, lá xanh xung quanh, chụp gần; không tay, không cọc có chữ, không chữ. Ảnh ngang (khung vuông ô Học, thẻ từ 2:1). Từ khoá tìm ảnh (EN): tomato plant fruit; tomatoes on vine; tomato plant red green
image.alt.en: Tomatoes on the plant
image.alt.vi: Quả cà chua trên cây
examples.1.en: bananas, oranges and mangoes are fruits
examples.1.vi: chuối, cam, xoài là quả
examples.2.en: peanuts and beans are seeds
examples.2.vi: hạt lạc, hạt đậu là hạt
examples.3.en: lotus seeds in sweet soup
examples.3.vi: hạt sen nấu chè
> Cà chua là "quả" dù hay gọi là rau (SK-051). Nói "hạt lạc", không "củ lạc". Ví dụ một dạy trước câu q5 (xoài là quả); ví dụ hai dạy trước câu q3.
> [CẦN KIỂM] Cà chua, chuối, cam, xoài là quả; hạt lạc, hạt đậu, hạt sen là hạt (người Việt quen gọi "củ lạc"; quả lạc mọc dưới đất).

### new_words
id: d472c995-71ce-41d6-8b2d-76f201b3e895
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: vegetable, fruit

## Chơi

> Bé bày mâm cơm có ba bộ phận của cây: một món là rễ (cà rốt hoặc củ cải trắng), một món là hoa (súp lơ hoặc hoa bí), một món là hạt (hạt lạc hoặc hạt sen). Đạt khi đủ ba nhóm và không chọn món có từ con vật.
> Món bẫy: trứng, cá: cũng là món trong mâm cơm, nhưng có từ con vật (vì vậy ý chính một nói "rau và quả", không nói "thức ăn"). Kệ tám món, toàn ảnh chụp.

### tray
id: fe51e03e-3ffe-4a68-b724-56de74f199d9
type: build_tray
version: 1
prompt.en: Make a meal with three plant parts
prompt.vi: Làm mâm cơm có ba bộ phận của cây
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Choose a root, a flower and a seed.
messages.start.vi: Em chọn một món là rễ, một món là hoa, một món là hạt nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! These three foods come from plants.
messages.balanced.vi: Tuyệt! Ba món này đều từ cây mà ra.
messages.has_limited.en: That food comes from an animal.
messages.has_limited.vi: Món này có từ con vật.
messages.missing.tray_roots.en: You still need a root.
messages.missing.tray_roots.vi: Em còn thiếu một món là rễ.
messages.missing.tray_flowers.en: You still need a flower.
messages.missing.tray_flowers.vi: Em còn thiếu một món là hoa.
messages.missing.tray_seeds.en: You still need some seeds.
messages.missing.tray_seeds.vi: Em còn thiếu một món là hạt.
> Lời nhắn `has_limited` đúng với cả hai món bẫy.

#### group tray_roots
label.en: Root
label.vi: Rễ
color: vang_hoe
role: required

#### group tray_flowers
label.en: Flower
label.vi: Hoa
color: cham
role: required

#### group tray_seeds
label.en: Seed
label.vi: Hạt
color: nau_dat
role: required

#### group tray_animal
label.en: From animals
label.vi: Có từ con vật
color: do_son
role: limit

#### item tray_peanuts
label.en: Peanuts
label.vi: Hạt lạc
group: tray_seeds
image.brief: [ảnh] Một nắm lạc còn vỏ, vài quả bóc vỏ lộ hạt đỏ hồng, trên nền trơn hay mẹt tre, chụp gần; không túi, không chữ. Ảnh vuông hoặc ngang (món Chơi, thẻ ba lựa chọn 5:2 câu q3). Từ khoá tìm ảnh (EN): peanuts in shell; raw peanuts shelled
image.alt.en: Peanuts in their shells
image.alt.vi: Lạc còn nguyên vỏ

#### item tray_carrot
label.en: Carrots
label.vi: Cà rốt
group: tray_roots
image.brief: Dùng lại hình `explore_eat_roots`. Từ khoá tìm ảnh (EN): carrot with leaves
image.alt.en: Carrots with green leaves
image.alt.vi: Cà rốt còn lá xanh

#### item tray_eggs
label.en: Eggs
label.vi: Trứng
group: tray_animal
image.brief: Dùng lại hình `explore_eggs` ở bài `goi-ten-va-nhom-dong-vat/chim-va-bo-sat`. Từ khoá tìm ảnh (EN): hen eggs straw nest
image.alt.en: Eggs in a nest of straw
image.alt.vi: Trứng trong ổ rơm

#### item tray_cauliflower
label.en: Cauliflower
label.vi: Súp lơ
group: tray_flowers
image.brief: Dùng lại hình `explore_eat_flowers`. Từ khoá tìm ảnh (EN): cauliflower
image.alt.en: A white cauliflower
image.alt.vi: Cây súp lơ trắng

#### item tray_lotus_seeds
label.en: Lotus seeds
label.vi: Hạt sen
group: tray_seeds
image.brief: [ảnh] Một bát nhỏ hay một nắm hạt sen tươi màu trắng ngà, đã bóc vỏ xanh, chụp gần; không túi, không chữ. Ảnh vuông. Từ khoá tìm ảnh (EN): lotus seeds fresh; lotus seeds bowl
image.alt.en: White lotus seeds
image.alt.vi: Hạt sen trắng

#### item tray_radish
label.en: White radish
label.vi: Củ cải trắng
group: tray_roots
image.brief: [ảnh] Một, hai củ cải trắng dài còn chùm lá xanh, nền trơn, chụp ngang; không tem, không chữ. Khác cà rốt rõ bằng màu (trắng, không cam). Ảnh ngang (món Chơi, thẻ ba lựa chọn 5:2 câu q4). Từ khoá tìm ảnh (EN): daikon radish; white radish with leaves
image.alt.en: A long white radish
image.alt.vi: Củ cải trắng dài

#### item tray_fish
label.en: Fish
label.vi: Cá
group: tray_animal
image.brief: Dùng lại hình `q4_fish` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): small fish swimming shallow water
image.alt.en: Small fish in water
image.alt.vi: Cá nhỏ dưới nước

#### item tray_pumpkin_flower
label.en: Pumpkin flower
label.vi: Hoa bí
group: tray_flowers
image.brief: Dùng lại hình `tray_pumpkin_flower` ở bài `cay-quanh-em/cay-co-hoa-re-than-la-hoa`. Từ khoá tìm ảnh (EN): pumpkin flower
image.alt.en: An open yellow flower on a vine
image.alt.vi: Bông hoa vàng đã nở trên dây

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1, q3, q4, q5; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai).
> Hình câu `single_choice` là hàng rào tre trung tính. Câu nào cũng tự đủ nghĩa khi chỉ nghe.
> Không dùng `order_sequence`: bộ phận ta ăn không có thứ tự tự nhiên (như *Gọi tên và nhóm động vật* bài 6).

### q1
id: 7a153058-b6cb-493b-9d17-f330c470d37e
format: single_choice
version: 1
dok: 1
prompt.en: Which one is a root we eat?
prompt.vi: Món nào là rễ cây mình ăn?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of what grows under the soil.
hint.vi: Em nghĩ xem phần nào lớn lên dưới đất nhé.
explanation_correct.en: Yes! A carrot grows under the soil.
explanation_correct.vi: Đúng rồi! Cà rốt lớn lên dưới đất.
explanation_wrong.en: The answer is the carrot. It is a root.
explanation_wrong.vi: Đáp án là cà rốt. Cà rốt là rễ.
> DOK 1: nhớ lại câu chính ô Roots. Ba lựa chọn khác màu, khác dáng rõ (cam có lá; trắng chùm nụ; đỏ trên cây).

#### option q1_cauliflower
correct: false
feedback.en: Cauliflower is a bunch of flower buds.
feedback.vi: Súp lơ là một chùm nụ hoa.
label.en: cauliflower
label.vi: súp lơ
image.brief: Dùng lại hình `explore_eat_flowers`. Từ khoá tìm ảnh (EN): cauliflower
image.alt.en: A white cauliflower
image.alt.vi: Cây súp lơ trắng

#### option q1_carrot
correct: true
label.en: carrots
label.vi: cà rốt
image.brief: Dùng lại hình `explore_eat_roots`. Từ khoá tìm ảnh (EN): carrot with leaves
image.alt.en: Carrots with green leaves
image.alt.vi: Cà rốt còn lá xanh

#### option q1_tomato
correct: false
feedback.en: A tomato is a fruit.
feedback.vi: Cà chua là quả.
label.en: tomatoes
label.vi: cà chua
image.brief: Dùng lại hình `explore_eat_fruits`. Từ khoá tìm ảnh (EN): tomato plant fruit
image.alt.en: Tomatoes on the plant
image.alt.vi: Quả cà chua trên cây

### q2
id: a384a448-5d66-4c26-a733-27522708fa74
format: true_false
version: 1
dok: 1
prompt.en: Sugarcane is a stem.
prompt.vi: Cây mía là thân cây.
image.brief: [ảnh] Một bó cây mía tím đã chặt ngọn, dựng đứng hoặc nằm ngang, thấy rõ các đốt; chụp ngang; không người, không dao, không chữ. Ảnh ngang (khung 4:3 câu q2, thẻ thưởng vuông). Hình gốc của bài (thẻ thưởng dùng lại). Từ khoá tìm ảnh (EN): sugarcane stalks; purple sugarcane bundle
image.alt.en: Purple sugarcane stalks
image.alt.vi: Những cây mía tím
answer: true
hint.en: Look at its long, tall shape.
hint.vi: Em nhìn dáng dài, thẳng của cây mía nhé.
explanation_correct.en: Yes! Sugarcane is a sweet, juicy stem.
explanation_correct.vi: Đúng rồi! Mía là thân cây ngọt, nhiều nước.
explanation_wrong.en: This is true. We eat the sugarcane stem.
explanation_wrong.vi: Câu này đúng. Mình ăn thân cây mía.
feedback_false.en: This tall stalk is the stem.
feedback_false.vi: Cây mía dài này chính là thân.
> DOK 1: nhớ lại ví dụ hai ô Stems and leaves. Hình là bó mía (vật được nói tới).
> [CẦN KIỂM] Mía là thân cây.

### q3
id: 89c518b4-be07-4dff-8563-80d8d52fad7c
format: single_choice
version: 1
dok: 1
prompt.en: Which one is a seed we eat?
prompt.vi: Món nào là hạt mình ăn?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of what sprouts into a plant.
hint.vi: Em nghĩ xem cái gì nảy mầm thành cây nhé.
explanation_correct.en: Yes! A peanut can grow into a plant.
explanation_correct.vi: Đúng rồi! Hạt lạc có thể mọc thành cây.
explanation_wrong.en: The answer is the peanuts. They are seeds.
explanation_wrong.vi: Đáp án là hạt lạc. Lạc là hạt.
> DOK 1: nhớ lại ví dụ hai ô Fruits and seeds. Gợi ý nối bài 1 (hạt nảy mầm), không tả đáp án.

#### option q3_mustard
correct: false
feedback.en: Mustard greens are leaves.
feedback.vi: Rau cải là lá.
label.en: mustard greens
label.vi: rau cải
image.brief: [ảnh] Một bó rau cải xanh lá to (cải ngọt hay cải bẹ xanh), nền trơn, chụp ngang thấy rõ lá to; không tem, không dây buộc có chữ, không chữ. Ảnh ngang (thẻ ba lựa chọn 5:2). Hình gốc của cả chủ đề (câu q5, bài 6 câu w1 dùng lại). Từ khoá tìm ảnh (EN): mustard greens; choy sum bunch; Brassica juncea leaves
image.alt.en: Fresh mustard greens
image.alt.vi: Bó rau cải xanh

#### option q3_peanuts
correct: true
label.en: peanuts
label.vi: hạt lạc
image.brief: Dùng lại hình `tray_peanuts`. Từ khoá tìm ảnh (EN): peanuts in shell
image.alt.en: Peanuts in their shells
image.alt.vi: Lạc còn nguyên vỏ

#### option q3_carrot
correct: false
feedback.en: A carrot is a root.
feedback.vi: Cà rốt là rễ.
label.en: carrots
label.vi: cà rốt
image.brief: Dùng lại hình `explore_eat_roots`. Từ khoá tìm ảnh (EN): carrot with leaves
image.alt.en: Carrots with green leaves
image.alt.vi: Cà rốt còn lá xanh

### q4
id: ca8d9847-eae4-4975-a9d2-e4cad834805f
format: single_choice
version: 1
dok: 2
prompt.en: Which one grew under the ground?
prompt.vi: Món nào đã lớn lên dưới đất?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of where carrots grow.
hint.vi: Em nghĩ xem cà rốt lớn lên ở đâu nhé.
explanation_correct.en: Yes! A white radish is a root.
explanation_correct.vi: Đúng rồi! Củ cải trắng là rễ.
explanation_wrong.en: The answer is the white radish. It is a root.
explanation_wrong.vi: Đáp án là củ cải trắng. Củ cải là rễ.
> DOK 2: áp ý "rễ ở dưới đất" (bài 3) và ô Roots (cà rốt) vào một món khác (củ cải trắng, chỉ nghe ở ví dụ một). Lựa chọn sai mọc trên mặt đất. Không có hạt lạc trong câu (quả lạc cũng ở dưới đất, sẽ nước đôi).

#### option q4_banana
correct: false
feedback.en: Bananas hang from the banana plant.
feedback.vi: Chuối treo trên cây chuối.
label.en: bananas
label.vi: nải chuối
image.brief: Dùng lại hình `q4_banana` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): bunch ripe bananas wooden table
image.alt.en: A bunch of bananas
image.alt.vi: Nải chuối chín

#### option q4_radish
correct: true
label.en: white radish
label.vi: củ cải trắng
image.brief: Dùng lại hình `tray_radish`. Từ khoá tìm ảnh (EN): daikon radish
image.alt.en: A long white radish
image.alt.vi: Củ cải trắng dài

#### option q4_cauliflower
correct: false
feedback.en: Cauliflower grows above the ground.
feedback.vi: Súp lơ lớn lên trên mặt đất.
label.en: cauliflower
label.vi: súp lơ
image.brief: Dùng lại hình `explore_eat_flowers`. Từ khoá tìm ảnh (EN): cauliflower
image.alt.en: A white cauliflower
image.alt.vi: Cây súp lơ trắng

### q5
id: 9456d14e-84c2-4ab9-ab00-dee7d3fbd748
format: single_choice
version: 1
dok: 2
prompt.en: Which one grew from a flower?
prompt.vi: Món nào mọc ra từ một bông hoa?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of the pumpkin vine.
hint.vi: Em nghĩ tới dây bí nhé.
explanation_correct.en: Yes! Every fruit grows from a flower.
explanation_correct.vi: Đúng rồi! Quả nào cũng mọc ra từ hoa.
explanation_wrong.en: The answer is the mango. It is a fruit.
explanation_wrong.vi: Đáp án là quả xoài. Xoài là quả.
> DOK 2: nối hai bài: "hoa thành quả" (bài 4) và "xoài là quả" (ví dụ ô Fruits and seeds), áp vào một quả cụ thể. Không có súp lơ trong câu (súp lơ là hoa, sẽ nước đôi với "mọc ra từ hoa").
> [CẦN KIỂM] Mọi quả đều phát triển từ hoa (câu `explanation_correct`).

#### option q5_carrot
correct: false
feedback.en: A carrot grows down in the soil.
feedback.vi: Cà rốt lớn lên trong đất.
label.en: carrots
label.vi: cà rốt
image.brief: Dùng lại hình `explore_eat_roots`. Từ khoá tìm ảnh (EN): carrot with leaves
image.alt.en: Carrots with green leaves
image.alt.vi: Cà rốt còn lá xanh

#### option q5_mango
correct: true
label.en: green mango
label.vi: quả xoài xanh
image.brief: Dùng lại hình `tray_green_mango` ở bài `co-the-cua-em/nem-va-so`. Từ khoá tìm ảnh (EN): green mango whole unripe
image.alt.en: A green mango
image.alt.vi: Quả xoài xanh

#### option q5_mustard
correct: false
feedback.en: Mustard greens are big, green leaves.
feedback.vi: Rau cải là những chiếc lá xanh to.
label.en: mustard greens
label.vi: rau cải
image.brief: Dùng lại hình `q3_mustard`. Từ khoá tìm ảnh (EN): mustard greens
image.alt.en: Fresh mustard greens
image.alt.vi: Bó rau cải xanh

### q6
id: 0123dcdd-3920-4f35-a448-8051c73269f9
format: true_false
version: 1
dok: 2
misconception: food_not_from_plants
prompt.en: Carrots are made in a factory.
prompt.vi: Cà rốt được làm ra trong nhà máy.
image.brief: [ảnh] Một rổ cà rốt đã cắt lá, xếp trong rổ tre hay trên mẹt ở chợ, chụp gần; không tem giá, không biển, không túi có chữ, không người nhìn rõ mặt. Ảnh ngang (khung 4:3). Từ khoá tìm ảnh (EN): carrots in basket; carrots market basket
image.alt.en: Carrots in a basket
image.alt.vi: Rổ cà rốt
answer: false
hint.en: Think of the green leaves on top.
hint.vi: Em nghĩ tới chùm lá xanh trên đầu cà rốt nhé.
explanation_correct.en: A carrot is the root of a plant.
explanation_correct.vi: Cà rốt là rễ của cây.
explanation_wrong.en: This is false. Carrots grow in the soil.
explanation_wrong.vi: Câu này sai. Cà rốt lớn lên trong đất.
feedback_true.en: Carrots grow in fields, under the soil.
feedback_true.vi: Cà rốt lớn lên ngoài ruộng, dưới đất.
> Câu misconception (`food_not_from_plants`), DOK 2: bé chỉ thấy cà rốt ở chợ, đã cắt lá, dễ nghĩ cà rốt "làm ra" như đồ ở cửa hàng và chạm Đúng. Bé áp ô Roots để bác câu nói. Câu chỉ kiểm một việc: cà rốt có từ cây không. Câu khẳng định (luật Explorer số năm), nên nói "nhà máy" thay cho "không phải từ cây".
> Hình là cà rốt đã cắt lá, như bé thấy ở chợ (vật được nói tới); không có lá, nên không tự làm bằng chứng. Gợi ý trỏ tới chùm lá bé đã thấy ở ô Roots, không nói "rễ". `explanation_correct` là đúng câu `correction` ở `_topic.md`.

## Từ vựng

### vegetable
id: 723b0606-e245-47fb-b85d-bb6bee7726ee
tier: core
term.en: vegetable
term.vi: rau
example.en: Water spinach is a green vegetable.
example.vi: Rau muống là một loại rau xanh.
image.brief: Dùng lại hình `explore_eat_leaves`. Từ khoá tìm ảnh (EN): water spinach
image.alt.en: A bunch of water spinach
image.alt.vi: Bó rau muống

### fruit
id: 96509e43-67a3-41c5-a283-d8e9d57d847b
tier: core
term.en: fruit
term.vi: quả
example.en: Most fruits have seeds inside.
example.vi: Phần lớn quả có hạt bên trong.
image.brief: Dùng lại hình `explore_eat_fruits`. Từ khoá tìm ảnh (EN): tomato plant fruit
image.alt.en: Tomatoes on the plant
image.alt.vi: Quả cà chua trên cây
> "Most" vì chuối bán ở chợ hầu như không còn hạt to. [CẦN KIỂM] Phần lớn quả có hạt bên trong (cà chua, xoài, cam, bí).

### plant_part
id: 74f6039b-efd3-4c8e-abd5-13f2dcd1fec9
tier: extra
term.en: plant part
term.vi: bộ phận của cây
example.en: We eat many plant parts.
example.vi: Mình ăn nhiều bộ phận của cây.
image.brief: Dùng lại hình `explore_eat_flowers`. Từ khoá tìm ảnh (EN): cauliflower
image.alt.en: A white cauliflower
image.alt.vi: Cây súp lơ trắng
> Từ bộ phận ticket gợi ý ("một từ bộ phận"): rễ, thân, lá, hoa, quả, hạt đã là từ của bài 1, 3, 4 hay là `core` hôm nay, nên chọn chính chữ "plant part".

### carrot
id: fc0b6dca-d591-44c5-9772-10046d63545c
tier: extra
term.en: carrot
term.vi: cà rốt
example.en: A carrot is orange and crunchy.
example.vi: Cà rốt màu cam, giòn.
image.brief: Dùng lại hình `explore_eat_roots`. Từ khoá tìm ảnh (EN): carrot with leaves
image.alt.en: Carrots with green leaves
image.alt.vi: Cà rốt còn lá xanh

## Thưởng

### sugarcane_card
id: 6b0210be-d339-4ecf-b3a1-373d7d5ee739
set: plants
rarity: common
name.en: Sugarcane
name.vi: Cây mía
tag.en: A sweet stem
tag.vi: Thân cây ngọt
fact.en: Sugar is made from sugarcane stems.
fact.vi: Đường được làm từ thân cây mía.
image.brief: Dùng lại hình `q2`. Từ khoá tìm ảnh (EN): sugarcane stalks
image.alt.en: Purple sugarcane stalks
image.alt.vi: Những cây mía tím
> [CẦN KIỂM] Đường ở Việt Nam chủ yếu làm từ mía (nơi khác còn làm từ củ cải đường).

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Rau quả không tem giá, không túi ni lông có chữ, không bao bì, không biển chợ; người ở chợ (nếu có) ở xa, không nhận ra mặt.
- **Ảnh mới, hình gốc của cả chủ đề (giữ đúng key, `alt`, truy vấn đầu ở `_topic.md`):** cà rốt còn lá (`explore_eat_roots`), rau cải (`q3_mustard`).
- **Ảnh mới chỉ dùng ở bài này:** bó rau muống (`explore_eat_leaves`), súp lơ trắng (`explore_eat_flowers`), cây cà chua có quả (`explore_eat_fruits`), lạc còn vỏ (`tray_peanuts`), hạt sen (`tray_lotus_seeds`), củ cải trắng (`tray_radish`), bó mía tím (hình câu `q2`, thẻ thưởng dùng lại), rổ cà rốt đã cắt lá (hình câu `q6`).
- **Ảnh dùng lại:** bài 4 `tray_bud`, `q4_pumpkin` (w1), `tray_pumpkin_flower` (món Chơi); *Cơ thể của em* bài 4 `tray_lime` (w2; trỏ thẳng về ảnh gốc ở bài 4, không qua bài 6, sửa 18/11 theo rà chữ tester C1), bài 6 `tray_green_mango` (q5); *Gọi tên và nhóm động vật* bài 1 `q4_banana` (q4), `q4_fish` (món Chơi), `w1` (hàng rào tre), bài 3 `explore_eggs` (món Chơi).
- **Ảnh khó:** rau quả ở chợ hay có tem giá, túi có chữ: chọn ảnh rau trên nền trơn, nền tre; củ cải trắng khác rõ cà rốt; lạc có vài quả bóc thấy hạt.
- **Mâm cơm:** "Bảng soạn" gợi ý ảnh `Vietnamese family meal`; bài không dùng (ô Học dùng ảnh từng món để bé nhìn rõ bộ phận). Designer có thể dùng ảnh mâm cơm không người cho nền màn Chơi nếu canvas có chỗ; không bắt buộc.
- **Màu:** Học: rễ `vang_hoe`, thân và lá `gi_dong`, hoa `cham`, quả và hạt `nau_dat`. Chơi: rễ `vang_hoe`, hoa `cham`, hạt `nau_dat`, có từ con vật `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (vegetable, fruit). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Sai). Quiz `single_choice` (q1, q3, q4, q5; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`food_not_from_plants`). Không có `labels` ở câu `true_false`.
- **Màn Chơi, ví dụ để kiểm:** Cà rốt, Súp lơ, Hạt lạc → `balanced`; Củ cải trắng, Hoa bí, Hạt sen → `balanced`; Cà rốt, Củ cải trắng, Hạt lạc → `missing.tray_flowers`; Cà rốt, Súp lơ, Trứng → `has_limited`.
- **Khởi động trỏ:** w1 → `cay-quanh-em/cay-co-hoa-re-than-la-hoa` (bài 4 phải có id trước), w2 → `co-the-cua-em/nem-va-so` (đã có id).
- **Danh mục:** bài này `oak_lessons: []`, `statutory: false`, `extension: true` (SK-051; dev đã nới luật `extension`).
- **Từ EN có thể ngoài Starters/Movers:** vegetable, root, stem, cauliflower, buds, sugarcane, juicy, water spinach, mustard greens, lettuce, radish, peanuts, lotus seeds, factory, crunchy, grown-up.
