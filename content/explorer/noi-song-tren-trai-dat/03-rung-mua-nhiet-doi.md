---
id: 367300a5-2826-4b9b-a2b3-8bf913e502ed
topic: noi-song-tren-trai-dat
slug: rung-mua-nhiet-doi
order: 3
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Rainforests
vi: Rừng mưa nhiệt đới
> Giữ đúng tên ở `content/syllabus.json` (key `new-habitats-around-the-world`, bài số ba).

## Mục tiêu
en: I can say what a rainforest is like.
vi: Em nói được rừng mưa nhiệt đới như thế nào.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 16/11/2026. Ticket SK-048. Mọi dòng `id:` để trống; chạy `ids` sau `_topic.md`, bài 1 và bài 2 (câu w1 trỏ tới bài 2).
> Sườn một phần: Oak Địa lý Year 2, unit 4 *Hot places*, lesson 2 `tropical-rainforests-climate-and-location` (`docs/oak/geography-y2-cold-and-hot-places.md`). Dùng ý: rừng mưa nóng, mưa nhiều; A-ma-dôn là rừng mưa lớn nhất; rất nhiều con vật, sống ở nhiều tầng (con lười trên cây, ếch phi tiêu độc trên mặt đất). Viết lại, không chép câu quiz.
> Bỏ: xích đạo, bản đồ, mốc nhiệt độ, từ "khí hậu", "đa dạng", misconception "thời tiết và khí hậu là một" (quá trừu tượng); khỉ rú, báo đốm, ảnh mưa trong rừng (`_topic.md` mục Lệch); chuối, xoài, dứa. Không có câu nào hỏi "con nào sống ở tầng đất" với bộ ba con vật của quiz Oak.
> Bài `core` thứ hai: nơi nóng đầu tiên, sau hai bài vùng cực. Sửa `forest_animals_on_ground` ở ý chính ba, hai ô Học "Up in the trees" và "On the ground", phần Chơi, câu q4 và câu q6 (gắn key).

## Ý chính
1.en: A rainforest is hot and very rainy.
1.vi: Rừng mưa nhiệt đới nóng và mưa rất nhiều.
2.en: Vietnam has rainforests. The Amazon is huge.
2.vi: Việt Nam có rừng mưa nhiệt đới. Rừng A-ma-dôn rất rộng.
3.en: Many animals live high in the trees.
3.vi: Nhiều con vật sống trên cây cao.
> Từ cụ thể tới trừu tượng: nơi sống trông và cảm thấy ra sao (nóng, mưa nhiều), rừng mưa gần nhà và rất xa, rồi ý con vật sống ở nhiều tầng (sửa misconception). Chữ chốt ở `_topic.md`.
> Bài này khác "rừng" (forest) của *Sinh vật sống ở đâu?* bài bốn: nói rõ nóng, mưa nhiều, nhiều tầng cây.
> [CẦN KIỂM] Cúc Phương, Cát Tiên được xếp là rừng mưa nhiệt đới; A-ma-dôn là rừng mưa nhiệt đới lớn nhất.

## Khởi động

> Hai câu: w1 ôn bài ngay trước (bài 2, từ `huddle`); w2 ôn *Sinh vật sống ở đâu?* bài bốn ("rừng" có cây cao để leo, ví dụ ô Forest của bài đó), để nối rừng với rừng mưa. Câu w2 là câu mới, không chép câu cũ.

### w1
id: 81cf8f61-b9e7-4dd0-b1ed-45d591d49f37
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: noi-song-tren-trai-dat/nam-cuc
prompt.en: Which ones huddle to keep warm?
prompt.vi: Con nào đứng sát nhau cho ấm?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of friends hugging on a cold day.
hint.vi: Em nghĩ tới các bạn ôm nhau vào một ngày lạnh nhé.
explanation_correct.en: Yes! Huddling keeps out the icy wind.
explanation_correct.vi: Đúng rồi! Đứng sát nhau giúp chim cánh cụt tránh gió lạnh.
explanation_wrong.en: The answer is the emperor penguins. They stand close.
explanation_wrong.vi: Đáp án là đàn chim cánh cụt hoàng đế. Chúng đứng sát bên nhau.
> Ôn từ `core` "huddle" của bài 2. Gợi ý dùng cảnh quen (ôm nhau cho ấm), như gợi ý câu q2 bài 2.
> `alt` của đáp án theo bản đổi ở bài 2 ("A big group of emperor penguins"), không có chữ "đứng sát nhau" của câu hỏi (xem ghi chú dưới ô "Huddle" bài 2).

#### option w1_seal
correct: false
feedback.en: A seal rests alone on the ice.
feedback.vi: Hải cẩu nằm nghỉ một mình trên băng.
label.en: seal
label.vi: hải cẩu
image.brief: Dùng lại hình `explore_seal` ở bài `noi-song-tren-trai-dat/nam-cuc`. Từ khoá tìm ảnh (EN): Weddell seal Antarctica
image.alt.en: A seal resting on the ice
image.alt.vi: Hải cẩu nằm nghỉ trên băng
> `feedback` tả điều nhìn thấy: ảnh gốc chỉ có một con hải cẩu (brief ở bài 2 đã ghi).

#### option w1_huddle
correct: true
label.en: emperor penguins
label.vi: đàn chim cánh cụt hoàng đế
image.brief: Dùng lại hình `explore_huddle` ở bài `noi-song-tren-trai-dat/nam-cuc`. Từ khoá tìm ảnh (EN): emperor penguin huddle
image.alt.en: A big group of emperor penguins
image.alt.vi: Một đàn chim cánh cụt hoàng đế đông đúc

### w2
id: 775fde92-2329-4eaf-9d0f-bc7ddc6d8c10
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: sinh-vat-song-o-dau/noi-song-cua-con-vat
prompt.en: Forests have tall trees to climb.
prompt.vi: Rừng có cây cao để leo trèo.
image.brief: Dùng lại hình `tray_forest` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): forest green canopy aerial
image.alt.en: A green forest
image.alt.vi: Khu rừng xanh
answer: true
hint.en: Think about where a douc likes to be.
hint.vi: Em nghĩ xem voọc thích ở chỗ nào nhé.
explanation_correct.en: Yes! Doucs climb and eat up in the trees.
explanation_correct.vi: Đúng rồi! Voọc leo trèo và kiếm ăn trên cây cao.
explanation_wrong.en: This is true. Animals climb tall forest trees.
explanation_wrong.vi: Câu này đúng. Con vật leo lên những cây rừng cao.
feedback_false.en: Forest trees grow tall, with many branches.
feedback_false.vi: Cây rừng mọc cao và có rất nhiều cành.
> Ôn ví dụ "tall trees to climb" ở ô "Forest" của bài đó; hình là ảnh từ `forest` bé đã học. Ảnh chụp tán rừng từ trên cao, không thấy con vật leo cây, nên không làm bằng chứng.
> Ảnh `tray_forest` thật ra là rừng nhiệt đới (đảo Barro Colorado). Bài này chỉ dùng ảnh đó ở câu ôn "rừng", không dùng làm lựa chọn "không phải rừng mưa" (`_topic.md` mục Hình dùng chung).

## Học

> Bốn ô: rừng mưa ở Việt Nam, rừng A-ma-dôn rất xa, rồi hai tầng của rừng (trên cây cao, trên mặt đất). Hai ô cuối cùng sửa misconception: có con sống trên mặt đất, nhưng nhiều con sống trên cây.
> Chữ VI cho "on the ground" là "trên mặt đất" ở cả bài (sửa theo tester C1, 16/11): "dưới mặt đất" là dưới lòng đất, còn "sống dưới đất" dễ hiểu là sống trong đất như con giun.
> Voọc, vượn, chim hồng hoàng chỉ nhắc ở ví dụ ô Việt Nam; vượn, chim hồng hoàng, vẹt đuôi dài gặp ảnh ở kệ Chơi.
> Không xích đạo, không bản đồ, không "khí hậu". Không phá rừng, không động vật gặp nguy.

### explore
id: dcb3cf89-1398-494c-a4a6-b3c590e596a7
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_vietnam
label.en: Rainforest in Vietnam
label.vi: Rừng mưa ở Việt Nam
color: gi_dong
sentence.en: Vietnam has rainforests with very tall trees.
sentence.vi: Việt Nam có rừng mưa nhiệt đới với nhiều cây rất cao.
image.brief: [ảnh] Bên trong rừng mưa nhiệt đới ở vườn quốc gia Cát Tiên (trang gốc ghi đúng nơi), ảnh ngang thấy rõ nhiều tầng cây: gốc cây cổ thụ rất to có rễ bạnh, thân cây cao, dây leo, cây nhỏ và cây bụi lá xanh phía dưới; không có con vật nổi bật trên mặt đất (ảnh là hình câu q6, không được đẩy bé về phía "con vật sống trên mặt đất"); không người, đường mòn có biển, cầu gỗ, chữ; chụp từ trong rừng, không chụp từ trên cao (khác ảnh `tray_forest` bé đã gặp). Từ khoá tìm ảnh (EN): Cat Tien forest; tropical rainforest Vietnam
image.alt.en: Tall trees in a thick forest
image.alt.vi: Cây cao trong khu rừng rậm
examples.1.en: hot, rainy and very green
examples.1.vi: nóng, mưa nhiều và xanh um
examples.2.en: doucs and gibbons live here
examples.2.vi: voọc và vượn sống ở đây
examples.3.en: hornbills fly over the treetops
examples.3.vi: chim hồng hoàng bay trên những ngọn cây
> Hình gốc của cả chủ đề (câu q3, q5, q6 và từ `rainforest` bài này; bài 6, 7, 8 dùng lại). `alt` không có chữ "hot", "rainy", "rainforest" vì ảnh là đáp án câu q5. Không tìm được ảnh đúng nơi thì `brief` bỏ tên nơi, dùng rừng mưa Đông Nam Á khác, và báo phiên chính.
> Câu chính không nêu tên Cúc Phương, Cát Tiên (ảnh có thể đổi nơi; giọng EN đọc tên Việt khó nghe). Ví dụ một là chữ cần dạy trước câu q5 ("hot and rainy").
> `brief` sửa 16/11 theo ảnh thật (designer): rừng Cát Tiên, gốc cổ thụ rễ bạnh, dây leo, cây bụi, không đường mòn (trang gốc "Cat Tien Park, Vietnam, tropical forest, roots"). Truy vấn đầu đổi từ `Cuc Phuong` thành `Cat Tien forest`; mọi chỗ dùng lại (bài này, bài 6, 7, 8) và bảng từ khoá ở `_topic.md` chép theo. `alt` giữ; chữ bé nghe không nêu tên nơi nên không đổi.
> [CẦN KIỂM] Ảnh nay chụp ở Cát Tiên, nên chữ "here" của ví dụ hai, ba nói về Cát Tiên: voọc (ở Cát Tiên là voọc chà vá chân đen, không phải chân nâu), vượn đen má vàng và chim hồng hoàng có ở Cát Tiên.
> [CẦN KIỂM] Rừng Cúc Phương, Cát Tiên nóng, mưa nhiều; voọc, vượn, chim hồng hoàng sống trong rừng mưa ở Việt Nam (voọc chà vá chân nâu, vượn đen má vàng ở Cát Tiên, chim hồng hoàng).

#### group explore_amazon
label.en: The Amazon
label.vi: Rừng A-ma-dôn
color: cham
sentence.en: The Amazon is the biggest rainforest of all.
sentence.vi: Rừng A-ma-dôn là rừng mưa nhiệt đới lớn nhất.
image.brief: [ảnh] Rừng A-ma-dôn chụp từ trên cao: tán rừng xanh kín, có sông ở phía xa; ảnh ngang; trang gốc phải ghi ảnh chụp ở vùng A-ma-dôn; không đường sá, nhà, khói, khoảng rừng bị chặt hay đốt, máy bay, người, chữ. Từ khoá tìm ảnh (EN): Amazon rainforest aerial; Amazon river forest
image.alt.en: A huge forest with a river
image.alt.vi: Khu rừng rộng lớn có dòng sông
examples.1.en: far away, across the ocean
examples.1.vi: ở rất xa, bên kia đại dương
examples.2.en: many times bigger than Vietnam
examples.2.vi: rộng gấp nhiều lần nước Việt Nam
examples.3.en: a big river runs through it
examples.3.vi: một dòng sông lớn chảy qua rừng
> Hình gốc (câu q2 và từ `treetop` bài này). Ví dụ một thay bản đồ (Duy chốt câu 6 = a), nói vị trí bằng lời. Ví dụ hai so với nước mình để bé hình dung "rất rộng".
> Ảnh không có dấu vết phá rừng (ranh giới với Discoverer #16).
> `brief` sửa 16/11 theo ảnh thật (designer): rừng A-ma-dôn gần Manaus nhìn từ trên cao, sông Rio Negro ở phía xa, nên brief nói "có sông ở phía xa" thay "một dòng sông lớn uốn khúc chảy qua". `alt` giữ. Ví dụ ba và `feedback_true` câu q2 ("A big river flows through this forest.") vẫn đúng với ảnh (sông lớn thấy được, chảy qua rừng A-ma-dôn), không đổi.
> [CẦN KIỂM] Rừng A-ma-dôn là rừng mưa nhiệt đới lớn nhất; rộng gấp nhiều lần diện tích Việt Nam (rừng khoảng 5,5 triệu km², Việt Nam khoảng 331 nghìn km²); sông A-ma-dôn chảy qua rừng.

#### group explore_trees
label.en: Up in the trees
label.vi: Trên cây cao
color: vang_hoe
sentence.en: A sloth lives high in the trees.
sentence.vi: Con lười sống trên cây cao.
image.brief: [ảnh] Một con lười (ba ngón hoặc hai ngón) treo mình trên cành cây cao giữa tán lá xanh, nhìn ngang, thấy cả con, rõ móng vuốt dài bám cành; ảnh ngang có khoảng trống quanh con vật (dùng ở khung vuông kệ Chơi và thẻ lựa chọn ở bài 4, 6, 8); con vật hoang dã: không người bế, không dây, lưới, chuồng, chữ. Từ khoá tìm ảnh (EN): Bradypus sloth; Choloepus sloth tree
image.alt.en: A sloth hanging from a branch
image.alt.vi: Con lười treo trên cành cây
examples.1.en: moves very, very slowly
examples.1.vi: di chuyển rất, rất chậm
examples.2.en: eats leaves in the treetops
examples.2.vi: ăn lá trên ngọn cây
examples.3.en: gibbons and birds live up here, too
examples.3.vi: vượn và chim cũng sống trên cao
> Hình gốc của cả chủ đề (bài 4, 6, 7, 8 dùng lại; thẻ thưởng bài 8). Câu chính có "high in the trees", chữ cần dạy trước câu q4 và q6. Ví dụ ba mở từ một con (con lười) ra "nhiều con vật" của ý chính ba.
> [CẦN KIỂM] Con lười di chuyển rất chậm, ăn lá trên tán cây, sống ở rừng mưa A-ma-dôn và Trung Mỹ.

#### group explore_ground
label.en: On the ground
label.vi: Trên mặt đất
color: nau_dat
sentence.en: Poison dart frogs hop on the ground.
sentence.vi: Ếch phi tiêu độc nhảy trên mặt đất.
image.brief: [ảnh] Một con ếch phi tiêu độc màu sặc sỡ (xanh dương, vàng, hoặc đỏ và đen) ngồi trên lớp lá rụng nâu ở mặt đất rừng, chụp gần nhưng thấy cả con; ảnh ngang có khoảng trống quanh con ếch (dùng ở khung vuông kệ Chơi); ếch hoang dã: không bể kính, không nền rêu nhân tạo, không tay người, không chữ. Từ khoá tìm ảnh (EN): Dendrobates; poison dart frog leaf litter
image.alt.en: A tiny frog on fallen leaves
image.alt.vi: Con ếch nhỏ trên lá rụng
examples.1.en: bright red, blue or yellow skin
examples.1.vi: da màu đỏ, xanh dương hay vàng rực rỡ
examples.2.en: hides under fallen leaves
examples.2.vi: trốn dưới lớp lá rụng
examples.3.en: only look, never touch
examples.3.vi: chỉ nhìn, không chạm vào
> Hình gốc (kệ Chơi bài này; bài 4 câu w1 dùng lại). Ví dụ ba là lời dặn an toàn bắt buộc (`_topic.md` mục An toàn). Không nói vì sao ếch độc, không nói chuyện thổ dân tẩm độc phi tiêu.
> Ô này cho bé thấy có con sống trên mặt đất (ý đúng một nửa của misconception), để câu q6 sửa đúng chỗ: không phải "mọi" con.
> [CẦN KIỂM] Ếch phi tiêu độc sống ở tầng đất và cây thấp, trên lá rụng; da màu sặc sỡ; độc qua da (vì thế dặn chỉ nhìn).

### new_words
id: 59b2e86a-863e-4ad8-9d79-b291bb768367
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: rainforest, treetop

## Chơi

> Bé chọn ba con vật rừng mưa ở ba tầng: một con leo trèo trên cây (con lười, con vượn), một con biết bay (chim hồng hoàng, vẹt đuôi dài), một con trên mặt đất (ếch phi tiêu độc). Đạt khi đủ ba nhóm và không chọn con vật nơi khác. Trò chơi chính là ý chính ba: rừng mưa có con vật cả trên cao lẫn dưới thấp.
> Món bẫy giống một nhóm nhưng sống nơi khác: cú tuyết (biết bay, giống nhóm chim), cáo Bắc Cực (đi trên mặt đất, giống nhóm trên mặt đất), chim cánh cụt hoàng đế (chim). Cả ba là con vật bài 1, bài 2.
> Kệ tám món, toàn ảnh chụp. Lời nhắn mở đầu không kể tên ba nhóm, để bé tự nhìn tầng sống.

### tray
id: e5c9d7ea-bc70-40d4-8893-6e0181ed845b
type: build_tray
version: 1
prompt.en: Pick three rainforest animals
prompt.vi: Chọn ba con vật sống ở rừng mưa nhiệt đới
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Look up high and down on the ground.
messages.start.vi: Em nhìn cả lên cây cao lẫn xuống mặt đất nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! Rainforest animals live high and low.
messages.balanced.vi: Tuyệt! Con vật rừng mưa sống cả trên cao lẫn dưới thấp.
messages.has_limited.en: That one does not live in the rainforest.
messages.has_limited.vi: Con này không sống ở rừng mưa nhiệt đới.
messages.missing.tray_climb.en: You still need an animal that climbs.
messages.missing.tray_climb.vi: Em còn thiếu một con biết leo trèo.
messages.missing.tray_fly.en: You still need an animal that flies.
messages.missing.tray_fly.vi: Em còn thiếu một con biết bay.
messages.missing.tray_ground.en: You still need an animal on the ground.
messages.missing.tray_ground.vi: Em còn thiếu một con sống trên mặt đất.
> Lời nhắn `has_limited` đúng với cả ba món bẫy. Lời nhắn `balanced` đúng với mọi bộ ba đạt (một con trên cây, một con bay, một con trên mặt đất).
> Nhãn nhóm "On the ground" · "Trên mặt đất" trùng nhãn ô Học (một ý một nhãn). Nhóm "Climbs trees" theo bảng Chơi chung; ô Học "Up in the trees" gồm cả con leo trèo lẫn chim.
> Sửa 16/11 (tester C1, n4): chữ VI "dưới mặt đất" đổi thành "trên mặt đất" ở nhãn, lời nhắn; lời nhắn mở đầu VI theo sát EN ("nhìn lên … xuống mặt đất"); lệnh và nhãn nhóm `limit` VI viết đủ "rừng mưa nhiệt đới" (lần nhắc đầu trên màn Chơi).

#### group tray_climb
label.en: Climbs trees
label.vi: Leo trèo trên cây
color: vang_hoe
role: required

#### group tray_fly
label.en: Flies
label.vi: Biết bay
color: cham
role: required

#### group tray_ground
label.en: On the ground
label.vi: Trên mặt đất
color: nau_dat
role: required

#### group tray_not
label.en: Not a rainforest animal
label.vi: Không sống ở rừng mưa nhiệt đới
color: do_son
role: limit

#### item tray_sloth
label.en: Sloth
label.vi: Con lười
group: tray_climb
image.brief: Dùng lại hình `explore_trees`. Từ khoá tìm ảnh (EN): Bradypus sloth
image.alt.en: A sloth hanging from a branch
image.alt.vi: Con lười treo trên cành cây

#### item tray_owl
label.en: Snowy owl
label.vi: Cú tuyết
group: tray_not
image.brief: Dùng lại hình `tray_owl` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Bubo scandiacus
image.alt.en: A snowy owl on the snow
image.alt.vi: Cú tuyết trên nền tuyết

#### item tray_hornbill
label.en: Hornbill
label.vi: Chim hồng hoàng
group: tray_fly
image.brief: [ảnh] Một con chim hồng hoàng (mỏ to màu vàng có cái mũ sừng phía trên, lông đen và trắng) đậu trên cành cây, nhìn ngang, thấy cả con và cái mỏ; ảnh ngang có khoảng trống quanh con chim (dùng ở khung vuông kệ Chơi, thẻ ba lựa chọn câu q1, thẻ thưởng); chim hoang dã: không lưới, chuồng, dây buộc, người, chữ. Từ khoá tìm ảnh (EN): Buceros bicornis; great hornbill tree
image.alt.en: A hornbill on a branch
image.alt.vi: Chim hồng hoàng đậu trên cành
> Hình gốc của cả chủ đề (bài 4, 8 dùng lại). Ảnh hồng hoàng hoang dã ít (khoảng năm ảnh qua luật, nhiều ảnh thấy lưới).
> [CẦN KIỂM] Chim hồng hoàng (Buceros bicornis) có ở rừng Việt Nam; mỏ có mũ sừng.

#### item tray_dart_frog
label.en: Poison dart frog
label.vi: Ếch phi tiêu độc
group: tray_ground
image.brief: Dùng lại hình `explore_ground`. Từ khoá tìm ảnh (EN): Dendrobates
image.alt.en: A tiny frog on fallen leaves
image.alt.vi: Con ếch nhỏ trên lá rụng

#### item tray_fox
label.en: Arctic fox
label.vi: Cáo Bắc Cực
group: tray_not
image.brief: Dùng lại hình `explore_fox` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Vulpes lagopus
image.alt.en: An Arctic fox in the snow
image.alt.vi: Cáo Bắc Cực trên tuyết

#### item tray_gibbon
label.en: Gibbon
label.vi: Con vượn
group: tray_climb
image.brief: [ảnh] Một con vượn đen má vàng (con đực lông đen má vàng nhạt, hoặc con cái lông vàng nâu) đu hoặc ngồi trên cành cây cao giữa tán lá, thấy cả con và rõ đôi tay rất dài; ảnh ngang có khoảng trống quanh con vật (dùng ở khung vuông kệ Chơi, thẻ ba lựa chọn câu q4, bài 4 câu w1); vượn hoang dã: không lưới, chuồng, dây thừng, sàn gỗ trại cứu hộ, người, chữ. Ưu tiên ảnh iNaturalist chụp ở Cát Tiên. Từ khoá tìm ảnh (EN): Nomascus gabriellae; yellow-cheeked gibbon
image.alt.en: A gibbon with long arms
image.alt.vi: Con vượn có đôi tay dài
> Hình gốc của cả chủ đề (bài 4 câu w1 dùng lại).
> **Lệch `_topic.md`:** `alt` đổi từ "A gibbon in a tree" · "Con vượn trên cây" thành "A gibbon with long arms" · "Con vượn có đôi tay dài". Lý do: ảnh này là đáp án câu q4 bài này ("Which animal needs tall trees to live?" · "Con nào cần cây cao để sống?") và câu w1 bài 4 ("Which one lives high in the trees?" · "Con nào sống trên cây cao?"); `alt` cũ có chữ "tree" · "trên cây" của câu hỏi (Lỗi hay gặp số mười hai). Phiên chính sửa bảng `alt` ở `_topic.md` và chỗ dùng ở bài 4. Brief vì vậy đòi ảnh thấy rõ đôi tay dài.
> [CẦN KIỂM] Vượn đen má vàng sống ở rừng Cát Tiên; con đực lông đen, con cái lông vàng.

#### item tray_emperor
label.en: Emperor penguin
label.vi: Chim cánh cụt hoàng đế
group: tray_not
image.brief: Dùng lại hình `tray_emperor` ở bài `noi-song-tren-trai-dat/nam-cuc`. Từ khoá tìm ảnh (EN): Aptenodytes forsteri
image.alt.en: An emperor penguin on the ice
image.alt.vi: Chim cánh cụt hoàng đế trên băng

#### item tray_macaw
label.en: Macaw
label.vi: Vẹt đuôi dài
group: tray_fly
image.brief: [ảnh] Một con vẹt đuôi dài đỏ (lông đỏ tươi, cánh có vàng và xanh dương, đuôi rất dài) đậu trên cành hoặc đang bay giữa cây xanh, thấy cả con và cái đuôi dài; ảnh ngang có khoảng trống quanh con chim (khung vuông kệ Chơi); chim hoang dã: không lồng, cầu đậu, dây xích chân, tay người, chữ. Từ khoá tìm ảnh (EN): Ara macao; scarlet macaw wild
image.alt.en: A red macaw
image.alt.vi: Vẹt đuôi dài màu đỏ
> Hình gốc (chỉ dùng ở kệ Chơi bài này).
> [CẦN KIỂM] Vẹt đuôi dài đỏ sống ở rừng mưa Trung Mỹ và A-ma-dôn.

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1, q4, q5; ba lựa chọn), `true_false` (q2 Sai, q3 Đúng, q6 Sai). Không `order_sequence`: con vật rừng mưa đi lại nhiều tầng, dễ có hai thứ tự đúng.
> Hình câu `single_choice` là hàng rào tre trung tính (app Explorer ẩn hình câu hỏi khi mọi lựa chọn có hình). Câu nào cũng tự đủ nghĩa khi chỉ nghe.
> Không câu nào ghép con vật với rừng mưa theo kiểu quiz Oak Science (đười ươi, kỳ nhông); không dùng bộ ba ếch phi tiêu độc, khỉ rú, con lười của quiz Oak Địa lý. Lựa chọn sai là con vật, nơi sống của bài 1, bài 2; không dùng `tray_forest` làm lựa chọn "không phải rừng mưa".

### q1
id: 1ede20dc-2ddf-4c66-bd03-4daec94e0ce1
format: single_choice
version: 1
dok: 1
prompt.en: Which animal lives in the rainforest?
prompt.vi: Con nào sống ở rừng mưa nhiệt đới?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of a hot place with tall trees.
hint.vi: Em nghĩ tới một nơi nóng có nhiều cây cao nhé.
explanation_correct.en: Yes! A hornbill flies between tall trees.
explanation_correct.vi: Đúng rồi! Chim hồng hoàng bay giữa những cây cao.
explanation_wrong.en: The answer is the hornbill. It lives in treetops.
explanation_wrong.vi: Đáp án là chim hồng hoàng. Chim hồng hoàng sống trên ngọn cây.
> Hai lựa chọn sai là con vật nơi lạnh bé đã học ở bài 1, bài 2; đáp án là ảnh bé vừa gặp ở kệ Chơi (và nghe tên ở ví dụ ô Việt Nam), không phải ảnh mới duy nhất.

#### option q1_walrus
correct: false
feedback.en: A walrus rests on cold sea ice.
feedback.vi: Hải mã nằm nghỉ trên băng biển lạnh giá.
label.en: walrus
label.vi: hải mã
image.brief: Dùng lại hình `explore_walrus` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): walrus ice Odobenus
image.alt.en: A walrus resting on the ice
image.alt.vi: Hải mã nằm nghỉ trên băng

#### option q1_emperor
correct: false
feedback.en: An emperor penguin lives in the icy south.
feedback.vi: Chim cánh cụt hoàng đế sống ở phía nam băng giá.
label.en: emperor penguin
label.vi: chim cánh cụt hoàng đế
image.brief: Dùng lại hình `tray_emperor` ở bài `noi-song-tren-trai-dat/nam-cuc`. Từ khoá tìm ảnh (EN): Aptenodytes forsteri
image.alt.en: An emperor penguin on the ice
image.alt.vi: Chim cánh cụt hoàng đế trên băng

#### option q1_hornbill
correct: true
label.en: hornbill
label.vi: chim hồng hoàng
image.brief: Dùng lại hình `tray_hornbill`. Từ khoá tìm ảnh (EN): Buceros bicornis
image.alt.en: A hornbill on a branch
image.alt.vi: Chim hồng hoàng đậu trên cành

### q2
id: fa58f06b-7d50-417d-8ddd-b37d9ba1af46
format: true_false
version: 1
dok: 1
prompt.en: A rainforest is very dry.
prompt.vi: Rừng mưa nhiệt đới rất khô.
image.brief: Dùng lại hình `explore_amazon`. Từ khoá tìm ảnh (EN): Amazon rainforest aerial
image.alt.en: A huge forest with a river
image.alt.vi: Khu rừng rộng lớn có dòng sông
answer: false
hint.en: Look at how green the trees are.
hint.vi: Em nhìn xem cây cối xanh tốt thế nào nhé.
explanation_correct.en: A rainforest is wet, with lots of rain.
explanation_correct.vi: Rừng mưa nhiệt đới ẩm ướt và có rất nhiều mưa.
explanation_wrong.en: This is false. It rains a lot there.
explanation_wrong.vi: Câu này sai. Ở đó trời mưa rất nhiều.
feedback_true.en: A big river flows through this forest.
feedback_true.vi: Một dòng sông lớn chảy qua khu rừng này.
> DOK 1: nhớ lại ý chính một (ô Việt Nam ví dụ một "hot, rainy and very green"). Câu khẳng định, không chữ phủ định; "dry" bé đã học ở *Sinh vật sống ở đâu?*.
> Hình là rừng A-ma-dôn: ảnh nghiêng về phía đáp án đúng (xanh, có sông), không làm bằng chứng cho phía sai. Gợi ý trỏ tới màu cây trong ảnh; `feedback_true` trỏ tới dòng sông; `explanation_wrong` nói mưa: ba câu không lặp ý.
> `explanation_correct` đứng một mình được cho thẻ "Ý sai → Ý đúng": "A rainforest is very dry." → "A rainforest is wet, with lots of rain.".

### q3
id: f2a510cf-e745-46e2-bc92-ecb3a8938f5b
format: true_false
version: 1
dok: 1
prompt.en: Vietnam has rainforests, too.
prompt.vi: Việt Nam cũng có rừng mưa nhiệt đới.
image.brief: Dùng lại hình `explore_vietnam`. Từ khoá tìm ảnh (EN): Cat Tien forest
image.alt.en: Tall trees in a thick forest
image.alt.vi: Cây cao trong khu rừng rậm
answer: true
hint.en: Look at the tall trees and thick leaves.
hint.vi: Em nhìn những cây cao và tán lá dày nhé.
explanation_correct.en: Yes! Our rainforests are hot and rainy, too.
explanation_correct.vi: Đúng rồi! Rừng mưa nước mình cũng nóng và mưa nhiều.
explanation_wrong.en: This is true. Vietnam has hot, rainy forests.
explanation_wrong.vi: Câu này đúng. Việt Nam có những khu rừng nóng và mưa nhiều.
feedback_false.en: Doucs and gibbons live in Vietnam's rainforests.
feedback_false.vi: Voọc và vượn sống trong rừng mưa ở Việt Nam.
> DOK 1: nhớ lại câu chính ô "Rainforest in Vietnam". Hình là chính ảnh ô đó; `alt` không có tên nơi, ảnh không có chữ.
> Gợi ý trỏ tới điều nhìn thấy trong ảnh (cây cao, lá dày như rừng mưa), không trỏ tới ô Học có câu chính là phán quyết.
> [CẦN KIỂM] Việt Nam có rừng mưa nhiệt đới (Cúc Phương, Cát Tiên).

### q4
id: add40a96-55e2-40f5-a107-52be121d6db6
format: single_choice
version: 1
dok: 2
prompt.en: Which animal needs tall trees to live?
prompt.vi: Con nào cần cây cao để sống?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look at each animal's arms and legs.
hint.vi: Em nhìn tay chân của từng con nhé.
explanation_correct.en: Yes! A gibbon swings from branch to branch.
explanation_correct.vi: Đúng rồi! Vượn đu từ cành này sang cành khác.
explanation_wrong.en: The answer is the gibbon. It lives high up.
explanation_wrong.vi: Đáp án là con vượn. Vượn sống trên cây cao.
> DOK 2: ô Học nói con lười sống "high in the trees" và "gibbons ... live up here, too"; câu hỏi đổi góc nhìn thành "cần cây cao để sống". Bé áp ý chính ba vào ba con vật, so tay chân (tay dài để đu cành, chân chạy trên tuyết, chân chèo) để chọn con không sống được nếu thiếu cây. Cáo Bắc Cực, hải cẩu bé đã học ở bài 1, bài 2.
> `alt` của đáp án đã đổi để không có chữ "tree" của câu hỏi (ghi chú dưới món `tray_gibbon`).
> [CẦN KIỂM] Vượn đu từ cành này sang cành khác bằng đôi tay dài, sống gần như suốt đời trên cây.

#### option q4_gibbon
correct: true
label.en: gibbon
label.vi: con vượn
image.brief: Dùng lại hình `tray_gibbon`. Từ khoá tìm ảnh (EN): Nomascus gabriellae
image.alt.en: A gibbon with long arms
image.alt.vi: Con vượn có đôi tay dài

#### option q4_fox
correct: false
feedback.en: An Arctic fox walks and sleeps on snow.
feedback.vi: Cáo Bắc Cực đi lại và ngủ trên tuyết.
label.en: Arctic fox
label.vi: cáo Bắc Cực
image.brief: Dùng lại hình `explore_fox` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Vulpes lagopus
image.alt.en: An Arctic fox in the snow
image.alt.vi: Cáo Bắc Cực trên tuyết

#### option q4_seal
correct: false
feedback.en: A seal swims and rests on the ice.
feedback.vi: Hải cẩu bơi lội và nằm nghỉ trên băng.
label.en: seal
label.vi: hải cẩu
image.brief: Dùng lại hình `explore_seal` ở bài `noi-song-tren-trai-dat/nam-cuc`. Từ khoá tìm ảnh (EN): Weddell seal Antarctica
image.alt.en: A seal resting on the ice
image.alt.vi: Hải cẩu nằm nghỉ trên băng

### q5
id: 02e06e42-7c2c-452f-90eb-73f21d5f49c9
format: single_choice
version: 1
dok: 2
prompt.en: Which place is hot and rainy?
prompt.vi: Nơi nào nóng và mưa nhiều?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think about where plants grow green and tall.
hint.vi: Em nghĩ xem cây cối mọc cao, xanh tốt ở đâu nhé.
explanation_correct.en: Yes! Rain helps the trees grow very tall.
explanation_correct.vi: Đúng rồi! Mưa nhiều giúp cây mọc rất cao.
explanation_wrong.en: The answer is the rainforest. It is hot and wet.
explanation_wrong.vi: Đáp án là rừng mưa nhiệt đới. Ở đó nóng và ẩm ướt.
> DOK 2: so ba nơi sống của bài 1, 2, 3 theo nóng, lạnh, ướt (mở đường cho bài 8). Ba cảnh khác nhau rõ bằng mắt: băng biển không con vật; đất phủ băng có đàn chim cánh cụt và núi; rừng nhiều tầng cây. Hai ảnh lạnh bé đã gặp ở bài 1, bài 2.
> Gợi ý là cách nghĩ (cây cần nắng ấm và nước), không trỏ tới ảnh nào. `alt` của đáp án không có chữ "hot", "rainy".
> [CẦN KIỂM] Nóng và mưa nhiều giúp cây rừng mưa mọc rất cao.

#### option q5_ice
correct: false
feedback.en: Sea ice floats on a very cold sea.
feedback.vi: Băng biển nổi trên mặt biển rất lạnh.
label.en: sea ice
label.vi: băng biển
image.brief: Dùng lại hình `explore_ice` ở bài `noi-song-tren-trai-dat/bac-cuc`. Từ khoá tìm ảnh (EN): Arctic sea ice
image.alt.en: Sea ice on a cold sea
image.alt.vi: Băng nổi trên biển lạnh

#### option q5_rainforest
correct: true
label.en: rainforest
label.vi: rừng mưa nhiệt đới
image.brief: Dùng lại hình `explore_vietnam`. Từ khoá tìm ảnh (EN): Cat Tien forest
image.alt.en: Tall trees in a thick forest
image.alt.vi: Cây cao trong khu rừng rậm

#### option q5_icy_land
correct: false
feedback.en: Penguins live in this cold, icy place.
feedback.vi: Chim cánh cụt sống ở nơi băng giá này.
label.en: icy land
label.vi: đất phủ băng
image.brief: Dùng lại hình `tray_antarctica` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): penguins Antarctica rocks glacier
image.alt.en: Penguins on a cold, stony beach
image.alt.vi: Chim cánh cụt trên bãi đá lạnh
> Sửa 16/11 theo ảnh thật (designer): chim cánh cụt đứng trên bãi sỏi, sau lưng là băng vụn và núi tuyết. `alt` theo bảng "alt riêng" ở `_topic.md`; `feedback` cũ "Penguins stand on this cold, icy land." nói chim đứng trên băng, nay nói nơi này băng giá (thấy băng, núi tuyết trong ảnh). Nhãn "icy land" · "đất phủ băng" giữ, vì là tên ô Học bài 2 dùng cùng ảnh. Mục `crop` 5:2 riêng giữ núi tuyết, cắt bỏ du khách.

### q6
id: 07035dca-ec24-4ce7-8b33-1b481c547a9e
format: true_false
version: 1
dok: 2
misconception: forest_animals_on_ground
prompt.en: Every rainforest animal lives on the ground.
prompt.vi: Mọi con vật ở rừng mưa nhiệt đới đều sống trên mặt đất.
image.brief: Dùng lại hình `explore_vietnam`. Từ khoá tìm ảnh (EN): Cat Tien forest
image.alt.en: Tall trees in a thick forest
image.alt.vi: Cây cao trong khu rừng rậm
answer: false
hint.en: Remember the animals in today's game.
hint.vi: Em nhớ lại các con vật trong trò chơi hôm nay nhé.
explanation_correct.en: Many rainforest animals live high in the trees.
explanation_correct.vi: Nhiều con vật ở rừng mưa sống trên cây cao.
explanation_wrong.en: This is false. Sloths and gibbons live in trees.
explanation_wrong.vi: Câu này sai. Con lười và con vượn sống trên cây.
feedback_true.en: Hornbills and macaws fly over the treetops.
feedback_true.vi: Chim hồng hoàng và vẹt đuôi dài bay trên ngọn cây.
> Câu misconception (`forest_animals_on_ground`), bằng hình, DOK 2: bé còn nghĩ "con vật trong rừng đều đi trên mặt đất" (như hổ, nai bé hay thấy trong truyện) sẽ chạm gật đầu. Bé áp điều đã học (ô "Up in the trees", ba nhóm ở kệ Chơi) để bác câu nói. Câu chỉ kiểm một việc: con vật rừng mưa có sống trên cây không. "Every" là câu khẳng định, không chữ phủ định.
> Hình là rừng nhiều tầng cây, không có con vật nổi bật trên mặt đất (không dùng ảnh ếch trên lá rụng), nên không đẩy bé về phía misconception.
> Gợi ý trỏ tới trò chơi bé vừa chơi (bằng chứng: con leo trèo, con biết bay), không trỏ tới ô "Up in the trees" có câu chính là phán quyết. `feedback_true` (chim) và `explanation_wrong` (con leo trèo) nói hai nhóm khác nhau, không lặp ý.
> `explanation_correct` đứng một mình được cho thẻ "Ý sai → Ý đúng" ở bước Tổng kết: "Every rainforest animal lives on the ground." → "Many rainforest animals live high in the trees.".
> Sửa 16/11 (tester C1, n4): `prompt.vi` cũ "Con vật nào ở rừng mưa cũng sống dưới mặt đất." nghĩa là sống dưới lòng đất, khác hẳn EN. Câu mới "Mọi con vật ở rừng mưa nhiệt đới đều sống trên mặt đất." theo sát EN ("every" là "mọi … đều", câu kể, không nghe thành câu hỏi "con vật nào"); viết đủ "rừng mưa nhiệt đới" vì là lần nhắc đầu trên màn, lời giải thích sau đó dùng "rừng mưa".

## Từ vựng

### rainforest
id: 3effba92-84e8-4918-9711-56675577b00d
tier: core
term.en: rainforest
term.vi: rừng mưa nhiệt đới
example.en: It rains a lot in a rainforest.
example.vi: Ở rừng mưa nhiệt đới, trời mưa rất nhiều.
image.brief: Dùng lại hình `explore_vietnam`. Từ khoá tìm ảnh (EN): Cat Tien forest
image.alt.en: Tall trees in a thick forest
image.alt.vi: Cây cao trong khu rừng rậm

### treetop
id: 9763caaa-4963-40ef-8a2b-2c52859d36af
tier: core
term.en: treetop
term.vi: ngọn cây
example.en: Bright birds sit in the treetops.
example.vi: Những chú chim sặc sỡ đậu trên ngọn cây.
image.brief: Dùng lại hình `explore_amazon`. Từ khoá tìm ảnh (EN): Amazon rainforest aerial
image.alt.en: A huge forest with a river
image.alt.vi: Khu rừng rộng lớn có dòng sông
> Ảnh A-ma-dôn chụp từ trên cao thấy rõ tán, ngọn cây. Bảng Hình dùng chung ở `_topic.md` chưa ghi chỗ dùng này (`explore_amazon` thêm "từ `treetop`"); phiên chính thêm vào bảng. Hai từ `core` dùng hai ảnh khác nhau.

### sloth
id: 5cb5086e-2edd-4f62-9d13-c89f661e22f8
tier: extra
term.en: sloth
term.vi: con lười
example.en: A sloth holds on with long claws.
example.vi: Con lười bám cành bằng móng vuốt dài.
image.brief: Dùng lại hình `explore_trees`. Từ khoá tìm ảnh (EN): Bradypus sloth
image.alt.en: A sloth hanging from a branch
image.alt.vi: Con lười treo trên cành cây
> [CẦN KIỂM] Con lười bám cành bằng móng vuốt dài, cong.

### hornbill
id: e0233aab-5e7f-43b4-a2ab-feeaa068f86b
tier: extra
term.en: hornbill
term.vi: chim hồng hoàng
example.en: A hornbill eats fruit, like figs.
example.vi: Chim hồng hoàng ăn quả, như quả sung.
image.brief: Dùng lại hình `tray_hornbill`. Từ khoá tìm ảnh (EN): Buceros bicornis
image.alt.en: A hornbill on a branch
image.alt.vi: Chim hồng hoàng đậu trên cành
> [CẦN KIỂM] Chim hồng hoàng ăn chủ yếu quả, nhiều nhất là quả các loài sung, vả.

### gibbon
id: 43956dd0-a40a-4710-8f81-dac63431d927
tier: extra
term.en: gibbon
term.vi: con vượn
example.en: A gibbon calls loudly in the morning.
example.vi: Con vượn cất tiếng gọi vang vào buổi sáng.
image.brief: Dùng lại hình `tray_gibbon`. Từ khoá tìm ảnh (EN): Nomascus gabriellae
image.alt.en: A gibbon with long arms
image.alt.vi: Con vượn có đôi tay dài
> [CẦN KIỂM] Vượn đen má vàng cất tiếng gọi vang (hót đôi) vào buổi sáng sớm.

## Thưởng

### hornbill_card
id: 01b0cb2a-5073-4132-a99e-974c86091612
set: animals
rarity: rare
name.en: Great hornbill
name.vi: Chim hồng hoàng
tag.en: Lives in Vietnam's forests
tag.vi: Sống trong rừng Việt Nam
fact.en: It has a big helmet on its beak.
fact.vi: Chim hồng hoàng có một cái mũ to trên mỏ.
image.brief: Dùng lại hình `tray_hornbill`. Từ khoá tìm ảnh (EN): Buceros bicornis
image.alt.en: A hornbill on a branch
image.alt.vi: Chim hồng hoàng đậu trên cành
> [CẦN KIỂM] Chim hồng hoàng có ở rừng Việt Nam; "cái mũ" là mũ sừng (casque) trên mỏ.
> Bộ `set: animals` đã có (chủ đề số một); chim hồng hoàng chưa có thẻ. Thẻ không nói "quý hiếm", "bị săn bắt".

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật. Không bản đồ, không quả địa cầu, không ảnh Trái Đất từ vũ trụ. Con vật hoang dã: không lồng, lưới, chuồng, bể kính, dây buộc, tay người, sàn gỗ trại cứu hộ, chữ. Không cảnh săn mồi. Ảnh rừng không có khoảng bị chặt, đốt, đường sá, khói (ranh giới với Discoverer #16).
- **Ảnh mới (bảy):** rừng mưa Việt Nam nhiều tầng cây, chụp từ trong rừng (`explore_vietnam`); rừng A-ma-dôn từ trên cao có sông (`explore_amazon`); con lười treo trên cành (`explore_trees`); ếch phi tiêu độc trên lá rụng (`explore_ground`); vượn đen má vàng thấy rõ đôi tay dài (`tray_gibbon`); chim hồng hoàng đậu trên cành (`tray_hornbill`); vẹt đuôi dài đỏ (`tray_macaw`). Bảy ảnh là hình gốc của cả chủ đề (bảng Hình dùng chung ở `_topic.md`): giữ đúng key.
- **Ảnh dùng lại:**
  - Bài 1 chủ đề này: `explore_walrus` (q1), `explore_fox` (kệ Chơi, q4), `tray_owl` (kệ Chơi), `explore_ice` (q5).
  - Bài 2 chủ đề này: `explore_huddle` (w1), `explore_seal` (w1, q4), `tray_emperor` (kệ Chơi, q1).
  - *Bề mặt Trái Đất*: `tray_antarctica` (q5; mục `crop` 5:2 riêng giữ núi tuyết, cắt bỏ du khách; `alt` riêng theo ảnh thật, 16/11), `tray_forest` (w2).
  - *Gọi tên và nhóm động vật*: `w1` hàng rào tre (hình câu w1, q1, q4, q5).
- **`alt` đổi so với bảng chung:** `tray_gibbon` dùng "A gibbon with long arms" · "Con vượn có đôi tay dài" (ghi chú dưới món `tray_gibbon`); `explore_huddle` theo bản đổi ở bài 2. `explore_amazon` thêm chỗ dùng ở từ `treetop`.
- **Một ảnh, nhiều khung:** `explore_vietnam` dùng ở ô Học, thẻ ba lựa chọn rất ngang 5:2 (q5), hình câu `true_false` (q3, q6) và từ; `tray_gibbon`, `tray_hornbill` ở khung vuông kệ Chơi và thẻ 5:2 (q4, q1); `explore_trees` ở ô Học, khung vuông kệ Chơi và thẻ lựa chọn của bài 4, 6, 8. Chọn ảnh ngang có khoảng trống quanh con vật; làm mục riêng có `crop` riêng cho từng khung.
- **Ảnh khó:**
  - rừng mưa Việt Nam: nhiều ảnh Commons là BY-SA; tìm `Cuc Phuong` (khoảng ba mươi mốt ảnh), `Cat Tien` (khoảng mười lăm); trang gốc phải ghi đúng nơi, không thì bỏ tên nơi. Ảnh không được có con vật nổi bật trên mặt đất (hình câu q6) và phải khác hẳn ảnh `tray_forest` chụp từ trên cao;
  - vượn đen má vàng: khoảng chín ảnh, nhiều ảnh ở trại cứu hộ hay sở thú; cần thấy rõ đôi tay dài (vì `alt`);
  - chim hồng hoàng: khoảng năm ảnh, nhiều ảnh thấy lưới chuồng;
  - ếch phi tiêu độc: tránh ảnh bể nuôi (nền rêu nhân tạo, kính phản chiếu);
  - con lười: tránh ảnh người bế, ảnh ở trại cứu hộ;
  - rừng A-ma-dôn: tránh ảnh có khoảng rừng bị phá, khói cháy.
- **Màu:** Học: rừng mưa Việt Nam `gi_dong`, A-ma-dôn `cham`, trên cây cao `vang_hoe`, trên mặt đất `nau_dat`. Chơi: leo trèo `vang_hoe`, biết bay `cham`, trên mặt đất `nau_dat`, không sống ở rừng mưa `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (rainforest, treetop). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, tám món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Đúng). Quiz `single_choice` (q1, q4, q5; ba lựa chọn), `true_false` (q2 Sai, q3 Đúng, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`forest_animals_on_ground`). Không có `labels` ở câu `true_false`.
- **Vị trí đáp án:** app xáo lựa chọn (SK-047). Thứ tự trong file theo bảng ở `_topic.md`: w1 đáp án ở chỗ hai, q1 chỗ ba, q4 chỗ một, q5 chỗ hai.
- **Màn Chơi, ví dụ để kiểm:** Con lười, Chim hồng hoàng, Ếch phi tiêu độc → `balanced`; Con vượn, Vẹt đuôi dài, Cáo Bắc Cực → `has_limited`; Con lười, Con vượn, Chim hồng hoàng → `missing.tray_ground`; Cú tuyết, Con lười, Ếch phi tiêu độc → `has_limited`.
- **Key:** nhóm Chơi là `tray_climb`, `tray_fly`, `tray_ground`, `tray_not`; món là `tray_sloth`, `tray_gibbon`, `tray_hornbill`, `tray_macaw`, `tray_dart_frog`, `tray_owl`, `tray_fox`, `tray_emperor` (không trùng key nhóm).
- **Khởi động trỏ sang bài khác:** w1 → `noi-song-tren-trai-dat/nam-cuc` (bài 2 phải có id trước: chạy `ids` cho `_topic.md`, bài 1, bài 2, rồi bài này); w2 → `sinh-vat-song-o-dau/noi-song-cua-con-vat` (đã có id).
- **Từ EN có thể ngoài Starters/Movers:** rainforest, treetop, Amazon, Vietnam, sloth, gibbon, hornbill, macaw, poison dart frog, douc, huddle, emperor penguin, walrus, seal, Arctic fox, snowy owl, claws, figs, branch, rainy. Nghe thử giọng EN đọc "hornbill", "gibbon", "macaw", "Amazon"; giọng VI đọc "A-ma-dôn", "ếch phi tiêu độc".
