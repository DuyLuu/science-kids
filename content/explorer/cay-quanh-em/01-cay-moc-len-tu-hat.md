---
id: b56ad288-e43f-4644-944d-0b4078968791
topic: cay-quanh-em
slug: cay-moc-len-tu-hat
order: 1
stage: opener
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Plants from seeds
vi: Cây mọc lên từ hạt
> Giữ đúng tên ở `content/syllabus.json` (key `identifying-plants-and-their-basic-parts`, bài số một).

## Mục tiêu
en: I know many plants grow from seeds.
vi: Em biết nhiều cây mọc lên từ hạt.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 18/11/2026. Ticket SK-051. Mọi dòng `id:` để trống; chạy `ids` sau `_topic.md`, trước bài 2.
> Sườn: Oak Y2 *Growing plants* L1 `plants-from-seeds` (`docs/oak/growing-plants.md`). Ý mở đầu "cây quanh nhà, quanh trường" của Y1 L1 thành ví dụ một ô Seeds. Phần gieo hạt, theo dõi nhiều ngày của sườn thành chuỗi ba hình (câu q4); kính lúp không dùng.
> Sửa `trees_not_from_seeds` ở ô Big trees, câu q5 và câu q6 (gắn key).
> Chữ bé nghe chỉ nói "many plants" · "nhiều cây", không "mọi cây", "cây nào cũng", "every plant", "all plants grow from seeds" (SK-051).

## Ý chính
1.en: Many plants grow from seeds.
1.vi: Nhiều cây mọc lên từ hạt.
2.en: Seeds have many shapes and sizes.
2.vi: Hạt có nhiều hình, nhiều cỡ.
3.en: The root grows down. The shoot grows up.
3.vi: Rễ mọc xuống, mầm vươn lên.
> Từ cụ thể tới trừu tượng: hạt bé cầm được, so hình và cỡ các hạt, rồi điều xảy ra khi hạt nảy mầm.
> [CẦN KIỂM] "Nhiều cây mọc lên từ hạt": dương xỉ, rêu không có hạt; mía, sắn trồng bằng khúc thân. Bài không nói "mọi cây".

## Khởi động

> Hai câu. w1 ôn *Sinh vật sống ở đâu?* bài một (cây là vật sống, cây lớn lên), theo SK-051. w2 ôn *Cơ thể của em* bài sáu (chủ đề ngay trước; ô Touch: mít có gai), nối sang hạt mít ở ô Shapes and sizes hôm nay (vỏ có gai, hạt nhẵn).

### w1
id: 22f34bc6-ae06-4a6e-a4c8-e01269a8430c
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/vat-song-hay-khong-song
prompt.en: A young plant stays small forever.
prompt.vi: Cây non mãi mãi chỉ nhỏ như thế.
image.brief: Dùng lại hình `explore_plants` ở bài `sinh-vat-song-o-dau/vat-song-hay-khong-song`. Từ khoá tìm ảnh (EN): young vegetable seedlings soil row
image.alt.en: Young plants in the soil
image.alt.vi: Cây non mọc trên đất
answer: false
hint.en: Think of rice growing in the field.
hint.vi: Em nghĩ tới cây lúa ngoài đồng nhé.
explanation_correct.en: Plants grow, because they are alive.
explanation_correct.vi: Cây lớn lên, vì cây là vật sống.
explanation_wrong.en: This is false. Young plants grow bigger.
explanation_wrong.vi: Câu này sai. Cây non sẽ lớn dần.
feedback_true.en: A rice plant grows tall, day by day.
feedback_true.vi: Cây lúa lớn cao lên từng ngày.
> Câu khẳng định, đáp án Sai ("forever" không phải chữ phủ định). Câu mới, không chép câu q5, q6 hay từ `grow` của bài nguồn. Gợi ý nhắc ví dụ "a rice plant grows tall" của ô Plants bài nguồn.

### w2
id: 3167f110-42d1-4617-b912-3f0e61edcb48
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: co-the-cua-em/nem-va-so
prompt.en: A jackfruit has a smooth skin.
prompt.vi: Vỏ quả mít nhẵn nhụi.
image.brief: Dùng lại hình `explore_feel` ở bài `co-the-cua-em/nem-va-so`. Từ khoá tìm ảnh (EN): jackfruit whole close up
image.alt.en: A jackfruit
image.alt.vi: Quả mít
answer: false
hint.en: Look closely at its skin.
hint.vi: Em nhìn kỹ vỏ quả mít nhé.
explanation_correct.en: A jackfruit skin is prickly.
explanation_correct.vi: Vỏ quả mít sần sùi, có gai.
explanation_wrong.en: This is false. Its skin is prickly.
explanation_wrong.vi: Câu này sai. Vỏ mít có gai.
feedback_true.en: Tiny spikes cover a jackfruit.
feedback_true.vi: Vỏ mít phủ đầy gai nhỏ.
> Câu mới, khác câu q3 "Which one feels prickly?" của bài nguồn. Không rủ bé sờ (chỉ nhìn ảnh).

## Học

> Bốn ô: hạt (hạt đậu xanh), hạt nhiều hình nhiều cỡ (hạt mít), hạt nảy mầm (rễ xuống, mầm lên), cây to cũng từ hạt (cây xoài). Ô cuối sửa `trees_not_from_seeds`.
> Ví dụ một ô Seeds đưa ý "cây quanh em" (cây to, cây hoa, rau quanh nhà); ví dụ ba là lời dặn an toàn về hạt (SK-051 mục An toàn).

### explore
id: 82334c66-65c2-42ef-a1fa-1f9566d7bb55
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_seeds
label.en: Seeds
label.vi: Hạt
color: nau_dat
sentence.en: Many plants grow from seeds.
sentence.vi: Nhiều cây mọc lên từ hạt.
image.brief: [ảnh] Một nắm hạt đậu xanh khô đựng trong bát gốm nhỏ hoặc rải trên nền trơn, chụp gần từ trên xuống, thấy rõ từng hạt nhỏ, tròn, xanh; không tay người, không bao bì, không chữ. Ảnh vuông hoặc ngang có khoảng trống (khung vuông ô Học, món Chơi; thẻ ba lựa chọn 5:2; thẻ từ 2:1; câu q4 dùng hình vẽ `q4_seed`, không dùng ảnh này). Hình gốc của cả chủ đề. Từ khoá tìm ảnh (EN): mung bean seeds; Vigna radiata seeds; green gram bowl
image.alt.en: Small green beans
image.alt.vi: Đậu xanh nhỏ
examples.1.en: trees, flowers and vegetables around us
examples.1.vi: cây to, cây hoa và rau quanh em
examples.2.en: each seed makes its own plant
examples.2.vi: hạt của cây nào mọc ra cây ấy
examples.3.en: keep seeds out of noses and ears
examples.3.vi: đừng nhét hạt vào mũi, vào tai
> `alt` cố ý không có chữ "seed" · "hạt" (ảnh là đáp án câu q1 "Which one is a seed?"; Quy ước hình số sáu).
> Ví dụ hai dạy trước câu q5 (hạt xoài mọc ra cây xoài). Ví dụ ba là lời dặn an toàn duy nhất về hạt trong chủ đề.
> [CẦN KIỂM] Một số hạt có độc (đậu sống, hạt táo); bài không nêu tên, chỉ dặn không nhét hạt vào mũi, tai.

#### group explore_jackfruit_seeds
label.en: Shapes and sizes
label.vi: Nhiều hình, nhiều cỡ
color: vang_hoe
sentence.en: Seeds have many shapes and sizes.
sentence.vi: Hạt có nhiều hình, nhiều cỡ.
image.brief: [ảnh] Một đống hạt mít to, nhẵn, màu nâu nhạt hoặc trắng ngà đặt trên đĩa hay nền trơn, chụp gần; không có múi mít, không dao, không tay người, không chữ. Ảnh ngang có khoảng trống (khung vuông ô Học và món Chơi; khung 4:3 câu q2). Từ khoá tìm ảnh (EN): jackfruit seeds; Artocarpus heterophyllus seeds
image.alt.en: Big jackfruit seeds
image.alt.vi: Những hạt mít to
examples.1.en: tiny, round green beans
examples.1.vi: hạt đậu xanh nhỏ, tròn
examples.2.en: big, smooth jackfruit seeds
examples.2.vi: hạt mít to, nhẵn
examples.3.en: a big, flat mango seed
examples.3.vi: hạt xoài to, dẹt
> Ví dụ một và hai dạy trước câu q2 và gợi ý của nó. Hạt xoài chỉ nói, không ảnh.
> [CẦN KIỂM] Hạt mít to, vỏ nhẵn; hạt xoài to, dẹt (nói phần hạt có vỏ cứng bọc ngoài).

#### group explore_sprout
label.en: Root and shoot
label.vi: Rễ và mầm
color: cham
sentence.en: The root grows down. The shoot grows up.
sentence.vi: Rễ mọc xuống, mầm vươn lên.
image.brief: [hình vẽ] Một hạt đậu xanh đang nảy mầm nằm ở mặt đất, nhìn ngang như mặt cắt: phía dưới là đất nâu, một rễ trắng dài có vài rễ con đâm xuống; phía trên là nền kem, một mầm xanh có hai lá non vươn lên; vẽ gần thực tế, không tay người, không chữ, không mũi tên, không nét viền. Khung vuông ô Học, thẻ `order_sequence`; khung 4:3 câu q3; thẻ từ 2:1. Cùng nét, cùng nền với `q4_seed`, `q4_seedling` (ba thẻ câu q4). Hình gốc của cả chủ đề (SK-051 quyết định 10, đã vẽ).
image.alt.en: A bean seed with a root and shoot
image.alt.vi: Hạt đậu có rễ và mầm
examples.1.en: the seed cracks open
examples.1.vi: vỏ hạt nứt ra
examples.2.en: the root goes into the soil
examples.2.vi: rễ đâm xuống đất
examples.3.en: the shoot reaches for the light
examples.3.vi: mầm vươn lên đón ánh sáng
> Ví dụ ba nối sang bài 2 (cây cần ánh sáng). Không nói "rễ hút nước", "rễ tìm nước" (ranh giới SK-051).
> [CẦN KIỂM] Khi hạt nảy mầm, rễ nhú ra trước, đâm xuống; mầm vươn lên trên mặt đất.

#### group explore_big_tree
label.en: Big trees, too
label.vi: Cả cây to
color: gi_dong
sentence.en: A big mango tree grows from a seed.
sentence.vi: Cây xoài to cũng mọc lên từ một hạt.
image.brief: [ảnh] Cả một cây xoài to ngoài vườn hay ven đường, thấy gốc, thân, tán lá rộng, có thể thấy vài chùm quả; chụp từ xa vừa, trời sáng; không người nhìn rõ mặt, không nhà che mất cây, không biển, không chữ. Ảnh ngang (khung vuông ô Học, thẻ ba lựa chọn 5:2 câu q5, khung 4:3 câu q6). Hình gốc của cả chủ đề. Từ khoá tìm ảnh (EN): mango tree; Mangifera indica tree; mango tree orchard
image.alt.en: A big mango tree
image.alt.vi: Cây xoài to
examples.1.en: it starts as a young plant
examples.1.vi: lúc đầu chỉ là một cây non
examples.2.en: it grows for many years
examples.2.vi: cây lớn lên trong nhiều năm
examples.3.en: jackfruit trees grow from seeds, too
examples.3.vi: cây mít cũng mọc lên từ hạt
> Ô sửa `trees_not_from_seeds`: câu chính là đúng câu `correction` ở `_topic.md`.
> [CẦN KIỂM] Cây xoài, cây mít mọc được từ hạt (người trồng thường ghép, chiết cành; bài không nói cách trồng); cây xoài lớn trong nhiều năm.

### new_words
id: 8dcbed32-b412-404e-adbe-92ebcfa3a318
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: seed, shoot

## Chơi

> Bé chọn ba chặng của hạt: một hạt (hạt đậu xanh hoặc hạt mít), một hạt nảy mầm (giá đỗ), một cây non (cây đậu con hoặc hàng rau non). Đạt khi đủ ba nhóm và không chọn vật không lớn lên được.
> Món bẫy: bi thuỷ tinh (tròn, nhỏ như hạt) và bóng cao su (tròn, nhiều màu): trông giống hạt nhưng không bao giờ nảy mầm. Kệ bảy món, toàn ảnh chụp.
> Sửa 18/11 (SK-051 quyết định 13): món `tray_sprout` đổi từ hình vẽ hạt nảy mầm (món đúng duy nhất là hình vẽ trên kệ) sang ảnh giá đỗ (giá đỗ là hạt đậu xanh nảy mầm), dùng lại `explore_dark` của bài 2. Key món giữ `tray_sprout`. Cây đậu con trên kệ là ảnh chụp gốc `tray_seedling`.

### tray
id: 7ff03756-d469-4d1e-b44e-90d7563c33c7
type: build_tray
version: 1
prompt.en: From seed to young plant
prompt.vi: Từ hạt tới cây non
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find a seed, a sprout, a young plant.
messages.start.vi: Em tìm một hạt, một hạt nảy mầm và một cây non nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! A seed sprouts, then it grows.
messages.balanced.vi: Tuyệt! Hạt nảy mầm, rồi lớn lên.
messages.has_limited.en: That one cannot grow.
messages.has_limited.vi: Món này không lớn lên được.
messages.missing.tray_seed.en: You still need a seed.
messages.missing.tray_seed.vi: Em còn thiếu một hạt.
messages.missing.tray_sprouting.en: You still need a sprouting seed.
messages.missing.tray_sprouting.vi: Em còn thiếu một hạt nảy mầm.
messages.missing.tray_young.en: You still need a young plant.
messages.missing.tray_young.vi: Em còn thiếu một cây non.
> Lời nhắn `has_limited` đúng với cả hai món bẫy.

#### group tray_seed
label.en: Seed
label.vi: Hạt
color: nau_dat
role: required

#### group tray_sprouting
label.en: Sprout
label.vi: Hạt nảy mầm
color: vang_hoe
role: required

#### group tray_young
label.en: Young plant
label.vi: Cây non
color: gi_dong
role: required

#### group tray_never
label.en: Cannot grow
label.vi: Không lớn lên được
color: do_son
role: limit

#### item tray_beans
label.en: Green beans
label.vi: Hạt đậu xanh
group: tray_seed
image.brief: Dùng lại hình `explore_seeds`. Từ khoá tìm ảnh (EN): mung bean seeds
image.alt.en: Small green beans
image.alt.vi: Đậu xanh nhỏ

#### item tray_marble
label.en: Glass marbles
label.vi: Bi thuỷ tinh
group: tray_never
image.brief: Dùng lại hình `tray_marble` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): glass marbles close up
image.alt.en: Glass marbles
image.alt.vi: Những viên bi thuỷ tinh

#### item tray_sprout
label.en: Bean sprouts
label.vi: Giá đỗ
group: tray_sprouting
image.brief: Dùng lại hình `explore_dark` ở bài `cay-quanh-em/cay-can-gi-de-lon`. Từ khoá tìm ảnh (EN): bean sprouts
image.alt.en: White bean sprouts
image.alt.vi: Giá đỗ trắng
> Giá đỗ là hạt đậu xanh nảy mầm. Bài 2 dạy giá đỗ ủ trong tối; ở đây bé chỉ cần nhận ra hạt đã nảy mầm.
> [CẦN KIỂM] Giá đỗ là hạt đậu xanh nảy mầm (đã ghi ở bài 2).

#### item tray_young_plants
label.en: Young plants
label.vi: Hàng rau non
group: tray_young
image.brief: Dùng lại hình `explore_plants` ở bài `sinh-vat-song-o-dau/vat-song-hay-khong-song`. Từ khoá tìm ảnh (EN): young vegetable seedlings soil row
image.alt.en: Young plants in the soil
image.alt.vi: Cây non mọc trên đất

#### item tray_jackfruit
label.en: Jackfruit seeds
label.vi: Hạt mít
group: tray_seed
image.brief: Dùng lại hình `explore_jackfruit_seeds`. Từ khoá tìm ảnh (EN): jackfruit seeds
image.alt.en: Big jackfruit seeds
image.alt.vi: Những hạt mít to

#### item tray_ball
label.en: Rubber balls
label.vi: Bóng cao su
group: tray_never
image.brief: Dùng lại hình `tray_ball` ở bài `thoi-tiet-va-cac-mua/thoi-tiet-hom-nay`. Từ khoá tìm ảnh (EN): colourful rubber bouncy balls
image.alt.en: Colourful rubber balls
image.alt.vi: Những quả bóng cao su nhiều màu

#### item tray_seedling
label.en: Young bean plant
label.vi: Cây đậu con
group: tray_young
image.brief: [ảnh] Một cây đậu con mới mọc trên đất, thấy thân non và hai, ba lá xanh đầu tiên, thấy mặt đất quanh gốc; chụp gần, nền đất; không tay người, không chậu có chữ, không chữ. Ảnh vuông hoặc ngang có khoảng trống (món Chơi vuông, thẻ từ 2:1). Hình gốc của cả chủ đề (món Chơi, từ `soil`). Từ khoá tìm ảnh (EN): bean seedling soil; young bean plant; mung bean seedling
image.alt.en: A young bean plant in the soil
image.alt.vi: Cây đậu con trên đất

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2 Đúng, q3 Sai, q6 Sai), `order_sequence` (q4, ba thẻ).
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính. Câu nào cũng tự đủ nghĩa khi chỉ nghe.

### q1
id: ec99f275-5100-4200-b413-60be84158fbb
format: single_choice
version: 1
dok: 1
prompt.en: Which one is a seed?
prompt.vi: Cái nào là hạt?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for something small and hard.
hint.vi: Em tìm vật nhỏ và cứng nhé.
explanation_correct.en: Yes! A bean seed can grow into a plant.
explanation_correct.vi: Đúng rồi! Hạt đậu có thể mọc thành cây.
explanation_wrong.en: The answer is the beans. They are seeds.
explanation_wrong.vi: Đáp án là đậu xanh. Đó là những hạt đậu.
> DOK 1: nhớ lại ô Seeds. Lựa chọn sai là hai bộ phận khác của cây (lá, hoa), bé đã gặp ở chủ đề trước. Ba ảnh khác nhau rõ bằng dáng và màu.
> `explanation_correct` câu đầu "Yes!" một từ, câu sau tám từ.

#### option q1_leaf
correct: false
feedback.en: A leaf grows on a branch.
feedback.vi: Chiếc lá mọc trên cành cây.
label.en: leaf
label.vi: chiếc lá
image.brief: Dùng lại hình `explore_alive` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa green leaves branch
image.alt.en: Green leaves on a branch
image.alt.vi: Lá xanh trên cành cây

#### option q1_beans
correct: true
label.en: green beans
label.vi: hạt đậu xanh
image.brief: Dùng lại hình `explore_seeds`. Từ khoá tìm ảnh (EN): mung bean seeds
image.alt.en: Small green beans
image.alt.vi: Đậu xanh nhỏ

#### option q1_lotus
correct: false
feedback.en: A lotus flower opens on the pond.
feedback.vi: Hoa sen nở trên mặt ao.
label.en: lotus
label.vi: hoa sen
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao

### q2
id: 6af57b03-ea82-449d-8e32-bad4f17af466
format: true_false
version: 1
dok: 1
prompt.en: Seeds come in many sizes.
prompt.vi: Hạt có nhiều cỡ khác nhau.
image.brief: Dùng lại hình `explore_jackfruit_seeds`. Từ khoá tìm ảnh (EN): jackfruit seeds
image.alt.en: Big jackfruit seeds
image.alt.vi: Những hạt mít to
answer: true
hint.en: Think of beans and jackfruit seeds.
hint.vi: Em nghĩ tới hạt đậu và hạt mít nhé.
explanation_correct.en: Yes! Some are tiny, some are big.
explanation_correct.vi: Đúng rồi! Có hạt bé xíu, có hạt rất to.
explanation_wrong.en: This is true. Seeds can be tiny or big.
explanation_wrong.vi: Câu này đúng. Hạt có thể bé xíu hay rất to.
feedback_false.en: A jackfruit seed is bigger than a bean.
feedback_false.vi: Hạt mít to hơn hạt đậu.
> DOK 1: nhớ lại ý chính hai và ví dụ ô Shapes and sizes. Hình là hạt mít (vật được nói tới).

### q3
id: 5af6e64c-8576-4361-bd4c-83d4a328569e
format: true_false
version: 1
dok: 1
prompt.en: The shoot grows down into the soil.
prompt.vi: Mầm mọc đâm xuống đất.
image.brief: Dùng lại hình `explore_sprout`. Từ khoá tìm ảnh (EN): bean germination root shoot
image.alt.en: A bean seed with a root and shoot
image.alt.vi: Hạt đậu có rễ và mầm
answer: false
hint.en: Look at the green part.
hint.vi: Em nhìn phần màu xanh nhé.
explanation_correct.en: The root grows down. The shoot grows up.
explanation_correct.vi: Rễ mọc xuống, mầm vươn lên.
explanation_wrong.en: This is false. The shoot grows up.
explanation_wrong.vi: Câu này sai. Mầm vươn lên trên.
feedback_true.en: The white root is the part going down.
feedback_true.vi: Rễ trắng mới là phần đâm xuống.
> DOK 1: nhớ lại ý chính ba, nhìn ảnh hạt nảy mầm. `explanation_correct` là ý chính ba, đứng một mình được (thẻ "Ý sai → Ý đúng").

### q4
id: fad64be5-98b4-43eb-ab4d-0b45bbcd6735
format: order_sequence
version: 1
dok: 2
prompt.en: Start with the seed. Put them in order.
prompt.vi: Bắt đầu từ hạt. Em xếp theo thứ tự nhé.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_seed, q4_sprout, q4_seedling
hint.en: The root comes out before the leaves.
hint.vi: Rễ nhú ra trước khi có lá.
explanation_correct.en: Yes! The young plant will keep growing.
explanation_correct.vi: Đúng rồi! Cây non sẽ còn lớn nữa.
explanation_wrong.en: The order is seed, sprout, young plant.
explanation_wrong.vi: Thứ tự là hạt, hạt nảy mầm, rồi cây non.
> DOK 2: xếp ba chặng một cây đậu theo thời gian. Đúng một thứ tự. `prompt` nêu thẻ đầu (như nếp `order_sequence` của #5); gợi ý chỉ nhắc một mốc, không gọi tên cả ba thẻ. Thẻ trong file không theo thứ tự đúng.
> Ba thẻ là hình vẽ cùng nét, cùng nền đất, cùng cây đậu xanh (SK-051 quyết định 13): `q4_seed`, `explore_sprout`, `q4_seedling`. Ảnh chụp hạt đậu (`explore_seeds`) và cây đậu con (`tray_seedling`) chỉ ở ô Học, kệ Chơi, từ vựng.

#### item q4_sprout
label.en: sprouting bean
label.vi: hạt đậu nảy mầm
image.brief: Dùng lại hình `explore_sprout`.
image.alt.en: A bean seed with a root and shoot
image.alt.vi: Hạt đậu có rễ và mầm

#### item q4_seedling
label.en: young bean plant
label.vi: cây đậu con
image.brief: [hình vẽ] Cây đậu con trên đất: cùng cây đậu xanh với hình hạt nảy mầm `explore_sprout` nhưng lớn hơn, thân xanh cao hơn, có hai, ba lá non; cùng nét, cùng nền (đất nâu nhìn ngang như mặt cắt, nền kem phía trên); vẽ gần thực tế, không tay người, không chữ, không nét viền. Thẻ `order_sequence` vuông.
image.alt.en: A young bean plant in the soil
image.alt.vi: Cây đậu con trên đất

#### item q4_seed
label.en: green beans
label.vi: hạt đậu xanh
image.brief: [hình vẽ] Một nhúm hạt đậu xanh nhỏ, tròn nằm trên mặt đất, nhìn gần; cùng nét, cùng nền với `explore_sprout` (đất nâu nhìn ngang như mặt cắt, nền kem phía trên); vẽ gần thực tế, không tay người, không chữ, không nét viền. Thẻ `order_sequence` vuông.
image.alt.en: Green beans on the soil
image.alt.vi: Đậu xanh trên mặt đất
> Sửa 18/11 lượt 2 (tester c4): `alt` riêng của hình vẽ, khác `alt` ảnh chụp `explore_seeds` ("Small green beans") để VoiceOver đọc hai hình khác nhau thành hai câu khác nhau. Không có chữ "seed" của `prompt`.

### q5
id: cb1f32f4-0e41-4f7e-b8e8-3565f83384cc
format: single_choice
version: 1
dok: 2
prompt.en: A mango seed grows into what?
prompt.vi: Hạt xoài lớn lên thành cây gì?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Each seed makes its own kind of plant.
hint.vi: Hạt của cây nào thì mọc ra cây ấy.
explanation_correct.en: Yes! It grows into a big mango tree.
explanation_correct.vi: Đúng rồi! Hạt xoài mọc thành cây xoài to.
explanation_wrong.en: The answer is the mango tree. It makes mangoes.
explanation_wrong.vi: Đáp án là cây xoài. Cây xoài ra quả xoài.
> DOK 2: áp ví dụ "each seed makes its own plant" (ô Seeds) vào hạt xoài. Hai lựa chọn sai cũng là cây mọc từ hạt (lúa, sen), nên bé phải nghĩ "hạt nào ra cây nấy", không chỉ "cái gì mọc từ hạt". Gợi ý là cách nghĩ, không gọi tên cây xoài.
> Lựa chọn đúng dùng `alt` riêng (không có chữ "mango" của câu hỏi).

#### option q5_rice
correct: false
feedback.en: Rice plants grow from rice seeds.
feedback.vi: Cây lúa mọc lên từ hạt thóc.
label.en: rice plants
label.vi: cây lúa
image.brief: Dùng lại hình `tray_rice` ở bài `sinh-vat-song-o-dau/noi-song-cua-cay`. Từ khoá tìm ảnh (EN): young rice plants flooded paddy
image.alt.en: Young rice in a wet field
image.alt.vi: Lúa non trên ruộng nước
> [CẦN KIỂM] Cây lúa mọc từ hạt thóc (gieo mạ từ thóc giống).

#### option q5_tree
correct: true
label.en: mango tree
label.vi: cây xoài
image.brief: Dùng lại hình `explore_big_tree`. Từ khoá tìm ảnh (EN): mango tree
image.alt.en: A big tree with fruit
image.alt.vi: Cây to có quả
> `alt` riêng ở chỗ này; ảnh, key, `brief` giữ như hình gốc.

#### option q5_lotus
correct: false
feedback.en: A lotus grows from a lotus seed.
feedback.vi: Cây sen mọc lên từ hạt sen.
label.en: lotus
label.vi: hoa sen
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao
> [CẦN KIỂM] Sen mọc được từ hạt sen (người trồng cũng trồng bằng ngó sen; câu chỉ nói "mọc lên từ hạt sen").

### q6
id: 5c8868ba-04c5-410a-99ac-ff8c7a4eb2ca
format: true_false
version: 1
dok: 2
misconception: trees_not_from_seeds
prompt.en: Only small plants grow from seeds.
prompt.vi: Chỉ cây nhỏ mới mọc lên từ hạt.
image.brief: Dùng lại hình `explore_big_tree`. Từ khoá tìm ảnh (EN): mango tree
image.alt.en: A big mango tree
image.alt.vi: Cây xoài to
answer: false
hint.en: Think of how a big tree started.
hint.vi: Em nghĩ xem lúc đầu cây to là gì nhé.
explanation_correct.en: A big mango tree grows from a seed.
explanation_correct.vi: Cây xoài to cũng mọc lên từ một hạt.
explanation_wrong.en: This is false. Big trees grow from seeds, too.
explanation_wrong.vi: Câu này sai. Cây to cũng mọc lên từ hạt.
feedback_true.en: A jackfruit tree grows from a seed, too.
feedback_true.vi: Cây mít cũng mọc lên từ một hạt.
> Câu misconception (`trees_not_from_seeds`), DOK 2: bé nghĩ "hạt bé xíu không thể thành cây to" sẽ chạm Đúng. Bé áp ô Big trees và câu q5 để bác câu nói. Câu chỉ kiểm một việc: cây to có mọc từ hạt không.
> Hình là cây xoài to (vật bé phải nghĩ tới), không phải hạt hay cây non; không tự làm bằng chứng cho phía nào. `explanation_correct` là đúng câu `correction` ở `_topic.md`.
> Chữ "Only" giữ câu khẳng định (luật Explorer số năm); câu không nói "mọi cây mọc từ hạt".

## Từ vựng

### seed
id: ef905bfe-7f25-4df3-85f6-3847d5d3ce45
tier: core
term.en: seed
term.vi: hạt
example.en: A seed can grow into a plant.
example.vi: Hạt có thể mọc thành cây.
image.brief: Dùng lại hình `explore_seeds`. Từ khoá tìm ảnh (EN): mung bean seeds
image.alt.en: Small green beans
image.alt.vi: Đậu xanh nhỏ

### shoot
id: 640919d9-8e69-4ca8-8c70-3a7933094ae6
tier: core
term.en: shoot
term.vi: mầm
example.en: The green shoot grows up.
example.vi: Mầm xanh vươn lên.
image.brief: Dùng lại hình `explore_sprout`. Từ khoá tìm ảnh (EN): bean germination root shoot
image.alt.en: A bean seed with a root and shoot
image.alt.vi: Hạt đậu có rễ và mầm
> [CẦN KIỂM] "Shoot" (từ khoá của sườn) hay "sprout" dễ hơn với trẻ năm tới bảy tuổi; "shoot" cũng là "bắn", nghe thử giọng đọc.

### root
id: c7b68348-35e3-4913-a7ff-21b92a555ebb
tier: extra
term.en: root
term.vi: rễ
example.en: The root grows down into the soil.
example.vi: Rễ mọc đâm xuống đất.
image.brief: Dùng lại hình `explore_sprout`. Từ khoá tìm ảnh (EN): bean germination root shoot
image.alt.en: A bean seed with a root and shoot
image.alt.vi: Hạt đậu có rễ và mầm
> Từ `root` dùng lại ở bài 3, 4 (rễ cây to, rễ cây có hoa) không vào từ vựng lần nữa.

### soil
id: b25fc3a6-c112-4fdf-9d64-91b7d4200fac
tier: extra
term.en: soil
term.vi: đất
example.en: Seeds sprout in wet soil.
example.vi: Hạt nảy mầm trong đất ẩm.
image.brief: Dùng lại hình `tray_seedling`. Từ khoá tìm ảnh (EN): bean seedling soil
image.alt.en: A young bean plant in the soil
image.alt.vi: Cây đậu con trên đất
> Câu ví dụ không nói "cây cần đất" (sen, bèo sống trong nước; ranh giới SK-051).

## Thưởng

### jackfruit_card
id: 9df7fc1b-92dc-4e2e-b2fa-d22d6af4e7c8
set: plants
rarity: common
name.en: Jackfruit tree
name.vi: Cây mít
tag.en: Big fruit, many seeds
tag.vi: Quả to, nhiều hạt
fact.en: Its fruit grows right on the trunk.
fact.vi: Quả mít mọc ngay trên thân cây.
image.brief: [ảnh] Vài quả mít xanh treo sát trên thân một cây mít to, chụp từ dưới gốc lên, thấy rõ quả mọc ngay trên thân; không người, không túi bọc quả, không chữ. Ảnh vuông được. Từ khoá tìm ảnh (EN): jackfruit on tree trunk; Artocarpus heterophyllus trunk fruit
image.alt.en: Jackfruits on a tree trunk
image.alt.vi: Quả mít trên thân cây
> Bộ mới `set: plants` (SK-051). Thẻ nối ô Shapes and sizes (hạt mít) và câu q6 (cây mít mọc từ hạt).
> [CẦN KIỂM] Quả mít mọc trên thân và cành to của cây.

## Ghi chú cho hoạ sĩ

- **Loại hình:** ảnh chụp thật, trừ ba hình vẽ cây đậu (SK-051 quyết định 10, 13). Không người nhìn rõ mặt; không bàn tay trẻ cầm hạt; không bao bì, gói hạt giống có chữ.
- **Hình vẽ (mục `own`, `changes: ["drawn"]`, credit "Science Kids"; cùng nét, cùng nền với `bean-sprout.jpg`):** hạt đậu nảy mầm thấy rễ và mầm (`explore_sprout`, đã vẽ; hình gốc cả chủ đề: ô Học, q3, q4, từ `shoot`, từ `root`), một nhúm hạt đậu xanh trên đất (`q4_seed`, vẽ mới), cây đậu con trên đất (`q4_seedling`, vẽ mới). Ba thẻ q4 đều là hình vẽ. Kệ Chơi không có hình vẽ nào.
- **Ảnh mới, hình gốc của cả chủ đề (giữ đúng key, `alt`, truy vấn đầu ở `_topic.md`):** hạt đậu xanh (`explore_seeds`), hạt mít (`explore_jackfruit_seeds`), cây đậu con trên đất (`tray_seedling`: món Chơi, từ `soil`; trước 18/11 là `q4_seedling`), cây xoài to (`explore_big_tree`).
- **Ảnh mới chỉ dùng ở bài này:** quả mít trên thân cây (`jackfruit_card`).
- **Ảnh dùng lại:** bài 2 `explore_dark` (giá đỗ, món `tray_sprout`); *Sinh vật sống ở đâu?* bài 1 `explore_plants` (w1, món Chơi), bài 3 `explore_alive` (q1), `tray_marble` (món Chơi), bài 5 `tray_rice` (q5); *Cơ thể của em* bài 6 `explore_feel` (w2); *Thời tiết và các mùa* bài 1 `tray_ball` (món Chơi); *Gọi tên và nhóm động vật* bài 1 `w1` (hàng rào tre, hình câu q1, q4, q5), `w1_lotus` (q1, q5).
- **`alt` riêng:** q5 `q5_tree` dùng `explore_big_tree` với `alt` "A big tree with fruit" · "Cây to có quả".
- **Ảnh khó:** cây xoài thấy cả cây, không bị nhà, dây điện che.
- **Màu:** Học: hạt `nau_dat`, nhiều hình nhiều cỡ `vang_hoe`, rễ và mầm `cham`, cả cây to `gi_dong`. Chơi: hạt `nau_dat`, hạt nảy mầm `vang_hoe`, cây non `gi_dong`, không lớn lên được `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (seed, shoot). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `true_false` (w1 Sai, w2 Sai). Quiz `single_choice` (q1, q5; ba lựa chọn), `true_false` (q2 Đúng, q3 Sai, q6 Sai), `order_sequence` (q4). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`trees_not_from_seeds`). Không có `labels` ở câu `true_false`.
- **`order_sequence` q4:** thứ tự đúng `q4_seed`, `q4_sprout`, `q4_seedling`.
- **Màn Chơi, ví dụ để kiểm:** Hạt đậu xanh, Giá đỗ, Cây đậu con → `balanced`; Hạt mít, Giá đỗ, Hàng rau non → `balanced`; Hạt đậu xanh, Hạt mít, Cây đậu con → `missing.tray_sprouting`; Bi thuỷ tinh, Giá đỗ, Cây đậu con → `has_limited`.
- **Hình đổi 18/11:** món `tray_sprout` (key giữ) nay dùng lại `explore_dark` bài 2; `tray_seedling` thành ảnh gốc (thay `q4_seedling`); `q4_seed`, `q4_seedling` là hình vẽ.
- **Khởi động trỏ:** w1 → `sinh-vat-song-o-dau/vat-song-hay-khong-song`, w2 → `co-the-cua-em/nem-va-so` (đều đã có id).
- **Thưởng:** bộ mới `set: plants`; cần khoá `collectible.set.plants` (ios-dev, SK-051).
- **Từ EN có thể ngoài Starters/Movers:** seed, shoot, root, soil, sprout, jackfruit, mango, lotus, rice, crack, forever, marbles, bean sprouts.
