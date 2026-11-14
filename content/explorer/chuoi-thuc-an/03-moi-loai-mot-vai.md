---
id: 8db91ce2-91ce-42c8-8a9f-cabcae66317d
topic: chuoi-thuc-an
slug: moi-loai-mot-vai
order: 3
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Roles in a food chain
vi: Mỗi loài một vai trong chuỗi thức ăn
> Tên mới, đã vào `content/syllabus.json` (phiên chính đổi 14/11). Tên cũ "Ai ăn ai trong chuỗi thức ăn?" kéo bé về cách đọc mũi tên là "ăn" (misconception của bài hai) và chưa nói tới "vai", trọng tâm của lesson.

## Mục tiêu
en: I can tell each role in a chain.
vi: Em nói được vai của từng cây, từng con vật trong chuỗi thức ăn.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 14/11/2026. Mọi dòng `id:` để trống; chạy `ids` sau bài hai.
> Mục tiêu EN rút còn tám từ (bỏ "food"), vì `validate` 14/11 cảnh báo `age_words_en` (chín từ).
> Ba vai: đầu chuỗi (cây là thức ăn), giữa chuỗi (vừa ăn vừa là thức ăn), cuối chuỗi (ăn con đứng trước). Chuỗi chính: lúa → chuột → cú. Sửa `end_animal_matters_most` ở ý chính ba, ô Học "The whole chain" và câu q6 (gắn key).

## Ý chính
1.en: A plant is food. It starts the chain.
1.vi: Cây là thức ăn. Cây đứng đầu chuỗi.
2.en: The middle animal eats and is food.
2.vi: Con vật ở giữa vừa ăn, vừa là thức ăn.
3.en: Each one needs the one before it.
3.vi: Mỗi con đều cần cây hay con vật đứng trước nó.
> Từ cụ thể tới trừu tượng: vai của cây (thấy được), vai của con ở giữa (phải nghĩ hai việc cùng lúc), rồi ý cả chuỗi dựa vào nhau. Không dùng producer, consumer, predator, prey.

## Khởi động

> Ba câu: w1 bài hai (thức ăn của châu chấu), w2 bài một (gặm cỏ), w3 chủ đề số một bài ba (con cú là chim, có lông vũ).

### w1
id: 71e40147-6d2e-49cf-a4c5-4a10e3944a20
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: chuoi-thuc-an/chuoi-thuc-an-la-gi
prompt.en: What is food for a grasshopper?
prompt.vi: Đâu là thức ăn của con châu chấu?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Remember the Arrow picture.
hint.vi: Em nhớ lại ô Mũi tên nhé.
explanation_correct.en: Yes! A grasshopper nibbles grass and leaves.
explanation_correct.vi: Đúng rồi! Châu chấu gặm cỏ và lá cây.
explanation_wrong.en: The answer is the grass. Grasshoppers eat plants.
explanation_wrong.vi: Đáp án là cỏ. Châu chấu ăn cây cỏ.

#### option w1_grass
correct: true
label.en: grass
label.vi: cỏ
image.brief: Dùng lại hình `q4_grass` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): bundle fresh green grass
image.alt.en: Fresh green grass
image.alt.vi: Cỏ tươi

#### option w1_fish
correct: false
feedback.en: Small fish are food for egrets.
feedback.vi: Cá nhỏ là thức ăn của cò.
label.en: small fish
label.vi: cá nhỏ
image.brief: Dùng lại hình `q4_fish` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): small fish swimming shallow water
image.alt.en: Small fish in water
image.alt.vi: Cá nhỏ dưới nước

### w2
id: ca5b1b0c-6ffc-4f32-a5b3-d26cf46f17c0
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: chuoi-thuc-an/con-vat-kiem-an-the-nao
prompt.en: A buffalo grazes on grass.
prompt.vi: Con trâu gặm cỏ.
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu
answer: true
hint.en: Remember the Graze picture.
hint.vi: Em nhớ lại ô Gặm cỏ nhé.
explanation_correct.en: Yes! A buffalo finds grass in the field.
explanation_correct.vi: Đúng rồi! Trâu tự tìm cỏ ngoài đồng.
explanation_wrong.en: This is true. Buffaloes graze on grass.
explanation_wrong.vi: Câu này đúng. Trâu gặm cỏ.
feedback_false.en: A buffalo chews grass in the field.
feedback_false.vi: Trâu nhai cỏ ngoài đồng.
> Hình là trâu uống nước bên suối, không phải trâu gặm cỏ (bằng chứng).

### w3
id: 2b1007aa-6a16-4b2f-b754-16a2f67435de
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/chim-va-bo-sat
prompt.en: An owl has fur, like a cat.
prompt.vi: Con cú có lông giống con mèo.
image.brief: Dùng lại hình `explore_hunt` ở bài `chuoi-thuc-an/con-vat-kiem-an-the-nao`. Từ khoá tìm ảnh (EN): owl perched branch wild
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành
answer: false
hint.en: Look at the owl's wings.
hint.vi: Em nhìn đôi cánh của con cú nhé.
explanation_correct.en: An owl is a bird. It has feathers.
explanation_correct.vi: Cú là chim. Cú có lông vũ.
explanation_wrong.en: This is false. An owl has feathers.
explanation_wrong.vi: Câu này sai. Cú có lông vũ.
feedback_true.en: An owl has soft feathers, like other birds.
feedback_true.vi: Cú có lông vũ mềm, giống các loài chim khác.
> Ôn dấu hiệu "chim có lông vũ" của chủ đề số một bài ba bằng con cú (con vật chính của bài này). Bé hay thấy lông cú mềm, xù như lông mèo. Theo bảng Tên gọi chủ đề số một: "lông" cho thú, "lông vũ" cho chim.
> Đáp án Sai: giải thích khi đúng không mở đầu bằng "Yes!".

## Học

> Bốn ô theo chuỗi lúa → chuột → cú: đầu chuỗi, giữa chuỗi, cuối chuỗi, cả chuỗi. Ba ô đầu mỗi ô một ảnh; ô cuối là hình ghép cả chuỗi.

### explore
id: 2c07e910-67d5-431f-a37b-4724b1339904
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_start
label.en: Start
label.vi: Đầu chuỗi
color: gi_dong
sentence.en: Rice is food. It starts the chain.
sentence.vi: Lúa là thức ăn. Lúa đứng đầu chuỗi.
image.brief: [ảnh] Cận cảnh mấy bông lúa chín vàng trĩu hạt trên ruộng, ảnh ngang, nền ruộng lúa mờ; không có người, không có chim, chuột hay côn trùng, không có chữ. Từ khoá tìm ảnh (EN): ripe rice ears close up paddy
image.alt.en: Ripe rice in a field
image.alt.vi: Bông lúa chín ngoài đồng
examples.1.en: every chain starts with a plant
examples.1.vi: chuỗi nào cũng bắt đầu từ cây
examples.2.en: grass starts a chain, too
examples.2.vi: cỏ cũng đứng đầu chuỗi
> Hình gốc cây lúa cho bài ba, bốn (món kệ, thẻ thứ tự, lựa chọn, hình ghép). Ảnh ngang để vừa thẻ 5:2.

#### group explore_middle
label.en: Middle
label.vi: Giữa chuỗi
color: vang_hoe
sentence.en: A mouse eats rice. It is food, too.
sentence.vi: Chuột ăn lúa. Chuột cũng là thức ăn.
image.brief: Dùng lại hình `w2` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`. Từ khoá tìm ảnh (EN): rice field rat sitting ground
image.alt.en: A mouse on the ground
image.alt.vi: Con chuột trên mặt đất
examples.1.en: rice is food for the mouse
examples.1.vi: lúa là thức ăn của chuột
examples.2.en: the mouse is food for the owl
examples.2.vi: chuột là thức ăn của cú
examples.3.en: a grasshopper is often in the middle
examples.3.vi: châu chấu cũng hay đứng giữa chuỗi
> [CẦN KIỂM] Chuột đồng ăn lúa, hạt và mầm cỏ (biên tập nhớ).

#### group explore_end
label.en: End
label.vi: Cuối chuỗi
color: cham
sentence.en: The owl eats the mouse.
sentence.vi: Cú ăn chuột.
image.brief: Dùng lại hình `explore_hunt` ở bài `chuoi-thuc-an/con-vat-kiem-an-the-nao`. Từ khoá tìm ảnh (EN): owl perched branch wild
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành
examples.1.en: the owl is at the end
examples.1.vi: cú đứng cuối chuỗi
examples.2.en: a frog can be at the end, too
examples.2.vi: ếch cũng có thể đứng cuối chuỗi
examples.3.en: in this chain, nothing eats the owl
examples.3.vi: trong chuỗi này, không con nào ăn cú
> Ví dụ ba nói "trong chuỗi này", vì ở chuỗi khác vẫn có con ăn cú; bài bốn dạy một con vật có mặt trong nhiều chuỗi.

#### group explore_whole
label.en: The whole chain
label.vi: Cả chuỗi
color: nau_dat
sentence.en: Each one needs the one before it.
sentence.vi: Mỗi con đều cần cây hay con vật đứng trước nó.
image.brief: [sơ đồ ghép ảnh] Khung 4:3, ba ảnh vuông cùng cỡ xếp một hàng từ trái sang phải: lúa (`explore_start`), chuột (`chuoi-thuc-an-la-gi/w2`), cú (`con-vat-kiem-an-the-nao/explore_hunt`); giữa hai ảnh là mũi tên chỉ sang phải, cùng kiểu với `chuoi-thuc-an-la-gi/explore_arrow`; nền giấy trơn; không có chữ, không có số.
image.alt.en: Rice, a mouse, then an owl
image.alt.vi: Lúa, con chuột, rồi con cú
examples.1.en: the mouse needs rice
examples.1.vi: chuột cần lúa
examples.2.en: the owl needs mice
examples.2.vi: cú cần chuột
examples.3.en: so the owl needs rice, too
examples.3.vi: vậy cú cũng cần lúa
> Câu q6 hỏi cùng ý trên một chuỗi khác (cỏ, châu chấu, ếch), để câu đó là áp dụng, không chỉ nhắc lại ví dụ ba.

### new_words
id: ef9c2a23-db8a-4de7-91b5-f31b738f8211
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: role, mouse

## Chơi

> Bé ghép một chuỗi thức ăn ba món: một cây đứng đầu, một con ở giữa, một con ở cuối. Đạt khi đủ ba vai và không chọn thứ không phải vật sống.
> Mọi cách ghép đúng đều là chuỗi có thật: (lúa hoặc cỏ) → (chuột hoặc châu chấu) → cú. Nhóm cuối chỉ có con cú, vì cú ăn cả chuột lẫn châu chấu; thêm ếch thì "lúa, chuột, ếch" thành chuỗi sai.
> Món bẫy giống một nhóm: chuột đồ chơi giống con chuột; tượng cú bằng gỗ giống con cú.
> [CẦN KIỂM] Cú (nhất là cú mèo) ăn cả châu chấu và côn trùng lớn; chuột đồng ăn cả hạt cỏ (biên tập nhớ).

### tray
id: 5d3c9ac8-5073-45ff-8ff3-05b07b377dff
type: build_tray
version: 1
prompt.en: Make a food chain: start, middle, end
prompt.vi: Xếp một chuỗi thức ăn: đầu, giữa, cuối
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick a start, a middle and an end.
messages.start.vi: Em chọn một cây đứng đầu, một con ở giữa và một con ở cuối nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Each one has a role.
messages.balanced.vi: Tuyệt! Cây và con vật nào cũng có vai của mình.
messages.has_limited.en: That one is not alive. It is not food.
messages.has_limited.vi: Thứ này không phải vật sống. Nó không làm thức ăn được.
messages.missing.tray_start.en: Every chain starts with a plant.
messages.missing.tray_start.vi: Chuỗi nào cũng bắt đầu từ một cây.
messages.missing.tray_middle.en: You still need one in the middle.
messages.missing.tray_middle.vi: Em còn thiếu một con ở giữa chuỗi.
messages.missing.tray_end.en: You still need one at the end.
messages.missing.tray_end.vi: Em còn thiếu một con ở cuối chuỗi.

#### group tray_start
label.en: Start
label.vi: Đầu chuỗi
color: gi_dong
role: required

#### group tray_middle
label.en: Middle
label.vi: Giữa chuỗi
color: vang_hoe
role: required

#### group tray_end
label.en: End
label.vi: Cuối chuỗi
color: cham
role: required

#### group tray_not
label.en: Not alive
label.vi: Không phải vật sống
color: do_son
role: limit

#### item tray_mouse
label.en: Mouse
label.vi: Con chuột
group: tray_middle
image.brief: Dùng lại hình `w2` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`. Từ khoá tìm ảnh (EN): rice field rat sitting ground
image.alt.en: A mouse on the ground
image.alt.vi: Con chuột trên mặt đất

#### item tray_wood_owl
label.en: Wooden owl
label.vi: Tượng cú bằng gỗ
group: tray_not
image.brief: [ảnh] Một tượng con cú tạc bằng gỗ, màu gỗ, đặt trên bàn hoặc kệ, nhìn thẳng, thấy rõ là đồ gỗ (vân gỗ, nét đục); ảnh vuông hoặc ngang; không có nhãn hiệu, không có giá tiền, không có chữ, không có người. Từ khoá tìm ảnh (EN): wooden owl carving
image.alt.en: An owl carved from wood
image.alt.vi: Tượng con cú bằng gỗ

#### item tray_owl
label.en: Owl
label.vi: Con cú
group: tray_end
image.brief: Dùng lại hình `explore_hunt` ở bài `chuoi-thuc-an/con-vat-kiem-an-the-nao`. Từ khoá tìm ảnh (EN): owl perched branch wild
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành

#### item tray_rice
label.en: Rice plant
label.vi: Cây lúa
group: tray_start
image.brief: Dùng lại hình `explore_start`. Từ khoá tìm ảnh (EN): ripe rice ears close up paddy
image.alt.en: Ripe rice in a field
image.alt.vi: Bông lúa chín ngoài đồng

#### item tray_toy_mouse
label.en: Toy mouse
label.vi: Chuột đồ chơi
group: tray_not
image.brief: [ảnh] Một con chuột đồ chơi bằng vải nỉ hoặc nhựa (đồ chơi cho mèo), màu xám, đuôi bằng sợi dây, đặt trên sàn, nhìn nghiêng; thấy rõ là đồ chơi (đường may, mắt nhựa); không có nhãn hiệu, không có chữ, không có tay người, không có mèo. Từ khoá tìm ảnh (EN): toy mouse cat toy
image.alt.en: A grey toy mouse
image.alt.vi: Con chuột đồ chơi màu xám

#### item tray_grasshopper
label.en: Grasshopper
label.vi: Con châu chấu
group: tray_middle
image.brief: Dùng lại hình `explore_insects` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): grasshopper on leaf side view
image.alt.en: A grasshopper on a leaf
image.alt.vi: Con châu chấu trên lá

#### item tray_grass
label.en: Grass
label.vi: Cỏ
group: tray_start
image.brief: Dùng lại hình `q4_grass` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): bundle fresh green grass
image.alt.en: Fresh green grass
image.alt.vi: Cỏ tươi

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q3, q4; ba lựa chọn), `true_false` (q2, q6), `order_sequence` (q5, ba thẻ).

### q1
id: b40ba846-2a8a-4861-8661-7b221d006024
format: single_choice
version: 1
dok: 1
prompt.en: Which one starts a food chain?
prompt.vi: Đâu là thứ đứng đầu chuỗi thức ăn?
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê
hint.en: Look for the plant.
hint.vi: Em tìm cái cây nhé.
explanation_correct.en: Yes! Rice is food for many animals.
explanation_correct.vi: Đúng rồi! Cây lúa là thức ăn của nhiều con vật.
explanation_wrong.en: The answer is rice. A chain starts with a plant.
explanation_wrong.vi: Đáp án là cây lúa. Chuỗi bắt đầu từ cây.
> Ba món của chuỗi lúa, chuột, cú; thứ tự thẻ trong file (cú, lúa, chuột) không theo thứ tự chuỗi.

#### option q1_owl
correct: false
feedback.en: An owl must eat mice to live.
feedback.vi: Cú phải ăn chuột mới sống được.
label.en: owl
label.vi: con cú
image.brief: Dùng lại hình `explore_hunt` ở bài `chuoi-thuc-an/con-vat-kiem-an-the-nao`. Từ khoá tìm ảnh (EN): owl perched branch wild
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành

#### option q1_rice
correct: true
label.en: rice
label.vi: cây lúa
image.brief: Dùng lại hình `explore_start`. Từ khoá tìm ảnh (EN): ripe rice ears close up paddy
image.alt.en: Ripe rice in a field
image.alt.vi: Bông lúa chín ngoài đồng

#### option q1_mouse
correct: false
feedback.en: A mouse has fur and a long tail.
feedback.vi: Chuột có bộ lông và cái đuôi dài.
label.en: mouse
label.vi: con chuột
image.brief: Dùng lại hình `w2` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`. Từ khoá tìm ảnh (EN): rice field rat sitting ground
image.alt.en: A mouse on the ground
image.alt.vi: Con chuột trên mặt đất

### q2
id: 18f4bfac-7f84-4abb-b94f-e77bb55beda5
format: true_false
version: 1
dok: 1
prompt.en: The owl is food for the mouse.
prompt.vi: Cú là thức ăn của chuột.
image.brief: Dùng lại hình `w2` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`. Từ khoá tìm ảnh (EN): rice field rat sitting ground
image.alt.en: A mouse on the ground
image.alt.vi: Con chuột trên mặt đất
answer: false
hint.en: Which one catches the other?
hint.vi: Con nào bắt con nào?
explanation_correct.en: The mouse is food. Owls hunt mice at night.
explanation_correct.vi: Chuột mới là thức ăn. Cú săn chuột vào ban đêm.
explanation_wrong.en: This is false. The owl eats the mouse.
explanation_wrong.vi: Câu này sai. Cú ăn chuột.
feedback_true.en: An owl catches and eats mice.
feedback_true.vi: Cú bắt chuột để ăn.
> Hỏi lại chiều "là thức ăn của" (`arrow_means_eats` của bài hai, không gắn key) bằng lời: câu đảo vai cú và chuột. Đáp án Sai: giải thích khi đúng không mở đầu bằng "Yes!".

### q3
id: 0fcd2e5a-d3b7-40ce-b72e-2a58bcf3acd2
format: single_choice
version: 1
dok: 1
prompt.en: What is food for the owl?
prompt.vi: Đâu là thức ăn của con cú?
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê
hint.en: Remember the End picture.
hint.vi: Em nhớ lại ô Cuối chuỗi nhé.
explanation_correct.en: Yes! An owl eats animals, not plants.
explanation_correct.vi: Đúng rồi! Cú ăn con vật, không ăn cây.
explanation_wrong.en: The answer is the mouse. Owls eat mice.
explanation_wrong.vi: Đáp án là con chuột. Cú ăn chuột.
> Hai lựa chọn sai là hai cây đứng đầu chuỗi (lúa, cỏ), để bé phân biệt "đầu chuỗi" với "thức ăn của con cuối".

#### option q3_mouse
correct: true
label.en: mouse
label.vi: con chuột
image.brief: Dùng lại hình `w2` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`. Từ khoá tìm ảnh (EN): rice field rat sitting ground
image.alt.en: A mouse on the ground
image.alt.vi: Con chuột trên mặt đất

#### option q3_rice
correct: false
feedback.en: Rice is a plant, not an animal.
feedback.vi: Lúa là cây, không phải con vật.
label.en: rice
label.vi: cây lúa
image.brief: Dùng lại hình `explore_start`. Từ khoá tìm ảnh (EN): ripe rice ears close up paddy
image.alt.en: Ripe rice in a field
image.alt.vi: Bông lúa chín ngoài đồng

#### option q3_grass
correct: false
feedback.en: Grass is food for grasshoppers and buffaloes.
feedback.vi: Cỏ là thức ăn của châu chấu và trâu.
label.en: grass
label.vi: cỏ
image.brief: Dùng lại hình `q4_grass` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): bundle fresh green grass
image.alt.en: Fresh green grass
image.alt.vi: Cỏ tươi

### q4
id: c005513d-6f34-4e9e-8ae4-ea024fbd2d28
format: single_choice
version: 1
dok: 2
prompt.en: Rice, mouse, owl. Which one eats and is food?
prompt.vi: Lúa, chuột, cú. Con nào vừa ăn, vừa là thức ăn?
image.brief: Dùng lại hình `q3` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): village house yard Vietnam morning
image.alt.en: A yard in a village
image.alt.vi: Sân nhà ở làng quê
hint.en: Remember the Middle picture.
hint.vi: Em nhớ lại ô Giữa chuỗi nhé.
explanation_correct.en: Yes! The mouse eats rice. The owl eats it.
explanation_correct.vi: Đúng rồi! Chuột ăn lúa, rồi cú ăn chuột.
explanation_wrong.en: The answer is the mouse. It is in the middle.
explanation_wrong.vi: Đáp án là con chuột. Chuột đứng giữa chuỗi.
> DOK 2: nói vai của từng món trong chuỗi bé nghe bằng lời. Hai câu EN ba và sáu từ, cả màn chín từ.
> Thẻ đúng (chuột) đặt thứ ba, không đặt ở giữa: bé vừa nghe "lúa, chuột, cú" sẽ không chọn được theo vị trí.

#### option q4_owl
correct: false
feedback.en: In this chain, nothing eats the owl.
feedback.vi: Trong chuỗi này, không con nào ăn cú.
label.en: owl
label.vi: con cú
image.brief: Dùng lại hình `explore_hunt` ở bài `chuoi-thuc-an/con-vat-kiem-an-the-nao`. Từ khoá tìm ảnh (EN): owl perched branch wild
image.alt.en: An owl on a branch
image.alt.vi: Con cú đậu trên cành

#### option q4_rice
correct: false
feedback.en: Rice is a plant and eats nothing.
feedback.vi: Lúa là cây, lúa không ăn gì cả.
label.en: rice
label.vi: cây lúa
image.brief: Dùng lại hình `explore_start`. Từ khoá tìm ảnh (EN): ripe rice ears close up paddy
image.alt.en: Ripe rice in a field
image.alt.vi: Bông lúa chín ngoài đồng
> [CẦN KIỂM] "Cây không ăn" là cách nói cho bé năm tuổi (cây tự làm ra thức ăn, để dành chủ đề Discoverer). Người chuyên môn xem có chấp nhận không.

#### option q4_mouse
correct: true
label.en: mouse
label.vi: con chuột
image.brief: Dùng lại hình `w2` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`. Từ khoá tìm ảnh (EN): rice field rat sitting ground
image.alt.en: A mouse on the ground
image.alt.vi: Con chuột trên mặt đất

### q5
id: 11a0a219-46e7-4a30-a6f7-1623fffc29d4
format: order_sequence
version: 1
dok: 2
prompt.en: Tap the food chain in order.
prompt.vi: Em chạm theo thứ tự của chuỗi thức ăn nhé.
image.brief: Dùng lại hình `q3` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): village house yard Vietnam morning
image.alt.en: A yard in a village
image.alt.vi: Sân nhà ở làng quê
answer: q5_rice, q5_grasshopper, q5_frog
hint.en: Which one is the plant? Start there.
hint.vi: Đâu là cây? Em bắt đầu từ đó nhé.
explanation_correct.en: Yes! In rice fields, frogs eat grasshoppers.
explanation_correct.vi: Đúng rồi! Ngoài ruộng lúa, ếch bắt châu chấu.
explanation_wrong.en: The order is rice, grasshopper, frog.
explanation_wrong.vi: Thứ tự là cây lúa, châu chấu, con ếch.
> DOK 2: xếp một chuỗi mới ở ruộng lúa, ghép điều đã học ở bài hai (ếch ăn châu chấu) với cây lúa của bài này. Thẻ trong file không theo thứ tự đúng.
> [CẦN KIỂM] Châu chấu ăn lá lúa (biên tập nhớ: châu chấu là loài hại lúa).

#### item q5_frog
label.en: frog
label.vi: con ếch
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

#### item q5_rice
label.en: rice
label.vi: cây lúa
image.brief: Dùng lại hình `explore_start`. Từ khoá tìm ảnh (EN): ripe rice ears close up paddy
image.alt.en: Ripe rice in a field
image.alt.vi: Bông lúa chín ngoài đồng

#### item q5_grasshopper
label.en: grasshopper
label.vi: con châu chấu
image.brief: Dùng lại hình `explore_insects` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): grasshopper on leaf side view
image.alt.en: A grasshopper on a leaf
image.alt.vi: Con châu chấu trên lá

### q6
id: ef711562-519c-4949-b261-64cd72daeaf0
format: true_false
version: 1
dok: 2
misconception: end_animal_matters_most
prompt.en: The frog needs the grass, too.
prompt.vi: Con ếch cũng cần có cỏ.
image.brief: Dùng lại hình `explore_chain` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`.
image.alt.en: Grass, a grasshopper, then a frog
image.alt.vi: Cỏ, con châu chấu, rồi con ếch
answer: true
hint.en: What does the grasshopper eat?
hint.vi: Em nghĩ xem châu chấu ăn gì?
explanation_correct.en: Yes! Every one in the chain matters.
explanation_correct.vi: Đúng rồi! Cây và con nào trong chuỗi cũng quan trọng.
explanation_wrong.en: This is true. Frogs eat grasshoppers, and grasshoppers eat grass.
explanation_wrong.vi: Câu này đúng. Ếch ăn châu chấu, mà châu chấu ăn cỏ.
feedback_false.en: Grasshoppers need grass, and frogs need grasshoppers.
feedback_false.vi: Châu chấu cần cỏ, ếch cần châu chấu.
> Câu misconception (`end_animal_matters_most`), bằng hình: hình chuỗi cỏ, châu chấu, ếch của bài hai. Bé còn nghĩ "con cuối chuỗi là quan trọng nhất, chỉ cần con ngay trước nó" sẽ chạm lắc đầu (ếch không ăn cỏ).
> DOK 2: áp ý "mỗi con cần cái đứng trước nó" (ô "The whole chain", chuỗi lúa, chuột, cú) sang một chuỗi khác.
> Câu `explanation_wrong` EN thứ hai bảy từ. Hình gốc là hình ghép nên không có dòng từ khoá để chép.

## Từ vựng

### role
id: f883f3c8-2773-42b3-9673-8a6704c177e3
tier: core
term.en: role
term.vi: vai trò
example.en: Each one has a role in a chain.
example.vi: Cây và con vật nào cũng có vai trò trong chuỗi.
image.brief: Dùng lại hình `explore_whole`.
image.alt.en: Rice, a mouse, then an owl
image.alt.vi: Lúa, con chuột, rồi con cú

### mouse
id: 610ab4a5-f95c-496f-878d-85ea68124b83
tier: core
term.en: mouse
term.vi: con chuột
example.en: A mouse eats rice in the field.
example.vi: Chuột ăn lúa ngoài đồng.
image.brief: Dùng lại hình `w2` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`. Từ khoá tìm ảnh (EN): rice field rat sitting ground
image.alt.en: A mouse on the ground
image.alt.vi: Con chuột trên mặt đất

### rice
id: e12d7e98-2883-4d9f-8332-80c9efd1e7a5
tier: extra
term.en: rice
term.vi: cây lúa
example.en: Rice is food for mice and birds.
example.vi: Lúa là thức ăn của chuột và chim.
image.brief: Dùng lại hình `explore_start`. Từ khoá tìm ảnh (EN): ripe rice ears close up paddy
image.alt.en: Ripe rice in a field
image.alt.vi: Bông lúa chín ngoài đồng

### field
id: c49a3bba-f407-45df-b51d-fdc781f6188a
tier: extra
term.en: field
term.vi: cánh đồng
example.en: Owls hunt mice in the field.
example.vi: Cú săn chuột ngoài cánh đồng.
image.brief: Dùng lại hình `w1` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): rice field wind waves Vietnam
image.alt.en: Wind blowing over a rice field
image.alt.vi: Gió thổi trên cánh đồng lúa

## Thưởng

### mouse_card
id: 3fb6beb1-e422-4de8-ac2f-89cdf11e46c2
set: animals
rarity: common
name.en: Field mouse
name.vi: Chuột đồng
tag.en: In the middle of the chain
tag.vi: Đứng giữa chuỗi
fact.en: Its front teeth keep growing all its life.
fact.vi: Răng cửa của chuột dài ra suốt đời.
image.brief: Dùng lại hình `w2` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`. Từ khoá tìm ảnh (EN): rice field rat sitting ground
image.alt.en: A mouse on the ground
image.alt.vi: Con chuột trên mặt đất
> [CẦN KIỂM] Răng cửa của loài gặm nhấm mọc dài ra liên tục, chuột gặm để mài răng (biên tập nhớ). Câu EN tám từ. Tên thẻ EN "Field mouse" theo cách gọi trong bài; loài trong ảnh là chuột đồng (rice field rat), xem bảng Tên gọi ở `_topic.md`.

## Ghi chú cho hoạ sĩ

- **Loại hình:** ảnh chụp thật, cộng một hình ghép (`explore_whole`). Hình câu q4, q5 là hình vẽ sân nhà dùng lại của *Hô hấp* (hình câu hỏi, Explorer ẩn ở câu có thẻ).
- **Ảnh cần tìm (ba):**
  - Học (một): bông lúa chín (hình gốc cho bài ba, bốn).
  - Chơi (hai): tượng cú bằng gỗ; chuột đồ chơi.
- **Hình ghép (một):** lúa, chuột, cú; cùng kiểu mũi tên và khung với hình ghép bài hai.
- **Ảnh khó:** chuột đồ chơi trông rõ là đồ chơi (không giống chuột thật tới mức bé lẫn); tượng cú bằng gỗ không có chữ khắc.
- **q1, q3, q4:** lúa, chuột, cú (và cỏ) cùng cỡ vật trong khung 5:2; cú dáng ngang (xem bài một).
- **q5 (`order_sequence`):** lúa, châu chấu, ếch cắt vuông, cùng cỡ.
- **Màu:** Học: đầu chuỗi `gi_dong`, giữa chuỗi `vang_hoe`, cuối chuỗi `cham`, cả chuỗi `nau_dat`. Chơi: đầu `gi_dong`, giữa `vang_hoe`, cuối `cham`, không phải vật sống `do_son`. Màu ba vai giống nhau ở Học và Chơi để bé nhớ vai theo màu.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (bốn nhóm), `word_list` (role, mouse).
  - Chơi: `build_tray`: ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món.
  - Khởi động: `single_choice` (w1, hai lựa chọn, ôn bài hai), `true_false` (w2 Đúng, ôn bài một; w3 Sai, ôn chủ đề số một bài ba).
  - Quiz: `single_choice` (q1, q3, q4), `true_false` (q2 Sai, q6 Đúng), `order_sequence` (q5). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`end_animal_matters_most`).
- **Vị trí đáp án đúng:** w1 thứ nhất; q1 thứ hai; q3 thứ nhất; q4 thứ ba. q5: thẻ trong file ếch, lúa, châu chấu → đúng: lúa, châu chấu, ếch.
- **Màn Chơi, ví dụ để kiểm:** Cây lúa, Con chuột, Con cú → `balanced`; Cỏ, Con châu chấu, Chuột đồ chơi → `has_limited`; Cây lúa, Cỏ, Con cú → `missing.tray_middle`.
- **Tên bài mới:** đã có trong `content/syllabus.json` (phiên chính đổi 14/11).
- **Từ EN có thể ngoài Starters/Movers:** role, owl, grasshopper, wooden, carved, ripe.
