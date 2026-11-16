---
id: 4b11eb40-9a47-4e5e-b4b5-bea60264ded3
topic: an-uong-lanh-manh
slug: thuc-an-cho-ta-nhung-gi
order: 1
stage: opener
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: What does food give us?
vi: Thức ăn cho ta những gì?

## Mục tiêu
en: I can name the main nutrients in food.
vi: Em kể được các nhóm chất dinh dưỡng chính.

## Ý chính
1.en: Food has nutrients that our body needs.
1.vi: Thức ăn có chất dinh dưỡng mà cơ thể cần.
2.en: Different foods give us different nutrients.
2.vi: Các loại thức ăn cho ta những chất dinh dưỡng khác nhau.
3.en: Each nutrient does a different job in our body.
3.vi: Mỗi nhóm chất dinh dưỡng làm một việc riêng trong cơ thể.

## Khởi động

> Bài một của chủ đề miễn phí đầu tiên: bé chưa học bài nào trong app, nên cả hai câu ôn kiến thức nền (`prior_knowledge`), theo canvas Discoverer-Warmup và quyết định một của PM trong SK-002.

### w1
id: 8c88f06a-e6dc-4c85-8da8-3d41913f3f03
format: fill_blank_bank
version: 1
dok: 1
recall_from.kind: prior_knowledge
recall_from.note.en: Prior knowledge: animals, including humans, need food, water and air to live. In the app this is in the Explorer topic Em khoẻ mạnh.
recall_from.note.vi: Kiến thức nền: động vật, kể cả con người, cần thức ăn, nước và không khí để sống. Trong app, ý này nằm ở chủ đề Em khoẻ mạnh của nhóm Explorer.
> [CẦN KIỂM] Ý "cần thức ăn, nước và không khí" có thật sự nằm trong chủ đề Explorer "Em khoẻ mạnh" không, và trẻ Việt Nam học ý này ở lớp mấy môn Tự nhiên và Xã hội.
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
sentence.en: Animals, including humans, need food, water and {1} to live.
sentence.vi: Động vật, kể cả con người, cần thức ăn, nước và {1} để sống.
answers: w1_air
hint.en: What do we breathe in every second?
hint.vi: Thứ gì mình hít vào mỗi giây?
explanation_correct.en: We need air to breathe.
explanation_correct.vi: Ta cần không khí để thở.
explanation_wrong.en: The answer is air. We need air to breathe.
explanation_wrong.vi: Đáp án là không khí. Ta cần không khí để thở.

#### bank w1_air
label.en: air
label.vi: không khí

#### bank w1_toys
label.en: toys
label.vi: đồ chơi

#### bank w1_sweets
label.en: sweets
label.vi: kẹo

### w2
id: fd376a92-d053-4447-a292-979c91698c9b
format: true_false
version: 1
dok: 1
recall_from.kind: prior_knowledge
recall_from.note.en: Prior knowledge: plants make their own food using sunlight, but humans and animals must eat. In the app this is in the Explorer topic Chuỗi thức ăn.
recall_from.note.vi: Kiến thức nền: cây tự làm ra thức ăn nhờ ánh nắng, còn người và động vật phải ăn. Trong app, ý này nằm ở chủ đề Chuỗi thức ăn của nhóm Explorer.
> [CẦN KIỂM] Đối chiếu chủ đề Explorer nào dạy "cây tự làm thức ăn" (Chuỗi thức ăn hay Trồng cây).
> Câu "cây làm thức ăn từ ánh nắng" là cách nói giản lược cho trẻ bảy đến chín tuổi; chủ đề "Cây làm gì và cần gì" (Discoverer số năm) nói đủ nước và không khí.
prompt.en: Humans can make their own food, like plants.
prompt.vi: Con người tự làm ra thức ăn, giống như cây.
image.brief: Cây non hai lá trong chậu đất nung trên bậu cửa sổ, nắng chiếu xiên; nhãn "plant · cây" chỉ vào cây, nhãn "sunlight · nắng" chỉ vào tia nắng
image.alt.en: A young plant in the sunlight
image.alt.vi: Cây non dưới ánh nắng
answer: false
hint.en: Plants use sunlight to make food. What about us?
hint.vi: Cây dùng ánh nắng để làm thức ăn. Còn mình thì sao?
explanation_correct.en: Plants make food from sunlight. We need to eat food.
explanation_correct.vi: Cây tự làm thức ăn từ ánh nắng. Con người phải ăn.
explanation_wrong.en: This is false. Plants make food, but humans must eat.
explanation_wrong.vi: Câu này sai. Cây tự làm ra thức ăn, còn con người phải ăn.

## Học

### explore
id: 3a560eb7-9c22-43d6-a271-16e027e99c50
type: explore_groups
version: 1
prompt.en: Tap each group
prompt.vi: Chạm từng nhóm
complete_when: all_seen

#### group explore_carb
label.en: Carbohydrates
label.vi: Chất bột đường
color: vang_hoe
sentence.en: Carbohydrates give us energy.
sentence.vi: Chất bột đường cho ta năng lượng.
image.brief: Bát cơm trắng bốc khói trong bát sành men lam, kiểu bát ăn cơm của nhà Việt
image.alt.en: A bowl of rice
image.alt.vi: Bát cơm
examples.1.en: rice
examples.1.vi: cơm
examples.2.en: bread
examples.2.vi: bánh mì
examples.3.en: sweet potato
examples.3.vi: khoai lang

#### group explore_protein
label.en: Protein
label.vi: Chất đạm
color: do_son
sentence.en: Protein helps our body grow and repair.
sentence.vi: Chất đạm giúp cơ thể lớn lên và tự phục hồi.
image.brief: Quả trứng ốp la lòng đỏ tròn trên đĩa sứ trắng
image.alt.en: A fried egg
image.alt.vi: Trứng ốp la
examples.1.en: fish
examples.1.vi: cá
examples.2.en: egg
examples.2.vi: trứng
examples.3.en: tofu
examples.3.vi: đậu phụ

#### group explore_fat
label.en: Fats
label.vi: Chất béo
color: nau_dat
sentence.en: Fats give us energy and keep us warm.
sentence.vi: Chất béo cho năng lượng và giữ ấm cơ thể.
image.brief: Chai dầu ăn bằng nhựa trong, nắp đỏ, kiểu chai bán ở chợ Việt Nam, không có nhãn hiệu thật
image.alt.en: A bottle of cooking oil
image.alt.vi: Chai dầu ăn
examples.1.en: cooking oil
examples.1.vi: dầu ăn
examples.2.en: peanuts
examples.2.vi: lạc
examples.3.en: avocado
examples.3.vi: quả bơ

#### group explore_vit
label.en: Vitamins, minerals
label.vi: Vitamin, chất khoáng
color: gi_dong
sentence.en: Vitamins and minerals help us stay healthy.
sentence.vi: Vitamin và chất khoáng giúp ta khoẻ mạnh.
image.brief: Quả cam sành bổ đôi đặt cạnh bó rau muống buộc lạt
image.alt.en: An orange and some vegetables
image.alt.vi: Quả cam và rau
examples.1.en: water spinach
examples.1.vi: rau muống
examples.2.en: orange
examples.2.vi: cam
examples.3.en: milk
examples.3.vi: sữa
> [CẦN KIỂM] Sữa xếp vào nhóm vitamin và chất khoáng theo canvas (vì giàu canxi), nhưng sữa cũng giàu chất đạm. Chuyên môn xác nhận giữ ở nhóm này.

### new_words
id: c233cec2-d80d-4957-b9a0-1fcd96eb8ab8
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: nutrient, carbohydrate, protein, fat

## Chơi

> Bé chọn món từ kệ vào mâm bốn chỗ. Mâm đạt khi có đủ bột đường, đạm, rau và quả, và không có đồ ngọt. Chạm món trong mâm để bỏ ra. Trò chơi dùng ngay phần Học: nhận ra món nào thuộc nhóm nào.
> Thứ tự chọn lời nhắn (Duy chốt 29/10, SK-012): mâm đạt ("Tuyệt!" thắng cả khi bé vừa chạm thêm món vào mâm đầy), rồi mâm đầy (chỉ khi bé chạm thêm món lúc mâm đã đủ chỗ), rồi có đồ ngọt, rồi thiếu nhóm theo thứ tự các `#### group` bên dưới: đạm, rau và quả, bột đường. Vì vậy nhóm đạm đứng đầu; đổi thứ tự nhóm là đổi thứ tự nhắc.

### tray
id: bd0706ad-2c42-4e59-a6ee-66c1feac9ff7
type: build_tray
version: 1
prompt.en: Build a balanced meal
prompt.vi: Xếp mâm cơm cân bằng
capacity: 4
success_when: all_required_and_no_limit
messages.start.en: Pick foods for a healthy tray.
messages.start.vi: Chọn món cho mâm cơm khoẻ mạnh nhé.
messages.full.en: Your tray is full!
messages.full.vi: Mâm đầy rồi — chạm món trong mâm để bỏ ra.
> Giữ dấu "—" như canvas; nghe thử khi có giọng đọc tiếng Việt, nếu ngắt không tự nhiên thì đổi thành dấu phẩy.
messages.balanced.en: Great! Your tray is balanced.
messages.balanced.vi: Tuyệt! Mâm cơm cân bằng rồi.
messages.has_limited.en: Sweets are for sometimes.
messages.has_limited.vi: Kẹo và nước ngọt chỉ nên ăn ít thôi.
messages.missing.tray_protein.en: Add some protein!
messages.missing.tray_protein.vi: Thêm một món giàu chất đạm nhé!
messages.missing.tray_veg.en: Add vegetables or fruit!
messages.missing.tray_veg.vi: Mâm còn thiếu rau hoặc quả!
messages.missing.tray_carb.en: Add some carbohydrates!
messages.missing.tray_carb.vi: Thêm cơm hoặc bánh mì nhé!

#### group tray_protein
label.en: Protein
label.vi: Đạm
color: do_son
role: required

#### group tray_veg
label.en: Vegetables and fruit
label.vi: Rau và quả
color: gi_dong
role: required

#### group tray_carb
label.en: Carbohydrates
label.vi: Bột đường
color: vang_hoe
role: required

#### group tray_sweet
label.en: Sweets: just a little
label.vi: Đồ ngọt: nên ăn ít
color: cham
role: limit

#### item tray_rice
label.en: Rice
label.vi: Cơm
group: tray_carb
image.brief: Bát cơm trắng nhìn từ trên xuống, vừa một ô mâm
image.alt.en: A bowl of rice
image.alt.vi: Bát cơm

#### item tray_bread
label.en: Bread
label.vi: Bánh mì
group: tray_carb
image.brief: Ổ bánh mì Việt Nam vỏ vàng giòn, chưa kẹp nhân
image.alt.en: A Vietnamese bread roll
image.alt.vi: Ổ bánh mì

#### item tray_fish
label.en: Braised fish
label.vi: Cá kho
group: tray_protein
image.brief: Cá kho tộ màu nâu cánh gián trong nồi đất nhỏ, vài lát ớt đỏ
image.alt.en: Braised fish in a clay pot
image.alt.vi: Cá kho trong nồi đất

#### item tray_egg
label.en: Egg
label.vi: Trứng
group: tray_protein
image.brief: Hai quả trứng luộc, một quả đã bóc vỏ và bổ đôi
image.alt.en: Boiled eggs
image.alt.vi: Trứng luộc

#### item tray_greens
label.en: Water spinach
label.vi: Rau muống
group: tray_veg
image.brief: Đĩa rau muống luộc xanh mướt, kiểu đĩa rau trong mâm cơm miền Bắc
image.alt.en: A plate of boiled water spinach
image.alt.vi: Đĩa rau muống luộc

#### item tray_banana
label.en: Banana
label.vi: Chuối
group: tray_veg
image.brief: Nải chuối tiêu chín vàng, ba quả
image.alt.en: A bunch of bananas
image.alt.vi: Nải chuối

#### item tray_candy
label.en: Sweets
label.vi: Kẹo
group: tray_sweet
image.brief: Vài viên kẹo bọc giấy nhiều màu, xoắn hai đầu
image.alt.en: Some sweets
image.alt.vi: Mấy viên kẹo

#### item tray_soda
label.en: Fizzy drink
label.vi: Nước ngọt
group: tray_sweet
image.brief: Lon nước ngọt có ga màu đỏ, có bọt ở miệng lon, không có nhãn hiệu thật
image.alt.en: A can of fizzy drink
image.alt.vi: Lon nước ngọt

## Quiz

### q1
id: 1462983f-bd03-44ee-a91b-65b4ee731e51
format: single_choice
version: 1
dok: 1
prompt.en: Which food has lots of vitamins?
prompt.vi: Món nào có nhiều vitamin?
hint.en: Vitamins are in vegetables and fruit.
hint.vi: Vitamin có nhiều trong rau và quả.
explanation_correct.en: Oranges have lots of vitamins.
explanation_correct.vi: Quả cam có nhiều vitamin.
explanation_wrong.en: The answer is the orange. Fruit gives us vitamins.
explanation_wrong.vi: Đáp án là quả cam. Hoa quả cho ta vitamin.

#### option q1_orange
correct: true
label.en: orange
label.vi: quả cam
image.brief: Quả cam sành vỏ xanh bổ đôi, ruột vàng mọng nước
image.alt.en: An orange cut in half
image.alt.vi: Quả cam bổ đôi

#### option q1_rice
correct: false
label.en: rice
label.vi: cơm
image.brief: Dùng lại hình bát cơm của món tray_rice
image.alt.en: A bowl of rice
image.alt.vi: Bát cơm

#### option q1_sweets
correct: false
label.en: sweets
label.vi: kẹo
image.brief: Dùng lại hình kẹo của món tray_candy
image.alt.en: Some sweets
image.alt.vi: Mấy viên kẹo

### q2
id: aeb7debc-28ed-4fd8-a192-8a9e5a581455
format: fill_blank_bank
version: 2
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
sentence.en: Food gives us {1}, like protein and fat.
sentence.vi: Thức ăn cho ta {1}, như chất đạm và chất béo.
answers: q2_nutrients
hint.en: Think what helps your body grow and stay well.
hint.vi: Em nghĩ xem thứ gì giúp cơ thể lớn và khoẻ nhé.
explanation_correct.en: Nutrients help your body grow, move and stay well.
explanation_correct.vi: Chất dinh dưỡng giúp cơ thể lớn lên, vận động và khoẻ mạnh.
explanation_wrong.en: Food gives us nutrients, like protein, fat and vitamins.
explanation_wrong.vi: Thức ăn cho ta chất dinh dưỡng, như đạm, béo, vitamin.
> SK-047 (15/11, nháp AI): câu Từ mới phải điền một từ core của bài (nutrient, carbohydrate, protein, fat); câu cũ điền "energy" (từ extra). Không nâng "energy" lên core vì bài đã có bốn từ core. Câu mới là câu ví dụ của từ `nutrient`. Không dùng "carbohydrate" hay "protein": câu q3 hỏi bún thuộc nhóm nào, câu q5 hỏi món giàu chất đạm. Giữ hai thẻ sai cũ (không khí, ánh nắng); `q2_energy` bỏ, thêm `q2_nutrients`. `version` 2.
> Theo luật SK-044 và SK-047 (bài này chưa qua lượt viết lại A2): thêm hình cho ba thẻ (dùng lại hình có sẵn), `feedback` cho hai thẻ sai; giải thích khi sai bỏ "The answer is …" · "Đáp án là …". Câu chưa có hình câu hỏi; ở A2 hình câu hỏi ẩn vì mọi thẻ từ có hình, nên không thêm.

#### bank q2_nutrients
label.en: nutrients
label.vi: chất dinh dưỡng
image.brief: Dùng lại hình `nutrient`.
image.alt.en: Rice, an egg, oil and vegetables together
image.alt.vi: Cơm, trứng, dầu ăn và rau đặt cạnh nhau

#### bank q2_air
label.en: air
label.vi: không khí
feedback.en: We breathe in air; it does not come from food.
feedback.vi: Mình hít không khí vào, không phải từ thức ăn.
image.brief: Dùng lại hình `w1` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): rice field wind waves Vietnam
image.alt.en: Wind blowing over a rice field
image.alt.vi: Gió thổi trên cánh đồng lúa

#### bank q2_sunlight
label.en: sunlight
label.vi: ánh nắng
feedback.en: Sunlight comes from the sun, not from food.
feedback.vi: Ánh nắng đến từ Mặt Trời, không từ thức ăn.
image.brief: Dùng lại hình `q3_sun` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): sun bright blue sky
image.alt.en: The bright sun in the sky
image.alt.vi: Mặt Trời chói sáng trên trời
> SK-047 (15/11): ba hình dùng lại; không cần hình mới. Chủ đề này chưa có file chọn ảnh (SK-043 dev 14/11); designer thêm ba mục khi làm file. Hình `nutrient` là hình tả bằng chữ kiểu cũ (chưa theo luật SK-033), designer xem có cần đổi brief không.

### q3
id: b06b6e26-f1b1-412e-b110-78e00e3d510f
format: single_choice
version: 1
dok: 2
prompt.en: Which food is in the same group as these noodles?
prompt.vi: Món nào cùng nhóm chất với bún?
image.brief: Một rổ bún tươi sợi trắng trên lá chuối, không kèm thịt hay rau để trẻ không nhầm sang nhóm khác
image.alt.en: Some fresh rice noodles
image.alt.vi: Một rổ bún tươi
hint.en: These noodles are made from rice. Which group is rice in?
hint.vi: Bún làm từ gạo. Gạo thuộc nhóm chất nào?
explanation_correct.en: Noodles and sweet potatoes are both carbohydrates.
explanation_correct.vi: Bún và khoai lang đều thuộc nhóm chất bột đường.
explanation_wrong.en: The answer is sweet potato. Both are carbohydrates.
explanation_wrong.vi: Đáp án là khoai lang. Bún và khoai lang đều thuộc nhóm chất bột đường.

#### option q3_sweet_potato
correct: true
label.en: sweet potato
label.vi: khoai lang
image.brief: Củ khoai lang vỏ tím, một nửa luộc chín ruột vàng
image.alt.en: A sweet potato cut in half
image.alt.vi: Củ khoai lang bổ đôi

#### option q3_egg
correct: false
label.en: egg
label.vi: trứng
image.brief: Dùng lại hình trứng luộc của món tray_egg
image.alt.en: Boiled eggs
image.alt.vi: Trứng luộc

#### option q3_water_spinach
correct: false
label.en: water spinach
label.vi: rau muống
image.brief: Dùng lại hình đĩa rau muống luộc của món tray_greens
image.alt.en: A plate of boiled water spinach
image.alt.vi: Đĩa rau muống luộc

### q4
id: 00bb56f5-6adc-4d54-b48a-5bbbbae20eab
format: single_choice
version: 1
dok: 2
prompt.en: Nam hurt his knee. Which nutrient helps his body repair?
prompt.vi: Nam bị trầy đầu gối. Chất nào giúp cơ thể Nam tự phục hồi?
image.brief: Bạn Nam mặc áo sơ mi trắng, quần xanh, ngồi trên ghế đá sân trường, đầu gối dán băng cá nhân, vẻ mặt bình thường, không có máu
image.alt.en: Nam with a plaster on his knee
image.alt.vi: Bạn Nam dán băng ở đầu gối
hint.en: Remember the nutrient that helps us grow.
hint.vi: Nhớ lại chất giúp cơ thể lớn lên.
explanation_correct.en: Protein helps our body grow and repair.
explanation_correct.vi: Chất đạm giúp cơ thể lớn lên và tự phục hồi.
explanation_wrong.en: The answer is protein. It helps our body repair.
explanation_wrong.vi: Đáp án là chất đạm. Chất đạm giúp cơ thể tự phục hồi.
> Cơ thể lành vết thương cần cả vitamin và chất khoáng, nên lựa chọn sai chỉ gồm chất béo và chất bột đường để câu có một đáp án đúng rõ ràng.

#### option q4_protein
correct: true
label.en: Protein
label.vi: Chất đạm

#### option q4_fats
correct: false
label.en: Fats
label.vi: Chất béo

#### option q4_carbs
correct: false
label.en: Carbohydrates
label.vi: Chất bột đường

### q5
id: 59dd3f4a-3967-436a-aec9-4048d8bb501c
format: multi_choice
version: 1
dok: 2
prompt.en: Tap all the foods with lots of protein.
prompt.vi: Chạm vào tất cả thức ăn giàu chất đạm.
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
hint.en: Protein helps us grow. Fish, meat, eggs and beans have it.
hint.vi: Chất đạm giúp cơ thể lớn lên. Thường có trong cá, thịt, trứng và các loại đậu.
explanation_correct.en: Fish, eggs and tofu are all rich in protein.
explanation_correct.vi: Cá, trứng và đậu phụ đều giàu chất đạm.
explanation_wrong.en: The protein foods are fish, eggs and tofu.
explanation_wrong.vi: Các món giàu chất đạm là cá, trứng và đậu phụ.
> [CẦN KIỂM] Bánh mì trắng có khoảng tám đến chín gam chất đạm trong một trăm gam, gần bằng đậu phụ. Chuyên môn xác nhận để bánh mì là lựa chọn sai của câu "giàu chất đạm" (bánh mì thuộc nhóm bột đường vì phần lớn là tinh bột).

#### option q5_fish
correct: true
label.en: fish
label.vi: cá
image.brief: Con cá rô phi tươi nguyên con nằm trên lá chuối
image.alt.en: A fresh fish
image.alt.vi: Con cá tươi

#### option q5_rice
correct: false
label.en: rice
label.vi: cơm
image.brief: Dùng lại hình bát cơm của món tray_rice
image.alt.en: A bowl of rice
image.alt.vi: Bát cơm

#### option q5_egg
correct: true
label.en: egg
label.vi: trứng
image.brief: Dùng lại hình trứng luộc của món tray_egg
image.alt.en: Boiled eggs
image.alt.vi: Trứng luộc

#### option q5_banana
correct: false
label.en: banana
label.vi: chuối
image.brief: Dùng lại hình nải chuối của món tray_banana
image.alt.en: A bunch of bananas
image.alt.vi: Nải chuối

#### option q5_tofu
correct: true
label.en: tofu
label.vi: đậu phụ
image.brief: Bìa đậu phụ trắng cắt miếng vuông trên đĩa, vài miếng rán vàng
image.alt.en: Pieces of tofu on a plate
image.alt.vi: Đĩa đậu phụ

#### option q5_bread
correct: false
label.en: bread
label.vi: bánh mì
image.brief: Dùng lại hình ổ bánh mì của món tray_bread
image.alt.en: A Vietnamese bread roll
image.alt.vi: Ổ bánh mì

### q6
id: 9efe4b78-71d1-4398-b9f8-e4e9e1c250d4
format: true_false
version: 1
dok: 3
misconception: all_fat_bad
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
> SK-047 (15/11, nháp AI): nhãn cũ "spot the mistake" · "bắt lỗi sai" báo trước Na sai; đổi sang nhãn trung tính của TEMPLATE (mục Quiz), như mọi câu sáu Discoverer khác.
statement.en: All fat is bad for you.
statement.vi: Chất béo lúc nào cũng có hại.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: false
hint.en: Think about what fat does for your body.
hint.vi: Em nghĩ xem chất béo làm gì cho cơ thể nhé.
> SK-047 (15/11, nháp AI): gợi ý cũ nói thẳng "chất béo cho ta năng lượng và giữ ấm", tức là lời bác bỏ. Gợi ý mới chỉ cách nghĩ.
explanation_correct.en: A little fat gives us energy and keeps us warm.
explanation_correct.vi: Cơ thể cần một ít chất béo để có năng lượng và giữ ấm.
explanation_wrong.en: Na is not right. We need a little fat, not too much.
explanation_wrong.vi: Na chưa đúng. Ta cần một ít chất béo, nhưng không ăn quá nhiều.

## Từ vựng

### nutrient
id: 6656ad65-b2dd-4f06-808c-fe1d1995e085
tier: core
term.en: nutrient
term.vi: chất dinh dưỡng
example.en: Food gives us nutrients.
example.vi: Thức ăn cho ta chất dinh dưỡng.
image.brief: Bát cơm, quả trứng, chai dầu ăn và bó rau đặt cạnh nhau, mỗi món có một chấm màu của nhóm chất
image.alt.en: Rice, an egg, oil and vegetables together
image.alt.vi: Cơm, trứng, dầu ăn và rau đặt cạnh nhau

### carbohydrate
id: 728f378a-1bee-4106-ba15-612d17927b73
tier: core
term.en: carbohydrate
term.vi: chất bột đường
example.en: Rice is a carbohydrate.
example.vi: Cơm thuộc nhóm chất bột đường.
image.brief: Dùng lại hình bát cơm của nhóm explore_carb
image.alt.en: A bowl of rice
image.alt.vi: Bát cơm

### protein
id: 8477b4f7-9605-457b-9a21-1bc5832484a0
tier: core
term.en: protein
term.vi: chất đạm
example.en: Fish is rich in protein.
example.vi: Cá giàu chất đạm.
image.brief: Dùng lại hình con cá tươi của lựa chọn q5_fish
image.alt.en: A fresh fish
image.alt.vi: Con cá tươi

### fat
id: ee8c53bc-21cd-419e-a0d5-ef087d093f64
tier: core
term.en: fat
term.vi: chất béo
example.en: Fat keeps us warm.
example.vi: Chất béo giữ ấm cơ thể.
image.brief: Chai dầu ăn và một nắm lạc rang đặt cạnh nhau
image.alt.en: Cooking oil and peanuts
image.alt.vi: Dầu ăn và lạc rang

### vitamin
id: cfa86593-542f-4519-bdc2-00bfe1cb6018
tier: extra
term.en: vitamin
term.vi: vitamin
example.en: Oranges have vitamins.
example.vi: Quả cam có vitamin.
image.brief: Dùng lại hình quả cam bổ đôi của lựa chọn q1_orange
image.alt.en: An orange cut in half
image.alt.vi: Quả cam bổ đôi

### fibre
id: 59b5cb47-2f15-49c1-8358-71ac83e735a1
tier: extra
term.en: fibre
term.vi: chất xơ
example.en: Vegetables have fibre.
example.vi: Rau có chất xơ.
image.brief: Rổ tre đựng rau muống, rau cải và mấy quả mướp
image.alt.en: A basket of vegetables
image.alt.vi: Rổ rau

### energy
id: 4b314313-1ed2-47a5-8147-75b6e175efb2
tier: extra
term.en: energy
term.vi: năng lượng
example.en: Food gives us energy.
example.vi: Thức ăn cho ta năng lượng.
image.brief: Bạn nhỏ mặc đồng phục chạy nhảy trên sân trường giờ ra chơi, tóc bay
image.alt.en: A child running in the school yard
image.alt.vi: Bạn nhỏ chạy trên sân trường

### healthy
id: 0cac2335-c9b2-4136-b724-ecff59a95f80
tier: extra
term.en: healthy
term.vi: khoẻ mạnh
example.en: We eat well to stay healthy.
example.vi: Ta ăn uống đủ chất để khoẻ mạnh.
image.brief: Gia đình ba thế hệ ngồi quanh mâm cơm trên chiếu, bạn nhỏ cười tươi, má hồng
image.alt.en: A happy family eating together
image.alt.vi: Gia đình vui vẻ ăn cơm cùng nhau

## Thưởng

### rau_muong
id: 43376993-bf69-49cc-bb35-837581f0cc1a
set: food
rarity: common
name.en: water spinach
name.vi: Rau muống
tag.en: Vitamins and minerals
tag.vi: Vitamin và chất khoáng
fact.en: Water spinach has vitamins and fibre.
fact.vi: Rau muống có nhiều vitamin và chất xơ — món rau quen thuộc trong mâm cơm Việt.
> Giữ dấu "—" như canvas; nghe thử khi có giọng đọc tiếng Việt.
> [CẦN KIỂM] "Nhiều chất xơ": theo biên tập nhớ, rau muống sống có khoảng hai gam chất xơ trong một trăm gam, mức vừa so với các loại rau. Chuyên môn xác nhận số liệu và xác nhận được nói "nhiều".
image.brief: Bó rau muống tươi buộc lạt tre, cọng xanh non, lá nhọn, kiểu bán ở chợ quê
image.alt.en: A bunch of water spinach
image.alt.vi: Một bó rau muống

## Ghi chú cho hoạ sĩ

- Phong cách E giấy cắt như canvas Discoverer. Món ăn vẽ theo kiểu bữa cơm nhà Việt: bát sành, đĩa sứ, nồi đất, mâm tròn. Không vẽ nhãn hiệu thật trên chai dầu, lon nước ngọt hay gói kẹo.
- Hình dùng chung: một hình cho mỗi món, dùng lại ở Chơi, Quiz và Từ vựng (dòng `brief` ghi "Dùng lại hình …"). Hình mới cần vẽ: bốn hình nhóm chất ở Học, tám món ở mâm cơm, cây non dưới nắng (w2), quả cam bổ đôi, rổ bún, củ khoai lang, bạn Nam, con cá tươi, đĩa đậu phụ, năm hình từ vựng (nutrient, fat, fibre, energy, healthy; carbohydrate, protein, vitamin dùng lại hình khác), thẻ rau muống.
- Hình w2 có hai nhãn chữ trong hình ("plant · cây", "sunlight · nắng") như canvas. Schema v1 chưa có chỗ cho nhãn trên hình, nên tạm vẽ chữ vào hình; xem đề xuất ở Ghi chú cho dev.
- Ý chính chưa có trường hình trong schema v1. Nếu sau này có màn tóm tắt, gợi ý: (1) mâm cơm gia đình nhìn từ trên xuống: cơm, cá kho, rau muống luộc, bát canh; (2) bốn món đặt bốn góc, mỗi món một chấm màu nhóm chất; (3) bạn nhỏ cùng bốn biểu tượng: tia chớp cho năng lượng, thước đo chiều cao cho lớn lên, băng cá nhân cho phục hồi, chiếc lá xanh cho khoẻ mạnh.
- **Nhãn "Nhớ lại · từ Year 2" (Discoverer-Warmup):** trẻ Việt Nam không biết "Year 2". Đề xuất: câu `prior_knowledge` → "Nhớ lại · điều em đã biết" / "Remember what you know"; câu `lesson` → "Nhớ lại · bài <tên bài>" / "Remember · <tên bài EN>". Nhãn này là chữ giao diện, lấy theo `recall_from.kind`. Cần sửa cả tiêu đề trang canvas "Khởi động: nhớ lại Year 2".
- **Chữ đổi so với canvas, màn cần sửa theo:**
  - Discoverer-Learn: nhãn nhóm EN "Vitamins & minerals" → "Vitamins, minerals" (khớp nhãn VI "Vitamin, chất khoáng", giữ màn ở ba mươi từ EN).
  - Discoverer-Play: nhãn đồng hồ "Rau & quả" → "Rau và quả". Nhãn EN của các nhóm và món là chữ mới (canvas chỉ có VI); kiểm lại độ rộng chip, nhất là "Carbohydrates" và "Vegetables and fruit".
  - Discoverer-Reward và Discoverer-Cards: nhãn thẻ "Vitamin & khoáng chất" → "Vitamin và chất khoáng".
  - Discoverer-QuizMyth: giải thích EN "Our body needs a little fat for energy and to keep warm." → "A little fat gives us energy and keeps us warm."; nhãn "Thử thách · bắt lỗi sai" → "Thử thách: bắt lỗi sai" nếu nhãn này được đọc lên; nhãn EN của hai nút là "Yes" / "No".
  - Discoverer-Quiz: thêm dòng hướng dẫn EN "Pick all the right answers." dưới dòng "Chọn tất cả đáp án đúng".
- **Số từ EN trên màn Học:** canvas hiện món ví dụ bằng tiếng Việt nên màn có khoảng ba mươi từ EN. Nếu app hiện món ví dụ bằng tiếng Anh (chế độ EN-first) thì lên khoảng ba mươi tư từ, vượt mức ba mươi. Đề xuất: ô món ví dụ chỉ hiện hình và tên VI ở chế độ Song ngữ, chạm để nghe tên EN; hoặc tách ô "Từ mới" sang bước riêng.

## Ghi chú cho dev

- **Block và format dùng trong bài:** Học: `explore_groups` (`explore`), `word_list` (`new_words`). Chơi: `build_tray` (`tray`). Khởi động: `fill_blank_bank`, `true_false`. Quiz: `single_choice` ×3, `fill_blank_bank`, `multi_choice`, `true_false`. DOK theo thứ tự q1–q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Câu có `misconception`: q6.
- **Tham chiếu:** `misconception: all_fat_bad` → `misconception_id` lấy từ `_topic.md`. `topic: an-uong-lanh-manh` → `topic_id`. `speaker: na` là key nhân vật Na, không phải key trong bài. `group:` của món trỏ vào key nhóm của `tray`; `term_keys` trỏ vào key ở Từ vựng; `answers` trỏ vào key `#### bank`.
- **Key:** mọi key duy nhất trong cả bài, kể cả key con (`q5_egg`, `tray_egg`), nên tester kiểm được bằng một tập.
- **Thứ tự lời nhắn mâm cơm:** schema để `messages.missing` là map. Canvas xét thiếu đạm, rồi thiếu rau quả, rồi thiếu bột đường. Đề xuất app (và test vector SK-003 nếu có) xét theo thứ tự key trong map, tức thứ tự dòng trong file.
- **Chữ trên canvas không có trường trong schema v1** (coi là chữ giao diện của app, B7.9): "Mâm của em · chạm món trong mâm để bỏ ra"; dòng điều kiện "Cần đủ bột đường, đạm, rau quả — và không đồ ngọt" (app có thể ghép từ nhãn nhóm `required` và `limit`); nút "Mâm cân bằng! Làm quiz"; "Gần đúng!", "Chính xác!", "Thử lại nhé"; nhãn "Đúng · True" / "Sai · False" mặc định của `true_false` (w2 dùng mặc định); tên bộ thẻ "Thẻ thực phẩm" của `set: food`; nhãn "Nhớ lại · …" của khởi động.
- **Chỗ đổi chữ so với canvas, lý do:**
  - Bỏ dấu "&" vì chuỗi `Spoken` vừa hiện vừa đọc, giọng đọc dễ đọc sai ký hiệu: "Vitamins & minerals" → "Vitamins, minerals" (khớp nhãn VI, và nếu viết "and" thì màn Học lên ba mươi mốt từ); "Rau & quả" → "Rau và quả"; "Vitamin & khoáng chất" → "Vitamin và chất khoáng" (khớp chữ "chất khoáng" ở phần Học), EN của nhãn này là "Vitamins and minerals".
  - Giải thích EN câu sáu có mười hai từ, vượt mức mười; rút còn mười từ, nghĩa giữ nguyên. VI giữ nguyên canvas.
  - Nhãn "Thử thách · bắt lỗi sai" đưa vào `instruction` của q6, dấu "·" đổi thành ":" vì chuỗi được đọc lên.
  - Chữ giữ nguyên canvas nhưng thêm bản dịch còn thiếu: mọi nhãn EN của món mâm cơm và món ví dụ; gợi ý EN của w1, w2, q5, q6; giải thích sai của mọi câu; hướng dẫn EN của q5; nhãn EN hai nút của q6.
- **Dấu "—" giữ lại ở hai chuỗi VI** (`messages.full.vi`, `fact.vi` của thẻ rau muống): nghe thử khi có giọng đọc tiếng Việt.
- **Câu hỏi mở 1 — câu nối giữa Học và Chơi:** phần Học chia bốn nhóm chất, mâm cơm chia nhóm món (bột đường, đạm, rau và quả, đồ ngọt). Đề xuất giữ tên nhóm của mâm (trẻ nhìn món dễ hơn nhìn chất) và thêm một `sentence_card` cuối phần Học, sau `new_words`; chưa đưa vào bài vì cần Duy chốt và designer thêm một bước trên màn Học:
  - key `bridge`, `text.en`: "Vegetables and fruit give us vitamins and minerals.", `text.vi`: "Rau và quả cho ta vitamin và chất khoáng.", hình: rổ rau muống và đĩa chuối, cam.
  - Mâm không có nhóm chất béo là có chủ ý: món kho, món xào đã có dầu. Đề xuất bài hai "Mâm cơm cân bằng" thêm nhóm `role: neutral` cho dầu ăn, lạc; bài ba nói về lượng chất béo.
- **Câu hỏi mở 2 — câu "Em nghĩ sao?" (bài mở màn, không chấm điểm):** đề xuất cho schema v1.1, ví dụ trường `think_first` của lesson gồm `prompt` và `options[]` không có `correct`, đặt trước Khởi động; bài năm (tổng kết) hỏi lại để trẻ tự so:
  - prompt: "Why do we need to eat? What do you think?" / "Vì sao mình cần ăn? Em nghĩ sao?"
  - lựa chọn: "Because we feel hungry." / "Vì em thấy đói." · "Because food tastes good." / "Vì đồ ăn ngon." · "To grow and have energy." / "Để lớn lên và có năng lượng."
- **Đề xuất schema v1.1:** `Image.labels?: Spoken[]` cho nhãn trên hình (w2 đang vẽ chữ vào hình nên không đổi được theo chế độ ngôn ngữ).
- **Chính tả Anh:** dùng "fibre" theo canvas, chờ Duy chốt Anh hay Mỹ; nếu đổi sang Mỹ thì sửa `fibre` (key, từ vựng, câu ví dụ, thẻ rau muống).
- **Từ EN ngoài Starters/Movers** trong chữ mới của bài (theo trí nhớ của biên tập, cần đối chiếu danh sách Cambridge): minerals, sweet potato, tofu, water spinach, braised, cooking oil, peanuts, avocado, fizzy, noodles, knee, repair, challenge, spot, mistake, breathe, sunlight. Phần lớn có hình đi kèm hoặc đã có trên canvas.
- **Asset:** không có audio và `asset` trong markdown; máy điền khi chạy `tts` và `assets`. Nhân vật Na là asset chung của app, câu q6 không cần hình riêng.
- **Cách đếm số từ trên một màn:** đếm trạng thái nhiều chữ nhất mà canvas cho hiện cùng lúc (câu hỏi, hướng dẫn, các lựa chọn, cộng gợi ý hoặc giải thích). Theo cách đếm này, mọi màn ≤ 30 từ EN, trừ màn Học khi món ví dụ hiện bằng tiếng Anh (xem Ghi chú cho hoạ sĩ).
