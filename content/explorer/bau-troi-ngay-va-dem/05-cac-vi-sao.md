---
id: f5cbd4a2-14f2-4d55-b052-343b4c23df39
topic: bau-troi-ngay-va-dem
slug: cac-vi-sao
order: 5
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: The stars
vi: Các vì sao
> Giữ đúng tên bài 5 ở `content/syllabus.json` và bảng Phần B của SK-061. `id` để trống.

## Mục tiêu
en: I can say what stars look like.
vi: Em kể được các vì sao trông thế nào.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 19/11/2026. Ticket SK-061. Mọi dòng `id:` để trống.
> Ý của SK-061: đêm trời quang thấy nhiều sao lấp lánh; ở quê thấy nhiều sao hơn ở phố nhiều đèn; sao trông nhỏ vì ở rất xa (chỉ mô tả khoảng cách, khuyến nghị 1). Không nói sao là "mặt trời ở xa", không chòm sao, Ngân Hà, sao băng, Sao Mai, Sao Hôm (Discoverer #7, Scientist #2).
> Chữ "vì sao" chỉ xuất hiện trong "các vì sao", "những vì sao" (SK-061 khuyến nghị 1, lưu ý khi grep).

## Ý chính
1.en: On clear nights, we see many stars.
1.vi: Đêm trời quang, mình thấy nhiều sao.
2.en: Stars twinkle and look very small.
2.vi: Sao lấp lánh và trông rất nhỏ.
3.en: Stars are big, but very far away.
3.vi: Sao rất to, nhưng ở rất xa.
> Từ cụ thể tới trừu tượng: điều bé thấy (nhiều sao), cách sao trông ra sao (lấp lánh, nhỏ), rồi một ý bé phải tin bằng lời (sao to nhưng ở rất xa). Ý ba sửa `stars_are_tiny`; EN không có "because", VI không có "vì".
> Ghép với ô Học (`KeyPointPictures.match`): ý 1 → Starry night (clear, night, star), ý 2 → Twinkle (star, twinkl, look, small), ý 3 → Very far (star, big, far, away). Ô City lights không ghép.
> [CẦN KIỂM] Sao rất to (nhiều sao to hơn Mặt Trời) nhưng ở rất xa.

## Khởi động

> Ba câu: w1 ôn bài trước (trăng lưỡi liềm, mốc "hôm trước"); w2 ôn bài 3 (lên đèn sau khi Mặt Trời lặn, cách một bài); w3 ôn bài 1 (an toàn mắt, cách bốn bài, mốc "khoảng một tuần" như `warmup.week`).

### w1
id: a772809e-82a3-43a9-a7fa-4be6a61c276f
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: bau-troi-ngay-va-dem/mat-trang-doi-hinh
prompt.en: Which one is a thin Moon?
prompt.vi: Đâu là trăng lưỡi liềm?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for a curve, like a banana.
hint.vi: Em tìm hình cong cong như quả chuối nhé.
explanation_correct.en: Yes! Some nights, the Moon is thin.
explanation_correct.vi: Đúng rồi! Có đêm, trăng mảnh như vậy.
explanation_wrong.en: The answer is the curved, thin Moon.
explanation_wrong.vi: Đáp án là vầng trăng cong và mảnh.
> Ôn ô Thin Moon bài 4. Hai ảnh chụp đã gặp. `alt` đáp án ("A bright curve of light") không có chữ "thin", "Moon".

#### option w1_full
correct: false
feedback.en: This Moon is big and round.
feedback.vi: Vầng trăng này to và tròn.
label.en: full Moon
label.vi: trăng tròn
image.brief: Dùng lại hình `explore_full` ở bài `bau-troi-ngay-va-dem/mat-trang-doi-hinh`. Từ khoá tìm ảnh (EN): full moon over trees
image.alt.en: A bright white disc in a dark sky
image.alt.vi: Đĩa trắng sáng trên trời tối

#### option w1_crescent
correct: true
label.en: thin Moon
label.vi: trăng lưỡi liềm
image.brief: Dùng lại hình `explore_crescent` ở bài `bau-troi-ngay-va-dem/mat-trang-doi-hinh`. Từ khoá tìm ảnh (EN): crescent moon twilight
image.alt.en: A bright curve of light
image.alt.vi: Vệt sáng cong cong trên trời

### w2
id: ef16c06c-9084-4ffb-8b21-97767f5677a1
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: bau-troi-ngay-va-dem/mat-troi-moc-mat-troi-lan
prompt.en: Streetlights come on at sunrise.
prompt.vi: Đèn đường bật sáng lúc Mặt Trời mọc.
image.brief: Dùng lại hình `explore_lights` ở bài `bau-troi-ngay-va-dem/mat-troi-moc-mat-troi-lan`. Từ khoá tìm ảnh (EN): streetlights dusk street
image.alt.en: Yellow lamps under a purple sky
image.alt.vi: Đèn vàng dưới trời tím
answer: false
hint.en: Think of the sky as it gets dark.
hint.vi: Em nghĩ tới lúc trời tối dần nhé.
explanation_correct.en: Streetlights come on after sunset.
explanation_correct.vi: Đèn đường bật sáng sau khi Mặt Trời lặn.
explanation_wrong.en: This is false. They glow in the evening.
explanation_wrong.vi: Câu này sai. Đèn đường sáng lúc chiều tối.
feedback_true.en: This purple sky comes at day's end.
feedback_true.vi: Trời tím thế này là lúc cuối ngày.
> Ôn ô Lights on bài 3. Lượt 2 (tester n1): đổi sang câu khẳng định đáp án Sai; `explanation_correct` đứng một mình.

### w3
id: 79995c45-6826-43a9-bbee-90050e3a55a4
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: bau-troi-ngay-va-dem/mat-troi-cho-anh-sang-va-hoi-am
prompt.en: Bright sunshine can hurt our eyes.
prompt.vi: Nắng chói có thể làm đau mắt mình.
image.brief: Dùng lại hình `explore_safe` ở bài `bau-troi-ngay-va-dem/mat-troi-cho-anh-sang-va-hoi-am`. Từ khoá tìm ảnh (EN): child sun hat walking from behind
image.alt.en: A child in a sun hat, from behind
image.alt.vi: Bạn nhỏ đội nón, nhìn từ phía sau
answer: true
hint.en: Think of squinting on a sunny day.
hint.vi: Em nhớ lúc phải nheo mắt ngoài nắng nhé.
explanation_correct.en: Yes! Never look right at the Sun.
explanation_correct.vi: Đúng rồi! Không bao giờ nhìn thẳng vào Mặt Trời.
explanation_wrong.en: This is true. Keep your eyes safe.
explanation_wrong.vi: Câu này đúng. Em giữ an toàn cho mắt nhé.
feedback_false.en: This child wears a hat in the sun.
feedback_false.vi: Bạn nhỏ này đội nón khi ra nắng.
> Ôn ý chính ba bài 1 (an toàn mắt) bằng một câu Đúng, khác câu q6 bài 1 (`safe_to_look_at_sun`, Sai). Mốc khoảng một tuần (cách bốn bài).

## Học

> Bốn ô: ba ảnh chụp và ô Very far là hình vẽ giấy cắt (lượt 3) người lớn và em nhỏ ngắm sao (chụp từ phía sau) và câu "go stargazing with a grown-up" (SK-061 khuyến nghị 3: chỉ là ví dụ ô Học, không thành câu quiz).
> Chữ cần dạy trước khi hỏi: "on clear nights", "clouds can hide the stars" (q1, q5) ở ô Starry night; "twinkle" (q2) ở ô Twinkle; "far things look small" (q4, q6) ở ô Very far; "in the countryside, we see more" (q3) ở ô City lights.

### explore
id: 6466eb30-6954-4542-9d87-00657cffa5a3
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_starry
label.en: Starry night
label.vi: Đêm đầy sao
color: cham
sentence.en: On clear nights, the sky fills with stars.
sentence.vi: Đêm trời quang, bầu trời đầy sao.
image.brief: [ảnh] Bầu trời đêm đầy sao trên một vùng quê: rặng cây, mái nhà hay đồi thấp in đen ở mép dưới, phía trên là rất nhiều chấm sao trắng; không thấy dải Ngân Hà rõ, không vệt sao băng, không chòm sao nối nét, không vệt sao xoay tròn (ảnh phơi sáng lâu); không người, không đèn lớn, không chữ. Ảnh ngang có khoảng trống (khung vuông ở Học và kệ Chơi, thẻ ba lựa chọn 5:2 câu q1, thẻ hai lựa chọn 17:10 câu q3, khung 4:3 câu q6, thẻ từ 2:1). Từ khoá tìm ảnh (EN): starry night sky countryside; night sky stars trees silhouette; stars over village
image.alt.en: Countless dots of light above trees
image.alt.vi: Vô số chấm sáng phía trên rặng cây
examples.1.en: stars come out after sunset
examples.1.vi: sao hiện ra sau khi Mặt Trời lặn
examples.2.en: clouds can hide the stars
examples.2.vi: mây có thể che khuất các vì sao
examples.3.en: darker nights show more stars
examples.3.vi: đêm càng tối, càng thấy nhiều sao
> Hình gốc của chủ đề (kệ, câu q1, q3, q6, từ `twinkle`, `countryside`). `alt` không có chữ "star", "sky", "see" vì câu q1, q3 có đáp án là ảnh này.
> Không Ngân Hà trong ảnh (chữ cấm "Ngân Hà", "galaxy"; bé dễ hỏi, ngoài phạm vi).

#### group explore_twinkle
label.en: Twinkle
label.vi: Lấp lánh
color: vang_hoe
sentence.en: Stars twinkle and look very small.
sentence.vi: Sao lấp lánh và trông rất nhỏ.
image.brief: [ảnh] Nhiều ngôi sao sáng trên nền trời đêm tím thẫm (ảnh lượt 4: "The Stars At Night Are Big And Bright", cắt lấy phần trời đầy sao; `alt` cũ "A few bright dots on dark blue" đổi theo ảnh, bỏ chữ "sky" vì câu q4 hỏi "…in the sky?"), không thấy mặt đất hay chỉ một mép cây rất nhỏ; sao là chấm sáng tròn, có thể có tia sáng nhỏ quanh sao sáng nhất; không trăng, không vệt sao băng, không chòm sao nối nét, không chữ. Ảnh vuông hoặc ngang (khung vuông ở Học và kệ Chơi, khung 4:3 câu q2, thẻ ba lựa chọn 5:2 câu q4 và bài 6 q5, thẻ từ 2:1). Từ khoá tìm ảnh (EN): bright stars night sky; few stars dark blue sky; stars close up sky
image.alt.en: Bright dots on dark purple
image.alt.vi: Chấm sáng trên nền tím thẫm
examples.1.en: some stars look brighter
examples.1.vi: có ngôi sao trông sáng hơn
examples.2.en: they look like dots of light
examples.2.vi: sao trông như những chấm sáng
examples.3.en: their light seems to flicker
examples.3.vi: ánh sao như nhấp nháy
> Hình gốc của chủ đề (kệ, câu q2, q4, từ `star`; bài 6 q5). `alt` không có chữ "sky", "far", "light" vì câu q4 hỏi "Which light is far up in the sky?" và đáp án là ảnh này.
> Câu chính nói "look very small" (trông nhỏ); ô sau sửa thành "big, but very far away". Không giải thích vì sao sao lấp lánh (không khí, Scientist).
> [CẦN KIỂM] Sao lấp lánh khi nhìn bằng mắt thường.

#### group explore_far
label.en: Very far
label.vi: Rất xa
color: nau_dat
sentence.en: Stars are big, but very far away.
sentence.vi: Sao rất to, nhưng ở rất xa.
image.brief: [hình vẽ] Giấy cắt style E (designer vẽ 20/11 vì không có ảnh hợp lệ): một người lớn và một em nhỏ đứng hay ngồi cạnh nhau trên đồi cỏ hay sân nhà, ngước nhìn bầu trời đêm đầy sao, chụp từ phía sau, chỉ thấy dáng in đen; không thấy mặt, không đèn pin chiếu vào mắt, không kính thiên văn, không ống nhòm, không chữ. Có người lớn đi cùng (SK-061 khuyến nghị designer 6). Ảnh ngang có khoảng trống (khung vuông ở Học, thẻ từ 2:1; bài 6 ô Far away). Từ khoá tìm ảnh (EN): parent child stargazing silhouette; family looking at stars night; adult child night sky back view
image.alt.en: A grown-up and child gazing upward
image.alt.vi: Người lớn và em nhỏ ngước nhìn lên trời
examples.1.en: far things look small
examples.1.vi: vật ở xa trông nhỏ
examples.2.en: much farther away than the Moon
examples.2.vi: còn xa hơn Mặt Trăng rất nhiều
examples.3.en: go stargazing with a grown-up
examples.3.vi: ngắm sao cùng người lớn
> Ô sửa `stars_are_tiny` (chỉ mô tả khoảng cách). Ví dụ ba là câu an toàn "cùng người lớn" của bài 5 (SK-061 khuyến nghị 3).
> [CẦN KIỂM] Sao xa hơn Mặt Trăng rất nhiều.

#### group explore_city
label.en: City lights
label.vi: Đèn thành phố
color: gi_dong
sentence.en: City lights hide many stars.
sentence.vi: Đèn thành phố che khuất nhiều ngôi sao.
image.brief: [ảnh] Một thành phố về đêm sáng rực đèn (nhà cao, đường phố), bầu trời phía trên sáng mờ màu cam xám, gần như không thấy ngôi sao nào; không biển hiệu, logo, chữ đọc được; không người rõ mặt. Ảnh ngang có khoảng trống (khung vuông ở Học, thẻ hai lựa chọn 17:10 câu q3, khung 4:3 câu w1 bài 6). Từ khoá tìm ảnh (EN): city night skyline glow sky; city lights night no stars; light pollution city sky
image.alt.en: A glowing city under an empty sky
image.alt.vi: Thành phố sáng đèn dưới bầu trời trống
examples.1.en: in the countryside, we see more
examples.1.vi: ở quê, mình thấy nhiều sao hơn
examples.2.en: streetlights make the sky glow
examples.2.vi: đèn đường làm bầu trời sáng mờ
examples.3.en: turn off lights to see more
examples.3.vi: tắt bớt đèn để thấy nhiều sao hơn
> Ý "ở quê thấy nhiều sao hơn ở phố nhiều đèn" (SK-061). Không giả định bé ở quê hay ở phố.
> [CẦN KIỂM] Ở nơi ít đèn thấy nhiều sao hơn nơi nhiều đèn (ô nhiễm ánh sáng).

### new_words
id: 90912034-843d-4080-8279-14dfc93c8c2e
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: star, twinkle

## Chơi

> Bé chọn những thứ sáng ở rất xa trên trời: các vì sao và Mặt Trăng. Món bẫy là ánh sáng ở gần mình: đom đóm, đèn đường, pháo hoa (cùng sáng ban đêm nhưng không phải sao). Đạt khi đủ hai nhóm và không chọn món bẫy.
> Kệ sáu món, toàn ảnh chụp (SK-059: hai cột).

### tray
id: 927966b9-74c7-424f-917a-7bcf2fd03da6
type: build_tray
version: 1
prompt.en: Find what shines far up in the sky
prompt.vi: Tìm những thứ sáng tít trên bầu trời
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick stars and the Moon, far away.
messages.start.vi: Em chọn sao và trăng, ở tít trên cao nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Stars and the Moon are far away.
messages.balanced.vi: Tuyệt! Sao và trăng đều ở rất xa.
messages.has_limited.en: That light is near us, not far away.
messages.has_limited.vi: Ánh sáng đó ở gần mình, không ở rất xa.
messages.missing.tray_stars.en: You still need some stars.
messages.missing.tray_stars.vi: Em còn thiếu các vì sao.
messages.missing.tray_moon.en: You still need the Moon.
messages.missing.tray_moon.vi: Em còn thiếu Mặt Trăng.
> Lời nhắn `has_limited` đúng với cả ba món bẫy (đom đóm, đèn đường, pháo hoa). Nhãn "Near us" · "Ở gần mình" như bài 4.

#### group tray_stars
label.en: Stars
label.vi: Các vì sao
color: cham
role: required

#### group tray_moon
label.en: Moon
label.vi: Mặt Trăng
color: vang_hoe
role: required

#### group tray_near
label.en: Near us
label.vi: Ở gần mình
color: do_son
role: limit

#### item tray_starry
label.en: Starry sky
label.vi: Trời đầy sao
group: tray_stars
image.brief: Dùng lại hình `explore_starry`. Từ khoá tìm ảnh (EN): starry night sky countryside
image.alt.en: Countless dots of light above trees
image.alt.vi: Vô số chấm sáng phía trên rặng cây

#### item tray_bright_stars
label.en: Bright stars
label.vi: Sao sáng
group: tray_stars
image.brief: Dùng lại hình `explore_twinkle`. Từ khoá tìm ảnh (EN): bright stars night sky
image.alt.en: Bright dots on dark purple
image.alt.vi: Chấm sáng trên nền tím thẫm

#### item tray_full_moon
label.en: Full Moon
label.vi: Trăng tròn
group: tray_moon
image.brief: Dùng lại hình `explore_full` ở bài `bau-troi-ngay-va-dem/mat-trang-doi-hinh`. Từ khoá tìm ảnh (EN): full moon over trees
image.alt.en: A bright white disc in a dark sky
image.alt.vi: Đĩa trắng sáng trên trời tối

#### item tray_fireflies
label.en: Fireflies
label.vi: Đom đóm
group: tray_near
image.brief: Dùng lại hình `tray_firefly_item` ở bài `bau-troi-ngay-va-dem/ngay-va-dem`. Từ khoá tìm ảnh (EN): fireflies glowing night grass
image.alt.en: Tiny glowing lights over the grass
image.alt.vi: Những đốm sáng nhỏ trên bãi cỏ
> Món bẫy giống nhóm "Stars": nhiều đốm sáng nhỏ trong đêm, nhưng bay sát bãi cỏ.

#### item tray_streetlights
label.en: Streetlights
label.vi: Đèn đường
group: tray_near
image.brief: Dùng lại hình `explore_lights` ở bài `bau-troi-ngay-va-dem/mat-troi-moc-mat-troi-lan`. Từ khoá tìm ảnh (EN): streetlights dusk street
image.alt.en: Yellow lamps under a purple sky
image.alt.vi: Đèn vàng dưới trời tím

#### item tray_fireworks
label.en: Fireworks
label.vi: Pháo hoa
group: tray_near
image.brief: [ảnh] Pháo hoa nở trên trời đêm, vài chùm sáng nhiều màu, thấy mép mái nhà hay hàng cây phía dưới để biết pháo ở gần; không người, không đám đông, không chữ, không biển hiệu. Ảnh vuông hoặc ngang có khoảng trống (món Chơi vuông, thẻ ba lựa chọn 5:2 câu q1). Từ khoá tìm ảnh (EN): fireworks night sky; colorful fireworks over trees
image.alt.en: Bursts of coloured sparks
image.alt.vi: Những chùm tia lửa nhiều màu
> Món bẫy giống nhóm "Stars": sáng trên trời đêm, nhưng do người bắn lên, ở gần.

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1, q4 ba lựa chọn; q3 hai lựa chọn), `true_false` (q2 Đúng, q5 Sai, q6 Sai).
> Loại hình: toàn ảnh chụp. q1, q3, q4 lựa chọn đều đã gặp ở Học hay kệ Chơi.

### q1
id: 17e701df-5705-4f28-84ba-957c2730b2c5
format: single_choice
version: 1
dok: 1
prompt.en: Which picture shows a starry sky?
prompt.vi: Hình nào là bầu trời đầy sao?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for many dots high above.
hint.vi: Em tìm thật nhiều chấm sáng ở tít trên cao nhé.
explanation_correct.en: Yes! Clear nights show many stars.
explanation_correct.vi: Đúng rồi! Đêm trời quang có rất nhiều sao.
explanation_wrong.en: The answer is the sky full of stars.
explanation_wrong.vi: Đáp án là bầu trời đầy sao.
> DOK 1: nhận ra trời sao (ô Starry night). Đom đóm, pháo hoa là lựa chọn sai gần (cũng sáng ban đêm), bé đã gặp ở kệ.

#### option q1_fireflies
correct: false
feedback.en: Fireflies glow just above the grass.
feedback.vi: Đom đóm lập loè ngay trên bãi cỏ.
label.en: fireflies
label.vi: đom đóm
image.brief: Dùng lại hình `tray_firefly_item` ở bài `bau-troi-ngay-va-dem/ngay-va-dem`. Từ khoá tìm ảnh (EN): fireflies glowing night grass
image.alt.en: Tiny glowing lights over the grass
image.alt.vi: Những đốm sáng nhỏ trên bãi cỏ

#### option q1_starry
correct: true
label.en: starry sky
label.vi: trời đầy sao
image.brief: Dùng lại hình `explore_starry`. Từ khoá tìm ảnh (EN): starry night sky countryside
image.alt.en: Countless dots of light above trees
image.alt.vi: Vô số chấm sáng phía trên rặng cây

#### option q1_fireworks
correct: false
feedback.en: People make fireworks for festivals.
feedback.vi: Người ta bắn pháo hoa vào ngày lễ.
label.en: fireworks
label.vi: pháo hoa
image.brief: Dùng lại hình `tray_fireworks`. Từ khoá tìm ảnh (EN): fireworks night sky
image.alt.en: Bursts of coloured sparks
image.alt.vi: Những chùm tia lửa nhiều màu

### q2
id: 58300328-321b-488f-846d-cb0fc401906c
format: true_false
version: 1
dok: 1
prompt.en: Stars twinkle in the night sky.
prompt.vi: Sao lấp lánh trên bầu trời đêm.
image.brief: Dùng lại hình `explore_twinkle`. Từ khoá tìm ảnh (EN): bright stars night sky
image.alt.en: Bright dots on dark purple
image.alt.vi: Chấm sáng trên nền tím thẫm
answer: true
hint.en: Think of stars on a clear night.
hint.vi: Em nhớ lại những ngôi sao đêm trời quang nhé.
explanation_correct.en: Yes! Their light seems to flicker.
explanation_correct.vi: Đúng rồi! Ánh sao như nhấp nháy.
explanation_wrong.en: This is true. Stars twinkle at night.
explanation_wrong.vi: Câu này đúng. Ban đêm sao lấp lánh.
feedback_false.en: These stars sparkle in the dark sky.
feedback_false.vi: Những ngôi sao này lấp lánh trên trời tối.
> DOK 1: nhớ lại ô Twinkle. Hình là đúng vật được nói tới.

### q3
id: 08ea113c-83ce-4722-96af-a4002e5405f8
format: single_choice
version: 1
dok: 1
prompt.en: Where do we see more stars?
prompt.vi: Ở đâu mình thấy nhiều sao hơn?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of where nights are darkest.
hint.vi: Em nghĩ xem ở đâu đêm tối nhất nhé.
explanation_correct.en: Yes! The countryside has fewer bright lights.
explanation_correct.vi: Đúng rồi! Ở quê ít đèn sáng hơn.
explanation_wrong.en: The answer is the dark countryside sky.
explanation_wrong.vi: Đáp án là bầu trời đêm ở quê.
> DOK 1: nhớ lại ô City lights (ví dụ một). Hai lựa chọn khác rõ: đồng quê tối dưới trời sao, phố sáng đèn dưới trời trống. `alt` đáp án không có chữ "see", "more", "stars".
> Lượt 2 (tester n4): hai ảnh **mới**, khác `explore_starry` (đáp án câu q1) và `explore_city`, để bé không chọn lại đúng ảnh của câu q1; hai ảnh cùng mới nên đáp án không là ảnh mới duy nhất.

#### option q3_town
correct: false
feedback.en: Bright lights hide stars in the city.
feedback.vi: Ở phố, đèn sáng che khuất các vì sao.
label.en: town at night
label.vi: phố về đêm
image.brief: [ảnh] Một dãy phố nhỏ hay thị trấn về đêm, nhà thấp sáng đèn, đèn đường dọc phố, bầu trời phía trên sáng mờ màu cam xám, không thấy ngôi sao nào; khác `explore_city` (không nhà cao tầng, chụp ngang tầm phố); không biển hiệu, logo, chữ đọc được, không biển số xe, không người rõ mặt. Ảnh ngang (thẻ hai lựa chọn 17:10). Từ khoá tìm ảnh (EN): small town street night lights; town night sky glow; street at night orange sky
image.alt.en: A bright street under a hazy sky
image.alt.vi: Dãy phố sáng đèn dưới trời mờ

#### option q3_countryside
correct: true
label.en: countryside sky
label.vi: trời đêm ở quê
image.brief: [ảnh] Một cánh đồng hay mái nhà tranh, nhà nhỏ ở quê tối đèn dưới bầu trời đêm nhiều sao; cảnh đất chiếm khoảng một phần ba dưới khung; khác `explore_starry` (cảnh khác, góc khác); không dải Ngân Hà rõ, không vệt sao băng, không chòm sao nối nét, không người, không chữ. Ảnh ngang (thẻ hai lựa chọn 17:10). Từ khoá tìm ảnh (EN): starry sky over farmland; stars over rural house night; night sky field stars
image.alt.en: A dark field under twinkling dots
image.alt.vi: Cánh đồng tối dưới những chấm lấp lánh

### q4
id: bffd5b10-4a36-4a00-918a-7842ad3835ad
format: single_choice
version: 1
dok: 2
prompt.en: Which light is far up in the sky?
prompt.vi: Ánh sáng nào ở tít trên bầu trời?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of lights higher than any roof.
hint.vi: Em nghĩ tới ánh sáng cao hơn mọi mái nhà nhé.
explanation_correct.en: Yes! Stars shine far beyond the clouds.
explanation_correct.vi: Đúng rồi! Sao sáng ở tít xa, sau cả những đám mây.
explanation_wrong.en: The answer is the stars, very far away.
explanation_wrong.vi: Đáp án là các vì sao, ở rất xa.
> DOK 2: phân loại gần và xa (áp ý chính ba và kệ Chơi vào câu mới). Ba ảnh đã gặp ở kệ.

#### option q4_fireflies
correct: false
feedback.en: Fireflies glow near the grass.
feedback.vi: Đom đóm lập loè gần bãi cỏ.
label.en: fireflies
label.vi: đom đóm
image.brief: Dùng lại hình `tray_firefly_item` ở bài `bau-troi-ngay-va-dem/ngay-va-dem`. Từ khoá tìm ảnh (EN): fireflies glowing night grass
image.alt.en: Tiny glowing lights over the grass
image.alt.vi: Những đốm sáng nhỏ trên bãi cỏ

#### option q4_streetlights
correct: false
feedback.en: Streetlights stand along the road.
feedback.vi: Đèn đường đứng dọc con đường.
label.en: streetlights
label.vi: đèn đường
image.brief: Dùng lại hình `explore_lights` ở bài `bau-troi-ngay-va-dem/mat-troi-moc-mat-troi-lan`. Từ khoá tìm ảnh (EN): streetlights dusk street
image.alt.en: Yellow lamps under a purple sky
image.alt.vi: Đèn vàng dưới trời tím

#### option q4_stars
correct: true
label.en: stars
label.vi: các vì sao
image.brief: Dùng lại hình `explore_twinkle`. Từ khoá tìm ảnh (EN): bright stars night sky
image.alt.en: Bright dots on dark purple
image.alt.vi: Chấm sáng trên nền tím thẫm

### q5
id: f9697546-e111-45be-8dc9-ff16fc3ff112
format: true_false
version: 1
dok: 2
prompt.en: We see stars best on cloudy nights.
prompt.vi: Đêm nhiều mây là lúc ngắm sao rõ nhất.
image.brief: [ảnh] Bầu trời đêm phủ mây dày xám, không thấy ngôi sao nào, có thể có ánh sáng mờ sau mây; phía dưới là ngọn cây hay mái nhà in đen; không trăng rõ, không người, không chữ. Ảnh ngang (khung 4:3). Từ khoá tìm ảnh (EN): cloudy night sky; overcast night clouds; night clouds no stars
image.alt.en: Thick clouds across a night sky
image.alt.vi: Mây dày phủ kín trời đêm
answer: false
hint.en: Think of clouds hiding the Sun.
hint.vi: Em nhớ lại lúc mây che Mặt Trời nhé.
explanation_correct.en: Clear nights are best for seeing stars.
explanation_correct.vi: Đêm trời quang là lúc ngắm sao rõ nhất.
explanation_wrong.en: This is false. Clouds hide the stars.
explanation_wrong.vi: Câu này sai. Mây che khuất các vì sao.
feedback_true.en: These thick clouds cover the sky.
feedback_true.vi: Những đám mây dày này che kín bầu trời.
> DOK 2: áp ý "mây che" (bài 1 w1, *Thời tiết và các mùa*) sang sao (ô Starry night, ví dụ hai). Câu khẳng định, đáp án Sai; `explanation_correct` đứng một mình.

### q6
id: 9b084a1e-05de-451f-b275-cdcfe3a95156
format: true_false
version: 1
dok: 2
misconception: stars_are_tiny
prompt.en: Stars are tiny, like little sparkles.
prompt.vi: Sao bé tí, như những đốm lấp lánh.
image.brief: Dùng lại hình `explore_starry`. Từ khoá tìm ảnh (EN): starry night sky countryside
image.alt.en: Countless dots of light above trees
image.alt.vi: Vô số chấm sáng phía trên rặng cây
answer: false
hint.en: Think of a plane far up high.
hint.vi: Em nghĩ tới chiếc máy bay tít trên cao nhé.
explanation_correct.en: Stars are big, but very far away.
explanation_correct.vi: Sao rất to, nhưng ở rất xa.
explanation_wrong.en: This is false. Stars only look small.
explanation_wrong.vi: Câu này sai. Sao chỉ trông nhỏ thôi.
feedback_true.en: Far away things look small, like these.
feedback_true.vi: Vật ở rất xa trông nhỏ, như những ngôi sao này.
> Câu misconception (`stars_are_tiny`), bằng hình, DOK 2: bé tin điều mắt thấy (sao là chấm nhỏ) sẽ chạm gật đầu. Câu chỉ kiểm một việc. Gợi ý là một cảnh quen (máy bay trên cao trông bé), không nói đáp án. `explanation_correct` là đúng câu `correction` ở `_topic.md`.
> [CẦN KIỂM] Quan niệm `stars_are_tiny` (mục Misconceptions ở `_topic.md`).

## Từ vựng

### star
id: 6b299c8d-1f22-4294-af60-62ec636a687b
tier: core
term.en: star
term.vi: ngôi sao
example.en: I see a star above our house.
example.vi: Em thấy một ngôi sao trên nóc nhà.
image.brief: Dùng lại hình `explore_twinkle`. Từ khoá tìm ảnh (EN): bright stars night sky
image.alt.en: Bright dots on dark purple
image.alt.vi: Chấm sáng trên nền tím thẫm

### twinkle
id: 24e59148-e09e-48a7-ad04-2c3946b92760
tier: core
term.en: twinkle
term.vi: lấp lánh
example.en: The stars twinkle on clear nights.
example.vi: Đêm trời quang, sao lấp lánh.
image.brief: Dùng lại hình `explore_starry`. Từ khoá tìm ảnh (EN): starry night sky countryside
image.alt.en: Countless dots of light above trees
image.alt.vi: Vô số chấm sáng phía trên rặng cây

### far
id: 2b5ebd73-a8ac-4914-aa63-601eda8b42d5
tier: extra
term.en: far
term.vi: xa
example.en: The stars are very, very far.
example.vi: Các vì sao ở rất, rất xa.
image.brief: Dùng lại hình `explore_far`. Từ khoá tìm ảnh (EN): parent child stargazing silhouette
image.alt.en: A grown-up and child gazing upward
image.alt.vi: Người lớn và em nhỏ ngước nhìn lên trời

### countryside
id: 3ade8720-a310-4e31-b27c-0df2f840b27e
tier: extra
term.en: countryside
term.vi: ở quê, nông thôn
example.en: The countryside has dark, starry nights.
example.vi: Ở quê, đêm tối và đầy sao.
image.brief: Dùng lại hình `explore_starry`. Từ khoá tìm ảnh (EN): starry night sky countryside
image.alt.en: Countless dots of light above trees
image.alt.vi: Vô số chấm sáng phía trên rặng cây

## Thưởng

### starry_sky_card
id: 30b292aa-eaa2-4aba-8fba-efba305341e3
set: sky
rarity: common
name.en: Starry sky
name.vi: Bầu trời sao
tag.en: Lights far, far away
tag.vi: Ánh sáng ở tít xa
fact.en: On dark nights, we see thousands of stars.
fact.vi: Đêm thật tối, mình thấy được hàng nghìn ngôi sao.
image.brief: [ảnh] Bầu trời đầy sao dày đặc trên núi hay đồng quê rất tối, đường chân trời là dãy đồi hay rặng cây in đen; không trăng, không dải Ngân Hà rõ, không vệt sao băng, không chòm sao nối nét, không người, không chữ. Khác `explore_starry` (nhiều sao hơn, cảnh khác) và khác thẻ `night_sky_card` bài 2 (không trăng, không làng). Khung vuông. Từ khoá tìm ảnh (EN): dark sky many stars hills; star filled sky mountains; night sky full of stars silhouette
image.alt.en: A sky packed with tiny lights
image.alt.vi: Bầu trời dày đặc những đốm sáng
> [CẦN KIỂM] Đêm thật tối, xa đèn, mắt thường thấy được vài nghìn ngôi sao (con số hay dùng khoảng hai nghìn tới ba nghìn ở một thời điểm).

## Ghi chú cho hoạ sĩ

- **Loại hình:** ảnh chụp, trừ `explore_far` là hình vẽ giấy cắt (designer vẽ 20/11 vì không có ảnh hợp lệ; chỉ ở ô Học và thẻ từ `far`, đứng một mình).
- **Không dùng:** dải Ngân Hà rõ, chòm sao nối nét, sao băng, vệt sao xoay tròn, kính thiên văn, ống nhòm, ảnh vũ trụ (tinh vân, thiên hà). Ảnh trời sao chỉ là chấm sáng trên nền trời, có cảnh đất ở mép dưới.
- **Người trong ảnh:** `explore_far` có người lớn đi cùng em nhỏ, chụp từ phía sau. Không trẻ một mình ban đêm.
- **Một câu, một kệ, một loại hình:** kệ sáu ảnh; mọi câu là ảnh chụp.
- **Ảnh mới (chín):** `explore_starry`, `explore_twinkle`, `explore_far`, `explore_city`, `tray_fireworks`, `q3_town`, `q3_countryside` (hai ảnh lượt 2, tester n4), `q5` (mây đêm), `starry_sky_card`. Bốn ảnh đầu là hình gốc của chủ đề: giữ đúng key và `alt`.
- **Dùng lại:** bài 1 `explore_safe`; bài 2 `tray_firefly_item`; bài 3 `explore_lights`; bài 4 `explore_full`, `explore_crescent`; hàng rào tre.
- **Màu:** Học: Starry night `cham`, Twinkle `vang_hoe`, Very far `nau_dat`, City lights `gi_dong`. Chơi: Các vì sao `cham`, Mặt Trăng `vang_hoe`, Ở gần mình `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (star, twinkle). Chơi `build_tray` ba chỗ, hai nhóm `required`, một nhóm `limit`, sáu món. Khởi động `single_choice` hai lựa chọn (w1), `true_false` (w2 Sai, w3 Đúng). Quiz `single_choice` (q1, q4 ba lựa chọn; q3 hai lựa chọn), `true_false` (q2 Đúng, q5 Sai, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`stars_are_tiny`).
- **Màn Chơi, ví dụ để kiểm:** Trời đầy sao, Trăng tròn → `balanced`; Sao sáng, Trời đầy sao, Trăng tròn → `balanced`; Trời đầy sao, Sao sáng → `missing.tray_moon`; Pháo hoa, Trăng tròn, Sao sáng → `has_limited`; Đom đóm, Trăng tròn → `has_limited`.
- **Khởi động trỏ:** w1 → bài 4, w2 → bài 3, w3 → bài 1 của chủ đề này.
- **Từ EN có thể ngoài Starters/Movers:** twinkle, countryside, stargazing, flicker, sparkles, fireflies, fireworks, sparks, gazing. Nghe thử giọng EN đọc "stargazing"; giọng VI đọc "các vì sao", "lập loè", "nhấp nháy".
