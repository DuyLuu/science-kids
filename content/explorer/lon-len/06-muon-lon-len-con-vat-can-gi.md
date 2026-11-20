---
id: aa01f485-bc5b-4d5c-910e-374ff6f01122
topic: lon-len
slug: muon-lon-len-con-vat-can-gi
order: 6
stage: review
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: What animals need to grow
vi: Muốn lớn lên, con vật cần gì?
> Giữ đúng tên ở `content/syllabus.json` (key `new-life`, bài số sáu).

## Mục tiêu
en: I know what all animals need to grow.
vi: Em biết con vật nào cũng cần thức ăn, nước và không khí.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 18/11/2026. Ticket SK-053. Mọi dòng `id:` để trống; chạy `ids` sau bài 5 (Khởi động trỏ bài 5 và bài 1).
> Ticket ghi "I can say what all animals need to grow." (chín từ); đổi "can say" thành "know" còn tám từ. Câu VI giữ đúng ticket.
> Sườn: Oak Y2 *New life* L5 `the-basic-needs-of-animals` (con vật, kể cả người, cần thức ăn, nước, không khí; misconception "mỗi con vật cần những thứ khác nhau"). Không chép câu, hình, ví dụ của sườn.
> `stage: review`: Khởi động ôn trộn bài 1 và bài 5, cộng một câu ôn chủ đề cách khoảng một tháng.
> Ranh giới (SK-053): *Chuỗi thức ăn* bài 1 đã dạy "con vật cần thức ăn để sống"; *Sinh vật sống ở đâu?* bài 3 "vật sống cần nước"; *Cây quanh em* bài 2 cây cần gì. Bài này thêm **không khí** và **nhu cầu giống nhau dù món ăn khác nhau**; không dạy lại nơi sống, chuỗi thức ăn, nhu cầu của cây. Gắn với `all_animals_eat_same` (*Gọi tên và nhóm động vật* bài 6): món khác nhau, nhu cầu giống nhau; không dùng lại key đó. Không lấy cá làm câu hỏi về không khí; ví dụ cá ở ô Air khớp câu "cá thở trong nước bằng mang" của *Gọi tên và nhóm động vật* bài 4.

## Ý chính
1.en: Animals need food, water and air.
1.vi: Con vật cần thức ăn, nước và không khí.
2.en: They eat different food.
2.vi: Mỗi con ăn một món khác nhau.
3.en: People need the same things, too.
3.vi: Người cũng cần những thứ đó.
> Đúng chữ ở "Bảng soạn" SK-053.

## Khởi động

> Ba câu (bài `review`). w1 ôn bài 5 hôm trước (cây đậu già khô). w2 ôn bài 1 (chó già từng là chó con). w3 ôn *Cơ thể của em* bài 3 (phổi giúp em thở), mốc khoảng một tháng (mười hai bài trước: bảy bài *Cây quanh em* và năm bài đầu chủ đề này, ba bài mỗi tuần), nối sang ô Air hôm nay.

### w1
id: 40bd7b3b-f503-487d-8c35-5f921da29ab6
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: lon-len/vong-doi-cua-cay
prompt.en: Old bean plants dry and turn brown.
prompt.vi: Cây đậu già khô lại, ngả nâu.
image.brief: Dùng lại hình `explore_dry` ở bài `lon-len/vong-doi-cua-cay`. Từ khoá tìm ảnh (EN): dry bean plants end of season
image.alt.en: Dry, brown bean plants
image.alt.vi: Cây đậu khô, ngả nâu
answer: true
hint.en: Look at the stems and the pods.
hint.vi: Em nhìn thân cây và quả đậu nhé.
explanation_correct.en: Yes! Then their seeds grow new plants.
explanation_correct.vi: Đúng rồi! Rồi hạt của chúng mọc thành cây mới.
explanation_wrong.en: This is true. Old plants dry up.
explanation_wrong.vi: Câu này đúng. Cây già khô dần.
feedback_false.en: These bean plants are old and dry.
feedback_false.vi: Mấy cây đậu này đã già và khô.
> Câu mới, nói ngược chiều câu q3 của bài 5 ("Old bean plants stay green forever.", Sai). Không có chữ "die".
> 19/11 (tester B1, quyết định b): ảnh không có lá vàng, chỉ có thân và quả khô màu nâu. `prompt` đổi từ "Old bean plants turn dry and yellow." · "Cây đậu già khô dần và vàng úa."; gợi ý đổi từ "Look at the leaves and stems." · "Em nhìn lá và thân cây nhé."; `alt` đổi theo bài 5.

### w2
id: 5d91fdcf-3d92-414e-a494-a186a937a485
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: lon-len/vat-song-nao-cung-co-vong-doi
prompt.en: An old dog was born old.
prompt.vi: Chú chó già sinh ra đã già rồi.
image.brief: Dùng lại hình `explore_old` ở bài `lon-len/vat-song-nao-cung-co-vong-doi`. Từ khoá tìm ảnh (EN): old dog grey muzzle
image.alt.en: A dog with a grey face
image.alt.vi: Chú chó có mõm bạc
answer: false
hint.en: Think of the newborn puppies.
hint.vi: Em nghĩ tới mấy chú chó con mới sinh nhé.
explanation_correct.en: Every old dog was a puppy once.
explanation_correct.vi: Chú chó già nào cũng từng là chó con.
explanation_wrong.en: This is false. It was a puppy first.
explanation_wrong.vi: Câu này sai. Chó già từng là chó con.
feedback_true.en: Old dogs were tiny puppies long ago.
feedback_true.vi: Chó già ngày xưa cũng là chó con bé xíu.
> Ôn bốn chặng của bài 1 và ý `grown_ups_never_babies` của bài 2 bằng con vật; không gắn key.

### w3
id: e871bcb7-5ef1-4a6c-8ca7-42a072be900f
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: co-the-cua-em/bo-phan-ben-trong-co-the
prompt.en: Your stomach helps you breathe.
prompt.vi: Dạ dày giúp em thở.
image.brief: Dùng lại hình `tray_stomach` ở bài `ho-hap/duong-di-cua-khong-khi`.
image.alt.en: A stomach
image.alt.vi: Dạ dày
answer: false
hint.en: Think of the parts in your chest.
hint.vi: Em nghĩ tới bộ phận trong ngực nhé.
explanation_correct.en: Your lungs help you breathe.
explanation_correct.vi: Phổi giúp em thở.
explanation_wrong.en: This is false. Your lungs help you breathe.
explanation_wrong.vi: Câu này sai. Phổi mới giúp em thở.
feedback_true.en: Your stomach holds and mixes your food.
feedback_true.vi: Dạ dày chứa và nhào trộn thức ăn.
> Câu mới; bài nguồn có câu q3 "Which part do you breathe with?" (chọn hình), không có câu Đúng/Sai này.

## Học

> Bốn ô: thức ăn (món khác nhau), nước, không khí, người cũng vậy. Ô Food nhắc lại *Chuỗi thức ăn* bài 1 bằng một câu, nhấn ý "món khác nhau, cùng cần ăn".
> Ảnh mới chủ yếu là chó (uống nước, thở hổn hển) để bé thấy cùng một con vật cần cả nước và không khí; chó cũng là con vật của bài 1.

### explore
id: 224b07d0-7782-463e-8a8e-d061fd76151d
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_food
label.en: Food
label.vi: Thức ăn
color: vang_hoe
sentence.en: Animals eat different food to grow.
sentence.vi: Mỗi con vật ăn món khác nhau để lớn.
image.brief: Dùng lại hình `explore_plants` ở bài `goi-ten-va-nhom-dong-vat/con-vat-an-gi`. Từ khoá tìm ảnh (EN): water buffalo grazing grass field
image.alt.en: A buffalo eating grass
image.alt.vi: Con trâu gặm cỏ
examples.1.en: a buffalo eats grass
examples.1.vi: trâu ăn cỏ
examples.2.en: a cat eats fish
examples.2.vi: mèo ăn cá
examples.3.en: a hen pecks rice
examples.3.vi: gà mổ thóc
> Ý chính hai. Không dạy lại nhóm ăn cỏ, ăn thịt (*Gọi tên và nhóm động vật* bài 6) hay cách kiếm ăn (*Chuỗi thức ăn* bài 1).

#### group explore_water
label.en: Water
label.vi: Nước
color: cham
sentence.en: Animals need water to drink.
sentence.vi: Con vật cần nước để uống.
image.brief: [ảnh] Một chú chó đang cúi uống nước từ bát hay vũng nước sạch, nhìn ngang thấy cả con; không vòng cổ có chữ, không bát có chữ hay nhãn hiệu, không người, không chữ. Ảnh ngang có khoảng trống (khung vuông ô Học, khung 4:3 câu q3, thẻ từ 2:1). Từ khoá tìm ảnh (EN): dog drinking water; dog drinking from bowl; dog drinking puddle
image.alt.en: A dog drinking water
image.alt.vi: Chú chó đang uống nước
examples.1.en: a buffalo drinks from the stream
examples.1.vi: trâu uống nước suối
examples.2.en: chicks sip water, too
examples.2.vi: gà con cũng uống nước
examples.3.en: fish live in water
examples.3.vi: cá sống trong nước

#### group explore_air
label.en: Air
label.vi: Không khí
color: gi_dong
sentence.en: Animals breathe air all the time.
sentence.vi: Con vật lúc nào cũng hít thở không khí.
image.brief: [ảnh] Một chú chó thè lưỡi thở hổn hển sau khi chạy, đứng hay nằm trên cỏ, nhìn nghiêng hay chéo thấy cả con; chó trông khoẻ; không vòng cổ có chữ, không người, không chữ. Ảnh ngang có khoảng trống (khung vuông ô Học, khung 4:3 câu q2, thẻ từ 2:1). Từ khoá tìm ảnh (EN): dog panting; dog panting tongue out; dog panting grass
image.alt.en: A dog panting with its tongue out
image.alt.vi: Chú chó thè lưỡi thở hổn hển
examples.1.en: a dog pants after running
examples.1.vi: chó chạy xong thở hổn hển
examples.2.en: you breathe with your lungs
examples.2.vi: em thở bằng phổi
examples.3.en: fish breathe in water with gills
examples.3.vi: cá thở trong nước bằng mang
> Ví dụ ba khớp câu chính ô Gills của *Gọi tên và nhóm động vật* bài 4 ("Fish breathe in water with gills."); không giải thích khí trong nước. Không câu hỏi nào về cá và không khí (SK-053).
> [CẦN KIỂM] Con vật nào cũng cần không khí (cá lấy khí hoà trong nước qua mang); chó thở hổn hển sau khi chạy. Chó thở hổn hển chủ yếu để hạ nhiệt; chữ bé nghe chỉ tả "thở nhanh", "thở hổn hển", không nói mục đích.

#### group explore_you
label.en: People, too
label.vi: Người cũng vậy
color: nau_dat
sentence.en: People need the same things, too.
sentence.vi: Người cũng cần những thứ như con vật.
image.brief: [ảnh] Một bạn nhỏ thổi bong bóng xà phòng ngoài trời, chụp từ phía sau hay nghiêng sao cho không nhận ra mặt (hoặc chỉ thấy bàn tay cầm que thổi và những quả bong bóng bay), nền cây xanh mờ; không chữ, không nhãn hiệu trên lọ xà phòng. Ảnh ngang có khoảng trống (khung vuông ô Học, khung 4:3 câu q5). Từ khoá tìm ảnh (EN): child blowing bubbles from behind; soap bubbles child outdoors; blowing bubbles hands
image.alt.en: Soap bubbles floating in the air
image.alt.vi: Bong bóng xà phòng bay trong không khí
examples.1.en: you eat rice and vegetables
examples.1.vi: em ăn cơm, ăn rau
examples.2.en: you drink water every day
examples.2.vi: em uống nước mỗi ngày
examples.3.en: you breathe in and out
examples.3.vi: em hít vào, thở ra
examples.4.en: your breath can blow bubbles
examples.4.vi: hơi thở của em thổi được bong bóng
> Ý chính ba. Nối *Cơ thể của em* bài 1 (người cũng là động vật) ở câu q5; không dùng lại key `humans_not_animals`, `people_not_animals`.
> Ảnh thật (designer 19/11, SK-053 mục 7): bong bóng xà phòng to bay trên phố, không có bạn nhỏ. Đã rà: câu chính "People need food, water and air, too." và câu q5 tự đủ nghĩa, không trỏ tới người trong ảnh; `alt` "Soap bubbles floating in the air" khớp, giữ. Thêm ví dụ bốn (19/11) để nối ảnh bong bóng với hơi thở của em; cần chạy `tts` cho câu mới.
> Lượt 3 (19/11, tester B6): câu chính đổi từ "People need food, water and air, too." · "Người cũng cần thức ăn, nước và không khí." thành "People need the same things, too." · "Người cũng cần những thứ như con vật.". Câu cũ lặp bốn chữ của ý chính một nên trang một Tổng kết (`KeyPointPictures.match`) ghép ý chính một (con vật) với ảnh bong bóng, ý chính ba (người) với ảnh chó. Câu mới trùng chữ với ý chính ba (people, need, same, things); tính theo luật ghép: ý chính một → ô Water (ảnh chó uống nước), ý chính hai → ô Food, ý chính ba → ô này. Ba thứ cụ thể vẫn ở ba ví dụ đầu (cơm và rau, nước, hít thở); câu VI nói "như con vật" để nghe một mình vẫn đủ nghĩa. Cần chạy `tts`.

### new_words
id: c941aef5-b29d-4bb2-a625-55da6d44718a
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: air, need

## Chơi

> Bé chọn ba thứ con vật nào cũng cần: một món thức ăn (cỏ hoặc chuối), nước, không khí (khăn phơi bay trong gió; ảnh đổi 19/11). Đạt khi đủ ba nhóm và không chọn đồ chơi.
> Món bẫy: ô tô đồ chơi, bóng cao su. Không đặt cá lên kệ (ảnh cá có cả nước, dễ nước đôi giữa "Food" và "Water"). Kệ sáu món, toàn ảnh chụp.

### tray
id: 6e672b1c-809e-45f4-a6cb-5b2bebc40050
type: build_tray
version: 1
prompt.en: Food, water and air
prompt.vi: Thức ăn, nước và không khí
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick food, water and air for animals.
messages.start.vi: Em chọn thức ăn, nước và không khí cho con vật nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Every animal needs all three.
messages.balanced.vi: Tuyệt! Con vật nào cũng cần cả ba thứ.
messages.has_limited.en: Animals do not need toys to live.
messages.has_limited.vi: Con vật không cần đồ chơi để sống.
messages.missing.tray_food.en: You still need some food.
messages.missing.tray_food.vi: Em còn thiếu thức ăn.
messages.missing.tray_water.en: You still need some water.
messages.missing.tray_water.vi: Em còn thiếu nước.
messages.missing.tray_air.en: You still need some air.
messages.missing.tray_air.vi: Em còn thiếu không khí.
> Lời nhắn `has_limited` đúng với cả hai món bẫy.

#### group tray_food
label.en: Food
label.vi: Thức ăn
color: vang_hoe
role: required

#### group tray_water
label.en: Water
label.vi: Nước
color: cham
role: required

#### group tray_air
label.en: Air
label.vi: Không khí
color: gi_dong
role: required

#### group tray_toys
label.en: Toys
label.vi: Đồ chơi
color: do_son
role: limit

#### item tray_grass
label.en: Grass
label.vi: Cỏ tươi
group: tray_food
image.brief: Dùng lại hình `q4_grass` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): bundle fresh green grass
image.alt.en: Fresh green grass
image.alt.vi: Cỏ tươi

#### item tray_car
label.en: Toy car
label.vi: Ô tô đồ chơi
group: tray_toys
image.brief: Dùng lại hình `tray_car` ở bài `sinh-vat-song-o-dau/vat-song-hay-khong-song`. Từ khoá tìm ảnh (EN): red plastic toy car side view
image.alt.en: A red toy car
image.alt.vi: Chiếc ô tô đồ chơi màu đỏ

#### item tray_glass
label.en: Water
label.vi: Cốc nước
group: tray_water
image.brief: Dùng lại hình `w1_water` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): glass of water wooden table
image.alt.en: A glass of water
image.alt.vi: Cốc nước

#### item tray_wind
label.en: Air
label.vi: Không khí
group: tray_air
image.brief: [ảnh] Một dây phơi với những chiếc khăn vải nhiều màu bay lệch hẳn theo gió, nền trời xanh; không người, không chữ, không nhãn hiệu. Ảnh mới của bài (19/11, designer lượt 4; thay hình `w1` ruộng lúa rạp gió của Discoverer *Hô hấp*, rồi thay ảnh chiếc diều của lượt 3). Món Chơi vuông; thẻ từ `air` có mục cắt 2:1 riêng. Từ khoá tìm ảnh (EN): laundry blowing in wind; washing line windy; cloths on clothesline wind
image.alt.en: Cloths blowing on a washing line
image.alt.vi: Khăn vải phơi bay phấp phới trên dây
> Không khí không nhìn thấy được; khăn bay lệch theo gió, tức không khí đang chuyển động. Ảnh ruộng lúa và ảnh diều không còn dùng ở bài này.
> Quyết định 19/11 (phiên chính theo PM): giữ nhóm bẫy "Toys", bỏ ảnh diều vì diều cũng là đồ chơi, dễ lẫn với nhóm bẫy trên kệ chỉ có ảnh. Khăn phơi là đồ dùng trong nhà, không phải đồ chơi, không phải thức ăn, không phải nước.

#### item tray_bananas
label.en: Bananas
label.vi: Nải chuối
group: tray_food
image.brief: Dùng lại hình `q4_banana` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): bunch ripe bananas wooden table
image.alt.en: A bunch of bananas
image.alt.vi: Nải chuối chín

#### item tray_ball
label.en: Rubber balls
label.vi: Bóng cao su
group: tray_toys
image.brief: Dùng lại hình `tray_ball` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): colourful rubber bouncy balls
image.alt.en: Colourful rubber balls
image.alt.vi: Những quả bóng cao su nhiều màu

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1, q4; ba lựa chọn), `true_false` (q2 Đúng, q3 Sai, q5 Đúng, q6 Sai).
> Hình câu `single_choice` là hàng rào tre trung tính. Câu nào cũng tự đủ nghĩa khi chỉ nghe.

### q1
id: 1731c66e-36d3-4722-a6aa-be39ddc5cc33
format: single_choice
version: 1
dok: 1
prompt.en: Which one can animals drink?
prompt.vi: Con vật uống được thứ nào?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of what you drink when hot.
hint.vi: Em nghĩ xem trời nóng em uống gì nhé.
explanation_correct.en: Yes! Every animal needs water to drink.
explanation_correct.vi: Đúng rồi! Con vật nào cũng cần nước để uống.
explanation_wrong.en: The answer is the water. Animals drink it.
explanation_wrong.vi: Đáp án là cốc nước. Con vật uống nước.
> DOK 1: nhớ lại ô Water. Ba ảnh bé đã gặp (cốc nước, ô tô ở kệ Chơi; đá cuội ở bài 5).

#### option q1_stone
correct: false
feedback.en: A stone is hard and dry.
feedback.vi: Hòn đá cứng và khô.
label.en: pebble
label.vi: hòn đá cuội
image.brief: Dùng lại hình `w1_stone` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): smooth pebble stone sand
image.alt.en: A smooth stone
image.alt.vi: Hòn đá cuội

#### option q1_water
correct: true
label.en: water
label.vi: cốc nước
image.brief: Dùng lại hình `w1_water` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): glass of water wooden table
image.alt.en: A glass of water
image.alt.vi: Cốc nước

#### option q1_car
correct: false
feedback.en: A toy car is just for playing.
feedback.vi: Ô tô đồ chơi chỉ để chơi thôi.
label.en: toy car
label.vi: ô tô đồ chơi
image.brief: Dùng lại hình `tray_car` ở bài `sinh-vat-song-o-dau/vat-song-hay-khong-song`. Từ khoá tìm ảnh (EN): red plastic toy car side view
image.alt.en: A red toy car
image.alt.vi: Chiếc ô tô đồ chơi màu đỏ

### q2
id: 15c5c9ea-768a-4fdd-833b-4463a551e248
format: true_false
version: 1
dok: 1
prompt.en: Animals need air to breathe.
prompt.vi: Con vật cần không khí để thở.
image.brief: Dùng lại hình `explore_air`. Từ khoá tìm ảnh (EN): dog panting
image.alt.en: A dog panting with its tongue out
image.alt.vi: Chú chó thè lưỡi thở hổn hển
answer: true
hint.en: Look at how this dog breathes.
hint.vi: Em nhìn chú chó này thở nhé.
explanation_correct.en: Yes! They breathe all day and night.
explanation_correct.vi: Đúng rồi! Con vật thở cả ngày lẫn đêm.
explanation_wrong.en: This is true. Animals need air.
explanation_wrong.vi: Câu này đúng. Con vật cần không khí.
feedback_false.en: This dog breathes fast after running.
feedback_false.vi: Chú chó này chạy xong nên thở nhanh.
> DOK 1: nhớ lại ô Air.
> Phản hồi chỉ tả việc chó thở nhanh, không nói mục đích: chó thở hổn hển chủ yếu để hạ nhiệt, không phải để lấy thêm không khí (tester N1, 19/11).

### q3
id: f1d7340d-c3b9-4634-a045-6f788b971646
format: true_false
version: 1
dok: 1
prompt.en: A dog only needs food to live.
prompt.vi: Chú chó chỉ cần thức ăn là sống được.
image.brief: Dùng lại hình `explore_water`. Từ khoá tìm ảnh (EN): dog drinking water
image.alt.en: A dog drinking water
image.alt.vi: Chú chó đang uống nước
answer: false
hint.en: Look at what this dog is doing.
hint.vi: Em nhìn xem chú chó đang làm gì nhé.
explanation_correct.en: A dog needs food, water and air.
explanation_correct.vi: Chú chó cần thức ăn, nước và không khí.
explanation_wrong.en: This is false. It needs water, too.
explanation_wrong.vi: Câu này sai. Chó còn cần nước nữa.
feedback_true.en: This dog needs water, too.
feedback_true.vi: Chú chó này cũng cần nước.
> DOK 1: nhớ lại ý chính một, nhìn ảnh. "Only" giữ câu khẳng định. Câu nói về một con vật (chó), không phải câu so nhiều con vật như câu q6.

### q4
id: 4cf862f5-8f7e-4c35-acfd-3e6e70459b19
format: single_choice
version: 1
dok: 2
prompt.en: A buffalo and a cat both need what?
prompt.vi: Trâu và mèo đều cần thứ gì?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of what every animal needs.
hint.vi: Em nghĩ tới thứ con vật nào cũng cần nhé.
explanation_correct.en: Yes! Different food, but both need water.
explanation_correct.vi: Đúng rồi! Ăn món khác nhau, nhưng đều cần nước.
explanation_wrong.en: The answer is the water. Both drink it.
explanation_wrong.vi: Đáp án là cốc nước. Cả hai đều uống nước.
> DOK 2: so nhu cầu của hai con vật ăn khác nhau (ý "món khác nhau, nhu cầu giống nhau"). Hai lựa chọn sai là món chỉ một trong hai con ăn. Không dùng ảnh cá làm lựa chọn sai (ảnh cá có nước).

#### option q4_grass
correct: false
feedback.en: A cat does not eat grass.
feedback.vi: Mèo không ăn cỏ.
label.en: grass
label.vi: cỏ tươi
image.brief: Dùng lại hình `q4_grass` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): bundle fresh green grass
image.alt.en: Fresh green grass
image.alt.vi: Cỏ tươi

#### option q4_water
correct: true
label.en: water
label.vi: cốc nước
image.brief: Dùng lại hình `w1_water` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): glass of water wooden table
image.alt.en: A glass of water
image.alt.vi: Cốc nước

#### option q4_mouse
correct: false
feedback.en: A buffalo does not eat mice.
feedback.vi: Trâu không ăn chuột.
label.en: mouse
label.vi: con chuột
image.brief: Dùng lại hình `w2` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`. Từ khoá tìm ảnh (EN): rice field rat sitting ground
image.alt.en: A mouse on the ground
image.alt.vi: Con chuột trên mặt đất
> Ảnh chuột sống, sạch (như gốc). Không cảnh mèo bắt chuột.

### q5
id: c6f13d56-5001-48c0-828a-5859698eef91
format: true_false
version: 1
dok: 2
prompt.en: People need food, water and air, like animals.
prompt.vi: Người cũng cần thức ăn, nước và không khí như con vật.
image.brief: Dùng lại hình `explore_you`. Từ khoá tìm ảnh (EN): child blowing bubbles from behind
image.alt.en: Soap bubbles floating in the air
image.alt.vi: Bong bóng xà phòng bay trong không khí
answer: true
hint.en: Think of what you did today.
hint.vi: Em nghĩ xem hôm nay em đã ăn, uống và thở thế nào nhé.
explanation_correct.en: Yes! People are animals, too.
explanation_correct.vi: Đúng rồi! Con người cũng là động vật.
explanation_wrong.en: This is true. You need all three, too.
explanation_wrong.vi: Câu này đúng. Em cũng cần cả ba thứ.
feedback_false.en: You eat, drink and breathe every day.
feedback_false.vi: Ngày nào em cũng ăn, uống và thở.
> DOK 2: áp ba nhu cầu sang người, nối *Cơ thể của em* bài 1. Câu khẳng định, đáp án Đúng.

### q6
id: 1acd9ad1-7be8-4575-8973-0c3b29211c12
format: true_false
version: 1
dok: 2
misconception: animals_need_different_things
prompt.en: Each animal needs different things to live.
prompt.vi: Mỗi con vật cần những thứ khác nhau để sống.
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm
answer: false
hint.en: Think of a cat and a buffalo.
hint.vi: Em nghĩ về con mèo và con trâu nhé.
explanation_correct.en: All animals need food, water and air.
explanation_correct.vi: Con vật nào cũng cần thức ăn, nước và không khí.
explanation_wrong.en: This is false. Their needs are the same.
explanation_wrong.vi: Câu này sai. Con vật cần những thứ giống nhau.
feedback_true.en: A cat and a buffalo both drink water.
feedback_true.vi: Mèo và trâu đều uống nước.
> Câu misconception (`animals_need_different_things`), DOK 2: bé thấy mỗi con ăn một món nên nghĩ nhu cầu khác nhau, sẽ chạm Đúng. Bé áp ô Food (món khác nhau) cùng ô Water, Air và câu q4 để bác.
> Hình là một con mèo đứng yên (vật bé nghĩ tới), không ăn, không uống; không tự làm bằng chứng. `explanation_correct` là đúng câu `correction` ở `_topic.md`.
> Khác key `all_animals_eat_same` (*Gọi tên và nhóm động vật* bài 6, quan niệm ngược: "con nào cũng ăn giống nhau"). Hai câu cùng dạy "món khác nhau", câu này thêm "nhu cầu giống nhau".

## Từ vựng

### air
id: b4b043af-187b-463c-9dd2-be06eb97a875
tier: core
term.en: air
term.vi: không khí
example.en: Animals breathe air to live.
example.vi: Con vật hít thở không khí để sống.
image.brief: Dùng lại hình `tray_wind` (mục cắt 2:1 riêng của designer). Từ khoá tìm ảnh (EN): laundry blowing in wind
image.alt.en: Cloths blowing on a washing line
image.alt.vi: Khăn vải phơi bay phấp phới trên dây
> Trùng có chủ ý: `air` là từ `extra` ở *Sinh vật sống ở đâu?* bài 1; nâng lên `core` ở bài này (nhu cầu thứ ba của con vật). Từ 19/11 (designer lượt 4) thẻ dùng ảnh khăn phơi bay trong gió, khác hình gió trên cánh đồng lúa của bài đó.
> Câu ví dụ "Animals breathe air to live." giữ: nói nghĩa của từ trong bài này (con vật cần không khí); ảnh khăn bay cho thấy không khí bằng gió.

### need
id: 6d50fa51-fd94-4b24-a773-7c7bc14a1327
tier: core
term.en: need
term.vi: cần
example.en: Animals need food and water.
example.vi: Con vật cần thức ăn và nước.
image.brief: Dùng lại hình `explore_plants` ở bài `goi-ten-va-nhom-dong-vat/con-vat-an-gi`. Từ khoá tìm ảnh (EN): water buffalo grazing grass field
image.alt.en: A buffalo eating grass
image.alt.vi: Con trâu gặm cỏ

### breathe
id: 79a86fb8-10a1-43b6-ac2d-673e57738f2a
tier: extra
term.en: breathe
term.vi: thở
example.en: A dog breathes fast after running.
example.vi: Chó chạy xong thở rất nhanh.
image.brief: Dùng lại hình `explore_air`. Từ khoá tìm ảnh (EN): dog panting
image.alt.en: A dog panting with its tongue out
image.alt.vi: Chú chó thè lưỡi thở hổn hển

### drink
id: 6fa259cc-f910-44e0-a8eb-405b549cd7f9
tier: extra
term.en: drink
term.vi: uống
example.en: The dog drinks water from a bowl.
example.vi: Chú chó uống nước trong bát.
image.brief: Dùng lại hình `explore_water`. Từ khoá tìm ảnh (EN): dog drinking water
image.alt.en: A dog drinking water
image.alt.vi: Chú chó đang uống nước

## Thưởng

### elephant_card
id: 1b7b16e2-bb15-4cb4-90b2-39e261294a49
set: life_cycles
rarity: rare
name.en: Asian elephant
name.vi: Voi châu Á
tag.en: Drinks with its trunk
tag.vi: Uống nước nhờ cái vòi
fact.en: An elephant sucks water into its trunk.
fact.vi: Voi hút nước vào vòi, rồi đưa vào miệng.
image.brief: Dùng lại hình `explore_big_small` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): Asian elephant standing in water
image.alt.en: An elephant in the water
image.alt.vi: Con voi dưới nước
> Bộ `set: life_cycles`. Thẻ nối ô Water. Không trùng thẻ đã có (chưa có thẻ voi).
> [CẦN KIỂM] Voi hút nước vào vòi rồi phun vào miệng để uống (không uống trực tiếp qua vòi).

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật, trừ hình câu w3 (`tray_stomach`, hình của Discoverer *Hô hấp*, câu `true_false` một hình). Không hình tự vẽ mới, không hình ghép.
- **Ảnh mới chỉ dùng ở bài này:** chó uống nước (`explore_water`), chó thở hổn hển (`explore_air`), bong bóng xà phòng bay (`explore_you`; brief xin bạn nhỏ thổi bong bóng không thấy mặt, ảnh đã chọn 19/11 chỉ có bong bóng trên phố, không có người), khăn vải phơi bay trên dây trong gió (`tray_wind`, từ `air` có mục cắt 2:1 riêng; thêm 19/11, thay hình gió trên cánh đồng lúa của Discoverer *Hô hấp*; không dùng ảnh diều vì diều là đồ chơi, trùng nhóm bẫy).
- **Ảnh dùng lại:** bài 1 `explore_old` (w2), bài 5 `explore_dry` (w1); *Gọi tên và nhóm động vật* bài 1 `w1` (hàng rào tre), `q4_grass` (món Chơi, q4), `q4_banana` (món Chơi), bài 2 `explore_big_small` (thẻ thưởng), bài 6 `explore_plants` (ô Food, từ `need`); *Chuỗi thức ăn* bài 2 `w2` chuột (q4); *Sinh vật sống ở đâu?* bài 1 `tray_car` (món Chơi, q1); *Thời tiết và các mùa* bài 1 `tray_ball` (món Chơi); Discoverer *Hô hấp* `w1_water` (món Chơi, q1, q4), `w1_stone` (q1), `tray_stomach` (w3); Discoverer *Khủng long* `w3_cat` (q6).
- **Người trong ảnh:** `explore_you` không nhận ra mặt bạn nhỏ (chụp từ sau, hay chỉ thấy tay và bong bóng). Ảnh đã chọn không có người.
- **Không có:** vòng cổ, bát, lọ xà phòng có chữ hay nhãn hiệu; chó ốm; cảnh mèo bắt chuột.
- **Màu:** Học: thức ăn `vang_hoe`, nước `cham`, không khí `gi_dong`, người cũng vậy `nau_dat`. Chơi: thức ăn `vang_hoe`, nước `cham`, không khí `gi_dong`, đồ chơi `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (air, need). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, sáu món. Khởi động `true_false` (w1 Đúng, w2 Sai, w3 Sai). Quiz `single_choice` (q1, q4; ba lựa chọn), `true_false` (q2 Đúng, q3 Sai, q5 Đúng, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`animals_need_different_things`). Không có `labels` ở câu `true_false`.
- **Màn Chơi, ví dụ để kiểm:** Cỏ tươi, Cốc nước, Không khí → `balanced`; Nải chuối, Cốc nước, Không khí → `balanced`; Cỏ tươi, Nải chuối, Cốc nước → `missing.tray_air`; Ô tô đồ chơi, Cốc nước, Không khí → `has_limited`.
- **Khởi động trỏ:** w1 → `lon-len/vong-doi-cua-cay` (chạy `ids` bài 5 trước), w2 → `lon-len/vat-song-nao-cung-co-vong-doi`, w3 → `co-the-cua-em/bo-phan-ben-trong-co-the` (đã có id).
- **Thưởng:** `set: life_cycles`, `rarity: rare`.
- **Từ EN có thể ngoài Starters/Movers:** breathe, air, need, buffalo, pants, gills, lungs, stomach, bubbles, elephant, trunk, pebble.
