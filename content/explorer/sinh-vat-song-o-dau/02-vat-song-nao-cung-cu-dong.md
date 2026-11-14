---
id: 4d463c1c-bd1c-45c1-b852-d08fa6023610
topic: sinh-vat-song-o-dau
slug: vat-song-nao-cung-cu-dong
order: 2
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Living things and movement
vi: Vật sống nào cũng cử động
> Giữ đúng tên ở `content/syllabus.json` (bài số hai).

## Mục tiêu
en: I can say how living things move.
vi: Em kể được vật sống cử động thế nào.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 14/11/2026. Mọi dòng `id:` để trống; chạy `ids` sau bài một.
> Bài cặp đôi hai ý: vật sống nào cũng cử động (kể cả cây, chỉ là rất chậm), nhưng cử động chưa chắc đã sống. Sửa `moving_means_alive` ở ô Học "Not alive", phần Chơi (món bẫy biết chạy, biết bay) và câu q6 (gắn key).
> Không dùng ví dụ hoa hướng dương (sườn ghi `[CẦN KIỂM]`: chỉ cây non quay theo mặt trời). Ví dụ cây cử động: dây mướp leo giàn, cây non nghiêng về phía sáng, cây trinh nữ cụp lá.

## Ý chính
1.en: Animals walk, swim, fly and hop.
1.vi: Con vật đi, bơi, bay và nhảy.
2.en: Plants move too, but very slowly.
2.vi: Cây cũng cử động, nhưng rất chậm.
3.en: Some things move but are not alive.
3.vi: Có những thứ cử động được nhưng không phải vật sống.

## Khởi động

> Hai câu: w1 ôn bài một (bài trước), w2 ôn bài năm chủ đề *Gọi tên và nhóm động vật* (chân giúp con vật di chuyển).

### w1
id: a3eab3e1-f4e0-49eb-8c4f-a0241c813182
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/vat-song-hay-khong-song
prompt.en: Which one needs water?
prompt.vi: Cái nào cần nước?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Which one is alive?
hint.vi: Em tìm vật sống nhé.
explanation_correct.en: Yes! Young plants need water to grow.
explanation_correct.vi: Đúng rồi! Cây non cần nước để lớn lên.
explanation_wrong.en: The answer is the young plants. They are alive.
explanation_wrong.vi: Đáp án là cây non. Cây non là vật sống.

#### option w1_seedlings
correct: true
label.en: young plants
label.vi: cây non
image.brief: Dùng lại hình `explore_plants` ở bài `sinh-vat-song-o-dau/vat-song-hay-khong-song`. Từ khoá tìm ảnh (EN): young vegetable seedlings soil row
image.alt.en: Young plants in the soil
image.alt.vi: Cây non mọc trên đất

#### option w1_ball
correct: false
feedback.en: A ball needs no water at all.
feedback.vi: Quả bóng không cần nước.
label.en: ball
label.vi: quả bóng
image.brief: Dùng lại hình `w1_ball` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): ball plastic toy colorful
image.alt.en: A round ball
image.alt.vi: Quả bóng tròn

### w2
id: 91c345e0-c0f7-460d-b197-3a0f41b04634
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/co-the-cac-con-vat
prompt.en: Which one uses legs to jump?
prompt.vi: Con nào dùng chân để nhảy?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for long back legs.
hint.vi: Em tìm con có đôi chân sau dài nhé.
explanation_correct.en: Yes! Long back legs help a frog jump.
explanation_correct.vi: Đúng rồi! Đôi chân sau dài giúp ếch nhảy xa.
explanation_wrong.en: The answer is the frog. It has long legs.
explanation_wrong.vi: Đáp án là con ếch. Ếch có chân sau dài.

#### option w2_carp
correct: false
feedback.en: A carp has fins, no legs.
feedback.vi: Cá chép có vây, không có chân.
label.en: carp
label.vi: cá chép
image.brief: Dùng lại hình `explore_fish` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): common carp swimming underwater side view
image.alt.en: A carp swimming
image.alt.vi: Con cá chép đang bơi

#### option w2_frog
correct: true
label.en: frog
label.vi: con ếch
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

## Học

> Bốn ô: con vật (cử động thấy rõ), cây cử động chậm, cây cử động nhanh (trinh nữ), vật cử động mà không sống.

### explore
id: 7475f6fd-2403-49be-b541-17c996b20b85
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_animals_move
label.en: Animals move
label.vi: Con vật cử động
color: gi_dong
sentence.en: Animals move to find food and hide.
sentence.vi: Con vật di chuyển để tìm thức ăn và để trốn.
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ
examples.1.en: an egret flies
examples.1.vi: con cò bay
examples.2.en: a fish swims
examples.2.vi: con cá bơi
examples.3.en: a frog hops
examples.3.vi: con ếch nhảy
examples.4.en: a cat walks
examples.4.vi: con mèo đi

#### group explore_slow_plants
label.en: Plants move slowly
label.vi: Cây cử động chậm
color: vang_hoe
sentence.en: Plants move, but very, very slowly.
sentence.vi: Cây cũng cử động, nhưng rất, rất chậm.
image.brief: [ảnh] Ngọn một dây mướp (hoặc dây bầu, dây bí) có tua cuốn xoắn quanh thanh tre của giàn, ảnh ngang, chụp gần thấy rõ tua cuốn; nền lá xanh mờ; không có người, không có tay, không có chữ. Từ khoá tìm ảnh (EN): gourd vine tendril curling bamboo
image.alt.en: A vine curling around a stick
image.alt.vi: Ngọn dây leo quấn quanh thanh tre
examples.1.en: a vine climbs up a stick
examples.1.vi: dây mướp leo lên thanh tre
examples.2.en: young plants lean to the light
examples.2.vi: cây non nghiêng về phía ánh sáng
examples.3.en: flowers open in the morning
examples.3.vi: hoa nở ra vào buổi sáng
> [CẦN KIỂM] Tua cuốn dây mướp, dây bầu quấn vào giàn trong nhiều giờ; cây non trồng gần cửa sổ nghiêng về phía sáng; nhiều loài hoa (hoa mười giờ) nở khi nắng lên. Hình gốc, dùng lại ở câu q3, câu q4, câu q5, từ `vine`, và bài ba.

#### group explore_sensitive
label.en: Sensitive plant
label.vi: Cây trinh nữ
color: cham
sentence.en: Its leaves fold up when touched.
sentence.vi: Chạm nhẹ vào, lá trinh nữ cụp lại.
image.brief: [ảnh] Một nhánh cây trinh nữ (cây mắc cỡ) với lá kép nhỏ đang xoè ra và vài bông hoa tròn màu hồng tím, ảnh ngang, chụp gần; không có tay người, không có chữ. Từ khoá tìm ảnh (EN): Mimosa pudica leaves flowers
image.alt.en: A sensitive plant with pink flowers
image.alt.vi: Cây trinh nữ có hoa màu hồng
examples.1.en: the leaves fold up fast
examples.1.vi: lá cụp lại rất nhanh
examples.2.en: later they open again
examples.2.vi: một lúc sau lá xoè ra
examples.3.en: its stem has tiny thorns
examples.3.vi: thân cây có gai nhỏ
> [CẦN KIỂM] Lá trinh nữ cụp lại ngay khi bị chạm, vài phút sau xoè ra lại; thân có gai nhỏ. Câu không rủ bé tự chạm (ví dụ ba nhắc có gai). Hình gốc, dùng lại ở câu q2, câu q6, từ `sensitive_plant`, thẻ thưởng.

#### group explore_not_alive
label.en: Not alive
label.vi: Không phải vật sống
color: nau_dat
sentence.en: A toy car moves. It is not alive.
sentence.vi: Ô tô đồ chơi chạy được. Nhưng nó không phải vật sống.
image.brief: Dùng lại hình `tray_car` ở bài `sinh-vat-song-o-dau/vat-song-hay-khong-song`. Từ khoá tìm ảnh (EN): red plastic toy car side view
image.alt.en: A red toy car
image.alt.vi: Chiếc ô tô đồ chơi màu đỏ
examples.1.en: a balloon floats up
examples.1.vi: quả bóng bay bay lên
examples.2.en: a fan spins round
examples.2.vi: cái quạt quay tròn
examples.3.en: a swing goes back and forth
examples.3.vi: cái xích đu đung đưa
> Không dùng cánh diều, tàu hoả, quả bóng lăn (ví dụ trong quiz của nguồn tham khảo).

### new_words
id: 46a05cd2-2727-48c1-b531-4137288dc84f
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: move, alive

## Chơi

> Bé chọn ba con vật di chuyển khác nhau: một con biết đi, một con biết bơi, một con biết bay. Đạt khi đủ ba nhóm và không chọn đồ vật nào.
> Món bẫy cử động giống một nhóm: ô tô đồ chơi chạy (giống "Biết đi"), bóng bay bay lên (giống "Biết bay"), khủng long đồ chơi có chân. Không có món bẫy cho nhóm "Biết bơi" vì đồ chơi nổi (vịt nhựa) là ví dụ của nguồn tham khảo.
> Kệ tám món, toàn ảnh chụp. Cấu trúc ba nhóm đi, bơi, bay giống kệ bài một chủ đề trước; ý khác: ở đây món bẫy là đồ vật biết cử động.

### tray
id: 9d91a8ae-c2a5-4742-b563-9a15234c3801
type: build_tray
version: 1
prompt.en: Pick three animals that move differently
prompt.vi: Chọn ba con vật di chuyển khác nhau
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find one that walks, swims and flies.
messages.start.vi: Em tìm một con biết đi, một con biết bơi, một con biết bay nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! They each move in their own way.
messages.balanced.vi: Tuyệt! Mỗi con di chuyển một kiểu.
messages.has_limited.en: That one moves, but it is not alive.
messages.has_limited.vi: Thứ này cử động được, nhưng không phải vật sống.
messages.missing.tray_walk.en: You still need one that walks.
messages.missing.tray_walk.vi: Em còn thiếu một con biết đi.
messages.missing.tray_swim.en: You still need one that swims.
messages.missing.tray_swim.vi: Em còn thiếu một con biết bơi.
messages.missing.tray_fly.en: You still need one that flies.
messages.missing.tray_fly.vi: Em còn thiếu một con biết bay.

#### group tray_walk
label.en: Walks
label.vi: Biết đi
color: gi_dong
role: required

#### group tray_swim
label.en: Swims
label.vi: Biết bơi
color: cham
role: required

#### group tray_fly
label.en: Flies
label.vi: Biết bay
color: vang_hoe
role: required

#### group tray_not
label.en: Not alive
label.vi: Không phải vật sống
color: do_son
role: limit

#### item tray_cat
label.en: Cat
label.vi: Con mèo
group: tray_walk
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

#### item tray_car
label.en: Toy car
label.vi: Ô tô đồ chơi
group: tray_not
image.brief: Dùng lại hình `tray_car` ở bài `sinh-vat-song-o-dau/vat-song-hay-khong-song`. Từ khoá tìm ảnh (EN): red plastic toy car side view
image.alt.en: A red toy car
image.alt.vi: Chiếc ô tô đồ chơi màu đỏ

#### item tray_carp
label.en: Carp
label.vi: Cá chép
group: tray_swim
image.brief: Dùng lại hình `explore_fish` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): common carp swimming underwater side view
image.alt.en: A carp swimming
image.alt.vi: Con cá chép đang bơi

#### item tray_balloon
label.en: Balloon
label.vi: Quả bóng bay
group: tray_not
image.brief: Dùng lại hình `w1_balloon` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): red balloon plain background
image.alt.en: A red balloon
image.alt.vi: Quả bóng bay màu đỏ

#### item tray_dog
label.en: Dog
label.vi: Con chó
group: tray_walk
image.brief: Dùng lại hình `explore_pets` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): yellow dog lying porch Vietnam
image.alt.en: A dog lying on the floor
image.alt.vi: Chú chó nằm trên sàn nhà

#### item tray_sparrow
label.en: Sparrow
label.vi: Chim sẻ
group: tray_fly
image.brief: Dùng lại hình `tray_sparrow` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow on a branch
image.alt.vi: Chim sẻ đậu trên cành

#### item tray_dinosaur
label.en: Toy dinosaur
label.vi: Khủng long đồ chơi
group: tray_not
image.brief: Dùng lại hình `q6` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): plastic toy dinosaur on table
image.alt.en: A toy dinosaur on a table
image.alt.vi: Khủng long đồ chơi trên bàn

#### item tray_egret
label.en: Egret
label.vi: Con cò
group: tray_fly
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q3, q6; ba lựa chọn), `true_false` (q2, q5), `order_sequence` (q4).

### q1
id: c665eb30-6c56-4b5d-8d38-315b5101c3c3
format: single_choice
version: 1
dok: 1
prompt.en: Which animal can swim?
prompt.vi: Con nào biết bơi?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for fins and a tail.
hint.vi: Em tìm con có vây và có đuôi nhé.
explanation_correct.en: Yes! A carp swims by moving its tail.
explanation_correct.vi: Đúng rồi! Cá chép quẫy đuôi để bơi.
explanation_wrong.en: The answer is the carp. It has fins.
explanation_wrong.vi: Đáp án là cá chép. Cá chép có vây.

#### option q1_cat
correct: false
feedback.en: A cat walks on four legs.
feedback.vi: Mèo đi bằng bốn chân.
label.en: cat
label.vi: con mèo
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

#### option q1_sparrow
correct: false
feedback.en: A sparrow flies with its wings.
feedback.vi: Chim sẻ bay bằng đôi cánh.
label.en: sparrow
label.vi: chim sẻ
image.brief: Dùng lại hình `tray_sparrow` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow on a branch
image.alt.vi: Chim sẻ đậu trên cành

#### option q1_carp
correct: true
label.en: carp
label.vi: cá chép
image.brief: Dùng lại hình `explore_fish` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): common carp swimming underwater side view
image.alt.en: A carp swimming
image.alt.vi: Con cá chép đang bơi
> Ba con đều là món Chơi bé vừa chạm.

### q2
id: ec813811-810f-4701-bbc8-46de037c6529
format: true_false
version: 1
dok: 1
prompt.en: A sensitive plant folds up when touched.
prompt.vi: Chạm vào cây trinh nữ, lá cây cụp lại.
image.brief: Dùng lại hình `explore_sensitive`. Từ khoá tìm ảnh (EN): Mimosa pudica leaves flowers
image.alt.en: A sensitive plant with pink flowers
image.alt.vi: Cây trinh nữ có hoa màu hồng
answer: true
hint.en: Remember the Sensitive plant picture.
hint.vi: Em nhớ lại ô Cây trinh nữ nhé.
explanation_correct.en: Yes! Later, its leaves open up again.
explanation_correct.vi: Đúng rồi! Một lúc sau, lá lại xoè ra.
explanation_wrong.en: This is true. The leaves fold up.
explanation_wrong.vi: Câu này đúng. Lá trinh nữ cụp lại.
feedback_false.en: A sensitive plant folds its leaves up fast.
feedback_false.vi: Lá trinh nữ cụp lại rất nhanh.
> Rà chữ tester 14/11 (n3): câu cũ "A sensitive plant stays still when touched." (Sai) là phủ định trá hình; nay viết thẳng ý đúng, đáp án Đúng. Ảnh trinh nữ lá đang xoè, không cho thấy lá cụp (không làm bằng chứng). Để bài vẫn có một câu Sai, câu q5 đổi sang câu so sánh (đáp án Sai).

### q3
id: 2a9681b8-bbe3-4f54-b914-4a3682dc6c81
format: single_choice
version: 1
dok: 1
prompt.en: Which plant climbs up a stick?
prompt.vi: Cây nào leo lên thanh tre?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for a curly part that holds on.
hint.vi: Em tìm cây có tua xoăn bám vào nhé.
explanation_correct.en: Yes! A vine curls round a stick slowly.
explanation_correct.vi: Đúng rồi! Dây mướp từ từ quấn quanh thanh tre.
explanation_wrong.en: The answer is the vine. It climbs slowly.
explanation_wrong.vi: Đáp án là dây mướp. Dây mướp leo chầm chậm.
> Hai lựa chọn sai là hai cây bé đã gặp (hoa sen ở chủ đề trước và bài một; cây non ở bài một), nên đáp án không phải "cây lạ duy nhất"; cả ba đều là cây, bé phải nhìn tua cuốn.

#### option q3_lotus
correct: false
feedback.en: A lotus grows up from the pond.
feedback.vi: Hoa sen mọc thẳng lên từ ao.
label.en: lotus
label.vi: hoa sen
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao

#### option q3_vine
correct: true
label.en: vine
label.vi: dây mướp
image.brief: Dùng lại hình `explore_slow_plants`. Từ khoá tìm ảnh (EN): gourd vine tendril curling bamboo
image.alt.en: A vine curling around a stick
image.alt.vi: Ngọn dây leo quấn quanh thanh tre

#### option q3_seedlings
correct: false
feedback.en: Young plants are still small and low.
feedback.vi: Cây non còn nhỏ và thấp.
label.en: young plants
label.vi: cây non
image.brief: Dùng lại hình `explore_plants` ở bài `sinh-vat-song-o-dau/vat-song-hay-khong-song`. Từ khoá tìm ảnh (EN): young vegetable seedlings soil row
image.alt.en: Young plants in the soil
image.alt.vi: Cây non mọc trên đất

### q4
id: 9e06ff5c-e19f-44dc-98c3-9d26c3ed922b
format: order_sequence
version: 1
dok: 2
prompt.en: Tap from slowest to fastest.
prompt.vi: Em chạm từ chậm nhất tới nhanh nhất.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_vine, q4_snail, q4_egret
hint.en: Which one moves too slowly to see?
hint.vi: Em nghĩ xem cái nào chậm tới mức mắt không thấy?
explanation_correct.en: Yes! The egret is the fastest one here.
explanation_correct.vi: Đúng rồi! Con cò nhanh nhất ở đây.
explanation_wrong.en: The order is vine, snail, then egret.
explanation_wrong.vi: Thứ tự là dây mướp, ốc sên, rồi con cò.
> DOK 2: so sánh tốc độ, có cây trong dãy để bé thấy cây cũng cử động. Thẻ trong file không theo thứ tự đúng. Ba thẻ cùng cỡ vật trong khung vuông, để bé dựa vào hiểu biết, không dựa vào cỡ hình.
> [CẦN KIỂM] Tua cuốn của cây leo chậm hơn ốc sên bò (biên tập nhớ: tua cuốn quấn trong hàng giờ, ốc sên bò được vài centimet mỗi phút).

#### item q4_snail
label.en: snail
label.vi: ốc sên
image.brief: Dùng lại hình `tray_snail` ở bài `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien`. Từ khoá tìm ảnh (EN): garden snail on leaf side view
image.alt.en: A snail on a leaf
image.alt.vi: Con ốc sên trên lá

#### item q4_egret
label.en: egret
label.vi: con cò
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ

#### item q4_vine
label.en: vine
label.vi: dây mướp
image.brief: Dùng lại hình `explore_slow_plants`. Từ khoá tìm ảnh (EN): gourd vine tendril curling bamboo
image.alt.en: A vine curling around a stick
image.alt.vi: Ngọn dây leo quấn quanh thanh tre

### q5
id: 5dcfed6a-f898-45b8-a176-19149a2da476
format: true_false
version: 1
dok: 2
prompt.en: A plant moves faster than a snail.
prompt.vi: Cây cử động nhanh hơn ốc sên.
image.brief: Dùng lại hình `explore_slow_plants`. Từ khoá tìm ảnh (EN): gourd vine tendril curling bamboo
image.alt.en: A vine curling around a stick
image.alt.vi: Ngọn dây leo quấn quanh thanh tre
answer: false
hint.en: Remember the Plants move slowly picture.
hint.vi: Em nhớ lại ô Cây cử động chậm nhé.
explanation_correct.en: Plants move even slower than a snail.
explanation_correct.vi: Cây cử động còn chậm hơn cả ốc sên.
explanation_wrong.en: This is false. Plants move very slowly.
explanation_wrong.vi: Câu này sai. Cây cử động rất chậm.
feedback_true.en: A vine takes hours to curl up.
feedback_true.vi: Dây mướp mất nhiều giờ mới quấn xong.
> Rà chữ tester 14/11 (n3): thay câu "A snail is slow, but it is alive." (Đúng) để bài vẫn có một câu Sai sau khi câu q2 đổi sang Đúng. DOK 2: so sánh tốc độ của cây với con vật chậm nhất bé biết. Câu khẳng định, đáp án Sai; giải thích khi đúng không mở đầu bằng "Yes!". Ảnh dây mướp là vật được nói tới, không cho thấy tốc độ. [CẦN KIỂM] như câu q4 (tua cuốn quấn trong hàng giờ).

### q6
id: ed26f5aa-7b01-49d0-8dd9-e5aa4b458d2a
format: single_choice
version: 1
dok: 2
misconception: moving_means_alive
prompt.en: Which one is alive?
prompt.vi: Cái nào là vật sống?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Which one grows and needs water?
hint.vi: Em tìm cái nào lớn lên và cần nước nhé.
explanation_correct.en: Yes! A sensitive plant grows, so it is alive.
explanation_correct.vi: Đúng rồi! Cây trinh nữ lớn lên, nên là vật sống.
explanation_wrong.en: The answer is the sensitive plant. It grows.
explanation_wrong.vi: Đáp án là cây trinh nữ. Cây trinh nữ lớn lên.
> Câu misconception (`moving_means_alive`), bằng hình: hai lựa chọn sai là đồ vật cử động rõ (ô tô chạy, bóng bay bay lên), đáp án là cây. Bé nghĩ "cử động là sống" sẽ chọn đồ vật.
> DOK 2: phân loại bằng dấu hiệu "lớn lên, cần nước", không bằng dấu hiệu "cử động". Ba hình bé đều đã gặp (trinh nữ ở Học hôm nay, ô tô ở bài một và kệ Chơi, bóng bay ở kệ Chơi).

#### option q6_sensitive
correct: true
label.en: sensitive plant
label.vi: cây trinh nữ
image.brief: Dùng lại hình `explore_sensitive`. Từ khoá tìm ảnh (EN): Mimosa pudica leaves flowers
image.alt.en: A sensitive plant with pink flowers
image.alt.vi: Cây trinh nữ có hoa màu hồng

#### option q6_balloon
correct: false
feedback.en: A balloon floats, but it never grows.
feedback.vi: Bóng bay bay lên được, nhưng không bao giờ lớn lên.
label.en: balloon
label.vi: quả bóng bay
image.brief: Dùng lại hình `w1_balloon` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): red balloon plain background
image.alt.en: A red balloon
image.alt.vi: Quả bóng bay màu đỏ

#### option q6_car
correct: false
feedback.en: A toy car moves, but never grows.
feedback.vi: Ô tô đồ chơi chạy được, nhưng không lớn lên.
label.en: toy car
label.vi: ô tô đồ chơi
image.brief: Dùng lại hình `tray_car` ở bài `sinh-vat-song-o-dau/vat-song-hay-khong-song`. Từ khoá tìm ảnh (EN): red plastic toy car side view
image.alt.en: A red toy car
image.alt.vi: Chiếc ô tô đồ chơi màu đỏ

## Từ vựng

### move
id: ac5355af-58ba-4a01-bf78-baab56282370
tier: core
term.en: move
term.vi: cử động
example.en: Fish move their tails to swim.
example.vi: Cá cử động đuôi để bơi.
image.brief: Dùng lại hình `explore_fish` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): common carp swimming underwater side view
image.alt.en: A carp swimming
image.alt.vi: Con cá chép đang bơi

### alive
id: 99d40967-d5ec-4bac-ad48-d3504d5817fe
tier: core
term.en: alive
term.vi: đang sống
example.en: A snail is slow, but alive.
example.vi: Ốc sên đi chậm, nhưng vẫn đang sống.
image.brief: Dùng lại hình `tray_snail` ở bài `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien`. Từ khoá tìm ảnh (EN): garden snail on leaf side view
image.alt.en: A snail on a leaf
image.alt.vi: Con ốc sên trên lá

### sensitive_plant
id: b6d91e8e-6ac3-41bd-9d1f-3d8b13333802
tier: extra
term.en: sensitive plant
term.vi: cây trinh nữ
example.en: A sensitive plant folds its leaves.
example.vi: Cây trinh nữ cụp lá lại.
image.brief: Dùng lại hình `explore_sensitive`. Từ khoá tìm ảnh (EN): Mimosa pudica leaves flowers
image.alt.en: A sensitive plant with pink flowers
image.alt.vi: Cây trinh nữ có hoa màu hồng

### vine
id: 938b4b3a-f292-4dd5-a9d2-065f5a5658e3
tier: extra
term.en: vine
term.vi: dây mướp
example.en: A vine climbs up a stick.
example.vi: Dây mướp leo lên thanh tre.
image.brief: Dùng lại hình `explore_slow_plants`. Từ khoá tìm ảnh (EN): gourd vine tendril curling bamboo
image.alt.en: A vine curling around a stick
image.alt.vi: Ngọn dây leo quấn quanh thanh tre

## Thưởng

### sensitive_plant_card
id: cdd671a5-b066-4356-afda-d22c333ef15a
set: living_things
rarity: rare
name.en: Sensitive plant
name.vi: Cây trinh nữ
tag.en: A plant that moves fast
tag.vi: Cây cử động nhanh
fact.en: Its leaves also fold up at night.
fact.vi: Lá trinh nữ cũng cụp lại khi trời tối.
image.brief: Dùng lại hình `explore_sensitive`. Từ khoá tìm ảnh (EN): Mimosa pudica leaves flowers
image.alt.en: A sensitive plant with pink flowers
image.alt.vi: Cây trinh nữ có hoa màu hồng
> [CẦN KIỂM] Lá trinh nữ khép lại vào ban đêm (biên tập nhớ, như nhiều cây họ đậu).

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Ảnh mới chọn ảnh ngang (thẻ ba lựa chọn khung 5:2).
- **Ảnh cần tìm (hai):** ngọn dây mướp có tua cuốn quấn thanh tre; nhánh cây trinh nữ lá xoè có hoa.
- **Ảnh khó:** trinh nữ đang xoè lá (nhiều ảnh chụp lúc lá đã cụp; câu q2 cần ảnh lá xoè). Dây mướp: chọn ảnh thấy rõ tua xoắn, không chỉ thấy lá.
- **q4 (`order_sequence`):** dây mướp, ốc sên, con cò cùng cỡ trong khung vuông.
- **Dùng lại:** bài một (`explore_plants`, `tray_car`); chủ đề *Gọi tên và nhóm động vật* (`w1`, `w1_lotus`, `explore_pets`, `explore_fish`, `tray_snail`); *Khủng long* (`w3_cat`, `q4_frog`, `q6`); *Hô hấp* (`tray_egret`, `tray_sparrow`, `w1_balloon`); *Bề mặt Trái Đất* (`w1_ball`).
- **Màu:** Học: con vật cử động `gi_dong`, cây cử động chậm `vang_hoe`, cây trinh nữ `cham`, không phải vật sống `nau_dat`. Chơi: biết đi `gi_dong`, biết bơi `cham`, biết bay `vang_hoe`, không phải vật sống `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (move, alive). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món. Khởi động `single_choice` (w1, w2; hai lựa chọn). Quiz `single_choice` (q1, q3, q6), `true_false` (q2 Đúng, q5 Sai), `order_sequence` (q4). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`moving_means_alive`).
- **Vị trí đáp án đúng:** w1 thứ nhất; w2 thứ hai; q1 thứ ba; q3 thứ hai; q6 thứ nhất. q4 thẻ trong file: ốc sên, con cò, dây mướp; thứ tự đúng: dây mướp, ốc sên, con cò.
- **Màn Chơi, ví dụ để kiểm:** Con mèo, Cá chép, Chim sẻ → `balanced`; Con chó, Cá chép, Quả bóng bay → `has_limited`; Con mèo, Con chó, Con cò → `missing.tray_swim`.
- **Từ EN có thể ngoài Starters/Movers:** move, alive, slowly, sensitive plant, vine, egret, carp, balloon, swing, fold.
