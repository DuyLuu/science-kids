---
id: bd2867fe-1a4c-450a-b5ab-7d28a5d6679b
topic: sinh-vat-song-o-dau
slug: nhung-noi-song-nho-xiu
order: 6
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Plants and animals in microhabitats
vi: Những nơi sống nhỏ xíu
> Giữ đúng tên ở `content/syllabus.json` (bài số sáu). Tên EN dài là tên bài trong danh mục; chữ cho bé dùng "tiny habitat" · "nơi sống nhỏ xíu", từ "microhabitat" chỉ ở từ vựng.

## Mục tiêu
en: I can find life in tiny habitats.
vi: Em tìm được cây và con vật ở những nơi sống nhỏ xíu.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 14/11/2026. Mọi dòng `id:` để trống; chạy `ids` sau bài năm.
> Nơi sống nhỏ quen với trẻ Việt Nam: dưới hòn đá, trong đống lá khô, trên thân cây, trên bức tường cũ. Không dùng vũng nước trên đá ven biển và khúc gỗ mục làm ô Học (hai ví dụ chính của nguồn tham khảo), không coi cái ao là nơi sống nhỏ (sườn `[CẦN KIỂM]`: ranh giới mơ hồ; ở đây cái ao là nơi sống "vừa" trong câu q5).
> Sửa `small_animals_are_insects` ở phần Chơi (ba nhóm chân) và câu q6 (gắn key).
> **An toàn:** lời cho bé chỉ rủ nhìn, không rủ lật đá hay bắt con vật; ảnh không có rết, bọ cạp, rắn. Lời dặn "đi cùng người lớn, xem xong đặt đá lại" ở bài bảy.

## Ý chính
1.en: Worms and ants hide under stones.
1.vi: Giun và kiến trốn dưới hòn đá.
2.en: Moss grows on old, damp walls.
2.vi: Rêu mọc trên bức tường cũ và ẩm.
3.en: These small places are tiny habitats.
3.vi: Những chỗ nhỏ như vậy là nơi sống nhỏ xíu.
> Từ cụ thể tới trừu tượng: con vật nhỏ ở một chỗ cụ thể, cây nhỏ ở một chỗ cụ thể, rồi tên chung của những chỗ đó.

## Khởi động

> Ba câu: w1 ôn bài năm (bài trước), w2 ôn bài bốn, w3 ôn bài bảy chủ đề *Gọi tên và nhóm động vật* (sáu chân, dùng ở kệ Chơi hôm nay).

### w1
id: 346ce977-d308-47f5-a7c3-0d02b49ef598
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/noi-song-cua-cay
prompt.en: Which plant likes dry, sunny sand?
prompt.vi: Cây nào thích cát khô, nhiều nắng?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for one with spines.
hint.vi: Em tìm cây có gai nhé.
explanation_correct.en: Yes! A cactus keeps water in its stem.
explanation_correct.vi: Đúng rồi! Xương rồng giữ nước trong thân.
explanation_wrong.en: The answer is the cactus. It needs little water.
explanation_wrong.vi: Đáp án là cây xương rồng. Xương rồng cần ít nước.

#### option w1_lotus
correct: false
feedback.en: A lotus needs a wet pond.
feedback.vi: Hoa sen cần ao nước.
label.en: lotus
label.vi: hoa sen
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao

#### option w1_cactus
correct: true
label.en: cactus
label.vi: xương rồng
image.brief: Dùng lại hình `explore_dry_plants` ở bài `sinh-vat-song-o-dau/noi-song-cua-cay`. Từ khoá tìm ảnh (EN): cactus on sand dunes Vietnam
image.alt.en: A cactus on the sand
image.alt.vi: Cây xương rồng trên cát
> Ảnh xương rồng thấy cát (bằng chứng nhẹ); chấp nhận vì đây là câu nhớ lại DOK 1, và ảnh sen cũng thấy nước ao.

### w2
id: f57293be-e590-4fd8-821f-719a447b275b
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/noi-song-cua-con-vat
prompt.en: A starfish lives in a pond.
prompt.vi: Sao biển sống ở ao.
image.brief: Dùng lại hình `explore_spiny` ở bài `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien`. Từ khoá tìm ảnh (EN): starfish on rock tide pool
image.alt.en: A starfish on a rock
image.alt.vi: Con sao biển trên tảng đá
answer: false
hint.en: Where did you see a starfish?
hint.vi: Em đã thấy sao biển ở ô nào?
explanation_correct.en: A starfish needs the salty sea.
explanation_correct.vi: Sao biển cần nước biển mặn.
explanation_wrong.en: This is false. A starfish lives in the sea.
explanation_wrong.vi: Câu này sai. Sao biển sống ở biển.
feedback_true.en: Pond water is fresh, not salty.
feedback_true.vi: Nước ao là nước ngọt, không mặn.

### w3
id: 26f20c28-282e-4e4d-b148-3b014e5dd420
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan
prompt.en: An ant has six legs.
prompt.vi: Con kiến có sáu chân.
image.brief: Dùng lại hình `tray_ant` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): weaver ant on leaf close up
image.alt.en: An ant on a leaf
image.alt.vi: Con kiến trên lá
answer: true
hint.en: Count the legs you can see.
hint.vi: Em đếm số chân em nhìn thấy nhé.
explanation_correct.en: Yes! An ant is an insect.
explanation_correct.vi: Đúng rồi! Kiến là côn trùng.
explanation_wrong.en: This is true. Insects have six legs.
explanation_wrong.vi: Câu này đúng. Côn trùng có sáu chân.
feedback_false.en: An ant has three legs on each side.
feedback_false.vi: Mỗi bên thân kiến có ba chân.
> Câu đếm trên ảnh (DOK 1, quan sát), như câu q3 bài bảy chủ đề trước; chuẩn bị cho kệ Chơi và câu q6.

## Học

> Bốn ô, mỗi ô một nơi sống nhỏ quanh nhà và trường; mỗi ô có cả con vật lẫn cây nhỏ khi có thể (rêu, dương xỉ nhỏ).

### explore
id: a878e1bc-7407-4427-9cda-09ee9d3e3d61
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_stone
label.en: Under a stone
label.vi: Dưới hòn đá
color: nau_dat
sentence.en: Worms and ants hide under a stone.
sentence.vi: Giun và kiến trốn dưới hòn đá.
image.brief: [ảnh] Mặt đất ẩm ngay chỗ một hòn đá vừa được nhấc lên: đất sẫm màu, vài con kiến hoặc giun, rễ cỏ nhỏ, thấy mép hòn đá ở rìa ảnh, ảnh ngang; không có người, không có tay, không có chữ; không có rết, bọ cạp, rắn. Từ khoá tìm ảnh (EN): under a rock soil insects worms
image.alt.en: Damp soil under a stone
image.alt.vi: Đất ẩm dưới hòn đá
examples.1.en: it is dark and damp
examples.1.vi: chỗ đó tối và ẩm
examples.2.en: an earthworm
examples.2.vi: con giun đất
examples.3.en: a millipede
examples.3.vi: con cuốn chiếu
> Hình gốc, dùng lại ở câu q1, câu q5, từ `microhabitat`, và bài bảy.

#### group explore_leaves
label.en: In dry leaves
label.vi: Trong đống lá khô
color: vang_hoe
sentence.en: Millipedes hide in piles of dry leaves.
sentence.vi: Cuốn chiếu trốn trong đống lá khô.
image.brief: [ảnh] Một đống lá khô nâu dưới gốc cây trong vườn, ảnh ngang, chụp tầm thấp; không có con vật lớn, không có người, không có rác, không có lửa, không có chữ. Từ khoá tìm ảnh (EN): pile of dry leaves under tree
image.alt.en: A pile of dry leaves
image.alt.vi: Đống lá khô dưới gốc cây
examples.1.en: the leaves keep the soil damp
examples.1.vi: lá giữ cho đất ẩm
examples.2.en: a snail after rain
examples.2.vi: con ốc sên sau cơn mưa
examples.3.en: an earthworm, too
examples.3.vi: cả con giun đất nữa
> [CẦN KIỂM] Cuốn chiếu, ốc sên, giun đất, dế hay trú trong lớp lá mục ẩm. Ô này không nhắc con dế, để câu q4 (dế) là suy luận, không phải nhớ lại. Lá khô là vật "đã chết" của bài ba, nay là chỗ trốn của vật đang sống. Hình gốc, bài bảy dùng lại.

#### group explore_trunk
label.en: On a tree trunk
label.vi: Trên thân cây
color: gi_dong
sentence.en: Ants walk up and down tree trunks.
sentence.vi: Kiến bò lên bò xuống thân cây.
image.brief: [ảnh] Một hàng kiến bò trên vỏ thân cây sần sùi, chụp gần, ảnh ngang (cắt một đoạn vỏ cây nằm ngang khung); không có người, không có chữ. Từ khoá tìm ảnh (EN): ants trail on tree bark
image.alt.en: Ants on a tree trunk
image.alt.vi: Kiến bò trên thân cây
examples.1.en: moss on the bark
examples.1.vi: rêu trên vỏ cây
examples.2.en: beetles under the bark
examples.2.vi: bọ cánh cứng dưới lớp vỏ
examples.3.en: a lizard in the sun
examples.3.vi: thằn lằn phơi nắng
> [CẦN KIỂM] Bọ cánh cứng sống dưới vỏ cây; thằn lằn bóng hay phơi nắng trên thân cây, bờ tường (ví dụ ba chuẩn bị câu q6 bài bảy).

#### group explore_wall
label.en: On an old wall
label.vi: Trên bức tường cũ
color: cham
sentence.en: Moss and tiny ferns grow on old walls.
sentence.vi: Rêu và dương xỉ nhỏ mọc trên tường cũ.
image.brief: [ảnh] Một đoạn tường gạch cũ phủ rêu xanh, có vài cây dương xỉ nhỏ mọc ở khe gạch, ảnh ngang; không có cửa, không có biển, không có người, không có chữ hay hình vẽ trên tường. Từ khoá tìm ảnh (EN): old brick wall moss small ferns
image.alt.en: Moss on an old wall
image.alt.vi: Rêu trên bức tường cũ
examples.1.en: moss likes damp places
examples.1.vi: rêu thích chỗ ẩm
examples.2.en: a spider in a crack
examples.2.vi: con nhện trong khe tường
examples.3.en: a gecko on the wall
examples.3.vi: thạch sùng trên tường
> Hình gốc, dùng lại ở câu q2, từ `moss`.

### new_words
id: 31f2248a-d355-44b2-a86e-0c31aca17f20
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: microhabitat, earthworm

## Chơi

> Bé chọn ba con vật nhỏ xíu có số chân khác nhau: một con sáu chân, một con tám chân, một con không có chân. Đạt khi đủ ba nhóm và không chọn con vật quá to.
> Dùng ngay ý của bài: con vật nhỏ ở nơi sống nhỏ không phải con nào cũng là côn trùng (nhện tám chân, giun không có chân). Món bẫy là con vật to (trâu, voi, voọc) không chui vào được nơi sống nhỏ.
> Kệ bảy món, toàn ảnh chụp.

### tray
id: bd1a0641-3930-4d75-b032-627e84ed70e7
type: build_tray
version: 1
prompt.en: Pick three tiny animals
prompt.vi: Chọn ba con vật nhỏ xíu
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find six legs, eight legs and no legs.
messages.start.vi: Em tìm một con sáu chân, một con tám chân, một con không có chân nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Tiny animals come in many kinds.
messages.balanced.vi: Tuyệt! Con vật nhỏ xíu có nhiều loại khác nhau.
messages.has_limited.en: That one is too big for here.
messages.has_limited.vi: Con này quá to, không ở được chỗ nhỏ xíu.
messages.missing.tray_six.en: You still need one with six legs.
messages.missing.tray_six.vi: Em còn thiếu một con sáu chân.
messages.missing.tray_eight.en: You still need one with eight legs.
messages.missing.tray_eight.vi: Em còn thiếu một con tám chân.
messages.missing.tray_none.en: You still need one with no legs.
messages.missing.tray_none.vi: Em còn thiếu một con không có chân.

#### group tray_six
label.en: Six legs
label.vi: Sáu chân
color: vang_hoe
role: required

#### group tray_eight
label.en: Eight legs
label.vi: Tám chân
color: nau_dat
role: required

#### group tray_none
label.en: No legs
label.vi: Không có chân
color: cham
role: required

#### group tray_big
label.en: Too big
label.vi: Quá to
color: do_son
role: limit
> Nhãn `limit` gọi tên loại ("Too big"), theo cách bài bảy, tám chủ đề trước ("Has a backbone").

#### item tray_ant
label.en: Ant
label.vi: Con kiến
group: tray_six
image.brief: Dùng lại hình `tray_ant` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): weaver ant on leaf close up
image.alt.en: An ant on a leaf
image.alt.vi: Con kiến trên lá

#### item tray_buffalo
label.en: Buffalo
label.vi: Con trâu
group: tray_big
image.brief: Dùng lại hình `explore_plants` ở bài `goi-ten-va-nhom-dong-vat/con-vat-an-gi`. Từ khoá tìm ảnh (EN): water buffalo grazing grass field
image.alt.en: A buffalo eating grass
image.alt.vi: Con trâu gặm cỏ

#### item tray_earthworm
label.en: Earthworm
label.vi: Giun đất
group: tray_none
image.brief: Dùng lại hình `earthworm` ở bài `da-va-dat/the-nao-la-dat-tot`. Từ khoá tìm ảnh (EN): earthworm on moist soil close up
image.alt.en: An earthworm on damp soil
image.alt.vi: Con giun đất trên đất ẩm

#### item tray_spider
label.en: Spider
label.vi: Con nhện
group: tray_eight
image.brief: Dùng lại hình `explore_spiders` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): garden orb spider web
image.alt.en: A spider in its web
image.alt.vi: Con nhện trên mạng tơ

#### item tray_cricket
label.en: Cricket
label.vi: Con dế
group: tray_six
image.brief: [ảnh] Một con dế mèn nâu đen đứng trên mặt đất, nhìn ngang, thấy rõ sáu chân và đôi râu dài; không có tay người, không có lá khô (để không trùng ảnh ô Học), không có chữ. Từ khoá tìm ảnh (EN): field cricket on ground side view
image.alt.en: A cricket on the ground
image.alt.vi: Con dế trên mặt đất
> Hình gốc, dùng lại ở câu q4, từ `cricket`, thẻ thưởng.

#### item tray_elephant
label.en: Elephant
label.vi: Con voi
group: tray_big
image.brief: Dùng lại hình `explore_big_small` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): Asian elephant standing in water
image.alt.en: An elephant in the water
image.alt.vi: Con voi dưới nước

#### item tray_douc
label.en: Douc
label.vi: Con voọc
group: tray_big
image.brief: Dùng lại hình `explore_wild` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): red-shanked douc langur tree
image.alt.en: A douc in a tree
image.alt.vi: Con voọc trên cây

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q3, q4; ba lựa chọn), `true_false` (q2, q6), `order_sequence` (q5).

### q1
id: 1cb35e2c-1e41-4b25-84a3-466f0b18c062
format: single_choice
version: 1
dok: 1
prompt.en: Which one is a tiny habitat?
prompt.vi: Đâu là một nơi sống nhỏ xíu?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Which place is the smallest?
hint.vi: Nơi nào nhỏ nhất?
explanation_correct.en: Yes! Many tiny animals live under stones.
explanation_correct.vi: Đúng rồi! Nhiều con vật nhỏ sống dưới hòn đá.
explanation_wrong.en: The answer is under a stone. It is tiny.
explanation_wrong.vi: Đáp án là chỗ dưới hòn đá. Chỗ đó rất nhỏ.
> Hai lựa chọn sai là hai nơi sống lớn của bài bốn (biển, rừng), không phải sa mạc như câu của nguồn tham khảo.

#### option q1_sea
correct: false
feedback.en: The sea is a huge habitat.
feedback.vi: Biển là một nơi sống rất rộng.
label.en: sea
label.vi: biển
image.brief: Dùng lại hình `q4` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): coral reef underwater fish NOAA
image.alt.en: A coral reef under the sea
image.alt.vi: Rạn san hô dưới biển

#### option q1_forest
correct: false
feedback.en: A forest is a big habitat.
feedback.vi: Rừng là một nơi sống lớn.
label.en: forest
label.vi: khu rừng
image.brief: Dùng lại hình `tray_forest` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): forest green canopy aerial
image.alt.en: A green forest
image.alt.vi: Khu rừng xanh

#### option q1_stone
correct: true
label.en: under a stone
label.vi: dưới hòn đá
image.brief: Dùng lại hình `explore_stone`. Từ khoá tìm ảnh (EN): under a rock soil insects worms
image.alt.en: Damp soil under a stone
image.alt.vi: Đất ẩm dưới hòn đá

### q2
id: 88d07d0f-9680-429b-9fba-2707aa2f1b61
format: true_false
version: 1
dok: 1
prompt.en: A spider can live on an old wall.
prompt.vi: Con nhện sống được trên bức tường cũ.
image.brief: Dùng lại hình `explore_wall`. Từ khoá tìm ảnh (EN): old brick wall moss small ferns
image.alt.en: Moss on an old wall
image.alt.vi: Rêu trên bức tường cũ
answer: true
hint.en: Remember the On an old wall picture.
hint.vi: Em nhớ lại ô Trên bức tường cũ nhé.
explanation_correct.en: Yes! Spiders hide in cracks in old walls.
explanation_correct.vi: Đúng rồi! Nhện trốn trong khe tường cũ.
explanation_wrong.en: This is true. Spiders live in wall cracks.
explanation_wrong.vi: Câu này đúng. Nhện sống trong khe tường.
feedback_false.en: Spiders make webs in cracks in walls.
feedback_false.vi: Nhện giăng tơ trong khe tường.
> Ảnh bức tường không có nhện (không làm bằng chứng); là nơi được nói tới.

### q3
id: 11aa4b1d-4b24-4591-bf16-d8bc438fcddc
format: single_choice
version: 1
dok: 1
prompt.en: Which animal lives under a stone?
prompt.vi: Con nào sống dưới hòn đá?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Which one is small enough to hide?
hint.vi: Con nào đủ nhỏ để trốn dưới đá?
explanation_correct.en: Yes! Earthworms like dark, damp soil.
explanation_correct.vi: Đúng rồi! Giun đất thích đất tối và ẩm.
explanation_wrong.en: The answer is the earthworm. It is tiny.
explanation_wrong.vi: Đáp án là con giun đất. Giun rất nhỏ.

#### option q3_buffalo
correct: false
feedback.en: A buffalo is far too big.
feedback.vi: Con trâu quá to.
label.en: buffalo
label.vi: con trâu
image.brief: Dùng lại hình `explore_plants` ở bài `goi-ten-va-nhom-dong-vat/con-vat-an-gi`. Từ khoá tìm ảnh (EN): water buffalo grazing grass field
image.alt.en: A buffalo eating grass
image.alt.vi: Con trâu gặm cỏ

#### option q3_earthworm
correct: true
label.en: earthworm
label.vi: giun đất
image.brief: Dùng lại hình `earthworm` ở bài `da-va-dat/the-nao-la-dat-tot`. Từ khoá tìm ảnh (EN): earthworm on moist soil close up
image.alt.en: An earthworm on damp soil
image.alt.vi: Con giun đất trên đất ẩm

#### option q3_carp
correct: false
feedback.en: A carp needs water to swim in.
feedback.vi: Cá chép cần nước để bơi.
label.en: carp
label.vi: cá chép
image.brief: Dùng lại hình `explore_fish` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): common carp swimming underwater side view
image.alt.en: A carp swimming
image.alt.vi: Con cá chép đang bơi

### q4
id: 43061e30-07ff-4758-a4a1-ee490d4bdc0c
format: single_choice
version: 1
dok: 2
prompt.en: Which one could live in dry leaves?
prompt.vi: Con nào sống được trong đống lá khô?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: It must be tiny and live on land.
hint.vi: Con đó phải nhỏ xíu và sống trên cạn.
explanation_correct.en: Yes! Crickets hide in leaves and grass.
explanation_correct.vi: Đúng rồi! Dế trốn trong lá khô và bụi cỏ.
explanation_wrong.en: The answer is the cricket. It is tiny.
explanation_wrong.vi: Đáp án là con dế. Dế nhỏ xíu.
> DOK 2: hai điều kiện cùng lúc (nhỏ, sống trên cạn). Cá rô đồng nhỏ nhưng cần nước; cò sống trên cạn nhưng quá to. Ảnh dế đứng trên đất, không có lá khô (không làm bằng chứng). Ba con bé đều đã gặp (dế ở kệ Chơi hôm nay).

#### option q4_cricket
correct: true
label.en: cricket
label.vi: con dế
image.brief: Dùng lại hình `tray_cricket`. Từ khoá tìm ảnh (EN): field cricket on ground side view
image.alt.en: A cricket on the ground
image.alt.vi: Con dế trên mặt đất

#### option q4_perch
correct: false
feedback.en: A climbing perch needs water to live.
feedback.vi: Cá rô đồng cần nước để sống.
label.en: climbing perch
label.vi: cá rô đồng
image.brief: Dùng lại hình `tray_perch` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): climbing perch Anabas testudineus live
image.alt.en: A climbing perch in water
image.alt.vi: Cá rô đồng dưới nước

#### option q4_egret
correct: false
feedback.en: An egret is too big to hide there.
feedback.vi: Con cò quá to để trốn ở đó.
label.en: egret
label.vi: con cò
image.brief: Dùng lại hình `tray_egret` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): white egret flying over grass
image.alt.en: An egret flying over the grass
image.alt.vi: Con cò bay trên bãi cỏ

### q5
id: 9d55dad2-ceb8-4c0a-aa6b-888af2b282ce
format: order_sequence
version: 1
dok: 2
prompt.en: Tap from the smallest place to the biggest.
prompt.vi: Em chạm từ nơi nhỏ nhất tới nơi lớn nhất.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q5_stone, q5_pond, q5_sea
hint.en: Which place could fit under your hand?
hint.vi: Nơi nào nhỏ vừa bàn tay em?
explanation_correct.en: Yes! The sea is the biggest habitat here.
explanation_correct.vi: Đúng rồi! Biển là nơi sống lớn nhất ở đây.
explanation_wrong.en: The order is stone, pond, then sea.
explanation_wrong.vi: Thứ tự là hòn đá, cái ao, rồi biển.
> DOK 2: so sánh cỡ nơi sống; sửa quan niệm "nơi sống nào cũng là nơi sống nhỏ" (sườn). Thẻ trong file không theo thứ tự đúng. Ba cảnh cắt vuông; bé dựa vào hiểu biết, không dựa vào cỡ trong ảnh.

#### item q5_sea
label.en: sea
label.vi: biển
image.brief: Dùng lại hình `q4` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): coral reef underwater fish NOAA
image.alt.en: A coral reef under the sea
image.alt.vi: Rạn san hô dưới biển

#### item q5_stone
label.en: under a stone
label.vi: dưới hòn đá
image.brief: Dùng lại hình `explore_stone`. Từ khoá tìm ảnh (EN): under a rock soil insects worms
image.alt.en: Damp soil under a stone
image.alt.vi: Đất ẩm dưới hòn đá

#### item q5_pond
label.en: pond
label.vi: cái ao
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê

### q6
id: 6c587633-67e1-4770-b408-f2980703718a
format: true_false
version: 1
dok: 2
misconception: small_animals_are_insects
prompt.en: An earthworm is an insect.
prompt.vi: Giun đất là một loài côn trùng.
image.brief: Dùng lại hình `earthworm` ở bài `da-va-dat/the-nao-la-dat-tot`. Từ khoá tìm ảnh (EN): earthworm on moist soil close up
image.alt.en: An earthworm on damp soil
image.alt.vi: Con giun đất trên đất ẩm
answer: false
hint.en: How many legs does an insect have?
hint.vi: Côn trùng có mấy chân?
explanation_correct.en: Insects have six legs. An earthworm has none.
explanation_correct.vi: Côn trùng có sáu chân. Giun đất không có chân nào.
explanation_wrong.en: This is false. An earthworm is not an insect.
explanation_wrong.vi: Câu này sai. Giun đất không phải côn trùng.
feedback_true.en: An earthworm has no legs at all.
feedback_true.vi: Giun đất không có cái chân nào.
> Câu misconception (`small_animals_are_insects`): bé gọi mọi con vật bé tí là "côn trùng, sâu bọ" sẽ chạm gật đầu. DOK 2: áp dấu hiệu "sáu chân" của bài bảy chủ đề trước vào một con vật nhỏ mới. Đáp án Sai, giải thích khi đúng không mở đầu bằng "Yes!".

## Từ vựng

### microhabitat
id: 91d45577-9153-4885-86db-21cc2ce8ee64
tier: core
term.en: microhabitat
term.vi: nơi sống nhỏ xíu
example.en: Under a stone is a microhabitat.
example.vi: Chỗ dưới hòn đá là một nơi sống nhỏ xíu.
image.brief: Dùng lại hình `explore_stone`. Từ khoá tìm ảnh (EN): under a rock soil insects worms
image.alt.en: Damp soil under a stone
image.alt.vi: Đất ẩm dưới hòn đá
> [CẦN KIỂM] Tiếng Việt chưa có từ quen cho "microhabitat" ở cấp tiểu học (tài liệu sinh học dùng "vi sinh cảnh", "vi môi trường sống"); bài dùng "nơi sống nhỏ xíu". Nghe thử giọng EN đọc "microhabitat".

### earthworm
id: 8ef92a1b-453a-4913-a296-045086cabe69
tier: core
term.en: earthworm
term.vi: giun đất
example.en: Earthworms like damp, dark soil.
example.vi: Giun đất thích đất ẩm và tối.
image.brief: Dùng lại hình `earthworm` ở bài `da-va-dat/the-nao-la-dat-tot`. Từ khoá tìm ảnh (EN): earthworm on moist soil close up
image.alt.en: An earthworm on damp soil
image.alt.vi: Con giun đất trên đất ẩm

### moss
id: 8f87ff53-aca0-4a15-a923-2f29b721479f
tier: extra
term.en: moss
term.vi: rêu
example.en: Moss grows on damp walls.
example.vi: Rêu mọc trên tường ẩm.
image.brief: Dùng lại hình `explore_wall`. Từ khoá tìm ảnh (EN): old brick wall moss small ferns
image.alt.en: Moss on an old wall
image.alt.vi: Rêu trên bức tường cũ

### cricket
id: 8f92b066-e831-4db8-8256-480a1f92af92
tier: extra
term.en: cricket
term.vi: con dế
example.en: A cricket has six legs.
example.vi: Con dế có sáu chân.
image.brief: Dùng lại hình `tray_cricket`. Từ khoá tìm ảnh (EN): field cricket on ground side view
image.alt.en: A cricket on the ground
image.alt.vi: Con dế trên mặt đất

## Thưởng

### cricket_card
id: 2e1bffb4-a442-470d-96e5-2273e55975db
set: living_things
rarity: common
name.en: Cricket
name.vi: Con dế
tag.en: A tiny singer
tag.vi: Ca sĩ nhỏ xíu
fact.en: Only boy crickets sing. They rub their wings.
fact.vi: Chỉ dế đực mới kêu. Dế đực cọ hai cánh vào nhau.
image.brief: Dùng lại hình `tray_cricket`. Từ khoá tìm ảnh (EN): field cricket on ground side view
image.alt.en: A cricket on the ground
image.alt.vi: Con dế trên mặt đất
> [CẦN KIỂM] Chỉ dế đực kêu, bằng cách cọ cánh trước vào nhau. "Tiny singer" là cách gọi vui, không phải ẩn dụ khó; người duyệt bỏ nếu thấy chưa hợp.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Ảnh mới chọn ảnh ngang (thẻ ba lựa chọn 5:2), trừ món dế (ô kệ vuông, nhưng dế nằm ngang nên cắt được cả hai khung).
- **Ảnh cần tìm (năm):** đất ẩm dưới hòn đá vừa nhấc (Học); đống lá khô dưới gốc cây; hàng kiến trên vỏ cây; tường gạch cũ có rêu, dương xỉ nhỏ; dế mèn trên đất.
- **Ảnh khó:** đất dưới hòn đá có con vật nhỏ nhưng không có rết, bọ cạp; thấy mép đá để bé hiểu "dưới hòn đá". Nếu ảnh có tay người nhấc đá thì chỉ thấy bàn tay người lớn, không thấy mặt.
- **q5 (`order_sequence`):** dưới hòn đá, ao, biển cắt vuông.
- **Dùng lại:** bài bốn (cảnh ao, biển, rừng), bài năm (`explore_dry_plants`); chủ đề *Gọi tên và nhóm động vật* (`w1`, `w1_lotus`, `explore_spiny`, `tray_ant`, `explore_spiders`, `explore_plants` con trâu, `explore_big_small`, `explore_wild`, `explore_fish`, `tray_perch`, `q1` ao làng); *Đá và đất* (`earthworm`); *Hô hấp* (`tray_egret`, `q4` rạn san hô); *Bề mặt Trái Đất* (`tray_forest`).
- **Màu:** Học: dưới hòn đá `nau_dat`, đống lá khô `vang_hoe`, thân cây `gi_dong`, tường cũ `cham`. Chơi: sáu chân `vang_hoe`, tám chân `nau_dat`, không có chân `cham`, quá to `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (microhabitat, earthworm). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Sai, w3 Đúng). Quiz `single_choice` (q1, q3, q4), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q5). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`small_animals_are_insects`).
- **Vị trí đáp án đúng:** hết hiệu lực 15/11 (SK-047, app xáo lựa chọn và thẻ xếp thứ tự). q5 thứ tự đúng: dưới hòn đá, ao, biển.
- **Màn Chơi, ví dụ để kiểm:** Con kiến, Con nhện, Giun đất → `balanced`; Con dế, Con nhện, Con voi → `has_limited`; Con kiến, Con dế, Con nhện → `missing.tray_none`.
- **Từ EN có thể ngoài Starters/Movers:** microhabitat, habitat, earthworm, moss, cricket, millipede, bark, trunk, beetle, damp, insect.
