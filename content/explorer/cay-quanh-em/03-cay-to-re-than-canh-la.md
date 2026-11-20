---
id: cabbfa16-cfc0-4755-ae13-5a1841e78145
topic: cay-quanh-em
slug: cay-to-re-than-canh-la
order: 3
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Parts of a tree
vi: Cây to: rễ, thân, cành, lá
> Giữ đúng tên ở `content/syllabus.json` (key `identifying-plants-and-their-basic-parts`, bài số ba). Tên VI có dấu hai chấm: nghe thử giọng VI đọc tên bài.

## Mục tiêu
en: I can name the parts of a tree.
vi: Em gọi tên được các bộ phận của cây to.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 18/11/2026. Ticket SK-051. Mọi dòng `id:` để trống; chạy `ids` sau bài 2 (câu w1 trỏ bài 2).
> Sườn: Oak Y1 L2 `structure-of-a-tree` (`docs/oak/identifying-plants-and-their-basic-parts.md`). Bỏ phần in vỏ cây bằng bút sáp và đi xem cây ngoài trời; thay bằng ảnh. Câu "hình cây thiếu rễ, chọn phần thiếu" của sườn không làm được vì app ẩn hình câu hỏi khi mọi lựa chọn có hình (SK-043); thay bằng câu q1 và câu q4 (`_topic.md` mục Lệch).
> Sửa `trees_not_plants` ở ý chính một, ô Học A tree is a plant và câu q6 (gắn key).
> Hình chính là cây bàng, không phải cây đa (rễ phụ thòng xuống dễ làm bé nghĩ rễ không ở dưới đất). Không gọi cây chuối là cây to.

## Ý chính
1.en: A tree is a plant, too.
1.vi: Cây to cũng là thực vật.
2.en: Roots hide under the ground.
2.vi: Rễ cây nằm dưới đất.
3.en: The trunk holds up the branches and leaves.
3.vi: Thân cây đỡ cành và lá.
> Từ ý xếp nhóm (cây to là thực vật) xuống từng bộ phận, theo thứ tự từ dưới lên: rễ, thân, cành và lá. Ý một đặt trước vì là misconception của bài.

## Khởi động

> Hai câu. w1 ôn bài 2 (bài trước): thiếu ánh sáng, lá vàng nhợt. w2 ôn *Sinh vật sống ở đâu?* bài 6 (mốc dài; ô On a tree trunk), nối sang chữ "thân cây" hôm nay.

### w1
id: bdb1663c-6ce7-4a0b-b06a-542c5dfbf4ad
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: cay-quanh-em/cay-can-gi-de-lon
prompt.en: Bean sprouts grow green in the dark.
prompt.vi: Giá đỗ ủ trong tối có màu xanh lá.
image.brief: Dùng lại hình `explore_dark` ở bài `cay-quanh-em/cay-can-gi-de-lon`. Từ khoá tìm ảnh (EN): bean sprouts
image.alt.en: A handful of bean sprouts
image.alt.vi: Một nắm giá đỗ
answer: false
hint.en: Look at the colour of the stems.
hint.vi: Em nhìn màu của thân giá nhé.
explanation_correct.en: With no light, bean sprouts stay pale.
explanation_correct.vi: Thiếu ánh sáng, giá đỗ có màu trắng nhợt.
explanation_wrong.en: This is false. They grow white and pale.
explanation_wrong.vi: Câu này sai. Giá đỗ trắng và nhợt.
feedback_true.en: These stems are white, not green.
feedback_true.vi: Thân giá màu trắng, không có màu xanh.
> `alt` riêng ở chỗ này (`alt` gốc "White bean sprouts" nói sẵn đáp án). Ảnh, key, `brief` giữ như hình gốc.

### w2
id: f4581b29-7f17-4ba4-a0b4-29c1ee4eaa42
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/nhung-noi-song-nho-xiu
prompt.en: Ants can live on a tree trunk.
prompt.vi: Kiến có thể sống trên thân cây.
image.brief: Dùng lại hình `explore_trunk` ở bài `sinh-vat-song-o-dau/nhung-noi-song-nho-xiu`. Từ khoá tìm ảnh (EN): ants trail on tree bark
image.alt.en: Ants on a tree trunk
image.alt.vi: Kiến bò trên thân cây
answer: true
hint.en: Look closely at the bark.
hint.vi: Em nhìn kỹ vỏ cây nhé.
explanation_correct.en: Yes! Beetles hide under the bark, too.
explanation_correct.vi: Đúng rồi! Bọ cánh cứng cũng trốn dưới vỏ cây.
explanation_wrong.en: This is true. Ants walk up and down trunks.
explanation_wrong.vi: Câu này đúng. Kiến bò lên bò xuống thân cây.
feedback_false.en: A tree trunk is a home for ants.
feedback_false.vi: Thân cây là nơi sống của kiến.
> Câu viết lại câu chính ô `explore_trunk` của bài nguồn ("Ants walk up and down tree trunks."), không chép. `explanation_correct` dùng lại ý ví dụ hai ô đó.

## Học

> Bốn ô: cây to là thực vật (cây bàng cả cây), rễ, thân cây, cành và lá. Đi từ cả cây tới từng bộ phận, từ dưới lên.
> Ví dụ ba ô Roots là lời dặn rửa tay sau khi sờ đất (một lần trong chủ đề, SK-051). Ví dụ một ô Branches and leaves là câu duy nhất trong chủ đề về "lá làm thức ăn" (SK-051 cho phép một câu, không giải thích).

### explore
id: b8a12afa-d090-40e3-8fe4-a13ccec939f1
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_tree
label.en: A tree is a plant
label.vi: Cây to là thực vật
color: gi_dong
sentence.en: A tree is a plant, too.
sentence.vi: Cây to cũng là thực vật.
image.brief: [ảnh] Cả một cây bàng to đứng riêng ở sân trường, công viên hay ven đường, thấy gốc, thân, các cành toả ngang thành tầng và tán lá to; chụp từ xa vừa, trời sáng; không trẻ em nhìn rõ mặt, không biển, không chữ. Không dùng cây đa. Ảnh ngang (khung vuông ô Học, thẻ ba lựa chọn 5:2 câu q5, khung 4:3 câu q6, thẻ từ 2:1). Hình gốc của cả chủ đề (bài 6 câu w2 dùng lại). Từ khoá tìm ảnh (EN): Terminalia catappa tree; Indian almond tree whole; tropical almond tree
image.alt.en: An Indian almond tree
image.alt.vi: Cây bàng
examples.1.en: it is alive and it grows
examples.1.vi: cây sống và lớn lên
examples.2.en: Indian almond trees in the schoolyard
examples.2.vi: cây bàng ở sân trường
examples.3.en: it has roots, a trunk, branches and leaves
examples.3.vi: cây có rễ, thân, cành và lá
> Ô sửa `trees_not_plants`: câu chính là đúng câu `correction` ở `_topic.md`. Ví dụ ba giới thiệu bốn bộ phận của ba ô sau.
> [CẦN KIỂM] Cây bàng quen ở sân trường cả ba miền; cành bàng mọc ngang thành tầng.

#### group explore_roots
label.en: Roots
label.vi: Rễ
color: nau_dat
sentence.en: Roots hide under the ground.
sentence.vi: Rễ cây nằm dưới đất.
image.brief: [ảnh] Gốc một cây to có vài rễ to trồi lên mặt đất rồi chui xuống đất, toả ra quanh gốc; chụp thấp, thấy gốc thân và mặt đất; không phải cây đa có rễ phụ thòng từ cành, không người, không chữ. Ảnh ngang (khung vuông ô Học, món Chơi, thẻ `order_sequence`, thẻ ba lựa chọn 5:2). Hình gốc của cả chủ đề (bài 4 câu q5, bài 7 câu w2 dùng lại). Từ khoá tìm ảnh (EN): tree roots exposed; surface roots tree base; tree roots ground
image.alt.en: Big roots at the bottom of a tree
image.alt.vi: Rễ to ở gốc cây
examples.1.en: roots hold the tree up
examples.1.vi: rễ giữ cho cây đứng vững
examples.2.en: they spread out wide
examples.2.vi: rễ toả rộng ra xung quanh
examples.3.en: wash your hands after touching soil
examples.3.vi: sờ đất xong, em rửa tay nhé
> `alt` không có chữ "under", "ground" (ảnh là đáp án câu q1). Ảnh thấy một phần rễ trồi lên; câu chính vẫn nói rễ nằm dưới đất (phần lớn rễ). Không nói "rễ hút nước" (ranh giới SK-051).
> [CẦN KIỂM] Rễ giữ cây đứng vững và toả rộng dưới đất; phần lớn rễ cây to nằm dưới đất, đôi khi rễ to trồi lên ở gốc.

#### group explore_tree_trunk
label.en: Trunk
label.vi: Thân cây
color: vang_hoe
sentence.en: The trunk holds up the branches and leaves.
sentence.vi: Thân cây đỡ cành và lá.
image.brief: [ảnh] Một thân cây to, thẳng, vỏ sần sùi màu nâu xám, chụp từ gốc nhìn lên thấy các cành to toả ra ở phía trên; không người, không vật treo trên thân, không chữ khắc, không chữ. Ảnh vuông hoặc ngang (khung vuông ô Học, món Chơi, thẻ `order_sequence`, thẻ ba lựa chọn 5:2, thẻ từ 2:1). Hình gốc của cả chủ đề (bài 4 câu w1 dùng lại). Từ khoá tìm ảnh (EN): tree trunk bark; thick tree trunk looking up; tree trunk branches
image.alt.en: A thick tree trunk
image.alt.vi: Thân cây to
examples.1.en: bark covers the trunk
examples.1.vi: vỏ cây bọc quanh thân
examples.2.en: a trunk is thick and strong
examples.2.vi: thân cây to và chắc
examples.3.en: branches grow out from the trunk
examples.3.vi: cành mọc ra từ thân cây
> Ví dụ một dạy trước câu q2, ví dụ ba dạy trước câu q3. "Trunk" ở bài này là thân cây (key từ vựng `tree_trunk`); vòi voi đã là từ `trunk` ở *Gọi tên và nhóm động vật* bài 5.

#### group explore_branches
label.en: Branches and leaves
label.vi: Cành và lá
color: cham
sentence.en: Branches hold leaves, flowers and fruit.
sentence.vi: Cành cây mang lá, hoa và quả.
image.brief: Dùng lại hình `mango_card` ở bài `thoi-tiet-va-cac-mua/mua-mua-va-mua-kho`. Từ khoá tìm ảnh (EN): mango tree fruit
image.alt.en: Mangoes on a tree
image.alt.vi: Những quả xoài trên cây
examples.1.en: leaves help the tree make food
examples.1.vi: lá giúp cây làm ra thức ăn
examples.2.en: leaves make cool shade
examples.2.vi: lá che bóng mát
examples.3.en: birds build nests in branches
examples.3.vi: chim làm tổ trên cành cây
> Ảnh chùm xoài trên cành, lá dài quanh chùm (hình của #5 bài 4): thấy cành mang lá và quả. Ví dụ một là câu "lá làm thức ăn" duy nhất của chủ đề, không giải thích, không nói "quang hợp" (ranh giới SK-051).
> [CẦN KIỂM] Cành mang lá, hoa, quả; "lá giúp cây làm ra thức ăn" là cách nói chấp nhận được với trẻ năm tới bảy tuổi.

### new_words
id: 9782f49a-e944-4c7a-b0c1-b2272874440d
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: tree, tree_trunk, branch

## Chơi

> Bé tìm ba bộ phận của cây to: rễ, thân cây (thân cây to hoặc vỏ cây), lá (lá bàng xanh hoặc lá bàng đỏ). Đạt khi đủ ba nhóm và không chọn con vật.
> Món bẫy: chim sẻ, con ve: hay gặp trên cây nhưng không phải bộ phận của cây. Kệ bảy món, toàn ảnh chụp. Ảnh con ve có vỏ cây làm nền: nhãn món là "Cicada" · "Con ve", con ve to rõ giữa khung.

### tray
id: 8749887f-df1e-4427-b2c3-9158708161da
type: build_tray
version: 1
prompt.en: Find the roots, trunk and leaves
prompt.vi: Tìm rễ, thân cây và lá
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Go from the ground up the tree.
messages.start.vi: Em tìm từ dưới đất lên ngọn cây nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! You found three parts of a tree.
messages.balanced.vi: Tuyệt! Em đã tìm được ba bộ phận của cây.
messages.has_limited.en: That animal just visits the tree.
messages.has_limited.vi: Con vật này chỉ đến chơi trên cây thôi.
messages.missing.tray_root.en: You still need the roots.
messages.missing.tray_root.vi: Em còn thiếu rễ cây.
messages.missing.tray_trunk.en: You still need the trunk.
messages.missing.tray_trunk.vi: Em còn thiếu thân cây.
messages.missing.tray_leaves.en: You still need some leaves.
messages.missing.tray_leaves.vi: Em còn thiếu lá cây.
> Lời nhắn `has_limited` đúng với cả hai món bẫy.

#### group tray_root
label.en: Roots
label.vi: Rễ
color: nau_dat
role: required

#### group tray_trunk
label.en: Trunk
label.vi: Thân cây
color: vang_hoe
role: required

#### group tray_leaves
label.en: Leaves
label.vi: Lá
color: gi_dong
role: required

#### group tray_visitors
label.en: Animals on trees
label.vi: Con vật trên cây
color: do_son
role: limit

#### item tray_bark
label.en: Bark
label.vi: Vỏ cây
group: tray_trunk
image.brief: [ảnh] Cận cảnh vỏ một thân cây to, sần sùi, nứt thành từng mảng, kín khung, không thấy lá; không rêu phủ kín, không kiến hay côn trùng, không chữ khắc, không chữ. Ảnh vuông (món Chơi, khung 4:3 câu q2, thẻ từ 2:1). Từ khoá tìm ảnh (EN): tree bark close-up; rough tree bark texture
image.alt.en: Rough tree bark
image.alt.vi: Vỏ cây sần sùi

#### item tray_sparrow
label.en: Sparrow
label.vi: Chim sẻ
group: tray_visitors
image.brief: Dùng lại hình `tray_sparrow` ở bài `goi-ten-va-nhom-dong-vat/chim-va-bo-sat`. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow on a branch
image.alt.vi: Chim sẻ đậu trên cành

#### item tray_roots
label.en: Big roots
label.vi: Rễ to ở gốc
group: tray_root
image.brief: Dùng lại hình `explore_roots`. Từ khoá tìm ảnh (EN): tree roots exposed
image.alt.en: Big roots at the bottom of a tree
image.alt.vi: Rễ to ở gốc cây

#### item tray_red_leaves
label.en: Red leaves
label.vi: Lá bàng đỏ
group: tray_leaves
image.brief: Dùng lại hình `almond_card` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa red leaves
image.alt.en: Red leaves on an Indian almond tree
image.alt.vi: Lá bàng chuyển màu đỏ

#### item tray_big_trunk
label.en: Thick trunk
label.vi: Thân cây to
group: tray_trunk
image.brief: Dùng lại hình `explore_tree_trunk`. Từ khoá tìm ảnh (EN): tree trunk bark
image.alt.en: A thick tree trunk
image.alt.vi: Thân cây to

#### item tray_cicada
label.en: Cicada
label.vi: Con ve
group: tray_visitors
image.brief: Dùng lại hình `tray_cicada` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): cicada tree bark
image.alt.en: A cicada on tree bark
image.alt.vi: Con ve trên thân cây

#### item tray_green_leaves
label.en: Green leaves
label.vi: Lá bàng xanh
group: tray_leaves
image.brief: Dùng lại hình `explore_alive` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa green leaves branch
image.alt.en: Green leaves on a branch
image.alt.vi: Lá xanh trên cành cây

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2 Đúng, q3 Sai, q6 Sai), `order_sequence` (q4, ba thẻ).
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính. Câu nào cũng tự đủ nghĩa khi chỉ nghe.

### q1
id: 3527c27b-54a9-4e48-aacc-4dc28eefc0c5
format: single_choice
version: 1
dok: 1
prompt.en: Which part is under the ground?
prompt.vi: Bộ phận nào nằm dưới đất?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of digging in the soil.
hint.vi: Em nghĩ tới lúc đào đất nhé.
explanation_correct.en: Yes! Roots spread out under the soil.
explanation_correct.vi: Đúng rồi! Rễ toả rộng dưới đất.
explanation_wrong.en: The answer is the roots. They hide underground.
explanation_wrong.vi: Đáp án là rễ. Rễ nằm dưới đất.
> DOK 1: nhớ lại ý chính hai. Thay câu "hình cây thiếu rễ" của sườn (không làm được vì app ẩn hình câu hỏi). Ba lựa chọn là ba bộ phận của cây, khác nhau rõ bằng mắt.

#### option q1_leaves
correct: false
feedback.en: Leaves grow up on the branches.
feedback.vi: Lá mọc trên cành cây.
label.en: leaves
label.vi: lá cây
image.brief: Dùng lại hình `explore_alive` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa green leaves branch
image.alt.en: Green leaves on a branch
image.alt.vi: Lá xanh trên cành cây

#### option q1_roots
correct: true
label.en: roots
label.vi: rễ cây
image.brief: Dùng lại hình `explore_roots`. Từ khoá tìm ảnh (EN): tree roots exposed
image.alt.en: Big roots at the bottom of a tree
image.alt.vi: Rễ to ở gốc cây

#### option q1_trunk
correct: false
feedback.en: The trunk stands up above the ground.
feedback.vi: Thân cây đứng trên mặt đất.
label.en: trunk
label.vi: thân cây
image.brief: Dùng lại hình `explore_tree_trunk`. Từ khoá tìm ảnh (EN): tree trunk bark
image.alt.en: A thick tree trunk
image.alt.vi: Thân cây to

### q2
id: 466c2b4a-b5f7-418e-b695-35230288e84f
format: true_false
version: 1
dok: 1
prompt.en: Bark covers a tree trunk.
prompt.vi: Vỏ cây bọc quanh thân cây.
image.brief: Dùng lại hình `tray_bark`. Từ khoá tìm ảnh (EN): tree bark close-up
image.alt.en: Rough tree bark
image.alt.vi: Vỏ cây sần sùi
answer: true
hint.en: Look at the rough brown outside.
hint.vi: Em nhìn lớp ngoài sần sùi màu nâu nhé.
explanation_correct.en: Yes! Bark keeps the trunk safe.
explanation_correct.vi: Đúng rồi! Vỏ cây bảo vệ thân cây.
explanation_wrong.en: This is true. Bark is the trunk's outside.
explanation_wrong.vi: Câu này đúng. Vỏ cây là lớp ngoài của thân.
feedback_false.en: This rough bark wraps the trunk.
feedback_false.vi: Lớp vỏ sần sùi này bọc quanh thân cây.
> DOK 1: nhớ lại ví dụ một ô Trunk. Hình là vỏ cây (vật được nói tới).
> [CẦN KIỂM] Vỏ cây bảo vệ thân cây (từ khoá `trunk` của sườn).

### q3
id: 6896a830-4bc5-4073-a64c-fa5a397e07bc
format: true_false
version: 1
dok: 1
prompt.en: Branches grow out of the roots.
prompt.vi: Cành cây mọc ra từ rễ.
image.brief: Dùng lại hình `mango_card` ở bài `thoi-tiet-va-cac-mua/mua-mua-va-mua-kho`. Từ khoá tìm ảnh (EN): mango tree fruit
image.alt.en: Mangoes on a tree
image.alt.vi: Những quả xoài trên cây
answer: false
hint.en: Think of the tree, from roots to top.
hint.vi: Em nghĩ cây từ gốc lên ngọn nhé.
explanation_correct.en: Branches grow out from the trunk.
explanation_correct.vi: Cành cây mọc ra từ thân cây.
explanation_wrong.en: This is false. Branches grow from the trunk.
explanation_wrong.vi: Câu này sai. Cành mọc ra từ thân.
feedback_true.en: Roots stay under the ground.
feedback_true.vi: Rễ nằm dưới mặt đất.
> DOK 1: nhớ lại ví dụ ba ô Trunk. Hình là cành mang quả (vật được nói tới), không thấy gốc nên không tự làm bằng chứng.

### q4
id: d6e1b9a1-e430-4a6c-b4d4-76231bcc5ae0
format: order_sequence
version: 1
dok: 2
prompt.en: Start at the ground. Go up the tree.
prompt.vi: Bắt đầu từ dưới đất. Em xếp dần lên ngọn cây nhé.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_roots, q4_trunk, q4_leaves
hint.en: Leaves are up high, in the sun.
hint.vi: Lá ở trên cao, đón nắng.
explanation_correct.en: Yes! The trunk joins the roots and leaves.
explanation_correct.vi: Đúng rồi! Thân cây nối rễ với lá.
explanation_wrong.en: The order is roots, trunk, then leaves.
explanation_wrong.vi: Thứ tự là rễ, thân, rồi lá.
> DOK 2: xếp ba bộ phận theo chỗ trên cây, từ dưới lên (SK-051). Đúng một thứ tự. `prompt` nêu đầu dưới; gợi ý chỉ nhắc đầu trên (Lỗi hay gặp số mười ba). Thẻ trong file không theo thứ tự đúng.
> Ba thẻ cùng kiểu ảnh thật, khung vuông; cắt sao cho mỗi thẻ chỉ thấy rõ một bộ phận.

#### item q4_trunk
label.en: trunk
label.vi: thân cây
image.brief: Dùng lại hình `explore_tree_trunk`. Từ khoá tìm ảnh (EN): tree trunk bark
image.alt.en: A thick tree trunk
image.alt.vi: Thân cây to

#### item q4_leaves
label.en: leaves
label.vi: lá cây
image.brief: Dùng lại hình `explore_alive` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa green leaves branch
image.alt.en: Green leaves on a branch
image.alt.vi: Lá xanh trên cành cây

#### item q4_roots
label.en: roots
label.vi: rễ cây
image.brief: Dùng lại hình `explore_roots`. Từ khoá tìm ảnh (EN): tree roots exposed
image.alt.en: Big roots at the bottom of a tree
image.alt.vi: Rễ to ở gốc cây

### q5
id: fa7d2681-2aa8-41cc-b6ba-31911c5d9097
format: single_choice
version: 1
dok: 2
prompt.en: Which plant has a big, strong trunk?
prompt.vi: Cây nào có thân to và chắc?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for rough bark.
hint.vi: Em tìm cây có vỏ sần sùi nhé.
explanation_correct.en: Yes! An Indian almond tree is a big tree.
explanation_correct.vi: Đúng rồi! Cây bàng là cây to.
explanation_wrong.en: The answer is the Indian almond tree. It is big.
explanation_wrong.vi: Đáp án là cây bàng. Cây bàng rất to.
> DOK 2: so sánh ba cây theo thân (thân to, chắc, có vỏ; thân nhỏ, mềm), phân loại "cây to". Hai lựa chọn sai cũng là cây, để bé thấy cây to và cây nhỏ đều là cây.

#### option q5_young
correct: false
feedback.en: Young plants are small and soft.
feedback.vi: Cây non còn nhỏ và mềm.
label.en: young plants
label.vi: hàng rau non
image.brief: Dùng lại hình `explore_plants` ở bài `sinh-vat-song-o-dau/vat-song-hay-khong-song`. Từ khoá tìm ảnh (EN): young vegetable seedlings soil row
image.alt.en: Young plants in the soil
image.alt.vi: Cây non mọc trên đất

#### option q5_tree
correct: true
label.en: Indian almond tree
label.vi: cây bàng
image.brief: Dùng lại hình `explore_tree`. Từ khoá tìm ảnh (EN): Terminalia catappa tree
image.alt.en: An Indian almond tree
image.alt.vi: Cây bàng

#### option q5_lotus
correct: false
feedback.en: A lotus is soft, with no trunk.
feedback.vi: Cây sen mềm, không có thân to.
label.en: lotus
label.vi: hoa sen
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao

### q6
id: 4c70da92-413e-4c35-984c-f2e239383b66
format: true_false
version: 1
dok: 2
misconception: trees_not_plants
prompt.en: Trees and plants are two different things.
prompt.vi: Cây to và thực vật là hai thứ khác nhau.
image.brief: Dùng lại hình `explore_tree`. Từ khoá tìm ảnh (EN): Terminalia catappa tree
image.alt.en: An Indian almond tree
image.alt.vi: Cây bàng
answer: false
hint.en: Look at its roots, trunk and leaves.
hint.vi: Em nhìn rễ, thân và lá của cây nhé.
explanation_correct.en: A tree is a plant, too.
explanation_correct.vi: Cây to cũng là thực vật.
explanation_wrong.en: This is false. A tree is a plant.
explanation_wrong.vi: Câu này sai. Cây to là thực vật.
feedback_true.en: A tree has roots and leaves, like plants.
feedback_true.vi: Cây to cũng có rễ và lá như các cây khác.
> Câu misconception (`trees_not_plants`), DOK 2: bé nghĩ "cây to quá, khác cây cỏ, cây hoa" sẽ chạm Đúng. Bé áp ý chính một và các bộ phận vừa học để bác câu nói. Câu chỉ kiểm một việc: cây to có là thực vật không. Câu khẳng định, như câu q6 "People and animals are different groups." của *Cơ thể của em* bài 1.
> Hình là cây bàng (vật được nói tới). `explanation_correct` là đúng câu `correction` ở `_topic.md`.

## Từ vựng

### tree
id: de22d440-d3b1-498f-ba88-945f4c080e65
tier: core
term.en: tree
term.vi: cây to
example.en: A tree has a big, strong trunk.
example.vi: Cây to có thân to và chắc.
image.brief: Dùng lại hình `explore_tree`. Từ khoá tìm ảnh (EN): Terminalia catappa tree
image.alt.en: An Indian almond tree
image.alt.vi: Cây bàng

### tree_trunk
id: eabc9077-67fd-45fa-8c72-3f1183e49173
tier: core
term.en: trunk
term.vi: thân cây
example.en: Bark covers the tree trunk.
example.vi: Vỏ cây bọc quanh thân cây.
image.brief: Dùng lại hình `explore_tree_trunk`. Từ khoá tìm ảnh (EN): tree trunk bark
image.alt.en: A thick tree trunk
image.alt.vi: Thân cây to
> Key `tree_trunk` vì "trunk" đã là vòi voi (key `trunk`) ở *Gọi tên và nhóm động vật* bài 5 (`goi-ten-va-nhom-dong-vat/co-the-cac-con-vat`). Chữ "trunk" ở đây nghĩa là thân cây; câu ví dụ có chữ "tree" để rõ nghĩa. Tab Từ vựng của app chia bộ thẻ theo bài và nhận thẻ theo `id`, không gộp theo chữ (`WordDecks.swift`), nên hai thẻ "trunk" nằm ở hai bộ khác nhau.

### branch
id: a979b577-227e-4b10-8ee2-2db2907cf426
tier: core
term.en: branch
term.vi: cành cây
example.en: Mangoes hang from the branch.
example.vi: Xoài treo trên cành cây.
image.brief: Dùng lại hình `mango_card` ở bài `thoi-tiet-va-cac-mua/mua-mua-va-mua-kho`. Từ khoá tìm ảnh (EN): mango tree fruit
image.alt.en: Mangoes on a tree
image.alt.vi: Những quả xoài trên cây

### bark
id: 3e44abd8-0e1a-4ae5-9756-baf937497f50
tier: extra
term.en: bark
term.vi: vỏ cây
example.en: Bark is rough and hard.
example.vi: Vỏ cây sần sùi và cứng.
image.brief: Dùng lại hình `tray_bark`. Từ khoá tìm ảnh (EN): tree bark close-up
image.alt.en: Rough tree bark
image.alt.vi: Vỏ cây sần sùi
> "Bark" cũng là tiếng chó sủa; câu ví dụ nói rõ nghĩa vỏ cây.

## Thưởng

### kapok_card
id: 411dbd4a-41bc-4067-9f79-af8877c89da4
set: plants
rarity: rare
name.en: Kapok tree
name.vi: Cây gạo
tag.en: A tall tree by the village
tag.vi: Cây cao đầu làng
fact.en: Its red flowers bloom on bare branches.
fact.vi: Hoa gạo đỏ nở trên cành trơ lá.
image.brief: [ảnh] Một cây gạo cao đang nở hoa đỏ rực trên các cành trụi lá, nền trời xanh, chụp từ xa vừa thấy thân và cả tán; không người nhìn rõ mặt, không chữ. Loài phải là *Bombax ceiba* (không lẫn cây vông, cây phượng). Ảnh vuông được. Từ khoá tìm ảnh (EN): Bombax ceiba tree flowers; red silk cotton tree bloom
image.alt.en: Red flowers on a bare tree
image.alt.vi: Hoa đỏ trên cây trụi lá
> Thẻ hiếm: cây to quen ở làng quê miền Bắc, thấy rõ thân, cành; hoa nở khi cành chưa có lá (nối ý chính ba: cành mang hoa).
> [CẦN KIỂM] Cây gạo ra hoa đỏ khi cành trụi lá (khoảng tháng Ba ở miền Bắc); tên EN "kapok tree" (cũng gọi "red silk cotton tree"; "kapok" còn là tên cây gòn *Ceiba pentandra*: người chuyên môn chọn tên).

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Hình chính không phải cây đa. Không trẻ em nhìn rõ mặt ở sân trường.
- **Ảnh mới, hình gốc của cả chủ đề (giữ đúng key, `alt`, truy vấn đầu ở `_topic.md`):** cây bàng cả cây (`explore_tree`), rễ to ở gốc cây (`explore_roots`), thân cây to nhìn từ gốc lên (`explore_tree_trunk`).
- **Ảnh mới chỉ dùng ở bài này:** vỏ cây cận cảnh (`tray_bark`), cây gạo nở hoa (`kapok_card`).
- **Ảnh dùng lại:** bài 2 `explore_dark` (w1, `alt` riêng); *Sinh vật sống ở đâu?* bài 1 `explore_plants` (q5), bài 3 `explore_alive` (món Chơi, q1, q4), `almond_card` (món Chơi), bài 6 `explore_trunk` (w2); *Thời tiết và các mùa* bài 2 `tray_cicada` (món Chơi), bài 4 `mango_card` (ô Branches and leaves, q3, từ `branch`; cả ba chỗ trỏ thẳng về `mango_card`, sửa 18/11 theo rà chữ tester C1); *Gọi tên và nhóm động vật* bài 3 `tray_sparrow` (món Chơi; trỏ thẳng về ảnh gốc, không qua *Chuỗi thức ăn* bài 4, sửa 18/11 C1); *Gọi tên và nhóm động vật* bài 1 `w1` (hàng rào tre), `w1_lotus` (q5).
- **`alt` riêng:** w1 dùng `explore_dark` với `alt` "A handful of bean sprouts" · "Một nắm giá đỗ".
- **Ảnh khó:** rễ cây to trồi lên ở gốc mà không phải cây đa hay rễ phụ; ba thẻ q4 (rễ, thân, lá) cắt vuông, mỗi thẻ chỉ một bộ phận; cây gạo đúng loài.
- **Màu:** Học: cây to là thực vật `gi_dong`, rễ `nau_dat`, thân cây `vang_hoe`, cành và lá `cham`. Chơi: rễ `nau_dat`, thân cây `vang_hoe`, lá `gi_dong`, con vật trên cây `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (tree, tree_trunk, branch). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `true_false` (w1 Sai, w2 Đúng). Quiz `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2 Đúng, q3 Sai, q6 Sai), `order_sequence` (q4). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`trees_not_plants`). Không có `labels` ở câu `true_false`.
- **`order_sequence` q4:** thứ tự đúng `q4_roots`, `q4_trunk`, `q4_leaves`.
- **Màn Chơi, ví dụ để kiểm:** Rễ to ở gốc, Thân cây to, Lá bàng xanh → `balanced`; Rễ to ở gốc, Vỏ cây, Lá bàng đỏ → `balanced`; Thân cây to, Vỏ cây, Lá bàng xanh → `missing.tray_root`; Rễ to ở gốc, Thân cây to, Chim sẻ → `has_limited`. Nhãn món "Big roots", "Thick trunk" khác nhãn nhóm "Roots", "Trunk" (sửa 18/11 theo rà chữ tester N4).
- **Khởi động trỏ:** w1 → `cay-quanh-em/cay-can-gi-de-lon` (bài 2 phải có id trước), w2 → `sinh-vat-song-o-dau/nhung-noi-song-nho-xiu` (đã có id).
- **Từ vựng:** key `tree_trunk`, `term.en` "trunk". Không trùng key `trunk` của *Gọi tên và nhóm động vật* bài 5 (key chỉ cần duy nhất trong bài; đặt khác để dễ tra).
- **Từ EN có thể ngoài Starters/Movers:** trunk, branch, bark, roots, shade, nests, Indian almond, kapok, beetles, cicada, sparrow, bare, underground.
