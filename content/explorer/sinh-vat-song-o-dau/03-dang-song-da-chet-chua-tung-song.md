---
id: fb0322fc-35e0-4e21-a340-6936cd9e20a2
topic: sinh-vat-song-o-dau
slug: dang-song-da-chet-chua-tung-song
order: 3
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Alive, dead and never alive
vi: Đang sống, đã chết, chưa từng sống
> Giữ đúng tên ở `content/syllabus.json` (bài số ba).

## Mục tiêu
en: I can tell alive, dead and never alive.
vi: Em phân biệt được vật đang sống, đã chết và chưa từng sống.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 14/11/2026. Mọi dòng `id:` để trống; chạy `ids` sau bài hai.
> Sửa `non_living_means_dead` ở ô Học "Never alive", phần Chơi (món bẫy là vật chưa từng sống) và câu q6 (gắn key).
> **Nói về cái chết nhẹ nhàng** (sườn ghi nội dung nhạy cảm: bé có thể vừa mất người thân hay thú cưng). Vật "đã chết" trong bài chỉ là lá khô, cành khô, vỏ sò rỗng (ví dụ chữ, không có ảnh). Không có con vật chết, bộ xương, xương cá, thú cưng; không nói vì sao vật chết. Cờ `sensitive` để `false` vì cờ này dành cho nội dung dậy thì (app ẩn bài); xem `_topic.md`, mục An toàn.
> **Đúng khoa học:** lá rụng là "đã chết" (từng sống), không phải "không sống" như một câu quiz của nguồn tham khảo. Vật "chưa từng sống" chỉ lấy nhựa, thuỷ tinh, đá. Không đưa đồ gỗ, giấy, vải bông, đồ da vào nhóm "chưa từng sống": các thứ đó làm từ cây hay con vật từng sống.

## Ý chính
1.en: A green leaf on a tree is alive.
1.vi: Chiếc lá xanh trên cây đang sống.
2.en: A dry leaf was alive once. Now it is dead.
2.vi: Chiếc lá khô đã từng sống. Bây giờ lá đã chết.
3.en: A stone was never alive.
3.vi: Hòn đá chưa bao giờ sống.
> Từ cụ thể tới trừu tượng: cùng một chiếc lá lúc sống và lúc đã chết, rồi một vật chưa bao giờ sống.

## Khởi động

> Hai câu: w1 ôn bài hai (bài trước), w2 ôn bài một.

### w1
id: 52d8e051-3d7d-4983-a580-f39a15a8b640
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/vat-song-nao-cung-cu-dong
prompt.en: Which one is alive?
prompt.vi: Cái nào là vật sống?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Which one grows?
hint.vi: Em tìm cái nào lớn lên được nhé.
explanation_correct.en: Yes! A vine grows and climbs slowly.
explanation_correct.vi: Đúng rồi! Dây mướp lớn lên và leo chầm chậm.
explanation_wrong.en: The answer is the vine. Plants are alive.
explanation_wrong.vi: Đáp án là dây mướp. Cây là vật sống.

#### option w1_car
correct: false
feedback.en: A toy car moves, but never grows.
feedback.vi: Ô tô đồ chơi chạy được, nhưng không lớn lên.
label.en: toy car
label.vi: ô tô đồ chơi
image.brief: Dùng lại hình `tray_car` ở bài `sinh-vat-song-o-dau/vat-song-hay-khong-song`. Từ khoá tìm ảnh (EN): red plastic toy car side view
image.alt.en: A red toy car
image.alt.vi: Chiếc ô tô đồ chơi màu đỏ

#### option w1_vine
correct: true
label.en: vine
label.vi: dây mướp
image.brief: Dùng lại hình `explore_slow_plants` ở bài `sinh-vat-song-o-dau/vat-song-nao-cung-cu-dong`. Từ khoá tìm ảnh (EN): gourd vine tendril curling bamboo
image.alt.en: A vine curling around a stick
image.alt.vi: Ngọn dây leo quấn quanh thanh tre

### w2
id: 7e8ec287-fa87-455f-9f3c-50ce2bda21bd
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/vat-song-hay-khong-song
prompt.en: Living things need water.
prompt.vi: Vật sống cần nước.
image.brief: Dùng lại hình `explore_plants` ở bài `sinh-vat-song-o-dau/vat-song-hay-khong-song`. Từ khoá tìm ảnh (EN): young vegetable seedlings soil row
image.alt.en: Young plants in the soil
image.alt.vi: Cây non mọc trên đất
answer: true
hint.en: Think of a plant on a hot day.
hint.vi: Em nghĩ tới cái cây trong ngày nắng nóng nhé.
explanation_correct.en: Yes! Plants and animals all need water.
explanation_correct.vi: Đúng rồi! Cây và con vật đều cần nước.
explanation_wrong.en: This is true. Living things need water.
explanation_wrong.vi: Câu này đúng. Vật sống cần nước.
feedback_false.en: Young plants dry up with no water.
feedback_false.vi: Cây non thiếu nước sẽ héo khô.
> Ảnh cây non trên đất ẩm, không có bình tưới, không có giọt nước (không làm bằng chứng).

## Học

> Ba ô: đang sống, đã chết, chưa từng sống. Ô "Alive" và ô "Dead" cùng nói về chiếc lá, để bé thấy "đã chết" là "đã từng sống".
> Ô "Never alive" sửa `non_living_means_dead`: vật chưa từng sống thì không chết được.

### explore
id: 808e93a3-9a65-4568-be1a-453707a05b55
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_alive
label.en: Alive
label.vi: Đang sống
color: gi_dong
sentence.en: This green leaf is living now. It can grow.
sentence.vi: Chiếc lá xanh này đang sống. Lá còn lớn lên được.
image.brief: [ảnh] Một cành cây bàng có những chiếc lá xanh to còn trên cây, ảnh ngang, chụp gần; nền trời hoặc tán lá mờ; không có người, không có chữ. Từ khoá tìm ảnh (EN): Terminalia catappa green leaves branch
image.alt.en: Green leaves on a branch
image.alt.vi: Lá xanh trên cành cây
examples.1.en: a green leaf on a tree
examples.1.vi: chiếc lá xanh trên cây
examples.2.en: a snail on a leaf
examples.2.vi: con ốc sên trên lá
examples.3.en: you, too
examples.3.vi: cả em nữa
> Hình gốc, dùng lại ở câu q1, câu q4, từ `leaf`, và bài bốn.

#### group explore_dead
label.en: Dead
label.vi: Đã chết
color: nau_dat
sentence.en: This leaf was alive once. Now it is not.
sentence.vi: Chiếc lá này đã từng sống. Bây giờ không còn sống nữa.
image.brief: Dùng lại hình `tray_dry_leaf` ở bài `da-va-dat/hoa-thach-hinh-thanh-the-nao`. Từ khoá tìm ảnh (EN): dry fallen leaf on ground top view
image.alt.en: A dry fallen leaf
image.alt.vi: Chiếc lá khô vừa rụng
examples.1.en: a dry leaf on the ground
examples.1.vi: chiếc lá khô rụng dưới đất
examples.2.en: a dry stick
examples.2.vi: cành cây khô
examples.3.en: an empty seashell on the sand
examples.3.vi: vỏ sò rỗng trên bãi cát
> [CẦN KIỂM] Vỏ sò rỗng là phần còn lại của một con sò đã chết (biên tập chắc, chỉ nhờ chuyên môn xác nhận cách nói cho bé năm tuổi). Ví dụ vỏ sò chỉ là chữ, không có ảnh, không có câu hỏi.

#### group explore_never
label.en: Never alive
label.vi: Chưa từng sống
color: cham
sentence.en: This stone was never alive. It cannot die.
sentence.vi: Hòn đá này chưa bao giờ sống, nên không thể chết.
image.brief: Dùng lại hình `w1_stone` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): smooth pebble stone sand
image.alt.en: A smooth stone
image.alt.vi: Hòn đá cuội
examples.1.en: a stone
examples.1.vi: hòn đá
examples.2.en: a glass marble
examples.2.vi: viên bi thuỷ tinh
examples.3.en: a plastic bottle
examples.3.vi: cái chai nhựa
examples.4.en: a metal spoon
examples.4.vi: cái thìa kim loại

### new_words
id: 76d4244c-d31d-4b5c-973e-4464b55a6429
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: dead, never_alive

## Chơi

> Bé chọn một vật đang sống và một vật đã chết. Đạt khi đủ hai nhóm và không chọn vật chưa từng sống.
> Món bẫy là vật chưa từng sống (hòn đá, chai nhựa, viên bi): bé mang quan niệm "vật không sống là vật đã chết" sẽ chọn chúng vào nhóm "Đã chết". Lời nhắn `has_limited` sửa ngay quan niệm đó.
> Kệ bảy món, toàn ảnh chụp, hai chỗ.

### tray
id: 742c7155-f279-4ee9-a727-7391d8471e36
type: build_tray
version: 1
prompt.en: Pick one alive and one dead
prompt.vi: Chọn một vật đang sống và một vật đã chết
capacity: 2
success_when: all_required_and_no_limit
messages.start.en: Find something alive and something dead.
messages.start.vi: Em tìm một vật đang sống và một vật đã chết nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! The dead one was alive once.
messages.balanced.vi: Tuyệt! Vật đã chết từng có lúc sống.
messages.has_limited.en: That one was never alive.
messages.has_limited.vi: Vật này chưa bao giờ sống.
messages.missing.tray_alive.en: You still need something alive.
messages.missing.tray_alive.vi: Em còn thiếu một vật đang sống.
messages.missing.tray_dead.en: You still need something dead.
messages.missing.tray_dead.vi: Em còn thiếu một vật đã chết.

#### group tray_alive
label.en: Alive
label.vi: Đang sống
color: gi_dong
role: required

#### group tray_dead
label.en: Dead
label.vi: Đã chết
color: nau_dat
role: required

#### group tray_never
label.en: Never alive
label.vi: Chưa từng sống
color: do_son
role: limit
> Nhãn `limit` gọi tên loại ("Never alive"), không theo dạng "Not …" vì "Not alive" ở đây sẽ gom cả nhóm "Đã chết".

#### item tray_snail
label.en: Snail
label.vi: Con ốc sên
group: tray_alive
image.brief: Dùng lại hình `tray_snail` ở bài `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien`. Từ khoá tìm ảnh (EN): garden snail on leaf side view
image.alt.en: A snail on a leaf
image.alt.vi: Con ốc sên trên lá

#### item tray_bottle
label.en: Plastic bottle
label.vi: Chai nhựa
group: tray_never
image.brief: Dùng lại hình `q4_bottle` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): plastic water bottle no label
image.alt.en: A bottle of water
image.alt.vi: Chai nước

#### item tray_dry_leaf
label.en: Dry leaf
label.vi: Lá khô
group: tray_dead
image.brief: Dùng lại hình `tray_dry_leaf` ở bài `da-va-dat/hoa-thach-hinh-thanh-the-nao`. Từ khoá tìm ảnh (EN): dry fallen leaf on ground top view
image.alt.en: A dry fallen leaf
image.alt.vi: Chiếc lá khô vừa rụng

#### item tray_stone
label.en: Stone
label.vi: Hòn đá
group: tray_never
image.brief: Dùng lại hình `w1_stone` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): smooth pebble stone sand
image.alt.en: A smooth stone
image.alt.vi: Hòn đá cuội

#### item tray_seedlings
label.en: Young plants
label.vi: Cây non
group: tray_alive
image.brief: Dùng lại hình `explore_plants` ở bài `sinh-vat-song-o-dau/vat-song-hay-khong-song`. Từ khoá tìm ảnh (EN): young vegetable seedlings soil row
image.alt.en: Young plants in the soil
image.alt.vi: Cây non mọc trên đất

#### item tray_stick
label.en: Dry stick
label.vi: Cành khô
group: tray_dead
image.brief: [ảnh] Một cành cây khô đã gãy, không còn lá, nằm ngang trên mặt đất, ảnh ngang; không có người, không có chữ. Từ khoá tìm ảnh (EN): dry fallen branch stick ground
image.alt.en: A dry stick on the ground
image.alt.vi: Cành cây khô trên mặt đất
> Hình gốc, dùng lại ở câu q5 và bài năm. Cành nằm ngang, hợp thẻ rất ngang.

#### item tray_marble
label.en: Glass marbles
label.vi: Bi thuỷ tinh
group: tray_never
image.brief: [ảnh] Vài viên bi thuỷ tinh trong có vân màu nằm trên nền trơn, chụp gần, ảnh ngang; không có tay, không có chữ. Từ khoá tìm ảnh (EN): glass marbles close up
image.alt.en: Glass marbles
image.alt.vi: Những viên bi thuỷ tinh
> Hình gốc, dùng lại ở câu q5.

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1 hai lựa chọn; q3, q5 ba lựa chọn), `true_false` (q2, q6), `order_sequence` (q4).

### q1
id: 885162f6-90c8-46d1-a14a-1190483e62be
format: single_choice
version: 1
dok: 1
prompt.en: Which leaf is alive?
prompt.vi: Chiếc lá nào đang sống?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look at the colour of each leaf.
hint.vi: Em nhìn màu của từng chiếc lá nhé.
explanation_correct.en: Yes! A green leaf on a tree is alive.
explanation_correct.vi: Đúng rồi! Lá xanh còn trên cây là đang sống.
explanation_wrong.en: The answer is the green leaf. It is alive.
explanation_wrong.vi: Đáp án là chiếc lá xanh. Lá đang sống.
> Hai lá khác nhau rõ bằng mắt (xanh trên cành, nâu khô dưới đất); đó chính là điều bé cần nhìn.

#### option q1_green
correct: true
label.en: green leaves
label.vi: lá xanh
image.brief: Dùng lại hình `explore_alive`. Từ khoá tìm ảnh (EN): Terminalia catappa green leaves branch
image.alt.en: Green leaves on a branch
image.alt.vi: Lá xanh trên cành cây

#### option q1_dry_leaf
correct: false
feedback.en: This leaf is dry and brown.
feedback.vi: Chiếc lá này khô và nâu.
label.en: dry leaf
label.vi: lá khô
image.brief: Dùng lại hình `tray_dry_leaf` ở bài `da-va-dat/hoa-thach-hinh-thanh-the-nao`. Từ khoá tìm ảnh (EN): dry fallen leaf on ground top view
image.alt.en: A dry fallen leaf
image.alt.vi: Chiếc lá khô vừa rụng

### q2
id: 5e48c7e1-07d8-44b1-a5fc-139ea0a5049e
format: true_false
version: 1
dok: 1
prompt.en: A dry leaf was once alive.
prompt.vi: Chiếc lá khô đã từng sống.
image.brief: Dùng lại hình `tray_dry_leaf` ở bài `da-va-dat/hoa-thach-hinh-thanh-the-nao`. Từ khoá tìm ảnh (EN): dry fallen leaf on ground top view
image.alt.en: A dry fallen leaf
image.alt.vi: Chiếc lá khô vừa rụng
answer: true
hint.en: Where did the leaf grow?
hint.vi: Chiếc lá này đã mọc ở đâu?
explanation_correct.en: Yes! It grew on a tree, then fell.
explanation_correct.vi: Đúng rồi! Lá mọc trên cây, rồi rụng xuống.
explanation_wrong.en: This is true. The leaf grew on a tree.
explanation_wrong.vi: Câu này đúng. Chiếc lá đã mọc trên cây.
feedback_false.en: This leaf grew on a tree before.
feedback_false.vi: Chiếc lá này từng mọc trên cây.

### q3
id: 0d65868c-3906-4f95-bf86-835085a15c81
format: single_choice
version: 1
dok: 1
prompt.en: Which one was never alive?
prompt.vi: Cái nào chưa từng sống?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Remember the Never alive picture.
hint.vi: Em nhớ lại ô Chưa từng sống nhé.
explanation_correct.en: Yes! People made this bottle in a factory.
explanation_correct.vi: Đúng rồi! Chai nhựa do người làm ra trong nhà máy.
explanation_wrong.en: The answer is the bottle. It was never alive.
explanation_wrong.vi: Đáp án là chai nhựa. Chai chưa từng sống.
> Gợi ý nhắc ô Học có ảnh hòn đá, không phải ảnh của đáp án. Chai nhựa, lá khô, ốc sên là ba món bé vừa gặp ở kệ Chơi.

#### option q3_bottle
correct: true
label.en: plastic bottle
label.vi: chai nhựa
image.brief: Dùng lại hình `q4_bottle` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): plastic water bottle no label
image.alt.en: A bottle of water
image.alt.vi: Chai nước

#### option q3_snail
correct: false
feedback.en: A snail is alive and eats leaves.
feedback.vi: Ốc sên đang sống, biết ăn lá.
label.en: snail
label.vi: ốc sên
image.brief: Dùng lại hình `tray_snail` ở bài `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien`. Từ khoá tìm ảnh (EN): garden snail on leaf side view
image.alt.en: A snail on a leaf
image.alt.vi: Con ốc sên trên lá

#### option q3_dry_leaf
correct: false
feedback.en: A dry leaf grew on a tree once.
feedback.vi: Lá khô đã từng mọc trên cây.
label.en: dry leaf
label.vi: lá khô
image.brief: Dùng lại hình `tray_dry_leaf` ở bài `da-va-dat/hoa-thach-hinh-thanh-the-nao`. Từ khoá tìm ảnh (EN): dry fallen leaf on ground top view
image.alt.en: A dry fallen leaf
image.alt.vi: Chiếc lá khô vừa rụng

### q4
id: a6cdfd6b-5432-4c67-8382-9402ba81cf13
format: order_sequence
version: 1
dok: 2
prompt.en: Tap to show how a leaf changes.
prompt.vi: Em chạm theo thứ tự chiếc lá thay đổi.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_green, q4_yellow, q4_dry
hint.en: Start with the fresh green leaf.
hint.vi: Em bắt đầu từ chiếc lá xanh tươi nhé.
explanation_correct.en: Yes! Old leaves turn yellow, then fall.
explanation_correct.vi: Đúng rồi! Lá già vàng đi, rồi rụng xuống.
explanation_wrong.en: The order is green, yellow, then dry.
explanation_wrong.vi: Thứ tự là lá xanh, lá vàng, rồi lá khô.
> DOK 2: sắp thứ tự một vật từ đang sống tới đã chết. Thẻ trong file không theo thứ tự đúng. Ba thẻ cùng cỡ lá trong khung vuông; khác nhau rõ bằng màu.
> [CẦN KIỂM] Nhiều loài cây có lá già chuyển vàng (hay đỏ, như lá bàng) trước khi rụng. Chủ đề *Thời tiết và các mùa* (Explorer số năm) dạy lá đổi màu theo mùa ở bài 3 (có cây lá vàng mùa thu, lá bàng đỏ mùa đông); câu này chỉ dùng ý "lá từ sống tới chết", không nói chuyện mùa.

#### item q4_yellow
label.en: yellow leaf
label.vi: lá vàng
image.brief: [ảnh] Một chiếc lá vàng còn dính trên cành, chụp gần, nền lá xanh hoặc trời mờ; không có người, không có chữ. Từ khoá tìm ảnh (EN): single yellow leaf on branch close up
image.alt.en: A yellow leaf on a branch
image.alt.vi: Chiếc lá vàng trên cành

#### item q4_dry
label.en: dry leaf
label.vi: lá khô
image.brief: Dùng lại hình `tray_dry_leaf` ở bài `da-va-dat/hoa-thach-hinh-thanh-the-nao`. Từ khoá tìm ảnh (EN): dry fallen leaf on ground top view
image.alt.en: A dry fallen leaf
image.alt.vi: Chiếc lá khô vừa rụng

#### item q4_green
label.en: green leaves
label.vi: lá xanh
image.brief: Dùng lại hình `explore_alive`. Từ khoá tìm ảnh (EN): Terminalia catappa green leaves branch
image.alt.en: Green leaves on a branch
image.alt.vi: Lá xanh trên cành cây

### q5
id: 7b15d98f-ff0a-476b-853e-0e2b451ea816
format: single_choice
version: 1
dok: 2
prompt.en: Which one is dead now?
prompt.vi: Cái nào bây giờ đã chết?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Which one grew once, but not now?
hint.vi: Em tìm cái từng lớn lên, nay thì không nữa.
explanation_correct.en: Yes! The stick grew on a tree once.
explanation_correct.vi: Đúng rồi! Cành khô từng mọc trên cây.
explanation_wrong.en: The answer is the dry stick. It was alive once.
explanation_wrong.vi: Đáp án là cành cây khô. Cành từng sống.
> DOK 2: tách "đã chết" khỏi "chưa từng sống" (viên bi) và "đang sống" (ốc sên). Ba món bé vừa gặp ở kệ Chơi.

#### option q5_snail
correct: false
feedback.en: A snail is still alive.
feedback.vi: Ốc sên vẫn đang sống.
label.en: snail
label.vi: ốc sên
image.brief: Dùng lại hình `tray_snail` ở bài `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien`. Từ khoá tìm ảnh (EN): garden snail on leaf side view
image.alt.en: A snail on a leaf
image.alt.vi: Con ốc sên trên lá

#### option q5_stick
correct: true
label.en: dry stick
label.vi: cành khô
image.brief: Dùng lại hình `tray_stick`. Từ khoá tìm ảnh (EN): dry fallen branch stick ground
image.alt.en: A dry stick on the ground
image.alt.vi: Cành cây khô trên mặt đất

#### option q5_marble
correct: false
feedback.en: A marble was never alive.
feedback.vi: Viên bi chưa bao giờ sống.
label.en: marbles
label.vi: bi thuỷ tinh
image.brief: Dùng lại hình `tray_marble`. Từ khoá tìm ảnh (EN): glass marbles close up
image.alt.en: Glass marbles
image.alt.vi: Những viên bi thuỷ tinh

### q6
id: eb08905a-c82e-4a1b-8ad8-1cbeba508419
format: true_false
version: 1
dok: 2
misconception: non_living_means_dead
prompt.en: A stone is dead.
prompt.vi: Hòn đá đã chết.
image.brief: Dùng lại hình `w1_stone` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): smooth pebble stone sand
image.alt.en: A smooth stone
image.alt.vi: Hòn đá cuội
answer: false
hint.en: Was a stone ever alive?
hint.vi: Hòn đá đã bao giờ sống chưa?
explanation_correct.en: A stone was never alive. It cannot die.
explanation_correct.vi: Hòn đá chưa bao giờ sống, nên không thể chết.
explanation_wrong.en: This is false. A stone was never alive.
explanation_wrong.vi: Câu này sai. Hòn đá chưa từng sống.
feedback_true.en: A stone never grew, ate or drank.
feedback_true.vi: Hòn đá chưa bao giờ lớn lên, ăn hay uống.
> Câu misconception (`non_living_means_dead`): bé nghĩ "vật không sống là vật đã chết" sẽ chạm gật đầu. DOK 2: áp định nghĩa "đã chết là đã từng sống" vào một vật bé thấy hằng ngày. Đáp án Sai, giải thích khi đúng không mở đầu bằng "Yes!".

## Từ vựng

### dead
id: 9db69af8-11b5-4342-ab52-451e0b8e790f
tier: core
term.en: dead
term.vi: đã chết
example.en: This dry leaf is dead.
example.vi: Chiếc lá khô này đã chết.
image.brief: Dùng lại hình `tray_dry_leaf` ở bài `da-va-dat/hoa-thach-hinh-thanh-the-nao`. Từ khoá tìm ảnh (EN): dry fallen leaf on ground top view
image.alt.en: A dry fallen leaf
image.alt.vi: Chiếc lá khô vừa rụng

### never_alive
id: 54460ba8-7573-4af0-9093-093ec785603d
tier: core
term.en: never alive
term.vi: chưa từng sống
example.en: A stone was never alive.
example.vi: Hòn đá chưa từng sống.
image.brief: Dùng lại hình `w1_stone` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): smooth pebble stone sand
image.alt.en: A smooth stone
image.alt.vi: Hòn đá cuội

### leaf
id: 3c766f4d-3439-4857-8f06-6ae523620cd7
tier: extra
term.en: leaf
term.vi: chiếc lá
example.en: A green leaf grows on a tree.
example.vi: Lá xanh mọc trên cây.
image.brief: Dùng lại hình `explore_alive`. Từ khoá tìm ảnh (EN): Terminalia catappa green leaves branch
image.alt.en: Green leaves on a branch
image.alt.vi: Lá xanh trên cành cây

### plastic
id: 473b810b-b844-4709-9216-d5de20c2a3d3
tier: extra
term.en: plastic
term.vi: nhựa
example.en: This bottle is made of plastic.
example.vi: Cái chai này làm bằng nhựa.
image.brief: Dùng lại hình `q4_bottle` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): plastic water bottle no label
image.alt.en: A bottle of water
image.alt.vi: Chai nước

## Thưởng

### almond_card
id: 75fed3fb-0962-4680-888e-82dd20b88d91
set: living_things
rarity: common
name.en: Indian almond tree
name.vi: Cây bàng
tag.en: Leaves that turn red
tag.vi: Lá chuyển màu đỏ
fact.en: Its big leaves turn red, then fall.
fact.vi: Lá bàng to chuyển màu đỏ, rồi rụng xuống.
image.brief: [ảnh] Một cành bàng có những chiếc lá to đã chuyển màu đỏ cam, chụp gần, ảnh vuông được; không có người, không có chữ. Từ khoá tìm ảnh (EN): Terminalia catappa red leaves
image.alt.en: Red leaves on an Indian almond tree
image.alt.vi: Lá bàng chuyển màu đỏ
> [CẦN KIỂM] Lá bàng chuyển đỏ trước khi rụng (rõ nhất vào mùa đông ở miền Bắc). Thẻ nối ý của câu q4 (lá già đổi màu rồi rụng). Tên EN "Indian almond tree" (cây bàng, Terminalia catappa); nghe thử giọng đọc.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Ảnh lựa chọn chọn ảnh ngang (thẻ hai lựa chọn khung 17:10, ba lựa chọn 5:2).
- **Ảnh cần tìm (năm):** cành bàng lá xanh (ô Học "Alive"); cành khô nằm trên đất; bi thuỷ tinh; một lá vàng còn trên cành (q4); cành bàng lá đỏ (thẻ).
- **An toàn:** không ảnh con vật chết, xương, vỏ sò, hoa héo; lá khô và cành khô là vật "đã chết" duy nhất có ảnh.
- **q4 (`order_sequence`):** lá xanh, lá vàng, lá khô cùng cỡ lá trong khung vuông; lá xanh (ô Học) là cả cành, cắt sát một hai lá.
- **Dùng lại:** bài một (`explore_plants`, `tray_car`), bài hai (`explore_slow_plants`); chủ đề *Gọi tên và nhóm động vật* (`w1`, `tray_snail`); *Đá và đất* (`tray_dry_leaf`); *Hô hấp* (`w1_stone`, `q4_bottle`).
- **Màu:** Học: đang sống `gi_dong`, đã chết `nau_dat`, chưa từng sống `cham`. Chơi: đang sống `gi_dong`, đã chết `nau_dat`, chưa từng sống `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` ba nhóm + `word_list` (dead, never alive). Chơi `build_tray` hai chỗ, hai nhóm `required`, một nhóm `limit`, bảy món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Đúng). Quiz `single_choice` (q1, q3, q5), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`non_living_means_dead`).
- **Vị trí đáp án đúng:** hết hiệu lực 15/11 (SK-047, app xáo lựa chọn và thẻ xếp thứ tự). q4 thứ tự đúng: lá xanh, lá vàng, lá khô.
- **Màn Chơi, ví dụ để kiểm:** Con ốc sên, Lá khô → `balanced`; Cây non, Hòn đá → `has_limited`; Cây non, Con ốc sên → `missing.tray_dead`.
- **Câu hỏi chiều phủ định** (rà chữ tester 14/11 n4): q3 "Which one was never alive?" · "Cái nào chưa từng sống?" không viết khẳng định được; đề xuất ios-dev cho giọng đọc chậm và nhấn "never" · "chưa từng".
- **Giọng đọc:** chữ "dead" · "đã chết" đọc bình thường, không nhấn; không thêm âm thanh buồn ở màn này.
- **Từ EN có thể ngoài Starters/Movers:** alive, dead, never alive, plastic, marble, stick, Indian almond tree, factory.
