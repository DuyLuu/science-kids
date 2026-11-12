---
id: 84f73031-5225-4c61-95eb-159eb4633509
topic: da-va-dat
slug: mary-anning-nguoi-san-hoa-thach
order: 10
stage: core
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Mary Anning
vi: Mary Anning, người săn hoá thạch
> Giữ đúng tên ở `content/syllabus.json` (`rocks-and-soils`, bài số mười). "Mary Anning" trong chuỗi VI cần dòng `READINGS` (dev, đã ghi ở SK-039).

## Mục tiêu
en: I can say why Mary Anning's fossil hunting mattered.
vi: Em nói được vì sao việc săn hoá thạch của Mary Anning quan trọng.
> Trạng thái: **nháp do AI soạn (content-editor, người soạn B), chưa duyệt.** Ticket SK-039 bước 2, ngày 11/11/2026. Chưa chạy `validate`, chưa chạy `ids`.
> Oak gắn nhãn nội dung "phân biệt đối xử": bài kể như chuyện thời đó ("nhiều người không ghi tên bà"), không chê nhóm người nào hôm nay (mục An toàn). Sửa `women_did_no_science` ở ô "Not fair" và câu q6 (gắn key, Na nói đúng).
> Chỉ kể chi tiết có trong `_topic.md` mục bài mười, mọi chi tiết tiểu sử đều có `[CẦN KIỂM]`. Không kể chuyện bị sét đánh lúc nhỏ, chuyện con chó chết trong lần lở đất. Tên loài (thằn lằn cá, thằn lằn cổ rắn) chỉ ở `brief`; chữ cho trẻ nói "bò sát biển" như *Khủng long*.
> Tranh chân dung Mary Anning vẽ lúc bà còn sống, đã hết bản quyền: Main session cho dùng (SK-039, 11/11), chờ Duy xác nhận lại.

## Ý chính
1.en: Mary Anning hunted for fossils on cliffs by the sea.
1.vi: Mary Anning đi tìm hoá thạch ở những vách đá ven biển.
2.en: She found sea reptile skeletons that were new to science.
2.vi: Bà tìm thấy những bộ xương bò sát biển mà khoa học chưa từng biết.
3.en: Anyone can be a fossil hunter, like Mary.
3.vi: Ai cũng có thể thành người săn hoá thạch, như Mary.
> [CẦN KIỂM] Ý chính hai: bộ xương thằn lằn cá Mary và anh trai tìm thấy, rồi bộ xương bò sát biển cổ dài bà tìm thấy, là những bộ xương đầu tiên các nhà khoa học được thấy gần đủ (biên tập nhớ). Nói "khoa học chưa từng biết" là giản lược.

## Khởi động

> Ba câu, đúng bảng Khởi động ở `_topic.md`:
> - w1 ôn bài chín (một ngày): hổ phách tạo thành từ gì.
> - w2 ôn bài chín (một ngày): "An old clay pot is a fossil." (Sai).
> - w3 ôn *Khủng long* bài hai (khoảng một tháng): con nào bơi dưới biển thời khủng long. Câu nối sang ô "Her finds": Mary tìm thấy bộ xương bò sát biển.

### w1
id: 84e5e2c5-8dbf-4535-9dfd-d290d53e0bbd
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/nhieu-cach-tao-thanh-hoa-thach
prompt.en: What is amber made from?
prompt.vi: Hổ phách được tạo thành từ gì?
image.brief: Dùng lại hình `amber` ở bài `da-va-dat/nhieu-cach-tao-thanh-hoa-thach`. Từ khoá tìm ảnh (EN): amber pieces polished
image.alt.en: Pieces of amber
image.alt.vi: Mấy mẩu hổ phách
hint.en: Remember the insect in lesson nine.
hint.vi: Em nhớ lại con côn trùng ở bài chín nhé.
explanation_correct.en: Yes! Amber is tree resin that hardened.
explanation_correct.vi: Đúng rồi! Hổ phách là nhựa cây đã cứng lại.
explanation_wrong.en: The answer is resin. It hardened into amber.
explanation_wrong.vi: Đáp án là nhựa cây. Nhựa cây cứng dần thành hổ phách.
> Hình câu hỏi là hổ phách (vật được hỏi), theo bảng Hình dùng chung. Mật ong có sức hút (cũng vàng, dính). Lựa chọn và vị trí đáp án (thứ hai) theo bảng Khởi động.

#### option w1_honey
correct: false
label.en: honey
label.vi: mật ong
image.brief: [ảnh] Mật ong vàng óng trong một hũ thuỷ tinh không nhãn, chụp ngang gần vừa trên nền trơn; không có nhãn hiệu, không có người, không có chữ. Từ khoá tìm ảnh (EN): honey in glass jar no label
image.alt.en: Honey in a jar
image.alt.vi: Mật ong trong hũ

#### option w1_resin
correct: true
label.en: resin
label.vi: nhựa cây
image.brief: Dùng lại hình `resin` ở bài `da-va-dat/nhieu-cach-tao-thanh-hoa-thach`. Từ khoá tìm ảnh (EN): pine resin dripping tree trunk
image.alt.en: Resin on a pine tree
image.alt.vi: Nhựa thông trên thân cây

#### option w1_ice
correct: false
label.en: ice
label.vi: nước đá
image.brief: Dùng lại hình `q1_ice` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): ice cubes glass
image.alt.en: Ice in a glass
image.alt.vi: Nước đá trong cốc

### w2
id: 771e647d-8dd3-465e-a5f9-577114e40187
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: da-va-dat/nhieu-cach-tao-thanh-hoa-thach
prompt.en: An old clay pot is a fossil.
prompt.vi: Bình gốm cổ là một hoá thạch.
image.brief: Dùng lại hình `tray_old_pot` ở bài `da-va-dat/nhieu-cach-tao-thanh-hoa-thach`. Từ khoá tìm ảnh (EN): ancient clay pot museum
image.alt.en: An old clay pot
image.alt.vi: Bình gốm cổ
answer: false
hint.en: Remember the game in lesson nine.
hint.vi: Em nhớ lại trò chơi ở bài chín nhé.
explanation_correct.en: People made the pot. It was never alive.
explanation_correct.vi: Con người làm ra chiếc bình. Nó chưa từng sống.
explanation_wrong.en: This is false. Only things once alive become fossils.
explanation_wrong.vi: Câu này sai. Chỉ những gì từng sống mới thành hoá thạch.
> Đúng chữ EN ở bảng Đúng/Sai (bài mười w2, Sai). Giải thích khi đúng không mở đầu bằng "Yes!".

### w3
id: a9add193-4284-456d-b707-037fb911847a
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: khung-long/khung-long-la-gi
prompt.en: Which one swam in the sea in dinosaur times?
prompt.vi: Con nào bơi dưới biển vào thời khủng long?
image.brief: Dùng lại hình `w1` ở bài `khung-long/hoa-thach-ke-chuyen-khung-long`. Từ khoá tìm ảnh (EN): coast island sea sky sunset
image.alt.en: Land, sea and sky
image.alt.vi: Đất liền, biển và bầu trời
hint.en: Remember the animals in the second dinosaur lesson.
hint.vi: Em nhớ lại các con vật ở bài hai chủ đề Khủng long nhé.
explanation_correct.en: Yes! Sea reptiles swam with their flippers.
explanation_correct.vi: Đúng rồi! Bò sát biển bơi bằng chân chèo.
explanation_wrong.en: The answer is the sea reptile. It had flippers.
explanation_wrong.vi: Đáp án là bò sát biển. Nó có chân chèo.
> Nhãn tả bộ phận ("has flippers", "has horns", "has big wings"), không gọi tên con vật: tên "sea reptile" · "bò sát biển" có chữ "sea" · "biển" trùng câu hỏi, phụ đề sẽ lộ đáp án. Cách làm như câu w1 *Hoá thạch kể chuyện khủng long*. Giải thích sau khi chọn vẫn gọi tên.
> Hình câu hỏi là cảnh đất, biển, trời của câu w1 bài đó (không có con vật). `alt` ba lựa chọn sửa so với gốc (gốc gọi tên con vật), chép đúng `alt` đã sửa ở câu w1 bài đó. Lựa chọn và vị trí đáp án (thứ nhất) theo bảng Khởi động.

#### option w3_sea
correct: true
label.en: has flippers
label.vi: có chân chèo
image.brief: Dùng lại hình `tray_sea_reptile` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): plesiosaur Elasmosaurus swimming life restoration painting
image.alt.en: A painting of an animal with flippers
image.alt.vi: Tranh vẽ một con vật có chân chèo

#### option w3_horns
correct: false
label.en: has horns
label.vi: có sừng
image.brief: Dùng lại hình `tray_triceratops` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): Triceratops life restoration painting three-quarter view
image.alt.en: A painting of an animal with three horns
image.alt.vi: Tranh vẽ một con vật có ba sừng

#### option w3_wings
correct: false
label.en: has big wings
label.vi: có đôi cánh lớn
image.brief: Dùng lại hình `tray_pterosaur` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): Pteranodon flying life restoration
image.alt.en: A painting of an animal with big wings
image.alt.vi: Tranh vẽ một con vật có đôi cánh lớn

## Học

> Bốn ô, theo câu chuyện: Mary là ai (ý chính một), bà tìm thấy gì (ý chính hai), chuyện chưa công bằng thời đó (`women_did_no_science`), và người săn hoá thạch hôm nay (ý chính ba). Đi từ cụ thể (một người, một nơi) tới ý chung (ai cũng có thể làm khoa học).
> Ô "Not fair" nói nhẹ: nêu việc thời đó, không dùng chữ "phân biệt", không nói ai xấu.

### explore
id: 5f64439d-ae84-4afe-a2fc-31a80f5cdd8e
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_mary
label.en: Mary Anning
label.vi: Mary Anning
color: do_son
sentence.en: Mary lived in England over two hundred years ago.
sentence.vi: Mary sống ở nước Anh cách đây hơn hai trăm năm.
image.brief: [tranh] Bức chân dung Mary Anning vẽ lúc bà còn sống (khoảng năm 1842, nay ở Bảo tàng Lịch sử Tự nhiên ở Luân Đôn), đã hết bản quyền: bà đứng trên bờ biển, khoác giỏ, vách đá phía sau; designer 11/11 cắt ngang ngực, nên chiếc búa (ngang hông) và chú chó (ở chân tranh) đều nằm ngoài khung; cắt bỏ khung tranh, nhãn, chữ ký; không thêm chữ. Duy chưa xác nhận lại thì dùng tạm ảnh vách đá ven biển ở thị trấn Lyme Regis (khác ảnh `q1_cliffs`). Từ khoá tìm ảnh (EN): Mary Anning portrait painting dog
image.alt.en: A painting of Mary Anning
image.alt.vi: Tranh vẽ Mary Anning
> `alt` bỏ vế "with her dog" · "cùng chú chó" vì chó nằm ngoài khung sau khi cắt (bảng designer 11/11).
> [CẦN KIỂM] Bức chân dung vẽ lúc bà còn sống và đã hết bản quyền; năm vẽ; con chó trong tranh tên Tray (`_topic.md`, chưa đưa tên chó vào chữ cho trẻ).
> Rà chữ tester 11/11 (n5): trong tranh Mary cầm búa, mà cùng bài có món bẫy "Đập đá bằng búa" (nhóm "Không an toàn"). Designer cắt khung để búa không nổi bật; `alt` không nhắc búa. Bài mười lăm (câu q1, từ `rock_hammer`) nói búa địa chất chỉ người lớn dùng.
examples.1.en: a small town by the sea
examples.1.vi: một thị trấn nhỏ ven biển
examples.2.en: her family was poor
examples.2.vi: nhà bà nghèo
examples.3.en: she had little time at school
examples.3.vi: bà ít được đi học
examples.4.en: she sold fossils to help her family
examples.4.vi: bà bán hoá thạch để giúp gia đình
> [CẦN KIỂM] Tiểu sử: sinh năm 1799, mất năm 1847, sống ở thị trấn ven biển Lyme Regis, nước Anh; nhà nghèo, ít được đi học; tìm và bán hoá thạch để giúp gia đình (`_topic.md` mục bài mười). Chữ cho trẻ nói "hơn hai trăm năm", không đưa năm; không đưa tên thị trấn vào chuỗi VI (đọc không xuôi).

#### group explore_finds
label.en: Her finds
label.vi: Bà tìm thấy gì
color: vang_hoe
sentence.en: She found skeletons of sea reptiles nobody had seen.
sentence.vi: Bà tìm thấy bộ xương những loài bò sát biển chưa ai từng thấy.
image.brief: [sơ đồ ghép ảnh] Một ảnh bộ xương thằn lằn cá (Leptopterygius) nằm trong phiến đá ở Bảo tàng Lịch sử Tự nhiên ở Luân Đôn, tìm ở cùng tầng đá kỷ Jura sớm với vùng bờ biển của Mary, không phải mẫu vật của bà; designer 11/11 cắt khung tủ kính, xoá nhãn và số hiệu mẫu bằng vân đá bên cạnh (hình ghép một phần); không có người, không có chữ. Thẻ thưởng viết "a skeleton like this" nên vẫn đúng. Hình gốc của bảng Hình dùng chung (bài mười một w1 dùng lại); hình câu q1, từ discover và thẻ thưởng dùng lại hình này. Từ khoá tìm ảnh (EN): Mary Anning ichthyosaur skeleton Natural History Museum
image.alt.en: A sea reptile skeleton in rock
image.alt.vi: Bộ xương bò sát biển trong đá
examples.1.en: a fish-shaped sea reptile
examples.1.vi: bò sát biển có hình dáng giống cá
examples.2.en: a long-necked sea reptile
examples.2.vi: bò sát biển cổ dài
examples.3.en: many ammonites
examples.3.vi: rất nhiều cúc đá
examples.4.en: evidence for scientists
examples.4.vi: bằng chứng cho các nhà khoa học
> [CẦN KIỂM] Khoảng mười hai tuổi, Mary cùng anh trai tìm ra bộ xương thằn lằn cá; sau đó bà tìm ra bộ xương bò sát biển cổ dài (thằn lằn cổ rắn) và hoá thạch thằn lằn bay (`_topic.md`). Chữ cho trẻ không nêu tên loài.
> Ô này dạy "Mary tìm thấy bộ xương bò sát biển", ý được ôn ở bài mười một w1. Bảng Hình dùng chung ghi `tray_ammonite` dùng ở "ô Her finds" bài mười, nhưng ô này phải là ảnh bộ xương (`explore_finds`, hình gốc cho bài mười một); cúc đá chỉ là ví dụ ba, còn ảnh `tray_ammonite` dùng ở thẻ đúng câu q2 (đề xuất sửa bảng, ghi ở SK-039).

#### group explore_unfair
label.en: Not fair
label.vi: Chưa công bằng
color: cham
sentence.en: Back then, many scientists did not write her name.
sentence.vi: Thời đó, nhiều nhà khoa học không ghi tên bà.
image.brief: [hình vẽ] Một cuốn sổ ghi chép cũ bìa da mở trên bàn gỗ, trang giấy ngả vàng còn trống, cây bút lông ngỗng và lọ mực bên cạnh, ánh nến dịu; không có chữ trên trang, không có người. Hình gợi ý "tên bà không được viết vào".
image.alt.en: An old notebook with a blank page
image.alt.vi: Cuốn sổ cũ có trang giấy trống
examples.1.en: because she was a woman
examples.1.vi: vì bà là phụ nữ
examples.2.en: because her family was poor
examples.2.vi: vì nhà bà nghèo
examples.3.en: today museums show her finds
examples.3.vi: ngày nay bảo tàng trưng bày những gì bà tìm thấy
examples.4.en: today many people know her name
examples.4.vi: ngày nay nhiều người biết tên bà
> [CẦN KIỂM] Ý "nhiều nhà khoa học nam thời đó không ghi tên bà vì bà là phụ nữ, nhà nghèo" theo Oak; bà không được nhận vào Hội Địa chất Luân Đôn vì là phụ nữ; Bảo tàng Lịch sử Tự nhiên ở Luân Đôn trưng bày một số hoá thạch bà tìm thấy (`_topic.md`). Chữ cho trẻ không nêu tên hội.

#### group explore_today
label.en: Fossil hunters today
label.vi: Người săn hoá thạch hôm nay
color: gi_dong
sentence.en: Anyone can hunt for fossils with a grown-up.
sentence.vi: Ai cũng có thể đi tìm hoá thạch cùng người lớn.
image.brief: Dùng lại hình `tray_pebbles`.
image.alt.en: A child and a grown-up searching a pebble beach
image.alt.vi: Bạn nhỏ và người lớn tìm kiếm trên bãi cuội
examples.1.en: look closely at rocks
examples.1.vi: nhìn kỹ những hòn đá
examples.2.en: write and draw
examples.2.vi: ghi chép và vẽ lại
examples.3.en: ask a scientist
examples.3.vi: hỏi nhà khoa học
examples.4.en: stay away from cliffs
examples.4.vi: tránh xa vách đá
> Mục An toàn ở `_topic.md`: luôn đi cùng người lớn, không trèo vách đá, không đứng sát chân vách đá; khuyến khích xem hoá thạch ở bảo tàng cùng bố mẹ.

### new_words
id: bce62105-9dcd-466b-853b-43a22d2c1942
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: palaeontologist, discover, evidence

## Chơi

> "Tìm hoá thạch như nhà khoa học". Bé chọn một cách nhìn kỹ, một cách ghi chép hay vẽ lại, một người để hỏi; không chọn việc không an toàn. Trò chơi dùng ý chính ba và ô "Fossil hunters today".
> - Ba món bẫy là việc không an toàn, mỗi món giống một nhóm: trèo lên vách đá (giống "đến gần để nhìn kỹ"), đứng sát chân vách đá (giống "nhìn bãi đá"), đập đá bằng búa (giống "mở đá xem bên trong"). Lời nhắn nói lý do, không doạ.
> - Cả kệ là hình vẽ (`_topic.md` dự kiến): có trẻ em trong cảnh, ảnh thật sẽ lộ mặt. Trẻ vẽ từ phía sau, không nét mặt; người lớn chỉ thấy tay hay lưng.
> - Nhãn món cùng một dạng: câu ra lệnh ngắn (làm gì).

### tray
id: af7ec922-6598-4762-a454-3d234fb15e41
type: build_tray
version: 1
prompt.en: Hunt for fossils like a scientist
prompt.vi: Tìm hoá thạch như nhà khoa học
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick one safe step from each group.
messages.start.vi: Em chọn mỗi nhóm một việc làm an toàn nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! You hunt for fossils safely, like a scientist.
messages.balanced.vi: Tuyệt! Em tìm hoá thạch an toàn, như một nhà khoa học.
messages.has_limited.en: That could hurt you. Fossil hunters stay safe.
messages.has_limited.vi: Việc đó có thể làm em bị thương. Người săn hoá thạch luôn giữ an toàn.
messages.missing.tray_look_group.en: You still need a way to look closely.
messages.missing.tray_look_group.vi: Em còn thiếu một cách nhìn kỹ.
messages.missing.tray_note_group.en: You still need a way to write or draw.
messages.missing.tray_note_group.vi: Em còn thiếu một cách ghi chép hay vẽ lại.
messages.missing.tray_ask_group.en: You still need someone to ask.
messages.missing.tray_ask_group.vi: Em còn thiếu một người để hỏi.

#### group tray_look_group
label.en: Look closely
label.vi: Nhìn kỹ
color: do_son
role: required

#### group tray_note_group
label.en: Write and draw
label.vi: Ghi chép và vẽ
color: vang_hoe
role: required

#### group tray_ask_group
label.en: Ask an expert
label.vi: Hỏi người hiểu biết
color: cham
role: required

#### group tray_not_safe
label.en: Not safe
label.vi: Không an toàn
color: nau_dat
role: limit

#### item tray_lens_rock
label.en: Use a magnifying glass
label.vi: Soi kính lúp lên hòn đá
group: tray_look_group
image.brief: [hình vẽ] Một bạn nhỏ ngồi xổm trên bãi đá cuội ven biển, vẽ từ phía sau chỉ thấy lưng và tay, tay cầm kính lúp soi một hòn đá có hình vỏ xoắn; vách đá nhiều lớp ở xa; không vẽ nét mặt, không có chữ. Câu q4 dùng lại hình này.
image.alt.en: A child looking at a rock with a magnifying glass
image.alt.vi: Bạn nhỏ soi kính lúp lên hòn đá

#### item tray_climb
label.en: Climb the cliff
label.vi: Trèo lên vách đá
group: tray_not_safe
image.brief: [hình vẽ] Một bạn nhỏ vẽ từ phía sau đang bám tay leo lên một vách đá dựng đứng nhiều lớp, cách mặt đất chưa cao; không có cảnh ngã, không có máu, không vẽ nét mặt, không có chữ.
image.alt.en: A child climbing a cliff
image.alt.vi: Bạn nhỏ trèo lên vách đá

#### item tray_notebook
label.en: Write in a notebook
label.vi: Ghi vào sổ
group: tray_note_group
image.brief: [hình vẽ] Bàn tay bạn nhỏ cầm bút viết vào cuốn sổ ghi chép mở trên đầu gối, cạnh đó là hòn đá có hình vỏ xoắn; trang sổ chỉ có nét gạch ngang, không có chữ đọc được; không vẽ mặt.
image.alt.en: A hand writing in a notebook
image.alt.vi: Bàn tay viết vào sổ ghi chép

#### item tray_museum
label.en: Show a museum expert
label.vi: Mang tới bảo tàng hỏi
group: tray_ask_group
image.brief: [hình vẽ] Trong bảo tàng, một bạn nhỏ vẽ từ phía sau, đứng cạnh bố hoặc mẹ (cũng từ phía sau), đưa hòn đá có hình vỏ xoắn cho một người làm ở bảo tàng (chỉ thấy đôi tay đeo găng đỡ hòn đá qua quầy); tủ kính ở xa; không có biển tên, không có chữ, không vẽ nét mặt. Câu q3 dùng lại hình này.
image.alt.en: A child showing a rock at a museum
image.alt.vi: Bạn nhỏ mang hòn đá tới bảo tàng

#### item tray_pebbles
label.en: Search the beach pebbles
label.vi: Tìm kỹ trên bãi cuội
group: tray_look_group
image.brief: [hình vẽ] Một bạn nhỏ và một người lớn, vẽ từ phía sau, cùng cúi nhìn dọc bãi đá cuội ven biển, đứng xa vách đá, biển êm; không vẽ nét mặt, không có chữ. Ô `explore_today` và câu q3 dùng lại hình này.
image.alt.en: A child and a grown-up searching a pebble beach
image.alt.vi: Bạn nhỏ và người lớn tìm kiếm trên bãi cuội

#### item tray_cliff_base
label.en: Stand under the cliff
label.vi: Đứng sát chân vách đá
group: tray_not_safe
image.brief: [hình vẽ] Một bạn nhỏ vẽ từ phía sau đứng sát chân một vách đá cao, vài hòn đá nhỏ đang lăn xuống ở xa phía trên; không có cảnh đá rơi trúng người, không vẽ nét mặt, không có chữ.
image.alt.en: A child standing under a tall cliff
image.alt.vi: Bạn nhỏ đứng sát chân vách đá cao

#### item tray_sketch
label.en: Draw what you find
label.vi: Vẽ lại thứ em tìm thấy
group: tray_note_group
image.brief: [hình vẽ] Bàn tay bạn nhỏ cầm bút chì vẽ lại hình vỏ xoắn lên trang giấy, hòn đá có vỏ xoắn đặt cạnh trang giấy; không có chữ trên giấy, không vẽ mặt.
image.alt.en: A hand drawing a spiral shell
image.alt.vi: Bàn tay vẽ lại hình vỏ xoắn

#### item tray_ask_scientist
label.en: Ask a scientist
label.vi: Hỏi nhà khoa học
group: tray_ask_group
image.brief: [hình vẽ] Ngoài bãi biển, một bạn nhỏ vẽ từ phía sau chỉ tay vào hòn đá trên tay một nhà khoa học (chỉ thấy đôi tay, tay áo khoác và chiếc kính lúp); không vẽ nét mặt, không có chữ. Câu q4 dùng lại hình này.
image.alt.en: A child asking a scientist about a rock
image.alt.vi: Bạn nhỏ hỏi nhà khoa học về hòn đá

#### item tray_hammer
label.en: Smash rocks with a hammer
label.vi: Đập đá bằng búa
group: tray_not_safe
image.brief: [hình vẽ] Bàn tay một bạn nhỏ giơ chiếc búa lên trên một hòn đá to, chưa đập xuống, không có kính bảo hộ; không có mảnh đá văng, không vẽ mặt, không có chữ. Câu q4 dùng lại hình này.
image.alt.en: A child holding a hammer over a rock
image.alt.vi: Bạn nhỏ giơ búa định đập đá

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3. Bốn format. Vị trí đáp án theo bảng `_topic.md` (bài mười): q1 thứ ba, thẻ đúng q2 thứ nhất, q3 thứ hai và thứ tư, q4 thứ ba, q5 thứ nhất.
> q1, q5 theo câu gợi ý ở `_topic.md` (bà tìm hoá thạch ở đâu; ngày nay xem ở đâu). Câu gợi ý q4 ("vì sao bộ xương là bằng chứng quan trọng") chuyển thành câu điền từ q2 (từ `evidence`), vì câu "vì sao" cần ba lựa chọn là ba lý do, khó có hình; q3, q4 hỏi cách săn hoá thạch an toàn và đúng cách (ý chính ba).

### q1
id: 6c293e11-ac2a-42fc-a23f-fda760fc009a
format: single_choice
version: 1
dok: 1
prompt.en: Where did Mary Anning hunt for fossils?
prompt.vi: Mary Anning đi tìm hoá thạch ở đâu?
image.brief: Dùng lại hình `explore_finds`. Từ khoá tìm ảnh (EN): Mary Anning ichthyosaur skeleton Natural History Museum
image.alt.en: A sea reptile skeleton in rock
image.alt.vi: Bộ xương bò sát biển trong đá
hint.en: Remember the Mary Anning picture in the lesson.
hint.vi: Em nhớ lại ô Mary Anning trong bài học nhé.
explanation_correct.en: Yes! Mary hunted on cliffs by the sea.
explanation_correct.vi: Đúng rồi! Mary tìm hoá thạch ở vách đá ven biển.
explanation_wrong.en: The answer is sea cliffs. Waves and rain uncover fossils there.
explanation_wrong.vi: Đáp án là vách đá ven biển. Sóng và mưa làm hoá thạch lộ ra ở đó.
> DOK 1: nhớ lại ý chính một. Hình câu hỏi là bộ xương bò sát biển trong bảo tàng (thứ bà tìm), không phải nơi bà tìm, nên không lộ đáp án "vách đá ven biển". Rà chữ tester 11/11 (N5): đổi chỗ với thẻ đúng câu q2 (trước đây hình câu hỏi là `tray_ammonite`). Hai lựa chọn sai dùng lại hai ảnh của *Khủng long* bài một (rừng dương xỉ, ruộng lúa), cùng là ảnh phong cảnh. Giải thích khi sai nối bài bảy (xói mòn làm hoá thạch lộ ra).
> [CẦN KIỂM] Sóng biển và mưa làm vách đá lở dần, hoá thạch lộ ra ở bờ biển nơi Mary sống (biên tập nhớ).

#### option q1_forest
correct: false
label.en: in a forest
label.vi: trong rừng
image.brief: Dùng lại hình `q2_ferns` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): tree fern forest wide view Vietnam national park
image.alt.en: A forest full of ferns
image.alt.vi: Khu rừng nhiều dương xỉ

#### option q1_field
correct: false
label.en: in a rice field
label.vi: trên ruộng lúa
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh

#### option q1_cliffs
correct: true
label.en: on sea cliffs
label.vi: ở vách đá ven biển
image.brief: [ảnh] Vách đá nhiều lớp Golden Cap nhìn từ bãi Charmouth, sát thị trấn Lyme Regis nơi Mary Anning tìm hoá thạch (nước Anh), biển ở một bên, chụp xa; designer 11/11 cắt bỏ phần bãi có người; không có người, không có nhà gần, không có biển báo hay chữ. Câu q6 và từ `cliff` dùng lại ảnh này. Từ khoá tìm ảnh (EN): Lyme Regis cliffs Jurassic Coast
image.alt.en: Layered cliffs by the sea
image.alt.vi: Vách đá nhiều lớp ven biển

### q2
id: b316c064-810e-448b-8b6e-6eaa862d5f6a
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `explore_mary`. Từ khoá tìm ảnh (EN): Mary Anning portrait painting dog
image.alt.en: A painting of Mary Anning
image.alt.vi: Tranh vẽ Mary Anning
sentence.en: Mary's fossils were {1} of sea reptiles from long ago.
sentence.vi: Hoá thạch Mary tìm thấy là {1} về những loài bò sát biển thời xa xưa.
answers: q2_evidence
hint.en: Remember the Her finds picture in the lesson.
hint.vi: Em nhớ lại ô Bà tìm thấy gì trong bài học nhé.
explanation_correct.en: Yes! Fossils are evidence of life long ago.
explanation_correct.vi: Đúng rồi! Hoá thạch là bằng chứng về sự sống thời xa xưa.
explanation_wrong.en: The answer is evidence. Fossils show what lived long ago.
explanation_wrong.vi: Đáp án là bằng chứng. Hoá thạch cho biết những gì đã sống thời xa xưa.
> DOK 1: nhớ lại từ mới `evidence` và ô "Her finds" (ví dụ bốn). Câu không có gốc từ "evident". Hai thẻ sai bắt quan niệm cũ của *Khủng long* bài ba (`dinosaur_pictures_are_photos`): "photos" · "ảnh chụp" và "models" · "mô hình" (mô hình do người làm theo hoá thạch). Thẻ đúng ở chỗ thứ nhất (bảng vị trí).
> Rà chữ tester 11/11 (N5): thẻ đúng trước đây dùng lại `explore_finds` (ảnh ô Học), trong khi một thẻ sai là ảnh mới: đáp án là ảnh duy nhất bé đã thấy ở Học. `explore_finds` chuyển sang làm hình câu q1.
> Theo hình designer 11/11: không có ảnh hợp lệ xấp ảnh cũ (ảnh trên Commons đều có người), nên ba thẻ là ba hình vẽ mới cùng nét: hòn đá có vỏ xoắn, xấp ảnh phong cảnh cũ, mô hình khủng long cổ dài. Thẻ đúng không còn dùng lại `tray_ammonite` bài tám, `q2_models` không còn dùng lại ảnh `tray_longneck` của *Khủng long*; ba thẻ đều mới nên không thẻ nào nổi bật vì đã gặp.

#### bank q2_evidence
label.en: evidence
label.vi: bằng chứng
image.brief: [hình vẽ] Một hòn đá xám có vỏ xoắn ốc hoá thạch in nổi trên mặt, đặt trên nền kem trơn, vẽ chéo, cùng nét hai thẻ kia; không có nhãn, thước hay chữ.
image.alt.en: A spiral shell in rock
image.alt.vi: Vỏ xoắn trong đá

#### bank q2_photos
label.en: photos
label.vi: ảnh chụp
image.brief: [hình vẽ] Một xấp ảnh giấy cũ chụp phong cảnh (núi, biển), góc ảnh cong, đặt trên bàn gỗ, vẽ chéo, cùng nét hai thẻ kia; không có người trong ảnh, không có chữ.
image.alt.en: A pile of old photos
image.alt.vi: Một xấp ảnh cũ

#### bank q2_models
label.en: models
label.vi: mô hình
image.brief: [hình vẽ] Một mô hình khủng long cổ dài màu xanh lá đứng trên đế, vẽ ngang cả con, cùng nét hai thẻ kia; không có nhãn hiệu, không có người, không có chữ.
image.alt.en: A long-necked dinosaur model
image.alt.vi: Mô hình khủng long cổ dài

### q3
id: 16168380-b3b3-4de9-99a7-75cd03b6539b
format: multi_choice
version: 1
dok: 2
prompt.en: Which ones are safe on a fossil hunt?
prompt.vi: Những việc nào an toàn khi đi tìm hoá thạch?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `tray_shore_rocks` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): black rocks coast Ly Son Island
image.alt.en: Dark rocks by the sea
image.alt.vi: Ghềnh đá đen ven biển
hint.en: Remember the Fossil hunters today picture.
hint.vi: Em nhớ lại ô Người săn hoá thạch hôm nay nhé.
explanation_correct.en: Yes! Search with a grown-up, or ask at a museum.
explanation_correct.vi: Đúng rồi! Em tìm cùng người lớn, hoặc mang tới bảo tàng hỏi.
explanation_wrong.en: The answers are the beach search and the museum.
explanation_wrong.vi: Đáp án là tìm kỹ trên bãi cuội và mang tới bảo tàng hỏi.
> DOK 2: phân loại, áp mục An toàn và ô "Fossil hunters today" vào hai việc mới, chưa có ở kệ Chơi: ra bãi đá khi nước đang lên (mục An toàn của `_topic.md`), đi ra vách đá một mình (ô Học: "with a grown-up"). Bốn hình vẽ cùng nét kệ Chơi: hai đáp án là hai món kệ, hai lựa chọn sai là hai hình mới. Đáp án ở chỗ thứ hai và thứ tư (bảng vị trí). Hình câu hỏi là ghềnh đá ven biển (ảnh chụp, tình huống chung), không có người.
> Rà chữ tester 11/11 (N3): gợi ý cũ gọi tên nhóm bẫy "Not safe" của trò chơi, và lựa chọn sai `q3_cliff_base` là đúng món bẫy của kệ, nên bé trả lời bằng trí nhớ trò chơi. Gợi ý nay trỏ ô Học; `q3_cliff_base` đổi thành `q3_alone` (hình vẽ mới, cùng bộ).

#### option q3_tide
correct: false
label.en: walk out as the tide comes in
label.vi: ra bãi đá khi nước đang lên
image.brief: [hình vẽ] Cùng nét kệ Chơi: một bạn nhỏ vẽ từ phía sau đang đi ra những tảng đá xa bờ, nước biển dâng lên quanh chân đá; biển không dữ, không có sóng lớn, không có cảnh ngã; không vẽ nét mặt, không có chữ.
image.alt.en: A child walking out on rocks as water rises
image.alt.vi: Bạn nhỏ đi ra bãi đá khi nước đang lên

#### option q3_pebbles
correct: true
label.en: search the beach pebbles
label.vi: tìm kỹ trên bãi cuội
image.brief: Dùng lại hình `tray_pebbles`.
image.alt.en: A child and a grown-up searching a pebble beach
image.alt.vi: Bạn nhỏ và người lớn tìm kiếm trên bãi cuội

#### option q3_alone
correct: false
label.en: go to the cliffs alone
label.vi: đi ra vách đá một mình
image.brief: [hình vẽ] Cùng nét kệ Chơi: một bạn nhỏ vẽ từ phía sau đi một mình dọc bãi biển vắng, hướng về phía vách đá nhiều lớp ở xa; không có người lớn trong hình, không có cảnh nguy hiểm, không vẽ nét mặt, không có chữ.
image.alt.en: A child walking to the cliffs alone
image.alt.vi: Bạn nhỏ đi một mình ra vách đá

#### option q3_museum
correct: true
label.en: show a museum expert
label.vi: mang tới bảo tàng hỏi
image.brief: Dùng lại hình `tray_museum`.
image.alt.en: A child showing a rock at a museum
image.alt.vi: Bạn nhỏ mang hòn đá tới bảo tàng

### q4
id: b78fc83b-71d8-4ef0-bb14-4bbf46673d08
format: single_choice
version: 1
dok: 2
prompt.en: Lan sees a shell shape in a rock. What should she do?
prompt.vi: Lan thấy hình một vỏ ốc trên hòn đá. Lan nên làm gì?
image.brief: Dùng lại hình `tray_lens_rock`.
image.alt.en: A child looking at a rock with a magnifying glass
image.alt.vi: Bạn nhỏ soi kính lúp lên hòn đá
hint.en: What do fossil hunters do when they are not sure?
hint.vi: Người săn hoá thạch làm gì khi chưa chắc chắn?
explanation_correct.en: Yes! A scientist can tell her what it is.
explanation_correct.vi: Đúng rồi! Nhà khoa học sẽ cho Lan biết đó là gì.
explanation_wrong.en: The answer is to ask a scientist. They can tell her what it is.
explanation_wrong.vi: Đáp án là hỏi nhà khoa học. Nhà khoa học cho Lan biết đó là gì.
> DOK 2: áp ý chính ba và ô "Fossil hunters today" vào một tình huống mới của bạn Lan. Hai lựa chọn sai có sức hút: giấu vào cặp mang về (muốn giữ "báu vật"), đập ra xem bên trong (tò mò). Ba hình vẽ cùng nét kệ Chơi: hai hình của kệ, một hình mới. Gợi ý không có chữ "scientist" · "nhà khoa học" của nhãn đáp án.
> [CẦN KIỂM] Quy định nhặt đá, hoá thạch ở di tích, khu bảo tồn (`_topic.md` mục An toàn). Lựa chọn "giấu vào cặp" sai vì "giấu" và vì chưa hỏi người hiểu biết; chữ cho trẻ không nói luật.

#### option q4_hide
correct: false
label.en: hide it in her bag
label.vi: giấu vào cặp mang về
image.brief: [hình vẽ] Cùng nét kệ Chơi: bàn tay một bạn nhỏ nhét hòn đá có hình vỏ xoắn vào chiếc cặp sách đang mở, như đang giấu; không có logo trên cặp, không vẽ mặt, không có chữ.
image.alt.en: A hand putting a rock into a school bag
image.alt.vi: Bàn tay nhét hòn đá vào cặp sách

#### option q4_hammer
correct: false
label.en: smash it with a hammer
label.vi: đập vỡ bằng búa
image.brief: Dùng lại hình `tray_hammer`.
image.alt.en: A child holding a hammer over a rock
image.alt.vi: Bạn nhỏ giơ búa định đập đá

#### option q4_ask
correct: true
label.en: ask a scientist
label.vi: hỏi nhà khoa học
image.brief: Dùng lại hình `tray_ask_scientist`.
image.alt.en: A child asking a scientist about a rock
image.alt.vi: Bạn nhỏ hỏi nhà khoa học về hòn đá

### q5
id: 65391fc5-bd1f-4bac-a02e-0b1ced3e585b
format: single_choice
version: 1
dok: 2
prompt.en: Mary's sea reptiles died out long ago. Where can we see them today?
prompt.vi: Những loài bò sát biển Mary tìm thấy đã tuyệt chủng từ lâu. Ngày nay ta xem chúng ở đâu?
image.brief: Dùng lại hình `tray_sea_reptile` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): plesiosaur Elasmosaurus swimming life restoration painting
image.alt.en: A painting of a sea reptile
image.alt.vi: Tranh vẽ bò sát biển
hint.en: Can an animal that died out swim today?
hint.vi: Con vật đã tuyệt chủng thì hôm nay còn bơi được không?
explanation_correct.en: Yes! Museums show their skeletons.
explanation_correct.vi: Đúng rồi! Bảo tàng trưng bày bộ xương của chúng.
explanation_wrong.en: The answer is a museum. They are no longer alive.
explanation_wrong.vi: Đáp án là bảo tàng. Chúng không còn sống nữa.
> DOK 2: suy ra từ "đã tuyệt chủng" (*Khủng long* bài năm) rằng chỉ còn bộ xương, nên phải xem ở bảo tàng. Thuỷ cung có sức hút mạnh: bò sát biển sống dưới nước. Khác câu q2 *Hoá thạch kể chuyện khủng long* (bên đó hỏi xem bộ xương khủng long ở đâu, lựa chọn sở thú, ruộng lúa): ở đây là bò sát biển, lựa chọn bẫy là thuỷ cung.
> Hình câu hỏi là tranh bò sát biển của *Khủng long* bài hai (cũng là đáp án câu w3 hôm nay, nhưng ở đây là hình câu hỏi, không phải lựa chọn). Ba lựa chọn là ảnh nơi chốn: hai ảnh của *Khủng long*, một ảnh mới.

#### option q5_museum
correct: true
label.en: museum
label.vi: bảo tàng
image.brief: Dùng lại hình `q5` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): natural history museum dinosaur hall wide view
image.alt.en: A big hall in a museum
image.alt.vi: Sảnh lớn trong bảo tàng

#### option q5_aquarium
correct: false
label.en: aquarium
label.vi: thuỷ cung
image.brief: [ảnh] Một bể kính lớn ở thuỷ cung, nhiều cá bơi giữa san hô, chụp từ phía trước kính; không có khách, không có biển tên, logo hay chữ. Từ khoá tìm ảnh (EN): aquarium big tank fish no people
image.alt.en: A big fish tank
image.alt.vi: Bể cá lớn

#### option q5_zoo
correct: false
label.en: zoo
label.vi: sở thú
image.brief: Dùng lại hình `q2_zoo` ở bài `khung-long/hoa-thach-ke-chuyen-khung-long`. Từ khoá tìm ảnh (EN): zebras zoo enclosure
image.alt.en: Zebras at a zoo
image.alt.vi: Ngựa vằn ở sở thú

### q6
id: f22f7fa7-93d5-4c5e-a1d3-c7a455d93d71
format: true_false
version: 1
dok: 3
misconception: women_did_no_science
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: Mary was a woman long ago. She did great science.
statement.vi: Mary là một phụ nữ sống từ rất lâu. Bà đã làm khoa học rất giỏi.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: true
image.brief: Dùng lại hình `q1_cliffs`. Từ khoá tìm ảnh (EN): Lyme Regis cliffs Jurassic Coast
image.alt.en: Layered cliffs by the sea
image.alt.vi: Vách đá nhiều lớp ven biển
hint.en: Remember the Not fair picture in the lesson.
hint.vi: Em nhớ lại ô Chưa công bằng trong bài học nhé.
explanation_correct.en: Yes! Women did science long ago, like Mary.
explanation_correct.vi: Đúng rồi! Ngày xưa đã có phụ nữ làm khoa học, như Mary.
explanation_wrong.en: Na is right. Mary's finds helped scientists learn a lot.
explanation_wrong.vi: Na nói đúng. Những gì Mary tìm thấy giúp các nhà khoa học hiểu thêm nhiều điều.
> DOK 3: bé đánh giá lời Na. Bé còn tin "ngày xưa phụ nữ không làm khoa học" (hay tin "không được ghi tên thì không phải nhà khoa học", ô "Not fair") sẽ chọn "Na chưa đúng". Lời Na đúng bảng "Câu sáu, lời Na"; đáp án Đúng theo bảng Đúng/Sai. Hình là vách đá ven biển không người (`_topic.md` gợi ý), dùng lại ảnh lựa chọn đúng của câu q1: ở đây là hình câu hỏi, không phải lựa chọn.
> [CẦN KIỂM] Lời Na "làm khoa học rất giỏi" theo ý Oak (bà là người mở đường).

## Từ vựng

### palaeontologist
id: b6e6256b-e476-448f-bd1f-e72007f1f2ca
tier: core
term.en: palaeontologist
term.vi: nhà cổ sinh vật học
example.en: A palaeontologist studies fossils to learn about the past.
example.vi: Nhà cổ sinh vật học nghiên cứu hoá thạch để tìm hiểu thời xa xưa.
image.brief: Dùng lại hình `palaeontologist` ở bài `khung-long/hoa-thach-ke-chuyen-khung-long`. Từ khoá tìm ảnh (EN): palaeontologist hands tool fossil rock quarry
image.alt.en: A palaeontologist digging out a fossil
image.alt.vi: Nhà cổ sinh vật học đào hoá thạch
> Ôn có chủ ý: `palaeontologist` là từ `extra` ở *Khủng long* bài ba, nay thành core (bảng Từ vựng). Chính tả Anh. [Nghe thử] giọng EN.

### discover
id: 9534abb8-5cee-40d4-aa69-83fab92e3a1d
tier: core
term.en: discover
term.vi: phát hiện, tìm ra
example.en: Mary discovered new fossils in the sea cliffs.
example.vi: Mary đã phát hiện ra những hoá thạch mới trong vách đá ven biển.
image.brief: Dùng lại hình `explore_finds`. Từ khoá tìm ảnh (EN): Mary Anning ichthyosaur skeleton Natural History Museum
image.alt.en: A sea reptile skeleton in rock
image.alt.vi: Bộ xương bò sát biển trong đá
> `term.vi` có dấu phẩy: [Nghe thử] giọng VI đọc dấu phẩy thành chỗ ngắt.

### evidence
id: 8e638cfb-d7bf-4c11-9802-4e1c615210fd
tier: core
term.en: evidence
term.vi: bằng chứng
example.en: Footprints in rock are evidence that dinosaurs walked there.
example.vi: Dấu chân trên đá là bằng chứng khủng long từng đi qua đó.
image.brief: Dùng lại hình `tray_rock_print` ở bài `khung-long/hoa-thach-ke-chuyen-khung-long`. Từ khoá tìm ảnh (EN): dinosaur footprint fossil three toed rock top view
image.alt.en: A dinosaur footprint in rock
image.alt.vi: Dấu chân khủng long in trên đá
> Câu ví dụ khác câu q2, để từ mới không đưa sẵn đáp án.

### cliff
id: b3248633-a264-4819-b572-e39d5e10ad83
tier: extra
term.en: cliff
term.vi: vách đá
example.en: Sea cliffs have many layers of rock.
example.vi: Vách đá ven biển có nhiều lớp đá.
image.brief: Dùng lại hình `q1_cliffs`. Từ khoá tìm ảnh (EN): Lyme Regis cliffs Jurassic Coast
image.alt.en: Layered cliffs by the sea
image.alt.vi: Vách đá nhiều lớp ven biển

## Thưởng

### mary_find_card
id: 0de798d5-8f14-4e9c-86fc-a5035deef227
set: rocks
rarity: common
name.en: Mary's sea reptile
name.vi: Bò sát biển của Mary
tag.en: Found by Mary
tag.vi: Mary tìm thấy
fact.en: Mary found a skeleton like this with her brother. She was only about twelve.
fact.vi: Mary cùng anh trai tìm thấy một bộ xương như thế này. Khi đó bà mới khoảng mười hai tuổi.
> [CẦN KIỂM] Khoảng mười hai tuổi, Mary cùng anh trai tìm ra bộ xương thằn lằn cá (bảng Bộ thẻ ở `_topic.md`). Viết "a skeleton like this" · "một bộ xương như thế này" để câu vẫn đúng nếu ảnh không phải đúng mẫu vật của bà.
image.brief: Dùng lại hình `explore_finds`. Từ khoá tìm ảnh (EN): Mary Anning ichthyosaur skeleton Natural History Museum
image.alt.en: A sea reptile skeleton in rock
image.alt.vi: Bộ xương bò sát biển trong đá

## Ghi chú cho hoạ sĩ

- **Loại hình:**
  - Tranh chân dung Mary Anning (`explore_mary`) là `[tranh]` vẽ lúc bà còn sống, đã hết bản quyền (SK-039, Main session 11/11, chờ Duy xác nhận lại). Người duy nhất có mặt trong cả bài. Không có ảnh người thật nào khác.
  - Kệ Chơi và các hình có trẻ em (q3_tide, q4_hide) là hình tự vẽ: trẻ vẽ từ phía sau, không nét mặt; người lớn chỉ thấy tay hay lưng. Cảnh không an toàn vẽ nhẹ: không ngã, không máu, không đá rơi trúng người.
  - Ô "Not fair" là hình tự vẽ cuốn sổ cũ trang trống; ba thẻ câu q2 cũng là hình vẽ (không có ảnh xấp ảnh cũ không người).
  - `explore_finds` là hình ghép một phần: ảnh bộ xương thằn lằn cá (không phải mẫu của Mary), designer xoá nhãn, số hiệu.
  - Còn lại là ảnh chụp: vách đá Golden Cap (`q1_cliffs`), mật ong, thuỷ cung.
- **Theo file chọn ảnh designer 11/11:** bốn ảnh nguồn (tranh Mary, vách đá, mật ong, thuỷ cung), mười sáu hình tự vẽ (chín món kệ, `explore_unfair`, `q3_tide`, `q3_alone`, `q4_hide`, ba thẻ q2), một hình ghép (`explore_finds`).
- **Phải theo dõi:** tranh chân dung cắt ngang ngực nên búa và chó đều ngoài khung; Duy xác nhận dùng tranh (Main session đã cho). Bộ xương là mẫu *Leptopterygius*, không phải của Mary; chữ trẻ đọc không nói đây là bộ xương của bà (thẻ viết "a skeleton like this").
- **Dùng lại trong bài:** `explore_mary` (hình câu q2); `explore_finds` (hình câu q1, từ `discover`, thẻ `mary_find_card`); `q1_cliffs` (hình câu q6, từ `cliff`); `tray_pebbles` (ô `explore_today`, q3); `tray_museum` (q3); `tray_lens_rock` (hình câu q4); `tray_hammer`, `tray_ask_scientist` (q4).
- **Dùng lại từ bài khác:** `amber`, `resin`, `tray_old_pot` (bài chín); `q1_ice`, `tray_shore_rocks` (*Núi lửa*); `w1`, `q2_zoo`, `palaeontologist`, `tray_rock_print` (*Hoá thạch kể chuyện khủng long*); `tray_sea_reptile`, `tray_triceratops`, `tray_pterosaur` (*Khủng long là gì*); `q2_ferns`, `q2_rice`, `q5` (*Trái Đất rất lâu về trước*). Bài này không còn dùng `tray_ammonite`, `tray_longneck`.
- **Bài khác dùng lại hình của bài này** (bảng Hình dùng chung): `explore_finds` (bài mười một w1).
- **Một hình một vai trong bài:** tranh bò sát biển là đáp án câu w3 và hình câu hỏi q5 (không trái nhau); ảnh vách đá là đáp án câu q1 và hình câu hỏi q6 (không trái nhau); ảnh bộ xương `explore_finds` là hình câu q1, không làm lựa chọn ở câu nào; các hình kệ Chơi mỗi hình chỉ một vai ở Quiz, và từ rà chữ tester 11/11 không món bẫy nào của kệ làm lựa chọn ở q3.
- **Cùng kiểu trong một câu:** w1 ba ảnh vật trên nền trơn; w3 ba tranh phục dựng nền kem; q1 ba ảnh phong cảnh; q2 ba hình vẽ (hình câu hỏi là tranh chân dung); q3, q4 ba bốn hình vẽ cùng nét kệ Chơi; q5 ba ảnh nơi chốn.
- **Màu:** Học: Mary Anning `do_son`, bà tìm thấy gì `vang_hoe`, chưa công bằng `cham`, người săn hoá thạch hôm nay `gi_dong`. Chơi: nhìn kỹ `do_son`, ghi chép và vẽ `vang_hoe`, hỏi người hiểu biết `cham`, nhóm `limit` `nau_dat`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required` (mỗi nhóm hai món), một nhóm `limit` (ba món), chín món.
  - Khởi động: `single_choice` (w1 ôn bài chín, w3 ôn *Khủng long* bài hai), `true_false` (w2 ôn bài chín, Sai).
  - Quiz: `single_choice` (q1, q4, q5), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q6, `speaker: na`, Đúng). Bốn format.
  - DOK q1 tới q6: 1, 1, 2, 2, 2, 3. Câu có `misconception`: q6, key `women_did_no_science`.
- **Vị trí đáp án đúng:** w1 thứ hai; w3 thứ nhất; q1 thứ ba; thẻ đúng q2 thứ nhất; q3 thứ hai và thứ tư; q4 thứ ba; q5 thứ nhất. Khớp bảng `_topic.md`.
- **Tham chiếu:** `recall_from.lesson` trỏ `da-va-dat/nhieu-cach-tao-thanh-hoa-thach` (w1, w2), `khung-long/khung-long-la-gi` (w3, đã có id).
- **`READINGS`:** "Mary Anning" và "Mary" đứng riêng có trong nhiều chuỗi VI (tên bài, ô Học, câu hỏi, giải thích, lời Na, thẻ). Đề xuất đọc "me-ri a-ninh", "me-ri" (`_topic.md`, Đề xuất cho dev); nghe thử rồi chốt.
- **Màn Chơi, ví dụ để kiểm:**
  - chạm Soi kính lúp lên hòn đá, Ghi vào sổ, Hỏi nhà khoa học → đạt;
  - chạm Trèo lên vách đá → `has_limited`;
  - chạm Tìm kỹ trên bãi cuội, Vẽ lại thứ em tìm thấy, Ghi vào sổ (thiếu người để hỏi) → `missing.tray_ask_group`; chạm Mang tới bảo tàng hỏi → `full`; bỏ Ghi vào sổ, đặt Mang tới bảo tàng hỏi → đạt.
- **Dòng điều kiện màn Chơi:** "Cần đủ Nhìn kỹ, Ghi chép và vẽ, Hỏi người hiểu biết · Không an toàn".
- **Số từ EN trên một màn:**
  - Học khoảng ba mươi lăm từ: mục tiêu 9, hướng dẫn 3, bốn nhãn 9, câu dài nhất 9, ô Từ mới 5. Vượt ba mươi vì nhãn ô bốn dài ("Fossil hunters today"), như các bài bốn ô trước.
  - Quiz nhiều nhất là q3 (khoảng ba mươi chín: câu hỏi 8, hướng dẫn 5, bốn nhãn 20, gợi ý 6; nhãn là câu làm gì nên dài, "walk out as the tide comes in" dài nhất) và q5 (khoảng hai mươi tám). q6 cả màn 17. Nếu PM muốn gần ba mươi, rút nhãn đó thành "go out as the tide rises" · "ra bãi đá lúc nước lên".
  - Chơi khoảng sáu mươi từ (nhãn món là câu ra lệnh), như các chủ đề trước.
- **Từ EN có thể ngoài Starters/Movers:** palaeontologist, discover, evidence, cliff, Mary Anning, England, reptiles, skeletons, flippers, ammonites, scientists, museum, expert, magnifying glass, notebook, tide, hammer, aquarium, honey, resin, amber, died out.
- **Bộ thẻ:** `set: rocks`.
