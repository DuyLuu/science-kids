---
id: c22d1f3e-8279-48fa-9d2c-f9afaec9339c
topic: goi-ten-va-nhom-dong-vat
slug: con-vat-an-gi
order: 6
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: What animals eat
vi: Con vật ăn gì?
> Giữ đúng tên ở `content/syllabus.json` (`naming-and-grouping-animals`, bài số sáu).

## Mục tiêu
en: I can sort animals by what they eat.
vi: Em xếp nhóm được các con vật theo thức ăn của chúng.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-041, ngày 12/11/2026. Mọi dòng `id:` để trống; chạy `ids` sau bài một đến năm.
> 13/11: chủ đề thêm bài bảy, tám (động vật không xương sống, Duy yêu cầu), nên bài này đổi `stage` từ `review` sang `core`; bài tám là bài tổng kết. Nội dung không đổi. Khởi động ôn trộn bài năm, ba, hai và hỏi lại câu "Em nghĩ sao?" của bài một (w3). Bài vẫn có ý mới của sườn (ăn thực vật, ăn thịt, ăn tạp). Sửa `all_animals_eat_same` ở ý chính một, bốn ô Học, phần Chơi và câu q6 (gắn key).

## Ý chính
1.en: Animals eat different foods.
1.vi: Các con vật ăn những thức ăn khác nhau.
2.en: Some eat only plants. Some eat meat.
2.vi: Có con chỉ ăn thực vật. Có con ăn thịt.
3.en: Some animals eat both plants and meat.
3.vi: Có con ăn cả thực vật lẫn thịt.
> Từ cụ thể tới trừu tượng: thức ăn bé nhìn thấy, hai nhóm rõ ràng, rồi nhóm "cả hai" (khó hơn vì phải nghĩ hai điều cùng lúc). Tên nhóm VI "ăn thực vật", không "ăn cỏ" (bảng Tên gọi ở `_topic.md`).

## Khởi động

> Ba câu ôn trộn: w1 bài năm (bài trước), w2 bài ba, w3 bài hai và câu "Em nghĩ sao?" của bài một.

### w1
id: d74a86a3-8b6e-4f73-99de-34c3b0d518ce
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/co-the-cac-con-vat
prompt.en: A snake has four legs.
prompt.vi: Con rắn có bốn chân.
image.brief: Dùng lại hình `q5` ở bài `goi-ten-va-nhom-dong-vat/chim-va-bo-sat`. Từ khoá tìm ảnh (EN): green snake resting on branch
image.alt.en: A snake on the leaves
image.alt.vi: Con rắn nằm trên lá
answer: false
hint.en: Look along the snake's body.
hint.vi: Em nhìn dọc thân con rắn nhé.
explanation_correct.en: A snake has no legs. It slides.
explanation_correct.vi: Rắn không có chân. Rắn trườn đi.
explanation_wrong.en: This is false. A snake has no legs.
explanation_wrong.vi: Câu này sai. Rắn không có chân.
feedback_true.en: A snake slides along with no legs.
feedback_true.vi: Rắn trườn đi, không có chân.
> Ôn `all_animals_four_legs` (bài năm q6), không gắn key.

### w2
id: 08615798-2f0e-4786-9ffd-50c584e9352f
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/chim-va-bo-sat
prompt.en: Which one is a reptile?
prompt.vi: Con nào là bò sát?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for dry skin with scales.
hint.vi: Em tìm con có da khô phủ vảy nhé.
explanation_correct.en: Yes! A crocodile has dry, scaly skin.
explanation_correct.vi: Đúng rồi! Cá sấu có da khô phủ vảy.
explanation_wrong.en: The answer is the crocodile. It has scales.
explanation_wrong.vi: Đáp án là cá sấu. Cá sấu có vảy.
> Ếch và cá sấu cùng sống ở bờ nước, cùng bốn chân; bé phải nhìn da (ý "lưỡng cư và bò sát là một" của sườn, gặp lại lần ba).

#### option w2_croc
correct: true
label.en: crocodile
label.vi: cá sấu
image.brief: Dùng lại hình `q1_reptiles` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): Siamese crocodile basking riverbank side view
image.alt.en: A crocodile on a riverbank
image.alt.vi: Con cá sấu trên bờ sông

#### option w2_frog
correct: false
feedback.en: A frog has smooth skin, no scales.
feedback.vi: Ếch có da trơn, không có vảy.
label.en: frog
label.vi: con ếch
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

### w3
id: 06edef6a-5fba-45f5-971c-97e3f9303474
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/dong-vat-co-vu
prompt.en: People are animals, too.
prompt.vi: Con người cũng là động vật.
image.brief: Dùng lại hình `explore_people` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): baby hand holding adult finger
image.alt.en: A baby's hand holding a finger
image.alt.vi: Bàn tay em bé nắm ngón tay người lớn
answer: true
hint.en: Remember the mammals lesson.
hint.vi: Em nhớ lại bài động vật có vú nhé.
explanation_correct.en: Yes! People are animals and mammals.
explanation_correct.vi: Đúng rồi! Con người là động vật, là động vật có vú.
explanation_wrong.en: This is true. People are animals, too.
explanation_wrong.vi: Câu này đúng. Con người cũng là động vật.
feedback_false.en: People move and eat, like animals do.
feedback_false.vi: Con người tự đi lại và ăn uống, như các con vật.
> Hỏi lại ý của câu "Em nghĩ sao?" đề xuất cho bài một (`people_not_animals`, không gắn key). Câu "Em nghĩ sao?" chưa có trong schema (`think_first` là đề xuất), nên chữ cho bé ở đây không nhắc tới câu trả lời lúc đầu (rà chữ tester 12/11 n16). Câu này cũng mở đường cho ô "Eat both" (con người ăn tạp).

## Học

> Bốn ô: thức ăn khác nhau, ăn thực vật, ăn thịt, ăn tạp. Ô "Eat both" dùng mâm cơm gia đình: bé thấy chính mình ăn cả rau lẫn cá (nối `people_not_animals`).
> Tên ô dùng chữ dễ ("Plant-eaters", "Meat-eaters", "Eat both"); câu của ô dùng tên khoa học (herbivore, carnivore, omnivore) để bé nghe từ mới ngay cạnh nghĩa.

### explore
id: 40158f49-2bc9-4bbf-a367-ef278fac972f
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_food
label.en: Different food
label.vi: Thức ăn khác nhau
color: nau_dat
sentence.en: Animals eat different foods.
sentence.vi: Các con vật ăn những thức ăn khác nhau.
image.brief: Dùng lại hình `explore_animals` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): hen with chicks pecking yard
image.alt.en: A hen and chicks looking for food
image.alt.vi: Gà mẹ và gà con tìm thức ăn
examples.1.en: grass and leaves
examples.1.vi: cỏ và lá cây
examples.2.en: seeds and fruit
examples.2.vi: hạt và quả
examples.3.en: fish and worms
examples.3.vi: cá và giun
examples.4.en: snails and insects
examples.4.vi: ốc và côn trùng

#### group explore_plants
label.en: Plant-eaters
label.vi: Ăn thực vật
color: gi_dong
sentence.en: Herbivores eat only plants.
sentence.vi: Con vật ăn thực vật chỉ ăn cây, lá, cỏ, quả.
image.brief: [ảnh] Một con trâu đang cúi gặm cỏ trên cánh đồng xanh, nhìn ngang, thấy cả con; không có người, không có dây buộc mũi nổi bật, không có chữ. Từ khoá tìm ảnh (EN): water buffalo grazing grass field
image.alt.en: A buffalo eating grass
image.alt.vi: Con trâu gặm cỏ
examples.1.en: a buffalo eats grass
examples.1.vi: trâu ăn cỏ
examples.2.en: a rabbit eats leaves
examples.2.vi: thỏ ăn lá rau
examples.3.en: an elephant eats sugar cane
examples.3.vi: voi ăn mía
examples.4.en: a goat eats leaves
examples.4.vi: dê ăn lá cây
> [CẦN KIỂM] Voi ăn cỏ, lá, vỏ cây, mía, chuối (biên tập nhớ). Ví dụ ba cho thấy vì sao không gọi nhóm này là "ăn cỏ".
> Hình gốc, dùng lại ở từ `herbivore` và thẻ thưởng. Không dùng ở câu hỏi nào (là bằng chứng của q1).

#### group explore_meat
label.en: Meat-eaters
label.vi: Ăn thịt
color: vang_hoe
sentence.en: Carnivores eat other animals.
sentence.vi: Con vật ăn thịt ăn những con vật khác.
image.brief: [ảnh] Một con cò trắng đứng dưới ruộng nước, mỏ đang ngậm một con cá nhỏ, nhìn ngang, thấy cả con; không có máu, không có người, không có chữ. Từ khoá tìm ảnh (EN): egret catching fish rice paddy
image.alt.en: An egret catching a fish
image.alt.vi: Con cò bắt cá
examples.1.en: an egret eats fish and frogs
examples.1.vi: cò ăn cá và ếch nhái
examples.2.en: a crocodile eats fish
examples.2.vi: cá sấu ăn cá
examples.3.en: a cat catches mice
examples.3.vi: mèo bắt chuột
examples.4.en: fish is meat, too
examples.4.vi: cá cũng là thịt
> [CẦN KIỂM] Cò ăn cá, ếch nhái, tôm tép, côn trùng; mèo là loài ăn thịt (biên tập nhớ). Ví dụ bốn chuẩn bị câu q5.
> Cảnh săn mồi nhẹ nhất (Quy ước hình mục bốn): cá nhỏ trong mỏ, không có máu.

#### group explore_both
label.en: Eat both
label.vi: Ăn tạp
color: cham
sentence.en: Omnivores eat plants and meat.
sentence.vi: Con vật ăn tạp ăn cả thực vật lẫn thịt.
image.brief: [ảnh] Một đĩa cơm có đậu xanh (đậu que) và một miếng cá, chụp từ trên xuống; không có người, không có tay, không có nhãn hiệu, không có chữ. Designer 12/11: không có ảnh hợp lệ mâm cơm gia đình Việt Nam không người, nên dùng một đĩa cơm có rau và cá. Từ khoá tìm ảnh (EN): Vietnamese family meal rice fish morning glory
image.alt.en: A meal of rice, greens and fish
image.alt.vi: Mâm cơm có cơm, rau và cá
examples.1.en: people eat rice and fish
examples.1.vi: người ăn cơm và cá
examples.2.en: a hen eats seeds and worms
examples.2.vi: gà ăn thóc và giun
examples.3.en: a duck eats rice and snails
examples.3.vi: vịt ăn thóc và ốc
> [CẦN KIỂM] Gà, vịt nhà ăn thóc, giun, ốc, côn trùng (ăn tạp; biên tập nhớ). Con người ăn tạp.
> Hình gốc, dùng lại ở câu q4 (hình câu hỏi) và từ `omnivore`. Ảnh mâm cơm khó tìm không có người và chữ; nếu không có, designer báo để hỏi PM có cho phép `[hình vẽ]` riêng ô này không (ô Học được trộn loại hình, khác lựa chọn trong câu).

### new_words
id: 8613b660-7610-49a6-9366-cc21dd90b2d1
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: herbivore, carnivore, omnivore
> Ba từ `core` khó đọc; Explorer nghe, không đọc. Nghe thử giọng EN.

## Chơi

> Bé chọn ba con vật: một con ăn thực vật, một con ăn thịt, một con ăn tạp. Đạt khi đủ ba nhóm và không chọn vật nào không sống.
> Dùng ngay ba ô Học. Món bẫy giống một nhóm: tượng sư tử đá trông như con thú ăn thịt; cánh diều hình chim trông như con cò. Bé phải nghĩ "thứ này có sống, có ăn không" trước khi xếp.
> Gà, vịt ăn tạp; cò, cá sấu ăn thịt; trâu, thỏ ăn thực vật. Kệ tám món, toàn ảnh chụp.

### tray
id: adf6dfd5-df6b-4484-92da-c144f03e183b
type: build_tray
version: 1
prompt.en: Pick three animals that eat differently
prompt.vi: Chọn ba con vật ăn khác nhau
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Plants, meat, or both? Pick one each.
messages.start.vi: Em chọn một con ăn thực vật, một con ăn thịt, một con ăn tạp nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Animals eat different foods.
messages.balanced.vi: Tuyệt! Các con vật ăn những thức ăn khác nhau.
messages.has_limited.en: That one is not alive. It does not eat.
messages.has_limited.vi: Thứ này không phải vật sống. Nó không ăn.
messages.missing.tray_plants.en: You still need a plant-eater.
messages.missing.tray_plants.vi: Em còn thiếu một con ăn thực vật.
messages.missing.tray_meat.en: You still need a meat-eater.
messages.missing.tray_meat.vi: Em còn thiếu một con ăn thịt.
messages.missing.tray_both.en: You still need one that eats both.
messages.missing.tray_both.vi: Em còn thiếu một con ăn tạp.

#### group tray_plants
label.en: Plant-eater
label.vi: Ăn thực vật
color: gi_dong
role: required

#### group tray_meat
label.en: Meat-eater
label.vi: Ăn thịt
color: vang_hoe
role: required

#### group tray_both
label.en: Eats both
label.vi: Ăn tạp
color: cham
role: required

#### group tray_not
label.en: Not alive
label.vi: Không phải vật sống
color: do_son
role: limit

#### item tray_buffalo
label.en: Buffalo
label.vi: Con trâu
group: tray_plants
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu

#### item tray_stone_lion
label.en: Stone lion
label.vi: Sư tử đá
group: tray_not
image.brief: [ảnh] Một bức tượng sư tử đá đỏ kiểu Trung Hoa ngồi trên bệ, nhìn nghiêng, thấy cả tượng; không có chữ khắc, không có câu đối, không có biển, không có người. Từ khoá tìm ảnh (EN): stone lion statue Vietnam
image.alt.en: A stone lion statue
image.alt.vi: Tượng sư tử đá
> Tượng đá ở cổng đình, chùa, công viên là vật quen; chọn ảnh không thấy bàn thờ, hương khói (trung tính với tín ngưỡng).

#### item tray_croc
label.en: Crocodile
label.vi: Cá sấu
group: tray_meat
image.brief: Dùng lại hình `q1_reptiles` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): Siamese crocodile basking riverbank side view
image.alt.en: A crocodile on a riverbank
image.alt.vi: Con cá sấu trên bờ sông

#### item tray_hen
label.en: Hen
label.vi: Con gà mái
group: tray_both
image.brief: Dùng lại hình `w3_hen` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): brown hen standing farmyard side view
image.alt.en: A hen in a yard
image.alt.vi: Con gà mái trong sân

#### item tray_rabbit
label.en: Rabbit
label.vi: Con thỏ
group: tray_plants
image.brief: Dùng lại hình `explore_fur` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): white rabbit sitting grass
image.alt.en: A white rabbit on the grass
image.alt.vi: Con thỏ trắng trên cỏ

#### item tray_kite
label.en: Kite
label.vi: Cánh diều
group: tray_not
image.brief: Dùng lại hình `tray_kite` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): child flying kite field back view
image.alt.en: A bird-shaped kite in the sky
image.alt.vi: Cánh diều hình con chim trên trời

#### item tray_egret
label.en: Egret
label.vi: Con cò
group: tray_meat
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ

#### item tray_duck
label.en: Duck
label.vi: Con vịt
group: tray_both
image.brief: Dùng lại hình `w1_duck` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): duck standing pond bank
image.alt.en: A duck standing on the grass
image.alt.vi: Con vịt đứng trên bãi cỏ

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1, q3, q4, q6; ba lựa chọn), `true_false` (q2, q5). Bài này không dùng `order_sequence`: thức ăn không có thứ tự tự nhiên (chuỗi thức ăn để dành *Chuỗi thức ăn*, Explorer số mười).

### q1
id: 9448eddc-4c78-4570-9169-93aecdfa3f62
format: single_choice
version: 1
dok: 1
prompt.en: What does a buffalo eat?
prompt.vi: Con trâu ăn gì?
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu
hint.en: Think of a buffalo in the field.
hint.vi: Em nhớ lại con trâu ngoài đồng nhé.
explanation_correct.en: Yes! A buffalo eats only plants.
explanation_correct.vi: Đúng rồi! Trâu chỉ ăn thực vật.
explanation_wrong.en: The answer is grass. Buffaloes eat plants.
explanation_wrong.vi: Đáp án là bó cỏ. Trâu ăn thực vật.
> Hình câu hỏi là trâu đang uống nước bên suối, không phải ảnh trâu gặm cỏ của ô Học (bằng chứng của đáp án). Khớp ví dụ Đạt ở luật Explorer số 2 của TEMPLATE.

#### option q1_grass
correct: true
label.en: grass
label.vi: bó cỏ
image.brief: Dùng lại hình `q4_grass` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): bundle fresh green grass
image.alt.en: Fresh green grass
image.alt.vi: Cỏ tươi

#### option q1_worm
correct: false
feedback.en: A worm is food for hens and birds.
feedback.vi: Giun là thức ăn của gà và chim.
label.en: worm
label.vi: con giun
image.brief: [ảnh] Một con giun đất hồng nằm trên mặt đất ẩm, chụp cận, thấy cả con; không có tay người, không có chữ. Nếu ảnh giun đất của chủ đề *Đá và đất* (bài *Thế nào là đất tốt*) hợp khung thì dùng lại. Từ khoá tìm ảnh (EN): earthworm on moist soil
image.alt.en: A worm on the soil
image.alt.vi: Con giun trên đất

#### option q1_fish
correct: false
feedback.en: Fish is food for egrets.
feedback.vi: Cá là thức ăn của con cò.
label.en: small fish
label.vi: cá nhỏ
image.brief: Dùng lại hình `q4_fish` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): small fish swimming shallow water
image.alt.en: Small fish in water
image.alt.vi: Cá nhỏ dưới nước
> Rà chữ tester 12/11 (N3): hình gốc chuyển lên bài một (`q4_fish`), chữ brief giữ như cũ.

### q2
id: 293a410b-e366-4c85-9d1f-545b8ef9396b
format: true_false
version: 1
dok: 1
prompt.en: A rabbit eats meat.
prompt.vi: Con thỏ ăn thịt.
image.brief: Dùng lại hình `explore_fur` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): white rabbit sitting grass
image.alt.en: A white rabbit on the grass
image.alt.vi: Con thỏ trắng trên cỏ
answer: false
hint.en: What does a rabbit like to nibble?
hint.vi: Em nghĩ xem thỏ hay gặm gì?
explanation_correct.en: A rabbit eats plants, like leaves.
explanation_correct.vi: Thỏ ăn thực vật, như lá rau.
explanation_wrong.en: This is false. A rabbit eats plants.
explanation_wrong.vi: Câu này sai. Thỏ ăn thực vật.
feedback_true.en: A rabbit nibbles leaves and carrots.
feedback_true.vi: Thỏ gặm lá rau và củ cà rốt.

### q3
id: 5c372132-265e-4694-af00-46442479157e
format: single_choice
version: 1
dok: 1
prompt.en: Which one eats meat?
prompt.vi: Con nào ăn thịt?
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê
hint.en: Look for big, sharp teeth.
hint.vi: Em tìm con có hàm răng to, sắc nhé.
explanation_correct.en: Yes! A crocodile eats fish and other animals.
explanation_correct.vi: Đúng rồi! Cá sấu ăn cá và những con vật khác.
explanation_wrong.en: The answer is the crocodile. It eats meat.
explanation_wrong.vi: Đáp án là cá sấu. Cá sấu ăn thịt.
> Ba con to: trâu, voi, cá sấu. Hai lựa chọn sai là động vật ăn thực vật to lớn, để bé không nghĩ "con to là ăn thịt". Gợi ý chỉ vào điều thấy được (răng cá sấu lộ ra cả khi miệng khép); người chọn ảnh kiểm thấy răng.

#### option q3_buffalo
correct: false
feedback.en: A buffalo eats grass.
feedback.vi: Trâu ăn cỏ.
label.en: buffalo
label.vi: con trâu
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu

#### option q3_elephant
correct: false
feedback.en: An elephant eats leaves and sugar cane.
feedback.vi: Voi ăn lá cây và mía.
label.en: elephant
label.vi: con voi
image.brief: Dùng lại hình `explore_big_small` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): Asian elephant standing in water
image.alt.en: An elephant in the water
image.alt.vi: Con voi dưới nước

#### option q3_croc
correct: true
label.en: crocodile
label.vi: cá sấu
image.brief: Dùng lại hình `q1_reptiles` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): Siamese crocodile basking riverbank side view
image.alt.en: A crocodile on a riverbank
image.alt.vi: Con cá sấu trên bờ sông

### q4
id: 2ae718a5-7dd3-4a39-a35c-6d09b59d0583
format: single_choice
version: 1
dok: 2
prompt.en: We eat plants and meat. Who else does?
prompt.vi: Mình ăn cả thực vật lẫn thịt. Con nào ăn giống mình?
image.brief: Dùng lại hình `explore_both`. Từ khoá tìm ảnh (EN): Vietnamese family meal rice fish morning glory
image.alt.en: A meal of rice, greens and fish
image.alt.vi: Mâm cơm có cơm, rau và cá
hint.en: Remember the Eat both picture.
hint.vi: Em nhớ lại ô Ăn tạp nhé.
explanation_correct.en: Yes! A hen eats seeds and worms.
explanation_correct.vi: Đúng rồi! Gà ăn cả thóc lẫn giun.
explanation_wrong.en: The answer is the hen. It eats both.
explanation_wrong.vi: Đáp án là con gà mái. Gà ăn tạp.
> DOK 2: so sánh cách ăn của mình (mâm cơm) với con vật. Ba lựa chọn là ba nhóm của bài: thỏ ăn thực vật, gà ăn tạp, cá sấu ăn thịt. Cả ba ảnh bé đã gặp ở phần Chơi.
> Hình câu hỏi là mâm cơm: đó là "mình" của câu hỏi, không phải đáp án. Hai câu EN năm và ba từ.

#### option q4_rabbit
correct: false
feedback.en: A rabbit eats only plants.
feedback.vi: Thỏ chỉ ăn thực vật.
label.en: rabbit
label.vi: con thỏ
image.brief: Dùng lại hình `explore_fur` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): white rabbit sitting grass
image.alt.en: A white rabbit on the grass
image.alt.vi: Con thỏ trắng trên cỏ

#### option q4_hen
correct: true
label.en: hen
label.vi: con gà mái
image.brief: Dùng lại hình `w3_hen` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): brown hen standing farmyard side view
image.alt.en: A hen in a yard
image.alt.vi: Con gà mái trong sân

#### option q4_croc
correct: false
feedback.en: A crocodile eats only meat.
feedback.vi: Cá sấu chỉ ăn thịt.
label.en: crocodile
label.vi: cá sấu
image.brief: Dùng lại hình `q1_reptiles` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): Siamese crocodile basking riverbank side view
image.alt.en: A crocodile on a riverbank
image.alt.vi: Con cá sấu trên bờ sông

### q5
id: 3b80c71c-70c5-414a-a0be-5ef95f2ca691
format: true_false
version: 1
dok: 2
prompt.en: An egret eats fish, so it eats meat.
prompt.vi: Cò ăn cá, vậy cò là con vật ăn thịt.
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ
answer: true
hint.en: Is a fish an animal?
hint.vi: Em nghĩ xem con cá có phải con vật không?
explanation_correct.en: Yes! An egret is a meat-eater.
explanation_correct.vi: Đúng rồi! Cò là con vật ăn thịt.
explanation_wrong.en: This is true. Fish is meat, too.
explanation_wrong.vi: Câu này đúng. Cá cũng là thịt.
feedback_false.en: Fish is meat, because fish are animals.
feedback_false.vi: Cá cũng là thịt, vì cá là con vật.
> DOK 2: suy ra một điều từ một điều đã biết. Bé hay nghĩ "thịt" chỉ là thịt lợn, thịt gà, nên có thể chạm lắc đầu. Ví dụ bốn của ô "Meat-eaters" đã nói ý này.
> Hình là cò đang bay, không phải ảnh cò ngậm cá của ô Học (bằng chứng).

### q6
id: a3f5ae1f-9f0d-4198-9a4b-5384be600e8e
format: single_choice
version: 1
dok: 2
misconception: all_animals_eat_same
prompt.en: A buffalo eats grass. What does a cat eat?
prompt.vi: Trâu ăn cỏ. Còn mèo ăn gì?
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm
hint.en: Think what cats like to catch.
hint.vi: Em nghĩ xem mèo thích bắt con gì nhé.
explanation_correct.en: Yes! Cats eat fish. Buffaloes eat grass.
explanation_correct.vi: Đúng rồi! Mèo ăn cá, còn trâu ăn cỏ.
explanation_wrong.en: The answer is the fish. Animals eat different foods.
explanation_wrong.vi: Đáp án là con cá. Mỗi con vật ăn thức ăn khác nhau.
> Câu misconception (`all_animals_eat_same`), bằng hình: câu mở đầu nói trâu ăn cỏ, rồi hỏi mèo; lựa chọn sai "bó cỏ" đúng là thứ trâu ăn. Bé còn nghĩ "con vật nào cũng ăn như nhau" sẽ chọn bó cỏ. Nải chuối là thức ăn của người và nhiều con vật khác, không phải của mèo.
> DOK 2: so sánh hai con vật. Hai câu EN bốn và năm từ, cả màn chín từ.
> Bài một q4 đã hỏi mèo con ăn gì (cá nhỏ); câu này lặp ý có chủ ý ở bài ôn, có thêm vế so với con trâu (`all_animals_eat_same`). Ba ảnh giống bài một; vị trí đáp án khác (bài một thứ nhất, bài này thứ ba).

#### option q6_grass
correct: false
feedback.en: Grass is food for the buffalo.
feedback.vi: Cỏ là thức ăn của con trâu.
label.en: grass
label.vi: bó cỏ
image.brief: Dùng lại hình `q4_grass` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): bundle fresh green grass
image.alt.en: Fresh green grass
image.alt.vi: Cỏ tươi

#### option q6_banana
correct: false
feedback.en: Bananas are fruit for people.
feedback.vi: Chuối là quả cho người ăn.
label.en: bananas
label.vi: nải chuối
image.brief: Dùng lại hình `q4_banana` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): bunch ripe bananas wooden table
image.alt.en: A bunch of bananas
image.alt.vi: Nải chuối chín

#### option q6_fish
correct: true
label.en: small fish
label.vi: cá nhỏ
image.brief: Dùng lại hình `q4_fish` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): small fish swimming shallow water
image.alt.en: Small fish in water
image.alt.vi: Cá nhỏ dưới nước
> Ba lựa chọn đều là ảnh bé đã gặp (bó cỏ và cá nhỏ ở câu q1 và bài một q4, nải chuối ở bài một). Ba ảnh cùng kiểu chụp từ trên xuống.

## Từ vựng

### herbivore
id: 8178328a-e193-4ecd-b3b5-c3577ec3a27c
tier: core
term.en: herbivore
term.vi: con vật ăn thực vật
example.en: A buffalo is a herbivore.
example.vi: Trâu là con vật ăn thực vật.
image.brief: Dùng lại hình `explore_plants`. Từ khoá tìm ảnh (EN): water buffalo grazing grass field
image.alt.en: A buffalo eating grass
image.alt.vi: Con trâu gặm cỏ

### carnivore
id: 4c1e83d8-3848-48bf-9808-379363c0e534
tier: core
term.en: carnivore
term.vi: con vật ăn thịt
example.en: An egret is a carnivore.
example.vi: Cò là con vật ăn thịt.
image.brief: Dùng lại hình `explore_meat`. Từ khoá tìm ảnh (EN): egret catching fish rice paddy
image.alt.en: An egret catching a fish
image.alt.vi: Con cò bắt cá

### omnivore
id: 7f8b5b91-eeae-46c3-b1a2-e6d788eaf458
tier: core
term.en: omnivore
term.vi: con vật ăn tạp
example.en: People are omnivores.
example.vi: Con người ăn tạp.
image.brief: Dùng lại hình `explore_both`. Từ khoá tìm ảnh (EN): Vietnamese family meal rice fish morning glory
image.alt.en: A meal of rice, greens and fish
image.alt.vi: Mâm cơm có cơm, rau và cá

### plant
id: f3d6285b-5d0d-49cc-9b34-caccac61fba8
tier: extra
term.en: plant
term.vi: thực vật
example.en: Grass is a plant.
example.vi: Cỏ là thực vật.
image.brief: Dùng lại hình `q4_grass` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): bundle fresh green grass
image.alt.en: Fresh green grass
image.alt.vi: Cỏ tươi

### meat
id: d69a6686-fa91-4b22-bc11-df5f2c64ed49
tier: extra
term.en: meat
term.vi: thịt
example.en: A cat eats meat and fish.
example.vi: Mèo ăn thịt và cá.
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm
> Không dùng ảnh miếng thịt sống (Quy ước hình mục bốn); ảnh mèo đi với câu ví dụ.

## Thưởng

### buffalo_card
id: 6b4d262c-4b01-47b3-aed9-a4f1d3d72ef6
set: animals
rarity: common
name.en: Water buffalo
name.vi: Con trâu
tag.en: A plant-eater
tag.vi: Ăn thực vật
fact.en: A buffalo chews its food again and again.
fact.vi: Trâu nhai lại thức ăn nhiều lần.
image.brief: Dùng lại hình `explore_plants`. Từ khoá tìm ảnh (EN): water buffalo grazing grass field
image.alt.en: A buffalo eating grass
image.alt.vi: Con trâu gặm cỏ
> [CẦN KIỂM] Trâu là loài nhai lại: nuốt cỏ vào dạ cỏ, rồi ợ lên nhai lại (biên tập nhớ). Câu EN tám từ. Thẻ cuối chủ đề là con trâu, con vật gần gũi nhất với bé Việt Nam.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật.
- **Ảnh cần tìm (năm):**
  - Học (ba): trâu gặm cỏ; cò ngậm cá nhỏ dưới ruộng; mâm cơm gia đình.
  - Chơi (một): tượng sư tử đá.
  - Quiz (một): giun đất trên đất ẩm (thử dùng lại ảnh của *Đá và đất* trước). Đàn cá nhỏ bơi nay là hình gốc của bài một (`q4_fish`), rà chữ tester 12/11 N3.
- **Ảnh khó:** mâm cơm không có người, không có chữ, không nhãn hiệu (Commons có ảnh mâm cơm Việt Nam; chọn ảnh chụp từ trên xuống); phương án thay ghi ở ô `explore_both`. Cò ngậm cá: không có máu.
- **q1 và q6:** bó cỏ, giun, cá nhỏ, nải chuối đều chụp từ trên xuống hoặc chéo, cùng kiểu nền tự nhiên, cùng cỡ vật trong khung.
- **q3:** trâu, voi, cá sấu là ba con to; cắt cho cùng cỡ trong khung. Kiểm răng cá sấu thấy được (gợi ý nhắc tới răng).
- **Kệ Chơi:** tám món đều là ảnh chụp; hai món bẫy (tượng đá, diều) là ảnh vật thật.
- **Màu:** Học: thức ăn khác nhau `nau_dat`, ăn thực vật `gi_dong`, ăn thịt `vang_hoe`, ăn tạp `cham`. Chơi: ăn thực vật `gi_dong`, ăn thịt `vang_hoe`, ăn tạp `cham`, không phải vật sống `do_son`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (bốn nhóm), `word_list` (herbivore, carnivore, omnivore).
  - Chơi: `build_tray`: ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món.
  - Khởi động: `true_false` (w1 Sai, ôn bài năm), `single_choice` (w2, hai lựa chọn, ôn bài ba), `true_false` (w3 Đúng, ôn bài hai và câu "Em nghĩ sao?" của bài một).
  - Quiz: `single_choice` (q1, q3, q4, q6), `true_false` (q2 Sai, q5 Đúng). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`all_animals_eat_same`).
- **Vị trí đáp án đúng:** w2 thứ nhất; q1 thứ nhất; q3 thứ ba; q4 thứ hai; q6 thứ ba.
- **Màn Chơi, ví dụ để kiểm:** Con trâu, Cá sấu, Con gà mái → `balanced`; Con thỏ, Con cò, Sư tử đá → `has_limited`; Con trâu, Con thỏ, Con vịt → `missing.tray_meat`.
- **"Em nghĩ sao?" quay lại:** w3 là câu hỏi lại của bài một. Nếu sau này app lưu câu trả lời "Em nghĩ sao?" (đề xuất schema v1.1 `think_first`), màn này có thể nhắc "Lúc đầu em nghĩ…" (đề xuất, chưa có trong schema; không thêm vào chữ cho bé trước khi có `think_first`).
- **Từ EN có thể ngoài Starters/Movers:** herbivore, carnivore, omnivore, plant-eater, meat-eater, sugar cane, egret, worm, nibble (gợi ý q2).
