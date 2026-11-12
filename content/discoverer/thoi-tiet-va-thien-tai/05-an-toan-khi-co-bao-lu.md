---
id: 31565651-aff5-40b9-b9a3-146c2520a91d
topic: thoi-tiet-va-thien-tai
slug: an-toan-khi-co-bao-lu
order: 5
stage: review
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Staying safe in storms and floods
vi: An toàn khi có bão lũ
> Giữ đúng tên ở `syllabus-lessons.md` và `content/syllabus.json` (`new-weather`, bài số năm).

## Mục tiêu
en: I can stay safe in storms and floods.
vi: Em biết giữ an toàn khi có bão lũ.
> Rà chữ tester 11/11 (n14): mục tiêu cũ "I can say how to stay safe in storms and floods." mười một từ, quá mười. Nay tám từ.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-038, ngày 11/11/2026. Phiên chính đã chạy `ids`; câu w1 trỏ bài hai, câu w2 trỏ bài bốn; hình dùng lại của bài hai, bài ba, bài bốn.
> Bài tổng kết (`review`): ôn trộn cả chủ đề. Khởi động ôn bài hai (w1, khoảng một tuần), bài bốn (w2 hỏi lại câu "Em nghĩ sao?" của bài một) và *Động đất và sóng thần* (w3, khoảng một tháng); câu q5 ôn bài một (gió là không khí chuyển động); câu q2 ôn bài ba (tin dự báo).
> Bài sửa `shallow_floodwater_safe` ở ý chính ba, ô "Nước lũ", món bẫy "Lội nước lũ chơi" và câu q6 (gắn key, Na chưa đúng).
> An toàn là việc bé làm được: nghe lời người lớn và nghe tin, cất đồ vào nhà, chuẩn bị đèn pin, ở yên trong nhà, tránh xa cửa kính, tránh xa nước lũ và dây điện đứt. Không có người bị thương, không có nhà sập trong chữ hay hình (`_topic.md`, mục An toàn).

## Ý chính
1.en: Before a storm, listen to grown-ups and the news.
1.vi: Trước khi bão tới, em nghe lời người lớn và nghe tin tức.
2.en: In a storm, stay inside and away from windows.
2.vi: Khi có bão, em ở yên trong nhà, tránh xa cửa kính.
3.en: Stay away from flood water and fallen power lines.
3.vi: Em tránh xa nước lũ và dây điện bị đứt.
> [CẦN KIỂM] Ba lời khuyên theo khuyến cáo hiện hành của cơ quan phòng chống thiên tai Việt Nam (mục An toàn ở `_topic.md`); cách nói cho trẻ bảy đến chín tuổi.
> Ba ý theo thứ tự thời gian (trước, trong, sau cơn bão), cũng là ba nhóm của phần Chơi.

## Khởi động

> Ba câu, đúng bảng Khởi động ở `_topic.md`.
> - w1 ôn bài hai (khoảng một tuần trước): dụng cụ đo mưa, ba hình dụng cụ của ô Học bài hai. Giải thích khi đúng bắc cầu sang ý chính một (số đo giúp người dự báo báo trước).
> - w2 ôn bài bốn (khoảng một ngày trước): đây là câu "Em nghĩ sao?" của bài một (Ghi chú cho dev bài một), hỏi lại dạng `true_false` (đáp án Sai) để bé tự thấy mình đã sửa được `flood_only_where_it_rains`. Không gắn key: luật chỉ đếm câu misconception ở Quiz.
> - w3 ôn *Động đất và sóng thần* (khoảng một tháng trước): tránh xa cửa kính. Giải thích khi đúng bắc cầu sang bão (ý chính hai của bài này). Gợi ý đủ để bé chưa học chủ đề đó vẫn làm được.

### w1
id: dd1cf6e9-51a5-4f0b-a6bc-d719a4110786
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: thoi-tiet-va-thien-tai/do-thoi-tiet
prompt.en: Which tool measures how much rain falls?
prompt.vi: Dụng cụ nào đo được mưa nhiều hay ít?
image.brief: Dùng lại hình `q1_rain` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): heavy rain house garden
image.alt.en: Heavy rain falling
image.alt.vi: Mưa to đang rơi
hint.en: Remember the tools from the measuring lesson.
hint.vi: Em nhớ lại các dụng cụ ở bài Đo thời tiết nhé.
explanation_correct.en: Yes! Rain measurements help forecasters warn us early.
explanation_correct.vi: Đúng rồi! Số đo mưa giúp các cô chú dự báo thời tiết cảnh báo sớm cho mình.
explanation_wrong.en: The answer is the rain gauge. It catches rain.
explanation_wrong.vi: Đáp án là ống đo mưa. Ống hứng nước mưa để đo.
> Rà chữ tester 11/11 (n10): câu w1 cũ ôn bài bốn (chum hứng nước mưa khi hạn hán), nên bài năm có hai câu Khởi động cùng trỏ bài bốn và không có mốc "khoảng một tuần". Nay w1 ôn bài hai (cách khoảng một tuần). Giữ `id` và key `w1`, nội dung là câu mới; nếu phiên chính muốn `id` mới thì xoá dòng `id:` của w1 rồi chạy `ids`.
> Ba hình vẽ dụng cụ của ô Học bài hai, cùng nét. Ống đo mưa không là lựa chọn ở câu nào của bài hai, nên không có vai nào khác. Đáp án ở chỗ thứ hai.

#### option w1_thermometer
correct: false
label.en: wall thermometer
label.vi: nhiệt kế treo tường
image.brief: Dùng lại hình `explore_thermometer` ở bài `thoi-tiet-va-thien-tai/do-thoi-tiet`.
image.alt.en: A thermometer in the shade
image.alt.vi: Nhiệt kế treo trong bóng râm

#### option w1_rain_gauge
correct: true
label.en: rain gauge
label.vi: ống đo mưa
image.brief: Dùng lại hình `explore_rain_gauge` ở bài `thoi-tiet-va-thien-tai/do-thoi-tiet`.
image.alt.en: A rain gauge in an open garden
image.alt.vi: Ống đo mưa giữa khoảng vườn trống

#### option w1_windsock
correct: false
label.en: windsock
label.vi: ống gió
image.brief: Dùng lại hình `explore_windsock` ở bài `thoi-tiet-va-thien-tai/do-thoi-tiet`.
image.alt.en: A windsock full of wind
image.alt.vi: Ống gió căng phồng

### w2
id: 145223a9-11c6-4249-bed2-e1a4351fd19f
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: thoi-tiet-va-thien-tai/lu-lut-va-han-han
prompt.en: A river can only flood when it rains right here.
prompt.vi: Sông chỉ dâng lũ khi trời mưa ngay tại chỗ mình.
image.brief: Dùng lại hình `q6` ở bài `thoi-tiet-va-thien-tai/lu-lut-va-han-han`.
image.alt.en: A brown river on a sunny day
image.alt.vi: Dòng sông nước nâu ngày nắng
answer: false
hint.en: Remember Na's idea about the river.
hint.vi: Em nhớ lại ý của Na về dòng sông nhé.
explanation_correct.en: Rain far away can still flood the river.
explanation_correct.vi: Mưa ở nơi xa vẫn có thể làm sông dâng lũ.
explanation_wrong.en: This is false. Rain in the mountains can flow here.
explanation_wrong.vi: Câu này sai. Mưa trên núi có thể theo sông chảy về đây.
> Câu giữ đúng chữ `statement` của `flood_only_where_it_rains`; câu khẳng định, không có "not", nên khi đáp án là Sai bé không phải nghĩ qua phủ định hai lần. Khi schema có `think_first` (v1.1), app hiện được câu trả lời ở bài một cạnh câu trả lời ở câu này.
> Giải thích khi đúng không mở đầu bằng "Yes!" (đáp án Sai).

### w3
id: 61c8ede9-e207-4366-ad96-c4eebc540201
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: be-mat-trai-dat/dong-dat-va-song-than
prompt.en: In an earthquake, stay away from windows.
prompt.vi: Khi có động đất, em tránh xa cửa kính.
image.brief: Dùng lại hình `q3` ở bài `be-mat-trai-dat/dong-dat-va-song-than`. Từ khoá tìm ảnh (EN): classroom empty desks blackboard Vietnam
image.alt.en: A classroom starts to shake
image.alt.vi: Lớp học bắt đầu rung
answer: true
hint.en: Remember the Stay safe card about earthquakes.
hint.vi: Em nhớ lại ô Giữ an toàn ở bài Động đất và sóng thần nhé.
explanation_correct.en: Yes! In a storm, stay away from windows, too.
explanation_correct.vi: Đúng rồi! Khi có bão, em cũng tránh xa cửa kính.
explanation_wrong.en: This is true. Glass can break in a big shake.
explanation_wrong.vi: Câu này đúng. Kính có thể vỡ khi rung mạnh.
> Câu ôn ví dụ "stay away from windows" · "tránh xa cửa kính" của ô `explore_safe` bài *Động đất và sóng thần*. Hình câu hỏi là lớp học không người (hình câu q3 bài đó), không dùng hình bạn nhỏ đứng cạnh cửa kính (món bẫy của phần Chơi bài này).
> Giải thích khi đúng mở sang bão, không dạy lại động đất.

## Học

> Bốn ô theo thứ tự thời gian:
> - Lắng nghe (ý chính một, trước cơn bão): nghe tin cảnh báo bão, giúp cất đồ vào nhà, làm theo lời người lớn;
> - Ở trong nhà (ý chính hai, trong cơn bão): chơi trong nhà, tránh xa cửa kính, cây to có thể đổ, mất điện thì dùng đèn pin;
> - Nước lũ (ý chính ba, sau cơn bão): nước chảy xiết, bẩn, che giấu hố sâu; ô không nói "kể cả khi nước nông" (để câu q6 là việc vận dụng);
> - Dây điện (ý chính ba): tránh xa dây điện đứt và vũng nước gần đó, báo ngay cho người lớn.
>
> Ô "Ở trong nhà" không nói "phòng ở giữa nhà", "không ra ban công": câu q4 để bé tự áp dụng "tránh xa cửa kính". Lý do an toàn nói bằng điều bé hiểu được, không doạ (không nói "chết", "điện giật", "cuốn trôi").

### explore
id: 5b39e456-1905-4390-9921-08f1e13d7d34
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_listen
label.en: Listen
label.vi: Lắng nghe
color: cham
sentence.en: Before a storm, listen to grown-ups and the news.
sentence.vi: Trước khi bão tới, em nghe lời người lớn và nghe tin tức.
image.brief: Dùng lại hình `explore_forecast` ở bài `thoi-tiet-va-thien-tai/mua-mua-bao`.
image.alt.en: A weather forecast on TV
image.alt.vi: Bản tin dự báo thời tiết trên ti vi
examples.1.en: listen for storm warnings
examples.1.vi: nghe tin cảnh báo bão
examples.2.en: help bring things inside
examples.2.vi: em giúp cất đồ vào nhà
examples.3.en: do what grown-ups say
examples.3.vi: làm theo lời người lớn dặn
examples.4.en: stay calm and stay together
examples.4.vi: bình tĩnh, ở cùng cả nhà
> Ví dụ hai là món "Cất đồ vào nhà" của phần Chơi và lựa chọn đúng ở câu q3. Không giao cho bé việc của người lớn (chằng chống nhà, sơ tán).
> [CẦN KIỂM] như ý chính một.

#### group explore_inside
label.en: Stay inside
label.vi: Ở trong nhà
color: vang_hoe
sentence.en: In a storm, stay inside and away from windows.
sentence.vi: Khi có bão, em ở yên trong nhà, tránh xa cửa kính.
image.brief: [hình vẽ] Một bạn nhỏ ngồi chơi xếp hình trên chiếu ở giữa một căn phòng phía trong ngôi nhà, vẽ từ phía sau, không vẽ nét mặt; cửa sổ ở xa đã đóng kín, bên ngoài mưa gió; đèn trong phòng sáng ấm; không có chữ. Kệ Chơi, câu q1 và từ safe dùng lại hình này.
image.alt.en: A child playing in the middle of a room
image.alt.vi: Bạn nhỏ chơi ở giữa căn phòng
examples.1.en: play quiet games inside
examples.1.vi: chơi trò chơi trong nhà
examples.2.en: keep away from glass windows
examples.2.vi: tránh xa cửa kính
examples.3.en: big trees can fall in strong wind
examples.3.vi: gió mạnh có thể làm đổ cây to
examples.4.en: use a torch if the power goes out
examples.4.vi: mất điện thì dùng đèn pin
> [CẦN KIỂM] như ý chính hai. Ví dụ ba là lý do của món bẫy "Trú dưới gốc cây to" và lựa chọn sai ở câu q1. Ví dụ bốn đặt nền cho câu q3 (chuẩn bị đèn pin trước khi bão tới) và từ `torch`.
> Không có ví dụ nào nói nến: nhiều nhà vẫn thắp nến khi mất điện, bài không chê (mục An toàn ở `_topic.md`).

#### group explore_flood_water
label.en: Flood water
label.vi: Nước lũ
color: do_son
sentence.en: Flood water can be fast and dirty.
sentence.vi: Nước lũ có thể chảy xiết và rất bẩn.
image.brief: [hình vẽ] Một con đường làng bị ngập nước đục màu nâu đang chảy, mặt nước có những gợn xoáy nhẹ và vài cành lá trôi; hai bên là hàng rào và nhà cửa nguyên vẹn, cửa đóng; không có người, không có xe, không có con vật, không có chữ. Từ danger dùng lại hình này.
image.alt.en: Brown flood water on a village road
image.alt.vi: Nước lũ đục chảy trên đường làng
examples.1.en: it can hide holes and sharp things
examples.1.vi: nước có thể che giấu hố sâu và vật sắc nhọn
examples.2.en: moving water can push you over
examples.2.vi: dòng nước chảy có thể làm em ngã
examples.3.en: it can carry germs
examples.3.vi: nước bẩn có thể mang mầm bệnh
examples.4.en: stay on dry ground
examples.4.vi: em đứng ở chỗ khô ráo
> [CẦN KIỂM] như `shallow_floodwater_safe` ở `_topic.md`; nước lũ có thể mang mầm bệnh. Ô không nói "kể cả khi nước nông": câu q6 để bé tự suy ra.
> Ví dụ bốn là món "Đứng ở chỗ khô ráo" của phần Chơi.
> Rà chữ tester 11/11 (N4): ví dụ cũ "stay on high, dry ground" · "em ở chỗ cao và khô ráo" trái bảng Tên gọi (`_topic.md`: không dùng "high ground" ở bài năm) và lệch món kệ. Biên tập chọn giữ bảng Tên gọi, không đổi ngược: "lên chỗ cao" khi lũ là lời khuyên đúng, nhưng là việc sơ tán do người lớn quyết, còn việc bé tự làm được là đứng ở chỗ khô ráo, tránh xa nước; giữ "chỗ cao" (high ground) riêng cho lời khuyên sóng thần của *Động đất và sóng thần* để bé khỏi lẫn hai tình huống. Hình món kệ vẫn vẽ bậc thềm cao, khô.

#### group explore_power
label.en: Power lines
label.vi: Dây điện
color: gi_dong
sentence.en: Keep far away from fallen power lines.
sentence.vi: Em tránh thật xa dây điện bị đứt, rơi xuống.
image.brief: [hình vẽ] Sau cơn bão, một đoạn dây điện bị đứt rơi xuống vệ đường cạnh một cột điện, mặt đường có vũng nước; trời đã tạnh; không có tia lửa, không có khói, không có người, không có biển báo có chữ, không có chữ. Từ power line dùng lại hình này.
image.alt.en: A fallen power line by the road
image.alt.vi: Dây điện đứt rơi bên vệ đường
examples.1.en: do not touch, even with a stick
examples.1.vi: không chạm vào, kể cả bằng que
examples.2.en: water near them can be dangerous
examples.2.vi: vũng nước gần đó cũng nguy hiểm
examples.3.en: tell a grown-up straight away
examples.3.vi: báo ngay cho người lớn
examples.4.en: wait for workers to fix them
examples.4.vi: đợi các cô chú thợ điện tới sửa
> [CẦN KIỂM] Lời khuyên với dây điện đứt (tránh xa, không chạm kể cả bằng vật khác, tránh vũng nước gần đó, báo người lớn). Ô không nói "điện giật" hay hậu quả, để không doạ; lý do là "nguy hiểm".

### new_words
id: fc0d9130-76f2-4c46-aaf2-3dc7f6555bc1
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: warning, power_line, torch

## Chơi

> Bé chọn ba việc an toàn: một việc trước cơn bão, một việc trong cơn bão, một việc sau cơn bão. Đạt khi đủ ba nhóm và không chọn việc chưa an toàn. Chạm hình đã chọn để bỏ ra.
> Ba món bẫy là việc trẻ dễ làm theo thói quen: trú mưa dưới gốc cây to, đứng cạnh cửa kính xem mưa gió, lội nước lũ chơi. Món "Đứng cạnh cửa kính" dùng lại hình món bẫy của bài *Động đất và sóng thần* (cùng một việc chưa an toàn).
> Cả kệ là hình vẽ: mọi món có trẻ, vẽ từ phía sau (`_topic.md`, Quy ước hình mục hai và ba). Không món nào vẽ trẻ chạm vào dây điện hay ở trong nước sâu.

### tray
id: f7b9b2d6-8024-47d0-ada0-3bad8deece4d
type: build_tray
version: 1
prompt.en: Stay safe before, during and after
prompt.vi: An toàn trước, trong và sau cơn bão
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick a safe thing for before, during and after.
messages.start.vi: Em chọn một việc an toàn cho lúc trước, lúc đang có và lúc sau cơn bão nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! You know how to stay safe.
messages.balanced.vi: Tuyệt! Em đã biết cách giữ an toàn.
messages.has_limited.en: That is not safe in a storm.
messages.has_limited.vi: Việc đó không an toàn khi có bão lũ.
messages.missing.tray_before.en: You still need something for before.
messages.missing.tray_before.vi: Em còn thiếu một việc cho lúc trước cơn bão.
messages.missing.tray_during.en: You still need something for during.
messages.missing.tray_during.vi: Em còn thiếu một việc cho lúc đang có bão.
messages.missing.tray_after.en: You still need something for after.
messages.missing.tray_after.vi: Em còn thiếu một việc cho lúc bão đã qua.

#### group tray_before
label.en: Before
label.vi: Trước bão
color: cham
role: required

#### group tray_during
label.en: During
label.vi: Trong bão
color: vang_hoe
role: required

#### group tray_after
label.en: After
label.vi: Sau bão
color: gi_dong
role: required

#### group tray_unsafe
label.en: Not safe
label.vi: Không an toàn
color: do_son
role: limit
> Nhãn `limit` dạng "Not …" · "Không …", gọi tên loại, không gọi tên món bẫy. Dòng điều kiện sẽ là "Cần đủ Trước bão, Trong bão, Sau bão · Không an toàn".

#### item tray_tree
label.en: Shelter under a big tree
label.vi: Trú dưới gốc cây to
group: tray_unsafe
image.brief: [hình vẽ] Một bạn nhỏ đứng trú mưa dưới gốc một cây to giữa trời mưa gió, vẽ từ phía sau, không vẽ nét mặt; cành cây nghiêng theo gió nhưng không gãy, không đổ; không có chữ. Câu q1 dùng lại hình này.
image.alt.en: A child under a big tree in the rain
image.alt.vi: Bạn nhỏ trú mưa dưới gốc cây to
> [CẦN KIỂM] Không trú dưới gốc cây to khi có bão (cành gãy, cây đổ) và khi có giông sét. Bài chỉ nói lý do cây có thể đổ (ô "Ở trong nhà").

#### item tray_listen
label.en: Listen to the news
label.vi: Nghe tin bão
group: tray_before
image.brief: Dùng lại hình `explore_forecast` ở bài `thoi-tiet-va-thien-tai/mua-mua-bao`.
image.alt.en: A weather forecast on TV
image.alt.vi: Bản tin dự báo thời tiết trên ti vi

#### item tray_inside
label.en: Stay inside
label.vi: Ở yên trong nhà
group: tray_during
image.brief: Dùng lại hình `explore_inside`.
image.alt.en: A child playing in the middle of a room
image.alt.vi: Bạn nhỏ chơi ở giữa căn phòng

#### item tray_window
label.en: Stand by the window
label.vi: Đứng cạnh cửa kính
group: tray_unsafe
image.brief: Dùng lại hình `tray_window` ở bài `be-mat-trai-dat/dong-dat-va-song-than`. Từ khoá tìm ảnh (EN): child window from behind
image.alt.en: A child stands by a glass window
image.alt.vi: Bạn nhỏ đứng cạnh cửa kính

#### item tray_bring_in
label.en: Bring things inside
label.vi: Cất đồ vào nhà
group: tray_before
image.brief: [hình vẽ] Một bạn nhỏ bê một chậu cây nhỏ đi vào hiên nhà, trời âm u, gió bắt đầu thổi, vẽ từ phía sau, không vẽ nét mặt; không có chữ. Câu q3 dùng lại hình này.
image.alt.en: A child carrying a plant inside
image.alt.vi: Bạn nhỏ bê chậu cây vào nhà

#### item tray_play_water
label.en: Play in flood water
label.vi: Lội nước lũ chơi
group: tray_unsafe
image.brief: [hình vẽ] Một bạn nhỏ đứng ở mép một đoạn đường ngập nước đục, một chân sắp bước xuống, vẽ từ phía sau, không vẽ nét mặt; nước ngập thấp, nhà cửa nguyên vẹn; không có ai trong nước sâu, không có dòng nước cuốn, không có chữ.
image.alt.en: A child about to step into flood water
image.alt.vi: Bạn nhỏ sắp bước xuống nước lũ

#### item tray_dry
label.en: Stay on dry ground
label.vi: Đứng ở chỗ khô ráo
group: tray_after
image.brief: [hình vẽ] Một bạn nhỏ đứng trên bậc thềm cao, khô ráo, nắm tay một người lớn, nhìn ra con đường ngập nước ở phía xa; vẽ cả hai người từ phía sau, không vẽ nét mặt; trời đã tạnh; không có chữ.
image.alt.en: A child on a dry, high step
image.alt.vi: Bạn nhỏ đứng trên bậc thềm cao, khô ráo

#### item tray_wire
label.en: Keep away from wires
label.vi: Tránh xa dây điện
group: tray_after
image.brief: [hình vẽ] Một bạn nhỏ và một người lớn đi vòng ở phía bên kia đường, cách xa một đoạn dây điện đứt nằm bên vệ đường; vẽ từ phía sau, không vẽ nét mặt; không có tia lửa, không ai chạm vào dây; không có chữ.
image.alt.en: A child walking far from a fallen wire
image.alt.vi: Bạn nhỏ đi cách xa dây điện đứt

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Bốn format: `single_choice` (q1, q4), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q5, q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, mọi thẻ từ có hình. Mọi lựa chọn, mọi thẻ là hình vẽ.
> Ôn trộn: q2 ôn bài ba (tin dự báo), q5 ôn bài một (gió là không khí chuyển động).
> Vai của hình: hình "Ở trong nhà" đúng ở phần Chơi và câu q1; "Trú dưới gốc cây to" sai ở phần Chơi và câu q1; "Cất đồ vào nhà" đúng ở phần Chơi và câu q3. Không hai câu nào dùng chung một hình lựa chọn.

### q1
id: 5254f035-bbf6-4cf1-b6c2-5b72d6c25727
format: single_choice
version: 1
dok: 1
prompt.en: Where should you be during a storm?
prompt.vi: Khi có bão, em nên ở đâu?
image.brief: Dùng lại hình `explore_storm` ở bài `thoi-tiet-va-thien-tai/mua-mua-bao`.
image.alt.en: A seaside village in a storm
image.alt.vi: Làng ven biển trong cơn bão
hint.en: Think of where the wind cannot reach you.
hint.vi: Em nghĩ xem chỗ nào gió mưa không tới được nhé.
explanation_correct.en: Yes! Stay inside, away from windows.
explanation_correct.vi: Đúng rồi! Em ở yên trong nhà, tránh xa cửa kính.
explanation_wrong.en: The answer is inside the house. Big trees can fall.
explanation_wrong.vi: Đáp án là ở trong nhà. Gió mạnh có thể làm đổ cây to.
> Câu nhớ lại ý chính hai. Lựa chọn "dưới gốc cây to" có sức hút vì trẻ quen trú mưa dưới gốc cây; "bên bờ sông" có sức hút với bé thích xem nước dâng. Ba hình vẽ có trẻ từ phía sau, cùng nét. Đáp án ở chỗ thứ nhất.
> Rà chữ tester 11/11 (trả lời "Còn chưa chắc" 3): tester gợi ý đổi `q1_tree` sang một chỗ mới chưa gặp. Biên tập giữ: đáp án `q1_inside` là hình ô Học và món của kệ; nếu cả hai lựa chọn sai đều là hình mới thì đáp án thành hình duy nhất bé đã thấy (tiêu chí SK-038). Giữ một lựa chọn sai đã gặp (cây to, món bẫy của kệ) và một lựa chọn sai mới (bờ sông) thì không lựa chọn nào nổi bật vì quen hay lạ.

#### option q1_inside
correct: true
label.en: inside the house
label.vi: ở trong nhà
image.brief: Dùng lại hình `explore_inside`.
image.alt.en: A child playing in the middle of a room
image.alt.vi: Bạn nhỏ chơi ở giữa căn phòng

#### option q1_tree
correct: false
label.en: under a big tree
label.vi: dưới gốc cây to
image.brief: Dùng lại hình `tray_tree`.
image.alt.en: A child under a big tree in the rain
image.alt.vi: Bạn nhỏ trú mưa dưới gốc cây to

#### option q1_river
correct: false
label.en: by the river
label.vi: bên bờ sông
image.brief: [hình vẽ] Một bạn nhỏ đứng trên bờ sông nhìn dòng nước nâu đang dâng, trời mưa gió, vẽ từ phía sau, không vẽ nét mặt; bạn đứng trên bờ cỏ, không ở dưới nước; không có chữ.
image.alt.en: A child by a river in the rain
image.alt.vi: Bạn nhỏ đứng bên bờ sông lúc mưa gió

### q2
id: 9ef0b891-1d11-4fed-8a3f-8debf1e9cacc
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `q1_storm` ở bài `khung-long/vi-sao-khung-long-bien-mat`. Từ khoá tìm ảnh (EN): cyclone eye from space ocean
image.alt.en: A big storm seen from space
image.alt.vi: Cơn bão lớn nhìn từ vũ trụ
sentence.en: Before a storm, listen to grown-ups and the {1}.
sentence.vi: Trước khi bão tới, em nghe lời người lớn và nghe {1}.
answers: q2_news
hint.en: Remember the Listen card.
hint.vi: Em nhớ lại ô Lắng nghe nhé.
explanation_correct.en: Yes! The news tells us where the storm goes.
explanation_correct.vi: Đúng rồi! Tin tức cho biết bão đi về đâu.
explanation_wrong.en: The answer is the news. It warns us early.
explanation_wrong.vi: Đáp án là tin tức. Tin tức báo trước cho mình.
> Câu nhớ lại ý chính một, ôn ý chính ba bài ba (dự báo, cảnh báo trước). Thẻ đúng là hình vẽ mới (chiếc đài), không dùng lại hình ti vi của ô Học; thẻ gió là hình lá bay của phần Chơi bài ba, thẻ ếch là hình vẽ mới, nên thẻ đúng không là hình duy nhất bé đã thấy. Câu tiếng Việt đọc xuôi với cả ba thẻ ("nghe tiếng gió", "nghe tiếng ếch kêu", "nghe tin tức"). Thẻ đúng ở chỗ thứ ba.
> Rà chữ tester 11/11 (n9): hai thẻ sai cũ "birds" · "tiếng chim hót", "music" · "nhạc" không dính gì tới chuẩn bị trước bão. Nay là hai "dấu hiệu" quen ở làng quê: tiếng gió nổi lên, tiếng ếch kêu (câu ca "ếch kêu uôm uôm, ao chuôm đầy nước"); có sức hút, nhưng không cho biết bão ở xa sẽ đi về đâu, chỉ tin dự báo mới cho biết. Không lấy thẻ "loa phát thanh" tester gợi ý: loa làng cũng đưa tin bão (đáp án đúng ở câu q3 bài ba), câu sẽ có hai đáp án.
> [CẦN KIỂM] Tiếng gió, tiếng ếch không phải nguồn cảnh báo bão.

#### bank q2_wind
label.en: wind
label.vi: tiếng gió
image.brief: Dùng lại hình `tray_leaves` ở bài `thoi-tiet-va-thien-tai/mua-mua-bao`.
image.alt.en: Leaves flying in the wind
image.alt.vi: Lá bay trong gió

#### bank q2_frogs
label.en: frogs
label.vi: tiếng ếch kêu
image.brief: [hình vẽ] Một con ếch đồng ngồi trên bờ ruộng, túi kêu dưới cằm phồng ra như đang kêu, phía sau là ruộng lúa và trời âm u; cùng nét với hai thẻ kia; không có người, không có chữ. Vẽ riêng, không dùng lại ảnh ếch của chủ đề khác, để ba thẻ cùng là hình vẽ.
image.alt.en: A frog croaking by a rice field
image.alt.vi: Con ếch đang kêu bên bờ ruộng

#### bank q2_news
label.en: news
label.vi: tin tức
image.brief: [hình vẽ] Một chiếc đài (radio) kiểu cũ trên mặt bàn gỗ, có núm vặn và loa tròn, vài nét sóng âm nhẹ quanh loa; không có chữ, không có số trên mặt đài, không có nhãn hiệu, không có người. Từ warning dùng lại hình này.
image.alt.en: A radio on a table
image.alt.vi: Chiếc đài trên bàn

### q3
id: 3f85215c-72fd-4bb0-8f1f-0a538516581f
format: multi_choice
version: 1
dok: 2
prompt.en: A storm comes tonight. What should Lan do now?
prompt.vi: Tối nay bão tới. Bây giờ Lan nên làm gì?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `q3` ở bài `thoi-tiet-va-thien-tai/mua-mua-bao`.
image.alt.en: A quiet yard in the afternoon
image.alt.vi: Sân nhà yên ả buổi chiều
hint.en: What will help when wind and rain come?
hint.vi: Việc gì sẽ giúp ích khi gió mưa kéo tới?
explanation_correct.en: Yes! Bring things inside and get a torch ready.
explanation_correct.vi: Đúng rồi! Lan cất đồ vào nhà và chuẩn bị đèn pin.
explanation_wrong.en: The answers are bringing things in and the torch.
explanation_wrong.vi: Đáp án là cất đồ vào nhà và chuẩn bị đèn pin.
> DOK 2: vận dụng ô "Lắng nghe" và ô "Ở trong nhà" vào việc làm ngay trước cơn bão. "Chuẩn bị đèn pin" là việc mới: ô Học chỉ nói "mất điện thì dùng đèn pin", bé phải suy ra nên chuẩn bị trước. Lựa chọn "đi thả diều" có sức hút vì bài một dạy diều cần gió, mà trước bão gió to; "ra bãi biển chơi" có sức hút vì trời còn đẹp. Bốn nhãn cùng dạng cụm động từ. Đáp án ở chỗ thứ hai và thứ ba.
> Hình câu hỏi là sân nhà buổi chiều trời còn xanh của bài ba, đúng lúc trước khi bão tới.

#### option q3_kite
correct: false
label.en: fly a kite
label.vi: đi thả diều
image.brief: [hình vẽ] Một cánh diều hình thoi có đuôi dài nằm trên bãi cỏ cạnh cuộn dây, trời âm u, cỏ nghiêng theo gió; không có người, không có chữ.
image.alt.en: A kite on the grass on a cloudy day
image.alt.vi: Cánh diều trên bãi cỏ ngày âm u
> Hình vẽ riêng, không dùng lại ảnh cánh diều của bài một, để cả câu là hình vẽ.

#### option q3_bring
correct: true
label.en: bring things inside
label.vi: cất đồ vào nhà
image.brief: Dùng lại hình `tray_bring_in`.
image.alt.en: A child carrying a plant inside
image.alt.vi: Bạn nhỏ bê chậu cây vào nhà

#### option q3_torch
correct: true
label.en: get a torch ready
label.vi: chuẩn bị đèn pin
image.brief: [hình vẽ] Một chiếc đèn pin đặt trên bàn gỗ cạnh mấy cục pin, vẽ chéo từ trên xuống; không có chữ, không có nhãn hiệu, không có người. Từ torch dùng lại hình này.
image.alt.en: A torch on a table
image.alt.vi: Chiếc đèn pin trên bàn

#### option q3_beach
correct: false
label.en: go to the beach
label.vi: ra bãi biển chơi
image.brief: [hình vẽ] Một bãi biển vắng, sóng bắt đầu lớn, trời âm u, mây xám kéo tới, vẽ từ xa; không có người, không có chữ.
image.alt.en: A beach with big waves and grey sky
image.alt.vi: Bãi biển sóng lớn, trời âm u

### q4
id: f2faa6bc-29a3-42d0-b208-2774150b3d44
format: single_choice
version: 1
dok: 2
prompt.en: The storm is here. Where is the safest place to play?
prompt.vi: Bão đã tới rồi. Chỗ nào chơi an toàn nhất?
image.brief: Dùng lại hình `q4_storm` ở bài `thoi-tiet-va-thien-tai/mua-mua-bao`.
image.alt.en: The yard in a storm
image.alt.vi: Sân nhà lúc có bão
hint.en: Remember the Stay inside card.
hint.vi: Em nhớ lại ô Ở trong nhà nhé.
> Rà chữ tester 11/11 (N6): gợi ý cũ "Think of the wind, the rain and the glass." liệt kê đủ ba tiêu chí, loại hộ hai lựa chọn sai; hình câu hỏi cũ (mưa chảy trên cửa kính) chính là "cái kính" của gợi ý. Nay gợi ý trỏ ô Học, hình câu hỏi là sân nhà lúc có bão (tình huống "bão đã tới", không nói gì về kính), đúng đề xuất của tester.
explanation_correct.en: Yes! A middle room is far from glass and wind.
explanation_correct.vi: Đúng rồi! Căn phòng ở giữa nhà xa cửa kính và gió.
explanation_wrong.en: The answer is the middle room, away from glass.
explanation_wrong.vi: Đáp án là căn phòng ở giữa nhà, xa cửa kính.
> DOK 2: áp dụng ví dụ "tránh xa cửa kính" và ý "ở trong nhà" vào ba chỗ cụ thể trong nhà. Ô Học không nói "phòng ở giữa nhà" hay "ban công". Ba hình vẽ ba chỗ của cùng một ngôi nhà, không có trẻ. Ba nhãn cùng dạng cụm giới từ. Đáp án ở chỗ thứ hai.
> [CẦN KIỂM] Khi có bão nên ở phòng phía trong, ít cửa kính; không ra ban công.

#### option q4_balcony
correct: false
label.en: on the balcony
label.vi: ngoài ban công
image.brief: [hình vẽ] Ban công nhỏ của một ngôi nhà phố, mưa gió hắt vào, chậu cây nghiêng, lan can sắt; không có người, không có chữ.
image.alt.en: A small balcony in the rain
image.alt.vi: Ban công nhỏ lúc mưa gió

#### option q4_middle
correct: true
label.en: in a middle room
label.vi: trong phòng giữa nhà
> Rà chữ tester 11/11 (n2): nhãn VI cũ "trong căn phòng ở giữa nhà" sáu tiếng, dài hơn hẳn hai nhãn sai. Nay bốn tiếng.
image.brief: [hình vẽ] Một căn phòng nhỏ ở giữa ngôi nhà, không có cửa kính, có chiếu và mấy món đồ chơi, đèn sáng ấm; không có người, không có chữ.
image.alt.en: A small room with no windows
image.alt.vi: Căn phòng nhỏ không có cửa kính

#### option q4_door
correct: false
label.en: by the glass door
label.vi: cạnh cửa kính lớn
image.brief: [hình vẽ] Một cánh cửa kính lớn của phòng khách nhìn ra sân, ngoài trời mưa gió, cây nghiêng; cửa đóng, kính nguyên vẹn; không có người, không có chữ.
image.alt.en: A big glass door in the rain
image.alt.vi: Cửa kính lớn lúc mưa gió
> Ba hình cùng cỡ cảnh, cùng nét, cùng một ngôi nhà; `alt` tả chỗ, không nói chỗ nào an toàn.

### q5
id: dd6d8a4d-c92d-46b0-b935-526b0e82466b
format: true_false
version: 1
dok: 2
prompt.en: Storm wind is air that moves very fast.
prompt.vi: Gió bão là không khí chuyển động rất nhanh.
image.brief: Dùng lại hình `tray_bend` ở bài `thoi-tiet-va-thien-tai/mua-mua-bao`.
image.alt.en: Trees bending low in strong wind
image.alt.vi: Hàng cây nghiêng rạp trong gió mạnh
answer: true
hint.en: Remember what wind is from the first lesson.
hint.vi: Em nhớ lại gió là gì ở bài đầu tiên nhé.
explanation_correct.en: Yes! Fast-moving air pushes hard on trees and roofs.
explanation_correct.vi: Đúng rồi! Không khí chuyển động nhanh đẩy mạnh vào cây cối, mái nhà.
explanation_wrong.en: This is true. Storm wind is very fast air.
explanation_wrong.vi: Câu này đúng. Gió bão là không khí chuyển động rất nhanh.
> DOK 2: nối ý chính hai bài một (gió là không khí chuyển động) với bài ba (bão có gió rất mạnh), giải thích vì sao phải ở trong nhà. Câu khẳng định, đáp án Đúng.
> [CẦN KIỂM] Gió bão rất mạnh, đẩy mạnh vào cây cối, mái nhà (cách nói giản lược, không đưa cấp gió).

### q6
id: b13ee3a3-3cac-43f9-bd65-a15463eaf147
format: true_false
version: 1
dok: 3
misconception: shallow_floodwater_safe
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
image.brief: [hình vẽ] Một con ngõ ngập nước nông, nước đục nhưng trông phẳng lặng, ngập tới bậc cửa thấp; trời đã tạnh, có nắng nhẹ; nhà cửa nguyên vẹn; không có người, không có chữ. Khác hình ô "Nước lũ" (ở đây nước trông yên, nông).
image.alt.en: A lane with shallow flood water
image.alt.vi: Con ngõ ngập nước nông
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: The flood water is only ankle-deep. So I can play in it.
statement.vi: Nước lũ chỉ ngập tới mắt cá chân thôi. Vậy mình chơi trong đó được.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: false
hint.en: Remember the Flood water card.
hint.vi: Em nhớ lại ô Nước lũ nhé.
explanation_correct.en: Even shallow flood water can hide holes and wires.
explanation_correct.vi: Nước lũ dù nông vẫn có thể che giấu hố sâu và dây điện.
explanation_wrong.en: Na is not right. Stay out of all flood water.
explanation_wrong.vi: Na chưa đúng. Em tránh xa mọi chỗ nước lũ.
> Lời Na, hình và đáp án Sai đúng như `_topic.md` (mục "Câu sáu, lời Na" và bảng Đáp án Đúng/Sai).
> DOK 3: bé đánh giá một kết luận rút ra từ điều trông thấy (nước nông, trông yên). Ô "Nước lũ" nói nước lũ chảy xiết, bẩn, che giấu hố sâu, nhưng không nói "kể cả khi nước nông"; ô "Dây điện" nói vũng nước gần dây điện cũng nguy hiểm. Bé phải nối hai ô để thấy "nông" chưa đủ an toàn. Hình câu hỏi cho thấy đúng điều Na thấy (nước nông, yên), không cho thấy hố hay dây điện.
> [CẦN KIỂM] như `shallow_floodwater_safe` ở `_topic.md`.
> Giải thích khi đúng không mở đầu bằng "Yes!", vì bé vừa chọn "Na chưa đúng".

## Từ vựng

### warning
id: 8c4967a5-2208-4827-8051-7401325c9e30
tier: core
term.en: warning
term.vi: cảnh báo, tin cảnh báo
example.en: Grown-ups listen to storm warnings on the radio.
example.vi: Người lớn nghe tin cảnh báo bão trên đài.
image.brief: Dùng lại hình `q2_news`.
image.alt.en: A radio on a table
image.alt.vi: Chiếc đài trên bàn
> `term.vi` có dấu phẩy: nhờ nghe thử giọng VI.

### power_line
id: 82d5c769-d47b-4b0f-b59b-270e62fac8bc
tier: core
term.en: power line
term.vi: dây điện
example.en: Never touch a fallen power line.
example.vi: Em không bao giờ chạm vào dây điện bị đứt.
image.brief: Dùng lại hình `explore_power`.
image.alt.en: A fallen power line by the road
image.alt.vi: Dây điện đứt rơi bên vệ đường

### torch
id: 46c196ce-f448-4235-8a02-8b29754d75ce
tier: core
term.en: torch
term.vi: đèn pin
example.en: Keep a torch ready for a storm.
example.vi: Em để sẵn đèn pin khi bão sắp tới.
image.brief: Dùng lại hình `q3_torch`.
image.alt.en: A torch on a table
image.alt.vi: Chiếc đèn pin trên bàn
> Tiếng Anh kiểu Anh "torch" (bảng Tên gọi ở `_topic.md`).

### safe
id: bd8dea05-2817-48d8-b043-65055d393319
tier: extra
term.en: safe
term.vi: an toàn
example.en: I stay inside to be safe in a storm.
example.vi: Em ở trong nhà để được an toàn khi có bão.
image.brief: Dùng lại hình `explore_inside`.
image.alt.en: A child playing in the middle of a room
image.alt.vi: Bạn nhỏ chơi ở giữa căn phòng
> Từ `safe` cũng là từ `extra` của bài *Động đất và sóng thần*; bé gặp lại với một tình huống mới.

### danger
id: 1e14b050-afd9-4bc3-b8fb-e8b139cfeccb
tier: extra
term.en: danger
term.vi: nguy hiểm, mối nguy
example.en: Flood water can be a danger.
example.vi: Nước lũ có thể rất nguy hiểm.
image.brief: Dùng lại hình `explore_flood_water`.
image.alt.en: Brown flood water on a village road
image.alt.vi: Nước lũ đục chảy trên đường làng
> `term.vi` có dấu phẩy: nhờ nghe thử giọng VI.

## Thưởng

### storm_kit
id: 3f9c75f4-c3b7-47e9-a6ae-65ffb0fc74f9
set: weather
rarity: common
name.en: Storm kit
name.vi: Túi đồ phòng bão
tag.en: Staying safe
tag.vi: Giữ an toàn
fact.en: A storm kit has a torch, water and some food. Families pack it before a storm.
fact.vi: Túi đồ phòng bão có đèn pin, nước uống và ít đồ ăn. Cả nhà chuẩn bị túi này trước khi bão tới.
> [CẦN KIỂM] Danh sách đồ phòng bão theo khuyến cáo của cơ quan phòng chống thiên tai (đèn pin, pin dự phòng, nước uống, đồ ăn khô, thuốc men, áo mưa). Thẻ chỉ nêu ba thứ.
image.brief: [hình vẽ] Một chiếc ba lô vải mở miệng trên bàn gỗ, bên cạnh là đèn pin, mấy chai nước không nhãn, gói bánh không chữ, áo mưa gấp gọn; cùng nét với đèn pin của câu q3; không có người, không có nhãn hiệu, không có chữ.
image.alt.en: A bag with a torch, water and food
image.alt.vi: Túi đồ có đèn pin, nước và đồ ăn

## Ghi chú cho hoạ sĩ

- **Loại hình:** gần như toàn hình tự vẽ, vì phần lớn cảnh có trẻ làm việc an toàn hay chưa an toàn (như kệ Chơi *Động đất và sóng thần*). Ảnh chụp chỉ còn ở hình câu hỏi w1 (mưa to), w3 (lớp học), q2 (cơn bão từ vũ trụ).
- **Hình tự vẽ cần vẽ (mười chín):**
  - Học (ba): bạn nhỏ chơi ở giữa phòng phía trong; đường làng ngập nước lũ đục đang chảy; dây điện đứt bên vệ đường.
  - Chơi (năm): bạn nhỏ trú dưới gốc cây to lúc mưa gió; bạn nhỏ bê chậu cây vào hiên; bạn nhỏ sắp bước xuống nước lũ; bạn nhỏ cùng người lớn đứng trên bậc thềm cao, khô; bạn nhỏ cùng người lớn đi vòng xa dây điện.
  - Quiz (mười): bạn nhỏ đứng bên bờ sông lúc mưa gió (q1); ếch đồng đang kêu, chiếc đài (q2); cánh diều trên cỏ, đèn pin trên bàn, bãi biển sóng lớn (q3); ban công lúc mưa gió, phòng nhỏ không cửa kính, cửa kính lớn (q4); con ngõ ngập nước nông (q6).
  - Thưởng (một): ba lô đồ phòng bão.
  - Rà chữ tester 11/11: bỏ hai hình chim sẻ hót, đàn ghi-ta (n9); thêm hình ếch đồng đang kêu.
- **Dùng lại:** từ bài hai `explore_thermometer`, `explore_rain_gauge`, `explore_windsock` (w1); từ bài ba `explore_forecast` (ô Lắng nghe, món Nghe tin bão), `explore_storm` (q1), `tray_leaves` (thẻ q2_wind), `q3` (q3), `q4_storm` (q4), `tray_bend` (q5); từ bài bốn `q6` (w2); từ *Bề mặt Trái Đất* `dong-dat-va-song-than/tray_window` (món bẫy), `q3` (w3), `nui-lua/q1_rain` (w1); từ *Khủng long* `vi-sao-khung-long-bien-mat/q1_storm` (q2). Trong bài: `explore_inside` (kệ Chơi, q1, từ `safe`), `tray_tree` (q1), `tray_bring_in` (q3), `q2_news` (từ `warning`), `q3_torch` (từ `torch`), `explore_power`, `explore_flood_water` (từ vựng).
- **Hai hình "cửa kính" khác nhau:** món bẫy `tray_window` là hình bạn nhỏ đứng cạnh cửa sổ của *Động đất và sóng thần*; lựa chọn `q4_door` là cửa kính lớn phòng khách (không có trẻ). Hai hình, hai vai cùng là "chưa an toàn"; không hình nào vừa đúng vừa sai. Hình câu hỏi q4 nay là sân nhà lúc có bão của bài ba (rà chữ tester 11/11, N6), không còn hình cửa kính.
- **An toàn, không gây sợ** (`_topic.md`, Quy ước hình mục bốn):
  - mọi trẻ vẽ từ phía sau, không vẽ nét mặt; trẻ ở cảnh sau bão (bậc thềm khô, đi vòng xa dây điện) có người lớn đi cùng;
  - không ai ở trong nước sâu, không ai chạm vào dây điện, không có tia lửa, không có nhà sập, mái tốc, cây đổ;
  - món "Lội nước lũ chơi" chỉ vẽ bạn nhỏ đứng ở mép nước, sắp bước xuống.
- **Không có chữ:** mặt đài không có số tần số; đèn pin, ba lô, chai nước không nhãn; không có biển báo có chữ cạnh dây điện.
- **Các lựa chọn trong một câu cùng khung, cùng kiểu:** w1 ba hình dụng cụ đo của bài hai; q1 ba cảnh có một bạn nhỏ nhìn từ sau; q2 ba hình vẽ cùng nét (lá bay trong gió, ếch đồng, chiếc đài); q3 bốn hình vẽ cùng cỡ (hai đồ vật, một cảnh có trẻ, một cảnh biển; cỡ cảnh vừa); q4 ba chỗ của cùng một ngôi nhà, không có trẻ.
- **Màu:** Học: lắng nghe `cham`, ở trong nhà `vang_hoe`, nước lũ `do_son`, dây điện `gi_dong`. Chơi: trước bão `cham`, trong bão `vang_hoe`, sau bão `gi_dong`, nhóm "Không an toàn" `do_son`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core: warning, power_line, torch).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required` (2-1-2 món, cố ý), một nhóm `limit`, tám món.
  - Khởi động: `single_choice` (w1, `recall_from.lesson: thoi-tiet-va-thien-tai/do-thoi-tiet`, khoảng một tuần; đổi theo rà chữ tester 11/11, n10), `true_false` (w2 Sai, `recall_from.lesson: thoi-tiet-va-thien-tai/lu-lut-va-han-han`, một ngày; w3 Đúng, `recall_from.lesson: be-mat-trai-dat/dong-dat-va-song-than`, đã có id). DOK một.
  - Quiz: `single_choice` (q1, q4), `fill_blank_bank` (q2, ba thẻ có hình), `multi_choice` (q3, bốn lựa chọn, hai đúng), `true_false` (q5 Đúng; q6 Sai, `speaker: na`).
  - DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3.
  - Câu có `misconception`: q6, key `shallow_floodwater_safe`.
- **Tham chiếu:** `ids` đã chạy; w1 trỏ bài hai, w2 trỏ bài bốn, đều đã có id. Không có khối `###` mới, không đổi dòng `id:` nào.
- **Vị trí đáp án đúng:** w1 thứ hai; q1 thứ nhất; q2 thẻ thứ ba; q3 thứ hai và thứ ba; q4 thứ hai.
- **Màn Chơi, ví dụ để kiểm:**
  - mở màn → `start`;
  - Nghe tin bão, Ở yên trong nhà, Đứng ở chỗ khô ráo → `balanced`;
  - Lội nước lũ chơi → `has_limited`;
  - Nghe tin bão, Cất đồ vào nhà, Tránh xa dây điện (thiếu trong bão) → `missing.tray_during`;
  - rồi chạm Ở yên trong nhà → `full`; bỏ Cất đồ vào nhà, đặt Ở yên trong nhà → `balanced`.
- **Nhãn dài:** "Shelter under a big tree", "Keep away from wires", "Đứng ở chỗ khô ráo" (món Chơi), "nhiệt kế treo tường" (w1). Nhờ tester xem trên iPhone bề rộng nhỏ nhất.
- **Câu "Em nghĩ sao?":** w2 giữ đúng chữ `statement` của `flood_only_where_it_rains`, là câu hỏi lại của câu "Em nghĩ sao?" bài một (Ghi chú cho dev bài một).
- **Số từ EN trên một màn:** Học khoảng ba mươi ba (mục tiêu 8, hướng dẫn 3, bốn nhãn 7, câu dài nhất 9, ô Từ mới 6); mục tiêu đã rút còn tám từ (rà chữ tester 11/11, n14). Ngưỡng "một màn" cho cả repo do PM chốt. Nhiều chữ nhất ở Quiz là q3 (khoảng hai mươi tám: câu hỏi 9, hướng dẫn 5, bốn nhãn 13, giải thích 9) và q6 (khoảng hai mươi tám).
- **Từ EN có thể ngoài Starters/Movers:** từ mới warning, power line, torch, safe, danger; storm, news, glass, shelter, flood, ankle-deep, holes, wires, germs, workers, balcony, kit, earthquake (*Bề mặt Trái Đất*), drought (bài bốn).
- **Giọng đọc:** EN "ankle-deep", "Fast-moving", "gauge"; VI `term.vi` có dấu phẩy ở `warning`, `danger`. Chuỗi VI không có chữ số, ký hiệu, dấu "—".
- **Asset:** không có audio, `asset` trong markdown.
