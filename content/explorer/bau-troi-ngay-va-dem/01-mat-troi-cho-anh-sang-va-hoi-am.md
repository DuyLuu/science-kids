---
id: dddece7f-427c-4ea9-b318-8963c692b905
topic: bau-troi-ngay-va-dem
slug: mat-troi-cho-anh-sang-va-hoi-am
order: 1
stage: opener
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: The Sun gives light and warmth
vi: Mặt Trời cho ánh sáng và hơi ấm
> Giữ đúng tên bài 1 ở bảng Phần B của SK-061 (key `new-sky-day-and-night`). `id` để trống; chạy `ids` sau `_topic.md`.

## Mục tiêu
en: I can say what the Sun gives us.
vi: Em kể được Mặt Trời cho mình những gì.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 19/11/2026. Ticket SK-061. Mọi dòng `id:` để trống.
> Bài mở chủ đề: Mặt Trời cho ánh sáng (trời sáng), hơi ấm (sưởi ấm, phơi khô), cây cần nắng; và an toàn mắt là ý chính (SK-061 khuyến nghị 3). Không nói Mặt Trời là một ngôi sao, không nói Mặt Trời "đi" đâu (Discoverer #7).

## Ý chính
1.en: The Sun gives us light by day.
1.vi: Ban ngày, Mặt Trời cho mình ánh sáng.
2.en: Sunshine keeps us warm and dries things.
2.vi: Nắng sưởi ấm mình và phơi khô đồ.
3.en: Never look right at the Sun.
3.vi: Không bao giờ nhìn thẳng vào Mặt Trời.
> Từ cụ thể tới trừu tượng: điều bé thấy (trời sáng), điều bé cảm thấy và thấy nắng làm (ấm, khô), rồi một quy tắc giữ an toàn.
> Ghép với ô Học (`KeyPointPictures.match`): ý 1 → Light (sun, light, day), ý 2 → Warm sunshine (sunshin, warm, dri), ý 3 → Keep eyes safe (never, look, right, sun). Ô Plants need sun không ghép.

## Khởi động

> Hai câu, đều ôn chủ đề khác vì đây là bài đầu: w1 ôn *Thời tiết và các mùa* bài 1 (Mặt Trời sau mây, `sun_gone_when_cloudy`; SK-061 khuyến nghị 4), w2 ôn *Cây quanh em* bài 2 (cây cần ánh sáng). Cả hai là mốc "rất xa".

### w1
id: 64c6dd02-8b96-48bd-b1c7-26fccf76cfd3
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: thoi-tiet-va-cac-mua/thoi-tiet-hom-nay
prompt.en: The Sun is behind the clouds.
prompt.vi: Mặt Trời đang ở sau những đám mây.
image.brief: Dùng lại hình `explore_cloudy` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): sun behind clouds
image.alt.en: Sunbeams through the clouds
image.alt.vi: Tia nắng xuyên qua mây
answer: true
hint.en: Look at the light around the clouds.
hint.vi: Em nhìn ánh sáng quanh đám mây nhé.
explanation_correct.en: Yes! Clouds hide the Sun for a while.
explanation_correct.vi: Đúng rồi! Mây chỉ che Mặt Trời một lúc.
explanation_wrong.en: This is true. The Sun is behind them.
explanation_wrong.vi: Câu này đúng. Mặt Trời ở sau đám mây.
feedback_false.en: Sunbeams shine out around the clouds.
feedback_false.vi: Tia nắng lọt ra quanh đám mây.
> Ôn ô Cloudy và câu q6 của #5 bài 1 bằng một câu mới (câu cũ "On cloudy days, the Sun goes away."). Không làm lại key `sun_gone_when_cloudy`.

### w2
id: 3e41ff28-fdd4-441f-ae3d-86ad34f8cae3
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: cay-quanh-em/cay-can-gi-de-lon
prompt.en: A plant by a sunny window grows well.
prompt.vi: Cây đặt bên cửa sổ có nắng lớn tốt.
image.brief: Dùng lại hình `explore_needs` ở bài `cay-quanh-em/cay-can-gi-de-lon`.
image.alt.en: A green plant by a sunny window
image.alt.vi: Chậu cây xanh bên cửa sổ có nắng
answer: true
hint.en: Look at the leaves of this plant.
hint.vi: Em nhìn lá của chậu cây này nhé.
explanation_correct.en: Yes! Plants need light and warmth.
explanation_correct.vi: Đúng rồi! Cây cần ánh sáng và hơi ấm.
explanation_wrong.en: This is true. Light helps plants grow.
explanation_wrong.vi: Câu này đúng. Ánh sáng giúp cây lớn.
feedback_false.en: This plant has green, healthy leaves.
feedback_false.vi: Cây này có lá xanh, khoẻ mạnh.
> Ôn ý chính một của *Cây quanh em* bài 2 ("Plants need water, light and warmth."), nối sang ô Plants need sun của bài này. Câu mới, không chép câu cũ.

## Học

> Bốn ô: ba ảnh chụp và một hình vẽ giấy cắt (ô Keep eyes safe, designer vẽ 20/11 vì không có ảnh hợp lệ). Ô Keep eyes safe mang ý chính ba (an toàn mắt); hình không có người nhìn lên trời.
> Chữ cần dạy trước khi hỏi: "lights up the day" (q1) ở ô Light; "dries clothes" (q2), "farmers dry rice" (kệ, q4) ở ô Warm sunshine; "plants grow well in the sunshine" (q3, q5) ở ô Plants need sun; "it can hurt your eyes" (q6) ở ô Keep eyes safe.

### explore
id: 5106ec9a-3e87-41af-9f8d-7f2ff409ef80
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_light
label.en: Light
label.vi: Ánh sáng
color: vang_hoe
sentence.en: The Sun lights up the day.
sentence.vi: Mặt Trời làm ban ngày sáng bừng.
image.brief: [ảnh] Buổi sáng, nắng chiếu xiên qua tán cây xanh thành từng vệt sáng rơi xuống một khoảng sân hay con đường làng; đĩa Mặt Trời bị lá che hoặc chỉ là một đốm sáng nhỏ sau lá, ảnh không chói cả khung; không người nhìn lên trời, không người rõ mặt, không chữ. Ảnh ngang có khoảng trống (khung vuông ở Học, thẻ hai lựa chọn 17:10 câu q1, thẻ ba lựa chọn không dùng, khung 4:3 câu q6, thẻ từ 2:1). Từ khoá tìm ảnh (EN): sunlight through trees morning; sun rays through leaves; sunbeams forest path
image.alt.en: Bright rays through green leaves
image.alt.vi: Tia sáng xuyên qua tán lá xanh
examples.1.en: we see well in daylight
examples.1.vi: ban ngày mình nhìn rõ mọi thứ
examples.2.en: sunlight comes in through windows
examples.2.vi: nắng chiếu vào nhà qua cửa sổ
examples.3.en: the sky turns bright and blue
examples.3.vi: bầu trời sáng và xanh
> Hình gốc của bài (câu q1, q6, từ `sun`, `bright`). `alt` không có chữ "Sun", "light", "day" · "Mặt Trời", "ánh sáng", "ban ngày", vì câu q1 hỏi "What lights up the sky by day?" và đáp án là ảnh này.
> Theo Quy ước hình số bốn: Mặt Trời chỉ qua tán cây, không chói toàn khung.

#### group explore_warm
label.en: Warm sunshine
label.vi: Nắng ấm
color: nau_dat
sentence.en: Sunshine warms us and dries clothes.
sentence.vi: Nắng sưởi ấm mình và phơi khô quần áo.
image.brief: [ảnh] Quần áo nhiều màu phơi trên dây ngoài sân, nắng chiếu rõ, trời xanh; thấy cả dây phơi; quần áo trơn, không chữ, không hình in, không nhãn hiệu; không người. Ưu tiên sân nhà Việt Nam (tường vôi, cây cau, chum nước). Ảnh ngang có khoảng trống (khung vuông ở Học và kệ Chơi, khung 4:3 câu q2). Từ khoá tìm ảnh (EN): clothes drying line sunny yard; laundry hanging sunshine; washing line sun
image.alt.en: Clothes hanging on a line
image.alt.vi: Quần áo phơi trên dây
examples.1.en: a cat naps in the warm sun
examples.1.vi: mèo nằm sưởi nắng
examples.2.en: farmers dry rice in the sun
examples.2.vi: bà con phơi thóc ngoài nắng
examples.3.en: sunny mornings feel warm
examples.3.vi: buổi sáng có nắng thấy ấm áp
> Ví dụ một, hai dạy trước hai món của kệ Chơi (mèo sưởi nắng, thóc phơi) và câu q4.
> [CẦN KIỂM] Nắng làm quần áo, thóc mau khô (kinh nghiệm phổ thông; *Thời tiết và các mùa* bài 1 đã dùng ý "wet clothes dry fast").

#### group explore_safe
label.en: Keep eyes safe
label.vi: Giữ an toàn cho mắt
color: do_son
sentence.en: Never look right at the Sun.
sentence.vi: Không bao giờ nhìn thẳng vào Mặt Trời.
image.brief: [hình vẽ] Giấy cắt style E (designer vẽ 20/11 vì không có ảnh hợp lệ): một bạn nhỏ đội nón lá đi trên đường ruộng đầy nắng, chụp từ phía sau hoặc nghiêng xa, đầu hơi cúi nhìn đường; không thấy mặt, không thấy Mặt Trời trong khung; không người nhìn lên trời; không chữ, không logo trên nón hay áo. Ảnh ngang có khoảng trống (khung vuông ở Học, khung 4:3 câu w3 bài 5). Từ khoá tìm ảnh (EN): child sun hat walking from behind; kid wearing hat sunny path; child back view hat sunshine
image.alt.en: A child in a sun hat, from behind
image.alt.vi: Bạn nhỏ đội nón, nhìn từ phía sau
examples.1.en: it can hurt your eyes
examples.1.vi: mắt em có thể bị đau
examples.2.en: even with sunglasses on
examples.2.vi: kể cả khi đeo kính râm
examples.3.en: wear a hat outside
examples.3.vi: ra nắng thì đội nón
> Ý chính ba (an toàn mắt, SK-061 khuyến nghị 3). Câu chính có "Never" (phủ định) được, vì ô Học không phải câu Đúng/Sai. Màu `do_son` cho ô quy tắc an toàn.
> Ví dụ một là chữ cần dạy trước câu q6 ("It hurts your eyes").
> [CẦN KIỂM] "kể cả khi đeo kính râm": kính râm thường không đủ để nhìn thẳng vào Mặt Trời. Không nói gì về ống nhòm, kính lúp (SK-061 khuyến nghị 3).

#### group explore_plants
label.en: Plants need sun
label.vi: Cây cần nắng
color: gi_dong
sentence.en: Plants grow well in the sunshine.
sentence.vi: Cây lớn tốt khi có nắng.
image.brief: [ảnh] Một vườn rau xanh tốt (rau muống, rau cải) trong nắng sáng, chụp ngang tầm thấp thấy rõ từng luống; không người, không biển, không chữ, không nhà kính. Ảnh ngang có khoảng trống (khung vuông ở Học và kệ Chơi, thẻ ba lựa chọn 5:2 câu q3, khung 4:3 câu w2 bài 4). Từ khoá tìm ảnh (EN): vegetable garden sunshine Vietnam; green vegetable rows sunny; water spinach garden
image.alt.en: Rows of green vegetables
image.alt.vi: Luống rau xanh mướt
examples.1.en: rice grows in sunny fields
examples.1.vi: lúa lớn trên ruộng đầy nắng
examples.2.en: vegetables grow in sunny gardens
examples.2.vi: rau lớn trong vườn có nắng
examples.3.en: trees love the sunshine
examples.3.vi: cây cối thích nắng
> `alt` không có chữ "plant", "grow", "sunshine" vì câu q3 hỏi "Which one needs sunshine to grow?" và đáp án là ảnh này.
> Không quang hợp, không "lá cần ánh sáng để làm thức ăn" (Discoverer).

### new_words
id: 346d0332-38cd-4a39-b38d-86b80d383340
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: sun, sunshine

## Chơi

> Bé chọn ba việc nắng giúp: một thứ được phơi khô, một cây xanh, một con vật sưởi nắng. Đạt khi đủ ba nhóm và không chọn món bẫy.
> Món bẫy là đồ chạy bằng điện làm việc giống nắng: đèn bàn cho ánh sáng, máy sấy tóc làm khô. Bẫy dạy: ánh sáng, hơi ấm này đến từ điện, không phải từ Mặt Trời.
> Kệ sáu món, toàn ảnh chụp (SK-059: hai cột trên iPhone).

### tray
id: 77223bda-95fc-465f-9572-dbf61e2ec363
type: build_tray
version: 1
prompt.en: Find what sunshine helps with
prompt.vi: Tìm những việc nắng giúp mình
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick something drying, a plant and an animal.
messages.start.vi: Em chọn một thứ đang phơi, một cây xanh và một con vật sưởi nắng nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Sunshine helps in many ways.
messages.balanced.vi: Tuyệt! Nắng giúp mình nhiều việc lắm.
messages.has_limited.en: That one uses electricity, not sunshine.
messages.has_limited.vi: Cái này chạy bằng điện, không nhờ nắng.
messages.missing.tray_dry.en: You still need something drying.
messages.missing.tray_dry.vi: Em còn thiếu một thứ đang phơi.
messages.missing.tray_grow.en: You still need a growing plant.
messages.missing.tray_grow.vi: Em còn thiếu một cây xanh.
messages.missing.tray_warm.en: You still need something keeping warm.
messages.missing.tray_warm.vi: Em còn thiếu một con vật sưởi nắng.
> Lời nhắn `has_limited` đúng với cả hai món bẫy (đèn bàn, máy sấy tóc).

#### group tray_dry
label.en: Dried by the sun
label.vi: Phơi khô
color: vang_hoe
role: required

#### group tray_grow
label.en: Helps plants
label.vi: Giúp cây lớn
color: gi_dong
role: required

#### group tray_warm
label.en: Keeps warm
label.vi: Sưởi ấm
color: nau_dat
role: required

#### group tray_power
label.en: Uses electricity
label.vi: Chạy bằng điện
color: do_son
role: limit

#### item tray_clothes
label.en: Drying clothes
label.vi: Phơi quần áo
group: tray_dry
image.brief: Dùng lại hình `explore_warm`. Từ khoá tìm ảnh (EN): clothes drying line sunny yard
image.alt.en: Clothes hanging on a line
image.alt.vi: Quần áo phơi trên dây

#### item tray_rice
label.en: Drying rice
label.vi: Phơi thóc
group: tray_dry
image.brief: [ảnh] Thóc vàng trải đều trên sân gạch hay sân xi măng dưới nắng, có vệt cào đều, có thể có cái cào gỗ nằm trên thóc; chụp chếch từ trên; không người rõ mặt, không chữ, không bao tải in chữ. Ưu tiên sân phơi ở Việt Nam. Ảnh ngang có khoảng trống (món Chơi vuông, thẻ ba lựa chọn 5:2 câu q4 bài 2, thẻ từ 2:1). Từ khoá tìm ảnh (EN): rice drying yard Vietnam; drying paddy rice sun; rice grain drying courtyard
image.alt.en: Golden grain spread on a yard
image.alt.vi: Thóc vàng trải trên sân
> Hình gốc của chủ đề (từ `sunshine`; bài 2 câu q4).

#### item tray_veg
label.en: Vegetable garden
label.vi: Vườn rau
group: tray_grow
image.brief: Dùng lại hình `explore_plants`. Từ khoá tìm ảnh (EN): vegetable garden sunshine Vietnam
image.alt.en: Rows of green vegetables
image.alt.vi: Luống rau xanh mướt

#### item tray_cat
label.en: Cat in the sun
label.vi: Mèo sưởi nắng
group: tray_warm
image.brief: [ảnh] Một con mèo nằm duỗi dài, mắt lim dim, trong một vệt nắng trên sàn, bậu cửa hay bậc thềm; thấy cả con và vệt nắng; không người, không chữ. Ảnh ngang có khoảng trống (món Chơi vuông, khung 4:3 câu w1 bài 2, thẻ từ 2:1). Từ khoá tìm ảnh (EN): cat sunbathing; cat lying in sunlight; cat napping sun patch
image.alt.en: A cat stretched out in bright light
image.alt.vi: Con mèo nằm duỗi trong vệt sáng
> Hình gốc của chủ đề (từ `warmth`; bài 2 w1).

#### item tray_lamp
label.en: Desk lamp
label.vi: Đèn bàn
group: tray_power
image.brief: [ảnh] Một chiếc đèn bàn học đang bật, ánh vàng chiếu xuống mặt bàn gỗ, phòng hơi tối; không nhãn hiệu, không chữ, không người. Ảnh ngang có khoảng trống (món Chơi vuông, thẻ hai lựa chọn 17:10 câu q1, thẻ ba lựa chọn 5:2 câu q3). Từ khoá tìm ảnh (EN): desk lamp on table; desk lamp glowing dark room
image.alt.en: A lamp glowing on a desk
image.alt.vi: Chiếc đèn sáng trên bàn học

#### item tray_dryer
label.en: Hair dryer
label.vi: Máy sấy tóc
group: tray_power
image.brief: [ảnh] Một chiếc máy sấy tóc đặt trên mặt bàn trơn hay treo trên móc, thấy cả dây điện; không nhãn hiệu, không chữ, không người. Ảnh ngang có khoảng trống (món Chơi vuông, thẻ ba lựa chọn 5:2 câu q3). Từ khoá tìm ảnh (EN): hair dryer on table; hairdryer white background
image.alt.en: A hair dryer with its cord
image.alt.vi: Máy sấy tóc có dây điện
> Món bẫy giống nhóm "Dries things": làm khô bằng điện, không nhờ nắng.

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1 hai lựa chọn, q3, q4 ba lựa chọn), `true_false` (q2 Đúng, q5 Sai, q6 Sai).
> Hình câu `single_choice` là hàng rào tre trung tính. Câu nào cũng tự đủ nghĩa khi chỉ nghe.
> Loại hình: q1, q2, q3, q6 ảnh chụp (q1, q3 lựa chọn đều đã gặp ở Học hay kệ Chơi); q4 ba **hình vẽ** giấy cắt mới, q5 dùng lại một hình vẽ của q4 (designer vẽ 20/11 vì không có ảnh hợp lệ). Câu q4 không có ảnh chụp nào.

### q1
id: 09c7bae9-1ccf-4b2c-b23c-ce4be8e1a0d8
format: single_choice
version: 1
dok: 1
prompt.en: What lights up the sky by day?
prompt.vi: Ban ngày, cái gì làm bầu trời sáng?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of a sunny morning outside.
hint.vi: Em nghĩ tới buổi sáng có nắng ngoài trời nhé.
explanation_correct.en: Yes! Sunlight reaches every field and street.
explanation_correct.vi: Đúng rồi! Nắng chiếu khắp đồng ruộng, phố phường.
explanation_wrong.en: The answer is the Sun. It lights the day.
explanation_wrong.vi: Đáp án là Mặt Trời. Mặt Trời làm ban ngày sáng.
> DOK 1: nhớ lại ô Light. Hai lựa chọn (đèn bàn là món bẫy kệ Chơi, bé đã gặp).

#### option q1_sun
correct: true
label.en: the Sun
label.vi: Mặt Trời
image.brief: Dùng lại hình `explore_light`. Từ khoá tìm ảnh (EN): sunlight through trees morning
image.alt.en: Bright rays through green leaves
image.alt.vi: Tia sáng xuyên qua tán lá xanh

#### option q1_lamp
correct: false
feedback.en: A desk lamp lights up a small corner.
feedback.vi: Đèn bàn chỉ soi sáng một góc nhỏ.
label.en: desk lamp
label.vi: đèn bàn
image.brief: Dùng lại hình `tray_lamp`. Từ khoá tìm ảnh (EN): desk lamp on table
image.alt.en: A lamp glowing on a desk
image.alt.vi: Chiếc đèn sáng trên bàn học

### q2
id: f7128ccf-d7d2-4a75-a7cf-42b9bc06daec
format: true_false
version: 1
dok: 1
prompt.en: Sunshine dries wet clothes.
prompt.vi: Nắng làm khô quần áo ướt.
image.brief: Dùng lại hình `explore_warm`. Từ khoá tìm ảnh (EN): clothes drying line sunny yard
image.alt.en: Clothes hanging on a line
image.alt.vi: Quần áo phơi trên dây
answer: true
hint.en: Think of washing hung out to dry.
hint.vi: Em nghĩ tới quần áo giặt xong đem phơi nhé.
explanation_correct.en: Yes! Sunshine also keeps us warm.
explanation_correct.vi: Đúng rồi! Nắng còn sưởi ấm cho mình nữa.
explanation_wrong.en: This is true. Clothes dry in the sun.
explanation_wrong.vi: Câu này đúng. Quần áo phơi nắng sẽ khô.
feedback_false.en: These clothes hang out in bright sunshine.
feedback_false.vi: Quần áo này đang phơi giữa nắng.
> DOK 1: nhớ lại câu chính ô Warm sunshine. Hình là đúng vật được nói tới.

### q3
id: 20b9e0f1-7539-43e3-a680-a7d0b1a0d743
format: single_choice
version: 1
dok: 1
prompt.en: Which one needs sunshine to grow?
prompt.vi: Cái nào cần nắng để lớn?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for something green and living.
hint.vi: Em tìm thứ màu xanh và đang sống nhé.
explanation_correct.en: Yes! Vegetables grow tall in sunny gardens.
explanation_correct.vi: Đúng rồi! Rau lớn nhanh trong vườn có nắng.
explanation_wrong.en: The answer is the vegetables. Plants need sunshine.
explanation_wrong.vi: Đáp án là vườn rau. Cây cần nắng.
> DOK 1: nhớ lại ô Plants need sun. Hai lựa chọn sai là hai món bẫy của kệ Chơi (đồ vật, không lớn lên).

#### option q3_lamp
correct: false
feedback.en: A lamp is a thing, not a plant.
feedback.vi: Đèn bàn là đồ vật, không phải cây.
label.en: desk lamp
label.vi: đèn bàn
image.brief: Dùng lại hình `tray_lamp`. Từ khoá tìm ảnh (EN): desk lamp on table
image.alt.en: A lamp glowing on a desk
image.alt.vi: Chiếc đèn sáng trên bàn học

#### option q3_veg
correct: true
label.en: vegetables
label.vi: vườn rau
image.brief: Dùng lại hình `explore_plants`. Từ khoá tìm ảnh (EN): vegetable garden sunshine Vietnam
image.alt.en: Rows of green vegetables
image.alt.vi: Luống rau xanh mướt

#### option q3_dryer
correct: false
feedback.en: A hair dryer blows warm air.
feedback.vi: Máy sấy tóc thổi ra gió ấm.
label.en: hair dryer
label.vi: máy sấy tóc
image.brief: Dùng lại hình `tray_dryer`. Từ khoá tìm ảnh (EN): hair dryer on table
image.alt.en: A hair dryer with its cord
image.alt.vi: Máy sấy tóc có dây điện

### q4
id: b4a5609a-c298-4aba-be9b-60b025a4bd05
format: single_choice
version: 1
dok: 2
prompt.en: Where do wet sandals dry fastest?
prompt.vi: Dép ướt để đâu mau khô nhất?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of where clothes dry fast.
hint.vi: Em nghĩ xem quần áo phơi ở đâu mau khô nhé.
explanation_correct.en: Yes! Sunshine warms and dries the sandals.
explanation_correct.vi: Đúng rồi! Nắng sưởi ấm và làm khô đôi dép.
explanation_wrong.en: The answer is the sunny step. It is warm.
explanation_wrong.vi: Đáp án là bậc thềm có nắng. Chỗ đó ấm.
> DOK 2: áp ý "nắng phơi khô đồ" (ý chính hai) vào một việc mới trong nhà. Ba hình vẽ mới, cùng nét, cùng kiểu một chỗ trống trong nhà, không có dép trong hình (để không lộ đáp án).

#### option q4_cupboard
correct: false
feedback.en: Inside a cupboard, it is dark and cool.
feedback.vi: Trong tủ tối và mát.
label.en: inside a cupboard
label.vi: trong tủ
image.brief: [hình vẽ] Giấy cắt style E, cùng nét với hai hình kia của câu q4 (designer vẽ 20/11 vì không có ảnh hợp lệ): bên trong một cái tủ gỗ mở hé, ngăn tủ tối, có vài cái hộp hay chồng khăn gấp gọn; không nhãn hiệu, không chữ, không người. Ảnh ngang (thẻ ba lựa chọn 5:2, khung 4:3 câu q5). Từ khoá tìm ảnh (EN): inside dark cupboard shelves; open wooden cabinet interior
image.alt.en: Dim shelves inside a wooden cabinet
image.alt.vi: Ngăn tủ gỗ tối mờ
> Hình gốc của bài (câu q5).

#### option q4_step
correct: true
label.en: sunny step
label.vi: bậc thềm có nắng
image.brief: [hình vẽ] Giấy cắt style E, cùng nét với hai hình kia của câu q4: bậc thềm gạch hay xi măng trước cửa nhà, nắng chiếu rực cả bậc, trống trơn; không dép, không người, không chữ. Ưu tiên nhà Việt Nam. Ảnh ngang (thẻ ba lựa chọn 5:2). Từ khoá tìm ảnh (EN): sunny doorstep steps; house front steps sunlight
image.alt.en: Bright steps by a front door
image.alt.vi: Bậc thềm sáng trước cửa nhà
> `alt` không có chữ "wet", "sandals", "dry" · "dép", "ướt", "khô" của câu hỏi.

#### option q4_bathroom
correct: false
feedback.en: This bathroom is dim and damp.
feedback.vi: Phòng tắm này tối và ẩm.
label.en: dim bathroom
label.vi: phòng tắm tối
image.brief: [hình vẽ] Giấy cắt style E, cùng nét với hai hình kia của câu q4: một góc phòng tắm nhỏ ánh sáng mờ, sàn gạch hơi ướt, có xô hay gáo nước; không người, không nhãn hiệu chai lọ, không chữ. Ảnh ngang (thẻ ba lựa chọn 5:2). Từ khoá tìm ảnh (EN): small dim bathroom tiles; bathroom corner bucket
image.alt.en: A small, dim room with tiles
image.alt.vi: Căn phòng nhỏ lát gạch, tối mờ

### q5
id: 2f99e606-5735-4274-8fb7-ee32be4c00c4
format: true_false
version: 1
dok: 2
prompt.en: Plants grow well in a dark cupboard.
prompt.vi: Cây lớn tốt trong cái tủ tối.
image.brief: Dùng lại hình `q4_cupboard`. Từ khoá tìm ảnh (EN): inside dark cupboard shelves
image.alt.en: Dim shelves inside a wooden cabinet
image.alt.vi: Ngăn tủ gỗ tối mờ
answer: false
hint.en: Think of what plants need to grow.
hint.vi: Em nghĩ xem cây cần gì để lớn nhé.
explanation_correct.en: Plants need sunshine to grow well.
explanation_correct.vi: Cây cần nắng để lớn tốt.
explanation_wrong.en: This is false. A cupboard is too dark.
explanation_wrong.vi: Câu này sai. Trong tủ tối quá.
feedback_true.en: This cupboard is dark inside.
feedback_true.vi: Bên trong cái tủ này tối om.
> DOK 2: áp ý "cây cần nắng" vào một chỗ mới (cái tủ tối ở câu q4). Câu khẳng định, đáp án Sai; `explanation_correct` đứng một mình.
> [CẦN KIỂM] Cây để trong tủ tối lớn kém, lá nhạt màu (*Cây quanh em* bài 2 đã dạy "With no light, leaves turn pale").

### q6
id: ec31dc41-42cc-41c5-91db-cc934107f186
format: true_false
version: 1
dok: 2
misconception: safe_to_look_at_sun
prompt.en: It is safe to look at the Sun.
prompt.vi: Nhìn thẳng vào Mặt Trời là an toàn.
image.brief: Dùng lại hình `explore_light`. Từ khoá tìm ảnh (EN): sunlight through trees morning
image.alt.en: Bright rays through green leaves
image.alt.vi: Tia sáng xuyên qua tán lá xanh
answer: false
hint.en: Think of how bright sunshine feels.
hint.vi: Em nhớ cảm giác khi nắng chói vào mắt nhé.
explanation_correct.en: Never look right at the Sun. It hurts your eyes.
explanation_correct.vi: Không bao giờ nhìn thẳng vào Mặt Trời, mắt sẽ bị đau.
explanation_wrong.en: This is false. Bright sunlight hurts your eyes.
explanation_wrong.vi: Câu này sai. Nắng chói làm đau mắt em.
feedback_true.en: Sunlight is too strong for our eyes.
feedback_true.vi: Ánh nắng quá mạnh với mắt mình.
> Câu misconception (`safe_to_look_at_sun`), bằng hình, DOK 2: bé còn nghĩ "nhìn một chút cũng được" sẽ chạm gật đầu. Câu chỉ kiểm một việc. Hình là nắng xuyên tán lá, không có người nhìn lên trời (SK-061 quyết định 8: câu Đúng/Sai này không cần ảnh cảnh nguy hiểm).
> Câu gợi ý của ticket "It is OK to look at the Sun." đổi "OK" thành "safe" (không chữ viết tắt). Câu VI tránh "cũng không sao" (có chữ "không", luật Explorer số năm).
> `explanation_correct` là đúng câu `correction` ở `_topic.md` (hai câu ngắn, mỗi câu tối đa tám từ EN), đứng một mình cho thẻ "Ý sai → Ý đúng".
> [CẦN KIỂM] Quan niệm `safe_to_look_at_sun` và độ nguy hiểm (mục Misconceptions ở `_topic.md`).

## Từ vựng

### sun
id: 52ed1316-d5a3-417d-9770-d34b4c65844a
tier: core
term.en: Sun
term.vi: Mặt Trời
example.en: We see the Sun by day.
example.vi: Ban ngày mình thấy Mặt Trời.
image.brief: Dùng lại hình `explore_light`. Từ khoá tìm ảnh (EN): sunlight through trees morning
image.alt.en: Bright rays through green leaves
image.alt.vi: Tia sáng xuyên qua tán lá xanh

### sunshine
id: 4cc27474-8f52-4c8e-a458-5794150b8c3e
tier: core
term.en: sunshine
term.vi: nắng
example.en: Sunshine dries the rice in the yard.
example.vi: Nắng làm khô thóc phơi ngoài sân.
image.brief: Dùng lại hình `tray_rice`. Từ khoá tìm ảnh (EN): rice drying yard Vietnam
image.alt.en: Golden grain spread on a yard
image.alt.vi: Thóc vàng trải trên sân

### bright
id: f474b814-ce79-47b3-84c5-bc1d35abf2a5
tier: extra
term.en: bright
term.vi: sáng
example.en: The morning sky is bright and clear.
example.vi: Trời buổi sáng sáng sủa và trong xanh.
image.brief: Dùng lại hình `explore_light`. Từ khoá tìm ảnh (EN): sunlight through trees morning
image.alt.en: Bright rays through green leaves
image.alt.vi: Tia sáng xuyên qua tán lá xanh

### warmth
id: ffbbf641-5032-4c4b-9a69-b99c0188821e
tier: extra
term.en: warmth
term.vi: hơi ấm
example.en: My cat loves the Sun's warmth.
example.vi: Con mèo nhà em thích hơi ấm của nắng.
image.brief: Dùng lại hình `tray_cat`. Từ khoá tìm ảnh (EN): cat sunbathing
image.alt.en: A cat stretched out in bright light
image.alt.vi: Con mèo nằm duỗi trong vệt sáng
> "light", "warm" đã là từ của *Cây quanh em* bài 2 (và "warm" ở *Thời tiết và các mùa* bài 6) nên bài này dùng "bright", "warmth".

## Thưởng

### sun_card
id: 21566b2a-9cc7-4fdb-8d6c-0bc66f21cd49
set: sky
rarity: common
name.en: The Sun
name.vi: Mặt Trời
tag.en: Light and warmth for all
tag.vi: Ánh sáng và hơi ấm cho muôn loài
fact.en: The Sun is huge, but very far away.
fact.vi: Mặt Trời rất to, nhưng ở rất xa.
image.brief: [ảnh] Mặt Trời buổi sáng sớm nhìn qua lớp mây mỏng hay màn sương, vầng tròn dịu màu vàng nhạt không chói, phía dưới là rặng tre hay cánh đồng; ảnh không chụp qua kính lọc (không quả cầu cam có vết đốm), không người, không chữ. Khung vuông, vầng Mặt Trời nằm giữa. Từ khoá tìm ảnh (EN): sun through haze morning; hazy sun over field; sun behind thin clouds
image.alt.en: A soft, pale disc in a hazy sky
image.alt.vi: Vầng tròn dịu trên bầu trời mờ sương
> Bộ mới `set: sky` (SK-061 quyết định 9; ios-dev thêm khoá `collectible.set.sky`). Fact mô tả khoảng cách, cùng ý với `stars_are_tiny` bài 5; không nói Mặt Trời là một ngôi sao (Discoverer #7).
> [CẦN KIỂM] Mặt Trời rất to (đường kính khoảng một trăm lần Trái Đất) nhưng ở rất xa; ảnh nhìn qua mây, sương không làm bé nghĩ nhìn thẳng được (nếu người duyệt lo, đổi sang ảnh nắng qua tán cây).

## Ghi chú cho hoạ sĩ

- **Loại hình:** ảnh chụp (CC0, PD, PDM, CC BY có ghi công), trừ bốn hình vẽ giấy cắt designer vẽ 20/11 (`explore_safe`, `q4_cupboard`, `q4_step`, `q4_bathroom`; mục `own`).
- **Mặt Trời:** chỉ qua tán cây (`explore_light`), qua sương mây mỏng (`sun_card`). Không ảnh chói cả khung, không ảnh qua kính lọc, không người nhìn lên trời (SK-061 khuyến nghị designer 3).
- **Một câu, một kệ, một loại hình:** kệ Chơi sáu ảnh; câu q1, q3 ảnh đã gặp; câu q4 ba hình vẽ mới cùng kiểu (một chỗ trống trong nhà, không có dép).
- **Ảnh mới (mười hai):** `explore_light`, `explore_warm`, `explore_safe`, `explore_plants`, `tray_rice`, `tray_cat`, `tray_lamp`, `tray_dryer`, `q4_cupboard`, `q4_step`, `q4_bathroom`, `sun_card`. Các ảnh `explore_light`, `explore_warm`, `explore_safe`, `explore_plants`, `tray_rice`, `tray_cat` là hình gốc của chủ đề (bảng Hình dùng chung ở `_topic.md`): giữ đúng key và `alt`.
- **Dùng lại:** `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha` `w1` (hàng rào tre); `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay` `explore_cloudy` (w1); `cay-quanh-em/cay-can-gi-de-lon` `explore_needs` (w2).
- **Trẻ trong ảnh:** `explore_safe` chụp từ phía sau, không thấy mặt.
- **Không chữ, không logo:** đèn bàn, máy sấy, quần áo, nón.
- **Màu:** Học: Light `vang_hoe`, Warm sunshine `nau_dat`, Keep eyes safe `do_son`, Plants need sun `gi_dong`. Chơi: Phơi khô `vang_hoe`, Giúp cây lớn `gi_dong`, Sưởi ấm `nau_dat`, Chạy bằng điện `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (sun, sunshine). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, sáu món. Khởi động `true_false` (w1 Đúng, w2 Đúng). Quiz `single_choice` (q1 hai lựa chọn; q3, q4 ba lựa chọn), `true_false` (q2 Đúng, q5 Sai, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`safe_to_look_at_sun`). Không có `labels` ở câu `true_false`.
- **Màn Chơi, ví dụ để kiểm:** Phơi quần áo, Vườn rau, Mèo sưởi nắng → `balanced`; Phơi thóc, Vườn rau, Mèo sưởi nắng → `balanced`; Phơi quần áo, Phơi thóc, Vườn rau → `missing.tray_warm`; Đèn bàn, Vườn rau, Mèo sưởi nắng → `has_limited`; Máy sấy tóc, Vườn rau, Mèo sưởi nắng → `has_limited`.
- **Khởi động trỏ sang chủ đề khác:** w1 → `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`, w2 → `cay-quanh-em/cay-can-gi-de-lon` (đã có id).
- **Thẻ thưởng:** `sun_card`, bộ mới `sky` (cần khoá `collectible.set.sky`).
- **Từ EN có thể ngoài Starters/Movers:** sunshine, warmth, sunglasses, daylight, cupboard, sandals, damp, dim, electricity, hair dryer, haze. Nghe thử giọng VI đọc "sáng bừng", "tối om", "sưởi nắng".
