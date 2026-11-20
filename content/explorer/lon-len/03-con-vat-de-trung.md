---
id: 2701ecdf-b49c-4118-825c-238647c98758
topic: lon-len
slug: con-vat-de-trung
order: 3
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Animals that lay eggs
vi: Con vật đẻ trứng
> Giữ đúng tên ở `content/syllabus.json` (key `new-life`, bài số ba, `extension: true`).

## Mục tiêu
en: I can order a hen's life cycle.
vi: Em xếp được vòng đời của con gà.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 18/11/2026. Ticket SK-053. Mọi dòng `id:` để trống; chạy `ids` sau bài 2 (Khởi động w2 trỏ bài 2).
> Ticket ghi "I can put the life cycle of a hen in order." (mười một từ); rút còn bảy từ. Câu VI giữ đúng ticket.
> Bài mở rộng (`extension: true`, SK-053 quyết định 3): ý lấy từ Oak Y2 *New life* L3 (vòng đời gà, trứng nở ra con non nhỏ), không gắn slug Oak. Không chép câu, hình, ví dụ của sườn.
> Ranh giới (SK-053): *Gọi tên và nhóm động vật* bài 3 đã dạy "chim đẻ trứng, phần lớn bò sát cũng vậy", rùa đẻ trứng trong cát; bài 4 cá, ếch đẻ trứng trong nước. Bài này nhắc lại ở Khởi động w1 và ô Lay eggs; phần mới là **nở ra, con non nhỏ, lớn lên rồi lại đẻ trứng**. Không dùng lại câu q4 "How does a hen grow? Tap in order." (trứng, gà con, gà mái) của bài 3 chủ đề đó: câu xếp thứ tự ở đây là con vịt.
> Cá chỉ nói "nhiều loài cá đẻ trứng" (SK-053). Không trứng ăn ở nhà, không trứng có phôi, không ấp máy.

## Ý chính
1.en: Hens, ducks, turtles and many fish lay eggs.
1.vi: Gà, vịt, rùa và nhiều loài cá đẻ trứng.
2.en: A chick hatches from an egg.
2.vi: Gà con nở ra từ quả trứng.
3.en: Some chicks grow into hens and lay eggs.
3.vi: Có gà con lớn lên thành gà mái, rồi lại đẻ trứng.
> Lệch chữ "Bảng soạn": ý một thêm "many" trước "fish" · "nhiều loài" trước "cá" (ticket buộc chỉ nói "nhiều loài cá đẻ trứng"), vừa tám từ. Ý ba "The chick grows into a hen." · "Gà con lớn thành gà mái, lại đẻ trứng." viết thành một câu tám từ có "Some" · "Có gà con": giữ ý vòng (lớn lên **rồi** lại đẻ trứng) mà không nói gà con nào cũng thành gà mái (có con thành gà trống). Sửa theo tester N3, 19/11 (bản trước tách hai câu làm mất ý vòng).

## Khởi động

> Hai câu. w1 ôn *Gọi tên và nhóm động vật* bài 3 (chim đẻ trứng), theo SK-053; câu mới, khác "Which one lays eggs?" (bài 4 w1 của chủ đề đó). w2 ôn bài 2 hôm trước (nghé lớn thành trâu).

### w1
id: e402a7cb-34af-4aec-8f68-c049cf834c57
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/chim-va-bo-sat
prompt.en: A sparrow lays eggs.
prompt.vi: Chim sẻ đẻ trứng.
image.brief: Dùng lại hình `tray_sparrow` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow on a branch
image.alt.vi: Chim sẻ đậu trên cành
answer: true
hint.en: Think of what birds do in a nest.
hint.vi: Em nghĩ xem chim làm gì trong tổ nhé.
explanation_correct.en: Yes! Birds lay eggs in their nests.
explanation_correct.vi: Đúng rồi! Chim đẻ trứng trong tổ.
explanation_wrong.en: This is true. Every bird lays eggs.
explanation_wrong.vi: Câu này đúng. Loài chim nào cũng đẻ trứng.
feedback_false.en: A sparrow is a bird. Birds lay eggs.
feedback_false.vi: Chim sẻ là chim. Chim đẻ trứng.
> [CẦN KIỂM] Mọi loài chim đều đẻ trứng; chim sẻ làm tổ, đẻ trứng trong tổ.

### w2
id: 60517ec0-004f-4382-a6bb-9b97e683b94e
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: lon-len/con-vat-de-con
prompt.en: Which baby grows into a buffalo?
prompt.vi: Con non nào lớn lên thành con trâu?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of what a buffalo mum looks like.
hint.vi: Em nghĩ xem trâu mẹ trông thế nào nhé.
explanation_correct.en: Yes! A calf grows into a buffalo.
explanation_correct.vi: Đúng rồi! Nghé lớn lên thành con trâu.
explanation_wrong.en: The answer is the calf, a baby buffalo.
explanation_wrong.vi: Đáp án là con nghé, tức trâu con.

#### option w2_calf
correct: true
label.en: calf
label.vi: con nghé
image.brief: Dùng lại hình `q3` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): water buffalo calf standing field
image.alt.en: A calf in a field
image.alt.vi: Con nghé trên đồng cỏ
> `alt` riêng ở chỗ này (`alt` gốc "A baby buffalo in a field" có chữ "buffalo" của câu hỏi); ảnh, key giữ như hình gốc. Không dùng `explore_calf` của bài 2 vì ảnh đó có cả trâu mẹ.

#### option w2_piglets
correct: false
feedback.en: Piglets grow into big pigs.
feedback.vi: Lợn con lớn lên thành lợn to.
label.en: piglets
label.vi: lợn con
image.brief: Dùng lại hình `explore_piglets` ở bài `lon-len/con-vat-de-con`. Từ khoá tìm ảnh (EN): piglets nursing sow
image.alt.en: Piglets drinking milk
image.alt.vi: Đàn lợn con đang bú

## Học

> Bốn ô: ổ trứng (ô nhắc lại "nhiều con vật đẻ trứng"), gà con nở ra, gà con lớn lên rồi gà mái lại đẻ trứng, vịt con và rùa con cũng nở từ trứng. Ô Hatch sửa trước `egg_hatches_adult` (ví dụ "the chick is tiny").

### explore
id: c0c6c0f5-bd55-4e85-b11c-7db087bf51c7
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_lay
label.en: Lay eggs
label.vi: Đẻ trứng
color: nau_dat
sentence.en: Hens, ducks, turtles and many fish lay eggs.
sentence.vi: Gà, vịt, rùa và nhiều loài cá đẻ trứng.
image.brief: Dùng lại hình `explore_eggs` ở bài `goi-ten-va-nhom-dong-vat/chim-va-bo-sat`. Từ khoá tìm ảnh (EN): hen eggs straw nest
image.alt.en: Eggs in a nest of straw
image.alt.vi: Trứng trong ổ rơm
examples.1.en: ducks lay eggs near the pond
examples.1.vi: vịt đẻ trứng gần bờ ao
examples.2.en: sea turtles lay eggs in sand
examples.2.vi: rùa biển đẻ trứng trong cát
examples.3.en: many fish lay eggs in water
examples.3.vi: nhiều loài cá đẻ trứng trong nước
> Ô nhắc lại ý đã dạy ở *Gọi tên và nhóm động vật* bài 3, 4 (một câu Học, SK-053). Ví dụ khác ví dụ ô Eggs của bài đó ("a hen lays eggs in straw", "a turtle lays eggs in sand").
> [CẦN KIỂM] Rùa biển lên bờ đẻ trứng trong cát; nhiều loài cá (cá chép, cá rô) đẻ trứng trong nước.

#### group explore_hatch
label.en: Hatch
label.vi: Nở
color: vang_hoe
sentence.en: A chick hatches from an egg.
sentence.vi: Gà con nở ra từ quả trứng.
image.brief: [ảnh] Một chú gà con đang chui ra từ quả trứng đã nứt, thấy đầu và một phần thân, lông còn ướt, vỏ trứng vỡ quanh; chụp gần trên rơm hay nền trơn; không máu, không tay người, không máy ấp có chữ, không chữ. Ảnh ngang có khoảng trống (khung vuông ô Học, khung 4:3 câu q2, thẻ từ 2:1). Từ khoá tìm ảnh (EN): chick hatching from egg; chicken egg hatching; chick breaking shell
image.alt.en: A chick coming out of its shell
image.alt.vi: Gà con đang chui ra khỏi vỏ trứng
examples.1.en: the chick pecks the shell
examples.1.vi: gà con mổ vỡ vỏ trứng
examples.2.en: its feathers are wet at first
examples.2.vi: lúc đầu lông còn ướt
examples.3.en: the chick is tiny, not a hen
examples.3.vi: gà con bé xíu, chưa phải gà mái
> Ví dụ ba sửa trước `egg_hatches_adult` (câu q6).
> [CẦN KIỂM] Gà con tự mổ vỏ chui ra; lúc mới nở lông ướt, vài giờ sau khô và xốp.
> Ảnh thật (designer 19/11, SK-053 mục 10): gà con ướt đang chui ra khỏi vỏ giữa nhiều trứng và gà con vừa nở, trong lò ấp; không máu, không lộ phôi. Đã rà: chữ bé nghe không nói "gà mẹ ấp", "ổ rơm" hay nơi nở, chỉ nói gà con tự mổ vỏ; giữ chữ, giữ `alt`. Ảnh lệch dòng "không ấp máy" ở đầu bài (designer đã kiểm: không chữ, không logo); PM xem có chấp nhận không.
> Lượt 2 (19/11): phiên chính nhận cảnh lò ấp (tester B4); designer cắt khung ô Học vào một gà con ướt đang chui khỏi vỏ nứt (thấy mỏ, lông ướt), câu q2 có khung 4:3 riêng cùng cảnh, nên `alt` số ít "A chick coming out of its shell" và gợi ý q2 "Look at the shell and the beak." khớp. Thẻ từ `hatch` (2:1) còn lộ đầu một gà con khác ở mép phải; `alt` số ít vẫn đúng với con chính giữa. Không sửa chữ.

#### group explore_grow
label.en: Grow up
label.vi: Lớn lên
color: gi_dong
sentence.en: Some chicks grow into hens and lay eggs.
sentence.vi: Có gà con lớn lên thành gà mái, rồi lại đẻ trứng.
image.brief: Dùng lại hình `explore_animals` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): hen with chicks pecking yard
image.alt.en: A hen and chicks looking for food
image.alt.vi: Gà mẹ và gà con tìm thức ăn
examples.1.en: fluffy chicks follow the hen
examples.1.vi: gà con lông tơ theo gà mẹ
examples.2.en: they grow feathers
examples.2.vi: gà con mọc lông vũ
examples.3.en: some chicks grow into roosters
examples.3.vi: có gà con lớn lên thành gà trống
> Ý chính ba và ý "vòng" của bài 1: gà con lớn thành gà mái, rồi lại đẻ trứng. "Some" ở câu chính và ví dụ ba ("some chicks grow into roosters") giữ cho đúng: không phải gà con nào cũng thành gà mái.

#### group explore_ducklings
label.en: Ducklings
label.vi: Vịt con
color: cham
sentence.en: Ducklings and baby turtles hatch, too.
sentence.vi: Vịt con, rùa con cũng nở ra từ trứng.
image.brief: [ảnh] Một đàn vịt con lông tơ vàng (vịt nhà) đứng hay bơi gần nhau, chụp ngang tầm thấp thấy rõ cả đàn; không có vịt mẹ trong khung (hoặc chỉ thấy mép), không người, không hộp hay lồng có chữ, không chữ. Khác rõ ảnh gà con `w1_chick` (đàn nhiều con, mỏ dẹt). Ảnh ngang có khoảng trống (khung vuông ô Học, món Chơi, thẻ `order_sequence`; thẻ ba lựa chọn 5:2; thẻ hai lựa chọn 17:10 câu w2 bài 4; khung 4:3 câu q3; thẻ từ 2:1). Hình gốc của cả chủ đề. Từ khoá tìm ảnh (EN): ducklings; domestic ducklings group; yellow ducklings water
image.alt.en: A group of fluffy ducklings
image.alt.vi: Đàn vịt con lông tơ
examples.1.en: ducklings swim soon after hatching
examples.1.vi: vịt con nở ra chẳng bao lâu đã biết bơi
examples.2.en: baby sea turtles crawl to the sea
examples.2.vi: rùa biển con bò ra biển
examples.3.en: baby fish are very small
examples.3.vi: cá con nở ra bé xíu
> [CẦN KIỂM] Vịt con nở ra vài ngày đã biết bơi, đi theo mẹ; rùa biển con tự bò ra biển, không có mẹ chăm; cá con mới nở rất nhỏ.
> Ảnh thật (designer 19/11, SK-053 mục 3): đàn vịt con (vịt xiêm) lông vàng đầu nâu, chụp gần trong hộp, không có cỏ, không có nước. `alt` gốc "A group of fluffy ducklings" đúng, giữ. Đã rà mọi chỗ dùng ảnh này ở bài 3: không `alt` nào nhắc cỏ hay nước; ví dụ "ducklings swim soon after hatching" và câu ví dụ từ `duckling` ("The ducklings swim after their mum.") là ý chung, không tả ảnh. `alt` riêng ở bài 4 w2 đã bỏ "on the grass".

### new_words
id: 048f6fc3-6188-4fef-900f-0f84a990845c
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: egg, hatch

## Chơi

> Bé chọn ba con non nở ra từ trứng: một chim non (gà con hoặc vịt con), một rùa con, một cá con. Đạt khi đủ ba nhóm và không chọn con non do mẹ đẻ ra.
> Món bẫy: mèo con và lợn con (do mẹ đẻ ra, bú sữa; ý bài 2). Kệ sáu món, toàn ảnh chụp.

### tray
id: faba73e2-c513-44c0-b0bb-703998fad02a
type: build_tray
version: 1
prompt.en: Babies from eggs
prompt.vi: Con non nở từ trứng
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find a baby bird, turtle and fish.
messages.start.vi: Em tìm một chim non, một rùa con và một cá con nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! All three hatched from eggs.
messages.balanced.vi: Tuyệt! Cả ba đều nở ra từ trứng.
messages.has_limited.en: That baby was born, not hatched.
messages.has_limited.vi: Con non này do mẹ đẻ ra.
messages.missing.tray_bird.en: You still need a baby bird.
messages.missing.tray_bird.vi: Em còn thiếu một chim non.
messages.missing.tray_turtle.en: You still need a baby turtle.
messages.missing.tray_turtle.vi: Em còn thiếu một rùa con.
messages.missing.tray_fish.en: You still need a baby fish.
messages.missing.tray_fish.vi: Em còn thiếu một cá con.
> Lời nhắn `has_limited` đúng với cả hai món bẫy (mèo con, lợn con).

#### group tray_bird
label.en: Baby bird
label.vi: Chim non
color: vang_hoe
role: required

#### group tray_turtle
label.en: Baby turtle
label.vi: Rùa con
color: nau_dat
role: required

#### group tray_fish
label.en: Baby fish
label.vi: Cá con
color: cham
role: required

#### group tray_mum
label.en: Born, not hatched
label.vi: Mẹ đẻ ra
color: do_son
role: limit

#### item tray_chick
label.en: Chick
label.vi: Gà con
group: tray_bird
image.brief: Dùng lại hình `w1_chick` ở bài `goi-ten-va-nhom-dong-vat/chim-va-bo-sat`. Từ khoá tìm ảnh (EN): yellow chick standing ground side view
image.alt.en: A yellow chick
image.alt.vi: Gà con lông vàng

#### item tray_kitten
label.en: Kitten
label.vi: Mèo con
group: tray_mum
image.brief: Dùng lại hình `q4` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): kitten sitting floor looking up
image.alt.en: A kitten looking up
image.alt.vi: Mèo con ngẩng đầu nhìn lên

#### item tray_turtles
label.en: Baby sea turtles
label.vi: Rùa biển con
group: tray_turtle
image.brief: [ảnh] Vài chú rùa biển con mới nở bò trên cát về phía biển, chụp thấp gần mặt cát, thấy rõ mai nhỏ và chân chèo; không người, không tay, không biển báo, không chữ. Ảnh ngang có khoảng trống (món Chơi vuông, thẻ ba lựa chọn 5:2 câu q5). Từ khoá tìm ảnh (EN): sea turtle hatchlings beach; Chelonia mydas hatchlings; baby sea turtles crawling sand
image.alt.en: Baby turtles on the sand
image.alt.vi: Rùa con bò trên cát
> Gọi "sea turtle" · "rùa biển" như *Những nơi sống trên Trái Đất* bài 5 (khác "turtle" · "con rùa" nước ngọt của chủ đề số một).

#### item tray_ducklings
label.en: Ducklings
label.vi: Vịt con
group: tray_bird
image.brief: Dùng lại hình `explore_ducklings`. Từ khoá tìm ảnh (EN): ducklings
image.alt.en: A group of fluffy ducklings
image.alt.vi: Đàn vịt con lông tơ

#### item tray_piglets
label.en: Piglets
label.vi: Lợn con
group: tray_mum
image.brief: Dùng lại hình `explore_piglets` ở bài `lon-len/con-vat-de-con`. Từ khoá tìm ảnh (EN): piglets nursing sow
image.alt.en: Piglets drinking milk
image.alt.vi: Đàn lợn con đang bú

#### item tray_fry
label.en: Baby fish
label.vi: Cá con
group: tray_fish
image.brief: [ảnh] Một đàn cá con nhỏ xíu bơi trong nước trong (ưu tiên cá chép con), chụp gần thấy rõ mắt và thân nhỏ; loài đẻ trứng, không phải loài cá đẻ con; không bể có nhãn hiệu, không tay, không chữ. Ảnh vuông hoặc ngang (món Chơi vuông). Từ khoá tìm ảnh (EN): carp fry; fish fry swimming; baby fish shoal
image.alt.en: Tiny baby fish in water
image.alt.vi: Đàn cá con nhỏ xíu dưới nước
> Ảnh khó: cá con phải trông khác ảnh cá lớn và khác nòng nọc. Người chọn ảnh ghi loài; không có ảnh hợp lệ thì báo content-editor (phương án thay: bỏ nhóm Cá con, đổi thành nhóm Rắn con hay Cá sấu con nếu có ảnh nở từ trứng).
> [CẦN KIỂM] Loài trong ảnh đẻ trứng.
> Ảnh thật (designer 19/11, SK-053 mục 11): cá hồi vân con (*Oncorhynchus mykiss*, loài đẻ trứng) trong bể ương, không phải cá chép. Đã rà: chữ bé nghe chỉ nói "baby fish" · "cá con", không nhắc cá chép; giữ chữ, giữ `alt`. "Cá chép, cá rô" chỉ còn ở dòng `[CẦN KIỂM]` ô Lay eggs (ví dụ loài đẻ trứng, không gắn ảnh).

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2 Đúng, q3 Sai, q6 Sai), `order_sequence` (q4, ba thẻ).
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính. Câu nào cũng tự đủ nghĩa khi chỉ nghe.

### q1
id: bcf408aa-1689-4a8c-87fe-d554c3988e32
format: single_choice
version: 1
dok: 1
prompt.en: Which baby hatched from an egg?
prompt.vi: Con non nào nở ra từ trứng?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of babies with feathers.
hint.vi: Em nghĩ tới con non có lông vũ nhé.
explanation_correct.en: Yes! Ducklings hatch from duck eggs.
explanation_correct.vi: Đúng rồi! Vịt con nở ra từ trứng vịt.
explanation_wrong.en: The answer is the ducklings. They hatched.
explanation_wrong.vi: Đáp án là đàn vịt con. Vịt con nở ra từ trứng.
> DOK 1: nhớ lại ô Ducklings. Hai lựa chọn sai là con non của động vật có vú, bé đã gặp ở bài 2 và chủ đề số một.

#### option q1_kitten
correct: false
feedback.en: A kitten drinks its mum's milk.
feedback.vi: Mèo con bú sữa mèo mẹ.
label.en: kitten
label.vi: mèo con
image.brief: Dùng lại hình `q4` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): kitten sitting floor looking up
image.alt.en: A kitten looking up
image.alt.vi: Mèo con ngẩng đầu nhìn lên

#### option q1_ducklings
correct: true
label.en: ducklings
label.vi: vịt con
image.brief: Dùng lại hình `explore_ducklings`. Từ khoá tìm ảnh (EN): ducklings
image.alt.en: A group of fluffy ducklings
image.alt.vi: Đàn vịt con lông tơ

#### option q1_calf
correct: false
feedback.en: A buffalo mum gives birth to a calf.
feedback.vi: Nghé do trâu mẹ đẻ ra.
label.en: calf
label.vi: con nghé
image.brief: Dùng lại hình `q3` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): water buffalo calf standing field
image.alt.en: A baby buffalo in a field
image.alt.vi: Nghé con trên đồng

### q2
id: 66e54ced-f53c-4d6d-a8fc-59680b822aee
format: true_false
version: 1
dok: 1
prompt.en: A chick pecks out of its egg.
prompt.vi: Gà con tự mổ vỏ để chui ra khỏi trứng.
image.brief: Dùng lại hình `explore_hatch`. Từ khoá tìm ảnh (EN): chick hatching from egg
image.alt.en: A chick coming out of its shell
image.alt.vi: Gà con đang chui ra khỏi vỏ trứng
answer: true
hint.en: Look at the shell and the beak.
hint.vi: Em nhìn vỏ trứng và cái mỏ nhé.
explanation_correct.en: Yes! Its tiny beak breaks the shell.
explanation_correct.vi: Đúng rồi! Cái mỏ nhỏ xíu mổ vỡ vỏ trứng.
explanation_wrong.en: This is true. The chick breaks the shell.
explanation_wrong.vi: Câu này đúng. Gà con tự mổ vỡ vỏ.
feedback_false.en: The chick cracks the shell by itself.
feedback_false.vi: Gà con tự mổ vỡ vỏ trứng.
> DOK 1: nhớ lại ví dụ một ô Hatch.

### q3
id: 62777e02-a57c-479a-8e12-8b337d323b3a
format: true_false
version: 1
dok: 1
prompt.en: Ducklings drink milk from their mum.
prompt.vi: Vịt con bú sữa vịt mẹ.
image.brief: Dùng lại hình `explore_ducklings`. Từ khoá tìm ảnh (EN): ducklings
image.alt.en: A group of fluffy ducklings
image.alt.vi: Đàn vịt con lông tơ
answer: false
hint.en: Remember how ducklings start their life.
hint.vi: Em nhớ xem vịt con bắt đầu cuộc đời thế nào nhé.
explanation_correct.en: Ducklings hatch from eggs. They peck at food.
explanation_correct.vi: Vịt con nở ra từ trứng, rồi tự mổ thức ăn.
explanation_wrong.en: This is false. Ducklings hatch from eggs.
explanation_wrong.vi: Câu này sai. Vịt con nở ra từ trứng.
feedback_true.en: Ducklings hatch from eggs, like chicks.
feedback_true.vi: Vịt con nở ra từ trứng, như gà con.
> DOK 1: phân biệt với bài 2 (con non bú sữa). `explanation_correct` đứng một mình được.
> [CẦN KIỂM] Vịt con mới nở tự mổ thức ăn, không bú; chim không cho con bú sữa (bỏ qua "sữa diều" của chim bồ câu, ngoài phạm vi).

### q4
id: 5180ac35-4cc4-4697-89dd-e438f9020a9a
format: order_sequence
version: 1
dok: 2
prompt.en: Start with the duck eggs. Put them in order.
prompt.vi: Bắt đầu từ những quả trứng vịt. Em xếp theo thứ tự nhé.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_egg, q4_ducklings, q4_duck
hint.en: A grown duck is the biggest.
hint.vi: Vịt lớn là to nhất.
explanation_correct.en: Yes! Ducklings grow into ducks.
explanation_correct.vi: Đúng rồi! Vịt con lớn lên thành vịt.
explanation_wrong.en: The order is egg, ducklings, then duck.
explanation_wrong.vi: Thứ tự là trứng vịt, vịt con, rồi vịt lớn.
> DOK 2: xếp ba chặng của vịt, bắt đầu từ trứng. Khác câu q4 của *Gọi tên và nhóm động vật* bài 3 (trứng gà, gà con, gà mái): đổi sang vịt theo SK-053. Gợi ý chỉ nhắc một đầu. Thẻ trong file không theo thứ tự đúng.
> Ba thẻ là ảnh chụp (cùng kiểu).

#### item q4_duck
label.en: duck
label.vi: vịt lớn
image.brief: [ảnh] Một con vịt mái lông nâu đốm, mỏ vàng cam, chân cam, đang bước trên bờ ao nền cát; vài con vịt bơi mờ phía sau; không chữ, không người. Ảnh mới chỉ dùng ở câu này (19/11, thay hình `w1_duck` của *Gọi tên và nhóm động vật* bài 1 theo tester c3: lông nâu nối liền với vịt con lông vàng đầu nâu hơn vịt xám). Thẻ `order_sequence` vuông. Từ khoá tìm ảnh (EN): brown duck pond bank; female mallard walking; Anas platyrhynchos female
image.alt.en: A brown duck by the pond
image.alt.vi: Con vịt lông nâu bên bờ ao
> Ảnh là vịt trời mái (*Anas platyrhynchos*, tổ tiên vịt nhà), không cùng giống với vịt con (vịt xiêm) và trứng vịt; chữ chỉ nói "duck" · "vịt lớn", không nói cùng một con. `alt` cũ "A duck standing on the grass" · "Con vịt đứng trên bãi cỏ" lệch ảnh (bờ ao, nền cát).

#### item q4_egg
label.en: duck eggs
label.vi: trứng vịt
image.brief: [ảnh] Ba, bốn quả trứng vịt màu trắng hay xanh nhạt nằm trong ổ rơm hay trên nền trơn, chụp gần; trứng còn nguyên, không trứng vỡ, không trứng luộc, không tay, không số hay chữ viết trên trứng, không khay có nhãn. Ảnh vuông (thẻ `order_sequence`). Từ khoá tìm ảnh (EN): duck eggs nest; duck eggs straw; domestic duck eggs
image.alt.en: Duck eggs in a nest
image.alt.vi: Trứng vịt trong ổ

#### item q4_ducklings
label.en: ducklings
label.vi: vịt con
image.brief: Dùng lại hình `explore_ducklings`. Từ khoá tìm ảnh (EN): ducklings
image.alt.en: A group of fluffy ducklings
image.alt.vi: Đàn vịt con lông tơ

### q5
id: 575c7086-e629-4da4-81dd-9e7f778daf31
format: single_choice
version: 1
dok: 2
prompt.en: Which baby starts in an egg, too?
prompt.vi: Còn con non nào nở ra từ trứng nữa?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Remember the eggs in the sand.
hint.vi: Em nhớ lại những quả trứng trong cát nhé.
explanation_correct.en: Yes! Baby turtles hatch from eggs in sand.
explanation_correct.vi: Đúng rồi! Rùa con nở ra từ trứng trong cát.
explanation_wrong.en: The answer is the baby turtles. They hatched.
explanation_wrong.vi: Đáp án là rùa con. Rùa con nở ra từ trứng.
> DOK 2: xếp một con vật không phải chim (rùa) vào nhóm "nở từ trứng", so với hai con non bú sữa. `prompt.vi` hỏi "Còn con non nào … nữa?" cho khớp "too" của câu EN; bản trước "Con non nào cũng …" nghe như lời khẳng định mọi con non nở từ trứng (tester C1, 19/11). Đáp án là ảnh bé gặp ở kệ Chơi hôm nay; hai lựa chọn sai là ảnh bài 2 và chủ đề số một.

#### option q5_piglets
correct: false
feedback.en: A pig mum gives birth to piglets.
feedback.vi: Lợn con do lợn mẹ đẻ ra.
label.en: piglets
label.vi: lợn con
image.brief: Dùng lại hình `explore_piglets` ở bài `lon-len/con-vat-de-con`. Từ khoá tìm ảnh (EN): piglets nursing sow
image.alt.en: Piglets drinking milk
image.alt.vi: Đàn lợn con đang bú

#### option q5_turtles
correct: true
label.en: baby sea turtles
label.vi: rùa biển con
image.brief: Dùng lại hình `tray_turtles`. Từ khoá tìm ảnh (EN): sea turtle hatchlings beach
image.alt.en: Little turtles on the sand
image.alt.vi: Rùa con bò trên cát
> `alt.en` riêng 19/11 (tester c7): `alt` gốc "Baby turtles on the sand" có chữ "baby" của câu hỏi; `alt.vi` không có chữ "con non" của câu hỏi nên giữ. Ảnh, key giữ như hình gốc.

#### option q5_kitten
correct: false
feedback.en: A cat mum gives birth to kittens.
feedback.vi: Mèo con do mèo mẹ đẻ ra.
label.en: kitten
label.vi: mèo con
image.brief: Dùng lại hình `q4` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): kitten sitting floor looking up
image.alt.en: A kitten looking up
image.alt.vi: Mèo con ngẩng đầu nhìn lên

### q6
id: 17db6d74-5170-47ba-a810-b9f219c25f46
format: true_false
version: 1
dok: 2
misconception: egg_hatches_adult
prompt.en: A big hen hatches out of an egg.
prompt.vi: Từ quả trứng nở ra ngay con gà mái to.
image.brief: Dùng lại hình `explore_eggs` ở bài `goi-ten-va-nhom-dong-vat/chim-va-bo-sat`. Từ khoá tìm ảnh (EN): hen eggs straw nest
image.alt.en: Eggs in a nest of straw
image.alt.vi: Trứng trong ổ rơm
answer: false
hint.en: Think of how big an egg is.
hint.vi: Em nghĩ xem quả trứng to cỡ nào nhé.
explanation_correct.en: A small chick hatches from an egg.
explanation_correct.vi: Từ quả trứng nở ra một chú gà con bé xíu.
explanation_wrong.en: This is false. A tiny chick hatches.
explanation_wrong.vi: Câu này sai. Trứng nở ra gà con bé xíu.
feedback_true.en: An egg is too small for a hen.
feedback_true.vi: Quả trứng nhỏ, không vừa con gà mái.
> Câu misconception (`egg_hatches_adult`), DOK 2: bé nghĩ "trứng gà nở ra gà" (gà mái) sẽ chạm Đúng. Bé áp ô Hatch và ô Grow up (gà con lớn dần) để bác.
> Hình là ổ trứng (vật bé phải nghĩ tới), không gà con, không gà mái; không tự làm bằng chứng. `explanation_correct` là đúng câu `correction` ở `_topic.md`.

## Từ vựng

### egg
id: b7ba7420-0a9c-45b5-bd5c-9e1544801397
tier: core
term.en: egg
term.vi: quả trứng
example.en: A turtle lays its eggs in the sand.
example.vi: Rùa đẻ trứng trong cát.
image.brief: Dùng lại hình `explore_eggs` ở bài `goi-ten-va-nhom-dong-vat/chim-va-bo-sat`. Từ khoá tìm ảnh (EN): hen eggs straw nest
image.alt.en: Eggs in a nest of straw
image.alt.vi: Trứng trong ổ rơm
> Trùng có chủ ý: `egg` là từ `extra` ở *Gọi tên và nhóm động vật* bài 3; nâng lên `core` ở bài này (chặng đầu của vòng đời).

### hatch
id: 022bf879-91db-4295-8cda-7eb40f6a1e35
tier: core
term.en: hatch
term.vi: nở
example.en: The chick hatches from its egg.
example.vi: Gà con nở ra từ quả trứng.
image.brief: Dùng lại hình `explore_hatch`. Từ khoá tìm ảnh (EN): chick hatching from egg
image.alt.en: A chick coming out of its shell
image.alt.vi: Gà con đang chui ra khỏi vỏ trứng

### chick
id: 65eb0dc7-39bc-4cf4-961f-532a3677a875
tier: extra
term.en: chick
term.vi: gà con
example.en: A chick has soft yellow feathers.
example.vi: Gà con có bộ lông tơ vàng mềm.
image.brief: Dùng lại hình `w1_chick` ở bài `goi-ten-va-nhom-dong-vat/chim-va-bo-sat`. Từ khoá tìm ảnh (EN): yellow chick standing ground side view
image.alt.en: A yellow chick
image.alt.vi: Gà con lông vàng

### duckling
id: 79ae5323-2f7d-4c8a-ae67-eaaaef2c5da7
tier: extra
term.en: duckling
term.vi: vịt con
example.en: The ducklings swim after their mum.
example.vi: Đàn vịt con bơi theo vịt mẹ.
image.brief: Dùng lại hình `explore_ducklings`. Từ khoá tìm ảnh (EN): ducklings
image.alt.en: A group of fluffy ducklings
image.alt.vi: Đàn vịt con lông tơ

## Thưởng

### duck_card
id: b8b9e713-8159-448d-92f6-c3e4bf535349
set: life_cycles
rarity: common
name.en: Duck
name.vi: Con vịt
tag.en: Hatches, then swims
tag.vi: Nở ra là tập bơi
fact.en: A duck's feathers keep the water out.
fact.vi: Lông vịt không thấm nước.
image.brief: Dùng lại hình `w1_duck` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): duck standing pond bank
image.alt.en: A duck standing on the grass
image.alt.vi: Con vịt đứng trên bãi cỏ
> Bộ `set: life_cycles`. Không trùng thẻ đã có (`sea_turtle_card` ở *Những nơi sống trên Trái Đất* bài 5, nên không làm thẻ rùa biển).
> [CẦN KIỂM] Lông vịt có lớp dầu nên không thấm nước.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Không hình tự vẽ, không hình ghép. Không trứng vỡ có lòng đỏ, không trứng có phôi, không trứng luộc, không trứng lộn, không máy ấp có chữ.
- **Ảnh mới, hình gốc của cả chủ đề (giữ đúng key, `alt`, truy vấn đầu ở `_topic.md`):** đàn vịt con (`explore_ducklings`; bài 4 w2 dùng lại).
- **Ảnh mới chỉ dùng ở bài này:** gà con đang chui ra khỏi trứng (`explore_hatch`; ảnh đã chọn: trong lò ấp), rùa biển con trên cát (`tray_turtles`), cá con (`tray_fry`; ảnh đã chọn: cá hồi vân con, đẻ trứng), trứng vịt (`q4_egg`), vịt mái lông nâu bên bờ ao (`q4_duck`, thêm 19/11 theo tester c3).
- **Ảnh dùng lại:** *Gọi tên và nhóm động vật* bài 1 `w1` (hàng rào tre), `explore_animals` (ô Grow up), `q4` mèo con (món Chơi, q1, q5), `w1_duck` (thẻ thưởng; q4 đổi sang ảnh mới `q4_duck` 19/11), bài 2 `q3` nghé (w2 `alt` riêng, q1), bài 3 `explore_eggs` (ô Lay eggs, q6, từ `egg`), `w1_chick` (món Chơi, từ `chick`); bài 2 chủ đề này `explore_piglets` (w2, món Chơi, q5); Discoverer *Hô hấp* `tray_sparrow` (w1).
- **`alt` riêng:** w2 `w2_calf` dùng ảnh `q3` của *Gọi tên và nhóm động vật* bài 2 với `alt` "A calf in a field" · "Con nghé trên đồng cỏ"; q5 `q5_turtles` dùng `tray_turtles` với `alt.en` "Little turtles on the sand" (19/11, tester c7).
- **Ảnh khó:** cá con nhận ra được, đúng loài đẻ trứng; gà con nở không có máu, không lộ phôi; đàn vịt con không lẫn với gà con.
- **Màu:** Học: đẻ trứng `nau_dat`, nở `vang_hoe`, lớn lên `gi_dong`, vịt con `cham`. Chơi: chim non `vang_hoe`, rùa con `nau_dat`, cá con `cham`, mẹ đẻ ra `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (egg, hatch). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, sáu món. Khởi động `true_false` (w1 Đúng), `single_choice` hai lựa chọn (w2). Quiz `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2 Đúng, q3 Sai, q6 Sai), `order_sequence` (q4). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`egg_hatches_adult`). Không có `labels` ở câu `true_false`.
- **`order_sequence` q4:** thứ tự đúng `q4_egg`, `q4_ducklings`, `q4_duck`.
- **Màn Chơi, ví dụ để kiểm:** Gà con, Rùa biển con, Cá con → `balanced`; Vịt con, Rùa biển con, Cá con → `balanced`; Gà con, Vịt con, Cá con → `missing.tray_turtle`; Mèo con, Rùa biển con, Cá con → `has_limited`.
- **Khởi động trỏ:** w1 → `goi-ten-va-nhom-dong-vat/chim-va-bo-sat` (đã có id), w2 → `lon-len/con-vat-de-con` (chạy `ids` bài 2 trước).
- **Thưởng:** `set: life_cycles`.
- **Từ EN có thể ngoài Starters/Movers:** hatch, chick, duckling, sea turtle, rooster, sparrow, feathers, shell, pecks, calf, piglets.
