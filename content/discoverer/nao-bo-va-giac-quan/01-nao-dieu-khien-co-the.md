---
id: 8ced6f2c-eef9-43cf-b438-93c3140e23ab
topic: nao-bo-va-giac-quan
slug: nao-dieu-khien-co-the
order: 1
stage: opener
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: The brain is in charge
vi: Não điều khiển cơ thể
> Giữ đúng tên ở `syllabus-lessons.md` và `content/syllabus.json` (`new-brain`, bài số một).

## Mục tiêu
en: I can say what my brain does for my body.
vi: Em kể được bộ não làm những việc gì cho cơ thể.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-037, ngày 10/11/2026. Đã chạy `ids`. Sửa theo rà chữ tester 10/11 (ticket SK-037, mục "content-editor 10/11 · sửa theo tester"); khối mới w3 để `id:` trống.
> Bài mở màn (`opener`). Mục tiêu, ý chính, Học, Chơi theo hàng bài một trong bảng kế hoạch ở `_topic.md`. Bài sửa `brain_stops_when_resting` ở ý chính ba, ô "All the time", nhóm "Without thinking" ở phần Chơi, câu q3, và câu q6 (gắn key).
> 14/11 (SK-044, ngân sách chữ Discoverer A2): thêm `feedback` cho mọi lựa chọn sai và `feedback_true/false`; hai lời giải thích còn một câu, bỏ "Yes!" · "Đúng rồi!" và "The answer is…" · "Đáp án là…"; câu hỏi tối đa mười chữ VI, lời Na một câu tối đa mười hai chữ. Nháp AI.

## Ý chính
1.en: Your brain is inside your head, under your skull.
1.vi: Bộ não nằm trong đầu em, dưới hộp sọ.
2.en: Your brain helps you think, remember and move.
2.vi: Bộ não giúp em suy nghĩ, ghi nhớ và cử động.
3.en: Your brain works all the time, even when you sleep.
3.vi: Bộ não làm việc suốt ngày đêm, cả khi em ngủ.
> [CẦN KIỂM] "Bộ não làm việc cả khi ngủ" là cách nói giản lược (mục Còn mở ba ở `_topic.md`).
> Ba ý đi từ cụ thể tới trừu tượng: bộ não ở đâu (chỉ được trên cơ thể), việc bé tự làm có chủ ý (nghĩ, nhớ, cử động), rồi việc bộ não tự làm mà bé không thấy.

## Khởi động

> Ba câu. w1, w2 ôn kiến thức nền (`prior_knowledge`): năm giác quan bé đã gặp ở mẫu giáo, lớp một và ở *Cơ thể của em* (Explorer số ba, chưa soạn). w3 ôn bài trước theo thứ tự, bài bốn *Hô hấp* (khoảng một ngày trước; thêm theo rà chữ tester 10/11, mục "Hết hiệu lực").
> w1, w2 mở đường cho cả chủ đề: giác quan là chỗ tin bắt đầu, bài hai và ba nối tiếp. w3 là `single_choice`, để giữ cân bằng Đúng/Sai của chủ đề.

### w1
id: ca8d533f-90e1-433a-aa00-2523e45ef392
format: single_choice
version: 1
dok: 1
recall_from.kind: prior_knowledge
recall_from.note.en: Prior knowledge: children know the five senses from early school.
recall_from.note.vi: Kiến thức nền: trẻ đã biết năm giác quan từ mẫu giáo và lớp một.
prompt.en: Which body part do you use to hear?
prompt.vi: Em dùng bộ phận nào để nghe?
image.brief: [ảnh] Một con gà trống đang gáy, chụp cận đầu, mỏ há, mào đỏ; không có người, không có chữ. Bài ba dùng lại ảnh này cho món Chơi `tray_rooster`. Từ khoá tìm ảnh (EN): rooster crowing farm yard
image.alt.en: A rooster crowing
image.alt.vi: Con gà trống đang gáy
hint.en: Which part could you cover to hear less?
hint.vi: Em thử nghĩ xem, che chỗ nào lại thì em nghe nhỏ đi?
explanation_correct.en: Your ears pick up sounds, like a rooster's crow.
explanation_correct.vi: Tai giúp em nghe tiếng động, như tiếng gà gáy.
explanation_wrong.en: Ears hear, eyes see, and noses smell.
explanation_wrong.vi: Tai để nghe, mắt để nhìn, mũi để ngửi.
> Hình câu hỏi là nguồn của tiếng động, không phải cái tai, nên không lộ đáp án. Ba lựa chọn là ba hình vẽ của bộ giác quan (Quy ước hình, mục hai ở `_topic.md`), cùng nét, cùng nền, cùng số ít.

#### option w1_eye
correct: false
feedback.en: Your eyes see colours and shapes.
feedback.vi: Mắt giúp em nhìn màu sắc, hình dạng.
label.en: eye
label.vi: mắt
image.brief: [hình vẽ] Một con mắt mở của bạn nhỏ, vẽ cận cảnh gần thực tế, thấy lông mày, mi mắt và tròng mắt nâu đen; chỉ vẽ vùng quanh mắt, không thấy mũi, miệng hay cả khuôn mặt; nền kem trơn; không có chữ. Gốc của bộ giác quan; cùng nét, cùng cỡ với `w1_ear` và với hình mũi của *Hô hấp* mà lựa chọn `w1_nose` dùng lại.
image.alt.en: An eye
image.alt.vi: Một con mắt

#### option w1_nose
correct: false
feedback.en: Your nose smells things, like cooking rice.
feedback.vi: Mũi giúp em ngửi, như mùi cơm chín.
label.en: nose
label.vi: mũi
image.brief: Dùng lại hình `tray_nose` ở bài `ho-hap/duong-di-cua-khong-khi`
image.alt.en: A nose
image.alt.vi: Cái mũi
> Rà chữ tester 10/11 (chéo với *Hô hấp*): dùng chung hình mũi vẽ nghiêng của *Hô hấp* thay cho hình vẽ riêng. Designer vẽ mắt và tai bài này cùng nét với hình mũi đó.

#### option w1_ear
correct: true
label.en: ear
label.vi: tai
image.brief: [hình vẽ] Một cái tai của bạn nhỏ nhìn nghiêng, vẽ cận cảnh gần thực tế, có vài sợi tóc đen phía trên; không thấy mắt, không thấy cả khuôn mặt; nền kem trơn; không có chữ. Cùng nét với `w1_eye` và với hình mũi của *Hô hấp* mà lựa chọn `w1_nose` dùng lại.
image.alt.en: An ear
image.alt.vi: Một cái tai

### w2
id: 6a9312b3-00fc-4b4b-8229-5aafe2bc2b4f
format: true_false
version: 1
dok: 1
recall_from.kind: prior_knowledge
recall_from.note.en: Prior knowledge: the five senses from early school.
recall_from.note.vi: Kiến thức nền: trẻ học về năm giác quan ở mẫu giáo và lớp một.
prompt.en: We have five senses.
prompt.vi: Chúng mình có năm giác quan.
image.brief: [ảnh] Một khóm hoa nhài trắng nở trên cành lá xanh, chụp gần, nền lá mờ; không có người, không có chữ. Ảnh gợi một điều cảm nhận được (nhìn, ngửi), không vẽ sẵn năm bộ phận để khỏi lộ con số. Bài ba dùng lại ảnh này cho món Chơi `tray_jasmine`. Từ khoá tìm ảnh (EN): jasmine flowers white close up
image.alt.en: White jasmine flowers
image.alt.vi: Những bông hoa nhài trắng
answer: true
hint.en: Think of the parts on your face, and your skin.
hint.vi: Em nghĩ tới các bộ phận trên khuôn mặt, và cả làn da nhé.
explanation_correct.en: Your skin gives you the sense of touch.
explanation_correct.vi: Làn da giúp em cảm nhận khi chạm.
explanation_wrong.en: Seeing, hearing, smelling, tasting and touching make five.
explanation_wrong.vi: Nhìn, nghe, ngửi, nếm và chạm là năm giác quan.
feedback_false.en: Eyes, ears, nose, tongue and skin each give a sense.
feedback_false.vi: Mắt, tai, mũi, lưỡi, da, mỗi thứ một giác quan.
> [CẦN KIỂM] "Năm giác quan" là cách dạy ở trường tiểu học; các nhà khoa học còn kể thêm cảm giác thăng bằng, nóng lạnh, đau, vị trí cơ thể. Giữ "năm" cho khớp điều trẻ đã học; không nói "chỉ có năm".
> Câu Đúng, theo bảng Đáp án Đúng/Sai ở `_topic.md`.

### w3
id: 778dbf58-e2a5-4098-9716-3a289fc721ac
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: ho-hap/giu-phoi-khoe
prompt.en: Which one helps keep dust out of your nose?
prompt.vi: Thứ nào giúp ngăn bụi bay vào mũi em?
image.brief: Dùng lại hình `explore_dust` ở bài `ho-hap/giu-phoi-khoe`
image.alt.en: A dusty road
image.alt.vi: Con đường bụi mù
hint.en: Remember the lesson about healthy lungs.
hint.vi: Em nhớ lại bài giữ cho phổi khoẻ nhé.
explanation_correct.en: A mask covers both your nose and your mouth.
explanation_correct.vi: Khẩu trang che kín cả mũi lẫn miệng.
explanation_wrong.en: A mask helps stop dust going into your nose.
explanation_wrong.vi: Khẩu trang giúp ngăn bụi bay vào mũi.
> Thêm theo rà chữ tester 10/11: *Hô hấp* đã có id, nên bài một có câu ôn bài trước (bài bốn *Hô hấp*, ý chính hai của bài đó). Câu ôn lại, không dạy lại ý của *Hô hấp*. Mũi nối sang giác quan của chủ đề này.
> Ba lựa chọn dùng lại ba ảnh của câu q1 bài `ho-hap/giu-phoi-khoe`, trỏ về hình gốc, cùng kiểu: một vật trên mặt bàn gỗ. Thứ tự khác câu q1 của *Hô hấp* (ở đó khẩu trang đứng thứ ba), để bé không chọn theo chỗ đã nhớ.

#### option w3_mask
correct: true
label.en: mask
label.vi: khẩu trang
image.brief: Dùng lại hình `explore_mask` ở bài `ho-hap/giu-phoi-khoe`
image.alt.en: A cloth mask on a table
image.alt.vi: Chiếc khẩu trang vải trên bàn

#### option w3_hat
correct: false
feedback.en: A sun hat shades your head from the sun.
feedback.vi: Mũ vải che nắng cho đầu em.
label.en: sun hat
label.vi: mũ vải
image.brief: Dùng lại hình `q1_hat` ở bài `ho-hap/giu-phoi-khoe`
image.alt.en: A sun hat on a table
image.alt.vi: Chiếc mũ vải trên bàn

#### option w3_raincoat
correct: false
feedback.en: A raincoat keeps rain off your body.
feedback.vi: Áo mưa che mưa cho người em.
label.en: raincoat
label.vi: áo mưa
image.brief: Dùng lại hình `q1_raincoat` ở bài `ho-hap/giu-phoi-khoe`
image.alt.en: A raincoat on a table
image.alt.vi: Chiếc áo mưa trên bàn

## Học

> Bốn ô, theo bảng kế hoạch, từ cụ thể tới trừu tượng: bộ não ở đâu (ý chính một), nghĩ và nhớ, cử động (ý chính hai), việc bộ não tự làm suốt ngày đêm (ý chính ba).
> Không dùng `sentence_card` (app 0.1.0 chỉ hiện `explore_groups` đầu tiên và `word_list` đầu tiên). Hình ô Học không có chữ, kể cả nhãn chữ song ngữ.

### explore
id: 154e2e85-12ce-4cce-9a5b-2ce4461910f6
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_head
label.en: In your head
label.vi: Trong đầu em
color: nau_dat
sentence.en: Your brain sits inside your head, under your skull.
sentence.vi: Bộ não nằm trong đầu em, dưới hộp sọ.
image.brief: [hình vẽ] Khuôn đầu và vai một bạn nhỏ nhìn nghiêng, cùng nét với khuôn người của câu q1, không vẽ nét mặt; phần đầu vẽ như trong suốt để thấy hộp sọ màu trắng ngà và bộ não màu hồng xám nằm gọn bên trong; nền kem trơn; không có nhãn, không có mũi tên, không có chữ, không vẽ máu hay mạch máu.
image.alt.en: A head with the brain inside the skull
image.alt.vi: Đầu một bạn nhỏ, bộ não nằm trong hộp sọ
examples.1.en: soft, like tofu
examples.1.vi: mềm như đậu phụ
examples.2.en: about as big as two fists
examples.2.vi: to cỡ hai nắm tay
examples.3.en: the skull is hard bone
examples.3.vi: hộp sọ là xương cứng
> [CẦN KIỂM] Bộ não mềm, cách so với đậu phụ hay thạch là cách nói phổ thông; bộ não người lớn to cỡ hai nắm tay đặt sát nhau (biên tập nhớ, chưa tra nguồn). Từ `in_charge` dùng lại hình này.

#### group explore_think
label.en: Think and remember
label.vi: Suy nghĩ và ghi nhớ
color: cham
sentence.en: Your brain helps you think, learn and remember.
sentence.vi: Bộ não giúp em suy nghĩ, học và ghi nhớ.
image.brief: [hình vẽ] Đôi tay một bạn nhỏ đang ghép tranh xếp hình trên mặt bàn gỗ, vẽ từ trên xuống, chỉ thấy hai bàn tay và các mảnh ghép; hình trên mảnh ghép không có chữ, không có nhân vật hoạt hình; không thấy mặt. Món Chơi `tray_puzzle` (bài một, bài bốn) và từ `remember` dùng lại hình này. Từ khoá tìm ảnh (EN): child hands jigsaw puzzle table top view
image.alt.en: Hands doing a jigsaw puzzle
image.alt.vi: Đôi tay đang ghép tranh
examples.1.en: do a puzzle
examples.1.vi: ghép tranh
examples.2.en: learn a new song
examples.2.vi: học một bài hát mới
examples.3.en: remember the way to school
examples.3.vi: nhớ đường tới trường

#### group explore_move
label.en: Move
label.vi: Cử động
color: do_son
sentence.en: Your brain tells your body how to move.
sentence.vi: Bộ não bảo cơ thể em cử động thế nào.
image.brief: [ảnh] Đôi chân một bạn nhỏ đang đá quả bóng trên sân đất hay bãi cỏ, chụp thấp ngang đầu gối, chỉ thấy chân và quả bóng; bóng không có logo hay chữ; không thấy mặt. Từ khoá tìm ảnh (EN): child legs kicking football grass
image.alt.en: Legs kicking a ball
image.alt.vi: Đôi chân đang đá bóng
examples.1.en: kick a ball
examples.1.vi: đá bóng
examples.2.en: jump rope
examples.2.vi: nhảy dây
examples.3.en: write your name
examples.3.vi: viết tên mình
> "Bảo cơ thể cử động" mở đường cho bài hai: tin đi từ não ra tay chân. Không nói cơ kéo xương (để dành *Bộ xương và cơ bắp*).

#### group explore_always
label.en: All the time
label.vi: Suốt ngày đêm
color: gi_dong
sentence.en: Your brain keeps your heart beating, day and night.
sentence.vi: Bộ não giữ cho tim em đập, cả ngày lẫn đêm.
image.brief: Dùng lại hình `q1` ở bài `ho-hap/vi-sao-ta-phai-tho`
image.alt.en: A child asleep under a mosquito net
image.alt.vi: Bạn nhỏ ngủ trong màn
examples.1.en: your heart beats
examples.1.vi: tim em đập
examples.2.en: you sweat when it is hot
examples.2.vi: em đổ mồ hôi khi trời nóng
examples.3.en: you dream at night
examples.3.vi: em mơ khi ngủ
examples.4.en: you blink without trying
examples.4.vi: em chớp mắt mà không cần nghĩ
> Rà chữ tester 10/11 (chéo với *Hô hấp*): dùng chung hình vẽ bạn nhỏ ngủ trong màn của *Hô hấp* thay cho hình vẽ riêng; `alt` chép của hình gốc. Câu q3 bài này, câu w1 bài hai, câu w3, ô `explore_dream` và từ `dream` bài bốn trỏ thẳng về hình gốc đó.
> Rà chữ tester 10/11 (n17): ví dụ bốn cũ "no need to think about it" là lời bình; nay là một việc cơ thể làm (chớp mắt). Không lấy ví dụ dạ dày tiêu hoá thức ăn như tester gợi ý, vì ruột và dạ dày phần lớn có hệ thần kinh riêng, nói "bộ não lo" dễ sai.
> [CẦN KIỂM] Thân não giữ nhịp tim; vùng dưới đồi điều khiển đổ mồ hôi để làm mát cơ thể; chớp mắt phần lớn tự động (biên tập nhớ). Không lấy ví dụ "thở" để khỏi lặp *Hô hấp* (`_topic.md`, mục "Không lặp với *Hô hấp*").

### new_words
id: 1527c65d-9906-4546-ab4c-d74bd47821db
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: brain, skull, heartbeat

## Chơi

> Bé chọn ba việc bộ não làm: một việc cần suy nghĩ (đọc sách hoặc ghép tranh), một việc cử động (đạp xe hoặc nhảy dây), một việc bộ não tự làm mà em không cần nghĩ (tim đập hoặc đổ mồ hôi khi nóng). Không được chọn thứ không phải việc của cơ thể.
> - Bẫy chính là kim đồng hồ và quạt: cũng "tự chạy, không cần nghĩ", nên bé chưa nắm ý "bộ não chỉ huy cơ thể" dễ đặt vào chỗ thứ ba. Mưa rơi là bẫy nhẹ.
> - Nhóm "Without thinking" bắt buộc: bé phải chọn một việc bộ não tự làm, sửa `brain_stops_when_resting` ngay trong trò chơi.
> - Cả kệ là hình vẽ (theo hình designer 10/11; trước đây định là ảnh chụp, nhưng bốn món không có ảnh hợp giấy phép, nên vẽ cả kệ cho cùng kiểu). Lời nhắn không gọi tên vật chứa.

### tray
id: f9fa92a8-9cab-486d-8c8c-48f22d24b7dc
type: build_tray
version: 1
prompt.en: Find three jobs of the brain
prompt.vi: Tìm ba việc của bộ não
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find a job for thinking, moving, and one without thinking.
messages.start.vi: Em tìm một việc cần suy nghĩ, một việc cử động, và một việc không cần nghĩ nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Your brain does all these jobs.
messages.balanced.vi: Tuyệt! Bộ não của em làm hết những việc này.
messages.has_limited.en: Your body does not do that. Tap it to take it off.
messages.has_limited.vi: Việc đó không phải cơ thể em làm. Em chạm vào để bỏ ra nhé.
messages.missing.tray_think.en: You still need a thinking job.
messages.missing.tray_think.vi: Em còn thiếu một việc cần suy nghĩ.
messages.missing.tray_move.en: You still need a moving job.
messages.missing.tray_move.vi: Em còn thiếu một việc cử động.
messages.missing.tray_auto.en: You still need a job done without thinking.
messages.missing.tray_auto.vi: Em còn thiếu một việc không cần nghĩ.

#### group tray_think
label.en: Think and remember
label.vi: Suy nghĩ và ghi nhớ
color: cham
role: required

#### group tray_move
label.en: Move
label.vi: Cử động
color: do_son
role: required

#### group tray_auto
label.en: Without thinking
label.vi: Không cần nghĩ
color: gi_dong
role: required

#### group tray_not_body
label.en: Not done by your body
label.vi: Không phải việc cơ thể em làm
color: nau_dat
role: limit
> Nhãn `limit` dạng "Not …" · "Không …", gọi tên loại, không gọi tên món bẫy (`_topic.md`, mục "Khi soạn bốn bài").

#### item tray_book
label.en: Read a book
label.vi: Đọc sách
group: tray_think
image.brief: [hình vẽ] Một bạn nhỏ ngồi trên ghế đá dưới gốc cây đọc sách, vẽ từ phía sau lưng, hơi xa; không vẽ nét mặt, không có chữ trên trang sách hay bìa sách; không có logo. Bài hai (câu w1) và bài bốn (món Chơi, câu q3) dùng lại hình này. Từ khoá tìm ảnh (EN): child reading book bench from behind
image.alt.en: A child reading a book
image.alt.vi: Bạn nhỏ đang đọc sách

#### item tray_fan
label.en: Fan spinning
label.vi: Quạt quay
group: tray_not_body
image.brief: [hình vẽ] Một chiếc quạt cây đang quay, cánh quạt vẽ mờ như đang chuyển động, đặt trong phòng; không có nhãn hiệu, không có chữ, không có người. Từ khoá tìm ảnh (EN): electric fan spinning blades room
image.alt.en: An electric fan spinning
image.alt.vi: Chiếc quạt điện đang quay

#### item tray_bike
label.en: Ride a bike
label.vi: Đạp xe
group: tray_move
image.brief: [hình vẽ] Một bạn nhỏ đội mũ bảo hiểm đã cài quai, đạp xe đạp trên con đường làng hay ngõ vắng, vẽ từ phía sau; không vẽ nét mặt, không có logo trên xe hay trên mũ, không có chữ. Bạn phải đội mũ, vì bài bốn dạy đội mũ trên mọi chuyến đi. Câu q3, q4 và câu w1 bài hai dùng lại hình này. Từ khoá tìm ảnh (EN): child riding bicycle helmet back view
image.alt.en: A child riding a bike
image.alt.vi: Bạn nhỏ đang đạp xe

#### item tray_pulse
label.en: Heart beating
label.vi: Tim đập
group: tray_auto
image.brief: [hình vẽ] Hai ngón tay đặt lên cổ tay phía trong của bàn tay kia để bắt mạch, vẽ gần, chỉ thấy hai bàn tay; không có đồng hồ thông minh, không có chữ. Câu q3, từ `heartbeat` và câu w1 bài hai dùng lại hình này. Từ khoá tìm ảnh (EN): fingers checking pulse wrist close up
image.alt.en: Fingers feeling a heartbeat at the wrist
image.alt.vi: Ngón tay bắt nhịp tim ở cổ tay
> [CẦN KIỂM] Mạch ở cổ tay đập theo nhịp tim; cách nói "bắt nhịp tim ở cổ tay" dùng được cho trẻ.

#### item tray_rain
label.en: Rain falling
label.vi: Mưa rơi
group: tray_not_body
image.brief: [hình vẽ] Những hạt mưa rơi xuống vũng nước, mặt nước gợn nhiều vòng tròn, vẽ gần; không có người, không có chữ. Từ khoá tìm ảnh (EN): rain drops falling puddle close up
image.alt.en: Rain falling into a puddle
image.alt.vi: Mưa rơi xuống vũng nước

#### item tray_puzzle
label.en: Do a puzzle
label.vi: Ghép tranh
group: tray_think
image.brief: Dùng lại hình `nao-dieu-khien-co-the/explore_think`
image.alt.en: Hands doing a jigsaw puzzle
image.alt.vi: Đôi tay đang ghép tranh

#### item tray_sweat
label.en: Sweating when hot
label.vi: Đổ mồ hôi khi nóng
group: tray_auto
image.brief: [hình vẽ] Những giọt mồ hôi trên cánh tay hay trên gáy một người dưới nắng, vẽ gần, chỉ thấy da; không vẽ nét mặt, không có chữ. Câu q3 dùng lại hình này. Từ khoá tìm ảnh (EN): sweat drops skin arm close up
image.alt.en: Drops of sweat on skin
image.alt.vi: Giọt mồ hôi trên da
> [CẦN KIỂM] Đổ mồ hôi là việc bộ não tự điều khiển để làm mát cơ thể.

#### item tray_jump
label.en: Jump rope
label.vi: Nhảy dây
group: tray_move
image.brief: [hình vẽ] Đôi chân một bạn nhỏ trên mặt sân, sợi dây nhảy vòng dưới chân, vẽ thấp, chỉ thấy chân và dây; không vẽ nét mặt, không có chữ. Từ khoá tìm ảnh (EN): jump rope feet playground
image.alt.en: Feet and a skipping rope
image.alt.vi: Đôi chân và sợi dây nhảy

#### item tray_clock
label.en: Clock ticking
label.vi: Kim đồng hồ chạy
group: tray_not_body
image.brief: [hình vẽ] Một chiếc đồng hồ treo tường tròn trên tường trơn, vẽ thẳng, thấy rõ kim giờ, kim phút và kim giây; mặt đồng hồ chỉ có vạch, không có chữ số, không có chữ hay nhãn hiệu; không có người. Từ khoá tìm ảnh (EN): wall clock no numbers minimalist
image.alt.en: A wall clock
image.alt.vi: Chiếc đồng hồ treo tường
> Rà chữ tester 10/11 (n11): hình riêng, không dùng lại `w1_clock` của *Bề mặt Trái Đất* nữa.
> Theo hình designer 10/11: cả kệ Chơi bài này là hình vẽ (sách, xe đạp, bắt mạch, mồ hôi không có ảnh hợp giấy phép, nên vẽ cả kệ cho cùng kiểu). Ảnh đó chụp nghiêng để thấy đồng hồ dẹt (đúng ý câu của bài đó) và mặt có chữ số, trái luật "hình không có chữ" của chủ đề này. Nhãn "Clock ticking" · "Kim đồng hồ chạy" giữ: ảnh thấy kim giây.

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Bốn format: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, thẻ từ có hình.

### q1
id: 36df33ae-fbab-4f69-9cb7-3776b4b49002
format: single_choice
version: 1
dok: 1
prompt.en: Where is your brain?
prompt.vi: Bộ não của em nằm ở đâu?
image.brief: [hình vẽ] Gốc của bộ khuôn người nhìn nghiêng: một bạn nhỏ đứng thẳng nhìn nghiêng, vẽ thành khuôn màu nâu nhạt mềm trên nền kem trơn, thấy rõ đầu, cổ, ngực, bụng, lưng, tay chân; không vẽ nét mặt, không tóc chi tiết, không quần áo có chữ; không tô vùng nào; không có chữ. Ba lựa chọn của câu này, câu q2 bài hai và ô `explore_nerves` bài hai vẽ trên đúng khuôn này.
image.alt.en: A child seen from the side
image.alt.vi: Một bạn nhỏ nhìn nghiêng
hint.en: Remember the In your head picture.
hint.vi: Em nhớ lại ô Trong đầu em trong bài học nhé.
explanation_correct.en: Your brain sits close to your eyes and ears.
explanation_correct.vi: Bộ não nằm gần mắt và tai của em.
explanation_wrong.en: Your brain is in your head, under your skull.
explanation_wrong.vi: Bộ não nằm trong đầu em, dưới hộp sọ.
> Ba lựa chọn là cùng một khuôn, chỉ khác vùng tô vàng, như sơ đồ trục thời gian của *Khủng long* bài một. Hình câu hỏi không tô vùng nào.

#### option q1_chest
correct: false
feedback.en: Your chest holds your heart and lungs.
feedback.vi: Trong ngực là tim và phổi.
label.en: in the chest
label.vi: trong ngực
image.brief: [hình vẽ] Đúng khuôn người nhìn nghiêng của hình câu q1, tô một vùng tròn màu vàng nghệ ở ngực; không tô chỗ khác, không có chữ.
image.alt.en: A child, the chest shaded yellow
image.alt.vi: Bạn nhỏ, phần ngực tô màu vàng

#### option q1_head
correct: true
label.en: in the head
label.vi: trong đầu
image.brief: [hình vẽ] Đúng khuôn người nhìn nghiêng của hình câu q1, tô một vùng tròn màu vàng nghệ ở đầu; không tô chỗ khác, không vẽ bộ não, không có chữ.
image.alt.en: A child, the head shaded yellow
image.alt.vi: Bạn nhỏ, phần đầu tô màu vàng

#### option q1_tummy
correct: false
feedback.en: Your tummy holds your stomach, for food.
feedback.vi: Trong bụng là dạ dày, nơi chứa thức ăn.
label.en: in the tummy
label.vi: trong bụng
image.brief: [hình vẽ] Đúng khuôn người nhìn nghiêng của hình câu q1, tô một vùng tròn màu vàng nghệ ở bụng; không tô chỗ khác, không có chữ.
image.alt.en: A child, the tummy shaded yellow
image.alt.vi: Bạn nhỏ, phần bụng tô màu vàng

### q2
id: 47d84d26-26d7-4747-97db-a1041f490a83
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: [hình vẽ] Hộp sọ người vẽ nhìn nghiêng, kiểu tranh minh hoạ y học cho trẻ, màu trắng ngà, hốc mắt vẽ nhạt (đỡ đáng sợ), cùng nét với hộp sọ trong ô `explore_head` và với bộ cơ quan; chỉ có hộp sọ, không có bộ não bên trong, để không lộ đáp án; không có số, không có nhãn, không có chữ; nền kem trơn. Câu q5 và từ `skull` dùng lại hình này.
image.alt.en: A skull
image.alt.vi: Hộp sọ
> Rà chữ tester 10/11 (N7): đổi ảnh mô hình hộp sọ nhựa sang hình vẽ, cho khớp Quy ước hình của chủ đề (bộ phận cơ thể là hình vẽ) và để cả màn q2 cùng một kiểu hình. Bỏ dòng `[CẦN KIỂM]` cũ về ảnh đáng sợ.
sentence.en: Your skull keeps your {1} safe.
sentence.vi: Hộp sọ che chở cho {1} của em.
answers: q2_brain
hint.en: Remember where your skull is.
hint.vi: Em nhớ lại hộp sọ nằm ở đâu nhé.
explanation_correct.en: Your hard skull keeps your soft brain safe.
explanation_correct.vi: Hộp sọ cứng che chở cho bộ não mềm.
explanation_wrong.en: Your skull wraps all around your brain.
explanation_wrong.vi: Hộp sọ bao quanh bộ não của em.
> Ba thẻ từ là bộ cơ quan (Quy ước hình, mục hai): bộ não là hình gốc của bài này; trái tim, dạ dày dùng lại hình vẽ của *Hô hấp* (rà chữ tester 10/11, chéo với *Hô hấp*). Bộ não vẽ cùng nét hai hình đó.
> Rà chữ tester 10/11 (N1): thẻ đúng chuyển lên thứ nhất (trước ở thứ hai, như cả bốn câu điền từ của chủ đề).

#### bank q2_brain
label.en: brain
label.vi: bộ não
image.brief: [hình vẽ] Bộ não người vẽ kiểu tranh minh hoạ y học cho trẻ, nhìn nghiêng, màu hồng xám dịu, thấy rõ các nếp gấp; không tô màu từng vùng, không có số, không có nhãn, không có chữ, không có máu; nền kem trơn; cùng nét, cùng cỡ với hình trái tim `tray_heart` và dạ dày `tray_stomach` ở bài `ho-hap/duong-di-cua-khong-khi`. Câu q4, từ `brain`, thẻ thưởng, bài hai và bài ba dùng lại hình này.
image.alt.en: A brain
image.alt.vi: Bộ não

#### bank q2_heart
label.en: heart
label.vi: trái tim
feedback.en: Your ribs keep your heart safe, in your chest.
feedback.vi: Tim nằm trong ngực, có xương sườn che chở.
image.brief: Dùng lại hình `tray_heart` ở bài `ho-hap/duong-di-cua-khong-khi`
image.alt.en: A heart
image.alt.vi: Trái tim

#### bank q2_stomach
label.en: stomach
label.vi: dạ dày
feedback.en: Your stomach is in your tummy, far from your skull.
feedback.vi: Dạ dày nằm trong bụng, xa hộp sọ.
image.brief: Dùng lại hình `tray_stomach` ở bài `ho-hap/duong-di-cua-khong-khi`
image.alt.en: A stomach
image.alt.vi: Dạ dày

### q3
id: d34a445b-da81-4395-b073-4c7663125aa2
format: multi_choice
version: 1
dok: 2
prompt.en: What does Mai's brain still do while she sleeps?
prompt.vi: Khi Mai ngủ, bộ não vẫn làm gì?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `q1` ở bài `ho-hap/vi-sao-ta-phai-tho`
image.alt.en: A child asleep under a mosquito net
image.alt.vi: Bạn nhỏ ngủ trong màn
hint.en: Remember the Without thinking group in the game.
hint.vi: Em nhớ lại nhóm Không cần nghĩ ở trò chơi nhé.
explanation_correct.en: These jobs happen without Mai thinking about them.
explanation_correct.vi: Những việc này diễn ra mà Mai không cần nghĩ.
explanation_wrong.en: Her brain keeps her heart beating and makes her sweat.
explanation_wrong.vi: Não giữ cho tim đập, và làm Mai đổ mồ hôi.
> DOK 2: áp ý chính ba vào tình huống mới (bạn đang ngủ), không chỉ nhận lại món đã xếp. Hai lựa chọn sai là việc cần thức và cần nghĩ. Bốn ảnh dùng lại kệ Chơi, cùng là ảnh chụp.

#### option q3_heart
correct: true
label.en: keep her heart beating
label.vi: giữ cho tim đập
image.brief: Dùng lại hình `nao-dieu-khien-co-the/tray_pulse`
image.alt.en: Fingers feeling a heartbeat at the wrist
image.alt.vi: Ngón tay bắt nhịp tim ở cổ tay

#### option q3_read
correct: false
feedback.en: Reading needs Mai to be awake and looking.
feedback.vi: Muốn đọc sách, Mai phải thức và nhìn.
label.en: read a book
label.vi: đọc sách
image.brief: Dùng lại hình `nao-dieu-khien-co-the/tray_book`
image.alt.en: A child reading a book
image.alt.vi: Bạn nhỏ đang đọc sách

#### option q3_ride
correct: false
feedback.en: Riding a bike needs Mai to be awake.
feedback.vi: Muốn đạp xe, Mai phải thức dậy đã.
label.en: ride a bike
label.vi: đạp xe
image.brief: Dùng lại hình `nao-dieu-khien-co-the/tray_bike`
image.alt.en: A child riding a bike
image.alt.vi: Bạn nhỏ đang đạp xe

#### option q3_sweat
correct: true
label.en: sweat on a hot night
label.vi: đổ mồ hôi khi đêm nóng
image.brief: Dùng lại hình `nao-dieu-khien-co-the/tray_sweat`
image.alt.en: Drops of sweat on skin
image.alt.vi: Giọt mồ hôi trên da

### q4
id: 151de614-4db8-40b8-9f3f-5b1fc8e4b8f2
format: single_choice
version: 1
dok: 2
prompt.en: What tells Nam's legs to pedal his bike?
prompt.vi: Cái gì bảo chân Nam đạp xe?
image.brief: Dùng lại hình `nao-dieu-khien-co-the/tray_bike`
image.alt.en: A child riding a bike
image.alt.vi: Bạn nhỏ đang đạp xe
hint.en: Remember the Move picture in the lesson.
hint.vi: Em nhớ lại ô Cử động trong bài học nhé.
explanation_correct.en: His brain sends a message to his legs.
explanation_correct.vi: Bộ não gửi tin tới đôi chân của Nam.
explanation_wrong.en: His brain is in charge of how he moves.
explanation_wrong.vi: Bộ não chỉ huy cách Nam cử động.
> DOK 2: áp ý chính hai vào một việc quen (đạp xe đi học). Trái tim là lựa chọn sai có sức hút: trẻ hay nói "trái tim mách bảo". Giải thích khi đúng gieo chữ "message" của bài hai.

#### option q4_brain
correct: true
label.en: his brain
label.vi: bộ não
image.brief: Dùng lại hình `nao-dieu-khien-co-the/q2_brain`
image.alt.en: A brain
image.alt.vi: Bộ não

#### option q4_heart
correct: false
feedback.en: His heart pumps blood to his legs.
feedback.vi: Tim bơm máu tới đôi chân của Nam.
label.en: his heart
label.vi: trái tim
image.brief: Dùng lại hình `tray_heart` ở bài `ho-hap/duong-di-cua-khong-khi`
image.alt.en: A heart
image.alt.vi: Trái tim

#### option q4_stomach
correct: false
feedback.en: His stomach breaks down his breakfast.
feedback.vi: Dạ dày lo tiêu hoá bữa sáng của Nam.
label.en: his stomach
label.vi: dạ dày
image.brief: Dùng lại hình `tray_stomach` ở bài `ho-hap/duong-di-cua-khong-khi`
image.alt.en: A stomach
image.alt.vi: Dạ dày

### q5
id: 67f61dd9-15cf-4a2e-90bc-19fb972005c1
format: single_choice
version: 1
dok: 2
prompt.en: Which one is most like your skull?
prompt.vi: Vật nào giống hộp sọ của em nhất?
image.brief: Dùng lại hình `nao-dieu-khien-co-the/q2`
image.alt.en: A skull
image.alt.vi: Hộp sọ
hint.en: Think what your skull does for your brain.
hint.vi: Em nghĩ xem hộp sọ làm gì cho bộ não nhé.
> Rà chữ tester 10/11 (n5): gợi ý cũ nói sẵn tiêu chí "cứng"; gợi ý mới chỉ cách nghĩ (việc hộp sọ làm).
explanation_correct.en: A helmet is a hard shell, just like your skull.
explanation_correct.vi: Mũ bảo hiểm là lớp vỏ cứng, giống hộp sọ.
explanation_wrong.en: A hard helmet guards your head, like your skull.
explanation_wrong.vi: Mũ bảo hiểm cứng, che chở đầu như hộp sọ.
> DOK 2: so sánh theo đặc điểm (cứng, che chở). Gối là bẫy "đỡ đầu", mũ vải là bẫy "đội trên đầu". Câu chuẩn bị cho bài bốn. Ba ảnh cùng kiểu: một vật đặt trên nền trơn, chụp chéo, cùng cỡ.

#### option q5_pillow
correct: false
feedback.en: A pillow is soft and squashes easily.
feedback.vi: Gối mềm, ấn vào là lún xuống.
label.en: pillow
label.vi: cái gối
image.brief: [ảnh] Một cái gối trắng đặt trên nền trơn, chụp chéo, cả cái gối trong khung; không có hoa văn chữ, không có nhãn hiệu. Từ khoá tìm ảnh (EN): white pillow plain background
image.alt.en: A pillow
image.alt.vi: Cái gối

#### option q5_hat
correct: false
feedback.en: A cloth hat is soft and thin.
feedback.vi: Mũ vải mềm và mỏng.
label.en: cloth hat
label.vi: mũ vải
image.brief: [ảnh] Một chiếc mũ vải tai bèo màu xanh hay be đặt trên nền trơn, chụp chéo; không có logo, không có chữ, không có người đội. Từ khoá tìm ảnh (EN): cloth bucket hat plain background
image.alt.en: A cloth hat
image.alt.vi: Chiếc mũ vải

#### option q5_helmet
correct: true
label.en: helmet
label.vi: mũ bảo hiểm
image.brief: [ảnh] Một chiếc mũ bảo hiểm xe máy nửa đầu, kiểu quen ở Việt Nam, màu trơn, đặt trên nền trơn, chụp chéo; không có logo, tem, nhãn hiệu hay chữ (cắt hoặc chọn ảnh khác), không có người đội. Bài bốn dùng lại ảnh này (hình câu q4, từ `helmet`). Từ khoá tìm ảnh (EN): motorcycle half helmet plain background
image.alt.en: A helmet
image.alt.vi: Chiếc mũ bảo hiểm

### q6
id: 3629e4d3-7b96-497a-9789-18ee041b3542
format: true_false
version: 1
dok: 3
misconception: brain_stops_when_resting
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: I am resting, so my brain is not working.
statement.vi: Mình đang nằm nghỉ, nên não mình không làm việc.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: false
image.brief: Dùng lại hình `q3_hammock` ở bài `ho-hap/tho-khi-chay-nhay`
image.alt.en: A hammock between two trees
image.alt.vi: Cái võng mắc giữa hai cây
> Rà chữ tester 10/11 (chéo với *Hô hấp*): dùng chung ảnh võng trống của *Hô hấp* (cùng dòng từ khoá với brief cũ); `alt` chép của hình gốc. Món `tray_nap` và từ `nap` bài bốn trỏ thẳng về hình gốc đó.
hint.en: Remember the All the time picture in the lesson.
hint.vi: Em nhớ lại ô Suốt ngày đêm trong bài học nhé.
explanation_correct.en: Even at rest, your brain keeps your heart beating.
explanation_correct.vi: Cả khi nghỉ, bộ não vẫn giữ cho tim đập.
explanation_wrong.en: Na's brain is still working while she rests.
explanation_wrong.vi: Khi Na nghỉ, bộ não của Na vẫn làm việc.
feedback_true.en: Her brain keeps Na breathing, even in the hammock.
feedback_true.vi: Não vẫn giữ cho Na thở, cả khi nằm võng.
> 14/11 (ngân sách A2): lời Na cũ hai câu, mười một từ EN, mười lăm chữ VI; nay một câu chín từ EN, mười một chữ VI. Ý "trên võng" nằm ở hình (võng trống).
> DOK 3: bé đánh giá lời Na bằng điều vừa học (ô "All the time", câu q3). Đáp án Sai, theo bảng Đáp án Đúng/Sai ở `_topic.md`. Giải thích khi đúng không mở đầu bằng "Yes!", vì bé vừa chọn "Na chưa đúng".
> Gợi ý chỉ chỗ cần nhớ, không nói Na đúng hay sai. Hình là võng trống, không có Na, không có người.

## Từ vựng

### brain
id: 9619f338-feea-409d-8127-845ab57528dc
tier: core
term.en: brain
term.vi: bộ não
example.en: Your brain is inside your head.
example.vi: Bộ não nằm trong đầu em.
image.brief: Dùng lại hình `nao-dieu-khien-co-the/q2_brain`
image.alt.en: A brain
image.alt.vi: Bộ não

### skull
id: f75c587b-f035-400a-a1fe-bfb6965f7f5a
tier: core
term.en: skull
term.vi: hộp sọ
example.en: Your skull is hard, like a helmet.
example.vi: Hộp sọ cứng, giống như mũ bảo hiểm.
image.brief: Dùng lại hình `nao-dieu-khien-co-the/q2`
image.alt.en: A skull
image.alt.vi: Hộp sọ

### heartbeat
id: 50d3d9df-4b0f-4ff7-93b8-97e32cc7ebec
tier: core
term.en: heartbeat
term.vi: nhịp tim
example.en: Your brain keeps your heartbeat going, day and night.
example.vi: Bộ não giữ cho tim em đập đều, cả ngày lẫn đêm.
image.brief: Dùng lại hình `nao-dieu-khien-co-the/tray_pulse`
image.alt.en: Fingers feeling a heartbeat at the wrist
image.alt.vi: Ngón tay bắt nhịp tim ở cổ tay

### remember
id: b60b09ef-94bc-4551-a1ec-d6595a3dc183
tier: extra
term.en: remember
term.vi: ghi nhớ
example.en: Your brain helps you remember the way to school.
example.vi: Bộ não giúp em nhớ đường tới trường.
image.brief: Dùng lại hình `nao-dieu-khien-co-the/explore_think`
image.alt.en: Hands doing a jigsaw puzzle
image.alt.vi: Đôi tay đang ghép tranh

### in_charge
id: fae0c38c-7b96-455d-acab-eccc8dd7d9a7
tier: extra
term.en: in charge
term.vi: chỉ huy
example.en: Your brain is in charge of your whole body.
example.vi: Bộ não chỉ huy cả cơ thể em.
image.brief: Dùng lại hình `nao-dieu-khien-co-the/explore_head`
image.alt.en: A head with the brain inside the skull
image.alt.vi: Đầu một bạn nhỏ, bộ não nằm trong hộp sọ
> Cụm trong tên bài. `term.vi` là "chỉ huy" (động từ), khớp câu ví dụ.

## Thưởng

### brain_card
id: 872a733f-ede8-4465-980e-655dc80c8ae4
set: body
rarity: common
name.en: Brain
name.vi: Bộ não
tag.en: In charge
tag.vi: Chỉ huy
fact.en: A grown-up's brain weighs about as much as a pineapple.
fact.vi: Bộ não của người lớn nặng cỡ một quả dứa.
> [CẦN KIỂM] Bộ não người lớn nặng khoảng một ki-lô-gam ba tới một ki-lô-gam bốn; một quả dứa vừa khoảng một ki-lô-gam tới một ki-lô-gam rưỡi (biên tập nhớ, chưa tra nguồn). Bộ não trẻ bảy tuổi đã gần bằng cỡ người lớn; thẻ nói "người lớn" để khỏi phải nói con số của trẻ.
image.brief: Dùng lại hình `nao-dieu-khien-co-the/q2_brain`
image.alt.en: A brain
image.alt.vi: Bộ não
> Key thẻ là `brain_card`, không phải `brain`, vì key không được trùng trong bài (từ vựng đã có `brain`).

## Ghi chú cho hoạ sĩ

- **Loại hình** (Quy ước hình ở `_topic.md`): đồ vật, cảnh là ảnh chụp thật; bộ phận cơ thể, cơ quan bên trong và cảnh trẻ ngủ là hình tự vẽ (`[hình vẽ]`). Hình không có chữ, không nhãn chữ song ngữ.
- **Ba bộ hình vẽ gốc ở bài này**, mỗi bộ cùng nét, cùng nền kem trơn, cùng cỡ trong khung:
  - bộ giác quan: `w1_eye`, `w1_ear` (mũi dùng lại `tray_nose` của *Hô hấp*; vẽ mắt, tai cùng nét hình mũi đó; bài hai thêm bàn tay, bàn chân, đầu ngón tay; bài ba thêm lưỡi);
  - bộ khuôn người nhìn nghiêng: hình câu q1 và ba bản tô vàng `q1_chest`, `q1_head`, `q1_tummy` (bài hai thêm bản tô lưng và bản có dây thần kinh; bài bốn vẽ ba cách đội mũ trên khuôn đầu và vai). Designer vẽ một khuôn rồi tô, ra bốn file;
  - bộ cơ quan: `q2_brain` và hộp sọ `q2` (rà chữ 10/11: hình vẽ, thay ảnh mô hình nhựa); trái tim, dạ dày dùng lại `tray_heart`, `tray_stomach` của *Hô hấp*, nên vẽ bộ não, hộp sọ cùng nét hai hình đó (bài hai thêm một dây thần kinh, cùng nét).
  - `explore_head` vẽ cùng khuôn đầu với bộ khuôn người, hộp sọ bên trong cùng nét hình `q2`.
- **Dùng chung với *Hô hấp*** (rà chữ tester 10/11): `explore_always` (bạn ngủ trong màn) là `q1` của bài `ho-hap/vi-sao-ta-phai-tho`; `q6` (võng trống) là `q3_hammock` của bài `ho-hap/tho-khi-chay-nhay`; `w1_nose`, `q2_heart`, `q2_stomach`, `q4_heart`, `q4_stomach` là `tray_nose`, `tray_heart`, `tray_stomach` của bài `ho-hap/duong-di-cua-khong-khi`; câu w3 dùng lại `explore_dust`, `explore_mask`, `q1_hat`, `q1_raincoat` của bài `ho-hap/giu-phoi-khoe`.
- **An toàn:** không có trẻ nhận ra mặt (ảnh chụp từ phía sau, chỉ thấy tay, chân; hình vẽ không vẽ nét mặt). Hình bộ não, hộp sọ, trái tim không có máu, không mổ xẻ; hốc mắt hộp sọ vẽ nhạt. Bạn nhỏ đạp xe đội mũ bảo hiểm đã cài quai.
- **Các lựa chọn trong một câu cùng kiểu:** w1 ba hình vẽ giác quan; w3 ba hình vẽ đồ vật trên bàn gỗ (của *Hô hấp*); q1 ba bản tô của cùng một khuôn; q2 ba hình vẽ cơ quan, hình câu hỏi cũng là hình vẽ; q3 bốn hình vẽ của kệ Chơi; q4 ba hình vẽ cơ quan; q5 ba ảnh đồ vật trên nền trơn. Kệ Chơi chín hình vẽ (theo hình designer 10/11).
- **Ảnh chụp (sáu, theo file chọn ảnh 10/11):** gà trống gáy (cận đầu), hoa nhài (Khởi động); đá bóng (Học); gối, mũ vải, mũ bảo hiểm (câu q5; mũ có quai buông).
- **Hình tự vẽ (mười tám):** mắt, tai; khuôn người và ba bản tô; bộ não; hộp sọ; `explore_head`; ghép tranh (`explore_think`); tám món kệ Chơi (sách, quạt, xe đạp, bắt mạch, mưa, mồ hôi, dây nhảy, đồng hồ).
- **Dùng lại trong bài:** `explore_think` (món `tray_puzzle`, từ `remember`); `explore_head` (từ `in_charge`); `tray_pulse`, `tray_book`, `tray_bike`, `tray_sweat` (câu q3; `tray_bike` cả câu q4; `tray_pulse` cả từ `heartbeat`); `q2_brain` (câu q4, từ `brain`, thẻ thưởng); `q2` (câu q5, từ `skull`).
- **Dùng lại từ chủ đề khác:** *Hô hấp* như trên. `tray_clock` nay là ảnh riêng (rà chữ 10/11, n11), không dùng lại `w1_clock` của *Bề mặt Trái Đất*.
- **Bài khác dùng lại hình của bài này:** bảng hình dùng chung ở `_topic.md`, Quy ước hình mục tám.
- **Màu:** Học: trong đầu `nau_dat`, suy nghĩ `cham`, cử động `do_son`, suốt ngày đêm `gi_dong`. Chơi: suy nghĩ `cham`, cử động `do_son`, không cần nghĩ `gi_dong`, nhóm `limit` `nau_dat`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required`, một nhóm `limit`, chín món.
  - Khởi động: `single_choice` (w1, `prior_knowledge`), `true_false` (w2, `prior_knowledge`, đáp án Đúng), `single_choice` (w3, ôn `ho-hap/giu-phoi-khoe`; khối mới, `id:` trống).
  - Quiz: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2, một ô trống, ba thẻ từ có hình), `multi_choice` (q3), `true_false` (q6, `speaker: na`, đáp án Sai). Bốn format, đều hiện được ở app 0.1.0.
  - DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Câu có `misconception`: q6, key `brain_stops_when_resting`.
- **Vị trí đáp án đúng** (app không xáo): w1 thứ ba; w3 thứ nhất; q1 thứ hai; q4 thứ nhất; q5 thứ ba; q3 thứ nhất và thứ tư; thẻ đúng của q2 thứ nhất (rà chữ 10/11, N1).
- **Tham chiếu:** `topic: nao-bo-va-giac-quan`; `misconception: brain_stops_when_resting`; `recall_from.lesson: ho-hap/giu-phoi-khoe` (w3, đã có id).
- **Bộ thẻ `set: body`:** mới, riêng của chủ đề này (*Hô hấp* dùng `set: breathing`). Đề xuất ios-dev thêm khoá `collectible.set.body` "Body cards" · "Thẻ cơ thể".
- **Màn Chơi, ví dụ để kiểm:**
  - chạm Đọc sách, Đạp xe, Tim đập → đạt (`balanced`);
  - chạm Kim đồng hồ chạy → `has_limited`;
  - chạm Ghép tranh, Nhảy dây, Đạp xe (đủ ba chỗ, thiếu nhóm Không cần nghĩ) → `missing.tray_auto`; chạm thêm Tim đập → `full`; bỏ Đạp xe, đặt Tim đập → đạt.
- **Dòng điều kiện màn Chơi** sẽ là "Cần đủ Suy nghĩ và ghi nhớ, Cử động, Không cần nghĩ · Không phải việc cơ thể em làm". Nhờ tester xem trên iPhone bề rộng nhỏ nhất.
- **Câu "Em nghĩ sao?"** (đề xuất schema v1.1 `think_first`): "When you sleep, your brain switches off. What do you think?" · "Khi em ngủ, bộ não tắt hẳn. Em nghĩ sao?"; lựa chọn không chấm điểm "True" · "Đúng", "False" · "Sai", "I am not sure" · "Em chưa chắc". Bài bốn hỏi lại ở w3.
- **Số từ EN trên một màn** (đếm như các chủ đề trước):
  - Học khoảng ba mươi ba từ: mục tiêu 10, hướng dẫn 3, bốn nhãn 10, câu dài nhất 9, ô Từ mới 5. Vượt ba mươi vì có ô thứ tư.
  - Khởi động và Quiz: nhiều nhất là q3 (khoảng hai mươi tám) và q6 (khoảng hai mươi tám).
- **Từ EN có thể ngoài Starters/Movers:** brain, skull, heartbeat, in charge, pedal, sweat, stomach, hammock, pillow, helmet, puzzle, challenge. Phần lớn có hình đi kèm.
- **Không dùng dấu "—"**, không ký hiệu trong chuỗi tiếng Việt. Số viết bằng chữ.
