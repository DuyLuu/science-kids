---
id: 62d1b0cf-7e67-4807-83f4-be42ff08b77c
topic: thoi-tiet-va-thien-tai
slug: do-thoi-tiet
order: 2
stage: core
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Measuring the weather
vi: Đo thời tiết: nhiệt kế, đo mưa, hướng gió
> Giữ đúng tên ở `syllabus-lessons.md` và `content/syllabus.json` (`new-weather`, bài số hai). Nghe thử giọng VI đọc dấu hai chấm trong tiêu đề như một chỗ ngắt.

## Mục tiêu
en: I can use tools to measure the weather.
vi: Em biết dùng dụng cụ để đo thời tiết.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-038, ngày 11/11/2026. Mọi dòng `id:` để trống; phiên chính chạy `ids` sau bài một (câu w1 trỏ về bài một).
> Bài sửa `feel_tells_temperature` ở ý chính ba, ô "Cảm giác của mình" và câu q6 (gắn key, Na chưa đúng). Kỹ năng khoa học: đo bằng dụng cụ, đặt dụng cụ đúng chỗ (câu q5), đọc ba ống đo mưa giống nhau (câu q4).
> 14/11 (SK-044, ngân sách chữ Discoverer A2): thêm `feedback` cho mọi lựa chọn sai và `feedback_true/false`; hai lời giải thích còn một câu, bỏ "Yes!" · "Đúng rồi!" và "The answer is…" · "Đáp án là…"; câu hỏi tối đa mười chữ VI, lời Na và câu ô Học một câu tối đa mười hai chữ. Nháp AI.

## Ý chính
1.en: A thermometer measures how hot or cold the air is.
1.vi: Nhiệt kế đo xem không khí nóng hay lạnh tới mức nào.
2.en: A rain gauge measures how much rain falls.
2.vi: Ống đo mưa đo xem mưa rơi xuống nhiều hay ít.
3.en: How we feel can change, so we use tools.
3.vi: Cảm giác nóng lạnh của mình có thể thay đổi, nên mình dùng dụng cụ để đo.
> [CẦN KIỂM] như `feel_tells_temperature` ở `_topic.md`.
> Ba ý đi từ hai dụng cụ cụ thể (nhiệt kế, ống đo mưa) tới lý do phải đo bằng dụng cụ. Hướng gió (ống gió) có ở ô Học thứ ba, phần Chơi và câu q2, q3, nhưng không thành một ý chính, để ba ý đúng luật mỗi câu một ý.

## Khởi động

> Hai câu, đúng bảng Khởi động ở `_topic.md`.
> - w1 ôn bài một (khoảng một ngày trước): dấu hiệu của mưa, ba ảnh từ phần Chơi bài một.
> - w2 ôn *Não bộ và giác quan* bài hai (khoảng một tuần trước): da gửi tin về não. Giải thích khi đúng bắc cầu sang ô "Cảm giác của mình" (da cảm thấy nóng lạnh, nhưng cảm giác có thể khác nhau). Gợi ý đủ để bé chưa học *Não bộ* vẫn làm được.

### w1
id: 497dd7db-4c5a-45b4-9afe-2a305ead5767
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: thoi-tiet-va-thien-tai/nang-mua-gio-may
prompt.en: Which one is a sign that it rained?
prompt.vi: Hình nào là dấu hiệu trời vừa mưa?
image.brief: Dùng lại hình `explore_cloudy` ở bài `thoi-tiet-va-thien-tai/nang-mua-gio-may`. Từ khoá tìm ảnh (EN): cloudy sky grey white clouds countryside
image.alt.en: White and grey clouds over the fields
image.alt.vi: Mây trắng và mây xám trên cánh đồng
hint.en: Remember the game in the last lesson.
hint.vi: Em nhớ lại trò chơi ở bài trước nhé.
explanation_correct.en: Rainwater collects in low spots and makes puddles.
explanation_correct.vi: Nước mưa đọng ở chỗ trũng thành vũng.
explanation_wrong.en: Rain made the puddle on the ground.
explanation_wrong.vi: Nước mưa đọng lại thành vũng.
> Ba ảnh là ba món đúng của ba nhóm khác nhau ở phần Chơi bài một (nắng, gió, mưa); bé phải nhớ món nào thuộc nhóm mưa. Đáp án ở chỗ thứ ba.

#### option w1_shadow
correct: false
feedback.en: A shadow shows the sun is shining.
feedback.vi: Bóng cây cho biết trời đang có nắng.
label.en: a tree's shadow
label.vi: bóng cây trên sân
image.brief: Dùng lại hình `tray_shadow` ở bài `thoi-tiet-va-thien-tai/nang-mua-gio-may`. Từ khoá tìm ảnh (EN): tree shadow sunny ground
image.alt.en: A tree's shadow on the ground
image.alt.vi: Bóng cây in trên mặt đất

#### option w1_kite
correct: false
feedback.en: A kite up high shows the wind.
feedback.vi: Diều bay cao cho biết trời có gió.
label.en: a kite up high
label.vi: cánh diều bay cao
image.brief: Dùng lại hình `tray_kite` ở bài `thoi-tiet-va-thien-tai/nang-mua-gio-may`.
image.alt.en: A bird-shaped kite in the sky
image.alt.vi: Cánh diều hình con chim trên trời

#### option w1_puddle
correct: true
label.en: a puddle
label.vi: vũng nước mưa
image.brief: Dùng lại hình `tray_puddle` ở bài `thoi-tiet-va-thien-tai/nang-mua-gio-may`. Từ khoá tìm ảnh (EN): rain puddle reflection ground
image.alt.en: A puddle after rain
image.alt.vi: Vũng nước sau mưa

### w2
id: c9fd96b1-40ad-42fe-aa35-1c222f4f3ce6
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: nao-bo-va-giac-quan/day-than-kinh-truyen-tin
prompt.en: Nerves carry a message from your skin to your brain.
prompt.vi: Dây thần kinh mang tin từ da em về não.
image.brief: Dùng lại hình `q3_rain` ở bài `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`. Từ khoá tìm ảnh (EN): raindrops on arm skin close up
image.alt.en: Raindrops on an arm
image.alt.vi: Giọt mưa trên cánh tay
answer: true
hint.en: Remember the To the brain card.
hint.vi: Em nhớ lại ô Tin về não nhé.
explanation_correct.en: Your skin feels hot, cold and rain.
explanation_correct.vi: Da em cảm thấy nóng, lạnh và cả mưa rơi.
explanation_wrong.en: Skin sends messages to your brain along nerves.
explanation_wrong.vi: Da gửi tin về não theo dây thần kinh.
feedback_false.en: That is how you feel a mosquito land.
feedback_false.vi: Nhờ vậy em thấy ngay khi muỗi đậu.
> Câu giữ đúng chữ câu của ô `explore_to_brain` bài hai *Não bộ và giác quan* ("Nerves carry a message from your skin to your brain." · "Dây thần kinh mang tin từ da em về não."). Hình câu hỏi là giọt mưa trên cánh tay (lựa chọn đúng "mưa lạnh rơi trên da em" của câu q3 bài đó), không cho thấy dây thần kinh.
> Giải thích khi đúng thêm "nóng, lạnh" để bắc cầu sang ô "Cảm giác của mình" của bài này.

## Học

> Bốn ô:
> - Nhiệt kế (ý chính một), Ống đo mưa (ý chính hai), Hướng gió (ống gió): ba dụng cụ, mỗi ô một cách dùng đúng (treo trong bóng râm, đặt ở chỗ trống, xem vào cùng một giờ);
> - Cảm giác của mình (ý chính ba): cùng một chỗ ngồi, hai bạn thấy nóng lạnh khác nhau; nhiệt kế chỉ một con số cho cả hai.
>
> Ô "Cảm giác của mình" không có ví dụ "chạy xong thấy nóng": câu q6 để bé tự áp dụng sang việc chạy (rút kinh nghiệm SK-036 N2). Ba dụng cụ vẽ cùng nét, vì nhiệt kế và ống đo mưa thật luôn có chữ số trên vạch chia (`_topic.md`, Quy ước hình mục hai).

### explore
id: dfab1f81-0f5f-4109-9121-77559687e30e
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_thermometer
label.en: Thermometer
label.vi: Nhiệt kế
color: do_son
sentence.en: A thermometer shows how hot or cold the air is.
sentence.vi: Nhiệt kế cho biết không khí nóng hay lạnh tới mức nào.
image.brief: [hình vẽ] Một chiếc nhiệt kế treo tường kiểu ống thuỷ tinh có cột chất lỏng màu đỏ, gắn trên tấm gỗ, treo ở cột hiên nhà chỗ có bóng râm, phía sau là khoảng sân nắng; trên thân nhiệt kế chỉ có các vạch chia, không có chữ số, không có chữ, không có nhãn hiệu; không có người. Vẽ gần thực tế, cùng nét với ống đo mưa và ống gió của bài. Kệ Chơi, câu q1, câu q3 bài ba, câu w1 bài năm và từ thermometer dùng lại hình này.
image.alt.en: A thermometer in the shade
image.alt.vi: Nhiệt kế treo trong bóng râm
examples.1.en: the red line goes up when it is hot
examples.1.vi: trời nóng, vạch đỏ dâng lên
examples.2.en: it goes down when it is cold
examples.2.vi: trời lạnh, vạch đỏ tụt xuống
examples.3.en: hang it in the shade
examples.3.vi: treo nhiệt kế ở chỗ bóng râm
examples.4.en: we read the temperature in degrees
examples.4.vi: nhiệt độ đo bằng đơn vị độ
> [CẦN KIỂM] Nhiệt kế đo không khí đặt trong bóng râm, nơi thoáng, cách mặt đất một khoảng; cột chất lỏng màu đỏ là rượu pha màu. Đơn vị độ C: chữ cho trẻ nói "độ", không viết ký hiệu.
> Đây là nhiệt kế đo không khí, không phải cặp nhiệt độ đo sốt. Ô không nhắc cặp nhiệt độ để khỏi lẫn.

#### group explore_rain_gauge
label.en: Rain gauge
label.vi: Ống đo mưa
color: cham
sentence.en: A rain gauge catches rain to show how much fell.
sentence.vi: Ống đo mưa hứng nước để biết mưa nhiều hay ít.
image.brief: [hình vẽ] Một ống đo mưa bằng nhựa trong, thành thẳng, miệng phễu ở trên, gắn trên cột gỗ thấp giữa một khoảng vườn trống, xa cây và mái nhà; trong ống có một ít nước mưa màu xanh nhạt; trên ống chỉ có vạch chia, không có chữ số, không có chữ; không có người. Kệ Chơi, câu w1 bài ba, câu w1 bài năm và từ rain gauge dùng lại hình này.
image.alt.en: A rain gauge in an open garden
image.alt.vi: Ống đo mưa giữa khoảng vườn trống
examples.1.en: put it in an open place
examples.1.vi: đặt ở chỗ trống, không bị che
examples.2.en: more water means more rain
examples.2.vi: nước càng cao là mưa càng nhiều
examples.3.en: check it at the same time each day
examples.3.vi: xem vào cùng một giờ mỗi ngày
examples.4.en: make one from a bottle with a grown-up
examples.4.vi: cùng người lớn làm một ống từ chai nhựa
> [CẦN KIỂM] Lượng mưa đo bằng chiều cao nước (mi-li-mét) trong ống thành thẳng, đặt ở chỗ trống; ống tự làm từ chai nhựa cắt đôi dùng được để so sánh các ngày. Chữ cho trẻ không đưa đơn vị.
> Ví dụ bốn nói "cùng người lớn", vì cắt chai nhựa cần kéo hay dao.

#### group explore_windsock
label.en: Wind direction
label.vi: Hướng gió
color: gi_dong
sentence.en: A windsock shows which way the wind is blowing.
sentence.vi: Ống gió cho biết gió đang thổi về hướng nào.
image.brief: [hình vẽ] Một ống gió bằng vải sọc đỏ trắng trên cột cao giữa bãi cỏ trống, căng phồng và chỉ về một phía; cỏ trên bãi cũng nghiêng cùng phía; trời có mây; không có người, không có chữ, không có máy bay. Kệ Chơi, câu q2, câu q3, câu w1 bài ba, câu w1 bài năm và từ windsock dùng lại hình này.
image.alt.en: A windsock full of wind
image.alt.vi: Ống gió căng phồng
examples.1.en: it fills up with wind
examples.1.vi: có gió thì ống gió phồng lên
examples.2.en: its tail points the way the wind goes
examples.2.vi: đuôi ống gió chỉ theo hướng gió thổi
examples.3.en: a flag shows it, too
examples.3.vi: lá cờ bay cũng cho biết hướng gió
examples.4.en: it hangs down when there is no wind
examples.4.vi: lặng gió thì ống gió rủ xuống
> [CẦN KIỂM] Tên "ống gió" (windsock); miệng ống quay về phía gió thổi tới, đuôi ống chỉ xuôi theo chiều gió thổi đi. Chữ cho trẻ không dùng hướng Đông, Tây, Nam, Bắc.
> Rà chữ tester 11/11 (C1): dòng này trước viết "đuôi ống gió chỉ về phía gió thổi tới (xuôi gió)", tự mâu thuẫn. Nay: miệng hứng gió, đuôi và ngọn cỏ cùng ngả xuôi gió. Chữ trẻ đọc ("its tail points the way the wind goes") vốn đúng, không đổi.
> Ví dụ ba chuẩn bị lựa chọn "lá cờ trên thuyền" ở câu q3 (một tình huống mới).

#### group explore_feelings
label.en: Our feelings
label.vi: Cảm giác của mình
color: vang_hoe
sentence.en: Two people can feel the same air differently.
sentence.vi: Hai người có thể thấy cùng không khí nóng lạnh khác nhau.
image.brief: [hình vẽ] Hai bạn nhỏ ngồi cạnh nhau trên ghế đá trong sân trường, vẽ từ phía sau: một bạn mặc áo khoác, một bạn mặc áo cộc tay đang phe phẩy quạt giấy; trời nhiều mây nhẹ; không vẽ nét mặt, không có chữ, không có logo trên áo, không có biển trường.
image.alt.en: Two children, one in a jacket
image.alt.vi: Hai bạn nhỏ, một bạn mặc áo khoác
examples.1.en: one friend wants a jacket
examples.1.vi: một bạn muốn mặc áo khoác
examples.2.en: one friend wants a fan
examples.2.vi: một bạn muốn quạt cho mát
examples.3.en: after a cool bath, you feel cool
examples.3.vi: tắm nước mát xong, em thấy mát
examples.4.en: the thermometer shows one number for both
examples.4.vi: nhiệt kế chỉ một con số cho cả hai bạn
> [CẦN KIỂM] như `feel_tells_temperature` ở `_topic.md`. Ví dụ ba: tắm nước mát xong da thấy mát hơn dù không khí không đổi.
> Ô không có ví dụ "chạy xong thấy nóng": đó là tình huống mới của câu q6.

### new_words
id: 9e083452-bfea-45c8-8c57-89378f808518
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: thermometer, temperature, rain_gauge

## Chơi

> Bé chuẩn bị một bộ đồ đo thời tiết: một dụng cụ đo nóng lạnh, một dụng cụ đo mưa, một dụng cụ xem hướng gió. Đạt khi đủ ba nhóm và không chọn thứ không dùng để đo. Chạm hình đã chọn để bỏ ra.
> Ba món bẫy đều gần với một nhóm nhưng không đo được gì: phích nước nóng (nóng), cái ô (mưa), quạt bàn (gió). Lời nhắn `has_limited` nói đúng lý do cho cả ba.
> Nhóm "Nóng hay lạnh" chỉ có một món (nhiệt kế), hai nhóm kia mỗi nhóm hai món: cố ý, vì không có dụng cụ đo nóng lạnh thứ hai dễ hiểu với trẻ. Kệ lệch 1-2-2 như bài hai *Não bộ và giác quan* (tester 10/11 đã xem).
> Cả kệ là hình vẽ (`_topic.md`, Quy ước hình mục hai). Quạt bàn vẽ riêng cho bài này, không dùng lại ảnh quạt của bài một, để kệ chỉ có một loại hình.

### tray
id: 1dc76c8e-cf0a-4976-8ae2-cf55091ca106
type: build_tray
version: 1
prompt.en: Pack a weather kit
prompt.vi: Chuẩn bị bộ đồ đo thời tiết
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick one tool each for heat, rain and wind.
messages.start.vi: Em chọn một dụng cụ đo nóng lạnh, một cái đo mưa và một cái xem hướng gió nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Now you can measure the weather.
messages.balanced.vi: Tuyệt! Giờ em đo được thời tiết rồi.
messages.has_limited.en: That one does not measure anything.
messages.has_limited.vi: Thứ đó không dùng để đo.
messages.missing.tray_heat.en: You still need a tool for hot and cold.
messages.missing.tray_heat.vi: Em còn thiếu dụng cụ đo nóng lạnh.
messages.missing.tray_rain.en: You still need a tool for rain.
messages.missing.tray_rain.vi: Em còn thiếu dụng cụ đo mưa.
messages.missing.tray_wind.en: You still need a tool for the wind.
messages.missing.tray_wind.vi: Em còn thiếu dụng cụ xem hướng gió.

#### group tray_heat
label.en: Hot or cold
label.vi: Nóng hay lạnh
color: vang_hoe
role: required

#### group tray_rain
label.en: How much rain
label.vi: Mưa nhiều hay ít
color: cham
role: required

#### group tray_wind
label.en: Wind direction
label.vi: Hướng gió
color: gi_dong
role: required

#### group tray_not
label.en: Does not measure
label.vi: Không dùng để đo
color: do_son
role: limit
> Nhãn `limit` gọi tên loại ("không dùng để đo"), không gọi tên món bẫy. Dòng điều kiện sẽ là "Cần đủ Nóng hay lạnh, Mưa nhiều hay ít, Hướng gió · Không dùng để đo".

#### item tray_fan
label.en: Desk fan
label.vi: Quạt bàn
group: tray_not
image.brief: [hình vẽ] Một chiếc quạt bàn có lồng quạt và cánh quạt, đứng trên mặt bàn gỗ, vẽ chéo phía trước; cùng nét với các món khác trên kệ; không có logo, không có chữ, không có người. Câu q1 dùng lại hình này.
image.alt.en: A desk fan
image.alt.vi: Cái quạt bàn
> Quạt thổi ra gió nhưng không cho biết gió ngoài trời thổi về hướng nào.

#### item tray_thermometer
label.en: Thermometer
label.vi: Nhiệt kế
group: tray_heat
image.brief: Dùng lại hình `explore_thermometer`.
image.alt.en: A thermometer in the shade
image.alt.vi: Nhiệt kế treo trong bóng râm

#### item tray_umbrella
label.en: Umbrella
label.vi: Cái ô
group: tray_not
image.brief: [hình vẽ] Một chiếc ô màu trơn đang mở, đặt nghiêng trên sân gạch, vẽ chéo; không có chữ, không có hình in, không có người. Câu q3, câu q3 bài ba dùng lại hình này.
image.alt.en: An open umbrella
image.alt.vi: Chiếc ô đang mở
> Ô che mưa nhưng không đo được mưa nhiều hay ít.

#### item tray_windsock
label.en: Windsock
label.vi: Ống gió
group: tray_wind
image.brief: Dùng lại hình `explore_windsock`.
image.alt.en: A windsock full of wind
image.alt.vi: Ống gió căng phồng

#### item tray_bottle
label.en: Bottle rain gauge
label.vi: Ống đo mưa làm từ chai
group: tray_rain
image.brief: [hình vẽ] Một chai nhựa trong được cắt đôi, phần trên úp ngược làm phễu, thân chai dán một dải băng dính có vạch đều, đặt giữa sân trống; trong chai có một ít nước mưa; không có chữ số, không có nhãn chai, không có chữ, không có người.
image.alt.en: A rain gauge made from a bottle
image.alt.vi: Ống đo mưa làm từ chai nhựa

#### item tray_flask
label.en: Hot water flask
label.vi: Phích nước nóng
group: tray_not
image.brief: [hình vẽ] Một chiếc phích nước nóng kiểu Việt Nam, vỏ màu trơn, nắp gỗ, đặt trên bàn, một làn hơi mỏng ở miệng phích; không có hoa văn thành chữ, không có nhãn hiệu, không có chữ, không có người. Câu q1 dùng lại hình này.
image.alt.en: A hot water flask
image.alt.vi: Chiếc phích nước nóng
> Phích giữ nước nóng nhưng không đo được không khí nóng hay lạnh.

#### item tray_ribbon
label.en: Ribbon on a stick
label.vi: Dải ruy băng buộc trên que
group: tray_wind
image.brief: [hình vẽ] Một que tre cắm xuống bãi cỏ, đầu que buộc một dải ruy băng đỏ dài đang bay căng xuôi theo chiều gió, cùng phía với đuôi ống gió ở ô Hướng gió và với ngọn cỏ; không có người, không có tay, không có chữ.
image.alt.en: A red ribbon blowing on a stick
image.alt.vi: Dải ruy băng đỏ bay trên que tre
> Dụng cụ xem hướng gió bé tự làm được.

#### item tray_rain_gauge
label.en: Rain gauge
label.vi: Ống đo mưa
group: tray_rain
image.brief: Dùng lại hình `explore_rain_gauge`.
image.alt.en: A rain gauge in an open garden
image.alt.vi: Ống đo mưa giữa khoảng vườn trống

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Bốn format: `single_choice` (q1, q4), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q5, q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, mọi thẻ từ có hình.
> Vai của hình (`_topic.md`, Quy ước hình mục bảy): nhiệt kế đúng ở phần Chơi và câu q1; ống gió đúng ở phần Chơi và câu q3; phích, quạt sai ở phần Chơi và câu q1; ô sai ở phần Chơi và câu q3. Ống đo mưa không là lựa chọn ở câu nào, nên không có hình dụng cụ nào vừa đúng vừa sai. Không hai câu nào dùng chung một hình lựa chọn.

### q1
id: 991b0303-bd50-476e-a48e-4af64e06d890
format: single_choice
version: 1
dok: 1
prompt.en: Which one measures how hot the air is?
prompt.vi: Thứ nào đo được không khí nóng hay lạnh?
image.brief: Dùng lại hình `q3_sun` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): sun bright blue sky
image.alt.en: The bright sun in the sky
image.alt.vi: Mặt Trời chói sáng trên trời
hint.en: Which one changes when the air gets hotter?
hint.vi: Thứ nào thay đổi khi không khí nóng lên?
explanation_correct.en: Its red line goes up as the air warms.
explanation_correct.vi: Vạch đỏ dâng lên khi không khí ấm hơn.
explanation_wrong.en: A thermometer measures how hot or cold the air is.
explanation_wrong.vi: Nhiệt kế đo không khí nóng hay lạnh.
> Câu nhớ lại ý chính một. Hai lựa chọn sai đều có sức hút vì nói về nóng, mát (phích nước nóng, quạt bàn), nhưng không đo được gì. Ba hình vẽ cùng nét; nhiệt kế là hình ô Học, hai hình kia là món của phần Chơi, nên không hình nào lạ hơn. Đáp án ở chỗ thứ hai.

#### option q1_flask
correct: false
feedback.en: A flask keeps water hot, but measures nothing.
feedback.vi: Phích giữ nước nóng, nhưng không đo được gì.
label.en: hot water flask
label.vi: phích nước nóng
image.brief: Dùng lại hình `tray_flask`.
image.alt.en: A hot water flask
image.alt.vi: Chiếc phích nước nóng

#### option q1_thermometer
correct: true
label.en: wall thermometer
label.vi: nhiệt kế treo tường
> Rà chữ tester 11/11 (n2): nhãn cũ "thermometer" · "nhiệt kế" là nhãn một từ duy nhất cạnh hai nhãn sai hai, ba từ. Nay hai từ, đúng hình (nhiệt kế treo ở cột hiên).
image.brief: Dùng lại hình `explore_thermometer`.
image.alt.en: A thermometer in the shade
image.alt.vi: Nhiệt kế treo trong bóng râm

#### option q1_fan
correct: false
feedback.en: A fan cools you, but measures nothing.
feedback.vi: Quạt làm mát, nhưng không đo được gì.
label.en: desk fan
label.vi: quạt bàn
image.brief: Dùng lại hình `tray_fan`.
image.alt.en: A desk fan
image.alt.vi: Cái quạt bàn

### q2
id: 21f54aca-4f5b-4259-8904-726ceae1b455
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `explore_windsock`.
image.alt.en: A windsock full of wind
image.alt.vi: Ống gió căng phồng
sentence.en: A windsock tells us about the {1}.
sentence.vi: Ống gió cho mình biết về {1}.
answers: q2_wind
hint.en: Remember the three tool cards.
hint.vi: Em nhớ lại ba ô về dụng cụ đo nhé.
> Rà chữ tester 11/11 (N5): câu cũ "A windsock shows which way the {1} blows." · "Ống gió cho biết {1} thổi về hướng nào." chỉ hợp văn phạm với thẻ "gió" (chữ "blows", "thổi"). Câu mới đọc xuôi với cả ba thẻ ("about the rain", "về mưa"), bé phải nhớ ống gió dùng để làm gì. (n1): gợi ý cũ "bốn ô về dụng cụ" đếm nhầm, ô thứ tư là "Cảm giác của mình".
explanation_correct.en: The windsock points the way the wind goes.
explanation_correct.vi: Ống gió chỉ theo hướng gió thổi.
explanation_wrong.en: A windsock fills up and points with the wind.
explanation_wrong.vi: Có gió thì ống gió phồng lên, chỉ theo gió.
> Câu nhớ lại ô thứ ba. Ba thẻ là ba ảnh ô Học bài một (gió, mưa, nắng), cùng ảnh chụp, ôn lại cả ba kiểu thời tiết. Thẻ đúng ở chỗ thứ nhất. Hình câu hỏi là ống gió (vật được hỏi), không phải ảnh của thẻ nào.

#### bank q2_wind
label.en: wind
label.vi: gió
image.brief: Dùng lại hình `w1` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): rice field wind waves Vietnam
image.alt.en: Wind blowing over a rice field
image.alt.vi: Gió thổi trên cánh đồng lúa

#### bank q2_rain
label.en: rain
label.vi: mưa
feedback.en: Rain does not puff up a windsock.
feedback.vi: Mưa không làm ống gió phồng lên.
image.brief: Dùng lại hình `q1_rain` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): heavy rain house garden
image.alt.en: Heavy rain falling
image.alt.vi: Mưa to đang rơi

#### bank q2_sun
label.en: sun
label.vi: nắng
feedback.en: Sunshine does not make a windsock move.
feedback.vi: Nắng không làm ống gió lay động.
image.brief: Dùng lại hình `q3_sun` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): sun bright blue sky
image.alt.en: The bright sun in the sky
image.alt.vi: Mặt Trời chói sáng trên trời
> Câu q1 dùng ảnh này làm hình câu hỏi (không phải lựa chọn), nên không mang vai đúng hay sai ở đó.

### q3
id: f1f66f53-6662-4f7a-92e6-2a78a60c85cb
format: multi_choice
version: 1
dok: 2
prompt.en: Which ones show which way the wind blows?
prompt.vi: Những thứ nào cho biết gió thổi về hướng nào?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `w1_sky` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): sky blue clear clouds
image.alt.en: A blue sky
image.alt.vi: Bầu trời xanh
hint.en: Remember the Wind direction card.
hint.vi: Em nhớ lại ô Hướng gió nhé.
explanation_correct.en: A boat flag helps fishers know where the wind blows.
explanation_correct.vi: Lá cờ giúp người đi thuyền biết hướng gió.
explanation_wrong.en: The windsock and the flag point with the wind.
explanation_wrong.vi: Ống gió và lá cờ bay theo hướng gió.
> DOK 2: lá cờ trên thuyền là tình huống mới (ô Học chỉ nói "lá cờ bay cũng cho biết hướng gió"). Hai lựa chọn sai có sức hút: kim đồng hồ cũng "chỉ" về một phía; cái ô gắn với thời tiết. Đáp án ở chỗ thứ hai và thứ tư.

#### option q3_umbrella
correct: false
feedback.en: An umbrella keeps rain off, but it points nowhere.
feedback.vi: Cái ô để che mưa, không chỉ hướng gió.
label.en: umbrella
label.vi: cái ô
image.brief: Dùng lại hình `tray_umbrella`.
image.alt.en: An open umbrella
image.alt.vi: Chiếc ô đang mở

#### option q3_windsock
correct: true
label.en: windsock
label.vi: ống gió
image.brief: Dùng lại hình `explore_windsock`.
image.alt.en: A windsock full of wind
image.alt.vi: Ống gió căng phồng

#### option q3_clock
correct: false
feedback.en: A clock tells the time, not the wind.
feedback.vi: Đồng hồ chỉ giờ, không chỉ hướng gió.
label.en: wall clock
label.vi: đồng hồ treo tường
image.brief: Dùng lại hình `tray_clock` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`. Từ khoá tìm ảnh (EN): wall clock no numbers minimalist
image.alt.en: A wall clock
image.alt.vi: Chiếc đồng hồ treo tường
> Rà chữ tester 11/11 (n3): bốn nhãn EN cùng khuôn danh từ trơn, không giới từ: "umbrella", "windsock", "wall clock", "boat flag" (trước "flag on a boat"). Nhãn VI giữ.
> Theo hình designer 11/11: dùng lại hình vẽ đồng hồ (mặt chỉ có vạch) của *Não bộ*, trỏ thẳng hình gốc; không vẽ riêng. Câu w1 bài ba cũng trỏ về hình gốc đó.

#### option q3_flag
correct: true
label.en: boat flag
label.vi: lá cờ trên thuyền
image.brief: [hình vẽ] Một chiếc thuyền gỗ nhỏ neo trên sông, trên cột thuyền có một lá cờ vải đỏ trơn bay căng xuôi theo chiều gió, như đuôi ống gió ở ô Hướng gió; mặt nước gợn cùng chiều; không có hình, không có ngôi sao hay chữ trên cờ, không có người, không có số trên thuyền.
image.alt.en: A red flag on a small boat
image.alt.vi: Lá cờ đỏ trên chiếc thuyền nhỏ
> Lá cờ trơn, không có hình, để không thành quốc kỳ của nước nào.

### q4
id: 190582e5-c605-4739-9cf5-4b12b921ff74
format: single_choice
version: 1
dok: 2
prompt.en: Which gauge shows the day with the most rain?
prompt.vi: Ống nào cho thấy ngày mưa nhiều nhất?
image.brief: [hình vẽ] Ba ống đo mưa giống hệt nhau (cùng kiểu với hình ô Ống đo mưa) đứng thẳng hàng trên một bậc gỗ ngoài vườn; nước trong ống bên trái cao vừa, ống ở giữa thấp nhất, ống bên phải cao nhất; ba ống cùng màu, nước cùng màu xanh nhạt; trên ống chỉ có vạch chia, không có chữ số, không có chữ; không có người. Ba lựa chọn và từ measure dùng lại hình này.
image.alt.en: Three rain gauges in a row
image.alt.vi: Ba ống đo mưa xếp thành hàng
hint.en: More water in the gauge means more rain.
hint.vi: Nước trong ống càng cao, mưa càng nhiều.
explanation_correct.en: Three same gauges make the comparison fair.
explanation_correct.vi: Ba ống giống nhau nên so sánh mới công bằng.
explanation_wrong.en: The right gauge holds the most water, so most rain.
explanation_wrong.vi: Ống bên phải có nhiều nước nhất, tức mưa nhiều nhất.
> 14/11 (ngân sách A2): câu hỏi cũ hai câu, mười ba từ EN, mười bốn chữ VI; nay một câu chín từ EN, tám chữ VI. Ý "mỗi ống hứng mưa của một ngày" nằm trong chữ "ngày" của câu hỏi và ở hình.
> DOK 2: đọc kết quả đo. Ba ống giống hệt nhau, nên so sánh là công bằng (nối với ô Ống đo mưa: xem vào cùng một giờ, cùng một kiểu ống). Câu hỏi không kể tên ba ngày, để thứ tự ống không gài bẫy (rút kinh nghiệm SK-036 N3a).
> Nhãn theo vị trí trong hình (trái, giữa, phải), không theo màu (SK-036 N3b). Đáp án ở chỗ thứ ba.

#### option q4_left
correct: false
feedback.en: The water in the left gauge is only medium.
feedback.vi: Nước trong ống bên trái chỉ cao vừa.
label.en: left gauge
label.vi: ống bên trái
image.brief: [hình vẽ] Cùng hình câu q4; ống bên trái giữ màu nước xanh đậm, hai ống kia nhạt màu xám; không có chữ, không có mũi tên.
image.alt.en: The gauges, with the left one marked
image.alt.vi: Ba ống đo mưa, đánh dấu ống bên trái

#### option q4_middle
correct: false
feedback.en: The middle gauge has the least water.
feedback.vi: Ống ở giữa có ít nước nhất.
label.en: middle gauge
label.vi: ống ở giữa
image.brief: [hình vẽ] Cùng hình câu q4; ống ở giữa giữ màu nước xanh đậm, hai ống kia nhạt màu xám; không có chữ, không có mũi tên.
image.alt.en: The gauges, with the middle one marked
image.alt.vi: Ba ống đo mưa, đánh dấu ống ở giữa

#### option q4_right
correct: true
label.en: right gauge
label.vi: ống bên phải
image.brief: [hình vẽ] Cùng hình câu q4; ống bên phải giữ màu nước xanh đậm, hai ống kia nhạt màu xám; không có chữ, không có mũi tên.
image.alt.en: The gauges, with the right one marked
image.alt.vi: Ba ống đo mưa, đánh dấu ống bên phải

### q5
id: 60290809-652b-4655-aab1-5cd7371dcccb
format: true_false
version: 1
dok: 2
prompt.en: A rain gauge works well under a big tree.
prompt.vi: Đặt ống đo mưa dưới cây to vẫn đo đúng.
image.brief: [hình vẽ] Mai đứng quay lưng về phía người xem, đang đặt một ống đo mưa xuống đất dưới tán một cây bàng to, lá dày che kín phía trên; chỉ thấy tóc, lưng và tay Mai, không vẽ nét mặt; không có chữ.
image.alt.en: Mai puts a gauge under a big tree
image.alt.vi: Mai đặt ống đo mưa dưới gốc cây to
answer: false
hint.en: Remember where to put a rain gauge.
hint.vi: Em nhớ lại nên đặt ống đo mưa ở đâu nhé.
explanation_correct.en: Put the gauge in an open place, away from trees.
explanation_correct.vi: Em đặt ống ở chỗ trống, xa cây cối.
explanation_wrong.en: Leaves stop some rain falling into the gauge.
explanation_wrong.vi: Lá cây che bớt nước mưa rơi vào ống.
feedback_true.en: Thick leaves catch rain before it reaches the gauge.
feedback_true.vi: Lá dày hứng bớt mưa trước khi rơi vào ống.
> DOK 2: vận dụng ví dụ "đặt ở chỗ trống" vào một chỗ đặt cụ thể. Câu khẳng định, đáp án Sai. Hình cho thấy tình huống (đặt dưới tán cây), không cho thấy trong ống có ít nước.
> [CẦN KIỂM] Tán cây che bớt mưa và nhỏ giọt không đều, nên đo sai.
> Giải thích khi đúng không mở đầu bằng "Yes!" (đáp án Sai).

### q6
id: 07dc16e4-dc26-463f-898f-6eb80bf5b849
format: true_false
version: 1
dok: 3
misconception: feel_tells_temperature
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
image.brief: Dùng lại hình `explore_faster` ở bài `ho-hap/tho-khi-chay-nhay`. Từ khoá tìm ảnh (EN): children silhouettes playing sunset
image.alt.en: Children playing at sunset
image.alt.vi: Các bạn nhỏ chơi đùa lúc hoàng hôn
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: I feel hot after running, so the air got hotter.
statement.vi: Chạy xong mình thấy nóng, vậy không khí nóng lên rồi.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: false
hint.en: Remember the Our feelings card.
hint.vi: Em nhớ lại ô Cảm giác của mình nhé.
explanation_correct.en: A thermometer shows the air, not how Na feels.
explanation_correct.vi: Nhiệt kế cho biết không khí, không phải cảm giác của Na.
explanation_wrong.en: Na's body got hot from running, not the air.
explanation_wrong.vi: Cơ thể Na nóng lên vì chạy, không phải không khí.
feedback_true.en: Running warms Na's body, while the air stays the same.
feedback_true.vi: Chạy làm người Na nóng, còn không khí vẫn vậy.
> Lời Na, hình và đáp án Sai đúng như `_topic.md` (mục "Câu sáu, lời Na" và bảng Đáp án Đúng/Sai).
> DOK 3: bé đánh giá một kết luận rút ra từ cảm giác. Ô "Cảm giác của mình" dạy cảm giác có thể khác nhau (áo khoác, quạt, tắm mát); bé phải tự áp dụng sang việc chạy, và nhận ra cần nhiệt kế mới biết không khí. Nối với *Hô hấp* bài ba (chạy nhảy làm cơ thể vận động mạnh); hình là ảnh chạy chơi của bài đó.
> [CẦN KIỂM] Sau khi chạy, cơ thể nóng lên và đổ mồ hôi; nhiệt độ không khí không đổi vì mình chạy.
> Giải thích khi đúng không mở đầu bằng "Yes!", vì bé vừa chọn "Na chưa đúng".

## Từ vựng

### thermometer
id: 1f519b87-80a6-483f-86c0-e64acaac7ea6
tier: core
term.en: thermometer
term.vi: nhiệt kế
example.en: A thermometer shows how hot the air is.
example.vi: Nhiệt kế cho biết không khí nóng tới mức nào.
image.brief: Dùng lại hình `explore_thermometer`.
image.alt.en: A thermometer in the shade
image.alt.vi: Nhiệt kế treo trong bóng râm

### temperature
id: e1c9b21c-606f-4c2c-9b57-2ef3dd3a39e9
tier: core
term.en: temperature
term.vi: nhiệt độ
example.en: The temperature goes up on hot days.
example.vi: Ngày nóng, nhiệt độ lên cao.
image.brief: Dùng lại hình `q3_sun` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): sun bright blue sky
image.alt.en: The bright sun in the sky
image.alt.vi: Mặt Trời chói sáng trên trời
> Nghe thử giọng EN đọc "temperature".

### rain_gauge
id: 3b033e13-8253-4416-a774-28273f6de0f0
tier: core
term.en: rain gauge
term.vi: ống đo mưa
example.en: Our rain gauge caught lots of rain today.
example.vi: Hôm nay ống đo mưa của lớp em hứng được nhiều nước.
image.brief: Dùng lại hình `explore_rain_gauge`.
image.alt.en: A rain gauge in an open garden
image.alt.vi: Ống đo mưa giữa khoảng vườn trống
> Nghe thử giọng EN đọc "gauge".

### windsock
id: 06f27e58-274c-4b21-8007-c808d0916df6
tier: extra
term.en: windsock
term.vi: ống gió
example.en: The windsock points the way the wind blows.
example.vi: Ống gió chỉ theo hướng gió thổi.
image.brief: Dùng lại hình `explore_windsock`.
image.alt.en: A windsock full of wind
image.alt.vi: Ống gió căng phồng

### measure
id: 1d62aab0-3ece-4155-9d0f-d29b7b635b5b
tier: extra
term.en: measure
term.vi: đo
example.en: We measure the rain every morning.
example.vi: Sáng nào lớp em cũng đo lượng mưa.
image.brief: Dùng lại hình `q4`.
image.alt.en: Three rain gauges in a row
image.alt.vi: Ba ống đo mưa xếp thành hàng

## Thưởng

### weather_box
id: 4dd6530e-e23e-4415-9b15-ffc942d51dd9
set: weather
rarity: common
name.en: Weather box
name.vi: Lều khí tượng
tag.en: Measuring
tag.vi: Đo thời tiết
fact.en: Weather stations keep thermometers in a white box. Air gets in, but sunshine does not.
fact.vi: Trạm khí tượng đặt nhiệt kế trong một chiếc lều gỗ màu trắng. Không khí lọt vào được, còn nắng thì không chiếu vào.
> [CẦN KIỂM] Lều khí tượng (Stevenson screen) bằng gỗ sơn trắng, có khe chớp cho không khí lưu thông, che nắng và mưa cho nhiệt kế; đặt cao cách mặt đất. Chuyên môn xác nhận tên gọi "lều khí tượng" và cách nói cho trẻ.
image.brief: [ảnh] Một chiếc lều khí tượng bằng gỗ sơn trắng, có các khe chớp ở thành, đặt trên chân cao giữa bãi cỏ của một trạm khí tượng, chụp ngang cả lều; không có người, không có biển chữ, không có số. Từ khoá tìm ảnh (EN): Stevenson screen weather station
image.alt.en: A white weather box on legs
image.alt.vi: Lều khí tượng màu trắng trên chân cao

## Ghi chú cho hoạ sĩ

- **Loại hình:** dụng cụ đo là hình tự vẽ, vì nhiệt kế và ống đo mưa thật luôn có chữ số trên vạch chia, mà hình không được có chữ số (`_topic.md`, Quy ước hình mục hai). Vì vậy ô Học thứ nhất tới thứ tư, cả kệ Chơi, câu q1, q3, q4, q5 là hình vẽ cùng nét. Ảnh chụp chỉ còn ở câu w1 (ba ảnh của bài một), câu q2 (ba ảnh thời tiết), hình câu hỏi q1, q3, q6 và thẻ thưởng.
- **Hình tự vẽ (mười lăm, theo hình designer làm 11/11):**
  - Học (bốn): nhiệt kế treo trong bóng râm; ống đo mưa giữa vườn; ống gió sọc đỏ trắng trên bãi cỏ; hai bạn nhỏ ngồi ghế đá nhìn từ sau, một bạn mặc áo khoác.
  - Chơi (năm): quạt bàn; cái ô đang mở; ống đo mưa làm từ chai nhựa; phích nước nóng kiểu Việt Nam; dải ruy băng đỏ trên que tre.
  - Quiz (sáu): thuyền gỗ có lá cờ đỏ trơn (q3); ba ống đo mưa thẳng hàng và ba bản đánh dấu một ống (q4, bốn hình); Mai đặt ống đo mưa dưới gốc bàng (q5).
  - Đồng hồ treo tường (q3) không vẽ riêng: dùng lại hình vẽ `tray_clock` của *Não bộ*.
- **Ảnh nguồn mới (một):** lều khí tượng sơn trắng (thẻ thưởng, CC0, đã cắt bỏ toà nhà).
- **Dùng lại:** từ bài một `explore_cloudy`, `tray_shadow`, `tray_puddle`, `tray_kite` (w1); từ *Hô hấp* `vi-sao-ta-phai-tho/w1` (q2), `tho-khi-chay-nhay/explore_faster` (q6); từ *Não bộ* `day-than-kinh-truyen-tin/q3_rain` (w2), `nao-dieu-khien-co-the/tray_clock` (q3); từ *Bề mặt Trái Đất* `nui-lua/q3_sun` (q1, q2, từ `temperature`), `nui-lua/q1_rain` (q2), `cac-chau-luc-va-dai-duong/w1_sky` (q3). Trong bài: ba hình dụng cụ của ô Học (kệ Chơi, q1, q2, q3, từ vựng), `tray_fan`, `tray_flask` (q1), `tray_umbrella` (q3), hình câu q4 (từ `measure`).
- **Bài khác dùng lại hình của bài này:** bài một kệ Chơi (`tray_fan`); bài ba câu w1 (`explore_windsock`, `explore_rain_gauge`), câu q3 (`explore_thermometer`, `tray_umbrella`); bài năm câu w1 (`explore_thermometer`, `explore_rain_gauge`, `explore_windsock`; thêm khi sửa theo rà chữ tester 11/11, n10).
- **Vẽ dụng cụ:**
  - Nhiệt kế, ống đo mưa, ống chai nhựa, ba ống ở câu q4: chỉ có vạch chia đều, không có chữ số, không có chữ "mm" hay "độ".
  - Ống gió: sọc đỏ trắng, căng phồng; miệng ống hứng gió, đuôi chỉ xuôi theo chiều gió, cỏ trên bãi ngả cùng phía với đuôi (rà chữ tester 11/11, C1: dòng cũ "đuôi chỉ về phía gió thổi tới" là sai chiều).
  - Ba hình có gió của bài cùng một chiều: đuôi ống gió, dải ruy băng trên que (`tray_ribbon`), lá cờ trên thuyền (`q3_flag`) đều bay xuôi gió.
  - Câu q4: ba ống giống hệt nhau về cỡ, màu, vạch chia; chỉ khác chiều cao nước (trái vừa, giữa thấp nhất, phải cao nhất). Ba bản lựa chọn giữ màu nước xanh đậm ở một ống, hai ống kia xám nhạt; không dùng màu khác nhau để phân biệt ba ống.
- **Không có chữ:** đồng hồ không chữ số; phích, quạt, ô không có logo, hoa văn thành chữ; lá cờ trơn, không có ngôi sao.
- **Người trong hình:** hai bạn ở ô "Cảm giác của mình" và Mai ở câu q5 vẽ từ phía sau, không vẽ nét mặt.
- **Các lựa chọn trong một câu cùng khung, cùng kiểu:** w1 ba ảnh của bài một; q1 ba đồ vật vẽ cùng nét, cùng cỡ; q2 ba ảnh bầu trời và cánh đồng; q3 bốn vật vẽ cùng nét; q4 ba bản của cùng một hình.
- **Màu:** Học: nhiệt kế `do_son`, ống đo mưa `cham`, hướng gió `gi_dong`, cảm giác `vang_hoe`. Chơi: nóng lạnh `vang_hoe`, mưa `cham`, hướng gió `gi_dong`, nhóm "Không dùng để đo" `do_son`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core: thermometer, temperature, rain_gauge).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required` (1-2-2 món, cố ý), một nhóm `limit`, tám món.
  - Khởi động: `single_choice` (w1, `recall_from.lesson: thoi-tiet-va-thien-tai/nang-mua-gio-may`), `true_false` (w2 Đúng, `recall_from.lesson: nao-bo-va-giac-quan/day-than-kinh-truyen-tin`, đã có id). DOK một.
  - Quiz: `single_choice` (q1; q4 ba bản của một hình vẽ), `fill_blank_bank` (q2, ba thẻ có hình), `multi_choice` (q3, bốn lựa chọn, hai đúng), `true_false` (q5 Sai; q6 Sai, `speaker: na`).
  - DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3.
  - Câu có `misconception`: q6, key `feel_tells_temperature`.
- **Tham chiếu:** chạy `ids` cho bài một trước bài này.
- **Vị trí đáp án đúng:** w1 thứ ba; q1 thứ hai; q2 thẻ thứ nhất; q3 thứ hai và thứ tư; q4 thứ ba.
- **Màn Chơi, ví dụ để kiểm:**
  - mở màn → `start`;
  - Nhiệt kế, Ống đo mưa, Ống gió → `balanced`;
  - Phích nước nóng → `has_limited`;
  - Ống đo mưa, Ống đo mưa làm từ chai, Dải ruy băng buộc trên que (thiếu nóng lạnh) → `missing.tray_heat`;
  - rồi chạm Nhiệt kế → `full`; bỏ Ống đo mưa làm từ chai, đặt Nhiệt kế → `balanced`.
- **Nhãn dài:** "Ống đo mưa làm từ chai", "Dải ruy băng buộc trên que" (món Chơi), "Mưa nhiều hay ít" (chip nhóm), "đồng hồ treo tường" (q3), "nhiệt kế treo tường" (q1). Nhờ tester xem trên iPhone bề rộng nhỏ nhất.
- **Câu q4** (ba ống đo mưa): đọc hình như câu biểu đồ cột bài ba *Hô hấp*. Nhãn theo vị trí trong hình; VoiceOver đọc `alt` "đánh dấu ống bên phải". Nhờ tester xem ba bản lựa chọn đủ khác nhau trên iPhone.
- **Số từ EN trên một màn:** Học khoảng ba mươi tư (mục tiêu 8, hướng dẫn 3, bốn nhãn 7, câu dài nhất 10, ô Từ mới 6), như các chủ đề trước; nếu PM muốn dưới ba mươi thì bỏ tiêu đề "New words". Nhiều chữ nhất ở Quiz là q4 (khoảng hai mươi tám: câu hỏi 13, ba nhãn 6, giải thích sai 9) và q6 (khoảng hai mươi lăm).
- **Từ EN có thể ngoài Starters/Movers:** từ mới thermometer, temperature, rain gauge, windsock, measure; tool, degrees, shade, gauge, flask, ribbon, stick, nerves, message, brain (từ *Não bộ*), jacket, bath, grown-up.
- **Giọng đọc:** EN "thermometer", "gauge", "windsock", "temperature"; VI dấu hai chấm trong tiêu đề. Chuỗi VI không có chữ số, ký hiệu, dấu "—".
- **Asset:** không có audio, `asset` trong markdown.
