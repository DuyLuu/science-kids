---
id: c5d3b2e2-013a-4d54-8511-1d76b92957dd
topic: goi-ten-va-nhom-dong-vat
slug: ca-va-luong-cu
order: 4
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Naming fish and amphibians
vi: Cá và lưỡng cư
> Giữ đúng tên ở `content/syllabus.json` (`naming-and-grouping-animals`, bài số bốn).

## Mục tiêu
en: I can name fish and amphibians.
vi: Em gọi tên được các loài cá và lưỡng cư.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-041, ngày 12/11/2026. Mọi dòng `id:` để trống; chạy `ids` sau bài một, hai, ba.
> Sửa `water_animals_are_fish` ở phần Chơi (cá heo là món bẫy) và câu q6 (gắn key). Ý "cá không thở được dưới nước" của sườn sửa ở ý chính hai và ô Học "Gills".

## Ý chính
1.en: Fish live in water and have fins.
1.vi: Cá sống dưới nước và có vây.
2.en: Fish breathe in water with gills.
2.vi: Cá thở dưới nước bằng mang.
3.en: Amphibians live in water and on land.
3.vi: Lưỡng cư sống được cả dưới nước và trên cạn.
> [CẦN KIỂM] Ý hai: cá lấy khí ô-xi hoà tan trong nước qua mang (như *Hô hấp* bài một). Chữ cho bé không nói "ô-xi".
> Từ cụ thể tới trừu tượng: điều thấy được (vây), điều thấy được khi nhìn kỹ (mang), rồi một nhóm mới định nghĩa bằng chỗ sống (lưỡng cư).

## Khởi động

> Ba câu giãn cách: w1 và w2 ôn bài ba (bài trước), w3 ôn bài hai (hai ngày trước). w2 là misconception của bài ba, không gắn key.

### w1
id: e39b0c45-4f6d-4ae4-858c-77af07e18ebc
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/chim-va-bo-sat
prompt.en: Which one lays eggs?
prompt.vi: Con nào đẻ trứng?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Which one is a bird?
hint.vi: Em nghĩ xem con nào là chim?
explanation_correct.en: Yes! Hens and other birds lay eggs.
explanation_correct.vi: Đúng rồi! Gà mái và các loài chim đều đẻ trứng.
explanation_wrong.en: The answer is the hen. Birds lay eggs.
explanation_wrong.vi: Đáp án là con gà mái. Chim đẻ trứng.

#### option w1_cat
correct: false
feedback.en: A mother cat has kittens, not eggs.
feedback.vi: Mèo mẹ đẻ ra mèo con, không đẻ trứng.
label.en: cat
label.vi: con mèo
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

#### option w1_hen
correct: true
label.en: hen
label.vi: con gà mái
image.brief: Dùng lại hình `w3_hen` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): brown hen standing farmyard side view
image.alt.en: A hen in a yard
image.alt.vi: Con gà mái trong sân

### w2
id: ebf7073a-5579-44df-949b-683973af7d6c
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/chim-va-bo-sat
prompt.en: Every bird can fly.
prompt.vi: Chim nào cũng biết bay.
image.brief: Dùng lại hình `tray_sparrow` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow on a branch
image.alt.vi: Chim sẻ đậu trên cành
answer: false
hint.en: Think of a bird that swims.
hint.vi: Em nhớ lại con chim biết bơi nhé.
explanation_correct.en: Penguins are birds, but they swim.
explanation_correct.vi: Chim cánh cụt là chim, nhưng chúng bơi, không bay.
explanation_wrong.en: This is false. Penguins cannot fly.
explanation_wrong.vi: Câu này sai. Chim cánh cụt không biết bay.
feedback_true.en: A penguin is a bird that cannot fly.
feedback_true.vi: Chim cánh cụt là chim nhưng không biết bay.
> Ôn `all_birds_fly` (bài ba q6), không gắn key. Rà chữ tester 12/11 (N5): hình đổi từ con cò đang bay (đẩy bé chạm gật đầu) sang chim sẻ đang đậu, trung tính về chuyện bay. Không dùng chim cánh cụt (bằng chứng của đáp án), cũng không dùng gà hay vịt (gợi sẵn "chim không bay").

### w3
id: 63173392-5795-4359-a7fb-b18bec1dc958
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/dong-vat-co-vu
prompt.en: A baby buffalo drinks milk.
prompt.vi: Nghé con bú sữa mẹ.
image.brief: Dùng lại hình `q3` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): water buffalo calf standing field
image.alt.en: A baby buffalo in a field
image.alt.vi: Nghé con trên đồng
answer: true
hint.en: Is a buffalo a mammal?
hint.vi: Em nghĩ xem trâu có phải động vật có vú không?
explanation_correct.en: Yes! Buffaloes are mammals.
explanation_correct.vi: Đúng rồi! Trâu là động vật có vú.
explanation_wrong.en: This is true. Baby buffaloes drink milk.
explanation_wrong.vi: Câu này đúng. Nghé con bú sữa mẹ.
feedback_false.en: Baby buffaloes drink their mother's milk.
feedback_false.vi: Nghé con bú sữa của trâu mẹ.
> Chuẩn bị câu q6 (cá heo là động vật có vú, con non bú sữa).

## Học

> Bốn ô, từ cụ thể tới trừu tượng: cá (vây, đuôi, vảy), mang, lưỡng cư (ếch, cóc), ếch con. Ô "Baby frogs" xử lý `[CẦN KIỂM]` của sườn: nòng nọc là ếch con, không xếp như một loài lưỡng cư riêng.

### explore
id: 86119266-f77e-4535-afa7-ae9bb59277bc
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_fish
label.en: Fish
label.vi: Cá
color: cham
sentence.en: Fish live in water and have fins.
sentence.vi: Cá sống dưới nước và có vây.
image.brief: [ảnh] Một con cá chép bơi trong nước trong, nhìn ngang, thấy cả con, rõ vây, đuôi và vảy; nền nước xanh, không phải cá nằm trên nền trắng; không có người, không có chữ. Từ khoá tìm ảnh (EN): common carp swimming underwater side view
image.alt.en: A carp swimming
image.alt.vi: Con cá chép đang bơi
examples.1.en: a carp in the pond
examples.1.vi: cá chép dưới ao
examples.2.en: a perch in the rice field
examples.2.vi: cá rô ngoài ruộng
examples.3.en: most fish have scales
examples.3.vi: phần lớn cá có vảy
examples.4.en: fins and a tail help them swim
examples.4.vi: vây và đuôi giúp cá bơi
> Ảnh cá chép mới, trong nước. Ảnh `q1_fish` của *Khủng long* (cá chép trên nền trắng) không dùng ở chủ đề này: lựa chọn của Explorer cần cùng kiểu nền thật (Quy ước hình mục hai).
> Hình gốc, dùng lại ở món Chơi, từ `fish`, bài năm.

#### group explore_gills
label.en: Gills
label.vi: Mang
color: gi_dong
sentence.en: Fish breathe in water with gills.
sentence.vi: Cá thở dưới nước bằng mang.
image.brief: Dùng lại hình `q2_gills` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): fish gill cover close up
image.alt.en: A close-up of fish gills
image.alt.vi: Cận cảnh mang cá
examples.1.en: gills are on the sides of the head
examples.1.vi: mang ở hai bên đầu cá
examples.2.en: fish breathe all day and night
examples.2.vi: cá thở suốt ngày đêm
examples.3.en: fish need water to breathe
examples.3.vi: cá cần nước để thở
> [CẦN KIỂM] như ý chính hai.

#### group explore_amphibians
label.en: Amphibians
label.vi: Lưỡng cư
color: vang_hoe
sentence.en: Amphibians live in water and on land.
sentence.vi: Lưỡng cư sống được cả dưới nước và trên cạn.
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước
examples.1.en: a frog in the rice field
examples.1.vi: ếch ngoài ruộng
examples.2.en: a toad in the garden
examples.2.vi: cóc trong vườn
examples.3.en: their skin has no scales
examples.3.vi: da không có vảy
examples.4.en: they lay eggs in water
examples.4.vi: đẻ trứng dưới nước
> [CẦN KIỂM] Cóc sống trên cạn nhiều hơn ếch, nhưng vẫn đẻ trứng dưới nước. Không viết "da trơn, ẩm" làm luật chung, vì da cóc sần và khô hơn da ếch.

#### group explore_tadpoles
label.en: Baby frogs
label.vi: Ếch con
color: do_son
sentence.en: A tadpole is a baby frog.
sentence.vi: Nòng nọc là ếch con.
image.brief: [ảnh] Một đàn nòng nọc đen bơi trong nước nông trong, chụp từ trên xuống hoặc chéo, thấy rõ đầu tròn và đuôi; không có người, không có tay, không có chữ. Từ khoá tìm ảnh (EN): tadpoles swimming shallow water
image.alt.en: Tadpoles in water
image.alt.vi: Nòng nọc dưới nước
examples.1.en: tadpoles live in water
examples.1.vi: nòng nọc sống dưới nước
examples.2.en: they have a tail
examples.2.vi: nòng nọc có đuôi
examples.3.en: they grow legs
examples.3.vi: nòng nọc mọc chân
examples.4.en: then they hop on land
examples.4.vi: rồi nhảy lên bờ
> [CẦN KIỂM] Nòng nọc sống hoàn toàn dưới nước, thở bằng mang; lớn lên mọc chân, mất đuôi, rồi lên cạn (sườn bài bốn). Bài không nói "nòng nọc thở bằng mang" để khỏi lẫn với ô "Gills" của cá.
> Hình gốc, dùng lại ở câu q3, câu q4, từ `tadpole`.

### new_words
id: dedf9925-4c79-4202-b393-41ea28c0aae0
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: fish, amphibian, gills

## Chơi

> Bé chọn một con cá và một con lưỡng cư. Đạt khi đủ hai nhóm và không chọn con nào khác. Kệ chỉ hai chỗ: bài này có hai nhóm, không ghép thêm nhóm thứ ba cho đủ ba chỗ.
> Dùng ngay ô "Fish" và ô "Amphibians". Món bẫy:
> - cá heo bơi như cá, tên tiếng Việt có chữ "cá", nhưng là động vật có vú (`water_animals_are_fish`, bài hai);
> - thằn lằn bốn chân, nhỏ, trông như ếch, nhưng là bò sát (bài ba);
> - vịt bơi dưới ao như cá, nhưng là chim.
> Kệ bảy món, toàn ảnh chụp.

### tray
id: 190f454f-3215-4269-b70f-7f99748a5ff8
type: build_tray
version: 1
prompt.en: Pick a fish and an amphibian
prompt.vi: Chọn một con cá và một con lưỡng cư
capacity: 2
success_when: all_required_and_no_limit
messages.start.en: Pick one fish and one amphibian.
messages.start.vi: Em chọn một con cá và một con lưỡng cư nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Both can live in water.
messages.balanced.vi: Tuyệt! Cả hai con đều sống được dưới nước.
messages.has_limited.en: That one is not a fish or amphibian.
messages.has_limited.vi: Con này không phải cá, cũng không phải lưỡng cư.
messages.missing.tray_fish.en: You still need a fish.
messages.missing.tray_fish.vi: Em còn thiếu một con cá.
messages.missing.tray_amph.en: You still need an amphibian.
messages.missing.tray_amph.vi: Em còn thiếu một con lưỡng cư.
> Lời nhắn `has_limited` gọi lại tên hai nhóm của bài, đúng cho cả ba món bẫy (cá heo, thằn lằn, vịt). Câu EN bảy từ.

#### group tray_fish
label.en: Fish
label.vi: Cá
color: cham
role: required

#### group tray_amph
label.en: Amphibian
label.vi: Lưỡng cư
color: vang_hoe
role: required

#### group tray_not
label.en: Not a fish or amphibian
label.vi: Không phải cá hay lưỡng cư
color: do_son
role: limit

#### item tray_carp
label.en: Carp
label.vi: Cá chép
group: tray_fish
image.brief: Dùng lại hình `explore_fish`. Từ khoá tìm ảnh (EN): common carp swimming underwater side view
image.alt.en: A carp swimming
image.alt.vi: Con cá chép đang bơi

#### item tray_dolphin
label.en: Dolphin
label.vi: Cá heo
group: tray_not
image.brief: Dùng lại hình `tray_dolphin` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): dolphin jumping out of sea NOAA
image.alt.en: A dolphin jumping out of the sea
image.alt.vi: Cá heo nhảy lên khỏi mặt biển

#### item tray_frog
label.en: Frog
label.vi: Con ếch
group: tray_amph
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

#### item tray_perch
label.en: Climbing perch
label.vi: Cá rô đồng
group: tray_fish
image.brief: [ảnh] Một con cá rô đồng còn sống bơi trong nước hoặc trong chậu nước trong, nhìn ngang, thấy cả con, rõ vây lưng gai và vảy; không phải cá đã chết, không nằm trên thớt; không có người, không có chữ. Từ khoá tìm ảnh (EN): climbing perch Anabas testudineus live
image.alt.en: A climbing perch in water
image.alt.vi: Cá rô đồng dưới nước
> Hình gốc, dùng lại ở câu q1. Ảnh khó: ảnh cá rô đồng trên Commons phần lớn là cá đã bắt lên, nằm trên mẹt. Không có ảnh cá sống hợp lệ thì đổi sang cá rô phi còn sống trong nước, nhãn "Tilapia" · "Cá rô phi" (biên tập sửa chữ theo).

#### item tray_lizard
label.en: Lizard
label.vi: Thằn lằn
group: tray_not
image.brief: Dùng lại hình `w3_lizard` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): common sun skink Eutropis multifasciata on rock
image.alt.en: A lizard on a rock
image.alt.vi: Con thằn lằn trên hòn đá

#### item tray_toad
label.en: Toad
label.vi: Con cóc
group: tray_amph
image.brief: [ảnh] Một con cóc nhà da sần màu nâu ngồi trên nền đất ẩm, nhìn ngang, thấy cả con; không có tay người, không có chữ. Từ khoá tìm ảnh (EN): Asian common toad Duttaphrynus melanostictus ground
image.alt.en: A toad on the ground
image.alt.vi: Con cóc trên mặt đất
> Hình gốc, dùng lại ở câu q5.

#### item tray_duck
label.en: Duck
label.vi: Con vịt
group: tray_not
image.brief: Dùng lại hình `w1_duck` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): duck standing pond bank
image.alt.en: A duck standing on the grass
image.alt.vi: Con vịt đứng trên bãi cỏ

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q3, q5; ba lựa chọn), `true_false` (q2, q6), `order_sequence` (q4).

### q1
id: d1403b27-92be-4cd3-95f9-747dfdcd8c76
format: single_choice
version: 1
dok: 1
prompt.en: Which one is a fish?
prompt.vi: Con nào là cá?
image.brief: [ảnh] Mặt ao làng có bèo tấm xanh ở mép, bờ cỏ phía xa, nước lặng; không có con vật, không có người, không có thuyền, không có chữ. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê
hint.en: Look for fins and a tail.
hint.vi: Em tìm con có vây và có đuôi nhé.
explanation_correct.en: Yes! A climbing perch is a fish.
explanation_correct.vi: Đúng rồi! Cá rô đồng là cá.
explanation_wrong.en: The answer is the perch. It has fins.
explanation_wrong.vi: Đáp án là cá rô đồng. Cá rô có vây.
> Ba con đều sống ở ao làng (cá rô, vịt, ếch), nên chỗ sống không giúp chọn; bé phải nhìn vây và đuôi. Khớp ví dụ Đạt ở luật Explorer số 7 của TEMPLATE.
> Hình gốc của câu hỏi (ao làng), dùng lại ở câu q4 và các bài năm, sáu.

#### option q1_perch
correct: true
label.en: climbing perch
label.vi: cá rô đồng
image.brief: Dùng lại hình `tray_perch`. Từ khoá tìm ảnh (EN): climbing perch Anabas testudineus live
image.alt.en: A climbing perch in water
image.alt.vi: Cá rô đồng dưới nước

#### option q1_duck
correct: false
feedback.en: A duck has feathers and a beak.
feedback.vi: Con vịt có lông vũ và có mỏ.
label.en: duck
label.vi: con vịt
image.brief: Dùng lại hình `w1_duck` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): duck standing pond bank
image.alt.en: A duck standing on the grass
image.alt.vi: Con vịt đứng trên bãi cỏ

#### option q1_frog
correct: false
feedback.en: A frog has legs, not fins.
feedback.vi: Ếch có chân, không có vây.
label.en: frog
label.vi: con ếch
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

### q2
id: 353dd908-eedc-4e16-be73-14a158894fbb
format: true_false
version: 1
dok: 1
prompt.en: Fish breathe with gills.
prompt.vi: Cá thở bằng mang.
image.brief: Dùng lại hình `tray_goldfish` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): goldfish aquarium plants side view
image.alt.en: A goldfish in a tank
image.alt.vi: Cá vàng trong bể
answer: true
hint.en: Look just behind the fish's eye.
hint.vi: Em nhìn ngay phía sau mắt con cá nhé.
explanation_correct.en: Yes! Gills help fish breathe in water.
explanation_correct.vi: Đúng rồi! Mang giúp cá thở dưới nước.
explanation_wrong.en: This is true. Fish breathe with gills.
explanation_wrong.vi: Câu này đúng. Cá thở bằng mang.
feedback_false.en: Fish breathe in water with gills.
feedback_false.vi: Cá thở dưới nước bằng mang.
> Hình là cá vàng cả con (không phải ảnh cận mang của ô Học). Gợi ý chỉ chỗ nhìn trong hình.

### q3
id: 89f2523c-799b-4ee5-9e68-b3da70b300e3
format: single_choice
version: 1
dok: 1
prompt.en: Which one is a baby frog?
prompt.vi: Con nào là ếch con?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for a tail in the water.
hint.vi: Em tìm con có đuôi, bơi dưới nước nhé.
explanation_correct.en: Yes! A tadpole is a baby frog.
explanation_correct.vi: Đúng rồi! Nòng nọc là ếch con.
explanation_wrong.en: The answer is the tadpole. It grows into a frog.
explanation_wrong.vi: Đáp án là nòng nọc. Nòng nọc lớn lên thành ếch.
> Ba con non: gà con (bài ba), mèo con (bài một, hai), nòng nọc (ô Học hôm nay). Hai lựa chọn sai bé đã gặp, nên đáp án không là hình duy nhất bé đã thấy. Bé chưa nhớ chữ "nòng nọc" vẫn chọn được: con non duy nhất sống dưới nước.

#### option q3_chick
correct: false
feedback.en: A chick is a baby hen.
feedback.vi: Gà con là con non của gà.
label.en: chick
label.vi: gà con
image.brief: Dùng lại hình `w1_chick` ở bài `goi-ten-va-nhom-dong-vat/chim-va-bo-sat`. Từ khoá tìm ảnh (EN): yellow chick standing ground side view
image.alt.en: A yellow chick
image.alt.vi: Gà con lông vàng

#### option q3_kitten
correct: false
feedback.en: A kitten is a baby cat.
feedback.vi: Mèo con là con non của mèo.
label.en: kitten
label.vi: mèo con
image.brief: Dùng lại hình `q4` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): kitten sitting floor looking up
image.alt.en: A kitten looking up
image.alt.vi: Mèo con ngẩng đầu nhìn lên

#### option q3_tadpole
correct: true
label.en: tadpole
label.vi: nòng nọc
image.brief: Dùng lại hình `explore_tadpoles`. Từ khoá tìm ảnh (EN): tadpoles swimming shallow water
image.alt.en: Tadpoles in water
image.alt.vi: Nòng nọc dưới nước
> Ảnh có cả đàn nòng nọc; designer cắt cận một hai con cho cùng cỡ với gà con, mèo con (ghi `crop`).

### q4
id: 78a4062e-75ae-4e58-876e-fcfb690f3bd5
format: order_sequence
version: 1
dok: 2
prompt.en: How does a frog grow? Tap in order.
prompt.vi: Con ếch lớn lên thế nào? Em chạm theo thứ tự nhé.
image.brief: Dùng lại hình `q1`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê
answer: q4_eggs, q4_tadpole, q4_frog
hint.en: Remember how a hen grows.
hint.vi: Em nhớ lại con gà lớn lên thế nào nhé.
explanation_correct.en: Yes! Eggs, then tadpole, then frog.
explanation_correct.vi: Đúng rồi! Trứng ếch, rồi nòng nọc, rồi con ếch.
explanation_wrong.en: The order is eggs, tadpole, frog.
explanation_wrong.vi: Thứ tự là trứng ếch, nòng nọc, con ếch.
> DOK 2: sắp thứ tự bằng cách ghép hai điều đã học (ví dụ bốn của ô "Amphibians": đẻ trứng dưới nước; ô "Baby frogs": nòng nọc lớn lên thành ếch). Gợi ý so với câu q4 bài ba (trứng, gà con, gà mái), không nói thứ tự. Thẻ trong file không theo thứ tự đúng.

#### item q4_frog
label.en: frog
label.vi: con ếch
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

#### item q4_eggs
label.en: frog eggs
label.vi: trứng ếch
image.brief: [ảnh] Cận cảnh một đám trứng ếch trong suốt nổi trên mặt nước nông, chụp chéo từ trên xuống, đủ gần để thấy rõ từng chấm đen tròn nằm trong một hạt thạch trong; không có nòng nọc, không có con vật, không có tay người, không có chữ. Từ khoá tìm ảnh (EN): frog spawn eggs water
image.alt.en: Frog eggs in water
image.alt.vi: Trứng ếch dưới nước
> Rà chữ tester 12/11 (n6): trứng ếch và nòng nọc đều là mảng đen trong nước. Thẻ trứng cắt cận để thấy chấm trong hạt thạch; thẻ nòng nọc cắt cận một hai con để thấy đầu tròn và đuôi (ghi ở thẻ `q4_tadpole` và Ghi chú cho hoạ sĩ).

#### item q4_tadpole
label.en: tadpole
label.vi: nòng nọc
image.brief: Dùng lại hình `explore_tadpoles`. Từ khoá tìm ảnh (EN): tadpoles swimming shallow water
image.alt.en: Tadpoles in water
image.alt.vi: Nòng nọc dưới nước
> Designer cắt cận một hai con nòng nọc (ghi `crop`), thấy rõ đầu tròn và đuôi, để khác hẳn thẻ trứng ếch.

### q5
id: 0b73d990-95f8-4cc1-be48-b983512275bc
format: single_choice
version: 1
dok: 2
prompt.en: Which one is an amphibian?
prompt.vi: Con nào là lưỡng cư?
image.brief: Dùng lại hình `q3` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): village house yard Vietnam morning
image.alt.en: A yard in a village
image.alt.vi: Sân nhà ở làng quê
hint.en: Look for skin with no scales.
hint.vi: Em tìm con có da không có vảy nhé.
explanation_correct.en: Yes! A toad is an amphibian, like a frog.
explanation_correct.vi: Đúng rồi! Cóc là lưỡng cư, giống con ếch.
explanation_wrong.en: The answer is the toad. It has no scales.
explanation_wrong.vi: Đáp án là con cóc. Da cóc không có vảy.
> DOK 2: phân loại một con lưỡng cư không phải con ếch của ô Học. Thằn lằn trông gần giống cóc (bốn chân, sống trên cạn) nhưng là bò sát (bài ba); cá vàng sống dưới nước nhưng là cá. Câu này gặp lại ý "lưỡng cư và bò sát là một" của sườn bài ba.

#### option q5_lizard
correct: false
feedback.en: A lizard has dry skin with scales.
feedback.vi: Thằn lằn có da khô phủ vảy.
label.en: lizard
label.vi: thằn lằn
image.brief: Dùng lại hình `w3_lizard` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): common sun skink Eutropis multifasciata on rock
image.alt.en: A lizard on a rock
image.alt.vi: Con thằn lằn trên hòn đá

#### option q5_toad
correct: true
label.en: toad
label.vi: con cóc
image.brief: Dùng lại hình `tray_toad`. Từ khoá tìm ảnh (EN): Asian common toad Duttaphrynus melanostictus ground
image.alt.en: A toad on the ground
image.alt.vi: Con cóc trên mặt đất

#### option q5_goldfish
correct: false
feedback.en: A goldfish has fins and scales.
feedback.vi: Cá vàng có vây và có vảy.
label.en: goldfish
label.vi: cá vàng
image.brief: Dùng lại hình `tray_goldfish` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): goldfish aquarium plants side view
image.alt.en: A goldfish in a tank
image.alt.vi: Cá vàng trong bể

### q6
id: 35fd5c5b-99ae-46c2-96ac-1acd8d0ccdb7
format: true_false
version: 1
dok: 2
misconception: water_animals_are_fish
prompt.en: A dolphin is a fish.
prompt.vi: Cá heo là một loài cá.
image.brief: Dùng lại hình `tray_dolphin` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): dolphin jumping out of sea NOAA
image.alt.en: A dolphin jumping out of the sea
image.alt.vi: Cá heo nhảy lên khỏi mặt biển
answer: false
hint.en: Remember the mammals lesson.
hint.vi: Em nhớ lại bài động vật có vú nhé.
explanation_correct.en: A dolphin is a mammal. Its babies drink milk.
explanation_correct.vi: Cá heo là động vật có vú. Cá heo con bú sữa mẹ.
explanation_wrong.en: This is false. A dolphin is a mammal.
explanation_wrong.vi: Câu này sai. Cá heo là động vật có vú.
feedback_true.en: A dolphin breathes air and drinks milk.
feedback_true.vi: Cá heo thở bằng không khí và bú sữa mẹ.
> Câu misconception (`water_animals_are_fish`), bằng hình: cá heo sống dưới biển, có vây, tên tiếng Việt có chữ "cá". Bé còn nghĩ "sống dưới nước là cá" sẽ chạm gật đầu.
> DOK 2: áp đặc điểm của nhóm (bài hai) vào một con vật trông giống cá. Bé đã đặt cá heo vào nhóm "Dưới nước" ở phần Chơi bài hai và gặp nó là món bẫy ở phần Chơi bài này. Câu w3 vừa nhắc "con non bú sữa".
> Đáp án Sai: giải thích khi đúng không mở đầu bằng "Yes!".

## Từ vựng

### fish
id: ae556038-9a6f-4b8a-9aaa-ed337e509ffe
tier: core
term.en: fish
term.vi: cá
example.en: A carp is a fish.
example.vi: Cá chép là một loài cá.
image.brief: Dùng lại hình `explore_fish`. Từ khoá tìm ảnh (EN): common carp swimming underwater side view
image.alt.en: A carp swimming
image.alt.vi: Con cá chép đang bơi

### amphibian
id: f7d0c887-c9c0-4f8e-81ce-ec16c14fe668
tier: core
term.en: amphibian
term.vi: lưỡng cư
example.en: A frog is an amphibian.
example.vi: Con ếch là lưỡng cư.
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

### gills
id: 94422e99-dd4b-44d9-8764-3ebcc611180a
tier: core
term.en: gills
term.vi: mang
example.en: Fish breathe with gills.
example.vi: Cá thở bằng mang.
image.brief: Dùng lại hình `q2_gills` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): fish gill cover close up
image.alt.en: A close-up of fish gills
image.alt.vi: Cận cảnh mang cá

### tadpole
id: 8be5d4a0-863c-4b33-a0fb-b0224227b8e7
tier: extra
term.en: tadpole
term.vi: nòng nọc
example.en: A tadpole grows into a frog.
example.vi: Nòng nọc lớn lên thành ếch.
image.brief: Dùng lại hình `explore_tadpoles`. Từ khoá tìm ảnh (EN): tadpoles swimming shallow water
image.alt.en: Tadpoles in water
image.alt.vi: Nòng nọc dưới nước

> Rà chữ tester 12/11 (n7): bỏ từ `fins` (`extra`, id `d4bb8a48-8fba-425a-86a9-b5fa542bcbef`). Bé Explorer nghe, không đọc, nên thẻ "fins · vây" ở đây và thẻ "fin · vây" (`core`) ở bài năm nghe y hệt. Bài còn bốn từ (đúng luật bốn đến tám).

## Thưởng

### frog_card
id: c7a24549-1391-4ca9-98c0-fbec09bdc698
set: animals
rarity: common
name.en: Rice field frog
name.vi: Ếch đồng
tag.en: Sings after rain
tag.vi: Kêu sau mưa
fact.en: Frogs call loudly after the rain.
fact.vi: Sau những cơn mưa, ếch đồng kêu ồm ộp rất to.
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước
> [CẦN KIỂM] Ếch đực kêu để gọi bạn vào mùa mưa, nhất là sau những trận mưa (biên tập nhớ). Câu cho bé không nói lý do. Nếu tìm được ảnh ếch đồng phồng túi kêu (không có chữ, không có tay) thì dùng ảnh đó cho thẻ.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật; hình câu q5 là hình vẽ sân nhà dùng lại của *Hô hấp* (hình câu hỏi).
- **Ảnh cần tìm (sáu):**
  - Học (hai): cá chép bơi trong nước; đàn nòng nọc.
  - Chơi (hai): cá rô đồng còn sống; con cóc.
  - Quiz (hai): ao làng có bèo (q1); trứng ếch trên mặt nước (q4).
- **Ảnh khó:** cá rô đồng còn sống trong nước (phương án thay ở món `tray_perch`); trứng ếch (ảnh trứng ếch của loài ở châu Âu trên Commons dùng được, miễn trông giống trứng ếch Việt Nam).
- **q3:** ba con non cùng cỡ trong khung; nòng nọc cắt cận.
- **q4 (`order_sequence`):** trứng ếch, nòng nọc, con ếch cùng cỡ trong khung. Trứng ếch cắt cận thấy chấm đen trong hạt thạch; nòng nọc cắt cận thấy đầu tròn và đuôi, để hai thẻ không thành hai mảng đen giống nhau (rà chữ tester 12/11 n6).
- **Hình câu w2:** đổi sang chim sẻ đậu (`tray_sparrow` của *Hô hấp*), không còn dùng cò đang bay (rà chữ tester 12/11 N5).
- **An toàn:** cá còn sống, không cá chết, không cá trên thớt; không bàn tay bắt ếch, cầm cóc.
- **Màu:** Học: cá `cham`, mang `gi_dong`, lưỡng cư `vang_hoe`, ếch con `do_son`. Chơi: cá `cham`, lưỡng cư `vang_hoe`, nhóm bẫy `do_son`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (bốn nhóm), `word_list` (fish, amphibian, gills).
  - Chơi: `build_tray`: **hai chỗ**, hai nhóm `required`, một nhóm `limit`, bảy món. Lời nhắn `start` nói "một con cá và một con lưỡng cư".
  - Khởi động: `single_choice` (w1, hai lựa chọn, ôn bài ba), `true_false` (w2 Sai, ôn bài ba; w3 Đúng, ôn bài hai).
  - Quiz: `single_choice` (q1, q3, q5), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`water_animals_are_fish`).
- **Vị trí đáp án đúng:** w1 thứ hai; q1 thứ nhất; q3 thứ ba; q5 thứ hai. q4 thẻ trong file: ếch, trứng ếch, nòng nọc; thứ tự đúng: trứng ếch, nòng nọc, ếch.
- **Màn Chơi, ví dụ để kiểm:** Cá chép, Con cóc → `balanced`; Cá heo, Con ếch → `has_limited`; Cá rô đồng, Cá chép → `missing.tray_amph`; rồi chạm Con ếch → `full`.
- **Từ EN có thể ngoài Starters/Movers:** amphibian, gills, fins, tadpole, toad, perch, carp, dolphin.
