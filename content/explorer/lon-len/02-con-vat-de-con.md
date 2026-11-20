---
id: eff0c010-fc40-475e-b036-34744e57b9ea
topic: lon-len
slug: con-vat-de-con
order: 2
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Animals that give birth
vi: Con vật đẻ con
> Giữ đúng tên ở `content/syllabus.json` (key `new-life`, bài số hai).

## Mục tiêu
en: I can tell how babies grow up.
vi: Em kể được con non và em bé lớn lên thế nào.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 18/11/2026. Ticket SK-053. Mọi dòng `id:` để trống; chạy `ids` sau bài 1 (Khởi động w2 trỏ bài 1).
> Ticket ghi "I can tell how baby animals and people grow up." (mười từ); rút còn bảy từ. "Babies" trong tiếng Anh gọi cả con non lẫn em bé; câu VI giữ đúng ticket.
> Sườn: Oak Y2 *New life* L1 `young-animals` (con giống mẹ; có con không giống hệt mẹ) và L2 `growing-up` (con non lớn dần thành con trưởng thành); ví dụ người (em bé, trẻ em, người lớn, người già) lấy từ L3. Không chép câu, hình, ví dụ của sườn.
> Ranh giới (SK-053): *Gọi tên và nhóm động vật* bài 2 đã dạy "con non của động vật có vú bú sữa mẹ" và "trâu đẻ con, không đẻ trứng". Bài này nhắc lại ở Khởi động w1 và một câu Học (ô Milk); phần mới là **mẹ đẻ ra, rồi lớn dần qua các chặng**, cả ở người. Không dùng lại câu hỏi của bài đó.
> Cách nói về người: em bé "uống sữa" (không nói bú mẹ hay bú bình); không giả định bé có đủ bố mẹ (chỉ nói "người lớn", "ông bà" chung, "mẹ" của con vật). Không cảnh sinh nở, mang thai.

## Ý chính
1.en: Cat and pig mums give birth to babies.
1.vi: Mèo mẹ, lợn mẹ đẻ ra con.
2.en: Babies drink milk and grow up.
2.vi: Con non bú sữa rồi lớn lên.
3.en: People grow up, too.
3.vi: Người cũng lớn lên như vậy.
> Đúng chữ ở "Bảng soạn" SK-053, trừ ý một: "born from mum" không tự nhiên trong tiếng Anh nên viết lại thành "give birth to" (tester N6, 19/11). Từ cụ thể tới trừu tượng: lợn mẹ và đàn con, nghé bú sữa, mèo con lớn thành mèo, rồi người lớn lên qua các chặng.

## Khởi động

> Hai câu. w1 ôn *Gọi tên và nhóm động vật* bài 2 (con non bú sữa mẹ), theo SK-053; câu mới, khác "Which baby drinks milk?" (bài 3 w1 của chủ đề đó) và "A baby buffalo drinks milk." (bài 4 w3). w2 ôn bài 1 hôm trước (chặng già đi).

### w1
id: d3bc123f-0e43-4332-a659-89887c9f3209
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/dong-vat-co-vu
prompt.en: Which mum feeds her babies milk?
prompt.vi: Con mẹ nào cho con bú sữa?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of mums with soft fur.
hint.vi: Em nghĩ tới con mẹ có bộ lông mềm nhé.
explanation_correct.en: Yes! Kittens drink their mum's milk.
explanation_correct.vi: Đúng rồi! Mèo con bú sữa mèo mẹ.
explanation_wrong.en: The answer is the cat. Kittens drink milk.
explanation_wrong.vi: Đáp án là con mèo. Mèo con bú sữa mẹ.

#### option w1_cat
correct: true
label.en: cat
label.vi: con mèo
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

#### option w1_hen
correct: false
feedback.en: A hen finds seeds and bugs for chicks.
feedback.vi: Gà mẹ tìm thóc, tìm sâu cho gà con.
label.en: hen
label.vi: gà mái
image.brief: Dùng lại hình `w3_hen` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): brown hen standing farmyard side view
image.alt.en: A hen in a yard
image.alt.vi: Con gà mái trong sân
> [CẦN KIỂM] Gà mẹ bới tìm thóc, sâu bọ cho gà con; gà không có sữa.

### w2
id: 7d83f46c-e7af-48a2-97c8-dad9542dde6d
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: lon-len/vat-song-nao-cung-co-vong-doi
prompt.en: Which dog is old?
prompt.vi: Chú chó nào đã già?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look at the fur around the mouth.
hint.vi: Em nhìn lông quanh mõm nhé.
explanation_correct.en: Yes! Its face turned grey with age.
explanation_correct.vi: Đúng rồi! Lông quanh mõm bạc dần khi chó già đi.
explanation_wrong.en: The answer is the grey-faced dog.
explanation_wrong.vi: Đáp án là chú chó mõm bạc.

#### option w2_old
correct: true
label.en: old dog
label.vi: chó già
image.brief: Dùng lại hình `explore_old` ở bài `lon-len/vat-song-nao-cung-co-vong-doi`. Từ khoá tìm ảnh (EN): old dog grey muzzle
image.alt.en: A pet with a grey face
image.alt.vi: Con vật có mõm bạc
> `alt` riêng 19/11 (tester c7): `alt` gốc "A dog with a grey face" · "Chú chó có mõm bạc" có chữ "dog" · "chó" của câu hỏi; ảnh, key giữ như hình gốc.

#### option w2_puppies
correct: false
feedback.en: These puppies were just born.
feedback.vi: Mấy chú chó con này vừa mới sinh.
label.en: newborn puppies
label.vi: chó con mới sinh
image.brief: Dùng lại hình `explore_born` ở bài `lon-len/vat-song-nao-cung-co-vong-doi`. Từ khoá tìm ảnh (EN): newborn puppies
image.alt.en: Tiny puppies with closed eyes
image.alt.vi: Những chú chó con nhỏ xíu, mắt nhắm

## Học

> Bốn ô: lợn mẹ và đàn lợn con (mẹ đẻ ra), nghé bú sữa (ô nhắc lại ý của *Gọi tên và nhóm động vật* bài 2), mèo con lớn thành mèo (có con khác màu mẹ, ý Oak L1), người lớn lên qua bốn chặng.
> Ô People là hình tự vẽ (SK-053 quyết định 8), cùng nét với ba thẻ câu q4.

### explore
id: c937bca7-ced9-4ccc-9901-c6e11cf8587c
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_piglets
label.en: Mum gives birth
label.vi: Mẹ đẻ ra
color: nau_dat
sentence.en: A pig mum gives birth to piglets.
sentence.vi: Lợn mẹ đẻ ra đàn lợn con.
image.brief: [ảnh] Một con lợn mẹ nằm nghiêng trên rơm, một đàn lợn con hồng hay đen nằm sát bụng mẹ đang bú, chụp ngang trong chuồng sạch; không cảnh đang sinh, không máu, không người, không thẻ tai có chữ, không chữ. Ảnh ngang có khoảng trống (khung vuông ô Học và món Chơi, thẻ ba lựa chọn 5:2, thẻ hai lựa chọn 17:10, khung 4:3 câu q3, thẻ từ 2:1, thẻ thưởng vuông). Hình gốc của cả chủ đề. Từ khoá tìm ảnh (EN): piglets nursing sow; sow with piglets straw; piglets suckling
image.alt.en: Piglets drinking milk
image.alt.vi: Đàn lợn con đang bú
examples.1.en: kittens and puppies, too
examples.1.vi: mèo con, chó con cũng vậy
examples.2.en: a pig mum has many piglets
examples.2.vi: lợn mẹ đẻ được nhiều lợn con
examples.3.en: a buffalo mum has one calf
examples.3.vi: trâu mẹ thường đẻ một con nghé
> `alt` không có chữ "born", "mum", "baby" (ảnh là đáp án câu q1 "Which baby was born, not hatched?").
> [CẦN KIỂM] Lợn nái một lứa đẻ nhiều con; trâu thường đẻ một nghé mỗi lứa.

#### group explore_calf
label.en: Milk
label.vi: Bú sữa
color: vang_hoe
sentence.en: Babies drink milk and grow up.
sentence.vi: Con non bú sữa mẹ rồi lớn lên.
image.brief: [ảnh] Một con nghé đang bú trâu mẹ ngoài đồng hay bãi cỏ, chụp ngang thấy rõ nghé và trâu mẹ; không người, không dây thừng nổi bật, không chữ. Ảnh ngang có khoảng trống (khung vuông ô Học và món Chơi, khung 4:3 câu q2; bài 4 ô Like mum dùng lại). Hình gốc của cả chủ đề. Từ khoá tìm ảnh (EN): water buffalo calf suckling; water buffalo calf with mother; buffalo calf nursing
image.alt.en: A buffalo calf drinking milk
image.alt.vi: Nghé đang bú sữa
examples.1.en: a calf drinks its mum's milk
examples.1.vi: nghé bú sữa trâu mẹ
examples.2.en: then it eats grass, too
examples.2.vi: lớn hơn, nghé ăn thêm cỏ
examples.3.en: it grows into a big buffalo
examples.3.vi: nghé lớn lên thành con trâu
> Ô nhắc lại ý "con non bú sữa mẹ" của *Gọi tên và nhóm động vật* bài 2 (một câu Học, SK-053); phần mới là ví dụ hai, ba (lớn dần).
> Ảnh nên là trâu nước (*Bubalus bubalis*), không phải bò.

#### group explore_kittens
label.en: Kittens
label.vi: Mèo con
color: gi_dong
sentence.en: A kitten grows into a cat.
sentence.vi: Mèo con lớn lên thành mèo.
image.brief: [ảnh] Một mèo mẹ nằm hay ngồi cạnh ba, bốn mèo con đã mở mắt, mèo con khác màu lông nhau (vằn, trắng, đen, vàng), có con khác màu mẹ; chụp ngang trên chăn hay sàn nhà; không người, không vòng cổ có chữ, không chữ. Khác ảnh `explore_milk` của *Gọi tên và nhóm động vật* bài 2 (không cần cảnh đang bú). Ảnh ngang có khoảng trống (khung vuông ô Học và món Chơi, thẻ từ 2:1). Từ khoá tìm ảnh (EN): cat with kittens different colors; mother cat litter of kittens; kittens various colours
image.alt.en: A cat with her kittens on the grass
image.alt.vi: Mèo mẹ và đàn mèo con trên cỏ
examples.1.en: kittens look like small cats
examples.1.vi: mèo con trông như những chú mèo nhỏ
examples.2.en: some have a different colour from mum
examples.2.vi: có con khác màu lông mèo mẹ
examples.3.en: wash your hands after petting them
examples.3.vi: vuốt ve mèo xong, em rửa tay nhé
> Ví dụ hai là ý Oak L1 "có con không giống hệt mẹ" ở mức màu lông; bài 4 dạy ý "con non trông khác hẳn bố mẹ".
> Ví dụ ba là lời dặn rửa tay sau khi chạm con vật, một lần trong chủ đề (SK-053).
> [CẦN KIỂM] Một lứa mèo con có thể khác màu lông nhau và khác màu mèo mẹ.
> Ảnh thật (designer 19/11, SK-053 mục 2): mèo mẹ vằn xám nằm trên cỏ, ba mèo con lông đen đang bú; các con cùng màu nhau, khác màu mẹ. `alt` đổi từ "A cat with kittens of many colours" · "Mèo mẹ và đàn mèo con nhiều màu lông" (ở ô này, món `tray_litter`, từ `kitten`). Không câu bé nghe nào nói "nhiều màu".
> (Lịch sử, không còn hiệu lực) 19/11 lượt 2 (tester c6): ví dụ hai từng đổi thành "some kittens have mum's colour, some do not" · "có mèo con giống màu mẹ, có con thì khác". **Lượt 3 quay lại câu cũ** (dòng dưới); câu đang dùng là "some have a different colour from mum" · "có con khác màu lông mèo mẹ".
> Lượt 3 (19/11, tester c13): quay lại câu cũ "some have a different colour from mum" · "có con khác màu lông mèo mẹ". Ba mèo con đều sẫm màu, mèo mẹ vằn xám, nên nửa "có con giống màu mẹ" không thấy trong ảnh. Clip TTS cũ của câu này dùng lại được nếu chưa xoá.

#### group explore_humans
label.en: People
label.vi: Con người
color: cham
sentence.en: People grow up, too.
sentence.vi: Con người cũng lớn lên như vậy.
image.brief: [hình vẽ] Bốn người đứng hay ngồi thành một hàng từ nhỏ tới lớn, vẽ nghiêng hay từ phía sau, không vẽ nét mặt: một em bé mặc bộ quần áo liền thân đang bò, một bạn nhỏ mặc áo phông quần soóc, một người lớn, một người già tóc bạc lưng hơi còng; quần áo trơn, không chữ, không hình in; nền kem trơn; không mũi tên, không chữ, không nét viền; vẽ gần thực tế. Cùng nét, cùng nền với `q4_baby`, `q4_child`, `q4_adult`. Khung vuông ô Học.
image.alt.en: A baby, a child, a grown-up and a grandparent
image.alt.vi: Em bé, bạn nhỏ, người lớn và người già
examples.1.en: a baby drinks milk
examples.1.vi: em bé uống sữa
examples.2.en: a baby grows into a child
examples.2.vi: em bé lớn lên thành trẻ em
examples.3.en: a child grows into a grown-up
examples.3.vi: trẻ em lớn lên thành người lớn
examples.4.en: grown-ups grow old, like grandparents
examples.4.vi: người lớn rồi già đi, như ông bà
> Hình tự vẽ (SK-053 quyết định 8): ảnh người thật khó vừa không rõ mặt vừa cùng một kiểu. Vẽ đủ bộ bốn hình (ô này, cộng ba thẻ câu q4) để không thẻ đúng nào là hình vẽ duy nhất giữa ảnh chụp.
> Ví dụ một nói "em bé uống sữa", không nói bú mẹ hay bú bình (SK-053). Ví dụ bốn nói "ông bà" chung, không nói ông bà của em; không nói gì sau chặng già đi.
> [CẦN KIỂM] Chuỗi em bé → trẻ em → người lớn → người già với trẻ năm tới bảy tuổi.

### new_words
id: 038fb730-b3f4-4007-a5a0-41f4d8a98c0a
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: baby, adult

## Chơi

> Bé chọn ba con non bú sữa mẹ: một mèo con, một nghé, một lợn con. Đạt khi đủ ba nhóm và không chọn con non nở ra từ trứng.
> Món bẫy: gà con và nòng nọc, cũng là con non nhưng nở từ trứng, không bú sữa (nối sang bài 3, bài 4). Kệ bảy món, toàn ảnh chụp.

### tray
id: dee9a88e-02ec-47b6-bada-0827d70501b0
type: build_tray
version: 1
prompt.en: Babies that drink milk
prompt.vi: Con non bú sữa mẹ
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find a kitten, a calf and a piglet.
messages.start.vi: Em tìm một mèo con, một nghé và một lợn con nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! All three drink their mum's milk.
messages.balanced.vi: Tuyệt! Cả ba đều bú sữa mẹ.
messages.has_limited.en: That baby hatched from an egg.
messages.has_limited.vi: Con non này nở ra từ trứng.
messages.missing.tray_kitten.en: You still need a kitten.
messages.missing.tray_kitten.vi: Em còn thiếu một mèo con.
messages.missing.tray_calf.en: You still need a calf.
messages.missing.tray_calf.vi: Em còn thiếu một con nghé.
messages.missing.tray_piglet.en: You still need a piglet.
messages.missing.tray_piglet.vi: Em còn thiếu một lợn con.
> Lời nhắn `has_limited` đúng với cả hai món bẫy (gà con, nòng nọc).

#### group tray_kitten
label.en: Kitten
label.vi: Mèo con
color: gi_dong
role: required

#### group tray_calf
label.en: Calf
label.vi: Nghé
color: vang_hoe
role: required

#### group tray_piglet
label.en: Piglet
label.vi: Lợn con
color: nau_dat
role: required

#### group tray_egg
label.en: From an egg
label.vi: Nở từ trứng
color: do_son
role: limit

#### item tray_litter
label.en: Kittens
label.vi: Đàn mèo con
group: tray_kitten
image.brief: Dùng lại hình `explore_kittens`. Từ khoá tìm ảnh (EN): cat with kittens different colors
image.alt.en: A cat with her kittens on the grass
image.alt.vi: Mèo mẹ và đàn mèo con trên cỏ

#### item tray_chick
label.en: Chick
label.vi: Gà con
group: tray_egg
image.brief: Dùng lại hình `w1_chick` ở bài `goi-ten-va-nhom-dong-vat/chim-va-bo-sat`. Từ khoá tìm ảnh (EN): yellow chick standing ground side view
image.alt.en: A yellow chick
image.alt.vi: Gà con lông vàng

#### item tray_calf_milk
label.en: Calf
label.vi: Nghé
group: tray_calf
image.brief: Dùng lại hình `explore_calf`. Từ khoá tìm ảnh (EN): water buffalo calf suckling
image.alt.en: A buffalo calf drinking milk
image.alt.vi: Nghé đang bú sữa

#### item tray_kitten_up
label.en: Kitten
label.vi: Mèo con
group: tray_kitten
image.brief: Dùng lại hình `q4` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): kitten sitting floor looking up
image.alt.en: A kitten looking up
image.alt.vi: Mèo con ngẩng đầu nhìn lên

#### item tray_tadpoles
label.en: Tadpoles
label.vi: Nòng nọc
group: tray_egg
image.brief: Dùng lại hình `explore_tadpoles` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): tadpoles swimming shallow water
image.alt.en: Tadpoles in water
image.alt.vi: Nòng nọc dưới nước

#### item tray_piglets
label.en: Piglets
label.vi: Lợn con
group: tray_piglet
image.brief: Dùng lại hình `explore_piglets`. Từ khoá tìm ảnh (EN): piglets nursing sow
image.alt.en: Piglets drinking milk
image.alt.vi: Đàn lợn con đang bú

#### item tray_calf_field
label.en: Calf
label.vi: Nghé
group: tray_calf
image.brief: Dùng lại hình `q3` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): water buffalo calf standing field
image.alt.en: A baby buffalo in a field
image.alt.vi: Nghé con trên đồng

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2 Đúng, q3 Sai, q6 Sai), `order_sequence` (q4, ba thẻ hình vẽ).
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính. Câu nào cũng tự đủ nghĩa khi chỉ nghe.

### q1
id: 7be9ea02-c5ce-40d5-8ebf-291369605fd7
format: single_choice
version: 1
dok: 1
prompt.en: Which baby was born, not hatched?
prompt.vi: Con non nào do mẹ đẻ ra?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of who drinks milk from mum.
hint.vi: Em nghĩ xem con non nào bú sữa mẹ nhé.
explanation_correct.en: Yes! Piglets are born, then drink milk.
explanation_correct.vi: Đúng rồi! Lợn con do mẹ đẻ ra, rồi bú sữa mẹ.
explanation_wrong.en: The answer is the piglets. Their mum had them.
explanation_wrong.vi: Đáp án là đàn lợn con. Lợn mẹ đẻ ra chúng.
> DOK 1: nhớ lại ô Mum gives birth. Hai lựa chọn sai đều nở từ trứng, nên "not hatched" trong câu EN là gợi nghĩa, không phải bẫy phủ định. Ba ảnh bé đã gặp ở ô Học và kệ Chơi hôm nay.

#### option q1_chick
correct: false
feedback.en: A chick hatches out of an egg.
feedback.vi: Gà con nở ra từ quả trứng.
label.en: chick
label.vi: gà con
image.brief: Dùng lại hình `w1_chick` ở bài `goi-ten-va-nhom-dong-vat/chim-va-bo-sat`. Từ khoá tìm ảnh (EN): yellow chick standing ground side view
image.alt.en: A yellow chick
image.alt.vi: Gà con lông vàng

#### option q1_piglets
correct: true
label.en: piglets
label.vi: lợn con
image.brief: Dùng lại hình `explore_piglets`. Từ khoá tìm ảnh (EN): piglets nursing sow
image.alt.en: Piglets drinking milk
image.alt.vi: Đàn lợn con đang bú

#### option q1_tadpoles
correct: false
feedback.en: Tadpoles hatch from eggs in the water.
feedback.vi: Nòng nọc nở ra từ trứng dưới nước.
label.en: tadpoles
label.vi: nòng nọc
image.brief: Dùng lại hình `explore_tadpoles` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): tadpoles swimming shallow water
image.alt.en: Tadpoles in water
image.alt.vi: Nòng nọc dưới nước

### q2
id: 3d5c858b-148b-4d02-9501-6a6fd56c3931
format: true_false
version: 1
dok: 1
prompt.en: A calf grows into a buffalo.
prompt.vi: Nghé lớn lên thành con trâu.
image.brief: Dùng lại hình `explore_calf`. Từ khoá tìm ảnh (EN): water buffalo calf suckling
image.alt.en: A buffalo calf drinking milk
image.alt.vi: Nghé đang bú sữa
answer: true
hint.en: Look at the calf and its mum.
hint.vi: Em nhìn chú nghé và trâu mẹ nhé.
explanation_correct.en: Yes! It drinks milk and grows big.
explanation_correct.vi: Đúng rồi! Nghé bú sữa rồi lớn dần.
explanation_wrong.en: This is true. A calf becomes a buffalo.
explanation_wrong.vi: Câu này đúng. Nghé lớn lên thành trâu.
feedback_false.en: A calf looks like a small buffalo.
feedback_false.vi: Nghé trông như một con trâu nhỏ.
> DOK 1: nhớ lại ví dụ ba ô Milk.

### q3
id: f014f51d-029f-484b-9041-0fd5ecb2d552
format: true_false
version: 1
dok: 1
prompt.en: A piglet hatches from an egg.
prompt.vi: Lợn con nở ra từ quả trứng.
image.brief: Dùng lại hình `explore_piglets`. Từ khoá tìm ảnh (EN): piglets nursing sow
image.alt.en: Piglets drinking milk
image.alt.vi: Đàn lợn con đang bú
answer: false
hint.en: Look at the piglets and their mum.
hint.vi: Em nhìn đàn lợn con và lợn mẹ nhé.
explanation_correct.en: A pig mum gives birth to piglets.
explanation_correct.vi: Lợn mẹ đẻ ra đàn lợn con.
explanation_wrong.en: This is false. Piglets are born, not hatched.
explanation_wrong.vi: Câu này sai. Lợn con do mẹ đẻ ra.
feedback_true.en: Piglets drink milk. Chicks hatch from eggs.
feedback_true.vi: Lợn con bú sữa mẹ. Gà con mới nở từ trứng.
> DOK 1: nhớ lại ý chính một. `explanation_correct` là câu chính ô Mum gives birth, đứng một mình được.

### q4
id: 1ee68b78-2c1c-46c6-976a-59427a814643
format: order_sequence
version: 1
dok: 2
prompt.en: Start with the baby. Put them in order.
prompt.vi: Bắt đầu từ em bé. Em xếp theo thứ tự nhé.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_baby, q4_child, q4_adult
hint.en: The grown-up is the tallest.
hint.vi: Người lớn là người cao nhất.
explanation_correct.en: Yes! A child grows into a grown-up.
explanation_correct.vi: Đúng rồi! Trẻ em lớn lên thành người lớn.
explanation_wrong.en: The order is baby, child, then grown-up.
explanation_wrong.vi: Thứ tự là em bé, trẻ em, rồi người lớn.
> DOK 2: xếp ba chặng người lớn lên, bắt đầu từ em bé. Không xếp người già ở thẻ cuối (SK-053: không để ý "sau đó là chết"). Gợi ý chỉ nhắc một đầu. Thẻ trong file không theo thứ tự đúng.
> Ba thẻ là hình tự vẽ cùng nét, cùng nền với ô People (SK-053 quyết định 8).

#### item q4_adult
label.en: grown-up
label.vi: người lớn
image.brief: [hình vẽ] Một người lớn đứng thẳng, vẽ nghiêng toàn thân, không vẽ nét mặt, áo sơ mi và quần dài trơn; cùng nét, cùng nền kem với `explore_humans`; không chữ, không hình in, không nét viền; vẽ gần thực tế. Thẻ `order_sequence` vuông; khung 4:3 câu q6; thẻ từ 2:1.
image.alt.en: A grown-up
image.alt.vi: Một người lớn

#### item q4_baby
label.en: baby
label.vi: em bé
image.brief: [hình vẽ] Một em bé mặc bộ quần áo liền thân màu kem đang ngồi hay bò, vẽ nghiêng toàn thân, không vẽ nét mặt; cùng nét, cùng nền kem với `explore_humans`; không bình sữa có chữ, không chữ, không nét viền; vẽ gần thực tế. Thẻ `order_sequence` vuông; thẻ từ 2:1.
image.alt.en: A baby crawling
image.alt.vi: Em bé đang bò

#### item q4_child
label.en: child
label.vi: trẻ em
image.brief: [hình vẽ] Một bạn nhỏ năm, sáu tuổi đứng, vẽ nghiêng toàn thân, không vẽ nét mặt, áo phông và quần soóc trơn; cùng nét, cùng nền kem với `explore_humans`; không chữ, không hình in, không nét viền; vẽ gần thực tế. Thẻ `order_sequence` vuông.
image.alt.en: A child standing
image.alt.vi: Một bạn nhỏ đang đứng

### q5
id: 1cf34fcb-9d05-4cc6-ac74-62272e8d0574
format: single_choice
version: 1
dok: 2
prompt.en: A calf grows up. What will it be?
prompt.vi: Nghé lớn lên sẽ thành con gì?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of the calf and its mum.
hint.vi: Em nghĩ tới chú nghé và trâu mẹ nhé.
explanation_correct.en: Yes! A calf grows into a big buffalo.
explanation_correct.vi: Đúng rồi! Nghé lớn lên thành con trâu to.
explanation_wrong.en: The answer is the buffalo. Calves become buffaloes.
explanation_wrong.vi: Đáp án là con trâu. Nghé lớn lên thành trâu.
> DOK 2: áp ý "con non lớn lên thành con giống loài mẹ" vào nghé. Ba ảnh trưởng thành bé đã gặp từ chủ đề số một. Gợi ý không nói "con trông giống mẹ" (bài 4 dạy có con non không giống bố mẹ).

#### option q5_cat
correct: false
feedback.en: A kitten grows into a cat.
feedback.vi: Mèo con lớn lên thành mèo.
label.en: cat
label.vi: con mèo
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

#### option q5_buffalo
correct: true
label.en: buffalo
label.vi: con trâu
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu

#### option q5_hen
correct: false
feedback.en: A chick grows into a hen.
feedback.vi: Gà con lớn lên thành gà.
label.en: hen
label.vi: gà mái
image.brief: Dùng lại hình `w3_hen` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): brown hen standing farmyard side view
image.alt.en: A hen in a yard
image.alt.vi: Con gà mái trong sân

### q6
id: 91b46523-89be-4265-b385-827e3c2a08bb
format: true_false
version: 1
dok: 2
misconception: grown_ups_never_babies
prompt.en: Grown-ups were born big, like now.
prompt.vi: Người lớn sinh ra đã to như bây giờ.
image.brief: Dùng lại hình `q4_adult`.
image.alt.en: A grown-up
image.alt.vi: Một người lớn
answer: false
hint.en: Think of how you grow each year.
hint.vi: Em nghĩ xem em lớn lên thế nào qua từng năm nhé.
explanation_correct.en: Every grown-up was a baby once.
explanation_correct.vi: Người lớn nào cũng từng là em bé.
explanation_wrong.en: This is false. Grown-ups were babies once.
explanation_wrong.vi: Câu này sai. Người lớn cũng từng là em bé.
feedback_true.en: Grown-ups grew from babies, just like you.
feedback_true.vi: Người lớn cũng lớn lên từ em bé, như em.
> Câu misconception (`grown_ups_never_babies`), DOK 2: bé nghĩ "người lớn lúc nào cũng to" sẽ chạm Đúng. Bé áp ô People và câu q4 để bác.
> Câu `statement` của key ("Grown-ups were never babies.") có chữ "never"; câu hỏi viết khẳng định (luật Explorer số năm) nên nói "born big, like now". `explanation_correct` là đúng câu `correction` ở `_topic.md`.
> Hình là một người lớn (vật bé phải nghĩ tới), hình vẽ đứng một mình (câu `true_false` một hình). Gợi ý không giả định bé có ảnh gia đình hay đủ bố mẹ.

## Từ vựng

### baby
id: 181f71bc-2529-4026-823b-248b4804de95
tier: core
term.en: baby
term.vi: em bé, con non
example.en: A baby grows into a child.
example.vi: Em bé lớn lên thành trẻ em.
image.brief: Dùng lại hình `q4_baby`.
image.alt.en: A baby crawling
image.alt.vi: Em bé đang bò

### adult
id: 5b1a48bd-b73b-44c1-8ffc-2a8b09abb617
tier: core
term.en: adult
term.vi: người lớn, con vật đã lớn
example.en: Kittens and babies grow into adults.
example.vi: Mèo con lớn thành mèo lớn, em bé lớn thành người lớn.
image.brief: Dùng lại hình `q4_adult`.
image.alt.en: A grown-up
image.alt.vi: Một người lớn
> Từ khoá Oak "adult". Câu hỏi và lời nhắn dùng "grown-up" · "người lớn" (dễ nghe hơn); hai chữ cùng nghĩa, ví dụ của từ nối hai chữ qua "người lớn".
> Ví dụ nói cả hai nghĩa của từ (con vật đã lớn, người lớn), không giả định bé đi học (tester N5, 19/11). Hình vẫn là người lớn `q4_adult`; câu ví dụ có "babies" nối với hình.

### kitten
id: d8e34eb0-4563-4747-9e5d-a3d3ece35e1f
tier: extra
term.en: kitten
term.vi: mèo con
example.en: The kitten drinks its mum's milk.
example.vi: Mèo con bú sữa mèo mẹ.
image.brief: Dùng lại hình `explore_kittens`. Từ khoá tìm ảnh (EN): cat with kittens different colors
image.alt.en: A cat with her kittens on the grass
image.alt.vi: Mèo mẹ và đàn mèo con trên cỏ

### piglet
id: f3497c9a-abe1-43a5-b1f3-1e15ae6f4380
tier: extra
term.en: piglet
term.vi: lợn con
example.en: A piglet grows into a big pig.
example.vi: Lợn con lớn lên thành con lợn to.
image.brief: Dùng lại hình `explore_piglets`. Từ khoá tìm ảnh (EN): piglets nursing sow
image.alt.en: Piglets drinking milk
image.alt.vi: Đàn lợn con đang bú

## Thưởng

### pig_card
id: 189a2f3d-4c39-40bc-a44c-9ca3f569c6c0
set: life_cycles
rarity: common
name.en: Pig
name.vi: Con lợn
tag.en: Many piglets at once
tag.vi: Một lứa nhiều con
fact.en: A pig mum can have ten piglets.
fact.vi: Lợn mẹ có thể đẻ mười lợn con một lứa.
image.brief: Dùng lại hình `explore_piglets`. Từ khoá tìm ảnh (EN): piglets nursing sow
image.alt.en: Piglets drinking milk
image.alt.vi: Đàn lợn con đang bú
> Bộ `set: life_cycles`. Không trùng thẻ đã có (`buffalo_card` ở *Gọi tên và nhóm động vật* bài 6, nên không làm thẻ trâu).
> [CẦN KIỂM] Lợn nái một lứa thường đẻ khoảng tám tới mười hai con; câu nói "có thể đẻ mười".

## Ghi chú cho hoạ sĩ

- **Loại hình:** ảnh chụp thật, trừ bộ bốn hình tự vẽ người (ô People `explore_humans`, ba thẻ q4 `q4_baby`, `q4_child`, `q4_adult`; SK-053 quyết định 8; mục `own`, `changes: ["drawn"]`, credit "Science Kids"). Bốn hình cùng nét, cùng nền kem, không vẽ nét mặt, không chữ. Em bé mặc quần áo (không em bé trần).
- **Ảnh mới, hình gốc của cả chủ đề:** lợn mẹ cho đàn con bú (`explore_piglets`; bài 3 w2, kệ Chơi bài 3 dùng lại), nghé bú trâu mẹ (`explore_calf`; bài 4 ô Like mum dùng lại).
- **Ảnh mới chỉ dùng ở bài này:** mèo mẹ với đàn mèo con (`explore_kittens`; ảnh đã chọn 19/11: mèo mẹ vằn xám, ba mèo con đen đang bú trên cỏ, có con khác màu mẹ).
- **Ảnh dùng lại:** *Gọi tên và nhóm động vật* bài 1 `w1` (hàng rào tre, hình câu w1, w2, q1, q4, q5), `q4` mèo con (món Chơi), bài 2 `q3` nghé (món Chơi), bài 3 `w1_chick` (món Chơi, q1), bài 4 `explore_tadpoles` (món Chơi, q1); bài 1 chủ đề này `explore_old`, `explore_born` (w2); Discoverer *Khủng long* `w3_cat` (w1, q5), `w3_hen` (w1, q5), `w1_buffalo` (q5).
- **`alt` riêng:** w2 `w2_old` dùng `explore_old` với `alt` "A pet with a grey face" · "Con vật có mõm bạc" (19/11, tester c7).
- **Không có:** cảnh đang sinh, máu, nhau thai, con vật bị giết mổ, lợn ở chợ, thẻ tai có chữ. Lợn ở chuồng sạch.
- **Ảnh khó:** nghé đang bú trâu mẹ (đúng trâu nước, không phải bò); mèo con khác màu mẹ trong cùng một ảnh.
- **Màu:** Học: mẹ đẻ ra `nau_dat`, bú sữa `vang_hoe`, mèo con `gi_dong`, con người `cham`. Chơi: mèo con `gi_dong`, nghé `vang_hoe`, lợn con `nau_dat`, nở từ trứng `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (baby, adult). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `single_choice` hai lựa chọn (w1, w2). Quiz `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2 Đúng, q3 Sai, q6 Sai), `order_sequence` (q4). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`grown_ups_never_babies`). Không có `labels` ở câu `true_false`.
- **`order_sequence` q4:** thứ tự đúng `q4_baby`, `q4_child`, `q4_adult`; ba thẻ hình vẽ.
- **Màn Chơi, ví dụ để kiểm:** Đàn mèo con, Nghé (bú sữa), Lợn con → `balanced`; Mèo con, Nghé (trên đồng), Lợn con → `balanced`; Mèo con, Đàn mèo con, Nghé → `missing.tray_piglet`; Gà con, Nghé, Lợn con → `has_limited`.
- **Khởi động trỏ:** w1 → `goi-ten-va-nhom-dong-vat/dong-vat-co-vu` (đã có id), w2 → `lon-len/vat-song-nao-cung-co-vong-doi` (chạy `ids` bài 1 trước).
- **Thưởng:** `set: life_cycles`.
- **Từ EN có thể ngoài Starters/Movers:** piglet, calf, kitten, buffalo, born, give birth, hatched, grown-up, adult, tadpoles, petting.
