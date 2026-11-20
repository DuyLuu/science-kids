---
id: facbbd7f-1b96-4bbd-9e38-7a5e483499ce
topic: bau-troi-ngay-va-dem
slug: ngay-va-dem
order: 2
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Day and night
vi: Ngày và đêm
> Giữ đúng tên bài 2 ở `content/syllabus.json` và bảng Phần B của SK-061. `id` để trống.

## Mục tiêu
en: I can tell day and night apart.
vi: Em phân biệt được ban ngày và ban đêm.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 19/11/2026. Ticket SK-061. Mọi dòng `id:` để trống.
> Ý của SK-061: ban ngày trời sáng, có Mặt Trời; ban đêm trời tối, có trăng, sao; ban ngày đi học, chơi; ban đêm ngủ; có con vật thức ban đêm (cú, dơi, đom đóm). Không dạy vì sao có ngày và đêm (Discoverer #7 bài 1–3).

## Ý chính
1.en: By day, the sky is bright.
1.vi: Ban ngày, bầu trời sáng.
2.en: At night, the sky is dark.
2.vi: Ban đêm, bầu trời tối.
3.en: Some animals wake up at night.
3.vi: Có con vật thức dậy vào ban đêm.
> Từ cụ thể tới trừu tượng: bầu trời ban ngày, bầu trời ban đêm (hai cảnh đối nhau), rồi một điều bé ít để ý (con vật thức đêm).
> Ghép với ô Học (`KeyPointPictures.match`): ý 1 → Day (day, sky, bright), ý 2 → Night (night, sky, dark), ý 3 → Night animals (animal, wak, night). Ô Bedtime không ghép.

## Khởi động

> Hai câu: w1 ôn bài trước (mèo sưởi nắng, mốc "hôm trước"); w2 ôn *Chuỗi thức ăn* bài 1 (cú bắt chuột, mốc "rất xa"), làm nền cho ô Night animals.

### w1
id: 8c4d99e2-93c3-47bc-8703-358bb3e2b71e
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: bau-troi-ngay-va-dem/mat-troi-cho-anh-sang-va-hoi-am
prompt.en: Cats lie in the sun to keep warm.
prompt.vi: Mèo nằm phơi nắng cho ấm.
image.brief: Dùng lại hình `tray_cat` ở bài `bau-troi-ngay-va-dem/mat-troi-cho-anh-sang-va-hoi-am`. Từ khoá tìm ảnh (EN): cat sunbathing
image.alt.en: A cat stretched out in bright light
image.alt.vi: Con mèo nằm duỗi trong vệt sáng
answer: true
hint.en: Look at where the cat is lying.
hint.vi: Em nhìn xem con mèo nằm ở đâu nhé.
explanation_correct.en: Yes! Sunshine warms the cat's fur.
explanation_correct.vi: Đúng rồi! Nắng sưởi ấm bộ lông của mèo.
explanation_wrong.en: This is true. Sunshine keeps cats warm.
explanation_wrong.vi: Câu này đúng. Nắng giữ ấm cho mèo.
feedback_false.en: This cat is lying in bright sunshine.
feedback_false.vi: Con mèo này đang nằm giữa nắng.
> Ôn ý chính hai bài 1 bằng món kệ Chơi (nhóm Sưởi ấm).

### w2
id: 18fa363b-ca40-44a7-ada3-8e3ff6e1e3d1
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: chuoi-thuc-an/con-vat-kiem-an-the-nao
prompt.en: Which animal hunts mice?
prompt.vi: Con nào bắt chuột?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of who listens in the dark.
hint.vi: Em nghĩ tới con vật nghe ngóng trong đêm nhé.
explanation_correct.en: Yes! An owl hunts mice at night.
explanation_correct.vi: Đúng rồi! Cú bắt chuột vào ban đêm.
explanation_wrong.en: The answer is the owl. It hunts mice.
explanation_wrong.vi: Đáp án là con cú. Cú bắt chuột.
> Ôn ô Hunt của *Chuỗi thức ăn* bài 1 ("An owl hunts. It listens for mice."). Câu mới, khác các câu về cú đã có ở chủ đề đó. `alt` đáp án ("An owl on a branch") không có chữ của câu hỏi.

#### option w2_owl
correct: true
label.en: owl
label.vi: con cú
image.brief: Dùng lại hình `explore_owl`. Từ khoá tìm ảnh (EN): great horned owl perched
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành

#### option w2_rabbit
correct: false
feedback.en: A rabbit nibbles grass and leaves.
feedback.vi: Con thỏ gặm cỏ và lá cây.
label.en: rabbit
label.vi: con thỏ
image.brief: Dùng lại hình `explore_fur` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): white rabbit sitting grass
image.alt.en: A white rabbit on the grass
image.alt.vi: Con thỏ trắng trên cỏ

## Học

> Bốn ô. Hai ô đầu là **hình vẽ giấy cắt** cùng một ngôi nhà, cùng khung cảnh, ban ngày và ban đêm (SK-061 khuyến nghị designer 2: ảnh chụp khó cùng khung qua nhiều giờ). Hai ô sau là ảnh chụp.
> Chữ cần dạy trước khi hỏi: "the Sun is up" (q2), "we see the Moon and stars" (q5) ở ô Day, ô Night; "owls hunt in the dark", "fireflies glow" (q3, kệ, q6) ở ô Night animals; "we go to sleep" (q4) ở ô Bedtime.

### explore
id: 635163fb-e2f9-4d39-aad8-07e17cae5410
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_day
label.en: Day
label.vi: Ban ngày
color: vang_hoe
sentence.en: By day, the sky is bright and blue.
sentence.vi: Ban ngày, bầu trời sáng và xanh.
image.brief: [hình vẽ] Giấy cắt style E, không nét viền, màu từ design tokens: một ngôi nhà nhỏ mái ngói đỏ, hiên trước có chum nước, bên cạnh cây cau và bụi chuối, sân đất, phía sau là cánh đồng lúa xanh và rặng tre; bầu trời xanh sáng, Mặt Trời là một hình tròn giấy vàng ở góc trên (không mặt người, không tia nhọn chói), hai đám mây trắng; một con gà mái trong sân; cửa sổ không bật đèn. Không người, không chữ, không bóng đổ dưới vật. Cùng bố cục, cùng góc nhìn, cùng cỡ với `explore_night` (chỉ đổi trời, ánh sáng, chi tiết ngày và đêm). Khung vuông ở Học; khung 17:10 thẻ hai lựa chọn câu q1 và câu w1 bài 3; khung 4:3 câu q2; thẻ từ 2:1.
image.alt.en: A house under a blue, sunny sky
image.alt.vi: Ngôi nhà dưới trời xanh đầy nắng
examples.1.en: the Sun is up in the sky
examples.1.vi: Mặt Trời ở trên trời
examples.2.en: we go to school
examples.2.vi: mình đi học
examples.3.en: we play outside
examples.3.vi: mình chơi ngoài trời
> Hình gốc của chủ đề (câu q1, q2; bài 3 w1; từ `day`). Mặt Trời trong hình vẽ là một hình tròn đơn giản, không phải ảnh chói.
> "không bóng đổ dưới vật": bóng không thuộc chủ đề này (Discoverer #12), hình không gợi chuyện bóng.

#### group explore_night
label.en: Night
label.vi: Ban đêm
color: cham
sentence.en: At night, the sky is dark.
sentence.vi: Ban đêm, bầu trời tối.
image.brief: [hình vẽ] Giấy cắt style E, đúng bố cục `explore_day` (cùng ngôi nhà, cây cau, bụi chuối, cánh đồng, rặng tre) nhưng ban đêm: trời xanh than đậm, một vầng trăng lưỡi liềm vàng nhạt, vài ngôi sao là chấm sáng nhỏ hoặc hình sao bốn cánh nhỏ (không sao năm cánh kiểu đèn ông sao, không nối nét); cửa sổ sáng đèn vàng ấm; con gà không còn ở sân; một con cú nhỏ đậu trên cành tre. Không người, không chữ, không bóng đổ. Khung như `explore_day`.
image.alt.en: The same house under a dark sky
image.alt.vi: Ngôi nhà ấy dưới trời tối
examples.1.en: we see the Moon and stars
examples.1.vi: mình thấy trăng và sao
examples.2.en: we turn on the lights
examples.2.vi: nhà nhà bật đèn
examples.3.en: we go to sleep
examples.3.vi: mình đi ngủ
> Hình gốc của chủ đề (câu q1, q5; bài 3 w1; từ `night`). `alt` không có chữ "night" · "ban đêm" vì câu q1 hỏi "Which picture shows night?" và đáp án là hình này.

#### group explore_owl
label.en: Night animals
label.vi: Con vật thức đêm
color: nau_dat
sentence.en: Owls and bats wake up at night.
sentence.vi: Cú và dơi thức dậy vào ban đêm.
image.brief: [ảnh] Một con cú sừng đậu trên cành lúc trời chiều, mở to đôi mắt vàng nhìn thẳng, thấy cả con; nền trời chiều hay lá mờ; không con mồi, không người, không chữ. Ảnh ngang có khoảng trống (khung vuông ở Học và kệ Chơi, khung 4:3 câu q6, thẻ hai lựa chọn 17:10 câu w2, thẻ ba lựa chọn 5:2 câu q3 và bài 6 q5, thẻ từ 2:1; bài 6 w2). Từ khoá tìm ảnh (EN): great horned owl perched; owl big yellow eyes branch
> Lượt 4 (designer lượt 3, 20/11): hình gốc mới của chủ đề, thay ảnh `explore_hunt` của *Chuỗi thức ăn* (mắt cú không to nổi bật). Ảnh đang dùng: "Great horned owl along lower Columbia River" (USFWS, PD). Mọi chỗ cú của bài 2 và bài 6 trỏ về đây. `alt` giữ.
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành
examples.1.en: owls hunt mice in the dark
examples.1.vi: cú bắt chuột trong đêm tối
examples.2.en: bats fly out at dusk
examples.2.vi: dơi bay ra lúc chập tối
examples.3.en: fireflies glow at night
examples.3.vi: đom đóm lập loè ban đêm
> Ba ví dụ là ba món bắt buộc của kệ Chơi.
> [CẦN KIỂM] Cú (phần lớn loài), dơi kiếm ăn ban đêm; đom đóm phát sáng ban đêm (*Những nơi sống nhỏ xíu* đã có thẻ đom đóm).

#### group explore_sleep
label.en: Bedtime
label.vi: Giờ đi ngủ
color: gi_dong
sentence.en: At night, we sleep in bed.
sentence.vi: Ban đêm, mình ngủ trên giường.
image.brief: [ảnh] Một chiếc giường gọn gàng có màn (mùng) buông, gối và chăn, phòng sáng đèn ngủ vàng dịu; không người, không chữ, không hình in trên chăn gối. Ưu tiên phòng ngủ kiểu Việt Nam. Ảnh ngang có khoảng trống (khung vuông ở Học, thẻ ba lựa chọn 5:2 câu q4). Từ khoá tìm ảnh (EN): bed mosquito net; bedroom night lamp bed; canopy mosquito net bed
image.alt.en: A bed with a mosquito net
image.alt.vi: Chiếc giường buông màn
examples.1.en: sleep helps us grow
examples.1.vi: ngủ giúp mình lớn
examples.2.en: we brush our teeth first
examples.2.vi: mình đánh răng trước khi ngủ
examples.3.en: the house is quiet
examples.3.vi: cả nhà yên tĩnh
> `alt` không có chữ "night", "do" · "ban đêm", "làm" của câu q4 ("What do we do at night?").
> [CẦN KIỂM] "Ngủ giúp mình lớn" (ngủ đủ giúp trẻ lớn; mức phổ thông).

### new_words
id: 08cad7cf-09d8-42ea-96a6-6e424d1a8f43
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: day, night

## Chơi

> Bé tìm ba con vật thức ban đêm: cú, dơi, đom đóm. Món bẫy là con vật, con người hoạt động ban ngày: gà trống, bướm, các bạn nhỏ đi bộ ban ngày. Đạt khi đủ ba nhóm và không chọn món bẫy.
> Mỗi nhóm bắt buộc một món; nhãn nhóm là dấu hiệu (mắt to, ngủ treo ngược, phát sáng), không là tên con vật (lượt 2, tester n2). Kệ sáu món, toàn ảnh chụp (SK-059: hai cột).

### tray
id: 055d7fde-d79a-4fd0-9f41-361333b6e0d1
type: build_tray
version: 1
prompt.en: Find who is awake at night
prompt.vi: Tìm con vật thức ban đêm
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick three animals awake at night.
messages.start.vi: Em chọn ba con vật thức ban đêm nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! They all wake up at night.
messages.balanced.vi: Tuyệt! Cả ba đều thức dậy ban đêm.
messages.has_limited.en: That one is busy in the day.
messages.has_limited.vi: Bạn này bận rộn vào ban ngày.
messages.missing.tray_owl.en: You still need a big-eyed night bird.
messages.missing.tray_owl.vi: Em còn thiếu con chim mắt to thức đêm.
messages.missing.tray_bat.en: You still need an upside-down sleeper.
messages.missing.tray_bat.vi: Em còn thiếu con vật ngủ treo ngược trên cành.
messages.missing.tray_firefly.en: You still need a glowing bug.
messages.missing.tray_firefly.vi: Em còn thiếu một con bọ phát sáng.
> Lời `missing` tả con vật bằng điều nhìn thấy, không đọc lại tên nhóm. Lời `has_limited` đúng với cả ba món bẫy (gà trống, bướm, các bạn nhỏ đi bộ); chữ "bạn" dùng chung cho con vật và người, giọng thân với bé.

#### group tray_owl
label.en: Big night eyes
label.vi: Mắt to nhìn đêm
color: nau_dat
role: required
> Lượt 2 (tester n2): ba nhãn nhóm là dấu hiệu nhìn thấy, không là tên con vật, để chip không in sẵn đáp án.

#### group tray_bat
label.en: Sleeps upside down
label.vi: Ngủ treo ngược
color: cham
role: required

#### group tray_firefly
label.en: Glows in the dark
label.vi: Phát sáng trong đêm
color: vang_hoe
role: required

#### group tray_day
label.en: Awake by day
label.vi: Thức ban ngày
color: do_son
role: limit

#### item tray_owl_item
label.en: Owl
label.vi: Con cú
group: tray_owl
image.brief: Dùng lại hình `explore_owl`. Từ khoá tìm ảnh (EN): great horned owl perched
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành
> Key món khác key nhóm (khuôn chung).

#### item tray_bat_item
label.en: Bat
label.vi: Con dơi
group: tray_bat
image.brief: Dùng lại hình `tray_bat` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): fruit bat hanging tree branch
image.alt.en: A bat hanging from a branch
image.alt.vi: Con dơi treo trên cành

#### item tray_firefly_item
label.en: Fireflies
label.vi: Đom đóm
group: tray_firefly
image.brief: [ảnh] Đom đóm phát sáng ban đêm trên bãi cỏ hay ven rừng: nhiều đốm sáng vàng xanh lơ lửng trên nền cỏ cây tối; không người, không đèn điện, không chữ; ảnh phơi sáng vừa phải, đốm sáng tròn hoặc vệt ngắn, không thành vệt dài kín khung. Ảnh ngang có khoảng trống (món Chơi vuông; bài 5 kệ và thẻ ba lựa chọn 5:2 câu q4). Từ khoá tìm ảnh (EN): fireflies glowing night grass; fireflies meadow night; lightning bugs night
image.alt.en: Tiny glowing lights over the grass
image.alt.vi: Những đốm sáng nhỏ trên bãi cỏ
> Hình gốc của chủ đề, key `tray_firefly` theo bảng Hình dùng chung (bài này đặt key món `tray_firefly_item` vì `tray_firefly` là key nhóm; bài 5 trỏ về `tray_firefly_item`). Ảnh thẻ `firefly_card` của *Những nơi sống nhỏ xíu* là đom đóm ban ngày trên lá, không dùng ở đây.
> [CẦN KIỂM] Đom đóm phát sáng ban đêm.

#### item tray_rooster
label.en: Rooster
label.vi: Gà trống
group: tray_day
image.brief: Dùng lại hình `tray_rooster` ở bài `co-the-cua-em/nam-giac-quan-cua-em`. Từ khoá tìm ảnh (EN): rooster crowing farm yard
image.alt.en: A rooster crowing
image.alt.vi: Con gà trống đang gáy

#### item tray_butterfly
label.en: Butterfly
label.vi: Con bướm
group: tray_day
image.brief: Dùng lại hình `q4_butterfly` ở bài `lon-len/con-vat-doi-hinh-dang`. Từ khoá tìm ảnh (EN): Pieris rapae
image.alt.en: A white butterfly on a flower
image.alt.vi: Con bướm trắng trên bông hoa
> [CẦN KIỂM] Bướm (bướm ngày) hoạt động ban ngày; bướm đêm (ngài) bài không nói.

#### item tray_school
label.en: Walking by day
label.vi: Đi bộ ban ngày
group: tray_day
image.brief: [ảnh] Một nhóm trẻ nhỏ đi bộ ban ngày cùng người lớn, chụp từ phía sau, không thấy mặt, trời sáng; không chữ trên áo, không biển hiệu, không logo. Ảnh ngang có khoảng trống (món Chơi vuông, thẻ ba lựa chọn 5:2 câu q4). Từ khoá tìm ảnh (EN): children walking daytime from behind; kids walking with adult back view
image.alt.en: Children walking in the daytime, from behind
image.alt.vi: Các bạn nhỏ đi bộ ban ngày, nhìn từ phía sau
> Lượt 3 (designer 20/11): ảnh trẻ đeo cặp hợp giấy phép đều có chữ trên cặp; ảnh đang dùng là nhóm trẻ đi bộ ban ngày cùng người lớn, không cặp. Nhãn đổi từ "Going to school" · "Bạn nhỏ đi học" sang "Walking by day" · "Đi bộ ban ngày"; `alt` theo đề xuất designer.

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1 hai lựa chọn, q3, q4 ba lựa chọn), `true_false` (q2 Đúng, q5 Sai, q6 Sai).
> Loại hình: q1 hai hình vẽ (không ảnh chụp); q3, q4 toàn ảnh chụp; q2, q5 hình vẽ (một hình, không trộn); q6 ảnh.

### q1
id: 3998ed08-001a-4299-b401-ecd13cd68b07
format: single_choice
version: 1
dok: 1
prompt.en: Which picture shows night?
prompt.vi: Hình nào là ban đêm?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look at the colour of the sky.
hint.vi: Em nhìn màu của bầu trời nhé.
explanation_correct.en: Yes! At night, lights glow in windows.
explanation_correct.vi: Đúng rồi! Ban đêm, cửa sổ sáng đèn.
explanation_wrong.en: The answer is the dark sky. That is night.
explanation_wrong.vi: Đáp án là hình trời tối. Đó là ban đêm.
> DOK 1: nhận ra ban đêm. Hai hình vẽ cùng khung, chỉ khác giờ (luật Explorer số bảy: khác rõ bằng mắt qua màu trời).

#### option q1_day
correct: false
feedback.en: This sky is bright and blue.
feedback.vi: Bầu trời này sáng và xanh.
label.en: day
label.vi: ban ngày
image.brief: Dùng lại hình `explore_day`.
image.alt.en: A house under a blue, sunny sky
image.alt.vi: Ngôi nhà dưới trời xanh đầy nắng

#### option q1_night
correct: true
label.en: night
label.vi: ban đêm
image.brief: Dùng lại hình `explore_night`.
image.alt.en: The same house under a dark sky
image.alt.vi: Ngôi nhà ấy dưới trời tối

### q2
id: 304cbfc8-4271-48cf-8040-192785923d9b
format: true_false
version: 1
dok: 1
prompt.en: In the day, we see the Sun.
prompt.vi: Ban ngày, mình thấy Mặt Trời.
image.brief: Dùng lại hình `explore_day`.
image.alt.en: A house under a blue, sunny sky
image.alt.vi: Ngôi nhà dưới trời xanh đầy nắng
answer: true
hint.en: Look up at the sky in the picture.
hint.vi: Em nhìn lên bầu trời trong hình nhé.
explanation_correct.en: Yes! We play outside in the daylight.
explanation_correct.vi: Đúng rồi! Ban ngày mình ra ngoài chơi.
explanation_wrong.en: This is true. The Sun is up by day.
explanation_wrong.vi: Câu này đúng. Ban ngày có Mặt Trời trên trời.
feedback_false.en: The round Sun shines in this sky.
feedback_false.vi: Mặt Trời tròn đang chiếu sáng trên trời.
> DOK 1: nhớ lại ô Day (ví dụ một). Hình vẽ ban ngày là đúng vật được nói tới.

### q3
id: 3c23ba3b-facd-4caa-ac41-4f92d1bde680
format: single_choice
version: 1
dok: 1
prompt.en: Which animal wakes up at night?
prompt.vi: Con nào thức dậy vào ban đêm?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of big eyes in the dark.
hint.vi: Em nghĩ tới đôi mắt to nhìn được trong đêm nhé.
explanation_correct.en: Yes! An owl sees well at night.
explanation_correct.vi: Đúng rồi! Cú nhìn rõ trong đêm.
explanation_wrong.en: The answer is the owl. It hunts at night.
explanation_wrong.vi: Đáp án là con cú. Cú đi săn ban đêm.
> DOK 1: nhớ lại ô Night animals và kệ Chơi. Ba ảnh khác hẳn nhau (chim lông nâu mắt to, gà trống mào đỏ, bướm trắng), đều đã gặp ở kệ Chơi.
> [CẦN KIỂM] Cú nhìn rõ trong đêm (mắt to, nhạy sáng).

#### option q3_rooster
correct: false
feedback.en: A rooster crows to start the day.
feedback.vi: Gà trống gáy báo trời sáng.
label.en: rooster
label.vi: gà trống
image.brief: Dùng lại hình `tray_rooster` ở bài `co-the-cua-em/nam-giac-quan-cua-em`. Từ khoá tìm ảnh (EN): rooster crowing farm yard
image.alt.en: A rooster crowing
image.alt.vi: Con gà trống đang gáy

#### option q3_owl
correct: true
label.en: owl
label.vi: con cú
image.brief: Dùng lại hình `explore_owl`. Từ khoá tìm ảnh (EN): great horned owl perched
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành

#### option q3_butterfly
correct: false
feedback.en: Butterflies visit flowers in the sunshine.
feedback.vi: Bướm đi tìm hoa lúc trời nắng.
label.en: butterfly
label.vi: con bướm
image.brief: Dùng lại hình `q4_butterfly` ở bài `lon-len/con-vat-doi-hinh-dang`. Từ khoá tìm ảnh (EN): Pieris rapae
image.alt.en: A white butterfly on a flower
image.alt.vi: Con bướm trắng trên bông hoa

### q4
id: 05b7d18d-f2ff-4be7-bfe0-d112f4a62842
format: single_choice
version: 1
dok: 2
prompt.en: What do we do at night?
prompt.vi: Ban đêm, mình làm gì?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of the end of your day.
hint.vi: Em nghĩ tới lúc cuối ngày nhé.
explanation_correct.en: Yes! Sleep helps your body rest.
explanation_correct.vi: Đúng rồi! Giấc ngủ giúp cơ thể nghỉ ngơi.
explanation_wrong.en: The answer is bed. We sleep at night.
explanation_wrong.vi: Đáp án là chiếc giường. Ban đêm mình ngủ.
> DOK 2: xếp ba việc theo giờ (ban ngày hay ban đêm). Ba ảnh chụp: giường (ô Bedtime), các bạn nhỏ đi bộ ban ngày (kệ), thóc phơi (kệ bài 1), đều là ảnh bé đã gặp.

#### option q4_school
correct: false
feedback.en: We walk outside in the daytime.
feedback.vi: Ban ngày mình đi bộ ngoài trời.
label.en: walking outside
label.vi: đi bộ ngoài trời
image.brief: Dùng lại hình `tray_school`. Từ khoá tìm ảnh (EN): children walking daytime from behind
image.alt.en: Children walking in the daytime, from behind
image.alt.vi: Các bạn nhỏ đi bộ ban ngày, nhìn từ phía sau

#### option q4_rice
correct: false
feedback.en: We dry rice in the sunshine.
feedback.vi: Mình phơi thóc khi trời nắng.
label.en: drying rice
label.vi: phơi thóc
image.brief: Dùng lại hình `tray_rice` ở bài `bau-troi-ngay-va-dem/mat-troi-cho-anh-sang-va-hoi-am`. Từ khoá tìm ảnh (EN): rice drying yard Vietnam
image.alt.en: Golden grain spread on a yard
image.alt.vi: Thóc vàng trải trên sân

#### option q4_bed
correct: true
label.en: sleeping in bed
label.vi: ngủ trên giường
image.brief: Dùng lại hình `explore_sleep`. Từ khoá tìm ảnh (EN): bed mosquito net
image.alt.en: A bed with a mosquito net
image.alt.vi: Chiếc giường buông màn

### q5
id: 9771d1f4-91d7-41b6-b708-76e2e0ef7a1e
format: true_false
version: 1
dok: 2
prompt.en: We can see the Sun at night.
prompt.vi: Ban đêm, mình thấy được Mặt Trời.
image.brief: Dùng lại hình `explore_night`.
image.alt.en: The same house under a dark sky
image.alt.vi: Ngôi nhà ấy dưới trời tối
answer: false
hint.en: Look for what shines in this sky.
hint.vi: Em nhìn xem trên trời này có gì sáng nhé.
explanation_correct.en: At night, we see the Moon and stars.
explanation_correct.vi: Ban đêm, mình thấy trăng và sao.
explanation_wrong.en: This is false. The night sky is dark.
explanation_wrong.vi: Câu này sai. Bầu trời đêm tối.
feedback_true.en: This sky has the Moon and stars.
feedback_true.vi: Bầu trời này có trăng và sao.
> DOK 2: so hai cảnh ngày và đêm, áp vào một câu mới. Câu khẳng định, đáp án Sai; `explanation_correct` đứng một mình.

### q6
id: ff5efb8d-68ea-4d99-8bfc-f509d4d96d2b
format: true_false
version: 1
dok: 2
misconception: everyone_sleeps_at_night
prompt.en: All animals sleep at night.
prompt.vi: Con vật nào cũng ngủ vào ban đêm.
image.brief: Dùng lại hình `explore_owl`. Từ khoá tìm ảnh (EN): great horned owl perched
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành
answer: false
hint.en: Think of bats flying at dusk.
hint.vi: Em nghĩ tới đàn dơi bay lúc chập tối nhé.
explanation_correct.en: Some animals sleep by day, wake at night.
explanation_correct.vi: Có con vật ngủ ban ngày, thức ban đêm.
explanation_wrong.en: This is false. Owls hunt at night.
explanation_wrong.vi: Câu này sai. Cú đi săn ban đêm.
feedback_true.en: This owl is awake, ready to hunt.
feedback_true.vi: Con cú này đang thức, sẵn sàng đi săn.
> Câu misconception (`everyone_sleeps_at_night`), bằng hình, DOK 2: bé lấy giờ ngủ của mình áp cho mọi con vật sẽ chạm gật đầu. Câu chỉ kiểm một việc. Hình con cú mắt mở (đúng vật được nói tới). `explanation_correct` là đúng câu `correction` ở `_topic.md`.
> [CẦN KIỂM] Quan niệm `everyone_sleeps_at_night` (mục Misconceptions ở `_topic.md`).

## Từ vựng

### day
id: 179e369a-9be7-4a4d-825f-df701bd5f63b
tier: core
term.en: day
term.vi: ban ngày
example.en: We play outside in the day.
example.vi: Ban ngày mình chơi ngoài trời.
image.brief: Dùng lại hình `explore_day`.
image.alt.en: A house under a blue, sunny sky
image.alt.vi: Ngôi nhà dưới trời xanh đầy nắng

### night
id: 5c7dfc08-e4dd-4bfc-af23-e864a6a141ac
tier: core
term.en: night
term.vi: ban đêm
example.en: At night, I sleep in my bed.
example.vi: Ban đêm, em ngủ trên giường.
image.brief: Dùng lại hình `explore_night`.
image.alt.en: The same house under a dark sky
image.alt.vi: Ngôi nhà ấy dưới trời tối

### owl
id: 5efcfa6e-89e7-4d13-b16d-4703a5507b28
tier: extra
term.en: owl
term.vi: con cú
example.en: An owl hoots in the night.
example.vi: Con cú kêu trong đêm.
image.brief: Dùng lại hình `explore_owl`. Từ khoá tìm ảnh (EN): great horned owl perched
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành
> "owl" chưa là từ vựng Explorer nào (chỉ có thẻ `owl_card` ở *Chuỗi thức ăn*).

### awake
id: d5a5f483-475b-4809-92eb-121b9728f593
tier: extra
term.en: awake
term.vi: thức
example.en: Bats are awake when we sleep.
example.vi: Khi mình ngủ, dơi vẫn thức.
image.brief: Dùng lại hình `tray_bat` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): fruit bat hanging tree branch
image.alt.en: A bat hanging upside down
image.alt.vi: Con dơi treo ngược
> Lượt 4 (designer lượt 3, B3): khung 2:1 của thẻ từ không còn thấy cành, `alt` đổi theo khung.

## Thưởng

### night_sky_card
id: 6c9ba1f7-41f1-4b4c-8e7d-c54d8eb023bf
set: sky
rarity: common
name.en: Night sky
name.vi: Bầu trời đêm
tag.en: Quiet and full of lights
tag.vi: Yên tĩnh và lấp lánh
fact.en: Night is when owls and bats get busy.
fact.vi: Đêm là lúc cú và dơi bận rộn.
image.brief: [ảnh] Bầu trời đêm trên một làng quê: vầng trăng (khuyết hay gần tròn) và vài ngôi sao sáng, phía dưới là rặng tre và mái nhà in đen trên nền trời xanh thẫm, có thể một hai cửa sổ sáng đèn nhỏ; không dải Ngân Hà, không chòm sao nối nét, không người, không chữ; ảnh không quá nhiều sao (khác thẻ `starry_sky_card` bài 5). Khung vuông. Từ khoá tìm ảnh (EN): moon over village night; night sky moon bamboo silhouette; village night moon stars
image.alt.en: A quiet town under the Moon
image.alt.vi: Thị trấn yên tĩnh dưới trăng
> Lượt 3 (designer 20/11): không có ảnh làng có rặng tre hợp lệ; ảnh đang dùng là trăng trên một thị trấn (Mỹ). `alt` đổi theo ảnh thật; chữ thẻ (`tag`, `fact`) không nhắc làng nên giữ.
> Hình gốc của chủ đề (bài 6 ô Night sky). Thẻ khác hẳn thẻ `starry_sky_card` (`_topic.md` Còn mở số bốn).
> [CẦN KIỂM] Cú, dơi hoạt động ban đêm.

## Ghi chú cho hoạ sĩ

- **Loại hình:** hai hình vẽ giấy cắt `explore_day`, `explore_night` (mục `own`, `method: "drawn"`, credit "Science Kids"), cùng bố cục, cùng góc nhìn, cùng cỡ, chỉ đổi giờ. Mọi chỗ khác là ảnh chụp.
- **Một câu, một kệ, một loại hình:** câu q1 hai hình vẽ; câu q2, q5 một hình vẽ; câu w2, q3, q4, q6 và kệ Chơi toàn ảnh chụp.
- **Hình vẽ ban đêm:** sao là chấm sáng hay sao bốn cánh nhỏ, không sao năm cánh (dễ lẫn đèn ông sao), không nối nét chòm sao. Không bóng đổ dưới vật trong cả hai hình.
- **Ảnh mới (bốn):** `explore_sleep` (giường buông màn), `tray_firefly_item` (đom đóm phát sáng, hình gốc của chủ đề), `tray_school` (các bạn nhỏ đi bộ ban ngày, chụp từ phía sau; lượt 3), `night_sky_card` (trăng trên thị trấn yên tĩnh, hình gốc của chủ đề; lượt 3).
- **Ảnh cú (lượt 4):** `explore_owl` là ảnh mới, hình gốc của chủ đề (cú sừng mắt vàng mở to, trời chiều); không còn dùng `explore_hunt`.
- **Dùng lại:** `goi-ten-va-nhom-dong-vat/dong-vat-co-vu` `tray_bat`, `explore_fur`; `co-the-cua-em/nam-giac-quan-cua-em` `tray_rooster`; `lon-len/con-vat-doi-hinh-dang` `q4_butterfly`; bài 1 `tray_cat`, `tray_rice`; hàng rào tre.
- **Trẻ trong ảnh:** `tray_school` chụp từ phía sau, ban ngày. Không trẻ ở ngoài ban đêm.
- **Màu:** Học: Day `vang_hoe`, Night `cham`, Night animals `nau_dat`, Bedtime `gi_dong`. Chơi: Mắt to nhìn đêm `nau_dat`, Ngủ treo ngược `cham`, Phát sáng trong đêm `vang_hoe`, Thức ban ngày `do_son`.
- **Ảnh món Chơi phải thấy đúng dấu hiệu của nhóm:** cú mắt mở to (`explore_owl`), dơi treo ngược (`tray_bat` đã có), đom đóm đang phát sáng (`tray_firefly_item`).

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (day, night). Chơi `build_tray` ba chỗ, ba nhóm `required` (mỗi nhóm một món), một nhóm `limit` (ba món), sáu món. Khởi động `true_false` (w1 Đúng), `single_choice` (w2, hai lựa chọn). Quiz `single_choice` (q1 hai lựa chọn; q3, q4 ba lựa chọn), `true_false` (q2 Đúng, q5 Sai, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`everyone_sleeps_at_night`).
- **Key món khác key nhóm:** `tray_owl_item`, `tray_bat_item`, `tray_firefly_item` (nhóm là `tray_owl`, `tray_bat`, `tray_firefly`).
- **Màn Chơi, ví dụ để kiểm:** Con cú, Con dơi, Đom đóm → `balanced`; Con cú, Con dơi, Con bướm → `has_limited`; Con cú, Đom đóm → `missing.tray_bat`; Gà trống, Con dơi, Đom đóm → `has_limited`.
- **Khởi động trỏ:** w1 → bài 1 của chủ đề này; w2 → `chuoi-thuc-an/con-vat-kiem-an-the-nao` (đã có id).
- **Hình vẽ:** hai mục `own` trong `content/images/explorer/bau-troi-ngay-va-dem/ngay-va-dem.json`.
- **Từ EN có thể ngoài Starters/Movers:** awake, dusk, fireflies, glow, hoots, mosquito net, furry, flyer, daylight. Nghe thử giọng VI đọc "lập loè", "chập tối", "nghe ngóng".
