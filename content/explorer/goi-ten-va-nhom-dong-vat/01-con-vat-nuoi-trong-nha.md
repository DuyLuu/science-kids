---
id: f8d6eae8-494f-4f54-938f-2f02a7e54b36
topic: goi-ten-va-nhom-dong-vat
slug: con-vat-nuoi-trong-nha
order: 1
stage: opener
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Naming and grouping familiar animals
vi: Con vật nuôi trong nhà
> Giữ đúng tên ở `content/syllabus.json` (`naming-and-grouping-animals`, bài số một).

## Mục tiêu
en: I can sort pets and wild animals.
vi: Em xếp nhóm được thú cưng và động vật hoang dã.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-041, ngày 12/11/2026. Mọi dòng `id:` để trống; phiên chính chạy `ids` cho `_topic.md` rồi bài này, trước năm bài sau (Khởi động bài hai, ba trỏ về bài này).
> Bài mở màn (`opener`) của chủ đề Explorer đầu tiên. Sửa `pets_have_four_legs` ở ô Học "Pets", phần Chơi và câu q6 (gắn key).

## Ý chính
1.en: A pet lives with us at home.
1.vi: Thú cưng sống cùng nhà với mình.
2.en: Wild animals live free and find food.
2.vi: Động vật hoang dã sống tự do và tự tìm thức ăn.
3.en: All animals move and eat to live.
3.vi: Con vật nào cũng tự di chuyển và ăn để sống.
> Từ cụ thể tới trừu tượng: thú cưng bé thấy ở nhà, rồi con vật sống xa người, rồi ý chung "con vật là gì".

## Khởi động

> Hai câu kiến thức nền (`prior_knowledge`), vì đây là bài đầu của nhóm Explorer. Cả hai câu chỉ cần nhìn hình và nghe câu hỏi.

### w1
id: 010c8ae6-f174-4d0d-8d29-a67a535ce67e
format: single_choice
version: 1
dok: 1
recall_from.kind: prior_knowledge
recall_from.note.en: Prior knowledge: children see animals every day.
recall_from.note.vi: Kiến thức nền: bé thấy con vật quanh mình mỗi ngày.
prompt.en: Which one is an animal?
prompt.vi: Đâu là con vật?
image.brief: [ảnh] Một hàng rào tre đứng trước khu vườn cây xanh (ảnh vườn thực vật, không phải Việt Nam), nắng sáng; không có con vật, không có hoa nổi bật, không có nón, không có người, không có chữ. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
> Theo hình designer chọn (SK-041, designer 12/11): hàng rào tre trước vườn thực vật; brief và `alt` sửa theo, mọi chỗ dùng lại sửa `alt` theo.
hint.en: Look for legs and eyes.
hint.vi: Em tìm thứ có chân và có mắt nhé.
explanation_correct.en: Yes! A duck is an animal.
explanation_correct.vi: Đúng rồi! Con vịt là một con vật.
explanation_wrong.en: The answer is the duck. It can walk.
explanation_wrong.vi: Đáp án là con vịt. Vịt tự đi được.
> Hình câu hỏi là hình gốc của chủ đề (vườn trung tính), dùng lại ở nhiều câu bài sau (bảng Hình dùng chung ở `_topic.md`).
> Hoa sen là vật sống nhưng không phải con vật; bé có thể phân vân. Gợi ý chỉ vào điều nhìn thấy (chân, mắt), không gọi tên lựa chọn.

#### option w1_lotus
correct: false
label.en: lotus flower
label.vi: bông hoa sen
image.brief: [ảnh] Một bông sen hồng nở trên mặt ao, lá sen xanh xung quanh, chụp ngang; bông hoa chiếm phần lớn khung; không có người, không có chữ. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao

#### option w1_duck
correct: true
label.en: duck
label.vi: con vịt
image.brief: [ảnh] Một con vịt nhà đứng trên bờ đá có cỏ, nhìn ngang, thấy cả con và hai chân; không thấy ao; không có người, không có chữ. Cùng cỡ trong khung như hai hình kia. Từ khoá tìm ảnh (EN): duck standing pond bank
image.alt.en: A duck standing on the grass
image.alt.vi: Con vịt đứng trên bãi cỏ
> Hình gốc, dùng lại ở bài ba (ô Học "Birds", món Chơi), bài bốn, năm, sáu.

#### option w1_hat
correct: false
label.en: conical hat
label.vi: chiếc nón lá
image.brief: [ảnh] Một chiếc nón lá nhìn từ trên xuống, nền sáng; không có người, không có chữ, không có hình vẽ trên nón. Từ khoá tìm ảnh (EN): Vietnamese conical hat non la
image.alt.en: A conical hat
image.alt.vi: Chiếc nón lá

### w2
id: 1d08585d-1021-4467-a983-568d90a51ab7
format: true_false
version: 1
dok: 1
recall_from.kind: prior_knowledge
recall_from.note.en: Prior knowledge: children know which animals fly.
recall_from.note.vi: Kiến thức nền: bé biết con vật nào biết bay.
prompt.en: A buffalo can fly.
prompt.vi: Con trâu biết bay.
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu
answer: false
hint.en: Look at its legs and back.
hint.vi: Em nhìn chân và lưng con trâu nhé.
explanation_correct.en: A buffalo has no wings. It walks.
explanation_correct.vi: Trâu không có cánh. Trâu đi bằng bốn chân.
explanation_wrong.en: This is false. A buffalo cannot fly.
explanation_wrong.vi: Câu này sai. Trâu không biết bay.
> Câu dễ có chủ ý, để bé làm quen hai biểu tượng gật đầu, lắc đầu ngay ở bài đầu. Đáp án Sai, nên giải thích khi đúng không mở đầu bằng "Yes!". `alt` dùng bản "A water buffalo" · "Con trâu" như các chỗ dùng lại khác của hình này.
> Không có `labels`: Explorer hiện hai biểu tượng, không có chữ (luật Explorer số 5).

## Học

> Bốn ô, từ cụ thể tới trừu tượng hơn: con vật nói chung (ý chính ba, bé thấy hằng ngày), thú cưng (ý chính một), vật nuôi trong chuồng (bản địa hoá: trâu, gà không phải thú cưng), động vật hoang dã (ý chính hai). Ô "Pets" có cá vàng và vẹt để sửa `pets_have_four_legs`.
> Ô "Farm animals" là phần thêm so với sườn: bé Việt Nam thấy trâu, gà, vịt quanh nhà, dễ gộp vào thú cưng hoặc thấy không thuộc nhóm nào. Quiz không hỏi nhóm này để khỏi rối; bài hai ôn ở Khởi động w2.

### explore
id: 3c413dc8-4429-40a0-a82e-f46129668ac0
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_animals
label.en: Animals
label.vi: Con vật
color: gi_dong
sentence.en: Animals move and find food.
sentence.vi: Con vật tự di chuyển và tự tìm thức ăn.
image.brief: [ảnh] Một con gà mái mẹ cùng đàn gà con lông vàng đang bới đất tìm ăn trong sân đất ở làng quê, chụp ngang tầm thấp; không có người, không có chữ. Từ khoá tìm ảnh (EN): hen with chicks pecking yard
image.alt.en: A hen and chicks looking for food
image.alt.vi: Gà mẹ và gà con tìm thức ăn
examples.1.en: a duck swims
examples.1.vi: con vịt bơi
examples.2.en: a bird flies
examples.2.vi: con chim bay
examples.3.en: a dog runs
examples.3.vi: con chó chạy
examples.4.en: a hen pecks for food
examples.4.vi: con gà mổ thức ăn
> Hình gốc, dùng lại ở từ `animal` và ô Học "Different food" bài sáu.

#### group explore_pets
label.en: Pets
label.vi: Thú cưng
color: vang_hoe
sentence.en: A pet lives with us at home.
sentence.vi: Thú cưng sống cùng nhà với mình.
image.brief: [ảnh] Một con chó lông trắng đốm nâu nằm trên sàn gạch trong nhà, nhìn ngang, thấy cả con; không có vòng cổ có chữ hay thẻ đeo, không có người, không có chữ. Từ khoá tìm ảnh (EN): yellow dog lying porch Vietnam
image.alt.en: A dog lying on the floor
image.alt.vi: Chú chó nằm trên sàn nhà
examples.1.en: a dog or a cat
examples.1.vi: con chó, con mèo
examples.2.en: a goldfish in a tank
examples.2.vi: cá vàng trong bể
examples.3.en: a parakeet
examples.3.vi: con vẹt yến phụng
examples.4.en: we feed them and keep them clean
examples.4.vi: mình cho chúng ăn và giữ chúng sạch sẽ
> Ví dụ hai và ba là thú cưng không có bốn chân (`pets_have_four_legs`). Ví dụ bốn là cách chăm sóc, nối câu q3.
> Hình gốc, dùng lại ở món Chơi `tray_dog`, câu q3, lựa chọn q5_dog, từ `pet`, và bài năm.

#### group explore_farm
label.en: Farm animals
label.vi: Vật nuôi trong chuồng
color: nau_dat
sentence.en: Farm animals live in a shed or yard.
sentence.vi: Vật nuôi trong chuồng sống ở chuồng hay ngoài sân.
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu
examples.1.en: buffaloes help on the rice field
examples.1.vi: trâu giúp cày ruộng
examples.2.en: hens give us eggs
examples.2.vi: gà cho mình trứng
examples.3.en: ducks and pigs
examples.3.vi: vịt và lợn
examples.4.en: people look after them
examples.4.vi: người chăm sóc chúng
> Tên nhóm VI "Vật nuôi trong chuồng", không viết "Vật nuôi" trơn (bảng Tên gọi ở `_topic.md`). Không nói chuyện nuôi để lấy thịt (mục An toàn).
> Câu w2 ở trên cũng dùng ảnh trâu này; bé gặp trâu hai lần ở bài đầu, không sao, vì câu w2 hỏi chuyện bay, không hỏi nhóm.

#### group explore_wild
label.en: Wild animals
label.vi: Động vật hoang dã
color: cham
sentence.en: Wild animals live free, far from homes.
sentence.vi: Động vật hoang dã sống tự do, xa nhà của người.
image.brief: [ảnh] Một con voọc chà vá chân nâu ngồi trên cành cây trong rừng, thấy cả con, rõ mặt xám, chân nâu đỏ; không có người, không có biển, không có chữ, không thấy chuồng. Ưu tiên ảnh chụp ở Sơn Trà, Đà Nẵng. Từ khoá tìm ảnh (EN): red-shanked douc langur tree
image.alt.en: A douc in a tree
image.alt.vi: Con voọc trên cây
examples.1.en: monkeys in the forest
examples.1.vi: voọc, khỉ trong rừng
examples.2.en: egrets in the rice field
examples.2.vi: cò ngoài đồng lúa
examples.3.en: they find their own food
examples.3.vi: chúng tự tìm thức ăn
examples.4.en: let them live free
examples.4.vi: để chúng sống tự do
> Ví dụ bốn là lời khuyên bé làm được: không bắt, không nuôi động vật hoang dã (nói bằng câu khẳng định). Voọc chà vá chân nâu là loài quý ở Việt Nam [CẦN KIỂM]; thẻ thưởng nói thêm.

### new_words
id: 1e4a56a1-b525-4e8d-b5b2-06411e51547b
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: animal, pet, wild_animal

## Chơi

> Bé chọn ba thú cưng: một con biết đi, một con biết bay, một con biết bơi. Đạt khi đủ ba nhóm và không chọn con vật hoang dã nào. Chạm hình đã chọn để bỏ ra.
> Dùng ngay ô "Pets" và ô "Wild animals":
> - nhóm biết bay và biết bơi buộc bé chọn vẹt, cá vàng: thú cưng không chỉ là con bốn chân (`pets_have_four_legs`);
> - mỗi món bẫy giống một nhóm: voọc đi, trèo như chó mèo; cò bay như vẹt; cá sấu bơi như cá vàng. Bé phải nghĩ "con này có sống cùng nhà với người không", không chọn theo cách di chuyển.
> Vì sao là `build_tray`: schema v1 chỉ có block này ở phần Chơi. Kệ bảy món, toàn ảnh chụp.

### tray
id: e5503496-dbcf-4470-8455-2d504a5d11ca
type: build_tray
version: 1
prompt.en: Pick three pets
prompt.vi: Chọn ba con thú cưng
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick one that walks, flies and swims.
messages.start.vi: Em chọn một con biết đi, một con biết bay, một con biết bơi nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Pets can walk, fly or swim.
messages.balanced.vi: Tuyệt! Thú cưng có con biết đi, có con biết bay, có con biết bơi.
messages.has_limited.en: That one is wild. It lives free.
messages.has_limited.vi: Con này là động vật hoang dã. Nó sống tự do.
messages.missing.tray_walk.en: You still need a pet that walks.
messages.missing.tray_walk.vi: Em còn thiếu một thú cưng biết đi.
messages.missing.tray_fly.en: You still need a pet that flies.
messages.missing.tray_fly.vi: Em còn thiếu một thú cưng biết bay.
messages.missing.tray_swim.en: You still need a pet that swims.
messages.missing.tray_swim.vi: Em còn thiếu một thú cưng biết bơi.

#### group tray_walk
label.en: Walks
label.vi: Biết đi
color: gi_dong
role: required

#### group tray_fly
label.en: Flies
label.vi: Biết bay
color: vang_hoe
role: required

#### group tray_swim
label.en: Swims
label.vi: Biết bơi
color: cham
role: required

#### group tray_not
label.en: Not a pet
label.vi: Không phải thú cưng
color: do_son
role: limit

#### item tray_dog
label.en: Dog
label.vi: Con chó
group: tray_walk
image.brief: Dùng lại hình `explore_pets`. Từ khoá tìm ảnh (EN): yellow dog lying porch Vietnam
image.alt.en: A dog lying on the floor
image.alt.vi: Chú chó nằm trên sàn nhà

#### item tray_douc
label.en: Douc
label.vi: Con voọc
group: tray_not
image.brief: Dùng lại hình `explore_wild`. Từ khoá tìm ảnh (EN): red-shanked douc langur tree
image.alt.en: A douc in a tree
image.alt.vi: Con voọc trên cây

#### item tray_parakeet
label.en: Parakeet
label.vi: Vẹt yến phụng
group: tray_fly
image.brief: [ảnh] Một con vẹt yến phụng lông xanh lá đậu trên thanh gỗ, nhìn ngang, thấy cả con; nền mờ trong nhà, có thể thấy vài nan lồng mờ phía sau; không có người, không có chữ, không có nhãn hiệu. Từ khoá tìm ảnh (EN): budgerigar perch cage green
image.alt.en: A parakeet on a perch
image.alt.vi: Con vẹt yến phụng đậu trên thanh gỗ
> Chọn vẹt nuôi (yến phụng), không chọn chim chào mào, chim sáo nhốt lồng: chim hoang dã bị bắt về nuôi là chuyện không nên khuyến khích.

#### item tray_croc
label.en: Crocodile
label.vi: Cá sấu
group: tray_not
image.brief: Dùng lại hình `q1_reptiles` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): Siamese crocodile basking riverbank side view
image.alt.en: A crocodile on a riverbank
image.alt.vi: Con cá sấu trên bờ sông
> Theo hình designer chọn (SK-041, designer 12/11): dùng lại ảnh cá sấu Xiêm hoang dã của *Khủng long*, như brief cũ cho phép. Ảnh có miệng há phơi nắng, không có con mồi. Mọi chỗ cá sấu của chủ đề (câu q6 bài này, câu q2 bài ba, bài sáu) trỏ thẳng về ảnh gốc này.

#### item tray_cat
label.en: Cat
label.vi: Con mèo
group: tray_walk
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

#### item tray_goldfish
label.en: Goldfish
label.vi: Cá vàng
group: tray_swim
image.brief: [ảnh] Một con cá vàng đuôi dài bơi trong bể kính có cây thuỷ sinh xanh, nhìn ngang, thấy cả con; không có người, không có nhãn hiệu, không có chữ. Từ khoá tìm ảnh (EN): goldfish aquarium plants side view
image.alt.en: A goldfish in a tank
image.alt.vi: Cá vàng trong bể
> Hình gốc, dùng lại ở câu q6 bài này và các bài hai, bốn, năm.

#### item tray_egret
label.en: Egret
label.vi: Con cò
group: tray_not
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2 (Explorer 3·3·0). Hai format: `true_false` (q1, q3), `single_choice` (q2, q4, q5, q6; ba lựa chọn). Bài này không dùng `order_sequence`: ý của bài không có thứ tự tự nhiên.
> Mọi câu có hình ở câu hỏi; mọi lựa chọn có hình. Không câu nào hỏi tên hay chữ của lựa chọn (luật Explorer số 1).

### q1
id: 93491cc2-b68b-4bbd-a7f9-2d2626eb0a68
format: true_false
version: 1
dok: 1
prompt.en: A cat can be a pet.
prompt.vi: Con mèo có thể là thú cưng.
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm
answer: true
hint.en: Look where this cat is resting.
hint.vi: Em nhìn xem con mèo đang nằm ở đâu nhé.
explanation_correct.en: Yes! Many cats live with people.
explanation_correct.vi: Đúng rồi! Nhiều chú mèo sống cùng nhà với người.
explanation_wrong.en: This is true. A cat can be a pet.
explanation_wrong.vi: Câu này đúng. Mèo có thể là thú cưng.
> Câu nhớ lại ý chính một. Gợi ý chỉ vào điều thấy trong hình (bậc thềm nhà).

### q2
id: 60c4ef15-56a4-46a1-b5f7-4ba96eea643c
format: single_choice
version: 1
dok: 1
prompt.en: Which one is a wild animal?
prompt.vi: Con nào là động vật hoang dã?
image.brief: Dùng lại hình `w1` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): rice field wind waves Vietnam
image.alt.en: Wind blowing over a rice field
image.alt.vi: Gió thổi trên cánh đồng lúa
hint.en: Which one lives far from people?
hint.vi: Em nghĩ xem con nào sống xa con người?
explanation_correct.en: Yes! The douc lives free in the forest.
explanation_correct.vi: Đúng rồi! Con voọc sống tự do trong rừng.
explanation_wrong.en: The answer is the douc. It lives free.
explanation_wrong.vi: Đáp án là con voọc. Voọc sống tự do trong rừng.
> Đáp án là ảnh ô Học "Wild animals"; mèo là món Chơi, gà mái bé đã gặp ở nhà, nên đáp án không là hình duy nhất bé đã thấy hôm nay.
> Hình câu hỏi là cánh đồng trống, không có rừng (tránh gợi đáp án).

#### option q2_cat
correct: false
label.en: cat
label.vi: con mèo
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

#### option q2_hen
correct: false
label.en: hen
label.vi: con gà mái
image.brief: Dùng lại hình `w3_hen` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): brown hen standing farmyard side view
image.alt.en: A hen in a yard
image.alt.vi: Con gà mái trong sân

#### option q2_douc
correct: true
label.en: douc
label.vi: con voọc
image.brief: Dùng lại hình `explore_wild`. Từ khoá tìm ảnh (EN): red-shanked douc langur tree
image.alt.en: A douc in a tree
image.alt.vi: Con voọc trên cây

### q3
id: 22ef9f83-1ef8-4719-a09f-d2674a1802af
format: true_false
version: 1
dok: 1
prompt.en: Pets find their own food.
prompt.vi: Thú cưng tự đi tìm thức ăn.
image.brief: Dùng lại hình `explore_pets`. Từ khoá tìm ảnh (EN): yellow dog lying porch Vietnam
image.alt.en: A dog lying on the floor
image.alt.vi: Chú chó nằm trên sàn nhà
answer: false
hint.en: Who fills the bowl for a pet?
hint.vi: Em nghĩ xem ai đổ thức ăn vào bát cho thú cưng?
explanation_correct.en: We feed our pets every day.
explanation_correct.vi: Mình cho thú cưng ăn mỗi ngày.
explanation_wrong.en: This is false. People feed their pets.
explanation_wrong.vi: Câu này sai. Người cho thú cưng ăn.
> Câu khẳng định, đáp án Sai (không viết câu phủ định, luật Explorer số 5). Nối ví dụ bốn của ô "Pets" và ý chính hai (động vật hoang dã thì tự tìm thức ăn).

### q4
id: ed329b1e-7036-4cd1-9836-1d4d727e4c0b
format: single_choice
version: 1
dok: 2
prompt.en: This kitten is hungry. What can it eat?
prompt.vi: Mèo con đang đói. Mèo con ăn được gì?
image.brief: [ảnh] Một con mèo con lông vằn ngồi trên khúc gỗ, nền cây xanh, ngẩng đầu nhìn lên, thấy cả con; không có bát, không có thức ăn trong hình, không có người, không có chữ. Từ khoá tìm ảnh (EN): kitten sitting floor looking up
image.alt.en: A kitten looking up
image.alt.vi: Mèo con ngẩng đầu nhìn lên
hint.en: Think what cats like to catch.
hint.vi: Em nghĩ xem mèo thích bắt con gì nhé.
explanation_correct.en: Yes! Cats like fish. Give fresh water, too.
explanation_correct.vi: Đúng rồi! Mèo thích ăn cá. Nhớ cho mèo uống nước sạch nữa.
explanation_wrong.en: The answer is the small fish.
explanation_wrong.vi: Đáp án là cá nhỏ. Mèo thích ăn cá.
> DOK 2: áp dụng "mình chăm sóc thú cưng" vào việc chọn thức ăn. Hai câu EN bốn từ và bốn từ; cả màn dưới mười lăm từ.
> Bó cỏ và nải chuối là đồ ăn của con vật khác và của người, chuẩn bị cho bài sáu (con vật ăn khác nhau).
> Rà chữ tester 12/11 (N3, n4, n11): đáp án đổi từ "cơm trộn cá" sang "cá nhỏ". Mèo là loài ăn thịt; cơm trộn cá là thói quen nuôi, không phải lời khuyên nên dạy; gợi ý "mèo thích bắt con gì" nay khớp đáp án; ba nhãn cùng dạng. Bỏ dòng `[CẦN KIỂM]` về cơm trộn cá.
> Hình câu hỏi là hình gốc, dùng lại ở bài hai q2, bài ba w1, bài bốn q3.

#### option q4_fish
correct: true
label.en: small fish
label.vi: cá nhỏ
image.brief: [ảnh] Một đàn cá nhỏ còn sống bơi trong nước nông trong, chụp từ trên xuống hoặc ngang; không phải cá đã chết, không trong rổ, không có người, không có chữ. Cùng kiểu chụp từ trên xuống như hai hình kia. Từ khoá tìm ảnh (EN): small fish swimming shallow water
image.alt.en: Small fish in water
image.alt.vi: Cá nhỏ dưới nước
> Hình gốc (chuyển từ `q1_fish` bài sáu lên đây, rà chữ tester 12/11 N3), dùng lại ở bài sáu q1 và q6.

#### option q4_grass
correct: false
label.en: grass
label.vi: bó cỏ
image.brief: [ảnh] Một khay cỏ tươi xanh mọc dày trong hộp kính, chụp chéo từ trên xuống; không có con vật, không có người, không có chữ. Từ khoá tìm ảnh (EN): bundle fresh green grass
image.alt.en: Fresh green grass
image.alt.vi: Cỏ tươi
> Theo hình designer chọn (designer 12/11): khay cỏ, không phải bó cỏ; `alt` sửa theo. Nhãn "grass" · "bó cỏ" là chữ app đọc, giữ nguyên theo lệnh không đổi chữ trẻ nghe; người duyệt xem có nên đổi nhãn VI thành "cỏ tươi".
> Hình gốc, dùng lại ở bài sáu (q1, q6, từ `plant`).

#### option q4_banana
correct: false
label.en: bananas
label.vi: nải chuối
image.brief: [ảnh] Một nải chuối chín vàng đặt trên nền gỗ, chụp chéo từ trên xuống; không có nhãn dán, không có người, không có chữ. Từ khoá tìm ảnh (EN): bunch ripe bananas wooden table
image.alt.en: A bunch of bananas
image.alt.vi: Nải chuối chín
> Hình gốc, dùng lại ở bài sáu q6. Nhãn EN số nhiều "bananas" vì là cả nải; hai nhãn kia là danh từ không đếm được, cùng dạng "thứ để ăn".

### q5
id: ea58062f-dbd2-444f-a247-06bd52d15ea9
format: single_choice
version: 1
dok: 2
prompt.en: Which animal finds its own food?
prompt.vi: Con nào tự đi tìm thức ăn?
image.brief: Dùng lại hình `q3` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): village house yard Vietnam morning
image.alt.en: A yard in a village
image.alt.vi: Sân nhà ở làng quê
hint.en: Think: who feeds a pet?
hint.vi: Em nghĩ xem: ai cho thú cưng ăn?
explanation_correct.en: Yes! An egret is wild. It catches food.
explanation_correct.vi: Đúng rồi! Cò là động vật hoang dã. Cò tự bắt mồi.
explanation_wrong.en: The answer is the egret. It is wild.
explanation_wrong.vi: Đáp án là con cò. Cò là động vật hoang dã.
> DOK 2: dùng ý "động vật hoang dã tự tìm thức ăn" để phân loại. Cả ba ảnh bé đã gặp ở phần Chơi, không ảnh nào mới hay nổi bật.
> Hình câu hỏi là hình vẽ (sân nhà), lựa chọn là ảnh chụp: luật "một loại hình" áp cho các lựa chọn với nhau, như *Hô hấp* bài một q1.

#### option q5_parakeet
correct: false
label.en: parakeet
label.vi: vẹt yến phụng
image.brief: Dùng lại hình `tray_parakeet`. Từ khoá tìm ảnh (EN): budgerigar perch cage green
image.alt.en: A parakeet on a perch
image.alt.vi: Con vẹt yến phụng đậu trên thanh gỗ

#### option q5_egret
correct: true
label.en: egret
label.vi: con cò
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ

#### option q5_dog
correct: false
label.en: dog
label.vi: con chó
image.brief: Dùng lại hình `explore_pets`. Từ khoá tìm ảnh (EN): yellow dog lying porch Vietnam
image.alt.en: A dog lying on the floor
image.alt.vi: Chú chó nằm trên sàn nhà

### q6
id: f3a7f9d5-9428-44dc-b99f-19120c8fbf32
format: single_choice
version: 1
dok: 2
misconception: pets_have_four_legs
prompt.en: Which one can be a pet?
prompt.vi: Con nào có thể là thú cưng?
image.brief: [ảnh] Một góc phòng khách có tủ gỗ, cửa sổ, đèn (ảnh không chụp ở Việt Nam); không có con vật, không có bể cá, không có người, không có tranh ảnh hay chữ trên tường. Từ khoá tìm ảnh (EN): living room wooden chairs window
image.alt.en: A living room
image.alt.vi: Phòng khách trong nhà
hint.en: Think about the pets in the lesson.
hint.vi: Em nhớ lại những con thú cưng trong bài nhé.
explanation_correct.en: Yes! A goldfish is a pet. It has no legs.
explanation_correct.vi: Đúng rồi! Cá vàng là thú cưng. Cá vàng không có chân.
explanation_wrong.en: The answer is the goldfish. Pets can swim.
explanation_wrong.vi: Đáp án là cá vàng. Thú cưng có con biết bơi.
> Câu misconception (`pets_have_four_legs`), bằng hình: đáp án là con duy nhất không có chân; hai lựa chọn sai đều có bốn chân và đều là động vật hoang dã. Bé còn giữ quan niệm "thú cưng có bốn chân" sẽ chọn voọc hoặc cá sấu.
> DOK 2: phân loại, phải bỏ qua một đặc điểm gây nhiễu (số chân). Giải thích khi đúng có ba câu ngắn, mỗi câu tối đa năm từ.
> Hình câu hỏi là phòng khách trống: gợi "sống trong nhà" mà không cho thấy con nào. Không có bể cá trong hình (bằng chứng của đáp án).

#### option q6_goldfish
correct: true
label.en: goldfish
label.vi: cá vàng
image.brief: Dùng lại hình `tray_goldfish`. Từ khoá tìm ảnh (EN): goldfish aquarium plants side view
image.alt.en: A goldfish in a tank
image.alt.vi: Cá vàng trong bể

#### option q6_croc
correct: false
label.en: crocodile
label.vi: cá sấu
image.brief: Dùng lại hình `q1_reptiles` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): Siamese crocodile basking riverbank side view
image.alt.en: A crocodile on a riverbank
image.alt.vi: Con cá sấu trên bờ sông

#### option q6_douc
correct: false
label.en: douc
label.vi: con voọc
image.brief: Dùng lại hình `explore_wild`. Từ khoá tìm ảnh (EN): red-shanked douc langur tree
image.alt.en: A douc in a tree
image.alt.vi: Con voọc trên cây

## Từ vựng

### animal
id: 87cc4371-ecb9-4567-8299-d23d41b78b24
tier: core
term.en: animal
term.vi: con vật
example.en: A hen is an animal.
example.vi: Con gà là một con vật.
image.brief: Dùng lại hình `explore_animals`. Từ khoá tìm ảnh (EN): hen with chicks pecking yard
image.alt.en: A hen and chicks looking for food
image.alt.vi: Gà mẹ và gà con tìm thức ăn

### pet
id: 9960d14b-88c2-4ecb-b9b1-6d6c3b9cb59b
tier: core
term.en: pet
term.vi: thú cưng
example.en: A dog can be a pet.
example.vi: Con chó có thể là thú cưng.
image.brief: Dùng lại hình `explore_pets`. Từ khoá tìm ảnh (EN): yellow dog lying porch Vietnam
image.alt.en: A dog lying on the floor
image.alt.vi: Chú chó nằm trên sàn nhà

### wild_animal
id: def95c70-dd28-4a28-8abf-3992d72ceac7
tier: core
term.en: wild animal
term.vi: động vật hoang dã
example.en: A douc is a wild animal.
example.vi: Con voọc là động vật hoang dã.
image.brief: Dùng lại hình `explore_wild`. Từ khoá tìm ảnh (EN): red-shanked douc langur tree
image.alt.en: A douc in a tree
image.alt.vi: Con voọc trên cây

### farm_animal
id: 8a0a6443-c03a-410d-892a-664b61c18de1
tier: extra
term.en: farm animal
term.vi: vật nuôi trong chuồng
example.en: A buffalo is a farm animal.
example.vi: Con trâu là vật nuôi trong chuồng.
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu

## Thưởng

### douc_card
id: 08d6dc00-dc53-4b46-bc63-6e3ff0dc2946
set: animals
rarity: rare
name.en: Red-shanked douc
name.vi: Voọc chà vá chân nâu
tag.en: Lives in Vietnam
tag.vi: Sống ở Việt Nam
fact.en: This monkey lives in forests in Vietnam. Its legs look like red socks.
fact.vi: Voọc chà vá chân nâu sống trong rừng ở Việt Nam. Chân voọc màu nâu đỏ, trông như đi tất.
image.brief: Dùng lại hình `explore_wild`. Từ khoá tìm ảnh (EN): red-shanked douc langur tree
image.alt.en: A douc in a tree
image.alt.vi: Con voọc trên cây
> [CẦN KIỂM] Voọc chà vá chân nâu sống ở rừng miền Trung Việt Nam (bán đảo Sơn Trà, Đà Nẵng nổi tiếng nhất), cả ở Lào và Cam-pu-chia; phần chân dưới màu nâu đỏ. Câu thứ nhất bảy từ, câu thứ hai sáu từ.
> `rarity: rare` vì là loài quý của Việt Nam. Bộ thẻ mới `set: animals` (ios-dev thêm khoá `collectible.set.animals`).

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật, trừ hình câu q5 dùng lại hình vẽ sân nhà của *Hô hấp*. Không có hình tự vẽ mới. Mỗi hình một con vật hoặc một vật, thấy cả con, nền đơn giản, không chữ (Quy ước hình ở `_topic.md`).
- **Ảnh cần tìm (mười lăm):**
  - Khởi động (bốn): góc vườn có hàng rào tre (câu w1); bông sen hồng; vịt cỏ trên bờ ao; nón lá trên ghế tre.
  - Học (ba): gà mẹ và gà con bới đất; chó vàng nằm trên hiên; voọc chà vá chân nâu trên cây.
  - Chơi (ba): vẹt yến phụng; cá sấu bên bờ nước (thử dùng lại ảnh *Khủng long* trước); cá vàng trong bể.
  - Quiz (năm, chưa tính các hình dùng lại): mèo con ngẩng nhìn (câu q4); đàn cá nhỏ bơi; bó cỏ; nải chuối; phòng khách trống (câu q6).
  - Tổng mười lăm ảnh mới: bốn, ba, ba, năm.
- **Dùng lại từ chủ đề khác:** `khung-long-la-gi/w3_cat`, `w3_hen`; `trai-dat-rat-lau-ve-truoc/w1_buffalo`; `ho-hap/vi-sao-ta-phai-tho` các hình `w1` (ruộng lúa), `q3` (sân nhà, hình vẽ), `tray_egret`.
- **Ảnh khó:** voọc chà vá chân nâu không thấy người, không thấy chuồng, không có chữ (Commons có nhiều ảnh ở Sơn Trà; chọn ảnh hoang dã). Cá nhỏ phải còn sống, trong nước, không trong rổ hay trên thớt.
- **Cùng khung trong một câu:** w1 ba vật đơn lẻ ngoài trời, cùng cỡ; q2, q5, q6 ba con vật cả con, nền thật; q4 ba món ăn chụp chéo từ trên xuống, cùng kiểu nền.
- **Kệ Chơi:** bảy món đều là ảnh chụp con vật cả con, nền thật; ba món bẫy cũng là ảnh chụp, để kiểu hình không báo đúng sai.
- **An toàn:** không người lộ mặt; cá sấu miệng khép; không con vật bị xích, nhốt chật.
- **Màu:** Học: con vật `gi_dong`, thú cưng `vang_hoe`, vật nuôi trong chuồng `nau_dat`, động vật hoang dã `cham`. Chơi: biết đi `gi_dong`, biết bay `vang_hoe`, biết bơi `cham`, không phải thú cưng `do_son`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core: animal, pet, wild animal).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món.
  - Khởi động: `single_choice` (w1, ba lựa chọn), `true_false` (w2, Sai). Cả hai `prior_knowledge`, DOK một.
  - Quiz: `true_false` (q1 Đúng, q3 Sai), `single_choice` (q2, q4, q5, q6, mỗi câu ba lựa chọn). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`pets_have_four_legs`).
  - `true_false` không có `labels` (Explorer hiện biểu tượng gật đầu, lắc đầu).
- **Vị trí đáp án đúng:** w1 thứ hai; q2 thứ ba; q4 thứ nhất; q5 thứ hai; q6 thứ nhất.
- **Màn Chơi, ví dụ để kiểm:** mở màn → `start`; Con chó, Vẹt yến phụng, Cá vàng → `balanced`; Con mèo, Con chó, Cá vàng (thiếu nhóm bay) → `missing.tray_fly`; chạm thêm Con cò → `full`; bỏ Con mèo, đặt Con cò → `has_limited`.
- **Số từ EN trên một màn (Explorer tối đa mười lăm):** Khởi động và Quiz đều dưới mười lăm nếu chỉ tính câu hỏi (hình không chữ, lựa chọn không chữ). Màn nhiều chữ nhất là q4 (tám từ câu hỏi). Gợi ý và giải thích hiện sau khi chạm, nên tính riêng. Màn Học: mỗi ô một câu tối đa tám từ. Màn Chơi: lệnh ba từ, lời nhắn tối đa tám từ, nhưng nhãn bảy món và bốn chip nhóm cộng lại vượt mười lăm; xem câu hỏi cho ios-dev ở ticket.
- **Câu "Em nghĩ sao?"** (đề xuất schema v1.1 `think_first`, như các chủ đề Discoverer), đặt trước phần Học:
  - Câu: "Are people animals? What do you think?" · "Con người có phải là động vật không? Em nghĩ sao?"
  - Lựa chọn, không chấm điểm: biểu tượng gật đầu, lắc đầu, và "I am not sure" · "Em chưa chắc" (Explorer cần một biểu tượng cho lựa chọn này).
  - Bài hai dạy ý này (ô "People", q6). Bài sáu hỏi lại ở Khởi động w3 ("People are animals, too.", Đúng).
- **Bộ thẻ `set: animals`:** chưa có khoá `collectible.set.animals`; app hiện "Thẻ" tới khi ios-dev thêm.
- **Từ EN có thể ngoài Starters/Movers** (theo trí nhớ, cần đối chiếu): pet, wild, douc, parakeet, egret, conical hat, lotus, crocodile, kitten (Movers?), shed, porch (chỉ ở `alt`).
- **Giọng đọc:** nghe thử EN "douc", "parakeet". VI không có ký hiệu, không chữ số.
