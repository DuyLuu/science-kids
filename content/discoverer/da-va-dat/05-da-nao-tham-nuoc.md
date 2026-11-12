---
id: 9f99a248-732c-41e2-bdb7-0dd41a16b707
topic: da-va-dat
slug: da-nao-tham-nuoc
order: 5
stage: core
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Physical properties of rocks: permeability
vi: Đá nào thấm nước?
> Giữ đúng tên ở `content/syllabus.json` (`rocks-and-soils`, bài số năm). Tiêu đề EN giữ theo Oak (main session chốt 11/11); chữ "permeability" chỉ có ở tiêu đề, trong bài không dùng (bảng Tên gọi). [Nghe thử] EN có dấu hai chấm.

## Mục tiêu
en: I can sort rocks into permeable and impermeable.
vi: Em xếp được đá vào nhóm thấm nước và không thấm nước.
> Trạng thái: **nháp do AI soạn (content-editor, người soạn A), chưa duyệt.** Ticket SK-039 bước 2, ngày 11/11/2026. Chưa chạy `ids`, `validate`; mọi dòng `id:` để trống.
> Theo Oak lesson 5 `physical-properties-of-rocks-permeability`: đá thấm nước (sa thạch, đá phấn) cho nước đi qua; đá không thấm nước (đá cẩm thạch, đá phiến) thì không; nhỏ nước lên đá để thử; với đá thấm nước, bọt khí cứ nổi lên, còn vài bọt lúc đầu rồi thôi chỉ là không khí bám ngoài mặt đá. Sửa `rocks_never_soak_water` ở ý chính hai và ba, phần Chơi và câu q6 (gắn key, Na chưa đúng).
> Lệch Oak: misconception của Oak (nhầm "permeable" với "permanent") là lỗi tiếng Anh, thay bằng `rocks_never_soak_water`; cả bài không có chữ "permanent". Hoạt động thật thành hình vẽ (bộ "Bàn tay thử đá") và thí nghiệm ở nhà. Quiz của Oak (sửa mái dột bằng đá phiến) không dùng; không hỏi đá nào hợp lợp mái (bài sáu).

## Ý chính
1.en: Drop water on a rock and watch closely.
1.vi: Em nhỏ nước lên hòn đá rồi quan sát thật kỹ.
2.en: A permeable rock lets water soak in.
2.vi: Đá thấm nước cho nước thấm vào bên trong.
3.en: An impermeable rock keeps water out.
3.vi: Đá không thấm nước không cho nước đi vào.
> Giữ nguyên chữ của `_topic.md`. Đi từ cụ thể (cách thử) tới trừu tượng (hai nhóm đá theo một tính chất).
> [CẦN KIỂM] Sa thạch, đá phấn có rất nhiều khe rỗng nhỏ nối với nhau nên nước đi vào được; đá cẩm thạch, đá phiến, đá hoa cương gần như không thấm (ghi chú `rocks_never_soak_water` ở `_topic.md`).

## Khởi động

> Hai câu, đúng bảng Khởi động ở `_topic.md`:
> - w1 ôn bài bốn (một ngày trước): thứ nào cứng nhất (thạch cao · kim cương · thạch anh), đáp án thứ hai. Bài bốn dạy ở ô "Mohs' scale" (kim cương cứng nhất).
> - w2 ôn bài hai (ba ngày trước): "Some rocks have grains you can see." (Đúng). Bài hai dạy ở ô "Grains". Câu nối sang bài này: hạt cát trong sa thạch, giữa các hạt có chỗ cho nước thấm vào.

### w1
id: 8b1bb3d0-bcf2-42af-a635-7d8a9b17cbeb
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/thang-do-cung-mohs
prompt.en: Which one is the hardest of the three?
prompt.vi: Thứ nào cứng nhất trong ba thứ này?
image.brief: Dùng lại hình `geologist` ở bài `da-va-dat/thang-do-cung-mohs`. Từ khoá tìm ảnh (EN): geologist field work back view rock outcrop
image.alt.en: A geologist looking at rocks
image.alt.vi: Nhà địa chất đang xem đá
hint.en: Remember the Mohs' scale picture in lesson four.
hint.vi: Em nhớ lại ô Thang Mohs ở bài bốn nhé.
explanation_correct.en: Yes! Diamond is at the top of Mohs' scale.
explanation_correct.vi: Đúng rồi! Kim cương ở bậc cao nhất của thang Mohs.
explanation_wrong.en: The answer is diamond. It is the hardest.
explanation_wrong.vi: Đáp án là kim cương. Kim cương cứng nhất.
> Câu hỏi khác chữ câu q1 bài bốn ("Which mineral is the hardest?"), lựa chọn sai cũng khác (thạch cao, thạch anh thay cho hồng ngọc, thạch anh). Thạch anh trong, trông rất cứng, nên có sức hút. Ba ảnh khoáng vật cùng nền kem; `alt` chỉ tả màu. Chuỗi VI có "Mohs" (cần `READINGS`).
> Rà chữ tester 11/11 (N5, N6): ảnh thạch cao nay trỏ về gốc ở bài bốn; ba `alt` chép khuôn mới của bài bốn ("A <màu> piece" · "Mẩu <màu>").

#### option w1_gypsum
correct: false
label.en: gypsum
label.vi: thạch cao
image.brief: Dùng lại hình `tray_gypsum` ở bài `da-va-dat/thang-do-cung-mohs`. Từ khoá tìm ảnh (EN): selenite gypsum crystal sample
image.alt.en: A clear piece
image.alt.vi: Mẩu trong suốt

#### option w1_diamond
correct: true
label.en: diamond
label.vi: kim cương
image.brief: Dùng lại hình `diamond` ở bài `da-va-dat/thang-do-cung-mohs`. Từ khoá tìm ảnh (EN): rough diamond crystal
image.alt.en: A small clear piece
image.alt.vi: Mẩu nhỏ trong suốt

#### option w1_quartz
correct: false
label.en: quartz
label.vi: thạch anh
image.brief: Dùng lại hình `quartz` ở bài `da-va-dat/thang-do-cung-mohs`. Từ khoá tìm ảnh (EN): white quartz crystal
image.alt.en: A white piece
image.alt.vi: Mẩu màu trắng

### w2
id: 855a9c9f-8c7c-4b33-a5ab-a3d245835caa
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/nhin-ky-cac-loai-da
prompt.en: Some rocks have grains you can see.
prompt.vi: Có loại đá có hạt nhìn thấy được.
image.brief: Dùng lại hình `magnifying_glass` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): magnifying glass plain background
image.alt.en: A magnifying glass
image.alt.vi: Chiếc kính lúp
answer: true
hint.en: Remember the Grains picture in lesson two.
hint.vi: Em nhớ lại ô Hạt ở bài hai nhé.
explanation_correct.en: Yes! Granite has grains you can see.
explanation_correct.vi: Đúng rồi! Đá hoa cương có những hạt nhìn thấy được.
explanation_wrong.en: This is true. Granite has grains you can see.
explanation_wrong.vi: Câu này đúng. Đá hoa cương có hạt nhìn thấy được.
> Chữ EN đúng bảng Khởi động và bảng Đáp án Đúng/Sai (đáp án Đúng); khớp nguyên văn câu của ô "Grains" bài hai ("Some rocks have grains you can see, like granite."). Hình câu hỏi là kính lúp, không cho thấy đá có hạt.

## Học

> Bốn ô, theo kế hoạch bài năm ở `_topic.md`: thử nhỏ nước (ý chính một), thấm nước (ý chính hai), bọt khí (ý chính hai, dấu hiệu thứ hai), không thấm nước (ý chính ba).
> Cả bốn ô là hình tự vẽ của bộ "Bàn tay thử đá" (gốc ở bài ba, `explore_scratch`): cùng nét, cùng cỡ tay, nền kem trơn, không viền đen, không vẽ nét mặt. Hòn đá trong hình vẽ theo màu của ảnh Bộ mẫu đá (sa thạch vàng nâu có vân, đá phấn trắng, đá cẩm thạch trắng vân xám, đá phiến xám sẫm, đá hoa cương xám lốm đốm), để bé nhận ra.

### explore
id: bc8209ff-230b-43d3-87f7-7dc18cb1a567
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_water
label.en: Water test
label.vi: Thử nhỏ nước
color: gi_dong
sentence.en: Drop water on a rock and watch closely.
sentence.vi: Em nhỏ nước lên hòn đá rồi quan sát thật kỹ.
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": bàn tay một bạn nhỏ cầm ống nhỏ giọt bằng nhựa trong, một giọt nước đang rơi xuống một hòn đá xám nhạt đặt trên khay nhựa; vẽ cận, nhìn chéo; nền kem trơn; chỉ thấy bàn tay, không vẽ nét mặt; không có chữ, không có vạch số trên ống. Câu q2 dùng lại hình này (hình câu hỏi).
image.alt.en: A dropper over a rock
image.alt.vi: Ống nhỏ giọt phía trên hòn đá
examples.1.en: use a dropper
examples.1.vi: dùng ống nhỏ giọt
examples.2.en: drop clean water on the rock
examples.2.vi: nhỏ nước sạch lên hòn đá
examples.3.en: wait a little while
examples.3.vi: chờ một lúc
examples.4.en: look closely at the drop
examples.4.vi: nhìn thật kỹ giọt nước

#### group explore_permeable
label.en: Permeable
label.vi: Thấm nước
color: cham
sentence.en: A permeable rock lets water soak in.
sentence.vi: Đá thấm nước cho nước thấm vào bên trong.
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": một hòn sa thạch màu vàng nâu có vân sọc, trên mặt có một vết ướt sẫm màu loang rộng ở chỗ giọt nước vừa rơi, không còn giọt nước đọng; ống nhỏ giọt ở phía trên; nền kem trơn; không có chữ. Từ `permeable` và câu q2 (thẻ đúng) dùng lại hình này.
image.alt.en: Water soaking into a rock
image.alt.vi: Nước thấm vào hòn đá
examples.1.en: sandstone
examples.1.vi: sa thạch
examples.2.en: chalk
examples.2.vi: đá phấn
examples.3.en: the drop disappears
examples.3.vi: giọt nước biến mất
examples.4.en: a wet patch spreads
examples.4.vi: vết ướt loang rộng
> Ô dạy đúng ý mà bài sáu câu w1 (đá nào cho nước thấm vào: sa thạch) và bài mười bốn câu w2 ("Some rocks let water soak in.") ôn lại.
> [CẦN KIỂM] Vết ướt loang rộng là dấu hiệu nước thấm vào đá, khác với giọt nước đọng tròn trên đá không thấm (`_topic.md` mục Còn chưa chắc). Nếu chuyên môn không đồng ý thì ví dụ bốn và nhóm thứ ba của phần Chơi đổi sang dấu hiệu khác.

#### group explore_bubbles
label.en: Bubbles
label.vi: Bọt khí
color: vang_hoe
sentence.en: Put a permeable rock in water. Bubbles keep rising.
sentence.vi: Thả đá thấm nước vào cốc nước. Bọt khí cứ nổi lên mãi.
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": một cốc nhựa trong đựng nước, dưới đáy là hòn sa thạch vàng nâu, một chuỗi dài bọt khí nhỏ nổi lên từ hòn đá tới mặt nước; vẽ ngang tầm cốc; nền kem trơn; không có tay, không có chữ, không có vạch số trên cốc. Từ `bubble` dùng lại hình này.
image.alt.en: Bubbles rising from a rock in water
image.alt.vi: Bọt khí nổi lên từ hòn đá trong nước
examples.1.en: bubbles rise for a long time
examples.1.vi: bọt khí nổi lên rất lâu
examples.2.en: water pushes the air out of the rock
examples.2.vi: nước đẩy không khí trong đá ra ngoài
examples.3.en: a few bubbles that stop are just outside air
examples.3.vi: vài bọt khí rồi thôi chỉ là không khí bám ngoài mặt đá
> Ví dụ ba theo ghi chú của Oak (vài bọt lúc đầu rồi thôi là không khí bám ngoài mặt đá); câu q5 và món bẫy `tray_granite_bubbles` dùng ý này.
> [CẦN KIỂM] Nước thấm vào các khe rỗng của đá, đẩy không khí trong đó ra thành bọt (biên tập nhớ). An toàn: cốc nhựa, không dùng cốc thuỷ tinh.

#### group explore_impermeable
label.en: Impermeable
label.vi: Không thấm nước
color: do_son
sentence.en: An impermeable rock keeps water out.
sentence.vi: Đá không thấm nước không cho nước đi vào.
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": một hòn đá cẩm thạch trắng có vân xám, trên mặt có một giọt nước tròn căng đọng lại, mặt đá quanh giọt vẫn khô; ống nhỏ giọt ở phía trên; nền kem trơn; không có chữ. Từ `impermeable` và câu q2 (thẻ sai) dùng lại hình này.
image.alt.en: A drop sitting on a rock
image.alt.vi: Giọt nước đọng trên mặt đá
examples.1.en: marble
examples.1.vi: đá cẩm thạch
examples.2.en: slate
examples.2.vi: đá phiến
examples.3.en: the drop stays round on top
examples.3.vi: giọt nước đọng tròn trên mặt
examples.4.en: water runs off
examples.4.vi: nước trượt đi

### new_words
id: e718d110-cd6a-45ef-b021-a712492e7cce
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: permeable, impermeable, sandstone

## Chơi

> Bé chọn ba dấu hiệu cho thấy nước đang thấm vào đá: giọt nước biến mất, bọt khí cứ nổi lên, vết ướt loang rộng. Không được chọn cảnh nước không thấm vào.
> - Ba món bẫy theo `_topic.md`, mỗi món giống một nhóm: giọt nước đọng tròn trên đá cẩm thạch (giống nhóm giọt nước), nước trượt khỏi đá phiến (cũng là nước chảy trên mặt đá, giống nhóm vết ướt), chỉ hai bọt khí bám trên đá hoa cương (giống nhóm bọt khí).
> - Nhãn món cùng một dạng câu: việc xảy ra, rồi tên đá ("Drop disappears on sandstone" · "Giọt nước biến mất trên sa thạch").
> - Cả kệ là hình tự vẽ của bộ "Bàn tay thử đá" (`_topic.md`: bài năm kệ toàn hình vẽ), vì cảnh nước thấm vào đá khó chụp cùng một kiểu.

### tray
id: 1b97713b-9d1f-4cf7-81c4-70e73c521094
type: build_tray
version: 1
prompt.en: Find three signs that water soaks in
prompt.vi: Tìm ba dấu hiệu nước thấm vào đá
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find a drop, bubbles and a wet patch.
messages.start.vi: Em tìm giọt nước, bọt khí và vết ướt nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Water soaks into these rocks.
messages.balanced.vi: Tuyệt! Nước thấm được vào những hòn đá này.
messages.has_limited.en: That rock keeps water out. It is impermeable.
messages.has_limited.vi: Hòn đá đó không cho nước vào. Đó là đá không thấm nước.
messages.missing.tray_drop.en: You still need a drop that disappears.
messages.missing.tray_drop.vi: Em còn thiếu một giọt nước biến mất.
messages.missing.tray_bubbles.en: You still need bubbles that keep rising.
messages.missing.tray_bubbles.vi: Em còn thiếu bọt khí nổi lên mãi.
messages.missing.tray_wet.en: You still need a wet patch that spreads.
messages.missing.tray_wet.vi: Em còn thiếu một vết ướt loang rộng.

#### group tray_drop
label.en: Drop disappears
label.vi: Giọt nước biến mất
color: cham
role: required

#### group tray_bubbles
label.en: Bubbles keep rising
label.vi: Bọt khí nổi lên mãi
color: vang_hoe
role: required

#### group tray_wet
label.en: Wet patch spreads
label.vi: Vết ướt loang rộng
color: gi_dong
role: required

#### group tray_not_soaking
label.en: Not soaking in
label.vi: Không phải nước thấm vào
color: nau_dat
role: limit

#### item tray_wet_chalk
label.en: Wet patch spreads on chalk
label.vi: Vết ướt loang rộng trên đá phấn
group: tray_wet
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": một hòn đá phấn trắng, trên mặt có một vết ướt xám nhạt loang to, mép vết ướt có vài vòng loang nhẹ cho thấy đang lan ra; không có giọt nước đọng; nền kem trơn; không có tay, không có chữ.
image.alt.en: A wet patch on a white rock
image.alt.vi: Vết ướt trên hòn đá trắng

#### item tray_marble_drop
label.en: Drop stays round on marble
label.vi: Giọt nước đọng tròn trên đá cẩm thạch
group: tray_not_soaking
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": một hòn đá cẩm thạch trắng có vân xám, trên mặt có một giọt nước tròn căng, bóng, mặt đá quanh giọt vẫn khô; khác hình `explore_impermeable` (không có ống nhỏ giọt, góc nhìn ngang hơn); nền kem trơn; không có tay, không có chữ.
image.alt.en: A round drop on a white rock
image.alt.vi: Giọt nước tròn trên hòn đá trắng

#### item tray_bubbles_sandstone
label.en: Bubbles keep rising from sandstone
label.vi: Bọt khí cứ nổi lên từ sa thạch
group: tray_bubbles
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": cốc nhựa trong đựng nước, hòn sa thạch vàng nâu dưới đáy, nhiều chuỗi bọt khí nhỏ nổi lên tới mặt nước; khác hình `explore_bubbles` (cốc thấp hơn, góc nhìn chéo); nền kem trơn; không có tay, không có chữ, không có vạch số.
image.alt.en: Many bubbles rising from a brown rock
image.alt.vi: Nhiều bọt khí nổi lên từ hòn đá nâu

#### item tray_slate_runoff
label.en: Water runs off slate
label.vi: Nước trượt khỏi mặt đá phiến
group: tray_not_soaking
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": một tấm đá phiến xám sẫm đặt hơi nghiêng, nước từ ống nhỏ giọt rơi xuống rồi chảy thành dòng nhỏ trượt khỏi mép đá xuống khay, mặt đá không có vết ướt loang; nền kem trơn; không có tay, không có chữ.
image.alt.en: Water running off a dark grey rock
image.alt.vi: Nước trượt khỏi hòn đá xám sẫm

#### item tray_drop_sandstone
label.en: Drop disappears on sandstone
label.vi: Giọt nước biến mất trên sa thạch
group: tray_drop
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": một hòn sa thạch vàng nâu có vân sọc, ống nhỏ giọt ở phía trên; chỗ giọt nước vừa rơi chỉ còn một chấm ẩm nhỏ sẫm màu, không có giọt nước đọng; nền kem trơn; không có tay, không có chữ. Khác hình `explore_permeable` (chấm ẩm nhỏ, chưa loang rộng).
image.alt.en: A damp spot on a brown rock
image.alt.vi: Chấm ẩm trên hòn đá nâu

#### item tray_granite_bubbles
label.en: Only two bubbles from granite
label.vi: Chỉ hai bọt khí từ đá hoa cương
group: tray_not_soaking
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": cốc nhựa trong đựng nước, hòn đá hoa cương xám lốm đốm dưới đáy, chỉ có hai bọt khí nhỏ bám trên mặt đá, không có chuỗi bọt nổi lên; cùng cỡ cốc và góc nhìn như `tray_bubbles_sandstone`; nền kem trơn; không có tay, không có chữ, không có vạch số. Câu q5 dùng lại hình này.
image.alt.en: Two bubbles on a grey rock in water
image.alt.vi: Hai bọt khí trên hòn đá xám trong nước
> [CẦN KIỂM] Đá hoa cương gần như không thấm; vài bọt khí bám ngoài mặt đá lúc mới thả (ghi chú của Oak).

#### item tray_drop_chalk
label.en: Drop disappears on chalk
label.vi: Giọt nước biến mất trên đá phấn
group: tray_drop
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": một hòn đá phấn trắng, ống nhỏ giọt ở phía trên; chỗ giọt nước vừa rơi chỉ còn một chấm ẩm nhỏ xám nhạt, không có giọt nước đọng; nền kem trơn; không có tay, không có chữ.
image.alt.en: A damp spot on a white rock
image.alt.vi: Chấm ẩm trên hòn đá trắng

#### item tray_bubbles_chalk
label.en: Bubbles keep rising from chalk
label.vi: Bọt khí cứ nổi lên từ đá phấn
group: tray_bubbles
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": cốc nhựa trong đựng nước, hòn đá phấn trắng dưới đáy, một chuỗi dài bọt khí nhỏ nổi lên tới mặt nước; cùng cỡ cốc và góc nhìn như `tray_bubbles_sandstone`; nền kem trơn; không có tay, không có chữ, không có vạch số. Câu q5 dùng lại hình này.
image.alt.en: A line of bubbles rising from a white rock
image.alt.vi: Chuỗi bọt khí nổi lên từ hòn đá trắng

#### item tray_wet_sandstone
label.en: Wet patch spreads on sandstone
label.vi: Vết ướt loang rộng trên sa thạch
group: tray_wet
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": một hòn sa thạch vàng nâu có vân sọc, trên mặt có một vết ướt sẫm màu loang to, mép vết ướt có vài vòng loang nhẹ cho thấy đang lan ra; không có giọt nước đọng, không có ống nhỏ giọt; nền kem trơn; không có tay, không có chữ. Khác hình `explore_permeable` (không có ống nhỏ giọt, vết loang to hơn).
image.alt.en: A wet patch on a brown rock
image.alt.vi: Vết ướt trên hòn đá nâu

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Bốn format: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, thẻ từ có hình. Một câu một loại hình: q1, q3 toàn ảnh chụp; q2, q4, q5 toàn hình vẽ của bộ "Bàn tay thử đá".
> Vị trí đáp án đúng theo bảng ở `_topic.md`: q1 thứ ba, thẻ đúng q2 thứ ba, q3 thứ nhất và thứ ba, q4 thứ hai, q5 thứ nhất.
> Không hỏi đá nào hợp lợp mái (bài sáu).

### q1
id: b190d26b-69fc-4af3-b715-1788fc4a0157
format: single_choice
version: 1
dok: 1
prompt.en: What do you use to drop water on a rock?
prompt.vi: Em dùng gì để nhỏ nước lên hòn đá?
image.brief: Dùng lại hình `q1_water` ở bài `da-va-dat/da-nao-cung-hon`. Từ khoá tìm ảnh (EN): clear plastic cup of water plain background
image.alt.en: A plastic cup of water
image.alt.vi: Cốc nhựa đựng nước
hint.en: Remember the Water test picture.
hint.vi: Em nhớ lại ô Thử nhỏ nước nhé.
explanation_correct.en: Yes! A dropper lets out one drop at a time.
explanation_correct.vi: Đúng rồi! Ống nhỏ giọt cho nước ra từng giọt một.
explanation_wrong.en: The answer is the dropper. It lets out small drops.
explanation_wrong.vi: Đáp án là ống nhỏ giọt. Ống cho nước ra từng giọt nhỏ.
> Kính lúp và đèn pin là dụng cụ "nhìn kỹ" của bài hai; bé dễ nhầm vì ý chính một nói "watch closely". Ba ảnh cùng một dụng cụ trên nền trơn. Ảnh ống nhỏ giọt là ảnh chụp mới (ô Học chỉ có ống nhỏ giọt trong hình vẽ), nên đáp án không phải ảnh bé vừa thấy.
> Rà chữ tester 11/11 (n7): hình câu hỏi đổi từ cốc thuỷ tinh của *Hô hấp* sang cốc nhựa trong đựng nước (ảnh mới của bài ba, `q1_water`), cho khớp mục An toàn (thử nước bằng cốc nhựa).

#### option q1_magnifier
correct: false
label.en: magnifying glass
label.vi: kính lúp
image.brief: Dùng lại hình `q1_magnifier` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): magnifying glass black handle plain background
image.alt.en: A magnifying glass
image.alt.vi: Chiếc kính lúp

#### option q1_torch
correct: false
label.en: torch
label.vi: đèn pin
image.brief: Dùng lại hình `q1_torch` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): flashlight torch plain background
image.alt.en: A torch
image.alt.vi: Chiếc đèn pin

#### option q1_dropper
correct: true
label.en: dropper
label.vi: ống nhỏ giọt
image.brief: [hình vẽ] Một ống nhỏ giọt bằng nhựa trong có bầu bóp, đặt nằm trên nền trơn, vẽ chéo; cùng cỡ trong khung như kính lúp và đèn pin; không có vạch số đọc được, không có chữ, không có nhãn thuốc. Từ khoá tìm ảnh (EN): plastic dropper pipette plain background
image.alt.en: A dropper
image.alt.vi: Ống nhỏ giọt

### q2
id: afa094c8-daae-4901-9384-e241e3db4705
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `explore_water`.
image.alt.en: A dropper over a rock
image.alt.vi: Ống nhỏ giọt phía trên hòn đá
sentence.en: A {1} rock lets water in.
sentence.vi: Đá {1} cho nước đi vào bên trong.
answers: q2_permeable
hint.en: Think of sandstone after the water test.
hint.vi: Em nhớ lại sa thạch sau khi thử nhỏ nước nhé.
explanation_correct.en: Yes! A permeable rock lets water soak in.
explanation_correct.vi: Đúng rồi! Đá thấm nước cho nước thấm vào bên trong.
explanation_wrong.en: The answer is permeable.
explanation_wrong.vi: Đáp án là thấm nước.
> Câu EN không có gốc "perme-", câu VI không có chữ "thấm" (đáp án VI là "thấm nước"). Thẻ sai có sức hút: "impermeable" (chữ gần giống), "hard" (bé hay nghĩ đá cứng thì nước không vào được).
> Ba thẻ là hình vẽ: hai hình của ô Học (thấm, không thấm; một đúng một sai, cùng là hình bé đã thấy) và hình hòn đá không vết xước của bài ba (cứng). Thẻ đúng ở chỗ thứ ba.

#### bank q2_impermeable
label.en: impermeable
label.vi: không thấm nước
image.brief: Dùng lại hình `explore_impermeable`.
image.alt.en: A drop sitting on a rock
image.alt.vi: Giọt nước đọng trên mặt đá

#### bank q2_hard
label.en: hard
label.vi: cứng
image.brief: Dùng lại hình `q5_none` ở bài `da-va-dat/da-nao-cung-hon`.
image.alt.en: A rock with no scratches
image.alt.vi: Hòn đá không có vết xước

#### bank q2_permeable
label.en: permeable
label.vi: thấm nước
image.brief: Dùng lại hình `explore_permeable`.
image.alt.en: Water soaking into a rock
image.alt.vi: Nước thấm vào hòn đá

### q3
id: fc600bbe-c747-474d-8f1a-5bb327bd466a
format: multi_choice
version: 1
dok: 2
prompt.en: Which rocks keep water out?
prompt.vi: Những hòn đá nào không cho nước vào?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `q1` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): rock collection table top view
image.alt.en: Many different rocks on a table
image.alt.vi: Nhiều hòn đá khác nhau trên bàn
hint.en: Think about the water test on each rock.
hint.vi: Em nghĩ tới phép thử nhỏ nước trên từng hòn đá nhé.
explanation_correct.en: Yes! Marble and slate are impermeable.
explanation_correct.vi: Đúng rồi! Đá cẩm thạch và đá phiến không thấm nước.
explanation_wrong.en: The answers are marble and slate.
explanation_wrong.vi: Đáp án là đá cẩm thạch và đá phiến.
> DOK 2: phân loại bốn mẫu đá theo tính chất thấm nước. Đá phấn là bẫy mạnh: trắng như đá cẩm thạch, và bé vừa học đá phấn mềm (bài ba) chứ chưa quen việc nó thấm nước. Hỏi nhóm "giữ nước ở ngoài" để ảnh bé đã thấy ở phần Học (sa thạch, từ `sandstone`) là lựa chọn sai, không phải đáp án.
> Bốn ảnh mẫu đá cùng nền kem của Bộ mẫu đá; `alt` chỉ tả màu, không tả tính chất thấm nước.
> Rà chữ tester 11/11 (n2): gợi ý cũ trỏ ô "Impermeable", mà ô đó liệt kê sẵn hai đáp án; nay gợi ý là cách nghĩ (nhớ lại phép thử trên từng hòn đá).

#### option q3_marble
correct: true
label.en: marble
label.vi: đá cẩm thạch
image.brief: Dùng lại hình `marble` ở bài `da-va-dat/da-nao-cung-hon`. Từ khoá tìm ảnh (EN): white marble rock sample
image.alt.en: A white sparkly rock
image.alt.vi: Hòn đá trắng lấp lánh

#### option q3_sandstone
correct: false
label.en: sandstone
label.vi: sa thạch
image.brief: Dùng lại hình `tray_sandstone` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): sandstone rock sample layers
image.alt.en: A yellow-brown rock
image.alt.vi: Hòn đá màu vàng nâu

#### option q3_slate
correct: true
label.en: slate
label.vi: đá phiến
image.brief: Dùng lại hình `tray_slate` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): slate rock sample
image.alt.en: A dark grey rock
image.alt.vi: Hòn đá màu xám sẫm

#### option q3_chalk
correct: false
label.en: chalk
label.vi: đá phấn
image.brief: Dùng lại hình `chalk` ở bài `da-va-dat/da-nao-cung-hon`. Từ khoá tìm ảnh (EN): chalk rock sample
image.alt.en: A white rock
image.alt.vi: Hòn đá màu trắng

### q4
id: 0c6bcd54-0c53-4171-9e75-04eea968fb02
format: single_choice
version: 1
dok: 2
prompt.en: Mai drops water on three rocks. Which rock is permeable?
prompt.vi: Mai nhỏ nước lên ba hòn đá. Hòn đá nào thấm nước?
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": bàn tay Mai cầm ống nhỏ giọt phía trên ba hòn đá xếp hàng trên khay nhựa (một hòn trắng vân xám, một hòn vàng nâu, một tấm xám sẫm), chưa nhỏ giọt nào, các hòn đá còn khô; nền kem trơn; chỉ thấy bàn tay, không vẽ nét mặt, không có chữ.
image.alt.en: A dropper over three dry rocks
image.alt.vi: Ống nhỏ giọt phía trên ba hòn đá khô
hint.en: Remember the Permeable picture.
hint.vi: Em nhớ lại ô Thấm nước nhé.
explanation_correct.en: Yes! The drop soaked into the rock.
explanation_correct.vi: Đúng rồi! Giọt nước đã thấm vào trong hòn đá.
explanation_wrong.en: The answer is the rock where the drop disappears.
explanation_wrong.vi: Đáp án là hòn đá có giọt nước biến mất.
> DOK 2: đọc kết quả thử nhỏ nước (kế hoạch bài năm ở `_topic.md`). Nhãn gọi theo kết quả, cùng một dạng (việc xảy ra với giọt nước), không gọi tên đá. Nước trượt khỏi đá phiến dễ bị nhầm là "nước đi đâu mất".
> Rà chữ tester 11/11 (N1): trước đây ba lựa chọn dùng lại ba món kệ Chơi (đáp án là món bắt buộc, hai lựa chọn sai là hai món bẫy), nên bé chọn được nhờ nhớ trò chơi. Nay ba lựa chọn là ba hình vẽ mới của chính tình huống câu hỏi: cùng ba hòn đá của hình câu hỏi sau khi nhỏ giọt, mỗi hình khoanh một hòn. Ba hình giống hệt nhau trừ vòng khoanh, nên bé phải đọc kết quả ở hòn được khoanh. Thứ tự lựa chọn trùng vị trí hòn đá (trái, giữa, phải); đáp án vẫn ở chỗ thứ hai.

#### option q4_round
correct: false
label.en: drop stays round
label.vi: giọt nước đọng tròn
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": cùng khay và ba hòn đá của hình câu hỏi q4, cùng góc nhìn, sau khi đã nhỏ mỗi hòn một giọt: hòn trắng vân xám bên trái có một giọt nước tròn căng đọng trên mặt; hòn vàng nâu ở giữa chỉ còn một chấm ẩm sẫm màu, không còn giọt; tấm xám sẫm bên phải có nước đã trượt xuống khay, mặt đá khô; không có tay, không có ống nhỏ giọt. Một vòng tròn màu vàng hoe, nét dày mềm, khoanh hòn bên trái. Nền kem trơn; không có chữ, không có mũi tên, không có số. Hai lựa chọn `q4_gone`, `q4_runoff` vẽ y hệt, chỉ đổi chỗ vòng khoanh.
image.alt.en: The left rock, with a round drop on top
image.alt.vi: Hòn bên trái, giọt nước đọng tròn trên mặt

#### option q4_gone
correct: true
label.en: drop disappears
label.vi: giọt nước biến mất
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": y hệt hình lựa chọn `q4_round` (cùng ba hòn đá sau khi nhỏ giọt, cùng góc nhìn, cùng cỡ), chỉ khác: vòng tròn vàng hoe khoanh hòn vàng nâu ở giữa (chỉ còn chấm ẩm). Nền kem trơn; không có chữ, không có mũi tên, không có số.
image.alt.en: The middle rock, with only a damp spot
image.alt.vi: Hòn ở giữa, chỉ còn một chấm ẩm

#### option q4_runoff
correct: false
label.en: water runs off
label.vi: nước trượt đi
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": y hệt hình lựa chọn `q4_round` (cùng ba hòn đá sau khi nhỏ giọt, cùng góc nhìn, cùng cỡ), chỉ khác: vòng tròn vàng hoe khoanh tấm xám sẫm bên phải (nước đã trượt xuống khay). Nền kem trơn; không có chữ, không có mũi tên, không có số.
image.alt.en: The right rock, with water running off
image.alt.vi: Hòn bên phải, nước trượt xuống khay

### q5
id: a59378ec-91b6-41a7-9d95-0115f79014bc
format: single_choice
version: 1
dok: 2
prompt.en: Nam puts rocks in cups of water. Which rock is permeable?
prompt.vi: Nam thả đá vào các cốc nước. Hòn đá nào thấm nước?
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": ba cốc nhựa trong đựng nước xếp hàng, bàn tay Nam đang thả một hòn đá vào cốc ở giữa, chưa có bọt khí nào; nền kem trơn; chỉ thấy bàn tay, không vẽ nét mặt, không có chữ, không có vạch số trên cốc.
image.alt.en: A hand putting a rock into a cup of water
image.alt.vi: Bàn tay thả hòn đá vào cốc nước
hint.en: Remember the Bubbles picture.
hint.vi: Em nhớ lại ô Bọt khí nhé.
explanation_correct.en: Yes! Bubbles keep rising as water goes in.
explanation_correct.vi: Đúng rồi! Bọt khí nổi lên mãi vì nước đang thấm vào.
explanation_wrong.en: The answer is the long line of bubbles.
explanation_wrong.vi: Đáp án là chuỗi bọt khí dài.
> DOK 2: đọc kết quả thử bọt khí. Bẫy "hai bọt khí bám trên đá" chính là ý của Oak (vài bọt lúc đầu chỉ là không khí bám ngoài mặt đá): bé thấy có bọt là chọn ngay. Ba nhãn cùng một dạng (cụm từ về bọt khí).
> Chuỗi bọt và hai bọt là hình của phần Chơi; cốc không có bọt là hình vẽ mới, nên đáp án không phải hình duy nhất bé đã thấy.

#### option q5_line
correct: true
label.en: a long line of bubbles
label.vi: một chuỗi bọt khí dài
image.brief: Dùng lại hình `tray_bubbles_chalk`.
image.alt.en: A line of bubbles rising from a white rock
image.alt.vi: Chuỗi bọt khí nổi lên từ hòn đá trắng

#### option q5_two
correct: false
label.en: two bubbles on the rock
label.vi: hai bọt khí bám trên đá
image.brief: Dùng lại hình `tray_granite_bubbles`.
image.alt.en: Two bubbles on a grey rock in water
image.alt.vi: Hai bọt khí trên hòn đá xám trong nước

#### option q5_none
correct: false
label.en: no bubbles at all
label.vi: không có bọt khí nào
image.brief: [hình vẽ] Bộ "Bàn tay thử đá": cốc nhựa trong đựng nước, hòn đá cẩm thạch trắng vân xám dưới đáy, không có bọt khí nào; cùng cỡ cốc và góc nhìn như `tray_bubbles_sandstone`; nền kem trơn; không có tay, không có chữ, không có vạch số.
image.alt.en: A white rock in water with no bubbles
image.alt.vi: Hòn đá trắng trong nước, không có bọt khí

### q6
id: 9facd444-c1c8-4768-af6a-d6085d023933
format: true_false
version: 1
dok: 3
misconception: rocks_never_soak_water
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: Rocks are solid. So water can never get into a rock.
statement.vi: Đá rắn chắc. Vậy nước không bao giờ vào được trong đá.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: false
image.brief: Dùng lại hình `tray_sandstone` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): sandstone rock sample layers
image.alt.en: A yellow-brown rock
image.alt.vi: Hòn đá màu vàng nâu
hint.en: Think about the water test.
hint.vi: Em nhớ lại cách thử nhỏ nước nhé.
explanation_correct.en: Some rocks are permeable. Water soaks into sandstone.
explanation_correct.vi: Có loại đá thấm nước. Nước thấm được vào sa thạch.
explanation_wrong.en: Na is not right. Some rocks let water soak in.
explanation_wrong.vi: Na chưa đúng. Có loại đá cho nước thấm vào.
> DOK 3: Na suy từ một điều đúng (đá rắn chắc) ra một kết luận sai (nước không bao giờ vào được). Bé phải dùng bằng chứng của phép thử nhỏ nước và thử bọt khí để bác bỏ. Lời Na đúng chữ bảng "Câu sáu, lời Na" ở `_topic.md`. Đáp án Sai; giải thích khi đúng không mở đầu bằng "Yes!".
> Hình là hòn sa thạch khô, chưa nhỏ nước (ảnh mẫu của Bộ mẫu đá); `alt` không nói "thấm". Gợi ý không nêu phản ví dụ. Cả màn mười tám từ EN (prompt ba, instruction bốn, lời Na mười một).

## Từ vựng

### permeable
id: e9762d50-91ab-4901-864c-7de9c3838954
tier: core
term.en: permeable
term.vi: thấm nước
example.en: Sandstone is permeable. Water soaks into it.
example.vi: Sa thạch thấm nước. Nước thấm vào bên trong.
image.brief: Dùng lại hình `explore_permeable`.
image.alt.en: Water soaking into a rock
image.alt.vi: Nước thấm vào hòn đá
> Không viết "permanent" ở đâu (`_topic.md`). Nghe thử EN "permeable".

### impermeable
id: 7ff272d3-2dcb-4b8f-941c-c5cd1432c45c
tier: core
term.en: impermeable
term.vi: không thấm nước
example.en: The drop stays on top of an impermeable rock.
example.vi: Giọt nước đọng trên mặt hòn đá không thấm nước.
image.brief: Dùng lại hình `explore_impermeable`.
image.alt.en: A drop sitting on a rock
image.alt.vi: Giọt nước đọng trên mặt đá
> Câu ví dụ không gọi tên loại đá, để câu q3 không chỉ là nhớ lại câu ví dụ. Nghe thử EN "impermeable".

### sandstone
id: 79f4bbd6-79d8-4f53-8063-79d0e1ca3c5f
tier: core
term.en: sandstone
term.vi: sa thạch
example.en: Sandstone is made of grains of sand.
example.vi: Sa thạch được tạo nên từ những hạt cát.
image.brief: Dùng lại hình `tray_sandstone` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): sandstone rock sample layers
image.alt.en: A yellow-brown rock
image.alt.vi: Hòn đá màu vàng nâu
> [CẦN KIỂM] "sa thạch" hay "đá cát kết" theo sách (bảng Tên gọi). Sa thạch gồm những hạt cát gắn chặt với nhau (biên tập nhớ).

### slate
id: 8cc120ec-cf36-4c63-948a-a81ca03a3da2
tier: extra
term.en: slate
term.vi: đá phiến
example.en: Dark grey slate splits into thin sheets.
example.vi: Đá phiến xám sẫm tách được thành tấm mỏng.
image.brief: Dùng lại hình `tray_slate` ở bài `da-va-dat/nhin-ky-cac-loai-da`. Từ khoá tìm ảnh (EN): slate rock sample
image.alt.en: A dark grey rock
image.alt.vi: Hòn đá màu xám sẫm

### bubble
id: fa4fb8ff-33b9-456b-8d0b-69843f9eb3dc
tier: extra
term.en: bubble
term.vi: bọt khí
example.en: A bubble of air rises in the water.
example.vi: Một bọt khí nổi lên trong nước.
image.brief: Dùng lại hình `explore_bubbles`.
image.alt.en: Bubbles rising from a rock in water
image.alt.vi: Bọt khí nổi lên từ hòn đá trong nước

## Thưởng

### groundwater_card
id: 9e32ea7a-b9bc-47d1-812c-456e5b8185b7
set: rocks
rarity: common
name.en: Groundwater
name.vi: Nước ngầm
tag.en: Water under our feet
tag.vi: Nước dưới chân em
fact.en: Some rocks hold water deep underground. Wells bring it up.
fact.vi: Có loại đá giữ nước sâu dưới lòng đất. Giếng khoan đưa nước đó lên.
> [CẦN KIỂM] Nước mưa thấm qua đất và đá thấm nước, đọng lại trong các khe rỗng của đá dưới sâu thành nước ngầm; giếng khoan lấy nước đó lên (biên tập nhớ). Bài mười lăm nhắc nhà địa chất tìm nước ngầm.
image.brief: [hình vẽ] Một cây bơm tay của giếng khoan ở sân một nhà quê Việt Nam (kiểu bơm tay sắt sơn xanh hay đen), nước đang chảy ra vào chậu, vẽ gần vừa; không có người, không có nhãn hiệu, không có chữ trên thân bơm. Từ khoá tìm ảnh (EN): hand water pump well village
image.alt.en: Water coming out of a hand pump
image.alt.vi: Nước chảy ra từ cây bơm tay của giếng khoan

## Ghi chú cho hoạ sĩ

- **Loại hình:** phần lớn là hình tự vẽ của bộ "Bàn tay thử đá" (gốc bài ba, `explore_scratch`): cả bốn ô Học, cả kệ Chơi, hình câu q4 và ba lựa chọn q4, hình câu q5 và một lựa chọn q5. Câu q1 (cả hình câu hỏi lẫn ba lựa chọn) và thẻ thưởng cũng là hình vẽ (theo hình designer 11/11). Ảnh ở câu w1, q3, q6 và từ `sandstone`, `slate` (mẫu đá, khoáng vật của bài hai, ba, bốn); hình câu w2 là hình vẽ của bài hai. Hình không có chữ, không có vạch số trên ống nhỏ giọt, cốc.
- **Màu đá trong hình vẽ** theo ảnh Bộ mẫu đá đã chọn: sa thạch vàng nâu có vân sọc, đá phấn trắng, đá cẩm thạch trắng vân xám, đá phiến xám sẫm dạng tấm, đá hoa cương xám lốm đốm. Ba hình cốc nước của kệ (`tray_bubbles_sandstone`, `tray_bubbles_chalk`, `tray_granite_bubbles`) và lựa chọn `q5_none` cùng cỡ cốc, cùng góc nhìn; chỉ khác hòn đá và số bọt khí.
- **Hình tự vẽ (mười chín):** bốn ô Học (`explore_water`, `explore_permeable`, `explore_bubbles`, `explore_impermeable`); chín món Chơi; hình câu q4 (ba hòn đá khô) và ba lựa chọn q4 (`q4_round`, `q4_gone`, `q4_runoff`: cùng ba hòn đá sau khi nhỏ giọt, chỉ khác vòng khoanh; vòng phải đủ dày để thấy rõ trên iPhone hẹp nhất); hình câu q5 (ba cốc nước), lựa chọn `q5_none`. Rà chữ tester 11/11 (N1): thêm ba hình lựa chọn q4.
- **Hình tự vẽ thêm (hai, theo hình designer 11/11):** ống nhỏ giọt bằng nhựa (q1); cây bơm tay giếng khoan (thẻ `groundwater_card`). Bài này không còn ảnh nào cần tìm; tổng hai mươi mốt hình vẽ.
- **Dùng lại trong bài:** `explore_water` (q2); `explore_permeable` (thẻ đúng q2, từ `permeable`); `explore_impermeable` (thẻ q2, từ `impermeable`); `explore_bubbles` (từ `bubble`); `tray_bubbles_chalk`, `tray_granite_bubbles` (q5).
- **Dùng lại từ bài khác:** bài hai `magnifying_glass` (w2), `q1_magnifier`, `q1_torch` (q1), `q1` (q3), `tray_sandstone` (q3, q6, từ `sandstone`), `tray_slate` (q3, từ `slate`); bài ba `marble`, `chalk` (q3), `q5_none` (thẻ q2), `q1_water` (q1); bài bốn `geologist`, `diamond`, `quartz`, `tray_gypsum` (w1).
- **Cùng kiểu trong một câu:** w1, q3 mẫu đá, khoáng vật cùng nền trắng ngà; q1 ba hình vẽ dụng cụ; q2, q4, q5 toàn hình vẽ cùng bộ.
- **Màu:** Học: thử nhỏ nước `gi_dong`, thấm nước `cham`, bọt khí `vang_hoe`, không thấm nước `do_son`. Chơi: giọt nước biến mất `cham`, bọt khí nổi lên mãi `vang_hoe`, vết ướt loang rộng `gi_dong`, nhóm `limit` `nau_dat`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required` mỗi nhóm hai món, một nhóm `limit` ba món, chín món. Kệ toàn hình tự vẽ.
  - Khởi động: `single_choice` (w1, ôn bài bốn), `true_false` (w2, ôn bài hai, đáp án Đúng).
  - Quiz: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6, `speaker: na`, đáp án Sai). Bốn format.
  - DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Câu có `misconception`: q6, key `rocks_never_soak_water`.
- **Vị trí đáp án đúng:** w1 thứ hai; q1 thứ ba; thẻ đúng q2 thứ ba; q3 thứ nhất và thứ ba; q4 thứ hai; q5 thứ nhất. Đúng bảng ở `_topic.md`.
- **Tham chiếu:** `recall_from.lesson` trỏ `da-va-dat/thang-do-cung-mohs` (w1), `da-va-dat/nhin-ky-cac-loai-da` (w2); hai bài đó phải có id trước. "Mohs" có trong chuỗi VI ở w1 (gợi ý, giải thích khi đúng): cần `READINGS`.
- **Màn Chơi, ví dụ để kiểm:**
  - chạm Giọt nước biến mất trên sa thạch, Bọt khí cứ nổi lên từ đá phấn, Vết ướt loang rộng trên sa thạch → đạt;
  - chạm Chỉ hai bọt khí từ đá hoa cương → `has_limited`;
  - chạm Giọt nước biến mất trên đá phấn, Giọt nước biến mất trên sa thạch, Bọt khí cứ nổi lên từ sa thạch (thiếu vết ướt) → `missing.tray_wet`; chạm Vết ướt loang rộng trên đá phấn → `full`; bỏ Giọt nước biến mất trên đá phấn, đặt Vết ướt loang rộng trên đá phấn → đạt.
- **Dòng điều kiện màn Chơi:** "Cần đủ Giọt nước biến mất, Bọt khí nổi lên mãi, Vết ướt loang rộng · Không phải nước thấm vào". Nhãn món dài (tới năm từ EN, tám tiếng VI); nên xem trên iPhone hẹp nhất.
- **Số từ EN trên một màn:**
  - Học khoảng hai mươi chín từ: mục tiêu 8, hướng dẫn 3, bốn nhãn 6, câu dài nhất 9, ô Từ mới 2 (cộng ví dụ dài nhất 9 khi mở ô).
  - Khởi động và Quiz: nhiều nhất là q5 (khoảng hai mươi một: câu hỏi 11, ba nhãn 10), q4 (khoảng mười sáu) và q6 (mười tám).
- **Thí nghiệm ở nhà (chỉ ghi cho người duyệt):** cùng người lớn, nhỏ nước sạch lên vài hòn đá bằng ống nhỏ giọt hay thìa; thả từng hòn vào cốc nhựa trong có nước, chờ lâu để xem bọt khí có nổi lên mãi không. Không dùng cốc thuỷ tinh, không dùng giấm.
- **Từ EN có thể ngoài Starters/Movers:** permeable, impermeable, sandstone, slate, bubble, dropper, soak, patch, spread, solid, marble, chalk, granite, groundwater, well, pump.
- **Giọng đọc:** chuỗi VI không có chữ số, ký hiệu, dấu "—". Nghe thử EN "permeable", "impermeable" (hai từ gần giống nhau, giọng phải đọc rõ "im-") và tiêu đề có dấu hai chấm.
