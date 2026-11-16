---
id: 275ec848-b466-4731-b084-49a035146626
topic: sinh-vat-song-o-dau
slug: noi-song-cua-cay
order: 5
stage: apply
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Plant habitats
vi: Nơi sống của cây
> Giữ đúng tên ở `content/syllabus.json` (bài số năm).

## Mục tiêu
en: I can match plants to where they grow.
vi: Em ghép được cây với nơi cây mọc.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 14/11/2026. Mọi dòng `id:` để trống; chạy `ids` sau bài bốn.
> Bài vận dụng (`apply`): dùng ý "nơi sống" của bài bốn cho cây. Bốn nơi sống khác nhau theo nước và ánh sáng (ao, đồi cát, bùn nước mặn, chỗ râm), để sửa quan niệm "nơi sống chỉ có nóng và lạnh" mà không cần một câu riêng.
> Sửa `plants_grow_anywhere` ở bốn ô Học, phần Chơi và câu q6 (gắn key).
> Không dùng các cây trong quiz của nguồn tham khảo (thường xuân, thuỷ tiên vàng, tảo bẹ, anh túc, xương rồng saguaro, cây vân sam, cây thông) và không ghép cây với "Bắc Cực" (sườn `[CẦN KIỂM]`: thông, vân sam không mọc ở Bắc Cực thật). Xương rồng ở đây là xương rồng trên đồi cát miền Trung, không nói tên loài.

## Ý chính
1.en: A lotus grows in a pond. A cactus grows in sand.
1.vi: Sen mọc ở ao. Xương rồng mọc trên cát.
2.en: Plants need water, light and air.
2.vi: Cây cần nước, ánh sáng và không khí.
3.en: Different plants need different habitats.
3.vi: Mỗi loài cây cần một nơi sống khác nhau.
> Ý hai không nói "cây cần đất" (sen, bèo, lục bình sống trong nước) và không nói "cây lấy thức ăn từ đất".

## Khởi động

> Hai câu: w1 ôn bài bốn (bài trước), w2 ôn bài ba.

### w1
id: 0659a150-1044-48e8-ad34-dd43faa6499c
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/noi-song-cua-con-vat
prompt.en: Which animal lives in the forest?
prompt.vi: Con nào sống trong rừng?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Which one climbs trees?
hint.vi: Con nào biết leo cây?
explanation_correct.en: Yes! A douc climbs tall forest trees.
explanation_correct.vi: Đúng rồi! Voọc leo trên cây rừng cao.
explanation_wrong.en: The answer is the douc. It lives in trees.
explanation_wrong.vi: Đáp án là con voọc. Voọc sống trên cây.

#### option w1_douc
correct: true
label.en: douc
label.vi: con voọc
image.brief: Dùng lại hình `explore_wild` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): red-shanked douc langur tree
image.alt.en: A douc in a tree
image.alt.vi: Con voọc trên cây

#### option w1_perch
correct: false
feedback.en: A climbing perch lives in water.
feedback.vi: Cá rô đồng sống dưới nước.
label.en: climbing perch
label.vi: cá rô đồng
image.brief: Dùng lại hình `tray_perch` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): climbing perch Anabas testudineus live
image.alt.en: A climbing perch in water
image.alt.vi: Cá rô đồng dưới nước

### w2
id: b94a7fa2-c660-4d2b-9c93-21c2136d5a59
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song
prompt.en: A dry stick was once alive.
prompt.vi: Cành cây khô đã từng sống.
image.brief: Dùng lại hình `tray_stick` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): dry fallen branch stick ground
image.alt.en: A dry stick on the ground
image.alt.vi: Cành cây khô trên mặt đất
answer: true
hint.en: Where did the stick grow?
hint.vi: Cành cây này đã mọc ở đâu?
explanation_correct.en: Yes! It grew on a tree, then dried.
explanation_correct.vi: Đúng rồi! Cành mọc trên cây, rồi khô đi.
explanation_wrong.en: This is true. The stick grew on a tree.
explanation_wrong.vi: Câu này đúng. Cành cây đã mọc trên cây.
feedback_false.en: This stick grew on a tree before.
feedback_false.vi: Cành này từng mọc trên cây.
> Câu khẳng định, không dùng "never" · "chưa từng" trong câu hỏi (luật Explorer số năm).

## Học

> Bốn ô, mỗi ô một nơi sống của cây và điều nơi đó có (nhiều nước, ít nước, nước mặn, ít nắng). Từ gần nhà (ao) tới xa hơn.

### explore
id: ece46bfd-8565-4607-8f4d-dbbf32e4be38
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_pond_plants
label.en: In a pond
label.vi: Ở ao
color: cham
sentence.en: A lotus grows in a muddy pond.
sentence.vi: Hoa sen mọc trong ao bùn.
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao
examples.1.en: roots in the mud
examples.1.vi: rễ cắm dưới bùn
examples.2.en: leaves float on the water
examples.2.vi: lá nổi trên mặt nước
examples.3.en: water lilies, too
examples.3.vi: cả hoa súng nữa

#### group explore_dry_plants
label.en: On sand hills
label.vi: Trên đồi cát
color: vang_hoe
sentence.en: A cactus grows in dry, sunny sand.
sentence.vi: Xương rồng mọc trên cát khô, nhiều nắng.
image.brief: [ảnh] Một bụi xương rồng có gai mọc trên cát vàng dưới nắng, ảnh ngang thấy cả bụi cây và nền cát; ưu tiên đồi cát Ninh Thuận hoặc Bình Thuận; không có người, không có chữ. Từ khoá tìm ảnh (EN): cactus on sand dunes Vietnam
image.alt.en: A cactus on the sand
image.alt.vi: Cây xương rồng trên cát
examples.1.en: it keeps water inside
examples.1.vi: thân cây giữ nước bên trong
examples.2.en: it has spines, not big leaves
examples.2.vi: cây có gai, không có lá to
examples.3.en: lots of sun, little rain
examples.3.vi: nhiều nắng, ít mưa
> [CẦN KIỂM] Xương rồng trữ nước trong thân; gai là lá biến đổi; xương rồng mọc hoang trên đồi cát Ninh Thuận, Bình Thuận. Hình gốc, dùng lại ở món Chơi, câu q1, câu q5, từ `cactus`, và bài sáu.

#### group explore_salty_plants
label.en: In salty mud
label.vi: Trong bùn nước mặn
color: nau_dat
sentence.en: Mangrove trees grow in salty mud.
sentence.vi: Cây đước mọc trong bùn nước mặn.
image.brief: Dùng lại hình `explore_mangrove` ở bài `sinh-vat-song-o-dau/noi-song-cua-con-vat`. Từ khoá tìm ảnh (EN): mangrove forest roots mud Vietnam
image.alt.en: Mangrove trees in the mud
image.alt.vi: Rừng cây đước trên bùn
examples.1.en: the sea comes in and goes out
examples.1.vi: nước biển lên rồi lại rút
examples.2.en: strong roots hold the mud
examples.2.vi: rễ chắc giữ chặt bùn
examples.3.en: fish hide between the roots
examples.3.vi: cá trốn giữa đám rễ
> [CẦN KIỂM] Cây đước sống được trong nước mặn, rễ chống giữ bùn; nước triều lên xuống mỗi ngày.

#### group explore_shade_plants
label.en: In the shade
label.vi: Chỗ râm mát
color: gi_dong
sentence.en: Ferns like shady, damp places.
sentence.vi: Dương xỉ thích chỗ râm và ẩm.
image.brief: Dùng lại hình `q2_ferns` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): tree fern forest wide view Vietnam national park
image.alt.en: A forest full of ferns
image.alt.vi: Khu rừng nhiều dương xỉ
examples.1.en: under tall trees
examples.1.vi: dưới tán cây cao
examples.2.en: near a cool stream
examples.2.vi: gần bờ suối mát
examples.3.en: moss grows here, too
examples.3.vi: rêu cũng mọc ở đây

### new_words
id: c7f01d84-324e-4745-9ed4-53a673b307ba
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: dry, wet

## Chơi

> Bé chọn ba cây sống ở chỗ có nhiều nước: một cây ở ao, một cây ở ruộng lúa, một cây ở bùn nước mặn. Đạt khi đủ ba nhóm và không chọn cây mọc trên đất khô hơn.
> Món bẫy: xương rồng (đồi cát), dương xỉ (đất ẩm, không ngập nước), tre (đất liền). Dương xỉ là bẫy khó nhất: thích ẩm nhưng không sống trong nước.
> Kệ bảy món, toàn ảnh chụp.

### tray
id: 44ebcf85-5abb-4a8f-943a-a0e7049eac12
type: build_tray
version: 1
prompt.en: Pick three plants that grow in water
prompt.vi: Chọn ba cây mọc ở chỗ ngập nước
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find a pond, a field and salty mud.
messages.start.vi: Em tìm một cây ở ao, một cây ở ruộng, một cây ở bùn nước mặn nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! These plants all need lots of water.
messages.balanced.vi: Tuyệt! Những cây này đều cần nhiều nước.
messages.has_limited.en: That plant does not grow in water.
messages.has_limited.vi: Cây này không mọc trong nước.
messages.missing.tray_pond.en: You still need a pond plant.
messages.missing.tray_pond.vi: Em còn thiếu một cây ở ao.
messages.missing.tray_field.en: You still need a rice field plant.
messages.missing.tray_field.vi: Em còn thiếu một cây ở ruộng lúa.
messages.missing.tray_salty.en: You still need a salty mud plant.
messages.missing.tray_salty.vi: Em còn thiếu một cây ở bùn nước mặn.

#### group tray_pond
label.en: Pond
label.vi: Ao
color: cham
role: required

#### group tray_field
label.en: Rice field
label.vi: Ruộng lúa
color: vang_hoe
role: required

#### group tray_salty
label.en: Salty mud
label.vi: Bùn nước mặn
color: nau_dat
role: required

#### group tray_dry
label.en: Not in water
label.vi: Không mọc trong nước
color: do_son
role: limit

#### item tray_lotus
label.en: Lotus
label.vi: Hoa sen
group: tray_pond
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao

#### item tray_cactus
label.en: Cactus
label.vi: Xương rồng
group: tray_dry
image.brief: Dùng lại hình `explore_dry_plants`. Từ khoá tìm ảnh (EN): cactus on sand dunes Vietnam
image.alt.en: A cactus on the sand
image.alt.vi: Cây xương rồng trên cát

#### item tray_rice
label.en: Rice plants
label.vi: Cây lúa
group: tray_field
image.brief: [ảnh] Những khóm lúa non xanh mọc thẳng hàng trong ruộng còn ngập nước, chụp gần, thấy mặt nước giữa các khóm; không có người, không có máy, không có chữ. Từ khoá tìm ảnh (EN): young rice plants flooded paddy
image.alt.en: Young rice in a wet field
image.alt.vi: Lúa non trên ruộng nước
> Hình gốc, dùng lại ở câu q5 và từ `wet`. [CẦN KIỂM] Lúa nước mọc trên ruộng ngập; cũng có lúa nương trồng trên đất khô ở vùng núi, nên nhóm ghi "Ruộng lúa", không ghi "lúa nào cũng cần ngập nước".

#### item tray_fern
label.en: Fern
label.vi: Cây dương xỉ
group: tray_dry
image.brief: Dùng lại hình `tray_fern` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): fern plant close up forest floor
image.alt.en: A fern
image.alt.vi: Cây dương xỉ

#### item tray_mangrove
label.en: Mangrove tree
label.vi: Cây đước
group: tray_salty
image.brief: Dùng lại hình `explore_mangrove` ở bài `sinh-vat-song-o-dau/noi-song-cua-con-vat`. Từ khoá tìm ảnh (EN): mangrove forest roots mud Vietnam
image.alt.en: Mangrove trees in the mud
image.alt.vi: Rừng cây đước trên bùn

#### item tray_hyacinth
label.en: Water hyacinth
label.vi: Bèo tây
group: tray_pond
image.brief: [ảnh] Một đám bèo tây (lục bình) xanh có hoa tím nổi trên mặt ao hoặc kênh, chụp gần, ảnh ngang; không có người, không có thuyền, không có chữ. Từ khoá tìm ảnh (EN): water hyacinth floating purple flowers
image.alt.en: Water hyacinth on the water
image.alt.vi: Bèo tây nổi trên mặt nước

#### item tray_bamboo
label.en: Bamboo
label.vi: Cây tre
group: tray_dry
image.brief: Dùng lại hình `bamboo_card` ở bài `sinh-vat-song-o-dau/vat-song-hay-khong-song`. Từ khoá tìm ảnh (EN): bamboo clump shoots Vietnam village
image.alt.en: A clump of green bamboo
image.alt.vi: Bụi tre xanh

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q3, q5; ba lựa chọn), `true_false` (q2, q6), `order_sequence` (q4).

### q1
id: 93e86a41-d741-4a66-a174-9a08d27cb894
format: single_choice
version: 1
dok: 1
prompt.en: Which plant grows in a pond?
prompt.vi: Cây nào mọc ở ao?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for leaves that float.
hint.vi: Em tìm cây có lá nổi trên mặt nước nhé.
explanation_correct.en: Yes! Lotus roots grow in the pond mud.
explanation_correct.vi: Đúng rồi! Rễ sen cắm sâu trong bùn ao.
explanation_wrong.en: The answer is the lotus. It needs a pond.
explanation_wrong.vi: Đáp án là hoa sen. Sen cần ao nước.

#### option q1_cactus
correct: false
feedback.en: A cactus grows in dry sand.
feedback.vi: Xương rồng mọc trên cát khô.
label.en: cactus
label.vi: xương rồng
image.brief: Dùng lại hình `explore_dry_plants`. Từ khoá tìm ảnh (EN): cactus on sand dunes Vietnam
image.alt.en: A cactus on the sand
image.alt.vi: Cây xương rồng trên cát

#### option q1_lotus
correct: true
label.en: lotus
label.vi: hoa sen
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao

#### option q1_fern
correct: false
feedback.en: A fern grows in damp shade.
feedback.vi: Dương xỉ mọc ở chỗ râm, ẩm.
label.en: fern
label.vi: dương xỉ
image.brief: Dùng lại hình `tray_fern` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): fern plant close up forest floor
image.alt.en: A fern
image.alt.vi: Cây dương xỉ
> Hoa sen bé đã gặp nhiều lần; xương rồng, dương xỉ bé vừa gặp ở Học và kệ Chơi hôm nay, nên đáp án không là "hình quen duy nhất" theo cách gây lối tắt: cả ba bé đều đã thấy hôm nay.

### q2
id: f94b7d91-e5c2-4a9f-9960-5f98dc60fd1e
format: true_false
version: 1
dok: 1
prompt.en: A cactus needs lots of water.
prompt.vi: Cây xương rồng cần thật nhiều nước.
image.brief: [ảnh] Cận cảnh một cây xương rồng nhỏ trồng trong chậu đất nung, nền trơn; không có cát, không có bình tưới, không có chữ, không có người. Từ khoá tìm ảnh (EN): small cactus clay pot close up
image.alt.en: A small cactus in a pot
image.alt.vi: Cây xương rồng nhỏ trong chậu
answer: false
hint.en: Remember the On sand hills picture.
hint.vi: Em nhớ lại ô Trên đồi cát nhé.
explanation_correct.en: A cactus keeps water inside. It needs little.
explanation_correct.vi: Xương rồng giữ nước trong thân. Xương rồng cần ít nước.
explanation_wrong.en: This is false. A cactus needs little water.
explanation_wrong.vi: Câu này sai. Xương rồng cần rất ít nước.
feedback_true.en: A cactus grows where it rarely rains.
feedback_true.vi: Xương rồng mọc ở nơi rất ít mưa.
> Hình câu hỏi là xương rồng trong chậu, không phải ảnh xương rồng trên đồi cát của ô Học (cát khô là bằng chứng của đáp án).

### q3
id: c2cbc405-a9fb-458f-9a2b-70a71abe271b
format: single_choice
version: 1
dok: 1
prompt.en: Which plant grows in salty mud?
prompt.vi: Cây nào mọc trong bùn nước mặn?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for roots standing in mud.
hint.vi: Em tìm cây có rễ đứng trong bùn nhé.
explanation_correct.en: Yes! Mangrove roots hold the mud tight.
explanation_correct.vi: Đúng rồi! Rễ đước giữ chặt lớp bùn.
explanation_wrong.en: The answer is the mangrove tree. It loves salty mud.
explanation_wrong.vi: Đáp án là cây đước. Cây đước mọc trong bùn mặn.

#### option q3_mangrove
correct: true
label.en: mangrove tree
label.vi: cây đước
image.brief: Dùng lại hình `explore_mangrove` ở bài `sinh-vat-song-o-dau/noi-song-cua-con-vat`. Từ khoá tìm ảnh (EN): mangrove forest roots mud Vietnam
image.alt.en: Mangrove trees in the mud
image.alt.vi: Rừng cây đước trên bùn

#### option q3_bamboo
correct: false
feedback.en: Bamboo grows on dry land.
feedback.vi: Tre mọc trên đất liền khô ráo.
label.en: bamboo
label.vi: cây tre
image.brief: Dùng lại hình `bamboo_card` ở bài `sinh-vat-song-o-dau/vat-song-hay-khong-song`. Từ khoá tìm ảnh (EN): bamboo clump shoots Vietnam village
image.alt.en: A clump of green bamboo
image.alt.vi: Bụi tre xanh

#### option q3_lotus
correct: false
feedback.en: A lotus grows in fresh pond water.
feedback.vi: Sen mọc trong nước ao, nước ngọt.
label.en: lotus
label.vi: hoa sen
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao

### q4
id: 5daadf75-3058-4c09-b186-2fb807af5284
format: order_sequence
version: 1
dok: 2
prompt.en: Tap from dry to wet.
prompt.vi: Em chạm từ nơi khô tới nơi ướt.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_dunes, q4_ferns, q4_pond
hint.en: Which place has the least water?
hint.vi: Nơi nào ít nước nhất?
explanation_correct.en: Yes! Plants grow in dry and wet places.
explanation_correct.vi: Đúng rồi! Cây mọc được ở cả nơi khô lẫn nơi ướt.
explanation_wrong.en: The order is sand, shady forest, then pond.
explanation_wrong.vi: Thứ tự là đồi cát, rừng râm mát, rồi cái ao.
> DOK 2: so sánh ba nơi sống theo lượng nước, không theo nóng lạnh. Thẻ trong file không theo thứ tự đúng. Ba cảnh cùng cắt vuông, cùng cỡ.

#### item q4_pond
label.en: pond
label.vi: cái ao
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê

#### item q4_dunes
label.en: sand hills
label.vi: đồi cát
image.brief: Dùng lại hình `q4_dunes` ở bài `sinh-vat-song-o-dau/noi-song-cua-con-vat`. Từ khoá tìm ảnh (EN): sand dunes Mui Ne Vietnam
image.alt.en: Sand hills on a sunny day
image.alt.vi: Đồi cát dưới nắng

#### item q4_ferns
label.en: shady forest
label.vi: rừng râm mát
image.brief: Dùng lại hình `q2_ferns` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): tree fern forest wide view Vietnam national park
image.alt.en: A forest full of ferns
image.alt.vi: Khu rừng nhiều dương xỉ

### q5
id: c261c7f8-c964-45b0-9ae2-5eece5af7084
format: single_choice
version: 1
dok: 2
prompt.en: Which plant likes shade?
prompt.vi: Cây nào thích chỗ râm?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of the cool forest floor.
hint.vi: Em nghĩ tới nền rừng mát rượi nhé.
explanation_correct.en: Yes! Ferns grow well in cool, damp shade.
explanation_correct.vi: Đúng rồi! Dương xỉ mọc tốt ở chỗ râm, mát và ẩm.
explanation_wrong.en: The answer is the fern. It likes shade.
explanation_wrong.vi: Đáp án là cây dương xỉ. Dương xỉ thích chỗ râm.
> DOK 2: phân loại ba cây theo nhu cầu ánh sáng. Lúa và xương rồng đều cần nắng; bé phải nhớ cây nào thích bóng râm.

#### option q5_rice
correct: false
feedback.en: Rice likes sunny, wet fields.
feedback.vi: Lúa thích ruộng nước nhiều nắng.
label.en: rice plants
label.vi: cây lúa
image.brief: Dùng lại hình `tray_rice`. Từ khoá tìm ảnh (EN): young rice plants flooded paddy
image.alt.en: Young rice in a wet field
image.alt.vi: Lúa non trên ruộng nước

#### option q5_cactus
correct: false
feedback.en: A cactus likes hot, bright sun.
feedback.vi: Xương rồng thích nắng gắt.
label.en: cactus
label.vi: xương rồng
image.brief: Dùng lại hình `explore_dry_plants`. Từ khoá tìm ảnh (EN): cactus on sand dunes Vietnam
image.alt.en: A cactus on the sand
image.alt.vi: Cây xương rồng trên cát

#### option q5_fern
correct: true
label.en: fern
label.vi: dương xỉ
image.brief: Dùng lại hình `tray_fern` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): fern plant close up forest floor
image.alt.en: A fern
image.alt.vi: Cây dương xỉ

### q6
id: c72cc717-3557-4799-aaa9-e85517289819
format: true_false
version: 1
dok: 2
misconception: plants_grow_anywhere
prompt.en: A lotus can grow in dry sand.
prompt.vi: Hoa sen mọc được trên cát khô.
image.brief: Dùng lại hình `q4_dunes` ở bài `sinh-vat-song-o-dau/noi-song-cua-con-vat`. Từ khoá tìm ảnh (EN): sand dunes Mui Ne Vietnam
image.alt.en: Sand hills on a sunny day
image.alt.vi: Đồi cát dưới nắng
answer: false
hint.en: What does a lotus need lots of?
hint.vi: Hoa sen cần thật nhiều thứ gì?
explanation_correct.en: A lotus needs a pond. Sand is too dry.
explanation_correct.vi: Sen cần ao nước. Cát thì quá khô.
explanation_wrong.en: This is false. A lotus needs pond water.
explanation_wrong.vi: Câu này sai. Hoa sen cần nước ao.
feedback_true.en: A lotus needs water and mud to grow.
feedback_true.vi: Sen cần nước và bùn để lớn lên.
> Câu misconception (`plants_grow_anywhere`): bé nghĩ "cây nào cũng mọc được ở mọi nơi" sẽ chạm gật đầu. DOK 2: áp nhu cầu của sen vào một nơi sống khác hẳn. Hình là đồi cát (nơi được nói tới), không phải ảnh sen trên ao (bằng chứng của đáp án). Đáp án Sai, giải thích khi đúng không mở đầu bằng "Yes!".

## Từ vựng

### dry
id: 68a5c3b4-cff0-4056-931f-0f1c3cfb8a31
tier: core
term.en: dry
term.vi: khô
example.en: Sand hills are dry and sunny.
example.vi: Đồi cát khô và nhiều nắng.
image.brief: Dùng lại hình `q4_dunes` ở bài `sinh-vat-song-o-dau/noi-song-cua-con-vat`. Từ khoá tìm ảnh (EN): sand dunes Mui Ne Vietnam
image.alt.en: Sand hills on a sunny day
image.alt.vi: Đồi cát dưới nắng

### wet
id: ac45435e-251a-4b44-ab8a-7224d5315e36
tier: core
term.en: wet
term.vi: ướt
example.en: Rice grows in wet fields.
example.vi: Lúa mọc trên ruộng ướt.
image.brief: Dùng lại hình `tray_rice`. Từ khoá tìm ảnh (EN): young rice plants flooded paddy
image.alt.en: Young rice in a wet field
image.alt.vi: Lúa non trên ruộng nước

### shade
id: 6eb668ab-9c98-49c8-b840-05627f779c28
tier: extra
term.en: shade
term.vi: bóng râm
example.en: Ferns grow in the shade.
example.vi: Dương xỉ mọc trong bóng râm.
image.brief: Dùng lại hình `q2_ferns` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): tree fern forest wide view Vietnam national park
image.alt.en: A forest full of ferns
image.alt.vi: Khu rừng nhiều dương xỉ

### cactus
id: 4afb1af1-65c0-4dd7-9fba-44bba6af7d3f
tier: extra
term.en: cactus
term.vi: cây xương rồng
example.en: A cactus has sharp spines.
example.vi: Cây xương rồng có gai nhọn.
image.brief: Dùng lại hình `explore_dry_plants`. Từ khoá tìm ảnh (EN): cactus on sand dunes Vietnam
image.alt.en: A cactus on the sand
image.alt.vi: Cây xương rồng trên cát

## Thưởng

### lotus_card
id: ca0474d6-1962-4fc1-8e3e-52313f576db6
set: living_things
rarity: common
name.en: Lotus
name.vi: Hoa sen
tag.en: A flower of the pond
tag.vi: Loài hoa của đầm ao
fact.en: Water rolls off a lotus leaf in drops.
fact.vi: Nước lăn trên lá sen thành từng giọt tròn.
image.brief: [ảnh] Một lá sen xanh to có vài giọt nước tròn lấp lánh đọng trên mặt lá, chụp gần, ảnh vuông được; không có người, không có chữ. Từ khoá tìm ảnh (EN): water drops on lotus leaf
image.alt.en: Water drops on a lotus leaf
image.alt.vi: Giọt nước trên lá sen
> [CẦN KIỂM] Mặt lá sen không thấm nước, nước đọng thành giọt tròn rồi lăn đi.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Ảnh mới chọn ảnh ngang (thẻ ba lựa chọn 5:2), trừ ảnh câu q2 và thẻ thưởng.
- **Ảnh cần tìm (năm):** xương rồng trên đồi cát (Học); khóm lúa non trên ruộng ngập; bèo tây có hoa; xương rồng nhỏ trong chậu (q2); lá sen có giọt nước (thẻ).
- **Ảnh khó:** xương rồng mọc hoang trên đồi cát Việt Nam có giấy phép (nếu không có, ảnh xương rồng trên cát nơi khác, không thấy chữ, biển, người; báo lại để biên tập bỏ chữ "Ninh Thuận" ở ghi chú).
- **q4 (`order_sequence`):** đồi cát, rừng dương xỉ, ao cùng cắt vuông.
- **Dùng lại:** bài một (`bamboo_card`), bài ba (`tray_stick`), bài bốn (`explore_mangrove`, `q4_dunes`); chủ đề *Gọi tên và nhóm động vật* (`w1`, `w1_lotus`, `explore_wild`, `tray_perch`, `q1` ao làng); *Khủng long* (`tray_fern`, `q2_ferns`).
- **Màu:** Học: ở ao `cham`, đồi cát `vang_hoe`, bùn nước mặn `nau_dat`, chỗ râm `gi_dong`. Chơi: ao `cham`, ruộng lúa `vang_hoe`, bùn nước mặn `nau_dat`, không mọc trong nước `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (dry, wet). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Đúng). Quiz `single_choice` (q1, q3, q5), `true_false` (q2 Sai, q6 Sai), `order_sequence` (q4). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`plants_grow_anywhere`).
- **Vị trí đáp án đúng:** hết hiệu lực 15/11 (SK-047, app xáo lựa chọn và thẻ xếp thứ tự). q4 thứ tự đúng: đồi cát, rừng râm mát, ao.
- **Màn Chơi, ví dụ để kiểm:** Hoa sen, Cây lúa, Cây đước → `balanced`; Bèo tây, Cây lúa, Cây dương xỉ → `has_limited`; Hoa sen, Bèo tây, Cây lúa → `missing.tray_salty`.
- **Từ EN có thể ngoài Starters/Movers:** habitat, cactus, fern, mangrove, water hyacinth, lotus, shade, damp, salty, spines, moss.
