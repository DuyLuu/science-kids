---
id: c49fbb02-e526-4423-9e05-37b094d4f6b9
topic: goi-ten-va-nhom-dong-vat
slug: co-the-cac-con-vat
order: 5
stage: apply
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Animal structure
vi: Cơ thể các con vật
> Giữ đúng tên ở `content/syllabus.json` (`naming-and-grouping-animals`, bài số năm). Tên EN là tên bài trong danh mục; chữ trong bài không dùng "structure" · "cấu tạo" (bảng Tên gọi ở `_topic.md`).

## Mục tiêu
en: I can compare the body parts of animals.
vi: Em so sánh được bộ phận cơ thể của các con vật.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-041, ngày 12/11/2026. Mọi dòng `id:` để trống; chạy `ids` sau bài một đến bốn.
> Bài vận dụng (`apply`): dùng những con vật và nhóm của bài hai đến bốn để so sánh bộ phận cơ thể. Sửa `all_animals_four_legs` ở ô Học "Legs", phần Chơi, câu q4 và câu q6 (gắn key).

## Ý chính
1.en: Animals have different body parts.
1.vi: Các con vật có những bộ phận cơ thể khác nhau.
2.en: Each body part helps the animal.
2.vi: Mỗi bộ phận giúp con vật làm một việc.
3.en: We can group animals by their body parts.
3.vi: Mình xếp nhóm được các con vật theo bộ phận cơ thể.
> Từ cụ thể tới trừu tượng: bộ phận nhìn thấy, việc bộ phận đó làm, rồi dùng bộ phận để xếp nhóm.

## Khởi động

> Hai câu: w1 ôn bài bốn (bài trước), w2 ôn bài hai (ba ngày trước).

### w1
id: 7ce73f89-b8e3-42d7-b838-bc72da1548f8
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/ca-va-luong-cu
prompt.en: Which one breathes with gills?
prompt.vi: Con nào thở bằng mang?
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê
hint.en: Which one lives in water?
hint.vi: Em nghĩ xem con nào sống dưới nước?
explanation_correct.en: Yes! Fish breathe with gills.
explanation_correct.vi: Đúng rồi! Cá thở bằng mang.
explanation_wrong.en: The answer is the goldfish. It is a fish.
explanation_wrong.vi: Đáp án là cá vàng. Cá thở bằng mang.

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

#### option w1_goldfish
correct: true
label.en: goldfish
label.vi: cá vàng
image.brief: Dùng lại hình `tray_goldfish` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): goldfish aquarium plants side view
image.alt.en: A goldfish in a tank
image.alt.vi: Cá vàng trong bể

### w2
id: cc7d5056-3f38-4a1b-92af-7183dc03c84b
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/dong-vat-co-vu
prompt.en: A cat feeds its kittens milk.
prompt.vi: Mèo mẹ cho mèo con bú sữa.
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm
answer: true
hint.en: Is a cat a mammal?
hint.vi: Em nghĩ xem mèo có phải động vật có vú không?
explanation_correct.en: Yes! Cats are mammals.
explanation_correct.vi: Đúng rồi! Mèo là động vật có vú.
explanation_wrong.en: This is true. Kittens drink milk.
explanation_wrong.vi: Câu này đúng. Mèo con bú sữa mẹ.
> Hình là mèo một mình, không phải ảnh mèo mẹ cho con bú của bài hai (bằng chứng của đáp án).

## Học

> Bốn ô, mỗi ô một bộ phận và việc nó giúp con vật làm: chân, cánh, vây và đuôi, bộ phận đặc biệt (vòi, mai, mỏ, sừng). Từ cụ thể (chân, ai cũng có) tới ít gặp hơn.
> Ô "Legs" có ví dụ "a snake has no legs", "a hen has two legs" để sửa `all_animals_four_legs`.

### explore
id: fdc34ff5-6ca2-461d-b306-b116d44beced
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_legs
label.en: Legs
label.vi: Chân
color: gi_dong
sentence.en: Legs help animals walk, run and jump.
sentence.vi: Chân giúp con vật đi, chạy và nhảy.
image.brief: Dùng lại hình `w3_hen` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): brown hen standing farmyard side view
image.alt.en: A hen in a yard
image.alt.vi: Con gà mái trong sân
examples.1.en: a dog has four legs
examples.1.vi: chó có bốn chân
examples.2.en: a hen has two legs
examples.2.vi: gà có hai chân
examples.3.en: a snake has no legs
examples.3.vi: rắn không có chân
examples.4.en: long back legs help a frog jump
examples.4.vi: chân sau dài giúp ếch nhảy xa

#### group explore_wings
label.en: Wings
label.vi: Cánh
color: vang_hoe
sentence.en: Wings help birds and bats fly.
sentence.vi: Cánh giúp chim và dơi bay.
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ
examples.1.en: an egret spreads its wings
examples.1.vi: cò dang rộng đôi cánh
examples.2.en: a bat has wings of skin
examples.2.vi: cánh dơi là một lớp da mỏng
examples.3.en: a penguin's wings help it swim
examples.3.vi: cánh giúp chim cánh cụt bơi
> [CẦN KIỂM] Cánh dơi là lớp da căng giữa các ngón tay dài. Ví dụ ba nối bài ba (`all_birds_fly`).

#### group explore_fins
label.en: Fins and tail
label.vi: Vây và đuôi
color: cham
sentence.en: Fins and a tail help fish swim.
sentence.vi: Vây và đuôi giúp cá bơi.
image.brief: Dùng lại hình `explore_fish` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): common carp swimming underwater side view
image.alt.en: A carp swimming
image.alt.vi: Con cá chép đang bơi
examples.1.en: a carp moves its tail
examples.1.vi: cá chép quẫy đuôi
examples.2.en: fins help it turn
examples.2.vi: vây giúp cá bơi lượn
examples.3.en: a dolphin has fins, too
examples.3.vi: cá heo cũng có vây
> Ví dụ ba nối bài bốn: cá heo có vây nhưng là động vật có vú. Cùng bộ phận không có nghĩa là cùng nhóm; bài không nói thẳng ý này để giữ câu ngắn.

#### group explore_special
label.en: Special parts
label.vi: Bộ phận đặc biệt
color: do_son
sentence.en: Each part helps the animal do a job.
sentence.vi: Mỗi bộ phận giúp con vật làm một việc.
image.brief: Dùng lại hình `explore_big_small` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): Asian elephant standing in water
image.alt.en: An elephant in the water
image.alt.vi: Con voi dưới nước
examples.1.en: an elephant's trunk picks up food
examples.1.vi: voi dùng vòi nhặt thức ăn
examples.2.en: a hard shell keeps a turtle safe
examples.2.vi: mai cứng che chở cho rùa
examples.3.en: a duck's beak finds food in mud
examples.3.vi: mỏ vịt mò thức ăn trong bùn
examples.4.en: a buffalo has two horns
examples.4.vi: con trâu có hai cái sừng
> Ảnh voi riêng của chủ đề, gốc ở bài hai `explore_big_small` (designer 12/11: ảnh voi *Khủng long* thấy chuồng).

### new_words
id: ec14fbdb-019b-4e88-9ace-756437d568e9
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: body_part, wing, fin

## Chơi

> Bé chọn ba con vật có số chân khác nhau: một con không có chân, một con hai chân, một con bốn chân. Đạt khi đủ ba nhóm và không chọn đồ vật nào.
> Dùng ngay ô "Legs" (`all_animals_four_legs`): bé phải đếm chân, và thấy có con không chân (rắn, cá), có con hai chân (gà, cò).
> Món bẫy là đồ vật giống con vật: ghế đẩu cũng có bốn chân; vịt cao su trông như con vịt. Bé phải nghĩ "đây có phải con vật không" trước khi đếm chân.
> Kệ tám món, toàn ảnh chụp.

### tray
id: f475a460-e4d7-48b7-91f9-560dcd9eda56
type: build_tray
version: 1
prompt.en: Pick three animals with different legs
prompt.vi: Chọn ba con vật có số chân khác nhau
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find no legs, two legs and four legs.
messages.start.vi: Em tìm một con không có chân, một con hai chân, một con bốn chân nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Animals have different legs.
messages.balanced.vi: Tuyệt! Mỗi con vật có số chân khác nhau.
messages.has_limited.en: That one is not alive. It is a thing.
messages.has_limited.vi: Thứ này không phải vật sống. Nó là đồ vật.
messages.missing.tray_none.en: You still need an animal with no legs.
messages.missing.tray_none.vi: Em còn thiếu một con vật không có chân.
messages.missing.tray_two.en: You still need an animal with two legs.
messages.missing.tray_two.vi: Em còn thiếu một con vật có hai chân.
messages.missing.tray_four.en: You still need an animal with four legs.
messages.missing.tray_four.vi: Em còn thiếu một con vật có bốn chân.

#### group tray_none
label.en: No legs
label.vi: Không có chân
color: cham
role: required

#### group tray_two
label.en: Two legs
label.vi: Hai chân
color: vang_hoe
role: required

#### group tray_four
label.en: Four legs
label.vi: Bốn chân
color: gi_dong
role: required

#### group tray_not
label.en: Not an animal
label.vi: Không phải con vật
color: do_son
role: limit
> Nhãn nhóm bắt buộc "No legs" · "Không có chân" là tên loại, không phải câu phủ định về đáp án. Nhãn `limit` theo dạng "Not …" · "Không …".

#### item tray_snake
label.en: Snake
label.vi: Con rắn
group: tray_none
image.brief: Dùng lại hình `q5` ở bài `goi-ten-va-nhom-dong-vat/chim-va-bo-sat`. Từ khoá tìm ảnh (EN): green snake resting on branch
image.alt.en: A snake on the leaves
image.alt.vi: Con rắn nằm trên lá

#### item tray_stool
label.en: Stool
label.vi: Ghế đẩu
group: tray_not
image.brief: [ảnh] Một chiếc ghế đẩu gỗ chân cao trên nền tối, chụp chéo thấy rõ ba chân (chân thứ tư khuất phía sau); không có người, không có nhãn hiệu, không có chữ. Từ khoá tìm ảnh (EN): wooden stool four legs floor
image.alt.en: A wooden stool
image.alt.vi: Chiếc ghế đẩu gỗ

#### item tray_hen
label.en: Hen
label.vi: Con gà mái
group: tray_two
image.brief: Dùng lại hình `w3_hen` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): brown hen standing farmyard side view
image.alt.en: A hen in a yard
image.alt.vi: Con gà mái trong sân

#### item tray_carp
label.en: Carp
label.vi: Cá chép
group: tray_none
image.brief: Dùng lại hình `explore_fish` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): common carp swimming underwater side view
image.alt.en: A carp swimming
image.alt.vi: Con cá chép đang bơi

#### item tray_cat
label.en: Cat
label.vi: Con mèo
group: tray_four
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

#### item tray_rubber_duck
label.en: Rubber duck
label.vi: Vịt cao su
group: tray_not
image.brief: [ảnh] Một con vịt cao su màu vàng đặt trên thành chậu nước hoặc nền trơn, nhìn nghiêng; không có nhãn hiệu, không có chữ in trên vịt, không có tay người. Từ khoá tìm ảnh (EN): yellow rubber duck side view
image.alt.en: A yellow rubber duck
image.alt.vi: Con vịt cao su màu vàng

#### item tray_egret
label.en: Egret
label.vi: Con cò
group: tray_two
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ
> Ảnh cò đang bay: hai chân duỗi về phía sau vẫn thấy được. Người chọn ảnh kiểm lại; không thấy rõ chân thì thay món này bằng chim sẻ (`tray_sparrow` của *Hô hấp*, chân bám cành).

#### item tray_frog
label.en: Frog
label.vi: Con ếch
group: tray_four
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q3, q5, q6; ba lựa chọn), `true_false` (q2), `order_sequence` (q4).
> Mọi lựa chọn là một con vật cả con; câu hỏi nói tới bộ phận, bé nhìn bộ phận trên hình con vật. Không có lựa chọn là ảnh cận một bộ phận rời (khó nhận ra với bé năm tuổi).

### q1
id: 152a9573-b69b-46d5-a86f-e5ba389074be
format: single_choice
version: 1
dok: 1
prompt.en: Which animal has wings?
prompt.vi: Con nào có cánh?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for a beak and feathers.
hint.vi: Em tìm con có mỏ và lông vũ nhé.
explanation_correct.en: Yes! A duck has two wings.
explanation_correct.vi: Đúng rồi! Con vịt có hai cánh.
explanation_wrong.en: The answer is the duck. It has wings.
explanation_wrong.vi: Đáp án là con vịt. Vịt có cánh.

#### option q1_duck
correct: true
label.en: duck
label.vi: con vịt
image.brief: Dùng lại hình `w1_duck` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): duck standing pond bank
image.alt.en: A duck standing on the grass
image.alt.vi: Con vịt đứng trên bãi cỏ

#### option q1_lizard
correct: false
label.en: lizard
label.vi: thằn lằn
image.brief: Dùng lại hình `w3_lizard` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): common sun skink Eutropis multifasciata on rock
image.alt.en: A lizard on a rock
image.alt.vi: Con thằn lằn trên hòn đá

#### option q1_dog
correct: false
label.en: dog
label.vi: con chó
image.brief: Dùng lại hình `explore_pets` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): yellow dog lying porch Vietnam
image.alt.en: A dog lying on the floor
image.alt.vi: Chú chó nằm trên sàn nhà

### q2
id: 4a81627e-bea7-45e4-b67d-83b8b8ae8a86
format: true_false
version: 1
dok: 1
prompt.en: A fish uses legs to swim.
prompt.vi: Cá bơi bằng chân.
image.brief: Dùng lại hình `tray_goldfish` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): goldfish aquarium plants side view
image.alt.en: A goldfish in a tank
image.alt.vi: Cá vàng trong bể
answer: false
hint.en: Look closely at the fish's body.
hint.vi: Em nhìn kỹ thân con cá nhé.
explanation_correct.en: A fish has no legs. It swims with fins.
explanation_correct.vi: Cá không có chân. Cá bơi bằng vây và đuôi.
explanation_wrong.en: This is false. Fish swim with fins.
explanation_wrong.vi: Câu này sai. Cá bơi bằng vây.

### q3
id: cd7d9540-f6b6-4d0b-8d35-71ae6a88facb
format: single_choice
version: 1
dok: 1
prompt.en: Which animal has a hard shell?
prompt.vi: Con nào có mai cứng?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look at each animal's back.
hint.vi: Em nhìn lưng của từng con nhé.
explanation_correct.en: Yes! A turtle's shell keeps it safe.
explanation_correct.vi: Đúng rồi! Mai cứng che chở cho con rùa.
explanation_wrong.en: The answer is the turtle. It has a shell.
explanation_wrong.vi: Đáp án là con rùa. Rùa có mai cứng.
> Ba lựa chọn khác bài ba q5 (ếch, rùa, mèo), để bé không nhớ vị trí: ở đây là thằn lằn, rùa, gà mái. Thằn lằn và rùa cùng là bò sát, nên câu hỏi về bộ phận, không về nhóm.

#### option q3_lizard
correct: false
label.en: lizard
label.vi: thằn lằn
image.brief: Dùng lại hình `w3_lizard` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): common sun skink Eutropis multifasciata on rock
image.alt.en: A lizard on a rock
image.alt.vi: Con thằn lằn trên hòn đá

#### option q3_turtle
correct: true
label.en: turtle
label.vi: con rùa
image.brief: Dùng lại hình `q3_turtle` ở bài `khung-long/vi-sao-khung-long-bien-mat`. Từ khoá tìm ảnh (EN): freshwater turtle walking side view scaly legs
image.alt.en: A turtle walking
image.alt.vi: Con rùa đang bò

#### option q3_hen
correct: false
label.en: hen
label.vi: con gà mái
image.brief: Dùng lại hình `w3_hen` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): brown hen standing farmyard side view
image.alt.en: A hen in a yard
image.alt.vi: Con gà mái trong sân

### q4
id: 0729c27b-d45b-4417-951a-9c0eb336a819
format: order_sequence
version: 1
dok: 2
prompt.en: Tap from no legs to four legs.
prompt.vi: Em chạm từ con không có chân tới con có bốn chân.
image.brief: Dùng lại hình `w1` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): rice field wind waves Vietnam
image.alt.en: Wind blowing over a rice field
image.alt.vi: Gió thổi trên cánh đồng lúa
answer: q4_goldfish, q4_penguin, q4_buffalo
hint.en: Count the legs on each one.
hint.vi: Em đếm số chân của từng con nhé.
explanation_correct.en: Yes! No legs, two legs, four legs.
explanation_correct.vi: Đúng rồi! Không chân, hai chân, bốn chân.
explanation_wrong.en: The order is goldfish, penguin, buffalo.
explanation_wrong.vi: Thứ tự là cá vàng, chim cánh cụt, con trâu.
> DOK 2: so sánh và sắp thứ tự theo một đặc điểm đếm được. Ba con không có ở kệ Chơi bài này (kệ dùng rắn, cá chép, gà, cò, mèo, ếch), nên câu không lặp đúng việc vừa làm. Thẻ trong file không theo thứ tự đúng.

#### item q4_buffalo
label.en: buffalo
label.vi: con trâu
image.brief: Dùng lại hình `explore_plants` ở bài `goi-ten-va-nhom-dong-vat/con-vat-an-gi`. Từ khoá tìm ảnh (EN): water buffalo grazing grass field
image.alt.en: A buffalo eating grass
image.alt.vi: Con trâu gặm cỏ
> Designer 12/11: ảnh trâu bên suối khuất hai chân sau; ảnh trâu gặm cỏ của bài sáu thấy đủ bốn chân.

#### item q4_goldfish
label.en: goldfish
label.vi: cá vàng
image.brief: Dùng lại hình `tray_goldfish` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): goldfish aquarium plants side view
image.alt.en: A goldfish in a tank
image.alt.vi: Cá vàng trong bể

#### item q4_penguin
label.en: penguin
label.vi: chim cánh cụt
image.brief: Dùng lại hình `tray_penguin` ở bài `goi-ten-va-nhom-dong-vat/chim-va-bo-sat`. Từ khoá tìm ảnh (EN): penguin standing rocks side view
image.alt.en: A penguin on a rock
image.alt.vi: Chim cánh cụt đứng trên tảng đá

### q5
id: 4d66f8b8-0ab8-4deb-98c5-aeafbdfed74f
format: single_choice
version: 1
dok: 2
prompt.en: Which one swims with fins?
prompt.vi: Con nào bơi bằng vây?
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê
hint.en: Look at what each one swims with.
hint.vi: Em nhìn xem mỗi con bơi bằng bộ phận nào nhé.
explanation_correct.en: Yes! A carp swims with fins and a tail.
explanation_correct.vi: Đúng rồi! Cá chép bơi bằng vây và đuôi.
explanation_wrong.en: The answer is the carp. Ducks and frogs use feet.
explanation_wrong.vi: Đáp án là cá chép. Vịt và ếch bơi bằng chân.
> DOK 2: cả ba con đều biết bơi ở ao làng; bé phải so bộ phận dùng để bơi. Ếch và vịt là hai con bé hay nghĩ "bơi như cá".

#### option q5_frog
correct: false
label.en: frog
label.vi: con ếch
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

#### option q5_duck
correct: false
label.en: duck
label.vi: con vịt
image.brief: Dùng lại hình `w1_duck` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): duck standing pond bank
image.alt.en: A duck standing on the grass
image.alt.vi: Con vịt đứng trên bãi cỏ

#### option q5_carp
correct: true
label.en: carp
label.vi: cá chép
image.brief: Dùng lại hình `explore_fish` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): common carp swimming underwater side view
image.alt.en: A carp swimming
image.alt.vi: Con cá chép đang bơi
> Đáp án là ảnh ô Học "Fins and tail" hôm nay; ếch và vịt bé đã gặp nhiều lần, nên không phải "hình duy nhất bé đã thấy". Cá chép cũng là món Chơi.

### q6
id: 779198ec-5a01-45f1-965b-0f5cd5db71fd
format: single_choice
version: 1
dok: 2
misconception: all_animals_four_legs
prompt.en: Which animal has two legs, like you?
prompt.vi: Con nào có hai chân, giống em?
image.brief: [ảnh] Ảnh đen trắng hai bàn chân trần của một em bé ngồi trên ghế, chỉ thấy bàn chân và cổ chân; không thấy mặt, không có dép có chữ, không có chữ. Từ khoá tìm ảnh (EN): child bare feet tiled floor
image.alt.en: Two bare feet
image.alt.vi: Hai bàn chân trần
hint.en: Count the legs you can see.
hint.vi: Em đếm số chân em nhìn thấy nhé.
explanation_correct.en: Yes! Birds have two legs, like you.
explanation_correct.vi: Đúng rồi! Chim có hai chân, giống em.
explanation_wrong.en: The answer is the sparrow. It has two legs.
explanation_wrong.vi: Đáp án là chim sẻ. Chim sẻ có hai chân.
> Câu misconception (`all_animals_four_legs`), bằng hình: hai lựa chọn sai bốn chân, đáp án hai chân. Câu nối chính bé với con vật (bài hai: con người là động vật), nên bé so số chân của mình với con vật.
> DOK 2: so sánh. Chim sẻ không có ở kệ Chơi (kệ dùng gà, cò), để câu không lặp đúng món vừa chọn.
> Hình câu hỏi là bàn chân của bé (phía "like you" của câu), không phải con vật nào trong lựa chọn.

#### option q6_lizard
correct: false
label.en: lizard
label.vi: thằn lằn
image.brief: Dùng lại hình `w3_lizard` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): common sun skink Eutropis multifasciata on rock
image.alt.en: A lizard on a rock
image.alt.vi: Con thằn lằn trên hòn đá

#### option q6_sparrow
correct: true
label.en: sparrow
label.vi: chim sẻ
image.brief: [ảnh] Một con chim sẻ đứng trên gờ tường hoặc gờ đá, nhìn ngang, thấy rõ hai chân; không có người, không có chữ. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow standing on a ledge
image.alt.vi: Chim sẻ đứng trên gờ tường
> Designer 12/11: ảnh chim sẻ của *Hô hấp* gần như không thấy chân, nên câu này có ảnh riêng thấy rõ hai chân. Designer đề xuất giữ `alt` cũ, nhưng ảnh mới là chim đứng trên gờ, không đậu trên cành, nên `alt` sửa cho đúng hình (VoiceOver đọc, không phải chữ app tự đọc). Các chỗ chim sẻ khác vẫn dùng ảnh *Hô hấp*.

#### option q6_cat
correct: false
label.en: cat
label.vi: con mèo
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

## Từ vựng

### body_part
id: 77da26ee-2020-48c5-9511-2186ed00059c
tier: core
term.en: body part
term.vi: bộ phận cơ thể
example.en: Legs and wings are body parts.
example.vi: Chân và cánh là bộ phận cơ thể.
image.brief: Dùng lại hình `w3_hen` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): brown hen standing farmyard side view
image.alt.en: A hen in a yard
image.alt.vi: Con gà mái trong sân

### wing
id: 271d7ce5-708f-448e-a9cc-f088ae6fef66
tier: core
term.en: wing
term.vi: cánh
example.en: An egret has big wings.
example.vi: Con cò có đôi cánh lớn.
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ

### fin
id: ed8d9a52-469a-454f-967e-014b7fcd99f6
tier: core
term.en: fin
term.vi: vây
example.en: A fish swims with its fins.
example.vi: Cá bơi bằng vây.
image.brief: Dùng lại hình `q2_fins` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): carp fin close up
image.alt.en: A close-up of fish fins
image.alt.vi: Cận cảnh vây cá
> Bài bốn đã bỏ từ `fins` (rà chữ tester 12/11 n7); từ "vây" chỉ còn ở đây, là `core`.

### shell
id: 9dc00bde-26e1-490b-9208-5cfee23d9f01
tier: extra
term.en: shell
term.vi: mai
example.en: A turtle has a hard shell.
example.vi: Con rùa có mai cứng.
image.brief: Dùng lại hình `q3_turtle` ở bài `khung-long/vi-sao-khung-long-bien-mat`. Từ khoá tìm ảnh (EN): freshwater turtle walking side view scaly legs
image.alt.en: A turtle walking
image.alt.vi: Con rùa đang bò

### trunk
id: d9dc57da-a0ad-4cb2-981d-70ef9bc93497
tier: extra
term.en: trunk
term.vi: vòi
example.en: An elephant has a long trunk.
example.vi: Con voi có cái vòi dài.
image.brief: Dùng lại hình `explore_big_small` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): Asian elephant standing in water
image.alt.en: An elephant in the water
image.alt.vi: Con voi dưới nước

## Thưởng

### kingfisher_card
id: 4e591be9-77e3-42e8-a396-967ae33a6511
set: animals
rarity: common
name.en: Kingfisher
name.vi: Chim bói cá
tag.en: A fishing bird
tag.vi: Chim bắt cá
fact.en: A kingfisher catches fish with its long beak.
fact.vi: Chim bói cá dùng chiếc mỏ dài để bắt cá.
image.brief: [ảnh] Một con chim bói cá lông xanh lam, ức cam, đậu trên cành cây nhỏ phía trên mặt nước, nhìn nghiêng, thấy rõ chiếc mỏ dài; không có cá trong mỏ, không có người, không có chữ. Từ khoá tìm ảnh (EN): common kingfisher perched branch water
image.alt.en: A kingfisher on a branch
image.alt.vi: Chim bói cá đậu trên cành
> [CẦN KIỂM] Chim bói cá lao xuống nước, dùng mỏ dài, nhọn để bắt cá nhỏ; có ở ao hồ, ruộng Việt Nam (biên tập nhớ). Câu EN tám từ. Thẻ nối ý "bộ phận giúp con vật làm một việc".

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật.
- **Ảnh cần tìm (bốn):** ghế đẩu gỗ bốn chân; vịt cao su vàng; hai bàn chân trần của bạn nhỏ trên sàn gạch (q6); chim bói cá (thẻ).
- **Cần kiểm trên ảnh dùng lại:** cò đang bay thấy hai chân (món Chơi); trâu bên suối thấy đủ bốn chân (q4); chim sẻ thấy hai chân (q6). Chỗ nào không thấy rõ thì đã ghi phương án thay ngay dưới món hay thẻ đó.
- **Kệ Chơi:** tám món đều là ảnh chụp; hai món bẫy (ghế đẩu, vịt cao su) là ảnh đồ vật thật, cùng kiểu nền như ảnh con vật.
- **q4 (`order_sequence`):** cá vàng, chim cánh cụt, trâu cùng cỡ trong khung.
- **Người trong hình:** chỉ hai bàn chân (q6).
- **Màu:** Học: chân `gi_dong`, cánh `vang_hoe`, vây và đuôi `cham`, bộ phận đặc biệt `do_son`. Chơi: không có chân `cham`, hai chân `vang_hoe`, bốn chân `gi_dong`, không phải con vật `do_son`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (bốn nhóm), `word_list` (body part, wing, fin).
  - Chơi: `build_tray`: ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món.
  - Khởi động: `single_choice` (w1, ba lựa chọn, ôn bài bốn), `true_false` (w2 Đúng, ôn bài hai).
  - Quiz: `single_choice` (q1, q3, q5, q6), `true_false` (q2 Sai), `order_sequence` (q4). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`all_animals_four_legs`).
- **Vị trí đáp án đúng:** w1 thứ ba; q1 thứ nhất; q3 thứ hai; q5 thứ ba; q6 thứ hai. q4 thẻ trong file: trâu, cá vàng, chim cánh cụt; thứ tự đúng: cá vàng, chim cánh cụt, trâu.
- **Màn Chơi, ví dụ để kiểm:** Con rắn, Con gà mái, Con mèo → `balanced`; Cá chép, Con cò, Ghế đẩu → `has_limited`; Con rắn, Cá chép, Con ếch → `missing.tray_two`.
- **Từ EN có thể ngoài Starters/Movers:** body part, wing, fin, shell, trunk, horns, beak, stool, rubber duck, kingfisher.
