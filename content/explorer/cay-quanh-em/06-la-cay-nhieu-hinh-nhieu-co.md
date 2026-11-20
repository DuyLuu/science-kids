---
id: 4c93de3d-2c95-4e53-a9fd-3448379be44b
topic: cay-quanh-em
slug: la-cay-nhieu-hinh-nhieu-co
order: 6
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Leaves of many shapes
vi: Lá cây nhiều hình, nhiều cỡ
> Giữ đúng tên ở `content/syllabus.json` (key `identifying-plants-and-their-basic-parts`, bài số sáu).

## Mục tiêu
en: I can compare leaves of different plants.
vi: Em so sánh được lá của các loại cây.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 18/11/2026. Ticket SK-051. Mọi dòng `id:` để trống; chạy `ids` sau bài 5 (câu w1 trỏ bài 5, câu w2 trỏ bài 3).
> Sườn: Oak Y1 L3 `naming-trees` (`docs/oak/identifying-plants-and-their-basic-parts.md`). Lá của sườn (sồi, nhựa ruồi, sung dâu) thay bằng lá chuối, lá bàng, lá dừa, lá phượng (SK-051). Kính lúp, tra sách, tra mạng của sườn thành nhìn lá, chọn cây.
> Không gọi cây chuối, cây dừa là "tree" hay "cây to": chữ bé nghe nói "banana plant", "coconut palm". Vì vậy mục tiêu và ý chính ba nói "plant" (sườn và "Bảng soạn" nói "tree").
> Sửa `all_leaves_look_same` ở ý chính một, bốn ô Học, phần Chơi và câu q6 (gắn key). Câu w2 ôn `trees_not_plants` của bài 3 (sườn khuyên lặp ý này ở lesson này), không gắn key.

## Ý chính
1.en: Leaves come in many shapes and sizes.
1.vi: Lá cây có nhiều hình, nhiều cỡ.
2.en: Look closely to compare leaves.
2.vi: Nhìn kỹ để so sánh các chiếc lá.
3.en: A leaf can help us name a plant.
3.vi: Nhìn lá có thể biết tên cây.
> Ý ba đổi "tree" ở "Bảng soạn" thành "plant" (lá chuối, lá dừa không phải lá cây to). Bản VI giữ nguyên.
> Từ cụ thể tới trừu tượng: nhìn từng chiếc lá, so sánh, rồi dùng hình lá để biết tên cây.

## Khởi động

> Hai câu. w1 ôn bài 5 (bài trước): mình ăn lá rau cải. w2 ôn bài 3 (cách hai bài): cây bàng là thực vật (ý `trees_not_plants`, không gắn key), nối sang lá bàng hôm nay.

### w1
id: 09f981b1-e41a-4621-8f31-872597605c6d
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: cay-quanh-em/rau-qua-ta-an-la-phan-nao-cua-cay
prompt.en: Which one do we eat the leaves of?
prompt.vi: Rau nào mình ăn lá?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of big, green leaves in soup.
hint.vi: Em nghĩ tới lá xanh to trong bát canh nhé.
explanation_correct.en: Yes! We cook mustard greens in soup.
explanation_correct.vi: Đúng rồi! Rau cải hay được nấu canh.
explanation_wrong.en: The answer is the mustard greens. They are leaves.
explanation_wrong.vi: Đáp án là rau cải. Rau cải là lá.

#### option w1_carrot
correct: false
feedback.en: We eat the root of a carrot.
feedback.vi: Mình ăn rễ của cây cà rốt.
label.en: carrots
label.vi: cà rốt
image.brief: Dùng lại hình `explore_eat_roots` ở bài `cay-quanh-em/rau-qua-ta-an-la-phan-nao-cua-cay`. Từ khoá tìm ảnh (EN): carrot with leaves
image.alt.en: Carrots with green leaves
image.alt.vi: Cà rốt còn lá xanh

#### option w1_mustard
correct: true
label.en: mustard greens
label.vi: rau cải
image.brief: Dùng lại hình `q3_mustard` ở bài `cay-quanh-em/rau-qua-ta-an-la-phan-nao-cua-cay`. Từ khoá tìm ảnh (EN): mustard greens
image.alt.en: Fresh mustard greens
image.alt.vi: Bó rau cải xanh

### w2
id: fb4c8f04-dd76-4937-95d0-c391e683c015
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: cay-quanh-em/cay-to-re-than-canh-la
prompt.en: An Indian almond tree is a plant.
prompt.vi: Cây bàng là một loài thực vật.
image.brief: Dùng lại hình `explore_tree` ở bài `cay-quanh-em/cay-to-re-than-canh-la`. Từ khoá tìm ảnh (EN): Terminalia catappa tree
image.alt.en: An Indian almond tree
image.alt.vi: Cây bàng
answer: true
hint.en: Think of its roots, trunk and leaves.
hint.vi: Em nghĩ tới rễ, thân và lá của cây bàng nhé.
explanation_correct.en: Yes! Big trees are plants, too.
explanation_correct.vi: Đúng rồi! Cây to cũng là thực vật.
explanation_wrong.en: This is true. A tree is a plant.
explanation_wrong.vi: Câu này đúng. Cây to là thực vật.
feedback_false.en: It grows roots and leaves, like plants.
feedback_false.vi: Cây bàng có rễ và lá như các cây khác.
> Ôn ý `trees_not_plants` của bài 3 theo chiều khẳng định (không gắn key: mỗi key một câu trong chủ đề). Câu mới, khác câu q6 bài 3.

## Học

> Bốn ô, bốn kiểu lá khác hẳn nhau: lá chuối (rất dài, to), lá bàng (to, tròn bầu), lá dừa (xẻ thành nhiều lá nhỏ dài), lá phượng (gồm rất nhiều lá li ti). Mỗi ô là một ví dụ sửa `all_leaves_look_same`.
> Nhãn ô Long leaves, Round leaves, Tiny leaves trùng nhãn nhóm phần Chơi (một ý một nhãn).

### explore
id: 9ec4919a-699e-4b87-8a24-de87f49f776a
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_banana_leaf
label.en: Long leaves
label.vi: Lá dài
color: cham
sentence.en: A banana leaf is very long and wide.
sentence.vi: Lá chuối rất dài và to.
image.brief: [ảnh] Một tàu lá chuối xanh tươi, dài và to, còn trên cây chuối, chụp ngang thấy gần hết chiếc lá; lá có thể rách vài đường theo gân; không người, không chữ. Ảnh ngang (khung vuông ô Học, món Chơi, khung 4:3 câu q3, thẻ ba lựa chọn 5:2 câu q5, thẻ từ 2:1, thẻ hai lựa chọn bài 7 câu w1). Hình gốc của cả chủ đề. Từ khoá tìm ảnh (EN): banana leaf; banana plant leaf green; Musa leaf
image.alt.en: A big, long banana leaf
image.alt.vi: Tàu lá chuối to và dài
examples.1.en: it can cover you in the rain
examples.1.vi: lá chuối che mưa được cho em
examples.2.en: it is smooth and bright green
examples.2.vi: lá nhẵn, xanh tươi
examples.3.en: strong wind tears it into strips
examples.3.vi: gió to xé lá thành từng dải
> Không gọi cây chuối là "tree" hay "cây to" (SK-051).
> [CẦN KIỂM] Lá chuối rất to, dài, nhẵn; gió to làm lá rách thành dải theo gân.

#### group explore_almond_leaf
label.en: Round leaves
label.vi: Lá tròn
color: vang_hoe
sentence.en: Indian almond leaves are wide and round.
sentence.vi: Lá bàng to, tròn bầu.
image.brief: Dùng lại hình `explore_alive` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa green leaves branch
image.alt.en: Green leaves on a branch
image.alt.vi: Lá xanh trên cành cây
examples.1.en: they turn red, then fall
examples.1.vi: lá chuyển đỏ rồi rụng
examples.2.en: thick and shiny
examples.2.vi: lá dày và bóng
examples.3.en: wide like a hand fan
examples.3.vi: to như cái quạt nan
> Ví dụ một dạy trước câu q4 (lá bàng đỏ vẫn là lá bàng). `alt` gốc không có chữ "wide", "round" (ảnh là đáp án câu q1).
> [CẦN KIỂM] Lá bàng to, tròn bầu (rộng ở đầu lá), dày, bóng; lá chuyển đỏ trước khi rụng.

#### group explore_coconut_leaf
label.en: Many strips
label.vi: Lá xẻ nhỏ
color: nau_dat
sentence.en: A coconut leaf splits into many strips.
sentence.vi: Lá dừa xẻ ra thành nhiều lá nhỏ.
image.brief: [ảnh] Một tàu lá dừa xanh, thấy rõ cuống dài và rất nhiều lá nhỏ dài, mảnh xếp hai bên, chụp ngang trên nền trời; không người, không quả dừa chiếm khung, không chữ. Ảnh ngang (khung vuông ô Học, thẻ ba lựa chọn 5:2 câu q1, thẻ từ 2:1, thẻ thưởng vuông). Hình gốc của cả chủ đề. Từ khoá tìm ảnh (EN): coconut palm frond; coconut leaf sky; Cocos nucifera leaves
image.alt.en: A coconut leaf with many strips
image.alt.vi: Tàu lá dừa xẻ nhiều lá nhỏ
examples.1.en: each strip is long and thin
examples.1.vi: mỗi lá nhỏ dài và mảnh
examples.2.en: they sway in the wind
examples.2.vi: lá đung đưa trong gió
examples.3.en: coconut palms grow near the sea
examples.3.vi: cây dừa mọc nhiều ở vùng biển
> Không gọi cây dừa là "tree". Ô này không có nhóm ở phần Chơi (lá dừa vừa dài vừa xẻ, sẽ nước đôi giữa hai nhóm).
> [CẦN KIỂM] Lá dừa là một lá xẻ thành nhiều lá nhỏ (lá kép lông chim); cây dừa mọc nhiều ở vùng ven biển, ven sông.

#### group explore_flame_leaf
label.en: Tiny leaves
label.vi: Lá li ti
color: gi_dong
sentence.en: Flame tree leaves are made of tiny leaves.
sentence.vi: Lá phượng gồm rất nhiều lá nhỏ li ti.
image.brief: [ảnh] Lá phượng chụp gần: một cành lá kép như chiếc lông chim, thấy rõ rất nhiều lá nhỏ li ti xếp hai hàng; nền trời hay tán lá mờ; không hoa đỏ chiếm khung, không người, không chữ. Đúng loài *Delonix regia*. Ảnh vuông hoặc ngang (khung vuông ô Học, món Chơi, thẻ ba lựa chọn 5:2 câu q1, khung 4:3 câu q2, thẻ hai lựa chọn bài 7 câu w1). Hình gốc của cả chủ đề. Từ khoá tìm ảnh (EN): Delonix regia leaves; flame tree leaves close up; royal poinciana foliage
image.alt.en: A leaf made of tiny leaves
image.alt.vi: Chiếc lá gồm nhiều lá li ti
examples.1.en: like a green feather
examples.1.vi: giống chiếc lông chim xanh
examples.2.en: red flowers in summer
examples.2.vi: hoa đỏ rực vào mùa hè
examples.3.en: tiny leaves fall all over the yard
examples.3.vi: lá phượng li ti rụng đầy sân
> Ví dụ hai ôn *Thời tiết và các mùa* bài 2 (hoa phượng mùa hè). Câu chính tám từ.
> [CẦN KIỂM] Lá phượng là lá kép gồm rất nhiều lá chét nhỏ li ti; lá chét rụng đầy sân.

### new_words
id: 1a168af9-5143-43aa-9b0b-0476a75f9863
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: leaf, shape

## Chơi

> Bé chọn ba chiếc lá khác hình: một lá dài (lá chuối), một lá tròn (lá bàng xanh hoặc lá bàng đỏ), một lá li ti (lá phượng hoặc lá trinh nữ). Đạt khi đủ ba nhóm và không chọn thứ không phải lá.
> Món bẫy: hoa sen, quả xoài xanh: cũng là bộ phận của cây, có màu xanh hay hồng, nhưng không phải lá. Kệ bảy món, toàn ảnh chụp. Lá dừa không lên kệ (nước đôi giữa "dài" và "xẻ nhỏ").
> Sửa 18/11 lượt 2 (tester B2, phiên chính chốt): lá trinh nữ (`tray_mimosa`, dùng lại ảnh `q5_mimosa`) lên kệ, nhóm Tiny leaves, để bé đã thấy ảnh này trước câu q5. Trước đó lá trinh nữ không lên kệ để giữ câu q5 là tình huống mới; nay ưu tiên luật "đáp án không là ảnh mới duy nhất".

### tray
id: 0d976184-c9d0-4e5c-aa56-91d668facfb9
type: build_tray
version: 1
prompt.en: Choose long, round and tiny leaves
prompt.vi: Chọn lá dài, lá tròn và lá li ti
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Look closely at each leaf.
messages.start.vi: Em nhìn kỹ từng chiếc lá nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Leaves come in many shapes.
messages.balanced.vi: Tuyệt! Lá cây có nhiều hình dáng.
messages.has_limited.en: That one is not a leaf.
messages.has_limited.vi: Món này không phải là lá.
messages.missing.tray_long.en: You still need a long leaf.
messages.missing.tray_long.vi: Em còn thiếu một lá dài.
messages.missing.tray_round.en: You still need a round leaf.
messages.missing.tray_round.vi: Em còn thiếu một lá tròn.
messages.missing.tray_tiny.en: You still need tiny leaves.
messages.missing.tray_tiny.vi: Em còn thiếu lá li ti.
> Lời nhắn `has_limited` đúng với cả hai món bẫy.

#### group tray_long
label.en: Long leaves
label.vi: Lá dài
color: cham
role: required

#### group tray_round
label.en: Round leaves
label.vi: Lá tròn
color: vang_hoe
role: required

#### group tray_tiny
label.en: Tiny leaves
label.vi: Lá li ti
color: gi_dong
role: required

#### group tray_not_leaf
label.en: Not a leaf
label.vi: Không phải lá
color: do_son
role: limit

#### item tray_red_almond
label.en: Red almond leaves
label.vi: Lá bàng đỏ
group: tray_round
image.brief: Dùng lại hình `almond_card` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa red leaves
image.alt.en: Red leaves on an Indian almond tree
image.alt.vi: Lá bàng chuyển màu đỏ

#### item tray_flame
label.en: Flame tree leaves
label.vi: Lá phượng
group: tray_tiny
image.brief: Dùng lại hình `explore_flame_leaf`. Từ khoá tìm ảnh (EN): Delonix regia leaves
image.alt.en: A leaf made of tiny leaves
image.alt.vi: Chiếc lá gồm nhiều lá li ti

#### item tray_lotus
label.en: Lotus flower
label.vi: Hoa sen
group: tray_not_leaf
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao

#### item tray_banana_leaf
label.en: Banana leaf
label.vi: Lá chuối
group: tray_long
image.brief: Dùng lại hình `explore_banana_leaf`. Từ khoá tìm ảnh (EN): banana leaf
image.alt.en: A big, long banana leaf
image.alt.vi: Tàu lá chuối to và dài

#### item tray_mango
label.en: Green mango
label.vi: Quả xoài xanh
group: tray_not_leaf
image.brief: Dùng lại hình `tray_green_mango` ở bài `co-the-cua-em/nem-va-so`. Từ khoá tìm ảnh (EN): green mango whole unripe
image.alt.en: A green mango
image.alt.vi: Quả xoài xanh

#### item tray_green_almond
label.en: Indian almond leaves
label.vi: Lá bàng
group: tray_round
image.brief: Dùng lại hình `explore_alive` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa green leaves branch
image.alt.en: Green leaves on a branch
image.alt.vi: Lá xanh trên cành cây

#### item tray_mimosa
label.en: Sensitive plant leaves
label.vi: Lá trinh nữ
group: tray_tiny
image.brief: Dùng lại hình `q5_mimosa`.
image.alt.en: Tiny leaves on a branch
image.alt.vi: Lá li ti trên cành
> Thêm 18/11 lượt 2 (tester B2): bé gặp ảnh lá trinh nữ trên kệ trước câu q5, để đáp án q5 không còn là ảnh mới duy nhất giữa hai ảnh quen (Quy ước hình số 6). Nhãn theo tên gọi thống nhất "sensitive plant" · "trinh nữ" (`_topic.md`), cùng chữ với nhãn lựa chọn q5. Nhóm `tray_tiny` nay có hai món (lá phượng, lá trinh nữ). Ảnh chụp, kệ vẫn toàn ảnh chụp.

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2 Đúng, q3 Sai, q4 Sai, q6 Sai).
> Hình câu `single_choice` là hàng rào tre trung tính. Câu nào cũng tự đủ nghĩa khi chỉ nghe.
> Không dùng `order_sequence`: so cỡ lá bằng ảnh không chắc (ảnh chụp gần không cho thấy cỡ thật; lá phượng cả cành có thể dài hơn lá bàng).

### q1
id: 6c39ca4d-5139-4921-a951-d80899fb51d6
format: single_choice
version: 1
dok: 1
prompt.en: Which leaf is wide and round?
prompt.vi: Lá nào to, tròn bầu?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look at the edges of each leaf.
hint.vi: Em nhìn viền của từng chiếc lá nhé.
explanation_correct.en: Yes! They turn red before they fall.
explanation_correct.vi: Đúng rồi! Lá bàng chuyển đỏ trước khi rụng.
explanation_wrong.en: The answer is the Indian almond leaves. They are round.
explanation_wrong.vi: Đáp án là lá bàng. Lá bàng tròn bầu.
> DOK 1: nhớ lại ô Round leaves, nhìn hình lá. Ba kiểu lá khác hẳn nhau (tròn bầu; xẻ nhiều dải; li ti).

#### option q1_coconut
correct: false
feedback.en: A coconut leaf splits into thin strips.
feedback.vi: Lá dừa xẻ thành nhiều lá nhỏ, mảnh.
label.en: coconut leaf
label.vi: lá dừa
image.brief: Dùng lại hình `explore_coconut_leaf`. Từ khoá tìm ảnh (EN): coconut palm frond
image.alt.en: A coconut leaf with many strips
image.alt.vi: Tàu lá dừa xẻ nhiều lá nhỏ

#### option q1_almond
correct: true
label.en: Indian almond leaves
label.vi: lá bàng
image.brief: Dùng lại hình `explore_alive` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa green leaves branch
image.alt.en: Green leaves on a branch
image.alt.vi: Lá xanh trên cành cây

#### option q1_flame
correct: false
feedback.en: A flame tree leaf has tiny leaves.
feedback.vi: Lá phượng gồm nhiều lá li ti.
label.en: flame tree leaf
label.vi: lá phượng
image.brief: Dùng lại hình `explore_flame_leaf`. Từ khoá tìm ảnh (EN): Delonix regia leaves
image.alt.en: A leaf made of tiny leaves
image.alt.vi: Chiếc lá gồm nhiều lá li ti

### q2
id: e570fb0e-c11e-40d8-a3b6-23e422c24272
format: true_false
version: 1
dok: 1
prompt.en: Flame tree leaves are made of tiny leaves.
prompt.vi: Lá phượng gồm rất nhiều lá nhỏ li ti.
image.brief: Dùng lại hình `explore_flame_leaf`. Từ khoá tìm ảnh (EN): Delonix regia leaves
image.alt.en: A leaf made of tiny leaves
image.alt.vi: Chiếc lá gồm nhiều lá li ti
answer: true
hint.en: Look closely at one leaf.
hint.vi: Em nhìn kỹ một chiếc lá nhé.
explanation_correct.en: Yes! It looks like a green feather.
explanation_correct.vi: Đúng rồi! Lá phượng trông như chiếc lông chim.
explanation_wrong.en: This is true. Many tiny leaves make one leaf.
explanation_wrong.vi: Câu này đúng. Nhiều lá li ti làm thành một lá phượng.
feedback_false.en: These tiny leaves grow in two rows.
feedback_false.vi: Những lá li ti này mọc thành hai hàng.
> DOK 1: nhớ lại câu chính ô Tiny leaves, nhìn ảnh (ý chính hai: nhìn kỹ). Câu dùng đúng chữ câu chính ô (bé vừa nghe), tám từ.

### q3
id: ceb08dc7-94b8-4af8-b22d-10dc55c5510e
format: true_false
version: 1
dok: 1
prompt.en: A banana leaf is small and round.
prompt.vi: Lá chuối nhỏ và tròn.
image.brief: Dùng lại hình `explore_banana_leaf`. Từ khoá tìm ảnh (EN): banana leaf
image.alt.en: A big, long banana leaf
image.alt.vi: Tàu lá chuối to và dài
answer: false
hint.en: Look at how long it is.
hint.vi: Em nhìn xem chiếc lá dài thế nào nhé.
explanation_correct.en: A banana leaf is very long and wide.
explanation_correct.vi: Lá chuối rất dài và to.
explanation_wrong.en: This is false. It is long and big.
explanation_wrong.vi: Câu này sai. Lá chuối dài và to.
feedback_true.en: A banana leaf can cover you in rain.
feedback_true.vi: Lá chuối che mưa được cho em.
> DOK 1: nhớ lại ô Long leaves, nhìn ảnh. Câu khẳng định, đáp án Sai.

### q4
id: a85b0b44-be57-402a-86b7-788389560a94
format: true_false
version: 1
dok: 2
prompt.en: This leaf is from a coconut palm.
prompt.vi: Chiếc lá này là lá dừa.
image.brief: Dùng lại hình `almond_card` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa red leaves
image.alt.en: Red leaves on a branch
image.alt.vi: Lá đỏ trên cành
answer: false
hint.en: Look at the leaf's shape, not colour.
hint.vi: Em nhìn hình dáng lá, đừng nhìn màu nhé.
explanation_correct.en: These are red Indian almond leaves.
explanation_correct.vi: Đây là lá bàng đã chuyển đỏ.
explanation_wrong.en: This is false. It is an Indian almond leaf.
explanation_wrong.vi: Câu này sai. Đây là lá bàng.
feedback_true.en: A coconut leaf splits into long strips.
feedback_true.vi: Lá dừa xẻ thành nhiều lá nhỏ, dài.
> DOK 2: nhìn hình lá để biết tên cây (ý chính ba), với một ảnh lá khác màu ô Học (lá bàng đỏ, không phải lá bàng xanh): bé phải dựa vào hình dáng, không dựa vào màu. Câu "This leaf" dựa vào hình câu `true_false` (luôn hiện ở Explorer).
> `alt` riêng ở chỗ này (`alt` gốc "Red leaves on an Indian almond tree" nói sẵn đáp án). Ảnh, key, `brief` giữ như hình gốc.

### q5
id: d81864e1-854c-40aa-af72-5c38eeb119ec
format: single_choice
version: 1
dok: 2
prompt.en: Which leaves look like flame tree leaves?
prompt.vi: Lá nào trông giống lá phượng?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for many tiny leaves in rows.
hint.vi: Em tìm lá có nhiều lá nhỏ xếp hàng nhé.
explanation_correct.en: Yes! Sensitive plant leaves are tiny, too.
explanation_correct.vi: Đúng rồi! Lá trinh nữ cũng li ti.
explanation_wrong.en: The answer is the sensitive plant leaves. They are tiny.
explanation_wrong.vi: Đáp án là lá trinh nữ. Lá trinh nữ li ti.
> DOK 2: so sánh hình lá trinh nữ với lá phượng, áp ô Tiny leaves (trinh nữ gặp ở *Sinh vật sống ở đâu?* bài 2 vì lá cụp; ảnh lá chụp gần bé thấy ở kệ Chơi bài này, món `tray_mimosa`). Hai lựa chọn sai là lá bé vừa học (to, dài; tròn).
> [CẦN KIỂM] Trinh nữ có lá kép gồm nhiều lá chét nhỏ li ti, giống lá phượng về hình.

#### option q5_banana
correct: false
feedback.en: A banana leaf is one big leaf.
feedback.vi: Lá chuối là một chiếc lá to.
label.en: banana leaf
label.vi: lá chuối
image.brief: Dùng lại hình `explore_banana_leaf`. Từ khoá tìm ảnh (EN): banana leaf
image.alt.en: A big, long banana leaf
image.alt.vi: Tàu lá chuối to và dài

#### option q5_mimosa
correct: true
label.en: sensitive plant leaves
label.vi: lá trinh nữ
image.brief: [ảnh] Lá trinh nữ chụp gần: nhiều lá li ti xếp hai hàng trên cuống, không hoa, không chữ; ảnh ngang (thẻ 5:2). Từ khoá tìm ảnh (EN): Mimosa pudica leaves close up
image.alt.en: Tiny leaves on a branch
image.alt.vi: Lá li ti trên cành
> Sửa 18/11 theo rà chữ tester N5: nhãn gọi tên lá (như hai lựa chọn kia), `alt` nói về lá, không nói hoa.
> Sửa 18/11 (SK-051 quyết định 16): ảnh riêng nét hơn ("Mimosa pudica leaves close up", CC0), không cắt từ `explore_sensitive` nữa (bản cắt quá nhỏ, mờ trên thẻ 5:2). Hình gốc của bài: kệ Chơi `tray_mimosa` dùng lại (lượt 2). Ảnh vuông cho món Chơi, thẻ 5:2 cho câu này.
> Sửa 18/11 lượt 2 (tester B2): bé đã gặp ảnh này ở kệ Chơi (`tray_mimosa`, nhóm Tiny leaves), nên đáp án không còn là ảnh mới duy nhất. Câu vẫn DOK 2: bé so hình lá trinh nữ với lá phượng (hai món cùng nhóm li ti), không chỉ nhớ nhãn.

#### option q5_almond
correct: false
feedback.en: Indian almond leaves are wide and round.
feedback.vi: Lá bàng to, tròn bầu.
label.en: Indian almond leaves
label.vi: lá bàng
image.brief: Dùng lại hình `explore_alive` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa green leaves branch
image.alt.en: Green leaves on a branch
image.alt.vi: Lá xanh trên cành cây

### q6
id: 4cadca00-6705-4efd-89a7-4dcdc79c8853
format: true_false
version: 1
dok: 2
misconception: all_leaves_look_same
prompt.en: Every leaf has the same shape.
prompt.vi: Mọi chiếc lá đều có cùng một hình.
image.brief: Dùng lại hình `explore_alive` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa green leaves branch
image.alt.en: Green leaves on a branch
image.alt.vi: Lá xanh trên cành cây
answer: false
hint.en: Think of banana leaves, then flame leaves.
hint.vi: Em nghĩ tới lá chuối và lá phượng nhé.
explanation_correct.en: Leaves have many shapes and sizes.
explanation_correct.vi: Lá cây có nhiều hình, nhiều cỡ.
explanation_wrong.en: This is false. Leaves have many shapes.
explanation_wrong.vi: Câu này sai. Lá có nhiều hình.
feedback_true.en: Coconut and almond leaves look very different.
feedback_true.vi: Lá dừa và lá bàng trông khác hẳn nhau.
> Câu misconception (`all_leaves_look_same`), DOK 2: bé quen gọi chung "lá xanh" dễ nghĩ lá nào cũng như nhau và chạm Đúng. Bé áp bốn ô Học để bác câu nói. Câu chỉ kiểm một việc: các lá có cùng hình không.
> Hình là một cành lá bàng (một loại lá, vật được nói tới), không phải ảnh nhiều loại lá cạnh nhau. Bản VI "Mọi chiếc lá đều…" để không nghe thành câu hỏi. `explanation_correct` là đúng câu `correction` ở `_topic.md`. `hint` và `feedback_true` nêu hai cặp lá khác nhau, không lặp ý.

## Từ vựng

### leaf
id: d9e9735d-d3b6-445f-8271-997e62a49e43
tier: core
term.en: leaf
term.vi: chiếc lá
example.en: Each plant has its own leaf shape.
example.vi: Mỗi loài cây có hình lá riêng.
image.brief: Dùng lại hình `explore_alive` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa green leaves branch
image.alt.en: Green leaves on a branch
image.alt.vi: Lá xanh trên cành cây
> Trùng có chủ ý với từ `extra` `leaf` của *Sinh vật sống ở đâu?* bài 3 (`sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`, cùng ảnh); ở bài này nâng lên `core`. App không gộp thẻ theo chữ.

### shape
id: 320d99c0-cfb0-48ec-902c-3a1c0de4f6d5
tier: core
term.en: shape
term.vi: hình dáng
example.en: A coconut leaf has a long shape.
example.vi: Lá dừa có hình dài.
image.brief: Dùng lại hình `explore_coconut_leaf`. Từ khoá tìm ảnh (EN): coconut palm frond
image.alt.en: A coconut leaf with many strips
image.alt.vi: Tàu lá dừa xẻ nhiều lá nhỏ

### long
id: 7fa9f7a8-3a6c-4198-abaf-3c985e1363d4
tier: extra
term.en: long
term.vi: dài
example.en: A banana leaf is very long.
example.vi: Lá chuối rất dài.
image.brief: Dùng lại hình `explore_banana_leaf`. Từ khoá tìm ảnh (EN): banana leaf
image.alt.en: A big, long banana leaf
image.alt.vi: Tàu lá chuối to và dài

### round
id: cbb07205-a0df-4b24-a59e-5c0ab73a84ed
tier: extra
term.en: round
term.vi: tròn
example.en: An Indian almond leaf is round.
example.vi: Lá bàng có hình tròn bầu.
image.brief: Dùng lại hình `explore_alive` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa green leaves branch
image.alt.en: Green leaves on a branch
image.alt.vi: Lá xanh trên cành cây
> Ticket gợi ý `big`, `small`; đổi thành `long`, `round` cho khớp nhãn nhóm phần Chơi.

## Thưởng

### coconut_card
id: 41f043a5-650f-4353-995c-f9cba7804c23
set: plants
rarity: common
name.en: Coconut palm
name.vi: Cây dừa
tag.en: Long leaves in the wind
tag.vi: Lá dài đung đưa trong gió
fact.en: Its leaves can be longer than a bed.
fact.vi: Tàu lá dừa có thể dài hơn cái giường.
image.brief: Dùng lại hình `explore_coconut_leaf`. Từ khoá tìm ảnh (EN): coconut palm frond
image.alt.en: A coconut leaf with many strips
image.alt.vi: Tàu lá dừa xẻ nhiều lá nhỏ
> [CẦN KIỂM] Tàu lá dừa dài khoảng bốn tới sáu mét (dài hơn một cái giường); tên gọi "coconut palm", không "coconut tree" (SK-051).

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Lá chụp gần, rõ hình; không người, không chữ.
- **Ảnh mới, hình gốc của cả chủ đề (giữ đúng key, `alt`, truy vấn đầu ở `_topic.md`):** tàu lá chuối (`explore_banana_leaf`), tàu lá dừa (`explore_coconut_leaf`), lá phượng chụp gần (`explore_flame_leaf`).
- **Ảnh mới chỉ dùng ở bài này:** lá trinh nữ chụp gần (`q5_mimosa`; ứng viên "Mimosa pudica leaves close up", NonNerd, CC0; kiểm CC0 và loài ở trang gốc, không hoa nổi bật, cắt 5:2 cho q5, vuông cho món Chơi `tray_mimosa`). Từ 18/11 không cắt từ `explore_sensitive` nữa (SK-051 quyết định 16). Lượt 2: thêm mục chọn ảnh `tray_mimosa` `same_as q5_mimosa` (designer).
- **Ảnh dùng lại:** bài 3 `explore_tree` (w2); bài 5 `explore_eat_roots`, `q3_mustard` (w1); *Sinh vật sống ở đâu?* bài 3 `explore_alive` (ô Round leaves, món Chơi, q1, q5, q6, từ `leaf`, `round`), `almond_card` (món Chơi, q4); *Cơ thể của em* bài 6 `tray_green_mango` (món Chơi); *Gọi tên và nhóm động vật* bài 1 `w1` (hàng rào tre), `w1_lotus` (món Chơi).
- **`alt` riêng:** q4 dùng `almond_card` với `alt` "Red leaves on a branch" · "Lá đỏ trên cành".
- **Ảnh khó:** lá phượng đúng loài *Delonix regia*, thấy rõ lá li ti, không bị hoa đỏ che; tàu lá dừa thấy rõ các dải lá trên nền trời; lá chuối thấy gần hết chiếc lá. Ba ảnh lá mới nên cùng kiểu chụp gần để so hình.
- **Màu:** Học: lá dài `cham`, lá tròn `vang_hoe`, lá xẻ nhỏ `nau_dat`, lá li ti `gi_dong`. Chơi: lá dài `cham`, lá tròn `vang_hoe`, lá li ti `gi_dong`, không phải lá `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (leaf, shape). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món (thêm `tray_mimosa` 18/11 lượt 2). Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Đúng). Quiz `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2 Đúng, q3 Sai, q4 Sai, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`all_leaves_look_same`). Không có `labels` ở câu `true_false`.
- **Màn Chơi, ví dụ để kiểm:** Lá chuối, Lá bàng, Lá phượng → `balanced`; Lá chuối, Lá bàng đỏ, Lá trinh nữ → `balanced`; Lá bàng, Lá bàng đỏ, Lá phượng → `missing.tray_long`; Lá chuối, Lá bàng, Lá trinh nữ → `balanced`; Lá chuối, Lá bàng, Hoa sen → `missing.tray_tiny`; Lá chuối, Lá trinh nữ, Hoa sen → `has_limited`.
- **Khởi động trỏ:** w1 → `cay-quanh-em/rau-qua-ta-an-la-phan-nao-cua-cay` (bài 5 phải có id trước), w2 → `cay-quanh-em/cay-to-re-than-canh-la` (bài 3).
- **Từ EN có thể ngoài Starters/Movers:** shape, round, wide, strips, coconut palm, banana leaf, Indian almond, flame tree, feather, sway, sensitive plant, mustard greens.
