---
id: 4f4c988f-f94e-4cd2-af00-edbcdeea6461
topic: cay-quanh-em
slug: hoa-nhieu-mau-nhieu-hinh
order: 7
stage: review
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Flowers of many colours
vi: Hoa nhiều màu, nhiều hình
> Giữ đúng tên ở `content/syllabus.json` (key `identifying-plants-and-their-basic-parts`, bài số bảy). Chính tả Anh "colours".

## Mục tiêu
en: I can compare flowers by colour and shape.
vi: Em so sánh được hoa theo màu và hình.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 18/11/2026. Ticket SK-051. Mọi dòng `id:` để trống; chạy `ids` sau bài 6 (Khởi động trỏ bài 6 và bài 3).
> Sườn: Oak Y1 L6 `common-flowering-plants` (`docs/oak/identifying-plants-and-their-basic-parts.md`). Hoa của sườn (anh túc, lưu ly, cúc) thay bằng sen, hướng dương, hoa giấy, hoa mai, hoa phượng. Không app nhận diện cây (sườn có): gọi tên hoa bằng chọn hình.
> Bài `review`: Khởi động ôn trộn bài 6, bài 3 và *Thời tiết và các mùa* (mốc khoảng một tháng); câu q5 nối bài 1, 4, 5 (hạt có từ hoa).
> Ví dụ cây không có hoa chỉ là dương xỉ, rêu; không cỏ, lúa, xoài. Chỉ nói "hoa giấy", không "cánh hoa giấy" (phần màu là lá bắc). Có câu ngắm hoa, không hái (ý chính ba, ô Colours, câu q3).
> Sửa `all_plants_have_flowers` ở ý chính một, ô No flowers, phần Chơi (nhóm `limit`) và câu q6 (gắn key).

## Ý chính
1.en: Some plants have flowers. Some do not.
1.vi: Có cây có hoa, có cây không có hoa.
2.en: Flowers come in many colours and shapes.
2.vi: Hoa có nhiều màu, nhiều hình.
3.en: Look at flowers, but do not pick them.
3.vi: Mình ngắm hoa, không hái hoa.
> Ý ba đổi từ "We look at flowers, we do not pick them." ở "Bảng soạn" (chín từ) cho đủ tám từ; bản VI giữ đúng câu ticket.
> Thứ tự ô Học đi từ cụ thể (cánh hoa sen, hình hoa hướng dương, màu hoa giấy) tới ý phân loại (cây không có hoa).

## Khởi động

> Ba câu, ôn trộn: w1 bài 6 (bài trước, lá phượng li ti), w2 bài 3 (cách bốn bài, rễ ở dưới đất), w3 *Thời tiết và các mùa* bài 2 (mốc khoảng một tháng; hoa sen là món nhóm Hoa ở kệ Chơi bài đó).

### w1
id: eeb444bd-b506-4480-98ca-b3d070cb72ea
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: cay-quanh-em/la-cay-nhieu-hinh-nhieu-co
prompt.en: Which leaf has lots of tiny leaves?
prompt.vi: Lá nào gồm rất nhiều lá li ti?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look closely at each leaf.
hint.vi: Em nhìn kỹ từng chiếc lá nhé.
explanation_correct.en: Yes! Flame tree leaves look like feathers.
explanation_correct.vi: Đúng rồi! Lá phượng trông như lông chim.
explanation_wrong.en: The answer is the flame tree leaf. It has tiny leaves.
explanation_wrong.vi: Đáp án là lá phượng. Lá phượng có nhiều lá li ti.

#### option w1_banana
correct: false
feedback.en: A banana leaf is one long leaf.
feedback.vi: Lá chuối là một chiếc lá dài.
label.en: banana leaf
label.vi: lá chuối
image.brief: Dùng lại hình `explore_banana_leaf` ở bài `cay-quanh-em/la-cay-nhieu-hinh-nhieu-co`. Từ khoá tìm ảnh (EN): banana leaf
image.alt.en: A big, long banana leaf
image.alt.vi: Tàu lá chuối to và dài

#### option w1_flame
correct: true
label.en: flame tree leaf
label.vi: lá phượng
image.brief: Dùng lại hình `explore_flame_leaf` ở bài `cay-quanh-em/la-cay-nhieu-hinh-nhieu-co`. Từ khoá tìm ảnh (EN): Delonix regia leaves
image.alt.en: Feathery green leaves
image.alt.vi: Lá xanh như lông chim
> `alt` riêng ở chỗ này (`alt` gốc "A leaf made of tiny leaves" có chữ của câu hỏi). Ảnh, key, `brief` giữ như hình gốc.

### w2
id: 36938ee2-9999-493f-bec6-123723626bde
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: cay-quanh-em/cay-to-re-than-canh-la
prompt.en: Roots grow at the top of a tree.
prompt.vi: Rễ mọc ở ngọn cây.
image.brief: Dùng lại hình `explore_roots` ở bài `cay-quanh-em/cay-to-re-than-canh-la`. Từ khoá tìm ảnh (EN): tree roots exposed
image.alt.en: Big roots at the bottom of a tree
image.alt.vi: Rễ to ở gốc cây
answer: false
hint.en: Look at the bottom of this tree.
hint.vi: Em nhìn phía dưới gốc cây nhé.
explanation_correct.en: Roots grow under the ground.
explanation_correct.vi: Rễ cây nằm dưới đất.
explanation_wrong.en: This is false. Roots are under the ground.
explanation_wrong.vi: Câu này sai. Rễ nằm dưới đất.
feedback_true.en: Leaves grow up high, not roots.
feedback_true.vi: Lá mới mọc ở trên cao, không phải rễ.
> Câu mới, khác câu q1 "Which part is under the ground?" bài 3.

### w3
id: ea462aff-0c7e-4107-80a3-8bc5837d5cf4
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: thoi-tiet-va-cac-mua/mua-xuan-va-mua-he
prompt.en: Lotus flowers bloom in summer.
prompt.vi: Hoa sen nở vào mùa hè.
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao
answer: true
hint.en: Think of hot days by the pond.
hint.vi: Em nghĩ tới những ngày nóng bên ao sen nhé.
explanation_correct.en: Yes! Flame trees bloom in summer, too.
explanation_correct.vi: Đúng rồi! Hoa phượng cũng nở vào mùa hè.
explanation_wrong.en: This is true. Lotus flowers bloom in summer.
explanation_wrong.vi: Câu này đúng. Sen nở vào mùa hè.
feedback_false.en: Pink lotus flowers open on hot days.
feedback_false.vi: Hoa sen hồng nở vào những ngày nóng.
> Mốc ôn khoảng một tháng (`_topic.md` mục Khởi động). Ở bài nguồn hoa sen là món nhóm Hoa của kệ Chơi, không là câu hỏi; câu này mới.
> [CẦN KIỂM] Hoa sen nở vào mùa hè (đã ghi ở *Thời tiết và các mùa* mục Đúng khoa học).

## Học

> Bốn ô: cánh hoa (sen), hình hoa (hướng dương), màu hoa (hoa giấy), cây không có hoa (dương xỉ, rêu). Ô Colours có lời dặn ngắm, không hái và cành có gai.
> Ô Shapes không nói hạt hướng dương ở đâu, để câu q5 là bé tự nối từ bài 4, 5 (hoa thành quả, trong quả có hạt).

### explore
id: 4a6338ac-2ee3-4831-8ed5-a948db8797de
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_petals
label.en: Petals
label.vi: Cánh hoa
color: cham
sentence.en: A lotus has big, soft pink petals.
sentence.vi: Hoa sen có cánh to, mềm, màu hồng.
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao
examples.1.en: petals are the bright parts
examples.1.vi: cánh hoa là phần có màu tươi
examples.2.en: there are white lotus flowers, too
examples.2.vi: có cả hoa sen trắng
examples.3.en: peach blossoms have small petals
examples.3.vi: hoa đào có cánh nhỏ
> Ví dụ ba dạy trước câu q4 (màu hoa đào). Không đặt hoa mai trong ô này (luật không đặt hoa đào cạnh hoa mai).
> [CẦN KIỂM] Có sen hồng, sen trắng; hoa đào cánh nhỏ, màu hồng.

#### group explore_sunflower
label.en: Shapes
label.vi: Nhiều hình
color: vang_hoe
sentence.en: A sunflower is round, like the Sun.
sentence.vi: Hoa hướng dương tròn như Mặt Trời.
image.brief: [ảnh] Một bông hướng dương to, tròn, cánh vàng tươi xếp quanh, giữa màu nâu, chụp chính diện gần, nền trời hay lá xanh mờ; không người, không chữ. Ảnh vuông hoặc ngang (khung vuông ô Học, món Chơi, thẻ ba lựa chọn 5:2, khung 4:3 câu q2, thẻ từ 2:1). Hình gốc của cả chủ đề. Từ khoá tìm ảnh (EN): sunflower; Helianthus annuus flower head; sunflower close up
image.alt.en: A big yellow sunflower
image.alt.vi: Bông hướng dương vàng to
examples.1.en: it has many yellow petals
examples.1.vi: hoa có rất nhiều cánh vàng
examples.2.en: some flowers are tiny
examples.2.vi: có hoa nhỏ xíu
examples.3.en: a sunflower plant can grow very tall
examples.3.vi: cây hướng dương có thể cao hơn cả em
> Câu chính so với Mặt Trời là so hình, không bảo bé nhìn Mặt Trời. Ví dụ ba bản VI nói "cao hơn cả em" (bản EN "very tall", tám từ).
> [CẦN KIỂM] Cây hướng dương có thể cao hơn một đứa trẻ năm tới bảy tuổi.

#### group explore_bougainvillea
label.en: Colours
label.vi: Nhiều màu
color: nau_dat
sentence.en: Bougainvillea flowers come in many colours.
sentence.vi: Hoa giấy có rất nhiều màu.
image.brief: [ảnh] Một giàn hoa giấy màu hồng tím (một màu) phủ trên cổng hay bờ tường, chụp ngang, nhiều chùm hoa; không người, không biển, không chữ trên cổng hay tường. Đúng loài *Bougainvillea*. Một màu để món Chơi chỉ vào nhóm Màu hồng. Ảnh ngang (khung vuông ô Học, món Chơi, thẻ ba lựa chọn 5:2 câu q1, thẻ từ 2:1). Hình gốc của cả chủ đề. Từ khoá tìm ảnh (EN): Bougainvillea; pink bougainvillea gate; magenta bougainvillea wall
image.alt.en: Pink bougainvillea over a gate
image.alt.vi: Giàn hoa giấy hồng trên cổng
examples.1.en: pink, purple, white or orange
examples.1.vi: hồng, tím, trắng hay cam
examples.2.en: look, but do not pick
examples.2.vi: ngắm thôi, đừng hái nhé
examples.3.en: its stems have sharp thorns
examples.3.vi: cành hoa giấy có gai nhọn
> Chỉ nói "hoa giấy" · "bougainvillea flowers", không "cánh hoa giấy" (phần màu là lá bắc; SK-051). Ví dụ hai là ý chính ba; ví dụ ba là lời dặn an toàn.
> [CẦN KIỂM] Hoa giấy có nhiều màu (hồng, tím, trắng, cam); phần có màu là lá bắc (bài không nói); cành có gai.

#### group explore_no_flowers
label.en: No flowers
label.vi: Không có hoa
color: gi_dong
sentence.en: Ferns and moss have no flowers.
sentence.vi: Dương xỉ và rêu không có hoa.
image.brief: Dùng lại hình `tray_fern` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): fern plant close up forest floor
image.alt.en: A fern
image.alt.vi: Cây dương xỉ
examples.1.en: ferns like shady, damp places
examples.1.vi: dương xỉ thích chỗ râm, ẩm
examples.2.en: moss grows on old, damp walls
examples.2.vi: rêu mọc trên tường cũ, ẩm
examples.3.en: they are plants, too
examples.3.vi: chúng cũng là cây
> Ô sửa `all_plants_have_flowers`. Chỉ dương xỉ, rêu làm ví dụ cây không có hoa (SK-051). Hình chép mục Discoverer `khung-long/trai-dat-rat-lau-ve-truoc` `tray_fern` (`same_as` không sang nhóm tuổi khác), như *Sinh vật sống ở đâu?* bài 5.
> [CẦN KIỂM] Dương xỉ và rêu không có hoa.

### new_words
id: 7d978c33-df83-44d8-9f8d-b5f3a863d3cd
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: petal, colour

## Chơi

> Bé chọn ba bông hoa ba màu: một hoa hồng (hoa sen hoặc hoa giấy), một hoa vàng (hướng dương hoặc hoa mai), một hoa đỏ (hoa phượng). Đạt khi đủ ba nhóm và không chọn cây không có hoa.
> Món bẫy: dương xỉ, rêu: cũng là cây, xanh tươi, nhưng không có hoa (sửa `all_plants_have_flowers`). Kệ bảy món, toàn ảnh chụp. Kệ có hoa mai, không có hoa đào (luật không đặt hoa đào cạnh hoa mai). Nhãn nhóm `limit` "No flowers" trùng nhãn ô Học.

### tray
id: 51014ca1-8e88-4bba-b50b-f4480a39a96b
type: build_tray
version: 1
prompt.en: Choose pink, yellow and red flowers
prompt.vi: Chọn hoa màu hồng, màu vàng và màu đỏ
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find one flower of each colour.
messages.start.vi: Em tìm mỗi màu một bông hoa nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Flowers come in many colours.
messages.balanced.vi: Tuyệt! Hoa có thật nhiều màu.
messages.has_limited.en: That plant has no flowers.
messages.has_limited.vi: Cây này không có hoa.
messages.missing.tray_pink.en: You still need a pink flower.
messages.missing.tray_pink.vi: Em còn thiếu một hoa màu hồng.
messages.missing.tray_yellow.en: You still need a yellow flower.
messages.missing.tray_yellow.vi: Em còn thiếu một hoa màu vàng.
messages.missing.tray_red.en: You still need a red flower.
messages.missing.tray_red.vi: Em còn thiếu một hoa màu đỏ.
> Lời nhắn `has_limited` đúng với cả hai món bẫy.

#### group tray_pink
label.en: Pink
label.vi: Màu hồng
color: cham
role: required

#### group tray_yellow
label.en: Yellow
label.vi: Màu vàng
color: vang_hoe
role: required

#### group tray_red
label.en: Red
label.vi: Màu đỏ
color: nau_dat
role: required

#### group tray_no_flowers
label.en: No flowers
label.vi: Không có hoa
color: do_son
role: limit

#### item tray_sunflower
label.en: Sunflower
label.vi: Hoa hướng dương
group: tray_yellow
image.brief: Dùng lại hình `explore_sunflower`. Từ khoá tìm ảnh (EN): sunflower
image.alt.en: A big yellow sunflower
image.alt.vi: Bông hướng dương vàng to

#### item tray_moss
label.en: Moss
label.vi: Rêu
group: tray_no_flowers
image.brief: Dùng lại hình `explore_wall` ở bài `sinh-vat-song-o-dau/nhung-noi-song-nho-xiu`. Từ khoá tìm ảnh (EN): old brick wall moss small ferns
image.alt.en: Moss on an old wall
image.alt.vi: Rêu trên bức tường cũ

#### item tray_flame
label.en: Flame tree flowers
label.vi: Hoa phượng
group: tray_red
image.brief: Dùng lại hình `explore_summer` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): Delonix regia
image.alt.en: Red flowers on a big tree
image.alt.vi: Hoa đỏ trên cây to

#### item tray_lotus
label.en: Lotus
label.vi: Hoa sen
group: tray_pink
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao

#### item tray_fern
label.en: Fern
label.vi: Dương xỉ
group: tray_no_flowers
image.brief: Dùng lại hình `explore_no_flowers`. Từ khoá tìm ảnh (EN): fern plant close up forest floor
image.alt.en: A fern
image.alt.vi: Cây dương xỉ

#### item tray_apricot
label.en: Yellow apricot blossoms
label.vi: Hoa mai
group: tray_yellow
image.brief: Dùng lại hình `explore_tet` ở bài `thoi-tiet-va-cac-mua/muoi-hai-thang`. Từ khoá tìm ảnh (EN): Ochna integerrima
image.alt.en: Yellow blossoms on a branch
image.alt.vi: Cành hoa vàng

#### item tray_bougainvillea
label.en: Bougainvillea
label.vi: Hoa giấy
group: tray_pink
image.brief: Dùng lại hình `explore_bougainvillea`. Từ khoá tìm ảnh (EN): Bougainvillea
image.alt.en: Pink bougainvillea over a gate
image.alt.vi: Giàn hoa giấy hồng trên cổng

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1, q4, q5; ba lựa chọn), `true_false` (q2 Đúng, q3 Sai, q6 Sai).
> Hình câu `single_choice` là hàng rào tre trung tính. Câu nào cũng tự đủ nghĩa khi chỉ nghe.

### q1
id: 937d7f4a-1e75-44a8-9eed-13228f02396b
format: single_choice
version: 1
dok: 1
prompt.en: Which flower is yellow?
prompt.vi: Hoa nào màu vàng?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of the colour of ripe bananas.
hint.vi: Em nghĩ tới màu chuối chín nhé.
explanation_correct.en: Yes! It has many yellow petals.
explanation_correct.vi: Đúng rồi! Hoa có rất nhiều cánh vàng.
explanation_wrong.en: The answer is the sunflower. It is yellow.
explanation_wrong.vi: Đáp án là hoa hướng dương. Hoa màu vàng.
> DOK 1: nhận ra màu. Ba hoa khác màu rõ (vàng, hồng nhạt, hồng tím). Gợi ý trỏ tới màu một vật quen, không gọi tên hoa.

#### option q1_lotus
correct: false
feedback.en: A lotus is pink.
feedback.vi: Hoa sen màu hồng.
label.en: lotus
label.vi: hoa sen
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao

#### option q1_sunflower
correct: true
label.en: sunflower
label.vi: hoa hướng dương
image.brief: Dùng lại hình `explore_sunflower`. Từ khoá tìm ảnh (EN): sunflower
image.alt.en: A big, round sunflower
image.alt.vi: Bông hướng dương to, tròn
> `alt` riêng ở chỗ này (`alt` gốc có chữ "yellow" của câu hỏi).

#### option q1_bougainvillea
correct: false
feedback.en: These bougainvillea flowers are pink.
feedback.vi: Hoa giấy này màu hồng.
label.en: bougainvillea
label.vi: hoa giấy
image.brief: Dùng lại hình `explore_bougainvillea`. Từ khoá tìm ảnh (EN): Bougainvillea
image.alt.en: Pink bougainvillea over a gate
image.alt.vi: Giàn hoa giấy hồng trên cổng

### q2
id: f96ded7a-6ba3-4434-ba3c-5bfd0db22fdb
format: true_false
version: 1
dok: 1
prompt.en: A sunflower is round, like the Sun.
prompt.vi: Hoa hướng dương tròn như Mặt Trời.
image.brief: Dùng lại hình `explore_sunflower`. Từ khoá tìm ảnh (EN): sunflower
image.alt.en: A big yellow sunflower
image.alt.vi: Bông hướng dương vàng to
answer: true
hint.en: Look at the shape of this flower.
hint.vi: Em nhìn hình dáng bông hoa nhé.
explanation_correct.en: Yes! Yellow petals grow all around it.
explanation_correct.vi: Đúng rồi! Cánh vàng mọc quanh bông hoa.
explanation_wrong.en: This is true. A sunflower is big and round.
explanation_wrong.vi: Câu này đúng. Hướng dương to và tròn.
feedback_false.en: This sunflower has a round shape.
feedback_false.vi: Bông hướng dương này có hình tròn.
> DOK 1: nhớ lại câu chính ô Shapes, nhìn ảnh. So hình với Mặt Trời, không bảo bé nhìn Mặt Trời.

### q3
id: 5cd7f243-c3ac-40e2-8f08-e507d04f9f2c
format: true_false
version: 1
dok: 1
prompt.en: We pick the flowers we see in parks.
prompt.vi: Thấy hoa trong công viên, mình hái hoa.
image.brief: Dùng lại hình `tray_flower_bed` ở bài `sinh-vat-song-o-dau/bao-ve-nhung-noi-song-nho`. Từ khoá tìm ảnh (EN): colorful flower bed sunny garden
image.alt.en: A sunny flower bed
image.alt.vi: Luống hoa đầy nắng
answer: false
hint.en: Think of others who want to see them.
hint.vi: Em nghĩ tới những bạn khác cũng muốn ngắm hoa nhé.
explanation_correct.en: We look at flowers and leave them growing.
explanation_correct.vi: Mình ngắm hoa và để hoa ở lại trên cây.
explanation_wrong.en: This is false. We just look at them.
explanation_wrong.vi: Câu này sai. Mình chỉ ngắm hoa thôi.
feedback_true.en: Flowers stay pretty when we leave them.
feedback_true.vi: Để hoa trên cây, hoa mới tươi lâu.
> DOK 1: nhớ lại ý chính ba và ví dụ hai ô Colours. Câu khẳng định, đáp án Sai: bé bác một việc không nên làm. `explanation_correct` đứng một mình được (thẻ "Ý sai → Ý đúng").

### q4
id: 7eb4208c-b8d2-4d06-ab3d-e615be25cfe5
format: single_choice
version: 1
dok: 2
prompt.en: Which flower is pink, like peach blossoms?
prompt.vi: Hoa nào màu hồng, giống hoa đào?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for a soft, light colour.
hint.vi: Em tìm màu nhạt, dịu nhé.
explanation_correct.en: Yes! Pink lotus flowers bloom in summer.
explanation_correct.vi: Đúng rồi! Sen hồng nở vào mùa hè.
explanation_wrong.en: The answer is the lotus. It is pink.
explanation_wrong.vi: Đáp án là hoa sen. Sen màu hồng.
> DOK 2: so màu một hoa bé nhớ (hoa đào, *Thời tiết và các mùa* bài 2, ví dụ ba ô Petals) với ba hoa trước mặt. Không có hoa mai trong câu (luật không đặt hoa đào cạnh hoa mai); không có hoa giấy (cũng hồng, sẽ hai đáp án).

#### option q4_flame
correct: false
feedback.en: Flame tree flowers are bright red.
feedback.vi: Hoa phượng màu đỏ rực.
label.en: flame tree flowers
label.vi: hoa phượng
image.brief: Dùng lại hình `explore_summer` ở bài `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he`. Từ khoá tìm ảnh (EN): Delonix regia
image.alt.en: Red flowers on a big tree
image.alt.vi: Hoa đỏ trên cây to

#### option q4_lotus
correct: true
label.en: lotus
label.vi: hoa sen
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao

#### option q4_sunflower
correct: false
feedback.en: A sunflower is bright yellow.
feedback.vi: Hoa hướng dương màu vàng tươi.
label.en: sunflower
label.vi: hoa hướng dương
image.brief: Dùng lại hình `explore_sunflower`. Từ khoá tìm ảnh (EN): sunflower
image.alt.en: A big yellow sunflower
image.alt.vi: Bông hướng dương vàng to

### q5
id: 79eacef2-5f6f-4ca6-a9a9-c0a1088cb3ee
format: single_choice
version: 1
dok: 2
prompt.en: Where do sunflower seeds grow?
prompt.vi: Hạt hướng dương mọc ở đâu?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of what comes after a flower.
hint.vi: Em nghĩ xem sau bông hoa là gì nhé.
explanation_correct.en: Yes! They grow in the middle of the flower.
explanation_correct.vi: Đúng rồi! Hạt mọc ở giữa bông hoa.
explanation_wrong.en: The answer is the flower. Seeds grow in its middle.
explanation_wrong.vi: Đáp án là bông hoa. Hạt mọc ở giữa bông.
> DOK 2: ôn trộn (bài `review`): nối bài 4 (hoa thành quả, trong quả có hạt) và bài 1 (hạt) để suy ra chỗ hạt hướng dương. Ô Shapes cố ý không nói điều này. Lựa chọn là ảnh ba bộ phận (hoa, rễ, lá); nhãn gọi chỗ.
> [CẦN KIỂM] Hạt hướng dương mọc ở giữa bông hoa (đầu hoa).

#### option q5_roots
correct: false
feedback.en: Roots hold the plant in the soil.
feedback.vi: Rễ giữ cây trong đất.
label.en: in the roots
label.vi: ở rễ
image.brief: Dùng lại hình `explore_roots` ở bài `cay-quanh-em/cay-to-re-than-canh-la`. Từ khoá tìm ảnh (EN): tree roots exposed
image.alt.en: Big roots at the bottom of a tree
image.alt.vi: Rễ to ở gốc cây

#### option q5_leaves
correct: false
feedback.en: Leaves grow on the stems and branches.
feedback.vi: Lá mọc trên thân và cành.
label.en: in the leaves
label.vi: ở lá
image.brief: Dùng lại hình `explore_alive` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa green leaves branch
image.alt.en: Green leaves on a branch
image.alt.vi: Lá xanh trên cành cây

#### option q5_flower
correct: true
label.en: in the flower
label.vi: ở bông hoa
image.brief: Dùng lại hình `explore_sunflower`. Từ khoá tìm ảnh (EN): sunflower
image.alt.en: A big, round yellow flower
image.alt.vi: Bông hoa vàng to, tròn
> `alt` riêng ở chỗ này (`alt` gốc có chữ "sunflower" của câu hỏi).

### q6
id: b7bb65a8-e71d-4035-898b-e7bcf02b9757
format: true_false
version: 1
dok: 2
misconception: all_plants_have_flowers
prompt.en: Every plant has flowers.
prompt.vi: Cây nào cũng có hoa.
image.brief: Dùng lại hình `explore_plants` ở bài `sinh-vat-song-o-dau/vat-song-hay-khong-song`. Từ khoá tìm ảnh (EN): young vegetable seedlings soil row
image.alt.en: Young plants in the soil
image.alt.vi: Cây non mọc trên đất
answer: false
hint.en: Think of a damp, shady forest floor.
hint.vi: Em nghĩ tới nền rừng râm, ẩm nhé.
explanation_correct.en: Some plants, like ferns, have no flowers.
explanation_correct.vi: Có cây không có hoa, như dương xỉ.
explanation_wrong.en: This is false. Ferns and moss have none.
explanation_wrong.vi: Câu này sai. Dương xỉ, rêu không có hoa.
feedback_true.en: Moss is a plant with no flowers.
feedback_true.vi: Rêu là cây không có hoa.
> Câu misconception (`all_plants_have_flowers`), DOK 2: bé vừa xem nhiều hoa đẹp dễ nghĩ cây nào cũng có hoa và chạm Đúng. Bé áp ô No flowers và kệ Chơi để bác câu nói. Câu chỉ kiểm một việc.
> Hình là hàng cây non nói chung (vật được nói tới: "cây"), không phải luống hoa (đẩy bé về phía misconception) hay dương xỉ (bằng chứng của đáp án). Cây non chưa có hoa không phải là lý do: `explanation_correct` nói đúng lý do (dương xỉ). `explanation_correct` là đúng câu `correction` ở `_topic.md`.

## Từ vựng

### petal
id: 60b0df11-16f1-45a6-8d42-33ff7633fb79
tier: core
term.en: petal
term.vi: cánh hoa
example.en: A lotus has big, soft petals.
example.vi: Hoa sen có cánh to và mềm.
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao

### colour
id: f6fef8b1-5dca-4e1d-be6a-dc14b83f37db
tier: core
term.en: colour
term.vi: màu sắc
example.en: Flowers come in many colours.
example.vi: Hoa có nhiều màu sắc.
image.brief: Dùng lại hình `explore_bougainvillea`. Từ khoá tìm ảnh (EN): Bougainvillea
image.alt.en: Pink bougainvillea over a gate
image.alt.vi: Giàn hoa giấy hồng trên cổng
> Chính tả Anh "colour" (như tên bài).

### fern
id: 35248c5c-6298-40b6-a512-544a8a822319
tier: extra
term.en: fern
term.vi: dương xỉ
example.en: A fern has no flowers.
example.vi: Cây dương xỉ không có hoa.
image.brief: Dùng lại hình `explore_no_flowers`. Từ khoá tìm ảnh (EN): fern plant close up forest floor
image.alt.en: A fern
image.alt.vi: Cây dương xỉ

### bloom
id: c979c0f2-316e-45e9-ab3c-60b9c9a807ff
tier: extra
term.en: bloom
term.vi: nở hoa
example.en: Sunflowers bloom in the sunshine.
example.vi: Hoa hướng dương nở dưới nắng.
image.brief: Dùng lại hình `explore_sunflower`. Từ khoá tìm ảnh (EN): sunflower
image.alt.en: A big yellow sunflower
image.alt.vi: Bông hướng dương vàng to
> Thêm cho đủ bốn từ (ticket gợi ý ba). "Bloom" đã xuất hiện trong câu ở *Thời tiết và các mùa* nhưng chưa là từ vựng.

## Thưởng

### fern_card
id: 598eb65f-abb2-44ab-8ef5-1cf871832882
set: plants
rarity: rare
name.en: Fern
name.vi: Dương xỉ
tag.en: A plant with no flowers
tag.vi: Cây không có hoa
fact.en: Ferns lived before the dinosaurs.
fact.vi: Dương xỉ đã có từ trước thời khủng long.
image.brief: Dùng lại hình `explore_no_flowers`. Từ khoá tìm ảnh (EN): fern plant close up forest floor
image.alt.en: A fern
image.alt.vi: Cây dương xỉ
> Thẻ hiếm khép chủ đề bằng chính ý sửa misconception của bài. Nối Discoverer *Khủng long* (dương xỉ là cây thời khủng long).
> [CẦN KIỂM] Dương xỉ đã có trên Trái Đất từ trước khi có khủng long.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Không người hái hoa, không trẻ cầm hoa; không biển, không chữ trên cổng, tường.
- **Ảnh mới, hình gốc của cả chủ đề (giữ đúng key, `alt`, truy vấn đầu ở `_topic.md`):** bông hướng dương (`explore_sunflower`), giàn hoa giấy hồng (`explore_bougainvillea`).
- **Ảnh dùng lại:** bài 3 `explore_roots` (w2, q5); bài 6 `explore_banana_leaf`, `explore_flame_leaf` (w1, `alt` riêng); *Sinh vật sống ở đâu?* bài 1 `explore_plants` (q6), bài 3 `explore_alive` (q5), bài 6 `explore_wall` (món Chơi), bài 7 `tray_flower_bed` (q3); *Thời tiết và các mùa* bài 2 `explore_summer` (món Chơi, q4), bài 5 `explore_tet` (món Chơi); *Gọi tên và nhóm động vật* bài 1 `w1` (hàng rào tre), `w1_lotus` (w3, ô Petals, món Chơi, q1, q4, từ `petal`; từ `petal` trỏ thẳng về `w1_lotus`, không qua `explore_petals`, sửa 18/11 tester C1); Discoverer *Khủng long* bài 1 `tray_fern` (chép mục: ô No flowers, món Chơi, từ `fern`, thẻ).
- **`alt` riêng:** w1 `w1_flame` ("Feathery green leaves" · "Lá xanh như lông chim"); q1 `q1_sunflower` ("A big, round sunflower" · "Bông hướng dương to, tròn"); q5 `q5_flower` ("A big, round yellow flower" · "Bông hoa vàng to, tròn").
- **Ảnh khó:** hoa giấy một màu hồng tím (ảnh nhiều màu sẽ nước đôi ở kệ Chơi); hướng dương chụp chính diện thấy rõ cánh và phần giữa (câu q5); loài hoa giấy, hoa mai, hoa phượng khớp trang gốc.
- **Màu:** Học: cánh hoa `cham`, nhiều hình `vang_hoe`, nhiều màu `nau_dat`, không có hoa `gi_dong`. Chơi: màu hồng `cham`, màu vàng `vang_hoe`, màu đỏ `nau_dat`, không có hoa `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (petal, colour). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Sai, w3 Đúng). Quiz `single_choice` (q1, q4, q5; ba lựa chọn), `true_false` (q2 Đúng, q3 Sai, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`all_plants_have_flowers`). Không có `labels` ở câu `true_false`.
- **Màn Chơi, ví dụ để kiểm:** Hoa sen, Hoa hướng dương, Hoa phượng → `balanced`; Hoa giấy, Hoa mai, Hoa phượng → `balanced`; Hoa sen, Hoa giấy, Hoa phượng → `missing.tray_yellow`; Hoa sen, Hoa mai, Dương xỉ → `has_limited`.
- **Khởi động trỏ:** w1 → `cay-quanh-em/la-cay-nhieu-hinh-nhieu-co` (bài 6 phải có id trước), w2 → `cay-quanh-em/cay-to-re-than-canh-la`, w3 → `thoi-tiet-va-cac-mua/mua-xuan-va-mua-he` (đã có id).
- **Hình chép từ Discoverer:** ô `explore_no_flowers` dùng `tray_fern` của `khung-long/trai-dat-rat-lau-ve-truoc`; file chọn ảnh chép mục.
- **Từ EN có thể ngoài Starters/Movers:** petal, colour, bloom, fern, moss, sunflower, bougainvillea, peach blossoms, yellow apricot blossoms, thorns, damp, shady.
