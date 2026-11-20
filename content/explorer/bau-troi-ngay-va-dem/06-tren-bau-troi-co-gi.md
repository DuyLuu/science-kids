---
id: 96cd1280-5bf9-4a29-903e-bb5652bcdead
topic: bau-troi-ngay-va-dem
slug: tren-bau-troi-co-gi
order: 6
stage: review
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: What is in the sky?
vi: Trên bầu trời có gì?
> Tên mới của bài 6 theo SK-061 (quyết định 5: thay *Trái Đất là một quả cầu lớn*). Lúc soạn, `content/syllabus.json` còn tên cũ; dev đổi danh mục ở Phần A1. `id` để trống.

## Mục tiêu
en: I can name things in the sky.
vi: Em gọi tên được những thứ trên bầu trời.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 19/11/2026. Ticket SK-061. Mọi dòng `id:` để trống.
> Bài ôn cả chủ đề (`review`): ban ngày có Mặt Trời, mây; ban đêm có trăng, sao; chim, máy bay, diều bay gần; Mặt Trời, Mặt Trăng, sao ở rất xa; ngắm trời an toàn (không nhìn thẳng vào Mặt Trời, ngắm sao cùng người lớn). Không Trái Đất là quả cầu, không quả địa cầu, không ảnh Trái Đất từ vũ trụ (Discoverer #7 bài 1).

## Ý chính
1.en: By day, we see the Sun and clouds.
1.vi: Ban ngày, mình thấy Mặt Trời và mây.
2.en: At night, we see the Moon and stars.
2.vi: Ban đêm, mình thấy trăng và sao.
3.en: Kites fly near. The Moon is far.
3.vi: Diều bay gần. Mặt Trăng ở rất xa.
> Từ cụ thể tới trừu tượng: hai bầu trời bé đã học (bài 1, 2, 4, 5), rồi ý mới của bài ôn: gần và xa (sửa `moon_follows_me`).
> Ghép với ô Học (`KeyPointPictures.match`): ý 1 → Day sky (day, see, sun, cloud), ý 2 → Night sky (night, see, moon, star), ý 3 → Near us (kit, fly, near). Ô Far away không ghép.

## Khởi động

> Ba câu, ôn trộn bài 5, 2, 3 (SK-061: bài 6 ôn trộn bài 1–5): w1 bài 5 (mốc "hôm trước"), w2 bài 2 (cách bốn bài, mốc "khoảng một tuần"), w3 bài 3 (cách ba bài). Bài 1 và bài 4 được ôn ở ô Học (an toàn mắt, trăng), câu q1, q4, q6 và kệ Chơi.

### w1
id: 06639b29-8def-4941-a395-e0567b63f352
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: bau-troi-ngay-va-dem/cac-vi-sao
prompt.en: City lights hide many stars.
prompt.vi: Đèn thành phố che khuất nhiều ngôi sao.
image.brief: Dùng lại hình `explore_city` ở bài `bau-troi-ngay-va-dem/cac-vi-sao`. Từ khoá tìm ảnh (EN): city night skyline glow sky
image.alt.en: A glowing city under an empty sky
image.alt.vi: Thành phố sáng đèn dưới bầu trời trống
answer: true
hint.en: Look at the sky above the city.
hint.vi: Em nhìn bầu trời phía trên thành phố nhé.
explanation_correct.en: Yes! Far from lights, we see more stars.
explanation_correct.vi: Đúng rồi! Xa ánh đèn, mình thấy nhiều sao hơn.
explanation_wrong.en: This is true. Bright lights hide the stars.
explanation_wrong.vi: Câu này đúng. Đèn sáng che khuất các vì sao.
feedback_false.en: This city sky shows almost no stars.
feedback_false.vi: Trời trên thành phố này gần như không thấy sao.
> Ôn ô City lights bài 5.

### w2
id: deafd903-9aea-4b7d-b49b-4a0993c0e203
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: bau-troi-ngay-va-dem/ngay-va-dem
prompt.en: Owls sleep all night long.
prompt.vi: Cú ngủ suốt cả đêm.
image.brief: Dùng lại hình `explore_owl` ở bài `bau-troi-ngay-va-dem/ngay-va-dem`. Từ khoá tìm ảnh (EN): great horned owl perched
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành
answer: false
hint.en: Think of the owl's big, round eyes.
hint.vi: Em nghĩ tới đôi mắt to tròn của cú nhé.
explanation_correct.en: Owls hunt at night and rest by day.
explanation_correct.vi: Cú đi săn ban đêm, ban ngày nghỉ.
explanation_wrong.en: This is false. Owls are awake at night.
explanation_wrong.vi: Câu này sai. Ban đêm cú thức.
feedback_true.en: This owl is wide awake.
feedback_true.vi: Con cú này đang mở to mắt.
> Ôn ô Night animals và `everyone_sleeps_at_night` bài 2 bằng câu mới (mốc khoảng một tuần). Câu khẳng định, đáp án Sai; `explanation_correct` đứng một mình.

### w3
id: d21918b0-3813-46a1-975c-21a8a2cb62f2
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: bau-troi-ngay-va-dem/mat-troi-moc-mat-troi-lan
prompt.en: What happens early in the morning?
prompt.vi: Sáng sớm có gì?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of the sound that wakes you.
hint.vi: Em nghĩ tới tiếng gọi em thức dậy nhé.
explanation_correct.en: Yes! Roosters crow as the Sun rises.
explanation_correct.vi: Đúng rồi! Gà trống gáy lúc Mặt Trời mọc.
explanation_wrong.en: The answer is the crowing rooster.
explanation_wrong.vi: Đáp án là chú gà trống đang gáy.
> Ôn ô Sunrise bài 3. Không dùng ảnh bình minh và hoàng hôn trong cùng một câu (`_topic.md` Quy ước hình số bảy): lựa chọn là gà trống và phố lên đèn.

#### option w3_lights
correct: false
feedback.en: Streetlights come on in the evening.
feedback.vi: Đèn đường bật lúc chiều tối.
label.en: streetlights
label.vi: đèn đường
image.brief: Dùng lại hình `explore_lights` ở bài `bau-troi-ngay-va-dem/mat-troi-moc-mat-troi-lan`. Từ khoá tìm ảnh (EN): streetlights dusk street
image.alt.en: Yellow lamps under a purple sky
image.alt.vi: Đèn vàng dưới trời tím

#### option w3_rooster
correct: true
label.en: rooster crowing
label.vi: gà trống gáy
image.brief: Dùng lại hình `tray_rooster` ở bài `co-the-cua-em/nam-giac-quan-cua-em`. Từ khoá tìm ảnh (EN): rooster crowing farm yard
image.alt.en: A rooster crowing
image.alt.vi: Con gà trống đang gáy

## Học

> Bốn ô, toàn ảnh chụp. Hai ô đầu ôn hai bầu trời; hai ô sau là ý mới: gần và xa.
> Ô Day sky nhắc lại "never look right at the Sun" (SK-061 khuyến nghị 3, tiêu chí content-editor). Ô Night sky có câu "go stargazing with a grown-up" (chỉ là ví dụ, không thành câu quiz).
> Chữ cần dạy trước khi hỏi: "clouds" (q3) ở ô Day sky; "the Moon", "stars" (q1) ở ô Night sky; "kites fly near" (q2, q4) ở ô Near us; "we can never reach them", "we see the Moon from everywhere" (q5, q6) ở ô Far away.

### explore
id: 3b812a17-d767-4081-b1ba-82de21053289
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_day_sky
label.en: Day sky
label.vi: Trời ban ngày
color: vang_hoe
sentence.en: By day, we see the Sun and clouds.
sentence.vi: Ban ngày, mình thấy Mặt Trời và mây.
image.brief: Dùng lại hình `explore_cloudy` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): sun behind clouds
image.alt.en: Sunbeams through the clouds
image.alt.vi: Tia nắng xuyên qua mây
examples.1.en: never look right at the Sun
examples.1.vi: không bao giờ nhìn thẳng vào Mặt Trời
examples.2.en: white clouds float by
examples.2.vi: mây trắng trôi qua
examples.3.en: sometimes a rainbow appears
examples.3.vi: có khi có cầu vồng
> Ví dụ một là câu an toàn mắt của bài 6 (SK-061 khuyến nghị 3).

#### group explore_night_sky
label.en: Night sky
label.vi: Trời ban đêm
color: cham
sentence.en: At night, we see the Moon and stars.
sentence.vi: Ban đêm, mình thấy trăng và sao.
image.brief: Dùng lại hình `night_sky_card` ở bài `bau-troi-ngay-va-dem/ngay-va-dem`. Từ khoá tìm ảnh (EN): moon over village night
image.alt.en: A quiet town under the Moon
image.alt.vi: Thị trấn yên tĩnh dưới trăng
examples.1.en: the Moon changes shape
examples.1.vi: trăng đổi hình
examples.2.en: stars twinkle far away
examples.2.vi: sao lấp lánh ở tít xa
examples.3.en: go stargazing with a grown-up
examples.3.vi: ngắm sao cùng người lớn
examples.4.en: sometimes the Moon is out by day
examples.4.vi: có hôm, trăng hiện cả ban ngày
> Ví dụ ba là câu "cùng người lớn" của bài 6 (SK-061 khuyến nghị 3).
> Ví dụ bốn (lượt 2, tester n12): kệ Chơi xếp trăng vào nhóm "Trời ban đêm", nên nhắc lại ý bài 4 (`moon_only_at_night`) và nối sang thẻ thưởng `day_moon_card`.

#### group explore_near
label.en: Near us
label.vi: Ở gần mình
color: gi_dong
sentence.en: Birds and kites fly near us.
sentence.vi: Chim và diều bay gần mình.
image.brief: [ảnh] Một con diều giấy (ưu tiên diều sáo, diều cánh cong Việt Nam) bay trên cánh đồng hay bãi cỏ, trời xanh có mây; thấy rõ dây diều kéo xuống mép khung; có thể có vài con chim nhỏ bay xa; không người rõ mặt (nếu có người thì chỉ thấy tay cầm dây hay dáng xa), không chữ, không logo trên diều. Ảnh ngang có khoảng trống (khung vuông ở Học, khung 4:3 câu q2, thẻ `order_sequence` vuông, thẻ ba lựa chọn 5:2 câu q5, thẻ từ 2:1). Từ khoá tìm ảnh (EN): kite flying field sky; paper kite blue sky string; Vietnamese kite flying
image.alt.en: A paper kite in a blue sky
image.alt.vi: Con diều giấy trên trời xanh
examples.1.en: we hold the kite string
examples.1.vi: mình cầm dây diều
examples.2.en: birds land on the trees
examples.2.vi: chim đậu xuống cành cây
examples.3.en: a plane looks small up high
examples.3.vi: máy bay trên cao trông nhỏ
> Hình gốc của bài (câu q2, q4, q5, từ `near`, `kite`). `alt` không có chữ "near", "far" vì câu q4, q5 có thẻ là ảnh này.
> Nhãn "Near us" · "Ở gần mình" như nhóm bẫy kệ bài 4, 5 (một ý một nhãn).

#### group explore_far_away
label.en: Far away
label.vi: Rất xa
color: nau_dat
sentence.en: The Sun, Moon and stars are very far.
sentence.vi: Mặt Trời, trăng và sao đều ở rất xa.
image.brief: Dùng lại hình `explore_far` ở bài `bau-troi-ngay-va-dem/cac-vi-sao`. Từ khoá tìm ảnh (EN): parent child stargazing silhouette
image.alt.en: A grown-up and child gazing upward
image.alt.vi: Người lớn và em nhỏ ngước nhìn lên trời
examples.1.en: we can never reach them
examples.1.vi: mình không bao giờ với tới
examples.2.en: they look small from here
examples.2.vi: từ đây nhìn thấy nhỏ
examples.3.en: we see the Moon from everywhere
examples.3.vi: em đi đâu cũng thấy trăng
> Ô sửa `moon_follows_me` (ví dụ ba). Chỉ mô tả khoảng cách (SK-061 khuyến nghị 1), không nói thêm.
> [CẦN KIỂM] Ở mức thấy: vì trăng rất xa nên đi đâu cũng thấy trăng "ở đó".

### new_words
id: d8ab2c5b-4640-4df3-a371-2c1b3ea26649
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: sky, near

## Chơi

> Bé chọn thứ trên trời ban ngày (Mặt Trời, cầu vồng) và thứ trên trời ban đêm (trăng, sao). Món bẫy là đồ người làm ra trông giống trăng, sao: đèn ông sao, đèn lồng tròn. Đạt khi đủ hai nhóm và không chọn món bẫy.
> **Cả kệ là hình vẽ giấy cắt** (SK-061 khuyến nghị designer 5), sáu món cùng nét, cùng bảng màu, cùng cỡ, nền trơn (SK-059: hai cột).

### tray
id: aa4ffb7e-cce0-4886-8a2a-e9894d280d6e
type: build_tray
version: 1
prompt.en: Find things in the day and night sky
prompt.vi: Tìm những thứ trên trời ban ngày và ban đêm
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick one for day, one for night.
messages.start.vi: Em chọn một thứ trên trời ban ngày và một thứ trên trời ban đêm nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! You know the day and night sky.
messages.balanced.vi: Tuyệt! Em biết bầu trời ngày và đêm rồi.
messages.has_limited.en: People made that one.
messages.has_limited.vi: Cái này do người làm ra.
messages.missing.tray_day.en: You still need something from the day sky.
messages.missing.tray_day.vi: Em còn thiếu một thứ trên trời ban ngày.
messages.missing.tray_night.en: You still need something from the night sky.
messages.missing.tray_night.vi: Em còn thiếu một thứ trên trời ban đêm.
> Lời nhắn `has_limited` đúng với cả hai món bẫy (đèn ông sao, đèn lồng tròn), cùng chữ với *Núi, sông và biển*.

#### group tray_day
label.en: Day sky
label.vi: Trời ban ngày
color: vang_hoe
role: required

#### group tray_night
label.en: Night sky
label.vi: Trời ban đêm
color: cham
role: required

#### group tray_made
label.en: Made by people
label.vi: Do người làm ra
color: do_son
role: limit

#### item tray_sun
label.en: Sun
label.vi: Mặt Trời
group: tray_day
image.brief: [hình vẽ] Giấy cắt style E, không nét viền, màu từ design tokens: Mặt Trời là một hình tròn vàng hoè, quanh là một vành giấy vàng nhạt lượn sóng (không tia nhọn dài, không mặt người), trên nền giấy xanh da trời trơn. Không chữ. Khung vuông, cùng cỡ, cùng nền với năm món kia của kệ (nền ban ngày xanh nhạt, nền ban đêm xanh than).
image.alt.en: A yellow paper circle on blue
image.alt.vi: Hình tròn giấy vàng trên nền xanh

#### item tray_rainbow
label.en: Rainbow
label.vi: Cầu vồng
group: tray_day
image.brief: [hình vẽ] Giấy cắt style E: một cầu vồng là các dải giấy cong nhiều màu xếp chồng, hai chân có mây trắng giấy, trên nền giấy xanh da trời trơn. Không chữ. Khung vuông, cùng kiểu với `tray_sun`.
image.alt.en: Curved paper stripes of many colours
image.alt.vi: Những dải giấy cong nhiều màu

#### item tray_moon
label.en: Moon
label.vi: Trăng
group: tray_night
image.brief: [hình vẽ] Giấy cắt style E: một vầng trăng lưỡi liềm giấy vàng nhạt trên nền giấy xanh than trơn, có hai ba chấm sao nhỏ. Không mặt người, không chú Cuội, không chữ. Khung vuông, cùng kiểu với `tray_sun`.
image.alt.en: A pale paper curve on navy
image.alt.vi: Vệt giấy cong vàng nhạt trên nền xanh than

#### item tray_stars
label.en: Stars
label.vi: Các vì sao
group: tray_night
image.brief: [hình vẽ] Giấy cắt style E: nhiều ngôi sao nhỏ là chấm tròn hay sao bốn cánh nhỏ màu trắng, vàng nhạt rải trên nền giấy xanh than trơn; không sao năm cánh (để khác hẳn đèn ông sao), không nối nét chòm sao, không trăng. Không chữ. Khung vuông, cùng kiểu với `tray_sun`.
image.alt.en: Tiny paper sparkles on navy
image.alt.vi: Những đốm giấy nhỏ trên nền xanh than

#### item tray_star_lantern
label.en: Star lantern
label.vi: Đèn ông sao
group: tray_made
image.brief: Dùng lại hình `star_lantern_card` ở bài `thoi-tiet-va-cac-mua/mua-lai-ve`.
image.alt.en: A red paper star lantern
image.alt.vi: Chiếc đèn ông sao bằng giấy đỏ
> Hình vẽ giấy cắt có sẵn (phiên chính duyệt 18/11). Designer xem lại: nền của hình gốc phải hợp với kệ này (nếu gốc là nền trơn sáng thì để nguyên; không cần đổi nền theo ngày, đêm). Món bẫy giống nhóm "Night sky" (hình ngôi sao) nhưng do người làm ra.

#### item tray_round_lantern
label.en: Round lantern
label.vi: Đèn lồng tròn
group: tray_made
image.brief: [hình vẽ] Giấy cắt style E: một chiếc đèn lồng giấy tròn màu vàng nhạt có nan tre và quai treo, phía dưới có tua đỏ, trên nền giấy xanh than trơn; tròn gần giống vầng trăng nhưng thấy rõ quai, nan, tua. Không chữ. Khung vuông, cùng kiểu với `tray_sun`.
image.alt.en: A round paper lamp with a handle
image.alt.vi: Chiếc đèn giấy tròn có quai
> Món bẫy giống nhóm "Night sky" (tròn, sáng như trăng) nhưng do người làm ra.

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2 Đúng, q3 Đúng, q6 Sai), `order_sequence` (q4).
> Loại hình: toàn ảnh chụp (kệ Chơi là hình vẽ, nhưng không câu quiz nào dùng hình vẽ). q1 có ảnh của bài 4 và *Cơ thể của em* (mới với bài này) cạnh ảnh đã gặp; đáp án không là ảnh mới duy nhất.

### q1
id: 0cee8436-ef16-44a3-8c05-de5ca6053d45
format: single_choice
version: 1
dok: 1
prompt.en: Which one do we see at night?
prompt.vi: Ban đêm, mình thấy gì trên trời?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of the sky at bedtime.
hint.vi: Em nghĩ tới bầu trời lúc em đi ngủ nhé.
explanation_correct.en: Yes! The Moon shines at night.
explanation_correct.vi: Đúng rồi! Ban đêm trăng toả sáng.
explanation_wrong.en: The answer is the Moon. It shines at night.
explanation_wrong.vi: Đáp án là Mặt Trăng. Trăng sáng ban đêm.
> DOK 1: nhớ lại ô Day sky, Night sky (ôn bài 2, 4). Ba ảnh khác hẳn nhau: trăng tròn trên nền đêm, nắng sau mây, cầu vồng trên đồng. Ảnh trăng (mới với bài này) và cầu vồng (mới) đứng cạnh ảnh mây (đã gặp ở Học): đáp án không là ảnh mới duy nhất.

#### option q1_clouds
correct: false
feedback.en: The Sun hides behind clouds by day.
feedback.vi: Ban ngày, Mặt Trời nấp sau mây.
label.en: Sun behind clouds
label.vi: nắng sau mây
image.brief: Dùng lại hình `explore_cloudy` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): sun behind clouds
image.alt.en: Sunbeams through the clouds
image.alt.vi: Tia nắng xuyên qua mây

#### option q1_rainbow
correct: false
feedback.en: Rainbows come out after rain, by day.
feedback.vi: Cầu vồng hiện ra sau mưa, vào ban ngày.
label.en: rainbow
label.vi: cầu vồng
image.brief: Dùng lại hình `tray_rainbow` ở bài `co-the-cua-em/nam-giac-quan-cua-em`. Từ khoá tìm ảnh (EN): rainbow over green rice field
image.alt.en: A rainbow over green fields
image.alt.vi: Cầu vồng trên cánh đồng xanh

#### option q1_moon
correct: true
label.en: Moon
label.vi: Mặt Trăng
image.brief: Dùng lại hình `explore_full` ở bài `bau-troi-ngay-va-dem/mat-trang-doi-hinh`. Từ khoá tìm ảnh (EN): full moon over trees
image.alt.en: A bright white disc in a dark sky
image.alt.vi: Đĩa trắng sáng trên trời tối

### q2
id: f6c00fc8-d660-4d83-8223-ed6a026992d7
format: true_false
version: 1
dok: 1
prompt.en: A kite flies near us.
prompt.vi: Con diều bay gần mình.
image.brief: Dùng lại hình `explore_near`. Từ khoá tìm ảnh (EN): kite flying field sky
image.alt.en: A paper kite in a blue sky
image.alt.vi: Con diều giấy trên trời xanh
answer: true
hint.en: Think of holding a kite string.
hint.vi: Em nghĩ tới lúc cầm dây diều nhé.
explanation_correct.en: Yes! We can pull a kite down.
explanation_correct.vi: Đúng rồi! Mình kéo được diều xuống.
explanation_wrong.en: This is true. Kites fly near us.
explanation_wrong.vi: Câu này đúng. Diều bay gần mình.
feedback_false.en: This kite flies on a string, near us.
feedback_false.vi: Con diều này bay gần mình, có dây giữ.
> DOK 1: nhớ lại ô Near us. Hình là đúng vật được nói tới.

### q3
id: c3a72b06-7e73-4171-808d-4d47615b8bea
format: true_false
version: 1
dok: 1
prompt.en: Clouds can hide the Sun by day.
prompt.vi: Ban ngày, mây có thể che Mặt Trời.
image.brief: Dùng lại hình `explore_cloudy` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): sun behind clouds
image.alt.en: Sunbeams through the clouds
image.alt.vi: Tia nắng xuyên qua mây
answer: true
hint.en: Look at the bright edges of the clouds.
hint.vi: Em nhìn mép sáng của đám mây nhé.
explanation_correct.en: Yes! The Sun is still there, behind them.
explanation_correct.vi: Đúng rồi! Mặt Trời vẫn ở đó, sau mây.
explanation_wrong.en: This is true. Clouds cover the Sun.
explanation_wrong.vi: Câu này đúng. Mây che Mặt Trời.
feedback_false.en: Sunbeams peek out around these clouds.
feedback_false.vi: Tia nắng ló ra quanh những đám mây này.
> DOK 1: nhớ lại ô Day sky (ôn bài 1 w1, *Thời tiết và các mùa*). Hình là đúng vật được nói tới.

### q4
id: fc7aa02c-22c4-4209-9e28-62154cb2cd95
format: order_sequence
version: 1
dok: 2
prompt.en: Start with the nearest. Put them in order.
prompt.vi: Bắt đầu từ thứ gần nhất. Em xếp theo thứ tự nhé.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_kite, q4_plane, q4_moon
hint.en: The Moon is the farthest.
hint.vi: Mặt Trăng ở xa nhất.
explanation_correct.en: Yes! A plane flies higher than a kite.
explanation_correct.vi: Đúng rồi! Máy bay bay cao hơn diều.
explanation_wrong.en: The order is kite, plane, then Moon.
explanation_wrong.vi: Thứ tự là diều, máy bay, rồi Mặt Trăng.
> DOK 2: xếp ba thứ trên trời từ gần tới xa (ý chính ba). `prompt` nêu đầu gần; gợi ý chỉ nhắc đầu kia. Thẻ trong file không theo thứ tự đúng. Ba ảnh chụp ban ngày trên trời xanh, khung vuông (trăng ban ngày của bài 4, cho cùng nền trời với diều, máy bay).
> [CẦN KIỂM] Diều gần hơn máy bay, máy bay gần hơn Mặt Trăng (hiển nhiên; ghi cho đủ).

#### item q4_moon
label.en: Moon
label.vi: Mặt Trăng
image.brief: Dùng lại hình `explore_day_moon` ở bài `bau-troi-ngay-va-dem/mat-trang-doi-hinh`. Từ khoá tìm ảnh (EN): moon in daytime blue sky
image.alt.en: A pale white shape in a blue sky
image.alt.vi: Vầng trắng mờ trên trời xanh

#### item q4_kite
label.en: kite
label.vi: con diều
image.brief: Dùng lại hình `explore_near`. Từ khoá tìm ảnh (EN): kite flying field sky
image.alt.en: A paper kite in a blue sky
image.alt.vi: Con diều giấy trên trời xanh

#### item q4_plane
label.en: plane
label.vi: máy bay
image.brief: [ảnh] Một chiếc máy bay chở khách nhỏ trên nền trời xanh, bay cao, có thể có vệt khói trắng phía sau; không thấy tên hãng, logo, chữ, số hiệu (chụp đủ xa để không đọc được); không mặt đất hay chỉ một mép cây. Ảnh vuông hoặc ngang có khoảng trống (thẻ `order_sequence` vuông; từ lượt 2 không còn ở câu q5). Từ khoá tìm ảnh (EN): airplane high blue sky; plane contrail blue sky; jet flying high sky
image.alt.en: A small jet high in the blue
image.alt.vi: Chiếc máy bay nhỏ trên trời xanh

### q5
id: 75d0c537-43b3-4c8b-a42c-fee67d1bac2e
format: single_choice
version: 1
dok: 2
prompt.en: Which one is the farthest away?
prompt.vi: Cái nào ở xa nhất?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of what you can never reach.
hint.vi: Em nghĩ tới thứ mình không bao giờ với tới nhé.
explanation_correct.en: Yes! Stars are farther than the Moon.
explanation_correct.vi: Đúng rồi! Sao còn xa hơn cả Mặt Trăng.
explanation_wrong.en: The answer is the stars, farthest of all.
explanation_wrong.vi: Đáp án là các vì sao, ở xa nhất.
> DOK 2: áp ý gần và xa vào ba thứ đã gặp (diều ở ô Học, cú ở w2, sao ở bài 5). `alt` đáp án ("Bright dots on dark purple") không có chữ "far", "farthest".
> Lượt 2 (tester n8): "far, far away" đổi thành "the farthest away", và lựa chọn sai máy bay (bé dễ thấy máy bay trên mây là "rất xa") đổi thành con cú đậu trên cành. Ba ảnh vẫn là ảnh chụp, đều đã gặp trong bài.
> [CẦN KIỂM] Sao xa hơn Mặt Trăng rất nhiều.

#### option q5_kite
correct: false
feedback.en: A kite flies near, on a string.
feedback.vi: Diều bay gần, có dây buộc.
label.en: kite
label.vi: con diều
image.brief: Dùng lại hình `explore_near`. Từ khoá tìm ảnh (EN): kite flying field sky
image.alt.en: A paper kite in a blue sky
image.alt.vi: Con diều giấy trên trời xanh

#### option q5_stars
correct: true
label.en: stars
label.vi: các vì sao
image.brief: Dùng lại hình `explore_twinkle` ở bài `bau-troi-ngay-va-dem/cac-vi-sao`. Từ khoá tìm ảnh (EN): bright stars night sky
image.alt.en: Bright dots on dark purple
image.alt.vi: Chấm sáng trên nền tím thẫm

#### option q5_owl
correct: false
feedback.en: An owl sits on a branch near us.
feedback.vi: Con cú đậu trên cành, gần mình.
label.en: owl
label.vi: con cú
image.brief: Dùng lại hình `explore_owl` ở bài `bau-troi-ngay-va-dem/ngay-va-dem`. Từ khoá tìm ảnh (EN): great horned owl perched
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành

### q6
id: f2f4ac71-c957-4eaf-ab8f-528118cf9442
format: true_false
version: 1
dok: 2
misconception: moon_follows_me
prompt.en: The Moon follows me when I walk.
prompt.vi: Mặt Trăng đi theo em khi em đi.
image.brief: Dùng lại hình `explore_full` ở bài `bau-troi-ngay-va-dem/mat-trang-doi-hinh`. Từ khoá tìm ảnh (EN): full moon over trees
image.alt.en: A bright white disc in a dark sky
image.alt.vi: Đĩa trắng sáng trên trời tối
answer: false
hint.en: Think of how far away the Moon is.
hint.vi: Em nghĩ xem Mặt Trăng ở xa thế nào nhé.
explanation_correct.en: The Moon is far; we see it everywhere.
explanation_correct.vi: Mặt Trăng ở rất xa nên em đi đâu cũng thấy.
explanation_wrong.en: This is false. The Moon stays far away.
explanation_wrong.vi: Câu này sai. Mặt Trăng vẫn ở rất xa.
feedback_true.en: This Moon is far up in the sky.
feedback_true.vi: Vầng trăng này ở tít trên trời cao.
> Câu misconception (`moon_follows_me`), bằng hình, DOK 2: bé thấy trăng "đi theo" khi ngồi xe sẽ chạm gật đầu. Câu chỉ kiểm một việc. `explanation_correct` là đúng câu `correction` ở `_topic.md` (mô tả khoảng cách, SK-061 khuyến nghị 1).
> [CẦN KIỂM] Quan niệm `moon_follows_me` (mục Misconceptions ở `_topic.md`); giọng EN đọc chỗ dấu chấm phẩy.

## Từ vựng

### sky
id: 7173cdae-540a-4d48-82f3-ca0413891903
tier: core
term.en: sky
term.vi: bầu trời
example.en: Birds fly across the blue sky.
example.vi: Chim bay qua bầu trời xanh.
image.brief: Dùng lại hình `explore_cloudy` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): sun behind clouds
image.alt.en: Sunbeams through the clouds
image.alt.vi: Tia nắng xuyên qua mây

### near
id: 5e3fb7d0-3bae-4b8a-8fa4-9c88459e90d5
tier: core
term.en: near
term.vi: gần
example.en: My kite flies near the trees.
example.vi: Con diều của em bay gần hàng cây.
image.brief: Dùng lại hình `explore_near`. Từ khoá tìm ảnh (EN): kite flying field sky
image.alt.en: A paper kite in a blue sky
image.alt.vi: Con diều giấy trên trời xanh

### cloud
id: f9957d9f-df24-4e7a-8b09-2c90da5682b4
tier: extra
term.en: cloud
term.vi: đám mây
example.en: A white cloud floats over the field.
example.vi: Đám mây trắng trôi trên cánh đồng.
image.brief: Dùng lại hình `explore_cloudy` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): sun behind clouds
image.alt.en: Sunbeams through the clouds
image.alt.vi: Tia nắng xuyên qua mây
> "cloudy" đã là từ của *Thời tiết và các mùa* bài 1; "cloud" là danh từ, khác từ.

### kite
id: 88726707-e536-4233-8ff3-26514c054195
tier: extra
term.en: kite
term.vi: con diều
example.en: We fly a kite on windy days.
example.vi: Mình thả diều vào ngày lộng gió.
image.brief: Dùng lại hình `explore_near`. Từ khoá tìm ảnh (EN): kite flying field sky
image.alt.en: A paper kite in a blue sky
image.alt.vi: Con diều giấy trên trời xanh

## Thưởng

### day_moon_card
id: a88b944a-f888-4170-89ba-ae221dd98301
set: sky
rarity: rare
name.en: Daytime Moon
name.vi: Trăng ban ngày
tag.en: Out in the blue sky
tag.vi: Hiện trên trời xanh
fact.en: Look up some mornings to spot it.
fact.vi: Có buổi sáng, em nhìn lên sẽ thấy trăng.
image.brief: [ảnh] Trăng lưỡi liềm hay nửa vầng màu trắng nhạt trên nền trời xanh ban ngày, cạnh một cành cây hay ngọn tre; khác ảnh `explore_day_moon` bài 4 (hình trăng khác, có cành cây); không Mặt Trời trong khung, không người, không chữ. Khung vuông. Từ khoá tìm ảnh (EN): crescent moon daytime blue sky branch; daylight moon tree branch
image.alt.en: A pale half Moon in a blue sky
image.alt.vi: Nửa vầng trăng mờ trên trời xanh
> Lượt 3 (designer 20/11): ảnh nửa vầng trăng trên trời xanh, không có cành cây (ảnh có cành thì trăng quá nhỏ). `alt` theo ảnh thật; chữ thẻ không nhắc cành cây nên giữ.
> Thẻ khép chủ đề, nhắc lại `moon_only_at_night` của bài 4.
> [CẦN KIỂM] Có buổi sáng nhìn thấy trăng (nhiều ngày trong tháng, trăng thấy được buổi sáng).

## Ghi chú cho hoạ sĩ

- **Loại hình:** kệ Chơi là **sáu hình vẽ giấy cắt** (mục `own`, `method: "drawn"`, credit "Science Kids"): năm hình mới `tray_sun`, `tray_rainbow`, `tray_moon`, `tray_stars`, `tray_round_lantern`, cộng `tray_star_lantern` dùng lại `star_lantern_card` của *Thời tiết và các mùa* bài 6. Cùng nét, cùng cỡ, nền trơn (ngày xanh nhạt, đêm xanh than). Mọi chỗ khác là ảnh chụp.
- **Không dùng:** quả địa cầu, bản đồ, ảnh Trái Đất từ vũ trụ, máy bay có logo hay chữ, diều có chữ, Mặt Trời có mặt người, trăng có chú Cuội.
- **Sao trong hình vẽ:** chấm tròn hay sao bốn cánh nhỏ; chỉ đèn ông sao mới có năm cánh (để món bẫy khác rõ).
- **Một câu, một kệ, một loại hình:** kệ toàn hình vẽ; mọi câu quiz và Khởi động toàn ảnh chụp.
- **Ảnh mới (ba):** `explore_near` (diều nhiều màu trên trời xanh, không thấy cánh đồng; lượt 3), `q4_plane` (máy bay), `day_moon_card` (nửa vầng trăng trên trời xanh, không cành cây; lượt 3).
- **Dùng lại:** `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay` `explore_cloudy`; bài 2 `explore_owl` (cú, lượt 4); `co-the-cua-em/nam-giac-quan-cua-em` `tray_rooster`, `tray_rainbow`; `thoi-tiet-va-cac-mua/mua-lai-ve` `star_lantern_card`; bài 2 `night_sky_card`; bài 3 `explore_lights`; bài 4 `explore_full`, `explore_day_moon`; bài 5 `explore_city`, `explore_far`, `explore_twinkle`; hàng rào tre.
- **Màu:** Học: Day sky `vang_hoe`, Night sky `cham`, Near us `gi_dong`, Far away `nau_dat`. Chơi: Trời ban ngày `vang_hoe`, Trời ban đêm `cham`, Do người làm ra `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (sky, near). Chơi `build_tray` ba chỗ, hai nhóm `required`, một nhóm `limit`, sáu món (toàn hình vẽ). Khởi động `true_false` (w1 Đúng, w2 Sai), `single_choice` hai lựa chọn (w3). Quiz `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2 Đúng, q3 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`moon_follows_me`).
- **Màn Chơi, ví dụ để kiểm:** Mặt Trời, Trăng → `balanced`; Cầu vồng, Các vì sao → `balanced`; Mặt Trời, Cầu vồng → `missing.tray_night`; Đèn ông sao, Mặt Trời, Trăng → `has_limited`; Đèn lồng tròn, Cầu vồng → `has_limited`.
- **Khởi động trỏ:** w1 → bài 5, w2 → bài 2, w3 → bài 3 của chủ đề này.
- **Hình vẽ:** năm mục `own` mới trong `content/images/explorer/bau-troi-ngay-va-dem/tren-bau-troi-co-gi.json`; `tray_star_lantern` trỏ hình đã có.
- **Thẻ thưởng:** `day_moon_card`, `rare`.
- **Từ EN có thể ngoài Starters/Movers:** daytime, stargazing, rainbow, kite string, jet, farthest, nearest, beyond. Nghe thử giọng EN đọc câu có dấu chấm phẩy "The Moon is far; we see it everywhere."; giọng VI đọc "lộng gió", "các vì sao".
