---
id: 41512052-e9f3-4050-9660-f5b3e2c09f4c
topic: ho-hap
slug: vi-sao-ta-phai-tho
order: 1
stage: opener
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Why we breathe
vi: Vì sao ta phải thở?
> Giữ đúng tên ở `syllabus-lessons.md` và `content/syllabus.json` (`new-breathing`, bài số một).

## Mục tiêu
en: I can say why my body needs air.
vi: Em nói được vì sao cơ thể em cần không khí.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-036, ngày 10/11/2026. Mọi dòng `id:` để trống; phiên chính chạy `ids`. Bài này chạy `ids` trước ba bài kia, vì bài hai, ba có câu Khởi động trỏ về bài này.
> Bài mở màn (`opener`). Mục tiêu, ý chính, từ vựng, bốn ô Học và phần Chơi theo hàng bài một trong bảng kế hoạch ở `_topic.md`.
> Bài sửa `breathe_out_same_air` ở ý chính ba, ô Hơi thở ra, câu q5 và câu q6 (gắn key). `fish_do_not_breathe` sửa ở ý chính hai, ô Con vật, nhóm Sống dưới nước ở phần Chơi và câu q2, không gắn key.
> 14/11 (SK-044, ngân sách chữ Discoverer A2): thêm `feedback` cho mọi lựa chọn sai và `feedback_true/false`; hai lời giải thích còn một câu, bỏ "Yes!" · "Đúng rồi!" và "The answer is…" · "Đáp án là…"; câu hỏi tối đa mười chữ VI, câu ô Học một câu tối đa mười hai chữ. Nháp AI.

## Ý chính
1.en: We breathe in and out, even when we sleep.
1.vi: Mình hít vào, thở ra suốt ngày đêm, cả khi đang ngủ.
2.en: People and animals breathe, even fish in water.
2.vi: Người và con vật đều thở, cả cá sống dưới nước.
> [CẦN KIỂM] "Cá thở dưới nước": cá lấy ô-xi hoà tan trong nước qua mang (correction của `fish_do_not_breathe`).
3.en: Our body takes oxygen from the air we breathe.
3.vi: Cơ thể mình lấy khí ô-xi từ không khí mình hít vào.
> [CẦN KIỂM] Tên "khí ô-xi" theo sách (mục Nguồn của `_topic.md`).
> Ba ý đi từ cụ thể tới trừu tượng: điều bé tự cảm thấy (ngực phồng xẹp), điều bé thấy ở con vật quanh mình, rồi điều không nhìn thấy (ô-xi).

## Khởi động

> Hai câu, đúng bảng Khởi động ở `_topic.md`. Mọi câu có hình ở câu hỏi; mọi lựa chọn có hình.
> - w1 ôn kiến thức nền (`prior_knowledge`): bé đã thổi bóng bay và thấy gió thổi, nên biết không khí có thật dù không nhìn thấy. Câu chuẩn bị cho ô Khí ô-xi, và cho món bẫy bóng bay ở phần Chơi: bóng bay chứa đầy không khí nhưng không biết thở.
> - w2 ôn bài năm của *Khủng long* (`khung-long/vi-sao-khung-long-bien-mat`), chủ đề trước, cách khoảng một tuần. Câu giữ đúng chữ câu của ô Sống sót. Giải thích khi đúng bắc cầu sang bài này: cá sấu cũng thở bằng không khí.

### w1
id: cff32927-0412-4e84-9f39-352822bc0cd3
format: single_choice
version: 1
dok: 1
recall_from.kind: prior_knowledge
recall_from.note.en: Prior knowledge: children blow up balloons and feel the wind.
recall_from.note.vi: Kiến thức nền: trẻ đã thổi bóng bay và cảm thấy gió thổi.
prompt.en: Which one is full of air?
prompt.vi: Vật nào chứa đầy không khí?
image.brief: [ảnh] Cánh đồng lúa xanh lúc có gió, lá lúa nghiêng rạp về một phía thành những làn sóng, chụp rộng, trời có mây; không có người, không có nhà gần, không có chữ. Ảnh gợi "không khí đang chuyển động" mà không cho thấy vật nào trong ba lựa chọn. Từ khoá tìm ảnh (EN): rice field wind waves Vietnam
image.alt.en: Wind blowing over a rice field
image.alt.vi: Gió thổi trên cánh đồng lúa
hint.en: Think of a birthday party.
hint.vi: Em nhớ lại một bữa tiệc sinh nhật nhé.
explanation_correct.en: You blow your breath into a balloon to fill it.
explanation_correct.vi: Em thổi hơi thở vào để bóng căng lên.
explanation_wrong.en: Balloons hold air, even though you cannot see it.
explanation_wrong.vi: Bóng bay chứa không khí, dù mắt em không thấy.
> Gợi ý chỉ tới một bối cảnh quen (tiệc sinh nhật), không nói tên vật. Vị trí đáp án đúng: hết hiệu lực 15/11 (SK-047, app xáo lựa chọn).
> Hình câu hỏi dùng lại ở câu q4 bài hai và câu w1 bài ba.

#### option w1_balloon
correct: true
label.en: balloon
label.vi: quả bóng bay
image.brief: [ảnh] Một quả bóng bay màu đỏ căng tròn, có dây buộc thả xuống, nền tường hoặc nền trời trơn; bóng không in chữ, không in hình; không có người, không có tay cầm. Cùng cỡ trong khung như hai hình kia. Món bẫy bóng bay ở phần Chơi dùng lại ảnh này. Từ khoá tìm ảnh (EN): red balloon plain background
image.alt.en: A red balloon
image.alt.vi: Quả bóng bay màu đỏ

#### option w1_water
correct: false
feedback.en: This glass is full of water, not air.
feedback.vi: Cốc này đầy nước, không phải không khí.
label.en: glass of water
label.vi: cốc nước
image.brief: [ảnh] Một cốc thuỷ tinh đầy nước trong đặt trên bàn gỗ, chụp ngang, nền trơn; không có nhãn hiệu, không có chữ. Nếu ảnh cốc nước đã chọn cho bài *Đất và nước trên Trái Đất* (SK-033) hợp khung thì dùng ảnh đó. Từ khoá tìm ảnh (EN): glass of water wooden table
image.alt.en: A glass of water
image.alt.vi: Cốc nước

#### option w1_stone
correct: false
feedback.en: A stone is solid all the way through.
feedback.vi: Hòn đá đặc chắc, bên trong không rỗng.
label.en: stone
label.vi: hòn đá
image.brief: [ảnh] Một hòn đá cuội nhẵn màu vàng nâu nằm trên cát, chụp gần; đá đặc, không có lỗ (không dùng ảnh đá ba-dan có lỗ bọt khí của chủ đề *Bề mặt Trái Đất*); không có chữ, không có thước đo. Từ khoá tìm ảnh (EN): smooth pebble stone sand
image.alt.en: A smooth stone
image.alt.vi: Hòn đá cuội
> Theo hình designer chọn (SK-036, designer 10/11): ảnh hòn cuội vàng nâu trên cát (CC0), không phải đá xám trên nền trơn; brief và `alt` sửa theo. Nhãn "stone" · "hòn đá" giữ.

### w2
id: f204a211-6997-49a3-a78b-bc550c004678
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: khung-long/vi-sao-khung-long-bien-mat
prompt.en: Some kinds of animals lived on and still live today.
prompt.vi: Một số loài vật sống sót tới ngày nay.
image.brief: Dùng lại hình `t_rex` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): Tyrannosaurus rex skeleton museum mount side view horizontal posture
image.alt.en: A T. rex skeleton in a museum
image.alt.vi: Bộ xương khủng long bạo chúa trong bảo tàng
answer: true
hint.en: Think of reptiles you can still see today.
hint.vi: Em nghĩ tới những loài bò sát ngày nay vẫn còn nhé.
> SK-047 (15/11, nháp AI): gợi ý cũ trỏ ô "Lived on" · "Sống sót", tên ô gần như là câu khẳng định; nay bé mở được gợi ý trước khi trả lời, nên gợi ý chỉ tới bằng chứng (cá sấu, rùa), bé tự nối với thời khủng long.
explanation_correct.en: Crocodiles still live today, and they breathe air like you.
explanation_correct.vi: Cá sấu vẫn sống tới nay, và thở không khí như em.
explanation_wrong.en: Some animals lived on, like crocodiles and turtles.
explanation_wrong.vi: Có loài đã sống sót, như cá sấu và rùa.
feedback_false.en: Turtles lived with dinosaurs, and turtles still swim today.
feedback_false.vi: Rùa sống từ thời khủng long, nay vẫn còn.
> Câu EN giữ đúng chữ câu của ô `explore_survivors` bài năm *Khủng long* ("Some kinds of animals lived on and still live today."). Câu VI rút từ mười hai còn chín chữ cho ngân sách A2 (14/11), cùng ý với câu của ô đó ("Một số loài vật đã sống sót, và ngày nay vẫn còn."). [CẦN KIỂM] của ô đó áp luôn ở đây.
> Hình câu hỏi là bộ xương khủng long bạo chúa (loài đã tuyệt chủng), không dùng ảnh cá sấu của ô Sống sót: ảnh cá sấu đang sống là bằng chứng của đáp án Đúng.
> Gợi ý chỉ chỗ cần nhớ (ô Sống sót), không nói Đúng hay Sai. Bé chưa học *Khủng long* vẫn làm được nhờ biết cá sấu, rùa ngày nay còn.

## Học

> Bốn ô, từ cụ thể tới trừu tượng:
> - Hít vào và thở ra (ý chính một): ngực phồng xẹp, thở cả lúc ngủ;
> - Con vật (ý chính hai): con vật nào cũng thở, cá thở bằng mang (`fish_do_not_breathe`, không gắn key);
> - Khí ô-xi (ý chính ba): không khí có ô-xi, cả cơ thể cần ô-xi;
> - Hơi thở ra: ấm, ẩm, cơ thể đã giữ lại một ít ô-xi (`breathe_out_same_air`, chuẩn bị câu q5 và q6).
>
> Không dùng `sentence_card`: app 0.1.0 chỉ hiện `explore_groups` đầu tiên và `word_list` đầu tiên ở màn Học. Hình ô Học không có chữ, kể cả nhãn chữ song ngữ (Duy chốt 10/11).

### explore
id: 21a3963e-9575-4fe8-8ebd-460196c9b497
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_in_out
label.en: In and out
label.vi: Hít vào và thở ra
color: cham
sentence.en: Your chest goes up and down when you breathe.
sentence.vi: Ngực em phồng lên, xẹp xuống khi em thở.
image.brief: [hình vẽ] Bàn tay một người đặt nhẹ lên ngực áo phông trơn, vẽ cận từ cằm xuống tới bụng, không thấy mặt; áo không có chữ, không có hình in, không có nhãn hiệu; nền trơn. Từ khoá tìm ảnh (EN): hand on chest t-shirt close up
image.alt.en: A hand resting on a chest
image.alt.vi: Bàn tay đặt lên ngực
examples.1.en: air goes in when you breathe in
examples.1.vi: hít vào thì không khí đi vào
examples.2.en: air comes out when you breathe out
examples.2.vi: thở ra thì không khí đi ra
examples.3.en: through your nose or mouth
examples.3.vi: qua mũi hoặc miệng
examples.4.en: awake or asleep
examples.4.vi: lúc thức và cả lúc ngủ
> Bé làm theo được ngay: đặt tay lên ngực và thở. Ví dụ ba chuẩn bị bài hai (mũi hoặc miệng).
> Hình gốc, dùng lại ở từ `chest`, câu w2 bài hai, thẻ q2_breaths bài ba.

#### group explore_animals
label.en: Animals
label.vi: Con vật
color: gi_dong
sentence.en: Animals breathe too, and fish breathe in water with gills.
sentence.vi: Con vật cũng thở, cá thở dưới nước bằng mang.
image.brief: Dùng lại hình `q1_fish` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): common carp side view
image.alt.en: A carp
image.alt.vi: Con cá chép
examples.1.en: cats and dogs
examples.1.vi: chó và mèo
examples.2.en: birds in the sky
examples.2.vi: chim trên trời
examples.3.en: frogs by the pond
examples.3.vi: ếch bên bờ ao
examples.4.en: fish use gills
examples.4.vi: cá thở bằng mang
> Ảnh cá chép nhìn ngang thấy rõ nắp mang sau đầu. [CẦN KIỂM] như ý chính hai. Ếch thở bằng phổi và qua da (biên tập nhớ); bài không nói cách ếch thở.

#### group explore_oxygen
label.en: Oxygen
label.vi: Khí ô-xi
color: vang_hoe
sentence.en: Your whole body needs the oxygen in the air.
sentence.vi: Cả cơ thể em cần khí ô-xi trong không khí.
image.brief: [ảnh] Một thợ lặn bơi dưới biển xanh, chụp từ phía sau hơi chếch, thấy rõ bình khí trên lưng và bọt khí nổi lên; mặt nạ lặn che mặt, không nhận ra mặt; không có chữ, không có logo trên bình (cắt hoặc chọn ảnh khác). Ưu tiên ảnh NOAA trên Commons (public domain), không kèm logo cơ quan. Từ khoá tìm ảnh (EN): scuba diver from behind air tank bubbles NOAA
image.alt.en: A diver under the sea with an air tank
image.alt.vi: Thợ lặn dưới biển mang bình khí
examples.1.en: you cannot see it
examples.1.vi: mắt em không nhìn thấy ô-xi
examples.2.en: it is in the air all around you
examples.2.vi: ô-xi có trong không khí quanh em
examples.3.en: with food, it gives you energy
examples.3.vi: cùng với thức ăn, ô-xi giúp em có năng lượng
examples.4.en: divers take air under the sea
examples.4.vi: thợ lặn mang bình khí xuống biển
> [CẦN KIỂM] Ví dụ ba là cách giản lược: tế bào dùng ô-xi và chất lấy từ thức ăn để tạo năng lượng. Nối với ý "năng lượng" của *Ăn uống lành mạnh* bài một (nếu bé đã học). Ví dụ bốn nói "air", không nói "oxygen": bình của thợ lặn chứa không khí nén (bảng Tên gọi).
> Câu "Your whole body needs it" đặt nền cho bài ba (`only_lungs_need_oxygen`): ô-xi không dừng ở phổi.

#### group explore_breath_out
label.en: Breathing out
label.vi: Hơi thở ra
color: do_son
sentence.en: The air you breathe out is warm and wet.
sentence.vi: Không khí em thở ra thì ấm và ẩm.
image.brief: [hình vẽ] Một con trâu đứng ngoài đồng vào buổi sáng mùa đông, thở ra làn hơi trắng từ mũi, vẽ nghiêng, nền sương sớm; không có người, không có chữ. Từ khoá tìm ảnh (EN): cow breath steam cold morning
image.alt.en: An animal breathing out white mist on a cold morning
image.alt.vi: Con vật thở ra làn hơi trắng vào buổi sáng lạnh
examples.1.en: breathe on your hand, it feels warm
examples.1.vi: hà hơi vào tay, em thấy ấm
examples.2.en: on cold mornings, you can see it
examples.2.vi: sáng trời lạnh, em thấy hơi thở như làn sương trắng
examples.3.en: it carries water from your body
examples.3.vi: hơi thở mang theo hơi nước từ cơ thể
examples.4.en: your body kept some oxygen
examples.4.vi: cơ thể đã giữ lại một ít ô-xi
> [CẦN KIỂM] như `breathe_out_same_air` ở `_topic.md` (thở ra ấm hơn, ẩm hơn, ít ô-xi hơn). Làn hơi trắng là hơi nước trong hơi thở gặp lạnh. Chữ VI dùng "làn sương trắng", không dùng "làn khói", vì bài bốn dạy khói có hại.
> Ô này không dùng ảnh cửa kính mờ: câu q5 hỏi bé dự đoán kính lạnh sẽ ra sao, nên ảnh kính mờ ở đây sẽ biến câu q5 thành câu ghép hình.

### new_words
id: 2e06fee0-732e-427f-8a20-0d14ec0f7ee0
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: breathe, oxygen, chest, gills
> SK-047 (15/11): thêm `gills` vào dải Từ mới (từ `tier: core`), vì câu q2 (câu Từ mới) điền "gills". Bài có bốn từ core, trong giới hạn ba đến bốn của Discoverer.

## Chơi

> Bé chọn ba con vật biết thở: một con sống trên cạn, một con sống dưới nước, một con biết bay. Đạt khi đủ ba nhóm và không chọn thứ nào không biết thở. Chạm hình đã chọn để bỏ ra.
> Trò chơi dùng ngay ô Con vật (con vật nào cũng thở, cả cá) và câu w1 (bóng bay chứa đầy không khí):
> - mỗi món bẫy giống một nhóm bắt buộc: cánh diều và bóng bay ở trên trời như chim, cá đồ chơi ở dưới nước như cá thật. Bé phải nghĩ "có phải vật sống, biết thở không", không chọn theo chỗ ở;
> - bóng bay là bẫy có chủ ý sau câu w1: chứa đầy không khí không có nghĩa là biết thở;
> - con tôm là điều bất ngờ nhỏ: tôm cũng thở dưới nước bằng mang [CẦN KIỂM].
>
> Vì sao là `build_tray`: ở phần Chơi, schema v1 và app 0.1.0 chỉ có block này. Lời nhắn không gọi tên vật chứa. App xáo kệ mỗi lượt học.

### tray
id: 52f5ebf7-0bbc-4f29-aa7c-34919f95a156
type: build_tray
version: 1
prompt.en: Pick three animals that breathe
prompt.vi: Chọn ba con vật biết thở
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick one from land, one from water, one that flies.
messages.start.vi: Em chọn một con trên cạn, một con dưới nước và một con biết bay nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! They all breathe, even under water.
messages.balanced.vi: Tuyệt! Con nào cũng thở, cả con sống dưới nước.
messages.has_limited.en: That one does not breathe. It is not alive.
messages.has_limited.vi: Thứ này không biết thở. Nó không phải vật sống.
> Lời nhắn khi đạt đúng với mọi cảnh đạt: cảnh nào cũng có một con sống dưới nước (cá chép hoặc tôm). Rà chữ tester 10/11 (N6): câu cũ "even the fish in water" · "cả con cá dưới nước" sai khi bé chọn con tôm. Lời nhắn `has_limited` nói lý do, đúng cho cả ba món bẫy. "Vật sống" là cách gọi của Tự nhiên và Xã hội [CẦN KIỂM].
messages.missing.tray_land.en: You still need an animal from land.
messages.missing.tray_land.vi: Em còn thiếu một con vật sống trên cạn.
messages.missing.tray_water.en: You still need an animal from water.
messages.missing.tray_water.vi: Em còn thiếu một con vật sống dưới nước.
messages.missing.tray_fly.en: You still need an animal that flies.
messages.missing.tray_fly.vi: Em còn thiếu một con vật biết bay.

#### group tray_land
label.en: Lives on land
label.vi: Sống trên cạn
color: gi_dong
role: required

#### group tray_water
label.en: Lives in water
label.vi: Sống dưới nước
color: cham
role: required

#### group tray_fly
label.en: Flies
label.vi: Biết bay
color: vang_hoe
role: required

#### group tray_not
label.en: Does not breathe
label.vi: Không biết thở
color: do_son
role: limit
> Nhãn `limit` dạng "Không …", gọi tên loại, không gọi tên món bẫy (luật ở `_topic.md`). Dòng điều kiện sẽ là "Cần đủ Sống trên cạn, Sống dưới nước, Biết bay · Không biết thở".

#### item tray_cat
label.en: Cat
label.vi: Con mèo
group: tray_land
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

#### item tray_balloon
label.en: Balloon
label.vi: Quả bóng bay
group: tray_not
image.brief: Dùng lại hình `w1_balloon`. Từ khoá tìm ảnh (EN): red balloon plain background
image.alt.en: A red balloon
image.alt.vi: Quả bóng bay màu đỏ

#### item tray_carp
label.en: Carp
label.vi: Cá chép
group: tray_water
image.brief: Dùng lại hình `q1_fish` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): common carp side view
image.alt.en: A carp
image.alt.vi: Con cá chép

#### item tray_sparrow
label.en: Sparrow
label.vi: Chim sẻ
group: tray_fly
image.brief: [ảnh] Một con chim sẻ đậu trên cành cây, nhìn nghiêng, thấy rõ cả con, nền xanh mờ; không có người, không có chữ. Câu w1 bài hai dùng lại ảnh này. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow on a branch
image.alt.vi: Chim sẻ đậu trên cành

#### item tray_shell
label.en: Seashell
label.vi: Vỏ ốc biển
group: tray_not
image.brief: Dùng lại hình `tray_shell` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): seashell white sand
image.alt.en: A seashell on the sand
image.alt.vi: Vỏ ốc biển trên cát
> Thay "Cá đồ chơi" (main session 11/11): không có ảnh cá đồ chơi hợp lệ đủ nét (SK-036). Vỏ ốc rỗng không sống, không thở; vẫn là bẫy giống nhóm dưới nước.

#### item tray_buffalo
label.en: Water buffalo
label.vi: Con trâu
group: tray_land
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu

#### item tray_kite
label.en: Kite
label.vi: Cánh diều
group: tray_not
image.brief: [ảnh] Một cánh diều hình con chim có dải ruy băng hồng bay trên trời, không thấy người thả; không có chữ, không có hình in. Cắt từ ảnh CC0 bạn nhỏ thả diều của bài Trái Đất rất lâu về trước (chủ đề Khủng long), bỏ hẳn người thả diều. Từ khoá tìm ảnh (EN): child flying kite field back view
image.alt.en: A bird-shaped kite in the sky
image.alt.vi: Cánh diều hình con chim trên trời
> Theo hình designer chọn (SK-036, designer 10/11): diều hình chim, không phải diều thoi. Diều hình chim làm món bẫy mạnh hơn cho nhóm "Biết bay": trông như con chim, bay trên trời, nhưng không biết thở. Nhãn "Kite" · "Cánh diều" giữ.

#### item tray_shrimp
label.en: Shrimp
label.vi: Con tôm
group: tray_water
image.brief: [ảnh] Một con tôm còn sống trong nước trong (bể kính hoặc suối), nhìn nghiêng, thấy rõ cả con; không phải tôm đã nấu chín (không có màu đỏ cam của tôm luộc); không có người, không có chữ. Từ khoá tìm ảnh (EN): freshwater shrimp alive underwater side view
image.alt.en: A shrimp in water
image.alt.vi: Con tôm dưới nước
> [CẦN KIỂM] Tôm thở bằng mang.

#### item tray_egret
label.en: Egret
label.vi: Con cò
group: tray_fly
image.brief: [ảnh] Một con cò trắng đang bay sải cánh trên bãi cỏ xanh, chụp ngang, thấy rõ cả con; không có người, không có chữ. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ
> Theo hình designer chọn (SK-036, designer 10/11): cò bay trên bãi cỏ, không phải ruộng lúa; brief và `alt` sửa theo.

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Bốn format: `true_false` (q1, q6), `fill_blank_bank` (q2), `multi_choice` (q3), `single_choice` (q4, q5). Mọi câu có hình ở câu hỏi; mọi lựa chọn, mọi thẻ từ có hình.

### q1
id: 998e34f7-a385-4083-ae1a-2cb38afd6408
format: true_false
version: 1
dok: 1
prompt.en: We breathe even when we are asleep.
prompt.vi: Mình vẫn thở cả khi đang ngủ.
image.brief: [hình vẽ] Một bạn nhỏ nằm ngủ nghiêng trên chiếu trong chiếc màn tuyn, chăn mỏng đắp ngang bụng, vẽ từ phía sau lưng nên chỉ thấy tóc và vai; căn phòng tối nhẹ, ánh trăng qua cửa sổ; không vẽ nét mặt, không có chữ. Ảnh chụp trẻ đang ngủ dễ lộ mặt, nên vẽ.
image.alt.en: A child asleep under a mosquito net
image.alt.vi: Bạn nhỏ ngủ trong màn
answer: true
hint.en: Remember the In and out card.
hint.vi: Em nhớ lại ô Hít vào và thở ra nhé.
explanation_correct.en: Your body breathes by itself, even while you dream.
explanation_correct.vi: Cơ thể em tự thở, cả khi em đang mơ.
explanation_wrong.en: A sleeping person's chest still goes up and down.
explanation_wrong.vi: Người đang ngủ, ngực vẫn phồng lên xẹp xuống.
feedback_false.en: Your body needs air all night, too.
feedback_false.vi: Cả đêm cơ thể em vẫn cần không khí.
> Câu nhớ lại ý chính một. Câu khẳng định, không phủ định. Hình câu hỏi là hình vẽ; câu `true_false` không có lựa chọn bằng hình nên không vướng luật "cùng kiểu hình".

### q2
id: 603a821c-0c58-40b8-a319-06215232274b
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: [ảnh] Một con cá koi (cá chép Nhật) bơi trong hồ nước trong, chụp từ trên bờ nhìn xuống nên chỉ thấy lưng cá, không thấy rõ mang, vây hay vảy; không có người, không có chữ. Từ khoá tìm ảnh (EN): koi carp swimming pond from above
image.alt.en: A fish swimming in a pond
image.alt.vi: Cá bơi trong hồ
> Theo hình designer chọn (SK-036, designer 10/11): một con cá koi nhìn từ trên, không phải mấy con cá chép; `alt` EN sửa theo, VI giữ.
sentence.en: Fish breathe in water with their {1}.
sentence.vi: Cá thở dưới nước bằng {1}.
answers: q2_gills
hint.en: Remember the Animals card in the lesson.
hint.vi: Em nhớ lại ô Con vật ở phần Học nhé.
explanation_correct.en: Gills take oxygen from the water for the fish.
explanation_correct.vi: Mang giúp cá lấy ô-xi từ trong nước.
explanation_wrong.en: Fish breathe through gills on the sides of their head.
explanation_wrong.vi: Cá thở bằng mang ở hai bên đầu.
> Câu nhớ lại ý chính hai và ô Con vật. Ba thẻ là ba bộ phận của cá, cùng số nhiều (fins, gills, scales), cùng kiểu ảnh cận. Vây hấp dẫn vì cá dùng vây để bơi.
> Ô trống ở cùng chỗ trong câu EN và câu VI.
> Rà chữ tester 10/11 (n1): đổi chỗ thẻ đúng để cân vị trí đáp án; hết hiệu lực từ 15/11 (SK-047, app xáo kho thẻ). Chỉ đổi thứ tự khối, không đổi chữ hay hình.

#### bank q2_gills
label.en: gills
label.vi: mang
image.brief: [ảnh] Cận cảnh phần đầu một con cá còn sống, thấy rõ nắp mang và khe mang sau đầu, nền nước hoặc nền trơn; không có máu, không thấy mang bị lật ra, không phải cá đã chết trên thớt; không có chữ. Không có ảnh riêng thì designer cắt từ ảnh cá chép đã chọn cho bài Khủng long là gì. Từ khoá tìm ảnh (EN): fish gill cover close up
image.alt.en: A close-up of fish gills
image.alt.vi: Cận cảnh mang cá
> Hình gốc của từ `gills`.

#### bank q2_fins
label.en: fins
label.vi: vây
feedback.en: Fish use fins to swim and turn.
feedback.vi: Cá dùng vây để bơi và rẽ.
image.brief: [ảnh] Cận cảnh vây của một con cá chép (vây lưng hoặc vây ngực), thấy rõ các tia vây, nền nước hoặc nền trơn; không có chữ, không có tay người. Không có ảnh riêng thì designer cắt từ ảnh cá chép đã chọn cho bài Khủng long là gì, cùng cỡ với hai thẻ kia. Từ khoá tìm ảnh (EN): carp fin close up
image.alt.en: A close-up of fish fins
image.alt.vi: Cận cảnh vây cá

#### bank q2_scales
label.en: scales
label.vi: vảy
feedback.en: Scales cover a fish and keep it safe.
feedback.vi: Vảy phủ ngoài thân, giữ cho cá an toàn.
image.brief: [ảnh] Cận cảnh lớp vảy óng ánh trên thân một con cá còn sống, xếp như mái ngói; không có chữ, không có tay người. Không có ảnh riêng thì designer cắt từ ảnh cá chép đã chọn cho bài Khủng long là gì. Từ khoá tìm ảnh (EN): fish scales close up
image.alt.en: A close-up of fish scales
image.alt.vi: Cận cảnh vảy cá

### q3
id: 4cec5284-21cc-4004-a4af-cdf02510a810
format: multi_choice
version: 1
dok: 2
prompt.en: Which ones need to breathe to live?
prompt.vi: Những thứ nào cần thở để sống?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: [hình vẽ] Một góc sân nhà ở làng quê Việt Nam buổi sáng: sân gạch, chum nước, cây cau hoặc cây chuối phía sau; không có con vật, không có đồ vật nào trong bốn lựa chọn; không có người, không có chữ. Từ khoá tìm ảnh (EN): village house yard Vietnam morning
image.alt.en: A yard in a village
image.alt.vi: Sân nhà ở làng quê
hint.en: Think about which ones are alive.
hint.vi: Em nghĩ xem thứ nào là vật sống nhé.
explanation_correct.en: Every living animal breathes, from frogs to hens.
explanation_correct.vi: Con vật sống nào cũng thở, từ con ếch tới con gà.
explanation_wrong.en: Frogs and hens are alive, so they need to breathe.
explanation_wrong.vi: Ếch và gà là vật sống, nên chúng cần thở.
> DOK 2: phân loại vật sống với vật không sống theo ý "con vật nào cũng thở". Khác phần Chơi: con vật mới (ếch, gà), và hai món sai đều "làm việc với không khí" (quạt thổi gió, chong chóng quay trong gió), nên có sức hút.
> Gợi ý nêu cách nghĩ (thứ nào là vật sống), không nói tên lựa chọn.

#### option q3_frog
correct: true
label.en: frog
label.vi: con ếch
image.brief: Dùng lại hình `tray_frog` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green frog sitting on lotus leaf
image.alt.en: A frog on a lotus leaf
image.alt.vi: Con ếch trên lá sen

#### option q3_fan
correct: false
feedback.en: A fan blows air, but it is a machine.
feedback.vi: Quạt thổi ra gió, nhưng quạt là cái máy.
label.en: fan
label.vi: cái quạt
image.brief: [ảnh] Một cái quạt bàn đứng trên mặt bàn, chụp chéo phía trước, thấy cánh quạt sau lồng; đã cắt hoặc che logo, không có chữ, không có người. Từ khoá tìm ảnh (EN): electric desk fan white background
image.alt.en: A desk fan
image.alt.vi: Cái quạt bàn

#### option q3_pinwheel
correct: false
feedback.en: A pinwheel only spins when the wind pushes it.
feedback.vi: Chong chóng chỉ quay khi có gió đẩy.
label.en: pinwheel
label.vi: chong chóng
image.brief: [ảnh] Một chiếc chong chóng giấy nhiều màu cắm trên que, cánh đang quay hơi nhoè, nền trời hoặc nền cây xanh mờ; không có tay người, không có chữ. Câu q6 và câu q5 bài hai dùng lại ảnh này. Từ khoá tìm ảnh (EN): paper pinwheel spinning
image.alt.en: A pinwheel
image.alt.vi: Chiếc chong chóng

#### option q3_hen
correct: true
label.en: hen
label.vi: con gà mái
image.brief: Dùng lại hình `w3_hen` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): brown hen standing farmyard side view
image.alt.en: A hen in a yard
image.alt.vi: Con gà mái trong sân

### q4
id: cf7fa595-9cc7-4b7d-9ab1-f633ee1c668b
format: single_choice
version: 1
dok: 2
prompt.en: Under the sea, what does a diver need every minute?
prompt.vi: Dưới biển, thợ lặn lúc nào cũng cần thứ gì?
image.brief: [ảnh] Cảnh dưới biển: rạn san hô nhiều màu, đàn cá nhỏ, nước xanh trong; không có thợ lặn, không có bình khí, không có người, không có chữ. Ưu tiên ảnh NOAA trên Commons. Từ khoá tìm ảnh (EN): coral reef underwater fish NOAA
image.alt.en: A coral reef under the sea
image.alt.vi: Rạn san hô dưới biển
hint.en: Remember the diver on the Oxygen card.
hint.vi: Em nhớ lại thợ lặn ở ô Khí ô-xi nhé.
explanation_correct.en: Divers carry air on their backs to breathe underwater.
explanation_correct.vi: Thợ lặn mang không khí trên lưng để thở dưới nước.
explanation_wrong.en: Divers need air every minute, so they carry tanks.
explanation_wrong.vi: Thợ lặn lúc nào cũng cần không khí, nên mang bình.
> DOK 2: áp dụng "người cần không khí mọi lúc" vào tình huống mới. Ba thứ người cần (nước, thức ăn, không khí) đều hấp dẫn; chỉ không khí là cần "trong từng phút", nên chỉ một đáp án.
> Hình câu hỏi không có thợ lặn, vì ảnh thợ lặn (ô Khí ô-xi) có bình khí, tức là đáp án.
> 14/11 (SK-044): ý "thức ăn, nước chờ được" của gợi ý cũ nay nằm ở `feedback` của chai nước và hộp cơm; gợi ý mới chỉ chỗ cần nhớ (một câu, theo luật Discoverer), vì app đọc gợi ý ngay sau `feedback`.
> Rà chữ tester 10/11 (N5): gợi ý cũ "What do you need even when you sleep?" có câu trả lời là "không khí", gần như nói thẳng đáp án "bình khí". Gợi ý mới nêu cách nghĩ (thứ nào chờ được, thứ nào không), không gọi tên lựa chọn. Rà chữ (n7): chữ VI "trong từng phút" đổi thành "lúc nào cũng" cho tự nhiên; EN giữ "every minute".

#### option q4_bottle
correct: false
feedback.en: A diver can drink water later, back on the boat.
feedback.vi: Thợ lặn lên thuyền rồi uống nước cũng được.
label.en: water bottle
label.vi: chai nước
image.brief: [ảnh] Một chai nước bằng nhựa trong, đầy nước, không có nhãn, đứng trên nền trơn, chụp ngang; không có chữ, không có nhãn hiệu. Cùng cỡ trong khung như hai hình kia. Từ khoá tìm ảnh (EN): plastic water bottle no label
image.alt.en: A bottle of water
image.alt.vi: Chai nước

#### option q4_lunch
correct: false
feedback.en: A diver can eat lunch after the dive.
feedback.vi: Thợ lặn ăn cơm sau khi lặn xong cũng được.
label.en: lunch box
label.vi: hộp cơm
image.brief: [ảnh] Một hộp cơm mở nắp có cơm, rau và trứng, đặt trên nền trơn, chụp chéo từ trên xuống; không có nhãn hiệu, không có chữ, không có tay người. Từ khoá tìm ảnh (EN): lunch box rice vegetables egg
image.alt.en: A lunch box with rice
image.alt.vi: Hộp cơm

#### option q4_tank
correct: true
label.en: air tank
label.vi: bình khí
image.brief: [ảnh] Hai bình khí lặn bằng kim loại đứng cạnh nhau trên boong tàu hoặc trên bờ, có van ở đầu bình, chụp ngang cả bình; không có người, đã cắt hoặc che chữ và logo trên bình. Từ khoá tìm ảnh (EN): scuba diving cylinder standing
image.alt.en: Air tanks for diving
image.alt.vi: Bình khí của thợ lặn
> Theo hình designer chọn (SK-036, designer 10/11): ảnh có hai bình; `alt` EN sửa theo, VI giữ. Nhãn "air tank" · "bình khí" giữ số ít như hai lựa chọn kia (chai nước, hộp cơm); chữ VI "bình khí" không phân biệt số.

### q5
id: 0049e003-230b-455e-8c8d-58f2c355bb6d
format: single_choice
version: 1
dok: 2
prompt.en: What happens when Mai breathes on cold glass?
prompt.vi: Mai hà hơi vào kính lạnh thì sẽ thế nào?
image.brief: [hình vẽ] Mai đứng quay lưng về phía người xem, ghé sát một ô cửa kính, chuẩn bị hà hơi; ngoài cửa là buổi sáng mùa đông miền Bắc, cây trơ lá; mặt kính vẫn trong, chưa mờ; chỉ thấy tóc và vai Mai, không vẽ nét mặt; không có chữ.
image.alt.en: Mai by a cold window
image.alt.vi: Mai đứng cạnh cửa kính lạnh
hint.en: Remember the Breathing out card.
hint.vi: Em nhớ lại ô Hơi thở ra nhé.
explanation_correct.en: Tiny water drops from your breath make the glass foggy.
explanation_correct.vi: Hơi nước trong hơi thở đọng lại làm kính mờ.
explanation_wrong.en: Your wet breath makes tiny drops on the cold glass.
explanation_wrong.vi: Hơi thở ẩm đọng thành giọt nhỏ trên kính lạnh.
> DOK 2: dự đoán từ một điều đã học ("hơi thở ẩm") sang một tình huống chưa gặp trong bài (ô Học không có ảnh kính mờ). Bé ở miền Nam có thể thử với cốc nước đá hay cửa kính phòng có máy lạnh; câu không cần nói vậy.
> Lựa chọn "kính vẫn trong" hấp dẫn bé nghĩ hơi thở chỉ là không khí (`breathe_out_same_air`, không gắn key). Câu chuẩn bị bằng chứng cho câu q6.
> Hình câu hỏi cho thấy kính còn trong, đúng lúc trước khi hà hơi, không phải một lựa chọn. Theo hình designer làm (SK-036, designer 10/11): ba lựa chọn cũng là hình tự vẽ, cùng khung cửa gỗ, nên cả câu cùng kiểu hình.

#### option q5_clear
correct: false
feedback.en: Warm, wet breath leaves something on cold glass.
feedback.vi: Hơi thở ấm, ẩm để lại dấu trên kính lạnh.
label.en: clear glass
label.vi: kính trong
image.brief: [hình vẽ] Một ô cửa kính trong, sạch, nhìn ra cây xanh bên ngoài, vẽ thẳng, khung cửa gỗ; không có người, không có phản chiếu người, không có chữ. Ba lựa chọn cùng một kiểu khung cửa, cùng góc chụp. Từ khoá tìm ảnh (EN): clean window glass trees outside
image.alt.en: A window with clear glass
image.alt.vi: Cửa kính trong

#### option q5_foggy
correct: true
label.en: foggy glass
label.vi: kính bị mờ
image.brief: [hình vẽ] Một ô cửa kính bị mờ hơi nước, cây bên ngoài chỉ thấy lờ mờ, vẽ thẳng, khung cửa gỗ; không có hình vẽ hay chữ viết bằng ngón tay trên kính, không có người, không có phản chiếu người. Từ khoá tìm ảnh (EN): foggy window condensation
image.alt.en: A window with foggy glass
image.alt.vi: Cửa kính bị mờ

#### option q5_dusty
correct: false
feedback.en: Dust comes from dirt in the air, not from breath.
feedback.vi: Bụi đến từ đất cát, không từ hơi thở.
label.en: dusty glass
label.vi: kính bám bụi
image.brief: [hình vẽ] Một ô cửa kính bám bụi xám, cây bên ngoài thấy mờ đục, vẽ thẳng, khung cửa gỗ; không có chữ viết trên bụi, không có người. Từ khoá tìm ảnh (EN): dusty dirty window glass
image.alt.en: A window with dusty glass
image.alt.vi: Cửa kính bám bụi
> Kính bụi và kính mờ đều làm cây bên ngoài mờ đi; designer chọn ảnh để bé phân biệt được: kính mờ hơi nước trắng đều, kính bụi xám, có vệt.

### q6
id: 4226a0c7-edbc-487e-b0df-c581f34d0363
format: true_false
version: 1
dok: 3
misconception: breathe_out_same_air
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: I breathe out the same air I breathe in.
statement.vi: Không khí mình thở ra y hệt không khí mình hít vào.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: false
image.brief: Dùng lại hình `q3_pinwheel`. Từ khoá tìm ảnh (EN): paper pinwheel spinning
image.alt.en: A pinwheel
image.alt.vi: Chiếc chong chóng
hint.en: Think of the cold window, and of oxygen.
hint.vi: Em nhớ lại cửa kính lạnh, và nghĩ về khí ô-xi nhé.
explanation_correct.en: Your breath out is warmer, wetter and has less oxygen.
explanation_correct.vi: Hơi thở ra ấm hơn, ẩm hơn và ít ô-xi hơn.
explanation_wrong.en: Your body keeps some oxygen from each breath.
explanation_wrong.vi: Cơ thể em giữ lại một ít ô-xi mỗi lần thở.
feedback_true.en: Breath fogs cold glass because it carries water.
feedback_true.vi: Hơi thở làm mờ kính lạnh, vì có hơi nước.
> Lời Na, hình và đáp án Sai đúng như `_topic.md` (mục "Câu sáu, lời Na" và bảng Đáp án Đúng/Sai).
> DOK 3: bé đánh giá một lời nói bằng hai bằng chứng của bài: hơi thở làm mờ kính lạnh (câu q5, ô Hơi thở ra) và cơ thể giữ lại ô-xi (ô Khí ô-xi, ý chính ba). Gợi ý chỉ hai chỗ cần nhớ, không nói Na đúng hay sai.
> Giải thích khi đúng không mở đầu bằng "Yes!", vì bé vừa chọn "Na chưa đúng". Câu thứ nhất EN tám từ, câu thứ hai năm từ.
> Hình chong chóng là một vật bé thổi hơi vào, không cho thấy hơi thở ẩm hay ấm (khác ảnh ô Hơi thở ra), nên không đưa sẵn bằng chứng.

## Từ vựng

### breathe
id: 7472b8d1-4108-4028-a42b-42ff9ad6aa1e
tier: core
term.en: breathe
term.vi: thở
example.en: We breathe in and out all day and night.
example.vi: Mình hít vào, thở ra suốt ngày đêm.
image.brief: Dùng lại hình `explore_breath_out`. Từ khoá tìm ảnh (EN): cow breath steam cold morning
image.alt.en: An animal breathing out white mist on a cold morning
image.alt.vi: Con vật thở ra làn hơi trắng vào buổi sáng lạnh

### oxygen
id: f4b2eddd-4401-493e-a16b-87c14877c8b1
tier: core
term.en: oxygen
term.vi: khí ô-xi
example.en: Our body takes oxygen from the air.
example.vi: Cơ thể mình lấy khí ô-xi từ không khí.
image.brief: [hình vẽ] Một bể cá nhỏ có máy sục khí: chuỗi bọt khí nổi lên từ viên đá sục dưới đáy bể, vài con cá bơi gần đó, cây thuỷ sinh xanh; vẽ ngang mặt kính; không có người, không có nhãn hiệu trên máy, không có chữ. Câu q2 bài bốn (thẻ q2_oxygen) dùng lại ảnh này. Từ khoá tìm ảnh (EN): aquarium air stone bubbles fish
image.alt.en: Bubbles from an air pump in a fish tank
image.alt.vi: Bọt khí từ máy sục khí trong bể cá
> [CẦN KIỂM] tên "khí ô-xi" theo sách. Nghe thử giọng EN đọc "oxygen".
> Rà chữ tester 10/11 (n14): từ này trước dùng lại ảnh thợ lặn mang bình khí, mà bình của thợ lặn chứa không khí nén, không phải ô-xi. Ảnh mới là máy sục khí trong bể cá: người Việt hay gọi là "máy sủi ô-xi", và máy đưa ô-xi vào nước cho cá thở (nối với ô Con vật). [CẦN KIỂM] máy sục khí làm nước có thêm ô-xi hoà tan. Ô Khí ô-xi ở phần Học vẫn giữ ảnh thợ lặn (ví dụ "divers take air under the sea").

### chest
id: eec30210-a005-4b74-bd39-4fe604f27eb9
tier: core
term.en: chest
term.vi: ngực
example.en: My chest goes up when I breathe in.
example.vi: Ngực em phồng lên khi em hít vào.
image.brief: Dùng lại hình `explore_in_out`. Từ khoá tìm ảnh (EN): hand on chest t-shirt close up
image.alt.en: A hand resting on a chest
image.alt.vi: Bàn tay đặt lên ngực

### gills
id: b6bf66d0-db0c-4e0b-9452-9d487e954727
tier: core
> SK-047 (15/11): `extra` → `core`, cùng dải Từ mới. Giữ câu q2 và ba thẻ cá (hai thẻ là hình gốc cho bài Explorer `ca-va-luong-cu`, `co-the-cac-con-vat`).
term.en: gills
term.vi: mang
example.en: Fish breathe with gills.
example.vi: Cá thở bằng mang.
image.brief: Dùng lại hình `q2_gills`. Từ khoá tìm ảnh (EN): fish gill cover close up
image.alt.en: A close-up of fish gills
image.alt.vi: Cận cảnh mang cá

## Thưởng

### whale
id: 1adeb6f6-925d-456e-b409-77181a2fb73b
set: breathing
rarity: common
name.en: Whale
name.vi: Cá voi
tag.en: Breathes air
tag.vi: Thở bằng không khí
fact.en: Whales live in the sea, but they breathe air. They breathe through a hole on top of their head.
fact.vi: Cá voi sống dưới biển, nhưng thở bằng không khí. Cá voi thở qua một cái lỗ trên đỉnh đầu.
> [CẦN KIỂM] Cá voi là thú, thở bằng phổi, phải trồi lên mặt nước để thở; lỗ thở trên đỉnh đầu. Cột nước phun lên khi cá voi thở ra phần lớn là hơi thở ấm gặp lạnh và nước trên lỗ thở (biên tập nhớ).
> Điều bất ngờ ngược chiều với ô Con vật: cá thở bằng mang, còn cá voi sống dưới biển mà thở bằng không khí. Tên "cá voi" có chữ "cá" nhưng cá voi không phải cá; thẻ không nói ý này để khỏi làm rối ý chính hai. Nếu PM muốn, thêm câu "A whale is not a fish." · "Cá voi không phải là cá.".
> Bộ thẻ mới `set: breathing`: cần ios-dev thêm khoá `collectible.set.breathing` (đề xuất ở ticket SK-036).
> Rà chữ tester 10/11 (n8): câu EN thứ hai cũ "They breathe out through a hole on top." không nói "trên đỉnh cái gì", trong khi VI nói "trên đỉnh đầu". Câu mới mười từ, khớp VI.
image.brief: [ảnh] Một con cá voi trồi lưng lên mặt biển, cột hơi nước phun lên từ lỗ thở, chụp từ xa; không có tàu, không có người, không có chữ, không kèm logo cơ quan. Ưu tiên ảnh NOAA trên Commons (public domain). Từ khoá tìm ảnh (EN): whale blow spout surface NOAA
image.alt.en: A whale breathing out at the top of the sea
image.alt.vi: Cá voi thở ra trên mặt biển

## Ghi chú cho hoạ sĩ

- **Loại hình** (Quy ước hình ở `_topic.md`): ảnh chụp thật là chính; hình tự vẽ (`[hình vẽ]`) chỉ cho hai cảnh có trẻ em (q1 bạn nhỏ ngủ, q5 Mai cạnh cửa kính). Hình không có chữ, kể cả nhãn chữ song ngữ ở phần Học.
  - **Theo hình designer làm 10/11** (ticket SK-036, mục "designer 10/11 · hình"): chín hình tự vẽ. Ngoài q1 và câu hỏi q5 còn có bàn tay trên ngực (`explore_in_out`), trâu thở ra hơi trắng (`explore_breath_out`), sân nhà làng quê (câu hỏi q3), ba ô cửa kính q5, bể cá sục khí (từ `oxygen`). Các lựa chọn của q5 nay cùng là hình vẽ; kệ Chơi vẫn toàn ảnh chụp (món cá đồ chơi còn trống). Diều là diều hình chim cắt từ ảnh của chủ đề *Khủng long*.
- **Ảnh cần tìm (hai mươi bảy):**
  - Khởi động (bốn): lúa nghiêng theo gió (câu w1); bóng bay đỏ; cốc nước; hòn đá cuội.
  - Học (ba): bàn tay đặt lên ngực; thợ lặn dưới biển (NOAA); con vật thở ra làn hơi trắng sáng lạnh.
  - Chơi (năm): chim sẻ; cá đồ chơi bằng nhựa; cánh diều thoi (có thể dùng lại ảnh diều CC0 của chủ đề *Khủng long*); con tôm sống; con cò bay.
  - Quiz (mười bốn): cá bơi trong hồ nhìn từ trên (q2); cận cảnh vây, mang, vảy cá (q2, ba thẻ); sân nhà làng quê (q3); quạt bàn; chong chóng; rạn san hô (q4); chai nước không nhãn; hộp cơm; bình khí lặn; ba ô cửa kính trong, mờ, bụi (q5).
  - Từ vựng (một, thêm sau rà chữ tester 10/11, n14): bể cá có máy sục khí (từ `oxygen`; thẻ q2_oxygen bài bốn dùng lại).
  - Thưởng (một): cá voi thở trên mặt biển (NOAA).
  - Tổng: hai mươi tám ảnh.
- **Hình tự vẽ (hai):** q1 bạn nhỏ ngủ trong màn (vẽ từ sau lưng); q5 Mai cạnh cửa kính lạnh (vẽ từ sau lưng, kính còn trong).
- **Dùng lại từ chủ đề *Khủng long*:** `khung-long-la-gi/q1_fish` (ô Con vật, món cá chép), `khung-long-la-gi/w3_cat`, `khung-long-la-gi/w3_hen`, `trai-dat-rat-lau-ve-truoc/w1_buffalo`, `trai-dat-rat-lau-ve-truoc/tray_frog`, `trai-dat-rat-lau-ve-truoc/t_rex`.
- **Dùng lại trong bài:** `w1_balloon` (món bóng bay); `q3_pinwheel` (câu q6); `explore_breath_out`, `explore_in_out` (từ `breathe`, `chest`); `q2_gills` (từ `gills`). Từ `oxygen` có ảnh riêng (bể cá có máy sục khí) từ rà chữ 10/11.
- **Bài khác dùng lại hình của bài này:** câu `w1` (bài hai q4, bài ba w1), `explore_in_out` (bài hai w2, bài ba q2_breaths), từ `oxygen` (bài bốn q2_oxygen), `explore_breath_out` (bài hai q2), `tray_sparrow` (bài hai w1), `q3_pinwheel` (bài hai q5). Bảng Hình dùng chung ở `_topic.md`.
- **Các lựa chọn trong một câu cùng khung, cùng kiểu:**
  - w1: ba vật đơn lẻ trên nền trơn, cùng cỡ.
  - q2: ba ảnh cận bộ phận cá, cùng cỡ. Nếu cắt từ một ảnh cá chép, ba mục trong file chọn ảnh cùng `file_url`, khác `crop`; ảnh nguồn đủ nét để cắt cận.
  - q3: bốn ảnh vật hoặc con vật cả con, nền thật. Ếch và gà dùng lại ảnh có nền (lá sen, sân); quạt và chong chóng chọn ảnh có nền thật, không nền trắng tách hẳn, để hai món sai không nổi bật.
  - q4: ba vật đơn lẻ trên nền trơn hoặc nền thật cùng kiểu.
  - q5: ba ô cửa kính cùng khung gỗ, cùng góc thẳng, chỉ khác mặt kính (trong, mờ hơi nước, bụi).
- **An toàn:** không có trẻ em nhận ra mặt. Thợ lặn chụp từ phía sau. Không có cá chết, cá trên thớt (thẻ mang cá chọn ảnh cá còn sống). Tôm còn sống, không phải tôm luộc.
- **Kệ Chơi:** chín món đều là ảnh chụp; ba món bẫy (bóng bay, cá đồ chơi, diều) cũng là ảnh, để kiểu hình không báo đúng sai.
- **Màu:** Học: hít vào và thở ra `cham`, con vật `gi_dong`, khí ô-xi `vang_hoe`, hơi thở ra `do_son`. Chơi: trên cạn `gi_dong`, dưới nước `cham`, biết bay `vang_hoe`, nhóm "Không biết thở" `do_son`.
- Ý chính chưa có trường hình. Gợi ý nếu sau này có màn tóm tắt: bàn tay trên ngực; cá chép; thợ lặn.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, bốn từ core: breathe, oxygen, chest, gills; `gills` thêm 15/11, SK-047).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required`, một nhóm `limit`, chín món.
  - Khởi động: `single_choice` (w1, `prior_knowledge`), `true_false` (w2, `recall_from.lesson: khung-long/vi-sao-khung-long-bien-mat`, đáp án Đúng). DOK một.
  - Quiz: `true_false` (q1 Đúng, q6 Sai, `speaker: na`), `fill_blank_bank` (q2, một ô trống, ba thẻ có hình), `multi_choice` (q3, bốn lựa chọn, hai đúng), `single_choice` (q4, q5, ba lựa chọn). Bốn format, đều hiện được ở app 0.1.0.
  - DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3.
  - Câu có `misconception`: q6, key `breathe_out_same_air`.
- **Hình:** câu hỏi có `image`: w1, w2, q1 tới q6; mọi option, mọi thẻ từ, chín món Chơi, bốn nhóm Học, bốn từ vựng, thẻ thưởng.
- **Tham chiếu:** `topic: ho-hap`; `recall_from.lesson` của w2 trỏ bài năm *Khủng long* (đã có id); `misconception: breathe_out_same_air` (id điền khi chạy `ids` cho `_topic.md`).
- **Vị trí đáp án đúng:** hết hiệu lực 15/11 (SK-047, app xáo lựa chọn).
- **Màn Chơi, ví dụ để kiểm:**
  - mở màn → `start`;
  - Con mèo, Cá chép, Chim sẻ → `balanced`;
  - Cánh diều → `has_limited`;
  - Con mèo, Con trâu, Con tôm (thiếu nhóm biết bay) → `missing.tray_fly`;
  - rồi chạm Con cò → `full`;
  - bỏ Con trâu, đặt Con cò → `balanced`.
- **Số từ EN trên một màn** (đếm như các chủ đề trước, món ví dụ ở Học không tính):
  - Học khoảng hai mươi tám: mục tiêu 8, hướng dẫn 3, bốn nhãn 7, câu dài nhất 9 (hai câu ngắn ở ô Con vật cộng lại 10), ô Từ mới 5.
  - Khởi động và Quiz: nhiều nhất là q3 (khoảng hai mươi tám: câu hỏi 7, hướng dẫn 5, bốn nhãn 4, giải thích sai 11) và q6 (khoảng hai mươi tám: câu hỏi 3, hướng dẫn 4, lời Na 9, hai nhãn 2, giải thích đúng 13 trong hai câu).
  - Chơi khoảng năm mươi: chín tên 12, bốn chip 9, dòng điều kiện khoảng 10, lời nhắn dài nhất 10, lệnh 5. Như các chủ đề trước, chờ PM chốt cách đếm màn Chơi.
- **Từ EN có thể ngoài Starters/Movers** (theo trí nhớ, cần đối chiếu danh sách Cambridge): từ mới breathe, oxygen, chest, gills; tên vật carp, shrimp, egret, sparrow, pinwheel, scales, fins, diver, tank, coral reef; từ khác asleep, alive, foggy, dusty, mist (chỉ ở `alt`), energy.
- **Giọng đọc:** EN nghe thử "oxygen", "gills". VI "ô-xi" là hai âm tiết tiếng Việt. Không có ký hiệu, không có dấu "—" trong chuỗi VI.
- **Câu "Em nghĩ sao?"** (đề xuất schema v1.1 `think_first`, như hai chủ đề trước), đặt trước phần Học:
  - Câu: "When you breathe in, the air goes into your belly. What do you think?" · "Khi em hít vào, không khí đi vào bụng. Em nghĩ sao?"
  - Lựa chọn, không chấm điểm: "True" · "Đúng"; "False" · "Sai"; "I am not sure" · "Em chưa chắc".
  - Bài bốn hỏi lại ở w2 dạng `true_false` (đáp án Sai). Bài hai dạy ý này.
- **Bộ thẻ `set: breathing`:** chưa có khoá `collectible.set.breathing`; app hiện "Thẻ" tới khi ios-dev thêm.
- **Asset:** không có audio, `asset` trong markdown; máy điền khi chạy `tts` và `assets`.
