---
id: 17a5e04d-f2d7-4c66-a627-91db2d3cdd44
topic: nao-bo-va-giac-quan
slug: giac-quan-gui-tin-ve-nao
order: 3
stage: apply
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Senses send messages to the brain
vi: Giác quan gửi tin về não
> Giữ đúng tên ở `syllabus-lessons.md` và `content/syllabus.json` (`new-brain`, bài số ba).

## Mục tiêu
en: I can tell how senses send messages to my brain.
vi: Em kể được các giác quan gửi tin về não ra sao.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-037, ngày 10/11/2026. Đã chạy `ids`. Sửa theo rà chữ tester 10/11 (ticket SK-037, mục "content-editor 10/11 · sửa theo tester").
> Bài `apply` (áp chót): áp đường đi của tin (bài hai) vào năm giác quan bé đã biết. Sửa `taste_only_tongue` ở ô "Nose and taste" và câu q6 (gắn key). `senses_know_alone` sửa ở ý chính hai, ba, ô "To the brain", "Put together", câu q3, q5; không gắn key.
> 14/11 (SK-044, ngân sách chữ Discoverer A2): thêm `feedback` cho mọi lựa chọn sai và `feedback_true/false`; hai lời giải thích còn một câu, bỏ "Yes!" · "Đúng rồi!" và "The answer is…" · "Đáp án là…"; câu hỏi tối đa mười chữ VI, lời Na một câu tối đa mười hai chữ. Nháp AI.

## Ý chính
1.en: Your eyes, ears, nose, tongue and skin sense things.
1.vi: Mắt, tai, mũi, lưỡi và da giúp em cảm nhận mọi thứ quanh mình.
2.en: Each sense sends messages to your brain along nerves.
2.vi: Mỗi giác quan gửi tin về não theo dây thần kinh.
3.en: Your brain joins the messages and works it out.
3.vi: Bộ não ghép các tin lại và nhận ra đó là gì.
> Ba ý đi từ cụ thể tới trừu tượng: năm bộ phận bé chỉ được trên người, đường tin đi (đã học ở bài hai), rồi bộ não ghép nhiều tin thành một điều em biết.
> [CẦN KIỂM] Ý chính một nói gọn "năm giác quan" là mắt, tai, mũi, lưỡi, da, như sách lớp một; xem ghi chú ở câu w2 bài một.

## Khởi động

> Hai câu. w1 ôn bài một (khoảng hai ngày trước), w2 ôn bài hai (khoảng một ngày trước). w2 hỏi lại món bẫy gân xanh của phần Chơi bài hai (`veins_are_nerves`, không gắn key).

### w1
id: 9cba3a0e-cabd-4df8-8b3e-9b85c7d1cd7d
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: nao-bo-va-giac-quan/nao-dieu-khien-co-the
prompt.en: What tells your legs to kick a ball?
prompt.vi: Cái gì bảo chân em đá quả bóng?
image.brief: Dùng lại hình `nao-dieu-khien-co-the/explore_move`
image.alt.en: Legs kicking a ball
image.alt.vi: Đôi chân đang đá bóng
hint.en: Remember the Move picture in the first lesson.
hint.vi: Em nhớ lại ô Cử động ở bài đầu tiên nhé.
explanation_correct.en: Your brain sends the kick message down your nerves.
explanation_correct.vi: Bộ não gửi tin xuống chân theo dây thần kinh.
explanation_wrong.en: Your brain tells your legs how to move.
explanation_wrong.vi: Bộ não bảo đôi chân em cử động.
> Ba lựa chọn là bộ cơ quan (bộ não của bài một; trái tim, dạ dày của *Hô hấp*, rà chữ tester 10/11), cùng hình vẽ, cùng số ít.

#### option w1_heart
correct: false
feedback.en: The heart pumps blood, not messages.
feedback.vi: Tim bơm máu, không mang tin.
label.en: heart
label.vi: trái tim
image.brief: Dùng lại hình `tray_heart` ở bài `ho-hap/duong-di-cua-khong-khi`
image.alt.en: A heart
image.alt.vi: Trái tim

#### option w1_brain
correct: true
label.en: brain
label.vi: bộ não
image.brief: Dùng lại hình `nao-dieu-khien-co-the/q2_brain`
image.alt.en: A brain
image.alt.vi: Bộ não

#### option w1_stomach
correct: false
feedback.en: The stomach breaks down food.
feedback.vi: Dạ dày lo tiêu hoá thức ăn.
label.en: stomach
label.vi: dạ dày
image.brief: Dùng lại hình `tray_stomach` ở bài `ho-hap/duong-di-cua-khong-khi`
image.alt.en: A stomach
image.alt.vi: Dạ dày

### w2
id: 43ff0d3b-f0d1-4883-969a-b10c55eb75b9
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: nao-bo-va-giac-quan/day-than-kinh-truyen-tin
prompt.en: The blue lines on your wrist are nerves.
prompt.vi: Gân xanh ở cổ tay là dây thần kinh.
image.brief: Dùng lại hình `day-than-kinh-truyen-tin/tray_veins`
image.alt.en: Blue lines under the skin of a wrist
image.alt.vi: Những đường gân xanh dưới da cổ tay
answer: false
hint.en: Remember the message path game.
hint.vi: Em nhớ lại trò dựng đường đi của tin nhé.
explanation_correct.en: Those blue lines are veins that carry blood.
explanation_correct.vi: Gân xanh là mạch máu, chở máu đi khắp người.
explanation_wrong.en: Nerves are thin and hidden deep inside you.
explanation_wrong.vi: Dây thần kinh rất mảnh, nằm khuất bên trong.
feedback_true.en: Blood flows through those blue lines.
feedback_true.vi: Trong những đường gân xanh ấy là máu.
> Đáp án Sai, theo bảng Đáp án Đúng/Sai ở `_topic.md`. Giải thích khi đúng không mở đầu bằng "Yes!". [CẦN KIỂM] như ghi chú ở `veins_are_nerves`.
> Hình câu hỏi là chính vật được hỏi (gân xanh), không cho thấy đó là mạch máu hay dây thần kinh.

## Học

> Bốn ô, theo bảng kế hoạch: năm giác quan (ý chính một), gửi tin về não (ý chính hai, tiếng trống trường), ghép tin lại (ý chính ba, quả xoài chín), mũi giúp nếm (vận dụng ý chính ba, bát phở lúc bị cảm).
> Hình ô Học không có chữ. Mũi chỉ nói ở vai trò ngửi và nếm; mũi là đường thở thì để *Hô hấp*.

### explore
id: b7e25e38-274a-4b71-b4f5-451c9a7de1cb
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_five
label.en: Five senses
label.vi: Năm giác quan
color: vang_hoe
sentence.en: You see, hear, smell, taste and touch.
sentence.vi: Em nhìn, nghe, ngửi, nếm và chạm.
image.brief: [sơ đồ ghép ảnh] Năm hình vẽ của bộ giác quan xếp thành hai hàng (ba trên, hai dưới) trong ảnh vuông, nền kem trơn, cách đều nhau, cùng cỡ: dùng lại hình `nao-dieu-khien-co-the/w1_eye`, `nao-dieu-khien-co-the/w1_ear`, `tray_nose` ở bài `ho-hap/duong-di-cua-khong-khi`, `giac-quan-gui-tin-ve-nao/q1_tongue`, `day-than-kinh-truyen-tin/q5_hand`; không có nhãn, không có mũi tên, không có chữ. Từ `sense` dùng lại hình này.
> Rà chữ tester 10/11 (chéo với *Hô hấp*): phần mũi trỏ thẳng về hình mũi của *Hô hấp*, vì lựa chọn `w1_nose` bài một nay dùng lại hình đó.
image.alt.en: An eye, an ear, a nose, a tongue and a hand
image.alt.vi: Mắt, tai, mũi, lưỡi và bàn tay
examples.1.en: eyes see
examples.1.vi: mắt để nhìn
examples.2.en: ears hear
examples.2.vi: tai để nghe
examples.3.en: nose smells, tongue tastes
examples.3.vi: mũi để ngửi, lưỡi để nếm
examples.4.en: skin feels
examples.4.vi: da để cảm nhận
> Bàn tay đứng cho làn da, vì da khó vẽ thành một vật riêng. Ví dụ bốn nói "da", để bé không nghĩ chỉ có bàn tay mới cảm nhận.

#### group explore_send
label.en: To the brain
label.vi: Gửi về não
color: cham
sentence.en: Each sense sends messages to your brain along nerves.
sentence.vi: Mỗi giác quan gửi tin về não theo dây thần kinh.
image.brief: [hình vẽ] Chiếc trống trường Việt Nam bằng gỗ sơn đỏ, mặt da, đặt trên giá gỗ, vẽ chéo; có dùi trống; không có người, không có chữ, không có câu khẩu hiệu hay băng rôn. Câu q2 bài này và câu q5 bài bốn dùng lại hình này. Từ khoá tìm ảnh (EN): Vietnamese school drum wooden stand
image.alt.en: A school drum
image.alt.vi: Chiếc trống trường
examples.1.en: the school drum goes boom
examples.1.vi: tiếng trống trường vang lên
examples.2.en: your ears pick it up
examples.2.vi: tai em nghe thấy
examples.3.en: nerves carry the message
examples.3.vi: dây thần kinh mang tin đi
examples.4.en: your brain knows: time for class!
examples.4.vi: bộ não biết: tới giờ vào lớp rồi!
> Bốn món ví dụ đi đúng đường của bài hai: giác quan, dây thần kinh, bộ não. Ví dụ bốn nói "bộ não biết", sửa `senses_know_alone`: tai nghe thấy tiếng, bộ não mới hiểu đó là giờ vào lớp.

#### group explore_join
label.en: Put together
label.vi: Ghép lại
color: gi_dong
sentence.en: Your brain joins the messages and works it out.
sentence.vi: Bộ não ghép các tin lại và nhận ra đó là gì.
image.brief: [ảnh] Một quả xoài chín vàng, nguyên quả, đặt trên nền trơn sáng, chụp chéo; vỏ vàng đều, không có tem, không có chữ. Từ khoá tìm ảnh (EN): ripe yellow mango whole plain background
image.alt.en: A ripe yellow mango
image.alt.vi: Quả xoài chín vàng
examples.1.en: eyes: yellow and round
examples.1.vi: mắt: màu vàng, tròn
examples.2.en: nose: a sweet smell
examples.2.vi: mũi: mùi thơm ngọt
examples.3.en: hands: a little soft
examples.3.vi: tay: hơi mềm
examples.4.en: brain: a ripe mango!
examples.4.vi: bộ não: quả xoài chín!
> Xoài cát là quả quen ở Việt Nam. [Nghe thử] giọng EN đọc dấu hai chấm như một chỗ ngắt; giọng VI đọc "mắt, màu vàng, tròn" cho xuôi.

#### group explore_taste
label.en: Nose and taste
label.vi: Mũi giúp nếm
color: do_son
sentence.en: Your nose helps you taste your food.
sentence.vi: Mũi giúp em nếm được vị của đồ ăn.
image.brief: [ảnh] Một bát phở bò nóng bốc khói đặt trên bàn gỗ, chụp chéo từ trên xuống, thấy bánh phở, thịt, hành lá; không có người, không có đũa, thìa có chữ, không có biển quán hay nhãn hiệu. Câu q6 và từ `taste` dùng lại ảnh này. Từ khoá tìm ảnh (EN): pho bowl steaming Vietnamese noodle soup
image.alt.en: A hot bowl of pho
image.alt.vi: Bát phở nóng
examples.1.en: the smell goes up to your nose
examples.1.vi: mùi thơm bay lên mũi
examples.2.en: when you have a cold, your nose gets blocked
examples.2.vi: khi bị cảm, mũi có thể bị nghẹt
examples.3.en: then pho tastes plain
examples.3.vi: lúc đó phở kém ngon hơn
> [CẦN KIỂM] như ghi chú ở `taste_only_tongue` trong `_topic.md`.
> Rà chữ tester 10/11: chuỗi `.en` viết "pho" không dấu, giữ "phở" ở chuỗi `.vi` (N9, main session chốt), như tiền lệ "Ha Long Bay". Ví dụ hai đổi để "a cold" không bị hiểu là "lạnh" (n9).

### new_words
id: 06964ee9-a9ef-4e52-b60e-dd8c87df3506
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: sense, smell, taste

## Chơi

> Mai nhắm mắt ngồi ở nhà bà. Bé tìm cho mỗi giác quan còn dùng được một tin: một tiếng động cho tai (gà gáy hoặc mưa trên mái nhà), một mùi cho mũi (hoa nhài hoặc ngô nướng), một điều chạm cho da (lông mèo con hoặc nước mát trên tay). Không được chọn thứ phải mở mắt mới thấy.
> - Bẫy là cầu vồng và cánh bướm: đẹp, có ở làng quê, nhưng chỉ mắt mới nhận ra màu. Lời nhắn `has_limited` nói lý do.
> - Trò chơi dạy ý chính hai: mỗi giác quan gửi tin riêng; mắt nhắm thì các giác quan khác vẫn gửi tin về não.
> - Cả kệ là ảnh chụp (Quy ước hình, mục hai). Lời nhắn không gọi tên vật chứa. Nhãn món nói rõ tin là tiếng, mùi hay điều chạm, vì ảnh chỉ cho thấy nguồn của tin.

### tray
id: 9a113c6e-6de9-467a-ae92-d3398690a986
type: build_tray
version: 1
prompt.en: Eyes closed! Find three messages
prompt.vi: Nhắm mắt lại! Tìm ba tin
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Mai closes her eyes at Grandma's. Find one for each sense.
messages.start.vi: Mai nhắm mắt ngồi ở nhà bà. Em tìm cho mỗi giác quan một tin nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Her ears, nose and skin still send messages.
messages.balanced.vi: Tuyệt! Tai, mũi và da của Mai vẫn gửi tin về não.
messages.has_limited.en: Mai's eyes are closed. She cannot see that.
messages.has_limited.vi: Mai đang nhắm mắt. Bạn ấy không nhìn thấy cái đó.
messages.missing.tray_ears.en: You still need a message for the ears.
messages.missing.tray_ears.vi: Em còn thiếu một tin cho tai.
messages.missing.tray_nose.en: You still need a message for the nose.
messages.missing.tray_nose.vi: Em còn thiếu một tin cho mũi.
messages.missing.tray_skin.en: You still need a message for the skin.
messages.missing.tray_skin.vi: Em còn thiếu một tin cho da.

#### group tray_ears
label.en: Ears
label.vi: Tai
color: cham
role: required

#### group tray_nose
label.en: Nose
label.vi: Mũi
color: vang_hoe
role: required

#### group tray_skin
label.en: Skin
label.vi: Da
color: gi_dong
role: required

#### group tray_eyes_only
label.en: Not with eyes closed
label.vi: Không nhận ra khi nhắm mắt
color: do_son
role: limit
> Nhãn `limit` dạng "Not …" · "Không …", gọi tên loại, không gọi tên món bẫy (`_topic.md`, mục "Khi soạn bốn bài").

#### item tray_rooster
label.en: Rooster crowing
label.vi: Tiếng gà gáy
group: tray_ears
image.brief: Dùng lại hình `nao-dieu-khien-co-the/w1`
image.alt.en: A rooster crowing
image.alt.vi: Con gà trống đang gáy

#### item tray_rainbow
label.en: Rainbow colours
label.vi: Màu cầu vồng
group: tray_eyes_only
image.brief: [ảnh] Cầu vồng hiện trên cánh đồng xanh sau cơn mưa, chụp rộng; không có người, không có nhà có biển chữ, không có chữ. Ảnh designer chọn 10/11 là ruộng khoai môn, gần cảnh ruộng lúa nhất trong ảnh hợp giấy phép. Từ khoá tìm ảnh (EN): rainbow over green rice field
image.alt.en: A rainbow over green fields
image.alt.vi: Cầu vồng trên cánh đồng xanh

#### item tray_jasmine
label.en: Jasmine smell
label.vi: Mùi hoa nhài
group: tray_nose
image.brief: Dùng lại hình `nao-dieu-khien-co-the/w2`
image.alt.en: White jasmine flowers
image.alt.vi: Những bông hoa nhài trắng

#### item tray_kitten
label.en: Soft kitten fur
label.vi: Lông mèo con mềm
group: tray_skin
image.brief: [ảnh] Một chú mèo con lông xù nằm cuộn tròn, chụp gần thấy rõ bộ lông mềm, nền trơn hoặc tấm chăn; không có người, không có vòng cổ có chữ. Từ khoá tìm ảnh (EN): fluffy kitten curled up plain background
image.alt.en: A fluffy kitten
image.alt.vi: Chú mèo con lông xù

#### item tray_rain_roof
label.en: Rain on the roof
label.vi: Tiếng mưa trên mái nhà
group: tray_ears
image.brief: [ảnh] Mưa to rơi trên mái nhà, chụp gần thấy những hạt nước bắn lên; không có người, không có chữ. Ưu tiên mái tôn (kiểu mái quen ở Việt Nam) nếu sau này có ảnh hợp giấy phép; lượt chọn 10/11 không có. Câu w1 bài `ngu-du-giac-va-doi-mu-bao-hiem` dùng lại ảnh này. Từ khoá tìm ảnh (EN): rain on corrugated metal roof close up
image.alt.en: Rain on a roof
image.alt.vi: Mưa rơi trên mái nhà
> Theo hình designer 10/11: ảnh là mái nhà chung, không phải mái tôn lượn sóng, nên nhãn đổi "tin roof" · "mái tôn" thành "roof" · "mái nhà" cho khớp hình.

#### item tray_corn
label.en: Grilled corn smell
label.vi: Mùi ngô nướng
group: tray_nose
image.brief: [ảnh] Mấy bắp ngô đang nướng trên bếp than hồng, khói mỏng bốc lên, chụp gần; không thấy mặt người bán, không có biển quán, không có chữ. Từ khoá tìm ảnh (EN): grilled corn on charcoal street food
image.alt.en: Corn grilling on charcoal
image.alt.vi: Ngô đang nướng trên bếp than

#### item tray_butterfly
label.en: Butterfly colours
label.vi: Màu cánh bướm
group: tray_eyes_only
image.brief: [ảnh] Một con bướm cánh nhiều màu đậu trên bông hoa, chụp gần, cánh xoè rõ; không có người, không có chữ. Từ khoá tìm ảnh (EN): colorful butterfly on flower open wings
image.alt.en: A colourful butterfly on a flower
image.alt.vi: Con bướm nhiều màu trên bông hoa

#### item tray_water
label.en: Cool water on hands
label.vi: Nước mát trên tay
group: tray_skin
image.brief: [ảnh] Đôi bàn tay hứng dòng nước chảy từ vòi hoặc từ gáo nước, chụp gần, chỉ thấy tay và nước; vòi không có nhãn hiệu, không thấy mặt, không có chữ. Từ khoá tìm ảnh (EN): hands under running water close up
image.alt.en: Hands under running water
image.alt.vi: Đôi tay hứng dòng nước

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Bốn format: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, thẻ từ có hình.

### q1
id: 7ab8ea69-21ae-4d31-9c22-accdfad55516
format: single_choice
version: 1
dok: 1
prompt.en: Which one sends taste messages to your brain?
prompt.vi: Bộ phận nào gửi tin về vị lên não?
image.brief: [ảnh] Nửa quả chanh xanh cắt đôi, thấy rõ múi bên trong, đặt trên thớt gỗ, chụp gần; không có người, không có chữ. Ảnh là thứ để nếm, không phải bộ phận nếm, nên không lộ đáp án. Từ khoá tìm ảnh (EN): lime cut in half wooden board
image.alt.en: A lime cut in half
image.alt.vi: Quả chanh cắt đôi
hint.en: Think of eating a sour lime.
hint.vi: Em nghĩ tới lúc ăn một miếng chanh chua nhé.
explanation_correct.en: Your tongue sends taste messages, like sour or sweet.
explanation_correct.vi: Lưỡi gửi tin về vị, như chua hay ngọt.
explanation_wrong.en: Your tongue tastes sour lime and sweet mango.
explanation_wrong.vi: Lưỡi nếm vị chua của chanh, vị ngọt của xoài.
> Ba lựa chọn là bộ giác quan: tai, mắt dùng lại bài một; lưỡi là hình gốc mới, cùng nét. Không có mũi trong câu này, để câu chỉ có một đáp án (mũi cũng giúp nếm, ý của câu q6).

#### option q1_tongue
correct: true
label.en: tongue
label.vi: lưỡi
image.brief: [hình vẽ] Cái lưỡi hồng của bạn nhỏ thè ra giữa hai môi, vẽ cận cảnh gần thực tế, chỉ thấy môi, lưỡi và cằm; không thấy mắt, không thấy cả khuôn mặt; lưỡi một màu hồng, không chia vùng, không vẽ "bản đồ lưỡi"; nền kem trơn, cùng nét với bộ giác quan; không có chữ. Ô `explore_five`, câu q3, từ `tongue`, thẻ thưởng và câu w1 bài `ngu-du-giac-va-doi-mu-bao-hiem` dùng lại hình này.
image.alt.en: A tongue
image.alt.vi: Cái lưỡi

#### option q1_ear
correct: false
feedback.en: Your ears hear sounds, like a rooster.
feedback.vi: Tai giúp em nghe, như tiếng gà gáy.
label.en: ear
label.vi: tai
image.brief: Dùng lại hình `nao-dieu-khien-co-the/w1_ear`
image.alt.en: An ear
image.alt.vi: Một cái tai

#### option q1_eye
correct: false
feedback.en: Your eyes see colours and shapes.
feedback.vi: Mắt giúp em nhìn màu sắc, hình dạng.
label.en: eye
label.vi: mắt
image.brief: Dùng lại hình `nao-dieu-khien-co-the/w1_eye`
image.alt.en: An eye
image.alt.vi: Một con mắt

### q2
id: 620c9ccf-a5da-4ce4-a11a-7adbb6304ca1
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `giac-quan-gui-tin-ve-nao/explore_send`
image.alt.en: A school drum
image.alt.vi: Chiếc trống trường
sentence.en: Your senses send messages along {1} to your brain.
sentence.vi: Các giác quan gửi tin theo {1} về não.
answers: q2_nerves
hint.en: Remember the message path game in the last lesson.
hint.vi: Em nhớ lại trò dựng đường đi của tin ở bài trước nhé.
explanation_correct.en: Nerves carry messages from all five senses.
explanation_correct.vi: Dây thần kinh mang tin của cả năm giác quan.
explanation_wrong.en: Messages travel along nerves to your brain.
explanation_wrong.vi: Tin đi theo dây thần kinh về não.
> Nối bài hai với bài ba. Ba thẻ từ dùng lại hình vẽ của bài hai (kệ Chơi và câu q4), cùng nét. Hai thẻ sai là hai món bẫy của phần Chơi bài hai, nên có sức hút; cả ba cùng số nhiều, đọc xuôi trong câu.

#### bank q2_veins
label.en: veins
label.vi: mạch máu
feedback.en: Veins carry blood around your body.
feedback.vi: Mạch máu chở máu đi khắp người.
image.brief: Dùng lại hình `day-than-kinh-truyen-tin/tray_veins`
image.alt.en: Blue lines under the skin of a wrist
image.alt.vi: Những đường gân xanh dưới da cổ tay

#### bank q2_nerves
label.en: nerves
label.vi: dây thần kinh
image.brief: Dùng lại hình `day-than-kinh-truyen-tin/q4_nerve`
image.alt.en: A nerve with thin branches
image.alt.vi: Một dây thần kinh có nhiều nhánh mảnh

#### bank q2_wires
label.en: wires
label.vi: dây điện
feedback.en: Wires carry electricity in a house, not a body.
feedback.vi: Dây điện dẫn điện trong nhà, không ở trong người.
image.brief: Dùng lại hình `day-than-kinh-truyen-tin/tray_wire`
image.alt.en: A piece of electric wire
image.alt.vi: Một đoạn dây điện

### q3
id: c39f8741-8d71-471a-a65b-a51b7759729d
format: multi_choice
version: 1
dok: 2
prompt.en: What helps Mai's red-light message reach her brain?
prompt.vi: Bộ phận nào giúp tin đèn đỏ về tới não?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: [ảnh] Một cột đèn giao thông đang sáng đèn đỏ, chụp gần, nền trời; không có số đếm ngược, không có biển chữ, không có người, không thấy biển số xe. Từ khoá tìm ảnh (EN): traffic light red close up sky
image.alt.en: A red traffic light
image.alt.vi: Đèn giao thông màu đỏ
hint.en: Where does the message start, and how does it travel?
hint.vi: Tin bắt đầu từ đâu, và đi bằng đường nào?
explanation_correct.en: Then her brain tells her to stop and wait.
explanation_correct.vi: Rồi bộ não bảo Mai dừng lại chờ.
explanation_wrong.en: Her eyes see the light, and nerves carry the message.
explanation_wrong.vi: Mắt thấy đèn, dây thần kinh mang tin về não.
> DOK 2: áp đường đi của tin vào tình huống mới (đèn giao thông, nối sang bài bốn). Câu sửa `senses_know_alone`, không gắn key: mắt nhìn thấy, nhưng phải có dây thần kinh mang tin thì bộ não mới biết "dừng lại". Bốn hình vẽ cùng nét: hai hình bộ giác quan (lưỡi, mắt), một dây thần kinh, gân xanh ở cổ tay.
> Rà chữ tester 10/11 (n7): lựa chọn sai "toe" · "ngón chân" quá yếu, đổi thành "veins" · "mạch máu" (hình gân xanh của bài hai): bẫy thật, nối `veins_are_nerves` và câu w2 của bài. Bé còn nghĩ gân xanh là dây thần kinh sẽ chọn cả "mạch máu".

#### option q3_tongue
correct: false
feedback.en: Your tongue tastes food, not light.
feedback.vi: Lưỡi để nếm đồ ăn, không nhìn được.
label.en: tongue
label.vi: lưỡi
image.brief: Dùng lại hình `giac-quan-gui-tin-ve-nao/q1_tongue`
image.alt.en: A tongue
image.alt.vi: Cái lưỡi

#### option q3_eye
correct: true
label.en: eye
label.vi: mắt
image.brief: Dùng lại hình `nao-dieu-khien-co-the/w1_eye`
image.alt.en: An eye
image.alt.vi: Một con mắt

#### option q3_nerve
correct: true
label.en: nerve
label.vi: dây thần kinh
image.brief: Dùng lại hình `day-than-kinh-truyen-tin/q4_nerve`
image.alt.en: A nerve with thin branches
image.alt.vi: Một dây thần kinh có nhiều nhánh mảnh

#### option q3_veins
correct: false
feedback.en: Veins carry blood, not messages.
feedback.vi: Mạch máu chở máu, không mang tin.
label.en: veins
label.vi: mạch máu
image.brief: Dùng lại hình `day-than-kinh-truyen-tin/tray_veins`
image.alt.en: Blue lines under the skin of a wrist
image.alt.vi: Những đường gân xanh dưới da cổ tay

### q4
id: 76609464-58db-40e1-910e-cbfd6b43ee89
format: single_choice
version: 1
dok: 2
prompt.en: What soft, furry thing is Lan touching?
prompt.vi: Lan đang sờ thấy thứ gì mềm và có lông?
image.brief: [hình vẽ] Một bạn nhỏ bị bịt mắt bằng chiếc khăn vải đỏ (trò bịt mắt đoán đồ), vẽ từ phía sau lưng, thấy nút khăn buộc sau đầu và hai tay đưa ra phía trước; không vẽ nét mặt, không có chữ, không có logo. Từ khoá tìm ảnh (EN): child blindfolded game from behind
image.alt.en: A child with a blindfold, seen from behind
image.alt.vi: Bạn nhỏ bịt mắt, nhìn từ phía sau
> Rà chữ tester 10/11 (n8): hình câu hỏi cũ (tay thò vào túi vải) lệch với câu "Lan nhắm mắt". Giữ câu hỏi, đổi hình sang trò bịt mắt. Không đổi câu sang trò túi như tester gợi ý, vì một chú mèo con trong túi là cảnh lạ, không nên gợi cho trẻ.
hint.en: Think of holding each one in your hands.
hint.vi: Em tưởng tượng cầm từng thứ trong tay nhé.
explanation_correct.en: Her skin felt soft fur, and her brain knew it.
explanation_correct.vi: Da Lan thấy lông mềm, và bộ não nhận ra ngay.
explanation_wrong.en: Only the kitten is both soft and furry.
explanation_wrong.vi: Chỉ mèo con vừa mềm vừa có lông.
> 14/11 (ngân sách A2): câu hỏi cũ ba câu, mười lăm từ EN, mười tám chữ VI; nay một câu bảy từ EN, mười chữ VI. Ý "Lan nhắm mắt" nằm ở hình (Lan bịt mắt, nhìn từ phía sau).
> DOK 2: bé ghép hai tin của da (mềm, có lông) để loại cái gối (chỉ mềm) và hòn đá (cứng). Câu hỏi dùng "most likely" · "dễ là gì nhất" (luật của *Khủng long*). Ba hình vẽ riêng cho câu này, cùng kiểu: một vật nguyên cái, cùng cỡ, nền trơn (theo hình designer 10/11: không có ảnh hòn cuội nền trơn hợp giấy phép, nên vẽ cả ba; ảnh gối của câu q5 bài một và ảnh mèo của kệ Chơi giữ ở chỗ gốc).

#### option q4_pillow
correct: false
feedback.en: A pillow is soft, but it has no fur.
feedback.vi: Gối mềm, nhưng không có lông.
label.en: pillow
label.vi: cái gối
image.brief: [hình vẽ] Một cái gối trắng đặt trên nền trơn, vẽ chéo, cả cái gối trong khung; không có hoa văn chữ; cùng nét, cùng cỡ với hai lựa chọn kia. Từ khoá tìm ảnh (EN): white pillow plain background
image.alt.en: A pillow
image.alt.vi: Cái gối

#### option q4_kitten
correct: true
label.en: kitten
label.vi: mèo con
image.brief: [hình vẽ] Chú mèo con lông xám nằm cuộn tròn, vẽ cả con trên nền trơn; không có vòng cổ có chữ; cùng nét, cùng cỡ với hai lựa chọn kia. Từ khoá tìm ảnh (EN): fluffy kitten curled up plain background
image.alt.en: A kitten curled up
image.alt.vi: Chú mèo con nằm cuộn tròn
> Rà chữ tester 10/11 (n8): `alt` không nhắc lại chữ "mềm, có lông" của câu hỏi.

#### option q4_stone
correct: false
feedback.en: A stone feels hard and smooth.
feedback.vi: Hòn đá sờ vào thấy cứng và nhẵn.
label.en: stone
label.vi: hòn đá cuội
image.brief: [hình vẽ] Một hòn đá cuội nhẵn màu xám đặt trên nền trơn, vẽ chéo, cùng cỡ trong khung với cái gối và mèo con; không có chữ. Từ khoá tìm ảnh (EN): smooth river stone plain background
image.alt.en: A smooth stone
image.alt.vi: Hòn đá cuội nhẵn

### q5
id: e0508aea-1234-403a-a920-727539b26bc4
format: single_choice
version: 1
dok: 2
prompt.en: Which fruit is red, a little soft and sweet-smelling?
prompt.vi: Quả nào màu đỏ, hơi mềm, mùi thơm ngọt?
image.brief: [ảnh] Một sạp hoa quả ở chợ Việt Nam nhìn từ xa, nhiều loại quả xếp trong rổ, nhìn không rõ quả nào; không có người hoặc người ở rất xa không nhận ra mặt, không có biển giá, không có chữ. Từ khoá tìm ảnh (EN): Vietnam market fruit stall baskets
image.alt.en: A fruit stall at a market
image.alt.vi: Sạp hoa quả ở chợ
hint.en: Put all three messages together.
hint.vi: Em ghép cả ba tin lại với nhau nhé.
explanation_correct.en: Your brain joined three messages to find the strawberry.
explanation_correct.vi: Bộ não ghép ba tin lại để nhận ra dâu tây.
explanation_wrong.en: Only the strawberry is red, soft and sweet.
explanation_wrong.vi: Chỉ dâu tây vừa đỏ, vừa mềm, vừa thơm ngọt.
> DOK 2: ghép ba tin của ba giác quan (ý chính ba, ô "Put together") cho một quả chưa gặp ở phần Học. Mỗi lựa chọn sai khớp hai trong ba tin nhưng trật một tin: táo đỏ, thơm nhưng cứng; chuối chín mềm, thơm nhưng màu vàng. Ba hình vẽ mới (theo hình designer 10/11), cùng kiểu: một quả nguyên, nền trơn, vẽ chéo, cùng cỡ.
> Rà chữ tester 10/11 (N2, N8): câu cũ hỏi lại đúng ba dấu hiệu của quả xoài ở ô `explore_join`, và đáp án đúng dùng lại đúng ảnh của ô đó, nên thực chất là nhớ lại một ô. Đổi sang dâu tây (quen với trẻ Việt Nam qua dâu tây Đà Lạt); ô Học giữ quả xoài. Đổi key ba lựa chọn.

#### option q5_apple
correct: false
feedback.en: An apple is red, but it feels hard.
feedback.vi: Táo màu đỏ, nhưng sờ vào thấy cứng.
label.en: red apple
label.vi: táo đỏ
image.brief: [hình vẽ] Một quả táo đỏ nguyên quả, đặt trên nền trơn sáng, vẽ chéo, cùng cỡ với hai quả kia; không có tem, không có chữ. Từ khoá tìm ảnh (EN): red apple whole plain background
image.alt.en: A red apple
image.alt.vi: Quả táo đỏ

#### option q5_banana
correct: false
feedback.en: A ripe banana is soft, but it is yellow.
feedback.vi: Chuối chín mềm, nhưng có màu vàng.
label.en: ripe banana
label.vi: chuối chín
image.brief: [hình vẽ] Một quả chuối chín vàng (một quả, không phải cả nải), đặt trên nền trơn sáng, vẽ chéo, cùng cỡ với hai quả kia; không có tem, không có chữ. Từ khoá tìm ảnh (EN): single ripe banana plain background
image.alt.en: A ripe banana
image.alt.vi: Quả chuối chín

#### option q5_strawberry
correct: true
label.en: ripe strawberry
label.vi: dâu tây chín
image.brief: [hình vẽ] Một quả dâu tây chín đỏ, còn cuống lá xanh, đặt trên nền trơn sáng, vẽ chéo, cùng cỡ trong khung với hai quả kia (vẽ to hơn vì quả nhỏ); không có hộp, không có tem, không có chữ. Từ khoá tìm ảnh (EN): ripe strawberry single plain background
image.alt.en: A strawberry
image.alt.vi: Quả dâu tây
> `alt` của đáp án không có chữ "red", "ripe" của câu hỏi và nhãn, để phụ đề và VoiceOver không lộ.

### q6
id: 65118b8b-4b17-43fc-b190-756119b49428
format: true_false
version: 1
dok: 3
misconception: taste_only_tongue
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: My nose is blocked, but my pho tastes the same.
statement.vi: Mũi mình bị nghẹt, nhưng phở vẫn ngon như mọi khi.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: false
image.brief: Dùng lại hình `giac-quan-gui-tin-ve-nao/explore_taste`
image.alt.en: A hot bowl of pho
image.alt.vi: Bát phở nóng
hint.en: Remember eating when you had a cold.
hint.vi: Em nhớ lại lúc bị cảm, em ăn có thấy ngon không?
explanation_correct.en: Smells from food reach your nose and help you taste.
explanation_correct.vi: Mùi đồ ăn bay lên mũi, giúp em nếm ngon hơn.
explanation_wrong.en: Food tastes plain when your nose is blocked.
explanation_wrong.vi: Khi mũi bị nghẹt, đồ ăn kém ngon hơn.
feedback_true.en: A blocked nose cannot smell the pho well.
feedback_true.vi: Mũi bị nghẹt thì không ngửi rõ mùi phở.
> DOK 3: bé đánh giá lời Na bằng trải nghiệm (lúc bị cảm) và ô "Nose and taste". Đáp án Sai, theo bảng Đáp án Đúng/Sai ở `_topic.md`. Giải thích khi đúng không mở đầu bằng "Yes!".
> Bé có thể tự kiểm ở nhà: bịt mũi, ăn một miếng táo, rồi bỏ tay ra (mục Thí nghiệm ở nhà, `_topic.md`).

## Từ vựng

### sense
id: 6860153d-7000-45cb-a436-a6ee7dbb6e0b
tier: core
term.en: sense
term.vi: giác quan
example.en: Seeing and hearing are two of your senses.
example.vi: Nhìn và nghe là hai trong năm giác quan của em.
image.brief: Dùng lại hình `giac-quan-gui-tin-ve-nao/explore_five`
image.alt.en: An eye, an ear, a nose, a tongue and a hand
image.alt.vi: Mắt, tai, mũi, lưỡi và bàn tay

### smell
id: f494a19a-e1ec-4270-a2ec-943dcdd85f83
tier: core
term.en: smell
term.vi: ngửi, mùi
example.en: Jasmine flowers smell sweet.
example.vi: Hoa nhài có mùi thơm.
image.brief: Dùng lại hình `nao-dieu-khien-co-the/w2`
image.alt.en: White jasmine flowers
image.alt.vi: Những bông hoa nhài trắng
> `term.vi` có hai nghĩa vì "smell" vừa là động từ vừa là danh từ, như cách dùng trong bài ("smells", "a sweet smell"). [Nghe thử] giọng VI đọc dấu phẩy thành chỗ ngắt.

### taste
id: acc1ba6c-5dbf-49bd-9add-4ebcb5447e06
tier: core
term.en: taste
term.vi: nếm, vị
example.en: Your tongue and nose help you taste food.
example.vi: Lưỡi và mũi giúp em nếm đồ ăn.
image.brief: Dùng lại hình `giac-quan-gui-tin-ve-nao/explore_taste`
image.alt.en: A hot bowl of pho
image.alt.vi: Bát phở nóng
> `term.vi` có hai nghĩa vì "taste" vừa là động từ vừa là danh từ. [Nghe thử] giọng VI đọc dấu phẩy thành chỗ ngắt (rà chữ tester 10/11, n16).

### tongue
id: dd7bca43-38d7-4d4f-a62c-c7cf7ffaf1fd
tier: extra
term.en: tongue
term.vi: cái lưỡi
example.en: Your tongue can taste a sour lime.
example.vi: Lưỡi của em nếm được vị chua của quả chanh.
image.brief: Dùng lại hình `giac-quan-gui-tin-ve-nao/q1_tongue`
image.alt.en: A tongue
image.alt.vi: Cái lưỡi

### blocked_nose
id: 91550e6b-1cf4-4c7b-bb8a-aa7f54623a0b
tier: extra
term.en: blocked nose
term.vi: nghẹt mũi
example.en: With a blocked nose, food tastes plain.
example.vi: Khi bị nghẹt mũi, đồ ăn kém ngon hơn.
image.brief: Dùng lại hình `tray_nose` ở bài `ho-hap/duong-di-cua-khong-khi`
image.alt.en: A nose
image.alt.vi: Cái mũi

## Thưởng

### tongue_card
id: c7b5f15d-7dbe-401e-8d73-bb57e611ad2f
set: body
rarity: common
name.en: Tongue
name.vi: Cái lưỡi
tag.en: Taste
tag.vi: Nếm
fact.en: Your tongue has thousands of tiny taste buds.
fact.vi: Lưỡi của em có hàng nghìn nụ vị giác rất nhỏ.
> [CẦN KIỂM] Biên tập nhớ một người có khoảng hai nghìn tới tám nghìn nụ vị giác, phần lớn trên lưỡi. Không nói "mỗi vùng lưỡi nếm một vị" (bản đồ lưỡi là sai).
image.brief: Dùng lại hình `giac-quan-gui-tin-ve-nao/q1_tongue`
image.alt.en: A tongue
image.alt.vi: Cái lưỡi
> Key thẻ là `tongue_card`, vì từ vựng đã có `tongue`.

## Ghi chú cho hoạ sĩ

- **Loại hình** (Quy ước hình ở `_topic.md`): cảnh, đồ vật, thức ăn, con vật là ảnh chụp; bộ phận cơ thể là hình tự vẽ. Hình không có chữ.
- **Kệ Chơi tám ảnh chụp:** gà gáy, hoa nhài (dùng lại bài một), cầu vồng (trên ruộng khoai môn), mèo con, mưa trên mái nhà, ngô nướng, cánh bướm, nước mát trên tay. Ảnh chỉ cho thấy nguồn của tin; nhãn món nói tin là gì.
- **Hình vẽ gốc (chín, theo file chọn ảnh 10/11):** `q1_tongue` (bộ giác quan; lưỡi một màu, không chia vùng); trống trường (`explore_send`); bạn nhỏ bịt mắt (hình câu q4) và ba lựa chọn q4 (gối, mèo con, hòn cuội); ba quả của câu q5. Hình ghép: `explore_five` (năm hình vẽ của bộ giác quan, hai hàng trong ảnh vuông; phần mũi là `tray_nose` của *Hô hấp*).
- **Ảnh chụp (mười một):** xoài chín, bát phở (Học); sáu món kệ Chơi mới (cầu vồng, mèo con, mưa trên mái nhà, ngô nướng, cánh bướm, nước trên tay); chanh cắt đôi (q1); đèn giao thông (q3); sạp hoa quả (q5).
- **Cùng kiểu trong một câu:** w1 ba hình vẽ bộ cơ quan; q1 ba hình vẽ bộ giác quan; q2 ba hình vẽ của bài hai; q3 bốn hình vẽ cùng nét (lưỡi, mắt, dây thần kinh, gân xanh); q4 ba hình vẽ riêng, một vật nguyên cái, nền trơn; q5 ba hình vẽ quả nguyên, nền trơn, cùng cỡ.
- **An toàn:** đèn giao thông không có số đếm ngược, không có xe biển số. Ảnh ngô nướng, sạp hoa quả không thấy mặt người bán. Bát phở không có biển quán. Bạn nhỏ bịt mắt chụp từ sau.
- **Dùng lại trong bài:** `explore_send` (câu q2), `explore_taste` (câu q6, từ `taste`), `explore_five` (từ `sense`), `q1_tongue` (ô `explore_five`, câu q3, từ `tongue`, thẻ thưởng). `explore_join` không còn dùng lại ở câu q5 (rà chữ 10/11, N8).
- **Dùng lại từ bài khác:** bài một `w1` (gà gáy), `w2` (hoa nhài, cả từ `smell`), `explore_move` (w1), `q2_brain` (w1), `w1_ear`, `w1_eye` (q1, q3); bài hai `tray_veins` (w2, q2, q3), `q4_nerve` (q2, q3), `tray_wire` (q2), `q5_hand` (ô `explore_five`); *Hô hấp* `duong-di-cua-khong-khi/tray_heart`, `tray_stomach` (w1), `tray_nose` (ô `explore_five`, từ `blocked_nose`).
- **Màu:** Học: năm giác quan `vang_hoe`, gửi về não `cham`, ghép lại `gi_dong`, mũi giúp nếm `do_son`. Chơi: tai `cham`, mũi `vang_hoe`, da `gi_dong`, nhóm `limit` `do_son`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món.
  - Khởi động: `single_choice` (w1 ôn bài một), `true_false` (w2 ôn bài hai, đáp án Sai).
  - Quiz: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2, ba thẻ từ có hình), `multi_choice` (q3), `true_false` (q6, `speaker: na`, đáp án Sai). Bốn format.
  - DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Câu có `misconception`: q6, key `taste_only_tongue`.
- **Vị trí đáp án đúng:** w1 thứ hai; q1 thứ nhất; q4 thứ hai; q5 thứ ba; q3 thứ hai và thứ ba.
- **Tham chiếu:** `recall_from.lesson` trỏ bài một (w1) và bài hai (w2) của chủ đề này, đã có id.
- **Key đổi sau rà chữ 10/11:** q3 `q3_toe` thành `q3_veins`; q5 `q5_green_mango`, `q5_lime`, `q5_ripe_mango` thành `q5_apple`, `q5_banana`, `q5_strawberry`. Khi `import`, các key cũ mất (lựa chọn không có dòng `id:`).
- **Màn Chơi, ví dụ để kiểm:**
  - chạm Tiếng gà gáy, Mùi hoa nhài, Lông mèo con mềm → đạt;
  - chạm Màu cầu vồng → `has_limited`;
  - chạm Tiếng gà gáy, Tiếng mưa trên mái nhà, Mùi ngô nướng (thiếu da) → `missing.tray_skin`; chạm Nước mát trên tay → `full`; bỏ Tiếng mưa trên mái nhà, đặt Nước mát trên tay → đạt.
- **Dòng điều kiện màn Chơi:** "Cần đủ Tai, Mũi, Da · Không nhận ra khi nhắm mắt".
- **Số từ EN trên một màn:**
  - Học khoảng ba mươi hai từ: mục tiêu 10, hướng dẫn 3, bốn nhãn 9, câu dài nhất 9, ô Từ mới 5.
  - Quiz nhiều nhất là q3 (khoảng ba mươi: câu hỏi 12, hướng dẫn 5, bốn nhãn 4, giải thích 9) và q4 (khoảng hai mươi tám).
- **Từ EN có thể ngoài Starters/Movers:** sense, smell, taste, tongue, blocked, plain, pho, jasmine, rooster, crowing, tin roof, grilled, corn, kitten, fur, furry, traffic light, mango, ripe, lime, sour, stall, strawberry, veins.
- **Giọng đọc:** EN nghe thử "pho" (chuỗi `.en` nay không dấu, rà chữ 10/11, N9); dấu hai chấm ở ví dụ `explore_join` và giải thích câu q4, q5.
