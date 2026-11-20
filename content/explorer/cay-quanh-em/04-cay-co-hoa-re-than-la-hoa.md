---
id: 6f0ca701-2a7c-4163-b992-09ad316cd424
topic: cay-quanh-em
slug: cay-co-hoa-re-than-la-hoa
order: 4
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Parts of a flowering plant
vi: Cây có hoa: rễ, thân, lá, hoa
> Giữ đúng tên ở `content/syllabus.json` (key `identifying-plants-and-their-basic-parts`, bài số bốn). Tên VI có dấu hai chấm: nghe thử giọng VI đọc tên bài.

## Mục tiêu
en: I can name parts of a flowering plant.
vi: Em gọi tên được bộ phận của cây có hoa.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 18/11/2026. Ticket SK-051. Mọi dòng `id:` để trống; chạy `ids` sau bài 3 (câu w1 trỏ bài 3).
> Sườn: Oak Y1 L5 `structure-of-a-flowering-plant` (`docs/oak/identifying-plants-and-their-basic-parts.md`). "Nhổ cây xem rễ" của sườn thành ảnh cây còn nguyên rễ (ô Four parts); "nối bộ phận với số trên hình" thành chọn hình bộ phận. Ý "cây đổi theo thời gian" nói qua nụ, hoa, quả (không qua bốn mùa Anh).
> Ý chính một rút còn tám từ: "Bảng soạn" ghi "A flowering plant has roots, a stem, leaves and flowers." (mười từ). Ví dụ ô Four parts nhắc quả và hạt để nối bài 5 (SK-051).
> Sửa `plant_same_all_year` ở ý chính ba, ô Bud, flower, fruit, câu q4 và câu q6 (gắn key).

## Ý chính
1.en: Flowering plants have roots, stems, leaves and flowers.
1.vi: Cây có hoa có rễ, thân, lá và hoa.
2.en: Look closely to see each part.
2.vi: Nhìn kỹ để thấy từng bộ phận.
3.en: A plant changes: bud, flower, then fruit.
3.vi: Cây đổi dần: nụ, rồi hoa, rồi quả.
> Từ cụ thể tới trừu tượng: bốn bộ phận nhìn thấy, cách nhìn kỹ, rồi cây đổi theo thời gian.
> Ý ba có dấu hai chấm trong EN và VI: nghe thử giọng đọc.

## Khởi động

> Hai câu. w1 ôn bài 3 (bài trước): thân cây đỡ cành. w2 ôn *Sinh vật sống ở đâu?* bài 2 (mốc dài): cây trinh nữ (một cây có hoa bé đã gặp), nói ngược chiều câu q2 của bài đó.

### w1
id: 4cfc737f-7aaf-464c-bc6f-583130349ea9
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: cay-quanh-em/cay-to-re-than-canh-la
prompt.en: Which part holds up the branches?
prompt.vi: Bộ phận nào đỡ các cành cây?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of a tree from the ground up.
hint.vi: Em nghĩ cây từ dưới đất lên nhé.
explanation_correct.en: Yes! The trunk is thick and strong.
explanation_correct.vi: Đúng rồi! Thân cây to và chắc.
explanation_wrong.en: The answer is the trunk. It holds branches.
explanation_wrong.vi: Đáp án là thân cây. Thân đỡ các cành.

#### option w1_leaves
correct: false
feedback.en: Leaves grow on the branches.
feedback.vi: Lá mọc trên cành cây.
label.en: leaves
label.vi: lá cây
image.brief: Dùng lại hình `explore_alive` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa green leaves branch
image.alt.en: Green leaves on a branch
image.alt.vi: Lá xanh trên cành cây

#### option w1_trunk
correct: true
label.en: trunk
label.vi: thân cây
image.brief: Dùng lại hình `explore_tree_trunk` ở bài `cay-quanh-em/cay-to-re-than-canh-la`. Từ khoá tìm ảnh (EN): tree trunk bark
image.alt.en: A thick tree trunk
image.alt.vi: Thân cây to

### w2
id: 029aa35c-c22f-446c-8552-59b7eb8be0cc
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/vat-song-nao-cung-cu-dong
prompt.en: Sensitive plant leaves stay open when touched.
prompt.vi: Chạm vào, lá trinh nữ vẫn xoè ra.
image.brief: Dùng lại hình `explore_sensitive` ở bài `sinh-vat-song-o-dau/vat-song-nao-cung-cu-dong`. Từ khoá tìm ảnh (EN): Mimosa pudica leaves flowers
image.alt.en: A sensitive plant with pink flowers
image.alt.vi: Cây trinh nữ có hoa màu hồng
answer: false
hint.en: Think of a light touch on its leaves.
hint.vi: Em nghĩ tới lúc chạm nhẹ vào lá nhé.
explanation_correct.en: Sensitive plant leaves fold up when touched.
explanation_correct.vi: Chạm vào, lá trinh nữ cụp lại.
explanation_wrong.en: This is false. The leaves fold up.
explanation_wrong.vi: Câu này sai. Lá trinh nữ cụp lại.
feedback_true.en: Its leaves fold up fast, then open later.
feedback_true.vi: Lá cụp lại rất nhanh, một lúc sau mới xoè.
> Câu ngược chiều câu q2 của bài nguồn ("A sensitive plant folds up when touched.", Đúng), không chép. Câu nói về điều đã học, không rủ bé tự chạm (thân trinh nữ có gai nhỏ).

## Học

> Bốn ô: bốn bộ phận (cây còn nguyên rễ), thân, nhìn kỹ (hoa mười giờ), nụ, hoa, quả (cây ớt). Ô Four parts nhắc quả và hạt để nối bài 5.

### explore
id: 0eab084a-6b57-4904-b132-34d771129920
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_parts
label.en: Four parts
label.vi: Bốn bộ phận
color: gi_dong
sentence.en: Flowering plants have roots, stems, leaves and flowers.
sentence.vi: Cây có hoa có rễ, thân, lá và hoa.
image.brief: [hình vẽ] Một cây hoa nhỏ đã nhổ lên, đứng thẳng giữa nền kem, thấy đủ từ dưới lên: chùm rễ nâu nhạt toả xuống, còn vài hạt đất nâu ở gốc; một thân xanh thẳng tách hai cành; năm, sáu cặp lá xanh hình bầu dục; ba bông hoa năm cánh màu hồng cánh sen, nhuỵ vàng ở trên cùng; bóng mờ dưới chân; vẽ gần thực tế, không tay người, không chữ, không nét viền. Khung vuông ô Học, khung 4:3 câu q6, thẻ từ 2:1 (bản cắt riêng). Hình gốc của cả chủ đề (đã vẽ, mục `own` `flowering-plant-roots.jpg`, SK-051).
image.alt.en: A flowering plant with its roots
image.alt.vi: Cây có hoa còn nguyên rễ
examples.1.en: roots under the soil
examples.1.vi: rễ ở dưới đất
examples.2.en: a stem with green leaves
examples.2.vi: thân có lá xanh
examples.3.en: flowers, then fruit and seeds
examples.3.vi: hoa, rồi quả và hạt
> Ví dụ ba nhắc quả và hạt (SK-051: để bài 5 không đột ngột).
> [CẦN KIỂM] Cây hoa nhỏ nhấc khỏi chậu thấy đủ rễ, thân, lá, hoa (hoa mười giờ, cúc).
> Sửa 18/11 lượt 2 (tester B4): brief đổi từ `[ảnh]` sang `[hình vẽ]`, tả đúng hình đã chọn; bỏ dòng từ khoá (hình vẽ không tìm ảnh, để `images search` không đi tìm ảnh chụp thay hình vẽ).

#### group explore_stem
label.en: Stem
label.vi: Thân
color: vang_hoe
sentence.en: A stem holds up leaves and flowers.
sentence.vi: Thân đỡ lá và hoa.
image.brief: [ảnh] Một cây hoa (cúc ngũ sắc hay cúc vạn thọ) mọc thẳng trong vườn, thấy rõ thân xanh dài, lá mọc hai bên thân và một bông hoa ở ngọn; chụp ngang tầm, nền mờ; không tay, không chữ. Ảnh vuông hoặc ngang (khung vuông ô Học, khung 4:3 câu q2, thẻ từ 2:1). Từ khoá tìm ảnh (EN): zinnia plant stem; flower stem leaves; marigold plant stem
image.alt.en: A green stem with a flower
image.alt.vi: Thân xanh mang bông hoa
examples.1.en: many stems are green and thin
examples.1.vi: nhiều thân cây xanh và mảnh
examples.2.en: a tree trunk is a big stem
examples.2.vi: thân cây to cũng là một loại thân
examples.3.en: water spinach has a hollow stem
examples.3.vi: rau muống có thân rỗng
> Ví dụ hai nối bài 3 (trunk là thân của cây to). Ví dụ ba nối bài 5 (rau muống, ăn cả thân và lá).
> [CẦN KIỂM] Thân cây to là một loại thân; thân rau muống rỗng.

#### group explore_look
label.en: Look closely
label.vi: Nhìn kỹ
color: cham
sentence.en: Look closely to see each part.
sentence.vi: Nhìn kỹ để thấy từng bộ phận.
image.brief: [ảnh] Cây hoa mười giờ đang nở, chụp gần: thấy cánh hoa màu tươi (ảnh đã chọn: hoa kép màu hồng), lá nhỏ mọng, thân đỏ nhạt bò trên mặt chậu; không tay, không chậu có chữ, không chữ. Đúng loài *Portulaca grandiflora*. Ảnh vuông hoặc ngang (khung vuông ô Học, món Chơi, thẻ ba lựa chọn 5:2, thẻ từ 2:1, thẻ thưởng). Hình gốc của cả chủ đề. Từ khoá tìm ảnh (EN): Portulaca grandiflora; moss rose flowers; portulaca flowers pot
image.alt.en: Bright flowers with thick leaves
image.alt.vi: Hoa tươi màu có lá mọng
examples.1.en: find the roots, stem, leaves, flowers
examples.1.vi: tìm rễ, thân, lá và hoa
examples.2.en: a hand lens makes things big
examples.2.vi: kính lúp làm mọi thứ to ra
examples.3.en: ten o'clock flowers open in the sun
examples.3.vi: hoa mười giờ nở khi có nắng
> Ví dụ ba dạy trước `explanation_correct` câu q1 và thẻ thưởng. Kính lúp chỉ là ví dụ, không hỏi.
> [CẦN KIỂM] Hoa mười giờ nở khi nắng lên; tên EN "ten o'clock flower" (tên phổ biến "moss rose" dễ lẫn rêu "moss" của bài 7, nên không dùng trong chữ bé nghe).

#### group explore_changes
label.en: Bud, flower, fruit
label.vi: Nụ, hoa, quả
color: nau_dat
sentence.en: A plant changes: bud, flower, then fruit.
sentence.vi: Cây đổi dần: nụ, rồi hoa, rồi quả.
image.brief: [ảnh] Một cây ớt trong vườn hay trong chậu, cùng lúc có nụ, hoa trắng nhỏ và quả ớt xanh, đỏ trên cành, chụp gần; không tay, không chữ. Ảnh vuông hoặc ngang (khung vuông ô Học). Từ khoá tìm ảnh (EN): chili plant flower fruit; chilli pepper plant flowers and fruit; Capsicum plant flowering fruiting
image.alt.en: A chilli plant with flowers and fruit
image.alt.vi: Cây ớt có hoa và quả
examples.1.en: a bud opens into a flower
examples.1.vi: nụ nở thành hoa
examples.2.en: a flower turns into a fruit
examples.2.vi: hoa dần thành quả
examples.3.en: fruits hold seeds inside
examples.3.vi: trong quả có hạt
> Ô sửa `plant_same_all_year`. Không nói vì sao hoa thành quả (thụ phấn để dành Discoverer; ranh giới SK-051).
> [CẦN KIỂM] Ở cây ớt, cây bí: nụ nở thành hoa, hoa thành quả, trong quả có hạt (nói gọn, không nói hoa đực, hoa cái).

### new_words
id: cb022fed-8a76-4562-a702-350bd607712b
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: stem, flower

## Chơi

> Bé tìm ba chặng của cây có hoa: một nụ, một bông hoa (hoa mười giờ hoặc hoa bí), một quả (quả bí non hoặc quả xoài xanh). Đạt khi đủ ba nhóm và không chọn thứ không từ cây.
> Món bẫy: trứng (tròn như quả, nhưng do gà đẻ; câu starter quiz của sườn Y2 L7 "trứng không phải bộ phận của cây"), bi thuỷ tinh (tròn như quả nhỏ). Kệ bảy món, toàn ảnh chụp.

### tray
id: 88761314-fcbe-440b-a823-136f11060dc7
type: build_tray
version: 1
prompt.en: Find a bud, a flower and a fruit
prompt.vi: Tìm một nụ, một bông hoa và một quả
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Look closely at each picture.
messages.start.vi: Em nhìn kỹ từng hình nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! A bud becomes a flower, then fruit.
messages.balanced.vi: Tuyệt! Nụ thành hoa, rồi thành quả.
messages.has_limited.en: That one is not from a plant.
messages.has_limited.vi: Món này không phải từ cây mà ra.
messages.missing.tray_buds.en: You still need a bud.
messages.missing.tray_buds.vi: Em còn thiếu một nụ hoa.
messages.missing.tray_flowers.en: You still need a flower.
messages.missing.tray_flowers.vi: Em còn thiếu một bông hoa.
messages.missing.tray_fruits.en: You still need a fruit.
messages.missing.tray_fruits.vi: Em còn thiếu một quả.
> Lời nhắn `has_limited` đúng với cả hai món bẫy.

#### group tray_buds
label.en: Bud
label.vi: Nụ
color: cham
role: required

#### group tray_flowers
label.en: Flower
label.vi: Hoa
color: vang_hoe
role: required

#### group tray_fruits
label.en: Fruit
label.vi: Quả
color: gi_dong
role: required

#### group tray_not_plant
label.en: Not from a plant
label.vi: Không phải từ cây
color: do_son
role: limit

#### item tray_eggs
label.en: Eggs
label.vi: Trứng
group: tray_not_plant
image.brief: Dùng lại hình `explore_eggs` ở bài `goi-ten-va-nhom-dong-vat/chim-va-bo-sat`. Từ khoá tìm ảnh (EN): hen eggs straw nest
image.alt.en: Eggs in a nest of straw
image.alt.vi: Trứng trong ổ rơm

#### item tray_pumpkin_flower
label.en: Pumpkin flower
label.vi: Hoa bí
group: tray_flowers
image.brief: [ảnh] Một bông hoa bí vàng đã nở to, xoè cánh, trên dây bí có lá xanh, chụp gần; không tay, không chữ. Cùng kiểu chụp với `tray_bud`, `q4_pumpkin` (ba thẻ vuông câu q4). Ảnh vuông hoặc ngang (món Chơi, thẻ `order_sequence`, thẻ ba lựa chọn 5:2 câu q5). Hình gốc của cả chủ đề (bài 5 dùng lại). Từ khoá tìm ảnh (EN): pumpkin flower; squash blossom on vine
image.alt.en: An open yellow flower on a vine
image.alt.vi: Bông hoa vàng đã nở trên dây

#### item tray_bud
label.en: Pumpkin bud
label.vi: Nụ hoa bí
group: tray_buds
image.brief: [ảnh] Một nụ hoa bí vàng còn khép chặt, nhọn đầu, trên dây bí có lá to xung quanh, chụp gần; không tay, không chữ. Cùng cây hoặc cùng kiểu chụp với `tray_pumpkin_flower`, `q4_pumpkin` (ba thẻ vuông câu q4). Hình gốc của cả chủ đề (bài 5 câu w1 dùng lại). Từ khoá tìm ảnh (EN): pumpkin flower bud; squash flower bud closed
image.alt.en: Closed yellow petals on a vine
image.alt.vi: Cánh vàng còn khép trên dây bí
> `alt` cố ý không có chữ "bud" · "nụ" (ảnh là đáp án câu q3 "Which one is a bud?").

#### item tray_mango
label.en: Green mango
label.vi: Quả xoài xanh
group: tray_fruits
image.brief: Dùng lại hình `tray_green_mango` ở bài `co-the-cua-em/nem-va-so`. Từ khoá tìm ảnh (EN): green mango whole unripe
image.alt.en: A green mango
image.alt.vi: Quả xoài xanh

#### item tray_marble
label.en: Glass marbles
label.vi: Bi thuỷ tinh
group: tray_not_plant
image.brief: Dùng lại hình `tray_marble` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): glass marbles close up
image.alt.en: Glass marbles
image.alt.vi: Những viên bi thuỷ tinh

#### item tray_portulaca
label.en: Ten o'clock flowers
label.vi: Hoa mười giờ
group: tray_flowers
image.brief: Dùng lại hình `explore_look`. Từ khoá tìm ảnh (EN): Portulaca grandiflora
image.alt.en: Bright flowers with thick leaves
image.alt.vi: Hoa tươi màu có lá mọng

#### item tray_pumpkin
label.en: Young pumpkin
label.vi: Quả bí non
group: tray_fruits
image.brief: Dùng lại hình `q4_pumpkin`. Từ khoá tìm ảnh (EN): young pumpkin on vine
image.alt.en: A small pumpkin on the vine
image.alt.vi: Quả bí non trên dây

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q3, q5; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ).
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính. Câu nào cũng tự đủ nghĩa khi chỉ nghe.

### q1
id: 017a25d0-2e8f-4410-a4bb-29778926d28f
format: single_choice
version: 1
dok: 1
prompt.en: Which one is a flower?
prompt.vi: Cái nào là bông hoa?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for bright colours.
hint.vi: Em tìm màu sắc tươi nhé.
explanation_correct.en: Yes! Ten o'clock flowers open in the sun.
explanation_correct.vi: Đúng rồi! Hoa mười giờ nở khi có nắng.
explanation_wrong.en: The answer is the ten o'clock flower. It is bright.
explanation_wrong.vi: Đáp án là hoa mười giờ. Hoa có màu tươi.
> DOK 1: nhận ra hoa giữa ba bộ phận cây. Lựa chọn sai là lá và rễ bé đã gặp ở bài 3.

#### option q1_roots
correct: false
feedback.en: Roots grow at the bottom of a tree.
feedback.vi: Rễ mọc ở gốc cây.
label.en: roots
label.vi: rễ cây
image.brief: Dùng lại hình `explore_roots` ở bài `cay-quanh-em/cay-to-re-than-canh-la`. Từ khoá tìm ảnh (EN): tree roots exposed
image.alt.en: Big roots at the bottom of a tree
image.alt.vi: Rễ to ở gốc cây

#### option q1_flower
correct: true
label.en: ten o'clock flowers
label.vi: hoa mười giờ
image.brief: Dùng lại hình `explore_look`. Từ khoá tìm ảnh (EN): Portulaca grandiflora
image.alt.en: Bright pink petals
image.alt.vi: Những cánh hoa hồng tươi
> `alt` riêng ở chỗ này (`alt` gốc có chữ "flowers" của câu hỏi). Ảnh, key, `brief` giữ như hình gốc.
> Sửa 18/11 (SK-051 quyết định 15): ảnh đã chọn là hoa kép màu hồng, không có màu cam; `alt` bỏ "orange"; `explanation_wrong.vi` bỏ "nhiều màu" cho khớp EN "It is bright." và ảnh.

#### option q1_leaves
correct: false
feedback.en: These are green leaves on a branch.
feedback.vi: Đây là lá xanh trên cành cây.
label.en: leaves
label.vi: lá cây
image.brief: Dùng lại hình `explore_alive` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa green leaves branch
image.alt.en: Green leaves on a branch
image.alt.vi: Lá xanh trên cành cây

### q2
id: 3f113bdc-ca94-446c-bff8-c57052dcae81
format: true_false
version: 1
dok: 1
prompt.en: A stem holds up the flowers.
prompt.vi: Thân cây đỡ những bông hoa.
image.brief: Dùng lại hình `explore_stem`. Từ khoá tìm ảnh (EN): zinnia plant stem
image.alt.en: A green stem with a flower
image.alt.vi: Thân xanh mang bông hoa
answer: true
hint.en: Look under the flower.
hint.vi: Em nhìn phía dưới bông hoa nhé.
explanation_correct.en: Yes! It holds up the leaves, too.
explanation_correct.vi: Đúng rồi! Thân đỡ cả lá nữa.
explanation_wrong.en: This is true. The stem holds the flower up.
explanation_wrong.vi: Câu này đúng. Thân đỡ bông hoa.
feedback_false.en: This green stem holds the flower high.
feedback_false.vi: Thân xanh này đỡ bông hoa lên cao.
> DOK 1: nhớ lại câu chính ô Stem, nhìn ảnh. Hình là thân mang hoa (vật được nói tới).

### q3
id: f117d247-0565-4474-ac92-c15d60d868d2
format: single_choice
version: 1
dok: 1
prompt.en: Which one is a bud?
prompt.vi: Cái nào là nụ hoa?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look at the petals.
hint.vi: Em nhìn các cánh hoa nhé.
explanation_correct.en: Yes! Soon it will open into a flower.
explanation_correct.vi: Đúng rồi! Nụ sắp nở thành hoa.
explanation_wrong.en: The answer is the closed bud. It opens later.
explanation_wrong.vi: Đáp án là nụ hoa còn khép. Nụ sẽ nở sau.
> DOK 1: nhớ lại ví dụ một ô Bud, flower, fruit. Ba lựa chọn khác nhau rõ: búp vàng còn khép, hoa đã nở nhiều màu, quả xoài xanh. Không dùng hoa bí đã nở làm lựa chọn sai (để câu q4 xếp ba ảnh bí là tình huống mới).

#### option q3_flower
correct: false
feedback.en: These flowers are already open.
feedback.vi: Những bông hoa này đã nở.
label.en: ten o'clock flowers
label.vi: hoa mười giờ
image.brief: Dùng lại hình `explore_look`. Từ khoá tìm ảnh (EN): Portulaca grandiflora
image.alt.en: Bright flowers with thick leaves
image.alt.vi: Hoa tươi màu có lá mọng

#### option q3_mango
correct: false
feedback.en: A green mango is a fruit.
feedback.vi: Xoài xanh là quả.
label.en: green mango
label.vi: quả xoài xanh
image.brief: Dùng lại hình `tray_green_mango` ở bài `co-the-cua-em/nem-va-so`. Từ khoá tìm ảnh (EN): green mango whole unripe
image.alt.en: A green mango
image.alt.vi: Quả xoài xanh

#### option q3_bud
correct: true
label.en: pumpkin bud
label.vi: nụ hoa bí
image.brief: Dùng lại hình `tray_bud`. Từ khoá tìm ảnh (EN): pumpkin flower bud
image.alt.en: Closed yellow petals on a vine
image.alt.vi: Cánh vàng còn khép trên dây bí

### q4
id: d162acad-d5ee-4a68-a3b5-98a293bcdbfd
format: order_sequence
version: 1
dok: 2
prompt.en: Start with the bud. Put them in order.
prompt.vi: Bắt đầu từ nụ. Em xếp theo thứ tự nhé.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_bud, q4_flower, q4_pumpkin
hint.en: Think of how a flower changes.
hint.vi: Em nghĩ xem bông hoa đổi thế nào nhé.
explanation_correct.en: Yes! Seeds will grow inside the pumpkin.
explanation_correct.vi: Đúng rồi! Trong quả bí sẽ có hạt.
explanation_wrong.en: The order is bud, flower, then pumpkin.
explanation_wrong.vi: Thứ tự là nụ, hoa, rồi quả bí.
> DOK 2: áp ý chính ba (học trên cây ớt) vào cây bí, xếp ba ảnh theo thời gian (SK-051 "nụ → hoa → quả"). Đúng một thứ tự. `prompt` nêu thẻ đầu; gợi ý là cách nghĩ, không gọi tên ba thẻ. Thẻ trong file không theo thứ tự đúng.
> Ba thẻ cùng cây bí, cùng kiểu chụp gần, khung vuông.

#### item q4_flower
label.en: pumpkin flower
label.vi: hoa bí
image.brief: Dùng lại hình `tray_pumpkin_flower`. Từ khoá tìm ảnh (EN): pumpkin flower
image.alt.en: An open yellow flower on a vine
image.alt.vi: Bông hoa vàng đã nở trên dây

#### item q4_pumpkin
label.en: young pumpkin
label.vi: quả bí non
image.brief: [ảnh] Một quả bí non xanh trên dây bí, đầu quả có thể còn dính cánh hoa héo, chụp gần, lá bí xung quanh; không tay, không chữ. Cùng kiểu chụp với `tray_bud`, `tray_pumpkin_flower` (ba thẻ vuông). Hình gốc của cả chủ đề (món Chơi, bài 5 câu w1). Từ khoá tìm ảnh (EN): young pumpkin on vine; baby pumpkin with flower
image.alt.en: A small pumpkin on the vine
image.alt.vi: Quả bí non trên dây

#### item q4_bud
label.en: pumpkin bud
label.vi: nụ hoa bí
image.brief: Dùng lại hình `tray_bud`. Từ khoá tìm ảnh (EN): pumpkin flower bud
image.alt.en: Closed yellow petals on a vine
image.alt.vi: Cánh vàng còn khép trên dây bí

### q5
id: 5dfc5ab0-e7ae-448f-956b-5540af1c8111
format: single_choice
version: 1
dok: 2
prompt.en: A mango grows from which part?
prompt.vi: Quả xoài mọc ra từ bộ phận nào?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of the chilli plant.
hint.vi: Em nghĩ tới cây ớt nhé.
explanation_correct.en: Yes! Mango flowers turn into mangoes.
explanation_correct.vi: Đúng rồi! Hoa xoài dần thành quả xoài.
explanation_wrong.en: The answer is the flower. Fruit grows from flowers.
explanation_wrong.vi: Đáp án là hoa. Quả mọc ra từ hoa.
> DOK 2: áp ý "hoa thành quả" (ô Bud, flower, fruit, học trên cây ớt) vào một cây khác (xoài). Lựa chọn là ảnh ba bộ phận (hoa, rễ, lá); nhãn gọi tên bộ phận. Gợi ý trỏ tới cảnh đã học, không tả đáp án.
> [CẦN KIỂM] Quả xoài mọc ra từ hoa xoài.

#### option q5_leaf
correct: false
feedback.en: Leaves grow, but they do not become fruit.
feedback.vi: Lá lớn lên, nhưng không thành quả.
label.en: leaf
label.vi: lá cây
image.brief: Dùng lại hình `explore_alive` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa green leaves branch
image.alt.en: Green leaves on a branch
image.alt.vi: Lá xanh trên cành cây

#### option q5_flower
correct: true
label.en: flower
label.vi: bông hoa
image.brief: Dùng lại hình `tray_pumpkin_flower`. Từ khoá tìm ảnh (EN): pumpkin flower
image.alt.en: An open yellow flower on a vine
image.alt.vi: Bông hoa vàng đã nở trên dây

#### option q5_root
correct: false
feedback.en: Roots stay under the ground.
feedback.vi: Rễ nằm dưới mặt đất.
label.en: roots
label.vi: rễ cây
image.brief: Dùng lại hình `explore_roots` ở bài `cay-quanh-em/cay-to-re-than-canh-la`. Từ khoá tìm ảnh (EN): tree roots exposed
image.alt.en: Big roots at the bottom of a tree
image.alt.vi: Rễ to ở gốc cây

### q6
id: 315bb483-22ac-4b19-a326-47dfaa200c69
format: true_false
version: 1
dok: 2
misconception: plant_same_all_year
prompt.en: A plant looks the same all year.
prompt.vi: Cây lúc nào trông cũng như nhau.
image.brief: Dùng lại hình `explore_parts`.
image.alt.en: A flowering plant with its roots
image.alt.vi: Cây có hoa còn nguyên rễ
answer: false
hint.en: Think of the pumpkin vine.
hint.vi: Em nghĩ tới dây bí nhé.
explanation_correct.en: A plant has buds, then flowers, then fruit.
explanation_correct.vi: Cây có nụ, rồi ra hoa, rồi kết quả.
explanation_wrong.en: This is false. A plant changes over time.
explanation_wrong.vi: Câu này sai. Cây đổi dần theo thời gian.
feedback_true.en: A bud opens and changes into a flower.
feedback_true.vi: Nụ nở ra và đổi thành hoa.
> Câu misconception (`plant_same_all_year`), DOK 2: bé chỉ thấy cây ở một lúc dễ nghĩ cây luôn như thế và chạm Đúng. Bé áp ý chính ba và câu q4 để bác câu nói. Câu chỉ kiểm một việc: cây có đổi theo thời gian không.
> Hình là một cây có hoa (vật được nói tới), không phải chuỗi nụ, hoa, quả. `explanation_correct` là đúng câu `correction` ở `_topic.md`.

## Từ vựng

### stem
id: 1ec1097c-c2b0-4f82-a491-711de84b5c3d
tier: core
term.en: stem
term.vi: thân
example.en: The stem is green and thin.
example.vi: Thân cây xanh và mảnh.
image.brief: Dùng lại hình `explore_stem`. Từ khoá tìm ảnh (EN): zinnia plant stem
image.alt.en: A green stem with a flower
image.alt.vi: Thân xanh mang bông hoa

### flower
id: 659719f2-42d5-41f3-ad4f-c434fafad659
tier: core
term.en: flower
term.vi: bông hoa
example.en: A flower grows at the top.
example.vi: Bông hoa mọc ở phía trên.
image.brief: Dùng lại hình `explore_look`. Từ khoá tìm ảnh (EN): Portulaca grandiflora
image.alt.en: Bright flowers with thick leaves
image.alt.vi: Hoa tươi màu có lá mọng
> Trùng có chủ ý với từ `extra` `flower` của *Thời tiết và các mùa* bài 2 (`thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`); ở bài này nâng lên `core` (bộ phận chính của cây có hoa).

### bud
id: 21e8d566-f9ad-42ef-babb-2b471d6ed4e4
tier: extra
term.en: bud
term.vi: nụ hoa
example.en: This bud will open soon.
example.vi: Nụ này sắp nở.
image.brief: Dùng lại hình `tray_bud`. Từ khoá tìm ảnh (EN): pumpkin flower bud
image.alt.en: Closed yellow petals on a vine
image.alt.vi: Cánh vàng còn khép trên dây bí

### flowering_plant
id: f856d974-decf-4517-a731-196f83ebfa29
tier: extra
term.en: flowering plant
term.vi: cây có hoa
example.en: A chilli is a flowering plant.
example.vi: Cây ớt là cây có hoa.
image.brief: Dùng lại hình `explore_parts`.
image.alt.en: A flowering plant with its roots
image.alt.vi: Cây có hoa còn nguyên rễ
> Thay từ `fruit` ticket gợi ý cho bài này: `fruit` là từ `core` của bài 5 (một từ một lần trong chủ đề). [CẦN KIỂM] tên EN "flowering plant" với trẻ.

## Thưởng

### portulaca_card
id: 617bd2e4-1036-41d7-965c-9450b4489f74
set: plants
rarity: common
name.en: Ten o'clock flower
name.vi: Hoa mười giờ
tag.en: Opens in the morning sun
tag.vi: Nở khi nắng lên
fact.en: It opens wide when the Sun is bright.
fact.vi: Trời nắng to, hoa mười giờ nở xoè.
image.brief: Dùng lại hình `explore_look`. Từ khoá tìm ảnh (EN): Portulaca grandiflora
image.alt.en: Bright flowers with thick leaves
image.alt.vi: Hoa tươi màu có lá mọng
> [CẦN KIỂM] Hoa mười giờ nở khi nắng lên (khoảng giữa buổi sáng), khép lại khi chiều; tên EN "ten o'clock flower".

## Ghi chú cho hoạ sĩ

- **Loại hình:** ảnh chụp thật, trừ `explore_parts` là hình vẽ (mục `own` `flowering-plant-roots.jpg`, `changes: ["drawn"]`, credit "Science Kids"; dùng ở ô Học, q6, từ `flowering_plant`, mỗi chỗ một hình đứng riêng). Kệ Chơi và mọi câu có lựa chọn là ảnh chụp. Không tay người, không chậu có chữ.
- **Hình vẽ, hình gốc của cả chủ đề:** cây có hoa còn nguyên rễ (`explore_parts`, đã vẽ).
- **Ảnh mới, hình gốc của cả chủ đề (giữ đúng key, `alt`, truy vấn đầu ở `_topic.md`):** hoa mười giờ (`explore_look`), nụ hoa bí (`tray_bud`), hoa bí đã nở (`tray_pumpkin_flower`), quả bí non (`q4_pumpkin`).
- **Ảnh mới chỉ dùng ở bài này:** cây hoa có thân xanh rõ (`explore_stem`), cây ớt có hoa và quả (`explore_changes`).
- **Ảnh dùng lại:** bài 3 `explore_tree_trunk` (w1), `explore_roots` (q1, q5); *Sinh vật sống ở đâu?* bài 2 `explore_sensitive` (w2), bài 3 `explore_alive` (w1, q1, q5), `tray_marble` (món Chơi); *Cơ thể của em* bài 6 `tray_green_mango` (món Chơi, q3); *Gọi tên và nhóm động vật* bài 3 `explore_eggs` (món Chơi), bài 1 `w1` (hàng rào tre).
- **`alt` riêng:** q1 `q1_flower` dùng `explore_look` với `alt` "Bright pink petals" · "Những cánh hoa hồng tươi".
- **Ảnh khó:** ba thẻ q4 cùng cây bí (nụ khép, hoa nở, quả non), cùng kiểu chụp, khung vuông; cây ớt cùng lúc có hoa và quả.
- **Màu:** Học: bốn bộ phận `gi_dong`, thân `vang_hoe`, nhìn kỹ `cham`, nụ hoa quả `nau_dat`. Chơi: nụ `cham`, hoa `vang_hoe`, quả `gi_dong`, không phải từ cây `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (stem, flower). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Sai). Quiz `single_choice` (q1, q3, q5; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`plant_same_all_year`). Không có `labels` ở câu `true_false`.
- **`order_sequence` q4:** thứ tự đúng `q4_bud`, `q4_flower`, `q4_pumpkin`.
- **Màn Chơi, ví dụ để kiểm:** Nụ hoa bí, Hoa bí, Quả bí non → `balanced`; Nụ hoa bí, Hoa mười giờ, Quả xoài xanh → `balanced`; Hoa bí, Hoa mười giờ, Quả bí non → `missing.tray_buds`; Nụ hoa bí, Hoa bí, Trứng → `has_limited`.
- **Khởi động trỏ:** w1 → `cay-quanh-em/cay-to-re-than-canh-la` (bài 3 phải có id trước), w2 → `sinh-vat-song-o-dau/vat-song-nao-cung-cu-dong` (đã có id).
- **Từ EN có thể ngoài Starters/Movers:** stem, bud, flowering plant, hand lens, hollow, water spinach, chilli, pumpkin, vine, petals, sensitive plant, ten o'clock flower.
