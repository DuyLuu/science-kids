---
id: d1a3fdbe-ae0a-488b-82de-849b421980da
topic: sinh-vat-song-o-dau
slug: vat-song-hay-khong-song
order: 1
stage: opener
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Living or non-living
vi: Vật sống hay không sống?
> Giữ đúng tên ở `content/syllabus.json` (`living-things-and-where-they-live`, bài số một).

## Mục tiêu
en: I can sort living and non-living things.
vi: Em xếp được vật sống và vật không sống.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 14/11/2026. Mọi dòng `id:` để trống; chạy `ids` sau `_topic.md`.
> Bài mở màn: chia hai nhóm sống, không sống. Theo `[CẦN KIỂM]` của sườn, bài này **không** đưa vật đã chết (lá rụng, cành khô, vỏ sò) vào câu hỏi nào; để dành bài ba. Mọi vật không sống trong bài là nhựa, thuỷ tinh, đá (không gỗ, giấy, vải bông, vì các thứ đó làm từ vật từng sống).
> Sửa `plants_not_alive` ở ô Học "Plants", phần Chơi (nhóm Cây bắt buộc) và câu q6 (gắn key).

## Ý chính
1.en: People, animals and plants are alive.
1.vi: Con người, con vật và cây đều là vật sống.
2.en: Living things grow and need water and air.
2.vi: Vật sống lớn lên, cần nước và không khí.
3.en: Non-living things do not grow.
3.vi: Vật không sống không lớn lên.
> Từ cụ thể tới trừu tượng: những vật sống bé biết, dấu hiệu chung của vật sống, rồi nhóm ngược lại.
> Ý hai không nói "cây cần thức ăn" để khỏi gieo quan niệm sai "cây lấy thức ăn từ đất"; ô Học "Plants" nói cây cần nước và ánh sáng.

## Khởi động

> Hai câu, cả hai ôn chủ đề *Gọi tên và nhóm động vật* (mốc giãn cách dài, theo rà chữ tester SK-041 n15): w1 ôn bài bốn, w2 ôn bài một.

### w1
id: 0b75c6a5-fc59-47cc-a3b8-908c7f6c8eb1
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/ca-va-luong-cu
prompt.en: Which one lives in water and on land?
prompt.vi: Con nào sống được cả dưới nước và trên cạn?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for one with legs.
hint.vi: Em tìm con có chân nhé.
explanation_correct.en: Yes! A frog swims and hops on land.
explanation_correct.vi: Đúng rồi! Ếch bơi dưới nước và nhảy trên bờ.
explanation_wrong.en: The answer is the frog. It is an amphibian.
explanation_wrong.vi: Đáp án là con ếch. Ếch là lưỡng cư.
> Câu nối sang chủ đề này: lưỡng cư sống được ở hai nơi (bài bốn sẽ nói về nơi sống). Hình câu hỏi là góc vườn, không phải ao (ao gợi cả hai con).

#### option w1_goldfish
correct: false
feedback.en: A goldfish lives only in water.
feedback.vi: Cá vàng chỉ sống dưới nước.
label.en: goldfish
label.vi: cá vàng
image.brief: Dùng lại hình `tray_goldfish` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): goldfish aquarium plants side view
image.alt.en: A goldfish in a tank
image.alt.vi: Cá vàng trong bể

#### option w1_frog
correct: true
label.en: frog
label.vi: con ếch
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

### w2
id: 918c31b4-d2d4-476d-89bd-c91717e596f3
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha
prompt.en: Wild animals find their own food.
prompt.vi: Động vật hoang dã tự tìm thức ăn.
image.brief: Dùng lại hình `explore_wild` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): red-shanked douc langur tree
image.alt.en: A douc in a tree
image.alt.vi: Con voọc trên cây
answer: true
hint.en: Remember the Wild animals picture.
hint.vi: Em nhớ lại ô Động vật hoang dã nhé.
explanation_correct.en: Yes! Nobody feeds a douc in the forest.
explanation_correct.vi: Đúng rồi! Trong rừng, không ai cho voọc ăn cả.
explanation_wrong.en: This is true. Wild animals live free.
explanation_wrong.vi: Câu này đúng. Động vật hoang dã sống tự do.
feedback_false.en: A douc finds leaves to eat by itself.
feedback_false.vi: Voọc tự tìm lá cây để ăn.
> Ôn câu q3 bài một chủ đề trước ("Pets find their own food.", Sai) theo chiều ngược lại. Ảnh voọc ngồi trên cây là chính vật được nói tới, không cho thấy cảnh kiếm ăn.

## Học

> Bốn ô, từ gần bé nhất tới khó nhất: em, con vật, cây (dễ bị coi là không sống vì đứng yên), vật không sống.
> Ô "Plants" sửa `plants_not_alive`: cây lớn lên, cần nước, ánh sáng.

### explore
id: da5caff7-7eaf-466c-93f9-c292a0ed87c2
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_people
label.en: People
label.vi: Con người
color: vang_hoe
sentence.en: You are alive. You grow every day.
sentence.vi: Em là vật sống. Em lớn lên mỗi ngày.
image.brief: Dùng lại hình `explore_people` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): baby hand holding adult finger
image.alt.en: A baby's hand holding a finger
image.alt.vi: Bàn tay em bé nắm ngón tay người lớn
examples.1.en: you eat and drink
examples.1.vi: em ăn và uống
examples.2.en: you breathe air
examples.2.vi: em hít thở không khí
examples.3.en: you grow taller
examples.3.vi: em cao lên

#### group explore_animals
label.en: Animals
label.vi: Con vật
color: gi_dong
sentence.en: Animals are alive. They eat and drink.
sentence.vi: Con vật là vật sống. Con vật ăn và uống.
image.brief: Dùng lại hình `explore_animals` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): hen with chicks pecking yard
image.alt.en: A hen and chicks looking for food
image.alt.vi: Gà mẹ và gà con tìm thức ăn
examples.1.en: chicks grow bigger
examples.1.vi: gà con lớn dần
examples.2.en: a frog breathes air
examples.2.vi: ếch hít thở không khí
examples.3.en: a cat drinks water
examples.3.vi: mèo uống nước

#### group explore_plants
label.en: Plants
label.vi: Cây
color: cham
sentence.en: Plants are alive, too. They grow.
sentence.vi: Cây cũng là vật sống. Cây lớn lên.
image.brief: [ảnh] Một hàng cây rau non xanh (cải hoặc rau muống) vừa mọc trên luống đất nâu ở vườn rau, ảnh ngang, chụp thấp gần mặt đất, thấy rõ lá non và đất; không có người, không có tay, không có dụng cụ, không có chữ. Từ khoá tìm ảnh (EN): young vegetable seedlings soil row
image.alt.en: Young plants in the soil
image.alt.vi: Cây non mọc trên đất
examples.1.en: plants need water
examples.1.vi: cây cần nước
examples.2.en: plants need light
examples.2.vi: cây cần ánh sáng
examples.3.en: a rice plant grows tall
examples.3.vi: cây lúa lớn lên cao
> Hình gốc, dùng lại ở món Chơi, câu q5, từ `grow`, và các bài hai, ba. Ảnh ngang tự nhiên (một hàng cây thấp), hợp cả thẻ lựa chọn rất ngang.

#### group explore_things
label.en: Non-living things
label.vi: Vật không sống
color: nau_dat
sentence.en: A ball is not alive. It never grows.
sentence.vi: Quả bóng không phải vật sống. Quả bóng không bao giờ lớn lên.
image.brief: Dùng lại hình `w1_ball` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): ball plastic toy colorful
image.alt.en: A round ball
image.alt.vi: Quả bóng tròn
examples.1.en: a stone
examples.1.vi: hòn đá
examples.2.en: a glass marble
examples.2.vi: viên bi thuỷ tinh
examples.3.en: a toy car
examples.3.vi: chiếc ô tô đồ chơi
> Ví dụ chỉ là nhựa, thuỷ tinh, đá. Không dùng cái ghế gỗ, quyển vở, áo bông (làm từ vật từng sống; xem `_topic.md`, mục Đúng khoa học).

### new_words
id: 6a57f760-e231-41a9-9379-985b2f1c75ea
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: living_thing, non_living

## Chơi

> Bé chọn hai vật sống: một con vật và một cái cây. Đạt khi đủ hai nhóm và không chọn đồ vật nào.
> Món bẫy giống một nhóm bắt buộc: khủng long đồ chơi trông như con vật; bình tưới cây đi cùng cây; ô tô đồ chơi chạy được. Bé phải hỏi "nó có lớn lên không", không chọn theo dáng.
> Kệ bảy món, toàn ảnh chụp. Hai chỗ (hai nhóm bắt buộc), như bài bốn chủ đề trước.

### tray
id: 601b2fab-cb58-4848-97ef-71dfd942b4b6
type: build_tray
version: 1
prompt.en: Pick two living things
prompt.vi: Chọn hai vật sống
capacity: 2
success_when: all_required_and_no_limit
messages.start.en: Find an animal and a plant.
messages.start.vi: Em tìm một con vật và một cái cây nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Animals and plants are alive.
messages.balanced.vi: Tuyệt! Con vật và cây đều là vật sống.
messages.has_limited.en: That one is not alive. It is a thing.
messages.has_limited.vi: Thứ này không phải vật sống. Nó là đồ vật.
messages.missing.tray_animal.en: You still need an animal.
messages.missing.tray_animal.vi: Em còn thiếu một con vật.
messages.missing.tray_plant.en: You still need a plant.
messages.missing.tray_plant.vi: Em còn thiếu một cái cây.

#### group tray_animal
label.en: Animal
label.vi: Con vật
color: gi_dong
role: required

#### group tray_plant
label.en: Plant
label.vi: Cây
color: cham
role: required

#### group tray_not
label.en: Non-living
label.vi: Vật không sống
color: do_son
role: limit

#### item tray_hen
label.en: Hen
label.vi: Con gà mái
group: tray_animal
image.brief: Dùng lại hình `w3_hen` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): brown hen standing farmyard side view
image.alt.en: A hen in a yard
image.alt.vi: Con gà mái trong sân

#### item tray_dinosaur
label.en: Toy dinosaur
label.vi: Khủng long đồ chơi
group: tray_not
image.brief: Dùng lại hình `q6` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): plastic toy dinosaur on table
image.alt.en: A toy dinosaur on a table
image.alt.vi: Khủng long đồ chơi trên bàn
> Không dùng vịt đồ chơi (sườn ghi đó là ví dụ trong quiz của nguồn tham khảo). Bé Explorer chưa học chủ đề *Khủng long*; ở đây chỉ là một món đồ chơi hình con vật.

#### item tray_seedlings
label.en: Young plants
label.vi: Cây non
group: tray_plant
image.brief: Dùng lại hình `explore_plants`. Từ khoá tìm ảnh (EN): young vegetable seedlings soil row
image.alt.en: Young plants in the soil
image.alt.vi: Cây non mọc trên đất

#### item tray_car
label.en: Toy car
label.vi: Ô tô đồ chơi
group: tray_not
image.brief: [ảnh] Một chiếc ô tô đồ chơi bằng nhựa màu đỏ đặt trên sàn gạch, nhìn ngang thấy cả xe; không có logo, không có biển số, không có chữ, không có người, không có tay. Từ khoá tìm ảnh (EN): red plastic toy car side view
image.alt.en: A red toy car
image.alt.vi: Chiếc ô tô đồ chơi màu đỏ
> Hình gốc, dùng lại ở câu q5, câu q6 và bài hai, ba. Xe nằm ngang, hợp thẻ rất ngang.

#### item tray_frog
label.en: Frog
label.vi: Con ếch
group: tray_animal
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

#### item tray_can
label.en: Watering can
label.vi: Bình tưới cây
group: tray_not
image.brief: [ảnh] Một bình tưới cây bằng nhựa màu xanh lá đặt trên nền gạch hoặc nền đất, nhìn ngang, thấy vòi dài; không có cây trong khung, không có nhãn hiệu, không có chữ, không có người. Từ khoá tìm ảnh (EN): green plastic watering can side view
image.alt.en: A green watering can
image.alt.vi: Bình tưới cây màu xanh

#### item tray_lotus
label.en: Lotus
label.vi: Hoa sen
group: tray_plant
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1, q3, q4, q5, q6; ba lựa chọn), `true_false` (q2). Bài này không dùng `order_sequence`: hai nhóm sống, không sống không có thứ tự tự nhiên.
> Hình câu hỏi của các câu có thẻ hình là góc vườn trung tính (app Explorer ẩn hình này khi mọi lựa chọn có hình).

### q1
id: b8e1c3f0-4060-44a7-b922-d49dda56556a
format: single_choice
version: 1
dok: 1
prompt.en: Which one is alive?
prompt.vi: Cái nào là vật sống?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Which one grows bigger each day?
hint.vi: Em tìm cái nào mỗi ngày một lớn nhé.
explanation_correct.en: Yes! A cat eats, drinks and grows.
explanation_correct.vi: Đúng rồi! Mèo biết ăn, biết uống và lớn lên.
explanation_wrong.en: The answer is the cat. It is an animal.
explanation_wrong.vi: Đáp án là con mèo. Mèo là con vật.

#### option q1_ball
correct: false
feedback.en: A ball does not eat or drink.
feedback.vi: Quả bóng không ăn, không uống.
label.en: ball
label.vi: quả bóng
image.brief: Dùng lại hình `w1_ball` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): ball plastic toy colorful
image.alt.en: A round ball
image.alt.vi: Quả bóng tròn

#### option q1_cat
correct: true
label.en: cat
label.vi: con mèo
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

#### option q1_sandals
correct: false
feedback.en: Sandals do not eat or grow.
feedback.vi: Đôi dép không ăn, không lớn lên.
label.en: sandals
label.vi: đôi dép
image.brief: [ảnh] Một đôi dép nhựa màu xanh đặt cạnh nhau trên nền gạch, ảnh ngang, chụp chếch từ trên xuống; không có chân người, không có logo, không có chữ. Từ khoá tìm ảnh (EN): pair of plastic sandals floor
image.alt.en: A pair of plastic sandals
image.alt.vi: Đôi dép nhựa
> Hình gốc, dùng lại ở câu q3. Đáp án (mèo) là ảnh bé đã gặp nhiều ở chủ đề trước; quả bóng bé vừa thấy ở Học; dép là ảnh mới nhưng là lựa chọn sai.

### q2
id: d8896331-7ab2-4c99-b9f0-f4124ba6d814
format: true_false
version: 1
dok: 1
prompt.en: A ball needs food and water.
prompt.vi: Quả bóng cần thức ăn và nước.
image.brief: Dùng lại hình `w1_ball` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): ball plastic toy colorful
image.alt.en: A round ball
image.alt.vi: Quả bóng tròn
answer: false
hint.en: Remember the Non-living things picture.
hint.vi: Em nhớ lại ô Vật không sống nhé.
explanation_correct.en: A ball is non-living. It needs no food.
explanation_correct.vi: Quả bóng là vật không sống. Quả bóng không cần ăn.
explanation_wrong.en: This is false. A ball is not alive.
explanation_wrong.vi: Câu này sai. Quả bóng không phải vật sống.
feedback_true.en: A ball never eats or drinks.
feedback_true.vi: Quả bóng không bao giờ ăn, uống.

### q3
id: 04e5adb3-8133-4df9-8b8e-100d8af23956
format: single_choice
version: 1
dok: 1
prompt.en: What does a living thing need?
prompt.vi: Vật sống cần gì?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: What do plants and animals both need?
hint.vi: Em nghĩ xem cây và con vật cùng cần gì?
explanation_correct.en: Yes! Every living thing needs water.
explanation_correct.vi: Đúng rồi! Mọi vật sống đều cần nước.
explanation_wrong.en: The answer is water. Living things need it.
explanation_wrong.vi: Đáp án là nước. Vật sống cần nước.

#### option q3_ball
correct: false
feedback.en: A ball is fun, but not needed.
feedback.vi: Quả bóng để chơi, vật sống không cần nó.
label.en: ball
label.vi: quả bóng
image.brief: Dùng lại hình `w1_ball` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): ball plastic toy colorful
image.alt.en: A round ball
image.alt.vi: Quả bóng tròn

#### option q3_sandals
correct: false
feedback.en: Animals and plants live without sandals.
feedback.vi: Con vật và cây sống mà không cần dép.
label.en: sandals
label.vi: đôi dép
image.brief: Dùng lại hình `q1_sandals`. Từ khoá tìm ảnh (EN): pair of plastic sandals floor
image.alt.en: A pair of plastic sandals
image.alt.vi: Đôi dép nhựa

#### option q3_water
correct: true
label.en: glass of water
label.vi: cốc nước
image.brief: Dùng lại hình `w1_water` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): glass of water wooden table
image.alt.en: A glass of water
image.alt.vi: Cốc nước
> Lựa chọn khác các thứ sườn nêu (đồ chơi, phòng ngủ); không dùng lại câu của nguồn.

### q4
id: 91d86575-0da6-4bb5-b4a4-a1dc26cb9166
format: single_choice
version: 1
dok: 2
prompt.en: Which one is non-living?
prompt.vi: Cái nào là vật không sống?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Can it eat, drink and grow?
hint.vi: Em nghĩ xem nó có ăn, uống, lớn lên không?
explanation_correct.en: Yes! A toy dinosaur never eats or grows.
explanation_correct.vi: Đúng rồi! Khủng long đồ chơi không ăn, không lớn lên.
explanation_wrong.en: The answer is the toy dinosaur. It is plastic.
explanation_wrong.vi: Đáp án là khủng long đồ chơi. Nó làm bằng nhựa.
> DOK 2: món đồ chơi trông như con vật; bé phải dùng dấu hiệu "ăn, lớn lên", không dùng dáng. Hai lựa chọn sai là hai vật sống bé vừa gặp ở kệ Chơi.

#### option q4_dinosaur
correct: true
label.en: toy dinosaur
label.vi: khủng long đồ chơi
image.brief: Dùng lại hình `q6` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): plastic toy dinosaur on table
image.alt.en: A toy dinosaur on a table
image.alt.vi: Khủng long đồ chơi trên bàn

#### option q4_frog
correct: false
feedback.en: A frog is an animal that eats.
feedback.vi: Ếch là con vật, ếch biết ăn.
label.en: frog
label.vi: con ếch
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

#### option q4_lotus
correct: false
feedback.en: A lotus is a plant that grows.
feedback.vi: Hoa sen là cây, sen lớn lên được.
label.en: lotus
label.vi: hoa sen
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao

### q5
id: ec1f9bea-d875-4326-93ba-f5069193435d
format: single_choice
version: 1
dok: 2
prompt.en: Which one will grow bigger?
prompt.vi: Cái nào sẽ lớn lên?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Which one is alive?
hint.vi: Em tìm vật sống nhé.
explanation_correct.en: Yes! Young plants grow big and tall.
explanation_correct.vi: Đúng rồi! Cây non sẽ lớn lên, cao dần.
explanation_wrong.en: The answer is the young plants. They are alive.
explanation_wrong.vi: Đáp án là cây non. Cây non là vật sống.
> DOK 2: áp dấu hiệu "lớn lên" vào cây (cây đứng yên nhưng lớn lên). Ba hình bé đều đã gặp hôm nay.

#### option q5_car
correct: false
feedback.en: A toy car stays the same size.
feedback.vi: Ô tô đồ chơi lúc nào cũng to như thế.
label.en: toy car
label.vi: ô tô đồ chơi
image.brief: Dùng lại hình `tray_car`. Từ khoá tìm ảnh (EN): red plastic toy car side view
image.alt.en: A red toy car
image.alt.vi: Chiếc ô tô đồ chơi màu đỏ

#### option q5_seedlings
correct: true
label.en: young plants
label.vi: cây non
image.brief: Dùng lại hình `explore_plants`. Từ khoá tìm ảnh (EN): young vegetable seedlings soil row
image.alt.en: Young plants in the soil
image.alt.vi: Cây non mọc trên đất

#### option q5_ball
correct: false
feedback.en: A ball stays the same size.
feedback.vi: Quả bóng lúc nào cũng to như thế.
label.en: ball
label.vi: quả bóng
image.brief: Dùng lại hình `w1_ball` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): ball plastic toy colorful
image.alt.en: A round ball
image.alt.vi: Quả bóng tròn

### q6
id: 507ea072-ad34-4ab9-b740-019290e4979e
format: single_choice
version: 1
dok: 2
misconception: plants_not_alive
prompt.en: Which one is alive, like you?
prompt.vi: Cái nào là vật sống, giống em?
image.brief: Dùng lại hình `explore_people` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): baby hand holding adult finger
image.alt.en: A baby's hand holding a finger
image.alt.vi: Bàn tay em bé nắm ngón tay người lớn
hint.en: Which one grows and needs water?
hint.vi: Em tìm cái nào lớn lên và cần nước nhé.
explanation_correct.en: Yes! A lotus grows, so it is alive.
explanation_correct.vi: Đúng rồi! Hoa sen lớn lên, nên là vật sống.
explanation_wrong.en: The answer is the lotus. Plants are alive.
explanation_wrong.vi: Đáp án là hoa sen. Cây cũng là vật sống.
> Câu misconception (`plants_not_alive`), bằng hình: hai lựa chọn sai là hai vật **cử động** được (bóng bay bay lên, ô tô chạy), đáp án là cây đứng yên. Bé nghĩ "cây không sống vì không cử động" sẽ chọn vật cử động.
> DOK 2: áp dấu hiệu "lớn lên, cần nước" vào một cây, bỏ qua dấu hiệu "cử động". Hình câu hỏi là bàn tay em bé (phía "like you" của câu), không phải vật nào trong lựa chọn.

#### option q6_balloon
correct: false
feedback.en: A balloon floats, but it never grows.
feedback.vi: Bóng bay bay lên được, nhưng không bao giờ lớn lên.
label.en: balloon
label.vi: quả bóng bay
image.brief: Dùng lại hình `w1_balloon` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): red balloon plain background
image.alt.en: A red balloon
image.alt.vi: Quả bóng bay màu đỏ

#### option q6_car
correct: false
feedback.en: A toy car rolls, but never eats.
feedback.vi: Ô tô đồ chơi chạy được, nhưng không biết ăn.
label.en: toy car
label.vi: ô tô đồ chơi
image.brief: Dùng lại hình `tray_car`. Từ khoá tìm ảnh (EN): red plastic toy car side view
image.alt.en: A red toy car
image.alt.vi: Chiếc ô tô đồ chơi màu đỏ

#### option q6_lotus
correct: true
label.en: lotus
label.vi: hoa sen
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao
> Hoa sen bé đã gặp ở chủ đề trước và ở kệ Chơi hôm nay; bóng bay là ảnh bé chưa gặp ở chủ đề Explorer nào (ảnh của *Hô hấp*), nhưng là lựa chọn sai, nên đáp án không phải "hình lạ".

## Từ vựng

### living_thing
id: 0bd0e87d-a843-451a-813e-7d42d3c417a8
tier: core
term.en: living thing
term.vi: vật sống
example.en: A frog is a living thing.
example.vi: Con ếch là một vật sống.
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

### non_living
id: 9ed36451-2fa9-4a74-a3c7-d50b323e2211
tier: core
term.en: non-living
term.vi: không sống
example.en: A ball is non-living.
example.vi: Quả bóng là vật không sống.
image.brief: Dùng lại hình `w1_ball` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): ball plastic toy colorful
image.alt.en: A round ball
image.alt.vi: Quả bóng tròn

### air
id: fb895d1c-40d2-45b7-a1b7-c1759ce67e5a
tier: extra
term.en: air
term.vi: không khí
example.en: Living things need air.
example.vi: Vật sống cần không khí.
image.brief: Dùng lại hình `w1` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): rice field wind waves Vietnam
image.alt.en: Wind blowing over a rice field
image.alt.vi: Gió thổi trên cánh đồng lúa

### grow
id: f98aeff8-6891-4d9e-b796-4444f6afb0e9
tier: extra
term.en: grow
term.vi: lớn lên
example.en: Young plants grow every day.
example.vi: Cây non lớn lên mỗi ngày.
image.brief: Dùng lại hình `explore_plants`. Từ khoá tìm ảnh (EN): young vegetable seedlings soil row
image.alt.en: Young plants in the soil
image.alt.vi: Cây non mọc trên đất

## Thưởng

### bamboo_card
id: 2b061493-c50f-477a-8044-f89033434f3a
set: living_things
rarity: common
name.en: Bamboo
name.vi: Cây tre
tag.en: A fast grower
tag.vi: Cây lớn rất nhanh
fact.en: Some bamboo grows a lot in one day.
fact.vi: Có loài tre mỗi ngày lớn thêm rất nhiều.
image.brief: [ảnh] Một bụi tre xanh ở làng quê, thấy các thân tre và vài cây măng non nhú lên ở gốc, chụp ngang tầm, ảnh vuông được; không có người, không có nhà, không có chữ. Từ khoá tìm ảnh (EN): bamboo clump shoots Vietnam village
image.alt.en: A clump of green bamboo
image.alt.vi: Bụi tre xanh
> [CẦN KIỂM] Một số loài tre, nhất là lúc còn là măng, lớn rất nhanh trong một ngày (biên tập nhớ có loài gần một mét mỗi ngày). Câu cho bé không nêu con số. Thẻ nối ý "cây lớn lên, nên là vật sống". Hình gốc, bài năm dùng lại (món Chơi, câu q3).

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Thẻ ba lựa chọn rất ngang (khung 5:2): ảnh mới chọn ảnh ngang, vật nằm ngang hoặc thấp; tránh ảnh dọc.
- **Ảnh cần tìm (năm):** hàng cây rau non trên luống (ô Học "Plants"); ô tô đồ chơi đỏ; bình tưới cây nhựa xanh; đôi dép nhựa; bụi tre có măng (thẻ).
- **Ảnh khó:** đồ chơi, dép, bình tưới thường có logo hay chữ in; chọn ảnh không thấy chữ hoặc cắt bỏ phần đó. Bóng bay (dùng lại của *Hô hấp*) là vật tròn có dây, trong thẻ 5:2 cần đặt vừa khung, không cắt mất bóng.
- **Dùng lại:** chủ đề *Gọi tên và nhóm động vật* (`w1`, `w1_lotus`, `explore_animals`, `explore_wild`, `tray_goldfish`, `explore_people`); *Khủng long* (`w3_cat`, `w3_hen`, `q4_frog`, `q6` khủng long đồ chơi); *Hô hấp* (`w1_water`, `w1_balloon`, `w1` cánh đồng lúa); *Bề mặt Trái Đất* (`w1_ball`).
- **Người trong hình:** chỉ hai bàn tay (ô "People", hình câu q6).
- **Màu:** Học: con người `vang_hoe`, con vật `gi_dong`, cây `cham`, vật không sống `nau_dat`. Chơi: con vật `gi_dong`, cây `cham`, vật không sống `do_son` (rà chữ tester 14/11 n9: nhãn nhóm Chơi trùng nhãn ô Học "Non-living things").

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (living thing, non-living). Chơi `build_tray` hai chỗ, hai nhóm `required`, một nhóm `limit`, bảy món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Đúng). Quiz `single_choice` (q1, q3, q4, q5, q6), `true_false` (q2 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`plants_not_alive`).
- **Vị trí đáp án đúng:** hết hiệu lực 15/11 (SK-047, app xáo lựa chọn).
- **Màn Chơi, ví dụ để kiểm:** Con gà mái, Cây non → `balanced` (nhóm `limit` nay tên "Non-living" · "Vật không sống"); Con ếch, Khủng long đồ chơi → `has_limited`; Con gà mái, Con ếch → `missing.tray_plant`.
- **Câu hỏi chiều phủ định** (rà chữ tester 14/11 n4): q4 "Which one is non-living?" · "Cái nào là vật không sống?" không viết khẳng định được; đề xuất ios-dev cho giọng đọc chậm và nhấn "non-living" · "không" (như SK-041 13/11 n13).
- **Thẻ thưởng:** bộ mới `set: living_things`; đề xuất khoá `collectible.set.living_things` "Living things cards" · "Thẻ sinh vật".
- **Từ EN có thể ngoài Starters/Movers:** living thing, non-living, alive, grow, sandals, toy dinosaur, watering can, lotus, bamboo, seedlings (không dùng trong chữ bé nghe, chỉ trong từ khoá tìm ảnh).
