---
id: b5315c80-a987-4849-9db5-163c6abebeac
topic: nao-bo-va-giac-quan
slug: ngu-du-giac-va-doi-mu-bao-hiem
order: 4
stage: review
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Sleep and protecting your head
vi: Ngủ đủ giấc và đội mũ bảo hiểm
> Giữ đúng tên ở `syllabus-lessons.md` và `content/syllabus.json` (`new-brain`, bài số bốn).

## Mục tiêu
en: I can say how sleep and helmets help my brain.
vi: Em kể được giấc ngủ và mũ bảo hiểm giúp bộ não ra sao.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-037, ngày 10/11/2026. Đã chạy `ids`. Sửa theo rà chữ tester 10/11 (ticket SK-037, mục "content-editor 10/11 · sửa theo tester").
> Bài cuối (`review`): ôn trộn cả chủ đề (Khởi động ôn bài ba, bài một và *Bề mặt Trái Đất*; câu q3 ôn bài một), quay lại câu "Em nghĩ sao?" của bài một ở w3. Sửa `helmet_only_long_rides` ở ý chính một, ô "Helmet", phần Chơi, câu q1 và câu q6 (gắn key, Na nói đúng).
> 14/11 (SK-044, ngân sách chữ Discoverer A2): thêm `feedback` cho mọi lựa chọn sai và `feedback_true/false`; hai lời giải thích còn một câu, bỏ "Yes!" · "Đúng rồi!" và "The answer is…" · "Đáp án là…"; câu hỏi tối đa mười chữ VI, lời Na và câu ô Học một câu tối đa mười hai chữ. Nháp AI.
> Luật riêng của bài (ticket SK-037): mũ bảo hiểm gắn với đi xe máy, xe đạp ở Việt Nam; không cảnh tai nạn, không máu; giấc ngủ không doạ; số giờ ngủ có [CẦN KIỂM].

## Ý chính
1.en: A helmet keeps your brain safe on every ride.
1.vi: Mũ bảo hiểm che chở bộ não của em trên mọi chuyến đi.
2.en: Your brain needs a good sleep every night.
2.vi: Bộ não cần được ngủ đủ giấc mỗi đêm.
3.en: While you sleep, your brain sorts what you learned.
3.vi: Khi em ngủ, bộ não sắp xếp lại những điều em đã học.
> [CẦN KIỂM] Ý chính ba: khi ngủ, não củng cố trí nhớ, cất giữ điều vừa học (biên tập nhớ, cách nói "sắp xếp lại" là giản lược). Mục Còn mở ba ở `_topic.md`.
> Ý chính xếp mũ bảo hiểm trước giấc ngủ, khác thứ tự chữ trong tên bài, để đi từ cụ thể (cái mũ) tới trừu tượng (não sắp xếp điều đã học khi ngủ). Tên bài giữ theo danh mục.

## Khởi động

> Ba câu, đúng bảng Khởi động ở `_topic.md`:
> - w1 ôn bài ba (khoảng một ngày trước): giác quan nào nghe tiếng mưa trên mái nhà.
> - w2 ôn bài năm *Bề mặt Trái Đất* (khoảng một tháng trước): che đầu khi động đất. Câu nối sang ý chính một: giữ an toàn cho đầu và bộ não.
> - w3 hỏi lại câu "Em nghĩ sao?" của bài một (`brain_stops_when_resting`, không gắn key vì luật chỉ đếm ở Quiz), để bé tự so với lần đầu.

### w1
id: 42de067d-10a4-41c3-ad9a-5a89ab5df7ca
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao
prompt.en: Which sense tells you it is raining on the roof?
prompt.vi: Giác quan nào báo mưa đang rơi trên mái nhà?
image.brief: Dùng lại hình `giac-quan-gui-tin-ve-nao/tray_rain_roof`
image.alt.en: Rain on a roof
image.alt.vi: Mưa rơi trên mái nhà
hint.en: Remember Mai's eyes-closed game.
hint.vi: Em nhớ lại trò Mai nhắm mắt ở bài trước nhé.
explanation_correct.en: Your ears hear the pitter-patter, even with eyes shut.
explanation_correct.vi: Tai nghe tiếng lộp độp, cả khi em nhắm mắt.
> Theo hình designer 10/11: ảnh gốc là mái nhà chung, không phải mái tôn, nên chữ tiếng Việt đổi "mái tôn" thành "mái nhà" (chữ EN vốn đã là "roof").
explanation_wrong.en: Your ears hear the rain on the roof.
explanation_wrong.vi: Tai em nghe thấy tiếng mưa trên mái nhà.
> Ba lựa chọn là bộ giác quan, không có mắt, để câu chỉ có một đáp án (nhìn qua cửa sổ cũng thấy mưa).

#### option w1_nose
correct: false
feedback.en: Your nose smells things, not the drumming on the roof.
feedback.vi: Mũi để ngửi mùi, không nghe tiếng lộp độp.
label.en: nose
label.vi: mũi
image.brief: Dùng lại hình `tray_nose` ở bài `ho-hap/duong-di-cua-khong-khi`
image.alt.en: A nose
image.alt.vi: Cái mũi

#### option w1_tongue
correct: false
feedback.en: Your tongue tastes food in your mouth.
feedback.vi: Lưỡi nếm đồ ăn trong miệng em.
label.en: tongue
label.vi: lưỡi
image.brief: Dùng lại hình `giac-quan-gui-tin-ve-nao/q1_tongue`
image.alt.en: A tongue
image.alt.vi: Cái lưỡi

#### option w1_ear
correct: true
label.en: ear
label.vi: tai
image.brief: Dùng lại hình `nao-dieu-khien-co-the/w1_ear`
image.alt.en: An ear
image.alt.vi: Một cái tai

### w2
id: 43c3b6ea-89f0-4513-9ed5-bf00983813d7
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: be-mat-trai-dat/dong-dat-va-song-than
prompt.en: In an earthquake, cover your head with your arm.
prompt.vi: Khi có động đất, em lấy tay che đầu.
image.brief: Dùng lại hình `q3` ở bài `be-mat-trai-dat/dong-dat-va-song-than`
image.alt.en: A classroom starts to shake
image.alt.vi: Lớp học bắt đầu rung
answer: true
hint.en: Remember the three earthquake steps.
hint.vi: Em nhớ lại ba bước khi có động đất nhé.
explanation_correct.en: Arms over your head protect your skull and brain.
explanation_correct.vi: Cánh tay che đầu, bảo vệ hộp sọ và bộ não.
explanation_wrong.en: Cover your head to keep your brain safe.
explanation_wrong.vi: Em che đầu để giữ an toàn cho bộ não.
feedback_false.en: In an earthquake, things can fall from above.
feedback_false.vi: Động đất làm đồ vật có thể rơi xuống.
> Câu khẳng định khớp món `tray_arms` "Arm over head" · "Tay che đầu" và lựa chọn đúng `q3_arms` của bài đó. Hình câu hỏi là lớp học trống đang rung (câu q3 bài đó), không có ai đang che đầu, nên không lộ đáp án.
> Đáp án Đúng, theo bảng Đáp án Đúng/Sai ở `_topic.md`.

### w3
id: 81d5d1f3-d30c-4686-94df-81d30418979c
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: nao-bo-va-giac-quan/nao-dieu-khien-co-the
prompt.en: When you sleep, your brain switches off.
prompt.vi: Khi em ngủ, bộ não tắt hẳn.
image.brief: Dùng lại hình `q1` ở bài `ho-hap/vi-sao-ta-phai-tho`
image.alt.en: A child asleep under a mosquito net
image.alt.vi: Bạn nhỏ ngủ trong màn
answer: false
hint.en: Remember the All the time picture in the first lesson.
hint.vi: Em nhớ lại ô Suốt ngày đêm ở bài đầu tiên nhé.
explanation_correct.en: Your brain works all night, keeping your heart beating.
explanation_correct.vi: Bộ não làm việc suốt đêm, giữ cho tim em đập.
explanation_wrong.en: Your brain keeps working while you sleep.
explanation_wrong.vi: Bộ não vẫn làm việc khi em ngủ.
feedback_true.en: Even asleep, you still breathe and your heart beats.
feedback_true.vi: Lúc ngủ, em vẫn thở và tim vẫn đập.
> Đúng câu khẳng định của câu "Em nghĩ sao?" ở bài một (Ghi chú cho dev bài một). Đáp án Sai. Giải thích khi đúng không mở đầu bằng "Yes!".

## Học

> Bốn ô, theo bảng kế hoạch: mũ bảo hiểm (ý chính một), đội cho đúng (vận dụng ý chính một), giấc ngủ (ý chính hai), khi em ngủ (ý chính ba).
> Hình ô Học không có chữ. Người trên xe chụp từ phía sau, đội mũ đã cài quai, không thấy biển số.

### explore
id: fce6a73d-e326-40f5-9ced-8111feb4f718
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_helmet
label.en: Helmet
label.vi: Mũ bảo hiểm
color: do_son
sentence.en: A helmet is a hard shell, like a second skull.
sentence.vi: Mũ bảo hiểm là vỏ cứng, như hộp sọ thứ hai.
image.brief: [hình vẽ] Một người lớn chở một bạn nhỏ ngồi sau trên xe máy, đi chậm trong một con ngõ nhỏ ở Việt Nam, vẽ từ phía sau; cả hai đội mũ bảo hiểm; không vẽ nét mặt, không có biển số xe, không có logo hãng xe hay logo trên mũ, không có biển chữ trong ngõ. Bạn nhỏ ngồi sau người lớn, không đứng hay ngồi phía trước. Món Chơi `tray_short_ride` và hình câu q2 dùng lại hình này. Từ khoá tìm ảnh (EN): Vietnam motorbike parent child helmets alley back view
image.alt.en: A grown-up and a child on a motorbike, both in helmets
image.alt.vi: Người lớn và bạn nhỏ đi xe máy, cả hai đội mũ bảo hiểm
examples.1.en: on a motorbike
examples.1.vi: khi ngồi xe máy
examples.2.en: on a bicycle
examples.2.vi: khi đi xe đạp
examples.3.en: even on short rides
examples.3.vi: cả khi đi gần
examples.4.en: one that fits your head
examples.4.vi: chiếc mũ vừa với đầu em
> Ví dụ ba sửa `helmet_only_long_rides`. [CẦN KIỂM] như ghi chú ở misconception đó: chữ cho trẻ nói "nên đội", không nhắc luật. Hình vẽ (designer 10/11: không có ảnh hợp lệ không lộ biển số, mặt người).

#### group explore_strap
label.en: Wear it right
label.vi: Đội cho đúng
color: cham
sentence.en: Click the strap so the helmet stays on.
sentence.vi: Em cài quai để mũ không bị rơi.
image.brief: [hình vẽ] Đôi bàn tay đang cài khoá quai của một chiếc mũ bảo hiểm đặt trên bàn, vẽ cận thấy rõ hai nửa khoá nhựa khớp vào nhau; không vẽ nét mặt, không có logo hay chữ trên mũ. Món Chơi `tray_strap` và từ `strap` dùng lại hình này. Từ khoá tìm ảnh (EN): helmet chin strap buckle hands close up
image.alt.en: Hands clicking a helmet strap
image.alt.vi: Đôi tay cài quai mũ bảo hiểm
examples.1.en: snug, not loose
examples.1.vi: vừa khít, không lỏng
examples.2.en: flat on your head, not tipped back
examples.2.vi: đội ngay ngắn, không ngả ra sau gáy
examples.3.en: strap clicked under your chin
examples.3.vi: quai cài dưới cằm
> [CẦN KIỂM] Cách đội mũ đúng cho trẻ: mũ vừa đầu, phía trước cách lông mày khoảng hai ngón tay, quai cài vừa dưới cằm (biên tập nhớ khuyến cáo phổ thông). Chữ cho trẻ không đưa số đo.

#### group explore_sleep
label.en: Sleep
label.vi: Giấc ngủ
color: gi_dong
sentence.en: Children your age need nine to twelve hours of sleep.
sentence.vi: Trẻ tuổi em cần ngủ chín đến mười hai tiếng.
> [CẦN KIỂM] Số giờ ngủ: biên tập nhớ khuyến nghị của Viện Hàn lâm Y học Giấc ngủ Hoa Kỳ cho trẻ sáu tới mười hai tuổi là chín tới mười hai giờ trong hai mươi bốn giờ, tính cả ngủ trưa. Cần chuyên gia nhi khoa hoặc khuyến nghị của Bộ Y tế. Câu thay nếu bỏ con số: "Children need more sleep than grown-ups." · "Trẻ em cần ngủ nhiều hơn người lớn." Quiz không hỏi con số này.
image.brief: [hình vẽ] Một chiếc giường gọn gàng có màn vén lên, đèn ngủ dịu bên cạnh, gối và chăn đã xếp, vẽ chéo; không có người, không có chữ, không có đồ chơi có nhãn hiệu, không có điện thoại. Món Chơi `tray_bed`, câu q3 và từ `bedtime` dùng lại hình này. Từ khoá tìm ảnh (EN): bed mosquito net bedroom
image.alt.en: A bed with a mosquito net
image.alt.vi: Chiếc giường có mắc màn
examples.1.en: go to bed early
examples.1.vi: đi ngủ sớm
examples.2.en: a short nap after lunch
examples.2.vi: ngủ trưa một chút
examples.3.en: a dark, quiet room
examples.3.vi: phòng tối và yên tĩnh
examples.4.en: no games late at night
examples.4.vi: không chơi điện tử tới khuya
> [CẦN KIỂM] Lời khuyên "phòng tối, yên tĩnh" và "không chơi điện tử tới khuya" là khuyến cáo phổ thông về giấc ngủ của trẻ. Nói theo hướng việc nên làm, không doạ.

#### group explore_dream
label.en: While you sleep
label.vi: Khi em ngủ
color: vang_hoe
sentence.en: While you sleep, your brain sorts what you learned.
sentence.vi: Khi em ngủ, bộ não sắp xếp lại điều em đã học.
image.brief: Dùng lại hình `q1` ở bài `ho-hap/vi-sao-ta-phai-tho`
image.alt.en: A child asleep under a mosquito net
image.alt.vi: Bạn nhỏ ngủ trong màn
examples.1.en: your body rests
examples.1.vi: cơ thể em được nghỉ ngơi
examples.2.en: your brain keeps new words safe
examples.2.vi: bộ não cất giữ những từ mới
examples.3.en: you may dream
examples.3.vi: em có thể nằm mơ
examples.4.en: you wake up fresh
examples.4.vi: em thức dậy tỉnh táo
> Ô này sửa lại `brain_stops_when_resting` lần nữa: cơ thể nghỉ, bộ não vẫn làm việc. Ví dụ một nói "cơ thể nghỉ ngơi", không nói "não nghỉ", để khỏi trái câu w3. [CẦN KIỂM] như ý chính ba.

### new_words
id: 827176a7-68a7-4618-9bf4-4fad1b5cbab2
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: helmet, strap, bedtime

## Chơi

> Bé chọn ba việc tốt cho bộ não trong một ngày: một việc về mũ bảo hiểm (cài quai, đội mũ cả khi đi gần), một việc cho giấc ngủ (đi ngủ sớm, ngủ trưa), một việc để học (đọc sách, ghép tranh; ôn bài một). Không được chọn việc không tốt cho bộ não.
> - Ba món bẫy là cảnh quen ở Việt Nam: mũ treo trên tay lái (có mũ mà không đội), quai để hở (đội mà không cài), chơi điện tử tới khuya. Hai món đầu chạm `helmet_only_long_rides`.
> - Cả kệ là hình vẽ (theo hình designer 10/11: `explore_helmet` không có ảnh hợp lệ, nên vẽ cả kệ cho cùng kiểu). Không vẽ nét mặt, không biển số, không logo. Lời nhắn nói theo hướng việc nên làm, không doạ.

### tray
id: 9975e763-21a7-4ec0-a655-96b6f7543081
type: build_tray
version: 1
prompt.en: A good day for your brain
prompt.vi: Một ngày tốt cho bộ não
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick one for helmets, one for sleep, one for learning.
messages.start.vi: Em chọn một việc về mũ bảo hiểm, một việc cho giấc ngủ, một việc để học nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Your brain is safe, rested and learning.
messages.balanced.vi: Tuyệt! Bộ não của em được an toàn, được nghỉ ngơi và được học điều mới.
messages.has_limited.en: That is not good for your brain. Tap it to take it off.
messages.has_limited.vi: Việc đó không tốt cho bộ não. Em chạm vào để bỏ ra nhé.
messages.missing.tray_helmet.en: You still need something for helmets.
messages.missing.tray_helmet.vi: Em còn thiếu một việc về mũ bảo hiểm.
messages.missing.tray_sleep.en: You still need something for sleep.
messages.missing.tray_sleep.vi: Em còn thiếu một việc cho giấc ngủ.
messages.missing.tray_learn.en: You still need something for learning.
messages.missing.tray_learn.vi: Em còn thiếu một việc để học.

#### group tray_helmet
label.en: Helmet on
label.vi: Đội mũ bảo hiểm
color: do_son
role: required

#### group tray_sleep
label.en: Good sleep
label.vi: Ngủ đủ giấc
color: gi_dong
role: required

#### group tray_learn
label.en: Use your brain
label.vi: Cho bộ não học
color: cham
role: required

#### group tray_not_good
label.en: Not good for your brain
label.vi: Không tốt cho bộ não
color: nau_dat
role: limit

#### item tray_strap
label.en: Strap clicked
label.vi: Đã cài quai mũ
group: tray_helmet
image.brief: Dùng lại hình `ngu-du-giac-va-doi-mu-bao-hiem/explore_strap`
image.alt.en: Hands clicking a helmet strap
image.alt.vi: Đôi tay cài quai mũ bảo hiểm

#### item tray_handlebar
label.en: Helmet on the handlebars
label.vi: Mũ treo trên tay lái
group: tray_not_good
image.brief: [hình vẽ] Một chiếc mũ bảo hiểm treo trên tay lái của chiếc xe máy đang đỗ, vẽ gần phần tay lái; không có người, không có biển số, không có logo hãng xe hay logo trên mũ, không có chữ. Câu q3 dùng lại hình này. Từ khoá tìm ảnh (EN): helmet hanging on motorbike handlebar
image.alt.en: A helmet hanging on handlebars
image.alt.vi: Mũ bảo hiểm treo trên tay lái

#### item tray_bed
label.en: Early bedtime
label.vi: Đi ngủ sớm
group: tray_sleep
image.brief: Dùng lại hình `ngu-du-giac-va-doi-mu-bao-hiem/explore_sleep`
image.alt.en: A bed with a mosquito net
image.alt.vi: Chiếc giường có mắc màn
> Rà chữ tester 10/11 (n14): bỏ giờ cụ thể "chín giờ" ở nhãn, vì nhiều nhà ở Việt Nam cho con ngủ muộn hơn, và mục An toàn của chủ đề không chê nếp nhà. Nhãn nay khớp ví dụ "go to bed early" của ô Sleep.

#### item tray_book
label.en: Read a book
label.vi: Đọc sách
group: tray_learn
image.brief: Dùng lại hình `nao-dieu-khien-co-the/tray_book`
image.alt.en: A child reading a book
image.alt.vi: Bạn nhỏ đang đọc sách

#### item tray_open_strap
label.en: Strap left open
label.vi: Quai để hở
group: tray_not_good
image.brief: [hình vẽ] Một chiếc mũ bảo hiểm đặt trên yên xe hay trên bàn, hai đầu quai buông thõng, khoá chưa cài, vẽ gần; không có người, không có logo, không có chữ. Từ khoá tìm ảnh (EN): helmet unbuckled strap hanging
image.alt.en: A helmet with its strap hanging open
image.alt.vi: Mũ bảo hiểm có quai buông thõng

#### item tray_short_ride
label.en: Helmet on a short ride
label.vi: Đội mũ cả khi đi gần
group: tray_helmet
image.brief: Dùng lại hình `ngu-du-giac-va-doi-mu-bao-hiem/explore_helmet`
image.alt.en: A grown-up and a child on a motorbike, both in helmets
image.alt.vi: Người lớn và bạn nhỏ đi xe máy, cả hai đội mũ bảo hiểm

#### item tray_nap
label.en: Nap after lunch
label.vi: Ngủ trưa
group: tray_sleep
image.brief: Dùng lại hình `q3_hammock` ở bài `ho-hap/tho-khi-chay-nhay`
image.alt.en: A hammock between two trees
image.alt.vi: Cái võng mắc giữa hai cây

#### item tray_late_games
label.en: Games late at night
label.vi: Chơi điện tử tới khuya
group: tray_not_good
image.brief: [hình vẽ] Một bàn tay cầm điện thoại trong phòng tối, màn hình chỉ là vệt sáng, không có trò chơi, ứng dụng, logo hay chữ; không vẽ nét mặt. Câu q3 dùng lại hình này. Từ khoá tìm ảnh (EN): hand holding phone dark room night glow
image.alt.en: A phone glowing in a dark room
image.alt.vi: Điện thoại sáng trong phòng tối

#### item tray_puzzle
label.en: Do a puzzle
label.vi: Ghép tranh
group: tray_learn
image.brief: Dùng lại hình `nao-dieu-khien-co-the/explore_think`
image.alt.en: Hands doing a jigsaw puzzle
image.alt.vi: Đôi tay đang ghép tranh

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Bốn format: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, thẻ từ có hình. Câu q3 ôn bài một (đọc sách là việc cho bộ não học).

### q1
id: 3e871525-9ac2-427f-bf2f-b1aa2d6f7dfe
format: single_choice
version: 1
dok: 1
prompt.en: Which one keeps your head safe on a motorbike?
prompt.vi: Thứ nào che chở đầu em khi ngồi xe máy?
image.brief: [hình vẽ] Một chiếc xe máy đỗ bên lề con phố yên tĩnh ở Việt Nam, vẽ nghiêng; không có người, không có mũ bảo hiểm trong hình, không có biển số, không có logo hãng xe, không có biển chữ. Từ khoá tìm ảnh (EN): parked motorbike quiet street Vietnam
image.alt.en: A parked motorbike
image.alt.vi: Chiếc xe máy đang đỗ
hint.en: Remember the Helmet picture in the lesson.
hint.vi: Em nhớ lại ô Mũ bảo hiểm trong bài học nhé.
explanation_correct.en: The hard shell takes a bump instead of your head.
explanation_correct.vi: Lớp vỏ cứng đỡ cú va thay cho đầu em.
explanation_wrong.en: A hard helmet keeps your head and brain safe.
explanation_wrong.vi: Mũ bảo hiểm cứng che chở đầu và bộ não.
> Nón lá và mũ lưỡi trai là bẫy quen: người lớn, trẻ em hay đội khi đi xe đạp, xe máy gần nhà (`helmet_only_long_rides`). Không chê nón lá; giải thích chỉ nói nón lá để che nắng. Ba hình vẽ cùng kiểu (theo hình designer 10/11): một chiếc mũ trên nền trơn, vẽ chéo, cùng cỡ.
> Rà chữ tester 10/11: gợi ý cũ "Thứ nào cứng, giống như hộp sọ?" nói thẳng tiêu chí đáp án (n5). Lựa chọn mũ vải (cùng ảnh câu q5 bài một) đổi thành mũ lưỡi trai, để câu không còn là tập con của câu q5 bài một; mũ bảo hiểm dùng một ảnh mới (mũ cỡ trẻ em), để cả ba ảnh đều mới và đáp án không phải ảnh duy nhất bé đã gặp (n6, cùng ý N2). Giải thích EN và VI nay cùng gọi tên hai thứ kia.

#### option q1_helmet
correct: true
label.en: helmet
label.vi: mũ bảo hiểm
image.brief: [hình vẽ] Một chiếc mũ bảo hiểm xe máy nửa đầu cỡ trẻ em, màu hồng trơn (khác chiếc mũ của câu q5 bài `nao-dieu-khien-co-the`), quai đã cài, đặt trên nền trơn, vẽ chéo, cùng cỡ với nón lá và mũ lưỡi trai; không có hình in, logo, tem hay chữ; không có người đội. Từ khoá tìm ảnh (EN): kids motorcycle helmet plain background
image.alt.en: A helmet
image.alt.vi: Chiếc mũ bảo hiểm

#### option q1_conical
correct: false
feedback.en: A conical hat shades you from sun and rain.
feedback.vi: Nón lá che nắng, che mưa cho em.
label.en: conical hat
label.vi: nón lá
image.brief: [hình vẽ] Một chiếc nón lá Việt Nam đặt trên nền trơn, vẽ chéo, cùng cỡ với chiếc mũ bảo hiểm và mũ lưỡi trai; không có chữ, không có hình in trên nón, không có người đội. Từ khoá tìm ảnh (EN): Vietnamese conical hat non la plain background
image.alt.en: A conical hat
image.alt.vi: Chiếc nón lá

#### option q1_cap
correct: false
feedback.en: A cap is soft and only shades your eyes.
feedback.vi: Mũ lưỡi trai mềm, chỉ che nắng cho mắt.
label.en: cap
label.vi: mũ lưỡi trai
image.brief: [hình vẽ] Một chiếc mũ lưỡi trai vải màu trơn đặt trên nền trơn, vẽ chéo, cùng cỡ với hai chiếc kia; không có logo, không có chữ, không có hình thêu; không có người đội. Từ khoá tìm ảnh (EN): plain baseball cap plain background
image.alt.en: A cap
image.alt.vi: Chiếc mũ lưỡi trai

### q2
id: 27f2aafa-6dda-4713-b4d0-f07dcd8ae02e
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `ngu-du-giac-va-doi-mu-bao-hiem/explore_helmet`
image.alt.en: A grown-up and a child on a motorbike, both in helmets
image.alt.vi: Người lớn và bạn nhỏ đi xe máy, cả hai đội mũ bảo hiểm
sentence.en: Click the {1} so your helmet stays on.
sentence.vi: Em cài {1} để mũ không bị rơi.
answers: q2_strap
hint.en: Remember the Wear it right picture.
hint.vi: Em nhớ lại ô Đội cho đúng nhé.
explanation_correct.en: A snug strap keeps the helmet on, even on bumps.
explanation_correct.vi: Quai cài vừa khít giữ mũ chặt, cả khi xe xóc.
explanation_wrong.en: Click the strap under your chin.
explanation_wrong.vi: Em cài quai mũ dưới cằm.
> Hình câu hỏi vẽ từ phía sau, không thấy khoá quai, nên không lộ đáp án. Ba thẻ từ là ba bộ phận quen của chuyến đi xe, cùng là hình vẽ cận (theo hình designer 10/11), không có tay người.
> Rà chữ tester 10/11: thẻ đúng chuyển xuống thứ ba (N1). Thẻ `q2_strap` dùng một hình mới (khoá quai đã cài, không có tay), không dùng lại hình ô `explore_strap`, để đáp án không phải hình duy nhất bé đã gặp ở phần Học (N2).

#### bank q2_bell
label.en: bell
label.vi: chuông xe
feedback.en: A bell rings to warn people on the road.
feedback.vi: Chuông xe kêu để báo người trên đường.
image.brief: [hình vẽ] Một chiếc chuông xe đạp gắn trên tay lái, vẽ cận; không có logo, không có chữ. Từ khoá tìm ảnh (EN): bicycle bell handlebar close up
image.alt.en: A bicycle bell
image.alt.vi: Chiếc chuông xe đạp

#### bank q2_seat
label.en: seat
label.vi: yên xe
feedback.en: A seat is where you sit on a bike.
feedback.vi: Yên xe là chỗ để em ngồi.
image.brief: [hình vẽ] Một chiếc yên xe đạp màu đen, vẽ cận; không có logo, không có chữ. Từ khoá tìm ảnh (EN): bicycle saddle close up
image.alt.en: A bicycle seat
image.alt.vi: Chiếc yên xe đạp

#### bank q2_strap
label.en: strap
label.vi: quai mũ
image.brief: [hình vẽ] Khoá quai của một chiếc mũ bảo hiểm đã cài, hai nửa khoá nhựa khớp vào nhau, dây quai hai bên, vẽ cận trên nền trơn; không có tay người, không có logo, không có chữ. Cùng cỡ cận với chuông xe và yên xe. Từ khoá tìm ảnh (EN): helmet chin strap buckle close up
image.alt.en: A clicked helmet strap
image.alt.vi: Quai mũ bảo hiểm đã cài

### q3
id: 11461a24-84bd-45d1-8d31-72a76f5f628f
format: multi_choice
version: 1
dok: 2
prompt.en: Which ones are good for your brain?
prompt.vi: Những việc nào tốt cho bộ não?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `nao-dieu-khien-co-the/explore_head`
image.alt.en: A head with the brain inside the skull
image.alt.vi: Đầu một bạn nhỏ, bộ não nằm trong hộp sọ
hint.en: Think of the three groups in today's game.
hint.vi: Em nhớ lại ba nhóm ở trò chơi hôm nay nhé.
explanation_correct.en: Reading teaches your brain, and sleep helps it remember.
explanation_correct.vi: Đọc sách giúp não học, giấc ngủ giúp não nhớ.
explanation_wrong.en: Reading and an early bedtime are good for your brain.
explanation_wrong.vi: Đọc sách và đi ngủ sớm đều tốt cho bộ não.
> DOK 2: phân loại, ôn bài một (đọc sách) và bài này (giấc ngủ, mũ bảo hiểm). Bốn ảnh dùng lại kệ Chơi, cùng là ảnh chụp.

#### option q3_games
correct: false
feedback.en: Late games keep your brain awake when it needs sleep.
feedback.vi: Chơi khuya làm bộ não không được ngủ đủ.
label.en: games late at night
label.vi: chơi điện tử tới khuya
image.brief: Dùng lại hình `ngu-du-giac-va-doi-mu-bao-hiem/tray_late_games`
image.alt.en: A phone glowing in a dark room
image.alt.vi: Điện thoại sáng trong phòng tối

#### option q3_book
correct: true
label.en: reading a book
label.vi: đọc sách
image.brief: Dùng lại hình `nao-dieu-khien-co-the/tray_book`
image.alt.en: A child reading a book
image.alt.vi: Bạn nhỏ đang đọc sách

#### option q3_handlebar
correct: false
feedback.en: A helmet on the handlebars cannot guard your head.
feedback.vi: Mũ treo trên tay lái thì không che được đầu.
label.en: helmet on the handlebars
label.vi: mũ treo trên tay lái
image.brief: Dùng lại hình `ngu-du-giac-va-doi-mu-bao-hiem/tray_handlebar`
image.alt.en: A helmet hanging on handlebars
image.alt.vi: Mũ bảo hiểm treo trên tay lái

#### option q3_bed
correct: true
label.en: an early bedtime
label.vi: đi ngủ sớm
image.brief: Dùng lại hình `ngu-du-giac-va-doi-mu-bao-hiem/explore_sleep`
image.alt.en: A bed with a mosquito net
image.alt.vi: Chiếc giường có mắc màn

### q4
id: 3579bfa9-cd2b-4d2d-b7e3-504673db5a5f
format: single_choice
version: 1
dok: 2
prompt.en: Which helmet is worn the right way?
prompt.vi: Chiếc mũ nào được đội đúng cách?
image.brief: Dùng lại hình `nao-dieu-khien-co-the/q5_helmet`
image.alt.en: A helmet
image.alt.vi: Chiếc mũ bảo hiểm
hint.en: Look at the strap and the front of each helmet.
hint.vi: Em nhìn quai mũ và phía trước của từng chiếc mũ nhé.
explanation_correct.en: Sitting flat, it covers your forehead and stays put.
explanation_correct.vi: Mũ ngay ngắn che kín trán và không bị xô lệch.
explanation_wrong.en: Wear it flat, with the strap clicked.
explanation_wrong.vi: Đội mũ ngay ngắn và cài quai chặt.
> DOK 2: áp ô "Wear it right" vào ba cách đội. Ba lựa chọn là ba hình vẽ cùng một khuôn đầu và vai nhìn nghiêng (bộ khuôn người của bài một), chỉ khác cách đội mũ; người đội mũ thì vẽ, không dùng ảnh trẻ thật (Quy ước hình, mục hai).
> Rà chữ tester 10/11 (N4): ba nhãn và ba `alt` cùng một khuôn hai vế (vị trí mũ, quai), nên không nhãn nào nổi bật; bé phải xét cả hai vế, và gợi ý (nhìn quai và phía trước mũ) mới đúng là gợi ý. Trước đây nhãn đúng là nhãn duy nhất có hai vế.

#### option q4_back
correct: false
feedback.en: Tipped back, the helmet leaves your forehead bare.
feedback.vi: Mũ ngả ra sau thì trán em bị hở.
label.en: tipped back, strap clicked
label.vi: ngả ra sau gáy, đã cài quai
image.brief: [hình vẽ] Khuôn đầu và vai một bạn nhỏ nhìn nghiêng, cùng nét bộ khuôn người của câu q1 bài `nao-dieu-khien-co-the`, không vẽ nét mặt; đội mũ bảo hiểm nửa đầu bị ngả ra sau, lộ cả vầng trán, quai đã cài; nền kem trơn; không có logo, không có chữ.
image.alt.en: A helmet tipped back, strap clicked
image.alt.vi: Mũ bảo hiểm ngả ra sau, đã cài quai

#### option q4_open
correct: false
feedback.en: With the strap open, the helmet can fall off.
feedback.vi: Quai để hở thì mũ dễ bị rơi.
label.en: flat, strap hanging open
label.vi: ngay ngắn, quai buông thõng
image.brief: [hình vẽ] Cùng khuôn đầu và vai nhìn nghiêng như lựa chọn `q4_back`; đội mũ bảo hiểm ngay ngắn nhưng hai đầu quai buông thõng hai bên má, chưa cài; nền kem trơn; không có logo, không có chữ.
image.alt.en: A helmet sitting flat, strap hanging open
image.alt.vi: Mũ bảo hiểm đội ngay ngắn, quai buông thõng

#### option q4_right
correct: true
label.en: flat, strap clicked
label.vi: ngay ngắn, đã cài quai
image.brief: [hình vẽ] Cùng khuôn đầu và vai nhìn nghiêng như lựa chọn `q4_back`; đội mũ bảo hiểm ngay ngắn, vành trước nằm trên lông mày, quai đã cài vừa dưới cằm; nền kem trơn; không có logo, không có chữ.
image.alt.en: A helmet sitting flat, strap clicked
image.alt.vi: Mũ bảo hiểm đội ngay ngắn, đã cài quai

### q5
id: b3668af8-fb70-4879-9cd3-cf9a273ebbef
format: single_choice
version: 1
dok: 2
prompt.en: What helps Nam remember today's new words?
prompt.vi: Điều gì giúp Nam nhớ lâu từ mới hôm nay?
image.brief: Dùng lại hình `giac-quan-gui-tin-ve-nao/explore_send`
image.alt.en: A school drum
image.alt.vi: Chiếc trống trường
hint.en: Remember the While you sleep picture.
hint.vi: Em nhớ lại ô Khi em ngủ nhé.
explanation_correct.en: While he sleeps, his brain sorts the new words.
explanation_correct.vi: Khi Nam ngủ, bộ não sắp xếp lại các từ mới.
explanation_wrong.en: A good night's sleep helps him remember.
explanation_wrong.vi: Ngủ đủ giấc giúp Nam nhớ bài.
> DOK 2: áp ý chính ba và ô "Sleep" vào tình huống quen (học từ mới ở trường). Bẫy mạnh là "thức cả đêm để học": bé dễ nghĩ học nhiều hơn thì nhớ hơn. Bẫy thứ hai "ngủ mà vẫn bật ti vi" là việc khác loại: có ngủ, nhưng phòng sáng và ồn, trái ví dụ "a dark, quiet room" của ô Sleep. [CẦN KIỂM] ngủ đủ giúp nhớ bài; ngủ khi ti vi còn bật làm giấc ngủ kém đi.
> Rà chữ tester 10/11 (N2, N3, n10): bỏ lựa chọn "chơi điện tử tới khuya" (trùng vai và trùng ảnh với câu q3, và trùng ý "thức khuya" với bẫy kia); đáp án đúng dùng một ảnh mới (phòng ngủ đã tắt đèn), không dùng lại ảnh ô `explore_sleep` (cũng là đáp án đúng của câu q3). Giải thích khi sai bỏ vế "khó nhớ bài" mà chỉ bản tiếng Việt có, EN và VI nay cùng một ý.
> Hình câu hỏi là trống trường (dùng lại bài ba), gợi "ở trường", không gợi đáp án. Ba lựa chọn đều là hình vẽ mới (theo hình designer 10/11), cùng là cảnh trong phòng ban đêm, không có người.

#### option q5_study_night
correct: false
feedback.en: Staying up all night leaves no time for sleep.
feedback.vi: Thức cả đêm thì não không được ngủ.
label.en: study all night
label.vi: thức cả đêm để học
image.brief: [hình vẽ] Một chiếc đèn bàn đang sáng cạnh quyển vở mở trên bàn học, ngoài cửa sổ trời tối đen; không có người, không có chữ trong vở, không có logo. Từ khoá tìm ảnh (EN): desk lamp notebook night window dark
image.alt.en: A desk lamp on at night
image.alt.vi: Đèn bàn sáng lúc đêm khuya

#### option q5_sleep
correct: true
label.en: a good night's sleep
label.vi: ngủ đủ giấc
image.brief: [hình vẽ] Một phòng ngủ ban đêm đã tắt đèn, chỉ có ánh trăng nhạt qua cửa sổ, chiếc giường có màn đã buông, vẽ từ cửa phòng nhìn vào; không có người, không có đèn, ti vi hay điện thoại nào đang sáng, không có chữ. Khác hình ô `explore_sleep` (đèn ngủ, màn vén); cùng là cảnh ban đêm như hai lựa chọn kia, để bé không chọn theo độ sáng của hình. Từ khoá tìm ảnh (EN): dark bedroom night moonlight bed
image.alt.en: A dark bedroom at night
image.alt.vi: Phòng ngủ tối lúc đêm
> Ba hình của câu đều là cảnh ban đêm trong phòng: đèn bàn sáng, ti vi sáng, phòng tắt đèn. Đáp án khớp ví dụ "a dark, quiet room" của ô Sleep.

#### option q5_tv
correct: false
feedback.en: A bright, noisy TV makes sleep worse.
feedback.vi: Ti vi sáng và ồn làm giấc ngủ kém đi.
label.en: sleep with the TV on
label.vi: ngủ mà vẫn bật ti vi
image.brief: [hình vẽ] Một phòng tối, chiếc ti vi trên kệ đang sáng, màn hình chỉ là vệt sáng xanh nhạt, không có hình hay chữ trên màn hình; phía trước có góc giường; không có người, không có logo ti vi, không có chữ. Từ khoá tìm ảnh (EN): television glowing dark bedroom night
image.alt.en: A TV glowing in a dark room
image.alt.vi: Ti vi sáng trong phòng tối

### q6
id: 593fc368-67ff-4c29-917d-6e8c68261052
format: true_false
version: 1
dok: 3
misconception: helmet_only_long_rides
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: School is very close, but I still wear my helmet.
statement.vi: Trường ở rất gần, nhưng mình vẫn đội mũ bảo hiểm.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: true
image.brief: [ảnh] Một con ngõ nhỏ ở Việt Nam buổi sáng, vắng người, hai bên là nhà thấp và cây xanh, chụp dọc theo ngõ; không có người, không có xe có biển số, không có biển hiệu, số nhà hay chữ. Khác hình `explore_helmet` (không có xe, không có người). Designer 10/11 đã cắt tấm biển nhỏ trên cổng; nên mở ảnh gốc xem lại. Từ khoá tìm ảnh (EN): narrow alley Vietnam morning quiet
image.alt.en: A quiet little alley
image.alt.vi: Con ngõ nhỏ vắng người
hint.en: Is a short ride always safe?
hint.vi: Đi gần thì có chắc chắn an toàn không em?
explanation_correct.en: Wear a helmet on every ride, short or long.
explanation_correct.vi: Đi gần hay đi xa, em đều đội mũ bảo hiểm.
explanation_wrong.en: Short rides need a helmet, too.
explanation_wrong.vi: Đi gần cũng cần đội mũ bảo hiểm.
feedback_false.en: A short ride is still a ride on the road.
feedback_false.vi: Đi gần thì vẫn là đi trên đường.
> DOK 3: bé đánh giá việc Na làm. Bé còn tin "đi gần thì không cần mũ" sẽ cho là Na làm thừa và chọn "Na chưa đúng". Đáp án Đúng, theo bảng Đáp án Đúng/Sai ở `_topic.md`.
> Gợi ý hỏi đúng chỗ cần nghĩ, không doạ, không nhắc tai nạn. Giải thích không nói "nếu không đội thì…".

## Từ vựng

### helmet
id: c69e5362-e52e-434a-9f93-8f9486084d7c
tier: core
term.en: helmet
term.vi: mũ bảo hiểm
example.en: Wear a helmet on every ride.
example.vi: Đi xe lần nào em cũng đội mũ bảo hiểm.
image.brief: Dùng lại hình `nao-dieu-khien-co-the/q5_helmet`
image.alt.en: A helmet
image.alt.vi: Chiếc mũ bảo hiểm

### strap
id: f3c0da88-3bd2-44f6-98f4-031c990c2ae6
tier: core
term.en: strap
term.vi: quai mũ
example.en: Click the strap under your chin.
example.vi: Em cài quai mũ dưới cằm.
image.brief: Dùng lại hình `ngu-du-giac-va-doi-mu-bao-hiem/explore_strap`
image.alt.en: Hands clicking a helmet strap
image.alt.vi: Đôi tay cài quai mũ bảo hiểm
> `term.vi` là "quai mũ", nghĩa trong bài; "strap" còn là quai túi, dây đeo.

### bedtime
id: 74ee7be2-3eb4-4527-bab7-bd04c2c72d66
tier: core
term.en: bedtime
term.vi: giờ đi ngủ
example.en: I go to bed at the same time each night.
example.vi: Tối nào em cũng đi ngủ đúng giờ.
> Rà chữ tester 10/11 (n14): bỏ giờ cụ thể "chín giờ" (không chê nếp nhà; khớp món kệ "Early bedtime").
image.brief: Dùng lại hình `ngu-du-giac-va-doi-mu-bao-hiem/explore_sleep`
image.alt.en: A bed with a mosquito net
image.alt.vi: Chiếc giường có mắc màn

### nap
id: 3b65550a-f6ee-43da-bc21-d9d5a6e3145e
tier: extra
term.en: nap
term.vi: giấc ngủ trưa
example.en: A short nap after lunch helps you rest.
example.vi: Ngủ trưa một chút giúp em nghỉ ngơi.
image.brief: Dùng lại hình `q3_hammock` ở bài `ho-hap/tho-khi-chay-nhay`
image.alt.en: A hammock between two trees
image.alt.vi: Cái võng mắc giữa hai cây

### dream
id: 22336b68-7ff5-48cb-b72e-b8d4131aaaa5
tier: extra
term.en: dream
term.vi: giấc mơ, nằm mơ
example.en: You may dream while you sleep.
example.vi: Em có thể nằm mơ khi ngủ.
image.brief: Dùng lại hình `q1` ở bài `ho-hap/vi-sao-ta-phai-tho`
image.alt.en: A child asleep under a mosquito net
image.alt.vi: Bạn nhỏ ngủ trong màn
> `term.vi` có hai nghĩa vì "dream" vừa là danh từ vừa là động từ. [Nghe thử] giọng VI đọc dấu phẩy thành chỗ ngắt (rà chữ tester 10/11, n16).

## Thưởng

### helmet_card
id: 881fe4d0-3152-4875-8040-736407d58125
set: body
rarity: common
name.en: Helmet
name.vi: Mũ bảo hiểm
tag.en: Head safe
tag.vi: Che chở đầu
fact.en: Foam inside a helmet squashes to soak up bumps.
fact.vi: Lớp xốp bên trong mũ bảo hiểm bị nén lại để đỡ cú va.
> [CẦN KIỂM] Lớp xốp cứng (thường là xốp EPS) trong mũ bị nén lại khi va đập, hấp thụ lực, nên mũ đã chịu một cú va mạnh thì nên thay (biên tập nhớ). Thẻ không nói ý "nên thay mũ" để khỏi gợi cảnh va chạm.
image.brief: [hình vẽ] Mặt trong của một chiếc mũ bảo hiểm úp ngửa, vẽ từ trên xuống thấy rõ lớp xốp màu trắng và lớp lót; không có logo, tem, nhãn ghi chữ, không có người. Từ khoá tìm ảnh (EN): helmet inside foam liner top view
image.alt.en: The foam inside a helmet
image.alt.vi: Lớp xốp bên trong mũ bảo hiểm
> Key thẻ là `helmet_card`, vì từ vựng đã có `helmet`.

## Ghi chú cho hoạ sĩ

- **Loại hình** (theo file chọn ảnh designer 10/11): gần như cả bài là hình tự vẽ; chỉ hình câu q6 (ngõ vắng) là ảnh chụp, cùng các hình dùng lại từ bài khác. Hình không có chữ.
- **An toàn, quan trọng nhất ở bài này:**
  - Không cảnh tai nạn, không xe đổ, không mũ vỡ, không máu, không băng bó, không bệnh viện, không xe cứu thương.
  - Người trên xe máy: vẽ từ phía sau; người lớn và bạn nhỏ đều đội mũ đã cài quai; bạn nhỏ ngồi sau, không đứng hay ngồi phía trước người lái; không có ba người trên một xe; xe đi chậm trong ngõ hoặc đang dừng.
  - Không thấy biển số xe, logo hãng xe, logo hay tem trên mũ (cắt, làm mờ, hoặc chọn ảnh khác).
  - Cảnh ngủ: giường trống có màn, võng trống, hình vẽ bạn ngủ quay mặt vào tường. Không ảnh trẻ đang ngủ thấy mặt.
  - Điện thoại ở món "chơi điện tử tới khuya": màn hình chỉ là vệt sáng.
- **Theo hình designer 10/11:** `explore_helmet` không có ảnh hợp lệ, nên vẽ; kéo theo cả kệ Chơi (đúng điều kiện đã ghi lượt trước), và các câu q1, q2, q5 cũng vẽ cả bộ để mỗi câu một loại hình.
- **Hình tự vẽ (hai mươi):** `explore_helmet`, `explore_strap`, `explore_sleep` (Học); `tray_handlebar`, `tray_open_strap`, `tray_late_games` (Chơi); hình câu q1 (xe máy đỗ) và ba chiếc mũ (mũ bảo hiểm hồng cỡ trẻ em, nón lá, mũ lưỡi trai); ba thẻ q2 (chuông xe, yên xe, khoá quai đã cài); ba cách đội mũ q4; ba cảnh đêm q5 (đèn bàn, phòng tắt đèn, ti vi sáng); thẻ `helmet_card` (mặt trong mũ).
- **Ảnh chụp (một):** ngõ vắng (câu q6).
- **Cùng kiểu trong một câu:** w1 ba hình vẽ bộ giác quan; q1 ba hình vẽ mũ trên nền trơn; q2 ba hình vẽ cận, không có tay; q3 bốn hình vẽ của kệ Chơi; q4 ba hình vẽ cùng khuôn; q5 ba hình vẽ phòng ban đêm.
- **Dùng lại trong bài:** `explore_helmet` (món `tray_short_ride`, câu q2); `explore_strap` (món `tray_strap`, từ `strap`); `explore_sleep` (món `tray_bed`, câu q3, từ `bedtime`); `tray_handlebar`, `tray_late_games` (câu q3).
- **Dùng lại từ bài khác:** bài một `explore_head` (q3), `explore_think` (món `tray_puzzle`), `tray_book` (món, q3), `q5_helmet` (câu q4, từ `helmet`), `w1_ear` (w1); bài ba `tray_rain_roof` (w1), `q1_tongue` (w1), `explore_send` (q5); *Hô hấp* `vi-sao-ta-phai-tho/q1` (w3, ô `explore_dream`, từ `dream`), `tho-khi-chay-nhay/q3_hammock` (món `tray_nap`, từ `nap`), `duong-di-cua-khong-khi/tray_nose` (w1); *Bề mặt Trái Đất* `dong-dat-va-song-than/q3` (w2).
- **Màu:** Học: mũ bảo hiểm `do_son`, đội cho đúng `cham`, giấc ngủ `gi_dong`, khi em ngủ `vang_hoe`. Chơi: mũ bảo hiểm `do_son`, ngủ đủ giấc `gi_dong`, cho bộ não học `cham`, nhóm `limit` `nau_dat`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required`, một nhóm `limit`, chín món.
  - Khởi động: `single_choice` (w1 ôn bài ba), `true_false` (w2 ôn *Bề mặt Trái Đất*, đáp án Đúng; w3 ôn bài một, đáp án Sai).
  - Quiz: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6, `speaker: na`, đáp án Đúng). Bốn format.
  - DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Câu có `misconception`: q6, key `helmet_only_long_rides`.
- **Vị trí đáp án đúng:** w1 thứ ba; q1 thứ nhất; q4 thứ ba; q5 thứ hai; q3 thứ hai và thứ tư; thẻ đúng của q2 thứ ba (rà chữ 10/11, N1).
- **Tham chiếu:** `recall_from.lesson` trỏ `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao` (w1), `be-mat-trai-dat/dong-dat-va-song-than` (w2), `nao-bo-va-giac-quan/nao-dieu-khien-co-the` (w3); cả ba đã có id.
- **Key đổi sau rà chữ 10/11:** q1 `q1_hat` thành `q1_cap`; q5 `q5_games` thành `q5_tv`.
- **Màn Chơi, ví dụ để kiểm:**
  - chạm Đã cài quai mũ, Ngủ trưa, Đọc sách → đạt;
  - chạm Mũ treo trên tay lái → `has_limited`;
  - chạm Đội mũ cả khi đi gần, Đã cài quai mũ, Ghép tranh (thiếu giấc ngủ) → `missing.tray_sleep`; chạm Đi ngủ sớm → `full`; bỏ Đã cài quai mũ, đặt Đi ngủ sớm → đạt.
- **Dòng điều kiện màn Chơi:** "Cần đủ Đội mũ bảo hiểm, Ngủ đủ giấc, Cho bộ não học · Không tốt cho bộ não".
- **Câu "Em nghĩ sao?"** của bài một được hỏi lại ở w3 (cùng câu khẳng định, dạng `true_false`).
- **Số từ EN trên một màn:**
  - Học khoảng ba mươi hai từ: mục tiêu 10, hướng dẫn 3, bốn nhãn 9, câu dài nhất 10, ô Từ mới 5.
  - Quiz nhiều nhất là q3 (khoảng hai mươi tám) và q6 (khoảng hai mươi tám).
- **Từ EN có thể ngoài Starters/Movers:** helmet, strap, bedtime, nap, dream, motorbike, handlebars, conical hat, cap, snug, tipped, foam, squash, soak up, bump, alley, earthquake (ôn).
- **Giọng đọc:** VI đọc "chín đến mười hai tiếng" bằng chữ. "Chín giờ" không còn trong chữ trẻ nghe (rà chữ 10/11, n14).
