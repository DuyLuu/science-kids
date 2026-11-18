---
id: 447565f9-50da-407e-b52b-7b3a33468761
topic: thoi-tiet-va-cac-mua
slug: mua-thu-va-mua-dong
order: 3
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Autumn and winter
vi: Mùa thu và mùa đông
> Giữ đúng tên ở `content/syllabus.json` (key `new-weather-and-seasons`, bài số ba).

## Mục tiêu
en: I can name signs of autumn and winter.
vi: Em kể được dấu hiệu của mùa thu và mùa đông.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 17/11/2026. Ticket SK-050. Mọi dòng `id:` để trống; chạy `ids` sau `_topic.md`, bài 1 và bài 2 (câu w1 trỏ bài 2).
> Chủ đề mới, không bám Oak (`_topic.md` mục Nguồn). Ý lấy từ `signs-of-autumn`, `signs-of-winter`, `weather-in-autumn`, `weather-in-winter`, `day-length-in-winter`; viết lại bằng dấu hiệu miền Bắc Việt Nam; không chép câu, hình, câu quiz.
> Bài core, chỉ nói miền Bắc ("Hanoi" · "Hà Nội"). Sửa `winter_means_snow` ở ví dụ một ô Học "Winter" và câu q6 (gắn key).

## Ý chính
1.en: Autumn is cool. Some leaves turn yellow.
1.vi: Mùa thu trời mát. Có cây lá chuyển vàng.
2.en: Winter is cold. We wear warm clothes.
2.vi: Mùa đông trời lạnh. Mình mặc áo ấm.
3.en: Winter days are short. It gets dark early.
3.vi: Mùa đông ngày ngắn. Trời tối sớm.
> Từ cụ thể tới trừu tượng: điều nhìn thấy, cảm thấy ở mùa thu (trời mát, lá vàng), điều mình làm khi mùa đông lạnh (mặc áo ấm), rồi ý độ dài ngày (ngày ngắn, tối sớm). Không dạy vì sao ngày ngắn (Scientist #6).
> [CẦN KIỂM] Miền Bắc mùa thu mát, trời trong; mùa đông lạnh; ở Hà Nội mùa đông trời tối sớm hơn rõ so với mùa hè.

## Khởi động

> Hai câu, đúng bảng Khởi động ở `_topic.md`. w1 ôn bài ngay trước (bài 2, ô Summer: hoa phượng nở mùa hè), nối sang câu q1 và q4 hôm nay. w2 ôn *Sinh vật sống ở đâu?* bài ba (mốc dài: lá xanh, lá vàng, lá khô), chuẩn bị ý "có cây lá chuyển vàng" của mùa thu.

### w1
id: a1d8e585-b532-4080-b2ba-7c815ce07fc3
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: thoi-tiet-va-cac-mua/mua-xuan-va-mua-he
prompt.en: Which flower blooms in summer?
prompt.vi: Hoa nào nở vào mùa hè?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of hot days when school ends.
hint.vi: Em nghĩ tới những ngày nắng nóng, lúc được nghỉ hè nhé.
explanation_correct.en: Yes! Students call it the school flower.
explanation_correct.vi: Đúng rồi! Hoa phượng còn được gọi là hoa học trò.
explanation_wrong.en: The answer is the flame tree. It blooms in summer.
explanation_wrong.vi: Đáp án là hoa phượng. Hoa phượng nở vào mùa hè.
> Gợi ý trỏ tới một cảnh quen (những ngày nóng lúc nghỉ hè; thống nhất với bài 5 câu q5 "phượng nở đúng dịp nghỉ hè", sửa 17/11 theo rà chữ g7), không trỏ tới ô Summer (câu chính ô đó là phán quyết). `explanation_correct` thêm ý "hoa học trò" (khớp thẻ `flame_tree_card` bài 2).
> [CẦN KIỂM] Cách gọi "hoa học trò" (đã ghi ở `_topic.md` mục Thẻ thưởng); phượng nở rộ khoảng tháng Năm, tháng Sáu, nên nói "phượng nở lúc nghỉ hè" là chấp nhận được.

#### option w1_flame
correct: true
label.en: flame tree
label.vi: hoa phượng
image.brief: Dùng lại hình `explore_summer` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): Delonix regia
image.alt.en: Red flowers on a big tree
image.alt.vi: Hoa đỏ trên cây to

#### option w1_peach
correct: false
feedback.en: Peach trees bloom at Tet, in spring.
feedback.vi: Hoa đào nở dịp Tết, vào mùa xuân.
label.en: peach blossom
label.vi: hoa đào
image.brief: Dùng lại hình `explore_spring` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): Prunus persica blossom
image.alt.en: Pink blossoms on a branch
image.alt.vi: Cành hoa màu hồng

### w2
id: 3de929ec-d6da-4c81-b5aa-534cc073b1a0
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song
prompt.en: A yellow leaf was once green.
prompt.vi: Chiếc lá vàng từng là lá xanh.
image.brief: Dùng lại hình `q4_yellow`. Từ khoá tìm ảnh (EN): autumn leaf on branch
image.alt.en: A yellow leaf on a branch
image.alt.vi: Chiếc lá vàng trên cành
answer: true
hint.en: Think of a fresh leaf on a tree.
hint.vi: Em nghĩ tới chiếc lá tươi vừa mọc trên cây nhé.
explanation_correct.en: Yes! Old leaves turn yellow, then fall.
explanation_correct.vi: Đúng rồi! Lá già chuyển vàng, rồi rụng xuống.
explanation_wrong.en: This is true. The leaf was green first.
explanation_wrong.vi: Câu này đúng. Lúc đầu chiếc lá màu xanh.
feedback_false.en: A leaf is green while it grows.
feedback_false.vi: Chiếc lá có màu xanh khi còn đang lớn.
> Câu mới, không chép câu q4 của bài đó (sắp thứ tự lá xanh, lá vàng, lá khô). Ảnh lá vàng không làm bằng chứng cho phía nào; gợi ý trỏ tới cảnh quen (lá tươi trên cây).
> Ảnh lá vàng là ảnh mới của chủ đề (gốc ở câu q4 bài này, `q4_yellow`, không tuyết), không dùng `q4_yellow` của bài đó (ảnh gốc có tuyết; phiên chính 18/11).

## Học

> Bốn ô: mùa thu (trời mát, trời xanh), mùa đông (lạnh, mặc áo ấm, không tuyết), lá bàng đỏ (dấu hiệu mùa đông nhìn thấy được), ngày ngắn (tối sớm). Đúng bốn ô của `_topic.md`.
> Ô "Winter" mang ý sửa misconception: ví dụ một bắt buộc "Hanoi is cold, but has no snow". Ảnh ô này là phố Hà Nội mùa đông trong sương mù, không tuyết (cũng là hình câu q6).
> Không "gió mùa đông bắc" (nói "gió lạnh"); Trung thu chỉ là dấu hiệu, không nói ngày trong lịch; không vì sao ngày ngắn; không nói cây rụng lá hay cây thường xanh (để dành *Cây quanh em*).

### explore
id: 88f58cc5-fce5-4429-8daf-67a7dda8a36f
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_autumn
label.en: Autumn
label.vi: Mùa thu
color: vang_hoe
sentence.en: Autumn days are cool, with blue skies.
sentence.vi: Mùa thu trời mát, bầu trời xanh trong.
image.brief: [ảnh] Tán cây xanh dưới bầu trời xanh trong, nhìn từ dưới lên, nắng nhẹ; không có lá đỏ rực kiểu ôn đới, không tuyết, không người nhìn rõ mặt, không biển hiệu, biển số hay chữ. Hình gốc của cả chủ đề. Từ khoá tìm ảnh (EN): blue sky trees; autumn trees Hanoi; tree lined street blue sky
image.alt.en: Trees under a clear blue sky
image.alt.vi: Hàng cây dưới bầu trời xanh trong
examples.1.en: some leaves turn yellow
examples.1.vi: có cây lá chuyển vàng
examples.2.en: star lanterns at Mid-Autumn
examples.2.vi: đèn ông sao dịp Trung thu
examples.3.en: blackboard tree flowers smell strong
examples.3.vi: hoa sữa thơm nồng
> Ví dụ một dạy trước chữ câu q2. Ví dụ ba dùng tên EN "blackboard tree" như thẻ thưởng (`_topic.md` bảng Tên gọi: hoa sữa là "blackboard tree"), thay gợi ý "milk flowers" của `_topic.md`, để một vật một tên.
> Ảnh mang tên nơi chỉ khi trang gốc khớp (Quy ước hình số bảy); `alt` không ghi tên nơi.
> [CẦN KIỂM] Hoa sữa nở vào mùa thu ở Hà Nội, mùi thơm nồng; Trung thu rơi vào mùa thu (tháng Chín hoặc tháng Mười dương lịch); có cây lá chuyển vàng vào mùa thu ở miền Bắc.

#### group explore_winter
label.en: Winter
label.vi: Mùa đông
color: cham
sentence.en: Winter is cold. Mornings are often foggy.
sentence.vi: Mùa đông trời lạnh. Sáng sớm thường có sương mù.
image.brief: [ảnh] Một khoảng đường ở Hà Nội trong sương mù dày buổi sáng mùa đông, mặt đường ướt, cây mờ trong sương, đèn đường ở xa; không người, không tuyết, không băng, không cây phủ trắng; không biển hiệu, biển số xe, không chữ. Hình gốc của cả chủ đề. Từ khoá tìm ảnh (EN): fog in Hanoi; foggy winter street
image.alt.en: A foggy winter street
image.alt.vi: Phố mùa đông trong sương mù
examples.1.en: Hanoi is cold, but has no snow
examples.1.vi: Hà Nội lạnh nhưng không có tuyết
examples.2.en: we wear coats and scarves
examples.2.vi: mình mặc áo khoác, quàng khăn
examples.3.en: a cold wind blows
examples.3.vi: gió lạnh thổi
> Ví dụ một bắt buộc (`_topic.md`), dạy sẵn ý đúng của `winter_means_snow` trước câu q6. Câu chính dạy trước dấu hiệu sương mù của câu q5.
> Sửa 18/11 theo ảnh mới (designer đổi ảnh phố Hà Nội 2008 sang ảnh sương mù Hà Nội, không người): câu chính nói điều bé thấy trong ảnh (sương mù); "we wear coats and scarves" chuyển xuống ví dụ hai, ý chính hai và kệ Chơi vẫn dạy mặc áo ấm.
> Câu q6 có gợi ý "nhìn mặt đường": ảnh phải thấy mặt đường không tuyết (ảnh mới thấy mặt đường ướt).
> [CẦN KIỂM] Hà Nội không có tuyết vào mùa đông; tuyết, băng giá chỉ thỉnh thoảng có ở núi cao phía Bắc (Sa Pa, Mẫu Sơn); sáng sớm mùa đông miền Bắc hay có sương mù.

#### group explore_red_leaves
label.en: Red leaves
label.vi: Lá bàng đỏ
color: do_son
sentence.en: Indian almond leaves turn red in winter.
sentence.vi: Lá bàng chuyển đỏ vào mùa đông.
image.brief: Dùng lại hình `almond_card` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa red leaves
image.alt.en: Red leaves on an Indian almond tree
image.alt.vi: Lá bàng chuyển màu đỏ
examples.1.en: then they fall
examples.1.vi: rồi lá rụng
examples.2.en: new leaves come in spring
examples.2.vi: sang xuân lá non lại mọc
examples.3.en: a big tree in the schoolyard
examples.3.vi: cây bàng to ở sân trường
> Hình dùng lại thẻ `almond_card` của *Sinh vật sống ở đâu?* bài ba (bé đã gặp). Cũng là đáp án câu q1.
> [CẦN KIỂM] Lá bàng chuyển đỏ rồi rụng vào mùa đông ở miền Bắc; sang xuân cây bàng ra lá non.

#### group explore_short_days
label.en: Short days
label.vi: Ngày ngắn
color: nau_dat
sentence.en: Winter days are short. It gets dark early.
sentence.vi: Mùa đông ngày ngắn. Trời tối sớm.
image.brief: [ảnh] Một dãy phố ven kênh lúc chiều tối, đèn đường và đèn nhà đã bật sáng, trời còn xanh sẫm (chưa đen hẳn); cắt bỏ số trên thuyền; không người ở gần, không ai nhìn rõ mặt, không biển hiệu, biển số xe đọc được, không đồng hồ, không chữ. Hình gốc của cả chủ đề. Từ khoá tìm ảnh (EN): street lights dusk; street lamps blue hour
image.alt.en: Street lights on in the evening
image.alt.vi: Đèn đường sáng lúc chiều tối
examples.1.en: street lights come on early
examples.1.vi: đèn đường bật sớm
examples.2.en: dark before dinner
examples.2.vi: chưa tới bữa tối trời đã tối
examples.3.en: summer days are long
examples.3.vi: mùa hè thì ngày dài
> Ô dạy trước chữ câu q3 ("short days"). Ý "tối sớm" chỉ là dấu hiệu mùa, không dạy ngày, đêm, Mặt Trời lặn (chủ đề bầu trời, câu D3 chưa chốt). Ví dụ ba nối với ý chính ba của bài 2.
> [CẦN KIỂM] Ở Hà Nội, mùa đông trời tối sớm hơn rõ so với mùa hè (khoảng năm giờ rưỡi chiều so với khoảng bảy giờ tối); "dark before dinner" đúng với bữa tối thường ngày của gia đình Việt Nam.

### new_words
id: f96af036-ea44-4083-a545-1a9edce85dc7
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: autumn, winter

## Chơi

> Bé chọn ba thứ cho ngày đông lạnh: quần áo ấm (áo khoác hoặc mũ len), khăn quàng (khăn len), giường ấm (chăn bông). Đạt khi đủ ba nhóm và không chọn đồ ngày nóng.
> Món bẫy là đồ ngày nóng, giống nhóm bắt buộc về dáng hay chỗ dùng: nón lá, áo cộc tay là đồ mặc, đội như mũ len, áo khoác; quạt nan là đồ dùng trong nhà như chăn bông. Bé gặp nón lá, áo cộc tay ở bài 1.
> Kệ bảy món, toàn ảnh chụp: áo khoác, mũ len, khăn len, chăn bông, nón lá, quạt nan, áo cộc tay.

### tray
id: afeea43f-caaf-4464-9f5c-811acd8e2084
type: build_tray
version: 1
prompt.en: Pick three things for cold winter days
prompt.vi: Chọn ba thứ cho những ngày đông lạnh
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find warm clothes, a scarf and a quilt.
messages.start.vi: Em tìm quần áo ấm, khăn quàng và chăn bông nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! You will stay warm all winter.
messages.balanced.vi: Tuyệt! Cả mùa đông em sẽ thật ấm.
messages.has_limited.en: That one is for hot days.
messages.has_limited.vi: Món này dùng khi trời nóng.
messages.missing.tray_clothes.en: You still need some warm clothes.
messages.missing.tray_clothes.vi: Em còn thiếu quần áo ấm.
messages.missing.tray_wrap.en: You still need a scarf.
messages.missing.tray_wrap.vi: Em còn thiếu khăn quàng.
messages.missing.tray_bed.en: You still need something for a warm bed.
messages.missing.tray_bed.vi: Em còn thiếu đồ cho giường ấm.
> Lời nhắn `has_limited` đúng với cả ba món bẫy (nón lá, quạt nan, áo cộc tay đều dùng khi trời nóng), đúng chữ ở `_topic.md`.
> Lời nhắn `start` tám từ EN: "warm clothes", "scarf" đúng chữ hai nhóm; nhóm "Warm bed" chỉ có một món nên gọi thẳng "a quilt" · "chăn bông" (vật có trên kệ), thay "a warm bed" vốn gượng và không có trên kệ (sửa 17/11 theo rà chữ g12).

#### group tray_clothes
label.en: Warm clothes
label.vi: Quần áo ấm
color: nau_dat
role: required

#### group tray_wrap
label.en: Scarf
label.vi: Khăn quàng
color: gi_dong
role: required

#### group tray_bed
label.en: Warm bed
label.vi: Giường ấm
color: cham
role: required

#### group tray_hot
label.en: For hot days
label.vi: Dùng khi trời nóng
color: do_son
role: limit

#### item tray_hat
label.en: Conical hat
label.vi: Nón lá
group: tray_hot
image.brief: Dùng lại hình `w1_hat` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): Vietnamese conical hat non la
image.alt.en: A conical hat
image.alt.vi: Chiếc nón lá

#### item tray_coat
label.en: Coat
label.vi: Áo khoác
group: tray_clothes
image.brief: Dùng lại hình `explore_cold` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): winter coat hanger
image.alt.en: A warm coat on a hanger
image.alt.vi: Chiếc áo khoác ấm trên móc

#### item tray_fan
label.en: Hand fan
label.vi: Quạt nan
group: tray_hot
image.brief: [ảnh] Quạt cầm tay đan bằng lá cọ, treo thành chồng ở sạp, chụp thẳng thấy rõ mặt quạt đan; không quạt điện, không ổ cắm, không người, không hình in, không chữ. Từ khoá tìm ảnh (EN): woven hand fan; palm leaf hand fan; bamboo hand fan woven
image.alt.en: Woven hand fans
image.alt.vi: Những chiếc quạt nan đan
> Ảnh mới chỉ dùng ở bài này (`_topic.md`: quạt nan, không quạt điện có nhãn hiệu). Ảnh thật là một chồng quạt đan lá cọ treo ở sạp, nên `alt` nói nhiều chiếc (18/11).

#### item tray_scarf
label.en: Scarf
label.vi: Khăn len
group: tray_wrap
image.brief: Dùng lại hình `tray_scarf` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): knitted wool scarf
image.alt.en: A knitted scarf
image.alt.vi: Chiếc khăn len

#### item tray_wool_hat
label.en: Wool hat
label.vi: Mũ len
group: tray_clothes
image.brief: [ảnh] Một chiếc mũ len đan có sọc màu (kem, xanh, đỏ), chụp thẳng thấy cả mũ; không người đội, không nhãn hiệu, không hình in, không chữ; khác hẳn dáng nón lá. Từ khoá tìm ảnh (EN): knitted wool hat; knit beanie
image.alt.en: A knitted wool hat
image.alt.vi: Chiếc mũ len
> Ảnh mới chỉ dùng ở bài này.

#### item tray_tshirt
label.en: T-shirt
label.vi: Áo cộc tay
group: tray_hot
image.brief: Dùng lại hình `tray_tshirt` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): plain t-shirt
image.alt.en: A short-sleeved T-shirt
image.alt.vi: Chiếc áo cộc tay

#### item tray_quilt
label.en: Quilt
label.vi: Chăn bông
group: tray_bed
image.brief: [ảnh] Một chiếc chăn bông dày màu trắng trải phẳng trên giường đơn, thấy rõ chăn phồng và dày, không người, không trẻ em, không nhãn hiệu, không chữ. Hình gốc của cả chủ đề (bài 4 dùng lại). Từ khoá tìm ảnh (EN): quilt blanket bed; white duvet bed
image.alt.en: A thick quilt on a bed
image.alt.vi: Chăn bông dày trên giường

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2 Đúng, q3 Sai, q6 Sai), `order_sequence` (q4, ba thẻ). Đúng khung Quiz bài 3 ở `_topic.md`.
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính (app Explorer ẩn hình câu hỏi khi mọi lựa chọn có hình). Câu nào cũng tự đủ nghĩa khi chỉ nghe.

### q1
id: f38b1cf8-0f22-4e47-90bd-db5e1e0846ac
format: single_choice
version: 1
dok: 1
prompt.en: Which one is a sign of winter?
prompt.vi: Cái nào là dấu hiệu của mùa đông?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of trees on cold, grey days.
hint.vi: Em nghĩ xem cây cối trông thế nào vào những ngày lạnh, trời xám nhé.
explanation_correct.en: Yes! Then the red leaves fall.
explanation_correct.vi: Đúng rồi! Rồi lá bàng đỏ sẽ rụng xuống.
explanation_wrong.en: The answer is the red leaves. They come in winter.
explanation_wrong.vi: Đáp án là lá bàng đỏ. Lá bàng chuyển đỏ vào mùa đông.
> Không dùng hoa đào làm lựa chọn sai (hoa đào nở cuối đông, đầu xuân, nước đôi; `_topic.md` mục Lệch). Hai lựa chọn sai là dấu hiệu mùa hè bé vừa học ở bài 2. Ba ảnh khác nhau rõ: lá to màu đỏ chụp gần, cây hoa đỏ có tán, con côn trùng trên thân cây.
> Gợi ý không trỏ tới ô "Red leaves" (câu chính ô là phán quyết); nhắc cảnh ngày lạnh, mà hoa phượng cũng là cây, nên không lộ đáp án.

#### option q1_flame
correct: false
feedback.en: Flame trees bloom red in summer.
feedback.vi: Hoa phượng nở đỏ vào mùa hè.
label.en: flame tree
label.vi: hoa phượng
image.brief: Dùng lại hình `explore_summer` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): Delonix regia
image.alt.en: Red flowers on a big tree
image.alt.vi: Hoa đỏ trên cây to

#### option q1_red
correct: true
label.en: red leaves
label.vi: lá bàng đỏ
image.brief: Dùng lại hình `almond_card` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa red leaves
image.alt.en: Red leaves on an Indian almond tree
image.alt.vi: Lá bàng chuyển màu đỏ

#### option q1_cicada
correct: false
feedback.en: Cicadas sing loudly on hot summer days.
feedback.vi: Ve kêu râm ran vào những ngày hè nóng.
label.en: cicada
label.vi: con ve
image.brief: Dùng lại hình `tray_cicada` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): cicada tree bark
image.alt.en: A cicada on tree bark
image.alt.vi: Con ve trên thân cây

### q2
id: cf5a87e3-fcb8-45ff-bd5a-8b7c8cb85e81
format: true_false
version: 1
dok: 1
prompt.en: Some leaves turn yellow in autumn.
prompt.vi: Mùa thu, có cây lá chuyển vàng.
image.brief: Dùng lại hình `q4_yellow`. Từ khoá tìm ảnh (EN): autumn leaf on branch
image.alt.en: A yellow leaf on a branch
image.alt.vi: Chiếc lá vàng trên cành
answer: true
hint.en: Think of the trees on cool autumn days.
hint.vi: Em nghĩ tới hàng cây vào những ngày thu mát nhé.
explanation_correct.en: Yes! Autumn skies are clear and blue, too.
explanation_correct.vi: Đúng rồi! Bầu trời mùa thu còn trong và xanh nữa.
explanation_wrong.en: This is true. Some autumn leaves turn yellow.
explanation_wrong.vi: Câu này đúng. Mùa thu, có cây lá chuyển vàng.
feedback_false.en: This leaf has turned from green to yellow.
feedback_false.vi: Chiếc lá này đã chuyển từ xanh sang vàng.
> DOK 1: nhớ lại ví dụ một ô "Autumn" (và ý chính một), kèm quan sát ảnh lá vàng. Câu nói "some", không "all" (cây thường xanh để dành *Cây quanh em*).

### q3
id: a31176da-9b25-49c7-84db-9722ee081de2
format: true_false
version: 1
dok: 1
prompt.en: Winter days are long.
prompt.vi: Ngày mùa đông dài.
image.brief: Dùng lại hình `explore_short_days`. Từ khoá tìm ảnh (EN): street lights dusk
image.alt.en: Street lights on in the evening
image.alt.vi: Đèn đường sáng lúc chiều tối
answer: false
hint.en: Think of when the street lights come on.
hint.vi: Em nghĩ xem đèn đường bật sáng lúc nào nhé.
explanation_correct.en: Winter days are short. It gets dark early.
explanation_correct.vi: Mùa đông ngày ngắn. Trời tối sớm.
explanation_wrong.en: This is false. Winter days are short.
explanation_wrong.vi: Câu này sai. Ngày mùa đông ngắn.
feedback_true.en: In winter, it gets dark before dinner.
feedback_true.vi: Mùa đông, chưa tới bữa tối trời đã tối.
> DOK 1: nhớ lại ô "Short days". Gợi ý trỏ tới ví dụ một của ô (đèn đường bật sớm), là bằng chứng, không trỏ tới câu chính ô. `explanation_correct` đứng một mình được (thẻ "Ý sai → Ý đúng").

### q4
id: 39ccec28-a0b2-452d-837f-603f66a72332
format: order_sequence
version: 1
dok: 2
prompt.en: Spring comes first. Put them in order.
prompt.vi: Mùa xuân đến trước. Em xếp theo thứ tự nhé.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_peach, q4_flame, q4_yellow
hint.en: Think of the hot days after spring.
hint.vi: Em nghĩ tới những ngày nóng sau mùa xuân nhé.
explanation_correct.en: Yes! After autumn, winter comes.
explanation_correct.vi: Đúng rồi! Hết mùa thu là đến mùa đông.
explanation_wrong.en: The order is peach, flame tree, yellow leaf.
explanation_wrong.vi: Thứ tự là hoa đào, hoa phượng, lá vàng.
> DOK 2: xếp ba dấu hiệu theo ba mùa liền nhau, bắt đầu từ mùa xuân (`prompt` nêu thẻ đầu, Lỗi hay gặp số mười chín). Gợi ý chỉ nhắc một mốc (mùa hè nóng sau mùa xuân), không gọi tên cả ba.
> Thẻ trong file không theo thứ tự đúng. Ba thẻ khác nhau rõ bằng màu: hồng, đỏ, vàng.
> [CẦN KIỂM] Thứ tự xuân, hè, thu đúng một chiều ở miền Bắc; hoa đào mùa xuân, hoa phượng mùa hè, lá vàng mùa thu.

#### item q4_yellow
label.en: yellow leaf
label.vi: lá vàng
image.brief: [ảnh] Một chiếc lá vàng tươi, lành, còn trên cành nhỏ, chụp gần, nền trời xanh; không tuyết, không băng, không lá đỏ rực, không đốm, không người, không chữ. Hình gốc của cả chủ đề (w2, q2 bài này; bài 2 q3 và hình ghép `explore_seasons`; bài 6 q3 dùng lại). Từ khoá tìm ảnh (EN): autumn leaf on branch; yellow leaf branch blue sky
image.alt.en: A yellow leaf on a branch
image.alt.vi: Chiếc lá vàng trên cành
> Ảnh mới thay `q4_yellow` của *Sinh vật sống ở đâu?* (ảnh gốc có tuyết; phiên chính 18/11). Ảnh designer chọn lượt hai (18/11, tester L3): lá bạch quả vàng tươi trên cành nhỏ, nền trời xanh, thay lá phong có đốm. Lá bạch quả không phải cây Việt Nam; chữ bé nghe chỉ nói "lá vàng", không gọi tên cây.

#### item q4_peach
label.en: peach blossom
label.vi: hoa đào
image.brief: Dùng lại hình `explore_spring` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): Prunus persica blossom
image.alt.en: Pink blossoms on a branch
image.alt.vi: Cành hoa màu hồng

#### item q4_flame
label.en: flame tree
label.vi: hoa phượng
image.brief: Dùng lại hình `explore_summer` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): Delonix regia
image.alt.en: Red flowers on a big tree
image.alt.vi: Hoa đỏ trên cây to

### q5
id: 975492e6-7c20-418e-a237-50371798cbe8
format: single_choice
version: 1
dok: 2
prompt.en: Red leaves, foggy mornings. Which season is it?
prompt.vi: Lá bàng đỏ, sáng sớm có sương mù. Đang là mùa nào?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of the days when you feel cold.
hint.vi: Em nghĩ tới những ngày em thấy lạnh nhé.
explanation_correct.en: Yes! We wear warm coats in winter.
explanation_correct.vi: Đúng rồi! Mùa đông mình mặc áo khoác ấm.
explanation_wrong.en: The answer is winter. It is cold and foggy.
explanation_wrong.vi: Đáp án là mùa đông. Trời lạnh và có sương mù.
> DOK 2: nghe hai dấu hiệu (lá bàng đỏ, sương mù buổi sáng), nhận ra mùa, rồi chọn ảnh một dấu hiệu khác của cùng mùa (áo khoác ấm, ví dụ hai ô "Winter" và kệ Chơi). Mỗi lựa chọn là ảnh một dấu hiệu, `label` gọi tên mùa (`_topic.md` Khuôn chung). Dấu hiệu trên ảnh không trùng chữ trong `prompt`.
> Đổi 18/11: ảnh sương mù nay là ảnh ô Học "Winter" và câu q6 (cùng ảnh gốc), nên thẻ mùa đông đổi sang ảnh áo khoác `explore_cold` (như bài 2 q5) để bé không chọn theo trí nhớ hình vừa xem; `prompt` đổi "warm coats" thành "foggy mornings" để dấu hiệu trên ảnh không trùng chữ câu hỏi.
> `feedback` nói dấu hiệu trên ảnh bé chọn, không nói tên đáp án (Lỗi hay gặp số mười tám).

#### option q5_summer
correct: false
feedback.en: Flame trees bloom in hot summer.
feedback.vi: Hoa phượng nở vào mùa hè nóng.
label.en: summer
label.vi: mùa hè
image.brief: Dùng lại hình `explore_summer` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): Delonix regia
image.alt.en: Red flowers on a big tree
image.alt.vi: Hoa đỏ trên cây to

#### option q5_spring
correct: false
feedback.en: New leaves grow in warm spring.
feedback.vi: Lộc non mọc vào mùa xuân ấm áp.
label.en: spring
label.vi: mùa xuân
image.brief: Dùng lại hình `explore_buds` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): leaf buds spring
image.alt.en: Tiny light-green leaves on a twig
image.alt.vi: Những chiếc lá nhỏ màu xanh nhạt trên cành

#### option q5_winter
correct: true
label.en: winter
label.vi: mùa đông
image.brief: Dùng lại hình `explore_cold` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): winter coat hanger
image.alt.en: A warm coat on a hanger
image.alt.vi: Chiếc áo khoác ấm trên móc
> [CẦN KIỂM] Sáng sớm mùa đông ở miền Bắc thường có sương mù.

### q6
id: 32a8251c-e4d5-475e-af73-b57d8e4f6ffb
format: true_false
version: 1
dok: 2
misconception: winter_means_snow
prompt.en: Winter always brings snow.
prompt.vi: Mùa đông lúc nào cũng có tuyết.
image.brief: Dùng lại hình `explore_winter`. Từ khoá tìm ảnh (EN): fog in Hanoi
image.alt.en: A foggy winter street
image.alt.vi: Phố mùa đông trong sương mù
answer: false
hint.en: Look at the ground on this winter street.
hint.vi: Em nhìn mặt đường trên phố mùa đông này nhé.
explanation_correct.en: Hanoi winters are cold, without snow.
explanation_correct.vi: Mùa đông Hà Nội lạnh nhưng không có tuyết.
explanation_wrong.en: This is false. Hanoi is cold, but has no snow.
explanation_wrong.vi: Câu này sai. Hà Nội lạnh nhưng không có tuyết.
feedback_true.en: Snow falls in far, very cold places.
feedback_true.vi: Tuyết rơi ở những nơi rất lạnh và rất xa.
> Câu misconception (`winter_means_snow`), bằng hình, DOK 2: bé còn nghĩ "mùa đông là có tuyết" (tranh, phim, thiệp) sẽ chạm Đúng. Bé áp điều đã học (ví dụ một ô "Winter") và nhìn ảnh phố mùa đông không tuyết. Câu chỉ kiểm một việc: mùa đông có nhất thiết có tuyết không.
> Hình là phố Hà Nội một sáng mùa đông trong sương mù, mặt đường ướt, không tuyết (ảnh đổi 18/11, không còn người): là bằng chứng nhìn thấy, không đẩy bé về phía misconception. Gợi ý trỏ tới mặt đường trong ảnh.
> `explanation_correct` là đúng câu `correction` ở `_topic.md`, đứng một mình được: "Winter always brings snow." → "Hanoi winters are cold, without snow.".
> `feedback_true` nối với Bắc Cực của *Những nơi sống trên Trái Đất* bài một (nơi rất lạnh, rất xa), không nói Sa Pa để khỏi rối bé.
> [CẦN KIỂM] Hà Nội không có tuyết; tuyết chỉ thỉnh thoảng ở núi cao phía Bắc.

## Từ vựng

### autumn
id: 903d0091-506e-4786-a49e-bebf01be6544
tier: core
term.en: autumn
term.vi: mùa thu
example.en: In autumn, the sky is clear and blue.
example.vi: Mùa thu, bầu trời trong và xanh.
image.brief: Dùng lại hình `explore_autumn`. Từ khoá tìm ảnh (EN): blue sky trees
image.alt.en: Trees under a clear blue sky
image.alt.vi: Hàng cây dưới bầu trời xanh trong

### winter
id: bf8b74c3-cbe0-4c46-bf30-6ec8ffeeb6e0
tier: core
term.en: winter
term.vi: mùa đông
example.en: Winter mornings can be cold and foggy.
example.vi: Sáng mùa đông trời lạnh và có sương mù.
image.brief: Dùng lại hình `explore_winter`. Từ khoá tìm ảnh (EN): fog in Hanoi
image.alt.en: A foggy winter street
image.alt.vi: Phố mùa đông trong sương mù
> Câu ví dụ đổi 18/11 cho khớp ảnh sương mù (ảnh không còn người mặc áo khoác); từ `coat` có câu ví dụ riêng về áo khoác.

### cool
id: 5904c38d-b0ee-4323-bcc2-a1e83ac46d9d
tier: extra
term.en: cool
term.vi: mát
example.en: A cool wind blows in autumn.
example.vi: Mùa thu, gió mát thổi nhè nhẹ.
image.brief: Dùng lại hình `explore_autumn`. Từ khoá tìm ảnh (EN): blue sky trees
image.alt.en: Trees under a clear blue sky
image.alt.vi: Hàng cây dưới bầu trời xanh trong
> Từ `autumn` và `cool` cùng một ảnh, đúng bảng Từ vựng ở `_topic.md`.

### coat
id: 5b2f703a-41bb-478a-9d33-9c77e6eae64b
tier: extra
term.en: coat
term.vi: áo khoác
example.en: My coat keeps me warm.
example.vi: Áo khoác giữ ấm cho em.
image.brief: Dùng lại hình `explore_cold` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): winter coat hanger
image.alt.en: A warm coat on a hanger
image.alt.vi: Chiếc áo khoác ấm trên móc

### scarf
id: 1c69959e-3905-445d-96c4-ecf6b303ea47
tier: extra
term.en: scarf
term.vi: khăn quàng
example.en: I wrap a scarf around my neck.
example.vi: Em quàng khăn quanh cổ.
image.brief: Dùng lại hình `tray_scarf` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): knitted wool scarf
image.alt.en: A knitted scarf
image.alt.vi: Chiếc khăn len

## Thưởng

### blackboard_tree_card
id: 04b97fa3-6c14-4482-b922-54de15929326
set: weather
rarity: rare
name.en: Blackboard tree
name.vi: Cây hoa sữa
tag.en: Smells strong in autumn
tag.vi: Thơm nồng mùa thu
fact.en: Its tiny white flowers grow in bunches.
fact.vi: Hoa sữa nhỏ, trắng, mọc thành chùm.
image.brief: [ảnh] Những chùm hoa sữa nhỏ màu trắng ngà trên cành cây hoa sữa, chụp gần, thấy rõ từng chùm hoa và vài lá xanh dài xếp thành vòng quanh cành; nền trời hoặc lá mờ; không người, không chữ. Từ khoá tìm ảnh (EN): Alstonia scholaris flowers; blackboard tree flowers
image.alt.en: Bunches of tiny white flowers
image.alt.vi: Những chùm hoa nhỏ màu trắng
> Ảnh mới chỉ dùng ở bài này. Không dùng cây bàng (đã là thẻ `almond_card` của *Sinh vật sống ở đâu?*), không dùng sương mù (đã là ảnh ô Học "Winter" và câu q6).
> [CẦN KIỂM] Hoa sữa (*Alstonia scholaris*) nở mùa thu ở Hà Nội, hoa nhỏ màu trắng mọc thành chùm, mùi thơm nồng; tên EN "blackboard tree"; nghe thử giọng EN đọc.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Không tuyết, không băng trong bất kỳ ảnh nào của bài (bài sửa `winter_means_snow`). Không lá đỏ rực kiểu ôn đới cho mùa thu. Không thiên tai. Người trong cảnh ở xa, không nhận ra mặt; không biển hiệu, biển số, đồng hồ hay chữ.
- **Ảnh mới, hình gốc của cả chủ đề (giữ đúng key, `alt`, truy vấn đầu ở `_topic.md`):** tán cây dưới trời xanh trong, nhìn từ dưới lên (`explore_autumn`); phố Hà Nội mùa đông trong sương mù dày, mặt đường ướt, không người, không tuyết (`explore_winter`, cũng là hình câu q6 và từ `winter`; ảnh đổi 18/11); dãy phố ven kênh lên đèn lúc chiều tối (`explore_short_days`); chăn bông trắng trải phẳng trên giường (`tray_quilt`, bài 4 dùng lại); lá vàng trên cành, nền trời xanh (`q4_yellow`, ảnh mới không tuyết; w2, q2 bài này, bài 2, 6 dùng lại).
- **Ảnh mới chỉ dùng ở bài này:** mũ len có sọc (`tray_wool_hat`), chồng quạt đan lá cọ (`tray_fan`, không quạt điện), chùm hoa sữa (`blackboard_tree_card`).
- **Ảnh dùng lại:** bài 1 `thoi-tiet-hom-nay`: `explore_cold` (áo khoác: kệ Chơi, từ `coat`, thẻ mùa đông câu q5 từ 18/11), `tray_scarf`, `tray_tshirt`. Bài 2 `mua-xuan-va-mua-he`: `explore_spring` (hoa đào), `explore_summer` (hoa phượng), `explore_buds` (lộc non), `tray_cicada`. *Sinh vật sống ở đâu?* bài ba: `almond_card` (lá bàng đỏ, ô Học và q1). *Gọi tên và nhóm động vật* bài một: `w1` (hàng rào tre, hình câu w1, q1, q4, q5), `w1_hat` (nón lá).
- **Câu q4 (sắp thứ tự):** ba thẻ khung vuông cùng kiểu ảnh hoa, lá chụp gần: hoa đào, hoa phượng, lá vàng. Ảnh hoa phượng gốc thấy cả tán; làm `crop` vuông gần chùm hoa để ba thẻ cùng cỡ vật.
- **Ảnh khó:** phố mùa đông Hà Nội không tuyết (18/11: không tìm được ảnh hợp luật có người mặc áo ấm ở xa, nên dùng ảnh sương mù Hà Nội không người; `alt` không ghi tên nơi); sương mù không tuyết (nhiều ảnh sương mù ôn đới có sương giá trắng trên cỏ: loại); hoa sữa đúng loài, không lẫn hoa nhài hay hoa ngọc lan.
- **`q4_yellow` (18/11):** đã thay bằng ảnh lá vàng mới không tuyết (lượt hai: lá bạch quả trên nền trời xanh), gốc ở câu q4 bài này; không dùng `q4_yellow` của *Sinh vật sống ở đâu?* (phiên chính 18/11).
- **Màu:** Học: mùa thu `vang_hoe`, mùa đông `cham`, lá bàng đỏ `do_son`, ngày ngắn `nau_dat`. Chơi: quần áo ấm `nau_dat`, khăn quàng `gi_dong`, giường ấm `cham`, dùng khi trời nóng `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (autumn, winter). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Đúng). Quiz `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2 Đúng, q3 Sai, q6 Sai), `order_sequence` (q4, ba thẻ). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`winter_means_snow`). Không có `labels` ở câu `true_false`.
- **`order_sequence`:** Explorer `order_sequence` có renderer từ app 0.1.0 (SK-040); `build` không báo `format_not_rendered`. Chủ đề dùng ở q4 bài 3, 5, 6 (bài 4 q4 đổi sang `single_choice` 18/11).
- **Màn Chơi, ví dụ để kiểm:** Áo khoác, Khăn len, Chăn bông → `balanced`; Mũ len, Khăn len, Chăn bông → `balanced`; Áo khoác, Mũ len, Khăn len → `missing.tray_bed`; Áo khoác, Khăn len, Quạt nan → `has_limited`; Nón lá, Khăn len, Chăn bông → `has_limited`.
- **Khởi động trỏ:** w1 → `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he` (bài 2 phải có id trước), w2 → `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song` (đã có id).
- **Từ EN có thể ngoài Starters/Movers:** autumn, Mid-Autumn, star lanterns, blackboard tree, Indian almond, foggy, scarves, quilt, wool hat, hand fan, flame tree, peach blossom, cicada, Hanoi. Nghe thử giọng EN đọc "Hanoi", "Mid-Autumn", "Indian almond", "blackboard tree".
