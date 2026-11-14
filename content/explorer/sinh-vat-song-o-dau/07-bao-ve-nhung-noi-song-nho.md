---
id: 535ec412-0491-4c8f-bce8-02549e5d9b37
topic: sinh-vat-song-o-dau
slug: bao-ve-nhung-noi-song-nho
order: 7
stage: review
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Protecting microhabitats
vi: Bảo vệ những nơi sống nhỏ
> Giữ đúng tên ở `content/syllabus.json` (bài số bảy).

## Mục tiêu
en: I can help keep tiny habitats safe.
vi: Em biết cách giữ an toàn cho những nơi sống nhỏ xíu.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 14/11/2026. Mọi dòng `id:` để trống; chạy `ids` sau bài sáu.
> Bài cuối (`review`): Khởi động ôn trộn bài sáu, bài ba và chủ đề *Gọi tên và nhóm động vật* (mốc giãn cách dài); câu q5, q6 dùng lại con vật của bài sáu. Bài cũng có ý mới (mối đe doạ, việc bé làm được); nếu PM muốn tính là `apply` thì đổi, không cần đổi chữ.
> Sửa `tiny_animals_same_place` ở ý chính ba, hai ô Học "Look gently" (đất ẩm, tối) và "Flowers and water" (nắng), câu q5 và câu q6 (gắn key).
> **Đúng khoa học, không đổ lỗi:** mối đe doạ trong bài chỉ là việc của con người mà bé thấy được và tránh được (vứt rác, đốt lá, phun thuốc sâu). **Không nói lũ lụt** là mối đe doạ do con người (sườn `[CẦN KIỂM]`: lũ phần lớn là thiên tai; trẻ miền Trung có thể vừa trải qua lũ). Không ảnh thiên tai, không ảnh con vật chết. Lời cho bé nhấn vào việc bé làm được, cùng người lớn.
> Không dùng "khách sạn côn trùng" và "hộp tổ chim" làm món chính (hai đáp án trong quiz của nguồn tham khảo); bản Việt Nam là đống cành lá khô, bó ống tre, đĩa nước, luống hoa.

## Ý chính
1.en: Rubbish and fire can harm tiny habitats.
1.vi: Rác và lửa có thể làm hại nơi sống nhỏ.
2.en: We can keep tiny habitats safe.
2.vi: Mình có thể giữ an toàn cho nơi sống nhỏ.
3.en: Tiny animals need different kinds of places.
3.vi: Mỗi con vật nhỏ cần một kiểu chỗ ở khác nhau.

## Khởi động

> Ba câu ôn trộn: w1 bài sáu (bài trước), w2 bài ba, w3 bài bảy chủ đề *Gọi tên và nhóm động vật* (mốc giãn cách dài; nối với `small_animals_are_insects` của bài sáu).

### w1
id: afd3454f-ebd0-4caf-a02a-9b056060a69e
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/nhung-noi-song-nho-xiu
prompt.en: Where do earthworms hide?
prompt.vi: Giun đất trốn ở đâu?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Earthworms need soil to live in.
hint.vi: Giun đất cần có đất để sống.
explanation_correct.en: Yes! It is dark and damp under a stone.
explanation_correct.vi: Đúng rồi! Dưới hòn đá tối và ẩm.
explanation_wrong.en: The answer is under a stone. It is damp there.
explanation_wrong.vi: Đáp án là dưới hòn đá. Chỗ đó ẩm.

#### option w1_stone
correct: true
label.en: under a stone
label.vi: dưới hòn đá
image.brief: Dùng lại hình `explore_stone` ở bài `sinh-vat-song-o-dau/nhung-noi-song-nho-xiu`. Từ khoá tìm ảnh (EN): under a rock soil insects worms
image.alt.en: Damp soil under a stone
image.alt.vi: Đất ẩm dưới hòn đá

#### option w1_sea
correct: false
feedback.en: The sea is salty water, not soil.
feedback.vi: Biển toàn nước mặn, không có đất cho giun.
label.en: sea
label.vi: biển
image.brief: Dùng lại hình `q4` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): coral reef underwater fish NOAA
image.alt.en: A coral reef under the sea
image.alt.vi: Rạn san hô dưới biển

### w2
id: 13bf8777-b908-4be6-863a-90ab04373096
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song
prompt.en: A plastic bottle was made in a factory.
prompt.vi: Chai nhựa được làm ra trong nhà máy.
image.brief: Dùng lại hình `q4_bottle` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): plastic water bottle no label
image.alt.en: A bottle of water
image.alt.vi: Chai nước
answer: true
hint.en: Did the bottle ever grow?
hint.vi: Cái chai đã bao giờ lớn lên chưa?
explanation_correct.en: Yes! A plastic bottle was never alive.
explanation_correct.vi: Đúng rồi! Chai nhựa chưa từng sống.
explanation_wrong.en: This is true. People make bottles from plastic.
explanation_wrong.vi: Câu này đúng. Người ta làm chai bằng nhựa.
feedback_false.en: A bottle never grew like a plant.
feedback_false.vi: Cái chai chưa bao giờ lớn lên như cái cây.
> Rà chữ tester 14/11 (n11): câu cũ "People make plastic bottles." đổi để nối thẳng với câu q3 bài ba ("People made this bottle in a factory."). Ôn bài ba (vật chưa từng sống do người làm ra) bằng câu khẳng định, không dùng "never" · "chưa từng" trong câu hỏi (luật Explorer số năm). Chai nhựa nối sang ô Học "Rubbish" của bài này (chai nhựa vứt bừa là rác).

### w3
id: 4088504b-a892-4926-bac6-9d6f23a0e4c3
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan
prompt.en: A spider is an insect.
prompt.vi: Con nhện là côn trùng.
image.brief: Dùng lại hình `explore_spiders` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): garden orb spider web
image.alt.en: A spider in its web
image.alt.vi: Con nhện trên mạng tơ
answer: false
hint.en: Count the spider's legs.
hint.vi: Em đếm chân con nhện nhé.
explanation_correct.en: A spider has eight legs. It is not an insect.
explanation_correct.vi: Nhện có tám chân. Nhện không phải côn trùng.
explanation_wrong.en: This is false. Insects have six legs.
explanation_wrong.vi: Câu này sai. Côn trùng có sáu chân.
feedback_true.en: A spider has eight legs, not six.
feedback_true.vi: Nhện có tám chân, không phải sáu.
> Ôn câu q3 bài bảy chủ đề trước ("A spider has six legs.", Sai) bằng một câu khác. Đáp án Sai, giải thích khi đúng không mở đầu bằng "Yes!".

## Học

> Bốn ô: một mối đe doạ (rác), ba việc bé làm được (nhìn nhẹ nhàng rồi đặt lại, để một góc vườn tự nhiên, trồng hoa và đặt nước). Ô "Look gently" (chỗ tối, ẩm) và ô "Flowers and water" (chỗ nắng) cho thấy con vật nhỏ cần những chỗ khác nhau.

### explore
id: e87b0859-95fa-4ffa-8c46-dcb78bd5c989
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_rubbish
label.en: Rubbish
label.vi: Rác
color: nau_dat
sentence.en: Rubbish can trap and hurt tiny animals.
sentence.vi: Rác có thể làm con vật nhỏ mắc kẹt và bị thương.
image.brief: [ảnh] Vài chai nhựa trơn và túi ni lông bị vứt trên bãi cỏ dưới gốc cây, ảnh ngang; chai không có nhãn, không thấy chữ hay nhãn hiệu; không có người, không có con vật. Từ khoá tìm ảnh (EN): plastic litter on grass
image.alt.en: Plastic rubbish on the grass
image.alt.vi: Rác nhựa vứt trên cỏ
examples.1.en: put rubbish in the bin
examples.1.vi: bỏ rác vào thùng rác
examples.2.en: pick it up with a grown-up
examples.2.vi: nhặt rác cùng người lớn
examples.3.en: use fewer plastic bags
examples.3.vi: dùng ít túi ni lông hơn
> Hình gốc, dùng lại ở món Chơi, câu q1, từ `rubbish`. Ví dụ hai: nhặt rác luôn có người lớn (mảnh vỡ, vật sắc).

#### group explore_look
label.en: Look gently
label.vi: Nhìn nhẹ nhàng
color: cham
sentence.en: Look with a grown-up, then put it back.
sentence.vi: Em nhìn cùng người lớn, rồi đặt hòn đá lại chỗ cũ.
image.brief: Dùng lại hình `explore_stone` ở bài `sinh-vat-song-o-dau/nhung-noi-song-nho-xiu`. Từ khoá tìm ảnh (EN): under a rock soil insects worms
image.alt.en: Damp soil under a stone
image.alt.vi: Đất ẩm dưới hòn đá
examples.1.en: a grown-up lifts the stone slowly
examples.1.vi: người lớn nhấc hòn đá thật nhẹ
examples.2.en: look, but do not catch
examples.2.vi: chỉ nhìn, không bắt
examples.3.en: worms need it dark and damp
examples.3.vi: giun cần chỗ tối và ẩm
> Rà chữ tester 14/11 (N2): câu chính (câu app đọc trước, câu bé nhớ) có "cùng người lớn". Ví dụ một để người lớn nhấc đá, không phải bé (dưới đá có thể có rết, bọ cạp; không nói ra để khỏi doạ bé, ghi ở Ghi chú cho dev).

#### group explore_wild_corner
label.en: Wild corner
label.vi: Góc vườn tự nhiên
color: gi_dong
sentence.en: Leave some leaves and sticks for bugs.
sentence.vi: Để lại ít lá khô và cành cây cho côn trùng.
image.brief: [ảnh] Một góc vườn có cỏ mọc tự nhiên và một đống cành khô, lá khô xếp gọn dưới gốc cây, ảnh ngang; không có người, không có rác, không có lửa, không có chữ. Từ khoá tìm ảnh (EN): log pile wildlife garden corner
image.alt.en: A pile of sticks in a garden
image.alt.vi: Đống cành khô trong góc vườn
examples.1.en: a pile of sticks
examples.1.vi: một đống cành khô
examples.2.en: dry leaves under the trees
examples.2.vi: lá khô dưới gốc cây
examples.3.en: bamboo tubes for little bees
examples.3.vi: ống tre cho ong nhỏ làm tổ
> [CẦN KIỂM] Một số loài ong sống đơn độc làm tổ trong ống tre, ống sậy rỗng. Hình gốc, dùng lại ở món Chơi, câu q3, từ `protect`.

#### group explore_flowers
label.en: Flowers and water
label.vi: Hoa và nước
color: vang_hoe
sentence.en: Flowers help butterflies. Water helps birds.
sentence.vi: Hoa giúp bướm. Nước giúp chim.
image.brief: Dùng lại hình `tray_butterfly` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): butterfly on flower wings open
image.alt.en: A butterfly on a flower
image.alt.vi: Con bướm đậu trên hoa
examples.1.en: plant flowers in the sun
examples.1.vi: trồng hoa ở chỗ có nắng
examples.2.en: a dish of water for birds
examples.2.vi: một đĩa nước cho chim
examples.3.en: no bug spray in the garden
examples.3.vi: không phun thuốc sâu trong vườn
> Ví dụ một (hoa cần nắng, bướm thích nắng) đối lại ví dụ ba ô "Look gently" (giun cần chỗ tối, ẩm): ý chính ba.

### new_words
id: 43d2998a-beaf-4d58-9949-a3c8a96e91ee
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: protect, rubbish

## Chơi

> Bé chọn ba cách giúp con vật nhỏ: một chỗ trốn, một chỗ có nước, một luống hoa. Đạt khi đủ ba nhóm và không chọn việc gây hại.
> Món bẫy là việc gây hại do con người làm: vứt rác, đốt lá, phun thuốc sâu. Không có món "lũ lụt" (lũ không phải lỗi của bé hay của người).
> Kệ bảy món, toàn ảnh chụp; mỗi món là một vật (không có người làm việc đó trong ảnh).

### tray
id: 43476028-eb94-4273-9f56-cda7224826f5
type: build_tray
version: 1
prompt.en: Pick three ways to help tiny animals
prompt.vi: Chọn ba cách giúp con vật nhỏ
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find a hiding place, water and flowers.
messages.start.vi: Em tìm một chỗ trốn, một chỗ có nước và một luống hoa nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Now tiny animals have safe places.
messages.balanced.vi: Tuyệt! Giờ con vật nhỏ có chỗ ở an toàn.
messages.has_limited.en: That one harms tiny animals.
messages.has_limited.vi: Thứ này làm hại con vật nhỏ.
messages.missing.tray_hide.en: You still need a hiding place.
messages.missing.tray_hide.vi: Em còn thiếu một chỗ trốn.
messages.missing.tray_water.en: You still need some water.
messages.missing.tray_water.vi: Em còn thiếu một chỗ có nước.
messages.missing.tray_flowers.en: You still need some flowers.
messages.missing.tray_flowers.vi: Em còn thiếu một luống hoa.

#### group tray_hide
label.en: Hiding place
label.vi: Chỗ trốn
color: gi_dong
role: required

#### group tray_water
label.en: Water
label.vi: Nước
color: cham
role: required

#### group tray_flowers
label.en: Flowers
label.vi: Hoa
color: vang_hoe
role: required

#### group tray_harm
label.en: Harmful
label.vi: Gây hại
color: do_son
role: limit
> Nhãn `limit` gọi tên loại, như nhóm "Too big" bài sáu.

#### item tray_sticks
label.en: Pile of sticks
label.vi: Đống cành khô
group: tray_hide
image.brief: Dùng lại hình `explore_wild_corner`. Từ khoá tìm ảnh (EN): log pile wildlife garden corner
image.alt.en: A pile of sticks in a garden
image.alt.vi: Đống cành khô trong góc vườn

#### item tray_rubbish
label.en: Rubbish
label.vi: Rác nhựa
group: tray_harm
image.brief: Dùng lại hình `explore_rubbish`. Từ khoá tìm ảnh (EN): plastic litter on grass
image.alt.en: Plastic rubbish on the grass
image.alt.vi: Rác nhựa vứt trên cỏ

#### item tray_water_dish
label.en: Dish of water
label.vi: Đĩa nước
group: tray_water
image.brief: [ảnh] Một đĩa sành nông đựng nước trong đặt trên mặt đất trong vườn, có vài viên sỏi trong đĩa, chụp chếch từ trên xuống; không có người, không có chữ. Từ khoá tìm ảnh (EN): shallow water dish garden stones
image.alt.en: A dish of water in a garden
image.alt.vi: Đĩa nước trong vườn
> [CẦN KIỂM] Đặt vài viên sỏi trong đĩa để ong, bướm đậu uống mà không bị chìm. Hình gốc, dùng lại ở câu q1.

#### item tray_fire
label.en: Burning leaves
label.vi: Đốt lá khô
group: tray_harm
image.brief: [ảnh] Một đống lá khô nhỏ đang cháy, có khói, trên nền đất vườn, chụp từ xa vừa; không có người, không có nhà gần, không có cảnh cháy lớn, không có chữ. Từ khoá tìm ảnh (EN): burning pile of leaves smoke
image.alt.en: Dry leaves burning
image.alt.vi: Đống lá khô đang cháy
> Hình gốc, dùng lại ở từ `harm`. Lửa nhỏ, không đáng sợ.

#### item tray_flower_bed
label.en: Flower bed
label.vi: Luống hoa
group: tray_flowers
image.brief: [ảnh] Một luống hoa nhiều màu (hoa ngũ sắc, hoa cúc, hoa mười giờ) dưới nắng, ảnh ngang; không có người, không có biển, không có chữ. Từ khoá tìm ảnh (EN): colorful flower bed sunny garden
image.alt.en: A sunny flower bed
image.alt.vi: Luống hoa đầy nắng
> Hình gốc, dùng lại ở câu q1, câu q3.

#### item tray_spray
label.en: Bug spray
label.vi: Thuốc sâu
group: tray_harm
image.brief: [ảnh] Một bình phun thuốc bằng nhựa (loại bình bơm tay dùng trong vườn) đặt trên nền đất hoặc nền gạch, nhìn ngang; không có nhãn, không có chữ, không có hình đầu lâu, không có người. Từ khoá tìm ảnh (EN): garden pressure sprayer tank
image.alt.en: A garden spray tank
image.alt.vi: Bình phun thuốc trong vườn
> Ảnh khó: bình phun thuốc hay có nhãn hiệu; chọn ảnh không thấy chữ hoặc cắt bỏ.

#### item tray_tubes
label.en: Bamboo tubes
label.vi: Bó ống tre
group: tray_hide
image.brief: [ảnh] Một bó ống tre ngắn, cắt bằng, xếp nằm ngang, đầu ống rỗng hướng ra trước, treo hoặc đặt ở góc vườn, chụp gần; không có người, không có chữ. Từ khoá tìm ảnh (EN): bamboo tubes bee nest bundle
image.alt.en: A bundle of bamboo tubes
image.alt.vi: Bó ống tre
> [CẦN KIỂM] như ô "Wild corner" (ong đơn độc làm tổ trong ống tre). Hình gốc, dùng lại ở câu q3.

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1, q3, q5, q6; ba lựa chọn), `true_false` (q2, q4). Bài này không dùng `order_sequence`: các việc bảo vệ không có thứ tự tự nhiên.

### q1
id: 8e065059-5709-4bc5-9ba1-09a8cdbec813
format: single_choice
version: 1
dok: 1
prompt.en: Which one harms tiny animals?
prompt.vi: Cái nào làm hại con vật nhỏ?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Which one could trap a tiny animal?
hint.vi: Cái nào có thể làm con vật nhỏ mắc kẹt?
explanation_correct.en: Yes! Put rubbish in the bin.
explanation_correct.vi: Đúng rồi! Em bỏ rác vào thùng nhé.
explanation_wrong.en: The answer is the rubbish. It can hurt animals.
explanation_wrong.vi: Đáp án là rác. Rác có thể làm hại con vật.

#### option q1_flowers
correct: false
feedback.en: Flowers give food to butterflies.
feedback.vi: Hoa cho bướm thức ăn.
label.en: flower bed
label.vi: luống hoa
image.brief: Dùng lại hình `tray_flower_bed`. Từ khoá tìm ảnh (EN): colorful flower bed sunny garden
image.alt.en: A sunny flower bed
image.alt.vi: Luống hoa đầy nắng

#### option q1_rubbish
correct: true
label.en: rubbish
label.vi: rác nhựa
image.brief: Dùng lại hình `explore_rubbish`. Từ khoá tìm ảnh (EN): plastic litter on grass
image.alt.en: Plastic rubbish on the grass
image.alt.vi: Rác nhựa vứt trên cỏ

#### option q1_water_dish
correct: false
feedback.en: A dish of water helps animals drink.
feedback.vi: Đĩa nước giúp con vật có nước uống.
label.en: dish of water
label.vi: đĩa nước
image.brief: Dùng lại hình `tray_water_dish`. Từ khoá tìm ảnh (EN): shallow water dish garden stones
image.alt.en: A dish of water in a garden
image.alt.vi: Đĩa nước trong vườn

### q2
id: 0bf9cf24-df4e-4975-a08f-8dae41019bc2
format: true_false
version: 1
dok: 1
prompt.en: We put the stone back after looking.
prompt.vi: Xem xong, mình đặt hòn đá lại chỗ cũ.
image.brief: Dùng lại hình `explore_stone` ở bài `sinh-vat-song-o-dau/nhung-noi-song-nho-xiu`. Từ khoá tìm ảnh (EN): under a rock soil insects worms
image.alt.en: Damp soil under a stone
image.alt.vi: Đất ẩm dưới hòn đá
answer: true
hint.en: Remember the Look gently picture.
hint.vi: Em nhớ lại ô Nhìn nhẹ nhàng nhé.
explanation_correct.en: Yes! Tiny animals need their stone back.
explanation_correct.vi: Đúng rồi! Con vật nhỏ cần hòn đá để trốn.
explanation_wrong.en: This is true. Put the stone back gently.
explanation_wrong.vi: Câu này đúng. Em nhẹ nhàng đặt hòn đá lại.
feedback_false.en: Animals under the stone need it back.
feedback_false.vi: Con vật dưới hòn đá cần hòn đá che cho chúng.

### q3
id: 80994dda-1a11-43a7-8335-e8557a21600c
format: single_choice
version: 1
dok: 1
prompt.en: What helps butterflies?
prompt.vi: Cái gì giúp bướm?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Where do butterflies like to land?
hint.vi: Bướm thích đậu ở đâu?
explanation_correct.en: Yes! Butterflies drink sweet juice from flowers.
explanation_correct.vi: Đúng rồi! Bướm hút mật ngọt từ hoa.
explanation_wrong.en: The answer is the flower bed. Butterflies visit flowers.
explanation_wrong.vi: Đáp án là luống hoa. Bướm hay bay tới hoa.

#### option q3_tubes
correct: false
feedback.en: Bamboo tubes are a home for bees.
feedback.vi: Bó ống tre là chỗ ở cho ong.
label.en: bamboo tubes
label.vi: bó ống tre
image.brief: Dùng lại hình `tray_tubes`. Từ khoá tìm ảnh (EN): bamboo tubes bee nest bundle
image.alt.en: A bundle of bamboo tubes
image.alt.vi: Bó ống tre

#### option q3_sticks
correct: false
feedback.en: A pile of sticks hides millipedes and snails.
feedback.vi: Đống cành khô là chỗ trốn của cuốn chiếu, ốc sên.
label.en: pile of sticks
label.vi: đống cành khô
image.brief: Dùng lại hình `explore_wild_corner`. Từ khoá tìm ảnh (EN): log pile wildlife garden corner
image.alt.en: A pile of sticks in a garden
image.alt.vi: Đống cành khô trong góc vườn

#### option q3_flowers
correct: true
label.en: flower bed
label.vi: luống hoa
image.brief: Dùng lại hình `tray_flower_bed`. Từ khoá tìm ảnh (EN): colorful flower bed sunny garden
image.alt.en: A sunny flower bed
image.alt.vi: Luống hoa đầy nắng
> Rà chữ tester 14/11 (N3): ba lựa chọn nay đều là việc tốt, mỗi việc giúp một con khác nhau (ô Học: hoa với bướm, ống tre với ong, đống cành với con vật trốn), để bé phải nhớ ô Học, không chọn theo cảm giác "cái nào trông tốt" như câu q1. Không lấy đĩa nước làm lựa chọn sai (đĩa nước cũng giúp bướm uống). Ba món bé vừa gặp ở kệ Chơi.

### q4
id: 01964b44-77ad-4ec1-b488-7cd848aadc5d
format: true_false
version: 1
dok: 2
prompt.en: Burning dry leaves helps tiny animals.
prompt.vi: Đốt lá khô giúp con vật nhỏ.
image.brief: Dùng lại hình `explore_leaves` ở bài `sinh-vat-song-o-dau/nhung-noi-song-nho-xiu`. Từ khoá tìm ảnh (EN): pile of dry leaves under tree
image.alt.en: A pile of dry leaves
image.alt.vi: Đống lá khô dưới gốc cây
answer: false
hint.en: Who lives in piles of dry leaves?
hint.vi: Ai sống trong đống lá khô?
explanation_correct.en: Fire burns the places where tiny animals hide.
explanation_correct.vi: Lửa đốt mất chỗ trốn của con vật nhỏ.
explanation_wrong.en: This is false. Fire harms tiny animals.
explanation_wrong.vi: Câu này sai. Lửa làm hại con vật nhỏ.
feedback_true.en: Millipedes and snails hide in dry leaves.
feedback_true.vi: Cuốn chiếu và ốc sên trốn trong lá khô.
> DOK 2: nối hai bài (đống lá khô là nơi sống nhỏ ở bài sáu) để đánh giá một việc quen ở làng quê. Hình là đống lá chưa đốt (không có lửa, không làm bằng chứng). Đáp án Sai, giải thích khi đúng không mở đầu bằng "Yes!".

### q5
id: 9af07053-08f8-492f-928c-f0d8d9651000
format: single_choice
version: 1
dok: 2
prompt.en: Which one needs a dark, damp place?
prompt.vi: Con nào cần chỗ tối và ẩm?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for soft, wet skin.
hint.vi: Em tìm con có da mềm và ướt nhé.
explanation_correct.en: Yes! Sun and wind dry out its skin.
explanation_correct.vi: Đúng rồi! Nắng và gió làm da giun khô đi.
explanation_wrong.en: The answer is the earthworm. It likes damp soil.
explanation_wrong.vi: Đáp án là giun đất. Giun thích đất ẩm.
> DOK 2: nối nhu cầu (tối, ẩm) với con vật. `alt` của ảnh giun sửa thành "An earthworm" · "Con giun đất" để VoiceOver không đọc chữ "damp" của đáp án. [CẦN KIỂM] Giun đất thở qua da ẩm, da khô thì giun khó sống.

#### option q5_butterfly
correct: false
feedback.en: A butterfly likes sunny flowers.
feedback.vi: Bướm thích hoa đầy nắng.
label.en: butterfly
label.vi: con bướm
image.brief: Dùng lại hình `tray_butterfly` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): butterfly on flower wings open
image.alt.en: A butterfly on a flower
image.alt.vi: Con bướm đậu trên hoa

#### option q5_earthworm
correct: true
label.en: earthworm
label.vi: giun đất
image.brief: Dùng lại hình `earthworm` ở bài `da-va-dat/the-nao-la-dat-tot`. Từ khoá tìm ảnh (EN): earthworm on moist soil close up
image.alt.en: An earthworm
image.alt.vi: Con giun đất
> Rà chữ tester 14/11 (N5, phương án a): ô này cắt sát con giun, nền đất chỉ còn một dải mờ, không thấy rõ đất ướt (ảnh không nói sẵn chữ "ẩm" của câu hỏi). Mục riêng có `crop` riêng, không `same_as` với các chỗ dùng ảnh giun khác.

#### option q5_sparrow
correct: false
feedback.en: A sparrow flies in the bright sky.
feedback.vi: Chim sẻ bay trên bầu trời sáng.
label.en: sparrow
label.vi: chim sẻ
image.brief: Dùng lại hình `tray_sparrow` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): Eurasian tree sparrow perched branch
image.alt.en: A sparrow on a branch
image.alt.vi: Chim sẻ đậu trên cành

### q6
id: ead12d8a-095d-45fc-bb0c-4ab1afa61c3b
format: single_choice
version: 1
dok: 2
misconception: tiny_animals_same_place
prompt.en: Which one likes to sit in the sun?
prompt.vi: Con nào thích nằm phơi nắng?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for dry, scaly skin.
hint.vi: Em tìm con có da khô, có vảy nhé.
explanation_correct.en: Yes! A lizard warms up in the sun.
explanation_correct.vi: Đúng rồi! Thằn lằn phơi nắng cho ấm người.
explanation_wrong.en: The answer is the lizard. It likes sun.
explanation_wrong.vi: Đáp án là thằn lằn. Thằn lằn thích nắng.
> Câu misconception (`tiny_animals_same_place`), bằng hình: hai lựa chọn sai là con vật nhỏ thích chỗ tối, ẩm (giun, cuốn chiếu); bé nghĩ "con vật nhỏ nào cũng thích chỗ tối, ẩm" sẽ lúng túng, không chọn được con thích nắng. Không dùng con bướm làm đáp án vì ảnh bướm đậu trên hoa gần như nói thẳng chữ "hoa, nắng".
> DOK 2: so nhu cầu của ba con vật nhỏ. Ba con bé đều đã gặp (thằn lằn và cuốn chiếu ở chủ đề trước, giun ở bài sáu); ô "On a tree trunk" bài sáu có ví dụ "a lizard in the sun".
> [CẦN KIỂM] Thằn lằn bóng phơi nắng để cơ thể ấm lên (bò sát).

#### option q6_lizard
correct: true
label.en: lizard
label.vi: thằn lằn
image.brief: Dùng lại hình `w3_lizard` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): common sun skink Eutropis multifasciata on rock
image.alt.en: A lizard on a rock
image.alt.vi: Con thằn lằn trên hòn đá

#### option q6_earthworm
correct: false
feedback.en: An earthworm hides from the sun.
feedback.vi: Giun đất trốn nắng.
label.en: earthworm
label.vi: giun đất
image.brief: Dùng lại hình `earthworm` ở bài `da-va-dat/the-nao-la-dat-tot`. Từ khoá tìm ảnh (EN): earthworm on moist soil close up
image.alt.en: An earthworm on damp soil
image.alt.vi: Con giun đất trên đất ẩm

#### option q6_millipede
correct: false
feedback.en: A millipede likes damp, shady leaves.
feedback.vi: Cuốn chiếu thích lá ẩm, chỗ râm.
label.en: millipede
label.vi: cuốn chiếu
image.brief: Dùng lại hình `explore_millipedes` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): millipede on dry leaves side view
image.alt.en: A millipede on dry leaves
image.alt.vi: Con cuốn chiếu trên lá khô

## Từ vựng

### protect
id: 25862d57-45b6-45e6-af83-e3c1363d9481
tier: core
term.en: protect
term.vi: bảo vệ
example.en: We protect tiny habitats.
example.vi: Mình bảo vệ những nơi sống nhỏ xíu.
image.brief: Dùng lại hình `explore_wild_corner`. Từ khoá tìm ảnh (EN): log pile wildlife garden corner
image.alt.en: A pile of sticks in a garden
image.alt.vi: Đống cành khô trong góc vườn

### rubbish
id: 61b72810-122f-4bd8-a860-90108216732b
tier: core
term.en: rubbish
term.vi: rác
example.en: Put rubbish in the bin.
example.vi: Em bỏ rác vào thùng rác.
image.brief: Dùng lại hình `explore_rubbish`. Từ khoá tìm ảnh (EN): plastic litter on grass
image.alt.en: Plastic rubbish on the grass
image.alt.vi: Rác nhựa vứt trên cỏ

### garden
id: cd3fc705-b6bb-4b0a-9261-5865af5f5586
tier: extra
term.en: garden
term.vi: khu vườn
example.en: Bugs and birds visit the garden.
example.vi: Côn trùng và chim ghé thăm khu vườn.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn

### harm
id: dc90c90a-cde1-487f-b7bf-0a852d911561
tier: extra
term.en: harm
term.vi: làm hại
example.en: Smoke can harm tiny animals.
example.vi: Khói có thể làm hại con vật nhỏ.
image.brief: Dùng lại hình `tray_fire`. Từ khoá tìm ảnh (EN): burning pile of leaves smoke
image.alt.en: Dry leaves burning
image.alt.vi: Đống lá khô đang cháy

## Thưởng

### firefly_card
id: bb7a0fb4-284d-4fe1-bb04-0ed6fbd92c99
set: living_things
rarity: rare
name.en: Firefly
name.vi: Đom đóm
tag.en: A tiny light at night
tag.vi: Ngọn đèn nhỏ trong đêm
fact.en: A firefly makes its own light at night.
fact.vi: Đom đóm tự phát ra ánh sáng vào ban đêm.
image.brief: [ảnh] Một con đom đóm đậu trên lá, chụp gần ban ngày, thấy rõ phần đuôi màu vàng nhạt (chỗ phát sáng); ảnh vuông được; không có tay người, không có chữ. Từ khoá tìm ảnh (EN): firefly on leaf close up
image.alt.en: A firefly on a leaf
image.alt.vi: Con đom đóm trên lá
> [CẦN KIỂM] Đom đóm phát sáng ở cuối bụng; đom đóm cần chỗ tối, sạch, ẩm, ít đèn và ít thuốc sâu (biên tập nhớ là đom đóm ít dần ở nơi nhiều đèn, nhiều thuốc sâu; thẻ không nói ý này). Thẻ khép chủ đề: một con vật nhỏ cần nơi sống được giữ gìn.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Ảnh mới chọn ảnh ngang (thẻ ba lựa chọn 5:2); món Chơi cắt vuông được.
- **Ảnh cần tìm (tám):** rác nhựa trên cỏ (Học); góc vườn có đống cành khô; đĩa nước có sỏi; đống lá nhỏ đang cháy; luống hoa nhiều màu dưới nắng; bình phun thuốc không nhãn; bó ống tre; đom đóm (thẻ).
- **Ảnh khó:** rác nhựa không thấy nhãn hiệu (chọn ảnh xa vừa, hoặc làm mờ nhãn); bình phun thuốc không nhãn; bó ống tre cho ong (nhiều ảnh "khách sạn côn trùng" châu Âu có khung gỗ, biển chữ; chọn ảnh chỉ thấy bó ống tre); đom đóm ban ngày nét. Không có ảnh hợp lệ thì designer báo để đổi món, không vẽ lẻ một hình giữa các ảnh.
- **Lửa:** đống lá nhỏ, khói nhẹ, không thấy nhà, cây cháy hay người.
- **Câu q5, ô `q5_earthworm`** (rà chữ tester 14/11 N5): cắt sát con giun, nền đất chỉ còn một dải mờ, không thấy rõ đất ướt; mục riêng có `crop` riêng.
- **Câu q3** (rà chữ tester 14/11 N3): ba thẻ là bó ống tre, đống cành khô, luống hoa (bỏ lửa, bình phun thuốc); hai ảnh lửa và bình phun thuốc chỉ còn ở kệ Chơi (lửa còn ở từ `harm`).
- **Dùng lại:** bài sáu (`explore_stone`, `explore_leaves`); chủ đề *Gọi tên và nhóm động vật* (`w1`, `explore_spiders`, `tray_butterfly`, `explore_millipedes`); *Khủng long* (`w3_lizard`); *Đá và đất* (`earthworm`); *Hô hấp* (`q4` rạn san hô, `q4_bottle`, `tray_sparrow`).
- **Màu:** Học: rác `nau_dat`, nhìn nhẹ nhàng `cham`, góc vườn tự nhiên `gi_dong`, hoa và nước `vang_hoe`. Chơi: chỗ trốn `gi_dong`, nước `cham`, hoa `vang_hoe`, gây hại `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (protect, rubbish). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Đúng, w3 Sai). Quiz `single_choice` (q1, q3, q5, q6), `true_false` (q2 Đúng, q4 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`tiny_animals_same_place`).
- **Vị trí đáp án đúng:** w1 thứ nhất; q1 thứ hai; q3 thứ ba; q5 thứ hai; q6 thứ nhất.
- **Màn Chơi, ví dụ để kiểm:** Đống cành khô, Đĩa nước, Luống hoa → `balanced`; Bó ống tre, Đĩa nước, Đốt lá khô → `has_limited`; Đống cành khô, Bó ống tre, Luống hoa → `missing.tray_water`.
- **An toàn (cho người duyệt, không vào chữ bé nghe):** dưới đá, đống lá có thể có rết, bọ cạp, rắn; vì vậy mọi lời rủ quan sát đều kèm "đi cùng người lớn", và không câu nào bảo bé tự lật đá.
- **Từ EN có thể ngoài Starters/Movers:** protect, rubbish, harm, habitat, bug spray, bamboo tubes, firefly, scaly, damp, grown-up.
