---
id: b0846a73-7931-43ed-8b10-ad31db03219d
topic: sinh-vat-song-o-dau
slug: noi-song-cua-con-vat
order: 4
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Animal habitats
vi: Nơi sống của con vật
> Giữ đúng tên ở `content/syllabus.json` (bài số bốn).

## Mục tiêu
en: I can match animals to where they live.
vi: Em ghép được con vật với nơi sống của nó.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 14/11/2026. Mọi dòng `id:` để trống; chạy `ids` sau bài ba.
> "Habitat" dịch là "nơi sống", không dịch "nhà" (sườn: dịch "nhà" dễ rơi vào quan niệm sai "nơi sống chỉ là cái nhà"). Sửa `habitat_is_a_home` ở ý chính hai, ví dụ của bốn ô Học (nước để bơi, cây để leo, chỗ để trốn, thức ăn) và câu q6 (gắn key).
> Bốn nơi sống Việt Nam: ao, rừng, biển, rừng ngập mặn; khác nhau theo ướt, khô, mặn, ngọt chứ không chỉ "nóng, lạnh". Không dùng các cặp con vật, nơi sống trong quiz của nguồn tham khảo (gấu Bắc Cực, lạc đà, cá hề, sóc, hà mã, hải cẩu, nòng nọc với ao).
> Chỉ nói nơi sống **có** thức ăn; không nói con nào ăn con nào (để dành chủ đề *Chuỗi thức ăn*).

## Ý chính
1.en: Frogs live in ponds. Doucs live in forests.
1.vi: Ếch sống ở ao. Voọc sống trong rừng.
2.en: A habitat has food, water and hiding places.
2.vi: Nơi sống có thức ăn, nước và chỗ trú ẩn.
3.en: Animals live where they find what they need.
3.vi: Con vật sống ở nơi có đủ những thứ nó cần.

## Khởi động

> Ba câu: w1 ôn bài ba (bài trước), w2 ôn bài hai, w3 ôn bài bảy chủ đề *Gọi tên và nhóm động vật* (côn trùng, dùng ở kệ Chơi hôm nay).

### w1
id: bb3bf303-d1a8-4480-81d3-223276e62bf5
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song
prompt.en: Which leaf is dead?
prompt.vi: Chiếc lá nào đã chết?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Which leaf fell off the tree?
hint.vi: Chiếc lá nào đã rụng khỏi cây?
explanation_correct.en: Yes! A dry, brown leaf is dead.
explanation_correct.vi: Đúng rồi! Lá khô màu nâu là lá đã chết.
explanation_wrong.en: The answer is the dry leaf. It fell off.
explanation_wrong.vi: Đáp án là chiếc lá khô. Lá đã rụng.

#### option w1_green
correct: false
feedback.en: This leaf is green and growing.
feedback.vi: Chiếc lá này còn xanh, còn lớn.
label.en: green leaves
label.vi: lá xanh
image.brief: Dùng lại hình `explore_alive` ở bài `sinh-vat-song-o-dau/dang-song-da-chet-chua-tung-song`. Từ khoá tìm ảnh (EN): Terminalia catappa green leaves branch
image.alt.en: Green leaves on a branch
image.alt.vi: Lá xanh trên cành cây

#### option w1_dry_leaf
correct: true
label.en: dry leaf
label.vi: lá khô
image.brief: Dùng lại hình `tray_dry_leaf` ở bài `da-va-dat/hoa-thach-hinh-thanh-the-nao`. Từ khoá tìm ảnh (EN): dry fallen leaf on ground top view
image.alt.en: A dry fallen leaf
image.alt.vi: Chiếc lá khô vừa rụng

### w2
id: 916fcc4c-2e37-498f-957c-af8319c95920
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/vat-song-nao-cung-cu-dong
prompt.en: A balloon floats up, so it is alive.
prompt.vi: Bóng bay bay lên được, nên là vật sống.
image.brief: Dùng lại hình `w1_balloon` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): red balloon plain background
image.alt.en: A red balloon
image.alt.vi: Quả bóng bay màu đỏ
answer: false
hint.en: Can a balloon eat or grow?
hint.vi: Bóng bay có ăn, có lớn lên không?
explanation_correct.en: A balloon moves, but it is not alive.
explanation_correct.vi: Bóng bay cử động được, nhưng không phải vật sống.
explanation_wrong.en: This is false. A balloon is not alive.
explanation_wrong.vi: Câu này sai. Bóng bay không phải vật sống.
feedback_true.en: Air and wind move a balloon.
feedback_true.vi: Không khí và gió làm bóng bay bay lên.
> Ôn `moving_means_alive` của bài hai. [CẦN KIỂM] Cách nói cho bé: bóng bay "bay lên" nhờ khí nhẹ bên trong và gió; câu không giải thích khí nhẹ.

### w3
id: 921ca84a-9d74-4c02-903c-8f1bc00a7ec7
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan
prompt.en: Which one is an insect?
prompt.vi: Con nào là côn trùng?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Count the legs on each one.
hint.vi: Em đếm chân của từng con nhé.
explanation_correct.en: Yes! A dragonfly has six legs.
explanation_correct.vi: Đúng rồi! Chuồn chuồn có sáu chân.
explanation_wrong.en: The answer is the dragonfly. It has six legs.
explanation_wrong.vi: Đáp án là chuồn chuồn. Chuồn chuồn có sáu chân.

#### option w3_dragonfly
correct: true
label.en: dragonfly
label.vi: chuồn chuồn
image.brief: Dùng lại hình `q6_dragonfly` ở bài `goi-ten-va-nhom-dong-vat/chim-va-bo-sat`. Từ khoá tìm ảnh (EN): dragonfly perched grass side view
image.alt.en: A dragonfly on a grass stem
image.alt.vi: Con chuồn chuồn đậu trên ngọn cỏ

#### option w3_spider
correct: false
feedback.en: A spider has eight legs.
feedback.vi: Con nhện có tám chân.
label.en: spider
label.vi: con nhện
image.brief: Dùng lại hình `explore_spiders` ở bài `goi-ten-va-nhom-dong-vat/con-trung-va-con-vat-nhieu-chan`. Từ khoá tìm ảnh (EN): garden orb spider web
image.alt.en: A spider in its web
image.alt.vi: Con nhện trên mạng tơ
> [CẦN KIỂM] Ảnh chuồn chuồn đậu của chủ đề trước thấy đủ sáu chân; nếu không, người chọn ảnh báo lại để đổi câu.

## Học

> Bốn ô, mỗi ô một nơi sống Việt Nam và những thứ nơi đó cho con vật (ví dụ là nhu cầu, không phải danh sách con vật), để bé hiểu nơi sống không chỉ là "cái nhà".
> Từ gần tới xa: ao làng, rừng, biển, rừng ngập mặn.

### explore
id: 65053ae4-ac13-4d71-9311-f6153c53dc5b
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_pond
label.en: Pond
label.vi: Ao
color: cham
sentence.en: Frogs and fish live in the pond.
sentence.vi: Ếch và cá sống ở ao.
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê
examples.1.en: water to swim in
examples.1.vi: nước để bơi
examples.2.en: water plants to hide in
examples.2.vi: cây cỏ dưới nước để trốn
examples.3.en: tiny bugs to eat
examples.3.vi: côn trùng nhỏ để ăn

#### group explore_forest
label.en: Forest
label.vi: Rừng
color: gi_dong
sentence.en: Doucs and birds live in the forest.
sentence.vi: Voọc và chim sống trong rừng.
image.brief: Dùng lại hình `tray_forest` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): forest green canopy aerial
image.alt.en: A green forest
image.alt.vi: Khu rừng xanh
examples.1.en: tall trees to climb
examples.1.vi: cây cao để leo
examples.2.en: leaves and fruit to eat
examples.2.vi: lá và quả để ăn
examples.3.en: cool shade on hot days
examples.3.vi: bóng mát những ngày nắng

#### group explore_sea
label.en: Sea
label.vi: Biển
color: vang_hoe
sentence.en: Starfish and sea turtles live in the sea.
sentence.vi: Sao biển và rùa biển sống ở biển.
image.brief: Dùng lại hình `q4` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): coral reef underwater fish NOAA
image.alt.en: A coral reef under the sea
image.alt.vi: Rạn san hô dưới biển
examples.1.en: salty water
examples.1.vi: nước mặn
examples.2.en: rocks and coral to hide in
examples.2.vi: đá và san hô để trốn
examples.3.en: a starfish on a rock
examples.3.vi: sao biển trên đá

#### group explore_mangrove
label.en: Mangrove
label.vi: Rừng ngập mặn
color: nau_dat
sentence.en: Mudskippers hop on the mangrove mud.
sentence.vi: Cá thòi lòi nhảy trên bùn rừng ngập mặn.
image.brief: [ảnh] Rừng đước lúc nước ròng: nhiều rễ đước cong cắm xuống bùn, nước nông lấp loáng, ảnh ngang chụp rộng; ưu tiên Cần Giờ hoặc Cà Mau; không có người, không có thuyền, không có biển chữ, không có chữ. Từ khoá tìm ảnh (EN): mangrove forest roots mud Vietnam
image.alt.en: Mangrove trees in the mud
image.alt.vi: Rừng cây đước trên bùn
examples.1.en: trees with roots in water
examples.1.vi: cây có rễ đứng trong nước
examples.2.en: soft, wet mud
examples.2.vi: bùn mềm và ướt
examples.3.en: crabs dig holes in the mud
examples.3.vi: cua đào hang trong bùn
> [CẦN KIỂM] Cá thòi lòi sống ở bãi bùn rừng ngập mặn, ra khỏi nước được một lúc nhờ giữ nước trong mang và thở qua da; cua còng đào hang trong bùn. Hình gốc, dùng lại ở từ `mangrove` và bài năm.

### new_words
id: 6e783df3-446b-4f7a-a645-9d7c0417ba7d
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: habitat, pond, forest

## Chơi

> Bé chọn ba con vật sống ở ao: một con cá, một con lưỡng cư, một con côn trùng (ôn ba nhóm của chủ đề trước). Đạt khi đủ ba nhóm và không chọn con vật nơi khác.
> Món bẫy giống một nhóm nhưng sống nơi khác: cá heo bơi như cá nhưng sống ở biển, sông lớn; sao biển sống dưới nước nhưng là nước mặn; voọc sống trong rừng. Bé phải nghĩ về nơi sống, không chọn theo dáng.
> Kệ bảy món, toàn ảnh chụp.

### tray
id: 8b391670-b126-41ad-b41b-a39c04ad94ed
type: build_tray
version: 1
prompt.en: Pick three animals from the pond
prompt.vi: Chọn ba con vật sống ở ao
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find a fish, an amphibian and an insect.
messages.start.vi: Em tìm một con cá, một con lưỡng cư, một con côn trùng nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! They all live in the pond.
messages.balanced.vi: Tuyệt! Cả ba con đều sống ở ao.
messages.has_limited.en: That one does not live in a pond.
messages.has_limited.vi: Con này không sống ở ao.
messages.missing.tray_fish.en: You still need a fish.
messages.missing.tray_fish.vi: Em còn thiếu một con cá.
messages.missing.tray_amph.en: You still need an amphibian.
messages.missing.tray_amph.vi: Em còn thiếu một con lưỡng cư.
messages.missing.tray_insect.en: You still need an insect.
messages.missing.tray_insect.vi: Em còn thiếu một con côn trùng.

#### group tray_fish
label.en: Fish
label.vi: Cá
color: cham
role: required

#### group tray_amph
label.en: Amphibian
label.vi: Lưỡng cư
color: gi_dong
role: required

#### group tray_insect
label.en: Insect
label.vi: Côn trùng
color: vang_hoe
role: required

#### group tray_not
label.en: Not a pond animal
label.vi: Không sống ở ao
color: do_son
role: limit

#### item tray_perch
label.en: Climbing perch
label.vi: Cá rô đồng
group: tray_fish
image.brief: Dùng lại hình `tray_perch` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): climbing perch Anabas testudineus live
image.alt.en: A climbing perch in water
image.alt.vi: Cá rô đồng dưới nước

#### item tray_starfish
label.en: Starfish
label.vi: Sao biển
group: tray_not
image.brief: Dùng lại hình `explore_spiny` ở bài `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien`. Từ khoá tìm ảnh (EN): starfish on rock tide pool
image.alt.en: A starfish on a rock
image.alt.vi: Con sao biển trên tảng đá

#### item tray_frog
label.en: Frog
label.vi: Con ếch
group: tray_amph
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

#### item tray_douc
label.en: Douc
label.vi: Con voọc
group: tray_not
image.brief: Dùng lại hình `explore_wild` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): red-shanked douc langur tree
image.alt.en: A douc in a tree
image.alt.vi: Con voọc trên cây

#### item tray_dragonfly
label.en: Dragonfly
label.vi: Chuồn chuồn
group: tray_insect
image.brief: Dùng lại hình `q6_dragonfly` ở bài `goi-ten-va-nhom-dong-vat/chim-va-bo-sat`. Từ khoá tìm ảnh (EN): dragonfly perched grass side view
image.alt.en: A dragonfly on a grass stem
image.alt.vi: Con chuồn chuồn đậu trên ngọn cỏ
> [CẦN KIỂM] Chuồn chuồn đẻ trứng xuống ao, con non sống dưới nước, con trưởng thành bay quanh ao; tính là con vật của ao.

#### item tray_carp
label.en: Carp
label.vi: Cá chép
group: tray_fish
image.brief: Dùng lại hình `explore_fish` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): common carp swimming underwater side view
image.alt.en: A carp swimming
image.alt.vi: Con cá chép đang bơi

#### item tray_dolphin
label.en: Dolphin
label.vi: Cá heo
group: tray_not
image.brief: Dùng lại hình `tray_dolphin` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): dolphin jumping out of sea NOAA
image.alt.en: A dolphin jumping out of the sea
image.alt.vi: Cá heo nhảy lên khỏi mặt biển

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1, q3, q4; ba lựa chọn), `true_false` (q2, q5, q6). Bài này không dùng `order_sequence`: nơi sống không có thứ tự tự nhiên.
> Câu q3, q4 có lựa chọn là ảnh một nơi sống (cảnh ao, biển, rừng, đồi cát): mỗi ảnh là một cảnh cụ thể, khác nhau rõ bằng mắt (luật Explorer số hai, số bảy).

### q1
id: 06e0c29b-e06b-4ee6-b5be-d9e9489d1ed0
format: single_choice
version: 1
dok: 1
prompt.en: Which animal lives in a pond?
prompt.vi: Con nào sống ở ao?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Remember the Pond picture.
hint.vi: Em nhớ lại ô Ao nhé.
explanation_correct.en: Yes! A frog swims and hides in ponds.
explanation_correct.vi: Đúng rồi! Ếch bơi và trốn trong ao.
explanation_wrong.en: The answer is the frog. It lives in ponds.
explanation_wrong.vi: Đáp án là con ếch. Ếch sống ở ao.
> Hình câu hỏi là góc vườn, không phải ao (ao là bằng chứng của đáp án). Ba con bé đều đã gặp ở chủ đề trước và ở kệ Chơi hôm nay.

#### option q1_douc
correct: false
feedback.en: A douc lives high in forest trees.
feedback.vi: Voọc sống trên cây cao trong rừng.
label.en: douc
label.vi: con voọc
image.brief: Dùng lại hình `explore_wild` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): red-shanked douc langur tree
image.alt.en: A douc in a tree
image.alt.vi: Con voọc trên cây

#### option q1_starfish
correct: false
feedback.en: A starfish lives in the salty sea.
feedback.vi: Sao biển sống ở biển nước mặn.
label.en: starfish
label.vi: sao biển
image.brief: Dùng lại hình `explore_spiny` ở bài `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien`. Từ khoá tìm ảnh (EN): starfish on rock tide pool
image.alt.en: A starfish on a rock
image.alt.vi: Con sao biển trên tảng đá

#### option q1_frog
correct: true
label.en: frog
label.vi: con ếch
image.brief: Dùng lại hình `q4_frog` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): rice field frog Hoplobatrachus front view
image.alt.en: A frog seen from the front
image.alt.vi: Con ếch nhìn từ phía trước

### q2
id: a8998fdd-d81f-4cfc-8019-29709d5715d1
format: true_false
version: 1
dok: 1
prompt.en: A douc lives in the forest.
prompt.vi: Con voọc sống trong rừng.
image.brief: Dùng lại hình `explore_wild` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): red-shanked douc langur tree
image.alt.en: A douc in a tree
image.alt.vi: Con voọc trên cây
answer: true
hint.en: Remember the Forest picture.
hint.vi: Em nhớ lại ô Rừng nhé.
explanation_correct.en: Yes! Tall forest trees keep a douc safe.
explanation_correct.vi: Đúng rồi! Cây rừng cao giữ cho voọc an toàn.
explanation_wrong.en: This is true. A douc lives in forest trees.
explanation_wrong.vi: Câu này đúng. Voọc sống trên cây trong rừng.
feedback_false.en: A douc climbs and eats in forest trees.
feedback_false.vi: Voọc leo trèo và kiếm ăn trên cây rừng.
> Ảnh voọc ngồi trên một cành cây, cắt sát con vật; không thấy cả khu rừng.

### q3
id: 6f1f3c8b-edc3-4eff-b9e2-7c88d3d96055
format: single_choice
version: 1
dok: 1
prompt.en: Where does a starfish live?
prompt.vi: Sao biển sống ở đâu?
image.brief: Dùng lại hình `explore_spiny` ở bài `goi-ten-va-nhom-dong-vat/oc-bach-tuoc-va-con-vat-bien`. Từ khoá tìm ảnh (EN): starfish on rock tide pool
image.alt.en: A starfish on a rock
image.alt.vi: Con sao biển trên tảng đá
hint.en: Where did you see a starfish today?
hint.vi: Hôm nay em thấy sao biển ở ô nào?
explanation_correct.en: Yes! A starfish lives on rocks in the sea.
explanation_correct.vi: Đúng rồi! Sao biển sống trên đá dưới biển.
explanation_wrong.en: The answer is the sea. Its water is salty.
explanation_wrong.vi: Đáp án là biển. Nước biển mặn.
> Ba ảnh nơi sống bé vừa xem ở Học. Hình câu hỏi là sao biển (vật được hỏi); app Explorer ẩn hình này khi mọi lựa chọn có hình.

#### option q3_pond
correct: false
feedback.en: A pond has fresh water, not salty.
feedback.vi: Nước ao là nước ngọt, không mặn.
label.en: pond
label.vi: cái ao
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê

#### option q3_sea
correct: true
label.en: sea
label.vi: biển
image.brief: Dùng lại hình `q4` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): coral reef underwater fish NOAA
image.alt.en: A coral reef under the sea
image.alt.vi: Rạn san hô dưới biển

#### option q3_forest
correct: false
feedback.en: A forest has trees, not sea water.
feedback.vi: Rừng có cây, không có nước biển.
label.en: forest
label.vi: khu rừng
image.brief: Dùng lại hình `tray_forest` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): forest green canopy aerial
image.alt.en: A green forest
image.alt.vi: Khu rừng xanh

### q4
id: 61ece489-9b82-44cb-b60b-75b17751f8ec
format: single_choice
version: 1
dok: 2
prompt.en: A fish needs water. Where can it live?
prompt.vi: Cá cần nước. Cá sống được ở đâu?
image.brief: Dùng lại hình `explore_fish` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): common carp swimming underwater side view
image.alt.en: A carp swimming
image.alt.vi: Con cá chép đang bơi
hint.en: Which place has lots of water?
hint.vi: Nơi nào có nhiều nước?
explanation_correct.en: Yes! A pond has water for fish.
explanation_correct.vi: Đúng rồi! Ao có nước cho cá bơi.
explanation_wrong.en: The answer is the pond. It has water.
explanation_wrong.vi: Đáp án là cái ao. Ao có nước.
> DOK 2: từ một nhu cầu (nước) suy ra nơi sống hợp. Đồi cát là ảnh mới nhưng là lựa chọn sai; ao và rừng bé vừa xem ở Học.

#### option q4_pond
correct: true
label.en: pond
label.vi: cái ao
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê

#### option q4_forest
correct: false
feedback.en: Fish cannot swim between the trees.
feedback.vi: Cá không bơi được giữa những thân cây.
label.en: forest
label.vi: khu rừng
image.brief: Dùng lại hình `tray_forest` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): forest green canopy aerial
image.alt.en: A green forest
image.alt.vi: Khu rừng xanh

#### option q4_dunes
correct: false
feedback.en: Sand hills are dry, with no water.
feedback.vi: Đồi cát khô, không có nước.
label.en: sand hills
label.vi: đồi cát
image.brief: [ảnh] Đồi cát vàng trải dài dưới nắng, ảnh ngang chụp rộng, thấy gợn sóng cát và trời xanh; ưu tiên đồi cát Mũi Né hoặc Ninh Thuận; không có người, không có xe, không có cây xương rồng, không có chữ. Từ khoá tìm ảnh (EN): sand dunes Mui Ne Vietnam
image.alt.en: Sand hills on a sunny day
image.alt.vi: Đồi cát dưới nắng
> Gọi "đồi cát", không gọi "sa mạc" (đồi cát Việt Nam không phải sa mạc thật). Hình gốc, bài năm dùng lại.

### q5
id: 2bfaaf62-7067-4ccf-8bf5-1c1313c04b35
format: true_false
version: 1
dok: 2
prompt.en: A dolphin can live in a pond.
prompt.vi: Cá heo sống được ở ao.
image.brief: Dùng lại hình `tray_dolphin` ở bài `goi-ten-va-nhom-dong-vat/dong-vat-co-vu`. Từ khoá tìm ảnh (EN): dolphin jumping out of sea NOAA
image.alt.en: A dolphin jumping out of the sea
image.alt.vi: Cá heo nhảy lên khỏi mặt biển
answer: false
hint.en: Think how far a dolphin swims.
hint.vi: Em nghĩ xem cá heo bơi xa thế nào.
explanation_correct.en: A dolphin needs lots of room to swim.
explanation_correct.vi: Cá heo cần chỗ thật rộng để bơi.
explanation_wrong.en: This is false. A pond is too small.
explanation_wrong.vi: Câu này sai. Ao quá nhỏ cho cá heo.
feedback_true.en: A pond is too small for a dolphin.
feedback_true.vi: Cái ao quá nhỏ cho cá heo.
> DOK 2: ao có nước, cá heo bơi, nhưng nơi sống phải đủ mọi thứ con vật cần (ở đây là chỗ rộng). [CẦN KIỂM] Phần lớn cá heo sống ở biển; vài loài sống ở sông lớn (cá heo Irrawaddy ở sông Mê Kông), nên câu không nói "cá heo chỉ sống ở biển".

### q6
id: 2e2634b3-0523-403a-af80-75e3527408a3
format: true_false
version: 1
dok: 2
misconception: habitat_is_a_home
prompt.en: A frog finds food in its pond.
prompt.vi: Ếch tìm được thức ăn ngay ở ao của nó.
image.brief: [ảnh] Một con ếch ngồi trên lá súng hoặc lá sen nổi trên mặt ao, ảnh ngang, thấy cả con và mặt nước xung quanh; không có con mồi trong miệng, không có côn trùng nổi bật, không có người, không có chữ. Từ khoá tìm ảnh (EN): frog sitting on lily pad pond
image.alt.en: A frog on a leaf in a pond
image.alt.vi: Con ếch ngồi trên lá giữa ao
answer: true
hint.en: Remember what the pond gives a frog.
hint.vi: Em nhớ lại cái ao cho ếch những gì nhé.
explanation_correct.en: Yes! A habitat gives food and hiding places.
explanation_correct.vi: Đúng rồi! Nơi sống cho con vật thức ăn và chỗ trốn.
explanation_wrong.en: This is true. A pond has food for frogs.
explanation_wrong.vi: Câu này đúng. Ở ao có thức ăn cho ếch.
feedback_false.en: A pond gives a frog food and water.
feedback_false.vi: Ao cho ếch thức ăn và nước.
> Câu misconception (`habitat_is_a_home`): bé nghĩ "nơi sống chỉ là chỗ ngủ" sẽ chạm lắc đầu. DOK 2: áp ý "nơi sống cho thức ăn, nước, chỗ trốn" vào ếch và ao. Ảnh không thấy ếch đang bắt mồi (không làm bằng chứng).
> Chỉ nói "ao có thức ăn cho ếch", không nói ếch ăn con gì (rà chữ tester 14/11 n2: *Chuỗi thức ăn* bài hai dạy "Ếch ăn châu chấu"). Hình gốc, dùng lại ở từ `pond`.

## Từ vựng

### habitat
id: d3f46e49-4151-4824-b9fd-9f9f070ba87d
tier: core
term.en: habitat
term.vi: nơi sống
example.en: A pond is a habitat for frogs.
example.vi: Cái ao là nơi sống của ếch.
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê

### pond
id: 171ba89a-187f-404d-9299-505b587f8694
tier: core
term.en: pond
term.vi: cái ao
example.en: Fish and frogs live in the pond.
example.vi: Cá và ếch sống trong ao.
image.brief: Dùng lại hình `q6`. Từ khoá tìm ảnh (EN): frog sitting on lily pad pond
image.alt.en: A frog on a leaf in a pond
image.alt.vi: Con ếch ngồi trên lá giữa ao

### forest
id: 396f64be-0d1e-4c12-b185-238dd4a05238
tier: core
term.en: forest
term.vi: rừng
example.en: Doucs live in the forest.
example.vi: Voọc sống trong rừng.
image.brief: Dùng lại hình `tray_forest` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): forest green canopy aerial
image.alt.en: A green forest
image.alt.vi: Khu rừng xanh

### mangrove
id: 57c7d682-e3dd-4e3a-b0c7-1d0e32d21173
tier: extra
term.en: mangrove
term.vi: rừng ngập mặn
example.en: Mangrove trees grow in salty mud.
example.vi: Cây rừng ngập mặn mọc trong bùn nước mặn.
image.brief: Dùng lại hình `explore_mangrove`. Từ khoá tìm ảnh (EN): mangrove forest roots mud Vietnam
image.alt.en: Mangrove trees in the mud
image.alt.vi: Rừng cây đước trên bùn

### mudskipper
id: 92122672-7562-4b5c-8389-423567bc0d1d
tier: extra
term.en: mudskipper
term.vi: cá thòi lòi
example.en: A mudskipper hops on the mud.
example.vi: Cá thòi lòi nhảy trên bùn.
image.brief: [ảnh] Một con cá thòi lòi nằm trên bãi bùn ướt, nhìn ngang, thấy rõ đôi mắt lồi trên đỉnh đầu và vây ngực; không có tay người, không có chữ. Từ khoá tìm ảnh (EN): mudskipper on mud Periophthalmus
image.alt.en: A mudskipper on the mud
image.alt.vi: Con cá thòi lòi trên bùn
> Hình gốc, thẻ thưởng dùng lại.

## Thưởng

### mudskipper_card
id: 890d8607-a66c-4882-814e-e2de4598bdc3
set: living_things
rarity: rare
name.en: Mudskipper
name.vi: Cá thòi lòi
tag.en: A fish that hops on mud
tag.vi: Cá biết nhảy trên bùn
fact.en: This fish uses its fins to hop.
fact.vi: Cá thòi lòi dùng vây để nhảy trên bùn.
image.brief: Dùng lại hình `mudskipper`. Từ khoá tìm ảnh (EN): mudskipper on mud Periophthalmus
image.alt.en: A mudskipper on the mud
image.alt.vi: Con cá thòi lòi trên bùn
> [CẦN KIỂM] Cá thòi lòi chống vây ngực để bò, nhảy trên bùn; có ở bãi bùn ven biển, rừng ngập mặn miền Nam.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Cảnh nơi sống là ảnh ngang rộng, hợp thẻ ba lựa chọn 5:2.
- **Ảnh cần tìm (bốn):** rừng đước lúc nước ròng (Học); đồi cát (q4); ếch ngồi trên lá súng giữa ao (q6, từ `pond`); cá thòi lòi trên bùn (từ, thẻ).
- **Ảnh khó:** ảnh rừng ngập mặn Việt Nam có giấy phép, không có thuyền du lịch, biển chữ; cá thòi lòi thấy rõ cả con.
- **Dùng lại:** bài ba (`explore_alive`); chủ đề *Gọi tên và nhóm động vật* (`w1`, `q1` ao làng, `explore_fish`, `tray_perch`, `explore_wild`, `q6_dragonfly`, `explore_spiders`, `tray_dolphin`, `explore_spiny`); *Khủng long* (`q4_frog`); *Đá và đất* (`tray_dry_leaf`); *Hô hấp* (`w1_balloon`, `q4` rạn san hô); *Bề mặt Trái Đất* (`tray_forest`).
- **Màu:** Học: ao `cham`, rừng `gi_dong`, biển `vang_hoe`, rừng ngập mặn `nau_dat`. Chơi: cá `cham`, lưỡng cư `gi_dong`, côn trùng `vang_hoe`, không sống ở ao `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (habitat, pond, forest). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `single_choice` (w1, w3; hai lựa chọn), `true_false` (w2 Sai). Quiz `single_choice` (q1, q3, q4), `true_false` (q2 Đúng, q5 Sai, q6 Đúng). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`habitat_is_a_home`).
- **Vị trí đáp án đúng:** hết hiệu lực 15/11 (SK-047, app xáo lựa chọn).
- **Màn Chơi, ví dụ để kiểm:** Cá rô đồng, Con ếch, Chuồn chuồn → `balanced`; Cá chép, Con ếch, Cá heo → `has_limited`; Cá chép, Cá rô đồng, Con ếch → `missing.tray_insect`.
- **Từ EN có thể ngoài Starters/Movers:** habitat, pond, forest, mangrove, mudskipper, amphibian, insect, douc, coral, salty, hiding places.
