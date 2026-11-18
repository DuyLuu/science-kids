---
id: c6866516-856e-4527-8da6-b140be5cd08a
topic: thoi-tiet-va-cac-mua
slug: mua-xuan-va-mua-he
order: 2
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Spring and summer
vi: Mùa xuân và mùa hè
> Giữ đúng tên ở `content/syllabus.json` (key `new-weather-and-seasons`, bài số hai).

## Mục tiêu
en: I can name signs of spring and summer.
vi: Em kể được dấu hiệu của mùa xuân và mùa hè.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 17/11/2026. Ticket SK-050. Mọi dòng `id:` để trống; chạy `ids` sau `_topic.md` và bài 1.
> Chủ đề mới, không bám Oak (`_topic.md` mục Nguồn). Ý gộp từ bốn lesson Year 1 cũ (thời tiết mùa xuân, mùa hè; dấu hiệu mùa xuân, mùa hè; độ dài ngày mùa hè): chỉ lấy ý, viết lại bằng dấu hiệu Việt Nam (hoa đào, Tết, lộc non, hoa phượng, con ve).
> Bài chỉ nói miền Bắc ("in the north" · "ở miền Bắc", "like Hanoi" · "như Hà Nội"). Không tên tháng, không âm lịch, không vì sao có mùa, không vì sao ngày dài.
> Sửa `flowers_only_in_spring` ở ô Học "Summer" (câu chính hoa phượng, ví dụ hoa sen), kệ Chơi (nhóm Hoa có cả hoa đào, hoa phượng, hoa sen) và câu q6 (gắn key).

## Ý chính
1.en: In the north, a year has four seasons.
1.vi: Ở miền Bắc, một năm có bốn mùa.
2.en: Spring gets warmer. Peach trees bloom at Tet.
2.vi: Mùa xuân trời ấm dần. Hoa đào nở dịp Tết.
3.en: Summer is hot. Summer days are long.
3.vi: Mùa hè trời nóng. Ngày mùa hè dài.
> Từ khung chung (bốn mùa) tới dấu hiệu của từng mùa; ý chính ba mang ý độ dài ngày, chỉ là dấu hiệu ("trời tối muộn"), không dạy vì sao.
> [CẦN KIỂM] Miền Bắc có bốn mùa (cách chia theo sách giáo khoa); mùa xuân trời ấm dần, có mưa phùn; hoa đào nở dịp Tết ở miền Bắc; ở Hà Nội mùa hè trời tối muộn hơn rõ so với mùa đông.

## Khởi động

> Hai câu (nếp SK-045): w1 ôn bài ngay trước (bài 1, ô "Cloudy"); w2 ôn mốc dài *Sinh vật sống ở đâu?* bài năm (hoa sen sống ở ao), nối với lựa chọn hoa sen ở q1 và nhóm Hoa ở kệ Chơi.

### w1
id: be3bb5f9-4573-4606-a7af-0ba2328ba0db
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: thoi-tiet-va-cac-mua/thoi-tiet-hom-nay
prompt.en: Clouds can hide the Sun.
prompt.vi: Mây có thể che Mặt Trời.
image.brief: Dùng lại hình `q3_cloudy` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): cloudy sky grey white clouds countryside
image.alt.en: White and grey clouds over the fields
image.alt.vi: Mây trắng và mây xám trên cánh đồng
answer: true
hint.en: Think of a grey, cloudy morning.
hint.vi: Em nghĩ tới một buổi sáng trời nhiều mây, xám xịt nhé.
explanation_correct.en: Yes! The Sun is still behind them.
explanation_correct.vi: Đúng rồi! Mặt Trời vẫn ở sau những đám mây.
explanation_wrong.en: This is true. Clouds can hide the Sun.
explanation_wrong.vi: Câu này đúng. Mây có thể che Mặt Trời.
feedback_false.en: Thick clouds make the day less bright.
feedback_false.vi: Mây dày làm trời bớt sáng.
> Ôn câu chính ô "Cloudy" và ý sửa `sun_gone_when_cloudy` của bài 1. Hình là mây trắng xen mây xám không thấy Mặt Trời (`q3_cloudy`), không phải ảnh tia nắng `explore_cloudy`, để ảnh không làm bằng chứng thay cho việc nhớ.

### w2
id: ae9b3078-bb2d-4e37-b713-0eba802444f6
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/noi-song-cua-cay
prompt.en: Where does a lotus grow?
prompt.vi: Hoa sen mọc ở đâu?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of big lotus leaves on water.
hint.vi: Em nghĩ tới lá sen to nổi trên mặt nước nhé.
explanation_correct.en: Yes! Its roots grow in the mud.
explanation_correct.vi: Đúng rồi! Rễ sen mọc trong bùn dưới ao.
explanation_wrong.en: The answer is the pond. A lotus needs water.
explanation_wrong.vi: Đáp án là cái ao. Cây sen cần nước.
> Câu mới, không chép #2 bài 5 q1 ("Which plant grows in a pond?"). Hai cảnh khác hẳn bằng mắt (mặt nước xanh, đồi cát vàng).
> [CẦN KIỂM] Thân, rễ sen nằm trong bùn đáy ao.

#### option w2_dunes
correct: false
feedback.en: Sand hills are hot and very dry.
feedback.vi: Đồi cát nóng và rất khô.
label.en: sand hills
label.vi: đồi cát
image.brief: Dùng lại hình `q4_dunes` ở bài `sinh-vat-song-o-dau/noi-song-cua-con-vat`. Từ khoá tìm ảnh (EN): sand dunes Mui Ne Vietnam
image.alt.en: Sand hills on a sunny day
image.alt.vi: Đồi cát dưới nắng

#### option w2_pond
correct: true
label.en: pond
label.vi: cái ao
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê

## Học

> Bốn ô: khung bốn mùa của miền Bắc, rồi ba dấu hiệu nhìn thấy được (hoa đào, lộc non của mùa xuân; hoa phượng của mùa hè).
> Ô "Summer" mang ý sửa misconception: câu chính hoa phượng, ví dụ ba hoa sen (hai loài hoa nở mùa hè). Ví dụ ba ô "Summer" đổi gợi ý "short, heavy showers" · "có những cơn mưa rào" thành hoa sen (ví dụ không bắt buộc, người viết được tự soạn): hoa sen là món của nhóm Hoa ở kệ Chơi, lựa chọn ở q1 và `feedback_true` ở q6, nên cần dạy trước "sen nở mùa hè".
> Ô "New leaves" nói "many trees", không "all trees" (cây rụng lá, cây thường xanh để dành *Cây quanh em*).

### explore
id: 29bb29aa-0819-4efe-ac3a-9c78d49ba505
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_seasons
label.en: Four seasons
label.vi: Bốn mùa
color: cham
sentence.en: The north has spring, summer, autumn and winter.
sentence.vi: Miền Bắc có mùa xuân, mùa hè, mùa thu, mùa đông.
image.brief: [sơ đồ ghép ảnh] Lưới hai nhân hai, bốn ô vuông bằng nhau, khe mảnh màu giấy điệp giữa các ô, đọc trái → phải, trên → dưới ra xuân, hè, thu, đông: cành hoa đào `explore_spring` (trên trái), cây phượng `explore_summer` (trên phải), lá vàng trên cành `q4_yellow` ở bài `thoi-tiet-va-cac-mua/mua-thu-va-mua-dong` (dưới trái), áo phao `explore_cold` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay` (dưới phải); không có chữ, không có số, không có mũi tên, không có tuyết.
image.alt.en: Four pictures from one year
image.alt.vi: Bốn hình trong một năm
examples.1.en: like Hanoi
examples.1.vi: như Hà Nội
examples.2.en: each season looks different
examples.2.vi: mỗi mùa một vẻ
examples.3.en: spring comes after winter
examples.3.vi: hết mùa đông là đến mùa xuân
> Hình gốc của cả chủ đề (từ `season`; bài 4 q6, bài 5 từ `year`, bài 6 dùng lại). Hình ghép: designer ghi mục `composed` đủ ghi công bốn phần.
> Ô lá vàng dùng ảnh lá vàng mới của chủ đề (gốc ở bài 3 `q4_yellow`, không tuyết), không dùng `q4_yellow` của *Sinh vật sống ở đâu?* (phiên chính 18/11).
> Thứ tự ô đổi 18/11 (ios-dev ý 3, tester g2): bé năm tới bảy tuổi đọc theo hàng, nên hai ô dưới là lá vàng rồi áo phao, khớp thứ tự câu chính "spring, summer, autumn and winter".

#### group explore_spring
label.en: Spring
label.vi: Mùa xuân
color: vang_hoe
sentence.en: Peach trees bloom in spring, at Tet.
sentence.vi: Hoa đào nở vào mùa xuân, dịp Tết.
image.brief: [ảnh] Một cành hoa đào hồng đang nở, chụp gần, thấy rõ cánh hoa hồng và vài nụ, nền trời hoặc tường mờ; không có cành mai vàng, không có hoa giả, không có câu đối, bao lì xì hay đồ trang trí có chữ, không có người, không có chữ. Ưu tiên ảnh hoa đào chụp ở miền Bắc Việt Nam nếu có ảnh hợp lệ. Từ khoá tìm ảnh (EN): Prunus persica blossom; peach blossom branch; hoa dao Tet
image.alt.en: Pink blossoms on a branch
image.alt.vi: Cành hoa màu hồng
examples.1.en: days get warmer
examples.1.vi: trời ấm dần
examples.2.en: light drizzle falls
examples.2.vi: mưa phùn lất phất
examples.3.en: families wrap banh chung
examples.3.vi: nhà nhà gói bánh chưng
> Hình gốc của cả chủ đề (kệ Chơi, q1, từ `spring`, hình ghép `explore_seasons`; bài 3, 5, 6 dùng lại). `alt` không có "Tet", "spring", vì hình là đáp án q1 ("Which flower blooms at Tet?").
> Mưa phùn chỉ nói, không có ảnh. Ví dụ ba chuẩn bị cho món bánh chưng ở kệ Chơi.
> [CẦN KIỂM] Mưa phùn cuối đông, đầu xuân ở miền Bắc; hoa đào nở dịp Tết ở miền Bắc.

#### group explore_buds
label.en: New leaves
label.vi: Lộc non
color: gi_dong
sentence.en: Many trees grow new leaves in spring.
sentence.vi: Nhiều cây ra lộc non vào mùa xuân.
image.brief: [ảnh] Những chiếc lá non nhỏ màu xanh nhạt vừa nhú trên một cành cây, chụp gần, nền mờ; thấy rõ lá còn nhỏ, mềm, sáng màu; không có hoa, không có lá vàng hay lá khô, không có người, không có chữ. Từ khoá tìm ảnh (EN): leaf buds spring; new leaves twig; young leaves branch
image.alt.en: Tiny light-green leaves on a twig
image.alt.vi: Những chiếc lá nhỏ màu xanh nhạt trên cành
examples.1.en: small, soft and light green
examples.1.vi: nhỏ, mềm và xanh non
examples.2.en: the tree is growing
examples.2.vi: cây đang lớn
examples.3.en: birds sing in the branches
examples.3.vi: chim hót trên cành
> Hình gốc của cả chủ đề (q3, q5; bài 3, 6 dùng lại). `alt` không có chữ "new" của câu q3.
> [CẦN KIỂM] Nhiều cây ở miền Bắc ra lộc non vào mùa xuân.

#### group explore_summer
label.en: Summer
label.vi: Mùa hè
color: nau_dat
sentence.en: Flame trees bloom red in summer.
sentence.vi: Hoa phượng nở đỏ vào mùa hè.
image.brief: [ảnh] Cây phượng đang nở hoa đỏ rực, thấy tán cây rộng và nhiều chùm hoa đỏ, trời trắng mây phía sau; ảnh ngang có khoảng trống (dùng cả khung vuông ở Học, kệ Chơi, thẻ thưởng và khung 4:3 của câu q6); không có người nhìn rõ mặt, không có biển hiệu, không có chữ. Không có ảnh hợp lệ chụp ở Việt Nam thấy rõ tán; `alt` không nêu tên nơi. Từ khoá tìm ảnh (EN): Delonix regia; flame tree flowers; royal poinciana tree
image.alt.en: Red flowers on a big tree
image.alt.vi: Hoa đỏ trên cây to
examples.1.en: it gets dark late
examples.1.vi: trời tối muộn
examples.2.en: cicadas sing loudly
examples.2.vi: ve kêu râm ran
examples.3.en: lotus flowers bloom in ponds
examples.3.vi: hoa sen nở trong ao
> Hình gốc của cả chủ đề (kệ Chơi, q1, q5, q6, từ `summer`, thẻ, hình ghép `explore_seasons`; bài 3, 5, 6 dùng lại). `alt` không có chữ "summer".
> Ví dụ một là ví dụ bắt buộc (ý độ dài ngày, ý chính ba). Ví dụ hai là chữ cần dạy trước cho q2. Ví dụ ba thay gợi ý mưa rào (xem ghi chú đầu mục Học).
> [CẦN KIỂM] Hoa phượng nở mùa hè ở cả hai miền; ve kêu mùa hè; hoa sen nở mùa hè.

### new_words
id: e8b96122-46cf-44dd-bbb9-43e45e752274
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: season, spring, summer

## Chơi

> Bé chọn ba dấu hiệu của mùa xuân và mùa hè: một loài hoa (hoa đào, hoa phượng hoặc hoa sen), một con vật (con ve), một món ngày Tết (bánh chưng). Đạt khi đủ ba nhóm và không chọn đồ ngày lạnh.
> Nhóm Hoa có hoa của cả hai mùa (sửa `flowers_only_in_spring`). Món bẫy là áo khoác, khăn len bé đã gặp ở bài 1: cũng là đồ của một mùa, nhưng là mùa lạnh.
> Kệ bảy món, toàn ảnh chụp.

### tray
id: 9bf02cf2-ef53-47b8-8117-37b9312ee7fa
type: build_tray
version: 1
prompt.en: Pick three signs of spring and summer
prompt.vi: Chọn ba dấu hiệu của mùa xuân và mùa hè
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find a flower, an animal and Tet food.
messages.start.vi: Em tìm một loài hoa, một con vật và một món ngày Tết nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! These are signs of spring and summer.
messages.balanced.vi: Tuyệt! Đây đều là dấu hiệu của mùa xuân và mùa hè.
messages.has_limited.en: That one is for cold days.
messages.has_limited.vi: Món này dùng khi trời lạnh.
messages.missing.tray_flowers.en: You still need a flower.
messages.missing.tray_flowers.vi: Em còn thiếu một loài hoa.
messages.missing.tray_animal.en: You still need an animal.
messages.missing.tray_animal.vi: Em còn thiếu một con vật.
messages.missing.tray_tet_food.en: You still need a Tet food.
messages.missing.tray_tet_food.vi: Em còn thiếu một món ngày Tết.
> Lời nhắn `has_limited` đúng với cả hai món bẫy (áo khoác, khăn len).

#### group tray_flowers
label.en: Flowers
label.vi: Hoa
color: gi_dong
role: required

#### group tray_animal
label.en: Animal
label.vi: Con vật
color: nau_dat
role: required

#### group tray_tet_food
label.en: Tet food
label.vi: Món ngày Tết
color: vang_hoe
role: required

#### group tray_cold
label.en: For cold days
label.vi: Dùng khi trời lạnh
color: do_son
role: limit

#### item tray_flame
label.en: Flame tree flowers
label.vi: Hoa phượng
group: tray_flowers
image.brief: Dùng lại hình `explore_summer`. Từ khoá tìm ảnh (EN): Delonix regia
image.alt.en: Red flowers on a big tree
image.alt.vi: Hoa đỏ trên cây to

#### item tray_coat
label.en: Warm coat
label.vi: Áo khoác ấm
group: tray_cold
image.brief: Dùng lại hình `explore_cold` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): winter coat hanger
image.alt.en: A warm coat on a hanger
image.alt.vi: Chiếc áo khoác ấm trên móc

#### item tray_cicada
label.en: Cicada
label.vi: Con ve
group: tray_animal
image.brief: [ảnh] Một con ve sầu trưởng thành bám trên thân cây, chụp gần, nhìn ngang hoặc từ trên xuống, thấy rõ đôi cánh trong và thân; không phải xác lột ve, không có tay người cầm, không có người, không có chữ. Từ khoá tìm ảnh (EN): cicada tree bark; cicada on trunk
image.alt.en: A cicada on tree bark
image.alt.vi: Con ve trên thân cây
> Hình gốc của cả chủ đề (q2, từ `cicada`; bài 3 dùng lại).

#### item tray_peach
label.en: Peach blossom
label.vi: Hoa đào
group: tray_flowers
image.brief: Dùng lại hình `explore_spring`. Từ khoá tìm ảnh (EN): Prunus persica blossom
image.alt.en: Pink blossoms on a branch
image.alt.vi: Cành hoa màu hồng

#### item tray_banh_chung
label.en: Banh chung
label.vi: Bánh chưng
group: tray_tet_food
image.brief: [ảnh] Hai chiếc bánh chưng vuông gói lá dong xanh, buộc lạt tre, chồng lên nhau, chụp chếch, thấy cả hai chiếc bánh; không bao bì, không giấy bóng kính, không nhãn hiệu, không câu đối, không có chữ, không có người. Từ khoá tìm ảnh (EN): banh chung; Vietnamese square rice cake; banh chung leaves
image.alt.en: Two square cakes wrapped in leaves
image.alt.vi: Hai chiếc bánh vuông gói lá
> Hình gốc của cả chủ đề (bài 5 dùng lại ở kệ Chơi, q1, q4, q5, thẻ; bài 6 dùng ở w1).

#### item tray_scarf
label.en: Scarf
label.vi: Khăn len
group: tray_cold
image.brief: Dùng lại hình `tray_scarf` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): knitted wool scarf
image.alt.en: A knitted scarf
image.alt.vi: Chiếc khăn len

#### item tray_lotus
label.en: Lotus
label.vi: Hoa sen
group: tray_flowers
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1, q3, q4, q5; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai). Không `order_sequence` (bài 1, 2 theo Khung chung).
> Hình câu `single_choice` là hàng rào tre trung tính (app Explorer ẩn hình câu hỏi khi mọi lựa chọn có hình). Câu nào cũng tự đủ nghĩa khi chỉ nghe.
> Không hoa đào cạnh hoa mai trong câu nào. Không câu nào hỏi tên tháng.

### q1
id: b707a717-dc96-4fa0-b7bf-a670d8231d5e
format: single_choice
version: 1
dok: 1
prompt.en: Which flower blooms at Tet?
prompt.vi: Hoa nào nở dịp Tết?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of flowers as spring begins.
hint.vi: Em nghĩ xem hoa nào nở khi mùa xuân vừa tới nhé.
explanation_correct.en: Yes! Peach blossoms tell us spring is here.
explanation_correct.vi: Đúng rồi! Hoa đào nở báo mùa xuân đã về.
explanation_wrong.en: The answer is peach blossom. It blooms at Tet.
explanation_wrong.vi: Đáp án là hoa đào. Hoa đào nở dịp Tết.
> Nhớ lại câu chính ô "Spring". Gợi ý thêm một manh mối ngoài chữ "Tet" của câu hỏi (mùa xuân vừa tới; hai hoa sai đều là hoa mùa hè), không nói "trời ấm" vì Tết ở miền Bắc thường còn rét (sửa 17/11 theo rà chữ g1). Ba loài hoa khác hẳn nhau bằng mắt (cành hoa hồng, cây hoa đỏ, bông sen trên ao); hai lựa chọn sai là hoa mùa hè.

#### option q1_flame
correct: false
feedback.en: Flame trees bloom in hot summer.
feedback.vi: Hoa phượng nở vào mùa hè nóng nực.
label.en: flame tree flowers
label.vi: hoa phượng
image.brief: Dùng lại hình `explore_summer`. Từ khoá tìm ảnh (EN): Delonix regia
image.alt.en: Red flowers on a big tree
image.alt.vi: Hoa đỏ trên cây to

#### option q1_peach
correct: true
label.en: peach blossom
label.vi: hoa đào
image.brief: Dùng lại hình `explore_spring`. Từ khoá tìm ảnh (EN): Prunus persica blossom
image.alt.en: Pink blossoms on a branch
image.alt.vi: Cành hoa màu hồng

#### option q1_lotus
correct: false
feedback.en: Lotus flowers bloom in summer ponds.
feedback.vi: Hoa sen nở trong ao vào mùa hè.
label.en: lotus
label.vi: hoa sen
image.brief: Dùng lại hình `tray_lotus`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao

### q2
id: c0198258-0f59-4b38-93e4-786779e68d7f
format: true_false
version: 1
dok: 1
prompt.en: Cicadas sing loudly in summer.
prompt.vi: Mùa hè, ve kêu râm ran.
image.brief: Dùng lại hình `tray_cicada`. Từ khoá tìm ảnh (EN): cicada tree bark
image.alt.en: A cicada on tree bark
image.alt.vi: Con ve trên thân cây
answer: true
hint.en: Think of the sounds of hot days.
hint.vi: Em nghĩ tới âm thanh của những ngày nắng nóng nhé.
explanation_correct.en: Yes! You can hear them in the trees.
explanation_correct.vi: Đúng rồi! Em nghe tiếng ve trên những hàng cây.
explanation_wrong.en: This is true. Cicadas sing in summer.
explanation_wrong.vi: Câu này đúng. Mùa hè, ve kêu râm ran.
feedback_false.en: Cicadas buzz in the trees on hot days.
feedback_false.vi: Ve kêu trên cây vào những ngày nóng.
> DOK 1: nhớ lại ví dụ hai ô "Summer" (chữ cần dạy trước). Con ve chỉ là dấu hiệu mùa, không phân loại.
> [CẦN KIỂM] Ve sầu kêu nhiều vào mùa hè ở miền Bắc (ve đực kêu).

### q3
id: 89ab1824-a524-408b-bb2b-dddcdf99e739
format: single_choice
version: 1
dok: 1
prompt.en: Which picture shows new leaves?
prompt.vi: Hình nào là lộc non?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for a branch that is growing.
hint.vi: Em tìm cành cây đang lớn nhé.
explanation_correct.en: Yes! New leaves are small and light green.
explanation_correct.vi: Đúng rồi! Lộc non nhỏ và xanh nhạt.
explanation_wrong.en: The answer is the new leaves. They are light green.
explanation_wrong.vi: Đáp án là lộc non. Lộc non màu xanh nhạt.
> Ba ảnh lá khác nhau rõ bằng màu (xanh nhạt, vàng, nâu khô). Lá vàng, lá khô bé đã gặp ở *Sinh vật sống ở đâu?* bài ba (lá vàng ở đây là ảnh mới của chủ đề, gốc ở bài 3 `q4_yellow`); lộc non là ảnh bé vừa xem ở Học. `alt` của đáp án không có chữ "new".

#### option q3_yellow
correct: false
feedback.en: This leaf is old and yellow.
feedback.vi: Chiếc lá này đã già và ngả vàng.
label.en: yellow leaf
label.vi: lá vàng
image.brief: Dùng lại hình `q4_yellow` ở bài `thoi-tiet-va-cac-mua/mua-thu-va-mua-dong`. Từ khoá tìm ảnh (EN): autumn leaf on branch
image.alt.en: A yellow leaf on a branch
image.alt.vi: Chiếc lá vàng trên cành

#### option q3_dry
correct: false
feedback.en: This leaf is dry and has fallen.
feedback.vi: Chiếc lá này đã khô và rụng xuống.
label.en: dry leaf
label.vi: lá khô
image.brief: Dùng lại hình `q4_dry` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): dry fallen leaf on ground top view
image.alt.en: A dry fallen leaf
image.alt.vi: Chiếc lá khô vừa rụng

#### option q3_buds
correct: true
label.en: new leaves
label.vi: lộc non
image.brief: Dùng lại hình `explore_buds`. Từ khoá tìm ảnh (EN): leaf buds spring
image.alt.en: Tiny light-green buds on a twig
image.alt.vi: Những chồi nhỏ xanh nhạt trên cành
> `alt` riêng ở chỗ này (khai ở bảng `alt` riêng của `_topic.md`): bỏ chữ "leaves" của câu hỏi. Ảnh, key, `brief` giữ nguyên; các chỗ khác dùng `alt` gốc (sửa 17/11 theo rà chữ g5).

### q4
id: 7f80fc17-7e24-4929-ad51-b294e19f1047
format: single_choice
version: 1
dok: 2
prompt.en: What do you need on summer days?
prompt.vi: Ngày hè, em cần gì?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of hot summer sunshine.
hint.vi: Em nghĩ tới nắng hè gay gắt nhé.
explanation_correct.en: Yes! A hat gives you shade.
explanation_correct.vi: Đúng rồi! Nón lá che nắng cho em.
explanation_wrong.en: The answer is the conical hat. It gives shade.
explanation_wrong.vi: Đáp án là nón lá. Nón lá che nắng.
> DOK 2: áp ý chính ba ("Summer is hot.") và ví dụ hai ô "Sunny" bài 1 ("wear a hat in the sun") vào việc chọn đồ. Hai lựa chọn sai là đồ ngày lạnh bé đã gặp ở bài 1 và kệ Chơi bài này.

#### option q4_scarf
correct: false
feedback.en: A scarf keeps you warm in the cold.
feedback.vi: Khăn len giữ ấm cho em khi trời lạnh.
label.en: scarf
label.vi: khăn len
image.brief: Dùng lại hình `tray_scarf` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): knitted wool scarf
image.alt.en: A knitted scarf
image.alt.vi: Chiếc khăn len

#### option q4_coat
correct: false
feedback.en: A warm coat is for cold days.
feedback.vi: Áo khoác ấm dùng cho ngày lạnh.
label.en: warm coat
label.vi: áo khoác ấm
image.brief: Dùng lại hình `explore_cold` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): winter coat hanger
image.alt.en: A warm coat on a hanger
image.alt.vi: Chiếc áo khoác ấm trên móc

#### option q4_hat
correct: true
label.en: conical hat
label.vi: nón lá
image.brief: Dùng lại hình `w1_hat` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): Vietnamese conical hat non la
image.alt.en: A conical hat
image.alt.vi: Chiếc nón lá

### q5
id: a77f5b34-5e5a-4ab4-a04d-902106f03b18
format: single_choice
version: 1
dok: 2
prompt.en: It is Tet. Which season is it?
prompt.vi: Đang Tết. Là mùa nào?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of what trees do at Tet.
hint.vi: Em nghĩ xem dịp Tết cây cối ra sao nhé.
explanation_correct.en: Yes! Tet comes in spring, with new leaves.
explanation_correct.vi: Đúng rồi! Tết đến vào mùa xuân, cây ra lộc non.
explanation_wrong.en: The answer is spring. Peach trees bloom then.
explanation_wrong.vi: Đáp án là mùa xuân. Lúc ấy hoa đào nở.
> DOK 2: nối một dịp (Tết) với mùa qua dấu hiệu (câu chính ô "Spring"). Lựa chọn là một mùa, mỗi thẻ là ảnh một dấu hiệu cụ thể (lộc non, hoa phượng, áo khoác ấm), `label` gọi tên mùa. Dấu hiệu trên ảnh đáp án (lộc non) không trùng chữ "Tet" của câu hỏi.
> Gợi ý trỏ tới bằng chứng (cây ra lộc), không trỏ tới ô "Spring" (câu chính của ô ấy là phán quyết).
> [CẦN KIỂM] Tết được coi là mùa xuân dù trời Hà Nội dịp Tết thường còn lạnh (Còn mở số hai ở `_topic.md`). Bé có thể nghĩ "Tết còn rét, mặc áo khoác": `feedback` của thẻ mùa đông công nhận điều bé thấy (Tết có thể còn rét) rồi nói mùa đông đã qua, không gọi tên mùa xuân (sửa 17/11 theo rà chữ g2). Người chuyên môn xác nhận cách nói "Tết thì mùa đông đã qua" theo cách chia bốn mùa của SGK.

#### option q5_summer
correct: false
feedback.en: Flame trees bloom in summer.
feedback.vi: Hoa phượng nở vào mùa hè.
label.en: summer
label.vi: mùa hè
image.brief: Dùng lại hình `explore_summer`. Từ khoá tìm ảnh (EN): Delonix regia
image.alt.en: Red flowers on a big tree
image.alt.vi: Hoa đỏ trên cây to

#### option q5_spring
correct: true
label.en: spring
label.vi: mùa xuân
image.brief: Dùng lại hình `explore_buds`. Từ khoá tìm ảnh (EN): leaf buds spring
image.alt.en: Tiny light-green leaves on a twig
image.alt.vi: Những chiếc lá nhỏ màu xanh nhạt trên cành

#### option q5_winter
correct: false
feedback.en: Tet can be cold, but winter is over.
feedback.vi: Tết có thể còn rét, nhưng mùa đông đã qua.
label.en: winter
label.vi: mùa đông
image.brief: Dùng lại hình `explore_cold` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): winter coat hanger
image.alt.en: A warm coat on a hanger
image.alt.vi: Chiếc áo khoác ấm trên móc

### q6
id: f98ec00a-4338-4268-bf83-51e23972aa58
format: true_false
version: 1
dok: 2
misconception: flowers_only_in_spring
prompt.en: Flowers bloom only in spring.
prompt.vi: Hoa chỉ nở vào mùa xuân.
image.brief: Dùng lại hình `explore_summer`. Từ khoá tìm ảnh (EN): Delonix regia
image.alt.en: Red flowers on a big tree
image.alt.vi: Hoa đỏ trên cây to
answer: false
hint.en: Think of flowers on hot days.
hint.vi: Em nghĩ tới những bông hoa trong ngày nắng nóng nhé.
explanation_correct.en: Flame tree flowers bloom in summer.
explanation_correct.vi: Hoa phượng nở vào mùa hè.
explanation_wrong.en: This is false. Flowers bloom in summer, too.
explanation_wrong.vi: Câu này sai. Mùa hè cũng có hoa nở.
feedback_true.en: Lotus flowers bloom on summer ponds.
feedback_true.vi: Hoa sen nở trên mặt ao mùa hè.
> Câu misconception (`flowers_only_in_spring`), bằng hình, DOK 2: bé còn nghĩ "hoa chỉ nở mùa xuân" sẽ chạm gật đầu. Câu chỉ kiểm một việc: có hoa nở ngoài mùa xuân không. "Only" là câu khẳng định, không chữ phủ định.
> Hình là cây phượng nở hoa (đúng vật được nói tới, phản ví dụ); `explanation_correct` là đúng câu `correction` ở `_topic.md`, đứng một mình cho thẻ "Ý sai → Ý đúng". `feedback_true` đưa phản ví dụ thứ hai (hoa sen, ví dụ ba ô "Summer"), không lặp gợi ý.

## Từ vựng

### season
id: 8af5c8b9-5e32-4275-a68a-9df38c37bbd0
tier: core
term.en: season
term.vi: mùa
example.en: Summer is my favourite season.
example.vi: Mùa hè là mùa em thích nhất.
image.brief: Dùng lại hình `explore_seasons`.
image.alt.en: Four pictures from one year
image.alt.vi: Bốn hình trong một năm
> Hình ghép, không có từ khoá tìm ảnh (mọi phần là hình dùng lại).

### spring
id: c1e182c8-d2c6-4c59-b176-b0c23411a1a5
tier: core
term.en: spring
term.vi: mùa xuân
example.en: In spring, the days get warmer.
example.vi: Mùa xuân, trời ấm dần lên.
image.brief: Dùng lại hình `explore_spring`. Từ khoá tìm ảnh (EN): Prunus persica blossom
image.alt.en: Pink blossoms on a branch
image.alt.vi: Cành hoa màu hồng

### summer
id: fcfc2ba3-2d4c-4faf-8ed8-ae644983712a
tier: core
term.en: summer
term.vi: mùa hè
example.en: Summer days are long and hot.
example.vi: Ngày mùa hè dài và nóng.
image.brief: Dùng lại hình `explore_summer`. Từ khoá tìm ảnh (EN): Delonix regia
image.alt.en: Red flowers on a big tree
image.alt.vi: Hoa đỏ trên cây to

### flower
id: 515e3a3b-0c1e-4d67-9ff5-6d5db17928fe
tier: extra
term.en: flower
term.vi: bông hoa
example.en: A pink lotus flower grows in the pond.
example.vi: Bông hoa sen hồng mọc trong ao.
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao

### cicada
id: ddd2f888-69c0-4dd0-aa74-6e8b0bb0facd
tier: extra
term.en: cicada
term.vi: con ve
example.en: A cicada sings on a tree.
example.vi: Con ve kêu trên cây.
image.brief: Dùng lại hình `tray_cicada`. Từ khoá tìm ảnh (EN): cicada tree bark
image.alt.en: A cicada on tree bark
image.alt.vi: Con ve trên thân cây

## Thưởng

### flame_tree_card
id: d5f42131-a94c-41a2-bf6e-e6136b1aebbf
set: weather
rarity: common
name.en: Flame tree
name.vi: Cây phượng
tag.en: Blooms red in summer
tag.vi: Nở hoa đỏ mùa hè
fact.en: Students call it the school flower.
fact.vi: Học trò gọi hoa phượng là hoa học trò.
image.brief: Dùng lại hình `explore_summer`. Từ khoá tìm ảnh (EN): Delonix regia
image.alt.en: Red flowers on a big tree
image.alt.vi: Hoa đỏ trên cây to
> [CẦN KIỂM] Tên EN "flame tree" (hay "royal poinciana") cho cây phượng (*Delonix regia*); cách gọi "hoa học trò" (hoa nở dịp cuối năm học, nghỉ hè).
> Thẻ mới của bộ `set: weather` (khoá giao diện đã có).

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật, cộng một hình ghép `explore_seasons`. Không hình tự vẽ; không dùng hình tự vẽ của *Thời tiết và thiên tai*.
- **Ảnh mới (năm):** `explore_spring` (cành hoa đào hồng, không cành mai), `explore_buds` (lộc non xanh nhạt, không hoa), `explore_summer` (cây phượng nở đỏ, thấy tán, trời trắng mây), `tray_cicada` (con ve trên thân cây, không phải xác lột), `tray_banh_chung` (hai chiếc bánh chưng gói lá dong chồng nhau, không bao bì). Cả năm ảnh là **hình gốc của cả chủ đề** (bảng Hình dùng chung ở `_topic.md`): giữ đúng key và `alt`.
- **Hình ghép (một):** `explore_seasons`, lưới hai nhân hai từ `explore_spring`, `explore_summer`, `q4_yellow` (bài 3 `mua-thu-va-mua-dong`), `explore_cold` (bài 1), đọc trái → phải, trên → dưới đúng thứ tự xuân, hè, thu, đông (18/11). Không chữ, không số, không mũi tên; ghi mục `composed` đủ ghi công bốn phần.
- **Lá vàng (18/11):** dùng ảnh lá vàng mới của chủ đề, gốc ở bài 3 `q4_yellow` (lá vàng còn trên cành, nền trời xanh, không tuyết), ở q3 và trong hình ghép bốn mùa. Không dùng `q4_yellow` của *Sinh vật sống ở đâu?* (ảnh gốc có tuyết; phiên chính 18/11).
- **Dùng lại:** bài 1: `explore_cold` (kệ Chơi, q4, q5, hình ghép), `tray_scarf` (kệ Chơi, q4), `q3_cloudy` (w1); *Gọi tên và nhóm động vật*: `w1` hàng rào tre (hình câu w2, q1, q3, q4, q5), `w1_hat` nón lá (q4), `w1_lotus` hoa sen (kệ Chơi, q1, từ `flower`), `ca-va-luong-cu` `q1` ao làng (w2); *Sinh vật sống ở đâu?*: `q4_dunes` (w2), `q4_dry` (q3); bài 3: `q4_yellow` (q3, hình ghép).
- **Không lộ đáp án:** `alt` của `explore_spring` không có "Tet", "spring"; của `explore_summer` không có "summer"; của `explore_buds` không có "new". Ba loài hoa ở q1 khác hẳn bằng mắt; không đặt hoa đào cạnh hoa mai ở bất cứ đâu.
- **Ảnh khó:** hoa đào (nhiều ảnh là hoa anh đào Nhật, Hàn; kiểm loài *Prunus persica*, cánh hồng đậm, không lẫn mai vàng); bánh chưng không bao bì, không giấy bóng kính; con ve trưởng thành trên thân cây (nhiều ảnh là xác lột); cây phượng thấy tán, không biển hiệu trường.
- **Màu:** Học: bốn mùa `cham`, mùa xuân `vang_hoe`, lộc non `gi_dong`, mùa hè `nau_dat`. Chơi: hoa `gi_dong`, con vật `nau_dat`, món ngày Tết `vang_hoe`, dùng khi trời lạnh `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (season, spring, summer). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `true_false` (w1 Đúng), `single_choice` (w2, hai lựa chọn). Quiz `single_choice` (q1, q3, q4, q5; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`flowers_only_in_spring`). Không có `labels` ở câu `true_false`.
- **Màn Chơi, ví dụ để kiểm:** Hoa đào, Con ve, Bánh chưng → `balanced`; Hoa sen, Con ve, Bánh chưng → `balanced`; Hoa phượng, Con ve, Khăn len → `has_limited`; Hoa đào, Hoa phượng, Con ve → `missing.tray_tet_food`; Áo khoác ấm, Con ve, Bánh chưng → `has_limited`.
- **Khởi động:** w1 → `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay` (bài 1 cần có id trước: chạy `ids` bài 1 trước bài này); w2 → `sinh-vat-song-o-dau/noi-song-cua-cay` (đã có id).
- **Thẻ thưởng:** `flame_tree_card`, bộ `weather` (đã có khoá giao diện; không thêm khoá).
- **Từ EN có thể ngoài Starters/Movers:** season, spring, peach, bloom, blossom, Tet, banh chung, drizzle, flame tree, cicada, lotus, conical hat, scarf, favourite. Nghe thử giọng EN đọc "Tet", "banh chung", "Hanoi", "cicada", "flame tree"; giọng VI đọc "mưa phùn lất phất", "râm ran".
