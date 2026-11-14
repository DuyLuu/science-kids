---
id: 686a74bf-bdc9-4cb0-91f4-162c462ebedf
topic: chuoi-thuc-an
slug: so-sanh-cac-chuoi-thuc-an
order: 4
stage: review
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Comparing food chains
vi: So sánh các chuỗi thức ăn
> Giữ đúng tên ở `content/syllabus.json` (`introduction-to-food-chains`, bài số bốn).

## Mục tiêu
en: I can compare two food chains.
vi: Em so sánh được hai chuỗi thức ăn, giống nhau ở đâu, khác nhau ở đâu.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 14/11/2026. Mọi dòng `id:` để trống; chạy `ids` sau bài ba.
> Bài cuối chủ đề (`review`): gom các chuỗi của bài hai, ba để so sánh. Ý mới: một cây hay con vật có mặt trong nhiều chuỗi; mỗi chuỗi chỉ cho thấy một món con vật ăn. Sửa `chain_shows_all_food` ở ô Học "Eats many foods", "Food for many" và câu q6 (gắn key).

## Ý chính
1.en: Every food chain starts with a plant.
1.vi: Chuỗi thức ăn nào cũng bắt đầu từ một cây.
2.en: One animal can be in many chains.
2.vi: Một con vật có thể có mặt trong nhiều chuỗi.
3.en: Compare: find what is the same and different.
3.vi: So sánh là tìm chỗ giống nhau và chỗ khác nhau.
> Từ cụ thể tới trừu tượng: điểm giống bé đã biết (cây đứng đầu), rồi một con vật trong nhiều chuỗi, rồi cách so sánh (kỹ năng khoa học của sườn).

## Khởi động

> Ba câu ôn trộn: w1 bài ba (thức ăn của chuột, đặt con cú làm lựa chọn để bắt lỗi đảo chiều), w2 bài hai (đọc mũi tên), w3 chủ đề số một bài sáu (cú ăn thịt).

### w1
id: b55d030d-362c-49b6-80ad-f76f1c37bc66
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: chuoi-thuc-an/moi-loai-mot-vai
prompt.en: What does a mouse eat?
prompt.vi: Chuột ăn gì?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Remember the Middle picture.
hint.vi: Em nhớ lại ô Giữa chuỗi nhé.
explanation_correct.en: Yes! A mouse nibbles rice grains.
explanation_correct.vi: Đúng rồi! Chuột gặm hạt thóc.
explanation_wrong.en: The answer is rice. Mice eat rice.
explanation_wrong.vi: Đáp án là cây lúa. Chuột ăn lúa.
> Lựa chọn sai là con cú: bé đọc ngược chiều (cú và chuột) sẽ chọn cú.

#### option w1_owl
correct: false
feedback.en: The owl is the one that eats mice.
feedback.vi: Cú mới là con ăn chuột.
label.en: owl
label.vi: con cú
image.brief: Dùng lại hình `explore_hunt` ở bài `chuoi-thuc-an/con-vat-kiem-an-the-nao`. Từ khoá tìm ảnh (EN): owl perched branch wild
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành

#### option w1_rice
correct: true
label.en: rice
label.vi: cây lúa
image.brief: Dùng lại hình `explore_start` ở bài `chuoi-thuc-an/moi-loai-mot-vai`. Từ khoá tìm ảnh (EN): ripe rice ears close up paddy
image.alt.en: Ripe rice in a field
image.alt.vi: Bông lúa chín ngoài đồng

### w2
id: 1e188665-9828-4d22-9ee2-a14fdaa46744
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: chuoi-thuc-an/chuoi-thuc-an-la-gi
prompt.en: Grass is food for a grasshopper.
prompt.vi: Cỏ là thức ăn của châu chấu.
image.brief: Dùng lại hình `explore_insects` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): grasshopper on leaf side view
image.alt.en: A grasshopper on a leaf
image.alt.vi: Con châu chấu trên lá
answer: true
hint.en: Remember the Arrow picture.
hint.vi: Em nhớ lại ô Mũi tên nhé.
explanation_correct.en: Yes! The arrow goes from grass to grasshopper.
explanation_correct.vi: Đúng rồi! Mũi tên đi từ cỏ sang châu chấu.
explanation_wrong.en: This is true. Grasshoppers eat grass.
explanation_wrong.vi: Câu này đúng. Châu chấu ăn cỏ.
feedback_false.en: A grasshopper nibbles grass and leaves.
feedback_false.vi: Châu chấu gặm cỏ và lá cây.

### w3
id: 7efadf98-2778-4f81-8e89-32aba56d071e
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/con-vat-an-gi
prompt.en: An owl eats grass.
prompt.vi: Con cú ăn cỏ.
image.brief: Dùng lại hình `explore_hunt` ở bài `chuoi-thuc-an/con-vat-kiem-an-the-nao`. Từ khoá tìm ảnh (EN): owl perched branch wild
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành
answer: false
hint.en: Remember the Meat-eaters picture.
hint.vi: Em nhớ lại ô Ăn thịt nhé.
explanation_correct.en: An owl is a meat-eater. It eats mice.
explanation_correct.vi: Cú là con vật ăn thịt. Cú ăn chuột.
explanation_wrong.en: This is false. An owl eats meat.
explanation_wrong.vi: Câu này sai. Cú ăn thịt.
feedback_true.en: An owl hunts mice, not grass.
feedback_true.vi: Cú săn chuột, không ăn cỏ.
> Gợi ý nhắc tên ô Học của chủ đề số một, bài sáu ("Meat-eaters" · "Ăn thịt"). Đáp án Sai: giải thích khi đúng không mở đầu bằng "Yes!".

## Học

> Bốn ô: cùng bắt đầu từ cây (hai chuỗi khác nhau), một cây là thức ăn của nhiều con, một con ăn nhiều thứ, so sánh hai chuỗi cùng có lúa và chuột. Hai ô "Same start" và "Compare" là hình ghép hai hàng.

### explore
id: ac4d1bd9-5e2a-449d-a67d-66f35f9090c4
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_same
label.en: Same start
label.vi: Cùng bắt đầu
color: gi_dong
sentence.en: Both chains start with a plant.
sentence.vi: Cả hai chuỗi đều bắt đầu từ một cây.
image.brief: [sơ đồ ghép ảnh] Khung 4:3, hai hàng thẳng cột. Hàng trên dùng lại nguyên `chuoi-thuc-an-la-gi/explore_chain` (cỏ, châu chấu, ếch). Hàng dưới cùng kiểu: lá cải (`chuoi-thuc-an-la-gi/tray_cabbage`), sâu (`chuoi-thuc-an-la-gi/explore_plant_food`, cắt sát con sâu), chim sẻ (`vi-sao-ta-phai-tho/tray_sparrow`); mũi tên chỉ sang phải; nền giấy trơn; không có chữ, không có số.
image.alt.en: Two food chains, each starting with a plant
image.alt.vi: Hai chuỗi thức ăn, chuỗi nào cũng bắt đầu từ cây
examples.1.en: grass, grasshopper, frog
examples.1.vi: cỏ, châu chấu, ếch
examples.2.en: cabbage, caterpillar, sparrow
examples.2.vi: lá cải, con sâu, chim sẻ
examples.3.en: the same: a plant comes first
examples.3.vi: giống nhau: cây đứng đầu
> Hai chuỗi bé đã gặp ở bài hai (ô Học và câu q4).

#### group explore_many
label.en: Food for many
label.vi: Thức ăn của nhiều con
color: vang_hoe
sentence.en: Rice is food for many animals.
sentence.vi: Lúa là thức ăn của nhiều con vật.
image.brief: Dùng lại hình `explore_start` ở bài `chuoi-thuc-an/moi-loai-mot-vai`. Từ khoá tìm ảnh (EN): ripe rice ears close up paddy
image.alt.en: Ripe rice in a field
image.alt.vi: Bông lúa chín ngoài đồng
examples.1.en: rice is food for mice
examples.1.vi: lúa là thức ăn của chuột
examples.2.en: rice is food for sparrows
examples.2.vi: lúa là thức ăn của chim sẻ
examples.3.en: rice is food for grasshoppers
examples.3.vi: lúa là thức ăn của châu chấu
> Ba ví dụ là ba nhóm của phần Chơi (động vật có vú, chim, côn trùng).

#### group explore_many_foods
label.en: Eats many foods
label.vi: Ăn nhiều thứ
color: cham
sentence.en: A frog eats many kinds of insects.
sentence.vi: Ếch ăn nhiều loại côn trùng.
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước
examples.1.en: a frog eats grasshoppers
examples.1.vi: ếch ăn châu chấu
examples.2.en: a frog eats flies
examples.2.vi: ếch ăn ruồi
examples.3.en: a frog eats worms, too
examples.3.vi: ếch ăn cả giun
examples.4.en: one chain shows just one food
examples.4.vi: mỗi chuỗi chỉ cho thấy một món ăn
> [CẦN KIỂM] Ếch đồng ăn châu chấu, ruồi, giun đất, cả cua, ốc nhỏ (biên tập nhớ). Ví dụ bốn là ý sửa `chain_shows_all_food`.

#### group explore_compare
label.en: Compare
label.vi: So sánh
color: nau_dat
sentence.en: What is the same? What is different?
sentence.vi: Cái gì giống nhau? Cái gì khác nhau?
image.brief: [sơ đồ ghép ảnh] Khung 4:3, hai hàng thẳng cột. Hàng trên dùng lại nguyên `moi-loai-mot-vai/explore_whole` (lúa, chuột, cú). Hàng dưới cùng kiểu: lúa (`moi-loai-mot-vai/explore_start`), chuột (`chuoi-thuc-an-la-gi/w2`), mèo (`khung-long-la-gi/w3_cat`, cắt vuông thấy cả con); mũi tên chỉ sang phải; nền giấy trơn; không có chữ, không có số, không đánh dấu chỗ giống, chỗ khác.
image.alt.en: Two food chains with rice and a mouse
image.alt.vi: Hai chuỗi thức ăn cùng có lúa và chuột
examples.1.en: same: rice and the mouse
examples.1.vi: giống nhau: lúa và con chuột
examples.2.en: different: the owl and the cat
examples.2.vi: khác nhau: con cú và con mèo
examples.3.en: the mouse is food for both
examples.3.vi: chuột là thức ăn của cả cú lẫn mèo
> Mẹo của sườn khi so sánh: hỏi "cái gì giống, cái gì khác". Câu của ô là hai câu hỏi đó.
> [CẦN KIỂM] Mèo bắt chuột (biên tập chắc). Mèo đứng cuối chuỗi, không bị ăn (`_topic.md`, An toàn).

### new_words
id: 83358196-1ed1-460c-954a-4608dcddf87e
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: compare, same, different

## Chơi

> Bé chọn ba con vật ăn lúa: một con côn trùng, một con động vật có vú, một con chim. Đạt khi đủ ba nhóm và không chọn con chỉ ăn thịt.
> Dùng ngay ô "Food for many": lúa có mặt ở đầu nhiều chuỗi. Ba nhóm theo tên nhóm của chủ đề số một, để bé ôn luôn cách nhóm con vật.
> Món bẫy là hai con chim chỉ ăn thịt (cú, cò), giống nhóm "Chim": bé phải nghĩ con đó ăn gì, không chọn theo dáng chim. Không dùng con mèo làm món bẫy (nhiều nhà cho mèo ăn cơm trộn cá).

### tray
id: fc1613b8-84d0-4ee4-a39d-09ad2f641d19
type: build_tray
version: 1
prompt.en: Pick three animals that eat rice
prompt.vi: Chọn ba con vật ăn lúa
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find an insect, a mammal and a bird.
messages.start.vi: Em tìm một con côn trùng, một con động vật có vú và một con chim nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Rice is food for all three.
messages.balanced.vi: Tuyệt! Lúa là thức ăn của cả ba con.
messages.has_limited.en: That one eats meat, not rice.
messages.has_limited.vi: Con này ăn thịt, không ăn lúa.
messages.missing.tray_insect.en: You still need an insect.
messages.missing.tray_insect.vi: Em còn thiếu một con côn trùng.
messages.missing.tray_mammal.en: You still need a mammal.
messages.missing.tray_mammal.vi: Em còn thiếu một con động vật có vú.
messages.missing.tray_bird.en: You still need a bird.
messages.missing.tray_bird.vi: Em còn thiếu một con chim.

#### group tray_insect
label.en: Insect
label.vi: Côn trùng
color: vang_hoe
role: required

#### group tray_mammal
label.en: Mammal
label.vi: Động vật có vú
color: nau_dat
role: required

#### group tray_bird
label.en: Bird
label.vi: Chim
color: cham
role: required

#### group tray_meat
label.en: Eats only meat
label.vi: Chỉ ăn thịt
color: do_son
role: limit

#### item tray_hen
label.en: Hen
label.vi: Con gà mái
group: tray_bird
image.brief: Dùng lại hình `w3_hen` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): brown hen standing farmyard side view
image.alt.en: A hen in a yard
image.alt.vi: Con gà mái trong sân

#### item tray_owl
label.en: Owl
label.vi: Con cú
group: tray_meat
image.brief: Dùng lại hình `explore_hunt` ở bài `chuoi-thuc-an/con-vat-kiem-an-the-nao`. Từ khoá tìm ảnh (EN): owl perched branch wild
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành

#### item tray_grasshopper
label.en: Grasshopper
label.vi: Con châu chấu
group: tray_insect
image.brief: Dùng lại hình `explore_insects` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): grasshopper on leaf side view
image.alt.en: A grasshopper on a leaf
image.alt.vi: Con châu chấu trên lá

#### item tray_sparrow
label.en: Sparrow
label.vi: Chim sẻ
group: tray_bird
image.brief: Dùng lại hình `tray_sparrow` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow on a branch
image.alt.vi: Chim sẻ đậu trên cành
> Dùng ảnh chim sẻ đậu trên cành, không dùng ảnh chim sẻ mổ thóc của bài một (ảnh đó nói sẵn con nào ăn lúa).

#### item tray_egret
label.en: Egret
label.vi: Con cò
group: tray_meat
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ

#### item tray_mouse
label.en: Mouse
label.vi: Con chuột
group: tray_mammal
image.brief: Dùng lại hình `w2` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`. Từ khoá tìm ảnh (EN): rice field rat sitting ground
image.alt.en: A mouse on the ground
image.alt.vi: Con chuột trên mặt đất

#### item tray_duck
label.en: Duck
label.vi: Con vịt
group: tray_bird
image.brief: Dùng lại hình `w1_duck` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): duck standing pond bank
image.alt.en: A duck standing on the grass
image.alt.vi: Con vịt đứng trên bãi cỏ
> [CẦN KIỂM] Gà, vịt, chim sẻ ăn thóc; châu chấu ăn lá lúa; cò không ăn lúa (biên tập nhớ). Nhóm "Chỉ ăn thịt": cú và cò ăn con vật (cò ăn cá, ếch, tôm, côn trùng).

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q3, q4; ba lựa chọn), `true_false` (q2, q6), `order_sequence` (q5, ba thẻ).

### q1
id: a604a726-29f9-4f7c-b577-44e9efdc280a
format: single_choice
version: 1
dok: 1
prompt.en: Which one can start a food chain?
prompt.vi: Đâu có thể đứng đầu một chuỗi thức ăn?
image.brief: Dùng lại hình `q3` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): village house yard Vietnam morning
image.alt.en: A yard in a village
image.alt.vi: Sân nhà ở làng quê
hint.en: Look for the plant.
hint.vi: Em tìm cái cây nhé.
explanation_correct.en: Yes! Cabbage starts many garden food chains.
explanation_correct.vi: Đúng rồi! Cây cải đứng đầu nhiều chuỗi thức ăn ngoài vườn.
explanation_wrong.en: The answer is the cabbage leaf. It is a plant.
explanation_wrong.vi: Đáp án là lá cải. Cải là cây.

#### option q1_frog
correct: false
feedback.en: A frog needs to eat insects first.
feedback.vi: Ếch cần ăn côn trùng trước đã.
label.en: frog
label.vi: con ếch
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

#### option q1_sparrow
correct: false
feedback.en: A sparrow eats seeds and insects.
feedback.vi: Chim sẻ ăn hạt và sâu bọ.
label.en: sparrow
label.vi: chim sẻ
image.brief: Dùng lại hình `tray_sparrow` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow on a branch
image.alt.vi: Chim sẻ đậu trên cành

#### option q1_cabbage
correct: true
label.en: cabbage leaf
label.vi: lá cải
image.brief: Dùng lại hình `tray_cabbage` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`. Từ khoá tìm ảnh (EN): green cabbage leaf vegetable garden
image.alt.en: A green cabbage leaf
image.alt.vi: Lá cải xanh

### q2
id: ed693420-24b5-49b9-bf7a-87610f41d050
format: true_false
version: 1
dok: 1
prompt.en: A frog is food for an egret.
prompt.vi: Ếch là thức ăn của cò.
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ
answer: true
hint.en: What does an egret catch?
hint.vi: Em nghĩ xem cò hay bắt con gì?
explanation_correct.en: Yes! Egrets catch frogs in the rice field.
explanation_correct.vi: Đúng rồi! Cò bắt ếch ngoài ruộng lúa.
explanation_wrong.en: This is true. Egrets eat frogs.
explanation_wrong.vi: Câu này đúng. Cò ăn ếch.
feedback_false.en: An egret catches frogs with its long beak.
feedback_false.vi: Cò bắt ếch bằng cái mỏ dài.
> Ếch có mặt ở một chuỗi khác (ếch là thức ăn của cò), chuẩn bị câu q6: một con vật ở nhiều chuỗi. Bé đã nghe "cò ăn ếch" ở bài hai (ví dụ hai ô "Food from animals") và chủ đề số một bài sáu.

### q3
id: 77eecd2e-dbb3-4423-a269-da4616a2d547
format: single_choice
version: 1
dok: 1
prompt.en: Which one eats rice, like a mouse?
prompt.vi: Con nào ăn lúa giống con chuột?
image.brief: Dùng lại hình `q3` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): village house yard Vietnam morning
image.alt.en: A yard in a village
image.alt.vi: Sân nhà ở làng quê
hint.en: Remember the Food for many picture.
hint.vi: Em nhớ lại ô Thức ăn của nhiều con nhé.
explanation_correct.en: Yes! Sparrows peck rice grains in the field.
explanation_correct.vi: Đúng rồi! Chim sẻ mổ thóc ngoài đồng.
explanation_wrong.en: The answer is the sparrow. It eats rice.
explanation_wrong.vi: Đáp án là chim sẻ. Chim sẻ ăn thóc.
> Ba lựa chọn đều là chim, đều bé đã gặp ở phần Chơi; bé phải nghĩ con đó ăn gì, không chọn theo dáng. Ảnh chim sẻ đậu trên cành, không phải ảnh mổ thóc (bằng chứng).

#### option q3_owl
correct: false
feedback.en: An owl eats mice, not rice.
feedback.vi: Cú ăn chuột, không ăn lúa.
label.en: owl
label.vi: con cú
image.brief: Dùng lại hình `explore_hunt` ở bài `chuoi-thuc-an/con-vat-kiem-an-the-nao`. Từ khoá tìm ảnh (EN): owl perched branch wild
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành

#### option q3_egret
correct: false
feedback.en: An egret eats fish and frogs.
feedback.vi: Cò ăn cá và ếch nhái.
label.en: egret
label.vi: con cò
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ

#### option q3_sparrow
correct: true
label.en: sparrow
label.vi: chim sẻ
image.brief: Dùng lại hình `tray_sparrow` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow on a branch
image.alt.vi: Chim sẻ đậu trên cành

### q4
id: dbede660-be63-4417-a723-32aac47992f4
format: single_choice
version: 1
dok: 2
prompt.en: A mouse is food for an owl. Who else eats mice?
prompt.vi: Chuột là thức ăn của cú. Còn con nào ăn chuột nữa?
image.brief: Dùng lại hình `q3` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): village house yard Vietnam morning
image.alt.en: A yard in a village
image.alt.vi: Sân nhà ở làng quê
hint.en: Remember the Compare picture.
hint.vi: Em nhớ lại ô So sánh nhé.
explanation_correct.en: Yes! The mouse is in both chains.
explanation_correct.vi: Đúng rồi! Con chuột có mặt trong cả hai chuỗi.
explanation_wrong.en: The answer is the cat. Cats catch mice.
explanation_wrong.vi: Đáp án là con mèo. Mèo bắt chuột.
> DOK 2: so sánh hai chuỗi (ô "Compare") để thấy một con vật là thức ăn của nhiều con. Hai câu EN bảy và bốn từ, cả màn mười một từ. Hai lựa chọn sai là con ăn cây (trâu, châu chấu).

#### option q4_cat
correct: true
label.en: cat
label.vi: con mèo
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

#### option q4_buffalo
correct: false
feedback.en: A buffalo eats only plants.
feedback.vi: Trâu chỉ ăn thực vật.
label.en: buffalo
label.vi: con trâu
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu

#### option q4_grasshopper
correct: false
feedback.en: A grasshopper eats leaves, not mice.
feedback.vi: Châu chấu ăn lá, không ăn chuột.
label.en: grasshopper
label.vi: con châu chấu
image.brief: Dùng lại hình `explore_insects` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): grasshopper on leaf side view
image.alt.en: A grasshopper on a leaf
image.alt.vi: Con châu chấu trên lá

### q5
id: dc03716c-6e67-46a8-adeb-545ae7ff7e41
format: order_sequence
version: 1
dok: 2
prompt.en: Tap the food chain in order.
prompt.vi: Em chạm theo thứ tự của chuỗi thức ăn nhé.
image.brief: Dùng lại hình `q3` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): village house yard Vietnam morning
image.alt.en: A yard in a village
image.alt.vi: Sân nhà ở làng quê
answer: q5_rice, q5_grasshopper, q5_hen
hint.en: Who eats the grasshopper?
hint.vi: Em nghĩ xem con nào ăn châu chấu?
explanation_correct.en: Yes! A hen eats rice and grasshoppers.
explanation_correct.vi: Đúng rồi! Gà ăn cả thóc lẫn châu chấu.
explanation_wrong.en: The order is rice, grasshopper, hen.
explanation_wrong.vi: Thứ tự là cây lúa, châu chấu, con gà mái.
> DOK 2: chuỗi mới có châu chấu ở giữa và gà ở cuối (bài ba q5 là lúa, châu chấu, ếch), để bé thấy cùng một con châu chấu ở chuỗi khác. Gà cũng ăn lúa, nhưng gà không là thức ăn của châu chấu, nên chỉ có một thứ tự đúng. Thẻ trong file không theo thứ tự đúng.
> Rà chữ tester 14/11 (N3): phần Chơi ngay trước vừa xếp gà vào nhóm "ăn lúa", nên lúa → gà là đường nghĩ hợp lý mà sai. Sửa cả hai chỗ: `hint` chỉ vào mắt xích gây lẫn ("Con nào ăn châu chấu?"), `explanation_correct` nói gà ăn cả thóc lẫn châu chấu, gỡ chỗ bé thấy mâu thuẫn.
> [CẦN KIỂM] Gà bắt châu chấu để ăn (biên tập chắc).

#### item q5_grasshopper
label.en: grasshopper
label.vi: con châu chấu
image.brief: Dùng lại hình `explore_insects` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): grasshopper on leaf side view
image.alt.en: A grasshopper on a leaf
image.alt.vi: Con châu chấu trên lá

#### item q5_hen
label.en: hen
label.vi: con gà mái
image.brief: Dùng lại hình `w3_hen` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): brown hen standing farmyard side view
image.alt.en: A hen in a yard
image.alt.vi: Con gà mái trong sân

#### item q5_rice
label.en: rice
label.vi: cây lúa
image.brief: Dùng lại hình `explore_start` ở bài `chuoi-thuc-an/moi-loai-mot-vai`. Từ khoá tìm ảnh (EN): ripe rice ears close up paddy
image.alt.en: Ripe rice in a field
image.alt.vi: Bông lúa chín ngoài đồng

### q6
id: 8b337ad2-ed50-409a-a4f1-01a4b7f00fd9
format: true_false
version: 1
dok: 2
misconception: chain_shows_all_food
prompt.en: A frog eats only grasshoppers.
prompt.vi: Ếch chỉ ăn châu chấu.
image.brief: Dùng lại hình `explore_chain` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`.
image.alt.en: Grass, a grasshopper, then a frog
image.alt.vi: Cỏ, con châu chấu, rồi con ếch
answer: false
hint.en: Remember the Eats many foods picture.
hint.vi: Em nhớ lại ô Ăn nhiều thứ nhé.
explanation_correct.en: A chain shows one food. Frogs eat many.
explanation_correct.vi: Mỗi chuỗi chỉ cho thấy một món. Ếch ăn nhiều món.
explanation_wrong.en: This is false. Frogs eat many insects.
explanation_wrong.vi: Câu này sai. Ếch ăn nhiều loại côn trùng.
feedback_true.en: A frog eats flies and worms, too.
feedback_true.vi: Ếch còn ăn cả ruồi và giun.
> Câu misconception (`chain_shows_all_food`), bằng hình: hình chuỗi chỉ có châu chấu là thức ăn của ếch. Bé còn nghĩ "chuỗi cho thấy hết mọi thứ con vật ăn" sẽ chạm gật đầu.
> DOK 2: suy ra từ ô "Eats many foods" rằng hình chuỗi chỉ là một phần. "Only" là câu khẳng định, không phải phủ định; nghe thử giọng VI nhấn chữ "chỉ".
> Hình gốc là hình ghép nên không có dòng từ khoá để chép. Đáp án Sai: giải thích khi đúng không mở đầu bằng "Yes!".

## Từ vựng

### compare
id: c1937fc5-dd00-4662-a468-e1422a923d46
tier: core
term.en: compare
term.vi: so sánh
example.en: Compare the owl and the cat.
example.vi: So sánh con cú với con mèo.
image.brief: Dùng lại hình `explore_hunt` ở bài `chuoi-thuc-an/con-vat-kiem-an-the-nao`. Từ khoá tìm ảnh (EN): owl perched branch wild
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành
> Rà chữ tester 14/11 (N4): thẻ Từ mới là khung 2:1 nhỏ (khoảng 153 × 76 pt), hình ghép hai hàng sáu ảnh bị cắt mất một hàng. Đổi sang ảnh đơn dáng ngang. Thẻ `compare` (cú) đi cặp với thẻ `different` (mèo): hai con ở cuối hai chuỗi của ô "Compare".

### same
id: c5ed2626-9def-446c-9cc8-38a0222baa19
tier: core
term.en: same
term.vi: giống nhau
example.en: Both chains start with rice.
example.vi: Cả hai chuỗi đều bắt đầu từ lúa.
image.brief: Dùng lại hình `explore_start` ở bài `chuoi-thuc-an/moi-loai-mot-vai`. Từ khoá tìm ảnh (EN): ripe rice ears close up paddy
image.alt.en: Ripe rice in a field
image.alt.vi: Bông lúa chín ngoài đồng
> Rà chữ tester 14/11 (N4): ảnh đơn bông lúa (chỗ giống nhau của hai chuỗi ở ô "Compare") thay hình ghép hai hàng.

### different
id: b97e22f6-f6ad-49d1-9770-c1cefdc3f603
tier: core
term.en: different
term.vi: khác nhau
example.en: Owls and cats look different.
example.vi: Cú và mèo trông khác nhau.
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

### both
id: d5816070-fbfb-46c3-8091-cf2c4f61de3a
tier: extra
term.en: both
term.vi: cả hai
example.en: The mouse is in both chains.
example.vi: Con chuột có mặt trong cả hai chuỗi.
image.brief: Dùng lại hình `w2` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`. Từ khoá tìm ảnh (EN): rice field rat sitting ground
image.alt.en: A mouse on the ground
image.alt.vi: Con chuột trên mặt đất

## Thưởng

### egret_card
id: ef06ce5b-3e7f-4169-a0e5-8a933942b976
set: animals
rarity: common
name.en: Egret
name.vi: Con cò
tag.en: In many food chains
tag.vi: Có mặt trong nhiều chuỗi
fact.en: An egret follows buffaloes to catch insects.
fact.vi: Con cò hay đi theo trâu để bắt côn trùng.
image.brief: [ảnh] Một con cò lông trắng (cò ruồi, loài cò trắng hay theo trâu) đứng trên lưng con trâu hoặc đi cạnh chân trâu ngoài đồng cỏ, ảnh vuông hoặc ngang, thấy cả con cò và một phần thân trâu; không có người, không có chữ. Từ khoá tìm ảnh (EN): cattle egret on water buffalo
image.alt.en: An egret beside a buffalo
image.alt.vi: Con cò bên cạnh con trâu
> [CẦN KIỂM] Cò ruồi theo trâu, bò để bắt côn trùng bị khua bay lên khỏi cỏ (biên tập nhớ). Thẻ cuối chủ đề: con cò ăn cá, ếch, côn trùng, nên có mặt trong nhiều chuỗi. Cảnh cò trên lưng trâu là cảnh đồng quê quen thuộc.
> Rà chữ tester 14/11 (n8): tên cho bé thống nhất "Egret" · "Con cò" như cả chủ đề; "cò ruồi" chỉ còn trong `brief` để người chọn ảnh tìm đúng loài. Người chọn ảnh nên chọn ảnh cò cho `ho-hap/vi-sao-ta-phai-tho` `tray_egret` và thẻ này trông cùng một loài cò trắng.

## Ghi chú cho hoạ sĩ

- **Loại hình:** ảnh chụp thật, cộng hai hình ghép hai hàng (`explore_same`, `explore_compare`). Hình câu q1, q3, q4, q5 là hình vẽ sân nhà dùng lại của *Hô hấp* (hình câu hỏi, Explorer ẩn ở câu có thẻ).
- **Ảnh cần tìm (một):** thẻ thưởng: con cò trắng (cò ruồi) trên lưng trâu hoặc cạnh trâu.
- **Từ vựng `compare`, `same`** (rà chữ tester 14/11, N4): không dùng hình ghép hai hàng nữa; dùng lại ảnh đơn cú (`con-vat-kiem-an-the-nao/explore_hunt`) và bông lúa (`moi-loai-mot-vai/explore_start`), cắt khung 2:1.
- **Hình ghép (hai):** hai hàng thẳng cột, mỗi hàng là một chuỗi ba món; hàng trên dùng lại nguyên hình ghép đã có (`explore_chain` bài hai, `explore_whole` bài ba). Không đánh dấu chỗ giống, chỗ khác (bé tự tìm).
- **q1, q3, q4:** ba lựa chọn cùng cỡ vật trong khung 5:2; q3 ba con chim cùng kiểu chụp (đậu hoặc bay, nền thật). Chim sẻ dùng ảnh đậu trên cành, không dùng ảnh mổ thóc.
- **q5 (`order_sequence`):** lúa, châu chấu, gà mái cắt vuông, cùng cỡ.
- **Kệ Chơi:** bảy món đều là ảnh đã có; chim sẻ dùng ảnh đậu trên cành.
- **Màu:** Học: cùng bắt đầu từ cây `gi_dong`, thức ăn của nhiều con `vang_hoe`, ăn nhiều thứ `cham`, so sánh `nau_dat`. Chơi: côn trùng `vang_hoe`, động vật có vú `nau_dat`, chim `cham`, chỉ ăn thịt `do_son`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (bốn nhóm), `word_list` (compare, same, different).
  - Chơi: `build_tray`: ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món.
  - Khởi động: `single_choice` (w1, hai lựa chọn, ôn bài ba), `true_false` (w2 Đúng, ôn bài hai; w3 Sai, ôn chủ đề số một bài sáu).
  - Quiz: `single_choice` (q1, q3, q4), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q5). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`chain_shows_all_food`).
- **Vị trí đáp án đúng:** w1 thứ hai; q1 thứ ba; q3 thứ ba; q4 thứ nhất. q5: thẻ trong file châu chấu, gà mái, lúa → đúng: lúa, châu chấu, gà mái.
- **Màn Chơi, ví dụ để kiểm:** Con châu chấu, Con chuột, Con vịt → `balanced`; Con chuột, Chim sẻ, Con cú → `has_limited`; Con gà mái, Chim sẻ, Con chuột → `missing.tray_insect`.
- **Từ EN có thể ngoài Starters/Movers:** compare, different, egret, grasshopper, insect, mammal, peck, grains.
