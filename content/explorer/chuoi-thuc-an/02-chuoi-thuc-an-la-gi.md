---
id: b29fc80d-ca47-4d18-81be-62187220d4d9
topic: chuoi-thuc-an
slug: chuoi-thuc-an-la-gi
order: 2
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Introduction to food chains
vi: Chuỗi thức ăn là gì?
> Giữ đúng tên ở `content/syllabus.json` (`introduction-to-food-chains`, bài số hai).

## Mục tiêu
en: I can put a food chain in order.
vi: Em xếp được cây và con vật theo đúng thứ tự của một chuỗi thức ăn.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 14/11/2026. Mọi dòng `id:` để trống; chạy `ids` sau bài một.
> Bài giới thiệu chuỗi thức ăn và mũi tên. Chuỗi chính: cỏ → châu chấu → ếch. Sửa `arrow_means_eats` ở ý chính ba, ô Học "Arrow" và câu q6 (gắn key).

## Ý chính
1.en: Animals eat plants or other animals.
1.vi: Con vật ăn cây hoặc ăn con vật khác.
2.en: A food chain starts with a plant.
2.vi: Chuỗi thức ăn bắt đầu từ một cây.
3.en: The arrow goes from food to eater.
3.vi: Mũi tên đi từ thức ăn tới con vật ăn nó.
> Từ cụ thể tới trừu tượng: hai loại thức ăn bé thấy được, rồi chuỗi, rồi quy ước mũi tên. Cách đọc mũi tên dùng nhất quán "là thức ăn của" (ô Học "Arrow"); ý chính ba nói chiều mũi tên để bé không đọc mũi tên là "ăn".

## Khởi động

> Hai câu: w1 bài một (săn mồi), w2 chủ đề số một bài hai (động vật có vú; giới thiệu con chuột cho bài ba).
> Chủ đề *Sinh vật sống ở đâu?* chưa có file khi soạn; khi có `id`, đề xuất thêm w3 ôn bài "Vật sống hay không sống?" (xem `_topic.md`, mục Khởi động).

### w1
id: 534453ea-30b7-4bdb-ae75-d821f537049f
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: chuoi-thuc-an/con-vat-kiem-an-the-nao
prompt.en: Which one hunts for its food?
prompt.vi: Con nào tự săn mồi?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Remember the Hunt picture.
hint.vi: Em nhớ lại ô Săn mồi nhé.
explanation_correct.en: Yes! An egret hunts in the rice field.
explanation_correct.vi: Đúng rồi! Cò săn mồi ngoài ruộng lúa.
explanation_wrong.en: The answer is the egret. It hunts fish.
explanation_wrong.vi: Đáp án là con cò. Cò săn cá.

#### option w1_rabbit
correct: false
feedback.en: A rabbit nibbles grass and leaves.
feedback.vi: Thỏ gặm cỏ và lá rau.
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
id: 114f5f97-fd76-457d-9470-cc61b76663b1
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/dong-vat-co-vu
prompt.en: A mouse is a mammal.
prompt.vi: Con chuột là động vật có vú.
image.brief: [ảnh] Một con chuột đồng lông nâu xám ngồi trên đất khô hoặc gốc rạ ngoài ruộng, nhìn nghiêng, thấy cả con và đuôi; ảnh ngang, chuột nằm gọn giữa khung; chuột sống, sạch, không có bẫy, không có lồng, không có tay người, không có máu, không có chữ. Từ khoá tìm ảnh (EN): rice field rat sitting ground
image.alt.en: A mouse on the ground
image.alt.vi: Con chuột trên mặt đất
answer: true
hint.en: Look at its fur.
hint.vi: Em nhìn bộ lông của nó nhé.
explanation_correct.en: Yes! A mouse has fur. Baby mice drink milk.
explanation_correct.vi: Đúng rồi! Chuột có lông. Chuột con bú sữa mẹ.
explanation_wrong.en: This is true. A mouse has fur.
explanation_wrong.vi: Câu này đúng. Chuột có lông.
feedback_false.en: A mouse has fur, like a cat.
feedback_false.vi: Chuột có lông, giống con mèo.
> Hình gốc của con chuột cho cả chủ đề (bài ba, bài bốn dùng lại). Ôn dấu hiệu "có lông, bú sữa mẹ" của chủ đề số một bài hai.
> [CẦN KIỂM] Ảnh là chuột đồng (loài chuột hại lúa, tiếng Anh gọi rice field rat); chữ cho bé dùng "mouse" (từ Starters) và "con chuột". Người chọn ảnh ghi tên loài.

## Học

> Bốn ô: thức ăn từ cây, thức ăn từ con vật, mũi tên (hai món), chuỗi thức ăn (ba món).
> Ô "Arrow" và "Food chain" là hình ghép từ ảnh đã có, mũi tên chỉ sang phải (`_topic.md`, Quy ước hình mục hai). Câu của ô "Arrow" là câu đọc mũi tên: "Grass is food for the grasshopper."
> Rà chữ tester 14/11 (n1): nhãn EN đổi "The arrow" thành "Arrow", khớp gợi ý "Remember the Arrow picture." ở bài ba w1, bài bốn w2 và cùng dạng ba ô kia (không mạo từ).

### explore
id: eaeb1dde-8fe8-463d-a4bd-c6e48fcf18e7
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_plant_food
label.en: Food from plants
label.vi: Thức ăn từ cây
color: gi_dong
sentence.en: A caterpillar eats cabbage leaves.
sentence.vi: Con sâu ăn lá cải.
image.brief: [ảnh] Một con sâu xanh của bướm cải trắng bò trên lá cải, lá có vài lỗ thủng do sâu ăn, chụp cận, sâu chiếm phần lớn khung; ảnh ngang; không có tay người, không có thuốc trừ sâu, không có chữ. Từ khoá tìm ảnh (EN): cabbage white caterpillar eating leaf
image.alt.en: A caterpillar on a cabbage leaf
image.alt.vi: Con sâu trên lá cải
examples.1.en: a grasshopper eats grass
examples.1.vi: châu chấu ăn cỏ
examples.2.en: a mouse eats rice
examples.2.vi: chuột ăn lúa
examples.3.en: a buffalo eats grass
examples.3.vi: trâu ăn cỏ
> [CẦN KIỂM] Sâu xanh trên lá cải là sâu bướm cải trắng, lớn lên thành bướm (thẻ thưởng). Người chọn ảnh ghi tên loài; không lấy ảnh sâu tơ, sâu khoang (sâu của bướm đêm).
> Hình gốc; dùng lại ở thẻ `q4_caterpillar`, từ `caterpillar`, thẻ thưởng và hình ghép bài bốn.

#### group explore_animal_food
label.en: Food from animals
label.vi: Thức ăn từ con vật
color: vang_hoe
sentence.en: A frog eats grasshoppers.
sentence.vi: Ếch ăn châu chấu.
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước
examples.1.en: an owl eats mice
examples.1.vi: cú ăn chuột
examples.2.en: an egret eats frogs
examples.2.vi: cò ăn ếch
examples.3.en: a sparrow eats caterpillars
examples.3.vi: chim sẻ ăn sâu
> [CẦN KIỂM] Ếch đồng ăn châu chấu và côn trùng; chim sẻ bắt sâu, nhất là khi nuôi chim non (biên tập nhớ).

#### group explore_arrow
label.en: Arrow
label.vi: Mũi tên
color: cham
sentence.en: Grass is food for the grasshopper.
sentence.vi: Cỏ là thức ăn của châu chấu.
image.brief: [sơ đồ ghép ảnh] Khung 4:3, hai ảnh vuông cùng cỡ xếp một hàng: bên trái là cỏ (`con-vat-nuoi-trong-nha/q4_grass`), bên phải là châu chấu (`con-trung-va-con-vat-nhieu-chan/explore_insects`, cắt vuông thấy cả con); ở giữa là một mũi tên đậm chỉ sang phải, từ cỏ tới châu chấu; nền giấy trơn; không có chữ, không có số.
image.alt.en: Grass, an arrow, then a grasshopper
image.alt.vi: Cỏ, mũi tên, rồi con châu chấu
examples.1.en: the arrow starts at the food
examples.1.vi: mũi tên bắt đầu từ thức ăn
examples.2.en: the arrow points to the eater
examples.2.vi: mũi tên chỉ tới con vật ăn nó
examples.3.en: say: grass is food for the grasshopper
examples.3.vi: em nói: cỏ là thức ăn của châu chấu
> Cách đọc mũi tên của sườn ("is food for" · "là thức ăn của"), cho bé nghe đọc to. Không câu nào đọc mũi tên là "ăn".
> Kiểu mũi tên dùng chung cho sáu hình ghép của chủ đề.

#### group explore_chain
label.en: Food chain
label.vi: Chuỗi thức ăn
color: nau_dat
sentence.en: A food chain starts with a plant.
sentence.vi: Chuỗi thức ăn bắt đầu từ một cây.
image.brief: [sơ đồ ghép ảnh] Khung 4:3, ba ảnh vuông cùng cỡ xếp một hàng từ trái sang phải: cỏ (`con-vat-nuoi-trong-nha/q4_grass`), châu chấu (`con-trung-va-con-vat-nhieu-chan/explore_insects`), ếch (`khung-long-la-gi/q4_frog`); giữa hai ảnh là mũi tên chỉ sang phải, cùng kiểu với `explore_arrow`; nền giấy trơn; không có chữ, không có số.
image.alt.en: Grass, a grasshopper, then a frog
image.alt.vi: Cỏ, con châu chấu, rồi con ếch
examples.1.en: grass is food for the grasshopper
examples.1.vi: cỏ là thức ăn của châu chấu
examples.2.en: the grasshopper is food for the frog
examples.2.vi: châu chấu là thức ăn của ếch
examples.3.en: rice, a mouse, then an owl
examples.3.vi: lúa, con chuột, rồi con cú
> Hình gốc; dùng lại ở bài ba q6, bài bốn q6 và hình ghép `explore_same` bài bốn. Ví dụ ba chuẩn bị câu q5.

### new_words
id: eede80b3-66e1-4b2f-9a9b-389361f77ed4
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: food_chain, arrow

## Chơi

> Bé tìm thức ăn cho ba con vật: con ếch, con sâu, con trâu. Đạt khi mỗi con có một món và không chọn thứ không phải thức ăn.
> Dùng ngay cách nói "là thức ăn của" của ô "Arrow": mỗi nhóm là một con vật, mỗi món là thức ăn của con đó. Nhóm ếch có hai món (châu chấu, giun), nhóm trâu hai món (cỏ, rơm), nhóm sâu một món (lá cải).
> Món bẫy giống một nhóm: châu chấu đan bằng lá dừa trông như châu chấu thật; nón lá làm từ lá. Cả hai không phải thức ăn của con vật.

### tray
id: f33899a0-4688-4b24-9d6d-f3898d1c954e
type: build_tray
version: 1
prompt.en: Find food for each animal
prompt.vi: Tìm thức ăn cho từng con vật
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find food for the frog, caterpillar and buffalo.
messages.start.vi: Em tìm thức ăn cho con ếch, con sâu và con trâu nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Each one is food for an animal.
messages.balanced.vi: Tuyệt! Thứ nào cũng là thức ăn của một con vật.
messages.has_limited.en: That one is not food for animals.
messages.has_limited.vi: Thứ này không phải thức ăn của con vật.
messages.missing.tray_frog.en: The frog still needs food.
messages.missing.tray_frog.vi: Con ếch còn thiếu thức ăn.
messages.missing.tray_caterpillar.en: The caterpillar still needs food.
messages.missing.tray_caterpillar.vi: Con sâu còn thiếu thức ăn.
messages.missing.tray_buffalo.en: The buffalo still needs food.
messages.missing.tray_buffalo.vi: Con trâu còn thiếu thức ăn.

#### group tray_frog
label.en: Food for the frog
label.vi: Thức ăn của ếch
color: vang_hoe
role: required

#### group tray_caterpillar
label.en: Food for the caterpillar
label.vi: Thức ăn của sâu
color: gi_dong
role: required

#### group tray_buffalo
label.en: Food for the buffalo
label.vi: Thức ăn của trâu
color: cham
role: required

#### group tray_not
label.en: Not food
label.vi: Không phải thức ăn
color: do_son
role: limit

#### item tray_grasshopper
label.en: Grasshopper
label.vi: Con châu chấu
group: tray_frog
image.brief: Dùng lại hình `explore_insects` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): grasshopper on leaf side view
image.alt.en: A grasshopper on a leaf
image.alt.vi: Con châu chấu trên lá

#### item tray_hat
label.en: Conical hat
label.vi: Chiếc nón lá
group: tray_not
image.brief: Dùng lại hình `w1_hat` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): Vietnamese conical hat non la
image.alt.en: A conical hat
image.alt.vi: Chiếc nón lá

#### item tray_cabbage
label.en: Cabbage leaf
label.vi: Lá cải
group: tray_caterpillar
image.brief: [ảnh] Một cây cải hoặc một lá cải xanh còn tươi trong vườn rau, chụp cận, lá chiếm phần lớn khung; ảnh vuông hoặc ngang; không có con sâu, không có lỗ thủng to, không có tay người, không có chữ. Từ khoá tìm ảnh (EN): green cabbage leaf vegetable garden
image.alt.en: A green cabbage leaf
image.alt.vi: Lá cải xanh
> Hình gốc; dùng lại ở q1, q3, q4 và bài bốn. Không có sâu trên lá, để thẻ này khác thẻ sâu ở q4.

#### item tray_worm
label.en: Worm
label.vi: Con giun
group: tray_frog
image.brief: Dùng lại hình `q1_worm` ở bài `goi-ten-va-nhom-dong-vat/con-vat-an-gi`. Từ khoá tìm ảnh (EN): earthworm on moist soil
image.alt.en: A worm on the soil
image.alt.vi: Con giun trên đất
> [CẦN KIỂM] Ếch đồng ăn cả giun đất (biên tập nhớ).

#### item tray_toy_grasshopper
label.en: Leaf toy grasshopper
label.vi: Châu chấu lá dừa
group: tray_not
image.brief: [ảnh] Một con châu chấu đồ chơi đan bằng lá dừa (đồ chơi dân gian), đặt trên nền trơn, nhìn nghiêng, thấy cả con; không có tay người, không có giá tiền, không có chữ. Từ khoá tìm ảnh (EN): coconut leaf grasshopper toy
image.alt.en: A grasshopper toy made of leaves
image.alt.vi: Con châu chấu đan bằng lá dừa
> Ảnh khó tìm. Phương án thay: chuồn chuồn tre (đồ chơi dân gian, giống côn trùng); khi đó đổi `label` thành "Bamboo dragonfly toy" · "Chuồn chuồn tre".

#### item tray_grass
label.en: Grass
label.vi: Cỏ
group: tray_buffalo
image.brief: Dùng lại hình `q4_grass` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): bundle fresh green grass
image.alt.en: Fresh green grass
image.alt.vi: Cỏ tươi

#### item tray_straw
label.en: Rice straw
label.vi: Rơm
group: tray_buffalo
image.brief: [ảnh] Một đống rơm khô vàng ở sân hoặc ngoài ruộng sau mùa gặt, thấy rõ sợi rơm; ảnh vuông hoặc ngang; không có người, không có trâu, không có chữ. Từ khoá tìm ảnh (EN): rice straw pile Vietnam
image.alt.en: A pile of rice straw
image.alt.vi: Đống rơm khô
> [CẦN KIỂM] Nhà nông cho trâu ăn rơm, nhất là mùa đông ít cỏ (biên tập nhớ).

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q3, q5; ba lựa chọn), `true_false` (q2, q6), `order_sequence` (q4, ba thẻ).

### q1
id: f90a9a06-55f7-43eb-b0ee-667403ec9c2c
format: single_choice
version: 1
dok: 1
prompt.en: What is food for a caterpillar?
prompt.vi: Đâu là thức ăn của con sâu?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Remember the Food from plants picture.
hint.vi: Em nhớ lại ô Thức ăn từ cây nhé.
explanation_correct.en: Yes! A caterpillar makes holes in leaves.
explanation_correct.vi: Đúng rồi! Sâu ăn lá cải thủng lỗ chỗ.
explanation_wrong.en: The answer is the cabbage leaf. Caterpillars eat leaves.
explanation_wrong.vi: Đáp án là lá cải. Sâu ăn lá cây.
> Câu hỏi dùng đúng cách nói "là thức ăn của". Hai lựa chọn sai là thức ăn của con vật khác (cá nhỏ của cò, giun của ếch), bé đã gặp ở chủ đề số một và phần Chơi.

#### option q1_cabbage
correct: true
label.en: cabbage leaf
label.vi: lá cải
image.brief: Dùng lại hình `tray_cabbage`. Từ khoá tìm ảnh (EN): green cabbage leaf vegetable garden
image.alt.en: A green cabbage leaf
image.alt.vi: Lá cải xanh

#### option q1_fish
correct: false
feedback.en: Small fish are food for egrets.
feedback.vi: Cá nhỏ là thức ăn của cò.
label.en: small fish
label.vi: cá nhỏ
image.brief: Dùng lại hình `q4_fish` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): small fish swimming shallow water
image.alt.en: Small fish in water
image.alt.vi: Cá nhỏ dưới nước

#### option q1_worm
correct: false
feedback.en: A worm is food for frogs and hens.
feedback.vi: Giun là thức ăn của ếch và gà.
label.en: worm
label.vi: con giun
image.brief: Dùng lại hình `q1_worm` ở bài `goi-ten-va-nhom-dong-vat/con-vat-an-gi`. Từ khoá tìm ảnh (EN): earthworm on moist soil
image.alt.en: A worm on the soil
image.alt.vi: Con giun trên đất

### q2
id: 85ae072a-e869-448b-873b-bb3a2e8f95ba
format: true_false
version: 1
dok: 1
prompt.en: A food chain starts with a plant.
prompt.vi: Chuỗi thức ăn bắt đầu từ một cây.
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê
answer: true
hint.en: Remember the Food chain picture.
hint.vi: Em nhớ lại ô Chuỗi thức ăn nhé.
explanation_correct.en: Yes! A plant is food for the first animal.
explanation_correct.vi: Đúng rồi! Cây là thức ăn của con vật đầu tiên.
explanation_wrong.en: This is true. Every chain starts with a plant.
explanation_wrong.vi: Câu này đúng. Chuỗi nào cũng bắt đầu từ một cây.
feedback_false.en: Grass comes first, then the grasshopper.
feedback_false.vi: Cỏ đứng trước, rồi mới tới châu chấu.
> Hình là ao làng (cảnh trung tính), không phải hình chuỗi (bằng chứng).

### q3
id: 09c02699-82b8-4b65-8291-4e3f5fe45509
format: single_choice
version: 1
dok: 1
prompt.en: What is food for a frog?
prompt.vi: Đâu là thức ăn của con ếch?
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê
hint.en: Remember the Food from animals picture.
hint.vi: Em nhớ lại ô Thức ăn từ con vật nhé.
explanation_correct.en: Yes! A frog catches it with its long tongue.
explanation_correct.vi: Đúng rồi! Ếch bắt châu chấu bằng cái lưỡi dài.
explanation_wrong.en: The answer is the grasshopper. Frogs eat insects.
explanation_wrong.vi: Đáp án là con châu chấu. Ếch ăn côn trùng.
> Hai lựa chọn sai là cây (cỏ, lá cải): bé phải nhớ ếch ăn con vật. Ba thẻ khác nhau rõ.
> Rà chữ tester 14/11 (N1): `feedback` của thẻ cỏ không còn nói "cỏ là thức ăn của châu chấu" (gọi tên đáp án), chỉ nói cỏ là cây.
> [CẦN KIỂM] Ếch phóng lưỡi dính để bắt côn trùng (biên tập nhớ). Câu EN tám từ.

#### option q3_grass
correct: false
feedback.en: Grass is a plant, not an animal.
feedback.vi: Cỏ là cây, không phải con vật.
label.en: grass
label.vi: cỏ
image.brief: Dùng lại hình `q4_grass` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): bundle fresh green grass
image.alt.en: Fresh green grass
image.alt.vi: Cỏ tươi

#### option q3_cabbage
correct: false
feedback.en: A cabbage leaf is food for caterpillars.
feedback.vi: Lá cải là thức ăn của sâu.
label.en: cabbage leaf
label.vi: lá cải
image.brief: Dùng lại hình `tray_cabbage`. Từ khoá tìm ảnh (EN): green cabbage leaf vegetable garden
image.alt.en: A green cabbage leaf
image.alt.vi: Lá cải xanh

#### option q3_grasshopper
correct: true
label.en: grasshopper
label.vi: con châu chấu
image.brief: Dùng lại hình `explore_insects` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): grasshopper on leaf side view
image.alt.en: A grasshopper on a leaf
image.alt.vi: Con châu chấu trên lá

### q4
id: c37ec573-5607-42bc-ae52-c0b6c96c981a
format: order_sequence
version: 1
dok: 2
prompt.en: Tap the food chain in order.
prompt.vi: Em chạm theo thứ tự của chuỗi thức ăn nhé.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_cabbage, q4_caterpillar, q4_sparrow
hint.en: Start with the plant.
hint.vi: Em bắt đầu từ cây nhé.
explanation_correct.en: Yes! Sparrows feed caterpillars to their babies.
explanation_correct.vi: Đúng rồi! Chim sẻ bắt sâu cho chim non ăn.
explanation_wrong.en: The order is cabbage, caterpillar, sparrow.
explanation_wrong.vi: Thứ tự là lá cải, con sâu, chim sẻ.
> DOK 2: xếp một chuỗi mới (ở vườn rau), không phải chuỗi của ô Học. Bé dùng hai điều vừa học: chuỗi bắt đầu từ cây; sâu ăn lá, chim ăn sâu (ví dụ ba ô "Food from animals"). Thẻ trong file không theo thứ tự đúng.
> [CẦN KIỂM] Chim sẻ bắt sâu cho chim non ăn (biên tập nhớ).

#### item q4_sparrow
label.en: sparrow
label.vi: chim sẻ
image.brief: Dùng lại hình `tray_sparrow` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow on a branch
image.alt.vi: Chim sẻ đậu trên cành

#### item q4_cabbage
label.en: cabbage leaf
label.vi: lá cải
image.brief: Dùng lại hình `tray_cabbage`. Từ khoá tìm ảnh (EN): green cabbage leaf vegetable garden
image.alt.en: A green cabbage leaf
image.alt.vi: Lá cải xanh

#### item q4_caterpillar
label.en: caterpillar
label.vi: con sâu
image.brief: Dùng lại hình `explore_plant_food`. Từ khoá tìm ảnh (EN): cabbage white caterpillar eating leaf
image.alt.en: A caterpillar on a cabbage leaf
image.alt.vi: Con sâu trên lá cải
> Designer cắt vuông sát con sâu (ghi `crop`), để thẻ này khác hẳn thẻ lá cải.

### q5
id: bf54a74a-c863-48a6-a920-f6a6291274b5
format: single_choice
version: 1
dok: 2
prompt.en: Rice, then a mouse. Who comes next?
prompt.vi: Lúa, rồi đến con chuột. Tiếp theo là con nào?
image.brief: Dùng lại hình `w1` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): rice field wind waves Vietnam
image.alt.en: Wind blowing over a rice field
image.alt.vi: Gió thổi trên cánh đồng lúa
hint.en: Who is the mouse food for?
hint.vi: Em nghĩ xem chuột là thức ăn của con nào?
explanation_correct.en: Yes! Owls help farmers by eating mice.
explanation_correct.vi: Đúng rồi! Cú bắt chuột, giúp nhà nông giữ lúa.
explanation_wrong.en: The answer is the owl. It eats mice.
explanation_wrong.vi: Đáp án là con cú. Cú ăn chuột.
> DOK 2: nối thêm một mắt xích cho chuỗi bé nghe bằng lời. Bé biết cú săn chuột (bài một); ví dụ ba ô "Food chain" đã đọc "lúa, con chuột, rồi con cú". Hai lựa chọn sai là con ăn cây (trâu, châu chấu): bé chọn theo "con to" sẽ chọn trâu.
> Hai câu EN ba và bốn từ, cả màn bảy từ.
> [CẦN KIỂM] Cú bắt chuột đồng, có nơi nhà nông làm tổ cho cú để diệt chuột (biên tập nhớ).

#### option q5_owl
correct: true
label.en: owl
label.vi: con cú
image.brief: Dùng lại hình `explore_hunt` ở bài `chuoi-thuc-an/con-vat-kiem-an-the-nao`. Từ khoá tìm ảnh (EN): owl perched branch wild
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành

#### option q5_buffalo
correct: false
feedback.en: A buffalo eats grass, not mice.
feedback.vi: Trâu ăn cỏ, không ăn chuột.
label.en: buffalo
label.vi: con trâu
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu

#### option q5_grasshopper
correct: false
feedback.en: A grasshopper eats leaves, not mice.
feedback.vi: Châu chấu ăn lá, không ăn chuột.
label.en: grasshopper
label.vi: con châu chấu
image.brief: Dùng lại hình `explore_insects` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): grasshopper on leaf side view
image.alt.en: A grasshopper on a leaf
image.alt.vi: Con châu chấu trên lá

### q6
id: fab6cb8b-95ca-464c-ade8-58e5c2ad57ed
format: true_false
version: 1
dok: 2
misconception: arrow_means_eats
prompt.en: The arrow starts at the food.
prompt.vi: Mũi tên này bắt đầu từ thức ăn.
image.brief: [sơ đồ ghép ảnh] Cùng khung, cùng kiểu mũi tên, cùng hai ảnh của `explore_arrow` nhưng đổi chỗ: bên trái là châu chấu (`con-trung-va-con-vat-nhieu-chan/explore_insects`), bên phải là cỏ (`con-vat-nuoi-trong-nha/q4_grass`), mũi tên vẫn chỉ sang phải (từ châu chấu tới cỏ); nền giấy trơn; không có chữ, không có dấu tích, dấu nhân hay màu đỏ báo sai.
image.alt.en: A grasshopper, an arrow, then grass
image.alt.vi: Con châu chấu, mũi tên, rồi cỏ
answer: false
hint.en: Which one is the food? Start there.
hint.vi: Cái nào là thức ăn? Mũi tên đi từ đó.
explanation_correct.en: Grass is food, so the arrow starts there.
explanation_correct.vi: Cỏ là thức ăn, nên mũi tên phải đi từ cỏ.
explanation_wrong.en: This is false. The arrow starts at the grass.
explanation_wrong.vi: Câu này sai. Mũi tên phải bắt đầu từ cỏ.
feedback_true.en: The grasshopper is not food for grass.
feedback_true.vi: Châu chấu không phải thức ăn của cỏ.
> Câu misconception (`arrow_means_eats`), bằng hình: chuỗi đặt ngược (châu chấu rồi cỏ). Bé đọc mũi tên là "ăn" sẽ đọc hình thành "châu chấu ăn cỏ", thấy hình hợp lý nên chạm gật đầu. Bé nắm quy ước thấy mũi tên bắt đầu từ châu chấu, không phải từ thức ăn, và chạm lắc đầu.
> Rà chữ tester 14/11 (N2): câu hỏi dùng đúng chữ của ví dụ một ô "Arrow" ("the arrow starts at the food"), không dùng "đúng chiều" (chữ chưa dạy). Main session chốt giữ hình chuỗi đặt ngược (Còn mở 3 đã đóng).
> DOK 2: bắt lỗi một chuỗi bằng quy ước vừa học, như việc sửa chuỗi sai của bạn trong sườn.
> Đáp án Sai: giải thích khi đúng không mở đầu bằng "Yes!".

## Từ vựng

### food_chain
id: 3b8f7a54-e180-475b-a2ce-a611e8600770
tier: core
term.en: food chain
term.vi: chuỗi thức ăn
example.en: Grass, grasshopper, frog is a food chain.
example.vi: Cỏ, châu chấu, ếch là một chuỗi thức ăn.
image.brief: Dùng lại hình `explore_chain`.
image.alt.en: Grass, a grasshopper, then a frog
image.alt.vi: Cỏ, con châu chấu, rồi con ếch
> Hình gốc là hình ghép, mọi phần là ảnh dùng lại, nên không có dòng từ khoá để chép. Nếu `validate` cảnh báo thiếu từ khoá ở chỗ dùng lại hình ghép, phiên chính báo lại để hỏi dev.

### arrow
id: faa74f82-39f0-4131-874a-77a0829f2e95
tier: core
term.en: arrow
term.vi: mũi tên
example.en: The arrow goes from grass to grasshopper.
example.vi: Mũi tên đi từ cỏ sang châu chấu.
image.brief: Dùng lại hình `explore_arrow`.
image.alt.en: Grass, an arrow, then a grasshopper
image.alt.vi: Cỏ, mũi tên, rồi con châu chấu

### caterpillar
id: b1e9cb72-1431-4a9e-9a37-14b0f8b1f01f
tier: extra
term.en: caterpillar
term.vi: con sâu
example.en: A caterpillar eats leaves.
example.vi: Con sâu ăn lá.
image.brief: Dùng lại hình `explore_plant_food`. Từ khoá tìm ảnh (EN): cabbage white caterpillar eating leaf
image.alt.en: A caterpillar on a cabbage leaf
image.alt.vi: Con sâu trên lá cải

### grasshopper
id: a522e9a2-4592-4c61-8c57-d2333046a89a
tier: extra
term.en: grasshopper
term.vi: con châu chấu
example.en: A grasshopper is food for a frog.
example.vi: Châu chấu là thức ăn của ếch.
image.brief: Dùng lại hình `explore_insects` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): grasshopper on leaf side view
image.alt.en: A grasshopper on a leaf
image.alt.vi: Con châu chấu trên lá

## Thưởng

### caterpillar_card
id: efaca1df-8817-467c-9025-4c4406f78764
set: animals
rarity: common
name.en: Caterpillar
name.vi: Con sâu
tag.en: A leaf eater
tag.vi: Ăn lá
fact.en: This caterpillar will turn into a butterfly.
fact.vi: Con sâu này lớn lên sẽ hoá thành bướm.
image.brief: Dùng lại hình `explore_plant_food`. Từ khoá tìm ảnh (EN): cabbage white caterpillar eating leaf
image.alt.en: A caterpillar on a cabbage leaf
image.alt.vi: Con sâu trên lá cải
> [CẦN KIỂM] Sâu bướm cải trắng hoá nhộng rồi thành bướm cải trắng. Câu nói "con sâu này" vì không phải con sâu nào cũng thành bướm (nhiều loài thành bướm đêm); người chọn ảnh phải ghi đúng loài. Vòng đời đầy đủ để dành chủ đề *Sự sống mới*.

## Ghi chú cho hoạ sĩ

- **Loại hình:** ảnh chụp thật, cộng ba hình ghép từ ảnh đã có (`explore_arrow`, `explore_chain`, `q6`).
- **Ảnh cần tìm (năm):**
  - Khởi động (một): chuột đồng (`w2`, hình gốc cho bài ba, bốn).
  - Học (một): sâu bướm cải trắng trên lá cải.
  - Chơi (ba): lá cải (không có sâu); châu chấu đan lá dừa; đống rơm.
- **Hình ghép (ba):** mỗi món một ảnh vuông cùng cỡ, mũi tên đậm chỉ sang phải, khung 4:3, không chữ (`_topic.md`, Quy ước hình mục hai). `q6` là `explore_arrow` đổi chỗ hai ảnh, mũi tên giữ nguyên chiều; không thêm dấu gì báo sai.
- **Ảnh khó:** châu chấu lá dừa (phương án thay ở món `tray_toy_grasshopper`); chuột đồng sống, sạch, không bẫy; sâu đúng loài bướm cải trắng.
- **q4 (`order_sequence`):** lá cải, sâu, chim sẻ cắt vuông, cùng cỡ vật trong khung. Thẻ sâu cắt sát con sâu, thẻ lá cải không có sâu.
- **Màu:** Học: thức ăn từ cây `gi_dong`, thức ăn từ con vật `vang_hoe`, mũi tên `cham`, chuỗi thức ăn `nau_dat`. Chơi: thức ăn của ếch `vang_hoe`, của sâu `gi_dong`, của trâu `cham`, không phải thức ăn `do_son`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (bốn nhóm), `word_list` (food_chain, arrow).
  - Chơi: `build_tray`: ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món.
  - Khởi động: `single_choice` (w1, hai lựa chọn, ôn bài một), `true_false` (w2 Đúng, ôn chủ đề số một bài hai).
  - Quiz: `single_choice` (q1, q3, q5), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`arrow_means_eats`).
- **Vị trí đáp án đúng:** hết hiệu lực 15/11 (SK-047, app xáo lựa chọn và thẻ xếp thứ tự). q4 thứ tự đúng: lá cải, sâu, chim sẻ.
- **Màn Chơi, ví dụ để kiểm:** Con châu chấu, Lá cải, Rơm → `balanced`; Con giun, Lá cải, Châu chấu lá dừa → `has_limited`; Con châu chấu, Cỏ, Rơm → `missing.tray_caterpillar`.
- **`order_sequence` Explorer:** đề xuất ô đặt thẻ có mũi tên chỉ sang phải giữa các ô (`_topic.md`, Đề xuất cho ios-dev). Nếu app xáo thẻ thì càng tốt.
- **q6 dùng hình câu hỏi:** câu `true_false` Explorer hiện hình câu (khung 4:3), nên hình chuỗi ngược phải hiện đủ. Nhờ kiểm trên iPhone nhỏ: ba món nhỏ vẫn nhận ra được.
- **Từ EN có thể ngoài Starters/Movers:** food chain, arrow, grasshopper, caterpillar, cabbage, sparrow, egret, straw, tongue, eater.
