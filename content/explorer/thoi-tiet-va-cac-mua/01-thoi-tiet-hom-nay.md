---
id: 821c68e7-6b92-48f7-b282-13f3b9d57884
topic: thoi-tiet-va-cac-mua
slug: thoi-tiet-hom-nay
order: 1
stage: opener
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Weather today
vi: Thời tiết hôm nay
> Giữ đúng tên ở `content/syllabus.json` (key `new-weather-and-seasons`, bài số một).

## Mục tiêu
en: I can say what the weather is like.
vi: Em nói được hôm nay trời thế nào.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 17/11/2026. Ticket SK-050. Mọi dòng `id:` để trống; chạy `ids` sau `_topic.md`.
> Chủ đề mới, không bám Oak (`_topic.md` mục Nguồn). Ý gộp từ bốn lesson "weather in …" của hai unit Year 1 cũ: chỉ lấy ý "tả thời tiết bằng từ đơn giản", viết lại toàn bộ.
> Bài mở chủ đề: thời tiết nhìn thấy hằng ngày (nắng, nhiều mây, mưa, lạnh) và cách mặc theo thời tiết. Sửa `sun_gone_when_cloudy` ở ô Học "Cloudy" (ví dụ bắt buộc "the Sun is still there") và câu q6 (gắn key).

## Ý chính
1.en: The weather can be sunny, cloudy or rainy.
1.vi: Trời có thể nắng, nhiều mây hoặc mưa.
2.en: Some days are hot. Some days are cold.
2.vi: Có ngày trời nóng, có ngày trời lạnh.
3.en: We dress for the weather.
3.vi: Mình mặc quần áo hợp với thời tiết.
> Từ cụ thể tới trừu tượng: điều nhìn thấy trên bầu trời, rồi điều cảm thấy trên da (nóng, lạnh), rồi việc mình làm theo thời tiết. Ý chính một đổi "windy" thành "cloudy" theo mục Lệch của `_topic.md` (phiên chính đã chấp nhận).
> [CẦN KIỂM] "Sunny days are often hot" đúng với trẻ Việt Nam (ngày nắng mùa đông miền Bắc vẫn lạnh, nên câu dùng "often" · "thường").

## Khởi động

> Hai câu, cả hai ôn chủ đề trước vì đây là bài đầu của chủ đề (nếp SK-045): w1 ôn *Những nơi sống trên Trái Đất* bài một (mốc khoảng hai tuần, nơi rất lạnh); w2 ôn *Gọi tên và nhóm động vật* bài ba (mốc khoảng một tháng, `all_birds_fly`).

### w1
id: d406146d-e14f-4315-a8c7-c57303d09708
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: noi-song-tren-trai-dat/bac-cuc
prompt.en: Which place is very cold?
prompt.vi: Nơi nào rất lạnh?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of your freezer at home.
hint.vi: Em nghĩ tới ngăn đá tủ lạnh ở nhà nhé.
explanation_correct.en: Yes! The Arctic is icy and very cold.
explanation_correct.vi: Đúng rồi! Bắc Cực đầy băng và rất lạnh.
explanation_wrong.en: The answer is the sea ice. Ice is cold.
explanation_wrong.vi: Đáp án là băng trên biển. Băng rất lạnh.
> Ôn ý chính một của bài đó ("The Arctic is icy and very cold."), nối sang chữ "cold" của bài này. Hai cảnh khác hẳn bằng mắt (băng trắng, cát vàng cam). Gợi ý trỏ tới cảnh quen ở nhà (ngăn đá tủ lạnh), không gọi tên đáp án ở cả hai thứ tiếng: bản EN không dùng chữ "ice" vì đó là chữ của nhãn đáp án (sửa 17/11 theo rà chữ N3).

#### option w1_ice
correct: true
label.en: sea ice
label.vi: băng trên biển
image.brief: Dùng lại hình `explore_ice` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Arctic sea ice
image.alt.en: Ice floating on the sea
image.alt.vi: Băng trôi trên mặt biển
> `alt` riêng của chủ đề (bảng "Hình của chủ đề khác" ở `_topic.md`): `alt` gốc "Sea ice on a cold sea" có chữ "cold" của câu hỏi.

#### option w1_desert
correct: false
feedback.en: The Sahara is hot and sandy.
feedback.vi: Sa mạc Xa-ha-ra nóng và đầy cát.
label.en: Sahara
label.vi: Xa-ha-ra
image.brief: Dùng lại hình `explore_sahara` ở bài `noi-song-tren-trai-dat/sa-mac`. Từ khoá tìm ảnh (EN): Sahara dunes
image.alt.en: Big sand dunes in the Sahara
image.alt.vi: Những đồi cát lớn ở Xa-ha-ra

### w2
id: ffba2db2-bb8f-4985-98ee-f77849aef86b
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/chim-va-bo-sat
prompt.en: A penguin flies high in the sky.
prompt.vi: Chim cánh cụt bay cao trên trời.
image.brief: Dùng lại hình `tray_penguin` ở bài `goi-ten-va-nhom-dong-vat/chim-va-bo-sat`. Từ khoá tìm ảnh (EN): penguin standing rocks side view
image.alt.en: A penguin on a rock
image.alt.vi: Chim cánh cụt đứng trên tảng đá
answer: false
hint.en: Look at the penguin's short wings.
hint.vi: Em nhìn đôi cánh ngắn của chim cánh cụt nhé.
explanation_correct.en: A penguin uses its wings to swim.
explanation_correct.vi: Chim cánh cụt dùng đôi cánh để bơi.
explanation_wrong.en: This is false. A penguin cannot fly.
explanation_wrong.vi: Câu này sai. Chim cánh cụt không bay được.
feedback_true.en: A penguin walks on land and swims.
feedback_true.vi: Chim cánh cụt đi bộ trên cạn và bơi dưới nước.
> Câu mới, khác "Every bird can fly." của #1 bài 4 w2: nói về một con vật bé nhìn thấy trong hình. `explanation_correct` đứng một mình được cho thẻ "Ý sai → Ý đúng".
> [CẦN KIỂM] Chim cánh cụt không bay được, dùng cánh như mái chèo để bơi (đã kiểm ở #1 bài 3).

## Học

> Bốn ô, từ điều nhìn thấy trên bầu trời (nắng, mây, mưa) tới điều cảm thấy và cách mặc (lạnh). Gió chỉ nói ở ví dụ ô "Cold" (mục Lệch của `_topic.md`).
> Ô "Cloudy" mang ý sửa misconception (ví dụ bắt buộc "the Sun is still there"). Ô "Sunny" có ví dụ an toàn bắt buộc "never look straight at the Sun".
> Chữ cần dạy trước khi hỏi: "clothes dry fast" (q4) ở ô "Sunny", thay gợi ý "drink lots of water"; "wear a hat in the sun" (bài 2 q4) cũng ở ô "Sunny".

### explore
id: f9913591-f659-48b6-bb46-1c8e2ce0028a
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_sunny
label.en: Sunny
label.vi: Trời nắng
color: vang_hoe
sentence.en: Sunny days are bright and often hot.
sentence.vi: Ngày nắng trời sáng và thường nóng.
image.brief: Dùng lại hình `q3_sun` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): sun bright blue sky
image.alt.en: The bright sun in the sky
image.alt.vi: Mặt Trời chói sáng trên trời
examples.1.en: never look straight at the Sun
examples.1.vi: đừng bao giờ nhìn thẳng vào Mặt Trời
examples.2.en: wear a hat in the sun
examples.2.vi: đội nón khi ra nắng
examples.3.en: wet clothes dry fast
examples.3.vi: quần áo ướt mau khô
> Hình của nhóm Discoverer: **chép mục** sang chủ đề này (`same_as` không sang nhóm tuổi khác), giữ `alt` gốc. Đây là ảnh duy nhất của chủ đề có đĩa Mặt Trời (Quy ước hình số sáu); không ảnh người nhìn lên Mặt Trời.
> Ví dụ hai, ba là chữ cần dạy trước cho bài 2 q4 (nón) và câu q4 bài này (phơi đồ).
> [CẦN KIỂM] Nắng làm quần áo ướt mau khô (kinh nghiệm phổ thông).

#### group explore_cloudy
label.en: Cloudy
label.vi: Trời nhiều mây
color: gi_dong
sentence.en: Clouds can hide the Sun for a while.
sentence.vi: Mây có thể che Mặt Trời một lúc.
image.brief: [ảnh] Bầu trời nhiều mây, Mặt Trời nằm sau một đám mây dày, thấy rõ những tia nắng lọt qua mép mây toả xuống; đĩa Mặt Trời bị mây che kín, ảnh không chói; trời xanh quanh đám mây, khung chỉ có trời, không thấy mặt đất; ảnh ngang có khoảng trống (dùng cả khung vuông ở Học và khung 4:3 của câu q6); không có người, không có máy bay, không có cầu vồng, không có chữ; không mây giông đen kịt, không sét. Từ khoá tìm ảnh (EN): sun behind clouds; sunbeams through clouds; crepuscular rays
image.alt.en: Sunbeams through the clouds
image.alt.vi: Tia nắng xuyên qua mây
examples.1.en: the Sun is still there
examples.1.vi: Mặt Trời vẫn ở đó
examples.2.en: sunbeams shine through the clouds
examples.2.vi: tia nắng lọt qua những đám mây
examples.3.en: the sky looks grey
examples.3.vi: bầu trời trông xám
> Hình gốc của cả chủ đề (bảng Hình dùng chung ở `_topic.md`): câu q6 và từ `weather` dùng lại. Khác ảnh `q3_cloudy` (mây trắng xen mây xám, không thấy nắng) của câu q3.
> Ví dụ một là ví dụ bắt buộc, chuẩn bị cho câu q6.

#### group explore_rainy
label.en: Rainy
label.vi: Trời mưa
color: cham
sentence.en: Rain falls and everything gets wet.
sentence.vi: Mưa rơi xuống, mọi thứ đều ướt.
image.brief: Dùng lại hình `q1_rain` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): heavy rain house garden
image.alt.en: Heavy rain falling
image.alt.vi: Mưa to đang rơi
examples.1.en: we wear a raincoat
examples.1.vi: mình mặc áo mưa
examples.2.en: rubber boots for puddles
examples.2.vi: đi ủng cao su lội vũng nước
examples.3.en: frogs croak after rain
examples.3.vi: ếch kêu sau cơn mưa
> Hình của nhóm Discoverer (ảnh Estonia, CC0): **chép mục** sang chủ đề này, giữ `alt` gốc. Mưa to rồi tạnh, không ngập đường (Quy ước hình số năm).
> Câu chính nói điều bé thấy trong ảnh (mưa to trên căn nhà gỗ, mái và vườn ướt); áo mưa chuyển xuống ví dụ một, vẫn dạy trước câu q1 (sửa 18/11 theo ios-dev ý 4, tester g7). Bỏ ví dụ "the roads get wet" (ảnh không thấy đường); từ `rainy` vẫn dùng câu ví dụ ấy.
> [CẦN KIỂM] Ếch đồng kêu nhiều sau mưa.

#### group explore_cold
label.en: Cold
label.vi: Trời lạnh
color: nau_dat
sentence.en: On cold days, we wear a warm coat.
sentence.vi: Trời lạnh, mình mặc áo khoác ấm.
image.brief: [ảnh] Một chiếc áo phao màu trơn (đỏ) treo trên móc áo, nền trơn tối, thấy cả chiếc áo; không có người mặc, không có nhãn hiệu, không có chữ hay hình in trên áo, không có bao bì, không có tuyết. Từ khoá tìm ảnh (EN): winter coat hanger; puffer jacket hanger; wool coat hanging
image.alt.en: A warm coat on a hanger
image.alt.vi: Chiếc áo khoác ấm trên móc
examples.1.en: wrap a scarf
examples.1.vi: quàng khăn len
examples.2.en: a cold wind blows
examples.2.vi: gió lạnh thổi
examples.3.en: warm socks, too
examples.3.vi: đi cả tất ấm nữa
> Hình gốc của cả chủ đề (kệ Chơi, q1 bài này; bài 2 đến 6 dùng lại, cả hình ghép `explore_seasons` và `explore_clothes`). Chọn ảnh áo thật ấm, nhìn ra ngay là áo mùa lạnh (khác áo tay dài `q4_long_sleeve` của bài 6).

### new_words
id: b9775d1f-345a-473c-8241-871feac87cf3
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: weather, sunny, rainy

## Chơi

> Bé chọn đồ cho ba kiểu thời tiết: một món cho ngày nắng (nón lá, áo cộc tay), một món cho ngày mưa (áo mưa, ủng cao su), một món cho ngày lạnh (áo khoác, khăn len). Đạt khi đủ ba nhóm và không chọn món bẫy.
> Món bẫy giống đồ dùng hằng ngày nhưng không giúp gì khi nắng, mưa hay lạnh: cái gối mềm như khăn len, quả bóng là đồ chơi ngoài trời. Không có "cái ô" (che cả nắng lẫn mưa, nước đôi).
> Kệ tám món, toàn ảnh chụp, đồ vật không có người mặc.

### tray
id: 391e85b1-eddc-4c1b-add8-8d8bc345cb25
type: build_tray
version: 1
prompt.en: Dress for sun, rain and cold
prompt.vi: Chọn đồ cho ngày nắng, ngày mưa, ngày lạnh
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick one for sun, rain and cold.
messages.start.vi: Em chọn một món cho ngày nắng, một món cho ngày mưa, một món cho ngày lạnh nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! You are ready for any weather.
messages.balanced.vi: Tuyệt! Em đã sẵn sàng cho mọi thời tiết.
messages.has_limited.en: That one does not help with weather.
messages.has_limited.vi: Món này không giúp gì khi nắng, mưa hay lạnh.
messages.missing.tray_sunny.en: You still need something for sunny days.
messages.missing.tray_sunny.vi: Em còn thiếu một món cho ngày nắng.
messages.missing.tray_rainy.en: You still need something for rainy days.
messages.missing.tray_rainy.vi: Em còn thiếu một món cho ngày mưa.
messages.missing.tray_cold.en: You still need something for cold days.
messages.missing.tray_cold.vi: Em còn thiếu một món cho ngày lạnh.
> Lời nhắn `has_limited` đúng với cả hai món bẫy (gối, quả bóng).

#### group tray_sunny
label.en: Sunny
label.vi: Trời nắng
color: vang_hoe
role: required

#### group tray_rainy
label.en: Rainy
label.vi: Trời mưa
color: cham
role: required

#### group tray_cold
label.en: Cold
label.vi: Trời lạnh
color: nau_dat
role: required

#### group tray_not
label.en: Not for sun, rain or cold
label.vi: Không dùng khi nắng, mưa hay lạnh
color: do_son
role: limit
> Nhãn chép đúng bảng "Phần Chơi" của `_topic.md`. Nhãn có dấu phẩy, trái ghi chú "Nhãn nhóm không có dấu phẩy" của chính bảng đó; giữ chữ chốt, đã báo phiên chính.

#### item tray_hat
label.en: Conical hat
label.vi: Nón lá
group: tray_sunny
image.brief: Dùng lại hình `w1_hat` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): Vietnamese conical hat non la
image.alt.en: A conical hat
image.alt.vi: Chiếc nón lá
> Ảnh trang gốc ghi "Nón lá đồ chơi": designer kiểm trên kệ 1:1 có trông như nón thật không (mục Đề xuất của `_topic.md`, designer ý 2).

#### item tray_raincoat
label.en: Raincoat
label.vi: Áo mưa
group: tray_rainy
image.brief: [ảnh] Một chiếc áo mưa vàng bóng có mũ trùm và hai tay áo, trải trên cỏ, thấy cả chiếc áo; phía sau có vài áo mưa khác; không có người mặc, không có nhãn hiệu, không có chữ hay hình in, không có bao bì. Từ khoá tìm ảnh (EN): yellow raincoat with hood; yellow rain jacket on grass
image.alt.en: A yellow raincoat with a hood
image.alt.vi: Chiếc áo mưa vàng có mũ
> Hình gốc của cả chủ đề (q1, từ `raincoat`; bài 4, 5, 6 dùng lại). Không dùng hình tự vẽ áo mưa của *Hô hấp* (cả chủ đề này toàn ảnh).
> Ảnh đổi 18/11 (designer, sau chạy thử): áo mưa cánh dơi cũ không có tay áo, crop nào cũng chỉ ra một khối vàng; ảnh mới là áo mưa vàng có mũ, hai tay áo, trải trên cỏ. `alt` sửa theo ảnh mới.

#### item tray_coat
label.en: Warm coat
label.vi: Áo khoác ấm
group: tray_cold
image.brief: Dùng lại hình `explore_cold`. Từ khoá tìm ảnh (EN): winter coat hanger
image.alt.en: A warm coat on a hanger
image.alt.vi: Chiếc áo khoác ấm trên móc

#### item tray_pillow
label.en: Pillow
label.vi: Cái gối
group: tray_not
image.brief: [ảnh] Một chiếc gối ngủ trơn màu, không hình in, đặt trên nền trơn hoặc trên giường trải ga trơn, thấy cả chiếc gối; không có người, không có nhãn hiệu, không có chữ. Từ khoá tìm ảnh (EN): plain white pillow; pillow on bed
image.alt.en: A soft pillow
image.alt.vi: Chiếc gối mềm
> Hình gốc của cả chủ đề (bài 6 dùng lại).

#### item tray_tshirt
label.en: T-shirt
label.vi: Áo cộc tay
group: tray_sunny
image.brief: [ảnh] Một chiếc áo cộc tay trơn màu, trải phẳng hoặc treo trên móc, nền trơn sáng; không có người mặc, không có chữ, không có hình in, không có nhãn hiệu. Từ khoá tìm ảnh (EN): plain t-shirt; blank t-shirt flat lay
image.alt.en: A short-sleeved T-shirt
image.alt.vi: Chiếc áo cộc tay
> Hình gốc của cả chủ đề (q1; bài 3, 6 dùng lại, cả hình ghép `explore_clothes`).

#### item tray_scarf
label.en: Scarf
label.vi: Khăn len
group: tray_cold
image.brief: [ảnh] Một chiếc khăn len đan gấp gọn hoặc treo trên móc, thấy rõ sợi len đan, nền trơn; không có người quàng, không có nhãn hiệu, không có chữ. Từ khoá tìm ảnh (EN): knitted wool scarf; folded knit scarf
image.alt.en: A knitted scarf
image.alt.vi: Chiếc khăn len
> Hình gốc của cả chủ đề (q5; bài 2, 3, 4, 6 dùng lại).

#### item tray_ball
label.en: Ball
label.vi: Quả bóng
group: tray_not
image.brief: [ảnh] Những quả bóng nảy cao su nhiều màu chụp gần, nền sáng; không người, không nhãn hiệu, không chữ. Hình gốc của cả chủ đề (bài 6 dùng lại). Từ khoá tìm ảnh (EN): colourful rubber bouncy balls; rubber balls close up
image.alt.en: Colourful rubber balls
image.alt.vi: Những quả bóng cao su nhiều màu
> Ảnh đổi 18/11 (designer, tester L2): bỏ ảnh `q1_ball` của *Sinh vật sống ở đâu?* (quả bóng có chữ nhãn hiệu, crop nào cũng còn chữ). Ảnh mới là nhiều quả bóng; nhãn "Ball" · "Quả bóng" giữ, vì bé chọn loại đồ vật, không đếm.

#### item tray_boots
label.en: Rubber boots
label.vi: Ủng cao su
group: tray_rainy
image.brief: [ảnh] Một đôi ủng cao su trơn màu đứng cạnh nhau trên nền trơn hoặc trên thảm, chụp từ trên chếch xuống, thấy cả đôi; không có người đi, không có nhãn hiệu, không có chữ, không có bùn bẩn nhiều. Từ khoá tìm ảnh (EN): rubber boots pair; rain boots
image.alt.en: A pair of rubber boots
image.alt.vi: Đôi ủng cao su
> Hình gốc của cả chủ đề (bài 4, 6 dùng lại).

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1 ba lựa chọn, q3 ba lựa chọn, q4 hai lựa chọn), `true_false` (q2 Đúng, q5 Sai, q6 Sai). Không `order_sequence` (bài 1, 2 theo Khung chung).
> Hình câu `single_choice` là hàng rào tre trung tính (app Explorer ẩn hình câu hỏi khi mọi lựa chọn có hình). Câu nào cũng tự đủ nghĩa khi chỉ nghe.
> Không câu nào, kể cả gợi ý, bảo bé nhìn Mặt Trời hay nhìn lên trời (Lỗi hay gặp số mười lăm).

### q1
id: 6eca02d6-8ad2-4fb5-b219-9d64f9700e11
format: single_choice
version: 1
dok: 1
prompt.en: What do we wear on rainy days?
prompt.vi: Trời mưa, mình mặc gì?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think how to stay dry in the rain.
hint.vi: Em nghĩ xem làm sao để khỏi ướt khi trời mưa nhé.
explanation_correct.en: Yes! A raincoat keeps the rain off.
explanation_correct.vi: Đúng rồi! Áo mưa che mưa cho em.
explanation_wrong.en: The answer is the raincoat. It keeps you dry.
explanation_wrong.vi: Đáp án là áo mưa. Áo mưa giữ cho em khô ráo.
> Nhớ lại ví dụ một ô "Rainy" ("we wear a raincoat") và nhóm Trời mưa ở kệ Chơi. Lựa chọn sai là áo khoác, áo cộc tay, không có nón lá (nón lá cũng dùng khi mưa, nước đôi; mục Lệch của `_topic.md`).

#### option q1_coat
correct: false
feedback.en: A warm coat is for cold days.
feedback.vi: Áo khoác ấm dùng cho ngày lạnh.
label.en: warm coat
label.vi: áo khoác ấm
image.brief: Dùng lại hình `explore_cold`. Từ khoá tìm ảnh (EN): winter coat hanger
image.alt.en: A warm coat on a hanger
image.alt.vi: Chiếc áo khoác ấm trên móc

#### option q1_raincoat
correct: true
label.en: raincoat
label.vi: áo mưa
image.brief: Dùng lại hình `tray_raincoat`. Từ khoá tìm ảnh (EN): yellow raincoat with hood
image.alt.en: A yellow raincoat with a hood
image.alt.vi: Chiếc áo mưa vàng có mũ

#### option q1_tshirt
correct: false
feedback.en: A T-shirt is for hot days.
feedback.vi: Áo cộc tay dùng cho ngày nóng.
label.en: T-shirt
label.vi: áo cộc tay
image.brief: Dùng lại hình `tray_tshirt`. Từ khoá tìm ảnh (EN): plain t-shirt
image.alt.en: A short-sleeved T-shirt
image.alt.vi: Chiếc áo cộc tay

### q2
id: 77ec7d77-0ad3-4ab7-b59e-1e8d4039791d
format: true_false
version: 1
dok: 1
prompt.en: Sunny days are often hot.
prompt.vi: Ngày nắng thường nóng.
image.brief: Dùng lại hình `explore_sunny`. Từ khoá tìm ảnh (EN): sun bright blue sky
image.alt.en: The bright sun in the sky
image.alt.vi: Mặt Trời chói sáng trên trời
answer: true
hint.en: Think how sunshine feels on your skin.
hint.vi: Em nghĩ xem nắng chiếu lên da thấy thế nào nhé.
explanation_correct.en: Yes! So we wear a hat outside.
explanation_correct.vi: Đúng rồi! Vì thế ra nắng mình đội nón.
explanation_wrong.en: This is true. Sunny days are often hot.
explanation_wrong.vi: Câu này đúng. Ngày nắng thường nóng.
feedback_false.en: Sunshine warms the road and the yard.
feedback_false.vi: Nắng làm đường và sân nóng lên.
> DOK 1: nhớ lại câu chính ô "Sunny". Gợi ý trỏ tới cảm giác quen, không bảo bé nhìn lên trời.

### q3
id: fb4f0d94-44c9-449b-ad57-fe743a3ac7e9
format: single_choice
version: 1
dok: 1
prompt.en: Which picture shows a rainy day?
prompt.vi: Hình nào là trời mưa?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for water falling from the sky.
hint.vi: Em tìm hình có nước đang rơi xuống nhé.
explanation_correct.en: Yes! Heavy rain is falling there.
explanation_correct.vi: Đúng rồi! Ở đó mưa đang rơi rất to.
explanation_wrong.en: The answer is the heavy rain. Water is falling.
explanation_wrong.vi: Đáp án là hình mưa to. Nước mưa đang rơi.
> Ba ảnh trời khác nhau rõ bằng mắt: mưa trắng xoá, trời xanh có Mặt Trời, mây trắng xen mây xám chưa mưa. Đáp án là ảnh bé vừa xem ở Học; ảnh mây (`q3_cloudy`) là ảnh mới của bài, nhưng là lựa chọn sai, nên đáp án không phải ảnh mới duy nhất.

#### option q3_sunny
correct: false
feedback.en: This sky is blue and bright.
feedback.vi: Bầu trời này xanh và sáng.
label.en: sunny sky
label.vi: trời nắng
image.brief: Dùng lại hình `explore_sunny`. Từ khoá tìm ảnh (EN): sun bright blue sky
image.alt.en: The bright sun in the sky
image.alt.vi: Mặt Trời chói sáng trên trời

#### option q3_cloudy
correct: false
feedback.en: Grey clouds, but no raindrops yet.
feedback.vi: Có mây xám, nhưng chưa có giọt mưa nào.
label.en: cloudy sky
label.vi: trời nhiều mây
image.brief: Dùng lại hình `explore_cloudy` ở bài `thoi-tiet-va-thien-tai/nang-mua-gio-may`. Từ khoá tìm ảnh (EN): cloudy sky grey white clouds countryside
image.alt.en: White and grey clouds over the fields
image.alt.vi: Mây trắng và mây xám trên cánh đồng
> Hình của nhóm Discoverer (CC BY 2.0): **chép mục** sang chủ đề này, đặt tên `q3_cloudy` (không trùng `explore_cloudy` của bài này). Hình của từ `cloudy`; bài 2 w1 dùng lại.

#### option q3_rainy
correct: true
label.en: heavy rain
label.vi: mưa to
image.brief: Dùng lại hình `explore_rainy`. Từ khoá tìm ảnh (EN): heavy rain house garden
image.alt.en: Heavy rain falling
image.alt.vi: Mưa to đang rơi

### q4
id: 18617641-84c3-42b1-8d77-2ac19786000f
format: single_choice
version: 1
dok: 2
prompt.en: Which day is best for drying clothes?
prompt.vi: Ngày nào phơi quần áo mau khô nhất?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of wet clothes on the line.
hint.vi: Em nghĩ tới quần áo ướt phơi trên dây nhé.
explanation_correct.en: Yes! Warm sunshine dries clothes fast.
explanation_correct.vi: Đúng rồi! Nắng ấm làm quần áo mau khô.
explanation_wrong.en: The answer is the sunny day. Sunshine dries clothes.
explanation_wrong.vi: Đáp án là ngày nắng. Nắng làm quần áo mau khô.
> DOK 2: áp điều đã học (ví dụ ba ô "Sunny": "wet clothes dry fast") vào việc nhà quen thuộc. Hai lựa chọn, hai ảnh trời khác hẳn nhau.

#### option q4_rainy
correct: false
feedback.en: Rain makes the clothes wet again.
feedback.vi: Mưa làm quần áo ướt thêm.
label.en: rainy day
label.vi: ngày mưa
image.brief: Dùng lại hình `explore_rainy`. Từ khoá tìm ảnh (EN): heavy rain house garden
image.alt.en: Heavy rain falling
image.alt.vi: Mưa to đang rơi

#### option q4_sunny
correct: true
label.en: sunny day
label.vi: ngày nắng
image.brief: Dùng lại hình `explore_sunny`. Từ khoá tìm ảnh (EN): sun bright blue sky
image.alt.en: The bright sun in the sky
image.alt.vi: Mặt Trời chói sáng trên trời

### q5
id: 01dc9a0a-833f-4742-8949-954eda06bf38
format: true_false
version: 1
dok: 2
prompt.en: A scarf is good for a hot day.
prompt.vi: Khăn len hợp với ngày nắng nóng.
image.brief: Dùng lại hình `tray_scarf`. Từ khoá tìm ảnh (EN): knitted wool scarf
image.alt.en: A knitted scarf
image.alt.vi: Chiếc khăn len
answer: false
hint.en: Think how a scarf feels on your neck.
hint.vi: Em nghĩ xem quàng khăn len thì cổ thấy thế nào nhé.
explanation_correct.en: A scarf keeps us warm on cold days.
explanation_correct.vi: Khăn len giữ ấm cho mình vào ngày lạnh.
explanation_wrong.en: This is false. A scarf is for cold days.
explanation_wrong.vi: Câu này sai. Khăn len dùng cho ngày lạnh.
feedback_true.en: A wool scarf is thick and warm.
feedback_true.vi: Khăn len dày và ấm.
> DOK 2: áp ý "mặc theo thời tiết" (ý chính ba) vào một món đồ, ngược với kiểu thời tiết. Câu khẳng định, không chữ phủ định. `explanation_correct` đứng một mình được.

### q6
id: 623f9fc2-6964-46bc-9958-698f63190ddd
format: true_false
version: 1
dok: 2
misconception: sun_gone_when_cloudy
prompt.en: On cloudy days, the Sun goes away.
prompt.vi: Trời nhiều mây là Mặt Trời đi mất.
image.brief: Dùng lại hình `explore_cloudy`. Từ khoá tìm ảnh (EN): sun behind clouds
image.alt.en: Sunbeams through the clouds
image.alt.vi: Tia nắng xuyên qua mây
answer: false
hint.en: Think of daylight on a cloudy day.
hint.vi: Em nghĩ tới ánh sáng ban ngày khi trời nhiều mây nhé.
explanation_correct.en: The Sun is still there, behind the clouds.
explanation_correct.vi: Mặt Trời vẫn ở đó, sau những đám mây.
explanation_wrong.en: This is false. The Sun is behind the clouds.
explanation_wrong.vi: Câu này sai. Mặt Trời ở sau những đám mây.
feedback_true.en: Sunbeams still shine through the clouds.
feedback_true.vi: Tia nắng vẫn lọt qua những đám mây.
> Câu misconception (`sun_gone_when_cloudy`), bằng hình, DOK 2: bé còn nghĩ "mây che là Mặt Trời đi mất" sẽ chạm gật đầu. Câu chỉ kiểm một việc: Mặt Trời còn ở đó không khi trời nhiều mây. Không nói ngày, đêm.
> Hình là nắng hắt sau mây (đúng vật được nói tới); `explanation_correct` là đúng câu `correction` ở `_topic.md`, đứng một mình cho thẻ "Ý sai → Ý đúng".
> Gợi ý trỏ tới ánh sáng ban ngày (trời vẫn sáng dù nhiều mây), không bảo bé nhìn lên trời; `feedback_true` nói tia nắng trong hình, không lặp ý gợi ý.

## Từ vựng

### weather
id: 2fa91ac7-6b86-432a-a7a0-93cb7d296308
tier: core
term.en: weather
term.vi: thời tiết
example.en: What is the weather like today?
example.vi: Hôm nay thời tiết thế nào?
image.brief: Dùng lại hình `explore_cloudy`. Từ khoá tìm ảnh (EN): sun behind clouds
image.alt.en: Sunbeams through the clouds
image.alt.vi: Tia nắng xuyên qua mây

### sunny
id: adc961d7-6e08-474e-b08f-1c23e4a6a27e
tier: core
term.en: sunny
term.vi: trời nắng
example.en: It is sunny, so I wear a hat.
example.vi: Trời nắng nên em đội nón.
image.brief: Dùng lại hình `explore_sunny`. Từ khoá tìm ảnh (EN): sun bright blue sky
image.alt.en: The bright sun in the sky
image.alt.vi: Mặt Trời chói sáng trên trời

### rainy
id: 39914dff-a498-44f4-adfd-8537d2c0d8d6
tier: core
term.en: rainy
term.vi: trời mưa
example.en: On rainy days, the roads get wet.
example.vi: Ngày mưa, đường sá ướt hết.
image.brief: Dùng lại hình `explore_rainy`. Từ khoá tìm ảnh (EN): heavy rain house garden
image.alt.en: Heavy rain falling
image.alt.vi: Mưa to đang rơi

### cloudy
id: 852fe308-f821-41f1-9ec6-0442ae8fd697
tier: extra
term.en: cloudy
term.vi: trời nhiều mây
example.en: On cloudy days, the sky looks grey.
example.vi: Ngày nhiều mây, bầu trời trông xám.
image.brief: Dùng lại hình `q3_cloudy`. Từ khoá tìm ảnh (EN): cloudy sky grey white clouds countryside
image.alt.en: White and grey clouds over the fields
image.alt.vi: Mây trắng và mây xám trên cánh đồng

### raincoat
id: d8012353-2f5c-4cdf-a2ac-7184b152bd73
tier: extra
term.en: raincoat
term.vi: áo mưa
example.en: I put on my raincoat in the rain.
example.vi: Trời mưa, em mặc áo mưa vào.
image.brief: Dùng lại hình `tray_raincoat`. Từ khoá tìm ảnh (EN): yellow raincoat with hood
image.alt.en: A yellow raincoat with a hood
image.alt.vi: Chiếc áo mưa vàng có mũ

## Thưởng

### rainbow_card
id: 250a8c6a-018b-48bc-91d5-6dfae1095535
set: weather
rarity: rare
name.en: Rainbow
name.vi: Cầu vồng
tag.en: After rain, in sunshine
tag.vi: Sau mưa, khi có nắng
fact.en: Rainbows show when sunlight meets raindrops.
fact.vi: Cầu vồng hiện ra khi nắng chiếu vào giọt mưa.
image.brief: [ảnh] Một cầu vồng rõ màu vắt ngang trời trên ruộng khoai nước sau mưa, trời phía sau còn mây xám; ảnh ngang chụp rộng; không thấy đĩa Mặt Trời, không có người, không có xe, không có nhà cao tầng, không có chữ; không phải ảnh ghép hay ảnh chỉnh màu quá mức. Không có ảnh hợp lệ chụp ở Việt Nam; `alt` không nêu tên nơi. Từ khoá tìm ảnh (EN): rainbow field; rainbow over rice field; rainbow countryside
image.alt.en: A rainbow over the fields
image.alt.vi: Cầu vồng trên cánh đồng
> [CẦN KIỂM] Cầu vồng thấy khi vừa có mưa vừa có nắng, Mặt Trời ở sau lưng người xem và trước mặt có mưa. `fact` chỉ nói "nắng chiếu vào giọt mưa", không dạy khúc xạ.
> Thẻ mới của bộ `set: weather` (khoá giao diện đã có).

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật (CC0, PD, PDM, CC BY có ghi công). Không hình tự vẽ trong bài này; **không dùng hình tự vẽ** của *Thời tiết và thiên tai* hay *Hô hấp* (áo mưa, khăn len, nón…): một hình vẽ giữa các ảnh sẽ lộ đáp án.
- **Ảnh mới (chín):** `explore_cloudy` (nắng hắt sau mây, không chói), `explore_cold` (áo phao trên móc, nền tối), `tray_scarf` (khăn len), `tray_raincoat` (áo mưa vàng có mũ, hai tay áo, trải trên cỏ; đổi 18/11), `tray_tshirt` (áo cộc tay trơn), `tray_boots` (đôi ủng cao su), `tray_pillow` (gối trơn), `tray_ball` (những quả bóng cao su nhiều màu; đổi 18/11), `rainbow_card` (cầu vồng trên ruộng khoai nước). Tám ảnh đầu là **hình gốc của cả chủ đề** (bảng Hình dùng chung ở `_topic.md`): giữ đúng key và `alt`; `alt` của `tray_pillow` do bài này đặt ("A soft pillow" · "Chiếc gối mềm"), bài 6 chép theo.
- **Đồ vật không có người mặc** (Quy ước hình số hai): áo, khăn, nón, ủng treo trên móc, đặt trên bàn hay nền trơn; không nhãn hiệu, không chữ in, không bao bì. Bốn món áo quần trên kệ nên cùng kiểu chụp (nền trơn sáng), để không món nào nổi bật.
- **Chép mục từ Discoverer** (`same_as` không sang nhóm tuổi khác): `be-mat-trai-dat/nui-lua` `q3_sun` → `explore_sunny`; `be-mat-trai-dat/nui-lua` `q1_rain` → `explore_rainy`; `thoi-tiet-va-thien-tai/nang-mua-gio-may` `explore_cloudy` → `q3_cloudy`. Giữ `alt` gốc và ghi công.
- **Dùng lại trong Explorer:** `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha` `w1` (hàng rào tre: hình câu w1, q1, q3, q4) và `w1_hat` (nón lá, kệ Chơi); `goi-ten-va-nhom-dong-vat/chim-va-bo-sat` `tray_penguin` (w2); `noi-song-tren-trai-dat/bac-cuc` `explore_ice` (w1, `alt` riêng "Ice floating on the sea" · "Băng trôi trên mặt biển"); `noi-song-tren-trai-dat/sa-mac` `explore_sahara` (w1). Không dùng `sinh-vat-song-o-dau/vat-song-hay-khong-song` `q1_ball` nữa (ảnh có chữ nhãn hiệu; 18/11).
- **Mặt Trời:** chỉ `explore_sunny` có đĩa Mặt Trời; `explore_cloudy` thấy tia nắng, đĩa Mặt Trời bị mây che, không chói. Không ảnh người nhìn lên trời, không kính râm. Thẻ cầu vồng không thấy Mặt Trời.
- **Không thiên tai:** mưa to không ngập đường; mây không phải mây giông, không sét.
- **Ảnh khó:** `explore_cloudy` cần thấy rõ tia nắng lọt qua mây (từ khoá "crepuscular rays"); ảnh tia nắng đẹp thường có đĩa Mặt Trời lộ ra, chọn ảnh mây che kín đĩa. Nón lá `w1_hat` là ảnh "Nón lá đồ chơi": kiểm cỡ trên kệ 1:1, nếu trông như đồ chơi thì báo phiên chính để tìm ảnh nón lá thật.
- **Màu:** Học: nắng `vang_hoe`, nhiều mây `gi_dong`, mưa `cham`, lạnh `nau_dat`. Chơi: trời nắng `vang_hoe`, trời mưa `cham`, trời lạnh `nau_dat`, không dùng khi nắng, mưa hay lạnh `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (weather, sunny, rainy). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Sai). Quiz `single_choice` (q1, q3 ba lựa chọn; q4 hai lựa chọn), `true_false` (q2 Đúng, q5 Sai, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`sun_gone_when_cloudy`). Không có `labels` ở câu `true_false`.
- **Màn Chơi, ví dụ để kiểm:** Nón lá, Áo mưa, Áo khoác ấm → `balanced`; Áo cộc tay, Ủng cao su, Khăn len → `balanced`; Nón lá, Áo mưa, Cái gối → `has_limited`; Nón lá, Áo cộc tay, Áo mưa → `missing.tray_cold`; Quả bóng, Áo mưa, Khăn len → `has_limited`.
- **Khởi động trỏ sang chủ đề khác:** w1 → `noi-song-tren-trai-dat/bac-cuc`, w2 → `goi-ten-va-nhom-dong-vat/chim-va-bo-sat` (hai bài đã có id).
- **Thẻ thưởng:** `rainbow_card`, bộ `weather` (đã có khoá giao diện; không thêm khoá).
- **Từ EN có thể ngoài Starters/Movers:** weather, sunny, cloudy, rainy, raincoat, scarf, rubber boots, puddles, croak, sunbeams, conical hat, pillow, Arctic, Sahara, penguin. Nghe thử giọng EN đọc "Sahara", "sunbeams", "croak"; giọng VI đọc "áo cộc tay", "ủng cao su", "Xa-ha-ra".
