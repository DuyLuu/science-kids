---
id: f64fffc7-207f-4f54-9f01-c3fd5c3a51e1
topic: noi-song-tren-trai-dat
slug: dong-co-xavan
order: 6
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Savannas
vi: Đồng cỏ xavan
> Giữ đúng tên ở `content/syllabus.json` (key `new-habitats-around-the-world`, bài số sáu).

## Mục tiêu
en: I can say what a savanna is like.
vi: Em nói được đồng cỏ xavan như thế nào.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 16/11/2026. Ticket SK-048. Mọi dòng `id:` để trống; chạy `ids` sau `_topic.md` và bài 1 đến 5 (câu w1 trỏ bài 5).
> Không có lesson Oak KS1 nào cho xavan (`_topic.md` mục Nguồn). Ý chính, loài, ảnh theo `docs/explorer-habitats-proposal.md` mục 4 bài 6 và mục 7: bỏ cặp ảnh mùa mưa, mùa khô và ảnh vũng nước; không câu hỏi nào dựa vào ảnh mùa.
> Bài core: nơi nóng, khô theo mùa, đứng giữa rừng mưa (bài 3) và sa mạc (bài 7). Sửa `lions_live_in_jungle` ở ví dụ ba ô Học "Savanna", nhóm "Eats meat" ở phần Chơi, giải thích đúng câu q5 và câu q6 (gắn key).

## Ý chính
1.en: A savanna is hot, with tall grass.
1.vi: Đồng cỏ xavan nóng và có cỏ cao.
2.en: It has a rainy and a dry season.
2.vi: Ở đó có mùa mưa và mùa khô.
3.en: Big herds walk far to find water.
3.vi: Những đàn thú lớn đi rất xa để tìm nước.
> Lệch `_topic.md`: ý một bản VI ở `_topic.md` là "Đồng cỏ xavan nóng, cỏ cao, ít cây.", nói thêm "ít cây" mà bản EN không có (Lỗi hay gặp số bảy). Bản EN thêm "and few trees" thì thành mười từ, nên giữ EN và bỏ "ít cây" ở VI. Ý "ít cây" dạy ở câu chính ô "Savanna" (cũng là chữ câu q2). Đề nghị phiên chính sửa dòng ý chính bài 6 ở `_topic.md`.
> Từ cụ thể tới trừu tượng: cảnh nhìn thấy (cỏ cao, nóng), rồi thay đổi theo mùa (mùa mưa, mùa khô, chỉ giới thiệu; mùa dạy ở chủ đề Explorer số năm *Thời tiết và các mùa*, đứng ngay sau), rồi điều con vật làm vì nơi đó khô (đàn thú đi xa tìm nước).
> [CẦN KIỂM] Xavan châu Phi có mùa mưa và mùa khô; đàn linh dương đầu bò, ngựa vằn đi theo mưa để tìm cỏ và nước.

## Khởi động

> Hai câu `true_false`, cả hai đáp án Sai (đúng bảng Khởi động ở `_topic.md`). w1 ôn bài ngay trước (bài 5, rạn san hô ấm và sáng). w2 ôn *Gọi tên và nhóm động vật* bài sáu (mốc dài: cá sấu ăn thịt), chuẩn bị cho phần Chơi nhóm theo thức ăn (ăn cỏ, ăn lá, ăn thịt).

### w1
id: 21638a2c-8945-471d-b726-9dd63c9263e4
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: noi-song-tren-trai-dat/bien-va-dai-duong
prompt.en: Coral reefs are cold and dark.
prompt.vi: Rạn san hô lạnh và tối.
image.brief: Dùng lại hình `q4` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): coral reef underwater fish NOAA
image.alt.en: A coral reef under the sea
image.alt.vi: Rạn san hô dưới biển
answer: false
hint.en: Look at the colours in the water.
hint.vi: Em nhìn màu sắc dưới nước nhé.
explanation_correct.en: Coral reefs are warm and full of fish.
explanation_correct.vi: Rạn san hô ấm và có rất nhiều cá.
explanation_wrong.en: This is false. Coral reefs are warm and bright.
explanation_wrong.vi: Câu này sai. Rạn san hô ấm và sáng sủa.
feedback_true.en: The deep sea is cold and dark.
feedback_true.vi: Biển sâu mới lạnh và tối.
> Câu nói đặc điểm của biển sâu gán cho rạn san hô (đúng ý `sea_same_everywhere` của bài 5). Ảnh rạn san hô nhiều màu, nước trong là bằng chứng cho phía đúng, không đẩy bé về phía sai. Gợi ý trỏ tới màu sắc nhìn thấy trong ảnh.
> `explanation_correct` đứng một mình được (thẻ "Ý sai → Ý đúng" ở Tổng kết), dùng lại đúng chữ "warm and full of fish" bé đã nghe ở bài 5.

### w2
id: 19a25e55-8851-47df-a112-be93898e89b8
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/con-vat-an-gi
prompt.en: A crocodile eats grass and leaves.
prompt.vi: Cá sấu ăn cỏ và lá cây.
image.brief: Dùng lại hình `tray_croc` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Crocodylus siamensis
image.alt.en: A crocodile on a riverbank
image.alt.vi: Con cá sấu trên bờ sông
answer: false
hint.en: Look at the crocodile's long, strong jaws.
hint.vi: Em nhìn cái hàm dài và khoẻ của cá sấu nhé.
explanation_correct.en: Crocodiles eat meat, like fish.
explanation_correct.vi: Cá sấu ăn thịt, ví dụ như cá.
explanation_wrong.en: This is false. A crocodile eats meat.
explanation_wrong.vi: Câu này sai. Cá sấu ăn thịt.
feedback_true.en: A crocodile catches fish in the river.
feedback_true.vi: Cá sấu bắt cá dưới sông.
> Câu mới, không chép câu cũ của bài đó. Ôn ba nhóm "ăn thực vật, ăn thịt" của *Gọi tên và nhóm động vật* bài sáu (ví dụ "a crocodile eats fish"), để bé vào phần Chơi hôm nay với ý "con vật ăn gì". Gợi ý trỏ tới cái hàm dài, khoẻ nhìn thấy trong ảnh (dấu hiệu con vật bắt mồi), không nói thẳng "ăn thịt".
> "Bắt", không "giết" (mục An toàn).
> Sửa 16/11 theo ảnh mới (designer đổi ảnh cá sấu cả chủ đề sang `tray_croc` bài 1, cá sấu Xiêm non miệng khép, không thấy răng): `hint` cũ "Look at the crocodile's sharp teeth." · "Em nhìn hàm răng nhọn của cá sấu nhé." bảo bé nhìn thứ không có trong ảnh. Câu mới trỏ tới cái hàm dài vẫn thấy rõ; không lặp ý `feedback_true` (bắt cá dưới sông).

## Học

> Bốn ô, từ cảnh tới con vật: nơi sống (cỏ cao, ít cây, nóng), mùa khô (một ô nói cả hai mùa bằng lời, chỉ có ảnh mùa khô), đàn thú đi xa tìm nước, hươu cao cổ (con vật ăn lá cây cao, chuẩn bị câu q4 và thẻ thưởng).
> Ô "Savanna" mang ý sửa misconception: ví dụ ba "lions rest in the tall grass". Ảnh ô này không có sư tử (cảnh trống, là đáp án câu q5).
> Không nói Việt Nam có xavan, không so mùa ở xavan với mùa ở miền Nam nước mình (`_topic.md` mục Đúng khoa học còn `[CẦN KIỂM]`; mùa ở Việt Nam dạy ở chủ đề Explorer số năm *Thời tiết và các mùa*, bài 4 của chủ đề đó có câu Khởi động ôn ô này bằng ý "mùa khô", không nói miền Nam giống xavan).

### explore
id: 6b987166-826d-426c-b6d3-d2bab270cb6f
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_savanna
label.en: Savanna
label.vi: Đồng cỏ xavan
color: vang_hoe
sentence.en: A savanna has tall grass and few trees.
sentence.vi: Đồng cỏ xavan có cỏ cao và ít cây.
image.brief: [ảnh] Đồng cỏ xavan ở châu Phi chụp rộng, ảnh ngang, trời nắng: thảm cỏ cao trải tới chân trời, cây keo tán rộng và phẳng đứng thưa, đồi thấp phía xa, nhìn rõ là nhiều cỏ và rất ít cây; không có con vật, không có người, xe, đường, lều, khói, lửa hay chữ. Trang gốc phải ghi chụp ở châu Phi, vì ví dụ một của ô nói "ở châu Phi" (alt không có tên nơi). Phải khác hẳn ảnh ô Mùa khô: không cùng ảnh, không cùng góc. Từ khoá tìm ảnh (EN): savanna acacia tree; Masai Mara plains
image.alt.en: A wide plain with a few trees
image.alt.vi: Đồng bằng rộng có vài cây
examples.1.en: in Africa, very far away
examples.1.vi: ở châu Phi, rất xa
examples.2.en: warm all year long
examples.2.vi: trời ấm quanh năm
examples.3.en: lions rest in the tall grass
examples.3.vi: sư tử nằm nghỉ trong đám cỏ cao
> Hình gốc của cả chủ đề (bài 7 câu q4 dùng lại). `alt` không có chữ "grass", vì ảnh là đáp án câu q5 ("Which place is hot, with tall grass?").
> Ví dụ một thay bản đồ (Duy chốt câu 6 = a): nói vị trí bằng lời, như bài 1 nói "tận phía bắc". Ví dụ ba dạy sẵn ý đúng của `lions_live_in_jungle` trước câu q6.
> `brief` sửa 16/11 theo ảnh thật (designer): ảnh chụp ở Masai Mara (Kenya), một cây keo, đồi phía sau, nên bỏ tên Serengeti cả ở lời tả và ở truy vấn đầu (`savanna Serengeti acacia` thành `savanna acacia tree`; mọi chỗ dùng lại ở bài này, bài 7 và bảng từ khoá ở `_topic.md` chép theo). Ví dụ một "in Africa, very far away" vẫn đúng với ảnh; chữ bé nghe không nêu Serengeti nên không đổi. `alt` giữ.
> Ví dụ hai sửa 16/11 (tester n10): "hot all year long" · "trời nóng quanh năm" nói hơi mạnh (xavan Đông Phi ở cao, ban đêm mát); điều không đổi giữa hai mùa là trời ấm, nhiệt độ ít chênh. Ý chính một và câu q5 vẫn nói "hot" (ban ngày nóng), không mâu thuẫn.
> [CẦN KIỂM] Xavan châu Phi ấm quanh năm (nhiệt độ ít đổi giữa hai mùa, chủ yếu lượng mưa đổi; ban ngày nóng); sư tử châu Phi sống ở xavan, đồng cỏ, rừng thưa, hay nằm nghỉ trong cỏ, không sống trong rừng mưa nhiệt đới rậm.

#### group explore_dry
label.en: Dry season
label.vi: Mùa khô
color: nau_dat
sentence.en: In the dry season, the grass turns yellow.
sentence.vi: Vào mùa khô, cỏ chuyển sang màu vàng.
image.brief: [ảnh] Đồng cỏ xavan châu Phi vào mùa khô: thảm cỏ khô màu vàng, cao, phủ kín phần gần, vài cây thưa ở xa, trời nắng; ảnh ngang chụp rộng; không có con vật, không có người, xe, khói, lửa, đất cháy đen hay chữ. Khác hẳn ảnh ô Đồng cỏ xavan: không cùng ảnh, không cùng góc. Không cần ảnh cặp mùa mưa (proposal mục 7 đã bỏ). Từ khoá tìm ảnh (EN): savanna dry season; dry grass savanna; dry savanna grassland
image.alt.en: Yellow grass in the dry season
image.alt.vi: Cỏ vàng mùa khô
examples.1.en: very little rain falls
examples.1.vi: trời rất ít mưa
examples.2.en: pools of water dry up
examples.2.vi: các vũng nước cạn dần
examples.3.en: in the rainy season, grass turns green
examples.3.vi: vào mùa mưa, cỏ lại xanh tươi
> Hình gốc (câu q2, từ `dry_season`). Ảnh cũng phải thấy cỏ cao và ít cây, vì câu q2 ("A savanna has tall grass and few trees.") dùng ảnh này và gợi ý câu đó bảo bé nhìn cỏ và cây.
> Mùa mưa chỉ nói bằng lời ở ví dụ ba, không có ảnh (luật `_topic.md`: không câu hỏi nào dựa vào ảnh mùa). Ví dụ hai nối sang ô "Herd" (vì sao đàn thú phải đi xa tìm nước). Không nói cháy cỏ (mục An toàn: không cháy rừng).
> [CẦN KIỂM] Mùa khô ở xavan: cỏ khô vàng, các vũng nước cạn dần; mùa mưa cỏ mọc xanh lại.

#### group explore_herd
label.en: Herd
label.vi: Đàn thú
color: cham
sentence.en: Big herds walk far to find water.
sentence.vi: Những đàn thú lớn đi rất xa để tìm nước.
image.brief: [ảnh] Một đàn linh dương đầu bò rất đông trên đồng cỏ xavan, ảnh ngang, thấy rõ rất nhiều con đứng, đi sát nhau; vài con ngựa vằn đi lẫn trong đàn cũng được; không có cảnh lội qua sông, không cá sấu, không sư tử, không con vật bị thương hay nằm chết, không có người, xe, khinh khí cầu hay chữ. Ảnh dùng ở khung vuông (Học; món Chơi cần một mục cắt vuông riêng thấy rõ vài con), thẻ ba lựa chọn rất ngang (câu q3) và thẻ hai lựa chọn ở bài 7. Từ khoá tìm ảnh (EN): wildebeest herd; Connochaetes taurinus; wildebeest migration
image.alt.en: Many wildebeest together
image.alt.vi: Rất nhiều linh dương đầu bò
examples.1.en: many wildebeest walk together
examples.1.vi: rất nhiều linh dương đầu bò đi cùng nhau
examples.2.en: zebras often walk with them
examples.2.vi: ngựa vằn thường đi cùng
examples.3.en: they follow the rain to green grass
examples.3.vi: cả đàn đi theo mưa, tới nơi cỏ xanh
> Hình gốc của cả chủ đề (bài 7 câu w1 dùng lại). Câu chính dạy sẵn chữ "walk far" cho câu q3 (dòng "Chữ cần dạy trước khi hỏi" ở `_topic.md`) và cho câu w1 bài 7.
> [CẦN KIỂM] Đàn linh dương đầu bò đi xa theo mưa để tìm cỏ và nước (vùng Serengeti, Masai Mara); ngựa vằn thường đi cùng đàn.
> `brief` sửa 16/11 theo ảnh thật (designer): đàn rất đông đứng sát nhau ở Maasai Mara mùa di cư, chụp gần hơn brief cũ, không thành hàng dài; bỏ "nối nhau thành hàng dài" và "chụp từ xa". `alt` giữ; câu chính và ví dụ nói chuyện đi xa của cả đàn, không tả dáng trong ảnh, nên không đổi.

#### group explore_giraffe
label.en: Giraffe
label.vi: Hươu cao cổ
color: gi_dong
sentence.en: Giraffes eat leaves from tall trees.
sentence.vi: Hươu cao cổ ăn lá trên những cây cao.
image.brief: Dùng lại hình `tray_africa` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): savanna giraffe acacia
image.alt.en: A giraffe on wide grassland
image.alt.vi: Hươu cao cổ trên đồng cỏ rộng
examples.1.en: a very long neck
examples.1.vi: cái cổ rất dài
examples.2.en: even taller than an elephant
examples.2.vi: còn cao hơn cả con voi
examples.3.en: big brown spots all over
examples.3.vi: những đốm nâu to khắp mình
> Ảnh gốc ở vườn quốc gia Nairobi (châu Phi), chụp từ xa cạnh cây tán rộng (`_topic.md` mục Hình của chủ đề khác). Ví dụ hai chuẩn bị câu q4 (xếp từ thấp tới cao) và thẻ thưởng.
> [CẦN KIỂM] Hươu cao cổ ăn lá cây cao (cây keo); cao hơn voi châu Phi (tính tới đỉnh đầu).

### new_words
id: af671947-7601-40cd-94b7-a8f189ed37e7
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: savanna, herd

## Chơi

> Bé chọn ba con vật sống ở đồng cỏ xavan, mỗi con ăn một thứ: ăn cỏ (ngựa vằn, linh dương đầu bò), ăn lá cây (hươu cao cổ, voi), ăn thịt (sư tử). Đạt khi đủ ba nhóm và không chọn con vật nơi khác.
> Món bẫy giống một nhóm về cách ăn nhưng sống nơi khác: con trâu ăn cỏ (ở ruộng, chuồng quê mình), con lười ăn lá (rừng mưa, bài 3), gấu trắng ăn thịt (Bắc Cực, bài 1). Bé phải nghĩ về nơi sống, không chọn chỉ theo thức ăn. Cả ba bẫy là con vật bé đã gặp.
> Nhóm ăn thịt chỉ nói bằng lời "ăn thịt"; ảnh sư tử nằm nghỉ; không chuỗi, không mũi tên, không cảnh săn mồi (ranh giới *Chuỗi thức ăn*; `_topic.md` Còn mở số ba chờ PM xác nhận).
> Kệ tám món, toàn ảnh chụp.

### tray
id: 39e87ff7-8327-4de0-baf6-79b799185d06
type: build_tray
version: 1
prompt.en: Pick three savanna animals
prompt.vi: Chọn ba con vật sống ở đồng cỏ xavan
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find animals that eat grass, leaves and meat.
messages.start.vi: Em tìm con ăn cỏ, con ăn lá cây và con ăn thịt nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! They all live on the savanna.
messages.balanced.vi: Tuyệt! Cả ba con đều sống ở đồng cỏ xavan.
messages.has_limited.en: That one does not live on the savanna.
messages.has_limited.vi: Con này không sống ở đồng cỏ xavan.
messages.missing.tray_grass.en: You still need an animal that eats grass.
messages.missing.tray_grass.vi: Em còn thiếu một con ăn cỏ.
messages.missing.tray_leaves.en: You still need an animal that eats leaves.
messages.missing.tray_leaves.vi: Em còn thiếu một con ăn lá cây.
messages.missing.tray_meat.en: You still need an animal that eats meat.
messages.missing.tray_meat.vi: Em còn thiếu một con ăn thịt.
> Lời nhắn `has_limited` đúng với cả ba món bẫy (trâu, con lười, gấu trắng đều không sống ở đồng cỏ xavan).
> [CẦN KIỂM] Ảnh bẫy là trâu nước (Bubalus bubalis, con trâu quê mình), không sống ở xavan châu Phi. Xavan châu Phi có trâu rừng châu Phi (Syncerus caffer), một loài khác, tiếng Anh cũng gọi là "buffalo". Vì vậy nhãn EN ghi "Water buffalo" (VI giữ "Con trâu"), để không lẫn với trâu rừng châu Phi.

#### group tray_grass
label.en: Eats grass
label.vi: Ăn cỏ
color: vang_hoe
role: required

#### group tray_leaves
label.en: Eats leaves
label.vi: Ăn lá cây
color: gi_dong
role: required

#### group tray_meat
label.en: Eats meat
label.vi: Ăn thịt
color: nau_dat
role: required

#### group tray_not
label.en: Not a savanna animal
label.vi: Không sống ở đồng cỏ xavan
color: do_son
role: limit

#### item tray_zebra
label.en: Zebra
label.vi: Ngựa vằn
group: tray_grass
image.brief: [ảnh] Một con ngựa vằn đứng trên đồng cỏ xavan châu Phi, nhìn ngang, thấy cả con và sọc đen trắng rõ; ảnh ngang có khoảng trống quanh con vật (dùng khung vuông kệ Chơi, thẻ ba lựa chọn rất ngang câu q1, thẻ vuông câu q4 và hình từ zebra); không có người, xe, hàng rào, vòng cổ, sư tử, cảnh săn mồi hay chữ. Ảnh khó (Commons khoảng bốn ảnh qua luật): nếu chỉ có ảnh đàn ngựa vằn thì designer cắt riêng một con cho từng khung; tìm thêm ở Openverse. Nếu ảnh không chụp ở Serengeti thì bỏ tên nơi ở brief (alt không có tên nơi). Từ khoá tìm ảnh (EN): zebra Serengeti; Equus quagga; zebra Botswana
image.alt.en: A zebra on the plain
image.alt.vi: Ngựa vằn trên đồng rộng
> Hình gốc (câu q1, q4, từ `zebra`). Một ảnh cho mọi chỗ (proposal mục 7 ý 3).
> [CẦN KIỂM] Ngựa vằn ăn cỏ.

#### item tray_sloth
label.en: Sloth
label.vi: Con lười
group: tray_not
image.brief: Dùng lại hình `explore_trees` ở bài `noi-song-tren-trai-dat/rung-mua-nhiet-doi`. Từ khoá tìm ảnh (EN): Bradypus sloth
image.alt.en: A sloth hanging from a branch
image.alt.vi: Con lười treo trên cành cây

#### item tray_giraffe
label.en: Giraffe
label.vi: Hươu cao cổ
group: tray_leaves
image.brief: Dùng lại hình `tray_africa` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): savanna giraffe acacia
image.alt.en: A giraffe on wide grassland
image.alt.vi: Hươu cao cổ trên đồng cỏ rộng

#### item tray_lion
label.en: Lion
label.vi: Sư tử
group: tray_meat
image.brief: [ảnh] Một con sư tử hoang dã nằm nghỉ trên nền đất ở xavan, miệng khép, mắt mở hoặc lim dim, nhìn ngang, thấy cả con; ảnh ngang có khoảng trống quanh con vật (khung vuông kệ Chơi); không có con mồi, máu, xác, không há miệng nhe nanh, không có người, xe safari, vòng cổ hay chữ. Câu q6 cần một mục cắt riêng sát con sư tử, nền mờ, không thấy rõ cỏ hay cây phía sau. Từ khoá tìm ảnh (EN): lion savanna; Panthera leo resting
image.alt.en: A lion resting
image.alt.vi: Sư tử đang nằm nghỉ
> Hình gốc (câu q6). Truy vấn ngắn: `lion resting savanna grass` ra không ảnh nào, `lion savanna` ra hai mươi bảy (proposal mục 7).
> `brief` sửa 16/11 theo ảnh thật (designer): sư tử đực hoang dã nằm nghỉ trên nền đất trống, miệng khép (Ngorongoro, Tanzania), nên "trên cỏ khô" thành "trên nền đất". `alt` giữ. Ví dụ ba ô "Savanna" ("lions rest in the tall grass") nói chung về sư tử, đi với ảnh đồng cỏ trống, không đi với ảnh này, nên không đổi.

#### item tray_buffalo
label.en: Water buffalo
label.vi: Con trâu
group: tray_not
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu

#### item tray_wildebeest
label.en: Wildebeest
label.vi: Linh dương đầu bò
group: tray_grass
image.brief: Dùng lại hình `explore_herd`. Từ khoá tìm ảnh (EN): wildebeest herd
image.alt.en: Many wildebeest together
image.alt.vi: Rất nhiều linh dương đầu bò
> Ảnh đàn; designer làm mục cắt vuông riêng thấy rõ một vài con, để món tên "Wildebeest" (số ít) khớp hình.
> [CẦN KIỂM] Linh dương đầu bò ăn cỏ.

#### item tray_bear
label.en: Polar bear
label.vi: Gấu trắng
group: tray_not
image.brief: Dùng lại hình `explore_bear` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): polar bear sea ice
image.alt.en: A polar bear on floating ice
image.alt.vi: Gấu trắng trên tảng băng trôi

#### item tray_elephant
label.en: Elephant
label.vi: Con voi
group: tray_leaves
image.brief: [ảnh] Một con voi châu Phi đứng hoặc đi trên đồng cỏ xavan, nhìn thẳng, thấy cả con, rõ đôi tai rất to xoè rộng và cặp ngà; ảnh ngang có khoảng trống quanh con vật (dùng khung vuông kệ Chơi và thẻ vuông câu q4); không phải voi châu Á (tai nhỏ); không có người cưỡi, xích, hàng rào, xe, vòng cổ hay chữ. Ảnh khó (Commons khoảng hai ảnh qua luật, một CC0 ở Masai Mara, một CC BY ở Zambia): tìm thêm ở Openverse; một ảnh dùng cho cả hai chỗ. Từ khoá tìm ảnh (EN): Loxodonta africana; African elephant savanna
image.alt.en: An African elephant
image.alt.vi: Voi châu Phi
> Hình gốc (câu q4). Không dùng voi châu Á `explore_big_small` của *Gọi tên và nhóm động vật* (luật Explorer số bảy).
> `brief` sửa 16/11 theo ảnh thật (designer): voi đứng nhìn thẳng, hai tai xoè, cặp ngà, nên "nhìn ngang" thành "nhìn thẳng". `alt` giữ.
> [CẦN KIỂM] Voi châu Phi ăn nhiều lá cây, cành non (cũng ăn cỏ); xếp vào nhóm "ăn lá cây" ở kệ Chơi.

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q3, q5; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ).
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính (app Explorer ẩn hình câu hỏi khi mọi lựa chọn có hình). Câu nào cũng tự đủ nghĩa khi chỉ nghe.
> Ranh giới Oak: không câu nào hỏi voi sống ở đâu (cặp voi với xavan của quiz Oak Science); voi chỉ ở kệ Chơi và câu q4.

### q1
id: ef0fa17f-5d59-4f3d-9c38-57e04ccabb96
format: single_choice
version: 1
dok: 1
prompt.en: Which animal lives on the savanna?
prompt.vi: Con nào sống ở đồng cỏ xavan?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of hot, wide land with tall grass.
hint.vi: Em nghĩ tới vùng đất rộng, nóng, có cỏ cao nhé.
explanation_correct.en: Yes! Zebras eat the tall grass there.
explanation_correct.vi: Đúng rồi! Ngựa vằn ăn cỏ cao ở đó.
explanation_wrong.en: The answer is the zebra. It eats savanna grass.
explanation_wrong.vi: Đáp án là ngựa vằn. Ngựa vằn ăn cỏ ở đồng cỏ xavan.
> Hai lựa chọn sai là con vật của hai nơi bé đã học trong chủ đề (Nam Cực, rừng mưa); đáp án là món bé vừa gặp ở kệ Chơi, không phải ảnh mới duy nhất.

#### option q1_emperor
correct: false
feedback.en: An emperor penguin lives on icy land.
feedback.vi: Chim cánh cụt hoàng đế sống ở vùng đất phủ băng.
label.en: emperor penguin
label.vi: chim cánh cụt hoàng đế
image.brief: Dùng lại hình `tray_emperor` ở bài `noi-song-tren-trai-dat/nam-cuc`. Từ khoá tìm ảnh (EN): Aptenodytes forsteri
image.alt.en: An emperor penguin on the ice
image.alt.vi: Chim cánh cụt hoàng đế trên băng

#### option q1_zebra
correct: true
label.en: zebra
label.vi: ngựa vằn
image.brief: Dùng lại hình `tray_zebra`. Từ khoá tìm ảnh (EN): zebra Serengeti
image.alt.en: A zebra on the plain
image.alt.vi: Ngựa vằn trên đồng rộng

#### option q1_sloth
correct: false
feedback.en: A sloth hangs in rainforest trees.
feedback.vi: Con lười treo mình trên cây ở rừng mưa nhiệt đới.
label.en: sloth
label.vi: con lười
image.brief: Dùng lại hình `explore_trees` ở bài `noi-song-tren-trai-dat/rung-mua-nhiet-doi`. Từ khoá tìm ảnh (EN): Bradypus sloth
image.alt.en: A sloth hanging from a branch
image.alt.vi: Con lười treo trên cành cây

### q2
id: 8735a9ba-73f7-4339-a75c-099c28670e8d
format: true_false
version: 1
dok: 1
prompt.en: A savanna has tall grass and few trees.
prompt.vi: Đồng cỏ xavan có cỏ cao và ít cây.
image.brief: Dùng lại hình `explore_dry`. Từ khoá tìm ảnh (EN): savanna dry season
image.alt.en: Yellow grass in the dry season
image.alt.vi: Cỏ vàng mùa khô
answer: true
hint.en: Look at the grass and the trees.
hint.vi: Em nhìn cỏ và cây trong hình nhé.
explanation_correct.en: Yes! Zebras and wildebeest eat that grass.
explanation_correct.vi: Đúng rồi! Ngựa vằn và linh dương đầu bò ăn cỏ ở đó.
explanation_wrong.en: This is true. A savanna is mostly tall grass.
explanation_wrong.vi: Câu này đúng. Đồng cỏ xavan phần lớn là cỏ cao.
feedback_false.en: Tall grass grows almost everywhere there.
feedback_false.vi: Ở đó, cỏ cao mọc gần như khắp nơi.
> DOK 1: nhớ lại câu chính ô "Savanna", kèm quan sát ảnh (như câu q2 bài 1). Ảnh mùa khô chỉ làm nền; câu không hỏi về mùa. Gợi ý trỏ tới điều nhìn thấy, không trỏ tới ô Học.

### q3
id: 388b1b3f-04cb-4627-b9c3-e376abadf333
format: single_choice
version: 1
dok: 1
prompt.en: Which ones walk far in big herds?
prompt.vi: Con nào đi rất xa thành đàn lớn?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about the dry season on the savanna.
hint.vi: Em nghĩ tới mùa khô ở đồng cỏ xavan nhé.
explanation_correct.en: Yes! Wildebeest walk far to find water.
explanation_correct.vi: Đúng rồi! Linh dương đầu bò đi rất xa để tìm nước.
explanation_wrong.en: The answer is the wildebeest herd. They walk far together.
explanation_wrong.vi: Đáp án là đàn linh dương đầu bò. Cả đàn cùng đi rất xa.
> Chữ "walk far" dạy ở câu chính ô "Herd". Gợi ý là cách nghĩ (mùa khô, vũng nước cạn, phải đi tìm nước), không trỏ tới ô "Herd".
> Hai lựa chọn sai là con vật ít đi xa bé đã học (con lười ở bài 3, con còng ở bài 4). Ba ảnh khác nhau rõ bằng mắt.

#### option q3_sloth
correct: false
feedback.en: A sloth moves slowly and stays in trees.
feedback.vi: Con lười đi rất chậm và ở trên cây.
label.en: sloth
label.vi: con lười
image.brief: Dùng lại hình `explore_trees` ở bài `noi-song-tren-trai-dat/rung-mua-nhiet-doi`. Từ khoá tìm ảnh (EN): Bradypus sloth
image.alt.en: A sloth hanging from a branch
image.alt.vi: Con lười treo trên cành cây

#### option q3_crab
correct: false
feedback.en: A fiddler crab stays near its mud hole.
feedback.vi: Con còng ở gần cái hang trong bùn.
label.en: fiddler crab
label.vi: con còng
image.brief: Dùng lại hình `explore_crab` ở bài `noi-song-tren-trai-dat/rung-ngap-man-va-dam-lay`. Từ khoá tìm ảnh (EN): fiddler crab
image.alt.en: A fiddler crab on the mud
image.alt.vi: Con còng trên bùn
> [CẦN KIỂM] Con còng sống quanh cái hang của nó trong bùn, ít đi xa.

#### option q3_herd
correct: true
label.en: wildebeest herd
label.vi: đàn linh dương đầu bò
image.brief: Dùng lại hình `explore_herd`. Từ khoá tìm ảnh (EN): wildebeest herd
image.alt.en: Many wildebeest together
image.alt.vi: Rất nhiều linh dương đầu bò

### q4
id: 85ea40b0-c016-4f7e-87d4-35d4f5e588ca
format: order_sequence
version: 1
dok: 2
prompt.en: Order from shortest to tallest.
prompt.vi: Xếp từ thấp nhất tới cao nhất.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_zebra, q4_elephant, q4_giraffe
hint.en: Imagine them side by side in real life.
hint.vi: Em tưởng tượng ba con đứng cạnh nhau ngoài đời nhé.
explanation_correct.en: Yes! A long neck makes the giraffe tallest.
explanation_correct.vi: Đúng rồi! Nhờ cái cổ dài, hươu cao cổ cao nhất.
explanation_wrong.en: The order is zebra, elephant, giraffe.
explanation_wrong.vi: Thứ tự là ngựa vằn, voi, hươu cao cổ.
> DOK 2: so sánh ba con vật theo hiểu biết ngoài đời (ví dụ hai ô "Giraffe": "even taller than an elephant"). Ba thẻ phải cho con vật cùng cỡ trong khung vuông (Ghi chú cho hoạ sĩ), để bé không xếp theo cỡ hình. Thẻ trong file không theo thứ tự đúng; chỉ một thứ tự đúng.
> Gợi ý nói "ngoài đời" để bé không nhìn cỡ hình (như câu q4 của *Gọi tên và nhóm động vật* bài hai). `order_sequence` không có `feedback`.
> [CẦN KIỂM] Ngựa vằn thấp hơn voi châu Phi, voi thấp hơn hươu cao cổ (đo tới đỉnh đầu).

#### item q4_giraffe
label.en: giraffe
label.vi: hươu cao cổ
image.brief: Dùng lại hình `tray_africa` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): savanna giraffe acacia
image.alt.en: A giraffe on wide grassland
image.alt.vi: Hươu cao cổ trên đồng cỏ rộng
> Mục cắt vuông riêng, sát con hươu, bỏ cây tán rộng bên cạnh (cây làm thước đo chiều cao).

#### item q4_zebra
label.en: zebra
label.vi: ngựa vằn
image.brief: Dùng lại hình `tray_zebra`. Từ khoá tìm ảnh (EN): zebra Serengeti
image.alt.en: A zebra on the plain
image.alt.vi: Ngựa vằn trên đồng rộng

#### item q4_elephant
label.en: elephant
label.vi: con voi
image.brief: Dùng lại hình `tray_elephant`. Từ khoá tìm ảnh (EN): Loxodonta africana
image.alt.en: An African elephant
image.alt.vi: Voi châu Phi

### q5
id: 8031b951-ff01-49b6-b444-b23f2bfc3ab3
format: single_choice
version: 1
dok: 2
prompt.en: Which place is hot, with tall grass?
prompt.vi: Nơi nào nóng và có cỏ cao?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about where zebras find their food.
hint.vi: Em nghĩ xem ngựa vằn tìm thức ăn ở đâu nhé.
explanation_correct.en: Yes! Lions rest in that tall grass.
explanation_correct.vi: Đúng rồi! Sư tử nằm nghỉ trong đám cỏ cao ấy.
explanation_wrong.en: The answer is the savanna. Tall grass grows there.
explanation_wrong.vi: Đáp án là đồng cỏ xavan. Ở đó cỏ mọc cao.
> DOK 2: áp ý chính một vào ba nơi, xét cùng lúc hai điều (nóng và cỏ cao). Rừng mưa cũng nóng nhưng đầy cây cao; băng biển không nóng, không cỏ. Ba cảnh khác nhau rõ bằng mắt; hai lựa chọn sai là ô Học của bài 1 và bài 3.
> `alt` của đáp án không có chữ "grass", "hot". Giải thích đúng nhắc lại ví dụ ba ô "Savanna" ngay trước câu q6.
> `hint` giữ (tester n2, 16/11): ngựa vằn không có trên màn, bé vẫn phải nhớ nơi sống của ngựa vằn rồi so với ba cảnh; câu thay "Think about where tall grass grows best." lại nhắc chữ "grass" của câu hỏi.

#### option q5_savanna
correct: true
label.en: savanna
label.vi: đồng cỏ xavan
image.brief: Dùng lại hình `explore_savanna`. Từ khoá tìm ảnh (EN): savanna acacia tree
image.alt.en: A wide plain with a few trees
image.alt.vi: Đồng bằng rộng có vài cây

#### option q5_rainforest
correct: false
feedback.en: This rainforest is full of tall trees.
feedback.vi: Rừng mưa nhiệt đới này đầy cây cao.
label.en: rainforest
label.vi: rừng mưa nhiệt đới
image.brief: Dùng lại hình `explore_vietnam` ở bài `noi-song-tren-trai-dat/rung-mua-nhiet-doi`. Từ khoá tìm ảnh (EN): Cat Tien forest
image.alt.en: Tall trees in a thick forest
image.alt.vi: Cây cao trong khu rừng rậm

#### option q5_ice
correct: false
feedback.en: This sea ice is very cold.
feedback.vi: Băng biển này rất lạnh.
label.en: sea ice
label.vi: băng biển
image.brief: Dùng lại hình `explore_ice` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Arctic sea ice
image.alt.en: Sea ice on a cold sea
image.alt.vi: Băng nổi trên biển lạnh

### q6
id: f9528334-2590-4ba5-b50f-d4bffdbd908a
format: true_false
version: 1
dok: 2
misconception: lions_live_in_jungle
prompt.en: Lions live in the thick rainforest.
prompt.vi: Sư tử sống trong rừng mưa nhiệt đới rậm rạp.
image.brief: Dùng lại hình `tray_lion`. Từ khoá tìm ảnh (EN): lion savanna
image.alt.en: A lion resting
image.alt.vi: Sư tử đang nằm nghỉ
answer: false
hint.en: Think about where lions lie in the sun.
hint.vi: Em nghĩ xem sư tử nằm phơi nắng ở đâu nhé.
explanation_correct.en: Lions live on the grassy savanna.
explanation_correct.vi: Sư tử sống ở đồng cỏ xavan.
explanation_wrong.en: This is false. Lions live where grass is tall.
explanation_wrong.vi: Câu này sai. Sư tử sống ở nơi có cỏ cao.
feedback_true.en: The rainforest is shady under thick trees.
feedback_true.vi: Rừng mưa nhiệt đới râm mát dưới tán cây dày.
> Câu misconception (`lions_live_in_jungle`), bằng hình, DOK 2: bé còn nhớ câu "sư tử là chúa tể rừng xanh" sẽ chạm gật đầu. Bé áp điều đã học (ví dụ ba ô "Savanna", sư tử ở kệ Chơi đồng cỏ, giải thích câu q5) để bác câu nói. Câu chỉ kiểm một việc: sư tử sống ở rừng mưa rậm hay không.
> Hình là mục cắt riêng của `tray_lion`: sát con sư tử, nền mờ, không thấy cỏ hay cây (`_topic.md` Quy ước hình số tám), nên ảnh không làm bằng chứng cho phía nào.
> Gợi ý là cách nghĩ (sư tử nằm phơi nắng), phản hồi nói rừng mưa râm mát dưới tán cây: hai câu không lặp ý, ghép lại thành lý do.
> `explanation_correct` đứng một mình được, đúng chữ `correction.en` ở `_topic.md`: "Lions live in the thick rainforest." → "Lions live on the grassy savanna.".
> [CẦN KIỂM] Sư tử châu Phi không sống trong rừng mưa nhiệt đới rậm; rừng mưa râm, tán cây dày.

## Từ vựng

### savanna
id: 5a326e80-4a4e-41d9-bae3-5737ab8d02ef
tier: core
term.en: savanna
term.vi: đồng cỏ xavan
example.en: Zebras eat grass on the savanna.
example.vi: Ngựa vằn ăn cỏ trên đồng cỏ xavan.
image.brief: Dùng lại hình `explore_savanna`. Từ khoá tìm ảnh (EN): savanna acacia tree
image.alt.en: A wide plain with a few trees
image.alt.vi: Đồng bằng rộng có vài cây

### herd
id: 377c325e-2ead-4649-b2fb-4c7f6e7f9087
tier: core
term.en: herd
term.vi: đàn thú
example.en: A herd of wildebeest walks far.
example.vi: Một đàn linh dương đầu bò đi rất xa.
image.brief: Dùng lại hình `explore_herd`. Từ khoá tìm ảnh (EN): wildebeest herd
image.alt.en: Many wildebeest together
image.alt.vi: Rất nhiều linh dương đầu bò

### zebra
id: b2c7d6f8-8dd7-4fd6-9361-da7c5deb1b1c
tier: extra
term.en: zebra
term.vi: ngựa vằn
example.en: A zebra has black and white stripes.
example.vi: Ngựa vằn có sọc đen và sọc trắng.
image.brief: Dùng lại hình `tray_zebra`. Từ khoá tìm ảnh (EN): zebra Serengeti
image.alt.en: A zebra on the plain
image.alt.vi: Ngựa vằn trên đồng rộng

### giraffe
id: 0934ecba-a465-4b60-9948-75088d03d5af
tier: extra
term.en: giraffe
term.vi: hươu cao cổ
example.en: A giraffe has a very long neck.
example.vi: Hươu cao cổ có cái cổ rất dài.
image.brief: Dùng lại hình `tray_africa` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): savanna giraffe acacia
image.alt.en: A giraffe on wide grassland
image.alt.vi: Hươu cao cổ trên đồng cỏ rộng

### dry_season
id: c1622d23-881b-43e0-b362-ce00d0cf535f
tier: extra
term.en: dry season
term.vi: mùa khô
example.en: Little rain falls in the dry season.
example.vi: Mùa khô trời rất ít mưa.
image.brief: Dùng lại hình `explore_dry`. Từ khoá tìm ảnh (EN): savanna dry season
image.alt.en: Yellow grass in the dry season
image.alt.vi: Cỏ vàng mùa khô
> Chỉ là từ đọc thêm, không câu hỏi nào dùng (mùa dạy ở chủ đề Explorer số năm *Thời tiết và các mùa*; bài 4 của chủ đề đó nâng `dry_season` lên `core`, cố ý trùng từ này).

## Thưởng

### giraffe_card
id: 271a2bc7-5f9b-43e6-8d91-00bb67d860db
set: animals
rarity: common
name.en: Giraffe
name.vi: Hươu cao cổ
tag.en: Eats from the treetops
tag.vi: Ăn lá trên ngọn cây
fact.en: It is the tallest animal on land.
fact.vi: Hươu cao cổ là con vật cao nhất trên cạn.
image.brief: Dùng lại hình `tray_africa` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): savanna giraffe acacia
image.alt.en: A giraffe on wide grassland
image.alt.vi: Hươu cao cổ trên đồng cỏ rộng
> [CẦN KIỂM] Hươu cao cổ là con vật cao nhất trên cạn.
> Bộ `set: animals` đã có; hươu cao cổ chưa có thẻ. `tag` dùng lại "treetops" (từ `core` của bài 3).

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Không bản đồ, không quả địa cầu. Con vật hoang dã: không chuồng, hàng rào sở thú, vòng cổ, người, xe safari, khinh khí cầu, chữ. Không cảnh săn mồi, con mồi, máu, xác; sư tử nằm nghỉ, miệng khép. Không cảnh cháy cỏ, đất cháy đen.
- **Ảnh mới (sáu):** đồng cỏ xavan có cây keo, không con vật (`explore_savanna`); xavan mùa khô cỏ vàng (`explore_dry`); đàn linh dương đầu bò (`explore_herd`); ngựa vằn (`tray_zebra`); voi châu Phi (`tray_elephant`); sư tử nằm nghỉ (`tray_lion`). Sáu ảnh đều là hình gốc của cả chủ đề (bảng Hình dùng chung ở `_topic.md`): giữ đúng key và `alt`.
- **Ảnh dùng lại:**
  - trong chủ đề: `tray_emperor` bài 2 (q1); `explore_trees` bài 3 (kệ Chơi, q1, q3); `explore_vietnam` bài 3 (q5); `explore_crab` bài 4 (q3); `explore_ice` bài 1 (q5); `explore_bear` bài 1 (gấu trắng: kệ Chơi) và `tray_croc` bài 1 (cá sấu: w2), từ 16/11 thay `tray_arctic` của *Bề mặt Trái Đất* và `q1_reptiles` của *Khủng long*;
  - chủ đề khác: *Bề mặt Trái Đất* bài hai `tray_africa` (hươu cao cổ: ô Học, kệ Chơi, q4, từ, thẻ); *Hô hấp* bài một `q4` (rạn san hô: w1); *Khủng long* `w1_buffalo` (trâu: kệ Chơi); *Gọi tên và nhóm động vật* `w1` (hàng rào tre: hình câu q1, q3, q4, q5).
- **Một ảnh, nhiều khung** (làm mục `crop` riêng cho từng khung):
  - ngựa vằn: vuông (kệ Chơi, q4, từ) và thẻ ba lựa chọn rất ngang 5:2 (q1);
  - đàn linh dương đầu bò: ngang (Học, từ), vuông thấy rõ vài con (món Chơi "Wildebeest"), 5:2 (q3), 17:10 (bài 7 w1);
  - sư tử: vuông (kệ Chơi) và một mục cắt sát, nền mờ cho câu q6 (không thấy cỏ hay cây);
  - câu q4: ba thẻ vuông, ngựa vằn, voi, hươu cao cổ **cùng cỡ con vật trong khung**; ảnh hươu cao cổ cắt bỏ cây tán rộng bên cạnh (cây làm thước đo).
- **Ảnh khó:**
  - ngựa vằn (Commons khoảng bốn ảnh qua luật) và voi châu Phi (khoảng hai): mỗi loài một ảnh cho mọi chỗ; tìm thêm Openverse nếu cần;
  - đàn linh dương đầu bò: tránh cảnh lội sông có cá sấu, cảnh sư tử đuổi;
  - xavan mùa khô: tránh ảnh có lửa, khói, đất cháy;
  - đồng cỏ xavan: trang gốc phải ghi châu Phi (ví dụ một của ô Học nói "ở châu Phi"). Ảnh đã chọn chụp ở Masai Mara, `brief` đã bỏ tên Serengeti (16/11).
- **Cần kiểm ảnh dùng lại (xong 16/11):** `q1_reptiles` (*Khủng long*) há miệng thấy răng; designer đã đổi sang ảnh cá sấu Xiêm miệng khép (`tray_croc` bài 1). `hint` câu w2 đổi theo (không còn thấy răng trong ảnh).
- **Màu:** Học: đồng cỏ xavan `vang_hoe`, mùa khô `nau_dat`, đàn thú `cham`, hươu cao cổ `gi_dong`. Chơi: ăn cỏ `vang_hoe`, ăn lá cây `gi_dong`, ăn thịt `nau_dat`, không sống ở đồng cỏ xavan `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (savanna, herd). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món. Khởi động `true_false` (w1 Sai, w2 Sai). Quiz `single_choice` (q1, q3, q5; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ, `answer: q4_zebra, q4_elephant, q4_giraffe`). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`lions_live_in_jungle`). Không có `labels` ở câu `true_false`.
- **Vị trí đáp án:** app xáo lựa chọn (SK-047). Thứ tự trong file theo bảng ở `_topic.md`: q1 đáp án ở chỗ hai, q3 chỗ ba, q5 chỗ một. Thẻ `order_sequence` trong file không theo thứ tự đúng.
- **Màn Chơi, ví dụ để kiểm:** Ngựa vằn, Hươu cao cổ, Sư tử → `balanced`; Linh dương đầu bò, Con voi, Sư tử → `balanced`; Con trâu, Hươu cao cổ, Sư tử → `has_limited`; Ngựa vằn, Con lười, Gấu trắng → `has_limited`; Ngựa vằn, Linh dương đầu bò, Sư tử → `missing.tray_leaves`.
- **Khởi động trỏ sang bài khác:** w1 → `noi-song-tren-trai-dat/bien-va-dai-duong` (bài 5, cần có id trước: chạy `ids` theo thứ tự bài), w2 → `goi-ten-va-nhom-dong-vat/con-vat-an-gi` (đã có id).
- **Key món khác key nhóm:** nhóm `tray_grass`, `tray_leaves`, `tray_meat`, `tray_not`; món `tray_zebra`, `tray_wildebeest`, `tray_giraffe`, `tray_elephant`, `tray_lion`, `tray_buffalo`, `tray_sloth`, `tray_bear`.
- **Từ EN có thể ngoài Starters/Movers:** savanna, herd, wildebeest, zebra, giraffe, coral reef, crocodile, jaws, emperor penguin, sloth, fiddler crab, rainforest, sea ice, plain, season, pools, spots, shady, grassy. Nghe thử giọng EN đọc "savanna", "wildebeest"; giọng VI đọc "xavan", "linh dương đầu bò".
