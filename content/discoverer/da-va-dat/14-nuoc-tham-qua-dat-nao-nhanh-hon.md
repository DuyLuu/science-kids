---
id: fb8425d6-7d8b-4c48-9111-464cda4a7b39
topic: da-va-dat
slug: nuoc-tham-qua-dat-nao-nhanh-hon
order: 14
stage: apply
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Soil permeability
vi: Nước thấm qua đất nào nhanh hơn?
> Giữ đúng tên ở `content/syllabus.json` (`rocks-and-soils`, bài số mười bốn). Chữ "permeability" chỉ ở tiêu đề EN theo danh mục; chữ cho trẻ trong bài không dùng "độ thấm" (bảng Tên gọi).

## Mục tiêu
en: I can run a fair test with soil and water.
vi: Em làm được một thí nghiệm công bằng với đất và nước.
> Trạng thái: **nháp do AI soạn (content-editor, người soạn C), chưa duyệt.** Ticket SK-039, ngày 11/11/2026. Mọi dòng `id:` để trống; phiên chính chạy `ids` sau bài 13 (câu w1) và bài 5 (câu w2).
> Oak lesson 14 và 15 gộp (Duy chốt 9/11): lập kế hoạch (ô Lập kế hoạch, Giữ công bằng), làm và đánh giá (ô Kết quả, Làm tốt hơn). Oak gọi là "comparative test"; Discoverer dùng "fair test" · "thí nghiệm công bằng" (syllabus-progression mục 9). Thí nghiệm ảo bằng hình; thí nghiệm thật ở mục Thí nghiệm ở nhà.
> Bài vận dụng (`apply`): bé dùng cỡ hạt (bài 11, 12) để dự đoán và đọc kết quả. Sửa `all_soil_drains_same` ở ý chính ba, ô Kết quả, câu q4, q5 và câu q6 (gắn key, Na chưa đúng). Vế "đất ướt hay khô chỉ do mưa nhiều hay ít" của Oak chạm ở ô Kết quả (đất sét còn ướt lâu) và thẻ thưởng.

## Ý chính
1.en: Pour water through sandy soil and clay soil to compare.
1.vi: Đổ nước qua đất cát và đất sét để so sánh.
2.en: In a fair test, you change only one thing.
2.vi: Trong thí nghiệm công bằng, em chỉ thay đổi một thứ.
3.en: Water goes through big grains faster than tiny grains.
3.vi: Nước đi qua đất hạt to nhanh hơn đất hạt rất nhỏ.
> [CẦN KIỂM] Hạt cát to, khe hở giữa các hạt lớn nên nước qua nhanh; hạt sét rất nhỏ, khe hở rất nhỏ nên nước qua chậm và đất giữ nước lâu (`all_soil_drains_same` ở `_topic.md`).
> Ba ý đi từ việc làm (đổ nước), tới luật của thí nghiệm, tới điều rút ra.

## Khởi động

> Hai câu, đúng bảng Khởi động ở `_topic.md` (bài 14 không có w3). Mọi câu có hình ở câu hỏi; mọi lựa chọn có hình.
> - w1 ôn bài 13 (một ngày trước): con vật giúp đất tốt.
> - w2 ôn bài 5 (khoảng hai tuần trước): có loại đá thấm nước; bắc cầu sang đất thấm nước hôm nay.

### w1
id: d9b739c7-74e3-4635-b23d-ebd0038a9bcd
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/the-nao-la-dat-tot
prompt.en: Which animal helps to keep soil healthy?
prompt.vi: Con vật nào giúp đất tốt?
image.brief: Dùng lại hình `explore_healthy` ở bài `da-va-dat/the-nao-la-dat-tot`. Từ khoá tìm ảnh (EN): healthy vegetable bed dark soil
image.alt.en: Green vegetables in dark soil
image.alt.vi: Luống rau xanh trên đất nâu sẫm
hint.en: Remember the Soil helpers picture in the last lesson.
hint.vi: Em nhớ lại ô Bạn của đất ở bài trước nhé.
explanation_correct.en: Yes! Earthworms dig tunnels and mix the soil.
explanation_correct.vi: Đúng rồi! Giun đất đào đường hầm và xới trộn đất.
explanation_wrong.en: The answer is the earthworm. It mixes the soil.
explanation_wrong.vi: Đáp án là giun đất. Giun đất xới trộn đất.
> Ý, thứ tự lựa chọn và vị trí đáp án (chỗ thứ nhất) đúng bảng Khởi động. VI "giúp đất tốt" (không viết "giúp đất khoẻ" như bảng gợi ý) cho khớp chữ "đất tốt" của bài 13.
> Sâu ăn lá có sức hút (thân dài, mềm, trông giống giun). Ảnh muỗi cùng ảnh nguồn với *Não bộ và giác quan* bài hai, nên đáp án không là ảnh duy nhất bé đã thấy. Ba ảnh là con vật nhỏ chụp gần; ảnh muỗi cắt sát (ghi chú dưới `w1_mosquito`).

#### option w1_earthworm
correct: true
label.en: an earthworm
label.vi: giun đất
image.brief: Dùng lại hình `earthworm` ở bài `da-va-dat/the-nao-la-dat-tot`. Từ khoá tìm ảnh (EN): earthworm on moist soil close up
image.alt.en: An earthworm on damp soil
image.alt.vi: Con giun đất trên đất ẩm

#### option w1_caterpillar
correct: false
label.en: a caterpillar
label.vi: sâu ăn lá
image.brief: [ảnh] Một con sâu xanh đang bò trên chiếc lá có vết gặm, chụp gần; không có tay người, không có chữ. Cùng kiểu chụp gần một con vật nhỏ như hai ảnh kia. Từ khoá tìm ảnh (EN): green caterpillar eating leaf close up
image.alt.en: A green caterpillar on a leaf
image.alt.vi: Con sâu xanh trên chiếc lá

#### option w1_mosquito
correct: false
label.en: a mosquito
label.vi: con muỗi
image.brief: [ảnh] Một con muỗi đậu trên da, cắt sát con muỗi cho cùng cỡ con vật trong khung với giun đất và sâu xanh; cùng ảnh nguồn (CDC, public domain) với ô "To the brain" của *Não bộ và giác quan* bài hai; không thấy máu, không thấy mặt, không có chữ. Từ khoá tìm ảnh (EN): mosquito on human arm skin close up
image.alt.en: A mosquito on an arm
image.alt.vi: Con muỗi đậu trên cánh tay
> Rà chữ tester 11/11 (n12): ảnh gốc là muỗi đậu trên da cánh tay, khác khung hai ảnh kia. Theo hình designer làm 11/11: file chọn ảnh ghi ảnh CDC đó kèm vùng cắt sát con muỗi (mục ảnh riêng, không phải "dùng lại"), nên brief đổi từ "Dùng lại hình" sang `[ảnh]` tả bản đã cắt; `alt` giữ.

### w2
id: 8cb1117b-fa51-478b-8351-a68208cd9196
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/da-nao-tham-nuoc
prompt.en: Some rocks let water soak in.
prompt.vi: Có loại đá cho nước thấm vào.
image.brief: Dùng lại hình `quarry` ở bài `da-va-dat/lam-quen-voi-da`. Từ khoá tìm ảnh (EN): open pit stone quarry terraces
image.alt.en: An open quarry
image.alt.vi: Mỏ đá lộ thiên
answer: true
hint.en: Remember the water test with rocks.
hint.vi: Em nhớ lại bài thử nhỏ nước lên đá nhé.
explanation_correct.en: Yes! Water soaks into sandstone and chalk.
explanation_correct.vi: Đúng rồi! Nước thấm được vào sa thạch và đá phấn.
explanation_wrong.en: This is true. Permeable rocks let water soak in.
explanation_wrong.vi: Câu này đúng. Đá thấm nước cho nước thấm vào bên trong.
> Câu `true_false` dùng đúng chữ EN ở bảng Khởi động và bảng Đúng/Sai (bài 14 w2, Đúng). Hình câu hỏi là mỏ đá (nhiều đá, không thấy nước thấm), không phải bằng chứng.

## Học

> Bốn ô theo hai lesson Oak: lập kế hoạch (Lập kế hoạch, Giữ công bằng), rồi làm và đánh giá (Kết quả, Làm tốt hơn). Bốn hình là bộ "Thí nghiệm chai" (hình gốc `explore_setup`), cùng nét với kệ Chơi.
> Ô Kết quả nói luật cỡ hạt và hình vẽ cặp đất cát, đất sét sau khi đổ nước. Câu q6 hỏi cặp đất vườn, đất cát (bài chưa nói bên nào nhanh hơn), để bé tự áp luật cỡ hạt vào cặp mới (rà chữ tester 11/11, N2).

### explore
id: 1a65819c-2af7-4f75-a5eb-9dabb7fbc058
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_setup
label.en: Plan
label.vi: Lập kế hoạch
color: cham
sentence.en: Ask a question, predict, then get your tools ready.
sentence.vi: Em đặt câu hỏi, dự đoán, rồi chuẩn bị dụng cụ.
image.brief: [hình vẽ] Hình gốc bộ "Thí nghiệm chai": hai nửa chai nhựa trong úp ngược làm phễu, đặt trên hai cốc nhựa trong giống hệt nhau, lót giấy lọc; chai bên trái đựng đất cát vàng nhạt, chai bên phải đựng đất sét nâu xám, cùng một lượng; phía trước là một ca đong nhựa đầy nước, không có vạch số; chưa đổ nước; vẽ ngang, nền kem trơn; không có tay, không có người, không có đồng hồ, không có chữ, không có nhãn. Câu q1, q3 dùng lại; bài 15 (câu w1) dùng lại.
image.alt.en: Two test bottles of soil and a jug of water
image.alt.vi: Hai chai thí nghiệm đựng đất và một ca nước
examples.1.en: Which soil lets water through fastest?
examples.1.vi: Đất nào cho nước qua nhanh nhất?
examples.2.en: make a prediction
examples.2.vi: đưa ra dự đoán
examples.3.en: half bottles and filter paper
examples.3.vi: nửa chai nhựa và giấy lọc
examples.4.en: a measuring jug and a timer
examples.4.vi: ca đong và đồng hồ
> Hình gốc bắt buộc (`_topic.md`: 14 · `explore_setup`). Hình không vẽ đồng hồ, để làm được hình câu hỏi q1 (dụng cụ nào đo thời gian) mà không lộ đáp án.

#### group explore_fair
label.en: Keep it fair
label.vi: Giữ công bằng
color: gi_dong
sentence.en: Change only one thing. Keep everything else the same.
sentence.vi: Em chỉ thay đổi một thứ. Mọi thứ khác giữ nguyên.
image.brief: [hình vẽ] Cùng nét bộ "Thí nghiệm chai": hai chai giống hệt nhau, trước mỗi chai một ca nước cùng mực nước, cạnh mỗi chai một đống đất cùng cỡ (bên trái vàng nhạt, bên phải nâu xám); vẽ ngang, nền kem trơn; không có tay, không có chữ, không có vạch số. Từ fair_test dùng lại.
image.alt.en: Two same bottles, two same jugs, two soils
image.alt.vi: Hai chai giống nhau, hai ca nước giống nhau, hai loại đất
examples.1.en: same amount of soil
examples.1.vi: cùng một lượng đất
examples.2.en: same amount of water
examples.2.vi: cùng một lượng nước
examples.3.en: pour at the same time
examples.3.vi: đổ nước cùng một lúc
examples.4.en: change only the soil
examples.4.vi: chỉ đổi loại đất

#### group explore_results
label.en: Results
label.vi: Kết quả
color: vang_hoe
sentence.en: Big grains let water through fast. Tiny grains are slow.
sentence.vi: Hạt to cho nước qua nhanh. Hạt rất nhỏ thì chậm.
image.brief: [hình vẽ] Cùng nét bộ "Thí nghiệm chai", cùng hai chai như `explore_setup` nhưng sau khi đổ nước: cốc dưới chai đất cát (bên trái) có nhiều nước; cốc dưới chai đất sét (bên phải) chỉ có một ít nước, mặt đất sét còn đọng một lớp nước; cạnh hai chai là một đồng hồ bấm giờ không chữ số; nền kem trơn; không có tay, không có chữ, không có vạch số. Từ result dùng lại.
image.alt.en: Lots of water under one bottle, little under the other
image.alt.vi: Một cốc hứng nhiều nước, cốc kia ít nước
examples.1.en: big grains, big spaces
examples.1.vi: hạt to, khe hở to
examples.2.en: tiny grains, tiny spaces
examples.2.vi: hạt rất nhỏ, khe hở rất nhỏ
examples.3.en: write down what you measure
examples.3.vi: ghi lại điều em đo được
examples.4.en: show it on a bar chart
examples.4.vi: vẽ thành biểu đồ cột
> [CẦN KIỂM] Đất sét giữ nước lâu, mặt đất còn đọng nước (vế "đất ướt hay khô chỉ do mưa" của Oak). `alt` không gọi tên đất của chai nào.

#### group explore_better
label.en: Do it better
label.vi: Làm tốt hơn
color: do_son
sentence.en: Do the test again to check your results.
sentence.vi: Em làm lại thí nghiệm để kiểm tra kết quả.
image.brief: [hình vẽ] Cùng nét bộ "Thí nghiệm chai": hai bàn tay đeo găng làm vườn rót nước từ ca đong vào một chai thí nghiệm, chỉ thấy hai bàn tay, không thấy mặt; nền kem trơn; không có chữ, không có vạch số. Câu q2 dùng lại làm hình câu hỏi.
image.alt.en: Gloved hands pouring water into a test bottle
image.alt.vi: Bàn tay đeo găng rót nước vào chai thí nghiệm
examples.1.en: do it two or three times
examples.1.vi: làm lại hai, ba lần
examples.2.en: measure carefully
examples.2.vi: đo thật cẩn thận
examples.3.en: wear gloves with soil
examples.3.vi: đeo găng tay khi cầm đất
examples.4.en: wash your hands after
examples.4.vi: rửa tay sau khi làm xong
> Ví dụ ba, bốn theo mục An toàn của `_topic.md`. [CẦN KIỂM] khuyến cáo vệ sinh khi trẻ cầm đất.

### new_words
id: 73a5eeb4-14bb-4abb-91be-5e3c43ae49bb
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: fair_test, measure, result

## Chơi

> Bé dựng một thí nghiệm công bằng: chọn một thứ giữ giống nhau ở hai bên, một thứ duy nhất được thay đổi, một thứ cần đo. Đạt khi đủ ba nhóm và không chọn cách làm không công bằng. Chạm hình đã chọn để bỏ ra.
> Cả kệ là hình vẽ (bộ "Thí nghiệm chai"), theo `_topic.md`.
> Ba món bẫy cùng dạng "một bên … hơn", mỗi món làm hai bên khác nhau thêm một thứ. Chúng giống nhóm "Hai bên giống nhau" (cũng nói về nước, chai, đất) nên có sức hút.

### tray
id: 3d7d6a33-7555-4da4-8bfc-f848f0dc9636
type: build_tray
version: 1
prompt.en: Set up a fair test
prompt.vi: Dựng một thí nghiệm công bằng
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find one of each to make a fair test.
messages.start.vi: Em tìm mỗi nhóm một thứ để có thí nghiệm công bằng nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Only one thing changes. That is fair.
messages.balanced.vi: Tuyệt! Chỉ có một thứ thay đổi. Thế là công bằng.
messages.has_limited.en: That makes two things different. It is not fair.
messages.has_limited.vi: Thế là có hai thứ khác nhau. Như vậy chưa công bằng.
messages.missing.tray_same_group.en: You still need something that stays the same.
messages.missing.tray_same_group.vi: Em còn thiếu một thứ giữ nguyên ở hai bên.
messages.missing.tray_change_group.en: You still need the one thing you change.
messages.missing.tray_change_group.vi: Em còn thiếu thứ duy nhất được thay đổi.
messages.missing.tray_measure_group.en: You still need something to measure.
messages.missing.tray_measure_group.vi: Em còn thiếu thứ cần đo.

#### group tray_same_group
label.en: Same for both
label.vi: Hai bên giống nhau
color: cham
role: required

#### group tray_change_group
label.en: The one change
label.vi: Thứ được thay đổi
color: gi_dong
role: required

#### group tray_measure_group
label.en: What we measure
label.vi: Thứ cần đo
color: vang_hoe
role: required

#### group tray_not_fair
label.en: Not fair
label.vi: Không công bằng
color: nau_dat
role: limit
> Nhãn `limit` dạng "Not …" · "Không …", gọi tên loại, không gọi tên món bẫy. Dòng điều kiện sẽ là "Cần đủ Hai bên giống nhau, Thứ được thay đổi, Thứ cần đo · Không công bằng".

#### item tray_same_water
label.en: Same jug of water
label.vi: Cùng một ca nước
group: tray_same_group
image.brief: [hình vẽ] Cùng nét bộ "Thí nghiệm chai": một ca đong nhựa đầy nước, đứng giữa hai chai thí nghiệm, không có vạch số; nền kem trơn; không có tay, không có chữ. Câu q3 dùng lại.
image.alt.en: One jug of water for both bottles
image.alt.vi: Một ca nước dùng cho cả hai chai

#### item tray_sand_clay
label.en: Sandy soil and clay soil
label.vi: Đất cát và đất sét
group: tray_change_group
image.brief: [hình vẽ] Cùng nét bộ "Thí nghiệm chai": hai đống đất nhỏ cạnh nhau, bên trái đất cát vàng nhạt hạt to, bên phải đất sét nâu xám mịn, cùng cỡ; nền kem trơn; không có chữ. Câu q3 dùng lại.
image.alt.en: A pile of sandy soil and a pile of clay
image.alt.vi: Một đống đất cát và một đống đất sét

#### item tray_timer
label.en: Time for the water
label.vi: Thời gian nước chảy hết
group: tray_measure_group
image.brief: [hình vẽ] Cùng nét bộ "Thí nghiệm chai": một chiếc đồng hồ bấm giờ cầm tay, mặt tròn có kim, chỉ có vạch, không có chữ số, không có chữ, không có logo; nền kem trơn; không có tay. Câu q1 và từ measure dùng lại.
image.alt.en: A stopwatch with no numbers
image.alt.vi: Chiếc đồng hồ bấm giờ không có số

#### item tray_more_water
label.en: More water on one side
label.vi: Một bên nhiều nước hơn
group: tray_not_fair
image.brief: [hình vẽ] Cùng nét bộ "Thí nghiệm chai": hai ca đong đặt cạnh nhau, ca bên trái đầy nước, ca bên phải chỉ có một ít nước, không có vạch số; nền kem trơn; không có chữ.
image.alt.en: A full jug and a nearly empty jug
image.alt.vi: Một ca đầy nước và một ca gần cạn

#### item tray_same_bottles
label.en: Two same-size bottles
label.vi: Hai chai cùng cỡ
group: tray_same_group
image.brief: [hình vẽ] Cùng nét bộ "Thí nghiệm chai": hai nửa chai nhựa trong úp ngược, giống hệt nhau về cỡ và dáng, chưa có đất; nền kem trơn; không có chữ, không có nhãn.
image.alt.en: Two bottles the same size
image.alt.vi: Hai chai cùng cỡ

#### item tray_garden_sand
label.en: Garden soil and sandy soil
label.vi: Đất vườn và đất cát
group: tray_change_group
image.brief: [hình vẽ] Cùng khung với `tray_sand_clay`: bên trái đất vườn nâu sẫm có vụn lá, bên phải đất cát vàng nhạt hạt to, cùng cỡ; nền kem trơn; không có chữ. Câu q6 dùng lại làm hình câu hỏi.
image.alt.en: A pile of garden soil and one of sand
image.alt.vi: Một đống đất vườn và một đống đất cát
> Rà chữ tester 11/11 (n13): `alt.en` rút còn chín từ (trước mười một từ), vì câu q6 dùng lại hình này.

#### item tray_drips
label.en: Water that drips out
label.vi: Lượng nước chảy xuống
group: tray_measure_group
image.brief: [hình vẽ] Cùng nét bộ "Thí nghiệm chai": đáy một chai thí nghiệm nhỏ giọt xuống cốc nhựa trong, trong cốc có một ít nước, không có vạch số; nền kem trơn; không có chữ. Câu q3 dùng lại.
image.alt.en: Water dripping into a cup
image.alt.vi: Nước nhỏ giọt xuống cốc

#### item tray_bigger_bottle
label.en: A bigger bottle on one side
label.vi: Một bên chai to hơn
group: tray_not_fair
image.brief: [hình vẽ] Cùng nét bộ "Thí nghiệm chai": hai nửa chai nhựa úp ngược cạnh nhau, chai bên trái to gấp đôi chai bên phải; nền kem trơn; không có chữ, không có nhãn.
image.alt.en: One big bottle and one small bottle
image.alt.vi: Một chai to và một chai nhỏ

#### item tray_wetter_soil
label.en: Wetter soil on one side
label.vi: Một bên đất ướt hơn
group: tray_not_fair
image.brief: [hình vẽ] Cùng nét bộ "Thí nghiệm chai": hai đống đất cát cùng cỡ cạnh nhau, đống bên trái khô màu vàng nhạt, đống bên phải sẫm màu và ướt, có vệt nước loang ra nền; nền kem trơn; không có chữ.
image.alt.en: A dry pile of soil and a wet pile
image.alt.vi: Một đống đất khô và một đống đất ướt

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Bốn format: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, mọi thẻ từ có hình.
> Vị trí đáp án đúng bảng `_topic.md`: q1 chỗ thứ ba; q2 thẻ thứ hai; q3 chỗ thứ hai và thứ ba; q4 chỗ thứ hai; q5 chỗ thứ nhất.
> Không hình lựa chọn nào xuất hiện ở hai câu. Câu q4 là biểu đồ cột trong câu `single_choice` (app 0.1.0 chưa hiện `picture_bar_chart`).

### q1
id: e3311bd3-7051-4e06-937a-dc4f56f84729
format: single_choice
version: 1
dok: 1
prompt.en: Which tool do you use to time the water?
prompt.vi: Em dùng dụng cụ nào để đo thời gian nước chảy?
image.brief: Dùng lại hình `explore_setup`.
image.alt.en: Two test bottles of soil and a jug of water
image.alt.vi: Hai chai thí nghiệm đựng đất và một ca nước
hint.en: Remember the Plan picture.
hint.vi: Em nhớ lại ô Lập kế hoạch nhé.
explanation_correct.en: Yes! A timer measures how long the water takes.
explanation_correct.vi: Đúng rồi! Đồng hồ đo xem nước chảy mất bao lâu.
explanation_wrong.en: The answer is the timer. It measures time.
explanation_wrong.vi: Đáp án là đồng hồ. Đồng hồ đo thời gian.
> Câu nhớ lại ví dụ bốn ô Lập kế hoạch. Hai lựa chọn sai cũng là dụng cụ đo (nhiệt kế đã học ở *Thời tiết* bài hai, thước kẻ), nên có sức hút. Hình câu hỏi `explore_setup` không vẽ đồng hồ.

#### option q1_thermometer
correct: false
label.en: a thermometer
label.vi: nhiệt kế
image.brief: [sơ đồ ghép ảnh] Cắt tấm nhiệt kế từ hình vẽ `explore_thermometer` ở bài `thoi-tiet-va-thien-tai/do-thoi-tiet`, đặt lên nền kem trơn cùng khung với thước kẻ và đồng hồ bấm giờ; không có chữ, không có chữ số.
image.alt.en: A thermometer in the shade
image.alt.vi: Nhiệt kế treo trong bóng râm
> Theo hình designer làm 11/11: hình ghép `b14-q1_thermometer.jpg` (cắt từ hình vẽ của *Thời tiết*), nên brief đổi sang `[sơ đồ ghép ảnh]`. `alt` giữ như hình gốc.

#### option q1_ruler
correct: false
label.en: a ruler
label.vi: thước kẻ
image.brief: [hình vẽ] Một chiếc thước kẻ nhựa trong, chỉ có vạch chia, không có chữ số, không có chữ; nằm chéo trên nền kem trơn; cùng nét và cùng cỡ trong khung như đồng hồ `tray_timer`.
image.alt.en: A ruler with no numbers
image.alt.vi: Chiếc thước kẻ không có số

#### option q1_timer
correct: true
label.en: a timer
label.vi: đồng hồ
image.brief: Dùng lại hình `tray_timer`.
image.alt.en: A stopwatch with no numbers
image.alt.vi: Chiếc đồng hồ bấm giờ không có số

### q2
id: ced310ac-a095-488d-8ab3-050b63fed413
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `explore_better`.
image.alt.en: Gloved hands pouring water into a test bottle
image.alt.vi: Bàn tay đeo găng rót nước vào chai thí nghiệm
sentence.en: A fair test changes {1}.
sentence.vi: Thí nghiệm công bằng thay đổi {1}.
answers: q2_one
hint.en: Remember the Keep it fair picture.
hint.vi: Em nhớ lại ô Giữ công bằng nhé.
explanation_correct.en: Yes! Change one thing. Keep everything else the same.
explanation_correct.vi: Đúng rồi! Em thay đổi một thứ, mọi thứ khác giữ nguyên.
explanation_wrong.en: The answer is one thing. Everything else stays the same.
explanation_wrong.vi: Đáp án là một thứ. Mọi thứ khác giữ nguyên.
> Câu nhớ lại ý chính hai. Câu EN và VI không có chữ "only" · "chỉ", để câu không tự nói đáp án. "Mọi thứ" có sức hút với bé nghĩ thí nghiệm là đổi thật nhiều để xem; "hai thứ" có sức hút vì thí nghiệm có hai chai.
> Ba thẻ là ba hình vẽ khối gỗ đồ chơi (một, hai, nhiều khối), cùng nét, không có chữ số.

#### bank q2_two
label.en: two things
label.vi: hai thứ
image.brief: [hình vẽ] Hai khối gỗ đồ chơi vuông, màu gỗ trơn, đặt cạnh nhau trên nền kem trơn; không có chữ, không có chữ số, không có hình in trên khối; cùng nét, cùng cỡ khối với hai thẻ kia.
image.alt.en: Two wooden blocks
image.alt.vi: Hai khối gỗ

#### bank q2_one
label.en: one thing
label.vi: một thứ
image.brief: [hình vẽ] Cùng nét với `q2_two`: một khối gỗ đồ chơi vuông trên nền kem trơn; không có chữ, không có chữ số.
image.alt.en: One wooden block
image.alt.vi: Một khối gỗ

#### bank q2_all
label.en: everything
label.vi: mọi thứ
image.brief: [hình vẽ] Cùng nét với `q2_two`: một đống nhiều khối gỗ đồ chơi vuông chồng lên nhau trên nền kem trơn; không có chữ, không có chữ số.
image.alt.en: A big pile of wooden blocks
image.alt.vi: Một đống khối gỗ

### q3
id: 74c83e04-0402-40ae-bb8c-962dae147405
format: multi_choice
version: 1
dok: 2
prompt.en: Lan tests which soil holds water best. What must stay the same?
prompt.vi: Lan thử xem đất nào giữ nước tốt nhất. Những thứ nào phải giữ nguyên?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `explore_setup`.
image.alt.en: Two test bottles of soil and a jug of water
image.alt.vi: Hai chai thí nghiệm đựng đất và một ca nước
hint.en: Remember the Keep it fair picture.
hint.vi: Em nhớ lại ô Giữ công bằng nhé.
explanation_correct.en: Yes! Keep the soil and water amounts the same.
explanation_correct.vi: Đúng rồi! Lượng đất và lượng nước phải giữ nguyên.
explanation_wrong.en: The answers are the amount of soil and of water.
explanation_wrong.vi: Đáp án là lượng đất và lượng nước đổ vào.
> DOK 2: áp luật thí nghiệm công bằng vào một câu hỏi mới (đất nào giữ nước tốt nhất). Hai lựa chọn sai có sức hút mạnh: loại đất là thứ được thay đổi; lượng nước chảy xuống là thứ cần đo (sẽ khác nhau). Bốn lựa chọn ứng với ba nhóm phần Chơi, cùng là hình vẽ bộ "Thí nghiệm chai".

#### option q3_kind
correct: false
label.en: the kind of soil
label.vi: loại đất
image.brief: Dùng lại hình `tray_sand_clay`.
image.alt.en: A pile of sandy soil and a pile of clay
image.alt.vi: Một đống đất cát và một đống đất sét

#### option q3_soil
correct: true
label.en: the amount of soil
label.vi: lượng đất
image.brief: [hình vẽ] Cùng nét bộ "Thí nghiệm chai": hai chiếc cốc nhựa trong, mỗi cốc đựng đất đầy tới cùng một mực, một cốc đất cát vàng nhạt, một cốc đất nâu xám; nền kem trơn; không có vạch số, không có chữ.
image.alt.en: Two cups filled with soil to the same level
image.alt.vi: Hai cốc đựng đất cao bằng nhau

#### option q3_water
correct: true
label.en: the amount of water poured in
label.vi: lượng nước đổ vào
image.brief: Dùng lại hình `tray_same_water`.
image.alt.en: One jug of water for both bottles
image.alt.vi: Một ca nước dùng cho cả hai chai

#### option q3_drips
correct: false
label.en: the amount that drips out
label.vi: lượng nước chảy xuống
image.brief: Dùng lại hình `tray_drips`.
image.alt.en: Water dripping into a cup
image.alt.vi: Nước nhỏ giọt xuống cốc

### q4
id: 5451bce6-f12d-4fe4-ab79-3eab7e552760
format: single_choice
version: 1
dok: 2
prompt.en: Mai caught the water from three soils for one minute. Which bar is the sandy soil?
prompt.vi: Mai hứng nước chảy qua ba loại đất trong một phút. Cột nào là đất cát?
image.brief: [hình vẽ] Biểu đồ cột đơn giản có ba cột cùng một màu, đứng trên một đường nằm ngang: cột bên trái cao vừa, cột ở giữa cao nhất, cột bên phải thấp nhất; không có chữ, không có chữ số, không có trục chia vạch, không có hình đất dưới cột; nền kem trơn. Từ data dùng lại.
image.alt.en: A bar chart with three bars
image.alt.vi: Biểu đồ cột có ba cột
hint.en: Remember the Results picture.
hint.vi: Em nhớ lại ô Kết quả nhé.
explanation_correct.en: Yes! Sandy soil let the most water through.
explanation_correct.vi: Đúng rồi! Đất cát cho nhiều nước chảy qua nhất.
explanation_wrong.en: The answer is the middle bar. It is the tallest.
explanation_wrong.vi: Đáp án là cột ở giữa. Cột đó cao nhất.
> DOK 2: đọc biểu đồ và nối với kết quả thí nghiệm (đất cát cho nhiều nước qua nhất, nên cột cao nhất). Cột là lượng nước hứng được trong một phút, không phải thời gian, để "nhiều hơn" khớp với "cao hơn".
> Rút kinh nghiệm *Hô hấp* bài ba (SK-036 N3): ba cột cùng một màu; nhãn lựa chọn gọi theo vị trí trong hình ("the left bar" · "cột bên trái"), không theo màu; câu hỏi không kể tên ba loại đất theo một thứ tự rồi xếp cột khác thứ tự đó.
> Ba lựa chọn là ba bản của cùng biểu đồ, mỗi bản có một vầng sáng vàng nhạt sau một cột (không dùng nét viền); hình câu hỏi là biểu đồ không đánh dấu.
> [CẦN KIỂM] Tỉ lệ ba cột (cát nhiều nhất, đất sét ít nhất).

#### option q4_left
correct: false
label.en: the left bar
label.vi: cột bên trái
image.brief: [hình vẽ] Cùng biểu đồ với hình câu hỏi, có vầng sáng vàng nhạt sau cột bên trái; không có chữ, không có chữ số.
image.alt.en: The chart with the left bar marked
image.alt.vi: Biểu đồ, đánh dấu cột bên trái

#### option q4_middle
correct: true
label.en: the middle bar
label.vi: cột ở giữa
image.brief: [hình vẽ] Cùng biểu đồ với hình câu hỏi, có vầng sáng vàng nhạt sau cột ở giữa; không có chữ, không có chữ số.
image.alt.en: The chart with the middle bar marked
image.alt.vi: Biểu đồ, đánh dấu cột ở giữa

#### option q4_right
correct: false
label.en: the right bar
label.vi: cột bên phải
image.brief: [hình vẽ] Cùng biểu đồ với hình câu hỏi, có vầng sáng vàng nhạt sau cột bên phải; không có chữ, không có chữ số.
image.alt.en: The chart with the right bar marked
image.alt.vi: Biểu đồ, đánh dấu cột bên phải

### q5
id: fa9bde5a-abdc-48d8-9db3-f2311588654e
format: single_choice
version: 1
dok: 2
prompt.en: After rain, our school field has puddles. What should we mix into its soil?
prompt.vi: Sau mưa, sân bóng đất của trường đọng nhiều vũng nước. Nên trộn thêm gì vào đất của sân?
image.brief: [hình vẽ] Một sân bóng đất trống sau cơn mưa, có mấy vũng nước đọng, khung thành nhỏ ở xa, vẽ rộng; không có người, không có biển trường, không có chữ. Theo hình designer làm 11/11: không có ảnh sân đất đọng nước hợp lệ. Từ khoá tìm ảnh (EN): muddy dirt football field puddles after rain
image.alt.en: A dirt field with puddles after rain
image.alt.vi: Sân đất đọng vũng nước sau mưa
hint.en: Think about grain size and water.
hint.vi: Em nghĩ về cỡ hạt và nước nhé.
explanation_correct.en: Yes! Big sand grains let the water through.
explanation_correct.vi: Đúng rồi! Hạt cát to cho nước thấm qua.
explanation_wrong.en: The answer is sand. Its big grains let water through.
explanation_wrong.vi: Đáp án là cát. Hạt cát to cho nước thấm qua.
> DOK 2: áp ý chính ba vào một việc thật ở trường (ví dụ Oak là sân bóng bầu dục lầy, đổi thành sân bóng đất của trường). Hai lựa chọn sai đều là hạt rất nhỏ (đất sét, bùn mịn), có sức hút vì cũng là thành phần của đất.
> Ba hình vẽ đất của bài 11 (cát, đất sét, bùn mịn), cùng nét.
> [CẦN KIỂM] Trộn thêm cát giúp đất sân thoát nước nhanh hơn (cách làm thật còn nhiều việc khác như làm rãnh thoát nước).

#### option q5_sand
correct: true
label.en: sand
label.vi: cát
image.brief: Dùng lại hình `tray_sand` ở bài `da-va-dat/dat-gom-nhung-gi`. Từ khoá tìm ảnh (EN): pile of sand close up grains
image.alt.en: A small pile of sand
image.alt.vi: Một đống cát nhỏ

#### option q5_clay
correct: false
label.en: clay
label.vi: đất sét
image.brief: Dùng lại hình `clay` ở bài `da-va-dat/dat-gom-nhung-gi`. Từ khoá tìm ảnh (EN): lump of wet clay soil
image.alt.en: A lump of soft clay
image.alt.vi: Một khối đất sét dẻo

#### option q5_silt
correct: false
label.en: silt
label.vi: bùn mịn
image.brief: Dùng lại hình `q2_silt` ở bài `da-va-dat/dat-gom-nhung-gi`.
image.alt.en: Smooth silt
image.alt.vi: Lớp bùn mịn
> Theo hình designer làm 11/11: cát và đất sét của bài 11 là hình vẽ, nên bùn mịn dùng lại hình vẽ `q2_silt` (không dùng ảnh `silt`) để ba lựa chọn cùng loại hình.

### q6
id: 187456d1-7ba3-4dde-b27b-859b672f6784
format: true_false
version: 1
dok: 3
misconception: all_soil_drains_same
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: Water goes through garden soil as fast as sand.
statement.vi: Nước thấm qua đất vườn nhanh bằng đất cát.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: false
image.brief: Dùng lại hình `tray_garden_sand`.
image.alt.en: A pile of garden soil and one of sand
image.alt.vi: Một đống đất vườn và một đống đất cát
hint.en: Remember the grains in each soil.
hint.vi: Em nhớ lại hạt của từng loại đất nhé.
explanation_correct.en: Sand has the biggest grains. Water rushes through it.
explanation_correct.vi: Đất cát hạt to nhất nên nước chảy qua nhanh hơn.
explanation_wrong.en: Na is not right. Water goes faster through sand.
explanation_wrong.vi: Na chưa đúng. Nước thấm qua đất cát nhanh hơn.
> Rà chữ tester 11/11 (N2): lời Na cũ ("Water goes through sand and clay at the same speed.") chỉ ở mức DOK 2, vì cặp đất cát và đất sét bé đã gặp ba lần trong bài (ô Kết quả, câu q4, hình `explore_setup`). Lời Na mới là cặp đất vườn và đất cát: có ở kệ Chơi (`tray_garden_sand`) nhưng bài chưa nói bên nào nhanh hơn. Giữ key `all_soil_drains_same`, đáp án Sai. Lệch chữ so với `_topic.md` (mục "Câu sáu, lời Na"), giữ ý. Cả màn mười bảy từ EN.
> DOK 3: bé phải nối "đất vườn có hạt nhỏ, bùn mịn, đất sét và chất hữu cơ" (bài 11, bài 12 từ `loam`) với luật cỡ hạt (ô Kết quả) để bác lời Na.
> [CẦN KIỂM] Đất vườn nhiều hạt nhỏ và chất hữu cơ nên cho nước qua chậm hơn đất cát.
> Giải thích khi đúng không mở đầu bằng "Yes!" (đáp án Sai).

## Từ vựng

### fair_test
id: 39586d2e-415f-41ba-bed7-9b5cda1d6c3e
tier: core
term.en: fair test
term.vi: thí nghiệm công bằng
example.en: In a fair test, only the soil changes.
example.vi: Trong thí nghiệm công bằng, chỉ có loại đất thay đổi.
image.brief: Dùng lại hình `explore_fair`.
image.alt.en: Two same bottles, two same jugs, two soils
image.alt.vi: Hai chai giống nhau, hai ca nước giống nhau, hai loại đất

### measure
id: df0aa767-b1c8-432a-aa6b-519b7001a853
tier: core
term.en: measure
term.vi: đo
example.en: We measure the time with a timer.
example.vi: Em đo thời gian bằng đồng hồ.
image.brief: Dùng lại hình `tray_timer`.
image.alt.en: A stopwatch with no numbers
image.alt.vi: Chiếc đồng hồ bấm giờ không có số

### result
id: cc0425f0-3d85-40a5-98f0-cabd5e65403b
tier: core
term.en: result
term.vi: kết quả
example.en: The result shows sandy soil is the fastest.
example.vi: Kết quả cho thấy nước qua đất cát nhanh nhất.
image.brief: Dùng lại hình `explore_results`.
image.alt.en: Lots of water under one bottle, little under the other
image.alt.vi: Một cốc hứng nhiều nước, cốc kia ít nước

### permeable
id: ee043202-d3f3-464d-b0c5-3151503e829f
tier: extra
term.en: permeable
term.vi: thấm nước
example.en: Sandy soil is very permeable.
example.vi: Đất cát thấm nước rất tốt.
image.brief: Dùng lại hình `sandy_soil` ở bài `da-va-dat/cac-loai-dat-o-viet-nam`. Từ khoá tìm ảnh (EN): sandy soil close up coast grains
image.alt.en: Sandy soil with big grains
image.alt.vi: Đất cát hạt to
> Ôn có chủ ý từ core bài 5 (bảng Từ vựng ở `_topic.md`), nay nói về đất.

### data
id: 72bf033e-21c3-4347-9eeb-03bc9cf09ea5
tier: extra
term.en: data
term.vi: dữ liệu
example.en: We show our data on a bar chart.
example.vi: Em vẽ dữ liệu thành biểu đồ cột.
image.brief: Dùng lại hình `q4`.
image.alt.en: A bar chart with three bars
image.alt.vi: Biểu đồ cột có ba cột

## Thưởng

### paddy_card
id: 72735c89-af5a-4a9a-99c2-a26cd83c062b
set: rocks
rarity: common
name.en: Rice paddy
name.vi: Ruộng lúa
tag.en: Holding water
tag.vi: Giữ nước
fact.en: A rice paddy holds water for weeks. The clay soil underneath lets water through slowly.
fact.vi: Ruộng lúa giữ nước được nhiều tuần. Lớp đất nhiều sét bên dưới cho nước thấm qua rất chậm.
> [CẦN KIỂM] Ruộng lúa giữ nước nhờ lớp đất nhiều sét bên dưới thấm nước rất chậm (`_topic.md`, Bộ thẻ thưởng).
image.brief: [ảnh] Ruộng lúa bậc thang trên đồi ở Việt Nam, các thửa ruộng giữ nước, chụp rộng; không có người, không có chữ; khác ảnh ruộng lúa xanh cao `q2_rice` của *Khủng long*. Từ khoá tìm ảnh (EN): flooded rice paddy young seedlings reflection Vietnam
image.alt.en: Rice terraces in the hills
image.alt.vi: Ruộng lúa bậc thang
> Theo ảnh designer chọn 11/11 (ruộng bậc thang ở Sơn La, CC0; không có ảnh ruộng mới cấy phản chiếu trời ở đồng bằng hợp lệ): brief, `alt` sửa theo ảnh. Chữ thẻ không đổi (ruộng bậc thang cũng giữ nước).

## Ghi chú cho hoạ sĩ

- **Theo hình designer làm 11/11** (file chọn ảnh `content/images/discoverer/da-va-dat/nuoc-tham-qua-dat-nao-nhanh-hon.json`): hình câu hỏi q5 (sân đất đọng nước) là hình vẽ; câu q5 ba lựa chọn là ba hình vẽ đất của bài 11; nhiệt kế câu q1 là hình ghép; ảnh muỗi w1 là ảnh CDC cắt sát.
- **Loại hình:** gần hết là hình vẽ bộ "Thí nghiệm chai" (hình gốc `explore_setup`): bốn ô Học, cả kệ Chơi (chín món), câu q1 (thước kẻ), q2 (khối gỗ), q3 (một hình mới), q4 (biểu đồ), hình câu hỏi q5. Ảnh chụp ở câu w1 (sâu xanh, muỗi cắt sát) và thẻ thưởng. Hình không có chữ, không có chữ số, không có vạch số trên ca, cốc, đồng hồ, thước.
- **Hình tự vẽ (hai mươi ba):**
  - Học (bốn): `explore_setup`, `explore_fair`, `explore_results`, `explore_better`.
  - Chơi (chín): ca nước; hai chai cùng cỡ; đất cát và đất sét; đất vườn và đất cát; đồng hồ bấm giờ; cốc hứng nước nhỏ giọt; hai ca nhiều ít; chai to chai nhỏ; đất khô đất ướt.
  - Quiz (mười): thước kẻ (q1); ba thẻ khối gỗ (q2); hai cốc đất cùng mực (q3); biểu đồ và ba bản đánh dấu (q4); sân đất đọng nước (hình câu hỏi q5).
- **Hình ghép (một):** nhiệt kế câu q1, cắt từ hình vẽ `explore_thermometer` của *Thời tiết* bài hai.
- **Ảnh (ba):** sâu xanh trên lá (w1); muỗi đậu trên da, cắt sát (w1, cùng ảnh nguồn với *Não bộ*); ruộng lúa bậc thang ở Sơn La (thẻ).
- **Dùng lại từ bài khác:** `earthworm`, `explore_healthy` của bài 13; `quarry` của bài 1; `sandy_soil` của bài 12; `tray_sand`, `clay`, `q2_silt` của bài 11.
- **Hình gốc cho bài sau:** `explore_setup` (bắt buộc, bài 15 câu w1).
- **Bộ "Thí nghiệm chai":** hai nửa chai nhựa trong úp ngược làm phễu, giấy lọc trắng, cốc nhựa trong hứng nước, ca đong nhựa trong không vạch số, đồng hồ bấm giờ không chữ số; đất cát vàng nhạt hạt to, đất sét nâu xám mịn, đất vườn nâu sẫm có vụn lá; tay (nếu có) đeo găng làm vườn, không thấy mặt; nền kem trơn, màu chuyển nhẹ, không viền đen.
- **Biểu đồ câu q4:** ba cột cùng một màu, chỉ khác chiều cao (trái vừa, giữa cao nhất, phải thấp nhất); đánh dấu bằng vầng sáng vàng nhạt, không bằng màu cột, không nét viền.
- **Cùng kiểu trong một câu:** w1 ba ảnh con vật nhỏ chụp gần; q1 ba dụng cụ trên nền kem; q2 ba hình khối gỗ; q3 bốn hình bộ "Thí nghiệm chai"; q4 ba bản cùng biểu đồ; q5 ba hình vẽ đất của bài 11.
- **Màu:** Học: Lập kế hoạch `cham`, Giữ công bằng `gi_dong`, Kết quả `vang_hoe`, Làm tốt hơn `do_son`. Chơi: Hai bên giống nhau `cham`, Thứ được thay đổi `gi_dong`, Thứ cần đo `vang_hoe`, nhóm bẫy `nau_dat`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core: fair_test, measure, result).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required` (mỗi nhóm hai món), một nhóm `limit` (ba món), chín món.
  - Khởi động: `single_choice` (w1, ba lựa chọn), `true_false` (w2, Đúng). DOK một. `recall_from.lesson`: `da-va-dat/the-nao-la-dat-tot`, `da-va-dat/da-nao-tham-nuoc`.
  - Quiz: `single_choice` (q1, q4, q5; ba lựa chọn), `fill_blank_bank` (q2, ba thẻ), `multi_choice` (q3, bốn lựa chọn, hai đúng), `true_false` (q6 Sai, `speaker: na`, `misconception: all_soil_drains_same`).
  - Không dùng `picture_bar_chart`: biểu đồ là hình của câu q4 (`single_choice`).
- **Tham chiếu:** chạy `ids` cho bài 5 và bài 13 trước bài này.
- **Vị trí đáp án đúng:** w1 thứ nhất; q1 thứ ba; q2 thẻ thứ hai; q3 thứ hai và thứ ba; q4 thứ hai; q5 thứ nhất.
- **Màn Chơi, ví dụ để kiểm:**
  - mở màn → `start`;
  - Cùng một ca nước, Đất cát và đất sét, Thời gian nước chảy hết → `balanced`;
  - Một bên chai to hơn → `has_limited`;
  - Hai chai cùng cỡ, Cùng một ca nước, Đất vườn và đất cát (thiếu thứ cần đo) → `missing.tray_measure_group`;
  - rồi chạm Lượng nước chảy xuống → `full`; bỏ Hai chai cùng cỡ, đặt Lượng nước chảy xuống → `balanced`.
  - Khay ba chỗ, ba nhóm bắt buộc, nên khi đạt thì mỗi nhóm đúng một món: không thể có hai "thứ được thay đổi" cùng lúc (khớp ý "chỉ đổi một thứ").
- **Số từ EN trên một màn:** Học khoảng ba mươi (mục tiêu 10, hướng dẫn 3, bốn nhãn 8, câu dài nhất 10, ô Từ mới 4). Quiz nhiều chữ nhất: q3 (câu hỏi 12, hướng dẫn 5, bốn nhãn 18), q4 (câu hỏi 16, ba nhãn 9), q6 (mười bảy).
- **Từ EN có thể ngoài Starters/Movers:** từ mới fair test, measure, result, permeable, data; predict, filter paper, measuring jug, timer, stopwatch, grains, drips, puddles, caterpillar, mosquito, paddy, bar chart.
- **Nhãn dài:** "Thời gian nước chảy hết", "Một bên chai to hơn" (món Chơi), "the amount of water poured in" (q3). Nhờ tester xem trên iPhone bề rộng nhỏ nhất.
- **Giọng đọc:** chuỗi VI không có chữ số, không ký hiệu, không dấu "—". "một phút" ở câu q4 viết bằng chữ.
- **Thí nghiệm ở nhà** (chờ schema GĐ 3): hai nửa chai nhựa úp ngược (người lớn cắt, mép cắt sắc), giấy lọc, đất cát và đất vườn, cùng một cốc nước; đeo găng tay, rửa tay sau đó.
