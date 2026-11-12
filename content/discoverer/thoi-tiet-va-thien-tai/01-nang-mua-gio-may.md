---
id: 3d33c7af-b287-4dea-8174-3a0f8e2bf879
topic: thoi-tiet-va-thien-tai
slug: nang-mua-gio-may
order: 1
stage: opener
est_minutes: 8
sensitive: false
archived: false
ai_draft: true
---

## Tiêu đề
en: Kinds of weather
vi: Nắng, mưa, gió, mây
> Giữ đúng tên ở `syllabus-lessons.md` và `content/syllabus.json` (`new-weather`, bài số một).

## Mục tiêu
en: I can say what the weather is like today.
vi: Em nói được thời tiết hôm nay ra sao.
> Trạng thái: **nháp do AI soạn (content-editor), chưa duyệt.** Ticket SK-038, ngày 11/11/2026. Mọi dòng `id:` để trống; phiên chính chạy `ids` cho file này ngay sau `_topic.md`, vì bài hai, ba, bốn có câu Khởi động trỏ về bài này.
> Bài mở màn (`opener`): gọi tên thời tiết bé thấy hằng ngày, rồi đi từ thứ thấy được (nắng, mưa) tới thứ không thấy (gió là không khí) và thứ ẩn bên trong (mây là giọt nước). Câu q6 sửa `trees_make_wind`; câu q2 sửa `clouds_are_smoke` (không gắn key).

## Ý chính
1.en: Outside, the weather can be sunny, rainy, windy or cloudy.
1.vi: Ngoài trời, thời tiết có thể nắng, mưa, có gió hoặc nhiều mây.
2.en: Wind is air that is moving.
2.vi: Gió là không khí đang chuyển động.
3.en: Clouds are made of tiny drops of water.
3.vi: Mây gồm rất nhiều giọt nước nhỏ li ti.
> [CẦN KIỂM] Ý ba: mây gồm giọt nước rất nhỏ, mây ở rất cao có thể là tinh thể băng. Chữ cho trẻ chỉ nói giọt nước (`clouds_are_smoke` ở `_topic.md`).
> Ba ý đi từ thứ nhìn thấy (nắng, mưa, gió, mây), tới thứ không nhìn thấy nhưng cảm thấy được (gió là không khí), tới thứ ẩn bên trong (mây là giọt nước).

## Khởi động

> Hai câu, đúng bảng Khởi động ở `_topic.md`. Mọi câu có hình ở câu hỏi; mọi lựa chọn có hình.
> - w1 là kiến thức nền (trời mưa thì mặc áo mưa).
> - w2 ôn *Hô hấp* bài một (khoảng một tuần trước): hà hơi vào kính lạnh, kính bị mờ vì những giọt nước li ti. Giải thích khi đúng bắc cầu sang ô "Trời nhiều mây" (mây cũng là giọt nước li ti). Gợi ý đủ để bé chưa học *Hô hấp* vẫn làm được (bé đã thấy kính, gương mờ hơi nước).

### w1
id: 2fcc0c3c-f6b2-4c31-856e-d3ccc11137bc
format: single_choice
version: 1
dok: 1
recall_from.kind: prior_knowledge
recall_from.note.en: Prior knowledge: children dress for rain and sun.
recall_from.note.vi: Kiến thức nền: trẻ đã biết mặc áo mưa khi trời mưa, đội mũ khi trời nắng.
prompt.en: It is raining. What do you put on?
prompt.vi: Trời đang mưa. Em mặc gì khi ra ngoài?
image.brief: Dùng lại hình `q1_rain` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): heavy rain house garden
image.alt.en: Heavy rain falling
image.alt.vi: Mưa to đang rơi
hint.en: Think of walking to school in the rainy season.
hint.vi: Em nhớ lại những hôm đi học vào mùa mưa nhé.
explanation_correct.en: Yes! A raincoat keeps the rain off you.
explanation_correct.vi: Đúng rồi! Áo mưa giúp em không bị ướt.
explanation_wrong.en: The answer is the raincoat. It keeps you dry.
explanation_wrong.vi: Đáp án là áo mưa. Áo mưa giữ cho em khô ráo.
> Gợi ý chỉ một bối cảnh quen, không gọi tên vật. Ba lựa chọn là ba thứ mặc cho ba kiểu thời tiết (nắng, mưa, lạnh), nên hai lựa chọn sai vẫn hợp lý ở hôm khác. Hình câu hỏi là ảnh mưa của ô "Trời mưa" (cùng một vật, một ảnh), không có áo mưa.
> Đáp án ở chỗ thứ hai (bảng Vị trí đáp án đúng ở `_topic.md`).

#### option w1_hat
correct: false
label.en: sun hat
label.vi: mũ vải
image.brief: Dùng lại hình `q1_hat` ở bài `ho-hap/giu-phoi-khoe`. Từ khoá tìm ảnh (EN): cloth sun hat on table
image.alt.en: A sun hat on a table
image.alt.vi: Chiếc mũ vải trên bàn

#### option w1_raincoat
correct: true
label.en: raincoat
label.vi: áo mưa
image.brief: Dùng lại hình `q1_raincoat` ở bài `ho-hap/giu-phoi-khoe`. Từ khoá tìm ảnh (EN): folded plastic raincoat on table
image.alt.en: A raincoat on a table
image.alt.vi: Chiếc áo mưa trên bàn

#### option w1_scarf
correct: false
label.en: wool scarf
label.vi: khăn len
image.brief: [hình vẽ] Một chiếc khăn len màu trơn gấp gọn trên mặt bàn gỗ, vẽ chéo từ trên xuống; cùng nét, cùng kiểu bàn gỗ, cùng cỡ vật trong khung với hình mũ vải và áo mưa của bài Giữ phổi khoẻ chủ đề Hô hấp; không có người, không có nhãn hiệu, không có chữ, không có hoa văn thành chữ.
image.alt.en: A wool scarf on a table
image.alt.vi: Chiếc khăn len trên bàn
> Hai lựa chọn kia là hình tự vẽ của *Hô hấp*, nên khăn len cũng vẽ, cùng kiểu, để ba lựa chọn cùng một loại hình.

### w2
id: 7934b33e-f98a-4225-8ec7-6a036245f352
format: single_choice
version: 1
dok: 1
recall_from.kind: lesson
recall_from.lesson: ho-hap/vi-sao-ta-phai-tho
prompt.en: Mai breathes on a cold window. What does she see?
prompt.vi: Mai hà hơi vào cửa kính lạnh. Mai thấy gì?
image.brief: Dùng lại hình `q5` ở bài `ho-hap/vi-sao-ta-phai-tho`.
image.alt.en: Mai by a cold window
image.alt.vi: Mai đứng cạnh cửa kính lạnh
hint.en: Remember the Breathing out card in the breathing lessons.
hint.vi: Em nhớ lại ô Hơi thở ra trong các bài Hô hấp nhé.
explanation_correct.en: Yes! Tiny drops of water make the glass foggy.
explanation_correct.vi: Đúng rồi! Những giọt nước li ti làm mặt kính bị mờ.
explanation_wrong.en: The answer is foggy glass. Your breath is wet.
explanation_wrong.vi: Đáp án là kính bị mờ. Hơi thở của em có hơi nước.
> Câu ôn câu q5 bài một *Hô hấp* (cùng hình, cùng ba lựa chọn), đổi thứ tự lựa chọn: bên đó kính mờ ở chỗ thứ hai, bên này ở chỗ thứ ba. Giải thích khi đúng nói "những giọt nước li ti", đúng chữ ý chính ba của bài này, để bé gặp lại ở ô "Trời nhiều mây".
> [CẦN KIỂM] Lớp mờ trên kính lạnh là những giọt nước rất nhỏ (hơi nước trong hơi thở gặp lạnh). Câu không nói cơ chế ngưng tụ (để dành *Các thể của vật chất*).

#### option w2_dusty
correct: false
label.en: dusty glass
label.vi: kính bám bụi
image.brief: Dùng lại hình `q5_dusty` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): dusty dirty window glass
image.alt.en: A window with dusty glass
image.alt.vi: Cửa kính bám bụi

#### option w2_clear
correct: false
label.en: clear glass
label.vi: kính trong
image.brief: Dùng lại hình `q5_clear` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): clean window glass trees outside
image.alt.en: A window with clear glass
image.alt.vi: Cửa kính trong

#### option w2_foggy
correct: true
label.en: foggy glass
label.vi: kính bị mờ
image.brief: Dùng lại hình `q5_foggy` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): foggy window condensation
image.alt.en: A window with foggy glass
image.alt.vi: Cửa kính bị mờ

## Học

> Bốn ô, mỗi ô một kiểu thời tiết:
> - Trời nắng và Trời mưa (ý chính một), kèm dấu hiệu bé tự thấy được (bóng cây đậm, đồ ướt mau khô, vũng nước), chuẩn bị phần Chơi;
> - Trời có gió (ý chính hai): gió là không khí đang chuyển động, gió đẩy lá cây và cánh diều (chiều nguyên nhân, nền cho câu q6 `trees_make_wind`);
> - Trời nhiều mây (ý chính ba): mây là giọt nước li ti, giống lớp mờ trên kính lạnh của câu w2; gió đẩy mây trôi (gió có cả ở trên cao, nơi không có cây).
>
> Ô Học không nói "cây không làm ra gió": câu q6 để bé tự lập luận. Không dùng `sentence_card`: app 0.1.0 chỉ hiện `explore_groups` đầu tiên và `word_list` đầu tiên.

### explore
id: 636f9892-961a-44e0-a673-82676a1a1ef0
type: explore_groups
version: 1
prompt.en: Tap each picture
prompt.vi: Chạm từng hình
complete_when: all_seen

#### group explore_sunny
label.en: Sunny
label.vi: Trời nắng
color: vang_hoe
sentence.en: On sunny days, the sun warms the ground and air.
sentence.vi: Ngày nắng, Mặt Trời làm mặt đất và không khí ấm lên.
image.brief: Dùng lại hình `q3_sun` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): sun bright blue sky
image.alt.en: The bright sun in the sky
image.alt.vi: Mặt Trời chói sáng trên trời
examples.1.en: a bright, clear sky
examples.1.vi: bầu trời sáng và trong
examples.2.en: dark shadows under trees
examples.2.vi: bóng cây in đậm trên mặt đất
examples.3.en: wet things dry fast
examples.3.vi: đồ ướt mau khô
examples.4.en: the ground gets hot
examples.4.vi: mặt sân nóng lên
> [CẦN KIỂM] Mặt Trời sưởi ấm mặt đất, mặt đất làm không khí ấm lên (cách nói giản lược).
> Rà chữ tester 11/11 (n5): ví dụ bốn cũ "wear a hat outside" · "ra ngoài nhớ đội mũ" là lời khuyên, ba ví dụ kia là dấu hiệu; mũ vải lại là lựa chọn sai ở câu w1. Nay là một dấu hiệu nữa của nắng.
> Ví dụ hai và ba là hai dấu hiệu của nắng ở phần Chơi (bóng cây, thóc phơi) và nền cho câu q4 (hôm nào phơi áo mau khô).

#### group explore_rainy
label.en: Rainy
label.vi: Trời mưa
color: cham
sentence.en: Rain is water that falls from clouds.
sentence.vi: Mưa là nước rơi xuống từ những đám mây.
image.brief: Dùng lại hình `q1_rain` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): heavy rain house garden
image.alt.en: Heavy rain falling
image.alt.vi: Mưa to đang rơi
examples.1.en: light rain or heavy rain
examples.1.vi: mưa nhỏ hay mưa to
examples.2.en: puddles on the ground
examples.2.vi: vũng nước trên mặt đất
examples.3.en: wet leaves and roofs
examples.3.vi: lá cây, mái nhà ướt sũng
examples.4.en: lots of rain in the rainy season
examples.4.vi: mùa mưa thì mưa nhiều
> Ví dụ hai và ba là hai dấu hiệu của mưa ở phần Chơi (vũng nước, lá ướt). Ví dụ bốn mở đường cho bài ba (mùa mưa bão).

#### group explore_windy
label.en: Windy
label.vi: Trời có gió
color: gi_dong
sentence.en: Wind is air that is moving.
sentence.vi: Gió là không khí đang chuyển động.
image.brief: Dùng lại hình `w1` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): rice field wind waves Vietnam
image.alt.en: Wind blowing over a rice field
image.alt.vi: Gió thổi trên cánh đồng lúa
examples.1.en: you cannot see it
examples.1.vi: mắt em không nhìn thấy gió
examples.2.en: you can feel it on your face
examples.2.vi: em cảm thấy gió thổi trên mặt
examples.3.en: it pushes leaves and kites
examples.3.vi: gió đẩy lá cây và cánh diều
examples.4.en: strong wind bends trees
examples.4.vi: gió mạnh làm cây nghiêng ngả
> Ví dụ ba và bốn cho chiều nguyên nhân: gió đẩy cây, không phải cây làm ra gió (câu q6). Ví dụ bốn mở đường cho bài ba (bão).

#### group explore_cloudy
label.en: Cloudy
label.vi: Trời nhiều mây
color: nau_dat
sentence.en: Clouds are made of tiny drops of water.
sentence.vi: Mây gồm rất nhiều giọt nước nhỏ li ti.
image.brief: [ảnh] Bầu trời nhiều mây trên cánh đồng hoặc làng quê: mây trắng xen những đám mây xám đậm, dày, chưa mưa; chụp rộng, thấy một dải đồng, hàng cây hoặc mái nhà ở mép dưới; ưu tiên cảnh Việt Nam; không có người, không có chữ. Câu q2, câu q4 (lựa chọn q4_cloudy), câu w1 bài hai, câu w2 bài bốn và từ cloud dùng lại ảnh này. Từ khoá tìm ảnh (EN): cloudy sky grey white clouds countryside
image.alt.en: White and grey clouds over the fields
image.alt.vi: Mây trắng và mây xám trên cánh đồng
examples.1.en: white and fluffy, or dark grey
examples.1.vi: trắng bồng bềnh, hoặc xám đen
examples.2.en: dark clouds can bring rain
examples.2.vi: mây đen có thể mang mưa tới
examples.3.en: like the fog on cold glass
examples.3.vi: giống lớp mờ trên mặt kính lạnh
examples.4.en: the wind moves clouds along
examples.4.vi: gió đẩy mây trôi đi
> Ví dụ ba nối với câu w2 (kính lạnh bị mờ vì giọt nước li ti). [CẦN KIỂM] Mây và lớp mờ trên kính đều là những giọt nước rất nhỏ; cách so sánh này không nói mây hình thành ra sao.
> Ví dụ bốn: gió có cả ở trên cao, nơi không có cây (bằng chứng cho câu q6, bé tự nối).

### new_words
id: 0c4eacd8-29b6-401d-a265-038013bcd171
type: word_list
version: 1
title.en: New words
title.vi: Từ mới
term_keys: weather, wind, cloud

## Chơi

> Bé tìm ba dấu hiệu của thời tiết ngoài trời: một dấu hiệu của nắng, một của mưa, một của gió. Đạt khi đủ ba nhóm và không chọn món nào ở trong nhà. Chạm hình đã chọn để bỏ ra.
> Ba món bẫy đều ở trong nhà và mỗi món giống một nhóm: quạt bàn cũng thổi ra gió, vòi hoa sen cũng là nước rơi xuống, đèn bàn cũng sáng như nắng. Lời nhắn `has_limited` nói đúng lý do cho cả ba: thời tiết là ở ngoài trời (ý chính một).
> Theo hình designer 11/11: cả chín món là hình vẽ (không có ảnh hợp lệ cho đèn bàn đang sáng không logo và vài món khác, nên vẽ cả kệ cho cùng một loại hình). Quạt bàn dùng lại hình vẽ quạt của bài hai; cánh diều vẽ mới (diều hình chim, hai dải ruy băng hồng), câu q5 và câu w1 bài hai dùng lại.

### tray
id: be90c982-71a6-4cd6-8414-286599a8f503
type: build_tray
version: 1
prompt.en: Find a sign of each weather
prompt.vi: Tìm dấu hiệu của từng kiểu thời tiết
capacity: 3
success_when: all_required_and_no_limit
messages.start.en: Find one sign of sun, rain and wind.
messages.start.vi: Em tìm một dấu hiệu của nắng, một của mưa và một của gió nhé.
messages.full.en: No more room! Tap one to take it off.
messages.full.vi: Hết chỗ rồi! Em chạm vào để bỏ ra nhé.
messages.balanced.en: Great! You can read the weather outside.
messages.balanced.vi: Tuyệt! Em đã biết nhìn thời tiết ngoài trời.
messages.has_limited.en: That one is inside. Weather is outside.
messages.has_limited.vi: Thứ đó ở trong nhà. Thời tiết là ở ngoài trời.
messages.missing.tray_sunny.en: You still need a sign of sun.
messages.missing.tray_sunny.vi: Em còn thiếu một dấu hiệu của nắng.
messages.missing.tray_rainy.en: You still need a sign of rain.
messages.missing.tray_rainy.vi: Em còn thiếu một dấu hiệu của mưa.
messages.missing.tray_windy.en: You still need a sign of wind.
messages.missing.tray_windy.vi: Em còn thiếu một dấu hiệu của gió.

#### group tray_sunny
label.en: Sunny
label.vi: Trời nắng
color: vang_hoe
role: required

#### group tray_rainy
label.en: Rainy
label.vi: Trời mưa
color: cham
role: required

#### group tray_windy
label.en: Windy
label.vi: Trời có gió
color: gi_dong
role: required

#### group tray_inside
label.en: Not weather
label.vi: Không phải thời tiết
color: do_son
role: limit
> Nhãn `limit` dạng "Not …" · "Không …", gọi tên loại, không gọi tên món bẫy. Dòng điều kiện sẽ là "Cần đủ Trời nắng, Trời mưa, Trời có gió · Không phải thời tiết".

#### item tray_puddle
label.en: A puddle
label.vi: Vũng nước mưa
group: tray_rainy
image.brief: [hình vẽ] Một vũng nước mưa trên đường đất hoặc sân gạch, mặt nước phản chiếu bầu trời và hàng cây, vẽ gần mặt đất; trời đã tạnh; không có người, không có chân người, không có xe, không có chữ. Câu w1 bài hai và từ puddle dùng lại hình này. Từ khoá tìm ảnh (EN): rain puddle reflection ground
image.alt.en: A puddle after rain
image.alt.vi: Vũng nước sau mưa

#### item tray_fan
label.en: A desk fan
label.vi: Cái quạt bàn
group: tray_inside
image.brief: Dùng lại hình `tray_fan` ở bài `thoi-tiet-va-thien-tai/do-thoi-tiet`.
image.alt.en: A desk fan
image.alt.vi: Cái quạt bàn
> Món bẫy mạnh nhất: quạt cũng thổi ra không khí chuyển động. Gió của quạt không phải thời tiết vì ở trong nhà, do quạt làm ra.

#### item tray_shadow
label.en: A tree's shadow
label.vi: Bóng cây trên sân
group: tray_sunny
image.brief: [hình vẽ] Bóng một cái cây in đậm, rõ nét trên sân đất hoặc sân gạch lúc trời nắng, thấy cả gốc cây và nắng chiếu trên sân; vẽ chéo từ trên xuống; không có người, không có bóng người, không có chữ. Câu w1 bài hai và từ shadow dùng lại hình này. Từ khoá tìm ảnh (EN): tree shadow sunny ground
image.alt.en: A tree's shadow on the ground
image.alt.vi: Bóng cây in trên mặt đất

#### item tray_kite
label.en: A kite up high
label.vi: Cánh diều bay cao
group: tray_windy
image.brief: [hình vẽ] Diều hình chim màu vàng có hai dải ruy băng hồng, bay cao giữa trời xanh có mây; không thấy người thả, không có chữ, không có hình in. Câu q5 và câu w1 bài hai dùng lại hình này.
image.alt.en: A bird-shaped kite in the sky
image.alt.vi: Cánh diều hình con chim trên trời

#### item tray_shower
label.en: A shower
label.vi: Vòi hoa sen
group: tray_inside
image.brief: [hình vẽ] Một vòi hoa sen trong phòng tắm đang phun nước thành nhiều tia, vẽ gần, tường gạch men trơn phía sau; không có người, không có nhãn hiệu, không có chữ. Từ khoá tìm ảnh (EN): shower head running water bathroom
image.alt.en: Water from a shower
image.alt.vi: Nước chảy từ vòi hoa sen

#### item tray_wet_leaf
label.en: A wet leaf
label.vi: Chiếc lá ướt mưa
group: tray_rainy
image.brief: [hình vẽ] Những giọt nước mưa đọng trên một chiếc lá xanh to (lá chuối, lá sen hay lá khoai môn), vẽ cận, nền mờ; không có người, không có chữ. Từ khoá tìm ảnh (EN): raindrops on green leaf
image.alt.en: Raindrops on a green leaf
image.alt.vi: Giọt mưa trên chiếc lá xanh

#### item tray_lamp
label.en: A desk lamp
label.vi: Cái đèn bàn
group: tray_inside
image.brief: [hình vẽ] Một chiếc đèn bàn đang bật sáng trên bàn học trong phòng, vẽ chéo; không có người, không có logo, không có chữ, không có sách có chữ. Từ khoá tìm ảnh (EN): desk lamp switched on table
image.alt.en: A desk lamp that is on
image.alt.vi: Chiếc đèn bàn đang sáng

#### item tray_rice
label.en: Rice drying in the sun
label.vi: Thóc phơi trên sân
group: tray_sunny
image.brief: [hình vẽ] Thóc vàng rải đều trên sân gạch hoặc sân xi măng ở làng quê dưới nắng, thấy bóng cây hoặc bóng tường in rõ ở góc sân; không có người, không có chữ. Câu q3 dùng lại hình này. Từ khoá tìm ảnh (EN): rice grain drying sun yard Vietnam
image.alt.en: Rice drying in a sunny yard
image.alt.vi: Thóc phơi trên sân nắng
> Người ta chỉ phơi thóc hôm trời nắng, nên thóc phơi là dấu hiệu của nắng. Nối với câu q3 (mây đen kéo tới thì phải cất thóc) và gợi ý câu q4.

#### item tray_bending
label.en: A bending tree
label.vi: Cây nghiêng theo gió
group: tray_windy
image.brief: [hình vẽ] Hàng dừa nghiêng về một phía vì gió, lá bay cùng một hướng, trời sáng; gió vừa, không phải bão: không có cây gãy, không có mưa to, không có mái nhà bị tốc; không có người, không có chữ. Câu q6, câu w3 bài ba dùng lại hình này. Từ khoá tìm ảnh (EN): palm trees bending wind
image.alt.en: Trees leaning in the wind
image.alt.vi: Hàng cây nghiêng trong gió

## Quiz

> Sáu câu, dễ tới khó. DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3 (Discoverer 2·3·1). Bốn format: `single_choice` (q1, q4), `fill_blank_bank` (q2), `multi_choice` (q3), `true_false` (q5, q6). Mọi câu có hình ở câu hỏi; mọi lựa chọn, mọi thẻ từ có hình.
> Vai của hình (`_topic.md`, Quy ước hình mục bảy): ba ảnh ô Học (nắng, mưa, nhiều mây) chỉ là lựa chọn ở câu q4 (nắng đúng; mưa, nhiều mây sai). Hình vẽ thóc phơi đúng ở cả phần Chơi và câu q3. Không hình nào vừa đúng vừa sai; không hai câu nào dùng chung một hình lựa chọn.

### q1
id: af5534b9-2468-42e8-a65b-276d3a94f285
format: single_choice
version: 1
dok: 1
prompt.en: Which one tells you it is windy?
prompt.vi: Hình nào cho em biết trời đang có gió?
image.brief: Dùng lại hình `w1_sky` ở bài `be-mat-trai-dat/cac-chau-luc-va-dai-duong`. Từ khoá tìm ảnh (EN): sky blue clear clouds
image.alt.en: A blue sky
image.alt.vi: Bầu trời xanh
hint.en: Wind pushes things. Look for something being pushed.
hint.vi: Gió đẩy mọi vật. Em tìm thứ đang bị gió đẩy nhé.
explanation_correct.en: Yes! The wind is pushing the shirt.
explanation_correct.vi: Đúng rồi! Gió đang đẩy chiếc áo bay phấp phới.
explanation_wrong.en: The answer is the flapping shirt. Wind moves it.
explanation_wrong.vi: Đáp án là chiếc áo bay phấp phới. Gió làm áo bay.
> Câu nhớ lại ý chính hai bằng một cảnh mới (không có ở Học hay Chơi). Hai lựa chọn sai là hai cảnh lặng gió: đường ướt (dấu hiệu của mưa) và mặt ao phẳng lặng. Ba hình vẽ đều mới, nên không hình nào quen hơn hình nào.

#### option q1_shirt
correct: true
label.en: flapping shirt
label.vi: chiếc áo bay phấp phới
image.brief: [hình vẽ] Một chiếc áo phơi trên dây ngoài sân bay phấp phới về một phía vì gió, trời sáng, vẽ ngang; áo trơn, không có chữ, không có logo, không có hình in; không có người. Từ khoá tìm ảnh (EN): shirt clothesline blowing wind
image.alt.en: A shirt flapping on a line
image.alt.vi: Chiếc áo bay phấp phới trên dây phơi

#### option q1_road
correct: false
label.en: wet road
label.vi: mặt đường ướt nước mưa
> Rà chữ tester 11/11 (n2): hai nhãn VI sai kéo dài cho bằng nhãn đúng "chiếc áo bay phấp phới" (cả ba năm tiếng). Nhãn EN giữ.
image.brief: [hình vẽ] Một đoạn đường làng hoặc đường nhựa ướt sau mưa, mặt đường loang loáng nước, trời xám nhạt; cây hai bên đứng yên; không có người, không có xe, không có biển chữ. Từ khoá tìm ảnh (EN): wet road after rain trees
image.alt.en: A wet road
image.alt.vi: Mặt đường ướt

#### option q1_pond
correct: false
label.en: still pond
label.vi: mặt ao phẳng như gương
image.brief: [hình vẽ] Mặt ao phẳng lặng như gương, phản chiếu rõ hàng cây và bầu trời, không một gợn sóng; không có người, không có chữ. Từ khoá tìm ảnh (EN): still pond mirror reflection trees
image.alt.en: A still pond
image.alt.vi: Mặt ao phẳng lặng

### q2
id: ec3d16b0-7dd3-4bb3-805e-81652b17bd54
format: fill_blank_bank
version: 1
dok: 1
prompt.en: Pick the missing word
prompt.vi: Chọn từ còn thiếu
image.brief: Dùng lại hình `explore_cloudy`. Từ khoá tìm ảnh (EN): cloudy sky grey white clouds countryside
image.alt.en: White and grey clouds over the fields
image.alt.vi: Mây trắng và mây xám trên cánh đồng
sentence.en: A cloud is made of {1}.
sentence.vi: Đám mây được tạo nên từ {1}.
answers: q2_water
hint.en: Remember the Cloudy card.
hint.vi: Em nhớ lại ô Trời nhiều mây nhé.
explanation_correct.en: Yes! A cloud is lots of tiny water drops.
explanation_correct.vi: Đúng rồi! Đám mây gồm rất nhiều giọt nước li ti.
explanation_wrong.en: The answer is water. Clouds are tiny water drops.
explanation_wrong.vi: Đáp án là nước. Mây là những giọt nước li ti.
> Câu nhớ lại ý chính ba. Hai thẻ sai là hai ý của `clouds_are_smoke` (khói, bông), không gắn key. Thẻ đúng ở chỗ thứ ba.
> Câu dùng "made of {1}" để ba thẻ đều là danh từ không đếm được, cùng một từ, không thẻ nào nổi bật.

#### bank q2_smoke
label.en: smoke
label.vi: khói
image.brief: [hình vẽ] Một làn khói xám mỏng bốc lên từ mái bếp một ngôi nhà ở làng quê lúc chiều, nhìn từ xa; không thấy lửa, không có người, không có chữ. Từ khoá tìm ảnh (EN): kitchen smoke rising village roof
image.alt.en: Smoke rising from a roof
image.alt.vi: Khói bốc lên từ mái bếp

#### bank q2_cotton
label.en: cotton
label.vi: bông
image.brief: [hình vẽ] Mấy cục bông gòn trắng trên mặt gỗ trơn, vẽ gần; không có bao bì, không có nhãn hiệu, không có chữ. Từ khoá tìm ảnh (EN): cotton balls white wooden table
image.alt.en: White cotton balls
image.alt.vi: Mấy cục bông trắng

#### bank q2_water
label.en: water
label.vi: nước
image.brief: [hình vẽ] Rất nhiều giọt nước nhỏ đọng trên mặt kính cửa sổ, vẽ cận, phía sau mờ; không có chữ, không có người, không có phản chiếu người. Từ khoá tìm ảnh (EN): water droplets on glass close up
image.alt.en: Tiny drops of water
image.alt.vi: Những giọt nước li ti
> Hình giọt nước trên kính, không dùng hình lá ướt của phần Chơi, để thẻ đúng không là hình bé đã thấy. Theo hình designer 11/11, ba thẻ là hình vẽ.

### q3
id: ba012d11-351f-436d-ae1f-a3990f17da2c
format: multi_choice
version: 1
dok: 2
prompt.en: Dark clouds are coming! What should Mai bring in?
prompt.vi: Mây đen kéo tới! Mai nên mang những thứ nào vào nhà?
instruction.en: Pick all the right answers.
instruction.vi: Chọn tất cả đáp án đúng
image.brief: Dùng lại hình `tray_dark` ở bài `thoi-tiet-va-thien-tai/mua-mua-bao`.
image.alt.en: Dark clouds over the rice fields
image.alt.vi: Mây đen kéo tới trên cánh đồng lúa
> Theo hình designer 11/11: không có ảnh hợp lệ mây đen trên làng, nên dùng lại hình vẽ mây đen trên cánh đồng của bài ba; `alt` chép gốc.
hint.en: What will rain make wet? Think what must stay dry.
hint.vi: Mưa sẽ làm ướt thứ gì? Em nghĩ xem thứ gì phải giữ khô nhé.
> Rà chữ tester 11/11 (n12): vế hai cũ "What needs water?" · "Thứ gì lại cần nước?" chỉ thẳng hai lựa chọn sai. Nay chỉ dẫn cách nghĩ, không chia sẵn hai nhóm.
explanation_correct.en: Yes! Bring in the rice and the chillies.
explanation_correct.vi: Đúng rồi! Mai cất thóc và ớt đang phơi vào nhà.
explanation_wrong.en: The answers are the rice and the chillies.
explanation_wrong.vi: Đáp án là thóc và ớt đang phơi.
> DOK 2: vận dụng ví dụ "mây đen có thể mang mưa tới" vào việc nhà rất quen ở Việt Nam ("trời sắp mưa, cất thóc, cất đồ phơi"). Hai lựa chọn sai có sức hút: chum để ngoài sân để hứng nước mưa, cây trong chậu được tưới nhờ mưa; bé phải nghĩ "mưa có hại hay có ích cho thứ này".
> Đáp án ở chỗ thứ nhất và thứ ba. Thóc phơi là hình của phần Chơi (ở đó cũng là món đúng); ba hình kia mới. Theo hình designer 11/11, cả bốn lựa chọn là hình vẽ.

#### option q3_rice
correct: true
label.en: rice in the yard
label.vi: thóc phơi ngoài sân
image.brief: Dùng lại hình `tray_rice`. Từ khoá tìm ảnh (EN): rice grain drying sun yard Vietnam
image.alt.en: Rice drying in a sunny yard
image.alt.vi: Thóc phơi trên sân nắng

#### option q3_jar
correct: false
label.en: jar for rainwater
label.vi: chum hứng nước mưa
image.brief: [hình vẽ] Một cái chum sành to đặt ngoài sân, miệng để mở, cạnh tường nhà hoặc gốc cây; không có người, không có chữ. Từ khoá tìm ảnh (EN): large clay water jar yard Vietnam
image.alt.en: A big clay jar in a yard
image.alt.vi: Cái chum sành to ngoài sân

#### option q3_chillies
correct: true
label.en: chillies on a tray
label.vi: ớt phơi trên nia
image.brief: [hình vẽ] Ớt đỏ phơi trên nia tre hoặc trên tấm bạt ngoài sân dưới nắng, vẽ chéo từ trên xuống; không có người, không có tay, không có chữ. Từ khoá tìm ảnh (EN): red chillies drying bamboo tray sun
image.alt.en: Red chillies drying on a tray
image.alt.vi: Ớt đỏ phơi trên nia

#### option q3_plants
correct: false
label.en: plants in pots
label.vi: cây trồng trong chậu
image.brief: [hình vẽ] Mấy chậu cây xanh đặt ngoài sân, vẽ ngang; chậu trơn, không có nhãn, không có chữ, không có người. Từ khoá tìm ảnh (EN): potted plants outdoor yard
image.alt.en: Plants in pots
image.alt.vi: Mấy chậu cây
> Bốn hình cùng kiểu: một thứ đặt ngoài sân, cỡ cảnh vừa, trời sáng, cùng là hình vẽ (theo hình designer 11/11; thóc phơi dùng lại hình vẽ của phần Chơi).

### q4
id: 0e99627c-8485-4b97-bea5-5e53b440ec26
format: single_choice
version: 1
dok: 2
prompt.en: Mai's shirt is wet. Which day will dry it fastest?
prompt.vi: Áo của Mai bị ướt. Hôm nào phơi áo sẽ mau khô nhất?
image.brief: [hình vẽ] Một chiếc áo trắng trơn ướt treo trên móc, vài giọt nước nhỏ xuống, vẽ gần, nền tường trơn; không có chữ, không có logo trường, không có người. Từ khoá tìm ảnh (EN): wet white shirt hanger dripping
image.alt.en: A wet shirt on a hanger
image.alt.vi: Chiếc áo ướt treo trên móc
hint.en: Think of drying rice in the yard.
hint.vi: Em nghĩ xem người ta phơi thóc vào hôm nào nhé.
explanation_correct.en: Yes! The warm sun dries wet clothes fast.
explanation_correct.vi: Đúng rồi! Nắng ấm làm quần áo ướt mau khô.
explanation_wrong.en: The answer is the sunny day. The sun dries things.
explanation_wrong.vi: Đáp án là hôm trời nắng. Nắng làm đồ ướt mau khô.
> DOK 2: vận dụng ô "Trời nắng" (ví dụ "đồ ướt mau khô") vào việc phơi áo. Gợi ý nối với món thóc phơi ở phần Chơi, không gọi tên lựa chọn. Ba lựa chọn là ba ảnh ô Học (cùng loại ảnh chụp; đáp án không phải ảnh duy nhất bé đã thấy). Đáp án ở chỗ thứ nhất.
> [CẦN KIỂM] Hôm nắng có gió phơi mau khô nhất; câu chỉ so nắng, mưa, nhiều mây.

#### option q4_sunny
correct: true
label.en: a sunny day
label.vi: hôm trời nắng
image.brief: Dùng lại hình `q3_sun` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): sun bright blue sky
image.alt.en: The bright sun in the sky
image.alt.vi: Mặt Trời chói sáng trên trời

#### option q4_rainy
correct: false
label.en: a rainy day
label.vi: hôm trời mưa
image.brief: Dùng lại hình `q1_rain` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): heavy rain house garden
image.alt.en: Heavy rain falling
image.alt.vi: Mưa to đang rơi

#### option q4_cloudy
correct: false
label.en: a cloudy day
label.vi: hôm trời nhiều mây
image.brief: Dùng lại hình `explore_cloudy`. Từ khoá tìm ảnh (EN): cloudy sky grey white clouds countryside
image.alt.en: White and grey clouds over the fields
image.alt.vi: Mây trắng và mây xám trên cánh đồng

### q5
id: 4d39b170-ff1d-44dc-9341-c28c8021dc49
format: true_false
version: 1
dok: 2
prompt.en: A kite needs wind to fly high.
prompt.vi: Cánh diều cần có gió mới bay cao được.
image.brief: Dùng lại hình `tray_kite`.
image.alt.en: A bird-shaped kite in the sky
image.alt.vi: Cánh diều hình con chim trên trời
answer: true
hint.en: Think of a day with no wind at all.
hint.vi: Em nghĩ tới một hôm lặng gió nhé.
explanation_correct.en: Yes! Moving air pushes the kite up.
explanation_correct.vi: Đúng rồi! Không khí chuyển động đẩy cánh diều lên cao.
explanation_wrong.en: This is true. Wind pushes the kite up high.
explanation_wrong.vi: Câu này đúng. Gió đẩy cánh diều bay lên cao.
> DOK 2: vận dụng ý chính hai và ví dụ "gió đẩy lá cây và cánh diều" sang câu hỏi "cần gì thì diều mới bay". Câu khẳng định, đáp án Đúng. Hình câu hỏi là cánh diều đang bay (vật được hỏi), không nói gì về gió.
> [CẦN KIỂM] Khi lặng gió, người chạy kéo diều cũng tạo ra luồng không khí, nhưng muốn diều bay cao và lâu thì cần có gió.

### q6
id: 4a9a51f3-46c5-4131-b41a-edbb51d192f3
format: true_false
version: 1
dok: 3
misconception: trees_make_wind
prompt.en: Is Na right?
prompt.vi: Na nói đúng không?
image.brief: Dùng lại hình `tray_bending`. Từ khoá tìm ảnh (EN): palm trees bending wind
image.alt.en: Trees leaning in the wind
image.alt.vi: Hàng cây nghiêng trong gió
instruction.en: Challenge: check Na's idea
instruction.vi: Thử thách: kiểm tra ý của Na
statement.en: The trees are waving. They are making the wind.
statement.vi: Hàng cây đang vẫy cành. Chính cây tạo ra gió đấy.
speaker: na
labels.true.en: Yes
labels.true.vi: Na đúng
labels.false.en: No
labels.false.vi: Na chưa đúng
answer: false
hint.en: Remember the Windy card. What pushes what?
hint.vi: Em nhớ lại ô Trời có gió. Cái gì đẩy cái gì?
explanation_correct.en: Wind is moving air. It blows at sea, too.
explanation_correct.vi: Gió là không khí đang chuyển động. Ngoài biển không có cây vẫn có gió.
explanation_wrong.en: Na is not right. The wind moves the trees.
explanation_wrong.vi: Na chưa đúng. Gió làm cây lay động.
> Rà chữ tester 11/11 (n6): bỏ vế "không phải cây làm ra gió" chỉ có ở bản VI, cho khớp EN.
> Lời Na, hình và đáp án Sai đúng như `_topic.md` (mục "Câu sáu, lời Na" và bảng Đáp án Đúng/Sai).
> DOK 3: bé đánh giá một lời giải thích nhân quả bị đảo chiều. Na thấy hai việc xảy ra cùng lúc (cây lay, gió thổi) rồi đoán sai cái nào gây ra cái nào. Bé phải dùng ô "Trời có gió" (gió là không khí chuyển động, gió đẩy lá cây và cánh diều) và ô "Trời nhiều mây" (gió đẩy mây trôi, ở trên cao không có cây). Ô Học không có câu "cây không làm ra gió".
> Giải thích khi đúng không mở đầu bằng "Yes!", vì bé vừa chọn "Na chưa đúng".

## Từ vựng

### weather
id: 9ee794f3-d8aa-452e-a91d-db899dd7649c
tier: core
term.en: weather
term.vi: thời tiết
example.en: The weather today is sunny and hot.
example.vi: Thời tiết hôm nay nắng và nóng.
image.brief: Dùng lại hình `q3_sun` ở bài `be-mat-trai-dat/nui-lua`. Từ khoá tìm ảnh (EN): sun bright blue sky
image.alt.en: The bright sun in the sky
image.alt.vi: Mặt Trời chói sáng trên trời

### wind
id: a05a8dc4-7f00-4355-baea-f4db08dac2a8
tier: core
term.en: wind
term.vi: gió
example.en: The wind moves the leaves on the trees.
example.vi: Gió làm lá cây lay động.
image.brief: Dùng lại hình `w1` ở bài `ho-hap/vi-sao-ta-phai-tho`. Từ khoá tìm ảnh (EN): rice field wind waves Vietnam
image.alt.en: Wind blowing over a rice field
image.alt.vi: Gió thổi trên cánh đồng lúa

### cloud
id: 9931505b-29c9-4843-aaf2-e2471e45305b
tier: core
term.en: cloud
term.vi: mây, đám mây
example.en: Dark clouds can bring rain.
example.vi: Mây đen có thể mang mưa tới.
image.brief: Dùng lại hình `explore_cloudy`. Từ khoá tìm ảnh (EN): cloudy sky grey white clouds countryside
image.alt.en: White and grey clouds over the fields
image.alt.vi: Mây trắng và mây xám trên cánh đồng
> `term.vi` có dấu phẩy: nhờ nghe thử giọng VI đọc "mây, đám mây".

### puddle
id: a5b6d4e4-0bb1-435d-b19b-a30194222fd7
tier: extra
term.en: puddle
term.vi: vũng nước
example.en: After the rain, there are puddles on the road.
example.vi: Sau cơn mưa, trên đường có những vũng nước.
image.brief: Dùng lại hình `tray_puddle`. Từ khoá tìm ảnh (EN): rain puddle reflection ground
image.alt.en: A puddle after rain
image.alt.vi: Vũng nước sau mưa

### shadow
id: 7c54e856-bf5f-4541-abb7-f2af39a131cb
tier: extra
term.en: shadow
term.vi: bóng, bóng cây
example.en: On sunny days, trees make dark shadows.
example.vi: Ngày nắng, cây in bóng đậm trên mặt đất.
image.brief: Dùng lại hình `tray_shadow`. Từ khoá tìm ảnh (EN): tree shadow sunny ground
image.alt.en: A tree's shadow on the ground
image.alt.vi: Bóng cây in trên mặt đất
> `term.vi` có dấu phẩy: nhờ nghe thử giọng VI. Vì sao bóng đậm khi nắng để dành *Ánh sáng và bóng tối* (Discoverer số mười một).

## Thưởng

### big_cloud
id: 24e1919d-a121-4798-ab1c-edf0217ed9cc
set: weather
rarity: common
name.en: Big white cloud
name.vi: Đám mây trắng khổng lồ
tag.en: Clouds
tag.vi: Mây
fact.en: A big cloud can weigh as much as 100 elephants. Its drops are tiny and spread far apart.
fact.vi: Một đám mây lớn có thể nặng bằng một trăm con voi. Các giọt nước rất nhỏ và nằm rải rác rất xa nhau.
> [CẦN KIỂM] Biên tập nhớ Cục Địa chất Hoa Kỳ (USGS) ước một đám mây tích cỡ một ki-lô-mét khối chứa khoảng năm trăm tấn nước, bằng khoảng một trăm con voi. Chuyên môn xác nhận con số và cách nói "giọt nước nằm rải rác rất xa nhau".
> Nghe thử giọng EN đọc "100".
image.brief: Dùng lại hình `q2_cloud` ở bài `be-mat-trai-dat/dat-va-nuoc-tren-trai-dat`. Từ khoá tìm ảnh (EN): cloud white blue sky
image.alt.en: A white cloud in the sky
image.alt.vi: Đám mây trắng trên trời

## Ghi chú cho hoạ sĩ

- **Loại hình (theo hình designer làm 11/11):** kệ Chơi chín món, các lựa chọn câu q1, q2, q3 và hình câu q4 là hình tự vẽ, vì Commons và Openverse không có ảnh hợp giấy phép, không người, không nhãn hiệu cho đèn bàn đang sáng, áo bay trên dây phơi, khói mái bếp, bông gòn, chum ngoài sân, chậu cây, áo ướt trên móc; các ảnh lẻ tìm được bị bỏ để kệ và câu cùng một loại hình. Ảnh chụp còn ở ô Học (nắng, mưa, gió của chủ đề khác; ô mây là ảnh mới), câu q4 (ba ảnh ô Học), hình câu w1, q1 và thẻ thưởng. Câu w1, w2 là hình vẽ (khăn len vẽ mới; mũ vải, áo mưa, bốn hình cửa kính của *Hô hấp*). Hình không có chữ.
- **Ảnh nguồn mới (một):** bầu trời nhiều mây trắng và xám (`explore_cloudy`, CC BY 2.0, Flickr).
- **Hình tự vẽ (mười chín):** khăn len (w1); vũng nước, bóng cây, cánh diều hình chim, vòi hoa sen, lá đọng mưa, đèn bàn, thóc phơi, hàng dừa nghiêng (kệ Chơi, tám món); áo bay trên dây phơi, đường ướt, mặt ao lặng (q1); khói mái bếp, bông gòn, giọt nước trên kính (q2); chum sành, ớt phơi, chậu cây (q3); áo ướt trên móc (hình câu q4).
- **Dùng lại:** từ *Bề mặt Trái Đất* `nui-lua/q3_sun` (ô nắng, q4, từ `weather`), `nui-lua/q1_rain` (w1, ô mưa, q4), `cac-chau-luc-va-dai-duong/w1_sky` (q1), `dat-va-nuoc-tren-trai-dat/q2_cloud` (thẻ thưởng); từ *Hô hấp* `vi-sao-ta-phai-tho/w1` (ô gió, từ `wind`), `q5` và ba ô kính (w2), `giu-phoi-khoe/q1_hat`, `q1_raincoat` (w1); từ bài hai `tray_fan` (kệ Chơi); từ bài ba `tray_dark` (hình câu q3). Trong bài: `explore_cloudy` (q2, q4, từ `cloud`), `tray_kite` (q5), `tray_rice` (q3), `tray_bending` (q6), `tray_puddle`, `tray_shadow` (từ vựng).
- **Bài khác dùng lại hình của bài này:** bài hai câu w1 (`explore_cloudy`, `tray_puddle`, `tray_shadow`, `tray_kite`), bài ba câu w3 (`tray_bending`), bài bốn câu w2 (`explore_cloudy`).
- **Các lựa chọn trong một câu cùng khung, cùng kiểu:**
  - w1: ba thứ mặc trên cùng một kiểu bàn gỗ, vẽ chéo từ trên xuống.
  - w2: ba ô kính cùng khung cửa gỗ (của *Hô hấp*).
  - q1: ba cảnh ngoài trời vẽ ngang, cỡ cảnh vừa; chỉ một cảnh có thứ đang bị gió đẩy.
  - q2: ba thẻ vẽ gần một chất (khói, bông, giọt nước).
  - q3: bốn thứ đặt ngoài sân vẽ cùng cỡ cảnh.
  - q4: ba ảnh bầu trời của ô Học.
- **Kệ Chơi:** chín hình vẽ cùng cỡ cảnh vừa. Ba món bẫy vẽ rõ là trong nhà (tường gạch men, bàn học, nền trơn), sáu món đúng vẽ rõ là ngoài trời.
- **Màu:** Học: nắng `vang_hoe`, mưa `cham`, gió `gi_dong`, mây `nau_dat`. Chơi: nắng `vang_hoe`, mưa `cham`, gió `gi_dong`, nhóm "Không phải thời tiết" `do_son`.

## Ghi chú cho dev

- **Block và format:**
  - Học: `explore_groups` (`explore`, bốn nhóm), `word_list` (`new_words`, ba từ core: weather, wind, cloud).
  - Chơi: `build_tray` (`tray`): ba chỗ, ba nhóm `required`, một nhóm `limit`, chín món.
  - Khởi động: `single_choice` (w1 `prior_knowledge`, w2 `recall_from.lesson: ho-hap/vi-sao-ta-phai-tho`, đã có id). DOK một.
  - Quiz: `single_choice` (q1, q4), `fill_blank_bank` (q2, ba thẻ có hình), `multi_choice` (q3, bốn lựa chọn, hai đúng), `true_false` (q5 Đúng; q6 Sai, `speaker: na`).
  - DOK từ q1 tới q6: 1, 1, 2, 2, 2, 3.
  - Câu có `misconception`: q6, key `trees_make_wind`.
- **Tham chiếu:** chạy `ids` cho `_topic.md` rồi bài này, trước bài hai, ba, bốn (Khởi động của ba bài đó trỏ về đây).
- **Vị trí đáp án đúng:** w1 thứ hai; w2 thứ ba; q1 thứ nhất; q2 thẻ thứ ba; q3 thứ nhất và thứ ba; q4 thứ nhất.
- **Màn Chơi, ví dụ để kiểm:**
  - mở màn → `start`;
  - Vũng nước mưa, Bóng cây trên sân, Cánh diều bay cao → `balanced`;
  - Cái quạt bàn → `has_limited`;
  - Vũng nước mưa, Chiếc lá ướt mưa, Thóc phơi trên sân (thiếu gió) → `missing.tray_windy`;
  - rồi chạm Cây nghiêng theo gió → `full`; bỏ Chiếc lá ướt mưa, đặt Cây nghiêng theo gió → `balanced`.
- **Nhãn dài:** "Rice drying in the sun" (món Chơi), "chiếc áo bay phấp phới", "Không phải thời tiết" (chip nhóm). Nhờ tester xem trên iPhone bề rộng nhỏ nhất.
- **Câu "Em nghĩ sao?"** (đề xuất schema v1.1 `think_first`): đầu bài hỏi "It is sunny here. Can the river flood?" · "Ở đây trời nắng. Sông có thể dâng lũ không?", hai lựa chọn "Yes" · "Có", "No" · "Không", không chấm điểm. Bài bốn dạy (câu q6), bài năm hỏi lại ở w2 dạng Đúng/Sai. Khi có `think_first`, app hiện được câu trả lời ở đầu chủ đề cạnh câu trả lời ở bài năm.
- **Số từ EN trên một màn:** Học khoảng ba mươi mốt (mục tiêu 9, hướng dẫn 3, bốn nhãn 4, câu dài nhất 10, ô Từ mới 5), như các chủ đề trước. Nhiều chữ nhất ở Quiz là q3 (khoảng hai mươi tám: câu hỏi 9, hướng dẫn 5, bốn nhãn 12, giải thích 7 đến 8) và q6 (khoảng hai mươi lăm).
- **Từ EN có thể ngoài Starters/Movers:** từ mới weather, wind, cloud, puddle, shadow; foggy, dusty, scarf, flapping, chillies, jar, rainwater, kite (có trong Movers), branches, drops, tiny, elephants.
- **Giọng đọc:** "100" ở thẻ thưởng (EN); `term.vi` có dấu phẩy ở `cloud`, `shadow`. Chuỗi VI không có chữ số, ký hiệu, dấu "—".
- **Asset:** không có audio, `asset` trong markdown.
