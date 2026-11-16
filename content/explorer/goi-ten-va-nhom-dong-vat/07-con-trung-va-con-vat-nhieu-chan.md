---
id: e5553e44-a083-4cbd-9dd9-bdf52895bc7f
topic: goi-ten-va-nhom-dong-vat
slug: con-trung-va-con-vat-nhieu-chan
order: 7
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Insects and other many-legged animals
vi: Côn trùng và con vật nhiều chân
> Bài mở rộng, không có trong sườn Oak (Oak Year 1 không dạy động vật không xương sống). Duy yêu cầu 13/11 sau khi chạy thử. Tên bài do biên tập đặt; PM thêm bài này vào `content/syllabus.json` và `syllabus.md` (chủ đề từ sáu thành tám bài).

## Mục tiêu
en: I can name animals with no backbone.
vi: Em gọi tên được những con vật không có xương sống.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-041, ngày 13/11/2026. Mọi dòng `id:` để trống; chạy `ids` sau bài một đến sáu.
> Ý xuyên suốt bài bảy và tám: có xương sống hay không có xương sống. Cá, lưỡng cư, bò sát, chim, động vật có vú (bài hai đến bốn) đều có xương sống. Bài này là nhóm chân khớp (côn trùng, nhện, cua tôm, cuốn chiếu); bài tám là thân mềm, da gai, bọt biển, sứa.
> Không bắt bé nhớ tên ngành ("chân khớp", "chân đốt"). Chữ cho bé nói bằng điều nhìn thấy: số chân, chân gập được ở khớp. Tên nhóm "arthropod" · "chân khớp" chỉ là từ `extra` để nghe.
> Sửa `bugs_not_animals` ở câu q6 (gắn key). Ý "nhện là côn trùng" sửa ở ô "Spiders" và câu q3, không gắn key.

## Ý chính
1.en: You have a backbone. Feel it on your back.
1.vi: Em có xương sống. Em sờ dọc lưng mình thử xem.
2.en: Insects and spiders have no backbone.
2.vi: Côn trùng và nhện không có xương sống.
3.en: Their legs bend at many little joints.
3.vi: Chân của chúng gập được ở nhiều khớp nhỏ.
> Từ cụ thể tới trừu tượng: điều bé tự sờ được (xương sống của mình), những con bé thấy quanh nhà, rồi điểm chung của cả nhóm (chân có khớp).
> [CẦN KIỂM] Ý ba: động vật chân khớp có bộ xương ngoài cứng và chân có nhiều đốt nối bằng khớp. Chữ cho bé không nói "bộ xương ngoài".

## Khởi động

> Ba câu ôn trộn: w1 bài sáu (bài trước), w2 bài hai, w3 bài bốn.

### w1
id: 3fd9ad49-815d-4942-a9c5-1e197e5a9875
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/con-vat-an-gi
prompt.en: Which one is a meat-eater?
prompt.vi: Con nào ăn thịt?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Remember the Meat-eaters picture.
hint.vi: Em nhớ lại ô Ăn thịt nhé.
explanation_correct.en: Yes! An egret catches fish and frogs.
explanation_correct.vi: Đúng rồi! Cò bắt cá và ếch nhái để ăn.
explanation_wrong.en: The answer is the egret. It eats fish.
explanation_wrong.vi: Đáp án là con cò. Cò ăn cá.
> Hình câu hỏi là hàng rào tre trước khu vườn, trung tính cho cả thỏ lẫn cò. Không dùng ao, ruộng (gợi con cò), cũng không dùng trời chiều (gợi con biết bay; rà chữ tester 13/11 N4). Gợi ý nhắc tên ô Học vì điều cần biết (thức ăn) không nhìn thấy (main session chốt 12/11, câu 4).

#### option w1_rabbit
correct: false
feedback.en: A rabbit eats leaves and grass.
feedback.vi: Thỏ ăn lá rau và cỏ.
label.en: rabbit
label.vi: con thỏ
image.brief: Dùng lại hình `explore_fur` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): white rabbit sitting grass
image.alt.en: A white rabbit on the grass
image.alt.vi: Con thỏ trắng trên cỏ

#### option w1_egret
correct: true
label.en: egret
label.vi: con cò
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ

### w2
id: 2eeb85ac-f2f8-4cdb-85eb-b307f4492e77
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/dong-vat-co-vu
prompt.en: A bat is a bird.
prompt.vi: Con dơi là một loài chim.
image.brief: Dùng lại hình `tray_bat` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): fruit bat hanging tree branch
image.alt.en: A bat hanging from a branch
image.alt.vi: Con dơi treo trên cành
answer: false
hint.en: Does a bat have feathers?
hint.vi: Em nghĩ xem dơi có lông vũ không?
explanation_correct.en: A bat is a mammal. It has fur.
explanation_correct.vi: Dơi là động vật có vú. Dơi có lông.
explanation_wrong.en: This is false. A bat is a mammal.
explanation_wrong.vi: Câu này sai. Dơi là động vật có vú.
feedback_true.en: A bat has fur, not feathers.
feedback_true.vi: Dơi có lông, không có lông vũ.
> Câu ví dụ Đạt ở luật Explorer số 5 của TEMPLATE. Đáp án Sai, giải thích khi đúng không mở đầu bằng "Yes!". Chuẩn bị ý "có nhiều nhóm con vật" trước khi gặp nhóm mới.

### w3
id: 320151bd-0db5-4300-93f1-dd1c9bb03fdf
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/ca-va-luong-cu
prompt.en: Frogs lay eggs in water.
prompt.vi: Ếch đẻ trứng dưới nước.
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước
answer: true
hint.en: Remember how a frog grows.
hint.vi: Em nhớ lại con ếch lớn lên thế nào nhé.
explanation_correct.en: Yes! Then tadpoles grow in the water.
explanation_correct.vi: Đúng rồi! Rồi nòng nọc lớn lên dưới nước.
explanation_wrong.en: This is true. Frogs lay eggs in water.
explanation_wrong.vi: Câu này đúng. Ếch đẻ trứng dưới nước.
feedback_false.en: Frog eggs float in ponds and rice fields.
feedback_false.vi: Trứng ếch nổi trên mặt ao, mặt ruộng.
> Hình là con ếch, không phải ảnh trứng ếch của bài bốn (bằng chứng của đáp án).

## Học

> Năm ô, từ cụ thể tới trừu tượng: xương sống (bé tự sờ, nối bài hai đến bốn), côn trùng (sáu chân), nhện (tám chân), cua và tôm (mười chân), cuốn chiếu và rết (rất nhiều chân). Đếm chân là cách bé tự phân biệt được, không cần tên ngành.
> Năm ô (schema cho hai đến sáu): bốn nhóm chân khớp Duy liệt kê, cộng ô xương sống để nối các bài trước.
> Không có ảnh bọ cạp, ảnh rết: hai con này chỉ có trong ví dụ chữ, để màn Học không có hình gây sợ. Vì vậy tên ô chỉ là "Spiders" · "Nhện" (rà chữ tester 13/11 N6): ảnh và tên ô cùng nói về một con.

### explore
id: da82a8ad-7861-453f-b0c1-00bf923d1029
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_backbone
label.en: Backbone
label.vi: Xương sống
color: do_son
sentence.en: Lots of animals have a backbone.
sentence.vi: Rất nhiều con vật có xương sống.
image.brief: Dùng lại hình `t_rex` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): Tyrannosaurus rex skeleton museum mount side view horizontal posture
image.alt.en: A T. rex skeleton in a museum
image.alt.vi: Bộ xương khủng long bạo chúa trong bảo tàng
examples.1.en: fish, birds and mammals
examples.1.vi: cá, chim và động vật có vú
examples.2.en: frogs and snakes have one, too
examples.2.vi: ếch và rắn cũng có xương sống
examples.3.en: feel the bones down your back
examples.3.vi: em sờ những đốt xương dọc lưng mình
examples.4.en: it helps the body stand and move
examples.4.vi: xương sống giúp cơ thể đứng thẳng và cử động
> Rà chữ tester 13/11 (N2), phương án (a): ảnh bộ xương mèo bỏ (bé vừa thấy con mèo sống trong cùng bài, dễ hiểu thành "con mèo chết rồi"). Dùng lại bộ xương khủng long bạo chúa trong bảo tàng của chủ đề *Khủng long* (Discoverer): trẻ thấy vui, không thấy buồn, và thấy rõ cột sống dài. Designer chép mục gốc như các ảnh Discoverer khác. `sentence` đổi cho khớp hình; "cá, chim, động vật có vú" xuống ví dụ một.
> Ô Học trộn một hình bộ xương với bốn ảnh con vật sống; luật "một loại hình" chỉ áp cho câu và kệ, nên không vướng.
> [CẦN KIỂM] Ví dụ hai: lưỡng cư, bò sát có xương sống (động vật có xương sống gồm cá, lưỡng cư, bò sát, chim, thú).

#### group explore_insects
label.en: Insects
label.vi: Côn trùng
color: vang_hoe
sentence.en: Insects have six legs and no backbone.
sentence.vi: Côn trùng có sáu chân và không có xương sống.
image.brief: [ảnh] Một con châu chấu xanh đậu trên lá, ảnh ngang, nhìn nghiêng, thấy rõ cả sáu chân và các khớp chân; nền xanh mờ; không có tay người, không có chữ. Từ khoá tìm ảnh (EN): grasshopper on leaf side view
image.alt.en: A grasshopper on a leaf
image.alt.vi: Con châu chấu trên lá
examples.1.en: an ant
examples.1.vi: con kiến
examples.2.en: a butterfly
examples.2.vi: con bướm
examples.3.en: a grasshopper
examples.3.vi: con châu chấu
examples.4.en: a dragonfly
examples.4.vi: con chuồn chuồn
> [CẦN KIỂM] Côn trùng trưởng thành có sáu chân. Chuồn chuồn bé đã gặp ở bài ba q6 (không phải chim).

#### group explore_spiders
label.en: Spiders
label.vi: Nhện
color: nau_dat
sentence.en: A spider has eight legs.
sentence.vi: Con nhện có tám chân.
image.brief: [ảnh] Một con nhện vườn nhỏ màu vàng đen nằm giữa mạng tơ, ảnh ngang, chụp vừa, thấy rõ tám chân và mạng tơ; không chụp quá cận, không thấy răng nanh, không phải nhện lông lá to; nền xanh mờ; không có tay người, không có chữ. Từ khoá tìm ảnh (EN): garden orb spider web
image.alt.en: A spider in its web
image.alt.vi: Con nhện trên mạng tơ
examples.1.en: a spider spins a web
examples.1.vi: nhện giăng tơ
examples.2.en: a scorpion has eight legs, too
examples.2.vi: bọ cạp cũng có tám chân
examples.3.en: spiders are not insects
examples.3.vi: nhện không phải côn trùng
examples.4.en: look, but do not touch
examples.4.vi: chỉ nhìn thôi, đừng chạm vào
> [CẦN KIỂM] Nhện và bọ cạp thuộc lớp hình nhện, có tám chân; càng của bọ cạp không tính là chân. Ví dụ bốn là lời dặn an toàn (một số loài nhện, bọ cạp cắn, chích đau).
> Hình gốc, dùng lại ở câu q3, câu q4, món Chơi, từ `spider`.

#### group explore_crabs
label.en: Crabs and shrimps
label.vi: Cua và tôm
color: cham
sentence.en: Crabs have ten legs and hard shells.
sentence.vi: Cua có mười chân và lớp vỏ cứng.
image.brief: [ảnh] Một con cua đồng nâu đứng trên bùn ruộng hoặc bờ đất ẩm, ảnh ngang, nhìn từ trên chếch xuống, thấy rõ hai càng và tám chân bò; không có tay người, không có chữ, không phải cua đã luộc. Từ khoá tìm ảnh (EN): freshwater rice field crab mud
image.alt.en: A crab on the mud
image.alt.vi: Con cua trên bùn
examples.1.en: a crab in the rice field
examples.1.vi: cua đồng ngoài ruộng
examples.2.en: a shrimp in the pond
examples.2.vi: tôm dưới ao
examples.3.en: the front legs are big claws
examples.3.vi: đôi chân trước là hai cái càng
> [CẦN KIỂM] Cua, tôm (bộ mười chân) có mười chân, đôi trước của cua là đôi càng. Tôm còn có các chân bơi nhỏ dưới bụng; chữ cho bé chỉ nói "mười chân" ở cua.
> Hình gốc, dùng lại ở món Chơi, câu q5, từ `crab`.

#### group explore_millipedes
label.en: Lots of legs
label.vi: Rất nhiều chân
color: gi_dong
sentence.en: Millipedes and centipedes have lots of legs.
sentence.vi: Cuốn chiếu và con rết có rất nhiều chân.
image.brief: [ảnh] Một con cuốn chiếu nâu bò trên lá khô, ảnh ngang, thân nằm ngang khung, thấy rõ hàng chân dày; không có tay người, không có chữ. Không dùng ảnh rết. Từ khoá tìm ảnh (EN): millipede on dry leaves side view
image.alt.en: A millipede on dry leaves
image.alt.vi: Con cuốn chiếu trên lá khô
examples.1.en: a millipede curls up when scared
examples.1.vi: cuốn chiếu cuộn tròn khi sợ
examples.2.en: a centipede runs very fast
examples.2.vi: con rết chạy rất nhanh
examples.3.en: do not touch a centipede
examples.3.vi: đừng chạm vào con rết
> [CẦN KIỂM] Cuốn chiếu, rết có nhiều đôi chân (không phải đúng một nghìn, một trăm); nhiều loài cuốn chiếu cuộn tròn khi bị động; rết cắn có nọc, đau. Chữ cho bé không đưa số chân.
> Hình gốc, dùng lại ở món Chơi, câu q4.

### new_words
id: 9e403a69-9d11-4a07-9e45-38b547af6fcc
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: backbone, insect, spider

## Chơi

> Bé chọn ba con không có xương sống: một con sáu chân, một con tám chân, một con nhiều hơn tám chân. Đạt khi đủ ba nhóm và không chọn con có xương sống.
> Dùng ngay các ô Học: bé đếm chân để xếp. Món bẫy giống một nhóm: chim sẻ bay như con bướm; thằn lằn nhỏ bò trên tường như con nhện. Bé phải nghĩ "con này có xương sống không".
> Rà chữ tester 13/11 (N3), chọn phương án (a): nhóm thứ ba đổi tên thành "More than eight legs" · "Nhiều hơn tám chân", gồm cua, tôm (mười chân) và cuốn chiếu. Tên cũ "Rất nhiều chân" trùng tên ô Học chỉ có cuốn chiếu và rết. Giữ cua, tôm (không chọn (b)): kệ vẫn đủ tám món như khuôn chung, và "nhiều hơn tám" là điều bé đếm được, cả khi bé đếm cua ra tám chân bò cộng hai càng.
> Nhãn `limit` là "Has a backbone" · "Có xương sống" (tester 13/11 đồng ý giữ, vì "Not without a backbone" là phủ định hai lần); màu `do_son` như nhóm bẫy của sáu bài trước (N1).
> Kệ tám món, toàn ảnh chụp.

### tray
id: dd4c5ca8-bc23-4f89-8d65-64550f4a0af9
type: build_tray
version: 1
prompt.en: Pick three animals with no backbone
prompt.vi: Chọn ba con vật không có xương sống
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find six legs, eight legs and more.
messages.start.vi: Em tìm một con sáu chân, một con tám chân, một con nhiều chân hơn nữa nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! None of them has a backbone.
messages.balanced.vi: Tuyệt! Không con nào có xương sống.
messages.has_limited.en: That one has a backbone.
messages.has_limited.vi: Con này có xương sống.
messages.missing.tray_six.en: You still need an animal with six legs.
messages.missing.tray_six.vi: Em còn thiếu một con sáu chân.
messages.missing.tray_eight.en: You still need an animal with eight legs.
messages.missing.tray_eight.vi: Em còn thiếu một con tám chân.
messages.missing.tray_lots.en: You still need one with more legs.
messages.missing.tray_lots.vi: Em còn thiếu một con nhiều chân hơn nữa.
> `messages.start.en` sáu từ.

#### group tray_six
label.en: Six legs
label.vi: Sáu chân
color: vang_hoe
role: required

#### group tray_eight
label.en: Eight legs
label.vi: Tám chân
color: nau_dat
role: required

#### group tray_lots
label.en: More than eight legs
label.vi: Nhiều hơn tám chân
color: gi_dong
role: required

#### group tray_backbone
label.en: Has a backbone
label.vi: Có xương sống
color: do_son
role: limit

#### item tray_ant
label.en: Ant
label.vi: Con kiến
group: tray_six
image.brief: [ảnh] Một con kiến đỏ (kiến vàng) đứng trên lá, ảnh ngang, chụp cận, thấy rõ sáu chân và ba phần thân; không có tay người, không có chữ. Từ khoá tìm ảnh (EN): weaver ant on leaf close up
image.alt.en: An ant on a leaf
image.alt.vi: Con kiến trên lá
> Hình gốc, dùng lại ở câu q1, câu q4, câu q6.

#### item tray_sparrow
label.en: Sparrow
label.vi: Chim sẻ
group: tray_backbone
image.brief: Dùng lại hình `tray_sparrow` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow on a branch
image.alt.vi: Chim sẻ đậu trên cành

#### item tray_spider
label.en: Spider
label.vi: Con nhện
group: tray_eight
image.brief: Dùng lại hình `explore_spiders`. Từ khoá tìm ảnh (EN): garden orb spider web
image.alt.en: A spider in its web
image.alt.vi: Con nhện trên mạng tơ

#### item tray_crab
label.en: Crab
label.vi: Con cua
group: tray_lots
image.brief: Dùng lại hình `explore_crabs`. Từ khoá tìm ảnh (EN): freshwater rice field crab mud
image.alt.en: A crab on the mud
image.alt.vi: Con cua trên bùn

#### item tray_butterfly
label.en: Butterfly
label.vi: Con bướm
group: tray_six
image.brief: [ảnh] Một con bướm đậu trên bông hoa, cánh mở, ảnh ngang, thấy rõ thân và chân; không có tay người, không có chữ. Từ khoá tìm ảnh (EN): butterfly on flower wings open
image.alt.en: A butterfly on a flower
image.alt.vi: Con bướm đậu trên hoa

#### item tray_lizard
label.en: Lizard
label.vi: Thằn lằn
group: tray_backbone
image.brief: Dùng lại hình `w3_lizard` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): common sun skink Eutropis multifasciata on rock
image.alt.en: A lizard on a rock
image.alt.vi: Con thằn lằn trên hòn đá

#### item tray_millipede
label.en: Millipede
label.vi: Cuốn chiếu
group: tray_lots
image.brief: Dùng lại hình `explore_millipedes`. Từ khoá tìm ảnh (EN): millipede on dry leaves side view
image.alt.en: A millipede on dry leaves
image.alt.vi: Con cuốn chiếu trên lá khô

#### item tray_shrimp
label.en: Shrimp
label.vi: Con tôm
group: tray_lots
image.brief: Dùng lại hình `tray_shrimp` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): freshwater shrimp alive underwater side view
image.alt.en: A shrimp in water
image.alt.vi: Con tôm dưới nước

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2, q3, q6), `order_sequence` (q4).

### q1
id: ab1a8605-0d57-49c3-ae2c-5b451a7e0357
format: single_choice
version: 1
dok: 1
prompt.en: Which one is an insect?
prompt.vi: Con nào là côn trùng?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Count the legs. Look for six.
hint.vi: Em đếm chân nhé, tìm con có sáu chân.
explanation_correct.en: Yes! Ants, bees and butterflies are insects.
explanation_correct.vi: Đúng rồi! Kiến, ong, bướm đều là côn trùng.
explanation_wrong.en: The answer is the ant. It has six legs.
explanation_wrong.vi: Đáp án là con kiến. Kiến có sáu chân.
> Ba lựa chọn khác nhau rõ: nhện (tám chân), kiến (sáu chân), chim sẻ (hai chân). Rà chữ tester 13/11 (N5): thay mèo bằng nhện, để đáp án không phải con mới duy nhất giữa hai con quen; nhện và kiến đều mới hôm nay, bé phải đếm chân thật.

#### option q1_spider
correct: false
feedback.en: A spider has eight legs.
feedback.vi: Con nhện có tám chân.
label.en: spider
label.vi: con nhện
image.brief: Dùng lại hình `explore_spiders`. Từ khoá tìm ảnh (EN): garden orb spider web
image.alt.en: A spider in its web
image.alt.vi: Con nhện trên mạng tơ

#### option q1_ant
correct: true
label.en: ant
label.vi: con kiến
image.brief: Dùng lại hình `tray_ant`. Từ khoá tìm ảnh (EN): weaver ant on leaf close up
image.alt.en: An ant on a leaf
image.alt.vi: Con kiến trên lá

#### option q1_sparrow
correct: false
feedback.en: A sparrow has two legs and feathers.
feedback.vi: Chim sẻ có hai chân và có lông vũ.
label.en: sparrow
label.vi: chim sẻ
image.brief: Dùng lại hình `tray_sparrow` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow on a branch
image.alt.vi: Chim sẻ đậu trên cành

### q2
id: d45a8c6f-c68c-48e5-95df-9e17770bce03
format: true_false
version: 1
dok: 1
prompt.en: A fish has a backbone.
prompt.vi: Con cá có xương sống.
image.brief: Dùng lại hình `explore_fish` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): common carp swimming underwater side view
image.alt.en: A carp swimming
image.alt.vi: Con cá chép đang bơi
answer: true
hint.en: Remember the Backbone picture.
hint.vi: Em nhớ lại ô Xương sống nhé.
explanation_correct.en: Yes! Fish, birds and mammals have backbones.
explanation_correct.vi: Đúng rồi! Cá, chim và động vật có vú đều có xương sống.
explanation_wrong.en: This is true. A fish has a backbone.
explanation_wrong.vi: Câu này đúng. Con cá có xương sống.
feedback_false.en: A fish has a backbone inside its body.
feedback_false.vi: Cá có xương sống bên trong thân.
> Hình là cá chép đang bơi, không thấy xương; ô Học dùng bộ xương khủng long, nên câu này áp ý vào một con vật khác.

### q3
id: 4ba46e94-f23d-41ba-ab67-2e8cf9be7f73
format: true_false
version: 1
dok: 1
prompt.en: A spider has six legs.
prompt.vi: Con nhện có sáu chân.
image.brief: Dùng lại hình `explore_spiders`. Từ khoá tìm ảnh (EN): garden orb spider web
image.alt.en: A spider in its web
image.alt.vi: Con nhện trên mạng tơ
answer: false
hint.en: Count the legs on the spider.
hint.vi: Em đếm chân con nhện nhé.
explanation_correct.en: A spider has eight legs. It is not an insect.
explanation_correct.vi: Con nhện có tám chân. Nhện không phải côn trùng.
explanation_wrong.en: This is false. A spider has eight legs.
explanation_wrong.vi: Câu này sai. Con nhện có tám chân.
feedback_true.en: Count again: a spider has eight legs.
feedback_true.vi: Em đếm lại nhé: con nhện có tám chân.
> Câu nhớ lại ô "Spiders". Bé hay gọi nhện là côn trùng (ý này không gắn key). Đáp án Sai, giải thích khi đúng không mở đầu bằng "Yes!". Gợi ý chỉ vào điều nhìn thấy; đếm tám chân trên ảnh là việc của câu, không lộ đáp án qua chữ.

### q4
id: c195016c-e913-4957-b2eb-de78eb52dc2f
format: order_sequence
version: 1
dok: 2
prompt.en: Tap from six legs to the most legs.
prompt.vi: Em chạm từ con sáu chân tới con nhiều chân nhất.
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê
answer: q4_ant, q4_spider, q4_millipede
hint.en: Count the legs on each one.
hint.vi: Em đếm số chân của từng con nhé.
explanation_correct.en: Yes! Six legs, eight legs, then lots.
explanation_correct.vi: Đúng rồi! Sáu chân, tám chân, rồi rất nhiều chân.
explanation_wrong.en: The order is ant, spider, millipede.
explanation_wrong.vi: Thứ tự là con kiến, con nhện, cuốn chiếu.
> DOK 2: so sánh và sắp thứ tự theo số chân, như bài năm q4 nhưng với nhóm mới. Thẻ trong file không theo thứ tự đúng. Designer cắt ba con cùng cỡ trong khung.

#### item q4_millipede
label.en: millipede
label.vi: cuốn chiếu
image.brief: Dùng lại hình `explore_millipedes`. Từ khoá tìm ảnh (EN): millipede on dry leaves side view
image.alt.en: A millipede on dry leaves
image.alt.vi: Con cuốn chiếu trên lá khô

#### item q4_ant
label.en: ant
label.vi: con kiến
image.brief: Dùng lại hình `tray_ant`. Từ khoá tìm ảnh (EN): weaver ant on leaf close up
image.alt.en: An ant on a leaf
image.alt.vi: Con kiến trên lá

#### item q4_spider
label.en: spider
label.vi: con nhện
image.brief: Dùng lại hình `explore_spiders`. Từ khoá tìm ảnh (EN): garden orb spider web
image.alt.en: A spider in its web
image.alt.vi: Con nhện trên mạng tơ

### q5
id: 53678001-d5e5-4e39-bdfe-b69c813ca4c1
format: single_choice
version: 1
dok: 2
prompt.en: Which one has no backbone?
prompt.vi: Con nào không có xương sống?
image.brief: Dùng lại hình `q3` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): village house yard Vietnam morning
image.alt.en: A yard in a village
image.alt.vi: Sân nhà ở làng quê
hint.en: Look for a hard shell outside.
hint.vi: Em tìm con có vỏ cứng bên ngoài nhé.
explanation_correct.en: Yes! Crabs have hard shells, not backbones.
explanation_correct.vi: Đúng rồi! Cua có vỏ cứng bên ngoài, không có xương sống.
explanation_wrong.en: The answer is the crab. It has no backbone.
explanation_wrong.vi: Đáp án là con cua. Cua không có xương sống.
> DOK 2: phân loại. Vỏ cua cứng nên bé dễ nghĩ cua "có xương"; ếch và chim sẻ mềm mại hơn nhưng có xương sống. Hình câu hỏi là sân nhà, không dùng ruộng (gợi cua đồng).
> Rà chữ tester 13/11: N5 ghi câu này có đáp án là con mới hôm nay giữa hai con quen, nhưng không đổi được (bài này chưa có con có xương sống nào mới để làm lựa chọn sai); chấp nhận. n10: gợi ý đổi sang "vỏ cứng bên ngoài", vì chân ếch, chân chim cũng gập ở khớp.
> [CẦN KIỂM] Vỏ cua là bộ xương ngoài; chữ cho bé chỉ nói "vỏ cứng bên ngoài".

#### option q5_frog
correct: false
feedback.en: A frog has a backbone inside.
feedback.vi: Ếch có xương sống bên trong.
label.en: frog
label.vi: con ếch
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

#### option q5_sparrow
correct: false
feedback.en: A sparrow has a backbone, like all birds.
feedback.vi: Chim sẻ có xương sống, như mọi loài chim.
label.en: sparrow
label.vi: chim sẻ
image.brief: Dùng lại hình `tray_sparrow` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow on a branch
image.alt.vi: Chim sẻ đậu trên cành

#### option q5_crab
correct: true
label.en: crab
label.vi: con cua
image.brief: Dùng lại hình `explore_crabs`. Từ khoá tìm ảnh (EN): freshwater rice field crab mud
image.alt.en: A crab on the mud
image.alt.vi: Con cua trên bùn

### q6
id: 9c990cc0-c61f-4584-a21b-2c13394e4229
format: true_false
version: 1
dok: 2
misconception: bugs_not_animals
prompt.en: An ant is an animal.
prompt.vi: Con kiến là một con vật.
image.brief: Dùng lại hình `tray_ant`. Từ khoá tìm ảnh (EN): weaver ant on leaf close up
image.alt.en: An ant on a leaf
image.alt.vi: Con kiến trên lá
answer: true
hint.en: Does it move and find food?
hint.vi: Kiến có tự đi và tự tìm thức ăn không?
explanation_correct.en: Yes! Insects and spiders are animals, too.
explanation_correct.vi: Đúng rồi! Côn trùng và nhện cũng là con vật.
explanation_wrong.en: This is true. An ant moves and eats.
explanation_wrong.vi: Câu này đúng. Kiến tự di chuyển và tự kiếm ăn.
feedback_false.en: An ant moves and finds its own food.
feedback_false.vi: Kiến tự đi lại và tự tìm thức ăn.
> Câu misconception (`bugs_not_animals`): nhiều bé nghĩ "con vật" chỉ là con có lông, có bốn chân, còn kiến, sâu bọ là "bọ", không phải con vật. Bé giữ quan niệm này sẽ chạm lắc đầu.
> DOK 2: áp định nghĩa "con vật tự di chuyển và tự tìm thức ăn" của bài một vào một con vật nhỏ, không có xương sống. Gợi ý nhắc đúng định nghĩa đó, không nói Đúng hay Sai.

## Từ vựng

### backbone
id: faea959f-ba01-4b50-8ff8-ee54b148fe24
tier: core
term.en: backbone
term.vi: xương sống
example.en: You have a backbone, too.
example.vi: Em cũng có xương sống.
image.brief: Dùng lại hình `t_rex` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): Tyrannosaurus rex skeleton museum mount side view horizontal posture
image.alt.en: A T. rex skeleton in a museum
image.alt.vi: Bộ xương khủng long bạo chúa trong bảo tàng

### insect
id: 9cbd0b7e-c93e-43a3-908c-5620ab51d9db
tier: core
term.en: insect
term.vi: côn trùng
example.en: An insect has six legs.
example.vi: Côn trùng có sáu chân.
image.brief: Dùng lại hình `explore_insects`. Từ khoá tìm ảnh (EN): grasshopper on leaf side view
image.alt.en: A grasshopper on a leaf
image.alt.vi: Con châu chấu trên lá

### spider
id: 4f7dea44-82c5-427f-9374-cf465bdfb53b
tier: core
term.en: spider
term.vi: con nhện
example.en: A spider has eight legs.
example.vi: Con nhện có tám chân.
image.brief: Dùng lại hình `explore_spiders`. Từ khoá tìm ảnh (EN): garden orb spider web
image.alt.en: A spider in its web
image.alt.vi: Con nhện trên mạng tơ

### crab
id: 10b07f2e-4ab9-4354-8834-24abf507bfb9
tier: extra
term.en: crab
term.vi: con cua
example.en: A crab has two big claws.
example.vi: Con cua có hai cái càng to.
image.brief: Dùng lại hình `explore_crabs`. Từ khoá tìm ảnh (EN): freshwater rice field crab mud
image.alt.en: A crab on the mud
image.alt.vi: Con cua trên bùn

### arthropod
id: e069d021-7271-4e71-a43f-61c2adb924aa
tier: extra
term.en: arthropod
term.vi: động vật chân khớp
example.en: Ants, spiders and crabs are arthropods.
example.vi: Kiến, nhện và cua là động vật chân khớp.
image.brief: Dùng lại hình `explore_insects`. Từ khoá tìm ảnh (EN): grasshopper on leaf side view
image.alt.en: A grasshopper on a leaf
image.alt.vi: Con châu chấu trên lá
> Tên nhóm chỉ để nghe (`extra`, không vào `word_list`, không có câu hỏi). [CẦN KIỂM] Tên tiếng Việt: sách Sinh học bảy cũ gọi "ngành Chân khớp"; Duy viết "chân đốt". Chủ đề dùng "chân khớp" vì khớp với ý chính ba ("chân gập ở khớp"); PM chốt.

## Thưởng

### weaver_ant_card
id: 4f749eed-902e-4ab1-af73-843a0b15f827
set: animals
rarity: rare
name.en: Weaver ant
name.vi: Kiến vàng
tag.en: A farmer's helper
tag.vi: Bạn của nhà nông
fact.en: Farmers use weaver ants to guard fruit trees.
fact.vi: Nông dân nuôi kiến vàng để bảo vệ vườn cam, vườn bưởi.
image.brief: [ảnh] Một đàn kiến vàng đang kéo lá kết tổ trên cành cây ăn quả, ảnh ngang, chụp cận; không có tay người, không có chữ. Từ khoá tìm ảnh (EN): weaver ants building leaf nest
image.alt.en: Weaver ants making a leaf nest
image.alt.vi: Đàn kiến vàng làm tổ bằng lá
> [CẦN KIỂM] Nông dân ở đồng bằng sông Cửu Long nuôi kiến vàng trong vườn cam quýt, bưởi để kiến bắt sâu hại (biên tập nhớ). Câu EN tám từ.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật, ảnh ngang, con vật nằm ngang khung. Một câu, một kệ một loại hình.
- **Ảnh cần tìm (bảy):** châu chấu trên lá; nhện vườn trên mạng tơ; cua đồng trên bùn; cuốn chiếu trên lá khô; kiến trên lá; bướm trên hoa; đàn kiến vàng làm tổ (thẻ).
- **Không gây sợ:** nhện nhỏ, chụp vừa, không cận răng nanh, không phải nhện lông to; cuốn chiếu trên lá, không bò trên da người. Không có ảnh rết, bọ cạp (chỉ có trong ví dụ chữ).
- **Dùng lại:** *Hô hấp* (`tray_sparrow`, `tray_egret`, `tray_shrimp`, `q3`), *Khủng long* (`t_rex` cho ô Xương sống và từ `backbone`, chép mục gốc; `w3_lizard`, `q4_frog`), bài 1 (`w1`), bài 2 (`explore_fur`, `tray_bat`), bài 4 (`explore_fish`, `q1`).
- **q4 (`order_sequence`):** kiến, nhện, cuốn chiếu cắt cùng cỡ trong khung; thấy đủ chân.
- **Màu** (rà chữ tester 13/11 N1: nhóm bẫy `do_son` như sáu bài trước): Học: xương sống `do_son`, côn trùng `vang_hoe`, nhện `nau_dat`, cua và tôm `cham`, rất nhiều chân `gi_dong`. Chơi: sáu chân `vang_hoe`, tám chân `nau_dat`, nhiều hơn tám chân `gi_dong`, có xương sống `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` năm nhóm + `word_list` (backbone, insect, spider). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Sai, w3 Đúng). Quiz `single_choice` (q1, q5), `true_false` (q2 Đúng, q3 Sai, q6 Đúng), `order_sequence` (q4). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`bugs_not_animals`).
- **Vị trí đáp án đúng:** hết hiệu lực 15/11 (SK-047, app xáo lựa chọn và thẻ xếp thứ tự). q4 thứ tự đúng: kiến, nhện, cuốn chiếu.
- **Màn Chơi, ví dụ để kiểm:** Con kiến, Con nhện, Con cua → `balanced`; Con bướm, Con nhện, Thằn lằn → `has_limited`; Con kiến, Con bướm, Con tôm → `missing.tray_eight`.
- **Bộ thẻ** `set: animals` như sáu bài trước.
- **Syllabus:** bài mới, chưa có trong `content/syllabus.json`; PM/phiên chính thêm trước khi chạy `ids` (không có `oak_lessons`).
- **Từ EN có thể ngoài Starters/Movers:** backbone, insect, joints, millipede, centipede, scorpion, grasshopper, arthropod, claws, weaver ant.
