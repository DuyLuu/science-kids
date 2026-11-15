---
id: c60a410e-389c-4381-b9db-b4ca9a933487
topic: da-va-dat
slug: nha-dia-chat-lam-gi
order: 15
stage: review
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: How geologists work
vi: Nhà địa chất làm gì?
> Giữ đúng tên ở `content/syllabus.json` (`rocks-and-soils`, bài số mười lăm).

## Mục tiêu
en: I can say what geologists do and why it matters.
vi: Em kể được nhà địa chất làm gì và vì sao việc đó quan trọng.
> Trạng thái: **nháp do AI soạn (content-editor, người soạn C), chưa duyệt.** Ticket SK-039, ngày 11/11/2026. Mọi dòng `id:` để trống; phiên chính chạy `ids` sau bài 1, bài 7 và bài 14 (ba câu Khởi động trỏ ba bài đó).
> Oak lesson 16 (`how-geologists-work`). Bài tổng kết (`review`): Khởi động ôn bài 14, bài 7 và câu "Em nghĩ sao?" của bài 1; Quiz q2 ôn bài 4 (khoáng vật), q3 ôn bài 3 và bài 5 (thử cào, thử nhỏ nước), q5 ôn bài 11 (chất hữu cơ ở lớp đất mặt).
> Bài sửa `geologists_only_earth` ở ý chính ba, ô "Rocks from space", nhóm "In space" ở phần Chơi và câu q6 (gắn key, Na nói đúng). Không đưa Rosaly Lopes, Charles Darwin; búa địa chất chỉ là dụng cụ của người lớn; sạt lở nói nhẹ, không dạy cách giữ an toàn khi mưa bão (*Thời tiết* bài năm).

## Ý chính
1.en: Geologists observe rocks and soil out in the field.
1.vi: Nhà địa chất ra thực địa quan sát đá và đất.
2.en: They help keep people safe from landslides and volcanoes.
2.vi: Họ giúp mọi người an toàn trước sạt lở đất và núi lửa.
3.en: Geologists study rocks from the Moon and Mars, too.
3.vi: Nhà địa chất còn nghiên cứu đá trên Mặt Trăng và Sao Hoả.
> [CẦN KIỂM] Nhà địa chất cảnh báo sạt lở, theo dõi núi lửa, tìm nước ngầm; mẫu đá Mặt Trăng của các chuyến bay A-pô-lô; xe tự hành trên Sao Hoả phân tích đá (`_topic.md`, bài 15).
> Ba ý đi từ việc nhìn thấy được (ra ngoài trời xem đá), tới vì sao việc đó quan trọng (an toàn), tới nơi xa nhất (vũ trụ).

## Khởi động

> Ba câu, đúng bảng Khởi động ở `_topic.md`. Mọi câu có hình ở câu hỏi; mọi lựa chọn có hình.
> - w1 ôn bài 14 (một ngày trước): đất nào cho nước qua nhanh nhất.
> - w2 ôn bài 7 (khoảng một tuần trước): phong hoá.
> - w3 hỏi lại câu "Em nghĩ sao?" của bài 1 (đáp án Sai), không gắn key, để bé tự so với câu trả lời ở bài 1.

### w1
id: 5fa1decf-5def-4429-acfa-0508c2905472
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/nuoc-tham-qua-dat-nao-nhanh-hon
prompt.en: Which soil lets water through fastest?
prompt.vi: Nước chảy qua đất nào nhanh nhất?
image.brief: Dùng lại hình `explore_setup` ở bài `da-va-dat/nuoc-tham-qua-dat-nao-nhanh-hon`.
image.alt.en: Two test bottles of soil and a jug of water
image.alt.vi: Hai chai thí nghiệm đựng đất và một ca nước
hint.en: Remember the Results picture in the last lesson.
hint.vi: Em nhớ lại ô Kết quả ở bài trước nhé.
explanation_correct.en: That is why sandy soil dries fast after rain.
explanation_correct.vi: Vì vậy đất cát mau khô sau mưa.
explanation_wrong.en: Sandy soil has big grains that let water rush through.
explanation_wrong.vi: Đất cát hạt to, nước chảy qua rất nhanh.
> Ý, thứ tự lựa chọn và vị trí đáp án (chỗ thứ hai) đúng bảng Khởi động. Đất vườn có sức hút (cũng là đất, `_topic.md`).
> Hình câu hỏi là hai chai trước khi đổ nước (đúng bảng Hình dùng chung: `explore_setup` cho hình câu w1 bài 15), không cho thấy kết quả.

#### option w1_clay
correct: false
feedback.en: Clay soil has tiny grains, so water is slow.
feedback.vi: Đất sét hạt nhỏ, nước thấm qua chậm.
label.en: clay soil
label.vi: đất sét
image.brief: Dùng lại hình `q4_grey` ở bài `da-va-dat/cac-loai-dat-o-viet-nam`.
image.alt.en: A handful of grey soil
image.alt.vi: Nắm đất màu xám

#### option w1_sandy
correct: true
label.en: sandy soil
label.vi: đất cát
image.brief: Dùng lại hình `q4_pale` ở bài `da-va-dat/cac-loai-dat-o-viet-nam`.
image.alt.en: A handful of pale soil
image.alt.vi: Nắm đất nhạt màu

#### option w1_garden
correct: false
feedback.en: Garden soil has smaller grains than sand.
feedback.vi: Đất vườn có hạt nhỏ hơn đất cát.
label.en: garden soil
label.vi: đất vườn
image.brief: Dùng lại hình `q4_dark` ở bài `da-va-dat/cac-loai-dat-o-viet-nam`.
image.alt.en: A handful of dark soil
image.alt.vi: Nắm đất sẫm màu
> Theo hình designer làm 11/11: đất sét chỉ có hình vẽ, nên ba lựa chọn dùng ba hình vẽ nắm đất của bài 12 câu q4 (`q4_grey`, `q4_pale`, `q4_dark`) cho cùng kiểu, thay cho `clay`, `sandy_soil`, `soil`.
> `alt` của ba lựa chọn sửa so với gốc (gốc tả cả hạt: "grey smooth", "pale … with big grains", "dark crumbly"), chỉ giữ màu: câu hỏi về độ thấm, mà cỡ hạt là lý do của đáp án (Quy ước hình mục năm).

### w2
id: 35dc911a-6ab7-458f-abc1-cbc1925971b1
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/da-bi-bao-mon-theo-thoi-gian
prompt.en: What do we call rain wearing rock in place?
prompt.vi: Mưa làm đá mòn tại chỗ, gọi là gì?
image.brief: Dùng lại hình `ha_long` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): Ha Long Bay aerial islands
image.alt.en: Islands in Ha Long Bay
image.alt.vi: Các hòn đảo ở vịnh Hạ Long
hint.en: Remember lesson seven about rocks changing.
hint.vi: Em nhớ lại bài bảy, đá thay đổi theo thời gian nhé.
explanation_correct.en: Weathering comes first, then erosion carries the bits away.
explanation_correct.vi: Phong hoá làm vỡ trước, rồi xói mòn mang mảnh đi.
explanation_wrong.en: Rock wearing down where it is is weathering.
explanation_wrong.vi: Đá mòn đi ngay tại chỗ là phong hoá.
> Ý (phong hoá), thứ tự lựa chọn (xói mòn · phong hoá · phun trào) và vị trí đáp án (chỗ thứ hai) đúng bảng Khởi động.
> Lệch chữ so với bảng Khởi động ("rễ cây làm nứt đá, đó là gì"): nếu câu hỏi nói "rễ cây" và hình đáp án có rễ cây thì bé chỉ cần tìm hình. Câu hỏi nói về nước mưa làm đá vôi mòn tại chỗ, đúng cảnh "rain wearing down limestone" · "mưa bào mòn đá vôi" mà bài 7 xếp vào phong hoá (câu q3 bài 7).
> Rà chữ tester 11/11 (rà bài 1–8, n13): lựa chọn đúng đổi từ `explore_weathering` (rễ cây, không khớp chữ câu hỏi) sang `tray_rain_limestone` của bài 7 (mặt đá vôi có rãnh do nước mưa); câu hỏi đổi theo hình. Ảnh xói mòn (dòng sông) vẫn có sức hút với chữ "nước", chữ "mòn" của câu VI có sức hút với nhãn "xói mòn"; bé phải dựa vào ý "ngay tại chỗ" để chọn phong hoá.
> Hình câu hỏi là núi đá vôi trên biển (không phải hình của lựa chọn nào). [CẦN KIỂM] Nước mưa làm mặt đá vôi mòn dần tại chỗ là phong hoá (như bài 7).

#### option w2_erosion
correct: false
feedback.en: Erosion carries the broken bits away to new places.
feedback.vi: Xói mòn mang mảnh vụn đi nơi khác.
label.en: erosion
label.vi: xói mòn
image.brief: Dùng lại hình `explore_erosion` ở bài `da-va-dat/da-bi-bao-mon-theo-thoi-gian`. Từ khoá tìm ảnh (EN): muddy river eroded riverbank
image.alt.en: A river with a worn bank
image.alt.vi: Dòng sông có bờ bị lở

#### option w2_weathering
correct: true
label.en: weathering
label.vi: phong hoá
image.brief: [ảnh] Mặt một khối đá vôi xám ngoài trời có nhiều rãnh sâu do nước mưa chảy qua nhiều năm, chụp gần vừa; không có người, không có chữ. Từ khoá tìm ảnh (EN): limestone rain grooves karren
image.alt.en: Grey rock with deep grooves
image.alt.vi: Mặt đá xám có nhiều rãnh sâu
> Theo ảnh designer chọn 11/11: hình `tray_rain_limestone` của bài 7 là hình vẽ, còn hai lựa chọn kia là ảnh, nên lựa chọn này là ảnh riêng cùng nội dung (rãnh đá vôi do nước mưa, CC BY). `alt` giữ như bài 7.

#### option w2_eruption
correct: false
feedback.en: An eruption is lava bursting out of a volcano.
feedback.vi: Phun trào là dung nham trào ra từ núi lửa.
label.en: eruption
label.vi: phun trào
image.brief: Dùng lại hình `explore_erupt` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): volcano erupting lava night distant
image.alt.en: A volcano erupting
image.alt.vi: Núi lửa đang phun trào

### w3
id: 617f2e85-d395-4d80-9595-866dd2620060
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/lam-quen-voi-da
prompt.en: Rocks stay the same forever.
prompt.vi: Đá giữ nguyên mãi mãi.
image.brief: Dùng lại hình `granite` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): granite rock sample
image.alt.en: A grey rock
image.alt.vi: Hòn đá màu xám
answer: false
hint.en: Remember the Natural forces picture.
hint.vi: Em nhớ lại ô Lực tự nhiên nhé.
explanation_correct.en: Rocks change so slowly that we rarely notice it.
explanation_correct.vi: Đá đổi rất chậm, nên ta hiếm khi nhận ra.
explanation_wrong.en: Rocks do change, but very slowly.
explanation_wrong.vi: Đá có thay đổi, nhưng rất chậm.
feedback_true.en: Rain, wind and roots slowly change rocks.
feedback_true.vi: Mưa, gió và rễ cây làm đá đổi khác dần.
> Câu `true_false` dùng đúng chữ EN ở bảng Khởi động và bảng Đúng/Sai (bài 15 w3, Sai); chữ VI theo câu "Em nghĩ sao?" của bài 1 ("Đá giữ nguyên mãi mãi."). Không gắn key (`rocks_never_change`): luật chỉ đếm câu misconception ở Quiz.
> Khi schema có `think_first` (v1.1), app hiện được câu trả lời của bé ở bài 1 cạnh câu trả lời ở câu này.
> Hình câu hỏi là một mẫu đá hoa cương nguyên khối (không nứt, không mòn), không cho thấy bằng chứng. Gợi ý trỏ ô "Natural forces" · "Lực tự nhiên" của bài 7 (đã đối chiếu file bài 7). Giải thích khi đúng không mở đầu bằng "Yes!".

## Học

> Bốn ô, từ việc nhìn thấy được tới nơi xa nhất:
> - Đi thực địa (ý chính một): ra ngoài trời, mang kính lúp, sổ ghi chép, mũ bảo hộ; búa địa chất chỉ người lớn dùng;
> - Mẫu (ý chính một): mang mẫu đá, mẫu đất về thử, như bé đã làm ở bài 3, 5, 11;
> - Giữ an toàn (ý chính hai): theo dõi sườn đồi dễ sạt lở, núi lửa; tìm nước sạch dưới lòng đất;
> - Đá ngoài vũ trụ (ý chính ba): đá Mặt Trăng, xe tự hành trên Sao Hoả. Ô không nói tới hòn đá rơi từ vũ trụ xuống Trái Đất, để câu q6 là tình huống mới.
> Ví dụ của ô Mẫu không có "lọ đất lắng" (câu q3 dùng lọ đất lắng làm lựa chọn sai cho câu hỏi về đá).

### explore
id: 1473c51a-5228-4846-bdda-967626350f22
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_fieldwork
label.en: Fieldwork
label.vi: Đi thực địa
color: cham
sentence.en: Geologists go outside to look closely at rocks.
sentence.vi: Nhà địa chất ra ngoài trời để quan sát kỹ đá.
image.brief: Dùng lại hình `magnifying_glass` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): magnifying glass plain background
image.alt.en: A magnifying glass
image.alt.vi: Chiếc kính lúp
examples.1.en: a magnifying glass
examples.1.vi: kính lúp
examples.2.en: a notebook to write and draw
examples.2.vi: sổ để ghi chép và vẽ
examples.3.en: a hard hat
examples.3.vi: mũ bảo hộ
examples.4.en: a rock hammer, for grown-ups only
examples.4.vi: búa địa chất, chỉ người lớn dùng
> Hình đúng bảng Hình dùng chung (`magnifying_glass` bài 2 dùng lại ở ô "Fieldwork" bài 15).
> Ví dụ bốn theo mục An toàn của `_topic.md`: búa địa chất là dụng cụ của người lớn, không mời bé dùng.

#### group explore_samples
label.en: Samples
label.vi: Mẫu
color: vang_hoe
sentence.en: They bring rock and soil samples back to test.
sentence.vi: Họ mang mẫu đá, mẫu đất về để thử.
image.brief: [hình vẽ] Một khay gỗ chia nhiều ô nhỏ, mỗi ô đựng một mẫu đá khác màu, khác dáng, vẽ từ trên xuống; không có nhãn, không có chữ hay số, không có tay. Theo hình designer làm 11/11: ảnh khay mẫu đá trên Commons đều có nhãn chữ. Câu q2 dùng lại làm hình câu hỏi; từ sample dùng lại. Từ khoá tìm ảnh (EN): rock sample collection tray
image.alt.en: A tray of rock samples
image.alt.vi: Khay đựng các mẫu đá
examples.1.en: a scratch test for hardness
examples.1.vi: thử cào để biết độ cứng
examples.2.en: a water drop test
examples.2.vi: thử nhỏ nước
examples.3.en: look for fossils
examples.3.vi: tìm hoá thạch
examples.4.en: measure and write it down
examples.4.vi: đo rồi ghi lại

#### group explore_safe
label.en: Keeping people safe
label.vi: Giữ an toàn
color: do_son
sentence.en: They watch hills and volcanoes to warn people early.
sentence.vi: Họ theo dõi sườn đồi, núi lửa để báo trước.
image.brief: [ảnh] Một trạm đo đạc đặt trên sườn núi lửa: thiết bị trên chân ba chân, tấm pin mặt trời nhỏ, sườn núi đá phía sau, chụp vừa; không có người, không có chữ hay logo đọc được. Nguồn ưu tiên USGS (public domain). Món `tray_volcano_watch` dùng lại. Từ khoá tìm ảnh (EN): volcano monitoring station USGS
image.alt.en: Science tools on the side of a volcano
image.alt.vi: Thiết bị đo đạc trên sườn núi lửa
examples.1.en: hillsides that may slide
examples.1.vi: sườn đồi dễ sạt lở
examples.2.en: volcanoes that may erupt
examples.2.vi: núi lửa có thể phun trào
examples.3.en: clean water deep underground
examples.3.vi: nước sạch sâu dưới lòng đất
examples.4.en: they warn people early
examples.4.vi: họ báo trước cho mọi người
> Ảnh ô là trạm đo ở núi lửa, không phải sườn đồi sạt lở: ảnh sườn đồi là món `tray_slope` và đáp án câu q4, nên để không là ảnh duy nhất bé đã thấy ở Học.
> [CẦN KIỂM] Nhà địa chất theo dõi sườn đồi dễ sạt lở, theo dõi núi lửa, tìm nước ngầm. Nói nhẹ: không cảnh sạt lở có nhà đổ, không con số.

#### group explore_space
label.en: Rocks from space
label.vi: Đá ngoài vũ trụ
color: gi_dong
sentence.en: Geologists study rocks from the Moon and Mars.
sentence.vi: Nhà địa chất nghiên cứu đá từ Mặt Trăng và Sao Hoả.
image.brief: [ảnh] Ảnh NASA (public domain): một xe tự hành đứng trên mặt đất đỏ cam của Sao Hoả, nhiều đá nhỏ quanh bánh xe, chụp vừa; không có chữ, số hay logo đọc được trên xe; không có hình Trái Đất. Món `tray_rover` dùng lại. Từ khoá tìm ảnh (EN): Mars rover surface rocks NASA
image.alt.en: A rover on the red ground of Mars
image.alt.vi: Xe tự hành trên mặt đất đỏ của Sao Hoả
examples.1.en: astronauts brought Moon rocks home
examples.1.vi: các nhà du hành mang đá Mặt Trăng về
examples.2.en: rovers test rocks on Mars
examples.2.vi: xe tự hành thử đá trên Sao Hoả
examples.3.en: they learn how planets formed
examples.3.vi: họ tìm hiểu các hành tinh hình thành ra sao
> [CẦN KIỂM] Các chuyến bay A-pô-lô mang mẫu đá Mặt Trăng về Trái Đất; xe tự hành trên Sao Hoả phân tích đá tại chỗ. Mặt Trăng, Sao Hoả để dành dạy kỹ ở các chủ đề Scientist (`_topic.md`, Để dành).

### new_words
id: cb0b5574-448c-4317-9884-111c99068744
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: fieldwork, sample, geology

## Chơi

> Bé tìm ba việc của nhà địa chất: một việc trên Trái Đất, một việc giữ an toàn cho mọi người, một việc với đá ngoài vũ trụ. Đạt khi đủ ba nhóm và không chọn việc của người khác. Chạm hình đã chọn để bỏ ra.
> Ba món bẫy có sức hút: đều là việc ngoài trời, gần đất hay gần bầu trời (dự báo thời tiết giống "đo đạc ở núi lửa", ngắm sao giống "ngoài vũ trụ", trồng rau giống "lấy mẫu đất"). Dự báo thời tiết nối *Thời tiết* (`_topic.md`, Không lặp).
> Cả kệ là ảnh chụp (NASA, USGS, ảnh tự do); người chỉ thấy từ phía sau. Nếu món nào phải vẽ thì cả kệ vẽ.

### tray
id: 4f6c087c-3bb6-4e44-a107-cf9128f7c8e8
type: build_tray
version: 1
prompt.en: Find three jobs a geologist does
prompt.vi: Tìm ba việc nhà địa chất làm
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find jobs on Earth, for safety and in space.
messages.start.vi: Em tìm việc trên Trái Đất, việc giữ an toàn và việc ngoài vũ trụ nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Geologists study rocks almost everywhere.
messages.balanced.vi: Tuyệt! Nhà địa chất nghiên cứu đá ở gần khắp nơi.
messages.has_limited.en: Other people do that job. Geologists study rocks and soil.
messages.has_limited.vi: Việc đó do người khác làm. Nhà địa chất nghiên cứu đá và đất.
messages.missing.tray_earth_group.en: You still need a job on Earth.
messages.missing.tray_earth_group.vi: Em còn thiếu một việc trên Trái Đất.
messages.missing.tray_safe_group.en: You still need a job that keeps people safe.
messages.missing.tray_safe_group.vi: Em còn thiếu một việc giữ an toàn cho mọi người.
messages.missing.tray_space_group.en: You still need a job in space.
messages.missing.tray_space_group.vi: Em còn thiếu một việc ngoài vũ trụ.

#### group tray_earth_group
label.en: On Earth
label.vi: Trên Trái Đất
color: cham
role: required

#### group tray_safe_group
label.en: Keeping people safe
label.vi: Giữ an toàn
color: do_son
role: required

#### group tray_space_group
label.en: In space
label.vi: Ngoài vũ trụ
color: vang_hoe
role: required

#### group tray_not_geology
label.en: Not a geologist's job
label.vi: Không phải việc của nhà địa chất
color: nau_dat
role: limit
> Nhãn `limit` dạng "Not …" · "Không …", gọi tên loại, không gọi tên món bẫy. Dòng điều kiện sẽ là "Cần đủ Trên Trái Đất, Giữ an toàn, Ngoài vũ trụ · Không phải việc của nhà địa chất".

#### item tray_rock_layers
label.en: Studying rock layers
label.vi: Xem các lớp đá
group: tray_earth_group
image.brief: [ảnh] Vách đá ven biển có nhiều lớp đá màu khác nhau, chụp vừa; không có người, không có chữ. Từ khoá tìm ảnh (EN): layered rock sea cliff
image.alt.en: Layered rock in a sea cliff
image.alt.vi: Vách đá nhiều lớp ven biển
> Theo ảnh designer chọn 11/11 (vách sa thạch nhiều lớp ở Torrey Pines, CC0): hình `geologist` của bài 4 là hình vẽ, còn kệ bài 15 toàn ảnh chụp, nên món này là ảnh riêng, không có người. Nhãn đổi lại thành "Studying rock layers" · "Xem các lớp đá" cho khớp ảnh (trước: "Studying a rock face" · "Quan sát vách đá"). Hình câu hỏi q1 vẫn là `geologist` của bài 4.

#### item tray_slope
label.en: Watching a hillside
label.vi: Theo dõi sườn đồi
group: tray_safe_group
image.brief: [ảnh] Một sườn đồi dốc phủ cây xanh, giữa sườn có một vệt sạt lở cũ trơ đất nâu, chụp từ rất xa; không có nhà đổ, không có người, không có xe, không có đường bị vùi, không có chữ. Nguồn ưu tiên USGS (public domain). Câu q4 dùng lại. Từ khoá tìm ảnh (EN): landslide scar hillside distant
image.alt.en: A steep hillside with an old landslide
image.alt.vi: Sườn đồi dốc có vết sạt lở cũ
> *Thời tiết* (soạn song song) chưa có ảnh sạt lở lúc soạn bài này (đã xem bài một tới bốn). Nếu bài năm của *Thời tiết* có ảnh sườn đồi sạt lở, phiên chính đổi brief này thành "Dùng lại hình `<key>` ở bài `thoi-tiet-va-thien-tai/<slug>`." (main session 11/11: *Thời tiết* giữ hình gốc).

#### item tray_moon_rock
label.en: Studying Moon rocks
label.vi: Nghiên cứu đá Mặt Trăng
group: tray_space_group
image.brief: [ảnh] Ảnh NASA (public domain): một mẫu đá Mặt Trăng màu xám, đặt trên nền tối hoặc trong hộp kính phòng thí nghiệm, chụp gần; không có nhãn số, không có chữ, không có logo, không có tay. Thẻ `moon_rock_card` dùng lại. Từ khoá tìm ảnh (EN): Apollo lunar sample rock NASA
image.alt.en: A grey rock from the Moon
image.alt.vi: Hòn đá xám từ Mặt Trăng

#### item tray_forecast
label.en: Forecasting the weather
label.vi: Dự báo thời tiết
group: tray_not_geology
image.brief: Dùng lại hình `weather_box` ở bài `thoi-tiet-va-thien-tai/do-thoi-tiet`. Từ khoá tìm ảnh (EN): Stevenson screen weather station
image.alt.en: A white weather box on legs
image.alt.vi: Lều khí tượng màu trắng trên chân cao
> Theo hình designer làm 11/11: dùng lại ảnh lều khí tượng (thẻ `weather_box`) của *Thời tiết* bài hai, cùng nội dung brief cũ; `alt` chép của gốc.

#### item tray_soil_core
label.en: Taking soil samples
label.vi: Khoan lấy mẫu đất
group: tray_earth_group
image.brief: [ảnh] Mấy ống mẫu đất dài đặt trong khay, thấy các lớp đất màu khác nhau, chụp gần; không có người, không có tay, không có nhãn hay chữ, không có giấy bản đồ. Từ geology dùng lại. Từ khoá tìm ảnh (EN): soil core sample layers
image.alt.en: Long tubes of soil in a tray
image.alt.vi: Những ống mẫu đất dài trong khay
> Theo ảnh designer chọn 11/11 (các ống mẫu đất trong khay, CC BY 2.0, đã cắt bỏ người và giấy bản đồ): brief, `alt` sửa theo ảnh.

#### item tray_volcano_watch
label.en: Checking a volcano
label.vi: Đo đạc ở núi lửa
group: tray_safe_group
image.brief: Dùng lại hình `explore_safe`. Từ khoá tìm ảnh (EN): volcano monitoring station USGS
image.alt.en: Science tools on the side of a volcano
image.alt.vi: Thiết bị đo đạc trên sườn núi lửa

#### item tray_telescope
label.en: Watching the stars
label.vi: Ngắm các vì sao
group: tray_not_geology
image.brief: [ảnh] Một kính thiên văn trên chân đỡ ngoài trời lúc chạng vạng, bầu trời có vài ngôi sao, chụp vừa; không có người, không có chữ, không có logo trên kính. Câu q1 dùng lại. Từ khoá tìm ảnh (EN): telescope tripod night sky stars
image.alt.en: A telescope under the night sky
image.alt.vi: Kính thiên văn dưới bầu trời đêm

#### item tray_rover
label.en: Testing rocks on Mars
label.vi: Thử đá trên Sao Hoả
group: tray_space_group
image.brief: Dùng lại hình `explore_space`. Từ khoá tìm ảnh (EN): Mars rover surface rocks NASA
image.alt.en: A rover on the red ground of Mars
image.alt.vi: Xe tự hành trên mặt đất đỏ của Sao Hoả

#### item tray_garden
label.en: Growing vegetables
label.vi: Trồng rau
group: tray_not_geology
image.brief: Dùng lại hình `q6` ở bài `da-va-dat/dat-gom-nhung-gi`. Từ khoá tìm ảnh (EN): vegetable garden beds village Vietnam
image.alt.en: A vegetable garden
image.alt.vi: Góc vườn rau
> Câu q4 dùng lại.

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Bốn format: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, mọi thẻ từ có hình.
> Vị trí đáp án đúng bảng `_topic.md`: q1 chỗ thứ ba; q2 thẻ thứ nhất; q3 chỗ thứ nhất và thứ hai; q4 chỗ thứ nhất (bốn lựa chọn); q5 chỗ thứ ba.
> Ôn trộn: q2 ôn bài 4, q3 ôn bài 3, 5 (và lọ đất bài 11 làm lựa chọn sai), q5 ôn bài 11. Không hình lựa chọn nào xuất hiện ở hai câu (kể cả câu Khởi động).

### q1
id: c99e3b1c-25cf-490a-a94e-06dd1d6dae56
format: single_choice
version: 1
dok: 1
prompt.en: Which tool does a geologist use?
prompt.vi: Nhà địa chất dùng dụng cụ nào?
image.brief: Dùng lại hình `geologist` ở bài `da-va-dat/thang-do-cung-mohs`. Từ khoá tìm ảnh (EN): geologist field work back view rock outcrop
image.alt.en: A geologist looking at rocks
image.alt.vi: Nhà địa chất đang xem đá
hint.en: Remember the Fieldwork picture.
hint.vi: Em nhớ lại ô Đi thực địa nhé.
explanation_correct.en: Only grown-ups use a rock hammer, with safety goggles.
explanation_correct.vi: Chỉ người lớn dùng búa địa chất, có đeo kính bảo hộ.
explanation_wrong.en: A geologist uses a rock hammer to take samples.
explanation_wrong.vi: Nhà địa chất dùng búa địa chất để lấy mẫu đá.
> Câu nhớ lại ví dụ bốn ô Đi thực địa. Kính thiên văn có sức hút (dụng cụ của nhà khoa học); bình tưới có sức hút (dụng cụ làm với đất). Hai hình sai bé đã thấy (kệ Chơi bài này, kệ Chơi bài 11); búa địa chất là hình mới, ô Học chỉ nhắc tên.
> Giải thích nhắc lại "chỉ người lớn dùng" (mục An toàn).

#### option q1_telescope
correct: false
feedback.en: A telescope is for looking at stars far away.
feedback.vi: Kính thiên văn để ngắm sao ở thật xa.
label.en: a telescope
label.vi: kính thiên văn
image.brief: Dùng lại hình `tray_telescope`. Từ khoá tìm ảnh (EN): telescope tripod night sky stars
image.alt.en: A telescope under the night sky
image.alt.vi: Kính thiên văn dưới bầu trời đêm

#### option q1_watering
correct: false
feedback.en: A watering can is for giving plants water.
feedback.vi: Bình tưới dùng để tưới nước cho cây.
label.en: a watering can
label.vi: bình tưới
image.brief: [ảnh] Một bình tưới kim loại đặt trên cỏ, không rót nước, chụp vừa; không có người, không có tay, không có chữ, không có nhãn hiệu. Từ khoá tìm ảnh (EN): watering can on grass
image.alt.en: A watering can
image.alt.vi: Bình tưới nước
> Theo ảnh designer chọn 11/11: hình bình tưới của bài 11 là hình vẽ (kệ vẽ), còn hai lựa chọn kia là ảnh, nên lựa chọn này là ảnh riêng; brief, `alt` theo ảnh.

#### option q1_hammer
correct: true
label.en: a rock hammer
label.vi: búa địa chất
image.brief: Dùng lại hình `rock_hammer`. Từ khoá tìm ảnh (EN): rock hammer geology on rock
image.alt.en: A rock hammer lying on a rock
image.alt.vi: Búa địa chất đặt trên tảng đá

### q2
id: 8745c790-7d29-4758-ae6f-af63328acb5c
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `explore_samples`. Từ khoá tìm ảnh (EN): rock sample collection tray
image.alt.en: A tray of rock samples
image.alt.vi: Khay đựng các mẫu đá
sentence.en: The hardest mineral of all is {1}.
sentence.vi: Khoáng vật cứng nhất là {1}.
answers: q2_diamond
hint.en: Remember the hardness scale in lesson four.
hint.vi: Em nhớ lại thang độ cứng ở bài bốn nhé.
explanation_correct.en: Diamond is number ten, the top of Mohs' scale.
explanation_correct.vi: Kim cương ở bậc mười, cao nhất thang Mohs.
explanation_wrong.en: Diamond is the hardest mineral of all.
explanation_wrong.vi: Kim cương là khoáng vật cứng nhất.
> Ôn bài 4 (khoáng vật, kim cương cứng nhất), đúng ý bảng Khởi động bài 5 ("bài 4 dạy kim cương cứng nhất"). Ba thẻ là ba khoáng vật của chính thang Mohs bài 4 (hoạt thạch mềm nhất, thạch anh, kim cương cứng nhất). Thạch anh có sức hút (cũng rất cứng, lựa chọn sai có sức hút ghi ở `_topic.md`); hoạt thạch có sức hút với bé nhớ nhầm bậc thang.
> Rà chữ tester 11/11 (N1): thẻ `q2_chalk` (đá phấn) đổi thành `q2_talc` (hoạt thạch): đá phấn là đá, không phải khoáng vật (bài 3, bài 4), nên không được đứng trong danh sách khoáng vật.
> Chuỗi VI không có chữ "Mohs" (khỏi cần dòng `READINGS` ở bài này); chuỗi EN giữ "Mohs' scale".
> Ba thẻ là ba ảnh trong Bộ mẫu đá, cùng nền.

#### bank q2_diamond
label.en: diamond
label.vi: kim cương
image.brief: Dùng lại hình `diamond` ở bài `da-va-dat/thang-do-cung-mohs`. Từ khoá tìm ảnh (EN): rough diamond crystal
image.alt.en: A small clear piece
image.alt.vi: Mẩu nhỏ trong suốt

#### bank q2_quartz
label.en: quartz
label.vi: thạch anh
feedback.en: Quartz is hard, but something is harder.
feedback.vi: Thạch anh cứng, nhưng còn thứ cứng hơn.
image.brief: Dùng lại hình `quartz` ở bài `da-va-dat/thang-do-cung-mohs`. Từ khoá tìm ảnh (EN): white quartz crystal
image.alt.en: A white piece
image.alt.vi: Mẩu màu trắng

#### bank q2_talc
label.en: talc
label.vi: hoạt thạch
feedback.en: Talc is the softest mineral on the scale.
feedback.vi: Hoạt thạch là khoáng vật mềm nhất.
image.brief: Dùng lại hình `tray_talc` ở bài `da-va-dat/thang-do-cung-mohs`. Từ khoá tìm ảnh (EN): talc mineral sample
image.alt.en: A pale cream piece
image.alt.vi: Mẩu màu trắng ngà
> `alt` của ba thẻ chép đúng khuôn mới của bài 4 ("A <màu> piece" · "Mẩu <màu>", người A sửa theo tester N5): chỉ tả màu, không tả độ cứng (Quy ước hình mục năm). [CẦN KIỂM] tên "hoạt thạch" theo sách (bảng Tên gọi).

### q3
id: becb4081-748d-419a-ab9e-78731681ad1f
format: multi_choice
version: 1
dok: 2
prompt.en: Which tests show hardness and if water soaks in?
prompt.vi: Cách thử nào cho biết đá cứng, có thấm nước?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `tray_dark_rock` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): basalt vesicular rock sample
image.alt.en: A dark rock with tiny holes
image.alt.vi: Hòn đá sẫm màu có lỗ nhỏ
hint.en: Remember the Samples picture.
hint.vi: Em nhớ lại ô Mẫu nhé.
explanation_correct.en: Geologists still use these simple tests in the field.
explanation_correct.vi: Nhà địa chất vẫn dùng những cách thử này ngoài thực địa.
explanation_wrong.en: Scratch to test hardness, and drop water to test soaking.
explanation_wrong.vi: Cào để thử độ cứng, nhỏ nước để thử độ thấm.
> A2 (SK-043, 14/11): câu hỏi cũ mười sáu chữ (ba câu), nay mười chữ.
> DOK 2: ghép mỗi câu hỏi về tính chất với cách thử hợp (ôn bài 3, bài 5). Hai lựa chọn sai có sức hút: thử lọ đất lắng là cách thử thật của bài 11 nhưng dành cho đất; thử cân nối `heavy_means_hard` (bài 4: nặng không cho biết cứng).
> Bốn hình vẽ cùng nét (bộ "Bàn tay thử đá" của bài 3, bài 5 và bộ "Lọ đất" của bài 11).

#### option q3_scratch
correct: true
label.en: a scratch test
label.vi: thử cào
image.brief: Dùng lại hình `explore_scratch` ở bài `da-va-dat/da-nao-cung-hon`.
image.alt.en: A fingernail scratching a white rock
image.alt.vi: Móng tay cào lên hòn đá trắng

#### option q3_water
correct: true
label.en: a water drop test
label.vi: thử nhỏ nước
image.brief: Dùng lại hình `explore_water` ở bài `da-va-dat/da-nao-tham-nuoc`.
image.alt.en: A dropper over a rock
image.alt.vi: Ống nhỏ giọt phía trên hòn đá
> Bài 5 đã có hình vẽ này (ô "Water test", bộ "Bàn tay thử đá"; người A báo ở SK-039), nên dùng lại, không vẽ mới (một vật một hình).

#### option q3_jar
correct: false
feedback.en: A jar test sorts out the parts of soil.
feedback.vi: Lọ đất lắng dùng để tách các phần của đất.
label.en: a jar test
label.vi: thử lọ đất lắng
image.brief: Dùng lại hình `explore_jar` ở bài `da-va-dat/dat-gom-nhung-gi`.
image.alt.en: A jar of water with layers of soil
image.alt.vi: Lọ nước có đất lắng thành từng lớp

#### option q3_weigh
correct: false
feedback.en: Weighing tells how heavy, not how hard.
feedback.vi: Cân cho biết nặng nhẹ, không biết độ cứng.
label.en: a weighing test
label.vi: thử cân
image.brief: [hình vẽ] Cùng nét bộ "Bàn tay thử đá": một hòn đá đặt trên chiếc cân đĩa nhà bếp có kim, mặt cân chỉ có vạch, không có chữ số; nền kem trơn; không có tay, không có chữ, không có nhãn hiệu.
image.alt.en: A rock on a kitchen scale
image.alt.vi: Hòn đá đặt trên cân nhà bếp

### q4
id: e36e4d98-4dc4-4423-aea6-26945dea2067
format: single_choice
version: 1
dok: 2
prompt.en: After heavy rain, where should a geologist check first?
prompt.vi: Mưa to nhiều ngày, nên kiểm tra nơi nào trước?
image.brief: Dùng lại hình `q1_rain` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): heavy rain house garden
image.alt.en: Heavy rain falling
image.alt.vi: Mưa to đang rơi
hint.en: Remember the Keeping people safe picture.
hint.vi: Em nhớ lại ô Giữ an toàn nhé.
explanation_correct.en: Soaked soil gets heavy and can slide down steep slopes.
explanation_correct.vi: Đất ngấm nước nặng hơn, dễ trượt xuống sườn dốc.
explanation_wrong.en: After heavy rain, a steep hillside may slide.
explanation_wrong.vi: Sau mưa to, sườn đồi dốc có thể bị sạt lở.
> A2 (SK-043, 14/11): câu hỏi cũ mười sáu chữ (hai câu), nay mười chữ.
> DOK 2: áp ý chính hai vào một tình huống (mưa to nhiều ngày). Ao làng và ruộng lúa có sức hút (cũng đầy nước sau mưa); vườn rau có sức hút (đất). Câu chỉ hỏi việc của nhà địa chất, không dạy cách giữ an toàn khi mưa bão (*Thời tiết* bài năm).
> Ảnh sườn đồi là món kệ Chơi bài này; vườn rau cũng là món kệ Chơi (món bẫy), ao làng và ruộng lúa là ảnh của chủ đề trước, nên đáp án không là ảnh duy nhất bé vừa thấy. Ô Giữ an toàn dùng ảnh trạm đo ở núi lửa, không dùng ảnh sườn đồi.
> [CẦN KIỂM] Mưa lớn kéo dài làm sườn đồi dốc dễ sạt lở.

#### option q4_hillside
correct: true
label.en: a steep hillside
label.vi: sườn đồi dốc
image.brief: Dùng lại hình `tray_slope`. Từ khoá tìm ảnh (EN): landslide scar hillside distant
image.alt.en: A steep hillside with an old landslide
image.alt.vi: Sườn đồi dốc có vết sạt lở cũ

#### option q4_pond
correct: false
feedback.en: A village pond is flat and low, not steep.
feedback.vi: Ao làng nằm thấp, bằng phẳng, ít nguy hiểm.
label.en: a village pond
label.vi: cái ao làng
image.brief: Dùng lại hình `tray_pond` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): pond village lotus leaves
image.alt.en: A small pond with lotus leaves
image.alt.vi: Cái ao nhỏ có lá sen

#### option q4_rice
correct: false
feedback.en: A flat rice field just fills with water.
feedback.vi: Ruộng lúa bằng phẳng, chỉ ngập thêm nước.
label.en: a rice field
label.vi: ruộng lúa
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh

#### option q4_garden
correct: false
feedback.en: A flat garden may get muddy, but it is safe.
feedback.vi: Vườn rau phẳng có thể lầy, nhưng ít nguy hiểm.
label.en: a vegetable garden
label.vi: vườn rau
image.brief: Dùng lại hình `q6` ở bài `da-va-dat/dat-gom-nhung-gi`. Từ khoá tìm ảnh (EN): vegetable garden beds village Vietnam
image.alt.en: A vegetable garden
image.alt.vi: Góc vườn rau

### q5
id: 35211241-2875-40af-b6b9-a62779fdbd92
format: single_choice
version: 1
dok: 2
prompt.en: In a deep garden hole, what is near the top?
prompt.vi: Đào hố sâu trong vườn, gần mặt đất có gì?
image.brief: Dùng lại hình `soil` ở bài `da-va-dat/dat-gom-nhung-gi`. Từ khoá tìm ảnh (EN): hand holding garden soil
image.alt.en: Garden soil in a hand
image.alt.vi: Nắm đất vườn trong lòng bàn tay
hint.en: Remember the Organic matter picture in lesson eleven.
hint.vi: Em nhớ lại ô Chất hữu cơ ở bài mười một nhé.
explanation_correct.en: Rotting leaves make the top layer dark and rich.
explanation_correct.vi: Lá mục làm lớp đất trên sẫm màu, màu mỡ.
explanation_wrong.en: Dark soil with roots lies near the top.
explanation_wrong.vi: Gần mặt đất là lớp đất sẫm màu có rễ cây.
> A2 (SK-043, 14/11): câu hỏi cũ mười tám chữ (hai câu), nay mười chữ.
> Ôn bài 11 (chất hữu cơ): lá rụng xuống mặt đất, rễ cây ở gần mặt, nên lớp đất trên cùng sẫm màu, nhiều chất hữu cơ. Đá liền khối có sức hút (*Bề mặt Trái Đất* bài ba: vỏ Trái Đất là đá rắn), nhưng ở sâu hơn; sỏi nhỏ có sức hút (cũng có trong đất).
> Hình câu hỏi là nắm đất vườn (không cho thấy các lớp). Không dùng `tray_soil_core` (ống mẫu đất thấy các lớp, là bằng chứng).
> [CẦN KIỂM] Lớp đất mặt sẫm màu, nhiều chất hữu cơ; sâu hơn là đất nhạt màu, rồi đá vụn, rồi đá liền khối.

#### option q5_rock
correct: false
feedback.en: Solid rock lies much deeper down.
feedback.vi: Đá liền khối nằm sâu hơn nhiều.
label.en: solid rock
label.vi: đá liền khối
image.brief: Dùng lại hình `tray_limestone` ở bài `da-va-dat/da-nao-cung-hon`. Từ khoá tìm ảnh (EN): limestone rock sample
image.alt.en: A pale grey rock
image.alt.vi: Hòn đá màu xám nhạt
> Rà chữ tester 11/11 (n14): đổi từ ảnh mỏ đá chụp rộng sang mẫu đá vôi chụp gần của bài 3, để ba lựa chọn cùng khung chụp gần. Nhãn giữ "solid rock" · "đá liền khối" (không đổi thành "a block of rock" như tester gợi ý), để ba nhãn cùng dạng không có mạo từ ("small stones", "dark soil with roots").

#### option q5_stones
correct: false
feedback.en: Small stones and broken rock lie lower down.
feedback.vi: Sỏi và đá vỡ nằm ở lớp sâu hơn.
label.en: small stones
label.vi: sỏi nhỏ
image.brief: [ảnh] Một đống sỏi nhỏ màu xám nâu, chụp gần; không có tay, không có chữ, không có thước. Từ khoá tìm ảnh (EN): small gravel stones pile close up
image.alt.en: A small pile of little stones
image.alt.vi: Một đống sỏi nhỏ
> Theo ảnh designer chọn 11/11: sỏi của bài 11 là hình vẽ, còn hai lựa chọn kia là ảnh, nên lựa chọn này là ảnh riêng (CC0); `alt` giữ như bài 11.

#### option q5_topsoil
correct: true
label.en: dark soil with roots
label.vi: đất sẫm màu có rễ cây
image.brief: Dùng lại hình `explore_organic` ở bài `da-va-dat/dat-gom-nhung-gi`. Từ khoá tìm ảnh (EN): topsoil roots organic matter soil profile
image.alt.en: Dark topsoil with roots and bits of leaf
image.alt.vi: Lớp đất mặt sẫm màu có rễ cây và vụn lá
> Ba ảnh chụp gần, đều là ảnh bé đã gặp (bài 3, bài 11).

### q6
id: 3b4c98af-beb3-4fb8-8ec7-2e4b98cdff83
format: true_false
version: 1
dok: 3
misconception: geologists_only_earth
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: A geologist can study this rock from space.
statement.vi: Nhà địa chất nghiên cứu được hòn đá rơi từ vũ trụ.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: true
image.brief: [ảnh] Một hòn đá rơi từ vũ trụ xuống Trái Đất (mảnh sắt sẫm màu), mặt có nhiều vết lõm, đặt trên nền sáng, chụp gần; không có biển tên, không có nhãn số, không có chữ, không có người. Từ khoá tìm ảnh (EN): meteorite specimen museum dark background
image.alt.en: A dark rock with many dents
image.alt.vi: Hòn đá sẫm màu có nhiều vết lõm
> Theo ảnh designer chọn 11/11 (mảnh thiên thạch sắt Sikhote-Alin, nền sáng): brief sửa nền; `alt` sửa vì ảnh không chụp trong bảo tàng (trước: "A dark rock on show in a museum" · "Hòn đá sẫm màu trưng bày trong bảo tàng"). `alt` vẫn không gọi tên loại đá.
hint.en: Remember the Rocks from space picture.
hint.vi: Em nhớ lại ô Đá ngoài vũ trụ nhé.
explanation_correct.en: Rocks from space tell us about faraway worlds.
explanation_correct.vi: Đá từ vũ trụ kể cho ta về những nơi rất xa.
explanation_wrong.en: Geologists study rocks from space, too.
explanation_wrong.vi: Nhà địa chất nghiên cứu cả đá từ vũ trụ.
feedback_false.en: Geologists also study rocks from the Moon.
feedback_false.vi: Nhà địa chất cũng nghiên cứu đá Mặt Trăng.
> Lời Na, hình và đáp án Đúng như `_topic.md` (mục "Câu sáu, lời Na" và bảng Đúng/Sai). Cả màn mười tám từ EN.
> DOK 3: tình huống mới. Ô Đá ngoài vũ trụ chỉ nói đá Mặt Trăng và Sao Hoả; bé phải mở rộng sang hòn đá rơi xuống Trái Đất. Bé còn nghĩ nhà địa chất chỉ xem đá của Trái Đất sẽ chọn "Na chưa đúng".
> Không dùng chữ "thiên thạch" trong chữ cho trẻ (bảng Tên gọi *Khủng long*); `alt` không gọi tên loại đá. [CẦN KIỂM] Nhà địa chất nghiên cứu những hòn đá rơi từ vũ trụ xuống.

## Từ vựng

### fieldwork
id: 65327202-b727-45bb-9f03-9bdeb253f7da
tier: core
term.en: fieldwork
term.vi: đi thực địa
example.en: Geologists do fieldwork at cliffs and quarries.
example.vi: Nhà địa chất đi thực địa ở vách đá và mỏ đá.
image.brief: Dùng lại hình `magnifying_glass` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): magnifying glass plain background
image.alt.en: A magnifying glass
image.alt.vi: Chiếc kính lúp
> Cùng ảnh với ô Đi thực địa.

### sample
id: 290622d2-c03a-4f9c-b710-0d6b3383d92c
tier: core
term.en: sample
term.vi: mẫu
example.en: She takes a soil sample back to test.
example.vi: Cô ấy mang một mẫu đất về để thử.
image.brief: Dùng lại hình `explore_samples`. Từ khoá tìm ảnh (EN): rock sample collection tray
image.alt.en: A tray of rock samples
image.alt.vi: Khay đựng các mẫu đá

### geology
id: 3e2162c7-22df-4869-af25-43796b1ec96d
tier: core
term.en: geology
term.vi: địa chất học
example.en: Geology is the science of rocks and soil.
example.vi: Địa chất học là khoa học về đá và đất.
image.brief: Dùng lại hình `tray_soil_core`. Từ khoá tìm ảnh (EN): soil core sample layers
image.alt.en: Long tubes of soil in a tray
image.alt.vi: Những ống mẫu đất dài trong khay

### geologist
id: f075f3a2-0edf-4edc-ba32-ec70f54fe519
tier: extra
term.en: geologist
term.vi: nhà địa chất
example.en: A geologist looks closely at rocks.
example.vi: Nhà địa chất quan sát kỹ đá.
image.brief: Dùng lại hình `geologist` ở bài `da-va-dat/thang-do-cung-mohs`. Từ khoá tìm ảnh (EN): geologist field work back view rock outcrop
image.alt.en: A geologist looking at rocks
image.alt.vi: Nhà địa chất đang xem đá
> Ôn có chủ ý từ core bài 4 (bảng Từ vựng ở `_topic.md`), dùng lại đúng ảnh của từ đó.

### rock_hammer
id: 781e9bcc-9315-4798-9b53-87d7214407e3
tier: extra
term.en: rock hammer
term.vi: búa địa chất
example.en: Only grown-ups use a rock hammer.
example.vi: Chỉ người lớn mới dùng búa địa chất.
image.brief: [ảnh] Một chiếc búa địa chất (một đầu bằng, một đầu nhọn) đặt trên một tảng đá, chụp gần; không có tay, không có chữ, không có logo trên cán. Câu q1 dùng lại. Từ khoá tìm ảnh (EN): rock hammer geology on rock
image.alt.en: A rock hammer lying on a rock
image.alt.vi: Búa địa chất đặt trên tảng đá
> Câu ví dụ nhắc lại mục An toàn: bé không dùng búa đập đá.

## Thưởng

### moon_rock_card
id: 543c8a8c-de0c-46d8-9abe-82121f98dcc7
set: rocks
rarity: common
name.en: Moon rock
name.vi: Đá Mặt Trăng
tag.en: Rocks from space
tag.vi: Đá ngoài vũ trụ
fact.en: Astronauts brought rocks back from the Moon. Geologists still study them today.
fact.vi: Các nhà du hành đã mang đá từ Mặt Trăng về Trái Đất. Ngày nay nhà địa chất vẫn còn nghiên cứu những hòn đá ấy.
> [CẦN KIỂM] như `_topic.md`, bảng Bộ thẻ thưởng. `rarity: common` theo main session 11/11 (app chưa có thẻ hiếm).
image.brief: Dùng lại hình `tray_moon_rock`. Từ khoá tìm ảnh (EN): Apollo lunar sample rock NASA
image.alt.en: A grey rock from the Moon
image.alt.vi: Hòn đá xám từ Mặt Trăng

## Ghi chú cho hoạ sĩ

- **Theo hình designer làm 11/11** (file chọn ảnh `content/images/discoverer/da-va-dat/nha-dia-chat-lam-gi.json`): mười hai ảnh, hai hình vẽ. Để mỗi câu, mỗi kệ một loại hình, bốn chỗ dùng ảnh riêng thay hình gốc vẽ của bài khác (`w2_weathering`, `tray_rock_layers`, `q1_watering`, `q5_stones`); câu w1 dùng ba hình vẽ nắm đất của bài 12; `explore_samples` là hình vẽ (ảnh khay mẫu đều có nhãn chữ); `tray_forecast` dùng lại ảnh lều khí tượng của *Thời tiết*.
- **Loại hình:** ảnh chụp cho việc của nhà địa chất (USGS, NASA, ảnh tự do); hình vẽ cho khay mẫu đá và hai cách thử ở câu q3. Hình không có chữ, không có logo cơ quan, không có hình Trái Đất nhìn từ vũ trụ.
- **Ảnh (mười hai):**
  - Học (hai): trạm đo ở núi lửa (`explore_safe`); xe tự hành trên Sao Hoả (`explore_space`).
  - Chơi (năm): vách đá nhiều lớp ven biển (`tray_rock_layers`); sườn đồi có vết sạt lở cũ; mẫu đá Mặt Trăng; ống mẫu đất trong khay; kính thiên văn.
  - Khởi động, Quiz (bốn): mặt đá vôi rãnh sâu (w2); bình tưới trên cỏ (q1); đống sỏi nhỏ (q5); mảnh thiên thạch sắt trên nền sáng (q6).
  - Từ vựng (một): búa địa chất trên tảng đá.
- **Hình tự vẽ (hai):** khay mẫu đá (`explore_samples`); hòn đá trên cân (câu q3, `q3_weigh`, bộ "Bàn tay thử đá"). Hình nhỏ nước lên đá dùng lại `explore_water` của bài 5.
- **Dùng lại từ bài khác:** `explore_setup` (bài 14); `soil`, `explore_organic`, `explore_jar`, `q6` (bài 11); `q4_grey`, `q4_pale`, `q4_dark` (bài 12); `explore_erosion` (bài 7); `granite`, `magnifying_glass` (bài 2); `explore_scratch`, `tray_limestone` (bài 3); `diamond`, `quartz`, `tray_talc`, `geologist` (bài 4); `explore_water` (bài 5); `weather_box` (*Thời tiết* bài hai); `ha_long`, `tray_pond` (*Bề mặt Trái Đất* bài một); `explore_erupt`, `q1_rain`, `tray_dark_rock` (*Bề mặt Trái Đất* bài bốn); `q2_rice` (*Khủng long* bài một).
- **Người trong hình:** chỉ hình vẽ nhà địa chất `geologist` của bài 4 (hình câu hỏi q1, vẽ từ phía sau); kệ Chơi không có người.
- **Thiên nhiên dữ dội:** sườn đồi sạt lở chụp từ rất xa, cây xanh xung quanh, không nhà đổ, không người, không xe (Quy ước hình mục chín).
- **Nối với *Thời tiết*:** ảnh sườn đồi sạt lở (`tray_slope`) là hình gốc ở bài này (*Thời tiết* năm bài không có ảnh sạt lở); trạm khí tượng dùng lại `weather_box` của *Thời tiết*.
- **Vũ trụ:** ảnh NASA public domain; xe tự hành không thấy chữ, số, logo đọc được; mẫu đá Mặt Trăng đã cắt bỏ bộ đếm có số.
- **Cùng kiểu trong một câu:** w1 ba hình vẽ nắm đất; w2 ba ảnh; q1 ba ảnh một dụng cụ; q2 ba ảnh Bộ mẫu đá; q3 bốn hình vẽ; q4 bốn ảnh cảnh chụp rộng; q5 ba ảnh chụp gần.
- **Kệ Chơi:** chín ảnh chụp cảnh hay vật.
- **Màu:** Học: Đi thực địa `cham`, Mẫu `vang_hoe`, Giữ an toàn `do_son`, Đá ngoài vũ trụ `gi_dong`. Chơi: Trên Trái Đất `cham`, Giữ an toàn `do_son`, Ngoài vũ trụ `vang_hoe`, nhóm bẫy `nau_dat`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core: fieldwork, sample, geology).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required` (mỗi nhóm hai món), một nhóm `limit` (ba món), chín món.
  - Khởi động: `single_choice` (w1, w2; ba lựa chọn), `true_false` (w3, Sai, câu "Em nghĩ sao?" của bài 1, không gắn key). DOK một. `recall_from.lesson`: `da-va-dat/nuoc-tham-qua-dat-nao-nhanh-hon`, `da-va-dat/da-bi-bao-mon-theo-thoi-gian`, `da-va-dat/lam-quen-voi-da`.
  - Quiz: `single_choice` (q1 ba lựa chọn, q4 bốn lựa chọn, q5 ba lựa chọn), `fill_blank_bank` (q2, ba thẻ), `multi_choice` (q3, bốn lựa chọn, hai đúng), `true_false` (q6 Đúng, `speaker: na`, `misconception: geologists_only_earth`).
- **Tham chiếu:** chạy `ids` cho bài 1, bài 7, bài 14 trước bài này.
- **Vị trí đáp án đúng:** w1 thứ hai; w2 thứ hai; q1 thứ ba; q2 thẻ thứ nhất; q3 thứ nhất và thứ hai; q4 thứ nhất; q5 thứ ba.
- **Câu "Em nghĩ sao?":** w3 hỏi lại đúng câu của bài 1 (đề xuất schema v1.1 `think_first`, ghi ở Ghi chú cho dev bài 1).
- **Màn Chơi, ví dụ để kiểm:**
  - mở màn → `start`;
  - Xem các lớp đá, Theo dõi sườn đồi, Nghiên cứu đá Mặt Trăng → `balanced`;
  - Dự báo thời tiết → `has_limited`;
  - Khoan lấy mẫu đất, Đo đạc ở núi lửa, Xem các lớp đá (thiếu ngoài vũ trụ) → `missing.tray_space_group`;
  - rồi chạm Thử đá trên Sao Hoả → `full`; bỏ Xem các lớp đá, đặt Thử đá trên Sao Hoả → `balanced`.
- **Số từ EN trên một màn:** Học khoảng ba mươi (mục tiêu 10, hướng dẫn 3, bốn nhãn 9, câu dài nhất 9, ô Từ mới 3). Quiz nhiều chữ nhất: q3 (câu hỏi 13, hướng dẫn 5, bốn nhãn 12), q5 (câu hỏi 16, ba nhãn 7), q6 (mười tám).
- **Từ EN có thể ngoài Starters/Movers:** từ mới fieldwork, sample, geology, geologist, rock hammer; observe, landslide, volcano, erupt, rover, astronauts, Mars, planets, telescope, forecasting, hard hat, weathering, erosion, eruption, quartz, diamond, talc, wears down.
- **Nhãn dài:** "Không phải việc của nhà địa chất" (nhóm bẫy), "Nghiên cứu đá Mặt Trăng" (món Chơi), "Keeping people safe" (ô Học, nhóm Chơi). Nhờ tester xem trên iPhone bề rộng nhỏ nhất.
- **Giọng đọc:** chuỗi VI không có "Mohs" (câu q2 nói "thang độ cứng"); không có chữ số, ký hiệu, dấu "—". EN "Mohs' scale" ở giải thích câu q2: nghe thử.
