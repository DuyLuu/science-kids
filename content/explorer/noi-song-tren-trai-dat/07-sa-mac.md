---
id: ead3df2f-8be3-4dd1-a9b8-3796d7e021a0
topic: noi-song-tren-trai-dat
slug: sa-mac
order: 7
stage: apply
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Deserts
vi: Sa mạc
> Giữ đúng tên ở `content/syllabus.json` (key `new-habitats-around-the-world`, bài số bảy).

## Mục tiêu
en: I can say how animals live in deserts.
vi: Em biết con vật sống ở sa mạc ra sao.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 16/11/2026. Ticket SK-048. Mọi dòng `id:` để trống; chạy `ids` sau `_topic.md` và bài 1 đến 6 (câu w1 trỏ bài 6, câu w3 trỏ bài 1).
> Sườn một phần: Oak Địa lý Year 2, unit 4 *Hot places*, lesson 3 `hot-deserts-climate-and-location` (`docs/oak/geography-y2-cold-and-hot-places.md`). Dùng ý, viết lại: Xa-ha-ra là sa mạc nóng rất rộng ở châu Phi; ban ngày rất nóng, rất ít mưa; ít sự sống (nói "ít", không nói "không có"). Không chép câu quiz. Bỏ con người, người Tuareg, ý "Xa-ha-ra đang rộng ra" (biến đổi khí hậu), câu "cây ở sa mạc là xương rồng", con số người sống ở đó. Lesson đó không nêu tên con vật nào; loài theo `_topic.md`.
> Bài `apply`: so sánh với bài 1 (cáo Bắc Cực: câu w3, câu q5, món bẫy), bài 3 và bài 6 (câu q4 từ khô tới ướt), bài 5 (rùa biển, câu q1). Sửa `camel_hump_water` ở ví dụ một ô Học "Camel" và câu q6 (gắn key).

## Ý chính
1.en: A desert is very dry. Rain is rare.
1.vi: Sa mạc rất khô, hiếm khi có mưa.
2.en: Days are hot. Nights can be cold.
2.vi: Ban ngày nóng. Ban đêm có thể lạnh.
3.en: Some animals hide from the sun all day.
3.vi: Có con vật trốn nắng suốt ban ngày.
> Từ cụ thể tới trừu tượng: điều nhìn thấy (khô, ít mưa), rồi điều phải nghĩ mới biết (ngày nóng, đêm lạnh: chỉ nói bằng lời, không có ảnh đêm), rồi cách con vật sống ở đó (trốn nắng). Nói "giúp", không nói con vật "thay đổi để" (Duy chốt câu 5 = a).
> [CẦN KIỂM] Ở Xa-ha-ra ban ngày rất nóng, ban đêm có thể lạnh; cáo fennec ngủ trong hang ban ngày, ra ngoài ban đêm.

## Khởi động

> Ba câu, theo bảng Khởi động ở `_topic.md`: w1 ôn bài ngay trước (bài 6, đàn thú đi xa tìm nước); w2 ôn *Gọi tên và nhóm động vật* bài ba (mốc dài: thằn lằn da khô phủ vảy, chuẩn bị nhóm "Has scales" ở phần Chơi); w3 ôn bài 1 (cách sáu bài: cáo Bắc Cực tai nhỏ, chuẩn bị câu q5).

### w1
id: 20a2e18e-4ae4-41e9-be84-383fde2c0ea0
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: noi-song-tren-trai-dat/dong-co-xavan
prompt.en: Which ones walk far to find water?
prompt.vi: Con nào đi rất xa để tìm nước?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Remember the yellow grass of the dry season.
hint.vi: Em nhớ lại thảm cỏ vàng của mùa khô nhé.
explanation_correct.en: Yes! Wildebeest follow the rain to fresh grass.
explanation_correct.vi: Đúng rồi! Linh dương đầu bò đi theo mưa tới nơi cỏ xanh.
explanation_wrong.en: The answer is the wildebeest herd. They walk far.
explanation_wrong.vi: Đáp án là đàn linh dương đầu bò. Cả đàn đi rất xa.
> Ôn ý chính ba của bài 6. Gợi ý nhắc ô "Dry season" (cỏ vàng, vũng nước cạn), không nhắc ô "Herd" (câu chính của ô đó là phán quyết). Nối sang bài hôm nay: sa mạc còn khô hơn mùa khô ở xavan.

#### option w1_sloth
correct: false
feedback.en: A sloth moves very slowly in the trees.
feedback.vi: Con lười di chuyển rất chậm trên cây.
label.en: sloth
label.vi: con lười
image.brief: Dùng lại hình `explore_trees` ở bài `noi-song-tren-trai-dat/rung-mua-nhiet-doi`. Từ khoá tìm ảnh (EN): Bradypus sloth
image.alt.en: A sloth hanging from a branch
image.alt.vi: Con lười treo trên cành cây

#### option w1_herd
correct: true
label.en: wildebeest herd
label.vi: đàn linh dương đầu bò
image.brief: Dùng lại hình `explore_herd` ở bài `noi-song-tren-trai-dat/dong-co-xavan`. Từ khoá tìm ảnh (EN): wildebeest herd
image.alt.en: Many wildebeest together
image.alt.vi: Rất nhiều linh dương đầu bò

### w2
id: 7c92c2eb-7f3c-4a7b-9d88-048b6a13b693
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/chim-va-bo-sat
prompt.en: A lizard has dry skin with scales.
prompt.vi: Thằn lằn có da khô phủ vảy.
image.brief: Dùng lại hình `w3_lizard` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): common sun skink Eutropis multifasciata on rock
image.alt.en: A lizard on a rock
image.alt.vi: Con thằn lằn trên hòn đá
answer: true
hint.en: Look closely at the lizard's skin.
hint.vi: Em nhìn kỹ da của con thằn lằn nhé.
explanation_correct.en: Yes! Many lizards live in hot, dry places.
explanation_correct.vi: Đúng rồi! Nhiều loài thằn lằn sống ở nơi nóng và khô.
explanation_wrong.en: This is true. Lizards are reptiles, like crocodiles.
explanation_wrong.vi: Câu này đúng. Thằn lằn là bò sát, giống cá sấu.
feedback_false.en: This lizard's skin is covered in scales.
feedback_false.vi: Da con thằn lằn này phủ đầy vảy.
> Câu mới, không chép ý chính hai của bài đó ("Reptiles have dry skin with scales."): câu nói về một con thằn lằn cụ thể trong ảnh bé đã gặp ở bài đó. Ảnh thằn lằn bóng chỉ dùng ở câu này; thằn lằn đuôi gai của bài hôm nay ở câu khác (luật Explorer số bảy).
> [CẦN KIỂM] Nhiều loài thằn lằn sống ở nơi nóng và khô.

### w3
id: 5aabf82f-ed57-433d-8a29-3bd15876d26c
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: noi-song-tren-trai-dat/bac-cuc
prompt.en: An Arctic fox has small ears.
prompt.vi: Cáo Bắc Cực có đôi tai nhỏ.
image.brief: Dùng lại hình `explore_fox` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Vulpes lagopus
image.alt.en: An Arctic fox in the snow
image.alt.vi: Cáo Bắc Cực trên tuyết
answer: true
hint.en: Look at the top of the fox's head.
hint.vi: Em nhìn phía trên đầu con cáo nhé.
explanation_correct.en: Yes! Small ears help it keep warm.
explanation_correct.vi: Đúng rồi! Đôi tai nhỏ giúp cáo giữ ấm.
explanation_wrong.en: This is true. The fox has small, round ears.
explanation_wrong.vi: Câu này đúng. Cáo Bắc Cực có đôi tai nhỏ và tròn.
feedback_false.en: Its ears are short and furry.
feedback_false.vi: Tai cáo ngắn và nhiều lông.
> Nhớ lại ví dụ ba ô "Arctic fox" của bài 1 ("small, round ears"). Câu này chuẩn bị câu q5 (so tai cáo Bắc Cực với tai cáo fennec).
> [CẦN KIỂM] Tai nhỏ giúp cáo Bắc Cực giữ ấm (ít mất nhiệt); tai cáo Bắc Cực ngắn, có lông.

## Học

> Bốn ô: nơi sống (đồi cát Xa-ha-ra), chỗ có nước (ốc đảo), rồi hai con vật, mỗi con sống được ở sa mạc nhờ một điều nhìn thấy (lạc đà đi xa trên cát nóng; cáo fennec tai to, trốn nắng). Thằn lằn đuôi gai gặp ở phần Chơi.
> "Ban đêm lạnh" chỉ nói bằng lời (ví dụ ba ô "Sahara"); không ảnh sa mạc ban đêm. Không bọ cạp, không chuột nhảy, không linh dương Dorcas, không xương rồng, không con người sống ở sa mạc. Không gọi lạc đà là động vật hoang dã.
> Không thêm ví dụ "Việt Nam không có sa mạc" (`_topic.md` Còn mở số sáu, chờ PM).

### explore
id: d58e6dad-6725-4255-9604-58d618b8fe3e
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_sahara
label.en: Sahara
label.vi: Xa-ha-ra
color: vang_hoe
sentence.en: The Sahara is a huge, hot desert.
sentence.vi: Sa mạc Xa-ha-ra rất rộng và rất nóng.
image.brief: [ảnh] Những đồi cát lớn màu vàng cam ở sa mạc Xa-ha-ra, chụp rộng, ảnh ngang, trời xanh, nắng gắt, thấy gợn sóng trên cát; không có người, lạc đà, xe, lều, đường, cây xương rồng hay chữ, không thấy dấu chân người rõ. Trang gốc phải ghi chụp ở Xa-ha-ra (ví dụ đồi cát Erg Chebbi ở Ma Rốc, hay ở Algeria, Libya); nếu ảnh không chụp ở Xa-ha-ra thì bỏ tên nơi: alt đổi thành Big sand dunes in a desert và Những đồi cát lớn ở sa mạc ở mọi chỗ dùng. Không dùng ảnh đồi cát Việt Nam (Mũi Né, Ninh Thuận): đồi cát Việt Nam không phải sa mạc. Từ khoá tìm ảnh (EN): Sahara dunes; Erg Chebbi; Sahara desert
image.alt.en: Big sand dunes in the Sahara
image.alt.vi: Những đồi cát lớn ở Xa-ha-ra
examples.1.en: in Africa, very far away
examples.1.vi: ở châu Phi, rất xa
examples.2.en: sand, rocks and very little rain
examples.2.vi: có cát, có đá và rất ít mưa
examples.3.en: cold nights under bright stars
examples.3.vi: ban đêm lạnh, dưới bầu trời đầy sao
> Hình gốc của cả chủ đề (bài 8 dùng lại ở ô "Hot and dry", câu q3, q4, từ `hot` và hình ghép `earth`).
> Ví dụ một nói vị trí bằng lời, khớp ô "Savanna" bài 6 (cùng ở châu Phi). Ví dụ hai nhắc "đá" để bé không nghĩ sa mạc chỉ toàn cát, nhưng không thành câu hỏi. Ví dụ ba là chỗ duy nhất nói ban đêm lạnh (ý chính hai), không ảnh.
> [CẦN KIỂM] Xa-ha-ra là sa mạc nóng rất rộng ở châu Phi; phần lớn Xa-ha-ra là đá, sỏi, không chỉ đồi cát; ban đêm có thể lạnh.

#### group explore_oasis
label.en: Oasis
label.vi: Ốc đảo
color: gi_dong
sentence.en: An oasis has water and date palms.
sentence.vi: Ốc đảo có nước và cây chà là.
image.brief: [ảnh] Một ốc đảo giữa sa mạc: hàng cây chà là xanh mọc quanh một hồ nước nhỏ, xung quanh là cát; chụp rộng, ảnh ngang, trời nắng; mặt nước phải nhìn thấy rõ (ảnh là đáp án câu q3 hỏi con vật tìm nước ở đâu); không có người, nhà, lều, xe, đường, lạc đà có yên, cây xương rồng hay chữ. Trang gốc ghi Xa-ha-ra hay Bắc Phi thì tốt, không bắt buộc (brief và alt không ghi tên nơi). Từ khoá tìm ảnh (EN): oasis date palms; oasis Sahara; oasis Libya
image.alt.en: Palm trees in the desert
image.alt.vi: Hàng cây chà là giữa sa mạc
examples.1.en: water from deep under the ground
examples.1.vi: nước từ sâu dưới lòng đất
examples.2.en: sweet dates grow on the palms
examples.2.vi: quả chà là ngọt mọc trên cây
examples.3.en: animals come here to drink
examples.3.vi: con vật tìm tới đây uống nước
> Hình gốc. `alt` không có chữ "water", vì ảnh là đáp án câu q3 ("Where can desert animals find water?"). Câu chính dạy sẵn chữ "water" cho câu q3 (dòng "Chữ cần dạy trước khi hỏi" ở `_topic.md`).
> Cây chà là chỉ làm cảnh (ranh giới *Cây quanh em*: không dạy bộ phận cây).
> [CẦN KIỂM] Nước ở ốc đảo phần lớn từ mạch nước ngầm; cây chà là mọc ở ốc đảo Xa-ha-ra; con vật tới ốc đảo uống nước.

#### group explore_camel
label.en: Camel
label.vi: Lạc đà
color: nau_dat
sentence.en: A camel can walk far on hot sand.
sentence.vi: Lạc đà đi được rất xa trên cát nóng.
image.brief: [ảnh] Một con lạc đà một bướu đứng hoặc đi trên cát sa mạc, nhìn ngang, thấy cả con, rõ cái bướu, đôi chân dài và bàn chân; ảnh ngang có khoảng trống quanh con vật (dùng khung vuông Học, kệ Chơi, hình câu q6, từ camel và từ hump); không có yên, dây cương, dây buộc, chuông, khăn trang trí, người, xe, nhà, hàng rào hay chữ; không phải lạc đà hai bướu. Một con là tốt nhất; ảnh có nhiều con thì designer cắt một con. Ảnh khó: phần lớn ảnh lạc đà có người và yên cương. Từ khoá tìm ảnh (EN): Camelus dromedarius; dromedary desert; dromedary camel
image.alt.en: A camel on the sand
image.alt.vi: Lạc đà trên cát
examples.1.en: its hump stores fat
examples.1.vi: bướu lạc đà chứa mỡ
examples.2.en: wide feet for soft sand
examples.2.vi: bàn chân rộng, hợp với cát mềm
examples.3.en: most camels live with people
examples.3.vi: phần lớn lạc đà do người nuôi
> Hình gốc của cả chủ đề (bài 8 dùng lại ở câu w1, q1, kệ Chơi). Ví dụ một dạy sẵn ý đúng của `camel_hump_water` trước câu q6 (dòng "Chữ cần dạy trước khi hỏi"). Ví dụ ba theo `_topic.md`: không gọi lạc đà là động vật hoang dã; ảnh không có người.
> Nói "mỡ" như một bộ phận giúp con vật; không so với người (mục An toàn).
> [CẦN KIỂM] Bướu lạc đà chứa mỡ, không chứa nước; lạc đà có bàn chân rộng, đi trên cát mềm không lún; lạc đà một bướu hầu như không còn sống hoang dã, phần lớn do người nuôi.

#### group explore_fennec
label.en: Fennec fox
label.vi: Cáo fennec
color: cham
sentence.en: Big ears help a fennec fox stay cool.
sentence.vi: Đôi tai to giúp cáo fennec mát mẻ.
image.brief: [ảnh] Một con cáo fennec ngồi hoặc đứng trên cát, nhìn thẳng hoặc hơi nghiêng, thấy cả con, rõ đôi tai rất to và bộ lông màu cát; nền cát, không phải nền tuyết hay cỏ; ảnh ngang có khoảng trống quanh con vật (dùng khung vuông Học, kệ Chơi, thẻ hai lựa chọn câu q5, từ fennec fox, thẻ thưởng); con vật hoang dã: không chuồng, lưới, kính, vòng cổ, dây, tay người, nền gạch, cỏ trồng hay đồ chơi của sở thú, không chữ. Ảnh khó: nhiều ảnh cáo fennec chụp ở sở thú. Từ khoá tìm ảnh (EN): Vulpes zerda; fennec fox desert
image.alt.en: A sandy-coloured fox
image.alt.vi: Con cáo màu cát
examples.1.en: sleeps in a hole all day
examples.1.vi: ngủ trong hang suốt ban ngày
examples.2.en: comes out at night to eat
examples.2.vi: ban đêm mới ra ngoài kiếm ăn
examples.3.en: sandy fur, like the desert
examples.3.vi: bộ lông màu cát, giống sa mạc
> Hình gốc của cả chủ đề (bài 8 dùng lại ở kệ Chơi, câu q5). `alt` không có chữ "ears", vì bài 8 câu q5 hỏi "Which one has ears that keep it cool?" và ảnh này là đáp án.
> Ví dụ một, hai dạy ý chính ba (trốn nắng suốt ban ngày). Câu chính nói "giúp" (Duy chốt câu 5 = a).
> [CẦN KIỂM] Cáo fennec ngủ trong hang ban ngày, ra ngoài kiếm ăn ban đêm; tai to giúp toả bớt nhiệt; lông màu cát.

### new_words
id: c6db2b0e-59d2-4cdf-87d8-7a278616dcb3
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: desert, camel

## Chơi

> Bé chọn ba con vật sống ở sa mạc, mỗi con một điều nhìn thấy: tai to (cáo fennec), có bướu (lạc đà), có vảy (thằn lằn). Đạt khi đủ ba nhóm và không chọn con vật nơi khác.
> Món bẫy giống một nhóm nhưng sống nơi khác (đúng bảng Chơi ở `_topic.md`): cáo Bắc Cực (cũng là cáo, nhưng tai nhỏ, sống nơi lạnh), hươu cao cổ (to, chân dài như lạc đà, sống ở xavan), cá sấu (có vảy như thằn lằn, sống ở sông, đầm), gấu trắng (nơi lạnh nhất, bẫy dễ nhất). Cả bốn là con vật bé đã gặp.
> Mỗi nhóm bắt buộc chỉ có một món, nên bé phải bỏ qua cả bốn bẫy. Kệ bảy món, toàn ảnh chụp.

### tray
id: 8f3ec25f-e408-481b-aa52-e414b0865893
type: build_tray
version: 1
prompt.en: Pick three desert animals
prompt.vi: Chọn ba con vật sống ở sa mạc
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find big ears, a hump and scales.
messages.start.vi: Em tìm con có tai to, con có bướu và con có vảy nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! All three live in the desert.
messages.balanced.vi: Tuyệt! Cả ba con đều sống ở sa mạc.
messages.has_limited.en: That one does not live in the desert.
messages.has_limited.vi: Con này không sống ở sa mạc.
messages.missing.tray_ears.en: You still need an animal with big ears.
messages.missing.tray_ears.vi: Em còn thiếu một con có tai to.
messages.missing.tray_hump.en: You still need an animal with a hump.
messages.missing.tray_hump.vi: Em còn thiếu một con có bướu.
messages.missing.tray_scales.en: You still need an animal with scales.
messages.missing.tray_scales.vi: Em còn thiếu một con có vảy.
> Lời nhắn `has_limited` đúng với cả bốn món bẫy, hiểu theo loài trong ảnh (cáo Bắc Cực, hươu cao cổ ở Nairobi, cá sấu Xiêm, gấu trắng).
> [CẦN KIỂM] Có vài nhóm nhỏ ở rìa: hươu cao cổ ở vùng khô hạn phía tây bắc Namibia, cá sấu ở vài hồ nước giữa Xa-ha-ra (Mauritania, Chad). Câu "không sống ở sa mạc" nói chung cho trẻ năm tới bảy tuổi; người chuyên môn xác nhận cách nói này chấp nhận được.

#### group tray_ears
label.en: Big ears
label.vi: Tai to
color: vang_hoe
role: required

#### group tray_hump
label.en: Has a hump
label.vi: Có bướu
color: nau_dat
role: required

#### group tray_scales
label.en: Has scales
label.vi: Có vảy
color: gi_dong
role: required

#### group tray_not
label.en: Not a desert animal
label.vi: Không sống ở sa mạc
color: do_son
role: limit

#### item tray_fennec
label.en: Fennec fox
label.vi: Cáo fennec
group: tray_ears
image.brief: Dùng lại hình `explore_fennec`. Từ khoá tìm ảnh (EN): Vulpes zerda
image.alt.en: A sandy-coloured fox
image.alt.vi: Con cáo màu cát

#### item tray_fox
label.en: Arctic fox
label.vi: Cáo Bắc Cực
group: tray_not
image.brief: Dùng lại hình `explore_fox` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Vulpes lagopus
image.alt.en: An Arctic fox in the snow
image.alt.vi: Cáo Bắc Cực trên tuyết

#### item tray_camel
label.en: Camel
label.vi: Lạc đà
group: tray_hump
image.brief: Dùng lại hình `explore_camel`. Từ khoá tìm ảnh (EN): Camelus dromedarius
image.alt.en: A camel on the sand
image.alt.vi: Lạc đà trên cát

#### item tray_giraffe
label.en: Giraffe
label.vi: Hươu cao cổ
group: tray_not
image.brief: Dùng lại hình `tray_africa` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): savanna giraffe acacia
image.alt.en: A giraffe on wide grassland
image.alt.vi: Hươu cao cổ trên đồng cỏ rộng

#### item tray_lizard
label.en: Lizard
label.vi: Thằn lằn
group: tray_scales
image.brief: [ảnh] Một con thằn lằn đuôi gai nằm trên cát hoặc trên đá sa mạc, nhìn ngang, thấy cả con, rõ cái đuôi to phủ gai và lớp vảy; ảnh ngang có khoảng trống quanh con vật (dùng khung vuông kệ Chơi và thẻ ba lựa chọn rất ngang câu q1); con vật hoang dã: không bể kính, tay người, chậu, thảm lót, đèn sưởi hay chữ. Trông khác hẳn thằn lằn bóng ở câu w2. Trang gốc ghi Xa-ha-ra hay Bắc Phi thì tốt; brief và alt không ghi tên nơi. Từ khoá tìm ảnh (EN): Uromastyx; spiny-tailed lizard desert
image.alt.en: A spiny-tailed lizard
image.alt.vi: Con thằn lằn đuôi gai
> Hình gốc (câu q1). Thay bọ cạp của proposal (mục An toàn của `_topic.md`).
> [CẦN KIỂM] Thằn lằn đuôi gai (Uromastyx) sống ở sa mạc Bắc Phi, kể cả Xa-ha-ra; đuôi phủ gai.

#### item tray_croc
label.en: Crocodile
label.vi: Cá sấu
group: tray_not
image.brief: Dùng lại hình `tray_croc` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Crocodylus siamensis
image.alt.en: A crocodile on a riverbank
image.alt.vi: Con cá sấu trên bờ sông

#### item tray_bear
label.en: Polar bear
label.vi: Gấu trắng
group: tray_not
image.brief: Dùng lại hình `explore_bear` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): polar bear sea ice
image.alt.en: A polar bear on floating ice
image.alt.vi: Gấu trắng trên tảng băng trôi

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1 ba lựa chọn; q3, q5 hai lựa chọn), `true_false` (q2 Sai, q6 Sai), `order_sequence` (q4, ba thẻ).
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính. Câu nào cũng tự đủ nghĩa khi chỉ nghe.
> Ranh giới Oak: không câu nào hỏi lạc đà sống ở đâu (cặp lạc đà với sa mạc của quiz Oak Science); lạc đà chỉ ở câu q6 (bướu) và kệ Chơi. Không câu xương rồng, không câu con người (quiz Oak Địa lý).
> Không câu nào dựa vào ảnh sa mạc ban đêm (không có ảnh).

### q1
id: 4c284840-0027-425d-8dc5-aced7a0eb96b
format: single_choice
version: 1
dok: 1
prompt.en: Which animal lives in the desert?
prompt.vi: Con nào sống ở sa mạc?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of a hot, dry place with sand.
hint.vi: Em nghĩ tới một nơi nóng, khô, nhiều cát nhé.
explanation_correct.en: Yes! This lizard has a spiny tail.
explanation_correct.vi: Đúng rồi! Con thằn lằn này có cái đuôi đầy gai.
explanation_wrong.en: The answer is the lizard. It lives in hot, dry places.
explanation_wrong.vi: Đáp án là con thằn lằn. Thằn lằn sống ở nơi nóng và khô.
> Hai lựa chọn sai là con vật của hai nơi nhiều nước bé đã học (hải mã ở bài 1, rùa biển ở bài 5); đáp án là món bé vừa gặp ở kệ Chơi, không phải ảnh mới duy nhất.

#### option q1_walrus
correct: false
feedback.en: A walrus rests on cold sea ice.
feedback.vi: Hải mã nằm nghỉ trên băng biển lạnh.
label.en: walrus
label.vi: hải mã
image.brief: Dùng lại hình `explore_walrus` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): walrus ice Odobenus
image.alt.en: A walrus resting on the ice
image.alt.vi: Hải mã nằm nghỉ trên băng

#### option q1_turtle
correct: false
feedback.en: A sea turtle swims in the wide sea.
feedback.vi: Rùa biển bơi ngoài biển rộng.
label.en: sea turtle
label.vi: rùa biển
image.brief: Dùng lại hình `tray_sea_turtle` ở bài `noi-song-tren-trai-dat/bien-va-dai-duong`. Từ khoá tìm ảnh (EN): Chelonia mydas
image.alt.en: A sea turtle swimming
image.alt.vi: Rùa biển đang bơi

#### option q1_lizard
correct: true
label.en: lizard
label.vi: thằn lằn
image.brief: Dùng lại hình `tray_lizard`. Từ khoá tìm ảnh (EN): Uromastyx
image.alt.en: A spiny-tailed lizard
image.alt.vi: Con thằn lằn đuôi gai

### q2
id: e8c8d51a-16b9-4468-becd-498db1244d49
format: true_false
version: 1
dok: 1
prompt.en: Deserts get lots of rain.
prompt.vi: Sa mạc có rất nhiều mưa.
image.brief: Dùng lại hình `explore_sahara`. Từ khoá tìm ảnh (EN): Sahara dunes
image.alt.en: Big sand dunes in the Sahara
image.alt.vi: Những đồi cát lớn ở Xa-ha-ra
answer: false
hint.en: Look at the sand and the sky.
hint.vi: Em nhìn cát và bầu trời trong hình nhé.
explanation_correct.en: Deserts are very dry, with little rain.
explanation_correct.vi: Sa mạc rất khô và rất ít mưa.
explanation_wrong.en: This is false. Rain is rare in deserts.
explanation_wrong.vi: Câu này sai. Ở sa mạc hiếm khi có mưa.
feedback_true.en: Desert sand stays dry almost all year.
feedback_true.vi: Cát sa mạc khô gần như quanh năm.
> DOK 1: nhớ lại ý chính một. Câu khẳng định, đáp án Sai, không chữ phủ định ("lots of" là khẳng định). Ảnh đồi cát khô, trời quang là bằng chứng cho phía đúng; gợi ý trỏ tới điều nhìn thấy.
> `explanation_correct` đứng một mình được (thẻ "Ý sai → Ý đúng" ở Tổng kết).
> [CẦN KIỂM] Ở sa mạc nóng, có nơi nhiều tháng liền không mưa.

### q3
id: 96074282-2e73-4aea-8cec-7c12cf34921e
format: single_choice
version: 1
dok: 1
prompt.en: Where can desert animals find water?
prompt.vi: Con vật sa mạc tìm nước ở đâu?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about what plants need to grow.
hint.vi: Em nghĩ xem cây cần gì để lớn nhé.
explanation_correct.en: Yes! Date palms grow where there is water.
explanation_correct.vi: Đúng rồi! Cây chà là mọc ở nơi có nước.
explanation_wrong.en: The answer is the oasis. It has water.
explanation_wrong.vi: Đáp án là ốc đảo. Ốc đảo có nước.
> Hai lựa chọn, đều là ô Học hôm nay. Gợi ý là cách nghĩ (cây cần nước, ôn *Sinh vật sống ở đâu?* bài năm): bé thấy hàng cây xanh thì suy ra có nước; gợi ý không trỏ tới ô "Oasis" (câu chính ô đó là phán quyết).
> Hai cảnh khác nhau rõ bằng mắt (cây xanh và mặt nước với đồi cát trống). Không đặt đồi cát Việt Nam cạnh đồi cát Xa-ha-ra.

#### option q3_oasis
correct: true
label.en: oasis
label.vi: ốc đảo
image.brief: Dùng lại hình `explore_oasis`. Từ khoá tìm ảnh (EN): oasis date palms
image.alt.en: Palm trees in the desert
image.alt.vi: Hàng cây chà là giữa sa mạc

#### option q3_dunes
correct: false
feedback.en: These sand dunes are hot and dry.
feedback.vi: Những đồi cát này nóng và khô.
label.en: Sahara dunes
label.vi: đồi cát Xa-ha-ra
image.brief: Dùng lại hình `explore_sahara`. Từ khoá tìm ảnh (EN): Sahara dunes
image.alt.en: Big sand dunes in the Sahara
image.alt.vi: Những đồi cát lớn ở Xa-ha-ra
> Nếu ảnh `explore_sahara` không chụp ở Xa-ha-ra thì nhãn đổi thành "desert dunes" · "đồi cát sa mạc", cùng lúc với `alt`.

### q4
id: c1edc6d9-6091-4ab4-9404-53d1fd770788
format: order_sequence
version: 1
dok: 2
prompt.en: Order from driest to wettest.
prompt.vi: Xếp từ khô nhất tới ướt nhất.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_desert, q4_savanna, q4_rainforest
hint.en: Think about how much rain each place gets.
hint.vi: Em nghĩ xem mỗi nơi có nhiều mưa hay ít mưa nhé.
explanation_correct.en: Yes! The savanna has rainy and dry seasons.
explanation_correct.vi: Đúng rồi! Đồng cỏ xavan có mùa mưa và mùa khô.
explanation_wrong.en: The order is desert, savanna, rainforest.
explanation_wrong.vi: Thứ tự là sa mạc, đồng cỏ xavan, rừng mưa nhiệt đới.
> DOK 2, câu `apply`: so sánh ba nơi sống của ba bài (bài 3 "rất mưa", bài 6 "mùa mưa và mùa khô", bài 7 "hiếm khi có mưa") theo lượng mưa. Chỉ một thứ tự đúng. Thẻ trong file không theo thứ tự đúng.
> Giải thích đúng nói vì sao xavan đứng giữa (có mùa mưa, cũng có mùa khô). Ba cảnh cùng cắt vuông, cùng cỡ.
> [CẦN KIỂM] Đồng cỏ xavan mưa nhiều hơn sa mạc, ít hơn rừng mưa nhiệt đới.

#### item q4_rainforest
label.en: rainforest
label.vi: rừng mưa nhiệt đới
image.brief: Dùng lại hình `explore_vietnam` ở bài `noi-song-tren-trai-dat/rung-mua-nhiet-doi`. Từ khoá tìm ảnh (EN): Cat Tien forest
image.alt.en: Tall trees in a thick forest
image.alt.vi: Cây cao trong khu rừng rậm

#### item q4_desert
label.en: desert
label.vi: sa mạc
image.brief: Dùng lại hình `explore_sahara`. Từ khoá tìm ảnh (EN): Sahara dunes
image.alt.en: Big sand dunes in the Sahara
image.alt.vi: Những đồi cát lớn ở Xa-ha-ra

#### item q4_savanna
label.en: savanna
label.vi: đồng cỏ xavan
image.brief: Dùng lại hình `explore_savanna` ở bài `noi-song-tren-trai-dat/dong-co-xavan`. Từ khoá tìm ảnh (EN): savanna acacia tree
image.alt.en: A wide plain with a few trees
image.alt.vi: Đồng bằng rộng có vài cây

### q5
id: a2dc2113-fa18-4552-94d6-15e8d908ca7a
format: single_choice
version: 1
dok: 2
prompt.en: Which fox lives in the hot desert?
prompt.vi: Con cáo nào sống ở sa mạc nóng?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look at each fox's ears.
hint.vi: Em nhìn đôi tai của mỗi con cáo nhé.
explanation_correct.en: Yes! Fennec foxes sleep in cool holes all day.
explanation_correct.vi: Đúng rồi! Cáo fennec ngủ trong hang mát suốt ban ngày.
explanation_wrong.en: The answer is the fennec fox. Big ears keep it cool.
explanation_wrong.vi: Đáp án là cáo fennec. Đôi tai to giúp cáo mát mẻ.
> DOK 2, câu `apply`: so hai con cáo (cùng là cáo, khác tai, khác lông) rồi suy ra con nào hợp nơi nóng, dùng câu chính ô "Fennec fox" và câu w3 (cáo Bắc Cực tai nhỏ). Gợi ý trỏ tới bằng chứng nhìn thấy (tai), không nói tai nào hợp nơi nào.
> Hai ảnh khác nhau rõ bằng mắt (lông trắng trên tuyết, lông màu cát trên cát). `alt` của đáp án không có chữ "desert", "hot".
> `explanation_correct.en` sửa 16/11 (tester n1): bản trước mở đầu "It" không có chủ ngữ, trong khi VI gọi tên cáo fennec; nay EN cũng gọi tên (tám từ sau "Yes!"), VI giữ nguyên.

#### option q5_fox
correct: false
feedback.en: An Arctic fox's thick fur keeps it warm.
feedback.vi: Bộ lông dày giữ ấm cho cáo Bắc Cực.
label.en: Arctic fox
label.vi: cáo Bắc Cực
image.brief: Dùng lại hình `explore_fox` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Vulpes lagopus
image.alt.en: An Arctic fox in the snow
image.alt.vi: Cáo Bắc Cực trên tuyết

#### option q5_fennec
correct: true
label.en: fennec fox
label.vi: cáo fennec
image.brief: Dùng lại hình `explore_fennec`. Từ khoá tìm ảnh (EN): Vulpes zerda
image.alt.en: A sandy-coloured fox
image.alt.vi: Con cáo màu cát

### q6
id: 75305184-5957-4458-9eca-0966519ad164
format: true_false
version: 1
dok: 2
misconception: camel_hump_water
prompt.en: A camel keeps water in its hump.
prompt.vi: Lạc đà chứa nước trong cái bướu.
image.brief: Dùng lại hình `explore_camel`. Từ khoá tìm ảnh (EN): Camelus dromedarius
image.alt.en: A camel on the sand
image.alt.vi: Lạc đà trên cát
answer: false
hint.en: Think about food for very long walks.
hint.vi: Em nghĩ tới thức ăn cho những chuyến đi rất xa nhé.
explanation_correct.en: A camel's hump is full of fat.
explanation_correct.vi: Bướu lạc đà chứa đầy mỡ.
explanation_wrong.en: This is false. The hump stores fat.
explanation_wrong.vi: Câu này sai. Bướu lạc đà chứa mỡ.
feedback_true.en: A camel drinks lots of water at once.
feedback_true.vi: Lạc đà uống rất nhiều nước trong một lần.
> Câu misconception (`camel_hump_water`), bằng hình, DOK 2: bé đã nghe "lạc đà trữ nước trong bướu" sẽ chạm gật đầu. Bé áp điều đã học (ví dụ một ô "Camel": "its hump stores fat") để bác câu nói. Câu chỉ kiểm một việc: trong bướu có gì.
> Hình là lạc đà đứng trên cát, thấy bướu; ảnh không làm bằng chứng cho phía nào. Gợi ý là cách nghĩ (mỡ là thức ăn để dành cho chuyến đi xa), không trỏ tới ô "Camel" (ví dụ một của ô là phán quyết). Phản hồi nói chỗ nước thật sự đi vào (lạc đà uống rất nhiều một lần), không lặp ý gợi ý.
> `explanation_correct` đứng một mình được, đúng chữ `correction.en` ở `_topic.md`: "A camel keeps water in its hump." → "A camel's hump is full of fat.".
> [CẦN KIỂM] Bướu lạc đà chứa mỡ, là thức ăn để dành khi đi xa; lạc đà uống được rất nhiều nước trong một lần.

## Từ vựng

### desert
id: 0147a533-7c0d-4ba7-b578-aaa8d1d29e9b
tier: core
term.en: desert
term.vi: sa mạc
example.en: A desert gets very little rain.
example.vi: Sa mạc có rất ít mưa.
image.brief: Dùng lại hình `explore_sahara`. Từ khoá tìm ảnh (EN): Sahara dunes
image.alt.en: Big sand dunes in the Sahara
image.alt.vi: Những đồi cát lớn ở Xa-ha-ra

### camel
id: a426bc77-f617-4164-b5e0-dd470c146dc9
tier: core
term.en: camel
term.vi: lạc đà
example.en: A camel has long legs and wide feet.
example.vi: Lạc đà có chân dài và bàn chân rộng.
image.brief: Dùng lại hình `explore_camel`. Từ khoá tìm ảnh (EN): Camelus dromedarius
image.alt.en: A camel on the sand
image.alt.vi: Lạc đà trên cát

### hump
id: 57761682-165f-4e31-85b5-1c51d04fbea2
tier: extra
term.en: hump
term.vi: bướu
example.en: This camel has one big hump.
example.vi: Con lạc đà này có một cái bướu to.
image.brief: Dùng lại hình `explore_camel`. Từ khoá tìm ảnh (EN): Camelus dromedarius
image.alt.en: A camel on the sand
image.alt.vi: Lạc đà trên cát
> Cùng ảnh với từ `camel` (bảng Hình dùng chung ở `_topic.md`); designer có thể làm mục cắt riêng thấy rõ cái bướu.

### oasis
id: db9acb78-615d-4a2d-9639-c431c5a3894e
tier: extra
term.en: oasis
term.vi: ốc đảo
example.en: Date palms grow at the oasis.
example.vi: Cây chà là mọc ở ốc đảo.
image.brief: Dùng lại hình `explore_oasis`. Từ khoá tìm ảnh (EN): oasis date palms
image.alt.en: Palm trees in the desert
image.alt.vi: Hàng cây chà là giữa sa mạc

### fennec_fox
id: 4c75d973-c907-4351-b3da-577b7665e21a
tier: extra
term.en: fennec fox
term.vi: cáo fennec
example.en: A fennec fox has very big ears.
example.vi: Cáo fennec có đôi tai rất to.
image.brief: Dùng lại hình `explore_fennec`. Từ khoá tìm ảnh (EN): Vulpes zerda
image.alt.en: A sandy-coloured fox
image.alt.vi: Con cáo màu cát

## Thưởng

### fennec_card
id: 1c1a0686-2ca0-4f43-b39d-0adbcf5342f8
set: animals
rarity: common
name.en: Fennec fox
name.vi: Cáo fennec
tag.en: Sleeps in the day
tag.vi: Ngủ ban ngày
fact.en: It has the biggest ears of any fox.
fact.vi: Cáo fennec có đôi tai to nhất trong các loài cáo.
image.brief: Dùng lại hình `explore_fennec`. Từ khoá tìm ảnh (EN): Vulpes zerda
image.alt.en: A sandy-coloured fox
image.alt.vi: Con cáo màu cát
> [CẦN KIỂM] Cáo fennec có đôi tai to nhất trong các loài cáo (so với cỡ thân).
> Bộ `set: animals` đã có; cáo fennec chưa có thẻ.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Không bản đồ, không quả địa cầu. Không người, không người cưỡi lạc đà, không yên cương. Không xương rồng. Không ảnh đồi cát Việt Nam làm sa mạc. Không ảnh sa mạc ban đêm, không chuột nhảy, không bọ cạp, không linh dương Dorcas.
- **Ảnh mới (năm):** đồi cát Xa-ha-ra (`explore_sahara`); ốc đảo có cây chà là và mặt nước (`explore_oasis`); lạc đà một bướu không yên cương (`explore_camel`); cáo fennec trên cát (`explore_fennec`); thằn lằn đuôi gai (`tray_lizard`). Năm ảnh đều là hình gốc của cả chủ đề (bảng Hình dùng chung ở `_topic.md`): giữ đúng key và `alt`.
- **Ảnh dùng lại:**
  - trong chủ đề: `explore_fox` bài 1 (w3, kệ Chơi, q5); `explore_walrus` bài 1 (q1); `explore_bear` bài 1 (gấu trắng: kệ Chơi) và `tray_croc` bài 1 (cá sấu: kệ Chơi), từ 16/11 thay `tray_arctic` của *Bề mặt Trái Đất* và `q1_reptiles` của *Khủng long*; `explore_trees` bài 3 (w1); `explore_vietnam` bài 3 (q4); `tray_sea_turtle` bài 5 (q1); `explore_herd` bài 6 (w1); `explore_savanna` bài 6 (q4);
  - chủ đề khác: *Bề mặt Trái Đất* bài hai `tray_africa` (hươu cao cổ: kệ Chơi); *Khủng long* `w3_lizard` (thằn lằn bóng: w2); *Gọi tên và nhóm động vật* `w1` (hàng rào tre: hình câu w1, q1, q3, q4, q5).
- **Một ảnh, nhiều khung** (làm mục `crop` riêng cho từng khung):
  - đồi cát Xa-ha-ra: ngang (Học, q2, từ), thẻ hai lựa chọn 17:10 (q3), vuông (q4);
  - ốc đảo: ngang (Học, từ), 17:10 (q3), mặt nước phải còn thấy trong khung 17:10;
  - lạc đà: vuông (Học, kệ Chơi), hình câu q6, từ `camel` và `hump`;
  - cáo fennec: vuông (Học, kệ Chơi, thẻ thưởng), 17:10 (q5), từ;
  - thằn lằn đuôi gai: vuông (kệ Chơi), thẻ ba lựa chọn rất ngang 5:2 (q1);
  - câu q4: ba cảnh vuông cùng cỡ (đồi cát, đồng cỏ xavan, rừng mưa); đồng cỏ xavan phải thấy rõ cỏ và cây để khác hẳn đồi cát.
- **Ảnh khó:**
  - lạc đà: phần lớn ảnh có người, yên, dây cương; chọn ảnh lạc đà thả rông, không đồ trên mình;
  - cáo fennec: nhiều ảnh ở sở thú (lưới, kính, nền gạch); chọn ảnh nền cát;
  - ốc đảo: nhiều ảnh có nhà, làng, đường; cần thấy mặt nước;
  - đồi cát: trang gốc phải ghi Xa-ha-ra; không thì sửa `alt` ở mọi chỗ dùng (ghi trong brief) và nhãn câu q3;
  - thằn lằn đuôi gai: nhiều ảnh nuôi trong bể kính.
- **Cần kiểm ảnh dùng lại (xong 16/11):** `q1_reptiles` (*Khủng long*) há miệng thấy răng; designer đã đổi sang ảnh cá sấu Xiêm miệng khép (`tray_croc` bài 1).
- **Màu:** Học: Xa-ha-ra `vang_hoe`, ốc đảo `gi_dong`, lạc đà `nau_dat`, cáo fennec `cham`. Chơi: tai to `vang_hoe`, có bướu `nau_dat`, có vảy `gi_dong`, không sống ở sa mạc `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (desert, camel). Chơi `build_tray` ba chỗ, ba nhóm `required` (mỗi nhóm một món), một nhóm `limit` (bốn món), bảy món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Đúng, w3 Đúng). Quiz `single_choice` (q1 ba lựa chọn; q3, q5 hai lựa chọn), `true_false` (q2 Sai, q6 Sai), `order_sequence` (q4, ba thẻ, `answer: q4_desert, q4_savanna, q4_rainforest`). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`camel_hump_water`). Không có `labels` ở câu `true_false`.
- **Vị trí đáp án:** app xáo lựa chọn (SK-047). Thứ tự trong file theo bảng ở `_topic.md`: w1 đáp án ở chỗ hai (trên hai), q1 chỗ ba, q3 chỗ một (trên hai), q5 chỗ hai (trên hai). Thẻ `order_sequence` trong file không theo thứ tự đúng.
- **Màn Chơi, ví dụ để kiểm:** Cáo fennec, Lạc đà, Thằn lằn → `balanced`; Cáo Bắc Cực, Lạc đà, Thằn lằn → `has_limited`; Cáo fennec, Lạc đà, Cá sấu → `has_limited`; Cáo fennec, Hươu cao cổ, Thằn lằn → `has_limited`. Mỗi nhóm bắt buộc chỉ có một món, nên ba món đủ chỗ mà không có bẫy luôn là `balanced`; các lời nhắn `missing` chỉ hiện nếu app báo khi chưa đủ ba món.
- **Khởi động trỏ sang bài khác:** w1 → `noi-song-tren-trai-dat/dong-co-xavan` (bài 6), w3 → `noi-song-tren-trai-dat/bac-cuc` (bài 1): hai bài này cần có id trước, chạy `ids` theo thứ tự bài; w2 → `goi-ten-va-nhom-dong-vat/chim-va-bo-sat` (đã có id).
- **Key món khác key nhóm:** nhóm `tray_ears`, `tray_hump`, `tray_scales`, `tray_not`; món `tray_fennec`, `tray_camel`, `tray_lizard`, `tray_fox`, `tray_giraffe`, `tray_croc`, `tray_bear`.
- **Từ EN có thể ngoài Starters/Movers:** desert, Sahara, oasis, date palms, dunes, camel, hump, fat, fennec fox, Arctic fox, lizard, scales, reptiles, spiny, wildebeest, herd, sloth, walrus, sea turtle, savanna, rainforest, rare, huge. Nghe thử giọng EN đọc "Sahara", "oasis", "fennec"; giọng VI đọc "Xa-ha-ra", "cáo fennec", "ốc đảo".
