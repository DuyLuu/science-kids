---
id: ae90f951-6f11-4569-bab3-208c272011c3
topic: noi-song-tren-trai-dat
slug: nam-cuc
order: 2
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: The Antarctic
vi: Nam Cực
> Giữ đúng tên ở `content/syllabus.json` (key `new-habitats-around-the-world`, bài số hai).

## Mục tiêu
en: I can name animals of the Antarctic.
vi: Em kể được tên con vật sống ở Nam Cực.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 16/11/2026. Ticket SK-048. Mọi dòng `id:` để trống; chạy `ids` sau `_topic.md` và bài 1 (câu w1 trỏ tới bài 1).
> Sườn một phần: Oak Địa lý Year 2, unit 3 *Cold places*, lesson 6 `antarctic-wildlife` (`docs/oak/geography-y2-cold-and-hot-places.md`). Dùng ý: con vật Nam Cực kiếm ăn ở biển; chim cánh cụt hoàng đế đứng sát nhau cho ấm; misconception của lesson. Viết lại, không chép câu quiz.
> Bỏ: chim cánh cụt tới và đi theo mùa, "chỉ chim cánh cụt hoàng đế ở lại qua mùa đông" (mùa, để dành cho hai chủ đề mùa); chim bố ấp trứng (vòng đời, *Sự sống mới*); từ "breeding", "species", "survive"; ý "chim cánh cụt chỉ sống ở nửa phía nam" không thành ý chính (chim cánh cụt Galápagos).
> Bài `core` thứ nhất, nối bài 1 từ phía ngược lại. Sửa `polar_bears_in_antarctic` ở ví dụ ba ô Học "Icy land", món bẫy gấu trắng ở Chơi và câu q6 (gắn key).

## Ý chính
1.en: The Antarctic is icy land, far south.
1.vi: Nam Cực là vùng đất phủ băng, ở tận phía nam.
2.en: Its animals find food in the sea.
2.vi: Con vật ở Nam Cực tìm thức ăn dưới biển.
3.en: Emperor penguins huddle to keep warm.
3.vi: Chim cánh cụt hoàng đế đứng sát nhau cho ấm.
> Từ cụ thể tới trừu tượng: nơi sống nhìn thấy (đất phủ băng), con vật ở đó sống nhờ đâu (thức ăn dưới biển), rồi một cách giữ ấm nhìn thấy được (đứng sát nhau). Chữ chốt ở `_topic.md`; ý chính hai mở bằng "Its", nên câu chính ô Học "Food in the sea" gọi đủ "Antarctic animals".
> Nam Cực nói là "đất phủ băng" (khớp Discoverer *Bề mặt Trái Đất* bài hai); không dùng chữ "Antarctica", "châu Nam Cực" trong chữ cho bé.
> [CẦN KIỂM] Mọi con vật ở Nam Cực kiếm ăn ở biển (chim cánh cụt, hải cẩu, cá voi); Nam Cực là vùng đất phủ băng.

## Khởi động

> Hai câu: w1 ôn bài ngay trước (bài 1, lớp mỡ dày giữ ấm hải mã); w2 ôn mốc dài *Gọi tên và nhóm động vật* bài ba (chim cánh cụt dùng cánh để bơi), để bé vào bài với chim cánh cụt trong đầu. Câu w2 là câu mới, không chép câu cũ.

### w1
id: 9e34c4ef-7543-4265-9af5-782074256edb
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: noi-song-tren-trai-dat/bac-cuc
prompt.en: Which one keeps warm with thick fat?
prompt.vi: Con nào giữ ấm nhờ lớp mỡ dày?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about animals in the icy Arctic.
hint.vi: Em nghĩ tới những con vật ở Bắc Cực băng giá nhé.
explanation_correct.en: Yes! Fat keeps a walrus warm in icy water.
explanation_correct.vi: Đúng rồi! Lớp mỡ giữ ấm cho hải mã cả trong nước lạnh giá.
explanation_wrong.en: The answer is the walrus. It has thick fat.
explanation_wrong.vi: Đáp án là con hải mã. Hải mã có lớp mỡ dày.
> Ôn câu chính ô "Walrus" bài 1 ("Thick fat keeps the walrus warm."). Gợi ý trỏ tới cách nghĩ (con vật nơi lạnh), không tả thân hình, để không lặp ý với `feedback` của voọc.

#### option w1_walrus
correct: true
label.en: walrus
label.vi: hải mã
image.brief: Dùng lại hình `explore_walrus` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): walrus ice Odobenus
image.alt.en: A walrus resting on the ice
image.alt.vi: Hải mã nằm nghỉ trên băng

#### option w1_douc
correct: false
feedback.en: A douc is slim and climbs trees.
feedback.vi: Voọc có thân hình thon và leo cây giỏi.
label.en: douc
label.vi: con voọc
image.brief: Dùng lại hình `explore_wild` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): red-shanked douc langur tree
image.alt.en: A douc in a tree
image.alt.vi: Con voọc trên cây

### w2
id: ddaffb4e-0732-45e6-ae38-72692e6aba2b
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: goi-ten-va-nhom-dong-vat/chim-va-bo-sat
prompt.en: A penguin uses its wings to swim.
prompt.vi: Chim cánh cụt dùng cánh để bơi.
image.brief: Dùng lại hình `tray_penguin` ở bài `goi-ten-va-nhom-dong-vat/chim-va-bo-sat`. Từ khoá tìm ảnh (EN): penguin standing rocks side view
image.alt.en: A penguin on a rock
image.alt.vi: Chim cánh cụt đứng trên tảng đá
answer: true
hint.en: Look at the penguin's short, flat wings.
hint.vi: Em nhìn đôi cánh ngắn và dẹt của chim cánh cụt nhé.
explanation_correct.en: Yes! Penguins swim fast but cannot fly.
explanation_correct.vi: Đúng rồi! Chim cánh cụt bơi nhanh nhưng không biết bay.
explanation_wrong.en: This is true. Penguins swim with their wings.
explanation_wrong.vi: Câu này đúng. Chim cánh cụt bơi bằng đôi cánh.
feedback_false.en: A penguin flaps its wings under the water.
feedback_false.vi: Chim cánh cụt vỗ cánh khi ở dưới nước.
> Ôn ví dụ "its wings help it swim" ở ô "Some birds cannot fly" bài đó; câu mới, không chép câu cũ. Ảnh chim cánh cụt đứng trên đá, không đang bơi, nên ảnh không làm bằng chứng.
> Ảnh `tray_penguin` chưa rõ loài (designer kiểm, `_topic.md` mục Đề xuất). Câu nói chung về chim cánh cụt nên loài nào cũng đúng; ảnh này chỉ dùng ở câu w2, không dùng chỗ nào khác của bài.
> [CẦN KIỂM] Chim cánh cụt dùng cánh để bơi (như ở *Gọi tên và nhóm động vật* bài ba).

## Học

> Bốn ô: nơi sống (đất phủ băng), cách giữ ấm của chim cánh cụt hoàng đế (đứng sát nhau), nơi con vật kiếm ăn (biển), rồi một con vật giữ ấm bằng lớp mỡ (hải cẩu). Cá voi chỉ nhắc ở ví dụ và gặp ở kệ Chơi.
> Ô "Icy land" mang ý sửa misconception (ví dụ ba "no polar bears live here"). Ví dụ hai so với Bắc Cực của bài 1.
> Không dạy mùa, không vòng đời, không con người, không băng tan. Không nói Nam Cực là biển.

### explore
id: 290ea993-4ac8-42c7-879c-86a8adcc7507
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_land
label.en: Icy land
label.vi: Đất phủ băng
color: gi_dong
sentence.en: The Antarctic is icy land, far south.
sentence.vi: Nam Cực là vùng đất phủ băng, ở tận phía nam.
image.brief: [ảnh] Vùng đất Nam Cực phủ băng tuyết: đỉnh núi phủ tuyết, cánh đồng băng trắng trải rộng, trời xanh; nhìn rõ là đất liền, không phải biển; không có người, không trạm, không lều, không xe, không cờ, không máy bay; không có con vật. Từ khoá tìm ảnh (EN): Transantarctic Mountains; Antarctica ice sheet
image.alt.en: Snowy mountains on icy land
image.alt.vi: Núi tuyết trên vùng đất phủ băng
examples.1.en: ice and snow cover the land
examples.1.vi: băng và tuyết phủ kín mặt đất
examples.2.en: even colder than the Arctic
examples.2.vi: còn lạnh hơn cả Bắc Cực
examples.3.en: no polar bears live here
examples.3.vi: ở đây không có gấu trắng
> Ảnh gốc (16/11, sau kiểm nghiệm thu, tester L2): dãy núi Xuyên Nam Cực phủ băng, chụp từ máy bay NASA Operation IceBridge (phạm vi công cộng); mọi crop cắt bỏ cánh máy bay ở mép phải. Thay ảnh chim cánh cụt Gentoo trên bãi sỏi (`tray_antarctica` của *Bề mặt Trái Đất*) dùng trước đó, vì câu chính và ví dụ một nói băng tuyết phủ kín mặt đất mà ảnh cũ là bãi sỏi.
> Câu chính thay bản đồ (Duy chốt câu 6 = a): nói vị trí bằng lời "far south" · "tận phía nam", đối với "far north" của bài 1.
> [CẦN KIỂM] Nam Cực lạnh hơn Bắc Cực (nói chung, không nêu số độ).
> [CẦN KIỂM] Gấu trắng không có ở Nam Cực ngoài tự nhiên (chỉ tính nơi sống tự nhiên, không tính vườn thú).

#### group explore_huddle
label.en: Huddle
label.vi: Đứng sát nhau
color: vang_hoe
sentence.en: Emperor penguins huddle to keep warm.
sentence.vi: Chim cánh cụt hoàng đế đứng sát nhau cho ấm.
image.brief: [ảnh] Một đàn chim cánh cụt hoàng đế trưởng thành đứng sát vào nhau trên băng, ảnh ngang chụp từ xa vừa đủ thấy cả đàn, nhiều con quay lưng ra ngoài; có thể có tuyết bay; không thấy trứng trên chân, không có chim non nổi bật, không có người, trạm nghiên cứu hay chữ. Từ khoá tìm ảnh (EN): emperor penguin huddle; Aptenodytes forsteri colony
image.alt.en: A big group of emperor penguins
image.alt.vi: Một đàn chim cánh cụt hoàng đế đông đúc
examples.1.en: many penguins, very close together
examples.1.vi: rất nhiều chim cánh cụt đứng sát vào nhau
examples.2.en: they take turns in the middle
examples.2.vi: chúng thay phiên nhau vào đứng giữa đàn
examples.3.en: safe from the icy wind
examples.3.vi: tránh được những cơn gió lạnh buốt
> Hình gốc (bài 3 câu w1 và từ `huddle` dùng lại).
> **Lệch `_topic.md`:** `alt` đổi từ "Emperor penguins standing close together" · "Chim cánh cụt hoàng đế đứng sát nhau" thành "A big group of emperor penguins" · "Một đàn chim cánh cụt hoàng đế đông đúc". Lý do: ảnh này là đáp án câu w1 bài 3 ("Which ones huddle to keep warm?" · "Con nào đứng sát nhau cho ấm?"); `alt.vi` cũ trùng đúng chữ "đứng sát nhau" của câu hỏi (Lỗi hay gặp số mười hai). Ảnh chỉ dùng ở bài 2 và bài 3 nên không ảnh hưởng người viết khác. Phiên chính sửa bảng `alt` ở `_topic.md`.
> Không dạy vì sao đứng sát nhau theo mùa (đàn đứng sát nhau giữa mùa đông, lúc ấp trứng); chỉ nói điều nhìn thấy.
> `brief` sửa 16/11 theo ảnh thật (designer): bỏ "thành một khối tròn". Ảnh đã chọn là đàn rất đông đứng sát nhau giữa mùa đông, không thành khối tròn rõ. `alt` giữ.
> [CẦN KIỂM] Chim cánh cụt hoàng đế đứng sát nhau cho ấm và tránh gió; các con thay phiên nhau vào giữa đàn.

#### group explore_sea_food
label.en: Food in the sea
label.vi: Thức ăn dưới biển
color: cham
sentence.en: Antarctic animals find food in the sea.
sentence.vi: Con vật ở Nam Cực tìm thức ăn dưới biển.
image.brief: [ảnh] Một hoặc hai con chim cánh cụt Adélie (lưng đen, bụng trắng, vòng trắng quanh mắt, mỏ đen) đứng ở mép băng sát mặt biển xanh thẫm, như sắp nhảy xuống nước hoặc vừa lên khỏi nước; thấy rõ cả mép băng và mặt biển; ảnh ngang có khoảng trống quanh con chim (dùng cả khung vuông kệ Chơi); không đàn đông, không hải cẩu hay con vật khác, không cảnh bắt mồi, không người, tàu hay chữ; đúng loài Adélie, không phải chim cánh cụt Gentoo (mỏ cam). Từ khoá tìm ảnh (EN): Pygoscelis adeliae; Adelie penguin ice edge
image.alt.en: A penguin at the edge of the sea
image.alt.vi: Chim cánh cụt bên mép biển
examples.1.en: penguins dive to catch fish
examples.1.vi: chim cánh cụt lặn xuống bắt cá
examples.2.en: seals swim under the ice
examples.2.vi: hải cẩu bơi dưới lớp băng
examples.3.en: whales come to eat
examples.3.vi: cá voi tới đây kiếm ăn
> Hình gốc (kệ Chơi món `tray_adelie`, câu q5 bài này; bài 8 câu w2 dùng lại).
> Ví dụ hai là chữ cần dạy trước câu q4 ("Which one swims under the ice to eat?"). Ví dụ ba nói cá voi bằng lời (ảnh cá voi gặp ở kệ Chơi); không nói mùa.
> "Bắt cá" là chữ trung tính như "bắt" của bài 1; ảnh không có con mồi.
> [CẦN KIỂM] Chim cánh cụt lặn bắt cá, mực, nhuyễn thể nhỏ; hải cẩu Weddell bơi và kiếm ăn dưới lớp băng; cá voi lưng gù tới biển Nam Cực kiếm ăn (theo mùa, bài không nói mùa).

#### group explore_seal
label.en: Seal
label.vi: Hải cẩu
color: nau_dat
sentence.en: Thick fat keeps the seal warm.
sentence.vi: Lớp mỡ dày giữ ấm cho hải cẩu.
image.brief: [ảnh] Một con hải cẩu Weddell nằm nghỉ một mình trên mặt băng phẳng, nhìn ngang, thấy cả thân dài tròn, bộ lông xám có đốm và khuôn mặt tròn; ảnh ngang có khoảng trống quanh con vật (dùng ở khung vuông kệ Chơi và thẻ ba lựa chọn: câu q4 bài này, câu w1 và q4 bài 3); không thẻ gắn, vết sơn đánh dấu, vòng đeo nghiên cứu, máu, người hay chữ; không phải hải cẩu báo đang há miệng; không có ngà, để khác hẳn hải mã. Từ khoá tìm ảnh (EN): Weddell seal Antarctica; Leptonychotes weddellii
image.alt.en: A seal resting on the ice
image.alt.vi: Hải cẩu nằm nghỉ trên băng
examples.1.en: rests on the ice
examples.1.vi: nằm nghỉ trên băng
examples.2.en: flippers for swimming
examples.2.vi: chân chèo để bơi
examples.3.en: breathes at holes in the ice
examples.3.vi: ngoi lên thở ở những lỗ trên băng
> Hình gốc của cả chủ đề (bài 3, 4, 8 dùng lại). Câu chính nối với hải mã bài 1 (cùng giữ ấm bằng lớp mỡ). Bài 3 câu w1 cần ảnh chỉ có **một** con hải cẩu.
> Ví dụ ba không nói chuyện hải cẩu dùng răng giữ lỗ thở.
> [CẦN KIỂM] Hải cẩu Weddell có lớp mỡ dày dưới da; ngoi lên thở ở những lỗ trên băng; dùng chân chèo để bơi.

### new_words
id: f9a6ad31-5fd1-465f-bc94-8812a34bfa15
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: antarctic, huddle

## Chơi

> Bé chọn ba con vật Nam Cực: một con chim cánh cụt, một con hải cẩu, một con cá voi. Cả ba kiếm ăn dưới biển (ý chính hai). Đạt khi đủ ba nhóm và không chọn con vật nơi khác.
> Món bẫy là ba con vật Bắc Cực của bài 1, mỗi con giống một nhóm: gấu trắng (đúng ý misconception: nơi băng giá nào cũng có gấu trắng), hải mã (thân to nằm trên băng, giống hải cẩu), cú tuyết (chim trên nền tuyết, giống chim cánh cụt). Bé phải nghĩ về nơi sống, không chọn theo nền băng hay theo dáng.
> Kệ bảy món, toàn ảnh chụp. Hai món chim cánh cụt (hoàng đế, Adélie) cùng nhóm; nhãn món Adélie là "Penguin" · "Chim cánh cụt", tên loài chỉ ở `brief`.

### tray
id: 370999c3-a8f1-4b5a-af0f-d34cb6012f32
type: build_tray
version: 1
prompt.en: Pick three Antarctic animals
prompt.vi: Chọn ba con vật sống ở Nam Cực
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find a penguin, a seal and a whale.
messages.start.vi: Em tìm một con chim cánh cụt, một con hải cẩu và một con cá voi nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! They all find food in the sea.
messages.balanced.vi: Tuyệt! Cả ba con đều tìm thức ăn dưới biển.
messages.has_limited.en: That one does not live in the Antarctic.
messages.has_limited.vi: Con này không sống ở Nam Cực.
messages.missing.tray_penguins.en: You still need a penguin.
messages.missing.tray_penguins.vi: Em còn thiếu một con chim cánh cụt.
messages.missing.tray_seals.en: You still need a seal.
messages.missing.tray_seals.vi: Em còn thiếu một con hải cẩu.
messages.missing.tray_whales.en: You still need a whale.
messages.missing.tray_whales.vi: Em còn thiếu một con cá voi.
> Lời nhắn `has_limited` đúng với cả ba món bẫy. Lời nhắn `balanced` đúng với mọi bộ ba đạt (chim cánh cụt nào, hải cẩu, cá voi đều kiếm ăn dưới biển).
> [CẦN KIỂM] Gấu trắng, hải mã, cú tuyết không sống ở Nam Cực; cá voi lưng gù tới biển Nam Cực kiếm ăn.

#### group tray_penguins
label.en: Penguin
label.vi: Chim cánh cụt
color: cham
role: required

#### group tray_seals
label.en: Seal
label.vi: Hải cẩu
color: nau_dat
role: required

#### group tray_whales
label.en: Whale
label.vi: Cá voi
color: vang_hoe
role: required

#### group tray_not
label.en: Not an Antarctic animal
label.vi: Không sống ở Nam Cực
color: do_son
role: limit

#### item tray_emperor
label.en: Emperor penguin
label.vi: Chim cánh cụt hoàng đế
group: tray_penguins
image.brief: [ảnh] Một con chim cánh cụt hoàng đế trưởng thành đứng một mình trên băng, nhìn ngang hoặc ba phần tư, thấy cả con từ đầu tới chân, rõ mảng lông vàng cam ở cổ; ảnh ngang có khoảng trống quanh con chim (dùng ở khung vuông kệ Chơi, thẻ ba lựa chọn câu q1 của bài này và bài 3, 4, 6, thẻ thưởng); chỉ một con, không phải đàn đứng sát nhau (ảnh là hình câu q2 nên không được làm bằng chứng cho câu đó); không chim non, trứng, người, tàu hay chữ. Từ khoá tìm ảnh (EN): Aptenodytes forsteri; emperor penguin Antarctica
image.alt.en: An emperor penguin on the ice
image.alt.vi: Chim cánh cụt hoàng đế trên băng
> Hình gốc của cả chủ đề (bài 3, 4, 6, 8 dùng lại).
> [CẦN KIỂM] Chim cánh cụt hoàng đế có mảng lông vàng cam hai bên cổ, gần tai.

#### item tray_bear
label.en: Polar bear
label.vi: Gấu trắng
group: tray_not
image.brief: Dùng lại hình `explore_bear` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): polar bear sea ice
image.alt.en: A polar bear on floating ice
image.alt.vi: Gấu trắng trên tảng băng trôi
> Gấu trắng và chim cánh cụt không chung một ảnh; ở kệ, mỗi con một thẻ riêng.

#### item tray_seal
label.en: Seal
label.vi: Hải cẩu
group: tray_seals
image.brief: Dùng lại hình `explore_seal`. Từ khoá tìm ảnh (EN): Weddell seal Antarctica
image.alt.en: A seal resting on the ice
image.alt.vi: Hải cẩu nằm nghỉ trên băng

#### item tray_owl
label.en: Snowy owl
label.vi: Cú tuyết
group: tray_not
image.brief: Dùng lại hình `tray_owl` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Bubo scandiacus
image.alt.en: A snowy owl on the snow
image.alt.vi: Cú tuyết trên nền tuyết

#### item tray_whale
label.en: Whale
label.vi: Cá voi
group: tray_whales
image.brief: Dùng lại hình `tray_pacific` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): humpback whale breaching ocean
image.alt.en: A whale in a wide blue ocean
image.alt.vi: Cá voi giữa đại dương xanh
> Ảnh gốc là cá voi lưng gù (NOAA, phạm vi công cộng). "Lưng gù" chỉ ở `brief`; bé nghe "whale" · "cá voi".

#### item tray_walrus
label.en: Walrus
label.vi: Hải mã
group: tray_not
image.brief: Dùng lại hình `explore_walrus` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): walrus ice Odobenus
image.alt.en: A walrus resting on the ice
image.alt.vi: Hải mã nằm nghỉ trên băng

#### item tray_adelie
label.en: Penguin
label.vi: Chim cánh cụt
group: tray_penguins
image.brief: Dùng lại hình `explore_sea_food`. Từ khoá tìm ảnh (EN): Pygoscelis adeliae
image.alt.en: A penguin at the edge of the sea
image.alt.vi: Chim cánh cụt bên mép biển
> Designer làm mục `crop` vuông riêng thấy rõ con chim, giữ một phần mặt biển.

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1, q3, q4; ba lựa chọn), `true_false` (q2 Đúng, q5 Đúng, q6 Sai). Không `order_sequence`: các ý của bài không có thứ tự tự nhiên.
> Hình câu `single_choice` là hàng rào tre trung tính (app Explorer ẩn hình câu hỏi khi mọi lựa chọn có hình). Câu nào cũng tự đủ nghĩa khi chỉ nghe.
> Không câu nào hỏi "chim cánh cụt sống ở đâu" hay "gấu trắng sống ở đâu" theo kiểu ghép của quiz Oak Science; q6 là câu nói để bé bác bỏ. Không có hai loài chim cánh cụt trong cùng một câu.

### q1
id: 335d232c-fc60-4cf2-a3fc-350e8bdda50e
format: single_choice
version: 1
dok: 1
prompt.en: Which animal lives in the Antarctic?
prompt.vi: Con nào sống ở Nam Cực?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of a very cold place, far south.
hint.vi: Em nghĩ tới một nơi rất lạnh ở tận phía nam nhé.
explanation_correct.en: Yes! Emperor penguins swim in icy seas.
explanation_correct.vi: Đúng rồi! Chim cánh cụt hoàng đế bơi trong biển lạnh giá.
explanation_wrong.en: The answer is the emperor penguin. It lives on the ice.
explanation_wrong.vi: Đáp án là chim cánh cụt hoàng đế. Loài chim này sống trên băng.
> Hai lựa chọn sai là con vật nơi ấm bé đã gặp ở chủ đề trước (voọc, trâu); đáp án là ảnh bé vừa gặp ở kệ Chơi, không phải ảnh mới duy nhất.

#### option q1_douc
correct: false
feedback.en: A douc climbs trees in warm forests.
feedback.vi: Voọc leo cây trong những khu rừng ấm áp.
label.en: douc
label.vi: con voọc
image.brief: Dùng lại hình `explore_wild` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): red-shanked douc langur tree
image.alt.en: A douc in a tree
image.alt.vi: Con voọc trên cây

#### option q1_emperor
correct: true
label.en: emperor penguin
label.vi: chim cánh cụt hoàng đế
image.brief: Dùng lại hình `tray_emperor`. Từ khoá tìm ảnh (EN): Aptenodytes forsteri
image.alt.en: An emperor penguin on the ice
image.alt.vi: Chim cánh cụt hoàng đế trên băng

#### option q1_buffalo
correct: false
feedback.en: A buffalo lives near warm rice fields.
feedback.vi: Con trâu sống gần những cánh đồng lúa ấm áp.
label.en: buffalo
label.vi: con trâu
image.brief: Dùng lại hình `w1_buffalo` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): water buffalo drinking stream horns
image.alt.en: A water buffalo
image.alt.vi: Con trâu

### q2
id: 9696be75-237a-4e26-88f2-70a7e8367382
format: true_false
version: 1
dok: 1
prompt.en: Emperor penguins huddle to keep warm.
prompt.vi: Chim cánh cụt hoàng đế đứng sát nhau cho ấm.
image.brief: Dùng lại hình `tray_emperor`. Từ khoá tìm ảnh (EN): Aptenodytes forsteri
image.alt.en: An emperor penguin on the ice
image.alt.vi: Chim cánh cụt hoàng đế trên băng
answer: true
hint.en: Think of hugging someone on a cold day.
hint.vi: Em nghĩ xem ôm ai đó vào ngày lạnh thì thấy thế nào nhé.
explanation_correct.en: Yes! The middle of the huddle is warmest.
explanation_correct.vi: Đúng rồi! Chỗ giữa đàn là chỗ ấm nhất.
explanation_wrong.en: This is true. Huddling keeps the penguins warm.
explanation_wrong.vi: Câu này đúng. Đứng sát nhau giữ ấm cho chim cánh cụt.
feedback_false.en: Close together, penguins share their warmth.
feedback_false.vi: Đứng sát nhau, chim cánh cụt sưởi ấm cho nhau.
> DOK 1: nhớ lại câu chính ô "Huddle" (từ `core`). Hình là **một** con chim cánh cụt hoàng đế, không phải ảnh đàn, để ảnh không làm bằng chứng.
> Gợi ý dùng cảnh quen (ôm nhau cho ấm), không trỏ tới ô Học có câu chính là phán quyết.
> [CẦN KIỂM] Giữa đàn chim cánh cụt hoàng đế ấm hơn rìa đàn.

### q3
id: 661038c6-b710-46c2-aa27-8ebca7427a85
format: single_choice
version: 1
dok: 1
prompt.en: Where do Antarctic animals find food?
prompt.vi: Con vật ở Nam Cực tìm thức ăn ở đâu?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about where penguins swim and dive.
hint.vi: Em nghĩ xem chim cánh cụt bơi và lặn ở đâu nhé.
explanation_correct.en: Yes! The icy sea is full of food.
explanation_correct.vi: Đúng rồi! Biển lạnh giá có rất nhiều thức ăn.
explanation_wrong.en: The answer is the sea. Fish swim there.
explanation_wrong.vi: Đáp án là biển. Dưới biển có rất nhiều cá.
> DOK 1: nhớ lại câu chính ô "Food in the sea". Ba ảnh cảnh khác nhau rõ bằng mắt (rừng nhìn từ trên cao, ao làng, sóng biển). Rừng và ao bé đã gặp ở *Sinh vật sống ở đâu?* bài bốn; ảnh biển bé chưa gặp ở chủ đề này nhưng là cảnh quen.
> Ao cũng là nước, nên gợi ý "bơi và lặn" không tự chỉ ra đáp án; bé phải nghĩ tới biển rộng. `alt` của đáp án không có chữ "food".
> [CẦN KIỂM] Biển quanh Nam Cực có rất nhiều thức ăn (nhuyễn thể nhỏ, cá, mực).

#### option q3_forest
correct: false
feedback.en: This forest is warm and full of trees.
feedback.vi: Khu rừng này ấm áp và có rất nhiều cây.
label.en: forest
label.vi: khu rừng
image.brief: Dùng lại hình `tray_forest` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): forest green canopy aerial
image.alt.en: A green forest
image.alt.vi: Khu rừng xanh

#### option q3_pond
correct: false
feedback.en: A village pond is warm and very small.
feedback.vi: Ao làng ấm áp và rất nhỏ.
label.en: pond
label.vi: cái ao
image.brief: Dùng lại hình `q1` ở bài `goi-ten-va-nhom-dong-vat/ca-va-luong-cu`. Từ khoá tìm ảnh (EN): village pond duckweed bank
image.alt.en: A pond in a village
image.alt.vi: Cái ao ở làng quê

#### option q3_sea
correct: true
label.en: sea
label.vi: biển
image.brief: Dùng lại hình `tray_atlantic` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): Atlantic Ocean waves
image.alt.en: Big waves on a wide ocean
image.alt.vi: Sóng lớn giữa đại dương rộng
> Ảnh gốc là sóng lớn giữa đại dương, không tàu, không thấy băng. Không dùng ảnh mép băng `explore_sea_food` ở đây, vì ảnh đó có chim cánh cụt và bé vừa xem ở ô Học có câu chính là đáp án.

### q4
id: 728287cf-1415-4732-932f-1db1463b367e
format: single_choice
version: 1
dok: 2
prompt.en: Which one swims under the ice to eat?
prompt.vi: Con nào bơi dưới lớp băng để kiếm ăn?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look at each animal's body and feet.
hint.vi: Em nhìn kỹ thân hình và đôi chân của từng con nhé.
explanation_correct.en: Yes! A seal can stay underwater a long time.
explanation_correct.vi: Đúng rồi! Hải cẩu ở dưới nước được rất lâu.
explanation_wrong.en: The answer is the seal. It swims and dives.
explanation_wrong.vi: Đáp án là con hải cẩu. Hải cẩu bơi và lặn rất giỏi.
> DOK 2: ô "Seal" nói lớp mỡ và chân chèo; ý "bơi dưới lớp băng" là ví dụ ở ô khác ("Food in the sea"). Bé so ba thân hình (chân chèo, bốn chân có móng, cánh) để chọn con bơi được. Ba con đều nằm, đứng trên băng tuyết, nên nền ảnh không chỉ ra đáp án.
> Tuần lộc và cú tuyết bé đã gặp ở bài 1 (kệ Chơi, câu q4); hải cẩu bé vừa gặp ở Học và Chơi.
> `alt` của đáp án ("A seal resting on the ice") có chữ "ice" như câu hỏi. Giữ theo bảng `alt` chung vì chữ đó chỉ tả nền (hai lựa chọn kia nền tuyết), không nói con nào bơi; phiên chính quyết nếu cần đổi.
> Ảnh `tray_reindeer` designer đã chọn là đàn tuần lộc trên sườn đồi tuyết; `alt.en` đổi 16/11 thành "Reindeer in the snow" (bỏ "A", vì ảnh có nhiều con), `alt.vi` giữ. Ở câu này cả ba lựa chọn đều trên nền băng tuyết, nên nền tuyết không chỉ ra đáp án; khác bài 1 q4 (đã đổi sang ảnh riêng không tuyết).
> [CẦN KIỂM] Hải cẩu Weddell lặn được rất lâu (có khi hơn một giờ).

#### option q4_seal
correct: true
label.en: seal
label.vi: hải cẩu
image.brief: Dùng lại hình `explore_seal`. Từ khoá tìm ảnh (EN): Weddell seal Antarctica
image.alt.en: A seal resting on the ice
image.alt.vi: Hải cẩu nằm nghỉ trên băng

#### option q4_reindeer
correct: false
feedback.en: A reindeer walks on cold, snowy land.
feedback.vi: Tuần lộc đi lại trên vùng đất lạnh phủ tuyết.
label.en: reindeer
label.vi: tuần lộc
image.brief: Dùng lại hình `tray_reindeer` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Rangifer tarandus
image.alt.en: Reindeer in the snow
image.alt.vi: Tuần lộc trên tuyết

#### option q4_owl
correct: false
feedback.en: A snowy owl flies over the snow.
feedback.vi: Cú tuyết bay lượn trên nền tuyết.
label.en: snowy owl
label.vi: cú tuyết
image.brief: Dùng lại hình `tray_owl` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Bubo scandiacus
image.alt.en: A snowy owl on the snow
image.alt.vi: Cú tuyết trên nền tuyết

### q5
id: 484d4465-f108-4d10-a68e-385504adea85
format: true_false
version: 1
dok: 2
prompt.en: Thick feathers keep a penguin warm.
prompt.vi: Lông vũ dày giữ ấm cho chim cánh cụt.
image.brief: Dùng lại hình `explore_sea_food`. Từ khoá tìm ảnh (EN): Pygoscelis adeliae
image.alt.en: A penguin at the edge of the sea
image.alt.vi: Chim cánh cụt bên mép biển
answer: true
hint.en: Think of the snowy owl in the Arctic.
hint.vi: Em nghĩ tới con cú tuyết ở Bắc Cực nhé.
explanation_correct.en: Yes! A layer of fat helps, too.
explanation_correct.vi: Đúng rồi! Lớp mỡ dưới da cũng giúp giữ ấm.
explanation_wrong.en: This is true. Thick feathers keep penguins warm.
explanation_wrong.vi: Câu này đúng. Lông vũ dày giữ ấm cho chim cánh cụt.
feedback_false.en: A penguin's feathers are short and close together.
feedback_false.vi: Lông vũ của chim cánh cụt ngắn và mọc rất sát nhau.
> DOK 2: ô Học hôm nay không nói lông vũ chim cánh cụt. Bé áp điều đã học ở bài 1 (nhóm "Thick feathers" của cú tuyết, ý chính hai "lông dày, lớp mỡ giữ ấm") và ở *Gọi tên và nhóm động vật* (chim có lông vũ) cho chim cánh cụt.
> Gợi ý trỏ tới một con vật bài trước để so, không nói đáp án.
> [CẦN KIỂM] Chim cánh cụt có lông vũ ngắn, dày, mọc rất sát nhau, cùng một lớp mỡ dưới da, giữ ấm.

### q6
id: d4b99805-a1fe-4a3c-9d83-7c2debe4a972
format: true_false
version: 1
dok: 2
misconception: polar_bears_in_antarctic
prompt.en: Polar bears live in the Antarctic.
prompt.vi: Gấu trắng sống ở Nam Cực.
image.brief: Dùng lại hình `explore_bear` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): polar bear sea ice
image.alt.en: A polar bear on floating ice
image.alt.vi: Gấu trắng trên tảng băng trôi
answer: false
hint.en: Think about the animals you met today.
hint.vi: Em nghĩ lại những con vật em gặp hôm nay nhé.
explanation_correct.en: Polar bears live far north, in the Arctic.
explanation_correct.vi: Gấu trắng sống ở tận phía bắc, tại Bắc Cực.
explanation_wrong.en: This is false. Polar bears live in the Arctic.
explanation_wrong.vi: Câu này sai. Gấu trắng sống ở Bắc Cực.
feedback_true.en: Penguins and seals live on the Antarctic ice.
feedback_true.vi: Chim cánh cụt và hải cẩu sống trên băng Nam Cực.
> Câu misconception (`polar_bears_in_antarctic`, misconception của sườn), bằng hình, DOK 2: bé còn nghĩ "nơi băng giá nào cũng có gấu trắng" sẽ chạm gật đầu. Bé áp điều đã học (ví dụ ba ô "Icy land", món bẫy gấu trắng ở Chơi, "far north" của bài 1) để bác câu nói. Câu chỉ kiểm một việc: gấu trắng có sống ở Nam Cực không.
> Hình là gấu trắng một mình trên băng trôi (Bắc Cực), không có chim cánh cụt, không cảnh săn mồi. Ảnh băng trôi giống băng ở Nam Cực, nên ảnh không làm bằng chứng cho phía nào.
> Gợi ý trỏ tới các con vật bé gặp hôm nay (chim cánh cụt, hải cẩu, cá voi), không trỏ tới ô "Icy land". `feedback_true` nói con vật thật sự sống ở Nam Cực, không lặp `explanation_wrong`.
> `explanation_correct` đứng một mình được cho thẻ "Ý sai → Ý đúng" ở bước Tổng kết: "Polar bears live in the Antarctic." → "Polar bears live far north, in the Arctic.".
> [CẦN KIỂM] Gấu trắng sống tự nhiên chỉ ở vùng Bắc Cực, không có ở Nam Cực.

## Từ vựng

### antarctic
id: e5a25469-0527-4a40-8d77-7681d9dad141
tier: core
term.en: Antarctic
term.vi: Nam Cực
example.en: The Antarctic is far to the south.
example.vi: Nam Cực ở tận phía nam Trái Đất.
image.brief: Dùng lại hình `explore_land`. Từ khoá tìm ảnh (EN): Transantarctic Mountains
image.alt.en: Snowy mountains on icy land
image.alt.vi: Núi tuyết trên vùng đất phủ băng

### huddle
id: 957413ef-bc84-47de-8a12-3e50666990e1
tier: core
term.en: huddle
term.vi: đứng sát nhau
example.en: Penguins huddle when the wind is cold.
example.vi: Chim cánh cụt đứng sát nhau khi gió lạnh.
image.brief: Dùng lại hình `explore_huddle`. Từ khoá tìm ảnh (EN): emperor penguin huddle
image.alt.en: A big group of emperor penguins
image.alt.vi: Một đàn chim cánh cụt hoàng đế đông đúc
> Nghe thử giọng EN đọc "huddle".

### seal
id: f4c7d207-69c0-43f8-95ce-36d558755682
tier: extra
term.en: seal
term.vi: hải cẩu
example.en: A seal sleeps on the ice.
example.vi: Hải cẩu ngủ trên băng.
image.brief: Dùng lại hình `explore_seal`. Từ khoá tìm ảnh (EN): Weddell seal Antarctica
image.alt.en: A seal resting on the ice
image.alt.vi: Hải cẩu nằm nghỉ trên băng

### emperor_penguin
id: e71fa7bf-7d7c-4188-afb0-82b7a24cdf9f
tier: extra
term.en: emperor penguin
term.vi: chim cánh cụt hoàng đế
example.en: An emperor penguin has yellow on its neck.
example.vi: Chim cánh cụt hoàng đế có mảng lông vàng ở cổ.
image.brief: Dùng lại hình `tray_emperor`. Từ khoá tìm ảnh (EN): Aptenodytes forsteri
image.alt.en: An emperor penguin on the ice
image.alt.vi: Chim cánh cụt hoàng đế trên băng
> [CẦN KIỂM] Mảng lông vàng cam ở hai bên cổ, gần tai, của chim cánh cụt hoàng đế (thấy được trong ảnh `tray_emperor`).

## Thưởng

### emperor_penguin_card
id: c5ed741a-5c9f-4a29-857c-87cf24377a2a
set: animals
rarity: rare
name.en: Emperor penguin
name.vi: Chim cánh cụt hoàng đế
tag.en: Huddles to keep warm
tag.vi: Đứng sát nhau cho ấm
fact.en: It is the biggest penguin of all.
fact.vi: Đây là loài chim cánh cụt to nhất.
image.brief: Dùng lại hình `tray_emperor`. Từ khoá tìm ảnh (EN): Aptenodytes forsteri
image.alt.en: An emperor penguin on the ice
image.alt.vi: Chim cánh cụt hoàng đế trên băng
> [CẦN KIỂM] Chim cánh cụt hoàng đế to nhất (cao nhất, nặng nhất) trong các loài chim cánh cụt.
> Bộ `set: animals` đã có (chủ đề số một); chim cánh cụt hoàng đế chưa có thẻ.

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Không bản đồ, không quả địa cầu, không ảnh Trái Đất từ vũ trụ. Con vật hoang dã: không thẻ gắn, vết sơn đánh dấu, vòng đeo nghiên cứu, người, tàu, trạm nghiên cứu, chữ. Không cảnh săn mồi (không hải cẩu báo bắt chim cánh cụt); gấu trắng và chim cánh cụt không chung một ảnh. Không trứng, chim non nổi bật (vòng đời để dành cho *Sự sống mới*).
- **Ảnh mới (năm):** vùng đất Nam Cực phủ băng, núi Xuyên Nam Cực, NASA, phạm vi công cộng (`explore_land`: ô "Icy land", từ `antarctic`; thêm 16/11 sau kiểm nghiệm thu, crop cắt bỏ cánh máy bay ở mép phải); đàn chim cánh cụt hoàng đế đứng sát nhau (`explore_huddle`); một con chim cánh cụt hoàng đế đứng trên băng (`tray_emperor`); chim cánh cụt Adélie bên mép băng sát mặt biển (`explore_sea_food`); hải cẩu Weddell nằm nghỉ một mình trên băng (`explore_seal`). Bốn ảnh là hình gốc của cả chủ đề (bảng Hình dùng chung ở `_topic.md`): giữ đúng key.
- **Ảnh dùng lại:**
  - *Bề mặt Trái Đất* bài hai: `tray_pacific` (cá voi lưng gù: món cá voi), `tray_atlantic` (sóng biển: đáp án q3); *Bề mặt Trái Đất* bài một: `tray_forest` (q3).
  - Bài 1 chủ đề này: `explore_bear` (gấu trắng: món bẫy, q6; từ 16/11 thay `tray_arctic` của *Bề mặt Trái Đất*), `explore_walrus` (w1, món bẫy), `tray_owl` (món bẫy, q4), `tray_reindeer` (q4).
  - *Gọi tên và nhóm động vật*: `w1` hàng rào tre (hình câu w1, q1, q3, q4), `explore_wild` voọc (w1, q1), `chim-va-bo-sat` `tray_penguin` (w2), `ca-va-luong-cu` `q1` ao làng (q3); *Khủng long*: `w1_buffalo` trâu (q1).
- **Một ảnh, nhiều khung:** `tray_emperor` dùng ở khung vuông (kệ Chơi, từ), thẻ ba lựa chọn rất ngang 5:2 (q1 bài này, bài 3, 4, 6), hình câu `true_false` (q2) và thẻ thưởng; `explore_seal` ở khung vuông và thẻ 5:2 (q4 bài này, w1 và q4 bài 3); `explore_sea_food` ở ô Học, khung vuông kệ Chơi và hình câu q5. Chọn ảnh ngang có khoảng trống quanh con vật; làm mục riêng có `crop` riêng cho từng khung.
- **`alt` đổi so với bảng chung:** `explore_huddle` dùng "A big group of emperor penguins" · "Một đàn chim cánh cụt hoàng đế đông đúc" (ghi chú dưới ô "Huddle").
- **Ảnh khó:**
  - đàn chim cánh cụt hoàng đế đứng sát nhau: chưa kiểm riêng truy vấn `emperor penguin huddle`; nhiều ảnh đàn có chim non lông xám hay thấy trứng trên chân, chọn ảnh con trưởng thành;
  - chim cánh cụt hoàng đế một con: khoảng mười hai ảnh qua luật; nhiều ảnh là cả đàn, cần ảnh chỉ một con (ảnh là hình câu q2);
  - hải cẩu Weddell: nhiều ảnh có thẻ gắn hay vết sơn đánh dấu của nhà nghiên cứu, chọn ảnh không thấy; cần đúng một con (bài 3 câu w1 nói "rests alone");
  - chim cánh cụt Adélie: phải đúng loài (mỏ đen, vòng trắng quanh mắt), không lấy ảnh Gentoo (mỏ cam);
  - `chim-va-bo-sat` `tray_penguin`: designer kiểm loài như `_topic.md` mục Đề xuất; nếu là loài bờ biển ấm thì chỉ dùng ở câu w2 (đã đúng như vậy).
- **Màu:** Học: đất phủ băng `gi_dong`, đứng sát nhau `vang_hoe`, thức ăn dưới biển `cham`, hải cẩu `nau_dat`. Chơi: chim cánh cụt `cham`, hải cẩu `nau_dat`, cá voi `vang_hoe`, không sống ở Nam Cực `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (antarctic, huddle). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, bảy món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Đúng). Quiz `single_choice` (q1, q3, q4; ba lựa chọn), `true_false` (q2 Đúng, q5 Đúng, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`polar_bears_in_antarctic`). Không có `labels` ở câu `true_false`.
- **Vị trí đáp án:** app xáo lựa chọn (SK-047). Thứ tự trong file theo bảng ở `_topic.md`: w1 đáp án ở chỗ một, q1 chỗ hai, q3 chỗ ba, q4 chỗ một.
- **Màn Chơi, ví dụ để kiểm:** Chim cánh cụt hoàng đế, Hải cẩu, Cá voi → `balanced`; Chim cánh cụt, Hải mã, Cá voi → `has_limited`; Chim cánh cụt hoàng đế, Chim cánh cụt, Hải cẩu → `missing.tray_whales`; Gấu trắng, Hải cẩu, Cá voi → `has_limited`.
- **Key:** nhóm Chơi là `tray_penguins`, `tray_seals`, `tray_whales`, `tray_not`; món là `tray_emperor`, `tray_adelie`, `tray_seal`, `tray_whale`, `tray_bear`, `tray_walrus`, `tray_owl` (không trùng key nhóm).
- **Khởi động trỏ sang bài khác:** w1 → `noi-song-tren-trai-dat/bac-cuc` (bài 1 phải có id trước: chạy `ids` cho `_topic.md`, bài 1, rồi bài này); w2 → `goi-ten-va-nhom-dong-vat/chim-va-bo-sat` (đã có id).
- **Từ EN có thể ngoài Starters/Movers:** Antarctic, Arctic, icy, huddle, huddling, emperor penguin, penguin, seal, whale, walrus, reindeer, snowy owl, douc, buffalo, flippers, dive, layer, warmest, underwater. Nghe thử giọng EN đọc "Antarctic", "huddle", "emperor penguin".
