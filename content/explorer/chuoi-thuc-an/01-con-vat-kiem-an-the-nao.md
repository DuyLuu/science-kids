---
id: 5baed54e-4d19-4d7a-b7c2-307dbd8e0887
topic: chuoi-thuc-an
slug: con-vat-kiem-an-the-nao
order: 1
stage: opener
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: How animals get food
vi: Con vật kiếm ăn thế nào?
> Giữ đúng tên ở `content/syllabus.json` (`introduction-to-food-chains`, bài số một).

## Mục tiêu
en: I can tell how animals get their food.
vi: Em kể được các con vật kiếm thức ăn bằng cách nào.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 14/11/2026. Mọi dòng `id:` để trống.
> Bài mở chủ đề. Chưa có chuỗi thức ăn; bé học ba cách kiếm ăn (gặm cỏ, săn mồi, được người cho ăn) để bài hai nối chúng thành chuỗi. Sửa `people_feed_all_animals` ở ý chính hai và ba, ba ô Học, phần Chơi, câu q5 và câu q6 (gắn key).

## Ý chính
1.en: Animals need food to live and grow.
1.vi: Con vật cần thức ăn để sống và lớn lên.
2.en: Some animals graze. Some animals hunt.
2.vi: Có con gặm cỏ. Có con săn mồi.
3.en: People feed pets and farm animals.
3.vi: Người cho thú cưng và vật nuôi trong chuồng ăn.
> Từ cụ thể tới trừu tượng: con vật bé thấy đang ăn, hai cách tự kiếm ăn, rồi cách thứ ba (người cho ăn) để so với con vật hoang dã. Vế "dùng mắt, tai, mũi" của sườn nằm ở ô Học "Hunt".

## Khởi động

> Ba câu ôn chủ đề số một: w1 bài sáu (ăn thực vật), w2 bài một (thú cưng được người chăm), w3 bài bảy (côn trùng sáu chân; châu chấu sẽ vào chuỗi ở bài hai).

### w1
id: a6cc90fe-2155-40e9-9bd6-ceda0bb4f83f
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/con-vat-an-gi
prompt.en: Which one eats only plants?
prompt.vi: Con nào chỉ ăn thực vật?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Remember the Plant-eaters picture.
hint.vi: Em nhớ lại ô Ăn thực vật nhé.
explanation_correct.en: Yes! A rabbit eats grass and leaves.
explanation_correct.vi: Đúng rồi! Thỏ ăn cỏ và lá rau.
explanation_wrong.en: The answer is the rabbit. It eats plants.
explanation_wrong.vi: Đáp án là con thỏ. Thỏ ăn thực vật.
> Gợi ý nhắc tên ô Học của chủ đề số một, bài sáu ("Plant-eaters" · "Ăn thực vật").

#### option w1_croc
correct: false
feedback.en: A crocodile eats fish and other animals.
feedback.vi: Cá sấu ăn cá và những con vật khác.
label.en: crocodile
label.vi: cá sấu
image.brief: Dùng lại hình `q1_reptiles` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): Siamese crocodile basking riverbank side view
image.alt.en: A crocodile on a riverbank
image.alt.vi: Con cá sấu trên bờ sông

#### option w1_rabbit
correct: true
label.en: rabbit
label.vi: con thỏ
image.brief: Dùng lại hình `explore_fur` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): white rabbit sitting grass
image.alt.en: A white rabbit on the grass
image.alt.vi: Con thỏ trắng trên cỏ

### w2
id: 25a75dc6-9cf2-488a-bf62-583f93c578d3
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha
prompt.en: People feed a pet goldfish.
prompt.vi: Cá vàng nuôi trong nhà được người cho ăn.
image.brief: Dùng lại hình `tray_goldfish` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): goldfish aquarium plants side view
image.alt.en: A goldfish in a tank
image.alt.vi: Cá vàng trong bể
answer: true
hint.en: Can a goldfish leave its tank?
hint.vi: Cá vàng có tự ra khỏi bể được không?
explanation_correct.en: Yes! We drop food into its tank.
explanation_correct.vi: Đúng rồi! Mình thả thức ăn vào bể cho cá.
explanation_wrong.en: This is true. People feed pet goldfish.
explanation_wrong.vi: Câu này đúng. Người cho cá vàng ăn.
feedback_false.en: A goldfish in a tank waits for food.
feedback_false.vi: Cá vàng trong bể chờ người cho ăn.
> Ôn ý "thú cưng được người chăm sóc" của chủ đề số một bài một; mở đường cho ô Học "Fed by people".

### w3
id: 7ce87fd0-42db-41e4-8e8c-204a7ba1f490
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan
prompt.en: A grasshopper has eight legs.
prompt.vi: Con châu chấu có tám chân.
image.brief: Dùng lại hình `explore_insects` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): grasshopper on leaf side view
image.alt.en: A grasshopper on a leaf
image.alt.vi: Con châu chấu trên lá
answer: false
hint.en: Count the legs on the grasshopper.
hint.vi: Em đếm chân con châu chấu nhé.
explanation_correct.en: A grasshopper is an insect. It has six legs.
explanation_correct.vi: Châu chấu là côn trùng. Châu chấu có sáu chân.
explanation_wrong.en: This is false. A grasshopper has six legs.
explanation_wrong.vi: Câu này sai. Châu chấu có sáu chân.
feedback_true.en: Spiders have eight legs, grasshoppers six.
feedback_true.vi: Nhện có tám chân, châu chấu có sáu.
> Ôn bài bảy của chủ đề số một (côn trùng sáu chân, nhện tám chân). Châu chấu là con vật chính của chuỗi ở bài hai. Hình là chính con châu chấu, đếm được chân (DOK 1 quan sát, như bài bảy q3 của chủ đề số một).
> Đáp án Sai: giải thích khi đúng không mở đầu bằng "Yes!".

## Học

> Bốn ô: cần thức ăn, gặm cỏ, săn mồi, được người cho ăn. Ô "Hunt" nói cả giác quan (cú lắng nghe tiếng chuột; ví dụ ba: mắt, tai, mũi).
> Tên ô là chữ dễ; câu của ô có từ mới (graze, hunt, feed) ngay cạnh hình.

### explore
id: 87f7163a-475e-466e-9645-b0708b99e5fb
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_need
label.en: Need food
label.vi: Cần thức ăn
color: nau_dat
sentence.en: All animals need food to live.
sentence.vi: Con vật nào cũng cần thức ăn để sống.
image.brief: [ảnh] Một con chim sẻ đứng trên mặt đất hoặc sân gạch, cúi mổ hạt thóc rơi vãi, nhìn ngang, thấy cả con; ảnh ngang, nền đơn giản; không có người, không có chữ. Từ khoá tìm ảnh (EN): tree sparrow pecking rice grains ground
image.alt.en: A sparrow pecking at rice
image.alt.vi: Chim sẻ mổ thóc
examples.1.en: food helps animals grow
examples.1.vi: thức ăn giúp con vật lớn lên
examples.2.en: food helps animals run and fly
examples.2.vi: thức ăn giúp con vật chạy nhảy, bay lượn
examples.3.en: food keeps animals healthy
examples.3.vi: thức ăn giúp con vật khoẻ mạnh
> Hình gốc. Chỉ dùng ở ô này và từ `food`; không dùng ở câu "con nào ăn lúa" của bài bốn (ảnh mổ thóc là bằng chứng của đáp án).

#### group explore_graze
label.en: Graze
label.vi: Gặm cỏ
color: gi_dong
sentence.en: A buffalo grazes on grass in the field.
sentence.vi: Trâu gặm cỏ ngoài đồng.
image.brief: Dùng lại hình `explore_plants` ở bài `goi-ten-va-nhom-dong-vat/con-vat-an-gi`. Từ khoá tìm ảnh (EN): water buffalo grazing grass field
image.alt.en: A buffalo eating grass
image.alt.vi: Con trâu gặm cỏ
examples.1.en: a cow grazes in the field
examples.1.vi: bò gặm cỏ ngoài bãi
examples.2.en: a goat grazes on the hill
examples.2.vi: dê gặm cỏ trên đồi
examples.3.en: they eat the grass around them
examples.3.vi: chúng ăn cỏ mọc quanh chỗ mình
> Không dùng ở câu hỏi nào (là bằng chứng của q1). Câu q1 dùng ảnh trâu bên suối.

#### group explore_hunt
label.en: Hunt
label.vi: Săn mồi
color: vang_hoe
sentence.en: An owl hunts. It listens for mice.
sentence.vi: Cú săn mồi. Cú lắng nghe tiếng chuột.
image.brief: [ảnh] Một con cú (cú lợn hoặc cú mèo) đậu trên một cành cây ngang hoặc cọc tre, mắt mở to, nhìn thẳng; ảnh ngang, chụp hơi xa để cả con cú và một đoạn cành nằm gọn giữa khung, thấy từ đầu tới chân; nền lá mờ; không có con mồi, không có máu, không có lồng, không có găng tay hay người, không có chữ. Từ khoá tìm ảnh (EN): owl perched branch wild
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành
examples.1.en: a cat watches for mice
examples.1.vi: mèo rình chuột
examples.2.en: an egret looks for fish
examples.2.vi: cò rình bắt cá
examples.3.en: they use eyes, ears and nose
examples.3.vi: chúng dùng mắt, tai và mũi để tìm mồi
> [CẦN KIỂM] Cú săn chuột chủ yếu nhờ nghe (biên tập nhớ: cú lợn bắt được chuột trong bóng tối nhờ tai). Ví dụ ba là ý "dùng giác quan" của sườn.
> Hình gốc cho cả chủ đề (hai mươi chỗ dùng lại, kể cả từ `compare` bài bốn). Thẻ 3 lựa chọn là khung 5:2: con cú đứng cao nên phải chụp xa, hoặc designer chọn thêm một ảnh cú dáng ngang cho thẻ 5:2 (SK-043). Không dùng ảnh cú bay ngậm mồi.

#### group explore_fed
label.en: Fed by people
label.vi: Được người cho ăn
color: cham
sentence.en: People feed farm animals and pets.
sentence.vi: Người cho vật nuôi và thú cưng ăn.
image.brief: [ảnh] Một bàn tay người rải thóc cho đàn gà trong sân đất, chỉ thấy bàn tay và cổ tay ở mép khung, đàn gà đang mổ thóc; ảnh ngang; không thấy mặt người, không có chữ, không có bao bì có nhãn. Từ khoá tìm ảnh (EN): hand feeding chickens grain yard
image.alt.en: A hand feeding rice to hens
image.alt.vi: Bàn tay rải thóc cho gà
examples.1.en: hens eat the rice we give
examples.1.vi: gà ăn thóc mình rải cho
examples.2.en: a dog eats from its bowl
examples.2.vi: chó ăn trong bát của nó
examples.3.en: silkworms eat mulberry leaves we pick
examples.3.vi: tằm ăn lá dâu do người hái
> Ví dụ ba là cảnh quen ở làng nghề dâu tằm. Câu q5 dùng ý gà vừa được cho ăn vừa tự bới giun.
> Nếu không có ảnh tay rải thóc mà không thấy mặt, phương án thay: đàn gà mổ thóc trong máng gỗ (không có người).

### new_words
id: 3700c6c6-931a-4b7c-b00c-98bafa1ef4a8
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: food, hunt, graze

## Chơi

> Bé chọn ba con vật: một con gặm cỏ, một con săn mồi, một con được người cho ăn. Đạt khi đủ ba nhóm và không chọn thứ không phải vật sống.
> Món bẫy giống một nhóm: cánh diều hình chim trông như chim săn mồi; vịt cao su trông như con vật nuôi. Nhóm "Không phải vật sống" nối sang chủ đề *Sinh vật sống ở đâu?*.
> Trâu là vật nuôi nên cũng có lúc được cho rơm; ở kệ này trâu thuộc nhóm "Gặm cỏ". Bé nghĩ trâu "được người cho ăn" mà chọn trâu cùng cú và cá vàng thì vẫn đạt (trâu tính vào nhóm gặm cỏ), nên app không nói điều trái với ý bé.

### tray
id: 9dd3f315-6420-4ea0-9806-cd1b8c114f57
type: build_tray
version: 1
prompt.en: Pick three animals that get food differently
prompt.vi: Chọn ba con vật kiếm ăn khác nhau
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Graze, hunt, or fed? Pick one each.
messages.start.vi: Em chọn một con gặm cỏ, một con săn mồi, một con được người cho ăn nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Animals get food in many ways.
messages.balanced.vi: Tuyệt! Con vật kiếm ăn bằng nhiều cách.
messages.has_limited.en: That one is not alive. It does not eat.
messages.has_limited.vi: Thứ này không phải vật sống. Nó không ăn.
messages.missing.tray_graze.en: You still need one that grazes.
messages.missing.tray_graze.vi: Em còn thiếu một con gặm cỏ.
messages.missing.tray_hunt.en: You still need one that hunts.
messages.missing.tray_hunt.vi: Em còn thiếu một con săn mồi.
messages.missing.tray_fed.en: You still need one people feed.
messages.missing.tray_fed.vi: Em còn thiếu một con được người cho ăn.

#### group tray_graze
label.en: Grazes
label.vi: Gặm cỏ
color: gi_dong
role: required

#### group tray_hunt
label.en: Hunts
label.vi: Săn mồi
color: vang_hoe
role: required

#### group tray_fed
label.en: Fed by people
label.vi: Được người cho ăn
color: cham
role: required

#### group tray_not
label.en: Not alive
label.vi: Không phải vật sống
color: do_son
role: limit

#### item tray_owl
label.en: Owl
label.vi: Con cú
group: tray_hunt
image.brief: Dùng lại hình `explore_hunt`. Từ khoá tìm ảnh (EN): owl perched branch wild
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành

#### item tray_goldfish
label.en: Goldfish
label.vi: Cá vàng
group: tray_fed
image.brief: Dùng lại hình `tray_goldfish` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): goldfish aquarium plants side view
image.alt.en: A goldfish in a tank
image.alt.vi: Cá vàng trong bể

#### item tray_kite
label.en: Kite
label.vi: Cánh diều
group: tray_not
image.brief: Dùng lại hình `tray_kite` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): child flying kite field back view
image.alt.en: A bird-shaped kite in the sky
image.alt.vi: Cánh diều hình con chim trên trời

#### item tray_buffalo
label.en: Buffalo
label.vi: Con trâu
group: tray_graze
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu

#### item tray_egret
label.en: Egret
label.vi: Con cò
group: tray_hunt
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ

#### item tray_rubber_duck
label.en: Rubber duck
label.vi: Vịt cao su
group: tray_not
image.brief: Dùng lại hình `tray_rubber_duck` ở bài `goi-ten-va-nhom-dong-vat/co-the-cac-con-vat`. Từ khoá tìm ảnh (EN): yellow rubber duck side view
image.alt.en: A yellow rubber duck
image.alt.vi: Con vịt cao su màu vàng

#### item tray_dog
label.en: Dog
label.vi: Con chó
group: tray_fed
image.brief: Dùng lại hình `explore_pets` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): yellow dog lying porch Vietnam
image.alt.en: A dog lying on the floor
image.alt.vi: Chú chó nằm trên sàn nhà

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1, q3, q4; ba lựa chọn), `true_false` (q2, q5, q6). Bài này chưa có chuỗi nên không dùng `order_sequence`.

### q1
id: ba94c6a4-48cb-4e57-9f6f-b29fad517d06
format: single_choice
version: 1
dok: 1
prompt.en: Which animal grazes on grass?
prompt.vi: Con nào gặm cỏ?
image.brief: Dùng lại hình `q3` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): village house yard Vietnam morning
image.alt.en: A yard in a village
image.alt.vi: Sân nhà ở làng quê
hint.en: Remember the Graze picture.
hint.vi: Em nhớ lại ô Gặm cỏ nhé.
explanation_correct.en: Yes! A buffalo chews grass with big, flat teeth.
explanation_correct.vi: Đúng rồi! Trâu nhai cỏ bằng những chiếc răng to, phẳng.
explanation_wrong.en: The answer is the buffalo. It eats grass.
explanation_wrong.vi: Đáp án là con trâu. Trâu gặm cỏ.
> Lựa chọn đúng là ảnh trâu bên suối, không phải ảnh trâu gặm cỏ của ô Học (bằng chứng). Ba con khác nhau rõ: trâu, cú, cá vàng.
> [CẦN KIỂM] Răng hàm của trâu to và phẳng để nghiền cỏ (biên tập nhớ; trâu không có răng cửa hàm trên). Câu EN tám từ, tính "big, flat" là hai từ.

#### option q1_buffalo
correct: true
label.en: buffalo
label.vi: con trâu
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu

#### option q1_owl
correct: false
feedback.en: An owl hunts mice at night.
feedback.vi: Cú săn chuột vào ban đêm.
label.en: owl
label.vi: con cú
image.brief: Dùng lại hình `explore_hunt`. Từ khoá tìm ảnh (EN): owl perched branch wild
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành

#### option q1_goldfish
correct: false
feedback.en: A goldfish eats food from people.
feedback.vi: Cá vàng ăn thức ăn người cho.
label.en: goldfish
label.vi: cá vàng
image.brief: Dùng lại hình `tray_goldfish` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): goldfish aquarium plants side view
image.alt.en: A goldfish in a tank
image.alt.vi: Cá vàng trong bể

### q2
id: 93b00572-78dc-4e30-8389-2f18e24ff34b
format: true_false
version: 1
dok: 1
prompt.en: An owl hunts for its food.
prompt.vi: Con cú tự săn mồi để ăn.
image.brief: Dùng lại hình `explore_hunt`. Từ khoá tìm ảnh (EN): owl perched branch wild
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành
answer: true
hint.en: Remember the Hunt picture.
hint.vi: Em nhớ lại ô Săn mồi nhé.
explanation_correct.en: Yes! An owl flies quietly to catch mice.
explanation_correct.vi: Đúng rồi! Cú bay rất êm để bắt chuột.
explanation_wrong.en: This is true. An owl hunts mice.
explanation_wrong.vi: Câu này đúng. Cú săn chuột.
feedback_false.en: An owl catches mice with its feet.
feedback_false.vi: Cú bắt chuột bằng móng chân.
> Hình là chính con cú đang đậu, không có con mồi (vật được nói tới, không phải bằng chứng).
> [CẦN KIỂM] Cú bay gần như không tiếng động; cú quắp mồi bằng móng chân (biên tập nhớ).

### q3
id: 33f6d9d4-d711-4aea-bdb5-bcd687b7b9f2
format: single_choice
version: 1
dok: 1
prompt.en: Which one do people feed?
prompt.vi: Con nào được người cho ăn?
image.brief: Dùng lại hình `w1` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): rice field wind waves Vietnam
image.alt.en: Wind blowing over a rice field
image.alt.vi: Gió thổi trên cánh đồng lúa
hint.en: Think of an animal kept at home.
hint.vi: Em nghĩ tới con vật nuôi trong nhà nhé.
explanation_correct.en: Yes! Give a goldfish just a little food.
explanation_correct.vi: Đúng rồi! Cho cá vàng ăn ít thôi nhé.
explanation_wrong.en: The answer is the goldfish. People feed it.
explanation_wrong.vi: Đáp án là cá vàng. Người cho cá vàng ăn.
> Hình câu hỏi là ruộng lúa, không phải ao hay sân nhà (hai cảnh đó đẩy bé về phía cá vàng). Hai lựa chọn sai là hai con tự săn mồi, bé vừa gặp ở Học và Chơi.
> [CẦN KIỂM] Lời khuyên chăm cá: cho cá vàng ăn ít, cá ăn quá nhiều dễ chết, nước bẩn (biên tập nhớ).

#### option q3_egret
correct: false
feedback.en: An egret catches fish in the field.
feedback.vi: Cò tự bắt cá ngoài đồng.
label.en: egret
label.vi: con cò
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ

#### option q3_owl
correct: false
feedback.en: An owl catches its own mice.
feedback.vi: Cú tự bắt chuột để ăn.
label.en: owl
label.vi: con cú
image.brief: Dùng lại hình `explore_hunt`. Từ khoá tìm ảnh (EN): owl perched branch wild
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành

#### option q3_goldfish
correct: true
label.en: goldfish
label.vi: cá vàng
image.brief: Dùng lại hình `tray_goldfish` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): goldfish aquarium plants side view
image.alt.en: A goldfish in a tank
image.alt.vi: Cá vàng trong bể

### q4
id: f9a8e394-e1bd-4f69-8ff2-f44fef179224
format: single_choice
version: 1
dok: 2
prompt.en: Which one gets food like an owl?
prompt.vi: Con nào kiếm ăn giống con cú?
image.brief: Dùng lại hình `explore_hunt`. Từ khoá tìm ảnh (EN): owl perched branch wild
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành
hint.en: How does an owl get mice?
hint.vi: Em nghĩ xem cú kiếm chuột bằng cách nào?
explanation_correct.en: Yes! An egret hunts fish and frogs.
explanation_correct.vi: Đúng rồi! Cò săn cá và ếch nhái.
explanation_wrong.en: The answer is the egret. It hunts, too.
explanation_wrong.vi: Đáp án là con cò. Cò cũng săn mồi.
> DOK 2: so sánh cách kiếm ăn của hai con vật khác nhau (cú và cò không giống nhau về hình dáng). Ba lựa chọn là ba cách kiếm ăn của bài: thỏ gặm cỏ, cò săn mồi, chó được cho ăn. Cả ba ảnh bé đã gặp (thỏ ở Khởi động, cò và chó ở phần Chơi).
> Hình câu hỏi là con cú của câu hỏi, không phải đáp án.

#### option q4_rabbit
correct: false
feedback.en: A rabbit nibbles grass and leaves.
feedback.vi: Thỏ gặm cỏ và lá rau.
label.en: rabbit
label.vi: con thỏ
image.brief: Dùng lại hình `explore_fur` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): white rabbit sitting grass
image.alt.en: A white rabbit on the grass
image.alt.vi: Con thỏ trắng trên cỏ

#### option q4_egret
correct: true
label.en: egret
label.vi: con cò
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ

#### option q4_dog
correct: false
feedback.en: A pet dog eats from its bowl.
feedback.vi: Chó nhà ăn trong bát người cho.
label.en: dog
label.vi: con chó
image.brief: Dùng lại hình `explore_pets` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): yellow dog lying porch Vietnam
image.alt.en: A dog lying on the floor
image.alt.vi: Chú chó nằm trên sàn nhà

### q5
id: eafb759e-bc16-4c2d-a139-ae3d6ec63b74
format: true_false
version: 1
dok: 2
prompt.en: A hen finds worms. We give it rice, too.
prompt.vi: Gà tự bới giun. Người còn cho gà ăn thóc.
image.brief: Dùng lại hình `w3_hen` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): brown hen standing farmyard side view
image.alt.en: A hen in a yard
image.alt.vi: Con gà mái trong sân
answer: true
hint.en: Remember the Fed by people picture.
hint.vi: Em nhớ lại ô Được người cho ăn nhé.
explanation_correct.en: Yes! Some animals get food two ways.
explanation_correct.vi: Đúng rồi! Có con kiếm ăn bằng hai cách.
explanation_wrong.en: This is true. A hen does both.
explanation_wrong.vi: Câu này đúng. Gà vừa tự kiếm ăn, vừa được cho ăn.
feedback_false.en: A hen scratches the ground for worms.
feedback_false.vi: Gà bới đất tìm giun.
> DOK 2: ghép hai cách kiếm ăn ở một con vật quen. Hai câu EN bốn và năm từ, cả màn chín từ. Bé đã nghe "gà ăn thóc mình rải cho" (ví dụ một của ô "Fed by people") và "gà ăn thóc và giun" (chủ đề số một, bài sáu).
> [CẦN KIỂM] Gà nhà vừa được cho thóc, vừa tự bới giun, sâu (biên tập nhớ).

### q6
id: 799db186-99eb-418a-ae86-25f73bba348c
format: true_false
version: 1
dok: 2
misconception: people_feed_all_animals
prompt.en: People feed the douc in the forest.
prompt.vi: Người cho con voọc trong rừng ăn.
image.brief: Dùng lại hình `explore_wild` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): red-shanked douc langur tree
image.alt.en: A douc in a tree
image.alt.vi: Con voọc trên cây
answer: false
hint.en: Is the douc a pet or wild?
hint.vi: Con voọc là thú cưng hay động vật hoang dã?
explanation_correct.en: A wild douc finds its own leaves.
explanation_correct.vi: Voọc hoang dã tự tìm lá cây để ăn.
explanation_wrong.en: This is false. Wild animals find their own food.
explanation_wrong.vi: Câu này sai. Động vật hoang dã tự tìm thức ăn.
feedback_true.en: Wild animals in the forest feed themselves.
feedback_true.vi: Động vật hoang dã trong rừng tự kiếm ăn.
> Câu misconception (`people_feed_all_animals`), bằng hình: bé còn nghĩ "con nào cũng được người cho ăn" sẽ chạm gật đầu. DOK 2: áp ý "động vật hoang dã tự kiếm ăn" (chủ đề số một bài một) vào một con vật bé đã gặp.
> [CẦN KIỂM] Voọc chà vá chân nâu ăn chủ yếu lá non, cả quả và hạt (biên tập nhớ).
> Câu này cũng dạy không cho thú hoang ăn. Đáp án Sai: giải thích khi đúng không mở đầu bằng "Yes!".

## Từ vựng

### food
id: fc23ecb8-e5ce-4443-ad31-f533b0eb8aca
tier: core
term.en: food
term.vi: thức ăn
example.en: Animals need food to live.
example.vi: Con vật cần thức ăn để sống.
image.brief: Dùng lại hình `explore_need`. Từ khoá tìm ảnh (EN): tree sparrow pecking rice grains ground
image.alt.en: A sparrow pecking at rice
image.alt.vi: Chim sẻ mổ thóc

### hunt
id: c6cb25a3-6f8a-4c44-9ed0-f569db3260a7
tier: core
term.en: hunt
term.vi: săn mồi
example.en: An owl hunts mice at night.
example.vi: Cú săn chuột vào ban đêm.
image.brief: Dùng lại hình `explore_hunt`. Từ khoá tìm ảnh (EN): owl perched branch wild
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành

### graze
id: 21122d33-3072-4b73-b77d-9b9a8f8f83d6
tier: core
term.en: graze
term.vi: gặm cỏ
example.en: Buffaloes graze in the field.
example.vi: Trâu gặm cỏ ngoài đồng.
image.brief: Dùng lại hình `explore_plants` ở bài `goi-ten-va-nhom-dong-vat/con-vat-an-gi`. Từ khoá tìm ảnh (EN): water buffalo grazing grass field
image.alt.en: A buffalo eating grass
image.alt.vi: Con trâu gặm cỏ

### feed
id: 4aee7fd4-d2ff-4d56-b324-a01b83b57235
tier: extra
term.en: feed
term.vi: cho ăn
example.en: We feed the hens rice.
example.vi: Mình cho gà ăn thóc.
image.brief: Dùng lại hình `explore_fed`. Từ khoá tìm ảnh (EN): hand feeding chickens grain yard
image.alt.en: A hand feeding rice to hens
image.alt.vi: Bàn tay rải thóc cho gà

## Thưởng

### owl_card
id: a80126b3-2b94-4e5f-af7e-07edfab4b2e7
set: animals
rarity: common
name.en: Owl
name.vi: Con cú
tag.en: A night hunter
tag.vi: Thợ săn ban đêm
fact.en: An owl turns its head to look back.
fact.vi: Cú quay được đầu ra tận phía sau lưng.
image.brief: Dùng lại hình `explore_hunt`. Từ khoá tìm ảnh (EN): owl perched branch wild
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành
> [CẦN KIỂM] Cú xoay đầu được khoảng hai trăm bảy mươi độ (biên tập nhớ), nên nhìn được ra sau lưng mà không quay người. Câu EN tám từ.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật; hình câu q1 là hình vẽ sân nhà dùng lại của *Hô hấp* (hình câu hỏi, Explorer ẩn ở câu có thẻ).
- **Ảnh cần tìm (ba):**
  - Học (ba): chim sẻ mổ thóc; con cú đậu trên cành ngang (hình gốc của cả chủ đề); bàn tay rải thóc cho gà.
- **Ảnh khó:** cú dáng ngang cho thẻ 5:2 (q1, q3; bài 2 q5; bài 3 q1, q4; bài 4 q3), xem ghi chú ở ô `explore_hunt`; bàn tay rải thóc không thấy mặt (phương án thay ghi ở ô `explore_fed`).
- **q1, q3, q4:** ba lựa chọn mỗi câu là ba con khác hẳn nhau, cùng cỡ con vật trong khung, cùng kiểu nền thật.
- **Kệ Chơi:** bảy món đều là ảnh chụp; hai món bẫy (diều, vịt cao su) là ảnh vật thật, đã có ở chủ đề khác.
- **Màu:** Học: cần thức ăn `nau_dat`, gặm cỏ `gi_dong`, săn mồi `vang_hoe`, được người cho ăn `cham`. Chơi: gặm cỏ `gi_dong`, săn mồi `vang_hoe`, được người cho ăn `cham`, không phải vật sống `do_son`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (bốn nhóm), `word_list` (food, hunt, graze).
  - Chơi: `build_tray`: ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món.
  - Khởi động: `single_choice` (w1, hai lựa chọn, ôn chủ đề số một bài sáu), `true_false` (w2 Đúng, ôn chủ đề số một bài một; w3 Sai, ôn chủ đề số một bài bảy).
  - Quiz: `single_choice` (q1, q3, q4), `true_false` (q2 Đúng, q5 Đúng, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`people_feed_all_animals`).
- **Vị trí đáp án đúng:** hết hiệu lực 15/11 (SK-047, app xáo lựa chọn).
- **Màn Chơi, ví dụ để kiểm:** Con trâu, Con cú, Cá vàng → `balanced`; Con cò, Con chó, Cánh diều → `has_limited`; Con cú, Con cò, Con chó → `missing.tray_graze`.
- **Chạy `ids`:** sau `_topic.md`. Bài 2, 3 trỏ Khởi động về bài này.
- **Từ EN có thể ngoài Starters/Movers:** graze, hunt, owl, egret, douc, silkworm, mulberry, flat, quietly, scratches.
