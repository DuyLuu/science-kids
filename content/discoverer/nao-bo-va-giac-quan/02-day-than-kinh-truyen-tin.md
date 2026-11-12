---
id: b0670c67-af33-41f5-a065-50acb79f9add
topic: nao-bo-va-giac-quan
slug: day-than-kinh-truyen-tin
order: 2
stage: core
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Nerves carry messages
vi: Dây thần kinh truyền tin
> Giữ đúng tên ở `syllabus-lessons.md` và `content/syllabus.json` (`new-brain`, bài số hai).

## Mục tiêu
en: I can say how nerves carry messages around my body.
vi: Em kể được dây thần kinh truyền tin đi khắp cơ thể ra sao.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-037, ngày 10/11/2026. Đã chạy `ids`. Sửa theo rà chữ tester 10/11 (ticket SK-037, mục "content-editor 10/11 · sửa theo tester").
> Bài `core`. Sửa `nerve_messages_slow` ở ý chính ba, ô "Very fast", câu q5 dẫn vào q6 (gắn key, Na nói đúng). Món bẫy gân xanh ở phần Chơi chạm `veins_are_nerves`, không gắn key.

## Ý chính
1.en: Nerves are thin threads that go all over your body.
1.vi: Dây thần kinh là những sợi rất mảnh, chạy khắp cơ thể em.
2.en: Nerves carry messages to and from your brain.
2.vi: Dây thần kinh mang tin về não, và mang tin từ não đi ra.
3.en: Nerve messages are very fast, faster than a blink.
3.vi: Tin đi trên dây thần kinh rất nhanh, nhanh hơn một cái chớp mắt.
> [CẦN KIỂM] Tốc độ và so sánh với cái chớp mắt: xem ghi chú ở `nerve_messages_slow` trong `_topic.md`.
> Ba ý đi từ cụ thể tới trừu tượng: dây thần kinh là một vật (vẽ được), tin đi hai chiều (một quá trình), tốc độ (một so sánh).

## Khởi động

> Hai câu. w1 ôn bài một (khoảng một ngày trước). w2 ôn bài ba *Hô hấp* (khoảng một tuần trước; rà chữ tester 10/11). Cả hai `single_choice`, để giữ cân bằng Đúng/Sai của chủ đề.

### w1
id: 540e5fbd-4224-4a88-aff8-31c781da9fb6
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: nao-bo-va-giac-quan/nao-dieu-khien-co-the
prompt.en: Mai is asleep. What does her brain still do?
prompt.vi: Mai đang ngủ. Bộ não của Mai vẫn làm việc gì?
image.brief: Dùng lại hình `q1` ở bài `ho-hap/vi-sao-ta-phai-tho`
image.alt.en: A child asleep under a mosquito net
image.alt.vi: Bạn nhỏ ngủ trong màn
hint.en: Think of a job your brain does without thinking.
hint.vi: Em nghĩ tới một việc bộ não làm mà em không cần nghĩ.
explanation_correct.en: Yes! Her brain keeps her heart beating all night.
explanation_correct.vi: Đúng rồi! Bộ não giữ cho tim Mai đập suốt đêm.
explanation_wrong.en: The answer is keeping her heart beating. She cannot ride or read asleep.
explanation_wrong.vi: Đáp án là giữ cho tim đập. Lúc ngủ thì Mai không đạp xe hay đọc sách được.
> Ôn ý chính ba và câu q3 của bài một, ở dạng một đáp án. Ba ảnh dùng lại kệ Chơi bài một, cùng là ảnh chụp.

#### option w1_heart
correct: true
label.en: keep her heart beating
label.vi: giữ cho tim đập
image.brief: Dùng lại hình `nao-dieu-khien-co-the/tray_pulse`
image.alt.en: Fingers feeling a heartbeat at the wrist
image.alt.vi: Ngón tay bắt nhịp tim ở cổ tay

#### option w1_ride
correct: false
label.en: ride a bike
label.vi: đạp xe
image.brief: Dùng lại hình `nao-dieu-khien-co-the/tray_bike`
image.alt.en: A child riding a bike
image.alt.vi: Bạn nhỏ đang đạp xe

#### option w1_read
correct: false
label.en: read a book
label.vi: đọc sách
image.brief: Dùng lại hình `nao-dieu-khien-co-the/tray_book`
image.alt.en: A child reading a book
image.alt.vi: Bạn nhỏ đang đọc sách

### w2
id: 34770578-86c1-4ff7-b70e-cb5aa99a939d
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: ho-hap/tho-khi-chay-nhay
prompt.en: Which one makes you breathe fastest?
prompt.vi: Việc nào làm em thở nhanh nhất?
image.brief: Dùng lại hình `q1` ở bài `ho-hap/tho-khi-chay-nhay`
image.alt.en: An empty schoolyard
image.alt.vi: Sân trường vắng
hint.en: Remember the Faster card in the breathing lessons.
hint.vi: Em nhớ lại ô Nhanh hơn ở chủ đề Hô hấp nhé.
explanation_correct.en: Yes! Skipping works your muscles, so you breathe faster.
explanation_correct.vi: Đúng rồi! Nhảy dây làm cơ bắp hoạt động mạnh, nên em thở nhanh hơn.
explanation_wrong.en: The answer is skipping. Reading and sleeping keep you still.
explanation_wrong.vi: Đáp án là nhảy dây. Lúc đọc truyện hay lúc ngủ, em ngồi yên hoặc nằm yên.
> Rà chữ tester 10/11 (mục "Hết hiệu lực"): đổi từ câu ôn *Khủng long* (cái nào là hoá thạch) sang ôn bài ba *Hô hấp* (khoảng một tuần trước), lấp mốc "một tuần" của giãn cách. Giữ `id`, key `w2` và format `single_choice`; nội dung là câu mới. Câu ôn lại ý chính một của bài đó, không dạy lại.
> Ba lựa chọn dùng lại ba ảnh của câu q1 bài `ho-hap/tho-khi-chay-nhay`, trỏ về hình gốc, cùng kiểu: một vật nằm trên mặt phẳng, không có người. Thứ tự khác câu đó (ở đó dây nhảy đứng thứ nhất).

#### option w2_reading
correct: false
label.en: reading
label.vi: đọc truyện
image.brief: Dùng lại hình `tray_book` ở bài `ho-hap/tho-khi-chay-nhay`
image.alt.en: A book on a table
image.alt.vi: Quyển truyện trên bàn

#### option w2_skipping
correct: true
label.en: skipping
label.vi: nhảy dây
image.brief: Dùng lại hình `tray_rope` ở bài `ho-hap/tho-khi-chay-nhay`
image.alt.en: A skipping rope
image.alt.vi: Sợi dây nhảy

#### option w2_sleeping
correct: false
label.en: sleeping
label.vi: ngủ
image.brief: Dùng lại hình `q1_sleeping` ở bài `ho-hap/tho-khi-chay-nhay`
image.alt.en: A pillow and a blanket
image.alt.vi: Chiếc gối và chiếc chăn

## Học

> Bốn ô, theo bảng kế hoạch: dây thần kinh và tuỷ sống (ý chính một), tin về não, tin từ não (ý chính hai, cùng một con muỗi), rất nhanh (ý chính ba).
> Hình ô Học không có chữ, kể cả nhãn chữ song ngữ. Tên "tuỷ sống" nằm ở món ví dụ và từ vựng.

### explore
id: 9c467779-e3de-4804-9ee8-e283d5fe3810
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_nerves
label.en: Nerves
label.vi: Dây thần kinh
color: cham
sentence.en: Nerves are thin threads that go all over your body.
sentence.vi: Dây thần kinh là những sợi rất mảnh, chạy khắp cơ thể em.
image.brief: [hình vẽ] Đúng khuôn người nhìn nghiêng của câu q1 bài `nao-dieu-khien-co-the`, vẽ thêm bộ não nhỏ màu hồng xám trong đầu, một dải vàng nghệ đậm chạy từ não dọc theo lưng (tuỷ sống), rồi nhiều sợi vàng mảnh rẽ nhánh ra hai tay, hai chân, tới tận đầu ngón tay, ngón chân; không vẽ nét mặt, không có nhãn, không có mũi tên, không có chữ.
image.alt.en: A child with nerves drawn all over the body
image.alt.vi: Bạn nhỏ có dây thần kinh vẽ khắp cơ thể
examples.1.en: in your fingers and toes
examples.1.vi: ở ngón tay, ngón chân
examples.2.en: under your skin
examples.2.vi: ở dưới da
examples.3.en: a thick bundle in your backbone
examples.3.vi: một bó lớn trong xương sống
examples.4.en: that bundle is the spinal cord
examples.4.vi: bó lớn đó là tuỷ sống
> [CẦN KIỂM] Tuỷ sống là một bó lớn mô thần kinh nằm trong ống xương sống, nối não với dây thần kinh khắp cơ thể; "bó dây thần kinh" là cách nói giản lược cho trẻ. Thẻ thưởng dùng lại hình này.

#### group explore_to_brain
label.en: To the brain
label.vi: Tin về não
color: vang_hoe
sentence.en: Nerves carry a message from your skin to your brain.
sentence.vi: Dây thần kinh mang tin từ da em về não.
image.brief: [ảnh] Một con muỗi đậu trên da cánh tay người, chụp cận, thấy rõ chân và vòi muỗi, da cánh tay chiếm gần hết khung; không thấy máu, không thấy mặt, không có chữ. Từ khoá tìm ảnh (EN): mosquito on human arm skin close up
image.alt.en: A mosquito on an arm
image.alt.vi: Con muỗi đậu trên cánh tay
examples.1.en: a mosquito lands on your arm
examples.1.vi: con muỗi đậu trên tay em
examples.2.en: your skin feels it
examples.2.vi: da em cảm thấy
examples.3.en: the message goes up to your brain
examples.3.vi: tin chạy lên não
> Con muỗi là cảnh quen của trẻ Việt Nam, nhất là mùa mưa. Không nói muỗi truyền bệnh (sốt xuất huyết) ở đây, để giữ bài nhẹ nhàng.

#### group explore_from_brain
label.en: From the brain
label.vi: Tin từ não
color: do_son
sentence.en: Your brain sends a message back, and your hand moves.
sentence.vi: Bộ não gửi tin ngược lại, và tay em cử động.
image.brief: [hình vẽ] Một bàn tay đang gãi nhẹ lên cánh tay bên kia, vẽ cận, chỉ thấy hai cánh tay; không có vết đỏ, không có vết thương, không vẽ nét mặt, không có chữ. Câu q3 dùng lại hình này. Từ khoá tìm ảnh (EN): hand scratching arm close up
image.alt.en: A hand scratching an arm
image.alt.vi: Bàn tay đang gãi cánh tay
examples.1.en: the message goes down to your hand
examples.1.vi: tin chạy xuống tay
examples.2.en: you scratch the itch
examples.2.vi: em gãi chỗ ngứa
examples.3.en: or you shoo the mosquito away
examples.3.vi: hoặc em xua con muỗi đi
> "Xua con muỗi đi" thay cho "đập muỗi", cho nhẹ nhàng.

#### group explore_fast
label.en: Very fast
label.vi: Rất nhanh
color: gi_dong
sentence.en: Nerve messages are very fast, faster than a blink.
sentence.vi: Tin đi trên dây thần kinh rất nhanh, nhanh hơn một cái chớp mắt.
image.brief: [hình vẽ] Một bàn tay vừa bắt được cây thước nhựa đang rơi, vẽ cận, thấy bàn tay khép lại quanh thước; thước trơn, không có vạch số hay chữ, không vẽ nét mặt. Từ khoá tìm ảnh (EN): hand catching falling ruler reaction test
image.alt.en: A hand catching a falling ruler
image.alt.vi: Bàn tay bắt cây thước đang rơi
examples.1.en: catch a falling ruler
examples.1.vi: bắt cây thước đang rơi
examples.2.en: touch a hot pot, pull back fast
examples.2.vi: chạm nồi nóng, em rụt tay lại ngay
examples.3.en: hit your toe, feel it at once
examples.3.vi: vấp ngón chân, em thấy đau ngay
> [CẦN KIỂM] Rụt tay khi chạm vật nóng là phản xạ đi qua tuỷ sống, tay rụt lại trước khi não kịp "thấy nóng". Bài không nói "não quyết định rụt tay", chỉ nói tay rụt lại rất nhanh. Bắt thước rơi là trò đo phản xạ quen thuộc (mục Thí nghiệm ở nhà, `_topic.md`).

### new_words
id: f337cd4e-defc-4cf3-a514-d1398daace84
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: nerve, message, spinal_cord

## Chơi

> Con muỗi đậu trên tay. Bé dựng đường đi của tin bằng ba chỗ: chỗ cảm thấy (da trên cánh tay hoặc đầu ngón tay), đường mang tin (dây thần kinh hoặc tuỷ sống), chỗ nhận tin (bộ não). Không được chọn thứ không thuộc đường đi này.
> - Ba món bẫy đều "giống đường truyền": dây điện (dẫn điện), gân xanh ở cổ tay (`veins_are_nerves`: tiếng Việt gọi là "gân", nhìn thấy được, chạy dưới da), điện thoại ống bơ (cũng truyền tiếng đi theo sợi dây).
> - Cả kệ là hình vẽ (Quy ước hình, mục hai ở `_topic.md`): dây thần kinh, tuỷ sống, bộ não chỉ vẽ được, nên ba món bẫy và hai món "cảm thấy" cũng vẽ cùng nét, để bé không chọn theo kiểu hình.
> - Lời nhắn không gọi tên vật chứa. Thứ tự nhắc thiếu nhóm: cảm thấy, mang tin, nhận tin, đúng chiều tin đi.

### tray
id: a080b584-898b-4b03-ad08-f97bc999bb9b
type: build_tray
version: 1
prompt.en: Build the path of a message
prompt.vi: Dựng đường đi của tin
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: A mosquito lands on your arm. Build the message path.
messages.start.vi: Con muỗi đậu trên tay em. Em dựng đường đi của tin nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Skin feels it, nerves carry it, the brain gets it.
messages.balanced.vi: Tuyệt! Da cảm thấy, dây thần kinh mang tin, bộ não nhận tin.
> Lời nhắn khi đạt đúng với mọi cảnh đạt: chọn đầu ngón tay thay da cánh tay, hay tuỷ sống thay dây thần kinh, câu vẫn đúng (đầu ngón tay cũng là da; tuỷ sống cũng là dây thần kinh).
messages.has_limited.en: That does not carry nerve messages. Tap it to take it off.
messages.has_limited.vi: Cái đó không mang tin của dây thần kinh. Em chạm vào để bỏ ra nhé.
messages.missing.tray_feel.en: You still need a part that feels it.
messages.missing.tray_feel.vi: Em còn thiếu chỗ cảm thấy.
messages.missing.tray_carry.en: You still need something that carries the message.
messages.missing.tray_carry.vi: Em còn thiếu đường mang tin.
messages.missing.tray_get.en: You still need something that gets the message.
messages.missing.tray_get.vi: Em còn thiếu chỗ nhận tin.
> Rà chữ tester 10/11 (n2): "the part" đổi thành "something", để lời nhắc không nói trước là chỉ có một món. Nhóm `tray_get` có một món (bộ não) là cố ý: bộ não là chỗ duy nhất nhận tin, thêm món thứ hai dễ sai khoa học. Kệ lệch 2-2-1, nhóm `limit` ba món.

#### group tray_feel
label.en: Feels it
label.vi: Chỗ cảm thấy
color: vang_hoe
role: required

#### group tray_carry
label.en: Carries it
label.vi: Đường mang tin
color: cham
role: required

#### group tray_get
label.en: Gets it
label.vi: Chỗ nhận tin
color: nau_dat
role: required

#### group tray_not_path
label.en: Not part of the path
label.vi: Không thuộc đường đi này
color: do_son
role: limit

#### item tray_arm
label.en: Skin on your arm
label.vi: Da trên cánh tay
group: tray_feel
image.brief: [hình vẽ] Một đoạn cánh tay trẻ em vẽ gần thực tế, nằm ngang, trên da có một con muỗi nhỏ đang đậu; không có vết đỏ, không có máu; nền kem trơn, cùng nét với bộ giác quan; không có chữ. Lựa chọn `q3_bite` dùng lại hình này.
image.alt.en: A mosquito on the skin of an arm
image.alt.vi: Con muỗi đậu trên da cánh tay

#### item tray_wire
label.en: Electric wire
label.vi: Dây điện
group: tray_not_path
image.brief: [hình vẽ] Một đoạn dây điện bọc nhựa màu trắng cuộn nhẹ, vỏ còn nguyên, không lộ lõi đồng; một đầu là phích cắm nhựa trơn không nhãn hiệu, đầu kia khuất trong cuộn dây; vẽ gần thực tế; không có tia điện, không có ổ cắm, không có chữ; nền kem trơn, cùng nét với các món khác của kệ.
> Rà chữ tester 10/11 (n15): bỏ hình dây hở lõi đồng, để không mời trẻ bắt chước.
image.alt.en: A piece of electric wire
image.alt.vi: Một đoạn dây điện

#### item tray_nerves
label.en: Nerves
label.vi: Dây thần kinh
group: tray_carry
image.brief: Dùng lại hình `day-than-kinh-truyen-tin/q4_nerve`
image.alt.en: A nerve with thin branches
image.alt.vi: Một dây thần kinh có nhiều nhánh mảnh

#### item tray_veins
label.en: Blue lines on the wrist
label.vi: Gân xanh ở cổ tay
group: tray_not_path
image.brief: [hình vẽ] Mặt trong cổ tay và lòng bàn tay của một người, vẽ gần thực tế, thấy vài đường gân xanh mờ dưới da; không có vết thương, không có máu, không có kim tiêm; nền kem trơn, cùng nét với các món khác; không có chữ. Câu w2 bài `giac-quan-gui-tin-ve-nao` dùng lại hình này.
image.alt.en: Blue lines under the skin of a wrist
image.alt.vi: Những đường gân xanh dưới da cổ tay
> Món bẫy của `veins_are_nerves`. [CẦN KIỂM] như ghi chú ở `_topic.md`.

#### item tray_spinal
label.en: Spinal cord
label.vi: Tuỷ sống
group: tray_carry
image.brief: [hình vẽ] Một đoạn xương sống gồm năm sáu đốt xương màu trắng ngà xếp chồng, vẽ như cắt dọc một nửa để thấy tuỷ sống màu vàng nghệ chạy bên trong, vài nhánh dây thần kinh vàng mảnh đi ra hai bên; kiểu tranh minh hoạ y học cho trẻ, cùng nét bộ cơ quan; không có máu, không có nhãn, không có chữ; nền kem trơn. Từ `spinal_cord` dùng lại hình này.
image.alt.en: The spinal cord inside the backbone
image.alt.vi: Tuỷ sống nằm trong xương sống

#### item tray_fingertip
label.en: Fingertips
label.vi: Đầu ngón tay
group: tray_feel
image.brief: [hình vẽ] Đầu ngón trỏ của một bạn nhỏ chạm nhẹ lên mặt bàn gỗ, vẽ cận cảnh gần thực tế, chỉ thấy ngón trỏ và một phần bàn tay; không có chữ; nền kem trơn, cùng nét với bộ giác quan và các món khác của kệ.
image.alt.en: A fingertip touching a table
image.alt.vi: Đầu ngón tay chạm mặt bàn
> Rà chữ tester 10/11 (n1): hình vẽ riêng, không dùng lại `q5_hand` nữa. Hình bàn tay là lựa chọn sai ở câu q5 mà ở kệ lại là món đúng, và `alt` "Một bàn tay" không khớp nhãn "Đầu ngón tay".

#### item tray_can_phone
label.en: Tin-can phone
label.vi: Điện thoại ống bơ
group: tray_not_path
image.brief: [hình vẽ] Hai cái lon thiếc rỗng nối với nhau bằng một sợi dây căng, đồ chơi "điện thoại ống bơ", vẽ gần thực tế; lon trơn, không có nhãn, không có chữ; không có người; nền kem trơn, cùng nét với các món khác.
image.alt.en: Two tin cans joined by a string
image.alt.vi: Hai cái lon nối với nhau bằng sợi dây

#### item tray_brain
label.en: Brain
label.vi: Bộ não
group: tray_get
image.brief: Dùng lại hình `nao-dieu-khien-co-the/q2_brain`
image.alt.en: A brain
image.alt.vi: Bộ não

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Bốn format: `fill_blank_bank` (q1), `single_choice` (q2, q4, q5), `multi_choice` (q3), `true_false` (q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, thẻ từ có hình.

### q1
id: 63c36f7b-8e76-4e3f-8d15-c05fab8b2aa0
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `day-than-kinh-truyen-tin/explore_nerves`
image.alt.en: A child with nerves drawn all over the body
image.alt.vi: Bạn nhỏ có dây thần kinh vẽ khắp cơ thể
sentence.en: Nerves carry {1} to and from your brain.
sentence.vi: Dây thần kinh mang {1} về não và từ não đi ra.
answers: q1_messages
hint.en: Remember the mosquito on your arm.
hint.vi: Em nhớ lại con muỗi đậu trên tay nhé.
explanation_correct.en: Yes! Nerves carry messages to and from your brain.
explanation_correct.vi: Đúng rồi! Dây thần kinh mang tin về não và từ não đi ra.
explanation_wrong.en: The answer is messages. Food and water do not go along nerves.
explanation_wrong.vi: Đáp án là tin. Thức ăn và nước không đi theo dây thần kinh.
> Hình câu hỏi là dây thần kinh (chủ ngữ của câu), không phải tin (đáp án). Ba thẻ từ là ảnh chụp cùng kiểu: một vật trên nền trơn. "Tin" là một ý; hình là lá thư trong phong bì, vật quen gắn với "gửi tin".
> Gợi ý không nhắc tên bài (tên bài có chữ "messages").
> Rà chữ tester 10/11: thẻ đúng chuyển xuống thứ ba (N1); câu tiếng Việt rút gọn cho khớp câu tiếng Anh (n3). Giữ chữ "tin" (tester đồng ý, n3).

#### bank q1_food
label.en: food
label.vi: thức ăn
image.brief: [ảnh] Một bát cơm trắng đặt trên nền trơn, chụp chéo; không có đũa có chữ, không có nhãn hiệu. Từ khoá tìm ảnh (EN): bowl of white rice plain background
image.alt.en: A bowl of rice
image.alt.vi: Một bát cơm

#### bank q1_water
label.en: water
label.vi: nước
image.brief: [ảnh] Một cốc thuỷ tinh đựng nước trong đặt trên nền trơn, chụp ngang; không có nhãn, không có chữ. Từ khoá tìm ảnh (EN): glass of water plain background
image.alt.en: A glass of water
image.alt.vi: Một cốc nước

#### bank q1_messages
label.en: messages
label.vi: tin
image.brief: [ảnh] Một lá thư gấp thò ra khỏi phong bì giấy trắng, đặt trên nền trơn, chụp chéo; không có tem, không có chữ viết đọc được, không có địa chỉ. Từ `message` dùng lại ảnh này. Từ khoá tìm ảnh (EN): paper letter envelope plain background
image.alt.en: A letter in an envelope
image.alt.vi: Lá thư trong phong bì

### q2
id: 5e923f88-d011-4cf7-bc88-5f6e2a14bde0
format: single_choice
version: 1
dok: 1
prompt.en: Where is the big bundle of nerves?
prompt.vi: Bó dây thần kinh lớn nằm ở đâu?
image.brief: Dùng lại hình `nao-dieu-khien-co-the/q1`
image.alt.en: A child seen from the side
image.alt.vi: Một bạn nhỏ nhìn nghiêng
hint.en: Remember the Nerves picture. Where is the thick bundle?
hint.vi: Em nhớ lại ô Dây thần kinh. Bó dây lớn nằm ở đâu?
explanation_correct.en: Yes! The spinal cord runs down your back, inside your backbone.
explanation_correct.vi: Đúng rồi! Tuỷ sống chạy dọc lưng, bên trong xương sống.
explanation_wrong.en: The answer is the back. The spinal cord runs down it.
explanation_wrong.vi: Đáp án là lưng. Tuỷ sống chạy dọc ở đó.
> Ba lựa chọn là cùng khuôn người của bài một, chỉ khác vùng tô vàng. Hình câu hỏi không tô vùng nào.
> Rà chữ tester 10/11 (N6): ba nhãn cùng một dạng "in the …" · "ở …"; trước đây nhãn đáp án là nhãn duy nhất có "along" · "dọc theo". Nhãn tiếng Việt cả ba dùng "ở" ("ở lưng" xuôi hơn "trong lưng"); khác nhãn "trong ngực", "trong bụng" của câu q1 bài một, vì đó là nhãn riêng của câu đó.

#### option q2_back
correct: true
label.en: in the back
label.vi: ở lưng
image.brief: [hình vẽ] Đúng khuôn người nhìn nghiêng của câu q1 bài `nao-dieu-khien-co-the`, tô một dải màu vàng nghệ chạy dọc lưng từ gáy xuống hông; không tô chỗ khác, không vẽ xương hay dây thần kinh, không có chữ. Từ `backbone` dùng lại hình này.
image.alt.en: A child, the back shaded yellow
image.alt.vi: Bạn nhỏ, phần lưng tô màu vàng

#### option q2_chest
correct: false
label.en: in the chest
label.vi: ở ngực
image.brief: Dùng lại hình `nao-dieu-khien-co-the/q1_chest`
image.alt.en: A child, the chest shaded yellow
image.alt.vi: Bạn nhỏ, phần ngực tô màu vàng

#### option q2_tummy
correct: false
label.en: in the tummy
label.vi: ở bụng
image.brief: Dùng lại hình `nao-dieu-khien-co-the/q1_tummy`
image.alt.en: A child, the tummy shaded yellow
image.alt.vi: Bạn nhỏ, phần bụng tô màu vàng

### q3
id: d62b1491-0198-4052-8ce1-6215b83d6501
format: multi_choice
version: 1
dok: 2
prompt.en: Which messages go to your brain?
prompt.vi: Những tin nào đi về não?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `day-than-kinh-truyen-tin/explore_nerves`
image.alt.en: A child with nerves drawn all over the body
image.alt.vi: Bạn nhỏ có dây thần kinh vẽ khắp cơ thể
hint.en: Does it start in your skin, or your brain?
hint.vi: Tin bắt đầu từ da em, hay từ bộ não?
explanation_correct.en: Yes! Your skin feels the mosquito and the cold rain.
explanation_correct.vi: Đúng rồi! Da em cảm thấy con muỗi và mưa lạnh.
explanation_wrong.en: The answers are the mosquito and the cold rain.
explanation_wrong.vi: Đáp án là con muỗi và mưa lạnh.
> DOK 2: phân loại tin theo chiều đi (về não hay từ não ra), có hai tình huống mới (mưa lạnh, chạy). Bốn hình vẽ cùng kiểu (theo hình designer 10/11): cận cảnh da, tay hoặc chân, không vẽ nét mặt. Lựa chọn `q3_bite` dùng lại hình vẽ con muỗi `tray_arm` của kệ Chơi thay cho ảnh ô `explore_to_brain`, để cả bốn cùng là hình vẽ.
> Rà chữ tester 10/11 (N5): bốn nhãn cùng dạng câu có chủ ngữ và động từ; trước đây hai nhãn đúng là cụm danh từ, hai nhãn sai là câu, nên phân loại được chỉ bằng dạng câu. Giải thích vẫn khớp.

#### option q3_bite
correct: true
label.en: a mosquito lands on your arm
label.vi: con muỗi đậu trên tay em
image.brief: Dùng lại hình `day-than-kinh-truyen-tin/tray_arm`
image.alt.en: A mosquito on the skin of an arm
image.alt.vi: Con muỗi đậu trên da cánh tay

#### option q3_scratch
correct: false
label.en: your hand scratches
label.vi: tay em gãi
image.brief: Dùng lại hình `day-than-kinh-truyen-tin/explore_from_brain`
image.alt.en: A hand scratching an arm
image.alt.vi: Bàn tay đang gãi cánh tay

#### option q3_rain
correct: true
label.en: cold rain falls on your skin
label.vi: mưa lạnh rơi trên da em
image.brief: [hình vẽ] Những giọt mưa đọng trên da cánh tay người, vẽ cận, nền mờ ngoài trời; không vẽ nét mặt, không có chữ. Từ khoá tìm ảnh (EN): raindrops on arm skin close up
image.alt.en: Raindrops on an arm
image.alt.vi: Giọt mưa trên cánh tay

#### option q3_run
correct: false
label.en: your legs run
label.vi: chân em chạy
image.brief: [hình vẽ] Đôi chân một bạn nhỏ đang chạy trên đường đất hay sân trường, vẽ thấp, chỉ thấy chân và giày; giày không có logo; không vẽ nét mặt, không có chữ. Từ khoá tìm ảnh (EN): child legs running path close up
image.alt.en: Legs running
image.alt.vi: Đôi chân đang chạy

### q4
id: 56f3c1ad-27cb-41ce-b403-3b9bd4099c74
format: single_choice
version: 1
dok: 2
prompt.en: Nam's brain tells his foot to kick. What carries the message?
prompt.vi: Bộ não bảo chân Nam đá quả cầu. Cái gì mang tin đó tới chân?
image.brief: [hình vẽ] Đôi chân một bạn nhỏ đang tâng quả cầu lông gà lên cao trên sân gạch, vẽ thấp, chỉ thấy chân và quả cầu; không vẽ nét mặt, không có logo, không có chữ. Đá cầu là trò quen của trẻ Việt Nam. Từ khoá tìm ảnh (EN): kicking shuttlecock foot jianzi
image.alt.en: A foot kicking a shuttlecock
image.alt.vi: Bàn chân đang đá quả cầu
hint.en: Remember the message path game.
hint.vi: Em nhớ lại trò dựng đường đi của tin nhé.
explanation_correct.en: Yes! Nerves carry the message from his brain to his foot.
explanation_correct.vi: Đúng rồi! Dây thần kinh mang tin từ não xuống chân Nam.
explanation_wrong.en: The answer is the nerve. Nerves carry messages.
explanation_wrong.vi: Đáp án là dây thần kinh. Dây thần kinh mang tin đi.
> DOK 2: áp đường đi của tin theo chiều ngược với phần Chơi (từ não ra chân). Trái tim và dạ dày dùng lại hình vẽ của *Hô hấp* (rà chữ tester 10/11); dây thần kinh là hình gốc mới, cùng nét. Ba nhãn cùng số ít.

#### option q4_heart
correct: false
label.en: heart
label.vi: trái tim
image.brief: Dùng lại hình `tray_heart` ở bài `ho-hap/duong-di-cua-khong-khi`
image.alt.en: A heart
image.alt.vi: Trái tim

#### option q4_stomach
correct: false
label.en: stomach
label.vi: dạ dày
image.brief: Dùng lại hình `tray_stomach` ở bài `ho-hap/duong-di-cua-khong-khi`
image.alt.en: A stomach
image.alt.vi: Dạ dày

#### option q4_nerve
correct: true
label.en: nerve
label.vi: dây thần kinh
image.brief: [hình vẽ] Một dây thần kinh vẽ kiểu tranh minh hoạ y học cho trẻ: một sợi vàng nghệ mảnh, một đầu chia thành nhiều nhánh nhỏ như rễ cây; cùng nét, cùng nền kem trơn, cùng cỡ với bộ não `q2_brain` ở bài `nao-dieu-khien-co-the` và với trái tim, dạ dày của *Hô hấp* mà hai lựa chọn kia dùng lại; không có tia sáng, không có nhãn, không có chữ. Món Chơi `tray_nerves`, từ `nerve`, câu q2 và câu q3 bài `giac-quan-gui-tin-ve-nao` dùng lại hình này.
image.alt.en: A nerve with thin branches
image.alt.vi: Một dây thần kinh có nhiều nhánh mảnh

### q5
id: d312bd3a-c908-46f4-a4be-99751dfe4981
format: single_choice
version: 1
dok: 2
prompt.en: Which message has the longest way to your brain?
prompt.vi: Tin nào phải đi đường xa nhất mới tới não?
image.brief: Dùng lại hình `nao-dieu-khien-co-the/q1`
image.alt.en: A child seen from the side
image.alt.vi: Một bạn nhỏ nhìn nghiêng
hint.en: Find your brain first. Which part is farthest from it?
hint.vi: Em tìm chỗ bộ não trước. Bộ phận nào ở xa não nhất?
explanation_correct.en: Yes! Your toes are the farthest from your brain.
explanation_correct.vi: Đúng rồi! Ngón chân ở xa não nhất.
explanation_wrong.en: The answer is your toe. Your ear is very close.
explanation_wrong.vi: Đáp án là ngón chân. Tai ở rất gần não.
> DOK 2: so sánh khoảng cách trên cơ thể. Câu dẫn vào câu q6: đường xa nhất mà tin vẫn tới rất nhanh.
> Ba lựa chọn là bộ giác quan (tai dùng lại bài một; bàn tay, bàn chân là hình gốc mới, cùng nét).

#### option q5_ear
correct: false
label.en: from your ear
label.vi: từ tai
image.brief: Dùng lại hình `nao-dieu-khien-co-the/w1_ear`
image.alt.en: An ear
image.alt.vi: Một cái tai

#### option q5_toe
correct: true
label.en: from your toe
label.vi: từ ngón chân
image.brief: [hình vẽ] Một bàn chân trần của bạn nhỏ nhìn nghiêng từ phía trên, thấy rõ năm ngón chân, vẽ cận cảnh gần thực tế; cùng nét, cùng nền kem trơn với bộ giác quan của bài một (`w1_eye`, `w1_ear`); không có chữ.
image.alt.en: A foot with toes
image.alt.vi: Một bàn chân có các ngón chân

#### option q5_hand
correct: false
label.en: from your hand
label.vi: từ bàn tay
image.brief: [hình vẽ] Một bàn tay của bạn nhỏ xoè ra, lòng bàn tay hướng về người xem, vẽ cận cảnh gần thực tế; cùng nét, cùng nền kem trơn với bộ giác quan; không có chữ. Ô `explore_five` bài `giac-quan-gui-tin-ve-nao` dùng lại hình này.
image.alt.en: A hand
image.alt.vi: Một bàn tay

### q6
id: d8335474-3c39-4d3c-bc2b-316277c2b4dd
format: true_false
version: 1
dok: 3
misconception: nerve_messages_slow
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: My toe is far from my brain. I still feel it fast.
statement.vi: Ngón chân ở xa não. Nhưng mình vẫn thấy ngay.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: true
image.brief: [ảnh] Mấy bạn nhỏ đi chân trần trên đường, chụp từ phía sau, thấy lưng và đôi bàn chân trần; không thấy mặt, không có vết thương, không có chữ. Ảnh chân trần trên lối sỏi không có ảnh hợp giấy phép (designer 10/11). Từ khoá tìm ảnh (EN): bare feet walking pebble path
image.alt.en: Children walking barefoot
image.alt.vi: Các bạn nhỏ đi chân trần
hint.en: Think of hitting your toe. When does it hurt?
hint.vi: Em nhớ lúc vấp ngón chân. Bao lâu thì em thấy đau?
explanation_correct.en: Yes! Nerve messages are very fast, even from your toes.
explanation_correct.vi: Đúng rồi! Tin trên dây thần kinh rất nhanh, kể cả từ ngón chân.
explanation_wrong.en: Na is right. Nerve messages are very fast.
explanation_wrong.vi: Na nói đúng. Tin trên dây thần kinh đi rất nhanh.
> DOK 3: bé đánh giá lời Na bằng bằng chứng đời thường (vấp chân thấy đau ngay) và điều vừa học (ô "Very fast"). Bé còn tin "xa thì chậm" sẽ thấy vế một đúng nên nghĩ vế hai sai. Đáp án Đúng, theo bảng Đáp án Đúng/Sai ở `_topic.md` (câu sáu cả chủ đề: Sai, Đúng, Sai, Đúng).
> Gợi ý chỉ vào trải nghiệm, không nói Na đúng hay sai.

## Từ vựng

### nerve
id: 870771eb-b4ed-41d0-aa49-69fba0cdef8b
tier: core
term.en: nerve
term.vi: dây thần kinh
example.en: Nerves carry messages around your body.
example.vi: Dây thần kinh mang tin đi khắp cơ thể.
image.brief: Dùng lại hình `day-than-kinh-truyen-tin/q4_nerve`
image.alt.en: A nerve with thin branches
image.alt.vi: Một dây thần kinh có nhiều nhánh mảnh

### message
id: 3ec2de56-27dd-45ba-82f5-4e3c690850ff
tier: core
term.en: message
term.vi: tin
example.en: A message goes from your skin to your brain.
example.vi: Tin đi từ da em về não.
image.brief: Dùng lại hình `day-than-kinh-truyen-tin/q1_messages`
image.alt.en: A letter in an envelope
image.alt.vi: Lá thư trong phong bì

### spinal_cord
id: 7ddd0827-e097-4a47-a95e-b4edfb9c9bda
tier: core
term.en: spinal cord
term.vi: tuỷ sống
example.en: Your spinal cord is inside your backbone.
example.vi: Tuỷ sống nằm bên trong xương sống.
image.brief: Dùng lại hình `day-than-kinh-truyen-tin/tray_spinal`
image.alt.en: The spinal cord inside the backbone
image.alt.vi: Tuỷ sống nằm trong xương sống
> [Nghe thử] giọng EN đọc "spinal cord".

### backbone
id: ce01c036-dfa3-42e0-9ee9-d3e5b676a2f2
tier: extra
term.en: backbone
term.vi: xương sống
example.en: Your backbone keeps your spinal cord safe.
example.vi: Xương sống che chở cho tuỷ sống.
image.brief: Dùng lại hình `day-than-kinh-truyen-tin/q2_back`
image.alt.en: A child, the back shaded yellow
image.alt.vi: Bạn nhỏ, phần lưng tô màu vàng

## Thưởng

### nerves_card
id: 6a71c996-25c8-4022-9a07-5368237f21f0
set: body
rarity: common
name.en: Nerves
name.vi: Dây thần kinh
tag.en: Fast messages
tag.vi: Tin nhanh
fact.en: Some nerve messages go faster than a speeding car.
fact.vi: Có những tin trên dây thần kinh đi nhanh hơn cả ô tô đang chạy rất nhanh.
> [CẦN KIỂM] Tin nhanh nhất đi khoảng một trăm hai mươi mét mỗi giây, tức hơn bốn trăm ki-lô-mét mỗi giờ; ô tô trên đường cao tốc chạy khoảng một trăm ki-lô-mét mỗi giờ (biên tập nhớ, chưa tra nguồn). Thẻ nói "some", "có những tin", vì nhiều tin đi chậm hơn.
image.brief: Dùng lại hình `day-than-kinh-truyen-tin/explore_nerves`
image.alt.en: A child with nerves drawn all over the body
image.alt.vi: Bạn nhỏ có dây thần kinh vẽ khắp cơ thể

## Ghi chú cho hoạ sĩ

- **Loại hình** (Quy ước hình ở `_topic.md`): cảnh và đồ vật là ảnh chụp; dây thần kinh, tuỷ sống, bộ phận cơ thể là hình tự vẽ. Hình không có chữ.
- **Cả kệ Chơi là hình vẽ**, cùng nét với bộ cơ quan và bộ giác quan: da cánh tay có con muỗi, đầu ngón tay, dây điện còn nguyên vỏ, gân xanh ở cổ tay, tuỷ sống, điện thoại ống bơ (sáu hình vẽ mới); dây thần kinh, bộ não (dùng lại). Lý do: món bắt buộc chỉ vẽ được, nên món bẫy cũng vẽ, để bé không chọn theo kiểu hình (tester 10/11 chấp nhận, đề xuất PM ghi thành luật).
- **Hình vẽ gốc ở bài này (mười sáu, theo file chọn ảnh 10/11):** `explore_nerves`, `explore_from_brain`, `explore_fast`, `q2_back`, `q3_rain`, `q3_run`, hình câu q4 (chân đá cầu), `q4_nerve`, `q5_toe`, `q5_hand`, sáu món kệ ở trên.
- **Ảnh chụp (năm):** con muỗi trên tay (`explore_to_brain`); bát cơm, cốc nước, lá thư (câu q1); các bạn nhỏ đi chân trần nhìn từ sau (câu q6).
- **An toàn:** không máu, không vết đỏ do muỗi, không vết thương; không kim tiêm ở hình gân xanh; dây điện không hở lõi. Không thấy mặt người. Ảnh chân đá cầu, chân chạy không thấy logo giày.
- **Các lựa chọn trong một câu cùng kiểu:** w1 ba hình vẽ kệ Chơi bài một; w2 ba hình vẽ đồ vật của *Hô hấp* (quyển truyện, dây nhảy, gối và chăn); q1 ba ảnh đồ vật trên nền trơn; q2 ba bản tô của cùng khuôn người; q3 bốn hình vẽ cận da, tay, chân; q4 ba hình vẽ bộ cơ quan; q5 ba hình vẽ bộ giác quan.
- **Dùng lại trong bài:** `explore_nerves` (câu q1, q3, thẻ thưởng); `tray_arm` (lựa chọn `q3_bite`), `explore_from_brain` (câu q3); `q4_nerve` (món `tray_nerves`, từ `nerve`); `tray_spinal` (từ `spinal_cord`); `q1_messages` (từ `message`); `q2_back` (từ `backbone`).
- **Dùng lại từ bài khác:** bài một `tray_pulse`, `tray_bike`, `tray_book` (w1), `q1`, `q1_chest`, `q1_tummy` (q2, q5), `q2_brain` (món `tray_brain`), `w1_ear` (q5). *Hô hấp*: `vi-sao-ta-phai-tho/q1` (câu w1), `tho-khi-chay-nhay/q1`, `tray_book`, `tray_rope`, `q1_sleeping` (câu w2), `duong-di-cua-khong-khi/tray_heart`, `tray_stomach` (q4). Không còn dùng hình *Khủng long* (w2 cũ đã thay).
- **Màu:** Học: dây thần kinh `cham`, tin về não `vang_hoe`, tin từ não `do_son`, rất nhanh `gi_dong`. Chơi: cảm thấy `vang_hoe`, mang tin `cham`, nhận tin `nau_dat`, nhóm `limit` `do_son`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món. Kệ lệch có chủ ý: nhóm bắt buộc 2-2-1 (nhóm `tray_get` chỉ có bộ não), nhóm `limit` ba món; có bốn cách xếp đạt.
  - Khởi động: `single_choice` (w1 ôn bài một, w2 ôn *Hô hấp* bài ba). w2 giữ `id` cũ nhưng là câu mới (rà chữ 10/11); nếu phiên chính muốn id mới thì xoá dòng `id:` của w2 rồi chạy `ids`.
  - Quiz: `fill_blank_bank` (q1, một ô trống, ba thẻ từ có hình), `single_choice` (q2, q4, q5), `multi_choice` (q3), `true_false` (q6, `speaker: na`, đáp án Đúng). Bốn format.
  - DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Câu có `misconception`: q6, key `nerve_messages_slow`.
- **Vị trí đáp án đúng:** w1 thứ nhất; w2 thứ hai; q2 thứ nhất; q4 thứ ba; q5 thứ hai; q3 thứ nhất và thứ ba; thẻ đúng của q1 thứ ba (rà chữ 10/11, N1).
- **Tham chiếu:** `recall_from.lesson: nao-bo-va-giac-quan/nao-dieu-khien-co-the` (w1) và `ho-hap/tho-khi-chay-nhay` (w2); cả hai đã có id.
- **Màn Chơi, ví dụ để kiểm:**
  - chạm Da trên cánh tay, Dây thần kinh, Bộ não → đạt;
  - chạm Gân xanh ở cổ tay → `has_limited`;
  - chạm Đầu ngón tay, Da trên cánh tay, Tuỷ sống (thiếu chỗ nhận tin) → `missing.tray_get`; chạm Bộ não → `full`; bỏ Da trên cánh tay, đặt Bộ não → đạt.
- **Dòng điều kiện màn Chơi:** "Cần đủ Chỗ cảm thấy, Đường mang tin, Chỗ nhận tin · Không thuộc đường đi này".
- **Số từ EN trên một màn:**
  - Học khoảng ba mươi hai từ: mục tiêu 10, hướng dẫn 3, bốn nhãn 7, câu dài nhất 10, ô Từ mới 5.
  - Nhiều nhất ở Quiz là q3 (khoảng hai mươi chín: câu hỏi 6, hướng dẫn 5, bốn nhãn 18 sau rà chữ N5). Giải thích sai đã rút còn "The answers are the mosquito and the cold rain." (chín từ) để màn không dài thêm.
- **Từ EN có thể ngoài Starters/Movers:** nerve, message, spinal cord, backbone, bundle, mosquito, scratch, itch, shoo, blink, ruler, shuttlecock, tin-can, wire, wrist, carry, path.
- **Giọng đọc:** EN nghe thử "spinal cord", "shuttlecock", "tin-can phone". VI không có từ mượn.
