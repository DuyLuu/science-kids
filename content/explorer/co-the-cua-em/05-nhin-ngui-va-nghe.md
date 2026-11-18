---
id: 60647423-4dc9-468c-ae6c-4f0b19dc0869
topic: co-the-cua-em
slug: nhin-ngui-va-nghe
order: 5
stage: apply
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: More about sight, smell and sound
vi: Nhìn, ngửi và nghe
> Giữ đúng tên ở `content/syllabus.json` (key `human-body-parts`, bài số năm).

## Mục tiêu
en: I know things with eyes, nose and ears.
vi: Em nhận ra mọi thứ bằng mắt, mũi và tai.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 17/11/2026. Ticket SK-049. Mọi dòng `id:` để trống; chạy `ids` sau bài 4.
> Sườn: lesson 5 `more-about-sight-smell-and-sound` (`docs/oak/human-body-parts.md`). Dùng ý, viết lại. Hũ ngửi của sườn thay bằng mùi quen ở Việt Nam (hoa nhài, sả, bánh mì). Trò "tớ nhìn thấy", đi dạo lắng nghe không vào app. Ý "so với người khác" chỉ còn một ví dụ ở ô Smell.
> Bài `apply`: dùng ghép giác quan của bài 4 để nhận ra vật, rồi nhận ra nguy hiểm. Sửa `senses_not_for_safety` ở ý chính hai và ba, ô "Keep safe", phần Chơi, câu q3, q4, q5 và câu q6 (gắn key).
> An toàn: nguy hiểm chỉ là khói (rơm rạ ở xa), mùi khét (bánh mì cháy), còi xe cứu thương, đèn đỏ. Hành động luôn là tránh xa, báo người lớn, tránh đường, dừng lại chờ. Không cháy nhà, tai nạn, người bị thương, bệnh viện.

## Ý chính
1.en: Eyes, noses and ears help us know things.
1.vi: Mắt, mũi và tai giúp em nhận ra mọi thứ.
2.en: Senses warn us about danger.
2.vi: Giác quan báo cho em biết có nguy hiểm.
3.en: Stay away and tell a grown-up.
3.vi: Em tránh xa và báo ngay cho người lớn.
> Từ cụ thể tới trừu tượng: nhận ra vật quen bằng mắt, mũi, tai; rồi hiểu giác quan còn báo nguy hiểm; rồi việc phải làm khi nhận ra nguy hiểm.
> [CẦN KIỂM] Cách nói cho trẻ đi bộ khi nghe còi xe cứu thương ("tránh đường", "tránh sang lề"); đèn đỏ cho xe và đèn hình người đỏ cho người đi bộ đều nghĩa là dừng, bài chỉ nói "đèn đỏ, dừng lại chờ".

## Khởi động

> Hai câu DOK 1: w1 ôn bài trước (mũi để ngửi); w2 ôn bài 2 cách ba bài (khuỷu tay giúp co cánh tay).

### w1
id: 9cce975d-3b4a-4f54-9309-d342310978d4
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: co-the-cua-em/nam-giac-quan-cua-em
prompt.en: Which part do you smell with?
prompt.vi: Em ngửi bằng bộ phận nào?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of breathing in near jasmine flowers.
hint.vi: Em nghĩ tới lúc hít hơi gần khóm hoa nhài nhé.
explanation_correct.en: Yes! Your nose smells ripe mangoes, too.
explanation_correct.vi: Đúng rồi! Mũi còn ngửi được mùi xoài chín.
explanation_wrong.en: The answer is the nose. It smells jasmine.
explanation_wrong.vi: Đáp án là mũi. Mũi ngửi được mùi hoa nhài.

#### option w1_nose
correct: true
label.en: nose
label.vi: mũi
image.brief: Dùng lại hình `tray_nose` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A nose
image.alt.vi: Cái mũi

#### option w1_ear
correct: false
feedback.en: Your ears hear the rooster crow.
feedback.vi: Tai giúp em nghe tiếng gà trống gáy.
label.en: ear
label.vi: tai
image.brief: Dùng lại hình `w1_ear` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: An ear
image.alt.vi: Một cái tai

### w2
id: 2356b4f0-4428-43c7-88fe-42651e263879
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: co-the-cua-em/bo-phan-ben-ngoai-co-the
prompt.en: Your elbows help you bend your arms.
prompt.vi: Khuỷu tay giúp em co cánh tay.
image.brief: Dùng lại hình `tray_elbow` ở bài `co-the-cua-em/bo-phan-ben-ngoai-co-the`.
image.alt.en: An elbow
image.alt.vi: Khuỷu tay
answer: true
hint.en: Think about lifting a spoon to eat.
hint.vi: Em nghĩ tới lúc đưa thìa lên miệng ăn nhé.
explanation_correct.en: Yes! Your knees help you bend your legs.
explanation_correct.vi: Đúng rồi! Đầu gối giúp em co chân.
explanation_wrong.en: This is true. Elbows help your arms bend.
explanation_wrong.vi: Câu này đúng. Khuỷu tay giúp em co cánh tay.
feedback_false.en: Your elbow folds when you brush your teeth.
feedback_false.vi: Khuỷu tay gập lại khi em đánh răng.
> Hình gốc `tray_elbow` ở bài 2 (hình vẽ mới, bảng Hình dùng chung). `alt` không có chữ "bend" (chữ của câu hỏi).

## Học

> Bốn ô: ba ô "nhận ra" (mắt thấy màu, to nhỏ, hình dạng; mũi nhận ra mùi bánh mì; tai nhận ra tiếng gà gáy), rồi ô "Keep safe" gom ba dấu hiệu nguy hiểm theo ba giác quan và việc phải làm.
> Ô "Keep safe" cố ý không dùng `do_son`, để khỏi trùng màu nhóm bẫy "Not a danger" ở kệ Chơi.

### explore
id: bc139de1-555a-486d-b81f-2a3138f1beec
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_look
label.en: See
label.vi: Nhìn
color: cham
sentence.en: Your eyes see colour, size and shape.
sentence.vi: Mắt giúp em thấy màu sắc, to nhỏ và hình dạng.
image.brief: Dùng lại hình `explore_join` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): ripe yellow mango whole plain background
image.alt.en: A ripe yellow mango
image.alt.vi: Quả xoài chín vàng
examples.1.en: a ripe mango is yellow
examples.1.vi: xoài chín có màu vàng
examples.2.en: an elephant is very big
examples.2.vi: con voi rất to
examples.3.en: a ball is round
examples.3.vi: quả bóng có hình tròn

#### group explore_bread
label.en: Smell
label.vi: Ngửi
color: gi_dong
sentence.en: Your nose knows smells, like fresh bread.
sentence.vi: Mũi giúp em nhận ra mùi, như mùi bánh mì mới nướng.
image.brief: [ảnh] Một hoặc hai ổ bánh mì Việt Nam vỏ vàng giòn, nguyên ổ chưa cắt, đặt trên giấy, khay hay rổ tre, chụp gần; không nhân, không người, không quầy có biển chữ, không túi in chữ; ảnh ngang có khoảng trống quanh ổ bánh (dùng ở khung vuông ô Học và kệ Chơi, hình câu đúng sai bốn ba câu q2, thẻ ba lựa chọn năm hai câu q4 và bài 6). Từ khoá tìm ảnh (EN): Vietnamese baguette
image.alt.en: Fresh bread
image.alt.vi: Ổ bánh mì mới nướng
examples.1.en: eyes closed, you still know it
examples.1.vi: nhắm mắt, em vẫn nhận ra mùi
examples.2.en: ask a friend what they smell
examples.2.vi: hỏi bạn xem bạn ngửi thấy mùi gì
examples.3.en: know jasmine by its smell
examples.3.vi: nhận ra hoa nhài nhờ mùi thơm
> Hình gốc của cả chủ đề (bài 6 câu q1 dùng lại). EN viết "bread", không "banh mi".
> [CẦN KIỂM] "Hoa nhài" (Bắc) hay "hoa lài" (Nam); phiên chính chốt giữ "hoa nhài". Mùi nào trẻ cả ba miền đều biết (hoa nhài, sả, bánh mì).

#### group explore_listen
label.en: Hear
label.vi: Nghe
color: vang_hoe
sentence.en: Your ears know sounds, like a rooster.
sentence.vi: Tai giúp em nhận ra tiếng, như tiếng gà gáy.
image.brief: Dùng lại hình `w1` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`. Từ khoá tìm ảnh (EN): rooster crowing farm yard
image.alt.en: A rooster crowing
image.alt.vi: Con gà trống đang gáy
examples.1.en: you know a friend's voice
examples.1.vi: em nhận ra giọng bạn
examples.2.en: the school drum at break time
examples.2.vi: tiếng trống trường giờ ra chơi
examples.3.en: rain on the roof
examples.3.vi: tiếng mưa trên mái nhà

#### group explore_warn
label.en: Keep safe
label.vi: Giữ an toàn
color: nau_dat
sentence.en: Senses warn you about danger.
sentence.vi: Giác quan báo cho em biết có nguy hiểm.
image.brief: Dùng lại hình `explore_smoke` ở bài `ho-hap/giu-phoi-khoe`. Từ khoá tìm ảnh (EN): burning rice straw field smoke
image.alt.en: Smoke from burning straw in a field
image.alt.vi: Khói đốt rơm rạ trên cánh đồng
examples.1.en: smell smoke or burning, tell a grown-up
examples.1.vi: ngửi thấy khói hay mùi khét, em báo người lớn
examples.2.en: hear a siren, move out of the way
examples.2.vi: nghe còi xe cứu thương, em tránh đường
examples.3.en: see a red light, stop and wait
examples.3.vi: thấy đèn đỏ, em dừng lại chờ
> Khói là khói rơm rạ ở xa (hình của *Hô hấp*), không lửa gần, không nhà cháy. Mỗi ví dụ một giác quan và một việc làm; không bảo bé đi xem hay tự xử lý.

### new_words
id: e83e0ef6-9aea-4c83-9d2f-1f3e24985388
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: smell, sound, danger

## Chơi

> Bé tìm ba dấu hiệu nguy hiểm, mỗi giác quan một dấu hiệu: đèn đỏ (nhìn), mùi khét (ngửi), còi xe cứu thương (nghe). Đạt khi đủ ba nhóm và không chọn món an toàn.
> Mỗi món bẫy cùng giác quan với một nhóm bắt buộc nhưng vô hại: bánh mì thơm cạnh bánh mì cháy, hoa nhài cạnh mùi khét, gà gáy cạnh còi, cầu vồng cạnh đèn đỏ. Bé phải nghĩ "có nguy hiểm không", không chọn theo giác quan. Sửa `senses_not_for_safety`.
> Bảy món, cả kệ ảnh chụp.

### tray
id: 0cd65969-998c-45a5-b666-651de124205a
type: build_tray
version: 1
prompt.en: Find three danger signs
prompt.vi: Tìm ba dấu hiệu nguy hiểm
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find one to see, smell and hear.
messages.start.vi: Em tìm một dấu hiệu nhìn thấy, một ngửi thấy, một nghe thấy nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Well done! Now tell a grown-up.
messages.balanced.vi: Giỏi lắm! Giờ em báo cho người lớn nhé.
messages.has_limited.en: That one is safe, not a danger.
messages.has_limited.vi: Thứ này an toàn, không nguy hiểm.
messages.missing.tray_see.en: You still need a danger you see.
messages.missing.tray_see.vi: Em còn thiếu một dấu hiệu nhìn thấy.
messages.missing.tray_smell.en: You still need a danger you smell.
messages.missing.tray_smell.vi: Em còn thiếu một dấu hiệu ngửi thấy.
messages.missing.tray_hear.en: You still need a danger you hear.
messages.missing.tray_hear.vi: Em còn thiếu một dấu hiệu nghe thấy.
> Lời nhắn `has_limited` đúng với cả bốn món bẫy (bánh mì thơm, hoa nhài, gà gáy, cầu vồng đều an toàn). Lời `balanced` nhắc lại ý chính ba (báo người lớn).

#### group tray_see
label.en: See
label.vi: Nhìn
color: cham
role: required

#### group tray_smell
label.en: Smell
label.vi: Ngửi
color: gi_dong
role: required

#### group tray_hear
label.en: Hear
label.vi: Nghe
color: vang_hoe
role: required

#### group tray_safe
label.en: Not a danger
label.vi: Không nguy hiểm
color: do_son
role: limit

#### item tray_bread
label.en: Fresh bread
label.vi: Bánh mì mới nướng
group: tray_safe
image.brief: Dùng lại hình `explore_bread`. Từ khoá tìm ảnh (EN): Vietnamese baguette
image.alt.en: Fresh bread
image.alt.vi: Ổ bánh mì mới nướng

#### item tray_siren
label.en: Ambulance siren
label.vi: Còi xe cứu thương
group: tray_hear
image.brief: [ảnh] Cận cảnh dàn đèn còi ưu tiên trên nóc xe cứu thương, đèn đang sáng, nền trời; không chữ, số, logo, biểu tượng chữ thập đỏ, biển số, người, bệnh nhân; không cảnh tai nạn, bệnh viện; ảnh ngang có khoảng trống quanh dàn đèn (dùng ở khung vuông kệ Chơi và từ, thẻ ba lựa chọn năm hai câu q5). Từ khoá tìm ảnh (EN): ambulance light bar
image.alt.en: The lights on an ambulance
image.alt.vi: Đèn trên nóc xe cứu thương
> Hình gốc của cả chủ đề. `alt` cố ý không có chữ "sound" (chữ của câu q5). Không biểu tượng chữ thập đỏ (biểu tượng được pháp luật bảo vệ).

#### item tray_jasmine
label.en: Jasmine
label.vi: Hoa nhài
group: tray_safe
image.brief: Dùng lại hình `w2` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`. Từ khoá tìm ảnh (EN): jasmine flowers white close up
image.alt.en: White jasmine flowers
image.alt.vi: Những bông hoa nhài trắng

#### item tray_red_light
label.en: Red light
label.vi: Đèn đỏ
group: tray_see
image.brief: Dùng lại hình `q3` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): traffic light red close up sky
image.alt.en: A red traffic light
image.alt.vi: Đèn giao thông màu đỏ

#### item tray_rooster
label.en: Rooster crowing
label.vi: Gà gáy
group: tray_safe
image.brief: Dùng lại hình `w1` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`. Từ khoá tìm ảnh (EN): rooster crowing farm yard
image.alt.en: A rooster crowing
image.alt.vi: Con gà trống đang gáy

#### item tray_burnt
label.en: Burning smell
label.vi: Mùi khét
group: tray_smell
image.brief: [ảnh] Một lát bánh mì nướng cháy đen một phần trên đĩa, chụp gần; không còn khói, không lửa, không lò hay máy nướng, không người, không chữ; ảnh ngang có khoảng trống quanh đĩa (dùng ở khung vuông kệ Chơi, thẻ ba lựa chọn năm hai câu q4 và hình câu đúng sai bốn ba ở bài 6). Từ khoá tìm ảnh (EN): burnt toast plate
image.alt.en: A burnt slice of bread
image.alt.vi: Lát bánh mì cháy đen
> Hình gốc của cả chủ đề (bài 6 câu w1 dùng lại). `alt` cố ý không có chữ "smell" (chữ của câu q4). Bánh mì cháy đã nguội, không đồ nóng đang dùng.

#### item tray_rainbow
label.en: Rainbow
label.vi: Cầu vồng
group: tray_safe
image.brief: Dùng lại hình `tray_rainbow` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): rainbow over green rice field
image.alt.en: A rainbow over green fields
image.alt.vi: Cầu vồng trên cánh đồng xanh

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1, q4, q5 ba lựa chọn; q3 hai lựa chọn), `true_false` (q2 Đúng, q6 Sai). Không `order_sequence`: các ý của bài không có thứ tự tự nhiên.
> Hình câu `single_choice` là hàng rào tre trung tính. Câu nào cũng tự đủ nghĩa khi chỉ nghe. Mọi lựa chọn là ảnh chụp.
> q1, q2 nhận ra vật bằng tai, mũi; q3, q4, q5 nhận ra nguy hiểm bằng mắt, mũi, tai; q6 bác misconception.

### q1
id: 7b3c4230-4fcb-45fe-b6c9-d97783698d77
format: single_choice
version: 1
dok: 1
prompt.en: Which one can you hear?
prompt.vi: Em nghe thấy được thứ nào?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Close your eyes and think of noises.
hint.vi: Em nhắm mắt lại và nghĩ tới các tiếng động nhé.
explanation_correct.en: Yes! Rain goes tap, tap on the roof.
explanation_correct.vi: Đúng rồi! Mưa rơi lộp độp trên mái nhà.
explanation_wrong.en: The answer is the rain. You hear it fall.
explanation_wrong.vi: Đáp án là mưa trên mái nhà. Em nghe thấy mưa rơi.
> DOK 1: nhớ lại ví dụ "rain on the roof" (ô Hear bài 4 và bài này). Cầu vồng, xoài là hai thứ chỉ nhìn thấy (xoài còn ngửi được), không phát ra tiếng.

#### option q1_rainbow
correct: false
feedback.en: You see a rainbow's colours with your eyes.
feedback.vi: Em nhìn thấy màu cầu vồng bằng mắt.
label.en: rainbow
label.vi: cầu vồng
image.brief: Dùng lại hình `tray_rainbow` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): rainbow over green rice field
image.alt.en: A rainbow over green fields
image.alt.vi: Cầu vồng trên cánh đồng xanh

#### option q1_mango
correct: false
feedback.en: You see and smell a ripe mango.
feedback.vi: Em nhìn và ngửi được quả xoài chín.
label.en: mango
label.vi: quả xoài
image.brief: Dùng lại hình `explore_join` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): ripe yellow mango whole plain background
image.alt.en: A ripe yellow mango
image.alt.vi: Quả xoài chín vàng

#### option q1_rain
correct: true
label.en: rain on the roof
label.vi: mưa trên mái nhà
image.brief: Dùng lại hình `tray_rain_roof` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): rain on corrugated metal roof close up
image.alt.en: Rain on a roof
image.alt.vi: Mưa rơi trên mái nhà

### q2
id: 15831ac5-5054-4766-b35c-7d7536dfd4a9
format: true_false
version: 1
dok: 1
prompt.en: You know fresh bread by its smell.
prompt.vi: Em nhận ra bánh mì mới nướng nhờ mùi thơm.
image.brief: Dùng lại hình `explore_bread`. Từ khoá tìm ảnh (EN): Vietnamese baguette
image.alt.en: Fresh bread
image.alt.vi: Ổ bánh mì mới nướng
answer: true
hint.en: Think of walking past a bread cart.
hint.vi: Em nghĩ tới lúc đi ngang xe bánh mì nhé.
explanation_correct.en: Yes! Even with eyes closed, you know it.
explanation_correct.vi: Đúng rồi! Nhắm mắt, em vẫn nhận ra mùi bánh mì.
explanation_wrong.en: This is true. Your nose knows fresh bread.
explanation_wrong.vi: Câu này đúng. Mũi giúp em nhận ra bánh mì mới nướng.
feedback_false.en: Fresh bread has a yummy smell.
feedback_false.vi: Bánh mì mới nướng có mùi thơm ngon.
> DOK 1: nhớ lại câu chính ô "Smell". Gợi ý là cảnh quen ở Việt Nam (xe bánh mì), không trỏ tới ô Học.

### q3
id: 75032658-1c9f-4ca0-a834-58ad312139c6
format: single_choice
version: 1
dok: 1
prompt.en: Which light tells you to stop?
prompt.vi: Đèn nào báo em dừng lại?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about waiting at the crossroads.
hint.vi: Em nghĩ tới lúc đứng chờ ở ngã tư nhé.
explanation_correct.en: Yes! Your eyes help you stay safe.
explanation_correct.vi: Đúng rồi! Đôi mắt giúp em đi đường an toàn.
explanation_wrong.en: The answer is the red light. Stop and wait.
explanation_wrong.vi: Đáp án là đèn đỏ. Em dừng lại chờ.
> DOK 1: nhớ lại ví dụ "see a red light, stop and wait" của ô "Keep safe". Hai lựa chọn: đèn xanh là ảnh mới duy nhất nhưng là lựa chọn sai (đúng luật "đáp án không là ảnh mới duy nhất").

#### option q3_green
correct: false
feedback.en: You cross with a grown-up on green.
feedback.vi: Đèn xanh, em qua đường cùng người lớn.
label.en: green light
label.vi: đèn xanh
image.brief: [ảnh] Một cột đèn giao thông đang sáng đèn xanh, chụp gần, nền trời; cùng góc, cùng cỡ đèn với ảnh đèn đỏ `q3` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao` (ưu tiên cùng bộ ảnh); không số đếm ngược, không biển chữ, không người. Từ khoá tìm ảnh (EN): traffic light green close up
image.alt.en: A green traffic light
image.alt.vi: Đèn giao thông màu xanh
> [CẦN KIỂM] Bài không dạy luật qua đường; phản hồi chỉ nói em qua đường cùng người lớn khi đèn xanh.

#### option q3_red
correct: true
label.en: red light
label.vi: đèn đỏ
image.brief: Dùng lại hình `q3` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): traffic light red close up sky
image.alt.en: A red traffic light
image.alt.vi: Đèn giao thông màu đỏ

### q4
id: 0b7117ae-5db8-40e4-9443-befba9540865
format: single_choice
version: 1
dok: 2
prompt.en: Which smell means you need a grown-up?
prompt.vi: Mùi nào báo em phải đi tìm người lớn?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about food cooked for too long.
hint.vi: Em nghĩ tới món ăn bị nấu quá lâu nhé.
explanation_correct.en: Yes! A burning smell can mean danger.
explanation_correct.vi: Đúng rồi! Mùi khét có thể báo nguy hiểm.
explanation_wrong.en: The answer is the burnt bread. Tell a grown-up.
explanation_wrong.vi: Đáp án là bánh mì cháy. Em báo người lớn nhé.
> DOK 2: ô "Keep safe" dạy "khói, mùi khét"; câu đặt bánh mì thơm cạnh bánh mì cháy để bé áp ý "mùi khét báo nguy hiểm" vào một mùi mới. Hai hình bánh mì khác nhau rõ bằng mắt (ổ vàng nguyên, lát cháy đen trên đĩa).
> Gợi ý là một cảnh quen (món ăn nấu quá lâu), không trỏ tới ô "Keep safe".

#### option q4_burnt
correct: true
label.en: burnt bread
label.vi: bánh mì cháy
image.brief: Dùng lại hình `tray_burnt`. Từ khoá tìm ảnh (EN): burnt toast plate
image.alt.en: A burnt slice of bread
image.alt.vi: Lát bánh mì cháy đen

#### option q4_bread
correct: false
feedback.en: Fresh bread smells yummy and safe.
feedback.vi: Bánh mì mới nướng thơm ngon và an toàn.
label.en: fresh bread
label.vi: bánh mì mới nướng
image.brief: Dùng lại hình `explore_bread`. Từ khoá tìm ảnh (EN): Vietnamese baguette
image.alt.en: Fresh bread
image.alt.vi: Ổ bánh mì mới nướng

#### option q4_jasmine
correct: false
feedback.en: Jasmine flowers smell nice in the garden.
feedback.vi: Hoa nhài toả mùi thơm dễ chịu trong vườn.
label.en: jasmine
label.vi: hoa nhài
image.brief: Dùng lại hình `w2` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`. Từ khoá tìm ảnh (EN): jasmine flowers white close up
image.alt.en: White jasmine flowers
image.alt.vi: Những bông hoa nhài trắng

### q5
id: c842bb69-e301-4a73-aedb-071b718ae3dd
format: single_choice
version: 1
dok: 2
prompt.en: Which sound means move out of the way?
prompt.vi: Tiếng nào báo em phải tránh đường?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of a loud sound on the street.
hint.vi: Em nghĩ tới một tiếng thật to ngoài đường nhé.
explanation_correct.en: Yes! Ambulances need to get by fast.
explanation_correct.vi: Đúng rồi! Xe cứu thương cần đi thật nhanh.
explanation_wrong.en: The answer is the siren. Move out of the way.
explanation_wrong.vi: Đáp án là còi xe cứu thương. Em tránh sang lề nhé.
> DOK 2: so ba tiếng bé đã gặp (gà gáy, mưa ở ô Học; còi ở ô "Keep safe" và kệ Chơi), chọn tiếng báo phải tránh đường. Không cảnh tai nạn, không người bệnh.

#### option q5_rooster
correct: false
feedback.en: A rooster crows to wake up the farm.
feedback.vi: Gà trống gáy gọi cả xóm thức dậy.
label.en: rooster
label.vi: gà trống
image.brief: Dùng lại hình `w1` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`. Từ khoá tìm ảnh (EN): rooster crowing farm yard
image.alt.en: A rooster crowing
image.alt.vi: Con gà trống đang gáy

#### option q5_siren
correct: true
label.en: siren
label.vi: còi xe cứu thương
image.brief: Dùng lại hình `tray_siren`. Từ khoá tìm ảnh (EN): ambulance light bar
image.alt.en: The lights on an ambulance
image.alt.vi: Đèn trên nóc xe cứu thương

#### option q5_rain
correct: false
feedback.en: Rain on the roof is a calm sound.
feedback.vi: Tiếng mưa trên mái nhà nghe êm êm.
label.en: rain on the roof
label.vi: mưa trên mái nhà
image.brief: Dùng lại hình `tray_rain_roof` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): rain on corrugated metal roof close up
image.alt.en: Rain on a roof
image.alt.vi: Mưa rơi trên mái nhà

### q6
id: 6e6a2340-b921-451f-befa-d2f3b0c3f967
format: true_false
version: 1
dok: 2
misconception: senses_not_for_safety
prompt.en: Senses are only for nice things.
prompt.vi: Giác quan chỉ để cảm nhận những điều dễ chịu.
image.brief: Dùng lại hình `explore_five` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`.
image.alt.en: An eye, an ear, a nose, a tongue and a hand
image.alt.vi: Mắt, tai, mũi, lưỡi và bàn tay
answer: false
hint.en: Think about crossing the street with a grown-up.
hint.vi: Em nghĩ tới lúc cùng người lớn qua đường nhé.
explanation_correct.en: Senses also warn you about danger.
explanation_correct.vi: Giác quan còn báo cho em biết có nguy hiểm.
explanation_wrong.en: This is false. Senses help keep you safe.
explanation_wrong.vi: Câu này sai. Giác quan giúp em giữ an toàn.
feedback_true.en: Smoke and a burning smell are not nice.
feedback_true.vi: Khói và mùi khét chẳng dễ chịu chút nào.
> Câu misconception (`senses_not_for_safety`), bằng hình, DOK 2: bé còn nghĩ "giác quan chỉ để cảm nhận cho vui" sẽ chạm Đúng. Bé áp ô "Keep safe", kệ Chơi và câu q3 đến q5 để bác câu nói. Câu chỉ kiểm một việc: giác quan có giúp giữ an toàn không.
> Hình là năm bộ phận giác quan (đúng vật được nói tới), không cảnh dễ chịu hay nguy hiểm nào, nên không đẩy về phía nào. Gợi ý là cảnh quen (qua đường cùng người lớn); phản hồi nói về khói, mùi khét, không lặp ý gợi ý.
> `explanation_correct` đứng một mình cho thẻ "Ý sai → Ý đúng": "Senses are only for nice things." → "Senses also warn you about danger.".

## Từ vựng

### smell
id: 6c1a1463-5598-43e4-966d-90926a27fd5f
tier: core
term.en: smell
term.vi: mùi, ngửi
example.en: Jasmine flowers have a lovely smell.
example.vi: Hoa nhài có mùi thơm dễ chịu.
image.brief: Dùng lại hình `w2` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`. Từ khoá tìm ảnh (EN): jasmine flowers white close up
image.alt.en: White jasmine flowers
image.alt.vi: Những bông hoa nhài trắng

### sound
id: 4bc62469-0f83-4ef1-b34b-5e903ea47de5
tier: core
term.en: sound
term.vi: tiếng
example.en: A rooster makes a loud sound.
example.vi: Tiếng gà trống gáy rất to.
image.brief: Dùng lại hình `w1` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`. Từ khoá tìm ảnh (EN): rooster crowing farm yard
image.alt.en: A rooster crowing
image.alt.vi: Con gà trống đang gáy
> VI dùng "tiếng", không "âm thanh" (để dành chủ đề *Âm thanh*, bảng Tên gọi).

### danger
id: 1c3bb6f2-2d96-426a-a7a8-97d6a7e4d9db
tier: core
term.en: danger
term.vi: nguy hiểm
example.en: Smoke can mean danger.
example.vi: Khói có thể báo nguy hiểm.
image.brief: Dùng lại hình `explore_smoke` ở bài `ho-hap/giu-phoi-khoe`. Từ khoá tìm ảnh (EN): burning rice straw field smoke
image.alt.en: Smoke from burning straw in a field
image.alt.vi: Khói đốt rơm rạ trên cánh đồng

### siren
id: 4d1afa69-bdcf-4a1c-ba8f-14f6a581ab00
tier: extra
term.en: siren
term.vi: còi xe cứu thương
example.en: You hear a siren with your ears.
example.vi: Em nghe tiếng còi xe cứu thương bằng tai.
image.brief: Dùng lại hình `tray_siren`. Từ khoá tìm ảnh (EN): ambulance light bar
image.alt.en: The lights on an ambulance
image.alt.vi: Đèn trên nóc xe cứu thương

## Thưởng

### nose_card
id: 87f74ac3-7991-41ce-8b3f-fcd2548b6b3c
set: body
rarity: common
name.en: Nose
name.vi: Cái mũi
tag.en: Knows many smells
tag.vi: Nhận ra rất nhiều mùi
fact.en: Your nose knows thousands of different smells.
fact.vi: Mũi em nhận ra hàng nghìn mùi khác nhau.
> [CẦN KIỂM] Số mùi người phân biệt được (các nghiên cứu ước khác nhau, từ khoảng mười nghìn tới rất nhiều hơn); "hàng nghìn" là cách nói an toàn.
image.brief: Dùng lại hình `tray_nose` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A nose
image.alt.vi: Cái mũi
> Bộ `set: body`; thẻ Nose chưa có.

## Ghi chú cho hoạ sĩ

- **Ảnh mới (bốn):** `explore_bread` (ổ bánh mì Việt Nam nguyên ổ, không túi in chữ, không quầy có biển), `tray_burnt` (lát bánh mì cháy đen trên đĩa, không khói, không lò nướng), `tray_siren` (cận dàn đèn trên nóc xe cứu thương; không chữ, không chữ thập đỏ, không biển số, không người), `q3_green` (đèn giao thông xanh, cùng góc, cùng bộ với đèn đỏ `q3` của *Não bộ và giác quan* bài 3). Ba ảnh đầu là hình gốc của cả chủ đề (bài 6 dùng lại `explore_bread`, `tray_burnt`): giữ đúng key.
- **Hình vẽ mới:** không có.
- **Hình dùng lại:**
  - Trong chủ đề: `tray_elbow` ở bài `co-the-cua-em/bo-phan-ben-ngoai-co-the` (w2; hình vẽ mới của bài 2).
  - *Não bộ và giác quan* bài 1 `nao-dieu-khien-co-the`: `w1` gà trống (ô Hear, kệ, q5, từ `sound`), `w2` hoa nhài (kệ, q4, từ `smell`), `w1_ear` (w1).
  - *Não bộ và giác quan* bài 3 `giac-quan-gui-tin-ve-nao`: `explore_join` xoài chín (ô See, q1), `q3` đèn đỏ (kệ, q3), `tray_rainbow` (kệ, q1), `tray_rain_roof` (q1, q5), `explore_five` (q6).
  - *Hô hấp*: `tray_nose` ở bài `duong-di-cua-khong-khi` (w1, thẻ), `explore_smoke` ở bài `giu-phoi-khoe` (ô Keep safe, từ `danger`).
  - *Gọi tên và nhóm động vật* bài 1: `w1` hàng rào tre (hình câu w1, q1, q3, q4, q5).
- **Ảnh khó:** dàn đèn xe cứu thương sạch chữ và chữ thập đỏ; bánh mì không túi in chữ; bánh mì cháy không máy nướng; đèn xanh cùng bộ với đèn đỏ. Không có ảnh hợp lệ thì báo phiên chính để đổi món, không vẽ lẻ một hình giữa các ảnh của kệ.
- **Crop riêng:** `explore_bread` dùng ở khung vuông, khung bốn ba (q2) và thẻ năm hai (q4); `tray_burnt` ở khung vuông và thẻ năm hai (q4), bài 6 khung bốn ba; `tray_siren` ở khung vuông và thẻ năm hai (q5); `q3_green` và `q3` đèn đỏ ở thẻ hai lựa chọn mười bảy mười. Hình ghép `explore_five` ở khung bốn ba (q6).
- **An toàn:** không lửa gần, không nhà cháy, không tai nạn, không người bị thương, không bệnh viện; khói chỉ là khói rơm rạ ở xa.
- **Màu:** Học: See `cham`, Smell `gi_dong`, Hear `vang_hoe`, Keep safe `nau_dat`. Chơi: Nhìn `cham`, Ngửi `gi_dong`, Nghe `vang_hoe`, Không nguy hiểm `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (smell, sound, danger). Chơi `build_tray` ba chỗ, ba nhóm `required` (mỗi nhóm một món), một nhóm `limit` (bốn món), bảy món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Đúng). Quiz `single_choice` (q1, q4, q5 ba lựa chọn; q3 hai lựa chọn), `true_false` (q2 Đúng, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`senses_not_for_safety`). Không có `labels` ở câu `true_false`.
- **Thứ tự trong file** (app xáo, SK-047): w1 đáp án chỗ một, q1 chỗ ba, q3 chỗ hai (trên hai), q4 chỗ một, q5 chỗ hai.
- **Màn Chơi, ví dụ để kiểm:** Đèn đỏ, Mùi khét, Còi xe cứu thương → `balanced`; Đèn đỏ, Mùi khét, Gà gáy → `has_limited`; Đèn đỏ, Còi xe cứu thương, Bánh mì mới nướng → `has_limited`; Đèn đỏ, Mùi khét (hai món) → `missing.tray_hear`.
- **Khởi động trỏ bài khác:** w1 → `co-the-cua-em/nam-giac-quan-cua-em`, w2 → `co-the-cua-em/bo-phan-ben-ngoai-co-the` (bài 2 do biên tập viên khác viết song song; chạy `ids` cho bài 1 đến 4 trước bài này).
- **Từ EN có thể ngoài Starters/Movers:** sense, senses, warn, danger, siren, ambulance, jasmine, lemongrass, rooster, crows, burnt, burning, smoke, grown-up, elbow, crossroads, cart, yummy, calm. Nghe thử giọng EN đọc "siren", "jasmine", "burnt bread"; VI "mùi khét", "còi xe cứu thương".
