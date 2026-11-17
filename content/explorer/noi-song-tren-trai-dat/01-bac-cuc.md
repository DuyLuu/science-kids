---
id: 918c3f77-fcf5-4b48-b0d2-b2e58ec13d85
topic: noi-song-tren-trai-dat
slug: bac-cuc
order: 1
stage: opener
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: The Arctic
vi: Bắc Cực
> Giữ đúng tên ở `content/syllabus.json` (key `new-habitats-around-the-world`, bài số một).

## Mục tiêu
en: I can name animals of the Arctic.
vi: Em kể được tên con vật sống ở Bắc Cực.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 16/11/2026. Ticket SK-048. Mọi dòng `id:` để trống; chạy `ids` sau `_topic.md`.
> Sườn một phần: Oak Địa lý Year 2, unit 3 *Cold places*, lesson 5 `arctic-wildlife` (`docs/oak/geography-y2-cold-and-hot-places.md`). Dùng ý, viết lại; không chép câu quiz. Bỏ "ngủ đông", băng theo tháng, biến đổi khí hậu.
> Bài mở chủ đề: nơi xa nhất, lạnh nhất. Sửa `polar_bears_eat_penguins` ở ý chính ba, ví dụ ba của ô Học "Polar bear", món bẫy chim cánh cụt ở phần Chơi và câu q6 (gắn key).

## Ý chính
1.en: The Arctic is icy and very cold.
1.vi: Bắc Cực rất lạnh, khắp nơi là băng và tuyết.
2.en: Thick fur and fat keep animals warm.
2.vi: Bộ lông dày và lớp mỡ dày giữ ấm cho con vật.
3.en: Polar bears and penguins live far apart.
3.vi: Gấu trắng và chim cánh cụt sống ở hai nơi rất xa nhau.
> Từ cụ thể tới trừu tượng: nơi sống nhìn thấy (băng tuyết), điều giúp con vật sống được ở đó (lông, mỡ), rồi ý so sánh hai nơi sống xa nhau (sửa misconception, mở đường cho bài hai). Nói "giữ ấm", "giúp" (Duy chốt câu 5 = a, xem `_topic.md` mục Tên gọi).
> [CẦN KIỂM] Gấu trắng sống tự nhiên chỉ ở vùng Bắc Cực; mọi loài chim cánh cụt sống ở nửa phía nam Trái Đất (chim cánh cụt Galápagos sát xích đạo), nên ngoài tự nhiên hai loài không gặp nhau.

## Khởi động

> Hai câu, cả hai ôn chủ đề trước vì đây là bài đầu của chủ đề: w1 ôn ý chung "nơi sống" của *Sinh vật sống ở đâu?* bài bốn (mốc vừa, không hỏi một nơi cụ thể của bài đó); w2 ôn *Gọi tên và nhóm động vật* bài một (mốc dài, động vật hoang dã là nền của cả chủ đề).

### w1
id: bba69890-d027-4294-aa8b-8da8e6fd3ea4
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/noi-song-cua-con-vat
prompt.en: A habitat gives food, water and hiding places.
prompt.vi: Nơi sống cho con vật thức ăn, nước và chỗ trú ẩn.
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê
answer: true
hint.en: Think about what animals need every day.
hint.vi: Em nghĩ xem mỗi ngày con vật cần những gì nhé.
explanation_correct.en: Yes! Animals find what they need there.
explanation_correct.vi: Đúng rồi! Con vật tìm được thứ nó cần ở nơi sống.
explanation_wrong.en: This is true. A habitat gives animals what they need.
explanation_wrong.vi: Câu này đúng. Nơi sống cho con vật những thứ nó cần.
feedback_false.en: Animals eat, drink and hide in their habitat.
feedback_false.vi: Con vật ăn, uống và trú ẩn ở nơi sống của nó.
> Câu hỏi nói ý chung (nơi sống cho thức ăn, nước, chỗ trú), không hỏi về cái ao. Hình là ảnh ao làng, cũng là hình của từ `habitat` bé đã học ở *Sinh vật sống ở đâu?* bài bốn; ảnh không thấy con vật đang ăn hay đang trốn, nên không làm bằng chứng.
> Câu mới, không chép ý chính hai của bài đó ("A habitat has food, water and hiding places.").

### w2
id: 52ee1dbf-5347-4d37-9646-16b598833715
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha
prompt.en: Which one is a wild animal?
prompt.vi: Con nào là động vật hoang dã?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about who gives each one food.
hint.vi: Em nghĩ xem ai cho mỗi con vật ăn nhé.
explanation_correct.en: Yes! A douc finds its own food.
explanation_correct.vi: Đúng rồi! Voọc tự tìm thức ăn trong rừng.
explanation_wrong.en: The answer is the douc. It finds its own food.
explanation_wrong.vi: Đáp án là con voọc. Voọc tự tìm thức ăn.
> Ôn "động vật hoang dã tự tìm thức ăn, nước, chỗ ở" (tên gọi của chủ đề số một). Cả chủ đề này nói về động vật hoang dã.

#### option w2_cat
correct: false
feedback.en: A cat is a pet at home.
feedback.vi: Con mèo là thú cưng, sống cùng chúng mình.
label.en: cat
label.vi: con mèo
image.brief: Dùng lại hình `w3_cat` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): tabby cat on step side view
image.alt.en: A cat on a step
image.alt.vi: Con mèo trên bậc thềm

#### option w2_douc
correct: true
label.en: douc
label.vi: con voọc
image.brief: Dùng lại hình `explore_wild` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): red-shanked douc langur tree
image.alt.en: A douc in a tree
image.alt.vi: Con voọc trên cây

## Học

> Bốn ô: nơi sống (băng biển), rồi ba con vật mà mỗi con giữ ấm một cách nhìn thấy được (lông trắng dày, lông dày và đuôi xù, lớp mỡ dày). Cú tuyết và tuần lộc gặp ở phần Chơi.
> Ô "Polar bear" mang ý sửa misconception: gấu trắng bắt hải cẩu (chỉ bằng lời, không có ảnh hải cẩu, không cảnh săn mồi) và ví dụ ba "no penguins live here".
> Không dạy mùa, không băng tan, không con người. Không nói Bắc Cực là đất liền.

### explore
id: e2953142-60e8-4403-8506-1a6f79cb2bec
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_ice
label.en: Ice and snow
label.vi: Băng và tuyết
color: cham
sentence.en: The Arctic is icy and very cold.
sentence.vi: Bắc Cực rất lạnh, khắp nơi là băng và tuyết.
image.brief: [ảnh] Băng biển ở Bắc Cực: nhiều mảng băng trắng, phẳng, phủ tuyết, nổi sát nhau trên mặt biển xanh thẫm, có khe nước giữa các mảng; ảnh ngang chụp rộng, trời sáng; không có con vật, không có người, không có tàu, không có cờ, không có chữ; không phải núi băng cao, không phải đất liền phủ tuyết, không phải ảnh chụp từ vũ trụ. Ưu tiên ảnh phạm vi công cộng của NOAA, NASA hoặc USGS mà trang gốc ghi chụp ở Bắc Băng Dương. Từ khoá tìm ảnh (EN): Arctic sea ice; sea ice floes
image.alt.en: Sea ice on a cold sea
image.alt.vi: Băng nổi trên biển lạnh
examples.1.en: far away, in the far north
examples.1.vi: ở rất xa, tận phía bắc Trái Đất
examples.2.en: ice floats on the cold sea
examples.2.vi: băng nổi trên mặt biển lạnh
examples.3.en: hard ice, like in a freezer
examples.3.vi: băng cứng, giống đá trong ngăn đá tủ lạnh
> Hình gốc của cả chủ đề (bài 3, 5, 6, 8 dùng lại; bài 8 còn ghép vào hình từ `earth`). `alt` không có chữ "Arctic", vì hình này là đáp án câu q3 ("Which picture shows the Arctic?").
> Ví dụ một thay bản đồ (Duy chốt không dùng bản đồ): nói vị trí bằng lời. Ví dụ ba nối "băng" với đá trong tủ lạnh nhà em, chỉ so chất (cứng, lạnh), không so độ lạnh.
> [CẦN KIỂM] Vùng Bắc Cực phần lớn là biển đóng băng (băng biển nổi trên Bắc Băng Dương), quanh đó là đất lạnh; bài chỉ nói "băng nổi trên biển", không nói Bắc Cực là đất liền hay toàn là biển (khớp Discoverer *Bề mặt Trái Đất* bài hai).

#### group explore_bear
label.en: Polar bear
label.vi: Gấu trắng
color: vang_hoe
sentence.en: Polar bears catch seals on the sea ice.
sentence.vi: Gấu trắng bắt hải cẩu trên băng biển.
image.brief: [ảnh] Một con gấu trắng hoang dã đi trên băng biển Bắc Cực, sát mặt nước, nhìn ngang, thấy cả con và bộ lông trắng dày; ảnh ngang có khoảng trống quanh con vật (dùng cả khung vuông ở Học, kệ Chơi, từ, thẻ thưởng và khung 4:3 của câu q5, q6); gấu không há miệng nhe nanh; không có con mồi, máu, chim cánh cụt, vòng đeo cổ, thẻ tai, người, thuyền, trực thăng hay chữ; tên ảnh ở trang gốc không nói băng tan hay biến đổi khí hậu (tên này hiện ở màn Nguồn hình). Ưu tiên ảnh phạm vi công cộng của cơ quan Mỹ (USFWS, NOAA). Từ khoá tìm ảnh (EN): polar bear sea ice; Ursus maritimus
image.alt.en: A polar bear on floating ice
image.alt.vi: Gấu trắng trên tảng băng trôi
examples.1.en: thick white fur, like snow
examples.1.vi: bộ lông dày, trắng như tuyết
examples.2.en: a thick layer of fat
examples.2.vi: một lớp mỡ dày dưới da
examples.3.en: no penguins live here
examples.3.vi: ở đây không có chim cánh cụt
> Câu chính trả lời câu bé sẽ tự hỏi khi nghe q6 ("gấu trắng không ăn chim cánh cụt thì ăn gì?"). "Bắt", không "giết"; không ảnh hải cẩu ở bài này.
> [CẦN KIỂM] Gấu trắng săn chủ yếu hải cẩu (hải cẩu vòng, hải cẩu râu) trên băng biển; có lớp mỡ dày dưới da; lông trông trắng. Không dùng ý "gấu trắng ngủ đông" của sườn (thường chỉ gấu cái mang thai vào hang).
> Hình gốc của cả chủ đề từ 16/11 (bài 2, 6, 7, 8 dùng lại). Trước đó ô này dùng lại `tray_arctic` của *Bề mặt Trái Đất* bài hai (ảnh NASA, giấy phép không rõ, tên trang gốc nói băng biển ngắn lại); designer đổi sang ảnh USFWS gấu đực đi trên băng biển (Public domain, SK-048 mục "designer 16/11 · ảnh bài 2–8"). `alt` giữ: băng biển là băng nổi.

#### group explore_fox
label.en: Arctic fox
label.vi: Cáo Bắc Cực
color: gi_dong
sentence.en: Thick fur keeps the Arctic fox warm.
sentence.vi: Bộ lông dày giữ ấm cho cáo Bắc Cực.
image.brief: [ảnh] Một con cáo Bắc Cực bộ lông trắng dày, ngồi hoặc nằm cuộn tròn trên tuyết, nhìn ngang, thấy cả con, rõ cái đuôi xù và đôi tai nhỏ; ảnh ngang có khoảng trống quanh con vật (dùng cả khung vuông và thẻ ba lựa chọn); con vật hoang dã: không thấy chuồng, lưới, vòng cổ, thẻ tai, người hay chữ; không có con mồi. Từ khoá tìm ảnh (EN): Vulpes lagopus; Arctic fox snow
image.alt.en: An Arctic fox in the snow
image.alt.vi: Cáo Bắc Cực trên tuyết
examples.1.en: a fluffy tail, like a blanket
examples.1.vi: cái đuôi xù như một chiếc chăn
examples.2.en: fur under its feet
examples.2.vi: lông mọc cả dưới bàn chân
examples.3.en: small, round ears
examples.3.vi: đôi tai nhỏ và tròn
> Hình gốc của cả chủ đề (bài 3, 7, 8 dùng lại). Ví dụ ba "tai nhỏ" để bài bảy so với cáo fennec tai to (bài 7 w3, q5). Không nói chuyện lông đổi màu theo mùa (mùa học sau).
> [CẦN KIỂM] Cáo Bắc Cực có lông dưới bàn chân; quấn đuôi xù quanh mình khi nằm cho ấm; tai nhỏ.

#### group explore_walrus
label.en: Walrus
label.vi: Hải mã
color: nau_dat
sentence.en: Thick fat keeps the walrus warm.
sentence.vi: Lớp mỡ dày giữ ấm cho hải mã.
image.brief: [ảnh] Một con hải mã (hoặc hai, ba con) nằm nghỉ trên tảng băng nổi, nhìn ngang, thấy rõ thân tròn to và hai chiếc ngà dài; ảnh ngang có khoảng trống quanh con vật; không có người, thuyền, máu, con mồi hay chữ. Ưu tiên ảnh phạm vi công cộng của cơ quan Mỹ (NOAA, USFWS). Từ khoá tìm ảnh (EN): walrus ice Odobenus; Odobenus rosmarus
image.alt.en: A walrus resting on the ice
image.alt.vi: Hải mã nằm nghỉ trên băng
examples.1.en: two long tusks
examples.1.vi: hai chiếc ngà dài
examples.2.en: rests on the sea ice
examples.2.vi: nằm nghỉ trên băng biển
examples.3.en: swims in icy water
examples.3.vi: bơi trong nước biển lạnh giá
> Hình gốc của cả chủ đề (bài 2, 3, 7, 8 dùng lại). Nói "lớp mỡ" như một bộ phận giúp con vật; không so với người.
> [CẦN KIỂM] Hải mã có lớp mỡ rất dày giữ ấm; nghỉ trên băng biển; chỉ sống ở vùng Bắc Cực.

### new_words
id: b9ce440c-db75-46a4-b5f7-2dd7b8df6fcf
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: arctic, ice

## Chơi

> Bé chọn ba con vật Bắc Cực, mỗi con giữ ấm một cách: lông dày (gấu trắng, cáo Bắc Cực, tuần lộc), lông vũ dày (cú tuyết), lớp mỡ dày (hải mã). Đạt khi đủ ba nhóm và không chọn con vật nơi khác.
> Món bẫy giống một nhóm nhưng sống nơi khác: chim cánh cụt có lông vũ dày, sau lưng là băng vụn và núi tuyết (đúng ý misconception: nơi lạnh nào cũng có chim cánh cụt); voọc có lông nhưng sống ở rừng ấm; cá sấu thân to nằm bên mép nước như hải mã. Bé phải nghĩ về nơi sống, không chọn theo nền tuyết hay theo dáng.
> Cú tuyết cho bé thấy Bắc Cực có chim, chỉ là không có chim cánh cụt. Kệ tám món, toàn ảnh chụp.

### tray
id: bd2763a3-4117-451e-96da-cdb27bbfda01
type: build_tray
version: 1
prompt.en: Pick three Arctic animals
prompt.vi: Chọn ba con vật sống ở Bắc Cực
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find thick fur, feathers and fat.
messages.start.vi: Em tìm con có lông dày, con có lông vũ dày và con có lớp mỡ dày nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! They all keep warm in the Arctic.
messages.balanced.vi: Tuyệt! Cả ba con đều giữ ấm được ở Bắc Cực.
messages.has_limited.en: That one does not live in the Arctic.
messages.has_limited.vi: Con này không sống ở Bắc Cực.
messages.missing.tray_fur.en: You still need an animal with thick fur.
messages.missing.tray_fur.vi: Em còn thiếu một con có lông dày.
messages.missing.tray_feathers.en: You still need a bird with thick feathers.
messages.missing.tray_feathers.vi: Em còn thiếu một con chim có lông vũ dày.
messages.missing.tray_fat.en: You still need an animal with thick fat.
messages.missing.tray_fat.vi: Em còn thiếu một con có lớp mỡ dày.
> Lời nhắn `has_limited` đúng với cả ba món bẫy (chim cánh cụt, voọc, cá sấu đều không sống ở Bắc Cực).

#### group tray_fur
label.en: Thick fur
label.vi: Lông dày
color: gi_dong
role: required

#### group tray_feathers
label.en: Thick feathers
label.vi: Lông vũ dày
color: cham
role: required

#### group tray_fat
label.en: Thick fat
label.vi: Lớp mỡ dày
color: vang_hoe
role: required

#### group tray_not
label.en: Not an Arctic animal
label.vi: Không sống ở Bắc Cực
color: do_son
role: limit

#### item tray_bear
label.en: Polar bear
label.vi: Gấu trắng
group: tray_fur
image.brief: Dùng lại hình `explore_bear`. Từ khoá tìm ảnh (EN): polar bear sea ice
image.alt.en: A polar bear on floating ice
image.alt.vi: Gấu trắng trên tảng băng trôi

#### item tray_penguin
label.en: Penguin
label.vi: Chim cánh cụt
group: tray_not
image.brief: Dùng lại hình `tray_antarctica` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): penguins Antarctica rocks glacier
image.alt.en: Penguins on a cold, stony beach
image.alt.vi: Chim cánh cụt trên bãi đá lạnh
> Ảnh gốc là chim cánh cụt Gentoo trên bãi sỏi ven biển đảo Danco (Nam Cực); sau lưng là biển có băng vụn và núi phủ tuyết. Designer đã làm mục `crop` vuông riêng thấy rõ hai con, cắt bỏ nhóm du khách ở góc trên phải ảnh gốc. Gấu trắng và chim cánh cụt không chung một ảnh.
> `alt` đổi 16/11 theo ảnh thật (designer): bản trước "Penguins on icy land" · "Chim cánh cụt trên vùng đất phủ băng", nhưng mặt đất trong ảnh là sỏi, không phải băng. `alt` gốc ở *Bề mặt Trái Đất* chưa đổi, nên đây là `alt` riêng của chủ đề (bảng "alt riêng" ở `_topic.md`).

#### item tray_walrus
label.en: Walrus
label.vi: Hải mã
group: tray_fat
image.brief: Dùng lại hình `explore_walrus`. Từ khoá tìm ảnh (EN): walrus ice Odobenus
image.alt.en: A walrus resting on the ice
image.alt.vi: Hải mã nằm nghỉ trên băng

#### item tray_douc
label.en: Douc
label.vi: Con voọc
group: tray_not
image.brief: Dùng lại hình `explore_wild` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): red-shanked douc langur tree
image.alt.en: A douc in a tree
image.alt.vi: Con voọc trên cây

#### item tray_owl
label.en: Snowy owl
label.vi: Cú tuyết
group: tray_feathers
image.brief: [ảnh] Một con cú tuyết lông trắng đậu trên mặt đất phủ tuyết hoặc trên tảng đá giữa tuyết, nhìn ngang hoặc nhìn thẳng, thấy cả con và lớp lông vũ dày phủ tới chân; ảnh ngang có khoảng trống quanh con chim (dùng cả khung vuông và thẻ ba lựa chọn ở bài sau); chim hoang dã: không thấy chuồng, găng tay người nuôi chim, dây buộc chân, người hay chữ; không có con mồi trong mỏ, trong móng. Từ khoá tìm ảnh (EN): Bubo scandiacus; snowy owl snow
image.alt.en: A snowy owl on the snow
image.alt.vi: Cú tuyết trên nền tuyết
> Hình gốc của cả chủ đề (bài 2, 3, 4 dùng lại).
> [CẦN KIỂM] Cú tuyết sống ở vùng Bắc Cực, có lông vũ dày phủ cả chân; không có ở Nam Cực.

#### item tray_fox
label.en: Arctic fox
label.vi: Cáo Bắc Cực
group: tray_fur
image.brief: Dùng lại hình `explore_fox`. Từ khoá tìm ảnh (EN): Vulpes lagopus
image.alt.en: An Arctic fox in the snow
image.alt.vi: Cáo Bắc Cực trên tuyết

#### item tray_croc
label.en: Crocodile
label.vi: Cá sấu
group: tray_not
image.brief: [ảnh] Một con cá sấu Xiêm hoang dã nằm nghỉ trên bờ sông bùn, miệng khép, nhìn ngang, thấy cả con từ đầu tới đuôi và lớp vảy; ảnh ngang có khoảng trống quanh con vật (dùng cả khung vuông kệ Chơi, thẻ ba lựa chọn rất ngang 5:2 câu q4 và hình câu đúng sai 4:3 ở bài 4, bài 6); không há miệng nhe nanh, không có con mồi, máu, chuồng, hàng rào trại nuôi, người, thuyền hay chữ. Từ khoá tìm ảnh (EN): Crocodylus siamensis; Siamese crocodile riverbank
image.alt.en: A crocodile on a riverbank
image.alt.vi: Con cá sấu trên bờ sông
> Hình gốc của cả chủ đề từ 16/11 (câu q4 bài này; bài 4, 5, 6, 7 dùng lại). Trước đó món này dùng lại `q1_reptiles` của *Khủng long*: cá sấu há miệng, thấy rõ răng, trái Quy ước hình số bốn ở `_topic.md`. Designer đổi sang ảnh cá sấu Xiêm non hoang dã, miệng khép, trên bờ sông bùn (CC0, SK-048 mục "designer 16/11 · ảnh bài 2–8"). `alt` giữ.

#### item tray_reindeer
label.en: Reindeer
label.vi: Tuần lộc
group: tray_fur
image.brief: [ảnh] Tuần lộc có gạc (một con hoặc vài con) đứng, kiếm ăn trên nền tuyết, nhìn ngang, thấy cả con và bộ lông dày; ảnh ngang có khoảng trống hai bên (dùng cả khung vuông kệ Chơi và thẻ ba lựa chọn câu q4 bài 2); không thấy dây cương, yên, vòng cổ, chuông, xe trượt, hàng rào, nhà, người hay chữ. Từ khoá tìm ảnh (EN): Rangifer tarandus; reindeer tundra
image.alt.en: Reindeer in the snow
image.alt.vi: Tuần lộc trên tuyết
> Hình gốc (câu q4 bài 2 dùng lại). Ảnh designer đã chọn 16/11: đàn tuần lộc hoang dã (caribou, cùng loài) kiếm ăn trên sườn đồi tuyết ở Alaska; ô vuông có hai con, một con có gạc. `alt.en` bỏ "A" vì ảnh có nhiều con; `alt.vi` giữ.
> Câu q4 bài này **không** dùng ảnh này nữa (tester N1, 16/11): ảnh riêng `q4_reindeer`, không có tuyết (ghi chú dưới câu q4).
> [CẦN KIỂM] Tuần lộc có lông dày giữ ấm; ở Bắc Cực có đàn hoang dã và đàn do người chăn (bài không gọi tuần lộc là động vật hoang dã, chỉ nói lông dày).

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1, q3, q4; ba lựa chọn), `true_false` (q2 Đúng, q5 Đúng, q6 Sai). Không `order_sequence`: các ý của bài không có thứ tự tự nhiên.
> Hình câu `single_choice` là hàng rào tre trung tính (app Explorer ẩn hình câu hỏi khi mọi lựa chọn có hình). Câu nào cũng tự đủ nghĩa khi chỉ nghe.
> Không câu nào hỏi "gấu trắng sống ở đâu" (cặp gấu trắng với Bắc Cực của quiz Oak Science); con vật Bắc Cực trong câu hỏi là hải mã, cáo Bắc Cực, tuần lộc.

### q1
id: 79131e8e-45aa-4a44-a485-df668ea63522
format: single_choice
version: 1
dok: 1
prompt.en: Which animal lives in the Arctic?
prompt.vi: Con nào sống ở Bắc Cực?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of a very cold, icy place.
hint.vi: Em nghĩ tới một nơi rất lạnh, đầy băng nhé.
explanation_correct.en: Yes! A walrus rests on the sea ice.
explanation_correct.vi: Đúng rồi! Hải mã nằm nghỉ trên băng biển.
explanation_wrong.en: The answer is the walrus. Thick fat keeps it warm.
explanation_wrong.vi: Đáp án là con hải mã. Lớp mỡ dày giữ ấm cho hải mã.
> Hai lựa chọn sai là con vật nơi nóng bé đã gặp ở hai chủ đề trước (voọc, cá thòi lòi); đáp án là ảnh bé vừa xem ở Học, không phải ảnh mới duy nhất.

#### option q1_douc
correct: false
feedback.en: A douc lives in warm forest trees.
feedback.vi: Voọc sống trên cây trong rừng ấm áp.
label.en: douc
label.vi: con voọc
image.brief: Dùng lại hình `explore_wild` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): red-shanked douc langur tree
image.alt.en: A douc in a tree
image.alt.vi: Con voọc trên cây

#### option q1_mudskipper
correct: false
feedback.en: A mudskipper hops on warm, wet mud.
feedback.vi: Cá thòi lòi nhảy trên bùn ướt và ấm.
label.en: mudskipper
label.vi: cá thòi lòi
image.brief: Dùng lại hình `mudskipper` ở bài `sinh-vat-song-o-dau/noi-song-cua-con-vat`. Từ khoá tìm ảnh (EN): mudskipper on mud Periophthalmus
image.alt.en: A mudskipper by the water
image.alt.vi: Cá thòi lòi bên mép nước
> `alt` riêng của chủ đề (designer 16/11): ảnh thật là cá thòi lòi trên mỏm đá bùn ven nước. `alt` gốc ở *Sinh vật sống ở đâu?* bài bốn ("A mudskipper on the mud") chưa đổi; chủ đề này không sửa bài gốc.

#### option q1_walrus
correct: true
label.en: walrus
label.vi: hải mã
image.brief: Dùng lại hình `explore_walrus`. Từ khoá tìm ảnh (EN): walrus ice Odobenus
image.alt.en: A walrus resting on the ice
image.alt.vi: Hải mã nằm nghỉ trên băng

### q2
id: 14479b6d-7518-4980-9cc5-ada5ec5cc623
format: true_false
version: 1
dok: 1
prompt.en: Thick fur keeps an Arctic fox warm.
prompt.vi: Bộ lông dày giữ ấm cho cáo Bắc Cực.
image.brief: Dùng lại hình `explore_fox`. Từ khoá tìm ảnh (EN): Vulpes lagopus
image.alt.en: An Arctic fox in the snow
image.alt.vi: Cáo Bắc Cực trên tuyết
answer: true
hint.en: Look closely at the fox's fur.
hint.vi: Em nhìn kỹ bộ lông của con cáo nhé.
explanation_correct.en: Yes! Its fluffy tail keeps it warm, too.
explanation_correct.vi: Đúng rồi! Cái đuôi xù cũng giúp cáo giữ ấm.
explanation_wrong.en: This is true. Thick fur keeps the fox warm.
explanation_wrong.vi: Câu này đúng. Bộ lông dày giữ ấm cho cáo.
feedback_false.en: Its thick fur even covers its feet.
feedback_false.vi: Lông dày phủ kín cả bàn chân cáo.
> DOK 1: nhớ lại câu chính ô "Arctic fox". Ảnh thấy bộ lông dày (nhớ lại kèm quan sát, như câu mở đầu của các chủ đề trước).
> [CẦN KIỂM] Lông phủ dưới bàn chân cáo Bắc Cực; đuôi xù giúp giữ ấm.

### q3
id: 6ba1d0f3-a37d-44e9-bce1-9e8dc86a7b2e
format: single_choice
version: 1
dok: 1
prompt.en: Which picture shows the Arctic?
prompt.vi: Hình nào là Bắc Cực?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about where a polar bear walks.
hint.vi: Em nghĩ xem gấu trắng đi lại ở đâu nhé.
explanation_correct.en: Yes! Sea ice floats on the cold sea.
explanation_correct.vi: Đúng rồi! Băng biển nổi trên mặt biển lạnh.
explanation_wrong.en: The answer is the sea ice. It is very cold.
explanation_wrong.vi: Đáp án là băng biển. Ở đó rất lạnh.
> Ba ảnh cảnh khác nhau rõ bằng mắt. Hai lựa chọn sai là nơi sống bé đã học ở *Sinh vật sống ở đâu?* bài bốn (rừng, ao); đáp án là ô Học hôm nay. `alt` của đáp án không có chữ "Arctic".
> Gợi ý trỏ tới ảnh gấu trắng trên băng ở ô "Polar bear", không nói thẳng "băng".

#### option q3_ice
correct: true
label.en: sea ice
label.vi: băng biển
image.brief: Dùng lại hình `explore_ice`. Từ khoá tìm ảnh (EN): Arctic sea ice
image.alt.en: Sea ice on a cold sea
image.alt.vi: Băng nổi trên biển lạnh

#### option q3_forest
correct: false
feedback.en: This forest is warm and green.
feedback.vi: Khu rừng này ấm áp và xanh tươi.
label.en: forest
label.vi: khu rừng
image.brief: Dùng lại hình `tray_forest` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): forest green canopy aerial
image.alt.en: A green forest
image.alt.vi: Khu rừng xanh

#### option q3_pond
correct: false
feedback.en: This pond is warm, with frogs and fish.
feedback.vi: Cái ao này ấm, có ếch và cá.
label.en: pond
label.vi: cái ao
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê

### q4
id: a7b47f34-72c2-4d69-8c3b-15f4e6a609f2
format: single_choice
version: 1
dok: 2
prompt.en: Which animal stays warm in the snow?
prompt.vi: Con nào giữ được ấm giữa trời tuyết?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about the Arctic fox's fur.
hint.vi: Em nghĩ tới bộ lông của cáo Bắc Cực nhé.
explanation_correct.en: Yes! A reindeer has thick, warm fur.
explanation_correct.vi: Đúng rồi! Tuần lộc có bộ lông dày và ấm.
explanation_wrong.en: The answer is the reindeer. Its fur is thick.
explanation_wrong.vi: Đáp án là con tuần lộc. Lông tuần lộc rất dày.
> DOK 2: áp ý chính hai ("lông dày, lớp mỡ giữ ấm") vào ba con vật, so lớp phủ cơ thể (lông dày, vảy, lông thưa). Tuần lộc bé đã gặp ở kệ Chơi; cá sấu và trâu bé đã gặp từ chủ đề số một.
> Cả ba ảnh đều không có tuyết (sửa theo tester N1, 16/11): ảnh tuần lộc là ảnh riêng `q4_reindeer`, chụp trên vùng đất lạnh không tuyết, nên bé phải so bộ lông chứ không chọn theo nền ảnh. Trâu và tuần lộc cùng có sừng, gạc nhưng khác hẳn bằng mắt (lông, màu).

#### option q4_croc
correct: false
feedback.en: A crocodile has scales, not thick fur.
feedback.vi: Cá sấu có vảy, không có lông dày.
label.en: crocodile
label.vi: cá sấu
image.brief: Dùng lại hình `tray_croc`. Từ khoá tìm ảnh (EN): Crocodylus siamensis
image.alt.en: A crocodile on a riverbank
image.alt.vi: Con cá sấu trên bờ sông

#### option q4_reindeer
correct: true
label.en: reindeer
label.vi: tuần lộc
image.brief: [ảnh] Một con tuần lộc đứng trên đồng rêu hoặc bãi cỏ thấp của vùng đất lạnh vào mùa hè, nhìn ngang, thấy cả con, rõ bộ lông dày và gạc; nền đồng rêu xanh nâu, có thể thấy đồi thấp và trời xám; không có tuyết hay băng trên mặt đất (câu hỏi có chữ "tuyết", ảnh đáp án không được là ảnh duy nhất có tuyết); ảnh ngang có khoảng trống hai bên (thẻ ba lựa chọn rất ngang 5:2); không thấy dây cương, yên, vòng cổ, chuông, xe trượt, hàng rào, nhà, người hay chữ. Từ khoá tìm ảnh (EN): Rangifer tarandus tundra; caribou tundra; reindeer summer tundra
image.alt.en: A reindeer on cold land
image.alt.vi: Tuần lộc trên vùng đất lạnh
> **Designer phải đổi ảnh `q4_reindeer`** (tester N1, 16/11). Bản trước dùng lại `tray_reindeer` (đàn tuần lộc trên tuyết): đó là ảnh duy nhất có tuyết trong ba lựa chọn, `alt` cũng có chữ "snow", trong khi câu hỏi hỏi đúng chữ "snow" · "tuyết" (Quy ước hình số tám, Lỗi hay gặp số mười hai ở `_topic.md`). Nay là ảnh riêng không tuyết, chỉ dùng ở chỗ này; ngoại lệ có chủ ý với luật "cùng một vật thì dùng một ảnh".
> Dự phòng nếu không có ảnh hợp lệ không tuyết: giữ ảnh `tray_reindeer` với `alt` riêng "A reindeer with thick fur" · "Tuần lộc có bộ lông dày" và báo phiên chính (ảnh vẫn lộ nền tuyết, nên chỉ dùng khi hết cách).

#### option q4_buffalo
correct: false
feedback.en: A buffalo has thin hair and likes mud.
feedback.vi: Trâu có lông thưa và thích đầm mình trong bùn.
label.en: buffalo
label.vi: con trâu
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu
> [CẦN KIỂM] Trâu nước có lông thưa, hay đầm mình trong bùn, nước cho mát.

### q5
id: 589e5cd8-3472-4040-8db0-65317ac8d67c
format: true_false
version: 1
dok: 2
prompt.en: White fur helps polar bears hide on ice.
prompt.vi: Bộ lông trắng giúp gấu trắng ẩn mình trên băng.
image.brief: Dùng lại hình `explore_bear`. Từ khoá tìm ảnh (EN): polar bear sea ice
image.alt.en: A polar bear on floating ice
image.alt.vi: Gấu trắng trên tảng băng trôi
answer: true
hint.en: Look at the bear's fur and the ice.
hint.vi: Em nhìn màu lông gấu và màu băng nhé.
explanation_correct.en: Yes! White on white is hard to see.
explanation_correct.vi: Đúng rồi! Màu trắng trên nền trắng rất khó nhìn thấy.
explanation_wrong.en: This is true. White fur is hard to see on ice.
explanation_wrong.vi: Câu này đúng. Lông trắng rất khó nhìn thấy trên băng.
feedback_false.en: The bear's fur is white, like the ice.
feedback_false.vi: Lông gấu trắng giống màu băng.
> DOK 2: suy ra từ điều nhìn thấy (lông trắng như tuyết ở ô "Polar bear", nền băng trắng trong ảnh) tới tác dụng (khó bị nhìn thấy). Ô Học chỉ nói "white fur, like snow", không nói "hide".
> [CẦN KIỂM] Lông gấu trắng (sợi lông trong, trông trắng) giúp gấu lẫn vào băng tuyết khi rình hải cẩu.

### q6
id: 1896d28d-75a1-49b6-b823-8fb545536368
format: true_false
version: 1
dok: 2
misconception: polar_bears_eat_penguins
prompt.en: Polar bears eat penguins.
prompt.vi: Gấu trắng ăn chim cánh cụt.
image.brief: Dùng lại hình `explore_bear`. Từ khoá tìm ảnh (EN): polar bear sea ice
image.alt.en: A polar bear on floating ice
image.alt.vi: Gấu trắng trên tảng băng trôi
answer: false
hint.en: Think about who lives on the Arctic ice.
hint.vi: Em nghĩ xem những con nào sống trên băng Bắc Cực nhé.
explanation_correct.en: Penguins live far away from polar bears.
explanation_correct.vi: Chim cánh cụt sống rất xa gấu trắng.
explanation_wrong.en: This is false. No penguins live in the Arctic.
explanation_wrong.vi: Câu này sai. Ở Bắc Cực không có chim cánh cụt.
feedback_true.en: Polar bears catch seals on the sea ice.
feedback_true.vi: Gấu trắng bắt hải cẩu trên băng biển.
> Câu misconception (`polar_bears_eat_penguins`, misconception của sườn), bằng hình, DOK 2: bé còn nghĩ "nơi lạnh nào cũng có chim cánh cụt" sẽ chạm gật đầu. Bé áp điều đã học (ví dụ ba ô "Polar bear", món bẫy chim cánh cụt ở Chơi) để bác câu nói. Câu chỉ kiểm một việc: gấu trắng và chim cánh cụt có ở cùng một nơi không.
> Hình là gấu trắng một mình trên băng, không có chim cánh cụt, không cảnh săn mồi; ảnh không làm bằng chứng cho phía nào. Gợi ý trỏ tới các con vật bé đã gặp trên băng Bắc Cực (gấu trắng, cáo, hải mã, cú tuyết), không nói thẳng.
> `explanation_correct` đứng một mình được cho thẻ "Ý sai → Ý đúng" ở bước Tổng kết: "Polar bears eat penguins." → "Penguins live far away from polar bears.".

## Từ vựng

### arctic
id: c3bdaf57-7df1-48af-9fc5-f7ca01daaf76
tier: core
term.en: Arctic
term.vi: Bắc Cực
example.en: The Arctic is far to the north.
example.vi: Bắc Cực ở tận phía bắc Trái Đất.
image.brief: Dùng lại hình `explore_ice`. Từ khoá tìm ảnh (EN): Arctic sea ice
image.alt.en: Sea ice on a cold sea
image.alt.vi: Băng nổi trên biển lạnh

### ice
id: 64108b08-b3b7-46d4-8e3c-61bb5dd9f3e8
tier: core
term.en: ice
term.vi: băng
example.en: Ice is hard and very cold.
example.vi: Băng cứng và rất lạnh.
image.brief: Dùng lại hình `explore_more_oceans` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): iceberg ocean floating ice
image.alt.en: Floating ice in a cold ocean
image.alt.vi: Băng trôi trên đại dương lạnh
> Ảnh gốc chụp ở vịnh hẹp Greenland, 70 độ bắc (vùng Bắc Cực), theo file chọn ảnh của bài đó. Hai từ `arctic` và `ice` dùng hai ảnh khác nhau.

### polar_bear
id: 3aa26c87-c1c4-4225-b5a0-c1f4d160f86f
tier: extra
term.en: polar bear
term.vi: gấu trắng
example.en: A polar bear swims in icy water.
example.vi: Gấu trắng bơi trong nước lạnh giá.
image.brief: Dùng lại hình `explore_bear`. Từ khoá tìm ảnh (EN): polar bear sea ice
image.alt.en: A polar bear on floating ice
image.alt.vi: Gấu trắng trên tảng băng trôi
> [CẦN KIỂM] Gấu trắng bơi giỏi, bơi được xa trong nước lạnh.

### walrus
id: 66cfbaf8-e8a0-4c03-ac82-0ae0fc409901
tier: extra
term.en: walrus
term.vi: hải mã
example.en: A walrus has two long tusks.
example.vi: Hải mã có hai chiếc ngà dài.
image.brief: Dùng lại hình `explore_walrus`. Từ khoá tìm ảnh (EN): walrus ice Odobenus
image.alt.en: A walrus resting on the ice
image.alt.vi: Hải mã nằm nghỉ trên băng

### arctic_fox
id: efd808d6-85e3-4a6b-bc1e-f3e04261cbcb
tier: extra
term.en: Arctic fox
term.vi: cáo Bắc Cực
example.en: An Arctic fox curls up in the snow.
example.vi: Cáo Bắc Cực cuộn tròn trong tuyết.
image.brief: Dùng lại hình `explore_fox`. Từ khoá tìm ảnh (EN): Vulpes lagopus
image.alt.en: An Arctic fox in the snow
image.alt.vi: Cáo Bắc Cực trên tuyết

## Thưởng

### polar_bear_card
id: 978520e2-a301-42a6-9baa-559aac2cb1f5
set: animals
rarity: rare
name.en: Polar bear
name.vi: Gấu trắng
tag.en: Lives on the sea ice
tag.vi: Sống trên băng biển
fact.en: Under its white fur, its skin is black.
fact.vi: Dưới bộ lông trắng, da gấu trắng màu đen.
image.brief: Dùng lại hình `explore_bear`. Từ khoá tìm ảnh (EN): polar bear sea ice
image.alt.en: A polar bear on floating ice
image.alt.vi: Gấu trắng trên tảng băng trôi
> [CẦN KIỂM] Da gấu trắng màu đen.
> Bộ `set: animals` đã có (chủ đề số một); gấu trắng chưa có thẻ.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Không bản đồ, không quả địa cầu, không ảnh Trái Đất từ vũ trụ. Con vật hoang dã: không chuồng, lưới, vòng cổ, thẻ tai, dây cương, găng tay nuôi chim, người, thuyền, chữ. Không cảnh săn mồi; gấu trắng và chim cánh cụt không chung một ảnh.
- **Ảnh mới (tám):** băng biển Bắc Cực không con vật (`explore_ice`); cáo Bắc Cực lông trắng trên tuyết (`explore_fox`); hải mã nằm nghỉ trên băng (`explore_walrus`); tuần lộc trên tuyết, không dây cương (`tray_reindeer`); cú tuyết trên tuyết (`tray_owl`). Năm ảnh này là hình gốc của cả chủ đề (bảng Hình dùng chung ở `_topic.md`): giữ đúng key. Thêm 16/11 sau rà chữ: tuần lộc trên vùng đất lạnh **không tuyết** (`q4_reindeer`, chỉ dùng ở câu q4, thẻ 5:2). Thêm 16/11 sau lượt ảnh bài 2 đến 8: gấu trắng đi trên băng biển (`explore_bear`, thay `tray_arctic` của *Bề mặt Trái Đất*) và cá sấu Xiêm miệng khép trên bờ sông bùn (`tray_croc`, thay `q1_reptiles` của *Khủng long*); hai ảnh này cũng là hình gốc của cả chủ đề.
- **Đổi sau rà chữ 16/11** (bảng "Hình đổi sau rà chữ" ở SK-048): `q4_reindeer` cần ảnh mới; `tray_penguin` giữ ảnh, đổi `alt` theo ảnh thật (bãi sỏi); `tray_reindeer` giữ ảnh, `alt.en` bỏ "A"; `explore_walrus` giữ ảnh, `brief` bỏ "giữa biển"; `q1_mudskipper` giữ ảnh, đổi `alt`.
- **Ảnh dùng lại:** *Bề mặt Trái Đất* bài hai: `tray_antarctica` (chim cánh cụt Gentoo: món bẫy, cần `crop` vuông riêng), `explore_more_oceans` (băng trôi Greenland: từ `ice`); *Bề mặt Trái Đất* bài một: `tray_forest` (q3); *Gọi tên và nhóm động vật*: `w1` hàng rào tre (hình câu w2, q1, q3, q4), `explore_wild` voọc (w2, q1, kệ Chơi), `ca-va-luong-cu` `q1` ao làng (w1, q3); *Khủng long*: `w3_cat` (w2), `w1_buffalo` trâu (q4); *Sinh vật sống ở đâu?*: `mudskipper` (q1). Trong bài: `explore_bear` (kệ Chơi, q5, q6, từ, thẻ), `tray_croc` (q4).
- **Một ảnh, hai khung:** cáo Bắc Cực, hải mã, tuần lộc (`tray_reindeer`), cá sấu (`tray_croc`) dùng ở khung vuông (Học hoặc kệ Chơi) và thẻ ba lựa chọn rất ngang 5:2 (hải mã ở q1, cá sấu ở q4 bài này; bài sau còn dùng, tuần lộc ở q4 bài 2). Gấu trắng (`explore_bear`) dùng ở khung vuông và khung 4:3 của câu q5, q6. `q4_reindeer` là ảnh riêng, chỉ khung 5:2. Chọn ảnh ngang có khoảng trống quanh con vật; làm mục riêng có `crop` riêng cho từng khung.
- **Ảnh khó:**
  - tuần lộc: Commons khoảng bảy ảnh qua luật, nhiều ảnh có người, dây cương. `tray_reindeer` đã chọn (đàn tuần lộc trên sườn đồi tuyết). `q4_reindeer` cần ảnh tuần lộc trên đồng rêu, bãi cỏ thấp, không có tuyết; tìm `Rangifer tarandus tundra`, `caribou tundra`. Không có ảnh hợp lệ thì báo phiên chính (phương án dự phòng ghi dưới câu q4);
  - cú tuyết, cáo Bắc Cực: nhiều ảnh ở sở thú hay có găng tay người nuôi chim; chọn ảnh ngoài tự nhiên;
  - băng biển: phải không có gấu trắng hay con vật nào (ảnh này là đáp án câu q3 và hình từ `arctic`); không chọn núi băng cao (dễ thành ảnh Nam Cực) hay ảnh vệ tinh.
- **Cần kiểm thêm (xong 16/11):** ảnh gấu trắng cũ `tray_arctic` có tên trang gốc nói băng biển ngắn lại và giấy phép không rõ; designer đã đổi sang ảnh USFWS gấu đi trên băng biển (`explore_bear`, Public domain, tên trung tính "Polar bear walking on sea ice"). Ảnh cá sấu cũ `q1_reptiles` há miệng thấy răng; designer đã đổi sang ảnh cá sấu miệng khép (`tray_croc`).
- **Màu:** Học: băng `cham`, gấu trắng `vang_hoe`, cáo Bắc Cực `gi_dong`, hải mã `nau_dat`. Chơi: lông dày `gi_dong`, lông vũ dày `cham`, lớp mỡ dày `vang_hoe`, không sống ở Bắc Cực `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (arctic, ice). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món. Khởi động `true_false` (w1 Đúng), `single_choice` (w2, hai lựa chọn). Quiz `single_choice` (q1, q3, q4; ba lựa chọn), `true_false` (q2 Đúng, q5 Đúng, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`polar_bears_eat_penguins`). Không có `labels` ở câu `true_false`.
- **Vị trí đáp án:** app xáo lựa chọn (SK-047). Thứ tự trong file theo bảng ở `_topic.md`: w2 đáp án ở chỗ hai, q1 chỗ ba, q3 chỗ một, q4 chỗ hai.
- **Màn Chơi, ví dụ để kiểm:** Gấu trắng, Cú tuyết, Hải mã → `balanced`; Cáo Bắc Cực, Chim cánh cụt, Hải mã → `has_limited`; Gấu trắng, Tuần lộc, Hải mã → `missing.tray_feathers`; Cú tuyết, Hải mã, Con voọc → `has_limited`.
- **Khởi động trỏ sang chủ đề khác:** w1 → `sinh-vat-song-o-dau/noi-song-cua-con-vat`, w2 → `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha` (hai bài đã có id).
- **Từ EN có thể ngoài Starters/Movers:** Arctic, icy, walrus, tusks, reindeer, snowy owl, seals, penguins, freezer, fluffy, layer, habitat, hiding places, douc, mudskipper, crocodile, buffalo. Nghe thử giọng EN đọc "walrus", "reindeer", "Arctic fox".
