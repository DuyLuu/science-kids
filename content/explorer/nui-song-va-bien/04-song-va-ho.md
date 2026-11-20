---
id: 5a7d38b1-f7f7-455c-a951-81cb65ba0a34
topic: nui-song-va-bien
slug: song-va-ho
order: 4
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Rivers and lakes
vi: Sông và hồ
> Giữ đúng tên ở `content/syllabus.json` (key `new-mountains-rivers-and-seas`, bài số bốn). `id` là `lesson_id` của danh mục.

## Mục tiêu
en: I can tell rivers and lakes apart.
vi: Em phân biệt được sông và hồ.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 19/11/2026. Ticket SK-058. Mọi dòng `id:` khác để trống.
> SK-058 khuyến nghị 2: chỉ dạy nhận ra sông (dài, nước chảy) và hồ (bờ bao quanh, nước đứng yên). Không dạy nước chảy từ đâu tới đâu (suối → sông → biển), không mưa, không nước ngầm, thác: để Discoverer #9 *Sông, hồ và vòng tuần hoàn nước* (SK-061; mưa ở mức thấy đã có ở Explorer #5). Một câu an toàn ở ô Học (khuyến nghị 7), không thành câu hỏi.

## Ý chính
1.en: A river is long. Its water flows.
1.vi: Sông dài. Nước sông chảy đi.
2.en: A lake has land all around. Its water is still.
2.vi: Hồ có đất bao quanh. Nước hồ đứng yên.
3.en: People live, travel and fish by rivers.
3.vi: Người ta sống, đi lại và đánh cá bên sông.
> Từ cụ thể tới trừu tượng: hình dáng sông, rồi so với hồ, rồi con người sống cạnh sông. Ý chính một mang ý sửa `river_water_still`.
> Ghép với ô Học (`KeyPointPictures.match`): ý 1 → River (bốn từ chung), ý 2 → Lake (ba), ý 3 → By the river (năm). Ô The Mekong không ghép.
> [CẦN KIỂM] "Nước hồ đứng yên" ở mức thấy (hồ vẫn có sóng khi gió); "nước sông chảy đi" (vùng có thuỷ triều nước sông có lúc chảy chậm, chảy ngược).

## Khởi động

> Hai câu: w1 ôn bài trước (đồng bằng); w2 ôn *Những nơi sống trên Trái Đất* bài 4 (đầm lầy nước ngọt, như ao), nối sang ao, hồ của bài này. Câu w2 chỉ ôn, bài này không dạy lại đầm lầy (SK-058 khuyến nghị 3).

### w1
id: 73fe98df-6e39-4851-8c0a-46e90a91df7b
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: nui-song-va-bien/dong-bang-va-ruong-lua
prompt.en: A plain is wide, flat land.
prompt.vi: Đồng bằng là vùng đất rộng và bằng phẳng.
image.brief: Dùng lại hình `explore_plain` ở bài `nui-song-va-bien/dong-bang-va-ruong-lua`. Từ khoá tìm ảnh (EN): Mekong Delta fields aerial
image.alt.en: Fields stretching far away
image.alt.vi: Ruộng đồng trải dài tít tắp
answer: true
hint.en: Think how far you can see there.
hint.vi: Em nghĩ xem ở đó nhìn được xa tới đâu nhé.
explanation_correct.en: Yes! Many plains have rice fields.
explanation_correct.vi: Đúng rồi! Nhiều đồng bằng có ruộng lúa.
explanation_wrong.en: This is true. Plains are wide and flat.
explanation_wrong.vi: Câu này đúng. Đồng bằng rộng và phẳng.
feedback_false.en: These fields stretch far, flat and wide.
feedback_false.vi: Ruộng đồng ở đây trải rộng, phẳng lì.
> Ôn ý chính một bài 3. Lượt sửa 19/11 (tester C1): `explanation_correct.vi` cũ "Ruộng lúa phủ khắp đồng bằng." đổi cho khớp EN và không đá với `plain_is_one_field`.

### w2
id: 5d67af20-a9ab-4cd8-a6ab-1c4811db5c83
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: noi-song-tren-trai-dat/rung-ngap-man-va-dam-lay
prompt.en: Lotus swamps are full of salty water.
prompt.vi: Đầm sen đầy nước mặn.
image.brief: Dùng lại hình `explore_swamp` ở bài `noi-song-tren-trai-dat/rung-ngap-man-va-dam-lay`. Từ khoá tìm ảnh (EN): freshwater marsh lotus
image.alt.en: A swamp with lotus plants
image.alt.vi: Đầm lầy có cây sen
answer: false
hint.en: Think of a lotus pond in a village.
hint.vi: Em nghĩ tới ao sen ở làng nhé.
explanation_correct.en: Swamp water is fresh, like a pond.
explanation_correct.vi: Nước đầm lầy là nước ngọt, giống nước ao.
explanation_wrong.en: This is false. Swamp water is fresh.
explanation_wrong.vi: Câu này sai. Nước đầm lầy là nước ngọt.
feedback_true.en: Lotus grows in fresh, still water.
feedback_true.vi: Sen mọc ở nước ngọt, nước lặng.
> Ôn câu chính ô Swamp của #4 bài 4 ("Swamp water is fresh, like a pond."); `explanation_correct` là đúng câu đó, đứng một mình. Câu mới, khác w1 "Swamp water is salty, like the sea." của #4 bài 5.

## Học

> Bốn ô: sông, hồ (so hai loại nước trên đất liền), một con sông lớn (Mê Kông), rồi người sống bên sông.
> Chữ cần dạy trước khi hỏi: "leaves float down the river" (q6 gợi ý) và "ripples" (q6 phản hồi) ở ô River; "the water stays still", "a pond is like a small lake" (q1, q4) ở ô Lake; "boats" (q3) ở ô By the river.
> **Câu an toàn** (SK-058 khuyến nghị 7): ví dụ ba ô River "go to rivers only with a grown-up" · "chỉ ra sông cùng người lớn". Không thành câu Khởi động, Quiz.
> **Tên nơi:** ô The Mekong cần ảnh đúng sông Mê Kông (câu dự phòng ở dòng `>` dưới ô). "Hoan Kiem Lake", "the Red River" chỉ ở lời ví dụ, không gắn ảnh (mục Pháp lý và tên nơi ở `_topic.md`).

### explore
id: ff222189-847f-43c8-8b4f-01f1e9adc0d2
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_river
label.en: River
label.vi: Sông
color: cham
sentence.en: A river is long, and its water flows.
sentence.vi: Sông dài, nước sông chảy đi.
image.brief: [ảnh] Một dòng sông rộng chụp từ bờ hay từ trên cầu, thấy cả hai bờ, mặt nước có gợn sóng, vệt nước chảy rõ (gợn nước kéo dài theo dòng, bọt nhỏ trôi); có thể có một con thuyền nhỏ ở xa; ưu tiên sông Việt Nam, `alt` không nêu tên nơi; không lũ, không nước tràn bờ, không người bơi, không trẻ em gần mép nước; không chữ, không biển báo. Ảnh ngang có khoảng trống (khung vuông Học, kệ; thẻ ba lựa chọn 5:2 q1; khung 4:3 q6; thẻ hai lựa chọn bài 5 w1). Từ khoá tìm ảnh (EN): wide river ripples; flowing river current; river Vietnam
image.alt.en: A wide river with ripples
image.alt.vi: Dòng sông rộng gợn sóng
examples.1.en: leaves float down the river
examples.1.vi: lá cây trôi theo dòng sông
examples.2.en: ripples show the water moving
examples.2.vi: gợn sóng cho thấy nước đang chảy
examples.3.en: go to rivers only with a grown-up
examples.3.vi: chỉ ra sông cùng người lớn
> Hình gốc của cả chủ đề (kệ, q1, q6, từ `river`; bài 5 kệ, w1; bài 6 kệ, q1). Ảnh phải thấy nước đang chảy (câu q6, bài 5 w1). `alt` có chữ "river" · "sông" được, vì không câu nào lấy ảnh này làm đáp án mà câu hỏi lại chứa chữ đó (bài 5 w1 hỏi "Which one has flowing water?"; ở câu q1 bài này và bài 6 q1 ảnh là lựa chọn sai).
> Ảnh lượt 2 (designer 19/11, c8): sông Lô (Hà Giang, PD), nước nâu rộng, mặt nước gợn, chảy uốn quanh bờ tre; đã cắt bỏ phố và núi. `alt` khớp. Không câu nào nói nước sông xanh; không đưa chữ "phù sa".
> Ví dụ ba là câu an toàn của bài (khuyến nghị 7). Ví dụ một, hai dạy trước câu q6.

#### group explore_lake
label.en: Lake
label.vi: Hồ
color: gi_dong
sentence.en: A lake has land all around it.
sentence.vi: Hồ có đất bao quanh.
image.brief: [ảnh] Một hồ nước rộng, mặt nước phẳng lặng phản chiếu trời và cây, thấy rõ bờ bên kia và bờ hai bên (bờ bao quanh), hàng cây hay đồi thấp trên bờ; không công trình nổi tiếng (không tháp, chùa, cầu đỏ), không thuyền đạp vịt, không người, không chữ. Có thể chép mục `tray_lake` của Discoverer `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat` (Calm Waters, PD) nếu thấy bờ bao quanh. Ảnh ngang có khoảng trống (khung vuông, thẻ 5:2, 17:10, 4:3). Từ khoá tìm ảnh (EN): calm lake trees shore; still lake reflection; lake surrounded by trees
image.alt.en: Calm water ringed by trees
image.alt.vi: Mặt nước lặng, cây mọc quanh bờ
examples.1.en: the water stays still
examples.1.vi: nước hồ đứng yên
examples.2.en: a pond is like a small lake
examples.2.vi: ao giống một cái hồ nhỏ
examples.3.en: like Hoan Kiem Lake in Hanoi
examples.3.vi: như Hồ Gươm ở Hà Nội
> Hình gốc của cả chủ đề (kệ, q1, q2, q4, q5, từ `lake`; bài 5 kệ, q5, w1). `alt` không có chữ "lake" · "hồ" vì câu q1 hỏi "Which one is a lake?". Phải khác rõ `explore_river` (luật Explorer số bảy): hồ thấy bờ quanh, mặt nước lặng; sông là dải dài, có gợn chảy.
> Ví dụ ba: tên nơi chỉ ở lời, không gắn ảnh (ảnh không phải Hồ Gươm). Nếu PM áp khuyến nghị 6 cho mọi tên nơi thì đổi thành "ducks swim on the lake" · "vịt bơi trên mặt hồ".

#### group explore_mekong
label.en: The Mekong
label.vi: Sông Mê Kông
color: vang_hoe
sentence.en: The Mekong is a very long river.
sentence.vi: Sông Mê Kông là một con sông rất dài.
image.brief: [ảnh] **Cần ảnh đúng sông Mê Kông (kể cả sông Tiền, sông Hậu ở Việt Nam), giấy phép hợp lệ (CC0, PD, PDM, CC BY); thiếu thì bỏ tên** (ảnh sông lớn chung và câu dự phòng). Sông rất rộng, nước nâu đục, có thuyền, sà lan ở xa, bờ có hàng dừa hay cây xanh; trang gốc ghi rõ là sông Mê Kông; không chợ nổi đông người, không người nhìn rõ mặt, không chữ, không số trên thuyền; không lũ. Ảnh ngang. Từ khoá tìm ảnh (EN): Mekong River Vietnam; Mekong River boats; Tien River Vietnam
image.alt.en: A small boat on a brown river
image.alt.vi: Chiếc thuyền nhỏ trên dòng sông nước nâu
examples.1.en: it flows through many countries
examples.1.vi: sông chảy qua nhiều nước
examples.2.en: it reaches the south of Vietnam
examples.2.vi: sông chảy về miền Nam Việt Nam
examples.3.en: boats sail up and down it
examples.3.vi: thuyền đi lại trên sông
> Ảnh mới, chỉ dùng ở ô này. Bé kể được một con sông lớn ở Việt Nam (mục tiêu SK-058).
> Ảnh lượt 2 (designer 19/11, B1): "Vietnam 08 - 148 - life on the Mekong", CC BY 2.0, đúng sông Mê Kông; một thuyền gỗ nhỏ có mui chở củi trên sông nước nâu, bờ cây và lục bình; không chữ. Tên nơi giữ. `alt` cũ "A wide, brown river with boats" → "A small boat on a brown river" · "Chiếc thuyền nhỏ trên dòng sông nước nâu"; ví dụ ba cũ "big boats sail on it" · "thuyền lớn đi lại trên sông" → "boats sail up and down it" · "thuyền đi lại trên sông" (ảnh không có thuyền lớn).
> **Câu dự phòng khi thiếu ảnh đúng nơi:** `label` "Big river" · "Sông lớn"; `sentence` "Big rivers carry many boats." · "Sông lớn có nhiều thuyền qua lại."; ví dụ một "some rivers flow very far" · "có sông chảy rất xa"; ví dụ hai "the water can look brown" · "nước sông có khi trông nâu đục"; ví dụ ba "big boats sail on them" · "thuyền lớn đi lại trên sông"; `alt` giữ. Ghép ý chính không đổi (đã tính). Ghi tên nơi bị bỏ ở `_topic.md`.
> [CẦN KIỂM] Sông Mê Kông rất dài (khoảng bốn nghìn ba trăm tới bốn nghìn tám trăm cây số tuỳ nguồn; bài không nói số), chảy qua sáu nước, ở Việt Nam chảy qua đồng bằng sông Cửu Long. Nghe thử EN "Mekong", VI "Mê Kông".

#### group explore_by_river
label.en: By the river
label.vi: Bên sông
color: nau_dat
sentence.en: People live, travel and fish by rivers.
sentence.vi: Người ta sống, đi lại và đánh cá bên sông.
image.brief: [ảnh] Cảnh bên sông ở Việt Nam: vài ngôi nhà gỗ hay nhà sàn dọc bờ, một con đò hay thuyền nhỏ neo hay đang đi, có thể có lưới đánh cá phơi; người ở xa, không nhận ra mặt, không trẻ em bơi; không lũ; không biển hiệu, chữ, số trên thuyền. Có thể chép mục `tray_river` của Discoverer `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat` (sông miền Bắc có thuyền, CC0) nếu thấy nhà ven bờ. Ảnh ngang có khoảng trống (khung vuông Học, thẻ hai lựa chọn 17:10 q3). Từ khoá tìm ảnh (EN): river houses boats Vietnam; riverside village boats; stilt houses river
image.alt.en: A busy riverbank by a bridge
image.alt.vi: Bờ sông tấp nập, có cây cầu
examples.1.en: boats carry people and goods
examples.1.vi: thuyền chở người và hàng hoá
examples.2.en: houses line the riverbank
examples.2.vi: nhà cửa nằm dọc bờ sông
examples.3.en: like the Red River in Hanoi
examples.3.vi: như sông Hồng ở Hà Nội
> Ảnh mới (câu q3, từ `boat`). `alt` không có chữ "boat" · "thuyền" vì câu q3 hỏi "Where can a boat carry people?".
> Ảnh đã chọn (designer 19/11, lệch 5): bờ sông cù lao An Bình (Vĩnh Long), nhiều thuyền gỗ neo, nhà mái đỏ sau hàng cây; nhà không phải nhà gỗ. `alt` cũ "Wooden houses beside a river" · "Nhà gỗ bên bờ sông" → "A busy riverbank with houses" · "Bờ sông tấp nập, có nhà cửa". Không dùng đề xuất "Boats and houses by a river" của designer vì `alt` đáp án đúng câu q3 sẽ chứa chữ "boat" của câu hỏi (luật Lỗi hay gặp số mười hai).
> Lượt 2 (designer 19/11, c2): ảnh cắt bỏ thuyền có chữ sơn; còn dãy thuyền gỗ, cây cầu, cây xanh, một nhà nhỏ mép phải (nhà mái đỏ ra ngoài khung). `alt` → "A busy riverbank by a bridge" · "Bờ sông tấp nập, có cây cầu" (vẫn không có chữ "boat"). Câu chính ô ("People live, travel and fish by rivers.") và ví dụ là lời chung, giữ.
> Ví dụ ba: tên nơi chỉ ở lời, không gắn ảnh. Nếu PM áp khuyến nghị 6 cho mọi tên nơi thì đổi thành "fishing nets dry in the sun" · "lưới đánh cá phơi dưới nắng".
> [CẦN KIỂM] Sông Hồng chảy qua Hà Nội.

### new_words
id: 3545ac34-db17-4852-8915-7422e938a51c
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: river, lake

## Chơi

> Bé chọn ba nơi có nước: một dòng sông, một cái hồ, biển. Đạt khi đủ ba nhóm và không chọn món bẫy.
> Món bẫy chứa nước nhưng do người làm ra: bể bơi, bể cá. Cả hai lặng như hồ, nên bé phải nghĩ "tự nhiên hay người làm".
> Kệ bảy món, toàn ảnh chụp.

### tray
id: f43a0299-85e6-4373-960e-97c8480c85fc
type: build_tray
version: 1
prompt.en: Find a river, a lake and the sea
prompt.vi: Tìm sông, hồ và biển
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick a river, a lake and the sea.
messages.start.vi: Em chọn một dòng sông, một cái hồ và biển nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! You found three kinds of water.
messages.balanced.vi: Tuyệt! Em đã tìm được ba nơi có nước.
messages.has_limited.en: People made that one.
messages.has_limited.vi: Cái này do người làm ra.
messages.missing.tray_rivers.en: You still need a river.
messages.missing.tray_rivers.vi: Em còn thiếu một dòng sông.
messages.missing.tray_lakes.en: You still need a lake.
messages.missing.tray_lakes.vi: Em còn thiếu một cái hồ.
messages.missing.tray_seas.en: You still need the sea.
messages.missing.tray_seas.vi: Em còn thiếu biển.
> Lời nhắn `has_limited` đúng với cả hai món bẫy (bể bơi, bể cá).

#### group tray_rivers
label.en: River
label.vi: Sông
color: cham
role: required

#### group tray_lakes
label.en: Lake
label.vi: Hồ
color: gi_dong
role: required

#### group tray_seas
label.en: Sea
label.vi: Biển
color: vang_hoe
role: required

#### group tray_made
label.en: Made by people
label.vi: Do người làm ra
color: do_son
role: limit

#### item tray_river
label.en: Wide river
label.vi: Sông rộng
group: tray_rivers
image.brief: Dùng lại hình `explore_river`. Từ khoá tìm ảnh (EN): wide river ripples
image.alt.en: A wide river with ripples
image.alt.vi: Dòng sông rộng gợn sóng

#### item tray_river_above
label.en: River from above
label.vi: Sông nhìn từ trên cao
group: tray_rivers
image.brief: Dùng lại hình `explore_water` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): winding river aerial fields
image.alt.en: Water winding through rice fields
image.alt.vi: Dải nước uốn lượn qua ruộng lúa

#### item tray_lake
label.en: Calm lake
label.vi: Hồ lặng
group: tray_lakes
image.brief: Dùng lại hình `explore_lake`. Từ khoá tìm ảnh (EN): calm lake trees shore
image.alt.en: Calm water ringed by trees
image.alt.vi: Mặt nước lặng, cây mọc quanh bờ

#### item tray_ba_be
label.en: Ba Be Lake
label.vi: Hồ Ba Bể
group: tray_lakes
image.brief: [ảnh] **Cần ảnh đúng hồ Ba Bể, giấy phép hợp lệ (CC0, PD, PDM, CC BY); thiếu thì bỏ tên** (ảnh hồ giữa núi đồi chung, nhãn dự phòng). Mặt hồ xanh lặng nằm giữa núi rừng, chụp từ trên cao hay từ bờ, thấy núi bao quanh; có thể có một con thuyền nhỏ ở xa; trang gốc ghi rõ là hồ Ba Bể; không người nhìn rõ, không chữ, không biển hiệu. Khác `explore_lake` (khác ảnh; hồ này có núi quanh). Ảnh vuông hay ngang (món Chơi vuông, thẻ thưởng vuông). Từ khoá tìm ảnh (EN): Ba Be Lake; Ba Be National Park lake; lake among mountains Vietnam
image.alt.en: A green lake among mountains
image.alt.vi: Hồ nước xanh giữa núi rừng
> Hình gốc (kệ Chơi, thẻ `ba_be_card`).
> **Nhãn dự phòng khi thiếu ảnh đúng nơi:** `label` "Lake in the hills" · "Hồ giữa núi đồi"; `alt` giữ.

#### item tray_sea
label.en: Sea
label.vi: Biển
group: tray_seas
image.brief: Dùng lại hình `tray_sea` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): open sea horizon
image.alt.en: Wide blue water to the sky
image.alt.vi: Nước xanh mênh mông tới chân trời

#### item tray_pool
label.en: Swimming pool
label.vi: Bể bơi
group: tray_made
image.brief: Dùng lại hình `tray_pool` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): empty outdoor swimming pool
image.alt.en: An empty swimming pool
image.alt.vi: Bể bơi vắng người

#### item tray_fishtank
label.en: Fish tank
label.vi: Bể cá
group: tray_made
image.brief: [ảnh] Một bể cá kính trong nhà có vài con cá vàng và cây thuỷ sinh, đặt trên kệ hay bàn, chụp ngang, thấy rõ thành kính; không người, không nhãn hiệu, không chữ. Từ khoá tìm ảnh (EN): home fish tank goldfish; aquarium goldfish plants
image.alt.en: A glass tank with goldfish
image.alt.vi: Bể kính có cá vàng
> Ảnh mới, chỉ dùng ở bài này. Món bẫy giống nhóm "Lake" (nước lặng, có cá) nhưng do người làm ra. Ảnh lượt 2 (designer 19/11, c10): trọn một bể cá kính trên bàn gỗ, cây thuỷ sinh, ba con cá vàng; `alt` "A glass tank with goldfish" khớp.

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1 ba lựa chọn, q3 hai lựa chọn, q5 hai lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4).
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính. Mọi lựa chọn là ảnh chụp bé đã gặp hôm nay (ô Học hay kệ Chơi); câu q4 có ảnh ao của chủ đề #1 (thẻ xếp thứ tự, không có một đáp án riêng).

### q1
id: 3941efc6-7a95-4ea4-ac44-6a7178e42bbd
format: single_choice
version: 1
dok: 1
prompt.en: Which one is a lake?
prompt.vi: Hình nào là cái hồ?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for land on every side.
hint.vi: Em tìm chỗ nước có bờ ở mọi phía nhé.
explanation_correct.en: Yes! Its water lies calm and still.
explanation_correct.vi: Đúng rồi! Nước hồ nằm yên, phẳng lặng.
explanation_wrong.en: The answer is the lake. Land is all around.
explanation_wrong.vi: Đáp án là cái hồ. Hồ có đất bao quanh.
> DOK 1: nhận ra hồ (ô Lake). Ba ảnh khác rõ: dải sông có gợn chảy, mặt hồ lặng có bờ quanh, biển tới chân trời. Gợi ý chỉ điều nhìn thấy, không gọi tên hồ.

#### option q1_river
correct: false
feedback.en: This river runs on and on.
feedback.vi: Dòng sông này chảy dài mãi.
label.en: river
label.vi: dòng sông
image.brief: Dùng lại hình `explore_river`. Từ khoá tìm ảnh (EN): wide river ripples
image.alt.en: A wide river with ripples
image.alt.vi: Dòng sông rộng gợn sóng

#### option q1_lake
correct: true
label.en: lake
label.vi: cái hồ
image.brief: Dùng lại hình `explore_lake`. Từ khoá tìm ảnh (EN): calm lake trees shore
image.alt.en: Calm water ringed by trees
image.alt.vi: Mặt nước lặng, cây mọc quanh bờ

#### option q1_sea
correct: false
feedback.en: This water stretches to the sky.
feedback.vi: Mặt nước này rộng tới tận chân trời.
label.en: sea
label.vi: biển
image.brief: Dùng lại hình `tray_sea` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): open sea horizon
image.alt.en: Wide blue water to the sky
image.alt.vi: Nước xanh mênh mông tới chân trời

### q2
id: 58d1df9c-4684-4762-93c5-a90f763eafd8
format: true_false
version: 1
dok: 1
prompt.en: A lake has land all around it.
prompt.vi: Hồ có đất bao quanh.
image.brief: Dùng lại hình `explore_lake`. Từ khoá tìm ảnh (EN): calm lake trees shore
image.alt.en: Calm water ringed by trees
image.alt.vi: Mặt nước lặng, cây mọc quanh bờ
answer: true
hint.en: Look at the edges of the water.
hint.vi: Em nhìn mép nước quanh hồ nhé.
explanation_correct.en: Yes! You can see the far bank.
explanation_correct.vi: Đúng rồi! Em nhìn thấy cả bờ bên kia.
explanation_wrong.en: This is true. Land surrounds a lake.
explanation_wrong.vi: Câu này đúng. Đất bao quanh hồ.
feedback_false.en: Trees grow on the banks all around.
feedback_false.vi: Cây mọc trên bờ quanh hồ.
> DOK 1: nhớ lại câu chính ô Lake. Hình là đúng vật được nói tới.

### q3
id: 1d1f4799-1ea3-4919-a119-9dda86de8a56
format: single_choice
version: 1
dok: 1
prompt.en: Where can a boat carry people?
prompt.vi: Thuyền chở người đi ở đâu?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think how far a boat can travel.
hint.vi: Em nghĩ xem thuyền đi được bao xa nhé.
explanation_correct.en: Yes! Boats go up and down rivers.
explanation_correct.vi: Đúng rồi! Thuyền đi ngược xuôi trên sông.
explanation_wrong.en: The answer is the river. Boats travel far there.
explanation_wrong.vi: Đáp án là dòng sông. Thuyền đi được rất xa trên sông.
> DOK 1: nhớ lại ý chính ba (người đi lại bên sông, ví dụ một ô By the river). Hai ảnh bé đã gặp hôm nay (ô Học, kệ Chơi). `alt` đáp án ("A busy riverbank by a bridge") không có chữ của câu hỏi.

#### option q3_river
correct: true
label.en: river
label.vi: dòng sông
image.brief: Dùng lại hình `explore_by_river`. Từ khoá tìm ảnh (EN): river houses boats Vietnam
image.alt.en: A busy riverbank by a bridge
image.alt.vi: Bờ sông tấp nập, có cây cầu

#### option q3_pool
correct: false
feedback.en: A swimming pool is for swimming.
feedback.vi: Bể bơi là chỗ để bơi.
label.en: swimming pool
label.vi: bể bơi
image.brief: Dùng lại hình `tray_pool` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): empty outdoor swimming pool
image.alt.en: An empty swimming pool
image.alt.vi: Bể bơi vắng người

### q4
id: c2a8310c-3843-40c3-9a9e-05a0d7b332ad
format: order_sequence
version: 1
dok: 2
prompt.en: Start with the smallest. Put them in order.
prompt.vi: Bắt đầu từ chỗ nhỏ nhất. Em xếp theo thứ tự nhé.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_pond, q4_lake, q4_sea
hint.en: The sea is the biggest.
hint.vi: Biển là rộng nhất.
explanation_correct.en: Yes! The sea is far bigger than lakes.
explanation_correct.vi: Đúng rồi! Biển rộng hơn hồ rất nhiều.
explanation_wrong.en: The order is pond, lake, then sea.
explanation_wrong.vi: Thứ tự là ao, hồ, rồi biển.
> DOK 2: so độ rộng ba nơi có nước (ví dụ hai ô Lake "a pond is like a small lake"; bài 1 "the sea is much wider"). `prompt` nêu đầu nhỏ; gợi ý chỉ nhắc đầu kia. Thẻ trong file không theo thứ tự đúng. Ba thẻ là ảnh chụp, khung vuông.
> Ảnh ao phải thấy hết cái ao, nhỏ rõ ràng so với hồ; ảnh hồ thấy bờ bên kia; ảnh biển không thấy bờ (designer kiểm ba ảnh cạnh nhau).

#### item q4_lake
label.en: lake
label.vi: hồ
image.brief: Dùng lại hình `explore_lake`. Từ khoá tìm ảnh (EN): calm lake trees shore
image.alt.en: Calm water ringed by trees
image.alt.vi: Mặt nước lặng, cây mọc quanh bờ

#### item q4_sea
label.en: sea
label.vi: biển
image.brief: Dùng lại hình `tray_sea` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): open sea horizon
image.alt.en: Wide blue water to the sky
image.alt.vi: Nước xanh mênh mông tới chân trời

#### item q4_pond
label.en: pond
label.vi: ao
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A small pond among trees
image.alt.vi: Cái ao nhỏ giữa rừng cây
> Tester c12 (19/11): ảnh `q1` của `ca-va-luong-cu` là ao trong rừng (Ba Lan), không phải làng; `alt` riêng của chỗ này đổi theo ảnh (`alt` gốc "A pond in a village" · "Cái ao ở làng quê"). Nếu designer đổi sang ảnh ao sen Bình Quới thì `alt` theo dòng phương án dưới.
> Nếu ảnh ao này không thấy hết bờ ao trong khung vuông (ảnh nhìn ngang, bờ xa), designer báo phiên chính: phương án là chép mục `tray_pond` của Discoverer `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat` (ao sen Bình Quới, CC BY 3.0, thấy hết ao), đặt key `q4_pond`, `alt` "A small pond with lotus leaves" · "Cái ao nhỏ có lá sen".

### q5
id: 7ca5fe2d-dfaf-4be4-88b7-f8305bcfe58a
format: single_choice
version: 1
dok: 2
prompt.en: From up high, which one is a river?
prompt.vi: Nhìn từ trên cao, đâu là dòng sông?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Rivers are long, like a ribbon.
hint.vi: Sông dài, uốn lượn như dải lụa.
explanation_correct.en: Yes! It winds on and on through fields.
explanation_correct.vi: Đúng rồi! Sông uốn lượn mãi qua cánh đồng.
explanation_wrong.en: The answer is the long, winding river.
explanation_wrong.vi: Đáp án là dòng sông dài, uốn lượn.
> DOK 2: áp ý chính một vào góc nhìn mới (từ trên cao, như bài 1). Hai ảnh bé đã gặp hôm nay (kệ Chơi, ô Lake). `alt` đáp án ("Water winding through rice fields") không có chữ "river" · "sông". Gợi ý là cách so hình dáng (dài như dải lụa), không gọi tên đáp án.

#### option q5_river
correct: true
label.en: river
label.vi: dòng sông
image.brief: Dùng lại hình `explore_water` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): winding river aerial fields
image.alt.en: Water winding through rice fields
image.alt.vi: Dải nước uốn lượn qua ruộng lúa

#### option q5_lake
correct: false
feedback.en: This water lies calm between its banks.
feedback.vi: Mặt nước này nằm yên giữa các bờ.
label.en: lake
label.vi: cái hồ
image.brief: Dùng lại hình `explore_lake`. Từ khoá tìm ảnh (EN): calm lake trees shore
image.alt.en: Calm water ringed by trees
image.alt.vi: Mặt nước lặng, cây mọc quanh bờ

### q6
id: 8976d200-d41d-47b9-8b51-ff12ecc095a4
format: true_false
version: 1
dok: 2
misconception: river_water_still
prompt.en: River water just stays in one place.
prompt.vi: Nước sông chỉ nằm yên một chỗ.
image.brief: Dùng lại hình `explore_river`. Từ khoá tìm ảnh (EN): wide river ripples
image.alt.en: A wide river with ripples
image.alt.vi: Dòng sông rộng gợn sóng
answer: false
hint.en: Think of a leaf dropped in a river.
hint.vi: Em nghĩ tới chiếc lá thả xuống sông nhé.
explanation_correct.en: River water keeps flowing along.
explanation_correct.vi: Nước sông luôn chảy đi.
explanation_wrong.en: This is false. River water flows along.
explanation_wrong.vi: Câu này sai. Nước sông chảy đi.
feedback_true.en: Ripples show this water is moving.
feedback_true.vi: Gợn sóng cho thấy nước đang chảy.
> Câu misconception (`river_water_still`), bằng hình, DOK 2: bé nghĩ sông là "cái hồ dài" sẽ chạm gật đầu. Câu chỉ kiểm một việc: nước sông có chảy không. Hình là dòng sông có gợn chảy (đúng vật được nói tới). `explanation_correct` là đúng câu `correction` ở `_topic.md`. Gợi ý (chiếc lá trôi) và phản hồi (gợn sóng) không lặp ý.
> Không nói nước chảy về đâu (Discoverer #9 *Sông, hồ và vòng tuần hoàn nước*).

## Từ vựng

### river
id: c393862a-015a-4cb9-888f-77a4923fcd52
tier: core
term.en: river
term.vi: sông
example.en: Boats go up and down the river.
example.vi: Thuyền đi ngược xuôi trên sông.
image.brief: Dùng lại hình `explore_river`. Từ khoá tìm ảnh (EN): wide river ripples
image.alt.en: A wide river with ripples
image.alt.vi: Dòng sông rộng gợn sóng

### lake
id: c8b1d1d6-8329-425d-bbca-ff340a17da4e
tier: core
term.en: lake
term.vi: hồ
example.en: Ducks swim on the calm lake.
example.vi: Vịt bơi trên mặt hồ phẳng lặng.
image.brief: Dùng lại hình `explore_lake`. Từ khoá tìm ảnh (EN): calm lake trees shore
image.alt.en: Calm water ringed by trees
image.alt.vi: Mặt nước lặng, cây mọc quanh bờ

### flow
id: a40d063f-56a8-4c2d-88f7-b95d0e9eca24
tier: extra
term.en: flow
term.vi: chảy
example.en: Watch the river water flow.
example.vi: Em ngắm nước sông chảy.
image.brief: Dùng lại hình `explore_water` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): winding river aerial fields
image.alt.en: Water winding through rice fields
image.alt.vi: Dải nước uốn lượn qua ruộng lúa

### boat
id: 0837575c-6adb-460c-8426-2ed6f891d65d
tier: extra
term.en: boat
term.vi: thuyền
example.en: A small boat crosses the river.
example.vi: Con đò nhỏ qua sông.
image.brief: Dùng lại hình `explore_by_river`. Từ khoá tìm ảnh (EN): river houses boats Vietnam
image.alt.en: A busy riverbank by a bridge
image.alt.vi: Bờ sông tấp nập, có cây cầu

## Thưởng

### ba_be_card
id: eac7b4b7-88a0-45ad-8316-3a2ff229c0af
set: landforms
rarity: common
name.en: Ba Be Lake
name.vi: Hồ Ba Bể
tag.en: A lake among mountains
tag.vi: Hồ giữa núi rừng
fact.en: Ba Be is three lakes joined together.
fact.vi: Hồ Ba Bể gồm ba hồ nối liền nhau.
image.brief: Dùng lại hình `tray_ba_be`. Từ khoá tìm ảnh (EN): Ba Be Lake
image.alt.en: A green lake among mountains
image.alt.vi: Hồ nước xanh giữa núi rừng
> Bộ `set: landforms`.
> **Thẻ dự phòng khi thiếu ảnh đúng nơi:** key `mountain_lake_card`, `name` "Mountain lake" · "Hồ trên núi", `tag` giữ, `fact` "Some lakes lie high among mountains." · "Có hồ nằm trên cao, giữa núi rừng.", hình dùng lại ảnh hồ giữa núi chung của món `tray_ba_be`.
> [CẦN KIỂM] Hồ Ba Bể gồm ba hồ nhỏ nối nhau (Pé Lầm, Pé Lù, Pé Lèng), tên "Ba Bể" nghĩa là "ba hồ"; nằm giữa núi đá vôi. Nghe thử EN "Ba Be".

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật (CC0, PD, PDM, CC BY có ghi công). Không hình vẽ.
- **Ảnh mới (sáu):** `explore_river` (sông rộng có gợn chảy), `explore_lake` (hồ lặng, thấy bờ quanh), `explore_mekong` (**cần ảnh đúng sông Mê Kông**), `explore_by_river` (nhà và thuyền ven sông), `tray_ba_be` (**cần ảnh đúng hồ Ba Bể**; thẻ `ba_be_card` dùng lại), `tray_fishtank` (bể cá). `explore_river`, `explore_lake` là **hình gốc của cả chủ đề** (bài 5, 6 dùng lại): giữ đúng key và `alt`.
- **Sông khác hồ rõ bằng mắt** (luật Explorer số bảy): sông là dải nước dài, thấy gợn chảy; hồ là mặt nước lặng, thấy bờ bao quanh. Câu q1, q5 đặt hai ảnh này cạnh nhau.
- **Câu q4:** ao, hồ, biển phải nhìn ra ngay nhỏ, vừa, lớn (ghi chú dưới thẻ `q4_pond`).
- **An toàn** (khuyến nghị 7): không trẻ em bơi, lội, đứng mép nước; không lũ, nước tràn bờ; không người đuối nước, thuyền lật.
- **Dùng lại trong chủ đề:** bài 1 `explore_water`, `tray_sea`, `tray_pool`; bài 3 `explore_plain` (w1).
- **Dùng lại chủ đề khác:** `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha` `w1` (hàng rào tre); `goi-ten-va-nhom-dong-vat/ca-va-luong-cu` `q1` (ao, câu q4); `noi-song-tren-trai-dat/rung-ngap-man-va-dam-lay` `explore_swamp` (w2).
- **Màu:** Học: River `cham`, Lake `gi_dong`, The Mekong `vang_hoe`, By the river `nau_dat`. Chơi: Sông `cham`, Hồ `gi_dong`, Biển `vang_hoe`, Do người làm ra `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (river, lake). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `true_false` (w1 Đúng, w2 Sai). Quiz `single_choice` (q1 ba lựa chọn; q3, q5 hai lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`river_water_still`). Không có `labels` ở câu `true_false`.
- **Màn Chơi, ví dụ để kiểm:** Sông rộng, Hồ lặng, Biển → `balanced`; Sông nhìn từ trên cao, Hồ Ba Bể, Biển → `balanced`; Sông rộng, Hồ lặng, Hồ Ba Bể → `missing.tray_seas`; Bể bơi, Hồ lặng, Biển → `has_limited`; Sông rộng, Bể cá, Biển → `has_limited`.
- **Khởi động:** w1 → `nui-song-va-bien/dong-bang-va-ruong-lua` (id có sẵn); w2 → `noi-song-tren-trai-dat/rung-ngap-man-va-dam-lay` (đã có id).
- **Thẻ thưởng:** `ba_be_card` (dự phòng `mountain_lake_card`), bộ `landforms`.
- **Từ EN có thể ngoài Starters/Movers:** ripples, flows, still, pond, riverbank, goods, Mekong, Hoan Kiem, Red River, swamp, lotus, ribbon, winds, goldfish, tank. Nghe thử giọng EN đọc "Mekong", "Hoan Kiem Lake", "Ba Be"; giọng VI đọc "Mê Kông", "Hồ Gươm", "Ba Bể", "ngược xuôi".
