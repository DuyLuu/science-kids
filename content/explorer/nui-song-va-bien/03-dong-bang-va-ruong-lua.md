---
id: 1d63067e-e932-4b35-b4fe-b9d608cc3315
topic: nui-song-va-bien
slug: dong-bang-va-ruong-lua
order: 3
stage: core
est_minutes: 6
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Plains and rice fields
vi: Đồng bằng và ruộng lúa
> Giữ đúng tên ở `content/syllabus.json` (key `new-mountains-rivers-and-seas`, bài số ba). `id` là `lesson_id` của danh mục.

## Mục tiêu
en: I can tell what a plain looks like.
vi: Em nhận ra được đồng bằng.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ngày 19/11/2026. Ticket SK-058. Mọi dòng `id:` khác để trống.
> SK-058 khuyến nghị 8 (nguyên tắc N1, N5): trọng tâm là **đồng bằng**, một địa hình tự nhiên; ruộng lúa chỉ là hình quen để bé nhận ra đồng bằng. Không dạy trồng, cấy, gặt lúa (Discoverer #11 bài 9). Không ruộng bậc thang ở bất kỳ chỗ nào (ruộng bậc thang nằm trên núi). Không phù sa, không vì sao có đồng bằng (Discoverer #9).

## Ý chính
1.en: A plain is wide, flat land.
1.vi: Đồng bằng là vùng đất rộng và bằng phẳng.
2.en: Plains are often near big rivers.
2.vi: Đồng bằng thường ở gần những con sông lớn.
3.en: Rice fields, villages and towns are on plains.
3.vi: Trên đồng bằng có ruộng lúa, làng xóm và phố xá.
> Từ cụ thể tới trừu tượng: hình dáng đồng bằng, rồi đồng bằng nằm cạnh gì (sông), rồi trên đồng bằng có gì (ruộng, làng, phố). Ý chính ba mang ý sửa `plain_is_one_field`.
> Ghép với ô Học (`KeyPointPictures.match`): ý 1 → Plain (bốn từ chung), ý 2 → Near rivers (năm), ý 3 → Villages and towns (ba: villag, town, plain; ô Rice fields cũng ba nhưng không hơn, máy chọn ô cùng thứ tự). Ô Rice fields không ghép. Lượt sửa 19/11 (tester n1): đổi chỗ hai ô cuối, Villages and towns lên thứ ba, để thẻ ôn ý chính ba có hình làng chứ không phải "một cánh đồng".
> [CẦN KIỂM] "Đồng bằng thường ở gần sông lớn": đúng với hai đồng bằng lớn của Việt Nam (sông Hồng, sông Mê Kông); có đồng bằng ven biển nhỏ ở miền Trung. Bài nói "often" · "thường", không nói vì sao.

## Khởi động

> Hai câu: w1 ôn bài trước (núi và đồi); w2 ôn *Thời tiết và các mùa* bài 4 (ruộng lúa xanh nhờ mưa), dùng đúng ảnh ruộng lúa bé sắp gặp lại ở ô Học.

### w1
id: 48e7d736-a631-44a2-8620-f380bb19f302
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: nui-song-va-bien/nui-va-doi
prompt.en: Which one is a hill?
prompt.vi: Hình nào là quả đồi?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look at the shape of each top.
hint.vi: Em nhìn hình dáng đỉnh của mỗi nơi nhé.
explanation_correct.en: Yes! A hill is easy to walk up.
explanation_correct.vi: Đúng rồi! Đi bộ lên đồi khá dễ.
explanation_wrong.en: The answer is the hill. It is low and round.
explanation_wrong.vi: Đáp án là quả đồi. Đồi thấp và tròn.
> Ôn ý chính hai bài 2. Khác câu q1 bài 2 ("Which one is a mountain?"): hỏi phía kia của cặp núi, đồi.

#### option w1_mountain
correct: false
feedback.en: This peak is tall and steep.
feedback.vi: Đỉnh núi này cao và dốc đứng.
label.en: mountain
label.vi: ngọn núi
image.brief: Dùng lại hình `tray_mountain` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): steep mountain peak clouds
image.alt.en: A tall, steep peak
image.alt.vi: Đỉnh cao, sườn dốc đứng

#### option w1_hill
correct: true
label.en: hill
label.vi: quả đồi
image.brief: Dùng lại hình `tray_hill` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): round green hill
image.alt.en: A low, round, green slope
image.alt.vi: Sườn đất thấp, tròn, xanh mướt

### w2
id: 2b1686b2-477e-4b02-b13a-fe41a2e825a6
format: true_false
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: thoi-tiet-va-cac-mua/mua-mua-va-mua-kho
prompt.en: Rain makes the rice fields dry.
prompt.vi: Mưa làm ruộng lúa khô cạn.
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh
answer: false
hint.en: Think what plants need to grow.
hint.vi: Em nghĩ xem cây cần gì để lớn nhé.
explanation_correct.en: Rain makes the rice fields green.
explanation_correct.vi: Mưa làm ruộng lúa xanh tốt.
explanation_wrong.en: This is false. Rain keeps the fields wet.
explanation_wrong.vi: Câu này sai. Mưa giữ cho ruộng có nước.
feedback_true.en: These rice plants look green and wet.
feedback_true.vi: Lúa ở đây xanh tốt, đẫm nước.
> Ôn câu chính ô Rice fields của #5 bài 4 ("Rain makes the rice fields green."), viết lại thành câu khẳng định đáp án Sai; `explanation_correct` là đúng câu đó, đứng một mình. Không dạy mùa mưa.

## Học

> Bốn ô, từ hình dáng đồng bằng (ảnh nhìn từ trên cao) tới những gì có trên đồng bằng.
> Chữ cần dạy trước khi hỏi: "easy to walk across" (q4) ở ô Plain; "big rivers" (q2) ở ô Near rivers; "rice needs flat, wet fields" (q3) ở ô Rice fields; "villages", "towns" (q6) ở ô Villages and towns.

### explore
id: b28a189d-2632-492b-91d4-5ba61b25fcb4
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_plain
label.en: Plain
label.vi: Đồng bằng
color: vang_hoe
sentence.en: A plain is wide, flat land.
sentence.vi: Đồng bằng là vùng đất rộng và bằng phẳng.
image.brief: [ảnh] Đồng bằng chụp từ flycam hay máy bay, nhìn chếch xuống: rất nhiều thửa ruộng xanh phẳng chia ô, vài con kênh hay một dòng sông nhỏ, vài cụm làng có mái nhà và cây xanh nằm giữa ruộng, đất phẳng trải tới chân trời; không núi gần, không đồi; không ruộng bậc thang; không ảnh vệ tinh, không thấy bờ biển; không người nhìn rõ, không chữ, không biển quảng cáo. Ưu tiên đồng bằng sông Cửu Long hay đồng bằng sông Hồng (`alt` không nêu tên nơi). Ảnh ngang có khoảng trống (khung vuông Học, kệ Chơi; thẻ ba lựa chọn 5:2 q1; thẻ hai lựa chọn 17:10 q4; khung 4:3 q5, q6; thẻ `order_sequence` vuông bài 6). Từ khoá tìm ảnh (EN): Mekong Delta fields aerial; Red River Delta aerial; flat farmland aerial Vietnam
image.alt.en: Fields stretching far away
image.alt.vi: Ruộng đồng trải dài tít tắp
examples.1.en: fields stretch far away
examples.1.vi: ruộng đồng trải dài tít tắp
examples.2.en: roads run long and straight
examples.2.vi: đường đi dài và thẳng
examples.3.en: easy to walk across
examples.3.vi: đi bộ qua rất dễ
> Hình gốc của cả chủ đề (q1, q4, q5, q6, từ `plain`, `wide`; bài 4 w1; bài 6 q4, w3; không vào kệ Chơi từ lượt sửa 19/11). Ảnh đã chọn (designer 19/11, lệch 3): đồng bằng trồng lúa nhìn từ flycam ở Bali, Indonesia (CC0), có đường thẳng, hàng dừa và nhà ở dải trên (tester c7; designer cắt lấy nửa phải để bỏ bờ thửa bậc nhẹ); không có ảnh đồng bằng Việt Nam nhìn từ trên cao hợp giấy phép. Chữ bé nghe không nói ảnh là Việt Nam; câu q6 `feedback_true` nói "houses stand among these fields". `alt` không có chữ "plain", "flat" · "đồng bằng", "bằng phẳng" vì câu q1, bài 6 w3 hỏi bằng các chữ đó.
> Ví dụ ba dạy trước câu q4.

#### group explore_near_rivers
label.en: Near rivers
label.vi: Gần sông
color: cham
sentence.en: Plains are often near big rivers.
sentence.vi: Đồng bằng thường ở gần những con sông lớn.
image.brief: Dùng lại hình `explore_water` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): winding river aerial fields
image.alt.en: Water winding through rice fields
image.alt.vi: Dải nước uốn lượn qua ruộng lúa
examples.1.en: big rivers bring water to fields
examples.1.vi: sông lớn đưa nước về ruộng
examples.2.en: boats carry rice and fruit
examples.2.vi: thuyền chở lúa gạo, hoa quả
examples.3.en: villages sit along the river
examples.3.vi: làng xóm nằm dọc bờ sông
> Không nói phù sa, không nói "sông làm ra đồng bằng" (Discoverer #9). Tên sông Hồng, sông Mê Kông để bài 4.

#### group explore_village
label.en: Villages and towns
label.vi: Làng và phố
color: nau_dat
sentence.en: Many villages and towns are on plains.
sentence.vi: Nhiều làng xóm và phố xá nằm trên đồng bằng.
image.brief: [ảnh] Một làng quê trên đồng bằng chụp từ xa hay từ flycam: mái nhà giữa luỹ tre, cây xanh, xung quanh là ruộng phẳng, có thể thấy một con đường làng; đất phẳng, không núi đồi gần; không người nhìn rõ, không biển hiệu, không chữ. Ảnh ngang có khoảng trống. Từ khoá tìm ảnh (EN): Vietnamese village rice fields; village bamboo rice paddies aerial; rural village Vietnam
image.alt.en: Houses among trees and fields
image.alt.vi: Nhà cửa giữa cây xanh và ruộng
examples.1.en: Hanoi lies on a plain
examples.1.vi: Hà Nội nằm trên đồng bằng
examples.2.en: roads link the villages
examples.2.vi: đường nối các làng với nhau
examples.3.en: many people live on plains
examples.3.vi: nhiều người sống ở đồng bằng
> Ảnh mới (kệ Chơi, từ `village`). Ô mang ý sửa `plain_is_one_field`.
> Ảnh đã chọn (designer 19/11, lệch 4): làng Hahoe (Hàn Quốc, CC0) nhìn từ trên cao, mái nhà giữa cây xanh, không thấy ruộng; ảnh làng Việt Nam hợp giấy phép đều có núi sau lưng. `alt` cũ "Houses among trees and fields" · "Nhà cửa giữa cây xanh và ruộng" → "Houses among the trees" · "Nhà cửa giữa cây xanh" (chung chung, không nói làng Việt Nam, không nói ruộng). Brief trên giữ làm mô tả lúc tìm; chữ bé nghe của ô không tả ảnh (ví dụ là lời chung), nên không đổi.
> Ảnh lượt 2 (designer 19/11, c6): làng ở Quảng Ngãi (Flickr, CC0), nhà mái tôn giữa luỹ tre, cây xanh, hàng dừa, ruộng lúa xanh phẳng phía trước, đã cắt bỏ dải núi mờ. `alt` trả lại "Houses among trees and fields" · "Nhà cửa giữa cây xanh và ruộng" (khớp ảnh). Câu ví dụ từ `village` đổi theo ảnh (không có cây đa).
> Ví dụ một là tên nơi chỉ ở lời, không gắn với ảnh (mục Pháp lý và tên nơi ở `_topic.md`). Nếu PM áp khuyến nghị 6 cho mọi tên nơi thì đổi thành "big cities lie on plains, too" · "thành phố lớn cũng nằm trên đồng bằng".
> [CẦN KIỂM] Hà Nội nằm trên đồng bằng sông Hồng; đồng bằng là nơi đông dân.

#### group explore_rice
label.en: Rice fields
label.vi: Ruộng lúa
color: gi_dong
sentence.en: Many rice fields grow on the plains.
sentence.vi: Trên đồng bằng có nhiều ruộng lúa.
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh
examples.1.en: rice needs flat, wet fields
examples.1.vi: lúa cần ruộng phẳng, có nước
examples.2.en: egrets look for fish here
examples.2.vi: cò trắng tìm cá trên ruộng
examples.3.en: green, then golden
examples.3.vi: lúa xanh rồi chín vàng
> Ruộng lúa là hình quen (SK-058 khuyến nghị 8). Ví dụ ba chỉ là màu nhìn thấy, không dạy gặt.
> Lượt sửa 19/11 (tester C1): câu chính cũ "Green rice fields cover the plains." · "Ruộng lúa xanh phủ khắp đồng bằng." nói ruộng phủ kín đồng bằng, đá với câu q6 (`plain_is_one_field`). Ô chuyển xuống thứ tư (tester n1).
> [CẦN KIỂM] Lúa nước cần ruộng phẳng, giữ được nước; cò trắng kiếm cá trên ruộng.

### new_words
id: 56793e64-2761-4ebb-a4ae-4cf5a51dc591
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: plain, rice_field

## Chơi

> Bé chọn ba thứ có trên đồng bằng: ruộng lúa, một làng quê, một dòng sông. Đạt khi đủ ba nhóm và không chọn món bẫy.
> Món bẫy là đất cao (núi, đồi): cũng là đất, cũng xanh, nhưng không phải đồng bằng. Kệ nhắc lại ý bài 1, 2.
> Kệ sáu món, toàn ảnh chụp. Lượt sửa 19/11 (tester C2): bỏ món `tray_plain` (ảnh toàn cảnh đồng bằng có làng `explore_plain` từng nằm trong nhóm "Ruộng lúa", ngược câu q1, q6). Ảnh `explore_plain` không vào kệ nữa.

### tray
id: 20339029-511b-4be5-a039-b5e088062004
type: build_tray
version: 1
prompt.en: Find what is on a plain
prompt.vi: Tìm những gì có trên đồng bằng
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Pick rice fields, a village and a river.
messages.start.vi: Em chọn ruộng lúa, một làng quê và một dòng sông nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! A plain has all of these.
messages.balanced.vi: Tuyệt! Đồng bằng có đủ những thứ này.
messages.has_limited.en: That is high land, not a plain.
messages.has_limited.vi: Đó là đất cao, không phải đồng bằng.
messages.missing.tray_ricefields.en: You still need some rice fields.
messages.missing.tray_ricefields.vi: Em còn thiếu ruộng lúa.
messages.missing.tray_villages.en: You still need a village.
messages.missing.tray_villages.vi: Em còn thiếu một làng quê.
messages.missing.tray_rivers.en: You still need a river.
messages.missing.tray_rivers.vi: Em còn thiếu một dòng sông.
> Lời nhắn `has_limited` đúng với cả hai món bẫy (núi, đồi). Lời nhắn `balanced` nhắc ý chính ba.

#### group tray_ricefields
label.en: Rice fields
label.vi: Ruộng lúa
color: gi_dong
role: required

#### group tray_villages
label.en: Villages
label.vi: Làng xóm
color: nau_dat
role: required

#### group tray_rivers
label.en: Rivers
label.vi: Sông
color: cham
role: required

#### group tray_highland
label.en: Not on a plain
label.vi: Không ở đồng bằng
color: do_son
role: limit
> Lượt sửa 19/11 (tester n10): nhãn cũ "High land" · "Đất cao" là nhóm bắt buộc ở bài 1, 6 mà ở đây là nhóm bẫy; đổi nhãn để một nhãn không lúc đúng lúc sai. Key nhóm giữ.

#### item tray_fields
label.en: Rice field
label.vi: Ruộng lúa
group: tray_ricefields
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh

#### item tray_young_rice
label.en: Young rice
label.vi: Lúa non
group: tray_ricefields
image.brief: Dùng lại hình `tray_rice` ở bài `sinh-vat-song-o-dau/noi-song-cua-cay`. Từ khoá tìm ảnh (EN): young rice plants flooded paddy
image.alt.en: Young rice in a wet field
image.alt.vi: Lúa non trên ruộng nước

#### item tray_village
label.en: Village
label.vi: Làng quê
group: tray_villages
image.brief: Dùng lại hình `explore_village`. Từ khoá tìm ảnh (EN): Vietnamese village rice fields
image.alt.en: Houses among trees and fields
image.alt.vi: Nhà cửa giữa cây xanh và ruộng

#### item tray_river
label.en: River
label.vi: Dòng sông
group: tray_rivers
image.brief: Dùng lại hình `explore_river` ở bài `nui-song-va-bien/song-va-ho`. Từ khoá tìm ảnh (EN): wide river ripples
image.alt.en: A wide river with ripples
image.alt.vi: Dòng sông rộng gợn sóng
> Lượt 4 (designer 19/11): ảnh Tràng An có ruộng lúa và núi đá, nước đôi với nhóm Ruộng lúa và nhóm bẫy; món nay dùng sông Lô. Nhãn giữ.

#### item tray_mountain
label.en: Mountain
label.vi: Ngọn núi
group: tray_highland
image.brief: Dùng lại hình `tray_mountain` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): steep mountain peak clouds
image.alt.en: A tall, steep peak
image.alt.vi: Đỉnh cao, sườn dốc đứng

#### item tray_hill
label.en: Hill
label.vi: Quả đồi
group: tray_highland
image.brief: Dùng lại hình `tray_grass_hills` ở bài `nui-song-va-bien/nui-va-doi`. Từ khoá tìm ảnh (EN): rolling grassy hills
image.alt.en: Soft, grassy slopes
image.alt.vi: Những quả đồi cỏ thoai thoải
> Lượt 4 (designer 19/11): ảnh đồi chè `tray_hill` có luống chè giống ruộng, nước đôi với nhóm Ruộng lúa; món bẫy nay dùng đồi cỏ tròn của bài 2. Nhãn "Hill" · "Quả đồi" giữ.

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 1, 2, 2, 2. Hai format: `single_choice` (q1 ba lựa chọn, q4 hai lựa chọn), `true_false` (q2 Đúng, q3 Đúng, q5 Sai, q6 Sai).
> Hình câu `single_choice` là hàng rào tre trung tính. Mọi lựa chọn là ảnh chụp bé đã gặp (hôm nay hay ở bài 1).

### q1
id: a22d9ce9-36d4-49fa-9e4e-aa6187a759e2
format: single_choice
version: 1
dok: 1
prompt.en: Which picture shows a plain?
prompt.vi: Hình nào là đồng bằng?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Look for land as flat as a table.
hint.vi: Em tìm chỗ đất phẳng như mặt bàn nhé.
explanation_correct.en: Yes! You can see far across it.
explanation_correct.vi: Đúng rồi! Đứng ở đó, em nhìn được rất xa.
explanation_wrong.en: The answer is the plain. It is wide and flat.
explanation_wrong.vi: Đáp án là đồng bằng. Đồng bằng rộng và phẳng.
> DOK 1: nhận ra đồng bằng (ý chính một). Ba ảnh khác hẳn nhau: ruộng phẳng tới chân trời, đỉnh núi, biển. `alt` đáp án không có chữ "plain" · "đồng bằng".

#### option q1_mountain
correct: false
feedback.en: This peak is high and steep.
feedback.vi: Đỉnh núi này cao và dốc.
label.en: mountain
label.vi: ngọn núi
image.brief: Dùng lại hình `tray_mountain` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): steep mountain peak clouds
image.alt.en: A tall, steep peak
image.alt.vi: Đỉnh cao, sườn dốc đứng

#### option q1_plain
correct: true
label.en: plain
label.vi: đồng bằng
image.brief: Dùng lại hình `explore_plain`. Từ khoá tìm ảnh (EN): Mekong Delta fields aerial
image.alt.en: Fields stretching far away
image.alt.vi: Ruộng đồng trải dài tít tắp

#### option q1_sea
correct: false
feedback.en: This is water, as far as you see.
feedback.vi: Đây là nước, mênh mông tới chân trời.
label.en: sea
label.vi: biển
image.brief: Dùng lại hình `tray_sea` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): open sea horizon
image.alt.en: Wide blue water to the sky
image.alt.vi: Nước xanh mênh mông tới chân trời

### q2
id: 1ee407df-ad1e-4a22-be0c-5250a6448438
format: true_false
version: 1
dok: 1
prompt.en: Plains are often near big rivers.
prompt.vi: Đồng bằng thường ở gần những con sông lớn.
image.brief: Dùng lại hình `explore_water` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): winding river aerial fields
image.alt.en: Water winding through rice fields
image.alt.vi: Dải nước uốn lượn qua ruộng lúa
answer: true
hint.en: Look at the land beside the water.
hint.vi: Em nhìn phần đất hai bên bờ nước nhé.
explanation_correct.en: Yes! Rivers bring water to the fields.
explanation_correct.vi: Đúng rồi! Sông đưa nước về ruộng.
explanation_wrong.en: This is true. Big rivers flow through plains.
explanation_wrong.vi: Câu này đúng. Sông lớn chảy qua đồng bằng.
feedback_false.en: Flat rice fields line this river.
feedback_false.vi: Ruộng lúa phẳng nằm dọc dòng sông này.
> DOK 1: nhớ lại ý chính hai. Hình là đúng vật được nói tới (sông qua ruộng phẳng).

### q3
id: 875627a9-6bdb-469f-adda-613deed3b596
format: true_false
version: 1
dok: 1
prompt.en: Many rice fields grow on the plains.
prompt.vi: Trên đồng bằng có nhiều ruộng lúa.
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh
answer: true
hint.en: Think of green fields on flat land.
hint.vi: Em nghĩ tới những thửa ruộng xanh trên đất bằng nhé.
explanation_correct.en: Yes! Rice grows well in flat, wet fields.
explanation_correct.vi: Đúng rồi! Lúa lớn tốt trên ruộng phẳng, có nước.
explanation_wrong.en: This is true. Plains have many rice fields.
explanation_wrong.vi: Câu này đúng. Đồng bằng có nhiều ruộng lúa.
feedback_false.en: These green rice fields lie flat and wide.
feedback_false.vi: Ruộng lúa xanh này phẳng và rộng.
> DOK 1: nhớ lại câu chính ô Rice fields. Ruộng lúa ở đây là dấu hiệu nhận ra đồng bằng, không dạy trồng lúa.
> Lượt sửa 19/11 (tester C1): câu cũ "Green rice fields cover the plains." · "Ruộng lúa xanh phủ khắp đồng bằng." đá với câu q6; gợi ý cũ "Think of fields far and wide." cũng gợi ý "phủ kín", đổi theo.

### q4
id: a71e544f-d9ec-4c91-80c6-3da14ae657f1
format: single_choice
version: 1
dok: 2
prompt.en: Which land is easier to walk across?
prompt.vi: Đi bộ qua chỗ nào dễ hơn?
image.brief: Dùng lại hình `w1` ở bài `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha`. Từ khoá tìm ảnh (EN): village garden bamboo fence grass
image.alt.en: A bamboo fence in a garden
image.alt.vi: Hàng rào tre trước khu vườn
hint.en: Think of walking uphill and on flat ground.
hint.vi: Em nghĩ tới lúc leo dốc và lúc đi đường bằng nhé.
explanation_correct.en: Yes! Long, straight roads cross the plains.
explanation_correct.vi: Đúng rồi! Đồng bằng có những con đường dài và thẳng.
explanation_wrong.en: The answer is the plain. It is flat.
explanation_wrong.vi: Đáp án là đồng bằng. Đồng bằng phẳng.
> DOK 2: so hai loại đất bằng trải nghiệm quen (đi bộ, leo dốc). Hai ảnh bé đã gặp hôm nay (ô Plain, kệ Chơi). `alt` đáp án không có chữ của câu hỏi. Gợi ý nêu cả hai cách đi, không chỉ một bên.

#### option q4_plain
correct: true
label.en: plain
label.vi: đồng bằng
image.brief: Dùng lại hình `explore_plain`. Từ khoá tìm ảnh (EN): Mekong Delta fields aerial
image.alt.en: Fields stretching far away
image.alt.vi: Ruộng đồng trải dài tít tắp

#### option q4_mountain
correct: false
feedback.en: These steep slopes are hard to climb.
feedback.vi: Sườn núi dốc này rất khó leo.
label.en: mountain
label.vi: ngọn núi
image.brief: Dùng lại hình `tray_mountain` ở bài `nui-song-va-bien/dat-lien-va-bien`. Từ khoá tìm ảnh (EN): steep mountain peak clouds
image.alt.en: A tall, steep peak
image.alt.vi: Đỉnh cao, sườn dốc đứng

### q5
id: b30b7e03-e1ab-4dcf-8cee-08aedeb57237
format: true_false
version: 1
dok: 2
prompt.en: A plain is steeper than a hill.
prompt.vi: Đồng bằng dốc hơn quả đồi.
image.brief: Dùng lại hình `explore_plain`. Từ khoá tìm ảnh (EN): Mekong Delta fields aerial
image.alt.en: Fields stretching far away
image.alt.vi: Ruộng đồng trải dài tít tắp
answer: false
hint.en: Picture a ball rolling on each one.
hint.vi: Em tưởng tượng quả bóng lăn trên mỗi chỗ nhé.
explanation_correct.en: A hill slopes up. A plain stays flat.
explanation_correct.vi: Đồi thì dốc lên. Đồng bằng thì phẳng.
explanation_wrong.en: This is false. A plain is flat.
explanation_wrong.vi: Câu này sai. Đồng bằng bằng phẳng.
feedback_true.en: These fields lie flat, with no slope.
feedback_true.vi: Ruộng đồng ở đây phẳng, không dốc.
> DOK 2: so đồng bằng với đồi (bài 2). Câu khẳng định, đáp án Sai; `explanation_correct` đứng một mình. Gợi ý là cách nghĩ (quả bóng lăn xuống dốc, nằm yên trên chỗ phẳng), không nói đáp án.

### q6
id: e58ac1f9-5b26-4813-ba06-e25386368d67
format: true_false
version: 1
dok: 2
misconception: plain_is_one_field
prompt.en: A plain is just one big field.
prompt.vi: Đồng bằng chỉ là một cánh đồng to.
image.brief: Dùng lại hình `explore_plain`. Từ khoá tìm ảnh (EN): Mekong Delta fields aerial
image.alt.en: Fields stretching far away
image.alt.vi: Ruộng đồng trải dài tít tắp
answer: false
hint.en: Think what else you see on plains.
hint.vi: Em nghĩ xem trên đồng bằng còn có gì nữa nhé.
explanation_correct.en: A plain has fields, villages and towns.
explanation_correct.vi: Đồng bằng có ruộng đồng, có làng, có phố.
explanation_wrong.en: This is false. Plains have villages and towns, too.
explanation_wrong.vi: Câu này sai. Đồng bằng còn có làng và phố.
feedback_true.en: Look, houses stand among these fields.
feedback_true.vi: Nhìn kìa, giữa ruộng còn có nhà cửa.
> Câu misconception (`plain_is_one_field`), bằng hình, DOK 2: bé hiểu "đồng bằng" là "một cánh đồng" sẽ chạm gật đầu. Câu chỉ kiểm một việc: đồng bằng rộng, có nhiều thứ, không chỉ một cánh đồng. Hình đồng bằng nhìn từ trên cao (đúng vật được nói tới). `explanation_correct` là đúng câu `correction` ở `_topic.md`.
> Lượt sửa 19/11 theo ảnh thật (designer lệch 3: đồng bằng Bali, thấy đường thẳng và hàng dừa, không thấy cụm nhà): `feedback_true` cũ "Look, houses stand among these fields." · "Nhìn kìa, giữa ruộng còn có nhà cửa." → "Look, roads and trees cross these fields." · "Nhìn kìa, giữa ruộng còn có đường và cây.". Rà ảnh tester c7 (phiên chính chốt): ảnh có nhà rõ ở dải trên (designer cắt lấy nửa phải), nên trả lại câu cũ "Look, houses stand among these fields." · "Nhìn kìa, giữa ruộng còn có nhà cửa." (bằng chứng mạnh hơn cho `plain_is_one_field`).
> [CẦN KIỂM] Quan niệm `plain_is_one_field` (mục Misconceptions ở `_topic.md`).

## Từ vựng

### plain
id: 12a53371-acf2-450e-94e2-5052818d35b0
tier: core
term.en: plain
term.vi: đồng bằng
example.en: Rice grows well on the plain.
example.vi: Lúa mọc tốt trên đồng bằng.
image.brief: Dùng lại hình `explore_plain`. Từ khoá tìm ảnh (EN): Mekong Delta fields aerial
image.alt.en: Fields stretching far away
image.alt.vi: Ruộng đồng trải dài tít tắp
> [CẦN KIỂM] "plain" cũng là tính từ ("trơn", như "plain t-shirt"); với trẻ năm tới bảy tuổi chỉ dạy nghĩa danh từ.

### rice_field
id: 132b59ff-5383-41b1-8adc-2bda78dc209c
tier: core
term.en: rice field
term.vi: ruộng lúa
example.en: Egrets walk in the rice field.
example.vi: Cò trắng lội trong ruộng lúa.
image.brief: Dùng lại hình `q2_rice` ở bài `khung-long/trai-dat-rat-lau-ve-truoc`. Từ khoá tìm ảnh (EN): green rice paddy field Vietnam wide view
image.alt.en: A green rice field
image.alt.vi: Ruộng lúa xanh
> Khác từ `field` (`extra` ở *Chuỗi thức ăn* bài 3). [CẦN KIỂM] "rice field" hay "paddy".

### village
id: 0015aa3b-0cfd-455e-9214-8f3998daac3c
tier: extra
term.en: village
term.vi: làng
example.en: The village sits among the rice fields.
example.vi: Làng nằm giữa cánh đồng lúa.
image.brief: Dùng lại hình `explore_village`. Từ khoá tìm ảnh (EN): Vietnamese village rice fields
image.alt.en: Houses among trees and fields
image.alt.vi: Nhà cửa giữa cây xanh và ruộng

### wide
id: d955107b-3d86-4542-ab9f-3bfb1ea4a5b2
tier: extra
term.en: wide
term.vi: rộng
example.en: The plain is wide and green.
example.vi: Đồng bằng rộng và xanh.
image.brief: Dùng lại hình `explore_plain`. Từ khoá tìm ảnh (EN): Mekong Delta fields aerial
image.alt.en: Fields stretching far away
image.alt.vi: Ruộng đồng trải dài tít tắp

## Thưởng

### mekong_delta_card
id: 7de5ae51-06b5-4486-b68a-871bcfe320cf
set: landforms
rarity: common
name.en: Mekong Delta
name.vi: Đồng bằng sông Cửu Long
tag.en: Rivers everywhere
tag.vi: Sông ngòi chằng chịt
fact.en: Here, many people travel by boat.
fact.vi: Ở đây, nhiều người đi lại bằng thuyền.
image.brief: [ảnh] **Cần ảnh đúng vùng đồng bằng sông Cửu Long, giấy phép hợp lệ (CC0, PD, PDM, CC BY); thiếu thì bỏ tên** (thẻ dự phòng dưới đây). Một con kênh hay rạch nước nâu, hai bên là hàng dừa nước và vườn cây, một chiếc xuồng nhỏ đang đi; người trên xuồng ở xa, không nhận ra mặt; không chợ nổi đông người, không biển hiệu, không chữ, không số trên xuồng. Ảnh vuông hay ngang có khoảng trống (thẻ vuông). Từ khoá tìm ảnh (EN): Mekong Delta canal boat; Mekong Delta waterway; Ben Tre canal
image.alt.en: A small boat on a palm-lined canal
image.alt.vi: Chiếc xuồng nhỏ trên kênh rợp dừa nước
> Bộ `set: landforms`. Ảnh mới, chỉ dùng ở thẻ này.
> **Thẻ dự phòng khi thiếu ảnh đúng nơi:** key `canal_card`, `name` "Canal" · "Kênh rạch", `tag` "Roads made of water" · "Đường đi trên mặt nước", `fact` "Boats go along canals like roads." · "Thuyền đi trên kênh như đi trên đường.", ảnh kênh có xuồng chung, `alt` giữ.
> [CẦN KIỂM] Ở đồng bằng sông Cửu Long nhiều người đi lại bằng thuyền, xuồng trên kênh rạch. Nghe thử EN "Mekong Delta", VI "Cửu Long".

## Ghi chú cho hoạ sĩ

- **Loại hình:** toàn ảnh chụp thật (CC0, PD, PDM, CC BY có ghi công). Không hình vẽ.
- **Ảnh mới (ba):** `explore_plain` (đồng bằng nhìn từ trên cao, **thấy cụm làng giữa ruộng**, không núi đồi, không ruộng bậc thang, không bờ biển), `explore_village` (làng quê giữa ruộng), `mekong_delta_card` (kênh rạch có xuồng; **cần ảnh đúng nơi**). `explore_plain` là **hình gốc của cả chủ đề** (bài 4 w1; bài 6 q4, w3): giữ đúng key và `alt`.
- **Không ruộng bậc thang** ở bất kỳ ảnh nào (SK-058 khuyến nghị 8); ảnh đồi chè `tray_hill` dùng lại không được trông như ruộng bậc thang.
- **Dùng lại trong chủ đề (bài 1):** `explore_water` (ô Near rivers, kệ, q2), `tray_mountain`, `tray_hill`, `tray_sea`.
- **Dùng lại chủ đề khác:** `goi-ten-va-nhom-dong-vat/con-vat-nuoi-trong-nha` `w1` (hàng rào tre); Discoverer `khung-long/trai-dat-rat-lau-ve-truoc` `q2_rice` (ruộng lúa, ô Rice fields, kệ, w2, q3, từ `rice_field`; *Thời tiết và các mùa* bài 4 đã chép mục ảnh này thành `explore_fields`; trỏ thẳng mục gốc theo tester n5); `sinh-vat-song-o-dau/noi-song-cua-cay` `tray_rice` (kệ).
- **Màu:** Học (thứ tự ô từ 19/11): Plain `vang_hoe`, Near rivers `cham`, Villages and towns `nau_dat`, Rice fields `gi_dong`. Chơi: Ruộng lúa `gi_dong`, Làng xóm `nau_dat`, Sông `cham`, Không ở đồng bằng `do_son`.

## Ghi chú cho dev

- **Block và format:** Học `explore_groups` bốn nhóm + `word_list` (plain, rice_field). Chơi `build_tray` ba chỗ, ba nhóm `required`, một nhóm `limit`, sáu món. Khởi động `single_choice` (w1, hai lựa chọn), `true_false` (w2 Sai). Quiz `single_choice` (q1 ba lựa chọn, q4 hai lựa chọn), `true_false` (q2 Đúng, q3 Đúng, q5 Sai, q6 Sai). DOK 1, 1, 1, 2, 2, 2. Câu có `misconception`: q6 (`plain_is_one_field`). Không có `labels` ở câu `true_false`.
- **Màn Chơi, ví dụ để kiểm:** Ruộng lúa, Làng quê, Dòng sông → `balanced`; Lúa non, Làng quê, Dòng sông → `balanced`; Ruộng lúa, Lúa non, Dòng sông → `missing.tray_villages`; Ngọn núi, Làng quê, Dòng sông → `has_limited`; Ruộng lúa, Quả đồi, Dòng sông → `has_limited`.
- **Khởi động:** w1 → `nui-song-va-bien/nui-va-doi` (id có sẵn); w2 → `thoi-tiet-va-cac-mua/mua-mua-va-mua-kho` (đã có id).
- **Thẻ thưởng:** `mekong_delta_card` (dự phòng `canal_card`), bộ `landforms`.
- **Từ EN có thể ngoài Starters/Movers:** plain, plains, steeper, slopes, egrets, golden, villages, towns, banyan, canal, Mekong Delta, Hanoi. Nghe thử giọng EN đọc "Mekong Delta", "Hanoi", "egrets"; giọng VI đọc "tít tắp", "Cửu Long".
