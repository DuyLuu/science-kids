---
id: 8a682955-d1ef-4b79-9a3e-b23ccbe81568
topic: goi-ten-va-nhom-dong-vat
slug: chim-va-bo-sat
order: 3
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Naming birds and reptiles
vi: Chim và bò sát
> Giữ đúng tên ở `content/syllabus.json` (`naming-and-grouping-animals`, bài số ba).

## Mục tiêu
en: I can name birds and reptiles.
vi: Em gọi tên được các loài chim và bò sát.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-041, ngày 12/11/2026. Mọi dòng `id:` để trống; chạy `ids` sau bài một và bài hai.
> Sửa `all_birds_fly` ở ô Học "Some birds cannot fly", phần Chơi (nhóm chim biết bơi) và câu q6 (gắn key). Ý "lưỡng cư và bò sát là một" của sườn: con ếch là món bẫy ở phần Chơi và lựa chọn sai ở câu q5.

## Ý chính
1.en: Birds have feathers, wings and a beak.
1.vi: Chim có lông vũ, có cánh và có mỏ.
2.en: Reptiles have dry skin with scales.
2.vi: Bò sát có da khô phủ vảy.
3.en: Birds lay eggs. Most reptiles do, too.
3.vi: Chim đẻ trứng. Phần lớn bò sát cũng đẻ trứng.
> [CẦN KIỂM] Ý ba viết "phần lớn bò sát" theo ghi chú của sườn: một số loài rắn, thằn lằn đẻ con. Câu hỏi của bài chỉ hỏi cá sấu đẻ trứng (đúng với mọi loài cá sấu).
> Từ cụ thể tới trừu tượng: bộ phận nhìn thấy của chim, da của bò sát, rồi điều chung không thấy ngay (đẻ trứng).

## Khởi động

> Hai câu: w1 ôn bài hai (bài trước), w2 ôn bài một (hai ngày trước).

### w1
id: 5f7d659b-7974-490c-8055-c5d4aebefed7
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/dong-vat-co-vu
prompt.en: Which baby drinks milk?
prompt.vi: Con non nào bú sữa mẹ?
image.brief: Dùng lại hình `w1` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): rice field wind waves Vietnam
image.alt.en: Wind blowing over a rice field
image.alt.vi: Gió thổi trên cánh đồng lúa
hint.en: Which one is a mammal?
hint.vi: Em nghĩ xem con nào là động vật có vú?
explanation_correct.en: Yes! Kittens drink milk. Chicks eat seeds.
explanation_correct.vi: Đúng rồi! Mèo con bú sữa. Gà con ăn thóc.
explanation_wrong.en: The answer is the kitten. It drinks milk.
explanation_wrong.vi: Đáp án là mèo con. Mèo con bú sữa mẹ.
> Hai lựa chọn (Explorer cho phép hai đến ba). Gà con bé gặp lại ở câu q4: gà con nở từ trứng, không bú sữa. Gợi ý không dùng "tìm con có lông": lông tơ gà con trông cũng mềm.

#### option w1_kitten
correct: true
label.en: kitten
label.vi: mèo con
image.brief: Dùng lại hình `q4` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): kitten sitting floor looking up
image.alt.en: A kitten looking up
image.alt.vi: Mèo con ngẩng đầu nhìn lên

#### option w1_chick
correct: false
label.en: chick
label.vi: gà con
image.brief: [ảnh] Một con gà con lông tơ vàng đứng trên nền đất hoặc nền cỏ, nhìn ngang, thấy cả con; không có gà mẹ, không có vỏ trứng trong hình, không có người, không có chữ. Cùng cỡ trong khung như ảnh mèo con. Từ khoá tìm ảnh (EN): yellow chick standing ground side view
image.alt.en: A yellow chick
image.alt.vi: Gà con lông vàng
> Hình gốc, dùng lại ở câu q4 bài này và câu q3 bài bốn.

### w2
id: f4e1b3b7-472c-4bcf-87a4-5921e6d6bca3
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha
prompt.en: A douc in the forest is a pet.
prompt.vi: Con voọc trong rừng là thú cưng.
image.brief: Dùng lại hình `explore_wild` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): red-shanked douc langur tree
image.alt.en: A douc in a tree
image.alt.vi: Con voọc trên cây
answer: false
hint.en: Look where the douc lives.
hint.vi: Em nhìn xem con voọc sống ở đâu nhé.
explanation_correct.en: A douc is wild. It lives free.
explanation_correct.vi: Voọc là động vật hoang dã. Voọc sống tự do.
explanation_wrong.en: This is false. A douc is a wild animal.
explanation_wrong.vi: Câu này sai. Voọc là động vật hoang dã.
> Đáp án Sai, nên giải thích khi đúng không mở đầu bằng "Yes!". Hình là chính con vật được nói tới (luật Explorer số 5).

## Học

> Bốn ô, từ cụ thể tới trừu tượng: chim (lông vũ, cánh, mỏ), chim không biết bay (`all_birds_fly`), bò sát (da khô, vảy), trứng.

### explore
id: f8d87a9a-f3df-48d4-aa44-e073e47296a7
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_birds
label.en: Birds
label.vi: Chim
color: vang_hoe
sentence.en: Birds have feathers, wings and a beak.
sentence.vi: Chim có lông vũ, có cánh và có mỏ.
image.brief: Dùng lại hình `w1_duck` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): duck standing pond bank
image.alt.en: A duck standing on the grass
image.alt.vi: Con vịt đứng trên bãi cỏ
examples.1.en: a hen in the yard
examples.1.vi: con gà trong sân
examples.2.en: a duck on the pond
examples.2.vi: con vịt dưới ao
examples.3.en: a sparrow on a branch
examples.3.vi: chim sẻ trên cành
examples.4.en: an egret in the rice field
examples.4.vi: con cò ngoài ruộng

#### group explore_no_fly
label.en: Some birds cannot fly
label.vi: Có chim không biết bay
color: cham
sentence.en: A penguin is a bird. It swims.
sentence.vi: Chim cánh cụt là chim. Chim cánh cụt bơi rất giỏi.
image.brief: [ảnh] Một con chim cánh cụt đang bơi dưới nước trong xanh, nhìn ngang, thấy cả con và đôi cánh dang ra như mái chèo; không có người, không có kính bể có chữ, không có chữ. Từ khoá tìm ảnh (EN): penguin swimming underwater
image.alt.en: A penguin swimming
image.alt.vi: Chim cánh cụt đang bơi
examples.1.en: it has feathers
examples.1.vi: có lông vũ
examples.2.en: its wings help it swim
examples.2.vi: cánh giúp nó bơi
examples.3.en: it lays eggs
examples.3.vi: đẻ trứng
examples.4.en: an ostrich runs very fast
examples.4.vi: đà điểu chạy rất nhanh
> [CẦN KIỂM] Chim cánh cụt có lông vũ ngắn, dày; dùng cánh để bơi; đẻ trứng. Đà điểu không bay được, chạy nhanh. Xem misconception `all_birds_fly` ở `_topic.md`.
> Ảnh chim cánh cụt bơi chỉ dùng ở ô này. Câu q6 dùng ảnh chim cánh cụt đứng (món Chơi), để đáp án không là ảnh ô Học hôm nay.

#### group explore_reptiles
label.en: Reptiles
label.vi: Bò sát
color: nau_dat
sentence.en: Reptiles have dry skin with scales.
sentence.vi: Bò sát có da khô phủ vảy.
image.brief: Dùng lại hình `w3_lizard` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): common sun skink Eutropis multifasciata on rock
image.alt.en: A lizard on a rock
image.alt.vi: Con thằn lằn trên hòn đá
examples.1.en: a gecko on the wall
examples.1.vi: thạch sùng trên tường
examples.2.en: a snake in the grass
examples.2.vi: con rắn trong bụi cỏ
examples.3.en: a turtle with a hard shell
examples.3.vi: con rùa có mai cứng
examples.4.en: a crocodile by the river
examples.4.vi: cá sấu bên bờ sông
> Thạch sùng là bò sát bé Việt Nam thấy hằng tối trên tường nhà (thẻ thưởng).

#### group explore_eggs
label.en: Eggs
label.vi: Trứng
color: do_son
sentence.en: Birds lay eggs. Most reptiles do, too.
sentence.vi: Chim đẻ trứng. Phần lớn bò sát cũng đẻ trứng.
image.brief: [ảnh] Một ổ rơm có ba bốn quả trứng gà màu nâu nhạt, chụp chéo từ trên xuống; không có gà, không có tay người, không có chữ hay số viết trên trứng. Từ khoá tìm ảnh (EN): hen eggs straw nest
image.alt.en: Eggs in a nest of straw
image.alt.vi: Trứng trong ổ rơm
examples.1.en: a hen lays eggs in straw
examples.1.vi: gà đẻ trứng trong ổ rơm
examples.2.en: a turtle lays eggs in sand
examples.2.vi: rùa đẻ trứng trong cát
examples.3.en: a chick comes out of an egg
examples.3.vi: gà con chui ra từ quả trứng
> [CẦN KIỂM] như ý chính ba. Rùa biển, nhiều loài rùa đẻ trứng trong cát hoặc đất (biên tập nhớ).
> Hình gốc, dùng lại ở thẻ q4_egg và từ `egg`.

### new_words
id: 5e5d5c94-662b-43c9-8908-471ae11503d3
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: bird, reptile, feathers

## Chơi

> Bé chọn ba con: một con chim biết bay, một con chim biết bơi, một con bò sát. Đạt khi đủ ba nhóm và không chọn con nào không phải chim hay bò sát.
> Dùng ngay ô "Some birds cannot fly" và ô "Reptiles":
> - nhóm "Chim biết bơi" chỉ có chim cánh cụt: chim không chỉ là con biết bay (`all_birds_fly`);
> - dơi là bẫy cho nhóm biết bay (bé đã học ở bài hai: dơi là động vật có vú);
> - ếch là bẫy cho nhóm bò sát: bốn chân, nhỏ, trông như thằn lằn, nhưng da trơn, không vảy (ý "lưỡng cư và bò sát là một" của sườn; bài bốn dạy ếch).
> Kệ bảy món, toàn ảnh chụp.

### tray
id: 5517b6e5-f3e3-46c7-b910-64cc8c3fd412
type: build_tray
version: 1
prompt.en: Pick two birds and a reptile
prompt.vi: Chọn hai con chim và một con bò sát
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: One bird flies, one swims. Add a reptile.
messages.start.vi: Một con chim biết bay, một con chim biết bơi, thêm một con bò sát nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Birds have feathers. Reptiles have scales.
messages.balanced.vi: Tuyệt! Chim có lông vũ. Bò sát có vảy.
messages.has_limited.en: That one has no feathers or scales.
messages.has_limited.vi: Con này không có lông vũ, cũng không có vảy.
messages.missing.tray_fly.en: You still need a bird that flies.
messages.missing.tray_fly.vi: Em còn thiếu một con chim biết bay.
messages.missing.tray_swim.en: You still need a bird that swims.
messages.missing.tray_swim.vi: Em còn thiếu một con chim biết bơi.
messages.missing.tray_reptile.en: You still need a reptile.
messages.missing.tray_reptile.vi: Em còn thiếu một con bò sát.
> Rà chữ tester 12/11 (N6), chọn phương án (a): bỏ món vịt. Vịt vừa bay vừa bơi; bé chọn vịt làm "con biết bay" rồi thêm chim cánh cụt sẽ bị nhắc thiếu chim biết bay, khó hiểu. Không chọn (b) đổi tên nhóm thành "Chim trên trời · Chim dưới nước": tên nhóm sẽ nói chỗ ở, mất ý chính của kệ là "có chim không biết bay" (`all_birds_fly`). Nhóm "Chim biết bơi" nay chỉ có chim cánh cụt, giống bài hai (nhóm "Trên trời" chỉ có dơi).

#### group tray_fly
label.en: Bird that flies
label.vi: Chim biết bay
color: vang_hoe
role: required

#### group tray_swim
label.en: Bird that swims
label.vi: Chim biết bơi
color: cham
role: required

#### group tray_reptile
label.en: Reptile
label.vi: Bò sát
color: nau_dat
role: required

#### group tray_not
label.en: Not a bird or reptile
label.vi: Không phải chim hay bò sát
color: do_son
role: limit

#### item tray_sparrow
label.en: Sparrow
label.vi: Chim sẻ
group: tray_fly
image.brief: Dùng lại hình `tray_sparrow` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow on a branch
image.alt.vi: Chim sẻ đậu trên cành

#### item tray_bat
label.en: Bat
label.vi: Con dơi
group: tray_not
image.brief: Dùng lại hình `tray_bat` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): fruit bat hanging tree branch
image.alt.en: A bat hanging from a branch
image.alt.vi: Con dơi treo trên cành

#### item tray_gecko
label.en: Gecko
label.vi: Thạch sùng
group: tray_reptile
image.brief: [ảnh] Một con thạch sùng bám trên bức tường quét vôi màu nhạt, nhìn từ trên xuống, thấy cả con và các ngón chân xoè; không có người, không có chữ, không có ổ điện hay đồ vật có chữ. Từ khoá tìm ảnh (EN): house gecko on wall Hemidactylus
image.alt.en: A gecko on a wall
image.alt.vi: Con thạch sùng trên tường
> Hình gốc, dùng lại ở câu q3 (đáp án) và thẻ thưởng.

#### item tray_egret
label.en: Egret
label.vi: Con cò
group: tray_fly
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ

#### item tray_frog
label.en: Frog
label.vi: Con ếch
group: tray_not
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

#### item tray_penguin
label.en: Penguin
label.vi: Chim cánh cụt
group: tray_swim
image.brief: [ảnh] Một con chim cánh cụt đứng trên tảng đá bên bờ biển, nhìn ngang, thấy cả con và hai chân; không có người, không có hàng rào sở thú, không có chữ. Từ khoá tìm ảnh (EN): penguin standing rocks side view
image.alt.en: A penguin on a rock
image.alt.vi: Chim cánh cụt đứng trên tảng đá
> Hình gốc, dùng lại ở câu q6 bài này và câu q4 bài năm.

#### item tray_turtle
label.en: Turtle
label.vi: Con rùa
group: tray_reptile
image.brief: Dùng lại hình `q3_turtle` ở bài `khung-long/vi-sao-khung-long-bien-mat`. Từ khoá tìm ảnh (EN): freshwater turtle walking side view scaly legs
image.alt.en: A turtle walking
image.alt.vi: Con rùa đang bò

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q3, q5, q6; ba lựa chọn), `true_false` (q2), `order_sequence` (q4).

### q1
id: ed297633-215b-4272-80e2-661da7670d42
format: single_choice
version: 1
dok: 1
prompt.en: Which one has feathers?
prompt.vi: Con nào có lông vũ?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for wings and a beak.
hint.vi: Em tìm con có cánh và có mỏ nhé.
explanation_correct.en: Yes! A sparrow has feathers.
explanation_correct.vi: Đúng rồi! Chim sẻ có lông vũ.
explanation_wrong.en: The answer is the sparrow. It is a bird.
explanation_wrong.vi: Đáp án là chim sẻ. Chim sẻ là chim.

#### option q1_cat
correct: false
label.en: cat
label.vi: con mèo
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

#### option q1_sparrow
correct: true
label.en: sparrow
label.vi: chim sẻ
image.brief: Dùng lại hình `tray_sparrow` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow on a branch
image.alt.vi: Chim sẻ đậu trên cành

#### option q1_frog
correct: false
label.en: frog
label.vi: con ếch
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

### q2
id: cdfd252a-7797-4cb3-a5e4-357806f2b98b
format: true_false
version: 1
dok: 1
prompt.en: A crocodile lays eggs.
prompt.vi: Cá sấu đẻ trứng.
image.brief: Dùng lại hình `q1_reptiles` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): Siamese crocodile basking riverbank side view
image.alt.en: A crocodile on a riverbank
image.alt.vi: Con cá sấu trên bờ sông
answer: true
hint.en: Is a crocodile a reptile?
hint.vi: Em nghĩ xem cá sấu có phải bò sát không?
explanation_correct.en: Yes! Crocodiles lay eggs, like birds.
explanation_correct.vi: Đúng rồi! Cá sấu đẻ trứng, giống loài chim.
explanation_wrong.en: This is true. Crocodiles lay eggs.
explanation_wrong.vi: Câu này đúng. Cá sấu đẻ trứng.
> [CẦN KIỂM] Mọi loài cá sấu đều đẻ trứng (biên tập nhớ). Câu hỏi chọn cá sấu để khỏi vướng "phần lớn bò sát".
> Hình là cá sấu không có trứng (không đưa bằng chứng).

### q3
id: d31a4264-47e4-4a4d-8c44-8ec983ba61bc
format: single_choice
version: 1
dok: 1
prompt.en: Which one is a reptile?
prompt.vi: Con nào là bò sát?
image.brief: Dùng lại hình `w2` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): dusk sky bamboo silhouette
image.alt.en: The evening sky over the trees
image.alt.vi: Trời chiều trên rặng cây
hint.en: Look for dry skin with scales.
hint.vi: Em tìm con có da khô phủ vảy nhé.
explanation_correct.en: Yes! A gecko is a reptile.
explanation_correct.vi: Đúng rồi! Thạch sùng là bò sát.
explanation_wrong.en: The answer is the gecko. It has scales.
explanation_wrong.vi: Đáp án là thạch sùng. Thạch sùng có vảy.
> Rà chữ tester 12/11 (N4): đáp án đổi từ con rắn (ảnh mới duy nhất của câu, hút mắt) sang thạch sùng, món Chơi bé vừa chạm. Cả ba ảnh bé đã gặp: thạch sùng (phần Chơi), gà mái (bài một), thỏ (bài hai). Ba con khác hẳn nhau bằng mắt. Ảnh rắn chuyển sang làm hình gốc ở câu q5.
> [CẦN KIỂM] Da thạch sùng phủ vảy rất nhỏ, nhìn gần mới thấy; người chọn ảnh chọn ảnh đủ nét để thấy da sần.

#### option q3_gecko
correct: true
label.en: gecko
label.vi: thạch sùng
image.brief: Dùng lại hình `tray_gecko`. Từ khoá tìm ảnh (EN): house gecko on wall Hemidactylus
image.alt.en: A gecko on a wall
image.alt.vi: Con thạch sùng trên tường

#### option q3_hen
correct: false
label.en: hen
label.vi: con gà mái
image.brief: Dùng lại hình `w3_hen` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): brown hen standing farmyard side view
image.alt.en: A hen in a yard
image.alt.vi: Con gà mái trong sân

#### option q3_rabbit
correct: false
label.en: rabbit
label.vi: con thỏ
image.brief: Dùng lại hình `explore_fur` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): white rabbit sitting grass
image.alt.en: A white rabbit on the grass
image.alt.vi: Con thỏ trắng trên cỏ

### q4
id: 44956783-8c7b-4dff-a0f2-904fce348388
format: order_sequence
version: 1
dok: 2
prompt.en: How does a hen grow? Tap in order.
prompt.vi: Con gà lớn lên thế nào? Em chạm theo thứ tự nhé.
image.brief: Dùng lại hình `q3` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): village house yard Vietnam morning
image.alt.en: A yard in a village
image.alt.vi: Sân nhà ở làng quê
answer: q4_egg, q4_chick, q4_hen
hint.en: Remember the nest with eggs.
hint.vi: Em nhớ lại ổ trứng ở phần Học nhé.
explanation_correct.en: Yes! Egg, then chick, then hen.
explanation_correct.vi: Đúng rồi! Quả trứng, rồi gà con, rồi gà mái.
explanation_wrong.en: The order is egg, chick, hen.
explanation_wrong.vi: Thứ tự là quả trứng, gà con, gà mái.
> DOK 2: sắp xếp theo ý "chim đẻ trứng" (ý chính ba, ví dụ ba của ô "Eggs"). Không dạy vòng đời đầy đủ (để dành *Sự sống mới*). Thẻ trong file không theo thứ tự đúng.
> Hình câu hỏi là sân nhà trống, không dùng ảnh gà mẹ và gà con của bài một (có sẵn hai trong ba thẻ).

#### item q4_chick
label.en: chick
label.vi: gà con
image.brief: Dùng lại hình `w1_chick`. Từ khoá tìm ảnh (EN): yellow chick standing ground side view
image.alt.en: A yellow chick
image.alt.vi: Gà con lông vàng

#### item q4_hen
label.en: hen
label.vi: gà mái
image.brief: Dùng lại hình `w3_hen` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): brown hen standing farmyard side view
image.alt.en: A hen in a yard
image.alt.vi: Con gà mái trong sân

#### item q4_egg
label.en: egg
label.vi: quả trứng
image.brief: Dùng lại hình `explore_eggs`, cắt sát ba quả trứng. Từ khoá tìm ảnh (EN): hen eggs straw nest
image.alt.en: Eggs in a nest of straw
image.alt.vi: Trứng trong ổ rơm
> Nhãn số ít "egg" · "quả trứng" như hai thẻ kia, dù ảnh có vài quả trứng trong ổ. Designer có thể cắt cận một quả cho khớp nhãn (ghi `crop`).

### q5
id: ec68c223-7825-4cd3-8ec0-1168a6f439b3
format: single_choice
version: 1
dok: 2
prompt.en: Which one is a reptile, like a snake?
prompt.vi: Con nào là bò sát, giống con rắn?
image.brief: [ảnh] Một con rắn roi đồng sọc vàng nâu (*Dendrelaphis*, không độc) nằm yên trên lá, thấy rõ vảy trên thân và cả đầu, miệng khép; không có tay người, không có chữ. Từ khoá tìm ảnh (EN): green snake resting on branch
image.alt.en: A snake on the leaves
image.alt.vi: Con rắn nằm trên lá
> Hình gốc (chuyển từ lựa chọn `q3_snake` cũ, rà chữ tester 12/11 N4), dùng lại ở từ `scales`, bài năm (món Chơi), bài sáu (câu w1). Chọn ảnh không đáng sợ: rắn nằm yên, không há miệng, không thè lưỡi dài. [CẦN KIỂM] Người chọn ảnh ghi tên loài để chuyên môn xác nhận không độc.
hint.en: Look for dry skin with scales.
hint.vi: Em tìm con có da khô phủ vảy nhé.
explanation_correct.en: Yes! Turtles and snakes are both reptiles.
explanation_correct.vi: Đúng rồi! Rùa và rắn đều là bò sát.
explanation_wrong.en: The answer is the turtle. It is a reptile.
explanation_wrong.vi: Đáp án là con rùa. Rùa cũng là bò sát.
> DOK 2: phân loại theo nhóm, không theo dáng. Rùa trông khác hẳn rắn (có mai, có chân), còn ếch trông giống thằn lằn hơn; bé phải dựa vào da và vảy. Câu hỏi bảy từ. Khác câu q3: ở q3 đáp án là con trông "bò sát" nhất; ở đây đáp án trông khác hẳn con được so.
> Hình câu hỏi là con rắn: đó là vật được so, không phải đáp án.
> Gợi ý giống câu q3 có chủ ý: cùng một dấu hiệu, áp vào con vật trông khác hẳn.

#### option q5_frog
correct: false
label.en: frog
label.vi: con ếch
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

#### option q5_turtle
correct: true
label.en: turtle
label.vi: con rùa
image.brief: Dùng lại hình `q3_turtle` ở bài `khung-long/vi-sao-khung-long-bien-mat`. Từ khoá tìm ảnh (EN): freshwater turtle walking side view scaly legs
image.alt.en: A turtle walking
image.alt.vi: Con rùa đang bò

#### option q5_cat
correct: false
label.en: cat
label.vi: con mèo
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

### q6
id: 32d02749-d8ce-42e0-9be4-071ae298cf7e
format: single_choice
version: 1
dok: 2
misconception: all_birds_fly
prompt.en: Which one is a bird?
prompt.vi: Con nào là chim?
image.brief: [ảnh] Một cành cây khô trống vươn ngang trên nền trời xanh có mây trắng; không có chim, không có con vật, không có dây điện, không có chữ. Từ khoá tìm ảnh (EN): bare branch blue sky
image.alt.en: An empty branch under the sky
image.alt.vi: Cành cây trống dưới bầu trời
hint.en: Look for feathers and a beak.
hint.vi: Em tìm con có lông vũ và có mỏ nhé.
explanation_correct.en: Yes! A penguin is a bird. It swims.
explanation_correct.vi: Đúng rồi! Chim cánh cụt là chim. Nó bơi, không bay.
explanation_wrong.en: The answer is the penguin. It has feathers.
explanation_wrong.vi: Đáp án là chim cánh cụt. Chim cánh cụt có lông vũ.
> Câu misconception (`all_birds_fly`), bằng hình: hai lựa chọn sai đều biết bay (dơi, chuồn chuồn), đáp án là con chim không biết bay. Bé còn nghĩ "chim là con biết bay" sẽ chọn dơi hoặc chuồn chuồn.
> DOK 2: phân loại theo đặc điểm (lông vũ, mỏ), bỏ qua đặc điểm gây nhiễu (biết bay). Chuồn chuồn là côn trùng, bé thấy ngoài đồng; bài không cần dạy tên nhóm côn trùng.
> Hình câu hỏi là cành cây trống trên trời: chỗ chim hay đậu, gợi "bay" mà không cho thấy con nào.

#### option q6_bat
correct: false
label.en: bat
label.vi: con dơi
image.brief: Dùng lại hình `tray_bat` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): fruit bat hanging tree branch
image.alt.en: A bat hanging from a branch
image.alt.vi: Con dơi treo trên cành

#### option q6_dragonfly
correct: false
label.en: dragonfly
label.vi: chuồn chuồn
image.brief: [ảnh] Một con chuồn chuồn đậu trên ngọn cỏ, nhìn ngang, thấy rõ bốn cánh trong và thân dài; nền xanh mờ; không có người, không có chữ. Chụp cận để chuồn chuồn chiếm phần lớn khung như hai hình kia. Từ khoá tìm ảnh (EN): dragonfly perched grass side view
image.alt.en: A dragonfly on a grass stem
image.alt.vi: Con chuồn chuồn đậu trên ngọn cỏ

#### option q6_penguin
correct: true
label.en: penguin
label.vi: chim cánh cụt
image.brief: Dùng lại hình `tray_penguin`. Từ khoá tìm ảnh (EN): penguin standing rocks side view
image.alt.en: A penguin on a rock
image.alt.vi: Chim cánh cụt đứng trên tảng đá

## Từ vựng

### bird
id: 029b1dc1-9aec-4912-af8e-0b1d40c89b0e
tier: core
term.en: bird
term.vi: chim
example.en: A duck is a bird.
example.vi: Con vịt là một loài chim.
image.brief: Dùng lại hình `w1_duck` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): duck standing pond bank
image.alt.en: A duck standing on the grass
image.alt.vi: Con vịt đứng trên bãi cỏ

### reptile
id: 5dc11786-8a54-4cc1-8880-3661eca72e23
tier: core
term.en: reptile
term.vi: bò sát
example.en: A lizard is a reptile.
example.vi: Thằn lằn là bò sát.
image.brief: Dùng lại hình `w3_lizard` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): common sun skink Eutropis multifasciata on rock
image.alt.en: A lizard on a rock
image.alt.vi: Con thằn lằn trên hòn đá

### feathers
id: ccbb9f36-b271-4f70-a3db-4ffa7bdaf219
tier: core
term.en: feathers
term.vi: lông vũ
example.en: Birds have feathers.
example.vi: Chim có lông vũ.
image.brief: Dùng lại hình `tray_sparrow` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow on a branch
image.alt.vi: Chim sẻ đậu trên cành

### scales
id: 1deb6049-1d12-44f3-adea-dd7391663dc2
tier: extra
term.en: scales
term.vi: vảy
example.en: A snake has dry scales.
example.vi: Rắn có lớp vảy khô.
image.brief: Dùng lại hình `q5`. Từ khoá tìm ảnh (EN): green snake resting on branch
image.alt.en: A snake on the leaves
image.alt.vi: Con rắn nằm trên lá
> Bài bốn nói "phần lớn cá có vảy"; từ này ở bài ba gắn với bò sát, bài bốn nhắc lại ở ô "Fish".

### egg
id: fc70607f-93b3-4b2d-962e-84e66c026c6c
tier: extra
term.en: egg
term.vi: quả trứng
example.en: A hen lays an egg.
example.vi: Gà mái đẻ một quả trứng.
image.brief: Dùng lại hình `explore_eggs`. Từ khoá tìm ảnh (EN): hen eggs straw nest
image.alt.en: Eggs in a nest of straw
image.alt.vi: Trứng trong ổ rơm

## Thưởng

### gecko_card
id: 5f64c30d-5962-4315-8be8-e11ba394cfa0
set: animals
rarity: common
name.en: Gecko
name.vi: Thạch sùng
tag.en: Lives in our homes
tag.vi: Sống trong nhà mình
fact.en: A gecko can walk on walls and ceilings.
fact.vi: Thạch sùng bò được lên tường, cả trên trần nhà.
image.brief: Dùng lại hình `tray_gecko`. Từ khoá tìm ảnh (EN): house gecko on wall Hemidactylus
image.alt.en: A gecko on a wall
image.alt.vi: Con thạch sùng trên tường
> [CẦN KIỂM] Thạch sùng bám tường và trần nhà nhờ các nếp nhỏ li ti ở ngón chân (biên tập nhớ). Rà chữ tester 12/11 (n9): EN sửa thành "A gecko can walk on walls and ceilings." (tám từ) cho khớp VI.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật; hình câu q4 là hình vẽ sân nhà dùng lại của *Hô hấp* (hình câu hỏi, không phải thẻ).
- **Ảnh cần tìm (tám):**
  - Khởi động (một): gà con lông vàng.
  - Học (hai): chim cánh cụt đang bơi; ổ trứng gà trong rơm.
  - Chơi (hai): thạch sùng trên tường; chim cánh cụt đứng trên đá.
  - Quiz (ba): rắn xanh nằm yên trên cành (hình câu q5); cành cây trống trên trời (q6); chuồn chuồn đậu trên ngọn cỏ.
- **Ảnh khó:** chim cánh cụt không có ở Việt Nam, ảnh thường chụp ở sở thú có hàng rào, biển: chọn ảnh hoang dã (Nam Cực, Nam Phi) trên Commons. Rắn: chọn ảnh hiền, ghi tên loài.
- **q4 (`order_sequence`):** ba ảnh (trứng, gà con, gà mái) cắt cho vật chiếm cùng phần khung; trứng cắt cận một quả nếu được.
- **q6:** dơi treo, chuồn chuồn đậu, chim cánh cụt đứng: cả ba con đang đứng yên, không con nào đang bay, để tư thế không báo đáp án.
- **Màu:** Học: chim `vang_hoe`, chim không biết bay `cham`, bò sát `nau_dat`, trứng `do_son`. Chơi: chim biết bay `vang_hoe`, chim biết bơi `cham`, bò sát `nau_dat`, không phải chim hay bò sát `do_son`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (bốn nhóm), `word_list` (bird, reptile, feathers).
  - Chơi: `build_tray`: ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món (bỏ vịt, rà chữ tester 12/11 N6).
  - Khởi động: `single_choice` (w1, hai lựa chọn, ôn bài hai), `true_false` (w2, Sai, ôn bài một).
  - Quiz: `single_choice` (q1, q3, q5, q6), `true_false` (q2, Đúng), `order_sequence` (q4). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`all_birds_fly`).
- **Vị trí đáp án đúng:** w1 thứ nhất; q1 thứ hai; q3 thứ nhất; q5 thứ hai; q6 thứ ba. q4 thẻ trong file: gà con, gà mái, trứng; thứ tự đúng: trứng, gà con, gà mái.
- **Màn Chơi, ví dụ để kiểm:** Chim sẻ, Chim cánh cụt, Thạch sùng → `balanced`; Con cò, Chim cánh cụt, Con ếch → `has_limited`; Chim sẻ, Con cò, Con rùa → `missing.tray_swim`.
- **Từ EN có thể ngoài Starters/Movers:** reptile, feathers, scales, beak, penguin, gecko, ostrich, dragonfly, egret.
