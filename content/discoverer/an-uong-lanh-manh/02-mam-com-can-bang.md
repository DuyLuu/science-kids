---
id: 23603940-87a2-435b-bf7d-c6c18f79e349
topic: an-uong-lanh-manh
slug: mam-com-can-bang
order: 2
stage: core
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: A balanced meal
vi: Mâm cơm cân bằng

## Mục tiêu
en: I can tell which meal is balanced.
vi: Em nhận ra được bữa ăn nào cân bằng.

## Ý chính
1.en: A balanced meal has foods from different groups.
1.vi: Bữa ăn cân bằng có thức ăn của nhiều nhóm khác nhau.
2.en: Rice, vegetables and fruit are the biggest part.
2.vi: Cơm, rau và quả là phần nhiều nhất của bữa ăn.
3.en: No single food gives us every nutrient.
3.vi: Không có món ăn nào cho ta đủ mọi chất dinh dưỡng.

## Khởi động

> Cả hai câu ôn bài một (`recall_from.kind: lesson`): đây là bài trước, cách khoảng một ngày; chủ đề chưa có bài nào cách một tuần hay một tháng (syllabus-progression mục 7).
> w1 ôn nhóm bột đường, cần cho mâm bốn nhóm ở phần Chơi. w2 ôn lại ý sửa `all_fat_bad` của bài một, để nhóm "Chỉ một chút" ở phần Học không bị hiểu thành "không ăn chất béo".

### w1
id: c17644f6-01f3-45e7-9953-15dd7299831a
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: an-uong-lanh-manh/thuc-an-cho-ta-nhung-gi
prompt.en: Which group are rice, bread and sweet potato in?
prompt.vi: Cơm, bánh mì và khoai lang thuộc nhóm chất nào?
hint.en: Think of the bowl of rice from the last lesson.
hint.vi: Em nhớ lại bát cơm ở bài trước nhé.
explanation_correct.en: Rice, bread and sweet potato are carbohydrates.
explanation_correct.vi: Cơm, bánh mì và khoai lang thuộc nhóm chất bột đường.
explanation_wrong.en: The answer is carbohydrates. They give us energy.
explanation_wrong.vi: Đáp án là chất bột đường. Nhóm này cho ta năng lượng.

#### option w1_protein
correct: false
label.en: Protein
label.vi: Chất đạm

#### option w1_carb
correct: true
label.en: Carbohydrates
label.vi: Chất bột đường

#### option w1_fat
correct: false
label.en: Fats
label.vi: Chất béo

### w2
id: 0cdbb29b-4594-4f3c-b340-4f0aafcace40
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: an-uong-lanh-manh/thuc-an-cho-ta-nhung-gi
prompt.en: Our body needs a little fat.
prompt.vi: Cơ thể mình cần một ít chất béo.
image.brief: Dùng lại hình chai dầu ăn và lạc rang của từ fat ở bài một
image.alt.en: Cooking oil and peanuts
image.alt.vi: Dầu ăn và lạc rang
answer: true
hint.en: Remember: fats give us energy and keep us warm.
hint.vi: Nhớ lại bài trước: chất béo cho ta năng lượng và giữ ấm cơ thể.
explanation_correct.en: Yes! A little fat gives us energy and keeps us warm.
explanation_correct.vi: Đúng rồi! Một ít chất béo cho ta năng lượng và giữ ấm cơ thể.
explanation_wrong.en: This is true. We need a little fat, not too much.
explanation_wrong.vi: Câu này đúng. Mình cần một ít chất béo, nhưng không ăn quá nhiều.

## Học

> Bài một chia thức ăn theo nhóm chất. Bài hai chia theo lượng trong một bữa: phần nhiều nhất, phần ít hơn, chỉ một chút. Đây là cách phân loại mới, dạy ý "tỉ lệ" (ý chính hai).
> Không dùng `sentence_card`: app 0.1.0 chỉ hiện `explore_groups` đầu tiên và `word_list` đầu tiên ở màn Học (xem Ghi chú cho dev). Ý chính một được dạy ở lời nhắn mở đầu của phần Chơi. Ý chính ba được dạy ở lời nhắn mâm đạt (trước Quiz), rồi được kiểm ở câu sáu.

### explore
id: cb83b20d-5a9f-450f-9f72-146a21226b22
type: explore_groups
version: 1
prompt.en: Tap each part
prompt.vi: Chạm từng phần
complete_when: all_seen

#### group explore_big
label.en: Biggest part
label.vi: Phần nhiều nhất
color: gi_dong
sentence.en: Rice, vegetables and fruit are the biggest part.
sentence.vi: Cơm, rau và quả là phần nhiều nhất.
> [CẦN KIỂM] Ba mức "phần nhiều nhất" (cơm và các món bột đường, rau, quả), "phần ít hơn" (cá, thịt, trứng, đậu phụ), "chỉ một chút" (dầu ăn, đường, muối) là cách giản lược của biên tập theo tháp dinh dưỡng (theo trí nhớ: SGK Khoa học lớp bốn cũ ghi ăn đủ, ăn vừa phải, ăn có mức độ, ăn ít, ăn hạn chế). Chuyên môn xác nhận cách chia cho trẻ sáu đến mười một tuổi theo khuyến nghị hiện hành của Viện Dinh dưỡng, nhất là quả có thuộc "phần nhiều nhất" không. Cùng ý này ở Ý chính hai, câu q2 và q5.
image.brief: Mâm cơm tròn nhìn từ trên xuống: bát cơm đầy, đĩa rau muống luộc to, đĩa cà rốt luộc và đĩa chuối chiếm gần hết mâm; một đĩa cá kho nhỏ ở góc, vẽ nhạt hơn
image.alt.en: A tray with lots of rice, vegetables and fruit
image.alt.vi: Mâm cơm có nhiều cơm, rau và quả
examples.1.en: rice
examples.1.vi: cơm
examples.2.en: water spinach
examples.2.vi: rau muống
examples.3.en: carrot
examples.3.vi: cà rốt
examples.4.en: banana
examples.4.vi: chuối

#### group explore_smaller
label.en: Smaller part
label.vi: Phần ít hơn
color: do_son
sentence.en: Fish, meat and tofu are a smaller part.
sentence.vi: Cá, thịt và đậu phụ là phần ít hơn.
image.brief: Một đĩa cá kho nhỏ và một đĩa đậu phụ rán nhỏ, đặt cạnh một bát cơm to để thấy phần đạm ít hơn phần cơm
image.alt.en: A small dish of fish and some tofu
image.alt.vi: Đĩa cá nhỏ và ít đậu phụ
examples.1.en: fish
examples.1.vi: cá
examples.2.en: meat
examples.2.vi: thịt
examples.3.en: egg
examples.3.vi: trứng
examples.4.en: tofu
examples.4.vi: đậu phụ

#### group explore_little
label.en: Just a little
label.vi: Chỉ một chút
color: nau_dat
> Màu `nau_dat` (màu chất béo ở bài một) thay `cham` (màu đồ ngọt), để dầu ăn không mang màu đồ ngọt (tester R7, tránh củng cố `all_fat_bad`). Ba ô "lượng" vẫn mượn màu nhóm chất; đề xuất designer làm token trung tính hoặc ba độ đậm nhạt của một màu.
sentence.en: Oil, sugar and salt: just a little.
sentence.vi: Dầu ăn, đường và muối: chỉ một chút thôi.
> [CẦN KIỂM] Gộp dầu ăn với đường và muối vào "chỉ một chút" cho gọn. Tháp dinh dưỡng tách mức của dầu mỡ, đường, muối. Chuyên môn xác nhận cách nói này không làm trẻ hiểu thành "chất béo có hại" (misconception `all_fat_bad`, sẽ học kỹ ở bài ba).
image.brief: Chai dầu ăn nhỏ, hũ đường và hũ muối, mỗi thứ kèm một chiếc thìa nhỏ chỉ múc một chút; không có nhãn hiệu thật
image.alt.en: Oil, sugar and salt with small spoons
image.alt.vi: Dầu ăn, đường và muối với thìa nhỏ
examples.1.en: cooking oil
examples.1.vi: dầu ăn
examples.2.en: sugar
examples.2.vi: đường
examples.3.en: salt
examples.3.vi: muối

### new_words
id: 0373fb40-91f9-4626-a268-731878375113
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: balanced, meal, mix

## Chơi

> Bé chọn món từ kệ vào mâm bốn chỗ. Mâm đạt khi có đủ bốn nhóm (đạm, rau, quả, bột đường) và không có đồ ngọt. Mâm chỉ có bốn chỗ, nên mỗi nhóm đúng một món. Bé đặt hai món cùng nhóm (cơm và khoai lang) thì mâm thiếu một nhóm khác và không đạt. Chạm món trong mâm để bỏ ra.
> Yêu cầu mới so với bài một: bài một có ba nhóm bắt buộc (rau và quả chung một nhóm) và còn dư một chỗ; bài hai tách quả thành nhóm bắt buộc thứ tư nên mâm vừa đủ chỗ. Có ba món chưa gặp ở bài một (thịt gà, thanh long, bánh ngọt), bé phải tự xếp nhóm. Kệ xếp xen các nhóm, không xếp từng cặp như bài một.
> Vì sao vẫn là `build_tray`: ở Chơi, schema v1 (`PlayBlock`) và app 0.1.0 chỉ có block này; `sort_into_groups` chưa có trong schema (GĐ 1 S3). Không thêm nhóm chất béo `role: neutral` như bài một đề xuất: xem Ghi chú cho dev.
> Thứ tự nhắc khi mâm thiếu nhiều nhóm theo thứ tự các `#### group`: đạm, rau, quả, bột đường (như bài một, thêm quả sau rau).

### tray
id: 91b0b591-6716-4acb-ab0a-f7bc8c3f2c66
type: build_tray
version: 1
prompt.en: Build a balanced family meal
prompt.vi: Xếp mâm cơm cân bằng cho cả nhà
capacity: 4
success_when: all_required_and_no_limit
messages.start.en: Now fruit has its own group. Pick one food for each group.
messages.start.vi: Giờ quả có nhóm riêng. Mỗi nhóm em chọn một món nhé.
> Câu đầu báo luật đổi so với bài một: ở bài một rau và quả chung một nhóm (tester R3).
messages.full.en: Your tray is full! Tap a food to take it off.
messages.full.vi: Mâm đầy rồi. Em chạm vào một món để bỏ ra nhé.
messages.balanced.en: Great! No single food has every nutrient. So we eat a mix.
messages.balanced.vi: Tuyệt! Không món nào có đủ mọi chất dinh dưỡng. Vì vậy mình ăn phối hợp nhiều món.
> Lời nhắn mâm đạt dạy ý chính ba trước câu q6 (tester R4).
messages.has_limited.en: Sweets are for sometimes. Pick another food!
messages.has_limited.vi: Đồ ngọt chỉ thỉnh thoảng mới ăn. Em chọn món khác nhé!
messages.missing.tray_protein.en: Your tray needs some protein, like tofu or chicken.
messages.missing.tray_protein.vi: Mâm còn thiếu một món giàu chất đạm, như đậu phụ hay thịt gà.
messages.missing.tray_veg.en: Your tray needs some vegetables.
messages.missing.tray_veg.vi: Mâm còn thiếu một món rau.
messages.missing.tray_fruit.en: Your tray needs some fruit for dessert.
messages.missing.tray_fruit.vi: Mâm còn thiếu quả tráng miệng.
messages.missing.tray_carb.en: Your tray needs rice or sweet potato.
messages.missing.tray_carb.vi: Mâm còn thiếu cơm hoặc khoai lang.
> Lời nhắn thiếu nhóm không dùng "Thêm/Add", vì mâm bốn chỗ thường đã đầy khi còn thiếu nhóm (tester R6). Câu nói về mâm của trò chơi ("Your tray", "Mâm"), không nói về bữa ăn thật ở nhà. Giữ chữ "giàu" tới khi Duy nghe clip (tester R13).

#### group tray_protein
label.en: Protein
label.vi: Đạm
color: do_son
role: required

#### group tray_veg
label.en: Vegetables
label.vi: Rau
color: gi_dong
role: required

#### group tray_fruit
label.en: Fruit
label.vi: Quả
color: gi_dong
role: required
> [CẦN KIỂM] Bài coi quả tráng miệng là phần bắt buộc của mâm cân bằng (theo nếp mâm cơm Việt: cơm, món mặn, món rau, quả tráng miệng). Theo khuyến nghị, quả có thể ăn ở bữa phụ chứ không nhất thiết trong bữa. Chuyên môn xác nhận cách giản lược "mâm cân bằng có bột đường, đạm, rau và quả". Thêm góc "không làm xấu hổ": nhà không có quả mỗi bữa không có nghĩa là mâm nhà mình "chưa cân bằng"; vì vậy lời nhắn chỉ nói về mâm của trò chơi (tester R16).

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
image.brief: Dùng lại hình bát cơm của món tray_rice ở bài một
image.alt.en: A bowl of rice
image.alt.vi: Bát cơm

#### item tray_chicken
label.en: Chicken
label.vi: Thịt gà
group: tray_protein
image.brief: Đĩa thịt gà luộc chặt miếng, da vàng, rắc lá chanh thái chỉ, kiểu đĩa gà trong mâm cơm Việt
image.alt.en: A plate of boiled chicken
image.alt.vi: Đĩa thịt gà luộc

#### item tray_greens
label.en: Water spinach
label.vi: Rau muống
group: tray_veg
image.brief: Dùng lại hình đĩa rau muống luộc của món tray_greens ở bài một
image.alt.en: A plate of boiled water spinach
image.alt.vi: Đĩa rau muống luộc

#### item tray_cake
label.en: Cake
label.vi: Bánh ngọt
group: tray_sweet
image.brief: Một miếng bánh bông lan kem trắng có quả dâu trên đĩa nhỏ, không có nến, không có chữ
image.alt.en: A piece of cream cake
image.alt.vi: Miếng bánh kem

#### item tray_dragon_fruit
label.en: Dragon fruit
label.vi: Thanh long
group: tray_fruit
image.brief: Quả thanh long bổ đôi, ruột trắng hạt đen li ti, vỏ hồng có tai xanh
image.alt.en: A dragon fruit cut in half
image.alt.vi: Quả thanh long bổ đôi

#### item tray_sweet_potato
label.en: Sweet potato
label.vi: Khoai lang
group: tray_carb
image.brief: Dùng lại hình củ khoai lang của lựa chọn q3_sweet_potato ở bài một
image.alt.en: A sweet potato cut in half
image.alt.vi: Củ khoai lang bổ đôi

#### item tray_tofu
label.en: Tofu
label.vi: Đậu phụ
group: tray_protein
image.brief: Dùng lại hình đĩa đậu phụ của lựa chọn q5_tofu ở bài một
image.alt.en: Pieces of tofu on a plate
image.alt.vi: Đĩa đậu phụ

#### item tray_banana
label.en: Banana
label.vi: Chuối
group: tray_fruit
image.brief: Dùng lại hình nải chuối của món tray_banana ở bài một
image.alt.en: A bunch of bananas
image.alt.vi: Nải chuối

## Quiz

### q1
id: 164f213c-20f0-4ab2-8216-678e444506eb
format: single_choice
version: 1
dok: 1
prompt.en: What does a balanced meal have?
prompt.vi: Bữa ăn cân bằng có những gì?
hint.en: Remember the tray you just built.
hint.vi: Nhớ lại mâm cơm em vừa xếp nhé.
explanation_correct.en: Yes! A balanced meal mixes foods from different groups.
explanation_correct.vi: Đúng rồi! Bữa ăn cân bằng phối hợp thức ăn của nhiều nhóm.
explanation_wrong.en: The answer is foods from different groups.
explanation_wrong.vi: Đáp án là thức ăn của nhiều nhóm khác nhau.

#### option q1_one_food
correct: false
label.en: Only one kind of food
label.vi: Chỉ một loại thức ăn

#### option q1_groups
correct: true
label.en: Foods from different groups
label.vi: Thức ăn của nhiều nhóm khác nhau

#### option q1_sweets
correct: false
label.en: Lots of sweets
label.vi: Nhiều đồ ngọt

### q2
id: e1120072-6b34-4996-b804-8f9212584895
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
sentence.en: Rice, vegetables and fruit are the {1} part.
sentence.vi: Cơm, rau và quả là phần {1}.
answers: q2_biggest
hint.en: We eat more rice than oil or sugar.
hint.vi: Mình ăn cơm nhiều hơn dầu ăn hay đường.
explanation_correct.en: Rice, vegetables and fruit are the biggest part.
explanation_correct.vi: Cơm, rau và quả là phần nhiều nhất của bữa ăn.
explanation_wrong.en: The answer is biggest. Most of the meal is rice, vegetables and fruit.
explanation_wrong.vi: Đáp án là nhiều nhất. Cơm, rau và quả chiếm phần lớn bữa ăn.

> Ba từ trong ngân hàng ứng với ba ô ở phần Học: "biggest" là phần nhiều nhất, "smaller" là phần ít hơn, "smallest" gần với chỉ một chút. Bỏ "sweetest/ngọt nhất" vì quả ngọt nên từ này hơi có lý (tester R11).

#### bank q2_smaller
label.en: smaller
label.vi: ít hơn

#### bank q2_biggest
label.en: biggest
label.vi: nhiều nhất

#### bank q2_smallest
label.en: smallest
label.vi: ít nhất

### q3
id: 913280ef-2348-4573-b892-04eaee11db3e
format: single_choice
version: 1
dok: 2
prompt.en: Which tray is balanced?
prompt.vi: Mâm nào cân bằng?
hint.en: Find the tray with one food from each group.
hint.vi: Em tìm mâm có mỗi nhóm một món.
explanation_correct.en: Yes! Rice, tofu, carrot and banana make a balanced tray.
explanation_correct.vi: Đúng rồi! Cơm, đậu phụ, cà rốt và chuối là một mâm cân bằng.
explanation_wrong.en: The answer is rice, tofu, carrot and banana. It has every group.
explanation_wrong.vi: Đáp án là cơm, đậu phụ, cà rốt và chuối. Mâm này có đủ các nhóm.
> Mỗi mâm sai có bốn món nhưng hai món cùng một nhóm nên thiếu một nhóm khác: mâm thứ nhất hai món đạm, không có rau; mâm thứ hai hai món bột đường, không có đạm. Lựa chọn chỉ có chữ, lý do ở Ghi chú cho dev.

#### option q3_two_proteins
correct: false
label.en: Rice, fish, egg, banana
label.vi: Cơm, cá, trứng, chuối

#### option q3_two_carbs
correct: false
label.en: Rice, bread, carrot, banana
label.vi: Cơm, bánh mì, cà rốt, chuối

#### option q3_balanced
correct: true
label.en: Rice, tofu, carrot, banana
label.vi: Cơm, đậu phụ, cà rốt, chuối

### q4
id: e2ad3098-9e76-447c-98ba-fc24653991c4
format: multi_choice
version: 1
dok: 2
prompt.en: Lan eats sticky rice. What adds a new group?
prompt.vi: Bữa sáng Lan ăn xôi. Món nào thêm được một nhóm mới?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Bữa sáng của Lan: gói xôi trắng mở trên lá chuối, đặt trên bàn cạnh cặp sách, nắng sớm; chưa có món ăn kèm
image.alt.en: Sticky rice for breakfast
image.alt.vi: Gói xôi trắng cho bữa sáng
hint.en: Sticky rice is a carbohydrate. Look for other groups.
hint.vi: Xôi thuộc nhóm bột đường. Em tìm món thuộc nhóm khác nhé.
explanation_correct.en: Egg adds protein. Banana adds fruit.
explanation_correct.vi: Trứng cho thêm nhóm chất đạm. Chuối cho thêm nhóm quả.
explanation_wrong.en: The answers are egg and banana. Bread and noodles are carbohydrates.
explanation_wrong.vi: Đáp án là trứng và chuối. Bánh mì và bún cũng thuộc nhóm bột đường, giống xôi.
> Lựa chọn sai chỉ gồm món bột đường, không có đồ ngọt: nước ngọt cũng là "một nhóm mới" (nhóm đồ ngọt), câu sẽ có hai cách hiểu.

#### option q4_bread
correct: false
label.en: bread
label.vi: bánh mì
image.brief: Dùng lại hình ổ bánh mì của món tray_bread ở bài một
image.alt.en: A Vietnamese bread roll
image.alt.vi: Ổ bánh mì

#### option q4_egg
correct: true
label.en: egg
label.vi: trứng
image.brief: Dùng lại hình trứng luộc của món tray_egg ở bài một
image.alt.en: Boiled eggs
image.alt.vi: Trứng luộc

#### option q4_noodles
correct: false
label.en: noodles
label.vi: bún
image.brief: Dùng lại hình rổ bún tươi của câu q3 ở bài một
image.alt.en: Some fresh rice noodles
image.alt.vi: Một rổ bún tươi

#### option q4_banana
correct: true
label.en: banana
label.vi: chuối
image.brief: Dùng lại hình nải chuối của món tray_banana ở bài một
image.alt.en: A bunch of bananas
image.alt.vi: Nải chuối

### q5
id: d43075ea-dfbb-474b-b52f-61768718ac03
format: single_choice
version: 1
dok: 2
prompt.en: Nam wants a more balanced bowl. Which part should be bigger?
prompt.vi: Nam muốn bát cơm cân bằng hơn. Phần nào nên nhiều hơn?
image.brief: Bát cơm của bạn Nam nhìn từ trên xuống: thịt kho phủ gần kín bát, chỉ lộ một ít cơm, không có rau; đôi đũa gác trên miệng bát; không vẽ người
image.alt.en: A bowl with lots of meat
image.alt.vi: Bát cơm có nhiều thịt
hint.en: Remember the biggest part of a meal.
hint.vi: Nhớ lại phần nhiều nhất của bữa ăn nhé.
explanation_correct.en: Yes! Rice and vegetables should be the biggest part.
explanation_correct.vi: Đúng rồi! Cơm và rau nên là phần nhiều nhất.
explanation_wrong.en: The answer is rice and vegetables. Meat is a smaller part.
explanation_wrong.vi: Đáp án là cơm và rau. Thịt chỉ là phần ít hơn.
> [CẦN KIỂM] Câu dùng chữ "nên" (lời khuyên về tỉ lệ trong bát cơm của trẻ). Chuyên môn xác nhận được nói với trẻ bảy đến chín tuổi, và "cơm và rau nhiều hơn thịt" đúng với khuyến nghị cho lứa tuổi này.
> Câu nói theo mục tiêu của bạn Nam ("muốn bát cơm cân bằng hơn"), không chê bát của bạn (tester R8). Hình không vẽ người. Đổi tên "Bin" thành "Nam" (bạn Nam ở bài một) vì giọng EN đọc "Bin" như chữ "bin", thùng rác (tester R14). Ở app 0.1.0 hình là hình giữ chỗ, nhưng câu vẫn trả lời được: trong ba lựa chọn, chỉ cơm và rau là phần nên nhiều.

#### option q5_rice_veg
correct: true
label.en: rice and vegetables
label.vi: cơm và rau

#### option q5_meat
correct: false
label.en: meat
label.vi: thịt

#### option q5_oil_salt
correct: false
label.en: oil and salt
label.vi: dầu ăn và muối

### q6
id: 33ce0992-41af-4457-abbd-57ab7ab0a785
format: true_false
version: 1
dok: 3
misconception: one_food_enough
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: spot the mistake
instruction.vi: Thử thách: bắt lỗi sai
statement.en: Water spinach is healthy. Eating only water spinach is enough.
statement.vi: Rau muống rất tốt cho sức khoẻ. Chỉ ăn rau muống thôi là đủ.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: false
hint.en: Think about fish and rice. Does water spinach give the same?
hint.vi: Em nghĩ tới cá và cơm. Rau muống có cho mình giống vậy không?
explanation_correct.en: No single food has every nutrient. We need a mix.
explanation_correct.vi: Không có món nào có đủ mọi chất dinh dưỡng. Mình cần ăn phối hợp nhiều nhóm.
> [CẦN KIỂM] Khẳng định "không có món nào có đủ mọi chất dinh dưỡng" (ở đây, ở Ý chính ba và ở `messages.balanced`): xem `_topic.md`, misconception `one_food_enough`.
explanation_wrong.en: Na is not right. Water spinach is great, but not enough.
explanation_wrong.vi: Na chưa đúng. Rau muống rất tốt, nhưng chỉ ăn rau muống thì chưa đủ.
> Lời Na nói về một món cụ thể (rau muống), khớp misconception "chỉ ăn một món là đủ" (tester R5). Gợi ý chỉ vào bằng chứng (cá, cơm), không hỏi thẳng đáp án (tester R10). Giữ chữ "Na" tới khi Duy nghe clip (tester R13).

## Từ vựng

### balanced
id: b1894b1e-3bf8-469c-9e5a-e01cdcf6178f
tier: core
term.en: balanced
term.vi: cân bằng
example.en: A balanced meal has foods from different groups.
example.vi: Bữa ăn cân bằng có thức ăn của nhiều nhóm.
image.brief: Mâm bốn món nhìn từ trên xuống: bát cơm, đĩa đậu phụ, đĩa rau muống luộc, đĩa chuối, mỗi món một chấm màu của nhóm
image.alt.en: A balanced meal on a tray
image.alt.vi: Mâm cơm cân bằng

### meal
id: e6bc6807-3fa0-44c4-88e7-3f9094a7f724
tier: core
term.en: meal
term.vi: bữa ăn
example.en: I eat a meal with my family.
example.vi: Em ăn bữa cơm cùng cả nhà.
image.brief: Dùng lại hình gia đình quanh mâm cơm của từ healthy ở bài một
image.alt.en: A family eating a meal together
image.alt.vi: Cả nhà ăn cơm cùng nhau

### mix
id: 1cc5a0f1-b681-4224-b2c1-ec0f8443fe0c
tier: core
term.en: mix
term.vi: phối hợp
example.en: We eat a mix of foods.
example.vi: Mình ăn phối hợp nhiều loại thức ăn.
> [CẦN KIỂM] Đổi "kết hợp" thành "phối hợp" theo cách nói của sách và tài liệu dinh dưỡng ("ăn phối hợp nhiều loại thức ăn"; biên tập và tester đều nhớ như vậy, chưa tra lại). Đã đổi đồng bộ ở q1, q6 và lời nhắn mâm đạt.
image.brief: Bát cơm của bạn nhỏ nhìn từ trên xuống: cơm trắng, ít rau muống, một miếng cá kho; đôi đũa gác trên miệng bát
image.alt.en: A bowl with rice, vegetables and fish
image.alt.vi: Bát cơm có rau và cá

### part
id: 32418d98-15c3-4fd6-8a47-9ee48ad3e2e8
tier: extra
term.en: part
term.vi: phần
example.en: Vegetables are a big part of a meal.
example.vi: Rau là một phần lớn của bữa ăn.
image.brief: Dùng lại hình của nhóm explore_big
image.alt.en: A tray with lots of rice, vegetables and fruit
image.alt.vi: Mâm cơm có nhiều cơm, rau và quả

### dessert
id: 5f08bbd6-ca44-4baf-9c99-d1cda7957dd6
tier: extra
term.en: dessert
term.vi: món tráng miệng
example.en: We have fruit for dessert.
example.vi: Mình ăn quả để tráng miệng.
image.brief: Đĩa quả tráng miệng: mấy miếng thanh long và hai quả chuối, đặt ở góc mâm cơm đã ăn xong
image.alt.en: A plate of fruit for dessert
image.alt.vi: Đĩa quả tráng miệng

## Thưởng

### thanh_long
id: c0713cad-9f60-4ad3-b9f3-57005b4c94d7
set: food
rarity: common
name.en: Dragon fruit
name.vi: Thanh long
tag.en: Vitamins and minerals
tag.vi: Vitamin và chất khoáng
fact.en: Dragon fruit grows on a kind of cactus. Vietnam grows lots of dragon fruit.
fact.vi: Thanh long mọc trên một loại cây xương rồng. Việt Nam trồng rất nhiều thanh long.
image.brief: Quả thanh long nguyên quả vỏ hồng tai xanh đặt cạnh nửa quả bổ đôi ruột trắng hạt đen; phía sau là một cành cây thanh long thân ba cạnh như cây xương rồng
image.alt.en: A dragon fruit and its cactus plant
image.alt.vi: Quả thanh long và cây thanh long

## Ghi chú cho hoạ sĩ

- Phong cách E giấy cắt như bài một: bát sành, đĩa sứ, nồi đất, mâm tròn của bữa cơm nhà Việt. Không vẽ nhãn hiệu thật.
- **Không gây xấu hổ:** không vẽ dáng người béo hay gầy, không gạch chéo hay mặt buồn trên món ăn. Đồ ngọt vẽ bình thường, ngon mắt, chỉ nhỏ hơn. Hình q5 (bát nhiều thịt) chỉ vẽ cái bát, không vẽ bạn Nam.
- **Hình mới (mười hai):** ba hình nhóm ở Học (`explore_big`, `explore_smaller`, `explore_little`); ba món ở mâm (`tray_chicken`, `tray_cake`, `tray_dragon_fruit`); gói xôi (q4); bát nhiều thịt (q5); ba hình từ vựng (`balanced`, `mix`, `dessert`); thẻ thanh long.
- **Dùng lại hình của bài một:** bát cơm, rau muống luộc, nải chuối, ổ bánh mì, trứng luộc (mâm bài một); củ khoai lang, rổ bún, đĩa đậu phụ (Quiz bài một); dầu ăn và lạc rang (từ fat); gia đình quanh mâm cơm (từ healthy). Từ `part` dùng lại hình `explore_big`.
- **Ba hình nhóm ở Học** nên cho thấy lượng bằng kích thước: `explore_big` các món chiếm gần hết mâm; `explore_smaller` đĩa đạm nhỏ cạnh bát cơm to; `explore_little` thìa nhỏ múc một chút. Ba hình nên cùng góc nhìn từ trên xuống để trẻ so được.
- **Màn Học có ba ô nhóm** (bài một có bốn): kiểm lưới hai cột trên iPhone (ô thứ ba đứng một mình ở hàng hai) và iPad.
- **Màn Chơi:** bốn chip nhóm bắt buộc (bài một có ba). Dòng điều kiện trên nút mờ dài hơn: "Cần đủ Đạm, Rau, Quả, Bột đường · Đồ ngọt: nên ăn ít"; bản EN có "Protein, Vegetables, Fruit, Carbohydrates". Kiểm nút hai dòng không bị cắt.
- **Màu:**
  - Ở Học: `gi_dong` cho phần nhiều nhất, `do_son` cho phần ít hơn, `nau_dat` cho chỉ một chút. Ô "chỉ một chút" đổi từ `cham` sang `nau_dat` (màu chất béo ở bài một), để dầu ăn không mang màu đồ ngọt (tester R7).
  - Ba ô "lượng" vẫn mượn màu của nhóm chất, nên cơm ở Học mang màu xanh còn ở Chơi mang màu vàng. Đề xuất designer làm một token trung tính, hoặc ba độ đậm nhạt của một màu, cho ba ô này.
  - Ở mâm, nhóm Quả dùng `gi_dong` như nhóm Rau, vì bài một tô rau và quả chung một màu và chỉ có năm token. Hai chip cùng màu đứng cạnh nhau, bé không phân biệt bằng màu được (tester R17). Nếu cần thì designer đề xuất token mới cho quả.
- **Đề xuất khi có hình thật:** q3 (ba mâm) và q5 (bát cơm) có thể thành câu chọn hình, đúng ý "so sánh hai hình" của syllabus-progression mục 6. Khi đó nhãn phải ngắn lại; content-editor soạn lại hai câu.
- Ý chính chưa có trường hình trong schema v1. Gợi ý nếu sau này có màn tóm tắt: (1) mâm bốn món của từ `balanced`; (2) ba hình nhóm ở Học xếp từ to tới nhỏ; (3) bốn món của bốn nhóm quanh một bạn nhỏ, mỗi món một chấm màu nhóm, để thấy cần cả bốn.

## Ghi chú cho dev

- **Block và format:** Học: `explore_groups` (`explore`, ba nhóm), `word_list` (`new_words`). Chơi: `build_tray` (`tray`, bốn chỗ, bốn nhóm `required`, một nhóm `limit`, tám món). Khởi động: `single_choice` (w1), `true_false` (w2), cả hai `recall_from.kind: lesson` trỏ bài một. Quiz: `single_choice` ×3 (q1, q3, q5), `fill_blank_bank` (q2), `multi_choice` (q4), `true_false` (q6, `speaker: na`): bốn format, đều hiện được ở app 0.1.0. DOK q1–q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Câu có `misconception`: q6, key `one_food_enough` (mới thêm vào `_topic.md`).
- **Tham chiếu:** `recall_from.lesson: an-uong-lanh-manh/thuc-an-cho-ta-nhung-gi` → `lesson_id` của bài một. `misconception: one_food_enough` → `misconception_id`. `group:` trỏ nhóm của `tray`; `term_keys` trỏ Từ vựng; `answers: q2_biggest` trỏ `#### bank`. Mọi key duy nhất trong bài.
- **App 0.1.0 chỉ hiện `explore_groups` đầu tiên và `word_list` đầu tiên ở màn Học** (`LessonSession.swift` dòng 115–122, `LearnStep.swift`). `sentence_card` và `key_points` không hiện ra. Vì vậy bài không dùng `sentence_card`. Ý chính một nằm ở `messages.start`; ý chính ba nằm ở `messages.balanced` (trước Quiz) và câu q6. Đề xuất: ios-dev hiện `sentence_card` trước đợt soạn từ 10/11, nếu không mọi ý của phần Học phải nhồi vào một `explore_groups`.
- **Không thêm nhóm chất béo `role: neutral`** (bài một đề xuất cho bài này):
  - Mâm năm chỗ không vừa iPhone: 5 × 70 + 4 × 8 = 382pt, mâm rộng 350pt (`layout.tray.slot_compact`, `layout.tray.width_compact`). Nhờ ios-dev xác nhận.
  - Với bốn chỗ và bốn nhóm bắt buộc, món neutral không bao giờ nằm được trong mâm đạt. Bé đặt lạc vào thì mâm không đạt, rồi dễ hiểu thành "chất béo là xấu" (`all_fat_bad`).
  - Đề xuất đưa nhóm neutral sang bài ba "Ăn uống bao nhiêu là vừa?", nếu app hiện được mâm năm chỗ (xuống dòng hoặc chỗ nhỏ hơn).
- **Lựa chọn chỉ có chữ ở q1, q3, q5:**
  - App 0.1.0 vẽ hình giữ chỗ, nên câu so sánh mâm hay bát chỉ bằng hình thì bé không trả lời được.
  - Lưới hình ba cột cắt nhãn dài (`lineLimit(2)` ở `QuestionViews.swift`). Lựa chọn không có hình thì app xếp thành hàng chữ, đủ chỗ cho nhãn dài.
  - q4 có hình ở lựa chọn, như q5 của bài một. q4 và q5 có hình của cả câu.
- **App không xáo lựa chọn**, nên vị trí đáp án đúng đặt tay: w1 thứ hai; q1 thứ hai; q3 thứ ba; q4 thứ hai và thứ tư; q5 thứ nhất.
- **Màn Chơi:** thứ tự nhắc theo thứ tự `#### group`: đạm, rau, quả, bột đường. Kệ tám món xếp xen nhóm, lưới 4×2 như SK-004. Mâm đầy mà thiếu nhóm (ví dụ cơm, khoai lang, thịt gà, rau muống) thì lời nhắn là `missing.tray_fruit` ("Your tray needs some fruit for dessert."); chạm thanh long ra lời nhắn `full`; bé bỏ khoai lang ra rồi đặt thanh long vào là đạt (giống ca `build-tray-022`). Lời nhắn `missing.*` không dùng "Add/Thêm" vì lúc đó mâm thường đã đầy (tester R6).
  - Đề xuất cho dev và ios-dev (không gấp): một lời nhắn riêng khi mâm có hai món cùng nhóm, ví dụ "Two foods from one group. Swap one!". Cần khoá mới trong `messages` và luật mới trong engine (`build-tray.json`).
- **Thêm misconception vào `_topic.md` làm đổi `topic.json`:**
  - Ba test ở `tools/content-cli/test/markdown.test.ts` sẽ đỏ tới khi dev sinh lại fixture: dòng 112 so `topic.json` với fixture, dòng 127 so bản chép `_topic.md`, dòng 143 chạy CLI `import`. Phải sinh lại `packages/content-schema/fixtures/valid/discoverer/an-uong-lanh-manh/topic.json` và `tools/content-cli/test/fixtures/markdown/valid/.../_topic.md`.
  - `topics[].version` của gói cũng đổi.
  - JSON của bài một không đổi.
- **Số từ EN trên một màn** (đếm như bài một: trạng thái nhiều chữ nhất, món ví dụ ở màn Học hiện bằng tiếng Việt):
  - Học khoảng ba mươi từ: mục tiêu 7, hướng dẫn 3, ba nhãn 7, câu dài nhất 8, ô Từ mới 5.
  - Khởi động và Quiz (sau khi sửa theo rà 2/11): mọi màn từ mười chín tới ba mươi từ. q6 nhiều nhất, ba mươi từ; q4 và q5 hai mươi chín từ.
  - Chơi khoảng bốn mươi ba từ: tên tám món 11, bốn chip 4, dòng điều kiện khoảng 10, lời nhắn dài nhất 13 (`start`), lệnh 5. Màn Chơi của bài một cũng khoảng ba mươi sáu từ. Đề xuất PM chốt cách đếm màn Chơi, ví dụ không tính tên món đã có hình (tester R15).
- **Từ EN ngoài Starters/Movers** trong chữ mới của bài (theo trí nhớ của biên tập, cần đối chiếu danh sách Cambridge): balanced, mix, part, dessert, sticky rice, noodles, tofu, water spinach, sweet potato, dragon fruit, cactus, cooking oil, salt, sugar, carbohydrates, protein, nutrient, challenge, spot, mistake. Phần lớn có hình đi kèm hoặc đã gặp ở bài một.
- **Chính tả Anh** như bài một ("Sweets", "fizzy"); bài không có từ khác nhau giữa Anh và Mỹ.
- **Không dùng dấu "—"** trong chuỗi tiếng Việt.
- **Asset:** không có audio và `asset` trong markdown; máy điền khi chạy `tts` và `assets`. Na là asset chung của app.
