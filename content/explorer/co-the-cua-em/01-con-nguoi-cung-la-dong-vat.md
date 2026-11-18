---
id: a97a94ad-607f-4c22-a238-8ab0d37f34f5
topic: co-the-cua-em
slug: con-nguoi-cung-la-dong-vat
order: 1
stage: opener
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Humans are animals
vi: Con người cũng là động vật
> Giữ đúng tên ở `content/syllabus.json` (key `human-body-parts`, bài số một).

## Mục tiêu
en: I can say why people are animals.
vi: Em nói được vì sao con người cũng là động vật.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 17/11/2026. Ticket SK-049. Mọi dòng `id:` để trống; chạy `ids` sau `_topic.md`, trước bài 2.
> Sườn: lesson 1 `humans-are-animals` (`docs/oak/human-body-parts.md`). Chỉ lấy mục tiêu, ý chính, từ khoá, misconception; câu, hình, ví dụ, câu quiz là bản viết mới. Không dùng "máu nóng", "đẻ con" làm dấu hiệu của động vật có vú.
> Bài mở chủ đề. Sửa `humans_not_animals` ở ý chính ba, ô Mammals và ô People, nhóm People bắt buộc ở phần Chơi, câu q4 và câu q6 (gắn key).

## Ý chính
1.en: Animals need food, water and air.
1.vi: Con vật cần thức ăn, nước và không khí.
2.en: Animals with the same features form groups.
2.vi: Con vật có đặc điểm giống nhau thì xếp chung một nhóm.
3.en: People are animals. We are mammals.
3.vi: Con người cũng là động vật. Chúng mình là động vật có vú.
> Từ cụ thể tới trừu tượng: điều con vật cần (thấy được), xếp nhóm theo đặc điểm, rồi bé tự xếp mình vào nhóm động vật có vú.
> [CẦN KIỂM] Con vật nào cũng cần thức ăn, nước và không khí (cách nói lớp một).
> [CẦN KIỂM] Mọi động vật có vú cho con bú sữa và có lông hoặc tóc ở một lúc nào đó trong đời (cá voi, cá heo lông rất ít); "đẻ con" có ngoại lệ (thú mỏ vịt, thú lông nhím), bài không dùng.

## Khởi động

> Hai câu, cả hai ôn *Gọi tên và nhóm động vật* (mốc dài) vì đây là bài đầu của chủ đề: w1 ôn động vật có vú (bài hai: bú sữa, không đẻ trứng), w2 ôn bộ phận cơ thể con vật (bài năm: vòi voi). Hai ý này là nền của bài 1 và bài 2. Câu mới, không chép câu cũ của chủ đề đó.

### w1
id: 417c3445-1e9f-4ced-84fa-92d24b0ee737
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/dong-vat-co-vu
prompt.en: A mother dog lays eggs.
prompt.vi: Chó mẹ đẻ trứng.
image.brief: Dùng lại hình `explore_pets` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): yellow dog lying porch Vietnam
image.alt.en: A dog lying on the floor
image.alt.vi: Chú chó nằm trên sàn nhà
answer: false
hint.en: Think about which group a dog is in.
hint.vi: Em nghĩ xem con chó thuộc nhóm nào nhé.
explanation_correct.en: A mother dog has puppies, not eggs.
explanation_correct.vi: Chó mẹ đẻ ra chó con, không đẻ trứng.
explanation_wrong.en: This is false. A mother dog has puppies.
explanation_wrong.vi: Câu này sai. Chó mẹ đẻ ra chó con.
feedback_true.en: Puppies drink milk from their mother.
feedback_true.vi: Chó con bú sữa của chó mẹ.
> Câu khẳng định, đáp án Sai. `explanation_correct` đứng một mình được (thẻ "Ý sai → Ý đúng"). Gợi ý trỏ tới nhóm của con chó (cách nghĩ), phản hồi nói chuyện bú sữa (bằng chứng); hai câu không lặp ý.
> [CẦN KIỂM] Chó đẻ ra chó con, chó con bú sữa mẹ.

### w2
id: baca2ace-0bc4-4e44-b206-33474a008e3f
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/co-the-cac-con-vat
prompt.en: Which animal uses its trunk to eat?
prompt.vi: Con nào dùng vòi để lấy thức ăn?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look closely at each animal's face.
hint.vi: Em nhìn kỹ phần mặt của từng con vật nhé.
explanation_correct.en: Yes! Its trunk picks up grass and fruit.
explanation_correct.vi: Đúng rồi! Vòi voi nhặt cỏ và hoa quả.
explanation_wrong.en: The answer is the elephant. It has a trunk.
explanation_wrong.vi: Đáp án là con voi. Voi có cái vòi dài.
> Hình câu hỏi là hàng rào tre trung tính (app Explorer ẩn hình câu hỏi khi mọi lựa chọn có hình). Câu tự đủ nghĩa khi chỉ nghe.

#### option w2_elephant
correct: true
label.en: elephant
label.vi: con voi
image.brief: Dùng lại hình `explore_big_small` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): Asian elephant standing in water
image.alt.en: An elephant in the water
image.alt.vi: Con voi dưới nước

#### option w2_buffalo
correct: false
feedback.en: A buffalo eats grass with its mouth.
feedback.vi: Con trâu ăn cỏ bằng miệng.
label.en: buffalo
label.vi: con trâu
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu
> `alt` riêng (bảng "`alt` riêng" ở `_topic.md`): `alt` gốc "An animal with two curved horns" tả lựa chọn của câu bài khủng long; các chủ đề Explorer đều dùng "A water buffalo" · "Con trâu".

## Học

> Bốn ô, từ cụ thể tới trừu tượng: điều con vật cần (con trâu uống nước), xếp nhóm theo đặc điểm (gà có lông vũ, cá có vây), nhóm động vật có vú (mèo, trâu, con người), rồi con người là động vật.
> Ô Mammals và ô People mang ý sửa `humans_not_animals`: câu chính ô Mammals đặt con người cạnh mèo và trâu; câu chính ô People nói thẳng "chúng mình cũng là động vật".

### explore
id: 4a9f8826-7499-4a21-8b2f-8b9d908a8479
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_needs
label.en: Needs
label.vi: Cần để sống
color: nau_dat
sentence.en: Animals need food, water and air.
sentence.vi: Con vật cần thức ăn, nước và không khí.
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu
examples.1.en: a buffalo drinks from a stream
examples.1.vi: con trâu uống nước bên suối
examples.2.en: a hen eats rice grains
examples.2.vi: con gà ăn thóc
examples.3.en: animals breathe air all the time
examples.3.vi: con vật lúc nào cũng thở không khí
> `alt` riêng như câu w2. Brief gốc tả "con trâu đen cúi uống nước bên bờ suối", nên ví dụ bắt buộc "a buffalo drinks from a stream" giữ nguyên (designer vẫn kiểm lại ảnh, mục Đề xuất designer số bốn ở `_topic.md`).

#### group explore_sort
label.en: Groups
label.vi: Xếp nhóm
color: cham
sentence.en: Animals with the same features form groups.
sentence.vi: Con vật có đặc điểm giống nhau thì xếp chung một nhóm.
image.brief: Dùng lại hình `explore_animals` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): hen with chicks pecking yard
image.alt.en: A hen and chicks looking for food
image.alt.vi: Gà mẹ và gà con tìm thức ăn
examples.1.en: birds have feathers
examples.1.vi: chim có lông vũ
examples.2.en: fish have fins
examples.2.vi: cá có vây
examples.3.en: mammals have hair or fur
examples.3.vi: động vật có vú có lông hoặc có tóc
> Chỉ ba nhóm bé đã học ở chủ đề số một (chim, cá, động vật có vú); không kể đủ sáu nhóm, không hỏi tên kỹ năng "xếp nhóm" (lệch sườn, `_topic.md` mục Lệch so với sườn).

#### group explore_mammals
label.en: Mammals
label.vi: Động vật có vú
color: vang_hoe
sentence.en: Cats, buffaloes and people are mammals.
sentence.vi: Mèo, trâu và con người đều là động vật có vú.
image.brief: [ảnh] Bàn tay người (ưu tiên tay trẻ em) vuốt nhẹ lưng một con mèo đang nằm, chụp gần, chỉ thấy bàn tay, cổ tay và con mèo, rõ bộ lông; không thấy mặt người, không vòng cổ có chữ, không có chữ. Ảnh ngang có khoảng trống quanh con mèo (dùng ở ô Học và thẻ từ 2:1). Từ khoá tìm ảnh (EN): hand stroking cat; child hand petting cat
image.alt.en: A hand stroking a cat
image.alt.vi: Bàn tay vuốt lưng con mèo
examples.1.en: a cat has soft fur
examples.1.vi: con mèo có bộ lông mềm
examples.2.en: you have hair on your head
examples.2.vi: em có tóc trên đầu
examples.3.en: kittens and babies drink milk
examples.3.vi: mèo con và em bé đều bú sữa mẹ
> Hình gốc của chủ đề (từ `mammal` dùng lại). Ảnh có cả người và con mèo: một hình cho ý "người và mèo cùng nhóm".
> [CẦN KIỂM] Mèo, trâu, con người đều là động vật có vú: có lông hoặc tóc, lúc bé bú sữa mẹ.

#### group explore_humans
label.en: People
label.vi: Con người
color: gi_dong
sentence.en: We are animals, just like cats.
sentence.vi: Chúng mình cũng là động vật, như con mèo.
image.brief: [ảnh] Một bạn nhỏ nhìn từ phía sau, thấy rõ đầu, tóc, vai và áo; không thấy mặt; nền thiên nhiên đơn giản; không chữ, không logo. Ảnh ngang, người ở giữa (dùng ở ô Học 1:1, món Chơi vuông và ô tròn, hình câu q2 khung 4:3, thẻ từ 2:1). Từ khoá tìm ảnh (EN): child seen from behind; boy back view hair
image.alt.en: A child seen from behind
image.alt.vi: Một bạn nhỏ nhìn từ phía sau
examples.1.en: we eat and drink every day
examples.1.vi: mỗi ngày mình ăn và uống
examples.2.en: we breathe air, like cats
examples.2.vi: mình thở không khí, như con mèo
examples.3.en: we are in the mammal group
examples.3.vi: mình ở trong nhóm động vật có vú
> Hình gốc của chủ đề (câu q2, món Chơi `tray_person`, từ `human` dùng lại). Câu chính viết "We are animals" (không "Humans are animals"): câu cho bé dùng "we", "people" (bảng Tên gọi).

### new_words
id: ae8a575f-66c6-44bf-8ac0-83e2dabefe7e
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: human, feature

## Chơi

> Bé chọn ba loài động vật có lông hoặc có tóc: một thú cưng (mèo, chó), một vật nuôi trong chuồng (trâu), và con người. Đạt khi đủ ba nhóm và không chọn con nào không có lông, không có tóc.
> Nhóm People bắt buộc: muốn đạt, bé phải đặt con người cạnh mèo và trâu (sửa `humans_not_animals`). Món bẫy là con vật bé quen nhưng không có lông hay tóc (cá chép, ếch, thằn lằn); không có con chim (chữ "lông" trong tiếng Việt). Bảy món, cả kệ ảnh chụp.

### tray
id: e77c4a9b-d479-40b8-a642-5dfee179287e
type: build_tray
version: 1
prompt.en: Pick three animals with hair or fur
prompt.vi: Chọn ba loài động vật có lông hoặc có tóc
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find a pet, a farm animal and people.
messages.start.vi: Em tìm một thú cưng, một vật nuôi trong chuồng và con người nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! They are all mammals, like you.
messages.balanced.vi: Tuyệt! Cả ba đều là động vật có vú, giống em.
messages.has_limited.en: That one has no hair or fur.
messages.has_limited.vi: Con này không có lông, cũng không có tóc.
messages.missing.tray_pet.en: You still need a pet.
messages.missing.tray_pet.vi: Em còn thiếu một thú cưng.
messages.missing.tray_farm.en: You still need a farm animal.
messages.missing.tray_farm.vi: Em còn thiếu một vật nuôi trong chuồng.
messages.missing.tray_people.en: You still need people. People are mammals, too.
messages.missing.tray_people.vi: Em còn thiếu con người. Con người cũng là động vật có vú.
> Lời nhắn `has_limited` đúng với cả ba món bẫy (cá chép có vảy, ếch da trơn, thằn lằn có vảy).

#### group tray_pet
label.en: Pet
label.vi: Thú cưng
color: vang_hoe
role: required

#### group tray_farm
label.en: Farm animal
label.vi: Vật nuôi trong chuồng
color: gi_dong
role: required

#### group tray_people
label.en: People
label.vi: Loài người
color: cham
role: required
> Nhãn VI nhóm là "Loài người" để không đọc trùng nhãn món `tray_person` "Con người" trên cùng màn (tester 17/11 mục n9).

#### group tray_no_hair
label.en: No hair or fur
label.vi: Không có lông hay tóc
color: do_son
role: limit

#### item tray_cat
label.en: Cat
label.vi: Con mèo
group: tray_pet
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

#### item tray_carp
label.en: Carp
label.vi: Cá chép
group: tray_no_hair
image.brief: Dùng lại hình `explore_fish` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): common carp swimming underwater side view
image.alt.en: A carp swimming
image.alt.vi: Con cá chép đang bơi

#### item tray_buffalo
label.en: Buffalo
label.vi: Con trâu
group: tray_farm
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu
> `alt` riêng như câu w2.

#### item tray_frog
label.en: Frog
label.vi: Con ếch
group: tray_no_hair
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

#### item tray_person
label.en: Person
label.vi: Con người
group: tray_people
image.brief: Dùng lại hình `explore_humans`. Từ khoá tìm ảnh (EN): child seen from behind
image.alt.en: A child seen from behind
image.alt.vi: Một bạn nhỏ nhìn từ phía sau

#### item tray_dog
label.en: Dog
label.vi: Con chó
group: tray_pet
image.brief: Dùng lại hình `explore_pets` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): yellow dog lying porch Vietnam
image.alt.en: A dog lying on the floor
image.alt.vi: Chú chó nằm trên sàn nhà

#### item tray_lizard
label.en: Lizard
label.vi: Thằn lằn
group: tray_no_hair
image.brief: Dùng lại hình `w3_lizard` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): common sun skink Eutropis multifasciata on rock
image.alt.en: A lizard on a rock
image.alt.vi: Con thằn lằn trên hòn đá

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1, q3, q4; ba lựa chọn), `true_false` (q2 Đúng, q5 Đúng, q6 Sai). Không `order_sequence`: ý của bài không có thứ tự tự nhiên.
> Hình câu `single_choice` là hàng rào tre trung tính. Câu nào cũng tự đủ nghĩa khi chỉ nghe. Thứ tự `#### option` theo bảng Vị trí đáp án ở `_topic.md` (app xáo lựa chọn, SK-047).

### q1
id: 299d975c-04dd-4ee9-b8dd-97539e6875bb
format: single_choice
version: 1
dok: 1
prompt.en: What do animals need to live?
prompt.vi: Con vật cần gì để sống?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about a hot day after playing.
hint.vi: Em nghĩ tới một ngày nắng nóng, chơi xong mệt nhé.
explanation_correct.en: Yes! Animals also need food and air.
explanation_correct.vi: Đúng rồi! Con vật còn cần thức ăn và không khí.
explanation_wrong.en: The answer is the water. Animals drink it.
explanation_wrong.vi: Đáp án là cốc nước. Con vật cần uống nước.
> DOK 1: nhớ lại câu chính ô Needs. Hai lựa chọn sai là đồ vật trông giống con vật hoặc có chân (vịt cao su, ghế đẩu), bé đã gặp ở *Gọi tên và nhóm động vật* bài năm. Ba hình đều là hình dùng lại.

#### option q1_duck
correct: false
feedback.en: A rubber duck is a bath toy.
feedback.vi: Vịt cao su là đồ chơi lúc em tắm.
label.en: rubber duck
label.vi: vịt cao su
image.brief: Dùng lại hình `tray_rubber_duck` ở bài `goi-ten-va-nhom-dong-vat/co-the-cac-con-vat`. Từ khoá tìm ảnh (EN): yellow rubber duck side view
image.alt.en: A yellow rubber duck
image.alt.vi: Con vịt cao su màu vàng

#### option q1_water
correct: true
label.en: glass of water
label.vi: cốc nước
image.brief: Dùng lại hình `w1_water` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): glass of water wooden table
image.alt.en: A glass of water
image.alt.vi: Cốc nước

#### option q1_stool
correct: false
feedback.en: A stool is for people to sit on.
feedback.vi: Ghế đẩu là chỗ để người ngồi.
label.en: stool
label.vi: ghế đẩu
image.brief: Dùng lại hình `tray_stool` ở bài `goi-ten-va-nhom-dong-vat/co-the-cac-con-vat`. Từ khoá tìm ảnh (EN): wooden stool four legs floor
image.alt.en: A wooden stool
image.alt.vi: Chiếc ghế đẩu gỗ

### q2
id: c8f3daa2-3f9e-4849-89da-c65c0b656e43
format: true_false
version: 1
dok: 1
prompt.en: People need food, water and air, too.
prompt.vi: Con người cũng cần thức ăn, nước và không khí.
image.brief: Dùng lại hình `explore_humans`. Từ khoá tìm ảnh (EN): child seen from behind
image.alt.en: A child seen from behind
image.alt.vi: Một bạn nhỏ nhìn từ phía sau
answer: true
hint.en: Think: do you eat and drink?
hint.vi: Em nghĩ xem: em có ăn, uống không?
explanation_correct.en: Yes! We need them, just like animals.
explanation_correct.vi: Đúng rồi! Chúng mình cần những thứ đó, giống con vật.
explanation_wrong.en: This is true. People need food, water and air.
explanation_wrong.vi: Câu này đúng. Con người cần thức ăn, nước và không khí.
feedback_false.en: You breathe air all day long.
feedback_false.vi: Cả ngày em đều thở không khí.
> DOK 1: nhớ lại ví dụ ô People ("we eat and drink every day") và câu chính ô Needs. Hình là bạn nhỏ bé vừa xem ở ô People.

### q3
id: 3997e9f8-2369-476b-a19c-784de1ab8f20
format: single_choice
version: 1
dok: 1
prompt.en: Which animal has hair or fur, like you?
prompt.vi: Con nào có lông hoặc có tóc, giống em?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look at what covers each animal.
hint.vi: Em nhìn kỹ thứ phủ bên ngoài mỗi con vật nhé.
explanation_correct.en: Yes! A rabbit is a mammal, like you.
explanation_correct.vi: Đúng rồi! Con thỏ là động vật có vú, giống em.
explanation_wrong.en: The answer is the rabbit. It has soft fur.
explanation_wrong.vi: Đáp án là con thỏ. Thỏ có bộ lông mềm.
> DOK 1: nhớ lại ví dụ ô Mammals ("a cat has soft fur", "you have hair on your head") và nhìn hình. Không đặt con chim (tiếng Việt gọi lông gà cũng là "lông").

#### option q3_goldfish
correct: false
feedback.en: A goldfish has smooth scales and fins.
feedback.vi: Cá vàng có vảy trơn và có vây.
label.en: goldfish
label.vi: cá vàng
image.brief: Dùng lại hình `tray_goldfish` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): goldfish aquarium plants side view
image.alt.en: A goldfish in a tank
image.alt.vi: Cá vàng trong bể

#### option q3_frog
correct: false
feedback.en: A frog has smooth, wet skin.
feedback.vi: Con ếch có da trơn và ướt.
label.en: frog
label.vi: con ếch
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

#### option q3_rabbit
correct: true
label.en: rabbit
label.vi: con thỏ
image.brief: Dùng lại hình `explore_fur` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): white rabbit sitting grass
image.alt.en: A white rabbit on the grass
image.alt.vi: Con thỏ trắng trên cỏ

### q4
id: dad386fa-b341-4db2-b150-b0c8fd4f56ff
format: single_choice
version: 1
dok: 2
prompt.en: Which animal is a mammal, like you?
prompt.vi: Con nào là động vật có vú, giống em?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think what baby mammals drink.
hint.vi: Em nghĩ xem con non của động vật có vú uống gì nhé.
explanation_correct.en: Yes! Puppies drink milk, like human babies.
explanation_correct.vi: Đúng rồi! Chó con bú sữa mẹ, giống em bé.
explanation_wrong.en: The answer is the dog. It has fur.
explanation_wrong.vi: Đáp án là con chó. Chó có bộ lông.
> DOK 2: bé tự xếp mình vào nhóm động vật có vú ("like you") rồi tìm con cùng nhóm, theo hai dấu hiệu (lông, bú sữa). Con gà mái là bẫy "hai chân giống em" nhưng là chim. Câu này cũng chạm `humans_not_animals` (không gắn key; key ở q6).

#### option q4_dog
correct: true
label.en: dog
label.vi: con chó
image.brief: Dùng lại hình `explore_pets` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): yellow dog lying porch Vietnam
image.alt.en: A dog lying on the floor
image.alt.vi: Chú chó nằm trên sàn nhà

#### option q4_hen
correct: false
feedback.en: A hen has feathers and lays eggs.
feedback.vi: Gà mái có lông vũ và đẻ trứng.
label.en: hen
label.vi: con gà mái
image.brief: Dùng lại hình `w3_hen` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): brown hen standing farmyard side view
image.alt.en: A hen in a yard
image.alt.vi: Con gà mái trong sân

#### option q4_carp
correct: false
feedback.en: A carp has scales and lives in water.
feedback.vi: Cá chép có vảy và sống dưới nước.
label.en: carp
label.vi: cá chép
image.brief: Dùng lại hình `explore_fish` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): common carp swimming underwater side view
image.alt.en: A carp swimming
image.alt.vi: Con cá chép đang bơi

### q5
id: 64990499-8f09-4ae8-a7e4-dfcb84f62bda
format: true_false
version: 1
dok: 2
prompt.en: Human babies and kittens both drink milk.
prompt.vi: Em bé và mèo con đều bú sữa mẹ.
image.brief: Dùng lại hình `q4` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): kitten sitting floor looking up
image.alt.en: A kitten looking up
image.alt.vi: Mèo con ngẩng đầu nhìn lên
answer: true
hint.en: Think which group both of them are in.
hint.vi: Em nghĩ xem em bé và mèo con cùng thuộc nhóm nào nhé.
explanation_correct.en: Yes! Drinking milk is a mammal sign.
explanation_correct.vi: Đúng rồi! Bú sữa mẹ là một dấu hiệu của động vật có vú.
explanation_wrong.en: This is true. Both drink their mother's milk.
explanation_wrong.vi: Câu này đúng. Cả hai đều bú sữa mẹ.
feedback_false.en: A kitten drinks milk from its mother.
feedback_false.vi: Mèo con bú sữa của mèo mẹ.
> DOK 2: so con người với con vật bằng một đặc điểm. Hình chỉ có mèo con, không có cảnh bú sữa, nên không làm bằng chứng.

### q6
id: fc883501-16bc-4916-aba6-c3318415431b
format: true_false
version: 1
dok: 2
misconception: humans_not_animals
prompt.en: People and animals are different groups.
prompt.vi: Con người và động vật là hai nhóm khác nhau.
image.brief: Dùng lại hình `explore_people` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): baby hand holding adult finger
image.alt.en: A baby's hand holding a finger
image.alt.vi: Bàn tay em bé nắm ngón tay người lớn
answer: false
hint.en: Think about the group you are in.
hint.vi: Em nghĩ xem em thuộc nhóm nào nhé.
explanation_correct.en: People are animals, too. We are mammals.
explanation_correct.vi: Con người cũng là động vật. Chúng mình là động vật có vú.
explanation_wrong.en: This is false. People are mammals, a group of animals.
explanation_wrong.vi: Câu này sai. Con người là động vật có vú, một nhóm động vật.
feedback_true.en: Babies have hair and drink milk, like kittens.
feedback_true.vi: Em bé có tóc và bú sữa mẹ, giống mèo con.
> Câu misconception (`humans_not_animals`), bằng hình, DOK 2: bé còn nghĩ "con người là một nhóm riêng" sẽ chạm gật đầu. Câu chỉ kiểm một việc: con người có ở trong các nhóm động vật không. Khác câu q6 của chủ đề số một.
> Hình là bàn tay em bé, không có con vật cạnh bên, không đẩy bé về phía nào. `explanation_correct` đứng một mình được: "People and animals are different groups." → "People are animals, too. We are mammals.".

## Từ vựng

### human
id: 5eee91f9-5fe6-4516-b917-f7a1b846528e
tier: core
term.en: human
term.vi: con người
example.en: A human is a kind of animal.
example.vi: Con người là một loài động vật.
image.brief: Dùng lại hình `explore_humans`. Từ khoá tìm ảnh (EN): child seen from behind
image.alt.en: A child seen from behind
image.alt.vi: Một bạn nhỏ nhìn từ phía sau

### feature
id: cf3ac468-525e-4b3e-84f6-ef873da2882f
tier: core
term.en: feature
term.vi: đặc điểm
example.en: Soft fur is a feature of a rabbit.
example.vi: Bộ lông mềm là một đặc điểm của con thỏ.
image.brief: Dùng lại hình `explore_fur` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): white rabbit sitting grass
image.alt.en: A white rabbit on the grass
image.alt.vi: Con thỏ trắng trên cỏ

### mammal
id: 35e76802-c41f-4c0f-b75c-1b1e7625162c
tier: extra
term.en: mammal
term.vi: động vật có vú
example.en: A cat is a mammal with soft fur.
example.vi: Con mèo là động vật có vú, có bộ lông mềm.
image.brief: Dùng lại hình `explore_mammals`. Từ khoá tìm ảnh (EN): hand stroking cat
image.alt.en: A hand stroking a cat
image.alt.vi: Bàn tay vuốt lưng con mèo
> Cố ý trùng từ `core` của *Gọi tên và nhóm động vật* bài hai, để ôn (Đề xuất PM số ba ở `_topic.md`).

### hair
id: 78b31015-1b09-4168-8dec-ba9444aedd97
tier: extra
term.en: hair
term.vi: tóc
example.en: I brush my hair every morning.
example.vi: Mỗi sáng em chải tóc.
image.brief: [hình vẽ] Đầu và vai một bạn nhỏ nhìn từ phía sau, mái tóc đen ngắn thấy rõ từng lọn; cùng nét, nền kem trơn với `w1_eye`, `w1_ear` ở bài `nao-bo-va-giac-quan/nao-dieu-khien-co-the`; không thấy mặt; áo trơn không chữ; không có chữ. Dùng ở thẻ từ 2:1 và thẻ thưởng vuông: vẽ có khoảng trống nền kem hai bên.
image.alt.en: A child's hair, seen from behind
image.alt.vi: Mái tóc của bạn nhỏ, nhìn từ phía sau
> Hình gốc (thẻ `hair_card` dùng lại). Hình vẽ vì chủ đề số một đã tìm ảnh mái tóc bạn nhỏ từ sau mà không có ảnh hợp lệ.

## Thưởng

### hair_card
id: c186262f-4386-4afc-85e0-df654d6d42f2
set: body
rarity: common
name.en: Hair
name.vi: Tóc
tag.en: A mammal feature
tag.vi: Đặc điểm của động vật có vú
fact.en: Your hair grows a little every day.
fact.vi: Tóc của em dài ra một chút mỗi ngày.
image.brief: Dùng lại hình `hair`.
image.alt.en: A child's hair, seen from behind
image.alt.vi: Mái tóc của bạn nhỏ, nhìn từ phía sau
> [CẦN KIỂM] Tóc mọc khoảng một xăng-ti-mét mỗi tháng (số chỉ trong ghi chú; chữ cho bé không có số).
> Bộ `set: body` đã có (Discoverer *Não bộ và giác quan*); thẻ Tóc chưa có.

## Ghi chú cho hoạ sĩ

- **Loại hình:** Học, kệ Chơi, quiz và từ là ảnh chụp thật; riêng từ `hair` và thẻ `hair_card` là hình vẽ (không có ảnh hợp lệ). Cả kệ Chơi là ảnh chụp. Người trong ảnh chỉ thấy bàn tay, cổ tay; không thấy mặt (SK-033).
- **Ảnh mới (hai):** `explore_humans` (một bạn nhỏ nhìn từ phía sau, không thấy mặt; dùng ở ô Học, món Chơi vuông, hình câu q2 khung 4:3, thẻ từ 2:1), `explore_mammals` (bàn tay vuốt lưng con mèo; ô Học và thẻ từ 2:1). Hai ảnh là hình gốc của chủ đề: giữ đúng key.
- **Hình vẽ mới (một):** `hair` (đầu và vai bạn nhỏ từ phía sau, mái tóc đen ngắn; cùng nét, nền kem với `w1_eye`, `w1_ear` của *Não bộ và giác quan* bài một). Dùng ở thẻ từ 2:1 và thẻ thưởng vuông.
- **Hình dùng lại:** *Gọi tên và nhóm động vật*: `w1` hàng rào tre (hình câu w2, q1, q3, q4), `explore_pets` chó (w1, q4, món Chơi), `explore_animals` gà mẹ gà con (ô Groups), `q4` mèo con (q5), `tray_goldfish` (q3), `explore_big_small` voi (w2), `explore_fur` thỏ (q3, từ `feature`), `explore_people` tay em bé (q6), `explore_fish` cá chép (q4, món Chơi), `tray_rubber_duck`, `tray_stool` (q1). *Khủng long*: `w1_buffalo` trâu (`alt` riêng; ô Needs, w2, món Chơi), `w3_cat` (món Chơi), `w3_hen` (q4), `w3_lizard` (món Chơi), `q4_frog` (q3, món Chơi). *Hô hấp*: `w1_water` cốc nước (q1).
- **Một ảnh, nhiều khung:** `explore_humans` ở khung ô Học, vuông, 4:3, 2:1; `explore_mammals` ở ô Học và 2:1; `explore_fur` ở thẻ ba lựa chọn 5:2 và thẻ từ 2:1; `explore_pets`, `explore_fish` ở 5:2 và vuông. Làm mục `crop` riêng cho từng khung khi cần.
- **Ảnh khó:** đôi bàn tay bạn nhỏ bưng bát cơm không lộ mặt (tìm ảnh chụp từ trên xuống mâm cơm); bàn tay vuốt mèo không lộ mặt, mèo không đeo vòng có chữ.
- **Kiểm thêm:** ảnh `w1_buffalo` có cảnh trâu cúi uống nước bên suối không (ví dụ bắt buộc ô Needs). Nếu không, báo phiên chính để đổi ví dụ thành "a buffalo needs water".
- **Màu:** Học: Needs `nau_dat`, Groups `cham`, Mammals `vang_hoe`, People `gi_dong`. Chơi: Thú cưng `vang_hoe`, Vật nuôi trong chuồng `gi_dong`, Loài người `cham`, Không có lông hay tóc `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (human, feature). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `true_false` (w1 Sai), `single_choice` (w2, hai lựa chọn). Quiz `single_choice` (q1, q3, q4; ba lựa chọn), `true_false` (q2 Đúng, q5 Đúng, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`humans_not_animals`). Không có `labels` ở câu `true_false`.
- **Vị trí đáp án:** app xáo lựa chọn (SK-047). Thứ tự trong file theo bảng ở `_topic.md`: w2 chỗ một (trên hai), q1 chỗ hai, q3 chỗ ba, q4 chỗ một.
- **Màn Chơi, ví dụ để kiểm:** Con mèo, Con trâu, Con người → `balanced`; Con chó, Con trâu, Con ếch → `has_limited`; Con mèo, Con chó, Con người → `missing.tray_farm`; Con mèo, Con trâu, Thằn lằn → `has_limited`.
- **Khởi động trỏ sang chủ đề khác:** w1 → `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`, w2 → `goi-ten-va-nhom-dong-vat/co-the-cac-con-vat` (hai bài đã có id).
- **Từ EN có thể ngoài Starters/Movers:** human, feature, mammal, mammals, features, form groups, trunk, fins, feathers, scales, puppies, kittens, buffalo, buffaloes, carp, lizard, goldfish, stream, rice grains. Nghe thử giọng EN đọc "buffaloes", "mammals", "features".
