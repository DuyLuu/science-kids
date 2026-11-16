---
id: bdaf000d-f9ff-4701-8fca-d10794579eb8
topic: da-va-dat
slug: da-dung-lam-gi
order: 6
stage: apply
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Everyday uses of rocks
vi: Đá dùng làm gì?
> Giữ đúng tên ở `content/syllabus.json` (`rocks-and-soils`, bài số sáu).

## Mục tiêu
en: I can choose a rock that suits a job.
vi: Em chọn được loại đá hợp với từng việc.
> Trạng thái: **nháp do AI soạn (content-editor, người soạn B), chưa duyệt.** Ticket SK-039 bước 2, ngày 11/11/2026. Chưa chạy `validate`, chưa chạy `ids`.
> Bài `apply`: vận dụng tính chất đã học ở bài ba (cứng, mềm) và bài năm (thấm nước) để chọn đá cho từng việc. Bản địa hoá đã duyệt (syllabus-lessons.md mục 6): đá vôi, đá ong, đá hoa cương trong nhà và đình chùa. Sửa `any_rock_for_any_job` ở ý chính ba, bốn ô Học, phần Chơi, câu q4, q5 và câu q6 (gắn key, Na chưa đúng).

## Ý chính
1.en: In Vietnam, people use limestone, laterite and granite.
1.vi: Ở Việt Nam, người ta dùng đá vôi, đá ong và đá hoa cương.
2.en: People have used rock for a very long time.
2.vi: Con người đã dùng đá từ rất lâu rồi.
3.en: A rock's properties make it suitable for a job.
3.vi: Tính chất của mỗi loại đá làm nó phù hợp với một việc.
> Ý ba dùng từ mới `suitable`. Ý một là ba loại đá cụ thể (ba ô đầu), ý hai là ô Từ xa xưa, ý ba là điều bé rút ra (phần Chơi, câu q4, q5, q6).

## Khởi động

> Ba câu, đúng bảng Khởi động ở `_topic.md`:
> - w1 ôn bài năm (một ngày): đá nào cho nước thấm vào. Nối sang câu q4 và q6 hôm nay (đá thấm nước không hợp mọi việc).
> - w2 ôn bài ba (ba ngày): "Chalk is a soft rock." (Đúng). Nối sang câu q6 (đá phấn lợp mái).
> - w3 ôn bài một (năm ngày, mốc một tuần): thứ nào do con người làm ra.
> Hình dùng lại từ bài một tới bài năm (người soạn A): lúc soạn bài này các bài đó chưa có file, nên brief chỉ trỏ key theo bảng Hình dùng chung và luật đặt key ở `_topic.md`, chưa chép từ khoá; `alt` viết theo luật câu tính chất (chỉ tả màu, hình dáng). Topic editor chép từ khoá và đối chiếu `alt` khi rà chéo.

### w1
id: 643c01a7-d0b9-4080-b7b7-3717a3168543
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/da-nao-tham-nuoc
prompt.en: Which rock lets water soak in?
prompt.vi: Đá nào cho nước thấm vào?
image.brief: Dùng lại hình `q4` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): glass of water
image.alt.en: A glass full of water
image.alt.vi: Cốc đầy nước
hint.en: Remember the water test in lesson five.
hint.vi: Em nhớ lại trò thử nhỏ nước ở bài năm nhé.
explanation_correct.en: Water soaks into the gaps between sandstone's grains.
explanation_correct.vi: Nước thấm vào khe giữa các hạt cát của sa thạch.
explanation_wrong.en: Sandstone is permeable, so water soaks in.
explanation_wrong.vi: Sa thạch thấm nước, nên nước thấm vào được.
> Hình câu hỏi là cốc nước, gợi "nước" mà không cho thấy hòn đá nào. Lựa chọn theo bảng Khởi động; vị trí đáp án đúng: hết hiệu lực 15/11 (SK-047, app xáo).

#### option w1_marble
correct: false
feedback.en: Water stays on top of marble.
feedback.vi: Nước đọng lại trên mặt đá cẩm thạch.
label.en: marble
label.vi: đá cẩm thạch
image.brief: Dùng lại hình `marble` ở bài `da-va-dat/da-nao-cung-hon`. Từ khoá tìm ảnh (EN): white marble rock sample
image.alt.en: A white sparkly rock
image.alt.vi: Hòn đá trắng lấp lánh
> `alt` theo bảng designer 11/11 (ảnh mẫu cẩm thạch trắng hạt lấp lánh, không có vân xám rõ); A sửa `alt` gốc ở bài ba theo cùng chữ.

#### option w1_slate
correct: false
feedback.en: Water runs off slate without soaking in.
feedback.vi: Nước trượt khỏi đá phiến, không thấm vào.
label.en: slate
label.vi: đá phiến
image.brief: Dùng lại hình `tray_slate` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): slate rock sample
image.alt.en: A dark grey rock
image.alt.vi: Hòn đá màu xám sẫm

#### option w1_sandstone
correct: true
label.en: sandstone
label.vi: sa thạch
image.brief: Dùng lại hình `tray_sandstone` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): sandstone rock sample layers
image.alt.en: A yellow-brown rock
image.alt.vi: Hòn đá màu vàng nâu
> Câu hỏi về tính chất: nhãn là tên đá, `alt` chỉ tả màu (chép đúng `alt` gốc của bài hai), không nói "thấm nước" (`_topic.md`, Quy ước hình mục năm).

### w2
id: eb08a752-5169-44eb-9720-0ace5bf15779
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/da-nao-cung-hon
prompt.en: Chalk is a soft rock.
prompt.vi: Đá phấn là loại đá mềm.
image.brief: Dùng lại hình `chalk` ở bài `da-va-dat/da-nao-cung-hon`. Từ khoá tìm ảnh (EN): chalk rock sample
image.alt.en: A white rock
image.alt.vi: Hòn đá màu trắng
answer: true
hint.en: Remember the scratch test in lesson three.
hint.vi: Em nhớ lại trò thử cào ở bài ba nhé.
explanation_correct.en: Chalk is soft, so you can draw with it.
explanation_correct.vi: Đá phấn mềm, em vẽ được lên nền sân.
explanation_wrong.en: A fingernail can scratch chalk, so it is soft.
explanation_wrong.vi: Móng tay cào xước được đá phấn, nên nó mềm.
feedback_false.en: A fingernail leaves a scratch on chalk.
feedback_false.vi: Móng tay để lại vết xước trên đá phấn.
> Đúng chữ EN ở bảng Đúng/Sai (bài sáu w2, Đúng). `alt` không nói "mềm", để hình không thay bé trả lời. Không dùng hình `explore_scratch` (bàn tay cào đá phấn), vì đó là bằng chứng của đáp án.

### w3
id: f37660a3-0b25-42bd-9940-2bbbf824f176
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/lam-quen-voi-da
prompt.en: Which one did people make?
prompt.vi: Thứ nào do con người làm ra?
image.brief: Dùng lại hình `quarry` ở bài `da-va-dat/lam-quen-voi-da`. Từ khoá tìm ảnh (EN): open pit stone quarry terraces
image.alt.en: An open quarry
image.alt.vi: Mỏ đá lộ thiên
hint.en: Remember the Made by people picture in lesson one.
hint.vi: Em nhớ lại ô Do con người làm ra ở bài một nhé.
explanation_correct.en: People bake clay in a kiln to make bricks.
explanation_correct.vi: Người ta nung đất sét trong lò để làm gạch.
explanation_wrong.en: Bricks are made by people from baked clay.
explanation_wrong.vi: Gạch do người làm từ đất sét nung.
> Hình câu hỏi là mỏ đá (bài một, từ `quarry`): gợi "đá đến từ đâu", không cho thấy gạch. Gợi ý gọi tên ô "Made by people" · "Do con người làm ra" theo kế hoạch bài một; topic editor kiểm lại tên ô khi rà chéo.
> Lựa chọn theo bảng Khởi động; vị trí đáp án đúng: hết hiệu lực 15/11 (SK-047, app xáo). Hòn cuội nhẵn, tròn trông như được mài, nên có sức hút.

#### option w3_brick
correct: true
label.en: brick
label.vi: viên gạch
image.brief: Dùng lại hình `tray_brick` ở bài `da-va-dat/lam-quen-voi-da`. Từ khoá tìm ảnh (EN): red clay brick plain background
image.alt.en: Red bricks in a stack
image.alt.vi: Mấy viên gạch xếp chồng
> `alt` theo bảng designer 11/11 (ảnh chồng gạch, không có ảnh một viên gạch hợp lệ); A sửa `alt` gốc ở bài một theo cùng chữ. Nhãn "brick" · "viên gạch" giữ.

#### option w3_pebble
correct: false
feedback.en: Water shaped this pebble, not people.
feedback.vi: Hòn cuội do nước mài, không do người làm.
label.en: pebble
label.vi: hòn cuội
image.brief: Dùng lại hình `w1_stone` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): smooth pebble stone sand
image.alt.en: A smooth stone
image.alt.vi: Hòn đá cuội

#### option w3_hill
correct: false
feedback.en: Nature made limestone hills over a very long time.
feedback.vi: Núi đá vôi do tự nhiên tạo nên rất lâu.
label.en: limestone hill
label.vi: núi đá vôi
image.brief: Dùng lại hình `ha_long` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): Ha Long Bay aerial islands
image.alt.en: Islands in Ha Long Bay
image.alt.vi: Các hòn đảo ở vịnh Hạ Long

## Học

> Bốn ô, từ cụ thể tới trừu tượng: ba loại đá quen ở Việt Nam (ý chính một), rồi ô Từ xa xưa (ý chính hai). Mỗi ô nói một tính chất và một việc hợp với tính chất đó (ý chính ba).
> Ô Đá vôi có món "cement in concrete": đây là chỗ Oak nhắc "nhiều đồ dùng hằng ngày có đá nghiền nhỏ" (ghi chú của `any_rock_for_any_job`), và là nền cho câu q3.
> Không dùng `sentence_card` (app 0.1.0 chỉ hiện `explore_groups` đầu tiên và `word_list` đầu tiên).

### explore
id: 7f461958-1598-4b0f-91c3-f4c7bb20eb48
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_limestone
label.en: Limestone
label.vi: Đá vôi
color: cham
sentence.en: Limestone is crushed and heated to make cement.
sentence.vi: Đá vôi được nghiền nhỏ rồi nung nóng để làm xi măng.
> [CẦN KIỂM] Xi măng làm từ đá vôi (trộn với đất sét) nghiền nhỏ rồi nung ở nhiệt độ rất cao; vôi quét tường làm từ đá vôi nung (biên tập nhớ). Chữ cho trẻ giản lược "nghiền nhỏ rồi nung nóng".
image.brief: [ảnh] Những ngọn núi đá vôi dựng đứng, phủ cây xanh, mọc lên bên dòng sông hay giữa cánh đồng lúa ở Tràng An hoặc Tam Cốc, chụp xa; khác ảnh vịnh Hạ Long (`ha_long`) và ảnh bờ đảo Cát Bà của chủ đề *Bề mặt Trái Đất*; không có thuyền chở khách nhận ra mặt người, không có biển hiệu, không có chữ. Nhiều ảnh nơi này là CC BY-SA, phải loại; không có ảnh hợp lệ thì dùng lại `ha_long` và ghi vào ghi chú. Từ khoá tìm ảnh (EN): limestone karst Trang An Vietnam
image.alt.en: Tall limestone hills
image.alt.vi: Những ngọn núi đá vôi cao
examples.1.en: limestone hills
examples.1.vi: núi đá vôi
examples.2.en: lime to paint walls white
examples.2.vi: vôi để quét tường trắng
examples.3.en: cement to build houses
examples.3.vi: xi măng để xây nhà
examples.4.en: cement in concrete
examples.4.vi: xi măng trộn trong bê tông
> Câu này là chỗ dạy "xi măng làm từ đá vôi", ý được ôn ở bài bảy w1 (bảng Khởi động).

#### group explore_laterite
label.en: Laterite
label.vi: Đá ong
color: do_son
sentence.en: Laterite is soft when dug up, then slowly hardens.
sentence.vi: Đá ong mới đào lên thì mềm, rồi cứng dần.
> [CẦN KIỂM] Đá ong mới đào lên còn mềm, đẽo được thành khối; để ngoài không khí thì khô và cứng dần, không mềm lại (biên tập nhớ, như `_topic.md` mục bài sáu).
image.brief: [ảnh] Một ngôi nhà cổ ở làng cổ Đường Lâm có bức tường xây bằng những khối đá ong màu nâu đỏ, mặt rỗ nhiều lỗ, mái ngói nâu, chụp chéo thấy cả tường và mái; không có người, không có biển hiệu, câu đối hay chữ. Khác ảnh từ `laterite` (cận cảnh mặt đá) và ảnh thẻ `duong_lam_card` (cổng làng). Nhiều ảnh Đường Lâm là CC BY-SA, phải loại. Từ khoá tìm ảnh (EN): Duong Lam ancient village laterite house wall
image.alt.en: An old house with red-brown stone walls
image.alt.vi: Ngôi nhà cổ có tường đá màu nâu đỏ
examples.1.en: old houses in Duong Lam village
examples.1.vi: nhà cổ ở làng Đường Lâm
examples.2.en: village walls and wells
examples.2.vi: tường làng và giếng làng
examples.3.en: red-brown, full of tiny holes
examples.3.vi: màu nâu đỏ, nhiều lỗ nhỏ
examples.4.en: looks like a honeycomb
examples.4.vi: trông giống tổ ong
> [CẦN KIỂM] Nhà, tường, giếng ở làng cổ Đường Lâm xây bằng đá ong; tên "đá ong" do mặt đá rỗ như tổ ong (biên tập nhớ).

#### group explore_granite
label.en: Granite
label.vi: Đá hoa cương
color: gi_dong
sentence.en: Granite is hard and keeps water out.
sentence.vi: Đá hoa cương cứng và không thấm nước.
> [CẦN KIỂM] Đá hoa cương rất ít lỗ rỗng nên gần như không thấm nước (như `_topic.md`, ghi chú của `rocks_never_soak_water`). Chữ cho trẻ nói "không thấm nước".
image.brief: Dùng lại hình `tray_steps` ở bài `da-va-dat/lam-quen-voi-da`. Từ khoá tìm ảnh (EN): granite stone steps entrance
image.alt.en: Stone steps with a handrail
image.alt.vi: Bậc đá có tay vịn
> `alt` theo bảng designer 11/11 (ảnh bậc đá hoa cương ngoài trời có tay vịn); A sửa `alt` gốc ở bài một theo cùng chữ.
examples.1.en: front steps
examples.1.vi: bậc thềm
examples.2.en: kitchen worktops
examples.2.vi: mặt bàn bếp
examples.3.en: hard to scratch
examples.3.vi: khó bị cào xước
examples.4.en: shiny when polished
examples.4.vi: đánh bóng thì sáng loáng

#### group explore_long_ago
label.en: Long ago
label.vi: Từ xa xưa
color: vang_hoe
sentence.en: People have used rock for a very long time.
sentence.vi: Con người đã dùng đá từ rất lâu rồi.
image.brief: [ảnh] Cổng thành nhà Hồ xây bằng những khối đá vôi rất to, xếp khít, cổng vòm, chụp chính diện từ phía ngoài; không có người, không có biển giới thiệu, không có chữ. Khó tìm thì lấy một đoạn tường thành bằng khối đá vôi lớn của cùng di tích. Từ khoá tìm ảnh (EN): Citadel of the Ho Dynasty stone gate
image.alt.en: An old gate of huge stone blocks
image.alt.vi: Cổng thành cổ xây bằng những khối đá rất to
> [CẦN KIỂM] Thành nhà Hồ xây bằng những khối đá vôi lớn, hơn sáu trăm năm trước (`_topic.md` mục bài sáu). Chữ cho trẻ không nêu tên di tích, không nêu năm.
examples.1.en: a stone mortar
examples.1.vi: cối đá
examples.2.en: stone steps at old temples
examples.2.vi: bậc đá ở đình chùa xưa
examples.3.en: stone pillars at pagodas
examples.3.vi: cột đá ở chùa
examples.4.en: a wall of huge blocks
examples.4.vi: tường thành bằng những khối đá rất to
> Thay ví dụ của Oak (mũi tên đá thời Đồ Đá, Stonehenge) bằng cối đá, đình chùa, tường thành (`_topic.md`, Lệch Oak bài sáu). Đình chùa chỉ là công trình bằng đá, không cảnh thờ cúng (mục An toàn).

### new_words
id: 7e0ac8ad-d03c-4aee-b146-77a98289d7a2
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: suitable, limestone, laterite

## Chơi

> "Tìm một đồ vật làm từ mỗi loại đá". Bé chọn ba món: một đồ làm từ đá vôi, một đồ làm từ đá ong, một đồ làm từ đá hoa cương; không chọn đồ không làm từ đá. Trò chơi dùng ngay ý chính một và ý chính ba.
> - Nhóm Đá vôi là hai đồ "trông không có chút đá nào" (tường quét vôi, sân xi măng), đúng ý Oak bài sáu. Không dùng "bậc đá xanh ở sân đình" như kế hoạch ở `_topic.md`: chưa chắc đá xanh là đá vôi ([CẦN KIỂM] ở `_topic.md`), và ảnh sân đình dễ có cảnh thờ cúng, chữ Hán Nôm.
> - Hai món bẫy, mỗi món giống một nhóm: bàn gỗ giống mặt bàn bếp, hàng rào tre giống tường làng. Bỏ "rổ tre" và "nón lá" của kế hoạch vì hai món đó không giống nhóm nào, nên không có sức hút.
> - Nhãn món tả đồ vật, không có tên loại đá, để bé phải nhìn hình và nhớ ô Học.
> - Cả kệ là hình vẽ (designer 11/11): Commons không có ảnh hợp lệ, không người, không nhãn hiệu cho tường quét vôi, sân xi măng, bàn gỗ, mặt bàn bếp, hàng rào tre, nên vẽ cả tám món (một kệ một loại hình). Ảnh `laterite` và ảnh bậc thềm của bài một vẫn dùng ở từ vựng, ô Học, câu hỏi.

### tray
id: cb7e00e6-d433-4f71-828c-fa86956ba194
type: build_tray
version: 1
prompt.en: Find one thing made from each rock
prompt.vi: Tìm một đồ vật làm từ mỗi loại đá
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick one thing made from each kind of rock.
messages.start.vi: Em chọn một đồ vật làm từ mỗi loại đá nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Each rock suits its own jobs.
messages.balanced.vi: Tuyệt! Mỗi loại đá hợp với những việc riêng.
messages.has_limited.en: Wood and bamboo come from plants, not rock.
messages.has_limited.vi: Gỗ và tre lấy từ cây, không phải từ đá.
messages.missing.tray_lime_group.en: You still need something made from limestone.
messages.missing.tray_lime_group.vi: Em còn thiếu một đồ vật làm từ đá vôi.
messages.missing.tray_laterite_group.en: You still need something made from laterite.
messages.missing.tray_laterite_group.vi: Em còn thiếu một đồ vật làm từ đá ong.
messages.missing.tray_granite_group.en: You still need something made from granite.
messages.missing.tray_granite_group.vi: Em còn thiếu một đồ vật làm từ đá hoa cương.

#### group tray_lime_group
label.en: Limestone
label.vi: Đá vôi
color: cham
role: required

#### group tray_laterite_group
label.en: Laterite
label.vi: Đá ong
color: do_son
role: required

#### group tray_granite_group
label.en: Granite
label.vi: Đá hoa cương
color: gi_dong
role: required

#### group tray_not_rock
label.en: Not made from rock
label.vi: Không làm từ đá
color: nau_dat
role: limit

#### item tray_white_wall
label.en: Whitewashed wall
label.vi: Tường quét vôi
group: tray_lime_group
image.brief: [hình vẽ] Một bức tường nhà ở làng quê Việt Nam quét vôi trắng, hơi cũ, có vệt mưa, vẽ thẳng gần vừa, thấy một phần mái hiên; không có người, không có chữ, khẩu hiệu hay số nhà. Câu q1 dùng lại hình này.
image.alt.en: A white lime-washed wall
image.alt.vi: Bức tường quét vôi trắng

#### item tray_laterite_wall
label.en: Old village wall
label.vi: Tường nhà làng cổ
group: tray_laterite_group
image.brief: [hình vẽ] Cận cảnh một mảng tường xây bằng những khối đá ong màu nâu đỏ, mặt rỗ nhiều lỗ như tổ ong, vẽ thẳng; không có người, không có chữ. Kệ toàn hình vẽ nên vẽ riêng; ảnh từ `laterite` vẫn là gốc ở từ vựng, câu q5.
image.alt.en: Red-brown stone blocks with holes
image.alt.vi: Những khối đá nâu đỏ có nhiều lỗ
> `alt` không nói tên nhóm (kệ là trò phân loại).

#### item tray_steps
label.en: Front steps
label.vi: Bậc thềm
group: tray_granite_group
image.brief: [hình vẽ] Ba bậc thềm bằng đá hoa cương xám lốm đốm trước cửa một ngôi nhà, vẽ chéo; không có người, không có chữ, không có số nhà. Kệ toàn hình vẽ nên vẽ riêng; ảnh `tray_steps` của bài một vẫn dùng ở ô Học, thẻ q2, từ `suitable`.
image.alt.en: Grey stone front steps
image.alt.vi: Bậc thềm đá xám

#### item tray_wood_table
label.en: Wooden table
label.vi: Bàn gỗ
group: tray_not_rock
image.brief: [hình vẽ] Một chiếc bàn gỗ nâu đơn giản, mặt bàn phẳng, vẽ chéo thấy cả mặt và chân bàn, cùng góc với hình mặt bàn bếp; không có đồ vật có nhãn hiệu trên bàn, không có người, không có chữ. Câu q3 dùng lại hình này.
image.alt.en: A wooden table
image.alt.vi: Chiếc bàn gỗ

#### item tray_cement_yard
label.en: Cement yard
label.vi: Sân xi măng
group: tray_lime_group
image.brief: [hình vẽ] Một khoảng sân láng xi măng màu xám trước một ngôi nhà, vẽ chếch từ trên xuống, thấy rõ mặt sân phẳng; không có người, không có xe, không có chữ. Câu q3 dùng lại hình này (bài mười hai dùng ảnh riêng vì kệ bên đó là ảnh).
image.alt.en: A grey cement yard
image.alt.vi: Sân xi măng xám

#### item tray_laterite_well
label.en: Village well
label.vi: Giếng làng
group: tray_laterite_group
image.brief: [hình vẽ] Một cái giếng cổ ở làng quê miền Bắc, thành giếng và bậc quanh giếng xây bằng những khối đá ong màu nâu đỏ, rỗ lỗ, vẽ chéo từ trên xuống; không có người, không có xô nhựa có nhãn, không có chữ. Câu q1 dùng lại hình này.
image.alt.en: An old well of red-brown blocks
image.alt.vi: Giếng cổ xây bằng những khối đá nâu đỏ
> [CẦN KIỂM] Giếng làng ở Đường Lâm xây bằng đá ong (biên tập nhớ).

#### item tray_worktop
label.en: Kitchen worktop
label.vi: Mặt bàn bếp
group: tray_granite_group
image.brief: [hình vẽ] Một mặt bàn bếp bằng đá hoa cương bóng, có đốm hạt nhiều màu, vẽ chéo gần vừa, trên mặt chỉ có một cái thớt gỗ hay rổ rau; không có người, không có đồ dùng có nhãn hiệu, không có chữ. Câu q1 dùng lại hình này.
image.alt.en: A shiny speckled kitchen worktop
image.alt.vi: Mặt bàn bếp bóng, có đốm

#### item tray_bamboo_fence
label.en: Bamboo fence
label.vi: Hàng rào tre
group: tray_not_rock
image.brief: [hình vẽ] Một đoạn hàng rào tre đan quanh vườn ở làng quê, vẽ ngang gần vừa, cùng cỡ cảnh với hình tường làng; không có người, không có chữ.
image.alt.en: A bamboo fence
image.alt.vi: Hàng rào tre

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Bốn format. Vị trí đáp án đúng: hết hiệu lực 15/11 (SK-047, app xáo lựa chọn).
> Ôn trộn: q4 ôn bài hai, ba, bốn, năm (đá bọt, đá hoa cương, thạch cao, hoạt thạch; thử cào, thử nhỏ nước); q5, q6 ôn bài ba và bài năm (đá phấn mềm, thấm nước).
> Mỗi hình chỉ một vai trong bài (bảng ở Ghi chú cho hoạ sĩ).

### q1
id: 84ea1453-cf10-42d1-9390-ac2fe7eb7c86
format: single_choice
version: 1
dok: 1
prompt.en: Which one is made of laterite?
prompt.vi: Thứ nào làm bằng đá ong?
image.brief: Dùng lại hình `magnifying_glass` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): magnifying glass plain background
image.alt.en: A magnifying glass
image.alt.vi: Chiếc kính lúp
hint.en: Remember the Laterite picture in the lesson.
hint.vi: Em nhớ lại ô Đá ong trong bài học nhé.
explanation_correct.en: Laterite is red-brown and full of little holes.
explanation_correct.vi: Đá ong màu nâu đỏ, có nhiều lỗ nhỏ.
explanation_wrong.en: Many old village wells are built of laterite.
explanation_wrong.vi: Nhiều giếng làng cổ xây bằng đá ong.
> DOK 1: nhận ra đá ong (ô Học thứ hai, phần Chơi). Ba hình đều là món của kệ Chơi, cùng là hình vẽ đồ vật ở nhà và ở làng. Câu phân loại: nhãn và `alt` tả đồ vật, không có tên đá.
> Hình câu hỏi là kính lúp, trung tính: không cho thấy đá ong.

#### option q1_worktop
correct: false
feedback.en: This shiny, spotty worktop is granite.
feedback.vi: Mặt bàn bếp lốm đốm này là đá hoa cương.
label.en: kitchen worktop
label.vi: mặt bàn bếp
image.brief: Dùng lại hình `tray_worktop`.
image.alt.en: A shiny speckled kitchen worktop
image.alt.vi: Mặt bàn bếp bóng, có đốm

#### option q1_white_wall
correct: false
feedback.en: The white paint on this wall comes from limestone.
feedback.vi: Lớp vôi trắng trên tường làm từ đá vôi.
label.en: whitewashed wall
label.vi: tường quét vôi
image.brief: Dùng lại hình `tray_white_wall`.
image.alt.en: A white lime-washed wall
image.alt.vi: Bức tường quét vôi trắng

#### option q1_well
correct: true
label.en: village well
label.vi: giếng làng
image.brief: Dùng lại hình `tray_laterite_well`.
image.alt.en: An old well of red-brown blocks
image.alt.vi: Giếng cổ xây bằng những khối đá nâu đỏ

### q2
id: 831d3d75-ab4e-40f2-ab66-ed9b581008cb
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: [hình vẽ] Một đống bột xi măng màu xám đổ trên nền, một cái bay thợ xây cắm bên cạnh, vẽ gần; không có bao xi măng, không có nhãn hiệu, không có người, không có chữ. Từ `cement` và câu w1 bài bảy dùng lại hình này.
image.alt.en: A pile of grey cement powder
image.alt.vi: Một đống bột xi măng xám
sentence.en: People make cement from crushed {1}.
sentence.vi: Người ta nghiền nhỏ {1} để làm xi măng.
answers: q2_limestone
hint.en: Remember what the Learn pictures said about cement.
hint.vi: Em nhớ lại phần Học nói gì về xi măng nhé.
explanation_correct.en: Cement mixed with sand and water sets hard.
explanation_correct.vi: Xi măng trộn cát và nước sẽ đông cứng lại.
explanation_wrong.en: Limestone is crushed and heated to make cement.
explanation_wrong.vi: Đá vôi được nghiền, nung nóng để làm xi măng.
> DOK 1: nhớ lại câu của ô Đá vôi. Câu không có chữ "lime", "vôi" (gốc từ của đáp án). Ba thẻ là ba loại đá của bài, dùng lại ba hình ô Học, cùng là ảnh cảnh có đá. Gợi ý không gọi tên ô Đá vôi, vì tên ô trùng chữ nhãn đáp án.

#### bank q2_limestone
label.en: limestone
label.vi: đá vôi
image.brief: Dùng lại hình `explore_limestone`. Từ khoá tìm ảnh (EN): limestone karst Trang An Vietnam
image.alt.en: Tall limestone hills
image.alt.vi: Những ngọn núi đá vôi cao

#### bank q2_laterite
label.en: laterite
label.vi: đá ong
feedback.en: Laterite is cut into blocks for walls.
feedback.vi: Đá ong được đẽo thành khối để xây tường.
image.brief: Dùng lại hình `explore_laterite`. Từ khoá tìm ảnh (EN): Duong Lam ancient village laterite house wall
image.alt.en: An old house with red-brown stone walls
image.alt.vi: Ngôi nhà cổ có tường đá màu nâu đỏ

#### bank q2_granite
label.en: granite
label.vi: đá hoa cương
feedback.en: Granite is used whole, for steps and worktops.
feedback.vi: Đá hoa cương dùng làm bậc thềm, mặt bàn.
image.brief: Dùng lại hình `tray_steps` ở bài `da-va-dat/lam-quen-voi-da`. Từ khoá tìm ảnh (EN): granite stone steps entrance
image.alt.en: Stone steps with a handrail
image.alt.vi: Bậc đá có tay vịn
> `alt` theo bảng designer 11/11 (ảnh bậc đá hoa cương ngoài trời có tay vịn); A sửa `alt` gốc ở bài một theo cùng chữ.

### q3
id: 21ca8e03-9c87-45c1-b753-9161803221fc
format: multi_choice
version: 1
dok: 2
prompt.en: Which ones have rock in them?
prompt.vi: Những thứ nào có đá ở bên trong?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: [ảnh] Một đống đá dăm nhỏ màu xám ở bãi vật liệu, chụp gần, đá dăm lấp gần kín khung; không có máy móc, không có người, không có chữ. Từ khoá tìm ảnh (EN): crushed stone gravel pile
image.alt.en: A pile of crushed stone
image.alt.vi: Một đống đá dăm
hint.en: Some rock is crushed into tiny bits. Where does it go?
hint.vi: Có loại đá được nghiền thật nhỏ. Bột đá ấy đi vào đâu?
explanation_correct.en: Concrete also has gravel, small bits of rock, inside.
explanation_correct.vi: Trong bê tông còn có sỏi, là những mẩu đá nhỏ.
explanation_wrong.en: Cement and concrete both have crushed rock inside.
explanation_wrong.vi: Xi măng và bê tông đều có đá nghiền nhỏ bên trong.
> DOK 2: phân loại, áp ý "đồ dùng hằng ngày có đá nghiền nhỏ" (ô Đá vôi, ví dụ ba và bốn) vào khối bê tông, món bé chưa gặp trong bài này. Nối bài một: bê tông "do con người làm ra, không phải đá tự nhiên", nhưng vẫn có đá nghiền nhỏ ở bên trong; hai ý không trái nhau (ghi chú của `bricks_are_rocks`).
> Rà chữ tester 11/11 (n6): giải thích khi đúng nói cả hai vế ("do con người làm ra" và "bên trong có đá nghiền nhỏ"), để chữ trẻ đọc nối được với bài một.
> [CẦN KIỂM] Bê tông trộn từ xi măng, cát, đá dăm và nước; sân xi măng láng bằng vữa xi măng và cát (biên tập nhớ).
> Rà chữ tester 11/11 (N1): lựa chọn sai `q3_fence` (món bẫy của kệ) đổi thành `q3_basket` (rổ nhựa, ảnh mới), để hai lựa chọn sai không còn đúng là hai món bẫy vừa bị loại ở trò chơi. Theo hình designer 11/11, cả bốn là hình vẽ cùng nét: hai món kệ (bàn gỗ, sân xi măng), hai hình vẽ mới (rổ nhựa, khối bê tông; khối bê tông vẽ riêng thay ảnh `tray_concrete` của bài một).
#### option q3_table
correct: false
feedback.en: A wooden table comes from trees.
feedback.vi: Bàn gỗ làm từ cây, không có đá.
label.en: wooden table
label.vi: bàn gỗ
image.brief: Dùng lại hình `tray_wood_table`.
image.alt.en: A wooden table
image.alt.vi: Chiếc bàn gỗ

#### option q3_basket
correct: false
feedback.en: This basket is made of plastic, with no rock.
feedback.vi: Rổ nhựa làm bằng nhựa, không có đá.
label.en: plastic basket
label.vi: rổ nhựa
image.brief: [hình vẽ] Một chiếc rổ nhựa màu xanh lá có lỗ đan, đặt trên nền trơn, vẽ chéo, cùng nét và cùng cỡ với hình bàn gỗ của kệ; không có nhãn hiệu, không có thức ăn trong rổ, không có người, không có chữ.
image.alt.en: A plastic basket
image.alt.vi: Chiếc rổ nhựa

#### option q3_cement
correct: true
label.en: cement yard
label.vi: sân xi măng
image.brief: Dùng lại hình `tray_cement_yard`.
image.alt.en: A grey cement yard
image.alt.vi: Sân xi măng xám

#### option q3_concrete
correct: true
label.en: concrete block
label.vi: khối bê tông
image.brief: [hình vẽ] Một khối bê tông xám đúc vuông vức, mặt hơi sần, đặt trên nền trơn, vẽ chéo, cùng nét với ba hình kia của câu (hình kệ Chơi); không có chữ, không có nhãn. Vẽ riêng thay vì dùng ảnh `tray_concrete` của bài một, để câu chỉ một loại hình (designer 11/11).
image.alt.en: A grey concrete block
image.alt.vi: Khối bê tông màu xám

### q4
id: 5f97360f-9033-4a23-bf49-a5dcbd7ac483
format: single_choice
version: 1
dok: 2
prompt.en: Which rock suits a step by the well?
prompt.vi: Đá nào hợp làm bậc thềm cạnh giếng?
image.brief: [hình vẽ] Một chiếc gàu nhôm múc đầy nước, nước tràn qua mép gàu, vẽ gần trên nền trơn; không thấy giếng, bậc hay đá, không có người, không có nhãn hiệu, không có chữ.
image.alt.en: A bucket full of water
image.alt.vi: Gàu đầy nước
hint.en: Remember the scratch test and the water test.
hint.vi: Em nhớ lại trò thử cào và trò thử nhỏ nước nhé.
explanation_correct.en: Granite steps stay strong even when wet every day.
explanation_correct.vi: Bậc đá hoa cương vẫn bền dù ướt mỗi ngày.
explanation_wrong.en: Granite is hard and keeps water out.
explanation_wrong.vi: Đá hoa cương cứng và không thấm nước.
> A2 (SK-043, 14/11): câu hỏi cũ hai mươi mốt chữ, nay tám chữ. Ý "ngày nào cũng ướt và bị cọ rửa" chuyển vào hình câu hỏi (gàu nước) và gợi ý (thử cào, thử nhỏ nước).
> DOK 2: ghép hai tính chất (bài ba: cứng; bài năm: không thấm nước) để chọn đá cho một việc. Bốn lựa chọn.
> Rà chữ tester 11/11 (n4): đổi việc từ "mặt bàn bếp" (ví dụ hai của ô Đá hoa cương và món kệ `tray_worktop`, bé chỉ cần nhớ lại) sang "bậc đá cạnh giếng", một việc chưa nêu trong bài, để câu là vận dụng thật. Hình câu hỏi đổi theo (gàu nước, không thấy đá); key không đổi.
> Câu hỏi nói "Which one" · "Thứ nào", không nói "Which rock", vì hoạt thạch và thạch cao là khoáng vật (bài bốn).
> Không dùng đá cẩm thạch hay đá phiến làm lựa chọn sai: ngoài đời người ta cũng lát bậc, lát nền bằng hai loại đá này, nên câu sẽ có hai đáp án. Không dùng sa thạch: sa thạch là đáp án đúng của câu w1 hôm nay (một hình không giữ hai vai trái nhau). Ba lựa chọn sai đều mềm hoặc có lỗ, rõ là không hợp khi đã học bài ba, bài năm.
> Bốn hình là ảnh mẫu đá của Bộ mẫu đá (cùng nền); `alt` chỉ tả màu và hình dáng.

#### option q4_talc
correct: false
feedback.en: Talc is so soft that scrubbing wears it away.
feedback.vi: Hoạt thạch rất mềm, cọ rửa sẽ mòn ngay.
label.en: talc
label.vi: hoạt thạch
image.brief: Dùng lại hình `tray_talc` ở bài `da-va-dat/thang-do-cung-mohs`. Từ khoá tìm ảnh (EN): talc mineral sample
image.alt.en: A pale cream piece
image.alt.vi: Mẩu màu trắng ngà
> `alt` chép đúng gốc bài bốn sau khi A sửa theo tester N5 (khuôn chung "A <màu> piece" · "Mẩu <màu>").

#### option q4_granite
correct: true
label.en: granite
label.vi: đá hoa cương
image.brief: Dùng lại hình `granite` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): granite rock sample
image.alt.en: A grey rock
image.alt.vi: Hòn đá màu xám

#### option q4_pumice
correct: false
feedback.en: Pumice is full of holes and breaks easily.
feedback.vi: Đá bọt nhiều lỗ, nhẹ và dễ vỡ.
label.en: pumice
label.vi: đá bọt
image.brief: Dùng lại hình `pumice` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): pumice rock sample
image.alt.en: A pale grey rock
image.alt.vi: Hòn đá màu xám nhạt

#### option q4_gypsum
correct: false
feedback.en: A fingernail can scratch gypsum, so it wears away.
feedback.vi: Thạch cao mềm, móng tay còn cào xước được.
label.en: gypsum
label.vi: thạch cao
image.brief: Dùng lại hình `tray_gypsum` ở bài `da-va-dat/thang-do-cung-mohs`. Từ khoá tìm ảnh (EN): selenite gypsum crystal sample
image.alt.en: A clear piece
image.alt.vi: Mẩu trong suốt
> Rà chữ tester 11/11 (N2, N5, N6): brief trỏ hình gốc thạch cao tinh thể ở bài bốn (A đã chuyển gốc từ bài ba về bài bốn); `alt` chép đúng gốc mới (trước đây tả sai thành đá trắng đục).

### q5
id: e006f2cc-92e5-4b22-a3c6-2e87108ba5ce
format: single_choice
version: 1
dok: 2
prompt.en: Which rock is best for cutting wall blocks by hand?
prompt.vi: Đá nào hợp nhất để tự đẽo khối xây tường?
image.brief: [hình vẽ] Một mảnh vườn nhỏ ở làng quê có mấy luống rau xanh, phía sau là bãi đất trống chưa có tường rào, vẽ ngang; không có người, không có tường, không có đá, không có chữ.
image.alt.en: A small garden with no wall
image.alt.vi: Mảnh vườn nhỏ chưa có tường rào
hint.en: Easy to cut is good. But what about rain later?
hint.vi: Dễ đẽo là tốt. Nhưng sau này gặp mưa thì sao?
explanation_correct.en: Fresh laterite cuts easily, then hardens in the open air.
explanation_correct.vi: Đá ong mới đào dễ đẽo, để ngoài trời sẽ cứng dần.
explanation_wrong.en: Laterite is easy to cut, then slowly hardens.
explanation_wrong.vi: Đá ong dễ đẽo, rồi cứng dần.
> A2 (SK-043, 14/11): câu hỏi cũ hai mươi chữ (có nhà Nam), nay mười chữ.
> DOK 2: tình huống mới, bé phải xét hai điều cùng lúc: dễ đẽo (đá phấn được, đá ba-dan không) và bền với mưa (đá phấn không, đá ong được). Thay câu gợi ý ở `_topic.md` ("vì sao không lát sân bằng đá phấn"): câu đó cần ba lựa chọn là ba lý do, khó có hình; và câu q6 cũng hỏi về đá phấn, hai câu sẽ cùng một ý.
> Gợi ý chỉ cách nghĩ (hai điều kiện), không gọi tên đá.
> [CẦN KIỂM] Đá phấn mềm, thấm nước, để ngoài mưa nắng thì mau mòn và vỡ; đá ba-dan rất cứng, khó đẽo bằng tay; đá ong đẽo được khi còn mềm rồi cứng dần (biên tập nhớ). Ở vài nơi người ta có xây nhà bằng đá phấn, nhưng chữ cho trẻ chỉ so ba loại đá trong câu.

#### option q5_chalk
correct: false
feedback.en: Chalk soaks up rain and slowly wears away.
feedback.vi: Đá phấn thấm nước mưa, lâu ngày sẽ mòn.
label.en: chalk
label.vi: đá phấn
image.brief: Dùng lại hình `chalk` ở bài `da-va-dat/da-nao-cung-hon`. Từ khoá tìm ảnh (EN): chalk rock sample
image.alt.en: A white rock
image.alt.vi: Hòn đá màu trắng

#### option q5_laterite
correct: true
label.en: laterite
label.vi: đá ong
image.brief: Dùng lại hình `laterite`. Từ khoá tìm ảnh (EN): laterite wall blocks close up
image.alt.en: Red-brown stone with many holes
image.alt.vi: Mặt đá nâu đỏ có nhiều lỗ
> `alt` sửa so với gốc (gốc nói "laterite"): câu hỏi về tính chất, `alt` chỉ tả màu và hình dáng. Rà chữ tester 11/11 (n9): ảnh là cận cảnh mặt tường đá, không phải một hòn đá cầm tay, nên `alt` nói "mặt đá", không nói "hòn đá". Designer cắt sát mặt đá như brief gốc dặn.

#### option q5_basalt
correct: false
feedback.en: Basalt is very hard to cut by hand.
feedback.vi: Đá ba-dan rất cứng, khó đẽo bằng tay.
label.en: basalt
label.vi: đá ba-dan
image.brief: Dùng lại hình `tray_dark_rock` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): basalt vesicular rock sample
image.alt.en: A dark rock with tiny holes
image.alt.vi: Hòn đá sẫm màu có lỗ nhỏ

### q6
id: 9f324850-965a-4e75-b16c-0c7428299de9
format: true_false
version: 1
dok: 3
misconception: any_rock_for_any_job
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: Chalk is a rock, so it makes a good roof.
statement.vi: Đá phấn là đá, nên dùng lợp mái rất hợp.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: false
image.brief: [hình vẽ] Một căn nhà nhỏ một tầng ở làng quê, tường đã xây xong nhưng chưa có mái, thấy rõ khung kèo gỗ trên đầu tường, trời hơi có mây; không có tấm lợp, ngói hay đá phiến nào, không có người, không có chữ.
image.alt.en: A small house with no roof yet
image.alt.vi: Căn nhà nhỏ chưa có mái
hint.en: Think about chalk in lessons three and five.
hint.vi: Em nhớ lại đá phấn khi thử cào và thử nhỏ nước nhé.
explanation_correct.en: A roof needs rock that keeps rain out, like slate.
explanation_correct.vi: Mái nhà cần đá không thấm nước, như đá phiến.
explanation_wrong.en: Chalk is soft and soaks up rain.
explanation_wrong.vi: Đá phấn mềm và thấm nước mưa.
feedback_true.en: Chalk soaks up water and scratches easily.
feedback_true.vi: Đá phấn thấm nước và dễ bị cào xước.
> DOK 3: bắt lỗi một lập luận ("là đá thì làm việc gì cũng hợp"). Bé phải ghép tính chất của bài ba (đá phấn mềm) và bài năm (đá phấn thấm nước) vào một việc mới (lợp mái). Lời Na đúng bảng "Câu sáu, lời Na" ở `_topic.md`; đáp án Sai theo bảng Đúng/Sai.
> Giải thích khi đúng không mở đầu bằng "Yes!". Hình câu hỏi là căn nhà chưa có mái, không có mái đá phiến, để hình không gợi đáp án.
> [CẦN KIỂM] Như ghi chú của `all_rocks_are_hard` và `rocks_never_soak_water`: đá phấn mềm, thấm nước.

## Từ vựng

### suitable
id: 13bb30d9-357d-42e4-bf4f-0b0818461054
tier: core
term.en: suitable
term.vi: phù hợp
example.en: Granite is suitable for front steps.
example.vi: Đá hoa cương phù hợp để làm bậc thềm.
image.brief: Dùng lại hình `tray_steps` ở bài `da-va-dat/lam-quen-voi-da`. Từ khoá tìm ảnh (EN): granite stone steps entrance
image.alt.en: Stone steps with a handrail
image.alt.vi: Bậc đá có tay vịn
> `alt` theo bảng designer 11/11 (ảnh bậc đá hoa cương ngoài trời có tay vịn); A sửa `alt` gốc ở bài một theo cùng chữ.

### limestone
id: bdb44883-2c35-497a-8feb-e9744513a1e1
tier: core
term.en: limestone
term.vi: đá vôi
example.en: Ha Long Bay has many limestone islands.
example.vi: Vịnh Hạ Long có nhiều đảo đá vôi.
image.brief: Dùng lại hình `tray_limestone` ở bài `da-va-dat/da-nao-cung-hon`. Từ khoá tìm ảnh (EN): limestone rock sample
image.alt.en: A pale grey rock
image.alt.vi: Hòn đá màu xám nhạt
> [CẦN KIỂM] Các đảo ở vịnh Hạ Long phần lớn là đá vôi (biên tập nhớ). Ảnh mẫu đá vôi theo bảng Hình dùng chung (`tray_limestone` bài ba).

### laterite
id: d78c2551-7a7b-44a5-8534-019ebcce4f03
tier: core
term.en: laterite
term.vi: đá ong
example.en: Old walls in Duong Lam are made of laterite.
example.vi: Tường cổ ở làng Đường Lâm làm bằng đá ong.
image.brief: [ảnh] Cận cảnh một mảng tường đá ong ở làng cổ Đường Lâm: hai ba khối đá ong màu nâu đỏ xếp chồng, mặt rỗ nhiều lỗ như tổ ong, cắt sát chỉ thấy mặt đá, không thấy mái, cây hay trời, để ảnh đứng được cạnh ảnh mẫu đá ở câu q5 hôm nay và câu w1 bài bảy; không có người, không có chữ. Hình gốc của bảng Hình dùng chung. Từ khoá tìm ảnh (EN): laterite wall blocks close up
image.alt.en: A wall of laterite blocks
image.alt.vi: Bức tường xây bằng đá ong

### cement
id: d2503863-0455-4433-ac16-ac55447be6fc
tier: extra
term.en: cement
term.vi: xi măng
example.en: Builders mix cement, sand and water.
example.vi: Thợ xây trộn xi măng, cát và nước.
image.brief: Dùng lại hình `q2`.
image.alt.en: A pile of grey cement powder
image.alt.vi: Một đống bột xi măng xám

## Thưởng

### duong_lam_card
id: 6c249c43-9b0a-4f10-a4b2-c26cdfde5aaf
set: rocks
rarity: common
name.en: Duong Lam village
name.vi: Làng cổ Đường Lâm
tag.en: Laterite village
tag.vi: Làng đá ong
fact.en: Duong Lam has old laterite houses, walls and gates. Some are hundreds of years old.
fact.vi: Làng cổ Đường Lâm có nhiều nhà, tường và cổng làng xây bằng đá ong. Có ngôi nhà đã hàng trăm năm tuổi.
> [CẦN KIỂM] Nhà, tường, cổng ở làng cổ Đường Lâm xây bằng đá ong; có nhà cổ hàng trăm năm tuổi (biên tập nhớ, như bảng Bộ thẻ ở `_topic.md`).
image.brief: [ảnh] Cổng làng cổ ở Đường Lâm (cổng làng Mông Phụ) xây bằng đá ong và gạch, mái ngói, cây đa bên cạnh, chụp chính diện; không có người, không có biển hiệu; cắt bỏ mọi chữ Hán Nôm, câu đối, bảng tên trên cổng. Không có ảnh hợp lệ thì lấy một con ngõ nhỏ hai bên là tường đá ong ở Đường Lâm. Từ khoá tìm ảnh (EN): Duong Lam village gate Mong Phu
image.alt.en: The old gate of Duong Lam village
image.alt.vi: Cổng làng cổ Đường Lâm
> [CẦN KIỂM] Cổng làng Mông Phụ có xây bằng đá ong không.

## Ghi chú cho hoạ sĩ

- **Loại hình** (theo file chọn ảnh designer 11/11): ô Học, câu w1, w2, w3, q2 (thẻ), q4 (lựa chọn), q5 (lựa chọn), từ vựng, thẻ thưởng là ảnh; cả kệ Chơi (tám món), câu q1, q3 (lựa chọn) và hình câu q2, q4, q5, q6 là hình vẽ. Hình không có chữ.
- **Ảnh nguồn (sáu):** núi đá vôi Tràng An (`explore_limestone`), nhà tường đá ong Đường Lâm (`explore_laterite`, cũng là nguồn của cận cảnh `laterite`), cổng Đông thành nhà Hồ (`explore_long_ago`), đống đá dăm (hình câu q3), cận cảnh tường đá ong (`laterite`), cổng làng Mông Phụ (thẻ).
- **Hình tự vẽ (mười bốn):** tám món kệ Chơi; hình câu q2 (bột xi măng), q4 (gàu nước), q5 (mảnh vườn), q6 (nhà chưa có mái); lựa chọn `q3_basket`, `q3_concrete`.
- **Dùng lại trong bài:** `laterite` (lựa chọn q5_laterite); `explore_limestone`, `explore_laterite` (thẻ q2); `tray_white_wall`, `tray_laterite_well`, `tray_worktop` (q1); `tray_wood_table`, `tray_cement_yard` (q3); hình câu q2 (từ `cement`).
- **Dùng lại từ bài khác:**
  - chủ đề này (người soạn A): `marble`, `chalk`, `tray_limestone` (bài ba); `tray_slate`, `tray_sandstone`, `granite`, `pumice`, `magnifying_glass` (bài hai); `tray_talc`, `tray_gypsum` (bài bốn); `quarry`, `tray_brick`, `tray_steps` (bài một). `alt` của `marble`, `tray_brick`, `tray_steps` ở bài này đã theo bảng designer 11/11; A sửa `alt` gốc theo cùng chữ.
  - chủ đề khác: cốc nước `q4` (*Đất và nước trên Trái Đất*), `ha_long` (cùng bài đó), hòn cuội `w1_stone` (*Vì sao ta phải thở*), đá ba-dan `tray_dark_rock` (*Núi lửa*).
- **Một hình một vai trong bài:** đá phấn là hình câu w2 và lựa chọn sai q5 (không trái nhau); sa thạch chỉ ở w1 (đáp án); đá hoa cương mẫu chỉ ở q4 (đáp án); ảnh bậc thềm đá hoa cương là thẻ sai q2, ô Học và từ `suitable` (không có ở câu nào làm đáp án).
- **Cùng kiểu trong một câu:** w1, q4, q5 là ảnh mẫu đá (q5 có ảnh cận cảnh tường đá ong cắt sát); q1 là hình vẽ đồ vật của kệ Chơi; q3 là bốn hình vẽ đồ vật; thẻ q2 là ba ảnh cảnh.
- **Màu:** Học: đá vôi `cham`, đá ong `do_son`, đá hoa cương `gi_dong`, từ xa xưa `vang_hoe`. Chơi: đá vôi `cham`, đá ong `do_son`, đá hoa cương `gi_dong`, nhóm `limit` `nau_dat`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required` (mỗi nhóm hai món), một nhóm `limit` (hai món), tám món.
  - Khởi động: `single_choice` (w1 ôn bài năm, w3 ôn bài một), `true_false` (w2 ôn bài ba, Đúng).
  - Quiz: `single_choice` (q1, q4 bốn lựa chọn, q5), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6, `speaker: na`, Sai). Bốn format.
  - DOK q1 tới q6: 1, 1, 2, 2, 2, 3. Câu có `misconception`: q6, key `any_rock_for_any_job`.
- **Vị trí đáp án đúng:** hết hiệu lực 15/11 (SK-047, app xáo lựa chọn và kho thẻ từ).
- **Tham chiếu:** `recall_from.lesson` trỏ `da-va-dat/da-nao-tham-nuoc` (w1), `da-va-dat/da-nao-cung-hon` (w2), `da-va-dat/lam-quen-voi-da` (w3). Ba bài này phải có id trước bài này (thứ tự `ids` ở `_topic.md`).
- **Màn Chơi, ví dụ để kiểm:**
  - chạm Tường quét vôi, Giếng làng, Mặt bàn bếp → đạt;
  - chạm Bàn gỗ → `has_limited`;
  - chạm Sân xi măng, Tường quét vôi, Bậc thềm (thiếu đá ong) → `missing.tray_laterite_group`; chạm Tường nhà làng cổ → `full`; bỏ Sân xi măng, đặt Tường nhà làng cổ → đạt.
- **Dòng điều kiện màn Chơi:** "Cần đủ Đá vôi, Đá ong, Đá hoa cương · Không làm từ đá".
- **Số từ EN trên một màn:**
  - Học khoảng ba mươi mốt từ: mục tiêu 9, hướng dẫn 3, bốn nhãn 5, câu dài nhất 9, ô Từ mới 5.
  - Quiz nhiều nhất là q4 (khoảng hai mươi tám: câu hỏi 15, bốn nhãn 4, gợi ý 8) và q3 (khoảng hai mươi lăm). q6 cả màn 17.
  - Chơi khoảng năm mươi lăm từ (tám tên món, bốn chip, lời nhắn dài nhất, lệnh), như các chủ đề trước.
- **Từ EN có thể ngoài Starters/Movers:** suitable, limestone, laterite, granite, cement, concrete, lime, whitewashed, worktop, crushed, heated, honeycomb, pillars, pagodas, mortar, permeable (ôn), talc, gypsum, pumice, basalt, quarry, scrubbed, well, plastic basket.
- **Giọng đọc:** nghe thử EN "laterite", "Duong Lam", "Ha Long Bay", "whitewashed"; VI "đá ba-dan", "hoạt thạch".
- **Bộ thẻ:** `set: rocks` cần khoá `collectible.set.rocks` (ios-dev, đã ghi ở SK-039).
