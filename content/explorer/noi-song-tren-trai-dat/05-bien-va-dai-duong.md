---
id: 6519effd-2611-4489-8f11-3853a88185b8
topic: noi-song-tren-trai-dat
slug: bien-va-dai-duong
order: 5
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Oceans
vi: Biển và đại dương
> Giữ đúng tên ở `content/syllabus.json` (key `new-habitats-around-the-world`, bài số năm).

## Mục tiêu
en: I can name reef and deep-sea animals.
vi: Em kể được tên con vật ở rạn san hô và biển sâu.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 16/11/2026. Ticket SK-048. Mọi dòng `id:` để trống; chạy `ids` sau bài 4 (câu w1 trỏ tới bài 4).
> Bài ngoài sườn Oak Địa lý KS1 (biển chỉ có ở mức vị trí trên bản đồ); mục tiêu, ý chính theo `_topic.md`. Không bản đồ, không tên đại dương.
> Biển bé đã gặp ở chủ đề số một (bài tám, con vật biển) và số hai (bài bốn, ô "Sea"). Ý mới của bài: biển có nhiều vùng khác nhau, từ nông tới sâu, mỗi vùng có con vật riêng. Không làm lại "cá heo là cá", "sao biển là cá", "biển mặn, ao ngọt" thành câu hỏi riêng.
> Sửa `sea_same_everywhere` ở bốn ô Học (biển nông, rạn san hô, biển khơi, biển sâu), phần Chơi, câu q3, q4, q5 và câu q6 (gắn key).

## Ý chính
1.en: The ocean is huge and salty.
1.vi: Đại dương rất rộng và nước mặn.
2.en: Coral reefs are warm and full of fish.
2.vi: Rạn san hô ấm và có rất nhiều cá.
3.en: The deep sea is dark and cold.
3.vi: Biển sâu tối và lạnh.
> Từ cụ thể tới trừu tượng: cả đại dương (rộng, mặn), rồi hai vùng đối nhau mà bé so được bằng mắt (rạn san hô sáng, ấm; biển sâu tối, lạnh). Ý "biển chỗ nào cũng khác" là kết luận bé tự rút ở câu q6.
> [CẦN KIỂM] Biển sâu tối và lạnh; rạn san hô (loại bé thấy trong ảnh) ở vùng nước nông, ấm. Có san hô nước lạnh ở biển sâu, nhưng bài không nói tới.

## Khởi động

> Hai câu: w1 ôn bài 4 (bài trước, đầm lầy nước ngọt); w2 ôn *Gọi tên và nhóm động vật* bài hai (mốc dài), dẫn tới cá heo, con vật ở kệ Chơi hôm nay.

### w1
id: 037cf723-b6f1-4698-b62a-a33639c9d011
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: noi-song-tren-trai-dat/rung-ngap-man-va-dam-lay
prompt.en: Swamp water is salty, like the sea.
prompt.vi: Nước đầm lầy mặn như nước biển.
image.brief: Dùng lại hình `explore_swamp` ở bài `noi-song-tren-trai-dat/rung-ngap-man-va-dam-lay`. Từ khoá tìm ảnh (EN): freshwater marsh lotus
image.alt.en: A swamp with lotus plants
image.alt.vi: Đầm lầy có cây sen
answer: false
hint.en: Think about rain falling on the swamp.
hint.vi: Em nghĩ tới mưa rơi xuống đầm lầy nhé.
explanation_correct.en: Swamp water is fresh, like rain water.
explanation_correct.vi: Nước đầm lầy là nước ngọt, như nước mưa.
explanation_wrong.en: This is false. Swamp water is fresh.
explanation_wrong.vi: Câu này sai. Nước đầm lầy là nước ngọt.
feedback_true.en: Lotus plants grow in fresh swamp water.
feedback_true.vi: Cây sen mọc trong nước ngọt của đầm lầy.
> Ôn ý chính hai của bài 4, từ phía ngược lại (câu bài 4 q2 đáp án Đúng, câu này đáp án Sai). Mở đường cho ý chính một hôm nay: nước biển mặn.
> `explanation_correct` đứng một mình được (không "Yes!").

### w2
id: 7bca0548-38b8-4079-9cd4-d645c8f6aa87
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/dong-vat-co-vu
prompt.en: A baby dolphin drinks milk from its mum.
prompt.vi: Cá heo con bú sữa mẹ.
image.brief: Dùng lại hình `tray_dolphin` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): dolphin jumping out of sea NOAA
image.alt.en: A dolphin jumping out of the sea
image.alt.vi: Cá heo nhảy lên khỏi mặt biển
answer: true
hint.en: Remember: a dolphin is a mammal.
hint.vi: Em nhớ nhé: cá heo là động vật có vú.
explanation_correct.en: Yes! A dolphin comes up to breathe air.
explanation_correct.vi: Đúng rồi! Cá heo ngoi lên mặt nước để thở.
explanation_wrong.en: This is true. Baby mammals drink their mum's milk.
explanation_wrong.vi: Câu này đúng. Con non của động vật có vú bú sữa mẹ.
feedback_false.en: A mother dolphin feeds her baby milk.
feedback_false.vi: Cá heo mẹ cho cá heo con bú sữa.
> **Lệch `_topic.md`:** câu EN đổi "A dolphin drinks milk from its mum." thành "A baby dolphin drinks milk from its mum." (tám từ). Lý do: khớp phụ đề VI "Cá heo con" (luật EN và VI cùng nội dung); cá heo lớn không bú sữa. Đáp án vẫn Đúng. Phiên chính sửa dòng bài 5 ở Khung Quiz và bảng Đúng/Sai.
> Ôn ý chính hai của bài đó ("Baby mammals drink milk from their mother.") với một con vật biển; không hỏi lại "cá heo có phải cá không". Ảnh một con cá heo nhảy, không có cá heo con, không làm bằng chứng.

## Học

> Bốn ô xếp từ nông tới sâu, đúng thứ tự câu q4: biển nông gần bờ, rạn san hô, biển khơi, biển sâu. Mỗi ô có con vật của vùng đó, để phần Chơi (ba vùng) và câu q5 có chỗ dựa.
> Ví dụ ô rạn san hô có "sea turtles rest on the reef", để món rùa biển ở nhóm rạn san hô không nước đôi. Ví dụ ô biển khơi có "dolphins swim here, too" cho món cá heo.
> Không cá lồng đèn, không bò biển. Không nói rác biển, san hô bị hại, con vật gặp nguy.

### explore
id: 653b5999-813f-42be-b6d7-e2b6f67dcbdd
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_beach
label.en: Shallow water
label.vi: Biển nông
color: nau_dat
sentence.en: Near the beach, the water is shallow.
sentence.vi: Gần bãi biển, nước biển nông.
image.brief: Dùng lại hình `q3` ở bài `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien`. Từ khoá tìm ảnh (EN): empty beach blue sea
image.alt.en: A beach by the sea
image.alt.vi: Bãi biển vắng
examples.1.en: sunlight reaches the sandy bottom
examples.1.vi: ánh nắng chiếu tới tận đáy cát
examples.2.en: small fish swim near the beach
examples.2.vi: cá nhỏ bơi gần bãi biển
examples.3.en: long, sandy beaches in Vietnam
examples.3.vi: Việt Nam có những bãi biển cát dài
> Ví dụ một đặt nền cho ý "càng sâu càng tối" (đối với ô "Deep sea").
> [CẦN KIỂM] Ở chỗ nước nông gần bờ, ánh nắng chiếu tới đáy cát.

#### group explore_reef
label.en: Coral reef
label.vi: Rạn san hô
color: vang_hoe
sentence.en: Coral reefs are warm and full of fish.
sentence.vi: Rạn san hô ấm và có rất nhiều cá.
image.brief: Dùng lại hình `q4` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): coral reef underwater fish NOAA
image.alt.en: A coral reef under the sea
image.alt.vi: Rạn san hô dưới biển
examples.1.en: bright colours everywhere
examples.1.vi: màu sắc rực rỡ khắp nơi
examples.2.en: clownfish live here
examples.2.vi: cá hề sống ở đây
examples.3.en: sea turtles rest on the reef
examples.3.vi: rùa biển nghỉ trên rạn san hô
> Câu chính có đúng chữ "warm and full of fish" mà câu q3 hỏi (dòng "Chữ cần dạy trước khi hỏi" ở `_topic.md`). Ví dụ một là nửa đầu của chữ sửa misconception ("Reefs are bright").
> Cá hề chỉ ở Học, Chơi và làm lựa chọn sai câu q5; không câu nào hỏi "cá hề sống ở đâu" (mục Ranh giới).
> [CẦN KIỂM] Cá hề sống trong hải quỳ ở rạn san hô; rùa biển xanh nghỉ, kiếm ăn quanh rạn san hô.

#### group explore_open_sea
label.en: Open sea
label.vi: Biển khơi
color: gi_dong
sentence.en: Whales swim in the wide open sea.
sentence.vi: Cá voi bơi giữa biển khơi rộng lớn.
image.brief: Dùng lại hình `tray_pacific` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): humpback whale breaching ocean
image.alt.en: A whale in a wide blue ocean
image.alt.vi: Cá voi giữa đại dương xanh
examples.1.en: deep blue water, far from land
examples.1.vi: nước xanh thẫm, rất xa đất liền
examples.2.en: dolphins swim here, too
examples.2.vi: cá heo cũng bơi ở đây
examples.3.en: whales come up to breathe air
examples.3.vi: cá voi ngoi lên mặt nước để thở
> Ảnh cá voi lưng gù; chữ cho bé chỉ nói "whale" · "cá voi" (mục Tên gọi).
> [CẦN KIỂM] Cá heo sống ngoài biển khơi (nhiều loài); cá voi ngoi lên mặt nước để thở.

#### group explore_deep
label.en: Deep sea
label.vi: Biển sâu
color: cham
sentence.en: The deep sea is dark and cold.
sentence.vi: Biển sâu tối và lạnh.
image.brief: [ảnh] Một con sứa biển sâu trong suốt trôi giữa làn nước tối gần như đen, ảnh NOAA (phạm vi công cộng), trang gốc ghi độ sâu hoặc ghi là sứa biển sâu; thấy rõ thân sứa và tua, sứa sáng lên trên nền tối; ảnh ngang, sứa ở giữa có khoảng trống xung quanh (dùng cả khung vuông ở Học, kệ Chơi, thẻ sắp thứ tự câu q4 và thẻ ba lựa chọn rất ngang câu q3, q5); không có máy móc, dây cáp, thước đo, chữ, logo, rác. Không dùng sứa ở vùng nước nông, sứa dạt bãi biển, sứa trong bể kính; không dùng cá lồng đèn; không đặt cạnh ảnh sứa `explore_jelly` của chủ đề số một. Từ khoá tìm ảnh (EN): deep sea jellyfish NOAA; Okeanos Explorer jellyfish
image.alt.en: A see-through jellyfish
image.alt.vi: Con sứa trong suốt
examples.1.en: far, far below the waves
examples.1.vi: tít tận bên dưới những con sóng
examples.2.en: almost no sunlight down here
examples.2.vi: dưới này gần như không có ánh nắng
examples.3.en: some jellyfish glow in the dark
examples.3.vi: có loài sứa phát sáng trong bóng tối
> Hình gốc của cả chủ đề: giữ đúng key, `alt` và truy vấn đầu. `alt` không có chữ "dark" (ảnh là đáp án câu q5 "the dark deep sea").
> [CẦN KIỂM] Biển sâu gần như không có ánh nắng và rất lạnh; nhiều loài sứa biển sâu phát sáng; con sứa trong ảnh NOAA chọn được sống ở tầng sâu (designer ghi độ sâu từ trang gốc).
> `brief` sửa 16/11 theo ảnh thật (designer): bỏ "do tàu lặn không người lái chụp" và tên chương trình Okeanos Explorer. Ảnh đã chọn là sứa *Bathykorus bouilloni* trong suốt trên nền đen, NOAA Hidden Ocean 2005; trang gốc ghi "deep-sea" nhưng không nói chụp tại chỗ dưới biển hay trong bể trên tàu (PM quyết có đổi sang ảnh chắc chắn chụp dưới biển hay không; phương án của designer là sứa màu hồng, khi đó `alt` phải bỏ "see-through"). `alt` giữ.

### new_words
id: 9f4f39f0-19f7-46fd-976d-a7c40ee1f71e
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: ocean, coral_reef

## Chơi

> Bé chọn ba con vật biển, mỗi con ở một vùng: rạn san hô (cá hề, rùa biển), biển khơi (cá voi, cá heo), biển sâu (con sứa). Đạt khi đủ ba vùng và không chọn con vật nước ngọt.
> Món bẫy cũng bơi giỏi nhưng sống ở nước ngọt, bé đã gặp ở chủ đề trước và bài 4: cá chép (bơi như cá hề), ếch (bơi, sống ở ao), cá sấu (thân to, bơi như rùa biển). Bé phải nghĩ về nơi sống, không chọn theo dáng hay theo nền nước.
> Ba nhóm theo vùng biển là cách sửa `sea_same_everywhere` bằng tay: mỗi vùng có con vật riêng. Kệ tám món, toàn ảnh chụp.

### tray
id: bf4258c1-c023-4ba5-8100-569888931c35
type: build_tray
version: 1
prompt.en: Pick three sea animals
prompt.vi: Chọn ba con vật sống ở biển
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find animals from three parts of the sea.
messages.start.vi: Em tìm con vật ở ba vùng biển khác nhau nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! They all live in the sea.
messages.balanced.vi: Tuyệt! Cả ba con đều sống ở biển.
messages.has_limited.en: That one does not live in the sea.
messages.has_limited.vi: Con này không sống ở biển.
messages.missing.tray_reef.en: You still need a coral reef animal.
messages.missing.tray_reef.vi: Em còn thiếu một con vật ở rạn san hô.
messages.missing.tray_open.en: You still need an open sea animal.
messages.missing.tray_open.vi: Em còn thiếu một con vật ở biển khơi.
messages.missing.tray_deep.en: You still need a deep sea animal.
messages.missing.tray_deep.vi: Em còn thiếu một con vật ở biển sâu.
> Lời nhắn `has_limited` đúng với cả ba món bẫy (cá chép, ếch, cá sấu Xiêm trong ảnh đều sống ở nước ngọt).
> [CẦN KIỂM] Cá sấu nước mặn (cá sấu hoa cà) sống được ở cửa sông, ven biển; ảnh `tray_croc` (bài 1, từ 16/11 thay `q1_reptiles` của *Khủng long*) là cá sấu Xiêm nước ngọt, nên lời nhắn đúng với ảnh.

#### group tray_reef
label.en: Coral reef
label.vi: Rạn san hô
color: vang_hoe
role: required

#### group tray_open
label.en: Open sea
label.vi: Biển khơi
color: gi_dong
role: required

#### group tray_deep
label.en: Deep sea
label.vi: Biển sâu
color: cham
role: required

#### group tray_not
label.en: Not a sea animal
label.vi: Không sống ở biển
color: do_son
role: limit

#### item tray_clownfish
label.en: Clownfish
label.vi: Cá hề
group: tray_reef
image.brief: [ảnh] Một hoặc hai con cá hề màu cam sọc trắng bơi giữa các tua của hải quỳ, nhìn ngang, thấy cả con cá; ảnh dưới nước ngoài biển tự nhiên, nước sáng; ảnh ngang có khoảng trống quanh cá (dùng cả khung vuông kệ Chơi và thẻ ba lựa chọn rất ngang câu q5); không phải cá trong bể kính, không có thợ lặn, người, tay người, chữ hay logo. Ảnh chụp ở Nha Trang thì tốt; nếu ảnh không chụp ở đó thì bỏ tên nơi. Từ khoá tìm ảnh (EN): clownfish anemone; Amphiprion ocellaris
image.alt.en: A clownfish in an anemone
image.alt.vi: Cá hề trong hải quỳ
> Hình gốc của cả chủ đề: giữ đúng key, `alt` và truy vấn đầu.

#### item tray_carp
label.en: Carp
label.vi: Cá chép
group: tray_not
image.brief: Dùng lại hình `explore_fish` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): common carp swimming underwater side view
image.alt.en: A carp swimming
image.alt.vi: Con cá chép đang bơi

#### item tray_whale
label.en: Whale
label.vi: Cá voi
group: tray_open
image.brief: Dùng lại hình `tray_pacific` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): humpback whale breaching ocean
image.alt.en: A whale in a wide blue ocean
image.alt.vi: Cá voi giữa đại dương xanh

#### item tray_jellyfish
label.en: Jellyfish
label.vi: Con sứa
group: tray_deep
image.brief: Dùng lại hình `explore_deep`. Từ khoá tìm ảnh (EN): deep sea jellyfish NOAA
image.alt.en: A see-through jellyfish
image.alt.vi: Con sứa trong suốt

#### item tray_frog
label.en: Frog
label.vi: Con ếch
group: tray_not
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

#### item tray_sea_turtle
label.en: Sea turtle
label.vi: Rùa biển
group: tray_reef
image.brief: [ảnh] Một con rùa biển xanh đang bơi trong nước biển xanh trong, nhìn ngang hoặc hơi chếch từ trên xuống, thấy cả mai, bốn chân chèo và đầu; ưu tiên ảnh rùa bơi ngang qua hoặc nằm nghỉ trên rạn san hô, không có thì ảnh rùa bơi giữa nước xanh cũng được; ảnh ngang có khoảng trống quanh con vật (dùng cả khung vuông kệ Chơi, từ `sea_turtle`, thẻ thưởng và thẻ ba lựa chọn rất ngang câu q5; bài 7 còn dùng); không có thợ lặn, người, tay người, thiết bị gắn trên mai, lưới, rác, túi ni lông, chữ hay logo; không phải rùa nằm trên bãi cát. Ảnh chụp ở Côn Đảo thì tốt; nếu ảnh không chụp ở đó thì bỏ tên nơi. Từ khoá tìm ảnh (EN): Chelonia mydas; green sea turtle swimming
image.alt.en: A sea turtle swimming
image.alt.vi: Rùa biển đang bơi
> Hình gốc của cả chủ đề: giữ đúng key, `alt` và truy vấn đầu. Rùa biển cũng bơi ra biển khơi; nhóm của món này dựa vào ví dụ ba ô "Coral reef".

#### item tray_croc
label.en: Crocodile
label.vi: Cá sấu
group: tray_not
image.brief: Dùng lại hình `tray_croc` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Crocodylus siamensis
image.alt.en: A crocodile on a riverbank
image.alt.vi: Con cá sấu trên bờ sông

#### item tray_dolphin
label.en: Dolphin
label.vi: Cá heo
group: tray_open
image.brief: Dùng lại hình `tray_dolphin` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): dolphin jumping out of sea NOAA
image.alt.en: A dolphin jumping out of the sea
image.alt.vi: Cá heo nhảy lên khỏi mặt biển

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q3, q5; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ, một thứ tự đúng).
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính (như *Sinh vật sống ở đâu?* bài năm q4). Câu nào cũng tự đủ nghĩa khi chỉ nghe.
> Mỗi câu `single_choice` có lựa chọn sai bé đã gặp; đáp án là ảnh bé vừa xem ở Học, không phải ảnh mới duy nhất. Không hai con sứa, không hai cảnh giống nhau trong một câu.

### q1
id: a5897b2a-7fcc-4aec-8135-313248b76d3c
format: single_choice
version: 1
dok: 1
prompt.en: Which one swims in the wide open sea?
prompt.vi: Con nào bơi ngoài biển khơi rộng lớn?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about who needs the most room.
hint.vi: Em nghĩ xem con nào cần nhiều chỗ nhất nhé.
explanation_correct.en: Yes! Whales swim far from land.
explanation_correct.vi: Đúng rồi! Cá voi bơi rất xa đất liền.
explanation_wrong.en: The answer is the whale. Whales need wide water.
explanation_wrong.vi: Đáp án là cá voi. Cá voi cần vùng nước rộng.
> DOK 1: nhớ lại câu chính ô "Open sea". Hai lựa chọn sai là cá bé đã gặp (cá chép ở chủ đề số một; cá thòi lòi ở chủ đề số hai, bài 1, bài 4), đều sống ở nước ngọt hay bùn ven biển. Gợi ý là cách nghĩ (con to cần chỗ rộng), không trỏ tới ô Học.

#### option q1_carp
correct: false
feedback.en: A carp swims in a fresh pond.
feedback.vi: Cá chép bơi trong ao nước ngọt.
label.en: carp
label.vi: cá chép
image.brief: Dùng lại hình `explore_fish` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): common carp swimming underwater side view
image.alt.en: A carp swimming
image.alt.vi: Con cá chép đang bơi

#### option q1_mudskipper
correct: false
feedback.en: A mudskipper hops on mangrove mud.
feedback.vi: Cá thòi lòi nhảy trên bùn rừng ngập mặn.
label.en: mudskipper
label.vi: cá thòi lòi
image.brief: Dùng lại hình `mudskipper` ở bài `sinh-vat-song-o-dau/noi-song-cua-con-vat`. Từ khoá tìm ảnh (EN): mudskipper on mud Periophthalmus
image.alt.en: A mudskipper by the water
image.alt.vi: Cá thòi lòi bên mép nước
> `alt` riêng của chủ đề (designer 16/11): ảnh thật là cá thòi lòi trên mỏm đá bùn ven nước; `alt` gốc ở *Sinh vật sống ở đâu?* bài bốn chưa đổi.

#### option q1_whale
correct: true
label.en: whale
label.vi: cá voi
image.brief: Dùng lại hình `tray_pacific` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): humpback whale breaching ocean
image.alt.en: A big whale
image.alt.vi: Con cá voi lớn
> **Lệch `_topic.md` (chỉ ở chỗ này):** `alt` gốc "A whale in a wide blue ocean" có chữ "wide" của câu hỏi (mục Lỗi hay gặp, số mười hai); TEMPLATE cho sửa `alt` ở chỗ dùng lại để khỏi lộ đáp án. Các chỗ khác giữ `alt` gốc.

### q2
id: 7d31f4f8-4094-4eb2-8a9f-9a38484f74b7
format: true_false
version: 1
dok: 1
prompt.en: The deep sea is dark and cold.
prompt.vi: Biển sâu tối và lạnh.
image.brief: Dùng lại hình `tray_atlantic` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): Atlantic Ocean waves
image.alt.en: Big waves on a wide ocean
image.alt.vi: Sóng lớn giữa đại dương rộng
answer: true
hint.en: Think how far down sunlight can go.
hint.vi: Em nghĩ xem ánh nắng xuống sâu được bao xa nhé.
explanation_correct.en: Yes! Sunlight cannot reach that far down.
explanation_correct.vi: Đúng rồi! Ánh nắng không xuống được sâu tới vậy.
explanation_wrong.en: This is true. Deep water is very cold.
explanation_wrong.vi: Câu này đúng. Nước biển sâu rất lạnh.
feedback_false.en: Far below the waves, the water is dark.
feedback_false.vi: Tít dưới những con sóng, nước biển tối om.
> DOK 1: nhớ lại ý chính ba (câu chính ô "Deep sea"). Hình là mặt đại dương có sóng, không phải ảnh biển sâu, nên không làm bằng chứng cho phía nào. Phản hồi nói "tối", giải thích khi sai nói "lạnh": hai câu app đọc liền không lặp ý.

### q3
id: 05fd6399-f810-47bd-90d9-1f5eec441081
format: single_choice
version: 1
dok: 1
prompt.en: Which place is warm and full of fish?
prompt.vi: Nơi nào ấm và có rất nhiều cá?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about where sunlight warms the water.
hint.vi: Em nghĩ xem ánh nắng sưởi ấm nước biển ở đâu nhé.
explanation_correct.en: Yes! Clownfish and sea turtles live there.
explanation_correct.vi: Đúng rồi! Cá hề và rùa biển sống ở đó.
explanation_wrong.en: The answer is the coral reef. Its water is warm.
explanation_wrong.vi: Đáp án là rạn san hô. Nước ở đó ấm.
> DOK 1: nhớ lại câu chính ô "Coral reef". Ba cảnh khác nhau rõ bằng mắt: nước tối có con sứa (biển sâu, ô Học hôm nay), rạn san hô nhiều màu, băng biển trắng (bài 1). Gợi ý nối với ví dụ một ô "Shallow water" (nắng chiếu tới đáy), không trỏ tới ô "Coral reef".
> `alt` của đáp án không có chữ "warm", "fish".

#### option q3_deep
correct: false
feedback.en: The deep sea is dark and cold.
feedback.vi: Biển sâu tối và lạnh.
label.en: deep sea
label.vi: biển sâu
image.brief: Dùng lại hình `explore_deep`. Từ khoá tìm ảnh (EN): deep sea jellyfish NOAA
image.alt.en: A see-through jellyfish
image.alt.vi: Con sứa trong suốt

#### option q3_reef
correct: true
label.en: coral reef
label.vi: rạn san hô
image.brief: Dùng lại hình `q4` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): coral reef underwater fish NOAA
image.alt.en: A coral reef under the sea
image.alt.vi: Rạn san hô dưới biển

#### option q3_ice
correct: false
feedback.en: Sea ice floats on a very cold sea.
feedback.vi: Băng biển nổi trên mặt biển rất lạnh.
label.en: sea ice
label.vi: băng biển
image.brief: Dùng lại hình `explore_ice` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Arctic sea ice
image.alt.en: Sea ice on a cold sea
image.alt.vi: Băng nổi trên biển lạnh

### q4
id: e88e370e-3824-4a17-b329-0923bc875106
format: order_sequence
version: 1
dok: 2
prompt.en: Order from shallow to deep.
prompt.vi: Xếp từ nông tới sâu.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_beach, q4_reef, q4_deep
hint.en: Think of a boat leaving the beach.
hint.vi: Em tưởng tượng một chiếc thuyền rời bãi biển nhé.
explanation_correct.en: Yes! The water gets deeper and darker.
explanation_correct.vi: Đúng rồi! Nước càng lúc càng sâu, càng tối.
explanation_wrong.en: The order is shallow water, reef, deep sea.
explanation_wrong.vi: Thứ tự là biển nông, rạn san hô, rồi biển sâu.
> DOK 2: so ba vùng biển theo độ sâu, dựa vào thứ tự bốn ô Học và điều nhìn thấy (đáy cát sáng, rạn san hô có nắng, nước tối). Đúng một thứ tự đúng. Thẻ trong file không theo thứ tự đúng.
> Ba thẻ cắt vuông cùng cỡ cảnh (Ghi chú cho hoạ sĩ). Câu `order_sequence` chưa có `feedback` (SK-044); dùng `hint`.
> [CẦN KIỂM] Rạn san hô ở vùng nước nông hơn biển sâu, sâu hơn chỗ sát bãi biển (như dòng `[CẦN KIỂM]` dưới bảng thứ tự ở `_topic.md`).

#### item q4_reef
label.en: coral reef
label.vi: rạn san hô
image.brief: Dùng lại hình `q4` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): coral reef underwater fish NOAA
image.alt.en: A coral reef under the sea
image.alt.vi: Rạn san hô dưới biển

#### item q4_deep
label.en: deep sea
label.vi: biển sâu
image.brief: Dùng lại hình `explore_deep`. Từ khoá tìm ảnh (EN): deep sea jellyfish NOAA
image.alt.en: A see-through jellyfish
image.alt.vi: Con sứa trong suốt

#### item q4_beach
label.en: shallow water
label.vi: biển nông
image.brief: Dùng lại hình `q3` ở bài `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien`. Từ khoá tìm ảnh (EN): empty beach blue sea
image.alt.en: A beach by the sea
image.alt.vi: Bãi biển vắng

### q5
id: f40b9429-d1ed-4ce4-8438-76775ed485bc
format: single_choice
version: 1
dok: 2
prompt.en: Which animal lives in the dark deep sea?
prompt.vi: Con nào sống ở biển sâu tối om?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look at the water around each animal.
hint.vi: Em nhìn làn nước quanh mỗi con vật nhé.
explanation_correct.en: Yes! Some jellyfish glow in the dark.
explanation_correct.vi: Đúng rồi! Có loài sứa phát sáng trong bóng tối.
explanation_wrong.en: The answer is the jellyfish. It lives far down.
explanation_wrong.vi: Đáp án là con sứa. Sứa sống ở tít dưới sâu.
> DOK 2: xếp ba con vật biển vào đúng vùng (rạn san hô sáng hay biển sâu tối), dựa vào ô Học và phần Chơi; bé so nền nước trong ảnh với điều đã học. Ba con khác nhau rõ bằng mắt. Không có ảnh sứa nào khác trong câu.
> [CẦN KIỂM] Rùa biển phải ngoi lên mặt nước để thở; rùa biển xanh sống ở vùng nước nông, ven bờ (một số loài rùa biển khác lặn sâu, nhưng không sống ở biển sâu).

#### option q5_jellyfish
correct: true
label.en: jellyfish
label.vi: con sứa
image.brief: Dùng lại hình `explore_deep`. Từ khoá tìm ảnh (EN): deep sea jellyfish NOAA
image.alt.en: A see-through jellyfish
image.alt.vi: Con sứa trong suốt

#### option q5_clownfish
correct: false
feedback.en: A clownfish lives in a sunny reef.
feedback.vi: Cá hề sống ở rạn san hô đầy nắng.
label.en: clownfish
label.vi: cá hề
image.brief: Dùng lại hình `tray_clownfish`. Từ khoá tìm ảnh (EN): clownfish anemone
image.alt.en: A clownfish in an anemone
image.alt.vi: Cá hề trong hải quỳ

#### option q5_turtle
correct: false
feedback.en: A sea turtle swims up to breathe air.
feedback.vi: Rùa biển bơi lên mặt nước để thở.
label.en: sea turtle
label.vi: rùa biển
image.brief: Dùng lại hình `tray_sea_turtle`. Từ khoá tìm ảnh (EN): Chelonia mydas
image.alt.en: A sea turtle swimming
image.alt.vi: Rùa biển đang bơi

### q6
id: 7b2a32fc-8f05-4f83-93bf-18d7e8ee780e
format: true_false
version: 1
dok: 2
misconception: sea_same_everywhere
prompt.en: The sea is the same everywhere.
prompt.vi: Biển chỗ nào cũng giống nhau.
image.brief: Dùng lại hình `tray_atlantic` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): Atlantic Ocean waves
image.alt.en: Big waves on a wide ocean
image.alt.vi: Sóng lớn giữa đại dương rộng
answer: false
hint.en: Think about the four sea pictures today.
hint.vi: Em nghĩ tới bốn hình biển em vừa xem hôm nay nhé.
explanation_correct.en: Reefs are bright. The deep sea is dark.
explanation_correct.vi: Rạn san hô sáng sủa. Biển sâu thì tối om.
explanation_wrong.en: This is false. Each part of the sea is different.
explanation_wrong.vi: Câu này sai. Mỗi vùng biển một khác.
feedback_true.en: The deep sea is darker than a reef.
feedback_true.vi: Biển sâu tối hơn rạn san hô.
> Câu misconception (`sea_same_everywhere`), bằng hình, DOK 2: bé chỉ thấy mặt biển xanh ngoài bãi tắm sẽ nghĩ biển chỗ nào cũng thế và chạm gật đầu. Bé áp điều đã học (bốn ô Học, ba nhóm ở kệ Chơi, câu q4) để bác câu nói. Câu khẳng định, không chữ phủ định; chỉ kiểm một việc.
> Hình là mặt đại dương có sóng: không thấy đáy, không thấy rạn san hô hay nước tối, nên không làm bằng chứng cho phía nào. Gợi ý trỏ tới cả bốn ô, không gọi tên ô nào.
> `explanation_correct` đứng một mình được cho thẻ "Ý sai → Ý đúng" ở bước Tổng kết: "The sea is the same everywhere." → "Reefs are bright. The deep sea is dark." Chữ sửa của key ở `_topic.md` ("Reefs are bright, but the deep sea is dark.") có chín từ, quá giới hạn tám từ, nên ở đây tách hai câu.

## Từ vựng

### ocean
id: 266935ea-3aa8-4777-8bee-87e7261a26ca
tier: core
term.en: ocean
term.vi: đại dương
example.en: Big waves roll across the ocean.
example.vi: Sóng lớn cuộn trên đại dương.
image.brief: Dùng lại hình `tray_atlantic` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): Atlantic Ocean waves
image.alt.en: Big waves on a wide ocean
image.alt.vi: Sóng lớn giữa đại dương rộng
> Bảng Hình dùng chung chưa ghi hình cho từ `ocean`; chọn `tray_atlantic` (đã dùng ở q2, q6) vì là ảnh đại dương rộng, không con vật. Phiên chính thêm "từ `ocean`" vào dòng `tray_atlantic` của bảng.

### coral_reef
id: e56c64a4-d740-472c-91be-547dbf5f4c17
tier: core
term.en: coral reef
term.vi: rạn san hô
example.en: Many fish swim around the coral reef.
example.vi: Rất nhiều cá bơi quanh rạn san hô.
image.brief: Dùng lại hình `q4` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): coral reef underwater fish NOAA
image.alt.en: A coral reef under the sea
image.alt.vi: Rạn san hô dưới biển

### deep_sea
id: c1667378-9734-4598-9a00-db032f600972
tier: extra
term.en: deep sea
term.vi: biển sâu
example.en: The deep sea is far below the waves.
example.vi: Biển sâu ở tít bên dưới những con sóng.
image.brief: Dùng lại hình `explore_deep`. Từ khoá tìm ảnh (EN): deep sea jellyfish NOAA
image.alt.en: A see-through jellyfish
image.alt.vi: Con sứa trong suốt

### whale
id: 1827dc64-42b0-4664-9690-a98c689cc541
tier: extra
term.en: whale
term.vi: cá voi
example.en: Whales swim far across the ocean.
example.vi: Cá voi bơi rất xa qua đại dương.
image.brief: Dùng lại hình `tray_pacific` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): humpback whale breaching ocean
image.alt.en: A whale in a wide blue ocean
image.alt.vi: Cá voi giữa đại dương xanh
> [CẦN KIỂM] Cá voi lưng gù bơi đường rất xa giữa các vùng biển.

### sea_turtle
id: 338e1c72-fa6d-4b47-9faf-d7a9bc9ecc8e
tier: extra
term.en: sea turtle
term.vi: rùa biển
example.en: A sea turtle rests on the reef.
example.vi: Rùa biển nghỉ trên rạn san hô.
image.brief: Dùng lại hình `tray_sea_turtle`. Từ khoá tìm ảnh (EN): Chelonia mydas
image.alt.en: A sea turtle swimming
image.alt.vi: Rùa biển đang bơi
> Không lẫn với từ "turtle · con rùa" của chủ đề số một (mục Tên gọi).

## Thưởng

### sea_turtle_card
id: 16117dde-202a-425f-8c7b-44ddedf000ca
set: animals
rarity: common
name.en: Sea turtle
name.vi: Rùa biển
tag.en: Swims in Vietnam's seas
tag.vi: Bơi ở biển Việt Nam
fact.en: Sea turtles swim very far across the sea.
fact.vi: Rùa biển bơi rất xa, qua nhiều vùng biển.
image.brief: Dùng lại hình `tray_sea_turtle`. Từ khoá tìm ảnh (EN): Chelonia mydas
image.alt.en: A sea turtle swimming
image.alt.vi: Rùa biển đang bơi
> [CẦN KIỂM] Rùa biển xanh có ở biển Việt Nam (Côn Đảo); rùa biển bơi đường rất xa giữa nơi kiếm ăn và bãi đẻ (thẻ không nói chuyện đẻ trứng).
> Bộ `set: animals` đã có (chủ đề số một); rùa biển chưa có thẻ. Thẻ không nói "quý hiếm", "sắp tuyệt chủng", "bị săn bắt".

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Không bản đồ, không quả địa cầu, không ảnh Trái Đất từ vũ trụ. Ảnh dưới nước: không thợ lặn, người, thuyền, rác, lưới, chữ, logo; con vật hoang dã, không bể kính.
- **Ảnh mới (ba):** sứa biển sâu trong nước tối, ảnh NOAA (`explore_deep`); rùa biển xanh đang bơi (`tray_sea_turtle`); cá hề trong hải quỳ (`tray_clownfish`). Cả ba là hình gốc của chủ đề (bảng Hình dùng chung ở `_topic.md`): giữ đúng key, `alt` và truy vấn đầu.
- **Ảnh dùng lại:**
  - *Bề mặt Trái Đất* (Discoverer) bài hai: `tray_pacific` cá voi lưng gù (ô Học, kệ Chơi, q1, từ `whale`), `tray_atlantic` sóng giữa đại dương (q2, q6, từ `ocean`).
  - *Hô hấp* (Discoverer): `q4` rạn san hô NOAA (ô Học, q3, q4, từ `coral_reef`).
  - *Gọi tên và nhóm động vật*: `oc-bach-tuoc-va-con-vat-bien` `q3` bãi biển vắng (ô Học, q4); `dong-vat-co-vu` `tray_dolphin` (w2, kệ Chơi); `ca-va-luong-cu` `explore_fish` cá chép (kệ Chơi, q1); `con-vat-nuoi-trong-nha` `w1` hàng rào tre (hình câu q1, q3, q4, q5).
  - *Khủng long* (Discoverer): `q4_frog` (kệ Chơi).
  - *Sinh vật sống ở đâu?* bài bốn: `mudskipper` (q1).
  - Chủ đề này: bài 1 `explore_ice` (q3), `tray_croc` cá sấu Xiêm (kệ Chơi; từ 16/11 thay `q1_reptiles` của *Khủng long*); bài 4 `explore_swamp` (w1).
- **`alt` khác ở chỗ dùng lại:** q1_whale ("A big whale" · "Con cá voi lớn"), để `alt` của đáp án không có chữ "wide" của câu hỏi; q1_mudskipper ("A mudskipper by the water" · "Cá thòi lòi bên mép nước", 16/11), để khớp ảnh thật.
- **Câu q4 (sắp thứ tự):** ba thẻ vuông cùng cỡ cảnh: bãi biển nông thấy nước trong; rạn san hô dưới nước; nước tối có con sứa. Cắt sao cho bé không xếp theo màu sáng tối của khung cắt mà theo cảnh (cả ba vẫn thấy rõ là biển).
- **Một ảnh, nhiều khung:** sứa biển sâu, rùa biển, cá hề dùng ở khung vuông (Học, kệ Chơi, thẻ q4, từ, thẻ thưởng) và thẻ ba lựa chọn rất ngang 5:2 (q3, q5). Chọn ảnh ngang có khoảng trống quanh con vật; làm mục `crop` riêng cho từng khung.
- **Ảnh khó:**
  - biển sâu: Commons khoảng sáu ảnh sứa biển sâu NOAA, chỉ khoảng hai ảnh "biển sâu tối" đúng nghĩa; ảnh phải tối mà vẫn nhận ra con sứa; không dùng cá lồng đèn (nhiều ảnh mẫu chết, trông đáng sợ);
  - rùa biển: tránh ảnh có thợ lặn, thiết bị gắn trên mai, rùa vướng lưới, rác;
  - cá hề: nhiều ảnh chụp trong bể kính; chọn ảnh ngoài biển;
  - ảnh mang tên nơi (Côn Đảo, Nha Trang): trang gốc phải ghi đúng nơi; không thì bỏ tên nơi.
- **Cần kiểm thêm (xong 16/11):** ảnh `q1_reptiles` há miệng thấy răng; designer đã đổi sang ảnh cá sấu Xiêm miệng khép (`tray_croc` ở bài 1).
- **Còn mở (PM):** ảnh `explore_deep` (NOAA Hidden Ocean 2005) có thể chụp trong bể trên tàu; trang gốc không nói (ghi chú dưới ô "Deep sea").
- **Màu:** Học: biển nông `nau_dat`, rạn san hô `vang_hoe`, biển khơi `gi_dong`, biển sâu `cham`. Chơi: rạn san hô `vang_hoe`, biển khơi `gi_dong`, biển sâu `cham` (cùng màu với ô Học), không sống ở biển `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (ocean, coral_reef). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món. Khởi động `true_false` (w1 Sai, w2 Đúng). Quiz `single_choice` (q1, q3, q5; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ, `answer: q4_beach, q4_reef, q4_deep`). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`sea_same_everywhere`). Không có `labels` ở câu `true_false`.
- **Thứ tự lựa chọn trong file** (theo bảng ở `_topic.md`; app xáo trên màn, SK-047): q1 đáp án ở chỗ ba, q3 chỗ hai, q5 chỗ một. Thẻ q4 trong file: rạn san hô, biển sâu, biển nông (không theo thứ tự đúng).
- **Màn Chơi, ví dụ để kiểm:** Cá hề, Cá voi, Con sứa → `balanced`; Rùa biển, Cá heo, Con sứa → `balanced`; Rùa biển, Cá heo, Cá chép → `has_limited`; Cá hề, Rùa biển, Cá voi → `missing.tray_deep`; Cá voi, Cá heo, Con sứa → `missing.tray_reef`.
- **Khởi động trỏ sang bài khác:** w1 → `noi-song-tren-trai-dat/rung-ngap-man-va-dam-lay` (bài 4 phải có id trước khi chạy `ids` bài này); w2 → `goi-ten-va-nhom-dong-vat/dong-vat-co-vu` (đã có id).
- **Từ EN có thể ngoài Starters/Movers:** ocean, coral reef, reef, deep sea, open sea, shallow, sandy, bottom, colours, clownfish, sea turtle, whale, dolphin, mammal, breathe, jellyfish, glow, waves, swamp, lotus, carp, mudskipper, mangrove, crocodile, sea ice, sunlight, darker. Nghe thử giọng EN đọc "clownfish", "jellyfish", "coral reef"; giọng VI đọc "rạn san hô", "biển khơi".
