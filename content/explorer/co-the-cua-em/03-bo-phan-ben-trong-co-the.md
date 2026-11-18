---
id: 6d5442da-139c-4f79-9610-3715e2d16e75
topic: co-the-cua-em
slug: bo-phan-ben-trong-co-the
order: 3
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Body parts on the inside
vi: Bộ phận bên trong cơ thể
> Giữ đúng tên ở `content/syllabus.json` (key `human-body-parts`, bài số ba).

## Mục tiêu
en: I can name some parts inside my body.
vi: Em gọi tên được vài bộ phận bên trong cơ thể.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 17/11/2026. Ticket SK-049. Mọi dòng `id:` để trống; chạy `ids` sau bài 2, trước bài 4.
> Sườn: lesson 3 `body-parts-on-the-inside` (`docs/oak/human-body-parts.md`). Không dùng chữ "organs" · "cơ quan" ở bất cứ đâu; dạ dày "chứa và trộn đều" thay "nghiền nhỏ"; mẹo "nhìn vào bên trong" thành hình vẽ cơ thể như trong suốt. Thêm ô tổng "Inside you" (năm ô).
> Sửa `body_parts_only_outside` ở ý chính một, ô Inside you, phần Chơi (món bẫy là bộ phận bên ngoài) và câu q6 (gắn key).
> Mỗi bộ phận chỉ "tên và một việc". Phổi chỉ "giúp em thở". Bộ não chỉ "giúp em suy nghĩ" (ví dụ thêm "ghi nhớ"). Không dây thần kinh, không "não điều khiển", không đường đi của không khí, không ruột (ranh giới với *Não bộ và giác quan*, *Hô hấp*, *Tiêu hoá*).

## Ý chính
1.en: Some body parts are inside your body.
1.vi: Có những bộ phận nằm bên trong cơ thể em.
2.en: Your heart, lungs, stomach and brain are inside.
2.vi: Tim, phổi, dạ dày và bộ não nằm bên trong.
3.en: Each inside part has its own job.
3.vi: Mỗi bộ phận bên trong làm một việc riêng.
> Từ cụ thể tới trừu tượng: điều cảm nhận được (tim đập, bụng sôi), tên bốn bộ phận bên trong và chỗ của chúng, rồi ý mỗi bộ phận có một việc riêng (nối ý chính hai của bài 2).
> Bên trong ngực nói "lồng ngực"; "bụng" là phía ngoài, "dạ dày" là bộ phận bên trong; bộ não nằm "trong đầu" (bảng Tên gọi ở `_topic.md`).

## Khởi động

> w1 ôn bài 2 (bài trước): đầu gối giúp co chân. w2 ôn *Sinh vật sống ở đâu?* bài một (chủ đề cách xa): con người là vật sống, lớn lên. Câu mới, không chép câu cũ.

### w1
id: f444c0de-084e-4c84-a5dc-404f28bb19ba
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: co-the-cua-em/bo-phan-ben-ngoai-co-the
prompt.en: Which part helps you bend your leg?
prompt.vi: Bộ phận nào giúp em co chân?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about sitting down on a chair.
hint.vi: Em nghĩ tới lúc ngồi xuống ghế nhé.
explanation_correct.en: Yes! Your knees bend when you jump, too.
explanation_correct.vi: Đúng rồi! Khi nhảy, đầu gối cũng gập lại.
explanation_wrong.en: The answer is the knee. It helps legs bend.
explanation_wrong.vi: Đáp án là đầu gối. Đầu gối giúp em co chân.

#### option w1_knee
correct: true
label.en: knee
label.vi: đầu gối
image.brief: Dùng lại hình `tray_knee` ở bài `co-the-cua-em/bo-phan-ben-ngoai-co-the`.
image.alt.en: A knee
image.alt.vi: Đầu gối

#### option w1_hand
correct: false
feedback.en: A hand holds things, like a spoon.
feedback.vi: Bàn tay cầm nắm đồ vật, như chiếc thìa.
label.en: hand
label.vi: bàn tay
image.brief: Dùng lại hình `q5_hand` ở bài `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`.
image.alt.en: A hand
image.alt.vi: Một bàn tay

### w2
id: bb9cb40e-d98a-4088-bdd4-79cf0024ac08
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/vat-song-hay-khong-song
prompt.en: People grow, like all living things.
prompt.vi: Con người lớn lên, giống như mọi vật sống.
image.brief: Dùng lại hình `explore_people` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): baby hand holding adult finger
image.alt.en: A baby's hand holding a finger
image.alt.vi: Bàn tay em bé nắm ngón tay người lớn
answer: true
hint.en: Think about when you were a baby.
hint.vi: Em nghĩ tới hồi em còn là em bé nhé.
explanation_correct.en: Yes! Babies grow into children, then grown-ups.
explanation_correct.vi: Đúng rồi! Em bé lớn lên thành bạn nhỏ, rồi thành người lớn.
explanation_wrong.en: This is true. People grow, like plants and animals.
explanation_wrong.vi: Câu này đúng. Con người lớn lên, như cây cối và con vật.
feedback_false.en: Your old clothes get too small for you.
feedback_false.vi: Quần áo cũ của em dần chật đi.
> Chỉ nói "con người lớn lên"; không nói dậy thì (để dành *Sự phát triển của con người*, Scientist). Hình bàn tay em bé cạnh ngón tay người lớn cho thấy to nhỏ khác nhau, không phải bằng chứng duy nhất.

## Học

> Năm ô: ô tổng "Inside you" (ý chính một, sửa `body_parts_only_outside`) rồi bốn bộ phận, mỗi ô một tên và một việc (ý chính hai, ba). Phiên chính chốt 17/11: bài này được năm ô.
> Ô Heart không nói "ngực" (để câu q5 là DOK 2); bé thấy chỗ của tim ở hình ô Inside you và hình ô Heart, và nghe "lồng ngực" ở ô Lungs.

### explore
id: 1e0919d4-5310-45a8-92d6-91dba5d14114
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_inside
label.en: Inside you
label.vi: Bên trong em
color: nau_dat
sentence.en: Some body parts are inside you.
sentence.vi: Có những bộ phận nằm bên trong cơ thể em.
image.brief: [hình vẽ] Một bạn nhỏ đứng nhìn thẳng, khuôn cơ thể nhạt như trong suốt kiểu sách thiếu nhi (cùng nét sơ đồ thân người `blood` ở bài `ho-hap/tho-khi-chay-nhay`); thấy đúng chỗ: bộ não trong đầu, hai lá phổi và trái tim trong lồng ngực (tim ở giữa, hơi lệch trái, phía trước, giữa hai lá phổi), dạ dày trong bụng phía trên bên trái; không vẽ ruột, gan, xương, mạch máu; màu dịu, không máu; khuôn trơn như mặc áo và quần soóc nhạt; không vẽ nét mặt; không nhãn, mũi tên, chữ.
image.alt.en: A body drawing with parts inside
image.alt.vi: Hình vẽ cơ thể, thấy các bộ phận bên trong
examples.1.en: feel your heart beat
examples.1.vi: em cảm thấy tim đập
examples.2.en: hear your tummy rumble
examples.2.vi: em nghe thấy bụng sôi ùng ục
examples.3.en: they are hidden under your skin
examples.3.vi: chúng nằm khuất dưới da em
> Hình gốc của chủ đề (từ `inside` dùng lại). Bé chỉ hình, không có nhãn chữ trên hình (SK-049 quyết định 7).
> [CẦN KIỂM] Vị trí trong hình: tim ở giữa lồng ngực, hơi lệch trái, giữa hai lá phổi; dạ dày ở bụng phía trên bên trái. Tiếng bụng sôi đến từ dạ dày và ruột, rõ hơn khi đói (ví dụ hai chỉ nói "bụng sôi", không nói bệnh).

#### group explore_heart
label.en: Heart
label.vi: Trái tim
color: do_son
sentence.en: Your heart pumps blood around your body.
sentence.vi: Tim bơm máu đi khắp cơ thể em.
image.brief: Dùng lại hình `blood` ở bài `ho-hap/tho-khi-chay-nhay`.
image.alt.en: A body drawing with blood paths to the arms and legs
image.alt.vi: Hình vẽ cơ thể, các đường máu chạy tới tay chân
examples.1.en: it beats all day and night
examples.1.vi: tim đập suốt ngày đêm
examples.2.en: feel it beat with your hand
examples.2.vi: đặt bàn tay lên, em thấy tim đập
examples.3.en: blood goes to your arms and legs
examples.3.vi: máu chảy tới cánh tay và chân em
> Không nói "ngực" ở ô này (để câu q5 là DOK 2). Nói "máu" ở câu chính và ví dụ ba (máu tới cánh tay, chân, hợp với hình `blood`); không vết thương, không bệnh tim. Không "tim đập nhanh khi chạy" (ý của *Hô hấp* bài 3, để dành *Hệ tuần hoàn*; tester 17/11 mục N3).
> `alt.en` gốc mười từ (chép đúng `alt` gốc của *Hô hấp*); `alt` chỉ là nhãn VoiceOver, không phải câu app đọc. `alt.vi` gốc có chữ "tay chân" (cụm quen chỉ tay và chân), giữ như gốc.
> [CẦN KIỂM] Tim bơm máu đi khắp cơ thể, tới cả cánh tay và chân, đập suốt ngày đêm. Đường máu đỏ và xanh trong hình `blood` là quy ước vẽ; máu trong cơ thể không có màu xanh.

#### group explore_breathe
label.en: Lungs
label.vi: Phổi
color: cham
sentence.en: Your lungs help you breathe.
sentence.vi: Phổi giúp em thở.
image.brief: Dùng lại hình `explore_lungs` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A body drawing with the lungs coloured
image.alt.vi: Hình vẽ cơ thể, tô màu hai lá phổi
examples.1.en: two lungs in your chest
examples.1.vi: hai lá phổi trong lồng ngực
examples.2.en: you breathe even when you sleep
examples.2.vi: cả lúc ngủ, em vẫn thở
examples.3.en: you breathe when you talk and sing
examples.3.vi: em thở cả khi nói và khi hát
> Chỉ "giúp em thở" (SK-049). Không hít vào thở ra, không đường đi của không khí, không xương sườn (để dành *Hô hấp*).

#### group explore_food
label.en: Stomach
label.vi: Dạ dày
color: vang_hoe
sentence.en: Your stomach holds and mixes your food.
sentence.vi: Dạ dày chứa thức ăn và trộn đều thức ăn.
image.brief: [hình vẽ] Cùng sơ đồ thân trên gốc của `explore_lungs` ở bài `ho-hap/duong-di-cua-khong-khi` (bạn nhỏ nhìn thẳng), bản tô màu dạ dày: thực quản và dạ dày tô nâu đất, mọi phần khác nhạt; không chữ, không mũi tên.
image.alt.en: A body drawing with the stomach coloured
image.alt.vi: Hình vẽ cơ thể, tô màu dạ dày
examples.1.en: food goes down from your mouth
examples.1.vi: thức ăn đi từ miệng xuống
examples.2.en: it is inside your tummy
examples.2.vi: dạ dày nằm trong bụng em
examples.3.en: it mixes rice, fish and vegetables
examples.3.vi: dạ dày trộn đều cơm, cá và rau
> Hình gốc của chủ đề (từ `stomach` dùng lại). Bản tô thêm của sơ đồ đường thở *Hô hấp* (cùng khuôn với ô Lungs).
> [CẦN KIỂM] Dạ dày co bóp trộn thức ăn với dịch vị; tiêu hoá còn ở ruột non (bài không nói dạ dày làm hết, không nói "nghiền nhỏ"); dạ dày nằm ở bụng phía trên bên trái.

#### group explore_brain
label.en: Brain
label.vi: Bộ não
color: gi_dong
sentence.en: Your brain helps you think.
sentence.vi: Bộ não giúp em suy nghĩ.
image.brief: Dùng lại hình `explore_head` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: A head with the brain inside the skull
image.alt.vi: Đầu một bạn nhỏ, bộ não nằm trong hộp sọ
examples.1.en: it is inside your head
examples.1.vi: bộ não nằm trong đầu em
examples.2.en: a hard skull keeps it safe
examples.2.vi: hộp sọ cứng che chở bộ não
examples.3.en: it helps you remember things
examples.3.vi: bộ não giúp em ghi nhớ
> Không "não điều khiển cơ thể", không dây thần kinh (để dành *Não bộ và giác quan*). "Hộp sọ" chỉ ở ví dụ này.

### new_words
id: 61e41edb-cade-4ee0-8600-b61122733fc0
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: heart, lungs, stomach

## Chơi

> Bé tìm ba bộ phận bên trong: một trong đầu (bộ não), một trong lồng ngực (tim hoặc phổi), một trong bụng (dạ dày). Đạt khi đủ ba nhóm và không chọn bộ phận bên ngoài.
> Món bẫy là bộ phận bên ngoài, cùng chỗ với nhóm bắt buộc (tai, mũi ở đầu như bộ não; bàn tay): bé phải nghĩ trong hay ngoài (sửa `body_parts_only_outside`). Bảy món, cả kệ hình vẽ cùng nét, nền kem.

### tray
id: 9bfc8972-683b-42cb-a190-ad1ae0fb896c
type: build_tray
version: 1
prompt.en: Find three parts inside your body
prompt.vi: Tìm ba bộ phận ở bên trong cơ thể em
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find one in your head, chest and tummy.
messages.start.vi: Em tìm một bộ phận trong đầu, một trong lồng ngực, một trong bụng nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! They are all hidden inside you.
messages.balanced.vi: Tuyệt! Cả ba đều nằm bên trong cơ thể em.
messages.has_limited.en: You can see that one outside.
messages.has_limited.vi: Bộ phận này ở bên ngoài, em nhìn thấy được.
messages.missing.tray_head.en: You still need a part in your head.
messages.missing.tray_head.vi: Em còn thiếu một bộ phận trong đầu.
messages.missing.tray_chest.en: You still need a part in your chest.
messages.missing.tray_chest.vi: Em còn thiếu một bộ phận trong lồng ngực.
messages.missing.tray_tummy.en: You still need a part in your tummy.
messages.missing.tray_tummy.vi: Em còn thiếu một bộ phận trong bụng.
> Lời nhắn `has_limited` đúng với cả ba món bẫy (tai, mũi, bàn tay đều ở bên ngoài, nhìn thấy được).

#### group tray_head
label.en: In your head
label.vi: Trong đầu
color: gi_dong
role: required

#### group tray_chest
label.en: In your chest
label.vi: Trong lồng ngực
color: cham
role: required

#### group tray_tummy
label.en: In your tummy
label.vi: Trong bụng
color: vang_hoe
role: required

#### group tray_outside
label.en: On the outside
label.vi: Ở bên ngoài
color: do_son
role: limit

#### item tray_brain
label.en: Brain
label.vi: Bộ não
group: tray_head
image.brief: Dùng lại hình `q2_brain` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: A brain
image.alt.vi: Bộ não

#### item tray_ear
label.en: Ear
label.vi: Tai
group: tray_outside
image.brief: Dùng lại hình `w1_ear` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: An ear
image.alt.vi: Một cái tai

#### item tray_heart
label.en: Heart
label.vi: Trái tim
group: tray_chest
image.brief: Dùng lại hình `tray_heart` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A heart
image.alt.vi: Trái tim
> Key món trùng key hình gốc của *Hô hấp*; `brief` ghi đủ "ở bài" để trỏ đúng hình gốc.

#### item tray_nose
label.en: Nose
label.vi: Mũi
group: tray_outside
image.brief: Dùng lại hình `tray_nose` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A nose
image.alt.vi: Cái mũi

#### item tray_stomach
label.en: Stomach
label.vi: Dạ dày
group: tray_tummy
image.brief: Dùng lại hình `tray_stomach` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A stomach
image.alt.vi: Dạ dày

#### item tray_hand
label.en: Hand
label.vi: Bàn tay
group: tray_outside
image.brief: Dùng lại hình `q5_hand` ở bài `nao-bo-va-giac-quan/day-than-kinh-truyen-tin`.
image.alt.en: A hand
image.alt.vi: Một bàn tay

#### item tray_lungs
label.en: Lungs
label.vi: Phổi
group: tray_chest
image.brief: Dùng lại hình `tray_lungs` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: Two lungs
image.alt.vi: Hai lá phổi

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q3, q5; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ).
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính. Mọi lựa chọn và thẻ của một câu là hình vẽ cùng nét. Thứ tự `#### option` theo bảng Vị trí đáp án ở `_topic.md`.

### q1
id: aec8f3c2-5dc1-45f7-b4a8-b1bd10c1ed69
format: single_choice
version: 1
dok: 1
prompt.en: Which part helps you think?
prompt.vi: Bộ phận nào giúp em suy nghĩ?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about doing a jigsaw puzzle.
hint.vi: Em nghĩ tới lúc em ghép tranh nhé.
explanation_correct.en: Yes! Your brain helps you remember, too.
explanation_correct.vi: Đúng rồi! Bộ não còn giúp em ghi nhớ.
explanation_wrong.en: The answer is the brain. Your brain helps you think.
explanation_wrong.vi: Đáp án là bộ não. Bộ não giúp em suy nghĩ.
> DOK 1: nhớ lại câu chính ô Brain.

#### option q1_brain
correct: true
label.en: brain
label.vi: bộ não
image.brief: Dùng lại hình `q2_brain` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: A brain
image.alt.vi: Bộ não

#### option q1_stomach
correct: false
feedback.en: Your stomach holds the food you eat.
feedback.vi: Dạ dày chứa thức ăn em ăn vào.
label.en: stomach
label.vi: dạ dày
image.brief: Dùng lại hình `tray_stomach` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A stomach
image.alt.vi: Dạ dày

#### option q1_lungs
correct: false
feedback.en: Your lungs help you breathe.
feedback.vi: Phổi giúp em thở.
label.en: lungs
label.vi: phổi
image.brief: Dùng lại hình `tray_lungs` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: Two lungs
image.alt.vi: Hai lá phổi

### q2
id: 1095d644-5ff9-4fbe-ab07-fa0e751d028c
format: true_false
version: 1
dok: 1
prompt.en: Your stomach is inside your tummy.
prompt.vi: Dạ dày nằm bên trong bụng em.
image.brief: Dùng lại hình `tray_stomach` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A stomach
image.alt.vi: Dạ dày
answer: true
hint.en: Think where food goes when you swallow.
hint.vi: Em nghĩ xem nuốt xong, thức ăn đi đâu nhé.
explanation_correct.en: Yes! Food goes down into your stomach.
explanation_correct.vi: Đúng rồi! Thức ăn đi xuống dạ dày em.
explanation_wrong.en: This is true. Your stomach is in your tummy.
explanation_wrong.vi: Câu này đúng. Dạ dày nằm trong bụng em.
feedback_false.en: Your tummy feels full after a big meal.
feedback_false.vi: Ăn no xong, em thấy bụng căng tròn.
> DOK 1: nhớ lại ví dụ ô Stomach ("it is inside your tummy"). Hình là dạ dày vẽ riêng, không thấy chỗ trên cơ thể, nên không làm bằng chứng. "Bụng" là phía ngoài, "dạ dày" là bộ phận bên trong.

### q3
id: 3d5548e2-2e9a-4b3e-9eb7-4beced466806
format: single_choice
version: 1
dok: 1
prompt.en: Which part do you breathe with?
prompt.vi: Em thở bằng bộ phận nào?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about blowing up a balloon.
hint.vi: Em nghĩ tới lúc thổi bóng bay nhé.
explanation_correct.en: Yes! Your lungs are inside your chest.
explanation_correct.vi: Đúng rồi! Phổi nằm trong lồng ngực em.
explanation_wrong.en: The answer is the lungs. They help you breathe.
explanation_wrong.vi: Đáp án là phổi. Phổi giúp em thở.
> DOK 1: nhớ lại câu chính ô Lungs.

#### option q3_heart
correct: false
feedback.en: Your heart pumps blood around your body.
feedback.vi: Tim bơm máu đi khắp cơ thể em.
label.en: heart
label.vi: trái tim
image.brief: Dùng lại hình `tray_heart` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A heart
image.alt.vi: Trái tim

#### option q3_lungs
correct: true
label.en: lungs
label.vi: phổi
image.brief: Dùng lại hình `tray_lungs` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: Two lungs
image.alt.vi: Hai lá phổi

#### option q3_brain
correct: false
feedback.en: Your brain helps you think and remember.
feedback.vi: Bộ não giúp em suy nghĩ và ghi nhớ.
label.en: brain
label.vi: bộ não
image.brief: Dùng lại hình `q2_brain` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: A brain
image.alt.vi: Bộ não

### q4
id: 559b2577-ff0b-4ae3-a1cc-e9863468d1fa
format: order_sequence
version: 1
dok: 2
prompt.en: Order how food goes into you.
prompt.vi: Xếp thứ tự thức ăn đi vào cơ thể em.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_banana, q4_mouth, q4_stomach
hint.en: Think where food goes in first.
hint.vi: Em nghĩ xem thức ăn vào chỗ nào trước tiên nhé.
explanation_correct.en: Yes! Then your stomach mixes the food.
explanation_correct.vi: Đúng rồi! Rồi dạ dày trộn đều thức ăn.
explanation_wrong.en: The order is banana, mouth, then stomach.
explanation_wrong.vi: Thứ tự là quả chuối, miệng, rồi dạ dày.
> DOK 2: bé áp ví dụ ô Stomach ("food goes down from your mouth") vào một món ăn cụ thể và xếp ba bước. Đúng một thứ tự (thức ăn, rồi miệng, rồi dạ dày); không có bước sau dạ dày (ruột để dành *Tiêu hoá*). Gợi ý chỉ nhắc một đầu dải. Thẻ trong file không theo thứ tự đúng.
> Ba thẻ cùng là hình vẽ (quả chuối lấy hình vẽ của Discoverer, không lấy ảnh nải chuối).

#### item q4_stomach
label.en: stomach
label.vi: dạ dày
image.brief: Dùng lại hình `tray_stomach` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A stomach
image.alt.vi: Dạ dày

#### item q4_banana
label.en: banana
label.vi: quả chuối
image.brief: Dùng lại hình `q5_banana` ở bài `nao-bo-va-giac-quan/giac-quan-gui-tin-ve-nao`. Từ khoá tìm ảnh (EN): single ripe banana plain background
image.alt.en: A ripe banana
image.alt.vi: Quả chuối chín

#### item q4_mouth
label.en: mouth
label.vi: miệng
image.brief: Dùng lại hình `tray_mouth` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A mouth
image.alt.vi: Cái miệng

### q5
id: 4816380b-6b2b-44f1-932b-9d74e2ce5a02
format: single_choice
version: 1
dok: 2
prompt.en: Where can you feel your heart beat?
prompt.vi: Em cảm thấy tim đập ở chỗ nào?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think where the drawing shows your heart.
hint.vi: Em nghĩ xem hình vẽ cho thấy tim ở chỗ nào nhé.
explanation_correct.en: Yes! Your heart sits between your lungs.
explanation_correct.vi: Đúng rồi! Tim nằm giữa hai lá phổi.
explanation_wrong.en: The answer is the chest. Your heart is there.
explanation_wrong.vi: Đáp án là ngực. Tim nằm trong lồng ngực.
> DOK 2: ô Heart không nói "ngực"; bé suy ra từ hình ô Inside you (tim giữa hai lá phổi), ví dụ ô Lungs ("two lungs in your chest") và nhóm "In your chest" của kệ Chơi. Gợi ý trỏ tới hình vẽ ô Inside you (bằng chứng), không chứa chữ "ngực" và không trỏ tới ví dụ "two lungs in your chest" (tester 17/11 mục N4).
> Ba lựa chọn là cùng khuôn người nhìn nghiêng, tô ba vùng khác nhau (đầu, bụng, ngực): khác nhau rõ bằng mắt. `alt` của đáp án không có chữ "heart".
> [CẦN KIỂM] Tim nằm trong lồng ngực, ở giữa hơi lệch trái, giữa hai lá phổi; đặt bàn tay lên ngực thì cảm thấy tim đập.

#### option q5_head
correct: false
feedback.en: Your brain is inside your head.
feedback.vi: Bộ não nằm trong đầu em.
label.en: head
label.vi: đầu
image.brief: Dùng lại hình `q1_head` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: A child, the head shaded yellow
image.alt.vi: Bạn nhỏ, phần đầu tô màu vàng

#### option q5_tummy
correct: false
feedback.en: Your stomach is inside your tummy.
feedback.vi: Dạ dày nằm trong bụng em.
label.en: tummy
label.vi: bụng
image.brief: Dùng lại hình `q1_tummy` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: A child, the tummy shaded yellow
image.alt.vi: Bạn nhỏ, phần bụng tô màu vàng

#### option q5_chest
correct: true
label.en: chest
label.vi: ngực
image.brief: Dùng lại hình `q1_chest` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: A child, the chest shaded yellow
image.alt.vi: Bạn nhỏ, phần ngực tô màu vàng

### q6
id: 3aded637-59da-402f-9490-8d56987a35eb
format: true_false
version: 1
dok: 2
misconception: body_parts_only_outside
prompt.en: All your body parts are on the outside.
prompt.vi: Mọi bộ phận cơ thể em đều ở bên ngoài.
image.brief: Dùng lại hình `q1` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: A child seen from the side
image.alt.vi: Một bạn nhỏ nhìn nghiêng
answer: false
hint.en: Think about your tummy when you are hungry.
hint.vi: Em nghĩ tới cái bụng lúc em đói nhé.
explanation_correct.en: Your heart and lungs are inside your body.
explanation_correct.vi: Tim và phổi nằm bên trong cơ thể em.
explanation_wrong.en: This is false. Some parts are inside you.
explanation_wrong.vi: Câu này sai. Có những bộ phận nằm bên trong em.
feedback_true.en: Your brain is hidden inside your skull.
feedback_true.vi: Bộ não nằm khuất trong hộp sọ.
> Câu misconception (`body_parts_only_outside`), bằng hình, DOK 2: bé còn nghĩ "bộ phận nào cũng nhìn thấy được" sẽ chạm gật đầu. Câu chỉ kiểm một việc: có bộ phận nằm bên trong không. Gợi ý trỏ tới bằng chứng cảm nhận được (bụng sôi khi đói), không trỏ tới ô Inside you.
> Hình là khuôn người nhìn nghiêng không tô, không thấy bộ phận bên trong: không đẩy bé về phía nào. `explanation_correct` đứng một mình được: "All your body parts are on the outside." → "Your heart and lungs are inside your body.".

## Từ vựng

### heart
id: e21e0f71-d70f-4442-afae-241d65f433a9
tier: core
term.en: heart
term.vi: trái tim
example.en: Your heart beats all day and night.
example.vi: Tim em đập suốt ngày đêm.
image.brief: Dùng lại hình `tray_heart` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A heart
image.alt.vi: Trái tim

### lungs
id: 7b2c490e-dbd7-4a96-a6dc-58d86eabe3da
tier: core
term.en: lungs
term.vi: phổi
example.en: Your lungs are inside your chest.
example.vi: Phổi nằm trong lồng ngực em.
image.brief: Dùng lại hình `explore_lungs` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A body drawing with the lungs coloured
image.alt.vi: Hình vẽ cơ thể, tô màu hai lá phổi

### stomach
id: 839193fd-64d9-4abf-ae7a-442fa5244406
tier: core
term.en: stomach
term.vi: dạ dày
example.en: My stomach is full after lunch.
example.vi: Ăn trưa xong, dạ dày em đầy thức ăn.
image.brief: Dùng lại hình `explore_food`.
image.alt.en: A body drawing with the stomach coloured
image.alt.vi: Hình vẽ cơ thể, tô màu dạ dày

### brain
id: 1a1c4cba-ae8a-4f43-99e6-589a9777aba6
tier: extra
term.en: brain
term.vi: bộ não
example.en: My brain helps me learn new words.
example.vi: Bộ não giúp em học từ mới.
image.brief: Dùng lại hình `q2_brain` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`.
image.alt.en: A brain
image.alt.vi: Bộ não

### inside
id: 7cebd1e5-3f46-4e2b-97d0-fbab661116da
tier: extra
term.en: inside
term.vi: bên trong
example.en: Your heart is inside your body.
example.vi: Tim nằm bên trong cơ thể em.
image.brief: Dùng lại hình `explore_inside`.
image.alt.en: A body drawing with parts inside
image.alt.vi: Hình vẽ cơ thể, thấy các bộ phận bên trong

## Thưởng

### heart_card
id: 59e06d6f-e3e1-434b-9d8a-23d6ef6018c7
set: body
rarity: rare
name.en: Heart
name.vi: Trái tim
tag.en: Pumps blood all day
tag.vi: Bơm máu suốt ngày đêm
fact.en: Make a fist. Your heart is that big.
fact.vi: Em nắm bàn tay lại. Tim em to cỡ chừng ấy.
image.brief: Dùng lại hình `tray_heart` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A heart
image.alt.vi: Trái tim
> [CẦN KIỂM] Tim của mỗi người to cỡ nắm tay của chính người đó.
> Bộ `set: body` đã có; thẻ Trái tim chưa có. Hiếm (`rare`) theo bảng Thẻ thưởng ở `_topic.md`.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn hình vẽ gần thực tế, kiểu sách thiếu nhi, màu dịu, cùng nét, nền kem với bộ cơ quan của *Hô hấp* (`tray_heart`, `tray_lungs`, `tray_stomach`, sơ đồ thân trên `explore_lungs`, sơ đồ máu `blood`) và bộ khuôn người, bộ giác quan của *Não bộ và giác quan*. Riêng ảnh câu w2 (bàn tay em bé) và hàng rào tre là ảnh chụp. Không ảnh nội tạng thật, không ảnh mổ, không X-quang, không máu chảy, không nhãn số, không chữ, không mũi tên (SK-049 quyết định 5). Tim là hình tim thật, không phải biểu tượng trái tim.
- **Hình vẽ mới (hai):** `explore_inside` (bạn nhỏ nhìn thẳng, cơ thể như trong suốt, thấy bộ não, hai lá phổi, trái tim, dạ dày đúng chỗ; khuôn trơn như mặc áo và quần soóc nhạt; dùng ở ô Học và thẻ từ 2:1), `explore_food` (bản tô dạ dày của sơ đồ thân trên gốc `explore_lungs` ở *Hô hấp*; dùng ở ô Học và thẻ từ 2:1). Cả hai là hình gốc của chủ đề.
- **Hình dùng lại:** *Hô hấp*: `blood` (ô Heart), `explore_lungs` (ô Lungs, từ `lungs`), `tray_heart` (món Chơi, q3, từ `heart`, thẻ thưởng), `tray_lungs` (món Chơi, q1, q3), `tray_stomach` (món Chơi, q1, q2, q4), `tray_nose` (món Chơi), `tray_mouth` (q4). *Não bộ và giác quan*: `explore_head` (ô Brain), `q2_brain` (món Chơi, q1, q3, từ `brain`), `w1_ear` (món Chơi), `q5_hand` (món Chơi, w1), `q1_head`, `q1_tummy`, `q1_chest` (q5), `q1` (q6), `q5_banana` (q4). Bài 2 chủ đề này: `tray_knee` (w1). *Gọi tên và nhóm động vật*: `w1` hàng rào tre (hình câu w1, q1, q3, q4, q5), `explore_people` (w2).
- **Khung:** hình vẽ của Discoverer (1024×768, nền kem) dùng ở thẻ ba lựa chọn 5:2, thẻ hai lựa chọn 17:10 (w1), thẻ từ 2:1: làm mục riêng đệm nền kem hai bên, không cắt mất bộ phận. Thẻ `order_sequence` và món Chơi vuông. Hình câu `true_false` (q2 dạ dày, q6 khuôn người) khung 4:3.
- **Nếu lệch khung ô Học:** năm ô trộn ba hình dùng lại (thân người có tim và đường máu, sơ đồ thân trên tô phổi, đầu có bộ não nhìn nghiêng) với hai hình vẽ mới. Nếu designer thấy lệch, phương án thay là một bộ năm hình cùng khuôn `explore_inside` (bản gốc và bốn bản tô tim, phổi, dạ dày, não), thêm ba hình vẽ mới; báo phiên chính trước khi đổi.
- **Màu:** Học: Inside you `nau_dat`, Heart `do_son`, Lungs `cham`, Stomach `vang_hoe`, Brain `gi_dong`. Chơi: Trong đầu `gi_dong`, Trong lồng ngực `cham`, Trong bụng `vang_hoe`, Ở bên ngoài `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` năm nhóm + `word_list` (heart, lungs, stomach). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Đúng). Quiz `single_choice` (q1, q3, q5; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`body_parts_only_outside`). Không có `labels` ở câu `true_false`.
- **Thứ tự đúng `order_sequence` q4:** `q4_banana`, `q4_mouth`, `q4_stomach` (thẻ trong file: `q4_stomach`, `q4_banana`, `q4_mouth`).
- **Vị trí đáp án:** app xáo lựa chọn (SK-047). Thứ tự trong file theo bảng ở `_topic.md`: w1 chỗ một (trên hai), q1 chỗ một, q3 chỗ hai, q5 chỗ ba.
- **Màn Chơi, ví dụ để kiểm:** Bộ não, Trái tim, Dạ dày → `balanced`; Bộ não, Phổi, Tai → `has_limited`; Trái tim, Phổi, Dạ dày → `missing.tray_head`; Mũi, Trái tim, Dạ dày → `has_limited`.
- **Khởi động:** w1 → `co-the-cua-em/bo-phan-ben-ngoai-co-the` (bài 2; cần chạy `ids` cho bài 2 trước, nếu không `validate` báo `md_ref_unknown` "chưa có id"), w2 → `sinh-vat-song-o-dau/vat-song-hay-khong-song` (đã có id).
- **Năm ô Học** (phiên chính chốt 17/11); `est_minutes` vẫn 6 (Còn mở 3 ở `_topic.md`).
- **Từ EN có thể ngoài Starters/Movers:** heart, lungs, stomach, brain, skull, blood, pumps, breathe, rumble, hidden, mixes, swallow, chest, tummy, jigsaw puzzle, balloon, fist, grown-ups. Nghe thử giọng EN "lungs", "stomach", "rumble"; giọng VI "lồng ngực", "ùng ục", "dạ dày".
