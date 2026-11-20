---
id: 7edcc4cd-32d1-4880-a1ec-2a05e438fcac
topic: bau-troi-ngay-va-dem
slug: mat-trang-doi-hinh
order: 4
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: The Moon changes shape
vi: Mặt Trăng đổi hình
> Giữ đúng tên bài 4 ở `content/syllabus.json` và bảng Phần B của SK-061. `id` để trống.

## Mục tiêu
en: I can spot full and thin Moons.
vi: Em nhận ra trăng tròn và trăng lưỡi liềm.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 19/11/2026. Ticket SK-061. Mọi dòng `id:` để trống.
> Ý của SK-061: trăng có hôm tròn (Trung thu), có hôm khuyết (lưỡi liềm); có hôm thấy trăng cả ban ngày. Chỉ ở mức thấy: không tên các pha, không "pha", không lịch âm, không ngày rằm, không vì sao trăng đổi hình (Discoverer #7 bài 4). Không chú Cuội, thỏ ngọc.

## Ý chính
1.en: Some nights, the Moon is round.
1.vi: Có đêm, trăng tròn vành vạnh.
2.en: Some nights, the Moon is thin.
2.vi: Có đêm, trăng mảnh như lưỡi liềm.
3.en: We can see the Moon by day, too.
3.vi: Có hôm, ban ngày mình cũng thấy trăng.
> Từ cụ thể tới trừu tượng: hai hình dạng bé thấy (tròn, mảnh), rồi một điều bé ít để ý (trăng ban ngày).
> Ghép với ô Học (`KeyPointPictures.match`): ý 1 → Full Moon (moon, round), ý 2 → Thin Moon (thin, moon), ý 3 → Moon by day (see, moon, day). Ô Mid-Autumn không ghép (hoà hai điểm với ý 1, thua ô cùng thứ tự).
> [CẦN KIỂM] Có hôm thấy trăng trên trời xanh ban ngày.

## Khởi động

> Hai câu: w1 ôn bài trước (Mặt Trời lặn, mốc "hôm trước"); w2 ôn bài 1 (cây cần nắng, cách hai bài).

### w1
id: da1c0d2c-03d0-494c-9d57-a4b799dc5d0c
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: bau-troi-ngay-va-dem/mat-troi-moc-mat-troi-lan
prompt.en: The Sun sets in the evening.
prompt.vi: Chiều tối, Mặt Trời lặn.
image.brief: Dùng lại hình `explore_sunset` ở bài `bau-troi-ngay-va-dem/mat-troi-moc-mat-troi-lan`. Từ khoá tìm ảnh (EN): sunset river boat
image.alt.en: An orange sky over a quiet river
image.alt.vi: Trời cam trên dòng sông lặng
answer: true
hint.en: Think of birds flying home.
hint.vi: Em nghĩ tới lúc chim bay về tổ nhé.
explanation_correct.en: Yes! Soon, the Moon and stars appear.
explanation_correct.vi: Đúng rồi! Lát sau, trăng và sao hiện ra.
explanation_wrong.en: This is true. Evenings end with sunset.
explanation_wrong.vi: Câu này đúng. Chiều tối là lúc Mặt Trời lặn.
feedback_false.en: This Sun sinks low over the river.
feedback_false.vi: Mặt Trời này đã xuống thấp trên sông.
> Ôn ý chính ba bài 3; lời khen nối sang trăng của bài này.

### w2
id: c69ed594-1556-4982-844f-4bf67812e20d
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: bau-troi-ngay-va-dem/mat-troi-cho-anh-sang-va-hoi-am
prompt.en: Plants grow best in the dark.
prompt.vi: Cây lớn tốt nhất ở chỗ tối.
image.brief: Dùng lại hình `explore_plants` ở bài `bau-troi-ngay-va-dem/mat-troi-cho-anh-sang-va-hoi-am`. Từ khoá tìm ảnh (EN): vegetable garden sunshine Vietnam
image.alt.en: Rows of green vegetables
image.alt.vi: Luống rau xanh mướt
answer: false
hint.en: Look at where these vegetables grow.
hint.vi: Em nhìn xem luống rau này mọc ở đâu nhé.
explanation_correct.en: Plants grow well in the sunshine.
explanation_correct.vi: Cây lớn tốt khi có nắng.
explanation_wrong.en: This is false. Plants need sunshine.
explanation_wrong.vi: Câu này sai. Cây cần nắng.
feedback_true.en: These vegetables grow tall in the sunshine.
feedback_true.vi: Những luống rau này lớn nhanh dưới nắng.
> Ôn ô Plants need sun bài 1 (cách hai bài). Lượt 2 (tester n1): đổi sang câu khẳng định đáp án Sai để Khởi động bớt lệch về Đúng; `explanation_correct` là câu chính ô Plants need sun, đứng một mình.

## Học

> Bốn ô: ba ảnh chụp trăng thật trên nền trời (SK-061 khuyến nghị designer 4) và ô Mid-Autumn là hình vẽ giấy cắt (designer vẽ 20/11). Hai ô đầu là hai hình dạng; ô ba là trăng ban ngày (sửa `moon_only_at_night`); ô bốn là dịp quen (Trung thu).
> Chữ cần dạy trước khi hỏi: "a full Moon is big and round" (q1) ở ô Full Moon; "like a banana" (q2, kệ) ở ô Thin Moon; "some nights, half a Moon" (q4) ở ô Thin Moon; "the Moon looks big and bright" (q3) ở ô Mid-Autumn; trăng trên trời xanh (q6) ở ô Moon by day.

### explore
id: 5fd3e9b5-1f9b-4b88-9c60-0c60e9cf0dad
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_full
label.en: Full Moon
label.vi: Trăng tròn
color: vang_hoe
sentence.en: A full Moon is big and round.
sentence.vi: Trăng tròn to và tròn vành vạnh.
image.brief: [ảnh] Trăng tròn trắng xám trên nền trời đêm tối, trăng nằm giữa khung, rõ nét, thấy các vệt sẫm trên mặt trăng; không cây, không người, không chữ, không đèn lồng (khác ảnh Trung thu). Ảnh ngang có khoảng trống (khung vuông ở Học và kệ Chơi, thẻ ba lựa chọn 5:2 câu q1, khung 4:3 câu q6 bài 6, thẻ từ 2:1). Từ khoá tìm ảnh (EN): full moon night sky; bright full moon dark sky; full moon close
image.alt.en: A bright white disc in a dark sky
image.alt.vi: Đĩa trắng sáng trên trời tối
examples.1.en: it lights up the night
examples.1.vi: trăng soi sáng cả đêm
examples.2.en: it looks like a white plate
examples.2.vi: trăng trông như cái đĩa trắng
examples.3.en: we see dark patches on it
examples.3.vi: trên trăng có những vệt sẫm
> Hình gốc của chủ đề (kệ Chơi, câu q1, q4, từ `moon`, `full_moon`; bài 5 kệ; bài 6 câu q1, q6). `alt` không có chữ "full", "Moon", "round" vì câu q1 hỏi "Which one is a full Moon?".
> Ví dụ ba chỉ tả điều thấy; không nói vệt sẫm là gì, không chú Cuội (SK-061 khuyến nghị 2).
> [CẦN KIỂM] Thấy được những vệt sẫm trên trăng tròn bằng mắt thường.

#### group explore_crescent
label.en: Thin Moon
label.vi: Trăng lưỡi liềm
color: cham
sentence.en: A thin Moon looks curved, like a smile.
sentence.vi: Trăng lưỡi liềm cong cong như nụ cười.
image.brief: [ảnh] Trăng lưỡi liềm mảnh sáng trên nền trời chạng vạng xanh thẫm hay tím, phía dưới có ngọn cây hay mái nhà in đen; trăng rõ nét, nằm gần giữa khung; không người, không chữ, không sao băng. Ảnh ngang có khoảng trống (khung vuông ở Học và kệ Chơi, thẻ ba lựa chọn 5:2 câu q1, q5, khung 4:3 câu q2, thẻ `order_sequence` vuông, thẻ hai lựa chọn 17:10 câu w1 bài 5, thẻ từ 2:1). Từ khoá tìm ảnh (EN): crescent moon twilight; thin crescent moon dusk sky; crescent moon silhouette trees
image.alt.en: A bright curve of light
image.alt.vi: Vệt sáng cong cong trên trời
examples.1.en: it looks like a banana
examples.1.vi: trông như quả chuối
examples.2.en: some nights, we see half a Moon
examples.2.vi: có đêm thấy nửa vầng trăng
examples.3.en: night by night, its shape changes
examples.3.vi: trăng đổi hình qua từng đêm
> Hình gốc của chủ đề. `alt` không có chữ "thin", "Moon", "night", "sky" · "mảnh", "trăng" vì câu q5 bài này và w1 bài 5 có đáp án là ảnh này.
> Câu chính dùng phép so sánh đơn giản ("like a smile"), nhãn VI dùng "lưỡi liềm" (cái liềm gặt lúa, quen với trẻ nông thôn); ví dụ một thêm "quả chuối" cho trẻ thành phố.
> [CẦN KIỂM] Trăng đổi hình qua từng đêm (mức thấy; không nói chiều lớn dần hay nhỏ dần).

#### group explore_day_moon
label.en: Moon by day
label.vi: Trăng ban ngày
color: gi_dong
sentence.en: Sometimes we see the Moon by day.
sentence.vi: Có hôm, ban ngày mình thấy trăng.
image.brief: [ảnh] Trăng (nửa vầng hoặc gần tròn) màu trắng nhạt trên nền trời xanh ban ngày, có mây trắng nhẹ hoặc ngọn cây, mái nhà ở mép dưới; thấy rõ là ban ngày (trời xanh sáng); không Mặt Trời trong khung, không người, không chữ. Ảnh ngang có khoảng trống (khung vuông ở Học, khung 4:3 câu q6). Từ khoá tìm ảnh (EN): moon in daytime blue sky; daytime moon trees; half moon blue sky day
image.alt.en: A pale white shape in a blue sky
image.alt.vi: Vầng trắng mờ trên trời xanh
examples.1.en: it looks pale and white
examples.1.vi: trăng trông nhạt và trắng
examples.2.en: look up on a clear morning
examples.2.vi: nhìn lên trời một buổi sáng quang
examples.3.en: it is hard to spot
examples.3.vi: phải nhìn kỹ mới thấy
> Hình gốc của bài (câu q6). Ô sửa `moon_only_at_night`. Ví dụ hai chỉ là gợi ý nhìn; không nói giờ chắc chắn thấy trăng.
> [CẦN KIỂM] Trăng ban ngày thường thấy buổi sáng hay buổi chiều, nhiều ngày trong tháng.

#### group explore_mid_autumn
label.en: Mid-Autumn
label.vi: Trung thu
color: do_son
sentence.en: At Mid-Autumn, we watch the round Moon.
sentence.vi: Đêm Trung thu, mình ngắm trăng tròn.
image.brief: [hình vẽ] Giấy cắt style E (designer vẽ 20/11 vì không có ảnh hợp lệ): vài chiếc đèn lồng giấy đỏ, vàng treo trên cành cây hay dây trước hiên, phía sau là trăng tròn trên trời đêm; không người, không mặt người, không chữ trên đèn (không chữ Hán, không chữ Việt), không logo. Ảnh ngang có khoảng trống (khung vuông ở Học, khung 4:3 câu q3). Từ khoá tìm ảnh (EN): lanterns full moon night; mid autumn lanterns moon; paper lanterns moon tree
image.alt.en: Paper lanterns and a glowing night
image.alt.vi: Đèn lồng giấy trong đêm sáng
examples.1.en: children carry star lanterns
examples.1.vi: các bạn rước đèn ông sao
examples.2.en: families share mooncakes
examples.2.vi: cả nhà ăn bánh trung thu
examples.3.en: the Moon looks big and bright
examples.3.vi: trăng to và sáng
> Trung thu chỉ là dịp quen (SK-061 khuyến nghị 8), không lịch âm, không "rằm tháng Tám" (luật đã chốt ở *Thời tiết và các mùa*).
> [CẦN KIỂM] Trăng đêm Trung thu tròn (Trung thu là ngày rằm âm lịch, trăng tròn hay gần tròn).

### new_words
id: fdcfc949-26c8-498e-b598-909c488da500
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: moon, full_moon

## Chơi

> Bé chọn trăng tròn và trăng lưỡi liềm. Món bẫy là đồ ở gần mình có hình giống trăng: đèn lồng tròn (như trăng tròn), quả chuối (cong như trăng lưỡi liềm). Đạt khi đủ hai nhóm và không chọn món bẫy.
> Kệ sáu món, toàn ảnh chụp (SK-059: hai cột).

### tray
id: 1af0094e-f499-4301-a1e9-f49cf3ae15c8
type: build_tray
version: 1
prompt.en: Find round and thin Moons
prompt.vi: Tìm trăng tròn và trăng lưỡi liềm
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick a round Moon and a thin Moon.
messages.start.vi: Em chọn một vầng trăng tròn và một vầng trăng lưỡi liềm nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! The Moon has many shapes.
messages.balanced.vi: Tuyệt! Trăng có nhiều hình dạng.
messages.has_limited.en: That one is near us, not up high.
messages.has_limited.vi: Cái này ở gần mình, không ở tít trên cao.
messages.missing.tray_round.en: You still need a round Moon.
messages.missing.tray_round.vi: Em còn thiếu một vầng trăng tròn.
messages.missing.tray_thin.en: You still need a thin Moon.
messages.missing.tray_thin.vi: Em còn thiếu một vầng trăng lưỡi liềm.
> Lời nhắn `has_limited` đúng với cả hai món bẫy (đèn lồng, quả chuối). Nhãn "Near us" · "Ở gần mình" dùng lại ở bài 5 và ô Học bài 6 (một ý một nhãn).

#### group tray_round
label.en: Round Moon
label.vi: Trăng tròn
color: vang_hoe
role: required

#### group tray_thin
label.en: Thin Moon
label.vi: Trăng lưỡi liềm
color: cham
role: required

#### group tray_near
label.en: Near us
label.vi: Ở gần mình
color: do_son
role: limit

#### item tray_full_moon
label.en: Full Moon
label.vi: Trăng tròn
group: tray_round
image.brief: Dùng lại hình `explore_full`. Từ khoá tìm ảnh (EN): full moon over trees
image.alt.en: A bright white disc in a dark sky
image.alt.vi: Đĩa trắng sáng trên trời tối

#### item tray_moon_roofs
label.en: Moon over roofs
label.vi: Trăng trên mái nhà
group: tray_round
image.brief: [ảnh] Trăng tròn vàng nhạt vừa lên trên những mái nhà, trời chạng vạng xanh thẫm; mái nhà in đen hay có vài cửa sổ sáng đèn; không người, không biển hiệu, không chữ. Khác `explore_full` (màu trăng vàng hơn, có mái nhà). Ảnh vuông hoặc ngang có khoảng trống (món Chơi vuông). Từ khoá tìm ảnh (EN): full moon rising over rooftops; moonrise houses; full moon roofs dusk
image.alt.en: A golden disc rising over rooftops
image.alt.vi: Đĩa vàng nhô lên trên mái nhà

#### item tray_crescent
label.en: Thin Moon
label.vi: Trăng lưỡi liềm
group: tray_thin
image.brief: Dùng lại hình `explore_crescent`. Từ khoá tìm ảnh (EN): crescent moon twilight
image.alt.en: A bright curve of light
image.alt.vi: Vệt sáng cong cong trên trời

#### item tray_crescent_palm
label.en: Moon over the trees
label.vi: Trăng trên rặng cây
group: tray_thin
image.brief: [ảnh] Trăng lưỡi liềm lớn trên trời đêm xanh, phía dưới là rặng thông in đen; thấy rõ hình cong mảnh; không người, không chữ. Khác `explore_crescent` (có rặng cây). Ảnh vuông hoặc ngang có khoảng trống (món Chơi vuông). Từ khoá tìm ảnh (EN): crescent moon forest silhouette; crescent moon pine trees night
image.alt.en: A thin curve of light above dark trees
image.alt.vi: Vệt sáng cong mảnh trên rặng cây tối
> Lượt 4 (designer lượt 3): không có ảnh lá cọ với trăng đủ to; ảnh mới là rặng thông. Nhãn bé nghe đổi từ "Moon by the palms" · "Trăng bên hàng dừa" sang "Moon over the trees" · "Trăng trên rặng cây".

#### item tray_lantern
label.en: Round lantern
label.vi: Đèn lồng tròn
group: tray_near
image.brief: [ảnh] Một chiếc đèn lồng giấy tròn màu trắng ngà hay vàng nhạt đang sáng, treo trên hiên nhà hay cành cây, nền tối; đèn tròn, cỡ gần bằng ảnh trăng tròn trên kệ (để làm bẫy); không chữ, không hoa văn chữ, không logo, không người. Ảnh vuông hoặc ngang (món Chơi vuông, thẻ ba lựa chọn 5:2 câu q1, q5, thẻ từ 2:1). Từ khoá tìm ảnh (EN): round paper lantern glowing night; white paper lantern hanging
image.alt.en: A round paper lantern
image.alt.vi: Chiếc đèn lồng giấy tròn
> Hình gốc của chủ đề (câu q1, q5, từ `lantern`).

#### item tray_banana
label.en: Banana
label.vi: Quả chuối
group: tray_near
image.brief: [ảnh] Một quả chuối chín vàng nằm cong trên nền tối hay mặt bàn gỗ sẫm, chụp từ trên xuống, thấy rõ hình cong; không nhãn dán, không chữ, không tay. Ảnh vuông hoặc ngang (món Chơi vuông, thẻ ba lựa chọn 5:2 câu q5). Từ khoá tìm ảnh (EN): single banana dark background; one ripe banana dark table
image.alt.en: A curved yellow fruit
image.alt.vi: Quả màu vàng cong cong

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2 Đúng, q3 Đúng, q6 Sai), `order_sequence` (q4).
> Loại hình: ảnh chụp, trừ câu q3 (một hình vẽ `explore_mid_autumn`, không trộn) và câu q4 (ba hình vẽ mới, lượt 4). q1, q5 ba ảnh đã gặp.

### q1
id: bc19b792-7072-4450-ac63-ea92a1cb8d6a
format: single_choice
version: 1
dok: 1
prompt.en: Which one is a full Moon?
prompt.vi: Đâu là trăng tròn?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for a round light high above.
hint.vi: Em tìm vầng sáng tròn ở tít trên cao nhé.
explanation_correct.en: Yes! A full Moon lights up the night.
explanation_correct.vi: Đúng rồi! Trăng tròn soi sáng cả đêm.
explanation_wrong.en: The answer is the round Moon up high.
explanation_wrong.vi: Đáp án là vầng trăng tròn trên trời.
> DOK 1: nhận ra trăng tròn (ô Full Moon). Đèn lồng tròn là lựa chọn sai gần (cũng tròn, cũng sáng), nhưng ở gần, treo trên hiên.

#### option q1_crescent
correct: false
feedback.en: This Moon is thin and curved.
feedback.vi: Vầng trăng này mảnh và cong.
label.en: thin Moon
label.vi: trăng lưỡi liềm
image.brief: Dùng lại hình `explore_crescent`. Từ khoá tìm ảnh (EN): crescent moon twilight
image.alt.en: A bright curve of light
image.alt.vi: Vệt sáng cong cong trên trời

#### option q1_lantern
correct: false
feedback.en: A lantern is made by people.
feedback.vi: Đèn lồng do người làm ra.
label.en: round lantern
label.vi: đèn lồng tròn
image.brief: Dùng lại hình `tray_lantern`. Từ khoá tìm ảnh (EN): round paper lantern glowing night
image.alt.en: A round paper lantern
image.alt.vi: Chiếc đèn lồng giấy tròn

#### option q1_full
correct: true
label.en: full Moon
label.vi: trăng tròn
image.brief: Dùng lại hình `explore_full`. Từ khoá tìm ảnh (EN): full moon over trees
image.alt.en: A bright white disc in a dark sky
image.alt.vi: Đĩa trắng sáng trên trời tối

### q2
id: 1da4db16-3725-4eb2-ab74-c34a892a4438
format: true_false
version: 1
dok: 1
prompt.en: A thin Moon looks curved, like a banana.
prompt.vi: Trăng lưỡi liềm cong cong như quả chuối.
image.brief: Dùng lại hình `explore_crescent`. Từ khoá tìm ảnh (EN): crescent moon twilight
image.alt.en: A bright curve of light
image.alt.vi: Vệt sáng cong cong trên trời
answer: true
hint.en: Look at the shape of this Moon.
hint.vi: Em nhìn hình dạng vầng trăng này nhé.
explanation_correct.en: Yes! People call it a crescent Moon.
explanation_correct.vi: Đúng rồi! Người ta gọi là trăng lưỡi liềm.
explanation_wrong.en: This is true. This Moon is thin and curved.
explanation_wrong.vi: Câu này đúng. Vầng trăng này mảnh và cong.
feedback_false.en: This Moon curves, like a banana.
feedback_false.vi: Vầng trăng này cong như quả chuối.
> DOK 1: nhớ lại ô Thin Moon (ví dụ một). Lời khen đưa từ `extra` "crescent".

### q3
id: e83254af-1e8e-4cd0-ad17-63f25a0e151d
format: true_false
version: 1
dok: 1
prompt.en: At Mid-Autumn, the Moon looks round.
prompt.vi: Đêm Trung thu, trăng tròn.
image.brief: Dùng lại hình `explore_mid_autumn`. Từ khoá tìm ảnh (EN): lanterns full moon night
image.alt.en: Paper lanterns and a glowing night
image.alt.vi: Đèn lồng giấy trong đêm sáng
answer: true
hint.en: Think of carrying lanterns at Mid-Autumn.
hint.vi: Em nhớ lại đêm rước đèn Trung thu nhé.
explanation_correct.en: Yes! Families watch the bright Moon together.
explanation_correct.vi: Đúng rồi! Cả nhà cùng ngắm trăng sáng.
explanation_wrong.en: This is true. The Mid-Autumn Moon is round.
explanation_wrong.vi: Câu này đúng. Trăng Trung thu tròn.
feedback_false.en: This Moon is big and round.
feedback_false.vi: Vầng trăng này to và tròn.
> DOK 1: nhớ lại ô Mid-Autumn. Hình là đúng cảnh được nói tới.

### q4
id: 15afbf13-5d8d-4493-b277-b1465c8fb8f5
format: order_sequence
version: 1
dok: 2
prompt.en: Start with the thinnest Moon. Put them in order.
prompt.vi: Bắt đầu từ vầng trăng mảnh nhất. Em xếp theo thứ tự nhé.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_thin, q4_half, q4_full
hint.en: The full Moon comes last.
hint.vi: Trăng tròn đứng cuối cùng.
explanation_correct.en: Yes! Thin, then half, then a round Moon.
explanation_correct.vi: Đúng rồi! Mảnh, rồi nửa vầng, rồi tròn.
explanation_wrong.en: The order is thin, half, then full.
explanation_wrong.vi: Thứ tự là trăng lưỡi liềm, nửa vầng, rồi trăng tròn.
> DOK 2: so ba hình dạng, xếp từ mảnh tới tròn (SK-061 khuyến nghị 7: chỉ xếp theo hình, không gọi tên pha, không nói trăng lớn dần qua các đêm). `prompt` nêu đầu mảnh; gợi ý chỉ nhắc đầu kia. Thẻ trong file không theo thứ tự đúng. Từ lượt 4 (designer 20/11) ba thẻ là **hình vẽ** giấy cắt cùng nền xanh than, cùng cỡ, cùng màu trăng, khung vuông (ảnh nửa vầng trăng thật không khớp nền với hai ảnh kia).

#### item q4_full
label.en: full Moon
label.vi: trăng tròn
image.brief: [hình vẽ] Giấy cắt style E, cùng nét, cùng nền xanh than, cùng cỡ, cùng màu trăng với `q4_thin`, `q4_half`: một vầng trăng tròn đầy giữa khung; không mặt người, không chữ. Khung vuông.
image.alt.en: A round paper Moon on navy
image.alt.vi: Vầng trăng giấy tròn trên nền xanh than

#### item q4_thin
label.en: thin Moon
label.vi: trăng lưỡi liềm
image.brief: [hình vẽ] Giấy cắt style E, cùng nền, cùng cỡ, cùng màu trăng với hai thẻ kia: một vầng trăng lưỡi liềm mảnh giữa khung; không chữ. Khung vuông.
image.alt.en: A thin paper curve on navy
image.alt.vi: Vệt giấy cong mảnh trên nền xanh than

#### item q4_half
label.en: half Moon
label.vi: nửa vầng trăng
image.brief: [hình vẽ] Giấy cắt style E, cùng nền, cùng cỡ, cùng màu trăng với hai thẻ kia: nửa vầng trăng (nửa sáng, cạnh thẳng) giữa khung; không chữ. Khung vuông.
image.alt.en: Half a paper disc on navy
image.alt.vi: Nửa đĩa giấy trên nền xanh than

### q5
id: 7907e948-f673-4fa0-8149-be8904d9a08e
format: single_choice
version: 1
dok: 2
prompt.en: Which one is up in the night sky?
prompt.vi: Cái nào ở trên bầu trời đêm?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of what is far above the roofs.
hint.vi: Em nghĩ tới thứ ở tít trên cao, quá mái nhà nhé.
explanation_correct.en: Yes! The Moon is very far away.
explanation_correct.vi: Đúng rồi! Mặt Trăng ở rất xa.
explanation_wrong.en: The answer is the thin Moon, far away.
explanation_wrong.vi: Đáp án là trăng lưỡi liềm, ở rất xa.
> DOK 2: phân biệt trăng với hai vật gần có hình giống (áp ý kệ Chơi vào câu mới). Ba ảnh đã gặp ở Học, kệ. `alt` đáp án ("A bright curve of light") không có chữ "night", "sky", "up".

#### option q5_lantern
correct: false
feedback.en: A lantern hangs low, near people.
feedback.vi: Đèn lồng treo thấp, gần mọi người.
label.en: round lantern
label.vi: đèn lồng tròn
image.brief: Dùng lại hình `tray_lantern`. Từ khoá tìm ảnh (EN): round paper lantern glowing night
image.alt.en: A round paper lantern
image.alt.vi: Chiếc đèn lồng giấy tròn

#### option q5_crescent
correct: true
label.en: thin Moon
label.vi: trăng lưỡi liềm
image.brief: Dùng lại hình `explore_crescent`. Từ khoá tìm ảnh (EN): crescent moon twilight
image.alt.en: A bright curve of light
image.alt.vi: Vệt sáng cong cong trên trời

#### option q5_banana
correct: false
feedback.en: A banana grows on a banana tree.
feedback.vi: Quả chuối mọc trên cây chuối.
label.en: banana
label.vi: quả chuối
image.brief: Dùng lại hình `tray_banana`. Từ khoá tìm ảnh (EN): single banana dark background
image.alt.en: A curved yellow fruit
image.alt.vi: Quả màu vàng cong cong

### q6
id: fcf6ddc5-42ee-4138-93a1-2efac1506c8a
format: true_false
version: 1
dok: 2
misconception: moon_only_at_night
prompt.en: We can only see the Moon at night.
prompt.vi: Chỉ ban đêm mới thấy được trăng.
image.brief: Dùng lại hình `explore_day_moon`. Từ khoá tìm ảnh (EN): moon in daytime blue sky
image.alt.en: A pale white shape in a blue sky
image.alt.vi: Vầng trắng mờ trên trời xanh
answer: false
hint.en: Look at the colour of this sky.
hint.vi: Em nhìn màu của bầu trời này nhé.
explanation_correct.en: Sometimes we see the Moon by day, too.
explanation_correct.vi: Có hôm, ban ngày mình cũng thấy trăng.
explanation_wrong.en: This is false. See this daytime Moon.
explanation_wrong.vi: Câu này sai. Em nhìn trăng ban ngày này nhé.
feedback_true.en: The Moon is in this blue sky.
feedback_true.vi: Trăng đang ở trên bầu trời xanh này.
> Câu misconception (`moon_only_at_night`), bằng hình, DOK 2: bé chỉ quen thấy trăng ban đêm sẽ chạm gật đầu. Câu chỉ kiểm một việc. Hình trăng trên trời xanh là đúng vật được nói tới. "only" là câu khẳng định (không chữ phủ định). `explanation_correct` là đúng câu `correction` ở `_topic.md`.
> [CẦN KIỂM] Quan niệm `moon_only_at_night` (mục Misconceptions ở `_topic.md`).

## Từ vựng

### moon
id: a8f0c8db-652e-4756-9cb0-9bb41c37c6f9
tier: core
term.en: Moon
term.vi: Mặt Trăng
example.en: The Moon shines in the night sky.
example.vi: Trăng sáng trên bầu trời đêm.
image.brief: Dùng lại hình `explore_full`. Từ khoá tìm ảnh (EN): full moon over trees
image.alt.en: A bright white disc in a dark sky
image.alt.vi: Đĩa trắng sáng trên trời tối

### full_moon
id: 8b2f00a4-126e-4dcd-8013-cf4ceb2e876e
tier: core
term.en: full Moon
term.vi: trăng tròn
example.en: We watch the full Moon at Mid-Autumn.
example.vi: Đêm Trung thu, mình ngắm trăng tròn.
image.brief: Dùng lại hình `explore_full`. Từ khoá tìm ảnh (EN): full moon night sky
image.alt.en: A bright white disc in a dark sky
image.alt.vi: Đĩa trắng sáng trên trời tối
> Lượt 4 (designer lượt 3): thẻ từ dùng ảnh trăng tròn `explore_full`, bỏ bản 2:1 hình Trung thu.

### crescent
id: 7e628857-a204-47dc-80cb-04c76a1a8971
tier: extra
term.en: crescent
term.vi: trăng lưỡi liềm
example.en: A crescent Moon looks like a banana.
example.vi: Trăng lưỡi liềm trông như quả chuối.
image.brief: Dùng lại hình `explore_crescent`. Từ khoá tìm ảnh (EN): crescent moon twilight
image.alt.en: A bright curve of light
image.alt.vi: Vệt sáng cong cong trên trời
> Từ khó, `extra` (SK-061 khuyến nghị 5, như "stalactite" ở *Núi, sông và biển*).

### lantern
id: dfdc075f-eccb-4235-9cae-9e61b840dd1a
tier: extra
term.en: lantern
term.vi: đèn lồng
example.en: I carry a lantern at Mid-Autumn.
example.vi: Em rước đèn lồng dịp Trung thu.
image.brief: Dùng lại hình `tray_lantern`. Từ khoá tìm ảnh (EN): round paper lantern glowing night
image.alt.en: A round paper lantern
image.alt.vi: Chiếc đèn lồng giấy tròn
> "shape" đã là từ của *Cây quanh em* bài 6 nên không lấy làm từ vựng ở đây.

## Thưởng

### mid_autumn_moon_card
id: 01320c29-0880-4699-82c9-0b5f3e21a2f1
set: sky
rarity: rare
name.en: Mid-Autumn Moon
name.vi: Trăng Trung thu
tag.en: Round and bright
tag.vi: Tròn và sáng
fact.en: Families eat mooncakes under this Moon.
fact.vi: Cả nhà ăn bánh trung thu dưới trăng này.
image.brief: [hình vẽ] Giấy cắt style E (designer vẽ 20/11): trăng tròn lớn, vàng nhạt, sau một chùm đèn lồng giấy nhiều màu treo cao, nền trời đêm; khác ảnh `explore_mid_autumn` (trăng lớn hơn, chiếm phần lớn khung); không người, không mặt người, không chữ trên đèn, không logo. Khung vuông. Từ khoá tìm ảnh (EN): big full moon lanterns; mid autumn festival moon lanterns; harvest moon lanterns
image.alt.en: A big golden Moon behind lanterns
image.alt.vi: Vầng trăng vàng lớn sau những chiếc đèn lồng
> Ticket gợi ý "Trăng rằm": đổi thành "Trăng Trung thu" vì *Thời tiết và các mùa* đã chốt không nói ngày rằm, lịch âm trong chữ bé nghe.
> [CẦN KIỂM] Trăng Trung thu tròn; bánh trung thu (không nói ngày âm lịch).

## Ghi chú cho hoạ sĩ

- **Loại hình:** ảnh chụp trăng thật trên nền trời (SK-061 khuyến nghị designer 4), trừ năm hình vẽ giấy cắt designer vẽ 20/11 vì không có ảnh hợp lệ: `explore_mid_autumn` (ô Học, câu q3 một hình), thẻ `mid_autumn_moon_card`, ba thẻ câu q4 `q4_thin`, `q4_half`, `q4_full` (lượt 4).
- **Không dùng:** nguyệt thực, trăng đỏ máu, ảnh trăng chụp qua kính thiên văn cận cảnh (thấy rõ miệng hố, không còn trời), cờ, người trên trăng, ảnh trăng có mặt người hay chú Cuội vẽ thêm, chữ trên đèn lồng.
- **Một câu, một kệ, một loại hình:** kệ sáu ảnh; mọi câu là ảnh chụp.
- **Món bẫy:** đèn lồng tròn, quả chuối chụp trên nền tối, cỡ gần bằng trăng trên kệ, để là bẫy thật (bé phải nhìn kỹ: treo trên hiên, nằm trên bàn).
- **Ảnh mới (chín):** `explore_full`, `explore_crescent`, `explore_day_moon`, `explore_mid_autumn`, `tray_moon_roofs`, `tray_crescent_palm`, `tray_lantern`, `tray_banana` (`q4_half`, `explore_mid_autumn`, `mid_autumn_moon_card` nay là hình vẽ). `explore_full`, `explore_crescent`, `tray_lantern` là hình gốc của chủ đề: giữ đúng key và `alt`.
- **Dùng lại:** bài 1 `explore_plants`; bài 3 `explore_sunset`; hàng rào tre.
- **Màu:** Học: Full Moon `vang_hoe`, Thin Moon `cham`, Moon by day `gi_dong`, Mid-Autumn `do_son`. Chơi: Trăng tròn `vang_hoe`, Trăng lưỡi liềm `cham`, Ở gần mình `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (moon, full_moon). Chơi `build_tray` ba chỗ, hai nhóm `required`, một nhóm `limit`, sáu món. Khởi động `true_false` (w1 Đúng, w2 Sai). Quiz `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2 Đúng, q3 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`moon_only_at_night`).
- **Màn Chơi, ví dụ để kiểm:** Trăng tròn, Trăng lưỡi liềm → `balanced`; Trăng trên mái nhà, Trăng trên rặng cây → `balanced`; Trăng tròn, Trăng trên mái nhà → `missing.tray_thin`; Đèn lồng tròn, Trăng lưỡi liềm, Trăng tròn → `has_limited`; Quả chuối, Trăng tròn → `has_limited`.
- **Khởi động trỏ:** w1 → bài 3, w2 → bài 1 của chủ đề này.
- **Thẻ thưởng:** `mid_autumn_moon_card`, `rare`.
- **Từ EN có thể ngoài Starters/Movers:** crescent, Mid-Autumn, mooncakes, lantern, pale, patches, curved, palms. Nghe thử giọng EN đọc "Mid-Autumn", "crescent"; giọng VI đọc "vành vạnh", "lưỡi liềm", "bánh trung thu".
