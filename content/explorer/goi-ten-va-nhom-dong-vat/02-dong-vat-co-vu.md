---
id: 59d9d765-e3f1-4349-be51-58423e32bc46
topic: goi-ten-va-nhom-dong-vat
slug: dong-vat-co-vu
order: 2
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Naming mammals
vi: Động vật có vú
> Giữ đúng tên ở `content/syllabus.json` (`naming-and-grouping-animals`, bài số hai).

## Mục tiêu
en: I can name animals that are mammals.
vi: Em gọi tên được những con vật là động vật có vú.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-041, ngày 12/11/2026. Mọi dòng `id:` để trống; chạy `ids` sau bài một (Khởi động trỏ về bài một).
> Sửa `people_not_animals` ở ý chính ba, ô Học "People" và câu q6 (gắn key). Đặt nền cho `water_animals_are_fish` (bài bốn): ví dụ cá heo ở ô "Big and small", món cá heo ở phần Chơi.

## Ý chính
1.en: Mammals have hair or fur.
1.vi: Động vật có vú có lông hoặc có tóc.
2.en: Baby mammals drink milk from their mother.
2.vi: Con non của động vật có vú bú sữa mẹ.
3.en: People are mammals, too.
3.vi: Con người cũng là động vật có vú.
> Từ cụ thể tới trừu tượng: điều bé sờ, thấy được (lông), điều bé biết qua mèo, trâu ở nhà (bú sữa), rồi tự xếp mình vào nhóm (con người là động vật có vú).
> Bỏ "máu nóng" và "có xương sống" của sườn (mục Lệch so với sườn ở `_topic.md`).

## Khởi động

> Hai câu, đều ôn bài một (bài trước, khoảng một ngày). Chủ đề Explorer đầu tiên nên chưa có bài cách một tuần.

### w1
id: 922da2aa-b43a-4c5f-837b-776f6b96cc75
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha
prompt.en: A goldfish can be a pet.
prompt.vi: Cá vàng có thể là thú cưng.
image.brief: Dùng lại hình `tray_goldfish` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): goldfish aquarium plants side view
image.alt.en: A goldfish in a tank
image.alt.vi: Cá vàng trong bể
answer: true
hint.en: Look where this goldfish lives.
hint.vi: Em nhìn xem cá vàng đang sống ở đâu nhé.
explanation_correct.en: Yes! Goldfish live in tanks at home.
explanation_correct.vi: Đúng rồi! Cá vàng sống trong bể ở nhà.
explanation_wrong.en: This is true. Pets can swim.
explanation_wrong.vi: Câu này đúng. Thú cưng có con biết bơi.
feedback_false.en: A goldfish lives in a tank at home.
feedback_false.vi: Cá vàng sống được trong bể ở nhà.
> Ôn `pets_have_four_legs` (câu q6 bài một), không gắn key.

### w2
id: daa483c5-9bc3-466b-be55-e7421e8114b5
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha
prompt.en: Which one is a farm animal?
prompt.vi: Con nào là vật nuôi trong chuồng?
image.brief: [ảnh] Bầu trời chiều màu cam phía trên một rặng cây đen in bóng; không có con vật, không có chim, không có người, không có dây điện, không có chữ. Từ khoá tìm ảnh (EN): dusk sky bamboo silhouette
image.alt.en: The evening sky over the trees
image.alt.vi: Trời chiều trên rặng cây
hint.en: Which one lives in a shed or yard?
hint.vi: Con nào sống ở chuồng hay ngoài sân?
explanation_correct.en: Yes! A buffalo helps on the farm.
explanation_correct.vi: Đúng rồi! Trâu là vật nuôi, giúp nhà nông cày ruộng.
explanation_wrong.en: The answer is the buffalo. It lives in a shed.
explanation_wrong.vi: Đáp án là con trâu. Trâu sống ở chuồng.
> Ôn ô Học "Farm animals" bài một (nhóm bài một không hỏi ở quiz). Ba lựa chọn đúng ba nhóm của bài một: động vật hoang dã, vật nuôi trong chuồng, thú cưng. Ba ảnh đều đã có ở bài một.
> Hình câu hỏi là trời chiều trung tính; không dùng ruộng lúa hay sân nhà, vì hai cảnh đó gợi con trâu.
> Hình gốc (trời chiều), dùng lại ở bài ba q3. Rà chữ tester 12/11 (N1, n13): `[ảnh]` chuyển từ câu q5 lên đây; q5 không dùng trời chiều nữa vì cảnh chạng vạng gợi con dơi.

#### option w2_douc
correct: false
feedback.en: A douc lives free in the forest.
feedback.vi: Voọc sống tự do trong rừng.
label.en: douc
label.vi: con voọc
image.brief: Dùng lại hình `explore_wild` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): red-shanked douc langur tree
image.alt.en: A douc in a tree
image.alt.vi: Con voọc trên cây

#### option w2_buffalo
correct: true
label.en: buffalo
label.vi: con trâu
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu

#### option w2_parakeet
correct: false
feedback.en: A parakeet is a pet in our home.
feedback.vi: Vẹt yến phụng là thú cưng trong nhà.
label.en: parakeet
label.vi: vẹt yến phụng
image.brief: Dùng lại hình `tray_parakeet` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): budgerigar perch cage green
image.alt.en: A parakeet on a perch
image.alt.vi: Con vẹt yến phụng đậu trên thanh gỗ

## Học

> Bốn ô, từ cụ thể tới trừu tượng: lông (sờ, thấy được), sữa, động vật có vú to nhỏ đủ kiểu (dơi biết bay, cá heo sống dưới biển), con người.
> Ô "Big and small" có dơi và cá heo để bé thấy động vật có vú không chỉ là con bốn chân trên cạn (sườn: dùng thật nhiều loài, cả thú hoang). Hai con này có ảnh ở phần Chơi.

### explore
id: 36c5bab9-7893-488a-a61d-ce09bca4725e
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_fur
label.en: Hair or fur
label.vi: Lông hoặc tóc
color: vang_hoe
sentence.en: Mammals have hair or fur.
sentence.vi: Động vật có vú có lông hoặc có tóc.
image.brief: [ảnh] Một con thỏ lông trắng ngồi trên bãi cỏ, nhìn nghiêng, thấy rõ bộ lông mềm và cả con; không có chuồng, không có người, không có chữ. Từ khoá tìm ảnh (EN): white rabbit sitting grass
image.alt.en: A white rabbit on the grass
image.alt.vi: Con thỏ trắng trên cỏ
examples.1.en: a rabbit's soft fur
examples.1.vi: bộ lông mềm của con thỏ
examples.2.en: a buffalo's short hair
examples.2.vi: lông ngắn của con trâu
examples.3.en: the hair on your head
examples.3.vi: tóc trên đầu em
> Hình gốc, dùng lại ở từ `mammal`, bài ba q3, bài sáu.
> [CẦN KIỂM] Trâu có lông thưa, ngắn. Chữ VI dùng "lông" cho động vật có vú, "lông vũ" cho chim (bảng Tên gọi).

#### group explore_milk
label.en: Milk
label.vi: Sữa
color: cham
sentence.en: Baby mammals drink milk from their mother.
sentence.vi: Con non của động vật có vú bú sữa mẹ.
image.brief: [ảnh] Một con mèo mẹ nằm nghiêng cho đàn mèo con bú, chụp ngang tầm thấp, thấy rõ mèo mẹ và các con; nền chăn hoặc sàn trơn; không có người, không có chữ. Từ khoá tìm ảnh (EN): mother cat nursing kittens
image.alt.en: A cat feeding her kittens
image.alt.vi: Mèo mẹ cho mèo con bú
examples.1.en: kittens drink milk
examples.1.vi: mèo con bú sữa
examples.2.en: a baby buffalo drinks milk
examples.2.vi: nghé con bú sữa trâu mẹ
examples.3.en: most mammals have babies, not eggs
examples.3.vi: phần lớn động vật có vú đẻ con, không đẻ trứng
examples.4.en: human babies drink milk, too
examples.4.vi: em bé cũng bú sữa mẹ
> [CẦN KIỂM] Ví dụ ba nói "phần lớn" vì thú mỏ vịt và thú lông nhím đẻ trứng; bài không nói tên hai loài này (để dành *Sinh sản ở động vật*, Scientist số một).
> Ảnh mèo mẹ cho con bú không dùng ở câu hỏi nào (là bằng chứng của q2).

#### group explore_big_small
label.en: Big and small
label.vi: To và nhỏ
color: gi_dong
sentence.en: Mammals can be big or small.
sentence.vi: Động vật có vú có con to, có con nhỏ.
image.brief: [ảnh] Một con voi châu Á trưởng thành đứng dưới nước, thấy cả con và vòi, cắt riêng một con từ ảnh cả đàn; không có chuồng, hàng rào, người, chữ. Từ khoá tìm ảnh (EN): Asian elephant standing in water
image.alt.en: An elephant in the water
image.alt.vi: Con voi dưới nước
examples.1.en: a big elephant
examples.1.vi: con voi to lớn
examples.2.en: a tiny mouse
examples.2.vi: con chuột nhỏ xíu
examples.3.en: a bat flies at night
examples.3.vi: con dơi bay ban đêm
examples.4.en: a dolphin swims in the sea
examples.4.vi: cá heo bơi dưới biển
> Theo hình designer chọn (designer 12/11): ảnh voi của *Khủng long* (`w1_elephant`) thấy rõ hàng cọc dây thép của chuồng, nên chủ đề này có ảnh voi riêng, gốc ở ô này. Mọi chỗ voi (q4 bài này, bài năm `explore_special` và từ `trunk`, bài sáu q3) trỏ về đây.

#### group explore_people
label.en: People
label.vi: Con người
color: do_son
sentence.en: People are mammals, too.
sentence.vi: Con người cũng là động vật có vú.
image.brief: [ảnh] Bàn tay một em bé nắm lấy ngón tay của người lớn, chụp cận, chỉ thấy hai bàn tay; không thấy mặt, không có nhẫn hay đồng hồ có chữ, không có chữ. Từ khoá tìm ảnh (EN): baby hand holding adult finger
image.alt.en: A baby's hand holding a finger
image.alt.vi: Bàn tay em bé nắm ngón tay người lớn
examples.1.en: we have hair
examples.1.vi: mình có tóc
examples.2.en: babies drink milk
examples.2.vi: em bé bú sữa
examples.3.en: we are animals, too
examples.3.vi: mình cũng là động vật
> Trả lời câu "Em nghĩ sao?" của bài một (Ghi chú cho dev bài một). Bài sáu hỏi lại ở Khởi động w3.

### new_words
id: 31d6b513-fa4f-4dda-a044-e4361cfdb3a7
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: mammal, milk, fur

## Chơi

> Bé chọn ba con vật có vú: một con trên cạn, một con trên trời, một con dưới nước. Đạt khi đủ ba nhóm và không chọn con nào không phải động vật có vú.
> Dùng ngay ô "Big and small": nhóm trên trời chỉ có dơi, nhóm dưới nước chỉ có cá heo. Mỗi món bẫy giống một nhóm: thằn lằn bò trên cạn, chim sẻ bay, cá vàng bơi. Bé phải nghĩ "con này có lông, có bú sữa mẹ không", không chọn theo chỗ sống.
> Cá heo ở nhóm "Dưới nước" đặt nền cho câu q6 bài bốn (`water_animals_are_fish`).

### tray
id: bce0543d-3327-4040-a7ee-366533aa4dd4
type: build_tray
version: 1
prompt.en: Pick three mammals
prompt.vi: Chọn ba con vật có vú
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick one from land, air and water.
messages.start.vi: Em chọn một con trên cạn, một con trên trời, một con dưới nước nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Mammals live in many places.
messages.balanced.vi: Tuyệt! Động vật có vú sống ở nhiều nơi.
messages.has_limited.en: Its babies do not drink milk.
messages.has_limited.vi: Con non của nó không bú sữa mẹ.
messages.missing.tray_land.en: You still need a mammal from land.
messages.missing.tray_land.vi: Em còn thiếu một con vật có vú sống trên cạn.
messages.missing.tray_air.en: You still need a mammal that flies.
messages.missing.tray_air.vi: Em còn thiếu một con vật có vú biết bay.
messages.missing.tray_water.en: You still need a mammal from water.
messages.missing.tray_water.vi: Em còn thiếu một con vật có vú sống dưới nước.
> Lời nhắn `has_limited` nói lý do, đúng cho cả ba món bẫy (thằn lằn, chim sẻ nở từ trứng; cá vàng nở từ trứng).

#### group tray_land
label.en: On land
label.vi: Trên cạn
color: gi_dong
role: required

#### group tray_air
label.en: In the air
label.vi: Trên trời
color: vang_hoe
role: required

#### group tray_water
label.en: In water
label.vi: Dưới nước
color: cham
role: required

#### group tray_not
label.en: Not a mammal
label.vi: Không phải động vật có vú
color: do_son
role: limit

#### item tray_buffalo
label.en: Buffalo
label.vi: Con trâu
group: tray_land
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu

#### item tray_sparrow
label.en: Sparrow
label.vi: Chim sẻ
group: tray_not
image.brief: Dùng lại hình `tray_sparrow` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow on a branch
image.alt.vi: Chim sẻ đậu trên cành

#### item tray_bat
label.en: Bat
label.vi: Con dơi
group: tray_air
image.brief: [ảnh] Một con dơi quả treo ngược trên cành cây, thấy rõ đôi cánh da khép quanh thân, mặt và bộ lông nâu; nền lá xanh; không có người, không có chữ. Từ khoá tìm ảnh (EN): fruit bat hanging tree branch
image.alt.en: A bat hanging from a branch
image.alt.vi: Con dơi treo trên cành
> Hình gốc, dùng lại ở câu q5, từ `bat`, thẻ thưởng, và bài ba.
> [CẦN KIỂM] Dơi quả có ở Việt Nam (biên tập nhớ loài dơi quả, dơi chó). Ảnh dơi đang bay lúc chạng vạng thường nhoè, nên chọn ảnh dơi treo; nhóm "Trên trời" dựa vào hiểu biết "dơi biết bay" của ô Học.

#### item tray_lizard
label.en: Lizard
label.vi: Thằn lằn
group: tray_not
image.brief: Dùng lại hình `w3_lizard` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): common sun skink Eutropis multifasciata on rock
image.alt.en: A lizard on a rock
image.alt.vi: Con thằn lằn trên hòn đá

#### item tray_dolphin
label.en: Dolphin
label.vi: Cá heo
group: tray_water
image.brief: [ảnh] Một con cá heo nhảy lên khỏi mặt biển xanh, thấy cả con; chụp ngoài biển, không phải cá heo biểu diễn ở bể; không có người, không có tàu, không có chữ. Ưu tiên ảnh NOAA trên Commons, không kèm logo cơ quan. Từ khoá tìm ảnh (EN): dolphin jumping out of sea NOAA
image.alt.en: A dolphin jumping out of the sea
image.alt.vi: Cá heo nhảy lên khỏi mặt biển
> Hình gốc, dùng lại ở bài bốn (món Chơi, câu q6). [CẦN KIỂM] Cá heo là động vật có vú (như `water_animals_are_fish` ở `_topic.md`).

#### item tray_cat
label.en: Cat
label.vi: Con mèo
group: tray_land
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

#### item tray_goldfish
label.en: Goldfish
label.vi: Cá vàng
group: tray_not
image.brief: Dùng lại hình `tray_goldfish` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): goldfish aquarium plants side view
image.alt.en: A goldfish in a tank
image.alt.vi: Cá vàng trong bể

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2, q3, q6), `order_sequence` (q4, ba thẻ).

### q1
id: f60bf09b-705b-440a-824e-4f7c4e429040
format: single_choice
version: 1
dok: 1
prompt.en: Which animal has fur?
prompt.vi: Con nào có bộ lông mềm?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for soft hair on its body.
hint.vi: Em tìm con có lông mềm trên mình nhé.
explanation_correct.en: Yes! A cat has fur. It is a mammal.
explanation_correct.vi: Đúng rồi! Mèo có bộ lông mềm. Mèo là động vật có vú.
explanation_wrong.en: The answer is the cat. It has fur.
explanation_wrong.vi: Đáp án là con mèo. Mèo có lông.
> Không đặt con gà trong câu này: tiếng Việt gọi lông gà cũng là "lông", bé nghe VI dễ chọn gà. Ba lựa chọn: ếch (da trơn), thằn lằn (vảy), mèo (lông). VI câu hỏi viết "bộ lông mềm" để rõ nghĩa "fur".

#### option q1_frog
correct: false
feedback.en: A frog has smooth skin, no fur.
feedback.vi: Ếch có da trơn, không có lông.
label.en: frog
label.vi: con ếch
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

#### option q1_lizard
correct: false
feedback.en: A lizard has scales, not fur.
feedback.vi: Thằn lằn có vảy, không có lông.
label.en: lizard
label.vi: thằn lằn
image.brief: Dùng lại hình `w3_lizard` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): common sun skink Eutropis multifasciata on rock
image.alt.en: A lizard on a rock
image.alt.vi: Con thằn lằn trên hòn đá

#### option q1_cat
correct: true
label.en: cat
label.vi: con mèo
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

### q2
id: 1b52b5ba-bf8c-4117-9409-5980759b7b11
format: true_false
version: 1
dok: 1
prompt.en: A kitten drinks milk from its mum.
prompt.vi: Mèo con bú sữa mẹ.
image.brief: Dùng lại hình `q4` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): kitten sitting floor looking up
image.alt.en: A kitten looking up
image.alt.vi: Mèo con ngẩng đầu nhìn lên
answer: true
hint.en: Remember the mother cat and her kittens.
hint.vi: Em nhớ lại mèo mẹ và đàn mèo con nhé.
explanation_correct.en: Yes! Kittens drink their mother's milk.
explanation_correct.vi: Đúng rồi! Mèo con bú sữa của mèo mẹ.
explanation_wrong.en: This is true. Kittens drink milk.
explanation_wrong.vi: Câu này đúng. Mèo con bú sữa mẹ.
feedback_false.en: A mother cat feeds her kittens milk.
feedback_false.vi: Mèo mẹ cho mèo con bú sữa.
> Hình câu hỏi là mèo con một mình, không phải ảnh mèo mẹ cho con bú của ô Học (bằng chứng của đáp án).

### q3
id: c9cad192-6a06-4ba5-9612-28b3953a83eb
format: true_false
version: 1
dok: 1
prompt.en: A baby buffalo comes from an egg.
prompt.vi: Nghé con nở ra từ quả trứng.
image.brief: [ảnh] Một con nghé (trâu con) đứng phía trước trên bãi cỏ, nhìn ngang, thấy cả con; phía sau chỉ thấy chân trâu mẹ và một sợi dây thép rào bãi cỏ, đầu trâu mẹ đã cắt khỏi khung; không có người, không có chữ. Từ khoá tìm ảnh (EN): water buffalo calf standing field
image.alt.en: A baby buffalo in a field
image.alt.vi: Nghé con trên đồng
answer: false
hint.en: Remember: a buffalo is a mammal.
hint.vi: Em nhớ nhé: trâu là động vật có vú.
explanation_correct.en: A mother buffalo has a baby. No egg!
explanation_correct.vi: Trâu mẹ đẻ ra nghé con, không đẻ trứng.
explanation_wrong.en: This is false. Buffaloes have babies.
explanation_wrong.vi: Câu này sai. Trâu đẻ con, không đẻ trứng.
feedback_true.en: A mother buffalo has a baby calf.
feedback_true.vi: Trâu mẹ đẻ ra một chú nghé con.
> Câu nhớ lại ví dụ ba của ô "Milk". Đáp án Sai nên giải thích khi đúng không mở đầu bằng "Yes!". Gợi ý cho bé một mắt xích (trâu là động vật có vú), bé phải tự nối với "đẻ con".
> Hình gốc, dùng lại ở câu w3 bài bốn.

### q4
id: 33db1c10-bd6b-4474-893f-03f3cb4dedc0
format: order_sequence
version: 1
dok: 2
prompt.en: Tap from smallest to biggest.
prompt.vi: Em chạm từ con nhỏ nhất tới con to nhất.
image.brief: Dùng lại hình `w1` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): rice field wind waves Vietnam
image.alt.en: Wind blowing over a rice field
image.alt.vi: Gió thổi trên cánh đồng lúa
answer: q4_cat, q4_buffalo, q4_elephant
hint.en: Think how big each one really is.
hint.vi: Em nghĩ xem ngoài đời mỗi con to cỡ nào nhé.
explanation_correct.en: Yes! Cat, buffalo, then elephant.
explanation_correct.vi: Đúng rồi! Mèo, rồi trâu, rồi voi.
explanation_wrong.en: The order is cat, buffalo, elephant.
explanation_wrong.vi: Thứ tự là mèo, trâu, voi.
> DOK 2: so sánh theo hiểu biết ngoài đời (ô "Big and small"). Ba ảnh phải cho con vật cùng cỡ trong khung, để bé không xếp theo cỡ hình (Ghi chú cho hoạ sĩ). Thẻ trong file không theo thứ tự đúng.
> Gợi ý nói "ngoài đời" để bé không nhìn cỡ hình.

#### item q4_elephant
label.en: elephant
label.vi: con voi
image.brief: Dùng lại hình `explore_big_small`. Từ khoá tìm ảnh (EN): Asian elephant standing in water
image.alt.en: An elephant in the water
image.alt.vi: Con voi dưới nước

#### item q4_cat
label.en: cat
label.vi: con mèo
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

#### item q4_buffalo
label.en: buffalo
label.vi: con trâu
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu

### q5
id: e948aba8-74db-48a3-a0df-0f2d3df72dc0
format: single_choice
version: 1
dok: 2
prompt.en: Which one is a mammal?
prompt.vi: Con nào là động vật có vú?
image.brief: Dùng lại hình `q3` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): village house yard Vietnam morning
image.alt.en: A yard in a village
image.alt.vi: Sân nhà ở làng quê
hint.en: Look for fur, not feathers.
hint.vi: Em tìm con có lông mềm, không có lông vũ nhé.
explanation_correct.en: Yes! A bat has fur. Baby bats drink milk.
explanation_correct.vi: Đúng rồi! Dơi có lông mềm, dơi con bú sữa mẹ.
explanation_wrong.en: The answer is the bat. It has fur.
explanation_wrong.vi: Đáp án là con dơi. Dơi có lông, không có lông vũ.
> DOK 2: ba con đều bay được; bé phải phân loại theo đặc điểm của động vật có vú, bỏ qua việc biết bay. Dơi là ảnh món Chơi; chim sẻ là món Chơi, cò bé đã gặp ở bài một, nên không ảnh nào mới hay nổi bật.
> Rà chữ tester 12/11 (N1): hình câu hỏi đổi từ trời chiều (gợi con dơi bay đêm) sang sân nhà làng quê (hình vẽ của *Hô hấp*, chỉ làm hình câu hỏi).

#### option q5_bat
correct: true
label.en: bat
label.vi: con dơi
image.brief: Dùng lại hình `tray_bat`. Từ khoá tìm ảnh (EN): fruit bat hanging tree branch
image.alt.en: A bat hanging from a branch
image.alt.vi: Con dơi treo trên cành

#### option q5_sparrow
correct: false
feedback.en: A sparrow is a bird with feathers.
feedback.vi: Chim sẻ là chim, có lông vũ.
label.en: sparrow
label.vi: chim sẻ
image.brief: Dùng lại hình `tray_sparrow` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow on a branch
image.alt.vi: Chim sẻ đậu trên cành

#### option q5_egret
correct: false
feedback.en: An egret is a bird with feathers.
feedback.vi: Con cò là chim, có lông vũ.
label.en: egret
label.vi: con cò
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ

### q6
id: ae453796-762c-41d9-8734-62507ba54aed
format: true_false
version: 1
dok: 2
misconception: people_not_animals
prompt.en: You have hair, so you are a mammal.
prompt.vi: Em có tóc, vậy em là động vật có vú.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: true
hint.en: What did you drink as a baby?
hint.vi: Hồi còn nhỏ xíu, em bú gì?
explanation_correct.en: Yes! You are a mammal, like a cat.
explanation_correct.vi: Đúng rồi! Em là động vật có vú, giống con mèo.
explanation_wrong.en: This is true. People are mammals, too.
explanation_wrong.vi: Câu này đúng. Con người cũng là động vật có vú.
feedback_false.en: People have hair and drink milk as babies.
feedback_false.vi: Người có tóc, hồi bé cũng bú sữa mẹ.
> Câu misconception (`people_not_animals`): bé nghe câu nói về chính mình và áp ý "có lông hoặc tóc". Bé nghĩ "người không phải động vật" sẽ chạm lắc đầu.
> Hình câu hỏi (designer 12/11, main session chốt): không có ảnh hợp lệ mái tóc bạn nhỏ từ phía sau (chỉ có ảnh người lớn, lộ mặt, hoặc nguồn ngoài danh sách), nên dùng lại cảnh trung tính góc vườn của bài một. Không dùng ảnh lông thỏ (`explore_fur`): bé nhìn con thỏ có thể chạm gật đầu vì "thỏ là động vật có vú" mà không áp vào chính mình, thành lối tắt. Không dùng ảnh bàn tay em bé (`explore_people`): đó là ô Học "People are mammals, too", bằng chứng của đáp án.
> DOK 2: áp một đặc điểm vào chính mình (tình huống mới: ô Học nói về em bé, câu này nói về chính bé). Câu EN tám từ, có "so" nối hai vế, vẫn là một câu khẳng định.
> Gợi ý hướng bé sang dấu hiệu thứ hai (bú sữa), không nói Đúng hay Sai.

## Từ vựng

### mammal
id: b6e0e40d-d99a-4f1b-8113-31fa920a0ef6
tier: core
term.en: mammal
term.vi: động vật có vú
example.en: A rabbit is a mammal.
example.vi: Con thỏ là động vật có vú.
image.brief: Dùng lại hình `explore_fur`. Từ khoá tìm ảnh (EN): white rabbit sitting grass
image.alt.en: A white rabbit on the grass
image.alt.vi: Con thỏ trắng trên cỏ

### milk
id: 6c55adc3-274d-4883-b245-a26441402dae
tier: core
term.en: milk
term.vi: sữa
example.en: Kittens drink their mother's milk.
example.vi: Mèo con bú sữa mẹ.
image.brief: Dùng lại hình `explore_milk`. Từ khoá tìm ảnh (EN): mother cat nursing kittens
image.alt.en: A cat feeding her kittens
image.alt.vi: Mèo mẹ cho mèo con bú

### fur
id: fb3f0dda-5687-4516-8368-1802c60990ce
tier: core
term.en: fur
term.vi: bộ lông
example.en: A cat has soft fur.
example.vi: Con mèo có bộ lông mềm.
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

### bat
id: cc52eb9b-8eba-4638-a3bf-4b257ea48f7f
tier: extra
term.en: bat
term.vi: con dơi
example.en: A bat is a mammal that flies.
example.vi: Dơi là động vật có vú biết bay.
image.brief: Dùng lại hình `tray_bat`. Từ khoá tìm ảnh (EN): fruit bat hanging tree branch
image.alt.en: A bat hanging from a branch
image.alt.vi: Con dơi treo trên cành

## Thưởng

### bat_card
id: 3e720cc1-14e2-41b5-8389-a63141a5b5bc
set: animals
rarity: common
name.en: Bat
name.vi: Con dơi
tag.en: A flying mammal
tag.vi: Động vật có vú biết bay
fact.en: Bats are the only mammals that really fly.
fact.vi: Dơi là loài động vật có vú duy nhất bay được thật sự.
image.brief: Dùng lại hình `tray_bat`. Từ khoá tìm ảnh (EN): fruit bat hanging tree branch
image.alt.en: A bat hanging from a branch
image.alt.vi: Con dơi treo trên cành
> [CẦN KIỂM] Dơi là nhóm động vật có vú duy nhất bay chủ động; sóc bay, chồn bay chỉ lượn. Câu EN tám từ. Bài ba dùng dơi làm lựa chọn sai ở câu q6 ("Which one is a bird?"), thẻ này giúp bé nhớ.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Không có hình tự vẽ mới. Hình câu q5 dùng lại hình vẽ sân nhà của *Hô hấp* (hình câu hỏi).
- **Ảnh cần tìm (tám):**
  - Khởi động (một): trời chiều trên rặng tre (w2; rà chữ tester 12/11 N1 chuyển từ q5 lên).
  - Học (ba): thỏ trắng trên cỏ; mèo mẹ cho con bú; bàn tay em bé nắm ngón tay người lớn.
  - Chơi (hai): dơi quả treo trên cành; cá heo nhảy khỏi mặt biển.
  - Quiz (một): nghé con (q3). Hình câu q6 dùng lại góc vườn bài một (designer 12/11: không có ảnh mái tóc hợp lệ).
  - Voi: ảnh riêng ở ô "Big and small" (designer 12/11), thay ảnh voi *Khủng long* có chuồng.
- **Dùng lại:** từ bài một (`tray_goldfish`, `explore_wild`, `tray_parakeet`, `q4`, `w1`); từ chủ đề *Khủng long* (`w3_cat`, `w3_lizard`, `q4_frog`, `w1_buffalo`); từ *Hô hấp* (`tray_sparrow`, `tray_egret`, `w1`, `q3`).
- **q4 (`order_sequence`):** ba ảnh dùng lại (mèo, trâu, voi) có cỡ con vật trong khung khác nhau. Designer cắt lại cho cả ba con chiếm cùng một phần khung (ghi `crop` trong file chọn ảnh), để bé không xếp theo cỡ hình.
- **Người trong hình:** chỉ bàn tay (ô "People"); không thấy mặt.
- **Màu:** Học: lông `vang_hoe`, sữa `cham`, to và nhỏ `gi_dong`, con người `do_son`. Chơi: trên cạn `gi_dong`, trên trời `vang_hoe`, dưới nước `cham`, không phải động vật có vú `do_son`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (bốn nhóm), `word_list` (mammal, milk, fur).
  - Chơi: `build_tray`: ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món.
  - Khởi động: `true_false` (w1, Đúng), `single_choice` (w2, ba lựa chọn). Cả hai `recall_from.lesson: goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`.
  - Quiz: `single_choice` (q1, q5), `true_false` (q2 Đúng, q3 Sai, q6 Đúng), `order_sequence` (q4, ba thẻ). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`people_not_animals`).
  - `order_sequence` cần renderer của SK-040 (bản 0.1.0 chưa hiện được; `build --min-app-version 0.1.0` sẽ báo `format_not_rendered`).
- **Vị trí đáp án đúng:** w2 thứ hai; q1 thứ ba; q5 thứ nhất. q4 thẻ trong file: voi, mèo, trâu; thứ tự đúng: mèo, trâu, voi.
- **Màn Chơi, ví dụ để kiểm:** Con trâu, Con dơi, Cá heo → `balanced`; Con mèo, Con dơi, Cá vàng → `has_limited`; Con trâu, Con mèo, Con dơi → `missing.tray_water`.
- **Từ EN có thể ngoài Starters/Movers:** mammal, fur, bat, dolphin, kitten, sparrow, egret.
