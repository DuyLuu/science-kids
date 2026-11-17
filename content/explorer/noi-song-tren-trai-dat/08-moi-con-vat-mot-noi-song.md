---
id: c18ec458-eed3-4107-8bc8-23d0c4986e06
topic: noi-song-tren-trai-dat
slug: moi-con-vat-mot-noi-song
order: 8
stage: review
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Every animal has its place
vi: Mỗi con vật một nơi sống
> Giữ đúng tên ở `content/syllabus.json` (key `new-habitats-around-the-world`, bài số tám).

## Mục tiêu
en: I can match animals to places on Earth.
vi: Em ghép được con vật với nơi sống trên Trái Đất.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 16/11/2026. Ticket SK-048. Mọi dòng `id:` để trống; chạy `ids` sau bài 7 (Khởi động trỏ bài 7 và bài 2 của chủ đề này).
> Sườn: không có lesson Oak riêng; dùng ý chung của Oak Địa lý Year 2 unit 3 *Cold places* và unit 4 *Hot places* (so sánh nơi nóng, nơi lạnh). Không bản đồ, không quả địa cầu, không ảnh Trái Đất từ vũ trụ. Không dùng "adaptation", "adapt", "thích nghi"; nói "giúp", "giữ ấm", không nói con vật "thay đổi để".
> Bài tổng kết (`review`): gom bảy nơi sống của bài 1 tới 7 thành bốn kiểu nơi (lạnh; nóng và khô; nóng và ướt; dưới nước). Không có con vật hay nơi sống mới; mọi hình là hình dùng lại, cộng một hình ghép cho từ `earth`.
> Sửa `animals_live_anywhere` ở ý chính hai và ba, ví dụ ba của ô "Hot and dry" ("too hot for thick, warm fur"), phần Chơi (ba nơi khác nhau, bẫy vật nuôi) và câu q6 (gắn key). Khởi động w3 ôn ý đúng của `plants_grow_anywhere` (cặp đôi, phía cây).
> Hai chỗ lệch `_topic.md`, ghi ở đúng chỗ: (1) `alt` của lựa chọn `w1_camel` rút thành "A camel" · "Con lạc đà"; (2) kệ Chơi nhóm "Hot and dry" dùng thằn lằn (`tray_lizard`) thay lạc đà.

## Ý chính
1.en: Earth has hot, cold, wet and dry places.
1.vi: Trái Đất có nơi nóng, nơi lạnh, nơi ướt, nơi khô.
2.en: Animals have bodies that help them live there.
2.vi: Cơ thể con vật giúp nó sống được ở nơi đó.
3.en: Wild animals need their own wild places.
3.vi: Động vật hoang dã cần nơi sống hoang dã của chúng.
> Từ cụ thể tới trừu tượng: các kiểu nơi bé nhìn thấy (nóng, lạnh, ướt, khô), rồi điều trên cơ thể giúp con vật sống ở đó (lông dày, lớp mỡ, tai to, móng bám cành), rồi ý chung "mỗi con vật cần đúng kiểu nơi sống của nó" (sửa `animals_live_anywhere`). Chữ chốt ở `_topic.md`.
> "Wet" và "dry" bé đã học làm từ `core` ở *Sinh vật sống ở đâu?* bài năm; bài này không đưa lại vào từ vựng.

## Khởi động

> Ba câu: w1 ôn bài 7 (bài ngay trước), w2 ôn bài 2 (cách sáu bài), w3 ôn *Sinh vật sống ở đâu?* bài năm (mốc khoảng một tháng; ý đúng của `plants_grow_anywhere`, cặp với `animals_live_anywhere` ở câu q6). Cả ba DOK 1. Câu mới, không chép câu hỏi cũ.

### w1
id: 2e0eaafb-676b-4e97-98b2-460d8689a46e
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: noi-song-tren-trai-dat/sa-mac
prompt.en: Which one can walk far on hot sand?
prompt.vi: Con nào đi được rất xa trên cát nóng?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of the hot, dry desert.
hint.vi: Em nghĩ tới sa mạc khô và nóng nhé.
explanation_correct.en: Yes! Its hump stores fat for long trips.
explanation_correct.vi: Đúng rồi! Bướu lạc đà chứa mỡ cho những chuyến đi xa.
explanation_wrong.en: The answer is the camel. It walks on sand.
explanation_wrong.vi: Đáp án là con lạc đà. Lạc đà đi được trên cát nóng.
> Ôn câu chính ô "Camel" bài 7 ("A camel can walk far on hot sand."), hỏi theo hướng ngược (từ việc làm tới con vật). Lựa chọn sai là hải mã của bài 1 (nơi lạnh nhất), khác hẳn bằng mắt. Giải thích khi đúng nhắc lại ý sửa `camel_hump_water` của bài 7 (bướu chứa mỡ).
> [CẦN KIỂM] Bướu lạc đà chứa mỡ, cơ thể dùng dần khi đi đường xa ít thức ăn.

#### option w1_camel
correct: true
label.en: camel
label.vi: con lạc đà
image.brief: Dùng lại hình `explore_camel` ở bài `noi-song-tren-trai-dat/sa-mac`. Từ khoá tìm ảnh (EN): Camelus dromedarius
image.alt.en: A camel
image.alt.vi: Con lạc đà
> Lệch `_topic.md` (bảng `alt` hình gốc ghi "A camel on the sand" · "Lạc đà trên cát"): `alt` gốc có chữ "sand" · "cát" của câu hỏi, mà lạc đà là đáp án đúng (mục "Lỗi hay gặp" số 12; TEMPLATE cho sửa `alt` để khỏi lộ đáp án). Ảnh giữ nguyên; chỉ `alt` chỗ này đổi. Câu q1 (lạc đà là lựa chọn sai) giữ `alt` gốc.

#### option w1_walrus
correct: false
feedback.en: A walrus rests on the cold sea ice.
feedback.vi: Hải mã nằm nghỉ trên băng biển lạnh.
label.en: walrus
label.vi: hải mã
image.brief: Dùng lại hình `explore_walrus` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): walrus ice Odobenus
image.alt.en: A walrus resting on the ice
image.alt.vi: Hải mã nằm nghỉ trên băng

### w2
id: bbf891b0-b72a-4885-9ed1-643ce50c9b73
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: noi-song-tren-trai-dat/nam-cuc
prompt.en: Penguins find their food in the sea.
prompt.vi: Chim cánh cụt tìm thức ăn dưới biển.
image.brief: Dùng lại hình `explore_sea_food` ở bài `noi-song-tren-trai-dat/nam-cuc`. Từ khoá tìm ảnh (EN): Pygoscelis adeliae
image.alt.en: A penguin at the edge of the sea
image.alt.vi: Chim cánh cụt bên mép biển
answer: true
hint.en: Look at where this penguin stands.
hint.vi: Em nhìn xem chú chim cánh cụt đang đứng ở đâu nhé.
explanation_correct.en: Yes! Penguins use their wings to swim.
explanation_correct.vi: Đúng rồi! Chim cánh cụt dùng cánh để bơi.
explanation_wrong.en: This is true. Penguins dive into the sea to eat.
explanation_wrong.vi: Câu này đúng. Chim cánh cụt lặn xuống biển kiếm ăn.
feedback_false.en: The icy land has almost no food.
feedback_false.vi: Đất phủ băng gần như không có thức ăn.
> Ôn ý chính hai bài 2 ("Its animals find food in the sea."), mốc cách sáu bài. Hình là chim cánh cụt bên mép băng sát mặt biển (đúng vật được nói tới, hình gốc của ô "Food in the sea" bài 2). Giải thích khi đúng nối sang *Gọi tên và nhóm động vật* bài ba (chim cánh cụt bơi bằng cánh).
> Phản hồi nói về "Icy land" (nhãn ô Học bài 2), không lặp gợi ý.
> [CẦN KIỂM] Chim cánh cụt lặn xuống biển kiếm ăn; đất phủ băng ở Nam Cực gần như không có thức ăn cho con vật (mọi con vật ở Nam Cực kiếm ăn ở biển).

### w3
id: f37c1033-932f-4c72-810a-7a073a3126db
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/noi-song-cua-cay
prompt.en: A lotus needs water to grow.
prompt.vi: Cây sen cần nước để lớn.
image.brief: Dùng lại hình `w1_lotus` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): pink lotus flower pond
image.alt.en: A lotus flower on a pond
image.alt.vi: Bông hoa sen trên mặt ao
answer: true
hint.en: Look at where the lotus is growing.
hint.vi: Em nhìn xem cây sen đang mọc ở đâu nhé.
explanation_correct.en: Yes! Each plant needs its own kind of place.
explanation_correct.vi: Đúng rồi! Mỗi loài cây cần đúng kiểu nơi sống của nó.
explanation_wrong.en: This is true. A lotus grows in water and mud.
explanation_wrong.vi: Câu này đúng. Cây sen mọc trong nước và bùn.
feedback_false.en: Lotus leaves float on the pond water.
feedback_false.vi: Lá sen nổi trên mặt nước ao.
> Ôn ý đúng của `plants_grow_anywhere` (*Sinh vật sống ở đâu?* bài năm) bằng câu khẳng định mới, không chép câu q6 của bài đó ("A lotus can grow in dry sand."). Không nhắc xương rồng, không nhắc cát (tránh gắn xương rồng với sa mạc ngay sau bài 7).
> Giải thích khi đúng nói ý chung cho cây, để câu q6 hôm nay nói đúng ý đó cho con vật.

## Học

> Bốn ô, toàn hình dùng lại: ba kiểu nơi trên cạn (lạnh; nóng và khô; nóng và ướt) và nơi dưới nước. Mỗi ô một câu chính nói điều giúp con vật sống ở nơi đó (ý chính hai), ba ví dụ gọi lại con vật của bài 1 tới 7.
> Chữ dạy trước cho Quiz: ví dụ hai ô "Cold" (hải mã, q1); ví dụ hai ô "Hot and wet" (con lười trên cây cao, q2); ví dụ hai ô "In the water" (rùa biển ở rạn san hô, q3); ví dụ một ô "Hot and dry" và ví dụ ba ô "In the water" (ít nước, nhiều nước, q4); ví dụ hai ô "Hot and dry" (tai to giúp cáo fennec mát, q5); ví dụ ba ô "Hot and dry" (bộ lông dày quá nóng ở sa mạc, q6).
> Không con người, không bản đồ, không mùa, không cảnh săn mồi.

### explore
id: 5e784ef4-4da0-4c1f-832e-849bb208aa79
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_cold
label.en: Cold
label.vi: Nơi lạnh
color: cham
sentence.en: Thick fur, feathers and fat keep animals warm.
sentence.vi: Lông dày, lông vũ dày và lớp mỡ dày giữ ấm cho con vật.
image.brief: Dùng lại hình `explore_ice` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Arctic sea ice
image.alt.en: Sea ice on a cold sea
image.alt.vi: Băng nổi trên biển lạnh
examples.1.en: the Arctic and the Antarctic
examples.1.vi: Bắc Cực và Nam Cực
examples.2.en: walruses and seals rest on the ice
examples.2.vi: hải mã và hải cẩu nằm nghỉ trên băng
examples.3.en: emperor penguins huddle together
examples.3.vi: chim cánh cụt hoàng đế đứng sát nhau
> Gom bài 1 và bài 2 (hai vùng cực) vào một ô. Ví dụ ba ôn từ `huddle` của bài 2. Ảnh băng biển không có con vật, nên gấu trắng và chim cánh cụt không chung một ảnh.
> [CẦN KIỂM] Hải mã và hải cẩu nằm nghỉ trên băng; chim cánh cụt hoàng đế đứng sát nhau cho ấm (như bài 1, bài 2).

#### group explore_hot_dry
label.en: Hot and dry
label.vi: Nóng và khô
color: vang_hoe
sentence.en: Desert animals hide from the hot sun.
sentence.vi: Con vật ở sa mạc trốn nắng nóng.
image.brief: Dùng lại hình `explore_sahara` ở bài `noi-song-tren-trai-dat/sa-mac`. Từ khoá tìm ảnh (EN): Sahara dunes
image.alt.en: Big sand dunes in the Sahara
image.alt.vi: Những đồi cát lớn ở Xa-ha-ra
examples.1.en: very little rain or water
examples.1.vi: rất ít mưa, rất ít nước
examples.2.en: big ears keep a fennec fox cool
examples.2.vi: tai to giúp cáo fennec mát
examples.3.en: too hot for thick, warm fur
examples.3.vi: quá nóng với bộ lông dày, ấm
> Ví dụ hai là chữ `_topic.md` yêu cầu cho câu q5. Ví dụ ba chuẩn bị câu q6 mà không gọi tên gấu trắng (bé tự nối "lông dày" với ô "Cold"). Ví dụ một chuẩn bị câu q4 ("ít nước").
> Nếu designer báo ảnh không chụp ở Xa-ha-ra thì `alt` đổi theo bảng `_topic.md` ("Big sand dunes in a desert" · "Những đồi cát lớn ở sa mạc") ở mọi chỗ dùng.
> [CẦN KIỂM] Sa mạc rất ít mưa; tai to giúp cáo fennec toả nhiệt; con vật có bộ lông dày và lớp mỡ dày (như gấu trắng) bị quá nóng ở sa mạc nóng.

#### group explore_hot_wet
label.en: Hot and wet
label.vi: Nóng và ướt
color: gi_dong
sentence.en: Rainforest animals climb tall, leafy trees.
sentence.vi: Con vật ở rừng mưa nhiệt đới leo lên những cây cao, rậm lá.
image.brief: Dùng lại hình `explore_vietnam` ở bài `noi-song-tren-trai-dat/rung-mua-nhiet-doi`. Từ khoá tìm ảnh (EN): Cat Tien forest
image.alt.en: Tall trees in a thick forest
image.alt.vi: Cây cao trong khu rừng rậm
examples.1.en: hot, with lots of rain
examples.1.vi: nóng và mưa rất nhiều
examples.2.en: a sloth hangs high in a tree
examples.2.vi: con lười treo mình trên cây cao
examples.3.en: rainforests grow in Vietnam, too
examples.3.vi: Việt Nam cũng có rừng mưa
> Ô "nóng và ướt" dùng ảnh rừng mưa Việt Nam (bối cảnh quê mình). Ví dụ ba viết "rừng mưa" vì đã nói đủ "rừng mưa nhiệt đới" ở câu chính cùng ô (bảng Tên gọi).
> [CẦN KIỂM] Cúc Phương, Cát Tiên là rừng mưa nhiệt đới (như bài 3).

#### group explore_water
label.en: In the water
label.vi: Dưới nước
color: nau_dat
sentence.en: Fish, turtles and whales swim in the sea.
sentence.vi: Cá, rùa biển và cá voi bơi dưới biển.
image.brief: Dùng lại hình `q4` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): coral reef underwater fish NOAA
image.alt.en: A coral reef under the sea
image.alt.vi: Rạn san hô dưới biển
examples.1.en: the ocean is huge and salty
examples.1.vi: đại dương rất rộng, nước mặn
examples.2.en: sea turtles rest on the reef
examples.2.vi: rùa biển nghỉ trên rạn san hô
examples.3.en: water as far as you can see
examples.3.vi: nhìn đâu cũng thấy nước
> Gom bài 5 (biển và đại dương). Ví dụ hai dạy trước câu q3; ví dụ ba chuẩn bị câu q4 ("nhiều nước nhất"). Câu chính nói "turtles" · "rùa biển" (không phải con rùa nước ngọt của chủ đề số một).
> Màu `nau_dat` cho ô này để ba ô kia giữ cùng màu với ba nhóm của kệ Chơi (lạnh `cham`, nóng và khô `vang_hoe`, nóng và ướt `gi_dong`); designer đổi được.
> [CẦN KIỂM] Rùa biển xanh nghỉ ở rạn san hô (như bài 5).

### new_words
id: bcfd6a1c-6a7c-4db1-95a7-42c859d04d68
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: earth, hot, cold

## Chơi

> Bé chọn ba con vật hoang dã, mỗi con ở một kiểu nơi: nơi lạnh (gấu trắng, chim cánh cụt hoàng đế), nóng và khô (cáo fennec, thằn lằn), nóng và ướt (con lười, chim hồng hoàng). Đạt khi đủ ba nhóm và không chọn vật nuôi.
> Món bẫy là vật nuôi trong chuồng trại ở quê mình (con trâu, con gà mái). Cả hai sống ở Việt Nam nóng và mưa nhiều, nên bé phải nghĩ "nơi sống hoang dã hay chuồng trại" (ý chính ba), không chọn theo nóng, ướt. Con gà mái còn giống chim hồng hoàng, chim cánh cụt (có lông vũ).
> Lệch `_topic.md` (nhóm "Hot and dry" ghi cáo fennec, lạc đà): dùng thằn lằn (`tray_lizard`, bài 7) thay lạc đà. Lý do: bài 7 dạy "most camels live with people" · "phần lớn lạc đà do người nuôi", và chủ đề không gọi lạc đà là động vật hoang dã; đặt lạc đà ở nhóm bắt buộc ngay cạnh nhãn bẫy "Farm animal" · "Vật nuôi trong chuồng" làm bé lúng túng (lạc đà cũng là vật nuôi). Thằn lằn đuôi gai là con vật hoang dã của sa mạc bé đã gặp ở bài 7 (kệ Chơi, câu q1). Nếu PM muốn giữ lạc đà thì đổi lại món `tray_lizard` thành `tray_camel` (hình `explore_camel`), chữ khác không đổi.
> Kệ tám món, toàn ảnh dùng lại.

### tray
id: 5c98af49-4277-4152-ae1c-6c38b41d82e7
type: build_tray
version: 1
prompt.en: Pick animals from three places
prompt.vi: Chọn con vật ở ba nơi khác nhau
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find one animal for each place.
messages.start.vi: Em tìm cho mỗi nơi một con vật nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Each one lives in its own place.
messages.balanced.vi: Tuyệt! Mỗi con sống ở đúng nơi của nó.
messages.has_limited.en: That one lives on a farm.
messages.has_limited.vi: Con này sống ở chuồng trại.
messages.missing.tray_cold.en: Now find one from a cold place.
messages.missing.tray_cold.vi: Em tìm thêm một con ở nơi lạnh nhé.
messages.missing.tray_hot_dry.en: Now find one from a hot, dry place.
messages.missing.tray_hot_dry.vi: Em tìm thêm một con ở nơi nóng và khô nhé.
messages.missing.tray_hot_wet.en: Now find one from a hot, wet place.
messages.missing.tray_hot_wet.vi: Em tìm thêm một con ở nơi nóng và ướt nhé.
> Lời nhắn `has_limited` đúng với cả hai món bẫy (trâu và gà mái đều sống ở chuồng trại). Lời nhắn `balanced` không gọi các con là "động vật hoang dã" (đúng cả khi PM đổi lại lạc đà).

#### group tray_cold
label.en: Cold
label.vi: Nơi lạnh
color: cham
role: required

#### group tray_hot_dry
label.en: Hot and dry
label.vi: Nóng và khô
color: vang_hoe
role: required

#### group tray_hot_wet
label.en: Hot and wet
label.vi: Nóng và ướt
color: gi_dong
role: required

#### group tray_farm
label.en: Farm animal
label.vi: Vật nuôi trong chuồng
color: do_son
role: limit
> Nhãn `limit` là câu khẳng định gọi tên loại (như "Has a backbone" của chủ đề số một), chốt ở `_topic.md`. Ba nhãn bắt buộc trùng chữ nhãn ba ô Học (một ý một nhãn).

#### item tray_bear
label.en: Polar bear
label.vi: Gấu trắng
group: tray_cold
image.brief: Dùng lại hình `explore_bear` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): polar bear sea ice
image.alt.en: A polar bear on floating ice
image.alt.vi: Gấu trắng trên tảng băng trôi

#### item tray_fennec
label.en: Fennec fox
label.vi: Cáo fennec
group: tray_hot_dry
image.brief: Dùng lại hình `explore_fennec` ở bài `noi-song-tren-trai-dat/sa-mac`. Từ khoá tìm ảnh (EN): Vulpes zerda
image.alt.en: A sandy-coloured fox
image.alt.vi: Con cáo màu cát

#### item tray_buffalo
label.en: Buffalo
label.vi: Con trâu
group: tray_farm
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu

#### item tray_sloth
label.en: Sloth
label.vi: Con lười
group: tray_hot_wet
image.brief: Dùng lại hình `explore_trees` ở bài `noi-song-tren-trai-dat/rung-mua-nhiet-doi`. Từ khoá tìm ảnh (EN): Bradypus sloth
image.alt.en: A sloth hanging from a branch
image.alt.vi: Con lười treo trên cành cây

#### item tray_emperor
label.en: Emperor penguin
label.vi: Chim cánh cụt hoàng đế
group: tray_cold
image.brief: Dùng lại hình `tray_emperor` ở bài `noi-song-tren-trai-dat/nam-cuc`. Từ khoá tìm ảnh (EN): Aptenodytes forsteri
image.alt.en: An emperor penguin on the ice
image.alt.vi: Chim cánh cụt hoàng đế trên băng

#### item tray_hen
label.en: Hen
label.vi: Con gà mái
group: tray_farm
image.brief: Dùng lại hình `w3_hen` ở bài `khung-long/khung-long-la-gi`. Từ khoá tìm ảnh (EN): brown hen standing farmyard side view
image.alt.en: A hen in a yard
image.alt.vi: Con gà mái trong sân

#### item tray_lizard
label.en: Lizard
label.vi: Thằn lằn
group: tray_hot_dry
image.brief: Dùng lại hình `tray_lizard` ở bài `noi-song-tren-trai-dat/sa-mac`. Từ khoá tìm ảnh (EN): Uromastyx
image.alt.en: A spiny-tailed lizard
image.alt.vi: Con thằn lằn đuôi gai
> Lệch `_topic.md` (xem `>` ở đầu mục Chơi): món này thay lạc đà. Bảng Hình dùng chung cần thêm "8 (tray_lizard)" vào dòng `tray_lizard` và bỏ "tray_camel" ở dòng `explore_camel`.
> [CẦN KIỂM] Thằn lằn đuôi gai (Uromastyx) là con vật hoang dã sống ở sa mạc Xa-ha-ra (như bài 7).

#### item tray_hornbill
label.en: Hornbill
label.vi: Chim hồng hoàng
group: tray_hot_wet
image.brief: Dùng lại hình `tray_hornbill` ở bài `noi-song-tren-trai-dat/rung-mua-nhiet-doi`. Từ khoá tìm ảnh (EN): Buceros bicornis
image.alt.en: A hornbill on a branch
image.alt.vi: Chim hồng hoàng đậu trên cành

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Ba format: `single_choice` (q1, q3, q5; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ, một thứ tự đúng).
> Hình câu `single_choice` và `order_sequence` là hàng rào tre trung tính (như *Sinh vật sống ở đâu?* bài năm câu q4). Câu nào cũng tự đủ nghĩa khi chỉ nghe.
> Không câu nào hỏi gấu trắng, lạc đà, cá hề hay voi sống ở đâu (ranh giới câu Oak Science). Câu q6 hỏi gấu trắng có sống được ở sa mạc không, là câu sửa misconception, không phải câu ghép con vật với nơi sống.
> Thứ tự `#### option` trong file theo bảng "Vị trí đáp án đúng" của `_topic.md` (w1 chỗ một, q1 chỗ ba, q3 chỗ hai, q5 chỗ một); app xáo lựa chọn (SK-047).

### q1
id: 6b9fbff6-8c6e-491b-9b4e-1211bcbc1a6a
format: single_choice
version: 1
dok: 1
prompt.en: Which animal lives in a cold place?
prompt.vi: Con nào sống ở nơi lạnh?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about thick fat and icy water.
hint.vi: Em nghĩ tới lớp mỡ dày và nước lạnh giá nhé.
explanation_correct.en: Yes! Thick fat keeps a walrus warm.
explanation_correct.vi: Đúng rồi! Lớp mỡ dày giữ ấm cho hải mã.
explanation_wrong.en: The answer is the walrus. It rests on ice.
explanation_wrong.vi: Đáp án là con hải mã. Hải mã nằm nghỉ trên băng.
> DOK 1: nhớ lại ô "Cold" (ví dụ hai). Ba con của ba kiểu nơi khác nhau (lạnh, nóng và khô, nóng và ướt), khác hẳn bằng mắt; cả ba bé đã gặp ở bài 1, 3, 7 và ở w1 hôm nay.
> Gợi ý trỏ tới điều giúp con vật sống ở nơi lạnh (lớp mỡ, nước lạnh giá), không gọi tên đáp án.

#### option q1_camel
correct: false
feedback.en: A camel walks on hot, dry sand.
feedback.vi: Lạc đà đi trên cát khô và nóng.
label.en: camel
label.vi: con lạc đà
image.brief: Dùng lại hình `explore_camel` ở bài `noi-song-tren-trai-dat/sa-mac`. Từ khoá tìm ảnh (EN): Camelus dromedarius
image.alt.en: A camel on the sand
image.alt.vi: Lạc đà trên cát

#### option q1_sloth
correct: false
feedback.en: A sloth hangs in warm, rainy forests.
feedback.vi: Con lười treo mình trong rừng ấm, mưa nhiều.
label.en: sloth
label.vi: con lười
image.brief: Dùng lại hình `explore_trees` ở bài `noi-song-tren-trai-dat/rung-mua-nhiet-doi`. Từ khoá tìm ảnh (EN): Bradypus sloth
image.alt.en: A sloth hanging from a branch
image.alt.vi: Con lười treo trên cành cây

#### option q1_walrus
correct: true
label.en: walrus
label.vi: hải mã
image.brief: Dùng lại hình `explore_walrus` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): walrus ice Odobenus
image.alt.en: A walrus resting on the ice
image.alt.vi: Hải mã nằm nghỉ trên băng

### q2
id: ef6ccd85-e93d-4413-9ba7-bfe513ab1822
format: true_false
version: 1
dok: 1
prompt.en: A sloth lives high in rainforest trees.
prompt.vi: Con lười sống trên cây cao trong rừng mưa nhiệt đới.
image.brief: Dùng lại hình `explore_trees` ở bài `noi-song-tren-trai-dat/rung-mua-nhiet-doi`. Từ khoá tìm ảnh (EN): Bradypus sloth
image.alt.en: A sloth hanging from a branch
image.alt.vi: Con lười treo trên cành cây
answer: true
hint.en: Look at what the sloth holds on to.
hint.vi: Em nhìn xem con lười đang bám vào đâu nhé.
explanation_correct.en: Yes! Long claws help it hold on.
explanation_correct.vi: Đúng rồi! Móng dài giúp con lười bám chặt cành cây.
explanation_wrong.en: This is true. It hangs high on a branch.
explanation_wrong.vi: Câu này đúng. Con lười treo mình trên cành cao.
feedback_false.en: Sloths sleep and eat up in the trees.
feedback_false.vi: Con lười ngủ và ăn ngay trên cây.
> DOK 1: nhớ lại ô "Hot and wet" (ví dụ hai) và bài 3. Hình là con lười treo trên cành (đúng vật được nói tới). Giải thích khi đúng thêm một ý của ý chính hai (bộ phận cơ thể giúp con vật sống ở nơi đó).
> `prompt.vi` sửa 16/11 (tester n4): viết đủ "rừng mưa nhiệt đới" vì là lần nhắc đầu trên màn.
> [CẦN KIỂM] Con lười có móng dài, cong để bám cành; con lười ngủ và ăn trên cây.

### q3
id: ff41e47c-cbbb-4be2-9fc8-4f59cce12a78
format: single_choice
version: 1
dok: 1
prompt.en: Where does a sea turtle live?
prompt.vi: Rùa biển sống ở đâu?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of warm water where turtles swim.
hint.vi: Em nghĩ tới vùng nước ấm, nơi rùa biển bơi nhé.
explanation_correct.en: Yes! The reef is warm and full of fish.
explanation_correct.vi: Đúng rồi! Rạn san hô ấm và có rất nhiều cá.
explanation_wrong.en: The answer is the coral reef. Sea turtles rest there.
explanation_wrong.vi: Đáp án là rạn san hô. Rùa biển nghỉ ở đó.
> DOK 1: nhớ lại ô "In the water" (ví dụ hai) và bài 5. Ba cảnh khác nhau rõ bằng mắt (cát, nước có san hô, băng); cả ba là cảnh bé đã gặp, đáp án không là ảnh lạ duy nhất.
> `alt` của rạn san hô và của băng biển đều có chữ "sea" · "biển", nên chữ "sea turtle" của câu hỏi không chỉ về một lựa chọn.
> [CẦN KIỂM] Rùa biển xanh sống ở vùng biển ấm, nghỉ ở rạn san hô.

#### option q3_desert
correct: false
feedback.en: The desert is hot, dry sand.
feedback.vi: Sa mạc toàn cát nóng và khô.
label.en: desert
label.vi: sa mạc
image.brief: Dùng lại hình `explore_sahara` ở bài `noi-song-tren-trai-dat/sa-mac`. Từ khoá tìm ảnh (EN): Sahara dunes
image.alt.en: Big sand dunes in the Sahara
image.alt.vi: Những đồi cát lớn ở Xa-ha-ra

#### option q3_reef
correct: true
label.en: coral reef
label.vi: rạn san hô
image.brief: Dùng lại hình `q4` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): coral reef underwater fish NOAA
image.alt.en: A coral reef under the sea
image.alt.vi: Rạn san hô dưới biển

#### option q3_ice
correct: false
feedback.en: Sea ice is too cold for a turtle.
feedback.vi: Băng biển quá lạnh với rùa biển.
label.en: sea ice
label.vi: băng biển
image.brief: Dùng lại hình `explore_ice` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Arctic sea ice
image.alt.en: Sea ice on a cold sea
image.alt.vi: Băng nổi trên biển lạnh

### q4
id: dc2ea680-7101-4153-90c9-d3a084f836e6
format: order_sequence
version: 1
dok: 2
prompt.en: Order from least water to most water.
prompt.vi: Xếp từ nơi ít nước tới nơi nhiều nước.
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
answer: q4_desert, q4_swamp, q4_ocean
hint.en: Remember how dry the Sahara is.
hint.vi: Em nhớ sa mạc Xa-ha-ra khô thế nào nhé.
explanation_correct.en: Yes! Dry sand, wet mud, then the ocean.
explanation_correct.vi: Đúng rồi! Cát khô, rồi bùn ướt, rồi tới đại dương.
explanation_wrong.en: The order is desert, swamp, then ocean.
explanation_wrong.vi: Thứ tự là sa mạc, đầm lầy, rồi đại dương.
> DOK 2: so sánh ba nơi sống theo lượng nước. Mỗi cảnh bé đã gặp làm ô Học hay câu hỏi ở bài 4, 5, 7; "ít nước", "nhiều nước" dạy ở ví dụ ô "Hot and dry" và ô "In the water". Đúng một thứ tự đúng.
> Gợi ý chỉ nhắc một đầu dải (sa mạc Xa-ha-ra rất khô, bé học ở bài 7), như câu q4 bài 5; đầm lầy và đại dương bé tự so. Sửa 16/11 (tester N2): gợi ý cũ "Think where a camel and a whale live." gọi tên cả hai đầu dải, nên lộ luôn thứ tự ba thẻ (`hint` hiện trước khi bé trả lời, SK-047). Nếu ảnh `explore_sahara` không chụp ở Xa-ha-ra (dòng ghi chú ở ô "Hot and dry"), gợi ý đổi thành "Remember how dry a desert is." · "Em nhớ sa mạc khô thế nào nhé.". Không đọc các thẻ theo thứ tự. Thẻ trong file không theo thứ tự đúng.
> Khác câu q4 của *Sinh vật sống ở đâu?* bài năm (đồi cát, rừng râm mát, cái ao) và câu q4 bài 7 (sa mạc, đồng cỏ xavan, rừng mưa): ba nơi khác, có nơi toàn là nước.

#### item q4_ocean
label.en: ocean
label.vi: đại dương
image.brief: Dùng lại hình `tray_atlantic` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): Atlantic Ocean waves
image.alt.en: Big waves on a wide ocean
image.alt.vi: Sóng lớn giữa đại dương rộng

#### item q4_desert
label.en: desert
label.vi: sa mạc
image.brief: Dùng lại hình `explore_sahara` ở bài `noi-song-tren-trai-dat/sa-mac`. Từ khoá tìm ảnh (EN): Sahara dunes
image.alt.en: Big sand dunes in the Sahara
image.alt.vi: Những đồi cát lớn ở Xa-ha-ra

#### item q4_swamp
label.en: swamp
label.vi: đầm lầy
image.brief: Dùng lại hình `explore_swamp` ở bài `noi-song-tren-trai-dat/rung-ngap-man-va-dam-lay`. Từ khoá tìm ảnh (EN): freshwater marsh lotus
image.alt.en: A swamp with lotus plants
image.alt.vi: Đầm lầy có cây sen
> Khung vuông của thẻ này phải thấy rõ mặt nước nông giữa cây sen, cỏ năng (để bé thấy đầm lầy có nước nhưng ít hơn biển).

### q5
id: 4a10e27e-29c8-41a8-8c11-d92e57806d59
format: single_choice
version: 1
dok: 2
prompt.en: Which one has ears that keep it cool?
prompt.vi: Con nào có đôi tai giúp nó mát?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look at how big the ears are.
hint.vi: Em nhìn xem đôi tai to hay nhỏ nhé.
explanation_correct.en: Yes! Fennec foxes also sleep in holes all day.
explanation_correct.vi: Đúng rồi! Cáo fennec còn ngủ trong hang suốt ban ngày.
explanation_wrong.en: The answer is the fennec fox. Big ears help it stay cool.
explanation_wrong.vi: Đáp án là cáo fennec. Đôi tai to giúp cáo fennec mát.
> DOK 2: so sánh một bộ phận nhìn thấy (tai) của ba con vật và nối với nơi nóng (ý chính hai). Chữ "tai to giúp mát" đã dạy ở câu chính ô "Fennec fox" bài 7 và ví dụ hai ô "Hot and dry" hôm nay.
> Hai con cáo trong một câu: khác rõ bằng mắt (màu lông, cỡ tai, nền cát và nền tuyết) và câu hỏi hỏi đúng điều nhìn thấy (luật Explorer số bảy), như câu q5 bài 7. Hải cẩu không có vành tai to, khác hẳn hai con kia.
> `alt` cáo fennec không có chữ "ears" (bảng `_topic.md`).
> `explanation_correct.en` sửa 16/11 (tester n1): bản trước mở đầu "It" không có chủ ngữ, VI gọi tên cáo fennec; nay EN cũng gọi tên (tám từ sau "Yes!"), VI giữ nguyên.
> [CẦN KIỂM] Cáo fennec ngủ trong hang suốt ban ngày; tai to giúp toả nhiệt (như bài 7).

#### option q5_fennec
correct: true
label.en: fennec fox
label.vi: cáo fennec
image.brief: Dùng lại hình `explore_fennec` ở bài `noi-song-tren-trai-dat/sa-mac`. Từ khoá tìm ảnh (EN): Vulpes zerda
image.alt.en: A sandy-coloured fox
image.alt.vi: Con cáo màu cát

#### option q5_fox
correct: false
feedback.en: An Arctic fox keeps warm with thick fur.
feedback.vi: Cáo Bắc Cực giữ ấm bằng bộ lông dày.
label.en: Arctic fox
label.vi: cáo Bắc Cực
image.brief: Dùng lại hình `explore_fox` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Vulpes lagopus
image.alt.en: An Arctic fox in the snow
image.alt.vi: Cáo Bắc Cực trên tuyết

#### option q5_seal
correct: false
feedback.en: A seal keeps warm with thick fat.
feedback.vi: Hải cẩu giữ ấm bằng lớp mỡ dày.
label.en: seal
label.vi: hải cẩu
image.brief: Dùng lại hình `explore_seal` ở bài `noi-song-tren-trai-dat/nam-cuc`. Từ khoá tìm ảnh (EN): Weddell seal Antarctica
image.alt.en: A seal resting on the ice
image.alt.vi: Hải cẩu nằm nghỉ trên băng

### q6
id: ed0be344-7b12-4651-a5d9-ea9a04c91518
format: true_false
version: 1
dok: 2
misconception: animals_live_anywhere
prompt.en: A polar bear could live in a desert.
prompt.vi: Gấu trắng sống được ở sa mạc.
image.brief: Dùng lại hình `explore_bear` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): polar bear sea ice
image.alt.en: A polar bear on floating ice
image.alt.vi: Gấu trắng trên tảng băng trôi
answer: false
hint.en: Think about the polar bear's thick fur.
hint.vi: Em nghĩ tới bộ lông dày của gấu trắng nhé.
explanation_correct.en: A polar bear needs a cold, icy place.
explanation_correct.vi: Gấu trắng cần nơi lạnh, có băng.
explanation_wrong.en: This is false. Deserts are too hot for polar bears.
explanation_wrong.vi: Câu này sai. Sa mạc quá nóng với gấu trắng.
feedback_true.en: A desert is very hot and dry.
feedback_true.vi: Sa mạc rất nóng và rất khô.
> Câu misconception (`animals_live_anywhere`), bằng hình, DOK 2: bé còn nghĩ "con vật nào cũng sống được ở bất cứ đâu" sẽ chạm gật đầu. Bé áp ý chính hai (bộ lông dày, lớp mỡ dày giữ ấm ở nơi lạnh) vào một nơi khác hẳn (ví dụ ba ô "Hot and dry"). Câu chỉ kiểm một việc: gấu trắng có sống được ở sa mạc không.
> Hình là gấu trắng một mình trên băng (đúng vật được nói tới), không có ảnh sa mạc, không làm bằng chứng cho phía nào. Gợi ý trỏ tới bộ lông dày, không nói thẳng "quá nóng"; phản hồi nói về sa mạc, không lặp gợi ý.
> `explanation_correct` đứng một mình được cho thẻ "Ý sai → Ý đúng" ở bước Tổng kết: "A polar bear could live in a desert." → "A polar bear needs a cold, icy place.".
> [CẦN KIỂM] Gấu trắng không sống được ở sa mạc nóng: bộ lông dày và lớp mỡ dày giữ nhiệt nên gấu dễ bị quá nóng.

## Từ vựng

### earth
id: 420f5a15-9ca8-442e-ae25-d4c1b1d6c494
tier: core
term.en: Earth
term.vi: Trái Đất
example.en: Earth has hot places and cold places.
example.vi: Trái Đất có nơi nóng và nơi lạnh.
image.brief: [sơ đồ ghép ảnh] Bốn ảnh cảnh đã có, cắt cùng cỡ, xếp lưới hai hàng hai cột, giữa các ô có khe hở mỏng màu nền: băng biển `explore_ice` ở bài `noi-song-tren-trai-dat/bac-cuc` (hàng trên, bên trái), đồi cát `explore_sahara` ở bài `noi-song-tren-trai-dat/sa-mac` (hàng trên, bên phải), rừng mưa `explore_vietnam` ở bài `noi-song-tren-trai-dat/rung-mua-nhiet-doi` (hàng dưới, bên trái), rạn san hô `q4` ở bài `ho-hap/vi-sao-ta-phai-tho` (hàng dưới, bên phải); không quả địa cầu, không bản đồ, không ảnh Trái Đất từ vũ trụ, không chữ, không viền nét quanh ô.
image.alt.en: Ice, sand, forest and sea
image.alt.vi: Băng, cát, rừng và biển
> Ngoại lệ duy nhất của chủ đề (Quy ước hình số một ở `_topic.md`): hình ghép thay ảnh Trái Đất từ vũ trụ (Duy chốt câu 6 = a). Bốn ô là bốn kiểu nơi của bốn ô Học (lạnh; nóng và khô; nóng và ướt; dưới nước).
> Brief ghép không có dòng `Từ khoá tìm ảnh (EN)` vì cả bốn phần là hình dùng lại (TEMPLATE mục Hình, nhãn `[sơ đồ ghép ảnh]`); có dòng đó thì máy sẽ coi mỗi truy vấn là một phần cần tìm mới. Chỉ bốn key của bốn phần nằm trong backtick.

### hot
id: 5b2c3395-90dc-4a0a-b061-680cdb232dd7
tier: core
term.en: hot
term.vi: nóng
example.en: Desert sand is very hot.
example.vi: Cát ở sa mạc rất nóng.
image.brief: Dùng lại hình `explore_sahara` ở bài `noi-song-tren-trai-dat/sa-mac`. Từ khoá tìm ảnh (EN): Sahara dunes
image.alt.en: Big sand dunes in the Sahara
image.alt.vi: Những đồi cát lớn ở Xa-ha-ra

### cold
id: 7bc3705f-7ac7-441f-bacb-d10d9da36222
tier: core
term.en: cold
term.vi: lạnh
example.en: The sea ice is very cold.
example.vi: Băng biển rất lạnh.
image.brief: Dùng lại hình `explore_ice` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Arctic sea ice
image.alt.en: Sea ice on a cold sea
image.alt.vi: Băng nổi trên biển lạnh

### habitat
id: 8eac34c2-c831-41e0-8e46-29b4edcd5cf3
tier: extra
term.en: habitat
term.vi: nơi sống
example.en: A swamp is a habitat for many birds.
example.vi: Đầm lầy là nơi sống của nhiều loài chim.
image.brief: Dùng lại hình `explore_swamp` ở bài `noi-song-tren-trai-dat/rung-ngap-man-va-dam-lay`. Từ khoá tìm ảnh (EN): freshwater marsh lotus
image.alt.en: A swamp with lotus plants
image.alt.vi: Đầm lầy có cây sen
> Cố ý ôn từ `core` của *Sinh vật sống ở đâu?* bài bốn (từ khoá của tên chủ đề), để `extra`; câu ví dụ mới. `_topic.md` mục Còn mở số bốn: PM xem app có hiện trùng ở danh sách từ của bé không.
> Câu ví dụ nhắc lại ý sửa `swamps_have_no_life` của bài 4 (đầm lầy có nhiều chim).

## Thưởng

### sloth_card
id: b2d6dd4c-c66f-49ed-9b4b-4d899d1f8b77
set: animals
rarity: common
name.en: Sloth
name.vi: Con lười
tag.en: Lives up in the trees
tag.vi: Sống trên cây cao
fact.en: A sloth hangs upside down to sleep.
fact.vi: Con lười treo ngược mình trên cành để ngủ.
image.brief: Dùng lại hình `explore_trees` ở bài `noi-song-tren-trai-dat/rung-mua-nhiet-doi`. Từ khoá tìm ảnh (EN): Bradypus sloth
image.alt.en: A sloth hanging from a branch
image.alt.vi: Con lười treo trên cành cây
> Thẻ chốt ở `_topic.md`. Con lười chưa có thẻ trong bộ `set: animals`.
> [CẦN KIỂM] Con lười treo ngược mình trên cành khi ngủ.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn hình dùng lại, cộng một hình ghép. Không bản đồ, không quả địa cầu, không ảnh Trái Đất từ vũ trụ. Gấu trắng và chim cánh cụt không chung một ảnh (ở bài này hai con chỉ gặp nhau trên kệ Chơi, mỗi con một món).
- **Ảnh mới:** không có.
- **Hình ghép (một):** từ `earth`, lưới hai nhân hai từ `explore_ice` (bài 1), `explore_sahara` (bài 7), `explore_vietnam` (bài 3), `ho-hap/vi-sao-ta-phai-tho` `q4`. Bốn ô cùng cỡ, khe hở mỏng màu nền, không viền nét. Màn Nguồn hình ghi công đủ cả bốn ảnh gốc.
- **Ảnh dùng lại trong chủ đề này** (chờ các bài gốc xong; key và `alt` lấy từ bảng Hình dùng chung của `_topic.md`):
  - bài 1 `bac-cuc`: `explore_ice` (ô Cold, q3, từ `cold`, hình ghép), `explore_walrus` (w1, q1), `explore_fox` (q5), `explore_bear` (gấu trắng: kệ Chơi, q6; từ 16/11 thay `tray_arctic` của *Bề mặt Trái Đất*);
  - bài 2 `nam-cuc`: `explore_sea_food` (w2), `tray_emperor` (kệ Chơi), `explore_seal` (q5);
  - bài 3 `rung-mua-nhiet-doi`: `explore_vietnam` (ô Hot and wet, hình ghép), `explore_trees` (q1, q2, kệ Chơi, thẻ), `tray_hornbill` (kệ Chơi);
  - bài 4 `rung-ngap-man-va-dam-lay`: `explore_swamp` (q4, từ `habitat`);
  - bài 7 `sa-mac`: `explore_sahara` (ô Hot and dry, q3, q4, từ `hot`, hình ghép), `explore_camel` (w1, q1), `explore_fennec` (kệ Chơi, q5), `tray_lizard` (kệ Chơi).
- **Ảnh dùng lại từ chủ đề khác:** *Bề mặt Trái Đất* bài hai `tray_atlantic` (q4); *Hô hấp* bài một `q4` (rạn san hô: ô In the water, q3, hình ghép); *Gọi tên và nhóm động vật* bài một `w1` (hàng rào tre: hình câu w1, q1, q3, q4, q5), `w1_lotus` (w3); *Khủng long* `trai-dat-rat-lau-ve-truoc` `w1_buffalo` (kệ Chơi), `khung-long-la-gi` `w3_hen` (kệ Chơi).
- **Khung cần kiểm:**
  - q4 (`order_sequence`): ba cảnh sa mạc, đầm lầy, đại dương cắt vuông cùng cỡ; ô đầm lầy thấy rõ mặt nước nông giữa sen, cỏ năng;
  - q5: thẻ ba lựa chọn rất ngang 5:2 phải thấy rõ đôi tai của cáo fennec và cáo Bắc Cực (câu hỏi dựa vào tai);
  - w1: thẻ hai lựa chọn 17:10 cho lạc đà và hải mã; q1 thẻ 5:2 cho lạc đà, con lười (con lười treo trên cành cần `crop` ngang riêng, như bài 6).
- **Ảnh khó:** không có ảnh mới. Rủi ro nằm ở ảnh gốc của bài 1 tới 7 (xem Ghi chú cho hoạ sĩ các bài đó); nếu ảnh gốc đổi `alt` (ví dụ đồi cát không ghi Xa-ha-ra) thì sửa cả các chỗ dùng ở bài này.
- **Lệch so với `_topic.md`:** kệ Chơi dùng `tray_lizard` thay `explore_camel` cho nhóm Hot and dry; `w1_camel` dùng ảnh `explore_camel` nhưng `alt` rút thành "A camel" · "Con lạc đà".
- **Màu:** Học: nơi lạnh `cham`, nóng và khô `vang_hoe`, nóng và ướt `gi_dong`, dưới nước `nau_dat`. Chơi: nơi lạnh `cham`, nóng và khô `vang_hoe`, nóng và ướt `gi_dong`, vật nuôi trong chuồng `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (earth, hot, cold). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Đúng, w3 Đúng). Quiz `single_choice` (q1, q3, q5; ba lựa chọn), `true_false` (q2 Đúng, q6 Sai), `order_sequence` (q4, ba thẻ). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`animals_live_anywhere`). Không có `labels` ở câu `true_false`.
- **Thứ tự đúng q4:** `q4_desert`, `q4_swamp`, `q4_ocean`. Thẻ trong file không theo thứ tự đúng.
- **Vị trí đáp án:** app xáo lựa chọn (SK-047). Thứ tự trong file theo bảng ở `_topic.md`: w1 chỗ một, q1 chỗ ba, q3 chỗ hai, q5 chỗ một.
- **Màn Chơi, ví dụ để kiểm:** Gấu trắng, Cáo fennec, Con lười → `balanced`; Chim cánh cụt hoàng đế, Thằn lằn, Con trâu → `has_limited`; Gấu trắng, Chim cánh cụt hoàng đế, Chim hồng hoàng → `missing.tray_hot_dry`; Cáo fennec, Thằn lằn, Con lười → `missing.tray_cold`; Gấu trắng, Cáo fennec, Con gà mái → `has_limited`.
- **Khởi động trỏ bài khác:** w1 → `noi-song-tren-trai-dat/sa-mac`, w2 → `noi-song-tren-trai-dat/nam-cuc` (hai bài này phải có id trước khi chạy `ids` bài 8), w3 → `sinh-vat-song-o-dau/noi-song-cua-cay` (đã có id).
- **Hình dùng lại bài 1 tới 7:** mọi brief trỏ sang bài gốc của chủ đề này chỉ hợp lệ khi bài gốc đặt đúng key ở bảng Hình dùng chung (`explore_ice`, `explore_walrus`, `explore_fox`, `explore_sea_food`, `tray_emperor`, `explore_seal`, `explore_vietnam`, `explore_trees`, `tray_hornbill`, `explore_swamp`, `explore_sahara`, `explore_camel`, `explore_fennec`, `tray_lizard`). Phiên chính đối chiếu sau khi bài 2 tới 7 xong.
- **Từ vựng trùng chủ đề trước:** `habitat` (cố ý, `extra`) trùng key với *Sinh vật sống ở đâu?* bài bốn.
- **Từ EN có thể ngoài Starters/Movers:** Earth, Arctic, Antarctic, walrus, seals, emperor penguins, huddle, desert, Sahara, fennec fox, lizard, rainforest, sloth, claws, hornbill, coral reef, ocean, salty, swamp, habitat, hump, camel, lotus, buffalo. Nghe thử giọng EN đọc "fennec", "Antarctic", "huddle"; giọng VI đọc "cáo fennec", "Xa-ha-ra".
