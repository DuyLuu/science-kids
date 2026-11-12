---
id: 80c089ce-d23b-4d50-b146-7845a80d735e
topic: ho-hap
slug: duong-di-cua-khong-khi
order: 2
stage: core
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: The journey of air
vi: Đường đi của không khí: mũi, khí quản, phổi
> Giữ đúng tên ở `syllabus-lessons.md` và `content/syllabus.json` (`new-breathing`, bài số hai). Nghe thử giọng VI đọc dấu hai chấm trong tiêu đề như một chỗ ngắt.

## Mục tiêu
en: I can say how air gets to my lungs.
vi: Em kể được không khí đi tới phổi như thế nào.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-036, ngày 10/11/2026. Mọi dòng `id:` để trống; phiên chính chạy `ids` sau bài một (câu w1, w2 trỏ về bài một).
> Bài cốt lõi (`core`) và là bài sửa misconception chính của chủ đề, `air_goes_to_belly`: ý chính ba, ô Phổi, ô Thức ăn và không khí, nhóm `limit` ở phần Chơi (dạ dày, thực quản), lựa chọn sai ở câu q1 và q4, và câu q6 (gắn key, Na nói đúng).

## Ý chính
1.en: Air goes in through your nose or mouth.
1.vi: Không khí đi vào qua mũi hoặc miệng.
2.en: Then it goes down a tube called the windpipe.
2.vi: Rồi không khí đi xuống một cái ống gọi là khí quản.
3.en: The windpipe takes air to your lungs, in your chest.
3.vi: Khí quản đưa không khí vào hai lá phổi trong lồng ngực.
> [CẦN KIỂM] Sách Tự nhiên và Xã hội lớp hai (biên tập nhớ) kể thêm "phế quản" giữa khí quản và phổi. Bài nói "hai ống nhỏ hơn" ở ô Khí quản, chưa dùng tên "phế quản" (bảng Tên gọi ở `_topic.md`). Chuyên môn quyết có thêm tên này vào chữ VI không.
> Ba ý đi theo đường của không khí, từ chỗ nhìn thấy được (mũi, miệng), tới chỗ sờ được (khí quản ở cổ), tới chỗ ẩn bên trong (phổi sau xương sườn).

## Khởi động

> Hai câu, đúng bảng Khởi động ở `_topic.md`. Cả hai ôn bài một (khoảng một ngày trước). Mọi câu có hình ở câu hỏi; mọi lựa chọn có hình.
> - w1 ôn ý chính hai bài một (cá thở bằng mang). Giải thích khi sai nói "mèo và chim thở bằng phổi", dẫn vào bài này.
> - w2 ôn ô Hơi thở ra và câu q5 bài một (đáp án Đúng).

### w1
id: c2b445cb-e35a-4c70-a684-66392baa5fdf
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: ho-hap/vi-sao-ta-phai-tho
prompt.en: Which animal breathes with gills?
prompt.vi: Con vật nào thở bằng mang?
image.brief: Dùng lại hình `tray_pond` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): pond village lotus leaves
image.alt.en: A pond with big leaves
image.alt.vi: Cái ao có lá to
> Theo hình designer chọn (SK-036, designer 10/11): dùng lại ảnh cái ao của bài một chủ đề *Bề mặt Trái Đất*, không tìm ảnh mới. `alt` tả đúng ảnh đó (lá to trên mặt ao), không thấy con vật nào, nên không lộ đáp án.
hint.en: Remember the Animals card in the last lesson.
hint.vi: Em nhớ lại ô Con vật ở bài trước nhé.
explanation_correct.en: Yes! A carp breathes in water with its gills.
explanation_correct.vi: Đúng rồi! Cá chép thở dưới nước bằng mang.
explanation_wrong.en: The answer is the carp. Cats and birds use lungs.
explanation_wrong.vi: Đáp án là cá chép. Mèo và chim thở bằng phổi.
> Ba con vật quen, ba nơi sống (trên cạn, trên trời, dưới nước), ba ảnh đã có từ bài một. Đáp án ở chỗ thứ ba (bài một w1 ở chỗ thứ nhất).

#### option w1_cat
correct: false
label.en: cat
label.vi: con mèo
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

#### option w1_sparrow
correct: false
label.en: sparrow
label.vi: chim sẻ
image.brief: Dùng lại hình `tray_sparrow` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow on a branch
image.alt.vi: Chim sẻ đậu trên cành

#### option w1_carp
correct: true
label.en: carp
label.vi: cá chép
image.brief: Dùng lại hình `q1_fish` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): common carp side view
image.alt.en: A carp
image.alt.vi: Con cá chép

### w2
id: bff1be6e-14b4-4da2-a619-7de137a0e412
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: ho-hap/vi-sao-ta-phai-tho
prompt.en: The air you breathe out is warm and wet.
prompt.vi: Không khí em thở ra thì ấm và ẩm.
image.brief: Dùng lại hình `explore_in_out` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): hand on chest t-shirt close up
image.alt.en: A hand resting on a chest
image.alt.vi: Bàn tay đặt lên ngực
answer: true
hint.en: Remember the cold window in the last lesson.
hint.vi: Em nhớ lại cửa kính lạnh ở bài trước nhé.
explanation_correct.en: Yes! That is why a cold window gets foggy.
explanation_correct.vi: Đúng rồi! Vì vậy cửa kính lạnh bị mờ khi em hà hơi.
explanation_wrong.en: This is true. Your breath is warm and wet.
explanation_wrong.vi: Câu này đúng. Hơi thở của em ấm và ẩm.
> Câu giữ đúng chữ câu của ô Hơi thở ra bài một. Hình câu hỏi là bàn tay trên ngực (ô Hít vào và thở ra), không dùng ảnh hơi thở thành làn sương (bằng chứng của đáp án Đúng).

## Học

> Bốn ô, theo đường đi của không khí, rồi tới ô sửa misconception chính:
> - Mũi (ý chính một): lối vào, làm ấm, làm sạch;
> - Khí quản (ý chính hai): ống ở cổ, thức ăn đi ống khác;
> - Phổi (ý chính ba): trong lồng ngực, căng lên khi hít vào;
> - Thức ăn và không khí: thức ăn xuống dạ dày, không khí vào phổi; bụng nhấp nhô vì một cơ dưới phổi (`air_goes_to_belly`).
>
> Bốn hình là bốn bản tô màu của cùng một sơ đồ đường thở tự vẽ (Quy ước hình ở `_topic.md`, mục hai), không có chữ. Tên gọi nằm ở nhãn ô và câu.

### explore
id: 25562f28-44fb-4c5d-9799-1ea2f2ad3106
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_nose
label.en: Nose
label.vi: Mũi
color: cham
sentence.en: Your nose warms the air and cleans it.
sentence.vi: Mũi làm ấm không khí và làm sạch không khí.
image.brief: [hình vẽ] Sơ đồ đường thở gốc của bài (thân trên một bạn nhỏ nhìn thẳng; xem Ghi chú cho hoạ sĩ), bản tô màu mũi: lỗ mũi và khoang mũi tô xanh chàm đậm, mọi phần khác nhạt; không có chữ, không có mũi tên.
image.alt.en: A body drawing with the nose coloured
image.alt.vi: Hình vẽ cơ thể, tô màu phần mũi
examples.1.en: air goes in through two nostrils
examples.1.vi: không khí đi vào qua hai lỗ mũi
examples.2.en: tiny hairs catch dust
examples.2.vi: lông mũi giữ bụi lại
examples.3.en: it is wet inside, so dirt sticks
examples.3.vi: bên trong mũi ẩm, nên bụi bẩn dính lại
examples.4.en: your mouth can help, too
examples.4.vi: miệng cũng giúp em thở được
> [CẦN KIỂM] Lông mũi và lớp nhầy ẩm trong mũi giữ lại bụi; mũi làm ấm và làm ẩm không khí. Sách lớp hai có câu "vì sao nên thở bằng mũi" (biên tập nhớ). Bài không khuyên "không được thở bằng miệng".

#### group explore_windpipe
label.en: Windpipe
label.vi: Khí quản
color: vang_hoe
sentence.en: The windpipe is a tube in your neck.
sentence.vi: Khí quản là một cái ống ở cổ em.
image.brief: [hình vẽ] Cùng sơ đồ đường thở gốc, bản tô màu khí quản: ống khí quản ở cổ và hai ống nhỏ ở cuối tô vàng hoe đậm, mọi phần khác nhạt; không có chữ, không có mũi tên.
image.alt.en: A body drawing with the windpipe coloured
image.alt.vi: Hình vẽ cơ thể, tô màu khí quản
examples.1.en: touch the front of your neck
examples.1.vi: em sờ nhẹ phía trước cổ
examples.2.en: it has hard rings
examples.2.vi: ống có những vòng cứng
examples.3.en: it splits into two smaller tubes
examples.3.vi: cuối ống chia thành hai ống nhỏ hơn
examples.4.en: food goes down another tube
examples.4.vi: thức ăn đi xuống một ống khác
> [CẦN KIỂM] Khí quản có những vòng sụn hình chữ C; sờ nhẹ phía trước cổ thấy được (biên tập nhớ). Hai ống nhỏ là phế quản (ý chính hai).
> Ví dụ bốn chuẩn bị ô Thức ăn và không khí và món bẫy thực quản ở phần Chơi.

#### group explore_lungs
label.en: Lungs
label.vi: Phổi
color: do_son
sentence.en: Your two lungs are in your chest.
sentence.vi: Hai lá phổi nằm trong lồng ngực em.
image.brief: [hình vẽ] Cùng sơ đồ đường thở gốc, bản tô màu phổi: hai lá phổi tô đỏ son dịu (không đỏ như máu), xương sườn vẽ mờ phía trước, mọi phần khác nhạt; không có chữ, không có mũi tên.
image.alt.en: A body drawing with the lungs coloured
image.alt.vi: Hình vẽ cơ thể, tô màu hai lá phổi
examples.1.en: soft, like a sponge
examples.1.vi: mềm và xốp như miếng bọt biển
examples.2.en: your ribs keep them safe
examples.2.vi: xương sườn che chở cho phổi
examples.3.en: they fill up when you breathe in
examples.3.vi: phổi căng lên khi em hít vào
examples.4.en: they get smaller when you breathe out
examples.4.vi: phổi nhỏ lại khi em thở ra
> [CẦN KIỂM] So sánh phổi với miếng bọt biển (mềm, xốp, có rất nhiều chỗ chứa khí).

#### group explore_food_air
label.en: Food and air
label.vi: Thức ăn và không khí
color: nau_dat
sentence.en: Food goes to your stomach. Air goes to your lungs.
sentence.vi: Thức ăn đi xuống dạ dày. Không khí đi vào phổi.
image.brief: [hình vẽ] Cùng sơ đồ đường thở gốc, bản tô hai đường: thực quản và dạ dày tô nâu đất, khí quản và hai lá phổi tô đỏ son dịu; hai đường tách nhau rõ ở dưới họng; không có chữ, không có mũi tên.
image.alt.en: A body drawing with two paths coloured, one to the stomach and one to the lungs
image.alt.vi: Hình vẽ cơ thể, tô hai đường, một đường xuống dạ dày, một đường vào phổi
examples.1.en: your belly moves when you breathe
examples.1.vi: bụng em cũng nhấp nhô khi em thở
examples.2.en: a muscle under your lungs pulls down
examples.2.vi: một cơ nằm dưới phổi kéo xuống
examples.3.en: it pushes your belly out a little
examples.3.vi: cơ đó đẩy bụng em phình ra một chút
examples.4.en: but the air is in your lungs
examples.4.vi: nhưng không khí thì ở trong phổi
> Ô sửa `air_goes_to_belly`. [CẦN KIỂM] như correction ở `_topic.md` (cơ hoành, không dùng tên này với trẻ). Thức ăn và không khí cùng đi qua họng rồi mới tách hai đường; câu không nói "hai ống từ miệng", để vẫn đúng.
> Màu `nau_dat` cho ô này để khác màu ô Phổi.

### new_words
id: ae2b047c-2ee6-4804-a2c3-9f882cf1061d
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: nostril, windpipe, lungs

## Chơi

> Bé dựng đường đi của không khí: chọn một lối vào (mũi hoặc miệng), một ống dẫn (khí quản), một nơi không khí tới (phổi). Đạt khi đủ ba nhóm và không chọn bộ phận nào không nằm trên đường của không khí. Chạm hình đã chọn để bỏ ra.
> Trò chơi dùng ngay bốn ô Học:
> - thực quản là bẫy chính: cũng là một ống, cũng bắt đầu từ họng (ô Khí quản, ví dụ bốn);
> - dạ dày là bẫy của misconception `air_goes_to_belly`;
> - tim và xương sườn nằm ngay cạnh phổi, nhưng không khí không đi qua.
> - Hai nhóm "Ống dẫn khí" và "Nơi không khí tới" mỗi nhóm chỉ có một món, vì đường thở chỉ có một ống chính và một nơi tới. Bé vẫn phải chọn giữa khí quản và thực quản, giữa phổi và dạ dày.
>
> Mọi món là hình tự vẽ cùng nét (bộ phận bên trong cơ thể), kể cả mũi và miệng.

### tray
id: 1f63f7dc-5692-4d92-9e9e-82b6521ac39d
type: build_tray
version: 1
prompt.en: Help the air get to the lungs
prompt.vi: Giúp không khí đi tới phổi
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick a way in, a tube, and where air goes.
messages.start.vi: Em chọn một lối vào, một ống dẫn và nơi không khí tới nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! That is the journey of air.
messages.balanced.vi: Tuyệt! Đó là đường đi của không khí.
messages.has_limited.en: Air does not go there.
messages.has_limited.vi: Không khí không đi tới đó.
> Một lời nhắn chung cho bốn món bẫy, nói lý do. Riêng dạ dày, câu q6 nói rõ hơn vì sao bụng nhấp nhô. Rà chữ tester 10/11 (n4): bỏ vế "Tap it to take it off" · "Em chạm vào để bỏ ra nhé", vì trùng `messages.full` và ba bài kia chỉ nói lý do.
messages.missing.tray_in.en: You still need a way for air to get in.
messages.missing.tray_in.vi: Em còn thiếu một lối cho không khí đi vào.
messages.missing.tray_tube.en: You still need the tube for air.
messages.missing.tray_tube.vi: Em còn thiếu cái ống dẫn không khí.
messages.missing.tray_end.en: You still need the place air goes to.
messages.missing.tray_end.vi: Em còn thiếu nơi không khí đi tới.

#### group tray_in
label.en: Way in
label.vi: Lối vào
color: cham
role: required

#### group tray_tube
label.en: Air tube
label.vi: Ống dẫn khí
color: vang_hoe
role: required

#### group tray_end
label.en: Where air goes
label.vi: Nơi không khí tới
color: do_son
role: required

#### group tray_not
label.en: Not on the air path
label.vi: Không phải đường của không khí
color: nau_dat
role: limit
> Nhãn `limit` dạng "Không …", gọi tên loại, không gọi tên món bẫy. Dòng điều kiện sẽ là "Cần đủ Lối vào, Ống dẫn khí, Nơi không khí tới · Không phải đường của không khí". Nhờ tester xem dòng này trên iPhone bề rộng nhỏ nhất.

#### item tray_nose
label.en: Nose
label.vi: Mũi
group: tray_in
image.brief: [hình vẽ] Cái mũi của một bạn nhỏ vẽ nghiêng, cắt sát từ dưới mắt tới môi trên, thấy lỗ mũi; không vẽ mắt, không có chữ; nền kem trơn, cùng nét với bảy món kia.
image.alt.en: A nose
image.alt.vi: Cái mũi
> Hình gốc dùng chung với *Não bộ và giác quan* (SK-037 dùng lại; main session chốt 10/11, tester n13). Brief không đổi.

#### item tray_stomach
label.en: Stomach
label.vi: Dạ dày
group: tray_not
image.brief: [hình vẽ] Dạ dày vẽ riêng, hình túi cong, màu hồng nâu dịu, có đoạn ống ngắn ở trên; kiểu tranh giải phẫu cho trẻ, không có máu, không có chữ; nền kem trơn. Câu q2 và từ stomach của bài này, câu q5 bài bốn dùng lại hình này.
image.alt.en: A stomach
image.alt.vi: Dạ dày
> Hình gốc dùng chung với *Não bộ và giác quan* (SK-037 dùng lại; main session chốt 10/11, tester n13). Brief không đổi.

#### item tray_windpipe
label.en: Windpipe
label.vi: Khí quản
group: tray_tube
image.brief: [hình vẽ] Khí quản vẽ riêng, một ống thẳng có những vòng sụn xếp đều, cuối ống chia làm hai nhánh ngắn; màu trắng hồng dịu; không có phổi, không có chữ; nền kem trơn. Câu q2, từ windpipe và câu q5 bài bốn dùng lại hình này.
image.alt.en: A windpipe
image.alt.vi: Khí quản

#### item tray_heart
label.en: Heart
label.vi: Tim
group: tray_not
image.brief: [hình vẽ] Trái tim người vẽ riêng (hình dạng thật, không phải biểu tượng hình trái tim), màu đỏ son dịu, vài mạch máu ngắn ở trên; không có máu chảy, không có chữ; nền kem trơn. Từ heart ở bài ba dùng lại hình này.
image.alt.en: A heart
image.alt.vi: Trái tim
> Hình gốc dùng chung với *Não bộ và giác quan* (SK-037 dùng lại; main session chốt 10/11, tester n13). Brief không đổi.

#### item tray_mouth
label.en: Mouth
label.vi: Miệng
group: tray_in
image.brief: [hình vẽ] Cái miệng hơi hé của một bạn nhỏ vẽ nghiêng, cắt sát từ dưới mũi tới cằm; không vẽ mắt, không có chữ; nền kem trơn, cùng nét với hình mũi.
image.alt.en: A mouth
image.alt.vi: Cái miệng

#### item tray_food_pipe
label.en: Food pipe
label.vi: Thực quản
group: tray_not
image.brief: [hình vẽ] Thực quản vẽ riêng, một ống mềm, trơn, không có vòng sụn, hơi cong ở đầu dưới; màu hồng nâu dịu, cùng màu với dạ dày; không có chữ; nền kem trơn. Phải khác rõ hình khí quản (khí quản có vòng, thực quản trơn), vì hai thẻ đứng cạnh nhau ở câu q2. Câu q2 bài này và câu q5 bài bốn dùng lại hình này.
image.alt.en: A food pipe
image.alt.vi: Thực quản

#### item tray_lungs
label.en: Lungs
label.vi: Phổi
group: tray_end
image.brief: [hình vẽ] Hai lá phổi vẽ riêng, lá trái nhỏ hơn lá phải một chút, màu hồng đỏ son dịu, mặt xốp, khí quản ngắn ở trên; không có tim, không có chữ; nền kem trơn. Thẻ thưởng bài ba dùng lại hình này.
image.alt.en: Two lungs
image.alt.vi: Hai lá phổi
> [CẦN KIỂM] Lá phổi trái nhỏ hơn để chừa chỗ cho tim (thẻ thưởng bài ba không nói ý này; nếu thêm thẻ phổi sau thì dùng).

#### item tray_ribs
label.en: Ribs
label.vi: Xương sườn
group: tray_not
image.brief: [hình vẽ] Lồng xương sườn vẽ riêng, nhìn thẳng, các xương sườn cong đều màu trắng ngà; không có phổi bên trong, không có chữ; nền kem trơn. Từ ribs dùng lại hình này.
image.alt.en: A set of ribs
image.alt.vi: Lồng xương sườn

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Bốn format: `single_choice` (q1, q3), `fill_blank_bank` (q2), `multi_choice` (q4), `true_false` (q5, q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, mọi thẻ từ có hình. Mọi lựa chọn và thẻ từ là hình tự vẽ cùng nét.

### q1
id: 4a033967-2391-47ee-b861-52b743a95e01
format: single_choice
version: 1
dok: 1
prompt.en: Where are your lungs?
prompt.vi: Phổi của em nằm ở đâu?
image.brief: [ảnh] Một cái ống nghe của bác sĩ đặt trên mặt bàn gỗ, cuộn gọn, chụp từ trên xuống; không có người, không có chữ, không có nhãn hiệu. Ảnh gợi "nghe phổi" mà không cho thấy chỗ nào trên cơ thể. Từ khoá tìm ảnh (EN): stethoscope on wooden table
image.alt.en: A stethoscope on a table
image.alt.vi: Cái ống nghe trên bàn
hint.en: Remember the Lungs card. What keeps them safe?
hint.vi: Em nhớ lại ô Phổi. Cái gì che chở cho phổi?
explanation_correct.en: Yes! Your lungs are in your chest, behind your ribs.
explanation_correct.vi: Đúng rồi! Phổi nằm trong lồng ngực, sau các xương sườn.
explanation_wrong.en: The answer is in your chest. Your ribs keep them safe.
explanation_wrong.vi: Đáp án là trong lồng ngực. Xương sườn che chở cho phổi.
> Câu nhớ lại ý chính ba. "In your belly" là lựa chọn sai có sức hút (`air_goes_to_belly`, không gắn key).
> Nhãn nói chỗ (cổ, ngực, bụng), không nói tên bộ phận; `alt` tả đồng đều "tô màu phần …". Câu thứ hai của gợi ý hỏi về xương sườn, câu trả lời (xương sườn) không phải nhãn đáp án.

> Rà chữ tester 10/11 (N1): ba lựa chọn trước đây là bản tô cơ quan (khí quản, phổi, dạ dày), nên bé chỉ cần nhận ra "hình có hai lá phổi" vừa chạm ở ô Phổi. Nay là ba bản tô **vùng cơ thể** (cổ, ngực, bụng) cùng một màu phủ trong suốt; mọi cơ quan bên trong giữ màu nhạt như bản gốc, không cơ quan nào được tô riêng. `alt` giữ nguyên (đã tả vùng, không gọi tên bộ phận).

#### option q1_neck
correct: false
label.en: in your neck
label.vi: ở cổ
image.brief: [hình vẽ] Cùng sơ đồ đường thở gốc, bản tô vùng cổ: một lớp màu vàng hoe trong suốt phủ đều cả vùng cổ, từ dưới cằm tới xương đòn; mọi cơ quan bên trong vẫn nhạt như bản gốc, không tô riêng khí quản hay cơ quan nào; không có chữ, không có mũi tên. Cùng màu phủ, cùng độ trong với hai bản vùng ngực và vùng bụng.
image.alt.en: A body drawing with the neck part coloured
image.alt.vi: Hình vẽ cơ thể, tô màu phần cổ

#### option q1_chest
correct: true
label.en: in your chest
label.vi: trong lồng ngực
image.brief: [hình vẽ] Cùng sơ đồ đường thở gốc, bản tô vùng ngực: một lớp màu vàng hoe trong suốt phủ đều cả vùng ngực, từ xương đòn tới hết xương sườn; mọi cơ quan bên trong vẫn nhạt như bản gốc, không tô riêng phổi hay cơ quan nào; không có chữ, không có mũi tên. Cùng màu phủ, cùng độ trong với hai bản vùng cổ và vùng bụng.
image.alt.en: A body drawing with the chest part coloured
image.alt.vi: Hình vẽ cơ thể, tô màu phần ngực

#### option q1_belly
correct: false
label.en: in your belly
label.vi: trong bụng
image.brief: [hình vẽ] Cùng sơ đồ đường thở gốc, bản tô vùng bụng: một lớp màu vàng hoe trong suốt phủ đều cả vùng bụng, từ dưới xương sườn tới thắt lưng; mọi cơ quan bên trong vẫn nhạt như bản gốc, không tô riêng dạ dày hay cơ quan nào; không có chữ, không có mũi tên. Cùng màu phủ, cùng độ trong với hai bản vùng cổ và vùng ngực.
image.alt.en: A body drawing with the belly part coloured
image.alt.vi: Hình vẽ cơ thể, tô màu phần bụng

### q2
id: 2e80c1c9-7442-4160-9ee9-0c9106a51452
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing words
prompt.vi: Chọn những từ còn thiếu
image.brief: Dùng lại hình `explore_breath_out` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): cow breath steam cold morning
image.alt.en: An animal breathing out white mist on a cold morning
image.alt.vi: Con vật thở ra làn hơi trắng vào buổi sáng lạnh
sentence.en: Air goes in through your {1}, then down your {2}.
sentence.vi: Không khí đi vào qua {1}, rồi xuống {2}.
answers: q2_nose, q2_windpipe
hint.en: Remember the journey you built in the game.
hint.vi: Em nhớ lại đường đi em vừa dựng ở phần Chơi nhé.
explanation_correct.en: Yes! Nose, then windpipe, then lungs.
explanation_correct.vi: Đúng rồi! Mũi, rồi khí quản, rồi tới phổi.
explanation_wrong.en: The answers are nose, then windpipe.
explanation_wrong.vi: Đáp án là mũi, rồi đến khí quản.
> Câu nhớ lại ý chính một và hai, theo đúng thứ tự trên đường đi. Hai ô trống, cùng thứ tự ở câu EN và câu VI. Thực quản và dạ dày là hai thẻ sai, nối với hai món bẫy ở phần Chơi.
> Rà chữ tester 10/11 (N7): câu cũ "Air goes from your {1}, down your {2}, to your lungs." mười một từ, quá luật mười từ. Câu mới mười từ, theo đề xuất của tester; ý "tới phổi" nằm ở giải thích khi đúng.
> Hình câu hỏi là hơi thở của con vật (bài một): gợi "không khí" mà không cho thấy bộ phận nào.

#### bank q2_food_pipe
label.en: food pipe
label.vi: thực quản
image.brief: Dùng lại hình `tray_food_pipe`.
image.alt.en: A food pipe
image.alt.vi: Thực quản

#### bank q2_nose
label.en: nose
label.vi: mũi
image.brief: Dùng lại hình `tray_nose`.
image.alt.en: A nose
image.alt.vi: Cái mũi

#### bank q2_stomach
label.en: stomach
label.vi: dạ dày
image.brief: Dùng lại hình `tray_stomach`.
image.alt.en: A stomach
image.alt.vi: Dạ dày

#### bank q2_windpipe
label.en: windpipe
label.vi: khí quản
image.brief: Dùng lại hình `tray_windpipe`.
image.alt.en: A windpipe
image.alt.vi: Khí quản

### q3
id: ddee6e4f-ee6b-49e6-9918-a5bd9ea35457
format: single_choice
version: 1
dok: 2
prompt.en: Lan's nose is blocked. She breathes through her mouth. Which part does the air skip?
prompt.vi: Lan bị nghẹt mũi, nên Lan thở bằng miệng. Không khí không đi qua bộ phận nào?
image.brief: [hình vẽ] Lan ngồi trên giường, tay cầm khăn tay đưa lên mũi, vẽ nghiêng từ phía sau vai nên chỉ thấy tóc và một phần má, không vẽ nét mặt; phòng sáng, gọn; không có thuốc, không có bác sĩ, không có chữ. Cảnh nhẹ nhàng, không ốm nặng.
image.alt.en: Lan holding a hanky to her nose
image.alt.vi: Lan cầm khăn tay lên mũi
hint.en: Follow the air from her mouth to her lungs.
hint.vi: Em lần theo đường không khí đi từ miệng tới phổi nhé.
explanation_correct.en: Yes! The air skips her nose, so it is not cleaned.
explanation_correct.vi: Đúng rồi! Không khí không đi qua mũi, nên không được làm sạch.
explanation_wrong.en: The answer is the nose. Mouth air still uses the windpipe.
explanation_wrong.vi: Đáp án là mũi. Không khí từ miệng vẫn đi xuống khí quản.
> DOK 2: áp dụng đường đi của không khí vào tình huống mới (thở bằng miệng). Bé nghĩ không khí từ miệng xuống bụng (`air_goes_to_belly`) sẽ chọn "phổi" hoặc "khí quản"; cả hai lựa chọn sai đều nối với misconception.
> Ba câu EN trong câu hỏi (4, 5, 6 từ), cả màn khoảng hai mươi sáu từ.
> [CẦN KIỂM] Nghẹt mũi là chuyện nhẹ, hay gặp khi bị cảm; câu không nói bệnh, không khuyên gì. Chữ "nghẹt mũi" · "blocked nose" khớp bảng Tên gọi của *Não bộ và giác quan* (SK-037), chủ đề đó dùng ở bài ba (nghẹt mũi thì đồ ăn kém ngon).

#### option q3_windpipe
correct: false
label.en: windpipe
label.vi: khí quản
image.brief: Dùng lại hình `explore_windpipe`.
image.alt.en: A body drawing with the windpipe coloured
image.alt.vi: Hình vẽ cơ thể, tô màu khí quản

#### option q3_lungs
correct: false
label.en: lungs
label.vi: phổi
image.brief: Dùng lại hình `explore_lungs`.
image.alt.en: A body drawing with the lungs coloured
image.alt.vi: Hình vẽ cơ thể, tô màu hai lá phổi

#### option q3_nose
correct: true
label.en: nose
label.vi: mũi
image.brief: Dùng lại hình `explore_nose`.
image.alt.en: A body drawing with the nose coloured
image.alt.vi: Hình vẽ cơ thể, tô màu phần mũi

### q4
id: 21580484-f8d3-43e3-a563-4f967d6796f6
format: multi_choice
version: 1
dok: 2
prompt.en: You breathe in. What happens?
prompt.vi: Em hít vào. Điều gì xảy ra?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `w1` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): rice field wind waves Vietnam
image.alt.en: Wind blowing over a rice field
image.alt.vi: Gió thổi trên cánh đồng lúa
hint.en: Remember the Lungs card and the Food and air card.
hint.vi: Em nhớ lại ô Phổi và ô Thức ăn và không khí nhé.
explanation_correct.en: Yes! Your lungs fill up, so your chest gets bigger.
explanation_correct.vi: Đúng rồi! Phổi căng đầy không khí, nên lồng ngực to ra.
explanation_wrong.en: The answers are chest gets bigger and lungs fill.
explanation_wrong.vi: Đáp án là lồng ngực to ra và phổi đầy không khí.
> DOK 2: phân loại điều xảy ra khi hít vào, có hai bẫy: dạ dày đầy không khí (`air_goes_to_belly`) và phổi nhỏ lại (lẫn với thở ra).
> Rà chữ tester 10/11 (n9): giải thích khi sai theo mẫu "The answers are …" như mọi câu khác (chín từ EN).

#### option q4_chest
correct: true
label.en: chest gets bigger
label.vi: lồng ngực to ra
image.brief: [hình vẽ] Cùng sơ đồ đường thở gốc, bản lồng ngực nở: đường viền ngực và xương sườn rộng ra, hai mũi tên nhỏ chỉ ra hai bên ngực; tô màu xương sườn; không có chữ.
image.alt.en: A body drawing with the chest getting wider
image.alt.vi: Hình vẽ cơ thể, lồng ngực nở rộng ra

#### option q4_stomach
correct: false
label.en: stomach fills with air
label.vi: dạ dày đầy không khí
image.brief: [hình vẽ] Cùng sơ đồ đường thở gốc, bản dạ dày căng phồng: dạ dày tô nâu đất đậm, to tròn hơn bình thường, hai mũi tên nhỏ chỉ ra ngoài quanh dạ dày; không có chữ.
image.alt.en: A body drawing with the stomach puffed up
image.alt.vi: Hình vẽ cơ thể, dạ dày căng phồng

#### option q4_lungs_fill
correct: true
label.en: lungs fill with air
label.vi: phổi đầy không khí
image.brief: [hình vẽ] Cùng sơ đồ đường thở gốc, bản phổi căng: hai lá phổi tô đỏ son dịu, to hơn bản của ô Phổi một chút, hai mũi tên nhỏ chỉ ra ngoài quanh phổi; không có chữ.
image.alt.en: A body drawing with the lungs puffed up
image.alt.vi: Hình vẽ cơ thể, hai lá phổi căng lên

#### option q4_lungs_small
correct: false
label.en: lungs get smaller
label.vi: phổi nhỏ lại
image.brief: [hình vẽ] Cùng sơ đồ đường thở gốc, bản phổi xẹp: hai lá phổi tô đỏ son dịu, nhỏ hơn bản của ô Phổi, hai mũi tên nhỏ chỉ vào trong; không có chữ.
image.alt.en: A body drawing with the lungs getting smaller
image.alt.vi: Hình vẽ cơ thể, hai lá phổi nhỏ lại
> Bốn bản cùng sơ đồ, cùng kiểu mũi tên, chỉ khác phần tô và hướng mũi tên; không bản nào nổi bật hơn.

### q5
id: a6c66569-fc4e-40c7-9c82-ddddbbc43941
format: true_false
version: 1
dok: 2
prompt.en: When you breathe out, your lungs get bigger.
prompt.vi: Khi em thở ra, phổi to ra.
image.brief: Dùng lại hình `q3_pinwheel` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): paper pinwheel spinning
image.alt.en: A pinwheel
image.alt.vi: Chiếc chong chóng
answer: false
hint.en: Think of a balloon when the air comes out.
hint.vi: Em nghĩ tới quả bóng bay khi xì hơi ra nhé.
explanation_correct.en: Air leaves your lungs, so they get smaller.
explanation_correct.vi: Không khí đi ra khỏi phổi, nên phổi nhỏ lại.
explanation_wrong.en: This is false. Your lungs get smaller when you breathe out.
explanation_wrong.vi: Câu này sai. Phổi nhỏ lại khi em thở ra.
> DOK 2: áp dụng ô Phổi (ví dụ ba và bốn) vào chiều ngược lại của câu q4. Gợi ý là một phép so sánh (bóng bay xì hơi), không nói thẳng Đúng hay Sai.
> Giải thích khi đúng không mở đầu bằng "Yes!" (đáp án Sai).

### q6
id: 6a35894c-9d21-4c00-b059-66fb3cd6060e
format: true_false
version: 1
dok: 3
misconception: air_goes_to_belly
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: My belly moves out, but air fills my lungs.
statement.vi: Bụng mình phình ra, nhưng không khí thì đi vào phổi.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: true
image.brief: [hình vẽ] Một bạn nhỏ nằm ngửa trên chiếc chiếu, một chú gấu bông nhỏ (không nhãn hiệu) đặt trên bụng, vẽ nghiêng từ phía chân lên nên không thấy nét mặt; vài nét cong nhỏ quanh gấu bông cho thấy gấu bông đang nhấp nhô; không có chữ. Câu w2 bài bốn dùng lại hình này.
image.alt.en: A child lying down with a teddy on the belly
image.alt.vi: Bạn nhỏ nằm ngửa, gấu bông trên bụng
hint.en: Remember the Food and air card.
hint.vi: Em nhớ lại ô Thức ăn và không khí nhé.
explanation_correct.en: Yes! A muscle moves your belly. The air is in your lungs.
explanation_correct.vi: Đúng rồi! Một cơ dưới phổi làm bụng em phình ra. Không khí thì ở trong phổi.
explanation_wrong.en: Na is right. Air goes down the windpipe to the lungs.
explanation_wrong.vi: Na nói đúng. Không khí đi xuống khí quản, vào phổi.
> Lời Na, hình và đáp án Đúng đúng như `_topic.md` (mục "Câu sáu, lời Na" và bảng Đáp án Đúng/Sai).
> DOK 3: Na nói hai ý, một điều quan sát được (bụng phình ra) và một kết luận ngược với điều bé dễ suy ra (không khí vào phổi, không vào bụng). Bé có misconception sẽ thấy câu thứ hai "lạ" và chọn "Na chưa đúng". Bé phải dùng ô Thức ăn và không khí để thấy hai ý không mâu thuẫn.
> Hình là hoạt động bé làm thử được ở nhà (gấu bông nhấp nhô trên bụng): cho thấy bụng nhấp nhô, đúng vế một của Na, không cho thấy không khí đi đâu.
> Rà chữ tester 10/11 (n3): lời Na cũ hai câu, mười lăm từ, là màn q6 nhiều chữ nhất. Câu tester đề xuất ("My belly moves out, but the air goes to my lungs.") mười một từ, quá luật mười từ, nên biên tập rút còn chín từ; cả màn còn mười sáu từ (câu hỏi 3, hướng dẫn 4, lời Na 9). Bỏ vế "khi mình hít vào": hình gấu bông nhấp nhô và vế "air fills my lungs" đã cho bối cảnh đang thở. VI theo đề xuất của tester.

## Từ vựng

### nostril
id: 974a995c-4601-42d2-9064-ff5cf6e7f3bd
tier: core
term.en: nostril
term.vi: lỗ mũi
example.en: Air goes in through your two nostrils.
example.vi: Không khí đi vào qua hai lỗ mũi.
image.brief: Dùng lại hình `explore_nose`.
image.alt.en: A body drawing with the nose coloured
image.alt.vi: Hình vẽ cơ thể, tô màu phần mũi

### windpipe
id: 85f30b11-c69f-4a8a-8a04-2ca6741e01ec
tier: core
term.en: windpipe
term.vi: khí quản
example.en: The windpipe takes air to your lungs.
example.vi: Khí quản đưa không khí vào phổi.
image.brief: Dùng lại hình `tray_windpipe`.
image.alt.en: A windpipe
image.alt.vi: Khí quản

### lungs
id: f55613f6-8c01-41f5-be02-5ca7699a5b9a
tier: core
term.en: lungs
term.vi: phổi
example.en: Your lungs fill with air when you breathe in.
example.vi: Phổi căng đầy không khí khi em hít vào.
image.brief: Dùng lại hình `explore_lungs`.
image.alt.en: A body drawing with the lungs coloured
image.alt.vi: Hình vẽ cơ thể, tô màu hai lá phổi

### ribs
id: 7d5302f8-c49a-4f98-8c36-a9c63a9a721f
tier: extra
term.en: ribs
term.vi: xương sườn
example.en: Your ribs keep your lungs safe.
example.vi: Xương sườn che chở cho phổi.
image.brief: Dùng lại hình `tray_ribs`.
image.alt.en: A set of ribs
image.alt.vi: Lồng xương sườn

### stomach
id: 5c737032-503f-4df8-b69a-cf317aead6dc
tier: extra
term.en: stomach
term.vi: dạ dày
example.en: Food goes down to your stomach.
example.vi: Thức ăn đi xuống dạ dày.
image.brief: Dùng lại hình `tray_stomach`.
image.alt.en: A stomach
image.alt.vi: Dạ dày

## Thưởng

### elephant
id: ffad72b4-3394-4f52-8897-74ff3f088272
set: breathing
rarity: common
name.en: Elephant
name.vi: Con voi
tag.en: Super nose
tag.vi: Chiếc mũi đặc biệt
fact.en: An elephant's trunk is its nose. It can swim with its trunk up for air.
fact.vi: Vòi của con voi chính là mũi. Voi có thể vừa bơi vừa giơ vòi lên khỏi mặt nước để thở.
> [CẦN KIỂM] Vòi voi là mũi và môi trên dài ra; voi bơi được và giơ vòi lên khỏi nước để thở như ống thở (biên tập nhớ). Voi châu Á có ở Tây Nguyên.
image.brief: Dùng lại hình `w1_elephant` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): young Asian elephant standing tall grass
image.alt.en: An elephant with its long trunk
image.alt.vi: Con voi với chiếc vòi dài

## Ghi chú cho hoạ sĩ

- **Loại hình:** bài này gần như toàn hình tự vẽ, vì nói về bộ phận bên trong cơ thể (Quy ước hình ở `_topic.md`, mục hai). Hình không có chữ, không có nhãn. Chỉ ba ảnh chụp: ao làng (câu w1), ống nghe (câu q1), và các ảnh dùng lại từ bài một và chủ đề *Khủng long*.
- **Sơ đồ đường thở gốc** (vẽ một lần, rồi làm các bản tô màu):
  - thân trên của một bạn nhỏ nhìn thẳng, từ đỉnh đầu tới thắt lưng, da màu nhạt phẳng, nền kem trơn;
  - khuôn mặt chỉ có mũi và miệng nét mảnh, không vẽ mắt (hoặc mắt nhắm một nét), không có tóc chi tiết, để không thành chân dung;
  - bên trong thấy: khoang mũi và lỗ mũi, họng, khí quản có vòng, hai ống nhỏ ở cuối khí quản, hai lá phổi (lá trái nhỏ hơn một chút), xương sườn vẽ mờ, thực quản trơn đi sau khí quản xuống dạ dày;
  - bản gốc mọi phần đều nhạt; mỗi bản tô đậm một phần bằng màu của ô (mũi `cham`, khí quản `vang_hoe`, phổi `do_son` dịu, thực quản và dạ dày `nau_dat`);
  - không có máu, không có cơ, không vẽ da bị cắt mở; nhìn như tranh trong sách thiếu nhi, không đáng sợ.
- **Bản tô màu cần vẽ (mười một, cộng bản gốc nhạt):**
  - bốn bản tô cơ quan cho ô Học: `explore_nose`, `explore_windpipe`, `explore_lungs`, `explore_food_air` (hai đường);
  - ba bản tô **vùng cơ thể** cho câu q1 (rà chữ tester 10/11, N1): `q1_neck` (vùng cổ), `q1_chest` (vùng ngực), `q1_belly` (vùng bụng). Cùng một lớp màu vàng hoe trong suốt, mọi cơ quan bên trong giữ màu nhạt như bản gốc, không tô riêng cơ quan nào. Bản `q1_belly` cũ (tô dạ dày) bỏ;
  - bốn bản của câu q4 (ngực nở, dạ dày căng, phổi căng, phổi xẹp; có mũi tên nhỏ, không có chữ).
  - Bản `explore_nose`, `explore_windpipe`, `explore_lungs` dùng lại ở q3, từ vựng và câu w1 bài ba, với `alt` riêng ở từng chỗ; không còn dùng ở q1.
- **Bộ phận vẽ riêng cho kệ Chơi (tám):** mũi, miệng (vẽ nghiêng, cắt sát, không vẽ mắt), khí quản (có vòng), thực quản (trơn, không vòng, khác rõ khí quản), phổi, tim (hình dạng thật), dạ dày, lồng xương sườn. Cùng nét, cùng cỡ trong ô, nền kem trơn.
- **Cảnh có trẻ, tự vẽ (hai):** câu q3 Lan cầm khăn tay lên mũi (vẽ nghiêng từ sau vai); câu q6 bạn nhỏ nằm ngửa có gấu bông trên bụng (vẽ từ phía chân lên). Không vẽ nét mặt.
- **Ảnh cần tìm (một):** ống nghe trên bàn gỗ (câu q1). Câu w1 dùng lại ảnh cái ao `tray_pond` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat` (designer 10/11).
- **Dùng lại:** từ bài một: `tray_sparrow` (w1), `explore_in_out` (w2), `explore_breath_out` (q2), `w1` lúa gió (q4), `q3_pinwheel` (q5). Từ chủ đề *Khủng long*: `w3_cat`, `q1_fish` (w1), `w1_elephant` (thẻ thưởng).
- **Bài khác dùng lại hình của bài này:** `explore_nose`, `explore_windpipe`, `explore_lungs` (bài ba w1); `tray_windpipe`, `tray_food_pipe`, `tray_stomach` (bài bốn q5); `tray_heart` (bài ba, từ `heart`); `tray_lungs` (bài ba, thẻ thưởng); `q6` (bài bốn w2).
- **Dùng chung với *Não bộ và giác quan* (main session chốt 10/11, tester n13):** designer *Hô hấp* vẽ `tray_nose` (mũi nhìn nghiêng), `tray_heart` (tim), `tray_stomach` (dạ dày); SK-037 dùng lại ba hình này. Vẽ sao cho hợp cả hai chủ đề: mũi thấy rõ lỗ mũi và sống mũi, cắt từ dưới mắt tới môi trên.
- **Các lựa chọn trong một câu cùng kiểu:** mọi lựa chọn và thẻ từ của bài là hình tự vẽ (câu w1 là ba ảnh dùng lại). Câu q2: thẻ khí quản và thẻ thực quản phải khác rõ bằng mắt (vòng sụn).
- **An toàn:** không có máu, không phổi bệnh, không bệnh viện. Ống nghe chỉ là đồ vật trên bàn.
- **Màu:** Học: mũi `cham`, khí quản `vang_hoe`, phổi `do_son`, thức ăn và không khí `nau_dat`. Chơi: lối vào `cham`, ống dẫn khí `vang_hoe`, nơi không khí tới `do_son`, nhóm "Không phải đường của không khí" `nau_dat`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core: nostril, windpipe, lungs).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required` (hai nhóm chỉ có một món), một nhóm `limit` bốn món, tám món.
  - Khởi động: `single_choice` (w1), `true_false` (w2, Đúng). Cả hai `recall_from.lesson: ho-hap/vi-sao-ta-phai-tho`, DOK một.
  - Quiz: `single_choice` (q1, q3), `fill_blank_bank` (q2, hai ô trống, bốn thẻ có hình), `multi_choice` (q4, bốn lựa chọn, hai đúng), `true_false` (q5 Sai; q6 Đúng, `speaker: na`).
  - DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3.
  - Câu có `misconception`: q6, key `air_goes_to_belly`.
- **Tham chiếu:** `recall_from.lesson: ho-hap/vi-sao-ta-phai-tho` (w1, w2) cần bài một đã có id: chạy `ids` cho bài một trước.
- **Vị trí đáp án đúng:** w1 thứ ba; q1 thứ hai; q2 thẻ thứ hai và thứ tư (`answers: q2_nose, q2_windpipe`); q3 thứ ba; q4 thứ nhất và thứ ba.
- **Màn Chơi, ví dụ để kiểm:**
  - mở màn → `start`;
  - Mũi, Khí quản, Phổi → `balanced`;
  - Miệng, Khí quản, Phổi → `balanced`;
  - Thực quản → `has_limited`;
  - Mũi, Miệng, Khí quản (thiếu nơi không khí tới) → `missing.tray_end`;
  - rồi chạm Phổi → `full`; bỏ Miệng, đặt Phổi → `balanced`.
- **Ô lựa chọn có nhãn dài:** "stomach fills with air" · "dạ dày đầy không khí" (q4) và nhãn `limit` "Không phải đường của không khí". Nhờ ios-dev hoặc tester xem trong ô hình và trên dòng điều kiện ở iPhone bề rộng nhỏ nhất.
- **Số từ EN trên một màn:** Học khoảng hai mươi tám (mục tiêu 9, hướng dẫn 3, bốn nhãn 6, câu dài nhất 10, ô Từ mới 5). Nhiều chữ nhất ở Quiz là q3 (khoảng hai mươi bảy: câu hỏi 15, ba nhãn 3, giải thích sai 11). Câu q6 sau rà chữ tester 10/11 (n3) còn khoảng hai mươi mốt: câu hỏi 3, hướng dẫn 4, lời Na 9, hai nhãn 2, giải thích đúng 11 (trước là ba mươi).
- **Từ EN có thể ngoài Starters/Movers:** từ mới nostril, windpipe, lungs; ribs, stomach, food pipe, tube, sponge, blocked, skip, path, journey, muscle, hanky (chỉ ở `alt`), stethoscope (chỉ ở `alt`), trunk.
- **Giọng đọc:** VI tiêu đề có dấu hai chấm; nghe thử chỗ ngắt. EN nghe thử "windpipe", "nostrils".
- **Asset:** không có audio, `asset` trong markdown.
