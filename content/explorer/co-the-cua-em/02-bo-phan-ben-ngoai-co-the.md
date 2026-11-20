---
id: 4f3a74f1-5d9d-48e0-afc7-63e3e174ee45
topic: co-the-cua-em
slug: bo-phan-ben-ngoai-co-the
order: 2
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Body parts on the outside
vi: Bộ phận bên ngoài cơ thể
> Giữ đúng tên ở `content/syllabus.json` (key `human-body-parts`, bài số hai).

## Mục tiêu
en: I can name outside parts and their jobs.
vi: Em gọi tên được bộ phận bên ngoài và việc của chúng.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 17/11/2026. Ticket SK-049. Mọi dòng `id:` để trống; chạy `ids` sau bài 1, trước bài 3.
> Sườn: lesson 2 `body-parts-on-the-outside` (`docs/oak/human-body-parts.md`). "Vẽ và dán nhãn" thành chỉ hình, chọn hình, xếp hình (SK-049 quyết định 7). Không dùng bài hát của sườn. Bộ phận dạy theo việc (cầm, co, đi); vai, cổ, lưng, mắt cá chân chỉ ở ví dụ.
> Sửa `body_is_one_part` ở cả ba ý chính, bốn ô Học (nhất là ô Working together), phần Chơi (ba việc, ba bộ phận) và câu q6 (gắn key).

## Ý chính
1.en: Your body has many parts.
1.vi: Cơ thể em có rất nhiều bộ phận.
2.en: Each part has its own job.
2.vi: Mỗi bộ phận làm một việc riêng.
3.en: The parts work together all day.
3.vi: Các bộ phận cùng làm việc suốt ngày.
> Từ cụ thể tới trừu tượng: các bộ phận nhìn thấy (bàn tay, khuỷu tay, đầu gối, chân), việc riêng của từng bộ phận, rồi ý nhiều bộ phận cùng làm một việc (đạp xe).
> VI không để "tay" đứng một mình (bảng Tên gọi ở `_topic.md`): luôn "bàn tay", "cánh tay", "ngón tay", "khuỷu tay".

## Khởi động

> w1 ôn bài 1 (bài trước): con vật cần thức ăn, nước và không khí. w2 ôn *Gọi tên và nhóm động vật* bài ba (mốc dài): bộ phận cơ thể con chim, nối sang bài hôm nay (bộ phận cơ thể người).

### w1
id: e9382646-6177-495c-bc8d-76c9eec9e7a1
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: co-the-cua-em/con-nguoi-cung-la-dong-vat
prompt.en: Which one needs food, water and air?
prompt.vi: Thứ nào cần thức ăn, nước và không khí?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think which one can grow bigger.
hint.vi: Em nghĩ xem thứ nào lớn lên được nhé.
explanation_correct.en: Yes! A cat is an animal, like us.
explanation_correct.vi: Đúng rồi! Con mèo là động vật, giống chúng mình.
explanation_wrong.en: The answer is the cat. It is an animal.
explanation_wrong.vi: Đáp án là con mèo. Mèo là động vật.
> Ghế đẩu có bốn chân như con mèo: bé phải nghĩ về điều con vật cần, không chọn theo dáng.

#### option w1_stool
correct: false
feedback.en: A stool has legs but cannot eat.
feedback.vi: Ghế đẩu có chân nhưng không ăn được.
label.en: stool
label.vi: ghế đẩu
image.brief: Dùng lại hình `tray_stool` ở bài `goi-ten-va-nhom-dong-vat/co-the-cac-con-vat`. Từ khoá tìm ảnh (EN): wooden stool four legs floor
image.alt.en: A wooden stool
image.alt.vi: Chiếc ghế đẩu gỗ

#### option w1_cat
correct: true
label.en: cat
label.vi: con mèo
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

### w2
id: d64f80f5-1091-4450-af66-aa579567ddb4
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/chim-va-bo-sat
prompt.en: A hen has a beak and two wings.
prompt.vi: Con gà mái có mỏ và hai cánh.
image.brief: Dùng lại hình `w3_hen` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): brown hen standing farmyard side view
image.alt.en: A hen in a yard
image.alt.vi: Con gà mái trong sân
answer: true
hint.en: Look at the hen's head and sides.
hint.vi: Em nhìn đầu và hai bên mình con gà nhé.
explanation_correct.en: Yes! A hen is a bird with feathers.
explanation_correct.vi: Đúng rồi! Gà mái là chim, có lông vũ.
explanation_wrong.en: This is true. Hens have beaks and wings.
explanation_wrong.vi: Câu này đúng. Gà mái có mỏ và có cánh.
feedback_false.en: A hen pecks food with its hard beak.
feedback_false.vi: Gà mái mổ thức ăn bằng chiếc mỏ cứng.
> Câu mới, không chép câu cũ của chủ đề số một ("Which animal has wings?").

## Học

> Bốn ô theo việc: cầm (bàn tay, ngón tay), co (khuỷu tay, đầu gối), đi (chân, bàn chân), rồi nhiều bộ phận cùng làm việc khi đạp xe (sửa `body_is_one_part`).
> Không dạy từ "khớp" · "joint" (để dành *Bộ xương và cơ bắp*). Không hỏi đếm ngón tay, ngón chân; ví dụ không khẳng định số ngón.

### explore
id: 99f19d76-4c04-4963-a28c-2962f7c0cd4c
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_hands
label.en: Hands
label.vi: Bàn tay
color: vang_hoe
sentence.en: Hands and fingers hold things.
sentence.vi: Bàn tay và ngón tay cầm nắm đồ vật.
image.brief: Dùng lại hình `explore_think` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`. Từ khoá tìm ảnh (EN): child hands jigsaw puzzle table top view
image.alt.en: Hands doing a jigsaw puzzle
image.alt.vi: Đôi tay đang ghép tranh
examples.1.en: hands hold a spoon
examples.1.vi: bàn tay cầm thìa
examples.2.en: fingers hold a pencil
examples.2.vi: ngón tay cầm bút chì
examples.3.en: fingers pick up a puzzle piece
examples.3.vi: ngón tay nhặt mảnh ghép
> `alt.vi` gốc có chữ "Đôi tay" (chép đúng `alt` gốc của *Não bộ và giác quan*); chữ này nằm trong cụm "đôi tay", không đứng một mình. Phiên chính xem có cần `alt` riêng "Đôi bàn tay đang ghép tranh" không.

#### group explore_bend
label.en: Elbows and knees
label.vi: Khuỷu tay và đầu gối
color: cham
sentence.en: Elbows and knees help you bend.
sentence.vi: Khuỷu tay và đầu gối giúp em co cánh tay, co chân.
image.brief: [hình vẽ] Đúng khuôn người nhìn nghiêng của `q1` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`, vẽ lại tư thế đang bước lên bậc (một khuỷu tay và một đầu gối gập), tô hai vùng tròn vàng nghệ ở khuỷu tay và đầu gối; khuôn trơn như mặc áo và quần soóc nhạt; không vẽ nét mặt, không chữ, không mũi tên.
image.alt.en: A child with the elbow and knee shaded
image.alt.vi: Bạn nhỏ, khuỷu tay và đầu gối tô màu vàng
examples.1.en: bend your arm to eat
examples.1.vi: co cánh tay để ăn cơm
examples.2.en: bend your knees to jump
examples.2.vi: co đầu gối để nhảy
examples.3.en: ankles help your feet move
examples.3.vi: mắt cá chân giúp bàn chân cử động
> Hình vẽ mới, chỉ dùng ở ô này. Ví dụ một dùng "ăn cơm", để câu q5 ("đánh răng") là áp dụng vào việc mới (DOK 2).
> [CẦN KIỂM] Cách nói "khuỷu tay, đầu gối giúp co" cho trẻ năm tới bảy tuổi, không dạy từ "khớp"; mắt cá chân giúp bàn chân cử động.

#### group explore_legs
label.en: Legs and feet
label.vi: Chân và bàn chân
color: gi_dong
sentence.en: Legs and feet help you walk and run.
sentence.vi: Chân và bàn chân giúp em đi và chạy.
image.brief: Dùng lại hình `explore_move` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`. Từ khoá tìm ảnh (EN): child legs kicking football grass
image.alt.en: Legs kicking a ball
image.alt.vi: Đôi chân đang đá bóng
examples.1.en: you stand on your feet
examples.1.vi: em đứng trên hai bàn chân
examples.2.en: toes are at the end of your feet
examples.2.vi: ngón chân ở cuối bàn chân
examples.3.en: legs kick a ball
examples.3.vi: chân đá quả bóng

#### group explore_together
label.en: Working together
label.vi: Cùng làm việc
color: nau_dat
sentence.en: Many parts work together to ride a bike.
sentence.vi: Nhiều bộ phận cùng làm việc khi em đạp xe.
image.brief: Dùng lại hình `tray_bike` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`. Từ khoá tìm ảnh (EN): child riding bicycle helmet back view
image.alt.en: A child riding a bike
image.alt.vi: Bạn nhỏ đang đạp xe
examples.1.en: hands hold the handlebars
examples.1.vi: bàn tay giữ tay lái
examples.2.en: legs push the pedals
examples.2.vi: chân đạp bàn đạp
examples.3.en: eyes look at the road
examples.3.vi: mắt nhìn đường
> Ô sửa `body_is_one_part`: một việc cần nhiều bộ phận. Bạn nhỏ trong hình đội mũ bảo hiểm (hình gốc).
> "Tay lái" là một từ (cái ghi đông), không phải "tay" đứng một mình; nghe thử giọng VI đọc "bàn tay giữ tay lái".

### new_words
id: cdfdd3c1-3e5a-4b27-9380-6b81b8afba95
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: elbow, knee

## Chơi

> Bé chọn ba bộ phận cho ba việc: cầm nắm (bàn tay, ngón tay), co duỗi (khuỷu tay, đầu gối), đi lại (bàn chân, đôi chân). Đạt khi đủ ba nhóm và không chọn thứ không phải bộ phận cơ thể.
> Món bẫy giống bộ phận: găng tay có hình bàn tay, đôi dép đi ở bàn chân. Tám món, cả kệ hình vẽ cùng nét, nền kem (bộ giác quan của *Não bộ và giác quan*). Ba việc, ba bộ phận: sửa `body_is_one_part`.

### tray
id: 37c5c422-1a33-49d3-b223-fc3059835c4b
type: build_tray
version: 1
prompt.en: Pick parts to hold, bend and walk
prompt.vi: Chọn bộ phận để cầm, để co và để đi
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find one part for each job.
messages.start.vi: Em tìm cho mỗi việc một bộ phận nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Each part has its own job.
messages.balanced.vi: Tuyệt! Mỗi bộ phận làm một việc riêng.
messages.has_limited.en: That one is not part of your body.
messages.has_limited.vi: Thứ này không phải bộ phận cơ thể em.
messages.missing.tray_hold.en: You still need a part to hold.
messages.missing.tray_hold.vi: Em còn thiếu một bộ phận để cầm nắm.
messages.missing.tray_bend.en: You still need a part that bends.
messages.missing.tray_bend.vi: Em còn thiếu một bộ phận để co duỗi.
messages.missing.tray_walk.en: You still need a part to walk.
messages.missing.tray_walk.vi: Em còn thiếu một bộ phận để đi lại.
> Lời nhắn `has_limited` đúng với cả hai món bẫy (găng tay, đôi dép là đồ dùng, không phải bộ phận cơ thể).

#### group tray_hold
label.en: Hold
label.vi: Cầm nắm
color: vang_hoe
role: required

#### group tray_bend
label.en: Bend
label.vi: Co duỗi
color: cham
role: required

#### group tray_walk
label.en: Walk
label.vi: Đi lại
color: gi_dong
role: required

#### group tray_not
label.en: Not a body part
label.vi: Không phải bộ phận cơ thể
color: do_son
role: limit

#### item tray_hand
label.en: Hand
label.vi: Bàn tay
group: tray_hold
image.brief: Dùng lại hình `q5_hand` ở bài `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`.
image.alt.en: A hand
image.alt.vi: Một bàn tay

#### item tray_glove
label.en: Glove
label.vi: Găng tay
group: tray_not
image.brief: [hình vẽ] Một chiếc găng tay len màu trơn đặt phẳng, thấy rõ năm ngón găng, cùng nét, nền kem, cùng cỡ với `q5_hand` ở bài `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`; không có tay người bên trong; không nhãn, không chữ.
image.alt.en: A glove
image.alt.vi: Chiếc găng tay
> Hình vẽ mới (phiên chính chốt 17/11: designer vẽ). Phương án thay nếu không vẽ được: mũ vải `q1_hat` ở bài `ho-hap/giu-phoi-khoe`, nhãn "Sun hat" · "Mũ vải".

#### item tray_elbow
label.en: Elbow
label.vi: Khuỷu tay
group: tray_bend
image.brief: [hình vẽ] Một cánh tay trẻ em co lại ở khuỷu, nhìn nghiêng, cắt từ vai tới cổ tay, khuỷu tay ở giữa khung; áo cộc tay trơn; cùng nét, nền kem, cùng cỡ với `q5_hand` ở bài `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`; không vết xước, không băng; không có chữ. Dùng ở món Chơi vuông, thẻ ba lựa chọn 5:2, thẻ từ 2:1 và hình câu w2 bài 5 khung 4:3: vẽ có khoảng trống nền kem quanh cánh tay.
image.alt.en: An elbow
image.alt.vi: Khuỷu tay
> Hình gốc của chủ đề (câu q5, từ `elbow`, bài 5 câu w2 dùng lại). `alt` cố ý không có chữ "bend".

#### item tray_foot
label.en: Foot
label.vi: Bàn chân
group: tray_walk
image.brief: Dùng lại hình `q5_toe` ở bài `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`.
image.alt.en: A foot with toes
image.alt.vi: Một bàn chân có các ngón chân

#### item tray_finger
label.en: Finger
label.vi: Ngón tay
group: tray_hold
image.brief: Dùng lại hình `tray_fingertip` ở bài `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`.
image.alt.en: A fingertip touching a table
image.alt.vi: Đầu ngón tay chạm mặt bàn

#### item tray_sandals
label.en: Sandals
label.vi: Đôi dép
group: tray_not
image.brief: [hình vẽ] Một đôi dép quai hậu màu trơn đặt cạnh nhau, nhìn từ trên xuống, cùng nét, nền kem, cùng cỡ với `q5_toe` ở bài `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`; không có bàn chân người; không nhãn hiệu, không chữ.
image.alt.en: A pair of sandals
image.alt.vi: Đôi dép
> Hình vẽ mới (phiên chính chốt 17/11: designer vẽ). Phương án thay nếu không vẽ được: khẩu trang `explore_mask` ở bài `ho-hap/giu-phoi-khoe`, nhãn "Mask" · "Khẩu trang".

#### item tray_knee
label.en: Knee
label.vi: Đầu gối
group: tray_bend
image.brief: [hình vẽ] Một cái chân trẻ em co ở đầu gối, nhìn nghiêng, cắt từ đùi tới cổ chân, đầu gối ở giữa khung; quần soóc trơn; cùng nét, nền kem, cùng cỡ với `tray_elbow`; không vết xước, không băng; không có chữ. Dùng ở món Chơi vuông, thẻ ba lựa chọn 5:2, thẻ hai lựa chọn 17:10 (bài 3), thẻ sắp thứ tự vuông và thẻ từ 2:1: vẽ có khoảng trống nền kem quanh chân.
image.alt.en: A knee
image.alt.vi: Đầu gối
> Hình gốc của chủ đề (câu q4, q5, từ `knee`, bài 3 câu w1 dùng lại).

#### item tray_legs
label.en: Legs
label.vi: Đôi chân
group: tray_walk
image.brief: Dùng lại hình `q3_run` ở bài `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`. Từ khoá tìm ảnh (EN): child legs running path close up
image.alt.en: Legs running
image.alt.vi: Đôi chân đang chạy

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q3, q5; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ).
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính. Mọi lựa chọn và thẻ là hình vẽ bộ phận cùng nét (một câu, một loại hình). Thứ tự `#### option` theo bảng Vị trí đáp án ở `_topic.md`.

### q1
id: 4aea4036-3f1e-43da-b276-cfbde9238ae0
format: single_choice
version: 1
dok: 1
prompt.en: Which part helps you hold a spoon?
prompt.vi: Bộ phận nào giúp em cầm thìa?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about sitting down to eat lunch.
hint.vi: Em nghĩ tới lúc ngồi vào mâm ăn cơm nhé.
explanation_correct.en: Yes! Your fingers hold the spoon tight.
explanation_correct.vi: Đúng rồi! Các ngón tay giữ chặt chiếc thìa.
explanation_wrong.en: The answer is the hand. Hands hold things.
explanation_wrong.vi: Đáp án là bàn tay. Bàn tay cầm nắm đồ vật.
> DOK 1: nhớ lại ví dụ ô Hands ("hands hold a spoon").

#### option q1_foot
correct: false
feedback.en: A foot helps you stand and walk.
feedback.vi: Bàn chân giúp em đứng và đi.
label.en: foot
label.vi: bàn chân
image.brief: Dùng lại hình `q5_toe` ở bài `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`.
image.alt.en: A foot with toes
image.alt.vi: Một bàn chân có các ngón chân

#### option q1_ear
correct: false
feedback.en: Your ear helps you hear.
feedback.vi: Tai giúp em nghe.
label.en: ear
label.vi: tai
image.brief: Dùng lại hình `w1_ear` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: An ear
image.alt.vi: Một cái tai

#### option q1_hand
correct: true
label.en: hand
label.vi: bàn tay
image.brief: Dùng lại hình `q5_hand` ở bài `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`.
image.alt.en: A hand
image.alt.vi: Một bàn tay

### q2
id: 79eab74c-6c9b-4934-8671-33a2b98ab8c8
format: true_false
version: 1
dok: 1
prompt.en: Your eyes and ears are on your head.
prompt.vi: Mắt và tai nằm trên đầu em.
image.brief: Dùng lại hình `q1_head` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: A child, the head shaded yellow
image.alt.vi: Bạn nhỏ, phần đầu tô màu vàng
answer: true
hint.en: Look at the yellow part of the child.
hint.vi: Em nhìn phần tô màu vàng trên người bạn nhỏ nhé.
explanation_correct.en: Yes! Your nose and mouth are there, too.
explanation_correct.vi: Đúng rồi! Mũi và miệng cũng nằm trên đầu.
explanation_wrong.en: This is true. They are on your head.
explanation_wrong.vi: Câu này đúng. Mắt và tai nằm trên đầu em.
feedback_false.en: Ears are on the sides of your head.
feedback_false.vi: Tai nằm ở hai bên đầu em.
> DOK 1: nhìn hình khuôn người tô đầu và nhớ lại chỗ các bộ phận. "Trên đầu" cho bộ phận bên ngoài (bảng Tên gọi).

### q3
id: 214f14c2-ffbe-4f39-bd6e-ae3f7c3e2c0e
format: single_choice
version: 1
dok: 1
prompt.en: Which part do you stand on?
prompt.vi: Em đứng trên bộ phận nào?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about walking on the grass.
hint.vi: Em nghĩ tới lúc đi trên bãi cỏ nhé.
explanation_correct.en: Yes! Your feet carry you all day.
explanation_correct.vi: Đúng rồi! Bàn chân đưa em đi suốt cả ngày.
explanation_wrong.en: The answer is the foot. You stand on it.
explanation_wrong.vi: Đáp án là bàn chân. Em đứng trên bàn chân.
> DOK 1: nhớ lại ví dụ ô Legs and feet ("you stand on your feet").

#### option q3_foot
correct: true
label.en: foot
label.vi: bàn chân
image.brief: Dùng lại hình `q5_toe` ở bài `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`.
image.alt.en: A foot with toes
image.alt.vi: Một bàn chân có các ngón chân

#### option q3_mouth
correct: false
feedback.en: Your mouth helps you eat and talk.
feedback.vi: Miệng giúp em ăn và nói.
label.en: mouth
label.vi: miệng
image.brief: Dùng lại hình `tray_mouth` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A mouth
image.alt.vi: Cái miệng

#### option q3_eye
correct: false
feedback.en: Your eyes help you see.
feedback.vi: Mắt giúp em nhìn.
label.en: eye
label.vi: mắt
image.brief: Dùng lại hình `w1_eye` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: An eye
image.alt.vi: Một con mắt

### q4
id: b31d398f-feee-402c-823d-86ef24273ace
format: order_sequence
version: 1
dok: 2
prompt.en: Order from head to toe.
prompt.vi: Xếp từ đầu đến chân.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_ear, q4_knee, q4_foot
hint.en: Start with the part on your head.
hint.vi: Em bắt đầu từ bộ phận nằm trên đầu nhé.
explanation_correct.en: Yes! Your knee is halfway down your leg.
explanation_correct.vi: Đúng rồi! Đầu gối nằm ở khoảng giữa chân.
explanation_wrong.en: The order is ear, knee, then foot.
explanation_wrong.vi: Thứ tự là tai, đầu gối, rồi bàn chân.
> DOK 2: bé so chỗ ba bộ phận trên cơ thể rồi xếp từ trên xuống. Khi đứng thẳng, tai luôn ở trên đầu gối, đầu gối ở trên bàn chân: đúng một thứ tự. Gợi ý chỉ nhắc một đầu dải. Thẻ trong file không theo thứ tự đúng.
> "Toe" bé đã gặp ở ví dụ ô Legs and feet và từ `toe`.
> [CẦN KIỂM] Khi đứng thẳng, tai ở trên đầu gối, đầu gối ở trên bàn chân.

#### item q4_knee
label.en: knee
label.vi: đầu gối
image.brief: Dùng lại hình `tray_knee`.
image.alt.en: A knee
image.alt.vi: Đầu gối

#### item q4_foot
label.en: foot
label.vi: bàn chân
image.brief: Dùng lại hình `q5_toe` ở bài `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`.
image.alt.en: A foot with toes
image.alt.vi: Một bàn chân có các ngón chân

#### item q4_ear
label.en: ear
label.vi: tai
image.brief: Dùng lại hình `w1_ear` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: An ear
image.alt.vi: Một cái tai

### q5
id: 9fde296a-edc6-46e7-b2f0-1dbebf8cfdc0
format: single_choice
version: 1
dok: 2
prompt.en: Which part bends when you brush your teeth?
prompt.vi: Bộ phận nào gập lại khi em đánh răng?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think how your toothbrush reaches your mouth.
hint.vi: Em nghĩ xem bàn chải đi lên miệng thế nào nhé.
explanation_correct.en: Yes! Your arm bends to reach your mouth.
explanation_correct.vi: Đúng rồi! Cánh tay co lại để đưa bàn chải lên miệng.
explanation_wrong.en: The answer is the elbow. Your arm bends there.
explanation_wrong.vi: Đáp án là khuỷu tay. Cánh tay gập lại ở đó.
> DOK 2: áp ô "Elbows and knees help you bend" vào việc quen mới (đánh răng; ô Học dùng ví dụ "ăn cơm"). Đầu gối là bẫy cùng ô (cũng gập được). Câu chỉ dùng "đánh răng" làm tình huống, không dạy đánh răng (Explorer không có bài dạy đánh răng: *Em khoẻ mạnh* đã bỏ, Duy chốt 19/11, SK-057; chăm sóc răng chỉ còn ở Discoverer *Hệ tiêu hoá*).
> Khuỷu tay và đầu gối đều là hình vẽ mới, bàn chân là hình dùng lại: đáp án không là hình mới duy nhất.

#### option q5_knee
correct: false
feedback.en: Your knee bends when you sit or jump.
feedback.vi: Đầu gối gập lại khi em ngồi hay nhảy.
label.en: knee
label.vi: đầu gối
image.brief: Dùng lại hình `tray_knee`.
image.alt.en: A knee
image.alt.vi: Đầu gối

#### option q5_elbow
correct: true
label.en: elbow
label.vi: khuỷu tay
image.brief: Dùng lại hình `tray_elbow`.
image.alt.en: An elbow
image.alt.vi: Khuỷu tay

#### option q5_foot
correct: false
feedback.en: A foot helps you stand at the sink.
feedback.vi: Bàn chân giúp em đứng cạnh bồn rửa.
label.en: foot
label.vi: bàn chân
image.brief: Dùng lại hình `q5_toe` ở bài `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`.
image.alt.en: A foot with toes
image.alt.vi: Một bàn chân có các ngón chân

### q6
id: d1f796ea-8cd6-4273-93a6-72b880cacabe
format: true_false
version: 1
dok: 2
misconception: body_is_one_part
prompt.en: Your whole body is just one part.
prompt.vi: Cả cơ thể em chỉ là một bộ phận.
image.brief: Dùng lại hình `explore_faster` ở bài `ho-hap/tho-khi-chay-nhay`. Từ khoá tìm ảnh (EN): children silhouettes playing sunset
image.alt.en: Children playing at sunset
image.alt.vi: Các bạn nhỏ chơi đùa lúc hoàng hôn
answer: false
hint.en: Think about running to catch a ball.
hint.vi: Em nghĩ tới lúc chạy theo bắt quả bóng nhé.
explanation_correct.en: Your body has many parts working together.
explanation_correct.vi: Cơ thể em có rất nhiều bộ phận cùng làm việc.
explanation_wrong.en: This is false. Your body has many parts.
explanation_wrong.vi: Câu này sai. Cơ thể em có rất nhiều bộ phận.
feedback_true.en: Each part does its own job.
feedback_true.vi: Mỗi bộ phận làm một việc riêng.
> Câu misconception (`body_is_one_part`), bằng hình, DOK 2: bé áp ý "nhiều bộ phận cùng làm việc" vào một cảnh mới (chạy bắt bóng, không phải đạp xe của ô Học). Câu chỉ kiểm một việc: cơ thể là một khối hay nhiều bộ phận.
> Hình là bóng các bạn nhỏ chơi đùa ở xa (thấy cả người đang cử động), không đẩy bé về phía nào. `explanation_correct` đứng một mình được: "Your whole body is just one part." → "Your body has many parts working together.".

## Từ vựng

### elbow
id: dbecc0ea-d584-4270-b430-485a7c3b5c85
tier: core
term.en: elbow
term.vi: khuỷu tay
example.en: Your elbow is halfway along your arm.
example.vi: Khuỷu tay nằm ở khoảng giữa cánh tay.
image.brief: Dùng lại hình `tray_elbow`.
image.alt.en: An elbow
image.alt.vi: Khuỷu tay

### knee
id: 577ea305-bf02-47c5-9d1f-1a744ee8dbdf
tier: core
term.en: knee
term.vi: đầu gối
example.en: I bend my knees to jump high.
example.vi: Em co đầu gối để nhảy thật cao.
image.brief: Dùng lại hình `tray_knee`.
image.alt.en: A knee
image.alt.vi: Đầu gối

### toe
id: 9434a3c5-3217-4d8d-a560-1ceb4a08f54f
tier: extra
term.en: toe
term.vi: ngón chân
example.en: I wiggle my toes in the sand.
example.vi: Em ngọ nguậy ngón chân trong cát.
image.brief: Dùng lại hình `q5_toe` ở bài `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`.
image.alt.en: A foot with toes
image.alt.vi: Một bàn chân có các ngón chân

### finger
id: cf85665e-36b2-44d3-a8c6-4b1701f123a4
tier: extra
term.en: finger
term.vi: ngón tay
example.en: I hold a pencil with my fingers.
example.vi: Em cầm bút chì bằng các ngón tay.
image.brief: Dùng lại hình `tray_fingertip` ở bài `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`.
image.alt.en: A fingertip touching a table
image.alt.vi: Đầu ngón tay chạm mặt bàn

## Thưởng

### fingers_card
id: e6859c67-4406-47c4-b786-0c7fa81178cd
set: body
rarity: common
name.en: Fingers
name.vi: Ngón tay
tag.en: Hold and pick up
tag.vi: Cầm và nhặt đồ vật
fact.en: Nobody else has fingerprints like yours.
fact.vi: Không ai có dấu vân tay giống hệt em.
image.brief: Dùng lại hình `tray_fingertip` ở bài `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`.
image.alt.en: A fingertip touching a table
image.alt.vi: Đầu ngón tay chạm mặt bàn
> [CẦN KIỂM] Dấu vân tay mỗi người là riêng, kể cả anh chị em sinh đôi cùng trứng.
> Bộ `set: body` đã có; thẻ Ngón tay chưa có.

## Ghi chú cho hoạ sĩ

- **Loại hình:** bộ phận cơ thể là hình vẽ gần thực tế, cùng nét, nền kem trơn với bộ giác quan và bộ khuôn người của *Não bộ và giác quan* (`w1_eye`, `w1_ear`, `q5_hand`, `q5_toe`, `tray_fingertip`, `q1`). Cả kệ Chơi là hình vẽ; mọi lựa chọn và thẻ quiz là hình vẽ. Ô Học được khác loại (ô Legs and feet là ảnh). Không vết xước, không băng, không vẽ nét mặt, không chữ, không mũi tên.
- **Hình vẽ mới (năm):** `tray_elbow` (cánh tay co ở khuỷu; món Chơi, q5, từ `elbow`, bài 5 w2), `tray_knee` (chân co ở đầu gối; món Chơi, q4, q5, từ `knee`, bài 3 w1), `explore_bend` (khuôn người nhìn nghiêng của `q1`, tư thế bước lên bậc, tô vàng nghệ khuỷu tay và đầu gối), `tray_glove` (găng tay len), `tray_sandals` (đôi dép quai hậu). Phiên chính chốt 17/11: designer vẽ găng tay và đôi dép (phương án thay ghi dưới hai món).
- **Hình dùng lại:** *Não bộ và giác quan* bài một: `explore_think` (ô Hands), `explore_move` (ô Legs and feet, ảnh), `tray_bike` (ô Working together), `q1_head` (q2), `w1_ear` (q1, q4), `w1_eye` (q3); bài hai: `q5_hand` (món Chơi, q1), `q5_toe` (món Chơi, q1, q3, q4, q5, từ `toe`), `tray_fingertip` (món Chơi, từ `finger`, thẻ thưởng), `q3_run` (món Chơi). *Hô hấp*: `tray_mouth` (q3), `explore_faster` (q6, ảnh). *Gọi tên và nhóm động vật*: `w1` hàng rào tre (hình câu w1, q1, q3, q4, q5), `tray_stool` (w1). *Khủng long*: `w3_cat` (w1), `w3_hen` (w2).
- **Khung:** hình vẽ của Discoverer (1024×768, nền kem) dùng ở thẻ ba lựa chọn 5:2, thẻ hai lựa chọn 17:10, thẻ từ 2:1: làm mục riêng đệm nền kem hai bên, không cắt mất bộ phận. Thẻ `order_sequence` và món Chơi vuông.
- **Màu:** Học: Hands `vang_hoe`, Elbows and knees `cham`, Legs and feet `gi_dong`, Working together `nau_dat`. Chơi: Cầm nắm `vang_hoe`, Co duỗi `cham`, Đi lại `gi_dong`, Không phải bộ phận cơ thể `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (elbow, knee). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Đúng). Quiz `single_choice` (q1, q3, q5; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`body_is_one_part`). Không có `labels` ở câu `true_false`.
- **Thứ tự đúng `order_sequence` q4:** `q4_ear`, `q4_knee`, `q4_foot` (thẻ trong file: `q4_knee`, `q4_foot`, `q4_ear`).
- **Vị trí đáp án:** app xáo lựa chọn (SK-047). Thứ tự trong file theo bảng ở `_topic.md`: w1 chỗ hai (trên hai), q1 chỗ ba, q3 chỗ một, q5 chỗ hai.
- **Màn Chơi, ví dụ để kiểm:** Bàn tay, Khuỷu tay, Bàn chân → `balanced`; Ngón tay, Đầu gối, Găng tay → `has_limited`; Bàn tay, Ngón tay, Đôi chân → `missing.tray_bend`; Khuỷu tay, Đầu gối, Đôi dép → `has_limited`.
- **Khởi động:** w1 → `co-the-cua-em/con-nguoi-cung-la-dong-vat` (bài 1; cần chạy `ids` cho bài 1 trước, nếu không `validate` báo `md_ref_unknown` "chưa có id"), w2 → `goi-ten-va-nhom-dong-vat/chim-va-bo-sat` (đã có id).
- **Từ EN có thể ngoài Starters/Movers:** elbow, elbows, knee, knees, ankles, toe, toes, fingers, fingerprints, handlebars, pedals, bend, bends, wiggle, glove, sandals, puzzle piece, halfway, sink, beak, wings, stool. Nghe thử giọng EN "elbow", "knee", "ankles"; giọng VI "khuỷu tay", "tay lái".
