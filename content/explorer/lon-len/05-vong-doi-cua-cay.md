---
id: f826002a-556a-4578-8711-c5b7a5ac3231
topic: lon-len
slug: vong-doi-cua-cay
order: 5
stage: apply
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: The life cycle of a plant
vi: Vòng đời của cây
> Giữ đúng tên ở `content/syllabus.json` (key `new-life`, bài số năm, `extension: true`).

## Mục tiêu
en: I can order a plant's life cycle.
vi: Em xếp được vòng đời của cây.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 18/11/2026. Ticket SK-053. Mọi dòng `id:` để trống; chạy `ids` sau bài 4 (Khởi động w2 trỏ bài 4).
> Ticket ghi "I can put the life cycle of a plant in order." (mười một từ); rút còn bảy từ. Câu VI giữ đúng ticket.
> Bài mới (`extension: true`), không có trong unit Oak *New life*. Misconception lấy từ starter quiz Oak Y2 *Growing plants* L1 (hạt do cây làm ra). Không chép câu, hình, ví dụ của sườn.
> `stage: apply`: áp ý vòng đời (bài 1–4, con vật) sang cây.
> Ranh giới (SK-053): *Cây quanh em* bài 1 dừng ở hạt → hạt nảy mầm → cây con, bài 4 ở nụ → hoa → quả. Bài này nối hai đoạn thành một vòng, thêm chặng già đi; không dạy lại bộ phận cây. Không giải thích thụ phấn ("hoa thành quả" là đủ). Không dùng chuối, dứa làm ví dụ "quả có hạt".
> Chữ "die" · "chết" chỉ ở ý chính ba và ô Grow old, gắn với cây, nối liền với "hạt lại mọc thành cây mới" (SK-053).

## Ý chính
1.en: A seed grows into a young plant.
1.vi: Hạt mọc thành cây con.
2.en: The plant flowers and makes fruit with seeds.
2.vi: Cây ra hoa, kết quả có hạt.
3.en: Old plants die, seeds grow new ones.
3.vi: Cây già rồi chết, hạt mọc thành cây mới.
> Lệch chữ "Bảng soạn": ý hai "The plant flowers and makes seeds." thêm "fruit with" cho EN khớp câu VI "kết quả có hạt" (tám từ).
> Một vòng đời cây đậu: hạt đậu → cây đậu con → hoa đậu → quả đậu có hạt → cây đậu khô cuối vụ. Chữ bé nghe nói "bean plant" · "cây đậu" chung, không nói "cây đậu xanh này", không nói các ảnh là cùng một cây (ảnh hạt, hoa, quả là đậu xanh; ảnh cây khô `explore_dry` là đậu tương; designer 19/11, SK-053 mục 5).

## Khởi động

> Hai câu. w1 ôn *Cây quanh em* bài 4 (nụ nở thành hoa), theo SK-053; câu mới, khác câu w1 "What comes after the flower?" của *Cây quanh em* bài 5. w2 ôn bài 4 hôm trước (bướm chui ra từ nhộng).

### w1
id: 91a0ca43-e107-4e53-bbdb-4b16e7ffb667
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: cay-quanh-em/cay-co-hoa-re-than-la-hoa
prompt.en: A bud opens into a flower.
prompt.vi: Nụ nở ra thành bông hoa.
image.brief: Dùng lại hình `tray_bud` ở bài `cay-quanh-em/cay-co-hoa-re-than-la-hoa`. Từ khoá tìm ảnh (EN): pumpkin flower bud
image.alt.en: Closed yellow petals on a vine
image.alt.vi: Cánh vàng còn khép trên dây bí
answer: true
hint.en: Look at the closed yellow petals.
hint.vi: Em nhìn những cánh vàng còn khép nhé.
explanation_correct.en: Yes! Then the flower makes a fruit.
explanation_correct.vi: Đúng rồi! Rồi bông hoa thành quả.
explanation_wrong.en: This is true. Buds open into flowers.
explanation_wrong.vi: Câu này đúng. Nụ nở ra thành hoa.
feedback_false.en: This closed bud will open soon.
feedback_false.vi: Nụ đang khép này sắp nở rồi.

### w2
id: b7d4eb07-fb05-4272-ac8e-dcd3e2d09931
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: lon-len/con-vat-doi-hinh-dang
prompt.en: What comes out of a chrysalis?
prompt.vi: Cái gì chui ra từ cái nhộng?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Remember the circle on the cabbage leaf.
hint.vi: Em nhớ lại vòng đời trên lá cải nhé.
explanation_correct.en: Yes! A butterfly comes out with wings.
explanation_correct.vi: Đúng rồi! Con bướm có cánh chui ra.
explanation_wrong.en: The answer is the butterfly. It has wings.
explanation_wrong.vi: Đáp án là con bướm. Bướm có đôi cánh.

#### option w2_caterpillar
correct: false
feedback.en: The caterpillar makes the chrysalis first.
feedback.vi: Con sâu hoá thành nhộng trước.
label.en: caterpillar
label.vi: con sâu
image.brief: Dùng lại hình `explore_plant_food` ở bài `chuoi-thuc-an/chuoi-thuc-an-la-gi`. Từ khoá tìm ảnh (EN): cabbage white caterpillar eating leaf
image.alt.en: A caterpillar on a cabbage leaf
image.alt.vi: Con sâu trên lá cải

#### option w2_butterfly
correct: true
label.en: butterfly
label.vi: con bướm
image.brief: Dùng lại hình `q4_butterfly` ở bài `lon-len/con-vat-doi-hinh-dang`. Từ khoá tìm ảnh (EN): Pieris rapae
image.alt.en: A white butterfly on a flower
image.alt.vi: Con bướm trắng trên bông hoa

## Học

> Bốn ô theo vòng đời một cây đậu: hạt thành cây con (ảnh cây đậu con của *Cây quanh em* bài 1), ra hoa, quả đậu có hạt, cây già khô rồi hạt mọc lại. Ô Fruit and seeds sửa trước `seeds_not_from_plants`.
> Ba ảnh mới (hoa đậu, quả đậu, cây đậu khô) nên cùng một loài đậu, tốt nhất đậu xanh (*Vigna radiata*) như ảnh hạt `explore_seeds` và cây con `tray_seedling` của *Cây quanh em* bài 1.
> Ảnh đã chọn 19/11: hoa (`explore_flowers`), quả (`explore_pods`) là đậu xanh; cây khô (`explore_dry`) là đậu tương (*Glycine max*) cuối vụ, vì ảnh ruộng đậu xanh cuối vụ hợp giấy phép còn quá xanh. Đã rà: mọi chữ gắn với ảnh cây khô (ô Grow old, q3, bài 6 w1) nói "bean plants" · "cây đậu" chung, không có "đậu xanh"; "đậu xanh" chỉ ở món, thẻ, lựa chọn dùng ảnh hạt `explore_seeds` (đúng đậu xanh) và tên thẻ `bean_card` (ảnh quả đậu xanh). Chuỗi vẫn mạch lạc vì ô Học nói vòng đời của cây đậu nói chung.

### explore
id: bc755369-3c76-45ab-a2d9-29e184fc86a9
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_seedling
label.en: Seed to seedling
label.vi: Hạt thành cây con
color: nau_dat
sentence.en: A seed grows into a young plant.
sentence.vi: Hạt mọc thành cây con.
image.brief: Dùng lại hình `tray_seedling` ở bài `cay-quanh-em/cay-moc-len-tu-hat`. Từ khoá tìm ảnh (EN): bean seedling soil
image.alt.en: A young bean plant in the soil
image.alt.vi: Cây đậu con trên đất
examples.1.en: a bean seed sprouts in wet soil
examples.1.vi: hạt đậu nảy mầm trong đất ẩm
examples.2.en: the seedling grows new leaves
examples.2.vi: cây con mọc thêm lá
examples.3.en: it grows taller day by day
examples.3.vi: cây cao dần lên từng ngày
> Ô nhắc lại đoạn *Cây quanh em* bài 1 đã dạy (hạt → cây con), để mở vòng.

#### group explore_flowers
label.en: Flowers
label.vi: Ra hoa
color: vang_hoe
sentence.en: The bean plant grows flowers.
sentence.vi: Cây đậu ra hoa.
image.brief: [ảnh] Một cây đậu xanh (*Vigna radiata*) đang có vài bông hoa nhỏ màu vàng nhạt trên thân, lá xanh xung quanh, chụp gần ngoài vườn; nếu không có ảnh đậu xanh hợp lệ thì lấy một loài đậu khác (đậu đũa, đậu cô ve) và ghi loài để `explore_pods`, `explore_dry` cùng loài; không tay, không cọc có chữ, không chữ. Ảnh ngang có khoảng trống (khung vuông ô Học, thẻ `order_sequence`, khung 4:3 câu q2). Từ khoá tìm ảnh (EN): mung bean flowers; Vigna radiata flower; bean plant flowers
image.alt.en: Small yellow flowers on a bean plant
image.alt.vi: Hoa vàng nhỏ trên cây đậu
examples.1.en: small flowers grow on the stem
examples.1.vi: hoa nhỏ mọc trên thân cây
examples.2.en: the flowers turn into pods
examples.2.vi: hoa dần thành quả đậu
examples.3.en: a pumpkin vine has flowers, too
examples.3.vi: dây bí cũng ra hoa
> Không nói thụ phấn, ong, phấn hoa (SK-053). Ví dụ ba nối *Cây quanh em* bài 4.
> [CẦN KIỂM] Hoa đậu xanh màu vàng nhạt; hoa đậu thành quả đậu.

#### group explore_pods
label.en: Fruit and seeds
label.vi: Quả và hạt
color: gi_dong
sentence.en: A bean pod has seeds inside.
sentence.vi: Trong quả đậu có hạt.
image.brief: [ảnh] Vài quả đậu cùng loài với `explore_flowers`, một quả đã tách đôi thấy hàng hạt nằm bên trong, đặt trên nền gỗ hay nền trơn (hoặc còn trên cây); không tay, không túi, không tem, không chữ. Ảnh ngang có khoảng trống (khung vuông ô Học và món Chơi, thẻ ba lựa chọn 5:2 câu q1, thẻ từ 2:1, thẻ thưởng vuông). Hình gốc của cả chủ đề. Từ khoá tìm ảnh (EN): mung bean pods seeds; bean pod open seeds; Vigna radiata pods
image.alt.en: Bean pods with seeds inside
image.alt.vi: Quả đậu có hạt bên trong
examples.1.en: a bean pod is a fruit
examples.1.vi: quả đậu cũng là một loại quả
examples.2.en: a tomato has seeds inside, too
examples.2.vi: quả cà chua cũng có hạt bên trong
examples.3.en: new seeds can grow new plants
examples.3.vi: hạt mới mọc được cây mới
> Ô sửa trước `seeds_not_from_plants` (câu q6). Ví dụ một "quả đậu là quả" theo "Bảng soạn" SK-053.
> [CẦN KIỂM] Quả đậu là quả (theo nghĩa bộ phận cây); cà chua có hạt trong quả.

#### group explore_dry
label.en: Grow old
label.vi: Già đi
color: cham
sentence.en: Old plants die. Seeds grow new plants.
sentence.vi: Cây già rồi chết. Hạt lại mọc thành cây mới.
image.brief: [ảnh] Một luống cây đậu cuối vụ đã khô, thân và quả khô ngả nâu, gần như không còn lá (ảnh đã chọn: đậu tương, sửa brief 19/11 theo ảnh), chụp ngoài ruộng hay vườn, cùng loài với `explore_flowers` nếu được; không người, không lửa đốt rơm, không máy, không chữ. Ảnh ngang có khoảng trống (khung vuông ô Học, khung 4:3 câu q3; bài 6 câu w1 dùng lại). Hình gốc của cả chủ đề. Từ khoá tìm ảnh (EN): dry bean plants end of season; dried bean plants field; mature dry bean crop
image.alt.en: Dry, brown bean plants
image.alt.vi: Cây đậu khô, ngả nâu
examples.1.en: the stems and pods dry and turn brown
examples.1.vi: thân và quả khô lại, ngả nâu
examples.2.en: big trees grow old very slowly
examples.2.vi: cây to già đi rất chậm
examples.3.en: the seeds start a new life cycle
examples.3.vi: hạt bắt đầu một vòng đời mới
> Câu chính là chỗ có chữ "die" · "chết" của bài: gắn với cây, câu sau nối ngay "hạt lại mọc thành cây mới" (SK-053).
> [CẦN KIỂM] Cây đậu sống một vụ: ra quả rồi khô, chết cuối vụ; cây to sống rất lâu nhưng cũng già đi.
> Ảnh thật là ruộng đậu tương cuối vụ: thân và quả khô màu xám nâu, gần như không còn lá, vài lá còn xanh (tester B1, 19/11). Quyết định B1 (b): giữ ảnh, dấu hiệu "già" của cây đậu là **thân và quả khô lại, ngả nâu**, không nói lá vàng. Đã đổi ở bốn chỗ: ví dụ một ô này ("the leaves turn yellow and dry" · "lá vàng úa, khô dần"), gợi ý và `explanation_correct` câu q3, bài 6 w1; cùng `alt` (bỏ "yellow" · "vàng") và `feedback_true` q3. Không ghi tên loài để khỏi lệch với hoa, quả đậu xanh.

### new_words
id: 45b6345d-b7d7-4dd1-9d56-649bef260574
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: seedling, pod

## Chơi

> Bé chọn ba chặng của cây: một hạt (đậu xanh hoặc hạt mít), một cây con (cây đậu con hoặc hàng cây non), một quả có hạt (quả đậu hoặc cà chua bổ đôi). Đạt khi đủ ba nhóm và không chọn vật không phải của cây.
> Món bẫy: bi thuỷ tinh (tròn như hạt) và hòn đá cuội (nằm trên đất như hạt). Khác bẫy của *Cây quanh em* bài 1 (bi, bóng cao su) ở một món. Kệ tám món, toàn ảnh chụp.

### tray
id: 455c1137-35a3-4338-b288-f070b17e64a7
type: build_tray
version: 1
prompt.en: Seed, seedling and fruit
prompt.vi: Hạt, cây con và quả
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find a seed, a seedling and a fruit.
messages.start.vi: Em tìm một hạt, một cây con và một quả nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! The fruit holds new seeds.
messages.balanced.vi: Tuyệt! Trong quả lại có hạt mới.
messages.has_limited.en: That one is not part of a plant.
messages.has_limited.vi: Món này không phải của cây.
messages.missing.tray_seed.en: You still need a seed.
messages.missing.tray_seed.vi: Em còn thiếu một hạt.
messages.missing.tray_young.en: You still need a seedling.
messages.missing.tray_young.vi: Em còn thiếu một cây con.
messages.missing.tray_fruit.en: You still need a fruit.
messages.missing.tray_fruit.vi: Em còn thiếu một quả.
> Lời nhắn `has_limited` đúng với cả hai món bẫy.

#### group tray_seed
label.en: Seed
label.vi: Hạt
color: nau_dat
role: required

#### group tray_young
label.en: Seedling
label.vi: Cây con
color: gi_dong
role: required

#### group tray_fruit
label.en: Fruit
label.vi: Quả
color: vang_hoe
role: required

#### group tray_not_plant
label.en: Not from a plant
label.vi: Không phải của cây
color: do_son
role: limit

#### item tray_beans
label.en: Green beans
label.vi: Hạt đậu xanh
group: tray_seed
image.brief: Dùng lại hình `explore_seeds` ở bài `cay-quanh-em/cay-moc-len-tu-hat`. Từ khoá tìm ảnh (EN): mung bean seeds
image.alt.en: Small green beans
image.alt.vi: Đậu xanh nhỏ

#### item tray_marble
label.en: Glass marbles
label.vi: Bi thuỷ tinh
group: tray_not_plant
image.brief: Dùng lại hình `tray_marble` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): glass marbles close up
image.alt.en: Glass marbles
image.alt.vi: Những viên bi thuỷ tinh

#### item tray_bean_seedling
label.en: Young bean plant
label.vi: Cây đậu con
group: tray_young
image.brief: Dùng lại hình `tray_seedling` ở bài `cay-quanh-em/cay-moc-len-tu-hat`. Từ khoá tìm ảnh (EN): bean seedling soil
image.alt.en: A young bean plant in the soil
image.alt.vi: Cây đậu con trên đất

#### item tray_pods
label.en: Bean pods
label.vi: Quả đậu
group: tray_fruit
image.brief: Dùng lại hình `explore_pods`. Từ khoá tìm ảnh (EN): mung bean pods seeds
image.alt.en: Bean pods with seeds inside
image.alt.vi: Quả đậu có hạt bên trong

#### item tray_jackfruit_seeds
label.en: Jackfruit seeds
label.vi: Hạt mít
group: tray_seed
image.brief: Dùng lại hình `explore_jackfruit_seeds` ở bài `cay-quanh-em/cay-moc-len-tu-hat`. Từ khoá tìm ảnh (EN): jackfruit seeds
image.alt.en: Big jackfruit seeds
image.alt.vi: Những hạt mít to

#### item tray_stone
label.en: Pebble
label.vi: Hòn đá cuội
group: tray_not_plant
image.brief: Dùng lại hình `w1_stone` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): smooth pebble stone sand
image.alt.en: A smooth stone
image.alt.vi: Hòn đá cuội

#### item tray_young_plants
label.en: Young plants
label.vi: Hàng cây non
group: tray_young
image.brief: Dùng lại hình `explore_plants` ở bài `sinh-vat-song-o-dau/vat-song-hay-khong-song`. Từ khoá tìm ảnh (EN): young vegetable seedlings soil row
image.alt.en: Young plants in the soil
image.alt.vi: Cây non mọc trên đất

#### item tray_tomato
label.en: Tomato
label.vi: Quả cà chua
group: tray_fruit
image.brief: [ảnh] Một quả cà chua đỏ bổ đôi trên thớt gỗ hay nền trơn, thấy rõ hạt bên trong; không dao, không tay, không tem, không chữ. Ảnh vuông hoặc ngang có khoảng trống (món Chơi vuông, thẻ từ 2:1). Từ khoá tìm ảnh (EN): tomato cut in half seeds; halved tomato; tomato cross section
image.alt.en: A tomato cut in half
image.alt.vi: Quả cà chua bổ đôi

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2 Đúng, q3 Sai, q6 Sai), `order_sequence` (q4, ba thẻ).
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính. Câu nào cũng tự đủ nghĩa khi chỉ nghe.

### q1
id: 3783cc30-980f-4456-b8b5-71017b412122
format: single_choice
version: 1
dok: 1
prompt.en: Which one is a seedling?
prompt.vi: Cái nào là cây con?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for small green leaves.
hint.vi: Em tìm cây có lá non xanh nhé.
explanation_correct.en: Yes! A seedling is a young plant.
explanation_correct.vi: Đúng rồi! Cây con là cây mới mọc.
explanation_wrong.en: The answer is the young bean plant.
explanation_wrong.vi: Đáp án là cây đậu con.
> DOK 1: nhớ lại từ `seedling` và ô Seed to seedling. Ba hình là ba chặng của cây đậu, khác nhau rõ bằng mắt (hạt tròn, cây có lá, quả dài).

#### option q1_beans
correct: false
feedback.en: These are seeds. They have not sprouted.
feedback.vi: Đây là hạt đậu, chưa nảy mầm.
label.en: green beans
label.vi: hạt đậu xanh
image.brief: Dùng lại hình `explore_seeds` ở bài `cay-quanh-em/cay-moc-len-tu-hat`. Từ khoá tìm ảnh (EN): mung bean seeds
image.alt.en: Small green beans
image.alt.vi: Đậu xanh nhỏ

#### option q1_seedling
correct: true
label.en: young bean plant
label.vi: cây đậu con
image.brief: Dùng lại hình `tray_seedling` ở bài `cay-quanh-em/cay-moc-len-tu-hat`. Từ khoá tìm ảnh (EN): bean seedling soil
image.alt.en: A young bean plant in the soil
image.alt.vi: Cây đậu con trên đất

#### option q1_pods
correct: false
feedback.en: Bean pods hold the seeds.
feedback.vi: Quả đậu chứa hạt bên trong.
label.en: bean pods
label.vi: quả đậu
image.brief: Dùng lại hình `explore_pods`. Từ khoá tìm ảnh (EN): mung bean pods seeds
image.alt.en: Bean pods with seeds inside
image.alt.vi: Quả đậu có hạt bên trong

### q2
id: c85d088d-3181-454e-88c4-d72f0c150bea
format: true_false
version: 1
dok: 1
prompt.en: Bean flowers turn into pods.
prompt.vi: Hoa đậu dần thành quả đậu.
image.brief: Dùng lại hình `explore_flowers`. Từ khoá tìm ảnh (EN): mung bean flowers
image.alt.en: Small yellow flowers on a bean plant
image.alt.vi: Hoa vàng nhỏ trên cây đậu
answer: true
hint.en: Think of what comes after a flower.
hint.vi: Em nghĩ xem sau bông hoa là gì nhé.
explanation_correct.en: Yes! The pods have new seeds inside.
explanation_correct.vi: Đúng rồi! Trong quả đậu có hạt mới.
explanation_wrong.en: This is true. Flowers turn into pods.
explanation_wrong.vi: Câu này đúng. Hoa dần thành quả đậu.
feedback_false.en: A pod grows where a flower was.
feedback_false.vi: Quả đậu mọc ra ở chỗ bông hoa.
> DOK 1: nhớ lại ví dụ hai ô Flowers.

### q3
id: 494c7c2e-3cfb-46be-b17d-57d2d43e29ab
format: true_false
version: 1
dok: 1
prompt.en: Old bean plants stay green forever.
prompt.vi: Cây đậu già vẫn xanh tươi mãi mãi.
image.brief: Dùng lại hình `explore_dry`. Từ khoá tìm ảnh (EN): dry bean plants end of season
image.alt.en: Dry, brown bean plants
image.alt.vi: Cây đậu khô, ngả nâu
answer: false
hint.en: Look at the stems and the pods.
hint.vi: Em nhìn thân cây và quả đậu nhé.
explanation_correct.en: Old bean plants dry and turn brown.
explanation_correct.vi: Cây đậu già khô lại, ngả nâu.
explanation_wrong.en: This is false. Old plants dry up.
explanation_wrong.vi: Câu này sai. Cây già khô dần.
feedback_true.en: These old plants are dry and brown.
feedback_true.vi: Mấy cây đậu già này đã khô, ngả nâu.
> DOK 1: nhớ lại ô Grow old, nhìn ảnh. "Forever" giữ câu khẳng định. `explanation_correct` không có chữ "die", đứng một mình được.

### q4
id: b66480ca-5bcb-40a3-b3f9-b3485182a416
format: order_sequence
version: 1
dok: 2
prompt.en: Start with the bean seeds. Put them in order.
prompt.vi: Bắt đầu từ hạt đậu. Em xếp theo thứ tự nhé.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_seeds, q4_seedling, q4_flowers
hint.en: A plant must grow big to flower.
hint.vi: Cây phải lớn rồi mới ra hoa.
explanation_correct.en: Yes! Next, the flowers make pods.
explanation_correct.vi: Đúng rồi! Sau đó, hoa thành quả đậu.
explanation_wrong.en: The order is seeds, seedling, then flowers.
explanation_wrong.vi: Thứ tự là hạt đậu, cây đậu con, rồi cây ra hoa.
> DOK 2: xếp ba chặng của cây đậu, bắt đầu từ hạt (SK-053 gợi ý "hạt → cây con → cây ra hoa"). Khác câu q4 của *Cây quanh em* bài 1 (hạt, hạt nảy mầm, cây con; ba hình vẽ). Gợi ý chỉ nhắc một đầu. Thẻ trong file không theo thứ tự đúng.
> Ba thẻ là ảnh chụp (cùng kiểu); tốt nhất cùng loài đậu xanh.

#### item q4_flowers
label.en: bean flowers
label.vi: cây đậu ra hoa
image.brief: Dùng lại hình `explore_flowers`. Từ khoá tìm ảnh (EN): mung bean flowers
image.alt.en: Small yellow flowers on a bean plant
image.alt.vi: Hoa vàng nhỏ trên cây đậu

#### item q4_seeds
label.en: green beans
label.vi: hạt đậu xanh
image.brief: Dùng lại hình `explore_seeds` ở bài `cay-quanh-em/cay-moc-len-tu-hat`. Từ khoá tìm ảnh (EN): mung bean seeds
image.alt.en: Small green beans
image.alt.vi: Đậu xanh nhỏ

#### item q4_seedling
label.en: young bean plant
label.vi: cây đậu con
image.brief: Dùng lại hình `tray_seedling` ở bài `cay-quanh-em/cay-moc-len-tu-hat`. Từ khoá tìm ảnh (EN): bean seedling soil
image.alt.en: A young bean plant in the soil
image.alt.vi: Cây đậu con trên đất

### q5
id: 203fbe43-bbd4-4f49-9faf-8e44d6863dcb
format: single_choice
version: 1
dok: 2
prompt.en: Which one has a seed inside?
prompt.vi: Cái nào bên trong có hạt?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of the fruit part of a plant.
hint.vi: Em nghĩ tới phần quả của cây nhé.
explanation_correct.en: Yes! A mango has one big seed.
explanation_correct.vi: Đúng rồi! Quả xoài có một hạt to.
explanation_wrong.en: The answer is the mango, a fruit.
explanation_wrong.vi: Đáp án là quả xoài. Xoài là quả.
> DOK 2: áp ý "hạt nằm trong quả" vào ba món quen (xoài nguyên quả, không thấy hạt). Bé phải biết xoài là quả (*Cây quanh em* bài 5), cà rốt là rễ, rau muống là thân và lá. Không dùng chuối, dứa (SK-053).
> [CẦN KIỂM] Quả xoài có một hạt to (hạt có vỏ cứng bọc ngoài).

#### option q5_carrot
correct: false
feedback.en: A carrot is the root of a plant.
feedback.vi: Cà rốt là rễ của cây.
label.en: carrots
label.vi: cà rốt
image.brief: Dùng lại hình `explore_eat_roots` ở bài `cay-quanh-em/rau-qua-ta-an-la-phan-nao-cua-cay`. Từ khoá tìm ảnh (EN): carrot with leaves
image.alt.en: Carrots with green leaves
image.alt.vi: Cà rốt còn lá xanh

#### option q5_mango
correct: true
label.en: green mango
label.vi: quả xoài xanh
image.brief: Dùng lại hình `tray_green_mango` ở bài `co-the-cua-em/nem-va-so`. Từ khoá tìm ảnh (EN): green mango whole unripe
image.alt.en: A green mango
image.alt.vi: Quả xoài xanh

#### option q5_spinach
correct: false
feedback.en: We eat its stems and leaves.
feedback.vi: Rau muống, mình ăn thân và lá.
label.en: water spinach
label.vi: rau muống
image.brief: Dùng lại hình `explore_eat_leaves` ở bài `cay-quanh-em/rau-qua-ta-an-la-phan-nao-cua-cay`. Từ khoá tìm ảnh (EN): water spinach
image.alt.en: A bunch of water spinach
image.alt.vi: Bó rau muống

### q6
id: 892fc3b6-5c29-4b1b-a303-6ce24824fc5f
format: true_false
version: 1
dok: 2
misconception: seeds_not_from_plants
prompt.en: Seeds just come from the soil.
prompt.vi: Hạt tự có sẵn trong đất.
image.brief: Dùng lại hình `explore_seeds` ở bài `cay-quanh-em/cay-moc-len-tu-hat`. Từ khoá tìm ảnh (EN): mung bean seeds
image.alt.en: Small green beans
image.alt.vi: Đậu xanh nhỏ
answer: false
hint.en: Think of a tomato cut in half.
hint.vi: Em nghĩ tới quả cà chua bổ đôi nhé.
explanation_correct.en: Seeds grow inside the fruit of a plant.
explanation_correct.vi: Hạt nằm trong quả của cây.
explanation_wrong.en: This is false. Seeds come from plants.
explanation_wrong.vi: Câu này sai. Hạt do cây làm ra.
feedback_true.en: Bean seeds grow inside a bean pod.
feedback_true.vi: Hạt đậu nằm trong quả đậu.
> Câu misconception (`seeds_not_from_plants`), DOK 2: bé nghĩ "hạt tự có trong đất, mình nhặt hay mua về" sẽ chạm Đúng. Bé áp ô Fruit and seeds và món cà chua ở kệ Chơi để bác.
> Câu `statement` của key ("Seeds do not come from plants.") có chữ "not"; câu hỏi viết khẳng định (luật Explorer số năm). Không dùng "made in a factory" (đã là câu q6 của *Cây quanh em* bài 5).
> Hình là hạt đậu (vật bé phải nghĩ tới), không phải quả đậu; không tự làm bằng chứng. `explanation_correct` là đúng câu `correction` ở `_topic.md`.

## Từ vựng

### seedling
id: 6a067b12-c737-428d-a4a1-3e71b604db68
tier: core
term.en: seedling
term.vi: cây con
example.en: A seedling grows into a big plant.
example.vi: Cây con lớn lên thành cây to.
image.brief: Dùng lại hình `tray_seedling` ở bài `cay-quanh-em/cay-moc-len-tu-hat`. Từ khoá tìm ảnh (EN): bean seedling soil
image.alt.en: A young bean plant in the soil
image.alt.vi: Cây đậu con trên đất
> *Cây quanh em* chỉ dùng "seedling" ở `brief` và gọi "young plant" · "cây non" trong chữ bé nghe. Bài này đưa "seedling" thành từ mới theo gợi ý SK-053; ô Học vẫn nói "young plant" ở ý chính một, rồi nối sang từ "seedling".

### pod
id: effb292e-24b1-4120-bea3-2d8bf199deee
tier: core
term.en: pod
term.vi: quả đậu
example.en: A pod holds the bean seeds.
example.vi: Quả đậu chứa những hạt đậu.
image.brief: Dùng lại hình `explore_pods`. Từ khoá tìm ảnh (EN): mung bean pods seeds
image.alt.en: Bean pods with seeds inside
image.alt.vi: Quả đậu có hạt bên trong

### bean
id: c90ff141-f76e-4782-b6a1-91e434e5512e
tier: extra
term.en: bean
term.vi: hạt đậu
example.en: A bean seed grows into a bean plant.
example.vi: Hạt đậu mọc thành cây đậu.
image.brief: Dùng lại hình `explore_seeds` ở bài `cay-quanh-em/cay-moc-len-tu-hat`. Từ khoá tìm ảnh (EN): mung bean seeds
image.alt.en: Small green beans
image.alt.vi: Đậu xanh nhỏ

### fruit
id: 1d83942d-967c-4420-9947-3d70393033c9
tier: extra
term.en: fruit
term.vi: quả
example.en: Seeds grow inside the fruit.
example.vi: Hạt nằm bên trong quả.
image.brief: Dùng lại hình `tray_tomato`. Từ khoá tìm ảnh (EN): tomato cut in half seeds
image.alt.en: A tomato cut in half
image.alt.vi: Quả cà chua bổ đôi
> Trùng có chủ ý: `fruit` là từ `core` ở *Cây quanh em* bài 5 (bộ phận ta ăn); ở đây `extra`, nghĩa "quả chứa hạt" của vòng đời, hình khác (cà chua bổ đôi).

## Thưởng

### bean_card
id: 0048b249-28e7-4f6f-a159-f4800ce4c88a
set: life_cycles
rarity: common
name.en: Mung bean plant
name.vi: Cây đậu xanh
tag.en: From seeds to seeds
tag.vi: Từ hạt lại ra hạt
fact.en: One bean plant can make many pods.
fact.vi: Một cây đậu ra được rất nhiều quả.
image.brief: Dùng lại hình `explore_pods`. Từ khoá tìm ảnh (EN): mung bean pods seeds
image.alt.en: Bean pods with seeds inside
image.alt.vi: Quả đậu có hạt bên trong
> Bộ `set: life_cycles` (SK-053 quyết định 9: bộ chung cho cả con vật và cây). Khác thẻ `bean_sprout_card` (giá đỗ, bộ `plants`, *Cây quanh em* bài 2).
> [CẦN KIỂM] Một cây đậu xanh ra nhiều quả; tên thẻ "Mung bean plant" phải khớp loài trong ảnh `explore_pods` (đổi tên nếu designer chọn loài đậu khác).

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Không hình tự vẽ, không hình ghép.
- **Ảnh mới, hình gốc của cả chủ đề (giữ đúng key, `alt`, truy vấn đầu ở `_topic.md`):** quả đậu có hạt (`explore_pods`), cây đậu khô cuối vụ (`explore_dry`; bài 6 w1 dùng lại).
- **Ảnh mới chỉ dùng ở bài này:** cây đậu ra hoa (`explore_flowers`), quả cà chua bổ đôi (`tray_tomato`).
- **Chuỗi cây đậu nhất quán (SK-053):** hoa, quả, cây khô cùng một loài đậu, tốt nhất đậu xanh *Vigna radiata* như hạt `explore_seeds` và cây con `tray_seedling` của *Cây quanh em* bài 1. Chọn loài khác (đậu đũa, đậu cô ve) thì ghi loài ở `note` và báo content-editor để đổi tên thẻ thưởng, từ "green beans" ở thẻ q4. Ảnh đã chọn 19/11: hoa, quả đậu xanh; cây khô `explore_dry` là đậu tương. Chữ gắn với ảnh cây khô nói "cây đậu" chung; tên thẻ "Cây đậu xanh" giữ vì thẻ dùng ảnh quả đậu xanh.
- **Ảnh dùng lại:** *Cây quanh em* bài 1 `tray_seedling` (ô Học, món Chơi, q1, q4, từ `seedling`), `explore_seeds` (món Chơi, q1, q4, q6, từ `bean`), `explore_jackfruit_seeds` (món Chơi), bài 4 `tray_bud` (w1), bài 5 `explore_eat_roots`, `explore_eat_leaves` (q5); *Cơ thể của em* bài 6 `tray_green_mango` (q5); *Sinh vật sống ở đâu?* bài 1 `explore_plants` (món Chơi), bài 3 `tray_marble` (món Chơi); bài 4 chủ đề này `q4_butterfly` (w2); *Chuỗi thức ăn* bài 2 `explore_plant_food` (w2); *Gọi tên và nhóm động vật* bài 1 `w1` (hàng rào tre); Discoverer *Hô hấp* `w1_stone` (món Chơi).
- **Không có:** chuối, dứa; ong, phấn hoa; dao, tay người; tem, túi có chữ; lửa đốt rơm.
- **Ảnh khó:** quả đậu tách đôi thấy hạt; cây đậu khô trông "già" mà không cháy, không bị nhổ.
- **Màu:** Học: hạt thành cây con `nau_dat`, ra hoa `vang_hoe`, quả và hạt `gi_dong`, già đi `cham`. Chơi: hạt `nau_dat`, cây con `gi_dong`, quả `vang_hoe`, không phải của cây `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (seedling, pod). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món. Khởi động `true_false` (w1 Đúng), `single_choice` hai lựa chọn (w2). Quiz `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2 Đúng, q3 Sai, q6 Sai), `order_sequence` (q4). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`seeds_not_from_plants`). Không có `labels` ở câu `true_false`.
- **`order_sequence` q4:** thứ tự đúng `q4_seeds`, `q4_seedling`, `q4_flowers`.
- **Màn Chơi, ví dụ để kiểm:** Hạt đậu xanh, Cây đậu con, Quả đậu → `balanced`; Hạt mít, Hàng cây non, Quả cà chua → `balanced`; Hạt đậu xanh, Hạt mít, Quả đậu → `missing.tray_young`; Hòn đá cuội, Cây đậu con, Quả đậu → `has_limited`.
- **Khởi động trỏ:** w1 → `cay-quanh-em/cay-co-hoa-re-than-la-hoa` (đã có id), w2 → `lon-len/con-vat-doi-hinh-dang` (chạy `ids` bài 4 trước).
- **Thưởng:** `set: life_cycles`.
- **Từ EN có thể ngoài Starters/Movers:** seedling, pod, bean, sprouts, chrysalis, butterfly, caterpillar, cabbage, pumpkin vine, carrot, water spinach, mango, marbles, pebble.
