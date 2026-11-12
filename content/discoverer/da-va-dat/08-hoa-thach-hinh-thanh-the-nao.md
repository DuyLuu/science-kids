---
id: 89838997-a0a7-4e75-a862-a4f2136700df
topic: da-va-dat
slug: hoa-thach-hinh-thanh-the-nao
order: 8
stage: core
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: How fossils are formed
vi: Hoá thạch hình thành thế nào?
> Giữ đúng tên ở `content/syllabus.json` (`rocks-and-soils`, bài số tám).

## Mục tiêu
en: I can describe the steps of how a fossil forms.
vi: Em kể được các bước một hoá thạch hình thành.
> Trạng thái: **nháp do AI soạn (content-editor, người soạn B), chưa duyệt.** Ticket SK-039 bước 2, ngày 11/11/2026. Chưa chạy `validate`, chưa chạy `ids`.
> Nối *Khủng long* bài ba, không dạy lại: bên đó đã dạy hoá thạch là xương, răng, trứng, dấu chân; xương bị vùi dần hoá thành đá; nhà cổ sinh vật học. Bài này nhắc lại ở w2, rồi đi sâu: hoá thạch không chỉ của khủng long, phần mềm phân huỷ, trầm tích vùi lấp, sức ép, dấu in. Không câu nào lặp câu q1 ("xương bị vùi hoá thành gì") hay q5 ("xương nào dễ thành hoá thạch nhất") của bài đó.
> Sửa `only_dinosaurs_fossils` ở ý chính một, ô "Not just dinosaurs", phần Chơi, câu q3 và câu q6 (gắn key, Na chưa đúng). Không dùng chữ "tiến hoá", "tổ tiên"; nói "mục đi", "phân huỷ", không nói nấm, vi khuẩn (mục "Để dành" ở `_topic.md`).

## Ý chính
1.en: Plants and many animals can become fossils, not just dinosaurs.
1.vi: Cây cối và nhiều loài vật có thể thành hoá thạch, không chỉ khủng long.
2.en: Soft parts decay. Sediment slowly buries the hard parts.
2.vi: Phần mềm bị phân huỷ. Trầm tích dần vùi lấp phần cứng.
3.en: Some fossils are just an imprint, like a leaf shape.
3.vi: Có hoá thạch chỉ là dấu in, như hình chiếc lá trên đá.

## Khởi động

> Hai câu, đúng bảng Khởi động ở `_topic.md`:
> - w1 ôn bài bảy (một ngày): dòng sông mang cát đi xa là xói mòn. Ba lựa chọn dùng lại ba hình câu q4 bài bảy (bảng Hình dùng chung); câu hỏi khác câu q4 bên đó.
> - w2 ôn *Khủng long* bài ba (khoảng một tháng): "Buried bones can slowly turn to rock." (Đúng). Câu này là nền cho ô Trầm tích hôm nay.

### w1
id: a0854d70-ac53-4d75-99df-d309c3fffd6c
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/da-bi-bao-mon-theo-thoi-gian
prompt.en: A river carries sand far away. What is this called?
prompt.vi: Dòng sông mang cát đi thật xa. Việc đó gọi là gì?
image.brief: Dùng lại hình `tray_stream` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): stream small rocks clear water
image.alt.en: A small stream over rocks
image.alt.vi: Con suối nhỏ chảy qua đá
hint.en: Remember lesson seven. Breaking and carrying are different.
hint.vi: Em nhớ lại bài bảy nhé. Làm vỡ và mang đi là hai việc khác nhau.
explanation_correct.en: Yes! Erosion carries bits of rock to new places.
explanation_correct.vi: Đúng rồi! Xói mòn mang mảnh đá vụn đi tới nơi khác.
explanation_wrong.en: The answer is erosion. Weathering only breaks the rock.
explanation_wrong.vi: Đáp án là xói mòn. Phong hoá chỉ làm đá vỡ ra.
> Hình câu hỏi là con suối (tình huống), không phải hình của đáp án. Gợi ý chỉ cách nghĩ, không gọi tên ô "Erosion" · "Xói mòn" của bài bảy (tên ô trùng nhãn đáp án). Lựa chọn và vị trí đáp án (thứ nhất) theo bảng Khởi động.

#### option w1_erosion
correct: true
label.en: erosion
label.vi: xói mòn
image.brief: Dùng lại hình `explore_erosion` ở bài `da-va-dat/da-bi-bao-mon-theo-thoi-gian`. Từ khoá tìm ảnh (EN): muddy river eroded riverbank
image.alt.en: A river with a worn bank
image.alt.vi: Dòng sông có bờ bị lở

#### option w1_weathering
correct: false
label.en: weathering
label.vi: phong hoá
image.brief: Dùng lại hình `explore_weathering` ở bài `da-va-dat/da-bi-bao-mon-theo-thoi-gian`. Từ khoá tìm ảnh (EN): banyan tree roots old stone wall
image.alt.en: Tree roots over an old stone wall
image.alt.vi: Rễ cây trùm lên bức tường đá cũ

#### option w1_erupt
correct: false
label.en: eruption
label.vi: phun trào
image.brief: Dùng lại hình `explore_erupt` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): volcano erupting lava night distant
image.alt.en: A volcano with red lava
image.alt.vi: Núi lửa có dung nham đỏ
> `alt` sửa so với gốc ("A volcano erupting" · "Núi lửa đang phun trào"), vì gốc chứa đúng chữ của nhãn.

### w2
id: 6ec1dc97-3fca-40dd-ae02-daf804701910
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: khung-long/hoa-thach-ke-chuyen-khung-long
prompt.en: Buried bones can slowly turn to rock.
prompt.vi: Xương bị vùi kín có thể dần hoá thành đá.
image.brief: Dùng lại hình `q4` ở bài `khung-long/hoa-thach-ke-chuyen-khung-long`. Từ khoá tìm ảnh (EN): paleontology tools hammer chisel brush
image.alt.en: Tools for finding fossils
image.alt.vi: Dụng cụ tìm hoá thạch
answer: true
hint.en: Remember how fossils formed in the dinosaur lessons.
hint.vi: Em nhớ lại hoá thạch khủng long hình thành ra sao nhé.
explanation_correct.en: Yes! Over millions of years, buried bones turn to rock.
explanation_correct.vi: Đúng rồi! Qua hàng triệu năm, xương bị vùi kín dần hoá thành đá.
explanation_wrong.en: This is true. Buried bones slowly turn to rock.
explanation_wrong.vi: Câu này đúng. Xương bị vùi kín dần hoá thành đá.
> Đúng chữ EN ở bảng Đúng/Sai (bài tám w2, Đúng). Câu khẳng định khớp ý chính hai của *Khủng long* bài ba ("Over millions of years, buried bones slowly turn to rock."). Hình là bộ dụng cụ tìm hoá thạch, không có hoá thạch, theo bảng Hình dùng chung.

## Học

> Bốn ô, từ cụ thể tới trừu tượng: những sinh vật thành hoá thạch (ý chính một, vật nhìn thấy được), phân huỷ, trầm tích (ý chính hai, quá trình rất lâu), dấu in (ý chính ba).
> Ô hai và ô ba là gốc của bộ hình vẽ "Mặt cắt lòng đất" (`_topic.md`, Quy ước hình mục bốn): đáy biển, chiếc vỏ, các lớp bùn cát màu khác nhau. Bài chín vẽ hổ phách, khúc gỗ cùng nét.
> Ô ba nói "chỉ rất ít sinh vật thành hoá thạch" (ý của Oak); ô một và phần Chơi là chỗ sửa `only_dinosaurs_fossils` trước câu q6.

### explore
id: 1753f391-cc6f-4680-bec3-01f846474465
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_not_dino
label.en: Not just dinosaurs
label.vi: Không chỉ khủng long
color: gi_dong
sentence.en: Shells, fish, plants and insects can become fossils too.
sentence.vi: Vỏ sò, cá, cây cối và côn trùng cũng có thể thành hoá thạch.
image.brief: [ảnh] Một phiến đá có rất nhiều vỏ sò hoá thạch nằm sát nhau, chụp thẳng gần vừa; mẫu vật trong bảo tàng hay bộ sưu tập; không có nhãn mẫu vật, thước đo, tay người hay chữ. Món Chơi `tray_shells_rock` dùng lại ảnh này. Từ khoá tìm ảnh (EN): fossil shells in rock slab
image.alt.en: Many shells in a slab of rock
image.alt.vi: Nhiều vỏ sò trong một phiến đá
examples.1.en: seashells
examples.1.vi: vỏ sò
examples.2.en: fish
examples.2.vi: cá
examples.3.en: fern leaves
examples.3.vi: lá dương xỉ
examples.4.en: insects
examples.4.vi: côn trùng

#### group explore_decay
label.en: Decay
label.vi: Phân huỷ
color: vang_hoe
sentence.en: Soft parts decay. Shells, bones and teeth stay.
sentence.vi: Phần mềm bị phân huỷ. Vỏ, xương và răng còn lại.
image.brief: [hình vẽ] Bộ "Mặt cắt lòng đất", khung một: đáy biển nước xanh nhạt, một chiếc vỏ ốc biển xoắn đã rỗng (phần thân mềm không còn) nằm trên lớp bùn mịn màu nâu xám, vài cọng rong nhỏ; nhìn ngang như một lát cắt; không có con vật sống, không có xác con vật, không có chữ, không có mũi tên. Câu q4 và từ `decay` dùng lại hình này.
image.alt.en: An empty shell on the sea floor
image.alt.vi: Chiếc vỏ rỗng dưới đáy biển
examples.1.en: soft parts rot away
examples.1.vi: phần mềm mục rữa
examples.2.en: hard shells stay
examples.2.vi: vỏ cứng còn lại
examples.3.en: bones and teeth stay
examples.3.vi: xương và răng còn lại
examples.4.en: fallen leaves rot, too
examples.4.vi: lá rụng cũng mục dần
> Hình chỉ có chiếc vỏ rỗng, không vẽ con vật chết, theo mục An toàn của `_topic.md` và cách làm của *Khủng long* bài ba.

#### group explore_sediment
label.en: Sediment
label.vi: Trầm tích
color: cham
sentence.en: Sediment is mud and sand that settles in layers.
sentence.vi: Trầm tích là bùn cát lắng xuống thành từng lớp.
image.brief: [hình vẽ] Bộ "Mặt cắt lòng đất", khung hai: cùng chỗ đáy biển ở khung một, nhìn cắt ngang lòng đất; chiếc vỏ xoắn nằm dưới nhiều lớp bùn cát màu khác nhau chồng lên nhau (nâu, xám, vàng nhạt), lớp dưới cùng đậm màu và trông rắn như đá; không có chữ, không có mũi tên. Câu q4 và từ `pressure` dùng lại hình này.
image.alt.en: Layers of mud and sand over a shell
image.alt.vi: Nhiều lớp bùn cát phủ lên chiếc vỏ
examples.1.en: mud and sand cover the shell
examples.1.vi: bùn cát phủ kín chiếc vỏ
examples.2.en: more layers pile on top
examples.2.vi: thêm nhiều lớp chồng lên trên
examples.3.en: pressure turns them to rock
examples.3.vi: sức ép làm chúng hoá thành đá
examples.4.en: only a few become fossils
examples.4.vi: chỉ rất ít thành hoá thạch
> [CẦN KIỂM] Giản lược: các lớp trầm tích chồng lên, sức ép của các lớp bên trên cùng thời gian rất dài làm bùn cát rắn lại thành đá; chỉ một phần rất nhỏ sinh vật thành hoá thạch (ý của Oak). Không dùng tên "đá trầm tích" (Main session chốt 11/11).

#### group explore_imprint
label.en: Imprint
label.vi: Dấu in
color: do_son
sentence.en: Some fossils are just a shape pressed into rock.
sentence.vi: Có hoá thạch chỉ là một hình in lên đá.
image.brief: [hình vẽ] Đôi bàn tay trẻ em (chỉ thấy tay) vừa nhấc một vỏ ốc lên khỏi miếng đất nặn màu be, trên đất nặn còn in rõ hình vỏ ốc; nền bàn trơn; không vẽ mặt, không có chữ. Đây là thí nghiệm ở nhà của bài (mục Thí nghiệm ở nhà ở `_topic.md`).
image.alt.en: Hands pressing a shell into play dough
image.alt.vi: Đôi tay ấn vỏ ốc vào đất nặn
examples.1.en: press a shell into play dough
examples.1.vi: ấn vỏ ốc vào đất nặn
examples.2.en: a leaf shape in rock
examples.2.vi: hình chiếc lá trên đá
examples.3.en: a feather shape in rock
examples.3.vi: hình chiếc lông chim trên đá
examples.4.en: a footprint in rock
examples.4.vi: dấu chân trên đá
> Ô này dạy "dấu in" và ví dụ "hình chiếc lá trên đá", ý được ôn ở bài chín w1. Ví dụ bốn nhắc dấu chân khủng long của *Khủng long* bài ba, không dạy lại.

### new_words
id: 322f7738-e564-47ad-a852-ca5abd231138
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: sediment, decay, imprint

## Chơi

> "Không chỉ khủng long! Tìm ba hoá thạch". Bé chọn một hoá thạch con vật biển, một hoá thạch cây cối, một hoá thạch cá hay côn trùng; không chọn thứ còn mới, chưa hoá thành đá. Trò chơi dùng ngay ý chính một và sửa `only_dinosaurs_fossils` trước câu q6.
> - Bẫy có chủ ý, mỗi món giống một nhóm: vỏ ốc biển trên cát (giống con vật biển), cá khô (giống cá), lá khô vừa rụng (giống cây cối). Bé không xếp được theo hình dáng; bé phải hỏi "thứ này đã hoá thành đá chưa".
> - Nhãn món tả vật, không có chữ "fossil" · "hoá thạch" (`_topic.md`, Quy ước hình mục năm); món đúng nói "in rock" · "trên đá", "trong đá", như *Khủng long* bài ba.
> - Cả kệ là ảnh chụp.

### tray
id: 8d88ffd4-8581-4ea9-af52-d8bd1855bd6b
type: build_tray
version: 1
prompt.en: Not just dinosaurs! Find three fossils
prompt.vi: Không chỉ khủng long! Tìm ba hoá thạch
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find a fossil for each group.
messages.start.vi: Em tìm một hoá thạch cho mỗi nhóm nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Shells, plants, fish and insects can all be fossils.
messages.balanced.vi: Tuyệt! Vỏ sò, cây cối, cá và côn trùng đều có thể thành hoá thạch.
messages.has_limited.en: That is new. It has not turned to rock.
messages.has_limited.vi: Thứ này còn mới. Nó chưa hoá thành đá.
messages.missing.tray_sea_group.en: You still need a sea animal in rock.
messages.missing.tray_sea_group.vi: Em còn thiếu một con vật biển trong đá.
messages.missing.tray_plant_group.en: You still need a plant in rock.
messages.missing.tray_plant_group.vi: Em còn thiếu một hình cây cối trên đá.
messages.missing.tray_small_group.en: You still need a fish or insect in rock.
messages.missing.tray_small_group.vi: Em còn thiếu một con cá hay côn trùng trong đá.

#### group tray_sea_group
label.en: Sea animals
label.vi: Con vật biển
color: cham
role: required

#### group tray_plant_group
label.en: Plants
label.vi: Cây cối
color: gi_dong
role: required

#### group tray_small_group
label.en: Fish and insects
label.vi: Cá và côn trùng
color: vang_hoe
role: required

#### group tray_not_fossils
label.en: Not fossils
label.vi: Không phải hoá thạch
color: nau_dat
role: limit

#### item tray_ammonite
label.en: Spiral shell in rock
label.vi: Vỏ xoắn trong đá
group: tray_sea_group
image.brief: [ảnh] Một con cúc đá hoá thạch nguyên vẹn, vỏ xoắn ốc có gân rõ, còn nằm trong một mảng đá xám, chụp thẳng trên nền trơn; mẫu vật bảo tàng, không có nhãn mẫu vật, thước đo hay chữ. Hình gốc của bảng Hình dùng chung (bài mười dùng lại); câu q2 bài chín và từ `fossil` dùng lại ảnh này. Từ khoá tìm ảnh (EN): ammonite fossil specimen
image.alt.en: A spiral shell in rock
image.alt.vi: Vỏ xoắn trong đá
> [CẦN KIỂM] Cúc đá là con vật biển có vỏ xoắn, sống cùng thời khủng long (`_topic.md` mục bài tám).

#### item tray_dried_fish
label.en: Dried fish
label.vi: Cá khô
group: tray_not_fossils
image.brief: [ảnh] Một con cá khô bổ đôi phơi trên tấm ni lông, chụp thẳng từ trên xuống, cùng góc chụp với ảnh cá in trên đá (ảnh designer chọn 11/11; không có ảnh cá khô trên nia hợp lệ); không có nhãn bao bì, không có người, không có chữ. Từ khoá tìm ảnh (EN): dried salted fish top view
image.alt.en: A dried fish
image.alt.vi: Con cá khô

#### item tray_leaf_fossil
label.en: Fern shape in rock
label.vi: Hình lá dương xỉ trên đá
group: tray_plant_group
image.brief: [ảnh] Dấu một chiếc lá dương xỉ in rõ trên mặt phiến đá xám đen, chụp thẳng từ trên xuống; mẫu vật bảo tàng, không có nhãn mẫu vật, thước đo hay chữ. Hình gốc của bảng Hình dùng chung (bài chín w1 và món Chơi bài chín dùng lại); từ `imprint` dùng lại ảnh này. Từ khoá tìm ảnh (EN): fern leaf fossil imprint rock
image.alt.en: A fern shape in rock
image.alt.vi: Hình lá dương xỉ trên đá

#### item tray_fish_fossil
label.en: Fish shape in rock
label.vi: Hình con cá trên đá
group: tray_small_group
image.brief: [ảnh] Một con cá hoá thạch nguyên hình, thấy rõ xương sống, vây, đuôi, in trên phiến đá màu kem, chụp thẳng từ trên xuống; không có nhãn, thước đo hay chữ. Từ khoá tìm ảnh (EN): fish fossil in rock
image.alt.en: A fish shape in rock
image.alt.vi: Hình con cá trên đá

#### item tray_shell
label.en: Seashell on the sand
label.vi: Vỏ ốc biển trên cát
group: tray_not_fossils
image.brief: Dùng lại hình `tray_shell` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): seashell white sand
image.alt.en: A seashell on the sand
image.alt.vi: Vỏ ốc biển trên cát

#### item tray_shells_rock
label.en: Shells in rock
label.vi: Vỏ sò trong đá
group: tray_sea_group
image.brief: Dùng lại hình `explore_not_dino`. Từ khoá tìm ảnh (EN): fossil shells in rock slab
image.alt.en: Many shells in a slab of rock
image.alt.vi: Nhiều vỏ sò trong một phiến đá

#### item tray_insect_rock
label.en: Dragonfly shape in rock
label.vi: Hình chuồn chuồn trên đá
group: tray_small_group
image.brief: [ảnh] Một con chuồn chuồn hoá thạch in trên phiến đá vôi màu kem, thấy rõ bốn cánh và thân dài, chụp thẳng từ trên xuống; không có nhãn, thước đo hay chữ. Từ khoá tìm ảnh (EN): dragonfly fossil limestone
image.alt.en: A dragonfly shape in rock
image.alt.vi: Hình chuồn chuồn trên đá

#### item tray_dry_leaf
label.en: Dry fallen leaf
label.vi: Lá khô vừa rụng
group: tray_not_fossils
image.brief: [ảnh] Một chiếc lá khô màu nâu vàng vừa rụng nằm trên mặt đất, chụp thẳng từ trên xuống, cùng góc chụp với ảnh lá in trên đá; không có người, không có chữ. Hình gốc của bảng Hình dùng chung (bài chín w1 dùng lại). Từ khoá tìm ảnh (EN): dry fallen leaf on ground top view
image.alt.en: A dry fallen leaf
image.alt.vi: Chiếc lá khô vừa rụng

#### item tray_leaf_print
label.en: Leaf shape in rock
label.vi: Hình chiếc lá trên đá
group: tray_plant_group
image.brief: [ảnh] Dấu một chiếc lá bản rộng (ví dụ lá bạch quả) in trên phiến đá màu nâu nhạt, thấy rõ gân lá, chụp thẳng từ trên xuống; khác ảnh lá dương xỉ; không có nhãn, thước đo hay chữ. Từ khoá tìm ảnh (EN): leaf fossil imprint rock ginkgo
image.alt.en: A leaf shape in rock
image.alt.vi: Hình chiếc lá trên đá

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Bốn format. Vị trí đáp án theo bảng `_topic.md` (bài tám): q1 thứ hai, thẻ đúng q2 thứ nhất, q3 thứ hai, ba, bốn, q4 thứ hai, q5 thứ ba.
> q4 thay `order_sequence` (app 0.1.0 chưa hiện): hỏi bước xảy ra trước tiên. q5 khác hẳn câu q5 *Khủng long* bài ba: vật là vỏ sò (không phải xương), bối cảnh biển và nhà (không phải sông và bãi cỏ), ba lựa chọn khác hẳn.

### q1
id: b8cb0a4d-af31-4b43-be79-e2b33150a43a
format: single_choice
version: 1
dok: 1
prompt.en: Which one is a fossil?
prompt.vi: Cái nào là hoá thạch?
image.brief: Dùng lại hình `q2_museum` ở bài `khung-long/hoa-thach-ke-chuyen-khung-long`. Từ khoá tìm ảnh (EN): natural history museum gallery interior display cases
image.alt.en: Inside a museum
image.alt.vi: Bên trong bảo tàng
hint.en: Remember the three groups in today's game.
hint.vi: Em nhớ lại ba nhóm ở trò chơi hôm nay nhé.
explanation_correct.en: Yes! The dragonfly shape has turned to rock.
explanation_correct.vi: Đúng rồi! Hình con chuồn chuồn đã hoá thành đá.
explanation_wrong.en: The answer is the dragonfly in rock. The others are new.
explanation_wrong.vi: Đáp án là hình chuồn chuồn trên đá. Hai thứ kia còn mới.
> DOK 1: nhận ra hoá thạch (phần Chơi). Câu phân loại: nhãn và `alt` tả vật, không có chữ "fossil" · "hoá thạch". Ba hình là hình vẽ cùng nét, nhìn từ trên xuống (designer 11/11: dấu lá trên bùn ướt chỉ vẽ được, nên vẽ cả câu; vỏ ốc và chuồn chuồn vẽ riêng, không dùng lại ảnh của kệ).
> Rà chữ tester 11/11 (N1): lựa chọn sai `q1_dried_fish` (món bẫy của kệ) đổi thành `q1_mud_print` (dấu lá trên bùn ướt, ảnh mới), để hai lựa chọn sai không còn đúng là hai món bẫy vừa bị loại ở trò chơi. Không dùng "vỏ ốc mới trên kệ bếp" như tester gợi ý, vì câu đã có một vỏ ốc (`q1_shell`); dấu lá trên bùn ướt có sức hút hơn: cũng là dấu in như ô Dấu in, nhưng còn mới, chưa hoá thành đá (cách làm như "dấu chân trên cát ướt" ở *Khủng long* bài ba).

#### option q1_shell
correct: false
label.en: seashell on the sand
label.vi: vỏ ốc biển trên cát
image.brief: [hình vẽ] Một vỏ ốc biển xoắn màu kem có vân nâu nằm trên cát trắng, vẽ thẳng từ trên xuống, cùng nét và cùng góc với hai hình kia của câu; không có tay người, không có chữ. Vẽ riêng thay ảnh `tray_shell` của *Núi lửa* vì `q1_mud_print` chỉ vẽ được (một câu một loại hình).
image.alt.en: A seashell on the sand
image.alt.vi: Vỏ ốc biển trên cát

#### option q1_insect
correct: true
label.en: dragonfly shape in rock
label.vi: hình chuồn chuồn trên đá
image.brief: [hình vẽ] Dấu một con chuồn chuồn hoá thạch in trên phiến đá màu kem, thấy rõ bốn cánh và thân dài, vẽ thẳng từ trên xuống, cùng nét hai hình kia của câu; không có nhãn, thước hay chữ. Vẽ riêng thay ảnh `tray_insect_rock` của kệ, cùng lý do.
image.alt.en: A dragonfly shape in rock
image.alt.vi: Hình chuồn chuồn trên đá

#### option q1_mud_print
correct: false
label.en: leaf print in wet mud
label.vi: dấu lá trên bùn ướt
image.brief: [hình vẽ] Dấu một chiếc lá in rõ trên mặt bùn ướt màu nâu, còn bóng nước, vẽ thẳng từ trên xuống, cùng nét và cùng góc với hai hình kia; không có chiếc lá nằm trên bùn, không có dấu chân, người hay chữ.
image.alt.en: A leaf print in wet mud
image.alt.vi: Dấu lá trên bùn ướt

### q2
id: 1f2a5c65-38e9-4b31-b0d5-93ecc5a8203b
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `q1_mud` ở bài `khung-long/hoa-thach-ke-chuyen-khung-long`. Từ khoá tìm ảnh (EN): wet brown mud texture close up
image.alt.en: Wet brown mud
image.alt.vi: Bùn nâu ướt
sentence.en: Mud and sand that settle in layers are called {1}.
sentence.vi: Bùn cát lắng xuống thành từng lớp được gọi là {1}.
answers: q2_sediment
hint.en: Remember the layers in today's pictures.
hint.vi: Em nhớ lại những lớp bùn cát trong hình bài học nhé.
explanation_correct.en: Yes! Sediment settles in layers and slowly buries things.
explanation_correct.vi: Đúng rồi! Trầm tích lắng thành từng lớp và dần vùi lấp mọi thứ.
explanation_wrong.en: The answer is sediment. It settles in layers.
explanation_wrong.vi: Đáp án là trầm tích. Trầm tích lắng xuống thành từng lớp.
> DOK 1: nhớ lại câu ô Trầm tích. Câu không có gốc từ "sediment". Hai thẻ sai có sức hút: "soil" · "đất" (cũng có cát, bùn), "lava" · "dung nham" (cũng phủ lên mọi thứ, bài *Núi lửa*). Thẻ đúng ở chỗ thứ nhất (bảng vị trí). Ba thẻ là ảnh chụp.
> Gợi ý không gọi tên ô "Sediment" · "Trầm tích" (trùng chữ nhãn đáp án).

#### bank q2_sediment
label.en: sediment
label.vi: trầm tích
image.brief: [ảnh] Một vách đất ven sông hay ven biển thấy rõ nhiều lớp bùn, cát mỏng màu khác nhau nằm chồng lên nhau, chụp thẳng gần vừa; không có người, không có chữ. Từ `sediment` dùng lại ảnh này. Từ khoá tìm ảnh (EN): sediment layers riverbank close up
image.alt.en: Layers of mud and sand
image.alt.vi: Nhiều lớp bùn và cát

#### bank q2_soil
label.en: soil
label.vi: đất
image.brief: Dùng lại hình `tray_red_soil` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): red soil field Vietnam basalt
image.alt.en: Red soil in a field
image.alt.vi: Đất đỏ trên ruộng

#### bank q2_lava
label.en: lava
label.vi: dung nham
image.brief: Dùng lại hình `q4_slope` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): lava flow volcano slope
image.alt.en: Red-hot lava on a volcano
image.alt.vi: Dung nham đỏ rực trên sườn núi lửa

### q3
id: 3005c910-c025-4365-8a0b-2d70d9f704f2
format: multi_choice
version: 1
dok: 2
prompt.en: Which ones can become fossils?
prompt.vi: Những thứ nào có thể thành hoá thạch?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh
hint.en: Think beyond dinosaurs. What else lived long ago?
hint.vi: Em nghĩ rộng hơn khủng long nhé. Còn những gì từng sống thời xa xưa?
explanation_correct.en: Yes! Plants, insects and fish can all become fossils.
explanation_correct.vi: Đúng rồi! Cây cối, côn trùng và cá đều có thể thành hoá thạch.
explanation_wrong.en: The answers are the fern, the dragonfly and the fish.
explanation_wrong.vi: Đáp án là cây dương xỉ, con chuồn chuồn và con cá.
> DOK 2: phân loại sinh vật đang sống mà bé chưa gặp trong bài hôm nay; câu có ba đáp án (bảng vị trí, bài tám), để bé không quen "luôn chọn hai". Lựa chọn sai có sức hút ngược: khủng long đồ chơi trông giống khủng long nhất, nhưng không thể thành hoá thạch (đồ nhựa, bài chín dạy kỹ "chỉ thứ từng sống").
> Bốn hình dùng lại ảnh của *Khủng long* (bé đã gặp khoảng một tháng trước), cùng là ảnh chụp. Hình câu hỏi là ruộng lúa: cảnh có sinh vật sống, không lộ đáp án.
> Rà chữ tester 11/11 (n2): gợi ý cũ trỏ ô "Not just dinosaurs", mà ô đó liệt kê sẵn đáp án (lá dương xỉ, cá, côn trùng). Gợi ý mới chỉ cách nghĩ, không gọi tên ô hay lựa chọn.

#### option q3_toy
correct: false
label.en: toy dinosaur
label.vi: khủng long đồ chơi
image.brief: Dùng lại hình `q6` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): plastic toy dinosaur on table
image.alt.en: A toy dinosaur on a table
image.alt.vi: Khủng long đồ chơi trên bàn

#### option q3_fern
correct: true
label.en: fern
label.vi: cây dương xỉ
image.brief: Dùng lại hình `tray_fern` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): fern plant close up forest floor
image.alt.en: A fern
image.alt.vi: Cây dương xỉ

#### option q3_dragonfly
correct: true
label.en: dragonfly
label.vi: con chuồn chuồn
image.brief: Dùng lại hình `tray_dragonfly` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): dragonfly perched on stem side view
image.alt.en: A dragonfly
image.alt.vi: Con chuồn chuồn

#### option q3_fish
correct: true
label.en: fish
label.vi: con cá
image.brief: Dùng lại hình `q1_fish` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): common carp side view
image.alt.en: A fish
image.alt.vi: Con cá

### q4
id: c1357c03-7311-4e3e-98e1-dca86334267b
format: single_choice
version: 1
dok: 2
prompt.en: A sea snail sinks onto the sea floor. What happens first?
prompt.vi: Một con ốc biển chìm xuống đáy biển. Chuyện gì xảy ra trước tiên?
image.brief: [hình vẽ] Bộ "Mặt cắt lòng đất", khung không: đáy biển nước xanh nhạt, một con ốc biển còn nguyên thân mềm (thấy phần thân thò khỏi miệng vỏ) nằm yên trên lớp bùn mịn, cùng chỗ và cùng nét với khung một; không có con vật nào ăn nó, không có chữ, không có mũi tên.
image.alt.en: A sea snail on the sea floor
image.alt.vi: Con ốc biển dưới đáy biển
hint.en: Think about the order of the steps.
hint.vi: Em nghĩ về thứ tự các bước nhé.
explanation_correct.en: Yes! First, its soft body decays. The shell stays.
explanation_correct.vi: Đúng rồi! Trước tiên, phần thân mềm phân huỷ. Chiếc vỏ còn lại.
explanation_wrong.en: The answer is decay. Layers and digging come much later.
explanation_wrong.vi: Đáp án là phần thân mềm phân huỷ. Các lớp đè lên và việc đào lên đến rất lâu sau.
> DOK 2: xếp thứ tự các bước, thay `order_sequence` (như gợi ý ở `_topic.md`). Ba lựa chọn đều là bước thật của câu chuyện hoá thạch; bé phải chọn bước sớm nhất. Không đưa "bùn cát phủ lên" làm lựa chọn, vì phân huỷ và vùi lấp có thể diễn ra gần cùng lúc, câu sẽ có hai đáp án.
> Rà chữ tester 11/11 (n5): nhãn đáp án kéo dài ("its soft body decays away" · "phần thân mềm của nó phân huỷ") cho cùng độ dài hai nhãn sai.
> Ba hình cùng nét bộ "Mặt cắt lòng đất": hai khung của ô Học (khung hai, khung một) và khung bốn vẽ mới. Câu này khác câu q3 *Khủng long* bài ba (bên đó hỏi bước sau khi xương nằm trong bùn, đáp án là "bùn cát phủ lên").

#### option q4_layers
correct: false
label.en: layers press it into rock
label.vi: các lớp đè lên ép thành đá
image.brief: Dùng lại hình `explore_sediment`.
image.alt.en: Layers of mud and sand over a shell
image.alt.vi: Nhiều lớp bùn cát phủ lên chiếc vỏ

#### option q4_decay
correct: true
label.en: its soft body decays away
label.vi: phần thân mềm của nó phân huỷ
image.brief: Dùng lại hình `explore_decay`.
image.alt.en: An empty shell on the sea floor
image.alt.vi: Chiếc vỏ rỗng dưới đáy biển

#### option q4_found
correct: false
label.en: a fossil hunter finds it
label.vi: người săn hoá thạch tìm thấy nó
image.brief: [hình vẽ] Bộ "Mặt cắt lòng đất", khung bốn: rất lâu sau, vách đá nhiều lớp trên bờ biển, chiếc vỏ xoắn đã hoá đá lộ ra giữa một lớp đá; một bàn tay người lớn (chỉ thấy tay và tay áo) cầm chổi nhỏ chải đá quanh vỏ; không vẽ mặt, không có chữ.
image.alt.en: A hand brushing a shell in rock
image.alt.vi: Bàn tay chải đá quanh chiếc vỏ

### q5
id: 16993a13-9b29-43e7-8b05-3702f85e1f1b
format: single_choice
version: 1
dok: 2
prompt.en: Which shell is most likely to become a fossil?
prompt.vi: Chiếc vỏ sò nào dễ thành hoá thạch nhất?
image.brief: [ảnh] Một chiếc vỏ sò (vỏ nghêu) trắng ngà nằm trên nền trơn, chụp gần; không có tay người, không có chữ. Từ khoá tìm ảnh (EN): single clam shell plain background
image.alt.en: A clam shell
image.alt.vi: Một chiếc vỏ sò
hint.en: Remember the Sediment picture in the lesson.
hint.vi: Em nhớ lại ô Trầm tích trong bài học nhé.
explanation_correct.en: Yes! Mud covers it fast and keeps it safe.
explanation_correct.vi: Đúng rồi! Bùn sớm phủ kín chiếc vỏ và giữ cho nó an toàn.
explanation_wrong.en: The answer is the shell in mud. Mud covers it fast.
explanation_wrong.vi: Đáp án là chiếc vỏ vùi trong bùn. Bùn sớm phủ kín nó.
> DOK 2: áp ý chính hai (trầm tích vùi lấp phần cứng) vào ba chỗ mới. Hỏi "most likely" · "dễ … nhất", vì chiếc vỏ trên ghềnh đá vẫn có thể bị cát phủ về sau. Lựa chọn "trong lọ ở nhà" có sức hút: bé nghĩ vỏ được giữ cẩn thận thì sẽ còn mãi và thành hoá thạch.
> [CẦN KIỂM] Giản lược: vỏ được bùn phủ kín sớm thì dễ thành hoá thạch; vỏ bị sóng đánh trên ghềnh đá thường vỡ vụn; vỏ cất trong nhà không bị trầm tích vùi lấp nên không thành hoá thạch.
> Ba lựa chọn là ba hình vẽ cùng nét (designer 11/11), cùng là vỏ sò ở ba chỗ khác nhau; hình câu hỏi là ảnh một vỏ sò.

#### option q5_waves
correct: false
label.en: on rocks hit by waves
label.vi: trên ghềnh đá bị sóng đánh
image.brief: [hình vẽ] Vài vỏ sò nằm trên ghềnh đá ven biển, sóng trắng đang vỗ vào, vẽ gần vừa; không có người, không có chữ.
image.alt.en: Shells on rocks with waves
image.alt.vi: Vỏ sò trên ghềnh đá có sóng

#### option q5_jar
correct: false
label.en: in a jar at home
label.vi: trong lọ ở nhà
image.brief: [hình vẽ] Một lọ thuỷ tinh đựng đầy vỏ sò đặt trên kệ trong nhà, vẽ ngang gần vừa; không có nhãn trên lọ, không có người, không có chữ.
image.alt.en: Shells in a glass jar
image.alt.vi: Vỏ sò trong lọ thuỷ tinh

#### option q5_mud
correct: true
label.en: half buried in mud
label.vi: vùi nửa trong bùn
image.brief: [hình vẽ] Một chiếc vỏ sò vùi nửa trong bùn ướt ở bãi triều lúc nước rút, vẽ gần; không có người, không có chữ.
image.alt.en: A shell half buried in mud
image.alt.vi: Vỏ sò vùi nửa trong bùn

### q6
id: 45b5e026-2d9a-4b52-bd1f-e601c78c09c5
format: true_false
version: 1
dok: 3
misconception: only_dinosaurs_fossils
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: A snail is not a dinosaur. It cannot become a fossil.
statement.vi: Con ốc không phải khủng long. Nó không thể thành hoá thạch.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: false
image.brief: [ảnh] Một con ốc sên đang bò trên chiếc lá xanh sau mưa, chụp gần; không có người, không có chữ. Từ khoá tìm ảnh (EN): snail crawling on leaf
image.alt.en: A snail on a leaf
image.alt.vi: Con ốc sên trên chiếc lá
hint.en: What kinds of fossils did you find today?
hint.vi: Hôm nay em đã tìm thấy những loại hoá thạch nào?
explanation_correct.en: A snail has a hard shell. Its shell can become a fossil.
explanation_correct.vi: Con ốc có vỏ cứng. Vỏ ốc có thể thành hoá thạch.
explanation_wrong.en: Na is not right. Shells can become fossils, too.
explanation_wrong.vi: Na chưa đúng. Vỏ ốc cũng có thể thành hoá thạch.
> DOK 3: bắt lỗi một lập luận ("không phải khủng long nên không thành hoá thạch") về một con vật mới: ốc sên trên cạn, không phải vỏ biển ở phần Chơi. Bé phải áp ý "phần cứng còn lại" (ô Phân huỷ) và "không chỉ khủng long" (ô một). Lời Na đúng bảng "Câu sáu, lời Na"; đáp án Sai theo bảng Đúng/Sai. Giải thích khi đúng không mở đầu bằng "Yes!".
> [CẦN KIỂM] Vỏ ốc sên trên cạn cũng có thể thành hoá thạch (biên tập nhớ có hoá thạch ốc cạn).

## Từ vựng

### sediment
id: 090e6518-e720-41fd-8a96-24995173d4aa
tier: core
term.en: sediment
term.vi: trầm tích
example.en: Sediment slowly covered the shell.
example.vi: Trầm tích dần phủ kín chiếc vỏ.
image.brief: Dùng lại hình `q2_sediment`. Từ khoá tìm ảnh (EN): sediment layers riverbank close up
image.alt.en: Layers of mud and sand
image.alt.vi: Nhiều lớp bùn và cát

### decay
id: 0e0983ac-1a70-4f66-be20-4cfed3927856
tier: core
term.en: decay
term.vi: phân huỷ
example.en: Fallen leaves decay on the ground.
example.vi: Lá rụng phân huỷ dần trên mặt đất.
image.brief: Dùng lại hình `explore_decay`.
image.alt.en: An empty shell on the sea floor
image.alt.vi: Chiếc vỏ rỗng dưới đáy biển

### imprint
id: 14c4f2e5-a7b1-427e-8cf5-c848786ac90b
tier: core
term.en: imprint
term.vi: dấu in
example.en: The fern left an imprint in the rock.
example.vi: Lá dương xỉ để lại dấu in trên đá.
image.brief: Dùng lại hình `tray_leaf_fossil`. Từ khoá tìm ảnh (EN): fern leaf fossil imprint rock
image.alt.en: A fern shape in rock
image.alt.vi: Hình lá dương xỉ trên đá

### fossil
id: 00bdd80e-81b9-40ad-aa03-11799f259a45
tier: extra
term.en: fossil
term.vi: hoá thạch
example.en: A fossil can be a shell, leaf or fish.
example.vi: Hoá thạch có thể là vỏ sò, chiếc lá hay con cá.
image.brief: Dùng lại hình `tray_ammonite`. Từ khoá tìm ảnh (EN): ammonite fossil specimen
image.alt.en: A spiral shell in rock
image.alt.vi: Vỏ xoắn trong đá
> Ôn có chủ ý: `fossil` là từ core ở *Khủng long* bài ba (bảng Từ vựng). Câu ví dụ và hình nói hoá thạch không phải khủng long, khác bên đó (xương khủng long).

### pressure
id: 5e58ae0f-9dbe-4e55-8a49-93cb48cd2ecf
tier: extra
term.en: pressure
term.vi: sức ép
example.en: The pressure of the layers turned mud into rock.
example.vi: Sức ép của các lớp bên trên ép bùn thành đá.
image.brief: Dùng lại hình `explore_sediment`.
image.alt.en: Layers of mud and sand over a shell
image.alt.vi: Nhiều lớp bùn cát phủ lên chiếc vỏ
> Dùng "sức ép", không dùng "áp lực" (bảng Tên gọi).

## Thưởng

### ammonite_card
id: bb15ff53-06b5-4785-80da-8325abd637b4
set: rocks
rarity: common
name.en: Ammonite
name.vi: Cúc đá
tag.en: Sea animal
tag.vi: Con vật biển
fact.en: Ammonites lived in the sea in dinosaur times. Their curly shells became fossils.
fact.vi: Cúc đá sống ở biển cùng thời khủng long. Vỏ xoắn của chúng đã thành hoá thạch.
> [CẦN KIỂM] Cúc đá sống ở biển, tuyệt chủng cùng thời khủng long; tên "cúc đá" theo sách (bảng Tên gọi, bảng Bộ thẻ ở `_topic.md`).
image.brief: [ảnh] Một con cúc đá hoá thạch được cắt đôi và đánh bóng mặt cắt, thấy rõ các ngăn nhỏ xếp xoắn ốc bên trong, chụp thẳng trên nền tối trơn; khác ảnh `tray_ammonite` (cúc đá nguyên con trong đá); không có nhãn, thước đo, giá tiền hay chữ; không phải đồ trang sức. Từ khoá tìm ảnh (EN): ammonite cut in half chambers polished
image.alt.en: An ammonite cut in half
image.alt.vi: Cúc đá cắt đôi

## Ghi chú cho hoạ sĩ

- **Loại hình** (theo file chọn ảnh designer 11/11): kệ Chơi, câu q2, q3, hình câu q5, q6 là ảnh chụp; bộ "Mặt cắt lòng đất" (bốn khung), `explore_imprint`, ba lựa chọn q1 và ba lựa chọn q5 là hình tự vẽ (mười một hình). Hình không có chữ, không nhãn mẫu vật, không thước đo trong bảo tàng.
- **Bộ "Mặt cắt lòng đất"** (gốc bài này, bài chín vẽ thêm hổ phách, khúc gỗ cùng nét): cùng một góc nhìn ngang, cùng bảng màu (nước xanh nhạt, bùn nâu xám, cát vàng nhạt), không viền đen, không nét mặt, không chữ, không mũi tên.
  - khung không (hình câu q4): con ốc còn thân mềm trên đáy biển;
  - khung một (`explore_decay`): cùng chỗ, chỉ còn chiếc vỏ rỗng;
  - khung hai (`explore_sediment`): nhìn cắt ngang, nhiều lớp bùn cát phủ trên vỏ, lớp dưới cùng rắn như đá;
  - khung bốn (`q4_found`): rất lâu sau, vỏ đã hoá đá lộ ra trên vách đá, bàn tay cầm chổi.
  - Thêm một hình cùng nét nhưng ngoài bộ: `explore_imprint` (tay trẻ nhấc vỏ ốc khỏi đất nặn).
- **Ảnh nguồn (mười hai):**
  - Học (một): phiến đá đầy vỏ sò hoá thạch (`explore_not_dino`).
  - Chơi (bảy): cúc đá (`tray_ammonite`, hình gốc), cá khô bổ đôi trên ni lông, lá dương xỉ in trên đá (`tray_leaf_fossil`, hình gốc), cá in trên đá, chuồn chuồn in trên đá, lá khô (`tray_dry_leaf`, hình gốc), lá bản rộng in trên đá.
  - Quiz (ba): vách đất nhiều lớp (thẻ q2, cũng là từ `sediment`), vỏ sò trên nền trơn (hình câu q5), ốc sên trên lá (q6).
  - Thưởng (một): cúc đá.
- **Hình tự vẽ (mười một):** bốn khung "Mặt cắt lòng đất", `explore_imprint`; ba lựa chọn q1 (vỏ ốc trên cát, dấu chuồn chuồn trên đá, dấu lá trên bùn ướt); ba lựa chọn q5 (ghềnh đá có sóng, lọ thuỷ tinh, bãi bùn).
- **Nguồn ảnh hoá thạch:** Smithsonian Open Access (CC0), Commons (PD, CC BY). Mẫu vật trong bảo tàng thì cắt nhãn, thước đo. Hoá thạch thật hay bản đúc đều được; `alt` không nói "thật".
- **Cùng kiểu trong một câu:** q1 ba hình vẽ nhìn từ trên xuống; q2 ba ảnh mặt đất, đá; q3 bốn ảnh sinh vật và đồ vật của *Khủng long*; q4 ba khung cùng nét; q5 ba hình vẽ vỏ sò ở ba chỗ. Kệ Chơi: chín ảnh chụp từ trên xuống hay chụp thẳng, cùng cỡ; món bẫy chụp cùng góc với món đúng (cá khô như cá in trên đá, lá khô như lá in trên đá), đừng chọn ảnh bẫy khác hẳn kiểu.
- **Dùng lại trong bài:** `explore_not_dino` (món `tray_shells_rock`); `explore_decay` (q4, từ `decay`); `explore_sediment` (q4, từ `pressure`); `tray_leaf_fossil` (từ `imprint`); `tray_ammonite` (từ `fossil`); thẻ `q2_sediment` (từ `sediment`).
- **Dùng lại từ bài khác:** `explore_erosion`, `explore_weathering` (bài bảy); `explore_erupt`, `tray_shell` (món kệ), `tray_red_soil`, `q4_slope` (*Núi lửa*); `tray_stream` (*Đất và nước trên Trái Đất*); `q4`, `q2_museum`, `q1_mud` (*Hoá thạch kể chuyện khủng long*); `q2_rice`, `q6`, `tray_fern`, `tray_dragonfly` (*Trái Đất rất lâu về trước*); `q1_fish` (*Khủng long là gì*).
- **Bài khác dùng lại hình của bài này** (bảng Hình dùng chung): `tray_leaf_fossil` (bài chín w1 và món Chơi), `tray_dry_leaf` (bài chín w1), `tray_ammonite` (bài mười; bài chín câu q2).
- **Màu:** Học: không chỉ khủng long `gi_dong`, phân huỷ `vang_hoe`, trầm tích `cham`, dấu in `do_son`. Chơi: con vật biển `cham`, cây cối `gi_dong`, cá và côn trùng `vang_hoe`, nhóm `limit` `nau_dat`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required` (mỗi nhóm hai món), một nhóm `limit` (ba món), chín món.
  - Khởi động: `single_choice` (w1 ôn bài bảy), `true_false` (w2 ôn *Khủng long* bài ba, Đúng).
  - Quiz: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2), `multi_choice` (q3, ba đáp án), `true_false` (q6, `speaker: na`, Sai). Bốn format.
  - DOK q1 tới q6: 1, 1, 2, 2, 2, 3. Câu có `misconception`: q6, key `only_dinosaurs_fossils`.
- **Vị trí đáp án đúng:** w1 thứ nhất; q1 thứ hai; thẻ đúng q2 thứ nhất; q3 thứ hai, ba, bốn; q4 thứ hai; q5 thứ ba. Khớp bảng `_topic.md`.
- **Tham chiếu:** `recall_from.lesson` trỏ `da-va-dat/da-bi-bao-mon-theo-thoi-gian` (w1), `khung-long/hoa-thach-ke-chuyen-khung-long` (w2, đã có id).
- **Đề xuất khi app hiện được `order_sequence`:** câu q4 đổi thành câu sắp thứ tự bốn khung của bộ "Mặt cắt lòng đất" (khung không, một, hai, bốn). Khi đổi thì tăng `version`.
- **Màn Chơi, ví dụ để kiểm:**
  - chạm Vỏ xoắn trong đá, Hình lá dương xỉ trên đá, Hình con cá trên đá → đạt;
  - chạm Cá khô → `has_limited`;
  - chạm Vỏ sò trong đá, Hình chiếc lá trên đá, Vỏ xoắn trong đá (thiếu cá hay côn trùng) → `missing.tray_small_group`; chạm Hình chuồn chuồn trên đá → `full`; bỏ Vỏ sò trong đá, đặt Hình chuồn chuồn trên đá → đạt.
- **Dòng điều kiện màn Chơi:** "Cần đủ Con vật biển, Cây cối, Cá và côn trùng · Không phải hoá thạch".
- **Số từ EN trên một màn:**
  - Học khoảng ba mươi ba từ: mục tiêu 10, hướng dẫn 3, bốn nhãn 6, câu dài nhất 9, ô Từ mới 5.
  - Quiz nhiều nhất là q4 (khoảng ba mươi hai: câu hỏi 11, ba nhãn 14, gợi ý 7; vượt ba mươi vì ba nhãn là ba bước dài cùng khuôn) và q3 (khoảng hai mươi hai). q6 cả màn 18.
- **Từ EN có thể ngoài Starters/Movers:** sediment, decay, imprint, pressure, fossil (ôn), ammonite, fern, dragonfly, insects, shells, layers, settle, buried, sink, play dough, feather, lava, eruption, erosion, weathering.
- **Giọng đọc:** nghe thử EN "sediment", "ammonite", "decay"; VI "trầm tích", "cúc đá".
- **Bộ thẻ:** `set: rocks`.
