---
id: bf1d8df5-b2db-4333-b2fc-6dae7e42ebc2
topic: bau-troi-ngay-va-dem
slug: mat-troi-moc-mat-troi-lan
order: 3
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Sunrise and sunset
vi: Mặt Trời mọc, Mặt Trời lặn
> Tên mới của bài 3 theo SK-061 (quyết định 4: thay *Bóng nắng đổi theo giờ*). Lúc soạn, `content/syllabus.json` còn tên cũ; dev đổi danh mục ở Phần A1. `id` để trống.

## Mục tiêu
en: I can tell sunrise from sunset.
vi: Em phân biệt được Mặt Trời mọc và Mặt Trời lặn.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 19/11/2026. Ticket SK-061. Mọi dòng `id:` để trống.
> Ý của SK-061: sáng sớm Mặt Trời mọc, trưa lên cao, nắng nhất, chiều Mặt Trời lặn, rồi trời tối; bình minh, hoàng hôn. Chỉ nói "mọc, lên cao, lặn" như lời thường ngày (khuyến nghị 2); không nói Mặt Trời hay Trái Đất chuyển động, không phía đông, phía tây, không bóng (Discoverer #7, #12).

## Ý chính
1.en: In the morning, the Sun rises.
1.vi: Buổi sáng, Mặt Trời mọc.
2.en: At noon, the Sun is high. Sunshine is strong.
2.vi: Buổi trưa, Mặt Trời lên cao, nắng gắt.
3.en: In the evening, the Sun sets.
3.vi: Chiều tối, Mặt Trời lặn.
> Ba mốc của một ngày theo đúng thứ tự bé sống (sáng, trưa, chiều tối); ý cuối nối sang bài 2 (rồi trời tối).
> Ghép với ô Học (`KeyPointPictures.match`): ý 1 → Sunrise (morn, sun, ris), ý 2 → Noon (noon, sun, high; lượt 2 tester n10 đổi EN thành hai câu, "sunshin", "strong" không ghép ô nào khác), ý 3 → Sunset (even, sun, set). Ô Lights on không ghép.
> [CẦN KIỂM] "nắng gắt" lúc trưa: nắng mạnh nhất quanh trưa; nóng nhất thường đầu giờ chiều. Chữ bé nghe chỉ nói "nắng gắt" · "hot", không nói "nóng nhất".

## Khởi động

> Hai câu: w1 ôn bài trước (hai hình vẽ ngày và đêm, mốc "hôm trước"); w2 ôn *Cơ thể của em* bài 4 (mắt để nhìn, mốc "rất xa"; SK-061 khuyến nghị 4).

### w1
id: 33b6e839-3f84-4516-a824-92dc7cd9d2ff
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: bau-troi-ngay-va-dem/ngay-va-dem
prompt.en: Which picture shows day?
prompt.vi: Hình nào là ban ngày?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look at the sky in each picture.
hint.vi: Em nhìn bầu trời trong từng hình nhé.
explanation_correct.en: Yes! By day, we go out and play.
explanation_correct.vi: Đúng rồi! Ban ngày mình ra ngoài chơi.
explanation_wrong.en: The answer is the bright, sunny sky.
explanation_wrong.vi: Đáp án là hình trời sáng, có nắng.
> Ôn ô Day, ô Night bài 2. Hai hình vẽ (không ảnh chụp). Câu ngược với câu q1 bài 2 (hỏi ban ngày thay vì ban đêm).

#### option w1_night
correct: false
feedback.en: This sky is dark, with the Moon.
feedback.vi: Bầu trời này tối, có trăng.
label.en: night
label.vi: ban đêm
image.brief: Dùng lại hình `explore_night` ở bài `bau-troi-ngay-va-dem/ngay-va-dem`.
image.alt.en: The same house under a dark sky
image.alt.vi: Ngôi nhà ấy dưới trời tối

#### option w1_day
correct: true
label.en: day
label.vi: ban ngày
image.brief: Dùng lại hình `explore_day` ở bài `bau-troi-ngay-va-dem/ngay-va-dem`.
image.alt.en: A house under a blue, sunny sky
image.alt.vi: Ngôi nhà dưới trời xanh đầy nắng

### w2
id: 8003faa4-cf63-4eca-b015-3fc182d1472b
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: co-the-cua-em/nam-giac-quan-cua-em
prompt.en: Which part helps you see the sky?
prompt.vi: Bộ phận nào giúp em nhìn bầu trời?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of what you close to sleep.
hint.vi: Em nghĩ tới bộ phận em nhắm lại khi ngủ nhé.
explanation_correct.en: Yes! Eyes see colours, like a pink sky.
explanation_correct.vi: Đúng rồi! Mắt nhìn thấy màu, như bầu trời hồng.
explanation_wrong.en: The answer is the eye. Eyes see.
explanation_wrong.vi: Đáp án là con mắt. Mắt để nhìn.
> Ôn ô See của *Cơ thể của em* bài 4 ("You see with your eyes."). Câu mới, gắn với bầu trời; lời khen nối sang trời hồng lúc bình minh của bài này.

#### option w2_eye
correct: true
label.en: eye
label.vi: con mắt
image.brief: Dùng lại hình `explore_see` ở bài `co-the-cua-em/nam-giac-quan-cua-em`.
image.alt.en: An eye
image.alt.vi: Một con mắt

#### option w2_ear
correct: false
feedback.en: Ears help you hear sounds.
feedback.vi: Tai giúp em nghe âm thanh.
label.en: ear
label.vi: cái tai
image.brief: Dùng lại hình `explore_hear` ở bài `co-the-cua-em/nam-giac-quan-cua-em`.
image.alt.en: An ear
image.alt.vi: Một cái tai

## Học

> Bốn ô: ba ảnh chụp, ô Noon là hình vẽ giấy cắt (lượt 4, designer 20/11: không có ảnh trưa nắng hợp lệ). Ba ô đầu theo thứ tự trong ngày (mọc, trưa, lặn); ô bốn là điều bé thấy sau khi Mặt Trời lặn (đèn bật, trời tối dần).
> **Ảnh bình minh (`explore_sunrise`) và ảnh hoàng hôn (`explore_sunset`) trông gần giống nhau**: ở Học hai ảnh đứng hai ô riêng có câu nói rõ; không bao giờ đặt hai ảnh này trong cùng một câu hay cùng một kệ (`_topic.md` Quy ước hình số bảy).
> Chữ cần dạy trước khi hỏi: "roosters crow" (q2, kệ) ở ô Sunrise; "the sunshine feels very hot" (q2) ở ô Noon; "the sky turns orange", "birds fly home" (q3, q5) ở ô Sunset; "lights come on" (q5) ở ô Lights on.

### explore
id: b306563e-b54b-4bb1-b0da-0a964c189788
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_sunrise
label.en: Sunrise
label.vi: Mặt Trời mọc
color: vang_hoe
sentence.en: In the morning, the Sun rises slowly.
sentence.vi: Buổi sáng, Mặt Trời từ từ mọc lên.
image.brief: [ảnh] Bình minh trên cánh đồng lúa hay cánh đồng cỏ có sương mù mỏng là là mặt ruộng: Mặt Trời vừa nhô lên sát rặng cây hay chân trời, một phần còn khuất sau sương, trời hồng nhạt và vàng; dấu hiệu buổi sáng rõ (sương sớm, giọt sương, ruộng còn ướt); không người, không chữ; ảnh không chói, không chụp qua kính lọc. Ưu tiên cảnh Việt Nam. Ảnh ngang có khoảng trống (khung vuông ở Học và kệ Chơi, khung 4:3 câu q1 và q6, thẻ từ 2:1). Từ khoá tìm ảnh (EN): misty sunrise rice field; sunrise fog farmland; dawn mist countryside
image.alt.en: A pink sky over misty fields
image.alt.vi: Trời hồng trên cánh đồng sương
examples.1.en: roosters crow
examples.1.vi: gà trống gáy
examples.2.en: the sky turns pink and gold
examples.2.vi: bầu trời ửng hồng và vàng
examples.3.en: we wake up for school
examples.3.vi: mình thức dậy đi học
> Hình gốc của chủ đề (kệ Chơi, câu q1, q6, từ `sunrise`). Không đặt cạnh `explore_sunset`.

#### group explore_noon
label.en: Noon
label.vi: Buổi trưa
color: do_son
sentence.en: At noon, the Sun is high up.
sentence.vi: Buổi trưa, Mặt Trời lên cao.
image.brief: [hình vẽ] Giấy cắt style E (designer vẽ 20/11, lượt 3, vì không có ảnh trưa nắng hợp lệ): đường làng giữa trưa nắng gắt, trời xanh trong, đường đất, ruộng, hàng cây sáng rực; Mặt Trời ở ngoài khung hoặc là vùng sáng ở mép trên; không bóng đổ; không người, không chữ. Khung vuông ở Học.
image.alt.en: A sunny path between fields
image.alt.vi: Lối đất giữa ruộng nắng gắt
examples.1.en: the sunshine feels very hot
examples.1.vi: nắng rất gắt
examples.2.en: we eat lunch and rest
examples.2.vi: mình ăn trưa rồi nghỉ ngơi
examples.3.en: the sky is bright blue
examples.3.vi: trời xanh chói
> `alt` không có chữ "Sun", "high", "sky" vì câu q2 hỏi "When is the Sun highest in the sky?" và đáp án là ảnh này.
> Câu chính không nói "cao nhất trên đầu": giờ trưa theo Mặt Trời và độ cao thay đổi theo mùa, bài không nói giờ. Không nói bóng ngắn (Discoverer #12).

#### group explore_sunset
label.en: Sunset
label.vi: Mặt Trời lặn
color: cham
sentence.en: In the evening, the Sun sets.
sentence.vi: Chiều tối, Mặt Trời lặn.
image.brief: [ảnh] Hoàng hôn trên một dòng sông hay đầm nước lặng: Mặt Trời đỏ cam sát rặng tre hay chân trời, trời cam, đỏ, tím; một con đò nhỏ hoặc đàn chim bay in đen trên trời; không người rõ mặt, không chữ; ảnh không chói. Ưu tiên cảnh Việt Nam. Ảnh ngang có khoảng trống (khung vuông ở Học, khung 4:3 câu q3, thẻ từ 2:1). Từ khoá tìm ảnh (EN): sunset river boat; orange sunset river birds; sunset lake silhouette
image.alt.en: An orange sky over a quiet river
image.alt.vi: Trời cam trên dòng sông lặng
examples.1.en: the sky turns orange and red
examples.1.vi: bầu trời chuyển cam, đỏ
examples.2.en: birds fly home
examples.2.vi: chim bay về tổ
examples.3.en: then the sky gets dark
examples.3.vi: rồi trời tối dần
> Hình gốc của chủ đề (câu q3, từ `sunset`; bài 4 w1). Không đặt cạnh `explore_sunrise`.
> [CẦN KIỂM] Trời có thể ửng cam, đỏ lúc hoàng hôn (không phải ngày nào cũng vậy; câu q3 nói "can").

#### group explore_lights
label.en: Lights on
label.vi: Lên đèn
color: gi_dong
sentence.en: After sunset, the streetlights come on.
sentence.vi: Mặt Trời lặn rồi, đèn đường bật sáng.
image.brief: [ảnh] Một con phố nhỏ hay đường làng lúc chạng vạng, trời còn xanh tím, đèn đường vừa bật ánh vàng, vài cửa sổ nhà sáng đèn; không biển hiệu có chữ, không biển số xe, không người rõ mặt. Ảnh ngang có khoảng trống (khung vuông ở Học và kệ Chơi, thẻ ba lựa chọn 5:2 câu q2, q5; bài 5 kệ và câu q4; bài 6 w3). Từ khoá tìm ảnh (EN): streetlights dusk street; street lamps twilight village; dusk street lights blue hour
image.alt.en: Yellow lamps under a purple sky
image.alt.vi: Đèn vàng dưới trời tím
examples.1.en: families eat dinner together
examples.1.vi: cả nhà ăn cơm tối
examples.2.en: the first stars come out
examples.2.vi: những ngôi sao đầu tiên hiện ra
examples.3.en: it is time to go home
examples.3.vi: đến giờ về nhà
> Hình gốc của chủ đề (bảng Hình dùng chung ở `_topic.md`); chỗ dùng lại ở bài 5, 6 trỏ `explore_lights` ở bài `bau-troi-ngay-va-dem/mat-troi-moc-mat-troi-lan`. `alt` không có chữ "evening", "sunset", "next" vì câu q5 có đáp án là ảnh này.

### new_words
id: 0708bb8b-3ba8-4b40-bdfa-85d46f3ef0b7
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: sunrise, sunset

## Chơi

> Bé chọn một cảnh buổi sáng và một cảnh chiều tối. Món bẫy là hai cảnh buổi trưa (cũng là một buổi trong ngày). Đạt khi đủ hai nhóm và không chọn món bẫy.
> Kệ sáu món (lượt 2 thêm `tray_noon_rest`), **toàn hình vẽ giấy cắt** từ lượt 4 (designer 20/11), có dấu hiệu đời sống để nhận ra buổi (gà gáy, sương sớm; đèn đường, cửa sổ sáng đèn). **Không có ảnh hoàng hôn trên kệ** (dễ lẫn với bình minh).

### tray
id: 479f4dc1-76e3-4e51-a103-bbca740468fc
type: build_tray
version: 1
prompt.en: Find morning and evening
prompt.vi: Tìm buổi sáng và chiều tối
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick a morning and an evening.
messages.start.vi: Em chọn một cảnh buổi sáng và một cảnh chiều tối nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! You found morning and evening.
messages.balanced.vi: Tuyệt! Em tìm được buổi sáng và chiều tối.
messages.has_limited.en: That is midday, when the Sun is high.
messages.has_limited.vi: Đó là buổi trưa, lúc Mặt Trời lên cao.
messages.missing.tray_morning.en: You still need a morning.
messages.missing.tray_morning.vi: Em còn thiếu một cảnh buổi sáng.
messages.missing.tray_evening.en: You still need an evening.
messages.missing.tray_evening.vi: Em còn thiếu một cảnh chiều tối.

#### group tray_morning
label.en: Morning
label.vi: Buổi sáng
color: vang_hoe
role: required

#### group tray_evening
label.en: Evening
label.vi: Chiều tối
color: cham
role: required

#### group tray_midday
label.en: Midday
label.vi: Buổi trưa
color: do_son
role: limit

#### item tray_rooster
label.en: Rooster crowing
label.vi: Gà trống gáy
group: tray_morning
image.brief: [hình vẽ] Giấy cắt style E, cùng nét với năm món kia của kệ (lượt 3: cả kệ bài 3 là hình vẽ): một con gà trống đứng trên hàng rào tre, ngửa cổ gáy, nền sáng sớm hồng nhạt; không chữ. Khung vuông.
image.alt.en: A rooster crowing
image.alt.vi: Con gà trống đang gáy

#### item tray_sunrise
label.en: Misty sunrise
label.vi: Bình minh có sương
group: tray_morning
image.brief: [hình vẽ] Giấy cắt style E, cùng nét với kệ: Mặt Trời vừa nhô sau rặng tre, trời hồng nhạt, sương trắng mỏng trên ruộng; không chữ. Khung vuông.
image.alt.en: A pink sky over misty fields
image.alt.vi: Trời hồng trên cánh đồng sương
> Nếu designer không có ảnh bình minh với dấu hiệu buổi sáng rõ, thay món này bằng ảnh đời sống buổi sáng khác (`_topic.md` Còn mở số ba).

#### item tray_streetlights
label.en: Streetlights on
label.vi: Đèn đường bật
group: tray_evening
image.brief: [hình vẽ] Giấy cắt style E, cùng nét với kệ: một con đường có hàng đèn đường vừa bật ánh vàng, trời xanh tím chạng vạng; không chữ, không biển hiệu. Khung vuông.
image.alt.en: Yellow lamps under a purple sky
image.alt.vi: Đèn vàng dưới trời tím

#### item tray_windows
label.en: Lit windows
label.vi: Cửa sổ sáng đèn
group: tray_evening
image.brief: [hình vẽ] Giấy cắt style E, cùng nét với kệ: mấy ngôi nhà lúc chạng vạng, trời xanh thẫm, các cửa sổ sáng đèn vàng ấm; không đèn đường (khác món đèn đường), không người, không chữ. Khung vuông.
image.alt.en: Warm lights in house windows
image.alt.vi: Ánh đèn ấm trong cửa sổ

#### item tray_noon
label.en: Midday sun
label.vi: Nắng trưa
group: tray_midday
image.brief: [hình vẽ] Giấy cắt style E, cùng nét với kệ: đường làng giữa trưa nắng gắt, trời xanh trong; không bóng đổ, không người, không chữ. Khung vuông.
image.alt.en: A sunny path between fields
image.alt.vi: Lối đất giữa ruộng nắng gắt

#### item tray_noon_rest
label.en: Resting at noon
label.vi: Nghỉ trưa
group: tray_midday
image.brief: [hình vẽ] Giấy cắt style E, cùng nét với kệ: giữa trưa nắng gắt, một bác nông dân đội nón lá ngồi nghỉ dưới gốc cây bên bờ ruộng, vẽ nghiêng hay từ sau, không nét mặt; trời xanh trong, ruộng sáng rực; không chữ. Khung vuông.
image.alt.en: A farmer resting under a tree
image.alt.vi: Bác nông dân nghỉ dưới gốc cây
> Lượt 2 (tester n7): món bẫy thứ hai cho nhóm Buổi trưa, kệ đủ sáu món (hai cột).
> Lượt 3 (designer 20/11): không có ảnh người nghỉ trưa hợp giấy phép; ảnh đang dùng là đường làng Gò Công Tây nắng gắt, xe ngựa ở xa. Nhãn từng đổi sang "Lane at noon" · "Đường làng buổi trưa".
> Lượt 4 (designer lượt 3, 20/11): cả kệ thành hình vẽ, món này vẽ bác nông dân nghỉ trưa dưới gốc cây; nhãn trở lại "Resting at noon" · "Nghỉ trưa", `alt` theo đề xuất designer.

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `true_false` (q1 Đúng, q3 Đúng, q6 Sai), `single_choice` (q2, q5; ba lựa chọn), `order_sequence` (q4).
> Loại hình: q1, q3, q6 một ảnh; q2, q5 ba **hình vẽ** (lượt 4: gà trống, đường làng trưa, đèn đường; cùng nội dung với hình kệ, đều đã gặp); q4 ba **hình vẽ** giấy cắt mới, cùng khung. Không câu nào trộn ảnh với hình vẽ.

### q1
id: bec88acb-9187-44c2-8ece-4a7c71edd003
format: true_false
version: 1
dok: 1
prompt.en: In the morning, the Sun rises.
prompt.vi: Buổi sáng, Mặt Trời mọc.
image.brief: Dùng lại hình `explore_sunrise`. Từ khoá tìm ảnh (EN): misty sunrise rice field
image.alt.en: A pink sky over misty fields
image.alt.vi: Trời hồng trên cánh đồng sương
answer: true
hint.en: Think of the sky when you wake up.
hint.vi: Em nghĩ tới bầu trời lúc em thức dậy nhé.
explanation_correct.en: Yes! The sky turns pink and gold.
explanation_correct.vi: Đúng rồi! Bầu trời ửng hồng và vàng.
explanation_wrong.en: This is true. Mornings start with sunrise.
explanation_wrong.vi: Câu này đúng. Buổi sáng bắt đầu khi Mặt Trời mọc.
feedback_false.en: This Sun is just coming up.
feedback_false.vi: Mặt Trời này vừa mới mọc.
> DOK 1: nhớ lại ý chính một. Hình là đúng vật được nói tới.

### q2
id: b450e3e3-3710-428f-afb8-2b8f32150ac7
format: single_choice
version: 1
dok: 1
prompt.en: When is the Sun highest in the sky?
prompt.vi: Lúc nào Mặt Trời lên cao nhất?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of when the sunshine is strongest.
hint.vi: Em nghĩ tới lúc nắng gắt nhất trong ngày nhé.
explanation_correct.en: Yes! At noon, the sunshine is strong.
explanation_correct.vi: Đúng rồi! Buổi trưa, nắng rất gắt.
explanation_wrong.en: The answer is midday. The Sun is high.
explanation_wrong.vi: Đáp án là buổi trưa. Mặt Trời lên cao.
> DOK 1: nhớ lại ô Noon. Ba hình vẽ khác hẳn nhau: gà trống, đường làng chói nắng, phố lên đèn. Không có ảnh bình minh hay hoàng hôn trong câu.

#### option q2_rooster
correct: false
feedback.en: Roosters crow when the Sun comes up.
feedback.vi: Gà trống gáy lúc Mặt Trời mọc.
label.en: early morning
label.vi: sáng sớm
image.brief: [hình vẽ] Giấy cắt style E, bản khung 5:2 riêng cho câu này (lượt 3), cùng nét với hai lựa chọn kia: gà trống trên hàng rào tre ngửa cổ gáy, nền sáng sớm hồng nhạt; không chữ.
image.alt.en: A rooster crowing
image.alt.vi: Con gà trống đang gáy

#### option q2_noon
correct: true
label.en: midday
label.vi: buổi trưa
image.brief: [hình vẽ] Giấy cắt style E, bản khung 5:2 riêng cho câu này, cùng nét với hai lựa chọn kia: đường làng giữa trưa nắng gắt, trời xanh trong; không bóng đổ, không người, không chữ.
image.alt.en: A sunny path between fields
image.alt.vi: Lối đất giữa ruộng nắng gắt

#### option q2_lights
correct: false
feedback.en: Streetlights come on after sunset.
feedback.vi: Đèn đường bật sau khi Mặt Trời lặn.
label.en: evening
label.vi: chiều tối
image.brief: [hình vẽ] Giấy cắt style E, bản khung 5:2 riêng cho câu này, cùng nét với hai lựa chọn kia: con đường có hàng đèn đường vừa bật, trời xanh tím chạng vạng; không chữ.
image.alt.en: Yellow lamps under a purple sky
image.alt.vi: Đèn vàng dưới trời tím

### q3
id: ac7f41af-3f4c-46d5-9f96-6e4349f45c86
format: true_false
version: 1
dok: 1
prompt.en: The sky can turn orange at sunset.
prompt.vi: Lúc Mặt Trời lặn, bầu trời có thể ửng cam.
image.brief: Dùng lại hình `explore_sunset`. Từ khoá tìm ảnh (EN): sunset river boat
image.alt.en: An orange sky over a quiet river
image.alt.vi: Trời cam trên dòng sông lặng
answer: true
hint.en: Look at the colour of this sky.
hint.vi: Em nhìn màu của bầu trời này nhé.
explanation_correct.en: Yes! Then the sky slowly gets dark.
explanation_correct.vi: Đúng rồi! Rồi trời tối dần.
explanation_wrong.en: This is true. Sunset skies can glow orange.
explanation_wrong.vi: Câu này đúng. Lúc hoàng hôn, trời có thể ửng cam.
feedback_false.en: This sky glows orange and red.
feedback_false.vi: Bầu trời này ửng cam và đỏ.
> DOK 1: nhớ lại ô Sunset (ví dụ một). Hình là đúng vật được nói tới.

### q4
id: 17e4a3c0-ea25-49e0-87d5-0c58945a5bf0
format: order_sequence
version: 1
dok: 2
prompt.en: Start with the morning. Put them in order.
prompt.vi: Bắt đầu từ buổi sáng. Em xếp theo thứ tự nhé.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_morning, q4_noon, q4_evening
hint.en: Evening comes at the end.
hint.vi: Chiều tối đến sau cùng.
explanation_correct.en: Yes! Then night comes, and we sleep.
explanation_correct.vi: Đúng rồi! Sau đó là đêm, mình đi ngủ.
explanation_wrong.en: The order is morning, noon, then evening.
explanation_wrong.vi: Thứ tự là buổi sáng, buổi trưa, rồi chiều tối.
> DOK 2: xếp ba cảnh của một ngày (SK-061 khuyến nghị 7). `prompt` nêu đầu buổi sáng; gợi ý chỉ nhắc đầu kia. Thẻ trong file không theo thứ tự đúng.
> Ba **hình vẽ** giấy cắt mới, cùng ngôi nhà, cánh đồng như `explore_day` bài 2, cùng khung vuông; mỗi hình có một dấu hiệu đời sống ngoài vị trí Mặt Trời (gà gáy; nón lá phơi hiên lúc trưa; cửa sổ sáng đèn, chim bay về) để bé xếp được bằng nhiều cách nhìn. Không bóng đổ trong cả ba hình (Discoverer #12).

#### item q4_evening
label.en: evening
label.vi: chiều tối
image.brief: [hình vẽ] Giấy cắt style E, cùng ngôi nhà mái ngói, cây cau, rặng tre, cánh đồng như `explore_day` bài 2: Mặt Trời tròn đỏ cam đã khuất một nửa sau rặng tre ở mép phải, trời cam ở thấp chuyển tím ở cao, cửa sổ sáng đèn vàng, một đàn chim nhỏ bay về phía rặng tre. Không người, không chữ, không bóng đổ. Khung vuông. Cùng nét, cùng bảng màu với `q4_morning`, `q4_noon`.
image.alt.en: Orange sky and lit windows
image.alt.vi: Trời cam và cửa sổ sáng đèn

#### item q4_morning
label.en: morning
label.vi: buổi sáng
image.brief: [hình vẽ] Giấy cắt style E, cùng ngôi nhà, cảnh như `q4_evening`: Mặt Trời tròn vàng nhạt vừa nhô một nửa lên sau rặng tre ở mép trái, trời hồng nhạt chuyển xanh nhạt, sương mỏng trắng trên ruộng, một con gà trống đứng trên hàng rào ngửa cổ gáy; cửa sổ không sáng đèn. Không người, không chữ, không bóng đổ. Khung vuông.
image.alt.en: Pink sky and a crowing rooster
image.alt.vi: Trời hồng và gà trống đang gáy

#### item q4_noon
label.en: noon
label.vi: buổi trưa
image.brief: [hình vẽ] Giấy cắt style E, cùng ngôi nhà, cảnh như `q4_evening`: Mặt Trời tròn vàng đậm ở chính giữa phía trên khung, trời xanh đậm, cánh đồng và sân sáng rực, một chiếc nón lá treo ở hiên; không gà, không chim, cửa sổ không sáng đèn. Không người, không chữ, không bóng đổ. Khung vuông.
image.alt.en: Blue sky and a hat on the porch
image.alt.vi: Trời xanh và nón lá treo hiên

### q5
id: 9aacd7a6-6ac6-404b-be1d-301e382a3d4d
format: single_choice
version: 1
dok: 2
prompt.en: Birds fly home. What comes next?
prompt.vi: Chim bay về tổ. Tiếp theo là gì?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of what happens as it gets dark.
hint.vi: Em nghĩ xem trời tối dần thì có gì nhé.
explanation_correct.en: Yes! The lights come on as night falls.
explanation_correct.vi: Đúng rồi! Trời tối dần, đèn bật sáng.
explanation_wrong.en: The answer is the lights. Night is coming.
explanation_wrong.vi: Đáp án là phố lên đèn. Đêm sắp đến.
> DOK 2: suy ra việc kế tiếp theo thứ tự trong ngày (chim về tổ ở ô Sunset → lên đèn ở ô Lights on). Cùng ba hình vẽ với câu q2, đáp án khác; ba hình đều đã gặp.

#### option q5_rooster
correct: false
feedback.en: Roosters crow early in the morning.
feedback.vi: Gà trống gáy lúc sáng sớm.
label.en: rooster crowing
label.vi: gà trống gáy
image.brief: [hình vẽ] Giấy cắt style E, cùng hình với lựa chọn gà trống của câu q2 (bản 5:2): gà trống trên hàng rào tre ngửa cổ gáy, nền sáng sớm hồng nhạt; không chữ.
image.alt.en: A rooster crowing
image.alt.vi: Con gà trống đang gáy

#### option q5_noon
correct: false
feedback.en: Midday comes before the birds fly home.
feedback.vi: Buổi trưa đến trước lúc chim về tổ.
label.en: midday sun
label.vi: nắng trưa
image.brief: [hình vẽ] Giấy cắt style E, cùng hình với lựa chọn buổi trưa của câu q2 (bản 5:2): đường làng giữa trưa nắng gắt, trời xanh trong; không bóng đổ, không người, không chữ.
image.alt.en: A sunny path between fields
image.alt.vi: Lối đất giữa ruộng nắng gắt

#### option q5_lights
correct: true
label.en: lights coming on
label.vi: phố lên đèn
image.brief: [hình vẽ] Giấy cắt style E, cùng hình với lựa chọn chiều tối của câu q2 (bản 5:2): con đường có hàng đèn đường vừa bật, trời xanh tím chạng vạng; không chữ.
image.alt.en: Yellow lamps under a purple sky
image.alt.vi: Đèn vàng dưới trời tím

### q6
id: 4b012468-6b0a-4c80-ad55-8f81404c0904
format: true_false
version: 1
dok: 2
misconception: sun_stays_still
prompt.en: The Sun stays in one place all day.
prompt.vi: Mặt Trời đứng yên một chỗ suốt cả ngày.
image.brief: Dùng lại hình `explore_sunrise`. Từ khoá tìm ảnh (EN): misty sunrise rice field
image.alt.en: A pink sky over misty fields
image.alt.vi: Trời hồng trên cánh đồng sương
answer: false
hint.en: Think of the Sun at noon.
hint.vi: Em nhớ lại Mặt Trời lúc buổi trưa nhé.
explanation_correct.en: The Sun rises, climbs high, then sets.
explanation_correct.vi: Mặt Trời mọc, lên cao, rồi lặn.
explanation_wrong.en: This is false. The Sun sets each evening.
explanation_wrong.vi: Câu này sai. Chiều nào Mặt Trời cũng lặn.
feedback_true.en: This Sun is low, close to the fields.
feedback_true.vi: Mặt Trời này còn thấp, sát cánh đồng.
> Câu misconception (`sun_stays_still`), bằng hình, DOK 2: bé chưa để ý Mặt Trời ở chỗ khác nhau trong ngày sẽ chạm gật đầu. Câu chỉ kiểm một việc. Hình bình minh (Mặt Trời thấp) là đúng vật được nói tới; `feedback_true` chỉ vào điều thấy trong hình. `explanation_correct` là đúng câu `correction` ở `_topic.md`.
> Lời "rises, climbs high, sets" · "mọc, lên cao, lặn" là cách nói thường ngày (SK-061 khuyến nghị 2), không nói Mặt Trời hay Trái Đất chuyển động.
> [CẦN KIỂM] Quan niệm `sun_stays_still` (mục Misconceptions ở `_topic.md`).

## Từ vựng

### sunrise
id: 9531b412-c0d5-47b7-9e23-04e37b755602
tier: core
term.en: sunrise
term.vi: Mặt Trời mọc
example.en: Roosters crow at sunrise.
example.vi: Gà trống gáy lúc Mặt Trời mọc.
image.brief: Dùng lại hình `explore_sunrise`. Từ khoá tìm ảnh (EN): misty sunrise rice field
image.alt.en: A pink sky over misty fields
image.alt.vi: Trời hồng trên cánh đồng sương

### sunset
id: 99c63aea-ac68-4af7-8840-f0b13b3282f1
tier: core
term.en: sunset
term.vi: Mặt Trời lặn
example.en: We walk home at sunset.
example.vi: Mình đi bộ về nhà lúc Mặt Trời lặn.
image.brief: Dùng lại hình `explore_sunset`. Từ khoá tìm ảnh (EN): sunset river boat
image.alt.en: An orange sky over a quiet river
image.alt.vi: Trời cam trên dòng sông lặng

### morning
id: d74f65d2-e40e-4cf1-bde4-3ae769c51e22
tier: extra
term.en: morning
term.vi: buổi sáng
example.en: I eat breakfast in the morning.
example.vi: Em ăn sáng vào buổi sáng.
image.brief: Dùng lại hình `tray_rooster` ở bài `co-the-cua-em/nam-giac-quan-cua-em`. Từ khoá tìm ảnh (EN): rooster crowing farm yard
image.alt.en: A rooster crowing
image.alt.vi: Con gà trống đang gáy

### evening
id: a8c8a89e-a791-4200-a84a-f2f4b8e7e723
tier: extra
term.en: evening
term.vi: chiều tối
example.en: The streetlights glow in the evening.
example.vi: Chiều tối, đèn đường toả sáng.
image.brief: Dùng lại hình `explore_lights`. Từ khoá tìm ảnh (EN): streetlights dusk street
image.alt.en: Yellow lamps under a purple sky
image.alt.vi: Đèn vàng dưới trời tím

## Thưởng

### sunrise_card
id: 4295feef-6d69-4aaa-8eae-4202392c4020
set: sky
rarity: common
name.en: Sunrise
name.vi: Bình minh
tag.en: A new day begins
tag.vi: Một ngày mới bắt đầu
fact.en: Roosters often crow before sunrise.
fact.vi: Gà trống thường gáy trước khi Mặt Trời mọc.
image.brief: [hình vẽ] Giấy cắt style E: Mặt Trời vừa nhô nửa sau rặng tre, trời xanh nhạt có dải hồng, sương trắng trên ruộng lúa, gà trống đang gáy, bác nông dân đội nón lá vác cuốc ra đồng, nhìn từ phía sau. Khung vuông.
image.alt.en: A farmer walking to the fields at sunrise
image.alt.vi: Bác nông dân ra đồng lúc bình minh
> Hình vẽ (designer 20/11, sau chạy thử): ảnh vịnh cũ trông như hoàng hôn. Thẻ không đứng cạnh ảnh hoàng hôn trong câu nào.
> [CẦN KIỂM] Gà trống thường gáy trước khi Mặt Trời mọc (gáy cả lúc khác trong ngày).

## Ghi chú cho hoạ sĩ

- **Loại hình:** ba hình vẽ giấy cắt `q4_morning`, `q4_noon`, `q4_evening` (mục `own`, `method: "drawn"`, credit "Science Kids"), cùng ngôi nhà và cảnh với `explore_day`, `explore_night` bài 2, cùng nét, cùng bảng màu. Từ lượt 4 (designer 20/11) thêm hình vẽ: ô Học `explore_noon`, cả sáu món kệ, ba lựa chọn câu q2 (bản 5:2) và ba lựa chọn câu q5 (cùng hình q2). Thẻ thưởng `sunrise_card` cũng là hình vẽ (20/11). Còn ảnh chụp: `explore_sunrise`, `explore_sunset`, `explore_lights`, thẻ từ `morning`.
- **Bình minh và hoàng hôn:** hai ảnh `explore_sunrise` (ruộng có sương) và `explore_sunset` (sông có đò, chim) phải có dấu hiệu riêng ngoài màu trời; không bao giờ cùng một câu, một kệ. Kệ Chơi chỉ có bình minh.
- **Mặt Trời:** không chói giữa khung; ảnh trưa để Mặt Trời ngoài khung. Không bóng đổ dài trong ảnh trưa; không bóng đổ trong hình vẽ.
- **Một câu, một kệ, một loại hình:** kệ sáu hình vẽ; câu q2, q5 ba hình vẽ; câu q4 ba hình vẽ; câu w1 hai hình vẽ giấy cắt; câu w2 hai hình dùng lại từ *Cơ thể của em* (gốc là hình vẽ gần thực tế của Discoverer, nền kem trơn, khác nét giấy cắt; tester n6), không trộn với ảnh chụp.
- **Ảnh chụp mới (ba):** `explore_sunrise`, `explore_sunset`, `explore_lights`; `sunrise_card` là hình vẽ. `explore_noon`, `tray_windows`, `tray_noon_rest` và các món kệ từ lượt 4 là hình vẽ. Giữ đúng key và `alt` các hình gốc.
- **Dùng lại:** `co-the-cua-em/nam-giac-quan-cua-em` `tray_rooster`, `explore_see`, `explore_hear`; bài 2 `explore_day`, `explore_night`; hàng rào tre.
- **Màu:** Học: Sunrise `vang_hoe`, Noon `do_son`, Sunset `cham`, Lights on `gi_dong`. Chơi: Buổi sáng `vang_hoe`, Chiều tối `cham`, Buổi trưa `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (sunrise, sunset). Chơi `build_tray` ba chỗ, hai nhóm `required`, một nhóm `limit` (hai món), sáu món. Khởi động `single_choice` hai lựa chọn (w1, w2). Quiz `true_false` (q1 Đúng, q3 Đúng, q6 Sai), `single_choice` (q2, q5; ba lựa chọn), `order_sequence` (q4, ba thẻ). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`sun_stays_still`).
- **Màn Chơi, ví dụ để kiểm:** Gà trống gáy, Đèn đường bật → `balanced`; Bình minh có sương, Cửa sổ sáng đèn → `balanced`; Gà trống gáy, Bình minh có sương → `missing.tray_evening`; Gà trống gáy, Nắng trưa, Đèn đường bật → `has_limited`; Đường làng buổi trưa, Bình minh có sương, Cửa sổ sáng đèn → `has_limited`.
- **Khởi động trỏ:** w1 → bài 2 của chủ đề này; w2 → `co-the-cua-em/nam-giac-quan-cua-em` (đã có id).
- **Hình vẽ:** ba mục `own` trong `content/images/explorer/bau-troi-ngay-va-dem/mat-troi-moc-mat-troi-lan.json`.
- **Từ EN có thể ngoài Starters/Movers:** sunrise, sunset, noon, midday, misty, blazing, streetlights, crow, glow. Nghe thử giọng VI đọc "chang chang", "ửng cam", "chạng vạng".
