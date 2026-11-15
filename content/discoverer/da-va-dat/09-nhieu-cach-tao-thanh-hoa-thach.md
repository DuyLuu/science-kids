---
id: 4ed9bcfd-ae35-4e9f-a05d-63c2e9bb4452
topic: da-va-dat
slug: nhieu-cach-tao-thanh-hoa-thach
order: 9
stage: core
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: More about fossil formation
vi: Nhiều cách tạo thành hoá thạch
> Giữ đúng tên ở `content/syllabus.json` (`rocks-and-soils`, bài số chín).

## Mục tiêu
en: I can describe different ways that fossils form.
vi: Em kể được những cách khác nhau tạo thành hoá thạch.
> Trạng thái: **nháp do AI soạn (content-editor, người soạn B), chưa duyệt.** Ticket SK-039 bước 2, ngày 11/11/2026. Chưa chạy `validate`, chưa chạy `ids`.
> Ba cách tạo thành hoá thạch (trong hổ phách, chất khoáng lấp đầy, dấu in) sửa vế "hoá thạch lúc nào cũng là chính con vật hay cái cây" của Oak; ý chính ba và ô "Palaeontology" sửa `old_things_are_fossils` (câu q6 gắn key, Na chưa đúng, trống đồng).
> Chữ "minerals" ở bài này là "chất khoáng" (chất có trong nước), khác "khoáng vật" ở bài bốn (bảng Tên gọi, [CẦN KIỂM] chuyên môn chọn chữ). Không nhắc chuyện "lấy khủng long từ muỗi trong hổ phách" (chuyện phim, không đúng). Không dùng chữ "tiến hoá", "tổ tiên".

## Ý chính
1.en: Sticky tree resin can trap a small animal.
1.vi: Nhựa cây dính có thể giữ chặt một con vật nhỏ.
2.en: Minerals in water can fill a shell or wood.
2.vi: Chất khoáng trong nước có thể lấp đầy vỏ ốc hay khúc gỗ.
3.en: Only things that were once alive can become fossils.
3.vi: Chỉ những gì từng sống mới có thể thành hoá thạch.

## Khởi động

> Hai câu, đúng bảng Khởi động ở `_topic.md`:
> - w1 ôn bài tám (một ngày): cái nào là dấu in trên đá. Nối sang nhóm "Imprints" của phần Chơi hôm nay.
> - w2 ôn bài bốn (năm ngày, mốc một tuần): "Rocks are made of minerals." (Đúng). Câu nối sang ý chính hai: chất khoáng cũng có trong nước.
> Hình dùng lại từ bài bốn (người soạn A) chưa chép từ khoá (bài gốc chưa có khi soạn); topic editor chép khi rà chéo.

### w1
id: d29c2f30-53bb-473d-a172-16dbbece983a
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/hoa-thach-hinh-thanh-the-nao
prompt.en: Which one is an imprint?
prompt.vi: Cái nào là một dấu in?
image.brief: Dùng lại hình `q4` ở bài `khung-long/hoa-thach-ke-chuyen-khung-long`. Từ khoá tìm ảnh (EN): paleontology tools hammer chisel brush
image.alt.en: Tools for finding fossils
image.alt.vi: Dụng cụ tìm hoá thạch
hint.en: Remember the Imprint picture in lesson eight.
hint.vi: Em nhớ lại ô Dấu in ở bài tám nhé.
explanation_correct.en: The fern is gone, but its shape stayed in rock.
explanation_correct.vi: Lá dương xỉ đã mất, chỉ còn hình in trên đá.
explanation_wrong.en: The fern left its shape in the rock.
explanation_wrong.vi: Lá dương xỉ để lại hình của nó trên đá.
> Câu phân loại: nhãn và `alt` tả vật, không có chữ "imprint" · "dấu in", "fossil" · "hoá thạch". Câu hỏi tiếng Việt không có chữ "trên đá", để phụ đề không khớp chữ với nhãn đáp án. Lá ép trong sách có sức hút: cũng phẳng, cũng là "ép, in". Lựa chọn và vị trí đáp án (thứ ba) theo bảng Khởi động.
> Hình câu hỏi là bộ dụng cụ tìm hoá thạch (không có hoá thạch), không dùng hình đất nặn của ô Dấu in bài tám (đó là bằng chứng của gợi ý).

#### option w1_dry_leaf
correct: false
feedback.en: This leaf just fell and is not in rock.
feedback.vi: Lá này vừa rụng, chưa in vào đá.
label.en: dry leaf that just fell
label.vi: lá khô vừa rụng
image.brief: Dùng lại hình `tray_dry_leaf` ở bài `da-va-dat/hoa-thach-hinh-thanh-the-nao`. Từ khoá tìm ảnh (EN): dry fallen leaf on ground top view
image.alt.en: A dry fallen leaf
image.alt.vi: Chiếc lá khô vừa rụng

#### option w1_pressed_leaf
correct: false
feedback.en: This is the leaf itself, pressed flat, not a print.
feedback.vi: Đây là chiếc lá ép khô, chưa phải dấu in.
label.en: leaf pressed flat
label.vi: lá ép khô
image.brief: [ảnh] Một chiếc lá đã ép khô, phẳng, nằm trên nền giấy trắng, chụp thẳng từ trên xuống, cùng góc chụp với hai ảnh lá kia; không có sách, không có chữ, không có người. Từ khoá tìm ảnh (EN): pressed leaf white paper top view
image.alt.en: A pressed leaf
image.alt.vi: Chiếc lá ép khô
> Theo hình designer 11/11: ảnh lá ép trong sách mở đều có chữ, nên ảnh là lá ép trên giấy trắng. Nhãn đổi theo ("leaf pressed in a book" · "lá ép khô trong sách" thành "leaf pressed flat" · "lá ép khô"); vẫn là bẫy tốt (phẳng, "ép" như dấu in).

#### option w1_leaf_rock
correct: true
label.en: fern shape in rock
label.vi: hình lá dương xỉ trên đá
image.brief: Dùng lại hình `tray_leaf_fossil` ở bài `da-va-dat/hoa-thach-hinh-thanh-the-nao`. Từ khoá tìm ảnh (EN): fern leaf fossil imprint rock
image.alt.en: A fern shape in rock
image.alt.vi: Hình lá dương xỉ trên đá

### w2
id: ce6384fe-8673-4ce5-9055-1a635be6e9b5
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/thang-do-cung-mohs
prompt.en: Rocks are made of minerals.
prompt.vi: Đá được tạo nên từ các khoáng vật.
image.brief: Dùng lại hình `w1_stone` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): smooth pebble stone sand
image.alt.en: A smooth stone
image.alt.vi: Hòn đá cuội
answer: true
hint.en: Remember the Minerals picture in lesson four.
hint.vi: Em nhớ lại ô Khoáng vật ở bài bốn nhé.
explanation_correct.en: Most rocks are a mix of different minerals.
explanation_correct.vi: Phần lớn đá là hỗn hợp nhiều khoáng vật khác nhau.
explanation_wrong.en: Rocks are made of minerals, like granite's grains.
explanation_wrong.vi: Đá tạo nên từ khoáng vật, như hạt đá hoa cương.
feedback_false.en: Each grain in granite is a mineral.
feedback_false.vi: Mỗi hạt trong đá hoa cương là một khoáng vật.
> Đúng chữ EN ở bảng Đúng/Sai (bài chín w2, Đúng). Hình là một hòn cuội trơn, không thấy hạt khoáng vật (không dùng ảnh đá hoa cương có hạt, vì đó là bằng chứng của đáp án). Gợi ý gọi tên ô "Minerals" · "Khoáng vật" theo kế hoạch bài bốn; topic editor kiểm tên ô khi rà chéo.
> [CẦN KIỂM] Như `_topic.md` mục bài bốn: "đá được tạo nên từ khoáng vật" (phần lớn các loại đá).

## Học

> Bốn ô, từ cụ thể tới trừu tượng: hổ phách (ý chính một, thấy được con vật bên trong), chất khoáng lấp đầy (ý chính hai), thân mềm (vì sao có con vật hiếm khi thành hoá thạch), cổ sinh vật học (ý chính ba: chỉ những gì từng sống).
> Hai ô đầu là hình vẽ cùng nét bộ "Mặt cắt lòng đất" của bài tám (`_topic.md`, Quy ước hình mục bốn).
> Ô bốn nói "không phải đồ do con người làm ra", không nêu bình gốm, đồng xu, để phần Chơi và câu q6 (trống đồng) còn là việc bé tự áp dụng.

### explore
id: 99854690-3c55-4c53-8668-b2b253b3b4c5
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_amber
label.en: Amber
label.vi: Hổ phách
color: vang_hoe
sentence.en: Sticky resin trapped an insect, then hardened into amber.
sentence.vi: Nhựa cây giữ chặt côn trùng, rồi cứng dần thành hổ phách.
image.brief: [hình vẽ] Cùng nét bộ "Mặt cắt lòng đất" của bài tám, hai khung nối bằng mũi tên đơn giản: khung trái, một giọt nhựa thông vàng óng chảy trên thân cây thông, một con kiến nhỏ mắc trong giọt nhựa; khung phải, rất lâu sau, giọt nhựa ấy đã thành miếng hổ phách vàng trong, con kiến vẫn nằm bên trong. Không có chữ, không ghi nhãn dưới khung.
image.alt.en: Resin traps an ant, then becomes amber
image.alt.vi: Nhựa cây giữ chặt con kiến, rồi thành hổ phách
examples.1.en: resin drips down a pine tree
examples.1.vi: nhựa thông chảy trên thân cây
examples.2.en: a small insect gets stuck
examples.2.vi: con côn trùng nhỏ bị dính lại
examples.3.en: the resin slowly hardens
examples.3.vi: nhựa cứng dần lại
examples.4.en: it takes millions of years
examples.4.vi: phải mất hàng triệu năm
> [CẦN KIỂM] Nhựa cây cứng lại thành hổ phách qua hàng triệu năm (biên tập nhớ). Ô này dạy "hổ phách là nhựa cây cứng lại", ý được ôn ở bài mười w1.

#### group explore_minerals
label.en: Filled with minerals
label.vi: Chất khoáng lấp đầy
color: cham
sentence.en: Water carries minerals into a buried shell or log.
sentence.vi: Nước mang chất khoáng vào vỏ ốc, khúc gỗ bị vùi.
image.brief: [hình vẽ] Bộ "Mặt cắt lòng đất", khung mới: nhìn cắt ngang lòng đất, một khúc gỗ nằm giữa các lớp bùn cát; những chấm nhỏ màu sáng (chất khoáng) theo dòng nước ngấm xuống, đi vào thớ gỗ; nửa khúc gỗ đã chuyển màu xám như đá. Không có chữ.
image.alt.en: Water seeping into a buried log
image.alt.vi: Nước thấm vào khúc gỗ bị vùi
examples.1.en: water seeps in slowly
examples.1.vi: nước ngấm vào từ từ
examples.2.en: minerals fill every tiny gap
examples.2.vi: chất khoáng lấp đầy từng khe nhỏ
examples.3.en: a shell turns to rock
examples.3.vi: vỏ ốc hoá thành đá
examples.4.en: wood turns to rock
examples.4.vi: gỗ hoá thành đá
> [CẦN KIỂM] Gỗ hoá đá: chất khoáng trong nước ngấm vào, thay dần phần gỗ (`_topic.md` mục bài chín). Biên tập không đưa "gỗ hoá thạch ở Tây Nguyên" vào chữ cho trẻ (chưa kiểm).

#### group explore_soft
label.en: Soft bodies
label.vi: Thân mềm
color: do_son
sentence.en: Animals with soft bodies rarely become fossils.
sentence.vi: Con vật thân mềm rất hiếm khi thành hoá thạch.
image.brief: [ảnh] Một con sứa trong suốt bơi trong nước biển xanh, chụp ngang, nền nước trơn; không có người, không có chữ. Câu q5 và từ `soft_body` dùng lại ảnh này. Từ khoá tìm ảnh (EN): jellyfish swimming blue water
image.alt.en: A jellyfish in the sea
image.alt.vi: Con sứa dưới biển
examples.1.en: jellyfish
examples.1.vi: con sứa
examples.2.en: worms
examples.2.vi: con giun
examples.3.en: they decay fast
examples.3.vi: chúng phân huỷ rất nhanh
examples.4.en: hard parts last longer
examples.4.vi: phần cứng giữ được lâu hơn
> [CẦN KIỂM] Sinh vật thân mềm (giun, sứa) rất hiếm khi thành hoá thạch vì phân huỷ nhanh (ghi chú của Oak, biên tập nhớ). Chữ cho trẻ nói "rất hiếm", không nói "không bao giờ".

#### group explore_palaeo
label.en: Palaeontology
label.vi: Cổ sinh vật học
color: gi_dong
sentence.en: Palaeontology studies fossils of things that were once alive.
sentence.vi: Cổ sinh vật học nghiên cứu hoá thạch sinh vật xưa.
image.brief: Dùng lại hình `palaeontologist` ở bài `khung-long/hoa-thach-ke-chuyen-khung-long`. Từ khoá tìm ảnh (EN): palaeontologist hands tool fossil rock quarry
image.alt.en: A palaeontologist digging out a fossil
image.alt.vi: Nhà cổ sinh vật học đào hoá thạch
examples.1.en: plants and animals from long ago
examples.1.vi: cây cối và con vật thời xa xưa
examples.2.en: not things people made
examples.2.vi: không phải đồ do con người làm ra
examples.3.en: palaeontologists make models
examples.3.vi: nhà cổ sinh vật học làm mô hình
examples.4.en: models show how fossils form
examples.4.vi: mô hình cho thấy hoá thạch hình thành ra sao
> Ô này mang ý chính ba (chỉ những gì từng sống), ý được ôn ở bài mười w2 ("An old clay pot is a fossil.", Sai). Ví dụ ba, bốn là ý "mô hình" của Oak.

### new_words
id: 8bf0dc3c-b20e-4852-bdb2-78b7d4477fd8
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: resin, amber, palaeontology

## Chơi

> "Tìm ba cách hoá thạch hình thành". Bé chọn một hoá thạch trong hổ phách, một hoá thạch được chất khoáng lấp đầy, một dấu in; không chọn đồ cổ do con người làm ra. Trò chơi dùng ý chính một, hai và ôn bài tám (dấu in, nối `only_dinosaurs_fossils`).
> - Ba món bẫy là đồ rất cổ (`old_things_are_fossils`), mỗi món giống một nhóm: đèn dầu cổ (thuỷ tinh vàng, giống hổ phách), bình gốm cổ (đào lên từ đất, giống vật hoá đá), đồng xu cổ (in hình, giống dấu in). Trống đồng không có trên kệ, để câu q6 là tình huống mới.
> - Nhãn nhóm `limit` "Not from living things" · "Không phải từ sinh vật", gọi tên loại.
> - Cả kệ là ảnh chụp. Hổ phách không lấy nguồn Myanmar (`_topic.md`).

### tray
id: 481ee7b2-6ae4-48fb-bf3d-0d6d843f5104
type: build_tray
version: 1
prompt.en: Find three ways fossils form
prompt.vi: Tìm ba cách hoá thạch hình thành
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find one fossil for each way.
messages.start.vi: Em tìm một hoá thạch cho mỗi cách nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Amber, minerals and imprints all make fossils.
messages.balanced.vi: Tuyệt! Hổ phách, chất khoáng, dấu in đều tạo hoá thạch.
messages.has_limited.en: People made that. It was never alive.
messages.has_limited.vi: Đồ này do con người làm ra. Nó chưa từng sống.
messages.missing.tray_amber_group.en: You still need a fossil in amber.
messages.missing.tray_amber_group.vi: Em còn thiếu một hoá thạch trong hổ phách.
messages.missing.tray_mineral_group.en: You still need a fossil filled with minerals.
messages.missing.tray_mineral_group.vi: Em còn thiếu một hoá thạch được chất khoáng lấp đầy.
messages.missing.tray_imprint_group.en: You still need an imprint in rock.
messages.missing.tray_imprint_group.vi: Em còn thiếu một dấu in trên đá.

#### group tray_amber_group
label.en: In amber
label.vi: Trong hổ phách
color: vang_hoe
role: required

#### group tray_mineral_group
label.en: Filled with minerals
label.vi: Chất khoáng lấp đầy
color: cham
role: required

#### group tray_imprint_group
label.en: Imprints
label.vi: Dấu in
color: do_son
role: required

#### group tray_not_living
label.en: Not from living things
label.vi: Không phải từ sinh vật
color: nau_dat
role: limit

#### item tray_amber_insect
label.en: Insect in amber
label.vi: Côn trùng trong hổ phách
group: tray_amber_group
image.brief: [ảnh] Một con côn trùng nhỏ (ruồi hay muỗi) nằm trong miếng hổ phách vàng trong đã đánh bóng, chụp gần trên nền trơn; hổ phách vùng biển Baltic hay nguồn khác, không lấy hổ phách Myanmar; không có nhãn, thước đo, giá tiền hay chữ; không phải đồ trang sức. Câu q3 dùng lại ảnh này. Từ khoá tìm ảnh (EN): insect in Baltic amber
image.alt.en: An insect in amber
image.alt.vi: Côn trùng trong hổ phách

#### item tray_old_pot
label.en: Old clay pot
label.vi: Bình gốm cổ
group: tray_not_living
image.brief: [ảnh] Một chiếc bình gốm cổ màu xám, đặt trên nền trắng, chụp ngang (ảnh designer chọn 11/11: bình gốm thời Chiến Quốc); không có nhãn, chữ khắc hay biển tên. Hình gốc của bảng Hình dùng chung (bài mười w2 dùng lại). Từ khoá tìm ảnh (EN): ancient clay pot museum
image.alt.en: An old clay pot
image.alt.vi: Bình gốm cổ

#### item tray_stone_wood
label.en: Wood turned to rock
label.vi: Gỗ hoá thành đá
group: tray_mineral_group
image.brief: [ảnh] Một khúc gỗ hoá đá nằm ngoài trời, thấy rõ vân gỗ và vòng tuổi nhưng màu và mặt như đá, chụp chéo gần vừa; không có người, không có biển, rào hay chữ. Câu q4 dùng lại ảnh này. Từ khoá tìm ảnh (EN): petrified wood log
image.alt.en: A log turned to rock
image.alt.vi: Khúc gỗ hoá thành đá

#### item tray_leaf_fossil
label.en: Fern shape in rock
label.vi: Hình lá dương xỉ trên đá
group: tray_imprint_group
image.brief: Dùng lại hình `tray_leaf_fossil` ở bài `da-va-dat/hoa-thach-hinh-thanh-the-nao`. Từ khoá tìm ảnh (EN): fern leaf fossil imprint rock
image.alt.en: A fern shape in rock
image.alt.vi: Hình lá dương xỉ trên đá

#### item tray_old_coin
label.en: Old coin
label.vi: Đồng xu cổ
group: tray_not_living
image.brief: [ảnh] Một đồng xu cổ bằng đồng đã xỉn màu xanh, chụp gần trên nền trơn; ưu tiên đồng xu không có chữ hay chữ đã mòn, không đọc được ở cỡ ô; không có tay người, không có nhãn. Hình gốc của bảng Hình dùng chung (bài mười một w1 dùng lại). Từ khoá tìm ảnh (EN): ancient worn bronze coin
image.alt.en: An old coin
image.alt.vi: Đồng xu cổ

#### item tray_amber_spider
label.en: Spider in amber
label.vi: Nhện trong hổ phách
group: tray_amber_group
image.brief: [ảnh] Một con nhện nhỏ nằm trong miếng hổ phách vàng trong, chụp gần trên nền trơn; không lấy hổ phách Myanmar; không có nhãn, thước đo, giá tiền hay chữ. Từ khoá tìm ảnh (EN): spider in amber
image.alt.en: A spider in amber
image.alt.vi: Nhện trong hổ phách

#### item tray_stone_shell
label.en: Shell turned to rock
label.vi: Vỏ ốc hoá thành đá
group: tray_mineral_group
image.brief: [ảnh] Một vỏ ốc hoá thạch đã được chất khoáng lấp đầy, nặng và rắn như đá, màu xám, nằm trên lòng bàn tay người lớn (chỉ thấy bàn tay), chụp gần; khác cúc đá của bài tám; không có nhãn, thước đo hay chữ. Ảnh designer chọn 11/11 (không có ảnh mẫu vật nền trơn hợp lệ). Câu q3 dùng lại ảnh này. Từ khoá tìm ảnh (EN): fossil snail shell mineral filled
image.alt.en: A shell turned to rock
image.alt.vi: Vỏ ốc hoá thành đá
> [CẦN KIỂM] Ảnh đúng là vỏ ốc được chất khoáng lấp đầy (người chọn ảnh xem chú thích của mẫu vật).

#### item tray_rock_print
label.en: Footprint in rock
label.vi: Dấu chân in trên đá
group: tray_imprint_group
image.brief: Dùng lại hình `tray_rock_print` ở bài `khung-long/hoa-thach-ke-chuyen-khung-long`. Từ khoá tìm ảnh (EN): dinosaur footprint fossil three toed rock top view
image.alt.en: A dinosaur footprint in rock
image.alt.vi: Dấu chân khủng long in trên đá

#### item tray_old_lamp
label.en: Old oil lamp
label.vi: Đèn dầu cổ
group: tray_not_living
image.brief: [ảnh] Một chiếc đèn bão dầu hoả cũ, gỉ, có bầu thuỷ tinh, chụp ngang (ảnh designer chọn 11/11); không có nhãn hiệu, không có người, không có chữ. Từ khoá tìm ảnh (EN): antique oil lamp glass
image.alt.en: An old oil lamp
image.alt.vi: Đèn dầu cổ

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Bốn format. Vị trí đáp án theo bảng `_topic.md` (bài chín): q1 thứ nhất, thẻ đúng q2 thứ hai, q3 thứ nhất và thứ ba, q4 thứ ba trong bốn, q5 thứ hai.
> Mỗi hình chỉ một vai trong bài: ảnh nhựa thông (`resin`) là hình câu q1 và lựa chọn sai q4 (không trái nhau); nước đá chỉ ở q1; ảnh gỗ hoá đá chỉ là hình câu q4.

### q1
id: 89cf262f-6fbe-411a-9cf1-3b6f450e6b0b
format: single_choice
version: 1
dok: 1
prompt.en: What does sticky tree resin slowly harden into?
prompt.vi: Nhựa cây dính cứng dần lại thành gì?
image.brief: Dùng lại hình `resin`. Từ khoá tìm ảnh (EN): pine resin dripping tree trunk
image.alt.en: Resin on a pine tree
image.alt.vi: Nhựa thông trên thân cây
hint.en: Remember the insect in today's lesson.
hint.vi: Em nhớ lại con côn trùng trong bài hôm nay nhé.
explanation_correct.en: Amber can keep an insect for millions of years.
explanation_correct.vi: Hổ phách giữ được côn trùng hàng triệu năm.
explanation_wrong.en: Sticky resin slowly hardens into amber.
explanation_wrong.vi: Nhựa cây dính cứng dần thành hổ phách.
> DOK 1: nhớ lại ô Hổ phách. Hai lựa chọn sai có sức hút: thuỷ tinh biển (cũng trong, nhẵn, nhặt được ở bờ biển như hổ phách), nước đá (cũng trong, cứng lại). Khác câu w1 bài mười (bên đó hỏi ngược lại "hổ phách tạo thành từ gì", lựa chọn mật ong, nhựa cây, nước đá).
> Đáp án dùng ảnh từ `amber` (bé đã thấy ở ô Từ mới); nước đá bé đã thấy ở bài *Núi lửa*; chỉ thuỷ tinh là ảnh mới. Gợi ý không gọi tên ô "Amber" (trùng nhãn đáp án).

#### option q1_amber
correct: true
label.en: amber
label.vi: hổ phách
image.brief: Dùng lại hình `amber`. Từ khoá tìm ảnh (EN): amber pieces polished
image.alt.en: Pieces of amber
image.alt.vi: Mấy mẩu hổ phách

#### option q1_ice
correct: false
feedback.en: Ice is frozen water and melts when warm.
feedback.vi: Nước đá là nước đông lại, gặp nóng sẽ tan.
label.en: ice
label.vi: nước đá
image.brief: Dùng lại hình `q1_ice` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): ice cubes glass
image.alt.en: Ice in a glass
image.alt.vi: Nước đá trong cốc

#### option q1_glass
correct: false
feedback.en: Glass is made by people from melted sand.
feedback.vi: Thuỷ tinh do người nấu chảy cát mà thành.
label.en: glass
label.vi: thuỷ tinh
image.brief: [ảnh] Mấy mảnh thuỷ tinh biển màu xanh lá và trắng đã mài nhẵn cạnh, nằm trên nền trơn, chụp gần, cùng cỡ với ảnh hổ phách (designer 11/11: không có ảnh thuỷ tinh nâu hợp lệ); không có nhãn, không có chữ. Từ khoá tìm ảnh (EN): sea glass pieces
image.alt.en: Pieces of sea glass
image.alt.vi: Mấy mảnh thuỷ tinh biển

### q2
id: 55c0ccc7-e53c-48d1-8fc4-2235c61454b2
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `q2_museum` ở bài `khung-long/hoa-thach-ke-chuyen-khung-long`. Từ khoá tìm ảnh (EN): natural history museum gallery interior display cases
image.alt.en: Inside a museum
image.alt.vi: Bên trong bảo tàng
sentence.en: Palaeontology is the study of {1}.
sentence.vi: Cổ sinh vật học là ngành nghiên cứu {1}.
answers: q2_fossils
hint.en: Remember the Palaeontology picture in the lesson.
hint.vi: Em nhớ lại ô Cổ sinh vật học trong bài học nhé.
explanation_correct.en: Fossils show how animals lived long ago.
explanation_correct.vi: Nhờ hoá thạch, ta biết con vật xưa sống ra sao.
explanation_wrong.en: Palaeontologists study fossils from long ago.
explanation_wrong.vi: Nhà cổ sinh vật học nghiên cứu hoá thạch thời xa xưa.
> DOK 1: nhớ lại nghĩa của từ mới `palaeontology`. Câu không có gốc từ "fossil". Thẻ sai "rocks" · "đá" có sức hút (nhà cổ sinh vật học đào hoá thạch trong đá; nghiên cứu đá là việc của nhà địa chất, bài bốn); "stars" · "các vì sao" cũng là một ngành nghiên cứu. Thẻ đúng ở chỗ thứ hai (bảng vị trí). Ba thẻ là ảnh chụp.

#### bank q2_rocks
label.en: rocks
label.vi: đá
feedback.en: Rocks were never alive.
feedback.vi: Đá chưa từng là sinh vật sống.
image.brief: Dùng lại hình `granite` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): granite rock sample
image.alt.en: A grey rock
image.alt.vi: Hòn đá màu xám

#### bank q2_fossils
label.en: fossils
label.vi: hoá thạch
image.brief: Dùng lại hình `tray_ammonite` ở bài `da-va-dat/hoa-thach-hinh-thanh-the-nao`. Từ khoá tìm ảnh (EN): ammonite fossil specimen
image.alt.en: A spiral shell in rock
image.alt.vi: Vỏ xoắn trong đá

#### bank q2_stars
label.en: stars
label.vi: các vì sao
feedback.en: Stars are far up in the sky, not in rock.
feedback.vi: Các vì sao ở trên trời, không nằm trong đá.
image.brief: Dùng lại hình `q5` ở bài `khung-long/vi-sao-khung-long-bien-mat`. Từ khoá tìm ảnh (EN): starry night sky Milky Way over hill
image.alt.en: A starry night sky
image.alt.vi: Bầu trời đêm đầy sao

### q3
id: 9b41301f-6e22-4f52-bc28-1454d58acaf4
format: multi_choice
version: 1
dok: 2
prompt.en: Which ones came from something once alive?
prompt.vi: Những thứ nào có từ một sinh vật từng sống?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `magnifying_glass` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): magnifying glass plain background
image.alt.en: A magnifying glass
image.alt.vi: Chiếc kính lúp
hint.en: Think about who or what made each one.
hint.vi: Em nghĩ xem mỗi thứ do ai hay do gì tạo nên nhé.
explanation_correct.en: Fossils in amber and in rock both come from life.
explanation_correct.vi: Hoá thạch trong hổ phách hay trong đá đều từ sinh vật.
explanation_wrong.en: The insect and the shell were once alive.
explanation_wrong.vi: Con côn trùng và con ốc từng là sinh vật sống.
> DOK 2: phân loại theo ý chính ba. Cối đá có sức hút mạnh: làm bằng đá, rất cũ, nhưng do con người làm ra, chưa từng sống. Viên gạch nối `bricks_are_rocks` của bài một: làm từ đất sét, do con người làm ra, chưa từng sống. Đáp án ở chỗ thứ nhất và thứ ba (bảng vị trí).
> Rà chữ tester 11/11 (N4): lựa chọn sai `q3_pot` (bình gốm cổ, món bẫy của kệ) đổi thành `q3_brick` (dùng lại ảnh bài một), để hai lựa chọn sai đều là vật ngoài kệ, bé không trả lời bằng trí nhớ trò chơi. Nay hai đáp án là món kệ Chơi, hai lựa chọn sai là ảnh bài một; cả bốn là ảnh chụp đồ vật.

#### option q3_amber
correct: true
label.en: insect in amber
label.vi: côn trùng trong hổ phách
image.brief: Dùng lại hình `tray_amber_insect`. Từ khoá tìm ảnh (EN): insect in Baltic amber
image.alt.en: An insect in amber
image.alt.vi: Côn trùng trong hổ phách

#### option q3_mortar
correct: false
feedback.en: People carved this mortar out of rock.
feedback.vi: Cối đá do người đục từ đá ra.
label.en: stone mortar
label.vi: cối đá
image.brief: Dùng lại hình `tray_mortar` ở bài `da-va-dat/lam-quen-voi-da`. Từ khoá tìm ảnh (EN): granite mortar and pestle
image.alt.en: A grey mortar and pestle
image.alt.vi: Cối và chày màu xám
> `tray_mortar` theo kế hoạch bài một ở `_topic.md` (món Chơi "Tools"), không có ở bảng Hình dùng chung. Rà chữ tester 11/11 (n2, n3): `alt` và từ khoá chép đúng gốc bài một.

#### option q3_shell
correct: true
label.en: shell turned to rock
label.vi: vỏ ốc hoá thành đá
image.brief: Dùng lại hình `tray_stone_shell`. Từ khoá tìm ảnh (EN): fossil snail shell mineral filled
image.alt.en: A shell turned to rock
image.alt.vi: Vỏ ốc hoá thành đá

#### option q3_brick
correct: false
feedback.en: People bake clay to make bricks.
feedback.vi: Gạch do người nung từ đất sét.
label.en: clay brick
label.vi: viên gạch
image.brief: Dùng lại hình `tray_brick` ở bài `da-va-dat/lam-quen-voi-da`. Từ khoá tìm ảnh (EN): red clay brick plain background
image.alt.en: Red bricks in a stack
image.alt.vi: Mấy viên gạch xếp chồng
> `alt` theo bảng designer 11/11 (ảnh chồng gạch); A sửa `alt` gốc ở bài một theo cùng chữ.

### q4
id: 102e086d-5c63-4a77-bd09-15c857067f72
format: single_choice
version: 1
dok: 2
prompt.en: What turned this log into rock?
prompt.vi: Điều gì biến khúc gỗ này thành đá?
image.brief: Dùng lại hình `tray_stone_wood`. Từ khoá tìm ảnh (EN): petrified wood log
image.alt.en: A log turned to rock
image.alt.vi: Khúc gỗ hoá thành đá
hint.en: It happened slowly, deep under the ground.
hint.vi: Việc này xảy ra rất chậm, sâu dưới lòng đất.
explanation_correct.en: Minerals slowly filled the wood over millions of years.
explanation_correct.vi: Chất khoáng dần lấp đầy gỗ qua hàng triệu năm.
explanation_wrong.en: Minerals in water slowly filled the wood.
explanation_wrong.vi: Chất khoáng trong nước dần lấp đầy khúc gỗ.
> A2 (SK-043, 14/11): câu hỏi cũ mười tám chữ (hai câu), nay tám chữ; ý "hàng triệu năm" chuyển sang giải thích khi đúng.
> DOK 2: áp ý chính hai vào vật bé vừa gặp ở kệ Chơi, hỏi nguyên nhân. Bốn lựa chọn, đáp án ở chỗ thứ ba (bảng vị trí). Lựa chọn sai có sức hút: lửa (gỗ cháy thành than đen, cứng), nắng (gỗ phơi khô, cứng), nhựa cây (cũng từ cây, cũng tạo hoá thạch, nhưng là cách khác). Gợi ý chỉ cách nghĩ (chậm, sâu dưới đất), không gọi tên ô "Filled with minerals" (trùng chữ nhãn đáp án).
> Bốn nhãn cùng một khuôn "X from/in Y".

#### option q4_fire
correct: false
feedback.en: Fire burns wood into ash, not rock.
feedback.vi: Lửa đốt gỗ thành tro, không thành đá.
label.en: heat from fire
label.vi: hơi nóng của lửa
image.brief: [ảnh] Một khúc gỗ đang cháy trong đống lửa ngoài trời, ngọn lửa cam, chụp gần vừa; không có người, không có chữ. Từ khoá tìm ảnh (EN): burning log campfire close
image.alt.en: A log burning in a fire
image.alt.vi: Khúc gỗ đang cháy

#### option q4_sun
correct: false
feedback.en: Sunlight dries wood but cannot turn it to rock.
feedback.vi: Nắng làm khô gỗ, không biến gỗ thành đá.
label.en: light from the sun
label.vi: ánh nắng mặt trời
image.brief: [ảnh] Nắng chiếu lên một khúc gỗ khô nằm trên bãi đất trống, bóng đổ rõ, chụp gần vừa; không có người, không có chữ. Từ khoá tìm ảnh (EN): sunlight on dry log
image.alt.en: Sunlight on a dry log
image.alt.vi: Nắng chiếu lên khúc gỗ khô

#### option q4_minerals
correct: true
label.en: minerals in water
label.vi: chất khoáng trong nước
image.brief: [ảnh] Nước suối khoáng chảy qua những bậc thềm cặn khoáng màu trắng ngà, thấy rõ lớp khoáng đọng lại, chụp gần vừa; không có người, không có chữ. Từ khoá tìm ảnh (EN): mineral spring travertine terraces water
image.alt.en: Water flowing over white mineral steps
image.alt.vi: Nước chảy qua những bậc khoáng trắng
> [CẦN KIỂM] Ảnh thềm cặn khoáng (nước giàu chất khoáng để lại lớp đá trắng) dùng để minh hoạ "chất khoáng trong nước" cho trẻ; chuyên môn xác nhận hình này hợp.

#### option q4_resin
correct: false
feedback.en: Resin makes amber, but it cannot turn wood to rock.
feedback.vi: Nhựa cây tạo hổ phách, không biến gỗ thành đá.
label.en: resin from trees
label.vi: nhựa từ cây
image.brief: Dùng lại hình `resin`. Từ khoá tìm ảnh (EN): pine resin dripping tree trunk
image.alt.en: Resin on a pine tree
image.alt.vi: Nhựa thông trên thân cây

### q5
id: c6dc1817-abad-4ca3-9a8d-bc6a9ccc5a48
format: single_choice
version: 1
dok: 2
prompt.en: Which sea animal leaves fossils most often?
prompt.vi: Con vật biển nào thường để lại hoá thạch nhất?
image.brief: [ảnh] Nước biển nông trong vắt, nhìn thấy đáy cát và mấy hòn đá, chụp từ trên mặt nước; không có con vật, không có người, không có chữ. Từ khoá tìm ảnh (EN): clear shallow sea water sandy bottom
image.alt.en: Clear shallow sea water
image.alt.vi: Nước biển nông trong vắt
hint.en: Which parts last after an animal dies?
hint.vi: Phần nào của con vật còn lại lâu sau khi nó chết?
explanation_correct.en: Hard parts last long enough to become fossils.
explanation_correct.vi: Phần cứng như mai, vỏ giữ đủ lâu để thành hoá thạch.
explanation_wrong.en: A crab's hard shell can last a long time.
explanation_wrong.vi: Mai cua cứng nên giữ được lâu.
> DOK 2: áp ô "Soft bodies" (và ô Phân huỷ bài tám) vào con vật mới. Thay câu gợi ý ở `_topic.md` ("vì sao con sứa rất hiếm khi thành hoá thạch"): câu "vì sao" cần ba lựa chọn là ba lý do, khó có hình; câu này giữ ý, bé chọn giữa ba con vật biển. Bạch tuộc có sức hút (to, khoẻ) nhưng thân mềm.
> Đáp án (con cua) là ảnh mới; một lựa chọn sai (con sứa) là ảnh ô Học, lựa chọn sai kia (bạch tuộc) là ảnh mới. Ba ảnh cùng là con vật dưới nước biển.
> [CẦN KIỂM] Mai cua cứng nên dễ thành hoá thạch hơn sứa, bạch tuộc (biên tập nhớ).
> Rà chữ tester 11/11 (n4): câu hỏi đổi khuôn ("leaves fossils most often" · "thường để lại hoá thạch nhất"), để không lặp khuôn "most likely to become a fossil" của câu q5 bài tám (hôm trước) và câu q5 *Khủng long* bài ba.

#### option q5_jellyfish
correct: false
feedback.en: A jellyfish has a soft body that decays away.
feedback.vi: Sứa có thân mềm, dễ phân huỷ hết.
label.en: jellyfish
label.vi: con sứa
image.brief: Dùng lại hình `explore_soft`. Từ khoá tìm ảnh (EN): jellyfish swimming blue water
image.alt.en: A jellyfish in the sea
image.alt.vi: Con sứa dưới biển

#### option q5_crab
correct: true
label.en: crab
label.vi: con cua
image.brief: [ảnh] Một con cua biển trên đáy cát dưới nước, nhìn từ trên xuống thấy rõ mai và càng, chụp gần vừa; không có tay người, không có chữ. Từ khoá tìm ảnh (EN): crab underwater sea floor
image.alt.en: A crab on the sea floor
image.alt.vi: Con cua dưới đáy biển

#### option q5_octopus
correct: false
feedback.en: An octopus has no hard shell or bones.
feedback.vi: Bạch tuộc không có vỏ cứng, không có xương.
label.en: octopus
label.vi: con bạch tuộc
image.brief: [ảnh] Một con bạch tuộc dưới nước biển, các xúc tu duỗi ra, chụp gần vừa; không có tay người, không có chữ. Từ khoá tìm ảnh (EN): octopus underwater
image.alt.en: An octopus in the sea
image.alt.vi: Con bạch tuộc dưới biển

### q6
id: 6c993ce6-bd96-4d46-9e0a-b06a8357d6c5
format: true_false
version: 1
dok: 3
misconception: old_things_are_fossils
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: This old bronze drum must be a fossil.
statement.vi: Trống đồng này rất cổ, vậy nó là hoá thạch.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: false
image.brief: [ảnh] Một chiếc trống đồng Đông Sơn trưng bày trong bảo tàng, mặt trống nhìn chéo từ trên xuống thấy hoa văn, nền trơn; không có người, không có biển tên, không có chữ. Nhiều ảnh trống đồng trên Commons là CC BY-SA, phải loại. Từ khoá tìm ảnh (EN): Dong Son bronze drum museum
image.alt.en: An old bronze drum
image.alt.vi: Chiếc trống đồng cổ
hint.en: Who made this drum? What is it made of?
hint.vi: Ai làm ra chiếc trống này? Trống làm bằng gì?
explanation_correct.en: Old things that people made are not fossils.
explanation_correct.vi: Đồ cổ do người làm ra không phải hoá thạch.
explanation_wrong.en: Only things that were once alive become fossils.
explanation_wrong.vi: Chỉ những gì từng sống mới thành hoá thạch.
feedback_true.en: Bronze is a metal that people melt and shape.
feedback_true.vi: Đồng là kim loại, người ta nấu chảy rồi đúc.
> DOK 3: bắt lỗi một lập luận ("rất cổ nên là hoá thạch") về một vật mới, không có ở kệ Chơi (`_topic.md`, ghi chú của `old_things_are_fossils`). Lời Na đúng bảng "Câu sáu, lời Na"; đáp án Sai theo bảng Đúng/Sai. Giải thích khi đúng không mở đầu bằng "Yes!".
> Trống đồng giữ theo Main session chốt 11/11. Chữ không chê trống đồng: chỉ nói "người xưa làm ra", không nói "không quý".

## Từ vựng

### resin
id: b165e01f-fbd8-4910-8c43-553ed1c77dbe
tier: core
term.en: resin
term.vi: nhựa cây
example.en: Sticky resin drips down a pine tree.
example.vi: Nhựa thông dính chảy xuống thân cây thông.
image.brief: [ảnh] Những giọt nhựa thông vàng óng chảy trên vỏ một thân cây thông, chụp gần; không có côn trùng trong nhựa, không có người, không có chữ. Hình gốc của bảng Hình dùng chung (bài mười w1 dùng lại); câu q1 và câu q4 dùng lại ảnh này. Từ khoá tìm ảnh (EN): pine resin dripping tree trunk
image.alt.en: Resin on a pine tree
image.alt.vi: Nhựa thông trên thân cây

### amber
id: 909d7916-a2e7-45f5-a5fd-868d90c72582
tier: core
term.en: amber
term.vi: hổ phách
example.en: Amber is tree resin that hardened long ago.
example.vi: Hổ phách là nhựa cây đã cứng lại từ rất lâu.
image.brief: [ảnh] Nhiều mẩu hổ phách vùng biển Baltic nhiều màu (vàng, cam, nâu), không có côn trùng bên trong, đặt trên nền đen, chụp gần; không lấy hổ phách Myanmar; không có nhãn, giá tiền hay chữ; không phải đồ trang sức. Hình gốc của bảng Hình dùng chung (bài mười dùng làm hình câu w1); câu q1 dùng lại ảnh này. Từ khoá tìm ảnh (EN): amber pieces polished
image.alt.en: Pieces of amber
image.alt.vi: Mấy mẩu hổ phách
> `alt` đổi theo ảnh designer chọn 11/11 (nhiều màu, không chỉ vàng trong); chỗ dùng lại ở bài này và bài mười chép theo.

### palaeontology
id: 3f0e24e5-3876-4455-b6b3-623ac88d94c3
tier: core
term.en: palaeontology
term.vi: cổ sinh vật học
example.en: Mai wants to study palaeontology one day.
example.vi: Mai muốn học ngành cổ sinh vật học sau này.
image.brief: Dùng lại hình `palaeontologist` ở bài `khung-long/hoa-thach-ke-chuyen-khung-long`. Từ khoá tìm ảnh (EN): palaeontologist hands tool fossil rock quarry
image.alt.en: A palaeontologist digging out a fossil
image.alt.vi: Nhà cổ sinh vật học đào hoá thạch
> Chính tả Anh "palaeontology" (bảng Tên gọi). [Nghe thử] giọng EN. Câu ví dụ khác câu q2, để từ mới không đưa sẵn đáp án.

### soft_body
id: 76c07cdd-a4b8-4c00-9abb-8971e1cbd940
tier: extra
term.en: soft body
term.vi: thân mềm
example.en: A jellyfish has a soft body.
example.vi: Con sứa có thân mềm.
image.brief: Dùng lại hình `explore_soft`. Từ khoá tìm ảnh (EN): jellyfish swimming blue water
image.alt.en: A jellyfish in the sea
image.alt.vi: Con sứa dưới biển

## Thưởng

### amber_insect_card
id: e91e9ea8-dea1-423d-b4c3-10ea80b6ebe4
set: rocks
rarity: common
name.en: Insect in amber
name.vi: Côn trùng trong hổ phách
tag.en: Trapped in resin
tag.vi: Mắc trong nhựa cây
fact.en: A tiny insect got stuck in sticky resin. It stayed inside for millions of years.
fact.vi: Một con côn trùng nhỏ bị dính vào nhựa cây. Nó nằm yên trong đó hàng triệu năm.
> [CẦN KIỂM] Như bảng Bộ thẻ ở `_topic.md`. Không nói chuyện lấy khủng long từ muỗi trong hổ phách.
image.brief: [ảnh] Một con kiến nhỏ nằm trong miếng hổ phách vùng biển Baltic, chụp cận thấy rõ chân và râu kiến, nền tối trơn; khác ảnh `tray_amber_insect` (con côn trùng khác); không lấy hổ phách Myanmar; không có nhãn, giá tiền hay chữ. Từ khoá tìm ảnh (EN): ant in Baltic amber close up
image.alt.en: A tiny ant in amber
image.alt.vi: Con kiến nhỏ trong hổ phách

## Ghi chú cho hoạ sĩ

- **Loại hình:** kệ Chơi, Quiz, từ vựng, thẻ là ảnh chụp; hai ô Học đầu là hình tự vẽ cùng nét bộ "Mặt cắt lòng đất" của bài tám. Hình không có chữ.
- **Hình tự vẽ (hai):** `explore_amber` (hai khung: giọt nhựa có con kiến, rồi miếng hổ phách), `explore_minerals` (khúc gỗ bị vùi, chất khoáng theo nước ngấm vào).
- **Ảnh cần tìm (hai mươi):**
  - Học (một): con sứa (`explore_soft`).
  - Chơi (bảy): côn trùng trong hổ phách, nhện trong hổ phách, gỗ hoá đá, vỏ ốc hoá đá, bình gốm cổ (`tray_old_pot`, hình gốc), đồng xu cổ (`tray_old_coin`, hình gốc), đèn dầu cổ.
  - Khởi động (một): lá ép trên giấy trắng (w1).
  - Quiz (tám): mảnh thuỷ tinh biển (q1); khúc gỗ cháy, khúc gỗ dưới nắng, thềm cặn khoáng (q4); nước biển nông, con cua, con bạch tuộc (q5); trống đồng (q6).
  - Từ vựng (hai): nhựa thông (`resin`, hình gốc), hổ phách (`amber`, hình gốc).
  - Thưởng (một): kiến trong hổ phách.
  - Cộng lại: một, bảy, một, tám, hai, một là hai mươi ảnh mới.
- **Khó tìm ảnh, phương án thay:**
  - Hổ phách: loại ảnh hổ phách Myanmar (Kachin); ưu tiên Baltic, Dominica. Không ảnh đồ trang sức, không giá tiền. Designer 11/11: `tray_amber_insect`, `amber`, thẻ kiến là hổ phách Baltic; `tray_amber_spider` không ghi xuất xứ, đang được thay ảnh (brief giữ).
  - Trống đồng: nhiều ảnh CC BY-SA; tìm ảnh của bảo tàng có giấy phép mở hay ảnh PD; không có thì báo biên tập (Main session đã chốt giữ trống đồng; phương án thay ở `_topic.md` là "chiếc nồi đồng cổ").
  - Đồng xu cổ: hầu hết có chữ; chọn đồng xu chữ đã mòn hay chụp nghiêng để chữ không đọc được ở cỡ ô.
  - Vỏ ốc hoá đá: xem chú thích mẫu vật để chắc là vỏ được chất khoáng lấp đầy.
- **Dùng lại trong bài:** `resin` (hình câu q1, lựa chọn q4_resin); `amber` (q1_amber); `explore_soft` (q5_jellyfish, từ `soft_body`); `tray_amber_insect`, `tray_stone_shell` (q3); `tray_stone_wood` (hình câu q4).
- **Dùng lại từ bài khác:** `tray_leaf_fossil`, `tray_dry_leaf`, `tray_ammonite` (bài tám); `granite`, `magnifying_glass` (bài hai); `tray_mortar`, `tray_brick` (bài một); `w1_stone` (*Vì sao ta phải thở*); `q1_ice` (*Núi lửa*); `q4`, `q2_museum`, `tray_rock_print`, `palaeontologist` (*Hoá thạch kể chuyện khủng long*); `q5` bầu trời sao (*Vì sao khủng long biến mất*).
- **Bài khác dùng lại hình của bài này** (bảng Hình dùng chung): `resin` (bài mười w1), `amber` (bài mười, hình câu w1), `tray_old_pot` (bài mười w2), `tray_old_coin` (bài mười một w1).
- **Cùng kiểu trong một câu:** w1 ba ảnh lá chụp từ trên xuống; q1 ba ảnh vật trong suốt trên nền trơn; q2 ba ảnh chụp; q3 bốn ảnh đồ vật; q4 bốn ảnh (lửa, nắng, nước khoáng, nhựa cây); q5 ba ảnh con vật dưới nước.
- **Màu:** Học: hổ phách `vang_hoe`, chất khoáng `cham`, thân mềm `do_son`, cổ sinh vật học `gi_dong`. Chơi: trong hổ phách `vang_hoe`, chất khoáng `cham`, dấu in `do_son`, nhóm `limit` `nau_dat`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required` (mỗi nhóm hai món), một nhóm `limit` (ba món), chín món.
  - Khởi động: `single_choice` (w1 ôn bài tám), `true_false` (w2 ôn bài bốn, Đúng).
  - Quiz: `single_choice` (q1, q4 bốn lựa chọn, q5), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6, `speaker: na`, Sai). Bốn format.
  - DOK q1 tới q6: 1, 1, 2, 2, 2, 3. Câu có `misconception`: q6, key `old_things_are_fossils`.
- **Vị trí đáp án đúng:** w1 thứ ba; q1 thứ nhất; thẻ đúng q2 thứ hai; q3 thứ nhất và thứ ba; q4 thứ ba (bốn lựa chọn); q5 thứ hai. Khớp bảng `_topic.md`.
- **Tham chiếu:** `recall_from.lesson` trỏ `da-va-dat/hoa-thach-hinh-thanh-the-nao` (w1), `da-va-dat/thang-do-cung-mohs` (w2).
- **Màn Chơi, ví dụ để kiểm:**
  - chạm Côn trùng trong hổ phách, Gỗ hoá thành đá, Dấu chân in trên đá → đạt;
  - chạm Bình gốm cổ → `has_limited`;
  - chạm Nhện trong hổ phách, Côn trùng trong hổ phách, Vỏ ốc hoá thành đá (thiếu dấu in) → `missing.tray_imprint_group`; chạm Hình lá dương xỉ trên đá → `full`; bỏ Nhện trong hổ phách, đặt Hình lá dương xỉ trên đá → đạt.
- **Dòng điều kiện màn Chơi:** "Cần đủ Trong hổ phách, Chất khoáng lấp đầy, Dấu in · Không phải từ sinh vật".
- **Số từ EN trên một màn:**
  - Học khoảng ba mươi hai từ: mục tiêu 8, hướng dẫn 3, bốn nhãn 7, câu dài nhất 9, ô Từ mới 5.
  - Quiz nhiều nhất là q4 (khoảng ba mươi: câu hỏi 13, bốn nhãn 12, gợi ý 7) và q3 (khoảng hai mươi chín). q6 cả màn 18.
- **Từ EN có thể ngoài Starters/Movers:** resin, amber, palaeontology, palaeontologists, minerals, sticky, trapped, insect, spider, jellyfish, octopus, crab, mortar, bronze, drum, oil lamp, coin, seeps, log.
- **Giọng đọc:** nghe thử EN "palaeontology", "amber", "resin"; VI "cổ sinh vật học", "chất khoáng".
- **Bộ thẻ:** `set: rocks`.
