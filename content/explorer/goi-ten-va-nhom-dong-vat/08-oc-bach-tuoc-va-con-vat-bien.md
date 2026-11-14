---
id: 9f50dd1d-663c-4592-8c0a-e35f1641f7a2
topic: goi-ten-va-nhom-dong-vat
slug: oc-bach-tuoc-va-con-vat-bien
order: 8
stage: review
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Snails, octopuses and sea animals
vi: Ốc, bạch tuộc và những con vật ở biển
> Bài mở rộng, không có trong sườn Oak (Duy yêu cầu 13/11). Tên bài do biên tập đặt: không đặt "Con vật không xương sống ở biển" vì ốc sên sống trên cạn, và nhóm thân mềm có cả ốc ao, ốc vườn. PM thêm bài này vào `content/syllabus.json` và `syllabus.md`.

## Mục tiêu
en: I can name more animals with no backbone.
vi: Em gọi tên được thêm những con vật không có xương sống.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-041, ngày 13/11/2026. Mọi dòng `id:` để trống; chạy `ids` sau bài một đến bảy.
> Bài cuối của chủ đề (`review`): Khởi động ôn bài bảy, năm, sáu; quiz q5 hỏi lại "có xương sống" với một con cá trông lạ (cá ngựa). Rà chữ tester 13/11 (n5) đề xuất `core` hoặc `apply` vì bài có nhiều ý mới; biên tập giữ `review` vì chủ đề cần một bài tổng kết ở cuối (syllabus-progression mục 6) và bài sáu đã đổi sang `core`. PM chốt. Nhóm của bài: thân mềm (ốc, bạch tuộc, mực), da gai (sao biển, nhím biển, hải sâm), thân lỗ (bọt biển); sứa để riêng một ô.
> Không bắt bé nhớ tên ngành. Chữ cho bé dùng điều nhìn thấy: "thân mềm", "da có gai", "thân đầy lỗ nhỏ". "Mollusc" · "thân mềm" là từ `extra` để nghe; "da gai", "thân lỗ" không thành từ vựng (quá khó cho năm đến bảy tuổi).
> Sửa `starfish_is_fish` ở câu q6 (gắn key).

## Ý chính
1.en: Snails and octopuses have soft bodies.
1.vi: Ốc và bạch tuộc có thân mềm.
2.en: A starfish has spiny skin and arms.
2.vi: Sao biển có da gai và có nhiều cánh.
3.en: A sponge is an animal full of holes.
3.vi: Bọt biển là một con vật, thân đầy lỗ nhỏ.
> Từ cụ thể tới trừu tượng: con bé thấy ở chợ, ở vườn (ốc, mực), con ở biển bé có thể thấy khi đi chơi (sao biển), rồi một con vật không giống con vật chút nào (bọt biển).
> [CẦN KIỂM] Ý hai: sao biển, nhím biển thuộc ngành da gai, da có gai nhỏ; ý ba: bọt biển (ngành thân lỗ) là động vật, sống bám một chỗ, lọc thức ăn từ nước.

## Khởi động

> Ba câu ôn trộn: w1 bài bảy (bài trước), w2 bài năm, w3 bài sáu.

### w1
id: e84e33bf-a60e-4318-979f-572ea86d53a8
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan
prompt.en: Which one has eight legs?
prompt.vi: Con nào có tám chân?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Count the legs on each one.
hint.vi: Em đếm chân của từng con nhé.
explanation_correct.en: Yes! Spiders and scorpions have eight legs.
explanation_correct.vi: Đúng rồi! Nhện và bọ cạp đều có tám chân.
explanation_wrong.en: The answer is the spider. It has eight legs.
explanation_wrong.vi: Đáp án là con nhện. Nhện có tám chân.

#### option w1_spider
correct: true
label.en: spider
label.vi: con nhện
image.brief: Dùng lại hình `explore_spiders` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): garden orb spider web
image.alt.en: A spider in its web
image.alt.vi: Con nhện trên mạng tơ

#### option w1_ant
correct: false
feedback.en: An ant has six legs.
feedback.vi: Con kiến có sáu chân.
label.en: ant
label.vi: con kiến
image.brief: Dùng lại hình `tray_ant` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): weaver ant on leaf close up
image.alt.en: An ant on a leaf
image.alt.vi: Con kiến trên lá

### w2
id: 321d6887-2da9-45b6-a893-f052f6a41081
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/co-the-cac-con-vat
prompt.en: A fish uses legs to swim.
prompt.vi: Cá bơi bằng chân.
image.brief: Dùng lại hình `tray_goldfish` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): goldfish aquarium plants side view
image.alt.en: A goldfish in a tank
image.alt.vi: Cá vàng trong bể
answer: false
hint.en: Look closely at the fish's body.
hint.vi: Em nhìn kỹ thân con cá nhé.
explanation_correct.en: A fish has no legs. It swims with fins.
explanation_correct.vi: Cá không có chân. Cá bơi bằng vây và đuôi.
explanation_wrong.en: This is false. Fish swim with fins.
explanation_wrong.vi: Câu này sai. Cá bơi bằng vây.
feedback_true.en: A fish swims with fins, not legs.
feedback_true.vi: Cá bơi bằng vây, không bằng chân.
> Rà chữ tester 13/11 (n12): câu cũ "Wings help birds fly." · "Cánh giúp chim bay." bỏ, vì chữ "cánh" của chim trùng chữ "cánh" của sao biển trong cùng bài, bé nghe dễ hình dung sao biển bay. Câu mới ôn bài năm, đúng chữ câu q2 bài năm (lặp có chủ ý ở bài tổng kết). Đáp án Sai, giải thích khi đúng không mở đầu bằng "Yes!".

### w3
id: 10280381-8968-4d9e-ae15-d9d905b21dbe
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/con-vat-an-gi
prompt.en: A buffalo eats meat.
prompt.vi: Con trâu ăn thịt.
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu
answer: false
hint.en: Remember the Plant-eaters picture.
hint.vi: Em nhớ lại ô Ăn thực vật nhé.
explanation_correct.en: A buffalo eats grass, not meat.
explanation_correct.vi: Trâu ăn cỏ, không ăn thịt.
explanation_wrong.en: This is false. A buffalo eats plants.
explanation_wrong.vi: Câu này sai. Trâu ăn thực vật.
feedback_true.en: A buffalo eats grass in the field.
feedback_true.vi: Trâu gặm cỏ ngoài đồng.
> Rà chữ tester 13/11 (n14): câu cũ "A cat eats grass." bỏ (mèo có gặm cỏ thật, dễ tranh cãi); dùng phương án thay đã ghi sẵn. Hình là trâu bên suối, không phải ảnh trâu gặm cỏ của bài sáu (bằng chứng của đáp án).

## Học

> Bốn ô: thân mềm, da có gai, thân đầy lỗ nhỏ, sứa. Sứa để một ô riêng, không xếp vào thân mềm (Duy lưu ý 13/11).
> Ô "Jellyfish" bản VI không dùng chữ "thân mềm" để tả sứa (nghe trùng tên nhóm thân mềm); dùng "trong như thạch".

### explore
id: 327080cf-37aa-4ca9-934b-75d8a8a01169
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_soft
label.en: Soft bodies
label.vi: Thân mềm
color: vang_hoe
sentence.en: Snails and octopuses have soft bodies.
sentence.vi: Ốc và bạch tuộc có thân mềm.
image.brief: [ảnh] Một con bạch tuộc đang bò trên đáy biển hoặc trên rạn đá dưới nước, ảnh ngang, thấy rõ thân mềm và các xúc tu; không có thợ lặn, không có tay người, không có chữ; không phải bạch tuộc ở chợ hay trên đĩa. Ưu tiên ảnh NOAA trên Commons, không kèm logo. Từ khoá tìm ảnh (EN): octopus on sea floor underwater
image.alt.en: An octopus under the sea
image.alt.vi: Con bạch tuộc dưới biển
examples.1.en: a snail carries its shell
examples.1.vi: ốc mang vỏ trên lưng
examples.2.en: an octopus has eight arms
examples.2.vi: bạch tuộc có tám xúc tu
examples.3.en: a squid swims fast
examples.3.vi: con mực bơi rất nhanh
examples.4.en: a garden snail, too
examples.4.vi: cả con ốc sên trong vườn
> [CẦN KIỂM] Ốc, bạch tuộc, mực thuộc ngành thân mềm. Người Việt hay gọi "cá mực", nhưng mực không phải cá; chữ cho bé dùng "con mực".
> Hình gốc, dùng lại ở câu q1, câu q5, từ `octopus`, thẻ thưởng.

#### group explore_spiny
label.en: Spiny skin
label.vi: Da có gai
color: nau_dat
sentence.en: A starfish has spiny skin and arms.
sentence.vi: Sao biển có da gai và có nhiều cánh.
image.brief: [ảnh] Một con sao biển còn sống bám trên tảng đá dưới nước nông, ảnh ngang, nhìn từ trên xuống, thấy rõ năm cánh và lớp da sần có gai nhỏ; không phải sao biển phơi khô làm đồ lưu niệm, không có tay người, không có chữ. Từ khoá tìm ảnh (EN): starfish on rock tide pool
image.alt.en: A starfish on a rock
image.alt.vi: Con sao biển trên tảng đá
examples.1.en: a starfish on the rocks
examples.1.vi: sao biển trên đá
examples.2.en: a sea urchin
examples.2.vi: nhím biển
examples.3.en: a sea cucumber
examples.3.vi: hải sâm
examples.4.en: most starfish have five arms
examples.4.vi: phần lớn sao biển có năm cánh
> [CẦN KIỂM] Sao biển, nhím biển, hải sâm thuộc ngành da gai; phần lớn sao biển có năm cánh, có loài nhiều hơn. Ô này không nói "sao biển không phải là cá", để câu q6 vẫn là suy luận.
> Hình gốc, dùng lại ở câu q3, câu q5, câu q6, từ `starfish`.

#### group explore_sponge
label.en: Full of holes
label.vi: Thân đầy lỗ
color: cham
sentence.en: A sponge is an animal full of holes.
sentence.vi: Bọt biển là một con vật, thân đầy lỗ nhỏ.
image.brief: [ảnh] Một con bọt biển màu cam hoặc vàng mọc trên rạn san hô dưới biển, ảnh ngang, chụp cận vừa, thấy rõ các lỗ trên thân; không có thợ lặn, không có chữ. Ưu tiên ảnh NOAA trên Commons. Từ khoá tìm ảnh (EN): sea sponge on reef holes
image.alt.en: A sea sponge on a reef
image.alt.vi: Bọt biển trên rạn san hô
examples.1.en: it stays in one place
examples.1.vi: bọt biển ở yên một chỗ
examples.2.en: water flows through the holes
examples.2.vi: nước chảy qua các lỗ nhỏ
examples.3.en: it eats tiny bits in the water
examples.3.vi: bọt biển ăn những mẩu rất nhỏ trong nước
examples.4.en: a kitchen sponge is not alive
examples.4.vi: miếng mút rửa bát không phải vật sống
> [CẦN KIỂM] như ý chính ba. Ví dụ bốn tách bọt biển thật khỏi miếng mút rửa bát (tiếng Anh cùng chữ "sponge").
> Hình gốc, dùng lại ở món Chơi, câu q3, từ `sponge`.

#### group explore_jelly
label.en: Jellyfish
label.vi: Sứa
color: gi_dong
sentence.en: A jellyfish is like jelly. It can sting.
sentence.vi: Sứa trong như thạch. Sứa có thể châm làm rát da.
image.brief: [ảnh] Một con sứa trong suốt đang trôi trong nước biển xanh, ảnh ngang, thấy cả thân và các tua; không phải sứa dạt trên bãi cát, không có người, không có chữ. Từ khoá tìm ảnh (EN): jellyfish swimming blue water
image.alt.en: A jellyfish in the sea
image.alt.vi: Con sứa dưới biển
examples.1.en: it has no bones at all
examples.1.vi: sứa không có xương
examples.2.en: it drifts in the sea
examples.2.vi: sứa trôi theo dòng nước
examples.3.en: on the beach, do not touch it
examples.3.vi: thấy sứa trên bãi biển, em đừng chạm vào
> [CẦN KIỂM] Sứa thuộc ngành ruột khoang (Cnidaria), không thuộc thân mềm; tua sứa có tế bào châm. Ô này không xếp sứa vào nhóm nào khác, không có câu quiz về sứa, chỉ có từ `extra`.
> Ví dụ ba là lời dặn an toàn (cả sứa dạt vào bờ vẫn châm được) [CẦN KIỂM].

### new_words
id: bfb3c3e4-615b-4c35-b400-99e5d41a47e5
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: octopus, starfish, sponge

## Chơi

> Bé chọn ba con không có xương sống: một con thân mềm, một con da có gai, một con thân đầy lỗ. Đạt khi đủ ba nhóm và không chọn con có xương sống.
> Món bẫy: cá ngựa trông không giống cá nhưng là cá, có xương sống; cá heo sống dưới biển nhưng là động vật có vú (bài hai, bốn).
> Sứa không có ở kệ (không thuộc ba nhóm của kệ). Nhãn `limit` "Has a backbone" · "Có xương sống" như bài bảy (lý do ghi ở bài bảy), màu `do_son` như mọi nhóm bẫy.
> Kệ bảy món, toàn ảnh chụp.

### tray
id: 17510c64-5e7c-431f-b26b-d02c97fc44d6
type: build_tray
version: 1
prompt.en: Pick three animals with no backbone
prompt.vi: Chọn ba con vật không có xương sống
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find a soft body, spiny skin and holes.
messages.start.vi: Em tìm một con thân mềm, một con da có gai, một con thân đầy lỗ nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! None of them has a backbone.
messages.balanced.vi: Tuyệt! Không con nào có xương sống.
messages.has_limited.en: That one has a backbone.
messages.has_limited.vi: Con này có xương sống.
messages.missing.tray_soft.en: You still need a soft body.
messages.missing.tray_soft.vi: Em còn thiếu một con thân mềm.
messages.missing.tray_spiny.en: You still need one with spiny skin.
messages.missing.tray_spiny.vi: Em còn thiếu một con da có gai.
messages.missing.tray_holes.en: You still need one full of holes.
messages.missing.tray_holes.vi: Em còn thiếu một con thân đầy lỗ.

#### group tray_soft
label.en: Soft body
label.vi: Thân mềm
color: vang_hoe
role: required

#### group tray_spiny
label.en: Spiny skin
label.vi: Da có gai
color: nau_dat
role: required

#### group tray_holes
label.en: Full of holes
label.vi: Thân đầy lỗ
color: cham
role: required

#### group tray_backbone
label.en: Has a backbone
label.vi: Có xương sống
color: do_son
role: limit

#### item tray_octopus
label.en: Octopus
label.vi: Bạch tuộc
group: tray_soft
image.brief: Dùng lại hình `explore_soft`. Từ khoá tìm ảnh (EN): octopus on sea floor underwater
image.alt.en: An octopus under the sea
image.alt.vi: Con bạch tuộc dưới biển

#### item tray_seahorse
label.en: Seahorse
label.vi: Cá ngựa
group: tray_backbone
image.brief: [ảnh] Một con cá ngựa bám đuôi vào cọng rong dưới nước, ảnh ngang, nhìn nghiêng, thấy cả con; không phải cá ngựa phơi khô, không có tay người, không có chữ. Từ khoá tìm ảnh (EN): seahorse underwater seagrass side view
image.alt.en: A seahorse under the sea
image.alt.vi: Con cá ngựa dưới biển
> [CẦN KIỂM] Cá ngựa là cá, có xương sống, có vây. Hình gốc, dùng lại ở câu q4, câu q5.

#### item tray_starfish
label.en: Starfish
label.vi: Sao biển
group: tray_spiny
image.brief: Dùng lại hình `explore_spiny`. Từ khoá tìm ảnh (EN): starfish on rock tide pool
image.alt.en: A starfish on a rock
image.alt.vi: Con sao biển trên tảng đá

#### item tray_snail
label.en: Snail
label.vi: Con ốc sên
group: tray_soft
image.brief: [ảnh] Một con ốc sên bò trên lá xanh, ảnh ngang, nhìn nghiêng, thấy rõ vỏ xoắn và phần thân mềm thò ra cùng hai râu; không có tay người, không có chữ. Từ khoá tìm ảnh (EN): garden snail on leaf side view
image.alt.en: A snail on a leaf
image.alt.vi: Con ốc sên trên lá
> Hình gốc, dùng lại ở câu q2, từ `mollusc`.

#### item tray_dolphin
label.en: Dolphin
label.vi: Cá heo
group: tray_backbone
image.brief: Dùng lại hình `tray_dolphin` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): dolphin jumping out of sea NOAA
image.alt.en: A dolphin jumping out of the sea
image.alt.vi: Cá heo nhảy lên khỏi mặt biển

#### item tray_sponge
label.en: Sea sponge
label.vi: Bọt biển
group: tray_holes
image.brief: Dùng lại hình `explore_sponge`. Từ khoá tìm ảnh (EN): sea sponge on reef holes
image.alt.en: A sea sponge on a reef
image.alt.vi: Bọt biển trên rạn san hô

#### item tray_urchin
label.en: Sea urchin
label.vi: Nhím biển
group: tray_spiny
image.brief: [ảnh] Một con nhím biển đen gai dài nằm trên đá dưới nước nông, ảnh ngang, thấy cả con và các gai; không có tay người, không có chữ; không phải nhím biển đã tách vỏ để ăn. Từ khoá tìm ảnh (EN): sea urchin on rock underwater
image.alt.en: A sea urchin on a rock
image.alt.vi: Con nhím biển trên đá
> [CẦN KIỂM] Nhím biển thuộc ngành da gai. Hình gốc, dùng lại ở câu q1, câu q4.

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1, q3, q4, q5; ba lựa chọn), `true_false` (q2, q6). Bài này không dùng `order_sequence`: các nhóm không có thứ tự tự nhiên.

### q1
id: 2bdb4681-ae25-48a7-8c07-5b1260cb1476
format: single_choice
version: 1
dok: 1
prompt.en: Which one has a soft body?
prompt.vi: Con nào có thân mềm?
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê
hint.en: Look for one with no hard shell.
hint.vi: Em tìm con không có vỏ cứng nhé.
explanation_correct.en: Yes! An octopus can squeeze into small gaps.
explanation_correct.vi: Đúng rồi! Thân bạch tuộc mềm, chui lọt cả khe nhỏ.
explanation_wrong.en: The answer is the octopus. Its body is soft.
explanation_wrong.vi: Đáp án là bạch tuộc. Thân bạch tuộc mềm.
> Hai lựa chọn sai đều cứng bên ngoài (cua có vỏ, nhím biển có gai). Rà chữ tester 13/11 (N5): thay rùa (con quen) bằng nhím biển (mới hôm nay), để bạch tuộc không là con mới duy nhất giữa hai con quen. Không dùng ốc ở câu này: ốc có vỏ cứng, dễ làm bé rối; câu q2 nói riêng về ốc.

#### option q1_crab
correct: false
feedback.en: A crab has a hard shell.
feedback.vi: Con cua có vỏ cứng.
label.en: crab
label.vi: con cua
image.brief: Dùng lại hình `explore_crabs` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): freshwater rice field crab mud
image.alt.en: A crab on the mud
image.alt.vi: Con cua trên bùn

#### option q1_urchin
correct: false
feedback.en: A sea urchin is hard and spiny.
feedback.vi: Nhím biển cứng và đầy gai.
label.en: sea urchin
label.vi: nhím biển
image.brief: Dùng lại hình `tray_urchin`. Từ khoá tìm ảnh (EN): sea urchin on rock underwater
image.alt.en: A sea urchin on a rock
image.alt.vi: Con nhím biển trên đá

#### option q1_octopus
correct: true
label.en: octopus
label.vi: bạch tuộc
image.brief: Dùng lại hình `explore_soft`. Từ khoá tìm ảnh (EN): octopus on sea floor underwater
image.alt.en: An octopus under the sea
image.alt.vi: Con bạch tuộc dưới biển

### q2
id: 85d58197-2210-4992-96c4-fb692fcf7887
format: true_false
version: 1
dok: 1
prompt.en: A snail has a soft body.
prompt.vi: Con ốc có thân mềm.
image.brief: Dùng lại hình `tray_snail`. Từ khoá tìm ảnh (EN): garden snail on leaf side view
image.alt.en: A snail on a leaf
image.alt.vi: Con ốc sên trên lá
answer: true
hint.en: Look at the part out of the shell.
hint.vi: Em nhìn phần thân thò ra khỏi vỏ nhé.
explanation_correct.en: Yes! The shell is hard. The body is soft.
explanation_correct.vi: Đúng rồi! Vỏ ốc cứng, nhưng thân ốc mềm.
explanation_wrong.en: This is true. A snail's body is soft.
explanation_wrong.vi: Câu này đúng. Thân con ốc mềm.
feedback_false.en: A snail's body comes out soft and wet.
feedback_false.vi: Thân ốc thò ra khỏi vỏ, mềm và ướt.

### q3
id: a85cce51-0ccb-448a-9249-9eb1403a5613
format: single_choice
version: 1
dok: 1
prompt.en: Which one is full of tiny holes?
prompt.vi: Con nào có thân đầy lỗ nhỏ?
image.brief: [ảnh] Mặt biển xanh và một bãi cát vắng, ảnh ngang, chụp rộng; không có con vật, không có người, không có thuyền, không có chữ. Từ khoá tìm ảnh (EN): empty beach blue sea
image.alt.en: A beach by the sea
image.alt.vi: Bãi biển vắng
hint.en: Look closely at each body.
hint.vi: Em nhìn thật kỹ thân của từng con nhé.
explanation_correct.en: Yes! Water flows through a sponge's holes.
explanation_correct.vi: Đúng rồi! Nước chảy qua những lỗ nhỏ trên thân bọt biển.
explanation_wrong.en: The answer is the sponge. It is full of holes.
explanation_wrong.vi: Đáp án là bọt biển. Thân bọt biển đầy lỗ nhỏ.
> Hình gốc của câu hỏi (bãi biển trung tính), dùng lại ở câu q4.

#### option q3_sponge
correct: true
label.en: sea sponge
label.vi: bọt biển
image.brief: Dùng lại hình `explore_sponge`. Từ khoá tìm ảnh (EN): sea sponge on reef holes
image.alt.en: A sea sponge on a reef
image.alt.vi: Bọt biển trên rạn san hô

#### option q3_starfish
correct: false
feedback.en: A starfish has spiny skin, not holes.
feedback.vi: Sao biển có da gai, không đầy lỗ.
label.en: starfish
label.vi: sao biển
image.brief: Dùng lại hình `explore_spiny`. Từ khoá tìm ảnh (EN): starfish on rock tide pool
image.alt.en: A starfish on a rock
image.alt.vi: Con sao biển trên tảng đá

#### option q3_crab
correct: false
feedback.en: A crab has a hard, smooth shell.
feedback.vi: Con cua có vỏ cứng và nhẵn.
label.en: crab
label.vi: con cua
image.brief: Dùng lại hình `explore_crabs` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): freshwater rice field crab mud
image.alt.en: A crab on the mud
image.alt.vi: Con cua trên bùn

### q4
id: c96a07a1-c26a-43f2-9a9e-86f5f233ac10
format: single_choice
version: 1
dok: 2
prompt.en: Which animal has no backbone?
prompt.vi: Con nào không có xương sống?
image.brief: Dùng lại hình `q3`. Từ khoá tìm ảnh (EN): empty beach blue sea
image.alt.en: A beach by the sea
image.alt.vi: Bãi biển vắng
hint.en: Which ones have bones inside?
hint.vi: Em nghĩ xem con nào có xương bên trong?
explanation_correct.en: Yes! A sea urchin has spines, not bones.
explanation_correct.vi: Đúng rồi! Nhím biển có gai, không có xương sống.
explanation_wrong.en: The answer is the sea urchin. It has no backbone.
explanation_wrong.vi: Đáp án là nhím biển. Nhím biển không có xương sống.
> DOK 2: phân loại. Cá heo, cá ngựa sống dưới biển như nhím biển nhưng có xương sống. Bé phải nghĩ về xương bên trong, không chọn theo chỗ sống. Rà chữ tester 13/11 (N5): thay ếch (con quen) bằng cá ngựa (mới hôm nay, có xương sống thật), dọn đường cho câu q5. Ba con đều sống ở biển.
> Rà chữ tester 13/11 (n13): q4 "không có xương sống" và q5 "có xương sống" chỉ khác chữ "không"; không viết được dạng khẳng định giữ ý. Giữ q4 trước q5; đề xuất ios-dev ở Ghi chú cho dev.

#### option q4_dolphin
correct: false
feedback.en: A dolphin has a backbone, like us.
feedback.vi: Cá heo có xương sống, giống mình.
label.en: dolphin
label.vi: cá heo
image.brief: Dùng lại hình `tray_dolphin` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): dolphin jumping out of sea NOAA
image.alt.en: A dolphin jumping out of the sea
image.alt.vi: Cá heo nhảy lên khỏi mặt biển

#### option q4_urchin
correct: true
label.en: sea urchin
label.vi: nhím biển
image.brief: Dùng lại hình `tray_urchin`. Từ khoá tìm ảnh (EN): sea urchin on rock underwater
image.alt.en: A sea urchin on a rock
image.alt.vi: Con nhím biển trên đá

#### option q4_seahorse
correct: false
feedback.en: A seahorse has fins, like a fish.
feedback.vi: Cá ngựa có vây, giống các loài cá.
label.en: seahorse
label.vi: cá ngựa
image.brief: Dùng lại hình `tray_seahorse`. Từ khoá tìm ảnh (EN): seahorse underwater seagrass side view
image.alt.en: A seahorse under the sea
image.alt.vi: Con cá ngựa dưới biển

### q5
id: b4bcbbdd-53e2-4526-9293-d023badfcc93
format: single_choice
version: 1
dok: 2
prompt.en: Which one has a backbone?
prompt.vi: Con nào có xương sống?
image.brief: Dùng lại hình `q3` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): village house yard Vietnam morning
image.alt.en: A yard in a village
image.alt.vi: Sân nhà ở làng quê
hint.en: Remember: fish have backbones.
hint.vi: Em nhớ nhé: cá có xương sống.
explanation_correct.en: Yes! A seahorse has fins. It is a fish.
explanation_correct.vi: Đúng rồi! Cá ngựa có vây nên là một loài cá.
explanation_wrong.en: The answer is the seahorse. It is a fish.
explanation_wrong.vi: Đáp án là cá ngựa. Cá ngựa là một loài cá.
> DOK 2, ôn cả chủ đề: cá ngựa không giống cá chép, nhưng là cá (bài bốn), nên có xương sống (bài bảy). Gợi ý cho bé một mắt xích, bé phải tự nhận ra cá ngựa là cá. Cá ngựa là món bẫy ở phần Chơi.

#### option q5_octopus
correct: false
feedback.en: An octopus has a soft body, no bones.
feedback.vi: Bạch tuộc thân mềm, không có xương.
label.en: octopus
label.vi: bạch tuộc
image.brief: Dùng lại hình `explore_soft`. Từ khoá tìm ảnh (EN): octopus on sea floor underwater
image.alt.en: An octopus under the sea
image.alt.vi: Con bạch tuộc dưới biển

#### option q5_starfish
correct: false
feedback.en: A starfish has spiny skin, no backbone.
feedback.vi: Sao biển có da gai, không có xương sống.
label.en: starfish
label.vi: sao biển
image.brief: Dùng lại hình `explore_spiny`. Từ khoá tìm ảnh (EN): starfish on rock tide pool
image.alt.en: A starfish on a rock
image.alt.vi: Con sao biển trên tảng đá

#### option q5_seahorse
correct: true
label.en: seahorse
label.vi: cá ngựa
image.brief: Dùng lại hình `tray_seahorse`. Từ khoá tìm ảnh (EN): seahorse underwater seagrass side view
image.alt.en: A seahorse under the sea
image.alt.vi: Con cá ngựa dưới biển

### q6
id: 451a8f93-876c-4769-8068-c8a9e2873490
format: true_false
version: 1
dok: 2
misconception: starfish_is_fish
prompt.en: A starfish is a fish.
prompt.vi: Sao biển là một loài cá.
image.brief: Dùng lại hình `explore_spiny`. Từ khoá tìm ảnh (EN): starfish on rock tide pool
image.alt.en: A starfish on a rock
image.alt.vi: Con sao biển trên tảng đá
answer: false
hint.en: Does it have fins and a backbone?
hint.vi: Sao biển có vây và xương sống không?
explanation_correct.en: A starfish has no backbone. It is not a fish.
explanation_correct.vi: Sao biển không có xương sống. Sao biển không phải là cá.
explanation_wrong.en: This is false. A starfish is not a fish.
explanation_wrong.vi: Câu này sai. Sao biển không phải là cá.
feedback_true.en: A starfish has no fins and no backbone.
feedback_true.vi: Sao biển không có vây, không có xương sống.
> Câu misconception (`starfish_is_fish`): tên tiếng Anh "starfish", "jellyfish" có chữ "fish"; tiếng Việt có "cá mực". Bé nghe tên hoặc thấy con vật sống dưới biển là nghĩ "cá", sẽ chạm gật đầu.
> DOK 2: áp đặc điểm của cá (vây, mang, xương sống; bài bốn, bảy) vào một con vật biển. Đáp án Sai, giải thích khi đúng không mở đầu bằng "Yes!".

## Từ vựng

### octopus
id: 12129383-0829-4cb8-b651-32f33d4fd0fe
tier: core
term.en: octopus
term.vi: bạch tuộc
example.en: An octopus has eight arms.
example.vi: Bạch tuộc có tám xúc tu.
image.brief: Dùng lại hình `explore_soft`. Từ khoá tìm ảnh (EN): octopus on sea floor underwater
image.alt.en: An octopus under the sea
image.alt.vi: Con bạch tuộc dưới biển

### starfish
id: 9045d4f1-2f26-4b78-a8ee-e3dcdc7c5dd6
tier: core
term.en: starfish
term.vi: sao biển
example.en: A starfish lives in the sea.
example.vi: Sao biển sống ở biển.
image.brief: Dùng lại hình `explore_spiny`. Từ khoá tìm ảnh (EN): starfish on rock tide pool
image.alt.en: A starfish on a rock
image.alt.vi: Con sao biển trên tảng đá

### sponge
id: 10006fcc-c492-41ee-8ddc-2b82dc45836f
tier: core
term.en: sea sponge
term.vi: bọt biển
example.en: A sea sponge is an animal.
example.vi: Bọt biển là một con vật.
image.brief: Dùng lại hình `explore_sponge`. Từ khoá tìm ảnh (EN): sea sponge on reef holes
image.alt.en: A sea sponge on a reef
image.alt.vi: Bọt biển trên rạn san hô

### jellyfish
id: 70ab23ed-7fcd-42ee-9e79-eb67f1330ca5
tier: extra
term.en: jellyfish
term.vi: con sứa
example.en: A jellyfish can sting.
example.vi: Con sứa có thể châm làm rát da.
image.brief: Dùng lại hình `explore_jelly`. Từ khoá tìm ảnh (EN): jellyfish swimming blue water
image.alt.en: A jellyfish in the sea
image.alt.vi: Con sứa dưới biển

### mollusc
id: eaf6490f-6a69-4890-916e-f71ff1a0abe6
tier: extra
term.en: mollusc
term.vi: động vật thân mềm
example.en: Snails and octopuses are molluscs.
example.vi: Ốc và bạch tuộc là động vật thân mềm.
image.brief: Dùng lại hình `tray_snail`. Từ khoá tìm ảnh (EN): garden snail on leaf side view
image.alt.en: A snail on a leaf
image.alt.vi: Con ốc sên trên lá
> Tên nhóm chỉ để nghe (`extra`). Chính tả Anh "mollusc".

## Thưởng

### octopus_card
id: a87d1c29-764a-44f7-8e7c-990c354811a0
set: animals
rarity: rare
name.en: Octopus
name.vi: Bạch tuộc
tag.en: A master of hiding
tag.vi: Bậc thầy ẩn nấp
fact.en: An octopus can change colour to hide.
fact.vi: Bạch tuộc đổi được màu da để ẩn nấp.
image.brief: Dùng lại hình `explore_soft`. Từ khoá tìm ảnh (EN): octopus on sea floor underwater
image.alt.en: An octopus under the sea
image.alt.vi: Con bạch tuộc dưới biển
> [CẦN KIỂM] Bạch tuộc đổi màu, đổi cả độ sần của da để ẩn mình (biên tập nhớ). Chính tả Anh "colour".

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật, ảnh ngang. Con vật biển chụp còn sống dưới nước, không phải đồ khô, đồ ăn hay xác dạt bờ.
- **Ảnh cần tìm (tám):** bạch tuộc dưới biển; sao biển trên đá; bọt biển trên rạn san hô; sứa trôi trong nước; ốc sên trên lá; nhím biển trên đá; cá ngựa bám rong; bãi biển vắng (câu q3).
- **Ảnh khó:** bọt biển trông rõ là bọt biển (nhiều ảnh rạn san hô lẫn san hô, hải quỳ; chọn ảnh thấy rõ lỗ); bạch tuộc dưới nước không có thợ lặn; cá ngựa hoang dã (nhiều ảnh chụp ở bể thuỷ cung có kính phản chiếu).
- **Dùng lại:** bài 7 (`explore_spiders`, `tray_ant`, `explore_crabs`), bài 4 (`q1`), bài 2 (`tray_dolphin`), bài 1 (`w1`, `tray_goldfish`), *Khủng long* (`w1_buffalo`), *Hô hấp* (`q3`).
- **Màu** (rà chữ tester 13/11 N1: nhóm bẫy `do_son` như sáu bài trước): Học: thân mềm `vang_hoe`, da có gai `nau_dat`, thân đầy lỗ `cham`, sứa `gi_dong`. Chơi: thân mềm `vang_hoe`, da có gai `nau_dat`, thân đầy lỗ `cham`, có xương sống `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (octopus, starfish, sponge). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Sai, w3 Sai). Quiz `single_choice` (q1, q3, q4, q5), `true_false` (q2 Đúng, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`starfish_is_fish`).
- **q4 và q5 chỉ khác chữ "không"** ("Which animal has no backbone?" rồi "Which one has a backbone?"; rà chữ tester 13/11 n13): đề xuất ios-dev cho giọng đọc chậm hơn ở hai câu này hoặc nhấn chữ "no" · "không" (ví dụ chèn khoảng lặng ngắn trước chữ đó khi sinh giọng). Giữ thứ tự q4 trước q5.
- **Khoá `q3`** (n16, không đổi): hình gốc bãi biển mang khoá của câu hỏi `q3` bài này (khoá câu theo luật `q1`…`q6`, không đổi tên được). Câu q4 trỏ `q3` không có `ở bài`; câu q5 trỏ `q3` ở bài `ho-hap/vi-sao-ta-phai-tho` (sân nhà). Designer lưu ý khi dựng `same_as`.
- **Vị trí đáp án đúng:** w1 thứ nhất; q1 thứ ba; q3 thứ nhất; q4 thứ hai; q5 thứ ba.
- **Màn Chơi, ví dụ để kiểm:** Bạch tuộc, Sao biển, Bọt biển → `balanced`; Con ốc sên, Nhím biển, Cá ngựa → `has_limited`; Bạch tuộc, Con ốc sên, Sao biển → `missing.tray_holes`.
- **Syllabus:** bài mới, chưa có trong `content/syllabus.json`.
- **Từ EN có thể ngoài Starters/Movers:** octopus, starfish, sponge, jellyfish, sea urchin, seahorse, squid, mollusc, spiny, sting.
