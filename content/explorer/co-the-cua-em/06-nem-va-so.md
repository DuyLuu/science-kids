---
id: 5959b0bb-c2a9-4581-99e8-2c93a1f86ca2
topic: co-the-cua-em
slug: nem-va-so
order: 6
stage: review
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: More about taste and touch
vi: Nếm và sờ
> Giữ đúng tên ở `content/syllabus.json` (key `human-body-parts`, bài số sáu).

## Mục tiêu
en: I can tell things by taste and touch.
vi: Em nhận ra mọi thứ nhờ nếm và sờ.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 17/11/2026. Ticket SK-049. Mọi dòng `id:` để trống; chạy `ids` sau bài 5.
> Sườn: lesson 6 `more-about-taste-and-touch` (`docs/oak/human-body-parts.md`). Dùng ý, viết lại. Không dùng ví dụ cánh tay chạm kim loại lạnh làm bằng chứng "nhiều giác quan cùng lúc" (chỉ một giác quan); dùng ăn xoài, ăn phở. Hộp sờ của sườn thay bằng mít, gối bông, đá viên. Ý "chỉ sờ bằng bàn tay" đã gắn key ở bài 4; bài này chỉ ôn ở câu q5, không gắn key.
> Bài `review`: Khởi động ba câu ôn bài 5, bài 3 và *Chuỗi thức ăn*. Sửa `one_sense_at_a_time` ở ý chính ba, ô "Many senses" và câu q6 (gắn key).
> An toàn: chỉ nếm thứ người lớn đưa cho (ô "Ask first", kệ Chơi); không câu nào rủ bé nếm, ngửi, sờ đồ lạ; không "nóng" trong ví dụ sờ. Không bản đồ lưỡi, không "mũi giúp nếm" (`taste_only_tongue` thuộc Discoverer *Não bộ và giác quan*).

## Ý chính
1.en: Your tongue tastes sweet, sour, salty and bitter.
1.vi: Lưỡi em nếm được vị ngọt, chua, mặn và đắng.
> [CẦN KIỂM] Lưỡi nhận vị ở mọi vùng có nụ vị giác; "bản đồ lưỡi" (mỗi vùng một vị) là sai; còn vị umami, bài không dạy.
2.en: Your skin feels soft, hard, prickly or cold.
2.vi: Da em cảm nhận được mềm, cứng, có gai hay lạnh.
3.en: You use many senses at the same time.
3.vi: Em dùng nhiều giác quan cùng một lúc.
> Từ cụ thể tới trừu tượng: bốn vị lưỡi nếm được, các cảm giác da nhận ra khi chạm, rồi ý "một lúc dùng nhiều giác quan" (sửa misconception) và lời dặn hỏi người lớn trước khi nếm.

## Khởi động

> Ba câu DOK 1 (bài `review`): w1 ôn bài trước (mùi khét báo nguy hiểm); w2 ôn bài 3 cách ba bài (tim trong lồng ngực); w3 ôn *Chuỗi thức ăn* bài 1 (chủ đề cách xa, con người và con vật đều cần thức ăn).

### w1
id: f9eb936e-b258-4982-baf7-7d8ed4dd971b
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: co-the-cua-em/nhin-ngui-va-nghe
prompt.en: A burning smell means you need a grown-up.
prompt.vi: Ngửi thấy mùi khét là phải đi tìm người lớn.
image.brief: Dùng lại hình `tray_burnt` ở bài `co-the-cua-em/nhin-ngui-va-nghe`. Từ khoá tìm ảnh (EN): burnt toast plate
image.alt.en: A burnt slice of bread
image.alt.vi: Lát bánh mì cháy đen
answer: true
hint.en: Think about smoke from burning straw.
hint.vi: Em nghĩ tới khói đốt rơm rạ nhé.
explanation_correct.en: Yes! Your nose helps keep you safe.
explanation_correct.vi: Đúng rồi! Mũi giúp em giữ an toàn.
explanation_wrong.en: This is true. Burning can mean danger.
explanation_wrong.vi: Câu này đúng. Mùi khét có thể báo nguy hiểm.
feedback_false.en: This bread burnt and turned black.
feedback_false.vi: Lát bánh mì này đã cháy đen.

### w2
id: ae94c8a4-938f-44d2-96ff-7c6c32576083
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: co-the-cua-em/bo-phan-ben-trong-co-the
prompt.en: Which part is inside your chest?
prompt.vi: Bộ phận nào nằm trong lồng ngực em?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Put a hand on your chest and feel.
hint.vi: Em đặt bàn tay lên ngực và cảm nhận nhé.
explanation_correct.en: Yes! Your heart beats all day and night.
explanation_correct.vi: Đúng rồi! Tim đập suốt ngày đêm.
explanation_wrong.en: The answer is the heart. It is in your chest.
explanation_wrong.vi: Đáp án là trái tim. Tim nằm trong lồng ngực.
> Gợi ý là một việc bé tự làm được (đặt bàn tay lên ngực, thấy tim đập), như ví dụ "feel it beat with your hand" của bài 3. "Lồng ngực" cho bên trong, "ngực" cho bên ngoài (bảng Tên gọi).

#### option w2_heart
correct: true
label.en: heart
label.vi: trái tim
image.brief: Dùng lại hình `tray_heart` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A heart
image.alt.vi: Trái tim

#### option w2_stomach
correct: false
feedback.en: Your stomach is inside your tummy.
feedback.vi: Dạ dày nằm trong bụng em.
label.en: stomach
label.vi: dạ dày
image.brief: Dùng lại hình `tray_stomach` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A stomach
image.alt.vi: Dạ dày

### w3
id: 011bcc07-cf7c-46b4-a6d8-97bcabe3c99a
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: chuoi-thuc-an/con-vat-kiem-an-the-nao
prompt.en: People and animals both need food.
prompt.vi: Con người và con vật đều cần thức ăn.
image.brief: Dùng lại hình `explore_fed` ở bài `chuoi-thuc-an/con-vat-kiem-an-the-nao`. Từ khoá tìm ảnh (EN): hand feeding chickens grain yard
image.alt.en: A hand feeding rice to hens
image.alt.vi: Bàn tay rải thóc cho gà
answer: true
hint.en: Think about your rice bowl and the hens.
hint.vi: Em nghĩ tới bát cơm của em và đàn gà nhé.
explanation_correct.en: Yes! Food helps people and animals grow.
explanation_correct.vi: Đúng rồi! Thức ăn giúp con người và con vật lớn lên.
explanation_wrong.en: This is true. Hens eat rice, and so do you.
explanation_wrong.vi: Câu này đúng. Gà ăn thóc, còn em ăn cơm.
feedback_false.en: These hens are eating rice grains.
feedback_false.vi: Đàn gà này đang ăn thóc.
> Câu mới, không chép câu của *Chuỗi thức ăn* hay của bài 1 chủ đề này ("People need food, water and air, too.").

## Học

> Bốn ô: các vị (lưỡi), các cảm giác khi chạm (da), một lúc dùng nhiều giác quan (ăn xoài), và lời dặn hỏi người lớn trước khi nếm.
> Ô "Tastes" chỉ nói vị, không vẽ, không nói vùng lưỡi. Ô "Many senses" nói mũi ngửi thấy mùi thơm, không nói mũi giúp nếm.

### explore
id: 8c524c35-ecdd-4de5-be4b-c68a5c83b298
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_tastes
label.en: Tastes
label.vi: Các vị
color: vang_hoe
sentence.en: Your tongue tastes sweet, sour, salty and bitter.
sentence.vi: Lưỡi em nếm được vị ngọt, chua, mặn và đắng.
image.brief: Dùng lại hình `q1` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): lime cut in half wooden board
image.alt.en: A lime cut in half
image.alt.vi: Quả chanh cắt đôi
examples.1.en: sour lime
examples.1.vi: chanh chua
examples.2.en: salty salt
examples.2.vi: muối mặn
examples.3.en: bitter melon
examples.3.vi: mướp đắng
examples.4.en: sweet ripe mango
examples.4.vi: xoài chín ngọt
> [CẦN KIỂM] "Mướp đắng" (Bắc) hay "khổ qua" (Nam); phiên chính chốt giữ "mướp đắng".

#### group explore_feel
label.en: Touch
label.vi: Sờ
color: gi_dong
sentence.en: Your skin feels soft, hard, prickly or cold.
sentence.vi: Da em cảm nhận được mềm, cứng, có gai hay lạnh.
image.brief: [ảnh] Một quả mít nguyên quả (vỏ xanh vàng, đầy gai nhỏ), trên nền trơn hay chiếu, chụp gần thấy rõ gai; không bổ, không dao, không người, không chữ; chỉ có ảnh mít trên cây thì cắt sát quả; ảnh ngang có khoảng trống quanh quả (dùng ở khung vuông ô Học, thẻ ba lựa chọn năm hai câu q3 và thẻ từ hai một). Từ khoá tìm ảnh (EN): jackfruit whole close up
image.alt.en: A jackfruit
image.alt.vi: Quả mít
examples.1.en: a prickly jackfruit
examples.1.vi: quả mít vỏ sần sùi gai
examples.2.en: a soft pillow
examples.2.vi: cái gối bông mềm
examples.3.en: a cold ice cube
examples.3.vi: cục đá lạnh
examples.4.en: a hard pebble
examples.4.vi: viên đá cuội cứng
> Hình gốc của cả chủ đề. `alt` cố ý không có chữ "prickly" (chữ của câu q3). Không "nóng" trong ví dụ sờ; câu không rủ bé bóp mạnh vỏ mít.
> [CẦN KIỂM] Gai vỏ mít tù, sờ nhẹ không đau (khác sầu riêng, gai sắc; bài không dùng sầu riêng).

#### group explore_mango
label.en: Many senses
label.vi: Nhiều giác quan
color: cham
sentence.en: Eating a mango uses many senses.
sentence.vi: Khi ăn xoài, em dùng nhiều giác quan.
image.brief: Dùng lại hình `explore_join` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): ripe yellow mango whole plain background
image.alt.en: A ripe yellow mango
image.alt.vi: Quả xoài chín vàng
examples.1.en: eyes see it is yellow
examples.1.vi: mắt thấy xoài vàng
examples.2.en: your nose smells it
examples.2.vi: mũi ngửi thấy mùi thơm
examples.3.en: your tongue tastes it is sweet
examples.3.vi: lưỡi nếm thấy vị ngọt
examples.4.en: hands feel its smooth skin
examples.4.vi: bàn tay sờ thấy vỏ nhẵn
> Bốn ví dụ (bắt buộc) là bốn giác quan cùng lúc, mỗi giác quan một việc riêng. Ví dụ mũi chỉ nói "ngửi thấy mùi thơm", không nói mũi giúp nếm.

#### group explore_ask
label.en: Ask first
label.vi: Hỏi người lớn
color: nau_dat
sentence.en: Ask a grown-up before you taste.
sentence.vi: Em hỏi người lớn trước khi nếm.
image.brief: Dùng lại hình `q5` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): Vietnam market fruit stall baskets
image.alt.en: A fruit stall at a market
image.alt.vi: Sạp hoa quả ở chợ
examples.1.en: taste only what grown-ups give
examples.1.vi: chỉ nếm thứ người lớn đưa cho em
examples.2.en: marbles and soap are not food
examples.2.vi: bi và xà phòng không phải đồ ăn
examples.3.en: a grown-up washes the fruit first
examples.3.vi: người lớn rửa quả trước cho em
> Ví dụ hai báo trước món bẫy của kệ Chơi. Không nhắc thuốc, hoá chất, cây lạ, dị ứng; không bảo bé tự thử nếm ở nhà.
> [CẦN KIỂM] "Xà phòng" (Bắc) hay "xà bông" (Nam); phiên chính chốt giữ "xà phòng".

### new_words
id: a6e366f3-2083-44e1-b389-370c94594d08
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: taste, touch

## Chơi

> Bé chọn ba món ăn, mỗi món một vị: ngọt (xoài chín, nải chuối), chua (quả chanh, xoài xanh), mặn (muối). Đạt khi đủ ba nhóm và không chọn món bẫy.
> Món bẫy là đồ trông như kẹo nhưng không phải đồ ăn (bi thuỷ tinh, xà phòng): dạy "không phải đồ ăn thì không cho vào miệng". Kệ không có đường (bát đường và bát muối trông giống nhau). Xoài chín vàng và xoài xanh khác màu rõ.
> Bảy món, cả kệ ảnh chụp.

### tray
id: f21a84a2-f66a-4a7e-8d46-9c3d48ce178f
type: build_tray
version: 1
prompt.en: Pick sweet, sour and salty foods
prompt.vi: Chọn món ngọt, món chua và món mặn
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find sweet, sour and salty.
messages.start.vi: Em tìm vị ngọt, vị chua và vị mặn nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Your tongue knows all three tastes.
messages.balanced.vi: Tuyệt! Lưỡi em nhận ra đủ ba vị.
messages.has_limited.en: That is not food. Never taste it.
messages.has_limited.vi: Thứ này không phải đồ ăn. Em đừng cho vào miệng.
messages.missing.tray_sweet.en: You still need something sweet.
messages.missing.tray_sweet.vi: Em còn thiếu một món ngọt.
messages.missing.tray_sour.en: You still need something sour.
messages.missing.tray_sour.vi: Em còn thiếu một món chua.
messages.missing.tray_salty.en: You still need something salty.
messages.missing.tray_salty.vi: Em còn thiếu một món mặn.
> Lời nhắn `has_limited` đúng với cả hai món bẫy (bi thuỷ tinh, xà phòng đều không phải đồ ăn).

#### group tray_sweet
label.en: Sweet
label.vi: Ngọt
color: vang_hoe
role: required

#### group tray_sour
label.en: Sour
label.vi: Chua
color: gi_dong
role: required

#### group tray_salty
label.en: Salty
label.vi: Mặn
color: cham
role: required

#### group tray_not_food
label.en: Not food
label.vi: Không phải đồ ăn
color: do_son
role: limit

#### item tray_lime
label.en: Lime
label.vi: Quả chanh
group: tray_sour
image.brief: Dùng lại hình `q1` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): lime cut in half wooden board
image.alt.en: A lime cut in half
image.alt.vi: Quả chanh cắt đôi

#### item tray_marbles
label.en: Glass marbles
label.vi: Bi thuỷ tinh
group: tray_not_food
image.brief: Dùng lại hình `tray_marble` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): glass marbles close up
image.alt.en: Glass marbles
image.alt.vi: Những viên bi thuỷ tinh

#### item tray_ripe_mango
label.en: Ripe mango
label.vi: Xoài chín
group: tray_sweet
image.brief: Dùng lại hình `explore_join` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): ripe yellow mango whole plain background
image.alt.en: A ripe yellow mango
image.alt.vi: Quả xoài chín vàng

#### item tray_salt
label.en: Salt
label.vi: Muối
group: tray_salty
image.brief: [ảnh] Một bát nhỏ đựng muối hạt to (muối hột) trắng, vài hạt rơi ra mặt bàn, chụp gần; không bao bì, không nhãn, không chữ. Từ khoá tìm ảnh (EN): coarse sea salt bowl
image.alt.en: Coarse salt
image.alt.vi: Muối hột

#### item tray_green_mango
label.en: Green mango
label.vi: Xoài xanh
group: tray_sour
image.brief: [ảnh] Một quả xoài xanh nguyên quả, vỏ xanh đậm, nền trơn; khác rõ màu xoài chín vàng `explore_join`; không tem, không chữ. Từ khoá tìm ảnh (EN): green mango whole unripe
image.alt.en: A green mango
image.alt.vi: Quả xoài xanh
> [CẦN KIỂM] Xoài xanh thường có vị chua.

#### item tray_soap
label.en: Soap
label.vi: Xà phòng
group: tray_not_food
image.brief: [ảnh] Một bánh xà phòng màu nhạt trên đĩa xà phòng hay mép bồn rửa, chụp gần; không chữ khắc, không nhãn hiệu, không bao bì. Từ khoá tìm ảnh (EN): bar of soap dish
image.alt.en: A bar of soap
image.alt.vi: Bánh xà phòng

#### item tray_banana
label.en: Bananas
label.vi: Nải chuối
group: tray_sweet
image.brief: Dùng lại hình `q4_banana` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): bunch ripe bananas wooden table
image.alt.en: A bunch of bananas
image.alt.vi: Nải chuối chín

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1, q3, q4; ba lựa chọn), `true_false` (q2 Sai, q5 Đúng, q6 Sai). Không `order_sequence`: các ý của bài không có thứ tự tự nhiên.
> Hình câu `single_choice` là hàng rào tre trung tính. Câu nào cũng tự đủ nghĩa khi chỉ nghe. Mọi lựa chọn là ảnh chụp. Không câu nào rủ bé tự nếm hay sờ.

### q1
id: 87f0f3c4-9f4a-4810-8239-17ede5f3afe8
format: single_choice
version: 1
dok: 1
prompt.en: Which one tastes sour?
prompt.vi: Thứ nào có vị chua?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of a fruit you squeeze on pho.
hint.vi: Em nghĩ tới thứ quả vắt vào bát phở nhé.
explanation_correct.en: Yes! Green mangoes taste sour, too.
explanation_correct.vi: Đúng rồi! Xoài xanh cũng có vị chua.
explanation_wrong.en: The answer is the lime. Limes taste sour.
explanation_wrong.vi: Đáp án là quả chanh. Chanh có vị chua.
> DOK 1: nhớ lại ví dụ "sour lime" của ô "Tastes" (và bài 4). Đường, bánh mì là hai món bé đã gặp ở bài 4, bài 5. Không có muối trong câu (bát đường và bát muối trông giống nhau).

#### option q1_lime
correct: true
label.en: lime
label.vi: quả chanh
image.brief: Dùng lại hình `q1` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): lime cut in half wooden board
image.alt.en: A lime cut in half
image.alt.vi: Quả chanh cắt đôi

#### option q1_sugar
correct: false
feedback.en: Sugar tastes sweet on your tongue.
feedback.vi: Đường có vị ngọt trên lưỡi em.
label.en: sugar
label.vi: đường
image.brief: Dùng lại hình `tray_sugar` ở bài `co-the-cua-em/nam-giac-quan-cua-em`. Từ khoá tìm ảnh (EN): white sugar bowl spoon
image.alt.en: A bowl of sugar
image.alt.vi: Bát đường

#### option q1_bread
correct: false
feedback.en: Fresh bread is soft and smells yummy.
feedback.vi: Bánh mì mới nướng mềm và thơm.
label.en: fresh bread
label.vi: bánh mì mới nướng
image.brief: Dùng lại hình `explore_bread` ở bài `co-the-cua-em/nhin-ngui-va-nghe`. Từ khoá tìm ảnh (EN): Vietnamese baguette
image.alt.en: Fresh bread
image.alt.vi: Ổ bánh mì mới nướng

### q2
id: 0255139d-fe11-4a85-a276-914ac973ab50
format: true_false
version: 1
dok: 1
prompt.en: Sugar tastes salty.
prompt.vi: Đường có vị mặn.
image.brief: Dùng lại hình `tray_sugar` ở bài `co-the-cua-em/nam-giac-quan-cua-em`. Từ khoá tìm ảnh (EN): white sugar bowl spoon
image.alt.en: A bowl of sugar
image.alt.vi: Bát đường
answer: false
hint.en: Think of sugar in lime juice.
hint.vi: Em nghĩ tới đường pha trong nước chanh nhé.
explanation_correct.en: Sugar tastes sweet, not salty.
explanation_correct.vi: Đường có vị ngọt, không mặn.
explanation_wrong.en: This is false. Sugar tastes sweet.
explanation_wrong.vi: Câu này sai. Đường có vị ngọt.
feedback_true.en: Salt is the one that tastes salty.
feedback_true.vi: Muối mới là thứ có vị mặn.
> DOK 1: nhớ lại "sweet sugar" (ô Taste bài 4) và "salty salt" (ô Tastes). `explanation_correct` đứng một mình cho thẻ "Ý sai → Ý đúng": "Sugar tastes salty." → "Sugar tastes sweet, not salty.".

### q3
id: 164e11e7-a56a-42c5-919c-e0c2db2bfbd3
format: single_choice
version: 1
dok: 1
prompt.en: Which one feels prickly?
prompt.vi: Thứ nào sờ vào thấy sần sùi, có gai?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for little bumps all over.
hint.vi: Em tìm thứ có nhiều mấu nhỏ khắp vỏ nhé.
explanation_correct.en: Yes! Inside, a jackfruit is soft and sweet.
explanation_correct.vi: Đúng rồi! Bên trong, múi mít mềm và ngọt.
explanation_wrong.en: The answer is the jackfruit. Its skin is prickly.
explanation_wrong.vi: Đáp án là quả mít. Vỏ mít sần sùi, có gai.
> DOK 1: nhớ lại câu chính và ví dụ "a prickly jackfruit" của ô "Touch". Ba thứ khác nhau rõ bằng mắt (gối trắng mềm, đá viên trong suốt, mít xanh vàng đầy gai). Đá viên là ảnh mới nhưng là lựa chọn sai; mít bé đã thấy ở ô Học.

#### option q3_pillow
correct: false
feedback.en: A pillow feels soft and fluffy.
feedback.vi: Cái gối sờ vào thấy mềm và êm.
label.en: pillow
label.vi: cái gối
image.brief: Dùng lại hình `q5_pillow` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`. Từ khoá tìm ảnh (EN): white pillow plain background
image.alt.en: A pillow
image.alt.vi: Cái gối

#### option q3_jackfruit
correct: true
label.en: jackfruit
label.vi: quả mít
image.brief: Dùng lại hình `explore_feel`. Từ khoá tìm ảnh (EN): jackfruit whole close up
image.alt.en: A jackfruit
image.alt.vi: Quả mít

#### option q3_ice
correct: false
feedback.en: Ice cubes feel cold and smooth.
feedback.vi: Đá viên sờ vào thấy lạnh và trơn.
label.en: ice cubes
label.vi: đá viên
image.brief: [ảnh] Mấy viên đá lạnh trong suốt trong bát hay trên đĩa, chụp gần, nền trơn; không đồ uống có nhãn, không chữ; ảnh ngang có khoảng trống (thẻ ba lựa chọn năm hai). Từ khoá tìm ảnh (EN): ice cubes close up
image.alt.en: Ice cubes
image.alt.vi: Đá viên

### q4
id: fa11ccce-903f-4b90-b790-a9ccc6c5cb7c
format: single_choice
version: 1
dok: 2
prompt.en: Which one tastes sweet, like sugar?
prompt.vi: Thứ nào có vị ngọt, giống đường?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of ripe fruit from the market.
hint.vi: Em nghĩ tới quả chín mua ở chợ nhé.
explanation_correct.en: Yes! Ripe bananas are sweet, like ripe mangoes.
explanation_correct.vi: Đúng rồi! Chuối chín ngọt, giống xoài chín.
explanation_wrong.en: The answer is the bananas. Ripe bananas taste sweet.
explanation_wrong.vi: Đáp án là nải chuối. Chuối chín có vị ngọt.
> DOK 2: chuối không có trong ô Học (chỉ có ở kệ Chơi, nhóm Sweet); bé xếp ba thứ theo vị và chọn vị giống đường. Mướp đắng và chanh là hai vị khác bé vừa học (đắng, chua).
> Đáp án (nải chuối) là ảnh dùng lại, mướp đắng là ảnh mới: đáp án không là ảnh mới duy nhất.

#### option q4_bitter_melon
correct: false
feedback.en: A bitter melon has a bitter taste.
feedback.vi: Mướp đắng có vị đắng.
label.en: bitter melon
label.vi: mướp đắng
image.brief: [ảnh] Một quả mướp đắng xanh nguyên quả, vỏ sần, nằm trên nền trơn, ảnh ngang; không nhãn, không chữ; có khoảng trống hai bên (thẻ ba lựa chọn năm hai và thẻ từ hai một). Từ khoá tìm ảnh (EN): bitter melon whole
image.alt.en: A bitter melon
image.alt.vi: Quả mướp đắng
> Hình gốc của cả chủ đề (từ `bitter` dùng lại).

#### option q4_lime
correct: false
feedback.en: A lime makes your mouth feel sour.
feedback.vi: Quả chanh làm miệng em thấy chua.
label.en: lime
label.vi: quả chanh
image.brief: Dùng lại hình `q1` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): lime cut in half wooden board
image.alt.en: A lime cut in half
image.alt.vi: Quả chanh cắt đôi

#### option q4_banana
correct: true
label.en: bananas
label.vi: nải chuối
image.brief: Dùng lại hình `q4_banana` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): bunch ripe bananas wooden table
image.alt.en: A bunch of bananas
image.alt.vi: Nải chuối chín

### q5
id: 6b8a48c5-ec0f-4795-b5b2-7e5abeb78928
format: true_false
version: 1
dok: 2
prompt.en: Your feet can feel cold, wet grass.
prompt.vi: Bàn chân em cảm nhận được cỏ ướt và lạnh.
image.brief: Dùng lại hình `explore_touch` ở bài `co-the-cua-em/nam-giac-quan-cua-em`. Từ khoá tìm ảnh (EN): child bare feet grass
image.alt.en: Bare feet on the grass
image.alt.vi: Đôi bàn chân trần trên bãi cỏ
answer: true
hint.en: Think about walking outside after the rain.
hint.vi: Em nghĩ tới lúc đi ra sân sau cơn mưa nhé.
explanation_correct.en: Yes! Skin all over your body can feel.
explanation_correct.vi: Đúng rồi! Da khắp cơ thể em đều cảm nhận được.
explanation_wrong.en: This is true. Wet grass feels cold on bare feet.
explanation_wrong.vi: Câu này đúng. Bàn chân trần thấy cỏ ướt mát lạnh.
feedback_false.en: Skin on your feet can feel, too.
feedback_false.vi: Da ở bàn chân em cũng cảm nhận được.
> DOK 2: áp ý "da khắp cơ thể cảm nhận được" của bài 4 vào tình huống mới (cỏ ướt sau mưa). Ôn ý `touch_only_hands`, không gắn key (key đã gắn ở bài 4 câu q6). Ô "Touch" bài này dạy "cold"; "wet" là từ Movers.

### q6
id: 89913d66-f1fe-46da-a217-13bf0a7562ca
format: true_false
version: 1
dok: 2
misconception: one_sense_at_a_time
prompt.en: You use one sense at a time.
prompt.vi: Mỗi lúc em chỉ dùng được một giác quan.
image.brief: Dùng lại hình `explore_taste` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): pho bowl steaming Vietnamese noodle soup
image.alt.en: A bowl of pho
image.alt.vi: Bát phở
answer: false
hint.en: Think about lunch with your family.
hint.vi: Em nghĩ tới bữa cơm cùng cả nhà nhé.
explanation_correct.en: Eating pho, you see, smell and taste it.
explanation_correct.vi: Khi ăn phở, em vừa nhìn, vừa ngửi, vừa nếm.
explanation_wrong.en: This is false. You use many senses at once.
explanation_wrong.vi: Câu này sai. Em dùng nhiều giác quan cùng một lúc.
feedback_true.en: Your nose smells the pho as you eat.
feedback_true.vi: Mũi em ngửi thấy mùi phở khi em ăn.
> `alt` riêng của chủ đề (bảng "alt riêng" ở `_topic.md`): bỏ chữ "hot" · "nóng" của `alt` gốc (quy ước không nhấn đồ nóng). Từ khoá chép đúng truy vấn đầu của hình gốc.
> Câu misconception (`one_sense_at_a_time`), bằng hình, DOK 2: bé còn nghĩ "mỗi lúc một giác quan" sẽ chạm Đúng. Bé áp ô "Many senses" (ăn xoài) vào một món mới (bát phở). Câu chỉ kiểm một việc: một lúc có dùng được nhiều giác quan không.
> Hình là bát phở (đúng vật bé ăn), không có người, không đẩy về phía nào. Gợi ý là cảnh quen (bữa cơm cả nhà), không trỏ tới ô Học. Phản hồi nói mũi ngửi thấy mùi khi ăn, không nói mũi giúp nếm.
> `explanation_correct` đứng một mình cho thẻ "Ý sai → Ý đúng": "You use one sense at a time." → "Eating pho, you see, smell and taste it.".

## Từ vựng

### taste
id: baf70991-b65c-47d1-a7fc-ace61f6a3d76
tier: core
term.en: taste
term.vi: vị, nếm
example.en: Ripe mangoes have a sweet taste.
example.vi: Xoài chín có vị ngọt.
image.brief: Dùng lại hình `explore_join` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): ripe yellow mango whole plain background
image.alt.en: A ripe yellow mango
image.alt.vi: Quả xoài chín vàng

### touch
id: 92e4e065-d626-444d-b7bb-c07437c05f7e
tier: core
term.en: touch
term.vi: sờ
example.en: A pillow is soft to touch.
example.vi: Cái gối sờ vào thấy mềm.
image.brief: Dùng lại hình `q5_pillow` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`. Từ khoá tìm ảnh (EN): white pillow plain background
image.alt.en: A pillow
image.alt.vi: Cái gối

### sour
id: 8cfc1654-3e32-4434-bed2-a67e45550124
tier: extra
term.en: sour
term.vi: chua
example.en: A lime tastes sour.
example.vi: Quả chanh có vị chua.
image.brief: Dùng lại hình `q1` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): lime cut in half wooden board
image.alt.en: A lime cut in half
image.alt.vi: Quả chanh cắt đôi

### bitter
id: b72e723c-8711-4c44-baa5-4a614b097d9c
tier: extra
term.en: bitter
term.vi: đắng
example.en: Bitter melon has a bitter taste.
example.vi: Mướp đắng có vị đắng.
image.brief: Dùng lại hình `q4_bitter_melon`. Từ khoá tìm ảnh (EN): bitter melon whole
image.alt.en: A bitter melon
image.alt.vi: Quả mướp đắng

### prickly
id: 66c9e9a0-c85f-4e54-a836-eda29af9fbb6
tier: extra
term.en: prickly
term.vi: có gai
example.en: A jackfruit has prickly skin.
example.vi: Quả mít có vỏ sần sùi gai.
image.brief: Dùng lại hình `explore_feel`. Từ khoá tìm ảnh (EN): jackfruit whole close up
image.alt.en: A jackfruit
image.alt.vi: Quả mít

## Thưởng

### skin_card
id: 269030da-46a0-4a4f-8fc5-057bea1f6660
set: body
rarity: rare
name.en: Skin
name.vi: Làn da
tag.en: Feels all over you
tag.vi: Cảm nhận khắp cơ thể
fact.en: Your skin covers you from head to toe.
fact.vi: Da bao phủ em từ đầu đến chân.
> Tester 17/11 mục N5: bỏ câu "da là bộ phận lớn nhất" (chỉ đúng với nghĩa "organ", chữ cấm của chủ đề). Câu mới dùng lại cụm "head to toe" · "từ đầu đến chân" của bài 2 câu q4, khớp hình đôi bàn chân trần.
image.brief: Dùng lại hình `explore_touch` ở bài `co-the-cua-em/nam-giac-quan-cua-em`. Từ khoá tìm ảnh (EN): child bare feet grass
image.alt.en: Bare feet on the grass
image.alt.vi: Đôi bàn chân trần trên bãi cỏ
> Bộ `set: body`; thẻ Skin chưa có. Thẻ hiếm cuối chủ đề.

## Ghi chú cho hoạ sĩ

- **Ảnh mới (sáu):** `explore_feel` (quả mít nguyên quả, rõ gai; không bổ, không dao), `q4_bitter_melon` (mướp đắng nguyên quả, ảnh ngang), `q3_ice` (đá viên trong bát hay trên đĩa), `tray_green_mango` (xoài xanh nguyên quả, khác rõ màu xoài chín), `tray_salt` (bát muối hột trắng), `tray_soap` (bánh xà phòng không chữ khắc, không nhãn hiệu). `explore_feel` và `q4_bitter_melon` là hình gốc của cả chủ đề: giữ đúng key.
- **Hình vẽ mới:** không có.
- **Hình dùng lại:**
  - Trong chủ đề: `tray_burnt`, `explore_bread` ở bài `co-the-cua-em/nhin-ngui-va-nghe` (w1, q1); `tray_sugar`, `explore_touch` ở bài `co-the-cua-em/nam-giac-quan-cua-em` (q1, q2, q5, thẻ).
  - *Não bộ và giác quan* bài 3 `giac-quan-gui-tin-ve-nao`: `q1` chanh (ô Tastes, kệ, q1, q4, từ `sour`), `explore_join` xoài chín (ô Many senses, kệ, từ `taste`), `q5` sạp hoa quả (ô Ask first), `explore_taste` bát phở (q6, `alt` riêng).
  - *Não bộ và giác quan* bài 1 `nao-dieu-khien-co-the`: `q5_pillow` (q3, từ `touch`).
  - *Hô hấp* `duong-di-cua-khong-khi`: `tray_heart`, `tray_stomach` (w2, hình vẽ).
  - *Gọi tên và nhóm động vật* bài 1: `w1` hàng rào tre (hình câu w2, q1, q3, q4), `q4_banana` nải chuối (kệ, q4).
  - *Sinh vật sống ở đâu?*: `tray_marble` bi thuỷ tinh (kệ).
  - *Chuỗi thức ăn* bài 1: `explore_fed` (w3).
- **Crop riêng:** `explore_feel` ở khung vuông, thẻ năm hai (q3), thẻ từ hai một; `q4_bitter_melon` ở thẻ năm hai và thẻ từ hai một; `tray_sugar` ở thẻ năm hai (q1) và khung bốn ba (q2); `explore_touch` ở khung bốn ba (q5) và sticker vuông (thẻ); `explore_taste` bát phở ở khung bốn ba (q6). Hình vẽ `tray_heart`, `tray_stomach` ở thẻ hai lựa chọn mười bảy mười: đệm nền kem hai bên.
- **Không đặt cạnh nhau:** bát đường và bát muối không cùng một câu hay một kệ (q1 có đường, kệ có muối, không câu nào có cả hai).
- **An toàn:** không đồ nóng đang dùng (bát phở là ảnh gốc, chỉ đổi `alt`; designer kiểm ảnh không có nồi sôi, bếp lửa); không dao cạnh quả mít.
- **Màu:** Học: Tastes `vang_hoe`, Touch `gi_dong`, Many senses `cham`, Ask first `nau_dat`. Chơi: Ngọt `vang_hoe`, Chua `gi_dong`, Mặn `cham`, Không phải đồ ăn `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (taste, touch). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `true_false` (w1 Đúng, w3 Đúng), `single_choice` (w2, hai lựa chọn). Quiz `single_choice` (q1, q3, q4; ba lựa chọn), `true_false` (q2 Sai, q5 Đúng, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`one_sense_at_a_time`). Không có `labels` ở câu `true_false`.
- **Thứ tự trong file** (app xáo, SK-047): w2 đáp án chỗ một, q1 chỗ một, q3 chỗ hai, q4 chỗ ba.
- **Màn Chơi, ví dụ để kiểm:** Xoài chín, Quả chanh, Muối → `balanced`; Nải chuối, Xoài xanh, Xà phòng → `has_limited`; Xoài chín, Nải chuối, Quả chanh → `missing.tray_salty`; Muối, Quả chanh, Bi thuỷ tinh → `has_limited`.
- **Khởi động trỏ bài khác:** w1 → `co-the-cua-em/nhin-ngui-va-nghe`, w2 → `co-the-cua-em/bo-phan-ben-trong-co-the` (bài 3 do biên tập viên khác viết song song), w3 → `chuoi-thuc-an/con-vat-kiem-an-the-nao` (đã có id). Chạy `ids` cho bài 1 đến 5 trước bài này.
- **Từ EN có thể ngoài Starters/Movers:** sense, senses, tongue, skin, sour, salty, bitter, bitter melon, prickly, jackfruit, pebble, pillow, fluffy, squeeze, bumps, grown-up, pho, burnt, stomach, tummy, chest, marbles, soap, lime. Nghe thử giọng EN đọc "bitter melon", "jackfruit", "prickly", "pho"; VI "mướp đắng", "sần sùi", "mùi khét".
