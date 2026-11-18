---
id: 86501543-271f-4091-91e7-f7c694ea7220
topic: co-the-cua-em
slug: nam-giac-quan-cua-em
order: 4
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Body parts for our senses
vi: Năm giác quan của em
> Giữ đúng tên ở `content/syllabus.json` (key `human-body-parts`, bài số bốn).

## Mục tiêu
en: I can match senses to body parts.
vi: Em ghép được mỗi giác quan với một bộ phận cơ thể.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 17/11/2026. Ticket SK-049. Mọi dòng `id:` để trống; chạy `ids` sau `_topic.md` và bài 1 đến 3.
> Sườn: lesson 4 `body-parts-for-our-senses` (`docs/oak/human-body-parts.md`). Dùng ý, viết lại; không chép câu quiz (không "nghe chim hót, nhìn tranh, ăn táo, sờ đá trơn, ngửi hoa"). Mẹo "cho trẻ nếm, ngửi thật" không vào app; thay bằng hình và lời dặn "chỉ nếm thứ người lớn đưa cho".
> Sửa `touch_only_hands` ở ý chính ba, ô Học "Touch" (ảnh bàn chân trần trên cỏ; ví dụ bàn chân, má) và câu q6 (gắn key).

## Ý chính
1.en: We have five main senses.
1.vi: Em có năm giác quan chính.
> [CẦN KIỂM] "Năm giác quan chính" là cách dạy lớp một (Tự nhiên và Xã hội lớp một). Khoa học kể thêm cảm giác thăng bằng, nóng lạnh, đau. Bài nói "chính", không nói "người chỉ có năm giác quan".
2.en: Each sense uses a body part.
2.vi: Mỗi giác quan dùng một bộ phận cơ thể.
3.en: Skin all over your body can feel.
3.vi: Da khắp cơ thể em đều cảm nhận được.
> [CẦN KIỂM] Da cảm nhận được ở khắp cơ thể (độ nhạy khác nhau, đầu ngón tay nhạy nhất). Bài chỉ nói da người.
> Từ cụ thể tới trừu tượng: đếm và gọi tên các giác quan, ghép mỗi giác quan với một bộ phận nhìn thấy được, rồi ý "da phủ khắp người nên chỗ nào cũng cảm nhận được" (sửa misconception).

## Khởi động

> Hai câu DOK 1: w1 ôn bài trước (bộ phận bên trong, bộ não nằm trong đầu); w2 ôn bài 1 cách ba bài (con người là động vật có vú).

### w1
id: 35881e67-8160-406f-875c-e76626c57834
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: co-the-cua-em/bo-phan-ben-trong-co-the
prompt.en: Which part is inside your head?
prompt.vi: Bộ phận nào nằm trong đầu em?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: A hard skull keeps this part safe.
hint.vi: Hộp sọ cứng che chở bộ phận này.
explanation_correct.en: Yes! Your brain helps you think.
explanation_correct.vi: Đúng rồi! Bộ não giúp em suy nghĩ.
explanation_wrong.en: The answer is the brain. It is inside your head.
explanation_wrong.vi: Đáp án là bộ não. Bộ não nằm trong đầu em.
> "Trong đầu" (bộ não), không "trên đầu" (bảng Tên gọi). Gợi ý trỏ tới ví dụ "a hard skull keeps it safe" của ô Brain bài 3 (bằng chứng), không nhắc việc "suy nghĩ" (câu chính của ô đó).

#### option w1_lungs
correct: false
feedback.en: Your lungs are inside your chest.
feedback.vi: Phổi nằm trong lồng ngực em.
label.en: lungs
label.vi: phổi
image.brief: Dùng lại hình `tray_lungs` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: Two lungs
image.alt.vi: Hai lá phổi

#### option w1_brain
correct: true
label.en: brain
label.vi: bộ não
image.brief: Dùng lại hình `q2_brain` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: A brain
image.alt.vi: Bộ não

### w2
id: 1d6104bd-8a33-4fbf-a9e4-15d68e578cd3
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: co-the-cua-em/con-nguoi-cung-la-dong-vat
prompt.en: A dog and a person are both mammals.
prompt.vi: Chó và con người đều là động vật có vú.
image.brief: Dùng lại hình `explore_pets` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): yellow dog lying porch Vietnam
image.alt.en: A dog lying on the floor
image.alt.vi: Chú chó nằm trên sàn nhà
answer: true
hint.en: Think about what puppies and babies drink.
hint.vi: Em nghĩ xem chó con và em bé uống gì nhé.
explanation_correct.en: Yes! People are animals, like dogs.
explanation_correct.vi: Đúng rồi! Con người cũng là động vật, như con chó.
explanation_wrong.en: This is true. Dogs and people are mammals.
explanation_wrong.vi: Câu này đúng. Chó và con người đều là động vật có vú.
feedback_false.en: A dog has fur, and you have hair.
feedback_false.vi: Chó có lông, còn em có tóc.
> Hai dấu hiệu của động vật có vú như bài 1 (bú sữa mẹ ở gợi ý, lông hoặc tóc ở phản hồi), không lặp ý nhau. Không "máu nóng", không "đẻ con".

## Học

> Năm ô, mỗi ô một giác quan (`_topic.md` mục Ô Học, Còn mở 3 đã chốt năm ô). Bốn ô đầu là hình vẽ bộ phận của Discoverer; ô Touch là ảnh bàn chân trần trên cỏ, cố ý không phải bàn tay, để sửa `touch_only_hands` ngay từ hình.
> Ô Taste có ví dụ dặn an toàn "chỉ nếm thứ người lớn đưa cho". Không bản đồ lưỡi, không "mũi giúp nếm", không dây thần kinh, không "tin gửi về não".

### explore
id: b848ff5a-9977-4300-9254-425b04b7dce0
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_see
label.en: See
label.vi: Nhìn
color: cham
sentence.en: You see with your eyes.
sentence.vi: Em nhìn bằng mắt.
image.brief: Dùng lại hình `w1_eye` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: An eye
image.alt.vi: Một con mắt
examples.1.en: see the colours of a rainbow
examples.1.vi: nhìn thấy màu cầu vồng
examples.2.en: see your friend wave hello
examples.2.vi: nhìn thấy bạn vẫy chào em
examples.3.en: look at a picture book
examples.3.vi: xem tranh trong sách

#### group explore_hear
label.en: Hear
label.vi: Nghe
color: vang_hoe
sentence.en: You hear with your ears.
sentence.vi: Em nghe bằng tai.
image.brief: Dùng lại hình `w1_ear` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: An ear
image.alt.vi: Một cái tai
examples.1.en: the school drum
examples.1.vi: tiếng trống trường
examples.2.en: a rooster crowing
examples.2.vi: tiếng gà gáy
examples.3.en: rain on the roof
examples.3.vi: tiếng mưa trên mái nhà

#### group explore_smell
label.en: Smell
label.vi: Ngửi
color: gi_dong
sentence.en: You smell with your nose.
sentence.vi: Em ngửi bằng mũi.
image.brief: Dùng lại hình `tray_nose` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A nose
image.alt.vi: Cái mũi
examples.1.en: jasmine flowers
examples.1.vi: mùi hoa nhài
examples.2.en: lemongrass
examples.2.vi: mùi sả
examples.3.en: the ground after rain
examples.3.vi: mùi đất sau cơn mưa
> [CẦN KIỂM] "Hoa nhài" (Bắc) hay "hoa lài" (Nam); phiên chính chốt giữ "hoa nhài".
> [CẦN KIỂM] Đất khô gặp mưa có mùi riêng, dễ nhận ra.

#### group explore_taste
label.en: Taste
label.vi: Nếm
color: nau_dat
sentence.en: You taste with your tongue.
sentence.vi: Em nếm bằng lưỡi.
image.brief: Dùng lại hình `q1_tongue` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`.
image.alt.en: A tongue
image.alt.vi: Cái lưỡi
examples.1.en: sweet sugar
examples.1.vi: đường ngọt
examples.2.en: sour lime
examples.2.vi: chanh chua
examples.3.en: taste only what grown-ups give
examples.3.vi: chỉ nếm thứ người lớn đưa cho em

#### group explore_touch
label.en: Touch
label.vi: Sờ
color: do_son
sentence.en: You feel things with your skin.
sentence.vi: Em cảm nhận mọi thứ bằng da.
image.brief: [ảnh] Đôi bàn chân trần của một bạn nhỏ đứng trên bãi cỏ xanh, chụp thấp từ một bên, chỉ thấy bàn chân, cổ chân và cỏ; không thấy mặt, không giày dép, không vết thương, không chữ; ảnh ngang có khoảng trống quanh bàn chân (dùng ở khung vuông ô Học, thẻ từ hai một, hình câu đúng sai bốn ba của bài 6 câu q5 và thẻ thưởng `skin_card` bài 6). Từ khoá tìm ảnh (EN): child bare feet grass
image.alt.en: Bare feet on the grass
image.alt.vi: Đôi bàn chân trần trên bãi cỏ
examples.1.en: skin covers all of your body
examples.1.vi: da bao phủ khắp cơ thể em
examples.2.en: feet feel a cool floor
examples.2.vi: bàn chân thấy nền gạch mát
examples.3.en: cheeks feel the wind
examples.3.vi: má em thấy gió thổi
> Hình gốc của cả chủ đề (bảng Hình dùng chung ở `_topic.md`): bài 6 dùng lại ở câu q5 và thẻ `skin_card`. Không "nóng" trong ví dụ sờ.
> Ô dùng `do_son` vì năm ô cần năm màu (`_topic.md` mục Ô Học); nhóm `limit` ở kệ Chơi là màn khác.

### new_words
id: 96656436-b2d4-433e-92ea-6a3506308f01
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: sense, tongue, skin

## Chơi

> Bé chọn ba thứ, mỗi thứ cho một giác quan: một tiếng để nghe (gà gáy, mưa trên mái nhà), một mùi để ngửi (hoa nhài, sả), một vị để nếm (chanh chua, đường ngọt). Đạt khi đủ ba nhóm và không chọn món bẫy.
> Món bẫy là thứ chỉ nhìn thấy được, không nghe, không ngửi, không nếm, không sờ được: cầu vồng, mây trắng. Khác kệ Discoverer *Não bộ và giác quan* bài 3 (Tai, Mũi, Da).
> Tám món, cả kệ ảnh chụp. Nhãn món nói rõ giác quan ("Rooster crowing", "Jasmine smell") vì app xếp món theo nhóm trong dữ liệu.

### tray
id: 04dd482a-d352-441f-addb-516087b3c836
type: build_tray
version: 1
prompt.en: Pick things to hear, smell and taste
prompt.vi: Chọn thứ để nghe, để ngửi và để nếm
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find one for ears, nose and tongue.
messages.start.vi: Em tìm một thứ cho tai, một cho mũi, một cho lưỡi nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Ears, nose and tongue all helped.
messages.balanced.vi: Tuyệt! Tai, mũi và lưỡi đều giúp em.
messages.has_limited.en: You can only see that one.
messages.has_limited.vi: Thứ này em chỉ nhìn thấy được thôi.
messages.missing.tray_hear.en: You still need something to hear.
messages.missing.tray_hear.vi: Em còn thiếu một thứ để nghe.
messages.missing.tray_smell.en: You still need something to smell.
messages.missing.tray_smell.vi: Em còn thiếu một thứ để ngửi.
messages.missing.tray_taste.en: You still need something to taste.
messages.missing.tray_taste.vi: Em còn thiếu một thứ để nếm.
> Lời nhắn `has_limited` đúng với cả hai món bẫy (cầu vồng, mây trắng đều chỉ nhìn thấy).

#### group tray_hear
label.en: Hear
label.vi: Nghe
color: vang_hoe
role: required

#### group tray_smell
label.en: Smell
label.vi: Ngửi
color: gi_dong
role: required

#### group tray_taste
label.en: Taste
label.vi: Nếm
color: nau_dat
role: required

#### group tray_see_only
label.en: Only see it
label.vi: Chỉ nhìn thấy
color: do_son
role: limit

#### item tray_rooster
label.en: Rooster crowing
label.vi: Tiếng gà gáy
group: tray_hear
image.brief: Dùng lại hình `w1` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`. Từ khoá tìm ảnh (EN): rooster crowing farm yard
image.alt.en: A rooster crowing
image.alt.vi: Con gà trống đang gáy

#### item tray_lime
label.en: Sour lime
label.vi: Chanh chua
group: tray_taste
image.brief: Dùng lại hình `q1` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): lime cut in half wooden board
image.alt.en: A lime cut in half
image.alt.vi: Quả chanh cắt đôi

#### item tray_rainbow
label.en: Rainbow
label.vi: Cầu vồng
group: tray_see_only
image.brief: Dùng lại hình `tray_rainbow` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): rainbow over green rice field
image.alt.en: A rainbow over green fields
image.alt.vi: Cầu vồng trên cánh đồng xanh

#### item tray_jasmine
label.en: Jasmine smell
label.vi: Mùi hoa nhài
group: tray_smell
image.brief: Dùng lại hình `w2` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`. Từ khoá tìm ảnh (EN): jasmine flowers white close up
image.alt.en: White jasmine flowers
image.alt.vi: Những bông hoa nhài trắng

#### item tray_sugar
label.en: Sweet sugar
label.vi: Đường ngọt
group: tray_taste
image.brief: [ảnh] Một bát nhỏ đựng đường cát trắng, có chiếc thìa, chụp gần chếch từ trên, nền trơn; không bao bì, không nhãn, không chữ; ảnh ngang có khoảng trống quanh bát (dùng ở khung vuông kệ Chơi, thẻ ba lựa chọn năm hai và hình câu đúng sai bốn ba ở bài 6). Từ khoá tìm ảnh (EN): white sugar bowl spoon
image.alt.en: A bowl of sugar
image.alt.vi: Bát đường
> Hình gốc của cả chủ đề: bài 6 dùng lại ở câu q1 (`q1_sugar`) và q2. Kệ này không có muối (bát đường và bát muối trông giống nhau).

#### item tray_rain
label.en: Rain on the roof
label.vi: Tiếng mưa trên mái nhà
group: tray_hear
image.brief: Dùng lại hình `tray_rain_roof` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): rain on corrugated metal roof close up
image.alt.en: Rain on a roof
image.alt.vi: Mưa rơi trên mái nhà

#### item tray_clouds
label.en: White clouds
label.vi: Mây trắng
group: tray_see_only
image.brief: Dùng lại hình `q2` ở bài `ho-hap/giu-phoi-khoe`. Từ khoá tìm ảnh (EN): blue sky white clouds tree tops
image.alt.en: White clouds in a blue sky
image.alt.vi: Mây trắng trên bầu trời xanh
> `alt` riêng của chủ đề (bảng "alt riêng" ở `_topic.md`). Designer làm `crop` vuông riêng chỉ lấy bầu trời và mây, bỏ ngọn cây (cây sờ được, trái lời nhắn "chỉ nhìn thấy").

#### item tray_lemongrass
label.en: Lemongrass smell
label.vi: Mùi sả
group: tray_smell
image.brief: [ảnh] Một bó sả tươi (thân trắng xanh, lá dài) trên mặt bàn hay rổ tre, chụp gần, ảnh ngang; không người, không nhãn, không chữ. Từ khoá tìm ảnh (EN): lemongrass stalks bundle
image.alt.en: Fresh lemongrass
image.alt.vi: Bó sả tươi

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q3, q4; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q5, ba thẻ).
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính (app Explorer ẩn hình câu hỏi khi mọi lựa chọn có hình). Câu nào cũng tự đủ nghĩa khi chỉ nghe.
> Mọi lựa chọn và thẻ là hình vẽ bộ phận cùng bộ của Discoverer (mắt, tai, mũi, lưỡi, bàn tay): một câu một loại hình.

### q1
id: f6781fd0-07b4-4c6a-a7b7-50e8de9c0e54
format: single_choice
version: 1
dok: 1
prompt.en: Which part do you see with?
prompt.vi: Em nhìn bằng bộ phận nào?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Close this part and everything goes dark.
hint.vi: Em nhắm bộ phận này lại thì mọi thứ tối đen.
explanation_correct.en: Yes! Your eyes see colours and shapes.
explanation_correct.vi: Đúng rồi! Mắt giúp em thấy màu sắc và hình dạng.
explanation_wrong.en: The answer is the eye. You see with eyes.
explanation_wrong.vi: Đáp án là mắt. Em nhìn bằng mắt.
> DOK 1: nhớ lại câu chính ô "See". Gợi ý là một trải nghiệm quen (nhắm mắt), không trỏ tới ô Học.

#### option q1_ear
correct: false
feedback.en: Your ears hear the school drum.
feedback.vi: Tai giúp em nghe tiếng trống trường.
label.en: ear
label.vi: tai
image.brief: Dùng lại hình `w1_ear` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: An ear
image.alt.vi: Một cái tai

#### option q1_eye
correct: true
label.en: eye
label.vi: mắt
image.brief: Dùng lại hình `w1_eye` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: An eye
image.alt.vi: Một con mắt

#### option q1_nose
correct: false
feedback.en: Your nose smells jasmine flowers.
feedback.vi: Mũi giúp em ngửi mùi hoa nhài.
label.en: nose
label.vi: mũi
image.brief: Dùng lại hình `tray_nose` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A nose
image.alt.vi: Cái mũi

### q2
id: ca539652-4f12-44de-aff6-8beb88c76416
format: true_false
version: 1
dok: 1
prompt.en: You smell flowers with your nose.
prompt.vi: Em ngửi mùi hoa bằng mũi.
image.brief: Dùng lại hình `w2` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`. Từ khoá tìm ảnh (EN): jasmine flowers white close up
image.alt.en: White jasmine flowers
image.alt.vi: Những bông hoa nhài trắng
answer: true
hint.en: Think of walking past a jasmine bush.
hint.vi: Em nghĩ tới lúc đi ngang khóm hoa nhài nhé.
explanation_correct.en: Yes! Your nose smells lemongrass, too.
explanation_correct.vi: Đúng rồi! Mũi em cũng ngửi được mùi sả.
explanation_wrong.en: This is true. Your nose smells flowers.
explanation_wrong.vi: Câu này đúng. Em ngửi mùi hoa bằng mũi.
feedback_false.en: Jasmine flowers smell nice to your nose.
feedback_false.vi: Hoa nhài toả mùi thơm, mũi em ngửi thấy.
> DOK 1: nhớ lại câu chính và ví dụ "jasmine flowers" của ô "Smell". Hình là đúng vật được nói tới (hoa nhài), không có mũi hay người.

### q3
id: 0233cd62-8f6f-448c-96e3-50ee06f1e25b
format: single_choice
version: 1
dok: 1
prompt.en: Which part hears the school drum?
prompt.vi: Bộ phận nào nghe thấy tiếng trống trường?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Cover this part, and the drum goes quiet.
hint.vi: Em bịt bộ phận này lại, tiếng trống nhỏ hẳn đi.
explanation_correct.en: Yes! Your ears hear the rain, too.
explanation_correct.vi: Đúng rồi! Tai còn nghe được tiếng mưa.
explanation_wrong.en: The answer is the ear. You hear with ears.
explanation_wrong.vi: Đáp án là tai. Em nghe bằng tai.
> DOK 1: nhớ lại ví dụ "the school drum" của ô "Hear". Mắt là bẫy (bé nhìn thấy cái trống), lưỡi là bộ phận giác quan khác.

#### option q3_eye
correct: false
feedback.en: Your eyes see the drum's colour.
feedback.vi: Mắt nhìn thấy màu của cái trống.
label.en: eye
label.vi: mắt
image.brief: Dùng lại hình `w1_eye` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: An eye
image.alt.vi: Một con mắt

#### option q3_tongue
correct: false
feedback.en: Your tongue tastes the food you eat.
feedback.vi: Lưỡi nếm vị những món em ăn.
label.en: tongue
label.vi: lưỡi
image.brief: Dùng lại hình `q1_tongue` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`.
image.alt.en: A tongue
image.alt.vi: Cái lưỡi

#### option q3_ear
correct: true
label.en: ear
label.vi: tai
image.brief: Dùng lại hình `w1_ear` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: An ear
image.alt.vi: Một cái tai

### q4
id: 9cdbc0f0-c9cf-49e2-ab54-6e49107bafde
format: single_choice
version: 1
dok: 2
prompt.en: Which part tells you a mango is sweet?
prompt.vi: Bộ phận nào cho em biết xoài có vị ngọt?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of sweet sugar in your mouth.
hint.vi: Em nghĩ tới lúc đường ngọt ở trong miệng nhé.
explanation_correct.en: Yes! Your tongue tastes sweet and sour.
explanation_correct.vi: Đúng rồi! Lưỡi nếm được vị ngọt và vị chua.
explanation_wrong.en: The answer is the tongue. It tastes food.
explanation_wrong.vi: Đáp án là lưỡi. Lưỡi nếm vị thức ăn.
> DOK 2: xoài không có trong ví dụ ô "Taste"; bé áp ý "lưỡi nếm vị" vào một quả mới. Mắt là bẫy (xoài vàng trông chín, nhưng vị ngọt do lưỡi nếm); bàn tay là bẫy thứ hai (cầm quả xoài). Không đặt mũi làm lựa chọn (tránh chạm `taste_only_tongue` của Discoverer).
> Câu hỏi về xoài do người lớn đưa cho; không rủ bé tự nếm.

#### option q4_tongue
correct: true
label.en: tongue
label.vi: lưỡi
image.brief: Dùng lại hình `q1_tongue` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`.
image.alt.en: A tongue
image.alt.vi: Cái lưỡi

#### option q4_eye
correct: false
feedback.en: Your eyes see the mango is yellow.
feedback.vi: Mắt chỉ thấy quả xoài màu vàng.
label.en: eye
label.vi: mắt
image.brief: Dùng lại hình `w1_eye` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: An eye
image.alt.vi: Một con mắt

#### option q4_hand
correct: false
feedback.en: Your hand feels how big it is.
feedback.vi: Bàn tay cảm nhận quả xoài to hay nhỏ.
label.en: hand
label.vi: bàn tay
image.brief: Dùng lại hình `q5_hand` ở bài `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`.
image.alt.en: A hand
image.alt.vi: Một bàn tay

### q5
id: 66b9ffe3-2123-4c61-9174-12391c7432b1
format: order_sequence
version: 1
dok: 2
prompt.en: Order from top to bottom on your head.
prompt.vi: Xếp từ trên xuống dưới trên đầu em.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q5_eye, q5_nose, q5_tongue
hint.en: Think where your eyes are.
hint.vi: Em nghĩ xem mắt nằm ở đâu trên đầu nhé.
explanation_correct.en: Yes! Your eyes sit above your nose.
explanation_correct.vi: Đúng rồi! Mắt nằm phía trên mũi em.
explanation_wrong.en: The order is eye, nose, then tongue.
explanation_wrong.vi: Thứ tự là mắt, mũi, rồi lưỡi.
> DOK 2: xếp ba bộ phận giác quan theo chỗ trên đầu (nói "trên đầu", không "trên khuôn mặt", vì lưỡi nằm trong miệng; tester 17/11 mục N2). Không đặt tai (ngang mắt), để chỉ một thứ tự đúng. Gợi ý chỉ nhắc một đầu dải (mắt), không gọi tên cả ba. Thẻ trong file không theo thứ tự đúng.
> [CẦN KIỂM] Trên đầu, mắt ở trên mũi, mũi ở trên miệng.

#### item q5_tongue
label.en: tongue
label.vi: lưỡi
image.brief: Dùng lại hình `q1_tongue` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`.
image.alt.en: A tongue
image.alt.vi: Cái lưỡi

#### item q5_eye
label.en: eye
label.vi: mắt
image.brief: Dùng lại hình `w1_eye` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: An eye
image.alt.vi: Một con mắt

#### item q5_nose
label.en: nose
label.vi: mũi
image.brief: Dùng lại hình `tray_nose` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A nose
image.alt.vi: Cái mũi

### q6
id: b56bdd5a-d565-4e98-b6e7-f7d25a6be47c
format: true_false
version: 1
dok: 2
misconception: touch_only_hands
prompt.en: Only your hands can feel things.
prompt.vi: Chỉ có bàn tay mới cảm nhận được mọi thứ.
image.brief: Dùng lại hình `q5_hand` ở bài `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`.
image.alt.en: A hand
image.alt.vi: Một bàn tay
answer: false
hint.en: Think about bare feet on the grass.
hint.vi: Em nghĩ tới đôi bàn chân trần trên bãi cỏ nhé.
explanation_correct.en: Skin all over your body can feel.
explanation_correct.vi: Da khắp cơ thể em đều cảm nhận được.
explanation_wrong.en: This is false. Your feet and cheeks feel, too.
explanation_wrong.vi: Câu này sai. Bàn chân và má em cũng cảm nhận được.
feedback_true.en: Your cheeks feel the wind, too.
feedback_true.vi: Má em cũng thấy gió thổi.
> Câu misconception (`touch_only_hands`), bằng hình, DOK 2: bé còn nghĩ "chỉ sờ bằng bàn tay" sẽ chạm Đúng. Bé áp ý chính ba và ô "Touch" (bàn chân, má) để bác câu nói. Câu chỉ kiểm một việc: ngoài bàn tay, chỗ khác trên cơ thể có cảm nhận được không.
> Hình là bàn tay xoè (đúng vật được nói tới), không làm bằng chứng cho phía nào. Gợi ý trỏ tới ảnh ô "Touch" (bằng chứng); phản hồi nói một chỗ khác (má), không lặp ý gợi ý.
> `explanation_correct` đứng một mình cho thẻ "Ý sai → Ý đúng": "Only your hands can feel things." → "Skin all over your body can feel.".

## Từ vựng

### sense
id: 70bc14f0-9aac-43f3-bc5a-1e16b2c7decb
tier: core
term.en: sense
term.vi: giác quan
example.en: Seeing is one of your senses.
example.vi: Nhìn là một giác quan của em.
image.brief: Dùng lại hình `explore_five` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`.
image.alt.en: An eye, an ear, a nose, a tongue and a hand
image.alt.vi: Mắt, tai, mũi, lưỡi và bàn tay

### tongue
id: 4ddf5954-4ccc-4266-974a-f335fb48f157
tier: core
term.en: tongue
term.vi: lưỡi
example.en: Your tongue is inside your mouth.
example.vi: Lưỡi nằm trong miệng em.
image.brief: Dùng lại hình `q1_tongue` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`.
image.alt.en: A tongue
image.alt.vi: Cái lưỡi

### skin
id: 12a168d4-68ce-4caf-8850-398075c4c55f
tier: core
term.en: skin
term.vi: da
example.en: Your skin feels the soft wind.
example.vi: Da em cảm nhận làn gió nhẹ.
image.brief: Dùng lại hình `explore_touch`. Từ khoá tìm ảnh (EN): child bare feet grass
image.alt.en: Bare feet on the grass
image.alt.vi: Đôi bàn chân trần trên bãi cỏ

### feel
id: 7f1688ce-2c9a-412d-a3a2-aa3eaed1f6ad
tier: extra
term.en: feel
term.vi: cảm nhận
example.en: Your hands feel the cool water.
example.vi: Đôi bàn tay em thấy nước mát.
image.brief: Dùng lại hình `tray_water` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): hands under running water close up
image.alt.en: Hands under running water
image.alt.vi: Đôi tay hứng dòng nước
> `alt.vi` chép đúng gốc ("Đôi tay"); bảng Tên gọi muốn "bàn tay" thay "tay" đứng một mình. Nếu phiên chính đồng ý, đổi `alt.vi` thành "Đôi bàn tay hứng dòng nước" ở đây và thêm vào bảng "alt riêng" của `_topic.md`.

## Thưởng

### eyes_card
id: 2035d345-e3df-4356-b621-137ca4c58933
set: body
rarity: common
name.en: Eyes
name.vi: Đôi mắt
tag.en: See colours and shapes
tag.vi: Nhìn màu sắc và hình dạng
fact.en: Blinking keeps your eyes clean and wet.
fact.vi: Chớp mắt giúp mắt em sạch và ẩm.
> [CẦN KIỂM] Chớp mắt dàn nước mắt, làm sạch và giữ ẩm mắt.
image.brief: Dùng lại hình `w1_eye` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: An eye
image.alt.vi: Một con mắt
> Bộ `set: body` của Discoverer *Não bộ và giác quan* (Brain, Nerves, Tongue, Helmet); thẻ Eyes chưa có.

## Ghi chú cho hoạ sĩ

- **Ảnh mới (ba):** `explore_touch` (đôi bàn chân trần trẻ em trên cỏ, không mặt, không giày dép, không vết thương), `tray_sugar` (bát đường cát trắng có thìa, không bao bì), `tray_lemongrass` (bó sả tươi). `explore_touch` và `tray_sugar` là hình gốc của cả chủ đề (bài 6 dùng lại): giữ đúng key.
- **Hình vẽ mới:** không có.
- **Hình dùng lại:**
  - *Não bộ và giác quan* bài 1 `nao-dieu-khien-co-the`: `w1_eye` (ô See, q1, q3, q4, q5, thẻ), `w1_ear` (ô Hear, q1, q3), `q2_brain` (w1), `w1` gà trống (kệ), `w2` hoa nhài (q2, kệ).
  - *Não bộ và giác quan* bài 2 `day-than-kinh-truyen-tin`: `q5_hand` (q4, q6).
  - *Não bộ và giác quan* bài 3 `giac-quan-gui-tin-ve-nao`: `q1_tongue` (ô Taste, q3, q4, q5, từ `tongue`), `explore_five` (từ `sense`), `q1` chanh (kệ), `tray_rainbow` (kệ), `tray_rain_roof` (kệ), `tray_water` (từ `feel`).
  - *Hô hấp*: `tray_nose`, `tray_lungs` ở bài `duong-di-cua-khong-khi` (ô Smell, q1, q5, w1); `q2` ở bài `giu-phoi-khoe` (kệ, mây trắng, `alt` riêng).
  - *Gọi tên và nhóm động vật* bài 1: `w1` hàng rào tre (hình câu w1, q1, q3, q4, q5), `explore_pets` (w2).
- **Crop riêng:** `tray_clouds` vuông chỉ trời và mây (bỏ ngọn cây). Hình vẽ bộ phận của Discoverer (1024×768 nền kem) dùng ở thẻ ba lựa chọn năm hai, thẻ hai lựa chọn mười bảy mười và thẻ từ hai một: làm mục riêng đệm nền kem hai bên, không cắt mất bộ phận. `q5_hand` dùng cả ở hình câu đúng sai bốn ba (q6). `explore_touch` dùng ở khung vuông, thẻ từ hai một, và bài 6 ở khung bốn ba.
- **Một câu một loại hình:** q1, q3, q4, q5 toàn hình vẽ bộ phận; kệ Chơi toàn ảnh chụp.
- **Màu:** Học: See `cham`, Hear `vang_hoe`, Smell `gi_dong`, Taste `nau_dat`, Touch `do_son`. Chơi: Nghe `vang_hoe`, Ngửi `gi_dong`, Nếm `nau_dat`, Chỉ nhìn thấy `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` năm nhóm + `word_list` (sense, tongue, skin). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Đúng). Quiz `single_choice` (q1, q3, q4; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q5, ba thẻ). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`touch_only_hands`). Không có `labels` ở câu `true_false`.
- **Thứ tự trong file** (app xáo, SK-047): w1 đáp án chỗ hai, q1 chỗ hai, q3 chỗ ba, q4 chỗ một. `order_sequence` q5 đúng: `q5_eye`, `q5_nose`, `q5_tongue` (thẻ trong file: lưỡi, mắt, mũi).
- **Màn Chơi, ví dụ để kiểm:** Tiếng gà gáy, Mùi hoa nhài, Chanh chua → `balanced`; Tiếng mưa trên mái nhà, Mùi sả, Cầu vồng → `has_limited`; Tiếng gà gáy, Tiếng mưa trên mái nhà, Đường ngọt → `missing.tray_smell`; Mùi hoa nhài, Mùi sả, Mây trắng → `has_limited`.
- **Khởi động trỏ bài khác:** w1 → `co-the-cua-em/bo-phan-ben-trong-co-the`, w2 → `co-the-cua-em/con-nguoi-cung-la-dong-vat` (hai bài cùng chủ đề, do biên tập viên khác viết song song; chạy `ids` cho bài 1 đến 3 trước bài này).
- **Từ EN có thể ngoài Starters/Movers:** sense, senses, tongue, skin, lemongrass, jasmine, rooster, crowing, skull, lungs, brain, mammals, puppies, cheeks, bush, blinking. Nghe thử giọng EN đọc "tongue", "lemongrass", "jasmine"; VI "lưỡi", "mùi sả".
